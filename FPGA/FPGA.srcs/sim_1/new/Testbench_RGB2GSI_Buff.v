`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 21:00:06
// Design Name: 
// Module Name: Testbench_RGB2GSI_Buff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Testbench_RGB2GSI_Buff();
    
    reg [23:0]  CMOS_FRAME_DATA;
    reg [7:0]   GSI_DATA;
    reg         CMOS_ACTIVE_VIDEO;
    
    wire    [23:0]  RGB_DATA_OUT_B;
    wire    [7:0]   GSI_DATA_OUT;

 RGB2GSI_Buff RGB2GSI_Buff(
        .RGB_Data_in(CMOS_FRAME_DATA),
        .GSI_Data_in(GSI_DATA),
        .Clk(CMOS_ACTIVE_VIDEO),
        .RGB_Data_out(RGB_DATA_OUT_B),
        .GSI_Data_out(GSI_DATA_OUT)
    );
    
    initial 
    begin
        CMOS_FRAME_DATA = 6'h000000;
        GSI_DATA = 2'h00;
        CMOS_ACTIVE_VIDEO = 0;
    
    
    end
    


endmodule
