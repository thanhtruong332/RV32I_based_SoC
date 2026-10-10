module Instruction_memory (
    input   wire    [31:0]  pc,
    output  wire    [31:0]  Instruction
);
    reg [31:0]  mem [0:1023];
    integer i;

   initial begin

        for (i = 0; i < 1024; i = i + 1)
            mem[i] = 32'h00000013; // NOP

        mem[0] = 32'h06400093;

        mem[1] = 32'h0C800113;

        // 3. add  x3, x1, x2   -> x3 = x1 + x2 = 300
        mem[2] = 32'h002081B3;

        mem[3] = 32'h00302223;

        mem[4] = 32'h00000013; // NOP
        mem[5] = 32'h00000013; // NOP
    end

    assign  Instruction =   mem[pc[31:2]];

endmodule
