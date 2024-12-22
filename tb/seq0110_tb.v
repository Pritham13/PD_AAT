module seq0110_tb;
    reg clk, rst, in;
    wire seq_detected;

    seq0110 uut (.clk(clk), .rst(rst), .in(in), .seq_detected(seq_detected));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; in = 1;
        #10 rst = 0; in = 0;
        #10 in = 1; #10 in = 0; #10 in = 0; // Sequence 0100
        #10 in = 1; #10 in = 1; #10 in = 0; // Sequence 0110
        #10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0; // Sequence 0110
        #10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0; // Sequence 0110
        #10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0; // Sequence 0110
        #10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0; // Sequence 0110
        #10 in = 0; #10 in = 1; #10 in = 1; #10 in = 0; // Sequence 0110
        #50 $finish;
    end
		initial begin
			$dumpfile("dump.vcd");
			$dumpvars;
		end
endmodule
