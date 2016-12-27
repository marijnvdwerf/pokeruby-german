	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start AreMovesContestCombo
AreMovesContestCombo: @ 80B7EB8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsls r1, 16
	ldr r2, _080B7F0C @ =gContestMoves
	lsrs r0, 13
	adds r0, r2
	ldrb r4, [r0, 0x2]
	mov r3, sp
	lsrs r1, 13
	adds r1, r2
	ldrb r0, [r1, 0x3]
	strb r0, [r3]
	mov r2, sp
	ldrb r0, [r1, 0x4]
	strb r0, [r2, 0x1]
	ldrb r0, [r1, 0x5]
	strb r0, [r2, 0x2]
	mov r0, sp
	ldrb r1, [r1, 0x6]
	strb r1, [r0, 0x3]
	cmp r4, 0
	beq _080B7F14
	mov r0, sp
	ldrb r0, [r0]
	cmp r4, r0
	beq _080B7F02
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r4, r0
	beq _080B7F02
	mov r0, sp
	ldrb r0, [r0, 0x2]
	cmp r4, r0
	beq _080B7F02
	cmp r4, r1
	bne _080B7F14
_080B7F02:
	ldr r0, _080B7F10 @ =gComboStarterLookupTable
	adds r0, r4, r0
	ldrb r0, [r0]
	b _080B7F16
	.align 2, 0
_080B7F0C: .4byte gContestMoves
_080B7F10: .4byte gComboStarterLookupTable
_080B7F14:
	movs r0, 0
_080B7F16:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AreMovesContestCombo

	thumb_func_start ContestEffect_00
ContestEffect_00: @ 80B7F20
	bx lr
	thumb_func_end ContestEffect_00

	thumb_func_start ContestEffect_01
ContestEffect_01: @ 80B7F24
	push {lr}
	ldr r3, _080B7F4C @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	movs r1, 0
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7F4C: .4byte 0x020192d0
	thumb_func_end ContestEffect_01

	thumb_func_start ContestEffect_02
ContestEffect_02: @ 80B7F50
	push {lr}
	ldr r3, _080B7F78 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r3, 0x11]
	movs r1, 0x1
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7F78: .4byte 0x020192d0
	thumb_func_end ContestEffect_02

	thumb_func_start ContestEffect_03
ContestEffect_03: @ 80B7F7C
	push {r4,lr}
	ldr r3, _080B7FC4 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, r3, 0
	subs r4, 0x70
	adds r0, r4
	ldrb r1, [r0, 0x10]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x15]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x15]
	ldrb r0, [r3, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0xB]
	movs r0, 0x71
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7FC4: .4byte 0x020192d0
	thumb_func_end ContestEffect_03

	thumb_func_start ContestEffect_04
ContestEffect_04: @ 80B7FC8
	push {lr}
	ldr r2, _080B7FEC @ =0x020192d0
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x70
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0, 0x12]
	ldrb r0, [r2, 0x11]
	movs r1, 0x2
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B7FEC: .4byte 0x020192d0
	thumb_func_end ContestEffect_04

	thumb_func_start ContestEffect_05
ContestEffect_05: @ 80B7FF0
	push {lr}
	ldr r3, _080B8018 @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	movs r1, 0x3
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8018: .4byte 0x020192d0
	thumb_func_end ContestEffect_05

	thumb_func_start ContestEffect_06
ContestEffect_06: @ 80B801C
	push {lr}
	ldr r2, _080B8040 @ =0x020192d0
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x70
	adds r0, r1
	movs r1, 0x14
	strb r1, [r0, 0xF]
	ldrb r0, [r2, 0x11]
	movs r1, 0x4
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8040: .4byte 0x020192d0
	thumb_func_end ContestEffect_06

	thumb_func_start ContestEffect_07
ContestEffect_07: @ 80B8044
	push {lr}
	ldr r3, _080B806C @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r3, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r3, 0x11]
	movs r1, 0x5
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B806C: .4byte 0x020192d0
	thumb_func_end ContestEffect_07

	thumb_func_start ContestEffect_08
ContestEffect_08: @ 80B8070
	push {r4,lr}
	movs r2, 0
	ldr r3, _080B80CC @ =0x020192d0
	ldrb r0, [r3, 0x11]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	beq _080B80AE
	subs r0, 0x1
	ldrb r4, [r3]
	cmp r0, r4
	beq _080B809E
	adds r4, r3, 0
	adds r3, r1, 0
_080B808C:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _080B809E
	ldrb r0, [r3]
	subs r0, 0x1
	adds r1, r2, r4
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B808C
_080B809E:
	ldr r1, _080B80CC @ =0x020192d0
	strb r2, [r1, 0x8]
	movs r0, 0xFF
	strb r0, [r1, 0x9]
	bl sub_80B9120
	lsls r0, 24
	lsrs r2, r0, 24
_080B80AE:
	cmp r2, 0
	bne _080B80BC
	ldr r0, _080B80CC @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B80BC:
	ldr r0, _080B80CC @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B80CC: .4byte 0x020192d0
	thumb_func_end ContestEffect_08

	thumb_func_start ContestEffect_09
ContestEffect_09: @ 80B80D0
	push {r4-r6,lr}
	movs r2, 0
	ldr r1, _080B8130 @ =0x020192d0
	ldrb r0, [r1, 0x11]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080B8110
	movs r3, 0
	adds r5, r1, 0
	adds r6, r5, 0
	adds r6, 0x8
_080B80E8:
	adds r1, r2, r5
	ldrb r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B80F8
	adds r0, r3, r6
	strb r2, [r0]
	adds r3, 0x1
_080B80F8:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B80E8
	ldr r0, _080B8130 @ =0x020192d0
	adds r0, 0x8
	adds r0, r3, r0
	movs r1, 0xFF
	strb r1, [r0]
	bl sub_80B9120
	lsls r0, 24
	lsrs r2, r0, 24
_080B8110:
	cmp r2, 0
	bne _080B811E
	ldr r0, _080B8130 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B811E:
	ldr r0, _080B8130 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8130: .4byte 0x020192d0
	thumb_func_end ContestEffect_09

	thumb_func_start ContestEffect_14
ContestEffect_14: @ 80B8134
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x14
	cmp r0, 0x1
	bls _080B8156
	movs r1, 0x3C
	cmp r0, 0x7
	bhi _080B8156
	movs r1, 0x28
_080B8156:
	ldr r0, _080B8164 @ =0x020192d0
	strh r1, [r0, 0x4]
	bl ContestEffect_08
	pop {r0}
	bx r0
	.align 2, 0
_080B8164: .4byte 0x020192d0
	thumb_func_end ContestEffect_14

	thumb_func_start ContestEffect_15
ContestEffect_15: @ 80B8168
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r0, _080B8200 @ =0x020192d0
	ldrb r6, [r0, 0x11]
	adds r1, r6, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	beq _080B81DE
	movs r5, 0
	mov r4, r8
_080B8182:
	adds r0, r6, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B81D8
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r0, 0
	beq _080B81C6
	movs r1, 0xA
	cmp r0, 0x2
	bls _080B81C6
	movs r1, 0x14
	cmp r0, 0x4
	bls _080B81C6
	movs r1, 0x1E
	cmp r0, 0x6
	bls _080B81C6
	movs r1, 0x3C
	cmp r0, 0x8
	bhi _080B81C6
	movs r1, 0x28
_080B81C6:
	strh r1, [r4, 0x4]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B81D8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B81D8:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8182
_080B81DE:
	mov r1, r8
	ldrb r0, [r1, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	cmp r7, 0
	bne _080B81F6
	mov r1, r8
	ldrb r0, [r1, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B81F6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8200: .4byte 0x020192d0
	thumb_func_end ContestEffect_15

	thumb_func_start ContestEffect_16
ContestEffect_16: @ 80B8204
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r9, r0
	ldr r0, _080B829C @ =0x020192d0
	ldrb r7, [r0, 0x11]
	adds r1, r7, r0
	ldrb r1, [r1]
	mov r10, r0
	cmp r1, 0
	beq _080B8274
	movs r6, 0
	mov r8, r10
	mov r5, r10
	subs r5, 0x5B
_080B8228:
	mov r1, r8
	adds r0, r7, r1
	adds r1, r6, r1
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B826C
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B826C
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B826C
	ldrb r0, [r5]
	movs r2, 0x11
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_80B13EC
	movs r0, 0x1
	mov r9, r0
_080B826C:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B8228
_080B8274:
	mov r1, r10
	ldrb r0, [r1, 0x11]
	movs r1, 0x7
	bl sub_80B13EC
	mov r2, r9
	cmp r2, 0
	bne _080B828E
	mov r1, r10
	ldrb r0, [r1, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B828E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B829C: .4byte 0x020192d0
	thumb_func_end ContestEffect_16

	thumb_func_start ContestEffect_17
ContestEffect_17: @ 80B82A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r0, 0
	mov r9, r0
	ldr r0, _080B82E4 @ =0x020192d0
	ldrb r1, [r0, 0x11]
	mov r8, r1
	adds r1, r0
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _080B8310
	movs r5, 0
	adds r4, r6, 0
	movs r7, 0
_080B82C2:
	mov r2, r8
	adds r0, r2, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8306
	adds r0, r6, 0
	subs r0, 0x70
	adds r0, r7, r0
	ldrb r1, [r0, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B82E8
	movs r0, 0x32
	b _080B82EA
	.align 2, 0
_080B82E4: .4byte 0x020192d0
_080B82E8:
	movs r0, 0xA
_080B82EA:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8306
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080B8306:
	adds r7, 0x1C
	adds r5, 0x1
	ldr r6, _080B8334 @ =0x020192d0
	cmp r5, 0x3
	ble _080B82C2
_080B8310:
	ldrb r0, [r6, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	mov r0, r9
	cmp r0, 0
	bne _080B8326
	ldrb r0, [r6, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B8326:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8334: .4byte 0x020192d0
	thumb_func_end ContestEffect_17

	thumb_func_start ContestEffect_18
ContestEffect_18: @ 80B8338
	push {r4,lr}
	ldr r4, _080B8364 @ =0x020192d0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x11]
	bl ContestEffect_09
	ldrb r0, [r4, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8364: .4byte 0x020192d0
	thumb_func_end ContestEffect_18

	thumb_func_start ContestEffect_19
ContestEffect_19: @ 80B8368
	push {r4,lr}
	ldr r4, _080B839C @ =0x020192d0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrh r0, [r0, 0x6]
	ldr r1, _080B83A0 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	bl sub_80B9038
	ldrb r0, [r4, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B839C: .4byte 0x020192d0
_080B83A0: .4byte gContestMoves
	thumb_func_end ContestEffect_19

	thumb_func_start ContestEffect_20
ContestEffect_20: @ 80B83A4
	push {lr}
	movs r0, 0
	bl sub_80B9038
	ldr r0, _080B83BC @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B83BC: .4byte 0x020192d0
	thumb_func_end ContestEffect_20

	thumb_func_start ContestEffect_21
ContestEffect_21: @ 80B83C0
	push {lr}
	movs r0, 0x1
	bl sub_80B9038
	ldr r0, _080B83D8 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B83D8: .4byte 0x020192d0
	thumb_func_end ContestEffect_21

	thumb_func_start ContestEffect_22
ContestEffect_22: @ 80B83DC
	push {lr}
	movs r0, 0x2
	bl sub_80B9038
	ldr r0, _080B83F4 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B83F4: .4byte 0x020192d0
	thumb_func_end ContestEffect_22

	thumb_func_start ContestEffect_23
ContestEffect_23: @ 80B83F8
	push {lr}
	movs r0, 0x3
	bl sub_80B9038
	ldr r0, _080B8410 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B8410: .4byte 0x020192d0
	thumb_func_end ContestEffect_23

	thumb_func_start ContestEffect_24
ContestEffect_24: @ 80B8414
	push {lr}
	movs r0, 0x4
	bl sub_80B9038
	ldr r0, _080B842C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r0}
	bx r0
	.align 2, 0
_080B842C: .4byte 0x020192d0
	thumb_func_end ContestEffect_24

	thumb_func_start ContestEffect_25
ContestEffect_25: @ 80B8430
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _080B8474 @ =0x020192d0
	ldrb r1, [r0, 0x11]
	adds r1, r0
	ldrb r1, [r1]
	adds r7, r0, 0
	cmp r1, 0x3
	beq _080B8488
	movs r5, 0
	adds r6, r7, 0
_080B8446:
	ldrb r0, [r6, 0x11]
	adds r0, r6
	ldrb r0, [r0]
	adds r0, 0x1
	adds r1, r5, r6
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8482
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B8478
	adds r0, r4, 0
	bl sub_80B157C
	adds r0, r4, 0
	movs r1, 0xA
	b _080B847C
	.align 2, 0
_080B8474: .4byte 0x020192d0
_080B8478:
	adds r0, r4, 0
	movs r1, 0x3C
_080B847C:
	bl sub_80B13EC
	movs r4, 0x1
_080B8482:
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8446
_080B8488:
	ldrb r0, [r7, 0x11]
	movs r1, 0x9
	bl sub_80B13EC
	cmp r4, 0
	bne _080B849C
	ldrb r0, [r7, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B849C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_25

	thumb_func_start ContestEffect_26
ContestEffect_26: @ 80B84A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	movs r0, 0
	mov r9, r0
	movs r1, 0
	str r1, [sp, 0x18]
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x5
	bl memset
	movs r6, 0
	movs r4, 0
	add r2, sp, 0x10
	mov r8, r2
	add r3, sp, 0x8
	mov r10, r3
	ldr r5, _080B8518 @ =0x020192d0
	adds r7, r5, 0
	subs r7, 0x70
_080B84D4:
	ldrb r0, [r5, 0x11]
	adds r0, r5
	adds r1, r6, r5
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080B8502
	ldrb r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B8502
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080B8502
	mov r1, sp
	adds r0, r1, r4
	strb r6, [r0]
	adds r4, 0x1
_080B8502:
	adds r7, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B84D4
	cmp r4, 0x1
	bne _080B851C
	movs r0, 0x3C
	mov r2, r8
	strh r0, [r2]
	b _080B854A
	.align 2, 0
_080B8518: .4byte 0x020192d0
_080B851C:
	cmp r4, 0x2
	bne _080B852A
	movs r0, 0x1E
	mov r3, r8
	strh r0, [r3]
	strh r0, [r3, 0x2]
	b _080B854A
_080B852A:
	cmp r4, 0x3
	bne _080B853A
	movs r0, 0x14
	mov r7, r8
	strh r0, [r7]
	strh r0, [r7, 0x2]
	strh r0, [r7, 0x4]
	b _080B854A
_080B853A:
	mov r1, r8
	movs r2, 0
	mov r0, r8
	adds r0, 0x6
_080B8542:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080B8542
_080B854A:
	movs r6, 0
	movs r7, 0
	mov r4, r10
_080B8550:
	ldr r0, _080B8584 @ =0x02019260
	adds r5, r7, r0
	ldrb r1, [r5, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B8590
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _080B8590
	ldr r1, _080B8588 @ =gContestMoves
	ldrh r0, [r5, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	ldr r1, _080B858C @ =gComboStarterLookupTable
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	b _080B8592
	.align 2, 0
_080B8584: .4byte 0x02019260
_080B8588: .4byte gContestMoves
_080B858C: .4byte gComboStarterLookupTable
_080B8590:
	movs r0, 0
_080B8592:
	strh r0, [r4]
	ldr r5, _080B8628 @ =0x02019260
	adds r0, r7, r5
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4]
	subs r0, r1
	strh r0, [r4]
	adds r7, 0x1C
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B8550
	mov r2, r8
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080B865E
	movs r6, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B865E
	adds r5, 0x7D
	mov r4, sp
_080B85D6:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r6, 1
	add r1, r8
	movs r7, 0
	ldrsh r2, [r1, r7]
	ldrb r3, [r4]
	lsls r1, r3, 1
	add r1, r10
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r2, r1
	cmp r0, r2
	bge _080B862C
	adds r0, r3, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B8636
	ldrb r0, [r4]
	bl sub_80B157C
	ldrb r0, [r4]
	movs r1, 0xA
	bl sub_80B13EC
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _080B8630
	.align 2, 0
_080B8628: .4byte 0x02019260
_080B862C:
	movs r0, 0x1
	str r0, [sp, 0x18]
_080B8630:
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _080B864C
_080B8636:
	movs r2, 0
	str r2, [sp, 0x18]
	ldrb r0, [r4]
	movs r1, 0x3C
	bl sub_80B13EC
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080B864C:
	ldrb r0, [r4]
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	adds r4, 0x1
	adds r6, 0x1
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080B85D6
_080B865E:
	ldr r4, _080B8688 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	movs r1, 0xB
	bl sub_80B13EC
	mov r3, r9
	cmp r3, 0
	bne _080B8676
	ldrb r0, [r4, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B8676:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8688: .4byte 0x020192d0
	thumb_func_end ContestEffect_26

	thumb_func_start ContestEffect_27
ContestEffect_27: @ 80B868C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	movs r6, 0
	ldr r7, _080B8714 @ =0x020192d0
	adds r5, r7, 0
	subs r5, 0x63
_080B869E:
	ldrb r0, [r7, 0x11]
	adds r0, r7
	adds r1, r6, r7
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B86EA
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	ble _080B86EA
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B90C0
	lsls r0, 24
	cmp r0, 0
	beq _080B86EA
	movs r0, 0
	strb r0, [r5]
	ldrb r1, [r5, 0x3]
	movs r2, 0x31
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r5, 0x3]
	adds r0, r4, 0
	movs r1, 0xD
	bl sub_80B13EC
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080B86EA:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B869E
	ldr r4, _080B8714 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	movs r1, 0xC
	bl sub_80B13EC
	mov r0, r8
	cmp r0, 0
	bne _080B870A
	ldrb r0, [r4, 0x11]
	movs r1, 0x39
	bl sub_80B1404
_080B870A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8714: .4byte 0x020192d0
	thumb_func_end ContestEffect_27

	thumb_func_start ContestEffect_28
ContestEffect_28: @ 80B8718
	push {r4-r7,lr}
	movs r7, 0
	movs r5, 0
	ldr r4, _080B8744 @ =0x020192d0
	movs r6, 0
_080B8722:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B8762
	adds r0, r4, 0
	subs r0, 0x70
	adds r0, r6, r0
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080B8748
	movs r0, 0x28
	b _080B874A
	.align 2, 0
_080B8744: .4byte 0x020192d0
_080B8748:
	movs r0, 0xA
_080B874A:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B8762
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B8762:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8722
	ldr r4, _080B8788 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	movs r1, 0xE
	bl sub_80B13EC
	cmp r7, 0
	bne _080B8780
	ldrb r0, [r4, 0x11]
	movs r1, 0x39
	bl sub_80B1404
_080B8780:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8788: .4byte 0x020192d0
	thumb_func_end ContestEffect_28

	thumb_func_start ContestEffect_29
ContestEffect_29: @ 80B878C
	push {r4,lr}
	ldr r0, _080B87D0 @ =gUnknown_02038696
	ldr r4, _080B87D4 @ =0x020192d0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B87CA
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x6]
	ldr r3, _080B87D8 @ =gContestEffects
	ldr r2, _080B87DC @ =gContestMoves
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0xF
	bl sub_80B13EC
_080B87CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B87D0: .4byte gUnknown_02038696
_080B87D4: .4byte 0x020192d0
_080B87D8: .4byte gContestEffects
_080B87DC: .4byte gContestMoves
	thumb_func_end ContestEffect_29

	thumb_func_start ContestEffect_30
ContestEffect_30: @ 80B87E0
	push {r4,lr}
	ldr r0, _080B8824 @ =gUnknown_02038696
	ldr r4, _080B8828 @ =0x020192d0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080B881E
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x6]
	ldr r3, _080B882C @ =gContestEffects
	ldr r2, _080B8830 @ =gContestMoves
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x10
	bl sub_80B13EC
_080B881E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8824: .4byte gUnknown_02038696
_080B8828: .4byte 0x020192d0
_080B882C: .4byte gContestEffects
_080B8830: .4byte gContestMoves
	thumb_func_end ContestEffect_30

	thumb_func_start ContestEffect_31
ContestEffect_31: @ 80B8834
	push {r4-r7,lr}
	movs r1, 0
	movs r3, 0
	ldr r4, _080B8880 @ =0x020192d0
	ldrb r0, [r4, 0x11]
	adds r0, r4
	ldrb r5, [r0]
	movs r2, 0
	adds r6, r4, 0
	subs r6, 0x70
_080B8848:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r5, r0
	bls _080B8858
	adds r0, r2, r6
	movs r7, 0x2
	ldrsh r0, [r0, r7]
	adds r3, r0
_080B8858:
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, 0x3
	ble _080B8848
	cmp r3, 0
	bge _080B8866
	movs r3, 0
_080B8866:
	ldr r4, _080B8880 @ =0x020192d0
	ldrb r2, [r4, 0x11]
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B8876
	cmp r3, 0
	bne _080B8884
_080B8876:
	adds r0, r2, 0
	movs r1, 0x12
	bl sub_80B13EC
	b _080B88A4
	.align 2, 0
_080B8880: .4byte 0x020192d0
_080B8884:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	lsrs r0, r3, 31
	adds r0, r3, r0
	asrs r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x11
	bl sub_80B13EC
_080B88A4:
	ldr r4, _080B88D0 @ =0x020192d0
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r5, r4, 0
	subs r5, 0x70
	adds r0, r5
	movs r7, 0x2
	ldrsh r0, [r0, r7]
	bl sub_80B9224
	ldrb r2, [r4, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B88D0: .4byte 0x020192d0
	thumb_func_end ContestEffect_31

	thumb_func_start ContestEffect_32
ContestEffect_32: @ 80B88D4
	push {r4-r7,lr}
	movs r6, 0
	ldr r0, _080B8928 @ =0x020192d0
	ldrb r1, [r0, 0x11]
	adds r3, r1, r0
	ldrb r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _080B891C
	movs r2, 0
	adds r7, r4, 0
	adds r0, r1, 0
	subs r1, r0, 0x1
	movs r3, 0
	adds r5, r4, 0
	subs r5, 0x70
_080B88F4:
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _080B8900
	adds r0, r3, r5
	ldrh r6, [r0, 0x2]
_080B8900:
	adds r3, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B88F4
	adds r0, r4, 0
	ldrb r2, [r0, 0x11]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B891C
	lsls r0, r6, 16
	asrs r3, r0, 16
	cmp r3, 0
	bgt _080B892C
_080B891C:
	ldrb r0, [r4, 0x11]
	movs r1, 0x14
	bl sub_80B13EC
	b _080B8946
	.align 2, 0
_080B8928: .4byte 0x020192d0
_080B892C:
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r0
	ldrh r0, [r1, 0x2]
	adds r0, r3, r0
	strh r0, [r1, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x13
	bl sub_80B13EC
_080B8946:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_32

	thumb_func_start ContestEffect_33
ContestEffect_33: @ 80B894C
	push {lr}
	ldr r0, _080B896C @ =0x020192d0
	ldrb r2, [r0, 0x11]
	adds r1, r2, r0
	ldrb r3, [r1]
	mov r12, r0
	cmp r3, 0
	bne _080B8970
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r12
	subs r1, 0x70
	adds r0, r1
	movs r1, 0xA
	b _080B8982
	.align 2, 0
_080B896C: .4byte 0x020192d0
_080B8970:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r12
	subs r1, 0x70
	adds r0, r1
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
_080B8982:
	strh r1, [r0, 0x2]
	cmp r3, 0
	bne _080B8994
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x15
	bl sub_80B13EC
	b _080B89BE
_080B8994:
	cmp r3, 0x1
	bne _080B89A4
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x16
	bl sub_80B13EC
	b _080B89BE
_080B89A4:
	cmp r3, 0x2
	bne _080B89B4
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x17
	bl sub_80B13EC
	b _080B89BE
_080B89B4:
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x18
	bl sub_80B13EC
_080B89BE:
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_33

	thumb_func_start ContestEffect_34
ContestEffect_34: @ 80B89C4
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	bhi _080B89F0
	movs r4, 0xA
	ldr r0, _080B89EC @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1A
	bl sub_80B13EC
	b _080B8A44
	.align 2, 0
_080B89EC: .4byte 0x020192d0
_080B89F0:
	cmp r0, 0x5
	bhi _080B8A08
	movs r4, 0x14
	ldr r0, _080B8A04 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1B
	bl sub_80B13EC
	b _080B8A44
	.align 2, 0
_080B8A04: .4byte 0x020192d0
_080B8A08:
	cmp r0, 0x7
	bhi _080B8A20
	movs r4, 0x28
	ldr r0, _080B8A1C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1C
	bl sub_80B13EC
	b _080B8A44
	.align 2, 0
_080B8A1C: .4byte 0x020192d0
_080B8A20:
	cmp r1, 0x8
	bhi _080B8A38
	movs r4, 0x3C
	ldr r0, _080B8A34 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1D
	bl sub_80B13EC
	b _080B8A44
	.align 2, 0
_080B8A34: .4byte 0x020192d0
_080B8A38:
	movs r4, 0x50
	ldr r0, _080B8A5C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x1E
	bl sub_80B13EC
_080B8A44:
	ldr r0, _080B8A5C @ =0x020192d0
	ldrb r2, [r0, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	subs r0, 0x70
	adds r1, r0
	strh r4, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A5C: .4byte 0x020192d0
	thumb_func_end ContestEffect_34

	thumb_func_start ContestEffect_35
ContestEffect_35: @ 80B8A60
	push {r4-r7,lr}
	ldr r1, _080B8AD4 @ =0x020192d0
	ldrb r0, [r1, 0x11]
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r12, r1
	cmp r2, 0
	beq _080B8B28
	ldrb r5, [r1]
	mov r6, r12
	subs r6, 0x70
_080B8A7E:
	movs r2, 0
	lsls r0, r4, 24
	asrs r1, r0, 24
	adds r4, r0, 0
	cmp r5, r1
	beq _080B8AA4
	ldr r3, _080B8AD4 @ =0x020192d0
_080B8A8C:
	lsls r0, r2, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bgt _080B8AA4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080B8A8C
_080B8AA4:
	lsls r2, 24
	asrs r1, r2, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r6
	ldrb r1, [r3, 0xB]
	movs r0, 0x80
	ands r0, r1
	adds r7, r2, 0
	cmp r0, 0
	bne _080B8AC6
	ldrb r1, [r3, 0xC]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080B8AD8
_080B8AC6:
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r4, r1
	lsrs r4, r0, 24
	cmp r0, 0
	blt _080B8B28
	b _080B8A7E
	.align 2, 0
_080B8AD4: .4byte 0x020192d0
_080B8AD8:
	mov r2, r12
	ldrb r1, [r2, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r3, r12
	subs r3, 0x70
	adds r5, r0, r3
	ldrh r0, [r5, 0x6]
	ldr r4, _080B8B30 @ =gContestMoves
	lsls r0, 3
	adds r6, r0, r4
	ldrb r2, [r6, 0x1]
	lsls r2, 29
	asrs r1, r7, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	adds r0, r4
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r2, r0
	bne _080B8B28
	ldr r1, _080B8B34 @ =gContestEffects
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r5, 0x2]
	mov r2, r12
	ldrb r0, [r2, 0x11]
	movs r1, 0x1F
	bl sub_80B13EC
_080B8B28:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8B30: .4byte gContestMoves
_080B8B34: .4byte gContestEffects
	thumb_func_end ContestEffect_35

	thumb_func_start ContestEffect_36
ContestEffect_36: @ 80B8B38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080B8BBC @ =0x020192d0
	ldrb r2, [r0, 0x11]
	adds r1, r2, r0
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	beq _080B8BD0
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	mov r1, r8
	subs r1, 0x70
	adds r0, r1
	ldrh r0, [r0, 0x6]
	mov r9, r0
	movs r4, 0
	mov r6, r8
	ldr r0, _080B8BC0 @ =gContestMoves
	mov r12, r0
	movs r7, 0
_080B8B68:
	ldrb r2, [r6, 0x11]
	adds r0, r2, r6
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r4, r6
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8BC8
	mov r1, r9
	lsls r0, r1, 3
	mov r1, r12
	adds r3, r0, r1
	ldrb r1, [r3, 0x1]
	lsls r1, 29
	mov r5, r8
	subs r5, 0x70
	adds r0, r7, r5
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	add r0, r12
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r1, r0
	beq _080B8BC8
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	ldr r2, _080B8BC4 @ =gContestEffects
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	lsls r0, 1
	ldrh r2, [r1, 0x2]
	adds r0, r2
	strh r0, [r1, 0x2]
	ldrb r0, [r6, 0x11]
	movs r1, 0x20
	bl sub_80B13EC
	b _080B8BD0
	.align 2, 0
_080B8BBC: .4byte 0x020192d0
_080B8BC0: .4byte gContestMoves
_080B8BC4: .4byte gContestEffects
_080B8BC8:
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B8B68
_080B8BD0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_36

	thumb_func_start ContestEffect_37
ContestEffect_37: @ 80B8BDC
	push {r4-r7,lr}
	ldr r1, _080B8C28 @ =0x020192d0
	ldrb r0, [r1, 0x11]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B8C44
	movs r5, 0
	adds r4, r1, 0
	adds r6, r4, 0
	subs r6, 0x70
	adds r7, r6, 0
_080B8BF4:
	ldrb r2, [r4, 0x11]
	adds r0, r2, r4
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r5, r4
	ldrb r1, [r1]
	cmp r0, r1
	bne _080B8C3C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r2, r0, r7
	movs r0, 0x2
	ldrsh r1, [r2, r0]
	movs r3, 0x2
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _080B8C2C
	adds r0, r1, 0
	lsls r0, 1
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x21
	bl sub_80B13EC
	b _080B8C3C
	.align 2, 0
_080B8C28: .4byte 0x020192d0
_080B8C2C:
	cmp r1, r0
	bge _080B8C3C
	movs r0, 0
	strh r0, [r2, 0x2]
	ldrb r0, [r4, 0x11]
	movs r1, 0x22
	bl sub_80B13EC
_080B8C3C:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B8BF4
_080B8C44:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_37

	thumb_func_start ContestEffect_38
ContestEffect_38: @ 80B8C4C
	push {r4,r5,lr}
	ldr r4, _080B8C90 @ =0x020192d0
	ldrb r2, [r4, 0x11]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r5, r4, 0
	subs r5, 0x70
	adds r1, r0, r5
	ldrb r3, [r1, 0xD]
	movs r0, 0xD
	ldrsb r0, [r1, r0]
	cmp r0, 0x1D
	bgt _080B8C94
	adds r0, r3, 0
	adds r0, 0xA
	strb r0, [r1, 0xD]
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r2, [r0, 0x10]
	movs r1, 0x31
	negs r1, r1
	ands r1, r2
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r0, 0x10]
	ldrb r0, [r4, 0x11]
	movs r1, 0x23
	bl sub_80B13EC
	b _080B8C9C
	.align 2, 0
_080B8C90: .4byte 0x020192d0
_080B8C94:
	adds r0, r2, 0
	movs r1, 0x3A
	bl sub_80B13EC
_080B8C9C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_38

	thumb_func_start ContestEffect_39
ContestEffect_39: @ 80B8CA4
	push {r4,lr}
	ldr r3, _080B8CDC @ =0x020192d0
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, r3, 0
	subs r4, 0x70
	adds r0, r4
	ldrb r1, [r0, 0x11]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r1, [r3, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080B8CE0
	adds r0, r1, 0
	movs r1, 0x24
	bl sub_80B13EC
	b _080B8CE8
	.align 2, 0
_080B8CDC: .4byte 0x020192d0
_080B8CE0:
	adds r0, r1, 0
	movs r1, 0x3B
	bl sub_80B13EC
_080B8CE8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_39

	thumb_func_start ContestEffect_40
ContestEffect_40: @ 80B8CF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _080B8D78 @ =0x02019204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _080B8D02
	b _080B8E0A
_080B8D02:
	movs r6, 0
	adds r7, r1, 0
	adds r7, 0xCC
	adds r3, r1, 0
	adds r3, 0x5C
_080B8D0C:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8D0C
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r6, 0
	mov r12, r7
	movs r4, 0x70
	negs r4, r4
	adds r4, r7
	mov r8, r4
_080B8D42:
	movs r5, 0
_080B8D44:
	lsls r0, r5, 24
	asrs r2, r0, 24
	mov r0, r12
	ldrb r0, [r0, 0x11]
	cmp r2, r0
	beq _080B8D7C
	lsls r0, r6, 24
	asrs r3, r0, 24
	mov r1, sp
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r3, r0
	bne _080B8D7C
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	lsls r0, r3, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x19]
	cmp r0, r1
	bne _080B8D7C
	adds r0, r3, 0x1
	strb r0, [r4]
	b _080B8D8C
	.align 2, 0
_080B8D78: .4byte 0x02019204
_080B8D7C:
	lsls r0, r5, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8D44
_080B8D8C:
	cmp r5, 0x4
	beq _080B8DA0
	lsls r0, r6, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8D42
_080B8DA0:
	ldrb r0, [r7, 0x11]
	mov r4, sp
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r7, 0
	subs r3, 0x70
	adds r1, r3
	ldrb r2, [r1, 0x10]
	movs r0, 0x3F
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1, 0x10]
	movs r6, 0
_080B8DC6:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, 0x19]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8DC6
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r7, 0
	subs r0, 0x70
	adds r1, r0
	ldrb r2, [r1, 0x11]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1, 0x11]
	ldrb r0, [r7, 0x11]
	movs r1, 0x25
	bl sub_80B13EC
_080B8E0A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_40

	thumb_func_start ContestEffect_41
ContestEffect_41: @ 80B8E18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _080B8EA8 @ =0x02019204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _080B8E2C
	b _080B8F3A
_080B8E2C:
	movs r6, 0
	adds r7, r1, 0
	adds r7, 0xCC
	adds r3, r1, 0
	adds r3, 0x5C
_080B8E36:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8E36
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	movs r6, 0x3
	mov r12, r7
	movs r4, 0x70
	negs r4, r4
	adds r4, r7
	mov r8, r4
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
_080B8E72:
	movs r5, 0
_080B8E74:
	lsls r0, r5, 24
	asrs r2, r0, 24
	mov r1, r12
	ldrb r1, [r1, 0x11]
	cmp r2, r1
	beq _080B8EAC
	lsls r0, r6, 24
	asrs r3, r0, 24
	mov r0, sp
	adds r4, r0, r2
	ldrb r1, [r4]
	cmp r3, r1
	bne _080B8EAC
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	lsls r0, r3, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x19]
	cmp r0, r1
	bne _080B8EAC
	subs r0, r3, 0x1
	strb r0, [r4]
	b _080B8EBC
	.align 2, 0
_080B8EA8: .4byte 0x02019204
_080B8EAC:
	lsls r0, r5, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8E74
_080B8EBC:
	cmp r5, 0x4
	beq _080B8ED0
	lsls r0, r6, 24
	movs r4, 0xFF
	lsls r4, 24
	adds r0, r4
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, r9
	bgt _080B8E72
_080B8ED0:
	ldrb r0, [r7, 0x11]
	mov r2, sp
	adds r1, r2, r0
	movs r0, 0x3
	strb r0, [r1]
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r3, r7, 0
	subs r3, 0x70
	adds r1, r3
	ldrb r2, [r1, 0x10]
	movs r0, 0x3F
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1, 0x10]
	movs r6, 0
_080B8EF6:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	mov r4, sp
	adds r2, r4, r1
	ldrb r2, [r2]
	strb r2, [r0, 0x19]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8EF6
	ldrb r0, [r7, 0x11]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r7, 0
	subs r0, 0x70
	adds r1, r0
	ldrb r2, [r1, 0x11]
	movs r0, 0x4
	negs r0, r0
	ands r0, r2
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x11]
	ldrb r0, [r7, 0x11]
	movs r1, 0x26
	bl sub_80B13EC
_080B8F3A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ContestEffect_41

	thumb_func_start ContestEffect_42
ContestEffect_42: @ 80B8F48
	bx lr
	thumb_func_end ContestEffect_42

	thumb_func_start ContestEffect_43
ContestEffect_43: @ 80B8F4C
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r1, _080B8FC4 @ =0x02019204
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	beq _080B9042
	movs r6, 0
	add r3, sp, 0x4
	adds r5, r1, 0
	adds r5, 0x5C
	adds r4, r3, 0
_080B8F62:
	lsls r1, r6, 24
	asrs r1, 24
	mov r0, sp
	adds r2, r0, r1
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x19]
	strb r0, [r2]
	adds r0, r4, r1
	strb r6, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080B8F62
	movs r6, 0
	adds r7, r3, 0
_080B8F8A:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r6, 24
	asrs r2, 24
	movs r1, 0x4
	subs r1, r2
	bl __modsi3
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0
_080B8FA4:
	lsls r0, r1, 24
	asrs r2, r0, 24
	adds r3, r7, r2
	ldrb r1, [r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080B8FCE
	cmp r4, 0
	bne _080B8FC8
	mov r1, sp
	adds r0, r1, r2
	strb r6, [r0]
	movs r0, 0xFF
	strb r0, [r3]
	b _080B8FDC
	.align 2, 0
_080B8FC4: .4byte 0x02019204
_080B8FC8:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080B8FCE:
	movs r3, 0x80
	lsls r3, 17
	adds r0, r5, r3
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8FA4
_080B8FDC:
	lsls r0, r6, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r6, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080B8F8A
	movs r6, 0
	ldr r4, _080B904C @ =0x020192d0
	adds r7, r4, 0
	subs r7, 0x70
	movs r3, 0x3F
	mov r12, r3
	movs r5, 0x80
_080B8FFA:
	lsls r2, r6, 24
	asrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r7
	mov r3, sp
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x19]
	ldrb r3, [r1, 0x10]
	mov r0, r12
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, 0x10]
	adds r2, 0x1
	lsls r2, 24
	lsrs r6, r2, 24
	asrs r2, 24
	cmp r2, 0x3
	ble _080B8FFA
	ldrb r1, [r4, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x70
	adds r0, r1
	ldrb r1, [r0, 0x11]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r4, 0x11]
	movs r1, 0x27
	bl sub_80B13EC
_080B9042:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B904C: .4byte 0x020192d0
	thumb_func_end ContestEffect_43

	thumb_func_start ContestEffect_44
ContestEffect_44: @ 80B9050
	push {lr}
	ldr r3, _080B9084 @ =gContestMoves
	ldr r1, _080B9088 @ =0x020192d0
	ldrb r2, [r1, 0x11]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	subs r1, 0x70
	adds r2, r0, r1
	ldrh r0, [r2, 0x6]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	ldr r1, _080B908C @ =gScriptContestCategory
	lsrs r0, 29
	ldrh r1, [r1]
	cmp r0, r1
	beq _080B907E
	ldrb r0, [r2, 0x11]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x11]
_080B907E:
	pop {r0}
	bx r0
	.align 2, 0
_080B9084: .4byte gContestMoves
_080B9088: .4byte 0x020192d0
_080B908C: .4byte gScriptContestCategory
	thumb_func_end ContestEffect_44

	thumb_func_start ContestEffect_45
ContestEffect_45: @ 80B9090
	push {r4-r7,lr}
	movs r7, 0
	movs r5, 0
	ldr r4, _080B90C8 @ =0x020192d0
	movs r6, 0
_080B909A:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B90E6
	adds r0, r4, 0
	subs r0, 0x70
	adds r1, r6, r0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0
	ble _080B90CC
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x4]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	bl sub_80B9268
	b _080B90CE
	.align 2, 0
_080B90C8: .4byte 0x020192d0
_080B90CC:
	movs r0, 0xA
_080B90CE:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B90E6
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080B90E6:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B909A
	cmp r7, 0
	bne _080B90FC
	ldr r0, _080B910C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B90FC:
	ldr r0, _080B910C @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x30
	bl sub_80B13EC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B910C: .4byte 0x020192d0
	thumb_func_end ContestEffect_45

	thumb_func_start ContestEffect_46
ContestEffect_46: @ 80B9110
	push {r4,lr}
	ldr r0, _080B912C @ =0x02019204
	movs r1, 0x13
	ldrsb r1, [r0, r1]
	cmp r1, 0
	bne _080B9130
	movs r4, 0xA
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1A
	bl sub_80B13EC
	b _080B9172
	.align 2, 0
_080B912C: .4byte 0x02019204
_080B9130:
	cmp r1, 0x1
	bne _080B9142
	movs r4, 0x14
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1B
	bl sub_80B13EC
	b _080B9172
_080B9142:
	cmp r1, 0x2
	bne _080B9154
	movs r4, 0x1E
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1C
	bl sub_80B13EC
	b _080B9172
_080B9154:
	cmp r1, 0x3
	bne _080B9166
	movs r4, 0x32
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1D
	bl sub_80B13EC
	b _080B9172
_080B9166:
	movs r4, 0x3C
	adds r0, 0xCC
	ldrb r0, [r0, 0x11]
	movs r1, 0x1E
	bl sub_80B13EC
_080B9172:
	ldr r0, _080B9188 @ =0x020192d0
	ldrb r2, [r0, 0x11]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	subs r0, 0x70
	adds r1, r0
	strh r4, [r1, 0x2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9188: .4byte 0x020192d0
	thumb_func_end ContestEffect_46

	thumb_func_start ContestEffect_47
ContestEffect_47: @ 80B918C
	push {lr}
	ldr r3, _080B91C8 @ =0x02019328
	ldrb r2, [r3, 0x1]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080B91C2
	movs r0, 0x1
	orrs r2, r0
	movs r0, 0x58
	negs r0, r0
	adds r0, r3
	mov r12, r0
	ldrb r1, [r0, 0x11]
	movs r0, 0x7
	ands r0, r1
	lsls r0, 1
	movs r1, 0xF
	negs r1, r1
	ands r2, r1
	orrs r2, r0
	strb r2, [r3, 0x1]
	mov r1, r12
	ldrb r0, [r1, 0x11]
	movs r1, 0x3D
	bl sub_80B13EC
_080B91C2:
	pop {r0}
	bx r0
	.align 2, 0
_080B91C8: .4byte 0x02019328
	thumb_func_end ContestEffect_47

	thumb_func_start sub_80B9038
sub_80B9038: @ 80B91CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	movs r5, 0
	ldr r4, _080B9210 @ =0x020192d0
	ldr r0, _080B9214 @ =gContestMoves
	mov r9, r0
	movs r6, 0
_080B91E6:
	ldrb r0, [r4, 0x11]
	adds r0, r4
	adds r1, r5, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B922E
	adds r0, r4, 0
	subs r0, 0x70
	adds r0, r6, r0
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	add r0, r9
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	cmp r8, r0
	bne _080B9218
	movs r0, 0x28
	b _080B921A
	.align 2, 0
_080B9210: .4byte 0x020192d0
_080B9214: .4byte gContestMoves
_080B9218:
	movs r0, 0xA
_080B921A:
	strh r0, [r4, 0x4]
	strb r5, [r4, 0x8]
	movs r0, 0xFF
	strb r0, [r4, 0x9]
	bl sub_80B9120
	lsls r0, 24
	cmp r0, 0
	beq _080B922E
	adds r7, 0x1
_080B922E:
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B91E6
	cmp r7, 0
	bne _080B9244
	ldr r0, _080B9250 @ =0x020192d0
	ldrb r0, [r0, 0x11]
	movs r1, 0x36
	bl sub_80B1404
_080B9244:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9250: .4byte 0x020192d0
	thumb_func_end sub_80B9038

	thumb_func_start sub_80B90C0
sub_80B90C0: @ 80B9254
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080B9280 @ =0x020192d0
	adds r0, r2, 0
	adds r0, 0xD
	adds r0, r3, r0
	movs r1, 0x1
	strb r1, [r0]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	subs r2, 0x70
	adds r2, r0, r2
	ldrb r1, [r2, 0x10]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B9284
	adds r0, r3, 0
	movs r1, 0x2D
	b _080B92AA
	.align 2, 0
_080B9280: .4byte 0x020192d0
_080B9284:
	ldrb r0, [r2, 0x12]
	cmp r0, 0
	bne _080B92A2
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B92AE
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080B92AE
	movs r0, 0x1
	b _080B92B0
_080B92A2:
	subs r0, 0x1
	strb r0, [r2, 0x12]
	adds r0, r3, 0
	movs r1, 0x2C
_080B92AA:
	bl sub_80B13EC
_080B92AE:
	movs r0, 0
_080B92B0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B90C0

	thumb_func_start sub_80B9120
sub_80B9120: @ 80B92B4
	push {r4-r7,lr}
	sub sp, 0xC
	mov r0, sp
	movs r1, 0
	movs r2, 0x8
	bl memset
	movs r7, 0
	ldr r1, _080B9320 @ =0x020192d0
	ldrb r0, [r1, 0x8]
	cmp r0, 0xFF
	beq _080B936C
	adds r5, r1, 0
_080B92CE:
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r7, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	str r1, [sp, 0x8]
	bl sub_80B90C0
	lsls r0, 24
	ldr r1, [sp, 0x8]
	cmp r0, 0
	beq _080B935C
	ldrh r0, [r1, 0x4]
	strh r0, [r1, 0x6]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	subs r1, 0x70
	adds r2, r0, r1
	ldrb r1, [r2, 0x10]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B9308
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	lsls r0, 1
	strh r0, [r5, 0x6]
_080B9308:
	ldrb r0, [r2, 0x10]
	movs r3, 0x1
	ands r3, r0
	cmp r3, 0
	beq _080B9324
	movs r0, 0xA
	strh r0, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x2F
	bl sub_80B13EC
	b _080B935C
	.align 2, 0
_080B9320: .4byte 0x020192d0
_080B9324:
	ldrb r1, [r2, 0xF]
	ldrh r0, [r5, 0x6]
	subs r0, r1
	adds r1, r0, 0
	strh r0, [r5, 0x6]
	lsls r0, 16
	cmp r0, 0
	bgt _080B9340
	strh r3, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x2E
	bl sub_80B13EC
	b _080B935C
_080B9340:
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_80B9200
	ldrb r1, [r5, 0x6]
	adds r0, r6, 0
	bl sub_80B141C
	lsls r0, r6, 1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
_080B935C:
	adds r7, 0x1
	ldr r1, _080B937C @ =0x020192d0
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B92CE
_080B936C:
	movs r7, 0
	mov r1, sp
_080B9370:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080B9380
	movs r0, 0x1
	b _080B938A
	.align 2, 0
_080B937C: .4byte 0x020192d0
_080B9380:
	adds r1, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _080B9370
	movs r0, 0
_080B938A:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9120

	thumb_func_start sub_80B9200
sub_80B9200: @ 80B9394
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _080B93B4 @ =0x02019260
	adds r2, r0
	ldrh r0, [r2, 0x2]
	subs r0, r1
	strh r0, [r2, 0x2]
	ldrb r0, [r2, 0xE]
	adds r1, r0
	strb r1, [r2, 0xE]
	bx lr
	.align 2, 0
_080B93B4: .4byte 0x02019260
	thumb_func_end sub_80B9200

	thumb_func_start sub_80B9224
sub_80B9224: @ 80B93B8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	cmp r4, 0
	bge _080B93C8
	negs r0, r4
_080B93C8:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, 0
	bge _080B93E6
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B93F0
	adds r0, r4, 0
	subs r0, 0xA
	adds r0, r1, r0
	b _080B93EC
_080B93E6:
	lsls r0, 16
	asrs r0, 16
	subs r0, r4, r0
_080B93EC:
	lsls r0, 16
	lsrs r5, r0, 16
_080B93F0:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9224

	thumb_func_start sub_80B9268
sub_80B9268: @ 80B93FC
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	cmp r4, 0
	bge _080B940C
	negs r0, r4
_080B940C:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B9424
	adds r0, r4, 0
	adds r0, 0xA
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080B9424:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B9268

	.align 2, 0 @ Don't pad with nop.
