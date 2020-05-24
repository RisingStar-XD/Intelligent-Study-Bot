module Testbench_Closing();
    reg         CMOS_ACTIVE_VIDEO;
    reg [9:0]   LINE_CNT_3;
    reg [8:0]   ROW_CNT_3;
    reg         OPEN_OUT;
    
    wire        CLOSE_OUT;


    Closing Closing(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT_3),
        .row_counter(ROW_CNT_3),
        .opened(OPEN_OUT),
        .out(CLOSE_OUT)
    );
    
    initial
    begin
        CMOS_ACTIVE_VIDEO = 0;
        LINE_CNT_3 = 0;
        ROW_CNT_3 = 0;
        OPEN_OUT = 0;

    end
    


endmodule
