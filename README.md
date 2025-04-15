# -PIPELINE-PROCESSOR-DESIGN-VLSI
Sathiyapriya S
Intern ID:CT04WH113
Internship will span 4 weeks from March 12th, 2025 to April 12th, 2025.
Mentor name : Neela Santhosh Kumar (Human Resources & Academic Head, CODTECH IT SOLUTIONS PRIVATE LIMITED)

# 4-Stage Pipelined Processor Design Using Verilog

This project presents a functional 4-stage pipelined processor designed using Verilog HDL. The processor implements three basic instructions—ADD, SUB, and LOAD—providing foundational understanding of instruction-level parallelism and digital design principles. Pipelining is a fundamental technique in computer architecture to improve instruction throughput by overlapping instruction execution.

# Architecture

The processor consists of four pipeline stages:

Instruction Fetch (IF): Retrieves the next instruction from instruction memory based on the Program Counter (PC).

Instruction Decode (ID): Decodes the instruction opcode and extracts register operands.

Execute (EX): Performs the operation—either arithmetic computation or address calculation.

Memory and Write Back (MEM/WB): Accesses data memory (if required) and writes the result back to the register file.

These stages are connected via pipeline registers (IF_ID, ID_EX, EX_MEM, MEM_WB) to preserve instruction-specific data across cycles. This modular separation allows for concurrent processing of up to four instructions, one in each stage, after the initial pipeline fill-up.

# Instruction Format:

The processor uses a simple 32-bit instruction format. The most significant 6 bits represent the opcode, followed by register addresses and immediate fields where necessary. The ADD and SUB instructions use three register fields, while the LOAD instruction uses two.

# Operation:

Upon a clock edge, each stage executes simultaneously:

The IF stage fetches the next instruction.

The ID stage decodes the previous instruction and prepares operands.

The EX stage performs the arithmetic or memory address calculation.

The MEM/WB stage writes the result back into the destination register.

The pipelining approach improves the instruction execution rate significantly compared to a single-cycle or multi-cycle processor.

# Simulation and Verification:

Simulation demonstrates the pipelined nature of execution. During early cycles, each instruction progresses from one stage to another. As the pipeline fills, we observe multiple instructions in flight, each at different stages. The output shows how each instruction's data is preserved correctly across pipeline registers and executed accurately without interference.

# Conclusion:

This pipelined processor design exemplifies the efficient execution of instructions using basic pipelining techniques. It lays the foundation for more advanced features like forwarding, hazard detection, and branching. The project reinforces key digital design principles and encourages exploration of more complex instruction sets and processor enhancements.
# Output
![Image](https://github.com/user-attachments/assets/a315cf93-797e-4685-8457-2a5d694ce2dc)
