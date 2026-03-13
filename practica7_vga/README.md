# Practice 7 -- VGA Display Controller in Verilog

## Description

In this practice, a digital system written in **Verilog** is implemented
to generate a **VGA video signal** using an **Intel MAX10 FPGA**.

The system produces the required **horizontal and vertical
synchronization signals** used in the VGA protocol and calculates the
pixel coordinates for each position on the screen.

Using these coordinates, the design generates an **RGB color pattern**
that appears on the VGA monitor. In this implementation, the displayed
pattern corresponds to a **chessboard grid**, alternating colors across
the screen.

------------------------------------------------------------------------

## Objective

Design and implement an FPGA system that:

1. Generates the **VGA synchronization signals (HSYNC and VSYNC)**.
2. Produces **pixel coordinates (x,y)** for the screen.
3. Controls the **RGB color outputs** based on pixel position.
4. Displays a **chessboard pattern** on a VGA monitor.
5. Verifies the system through **simulation and hardware testing**.

------------------------------------------------------------------------

## System Operation

The VGA controller works by continuously generating timing signals and
pixel coordinates used to draw the screen.

### 1. HORIZONTAL COUNT

- The system counts pixels along each horizontal line.
- A counter increases every clock cycle.
- When the maximum pixel value is reached, the counter resets.

Example operation:

    pixel_x = pixel_x + 1

This counter determines the **horizontal pixel position**.

### 2. VERTICAL COUNT

- When a horizontal line is completed, the vertical counter increments.
- This represents the **current row of pixels**.

Example operation:

    pixel_y = pixel_y + 1

Together, these counters define the coordinates of each pixel.

### 3. DISPLAY (Chessboard Pattern)

- Using the pixel coordinates `(x,y)`, the system determines which color
  should be displayed.
- The screen is divided into square regions.
- The color alternates depending on the region of the screen.

Example logic:

    if ((pixel_x / block_size + pixel_y / block_size) % 2 == 0)
        color = WHITE
    else
        color = BLACK

This produces a **chessboard pattern across the display**.

------------------------------------------------------------------------

## Example of Operation

If the display resolution is:

    640 x 480 pixels

The VGA controller scans the screen continuously:

    pixel_x : 0 → 639
    pixel_y : 0 → 479

Each group of pixels forms a square, and the color alternates to
generate the chessboard.

Example pattern:

    WHITE  BLACK  WHITE  BLACK
    BLACK  WHITE  BLACK  WHITE
    WHITE  BLACK  WHITE  BLACK

This creates the visual appearance of a **chessboard grid** on the VGA
monitor.

------------------------------------------------------------------------

## Project Structure

    practica7_vga
    │
    ├── vga_controller.v     # VGA timing and synchronization module
    ├── vga_display.v        # Pixel color generation
    ├── top_vga.v            # Top module
    └── README.md

------------------------------------------------------------------------

## Hardware Used

- **Intel MAX10 FPGA (DE10-Lite)**
- VGA connector
- VGA monitor
- Push buttons KEY (control signals)
- Switches (optional configuration)

------------------------------------------------------------------------

## Concepts Used

- Verilog HDL
- VGA video signal generation
- Horizontal and vertical counters
- Pixel coordinate calculation
- Digital timing control
- RGB color output
- Pattern generation using logic

------------------------------------------------------------------------
