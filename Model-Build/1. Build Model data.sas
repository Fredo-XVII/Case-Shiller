%Let Beg_d = 01JAN2007 ; * 2 options: 01JAN2007 01JAN2008 ;
%Let End_d = 01DEC2011 ; * 2 options: 01DEC2011 01DEC2012 01DEC2013 ;
%let date=%sysfunc(putn(%sysfunc(today()),date9.));
* %put &date %sysfunc(length(scor_F3_hpi12mcpl12_unemp12mcpl12)) ;
;
; /* Create Model Variables */
 
data InputVariables ;
set WORK.Model_Builds_60_2_90_data_1st_2n ;     /* copy dataset name from input file log */
/* Trend */
trend = _n_ ;
trend2 = trend**2 ; 
/* Unemployment */
unempl3=lag3(unemp);
unempl6=lag6(unemp);
unempl9=lag9(unemp);
unempl12=lag12(unemp);
 
unemp1D = dif(unemp) ;
           unemp1Dl3 = lag3(unemp1D) ;
           unemp1Dl6 = lag6(unemp1D) ;
           unemp1Dl9 = lag9(unemp1D) ;
           unemp1Dl12 = lag12(unemp1D) ; 
unemp3D = dif3(unemp) ;
           unemp3Dl3 = lag3(unemp3D) ;
           unemp3Dl6 = lag6(unemp3D) ;
           unemp3Dl9 = lag9(unemp3D) ;
           unemp3Dl12 = lag12(unemp3D) ;
unemp6D = dif6(unemp) ;
           unemp6Dl3 = lag3(unemp6D) ;
           unemp6Dl6 = lag6(unemp6D) ;
           unemp6Dl9 = lag9(unemp6D) ; 
           unemp6Dl12 = lag12(unemp6D) ;
unemp9D = dif9(unemp) ;
           unemp9Dl3 = lag3(unemp9D) ;
           unemp9Dl6 = lag6(unemp9D) ;
           unemp9Dl9 = lag9(unemp9D) ; 
           unemp9Dl12 = lag12(unemp9D) ;
unemp12D = dif12(unemp) ;
           unemp12Dl3 = lag3(unemp12D) ;
           unemp12Dl6 = lag6(unemp12D) ;
           unemp12Dl9 = lag9(unemp12D) ; 
           unemp12Dl12 = lag12(unemp12D) ;
 
unemp1mcp = (unemp-lag(unemp))/lag(unemp) ;
           unemp1mcpl3 = lag3(unemp1mcp) ;
           unemp1mcpl6 = lag6(unemp1mcp) ;
           unemp1mcpl9 = lag9(unemp1mcp) ;
           unemp1mcpl12 = lag12(unemp1mcp) ;   
unemp3mcp=(unemp-unempl3)/unempl3;
           unemp3mcpl3 = lag3(unemp3mcp) ;
           unemp3mcpl6 = lag6(unemp3mcp) ;
           unemp3mcpl9 = lag9(unemp3mcp) ;
           unemp3mcpl12 = lag12(unemp3mcp) ;
unemp6mcp=(unemp-unempl6)/unempl6;
           unemp6mcpl3 = lag3(unemp6mcp) ;
           unemp6mcpl6 = lag6(unemp6mcp) ;
           unemp6mcpl9 = lag9(unemp6mcp) ;
           unemp6mcpl12 = lag12(unemp6mcp) ;
unemp9mcp=(unemp-unempl9)/unempl9;
           unemp9mcpl3 = lag3(unemp9mcp) ;
           unemp9mcpl6 = lag6(unemp9mcp) ;
           unemp9mcpl9 = lag9(unemp9mcp) ;
           unemp9mcpl12 = lag12(unemp9mcp) ;
unemp12mcp=(unemp-unempl12)/unempl12;
           unemp12mcpl3 = lag3(unemp12mcp) ;
           unemp12mcpl6 = lag6(unemp12mcp) ;
           unemp12mcpl9 = lag9(unemp12mcp) ;
           unemp12mcpl12 = lag12(unemp12mcp) ;
 
/* HPI */ /* Note: No levels or Difference data*/
 
hpi3mcp = log(hpi/lag3(hpi)) ;
           hpi3mcpl3 = lag3(hpi3mcp) ;
           hpi3mcpl6 = lag6(hpi3mcp) ;
           hpi3mcpl9 = lag9(hpi3mcp) ;
           hpi3mcpl12 = lag12(hpi3mcp) ;
hpi6mcp = log(hpi/lag6(hpi)) ; 
           hpi6mcpl3 = lag3(hpi6mcp) ;
           hpi6mcpl6 = lag6(hpi6mcp) ;
           hpi6mcpl9 = lag9(hpi6mcp) ;
           hpi6mcpl12 = lag12(hpi6mcp) ;
hpi9mcp = log(hpi/lag9(hpi)) ; 
           hpi9mcpl3 = lag3(hpi9mcp) ;
           hpi9mcpl6 = lag6(hpi9mcp) ;
           hpi9mcpl9 = lag9(hpi9mcp) ;
           hpi9mcpl12 = lag12(hpi9mcp) ;  
hpi12mcp= log(hpi/lag12(hpi)) ;
           hpi12mcpl3 = lag3(hpi12mcp) ;
           hpi12mcpl6 = lag6(hpi12mcp) ;
           hpi12mcpl9 = lag9(hpi12mcp) ;
           hpi12mcpl12 = lag12(hpi12mcp) ;
hpi18mcp= log(hpi/lag18(hpi)) ;
           hpi18mcpl3 = lag3(hpi18mcp) ;
           hpi18mcpl6 = lag6(hpi18mcp) ;
           hpi18mcpl9 = lag9(hpi18mcp) ;
           hpi18mcpl12 = lag12(hpi18mcp) ;
hpi24mcp= log(hpi/lag24(hpi)) ;
           hpi24mcpl3 = lag3(hpi24mcp) ;
           hpi24mcpl6 = lag6(hpi24mcp) ;
           hpi24mcpl9 = lag9(hpi24mcp) ;
           hpi24mcpl12 = lag12(hpi24mcp) ;
hpi36mcp= log(hpi/lag36(hpi)) ;
           hpi36mcpl3 = lag3(hpi36mcp) ;
           hpi36mcpl6 = lag6(hpi36mcp) ;
           hpi36mcpl9 = lag9(hpi36mcp) ;
           hpi36mcpl12 = lag12(hpi36mcp) ;
hpi48mcp= log(hpi/lag48(hpi)) ;
           hpi48mcpl3 = lag3(hpi48mcp) ;
           hpi48mcpl6 = lag6(hpi48mcp) ;
           hpi48mcpl9 = lag9(hpi48mcp) ;
           hpi48mcpl12 = lag12(hpi48mcp) ;
 
run;
;
; /* Create new dependent variables */
data modeldata;
set InputVariables;
if date gt "&End_d"d
or date lt "&Beg_d"d
then first3=.;
else first3=first;
if date gt "&End_d"d
or date lt "&Beg_d"d
then second3=.;
else second3=second;
run;
;
 
/* Put variables into Macro for Correlations */
proc sql;      
     select name , count(distinct name) as varcount      
           into: CorrVariables separated by ' ' , :CountVar          
     from sashelp.vcolumn      
     where libname = 'WORK' and memname = 'INPUTVARIABLES'          
     and upcase(name) not in ('DATE')          
; quit ; %put &CorrVariables &CountVar ;
    
proc corr data=InputVariables ;     
var &CorrVariables ;      
run;      
 
proc freq data = InputVariables ; tables date ; run ;  
