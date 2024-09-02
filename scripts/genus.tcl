set_attribute init_hdl_search_path rtl/
set_attribute init_lib_search_path libs/
#set_attr library libs/slow.lib
set_attr library sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib
read_hdl {mod_N_counter_FSM_2.v}
elaborate
read_sdc constraints/constraints.sdc 
synthesize -to_mapped -effort high
report area > area_reports/area.rpt 
report timing > timing_reports/timing.rpt 
write_hdl > netlists/genus_netlist.v
