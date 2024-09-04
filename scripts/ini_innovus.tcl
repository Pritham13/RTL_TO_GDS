set init_gnd_net VSS
set init_lef_file {/opt/PDKs/digital/45nm/dig/lef/gsclib045_tech.lef /opt/PDKs/digital/45nm/dig/lef/gsclib045_macro.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/alu.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/arith.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/controller.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/datamemory.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/insmemory.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/insreg.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/logic.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/muxa.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/muxb.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/pc.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/rega.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/regb.lef /home/student/cadWorkDir/myProjects/Digital/ALU/lef/regc.lef }
set init_verilog netlists/genus_netlist.v
set init_mmmc_file MMMC_files/Default.view
set init_pwr_net VDD
init_design
floorPlan -site CoreSite -r 0.971590909091 0.7 5.0 5.0 5.0 5.0
