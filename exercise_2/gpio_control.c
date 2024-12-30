#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BUTTON_FILE "/tmp/gpio_sim/gpio_button"
#define LED_FILE "/tmp/gpio_sim/gpio_led"

void control_led() {
    FILE *button_fp, *led_fp;
    int button_state;

    while (1) {
        // 打開按鍵文件並讀取狀態
        button_fp = fopen(BUTTON_FILE, "r");
        if (button_fp == NULL) {
            perror("Error opening button file");
            exit(EXIT_FAILURE);
        }
        fscanf(button_fp, "%d", &button_state);
        fclose(button_fp);

        // 打開 LED 文件並寫入狀態
        led_fp = fopen(LED_FILE, "w");
        if (led_fp == NULL) {
            perror("Error opening LED file");
            exit(EXIT_FAILURE);
        }
        if (button_state == 1) {
            fprintf(led_fp, "1\n"); // 點亮 LED
            printf("LED ON\n");
        } else {
            fprintf(led_fp, "0\n"); // 關閉 LED
            printf("LED OFF\n");
        }
        fclose(led_fp);

        sleep(1); // 每秒檢查一次
    }
}

int main() {
    printf("Starting GPIO control program...\n");
    control_led();
    return 0;
}
