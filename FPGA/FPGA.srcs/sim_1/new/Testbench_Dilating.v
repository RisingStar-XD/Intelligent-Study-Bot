`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/29 11:46:46
// Design Name: 
// Module Name: Testbench_Dilating
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


module Testbench_Dilating();

    reg [8:0]   Window;
    
    wire        out;
    
    Dilating Dilating(
        .Window(Window),
        .out(out)    
    );
    
    initial
    begin
    Window = 9'b100100101;
    #10 Window = 9'b101010010;
    #10 Window = Window+1;
    end

endmodule
