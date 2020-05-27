`timescale 1ns / 1ps

module image_distributor(
    EOF,clk,count,
    image_data,wren,addr,
    image_data_1,wren_1,addr_1,
    image_data_2,wren_2,addr_2);
    
    input EOF;
    input clk;
    
    input image_data;
    input wren;
    input [18:0] addr;
    
    output reg image_data_1;
    output reg wren_1;
    output reg [18:0] addr_1;
    
    output reg image_data_2;
    output reg wren_2;
    output reg [18:0] addr_2;
    output reg count;
    
    initial
    begin
        count=0;
        {image_data_1,wren_1,addr_1}=0;
        {image_data_2,wren_2,addr_2}=0;
    end
    
    always @(posedge clk)
    begin
        if(EOF)
            count<=!count;
    end
    
    always @(clk)
    begin
        case(count)
        1'b0:{image_data_1,wren_1,addr_1}<={image_data,wren,addr};
        1'b1:{image_data_2,wren_2,addr_2}<={image_data,wren,addr};
        endcase
    end
    
endmodule
