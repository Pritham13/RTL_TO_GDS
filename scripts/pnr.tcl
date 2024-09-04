setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteSpreadWire 1
setNanoRouteMode -quiet -droutePostRouteWidenWireRule LEFSpecialRouteSpec
setNanoRouteMode -quiet -timingEngine {}
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X4 DLY3X1 DLY2X1 BUFX6 DLY4X1 DLY1X1 CLKBUFX3 BUFX8 DLY3X4 DLY2X4 DLY1X4 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX20 CLKBUFX2 CLKBUFX16 CLKBUFX12 BUFX4 BUFX3 BUFX20 BUFX2 BUFX16 BUFX12 INVXL INVX8 INVX16 INVX6 INVX4 INVX20 CLKINVX8 INVX3 INVX2 INVX12 INVX1 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX20 CLKINVX2 CLKINVX16 CLKINVX12 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -clkGateAware 1 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 0 -placeIOPins 1 -moduleAwareSpare 0 -preserveRouting 1 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DLY4X4 DLY3X1 DLY2X1 BUFX6 DLY4X1 DLY1X1 CLKBUFX3 BUFX8 DLY3X4 DLY2X4 DLY1X4 CLKBUFX8 CLKBUFX6 CLKBUFX4 CLKBUFX20 CLKBUFX2 CLKBUFX16 CLKBUFX12 BUFX4 BUFX3 BUFX20 BUFX2 BUFX16 BUFX12 INVXL INVX8 INVX16 INVX6 INVX4 INVX20 CLKINVX8 INVX3 INVX2 INVX12 INVX1 CLKINVX6 CLKINVX4 CLKINVX3 CLKINVX20 CLKINVX2 CLKINVX16 CLKINVX12 CLKINVX1} -maxAllowedDelay 1
setPlaceMode -fp false
place_design
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

######nanoroute...........turnoff Fix antenna
#
## Enables timing-driven routing, which optimizes the layout based on timing constraints.
#setNanoRouteMode -quiet -routeWithTimingDriven 1 
## enabling signal integrity based routing 
#setNanoRouteMode -quiet -routeWithSiDriven 1
#setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
#setNanoRouteMode -quiet -drouteStartIteration default
#setNanoRouteMode -quiet -routeTopRoutingLayer default
#setNanoRouteMode -quiet -routeBottomRoutingLayer default
#setNanoRouteMode -quiet -drouteEndIteration default
#setNanoRouteMode -quiet -routeWithTimingDriven true
#setNanoRouteMode -quiet -routeWithSiDriven true
#routeDesign -globalDetail

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
