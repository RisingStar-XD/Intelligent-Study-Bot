module Testbench_RGB2GSI();
    reg [23:0]  CMOS_FRAME_DATA;
    
    wire    [7:0]   GSI_DATA;    
    
     RGB2GSI RGB2GSI(
        .RGB_Data(CMOS_FRAME_DATA),
        .GSI_Data(GSI_DATA)
    );
    
    initial
    begin
        CMOS_FRAME_DATA = 0;
    end

endmodule