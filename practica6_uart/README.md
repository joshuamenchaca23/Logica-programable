# Practice 6 -- UART Communication Using Verilog

## Description

In this practice, a digital system written in **Verilog** is implemented
to perform **serial communication using the UART protocol** on an
**Intel MAX10 FPGA**.

The system is capable of **transmitting and receiving 8-bit data**
through a serial line. The received data is processed internally and
displayed on the **7-segment displays** of the FPGA board.

The design uses modular Verilog components to control **data
transmission, reception, and visualization**.

------------------------------------------------------------------------

## Objective

Design and implement an FPGA system that:

1. Receives an input value through **switches**.
2. Transmits the value using **UART serial communication**.
3. Receives the transmitted byte using a **UART receiver module**.
4. Displays the **received data on 7-segment displays**.
5. Verifies the system operation through **simulation and hardware testing**.

------------------------------------------------------------------------

## System Operation

The system uses UART communication modules to transmit and receive data.

### 1. IDLE

- The system waits for a transmission event.
- The serial line remains in **logic high (idle state)**.
- Internal registers are reset.

### 2. TRANSMIT

- When a transmission begins, the system generates a **UART frame**.
- The frame includes the following sequence:

    Start bit  
    8 data bits  
    Stop bit

- Each bit is sent sequentially according to the **baud rate timing**.

Example transmission:

    Start  Data Bits          Stop
      0    01000001           1

The bits are transmitted through the **TX serial line**.

### 3. RECEIVE

- The receiver monitors the **RX serial line**.
- When the **start bit** is detected, the receiver begins sampling the incoming bits.
- The 8 bits are reconstructed and stored internally.

------------------------------------------------------------------------

## Example of Operation

If the transmitted UART frame is:

    Start  Data Bits          Stop
      0    00110010           1

The receiver reconstructs:

    received_data = 50

Displayed result:

    50

The value appears on the **7-segment displays** of the FPGA board.

------------------------------------------------------------------------

## Project Structure

    practica6_uart
    │
    ├── uart_tx.v          # UART transmitter module
    ├── uart_rx.v          # UART receiver module
    ├── top_uart.v         # Top module
    ├── disp_numeros.v     # Conversion to 7-segment display signals
    └── README.md

------------------------------------------------------------------------

## Hardware Used

- **Intel MAX10 FPGA (DE10-Lite)**
- Switches (data input)
- Push buttons KEY (control signals)
- UART TX/RX serial connection
- **7-segment displays**

------------------------------------------------------------------------

## Concepts Used

- Verilog HDL
- UART serial communication
- Finite state machines
- Sequential logic with clock
- Bit timing and sampling
- 7-segment display control

------------------------------------------------------------------------
