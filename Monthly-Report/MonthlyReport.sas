/* Program that will be used to automate the Case Shiller Monthly Report */
libname indata 'K:\RetailLending\MN\RLRptg\AGM\SAS Programs\CaseShiller\Data' ;
libname outdata 'K:\RetailLending\MN\RLRptg\AGM\SAS Programs\CaseShiller\Output' ;
%let projtitle = CS14_01_ ;
%let beg_date = '01Jan2013'd ;
%let end_date = '01Nov2013'd ;
options spool ;
 
/* Case Shiller cities:
az_phoenix ca_los_angeles ca_san_diego ca_san_francisco co_denver dc_washington fl_miami fl_tampa ga_atlanta il_chicago ma_boston
mi_detroit mn_minneapolis nc_charlotte nv_las_vegas ny_new_york oh_cleveland or_portland tx_dallas wa_seattle composite_10
composite_20
           
*/
 
/* Bring in the data from the case shiller website */
 
data indata.CS_2014_01 ; set WORK.cshomeprice_history_0128_2014 ;
            if year ~= . ;
run ;
 
                        proc sql; /* quote */
                             select trim(compress((name))) into: CityStates separated by ' '
                                     from sashelp.vcolumn
                              where libname='INDATA' and memname='CS_2014_01'
                                                and name ~= 'year'   ;
                        quit; %put &CityStates ;
 
                        proc sql; create table varnames as
                             select trim(compress((name))) as varnames
                                     from sashelp.vcolumn
                              where libname='INDATA' and memname='CS_2014_01'
                                                and name ~= 'year'   ;
                        quit;
                        data varnames2 ; set varnames ; retain count 0 ; count + 1 ; call symput('VarCount', put((count),8.)) ; run ; %put &VarCount ;
                        proc sql; select max(year) format date9. into: maxyr from indata.cs_2014_01 ; quit ; %put &maxyr ;
                       
%macro PercChg (n = ) ;
proc sql; drop table PercChg ; quit ;
%do i = 1 %to &n ;
            data _null_ ; set varnames2 ;
                        if &i = count then do ;
                        call symput('Var',put(trim(compress(trim(varnames))), $32.)) ;
                        end ;
            run ; %put &Var ;
 
data &projtitle.&n.  ; set indata.CS_2014_01 ; by year ;
             lag1&Var = (&Var - lag(&Var))/lag(&Var) ;
             lag3&Var = (&Var - lag3(&Var))/lag3(&Var) ;
             lag12&Var = (&Var - lag12(&Var))/lag12(&Var) ;
             * City = %put('&var', $32.) ;
             output ;
             keep year city lag1&Var lag3&Var lag12&Var ;
run ;
proc sql; create table &projtitle.&n as select *, %put("&var", $12.) as City from &projtitle.&n. having year = "&maxyr"d ; quit ; ;
 
/*proc append data = &projtitle.&n base = PercChg force ; run ;*/
 
%end ;
%mend ;
%PercChg (n = 2) ;
 
data PercChg ; merge PercChg &projtitle.&n ; by year ; run ;
 
proc sql; create table add_varname as    
            select * , &Var as varname
            from &projtitle.1
            having year = max(year)
; quit ;
 
proc sql; create table VarPctChg&n as
            select a.* , b.*
            from varnames as a
            left join add_varname as b
            on a.varnames = b.varnames
            order by lag12&Var desc
; quit ;
 
%end ;
%mend ;
%PercChg (n = 2) ;
 
 
