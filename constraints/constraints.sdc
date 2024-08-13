create_clock -name my_clk -period 10 [get_ports i_clk]

set_clock_latency 1 my_clk

set_clock_uncertainty 0.25 my_clk

set_input_delay -max 3 -clock [get_clocks my_clk] [get_ports i_rst]
set_input_delay -max 3 -clock [get_clocks my_clk] [get_ports i_en]
set_input_delay -max 3 -clock [get_clocks my_clk] [get_ports i_up_down]

set_input_delay -min 0.25 -clock [get_clocks my_clk] [get_ports i_rst]
set_input_delay -min 0.25 -clock [get_clocks my_clk] [get_ports i_en]
set_input_delay -min 0.25 -clock [get_clocks my_clk] [get_ports i_up_down]

set_input_transition -max 1.7 [get_ports i_rst]
set_input_transition -max 1.7 [get_ports i_en]
set_input_transition -max 1.7 [get_ports i_up_down]

set_input_transition -min 0.5 [get_ports i_rst]
set_input_transition -min 0.5 [get_ports i_en]
set_input_transition -min 0.5 [get_ports i_up_down]

set_output_delay -max 3 -clock [get_clocks my_clk] [get_ports o_Q]
set_output_delay -min 0.5 -clock [get_clocks my_clk] [get_ports o_Q]

set_load -max 2.5 [get_ports o_Q];
set_load -min 0.5 [get_ports o_Q];
