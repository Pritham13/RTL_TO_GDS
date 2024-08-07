# Mod N up down counter 
## RTL
``` verilog
module mod_N_counter #(parameter WIDTH = 2 ,parameter N = 3)(
  input i_clk,
  input i_rst,
  input i_en,
  input i_up_down,
  output reg [WIDTH-1:0] o_Q
);

always @ (posedge i_clk or posedge i_rst) begin
  if (i_rst) // Active high reset
    o_Q <= 0;
  else if (i_en) begin
    if (i_up_down)
      o_Q <= (o_Q == N-1) ? 0 : (o_Q + 1); // Up counter logic
    else
      o_Q <= (o_Q == 0) ? (N-1) : (o_Q - 1); // Down counter logic
  end
end

endmodule

```
## Testbench

```verilog
`timescale 1ns / 1ps
`include "mod_N_counter_1.sv"

module tb_mod_N_counter;

parameter WIDTH = 2;
parameter N = 3;

// Inputs
reg i_clk;
reg i_rst;
reg i_en;
reg i_up_down;

// Outputs
wire [WIDTH-1:0] o_Q;

mod_N_counter #(WIDTH, N) uut (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_en(i_en),
    .i_up_down(i_up_down),
    .o_Q(o_Q)
);

// Clock generation
initial begin
    i_clk = 0;
    forever #5 i_clk = ~i_clk; // 10ns period
end

initial begin
    // Initialize inputs
    i_rst = 0;
    i_en = 0;
    i_up_down = 0;

    // Apply reset
    #10 i_rst = 1;
    #10 i_rst = 0;

    // Enable counter and set to increment mode
    #10 i_en = 1;
    i_up_down = 1;

    #50;

    // Set to decrement mode
    i_up_down = 0;

    #50;

    // Disable counter
    i_en = 0;

    // Let it idle for a few cycles
    #10;
    
    i_en = 1;


    // Apply reset 
    #10 i_rst = 1;
    #10 i_rst = 0;

    // Enable counter and set to increment mode
    #10 i_en = 1;
    i_up_down = 1;

    #50;

    // Finish simulation
    $finish;
end
initial begin
  $dumpfile("waves.vcd");
  $dumpvars();
end
endmodule
```
## Constraints 
```tcl 
#setting up clock , - wave{first rise edge , first fall edge}
create_clock -period 5 -name clk [get_ports clk] -wave{0,5};
#uncomment the following to set latency if 3ns to the clock 
#set_clock_latency 3 clk

#uncomment the following line to set jitter and skew 
#set_clock_uncertainty 0.5 clk

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
#setting up max and min input transistion 
set_output_load -max 80 [get_ports o_Q];
set_output_load -min 20 [get_ports o_Q];
```
## Simulation screenshot
[!simulation screenshot](img/counter_results.png)
