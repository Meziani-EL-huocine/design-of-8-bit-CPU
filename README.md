# 8-bit CPU Design

## Overview
This project is an **8-bit CPU** designed in **VHDL** with a modular approach. It aims to demonstrate the fundamental building blocks of a simple, yet efficient, 8-bit processor. The project is split into four main components, each represented by a separate repository:

- **[ALU (Arithmetic Logic Unit)](https://github.com/Meziani-EL-huocine/design-of-8-bit-CPU/tree/main/ALU)**
- **[Control Unit](https://github.com/Meziani-EL-huocine/design-of-8-bit-CPU/tree/main/Control_Unit)**
- **[Data Path](https://github.com/Meziani-EL-huocine/design-of-8-bit-CPU/tree/main/Data_Path)**
- **[CPU (Top-Level Integration)](https://github.com/Meziani-EL-huocine/design-of-8-bit-CPU/tree/main/CPU)**

Each component is designed to be flexible, easily modifiable, and reusable in different configurations. The 8-bit CPU is built for educational purposes, targeting students and engineers interested in digital design and CPU architecture.

## Features
- **8-bit Arithmetic Logic Unit (ALU)**: Supports basic arithmetic and logical operations including addition, subtraction, bitwise AND, OR, XOR, and shift operations. Flag outputs for zero, carry, negative, and overflow.
- **Control Unit**: Implements the instruction decoding and control signal generation to manage the flow of data between the CPU components.
- **Data Path**: Responsible for moving data between registers, ALU, and memory, ensuring smooth operation of the CPU.
- **CPU**: Integrates the ALU, Control Unit, and Data Path to create the complete processor. Supports a set of basic instructions for arithmetic, logic, and control operations.

## Project Structure
This CPU design is divided into four repositories, each focusing on a specific part of the CPU architecture:

### 1. ALU (Arithmetic Logic Unit)
The ALU performs all arithmetic and logical operations in the CPU, with support for 8-bit data and flag handling.  
**[ALU Repository](https://github.com/Meziani-EL-huocine/ALU)**

### 2. Control Unit
The control unit decodes instructions and generates control signals to orchestrate data flow and operation execution within the CPU.  
**[Control Unit Repository](https://github.com/Meziani-EL-huocine/control_unit)**

### 3. Data Path
The data path is responsible for routing data between the CPU components, including registers, ALU, and memory units. It ensures data moves as needed based on control signals.  
**[Data Path Repository](https://github.com/Meziani-EL-huocine/data_path)**

### 4. CPU (Top-Level Design)
The top-level design integrates the ALU, Control Unit, and Data Path to form the complete 8-bit CPU. It defines the CPU's architecture and ensures all components work together to execute instructions.  
**[CPU Repository](https://github.com/Meziani-EL-huocine/CPU)**

## How to Run
Clone the required repositories:

```bash
git clone https://github.com/Meziani-EL-huocine/ALU.git
git clone https://github.com/Meziani-EL-huocine/control_unit.git
git clone https://github.com/Meziani-EL-huocine/data_path.git
git clone https://github.com/Meziani-EL-huocine/CPU.git


