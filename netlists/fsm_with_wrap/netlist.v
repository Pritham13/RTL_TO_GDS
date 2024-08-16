/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Aug 16 12:51:29 2024
/////////////////////////////////////////////////////////////


module mod_N_counter ( i_clk, i_rst, i_en, i_up_down, o_Q );
  output [2:0] o_Q;
  input i_clk, i_rst, i_en, i_up_down;
  wire   n70, n71, n72, \next[1] , n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n67, n68, n69;
  wire   [2:0] state;

  sky130_fd_sc_hd__dfrtp_1 \state_reg[2]  ( .D(n36), .CLK(i_clk), .RESET_B(n31), .Q(state[2]) );
  sky130_fd_sc_hd__dfrtp_1 \state_reg[0]  ( .D(n35), .CLK(i_clk), .RESET_B(n31), .Q(state[0]) );
  sky130_fd_sc_hd__dfxbp_1 \o_Q_reg[1]  ( .D(n32), .CLK(i_clk), .Q(n71), .Q_N(
        n69) );
  sky130_fd_sc_hd__dfxbp_1 \o_Q_reg[2]  ( .D(n33), .CLK(i_clk), .Q(n70) );
  sky130_fd_sc_hd__dfxbp_1 \o_Q_reg[0]  ( .D(n34), .CLK(i_clk), .Q(n72), .Q_N(
        n68) );
  sky130_fd_sc_hd__dfrbp_1 \state_reg[1]  ( .D(\next[1] ), .CLK(i_clk), 
        .RESET_B(n31), .Q(state[1]), .Q_N(n67) );
  sky130_fd_sc_hd__buf_8 U40 ( .A(i_up_down), .X(n37) );
  sky130_fd_sc_hd__buf_8 U41 ( .A(i_en), .X(n38) );
  sky130_fd_sc_hd__buf_8 U42 ( .A(i_rst), .X(n39) );
  sky130_fd_sc_hd__clkinv_1 U43 ( .A(n38), .Y(n47) );
  sky130_fd_sc_hd__buf_8 U44 ( .A(n71), .X(o_Q[1]) );
  sky130_fd_sc_hd__buf_8 U45 ( .A(n70), .X(o_Q[2]) );
  sky130_fd_sc_hd__clkinv_1 U46 ( .A(state[0]), .Y(n58) );
  sky130_fd_sc_hd__clkinv_1 U47 ( .A(n65), .Y(n54) );
  sky130_fd_sc_hd__clkinv_1 U48 ( .A(n39), .Y(n31) );
  sky130_fd_sc_hd__buf_8 U49 ( .A(n72), .X(o_Q[0]) );
  sky130_fd_sc_hd__o21ai_1 U50 ( .A1(state[0]), .A2(state[2]), .B1(n67), .Y(
        \next[1] ) );
  sky130_fd_sc_hd__nor2_1 U51 ( .A(n67), .B(state[2]), .Y(n65) );
  sky130_fd_sc_hd__nand2_1 U52 ( .A(state[2]), .B(state[1]), .Y(n42) );
  sky130_fd_sc_hd__nor2_1 U53 ( .A(state[0]), .B(n42), .Y(n52) );
  sky130_fd_sc_hd__a21oi_1 U54 ( .A1(n65), .A2(state[0]), .B1(n52), .Y(n45) );
  sky130_fd_sc_hd__nand3_1 U55 ( .A(n70), .B(n72), .C(n69), .Y(n51) );
  sky130_fd_sc_hd__nor4_1 U56 ( .A(n71), .B(n70), .C(state[0]), .D(state[2]), 
        .Y(n43) );
  sky130_fd_sc_hd__nand3_1 U57 ( .A(state[1]), .B(n43), .C(n68), .Y(n61) );
  sky130_fd_sc_hd__nand2_1 U58 ( .A(\next[1] ), .B(n47), .Y(n44) );
  sky130_fd_sc_hd__o211ai_1 U59 ( .A1(n45), .A2(n51), .B1(n61), .C1(n44), .Y(
        n36) );
  sky130_fd_sc_hd__nand2_1 U60 ( .A(state[0]), .B(state[2]), .Y(n50) );
  sky130_fd_sc_hd__nor2_1 U61 ( .A(state[0]), .B(state[2]), .Y(n46) );
  sky130_fd_sc_hd__o21ai_1 U62 ( .A1(n46), .A2(n51), .B1(n61), .Y(n49) );
  sky130_fd_sc_hd__o21ai_1 U63 ( .A1(n37), .A2(n47), .B1(\next[1] ), .Y(n48)
         );
  sky130_fd_sc_hd__a21oi_1 U64 ( .A1(n50), .A2(n49), .B1(n48), .Y(n35) );
  sky130_fd_sc_hd__nand3_1 U65 ( .A(state[0]), .B(state[2]), .C(state[1]), .Y(
        n53) );
  sky130_fd_sc_hd__nand2_1 U66 ( .A(n52), .B(n51), .Y(n60) );
  sky130_fd_sc_hd__o221ai_1 U67 ( .A1(n72), .A2(n54), .B1(n68), .B2(n53), .C1(
        n60), .Y(n34) );
  sky130_fd_sc_hd__o22ai_1 U68 ( .A1(state[0]), .A2(n72), .B1(n58), .B2(n68), 
        .Y(n64) );
  sky130_fd_sc_hd__o21ai_1 U69 ( .A1(n54), .A2(n64), .B1(n53), .Y(n63) );
  sky130_fd_sc_hd__nor2_1 U70 ( .A(n69), .B(n58), .Y(n56) );
  sky130_fd_sc_hd__o21ai_1 U71 ( .A1(n68), .A2(n70), .B1(n56), .Y(n55) );
  sky130_fd_sc_hd__o211ai_1 U72 ( .A1(n70), .A2(n56), .B1(n65), .C1(n55), .Y(
        n57) );
  sky130_fd_sc_hd__a21oi_1 U73 ( .A1(n69), .A2(n58), .B1(n57), .Y(n59) );
  sky130_fd_sc_hd__a21oi_1 U74 ( .A1(n70), .A2(n63), .B1(n59), .Y(n62) );
  sky130_fd_sc_hd__nand3_1 U75 ( .A(n62), .B(n61), .C(n60), .Y(n33) );
  sky130_fd_sc_hd__a32o_1 U76 ( .A1(n65), .A2(n69), .A3(n64), .B1(n71), .B2(
        n63), .X(n32) );
endmodule

