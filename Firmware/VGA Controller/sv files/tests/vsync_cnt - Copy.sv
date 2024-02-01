module vsync_cnt (output logic vsync, rgb_en, output logic [9:0] row, input logic [9:0] column, input logic rst, clk);

logic[9:0] count_reg;
logic[9:0] column_reg;

always_comb begin

    row = count_reg;
    column_reg = column;


end


always_ff @(posedge clk) begin

    if (rst) begin

        count_reg <= 'd0;
        vsync <= 1;
        rgb_en <= 1;

    end

    else if (column_reg == 10'd800) begin

        count_reg <= count_reg + 1;

    end

    // WARNING
    // take care of overlaps when using this!!!
    case(count_reg) inside

    // from 480 to 489 (inclusive)
    // INCLUSIVE - subtract one from the range
    [10'd479 : 10'd488] : begin

        rgb_en <= 0;
        vsync <= 1;

    end


    // from 490 to 492
    [10'd489 : 10'd491] : begin

        rgb_en <= 0;
        vsync <= 0;
        

    end

    // from 493 to 524
    [10'd492 : 10'd523] : begin

        rgb_en <= 0;
        vsync <= 1;

    end

    // 525
    10'd524 : begin

        rgb_en <= 0;
        vsync <= 1;

    end


    // 526
    10'd525 : begin

        count_reg <= 0;
        rgb_en <= 1;
        vsync <= 1;

    end

  

    default : begin

        vsync <= 1;
        rgb_en <= 1;


    end


    endcase



end


endmodule