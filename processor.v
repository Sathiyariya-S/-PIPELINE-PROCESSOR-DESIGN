module PipelinedProcessor(input clk, input reset);
    reg [31:0] PC = 0;
    reg [31:0] registers[0:7];
    reg [31:0] memory[0:15];
    reg [31:0] instruction_memory[0:15];

    // Pipeline Registers
    reg [31:0] IF_ID, ID_EX, EX_MEM, MEM_WB;

    // Load Instructions
    initial begin
        instruction_memory[0] = {6'b000000, 3'b001, 3'b010, 3'b011, 14'b0}; // ADD R1, R2, R3
        instruction_memory[1] = {6'b000001, 3'b100, 3'b001, 3'b010, 14'b0}; // SUB R4, R1, R2
        instruction_memory[2] = {6'b000010, 3'b101, 3'b011, 20'b0};         // LOAD R5, 0(R3)
    end

    wire [5:0] opcode = IF_ID[31:26];
    wire [2:0] rd = IF_ID[25:23];
    wire [2:0] rs1 = IF_ID[22:20];
    wire [2:0] rs2 = IF_ID[19:17];

    // Fetch Stage
    always @(posedge clk or posedge reset) begin
        if (reset) PC <= 0;
        else begin
            IF_ID <= instruction_memory[PC];
            PC <= PC + 1;
        end
    end

    // Decode Stage
    always @(posedge clk) begin
        case (opcode)
            6'b000000: ID_EX <= {opcode, rd, rs1, rs2}; // ADD
            6'b000001: ID_EX <= {opcode, rd, rs1, rs2}; // SUB
            6'b000010: ID_EX <= {opcode, rd, rs1};      // LOAD
        endcase
    end

    // Execute Stage
    always @(posedge clk) begin
        case (ID_EX[31:26])
            6'b000000: EX_MEM <= {ID_EX[25:23], registers[ID_EX[22:20]] + registers[ID_EX[19:17]]}; // ADD
            6'b000001: EX_MEM <= {ID_EX[25:23], registers[ID_EX[22:20]] - registers[ID_EX[19:17]]}; // SUB
            6'b000010: EX_MEM <= {ID_EX[25:23], memory[registers[ID_EX[22:20]]]}; // LOAD
        endcase
    end

    // Memory and Write Back
    always @(posedge clk) begin
        registers[EX_MEM[31:29]] <= EX_MEM[28:0];
        MEM_WB <= EX_MEM;
    end
endmodule
