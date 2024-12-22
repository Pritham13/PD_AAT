module seq0110(
    input clk, rst, in,
    output seq_detected
);
    reg [2:0] PS, NS;
    reg [2:0] counter;

    localparam S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            PS <= S0;
            counter <= 0;
        end else begin
            PS <= NS;
            if (seq_detected && counter < 5) 
                counter <= counter + 1;
        end
    end

    always @(PS or in) begin
        case (PS)
            S0: NS = in ? S0 : S1; // Wait for `0`
            S1: NS = in ? S2 : S1; // Detected `0`, wait for `1`
            S2: NS = in ? S3 : S1; // Detected `01`, wait for another `1`
            S3: NS = in ? S0 : S4; // Detected `011`, wait for `0`
            S4: NS = in ? S0 : S1; // Sequence `0110` detected, restart
            default: NS = S0;
        endcase
    end

    assign seq_detected = (PS == S4) && (counter < 5);
endmodule
