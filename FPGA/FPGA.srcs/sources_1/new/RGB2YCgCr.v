`timescale 1ns / 1ps

module RGB2YCgCr(RGB_Data,YCgCr_Data);

    input [23:0] RGB_Data;
    output reg [23:0] YCgCr_Data;
    
    reg [23:0] Y,G,R;
    
    initial
    begin
    Y=0;
    G=0;
    R=0;
    YCgCr_Data=0;
    end
    
    always @(RGB_Data)
    begin
        Y=RGB_Data[7:0]*16777+RGB_Data[15:8]*33030+RGB_Data[23:16]*6357;
        G=RGB_Data[15:8]*28770-RGB_Data[7:0]*20840-RGB_Data[23:16]*7930;
        R=RGB_Data[7:0]*28770-RGB_Data[15:8]*24052-RGB_Data[23:16]*4653;
    end
    
    always @(R)
    begin
        YCgCr_Data[7:0]=Y[23:16]+16;
        YCgCr_Data[15:8]=128+G[23:16];
        YCgCr_Data[23:16]=128+R[23:16];
    end
endmodule
