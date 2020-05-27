`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2020 02:49:50 PM
// Design Name: 
// Module Name: CA
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


module CA(count,image1,image2,image,en1,en2);
    
    input count;
    input image1,image2;
    
    output reg image;
    output reg en1,en2;
    
    always @(*)
    begin
        case (count)
        0:{en1,en2,image}={2'b01,image2};
        1:{en1,en2,image}={2'b10,image1};
        endcase
    end
    
endmodule
