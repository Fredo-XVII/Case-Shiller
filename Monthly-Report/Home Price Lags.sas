proc sql; create table getnames as
	select name 
	from sashelp.vcolumn
	where libname = 'WORK' and memname = 'CSHOMEPRICE_HISTORY_0128_2014'
; quit ; 

data set1 ; set WORK.cshomeprice_history_0128_2014 ; 

	M1_chg_phoe = (az_phoenix - lag(az_phoenix))/lag(az_phoenix) ;
	M3_chg_phoe = (az_phoenix - lag3(az_phoenix))/lag3(az_phoenix) ;
	M12_chg_phoe = (az_phoenix - lag12(az_phoenix))/lag12(az_phoenix) ;

	M1_chg_la = (ca_los_angeles - lag(ca_los_angeles))/lag(ca_los_angeles) ;
	M3_chg_la = (ca_los_angeles - lag3(ca_los_angeles))/lag3(ca_los_angeles) ;
	M12_chg_la = (ca_los_angeles - lag12(ca_los_angeles))/lag12(ca_los_angeles) ;

	M1_chg_sd = (ca_san_diego - lag(ca_san_diego))/lag(ca_san_diego) ;
	M3_chg_sd = (ca_san_diego - lag3(ca_san_diego))/lag3(ca_san_diego) ;
	M12_chg_sd = (ca_san_diego - lag12(ca_san_diego))/lag12(ca_san_diego) ;

	M1_chg_sf = (ca_san_francisco - lag(ca_san_francisco))/lag(ca_san_francisco) ;
	M3_chg_sf = (ca_san_francisco - lag3(ca_san_francisco))/lag3(ca_san_francisco) ;
	M12_chg_sf = (ca_san_francisco - lag12(ca_san_francisco))/lag12(ca_san_francisco) ;

	M1_chg_der = (co_denver - lag(co_denver))/lag(co_denver) ;
	M3_chg_der = (co_denver - lag3(co_denver))/lag3(co_denver) ;
	M12_chg_der = (co_denver - lag12(co_denver))/lag12(co_denver) ;

	M1_chg_dc = (dc_washington - lag(dc_washington))/lag(dc_washington) ;
	M3_chg_dc = (dc_washington - lag3(dc_washington))/lag3(dc_washington) ;
	M12_chg_dc = (dc_washington - lag12(dc_washington))/lag12(dc_washington) ;

	M1_chg_mia = (fl_miami - lag(fl_miami))/lag(fl_miami) ;
	M3_chg_mia = (fl_miami - lag3(fl_miami))/lag3(fl_miami) ;
	M12_chg_mia = (fl_miami - lag12(fl_miami))/lag12(fl_miami) ;

	M1_chg_ta = (fl_tampa - lag(fl_tampa))/lag(fl_tampa) ;
	M3_chg_ta = (fl_tampa - lag3(fl_tampa))/lag3(fl_tampa) ;
	M12_chg_ta = fl_tampa - lag12(fl_tampa)/lag12(fl_tampa) ;

	M1_chg_atl = (ga_atlanta - lag(ga_atlanta))/lag(ga_atlanta) ;
	M3_chg_atl = (ga_atlanta - lag3(ga_atlanta))/lag3(ga_atlanta) ;
	M12_chg_atl = (ga_atlanta - lag12(ga_atlanta))/lag12(ga_atlanta) ;

	M1_chg_chi = (il_chicago - lag(il_chicago))/lag(il_chicago) ;
	M3_chg_chi = (il_chicago - lag3(il_chicago))/lag3(il_chicago) ;
	M12_chg_chi = (il_chicago - lag12(il_chicago))/lag12(il_chicago) ;

	M1_chg_bos = (ma_boston - lag(ma_boston))/lag(ma_boston) ;
	M3_chg_bos = (ma_boston - lag3(ma_boston))/lag3(ma_boston) ;
	M12_chg_bos = (ma_boston - lag12(ma_boston))/lag12(ma_boston) ;

	M1_chg_det = (mi_detroit - lag(mi_detroit))/lag(mi_detroit) ;
	M3_chg_det = (mi_detroit - lag3(mi_detroit))/lag3(mi_detroit) ;
	M12_chg_det = (mi_detroit - lag12(mi_detroit))/lag12(mi_detroit) ;

	M1_chg_min = (mn_minneapolis - lag(mn_minneapolis))/lag(mn_minneapolis) ;
	M3_chg_min = (mn_minneapolis - lag3(mn_minneapolis))/lag3(mn_minneapolis) ;
	M12_chg_min = (mn_minneapolis - lag12(mn_minneapolis))/lag12(mn_minneapolis) ;

	M1_chg_cha = (nc_charlotte - lag(nc_charlotte))/lag(nc_charlotte) ;
	M3_chg_cha = (nc_charlotte - lag3(nc_charlotte))/lag3(nc_charlotte) ;
	M12_chg_cha = (nc_charlotte - lag12(nc_charlotte))/lag12(nc_charlotte) ;

	M1_chg_lv = (nv_las_vegas - lag(nv_las_vegas))/lag(nv_las_vegas) ;
	M3_chg_lv = (nv_las_vegas - lag3(nv_las_vegas))/lag3(nv_las_vegas) ;
	M12_chg_lv = (nv_las_vegas - lag12(nv_las_vegas))/lag12(nv_las_vegas) ;

	M1_chg_nyc = (ny_new_york - lag(ny_new_york))/lag(ny_new_york) ;
	M3_chg_nyc = (ny_new_york - lag3(ny_new_york))/lag3(ny_new_york) ;
	M12_chg_nyc = (ny_new_york - lag12(ny_new_york))/lag12(ny_new_york) ;

	M1_chg_cle = (oh_cleveland - lag(oh_cleveland))/lag(oh_cleveland) ;
	M3_chg_cle = (oh_cleveland - lag3(oh_cleveland))/lag3(oh_cleveland) ;
	M12_chg_cle = (oh_cleveland - lag12(oh_cleveland))/lag12(oh_cleveland) ;

	M1_chg_por = (or_portland - lag(or_portland))/lag(or_portland) ;
	M3_chg_por = (or_portland - lag3(or_portland))/lag3(or_portland) ;
	M12_chg_por = (or_portland - lag12(or_portland))/lag12(or_portland) ;

	M1_chg_dal = (tx_dallas - lag(tx_dallas))/lag(tx_dallas) ;
	M3_chg_dal = (tx_dallas - lag3(tx_dallas))/lag3(tx_dallas) ;
	M12_chg_dal = (tx_dallas - lag12(tx_dallas))/lag12(tx_dallas) ;

	M1_chg_sea = (wa_seattle - lag(wa_seattle))/lag(wa_seattle) ;
	M3_chg_sea = (wa_seattle - lag3(wa_seattle))/lag3(wa_seattle) ;
	M12_chg_sea = (wa_seattle - lag12(wa_seattle))/lag12(wa_seattle) ;

	M1_chg_10 = (composite_10 - lag(composite_10))/lag(composite_10) ;
	M3_chg_10 = (composite_10 - lag3(composite_10))/lag3(composite_10) ;
	M12_chg_10 = (composite_10 - lag12(composite_10))/lag12(composite_10) ;

	M1_chg_20 = (composite_20 - lag(composite_20))/lag(composite_20) ;
	M3_chg_20 = (composite_20 - lag3(composite_20))/lag3(composite_20) ;
	M12_chg_20 = (composite_20 - lag12(composite_20))/lag12(composite_20) ;

	TCF_Weighted = .3*mn_minneapolis + .1*az_phoenix + .3*mi_detroit + .2*co_denver ; 
	

run ;
;
;
data set2 ; set set1 ; where year >= '01Jan2009'd ; run ;
;

proc transpose data = set2 out= transposed ; run ;

data set3 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M1_chg_phoe M1_chg_la M1_chg_sd M1_chg_sf M1_chg_der M1_chg_dc
		 M1_chg_mia M1_chg_ta M1_chg_atl M1_chg_chi M1_chg_bos M1_chg_det
		 M1_chg_min M1_chg_cha M1_chg_lv M1_chg_nyc M1_chg_cle M1_chg_por
		 M1_chg_dal M1_chg_sea M1_chg_10 M1_chg_20
	;
run ;
;

proc transpose data = set3 out= Transposed_m1 ; run ;
;
data set4 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M3_chg_phoe M3_chg_la M3_chg_sd M3_chg_sf M3_chg_der M3_chg_dc
		 M3_chg_mia M3_chg_ta M3_chg_atl M3_chg_chi M3_chg_bos M3_chg_det
		 M3_chg_min M3_chg_cha M3_chg_lv M3_chg_nyc M3_chg_cle M3_chg_por
		 M3_chg_dal M3_chg_sea M3_chg_10 M3_chg_20
	;
run ;
;

proc transpose data = set4 out= Transposed_m3 ; run ;
;
data set4 ; set set1 nobs=maxobs  ; 
	if _n_ = maxobs ; 
	keep M12_chg_phoe M12_chg_la M12_chg_sd M12_chg_sf M12_chg_der M12_chg_dc
		 M12_chg_mia M12_chg_ta M12_chg_atl M12_chg_chi M12_chg_bos M12_chg_det
		 M12_chg_min M12_chg_cha M12_chg_lv M12_chg_nyc M12_chg_cle M12_chg_por
		 M12_chg_dal M12_chg_sea M12_chg_10 M12_chg_20
	;
run ;
;

proc transpose data = set4 out= Transposed_m12 prefix=M12 ; run ;
