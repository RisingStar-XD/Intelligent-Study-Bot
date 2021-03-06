`timescale 1ns / 1ps

module FPGA(
    Data,PCLK,XCLK,PWDN,HREF,RST,VSYNC,SDA,SCL,//camera input
    UART_RX,UART_TX,
    CLK//Main clock input
    );

    //Ports of 2*12 Pin Pmod interface
    input [7:0] Data;//Data Pins
    input PCLK,VSYNC,HREF;//CMOS synchronization signal and clock
    output RST,PWDN;//reset and sleepmode
    output XCLK;//external clock signal
    inout SDA,SCL;//IIC SDA/SCL signal
    
    //Ports of system resources
    input CLK;//overall clock input
    
    //Ports of UART interface
    input UART_RX;
    output UART_TX;
    
    //Registers working with ov5640 decoding module
    reg rst_cm;
    
    wire counter_rst;
    wire counter_EN;
    wire shifter_rst;
    wire shifter_EN;
    
    Control Control(
        .counter_rst(counter_rst),
        .counter_EN(counter_EN),
        .shifter_rst(shifter_rst),
        .shifter_EN(shifter_EN)
    );
    
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
    wire [18:0] pixel_counter;
    wire EOF,EOL;
    
    frame_counter frame_counter(
        .CLK(cmos_active_video),
        .rst(counter_rst),
        .EN(counter_EN),
        .line_counter(line_counter),
        .row_counter(row_counter),
        .pixel_counter(pixel_counter),
        .EOF(EOF),
        .EOL(EOL)
    );
    
    wire [9:0] line_counter_2;
    wire [8:0] row_counter_2;
    wire [9:0] line_counter_3;
    wire [8:0] row_counter_3;
    wire [9:0] line_counter_4;
    wire [8:0] row_counter_4;
    wire [18:0] pixel_counter_4;
    wire EOF_1,EOF_4,EOL_4;
    
    Counter_Shift Counter_Shift(
        .rst(shifter_rst),
        .EN(shifter_EN),
        .EOF_in(EOF),
        .EOL_in(EOL),
        .line_counter_in(line_counter),
        .row_counter_in(row_counter),
        .pixel_counter_in(pixel_counter),
        .EOF_1(EOF_1),
        .line_counter_2(line_counter_2),
        .row_counter_2(row_counter_2),
        .line_counter_3(line_counter_3),
        .row_counter_3(row_counter_3),
        .line_counter_4(line_counter_4),
        .row_counter_4(row_counter_4),
        .pixel_counter_4(pixel_counter_4),
        .clk(cmos_active_video),
        .EOL_4(EOL_4),
        .EOF_4(EOF_4)
    );
    
    wire [7:0] GSI_Data;
    
    RGB2GSI RGB2GSI(
        .RGB_Data(cmos_frame_data),
        .GSI_Data(GSI_Data)
    );
    
    wire [23:0] cmos_frame_buffed;
    wire [7:0] GSI_Buffed;
    
    RGB2GSI_Buff RGB2GSI_Buff(
        .RGB_Data_in(cmos_frame_data),
        .RGB_Data_out(cmos_frame_buffed),
        .GSI_Data_in(GSI_Data),
        .GSI_Data_out(GSI_Buffed),
        .Clk(cmos_active_video)
    );
    
    wire [23:0] RGB_Compensated;
    
    Light_comp Light_comp(
        .RGB_Data_in(cmos_frame_buffed),
        .RGB_Data_out(RGB_Compensated),
        .GSI_Data(GSI_Buffed),
        .EOF(EOF_1)
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
    wire [9:0] line_O;
    wire [8:0] row_O;
    
    Opening Opening(
        .line_counter(line_counter_2),
        .row_counter(row_counter_2),
        .result(result),
        .CLK(cmos_active_video),
        .out(opened),
        .line_counter_o(line_O),
        .row_counter_o(row_O)
    );
    
    wire [9:0] line_C;
    wire [8:0] row_C;
    
    Closing Closing(
        .line_counter(line_O),
        .row_counter(row_O),
        .opened(opened),
        .CLK(cmos_active_video),
        .out(closed),
        .line_counter_o(line_C),
        .row_counter_o(row_C)
    );
    
    reg wea;
    wire [1:0] image_data;
    wire [1:0] wren;
    wire [18:0] Pixel_addr_1;
    wire [18:0] Pixel_addr_2;
    wire d_count;
    
    image_distributor image_distributor(
        .EOF(EOF_4),
        .count(d_count),
        .clk(cmos_active_video),
        .image_data(closed),
        .wren(wea),
        .addr(pixel_counter_4),
        .image_data_1(image_data[0]),
        .wren_1(wren[0]),
        .addr_1(Pixel_addr_1),
        .image_data_2(image_data[1]),
        .wren_2(wren[1]),
        .addr_2(Pixel_addr_2)
    );
    
    wire image1,image2;
    wire en1,en2;
    wire [18:0] check_addr;
    
    Binary_Image_buffer Binary_Image_1(
        .clka(cmos_active_video),
        .ena(),
        .wea(wren[0]),
        .addra(Pixel_addr_1),
        .dina(image_data[0]),
        .clkb(),
        .enb(en1),
        .addrb(check_addr),
        .doutb(image1)
    );
    
    Binary_Image_buffer Binary_Image_2(
        .clka(cmos_active_video),
        .ena(),
        .wea(wren[1]),
        .addra(Pixel_addr_2),
        .dina(image_data[1]),
        .clkb(),
        .enb(en2),
        .addrb(check_addr),
        .doutb(image2)
    );
    
    wire valid;
    
    row_checker row_checker(
        .result(closed),
        .EOL(EOL_4),
        .clk(cmos_active_video),
        .valid(valid)
    );
    
    wire [9:0] horizontal_start,horizontal_end;
    
    face face_horizontal(
        .valid(valid),
        .clk(EOL_4),
        .counter({1'b0,row_counter_4}),
        .s(horizontal_start),
        .e(horizontal_end),
        .EOF(EOF_4)
    );
    
    wire line_valid;
    wire line_ready;
    wire EEOF;
    wire im;
    wire [9:0] check_counter;
    
    line_checker line_checker(
        .clk(),
        .image(im),
        .en(EOF_4),
        .valid(line_valid),
        .ready(line_ready),
        .line_counter(check_counter),
        .addr(check_addr),
        .EEOF(EEOF)
    );
    
    CA CA(
        .count(d_count),
        .image1(image1),
        .image2(image2),
        .image(im),
        .en1(en1),
        .en2(en2)
    );
    
    face face_vertical(
        .valid(line_valid),
        .clk(line_ready),
        .counter(check_counter),
        .s(vertical_start),
        .e(vertical_end),
        .EOF(EEOF)
    );
    
    uart_recv(
        .sys_clk(),
        .sys_rst_n(),
        .uart_rxd(UART_RX),
        .uart_done(),
        .uart_data()
    );
    
    uart_send(
        .sys_clk(),
        .sys_rst_n(),
        .uart_en(),
        .uart_din(),
        .uart_tx_busy(),
        .uart_txd(UART_TX)
    );
    
endmodule
