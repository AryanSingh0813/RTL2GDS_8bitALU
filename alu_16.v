`timescale 1ns / 1ps
module alu(
    input[7:0]in1,in2,
    input[3:0]opcode,
    output reg[15:0]result,
    //output reg carry,zero
    );
    parameter o0  = 4'b0000, o1  = 4'b0001, o2  = 4'b0010, o3  = 4'b0011, 
             o4  = 4'b0100, o5  = 4'b0101, o6  = 4'b0110, o7  = 4'b0111,
             o8  = 4'b1000, o9  = 4'b1001, o10 = 4'b1010, o11 = 4'b1011, 
             o12 = 4'b1100, o13 = 4'b1101, o14 = 4'b1110;

    always@(*)begin
        //result = 16'b0;carry = 1'b0;
        
       if(opcode == o0 ){result} = in1+in2;
        else if (opcode == o1){result} = in1-in2;
        else if(opcode == o2)result = in1 * in2;
        else if(opcode == o3)result= in1<<1;
        else if(opcode == o4)result=in1>>1;
        else if(opcode == o5)result={in1[7],in1[6:0]};
        else if(opcode == o6)result={in1[7:1],in1[0]};
        else if(opcode == o7)result=in1&in2;
        else if(opcode == o8)result=in1|in2;
        else if(opcode == o9)result=~(in1&in2);
        else if(opcode == o10)result=in1^in2;
        else if(opcode == o11)result=~(in1^in2);
        else if(opcode == o12)begin
                if(in1==in2)
                    result=in1;
                else
                    result = 1'b0;
                end
        else if(opcode == o13)begin
                if(in1>in2)
                result = in1;
                else
                result = in2;
                end
        else if(opcode == o14)begin
                if(in1>in2)
                result = in1;
                else
                result = in2;
                end 
        else 
            result = 16'h0;          

    end
endmodule
//convert opcode to parameter   