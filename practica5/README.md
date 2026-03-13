# Practice 5 -- UART Receiver Using Verilog

## Description

In this practice, a digital system written in **Verilog** is implemented
to receive **serial data using the UART protocol** on an **Intel MAX10 FPGA**.

The system captures incoming serial data, reconstructs the transmitted
byte, and displays the received value on the **7-segment displays** of
the FPGA board.

The design uses **modular Verilog components** and internal timing logic
to correctly sample the serial input and process the received data.

------------------------------------------------------------------------

## Objective

Design and implement an FPGA system that:

1. Receives serial data using the **UART protocol**.
2. Correctly detects the **start bit, data bits, and stop bit**.
3. Reconstructs the transmitted **8-bit data value**.
4. Displays the received value on **7-segment displays**.
5. Verifies the design through **simulation and hardware testing**.

------------------------------------------------------------------------

## System Operation

The UART receiver processes incoming data following the standard UART
communication sequence.

### 1. IDLE

- The system waits for activity on the **RX serial line**.
- The receiver monitors the line until a **start bit (logic 0)** is detected.

### 2. RECEIVE

- Once the start bit is detected, the receiver begins sampling the
incoming data.
- A timing module ensures that the bits are sampled at the correct
interval according to the selected **baud rate**.
- The system sequentially reads **8 data bits** and stores them.

Example internal operation:

    received_data = received_data + sampled_bit

The internal register shifts and reconstructs the transmitted byte.

### 3. COMPLETE

- After the **stop bit** is detected, the reception process ends.
- A **done signal** indicates that the byte was successfully received.
- The value is sent to the display module.

------------------------------------------------------------------------

## Example of Operation

If the transmitted UART frame is:

    Start  Data Bits         Stop
     0     01000001          1

The system reconstructs:

    received_data = 65

Displayed result:

    65

This corresponds to the ASCII value for the character **'A'**.

------------------------------------------------------------------------

## Project Structure

    practica5
    │
    ├── uart_rx.v           # UART receiver module
    ├── top_rx.v            # Top-level module
    ├── disp_numeros.v      # 7-segment display control
    ├── disp_done.v         # Reception indicator module
    └── README.md

------------------------------------------------------------------------

## Hardware Used

- **Intel MAX10 FPGA (DE10-Lite)**
- Switches (optional configuration input)
- Push buttons KEY (reset / control)
- **UART RX serial input**
- **7-segment displays**

------------------------------------------------------------------------

## Concepts Used

- Verilog HDL
- UART serial communication
- Bit sampling and timing
- Digital design with FPGA
- Modular hardware design
- 7-segment display control

------------------------------------------------------------------------
