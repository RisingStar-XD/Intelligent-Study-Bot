`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/17 21:32:00
// Design Name: 
// Module Name: Testbench_OV
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


module Testbench_OV();
  
    reg   [7:0]   Data;
    reg           HREF;
    reg           PCLK;
    reg           VSYNC;
  
    wire            CAM_PWDN;
    wire            CAM_RST_N;
    wire            CMOS_ACTIVE_VIDEO;
    wire    [23:0]  CMOS_FRAME_DATA;//capture data out
    
    ov5640_capture_data ov5640_capture_data(
        .cam_pclk(PCLK),
        .cam_vsync(VSYNC),
        .cam_href(HREF),
        .cam_data(Data),
        .cam_rst_n(CAM_RST_N),
        .cam_pwdn(CAM_PWDN),     
        .cmos_active_video(CMOS_ACTIVE_VIDEO),
        .cmos_frame_data(CMOS_FRAME_DATA)  
        );      
  
  initial
  begin
    VSYNC = 0;//根据时序图得出的结果  HSYNC = 1
    HREF = 1;
    PCLK = 1;// 为0或均可
    //后面应该还有图像变化的
  end
  
endmodule
