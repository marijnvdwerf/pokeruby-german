	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_814A590
sub_814A590: @ 814A95C
	ldr r0, _0814A978
	movs r1, 0x40
	strb r1, [r0]
	ldr r0, _0814A97C
	strb r1, [r0]
	ldr r0, _0814A980
	strb r1, [r0]
	ldr r0, _0814A984
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0814A988
	strb r1, [r0]
	bx lr
	.align 2, 0
_0814A978: .4byte gUnknown_0203A3D0
_0814A97C: .4byte gUnknown_0203A3D1
_0814A980: .4byte gUnknown_0203A3D2
_0814A984: .4byte gUnknown_0203A3D3
_0814A988: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A590

	thumb_func_start sub_814A5C0
sub_814A5C0: @ 814A98C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814AA44
	ldrb r0, [r0]
	cmp r0, 0x40
	bne _0814A9BE
	ldr r0, _0814AA48
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814A9C2
_0814A9BE:
	bl sub_814A7FC
_0814A9C2:
	movs r4, 0x1
	ldr r0, _0814AA4C
	cmp r6, r0
	bne _0814A9E8
	ldr r1, _0814AA50
	movs r0, 0xF
	ands r0, r5
	lsls r0, 1
	adds r0, r1
	strh r7, [r0]
	ldr r0, _0814AA54
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814A9E8
	ldr r6, _0814AA58
	movs r4, 0
_0814A9E8:
	movs r7, 0xF
	adds r0, r5, 0
	ands r0, r7
	lsls r0, 3
	ldr r1, _0814AA5C
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r4, _0814AA60
	adds r0, r4
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r5, _0814AA44
	strb r0, [r5]
	adds r4, 0x30
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814AA48
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814AA7A
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AA64
	adds r4, r0, r1
	ldr r0, _0814AA4C
	cmp r6, r0
	bne _0814AA68
	ldrb r1, [r4, 0x5]
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814AA7A
	.align 2, 0
_0814AA44: .4byte gUnknown_0203A3D0
_0814AA48: .4byte gUnknown_0203A3D1
_0814AA4C: .4byte 0x0000ffff
_0814AA50: .4byte gUnknown_0203A360
_0814AA54: .4byte gUnknown_0842F240
_0814AA58: .4byte 0x0000fff0
_0814AA5C: .4byte gUnknown_0842F140
_0814AA60: .4byte gSpriteTemplate_842F250
_0814AA64: .4byte gSprites
_0814AA68:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814AA7A:
	ldr r1, _0814AAA0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAF8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAA4
	adds r4, r0, r1
	ldr r0, _0814AAA8
	cmp r6, r0
	bne _0814AAAC
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814AABE
	.align 2, 0
_0814AAA0: .4byte gUnknown_0203A3D1
_0814AAA4: .4byte gSprites
_0814AAA8: .4byte 0x0000ffff
_0814AAAC:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814AABE:
	movs r3, 0x80
	lsls r3, 19
	ldrh r1, [r3]
	movs r0, 0xC0
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0814AAD8
	ldr r0, _0814AB10
	ldrb r1, [r0]
	movs r2, 0x1F
	orrs r1, r2
	strb r1, [r0]
_0814AAD8:
	ldr r1, _0814AB14
	ldrh r0, [r3]
	lsrs r0, 15
	strb r0, [r1]
	ldr r1, _0814AB18
	ldr r2, _0814AB1C
	ldrb r0, [r2]
	strb r0, [r1]
	ldrh r0, [r3]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r0, 0x10
	strb r0, [r2]
_0814AAF8:
	mov r0, r9
	bl sub_814A958
	ldr r0, _0814AB20
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814AB10: .4byte 0x0400004a
_0814AB14: .4byte gUnknown_0203A3D3
_0814AB18: .4byte gUnknown_0203A3D4
_0814AB1C: .4byte 0x0400004b
_0814AB20: .4byte gUnknown_0203A3D0
	thumb_func_end sub_814A5C0

	thumb_func_start sub_814A758
sub_814A758: @ 814AB24
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r1, 0
	movs r3, 0
	bl sub_814A5C0
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x40
	beq _0814AB66
	ldr r0, _0814AB70
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AB74
	adds r1, r0
	lsls r3, r5, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_0814AB66:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814AB70: .4byte gUnknown_0203A3D0
_0814AB74: .4byte gSprites
	thumb_func_end sub_814A758

	thumb_func_start unref_sub_814A7AC
unref_sub_814A7AC: @ 814AB78
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	movs r3, 0
	movs r2, 0xF
	movs r1, 0
	ldr r6, _0814ABC4
	movs r5, 0xF
_0814AB92:
	lsls r0, r1, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r4
	bne _0814ABA6
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r1, 0
	ands r2, r5
_0814ABA6:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814AB92
	mov r0, r12
	adds r1, r3, 0
	adds r3, r7, 0
	bl sub_814A758
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814ABC4: .4byte gPlttBufferUnfaded
	thumb_func_end unref_sub_814A7AC

	thumb_func_start sub_814A7FC
sub_814A7FC: @ 814ABC8
	push {r4,lr}
	ldr r4, _0814AC2C
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814ABEC
	ldr r0, _0814AC30
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC34
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814ABEC:
	ldr r4, _0814AC38
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814AC24
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC34
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _0814AC3C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814AC1C
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814AC40
	ands r0, r1
	strh r0, [r2]
_0814AC1C:
	ldr r0, _0814AC44
	ldr r1, _0814AC48
	ldrb r1, [r1]
	strb r1, [r0]
_0814AC24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AC2C: .4byte gUnknown_0203A3D0
_0814AC30: .4byte gUnknown_0842F140
_0814AC34: .4byte gSprites
_0814AC38: .4byte gUnknown_0203A3D1
_0814AC3C: .4byte gUnknown_0203A3D3
_0814AC40: .4byte 0x00007fff
_0814AC44: .4byte 0x0400004b
_0814AC48: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A7FC

	thumb_func_start sub_814A880
sub_814A880: @ 814AC4C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r6, r4, 0
	ldr r1, _0814ACC4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC8C
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ACC8
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814AC8C:
	ldr r1, _0814ACCC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ACBE
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ACC8
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r7, [r2, 0x20]
	strh r6, [r2, 0x22]
_0814ACBE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814ACC4: .4byte gUnknown_0203A3D0
_0814ACC8: .4byte gSprites
_0814ACCC: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A880

	thumb_func_start sub_814A904
sub_814A904: @ 814ACD0
	push {lr}
	ldr r1, _0814AD18
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ACF2
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD1C
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814ACF2:
	ldr r1, _0814AD20
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AD12
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD1C
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814AD12:
	pop {r0}
	bx r0
	.align 2, 0
_0814AD18: .4byte gUnknown_0203A3D0
_0814AD1C: .4byte gSprites
_0814AD20: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A904

	thumb_func_start sub_814A958
sub_814A958: @ 814AD24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _0814AD90
	ldr r2, _0814AD94
	lsrs r0, 24
	str r0, [sp]
	ldr r0, _0814AD98
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	adds r4, 0x8
	movs r7, 0x1
	movs r2, 0x1
	ldr r1, [sp]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0814AE0A
	ldr r0, _0814AD9C
	mov r12, r0
	mov r8, r1
	movs r1, 0x8
	negs r1, r1
	mov r10, r1
	ldr r5, _0814ADA0
	mov r9, r5
_0814AD6A:
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r3, 0x1F
	ble _0814ADA4
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r2, r0, 16
	ldr r3, [sp]
	lsls r5, r3, 16
	b _0814ADF0
	.align 2, 0
_0814AD90: .4byte gMenuCursorSubsprites
_0814AD94: .4byte 0x0000ffff
_0814AD98: .4byte gUnknown_0842F780
_0814AD9C: .4byte gUnknown_0842F788
_0814ADA0: .4byte gUnknown_0842F790
_0814ADA4:
	ldr r6, [sp]
	lsls r5, r6, 16
	mov r0, r8
	cmp r0, 0x27
	ble _0814ADDA
	cmp r3, 0x8
	ble _0814ADDA
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	adds r2, r1, 0
	subs r2, 0x20
	adds r0, r3, 0
	mov r6, r10
	ands r0, r6
	adds r2, r0
	strh r2, [r4]
	movs r0, 0x18
	ands r0, r3
	adds r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	b _0814ADF0
_0814ADDA:
	mov r3, r9
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r6, 0x80
	lsls r6, 12
	adds r0, r6
	lsrs r2, r0, 16
_0814ADF0:
	adds r4, 0x8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	asrs r1, r5, 16
	lsls r0, r2, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	bgt _0814AD6A
_0814AE0A:
	ldr r5, _0814AE78
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, 0x7
	lsls r0, r3, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _0814AE7C
	ldrb r0, [r6]
	cmp r0, 0x40
	beq _0814AE48
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AE80
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AE84
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AE48:
	ldr r1, _0814AE88
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AE68
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AE80
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AE84
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AE68:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AE78: .4byte 0x0843d6d8
_0814AE7C: .4byte gUnknown_0203A3D0
_0814AE80: .4byte gSprites
_0814AE84: .4byte gSubspriteTables_842F5C0
_0814AE88: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A958

	thumb_func_start sub_814AABC
sub_814AABC: @ 814AE8C
	push {lr}
	adds r2, r0, 0
	ldr r1, _0814AEBC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AEA4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AEC0
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AEA4:
	ldr r1, _0814AEC4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AEB8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AEC0
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AEB8:
	pop {r0}
	bx r0
	.align 2, 0
_0814AEBC: .4byte gUnknown_0203A3D0
_0814AEC0: .4byte gSprites
_0814AEC4: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814AABC

	thumb_func_start sub_814AAF8
sub_814AAF8: @ 814AEC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	ldr r1, _0814AF40
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AF36
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AF44
	adds r4, r0, r1
	ldr r0, [r4, 0x14]
	ldrh r1, [r0, 0x2]
	ldr r0, _0814AF48
	cmp r1, r0
	bne _0814AF36
	movs r2, 0
	movs r3, 0xF
	movs r1, 0
	ldrb r5, [r4, 0x5]
	ldr r0, _0814AF4C
	mov r8, r0
	ldr r7, _0814AF50
	movs r6, 0xF
_0814AF02:
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r12
	bne _0814AF16
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r1, 0
	ands r3, r6
_0814AF16:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814AF02
	lsls r2, 4
	movs r1, 0xF
	adds r0, r1, 0
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, 0x5]
	ands r3, r1
	lsls r0, r3, 3
	add r0, r8
	bl RequestSpriteSheetCopy
_0814AF36:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AF40: .4byte gUnknown_0203A3D0
_0814AF44: .4byte gSprites
_0814AF48: .4byte 0x0000ffff
_0814AF4C: .4byte gUnknown_0842F140
_0814AF50: .4byte gPlttBufferUnfaded
	thumb_func_end sub_814AAF8

	thumb_func_start sub_814AB84
sub_814AB84: @ 814AF54
	push {r4,r5,lr}
	ldr r5, _0814AF9C
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814AF94
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0814AFA0
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
	ldr r0, _0814AFA4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814AF8C
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814AFA8
	ands r0, r1
	strh r0, [r2]
_0814AF8C:
	ldr r0, _0814AFAC
	ldr r1, _0814AFB0
	ldrb r1, [r1]
	strb r1, [r0]
_0814AF94:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814AF9C: .4byte gUnknown_0203A3D1
_0814AFA0: .4byte gSprites
_0814AFA4: .4byte gUnknown_0203A3D3
_0814AFA8: .4byte 0x00007fff
_0814AFAC: .4byte 0x0400004b
_0814AFB0: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814AB84

	thumb_func_start unref_sub_814ABE4
unref_sub_814ABE4: @ 814AFB4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0814B010
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0814B014
	movs r2, 0x28
	bl CpuSet
	ldr r1, _0814B018
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AFE8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B01C
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814B020
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AFE8:
	ldr r1, _0814B024
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814B008
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B01C
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814B020
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814B008:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B010: .4byte gUnknown_0842F5BC
_0814B014: .4byte gMenuCursorSubsprites
_0814B018: .4byte gUnknown_0203A3D0
_0814B01C: .4byte gSprites
_0814B020: .4byte gUnknown_0842F758
_0814B024: .4byte gUnknown_0203A3D1
	thumb_func_end unref_sub_814ABE4

	thumb_func_start CreateBlendedOutlineCursor
CreateBlendedOutlineCursor: @ 814B028
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814B0C8
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814B056
	bl sub_814AD44
_0814B056:
	movs r4, 0x1
	ldr r0, _0814B0CC
	cmp r5, r0
	bne _0814B07C
	ldr r1, _0814B0D0
	movs r0, 0xF
	ands r0, r7
	lsls r0, 1
	adds r0, r1
	strh r6, [r0]
	ldr r0, _0814B0D4
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814B07C
	ldr r5, _0814B0D8
	movs r4, 0
_0814B07C:
	movs r6, 0xF
	adds r0, r7, 0
	ands r0, r6
	lsls r0, 3
	ldr r1, _0814B0DC
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814B0E0
	adds r0, r1
	movs r1, 0
	movs r2, 0xA1
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814B0C8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814B0FA
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B0E4
	adds r4, r0, r1
	ldr r0, _0814B0CC
	cmp r5, r0
	bne _0814B0E8
	ldrb r1, [r4, 0x5]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814B0FA
	.align 2, 0
_0814B0C8: .4byte gUnknown_0203A3D2
_0814B0CC: .4byte 0x0000ffff
_0814B0D0: .4byte gUnknown_0203A360
_0814B0D4: .4byte gUnknown_0842F248
_0814B0D8: .4byte 0x0000fff1
_0814B0DC: .4byte gUnknown_0842F1C0
_0814B0E0: .4byte gSpriteTemplate_842F298
_0814B0E4: .4byte gSprites
_0814B0E8:
	adds r0, r5, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814B0FA:
	mov r0, r9
	bl sub_814ADF4
	ldr r0, _0814B110
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814B110: .4byte gUnknown_0203A3D2
	thumb_func_end CreateBlendedOutlineCursor

	thumb_func_start sub_814AD44
sub_814AD44: @ 814B114
	push {r4,lr}
	ldr r4, _0814B140
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814B138
	ldr r0, _0814B144
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B148
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814B138:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814B140: .4byte gUnknown_0203A3D2
_0814B144: .4byte gUnknown_0842F1C0
_0814B148: .4byte gSprites
	thumb_func_end sub_814AD44

	thumb_func_start sub_814AD7C
sub_814AD7C: @ 814B14C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0814B190
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814B188
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B194
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814B188:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814B190: .4byte gUnknown_0203A3D2
_0814B194: .4byte gSprites
	thumb_func_end sub_814AD7C

	thumb_func_start sub_814ADC8
sub_814ADC8: @ 814B198
	push {lr}
	ldr r1, _0814B1BC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814B1B8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B1C0
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0814B1B8:
	pop {r0}
	bx r0
	.align 2, 0
_0814B1BC: .4byte gUnknown_0203A3D2
_0814B1C0: .4byte gSprites
	thumb_func_end sub_814ADC8

	thumb_func_start sub_814ADF4
sub_814ADF4: @ 814B1C4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _0814B1D0
	movs r2, 0
_0814B1D0:
	ldr r1, _0814B1F4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814B1EE
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814B1F8
	adds r0, r1
	lsls r1, r2, 3
	ldr r2, _0814B1FC
	adds r1, r2
	bl SetSubspriteTables
_0814B1EE:
	pop {r0}
	bx r0
	.align 2, 0
_0814B1F4: .4byte gUnknown_0203A3D2
_0814B1F8: .4byte gSprites
_0814B1FC: .4byte gUnknown_0842F6C0
	thumb_func_end sub_814ADF4

	thumb_func_start de_sub_814B200
de_sub_814B200: @ 814B200
	bx lr
	thumb_func_end de_sub_814B200

	.align 2, 0 @ Don't pad with nop.
