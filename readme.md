# Mano Architecture Implmentation using VHDL  
The project consists of three segments, the first two being the implementation of necessary modules e.g. Arithmetic Logic Unit or RAM memory for the Mano architecture or any other computer system architecture, and third being the complete implementation of Mano architecture.  
## Part 1: FullAdder  
This part contains and introduction to the programming using VHDL description language and Xilinx ISE. A 1-bit FullAdder module is added and then the 4-bit FullAdder module is implmented using four 1-bit FullAdder modules put in a series connection.  
## Part 2: Common BUS
Focuses on the implmentation of Common BUS which is the main data path in this architecture. More information about the implmentation and the configuration of BUS is given in project report.  
## Part 3: Continuation of DataPath Implementation  
A 32*16 bit RAM is implemented for the memory unit of Mano architecture (There is a decrease in memory size compared to the actual Mano architecture due to large project file sizes. The logic is identical for both cases.). E flip-flop is implemented to hold the carry value produced from ALU operations and ALU itself is implemented using the series connection of sixteen 1-bit simplified ALU modules, all of which can be found in the project folder.  
The complete Mano architecture is found in the `src/Mano_DataPath` folder which uses all the previous modules to implement a working computer which can perform basic tasks.  

P.S: The project is the final project of the **Digital Logic Circuits** course from **Amirkabir University of Technology**. The documentation for the project is included in the source file.  

The Mano architecture is also taught in the beginning sessions of **Computer Architecture and Microprocessors** course in **Sharif University of Tehcnology** and many other universities as an introduction and also a cornerstone for systematic thinking in architecture design.
