#!/bin/bash

# Step 1: Define Available Toolchains
declare -A TOOLCHAINS
TOOLCHAINS["arm64"]="aarch64-linux-gnu-gcc"
TOOLCHAINS["arm"]="arm-none-eabi-gcc"
TOOLCHAINS["x86"]="gcc"

# Define Toolchain Paths (update as needed)
declare -A TOOLCHAIN_PATHS
TOOLCHAIN_PATHS["arm64"]="/usr/bin"
TOOLCHAIN_PATHS["arm"]="/usr/bin"
TOOLCHAIN_PATHS["x86"]="/usr/bin"

# Step 2: User Input for Architecture
echo "Select target architecture:"
echo "1) ARM64 (aarch64-linux-gnu-gcc)"
echo "2) ARM (arm-none-eabi-gcc)"
echo "3) x86 (gcc)"
read -p "Enter your choice (1/2/3): " CHOICE

# Map input to architecture
case $CHOICE in
    1) TARGET_ARCH="arm64" ;;
    2) TARGET_ARCH="arm" ;;
    3) TARGET_ARCH="x86" ;;
    *) echo "Invalid choice! Exiting..."; exit 1 ;;
esac

# Step 3: Check Toolchain Availability
TOOLCHAIN=${TOOLCHAINS[$TARGET_ARCH]}
echo "Selected architecture: $TARGET_ARCH"
echo "Using toolchain: $TOOLCHAIN"

if ! command -v "$TOOLCHAIN" &> /dev/null; then
    echo "Error: $TOOLCHAIN is not installed or not in PATH."
    echo "Please install it and try again."
    exit 1
fi

# Step 4: Compile a Test Program
echo "Compiling a test program for $TARGET_ARCH..."
TEST_PROGRAM="hello.c"
OUTPUT_BINARY="hello_$TARGET_ARCH.elf"

# Create a "Hello, World!" program
cat <<EOF > $TEST_PROGRAM
#include <stdio.h>
int main() {
    printf("Hello, $TARGET_ARCH World!\\n");
    return 0;
}
EOF

# Run the cross-compiler
if [[ $TARGET_ARCH == "arm64" ]]; then
    $TOOLCHAIN -o $OUTPUT_BINARY $TEST_PROGRAM
elif [[ $TARGET_ARCH == "arm" ]]; then
    $TOOLCHAIN -mcpu=cortex-m4 -mthumb -o $OUTPUT_BINARY $TEST_PROGRAM
else
    $TOOLCHAIN -o $OUTPUT_BINARY $TEST_PROGRAM
fi

# Check if compilation was successful
if [[ $? -eq 0 ]]; then
    echo "Compilation successful! Binary: $OUTPUT_BINARY"
    file $OUTPUT_BINARY
else
    echo "Compilation failed!"
    exit 1
fi

# Cleanup (optional)
rm -f $TEST_PROGRAM
echo "Done!"
