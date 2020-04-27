`timescale 1ns / 1ps

module RGB2GSI_Buff(RGB_Data_in,RGB_Data_out,GSI_Data_in,GSI_Data_out,Clk);
    
    input [23:0] RGB_Data_in;
    input [7:0] GSI_Data_in;
    input Clk;
    
    output reg [23:0] RGB_Data_out;
    output reg [7:0] GSI_Data_out;
    
    initial
    begin
        RGB_Data_out=0;
        GSI_Data_out=0;
    end
    
    always @(posedge Clk)
    begin
        RGB_Data_out=RGB_Data_in;
        GSI_Data_out=GSI_Data_in;
    end
endmodule
