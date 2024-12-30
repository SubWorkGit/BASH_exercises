
# Automated Toolchain Selection

This repository contains a Bash script for automating the selection of cross-compilation toolchains and compiling programs for embedded systems. The script supports multiple architectures, including ARM64, ARM Cortex-M, and x86.

## Features

- Dynamic selection of target architectures:
  - **ARM64**: Uses `aarch64-linux-gnu-gcc` for 64-bit ARM Linux platforms.
  - **ARM Cortex-M**: Uses `arm-none-eabi-gcc` for bare-metal microcontroller environments.
  - **x86**: Uses the standard `gcc` for x86 architectures.
- Automated toolchain detection and validation.
- Compiles a simple "Hello, World!" program to verify the toolchain setup.
- Reports the architecture-specific output binary.

## Prerequisites

Ensure the required toolchains are installed:

### ARM64 Toolchain
```bash
sudo apt update
sudo apt install gcc-aarch64-linux-gnu
```

### ARM Cortex-M Toolchain
```bash
sudo apt update
sudo apt install gcc-arm-none-eabi
```

### x86 Toolchain
```bash
sudo apt update
sudo apt install build-essential
```

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/bash_toolchain_selector.git
   cd bash_toolchain_selector
   ```

2. Make the script executable:
   ```bash
   chmod +x toolchain_selector.sh
   ```

3. Run the script:
   ```bash
   ./toolchain_selector.sh
   ```

4. Follow the interactive menu to:
   - Select a target architecture.
   - Verify toolchain availability.
   - Compile the "Hello, World!" program for the selected architecture.

## Example Output

### ARM64 Compilation
```bash
Selected architecture: arm64
Using toolchain: aarch64-linux-gnu-gcc
Compiling a test program for arm64...
Compilation successful! Binary: hello_arm64.elf
hello_arm64.elf: ELF 64-bit LSB executable, ARM aarch64, ...
```

### Toolchain Not Found
```bash
Error: aarch64-linux-gnu-gcc is not installed or not in PATH.
Please install it and try again.
```

## File Structure

```
bash_toolchain_selector/
├── toolchain_selector.sh  # Main Bash script
├── examples/
│   ├── hello.c            # Example C program
├── README.md              # Documentation
```

