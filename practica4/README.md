#  Practice 4 Password  – DE10-Standard (Cyclone V)

##  Overview

This project implements a password verification system using Verilog on the **DE10-Lite FPGA board**.  
The system is based on a Finite State Machine (FSM) that validates a 4-digit password entered sequentially using switches.

If the password is correct, the displays show:

```
Good
```

If any digit is incorrect, the displays show:

```
Bad
```

---

##  Objective

Design and implement a password system in Verilog that:

- Accepts a 4-bit nibble using switches  
- Captures input using a push button  
- Validates a 16-bit password (4 nibbles sequentially)  
- Displays each correct nibble  
- Shows **"Good"** if the full sequence is correct  
- Shows **"Bad"** if an error occurs at any point  

---

## Hardware Requirements

- FPGA Board: DE10-Lite  
- Intel Cyclone V (5CSXFC6D6F31C6)  
- USB Blaster  
- 7-Segment Displays  
- Slide Switches (SW)  
- Push Buttons (KEY)  

---

## Software Used

- Intel Quartus Prime Lite  
- Verilog HDL  

---

##  System Architecture

The system is composed of three main modules:

1. `BCD_module`
2. `clk_divider_parameter`
3. `password_fsm`

---

## 🧩 Module Description

### 1️)BCD_module

This module converts a 4-bit binary input into the corresponding 7-segment display encoding.

- Input: 4-bit BCD  
- Output: 7-segment control signals  
- Implemented using a combinational `case` statement  

It allows the FPGA to display numeric values on HEX displays.

---

### 2️) clk_divider_parameter

This module reduces the 50 MHz system clock to a lower frequency (5 Hz in this project).

This is necessary because:
- Mechanical buttons generate bouncing  
- The FPGA clock is too fast for human interaction  

The clock divider:
- Uses a counter  
- Toggles output when reaching a calculated constant  
- Uses a parameter to define the output frequency  

---

### 3️) password_fsm

This is the main module and core of the system.

It implements a Finite State Machine (FSM) with the following states:

| State | Description |
|-------|------------|
| IDLE  | Waiting for first digit |
| DIG1  | First digit validated |
| DIG2  | Second digit validated |
| DIG3  | Third digit validated |
| DIG4  | Fourth digit validated |
| GOOD  | Correct password |
| BAD   | Incorrect password |

---

## Password

The predefined password is:

```
2 – 0 – 2 – 6
```

Each digit is entered sequentially using the switches.

---

## How the System Works

1. User sets a 4-bit value using switches `SW[3:0]`  
2. User presses `KEY[0]` to capture the value  
3. FSM compares input with expected password digit  
4. If correct:
   - The value is displayed  
   - The FSM moves to the next state  
5. If incorrect:
   - The FSM transitions to the BAD state  
   - The displays show "Bad"  
6. If all digits are correct:
   - The FSM transitions to the GOOD state  
   - The displays show "Good"  

Reset is controlled by `KEY[1]`.

---

##  Display Behavior

### During Entry
Each correct nibble is shown on:

```
HEX3 HEX2 HEX1 HEX0
```

### If Password is Correct

```
Good
```

### If Password is Incorrect

```
Bad
```

---

##  Pin Assignment

Pin configuration is handled using a `.tcl` file for automatic assignment.

Main mappings include:

- CLOCK_50  
- KEY[0–3]  
- SW[0–9]  
- HEX0–HEX5  
- LEDR  
- VGA, SDRAM, Audio (default board mappings)  

Device configured:

```
Cyclone V SX SoC — 5CSXFC6D6F31C6
```

---

## ▶️ How to Run the Project

1. Open Quartus Prime Lite  
2. Create a new project  
3. Select device: **5CSXFC6D6F31C6**  
4. Add the following files:
   - `BCD_module.v`
   - `clk_divider_parameter.v`
   - `password_fsm.v`
5. Run the provided `.tcl` file for pin assignment  
6. Compile the project  
7. Program the FPGA  

---

## 📚 Concepts Applied

- Finite State Machines (FSM)  
- Sequential logic  
- Combinational logic  
- Clock division  
- Button edge detection  
- 7-segment display encoding  

---

## Author

Joshua Ricardo Menchaca Ramírez A01641943
