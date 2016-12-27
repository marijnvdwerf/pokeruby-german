	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810993C
sub_810993C: @ 8109D48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, _08109DD4
	mov r9, r0
	movs r2, 0
_08109D5A:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	str r1, [sp, 0xC]
	cmp r5, 0x3
	bhi _08109DB8
	movs r1, 0x1
	add r1, r9
	mov r8, r1
	adds r6, r1, r2
	movs r0, 0xB
	mov r10, r0
	mov r0, r10
	muls r0, r2
	adds r0, 0x5
	mov r1, r9
	adds r7, r1, r0
_08109D7C:
	ldrb r0, [r6]
	cmp r0, 0
	bne _08109DAE
	adds r2, r0, 0
	mov r0, r8
	adds r1, r0, r5
	ldrb r0, [r1]
	strb r0, [r6]
	strb r2, [r1]
	mov r0, sp
	adds r1, r7, 0
	bl StringCopy
	mov r4, r10
	muls r4, r5
	adds r4, 0x5
	add r4, r9
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
_08109DAE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08109D7C
_08109DB8:
	ldr r1, [sp, 0xC]
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08109D5A
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109DD4: .4byte 0x020284c8
	thumb_func_end sub_810993C

	thumb_func_start sub_81099CC
sub_81099CC: @ 8109DD8
	push {r4-r6,lr}
	ldr r5, _08109E20
	movs r1, 0
	movs r0, 0x2
	strb r0, [r5]
	adds r0, r5, 0
	adds r0, 0x31
	strb r1, [r0]
	movs r4, 0
	ldr r6, _08109E24
_08109DEC:
	movs r0, 0xB
	muls r0, r4
	adds r0, 0x5
	adds r0, r5, r0
	lsls r1, r4, 2
	adds r1, r6
	ldr r1, [r1]
	bl StringCopy
	adds r1, r5, 0x1
	adds r1, r4
	ldr r0, _08109E28
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08109DEC
	bl sub_810993C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109E20: .4byte 0x020284c8
_08109E24: .4byte gUnknown_083F62D8
_08109E28: .4byte gTraderDecorations
	thumb_func_end sub_81099CC

	thumb_func_start sub_8109A20
sub_8109A20: @ 8109E2C
	ldr r0, _08109E38
	adds r0, 0x31
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08109E38: .4byte 0x020284c8
	thumb_func_end sub_8109A20

	thumb_func_start sub_8109A30
sub_8109A30: @ 8109E3C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08109E50
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08109E50: .4byte 0x00004020
	thumb_func_end sub_8109A30

	thumb_func_start sub_8109A48
sub_8109A48: @ 8109E54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r6, 0x1
	movs r5, 0
	ldr r0, _08109EC4
	movs r4, 0
	adds r7, r0, 0x1
	adds r1, r7, 0
_08109E70:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08109E7E
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08109E7E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08109E70
	lsls r3, r6, 25
	movs r0, 0x80
	lsls r0, 18
	adds r3, r0
	lsrs r3, 24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xC
	bl MenuDrawTextWindow
	movs r4, 0
	mov r1, r9
	lsls r1, 2
	mov r8, r1
_08109EA4:
	adds r1, r7, r4
	ldrb r0, [r1]
	cmp r0, 0
	beq _08109EEA
	cmp r0, 0x78
	bls _08109ECC
	lsls r2, r5, 25
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	lsrs r2, 24
	ldr r0, _08109EC8
	movs r1, 0x1
	bl MenuPrint
	b _08109EE4
	.align 2, 0
_08109EC4: .4byte 0x020284c8
_08109EC8: .4byte gOtherText_FiveQuestionsAndSlash
_08109ECC:
	ldrb r0, [r1]
	lsls r0, 5
	ldr r1, _08109F34
	adds r0, r1
	lsls r2, r5, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
_08109EE4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08109EEA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08109EA4
	ldr r0, _08109F38
	lsls r2, r5, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	movs r0, 0
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x2
	adds r3, r6, 0
	bl InitMenu
	ldr r1, _08109F3C
	mov r0, r8
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0xA]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109F34: .4byte 0x083f7bf1
_08109F38: .4byte gOtherText_CancelNoTerminator
_08109F3C: .4byte gTasks
	thumb_func_end sub_8109A48

	thumb_func_start sub_8109B34
sub_8109B34: @ 8109F40
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x78
	bls _08109F60
	ldr r1, _08109F58
	ldr r2, _08109F5C
	adds r0, r2, 0
	strh r0, [r1]
	b _08109F64
	.align 2, 0
_08109F58: .4byte gSpecialVar_0x8004
_08109F5C: .4byte 0x0000ffff
_08109F60:
	ldr r0, _08109F84
	strh r1, [r0]
_08109F64:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xC
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109F84: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8109B34

	thumb_func_start sub_8109B7C
sub_8109B7C: @ 8109F88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r6, _08109FB0
	ldr r0, _08109FB4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08109FB8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0810A04A
	.align 2, 0
_08109FB0: .4byte 0x020284c8
_08109FB4: .4byte gMain
_08109FB8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08109FCE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0810A04A
_08109FCE:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810A034
	movs r0, 0x5
	bl PlaySE
	ldr r5, _0810A008
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	ldr r1, _0810A00C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _0810A010
	adds r0, r4, 0
	movs r1, 0
	bl sub_8109B34
	b _0810A04A
	.align 2, 0
_0810A008: .4byte gSpecialVar_0x8005
_0810A00C: .4byte gTasks
_0810A010:
	ldr r0, _0810A030
	movs r1, 0xB
	muls r1, r2
	adds r1, 0x5
	adds r1, r6
	bl StringCopy
	adds r0, r6, 0x1
	ldrh r5, [r5]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8109B34
	b _0810A04A
	.align 2, 0
_0810A030: .4byte gStringVar1
_0810A034:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810A04A
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0
	bl sub_8109B34
_0810A04A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8109B7C

	thumb_func_start sub_8109C44
sub_8109C44: @ 810A050
	ldr r0, _0810A05C
	ldr r1, _0810A060
	adds r0, 0x31
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810A05C: .4byte 0x020284c8
_0810A060: .4byte gScriptResult
	thumb_func_end sub_8109C44

	thumb_func_start sub_8109C58
sub_8109C58: @ 810A064
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810A07C
_0810A06A:
	adds r0, r4, 0
	bl sub_8134194
	lsls r0, 24
	cmp r0, 0
	beq _0810A080
	movs r0, 0
	strh r0, [r5]
	b _0810A090
	.align 2, 0
_0810A07C: .4byte gScriptResult
_0810A080:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0810A06A
	ldr r1, _0810A098
	movs r0, 0x1
	strh r0, [r1]
_0810A090:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810A098: .4byte gScriptResult
	thumb_func_end sub_8109C58

	thumb_func_start sub_8109C90
sub_8109C90: @ 810A09C
	push {r4-r6,lr}
	ldr r6, _0810A0E8
	movs r0, 0
	strh r0, [r6]
	ldr r4, _0810A0EC
	ldr r5, _0810A0F0
	ldrh r0, [r5]
	lsls r0, 5
	adds r2, r0, r4
	ldr r0, _0810A0F4
	ldrh r0, [r0]
	lsls r0, 5
	adds r0, r4
	ldrb r1, [r2, 0x13]
	ldrb r0, [r0, 0x13]
	cmp r1, r0
	beq _0810A0E2
	adds r0, r1, 0
	bl sub_8133F9C
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0810A0E2
	ldr r0, _0810A0F8
	ldrh r1, [r5]
	lsls r1, 5
	adds r1, r4
	ldrb r1, [r1, 0x13]
	bl sub_80FE7D4
	movs r0, 0x1
	strh r0, [r6]
_0810A0E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A0E8: .4byte gScriptResult
_0810A0EC: .4byte gDecorations
_0810A0F0: .4byte gSpecialVar_0x8004
_0810A0F4: .4byte gSpecialVar_0x8006
_0810A0F8: .4byte gStringVar2
	thumb_func_end sub_8109C90

	thumb_func_start sub_8109CF0
sub_8109CF0: @ 810A0FC
	push {lr}
	ldr r0, _0810A10C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810A10C: .4byte sub_80FE7A8
	thumb_func_end sub_8109CF0

	thumb_func_start sub_8109D04
sub_8109D04: @ 810A110
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	ldr r0, _0810A178
	movs r1, 0x8
	bl sub_80F9520
	bl BuyMenuFreeMemory
	bl sub_80FEFA4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810A198
	ldr r5, _0810A17C
	ldr r0, _0810A180
	ldrb r1, [r0]
	ldr r0, _0810A184
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r0, _0810A188
	ldr r1, _0810A18C
	ldrh r1, [r1]
	lsls r1, 5
	ldr r4, _0810A190
	adds r1, r4
	bl StringCopy
	ldr r0, _0810A194
	ldrh r1, [r5]
	lsls r1, 5
	adds r1, r4
	bl StringCopy
	b _0810A1A0
	.align 2, 0
_0810A178: .4byte gUnknown_020388F7
_0810A17C: .4byte gSpecialVar_0x8006
_0810A180: .4byte gUnknown_020388F5
_0810A184: .4byte gUnknown_020388D0
_0810A188: .4byte gStringVar3
_0810A18C: .4byte gSpecialVar_0x8004
_0810A190: .4byte 0x083f7bf1
_0810A194: .4byte gStringVar2
_0810A198:
	ldr r1, _0810A1B0
	ldr r2, _0810A1B4
	adds r0, r2, 0
	strh r0, [r1]
_0810A1A0:
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A1B0: .4byte gSpecialVar_0x8006
_0810A1B4: .4byte 0x0000ffff
	thumb_func_end sub_8109D04

	thumb_func_start sub_8109DAC
sub_8109DAC: @ 810A1B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0810A1E8
	movs r0, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A1E8: .4byte gSpecialVar_0x8006
	thumb_func_end sub_8109DAC

	thumb_func_start sub_8109DE0
sub_8109DE0: @ 810A1EC
	push {r4-r6,lr}
	ldr r4, _0810A22C
	ldr r6, _0810A230
	ldrb r0, [r6]
	bl sub_81340A8
	ldr r0, _0810A234
	ldrb r0, [r0]
	bl IsThereStorageSpaceForDecoration
	ldr r5, _0810A238
	ldrh r1, [r5]
	movs r0, 0xB
	muls r0, r1
	adds r0, 0x5
	adds r0, r4
	ldr r1, _0810A23C
	bl StringCopy
	adds r0, r4, 0x1
	ldrh r5, [r5]
	adds r0, r5
	ldrh r1, [r6]
	strb r1, [r0]
	bl sub_810993C
	adds r4, 0x31
	movs r0, 0x1
	strb r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A22C: .4byte 0x020284c8
_0810A230: .4byte gSpecialVar_0x8006
_0810A234: .4byte gSpecialVar_0x8004
_0810A238: .4byte gSpecialVar_0x8005
_0810A23C: .4byte gSaveBlock2
	thumb_func_end sub_8109DE0

	thumb_func_start sub_8109E34
sub_8109E34: @ 810A240
	push {lr}
	ldr r0, _0810A258
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl sub_8109A48
	pop {r0}
	bx r0
	.align 2, 0
_0810A258: .4byte sub_8109B7C
	thumb_func_end sub_8109E34

	.align 2, 0 @ Don't pad with nop.
