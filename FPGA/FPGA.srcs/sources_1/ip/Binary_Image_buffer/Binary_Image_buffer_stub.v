// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Apr  3 10:06:35 2020
// Host        : DESKTOP-UQ4S115 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/git_working/Intelligent-Study-Bot/FPGA/FPGA.srcs/sources_1/ip/Binary_Image_buffer/Binary_Image_buffer_stub.v
// Design      : Binary_Image_buffer
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module Binary_Image_buffer(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[18:0],dina[0:0],clkb,enb,addrb[18:0],doutb[0:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [18:0]addra;
  input [0:0]dina;
  input clkb;
  input enb;
  input [18:0]addrb;
  output [0:0]doutb;
endmodule
