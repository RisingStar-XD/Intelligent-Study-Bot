`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 21:12:50
// Design Name: 
// Module Name: Testbench_light_comp
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


module Testbench_light_comp();

    reg         EOF_1;
    reg [7:0]  GSI_DATA_OUT;
    reg [23:0]   RGB_DATA_OUT_B;
    
    wire    [23:0]  RGB_DATA_OUT_C;
    wire    [23:0]  coe;
    wire            EN;
    
Light_comp Light_comp(
        .RGB_Data_in(RGB_DATA_OUT_B),
        .GSI_Data(GSI_DATA_OUT),
        .EOF(EOF_1),
        .RGB_Data_out(RGB_DATA_OUT_C),
        .coe(coe),
        .EN(EN)
    );

    initial
    begin
        EOF_1 = 0;
        GSI_DATA_OUT = 0;
        RGB_DATA_OUT_B = 24'b011001010001011010110010;
        forever 
        begin
        #10 EOF_1 = ~EOF_1;
        RGB_DATA_OUT_B =  RGB_DATA_OUT_B+1;
        GSI_DATA_OUT = GSI_DATA_OUT +1;
        end
    end
    

endmodule
