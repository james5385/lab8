`timescale 1ns / 1ps

module lab8(Clock, Reset, In, Out, State, NextState);
    input Clock, Reset, In;
    output Out, State, NextState;
    //reg Out;
    reg [2:0] Out,State, NextState;
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
//Current state register (F/F)

    always @(posedge Clock or posedge Reset)
        begin
        if(Reset)
            State <=S0;
        else
            State <=NextState;
        end
//Next state logic (combinational CKT)

    always @(In or State)
    begin case (State)
    
        S0: begin
            if (In==1)
            begin
                NextState=S1;
                Out=1;
            end
            else
            begin
                NextState=S0;
                Out=0;
            end
        end
    
    S1: begin
        if (In==1)
        begin
            NextState=S2;
            Out=0;
        end
        else
        begin
            NextState=S1;
            Out=1;
        end
    end

    S2: begin
        if (In==1)
        begin
            NextState=S3;
            Out=1;
        end
        else
        begin
            NextState=S4;
            Out=0;
        end
    end

    S3: begin
        if (In==1)
        begin
            NextState=S1;
            Out=0;
        end
        else
        begin
            NextState=S4;
            Out=1;
        end
    end

    S4: begin
        if (In==1)
        begin
            NextState=S0;
            Out=1;
        end
        else
        begin
            NextState=S4;
            Out=0;
        end
    end
    
endcase
end
endmodule

