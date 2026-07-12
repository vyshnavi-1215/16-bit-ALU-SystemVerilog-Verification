# 16-bit ALU Functional Verification using SystemVerilog

A functional verification environment for a 16-bit Arithmetic and Logical Unit (ALU), built using a layered SystemVerilog testbench architecture and simulated using Synopsys VCS. The project verifies all 16 arithmetic, logical, shift, rotate, and comparison operations of the ALU through constrained-random stimulus, self-checking scoreboard, and functional coverage.

## Overview

Arithmetic and Logical Units are a core building block of any SoC, performing operations such as addition, subtraction, multiplication, division, and bitwise logic. This project implements the RTL design of a 16-bit ALU and builds a complete functional verification environment around it using SystemVerilog, following an industry-standard layered testbench methodology (Transaction, Generator, Driver, Monitor, Scoreboard, Coverage).

## Features

- 16-bit ALU supporting 16 operations selected via a 4-bit select line
- Layered, class-based SystemVerilog testbench (reusable, modular architecture)
- Constrained-random stimulus generation
- Self-checking scoreboard with a golden reference model
- Functional coverage tracking for all 16 operations
- Pass/fail summary report generated at the end of simulation
- Verified using Synopsys VCS simulator

## ALU Operations

| Sel  | Operation           |
|------|----------------------|
| 0000 | Addition             |
| 0001 | Subtraction          |
| 0010 | Multiplication       |
| 0011 | Division             |
| 0100 | AND                  |
| 0101 | OR                   |
| 0110 | NAND                 |
| 0111 | NOR                  |
| 1000 | Logical Shift Left   |
| 1001 | Logical Shift Right  |
| 1010 | Rotate Left          |
| 1011 | Rotate Right         |
| 1100 | XOR                  |
| 1101 | XNOR                 |
| 1110 | Greater Comparison   |
| 1111 | Equal Comparison     |

**Ports:** `a[15:0]`, `b[15:0]` — operands · `sel[3:0]` — operation select · `y[32:0]` — ALU output · `clk`, `rst`

## Testbench Architecture

```
Generator → Driver → ALU (DUT) → Monitor
                ↓                    ↓
           Scoreboard  ←―――――――――――――
                ↓
            Coverage
```

| Component   | Responsibility                                                        |
|-------------|------------------------------------------------------------------------|
| Transaction | Data packet holding operands, select line, and result                 |
| Generator   | Produces constrained-random stimulus                                  |
| Driver      | Applies stimulus to the DUT via the interface, synchronized to clock  |
| Monitor     | Passively observes DUT inputs/outputs                                 |
| Scoreboard  | Computes expected result independently and checks it against the DUT  |
| Coverage    | Tracks which of the 16 operations have been exercised                 |
| Environment | Instantiates and connects all components                              |

## Project Structure

16-bit-ALU-SystemVerilog-Verification/
├── design.sv
├── testbench/
│   ├── transaction.sv
│   ├── interface.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   ├── coverage.sv
│   ├── environment.sv
│   ├── test.sv
│   └── tb_top.sv
├── filelist.f
├── docs/
│   └── report.pdf
├── LICENSE
├── .gitignore
└── README.md

## Tools Used

- **Language:** SystemVerilog (IEEE 1800)
- **Simulator:** Synopsys VCS
- **Waveform Viewer:** EDA Playground EPWave / DVE


## Results

- All 16 ALU operations were functionally verified against a reference model.
- Functional coverage was measured across all operation bins.
- Self-checking scoreboard reported pass/fail status for every transaction.

## References

1. Priyadarshi Priyesh, Prajkta Dharmik, Shobhit Tiwari, Dr. P.G. Chilveri, Mrs. T. A. Mate, "Functionally Verifying 16-bit ALU using System Verilog," *Journal of Emerging Technologies and Innovative Research (JETIR)*, Vol. 9, Issue 8, August 2022.

## Author

Mannem Vyshnavi 
ECE 

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
