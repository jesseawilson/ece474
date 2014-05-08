
module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [9:0] carry;
  wire   [8:0] B_AS;
  assign carry[0] = ADD_SUB;

  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(carry[0]), .IN2(carry[8]), .Q(SUM[8]) );
  XOR2X1 U2 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U3 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U4 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U5 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U6 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U7 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U8 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U9 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, opcode, alu_out, alu_zero, alu_carry );
  input [7:0] in_a;
  input [7:0] in_b;
  input [3:0] opcode;
  output [7:0] alu_out;
  output alu_zero, alu_carry;
  wire   N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N132, N133,
         N134, N135, N136, N137, \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_2 ,
         \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 , \U3/U1/Z_6 , \U3/U1/Z_7 ,
         \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 , \U3/U2/Z_3 , \U3/U2/Z_4 ,
         \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , \U3/U3/Z_0 , n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148;
  assign alu_out[1] = N132;
  assign alu_out[2] = N133;
  assign alu_out[3] = N134;
  assign alu_out[4] = N135;
  assign alu_out[5] = N136;
  assign alu_out[6] = N137;

  alu_DW01_addsub_0 r32 ( .A({1'b0, \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .B(
        {1'b0, \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , \U3/U2/Z_4 , \U3/U2/Z_3 , 
        \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), .CI(1'b0), .ADD_SUB(
        \U3/U3/Z_0 ), .SUM({N96, N95, N94, N93, N92, N91, N90, N89, N88}) );
  AND2X1 U86 ( .IN1(N95), .IN2(n74), .Q(n73) );
  MUX41X1 U87 ( .IN1(in_a[2]), .IN3(n147), .IN2(in_a[0]), .IN4(N89), .S0(
        opcode[1]), .S1(opcode[0]), .Q(n78) );
  MUX41X1 U88 ( .IN1(in_a[3]), .IN3(n146), .IN2(in_a[1]), .IN4(N90), .S0(
        opcode[1]), .S1(opcode[0]), .Q(n83) );
  MUX41X1 U89 ( .IN1(in_a[4]), .IN3(n145), .IN2(in_a[2]), .IN4(N91), .S0(
        opcode[1]), .S1(opcode[0]), .Q(n88) );
  MUX41X1 U90 ( .IN1(in_a[5]), .IN3(n144), .IN2(in_a[3]), .IN4(N92), .S0(
        opcode[1]), .S1(opcode[0]), .Q(n93) );
  MUX41X1 U91 ( .IN1(in_a[6]), .IN3(n143), .IN2(in_a[4]), .IN4(N93), .S0(
        opcode[1]), .S1(opcode[0]), .Q(n98) );
  MUX41X1 U92 ( .IN1(in_a[7]), .IN3(n142), .IN2(in_a[5]), .IN4(N94), .S0(
        opcode[1]), .S1(opcode[0]), .Q(n103) );
  MUX41X1 U93 ( .IN1(N88), .IN3(N104), .IN2(N112), .IN4(N120), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n113) );
  MUX41X1 U94 ( .IN1(N89), .IN3(N103), .IN2(N111), .IN4(N119), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n82) );
  MUX41X1 U95 ( .IN1(N90), .IN3(N102), .IN2(N110), .IN4(N118), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n87) );
  MUX41X1 U96 ( .IN1(N91), .IN3(N101), .IN2(N109), .IN4(N117), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n92) );
  MUX41X1 U97 ( .IN1(N92), .IN3(N100), .IN2(N108), .IN4(N116), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n97) );
  MUX41X1 U98 ( .IN1(N93), .IN3(N99), .IN2(N107), .IN4(N115), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n102) );
  MUX41X1 U99 ( .IN1(N94), .IN3(N98), .IN2(N106), .IN4(N114), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n107) );
  MUX41X1 U100 ( .IN1(N95), .IN3(N97), .IN2(N105), .IN4(N113), .S0(opcode[0]), 
        .S1(opcode[1]), .Q(n77) );
  OR2X1 U101 ( .IN1(opcode[0]), .IN2(opcode[1]), .Q(n74) );
  MUX21X1 U102 ( .IN1(n85), .IN2(n86), .S(opcode[2]), .Q(N133) );
  MUX21X1 U103 ( .IN1(n84), .IN2(n83), .S(opcode[3]), .Q(n85) );
  AND2X1 U104 ( .IN1(n87), .IN2(n114), .Q(n86) );
  AND2X1 U105 ( .IN1(N90), .IN2(n74), .Q(n84) );
  MUX21X1 U106 ( .IN1(n105), .IN2(n106), .S(opcode[2]), .Q(N137) );
  MUX21X1 U107 ( .IN1(n104), .IN2(n103), .S(opcode[3]), .Q(n105) );
  AND2X1 U108 ( .IN1(n107), .IN2(n114), .Q(n106) );
  AND2X1 U109 ( .IN1(N94), .IN2(n74), .Q(n104) );
  MUX21X1 U110 ( .IN1(n111), .IN2(n112), .S(opcode[2]), .Q(alu_out[0]) );
  MUX21X1 U111 ( .IN1(n109), .IN2(N88), .S(n108), .Q(n111) );
  AND2X1 U112 ( .IN1(n113), .IN2(n114), .Q(n112) );
  MUX21X1 U113 ( .IN1(opcode[1]), .IN2(n114), .S(n69), .Q(n108) );
  MUX21X1 U114 ( .IN1(n90), .IN2(n91), .S(opcode[2]), .Q(N134) );
  MUX21X1 U115 ( .IN1(n89), .IN2(n88), .S(opcode[3]), .Q(n90) );
  AND2X1 U116 ( .IN1(n92), .IN2(n114), .Q(n91) );
  AND2X1 U117 ( .IN1(N91), .IN2(n74), .Q(n89) );
  MUX21X1 U118 ( .IN1(n80), .IN2(n81), .S(opcode[2]), .Q(N132) );
  MUX21X1 U119 ( .IN1(n79), .IN2(n78), .S(opcode[3]), .Q(n80) );
  AND2X1 U120 ( .IN1(n82), .IN2(n114), .Q(n81) );
  AND2X1 U121 ( .IN1(N89), .IN2(n74), .Q(n79) );
  MUX21X1 U122 ( .IN1(n95), .IN2(n96), .S(opcode[2]), .Q(N135) );
  MUX21X1 U123 ( .IN1(n94), .IN2(n93), .S(opcode[3]), .Q(n95) );
  AND2X1 U124 ( .IN1(n97), .IN2(n114), .Q(n96) );
  AND2X1 U125 ( .IN1(N92), .IN2(n74), .Q(n94) );
  MUX21X1 U126 ( .IN1(n100), .IN2(n101), .S(opcode[2]), .Q(N136) );
  MUX21X1 U127 ( .IN1(n99), .IN2(n98), .S(opcode[3]), .Q(n100) );
  AND2X1 U128 ( .IN1(n102), .IN2(n114), .Q(n101) );
  AND2X1 U129 ( .IN1(N93), .IN2(n74), .Q(n99) );
  AND2X1 U130 ( .IN1(opcode[1]), .IN2(n141), .Q(n71) );
  AND2X1 U131 ( .IN1(n110), .IN2(n69), .Q(n109) );
  MUX21X1 U132 ( .IN1(in_a[1]), .IN2(n148), .S(opcode[1]), .Q(n110) );
  MUX21X1 U133 ( .IN1(in_a[6]), .IN2(N95), .S(opcode[1]), .Q(n70) );
  MUX21X1 U134 ( .IN1(n75), .IN2(n76), .S(opcode[2]), .Q(alu_out[7]) );
  MUX21X1 U135 ( .IN1(n73), .IN2(n72), .S(opcode[3]), .Q(n75) );
  AND2X1 U136 ( .IN1(n77), .IN2(n114), .Q(n76) );
  MUX21X1 U137 ( .IN1(n71), .IN2(n70), .S(opcode[0]), .Q(n72) );
  XOR2X1 U138 ( .IN1(opcode[0]), .IN2(opcode[3]), .Q(n69) );
  INVX0 U139 ( .IN(opcode[3]), .QN(n114) );
  NOR4X0 U140 ( .IN1(n115), .IN2(N132), .IN3(N134), .IN4(N133), .QN(alu_zero)
         );
  OR4X1 U141 ( .IN1(N136), .IN2(N135), .IN3(alu_out[0]), .IN4(N137), .Q(n115)
         );
  NAND2X0 U142 ( .IN1(n116), .IN2(n117), .QN(alu_carry) );
  NAND4X0 U143 ( .IN1(opcode[3]), .IN2(opcode[0]), .IN3(n118), .IN4(in_a[7]), 
        .QN(n117) );
  NOR2X0 U144 ( .IN1(opcode[2]), .IN2(opcode[1]), .QN(n118) );
  NAND2X0 U145 ( .IN1(N96), .IN2(n119), .QN(n116) );
  OR2X1 U146 ( .IN1(n120), .IN2(n121), .Q(n119) );
  NOR2X0 U147 ( .IN1(n122), .IN2(n123), .QN(\U3/U2/Z_7 ) );
  NOR2X0 U148 ( .IN1(n122), .IN2(n124), .QN(\U3/U2/Z_6 ) );
  NOR2X0 U149 ( .IN1(n122), .IN2(n125), .QN(\U3/U2/Z_5 ) );
  NOR2X0 U150 ( .IN1(n122), .IN2(n126), .QN(\U3/U2/Z_4 ) );
  NOR2X0 U151 ( .IN1(n122), .IN2(n127), .QN(\U3/U2/Z_3 ) );
  NOR2X0 U152 ( .IN1(n122), .IN2(n128), .QN(\U3/U2/Z_2 ) );
  NOR2X0 U153 ( .IN1(n122), .IN2(n129), .QN(\U3/U2/Z_1 ) );
  NAND3X0 U154 ( .IN1(n130), .IN2(n131), .IN3(n132), .QN(\U3/U2/Z_0 ) );
  MUX21X1 U155 ( .IN1(n133), .IN2(n134), .S(opcode[1]), .Q(n132) );
  NAND2X0 U156 ( .IN1(n135), .IN2(opcode[0]), .QN(n134) );
  NAND3X0 U157 ( .IN1(n136), .IN2(n114), .IN3(opcode[2]), .QN(n133) );
  OR2X1 U158 ( .IN1(n137), .IN2(n122), .Q(n130) );
  NAND2X0 U159 ( .IN1(n135), .IN2(n138), .QN(n122) );
  XNOR2X1 U160 ( .IN1(opcode[1]), .IN2(n136), .Q(n138) );
  MUX21X1 U161 ( .IN1(n120), .IN2(n121), .S(n141), .Q(\U3/U1/Z_7 ) );
  MUX21X1 U162 ( .IN1(n120), .IN2(n121), .S(n142), .Q(\U3/U1/Z_6 ) );
  MUX21X1 U163 ( .IN1(n120), .IN2(n121), .S(n143), .Q(\U3/U1/Z_5 ) );
  MUX21X1 U164 ( .IN1(n120), .IN2(n121), .S(n144), .Q(\U3/U1/Z_4 ) );
  MUX21X1 U165 ( .IN1(n120), .IN2(n121), .S(n145), .Q(\U3/U1/Z_3 ) );
  MUX21X1 U166 ( .IN1(n120), .IN2(n121), .S(n146), .Q(\U3/U1/Z_2 ) );
  MUX21X1 U167 ( .IN1(n120), .IN2(n121), .S(n147), .Q(\U3/U1/Z_1 ) );
  MUX21X1 U168 ( .IN1(n120), .IN2(n121), .S(n148), .Q(\U3/U1/Z_0 ) );
  INVX0 U169 ( .IN(n131), .QN(n121) );
  NAND4X0 U170 ( .IN1(opcode[1]), .IN2(opcode[3]), .IN3(opcode[0]), .IN4(n139), 
        .QN(n131) );
  AO21X1 U171 ( .IN1(n135), .IN2(opcode[0]), .IN3(\U3/U3/Z_0 ), .Q(n120) );
  AND3X1 U172 ( .IN1(n136), .IN2(n114), .IN3(n140), .Q(\U3/U3/Z_0 ) );
  XNOR2X1 U173 ( .IN1(n139), .IN2(opcode[1]), .Q(n140) );
  INVX0 U174 ( .IN(opcode[2]), .QN(n139) );
  INVX0 U175 ( .IN(opcode[0]), .QN(n136) );
  NOR2X0 U176 ( .IN1(opcode[2]), .IN2(opcode[3]), .QN(n135) );
  NAND2X0 U177 ( .IN1(n125), .IN2(n143), .QN(N99) );
  NAND2X0 U178 ( .IN1(n124), .IN2(n142), .QN(N98) );
  NAND2X0 U179 ( .IN1(n123), .IN2(n141), .QN(N97) );
  XNOR2X1 U180 ( .IN1(n137), .IN2(in_a[0]), .Q(N120) );
  XNOR2X1 U181 ( .IN1(n129), .IN2(in_a[1]), .Q(N119) );
  XNOR2X1 U182 ( .IN1(n128), .IN2(in_a[2]), .Q(N118) );
  XNOR2X1 U183 ( .IN1(n127), .IN2(in_a[3]), .Q(N117) );
  XNOR2X1 U184 ( .IN1(n126), .IN2(in_a[4]), .Q(N116) );
  XNOR2X1 U185 ( .IN1(n125), .IN2(in_a[5]), .Q(N115) );
  XNOR2X1 U186 ( .IN1(n124), .IN2(in_a[6]), .Q(N114) );
  XNOR2X1 U187 ( .IN1(n123), .IN2(in_a[7]), .Q(N113) );
  NOR2X0 U188 ( .IN1(n148), .IN2(n137), .QN(N112) );
  NOR2X0 U189 ( .IN1(n147), .IN2(n129), .QN(N111) );
  NOR2X0 U190 ( .IN1(n146), .IN2(n128), .QN(N110) );
  NOR2X0 U191 ( .IN1(n145), .IN2(n127), .QN(N109) );
  NOR2X0 U192 ( .IN1(n144), .IN2(n126), .QN(N108) );
  NOR2X0 U193 ( .IN1(n143), .IN2(n125), .QN(N107) );
  INVX0 U194 ( .IN(in_b[5]), .QN(n125) );
  INVX0 U195 ( .IN(in_a[5]), .QN(n143) );
  NOR2X0 U196 ( .IN1(n142), .IN2(n124), .QN(N106) );
  INVX0 U197 ( .IN(in_b[6]), .QN(n124) );
  INVX0 U198 ( .IN(in_a[6]), .QN(n142) );
  NOR2X0 U199 ( .IN1(n141), .IN2(n123), .QN(N105) );
  INVX0 U200 ( .IN(in_b[7]), .QN(n123) );
  INVX0 U201 ( .IN(in_a[7]), .QN(n141) );
  NAND2X0 U202 ( .IN1(n137), .IN2(n148), .QN(N104) );
  INVX0 U203 ( .IN(in_a[0]), .QN(n148) );
  INVX0 U204 ( .IN(in_b[0]), .QN(n137) );
  NAND2X0 U205 ( .IN1(n129), .IN2(n147), .QN(N103) );
  INVX0 U206 ( .IN(in_a[1]), .QN(n147) );
  INVX0 U207 ( .IN(in_b[1]), .QN(n129) );
  NAND2X0 U208 ( .IN1(n128), .IN2(n146), .QN(N102) );
  INVX0 U209 ( .IN(in_a[2]), .QN(n146) );
  INVX0 U210 ( .IN(in_b[2]), .QN(n128) );
  NAND2X0 U211 ( .IN1(n127), .IN2(n145), .QN(N101) );
  INVX0 U212 ( .IN(in_a[3]), .QN(n145) );
  INVX0 U213 ( .IN(in_b[3]), .QN(n127) );
  NAND2X0 U214 ( .IN1(n126), .IN2(n144), .QN(N100) );
  INVX0 U215 ( .IN(in_a[4]), .QN(n144) );
  INVX0 U216 ( .IN(in_b[4]), .QN(n126) );
endmodule

