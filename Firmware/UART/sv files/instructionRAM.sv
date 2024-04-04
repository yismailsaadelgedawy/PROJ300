module instructionRAM (

    output logic [7:0] data_out,

    input logic [7:0] data_in,
    input logic [1:0] MODE,
    input logic [11:0] address,
    input logic clk, rst, DEBUG, load

);


// MODE may have 3 values
// 0 : write to RAM in FIFO order
// 1 : debug read from RAM in FIFO order
// 2 : CPU fetch via random access


// address registers that will be used depending on the MODE input
logic [11:0] addressWRITE_reg = 'd0;
logic [11:0] addressDEBUG_reg = 'd0;



// RAM creation
// MAX_ADDRESS * ADDR_WIDTH-bit memory locations
logic [7:0] ram [5:0];


// loop var
int unsigned i=0;


// registers used for rising edge detection
// of DEBUG input
logic current_reg = 0;
logic prev_reg = 0;

logic [7:0] current_data_reg = 'd0;
logic [7:0] prev_data_reg = 'd0;




// connect this to 9600Hz to avoid clock domain issues for the love of god...
always_ff @(posedge clk) begin

    if(rst) begin

        addressWRITE_reg <= 'd0;
        addressDEBUG_reg <= 'd0;
        current_data_reg <= 'd0;
        prev_data_reg <= 'd0;
        data_out <= 'd0;

        // clearing out all RAM contents
        for (i=0; i<6; i++) begin

            ram[i] <= 'd0;

        end


    end

    else begin

        case(MODE)        

        // WRITE
        2'd0 : begin

            // clear other address registers upon switching modes
            addressDEBUG_reg <= 'd0;
            data_out <= 'd0;


            if (load) begin

                ram[addressWRITE_reg] <= data_in;
                addressWRITE_reg <= addressWRITE_reg + 1;

            end

            if(addressWRITE_reg == 'd6) begin

                addressWRITE_reg <= 'd0;

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
                if (addressDEBUG_reg != 'd5 && ram[addressDEBUG_reg + 1] != 'd0) begin

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