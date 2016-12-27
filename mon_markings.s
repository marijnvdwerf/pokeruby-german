	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F727C
sub_80F727C: @ 80F762C
	ldr r1, _080F7638 @ =gUnknown_020388B8
	str r0, [r1]
	movs r1, 0
	strb r1, [r0, 0xB]
	bx lr
	.align 2, 0
_080F7638: .4byte gUnknown_020388B8
	thumb_func_end sub_80F727C

	thumb_func_start sub_80F728C
sub_80F728C: @ 80F763C
	push {lr}
	sub sp, 0x4
	ldr r0, _080F7674 @ =gSaveBlock2
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl GetTextWindowFrameGraphics
	ldr r3, _080F7678 @ =gUnknown_020388B8
	ldr r2, [r3]
	ldr r1, [r0]
	str r1, [r2, 0x28]
	ldr r0, [r0, 0x4]
	str r0, [r2, 0x2C]
	ldr r0, _080F767C @ =0x000010b0
	adds r2, r0
	movs r1, 0
	strb r1, [r2]
	mov r0, sp
	strh r1, [r0]
	ldr r1, [r3]
	adds r1, 0x30
	ldr r2, _080F7680 @ =0x01000800
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F7674: .4byte gSaveBlock2
_080F7678: .4byte gUnknown_020388B8
_080F767C: .4byte 0x000010b0
_080F7680: .4byte 0x01000800
	thumb_func_end sub_80F728C

	thumb_func_start sub_80F72D4
sub_80F72D4: @ 80F7684
	push {r4-r7,lr}
	ldr r0, _080F76A4 @ =gUnknown_020388B8
	ldr r1, [r0]
	ldr r2, _080F76A8 @ =0x000010b0
	adds r0, r1, r2
	ldrb r2, [r0]
	lsls r0, r2, 8
	adds r0, 0x30
	adds r5, r1, r0
	cmp r2, 0xD
	beq _080F7754
	cmp r2, 0xD
	bgt _080F76AC
	cmp r2, 0
	beq _080F76B2
	b _080F76FC
	.align 2, 0
_080F76A4: .4byte gUnknown_020388B8
_080F76A8: .4byte 0x000010b0
_080F76AC:
	cmp r2, 0xE
	beq _080F77A0
	b _080F76FC
_080F76B2:
	ldr r0, [r1, 0x28]
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080F76C2:
	ldr r6, _080F76F4 @ =gUnknown_020388B8
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0x20
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080F76C2
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0x40
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r0, _080F76F8 @ =0x000010b0
	adds r1, r0
	b _080F7742
	.align 2, 0
_080F76F4: .4byte gUnknown_020388B8
_080F76F8: .4byte 0x000010b0
_080F76FC:
	ldr r0, _080F774C @ =gUnknown_020388B8
	ldr r0, [r0]
	ldr r0, [r0, 0x28]
	adds r0, 0x60
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080F7712:
	ldr r6, _080F774C @ =gUnknown_020388B8
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0x80
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080F7712
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0xA0
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _080F7750 @ =0x000010b0
	adds r1, r2
_080F7742:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F77AC
	.align 2, 0
_080F774C: .4byte gUnknown_020388B8
_080F7750: .4byte 0x000010b0
_080F7754:
	ldr r0, [r1, 0x28]
	adds r0, 0xC0
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080F7766:
	ldr r6, _080F77A4 @ =gUnknown_020388B8
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0xE0
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080F7766
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _080F77A8 @ =0x000010b0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F77A0:
	movs r0, 0
	b _080F77AE
	.align 2, 0
_080F77A4: .4byte gUnknown_020388B8
_080F77A8: .4byte 0x000010b0
_080F77AC:
	movs r0, 0x1
_080F77AE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F72D4

	thumb_func_start sub_80F7404
sub_80F7404: @ 80F77B4
	push {lr}
	bl sub_80F728C
_080F77BA:
	bl sub_80F72D4
	lsls r0, 24
	cmp r0, 0
	bne _080F77BA
	pop {r0}
	bx r0
	thumb_func_end sub_80F7404

	thumb_func_start sub_80F7418
sub_80F7418: @ 80F77C8
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r2, _080F781C @ =gUnknown_020388B8
	ldr r3, [r2]
	movs r1, 0
	strb r1, [r3, 0x5]
	ldr r1, [r2]
	strb r0, [r1, 0x4]
	movs r3, 0
	adds r4, r2, 0
	movs r2, 0x1
_080F77E4:
	ldr r0, [r4]
	adds r1, r0, 0x6
	adds r1, r3
	ldrb r0, [r0, 0x4]
	asrs r0, r3
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080F77E4
	bl sub_814A7FC
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	ldr r2, _080F781C @ =gUnknown_020388B8
	ldr r3, [r2]
	ldrh r2, [r3]
	ldrh r3, [r3, 0x2]
	bl sub_80F761C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F781C: .4byte gUnknown_020388B8
	thumb_func_end sub_80F7418

	thumb_func_start sub_80F7470
sub_80F7470: @ 80F7820
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080F78AC @ =gUnknown_020388B8
_080F7826:
	ldr r0, [r5]
	ldrh r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _080F7826
	ldr r4, _080F78AC @ =gUnknown_020388B8
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	movs r4, 0
_080F7858:
	ldr r0, _080F78AC @ =gUnknown_020388B8
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080F78A6
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F7858
	movs r4, 0
_080F7878:
	ldr r5, _080F78AC @ =gUnknown_020388B8
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, 0x14
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080F78A6
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080F7878
	bl sub_814A7FC
	ldr r0, [r5]
	ldr r0, [r0, 0x24]
	cmp r0, 0
	beq _080F78A6
	bl DestroySprite
_080F78A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F78AC: .4byte gUnknown_020388B8
	thumb_func_end sub_80F7470

	thumb_func_start sub_80F7500
sub_80F7500: @ 80F78B0
	push {r4,r5,lr}
	sub sp, 0x30
	ldr r4, _080F7930 @ =gUnknown_020388B8
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x30
	str r0, [sp, 0x18]
	add r1, sp, 0x1C
	movs r5, 0
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r1]
	ldrh r1, [r2]
	mov r0, sp
	adds r0, 0x1E
	strh r1, [r0]
	add r1, sp, 0x20
	ldr r0, _080F7934 @ =gPokenavConditionMenuMisc_Gfx
	str r0, [sp, 0x20]
	movs r0, 0xA4
	lsls r0, 3
	strh r0, [r1, 0x4]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	add r0, sp, 0x28
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r1, sp, 0x18
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r0, [r4]
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	beq _080F7908
	mov r0, sp
	bl LoadTilesForSpriteSheets
	ldr r0, [r4]
	strb r5, [r0, 0xB]
_080F7908:
	ldr r0, _080F7938 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F793C
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x5]
	subs r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	cmp r0, 0
	bge _080F79AE
	ldr r1, [r4]
	movs r0, 0x5
	strb r0, [r1, 0x5]
	b _080F79AE
	.align 2, 0
_080F7930: .4byte gUnknown_020388B8
_080F7934: .4byte gPokenavConditionMenuMisc_Gfx
_080F7938: .4byte gMain
_080F793C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F7960
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	ble _080F79AE
	ldr r0, [r4]
	strb r5, [r0, 0x5]
	b _080F79AE
_080F7960:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F79B2
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	movs r1, 0x5
	ldrsb r1, [r0, r1]
	cmp r1, 0x4
	beq _080F798C
	cmp r1, 0x5
	beq _080F79C0
	adds r0, 0x6
	adds r1, r0, r1
	movs r2, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F79AC
	movs r2, 0x1
	b _080F79AC
_080F798C:
	strb r5, [r0, 0x4]
	movs r3, 0
_080F7990:
	ldr r2, [r4]
	adds r0, r2, 0x6
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, r3
	ldrb r1, [r2, 0x4]
	orrs r0, r1
	strb r0, [r2, 0x4]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080F7990
	b _080F79C0
_080F79AC:
	strb r2, [r1]
_080F79AE:
	movs r0, 0x1
	b _080F79C2
_080F79B2:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080F79AE
	movs r0, 0x5
	bl PlaySE
_080F79C0:
	movs r0, 0
_080F79C2:
	add sp, 0x30
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F7500

	thumb_func_start sub_80F761C
sub_80F761C: @ 80F79CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x5C
	adds r5, r2, 0
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4C]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x50]
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x54]
	ldr r0, _080F7BD0 @ =gUnknown_020388B8
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0x30
	str r0, [sp, 0x1C]
	add r1, sp, 0x20
	movs r2, 0
	mov r9, r2
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r1]
	mov r0, sp
	adds r0, 0x22
	strh r5, [r0]
	add r1, sp, 0x24
	ldr r0, _080F7BD4 @ =gPokenavConditionMenuMisc_Gfx
	str r0, [sp, 0x24]
	movs r0, 0xA4
	lsls r0, 3
	strh r0, [r1, 0x4]
	adds r0, r5, 0x1
	strh r0, [r1, 0x6]
	add r0, sp, 0x2C
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r6, sp, 0x1C
	add r0, sp, 0x4
	adds r1, r6, 0
	movs r2, 0x18
	bl memcpy
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0, 0x2C]
	str r0, [sp, 0x34]
	add r0, sp, 0x38
	add r1, sp, 0x54
	ldrh r1, [r1]
	strh r1, [r0]
	add r1, sp, 0x3C
	ldr r0, _080F7BD8 @ =gUnknown_08E966B8
	str r0, [sp, 0x3C]
	ldr r0, [sp, 0x54]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	add r0, sp, 0x44
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r4, sp, 0x34
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x18
	bl memcpy
	strh r5, [r4]
	add r2, sp, 0x54
	ldrh r2, [r2]
	strh r2, [r4, 0x2]
	ldr r0, _080F7BDC @ =gUnknown_083E5214
	str r0, [r4, 0x4]
	ldr r0, _080F7BE0 @ =gSpriteAnimTable_83E52AC
	str r0, [r4, 0x8]
	mov r3, r9
	str r3, [r4, 0xC]
	ldr r0, _080F7BE4 @ =gDummySpriteAffineAnimTable
	str r0, [r4, 0x10]
	ldr r0, _080F7BE8 @ =nullsub_65
	str r0, [r4, 0x14]
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0xB]
	add r0, sp, 0x4
	bl AllocTilesForSpriteSheets
	adds r0, r6, 0
	bl LoadSpritePalettes
	movs r5, 0
	ldr r1, [sp, 0x4C]
	lsls r0, r1, 16
	movs r2, 0x80
	lsls r2, 14
	adds r2, r0
	mov r8, r2
	str r0, [sp, 0x58]
	ldr r3, [sp, 0x50]
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 14
	adds r7, r0, r1
	mov r9, r0
_080F7AB0:
	adds r0, r4, 0
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080F7AC8
	b _080F7C00
_080F7AC8:
	ldr r6, _080F7BD0 @ =gUnknown_020388B8
	ldr r2, [r6]
	lsls r0, r5, 2
	adds r2, 0xC
	adds r2, r0
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r1, _080F7BEC @ =gSprites
	adds r0, r1
	str r0, [r2]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080F7AB0
	ldr r0, [r6]
	ldr r1, [r0, 0x10]
	mov r3, r9
	asrs r0, r3, 16
	adds r0, 0x60
	strh r0, [r1, 0x22]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	ldr r0, _080F7BF0 @ =gSpriteAnimTable_83E5274
	str r0, [r4, 0x8]
	ldr r0, _080F7BF4 @ =sub_80F78CC
	str r0, [r4, 0x14]
	ldr r0, _080F7BF8 @ =gUnknown_083E521C
	str r0, [r4, 0x4]
	movs r5, 0
	ldr r0, [sp, 0x58]
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	mov r10, r0
_080F7B20:
	lsls r2, r5, 4
	adds r2, 0x10
	mov r3, r9
	asrs r3, 16
	mov r8, r3
	add r2, r8
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	mov r3, r10
	asrs r1, r3, 16
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F7C10
	ldr r6, _080F7BD0 @ =gUnknown_020388B8
	ldr r1, [r6]
	lsls r0, r5, 2
	adds r1, 0x14
	adds r1, r0
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r7, _080F7BEC @ =gSprites
	adds r0, r7
	str r0, [r1]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F7B20
	ldr r0, _080F7BFC @ =SpriteCallbackDummy
	str r0, [r4, 0x14]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F7C24
	ldr r1, [r6]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r7
	str r0, [r1, 0x24]
	ldrb r2, [r0, 0x1]
	movs r1, 0x3F
	ands r1, r2
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r6]
	ldr r2, [r0, 0x24]
	ldrb r0, [r2, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r0, [r6]
	ldr r0, [r0, 0x24]
	movs r1, 0x9
	bl StartSpriteAnim
	ldr r1, [r6]
	ldr r2, [r1, 0x24]
	ldr r3, [sp, 0x58]
	asrs r0, r3, 16
	adds r0, 0x18
	strh r0, [r2, 0x20]
	ldr r2, [r1, 0x24]
	mov r0, r8
	adds r0, 0x50
	strh r0, [r2, 0x22]
	ldr r0, [r1, 0x24]
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	b _080F7C2A
	.align 2, 0
_080F7BD0: .4byte gUnknown_020388B8
_080F7BD4: .4byte gPokenavConditionMenuMisc_Gfx
_080F7BD8: .4byte gUnknown_08E966B8
_080F7BDC: .4byte gUnknown_083E5214
_080F7BE0: .4byte gSpriteAnimTable_83E52AC
_080F7BE4: .4byte gDummySpriteAffineAnimTable
_080F7BE8: .4byte nullsub_65
_080F7BEC: .4byte gSprites
_080F7BF0: .4byte gSpriteAnimTable_83E5274
_080F7BF4: .4byte sub_80F78CC
_080F7BF8: .4byte gUnknown_083E521C
_080F7BFC: .4byte SpriteCallbackDummy
_080F7C00:
	ldr r0, _080F7C0C @ =gUnknown_020388B8
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0xC
	b _080F7C18
	.align 2, 0
_080F7C0C: .4byte gUnknown_020388B8
_080F7C10:
	ldr r0, _080F7C20 @ =gUnknown_020388B8
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0x14
_080F7C18:
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _080F7C60
	.align 2, 0
_080F7C20: .4byte gUnknown_020388B8
_080F7C24:
	ldr r1, [r6]
	movs r0, 0
	str r0, [r1, 0x24]
_080F7C2A:
	ldr r4, _080F7C70 @ =gUnknown_020388B8
	ldr r1, [r4]
	ldr r0, [sp, 0x50]
	adds r0, 0x8
	strb r0, [r1, 0xA]
	ldr r1, [sp, 0x54]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x30
	str r0, [sp]
	movs r0, 0
	movs r2, 0xF
	movs r3, 0
	bl sub_814A5C0
	ldr r0, [sp, 0x4C]
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	ldrb r1, [r1, 0xA]
	bl sub_814A880
	ldr r0, _080F7C74 @ =sub_80F7908
	bl sub_814AABC
_080F7C60:
	add sp, 0x5C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7C70: .4byte gUnknown_020388B8
_080F7C74: .4byte sub_80F7908
	thumb_func_end sub_80F761C

	thumb_func_start nullsub_65
nullsub_65: @ 80F7C78
	bx lr
	thumb_func_end nullsub_65

	thumb_func_start sub_80F78CC
sub_80F78CC: @ 80F7C7C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F7CA4 @ =gUnknown_020388B8
	ldr r0, [r0]
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	adds r0, 0x6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F7CA8
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080F7CB2
	.align 2, 0
_080F7CA4: .4byte gUnknown_020388B8
_080F7CA8:
	lsls r1, 25
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
_080F7CB2:
	pop {r0}
	bx r0
	thumb_func_end sub_80F78CC

	thumb_func_start sub_80F7908
sub_80F7908: @ 80F7CB8
	ldr r1, _080F7CCC @ =gUnknown_020388B8
	ldr r2, [r1]
	movs r1, 0x5
	ldrsb r1, [r2, r1]
	lsls r1, 4
	ldrb r2, [r2, 0xA]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080F7CCC: .4byte gUnknown_020388B8
	thumb_func_end sub_80F7908

	thumb_func_start sub_80F7920
sub_80F7920: @ 80F7CD0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r2, 0
	bne _080F7CE0
	ldr r2, _080F7CEC @ =gUnknown_083E49F4
_080F7CE0:
	movs r3, 0x10
	bl sub_80F7960
	pop {r1}
	bx r1
	.align 2, 0
_080F7CEC: .4byte gUnknown_083E49F4
	thumb_func_end sub_80F7920

	thumb_func_start sub_80F7940
sub_80F7940: @ 80F7CF0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r2, 0
	bne _080F7D00
	ldr r2, _080F7D0C @ =gUnknown_083E49F4
_080F7D00:
	movs r3, 0x1
	bl sub_80F7960
	pop {r1}
	bx r1
	.align 2, 0
_080F7D0C: .4byte gUnknown_083E49F4
	thumb_func_end sub_80F7940

	thumb_func_start sub_80F7960
sub_80F7960: @ 80F7D10
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _080F7D8C @ =gUnknown_083E4A14
	str r4, [sp, 0x18]
	movs r4, 0x80
	add r5, sp, 0x18
	lsrs r6, r0, 16
	orrs r0, r4
	str r0, [r5, 0x4]
	str r2, [sp, 0x20]
	ldr r0, _080F7D90 @ =0xffff0000
	mov r8, r0
	add r4, sp, 0x20
	ldr r0, [r4, 0x4]
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	movs r2, 0
	strh r6, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _080F7D94 @ =gUnknown_083E52B4
	str r0, [sp, 0x4]
	ldr r0, _080F7D98 @ =gSpriteAnimTable_83E533C
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080F7D9C @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _080F7DA0 @ =nullsub_65
	str r0, [sp, 0x14]
	lsls r3, 23
	lsrs r3, 16
	ldr r0, [r5, 0x4]
	mov r1, r8
	ands r0, r1
	orrs r0, r3
	str r0, [r5, 0x4]
	adds r0, r5, 0
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F7DA4
	movs r0, 0
	b _080F7DAE
	.align 2, 0
_080F7D8C: .4byte gUnknown_083E4A14
_080F7D90: .4byte 0xffff0000
_080F7D94: .4byte gUnknown_083E52B4
_080F7D98: .4byte gSpriteAnimTable_83E533C
_080F7D9C: .4byte gDummySpriteAffineAnimTable
_080F7DA0: .4byte nullsub_65
_080F7DA4:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F7DBC @ =gSprites
	adds r0, r1
_080F7DAE:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F7DBC: .4byte gSprites
	thumb_func_end sub_80F7960

	thumb_func_start sub_80F7A10
sub_80F7A10: @ 80F7DC0
	lsls r0, 24
	lsrs r0, 17
	ldr r2, _080F7DD8 @ =gUnknown_083E4A14
	adds r0, r2
	ldr r2, _080F7DDC @ =0x040000d4
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080F7DE0 @ =0x80000040
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080F7DD8: .4byte gUnknown_083E4A14
_080F7DDC: .4byte 0x040000d4
_080F7DE0: .4byte 0x80000040
	thumb_func_end sub_80F7A10

	.align 2, 0 @ Don't pad with nop.
