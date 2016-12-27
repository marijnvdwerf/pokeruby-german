	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C5CD4
sub_80C5CD4: @ 80C5ED0
	push {r4-r7,lr}
	sub sp, 0x28
	adds r7, r0, 0
	ldr r0, _080C5F60
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080C5F64
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080C5F68
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r3, [r7]
	lsls r2, r3, 16
	add r0, sp, 0x18
	ldrh r1, [r0, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	mov r1, sp
	movs r6, 0
	strh r3, [r1]
	ldrh r2, [r7, 0x2]
	ldr r5, _080C5F6C
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r4, 0x4]
	mov r1, sp
	strh r2, [r1, 0x2]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	movs r0, 0x1
	strh r0, [r7, 0xC]
	strh r6, [r7, 0xA]
	strh r6, [r7, 0x8]
	ldrh r0, [r7, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	bics r5, r1
	str r5, [r7, 0x10]
	ldrh r0, [r7, 0x4]
	cmp r0, 0
	bne _080C5F4A
	movs r0, 0x10
	strh r0, [r7, 0x4]
_080C5F4A:
	ldrh r0, [r7, 0x6]
	cmp r0, 0
	bne _080C5F54
	movs r0, 0x14
	strh r0, [r7, 0x6]
_080C5F54:
	ldr r0, _080C5F70
	str r7, [r0]
	movs r4, 0
	ldr r5, _080C5F74
	b _080C5F90
	.align 2, 0
_080C5F60: .4byte gUnknown_083D1898
_080C5F64: .4byte gUnknown_083D18A0
_080C5F68: .4byte gSpriteTemplate_83D18A8
_080C5F6C: .4byte 0xffff0000
_080C5F70: .4byte gUnknown_020387EC
_080C5F74: .4byte gSprites
_080C5F78:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r7, 0x4]
	cmp r4, 0x3
	bhi _080C5F88
	negs r1, r1
_080C5F88:
	strh r1, [r0, 0x2E]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080C5F90:
	cmp r4, 0x7
	bhi _080C5FAE
	lsls r1, r4, 5
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080C5F78
_080C5FAE:
	ldr r1, _080C5FC4
	movs r0, 0xBF
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5FC4: .4byte 0x04000050
	thumb_func_end sub_80C5CD4

	thumb_func_start sub_80C5DCC
sub_80C5DCC: @ 80C5FC8
	push {r4,lr}
	ldr r4, _080C600C
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	bne _080C5FEC
	ldr r0, [r1, 0x10]
	ldr r2, _080C6010
	movs r1, 0x10
	bl BlendPalettes
	ldr r0, _080C6014
	bl sub_80C61B0
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C5FEC:
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	cmp r0, 0x7
	bls _080C6006
	ldrh r0, [r1, 0x6]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	movs r2, 0
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	bgt _080C6018
_080C6006:
	movs r0, 0
	b _080C602A
	.align 2, 0
_080C600C: .4byte gUnknown_020387EC
_080C6010: .4byte 0x0000ffff
_080C6014: .4byte sub_80C603C
_080C6018:
	movs r0, 0x50
	strh r0, [r1, 0xC]
	ldr r0, _080C6030
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	bl ClearGpuRegBits
	movs r0, 0x1
_080C602A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6030: .4byte 0x04000050
	thumb_func_end sub_80C5DCC

	thumb_func_start sub_80C5E38
sub_80C5E38: @ 80C6034
	push {r4-r7,lr}
	sub sp, 0x28
	adds r7, r0, 0
	ldr r0, _080C60C4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080C60C8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080C60CC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldrh r3, [r7]
	lsls r2, r3, 16
	add r0, sp, 0x18
	ldrh r1, [r0, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	mov r1, sp
	movs r6, 0
	strh r3, [r1]
	ldrh r2, [r7, 0x2]
	ldr r5, _080C60D0
	add r4, sp, 0x20
	ldr r1, [r4, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r4, 0x4]
	mov r1, sp
	strh r2, [r1, 0x2]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	movs r0, 0x50
	strh r0, [r7, 0xC]
	strh r6, [r7, 0x8]
	strh r6, [r7, 0xA]
	ldrh r0, [r7, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	bics r5, r1
	str r5, [r7, 0x10]
	ldrh r0, [r7, 0x4]
	cmp r0, 0
	bne _080C60AE
	movs r0, 0x10
	strh r0, [r7, 0x4]
_080C60AE:
	ldrh r0, [r7, 0x6]
	cmp r0, 0
	bne _080C60B8
	movs r0, 0x14
	strh r0, [r7, 0x6]
_080C60B8:
	ldr r0, _080C60D4
	str r7, [r0]
	movs r5, 0
	ldr r6, _080C60D8
	b _080C6146
	.align 2, 0
_080C60C4: .4byte gUnknown_083D1898
_080C60C8: .4byte gUnknown_083D18A0
_080C60CC: .4byte gSpriteTemplate_83D18C0
_080C60D0: .4byte 0xffff0000
_080C60D4: .4byte gUnknown_020387EC
_080C60D8: .4byte gSprites
_080C60DC:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r7, 0x4]
	strh r0, [r1, 0x2E]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	ldr r1, _080C60F0
	b _080C6126
	.align 2, 0
_080C60F0: .4byte gSprites
_080C60F4:
	lsls r1, r5, 21
	movs r0, 0x80
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080C616A
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r7, 0x4]
	negs r0, r0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6184
	strh r0, [r1, 0x30]
	ldr r1, _080C6188
	lsls r4, r5, 5
_080C6126:
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	movs r2, 0
	strh r1, [r0, 0x32]
	strh r2, [r0, 0x36]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080C6146:
	cmp r5, 0x7
	bhi _080C616A
	cmp r5, 0x3
	bhi _080C60F4
	lsls r4, r5, 5
	adds r1, r4, 0
	subs r1, 0x70
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080C60DC
_080C616A:
	ldr r1, _080C618C
	movs r0, 0xFF
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080C6190
	bl sub_80C61B0
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6184: .4byte 0x0000ffff
_080C6188: .4byte gSprites
_080C618C: .4byte 0x04000050
_080C6190: .4byte sub_80C6078
	thumb_func_end sub_80C5E38

	thumb_func_start sub_80C5F98
sub_80C5F98: @ 80C6194
	push {r4,lr}
	ldr r4, _080C61AC
	ldr r2, [r4]
	ldrh r0, [r2, 0x8]
	cmp r0, 0x1
	beq _080C61E8
	cmp r0, 0x1
	bgt _080C61B0
	cmp r0, 0
	beq _080C61B6
	b _080C6228
	.align 2, 0
_080C61AC: .4byte gUnknown_020387EC
_080C61B0:
	cmp r0, 0x2
	beq _080C6204
	b _080C6228
_080C61B6:
	ldrh r0, [r2, 0xC]
	ldrh r1, [r2, 0x6]
	subs r0, r1
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _080C6230
	ldr r0, [r2, 0x10]
	ldr r2, _080C61E0
	movs r1, 0x10
	bl BlendPalettes
	ldr r0, _080C61E4
	bl SetHBlankCallback
	ldr r1, [r4]
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _080C61FC
	.align 2, 0
_080C61E0: .4byte 0x0000ffff
_080C61E4: .4byte sub_80C603C
_080C61E8:
	ldrh r0, [r2, 0xA]
	cmp r0, 0x8
	bne _080C6230
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r1, [r4]
_080C61FC:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C6230
_080C6204:
	ldr r0, _080C622C
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r2]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	bl ClearGpuRegBits
	ldr r1, [r4]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C6228:
	movs r0, 0x1
	b _080C6232
	.align 2, 0
_080C622C: .4byte 0x04000050
_080C6230:
	movs r0, 0
_080C6232:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C5F98

	thumb_func_start sub_80C603C
sub_80C603C: @ 80C6238
	push {lr}
	sub sp, 0x4
	mov r2, sp
	ldr r0, _080C625C
	ldrh r1, [r0]
	movs r3, 0xFF
	adds r0, r3, 0
	ands r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0x50
	bne _080C6264
	ldr r1, _080C6260
	movs r0, 0x8F
	strh r0, [r1]
	b _080C6268
	.align 2, 0
_080C625C: .4byte 0x04000006
_080C6260: .4byte 0x04000050
_080C6264:
	ldr r0, _080C6270
	strh r3, [r0]
_080C6268:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C6270: .4byte 0x04000050
	thumb_func_end sub_80C603C

	thumb_func_start sub_80C6078
sub_80C6078: @ 80C6274
	push {lr}
	sub sp, 0x4
	mov r2, sp
	ldr r0, _080C62AC
	ldrh r1, [r0]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _080C62B0
	ldr r0, [r0]
	movs r3, 0xC
	ldrsh r2, [r0, r3]
	movs r0, 0x50
	subs r0, r2
	cmp r1, r0
	ble _080C62B8
	mov r0, sp
	ldrh r1, [r0]
	adds r0, r2, 0
	adds r0, 0x50
	cmp r1, r0
	bge _080C62B8
	ldr r1, _080C62B4
	movs r0, 0
	b _080C62BC
	.align 2, 0
_080C62AC: .4byte 0x04000006
_080C62B0: .4byte gUnknown_020387EC
_080C62B4: .4byte 0x04000054
_080C62B8:
	ldr r1, _080C62C4
	movs r0, 0x10
_080C62BC:
	strh r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C62C4: .4byte 0x04000054
	thumb_func_end sub_80C6078

	thumb_func_start sub_80C60CC
sub_80C60CC: @ 80C62C8
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bls _080C6318
	adds r0, r2, 0
	bl DestroySprite
	ldr r4, _080C6320
	ldr r1, [r4]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bne _080C6318
	ldrh r0, [r1]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	ldr r0, [r0, 0x10]
	ldr r2, _080C6324
	movs r1, 0
	bl BlendPalettes
	ldr r0, _080C6328
	bl SetHBlankCallback
_080C6318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6320: .4byte gUnknown_020387EC
_080C6324: .4byte 0x0000ffff
_080C6328: .4byte sub_80C6078
	thumb_func_end sub_80C60CC

	thumb_func_start sub_80C6130
sub_80C6130: @ 80C632C
	push {r4,r5,lr}
	adds r2, r0, 0
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080C63A6
	ldr r1, _080C6380
	ldr r0, [r1]
	movs r3, 0xC
	ldrsh r4, [r0, r3]
	adds r5, r1, 0
	cmp r4, 0x1
	bne _080C63A6
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bhi _080C6368
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080C6368:
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080C6384
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r1, r0
	blt _080C6392
	b _080C6390
	.align 2, 0
_080C6380: .4byte gUnknown_020387EC
_080C6384:
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bgt _080C6392
_080C6390:
	strh r4, [r2, 0x36]
_080C6392:
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080C63A6
	ldr r0, [r5]
	ldrh r1, [r0, 0xA]
	adds r1, 0x1
	strh r1, [r0, 0xA]
	ldrh r0, [r2, 0x32]
	strh r0, [r2, 0x20]
_080C63A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6130

	thumb_func_start sub_80C61B0
sub_80C61B0: @ 80C63AC
	push {r4-r6,lr}
	ldr r2, _080C63EC
	ldrh r1, [r2]
	movs r5, 0x2
	orrs r1, r5
	strh r1, [r2]
	ldr r3, _080C63F0
	ldrh r1, [r3]
	movs r2, 0x10
	orrs r1, r2
	strh r1, [r3]
	ldr r4, _080C63F4
	ldrh r2, [r4]
	movs r6, 0
	strh r6, [r4]
	ldr r3, _080C63F8
	ldrh r1, [r3]
	orrs r1, r5
	strh r1, [r3]
	strh r2, [r4]
	ldr r2, _080C63FC
	ldrh r1, [r2, 0x1C]
	orrs r1, r5
	ldrh r3, [r2, 0x1C]
	orrs r1, r6
	strh r1, [r2, 0x1C]
	bl SetHBlankCallback
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C63EC: .4byte 0x03007ff8
_080C63F0: .4byte 0x04000004
_080C63F4: .4byte 0x04000208
_080C63F8: .4byte 0x04000200
_080C63FC: .4byte gMain
	thumb_func_end sub_80C61B0

	thumb_func_start ClearGpuRegBits
ClearGpuRegBits: @ 80C6400
	push {r4,r5,lr}
	ldr r3, _080C6444
	ldrh r1, [r3]
	ldr r2, _080C6448
	adds r0, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r3, _080C644C
	ldrh r1, [r3]
	ldr r0, _080C6450
	ands r0, r1
	strh r0, [r3]
	ldr r4, _080C6454
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r5, _080C6458
	ldrh r1, [r5]
	adds r0, r2, 0
	ands r0, r1
	strh r0, [r5]
	strh r3, [r4]
	ldr r0, _080C645C
	ldrh r1, [r0, 0x1C]
	ands r2, r1
	ldrh r1, [r0, 0x1C]
	strh r2, [r0, 0x1C]
	movs r0, 0
	bl SetHBlankCallback
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6444: .4byte 0x03007ff8
_080C6448: .4byte 0x0000fffd
_080C644C: .4byte 0x04000004
_080C6450: .4byte 0x0000ffef
_080C6454: .4byte 0x04000208
_080C6458: .4byte 0x04000200
_080C645C: .4byte gMain
	thumb_func_end ClearGpuRegBits

	thumb_func_start sub_80C6264
sub_80C6264: @ 80C6460
	push {lr}
	ldr r0, _080C6474
	ldr r1, _080C6478
	ldr r1, [r1, 0x4]
	bl sub_80BBFD8
	bl sub_80BB5E4
	pop {r0}
	bx r0
	.align 2, 0
_080C6474: .4byte gUnknown_0203923C
_080C6478: .4byte gMapHeader
	thumb_func_end sub_80C6264

	thumb_func_start sub_80C6280
sub_80C6280: @ 80C647C
	push {lr}
	ldr r1, _080C6490
	ldr r0, [r1, 0x4]
	cmp r0, 0x2
	beq _080C64A6
	cmp r0, 0x2
	bgt _080C6494
	cmp r0, 0x1
	beq _080C649E
	b _080C64BA
	.align 2, 0
_080C6490: .4byte gUnknown_0202FF84
_080C6494:
	cmp r0, 0x3
	beq _080C64AA
	cmp r0, 0x4
	beq _080C64B4
	b _080C64BA
_080C649E:
	movs r0, 0x8
	str r0, [r1, 0x14]
	movs r0, 0x28
	b _080C64B8
_080C64A6:
	movs r0, 0x8
	b _080C64B6
_080C64AA:
	movs r0, 0x8
	negs r0, r0
	str r0, [r1, 0x14]
	movs r0, 0x18
	b _080C64B8
_080C64B4:
	movs r0, 0x18
_080C64B6:
	str r0, [r1, 0x14]
_080C64B8:
	str r0, [r1, 0x18]
_080C64BA:
	pop {r0}
	bx r0
	thumb_func_end sub_80C6280

	thumb_func_start SetUpFieldMove_SecretPower
SetUpFieldMove_SecretPower: @ 80C64C0
	push {r4,lr}
	bl sub_80BB63C
	ldr r0, _080C6514
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080C656A
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C656A
	ldr r4, _080C6518
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C652C
	bl sub_80C6264
	ldr r1, _080C651C
	ldr r0, _080C6520
	str r0, [r1]
	ldr r1, _080C6524
	ldr r0, _080C6528
	b _080C657C
	.align 2, 0
_080C6514: .4byte gScriptResult
_080C6518: .4byte gUnknown_0203923C
_080C651C: .4byte gUnknown_0300485C
_080C6520: .4byte sub_808AB90
_080C6524: .4byte gUnknown_03005CE4
_080C6528: .4byte sub_80C639C
_080C652C:
	adds r0, r4, 0
	bl sub_805720C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C655C
	bl sub_80C6264
	ldr r1, _080C654C
	ldr r0, _080C6550
	str r0, [r1]
	ldr r1, _080C6554
	ldr r0, _080C6558
	b _080C657C
	.align 2, 0
_080C654C: .4byte gUnknown_0300485C
_080C6550: .4byte sub_808AB90
_080C6554: .4byte gUnknown_03005CE4
_080C6558: .4byte sub_80C64A8
_080C655C:
	adds r0, r4, 0
	bl is_tile_x98
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C656E
_080C656A:
	movs r0, 0
	b _080C6580
_080C656E:
	bl sub_80C6264
	ldr r1, _080C6588
	ldr r0, _080C658C
	str r0, [r1]
	ldr r1, _080C6590
	ldr r0, _080C6594
_080C657C:
	str r0, [r1]
	movs r0, 0x1
_080C6580:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6588: .4byte gUnknown_0300485C
_080C658C: .4byte sub_808AB90
_080C6590: .4byte gUnknown_03005CE4
_080C6594: .4byte sub_80C660C
	thumb_func_end SetUpFieldMove_SecretPower

	thumb_func_start sub_80C639C
sub_80C639C: @ 80C6598
	push {lr}
	ldr r1, _080C65AC
	ldr r0, _080C65B0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C65B4
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C65AC: .4byte gUnknown_0202FF84
_080C65B0: .4byte gUnknown_03005CE0
_080C65B4: .4byte gUnknown_081A2CE6
	thumb_func_end sub_80C639C

	thumb_func_start FldEff_UseSecretPowerCave
FldEff_UseSecretPowerCave: @ 80C65B8
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C65DC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C65E0
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C65DC: .4byte gTasks
_080C65E0: .4byte sub_80C63E8
	thumb_func_end FldEff_UseSecretPowerCave

	thumb_func_start sub_80C63E8
sub_80C63E8: @ 80C65E4
	push {lr}
	movs r0, 0xB
	bl FieldEffectActiveListRemove
	movs r0, 0x37
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C63E8

	thumb_func_start FldEff_SecretPowerCave
FldEff_SecretPowerCave: @ 80C65F8
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C6638
	ldr r3, _080C663C
	ldr r1, _080C6640
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6644
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6638: .4byte gSpriteTemplate_83D2614
_080C663C: .4byte gSprites
_080C6640: .4byte gPlayerAvatar
_080C6644: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_SecretPowerCave

	thumb_func_start sub_80C644C
sub_80C644C: @ 80C6648
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x83
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C6660
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6660: .4byte sub_80C6468
	thumb_func_end sub_80C644C

	thumb_func_start sub_80C6468
sub_80C6468: @ 80C6664
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C6684
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C668C
	bl sub_80BB800
	b _080C668C
_080C6684:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6690
	str r0, [r1, 0x1C]
_080C668C:
	pop {r0}
	bx r0
	.align 2, 0
_080C6690: .4byte sub_80C6498
	thumb_func_end sub_80C6468

	thumb_func_start sub_80C6498
sub_80C6498: @ 80C6694
	push {lr}
	movs r1, 0x37
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6498

	thumb_func_start sub_80C64A8
sub_80C64A8: @ 80C66A4
	push {lr}
	ldr r1, _080C66B8
	ldr r0, _080C66BC
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C66C0
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C66B8: .4byte gUnknown_0202FF84
_080C66BC: .4byte gUnknown_03005CE0
_080C66C0: .4byte gUnknown_081A2D3E
	thumb_func_end sub_80C64A8

	thumb_func_start FldEff_UseSecretPowerTree
FldEff_UseSecretPowerTree: @ 80C66C4
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C66E8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C66EC
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C66E8: .4byte gTasks
_080C66EC: .4byte sub_80C64F4
	thumb_func_end FldEff_UseSecretPowerTree

	thumb_func_start sub_80C64F4
sub_80C64F4: @ 80C66F0
	push {lr}
	movs r0, 0x1A
	bl FieldEffectActiveListRemove
	movs r0, 0x38
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C64F4

	thumb_func_start FldEff_SecretPowerTree
FldEff_SecretPowerTree: @ 80C6704
	push {r4,lr}
	ldr r1, _080C677C
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r2, r0, 0
	ldr r1, _080C6780
	adds r0, r1, 0
	ands r2, r0
	cmp r2, 0x96
	bne _080C6726
	ldr r1, _080C6784
	movs r0, 0
	str r0, [r1, 0x1C]
_080C6726:
	cmp r2, 0x9C
	bne _080C6730
	ldr r1, _080C6784
	movs r0, 0x2
	str r0, [r1, 0x1C]
_080C6730:
	bl sub_80C6280
	ldr r0, _080C6788
	ldr r3, _080C678C
	ldr r1, _080C6790
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C6784
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	ldr r0, [r4, 0x1C]
	cmp r0, 0x1
	beq _080C676E
	cmp r0, 0x3
	bne _080C6772
_080C676E:
	bl sub_80BB800
_080C6772:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C677C: .4byte gUnknown_0203923C
_080C6780: .4byte 0x00000fff
_080C6784: .4byte gUnknown_0202FF84
_080C6788: .4byte gSpriteTemplate_83D262C
_080C678C: .4byte gSprites
_080C6790: .4byte gPlayerAvatar
	thumb_func_end FldEff_SecretPowerTree

	thumb_func_start sub_80C6598
sub_80C6598: @ 80C6794
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x9B
	bl PlaySE
	ldr r0, _080C67B8
	ldr r1, [r0, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2A
	movs r0, 0
	strb r1, [r2]
	strh r0, [r4, 0x2E]
	ldr r0, _080C67BC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C67B8: .4byte gUnknown_0202FF84
_080C67BC: .4byte sub_80C65C4
	thumb_func_end sub_80C6598

	thumb_func_start sub_80C65C4
sub_80C65C4: @ 80C67C0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _080C67EA
	ldr r0, _080C67F0
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080C67DE
	cmp r0, 0x2
	bne _080C67E2
_080C67DE:
	bl sub_80BB800
_080C67E2:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C67F4
	str r0, [r4, 0x1C]
_080C67EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C67F0: .4byte gUnknown_0202FF84
_080C67F4: .4byte sub_80C65FC
	thumb_func_end sub_80C65C4

	thumb_func_start sub_80C65FC
sub_80C65FC: @ 80C67F8
	push {lr}
	movs r1, 0x38
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C65FC

	thumb_func_start sub_80C660C
sub_80C660C: @ 80C6808
	push {lr}
	ldr r1, _080C681C
	ldr r0, _080C6820
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080C6824
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C681C: .4byte gUnknown_0202FF84
_080C6820: .4byte gUnknown_03005CE0
_080C6824: .4byte gUnknown_081A2D96
	thumb_func_end sub_80C660C

	thumb_func_start FldEff_UseSecretPowerShrub
FldEff_UseSecretPowerShrub: @ 80C6828
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C684C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080C6850
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C684C: .4byte gTasks
_080C6850: .4byte sub_80C6658
	thumb_func_end FldEff_UseSecretPowerShrub

	thumb_func_start sub_80C6658
sub_80C6658: @ 80C6854
	push {lr}
	movs r0, 0x1B
	bl FieldEffectActiveListRemove
	movs r0, 0x39
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80C6658

	thumb_func_start FldEff_SecretPowerShrub
FldEff_SecretPowerShrub: @ 80C6868
	push {r4,lr}
	bl sub_80C6280
	ldr r0, _080C68A8
	ldr r3, _080C68AC
	ldr r1, _080C68B0
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 23
	ldr r4, _080C68B4
	ldr r3, [r4, 0x14]
	adds r1, r3
	lsls r1, 16
	asrs r1, 16
	ldrb r2, [r2]
	ldr r3, [r4, 0x18]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x94
	bl CreateSprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C68A8: .4byte gSpriteTemplate_83D2644
_080C68AC: .4byte gSprites
_080C68B0: .4byte gPlayerAvatar
_080C68B4: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_SecretPowerShrub

	thumb_func_start sub_80C66BC
sub_80C66BC: @ 80C68B8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA9
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080C68D0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C68D0: .4byte sub_80C66D8
	thumb_func_end sub_80C66BC

	thumb_func_start sub_80C66D8
sub_80C66D8: @ 80C68D4
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0x27
	bgt _080C68F4
	adds r0, r2, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080C68FC
	bl sub_80BB800
	b _080C68FC
_080C68F4:
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080C6900
	str r0, [r1, 0x1C]
_080C68FC:
	pop {r0}
	bx r0
	.align 2, 0
_080C6900: .4byte sub_80C6708
	thumb_func_end sub_80C66D8

	thumb_func_start sub_80C6708
sub_80C6708: @ 80C6904
	push {lr}
	movs r1, 0x39
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80C6708

	thumb_func_start FldEff_PCTurnOn
FldEff_PCTurnOn: @ 80C6914
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _080C6954
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6958
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r1, 0x8]
	ldrh r0, [r4]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6954: .4byte sub_80C6760
_080C6958: .4byte gTasks
	thumb_func_end FldEff_PCTurnOn

	thumb_func_start sub_80C6760
sub_80C6760: @ 80C695C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C6984
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	subs r0, 0x4
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bhi _080C6A2A
	lsls r0, 2
	ldr r1, _080C6988
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6984: .4byte 0x03004b38
_080C6988: .4byte _080C698C
	.align 2, 0
_080C698C:
	.4byte _080C69D0
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C69DE
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C69D0
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C69DE
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C6A2A
	.4byte _080C69FC
_080C69D0:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	b _080C69EA
_080C69DE:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x88
	lsls r2, 2
_080C69EA:
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	b _080C6A2A
_080C69FC:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r0, 0x3D
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080C6A30
_080C6A2A:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
_080C6A30:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6760

	thumb_func_start sub_80C683C
sub_80C683C: @ 80C6A38
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080C6A70
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080C6A74
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	b _080C6A84
	.align 2, 0
_080C6A70: .4byte 0x00004054
_080C6A74:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _080C6A9C
	bl MapGridSetMetatileIdAt
_080C6A84:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6A9C: .4byte 0x00000e21
	thumb_func_end sub_80C683C

	thumb_func_start sub_80C68A4
sub_80C68A4: @ 80C6AA0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080C6AE0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6AE4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x10]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6AE0: .4byte sub_80C68EC
_080C6AE4: .4byte gTasks
	thumb_func_end sub_80C68A4

	thumb_func_start sub_80C68EC
sub_80C68EC: @ 80C6AE8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C6B08
	adds r4, r0, r1
	ldrh r1, [r4, 0x6]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	bne _080C6B0C
	movs r0, 0
	b _080C6B0E
	.align 2, 0
_080C6B08: .4byte 0x03004b38
_080C6B0C:
	adds r0, r1, 0x1
_080C6B0E:
	strh r0, [r4, 0x6]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080C6B60
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _080C6B28
	movs r2, 0
	ldrsh r0, [r4, r2]
	bl DoBalloonSoundEffect
_080C6B28:
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x8]
	ldrh r3, [r4]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl MapGridSetMetatileIdAt
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x3
	bne _080C6B5C
	adds r0, r5, 0
	bl DestroyTask
	b _080C6B60
_080C6B5C:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_080C6B60:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C68EC

	thumb_func_start DoBalloonSoundEffect
DoBalloonSoundEffect: @ 80C6B68
	push {lr}
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 2
	cmp r1, r0
	beq _080C6B94
	cmp r1, r0
	bgt _080C6B84
	movs r0, 0x8A
	lsls r0, 2
	cmp r1, r0
	beq _080C6BAC
	b _080C6BB2
_080C6B84:
	movs r0, 0xCF
	lsls r0, 2
	cmp r1, r0
	beq _080C6B9C
	adds r0, 0x4
	cmp r1, r0
	beq _080C6BA4
	b _080C6BB2
_080C6B94:
	movs r0, 0x4A
	bl PlaySE
	b _080C6BB2
_080C6B9C:
	movs r0, 0x4B
	bl PlaySE
	b _080C6BB2
_080C6BA4:
	movs r0, 0x4C
	bl PlaySE
	b _080C6BB2
_080C6BAC:
	movs r0, 0x4E
	bl PlaySE
_080C6BB2:
	pop {r0}
	bx r0
	thumb_func_end DoBalloonSoundEffect

	thumb_func_start FldEff_Nop47
FldEff_Nop47: @ 80C6BB8
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop47

	thumb_func_start FldEff_Nop48
FldEff_Nop48: @ 80C6BBC
	movs r0, 0
	bx lr
	thumb_func_end FldEff_Nop48

	thumb_func_start sub_80C69C4
sub_80C69C4: @ 80C6BC0
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x4D
	bl PlaySE
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	ldr r2, _080C6C08
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	subs r6, r4, 0x1
	ldr r2, _080C6C0C
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r6, 0
	bl CurrentMapDrawMetatileAt
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6C08: .4byte 0x00000276
_080C6C0C: .4byte 0x0000026e
	thumb_func_end sub_80C69C4

	thumb_func_start sub_80C6A14
sub_80C6A14: @ 80C6C10
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6C40
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	bne _080C6C44
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	movs r3, 0xC
	ldrsh r1, [r1, r3]
	bl sub_80C69C4
	adds r0, r4, 0
	bl DestroyTask
	b _080C6C48
	.align 2, 0
_080C6C40: .4byte gTasks
_080C6C44:
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
_080C6C48:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6A14

	thumb_func_start sub_80C6A54
sub_80C6A54: @ 80C6C50
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r7, r5, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C6C78
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r4, 16
	asrs r1, 16
	bl sub_80C69C4
	b _080C6C9A
_080C6C78:
	cmp r0, 0x2
	bne _080C6C9A
	ldr r0, _080C6CA0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6CA4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r7, [r1, 0xA]
	strh r6, [r1, 0xC]
_080C6C9A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C6CA0: .4byte sub_80C6A14
_080C6CA4: .4byte gTasks
	thumb_func_end sub_80C6A54

	thumb_func_start Task_DecorationSoundEffect
Task_DecorationSoundEffect: @ 80C6CA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C6CE0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x7
	beq _080C6CC4
	b _080C6E22
_080C6CC4:
	ldr r2, _080C6CE4
	adds r0, r2, 0
	ldrh r1, [r1, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	bls _080C6CD6
	b _080C6E1A
_080C6CD6:
	lsls r0, 2
	ldr r1, _080C6CE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6CE0: .4byte gTasks
_080C6CE4: .4byte 0xfffffd88
_080C6CE8: .4byte _080C6CEC
	.align 2, 0
_080C6CEC:
	.4byte _080C6DDC
	.4byte _080C6DE4
	.4byte _080C6DEC
	.4byte _080C6DF4
	.4byte _080C6DFC
	.4byte _080C6E04
	.4byte _080C6E0C
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E1A
	.4byte _080C6E14
_080C6DDC:
	movs r0, 0x3E
	bl PlaySE
	b _080C6E1A
_080C6DE4:
	movs r0, 0x3F
	bl PlaySE
	b _080C6E1A
_080C6DEC:
	movs r0, 0x40
	bl PlaySE
	b _080C6E1A
_080C6DF4:
	movs r0, 0x41
	bl PlaySE
	b _080C6E1A
_080C6DFC:
	movs r0, 0x42
	bl PlaySE
	b _080C6E1A
_080C6E04:
	movs r0, 0x43
	bl PlaySE
	b _080C6E1A
_080C6E0C:
	movs r0, 0x44
	bl PlaySE
	b _080C6E1A
_080C6E14:
	movs r0, 0x45
	bl PlaySE
_080C6E1A:
	adds r0, r4, 0
	bl DestroyTask
	b _080C6E26
_080C6E22:
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
_080C6E26:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_DecorationSoundEffect

	thumb_func_start DoDecorationSoundEffect
DoDecorationSoundEffect: @ 80C6E2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080C6E58
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C6E5C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r0, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6E58: .4byte Task_DecorationSoundEffect
_080C6E5C: .4byte gTasks
	thumb_func_end DoDecorationSoundEffect

	thumb_func_start SpriteCB_YellowCave4Sparkle
SpriteCB_YellowCave4Sparkle: @ 80C6E60
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080C6E78
	movs r0, 0xC3
	bl PlaySE
_080C6E78:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1F
	ble _080C6E86
	adds r0, r4, 0
	bl DestroySprite
_080C6E86:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_YellowCave4Sparkle

	thumb_func_start DoYellowCave4Sparkle
DoYellowCave4Sparkle: @ 80C6E8C
	push {r4,lr}
	sub sp, 0x4
	ldr r3, _080C6F24
	ldr r2, _080C6F28
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _080C6F2C
	ldr r0, [r0, 0x58]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080C6F1A
	ldr r3, _080C6F30
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r3
	movs r0, 0x3E
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080C6F34
	str r0, [r2]
	movs r0, 0
	strh r0, [r4, 0x2E]
_080C6F1A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6F24: .4byte gMapObjects
_080C6F28: .4byte gPlayerAvatar
_080C6F2C: .4byte gFieldEffectObjectTemplatePointers
_080C6F30: .4byte gSprites
_080C6F34: .4byte SpriteCB_YellowCave4Sparkle
	thumb_func_end DoYellowCave4Sparkle

	thumb_func_start FldEff_SandPillar
FldEff_SandPillar: @ 80C6F38
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r1, _080C6F74
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r1, 0x14]
	movs r3, 0
	ldrsh r0, [r4, r3]
	str r0, [r1, 0x18]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080C6FB8
	cmp r0, 0x2
	bgt _080C6F78
	cmp r0, 0x1
	beq _080C6F82
	b _080C7048
	.align 2, 0
_080C6F74: .4byte gUnknown_0202FF84
_080C6F78:
	cmp r0, 0x3
	beq _080C6FE8
	cmp r0, 0x4
	beq _080C7020
	b _080C7048
_080C6F82:
	ldr r0, _080C6FAC
	ldr r3, _080C6FB0
	ldr r1, _080C6FB4
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x20
	movs r3, 0
	bl CreateSprite
	b _080C7048
	.align 2, 0
_080C6FAC: .4byte gSpriteTemplate_83D26A0
_080C6FB0: .4byte gSprites
_080C6FB4: .4byte gPlayerAvatar
_080C6FB8:
	ldr r0, _080C6FDC
	ldr r3, _080C6FE0
	ldr r1, _080C6FE4
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0x80
	lsls r3, 12
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	b _080C7008
	.align 2, 0
_080C6FDC: .4byte gSpriteTemplate_83D26A0
_080C6FE0: .4byte gSprites
_080C6FE4: .4byte gPlayerAvatar
_080C6FE8:
	ldr r0, _080C7010
	ldr r3, _080C7014
	ldr r1, _080C7018
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	ldr r3, _080C701C
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
_080C7008:
	movs r3, 0x94
	bl CreateSprite
	b _080C7048
	.align 2, 0
_080C7010: .4byte gSpriteTemplate_83D26A0
_080C7014: .4byte gSprites
_080C7018: .4byte gPlayerAvatar
_080C701C: .4byte 0xfff80000
_080C7020:
	ldr r0, _080C7054
	ldr r3, _080C7058
	ldr r1, _080C705C
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r3, 0xC0
	lsls r3, 13
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2]
	adds r2, 0x10
	movs r3, 0x94
	bl CreateSprite
_080C7048:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C7054: .4byte gSpriteTemplate_83D26A0
_080C7058: .4byte gSprites
_080C705C: .4byte gPlayerAvatar
	thumb_func_end FldEff_SandPillar

	thumb_func_start SpriteCB_SandPillar_0
SpriteCB_SandPillar_0: @ 80C7060
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r0, 0x83
	bl PlaySE
	ldr r4, _080C708C
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl MapGridGetMetatileIdAt
	ldr r1, _080C7090
	cmp r0, r1
	bne _080C7098
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	ldr r2, _080C7094
	bl MapGridSetMetatileIdAt
	b _080C70A6
	.align 2, 0
_080C708C: .4byte gUnknown_0202FF84
_080C7090: .4byte 0x00000286
_080C7094: .4byte 0x00000e02
_080C7098:
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	movs r2, 0xA1
	lsls r2, 2
	bl MapGridSetMetatileIdAt
_080C70A6:
	ldr r4, _080C70D4
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C70D8
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	subs r1, 0x1
	bl CurrentMapDrawMetatileAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C70DC
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C70D4: .4byte gUnknown_0202FF84
_080C70D8: .4byte 0x0000020a
_080C70DC: .4byte SpriteCB_SandPillar_1
	thumb_func_end SpriteCB_SandPillar_0

	thumb_func_start SpriteCB_SandPillar_1
SpriteCB_SandPillar_1: @ 80C70E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x11
	bgt _080C70F4
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080C7110
_080C70F4:
	ldr r4, _080C7118
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	ldr r2, _080C711C
	bl MapGridSetMetatileIdAt
	ldr r0, [r4, 0x14]
	ldr r1, [r4, 0x18]
	bl CurrentMapDrawMetatileAt
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080C7120
	str r0, [r5, 0x1C]
_080C7110:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7118: .4byte gUnknown_0202FF84
_080C711C: .4byte 0x00000e8c
_080C7120: .4byte SpriteCB_SandPillar_2
	thumb_func_end SpriteCB_SandPillar_1

	thumb_func_start SpriteCB_SandPillar_2
SpriteCB_SandPillar_2: @ 80C7124
	push {lr}
	movs r1, 0x34
	bl FieldEffectStop
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_SandPillar_2

	thumb_func_start GetShieldToyTVDecorationInfo
GetShieldToyTVDecorationInfo: @ 80C7134
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _080C716C
	cmp r1, r0
	beq _080C71E4
	cmp r1, r0
	bgt _080C7170
	subs r0, 0x17
	cmp r1, r0
	beq _080C71AC
	adds r0, 0x16
	cmp r1, r0
	beq _080C71D8
	b _080C71F6
	.align 2, 0
_080C716C: .4byte 0x000002f5
_080C7170:
	ldr r0, _080C7198
	cmp r1, r0
	beq _080C71F0
	adds r0, 0x40
	cmp r1, r0
	bne _080C71F6
	ldr r0, _080C719C
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080C71A0
	ldr r1, _080C71A4
	bl StringCopy
	ldr r1, _080C71A8
	movs r0, 0
	b _080C71F4
	.align 2, 0
_080C7198: .4byte 0x000002f6
_080C719C: .4byte gStringVar1
_080C71A0: .4byte gStringVar2
_080C71A4: .4byte gSecretBaseText_GoldRank
_080C71A8: .4byte gScriptResult
_080C71AC:
	ldr r0, _080C71C8
	movs r1, 0x32
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080C71CC
	ldr r1, _080C71D0
	bl StringCopy
	ldr r1, _080C71D4
	movs r0, 0
	b _080C71F4
	.align 2, 0
_080C71C8: .4byte gStringVar1
_080C71CC: .4byte gStringVar2
_080C71D0: .4byte gSecretBaseText_SilverRank
_080C71D4: .4byte gScriptResult
_080C71D8:
	ldr r1, _080C71E0
	movs r0, 0x1
	b _080C71F4
	.align 2, 0
_080C71E0: .4byte gScriptResult
_080C71E4:
	ldr r1, _080C71EC
	movs r0, 0x2
	b _080C71F4
	.align 2, 0
_080C71EC: .4byte gScriptResult
_080C71F0:
	ldr r1, _080C7200
	movs r0, 0x3
_080C71F4:
	strh r0, [r1]
_080C71F6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7200: .4byte gScriptResult
	thumb_func_end GetShieldToyTVDecorationInfo

	thumb_func_start Task_FieldPoisonEffect
Task_FieldPoisonEffect: @ 80C7204
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080C7228
	adds r1, r0, r1
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C7242
	cmp r0, 0x1
	bgt _080C722C
	cmp r0, 0
	beq _080C7232
	b _080C725E
	.align 2, 0
_080C7228: .4byte 0x03004b38
_080C722C:
	cmp r0, 0x2
	beq _080C7256
	b _080C725E
_080C7232:
	ldrh r0, [r1, 0x2]
	adds r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080C725E
	b _080C724E
_080C7242:
	ldrh r0, [r1, 0x2]
	subs r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080C725E
_080C724E:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080C725E
_080C7256:
	adds r0, r2, 0
	bl DestroyTask
	b _080C7268
_080C725E:
	ldr r2, _080C726C
	ldrh r1, [r1, 0x2]
	lsls r0, r1, 4
	orrs r0, r1
	strh r0, [r2]
_080C7268:
	pop {r0}
	bx r0
	.align 2, 0
_080C726C: .4byte 0x0400004c
	thumb_func_end Task_FieldPoisonEffect

	thumb_func_start DoFieldPoisonEffect
DoFieldPoisonEffect: @ 80C7270
	push {lr}
	movs r0, 0x4F
	bl PlaySE
	ldr r0, _080C7284
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C7284: .4byte Task_FieldPoisonEffect
	thumb_func_end DoFieldPoisonEffect

	thumb_func_start FieldPoisonEffectIsRunning
FieldPoisonEffectIsRunning: @ 80C7288
	push {lr}
	ldr r0, _080C7298
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C7298: .4byte Task_FieldPoisonEffect
	thumb_func_end FieldPoisonEffectIsRunning

	thumb_func_start Task_WateringBerryTreeAnim_0
Task_WateringBerryTreeAnim_0: @ 80C729C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C72B0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C72B4
	str r0, [r1]
	bx lr
	.align 2, 0
_080C72B0: .4byte gTasks
_080C72B4: .4byte Task_WateringBerryTreeAnim_1
	thumb_func_end Task_WateringBerryTreeAnim_0

	thumb_func_start Task_WateringBerryTreeAnim_1
Task_WateringBerryTreeAnim_1: @ 80C72B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C731C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7320
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080C72E4
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C7316
_080C72E4:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059D08
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _080C7324
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C7328
	str r1, [r0]
_080C7316:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C731C: .4byte gPlayerAvatar
_080C7320: .4byte gMapObjects
_080C7324: .4byte gTasks
_080C7328: .4byte Task_WateringBerryTreeAnim_2
	thumb_func_end Task_WateringBerryTreeAnim_1

	thumb_func_start Task_WateringBerryTreeAnim_2
Task_WateringBerryTreeAnim_2: @ 80C732C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C7380
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C7384
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080C7390
	ldr r1, _080C7388
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080C738C
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	b _080C7390
	.align 2, 0
_080C7380: .4byte gPlayerAvatar
_080C7384: .4byte gMapObjects
_080C7388: .4byte gTasks
_080C738C:
	ldr r0, _080C7398
	str r0, [r2]
_080C7390:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7398: .4byte Task_WateringBerryTreeAnim_3
	thumb_func_end Task_WateringBerryTreeAnim_2

	thumb_func_start Task_WateringBerryTreeAnim_3
Task_WateringBerryTreeAnim_3: @ 80C739C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80597D0
	lsls r0, 24
	lsrs r0, 24
	bl SetPlayerAvatarTransitionFlags
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end Task_WateringBerryTreeAnim_3

	thumb_func_start DoWateringBerryTreeAnim
DoWateringBerryTreeAnim: @ 80C73C0
	push {lr}
	ldr r0, _080C73D0
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C73D0: .4byte Task_WateringBerryTreeAnim_0
	thumb_func_end DoWateringBerryTreeAnim

	thumb_func_start CreateRecordMixingSprite
CreateRecordMixingSprite: @ 80C73D4
	push {r4,r5,lr}
	ldr r0, _080C7428
	bl LoadSpritePalette
	ldr r0, _080C742C
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7434
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _080C7430
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r0, 0x10
	movs r1, 0xD
	bl sub_8060388
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	adds r0, r5, 0
	b _080C7436
	.align 2, 0
_080C7428: .4byte gUnknown_083D2878
_080C742C: .4byte gSpriteTemplate_83D2894
_080C7430: .4byte gSprites
_080C7434:
	movs r0, 0x40
_080C7436:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CreateRecordMixingSprite

	thumb_func_start DestroyRecordMixingSprite
DestroyRecordMixingSprite: @ 80C743C
	push {r4-r7,lr}
	ldr r4, _080C7470
	adds r7, r4, 0
	movs r6, 0
	movs r5, 0x3F
_080C7446:
	adds r0, r7, 0
	adds r0, 0x14
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, _080C7474
	cmp r1, r0
	bne _080C7460
	adds r0, r4, 0
	bl FreeSpritePalette
	adds r0, r4, 0
	bl DestroySprite
_080C7460:
	adds r4, 0x44
	adds r6, 0x44
	subs r5, 0x1
	cmp r5, 0
	bge _080C7446
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7470: .4byte gSprites
_080C7474: .4byte gSpriteTemplate_83D2894
	thumb_func_end DestroyRecordMixingSprite

	.align 2, 0 @ Don't pad with nop.
