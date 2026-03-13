# Practice 3 -- Summation Using FSM in Verilog

## Description

In this practice, a digital system written in **Verilog** is implemented
to calculate the **summation from 0 up to a user‑defined number** using
a **Finite State Machine (FSM)**.

The number is entered through the **FPGA switches**, and the result is
displayed on **7‑segment displays**.

The calculation is performed **iteratively**, adding each number one by
one, **without using Gauss' formula**, as required in the assignment.

------------------------------------------------------------------------

## Objective

Design and implement an FPGA system that:

1.  Receives an input number through **switches**.
2.  When a **start signal** is activated, computes the **summation from
    0 to the entered number**.
3.  Displays the **result on 7‑segment displays**.
4.  Performs the calculation **sequentially (without using Gauss'
    formula)**.

------------------------------------------------------------------------

## System Operation

The system uses a **Finite State Machine (FSM)** with three main states:

### 1. WAIT

-   The system remains idle.
-   Internal variables are reset.
-   The system waits for the **start button** to be pressed.

### 2. SUM

-   The summation process begins.
-   A counter (`index`) iterates from **0 up to the entered number**.
-   At each clock cycle the following operation is performed:

```{=html}
<!-- -->
```
    result = result + index

-   The counter increments every clock cycle.

### 3. DONE

-   The calculation stops.
-   The final result is stored.
-   The value is displayed on the **7‑segment displays**.

------------------------------------------------------------------------

## Example of Operation

If the user inputs:

    number = 4

The system calculates:

    0 + 1 + 2 + 3 + 4 = 10

Internal process:

  cycle   index   result
  ------- ------- --------
  start   0       0
  1       0       0
  2       1       1
  3       2       3
  4       3       6
  5       4       10

Final displayed result:

    10

------------------------------------------------------------------------

## Project Structure

    practice3
    │
    ├── sum_module.v        # Module that performs the summation
    ├── sum_module_w.v      # Top module
    ├── BCD_4display.v      # Conversion to 7‑segment display signals
    └── README.md

------------------------------------------------------------------------

## Hardware Used

-   **Intel MAX10 FPGA (DE10-Lite)**
-   Switches (data input)
-   Push buttons KEY (control signals)
-   **7‑segment displays**

------------------------------------------------------------------------

## Concepts Used

-   Verilog HDL
-   Finite State Machines (FSM)
-   Counters
-   Iterative summation
-   Sequential logic with clock
-   7‑segment display control

------------------------------------------------------------------------


