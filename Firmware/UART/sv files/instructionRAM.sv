module instructionRAM #(parameter ADDR_WIDTH=8, MAX_ADDRESS=255) (

    output logic [ADDR_WIDTH-1:0] data_out,

    input logic [ADDR_WIDTH-1:0] data_in,
    input logic [1:0] MODE,
    input logic [ADDR_WIDTH-1:0] address,
    input logic clk, rst, DEBUG

);


// MODE may have 3 values
// 0 : write to RAM in FIFO order
// 1 : debug read from RAM in FIFO order
// 2 : CPU fetch via random access


// address registers that will be used depending on the MODE input
logic [ADDR_WIDTH-1:0] addressWRITE_reg = 'd0;
logic [ADDR_WIDTH-1:0] addressDEBUG_reg = 'd0;



// RAM creation
// MAX_ADDRESS * ADDR_WIDTH-bit memory locations
logic [ADDR_WIDTH-1:0] ram [MAX_ADDRESS:0];


// loop var
int unsigned i=0;


// registers used for rising edge detection
// of DEBUG input
logic current_reg = 0;
logic prev_reg = 0;

logic [ADDR_WIDTH-1:0] current_data_reg = 'd0;
logic [ADDR_WIDTH-1:0] prev_data_reg = 'd0;




// this clock controls how fast the read operation is (MODE 0)
always_ff @(posedge clk) begin

    if(rst) begin

        addressWRITE_reg <= 'd0;
        addressDEBUG_reg <= 'd0;
        current_data_reg <= 'd0;
        prev_data_reg <= 'd0;
        data_out <= 'd0;

        // clearing out all RAM contents
        for (i=0; i<MAX_ADDRESS+1; i++) begin

            ram[i] <= 'd0;

        end


    end

    else begin

 

        case(MODE)

        

        // WRITE
        // will detect the character '$' 0x24
        // to indicate next byte
        2'd0 : begin

            // clear other address registers upon switching modes
            addressDEBUG_reg <= 'd0;

            current_data_reg <= data_in;
            prev_data_reg <= current_data_reg;


            // this avoids 'seeing' the same value more than once
            // this is a MUST as this component operates at a MUCH higher frequency
            // than the UART data line
            if (current_data_reg != prev_data_reg) begin

                // ASCII '$' byte
                if (data_in != 'h24) begin

                    ram[addressWRITE_reg] <= data_in;

                end
                
                else begin

                    addressWRITE_reg <= addressWRITE_reg + 1;

                end


            end

            

        end

        // DEBUG READ
        2'd1 : begin

            // clear other address registers upon switching modes
            addressWRITE_reg <= 'd0;

            current_reg <= DEBUG; // clk cycle 1
            prev_reg <= current_reg; // clk cycle 2

            data_out <= ram[addressDEBUG_reg];


            // rising edge detector
            if (current_reg && !prev_reg) begin

                // checks that
                // max address has not been reeached and,
                // next mem location is not empty (non-zero)
                if (addressDEBUG_reg != MAX_ADDRESS && ram[addressDEBUG_reg + 1] != 'd0) begin

                    addressDEBUG_reg <= addressDEBUG_reg + 1;

                end


            end

            

        end

        // CPU RANDOM ACCESS INSTRUCTION FETCH
        // uses address input
        2'd2 : begin

            // clear other address registers upon switching modes
            addressWRITE_reg <= 'd0;
            addressDEBUG_reg <= 'd0;

            data_out <= ram[address];

            

        end


        // defaualt is random access fetch
        default : begin

            // clear other address registers upon switching modes
            addressWRITE_reg <= 'd0;
            addressDEBUG_reg <= 'd0;

            data_out <= ram[address];


        end



        endcase



    end




end




endmodule