`timescale 1ns / 1ps

module comp_cal(EN,EOF,GSI_Data,coe);

    input EN,EOF;
    input [7:0] GSI_Data;
    output reg [31:0] coe;
    
    parameter size=307200;
    parameter threshold1=245;
    parameter threshold2=235;
    parameter threshold3=225;
    
    reg [7:0] c1,c2,c3;
    
    initial
    begin
        c1=0;
        c2=0;
        c3=0;
    end
    
    always @(*)
    begin
        if(EN)
        begin
            if (EOF)
            begin
                c1<=0;
                c2<=0;
                c3<=0;
            end
        end
    end
    
    always @(GSI_Data)
    begin
        if(EN)
        begin
            if(GSI_Data>=threshold1)
                c1<=c1+1;
            else if(GSI_Data>=threshold2)
                c2<=c2+1;
            else if(GSI_Data>=threshold3)
                c3<=c3+1;
        end
    end
    
    always @(GSI_Data)
    begin
        if (EOF)
        begin
            coe<=(c1*250+c2*240+c3*230)*65535/(c1+c2+c3);
        end
    end
    
endmodule