
module tas ( clk_50, clk_2, reset_n, serial_data, data_ena, ram_wr_n, ram_data, 
        ram_addr );
  output [7:0] ram_data;
  output [10:0] ram_addr;
  input clk_50, clk_2, reset_n, serial_data, data_ena;
  output ram_wr_n;
  wire   fifo_write, fifo_empty, n3, n4, n5, n6, \ctrl_50mhz_0/n15 ,
         \ctrl_50mhz_0/n14 , \ctrl_50mhz_0/n13 , \ctrl_50mhz_0/n12 ,
         \ctrl_50mhz_0/n11 , \ctrl_50mhz_0/n10 , \ctrl_50mhz_0/n7 ,
         \ctrl_50mhz_0/n6 , \ctrl_50mhz_0/n4 , \ctrl_50mhz_0/n3 ,
         \ctrl_50mhz_0/write_byte_ps[0] , \ctrl_50mhz_0/write_byte_ps[1] ,
         \ctrl_50mhz_0/write_byte_ps[2] , \ctrl_50mhz_0/write_fifo_ns ,
         \ctrl_50mhz_0/write_byte_ns[1] , \ctrl_50mhz_0/write_byte_ns[2] ,
         \ctrl_50mhz_0/temp_pkt_ns , \ctrl_50mhz_0/assem_byte_ps ,
         \ctrl_2mhz_0/n4 , \ctrl_2mhz_0/N20 , \ctrl_2mhz_0/read_byte_ps[0] ,
         \ctrl_2mhz_0/read_byte_ps[1] , \ctrl_2mhz_0/write_ram_ns ,
         \ctrl_2mhz_0/read_byte_ns[0] , \ctrl_2mhz_0/read_byte_ns[1] ,
         \shift_reg_0/n9 , \shift_reg_0/n8 , \shift_reg_0/n7 ,
         \shift_reg_0/n6 , \shift_reg_0/n5 , \shift_reg_0/n4 ,
         \shift_reg_0/n3 , \shift_reg_0/n2 , \fifo_0/n277 , \fifo_0/n276 ,
         \fifo_0/n275 , \fifo_0/n274 , \fifo_0/n273 , \fifo_0/n272 ,
         \fifo_0/n271 , \fifo_0/n270 , \fifo_0/n269 , \fifo_0/n268 ,
         \fifo_0/n267 , \fifo_0/n266 , \fifo_0/n265 , \fifo_0/n264 ,
         \fifo_0/n263 , \fifo_0/n262 , \fifo_0/n261 , \fifo_0/n260 ,
         \fifo_0/n259 , \fifo_0/n258 , \fifo_0/n257 , \fifo_0/n256 ,
         \fifo_0/n255 , \fifo_0/n254 , \fifo_0/n253 , \fifo_0/n252 ,
         \fifo_0/n251 , \fifo_0/n250 , \fifo_0/n249 , \fifo_0/n248 ,
         \fifo_0/n247 , \fifo_0/n246 , \fifo_0/n245 , \fifo_0/n244 ,
         \fifo_0/n243 , \fifo_0/n242 , \fifo_0/n241 , \fifo_0/n240 ,
         \fifo_0/n239 , \fifo_0/n238 , \fifo_0/n237 , \fifo_0/n236 ,
         \fifo_0/n235 , \fifo_0/n234 , \fifo_0/n233 , \fifo_0/n232 ,
         \fifo_0/n231 , \fifo_0/n230 , \fifo_0/n229 , \fifo_0/n228 ,
         \fifo_0/n227 , \fifo_0/n226 , \fifo_0/n225 , \fifo_0/n224 ,
         \fifo_0/n223 , \fifo_0/n222 , \fifo_0/n221 , \fifo_0/n220 ,
         \fifo_0/n219 , \fifo_0/n218 , \fifo_0/n217 , \fifo_0/n216 ,
         \fifo_0/n215 , \fifo_0/n214 , \fifo_0/n213 , \fifo_0/n212 ,
         \fifo_0/n211 , \fifo_0/n210 , \fifo_0/n209 , \fifo_0/n208 ,
         \fifo_0/n207 , \fifo_0/n206 , \fifo_0/n205 , \fifo_0/n204 ,
         \fifo_0/n203 , \fifo_0/n202 , \fifo_0/n201 , \fifo_0/n200 ,
         \fifo_0/n199 , \fifo_0/n198 , \fifo_0/n197 , \fifo_0/n196 ,
         \fifo_0/n195 , \fifo_0/n194 , \fifo_0/n193 , \fifo_0/n192 ,
         \fifo_0/n191 , \fifo_0/n190 , \fifo_0/n189 , \fifo_0/n188 ,
         \fifo_0/n187 , \fifo_0/n186 , \fifo_0/n185 , \fifo_0/n184 ,
         \fifo_0/n183 , \fifo_0/n182 , \fifo_0/n181 , \fifo_0/n180 ,
         \fifo_0/n179 , \fifo_0/n178 , \fifo_0/n177 , \fifo_0/n176 ,
         \fifo_0/n175 , \fifo_0/n174 , \fifo_0/n173 , \fifo_0/n172 ,
         \fifo_0/n171 , \fifo_0/n170 , \fifo_0/n169 , \fifo_0/n168 ,
         \fifo_0/n167 , \fifo_0/n166 , \fifo_0/n165 , \fifo_0/n164 ,
         \fifo_0/n163 , \fifo_0/n162 , \fifo_0/n161 , \fifo_0/n160 ,
         \fifo_0/n159 , \fifo_0/n158 , \fifo_0/n157 , \fifo_0/n156 ,
         \fifo_0/n155 , \fifo_0/n154 , \fifo_0/n153 , \fifo_0/n152 ,
         \fifo_0/n151 , \fifo_0/n150 , \fifo_0/n149 , \fifo_0/n148 ,
         \fifo_0/n147 , \fifo_0/n146 , \fifo_0/n143 , \fifo_0/n142 ,
         \fifo_0/n141 , \fifo_0/n140 , \fifo_0/n137 , \fifo_0/n136 ,
         \fifo_0/n135 , \fifo_0/n134 , \fifo_0/n133 , \fifo_0/n132 ,
         \fifo_0/n131 , \fifo_0/n130 , \fifo_0/n129 , \fifo_0/n128 ,
         \fifo_0/n127 , \fifo_0/n126 , \fifo_0/n125 , \fifo_0/n124 ,
         \fifo_0/n123 , \fifo_0/n122 , \fifo_0/n121 , \fifo_0/n120 ,
         \fifo_0/n119 , \fifo_0/n118 , \fifo_0/n117 , \fifo_0/n116 ,
         \fifo_0/n115 , \fifo_0/n114 , \fifo_0/n113 , \fifo_0/n112 ,
         \fifo_0/n111 , \fifo_0/n110 , \fifo_0/n109 , \fifo_0/n108 ,
         \fifo_0/n107 , \fifo_0/n106 , \fifo_0/n105 , \fifo_0/n104 ,
         \fifo_0/n103 , \fifo_0/n102 , \fifo_0/n101 , \fifo_0/n100 ,
         \fifo_0/n99 , \fifo_0/n98 , \fifo_0/n94 , \fifo_0/n93 , \fifo_0/n92 ,
         \fifo_0/n90 , \fifo_0/n78 , \fifo_0/n67 , \fifo_0/n57 , \fifo_0/n47 ,
         \fifo_0/n46 , \fifo_0/n36 , \fifo_0/n26 , \fifo_0/n15 , \fifo_0/n13 ,
         \fifo_0/n3 , \fifo_0/N57 , \fifo_0/N56 , \fifo_0/N55 ,
         \fifo_0/rd_addr[0] , \fifo_0/rd_addr[1] , \fifo_0/rd_addr[2] ,
         \fifo_0/rd_addr[3] , \fifo_0/N18 , \fifo_0/N17 , \fifo_0/N16 ,
         \fifo_0/wr_addr[0] , \fifo_0/wr_addr[1] , \fifo_0/wr_addr[2] ,
         \fifo_0/wr_addr[3] , \averager_0/n11 , \averager_0/n10 ,
         \averager_0/n9 , \averager_0/n8 , \averager_0/n7 , \averager_0/n6 ,
         \averager_0/n5 , \averager_0/n4 , \averager_0/n3 , \averager_0/n2 ,
         \averager_0/N14 , \averager_0/N13 , \averager_0/N12 ,
         \averager_0/N11 , \averager_0/N10 , \averager_0/N9 , \averager_0/N8 ,
         \averager_0/N7 , \averager_0/N6 , \averager_0/N5 ,
         \averager_0/acl[0] , \averager_0/acl[1] , \ram_ctr_0/n17 ,
         \ram_ctr_0/n16 , \ram_ctr_0/n15 , \ram_ctr_0/n14 , \ram_ctr_0/n13 ,
         \ram_ctr_0/n12 , \ram_ctr_0/n11 , \ram_ctr_0/n10 , \ram_ctr_0/n9 ,
         \ram_ctr_0/n8 , \ram_ctr_0/n7 , \ram_ctr_0/n6 , \ram_ctr_0/n5 ,
         \ram_ctr_0/n4 , \ram_ctr_0/n3 , \ram_ctr_0/n2 , \ram_ctr_0/N15 ,
         \ram_ctr_0/N14 , \ram_ctr_0/N13 , \ram_ctr_0/N12 , \ram_ctr_0/N11 ,
         \ram_ctr_0/N10 , \ram_ctr_0/N9 , \ram_ctr_0/N8 , \ram_ctr_0/N7 ,
         \ram_ctr_0/N6 , \averager_0/dp_cluster_0/mult_add_26_aco/PROD_not[9] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[8] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[7] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[6] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[5] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[4] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[3] ,
         \averager_0/dp_cluster_0/add_26_aco/carry[2] ,
         \fifo_0/add_36_S2/carry[3] , \fifo_0/add_36_S2/carry[2] ,
         \fifo_0/add_73_S2/carry[3] , \fifo_0/add_73_S2/carry[2] , n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162;
  wire   [7:0] parallel_data;
  wire   [7:0] fifo_out;

  DFFARX1 \ctrl_2mhz_0/reset_ac_ps_reg  ( .D(\ctrl_2mhz_0/N20 ), .CLK(clk_2), 
        .RSTB(n33), .Q(n74) );
  DFFARX1 \ctrl_50mhz_0/write_byte_ps_reg[2]  ( .D(
        \ctrl_50mhz_0/write_byte_ns[2] ), .CLK(clk_50), .RSTB(n33), .Q(
        \ctrl_50mhz_0/write_byte_ps[2] ), .QN(\ctrl_50mhz_0/n4 ) );
  HADDX1 \fifo_0/add_73_S2/U1_1_2  ( .A0(\fifo_0/rd_addr[2] ), .B0(
        \fifo_0/add_73_S2/carry[2] ), .C1(\fifo_0/add_73_S2/carry[3] ), .SO(
        \fifo_0/N56 ) );
  HADDX1 \fifo_0/add_73_S2/U1_1_1  ( .A0(\fifo_0/rd_addr[1] ), .B0(
        \fifo_0/rd_addr[0] ), .C1(\fifo_0/add_73_S2/carry[2] ), .SO(
        \fifo_0/N55 ) );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_6  ( .A(n22), .B(fifo_out[6]), 
        .CI(\averager_0/dp_cluster_0/add_26_aco/carry[6] ), .CO(
        \averager_0/dp_cluster_0/add_26_aco/carry[7] ), .S(\averager_0/N11 )
         );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_5  ( .A(n21), .B(fifo_out[5]), 
        .CI(\averager_0/dp_cluster_0/add_26_aco/carry[5] ), .CO(
        \averager_0/dp_cluster_0/add_26_aco/carry[6] ), .S(\averager_0/N10 )
         );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_4  ( .A(n20), .B(fifo_out[4]), 
        .CI(\averager_0/dp_cluster_0/add_26_aco/carry[4] ), .CO(
        \averager_0/dp_cluster_0/add_26_aco/carry[5] ), .S(\averager_0/N9 ) );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_3  ( .A(n19), .B(fifo_out[3]), 
        .CI(\averager_0/dp_cluster_0/add_26_aco/carry[3] ), .CO(
        \averager_0/dp_cluster_0/add_26_aco/carry[4] ), .S(\averager_0/N8 ) );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_2  ( .A(n18), .B(fifo_out[2]), 
        .CI(\averager_0/dp_cluster_0/add_26_aco/carry[2] ), .CO(
        \averager_0/dp_cluster_0/add_26_aco/carry[3] ), .S(\averager_0/N7 ) );
  HADDX1 \fifo_0/add_36_S2/U1_1_2  ( .A0(\fifo_0/wr_addr[2] ), .B0(
        \fifo_0/add_36_S2/carry[2] ), .C1(\fifo_0/add_36_S2/carry[3] ), .SO(
        \fifo_0/N17 ) );
  HADDX1 \fifo_0/add_36_S2/U1_1_1  ( .A0(\fifo_0/wr_addr[1] ), .B0(
        \fifo_0/wr_addr[0] ), .C1(\fifo_0/add_36_S2/carry[2] ), .SO(
        \fifo_0/N16 ) );
  XOR2X1 \fifo_0/add_73_S2/U1_1_3  ( .IN1(\fifo_0/rd_addr[3] ), .IN2(
        \fifo_0/add_73_S2/carry[3] ), .Q(\fifo_0/N57 ) );
  XOR2X1 \fifo_0/add_36_S2/U1_1_3  ( .IN1(\fifo_0/wr_addr[3] ), .IN2(
        \fifo_0/add_36_S2/carry[3] ), .Q(\fifo_0/N18 ) );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_7  ( .A(n17), .B(fifo_out[7]), 
        .CI(\averager_0/dp_cluster_0/add_26_aco/carry[7] ), .CO(
        \averager_0/dp_cluster_0/add_26_aco/carry[8] ), .S(\averager_0/N12 )
         );
  FADDX1 \averager_0/dp_cluster_0/add_26_aco/U1_1  ( .A(n16), .B(fifo_out[1]), 
        .CI(n8), .CO(\averager_0/dp_cluster_0/add_26_aco/carry[2] ), .S(
        \averager_0/N6 ) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[9]  ( .D(\ram_ctr_0/n7 ), .CLK(clk_2), 
        .SETB(n52), .Q(ram_addr[9]), .QN(n145) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[8]  ( .D(\ram_ctr_0/n8 ), .CLK(clk_2), 
        .SETB(n49), .Q(ram_addr[8]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[7]  ( .D(\ram_ctr_0/n9 ), .CLK(clk_2), 
        .SETB(n49), .Q(ram_addr[7]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[6]  ( .D(\ram_ctr_0/n10 ), .CLK(clk_2), 
        .SETB(n50), .Q(ram_addr[6]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[5]  ( .D(\ram_ctr_0/n11 ), .CLK(clk_2), 
        .SETB(n50), .Q(ram_addr[5]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[4]  ( .D(\ram_ctr_0/n12 ), .CLK(clk_2), 
        .SETB(n50), .Q(ram_addr[4]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[3]  ( .D(\ram_ctr_0/n13 ), .CLK(clk_2), 
        .SETB(n50), .Q(ram_addr[3]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[2]  ( .D(\ram_ctr_0/n14 ), .CLK(clk_2), 
        .SETB(n50), .Q(ram_addr[2]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[1]  ( .D(\ram_ctr_0/n15 ), .CLK(clk_2), 
        .SETB(n50), .Q(ram_addr[1]) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[0]  ( .D(\ram_ctr_0/n17 ), .CLK(clk_2), 
        .SETB(n51), .Q(ram_addr[0]), .QN(n153) );
  DFFASX1 \ram_ctr_0/ram_addr_reg[10]  ( .D(\ram_ctr_0/n16 ), .CLK(clk_2), 
        .SETB(n51), .Q(ram_addr[10]) );
  DFFARX1 \ctrl_2mhz_0/write_ram_ps_reg  ( .D(\ctrl_2mhz_0/write_ram_ns ), 
        .CLK(clk_2), .RSTB(n53), .Q(ram_wr_n), .QN(n31) );
  DFFARX1 \ctrl_2mhz_0/read_byte_ps_reg[0]  ( .D(\ctrl_2mhz_0/read_byte_ns[0] ), .CLK(clk_2), .RSTB(n34), .Q(\ctrl_2mhz_0/read_byte_ps[0] ) );
  DFFARX1 \fifo_0/rd_addr_reg[3]  ( .D(\fifo_0/n140 ), .CLK(clk_2), .RSTB(n35), 
        .Q(\fifo_0/rd_addr[3] ) );
  DFFARX1 \fifo_0/rd_addr_reg[2]  ( .D(\fifo_0/n141 ), .CLK(clk_2), .RSTB(n35), 
        .Q(\fifo_0/rd_addr[2] ), .QN(n76) );
  DFFARX1 \fifo_0/rd_addr_reg[1]  ( .D(\fifo_0/n142 ), .CLK(clk_2), .RSTB(n36), 
        .Q(\fifo_0/rd_addr[1] ), .QN(n77) );
  DFFARX1 \fifo_0/rd_addr_reg[0]  ( .D(\fifo_0/n143 ), .CLK(clk_2), .RSTB(n36), 
        .Q(\fifo_0/rd_addr[0] ), .QN(n78) );
  DFFARX1 \averager_0/acl_reg[8]  ( .D(\averager_0/n3 ), .CLK(clk_2), .RSTB(
        n48), .Q(ram_data[6]) );
  DFFARX1 \averager_0/acl_reg[7]  ( .D(\averager_0/n4 ), .CLK(clk_2), .RSTB(
        n48), .Q(ram_data[5]) );
  DFFARX1 \averager_0/acl_reg[6]  ( .D(\averager_0/n5 ), .CLK(clk_2), .RSTB(
        n48), .Q(ram_data[4]) );
  DFFARX1 \averager_0/acl_reg[5]  ( .D(\averager_0/n6 ), .CLK(clk_2), .RSTB(
        n48), .Q(ram_data[3]) );
  DFFARX1 \averager_0/acl_reg[4]  ( .D(\averager_0/n7 ), .CLK(clk_2), .RSTB(
        n48), .Q(ram_data[2]) );
  DFFARX1 \averager_0/acl_reg[3]  ( .D(\averager_0/n8 ), .CLK(clk_2), .RSTB(
        n48), .Q(ram_data[1]) );
  DFFARX1 \averager_0/acl_reg[2]  ( .D(\averager_0/n9 ), .CLK(clk_2), .RSTB(
        n49), .Q(ram_data[0]) );
  DFFARX1 \averager_0/acl_reg[1]  ( .D(\averager_0/n10 ), .CLK(clk_2), .RSTB(
        n49), .Q(\averager_0/acl[1] ) );
  DFFARX1 \averager_0/acl_reg[0]  ( .D(\averager_0/n11 ), .CLK(clk_2), .RSTB(
        n49), .Q(\averager_0/acl[0] ) );
  DFFARX1 \averager_0/acl_reg[9]  ( .D(\averager_0/n2 ), .CLK(clk_2), .RSTB(
        n47), .Q(ram_data[7]) );
  DFFARX1 \ctrl_2mhz_0/read_byte_ps_reg[1]  ( .D(\ctrl_2mhz_0/read_byte_ns[1] ), .CLK(clk_2), .RSTB(n34), .Q(\ctrl_2mhz_0/read_byte_ps[1] ) );
  DFFARX1 \fifo_0/wr_addr_reg[0]  ( .D(\fifo_0/n149 ), .CLK(clk_50), .RSTB(n54), .Q(\fifo_0/wr_addr[0] ), .QN(n144) );
  DFFARX1 \fifo_0/wr_addr_reg[1]  ( .D(\fifo_0/n148 ), .CLK(clk_50), .RSTB(n47), .Q(\fifo_0/wr_addr[1] ), .QN(n143) );
  DFFARX1 \fifo_0/wr_addr_reg[2]  ( .D(\fifo_0/n147 ), .CLK(clk_50), .RSTB(n47), .Q(\fifo_0/wr_addr[2] ) );
  DFFARX1 \fifo_0/wr_addr_reg[3]  ( .D(\fifo_0/n146 ), .CLK(clk_50), .RSTB(n47), .Q(\fifo_0/wr_addr[3] ) );
  DFFARX1 \ctrl_50mhz_0/assem_byte_ps_reg  ( .D(data_ena), .CLK(clk_50), 
        .RSTB(n33), .Q(\ctrl_50mhz_0/assem_byte_ps ) );
  DFFARX1 \shift_reg_0/bits_reg[7]  ( .D(\shift_reg_0/n9 ), .CLK(clk_50), 
        .RSTB(n35), .Q(parallel_data[7]) );
  DFFARX1 \shift_reg_0/bits_reg[6]  ( .D(\shift_reg_0/n8 ), .CLK(clk_50), 
        .RSTB(n35), .Q(n15), .QN(n7) );
  DFFARX1 \shift_reg_0/bits_reg[5]  ( .D(\shift_reg_0/n7 ), .CLK(clk_50), 
        .RSTB(n35), .Q(n10) );
  DFFARX1 \shift_reg_0/bits_reg[3]  ( .D(\shift_reg_0/n5 ), .CLK(clk_50), 
        .RSTB(n34), .Q(n12) );
  DFFARX1 \shift_reg_0/bits_reg[2]  ( .D(\shift_reg_0/n4 ), .CLK(clk_50), 
        .RSTB(n34), .Q(n13) );
  DFFARX1 \shift_reg_0/bits_reg[0]  ( .D(\shift_reg_0/n2 ), .CLK(clk_50), 
        .RSTB(n34), .Q(parallel_data[0]) );
  DFFARX1 \shift_reg_0/bits_reg[1]  ( .D(\shift_reg_0/n3 ), .CLK(clk_50), 
        .RSTB(n34), .Q(n14), .QN(n30) );
  DFFARX1 \shift_reg_0/bits_reg[4]  ( .D(\shift_reg_0/n6 ), .CLK(clk_50), 
        .RSTB(n35), .Q(n11) );
  DFFARX1 \ctrl_50mhz_0/write_fifo_ps_reg  ( .D(\ctrl_50mhz_0/write_fifo_ns ), 
        .CLK(clk_50), .RSTB(n42), .Q(fifo_write), .QN(n69) );
  DFFARX1 \ctrl_50mhz_0/write_byte_ps_reg[0]  ( .D(n62), .CLK(clk_50), .RSTB(
        n33), .Q(\ctrl_50mhz_0/write_byte_ps[0] ) );
  DFFARX1 \ctrl_50mhz_0/write_byte_ps_reg[1]  ( .D(
        \ctrl_50mhz_0/write_byte_ns[1] ), .CLK(clk_50), .RSTB(n33), .Q(
        \ctrl_50mhz_0/write_byte_ps[1] ) );
  DFFARX1 \fifo_0/byte7_reg[7]  ( .D(\fifo_0/n277 ), .CLK(clk_50), .RSTB(n54), 
        .Q(n142), .QN(\fifo_0/n150 ) );
  DFFARX1 \fifo_0/byte7_reg[0]  ( .D(\fifo_0/n270 ), .CLK(clk_50), .RSTB(n45), 
        .Q(n135), .QN(\fifo_0/n157 ) );
  DFFARX1 \fifo_0/byte7_reg[6]  ( .D(\fifo_0/n276 ), .CLK(clk_50), .RSTB(n46), 
        .Q(n141), .QN(\fifo_0/n151 ) );
  DFFARX1 \fifo_0/byte7_reg[1]  ( .D(\fifo_0/n271 ), .CLK(clk_50), .RSTB(n46), 
        .Q(n136), .QN(\fifo_0/n156 ) );
  DFFARX1 \fifo_0/byte7_reg[4]  ( .D(\fifo_0/n274 ), .CLK(clk_50), .RSTB(n46), 
        .Q(n139), .QN(\fifo_0/n153 ) );
  DFFARX1 \fifo_0/byte7_reg[3]  ( .D(\fifo_0/n273 ), .CLK(clk_50), .RSTB(n46), 
        .Q(n138), .QN(\fifo_0/n154 ) );
  DFFARX1 \fifo_0/byte7_reg[2]  ( .D(\fifo_0/n272 ), .CLK(clk_50), .RSTB(n46), 
        .Q(n137), .QN(\fifo_0/n155 ) );
  DFFARX1 \fifo_0/byte7_reg[5]  ( .D(\fifo_0/n275 ), .CLK(clk_50), .RSTB(n46), 
        .Q(n140), .QN(\fifo_0/n152 ) );
  DFFARX1 \fifo_0/byte5_reg[7]  ( .D(\fifo_0/n229 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n94), .QN(\fifo_0/n198 ) );
  DFFARX1 \fifo_0/byte5_reg[6]  ( .D(\fifo_0/n228 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n93), .QN(\fifo_0/n199 ) );
  DFFARX1 \fifo_0/byte5_reg[4]  ( .D(\fifo_0/n226 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n91), .QN(\fifo_0/n201 ) );
  DFFARX1 \fifo_0/byte5_reg[3]  ( .D(\fifo_0/n225 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n90), .QN(\fifo_0/n202 ) );
  DFFARX1 \fifo_0/byte5_reg[1]  ( .D(\fifo_0/n223 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n88), .QN(\fifo_0/n204 ) );
  DFFARX1 \fifo_0/byte5_reg[0]  ( .D(\fifo_0/n222 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n87), .QN(\fifo_0/n205 ) );
  DFFARX1 \fifo_0/byte5_reg[2]  ( .D(\fifo_0/n224 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n89), .QN(\fifo_0/n203 ) );
  DFFARX1 \fifo_0/byte5_reg[5]  ( .D(\fifo_0/n227 ), .CLK(clk_50), .RSTB(n38), 
        .Q(n92), .QN(\fifo_0/n200 ) );
  DFFARX1 \fifo_0/byte6_reg[7]  ( .D(\fifo_0/n221 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n86), .QN(\fifo_0/n206 ) );
  DFFARX1 \fifo_0/byte6_reg[0]  ( .D(\fifo_0/n214 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n79), .QN(\fifo_0/n213 ) );
  DFFARX1 \fifo_0/byte6_reg[6]  ( .D(\fifo_0/n220 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n85), .QN(\fifo_0/n207 ) );
  DFFARX1 \fifo_0/byte6_reg[1]  ( .D(\fifo_0/n215 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n80), .QN(\fifo_0/n212 ) );
  DFFARX1 \fifo_0/byte6_reg[4]  ( .D(\fifo_0/n218 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n83), .QN(\fifo_0/n209 ) );
  DFFARX1 \fifo_0/byte6_reg[3]  ( .D(\fifo_0/n217 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n82), .QN(\fifo_0/n210 ) );
  DFFARX1 \fifo_0/byte6_reg[2]  ( .D(\fifo_0/n216 ), .CLK(clk_50), .RSTB(n36), 
        .Q(n81), .QN(\fifo_0/n211 ) );
  DFFARX1 \fifo_0/byte6_reg[5]  ( .D(\fifo_0/n219 ), .CLK(clk_50), .RSTB(n37), 
        .Q(n84), .QN(\fifo_0/n208 ) );
  DFFARX1 \fifo_0/byte4_reg[7]  ( .D(\fifo_0/n237 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n102), .QN(\fifo_0/n190 ) );
  DFFARX1 \fifo_0/byte4_reg[6]  ( .D(\fifo_0/n236 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n101), .QN(\fifo_0/n191 ) );
  DFFARX1 \fifo_0/byte4_reg[4]  ( .D(\fifo_0/n234 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n99), .QN(\fifo_0/n193 ) );
  DFFARX1 \fifo_0/byte4_reg[3]  ( .D(\fifo_0/n233 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n98), .QN(\fifo_0/n194 ) );
  DFFARX1 \fifo_0/byte4_reg[1]  ( .D(\fifo_0/n231 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n96), .QN(\fifo_0/n196 ) );
  DFFARX1 \fifo_0/byte4_reg[0]  ( .D(\fifo_0/n230 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n95), .QN(\fifo_0/n197 ) );
  DFFARX1 \fifo_0/byte4_reg[2]  ( .D(\fifo_0/n232 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n97), .QN(\fifo_0/n195 ) );
  DFFARX1 \fifo_0/byte4_reg[5]  ( .D(\fifo_0/n235 ), .CLK(clk_50), .RSTB(n39), 
        .Q(n100), .QN(\fifo_0/n192 ) );
  DFFARX1 \fifo_0/byte3_reg[7]  ( .D(\fifo_0/n245 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n110), .QN(\fifo_0/n182 ) );
  DFFARX1 \fifo_0/byte3_reg[0]  ( .D(\fifo_0/n238 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n103), .QN(\fifo_0/n189 ) );
  DFFARX1 \fifo_0/byte2_reg[7]  ( .D(\fifo_0/n253 ), .CLK(clk_50), .RSTB(n43), 
        .Q(n118), .QN(\fifo_0/n174 ) );
  DFFARX1 \fifo_0/byte2_reg[0]  ( .D(\fifo_0/n246 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n111), .QN(\fifo_0/n181 ) );
  DFFARX1 \fifo_0/byte1_reg[7]  ( .D(\fifo_0/n261 ), .CLK(clk_50), .RSTB(n44), 
        .Q(n126), .QN(\fifo_0/n166 ) );
  DFFARX1 \fifo_0/byte1_reg[0]  ( .D(\fifo_0/n254 ), .CLK(clk_50), .RSTB(n43), 
        .Q(n119), .QN(\fifo_0/n173 ) );
  DFFARX1 \fifo_0/byte0_reg[7]  ( .D(\fifo_0/n269 ), .CLK(clk_50), .RSTB(n45), 
        .Q(n134), .QN(\fifo_0/n158 ) );
  DFFARX1 \fifo_0/byte0_reg[0]  ( .D(\fifo_0/n262 ), .CLK(clk_50), .RSTB(n44), 
        .Q(n127), .QN(\fifo_0/n165 ) );
  DFFARX1 \fifo_0/byte3_reg[6]  ( .D(\fifo_0/n244 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n109), .QN(\fifo_0/n183 ) );
  DFFARX1 \fifo_0/byte2_reg[6]  ( .D(\fifo_0/n252 ), .CLK(clk_50), .RSTB(n42), 
        .Q(n117), .QN(\fifo_0/n175 ) );
  DFFARX1 \fifo_0/byte1_reg[6]  ( .D(\fifo_0/n260 ), .CLK(clk_50), .RSTB(n44), 
        .Q(n125), .QN(\fifo_0/n167 ) );
  DFFARX1 \fifo_0/byte0_reg[6]  ( .D(\fifo_0/n268 ), .CLK(clk_50), .RSTB(n45), 
        .Q(n133), .QN(\fifo_0/n159 ) );
  DFFARX1 \fifo_0/byte3_reg[1]  ( .D(\fifo_0/n239 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n104), .QN(\fifo_0/n188 ) );
  DFFARX1 \fifo_0/byte2_reg[1]  ( .D(\fifo_0/n247 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n112), .QN(\fifo_0/n180 ) );
  DFFARX1 \fifo_0/byte1_reg[1]  ( .D(\fifo_0/n255 ), .CLK(clk_50), .RSTB(n43), 
        .Q(n120), .QN(\fifo_0/n172 ) );
  DFFARX1 \fifo_0/byte0_reg[1]  ( .D(\fifo_0/n263 ), .CLK(clk_50), .RSTB(n44), 
        .Q(n128), .QN(\fifo_0/n164 ) );
  DFFARX1 \fifo_0/byte3_reg[4]  ( .D(\fifo_0/n242 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n107), .QN(\fifo_0/n185 ) );
  DFFARX1 \fifo_0/byte2_reg[4]  ( .D(\fifo_0/n250 ), .CLK(clk_50), .RSTB(n42), 
        .Q(n115), .QN(\fifo_0/n177 ) );
  DFFARX1 \fifo_0/byte1_reg[4]  ( .D(\fifo_0/n258 ), .CLK(clk_50), .RSTB(n43), 
        .Q(n123), .QN(\fifo_0/n169 ) );
  DFFARX1 \fifo_0/byte0_reg[4]  ( .D(\fifo_0/n266 ), .CLK(clk_50), .RSTB(n45), 
        .Q(n131), .QN(\fifo_0/n161 ) );
  DFFARX1 \fifo_0/byte3_reg[3]  ( .D(\fifo_0/n241 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n106), .QN(\fifo_0/n186 ) );
  DFFARX1 \fifo_0/byte2_reg[3]  ( .D(\fifo_0/n249 ), .CLK(clk_50), .RSTB(n42), 
        .Q(n114), .QN(\fifo_0/n178 ) );
  DFFARX1 \fifo_0/byte1_reg[3]  ( .D(\fifo_0/n257 ), .CLK(clk_50), .RSTB(n43), 
        .Q(n122), .QN(\fifo_0/n170 ) );
  DFFARX1 \fifo_0/byte0_reg[3]  ( .D(\fifo_0/n265 ), .CLK(clk_50), .RSTB(n45), 
        .Q(n130), .QN(\fifo_0/n162 ) );
  DFFARX1 \fifo_0/byte3_reg[2]  ( .D(\fifo_0/n240 ), .CLK(clk_50), .RSTB(n40), 
        .Q(n105), .QN(\fifo_0/n187 ) );
  DFFARX1 \fifo_0/byte2_reg[2]  ( .D(\fifo_0/n248 ), .CLK(clk_50), .RSTB(n42), 
        .Q(n113), .QN(\fifo_0/n179 ) );
  DFFARX1 \fifo_0/byte1_reg[2]  ( .D(\fifo_0/n256 ), .CLK(clk_50), .RSTB(n43), 
        .Q(n121), .QN(\fifo_0/n171 ) );
  DFFARX1 \fifo_0/byte0_reg[2]  ( .D(\fifo_0/n264 ), .CLK(clk_50), .RSTB(n44), 
        .Q(n129), .QN(\fifo_0/n163 ) );
  DFFARX1 \fifo_0/byte3_reg[5]  ( .D(\fifo_0/n243 ), .CLK(clk_50), .RSTB(n41), 
        .Q(n108), .QN(\fifo_0/n184 ) );
  DFFARX1 \fifo_0/byte2_reg[5]  ( .D(\fifo_0/n251 ), .CLK(clk_50), .RSTB(n42), 
        .Q(n116), .QN(\fifo_0/n176 ) );
  DFFARX1 \fifo_0/byte1_reg[5]  ( .D(\fifo_0/n259 ), .CLK(clk_50), .RSTB(n44), 
        .Q(n124), .QN(\fifo_0/n168 ) );
  DFFARX1 \fifo_0/byte0_reg[5]  ( .D(\fifo_0/n267 ), .CLK(clk_50), .RSTB(n45), 
        .Q(n132), .QN(\fifo_0/n160 ) );
  DFFARX1 \ctrl_50mhz_0/temp_pkt_ps_reg  ( .D(\ctrl_50mhz_0/temp_pkt_ns ), 
        .CLK(clk_50), .RSTB(n33), .QN(\ctrl_50mhz_0/n3 ) );
  AO22X1 U8 ( .IN1(ram_data[7]), .IN2(fifo_empty), .IN3(n75), .IN4(
        \averager_0/N14 ), .Q(\averager_0/n2 ) );
  AND2X1 U9 ( .IN1(fifo_out[0]), .IN2(n26), .Q(n8) );
  XOR2X1 U10 ( .IN1(\fifo_0/rd_addr[3] ), .IN2(\fifo_0/wr_addr[3] ), .Q(n9) );
  AND2X1 U11 ( .IN1(\averager_0/acl[1] ), .IN2(n74), .Q(n16) );
  AND2X1 U12 ( .IN1(ram_data[5]), .IN2(n74), .Q(n17) );
  AND2X1 U13 ( .IN1(ram_data[0]), .IN2(n74), .Q(n18) );
  AND2X1 U14 ( .IN1(ram_data[1]), .IN2(n74), .Q(n19) );
  AND2X1 U15 ( .IN1(ram_data[2]), .IN2(n74), .Q(n20) );
  AND2X1 U16 ( .IN1(ram_data[3]), .IN2(n74), .Q(n21) );
  AND2X1 U17 ( .IN1(ram_data[4]), .IN2(n74), .Q(n22) );
  INVX0 U18 ( .IN(fifo_empty), .QN(n75) );
  NAND2X0 U19 ( .IN1(n5), .IN2(n6), .QN(n4) );
  NAND4X0 U20 ( .IN1(n10), .IN2(n13), .IN3(n30), .IN4(n7), .QN(n6) );
  OR4X1 U21 ( .IN1(n7), .IN2(n30), .IN3(n13), .IN4(n10), .Q(n5) );
  NOR2X0 U22 ( .IN1(n11), .IN2(n12), .QN(n3) );
  INVX0 U23 ( .IN(\fifo_0/n67 ), .QN(n65) );
  INVX0 U24 ( .IN(\fifo_0/n26 ), .QN(n71) );
  NAND2X0 U25 ( .IN1(\averager_0/dp_cluster_0/add_26_aco/carry[8] ), .IN2(n27), 
        .QN(n28) );
  AO22X1 U26 ( .IN1(n15), .IN2(n29), .IN3(n10), .IN4(n64), .Q(\shift_reg_0/n7 ) );
  AO22X1 U27 ( .IN1(n10), .IN2(n29), .IN3(n11), .IN4(n64), .Q(\shift_reg_0/n6 ) );
  AO22X1 U28 ( .IN1(n11), .IN2(n29), .IN3(n12), .IN4(n64), .Q(\shift_reg_0/n5 ) );
  AO22X1 U29 ( .IN1(n12), .IN2(n29), .IN3(n13), .IN4(n64), .Q(\shift_reg_0/n4 ) );
  AO22X1 U30 ( .IN1(n13), .IN2(n29), .IN3(n14), .IN4(n64), .Q(\shift_reg_0/n3 ) );
  NOR2X0 U31 ( .IN1(\fifo_0/n90 ), .IN2(n9), .QN(fifo_empty) );
  NAND3X0 U32 ( .IN1(\fifo_0/n92 ), .IN2(\fifo_0/n93 ), .IN3(\fifo_0/n94 ), 
        .QN(\fifo_0/n90 ) );
  OR2X1 U33 ( .IN1(\ctrl_2mhz_0/read_byte_ns[0] ), .IN2(
        \ctrl_2mhz_0/read_byte_ns[1] ), .Q(\ctrl_2mhz_0/N20 ) );
  INVX0 U34 ( .IN(n29), .QN(n64) );
  INVX0 U35 ( .IN(\ctrl_50mhz_0/n7 ), .QN(n63) );
  INVX0 U36 ( .IN(\ctrl_50mhz_0/n10 ), .QN(n62) );
  NAND4X0 U37 ( .IN1(\fifo_0/n130 ), .IN2(\fifo_0/n131 ), .IN3(\fifo_0/n132 ), 
        .IN4(\fifo_0/n133 ), .QN(fifo_out[1]) );
  NAND3X0 U38 ( .IN1(n144), .IN2(n143), .IN3(\fifo_0/n46 ), .QN(\fifo_0/n67 )
         );
  NAND3X0 U39 ( .IN1(n144), .IN2(n143), .IN3(\fifo_0/n13 ), .QN(\fifo_0/n26 )
         );
  INVX0 U40 ( .IN(\fifo_0/n3 ), .QN(n73) );
  INVX0 U41 ( .IN(\fifo_0/n36 ), .QN(n68) );
  INVX0 U42 ( .IN(\fifo_0/n78 ), .QN(n70) );
  INVX0 U43 ( .IN(\fifo_0/n57 ), .QN(n66) );
  INVX0 U44 ( .IN(\fifo_0/n47 ), .QN(n67) );
  INVX0 U45 ( .IN(\fifo_0/n15 ), .QN(n72) );
  NAND3X0 U46 ( .IN1(n77), .IN2(n76), .IN3(n78), .QN(\fifo_0/n108 ) );
  INVX0 U47 ( .IN(n155), .QN(n152) );
  INVX0 U48 ( .IN(n161), .QN(n146) );
  INVX0 U49 ( .IN(n157), .QN(n150) );
  INVX0 U50 ( .IN(n156), .QN(n151) );
  INVX0 U51 ( .IN(n160), .QN(n147) );
  INVX0 U52 ( .IN(n159), .QN(n148) );
  INVX0 U53 ( .IN(n158), .QN(n149) );
  NBUFFX2 U54 ( .IN(n53), .Q(n48) );
  NBUFFX2 U55 ( .IN(n54), .Q(n47) );
  NBUFFX2 U56 ( .IN(n54), .Q(n46) );
  NBUFFX2 U57 ( .IN(n55), .Q(n45) );
  NBUFFX2 U58 ( .IN(n55), .Q(n44) );
  NBUFFX2 U59 ( .IN(n56), .Q(n43) );
  NBUFFX2 U60 ( .IN(n57), .Q(n41) );
  NBUFFX2 U61 ( .IN(n57), .Q(n40) );
  NBUFFX2 U62 ( .IN(n58), .Q(n39) );
  NBUFFX2 U63 ( .IN(n58), .Q(n38) );
  NBUFFX2 U64 ( .IN(n59), .Q(n37) );
  NBUFFX2 U65 ( .IN(n59), .Q(n36) );
  NBUFFX2 U66 ( .IN(n60), .Q(n35) );
  NBUFFX2 U67 ( .IN(n60), .Q(n34) );
  NBUFFX2 U68 ( .IN(n56), .Q(n42) );
  NBUFFX2 U69 ( .IN(n53), .Q(n49) );
  NBUFFX2 U70 ( .IN(n52), .Q(n50) );
  NBUFFX2 U71 ( .IN(n52), .Q(n51) );
  NAND2X0 U72 ( .IN1(\ctrl_50mhz_0/n11 ), .IN2(\ctrl_50mhz_0/n4 ), .QN(
        \ctrl_50mhz_0/n10 ) );
  XOR2X1 U73 ( .IN1(\ctrl_50mhz_0/write_byte_ps[0] ), .IN2(n63), .Q(
        \ctrl_50mhz_0/n11 ) );
  NAND4X0 U74 ( .IN1(\fifo_0/n134 ), .IN2(\fifo_0/n135 ), .IN3(\fifo_0/n136 ), 
        .IN4(\fifo_0/n137 ), .QN(fifo_out[0]) );
  OA22X1 U75 ( .IN1(\fifo_0/n165 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n173 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n134 ) );
  OA22X1 U76 ( .IN1(\fifo_0/n181 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n189 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n135 ) );
  OA22X1 U77 ( .IN1(\fifo_0/n197 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n205 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n136 ) );
  NAND2X0 U78 ( .IN1(\ctrl_50mhz_0/assem_byte_ps ), .IN2(n64), .QN(
        \ctrl_50mhz_0/n7 ) );
  AND4X1 U79 ( .IN1(n31), .IN2(n75), .IN3(\ctrl_2mhz_0/read_byte_ps[0] ), 
        .IN4(\ctrl_2mhz_0/read_byte_ps[1] ), .Q(\ctrl_2mhz_0/write_ram_ns ) );
  NAND4X0 U80 ( .IN1(\fifo_0/n98 ), .IN2(\fifo_0/n99 ), .IN3(\fifo_0/n100 ), 
        .IN4(\fifo_0/n101 ), .QN(fifo_out[7]) );
  AND2X1 U81 ( .IN1(\ctrl_50mhz_0/n14 ), .IN2(\ctrl_50mhz_0/n4 ), .Q(
        \ctrl_50mhz_0/write_byte_ns[1] ) );
  XNOR2X1 U82 ( .IN1(\ctrl_50mhz_0/write_byte_ps[1] ), .IN2(\ctrl_50mhz_0/n15 ), .Q(\ctrl_50mhz_0/n14 ) );
  NAND2X0 U83 ( .IN1(n63), .IN2(\ctrl_50mhz_0/write_byte_ps[0] ), .QN(
        \ctrl_50mhz_0/n15 ) );
  AO22X1 U84 ( .IN1(\fifo_0/wr_addr[2] ), .IN2(n69), .IN3(\fifo_0/N17 ), .IN4(
        fifo_write), .Q(\fifo_0/n147 ) );
  AO22X1 U85 ( .IN1(\fifo_0/wr_addr[3] ), .IN2(n69), .IN3(\fifo_0/N18 ), .IN4(
        fifo_write), .Q(\fifo_0/n146 ) );
  AO22X1 U86 ( .IN1(serial_data), .IN2(n29), .IN3(parallel_data[7]), .IN4(n64), 
        .Q(\shift_reg_0/n9 ) );
  AO22X1 U87 ( .IN1(parallel_data[7]), .IN2(n29), .IN3(n15), .IN4(n64), .Q(
        \shift_reg_0/n8 ) );
  AO22X1 U88 ( .IN1(n29), .IN2(n14), .IN3(parallel_data[0]), .IN4(n64), .Q(
        \shift_reg_0/n2 ) );
  OAI22X1 U89 ( .IN1(\ctrl_50mhz_0/n3 ), .IN2(n23), .IN3(n24), .IN4(n25), .QN(
        \ctrl_50mhz_0/temp_pkt_ns ) );
  NOR3X0 U90 ( .IN1(\ctrl_50mhz_0/write_byte_ns[1] ), .IN2(
        \ctrl_50mhz_0/write_byte_ns[2] ), .IN3(n62), .QN(n23) );
  OR2X1 U91 ( .IN1(\ctrl_50mhz_0/write_byte_ns[1] ), .IN2(\ctrl_50mhz_0/n10 ), 
        .Q(n24) );
  NAND4X0 U92 ( .IN1(parallel_data[0]), .IN2(parallel_data[7]), .IN3(n3), 
        .IN4(n4), .QN(n25) );
  AO22X1 U93 ( .IN1(\averager_0/acl[0] ), .IN2(fifo_empty), .IN3(
        \averager_0/N5 ), .IN4(n75), .Q(\averager_0/n11 ) );
  XOR2X1 U94 ( .IN1(fifo_out[0]), .IN2(n26), .Q(\averager_0/N5 ) );
  AO22X1 U95 ( .IN1(\averager_0/acl[1] ), .IN2(fifo_empty), .IN3(
        \averager_0/N6 ), .IN4(n75), .Q(\averager_0/n10 ) );
  AO22X1 U96 ( .IN1(ram_data[0]), .IN2(fifo_empty), .IN3(\averager_0/N7 ), 
        .IN4(n75), .Q(\averager_0/n9 ) );
  AO22X1 U97 ( .IN1(ram_data[1]), .IN2(fifo_empty), .IN3(\averager_0/N8 ), 
        .IN4(n75), .Q(\averager_0/n8 ) );
  AO22X1 U98 ( .IN1(ram_data[2]), .IN2(fifo_empty), .IN3(\averager_0/N9 ), 
        .IN4(n75), .Q(\averager_0/n7 ) );
  AO22X1 U99 ( .IN1(ram_data[3]), .IN2(fifo_empty), .IN3(\averager_0/N10 ), 
        .IN4(n75), .Q(\averager_0/n6 ) );
  AO22X1 U100 ( .IN1(ram_data[4]), .IN2(fifo_empty), .IN3(\averager_0/N11 ), 
        .IN4(n75), .Q(\averager_0/n5 ) );
  AO22X1 U101 ( .IN1(ram_data[5]), .IN2(fifo_empty), .IN3(\averager_0/N12 ), 
        .IN4(n75), .Q(\averager_0/n4 ) );
  AO22X1 U102 ( .IN1(ram_data[6]), .IN2(fifo_empty), .IN3(\averager_0/N13 ), 
        .IN4(n75), .Q(\averager_0/n3 ) );
  XOR2X1 U103 ( .IN1(\averager_0/dp_cluster_0/add_26_aco/carry[8] ), .IN2(n27), 
        .Q(\averager_0/N13 ) );
  AO22X1 U104 ( .IN1(\fifo_0/rd_addr[0] ), .IN2(fifo_empty), .IN3(n78), .IN4(
        n75), .Q(\fifo_0/n143 ) );
  AO22X1 U105 ( .IN1(\fifo_0/rd_addr[1] ), .IN2(fifo_empty), .IN3(\fifo_0/N55 ), .IN4(n75), .Q(\fifo_0/n142 ) );
  AO22X1 U106 ( .IN1(\fifo_0/rd_addr[2] ), .IN2(fifo_empty), .IN3(\fifo_0/N56 ), .IN4(n75), .Q(\fifo_0/n141 ) );
  AO22X1 U107 ( .IN1(\fifo_0/rd_addr[3] ), .IN2(fifo_empty), .IN3(\fifo_0/N57 ), .IN4(n75), .Q(\fifo_0/n140 ) );
  XOR2X1 U108 ( .IN1(n28), .IN2(
        \averager_0/dp_cluster_0/mult_add_26_aco/PROD_not[9] ), .Q(
        \averager_0/N14 ) );
  NAND4X0 U109 ( .IN1(\fifo_0/n126 ), .IN2(\fifo_0/n127 ), .IN3(\fifo_0/n128 ), 
        .IN4(\fifo_0/n129 ), .QN(fifo_out[2]) );
  NAND4X0 U110 ( .IN1(\fifo_0/n122 ), .IN2(\fifo_0/n123 ), .IN3(\fifo_0/n124 ), 
        .IN4(\fifo_0/n125 ), .QN(fifo_out[3]) );
  NAND4X0 U111 ( .IN1(\fifo_0/n118 ), .IN2(\fifo_0/n119 ), .IN3(\fifo_0/n120 ), 
        .IN4(\fifo_0/n121 ), .QN(fifo_out[4]) );
  NAND4X0 U112 ( .IN1(\fifo_0/n114 ), .IN2(\fifo_0/n115 ), .IN3(\fifo_0/n116 ), 
        .IN4(\fifo_0/n117 ), .QN(fifo_out[5]) );
  NAND4X0 U113 ( .IN1(\fifo_0/n110 ), .IN2(\fifo_0/n111 ), .IN3(\fifo_0/n112 ), 
        .IN4(\fifo_0/n113 ), .QN(fifo_out[6]) );
  XNOR2X1 U114 ( .IN1(\ctrl_2mhz_0/n4 ), .IN2(\ctrl_2mhz_0/read_byte_ps[1] ), 
        .Q(\ctrl_2mhz_0/read_byte_ns[1] ) );
  NAND2X0 U115 ( .IN1(\ctrl_2mhz_0/read_byte_ps[0] ), .IN2(n75), .QN(
        \ctrl_2mhz_0/n4 ) );
  XNOR2X1 U116 ( .IN1(fifo_empty), .IN2(\ctrl_2mhz_0/read_byte_ps[0] ), .Q(
        \ctrl_2mhz_0/read_byte_ns[0] ) );
  OA22X1 U117 ( .IN1(\fifo_0/n213 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n157 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n137 ) );
  OA22X1 U118 ( .IN1(\fifo_0/n212 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n156 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n133 ) );
  OA22X1 U119 ( .IN1(\fifo_0/n211 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n155 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n129 ) );
  OA22X1 U120 ( .IN1(\fifo_0/n210 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n154 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n125 ) );
  OA22X1 U121 ( .IN1(\fifo_0/n209 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n153 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n121 ) );
  OA22X1 U122 ( .IN1(\fifo_0/n208 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n152 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n117 ) );
  OA22X1 U123 ( .IN1(\fifo_0/n207 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n151 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n113 ) );
  OA22X1 U124 ( .IN1(\fifo_0/n206 ), .IN2(\fifo_0/n102 ), .IN3(\fifo_0/n150 ), 
        .IN4(\fifo_0/n103 ), .Q(\fifo_0/n101 ) );
  OA22X1 U125 ( .IN1(\fifo_0/n196 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n204 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n132 ) );
  OA22X1 U126 ( .IN1(\fifo_0/n195 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n203 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n128 ) );
  OA22X1 U127 ( .IN1(\fifo_0/n194 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n202 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n124 ) );
  OA22X1 U128 ( .IN1(\fifo_0/n193 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n201 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n120 ) );
  OA22X1 U129 ( .IN1(\fifo_0/n192 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n200 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n116 ) );
  OA22X1 U130 ( .IN1(\fifo_0/n191 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n199 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n112 ) );
  OA22X1 U131 ( .IN1(\fifo_0/n190 ), .IN2(\fifo_0/n104 ), .IN3(\fifo_0/n198 ), 
        .IN4(\fifo_0/n105 ), .Q(\fifo_0/n100 ) );
  OA22X1 U132 ( .IN1(\fifo_0/n180 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n188 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n131 ) );
  OA22X1 U133 ( .IN1(\fifo_0/n179 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n187 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n127 ) );
  OA22X1 U134 ( .IN1(\fifo_0/n178 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n186 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n123 ) );
  OA22X1 U135 ( .IN1(\fifo_0/n177 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n185 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n119 ) );
  OA22X1 U136 ( .IN1(\fifo_0/n176 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n184 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n115 ) );
  OA22X1 U137 ( .IN1(\fifo_0/n175 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n183 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n111 ) );
  OA22X1 U138 ( .IN1(\fifo_0/n174 ), .IN2(\fifo_0/n106 ), .IN3(\fifo_0/n182 ), 
        .IN4(\fifo_0/n107 ), .Q(\fifo_0/n99 ) );
  OA22X1 U139 ( .IN1(\fifo_0/n164 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n172 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n130 ) );
  OA22X1 U140 ( .IN1(\fifo_0/n163 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n171 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n126 ) );
  OA22X1 U141 ( .IN1(\fifo_0/n162 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n170 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n122 ) );
  OA22X1 U142 ( .IN1(\fifo_0/n161 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n169 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n118 ) );
  OA22X1 U143 ( .IN1(\fifo_0/n160 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n168 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n114 ) );
  OA22X1 U144 ( .IN1(\fifo_0/n159 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n167 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n110 ) );
  OA22X1 U145 ( .IN1(\fifo_0/n158 ), .IN2(\fifo_0/n108 ), .IN3(\fifo_0/n166 ), 
        .IN4(\fifo_0/n109 ), .Q(\fifo_0/n98 ) );
  NBUFFX2 U146 ( .IN(data_ena), .Q(n29) );
  NOR4X0 U147 ( .IN1(fifo_write), .IN2(\ctrl_50mhz_0/n6 ), .IN3(
        \ctrl_50mhz_0/n7 ), .IN4(\ctrl_50mhz_0/n3 ), .QN(
        \ctrl_50mhz_0/write_fifo_ns ) );
  NOR3X0 U148 ( .IN1(\ctrl_50mhz_0/write_byte_ps[0] ), .IN2(
        \ctrl_50mhz_0/write_byte_ps[2] ), .IN3(\ctrl_50mhz_0/write_byte_ps[1] ), .QN(\ctrl_50mhz_0/n6 ) );
  NAND2X0 U149 ( .IN1(\ctrl_50mhz_0/n12 ), .IN2(\ctrl_50mhz_0/n13 ), .QN(
        \ctrl_50mhz_0/write_byte_ns[2] ) );
  NAND4X0 U150 ( .IN1(\ctrl_50mhz_0/write_byte_ps[1] ), .IN2(n63), .IN3(
        \ctrl_50mhz_0/write_byte_ps[0] ), .IN4(\ctrl_50mhz_0/n4 ), .QN(
        \ctrl_50mhz_0/n12 ) );
  OR4X1 U151 ( .IN1(\ctrl_50mhz_0/n4 ), .IN2(n63), .IN3(
        \ctrl_50mhz_0/write_byte_ps[0] ), .IN4(\ctrl_50mhz_0/write_byte_ps[1] ), .Q(\ctrl_50mhz_0/n13 ) );
  XOR2X1 U152 ( .IN1(n77), .IN2(\fifo_0/wr_addr[1] ), .Q(\fifo_0/n93 ) );
  XOR2X1 U153 ( .IN1(n78), .IN2(\fifo_0/wr_addr[0] ), .Q(\fifo_0/n94 ) );
  XOR2X1 U154 ( .IN1(\fifo_0/wr_addr[2] ), .IN2(n76), .Q(\fifo_0/n92 ) );
  NAND3X0 U155 ( .IN1(\fifo_0/wr_addr[1] ), .IN2(\fifo_0/n13 ), .IN3(
        \fifo_0/wr_addr[0] ), .QN(\fifo_0/n78 ) );
  NAND3X0 U156 ( .IN1(\fifo_0/n13 ), .IN2(n143), .IN3(\fifo_0/wr_addr[0] ), 
        .QN(\fifo_0/n15 ) );
  NAND3X0 U157 ( .IN1(\fifo_0/n13 ), .IN2(n144), .IN3(\fifo_0/wr_addr[1] ), 
        .QN(\fifo_0/n3 ) );
  NAND3X0 U158 ( .IN1(\fifo_0/wr_addr[0] ), .IN2(n143), .IN3(\fifo_0/n46 ), 
        .QN(\fifo_0/n57 ) );
  NAND3X0 U159 ( .IN1(\fifo_0/wr_addr[1] ), .IN2(n144), .IN3(\fifo_0/n46 ), 
        .QN(\fifo_0/n47 ) );
  NAND3X0 U160 ( .IN1(\fifo_0/wr_addr[0] ), .IN2(\fifo_0/wr_addr[1] ), .IN3(
        \fifo_0/n46 ), .QN(\fifo_0/n36 ) );
  NOR2X0 U161 ( .IN1(n69), .IN2(\fifo_0/wr_addr[2] ), .QN(\fifo_0/n46 ) );
  AND2X1 U162 ( .IN1(\fifo_0/wr_addr[2] ), .IN2(fifo_write), .Q(\fifo_0/n13 )
         );
  AO22X1 U163 ( .IN1(\fifo_0/n78 ), .IN2(n142), .IN3(n70), .IN4(
        parallel_data[7]), .Q(\fifo_0/n277 ) );
  AO22X1 U164 ( .IN1(\fifo_0/n67 ), .IN2(n134), .IN3(n65), .IN4(
        parallel_data[7]), .Q(\fifo_0/n269 ) );
  AO22X1 U165 ( .IN1(\fifo_0/n57 ), .IN2(n126), .IN3(n66), .IN4(
        parallel_data[7]), .Q(\fifo_0/n261 ) );
  AO22X1 U166 ( .IN1(\fifo_0/n47 ), .IN2(n118), .IN3(n67), .IN4(
        parallel_data[7]), .Q(\fifo_0/n253 ) );
  AO22X1 U167 ( .IN1(\fifo_0/n36 ), .IN2(n110), .IN3(n68), .IN4(
        parallel_data[7]), .Q(\fifo_0/n245 ) );
  AO22X1 U168 ( .IN1(\fifo_0/n26 ), .IN2(n102), .IN3(n71), .IN4(
        parallel_data[7]), .Q(\fifo_0/n237 ) );
  AO22X1 U169 ( .IN1(\fifo_0/n15 ), .IN2(n94), .IN3(n72), .IN4(
        parallel_data[7]), .Q(\fifo_0/n229 ) );
  AO22X1 U170 ( .IN1(\fifo_0/wr_addr[0] ), .IN2(n69), .IN3(n144), .IN4(
        fifo_write), .Q(\fifo_0/n149 ) );
  AO22X1 U171 ( .IN1(\fifo_0/wr_addr[1] ), .IN2(n69), .IN3(\fifo_0/N16 ), 
        .IN4(fifo_write), .Q(\fifo_0/n148 ) );
  AO22X1 U172 ( .IN1(\fifo_0/n78 ), .IN2(n135), .IN3(n70), .IN4(
        parallel_data[0]), .Q(\fifo_0/n270 ) );
  AO22X1 U173 ( .IN1(\fifo_0/n67 ), .IN2(n127), .IN3(n65), .IN4(
        parallel_data[0]), .Q(\fifo_0/n262 ) );
  AO22X1 U174 ( .IN1(\fifo_0/n57 ), .IN2(n119), .IN3(n66), .IN4(
        parallel_data[0]), .Q(\fifo_0/n254 ) );
  AO22X1 U175 ( .IN1(\fifo_0/n47 ), .IN2(n111), .IN3(n67), .IN4(
        parallel_data[0]), .Q(\fifo_0/n246 ) );
  AO22X1 U176 ( .IN1(\fifo_0/n36 ), .IN2(n103), .IN3(n68), .IN4(
        parallel_data[0]), .Q(\fifo_0/n238 ) );
  AO22X1 U177 ( .IN1(\fifo_0/n26 ), .IN2(n95), .IN3(n71), .IN4(
        parallel_data[0]), .Q(\fifo_0/n230 ) );
  AO22X1 U178 ( .IN1(\fifo_0/n15 ), .IN2(n87), .IN3(n72), .IN4(
        parallel_data[0]), .Q(\fifo_0/n222 ) );
  AO22X1 U179 ( .IN1(\fifo_0/n3 ), .IN2(n86), .IN3(parallel_data[7]), .IN4(n73), .Q(\fifo_0/n221 ) );
  AO22X1 U180 ( .IN1(\fifo_0/n3 ), .IN2(n85), .IN3(n15), .IN4(n73), .Q(
        \fifo_0/n220 ) );
  AO22X1 U181 ( .IN1(\fifo_0/n3 ), .IN2(n84), .IN3(n10), .IN4(n73), .Q(
        \fifo_0/n219 ) );
  AO22X1 U182 ( .IN1(\fifo_0/n3 ), .IN2(n83), .IN3(n11), .IN4(n73), .Q(
        \fifo_0/n218 ) );
  AO22X1 U183 ( .IN1(\fifo_0/n3 ), .IN2(n82), .IN3(n12), .IN4(n73), .Q(
        \fifo_0/n217 ) );
  AO22X1 U184 ( .IN1(\fifo_0/n3 ), .IN2(n81), .IN3(n13), .IN4(n73), .Q(
        \fifo_0/n216 ) );
  AO22X1 U185 ( .IN1(\fifo_0/n3 ), .IN2(n80), .IN3(n14), .IN4(n73), .Q(
        \fifo_0/n215 ) );
  AO22X1 U186 ( .IN1(\fifo_0/n3 ), .IN2(n79), .IN3(parallel_data[0]), .IN4(n73), .Q(\fifo_0/n214 ) );
  AO22X1 U187 ( .IN1(\fifo_0/n78 ), .IN2(n141), .IN3(n70), .IN4(n15), .Q(
        \fifo_0/n276 ) );
  AO22X1 U188 ( .IN1(\fifo_0/n78 ), .IN2(n140), .IN3(n70), .IN4(n10), .Q(
        \fifo_0/n275 ) );
  AO22X1 U189 ( .IN1(\fifo_0/n78 ), .IN2(n139), .IN3(n70), .IN4(n11), .Q(
        \fifo_0/n274 ) );
  AO22X1 U190 ( .IN1(\fifo_0/n78 ), .IN2(n138), .IN3(n70), .IN4(n12), .Q(
        \fifo_0/n273 ) );
  AO22X1 U191 ( .IN1(\fifo_0/n78 ), .IN2(n137), .IN3(n70), .IN4(n13), .Q(
        \fifo_0/n272 ) );
  AO22X1 U192 ( .IN1(\fifo_0/n78 ), .IN2(n136), .IN3(n70), .IN4(n14), .Q(
        \fifo_0/n271 ) );
  AO22X1 U193 ( .IN1(\fifo_0/n67 ), .IN2(n133), .IN3(n65), .IN4(n15), .Q(
        \fifo_0/n268 ) );
  AO22X1 U194 ( .IN1(\fifo_0/n67 ), .IN2(n132), .IN3(n65), .IN4(n10), .Q(
        \fifo_0/n267 ) );
  AO22X1 U195 ( .IN1(\fifo_0/n67 ), .IN2(n131), .IN3(n65), .IN4(n11), .Q(
        \fifo_0/n266 ) );
  AO22X1 U196 ( .IN1(\fifo_0/n67 ), .IN2(n130), .IN3(n65), .IN4(n12), .Q(
        \fifo_0/n265 ) );
  AO22X1 U197 ( .IN1(\fifo_0/n67 ), .IN2(n129), .IN3(n65), .IN4(n13), .Q(
        \fifo_0/n264 ) );
  AO22X1 U198 ( .IN1(\fifo_0/n67 ), .IN2(n128), .IN3(n65), .IN4(n14), .Q(
        \fifo_0/n263 ) );
  AO22X1 U199 ( .IN1(\fifo_0/n57 ), .IN2(n125), .IN3(n66), .IN4(n15), .Q(
        \fifo_0/n260 ) );
  AO22X1 U200 ( .IN1(\fifo_0/n57 ), .IN2(n124), .IN3(n66), .IN4(n10), .Q(
        \fifo_0/n259 ) );
  AO22X1 U201 ( .IN1(\fifo_0/n57 ), .IN2(n123), .IN3(n66), .IN4(n11), .Q(
        \fifo_0/n258 ) );
  AO22X1 U202 ( .IN1(\fifo_0/n57 ), .IN2(n122), .IN3(n66), .IN4(n12), .Q(
        \fifo_0/n257 ) );
  AO22X1 U203 ( .IN1(\fifo_0/n57 ), .IN2(n121), .IN3(n66), .IN4(n13), .Q(
        \fifo_0/n256 ) );
  AO22X1 U204 ( .IN1(\fifo_0/n57 ), .IN2(n120), .IN3(n66), .IN4(n14), .Q(
        \fifo_0/n255 ) );
  AO22X1 U205 ( .IN1(\fifo_0/n47 ), .IN2(n117), .IN3(n67), .IN4(n15), .Q(
        \fifo_0/n252 ) );
  AO22X1 U206 ( .IN1(\fifo_0/n47 ), .IN2(n116), .IN3(n67), .IN4(n10), .Q(
        \fifo_0/n251 ) );
  AO22X1 U207 ( .IN1(\fifo_0/n47 ), .IN2(n115), .IN3(n67), .IN4(n11), .Q(
        \fifo_0/n250 ) );
  AO22X1 U208 ( .IN1(\fifo_0/n47 ), .IN2(n114), .IN3(n67), .IN4(n12), .Q(
        \fifo_0/n249 ) );
  AO22X1 U209 ( .IN1(\fifo_0/n47 ), .IN2(n113), .IN3(n67), .IN4(n13), .Q(
        \fifo_0/n248 ) );
  AO22X1 U210 ( .IN1(\fifo_0/n47 ), .IN2(n112), .IN3(n67), .IN4(n14), .Q(
        \fifo_0/n247 ) );
  AO22X1 U211 ( .IN1(\fifo_0/n36 ), .IN2(n109), .IN3(n68), .IN4(n15), .Q(
        \fifo_0/n244 ) );
  AO22X1 U212 ( .IN1(\fifo_0/n36 ), .IN2(n108), .IN3(n68), .IN4(n10), .Q(
        \fifo_0/n243 ) );
  AO22X1 U213 ( .IN1(\fifo_0/n36 ), .IN2(n107), .IN3(n68), .IN4(n11), .Q(
        \fifo_0/n242 ) );
  AO22X1 U214 ( .IN1(\fifo_0/n36 ), .IN2(n106), .IN3(n68), .IN4(n12), .Q(
        \fifo_0/n241 ) );
  AO22X1 U215 ( .IN1(\fifo_0/n36 ), .IN2(n105), .IN3(n68), .IN4(n13), .Q(
        \fifo_0/n240 ) );
  AO22X1 U216 ( .IN1(\fifo_0/n36 ), .IN2(n104), .IN3(n68), .IN4(n14), .Q(
        \fifo_0/n239 ) );
  AO22X1 U217 ( .IN1(\fifo_0/n26 ), .IN2(n101), .IN3(n71), .IN4(n15), .Q(
        \fifo_0/n236 ) );
  AO22X1 U218 ( .IN1(\fifo_0/n26 ), .IN2(n100), .IN3(n71), .IN4(n10), .Q(
        \fifo_0/n235 ) );
  AO22X1 U219 ( .IN1(\fifo_0/n26 ), .IN2(n99), .IN3(n71), .IN4(n11), .Q(
        \fifo_0/n234 ) );
  AO22X1 U220 ( .IN1(\fifo_0/n26 ), .IN2(n98), .IN3(n71), .IN4(n12), .Q(
        \fifo_0/n233 ) );
  AO22X1 U221 ( .IN1(\fifo_0/n26 ), .IN2(n97), .IN3(n71), .IN4(n13), .Q(
        \fifo_0/n232 ) );
  AO22X1 U222 ( .IN1(\fifo_0/n26 ), .IN2(n96), .IN3(n71), .IN4(n14), .Q(
        \fifo_0/n231 ) );
  AO22X1 U223 ( .IN1(\fifo_0/n15 ), .IN2(n93), .IN3(n72), .IN4(n15), .Q(
        \fifo_0/n228 ) );
  AO22X1 U224 ( .IN1(\fifo_0/n15 ), .IN2(n92), .IN3(n72), .IN4(n10), .Q(
        \fifo_0/n227 ) );
  AO22X1 U225 ( .IN1(\fifo_0/n15 ), .IN2(n91), .IN3(n72), .IN4(n11), .Q(
        \fifo_0/n226 ) );
  AO22X1 U226 ( .IN1(\fifo_0/n15 ), .IN2(n90), .IN3(n72), .IN4(n12), .Q(
        \fifo_0/n225 ) );
  AO22X1 U227 ( .IN1(\fifo_0/n15 ), .IN2(n89), .IN3(n72), .IN4(n13), .Q(
        \fifo_0/n224 ) );
  AO22X1 U228 ( .IN1(\fifo_0/n15 ), .IN2(n88), .IN3(n72), .IN4(n14), .Q(
        \fifo_0/n223 ) );
  NAND3X0 U229 ( .IN1(\fifo_0/rd_addr[2] ), .IN2(n78), .IN3(
        \fifo_0/rd_addr[1] ), .QN(\fifo_0/n102 ) );
  NAND3X0 U230 ( .IN1(n78), .IN2(n77), .IN3(\fifo_0/rd_addr[2] ), .QN(
        \fifo_0/n104 ) );
  NAND3X0 U231 ( .IN1(n78), .IN2(n76), .IN3(\fifo_0/rd_addr[1] ), .QN(
        \fifo_0/n106 ) );
  NAND3X0 U232 ( .IN1(\fifo_0/rd_addr[1] ), .IN2(\fifo_0/rd_addr[2] ), .IN3(
        \fifo_0/rd_addr[0] ), .QN(\fifo_0/n103 ) );
  NAND3X0 U233 ( .IN1(\fifo_0/rd_addr[2] ), .IN2(n77), .IN3(
        \fifo_0/rd_addr[0] ), .QN(\fifo_0/n105 ) );
  NAND3X0 U234 ( .IN1(\fifo_0/rd_addr[1] ), .IN2(n76), .IN3(
        \fifo_0/rd_addr[0] ), .QN(\fifo_0/n107 ) );
  NAND3X0 U235 ( .IN1(n77), .IN2(n76), .IN3(\fifo_0/rd_addr[0] ), .QN(
        \fifo_0/n109 ) );
  AND2X1 U236 ( .IN1(\ram_ctr_0/n3 ), .IN2(\ram_ctr_0/n4 ), .Q(\ram_ctr_0/n2 )
         );
  NOR4X0 U237 ( .IN1(\ram_ctr_0/n6 ), .IN2(n31), .IN3(ram_addr[10]), .IN4(
        ram_addr[0]), .QN(\ram_ctr_0/n3 ) );
  NOR4X0 U238 ( .IN1(\ram_ctr_0/n5 ), .IN2(ram_addr[4]), .IN3(ram_addr[6]), 
        .IN4(ram_addr[5]), .QN(\ram_ctr_0/n4 ) );
  OR3X1 U239 ( .IN1(ram_addr[2]), .IN2(ram_addr[3]), .IN3(ram_addr[1]), .Q(
        \ram_ctr_0/n6 ) );
  NOR2X0 U240 ( .IN1(ram_addr[1]), .IN2(ram_addr[0]), .QN(n155) );
  NOR2X0 U241 ( .IN1(n147), .IN2(ram_addr[7]), .QN(n161) );
  NOR2X0 U242 ( .IN1(n151), .IN2(ram_addr[3]), .QN(n157) );
  NOR2X0 U243 ( .IN1(n152), .IN2(ram_addr[2]), .QN(n156) );
  NOR2X0 U244 ( .IN1(n148), .IN2(ram_addr[6]), .QN(n160) );
  NOR2X0 U245 ( .IN1(n149), .IN2(ram_addr[5]), .QN(n159) );
  NOR2X0 U246 ( .IN1(n150), .IN2(ram_addr[4]), .QN(n158) );
  NOR2X0 U247 ( .IN1(n146), .IN2(ram_addr[8]), .QN(n162) );
  AO221X1 U248 ( .IN1(n153), .IN2(ram_wr_n), .IN3(ram_addr[0]), .IN4(n31), 
        .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n17 ) );
  AO221X1 U249 ( .IN1(\ram_ctr_0/N15 ), .IN2(ram_wr_n), .IN3(ram_addr[10]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n16 ) );
  XNOR2X1 U250 ( .IN1(n154), .IN2(ram_addr[10]), .Q(\ram_ctr_0/N15 ) );
  NAND2X0 U251 ( .IN1(n162), .IN2(n145), .QN(n154) );
  AO221X1 U252 ( .IN1(\ram_ctr_0/N6 ), .IN2(ram_wr_n), .IN3(ram_addr[1]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n15 ) );
  AO21X1 U253 ( .IN1(ram_addr[1]), .IN2(ram_addr[0]), .IN3(n155), .Q(
        \ram_ctr_0/N6 ) );
  AO221X1 U254 ( .IN1(\ram_ctr_0/N7 ), .IN2(ram_wr_n), .IN3(ram_addr[2]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n14 ) );
  AO21X1 U255 ( .IN1(ram_addr[2]), .IN2(n152), .IN3(n156), .Q(\ram_ctr_0/N7 )
         );
  AO221X1 U256 ( .IN1(\ram_ctr_0/N8 ), .IN2(ram_wr_n), .IN3(ram_addr[3]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n13 ) );
  AO21X1 U257 ( .IN1(ram_addr[3]), .IN2(n151), .IN3(n157), .Q(\ram_ctr_0/N8 )
         );
  AO221X1 U258 ( .IN1(\ram_ctr_0/N9 ), .IN2(ram_wr_n), .IN3(ram_addr[4]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n12 ) );
  AO21X1 U259 ( .IN1(ram_addr[4]), .IN2(n150), .IN3(n158), .Q(\ram_ctr_0/N9 )
         );
  AO221X1 U260 ( .IN1(\ram_ctr_0/N11 ), .IN2(ram_wr_n), .IN3(ram_addr[6]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n10 ) );
  AO21X1 U261 ( .IN1(ram_addr[6]), .IN2(n148), .IN3(n160), .Q(\ram_ctr_0/N11 )
         );
  AO221X1 U262 ( .IN1(\ram_ctr_0/N12 ), .IN2(ram_wr_n), .IN3(ram_addr[7]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n9 ) );
  AO21X1 U263 ( .IN1(ram_addr[7]), .IN2(n147), .IN3(n161), .Q(\ram_ctr_0/N12 )
         );
  AO221X1 U264 ( .IN1(\ram_ctr_0/N13 ), .IN2(ram_wr_n), .IN3(ram_addr[8]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n8 ) );
  AO21X1 U265 ( .IN1(ram_addr[8]), .IN2(n146), .IN3(n162), .Q(\ram_ctr_0/N13 )
         );
  AO221X1 U266 ( .IN1(\ram_ctr_0/N10 ), .IN2(ram_wr_n), .IN3(ram_addr[5]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n11 ) );
  AO21X1 U267 ( .IN1(ram_addr[5]), .IN2(n149), .IN3(n159), .Q(\ram_ctr_0/N10 )
         );
  OR3X1 U268 ( .IN1(ram_addr[8]), .IN2(ram_addr[9]), .IN3(ram_addr[7]), .Q(
        \ram_ctr_0/n5 ) );
  AO221X1 U269 ( .IN1(\ram_ctr_0/N14 ), .IN2(ram_wr_n), .IN3(ram_addr[9]), 
        .IN4(n31), .IN5(\ram_ctr_0/n2 ), .Q(\ram_ctr_0/n7 ) );
  XNOR2X1 U270 ( .IN1(n145), .IN2(n162), .Q(\ram_ctr_0/N14 ) );
  AND2X1 U271 ( .IN1(\averager_0/acl[0] ), .IN2(n74), .Q(n26) );
  NAND2X0 U272 ( .IN1(n74), .IN2(ram_data[7]), .QN(
        \averager_0/dp_cluster_0/mult_add_26_aco/PROD_not[9] ) );
  AND2X1 U273 ( .IN1(ram_data[6]), .IN2(n74), .Q(n27) );
  NBUFFX2 U274 ( .IN(n61), .Q(n33) );
  NBUFFX2 U275 ( .IN(reset_n), .Q(n61) );
  NBUFFX2 U276 ( .IN(reset_n), .Q(n52) );
  NBUFFX2 U277 ( .IN(reset_n), .Q(n54) );
  NBUFFX2 U278 ( .IN(reset_n), .Q(n55) );
  NBUFFX2 U279 ( .IN(reset_n), .Q(n57) );
  NBUFFX2 U280 ( .IN(reset_n), .Q(n58) );
  NBUFFX2 U281 ( .IN(reset_n), .Q(n59) );
  NBUFFX2 U282 ( .IN(reset_n), .Q(n60) );
  NBUFFX2 U283 ( .IN(reset_n), .Q(n56) );
  NBUFFX2 U284 ( .IN(reset_n), .Q(n53) );
endmodule

