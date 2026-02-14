# Prime Number Decoder Using 4 Variables on FPGA

## Description
This project implements a digital system in Verilog that determines whether a 4-bit binary number is a prime number.

The value is entered using four switches on the FPGA board, and the result is displayed by turning on an LED when the number is prime.

The implementation was developed using the DE10-Lite FPGA board and Intel Quartus Prime Lite software.

---

## Objective
The objective of this project is to design a combinational digital circuit that:

- Reads four switches (SW[3:0])
- Interprets their value as a binary number between 0 and 15
- Determines whether the number is prime
- Turns on an LED if the number is prime

---

## Materials Used
- DE10-Lite FPGA Board
- USB Blaster cable
- Intel Quartus Prime Lite
- Verilog HDL

---

## System Operation
1. The four switches represent a 4-bit binary number.
2. The system evaluates whether the number is prime.
3. If the number is prime, the LED turns on.
4. If the number is not prime, the LED remains off.

---

## Prime Numbers in the 4-bit Range (0–15)
Within the 4-bit range, the prime numbers are:

- 2  (0010)
- 3  (0011)
- 5  (0101)
- 7  (0111)
- 11 (1011)
- 13 (1101)

All other numbers in this range are not prime.

---

## Inputs and Outputs

### Inputs
- SW[3:0] → 4 FPGA switches

### Output
- LED → Prime number indicator

---
