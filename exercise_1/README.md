
# Bash Exercise 1: Log Monitoring Script

This repository contains a Bash script designed to monitor a log file (`/var/log/device.log`) for lines containing the keyword `ERROR`. The script continuously checks the log file at regular intervals and appends new error messages to a report file (`error_report.log`) without duplicating existing entries.


---

## Requirements

- Linux/Unix environment with Bash installed.
- Sufficient permissions to read the log file (`/var/log/device.log`).

---

## Usage

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/bash_exercise_1.git
cd bash_exercise_1
```

### 2. Make the script executable
```bash
chmod +x monitor_logs.sh
```

### 3. Run the script
```bash
./monitor_logs.sh
```

The script will:
1. Continuously monitor the default log file (`/var/log/device.log`).
2. Append new `ERROR` messages to the report file (`error_report.log`).
3. Log progress to the terminal.

### 4. Stop the script
Use `Ctrl+C` to terminate the script.

---

## Example

### Log File (`/var/log/device.log`)
```text
[10:00] INFO: Device initialized.
[10:01] ERROR: Failed to connect to server.
[10:02] ERROR: Timeout occurred.
[10:04] ERROR: Timeout occurred.
```

### Error Report File (`error_report.log`) After Execution
```text
[10:01] ERROR: Failed to connect to server.
[10:02] ERROR: Timeout occurred.
[10:04] ERROR: Timeout occurred.
```

The script ensures that new `ERROR` lines are appended to the report file without duplicating existing entries.

---

## License

This project is licensed under the MIT License. Feel free to use, modify, and distribute it.

