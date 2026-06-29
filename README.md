# Digital - 4-Bit Ripple Counter

## Project Overview
This repository contains a **4-bit Ripple Counter** implemented in Verilog. The counter is a basic digital logic design that increments a 4-bit value on each clock pulse and supports asynchronous reset functionality.

## Files

### `counter.v`
The main counter module with the following specifications:
- **Inputs:**
  - `clk`: Clock input
  - `reset`: Asynchronous reset (active high)
- **Outputs:**
  - `q[3:0]`: 4-bit counter output
- **Functionality:** Increments by 1 on each rising clock edge; resets to 0000 when reset is asserted

### `counter_tb.v`
A comprehensive testbench for the counter module that verifies:
- Counter increment functionality (0 to 15 and wraparound)
- Reset operation during normal operation
- Clock and reset timing behavior

## Running the Simulation

### Prerequisites
Install the Icarus Verilog simulator:
```bash
sudo apt-get install iverilog
```

### Compile and Run
```bash
cd /workspaces/Digital
iverilog -o counter_tb counter.v counter_tb.v
vvp counter_tb
```

### Expected Output
The testbench output shows:
- Time (in nanoseconds)
- Reset signal state (1 = asserted, 0 = released)
- 4-bit counter output (in binary)

The counter counts from 0000 (0) to 1111 (15), wraps around to 0000, demonstrates reset functionality, and resumes counting.

### Waveform Analysis
A VCD (Value Change Dump) file is generated as `counter_tb.vcd` for detailed waveform viewing in tools like GTKWave:
```bash
gtkwave counter_tb.vcd
```

## Counter Behavior

| Condition | Behavior |
|-----------|----------|
| Reset asserted (reset = 1) | Output set to 0000 |
| Normal operation | Increments by 1 every clock cycle |
| Overflow (at 1111) | Wraps around to 0000 |

## Design Details
- **Architecture:** 4-bit synchronous counter
- **Word Size:** 4 bits (range 0-15)
- **Clock:** Rising edge triggered
- **Reset:** Asynchronous, active high
- **Frequency:** Tested at 100MHz (10ns clock period)