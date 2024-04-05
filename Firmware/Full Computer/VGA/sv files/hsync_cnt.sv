module hsync_cnt (output logic hsync, rgb_en, output logic [10:0] column, input logic rst, clk);

logic[10:0] count_reg;

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

    // from 0 to 639
    if (count_reg < 11'd639) begin

        rgb_en <= 1;
        hsync <= 1;

    end


    // from 640 to 655
    if (count_reg > 11'd638 && count_reg < 11'd655) begin

        rgb_en <= 0;
        hsync <= 1;


    end


    // from 656 to 751
    if (count_reg > 11'd654 && count_reg < 11'd751) begin

        rgb_en <= 0;
        hsync <= 0;


    end

    // from 752 to 799
    if (count_reg > 11'd750 && count_reg < 11'd799) begin

        rgb_en <= 0;
        hsync <= 1;

    end

    if (count_reg == 11'd800) begin

        count_reg <= '0;
        rgb_en <= 1;
        hsync <= 1;


    end
    


end


endmodule