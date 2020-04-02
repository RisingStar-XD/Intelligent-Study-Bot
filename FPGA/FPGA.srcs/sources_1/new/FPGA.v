`timescale 1ns / 1ps

module FPGA(
    Data,PCLK,XCLK,PWDN,HREF,RST,VSYNC,SDA,SCL,//camera input
    CLK
    );

    //Ports of 2*12 Pin Pmod interface
    input [7:0] Data;//Data Pins
    input PCLK,VSYNC,HREF;//CMOS synchronization signal and clock
    output RST,PWDN;//reset and sleepmode
    output XCLK;//external clock signal
    inout SDA,SCL;//IIC SDA/SCL signal
    
    //Ports of system resources
    
    input CLK;//overall clock input
    
    //Registers working with ov5640 decoding module
    reg rst_cm;
    
    wire cmos_frame_clk;
    wire cmos_frame_ce;
    wire cmos_frame_vsync;
    wire cmos_active_video;
    wire [23:0] cmos_frame_data;
    
    ov5640_capture_data ov5640_capture_data(
        .rst_n(rst_cm),
        .cam_pclk(PCLK),
        .cam_vsync(VSYNC),
        .cam_href(HREF),
        .cam_data(Data),
        .cam_rst_n(RST),
        .cam_pwdn(PWDN),
        .cmos_frame_clk(cmos_frame_clk),
        .cmos_frame_ce(cmos_frame_ce),
        .cmos_frame_vsync(cmos_frame_vsync),
        .cmos_active_video(cmos_active_video),
        .cmos_frame_data(cmos_frame_data)
    );
    
    wire [9:0] line_counter;
    wire [8:0] row_counter;
    wire EOF;
    
    frame_counter frame_counter(
        .CLK(cmos_active_video),
        .rst(),
        .line_counter(line_counter),
        .row_counter(row_counter),
        .EOF(EOF)
    );
    
    wire [7:0] GSI_Data;
    
    RGB2GSI RGB2GSI(
        .RGB_Data(cmos_frame_data),
        .GSI_Data(GSI_Data)
    );
    
    wire [23:0] RGB_Compensated;
    wire ch;
    
    Light_comp Light_comp(
        .RGB_Data_in(cmos_frame_data),
        .RGB_Data_out(RGB_Compensated),
        .GSI_Data(GSI_Data),
        .ch(ch),
        .EOF(EOF)
    );
    
    wire [23:0] YCgCr_Data;
    
    RGB2YCgCr RGB2YCgCr(
        .RGB_Data(RGB_Compensated),
        .YCgCr_Data(YCgCr_Data)
    );
    
    wire result;
    
    Gauss_Comparator Gauss_Comparator(
        .YCgCr_Data(YCgCr_Data),
        .result(result)
    );
    
    wire opened,closed;
    
    Opening Opening(
        .line_counter(line_counter),
        .row_counter(row_counter),
        .result(result),
        .CLK(cmos_active_video),
        .out(opened)
    );
    
    Closing Closing(
        .line_counter(line_counter),
        .row_counter(row_counter),
        .opened(opened),
        .CLK(cmos_active_video),
        .out(closed)
    );
    
endmodule
