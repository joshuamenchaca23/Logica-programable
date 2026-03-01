# 10-bit Binary to 4-Digit 7-Segment Display – FPGA DE10-Lite

##  Overview

This project implements a 10-bit binary to 4-digit decimal display system using Verilog on the DE10-Lite FPGA board.

The system receives a 10-bit binary number (0–1023) and converts it into:

- Units
- Tens
- Hundreds
- Thousands

Each digit is displayed on a 7-segment display (HEX0–HEX3).

---

##  Objective

Design and implement a modular system in Verilog that:

- Accepts a 10-bit binary input
- Converts it into decimal digits
- Displays each digit on a separate 7-segment display
- Uses modular design (hierarchical structure)
- Verifies functionality using a testbench

---

##  Hardware Requirements

- FPGA Board: DE10-Lite  
- Intel Cyclone V  
- 4x 7-Segment Displays (HEX0–HEX3)  
- 10 Slide Switches (SW[9:0])  

---

##  Software Used

- Intel Quartus Prime Lite  
- ModelSim / Questa (for simulation)  
- Verilog HDL  

---

##  System Architecture

The design is divided into three modules:

1. `BCD_module`
2. `BCD_4displays`
3. `BCD_4displays_w` (Wrapper for FPGA)

A testbench (`BCD_4displays_tb`) was created for simulation.

---

##  Module Description

### 1) BCD_module

This module converts a 4-bit binary digit into its corresponding 7-segment encoding.

- Input: 4-bit value (0–9)
- Output: 7-bit signal for display

It is reused four times (units, tens, hundreds, thousands).

---

### 2️) BCD_4displays

This is the core module.

It receives a 10-bit binary number:

```
bcd_in[9:0]
```

Then extracts decimal digits using arithmetic operations:

- Units     → `bcd_in % 10`
- Tens      → `(bcd_in / 10) % 10`
- Hundreds  → `(bcd_in / 100) % 10`
- Thousands → `(bcd_in / 1000) % 10`

Each digit is sent to a `BCD_module` instance.

This module demonstrates:

- Hierarchical design
- Modular reuse
- Arithmetic operations in Verilog

---

### 3️) BCD_4displays_w (Wrapper)

This module connects the design directly to the FPGA hardware.

Inputs:
```
SW[9:0]
```

Outputs:
```
HEX0, HEX1, HEX2, HEX3
```

It instantiates the `BCD_4displays` module and maps:

- Units → HEX0
- Tens → HEX1
- Hundreds → HEX2
- Thousands → HEX3

---

## Testbench

File: `BCD_4displays_tb.v`

The testbench:

- Generates random 10-bit numbers
- Runs 20 test iterations
- Displays results using `$display`
- Monitors signals using `$monitor`

Example simulation output:

```
bcd_in = 0110100101
D_un = XXXXXXX
D_de = XXXXXXX
D_ce = XXXXXXX
D_mi = XXXXXXX
```

This verifies correct digit extraction and display encoding.

---

##  How It Works on Hardware

1. Set a value using SW[9:0]
2. The FPGA converts the binary number into decimal digits
3. Each digit is displayed on:
   - HEX0 → Units
   - HEX1 → Tens
   - HEX2 → Hundreds
   - HEX3 → Thousands

The system updates in real time as switches change.

---

##  Concepts Applied

- Binary to decimal conversion
- Modulo and division operations
- Hierarchical design
- Module instantiation
- 7-segment display encoding
- Testbench verification
- FPGA hardware mapping

---

##  How to Compile

1. Open Quartus Prime Lite
2. Create a new project
3. Select device (Cyclone V – DE10-Lite)
4. Add:
   - `BCD_module.v`
   - `BCD_4displays.v`
   - `BCD_4displays_w.v`
5. Compile
6. Assign pins for:
   - SW[9:0]
   - HEX0–HEX3
7. Program the FPGA

---

##  Author

Joshua Ricardo Menchaca Ramírez A01641943
