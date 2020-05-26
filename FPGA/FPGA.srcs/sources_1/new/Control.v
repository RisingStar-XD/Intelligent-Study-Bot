`timescale 1ns / 1ps

module Control(
    counter_rst,counter_EN,
    shifter_rst,shifter_EN
    );
    
    output reg counter_rst,counter_EN;
    output reg shifter_rst,shifter_EN;
    
    initial
    begin
        {counter_rst,counter_EN}=0;
        {shifter_rst,shifter_EN}=0;
    end
    
endmodule
