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
    reg [23:0]  GSI_DATA_OUT;
    reg [7:0]   RGB_DATA_OUT_B;
    
    wire    [23:0]  RGB_DATA_OUT_C;

Light_comp Light_comp(
        .RGB_Data_in(RGB_DATA_OUT_B),
        .GSI_Data(GSI_DATA_OUT),
        .EOF(EOF_1),
        .RGB_Data_out(RGB_DATA_OUT_C)
    );

    initial
    begin
        EOF_1 = 0;
        GSI_DATA_OUT = 0;
        RGB_DATA_OUT_B = 0;
    end
    

endmodule
