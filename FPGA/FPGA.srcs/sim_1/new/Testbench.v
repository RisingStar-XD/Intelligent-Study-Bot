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


module Testbench(CLK,Data,HREF,PCLK,VSYNC,UART_RX,PWDN,RST,UART_TX);

    input CLK;
    input   [7:0]   Data;
    input           HREF;
    input           PCLK;
    input           VSYNC;
    input           UART_RX;
    
    output          PWDN;
    output          RST;
    output          UART_TX;
    
    
    wire            CAM_PWDN;
    wire            CAM_RST_N;
    wire            CMOS_ACTIVE_VIDEO;
    wire    [23:0]  CMOS_FRAME_DATA;//capture data out
    wire    [7:0]   GSI_DATA;//RGB2GSI
    wire            EOF;
    wire    [9:0]   LINE_CNT;
    wire    [8:0]   ROW_CNT;//FRAME_CNT
    wire            EOF_1;
    wire            EOF_4;
    wire            EOL_4;
    wire    [9:0]   LINE_CNT_2;
    wire    [9:0]   LINE_CNT_3;
    wire    [9:0]   LINE_CNT_4;
    wire    [18:0]  PIXEL_CNT_4;
    wire    [8:0]   ROW_CNT_2;
    wire    [8:0]   ROW_CNT_3;//CNT_SHF
    wire    [7:0]   GSI_DATA_OUT;
    wire    [23:0]  RGB_DATA_OUT_B;//BUFF
    wire    [23:0]  RGB_DATA_OUT_C;//LIGHT_CMP
    wire    [23:0]  YCgCr_DATA;//YCgCr2RGB
    wire            RESULT;//Gauss
    wire            OPEN_OUT;
    wire            CLOSE_OUT;
    wire            ROW_VALID;
    wire            IMAGE_DATA_1;
    wire            IMAGE_DATA_2;
    wire            WREB_1;
    wire            WREB_2;//IMAGE_DISTRIBUTROR
    
    
    
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
    
    
   
    frame_counter frame_counter(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT),
        .row_counter(ROW_CNT),  
        .EOF(EOF)
    );
  
    Counter_Shift Counter_Shift(
        .EOF_in(EOF),
        .clk(CMOS_ACTIVE_VIDEO),
        .line_counter_in(LINE_CNT),
        .row_counter_in(ROW_CNT),
        .EOF_1(EOF_1),
        .EOF_4(EOF_4),
        .EOL_4(EOL_4),
        .line_counter_2(LINE_CNT_2),
        .line_counter_3(LINE_CNT_3),
        .line_counter_4(LINE_CNT_4),
        .pixel_counter_4(PIXEL_CNT_4),
        .row_counter_2(ROW_CNT_2),
        .row_counter_3(ROW_CNT_3)
    );
    
     RGB2GSI RGB2GSI(
        .RGB_Data(CMOS_FRAME_DATA),
        .GSI_Data(GSI_DATA)
    );
    
    
    RGB2GSI_Buff RGB2GSI_Buff(
        .RGB_Data_in(CMOS_FRAME_DATA),
        .GSI_Data_in(GSI_DATA),
        .Clk(CMOS_ACTIVE_VIDEO),
        .RGB_Data_out(RGB_DATA_OUT_B),
        .GSI_Data_out(GSI_DATA_OUT)
    );
    
    
    Light_comp Light_comp(
        .RGB_Data_in(RGB_DATA_OUT_B),
        .GSI_Data(GSI_DATA_OUT),
        .EOF(EOF_1),
        .RGB_Data_out(RGB_DATA_OUT_C)
    );
    
    
    RGB2YCgCr RGB2YCgCr(
        .RGB_Data(RGB_DATA_OUT_C),
        .YCgCr_Data(YCgCr_DATA)
    );
    
    Gauss_Comparator Gauss_Comparator(
        .YCgCr_Data(YCgCr_DATA),
        .result(RESULT)
    );
    
    
    Opening Opening(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT_2),
        .result(RESULT),
        .row_counter(ROW_CNT_2),
        .out(OPEN_OUT)
    );
    
    
    Closing Closing(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT_3),
        .row_counter(ROW_CNT_3),
        .opened(OPEN_OUT),
        .out(CLOSE_OUT)
    );
    
    
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
    
    row_checker row_checker(
        .EOL(EOL_4),
        .clk(CMOS_ACTIVE_VIDEO),
        .valid(ROW_VALID),
        .result(CLOSE_OUT)
    );
    
    face face_horizontal(
    
    
    );
    
    
    uart_recv(
    
    
    );
    
    uart_send();
    
    
    
    line_checker();
  
    
endmodule
