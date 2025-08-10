# UART Controller Design

## Project Overview

This project implements a Universal Asynchronous Receiver Transmitter (UART) controller using Verilog HDL. The design includes modular implementation of the transmitter, receiver, baud rate generator, and a top-level controller to integrate the components. The system is configured to work with a **1.6 MHz system clock** and a **baud rate of 10,000**, making it suitable for mid-speed serial communication applications such as debugging interfaces or lightweight sensor networks.

## Features

- Fully modular design with clean separation of concerns  
- Baud rate generation from 1.6 MHz clock source  
- Separate UART Transmitter and Receiver modules  
- Top-level integration module for system-wide simulation  
- Tested using integrated testbench

## File Structure and Descriptions

#### Source Files

| File Name                  | Description |
|---------------------------|-------------|
| `uart_baud_rate_generator.v` | Generates the tick signal required for timing UART transmission and reception. |
| `uart_receiver.v`            | Receives serial data and reconstructs bytes after sampling and bit-shifting. |
| `uart_transmitter.v`         | Converts parallel data to serial and transmits with UART framing. |
| `uart_top_module.v`          | Top-level integration of the transmitter, receiver, and baud generator. |

#### Testbench Files

| File Name            | Description |
|----------------------|-------------|
| `top_tb_new.v`       | System-level testbench to validate full UART data transmission and reception. |

#### Simulation Output Files

| File Name           | Description |
|---------------------|-------------|
| `top_tb_new.vvp`    | Compiled simulation file. |
| `uart_top.vcd`      | VCD waveform output for GTKWave. |

## Baud Rate and Timing Configuration

| Parameter         | Value         |
|------------------|---------------|
| Clock Frequency  | 1.6 MHz        |
| Baud Rate        | 10,000     |
| Oversampling at receiver  | 16X   |


## Testbench Explanation

The top module is tested using a dedicated testbench to ensure correctness of outputs:

- **Top-Level Integration (`top_tb_new.v`)**  
  Runs a complete simulation to check transmission and reception flow through the integrated design. Suitable for loopback tests or full communication verification.

## Simulation and Usage

#### Compilation

```bash
iverilog -o top_tb_new.vvp SOURCE/*.v TESTBENCHES/top_tb_new.v
```
#### Simulation
```bash
vvp top_tb_new.vvp
```
#### Waveform generation
```bash
gtkwave uart_top.vcd
```
## Waveforms for the UART Controller

<img width="1149" height="755" alt="Waveforms" src="https://github.com/user-attachments/assets/3baf7e3a-b13e-4577-98ee-df7985038c92" />

