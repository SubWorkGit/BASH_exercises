#!/bin/bash

# 虛擬 GPIO 文件目錄
GPIO_DIR="/tmp/gpio_sim"
BUTTON_FILE="$GPIO_DIR/gpio_button"
LED_FILE="$GPIO_DIR/gpio_led"

# 初始化虛擬 GPIO 文件
initialize_gpio() {
    echo "Initializing virtual GPIO files..."
    mkdir -p "$GPIO_DIR"
    echo "0" > "$BUTTON_FILE"  # 初始化按鍵狀態為 0（未按下）
    echo "0" > "$LED_FILE"     # 初始化 LED 狀態為 0（關閉）
}

# 讀取按鍵狀態
read_button() {
    cat "$BUTTON_FILE"
}

# 控制 LED 狀態
control_led() {
    local button_state=$1
    if [ "$button_state" -eq 1 ]; then
        echo "1" > "$LED_FILE"  # 點亮 LED
        echo "LED ON"
    else
        echo "0" > "$LED_FILE"  # 關閉 LED
        echo "LED OFF"
    fi
}

# 主邏輯循環
run_simulation() {
    echo "Starting GPIO simulation. Modify $BUTTON_FILE to simulate button press."
    while true; do
        button_state=$(read_button)  # 讀取按鍵狀態
        control_led "$button_state" # 根據按鍵狀態控制 LED
        sleep 1                     # 模擬 1 秒間隔
    done
}

# 清理虛擬 GPIO 文件
cleanup() {
    echo "Cleaning up virtual GPIO files..."
    rm -rf "$GPIO_DIR"
}

# 設置腳本中斷時的清理行為
trap cleanup EXIT

# 腳本執行流程
initialize_gpio
run_simulation
