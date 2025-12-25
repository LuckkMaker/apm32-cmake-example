;/**
; * @file       startup_apm32f402xx.s
; *
; * @brief      CMSIS Cortex-M4 based Core Device Startup File for Device startup_apm32f402xx
; *
; * @version    V1.0.0
; *
; * @date       2024-08-01
; *
; * @attention
; *
; *  Copyright (C) 2024 Geehy Semiconductor
; *
; *  You may not use this file except in compliance with the
; *  GEEHY COPYRIGHT NOTICE (GEEHY SOFTWARE PACKAGE LICENSE).
; *
; *  The program is only for reference, which is distributed in the hope
; *  that it will be useful and instructional for customers to develop
; *  their software. Unless required by applicable law or agreed to in
; *  writing, the program is distributed on an "AS IS" BASIS, WITHOUT
; *  ANY WARRANTY OR CONDITIONS OF ANY KIND, either express or implied.
; *  See the GEEHY SOFTWARE PACKAGE LICENSE for the governing permissions
; *  and limitations under the License.
; */

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        EXTERN  SystemInit
        PUBLIC  __vector_table

        DATA
__vector_table
        DCD     sfe(CSTACK)
        DCD     Reset_Handler             ; Reset Handler

                DCD     NMI_Handler                ; NMI Handler
                DCD     HardFault_Handler          ; Hard Fault Handler
                DCD     MemManage_Handler          ; MPU Fault Handler
                DCD     BusFault_Handler           ; Bus Fault Handler
                DCD     UsageFault_Handler         ; Usage Fault Handler
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     SVC_Handler                ; SVCall Handler
                DCD     DebugMon_Handler           ; Debug Monitor Handler
                DCD     0                          ; Reserved
                DCD     PendSV_Handler             ; PendSV Handler
                DCD     SysTick_Handler            ; SysTick Handler

                ; External Interrupts
                DCD     WWDT_IRQHandler                 ; Window WatchDog
                DCD     PVD_IRQHandler                  ; PVD through EINT Line detection
                DCD     TAMPER_IRQHandler               ; Tamper
                DCD     RTC_IRQHandler                  ; RTC
                DCD     FLASH_IRQHandler                ; FLASH
                DCD     RCM_IRQHandler                  ; RCM
                DCD     EINT0_IRQHandler                ; EINT Line0
                DCD     EINT1_IRQHandler                ; EINT Line1
                DCD     EINT2_IRQHandler                ; EINT Line2
                DCD     EINT3_IRQHandler                ; EINT Line3
                DCD     EINT4_IRQHandler                ; EINT Line4
                DCD     DMA1_Channel1_IRQHandler        ; DMA1 Channel 1
                DCD     DMA1_Channel2_IRQHandler        ; DMA1 Channel 2
                DCD     DMA1_Channel3_IRQHandler        ; DMA1 Channel 3
                DCD     DMA1_Channel4_IRQHandler        ; DMA1 Channel 4
                DCD     DMA1_Channel5_IRQHandler        ; DMA1 Channel 5
                DCD     DMA1_Channel6_IRQHandler        ; DMA1 Channel 6
                DCD     DMA1_Channel7_IRQHandler        ; DMA1 Channel 7
                DCD     ADC1_2_IRQHandler               ; ADC1, ADC2
                DCD     CAN1_TX_IRQHandler              ; CAN1 TX
                DCD     CAN1_RX0_IRQHandler             ; CAN1 RX0
                DCD     CAN1_RX1_IRQHandler             ; CAN1 RX1
                DCD     CAN1_SCE_IRQHandler             ; CAN1 SCE
                DCD     EINT9_5_IRQHandler              ; External Line[9:5]s
                DCD     TMR1_BRK_IRQHandler             ; TMR1 Break
                DCD     TMR1_UP_IRQHandler              ; TMR1 Update
                DCD     TMR1_TRG_COM_IRQHandler         ; TMR1 Trigger and Commutation
                DCD     TMR1_CC_IRQHandler              ; TMR1 Capture Compare
                DCD     TMR2_IRQHandler                 ; TMR2
                DCD     TMR3_IRQHandler                 ; TMR3
                DCD     TMR4_IRQHandler                 ; TMR4
                DCD     I2C1_EV_IRQHandler              ; I2C1 Event
                DCD     I2C1_ER_IRQHandler              ; I2C1 Error
                DCD     0                               ; Reserved
                DCD     0                               ; Reserved
                DCD     SPI1_IRQHandler                 ; SPI1
                DCD     SPI2_IRQHandler                 ; SPI2
                DCD     USART1_IRQHandler               ; USART1
                DCD     USART2_IRQHandler               ; USART2
                DCD     USART3_IRQHandler               ; USART3
                DCD     EINT15_10_IRQHandler            ; External Line[15:10]s
                DCD     RTC_Alarm_IRQHandler            ; RTC Alarm through EINT Line
                DCD     OTG_FS_WKUP_IRQHandler          ; OTG_FS Wakeup through EINT line
                DCD     TMR8_BRK_IRQHandler             ; TMR8 Break
                DCD     TMR8_UP_IRQHandler              ; TMR8 Update
                DCD     TMR8_TRG_COM_IRQHandler         ; TMR8 Trigger and Commutation
                DCD     TMR8_CC_IRQHandler              ; TMR8 Capture Compare
                DCD     0                               ; Reserved
                DCD     0                               ; Reserved
                DCD     0                               ; Reserved
                DCD     TMR5_IRQHandler                 ; TMR5
                DCD     0                               ; Reserved
                DCD     UART4_IRQHandler                ; UART4
                DCD     0                               ; Reserved
                DCD     0                               ; Reserved
                DCD     0                               ; Reserved
                DCD     DMA2_Channel1_IRQHandler        ; DMA2 Channel 1
                DCD     DMA2_Channel2_IRQHandler        ; DMA2 Channel 2
                DCD     DMA2_Channel3_IRQHandler        ; DMA2 Channel 3
                DCD     DMA2_Channel4_5_IRQHandler      ; DMA2 Channel 4/5
                DCD     FPU_IRQHandler                  ; FPU
                DCD     CAN2_TX_IRQHandler              ; CAN2 TX
                DCD     CAN2_RX0_IRQHandler             ; CAN2 RX0
                DCD     CAN2_RX1_IRQHandler             ; CAN2 RX1
                DCD     CAN2_SCE_IRQHandler             ; CAN2 SCE
                DCD     OTG_FS_IRQHandler               ; OTG_FS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;
        THUMB
        PUBWEAK Reset_Handler
        SECTION .text:CODE:REORDER:NOROOT(2)
Reset_Handler

        LDR     R0, =SystemInit
        BLX     R0
        LDR     R0, =__iar_program_start
        BX      R0

        PUBWEAK NMI_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
NMI_Handler
        B NMI_Handler

        PUBWEAK HardFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
HardFault_Handler
        B HardFault_Handler

        PUBWEAK MemManage_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
MemManage_Handler
        B MemManage_Handler

        PUBWEAK BusFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
BusFault_Handler
        B BusFault_Handler

        PUBWEAK UsageFault_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
UsageFault_Handler
        B UsageFault_Handler

        PUBWEAK SVC_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SVC_Handler
        B SVC_Handler

        PUBWEAK DebugMon_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
DebugMon_Handler
        B DebugMon_Handler

        PUBWEAK PendSV_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
PendSV_Handler
        B PendSV_Handler

        PUBWEAK SysTick_Handler
        SECTION .text:CODE:REORDER:NOROOT(1)
SysTick_Handler
        B SysTick_Handler

        PUBWEAK WWDT_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
WWDT_IRQHandler
        B WWDT_IRQHandler

        PUBWEAK PVD_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
PVD_IRQHandler
        B PVD_IRQHandler

        PUBWEAK TAMPER_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TAMPER_IRQHandler
        B TAMPER_IRQHandler

        PUBWEAK RTC_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
RTC_IRQHandler
        B RTC_IRQHandler

        PUBWEAK FLASH_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
FLASH_IRQHandler
        B FLASH_IRQHandler

        PUBWEAK RCM_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
RCM_IRQHandler
        B RCM_IRQHandler

        PUBWEAK EINT0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT0_IRQHandler
        B EINT0_IRQHandler

        PUBWEAK EINT1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT1_IRQHandler
        B EINT1_IRQHandler

        PUBWEAK EINT2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT2_IRQHandler
        B EINT2_IRQHandler

        PUBWEAK EINT3_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT3_IRQHandler
        B EINT3_IRQHandler

        PUBWEAK EINT4_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT4_IRQHandler
        B EINT4_IRQHandler

        PUBWEAK DMA1_Channel1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel1_IRQHandler
        B DMA1_Channel1_IRQHandler

        PUBWEAK DMA1_Channel2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel2_IRQHandler
        B DMA1_Channel2_IRQHandler

        PUBWEAK DMA1_Channel3_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel3_IRQHandler
        B DMA1_Channel3_IRQHandler

        PUBWEAK DMA1_Channel4_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel4_IRQHandler
        B DMA1_Channel4_IRQHandler

        PUBWEAK DMA1_Channel5_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel5_IRQHandler
        B DMA1_Channel5_IRQHandler

        PUBWEAK DMA1_Channel6_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel6_IRQHandler
        B DMA1_Channel6_IRQHandler

        PUBWEAK DMA1_Channel7_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA1_Channel7_IRQHandler
        B DMA1_Channel7_IRQHandler

        PUBWEAK ADC1_2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
ADC1_2_IRQHandler
        B ADC1_2_IRQHandler

        PUBWEAK CAN1_TX_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN1_TX_IRQHandler
        B CAN1_TX_IRQHandler

        PUBWEAK CAN1_RX0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN1_RX0_IRQHandler
        B CAN1_RX0_IRQHandler

        PUBWEAK CAN1_RX1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN1_RX1_IRQHandler
        B CAN1_RX1_IRQHandler

        PUBWEAK CAN1_SCE_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN1_SCE_IRQHandler
        B CAN1_SCE_IRQHandler

        PUBWEAK EINT9_5_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT9_5_IRQHandler
        B EINT9_5_IRQHandler

        PUBWEAK TMR1_BRK_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR1_BRK_IRQHandler
        B TMR1_BRK_IRQHandler

        PUBWEAK TMR1_UP_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR1_UP_IRQHandler
        B TMR1_UP_IRQHandler

        PUBWEAK TMR1_TRG_COM_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR1_TRG_COM_IRQHandler
        B TMR1_TRG_COM_IRQHandler

        PUBWEAK TMR1_CC_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR1_CC_IRQHandler
        B TMR1_CC_IRQHandler

        PUBWEAK TMR2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR2_IRQHandler
        B TMR2_IRQHandler

        PUBWEAK TMR3_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR3_IRQHandler
        B TMR3_IRQHandler

        PUBWEAK TMR4_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR4_IRQHandler
        B TMR4_IRQHandler

        PUBWEAK I2C1_EV_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
I2C1_EV_IRQHandler
        B I2C1_EV_IRQHandler

        PUBWEAK I2C1_ER_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
I2C1_ER_IRQHandler
        B I2C1_ER_IRQHandler

        PUBWEAK SPI1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
SPI1_IRQHandler
        B SPI1_IRQHandler

        PUBWEAK SPI2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
SPI2_IRQHandler
        B SPI2_IRQHandler

        PUBWEAK USART1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
USART1_IRQHandler
        B USART1_IRQHandler

        PUBWEAK USART2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
USART2_IRQHandler
        B USART2_IRQHandler

        PUBWEAK USART3_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
USART3_IRQHandler
        B USART3_IRQHandler

        PUBWEAK EINT15_10_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
EINT15_10_IRQHandler
        B EINT15_10_IRQHandler

        PUBWEAK RTC_Alarm_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
RTC_Alarm_IRQHandler
        B RTC_Alarm_IRQHandler

        PUBWEAK OTG_FS_WKUP_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
OTG_FS_WKUP_IRQHandler
        B OTG_FS_WKUP_IRQHandler

        PUBWEAK TMR8_BRK_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR8_BRK_IRQHandler
        B TMR8_BRK_IRQHandler

        PUBWEAK TMR8_UP_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR8_UP_IRQHandler
        B TMR8_UP_IRQHandler

        PUBWEAK TMR8_TRG_COM_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR8_TRG_COM_IRQHandler
        B TMR8_TRG_COM_IRQHandler

        PUBWEAK TMR8_CC_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR8_CC_IRQHandler
        B TMR8_CC_IRQHandler

        PUBWEAK TMR5_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
TMR5_IRQHandler
        B TMR5_IRQHandler

        PUBWEAK UART4_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
UART4_IRQHandler
        B UART4_IRQHandler

        PUBWEAK DMA2_Channel1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA2_Channel1_IRQHandler
        B DMA2_Channel1_IRQHandler

        PUBWEAK DMA2_Channel2_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA2_Channel2_IRQHandler
        B DMA2_Channel2_IRQHandler

        PUBWEAK DMA2_Channel3_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA2_Channel3_IRQHandler
        B DMA2_Channel3_IRQHandler

        PUBWEAK DMA2_Channel4_5_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
DMA2_Channel4_5_IRQHandler
        B DMA2_Channel4_5_IRQHandler

        PUBWEAK FPU_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
FPU_IRQHandler
        B FPU_IRQHandler

        PUBWEAK CAN2_TX_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN2_TX_IRQHandler
        B CAN2_TX_IRQHandler

        PUBWEAK CAN2_RX0_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN2_RX0_IRQHandler
        B CAN2_RX0_IRQHandler

        PUBWEAK CAN2_RX1_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN2_RX1_IRQHandler
        B CAN2_RX1_IRQHandler

        PUBWEAK CAN2_SCE_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
CAN2_SCE_IRQHandler
        B CAN2_SCE_IRQHandler

        PUBWEAK OTG_FS_IRQHandler
        SECTION .text:CODE:REORDER:NOROOT(1)
OTG_FS_IRQHandler
        B OTG_FS_IRQHandler

        END
