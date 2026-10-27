# RISC-V MYTH Workshop

A pipelined RISC-V (RV32I) CPU written in TL-Verilog and simulated in Makerchip, built during the VSD RISC-V MYTH workshop.

* Pipeline split across six stages: PC, fetch and decode, register read, execute, data memory, and load return.
* Decode logic for 33 RV32I instructions and an ALU for arithmetic, logic, shift, compare, and branch operations.
* Read-after-write hazards between back-to-back instructions resolved by bypassing the previous ALU result into register read.
* Taken branches and loads handled by invalidating the two following instructions and redirecting the PC.
* Verified in Makerchip with a sum-of-1-to-9 program that also stores and reloads the result, checked by an automatic pass condition.
* Days 1 and 2: C programs compiled with the RISC-V GCC toolchain and run on the Spike ISA simulator.

Final CPU: [Day5/code/riscv_pipelined_cpu.tlv](Day5/code/riscv_pipelined_cpu.tlv)

<img width="1644" height="2372" alt="Makerchip simulation of the final CPU" src="https://github.com/user-attachments/assets/d7f414af-abf1-4c76-9564-34bc66d26f98" />

Makerchip sandbox: https://www.makerchip.com/sandbox/0Krfqh3JZ/0qjhgl#
