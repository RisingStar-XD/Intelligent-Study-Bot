`timescale 1ns / 1ps

module Window_gen(line_counter,row_counter,result,Window,CLK);
    
    input [9:0] line_counter;
    input [8:0] row_counter;
    input result;
    input CLK;
    
    output [8:0] Window;
    
    wire [2:0] Data1,Data2,Data3;
    
    assign Window [2:0]=Data1;
    assign Window [5:3]=Data2;
    assign Window [8:6]=Data3;
    
    reg CLR;
    
    three_bit_shift_reg three_bit_shift_reg1(
        .D_in(result),
        .Data(Data1),
        .CLK(CLK),
        .CLR(CLR)
    );
    
    wire dout[1:0];
    reg wea[1:0];
    reg ena[1:0];
    
    line_buffer line_buffer1(
        .clka(CLK),
        .ena(ena[0]),
        .wea(wea[0]),
        .addra(line_counter),
        .dina(result),
        .douta(dout[0])
    );
    
    three_bit_shift_reg three_bit_shift_reg2(
        .D_in(dout[0]),
        .Data(Data2),
        .CLK(CLK),
        .CLR(CLR)
    );
    
    line_buffer line_buffer2(
        .clka(CLK),
        .ena(ena[1]),
        .wea(wea[1]),
        .addra(line_counter),
        .dina(dout[0]),
        .douta(dout[1])
    );
    
    three_bit_shift_reg three_bit_shift_reg3(
        .D_in(dout[1]),
        .Data(Data3),
        .CLK(CLK),
        .CLR(CLR)
    );
    
endmodule
