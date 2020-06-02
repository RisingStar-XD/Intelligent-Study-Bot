`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 20:13:15
// Design Name: 
// Module Name: Testbench_CA
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


module Testbench_CA();
reg     d_count;
reg     image1;
reg     image2;

wire    im;        
wire    en1;
wire    en2;

 CA CA(
        .count(d_count),
        .image1(image1),
        .image2(image2),
        .image(im),
        .en1(en1),
        .en2(en2)
    );

initial
begin
    d_count = 0;
    image1 = 1;
    image2 = 0;
        forever 
        begin
            #10 d_count = ~d_count;
            image1 = ~image1;
            image2 = ~image2;
        end
end
endmodule
