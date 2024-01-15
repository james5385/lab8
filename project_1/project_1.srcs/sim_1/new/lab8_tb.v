`timescale 1ns / 1ps

module lab8_tb;
    reg Clock, Reset, In;
    wire [2:0] Out,State,NextState;
    
lab8 uut(Clock, Reset, In, Out, State,NextState);

    initial Clock=1'b0;
    always #15 Clock=~Clock;
    
    initial begin
        Reset=1'b0;
        #15 Reset=1'b1; In=1'b0;
        #15 Reset=1'b0;
        In=1'b1; //S0 S1
        #35 In=1'b1; //s1 S2
        #15 In=1'b1; //s2 S3
        #30 In=1'b0; //s3 S4
        #35 In=1'b1; //s4 S0
        #45 In=1'b0; //S0
        #45 In=1'b0; //S0    
    end
	initial begin
		#300 $finish;
    end
initial $monitor($stime,"In=%b, Out=%b, State=%b", In, Out, State);
//dumpvars;
endmodule
