# Practice 2 -- BCD to 7-Segment Display (4 Displays)

## Description

In this practice, a digital system written in **Verilog** is implemented
to convert a **binary-coded decimal (BCD) input value** into the signals
required to drive **four 7‑segment displays**.

The system receives a binary value through the FPGA switches and
converts it into decimal digits that are shown on the **7‑segment
displays**.

This implementation demonstrates how **BCD decoding and display
control** can be implemented using combinational logic in programmable
hardware.

------------------------------------------------------------------------

## Objective

Design and implement a digital system that:

1.  Receives a **binary input number from FPGA switches**.
2.  Converts the value into **BCD format**.
3.  Drives **four 7‑segment displays** to visualize the number.
4.  Demonstrates the operation of a **BCD to 7‑segment decoder** using
    FPGA hardware.

------------------------------------------------------------------------

## System Operation

The system converts the binary input value into signals that activate
the correct segments of the displays.

A **BCD decoder** translates a 4‑bit input into the seven signals
required to illuminate the segments of a display, allowing the digits
**0--9** to be represented visually.

The design contains two main components:

### 1. Binary Input

The input value is provided using the **FPGA switches (SW)**.

Each switch represents one bit of the binary number.

Example:

    SW = 0101

Binary value:

    5

------------------------------------------------------------------------

### 2. BCD to 7-Segment Conversion

The system converts the binary number into **7 control signals (a--g)**.

Each signal controls one LED segment inside the display.

Example representation:

  Digit   Segments Active
  ------- -----------------
  0       a b c d e f
  1       b c
  2       a b d e g
  3       a b c d g

This logic allows the FPGA to visually represent decimal numbers.

------------------------------------------------------------------------

## Example of Operation

If the switches represent the number:

    0101

The system outputs the signals required to display:

    5

on the 7‑segment display.

If a larger binary number is provided, the digits are distributed across
the **four displays**.

Example:

    Input: 00110101

Displayed as:

    0035

------------------------------------------------------------------------

## Project Structure

    practice2_BCD4displays
    │
    ├── BCD_4display.v     # Module that converts BCD values to 7-segment signals
    ├── top_module.v       # Main FPGA module
    ├── decoder7seg.v      # 7-segment decoder logic
    └── README.md

------------------------------------------------------------------------

## Hardware Used

-   **Intel MAX10 FPGA (DE10-Lite)**
-   Switches (input values)
-   **4 seven-segment displays**
-   Push buttons for control signals

------------------------------------------------------------------------

## Concepts Used

-   Verilog HDL
-   Combinational logic
-   BCD representation
-   7‑segment display decoding
-   FPGA digital design

------------------------------------------------------------------------
