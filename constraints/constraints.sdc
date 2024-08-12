set sdc_version 2.1

#setting up clock , - wave{first rise edge , first fall edge}
create_clock -period 5 -name clk [get_ports clk] -waveform 0 , 5;
#uncomment the following to set latency if 3ns to the clock 
set_clock_latency 3 clk

#uncomment the following line to set jitter and skew 
set_clock_uncertainty 0.5 clk

#####setting IO paths ##########
#setting up max and min input delay
set_input_delay -max 3 -clock [get_clocks clk][get_portsIN_*];
set_input_delay -min 3 -clock [get_clocks clk][get_portsIN_*];
#setting up max and min input transistion 
set_input_transition -max 1.5 [get_portsIN_*];
set_input_transition -min 7.5 [get_portsIN_*];


#setting up max and min input delay
set_output_delay -max 3 -clock [get_clocks clk][get_ports o_Q];
set_output_delay -min 0.5 -clock [get_clocks clk][get_ports o_Q];

