module key_detector (output logic [3:0] q, input logic [7:0] keyboard_data);

// stores whether the Lshift key has been pressed
logic shift_pressed;

always_comb begin

    // Lshift press
    if (keyboard_data == 7'h12) begin

        shift_pressed = 'd1;

    end

    // else begin
        
    //     shift_pressed = 'd0;

    // end


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
        7'h1C : begin

            q = 'd2;
            shift_pressed = 'd0;

        end

        // G#
        7'h34 : begin

            q = 'd4;
            shift_pressed = 'd0;

        end

        // F#
        7'h2B : begin

            q = 'd6;
            shift_pressed = 'd0;

        end

        // D#
        7'h23 : begin

            q = 'd9;
            shift_pressed = 'd0;

        end

        // C#
        7'h21 : begin

            q = 'd11;
            shift_pressed = 'd0;

        end


        default : begin

            q = 'd0;

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
        7'h32 : begin

            q = 'd1;

        end

        // A
        7'h1C : begin

            q = 'd3;

        end

        // G
        7'h34 : begin

            q = 'd5;

        end

        // F
        7'h2B : begin

            q = 'd7;

        end

        // E
        7'h24 : begin

            q = 'd8;

        end

        // D
        7'h23 : begin

            q = 'd10;

        end

        // C
        7'h21 : begin

            q = 'd12;

        end

        default : begin

            q = 'd0;

        end


        endcase

    end




    endcase



end






endmodule