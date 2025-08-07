# Synchrounous-FIFO-Verification-SystemVerilog

This repository contains the complete SystemVerilog testbench and design files for verifying a FIFO (First-In-First-Out) module *without* using UVM. Below is a breakdown of each file and its role in the verification environment.

---

## 🔷 Introduction

This project presents a **SystemVerilog-based testbench** for verifying a **synchronous FIFO buffer**.  
A FIFO is a critical component in digital systems, acting as a temporary storage queue that manages data transfer between modules operating at different speeds or clock domains.

Our design features multiple control and status signals such as `full`, `almostfull`, `empty`, `almostempty`, `overflow`, and `underflow`, ensuring safe and efficient data communication.

The verification framework rigorously tests these features using **structured SystemVerilog components** like transactions, monitors, scoreboards, and coverage to provide **comprehensive functional verification**.

---

## FIFO Input/Output Ports

| **Port**       | **Direction** | **Description**                                                              |
|----------------|---------------|------------------------------------------------------------------------------|
| `clk`          | Input         | Clock signal for synchronous operations                                     |
| `rst_n`        | Input         | Active-low asynchronous reset                                               |
| `data_in`      | Input         | Input data to be written into the FIFO                                      |
| `wr_en`        | Input         | Write enable — data is written when high and FIFO is not full              |
| `rd_en`        | Input         | Read enable — data is read when high and FIFO is not empty                 |
| `data_out`     | Output        | Data read from the FIFO                                                     |
| `full`         | Output        | Indicates FIFO is full — prevents further writes                            |
| `almostfull`   | Output        | Indicates FIFO is almost full — one write away from being full              |
| `empty`        | Output        | Indicates FIFO is empty — prevents further reads                            |
| `almostempty`  | Output        | Indicates FIFO is almost empty — one read away from being empty             |
| `overflow`     | Output        | Signals an overflow event — write attempted when FIFO is full               |
| `underflow`    | Output        | Signals an underflow event — read attempted when FIFO is empty              |
| `wr_ack`       | Output        | Acknowledges that the write was successful                                  |

---

## 📁 File Descriptions

### 1. Project Reports

- `Yousef_Alkattan_Project1_sv7....`:  
  Includes all codes & Simulation Waveforms

---

### 2. RTL & Test Top

- `FIFO.sv`:  
  The RTL design of the FIFO module under test & includes assertions.

- `FIFO_top.sv`:  
  Top-level testbench module that instantiates the DUT, interface, monitor, scoreboard, and coverage.

---

### 3. Testbench Files

#### 🧱 Testbench Components

- `FIFO_interface.sv`:  
  Defines the interface between the testbench and DUT including signals like clk, rst, wr_en, etc.

- `FIFO_transaction.sv`:  
  Defines the transaction class (data packets) for FIFO operations.

- `FIFO_monitor.sv`:  
  Observes DUT signals and collects transactions for coverage and checking.

- `FIFO_scoreboard.sv`:  
  Implements the self-checking mechanism by comparing expected vs. actual FIFO behavior.

- `FIFO_coverage.sv`:  
  Includes functional coverage groups to measure test completeness.

- `FIFO_testbench.sv`:  
  Main testbench module driving stimulus and collecting results.

---

### 4. Shared Package

- `shared_pkg.sv`:  
  Package containing common parameters, typedefs, and utilities used across testbench components.

---

### 5. Do File & File List

- `dofifo1.do`:  
  ModelSim/Questa `.do` script for compiling and running the simulation.

- `FIFO_files.list`:  
  File list used for compiling all SystemVerilog files in the correct order.

---

## 🛠 Tools

- **Language:** SystemVerilog
- **Methodology:** Class-Based SystemVerilog
- **Simulator:** QuestaSim / ModelSim

---

### How to Run

1. **Compile:**

    ```tcl
    vlog -f FIFO_files.list
    ```

2. **Simulate:**

    ```tcl
    vsim work.FIFO_top
    ```

3. **Run Simulation:**

    ```tcl
    do dofifo1.do
    ```

---

## Conclusion

This project demonstrates a **structured SystemVerilog testbench approach** to verify a robust FIFO module.

Through assertions, coverage, and a self-checking scoreboard, it achieves high confidence in design correctness and protocol compliance.


---
