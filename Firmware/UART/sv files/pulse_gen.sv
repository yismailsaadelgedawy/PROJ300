module pulse_gen (output logic q, input logic d, clk, rst);

// register to hold previous value
logic current_reg = 0;
logic prev_reg = 0;

// logic flag = 1;

// *
// non blocking assignment means that in clk cycle 1 (assuming d=1 and both registers
// are holding 0) current_reg will hold 1. Then, as prev_reg depends on the current_reg,
// it will update on clk cycle 2. This will be synthesised as two Dffs in series.

// If blocking assignment was used instead, prev_reg will be wired directly to current_reg
// so they will both have the same value all the time

always_ff @(posedge clk or posedge rst) begin

    if (rst) begin

        q <= 0;
        current_reg <= 0;
        prev_reg <= 0;

    end

    else begin

    

        // *
        current_reg <= d; // clk cycle 1
        prev_reg <= current_reg; // clk cycle 2

        if (current_reg != prev_reg) begin

            q <= 1;

        end

        else begin

            q <= 0;
        
        end




    end


end



endmodule