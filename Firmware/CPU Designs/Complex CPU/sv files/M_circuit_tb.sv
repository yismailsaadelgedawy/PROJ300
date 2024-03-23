module M_circuit_tb;

// internal wires

// in

logic rst;
logic clk_50;
logic [11:0] AR;
logic [31:0] DR;
logic CU;         // MEMLOAD


// out
logic [37:0] data_out;

// inst and wiring
M_circuit dut (

    // in
    .rst(rst),
    .clk_50(clk_50),
    .AR(AR),
    .DR(DR),
    .CU(CU),

    // out
    .data_out(data_out)

);


// clock
always begin

    clk_50 <= 1;
    #5ns;
    clk_50 <= 0;
    #5ns;

end

// loop var
int unsigned i;

// used to fill memory via loop
int unsigned data_offset = 0;   // implied = 32'd0

// error flag
bit error_flag = 0;

// testing
initial begin

    // rst
    rst = 1;
    AR = 12'h000;
    DR = 32'd0;
    CU = 0; // load disabled
    #10ns;

    // the first instruction in the ROM
    assert (data_out == {4'b0001,2'b00,16'h0000,16'h000F}) $display("passed rst"); else begin
        $error("failed rst"); error_flag = 1;
    end 

    rst = 0;

    $display("////////// displaying intruction ROM contents //////////\n");

    // boundary addresses from 0x000 - 0x400   (0000 - 1024)
    for(i=0;i<1025;i++) begin

        AR = i[11:0]; // pointing to instructions address space
        #10ns;

        if(AR == 12'h000) begin
            assert (data_out == {4'b0001,2'b00,16'h0000,16'h000F}) $display("passed instruction %d",i); else begin
                 $error("failed instruction %d",i); error_flag = 1; 
                end
        end

        if(AR == 12'h001) begin
            assert (data_out == {4'b0001,2'b00,16'h1000,16'h00FF}) $display("passed instruction %d",i); else
             begin $error("failed instruction %d",i); error_flag = 1; 
            end
        end

        if(AR > 12'h001) begin
            assert (data_out == 38'd0) else begin
                 $error("failed instruction %d",i); error_flag = 1; 
                end
        end        

    end

    $display("////////// storing data into memory mapped registers //////////\n");

    // 13 MMRs thus far
    // lower boundary address starts from 0x401 (1025)
    for(i=1025;i<1038;i++) begin

        DR = 32'd200 + data_offset;  // data to be loaded        
        AR = i[11:0];   // pointing to MMR address space
        CU = 1; // MEMLOAD from Control Unit
        #10ns;
        CU = 0;
        #10ns;

        data_offset++;

    end

    data_offset = 0;

    $display("////////// loading data from memory mapped registers //////////\n");

     for(i=1025;i<1038;i++) begin       

        AR = i[11:0];   // pointing to MMR address space
        #10ns;
        assert (data_out == (32'd200 + data_offset)) else begin
             $error("failed mmr %d",data_offset); error_flag = 1; 
            end

        data_offset++;

    end

    data_offset = 0;


    $display("////////// storing data into stack memory //////////\n");

    // boundary addresses: 0x44C - 0xFFF   (1100 - 4095)
    for(i=1100;i<4096;i++) begin

        DR = 32'd300 + data_offset;  // data to be loaded        
        AR = i[11:0];   // pointing to stack address space
        CU = 1; // MEMLOAD from Control Unit
        #10ns;               
        CU = 0;
        #10ns;
        
        data_offset++;

    end

    data_offset = 0;

    $display("////////// loading data from stack memory //////////\n");

     for(i=1100;i<4096;i++) begin       

        AR = i[11:0];   // pointing to stack address space
        #10ns; 
        assert (data_out == (32'd300 + data_offset)) else begin
             $error("failed stack %d",data_offset); error_flag = 1;
        end

        data_offset++;

    end

    if(error_flag) $display("\n//////// WARNING: Not all tests passed ////////\n");
    else $display("//////// ALL TESTS PASSED! ////////\n");


    $stop;

end




endmodule