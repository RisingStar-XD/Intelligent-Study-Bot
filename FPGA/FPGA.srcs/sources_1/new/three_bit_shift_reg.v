`timescale 1ns / 1ps

module D_trigger(clk,rst,D,Q);

	input clk;
	input rst;
	input D;
	output Q;

	reg Q;

	always @ (posedge clk or negedge rst)
	begin
		if(~rst)
		begin 
			Q<=0;
		end
		else
		begin
			Q<=D;
		end
	end

endmodule

module three_bit_shift_reg(D_in,Data,CLK,CLR);

    input D_in;
    input CLK,CLR;
    
    output [2:0] Data;
    
    wire Q[1:0];
    
    D_trigger D_trigger1(
        .clk(CLK),
        .rst(CLR),
        .D(D_in),
        .Q(Q[0])
    );
    
    D_trigger D_trigger2(
        .clk(CLK),
        .rst(CLR),
        .D(Q[0]),
        .Q(Q[1])
    );
    
    D_trigger D_trigger3(
        .clk(CLK),
        .rst(CLR),
        .D(Q[1]),
        .Q(Data[2])
    );
    
    assign Data[1]=Q[1];
    assign Data[0]=Q[0];

endmodule
