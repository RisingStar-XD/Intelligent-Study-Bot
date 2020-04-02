`timescale 1ns / 1ps

module Eroding (Window,out);

    input [8:0] Window;
    
    output out;

    assign out=Window[0]*Window[1]*Window[2]*Window[3]*Window[4]*Window[5]*Window[6]*Window[7]*Window[8];
    
endmodule
