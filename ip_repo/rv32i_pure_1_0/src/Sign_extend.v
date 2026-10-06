module Sign_extend(
    input   wire    [31:0]  immediate,
    input   wire    [2:0]   imm_type,
    output  reg     [31:0]  extended_imm
);

    always @(*) begin
        case(imm_type)
            // I-type: Mở rộng dấu từ bit 11 (bit 31 cũ của Instruction)
            3'b001:  extended_imm = { {20{immediate[11]}}, immediate[11:0] };
            
            // S-type: Mở rộng dấu tương tự I-type
            3'b010:  extended_imm = { {20{immediate[11]}}, immediate[11:0] };
            
            // B-type: Mở rộng dấu từ bit 12 (vì B-type có 13 bit tính cả bit 0)
            3'b011:  extended_imm = { {19{immediate[12]}}, immediate[12:0] };
            
            // U-type: Không cần mở rộng dấu (vì nó là hằng số lớn 20 bit)
            3'b100:  extended_imm = immediate;
            
            // J-type: Mở rộng dấu từ bit 20
            3'b101:  extended_imm = { {11{immediate[20]}}, immediate[20:0] };
            
            default: extended_imm = 32'b0;
        endcase
    end

endmodule
