`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 10:50:31
// Design Name: 
// Module Name: Testbench_image_distributor
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


module Testbench_image_distributor();

reg         EOF_4;
reg         CMOS_ACTIVE_VIDEO;
reg [18:0]  PIXEL_CNT_4;
reg         CLOSE_OUT;

wire        IMAGE_DATA_1;
wire        IMAGE_DATA_2;
wire        WREB_1;
wire        WREB_2;


image_distributor image_distributor(
        .EOF(EOF_4),
        .addr(PIXEL_CNT_4),
        .clk(CMOS_ACTIVE_VIDEO),
        .image_data(CLOSE_OUT),
        .image_data_1(IMAGE_DATA_1),
        .image_data_2(IMAGE_DATA_2),
        .wren_1(WREB_1),
        .wren_2(WREB_2)
    );
    
    initial
    begin
        EOF_4 = 0;
        PIXEL_CNT_4 = 0;
        CMOS_ACTIVE_VIDEO = 0;
        CLOSE_OUT = 0;
    end
    

endmodule
