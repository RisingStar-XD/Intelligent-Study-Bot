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
reg         wea;

wire        IMAGE_DATA_1;
wire        IMAGE_DATA_2;
wire        WREB_1;
wire        WREB_2;
wire    [18:0]  Pixel_addr_1;
wire    [18:0]  Pixel_addr_2;
wire        d_count;

image_distributor image_distributor(
        .EOF(EOF_4),
        .addr(PIXEL_CNT_4),
        .clk(CMOS_ACTIVE_VIDEO),
        .image_data(CLOSE_OUT),
        .wren(wea),
        
        .count(d_count),
        .addr_1(Pixel_addr_1),
        .addr_2(Pixel_addr_2),
        .image_data_1(IMAGE_DATA_1),
        .image_data_2(IMAGE_DATA_2),
        .wren_1(WREB_1),
        .wren_2(WREB_2)
    );
 
       
    initial
    begin
        EOF_4 = 1;
        CMOS_ACTIVE_VIDEO = 0;
        PIXEL_CNT_4 = 19'b01010100101010110101;
        wea = 1;
        CLOSE_OUT = 0;
        forever
        begin
            #10 CMOS_ACTIVE_VIDEO = ~CMOS_ACTIVE_VIDEO;
            #10 PIXEL_CNT_4 = PIXEL_CNT_4+1;
        
        end
    
    end
    

endmodule
