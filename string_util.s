	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start StringCopy10
StringCopy10: @ 8006B58
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0xA
	movs r3, 0
_08006B60:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08006B74
	adds r0, r2, 0
	b _08006B84
_08006B74:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _08006B60
	adds r0, r4, r3
	movs r1, 0xFF
	strb r1, [r0]
_08006B84:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end StringCopy10

	thumb_func_start StringGetEnd10
StringGetEnd10: @ 8006B8C
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0xA
	movs r2, 0
_08006B94:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08006BA0
	adds r0, r1, 0
	b _08006BB0
_08006BA0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08006B94
	adds r0, r3, r2
	movs r1, 0xFF
	strb r1, [r0]
_08006BB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringGetEnd10

	thumb_func_start StringCopy8
StringCopy8: @ 8006BB8
	push {r4,lr}
	adds r4, r0, 0
	movs r3, 0
_08006BBE:
	adds r2, r4, r3
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08006BD2
	adds r0, r2, 0
	b _08006BDE
_08006BD2:
	adds r3, 0x1
	cmp r3, 0x7
	ble _08006BBE
	adds r0, r4, r3
	movs r1, 0xFF
	strb r1, [r0]
_08006BDE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringCopy8

	thumb_func_start StringCopy
StringCopy: @ 8006BE4
	push {lr}
	adds r3, r0, 0
	b _08006BF0
_08006BEA:
	strb r2, [r3]
	adds r3, 0x1
	adds r1, 0x1
_08006BF0:
	ldrb r2, [r1]
	adds r0, r2, 0
	cmp r0, 0xFF
	bne _08006BEA
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringCopy

	thumb_func_start StringAppend
StringAppend: @ 8006C04
	push {lr}
	adds r2, r0, 0
	b _08006C0C
_08006C0A:
	adds r2, 0x1
_08006C0C:
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _08006C0A
	adds r0, r2, 0
	bl StringCopy
	pop {r1}
	bx r1
	thumb_func_end StringAppend

	thumb_func_start StringCopyN
StringCopyN: @ 8006C1C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r3, 0
	adds r0, r5, 0
	cmp r3, r0
	bcs _08006C42
	adds r2, r0, 0
_08006C30:
	adds r1, r4, r3
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _08006C30
_08006C42:
	adds r0, r4, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringCopyN

	thumb_func_start StringAppendN
StringAppendN: @ 8006C4C
	push {lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	b _08006C58
_08006C56:
	adds r3, 0x1
_08006C58:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _08006C56
	adds r0, r3, 0
	bl StringCopyN
	pop {r1}
	bx r1
	thumb_func_end StringAppendN

	thumb_func_start StringLength
StringLength: @ 8006C68
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08006C9E
_08006C74:
	adds r0, r5, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0xFC
	bne _08006C96
	adds r0, r4, r5
	ldrb r0, [r0]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
_08006C96:
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08006C74
_08006C9E:
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
StringCompare: @ 8006CD4
	push {lr}
	adds r2, r0, 0
	b _08006CE6
_08006CDA:
	cmp r0, 0xFF
	bne _08006CE2
	movs r0, 0
	b _08006CF4
_08006CE2:
	adds r2, 0x1
	adds r1, 0x1
_08006CE6:
	ldrb r0, [r2]
	ldrb r3, [r1]
	cmp r0, r3
	beq _08006CDA
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r1
_08006CF4:
	pop {r1}
	bx r1
	thumb_func_end StringCompare

	thumb_func_start StringCompareN
StringCompareN: @ 8006CF8
	push {r4,lr}
	adds r3, r0, 0
	b _08006D10
_08006CFE:
	cmp r0, 0xFF
	beq _08006D0C
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _08006D10
_08006D0C:
	movs r0, 0
	b _08006D1E
_08006D10:
	ldrb r0, [r3]
	ldrb r4, [r1]
	cmp r0, r4
	beq _08006CFE
	ldrb r0, [r3]
	ldrb r1, [r1]
	subs r0, r1
_08006D1E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StringCompareN

	thumb_func_start ConvertIntToDecimalStringN
ConvertIntToDecimalStringN: @ 8006D24
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r3, 24
	ldr r0, _08006D74 @ =0x081f4240
	lsrs r3, 22
	subs r3, 0x4
	adds r3, r0
	ldr r0, [r3]
	movs r7, 0
	cmp r2, 0x1
	bne _08006D42
	movs r7, 0x2
_08006D42:
	cmp r2, 0x2
	bne _08006D48
	movs r7, 0x1
_08006D48:
	adds r5, r0, 0
	cmp r5, 0
	ble _08006DB4
	ldr r0, _08006D78 @ =0x081f422f
	mov r8, r0
_08006D52:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r5, 0
	muls r0, r2
	subs r1, r6, r0
	cmp r7, 0x1
	bne _08006D7C
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bls _08006D8E
	b _08006D96
	.align 2, 0
_08006D74: .4byte 0x081f4240
_08006D78: .4byte 0x081f422f
_08006D7C:
	cmp r2, 0
	bne _08006D84
	cmp r5, 0x1
	bne _08006D9C
_08006D84:
	movs r7, 0x1
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bhi _08006D96
_08006D8E:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08006D98
_08006D96:
	movs r0, 0xAC
_08006D98:
	strb r0, [r3]
	b _08006DA4
_08006D9C:
	cmp r7, 0x2
	bne _08006DA4
	strb r2, [r4]
	adds r4, 0x1
_08006DA4:
	adds r6, r1, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	cmp r5, 0
	bgt _08006D52
_08006DB4:
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
ConvertIntToDecimalStringN_DigitWidth6: @ 8006DC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r3, 24
	ldr r0, _08006E24 @ =0x081f4240
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
	bne _08006DF4
	movs r7, 0x2
_08006DF4:
	cmp r2, 0x2
	bne _08006DFA
	movs r7, 0x1
_08006DFA:
	adds r5, r1, 0
	cmp r5, 0
	ble _08006E64
	ldr r0, _08006E28 @ =0x081f422f
	mov r8, r0
_08006E04:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __divsi3
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r5, 0
	muls r0, r2
	subs r1, r6, r0
	cmp r7, 0x1
	bne _08006E2C
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bls _08006E3E
	b _08006E46
	.align 2, 0
_08006E24: .4byte 0x081f4240
_08006E28: .4byte 0x081f422f
_08006E2C:
	cmp r2, 0
	bne _08006E34
	cmp r5, 0x1
	bne _08006E4C
_08006E34:
	movs r7, 0x1
	adds r3, r4, 0
	adds r4, 0x1
	cmp r2, 0x9
	bhi _08006E46
_08006E3E:
	mov r6, r8
	adds r0, r2, r6
	ldrb r0, [r0]
	b _08006E48
_08006E46:
	movs r0, 0xAC
_08006E48:
	strb r0, [r3]
	b _08006E54
_08006E4C:
	cmp r7, 0x2
	bne _08006E54
	strb r2, [r4]
	adds r4, 0x1
_08006E54:
	adds r6, r1, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	cmp r5, 0
	bgt _08006E04
_08006E64:
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
ConvertIntToHexStringN: @ 8006E88
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
	bcs _08006EAC
_08006EA0:
	lsls r1, 4
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcc _08006EA0
_08006EAC:
	movs r3, 0
	cmp r2, 0x1
	bne _08006EB4
	movs r3, 0x2
_08006EB4:
	cmp r2, 0x2
	bne _08006EBA
	movs r3, 0x1
_08006EBA:
	adds r5, r1, 0
	cmp r5, 0
	ble _08006F28
	ldr r0, _08006EEC @ =0x081f422f
	mov r8, r0
_08006EC4:
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
	bne _08006EF0
	adds r2, r6, 0
	adds r6, 0x1
	cmp r4, 0xF
	bls _08006F02
	b _08006F0A
	.align 2, 0
_08006EEC: .4byte 0x081f422f
_08006EF0:
	cmp r4, 0
	bne _08006EF8
	cmp r5, 0x1
	bne _08006F10
_08006EF8:
	movs r3, 0x1
	adds r2, r6, 0
	adds r6, 0x1
	cmp r4, 0xF
	bhi _08006F0A
_08006F02:
	mov r7, r8
	adds r0, r4, r7
	ldrb r0, [r0]
	b _08006F0C
_08006F0A:
	movs r0, 0xAC
_08006F0C:
	strb r0, [r2]
	b _08006F18
_08006F10:
	cmp r3, 0x2
	bne _08006F18
	strb r4, [r6]
	adds r6, 0x1
_08006F18:
	adds r7, r1, 0
	adds r0, r5, 0
	cmp r5, 0
	bge _08006F22
	adds r0, 0xF
_08006F22:
	asrs r5, r0, 4
	cmp r5, 0
	bgt _08006EC4
_08006F28:
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
ConvertIntToDecimalString: @ 8006F3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r0, 0
	adds r5, r1, 0
	movs r6, 0
	ldr r0, _08006FA0 @ =0x081f422f
	mov r8, r0
_08006F4E:
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
	bne _08006F4E
	subs r6, 0x1
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	beq _08006F8C
	adds r1, r0, 0
_08006F7C:
	mov r2, sp
	adds r0, r2, r6
	ldrb r0, [r0]
	strb r0, [r7]
	adds r7, 0x1
	subs r6, 0x1
	cmp r6, r1
	bne _08006F7C
_08006F8C:
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
_08006FA0: .4byte 0x081f422f
	thumb_func_end ConvertIntToDecimalString

	thumb_func_start StringExpandPlaceholders
StringExpandPlaceholders: @ 8006FA4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
_08006FAA:
	ldrb r2, [r6]
	adds r6, 0x1
	adds r0, r2, 0
	subs r0, 0xFA
	cmp r0, 0x5
	bhi _08007010
	lsls r0, 2
	ldr r1, _08006FC0 @ =_08006FC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006FC0: .4byte _08006FC4
	.align 2, 0
_08006FC4:
	.4byte _08007010
	.4byte _08007010
	.4byte _08006FF0
	.4byte _08006FDC
	.4byte _08007010
	.4byte _08007016
_08006FDC:
	ldrb r0, [r6]
	adds r6, 0x1
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringExpandPlaceholders
	adds r5, r0, 0
	b _08006FAA
_08006FF0:
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
	b _08006FAA
_08007010:
	strb r2, [r5]
	adds r5, 0x1
	b _08006FAA
_08007016:
	movs r0, 0xFF
	strb r0, [r5]
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringExpandPlaceholders

	thumb_func_start StringBraille
StringBraille: @ 8007024
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0800705C @ =0x081f4268
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _08007060 @ =0x081f426c
	adds r0, r4, 0
	movs r2, 0x5
	bl memcpy
	adds r0, r5, 0
	mov r1, sp
_08007046:
	bl StringCopy
	adds r5, r0, 0
_0800704C:
	ldrb r0, [r6]
	adds r6, 0x1
	cmp r0, 0xFE
	beq _08007064
	cmp r0, 0xFF
	bne _0800706A
	b _08007076
	.align 2, 0
_0800705C: .4byte 0x081f4268
_08007060: .4byte 0x081f426c
_08007064:
	adds r0, r5, 0
	adds r1, r4, 0
	b _08007046
_0800706A:
	strb r0, [r5]
	adds r5, 0x1
	adds r0, 0x40
	strb r0, [r5]
	adds r5, 0x1
	b _0800704C
_08007076:
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
GetExpandedPlaceholder: @ 800712C
	push {lr}
	cmp r0, 0xD
	bhi _08007144
	ldr r1, _08007140 @ =0x081f4274
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08007146
	.align 2, 0
_08007140: .4byte 0x081f4274
_08007144:
	ldr r0, _0800714C @ =gExpandedPlaceholder_Empty
_08007146:
	pop {r1}
	bx r1
	.align 2, 0
_0800714C: .4byte gExpandedPlaceholder_Empty
	thumb_func_end GetExpandedPlaceholder

	thumb_func_start StringFill
StringFill: @ 8007150
	push {lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0
	cmp r0, r2
	bcs _08007170
_08007162:
	strb r1, [r3]
	adds r3, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r2
	bcc _08007162
_08007170:
	movs r0, 0xFF
	strb r0, [r3]
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end StringFill

	thumb_func_start StringCopyPadded
StringCopyPadded: @ 800717C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	b _0800719C
_0800718C:
	strb r1, [r4]
	adds r5, 0x1
	adds r4, 0x1
	cmp r3, 0
	beq _0800719C
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_0800719C:
	ldrb r1, [r5]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _0800718C
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080071CC @ =0x0000ffff
	cmp r3, r0
	beq _080071C0
	adds r1, r0, 0
_080071B2:
	strb r2, [r4]
	adds r4, 0x1
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bne _080071B2
_080071C0:
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080071CC: .4byte 0x0000ffff
	thumb_func_end StringCopyPadded

	thumb_func_start StringFillWithTerminator
StringFillWithTerminator: @ 80071D0
	push {lr}
	lsls r2, r1, 16
	lsrs r2, 16
	movs r1, 0xFF
	bl StringFill
	pop {r1}
	bx r1
	thumb_func_end StringFillWithTerminator

	.align 2, 0 @ Don't pad with nop.
