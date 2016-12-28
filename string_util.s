	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start StringCopy10
StringCopy10: @ 8006A24
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0xA
	movs r3, 0
_08006A2C:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08006A40
	adds r0, r2, 0
	b _08006A50
_08006A40:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _08006A2C
	adds r0, r4, r3
	movs r1, 0xFF
	strb r1, [r0]
_08006A50:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringCopy10

	thumb_func_start StringGetEnd10
StringGetEnd10: @ 8006A58
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0xA
	movs r2, 0
_08006A60:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08006A6C
	adds r0, r1, 0
	b _08006A7C
_08006A6C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08006A60
	adds r0, r3, r2
	movs r1, 0xFF
	strb r1, [r0]
_08006A7C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringGetEnd10

	thumb_func_start StringCopy8
StringCopy8: @ 8006A84
	push {r4,lr}
	adds r4, r0, 0
	movs r3, 0
_08006A8A:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08006A9E
	adds r0, r2, 0
	b _08006AAA
_08006A9E:
	adds r3, 0x1
	cmp r3, 0x7
	ble _08006A8A
	adds r0, r4, r3
	movs r1, 0xFF
	strb r1, [r0]
_08006AAA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringCopy8

	thumb_func_start StringCopy
StringCopy: @ 8006AB0
	push {lr}
	adds r3, r0, 0
	b _08006ABC
_08006AB6:
	strb r2, [r3]
	adds r3, 0x1
	adds r1, 0x1
_08006ABC:
	ldrb r2, [r1]
	adds r0, r2, 0
	cmp r0, 0xFF
	bne _08006AB6
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringCopy

	thumb_func_start StringAppend
StringAppend: @ 8006AD0
	push {lr}
	adds r2, r0, 0
	b _08006AD8
_08006AD6:
	adds r2, 0x1
_08006AD8:
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _08006AD6
	adds r0, r2, 0
	bl StringCopy
	pop {r1}
	bx r1
	thumb_func_end StringAppend

	thumb_func_start StringCopyN
StringCopyN: @ 8006AE8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r3, 0
	adds r0, r5, 0
	cmp r3, r0
	bcs _08006B0E
	adds r2, r0, 0
_08006AFC:
	adds r1, r4, r3
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _08006AFC
_08006B0E:
	adds r0, r4, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringCopyN

	thumb_func_start StringAppendN
StringAppendN: @ 8006B18
	push {lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	b _08006B24
_08006B22:
	adds r3, 0x1
_08006B24:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08006B22
	adds r0, r3, 0
	bl StringCopyN
	pop {r1}
	bx r1
	thumb_func_end StringAppendN

	thumb_func_start StringLength
StringLength: @ 8006B34
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08006B6A
_08006B40:
	adds r0, r5, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0xFC
	bne _08006B62
	adds r0, r4, r5
	ldrb r0, [r0]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
_08006B62:
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08006B40
_08006B6A:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringLength

	thumb_func_start de_sub_8006CA8
de_sub_8006CA8: @ 8006CA8
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	cmp r2, r1
	bge _08006CC6
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _08006CC6
_08006CB8:
	adds r2, 0x1
	cmp r2, r1
	bge _08006CC6
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08006CB8
_08006CC6:
	cmp r2, r1
	bne _08006CCC
	movs r2, 0
_08006CCC:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end de_sub_8006CA8

	thumb_func_start StringCompare
StringCompare: @ 8006B74
	push {lr}
	adds r2, r0, 0
	b _08006B86
_08006B7A:
	cmp r0, 0xFF
	bne _08006B82
	movs r0, 0
	b _08006B94
_08006B82:
	adds r2, 0x1
	adds r1, 0x1
_08006B86:
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	beq _08006B7A
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r1
_08006B94:
	pop {r1}
	bx r1
	thumb_func_end StringCompare

	thumb_func_start StringCompareN
StringCompareN: @ 8006B98
	push {r4,lr}
	adds r3, r0, 0
	b _08006BB0
_08006B9E:
	cmp r0, 0xFF
	beq _08006BAC
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _08006BB0
_08006BAC:
	movs r0, 0
	b _08006BBE
_08006BB0:
	ldrb r0, [r3]
	ldrb r4, [r1]
	cmp r0, r4
	beq _08006B9E
	ldrb r0, [r3]
	ldrb r1, [r1]
	subs r0, r1
_08006BBE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringCompareN

	thumb_func_start ConvertIntToDecimalStringN
ConvertIntToDecimalStringN: @ 8006BC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r3, 24
	ldr r0, _08006C14 @ =0x081f4240
	lsrs r3, 22
	subs r3, 0x4
	adds r3, r0
	ldr r0, [r3]
	movs r7, 0
	cmp r2, 0x1
	bne _08006BE2
	movs r7, 0x2
_08006BE2:
	cmp r2, 0x2
	bne _08006BE8
	movs r7, 0x1
_08006BE8:
	adds r5, r0, 0
	cmp r5, 0
	ble _08006C54
	ldr r0, _08006C18 @ =0x081f422f
	mov r8, r0
_08006BF2:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r5, 0
	muls r0, r2
	subs r1, r6, r0
	cmp r7, 0x1
	bne _08006C1C
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bls _08006C2E
	b _08006C36
	.align 2, 0
_08006C14: .4byte 0x081f4240
_08006C18: .4byte 0x081f422f
_08006C1C:
	cmp r2, 0
	bne _08006C24
	cmp r5, 0x1
	bne _08006C3C
_08006C24:
	movs r7, 0x1
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bhi _08006C36
_08006C2E:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08006C38
_08006C36:
	movs r0, 0xAC
_08006C38:
	strb r0, [r3]
	b _08006C44
_08006C3C:
	cmp r7, 0x2
	bne _08006C44
	strb r2, [r4]
	adds r4, 0x1
_08006C44:
	adds r6, r1, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	cmp r5, 0
	bgt _08006BF2
_08006C54:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ConvertIntToDecimalStringN

	thumb_func_start ConvertIntToDecimalStringN_DigitWidth6
ConvertIntToDecimalStringN_DigitWidth6: @ 8006C64
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r3, 24
	ldr r0, _08006CC4 @ =0x081f4240
	lsrs r3, 22
	subs r3, 0x4
	adds r3, r0
	ldr r1, [r3]
	movs r0, 0xFC
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0x14
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0x6
	strb r0, [r4]
	adds r4, 0x1
	movs r7, 0
	cmp r2, 0x1
	bne _08006C94
	movs r7, 0x2
_08006C94:
	cmp r2, 0x2
	bne _08006C9A
	movs r7, 0x1
_08006C9A:
	adds r5, r1, 0
	cmp r5, 0
	ble _08006D04
	ldr r0, _08006CC8 @ =0x081f422f
	mov r8, r0
_08006CA4:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r5, 0
	muls r0, r2
	subs r1, r6, r0
	cmp r7, 0x1
	bne _08006CCC
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bls _08006CDE
	b _08006CE6
	.align 2, 0
_08006CC4: .4byte 0x081f4240
_08006CC8: .4byte 0x081f422f
_08006CCC:
	cmp r2, 0
	bne _08006CD4
	cmp r5, 0x1
	bne _08006CEC
_08006CD4:
	movs r7, 0x1
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bhi _08006CE6
_08006CDE:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08006CE8
_08006CE6:
	movs r0, 0xAC
_08006CE8:
	strb r0, [r3]
	b _08006CF4
_08006CEC:
	cmp r7, 0x2
	bne _08006CF4
	strb r2, [r4]
	adds r4, 0x1
_08006CF4:
	adds r6, r1, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	cmp r5, 0
	bgt _08006CA4
_08006D04:
	movs r0, 0xFC
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0x14
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0
	strb r0, [r4]
	adds r4, 0x1
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ConvertIntToDecimalStringN_DigitWidth6

	thumb_func_start ConvertIntToHexStringN
ConvertIntToHexStringN: @ 8006D28
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x1
	movs r0, 0x1
	cmp r1, r3
	bcs _08006D4C
_08006D40:
	lsls r1, 4
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcc _08006D40
_08006D4C:
	movs r3, 0
	cmp r2, 0x1
	bne _08006D54
	movs r3, 0x2
_08006D54:
	cmp r2, 0x2
	bne _08006D5A
	movs r3, 0x1
_08006D5A:
	adds r5, r1, 0
	cmp r5, 0
	ble _08006DC8
	ldr r0, _08006D8C @ =0x081f422f
	mov r8, r0
_08006D64:
	adds r0, r7, 0
	adds r1, r5, 0
	str r3, [sp]
	bl __divsi3
	adds r4, r0, 0
	adds r0, r7, 0
	adds r1, r5, 0
	bl __modsi3
	adds r1, r0, 0
	ldr r3, [sp]
	cmp r3, 0x1
	bne _08006D90
	adds r2, r6, 0
	adds r6, 0x1
	cmp r4, 0xF
	bls _08006DA2
	b _08006DAA
	.align 2, 0
_08006D8C: .4byte 0x081f422f
_08006D90:
	cmp r4, 0
	bne _08006D98
	cmp r5, 0x1
	bne _08006DB0
_08006D98:
	movs r3, 0x1
	adds r2, r6, 0
	adds r6, 0x1
	cmp r4, 0xF
	bhi _08006DAA
_08006DA2:
	mov r7, r8
	adds r0, r4, r7
	ldrb r0, [r0]
	b _08006DAC
_08006DAA:
	movs r0, 0xAC
_08006DAC:
	strb r0, [r2]
	b _08006DB8
_08006DB0:
	cmp r3, 0x2
	bne _08006DB8
	strb r4, [r6]
	adds r6, 0x1
_08006DB8:
	adds r7, r1, 0
	adds r0, r5, 0
	cmp r5, 0
	bge _08006DC2
	adds r0, 0xF
_08006DC2:
	asrs r5, r0, 4
	cmp r5, 0
	bgt _08006D64
_08006DC8:
	movs r0, 0xFF
	strb r0, [r6]
	adds r0, r6, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ConvertIntToHexStringN

	thumb_func_start ConvertIntToDecimalString
ConvertIntToDecimalString: @ 8006DDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r0, 0
	adds r5, r1, 0
	movs r6, 0
	ldr r0, _08006E40 @ =0x081f422f
	mov r8, r0
_08006DEE:
	mov r2, sp
	adds r4, r2, r6
	adds r0, r5, 0
	movs r1, 0xA
	bl __modsi3
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r4]
	adds r6, 0x1
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	cmp r5, 0
	bne _08006DEE
	subs r6, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	beq _08006E2C
	adds r1, r0, 0
_08006E1C:
	mov r2, sp
	adds r0, r2, r6
	ldrb r0, [r0]
	strb r0, [r7]
	adds r7, 0x1
	subs r6, 0x1
	cmp r6, r1
	bne _08006E1C
_08006E2C:
	movs r0, 0xFF
	strb r0, [r7]
	adds r0, r7, 0
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006E40: .4byte 0x081f422f
	thumb_func_end ConvertIntToDecimalString

	thumb_func_start StringExpandPlaceholders
StringExpandPlaceholders: @ 8006E44
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
_08006E4A:
	ldrb r2, [r6]
	adds r6, 0x1
	adds r0, r2, 0
	subs r0, 0xFA
	cmp r0, 0x5
	bhi _08006EB0
	lsls r0, 2
	ldr r1, _08006E60 @ =_08006FC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006E60: .4byte _08006FC4
	.align 2, 0
_08006E64:
	.4byte _08006EB0
	.4byte _08006EB0
	.4byte _08006E90
	.4byte _08006E7C
	.4byte _08006EB0
	.4byte _08006EB6
_08006E7C:
	ldrb r0, [r6]
	adds r6, 0x1
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringExpandPlaceholders
	adds r5, r0, 0
	b _08006E4A
_08006E90:
	strb r2, [r5]
	adds r5, 0x1
	ldrb r0, [r6]
	bl GetExtCtrlCodeLength
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl memcpy
	adds r5, r4
	adds r6, r4
	b _08006E4A
_08006EB0:
	strb r2, [r5]
	adds r5, 0x1
	b _08006E4A
_08006EB6:
	movs r0, 0xFF
	strb r0, [r5]
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringExpandPlaceholders

	thumb_func_start StringBraille
StringBraille: @ 8006EC4
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _08006EFC @ =0x081f4268
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _08006F00 @ =0x081f426c
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	adds r0, r5, 0
	mov r1, sp
_08006EE6:
	bl StringCopy
	adds r5, r0, 0
_08006EEC:
	ldrb r0, [r6]
	adds r6, 0x1
	cmp r0, 0xFE
	beq _08006F04
	cmp r0, 0xFF
	bne _08006F0A
	b _08006F16
	.align 2, 0
_08006EFC: .4byte 0x081f4268
_08006F00: .4byte 0x081f426c
_08006F04:
	adds r0, r5, 0
	adds r1, r4, 0
	b _08006EE6
_08006F0A:
	strb r0, [r5]
	adds r5, 0x1
	adds r0, 0x40
	strb r0, [r5]
	adds r5, 0x1
	b _08006EEC
_08006F16:
	strb r0, [r5]
	adds r0, r5, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringBraille

	thumb_func_start ExpandPlaceholder_UnknownStringVar
ExpandPlaceholder_UnknownStringVar: @ 8007084
	ldr r0, _08007088 @ =gUnknownStringVar
	bx lr
	.align 2, 0
_08007088: .4byte gUnknownStringVar
	thumb_func_end ExpandPlaceholder_UnknownStringVar

	thumb_func_start ExpandPlaceholder_PlayerName
ExpandPlaceholder_PlayerName: @ 800708C
	ldr r0, _08007090 @ =gSaveBlock2
	bx lr
	.align 2, 0
_08007090: .4byte gSaveBlock2
	thumb_func_end ExpandPlaceholder_PlayerName

	thumb_func_start ExpandPlaceholder_StringVar1
ExpandPlaceholder_StringVar1: @ 8007094
	ldr r0, _08007098 @ =gStringVar1
	bx lr
	.align 2, 0
_08007098: .4byte gStringVar1
	thumb_func_end ExpandPlaceholder_StringVar1

	thumb_func_start ExpandPlaceholder_StringVar2
ExpandPlaceholder_StringVar2: @ 800709C
	ldr r0, _080070A0 @ =gStringVar2
	bx lr
	.align 2, 0
_080070A0: .4byte gStringVar2
	thumb_func_end ExpandPlaceholder_StringVar2

	thumb_func_start ExpandPlaceholder_StringVar3
ExpandPlaceholder_StringVar3: @ 80070A4
	ldr r0, _080070A8 @ =gStringVar3
	bx lr
	.align 2, 0
_080070A8: .4byte gStringVar3
	thumb_func_end ExpandPlaceholder_StringVar3

	thumb_func_start ExpandPlaceholder_KunChan
ExpandPlaceholder_KunChan: @ 80070AC
	push {lr}
	ldr r0, _080070BC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080070C4
	ldr r0, _080070C0 @ =gExpandedPlaceholder_Chan
	b _080070C6
	.align 2, 0
_080070BC: .4byte gSaveBlock2
_080070C0: .4byte gExpandedPlaceholder_Chan
_080070C4:
	ldr r0, _080070CC @ =gExpandedPlaceholder_Kun
_080070C6:
	pop {r1}
	bx r1
	.align 2, 0
_080070CC: .4byte gExpandedPlaceholder_Kun
	thumb_func_end ExpandPlaceholder_KunChan

	thumb_func_start ExpandPlaceholder_RivalName
ExpandPlaceholder_RivalName: @ 80070D0
	push {lr}
	ldr r0, _080070E0 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080070E8
	ldr r0, _080070E4 @ =gExpandedPlaceholder_Brendan
	b _080070EA
	.align 2, 0
_080070E0: .4byte gSaveBlock2
_080070E4: .4byte gExpandedPlaceholder_Brendan
_080070E8:
	ldr r0, _080070F0 @ =gExpandedPlaceholder_May
_080070EA:
	pop {r1}
	bx r1
	.align 2, 0
_080070F0: .4byte gExpandedPlaceholder_May
	thumb_func_end ExpandPlaceholder_RivalName

	thumb_func_start ExpandPlaceholder_Version
ExpandPlaceholder_Version: @ 80070F4
	ldr r0, _080070F8 @ =gExpandedPlaceholder_Ruby
	bx lr
	.align 2, 0
_080070F8: .4byte gExpandedPlaceholder_Ruby
	thumb_func_end ExpandPlaceholder_Version

	thumb_func_start ExpandPlaceholder_EvilTeam
ExpandPlaceholder_EvilTeam: @ 80070FC
	ldr r0, _08007100 @ =gExpandedPlaceholder_Magma
	bx lr
	.align 2, 0
_08007100: .4byte gExpandedPlaceholder_Magma
	thumb_func_end ExpandPlaceholder_EvilTeam

	thumb_func_start ExpandPlaceholder_GoodTeam
ExpandPlaceholder_GoodTeam: @ 8007104
	ldr r0, _08007108 @ =gExpandedPlaceholder_Aqua
	bx lr
	.align 2, 0
_08007108: .4byte gExpandedPlaceholder_Aqua
	thumb_func_end ExpandPlaceholder_GoodTeam

	thumb_func_start ExpandPlaceholder_EvilLeader
ExpandPlaceholder_EvilLeader: @ 800710C
	ldr r0, _08007110 @ =gExpandedPlaceholder_Maxie
	bx lr
	.align 2, 0
_08007110: .4byte gExpandedPlaceholder_Maxie
	thumb_func_end ExpandPlaceholder_EvilLeader

	thumb_func_start ExpandPlaceholder_GoodLeader
ExpandPlaceholder_GoodLeader: @ 8007114
	ldr r0, _08007118 @ =gExpandedPlaceholder_Archie
	bx lr
	.align 2, 0
_08007118: .4byte gExpandedPlaceholder_Archie
	thumb_func_end ExpandPlaceholder_GoodLeader

	thumb_func_start ExpandPlaceholder_EvilLegendary
ExpandPlaceholder_EvilLegendary: @ 800711C
	ldr r0, _08007120 @ =gExpandedPlaceholder_Groudon
	bx lr
	.align 2, 0
_08007120: .4byte gExpandedPlaceholder_Groudon
	thumb_func_end ExpandPlaceholder_EvilLegendary

	thumb_func_start ExpandPlaceholder_GoodLegendary
ExpandPlaceholder_GoodLegendary: @ 8007124
	ldr r0, _08007128 @ =gExpandedPlaceholder_Kyogre
	bx lr
	.align 2, 0
_08007128: .4byte gExpandedPlaceholder_Kyogre
	thumb_func_end ExpandPlaceholder_GoodLegendary

	thumb_func_start GetExpandedPlaceholder
GetExpandedPlaceholder: @ 8006FCC
	push {lr}
	cmp r0, 0xD
	bhi _08006FE4
	ldr r1, _08006FE0 @ =0x081f4274
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08006FE6
	.align 2, 0
_08006FE0: .4byte 0x081f4274
_08006FE4:
	ldr r0, _08006FEC @ =gExpandedPlaceholder_Empty
_08006FE6:
	pop {r1}
	bx r1
	.align 2, 0
_08006FEC: .4byte gExpandedPlaceholder_Empty
	thumb_func_end GetExpandedPlaceholder

	thumb_func_start StringFill
StringFill: @ 8006FF0
	push {lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0
	cmp r0, r2
	bcs _08007010
_08007002:
	strb r1, [r3]
	adds r3, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r2
	bcc _08007002
_08007010:
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringFill

	thumb_func_start StringCopyPadded
StringCopyPadded: @ 800701C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	b _0800703C
_0800702C:
	strb r1, [r4]
	adds r5, 0x1
	adds r4, 0x1
	cmp r3, 0
	beq _0800703C
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_0800703C:
	ldrb r1, [r5]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _0800702C
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _0800706C @ =0x0000ffff
	cmp r3, r0
	beq _08007060
	adds r1, r0, 0
_08007052:
	strb r2, [r4]
	adds r4, 0x1
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bne _08007052
_08007060:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800706C: .4byte 0x0000ffff
	thumb_func_end StringCopyPadded

	thumb_func_start StringFillWithTerminator
StringFillWithTerminator: @ 8007070
	push {lr}
	lsls r2, r1, 16
	lsrs r2, 16
	movs r1, 0xFF
	bl StringFill
	pop {r1}
	bx r1
	thumb_func_end StringFillWithTerminator

	.align 2, 0 @ Don't pad with nop.
