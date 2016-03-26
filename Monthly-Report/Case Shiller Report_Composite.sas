; /* Calculated the percent changes for Home prices */

data set1 ; set WORK.cshomeprice_history_2014_07241 ; 
	if year = . then delete ; 
	M1_chg_PHO = (az_phoenix - lag(az_phoenix))/lag(az_phoenix) ;
	M3_chg_PHO = (az_phoenix - lag3(az_phoenix))/lag3(az_phoenix) ;
	M12_chg_PHO = (az_phoenix - lag12(az_phoenix))/lag12(az_phoenix) ;
	Yr5_chg_PHO = ( (az_phoenix - lag60(az_phoenix))/lag60(az_phoenix) ) / 5 ; 
	Yr10_chg_PHO = ( (az_phoenix - lag120(az_phoenix))/lag120(az_phoenix) ) / 10 ; 
	Yr20_chg_PHO = ( (az_phoenix - lag240(az_phoenix))/lag240(az_phoenix) ) / 20 ;

	M1_chg_la = (ca_los_angeles - lag(ca_los_angeles))/lag(ca_los_angeles) ;
	M3_chg_la = (ca_los_angeles - lag3(ca_los_angeles))/lag3(ca_los_angeles) ;
	M12_chg_la = (ca_los_angeles - lag12(ca_los_angeles))/lag12(ca_los_angeles) ;
	Yr5_chg_la = ( (ca_los_angeles - lag60(ca_los_angeles))/lag60(ca_los_angeles) ) / 5 ; 
	Yr10_chg_la = ( (ca_los_angeles - lag120(ca_los_angeles))/lag120(ca_los_angeles) ) / 10 ; 
 	Yr20_chg_la = ( (ca_los_angeles - lag240(ca_los_angeles))/lag240(ca_los_angeles) ) / 20 ;

	M1_chg_sd = (ca_san_diego - lag(ca_san_diego))/lag(ca_san_diego) ;
	M3_chg_sd = (ca_san_diego - lag3(ca_san_diego))/lag3(ca_san_diego) ;
	M12_chg_sd = (ca_san_diego - lag12(ca_san_diego))/lag12(ca_san_diego) ;
	Yr5_chg_sd =  ( (ca_san_diego - lag60(ca_san_diego))/lag60(ca_san_diego) ) / 5 ; 
	Yr10_chg_sd = ( (ca_san_diego - lag120(ca_san_diego))/lag120(ca_san_diego) ) / 10 ; 
	Yr20_chg_sd =  ( (ca_san_diego - lag240(ca_san_diego))/lag240(ca_san_diego) ) / 20 ;

	M1_chg_sf = (ca_san_francisco - lag(ca_san_francisco))/lag(ca_san_francisco) ;
	M3_chg_sf = (ca_san_francisco - lag3(ca_san_francisco))/lag3(ca_san_francisco) ;
	M12_chg_sf = (ca_san_francisco - lag12(ca_san_francisco))/lag12(ca_san_francisco) ;
	Yr5_chg_sf = ( (ca_san_francisco - lag60(ca_san_francisco))/lag60(ca_san_francisco) ) / 5 ; 
	Yr10_chg_sf = ( (ca_san_francisco - lag120(ca_san_francisco))/lag120(ca_san_francisco) ) / 10 ; 
	Yr20_chg_sf =  ( (ca_san_francisco - lag240(ca_san_francisco))/lag240(ca_san_francisco) ) / 20 ;

	M1_chg_DEN = (co_denver - lag(co_denver))/lag(co_denver) ;
	M3_chg_DEN = (co_denver - lag3(co_denver))/lag3(co_denver) ;
	M12_chg_DEN = (co_denver - lag12(co_denver))/lag12(co_denver) ;
	Yr5_chg_DEN = ( (co_denver - lag60(co_denver))/lag60(co_denver) ) / 5 ; 
	Yr10_chg_DEN = ( (co_denver - lag120(co_denver))/lag120(co_denver) ) / 10 ; 
	Yr20_chg_DEN = ( (co_denver - lag240(co_denver))/lag240(co_denver) ) / 20 ;

	M1_chg_dc = (dc_washington - lag(dc_washington))/lag(dc_washington) ;
	M3_chg_dc = (dc_washington - lag3(dc_washington))/lag3(dc_washington) ;
	M12_chg_dc = (dc_washington - lag12(dc_washington))/lag12(dc_washington) ;
	Yr5_chg_dc =  ( (dc_washington - lag60(dc_washington))/lag60(dc_washington) ) / 5 ; 
	Yr10_chg_dc = ( (dc_washington - lag120(dc_washington))/lag120(dc_washington) ) / 10 ; 
	Yr20_chg_dc = ( (dc_washington - lag240(dc_washington))/lag240(dc_washington) ) / 20 ;

	M1_chg_mia = (fl_miami - lag(fl_miami))/lag(fl_miami) ;
	M3_chg_mia = (fl_miami - lag3(fl_miami))/lag3(fl_miami) ;
	M12_chg_mia = (fl_miami - lag12(fl_miami))/lag12(fl_miami) ;
	Yr5_chg_mia = ( (fl_miami - lag60(fl_miami))/lag60(fl_miami) ) / 5 ; 
	Yr10_chg_mia = ( (fl_miami - lag120(fl_miami))/lag120(fl_miami) ) / 10 ;  
	Yr20_chg_mia= ( (fl_miami - lag240(fl_miami))/lag240(fl_miami) ) / 20 ;

	M1_chg_TAM = (fl_tampa - lag(fl_tampa))/lag(fl_tampa) ;
	M3_chg_TAM = (fl_tampa - lag3(fl_tampa))/lag3(fl_tampa) ;
	M12_chg_TAM = (fl_tampa - lag12(fl_tampa))/lag12(fl_tampa) ;
	Yr5_chg_TAM = ( (fl_tampa - lag60(fl_tampa))/lag60(fl_tampa) ) / 5 ; 
	Yr10_chg_TAM = ( (fl_tampa - lag120(fl_tampa))/lag120(fl_tampa) ) / 10 ;  
	Yr20_chg_TAM= ( (fl_tampa - lag240(fl_tampa))/lag240(fl_tampa) ) / 20 ;

	M1_chg_atl = (ga_atlanta - lag(ga_atlanta))/lag(ga_atlanta) ;
	M3_chg_atl = (ga_atlanta - lag3(ga_atlanta))/lag3(ga_atlanta) ;
	M12_chg_atl = (ga_atlanta - lag12(ga_atlanta))/lag12(ga_atlanta) ;
	Yr5_chg_atl = ( (ga_atlanta - lag60(ga_atlanta))/lag60(ga_atlanta) ) / 5 ; 
	Yr10_chg_atl = ( (ga_atlanta - lag120(ga_atlanta))/lag120(ga_atlanta) ) / 10 ;  
	Yr20_chg_atl= ( (ga_atlanta - lag240(ga_atlanta))/lag240(ga_atlanta) ) / 20 ;

	M1_chg_chi = (il_chicago - lag(il_chicago))/lag(il_chicago) ;
	M3_chg_chi = (il_chicago - lag3(il_chicago))/lag3(il_chicago) ;
	M12_chg_chi = (il_chicago - lag12(il_chicago))/lag12(il_chicago) ;
	Yr5_chg_chi = ( (il_chicago - lag60(il_chicago))/lag60(il_chicago) ) / 5 ; 
	Yr10_chg_chi = ( (il_chicago - lag120(il_chicago))/lag120(il_chicago) ) / 10 ;  
	Yr20_chg_chi= ( (il_chicago - lag240(il_chicago))/lag240(il_chicago) ) / 20 ;

	M1_chg_bos = (ma_boston - lag(ma_boston))/lag(ma_boston) ;
	M3_chg_bos = (ma_boston - lag3(ma_boston))/lag3(ma_boston) ;
	M12_chg_bos = (ma_boston - lag12(ma_boston))/lag12(ma_boston) ;
	Yr5_chg_bos = ( (ma_boston - lag60(ma_boston))/lag60(ma_boston) ) / 5 ; 
	Yr10_chg_bos = ( (ma_boston - lag120(ma_boston))/lag120(ma_boston) ) / 10 ;  
	Yr20_chg_bos= ( (ma_boston - lag240(ma_boston))/lag240(ma_boston) ) / 20 ;

	M1_chg_det = (mi_detroit - lag(mi_detroit))/lag(mi_detroit) ;
	M3_chg_det = (mi_detroit - lag3(mi_detroit))/lag3(mi_detroit) ;
	M12_chg_det = (mi_detroit - lag12(mi_detroit))/lag12(mi_detroit) ;
	Yr5_chg_det =  ( (mi_detroit - lag60(mi_detroit))/lag60(mi_detroit) ) / 5 ; 
	Yr10_chg_det = ( (mi_detroit - lag120(mi_detroit))/lag120(mi_detroit) ) / 10 ;  
	Yr20_chg_det= ( (mi_detroit - lag240(mi_detroit))/lag240(mi_detroit) ) / 20 ;

	M1_chg_min = (mn_minneapolis - lag(mn_minneapolis))/lag(mn_minneapolis) ;
	M3_chg_min = (mn_minneapolis - lag3(mn_minneapolis))/lag3(mn_minneapolis) ;
	M12_chg_min = (mn_minneapolis - lag12(mn_minneapolis))/lag12(mn_minneapolis) ;
	Yr5_chg_min = ( (mn_minneapolis - lag60(mn_minneapolis))/lag60(mn_minneapolis) ) / 5 ; 
	Yr10_chg_min = ( (mn_minneapolis - lag120(mn_minneapolis))/lag120(mn_minneapolis) ) / 10 ;  
	Yr20_chg_min = ( (mn_minneapolis - lag240(mn_minneapolis))/lag240(mn_minneapolis) ) / 20 ;

	M1_chg_cha = (nc_charlotte - lag(nc_charlotte))/lag(nc_charlotte) ;
	M3_chg_cha = (nc_charlotte - lag3(nc_charlotte))/lag3(nc_charlotte) ;
	M12_chg_cha = (nc_charlotte - lag12(nc_charlotte))/lag12(nc_charlotte) ;
	Yr5_chg_cha =  ( (nc_charlotte - lag60(nc_charlotte))/lag60(nc_charlotte) ) / 5 ; 
	Yr10_chg_cha = ( (nc_charlotte - lag120(nc_charlotte))/lag120(nc_charlotte) ) / 10 ;  
	Yr20_chg_cha= ( (nc_charlotte - lag240(nc_charlotte))/lag240(nc_charlotte) ) / 20 ;

	M1_chg_lv = (nv_las_vegas - lag(nv_las_vegas))/lag(nv_las_vegas) ;
	M3_chg_lv = (nv_las_vegas - lag3(nv_las_vegas))/lag3(nv_las_vegas) ;
	M12_chg_lv = (nv_las_vegas - lag12(nv_las_vegas))/lag12(nv_las_vegas) ;
	Yr5_chg_lv = ( (nv_las_vegas - lag60(nv_las_vegas))/lag60(nv_las_vegas) ) / 5 ; 
	Yr10_chg_lv = ( (nv_las_vegas - lag120(nv_las_vegas))/lag120(nv_las_vegas) ) / 10 ;  
	Yr20_chg_lv= ( (nv_las_vegas - lag240(nv_las_vegas))/lag240(nv_las_vegas) ) / 20 ;

	M1_chg_nyc = (ny_new_york - lag(ny_new_york))/lag(ny_new_york) ;
	M3_chg_nyc = (ny_new_york - lag3(ny_new_york))/lag3(ny_new_york) ;
	M12_chg_nyc = (ny_new_york - lag12(ny_new_york))/lag12(ny_new_york) ;
	Yr5_chg_nyc = ( (ny_new_york - lag60(ny_new_york))/lag60(ny_new_york) ) / 5 ; 
	Yr10_chg_nyc = ( (ny_new_york - lag120(ny_new_york))/lag120(ny_new_york) ) / 10 ;  
	Yr20_chg_nyc= ( (ny_new_york - lag240(ny_new_york))/lag240(ny_new_york) ) / 20 ;

	M1_chg_cle = (oh_cleveland - lag(oh_cleveland))/lag(oh_cleveland) ;
	M3_chg_cle = (oh_cleveland - lag3(oh_cleveland))/lag3(oh_cleveland) ;
	M12_chg_cle = (oh_cleveland - lag12(oh_cleveland))/lag12(oh_cleveland) ;
	Yr5_chg_cle = ( (oh_cleveland - lag60(oh_cleveland))/lag60(oh_cleveland) ) / 5 ; 
	Yr10_chg_cle = ( (oh_cleveland - lag120(oh_cleveland))/lag120(oh_cleveland) ) / 10 ;  
	Yr20_chg_cle= ( (oh_cleveland - lag240(oh_cleveland))/lag240(oh_cleveland) ) / 20 ;

	M1_chg_por = (or_portland - lag(or_portland))/lag(or_portland) ;
	M3_chg_por = (or_portland - lag3(or_portland))/lag3(or_portland) ;
	M12_chg_por = (or_portland - lag12(or_portland))/lag12(or_portland) ;
	Yr5_chg_por = ( (or_portland - lag60(or_portland))/lag60(or_portland) ) / 5 ;  
	Yr10_chg_por = ( (or_portland - lag120(or_portland))/lag120(or_portland) ) / 10 ;  
	Yr20_chg_por = ( (or_portland - lag240(or_portland))/lag240(or_portland) ) / 20 ;

	M1_chg_dal = (tx_dallas - lag(tx_dallas))/lag(tx_dallas) ;
	M3_chg_dal = (tx_dallas - lag3(tx_dallas))/lag3(tx_dallas) ;
	M12_chg_dal = (tx_dallas - lag12(tx_dallas))/lag12(tx_dallas) ;
	Yr5_chg_dal = ( (tx_dallas - lag60(tx_dallas))/lag60(tx_dallas) ) / 5 ; 
	Yr10_chg_dal = ( (tx_dallas - lag120(tx_dallas))/lag120(tx_dallas) ) / 10 ;  
	Yr20_chg_dal = ( (tx_dallas - lag240(tx_dallas))/lag240(tx_dallas) ) / 20 ;

	M1_chg_sea = (wa_seattle - lag(wa_seattle))/lag(wa_seattle) ;
	M3_chg_sea = (wa_seattle - lag3(wa_seattle))/lag3(wa_seattle) ;
	M12_chg_sea = (wa_seattle - lag12(wa_seattle))/lag12(wa_seattle) ;
	Yr5_chg_sea = ( (wa_seattle - lag60(wa_seattle))/lag60(wa_seattle) ) / 5 ; 
	Yr10_chg_sea = ( (wa_seattle - lag120(wa_seattle))/lag120(wa_seattle) ) / 10 ;  
	Yr20_chg_sea = ( (wa_seattle - lag240(wa_seattle))/lag240(wa_seattle) ) / 20 ;

	M1_chg_C10 = (composite_10 - lag(composite_10))/lag(composite_10) ;
	M3_chg_C10 = (composite_10 - lag3(composite_10))/lag3(composite_10) ;
	M12_chg_C10 = (composite_10 - lag12(composite_10))/lag12(composite_10) ;
	Yr5_chg_C10 = ( (composite_10 - lag60(composite_10))/lag60(composite_10) ) / 5 ; 
	Yr10_chg_C10 = ( (composite_10 - lag120(composite_10))/lag120(composite_10) ) / 10 ;  
	Yr20_chg_C10 = ( (composite_10 - lag240(composite_10))/lag240(composite_10) ) / 20 ;

	M1_chg_C20 = (composite_20 - lag(composite_20))/lag(composite_20) ;
	M3_chg_C20 = (composite_20 - lag3(composite_20))/lag3(composite_20) ;
	M12_chg_C20 = (composite_20 - lag12(composite_20))/lag12(composite_20) ;
	Yr5_chg_C20 = ( (composite_20 - lag60(composite_20))/lag60(composite_20) ) / 5 ; 
	Yr10_chg_C20 = ( (composite_20 - lag120(composite_20))/lag120(composite_20) ) / 10 ;  
	Yr20_chg_C20 = ( (composite_20 - lag240(composite_20))/lag240(composite_20) ) / 20 ;

	TCF_Weighted = .429*mn_minneapolis + .39*il_chicago + .111*mi_detroit + .065*co_denver + .006*az_phoenix ; /* Updated 6/27/2014 */
	M1_chg_tcf = (TCF_Weighted - lag(TCF_Weighted))/lag(TCF_Weighted) ;
	M3_chg_tcf = (TCF_Weighted - lag3(TCF_Weighted))/lag3(TCF_Weighted) ;
	M12_chg_tcf = (TCF_Weighted - lag12(TCF_Weighted))/lag12(TCF_Weighted) ;
	Yr5_chg_tcf = ( (TCF_Weighted - lag60(TCF_Weighted))/lag60(TCF_Weighted) ) / 5 ; 
	Yr10_chg_tcf = ( (TCF_Weighted - lag120(TCF_Weighted))/lag120(TCF_Weighted) ) / 10 ;  
	Yr20_chg_tcf = ( (TCF_Weighted - lag240(TCF_Weighted))/lag240(TCF_Weighted) ) / 20 ;

	RLU_Average = (1*ma_boston + 1*ca_los_angeles + 1*ca_san_diego + 1*ca_san_francisco + 1*wa_seattle) / 5 ; /* Updated 6/27/2014 */ 
	M1_chg_RLU = (RLU_Average - lag(RLU_Average))/lag(RLU_Average) ;
	M3_chg_RLU = (RLU_Average - lag3(RLU_Average))/lag3(RLU_Average) ;
	M12_chg_RLU = (RLU_Average - lag12(RLU_Average))/lag12(RLU_Average) ;
	Yr5_chg_RLU = ( (RLU_Average - lag60(RLU_Average))/lag60(RLU_Average) ) / 5 ; 
	Yr10_chg_RLU = ( (RLU_Average - lag120(RLU_Average))/lag120(RLU_Average) ) / 10 ;  
	Yr20_chg_RLU = ( (RLU_Average - lag240(RLU_Average))/lag240(RLU_Average) ) / 20 ;

run ;
;
;
data set_m1 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M1_chg_PHO M1_chg_la M1_chg_sd M1_chg_sf M1_chg_DEN M1_chg_dc
		M1_chg_mia M1_chg_TAM M1_chg_atl M1_chg_chi M1_chg_bos M1_chg_det
		M1_chg_min M1_chg_cha M1_chg_lv M1_chg_nyc M1_chg_cle M1_chg_por
		M1_chg_dal M1_chg_sea M1_chg_C10 M1_chg_C20 M1_chg_tcf M1_chg_RLU
	;
run ;
;

proc transpose data = set_m1 out= Transposed_m1 name = Change ; run ;
;
data set_m3 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M3_chg_PHO M3_chg_la M3_chg_sd M3_chg_sf M3_chg_DEN M3_chg_dc
		M3_chg_mia M3_chg_TAM M3_chg_atl M3_chg_chi M3_chg_bos M3_chg_det
		M3_chg_min M3_chg_cha M3_chg_lv M3_chg_nyc M3_chg_cle M3_chg_por
		M3_chg_dal M3_chg_sea M3_chg_C10 M3_chg_C20 M3_chg_tcf M3_chg_RLU
	;
run ;
;

proc transpose data = set_m3 out= Transposed_m3 name = Change ; run ;
;
data set_m12 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M12_chg_PHO M12_chg_la M12_chg_sd M12_chg_sf M12_chg_DEN M12_chg_dc
		M12_chg_mia M12_chg_TAM M12_chg_atl M12_chg_chi M12_chg_bos M12_chg_det
		M12_chg_min M12_chg_cha M12_chg_lv M12_chg_nyc M12_chg_cle M12_chg_por
		M12_chg_dal M12_chg_sea M12_chg_C10 M12_chg_C20 M12_chg_tcf M12_chg_RLU
	;
run ;
;
proc transpose data = set_m12 out= Transposed_m12 name = Change ; run ;
;
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
;
data set_yr10 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep Yr10_chg_PHO Yr10_chg_la Yr10_chg_sd Yr10_chg_sf Yr10_chg_DEN Yr10_chg_dc
		Yr10_chg_mia Yr10_chg_TAM Yr10_chg_atl Yr10_chg_chi Yr10_chg_bos Yr10_chg_det
		Yr10_chg_min Yr10_chg_cha Yr10_chg_lv Yr10_chg_nyc Yr10_chg_cle Yr10_chg_por
		Yr10_chg_dal Yr10_chg_sea Yr10_chg_C10 Yr10_chg_C20 Yr10_chg_tcf Yr10_chg_RLU
	;
run ;
;
proc transpose data = set_Yr10 out= Transposed_Yr10 name = Change ; run ;
;
data set_yr20 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep Yr20_chg_PHO Yr20_chg_la Yr20_chg_sd Yr20_chg_sf Yr20_chg_DEN Yr20_chg_dc
		Yr20_chg_mia Yr20_chg_TAM Yr20_chg_atl Yr20_chg_chi Yr20_chg_bos Yr20_chg_det
		Yr20_chg_min Yr20_chg_cha Yr20_chg_lv Yr20_chg_nyc Yr20_chg_cle Yr20_chg_por
		Yr20_chg_dal Yr20_chg_sea Yr20_chg_C10 Yr20_chg_C20 Yr20_chg_tcf Yr20_chg_RLU
	;
run ;
;
proc transpose data = set_Yr20 out= Transposed_Yr20 name = Change ; run ;
;
data History_12m ; set work.set1 nobs = maxobs ;
	if (maxobs-12) < _n_ < maxobs ; 
	keep M1_chg_PHO M1_chg_la M1_chg_sd M1_chg_sf M1_chg_DEN M1_chg_dc
		M1_chg_mia M1_chg_TAM M1_chg_atl M1_chg_chi M1_chg_bos M1_chg_det
		M1_chg_min M1_chg_cha M1_chg_lv M1_chg_nyc M1_chg_cle M1_chg_por
		M1_chg_dal M1_chg_sea M1_chg_C10 M1_chg_C20 M1_chg_tcf M1_chg_RLU 
	;
run ;

proc transpose data = History_12m name = Change out = Transposed_History Prefix = M0 ; run ;

proc sql; create table Merge_chgs (drop = change) as
	select a.city , a.City_name ,  z.* ,
				b.col1 as Month_1_Chg , c.col1 as Month_3_Chg , d.col1 as Month_12_Chg ,
				e.col1 as Year_5_avg , f.col1 as Year_10_avg , g.col1 as Year_20_avg 

	from WORK.Input_TableReference_File as a
	left join Transposed_History as z
	on a.m1 = z.Change 
	left join Transposed_m1 as b
	on a.m1 = b.change
	left join Transposed_m3 as c
	on a.m3 = c.change 
	left join Transposed_m12 as d
	on a.m12 = d.change 
	left join Transposed_Yr5 as e
	on a.Yr5 = e.change 
	left join Transposed_Yr10 as f
	on a.Yr10 = f.change 
	left join Transposed_Yr20 as g
	on a.Yr20 = g.change 
	order by Month_12_Chg desc
; quit ;

/* Grab the TCF footprint markets */
proc sql; create table TCF_footprint as
	select	*
	from Merge_chgs
	where upcase(City_name) in ('MINNEAPOLIS','CHICAGO','DETROIT','DENVER','PHOENIX')
	union all
	select	*
	from Merge_chgs
	where upcase(City_name) in ('TCF WEIGHTED AVG')
	union all
	select	*
	from Merge_chgs
	where upcase(City_name) in ('COMPOSITE 10','COMPOSITE 20')
; quit ; 

/* Grab the TCF footprint markets */
proc sql; create table TCF_RLU as
	select *
	from Merge_chgs
	where upcase(City_name) in ('LOS ANGELES','SAN DIEGO','SAN FRANCISCO','BOSTON','SEATTLE')
	union all
	select	*
	from Merge_chgs
	where upcase(City_name) in ('RLU AVG')
	union all
	select	*
	from Merge_chgs
	where upcase(City_name) in ('COMPOSITE 10','COMPOSITE 20')
; quit ; 

/* Copy me for Table: Removes RLU row from Table in Deck */
proc sql; create table CopyMe as
	select *
	from Merge_chgs 
	where upcase(City_name) not in ('RLU AVG')
; quit ; 

