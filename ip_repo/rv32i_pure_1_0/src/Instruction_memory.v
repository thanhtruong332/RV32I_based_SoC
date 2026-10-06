module Instruction_memory(
    input   wire    [31:0]  pc,
    output  wire    [31:0]  Instruction
);
    reg [31:0]  mem [0:1023];
    integer i;

   initial begin
        // Khởi tạo toàn bộ bộ nhớ bằng lệnh NOP (No Operation)
        for(i = 0; i < 1024; i = i + 1)
            mem[i] = 32'h00000013; // NOP

        // CHƯƠNG TRÌNH TEST THUẦN RV32I (Cộng 2 số)
        
        // 1. addi x1, x0, 100  -> Nạp số 100 vào thanh ghi x1
        mem[0] = 32'h06400093; 
        
        // 2. addi x2, x0, 200  -> Nạp số 200 vào thanh ghi x2
        mem[1] = 32'h0C800113; 
        
        // 3. add  x3, x1, x2   -> x3 = x1 + x2 = 300
        mem[2] = 32'h002081B3; 

        // 4. sw   x3, 4(x0)    -> Ghi giá trị 300 ra RAM tại địa chỉ 0x4
        mem[3] = 32'h00302223; 
        
        mem[4] = 32'h00000013; // NOP
        mem[5] = 32'h00000013; // NOP
    end
    
    // Đọc lệnh (Căn lề word: bỏ 2 bit cuối của PC)
    assign  Instruction =   mem[pc[31:2]]; 
    
endmodule
