module instructionRAMN #(parameter N=8, MAX_ADDRESS=255) (

    output logic [N-1:0] data_out,

    input logic [N-1:0] data_in,
    input logic [1:0] MODE,
    input logic [N-1:0] address,
    input logic clk, rst, DEBUG

);


// MODE may have 3 values
// 0 : read from RAM in FIFO order
// 1 : write to RAM in FIFO order
// 2 : debug read from RAM in FIFO order
// 3 : CPU fetch via random access (later)


// address registers that will be used depending on the MODE input
logic [N-1:0] addressREAD_reg = 'd0;
logic [N-1:0] addressWRITE_reg = 'd0;
logic [N-1:0] addressDEBUG_reg = 'd0;



// RAM creation
// MAX_ADDRESS * N-bit memory locations
logic [N-1:0] ram [MAX_ADDRESS:0];


// loop var
int unsigned i=0;


// registers used for rising edge detection
// of DEBUG input
logic current_reg = 0;
logic prev_reg = 0;

// this clock controls how fast the read operation is (MODE 0)
always_ff @(posedge clk) begin

    if(rst) begin

        addressREAD_reg = 'd0;
        addressWRITE_reg = 'd0;
        addressDEBUG_reg = 'd0;
        data_out <= 'd0;

        // clearing out all RAM contents
        for (i=0; i<MAX_ADDRESS+1; i++) begin

            ram[i] <= 'd0;

        end


    end

    else begin

        case(MODE)

        
        // READ
        2'd0 : begin

            // clear other address registers upon switching modes
            //addressREAD_reg = 'd0;
            addressWRITE_reg <= 'd0;
            addressDEBUG_reg <= 'd0;

            data_out <= ram[addressREAD_reg];

            // checks that
            // a) not at last memory location and,
            // b) next mem location not empty (not containing zero)
            if (addressREAD_reg != MAX_ADDRESS && ram[addressREAD_reg + 1] != 'd0) begin

                addressREAD_reg <= addressREAD_reg + 1;

            end

        end

        // WRITE
        // will detect the character '$' 0x24
        // to indicate next byte
        2'd1 : begin

            // clear other address registers upon switching modes
            addressREAD_reg <= 'd0;
            //addressWRITE_reg = 'd0;
            addressDEBUG_reg <= 'd0;

            // ASCII '$' byte
            if (data_in != 'h24) begin

                ram[addressWRITE_reg] <= data_in;

            end
            
            else begin

                addressWRITE_reg <= addressWRITE_reg + 1;

            end

        end

        // DEBUG READ
        2'd2 : begin

            // clear other address registers upon switching modes
            addressREAD_reg <= 'd0;
            addressWRITE_reg <= 'd0;
            //addressDEBUG_reg = 'd0;

            current_reg <= DEBUG; // clk cycle 1
            prev_reg <= current_reg; // clk cycle 2

            data_out <= ram[addressDEBUG_reg];


            // rising edge detector
            if (current_reg && !prev_reg) begin

                if (addressDEBUG_reg != MAX_ADDRESS && ram[addressDEBUG_reg + 1] != 'd0) begin

                    addressDEBUG_reg <= addressDEBUG_reg + 1;

                end


            end

            

        end

        // CPU RANDOM ACCESS INSTRUCTION FETCH
        // uses address input
        2'd3 : begin

            // clear other address registers upon switching modes
            addressREAD_reg <= 'd0;
            addressWRITE_reg <= 'd0;
            addressDEBUG_reg = 'd0;

            

        end

        // default case is WRITE
        // default : begin


        // end



        endcase



    end




end




endmodule