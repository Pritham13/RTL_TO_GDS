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

