# 4-bit Nanoprocessor

A simple 4-bit nanoprocessor designed using VHDL and implemented on the BASYS 3 FPGA board. Developed as part of the CS1050 (Computer Organization and Digital Design) course at the University of Moratuwa.

## 🔧 Features

- 4-bit ALU supporting **ADD** and **NEG** using 2's complement arithmetic
- Custom 12-bit instruction set (MOVI, ADD, NEG, JZR)
- 3-bit Program Counter with reset functionality
- 8-register 4-bit Register Bank (R0–R7), R0 hardcoded to zero
- Instruction Decoder to activate appropriate processor modules
- ROM-based Program Memory (hard-coded instructions)
- Multiplexers and buses to route data/control signals
- Clock slowed to 2–3 seconds for visibility of instruction execution
- Output on LEDs and 7-segment display (R7 used for result display)

## 🛠 Tools & Technologies

- VHDL (RTL design)
- Vivado Design Suite
- BASYS 3 FPGA Board
- Timing simulation (testbenches)
- 7-Segment Display & LEDs for output

##  Instruction Set

| Instruction | Description |
|-------------|-------------|
| `MOVI R, d` | Move immediate value `d` to register `R` |
| `ADD Ra, Rb` | Add contents of `Ra` and `Rb`, store in `Ra` |
| `NEG R` | Negate value in register `R` |
| `JZR R, d` | Jump to address `d` if register `R` is zero |


## Contributions

- [Arthikha](https://github.com/Arthikha)
  - Nanoprocessor core
  - Nanoprocessor with 7-segment display
  - Reset controller
  - 7-segment display module

- [Parkkavi](https://github.com/ParkkaviSivakaran72)
  - 4-bit Adder
  - 4-bit Subtractor
  - 4-bit Register

- [Rahavi](https://github.com/RahaviSiri)
  - 3-bit Adder
  - Lookup Table (LUT)
  - 7-segment display controller

- [Suwasthiga](https://github.com/suwasthi)
  - 3-bit Program Counter
  - Multiplexer
  - 3-to-8 Decoder





