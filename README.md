8-bit CPU Design
Overview
This project is an 8-bit CPU designed in VHDL with a modular approach. It aims to demonstrate the fundamental building blocks of a simple, yet efficient, 8-bit processor. The project is split into four main components, each represented by a separate repository:

ALU (Arithmetic Logic Unit)
Control Unit
Data Path
CPU (Top-Level Integration)
Each component is designed to be flexible, easily modifiable, and reusable in different configurations. The 8-bit CPU is built for educational purposes, targeting students and engineers interested in digital design and CPU architecture.

Features
8-bit Arithmetic Logic Unit (ALU): Supports basic arithmetic and logical operations including addition, subtraction, bitwise AND, OR, XOR, and shift operations. Flag outputs for zero, carry, negative, and overflow.
Control Unit: Implements the instruction decoding and control signal generation to manage the flow of data between the CPU components.
Data Path: Responsible for moving data between registers, ALU, and memory, ensuring smooth operation of the CPU.
CPU: Integrates the ALU, Control Unit, and Data Path to create the complete processor. Supports a set of basic instructions for arithmetic, logic, and control operations.
Project Structure
This CPU design is divided into four repositories, each focusing on a specific part of the CPU architecture:

ALU (Arithmetic Logic Unit)
The ALU performs  arithmetic and logical operations in the CPU, with support for 8-bit data and flag handling.
ALU Repository

Control Unit
The control unit decodes instructions and generates control signals to orchestrate data flow and operation execution within the CPU.
Control Unit Repository

Data Path
The data path is responsible for routing data between the CPU components, including registers, ALU, and memory units. It ensures data moves as needed based on control signals.
Data Path Repository

CPU (Top-Level Design)
The top-level design integrates the ALU, Control Unit, and Data Path to form the complete 8-bit CPU. It defines the CPU's architecture and ensures all components work together to execute instructions.
CPU Repository

How to Run
Clone the required repositories:

bash
Copier le code
git clone https://github.com/Meziani-EL-huocine/ALU.git
git clone https://github.com/Meziani-EL-huocine/control_unit.git
git clone https://github.com/Meziani-EL-huocine/data_path.git
git clone https://github.com/Meziani-EL-huocine/CPU.git
Use your preferred VHDL simulation tool to run the testbenches for each module. Ensure that all dependencies are properly linked for the CPU's top-level design.

The CPU repository includes a top-level VHDL testbench that tests the full integration of the ALU, Control Unit, and Data Path.

Future Enhancements
Extending the instruction set to include more complex operations.
Integrating external I/O devices for more advanced functionalities.
Implementing pipelining or a more sophisticated control flow.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
For questions or collaboration, feel free to reach out via GitHub issues or email.

