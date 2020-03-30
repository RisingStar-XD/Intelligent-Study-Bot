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
    wire cmos_frame_data;
    
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
    
    wire GSI_Data;
    
    RGB2GSI RGB2GSI(
        .RGB_Data(cmos_frame_data),
        .GSI_Data(GSI_Data),
        .CLK(cmos_active_video)
    );
    
endmodule
