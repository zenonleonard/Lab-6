module ALU (
    input  [31:0] A,
    input  [31:0] B,
    input  [3:0]  ALUControl,
    output reg [31:0] ALUResult,
    output        Zero
);

    // ALUControl encoding
    localparam ADD = 4'b0000;
    localparam SUB = 4'b0001;
    localparam AND_OP = 4'b0010;
    localparam OR_OP  = 4'b0011;
    localparam XOR_OP = 4'b0100;
    localparam SLL = 4'b0101;
    localparam SRL = 4'b0110;

    always @(*) begin
        case (ALUControl)
            ADD:    ALUResult = A + B;
            SUB:    ALUResult = A - B;
            AND_OP: ALUResult = A & B;
            OR_OP:  ALUResult = A | B;
            XOR_OP: ALUResult = A ^ B;
            SLL:    ALUResult = A << B[4:0];
            SRL:    ALUResult = A >> B[4:0];
            default: ALUResult = 32'b0;
        endcase
    end
    
    assign Zero = (ALUResult == 32'b0);

endmodule