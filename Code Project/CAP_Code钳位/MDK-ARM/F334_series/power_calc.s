; generated by Component: ARM Compiler 5.06 update 4 (build 422) Tool: ArmCC [4d3604]
; commandline ArmCC [--c99 --split_sections --debug -c -S -of334_series\power_calc.s --depend=f334_series\power_calc.d --cpu=Cortex-M4.fp --apcs=interwork -O3 --diag_suppress=9931 -I../Core/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I.\bsp_user -I.\RTE\_F334_series -ID:\Keil_v5\ARM\PACK\ARM\CMSIS\5.0.1\CMSIS\Include -ID:\Keil_v5\ARM\PACK\Keil\STM32F3xx_DFP\2.2.2\Drivers\CMSIS\Device\ST\STM32F3xx\Include -D__MICROLIB -D__UVISION_VERSION=523 -D_RTE_ -DSTM32F334x8 -DUSE_HAL_DRIVER -DSTM32F334x8 -DARM_MATH_CM4 -D__FPU_PRESENT=1U -D__CC_ARM --omf_browse=f334_series\power_calc.crf bsp_user\power_calc.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.BuckBoostVLoopCtlPID||, CODE, READONLY, ALIGN=2

BuckBoostVLoopCtlPID PROC
        PUSH     {r4-r10,lr}
        LDR      r5,|L0.464|
        VPUSH    {d8-d10}
        LDRH     r0,[r5,#0xe]  ; FLAGS
        CBZ      r0,|L0.26|
        LDR      r0,|L0.468|
        BL       IncrementalPID_Clear
        LDR      r0,|L0.472|
        BL       IncrementalPID_Clear
|L0.26|
        LDRH     r0,[r5,#6]  ; FLAGS
        LDR      r4,|L0.476|
        MOV      r10,#0x900
        CBZ      r0,|L0.62|
        LDR      r9,|L0.468|
        LDR      r6,|L0.480|
        MOVS     r7,#0
        VLDR     s16,|L0.484|
        LDR      r8,|L0.488|
        CMP      r0,#1
        BEQ      |L0.76|
        CMP      r0,#2
        BNE      |L0.74|
        B        |L0.192|
|L0.62|
        LDR      r0,|L0.468|
        BL       IncrementalPID_Clear
        LDR      r0,|L0.472|
        BL       IncrementalPID_Clear
|L0.74|
        B        |L0.420|
|L0.76|
        LDRH     r0,[r5,#0xe]  ; FLAGS
        CMP      r0,#1
        BNE      |L0.84|
        STRH     r7,[r5,#0xe]
|L0.84|
        LDR      r0,|L0.472|
        VLDR     s0,[r9,#0x20]
        VLDR     s1,[r0,#0x20]
        VCMPE.F32 s0,s1
        VMRS     APSR_nzcv,FPSCR
        BCS      |L0.108|
        STRH     r7,[r5,#0xa]
        B        |L0.112|
|L0.108|
        MOVS     r0,#1
        STRH     r0,[r5,#0xa]
|L0.112|
        VMOV.F32 s0,#1.00000000
        VSTR     s0,[r6,#4]
        VLDR     s0,[r6,#4]
        VMUL.F32 s0,s0,s16
        VCVT.S32.F32 s0,s0
        VMOV     r0,s0
        STRD     r0,r10,[r4,#0x14]
        LDR      r1,[r4,#0xc]  ; CtrValue
        CMP      r0,r1
        BLE      |L0.148|
        STR      r1,[r4,#0x14]  ; CtrValue
|L0.148|
        VLDR     s2,[r8,#0]
        VLDR     s0,|L0.492|
        VDIV.F32 s1,s2,s0
        VMUL.F32 s0,s1,s16
        VLDR     s1,[r4,#0x14]
        VCVT.F32.S32 s1,s1
        VCMPE.F32 s0,s1
        VMRS     APSR_nzcv,FPSCR
        BLE      |L0.420|
        VCVT.S32.F32 s0,s0
        VSTR     s0,[r4,#0x14]
        B        |L0.420|
|L0.192|
        LDRH     r0,[r5,#0xe]  ; FLAGS
        CBZ      r0,|L0.282|
        VLDR     s18,|L0.496|
        VMOV.F32 s6,s18
        VLDR     s19,|L0.500|
        VMOV.F32 s5,s19
        VLDR     s20,|L0.504|
        VMOV.F32 s4,s20
        VLDR     s3,|L0.508|
        VLDR     s17,|L0.512|
        LDR      r0,|L0.468|
        VMOV.F32 s2,s17
        VMOV.F32 s1,s17
        VMOV.F32 s0,s17
        BL       IncrementalPID_Init
        VMOV.F32 s6,s18
        VMOV.F32 s5,s19
        VMOV.F32 s4,s20
        VMOV.F32 s3,s17
        VMOV.F32 s2,#1.00000000
        VLDR     s1,|L0.516|
        VMOV.F32 s0,s17
        LDR      r0,|L0.472|
        BL       IncrementalPID_Init
        STRH     r7,[r5,#0xe]
|L0.282|
        LDRH     r1,[r6,#0]  ; testpower
        LDR      r0,|L0.488|
        VMOV     s0,r1
        SUBS     r0,r0,#0xc
        VCVT.F32.U32 s2,s0
        VLDR     s1,[r0,#0]
        VDIV.F32 s0,s2,s1
        VLDR     s1,[r0,#4]
        LDR      r0,|L0.468|
        BL       IncrementalPID_Compute
        VLDR     s1,[r8,#0]
        VMOV.F32 s0,#23.00000000
        LDR      r0,|L0.472|
        BL       IncrementalPID_Compute
        VLDR     s0,[r9,#0x20]
        MOV      r0,#0x7dff
        VSTR     s0,[r6,#4]
        VLDR     s0,[r6,#4]
        VMUL.F32 s0,s0,s16
        VCVT.S32.F32 s0,s0
        VSTR     s0,[r4,#0x18]
        STR      r0,[r4,#0x14]  ; CtrValue
        LDRH     r0,[r5,#0xe]  ; FLAGS
        CBZ      r0,|L0.408|
        LDR      r0,|L0.488|
        VLDR     s1,|L0.520|
        SUBS     r0,r0,#0x24
        VLDR     s2,[r8,#0]
        VLDR     s0,[r0,#0]
        VMUL.F32 s1,s0,s1
        VDIV.F32 s0,s1,s2
        VLDR     s1,|L0.524|
        VSUB.F32 s0,s1,s0
        VMUL.F32 s0,s0,s16
        VCVT.S32.F32 s0,s0
        VSTR     s0,[r4,#0x18]
        STRH     r7,[r5,#0xe]
|L0.408|
        VMOV     r1,s0
        LDR      r0,[r4,#0x10]  ; CtrValue
        CMP      r1,r0
        BLE      |L0.420|
        STR      r0,[r4,#0x18]  ; CtrValue
|L0.420|
        LDRH     r0,[r5,#0xc]  ; FLAGS
        CBNZ     r0,|L0.432|
        STR      r10,[r4,#0x14]  ; CtrValue
        STR      r10,[r4,#0x18]  ; CtrValue
|L0.432|
        LDR      r0,[r4,#0x14]  ; CtrValue
        RSB      r1,r0,#0xb400
        LDR      r0,|L0.528|
        LDR      r2,[r0,#0]  ; hhrtim1
        STR      r1,[r2,#0x9c]
        LDR      r0,[r0,#0]  ; hhrtim1
        LDR      r1,[r4,#0x18]  ; CtrValue
        STR      r1,[r0,#0x21c]
        VPOP     {d8-d10}
        POP      {r4-r10,pc}
        ENDP

        DCW      0x0000
|L0.464|
        DCD      FLAGS
|L0.468|
        DCD      currentout_Iloop
|L0.472|
        DCD      voltageout_Vloop
|L0.476|
        DCD      CtrValue
|L0.480|
        DCD      ||.data||
|L0.484|
        DCFS     0x47340000 ; 46080
|L0.488|
        DCD      ||.bss||+0xc4
|L0.492|
        DCFS     0x42040000 ; 33
|L0.496|
        DCFS     0x3d4ccccd ; 0.05000000074505806
|L0.500|
        DCFS     0x3f733333 ; 0.94999998807907104
|L0.504|
        DCFS     0xbc23d70a ; -0.0099999997764825821
|L0.508|
        DCFS     0x3c23d70a ; 0.0099999997764825821
|L0.512|
        DCFS     0x00000000 ; 0
|L0.516|
        DCFS     0x3dcccccd ; 0.10000000149011612
|L0.520|
        DCFS     0x3f4ccccd ; 0.80000001192092896
|L0.524|
        DCFS     0x3f80624e ; 1.003000020980835
|L0.528|
        DCD      hhrtim1

        AREA ||i.HAL_ADC_ConvCpltCallback||, CODE, READONLY, ALIGN=2

HAL_ADC_ConvCpltCallback PROC
        PUSH     {r4,r5}
        LDR      r4,|L1.244|
        MOVS     r0,#0
        VMOV.F32 s0,#5.00000000
        ADD      r2,r4,#0x78
|L1.14|
        MOVS     r3,#0
        ADD      r1,r2,r0,LSL #2
|L1.20|
        ADD      r5,r3,r3,LSL #2
        ADD      r5,r4,r5,LSL #2
        VLDR     s2,[r1,#0]
        LDR      r5,[r5,r0,LSL #2]
        ADDS     r3,r3,#1
        VMOV     s1,r5
        UXTB     r3,r3
        CMP      r3,#5
        VCVT.F32.U32 s1,s1
        VADD.F32 s1,s1,s2
        VSTR     s1,[r1,#0]
        BCC      |L1.20|
        VDIV.F32 s2,s1,s0
        ADDS     r0,r0,#1
        UXTB     r0,r0
        CMP      r0,#5
        VSTR     s2,[r1,#0]
        BCC      |L1.14|
        LDR      r1,|L1.244|
        MOVS     r0,#0
        ADDS.W   r1,r1,#0x8c
|L1.84|
        ADD      r3,r2,r0,LSL #2
        VLDR     s0,[r3,#0]
        VCVT.U32.F32 s0,s0
        VMOV     r3,s0
        STR      r3,[r1,r0,LSL #2]
        ADDS     r0,r0,#1
        UXTB     r0,r0
        CMP      r0,#5
        BCC      |L1.84|
        VLDR     s1,[r2,#0]
        VLDR     s2,|L1.248|
        VLDR     s0,|L1.252|
        LDR      r0,|L1.244|
        VLDR     s3,|L1.264|
        VMLA.F32 s0,s1,s2
        ADDS     r0,r0,#0x64
        VLDR     s2,|L1.256|
        VSTR     s0,[r0,#4]
        VLDR     s1,[r2,#4]
        VLDR     s0,|L1.260|
        VMLA.F32 s0,s1,s2
        VSTR     s0,[r0,#0]
        VLDR     s0,|L1.268|
        VLDR     s2,[r2,#8]
        VMOV.F32 s1,s0
        VMLA.F32 s1,s2,s3
        VLDR     s2,|L1.276|
        VSTR     s1,[r0,#0x10]
        VLDR     s3,[r2,#0xc]
        VLDR     s1,|L1.272|
        VNMLS.F32 s2,s3,s1
        VSTR     s2,[r0,#0xc]
        VLDR     s2,[r2,#0x10]
        VNMLS.F32 s0,s2,s1
        VSTR     s0,[r0,#8]
        VLDR     s0,|L1.280|
        MOVS     r0,#0
        NOP      
|L1.220|
        ADD      r1,r2,r0,LSL #2
        ADDS     r0,r0,#1
        UXTB     r0,r0
        VSTR     s0,[r1,#0]
        CMP      r0,#5
        BCC      |L1.220|
        POP      {r4,r5}
        B.W      control_calc
        ENDP

        DCW      0x0000
|L1.244|
        DCD      ||.bss||
|L1.248|
        DCFS     0x3c463f14 ; 0.012099999934434891
|L1.252|
        DCFS     0x3d26b50b ; 0.040699999779462814
|L1.256|
        DCFS     0x3c449ba6 ; 0.012000000104308128
|L1.260|
        DCFS     0x3ce7d567 ; 0.028300000354647636
|L1.264|
        DCFS     0xbbadab9f ; -0.0052999998442828655
|L1.268|
        DCFS     0x412cb22d ; 10.793499946594238
|L1.272|
        DCFS     0x3badab9f ; 0.0052999998442828655
|L1.276|
        DCFS     0x412d7efa ; 10.843500137329102
|L1.280|
        DCFS     0x00000000 ; 0

        AREA ||i.UserADC1_Init||, CODE, READONLY, ALIGN=2

UserADC1_Init PROC
        PUSH     {r4,lr}
        MOVS     r1,#0
        LDR      r0,|L2.32|
        BL       HAL_ADCEx_Calibration_Start
        MOVS     r0,#0xa
        BL       HAL_Delay
        POP      {r4,lr}
        MOVS     r2,#0x19
        LDR      r1,|L2.36|
        LDR      r0,|L2.32|
        B.W      HAL_ADC_Start_DMA
        ENDP

        DCW      0x0000
|L2.32|
        DCD      hadc1
|L2.36|
        DCD      ||.bss||

        AREA ||i.control_calc||, CODE, READONLY, ALIGN=2

control_calc PROC
        LDR      r0,|L3.100|
        ADD      r1,r0,#0x3c
        VLDR     s1,[r0,#8]
        VSTR     s1,[r1,#4]
        VLDR     s0,[r0,#4]
        VSTR     s0,[r1,#0]
        VMUL.F32 s2,s0,s1
        VSTR     s2,[r1,#8]
        VLDR     s2,[r0,#0x10]
        ADDS     r1,r1,#0xc
        VSUB.F32 s1,s1,s2
        VSTM     r1,{s0-s1}
        VMUL.F32 s1,s0,s1
        VSTR     s1,[r1,#8]
        ADDS     r1,r1,#0xc
        VSTR     s2,[r1,#4]
        VSTR     s0,[r1,#0]
        VMUL.F32 s0,s0,s2
        VSTR     s0,[r1,#8]
        VLDR     s0,[r0,#0xc]
        ADDS     r1,r1,#0xc
        VSTR     s0,[r1,#4]
        VLDR     s1,[r0,#0]
        VSTR     s1,[r1,#0]
        VMUL.F32 s0,s1,s0
        VSTR     s0,[r1,#8]
        BX       lr
        ENDP

        DCW      0x0000
|L3.100|
        DCD      ||.bss||+0x64

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||.bss||, DATA, NOINIT, ALIGN=2

UserADC1_ConvertedValue
        %        100
dcdcinfo
        %        20
adc_raw_data
        %        20
usefor_adc
        %        20
||in||
        %        12
chassis
        %        12
full_bridge_in
        %        12
||cap||
        %        12

        AREA ||area_number.6||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.6||, ||.bss||
buckboost
        %        20

        AREA ||.data||, DATA, ALIGN=2

testpower
        DCW      0x001e
        DCB      0x00,0x00
pid_final
        DCFS     0x00000000 ; 0

        AREA ||area_number.9||, DATA, ALIGN=1

        EXPORTAS ||area_number.9||, ||.data||
testperiod
        DCW      0x2710

;*** Start embedded assembler ***

#line 1 "bsp_user\\power_calc.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___12_power_calc_c_264c8db0____REV16|
#line 463 "../Drivers/CMSIS/Include/cmsis_armcc.h"
|__asm___12_power_calc_c_264c8db0____REV16| PROC
#line 464

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___12_power_calc_c_264c8db0____REVSH|
#line 478
|__asm___12_power_calc_c_264c8db0____REVSH| PROC
#line 479

 revsh r0, r0
 bx lr
	ENDP
	AREA ||.rrx_text||, CODE
	THUMB
	EXPORT |__asm___12_power_calc_c_264c8db0____RRX|
#line 665
|__asm___12_power_calc_c_264c8db0____RRX| PROC
#line 666

 rrx r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT BuckBoostVLoopCtlPID [CODE]
        EXPORT HAL_ADC_ConvCpltCallback [CODE]
        EXPORT UserADC1_Init [CODE]
        EXPORT control_calc [CODE]
        EXPORT UserADC1_ConvertedValue [DATA,SIZE=100]
        EXPORT dcdcinfo [DATA,SIZE=20]
        EXPORT adc_raw_data [DATA,SIZE=20]
        EXPORT usefor_adc [DATA,SIZE=20]
        EXPORT ||in|| [DATA,SIZE=12]
        EXPORT chassis [DATA,SIZE=12]
        EXPORT full_bridge_in [DATA,SIZE=12]
        EXPORT ||cap|| [DATA,SIZE=12]
        EXPORT buckboost [DATA,SIZE=20]
        EXPORT testpower [DATA,SIZE=2]
        EXPORT pid_final [DATA,SIZE=4]
        EXPORT testperiod [DATA,SIZE=2]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT HAL_ADCEx_Calibration_Start [CODE]
        IMPORT HAL_Delay [CODE]
        IMPORT HAL_ADC_Start_DMA [CODE]
        IMPORT hadc1 [DATA]
        IMPORT IncrementalPID_Clear [CODE]
        IMPORT IncrementalPID_Init [CODE]
        IMPORT IncrementalPID_Compute [CODE]
        IMPORT FLAGS [DATA]
        IMPORT currentout_Iloop [DATA]
        IMPORT voltageout_Vloop [DATA]
        IMPORT CtrValue [DATA]
        IMPORT hhrtim1 [DATA]

        ATTR FILESCOPE
        ATTR SETVALUE Tag_ABI_PCS_wchar_t,2
        ATTR SETVALUE Tag_ABI_enum_size,1
        ATTR SETVALUE Tag_ABI_optimization_goals,3
        ATTR SETSTRING Tag_conformance,"2.09"
        ATTR SETVALUE AV,18,1

        ASSERT {ENDIAN} = "little"
        ASSERT {INTER} = {TRUE}
        ASSERT {ROPI} = {FALSE}
        ASSERT {RWPI} = {FALSE}
        ASSERT {IEEE_FULL} = {FALSE}
        ASSERT {IEEE_PART} = {FALSE}
        ASSERT {IEEE_JAVA} = {FALSE}
        END
