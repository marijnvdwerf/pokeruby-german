	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start RtcDisableInterrupts
RtcDisableInterrupts: @ 80092C0
	ldr r2, _080092D0 @ =0x0300046e
	ldr r1, _080092D4 @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080092D0: .4byte 0x0300046e
_080092D4: .4byte 0x04000208
	thumb_func_end RtcDisableInterrupts

	thumb_func_start RtcRestoreInterrupts
RtcRestoreInterrupts: @ 80092D8
	ldr r0, _080092E4 @ =0x04000208
	ldr r1, _080092E8 @ =0x0300046e
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080092E4: .4byte 0x04000208
_080092E8: .4byte 0x0300046e
	thumb_func_end RtcRestoreInterrupts

	thumb_func_start ConvertBcdToBinary
ConvertBcdToBinary: @ 80092EC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9F
	bhi _080092FE
	movs r3, 0xF
	ands r3, r2
	cmp r3, 0x9
	bls _08009302
_080092FE:
	movs r0, 0xFF
	b _08009310
_08009302:
	lsrs r1, r0, 28
	movs r0, 0xF
	ands r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, r3
_08009310:
	pop {r1}
	bx r1
	thumb_func_end ConvertBcdToBinary

	thumb_func_start IsLeapYear
IsLeapYear: @ 8009314
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08009332
	adds r0, r1, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	cmp r0, 0
	bne _08009340
_08009332:
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r4, 0
	bl __modsi3
	cmp r0, 0
	bne _08009344
_08009340:
	movs r0, 0x1
	b _08009346
_08009344:
	movs r0, 0
_08009346:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsLeapYear

	thumb_func_start ConvertDateToDayCount
ConvertDateToDayCount: @ 800934C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r5, 0
	subs r4, r7, 0x1
	cmp r4, 0
	ble _0800938C
_08009368:
	ldr r1, _080093D0 @ =0x0000016d
	adds r0, r5, r1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r4, 24
	lsrs r0, 24
	bl IsLeapYear
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08009386
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08009386:
	subs r4, 0x1
	cmp r4, 0
	bgt _08009368
_0800938C:
	subs r0, r6, 0x1
	cmp r0, 0
	ble _080093A4
	ldr r1, _080093D4 @ =0x081f4598
	adds r4, r0, 0
_08009396:
	ldm r1!, {r0}
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	subs r4, 0x1
	cmp r4, 0
	bne _08009396
_080093A4:
	cmp r6, 0x2
	bls _080093BC
	adds r0, r7, 0
	bl IsLeapYear
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080093BC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080093BC:
	mov r1, r8
	adds r0, r5, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080093D0: .4byte 0x0000016d
_080093D4: .4byte 0x081f4598
	thumb_func_end ConvertDateToDayCount

	thumb_func_start RtcGetDayCount
RtcGetDayCount: @ 80093D8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6]
	bl ConvertBcdToBinary
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6, 0x1]
	bl ConvertBcdToBinary
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6, 0x2]
	bl ConvertBcdToBinary
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl ConvertDateToDayCount
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end RtcGetDayCount

	thumb_func_start RtcInit
RtcInit: @ 8009414
	push {r4,r5,lr}
	ldr r5, _08009440 @ =0x03000458
	movs r0, 0
	strh r0, [r5]
	bl RtcDisableInterrupts
	bl SiiRtcUnprotect
	bl SiiRtcProbe
	ldr r4, _08009444 @ =0x0300046c
	strb r0, [r4]
	bl RtcRestoreInterrupts
	ldrb r4, [r4]
	movs r0, 0xF
	ands r0, r4
	cmp r0, 0
	bne _08009448
	movs r0, 0x1
	strh r0, [r5]
	b _08009466
	.align 2, 0
_08009440: .4byte 0x03000458
_08009444: .4byte 0x0300046c
_08009448:
	movs r0, 0xF0
	ands r0, r4
	cmp r0, 0
	beq _08009452
	movs r0, 0x2
_08009452:
	strh r0, [r5]
	ldr r4, _0800946C @ =0x03000460
	adds r0, r4, 0
	bl RtcGetRawInfo
	adds r0, r4, 0
	bl RtcCheckInfo
	ldr r1, _08009470 @ =0x03000458
	strh r0, [r1]
_08009466:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800946C: .4byte 0x03000460
_08009470: .4byte 0x03000458
	thumb_func_end RtcInit

	thumb_func_start RtcGetErrorStatus
RtcGetErrorStatus: @ 8009474
	ldr r0, _0800947C @ =0x03000458
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0800947C: .4byte 0x03000458
	thumb_func_end RtcGetErrorStatus

	thumb_func_start RtcGetInfo
RtcGetInfo: @ 8009480
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _0800949C @ =0x03000458
	ldrh r1, [r0]
	movs r0, 0xFF
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _080094A4
	adds r1, r2, 0
	ldr r0, _080094A0 @ =0x081f458c
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	b _080094AA
	.align 2, 0
_0800949C: .4byte 0x03000458
_080094A0: .4byte 0x081f458c
_080094A4:
	adds r0, r2, 0
	bl RtcGetRawInfo
_080094AA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetInfo

	thumb_func_start RtcGetDateTime
RtcGetDateTime: @ 80094B0
	push {r4,lr}
	adds r4, r0, 0
	bl RtcDisableInterrupts
	adds r0, r4, 0
	bl SiiRtcGetDateTime
	bl RtcRestoreInterrupts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetDateTime

	thumb_func_start RtcGetStatus
RtcGetStatus: @ 80094C8
	push {r4,lr}
	adds r4, r0, 0
	bl RtcDisableInterrupts
	adds r0, r4, 0
	bl SiiRtcGetStatus
	bl RtcRestoreInterrupts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetStatus

	thumb_func_start RtcGetRawInfo
RtcGetRawInfo: @ 80094E0
	push {r4,lr}
	adds r4, r0, 0
	bl RtcGetStatus
	adds r0, r4, 0
	bl RtcGetDateTime
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end RtcGetRawInfo

	thumb_func_start RtcCheckInfo
RtcCheckInfo: @ 80094F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	ldrb r1, [r7, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	asrs r4, r0, 31
	movs r0, 0x20
	ands r4, r0
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0800951A
	movs r0, 0x10
	orrs r4, r0
_0800951A:
	ldrb r0, [r7]
	bl ConvertBcdToBinary
	mov r8, r0
	cmp r0, 0xFF
	bne _0800952E
	movs r0, 0x40
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_0800952E:
	ldrb r0, [r7, 0x1]
	bl ConvertBcdToBinary
	adds r6, r0, 0
	cmp r6, 0xFF
	beq _08009542
	cmp r6, 0
	beq _08009542
	cmp r6, 0xC
	ble _0800954A
_08009542:
	movs r0, 0x80
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_0800954A:
	ldrb r0, [r7, 0x2]
	bl ConvertBcdToBinary
	adds r5, r0, 0
	cmp r5, 0xFF
	bne _08009562
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_08009562:
	cmp r6, 0x2
	bne _08009580
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	bl IsLeapYear
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800957C @ =0x081f4598
	ldr r1, [r1, 0x4]
	adds r0, r1
	b _0800958A
	.align 2, 0
_0800957C: .4byte 0x081f4598
_08009580:
	ldr r0, _080095F0 @ =0x081f4598
	subs r1, r6, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_0800958A:
	cmp r5, r0
	ble _0800959A
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_0800959A:
	ldrb r0, [r7, 0x4]
	bl ConvertBcdToBinary
	adds r5, r0, 0
	cmp r5, 0x18
	ble _080095B2
	movs r1, 0x80
	lsls r1, 2
	adds r0, r1, 0
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_080095B2:
	ldrb r0, [r7, 0x5]
	bl ConvertBcdToBinary
	adds r5, r0, 0
	cmp r5, 0x3C
	ble _080095CA
	movs r1, 0x80
	lsls r1, 3
	adds r0, r1, 0
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_080095CA:
	ldrb r0, [r7, 0x6]
	bl ConvertBcdToBinary
	adds r5, r0, 0
	cmp r5, 0x3C
	ble _080095E2
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	orrs r4, r0
	lsls r0, r4, 16
	lsrs r4, r0, 16
_080095E2:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080095F0: .4byte 0x081f4598
	thumb_func_end RtcCheckInfo

	thumb_func_start RtcReset
RtcReset: @ 80095F4
	push {lr}
	bl RtcDisableInterrupts
	bl SiiRtcReset
	bl RtcRestoreInterrupts
	pop {r0}
	bx r0
	thumb_func_end RtcReset

	thumb_func_start FormatDecimalTime
FormatDecimalTime: @ 8009608
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r4, 0xF0
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FormatDecimalTime

	thumb_func_start FormatHexTime
FormatHexTime: @ 8009640
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	movs r4, 0xF0
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FormatHexTime

	thumb_func_start FormatHexRtcTime
FormatHexRtcTime: @ 8009678
	push {lr}
	ldr r3, _0800968C @ =0x03000460
	ldrb r1, [r3, 0x4]
	ldrb r2, [r3, 0x5]
	ldrb r3, [r3, 0x6]
	bl FormatHexTime
	pop {r0}
	bx r0
	.align 2, 0
_0800968C: .4byte 0x03000460
	thumb_func_end FormatHexRtcTime

	thumb_func_start FormatDecimalDate
FormatDecimalDate: @ 8009690
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	movs r2, 0x2
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	movs r4, 0xAE
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FormatDecimalDate

	thumb_func_start FormatHexDate
FormatHexDate: @ 80096C8
	push {r4-r6,lr}
	adds r5, r2, 0
	adds r6, r3, 0
	movs r2, 0x2
	movs r3, 0x4
	bl ConvertIntToHexStringN
	movs r4, 0xAE
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FormatHexDate

	thumb_func_start RtcCalcTimeDifference
RtcCalcTimeDifference: @ 8009700
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	adds r6, r2, 0
	bl RtcGetDayCount
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5, 0x6]
	bl ConvertBcdToBinary
	ldrb r1, [r6, 0x4]
	subs r0, r1
	strb r0, [r7, 0x4]
	ldrb r0, [r5, 0x5]
	bl ConvertBcdToBinary
	ldrb r1, [r6, 0x3]
	subs r0, r1
	strb r0, [r7, 0x3]
	ldrb r0, [r5, 0x4]
	bl ConvertBcdToBinary
	ldrb r1, [r6, 0x2]
	subs r0, r1
	strb r0, [r7, 0x2]
	ldrh r0, [r6]
	subs r4, r0
	strh r4, [r7]
	ldrb r1, [r7, 0x4]
	movs r0, 0x4
	ldrsb r0, [r7, r0]
	cmp r0, 0
	bge _08009752
	adds r0, r1, 0
	adds r0, 0x3C
	strb r0, [r7, 0x4]
	ldrb r0, [r7, 0x3]
	subs r0, 0x1
	strb r0, [r7, 0x3]
_08009752:
	ldrb r1, [r7, 0x3]
	movs r0, 0x3
	ldrsb r0, [r7, r0]
	cmp r0, 0
	bge _08009768
	adds r0, r1, 0
	adds r0, 0x3C
	strb r0, [r7, 0x3]
	ldrb r0, [r7, 0x2]
	subs r0, 0x1
	strb r0, [r7, 0x2]
_08009768:
	ldrb r1, [r7, 0x2]
	movs r0, 0x2
	ldrsb r0, [r7, r0]
	cmp r0, 0
	bge _0800977E
	adds r0, r1, 0
	adds r0, 0x18
	strb r0, [r7, 0x2]
	ldrh r0, [r7]
	subs r0, 0x1
	strh r0, [r7]
_0800977E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end RtcCalcTimeDifference

	thumb_func_start RtcCalcLocalTime
RtcCalcLocalTime: @ 8009784
	push {r4,lr}
	ldr r4, _080097A0 @ =0x03000460
	adds r0, r4, 0
	bl RtcGetInfo
	ldr r1, _080097A4 @ =gLocalTime
	ldr r2, _080097A8 @ =0x02024f3c
	adds r0, r4, 0
	bl RtcCalcTimeDifference
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080097A0: .4byte 0x03000460
_080097A4: .4byte gLocalTime
_080097A8: .4byte 0x02024f3c
	thumb_func_end RtcCalcLocalTime

	thumb_func_start RtcInitLocalTimeOffset
RtcInitLocalTimeOffset: @ 80097AC
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r0, 0
	adds r1, r3, 0
	movs r3, 0
	bl RtcCalcLocalTimeOffset
	pop {r0}
	bx r0
	thumb_func_end RtcInitLocalTimeOffset

	thumb_func_start RtcCalcLocalTimeOffset
RtcCalcLocalTimeOffset: @ 80097C0
	push {r4,r5,lr}
	ldr r4, _080097E4 @ =gLocalTime
	strh r0, [r4]
	strb r1, [r4, 0x2]
	strb r2, [r4, 0x3]
	strb r3, [r4, 0x4]
	ldr r5, _080097E8 @ =0x03000460
	adds r0, r5, 0
	bl RtcGetInfo
	ldr r1, _080097EC @ =0x02024f3c
	adds r0, r5, 0
	adds r2, r4, 0
	bl RtcCalcTimeDifference
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080097E4: .4byte gLocalTime
_080097E8: .4byte 0x03000460
_080097EC: .4byte 0x02024f3c
	thumb_func_end RtcCalcLocalTimeOffset

	thumb_func_start CalcTimeDifference
CalcTimeDifference: @ 80097F0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrb r3, [r2, 0x4]
	ldrb r0, [r1, 0x4]
	subs r5, r3, r0
	strb r5, [r4, 0x4]
	ldrb r3, [r2, 0x3]
	ldrb r0, [r1, 0x3]
	subs r6, r3, r0
	strb r6, [r4, 0x3]
	ldrb r0, [r2, 0x2]
	ldrb r3, [r1, 0x2]
	subs r0, r3
	strb r0, [r4, 0x2]
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r4]
	lsls r0, r5, 24
	cmp r0, 0
	bge _08009824
	adds r0, r5, 0
	adds r0, 0x3C
	strb r0, [r4, 0x4]
	subs r0, r6, 0x1
	strb r0, [r4, 0x3]
_08009824:
	ldrb r1, [r4, 0x3]
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bge _0800983A
	adds r0, r1, 0
	adds r0, 0x3C
	strb r0, [r4, 0x3]
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	strb r0, [r4, 0x2]
_0800983A:
	ldrb r1, [r4, 0x2]
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bge _08009850
	adds r0, r1, 0
	adds r0, 0x18
	strb r0, [r4, 0x2]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
_08009850:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end CalcTimeDifference

	thumb_func_start RtcGetMinuteCount
RtcGetMinuteCount: @ 8009858
	push {r4,lr}
	ldr r4, _0800988C @ =0x03000460
	adds r0, r4, 0
	bl RtcGetInfo
	adds r0, r4, 0
	bl RtcGetDayCount
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 2
	adds r0, r1
	ldrb r4, [r4, 0x5]
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800988C: .4byte 0x03000460
	thumb_func_end RtcGetMinuteCount

	.align 2, 0 @ Don't pad with nop.
