`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 07:48:00 PM
// Design Name: 
// Module Name: RGB2GSI
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


module RGB2GSI(RGB_Data,GSI_Data,CLK);
    
    input [23:0] RGB_Data;
    input CLK;
    output [7:0] GSI_Data;
    
    reg [7:0] GSI_Data;
    reg [23:0] GSI;
    
    always @(posedge CLK)
    begin
        GSI=(RGB_Data[7:0]*19595 + RGB_Data[15:8]*38469 + RGB_Data[23:16]*7472);
        GSI_Data=GSI[23:16];
    end
    
endmodule
