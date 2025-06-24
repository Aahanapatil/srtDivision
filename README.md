# srtDivision
This project implements a high-performance SRT Division Algorithm in Verilog, specifically using Radix-4 architecture for faster convergence. The core modules include:

SRT Divider Core

   Radix-4 Multiplier
   Quotient Digit Selector
   Comprehensive Testbench for Validation
   The implementation is aimed at hardware realization on FPGAs (e.g., Intel Cyclone V), with modular design for ease of testing and integration.

📁 File Structure
File Name	Description
    srt_divider.v	Top-level SRT divider module, managing the control FSM, partial remainders, quotient selection, and iteration flow.
    radix4_multiplier.v	Implements multiplication of partial remainders using Radix-4 Booth multiplication for signed digits.
    quotient_selector.v	Responsible for selecting the next quotient digit based on the current partial remainder and divisor.
    tb_srt_divider.v	Testbench that verifies correctness of the SRT divider for various input combinations.

🔧 How It Works
     Quotient Selection: The quotient_selector estimates the next quotient digit using truncated remainder and divisor values.
     Radix-4 Multiplication: The radix4_multiplier handles fast multiplication using Booth encoding.
     FSM-Controlled Iteration: The srt_divider orchestrates all components via a finite state machine, iterating through quotient digit generation     and updating partial remainders.
     Testbench: Simulates various scenarios to validate division operation, including edge cases like divide-by-zero and negative inputs./

✅ Features
     Radix-4 division (higher convergence rate than traditional binary division)
     Signed-digit arithmetic support
     FSM-based control logic for deterministic timing
     Modular testbench for simulation in ModelSim/Quartus

▶️ Running the Simulation
     To simulate the design:
     Open ModelSim or Intel Quartus Prime.
     Compile all .v files.
     Set tb_srt_divider as the top-level simulation module.
     Run simulation and observe waveform/results.



