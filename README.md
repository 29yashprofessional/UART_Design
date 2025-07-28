# UART_Design
A modular Universal Asynchronous Receiver Transmitter (UART) system designed in Verilog HDL.
This project includes separate modules for baud rate generation, transmitter, receiver, and top-level integration, with simulation and waveform visualization using GTKWave.

## Features
Modular Verilog design with reusable components

Parameterized baud rate generator

UART transmitter and receiver modules

Top-level integration of all components

Testbench for verification

Waveform analysis using GTKWave

## Tools Used
Verilog HDL (for RTL design)

VS Code (code editor)

GTKWave (waveform viewer)

Icarus Verilog (simulator)


## How to Run
Clone the repository:
git clone https://github.com/29yashprofessional/UART_Design.git

Navigate to the directory:
cd UART_Design

Compile and simulate (if using Icarus Verilog):
iverilog -o uart_out testbench/uart_tb.v src/*.v
vvp uart_out

View waveform in GTKWave:
gtkwave dump.vcd

## License
This project is licensed under the MIT License.
Feel free to use, modify, and distribute with credit.

Contact
For any queries, reach out at:
yashprofessional29@gmail.com


