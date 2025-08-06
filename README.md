# UART Controller Design

## 1. Project Overview

This project implements a Universal Asynchronous Receiver Transmitter (UART) controller using Verilog HDL. The design includes modular implementation of the transmitter, receiver, baud rate generator, and a top-level controller to integrate the components. The system is configured to work with a **1 MHz system clock** and a **baud rate of 10,000**, making it suitable for mid-speed serial communication applications such as debugging interfaces or lightweight sensor networks.

## 2. Features

- Fully modular design with clean separation of concerns  
- Baud rate generation from 1 MHz clock source  
- Separate UART Transmitter and Receiver modules  
- Top-level integration module for system-wide simulation  
- Thoroughly tested using individual and integrated testbenches

## 3. File Structure and Descriptions

### Source Files

| File Name                  | Description |
|---------------------------|-------------|
| `uart_baud_rate_generator.v` | Generates the tick signal required for timing UART transmission and reception. |
| `uart_receiver.v`            | Receives serial data and reconstructs bytes after sampling and bit-shifting. |
| `uart_transmitter.v`         | Converts parallel data to serial and transmits with UART framing. |
| `uart_top_module.v`          | Top-level integration of the transmitter, receiver, and baud generator. |

### Testbench Files

| File Name            | Description |
|----------------------|-------------|
| `baud_rate_tb.v`     | Tests tick generation timing of the baud rate generator. |
| `receiver_tb.v`      | Validates UART receiver's ability to sample and decode serial input. |
| `transmitter_tb.v`   | Verifies correct UART frame output from the transmitter. |
| `top_tb_new.v`       | System-level testbench to validate full UART data transmission and reception. |

### Simulation Output Files

| File Name           | Description |
|---------------------|-------------|
| `top_tb_new.vvp`    | Compiled simulation file. |
| `uart_top.vcd`      | VCD waveform output for GTKWave. |

## 4. Baud Rate and Timing Configuration

| Parameter         | Value         |
|------------------|---------------|
| Clock Frequency  | 1 MHz        |
| Baud Rate        | 10,000 bps    |
| Oversampling at receiver  | 16X   |

The baud rate generator outputs a tick every 1000 clock cycles to align with the 10,000 baud rate using the 10 MHz clock. Each tick represents the time duration of 1 bit in UART communication.

## 5. Testbench Explanation

Each module is tested using a dedicated testbench to ensure correctness in isolation before integration:

- **Baud Rate Generator (`baud_rate_tb.v`)**  
  Validates timing of generated ticks at every 1000 clock cycles.

- **Transmitter (`transmitter_tb.v`)**  
  Simulates parallel data input and monitors serial UART output to ensure correct UART framing (start, data, stop bits).

- **Receiver (`receiver_tb.v`)**  
  Sends serial data as stimulus and checks whether the module correctly reconstructs the original byte.

- **Top-Level Integration (`top_tb_new.v`)**  
  Runs a complete simulation to check transmission and reception flow through the integrated design. Suitable for loopback tests or full communication verification.

## 6. Simulation and Usage Steps

### Compilation

```bash
iverilog -o top_tb_new.vvp SOURCE/*.v TESTBENCHES/top_tb_new.v
```
### Simulation
```bash
vvp top_tb_new.vvp
```
### Waveform generation
```bash
gtkwave uart_top.vcd
```
