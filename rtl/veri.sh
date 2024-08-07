#!/usr/bin/zsh

# echo "Enter the tb name";
# read tb;
tb=mod_N_counter_tb.sv
iverilog $tb;
./a.out;
vcd=$(grep ".vcd" $tb | cut -d'"' -f2);
echo $vcd;

gtkwave $vcd;
echo $vcd;
rm $vcd;
rm a.out;
