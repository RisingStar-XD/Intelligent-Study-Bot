`timescale 1ns / 1ps

module RGB2GSI(RGB_Data,GSI_Data);
    
    input [23:0] RGB_Data;
    output [7:0] GSI_Data;
    
    reg [7:0] GSI_Data;
    reg [23:0] GSI;
    
    initial
    begin
    GSI_Data=0;
    GSI=0;
    end
    
    always @(*)
    begin
        GSI=(RGB_Data[7:0]*19595 + RGB_Data[15:8]*38469 + RGB_Data[23:16]*7472);
        GSI_Data=GSI[23:16];
    end
    
endmodule
