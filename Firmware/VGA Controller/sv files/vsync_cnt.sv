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


    // from 0 to 479
    if (count_reg < 10'd479) begin

        rgb_en <= 1;
        vsync <= 1;

    end


    // from 480 to 489
    if (count_reg > 10'd478 && count_reg < 10'd489) begin

        rgb_en <= 0;
        vsync <= 1;


    end


    // from 490 to 491
    if (count_reg > 10'd488 && count_reg < 10'd491) begin

        rgb_en <= 0;
        vsync <= 0;


    end

    // from 492 to 523
    if (count_reg > 10'd490 && count_reg < 10'd523) begin

        rgb_en <= 0;
        vsync <= 1;

    end

    // 524
    if (count_reg == 10'd524) begin

        count_reg <= '0;
        rgb_en <= 1;
        vsync <= 1;


    end

    



end


endmodule