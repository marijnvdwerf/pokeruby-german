	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_813A584
sub_813A584: @ 813A960
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
	ldr r0, _0813A9AC
	mov r8, r0
	adds r4, r7, r0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	ldr r2, _0813A9B0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813A9C0
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	ldr r1, _0813A9B4
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, _0813A9B8
	adds r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	beq _0813A9BC
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	b _0813AA26
	.align 2, 0
_0813A9AC: .4byte 0x03004b38
_0813A9B0: .4byte gMain
_0813A9B4: .4byte gSaveBlock1
_0813A9B8: .4byte 0x0000049a
_0813A9BC:
	movs r0, 0x1
	b _0813AA26
_0813A9C0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813A9EC
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _0813A9D6
	subs r0, r1, 0x1
	b _0813AA26
_0813A9D6:
	ldr r0, _0813A9E4
	lsls r1, r3, 2
	adds r1, r0
	ldr r3, _0813A9E8
	adds r1, r3
	ldrh r0, [r1]
	b _0813AA26
	.align 2, 0
_0813A9E4: .4byte gSaveBlock1
_0813A9E8: .4byte 0x0000049a
_0813A9EC:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0813AA04
	ldrh r0, [r4, 0x6]
	subs r0, 0xA
	strh r0, [r4, 0x6]
	lsls r0, 16
	cmp r0, 0
	bgt _0813AA28
	movs r0, 0x1
	b _0813AA26
_0813AA04:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0813AA44
	ldrh r0, [r4, 0x6]
	adds r0, 0xA
	strh r0, [r4, 0x6]
	movs r0, 0x6
	ldrsh r2, [r4, r0]
	ldr r1, _0813AA3C
	lsls r0, r6, 2
	adds r0, r1
	ldr r1, _0813AA40
	adds r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	ble _0813AA28
_0813AA26:
	strh r0, [r4, 0x6]
_0813AA28:
	ldrh r0, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x9
	bl sub_80A418C
	b _0813AAC4
	.align 2, 0
_0813AA3C: .4byte gSaveBlock1
_0813AA40: .4byte 0x0000049a
_0813AA44:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813AA78
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0813AA70
	adds r0, r5, 0
	bl sub_813A6FC
	b _0813AAC4
_0813AA70:
	adds r0, r5, 0
	bl sub_813A794
	b _0813AAC4
_0813AA78:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813AAC4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0813AAD0
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r3, 0
	ldrsh r1, [r4, r3]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813AAD4
	str r1, [r0]
_0813AAC4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AAD0: .4byte gSaveBlock1
_0813AAD4: .4byte sub_813A280
	thumb_func_end sub_813A584

	thumb_func_start sub_813A6FC
sub_813A6FC: @ 813AAD8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 3
	ldr r7, _0813AB34
	adds r4, r6, r7
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	ldr r1, _0813AB38
	lsrs r0, 22
	adds r0, r1
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldrh r0, [r5]
	ldrh r1, [r4, 0x6]
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813AB4C
	ldrh r0, [r5]
	ldr r1, _0813AB3C
	bl CopyItemName
	ldr r0, _0813AB40
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0813AB44
	bl sub_813AD58
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813AB48
	b _0813AB5E
	.align 2, 0
_0813AB34: .4byte 0x03004b38
_0813AB38: .4byte gSaveBlock1
_0813AB3C: .4byte gStringVar1
_0813AB40: .4byte gStringVar2
_0813AB44: .4byte 0x0000fffd
_0813AB48: .4byte sub_813A8F0
_0813AB4C:
	movs r0, 0
	strh r0, [r4, 0x6]
	ldr r0, _0813AB68
	bl sub_813AD58
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0813AB6C
_0813AB5E:
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AB68: .4byte 0x0000fffa
_0813AB6C: .4byte sub_813A984
	thumb_func_end sub_813A6FC

	thumb_func_start sub_813A794
sub_813A794: @ 813AB70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0813ABD8
	mov r8, r0
	adds r4, r7, r0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	ldr r1, _0813ABDC
	lsrs r0, 22
	adds r0, r1
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldrh r0, [r5]
	bl ItemId_GetImportance
	lsls r0, 24
	cmp r0, 0
	bne _0813ABF0
	ldrh r0, [r5]
	ldr r1, _0813ABE0
	bl CopyItemName
	ldr r0, _0813ABE4
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _0813ABE8
	bl sub_813AD58
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0813ABEC
	adds r0, r6, 0
	bl sub_80F914C
	b _0813AC04
	.align 2, 0
_0813ABD8: .4byte 0x03004b38
_0813ABDC: .4byte gSaveBlock1
_0813ABE0: .4byte gStringVar1
_0813ABE4: .4byte gStringVar2
_0813ABE8: .4byte 0x0000fff8
_0813ABEC: .4byte gUnknown_084062E0
_0813ABF0:
	movs r0, 0
	strh r0, [r4, 0x6]
	ldr r0, _0813AC10
	bl sub_813AD58
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0813AC14
	str r1, [r0]
_0813AC04:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AC10: .4byte 0x0000fff9
_0813AC14: .4byte sub_813A8F0
	thumb_func_end sub_813A794

	thumb_func_start sub_813A83C
sub_813A83C: @ 813AC18
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _0813AC48
	bl sub_813AD58
	ldr r1, _0813AC4C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813AC50
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AC48: .4byte 0x0000fffb
_0813AC4C: .4byte gTasks
_0813AC50: .4byte sub_813A8F0
	thumb_func_end sub_813A83C

	thumb_func_start sub_813A878
sub_813A878: @ 813AC54
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _0813ACC0
	adds r5, r4, r6
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0813ACC4
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	movs r3, 0
	ldrsh r1, [r5, r3]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0813ACC8
	str r0, [r4]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813ACC0: .4byte 0x03004b38
_0813ACC4: .4byte gSaveBlock1
_0813ACC8: .4byte sub_813A280
	thumb_func_end sub_813A878

	thumb_func_start sub_813A8F0
sub_813A8F0: @ 813ACCC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0813AD58
	adds r5, r0, r1
	ldr r0, _0813AD5C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813ACEE
	cmp r1, 0x2
	bne _0813AD4E
_0813ACEE:
	ldrb r0, [r5, 0x2]
	ldrb r1, [r5]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x6]
	bl RemovePCItem
	ldrh r4, [r5, 0x4]
	bl CountUsedPCItemSlots
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x4]
	lsls r4, 16
	asrs r4, 16
	cmp r4, r0
	beq _0813AD2E
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	adds r0, r1
	cmp r4, r0
	bge _0813AD2E
	ldrh r1, [r5, 0x2]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0813AD2E
	subs r0, r1, 0x1
	strh r0, [r5, 0x2]
_0813AD2E:
	adds r0, r6, 0
	bl sub_813A240
	adds r0, r6, 0
	bl sub_813A9EC
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
_0813AD4E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813AD58: .4byte 0x03004b38
_0813AD5C: .4byte gMain
	thumb_func_end sub_813A8F0

	thumb_func_start sub_813A984
sub_813A984: @ 813AD60
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r5, _0813ADB8
	adds r3, r4, r5
	ldr r0, _0813ADBC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813AD80
	cmp r1, 0x2
	bne _0813ADB2
_0813AD80:
	ldr r2, _0813ADC0
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	movs r6, 0
	ldrsh r1, [r3, r6]
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	adds r0, r5, 0
	subs r0, 0x8
	adds r0, r4, r0
	ldr r1, _0813ADC4
	str r1, [r0]
_0813ADB2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813ADB8: .4byte 0x03004b38
_0813ADBC: .4byte gMain
_0813ADC0: .4byte gSaveBlock1
_0813ADC4: .4byte sub_813A280
	thumb_func_end sub_813A984

	thumb_func_start sub_813A9EC
sub_813A9EC: @ 813ADC8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x6
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	adds r0, r4, 0
	bl sub_813AE0C
	ldr r1, _0813AE04
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813AE08
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813AE04: .4byte gTasks
_0813AE08: .4byte sub_813A280
	thumb_func_end sub_813A9EC

	thumb_func_start sub_813AA30
sub_813AA30: @ 813AE0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813AE5C
	adds r4, r1, r0
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrb r0, [r4, 0x4]
	cmp r0, r5
	bls _0813AE64
	ldrb r0, [r4, 0x10]
	cmp r0, r5
	beq _0813AE64
	cmp r2, 0
	bne _0813AE64
	ldr r1, _0813AE60
	movs r0, 0x10
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	adds r2, r1
	ldr r3, [r2]
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	b _0813AE94
	.align 2, 0
_0813AE5C: .4byte 0x03004b38
_0813AE60: .4byte gSaveBlock1
_0813AE64:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _0813AE78
	ldr r0, _0813AE74
	bl sub_813AD58
	b _0813AE8A
	.align 2, 0
_0813AE74: .4byte 0x0000ffff
_0813AE78:
	ldr r0, _0813AE9C
	lsls r1, r5, 2
	adds r1, r0
	movs r2, 0x93
	lsls r2, 3
	adds r1, r2
	ldrh r0, [r1]
	bl sub_813AD58
_0813AE8A:
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
_0813AE94:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AE9C: .4byte gSaveBlock1
	thumb_func_end sub_813AA30

	thumb_func_start sub_813AAC4
sub_813AAC4: @ 813AEA0
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, [sp, 0x14]
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0813AED0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4164
	cmp r6, 0
	beq _0813AED8
	ldr r0, _0813AED4
	movs r1, 0x1A
	adds r2, r7, 0
	bl MenuPrint
	b _0813AEE2
	.align 2, 0
_0813AED0: .4byte gStringVar1
_0813AED4: .4byte gUnknown_0840632A
_0813AED8:
	ldr r0, _0813AEE8
	movs r1, 0x1A
	adds r2, r7, 0
	bl MenuPrint
_0813AEE2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813AEE8: .4byte gUnknown_08406327
	thumb_func_end sub_813AAC4

	thumb_func_start sub_813AB10
sub_813AB10: @ 813AEEC
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0813AF00
	movs r1, 0x19
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0813AF00: .4byte gUnknown_08406330
	thumb_func_end sub_813AB10

	thumb_func_start sub_813AB28
sub_813AB28: @ 813AF04
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldrh r0, [r0]
	ldr r1, _0813AF24
	bl CopyItemName
	cmp r4, 0
	beq _0813AF2C
	ldr r0, _0813AF28
	movs r1, 0x10
	adds r2, r5, 0
	bl MenuPrint
	b _0813AF36
	.align 2, 0
_0813AF24: .4byte gStringVar1
_0813AF28: .4byte gUnknown_0840631E
_0813AF2C:
	ldr r0, _0813AF3C
	movs r1, 0x10
	adds r2, r5, 0
	bl MenuPrint
_0813AF36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813AF3C: .4byte gUnknown_08406318
	thumb_func_end sub_813AB28

	thumb_func_start sub_813AB64
sub_813AB64: @ 813AF40
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_813AB28
	ldrh r0, [r6, 0x2]
	str r5, [sp]
	movs r1, 0x1
	adds r2, r4, 0
	movs r3, 0x3
	bl sub_813AAC4
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813AB64

	thumb_func_start sub_813AB90
sub_813AB90: @ 813AF6C
	push {r4,lr}
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_813AB28
	adds r0, r4, 0
	bl sub_813AB10
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813AB90

	thumb_func_start sub_813ABAC
sub_813ABAC: @ 813AF88
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r1, 24
	lsrs r5, r1, 24
	adds r1, r5, 0
	bl sub_813AB28
	ldrh r1, [r4]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _0813AFB4
	ldrh r0, [r4, 0x2]
	str r6, [sp]
	movs r1, 0x1
	adds r2, r5, 0
	movs r3, 0x3
	bl sub_813AAC4
	b _0813AFBA
_0813AFB4:
	adds r0, r5, 0
	bl sub_813AB10
_0813AFBA:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813ABAC

	thumb_func_start sub_813ABE8
sub_813ABE8: @ 813AFC4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0813AFE8
	adds r6, r1, r0
	movs r0, 0
	mov r8, r0
	ldrh r5, [r6, 0x2]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	b _0813B0A0
	.align 2, 0
_0813AFE8: .4byte 0x03004b38
_0813AFEC:
	subs r0, r5, r1
	lsls r0, 17
	lsrs r0, 16
	mov r8, r0
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r5, r0
	beq _0813B0E0
	movs r7, 0
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0813B010
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r5, r0
	bne _0813B010
	movs r7, 0x1
_0813B010:
	ldr r0, _0813B038
	lsls r4, r5, 2
	adds r0, r4, r0
	movs r2, 0x93
	lsls r2, 3
	adds r0, r2
	ldrh r0, [r0]
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x4
	bhi _0813B096
	lsls r0, 2
	ldr r1, _0813B03C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813B038: .4byte gSaveBlock1
_0813B03C: .4byte _0813B040
	.align 2, 0
_0813B040:
	.4byte _0813B054
	.4byte _0813B054
	.4byte _0813B084
	.4byte _0813B054
	.4byte _0813B06C
_0813B054:
	ldr r0, _0813B068
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813AB64
	b _0813B096
	.align 2, 0
_0813B068: .4byte 0x02025bcc
_0813B06C:
	ldr r0, _0813B080
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813AB90
	b _0813B096
	.align 2, 0
_0813B080: .4byte 0x02025bcc
_0813B084:
	ldr r0, _0813B0DC
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r7, 0
	bl sub_813ABAC
_0813B096:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x2
	ldrsh r1, [r6, r0]
_0813B0A0:
	movs r2, 0x8
	ldrsh r0, [r6, r2]
	adds r0, r1, r0
	cmp r5, r0
	blt _0813AFEC
_0813B0AA:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	subs r0, r5, r0
	cmp r0, 0x7
	bgt _0813B0C6
	mov r1, r8
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x10
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
_0813B0C6:
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0813B0FC
	movs r0, 0
	movs r1, 0xB8
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
	b _0813B102
	.align 2, 0
_0813B0DC: .4byte 0x02025bcc
_0813B0E0:
	ldr r0, _0813B0F8
	mov r2, r8
	adds r2, 0x2
	lsls r2, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x80
	movs r3, 0x68
	bl sub_8072A18
	b _0813B0AA
	.align 2, 0
_0813B0F8: .4byte gOtherText_CancelNoTerminator
_0813B0FC:
	movs r0, 0
	bl DestroyVerticalScrollIndicator
_0813B102:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x8
	ldrsh r1, [r6, r2]
	adds r0, r1
	movs r2, 0x4
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bgt _0813B120
	movs r0, 0x1
	movs r1, 0xB8
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
	b _0813B126
_0813B120:
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0813B126:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813ABE8

	thumb_func_start sub_813AD58
sub_813AD58: @ 813B134
	push {lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _0813B150
	adds r0, r1, r2
	cmp r0, 0x8
	bhi _0813B1C4
	lsls r0, 2
	ldr r1, _0813B154
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813B150: .4byte 0xffff0009
_0813B154: .4byte _0813B158
	.align 2, 0
_0813B158:
	.4byte _0813B1BC
	.4byte _0813B1B4
	.4byte _0813B1AC
	.4byte _0813B1A4
	.4byte _0813B19C
	.4byte _0813B194
	.4byte _0813B18C
	.4byte _0813B184
	.4byte _0813B17C
_0813B17C:
	ldr r1, _0813B180
	b _0813B1CC
	.align 2, 0
_0813B180: .4byte gMenuText_GoBackToPrev
_0813B184:
	ldr r1, _0813B188
	b _0813B1CC
	.align 2, 0
_0813B188: .4byte gOtherText_HowManyToWithdraw
_0813B18C:
	ldr r1, _0813B190
	b _0813B1CC
	.align 2, 0
_0813B190: .4byte gOtherText_WithdrewThing
_0813B194:
	ldr r1, _0813B198
	b _0813B1CC
	.align 2, 0
_0813B198: .4byte gOtherText_HowManyToToss
_0813B19C:
	ldr r1, _0813B1A0
	b _0813B1CC
	.align 2, 0
_0813B1A0: .4byte gOtherText_ThrewAwayItem
_0813B1A4:
	ldr r1, _0813B1A8
	b _0813B1CC
	.align 2, 0
_0813B1A8: .4byte gOtherText_NoMoreRoom
_0813B1AC:
	ldr r1, _0813B1B0
	b _0813B1CC
	.align 2, 0
_0813B1B0: .4byte gOtherText_TooImportant
_0813B1B4:
	ldr r1, _0813B1B8
	b _0813B1CC
	.align 2, 0
_0813B1B8: .4byte gOtherText_OkayToThrowAwayPrompt
_0813B1BC:
	ldr r1, _0813B1C0
	b _0813B1CC
	.align 2, 0
_0813B1C0: .4byte gOtherText_SwitchWhichItem
_0813B1C4:
	adds r0, r1, 0
	bl ItemId_GetDescription
	adds r1, r0, 0
_0813B1CC:
	movs r0, 0x30
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r1, 0
	movs r1, 0x8
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_813AD58

	thumb_func_start sub_813AE0C
sub_813AE0C: @ 813B1E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _0813B224
	adds r4, r1, r2
	ldrh r1, [r4]
	ldrh r2, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r5, r1, 16
	bl sub_813ABE8
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813B23E
	lsls r0, r5, 16
	asrs r1, r0, 16
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0813B22C
	ldr r0, _0813B228
	bl sub_813AD58
	b _0813B23E
	.align 2, 0
_0813B224: .4byte 0x03004b38
_0813B228: .4byte 0x0000ffff
_0813B22C:
	ldr r0, _0813B244
	lsls r1, 2
	adds r1, r0
	movs r0, 0x93
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	bl sub_813AD58
_0813B23E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B244: .4byte gSaveBlock1
	thumb_func_end sub_813AE0C

	thumb_func_start sub_813AE6C
sub_813AE6C: @ 813B248
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	ldr r0, _0813B2D4
	adds r5, r0
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	bl sub_813AF04
	movs r0, 0xF
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813B2D8
	movs r1, 0x93
	lsls r1, 3
	adds r0, r1
	ldrh r0, [r0]
	bl sub_813AD58
	ldr r0, _0813B2DC
	lsls r4, 3
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	adds r0, r6, 0
	bl sub_813ABE8
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B2D4: .4byte 0x03004b38
_0813B2D8: .4byte gSaveBlock1
_0813B2DC: .4byte gUnknown_084062C0
	thumb_func_end sub_813AE6C

	thumb_func_start sub_813AF04
sub_813AF04: @ 813B2E0
	push {lr}
	sub sp, 0x8
	ldr r1, _0813B314
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r0, sp, 0x4
	movs r1, 0xDF
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0813B314: .4byte gUnknown_08406334
	thumb_func_end sub_813AF04

	thumb_func_start sub_813AF3C
sub_813AF3C: @ 813B318
	push {r4,lr}
	movs r2, 0
	movs r1, 0x6
	ldr r4, _0813B34C
	ldr r3, _0813B350
_0813B322:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813B338
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0813B338:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0813B322
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0813B34C: .4byte gSaveBlock1
_0813B350: .4byte 0x00002b6c
	thumb_func_end sub_813AF3C

	thumb_func_start sub_813AF78
sub_813AF78: @ 813B354
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	movs r2, 0x6
_0813B362:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r3, r0, 24
	mov r10, r1
	cmp r3, 0xF
	bhi _0813B3D0
	ldr r0, _0813B3EC
	mov r12, r0
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	add r0, r12
	ldr r1, _0813B3F0
	adds r1, r0
	mov r8, r1
	ldr r2, _0813B3F4
	mov r9, r2
	adds r4, r0, r2
_0813B386:
	mov r5, r8
	ldrh r0, [r5]
	cmp r0, 0
	bne _0813B3C6
	mov r1, sp
	adds r0, r4, 0
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	add r2, r12
	add r2, r9
	adds r1, r4, 0
	adds r0, r2, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	mov r0, sp
	ldm r0!, {r1,r5,r7}
	stm r2!, {r1,r5,r7}
	ldm r0!, {r1,r6,r7}
	stm r2!, {r1,r6,r7}
	ldm r0!, {r5-r7}
	stm r2!, {r5-r7}
_0813B3C6:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0813B386
_0813B3D0:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0xE
	bls _0813B362
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813B3EC: .4byte gSaveBlock1
_0813B3F0: .4byte 0x00002b6c
_0813B3F4: .4byte 0x00002b4c
	thumb_func_end sub_813AF78

	thumb_func_start sub_813B01C
sub_813B01C: @ 813B3F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	ldr r1, _0813B494
	ldrb r4, [r1, 0x2]
	ldrb r0, [r1, 0x1]
	adds r0, r4, r0
	cmp r4, r0
	bge _0813B466
	adds r6, r1, 0
	ldr r0, _0813B498
	mov r8, r0
_0813B412:
	ldrb r0, [r6, 0x2]
	subs r0, r4, r0
	lsls r0, 17
	lsrs r7, r0, 16
	adds r0, r7, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, r7, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x15
	adds r1, r5, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	beq _0813B4A0
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0813B49C
	adds r1, r0
	mov r0, r8
	bl StringCopy
	mov r0, r8
	bl sub_814A568
	mov r0, r8
	movs r1, 0x15
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6, 0x2]
	ldrb r1, [r6, 0x1]
	adds r0, r1
	cmp r4, r0
	blt _0813B412
_0813B466:
	ldr r5, _0813B494
	ldrb r0, [r5, 0x2]
	subs r0, r4, r0
	cmp r0, 0x8
	beq _0813B480
	adds r1, r7, 0x4
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x15
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
_0813B480:
	ldrb r0, [r5, 0x2]
	cmp r0, 0
	beq _0813B4B0
	movs r0, 0
	movs r1, 0xC8
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
	b _0813B4B6
	.align 2, 0
_0813B494: .4byte 0x0201fe00
_0813B498: .4byte gStringVar1
_0813B49C: .4byte 0x0202836a
_0813B4A0:
	ldr r0, _0813B4AC
	movs r1, 0x15
	adds r2, r5, 0
	bl MenuPrint
	b _0813B466
	.align 2, 0
_0813B4AC: .4byte gOtherText_CancelNoTerminator
_0813B4B0:
	movs r0, 0
	bl DestroyVerticalScrollIndicator
_0813B4B6:
	ldr r0, _0813B4D0
	ldrb r1, [r0, 0x2]
	ldrb r2, [r0, 0x1]
	adds r1, r2
	ldrb r0, [r0, 0x3]
	cmp r1, r0
	bgt _0813B4D4
	movs r0, 0x1
	movs r1, 0xC8
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
	b _0813B4DA
	.align 2, 0
_0813B4D0: .4byte 0x0201fe00
_0813B4D4:
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0813B4DA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813B01C

	thumb_func_start sub_813B108
sub_813B108: @ 813B4E4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813B548
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	bl sub_813B01C
	ldr r0, _0813B54C
	ldrb r3, [r0, 0x1]
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x15
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B548: .4byte gPCText_Mailbox
_0813B54C: .4byte 0x0201fe00
	thumb_func_end sub_813B108

	thumb_func_start sub_813B174
sub_813B174: @ 813B550
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _0813B588
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0813B650
	ldr r2, _0813B58C
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813B5A6
	ldr r4, _0813B590
	ldrb r0, [r4]
	cmp r0, 0
	beq _0813B594
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _0813B5C2
	.align 2, 0
_0813B588: .4byte gPaletteFade
_0813B58C: .4byte gMain
_0813B590: .4byte 0x0201fe00
_0813B594:
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _0813B650
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	b _0813B5E4
_0813B5A6:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0813B5EE
	ldr r4, _0813B5CC
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	cmp r1, r0
	beq _0813B5D0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_0813B5C2:
	bl MoveMenuCursor
	strb r0, [r4]
	b _0813B650
	.align 2, 0
_0813B5CC: .4byte 0x0201fe00
_0813B5D0:
	ldrb r0, [r4, 0x2]
	adds r0, r1
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0813B650
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x2]
	adds r0, 0x1
_0813B5E4:
	strb r0, [r4, 0x2]
	adds r0, r5, 0
	bl sub_813B01C
	b _0813B650
_0813B5EE:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813B638
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0813B618
	ldrb r1, [r0, 0x2]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x3]
	cmp r1, r0
	bne _0813B61C
	adds r0, r5, 0
	bl sub_813B320
	b _0813B650
	.align 2, 0
_0813B618: .4byte 0x0201fe00
_0813B61C:
	bl sub_813B27C
	ldr r0, _0813B630
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B634
	str r0, [r1]
	b _0813B650
	.align 2, 0
_0813B630: .4byte gTasks
_0813B634: .4byte sub_813B294
_0813B638:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813B650
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_813B320
_0813B650:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B174

	thumb_func_start sub_813B27C
sub_813B27C: @ 813B658
	push {lr}
	bl BuyMenuFreeMemory
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	pop {r0}
	bx r0
	thumb_func_end sub_813B27C

	thumb_func_start sub_813B294
sub_813B294: @ 813B670
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r4, _0813B6C4
	ldr r1, _0813B6C8
	ldrb r0, [r1]
	adds r0, 0x6
	ldrb r1, [r1, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813B6CC
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	ldr r4, _0813B6D0
	ldr r1, _0813B6D4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _0813B6D8
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813B6C4: .4byte gStringVar1
_0813B6C8: .4byte 0x0201fe00
_0813B6CC: .4byte 0x02028292
_0813B6D0: .4byte gStringVar4
_0813B6D4: .4byte gOtherText_WhatWillYouDoMail
_0813B6D8: .4byte sub_813B348
	thumb_func_end sub_813B294

	thumb_func_start sub_813B300
sub_813B300: @ 813B6DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl ReshowPlayerPC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B300

	thumb_func_start sub_813B320
sub_813B320: @ 813B6FC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_813B27C
	ldr r1, _0813B71C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B720
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B71C: .4byte gTasks
_0813B720: .4byte sub_813B300
	thumb_func_end sub_813B320

	thumb_func_start sub_813B348
sub_813B348: @ 813B724
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _0813B770
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	ldr r1, _0813B774
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B778
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B770: .4byte gUnknown_084062F8
_0813B774: .4byte gTasks
_0813B778: .4byte sub_813B3A0
	thumb_func_end sub_813B348

	thumb_func_start sub_813B3A0
sub_813B3A0: @ 813B77C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _0813B7A0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0813B7A4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0813B7FC
	.align 2, 0
_0813B7A0: .4byte gMain
_0813B7A4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0813B7BA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0813B7FC
_0813B7BA:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813B7E8
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0813B7E4
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0813B7FC
	.align 2, 0
_0813B7E4: .4byte gUnknown_084062F8
_0813B7E8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0813B7FC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl Mailbox_Cancel
_0813B7FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813B3A0

	thumb_func_start Mailbox_Read
Mailbox_Read: @ 813B804
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _0813B828
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813B82C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B828: .4byte gTasks
_0813B82C: .4byte sub_813B454
	thumb_func_end Mailbox_Read

	thumb_func_start sub_813B454
sub_813B454: @ 813B830
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813B86C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813B864
	ldr r0, _0813B870
	ldrb r1, [r0]
	adds r1, 0x6
	ldrb r0, [r0, 0x2]
	adds r1, r0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813B874
	adds r0, r1
	ldr r1, _0813B878
	movs r2, 0x1
	bl sub_80F890C
	adds r0, r4, 0
	bl DestroyTask
_0813B864:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B86C: .4byte gPaletteFade
_0813B870: .4byte 0x0201fe00
_0813B874: .4byte 0x02028280
_0813B878: .4byte sub_813B4F0
	thumb_func_end sub_813B454

	thumb_func_start sub_813B4A0
sub_813B4A0: @ 813B87C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813B89C
	ldr r0, _0813B8A4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813B8A8
	str r0, [r1]
_0813B89C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B8A4: .4byte gTasks
_0813B8A8: .4byte sub_813B174
	thumb_func_end sub_813B4A0

	thumb_func_start sub_813B4D0
sub_813B4D0: @ 813B8AC
	push {lr}
	ldr r0, _0813B8C8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl sub_813B108
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0813B8C8: .4byte sub_813B4A0
	thumb_func_end sub_813B4D0

	thumb_func_start sub_813B4F0
sub_813B4F0: @ 813B8CC
	push {lr}
	ldr r0, _0813B8E0
	ldr r1, _0813B8E4
	str r1, [r0]
	ldr r0, _0813B8E8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813B8E0: .4byte gUnknown_0300485C
_0813B8E4: .4byte sub_813B4D0
_0813B8E8: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_813B4F0

	thumb_func_start Mailbox_MoveToBag
Mailbox_MoveToBag: @ 813B8EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r0, _0813B91C
	ldr r1, _0813B920
	bl StringCopy
	ldr r0, _0813B924
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	ldr r1, _0813B928
	ldr r2, _0813B92C
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B91C: .4byte gStringVar1
_0813B920: .4byte gOtherText_MoveToBag
_0813B924: .4byte gUnknown_0840633A
_0813B928: .4byte gOtherText_MessageWillBeLost
_0813B92C: .4byte sub_813B554
	thumb_func_end Mailbox_MoveToBag

	thumb_func_start sub_813B554
sub_813B554: @ 813B930
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0813B950
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813B950: .4byte gUnknown_084062E8
	thumb_func_end sub_813B554

	thumb_func_start sub_813B578
sub_813B578: @ 813B954
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0813B998
	ldrb r0, [r4]
	adds r0, 0x6
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0813B99C
	adds r6, r1, r0
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldrh r0, [r6, 0x20]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	bne _0813B9A8
	ldr r1, _0813B9A0
	ldr r2, _0813B9A4
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _0813B9DE
	.align 2, 0
_0813B998: .4byte 0x0201fe00
_0813B99C: .4byte 0x02028280
_0813B9A0: .4byte gOtherText_BagIsFull
_0813B9A4: .4byte sub_813B758
_0813B9A8:
	ldr r1, _0813B9E4
	ldr r2, _0813B9E8
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	adds r0, r6, 0
	bl sub_80A2B40
	bl sub_813AF78
	ldrb r0, [r4, 0x3]
	subs r0, 0x1
	strb r0, [r4, 0x3]
	ldrb r1, [r4, 0x3]
	ldrb r0, [r4, 0x1]
	ldrb r2, [r4, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _0813B9D8
	cmp r2, 0
	beq _0813B9D8
	subs r0, r2, 0x1
	strb r0, [r4, 0x2]
_0813B9D8:
	adds r0, r5, 0
	bl sub_813A240
_0813B9DE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813B9E4: .4byte gOtherText_MailWasReturned
_0813B9E8: .4byte sub_813B758
	thumb_func_end sub_813B578

	thumb_func_start sub_813B610
sub_813B610: @ 813B9EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_813B758
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813B610

	thumb_func_start Mailbox_Give
Mailbox_Give: @ 813BA0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _0813BA24
	adds r0, r4, 0
	bl sub_813B718
	b _0813BA3A
_0813BA24:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _0813BA40
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813BA44
	str r0, [r1]
_0813BA3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BA40: .4byte gTasks
_0813BA44: .4byte sub_813B66C
	thumb_func_end Mailbox_Give

	thumb_func_start sub_813B66C
sub_813B66C: @ 813BA48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813BA74
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813BA6C
	ldr r0, _0813BA78
	bl SetMainCallback2
	ldr r1, _0813BA7C
	movs r0, 0x3
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0813BA6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BA74: .4byte gPaletteFade
_0813BA78: .4byte sub_808B020
_0813BA7C: .4byte gUnknown_02038561
	thumb_func_end sub_813B66C

	thumb_func_start sub_813B6A4
sub_813B6A4: @ 813BA80
	push {r4-r6,lr}
	ldr r0, _0813BACC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0813BAD0
	ldrb r4, [r5, 0x3]
	bl sub_813AF3C
	strb r0, [r5, 0x3]
	bl sub_813AF78
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	beq _0813BAB6
	ldrb r1, [r5, 0x3]
	ldrb r0, [r5, 0x1]
	ldrb r2, [r5, 0x2]
	adds r0, r2
	cmp r1, r0
	bge _0813BAB6
	cmp r2, 0
	beq _0813BAB6
	subs r0, r2, 0x1
	strb r0, [r5, 0x2]
_0813BAB6:
	adds r0, r6, 0
	bl sub_813A240
	adds r0, r6, 0
	bl sub_813B108
	bl pal_fill_black
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BACC: .4byte sub_813B4A0
_0813BAD0: .4byte 0x0201fe00
	thumb_func_end sub_813B6A4

	thumb_func_start sub_813B6F8
sub_813B6F8: @ 813BAD4
	push {lr}
	ldr r0, _0813BAE8
	ldr r1, _0813BAEC
	str r1, [r0]
	ldr r0, _0813BAF0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813BAE8: .4byte gUnknown_0300485C
_0813BAEC: .4byte sub_813B6A4
_0813BAF0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_813B6F8

	thumb_func_start sub_813B718
sub_813B718: @ 813BAF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813BB08
	ldr r2, _0813BB0C
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r0}
	bx r0
	.align 2, 0
_0813BB08: .4byte gOtherText_NoPokemon
_0813BB0C: .4byte sub_813B758
	thumb_func_end sub_813B718

	thumb_func_start Mailbox_Cancel
Mailbox_Cancel: @ 813BB10
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_813B758
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Mailbox_Cancel

	thumb_func_start sub_813B758
sub_813B758: @ 813BB34
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_813B108
	ldr r1, _0813BB58
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813BB5C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BB58: .4byte gTasks
_0813BB5C: .4byte sub_813B174
	thumb_func_end sub_813B758

	.align 2, 0 @ Don't pad with nop.
