set_attribute init_hdl_search_path rtl/
set_attribute init_lib_search_path sky130hd/
set_attr library sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib
read_hdl {mod_N_counter_FSM_2.v}
read_sdc constraints/constraints.sdc 
elaborate
synthesize -to_mapped -effort high

report area > area.rpt 
report timing > timing.rpt 
write_hdl  GLS_netlist.v
