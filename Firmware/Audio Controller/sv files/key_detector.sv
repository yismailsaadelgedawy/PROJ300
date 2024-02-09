module key_detector (output logic [3:0] q, input logic [7:0] keyboard_data, input logic clk, rst, shift_pressed);


always_ff @(posedge clk or posedge rst) begin

    if (rst) begin

        q <= 'd0;

    end

    else begin


        // key# -> Lshift+key
        // e.g. A# -> Lshift + A

        // we have:
        // A# (2)
        // G# (4)
        // F# (6)
        // D# (9)
        // C# (11)

        case(shift_pressed)

        // if shift key is pressed
        
        'd1 : begin

            case(keyboard_data)

            // A#
            8'h1C : begin

                q <= 'd2;
                

            end

            // G#
            8'h34 : begin

                q <= 'd4;
                

            end

            // F#
            8'h2B : begin

                q <= 'd6;
                

            end

            // D#
            8'h23 : begin

                q <= 'd9;
                

            end

            // C#
            8'h21 : begin

                q <= 'd11;
                

            end


            default : begin

                q <= 'd0;

            end


            endcase

        end

        // now we have:
        // B (1)
        // A (3)
        // G (5)
        // F (7)
        // E (8)
        // D (10)
        // C (12)

        'd0 : begin

            case(keyboard_data)

            // B
            8'h32 : begin

                q <= 'd1;

            end

            // A
            8'h1C : begin

                q <= 'd3;

            end

            // G
            8'h34 : begin

                q <= 'd5;

            end

            // F
            8'h2B : begin

                q <= 'd7;

            end

            // E
            8'h24 : begin

                q <= 'd8;

            end

            // D
            8'h23 : begin

                q <= 'd10;

            end

            // C
            8'h21 : begin

                q <= 'd12;

            end

            default : begin

                q <= 'd0;

            end


            endcase

        end




        endcase



    end


    



end






endmodule