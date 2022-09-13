## This file is a simplified .xdc for the Zybo Z7-20
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

##Clock signal
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { H_125 }]; 
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { H_125 }];


##Switches
#set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; 
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; 
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; 
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; 


##Buttons
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]; 
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; 
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]; 
#set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]; 


##LEDs
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; 
#set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; 
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; 
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; 


##RGB LED 5 
#set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { led5_r }]; 
#set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { led5_g }]; 
#set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { led5_b }]; 

##RGB LED 6
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { led6_r }]; 
#set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { led6_g }]; 
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { led6_b }]; 

##Fan 
#set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS33  PULLUP true    } [get_ports { fan_fb_pu }]; 


##Pmod Header JA (XADC)
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { ja[0] }]; 		   
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { ja[1] }];           
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { ja[2] }];     
#set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { ja[3] }];        
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { IR_Ana_D_div }];       
#set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { IR_Ana_G_div }];           
#set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { US_Ana_div }];           
#set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { ja[7] }];             
 

##Pmod Header JB 
     
#set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33     } [get_ports { Cod_3_B_jp }];        
#set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33     } [get_ports { Couleur_PWM }];        
#set_property -dict { PACKAGE_PIN Y7    IOSTANDARD LVCMOS33     } [get_ports { Couleur_S1 }];     
#set_property -dict { PACKAGE_PIN Y6    IOSTANDARD LVCMOS33     } [get_ports { Ligne_D }];      
#set_property -dict { PACKAGE_PIN V6    IOSTANDARD LVCMOS33     } [get_ports { Ligne_M }];         
#set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33     } [get_ports { Ligne_G }];           
                                                                                                                                 
                                                                                                                                 
##Pmod Header JC                                                                                                                  
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33     } [get_ports { Servo_PWM_2 }]; 		 
#set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33     } [get_ports { Mot_PWM_3 }]; 	     
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33     } [get_ports { Couleur_S0 }];   
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33     } [get_ports { Mot_Dir_3 }];  
                                                                                                                                 
                                                                                                                                 
##Pmod Header JD                                                                                                                  

#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33     } [get_ports { Servo_PWM_4 }]; 		 
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33     } [get_ports { Couleur_S3 }];   
#set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33     } [get_ports { Couleur_LED }];    
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33     } [get_ports { US_PWM }];    
#set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33     } [get_ports { Servo_PWM_3 }];        
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33     } [get_ports { Servo_PWM_1 }];        
#set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33     } [get_ports { Couleur_S2 }];          
                                                                                                                                 
                                                                                                                                 
##Pmod Header JE                                                                                                                  
#set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { Choc_D }]; 						                   
#set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { Cod_3_A }];                       
#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { UART_Zynq_TX }];                      
#set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { Cod_4_A }];              
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { Cod_4_B }];               
#set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { Choc_G }];                    
#set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { UART_Zynq_RX }];                    

set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33     } [get_ports { Cod_G_A }]; 	 
set_property -dict { PACKAGE_PIN W8    IOSTANDARD LVCMOS33     } [get_ports { Cod_G_B }];   
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33     } [get_ports { Cod_D_A }];   
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33     } [get_ports { Cod_D_B }];     

set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33     } [get_ports { Mot_Dir_G }]; 
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33     } [get_ports { Mot_PWM_G }];      
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33     } [get_ports { Mot_PWM_D }]; 
set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33     } [get_ports { Mot_Dir_D }];      
