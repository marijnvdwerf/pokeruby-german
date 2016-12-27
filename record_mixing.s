	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B9C6C
sub_80B9C6C: @ 80B9E00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x58
	str r0, [sp, 0x2C]
	str r1, [sp, 0x30]
	str r3, [sp, 0x38]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x34]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x40]
	ldr r0, _080B9F3C
	ldrh r0, [r0, 0x4]
	bl SeedRng
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r3, 0
	add r0, sp, 0x1C
	mov r9, r0
	movs r1, 0x1D
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0xC
	str r2, [sp, 0x4C]
	movs r7, 0xFF
	add r4, sp, 0x8
	movs r2, 0
	mov r6, r9
	mov r5, r10
_080B9E50:
	mov r1, sp
	adds r1, r3
	adds r1, 0x4
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	adds r0, r4, r3
	strb r2, [r0]
	lsls r1, r3, 1
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, r5, r1
	strb r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B9E50
	movs r4, 0
	str r4, [sp, 0x3C]
	movs r3, 0
	mov r1, r8
	lsls r0, r1, 16
	lsrs r1, r0, 16
	str r0, [sp, 0x50]
	ldr r4, [sp, 0x30]
	ldr r0, [sp, 0x34]
	adds r2, r4, 0
	muls r2, r0
	str r2, [sp, 0x48]
	ldr r2, [sp, 0x3C]
	cmp r2, r1
	bcs _080B9EDA
	mov r8, r1
_080B9E94:
	ldr r4, [sp, 0x30]
	adds r0, r4, 0
	muls r0, r3
	ldr r1, [sp, 0x2C]
	adds r6, r1, r0
	ldr r0, [r6, 0x70]
	cmp r0, 0
	beq _080B9ED0
	movs r7, 0
	cmp r7, r0
	bcs _080B9ED0
	adds r4, r6, 0
	adds r4, 0x74
	mov r2, r9
	lsls r1, r3, 1
	movs r5, 0x1
_080B9EB4:
	lsls r0, r7, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	cmp r0, 0
	bne _080B9EC4
	adds r0, r7, r1
	adds r0, r2, r0
	strb r5, [r0]
_080B9EC4:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, [r6, 0x70]
	cmp r7, r0
	bcc _080B9EB4
_080B9ED0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r8
	bcc _080B9E94
_080B9EDA:
	movs r7, 0
	movs r3, 0
	ldr r2, [sp, 0x50]
	cmp r2, 0
	beq _080B9FD2
	mov r4, sp
	adds r4, 0x24
	str r4, [sp, 0x44]
	movs r0, 0x25
	add r0, sp
	mov r8, r0
_080B9EF0:
	ldr r1, [sp, 0x30]
	adds r0, r1, 0
	muls r0, r3
	ldr r2, [sp, 0x2C]
	adds r6, r2, r0
	lsls r1, r3, 1
	mov r4, r9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080B9F10
	mov r2, r10
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9F1A
_080B9F10:
	ldr r0, [sp, 0x3C]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x3C]
_080B9F1A:
	mov r4, r9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9F40
	mov r2, r10
	adds r0, r2, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _080B9F40
_080B9F2E:
	lsls r1, r7, 1
	ldr r4, [sp, 0x44]
	adds r0, r4, r1
	strb r3, [r0]
	add r1, r8
	strb r2, [r1]
	b _080B9FC0
	.align 2, 0
_080B9F3C: .4byte gLinkPlayers
_080B9F40:
	mov r2, r9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B9F54
	mov r4, r10
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _080B9F2E
_080B9F54:
	mov r2, r9
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9FC6
	mov r4, r10
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080B9FC6
	lsls r5, r7, 1
	ldr r1, [sp, 0x44]
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r6, 0
	str r3, [sp, 0x54]
	bl sub_80B9BBC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r0, 0x38
	bl sub_80B9BBC
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, [sp, 0x54]
	cmp r4, 0
	bne _080B9F9E
	cmp r1, 0
	beq _080B9FA2
	mov r2, r8
	adds r1, r2, r5
	movs r0, 0x1
	strb r0, [r1]
	b _080B9FC0
_080B9F9E:
	cmp r1, 0
	beq _080B9FBA
_080B9FA2:
	str r3, [sp, 0x54]
	bl Random
	mov r4, r8
	adds r2, r4, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	strb r0, [r2]
	ldr r3, [sp, 0x54]
	b _080B9FC0
_080B9FBA:
	mov r2, r8
	adds r0, r2, r5
	strb r1, [r0]
_080B9FC0:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080B9FC6:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r4, [sp, 0x50]
	cmp r0, r4
	bcc _080B9EF0
_080B9FD2:
	movs r3, 0
	ldr r1, [sp, 0x48]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 3
	ldr r2, [sp, 0x2C]
	adds r6, r2, r0
	ldr r1, [sp, 0x4C]
_080B9FE2:
	lsls r0, r3, 2
	adds r0, r1, r0
	str r6, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B9FE2
	ldr r0, [sp, 0x38]
	bl sub_80B9C4C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r4, [sp, 0x3C]
	cmp r4, 0x3
	beq _080BA030
	cmp r4, 0x3
	bgt _080BA016
	cmp r4, 0x2
	beq _080BA01E
	b _080BA084
_080BA016:
	ldr r0, [sp, 0x3C]
	cmp r0, 0x4
	beq _080BA050
	b _080BA084
_080BA01E:
	add r2, sp, 0x24
	movs r0, 0x1
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	movs r3, 0
	bl sub_80B9BC4
	b _080BA084
_080BA030:
	ldr r0, _080BA04C
	lsls r1, 1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	add r2, sp, 0x24
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	bl sub_80B9BC4
	b _080BA084
	.align 2, 0
_080BA04C: .4byte gUnknown_083D02B4
_080BA050:
	add r6, sp, 0x24
	ldr r4, _080BA0C0
	lsls r5, r1, 2
	adds r0, r5, r4
	ldrb r3, [r0]
	adds r0, r4, 0x1
	adds r0, r5, r0
	ldrb r0, [r0]
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	adds r2, r6, 0
	bl sub_80B9BC4
	adds r0, r4, 0x2
	adds r0, r5, r0
	ldrb r3, [r0]
	adds r4, 0x3
	adds r5, r4
	ldrb r0, [r5]
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	ldr r1, [sp, 0x30]
	adds r2, r6, 0
	bl sub_80B9BC4
_080BA084:
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x48]
	adds r6, r1, r2
	ldr r4, _080BA0C4
	ldr r1, _080BA0C8
	adds r0, r4, r1
	adds r1, r6, 0
	movs r2, 0x38
	bl memcpy
	ldr r2, _080BA0CC
	adds r4, r2
	adds r1, r6, 0
	adds r1, 0x38
	adds r0, r4, 0
	movs r2, 0x38
	bl memcpy
	ldr r0, [sp, 0x40]
	bl SeedRng
	add sp, 0x58
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0C0: .4byte gUnknown_083D02BA
_080BA0C4: .4byte gSaveBlock1
_080BA0C8: .4byte 0x0000303c
_080BA0CC: .4byte 0x00003074
	thumb_func_end sub_80B9C6C

	thumb_func_start sub_80B9F3C
sub_80B9F3C: @ 80BA0D0
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	cmp r1, 0
	beq _080BA194
	ldrh r0, [r4]
	cmp r0, 0
	beq _080BA194
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080BA15C
	ldrh r0, [r4]
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	cmp r0, 0
	bne _080BA14C
	ldrh r0, [r4]
	movs r1, 0x1
	bl CheckPCHasItem
	lsls r0, 24
	cmp r0, 0
	bne _080BA14C
	ldrh r0, [r4]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	beq _080BA14C
	ldr r0, _080BA138
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080BA13C
	ldr r1, _080BA140
	bl StringCopy
	ldrh r1, [r4]
	ldr r0, _080BA144
	cmp r1, r0
	bne _080BA194
	ldr r0, _080BA148
	bl FlagSet
	b _080BA194
	.align 2, 0
_080BA138: .4byte 0x00004001
_080BA13C: .4byte gStringVar1
_080BA140: .4byte 0x03002988
_080BA144: .4byte 0x00000113
_080BA148: .4byte 0x00000853
_080BA14C:
	ldr r0, _080BA158
	movs r1, 0
	bl VarSet
	b _080BA194
	.align 2, 0
_080BA158: .4byte 0x00004001
_080BA15C:
	ldrh r0, [r4]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BA18C
	ldr r0, _080BA180
	ldrh r1, [r4]
	bl VarSet
	ldr r0, _080BA184
	ldr r1, _080BA188
	bl StringCopy
	b _080BA194
	.align 2, 0
_080BA180: .4byte 0x00004001
_080BA184: .4byte gStringVar1
_080BA188: .4byte 0x03002988
_080BA18C:
	ldr r0, _080BA19C
	movs r1, 0
	bl VarSet
_080BA194:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA19C: .4byte 0x00004001
	thumb_func_end sub_80B9F3C

	thumb_func_start sub_80BA00C
sub_80BA00C: @ 80BA1A0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080BA1C4
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _080BA230
	lsls r0, 2
	ldr r1, _080BA1C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BA1C4: .4byte gTasks
_080BA1C8: .4byte _080BA1CC
	.align 2, 0
_080BA1CC:
	.4byte _080BA21A
	.4byte _080BA21A
	.4byte _080BA1E4
	.4byte _080BA1EE
	.4byte _080BA208
	.4byte _080BA222
_080BA1E4:
	bl SetSecretBase2Field_9_AndHideBG
	bl sub_8125E2C
	b _080BA21A
_080BA1EE:
	bl sub_8125E6C
	lsls r0, 24
	cmp r0, 0
	beq _080BA230
	bl ClearSecretBase2Field_9_2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	b _080BA230
_080BA208:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080BA230
	bl sub_800832C
_080BA21A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080BA230
_080BA222:
	ldr r0, _080BA238
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BA230
	adds r0, r2, 0
	bl DestroyTask
_080BA230:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA238: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80BA00C

	.align 2, 0 @ Don't pad with nop.
