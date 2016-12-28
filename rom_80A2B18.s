	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A2B18
sub_80A2B18: @ 80A2B18
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080A2B3C @ =gSaveBlock1 + 0x2B4C
_080A2B1E:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl sub_80A2B40
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080A2B1E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B3C: .4byte gSaveBlock1 + 0x2B4C
	thumb_func_end sub_80A2B18

	thumb_func_start sub_80A2B40
sub_80A2B40: @ 80A2B40
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, _080A2B90 @ =0x0000ffff
	adds r4, r0, 0
	adds r1, r3, 0
	movs r2, 0x8
_080A2B4C:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080A2B4C
	movs r2, 0
	adds r6, r3, 0
	adds r6, 0x1A
	adds r4, r3, 0
	adds r4, 0x12
	movs r5, 0xFF
_080A2B66:
	adds r1, r4, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _080A2B66
	adds r1, r6, 0
	movs r2, 0
	adds r0, r1, 0x3
_080A2B7A:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080A2B7A
	movs r1, 0
	movs r0, 0x1
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B90: .4byte 0x0000ffff
	thumb_func_end sub_80A2B40

	thumb_func_start sub_80A2B94
sub_80A2B94: @ 80A2B94
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _080A2BBC
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	cmp r0, 0xFF
	beq _080A2BBC
	movs r0, 0x1
	b _080A2BBE
_080A2BBC:
	movs r0, 0
_080A2BBE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2B94

	thumb_func_start sub_80A2BC4
sub_80A2BC4: @ 80A2BC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r7, r0, 0
	lsls r1, 16
	lsrs r0, r1, 16
	str r0, [sp, 0x8]
	mov r0, sp
	movs r2, 0
	ldrb r3, [r0, 0x8]
	strb r3, [r0]
	lsrs r1, 24
	strb r1, [r0, 0x1]
	add r3, sp, 0x4
	strb r2, [r3]
	mov r10, r3
	ldr r4, _080A2D00 @ =gSaveBlock1
	mov r9, r4
	mov r8, r3
	adds r2, r3, 0
_080A2BF2:
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldr r5, _080A2D04 @ =0x00002b6c
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _080A2C08
	b _080A2D24
_080A2C08:
	movs r3, 0
	ldr r0, _080A2D08 @ =gSaveBlock2
	mov r12, r0
	mov r4, r10
	ldr r6, _080A2D0C @ =gSaveBlock1 + 0x2B4C
	ldr r1, _080A2D10 @ =0x0000ffff
	adds r5, r1, 0
_080A2C16:
	lsls r2, r3, 1
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	adds r2, r6
	ldrh r0, [r2]
	orrs r0, r5
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x8
	bls _080A2C16
	movs r3, 0
	mov r2, r10
	ldr r4, _080A2D14 @ =gSaveBlock1 + 0x2B5E
_080A2C3A:
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r4
	mov r5, r12
	adds r1, r3, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x6
	bls _080A2C3A
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, _080A2D14 @ =gSaveBlock1 + 0x2B5E
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r3, _080A2D14 @ =gSaveBlock1 + 0x2B5E
	adds r0, r3
	movs r1, 0
	bl sub_814A518
	movs r3, 0
	mov r2, r10
	ldr r5, _080A2D18 @ =gSaveBlock1 + 0x2B66
	ldr r4, _080A2D1C @ =0x02024eae
_080A2C88:
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r5
	adds r1, r3, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080A2C88
	adds r0, r7, 0
	movs r1, 0xB
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_80A2D44
	mov r4, r8
	ldrb r2, [r4]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	add r1, r9
	ldr r5, _080A2D20 @ =0x00002b6a
	adds r1, r5
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldr r1, _080A2D04 @ =0x00002b6c
	adds r0, r1
	mov r2, sp
	ldrh r2, [r2, 0x8]
	strh r2, [r0]
	adds r0, r7, 0
	movs r1, 0x40
	mov r2, r8
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	ldrb r0, [r4]
	b _080A2D32
	.align 2, 0
_080A2D00: .4byte gSaveBlock1
_080A2D04: .4byte 0x00002b6c
_080A2D08: .4byte gSaveBlock2
_080A2D0C: .4byte gSaveBlock1 + 0x2B4C
_080A2D10: .4byte 0x0000ffff
_080A2D14: .4byte gSaveBlock1 + 0x2B5E
_080A2D18: .4byte gSaveBlock1 + 0x2B66
_080A2D1C: .4byte 0x02024eae
_080A2D20: .4byte 0x00002b6a
_080A2D24:
	adds r0, r1, 0x1
	strb r0, [r3]
	ldrb r0, [r2]
	cmp r0, 0x5
	bhi _080A2D30
	b _080A2BF2
_080A2D30:
	movs r0, 0xFF
_080A2D32:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2BC4

	thumb_func_start sub_80A2D44
sub_80A2D44: @ 80A2D44
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _080A2D5C
	adds r0, r1, 0
	bl sub_809D474
	lsls r0, 16
	ldr r1, _080A2D60 @ =0x75300000
	adds r0, r1
	lsrs r0, 16
_080A2D5C:
	pop {r1}
	bx r1
	.align 2, 0
_080A2D60: .4byte 0x75300000
	thumb_func_end sub_80A2D44

	thumb_func_start sub_80A2D64
sub_80A2D64: @ 80A2D64
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080A2D7C @ =0xffff8ad0
	adds r2, r3, r0
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x1B
	bhi _080A2D80
	movs r0, 0xC9
	strh r2, [r1]
	b _080A2D82
	.align 2, 0
_080A2D7C: .4byte 0xffff8ad0
_080A2D80:
	adds r0, r3, 0
_080A2D82:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2D64

	thumb_func_start sub_80A2D88
sub_80A2D88: @ 80A2D88
	push {r4-r7,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r7, r1, 0
	ldrh r5, [r7, 0x20]
	adds r1, r5, 0
	bl sub_80A2BC4
	add r4, sp, 0x4
	strb r0, [r4]
	ldrb r2, [r4]
	cmp r2, 0xFF
	beq _080A2DE8
	ldr r0, _080A2DE0 @ =gSaveBlock1
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _080A2DE4 @ =0x00002b4c
	adds r1, r0
	adds r0, r7, 0
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl SetMonData
	mov r0, sp
	strb r5, [r0]
	mov r1, sp
	lsrs r0, r5, 8
	strb r0, [r1, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	ldrb r0, [r4]
	b _080A2DEA
	.align 2, 0
_080A2DE0: .4byte gSaveBlock1
_080A2DE4: .4byte 0x00002b4c
_080A2DE8:
	movs r0, 0xFF
_080A2DEA:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2D88

	thumb_func_start unref_sub_80A2DF4
unref_sub_80A2DF4: @ 80A2DF4
	movs r0, 0
	bx lr
	thumb_func_end unref_sub_80A2DF4

	thumb_func_start sub_80A2DF8
sub_80A2DF8: @ 80A2DF8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	bl sub_80A2B94
	lsls r0, 24
	cmp r0, 0
	beq _080A2E46
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	add r2, sp, 0x4
	strb r0, [r2]
	ldr r3, _080A2E50 @ =gSaveBlock1
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080A2E54 @ =0x00002b6c
	adds r0, r1
	movs r3, 0
	movs r1, 0
	strh r1, [r0]
	movs r0, 0xFF
	strb r0, [r2]
	mov r0, sp
	strb r3, [r0]
	strb r3, [r0, 0x1]
	adds r0, r4, 0
	movs r1, 0x40
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
_080A2E46:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E50: .4byte gSaveBlock1
_080A2E54: .4byte 0x00002b6c
	thumb_func_end sub_80A2DF8

	thumb_func_start unref_sub_80A2E58
unref_sub_80A2E58: @ 80A2E58
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A2E70 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080A2E74 @ =0x00002b6c
	adds r1, r0
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080A2E70: .4byte gSaveBlock1
_080A2E74: .4byte 0x00002b6c
	thumb_func_end unref_sub_80A2E58

	thumb_func_start sub_80A2E78
sub_80A2E78: @ 80A2E78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	adds r5, r0, 0
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	add r1, sp, 0x4
	movs r0, 0xFF
	strb r0, [r1]
	movs r7, 0x6
	mov r9, r1
	ldr r0, _080A2F04 @ =gSaveBlock1
	mov r8, r0
	ldr r2, _080A2F08 @ =0x00002b4c
	add r2, r8
_080A2E9E:
	lsls r0, r7, 3
	adds r0, r7
	lsls r4, r0, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r3, _080A2F0C @ =0x00002b6c
	adds r0, r3
	ldrh r6, [r0]
	cmp r6, 0
	bne _080A2F10
	adds r4, r2
	adds r0, r5, 0
	movs r1, 0x40
	str r2, [sp, 0x8]
	bl GetMonData
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r2, [sp, 0x8]
	adds r1, r2
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldr r0, _080A2F0C @ =0x00002b6c
	adds r1, r0
	strh r6, [r1]
	adds r0, r5, 0
	movs r1, 0x40
	mov r2, r9
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r7, 0
	b _080A2F1C
	.align 2, 0
_080A2F04: .4byte gSaveBlock1
_080A2F08: .4byte 0x00002b4c
_080A2F0C: .4byte 0x00002b6c
_080A2F10:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _080A2E9E
	movs r0, 0xFF
_080A2F1C:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2E78

	thumb_func_start itemid_is_mail
itemid_is_mail: @ 80A2F2C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bgt _080A2F3E
	cmp r0, 0x79
	blt _080A2F3E
	movs r0, 0x1
	b _080A2F40
_080A2F3E:
	movs r0, 0
_080A2F40:
	pop {r1}
	bx r1
	thumb_func_end itemid_is_mail

	thumb_func_start unref_sub_80A2F44
unref_sub_80A2F44: @ 80A2F44
	push {lr}
	bl sub_8071C20
	bl AddMapNamePopUpWindowTask
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80A2F44

	thumb_func_start AddMapNamePopUpWindowTask
AddMapNamePopUpWindowTask: @ 80A2F54
	push {r4,r5,lr}
	movs r0, 0x80
	lsls r0, 7
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A2FE4
	ldr r4, _080A2FAC @ =sub_80A2FF4
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A2FBC
	adds r0, r4, 0
	movs r1, 0x5A
	bl CreateTask
	ldr r4, _080A2FB0 @ =gUnknown_02038538
	strb r0, [r4]
	ldr r1, _080A2FB4 @ =REG_BG0VOFS
	movs r0, 0x20
	strh r0, [r1]
	bl sub_80A30E0
	ldr r2, _080A2FB8 @ =gTasks
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	strh r5, [r0, 0x8]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	strh r1, [r0, 0xC]
	b _080A2FE4
	.align 2, 0
_080A2FAC: .4byte sub_80A2FF4
_080A2FB0: .4byte gUnknown_02038538
_080A2FB4: .4byte REG_BG0VOFS
_080A2FB8: .4byte gTasks
_080A2FBC:
	ldr r3, _080A2FEC @ =gTasks
	ldr r2, _080A2FF0 @ =gUnknown_02038538
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r4, 0x8
	ldrsh r0, [r1, r4]
	cmp r0, 0x2
	beq _080A2FD6
	movs r0, 0x2
	strh r0, [r1, 0x8]
_080A2FD6:
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080A2FE4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FEC: .4byte gTasks
_080A2FF0: .4byte gUnknown_02038538
	thumb_func_end AddMapNamePopUpWindowTask

	thumb_func_start sub_80A2FF4
sub_80A2FF4: @ 80A2FF4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r3, _080A3018 @ =gTasks
	adds r4, r1, r3
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080A304C
	cmp r2, 0x1
	bgt _080A301C
	cmp r2, 0
	beq _080A3026
	b _080A3092
	.align 2, 0
_080A3018: .4byte gTasks
_080A301C:
	cmp r2, 0x2
	beq _080A3064
	cmp r2, 0x4
	beq _080A308C
	b _080A3092
_080A3026:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _080A3092
	movs r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080A3048 @ =gUnknown_02038538
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r2, [r0, 0xA]
	b _080A3092
	.align 2, 0
_080A3048: .4byte gUnknown_02038538
_080A304C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _080A3092
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080A3092
_080A3064:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	movs r5, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _080A3092
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A3086
	bl sub_80A30E0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xE]
	b _080A3092
_080A3086:
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _080A3098
_080A308C:
	bl HideMapNamePopUpWindow
	b _080A3098
_080A3092:
	ldr r1, _080A30A0 @ =REG_BG0VOFS
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
_080A3098:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A30A0: .4byte REG_BG0VOFS
	thumb_func_end sub_80A2FF4

	thumb_func_start HideMapNamePopUpWindow
HideMapNamePopUpWindow: @ 80A30A4
	push {lr}
	ldr r0, _080A30D4 @ =sub_80A2FF4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _080A30D0
	bl MenuLoadTextWindowGraphics
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x3
	bl MenuZeroFillWindowRect
	ldr r1, _080A30D8 @ =REG_BG0VOFS
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080A30DC @ =gUnknown_02038538
	ldrb r0, [r0]
	bl DestroyTask
_080A30D0:
	pop {r0}
	bx r0
	.align 2, 0
_080A30D4: .4byte sub_80A2FF4
_080A30D8: .4byte REG_BG0VOFS
_080A30DC: .4byte gUnknown_02038538
	thumb_func_end HideMapNamePopUpWindow

	thumb_func_start sub_80A30E0
sub_80A30E0: @ 80A30E0
	push {lr}
	sub sp, 0x14
	movs r0, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
	ldr r0, _080A3114 @ =gMapHeader
	ldrb r1, [r0, 0x14]
	mov r0, sp
	movs r2, 0
	bl sub_80FBFB4
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x3
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x60
	bl sub_8072BD8
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_080A3114: .4byte gMapHeader
	thumb_func_end sub_80A30E0

	.align 2, 0 @ Don't pad with nop.
