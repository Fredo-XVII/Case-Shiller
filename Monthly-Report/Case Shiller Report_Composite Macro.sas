/* Create Macro for Home Code */

%macro HomePriceChgs ;
	data Inputdata ; set work.cshomeprice_history_2014_0624 ;
	proc sql; select max(n) into :MaxVar from INPUT_TABLEREFERENCE_FILE ; quit ; %put &MaxVar ; 
%do i = 1 %to &MaxVar ;

	data _null_ ; set Input_TableReference_File ; 
	if n = &i. then do ;
	call symput('Abbr', trim(put(city_abbr, $char3.)) ) ;
	call symput('City', trim(put(city, $Char16.)) ) ;
	end ; 
	run ; 		%put &abbr &city ;

	data set1 ; set Inputdata ; 

	TCF_Wtd_Avg = .429*mn_minneapolis + .39*il_chicago + .111*mi_detroit + .065*co_denver + .006*az_phoenix ;
	RLU_Wtd_Avg = (1*ma_boston + 1*ca_los_angeles + 1*ca_san_diego + 1*ca_san_francisco + 1*wa_seattle) / 5 ; 
	M1_chg_&Abbr. = (&City. - lag(&City.))/lag(&City.) ;
	M3_chg_&Abbr  = (&City - lag3(&City))/lag3(&City) ;
	M12_chg_&Abbr  = (&City - lag12(&City))/lag12(&City) ;
	Yr5_chg_&Abbr  = ( (&City - lag60(&City))/lag60(&City) ) / 5 ; 
	Yr10_chg_&Abbr  = ( (&City - lag120(&City))/lag120(&City) ) / 10 ; 
	Yr20_chg_&Abbr  = ( (&City - lag240(&City))/lag240(&City) ) / 20 ;
	run ;
	data Inputdata ; set set1 ; run ;
%end ;	

%mend HomePriceChgs ; 

%HomePriceChgs ;

proc sql; 
	select case when name like '%M1_%' and name not like '%M12%' then name else ' ' end 
			into: Var separated by ' '
	from sashelp.vcolumn
	where libname = 'WORK' and memname = 'SET1'

; quit ; %put &Var ;


%Macro TransposeData ; 

%do i = 1 , 3 ; 
data set_m&i ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M&i._chg_PHO M&i._chg_la  M&i._chg_sd  M&i._chg_sf  M&i._chg_DEN M&i._chg_dc
		 M&i._chg_mia M&i._chg_TAM M&i._chg_atl M&i._chg_chi M&i._chg_bos M&i._chg_det
		 M&i._chg_min M&i._chg_cha M&i._chg_lv  M&i._chg_nyc M&i._chg_cle M&i._chg_por
		 M&i._chg_dal M&i._chg_sea M&i._chg_C10 M&i._chg_C20 M&i._chg_tcf M&i._chg_RLU
	;
run ;
;

proc transpose data = set_m&i. out= Transposed_m&i. name = Change ; run ;
;
%end ;
%mend TransposeData ; 

%TransposeData ; 

data set_yr5 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep Yr5_chg_PHO Yr5_chg_la Yr5_chg_sd Yr5_chg_sf Yr5_chg_DEN Yr5_chg_dc
		Yr5_chg_mia Yr5_chg_TAM Yr5_chg_atl Yr5_chg_chi Yr5_chg_bos Yr5_chg_det
		Yr5_chg_min Yr5_chg_cha Yr5_chg_lv Yr5_chg_nyc Yr5_chg_cle Yr5_chg_por
		Yr5_chg_dal Yr5_chg_sea Yr5_chg_C10 Yr5_chg_C20 Yr5_chg_tcf Yr5_chg_RLU
	;
run ;
;
proc transpose data = set_Yr5 out= Transposed_Yr5 name = Change ; run ;


 
%Macro Test( List = ) ; 
%Local I ; 
%Do I = 1 %To %SysFunc( CountW( &List ) ) ; 
%Put Array Value = %Scan( &List ,&I , %Str( ) ) ; 
%End ; 
%Mend ; 
 
%Test( List = 1 3 12 ) 
 
