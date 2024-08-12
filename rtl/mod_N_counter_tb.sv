`timescale 1ns / 1ps
`include "mod_N_counter_FSM_2.sv"

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

