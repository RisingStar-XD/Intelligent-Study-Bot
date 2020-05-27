`timescale 1ns / 1ps

module RGB2GSI(RGB_Data,GSI_Data);
    
    input [23:0] RGB_Data;
    output [7:0] GSI_Data;
    
    
    function [7:0] GSI_count;
        input [23:0] RGB_Data;
        reg [23:0] GSI;
        begin
            GSI=(RGB_Data[7:0]*19595 + RGB_Data[15:8]*38469 + RGB_Data[23:16]*7472);
            GSI_count=GSI[23:16];
        end
    endfunction
    
    assign GSI_Data=GSI_count(RGB_Data);
    
endmodule
