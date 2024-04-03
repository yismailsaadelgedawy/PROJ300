module instructionRAM_m (

    output logic [37:0] data_out,

    input logic [7:0] data_in,
    input logic [9:0] address,      // 10-bit address (1024)
    input logic [1:0] MODE,
    input logic clk, load, btn           // load: connected to stop bit of UART; btn: connected to push button


);

// asynchronous RAM module

// MODE may have 3 values
// 0 : write to RAM in FIFO order
// 1 : debug read from RAM in FIFO order
// 2 : CPU fetch via random access

// internal registers
// the 8-bits will be recieved in this order!
logic [3:0] opcode_reg;
logic [1:0] sel_reg;
logic [7:0] op1h_reg;
logic [7:0] op1l_reg;
logic [7:0] op2h_reg;
logic [7:0] op2l_reg;

// internal address counters
int unsigned addr = 0;
int unsigned addr_debug;

// load counter
int unsigned load_cnt = 0;

// RAM creation
// 1024 * 38-bit memory locations
bit [37:0] ram [(2**10)-1:0];


always_ff @(posedge clk) begin    

    case(MODE)

    // write
    2'd0 : begin

        data_out <= 'd0;        

        if(load) begin

            if(load_cnt == 'd0) begin
                opcode_reg <= data_in;
            end

            if(load_cnt == 'd1) begin
                sel_reg <= data_in;
            end

            if(load_cnt == 'd2) begin
                op1h_reg <= data_in;
            end

            if(load_cnt == 'd3) begin
                op1l_reg <= data_in;
            end

            if(load_cnt == 'd4) begin
                op2h_reg <= data_in;
            end

            if(load_cnt == 'd5) begin

                op2l_reg <= data_in;

                load_cnt <= 'd0;    // reset load counter
                ram[addr] <= {opcode_reg,sel_reg,op1h_reg,op1l_reg,op2h_reg,op2l_reg};  // store in RAM
                addr <= addr + 1;   // increment to next memory location

            end

            load_cnt <= load_cnt + 1;   

        end
             

    end

    // debug
    2'd1 : begin

        data_out <= ram[addr_debug];

        if(btn) begin
           addr_debug <= addr_debug + 1;
        end

    end

    // random access read
    2'd2 : begin
        data_out <= ram[address];
    end
    

    endcase

end





endmodule