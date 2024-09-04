setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -powerDriven 0 -placeIOPins 1 
### Placement of Standard Cells.....without any optimization......
setPlaceMode -fp false
#setPlaceMode -placeIoPins true
placeDesign -noPrePlaceOpt
#place_opt_design
### Setting for preCTS......
setDelayCalMode -siAware false
timeDesign -preCTS 
report_timing 
optDesign -preCTS 

#########Clock Tree synthesis
create_ccopt_clock_tree_spec
ccopt_design
### Post CTS Optimization.....
timeDesign -postCTS
optDesign -postCTS
timeDesign -postCTS

#####nanoroute...........turnoff Fix antenna

setNanoRouteMode -quiet -timingEngine {}
# Enables timing-driven routing, which optimizes the layout based on timing constraints.
setNanoRouteMode -quiet -routeWithTimingDriven 1 
# enabling signal integrity based routing 
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail

### Post Route Anlysis.......0.0
setAnalysisMode -analysisType onChipVariation
timeDesign -postRoute
## optional when there is any violation....
 optDesign -postRoute -hold

timeDesign -postRoute 
report_timing
setAnalysisMode -checkType hold
report_timing 
report_power
report_constraint -all_violators
report_ccopt_skew_groups
