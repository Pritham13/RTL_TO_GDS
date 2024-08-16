/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Aug 16 13:07:19 2024
/////////////////////////////////////////////////////////////


module mod_N_counter ( i_clk, i_rst, i_en, i_up_down, o_Q );
  output [2:0] o_Q;
  input i_clk, i_rst, i_en, i_up_down;
  wire   n45, n46, n47, n19, n20, n21, n66, n67, n68, n69, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88;
  wire   [2:0] state;
  wire   [2:0] next;

  sky130_fd_sc_hd__dfrtp_1 \state_reg[0]  ( .D(next[0]), .CLK(i_clk), 
        .RESET_B(n69), .Q(state[0]) );
  sky130_fd_sc_hd__dfrtp_1 \state_reg[2]  ( .D(next[2]), .CLK(i_clk), 
        .RESET_B(n69), .Q(state[2]) );
  sky130_fd_sc_hd__dfxtp_1 \o_Q_reg[2]  ( .D(n20), .CLK(i_clk), .Q(n45) );
  sky130_fd_sc_hd__dfxtp_1 \o_Q_reg[1]  ( .D(n19), .CLK(i_clk), .Q(n46) );
  sky130_fd_sc_hd__dfxtp_1 \o_Q_reg[0]  ( .D(n21), .CLK(i_clk), .Q(n47) );
  sky130_fd_sc_hd__dfrbp_1 \state_reg[1]  ( .D(next[1]), .CLK(i_clk), 
        .RESET_B(n69), .Q(state[1]), .Q_N(n88) );
  sky130_fd_sc_hd__buf_8 U51 ( .A(i_up_down), .X(n66) );
  sky130_fd_sc_hd__buf_8 U52 ( .A(i_en), .X(n67) );
  sky130_fd_sc_hd__buf_8 U53 ( .A(i_rst), .X(n68) );
  sky130_fd_sc_hd__clkinv_1 U54 ( .A(state[2]), .Y(n74) );
  sky130_fd_sc_hd__clkinv_1 U55 ( .A(n68), .Y(n69) );
  sky130_fd_sc_hd__clkinv_1 U56 ( .A(state[0]), .Y(n84) );
  sky130_fd_sc_hd__clkinv_1 U57 ( .A(n75), .Y(n81) );
  sky130_fd_sc_hd__clkinv_1 U58 ( .A(n45), .Y(n80) );
  sky130_fd_sc_hd__buf_8 U59 ( .A(n45), .X(o_Q[2]) );
  sky130_fd_sc_hd__buf_8 U60 ( .A(n46), .X(o_Q[1]) );
  sky130_fd_sc_hd__buf_8 U61 ( .A(n47), .X(o_Q[0]) );
  sky130_fd_sc_hd__o22ai_1 U62 ( .A1(state[0]), .A2(state[2]), .B1(n84), .B2(
        n88), .Y(next[1]) );
  sky130_fd_sc_hd__nor2b_1 U63 ( .B_N(next[1]), .A(n67), .Y(next[2]) );
  sky130_fd_sc_hd__a21o_1 U64 ( .A1(n66), .A2(next[1]), .B1(next[2]), .X(
        next[0]) );
  sky130_fd_sc_hd__nand2_1 U65 ( .A(state[0]), .B(n47), .Y(n82) );
  sky130_fd_sc_hd__nand2_1 U66 ( .A(n47), .B(n74), .Y(n85) );
  sky130_fd_sc_hd__nand2_1 U67 ( .A(n85), .B(state[1]), .Y(n73) );
  sky130_fd_sc_hd__a21oi_1 U68 ( .A1(n82), .A2(state[2]), .B1(n73), .Y(n21) );
  sky130_fd_sc_hd__nor3_1 U69 ( .A(state[0]), .B(n47), .C(n46), .Y(n75) );
  sky130_fd_sc_hd__a32oi_1 U70 ( .A1(n82), .A2(n74), .A3(n81), .B1(state[2]), 
        .B2(state[0]), .Y(n79) );
  sky130_fd_sc_hd__a31oi_1 U71 ( .A1(n47), .A2(state[0]), .A3(n46), .B1(n75), 
        .Y(n76) );
  sky130_fd_sc_hd__nor2_1 U72 ( .A(state[2]), .B(n76), .Y(n77) );
  sky130_fd_sc_hd__o21ai_1 U73 ( .A1(n77), .A2(n45), .B1(state[1]), .Y(n78) );
  sky130_fd_sc_hd__a21oi_1 U74 ( .A1(n45), .A2(n79), .B1(n78), .Y(n20) );
  sky130_fd_sc_hd__o32ai_1 U75 ( .A1(n45), .A2(n46), .A3(n82), .B1(n81), .B2(
        n80), .Y(n83) );
  sky130_fd_sc_hd__a31oi_1 U76 ( .A1(n47), .A2(n46), .A3(n84), .B1(n83), .Y(
        n87) );
  sky130_fd_sc_hd__nand3_1 U77 ( .A(n46), .B(state[0]), .C(n85), .Y(n86) );
  sky130_fd_sc_hd__a221oi_1 U78 ( .A1(n87), .A2(n86), .B1(state[2]), .B2(n86), 
        .C1(n88), .Y(n19) );
endmodule

