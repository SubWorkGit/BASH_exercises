
# Exercise 2: GPIO Control Simulation

## Objective
Simulate GPIO pin control on an embedded system and integrate it with a C program for testing logic.

## Contents
- `gpio_sim.sh`: Bash script to simulate GPIO pin behavior.
- `gpio_control.c`: C program to control and test GPIO operations.

## Bash Script: gpio_sim.sh
A script to simulate GPIO pins by creating virtual files and handling input/output.

## C Program: gpio_control.c
A C program that:
- Reads the button state from a virtual file (`/tmp/gpio_sim/gpio_button`).
- Controls the LED state by writing to another virtual file (`/tmp/gpio_sim/gpio_led`).

## How to Run
1. **Start the Bash Script**:
   Run the `gpio_sim.sh` script to initialize the GPIO simulation:
   ```bash
   ./gpio_sim.sh &
   ```

2. **Compile the C Program**:
   Compile `gpio_control.c`:
   ```bash
   gcc gpio_control.c -o gpio_control
   ```

3. **Run the C Program**:
   ```bash
   ./gpio_control
   ```

4. **Simulate Button Input**:
   Modify the button state in another terminal:
   ```bash
   echo "1" > /tmp/gpio_sim/gpio_button  # Simulate button press
   echo "0" > /tmp/gpio_sim/gpio_button  # Simulate button release
   ```

## Expected Output
- The C program will output:
  ```
  LED ON
  LED OFF
  ```
- The `/tmp/gpio_sim/gpio_led` file will reflect the LED state.


