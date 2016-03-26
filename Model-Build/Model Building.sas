/* Model Building Roll Rates */

 

/* Input Variables for time period and model type */

%Global Beg_d End_d date ;

;

%Let ModelType = Reg ;               /* Model proc (procedure) used below: Reg GLM Autoreg */

%Let Dep = First3 ;             /* Dependend Variable for the Model */

%Let Dep_Fx = First ;                /* The variable used for the Forecast RMSE (original data series) */

%Let Dep_name = F3 ;            /* Describe dependent variable: F F3 S S3. Used to name datasets and CSV file */

%Let OutFile = K:\RetailLending\MN\RLRptg\RL Economics\Model Builds\2014\60 to 90 ;

;

%put &Beg_d &End_d &date &ModelType &Dep &Dep_Fx &Dep_name ;

; /* Copy this output from the log file to create the new folder for the output */

%put Output Folder -- Output_&Dep._&Beg_d._&End_d._rundate_&Date. ;

;

%put Output File Path -- &OutFile.\Output_&Dep._&Beg_d._&End_d._rundate_&Date. ;

;

%put %sysfunc(today(),weekdate.) %sysfunc(time(),timeampm8.) ;

;

 

/* Create Log file on the network for efficiency and validation */

proc printto log="&OutFile\Output_&Dep._&Beg_d._&End_d._rundate_&Date.\log_&ModelType._&Dep_name._&Beg_d._&End_d._rundate_&Date..txt"

new; /* replaces previous version, otherwise it will append */

run;

 

/* Create Output folder for the files created during execution */

Libname OutFile "&OutFile\Output_&Dep._&Beg_d._&End_d._rundate_&Date" ;

 

/* System Options */

options mcompilenote = all mlogic symbolgen  ;

ods graphics off ;

;

 

proc sql; create table of_variables as

     select name , count(name) as flag ,

                case when name like '%hpi%' then 1 else 0 end as hpicount ,

                case when name like '%unemp%' then 1 else 0 end as unempcount 

     from sashelp.vcolumn

     where libname = 'WORK' and memname = 'MODELDATA'

     group by name

     order by name

; quit ;

data of_variables2 ; set of_variables ; by name ;

 if hpicount = 1 then do ;

hpisum + 1 ;

retain hpisum ;

call symput('MaxVar1',put(max(hpisum),2.)) ;

end ;

if unempcount = 1 then do ;

unempsum +1 ;

 retain unempsum ;

call symput('MaxVar2',put(max(unempsum),2.)) ;

end;

 

if hpicount = 0 then hpisum = 0 ;

if unempcount = 0 then unempsum = 0 ;

 

run ; %put &MaxVar1 &MaxVar2 ; quit ;

;

data modelruns ;

input _MODEL_ $32.

_DEPVAR_ $9.

No_obs

K

_SSE_

_EDF_

_MSE_

_RMSE_

_RSQ_

DW

dw_pvalue_pos

dw_pvalue_neg

Intercept

HPI

Unemp

HPI_Tstat

HPI_Pvalue

HPI_VIF

Unemp_Tstat

Unemp_Pvalue

Unemp_VIF

Theils_U

EV

Mean_error

MSE

RMSE

MSPE

RMSPE

MAE

MAPE

Forecast_Length

_AIC_

_SBC_

Var1_t_flag

Var2_t_flag

Var1_VIF_flag

Var2_VIF_flag

Model_Score

Model_Fail

/*_P_ : Number of Parameters in the model */

;

datalines ;

;

run ;

;

/* Testing variables for the Macro * /

%let MaxVar1 = 3 ;

%let MaxVar2 = 3 ;

%let i = 1 ; * 2 same sign, 1 opposite signs ;

%let j = 3 ; 

*/

;

%macro modelrun (Dep= ) ;

%put %sysfunc(today(),weekdate.) %sysfunc(time(),timeampm8.) ;

 

%do i = 1 %to &MaxVar1 ;

     %do j = 1 %to &MaxVar2 ;

     %if &i. ~= &j. %then %do ;

     %put &i &j ;

     data null ; set of_variables2 ;

           if hpisum = &i. then call symput('Var1',trim(name)) ;

           if unempsum = &j. then call symput('Var2',trim(name)) ;

     run ;

     %put &Var1 &Var2 ;


     proc reg data = modeldata outest = &Dep._&Var1._&Var2. ;

           model &Dep. = &Var1. &Var2. / dw dwprob vif sse mse aic sbc ;

           output out = s_&Dep_name._&Var1._&Var2. predicted = p residual = r ;

              ods output DWStatistic = DW

                             ParameterEstimates = VIF      ;

                           /* FitStatistics = FIT ; */

                *where Date between "&Beg_D."d and "&End_d."d ;

     run;

     data OutFile.s_&Dep_name._&Var1._&Var2. ; set s_&Dep_name._&Var1._&Var2. ;

           keep date &Dep_fx. &Var1. &Var2. p r;

     run ;

 

           proc sql; create table regstats as

                select DW1.model , DW1.DW , DW1.dw_pvalue_pos , DW1.dw_pvalue_neg , DW1.No_obs ,

                        VIFHPI.HPI_Tstat , VIFHPI.HPI_Pvalue , VIFHPI.HPI_VIF ,

                        VIFunemp.Unemp_Tstat , VIFunemp.Unemp_Pvalue , VIFunemp.Unemp_VIF  

                from

                     (

                     select a.model ,

                                case when a.Label1 = 'Durbin-Watson D' then a.nValue1 else . end as DW ,

                                case when b.Label1 = 'Pr < DW' then b.nValue1 else . end as dw_pvalue_pos ,

                                case when c.Label1 = 'Pr > DW' then c.nValue1 else . end as dw_pvalue_neg ,

                                case when d.Label1 = 'Number of Observations' then d.nValue1 else . end as No_obs

                     from DW as a

                     left join DW as b

                     on a.model = b.model

                     left join DW as c

                     on a.model = c.model

                     left join DW as d

                     on a.model = d.model

                     having DW ~= . and dw_pvalue_pos ~= . and dw_pvalue_neg ~= . and No_obs ~=.

                     ) as DW1 

                Left join

                     (

                     select model , tValue as HPI_Tstat , Probt as HPI_Pvalue , VarianceInflation as HPI_VIF  

                     from VIF

                     WHERE Variable = "&Var1"

                     ) as VIFHPI

                on DW1.model = VIFHPI.model

 

                Left join

                     (

                     select model , tValue as Unemp_Tstat , Probt as Unemp_Pvalue , VarianceInflation as Unemp_VIF 

                     from VIF

                     WHERE Variable = "&Var2"

                     ) as VIFunemp

                on DW1.model = VIFunemp.model

 

/*              Left join */

/*                   (*/

/*                   select model , nValue2 as _RSQ_  */

/*                   from FIT*/

/*                   where Label2 = 'R-Square' */

/*                   ) as FIT1

                on DW1.model = FIT1.model    */

           ; quit ;

 

     data errorstats1 ; set s_&Dep_name._&Var1._&Var2. ;

           model = 'MODEL1' ;

                  t = intck('Months',"&End_d"d, max(date)) ;

                  Fx_error = &Dep_Fx. - p ;

                  Fx_error_pct = (&Dep_Fx. - p)/&Dep_Fx. ;

                  Naive_error = &Dep_Fx. - lag(&Dep_Fx.) ;

           if date > "&End_d."d ;

     keep model Date first t p Fx_error Fx_error_pct Naive_error ;

     run ;

     proc sql; create table errorstats2 as

     select a.model , a.EV , a.Mean_error , a.MSE , a.RMSE , a.MSPE , a.RMSPE , a.MAE , a.MAPE , a.n as Forecast_Length , a.Theils_U

     from

     (

           select * , sum_err_var_diff_2/n as EV , 

                     sum_error_squ/n as MSE ,

                     sqrt(sum_error_squ/n) as RMSE ,

                     sum_error_pct_squ/n as MSPE ,

                     sqrt(sum_error_pct_squ/n) as RMSPE ,

                     sum_abs_error/n as MAE ,

                     sum_abs_error_pct/n as MAPE     ,

                     sqrt(sum_error_squ) / sqrt(sum_Naive_error_squ) as Theils_U

                    

           from

           (

               select model , max(t) as n ,

                        mean(Fx_error) as Mean_error ,

                        sum(err_var_diff_2) as sum_err_var_diff_2 ,

                        sum(Fx_error) as sum_Fx_error ,

                        sum((Fx_error)**2) as sum_error_squ ,

                        sum((Fx_error_pct)**2) as sum_error_pct_squ ,

                        sum(abs(Fx_error)) as sum_abs_error ,

                        sum(abs(Fx_error_pct)) as sum_abs_error_pct ,

                        sum(Naive_error**2) as sum_Naive_error_squ

                from

                ( select * , mean(Fx_error) as ME , (fx_error - calculated ME)**2 as err_var_diff_2

                  from errorstats1

                )

                group by model

           )

     ) as a

     ; quit ;

    

     proc sql; create table mergestats as

           select a.* ,

           /* b */

                   DW , dw_pvalue_pos , dw_pvalue_neg , HPI_Tstat , HPI_Pvalue , HPI_VIF , Unemp_Tstat , Unemp_Pvalue , Unemp_VIF ,   No_obs ,

           /* c */

                   EV , Mean_error , MSE , RMSE , MSPE , RMSPE , MAE , MAPE , Forecast_Length , Theils_U

           from &Dep._&Var1._&Var2. as a

           left join regstats as b

           on a._model_ = b.model

           left join errorstats2 as c

           on a._model_ = c.model

     ; quit ;

     data &Dep._&Var1._&Var2.a ; set mergestats ;

           _MODEL_ = "&Dep_name._&Var1._&Var2." ;

              rename &Var1. = HPI &Var2. = Unemp _IN_ = K ;

              label HPI_VIF = ' ' HPI_Tstat = ' ' HPI_Pvalue = ' '

                     Unemp_VIF = ' ' Unemp_Tstat = ' ' Unemp_Pvalue = ' '   ;

                TStat_var1 = &Var1.  ;

                TStat_var2 = &Var2.  ;

                Var1_t_flag = 1 ; Var2_t_flag = 1 ;

                if HPI_Tstat  < -2 then Var1_t_flag = 0 ;

                if Unemp_Tstat  >  2 then Var2_t_flag = 0 ;

 

                Var1_VIF_flag = 1 ; Var2_VIF_flag = 1 ;

                if HPI_VIF   < 3 then Var1_VIF_flag = 0 ;

                if Unemp_VIF < 3 then Var2_VIF_flag = 0 ;

 

                Model_Score = Var1_t_flag + Var2_t_flag + Var1_VIF_flag + Var2_VIF_flag ;

                Model_Fail = 0 ;

                if Model_Score > 0 then Model_Fail = 1 ;

     run ;

           /* */

     data modelruns ; set modelruns &Dep._&Var1._&Var2.a ; run;

     data modelruns2 ; set modelruns ;

           if TStat_var1 < 0 and TStat_var2 > 0 ;

           drop &Dep. _type_ _P_ TStat_var1 TStat_var2 ;

     run ;

 

     proc sql ; drop table &Dep._&Var1._&Var2.a , &Dep._&Var1._&Var2. , s_&Dep_name._&Var1._&Var2. , DW , VIF , /* FIT ,*/ regstats ,

                     mergestats , errorstats1 , errorstats2 ; quit ;

     %end ;

     %end ;

%end ;

%mend ;


%modelrun (Dep=&Dep.)  ;

 

proc sort data = modelruns2 ; by Model_Fail _rmse_  ; run ;

 

proc export data = modelruns2 

     dbms = csv

     outfile = "&OutFile\Output_&Dep._&Beg_d._&End_d._rundate_&Date.\modelruns_&ModelType._&Dep_name._&Beg_d._&End_d._rundate_&Date..csv"

     replace ;

run ;

 

/* Stops printing the log file to an external location and undo other options */

/* System Options */

options mcompilenote = none nomlogic nosymbolgen ;

ods graphics on ;

proc printto;

run;

 

; 

/* */
