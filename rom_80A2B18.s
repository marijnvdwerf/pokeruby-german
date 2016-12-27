	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A2B18
sub_80A2B18: @ 80A2C68
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080A2C8C @ =0x02028280
_080A2C6E:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl sub_80A2B40
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080A2C6E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C8C: .4byte 0x02028280
	thumb_func_end sub_80A2B18

	thumb_func_start sub_80A2B40
sub_80A2B40: @ 80A2C90
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, _080A2CE0 @ =0x0000ffff
	adds r4, r0, 0
	adds r1, r3, 0
	movs r2, 0x8
_080A2C9C:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080A2C9C
	movs r2, 0
	adds r6, r3, 0
	adds r6, 0x1A
	adds r4, r3, 0
	adds r4, 0x12
	movs r5, 0xFF
_080A2CB6:
	adds r1, r4, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _080A2CB6
	adds r1, r6, 0
	movs r2, 0
	adds r0, r1, 0x3
_080A2CCA:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080A2CCA
	movs r1, 0
	movs r0, 0x1
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2CE0: .4byte 0x0000ffff
	thumb_func_end sub_80A2B40

	thumb_func_start sub_80A2B94
sub_80A2B94: @ 80A2CE4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _080A2D0C
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	cmp r0, 0xFF
	beq _080A2D0C
	movs r0, 0x1
	b _080A2D0E
_080A2D0C:
	movs r0, 0
_080A2D0E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2B94

	thumb_func_start sub_80A2BC4
sub_80A2BC4: @ 80A2D14
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
	ldr r4, _080A2E50 @ =gSaveBlock1
	mov r9, r4
	mov r8, r3
	adds r2, r3, 0
_080A2D42:
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldr r5, _080A2E54 @ =0x00002b6c
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _080A2D58
	b _080A2E74
_080A2D58:
	movs r3, 0
	ldr r0, _080A2E58 @ =gSaveBlock2
	mov r12, r0
	mov r4, r10
	ldr r6, _080A2E5C @ =0x02028280
	ldr r1, _080A2E60 @ =0x0000ffff
	adds r5, r1, 0
_080A2D66:
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
	bls _080A2D66
	movs r3, 0
	mov r2, r10
	ldr r4, _080A2E64 @ =0x02028292
_080A2D8A:
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
	bls _080A2D8A
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, _080A2E64 @ =0x02028292
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r3, _080A2E64 @ =0x02028292
	adds r0, r3
	movs r1, 0
	bl sub_814A518
	movs r3, 0
	mov r2, r10
	ldr r5, _080A2E68 @ =0x0202829a
	ldr r4, _080A2E6C @ =0x02024eae
_080A2DD8:
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
	bls _080A2DD8
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
	ldr r5, _080A2E70 @ =0x00002b6a
	adds r1, r5
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldr r1, _080A2E54 @ =0x00002b6c
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
	b _080A2E82
	.align 2, 0
_080A2E50: .4byte gSaveBlock1
_080A2E54: .4byte 0x00002b6c
_080A2E58: .4byte gSaveBlock2
_080A2E5C: .4byte 0x02028280
_080A2E60: .4byte 0x0000ffff
_080A2E64: .4byte 0x02028292
_080A2E68: .4byte 0x0202829a
_080A2E6C: .4byte 0x02024eae
_080A2E70: .4byte 0x00002b6a
_080A2E74:
	adds r0, r1, 0x1
	strb r0, [r3]
	ldrb r0, [r2]
	cmp r0, 0x5
	bhi _080A2E80
	b _080A2D42
_080A2E80:
	movs r0, 0xFF
_080A2E82:
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
sub_80A2D44: @ 80A2E94
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _080A2EAC
	adds r0, r1, 0
	bl sub_809D474
	lsls r0, 16
	ldr r1, _080A2EB0 @ =0x75300000
	adds r0, r1
	lsrs r0, 16
_080A2EAC:
	pop {r1}
	bx r1
	.align 2, 0
_080A2EB0: .4byte 0x75300000
	thumb_func_end sub_80A2D44

	thumb_func_start sub_80A2D64
sub_80A2D64: @ 80A2EB4
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080A2ECC @ =0xffff8ad0
	adds r2, r3, r0
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x1B
	bhi _080A2ED0
	movs r0, 0xC9
	strh r2, [r1]
	b _080A2ED2
	.align 2, 0
_080A2ECC: .4byte 0xffff8ad0
_080A2ED0:
	adds r0, r3, 0
_080A2ED2:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2D64

	thumb_func_start sub_80A2D88
sub_80A2D88: @ 80A2ED8
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
	beq _080A2F38
	ldr r0, _080A2F30 @ =gSaveBlock1
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _080A2F34 @ =0x00002b4c
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
	b _080A2F3A
	.align 2, 0
_080A2F30: .4byte gSaveBlock1
_080A2F34: .4byte 0x00002b4c
_080A2F38:
	movs r0, 0xFF
_080A2F3A:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2D88

	thumb_func_start unref_sub_80A2DF4
unref_sub_80A2DF4: @ 80A2F44
	movs r0, 0
	bx lr
	thumb_func_end unref_sub_80A2DF4

	thumb_func_start sub_80A2DF8
sub_80A2DF8: @ 80A2F48
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	bl sub_80A2B94
	lsls r0, 24
	cmp r0, 0
	beq _080A2F96
	adds r0, r4, 0
	movs r1, 0x40
	bl GetMonData
	add r2, sp, 0x4
	strb r0, [r2]
	ldr r3, _080A2FA0 @ =gSaveBlock1
	ldrb r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080A2FA4 @ =0x00002b6c
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
_080A2F96:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FA0: .4byte gSaveBlock1
_080A2FA4: .4byte 0x00002b6c
	thumb_func_end sub_80A2DF8

	thumb_func_start unref_sub_80A2E58
unref_sub_80A2E58: @ 80A2FA8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A2FC0 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080A2FC4 @ =0x00002b6c
	adds r1, r0
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080A2FC0: .4byte gSaveBlock1
_080A2FC4: .4byte 0x00002b6c
	thumb_func_end unref_sub_80A2E58

	thumb_func_start sub_80A2E78
sub_80A2E78: @ 80A2FC8
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
	ldr r0, _080A3054 @ =gSaveBlock1
	mov r8, r0
	ldr r2, _080A3058 @ =0x00002b4c
	add r2, r8
_080A2FEE:
	lsls r0, r7, 3
	adds r0, r7
	lsls r4, r0, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r3, _080A305C @ =0x00002b6c
	adds r0, r3
	ldrh r6, [r0]
	cmp r6, 0
	bne _080A3060
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
	ldr r0, _080A305C @ =0x00002b6c
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
	b _080A306C
	.align 2, 0
_080A3054: .4byte gSaveBlock1
_080A3058: .4byte 0x00002b4c
_080A305C: .4byte 0x00002b6c
_080A3060:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _080A2FEE
	movs r0, 0xFF
_080A306C:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A2E78

	thumb_func_start itemid_is_mail
itemid_is_mail: @ 80A307C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bgt _080A308E
	cmp r0, 0x79
	blt _080A308E
	movs r0, 0x1
	b _080A3090
_080A308E:
	movs r0, 0
_080A3090:
	pop {r1}
	bx r1
	thumb_func_end itemid_is_mail

	thumb_func_start unref_sub_80A2F44
unref_sub_80A2F44: @ 80A3094
	push {lr}
	bl sub_8071C20
	bl AddMapNamePopUpWindowTask
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80A2F44

	thumb_func_start AddMapNamePopUpWindowTask
AddMapNamePopUpWindowTask: @ 80A30A4
	push {r4,r5,lr}
	movs r0, 0x80
	lsls r0, 7
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A3134
	ldr r4, _080A30FC @ =sub_80A2FF4
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A310C
	adds r0, r4, 0
	movs r1, 0x5A
	bl CreateTask
	ldr r4, _080A3100 @ =gUnknown_02038538
	strb r0, [r4]
	ldr r1, _080A3104 @ =0x04000012
	movs r0, 0x20
	strh r0, [r1]
	bl sub_80A30E0
	ldr r2, _080A3108 @ =gTasks
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
	b _080A3134
	.align 2, 0
_080A30FC: .4byte sub_80A2FF4
_080A3100: .4byte gUnknown_02038538
_080A3104: .4byte 0x04000012
_080A3108: .4byte gTasks
_080A310C:
	ldr r3, _080A313C @ =gTasks
	ldr r2, _080A3140 @ =gUnknown_02038538
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r4, 0x8
	ldrsh r0, [r1, r4]
	cmp r0, 0x2
	beq _080A3126
	movs r0, 0x2
	strh r0, [r1, 0x8]
_080A3126:
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080A3134:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A313C: .4byte gTasks
_080A3140: .4byte gUnknown_02038538
	thumb_func_end AddMapNamePopUpWindowTask

	thumb_func_start sub_80A2FF4
sub_80A2FF4: @ 80A3144
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r3, _080A3168 @ =gTasks
	adds r4, r1, r3
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080A319C
	cmp r2, 0x1
	bgt _080A316C
	cmp r2, 0
	beq _080A3176
	b _080A31E2
	.align 2, 0
_080A3168: .4byte gTasks
_080A316C:
	cmp r2, 0x2
	beq _080A31B4
	cmp r2, 0x4
	beq _080A31DC
	b _080A31E2
_080A3176:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _080A31E2
	movs r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080A3198 @ =gUnknown_02038538
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r2, [r0, 0xA]
	b _080A31E2
	.align 2, 0
_080A3198: .4byte gUnknown_02038538
_080A319C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _080A31E2
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080A31E2
_080A31B4:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	movs r5, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _080A31E2
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A31D6
	bl sub_80A30E0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xE]
	b _080A31E2
_080A31D6:
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _080A31E8
_080A31DC:
	bl HideMapNamePopUpWindow
	b _080A31E8
_080A31E2:
	ldr r1, _080A31F0 @ =0x04000012
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
_080A31E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A31F0: .4byte 0x04000012
	thumb_func_end sub_80A2FF4

	thumb_func_start HideMapNamePopUpWindow
HideMapNamePopUpWindow: @ 80A31F4
	push {lr}
	ldr r0, _080A3224 @ =sub_80A2FF4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _080A3220
	bl MenuLoadTextWindowGraphics
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x3
	bl MenuZeroFillWindowRect
	ldr r1, _080A3228 @ =0x04000012
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080A322C @ =gUnknown_02038538
	ldrb r0, [r0]
	bl DestroyTask
_080A3220:
	pop {r0}
	bx r0
	.align 2, 0
_080A3224: .4byte sub_80A2FF4
_080A3228: .4byte 0x04000012
_080A322C: .4byte gUnknown_02038538
	thumb_func_end HideMapNamePopUpWindow

	thumb_func_start sub_80A30E0
sub_80A30E0: @ 80A3230
	push {lr}
	sub sp, 0x14
	movs r0, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
	ldr r0, _080A3264 @ =gMapHeader
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
_080A3264: .4byte gMapHeader
	thumb_func_end sub_80A30E0

	.align 2, 0 @ Don't pad with nop.
