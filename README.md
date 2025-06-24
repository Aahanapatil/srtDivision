# srtDivision
This project implements a high-performance SRT Division Algorithm in Verilog, specifically using Radix-4 architecture for faster convergence. The core modules include:

SRT Divider Core

   Radix-4 Multiplier
   Quotient Digit Selector
   Comprehensive Testbench for Validation
   The implementation is aimed at hardware realization on FPGAs (e.g., Intel Cyclone V), with modular design for ease of testing and integration.

📁 File Structure
File Name	Description
   1) srt_divider.v	Top-level SRT divider module, managing the control FSM, partial remainders, quotient selection, and iteration flow.
   2) radix4_multiplier.v	Implements multiplication of partial remainders using Radix-4 Booth multiplication for signed digits.
   3) quotient_selector.v	Responsible for selecting the next quotient digit based on the current partial remainder and divisor.
   4) tb_srt_divider.v	Testbench that verifies correctness of the SRT divider for various input combinations.

🔧 How It Works
    1) Quotient Selection: The quotient_selector estimates the next quotient digit using truncated remainder and divisor values.
    2) Radix-4 Multiplication: The radix4_multiplier handles fast multiplication using Booth encoding.
    3) FSM-Controlled Iteration: The srt_divider orchestrates all components via a finite state machine, iterating through quotient digit generation     and updating partial remainders.
    4) Testbench: Simulates various scenarios to validate division operation, including edge cases like divide-by-zero and negative inputs./

✅ Features
    1) Radix-4 division (higher convergence rate than traditional binary division)
    2) Signed-digit arithmetic support
    3) FSM-based control logic for deterministic timing
    4) Modular testbench for simulation in ModelSim/Quartus

▶️ Running the Simulation
    1) To simulate the design:
    2) Open ModelSim or Intel Quartus Prime.
    3) Compile all .v files.
    4) Set tb_srt_divider as the top-level simulation module.
    5) Run simulation and observe waveform/results.



