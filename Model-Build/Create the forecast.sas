/* Create the forecast for the Fed Scenarios in SAS */

/* input data for 00 - 30 : Model_Builds_0_2_30_data_1st_2nd */

/* input data for 30 - 60 : Model_Builds_30_2_60_data_1st_2n */

 

%Let LossData = Model_Builds_0_2_30_data_1st_2nd ;

     proc sql; create table merge_00 as

           select * , coalesce(a.date,b.date)

        label='Date' as Date2 format date9.

           from work.&LossData. as a

           full join work.fed_stress_test_data as b

           on a.date = b.date

           order by date2

     ; quit ;

 

%Let Fed_HPI = Fed_HPI_Severe_Adverse ; /* Fed_HPI_Baseline , Fed_HPI__Adverse , Fed_HPI_Severe_Adverse , TCF_HPI__Baseline */

%Let Fed_Un  = Fed_Un_Severe_Adverse ; /* Fed_Un_Baseline , Fed_Un_Adverse , Fed_Un_Severe_Adverse , TCF_Un_Baseline */  

     data merge_01 ; set merge_00 ;

           hpi_fx = hpi ; unemp_fx = unemp ;

           if date2 >= '01OCT2013'd then do ;

                hpi_fx = &Fed_HPI. ;

                unemp_fx = &Fed_Un. ;

           end ;

     run ;

 

 

/* 00 to 30 */

 

     /* Fed Base */

 

     data First_D1_1 ; set merge_01 ;

           HPI18mcp = log(hpi_fx/lag18(hpi_fx)) ;

           Unempl9 = lag9(unemp_fx) ;

           first_fx = -0.001439499 + -0.007293752*HPI18mcp + 0.001003968*Unempl9 ;

           HPI12mcpl3 = lag3( log(hpi_fx/lag12(hpi_fx) ) );

           second_fx = -0.000988623 + -0.006379796*HPI12mcpl3 + 0.000684269*Unempl9  ;

     run ;

 

     /* Fed Adverse */

     data First_D1_2 ; set merge_01 ;

           HPI18mcp = log(hpi_fx/lag18(hpi_fx)) ;

           Unempl9 = lag9(unemp_fx) ;

           first_fx = -0.001439499 + -0.007293752*HPI18mcp + 0.001003968*Unempl9 ;

           HPI12mcpl3 = lag3( log(hpi_fx/lag12(hpi_fx) ) );

           second_fx = -0.000988623 + -0.006379796*HPI12mcpl3 + 0.000684269*Unempl9  ;

     run ;

 

 

     /* Fed Adverse Severe */

     data First_D1_3 ; set merge_01 ;

           HPI18mcp = log(hpi_fx/lag18(hpi_fx)) ;

           Unempl9 = lag9(unemp_fx) ;

           first_fx = -0.001439499 + -0.007293752*HPI18mcp + 0.001003968*Unempl9 ;

           HPI12mcpl3 = lag3( log(hpi_fx/lag12(hpi_fx) ) );

           second_fx = -0.000988623 + -0.006379796*HPI12mcpl3 + 0.000684269*Unempl9  ;

     run ;

    

/*30 to 60 */

 

     /* Fed Base */

     data First_D2_1 ; set merge_01 ;

           HPI18mcp = log( hpi_fx/lag18(hpi_fx) ) ;

           Unempl3 = lag3(unemp_fx) ;

           first_fx = 0.242614292 + -0.619897163*HPI18mcp + 0.013112782*Unempl3 ;

           HPI12mcp = log(hpi_fx/lag12(hpi_fx) );

           second_fx = 0.205472375 + -0.766427679*HPI12mcp + 0.028314583*Unempl3  ;

     run ;

 

     /* Fed Adverse */

     data First_D2_2 ; set merge_01 ;

           HPI18mcp = log( hpi_fx/lag18(hpi_fx) ) ;

           Unempl3 = lag3(unemp_fx) ;

           first_fx = 0.242614292 + -0.619897163*HPI18mcp + 0.013112782*Unempl3 ;

           HPI12mcp = log(hpi_fx/lag12(hpi_fx) );

           second_fx = 0.205472375 + -0.766427679*HPI12mcp + 0.028314583*Unempl3  ;

     run ;

 

     /* Fed Adverse Severe */

     data First_D2_3 ; set merge_01 ;

           HPI18mcp = log( hpi_fx/lag18(hpi_fx) ) ;

           Unempl3 = lag3(unemp_fx) ;

           first_fx = 0.242614292 + -0.619897163*HPI18mcp + 0.013112782*Unempl3 ;

           HPI12mcp = log(hpi_fx/lag12(hpi_fx) );

           second_fx = 0.205472375 + -0.766427679*HPI12mcp + 0.028314583*Unempl3  ;

     run ;

 

 

/* 60 to 90 - if models are ever created */
