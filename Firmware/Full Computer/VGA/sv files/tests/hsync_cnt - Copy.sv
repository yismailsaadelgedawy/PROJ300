module hsync_cnt (output logic hsync, rgb_en, output logic [9:0] column, input logic rst, clk);

logic[9:0] count_reg;

always_comb begin

    column = count_reg;


end


always_ff @(posedge clk) begin

    if (rst) begin

        count_reg <= 'd0;
        hsync <= 1;
        rgb_en <= 1;

    end

    else begin

        count_reg <= count_reg + 1;

    end

    // WARNING
    // take care of overlaps when using this!!!
    case(count_reg) inside

    // from 640 to 655 (inclusive)
    // INCLUSIVE - subtract one from the range
    [10'd639 : 10'd654] : begin

        rgb_en <= 0;
        hsync <= 1;

    end


    // from 656 to 752
    [10'd655 : 10'd751] : begin

        rgb_en <= 0;
        hsync <= 0;
        

    end

    // from 753 to 799
    [10'd752 : 10'd798] : begin

        rgb_en <= 0;
        hsync <= 1;

    end

    // 800
    10'd799 : begin

        rgb_en <= 0;
        hsync <= 1;

    end


    // 801
    10'd800 : begin

        count_reg <= 0;
        rgb_en <= 1;
        hsync <= 1;

    end

  

    default : begin

        hsync <= 1;
        rgb_en <= 1;


    end


    endcase



end


endmodule