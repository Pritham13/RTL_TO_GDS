module mod_N_counter #(parameter WIDTH = 3 ,parameter N = 6)(
  input i_clk,
  input i_rst,
  input i_en,
  input i_up_down,
  output reg [WIDTH-1:0] o_Q
  );
parameter [2:0] RST = 3'b000,
                INCREMENT = 3'b011,
                DECREMENT = 3'b010,
                IDLE = 3'b111,
                WRAP = 3'b110;

reg [2:0]state,next;
// sequential asysnchronous reset 
always @ (posedge i_clk or posedge i_rst) begin
  state <= (i_rst) ? RST : next;
end
// combinational always state assginment 
always @ (state or next or i_en or i_up_down) begin
  case (state)
    //RST : next = ((!i_en) || i_rst)? ((! i_en) ? IDLE : RST) : { i_rst , i_en , i_up_down};
    RST : next = i_en ? (i_up_down ? INCREMENT : DECREMENT) : IDLE;
    
    INCREMENT : begin  
      next = i_en ? (i_up_down ? INCREMENT : DECREMENT) : IDLE;
      next = (o_Q == N-1) ? WRAP : next;
    end 
    
    DECREMENT : begin  
      next = i_en ? (i_up_down ? INCREMENT : DECREMENT) : IDLE;
      next = (o_Q == 0) ? WRAP : next;
    end 
    
    WRAP : begin  
      next = i_en ? (i_up_down ? INCREMENT : DECREMENT) : IDLE;
      next = (o_Q == N-1) ? WRAP : next;
    end 
    
    IDLE : next = i_en ? (i_up_down ? INCREMENT : DECREMENT) : IDLE;
       default: next = RST;
  endcase
end
// sequential output assignment 
always @ (posedge i_clk) begin
  case (state)
    RST : o_Q <=0;

    INCREMENT : o_Q <= o_Q + 1;

    DECREMENT : o_Q <= o_Q - 1;

    WRAP : o_Q <= (o_Q == N-1) ? 0 : N-1;

    IDLE : o_Q <= o_Q ;

    default : o_Q <=0;
  endcase
end
endmodule
