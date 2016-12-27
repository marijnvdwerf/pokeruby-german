	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FA8EC
sub_80FA8EC: @ 80FAC9C
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	bl sub_80FA904
_080FACA6:
	bl sub_80FA940
	lsls r0, 24
	cmp r0, 0
	bne _080FACA6
	pop {r0}
	bx r0
	thumb_func_end sub_80FA8EC

	thumb_func_start sub_80FA904
sub_80FA904: @ 80FACB4
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080FACD8 @ =gUnknown_020388CC
	str r0, [r3]
	movs r2, 0x79
	adds r2, r0
	mov r12, r2
	movs r2, 0
	mov r4, r12
	strb r2, [r4]
	adds r0, 0x78
	strb r1, [r0]
	ldr r3, [r3]
	cmp r1, 0
	bne _080FACE0
	ldr r0, _080FACDC @ =sub_80FAB78
	b _080FACE2
	.align 2, 0
_080FACD8: .4byte gUnknown_020388CC
_080FACDC: .4byte sub_80FAB78
_080FACE0:
	ldr r0, _080FACEC @ =sub_80FAD04
_080FACE2:
	str r0, [r3, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FACEC: .4byte sub_80FAD04
	thumb_func_end sub_80FA904

	thumb_func_start sub_80FA940
sub_80FA940: @ 80FACF0
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _080FAD0C @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _080FAD02
	b _080FAE92
_080FAD02:
	lsls r0, 2
	ldr r1, _080FAD10 @ =_080FAD14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FAD0C: .4byte gUnknown_020388CC
_080FAD10: .4byte _080FAD14
	.align 2, 0
_080FAD14:
	.4byte _080FAD34
	.4byte _080FAD48
	.4byte _080FAD5C
	.4byte _080FAD6C
	.4byte _080FAD88
	.4byte _080FADA4
	.4byte _080FADE8
	.4byte _080FAE64
_080FAD34:
	ldr r0, _080FAD40 @ =gUnknown_083E5DA0
	ldr r1, _080FAD44 @ =0x06008000
	bl LZ77UnCompVram
	b _080FAEA4
	.align 2, 0
_080FAD40: .4byte gUnknown_083E5DA0
_080FAD44: .4byte 0x06008000
_080FAD48:
	ldr r0, _080FAD54 @ =gUnknown_083E6B04
	ldr r1, _080FAD58 @ =0x0600e000
	bl LZ77UnCompVram
	b _080FAEA4
	.align 2, 0
_080FAD54: .4byte gUnknown_083E6B04
_080FAD58: .4byte 0x0600e000
_080FAD5C:
	ldr r0, _080FAD68 @ =gUnknown_083E5D60
	movs r1, 0x70
	movs r2, 0x60
	bl LoadPalette
	b _080FAEA4
	.align 2, 0
_080FAD68: .4byte gUnknown_083E5D60
_080FAD6C:
	ldr r0, _080FAD80 @ =gUnknown_083E5AF0
	ldr r1, _080FAD84 @ =gUnknown_020388CC
	ldr r1, [r1]
	movs r2, 0xC0
	lsls r2, 1
	adds r1, r2
	bl LZ77UnCompWram
	b _080FAEA4
	.align 2, 0
_080FAD80: .4byte gUnknown_083E5AF0
_080FAD84: .4byte gUnknown_020388CC
_080FAD88:
	ldr r0, _080FAD9C @ =gUnknown_083E5B34
	ldr r1, _080FADA0 @ =gUnknown_020388CC
	ldr r1, [r1]
	movs r3, 0xA0
	lsls r3, 2
	adds r1, r3
	bl LZ77UnCompWram
	b _080FAEA4
	.align 2, 0
_080FAD9C: .4byte gUnknown_083E5B34
_080FADA0: .4byte gUnknown_020388CC
_080FADA4:
	bl sub_80FB32C
	ldr r4, _080FADE4 @ =gUnknown_020388CC
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x54
	ldrh r1, [r0]
	adds r0, 0x20
	strh r1, [r0]
	subs r0, 0x1E
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x76
	strh r0, [r1]
	ldrh r0, [r2, 0x14]
	bl sub_80FB758
	ldr r1, [r4]
	strb r0, [r1, 0x16]
	ldr r0, [r4]
	ldrh r0, [r0, 0x14]
	bl sub_80FB9C0
	adds r1, r0, 0
	ldr r0, [r4]
	strh r1, [r0, 0x14]
	ldrh r1, [r0, 0x14]
	movs r2, 0x10
	bl sub_80FBFB4
	b _080FAEA4
	.align 2, 0
_080FADE4: .4byte gUnknown_020388CC
_080FADE8:
	ldr r0, _080FAE10 @ =gUnknown_020388CC
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x78
	ldrb r1, [r0]
	cmp r1, 0
	bne _080FAE14
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80FB170
	b _080FAEA4
	.align 2, 0
_080FAE10: .4byte gUnknown_020388CC
_080FAE14:
	adds r1, r4, 0
	adds r1, 0x54
	ldrh r0, [r1]
	lsls r0, 3
	subs r0, 0x34
	adds r2, r4, 0
	adds r2, 0x5C
	movs r3, 0
	strh r0, [r2]
	movs r5, 0x56
	adds r5, r4
	mov r12, r5
	ldrh r0, [r5]
	lsls r0, 3
	subs r0, 0x44
	adds r5, r4, 0
	adds r5, 0x5E
	strh r0, [r5]
	ldrh r1, [r1]
	adds r0, r4, 0
	adds r0, 0x64
	strh r1, [r0]
	mov r0, r12
	ldrh r1, [r0]
	adds r0, r4, 0
	adds r0, 0x66
	strh r1, [r0]
	movs r1, 0
	ldrsh r0, [r2, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x80
	str r2, [sp]
	str r2, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r2, 0x38
	movs r3, 0x48
	bl sub_80FB170
	b _080FAEA4
_080FAE64:
	bl sub_80FBA18
	bl sub_80FB260
	ldr r2, _080FAE98 @ =gUnknown_020388CC
	ldr r0, [r2]
	movs r1, 0
	str r1, [r0, 0x1C]
	str r1, [r0, 0x20]
	adds r0, 0x7A
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x7E
	strb r1, [r0]
	ldr r1, _080FAE9C @ =0x0400000c
	ldr r3, _080FAEA0 @ =0x0000bc8a
	adds r0, r3, 0
	strh r0, [r1]
	ldr r1, [r2]
	adds r1, 0x79
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080FAE92:
	movs r0, 0
	b _080FAEB2
	.align 2, 0
_080FAE98: .4byte gUnknown_020388CC
_080FAE9C: .4byte 0x0400000c
_080FAEA0: .4byte 0x0000bc8a
_080FAEA4:
	ldr r0, _080FAEBC @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r1, 0x79
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
_080FAEB2:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FAEBC: .4byte gUnknown_020388CC
	thumb_func_end sub_80FA940

	thumb_func_start sub_80FAB10
sub_80FAB10: @ 80FAEC0
	push {r4,lr}
	ldr r4, _080FAF0C @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080FAEE4
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FAEE4:
	ldr r0, [r4]
	ldr r0, [r0, 0x20]
	cmp r0, 0
	beq _080FAF04
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x70
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x72
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FAF04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FAF0C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FAB10

	thumb_func_start sub_80FAB60
sub_80FAB60: @ 80FAF10
	push {lr}
	ldr r0, _080FAF24 @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r0, [r0, 0x18]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080FAF24: .4byte gUnknown_020388CC
	thumb_func_end sub_80FAB60

	thumb_func_start sub_80FAB78
sub_80FAB78: @ 80FAF28
	push {r4,lr}
	movs r4, 0
	ldr r2, _080FAFC4 @ =gUnknown_020388CC
	ldr r0, [r2]
	adds r0, 0x7B
	strb r4, [r0]
	ldr r0, [r2]
	adds r0, 0x7C
	strb r4, [r0]
	ldr r3, _080FAFC8 @ =gMain
	ldrh r1, [r3, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FAF5A
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	cmp r0, 0x2
	bls _080FAF5A
	adds r1, 0x7C
	movs r0, 0xFF
	strb r0, [r1]
	movs r4, 0x1
_080FAF5A:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FAF78
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	cmp r0, 0xF
	bhi _080FAF78
	adds r1, 0x7C
	movs r0, 0x1
	strb r0, [r1]
	movs r4, 0x1
_080FAF78:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080FAF96
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	cmp r0, 0x1
	bls _080FAF96
	adds r1, 0x7B
	movs r0, 0xFF
	strb r0, [r1]
	movs r4, 0x1
_080FAF96:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080FAFB4
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	cmp r0, 0x1B
	bhi _080FAFB4
	adds r1, 0x7B
	movs r0, 0x1
	strb r0, [r1]
	movs r4, 0x1
_080FAFB4:
	ldrh r3, [r3, 0x2E]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _080FAFCC
	movs r4, 0x4
	b _080FAFD6
	.align 2, 0
_080FAFC4: .4byte gUnknown_020388CC
_080FAFC8: .4byte gMain
_080FAFCC:
	movs r0, 0x2
	ands r0, r3
	cmp r0, 0
	beq _080FAFD6
	movs r4, 0x5
_080FAFD6:
	cmp r4, 0x1
	bne _080FAFE8
	ldr r0, [r2]
	adds r0, 0x7A
	movs r1, 0x4
	strb r1, [r0]
	ldr r1, [r2]
	ldr r0, _080FAFF0 @ =_swiopen
	str r0, [r1, 0x18]
_080FAFE8:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FAFF0: .4byte _swiopen
	thumb_func_end sub_80FAB78

	thumb_func_start _swiopen
_swiopen: @ 80FAFF4
	push {r4,r5,lr}
	ldr r5, _080FB00C @ =gUnknown_020388CC
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7A
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080FB010
	movs r0, 0x2
	b _080FB0AA
	.align 2, 0
_080FB00C: .4byte gUnknown_020388CC
_080FB010:
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080FB026
	adds r1, 0x54
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080FB026:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080FB03E
	adds r1, 0x54
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_080FB03E:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080FB056
	adds r1, 0x56
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080FB056:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080FB06E
	adds r1, 0x56
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_080FB06E:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	adds r1, 0x56
	ldrh r1, [r1]
	bl GetRegionMapSectionAt
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_80FB758
	ldr r1, [r5]
	strb r0, [r1, 0x16]
	ldr r0, [r5]
	ldrh r1, [r0, 0x14]
	cmp r4, r1
	beq _080FB09E
	strh r4, [r0, 0x14]
	ldrh r1, [r0, 0x14]
	movs r2, 0x10
	bl sub_80FBFB4
_080FB09E:
	bl sub_80FBA18
	ldr r1, [r5]
	ldr r0, _080FB0B0 @ =sub_80FAB78
	str r0, [r1, 0x18]
	movs r0, 0x3
_080FB0AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FB0B0: .4byte sub_80FAB78
	thumb_func_end _swiopen

	thumb_func_start sub_80FAD04
sub_80FAD04: @ 80FB0B4
	push {r4-r6,lr}
	movs r4, 0
	ldr r3, _080FB184 @ =gUnknown_020388CC
	ldr r0, [r3]
	mov r12, r0
	adds r0, 0x6A
	strh r4, [r0]
	mov r5, r12
	adds r5, 0x68
	strh r4, [r5]
	ldr r2, _080FB188 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	adds r6, r3, 0
	adds r3, r2, 0
	cmp r0, 0
	beq _080FB0EE
	mov r0, r12
	adds r0, 0x5E
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0x34
	negs r0, r0
	cmp r1, r0
	ble _080FB0EE
	ldr r0, _080FB18C @ =0x0000ffff
	strh r0, [r5]
	movs r4, 0x1
_080FB0EE:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FB10E
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x5E
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0x3B
	bgt _080FB10E
	adds r1, 0x68
	movs r0, 0x1
	strh r0, [r1]
	movs r4, 0x1
_080FB10E:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080FB134
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x5C
	movs r5, 0
	ldrsh r1, [r0, r5]
	movs r0, 0x2C
	negs r0, r0
	cmp r1, r0
	ble _080FB134
	adds r1, r2, 0
	adds r1, 0x6A
	ldr r0, _080FB18C @ =0x0000ffff
	strh r0, [r1]
	movs r4, 0x1
_080FB134:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080FB154
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x5C
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0xAB
	bgt _080FB154
	adds r1, 0x6A
	movs r0, 0x1
	strh r0, [r1]
	movs r4, 0x1
_080FB154:
	ldrh r2, [r3, 0x2E]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080FB160
	movs r4, 0x4
_080FB160:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080FB16A
	movs r4, 0x5
_080FB16A:
	cmp r4, 0x1
	bne _080FB17A
	ldr r0, [r6]
	ldr r1, _080FB190 @ =sub_80FADE4
	str r1, [r0, 0x18]
	adds r0, 0x6C
	movs r1, 0
	strh r1, [r0]
_080FB17A:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FB184: .4byte gUnknown_020388CC
_080FB188: .4byte gMain
_080FB18C: .4byte 0x0000ffff
_080FB190: .4byte sub_80FADE4
	thumb_func_end sub_80FAD04

	thumb_func_start sub_80FADE4
sub_80FADE4: @ 80FB194
	push {r4,r5,lr}
	ldr r5, _080FB264 @ =gUnknown_020388CC
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0x5E
	adds r0, r2, 0
	adds r0, 0x68
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r1
	strh r0, [r3]
	adds r1, r2, 0
	adds r1, 0x5C
	adds r0, r2, 0
	adds r0, 0x6A
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	movs r2, 0
	ldrsh r1, [r3, r2]
	bl sub_80FB238
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x6C
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bne _080FB26C
	adds r0, r2, 0
	adds r0, 0x5C
	movs r3, 0
	ldrsh r1, [r0, r3]
	adds r0, r1, 0
	adds r0, 0x2C
	cmp r0, 0
	bge _080FB1EC
	adds r0, 0x7
_080FB1EC:
	asrs r0, 3
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r2, 0
	adds r0, 0x5E
	movs r4, 0
	ldrsh r1, [r0, r4]
	adds r0, r1, 0
	adds r0, 0x34
	cmp r0, 0
	bge _080FB206
	adds r0, 0x7
_080FB206:
	asrs r0, 3
	adds r0, 0x2
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, r2, 0
	adds r4, 0x64
	adds r0, r2, 0
	adds r0, 0x66
	ldrh r2, [r4]
	cmp r3, r2
	bne _080FB222
	ldrh r2, [r0]
	cmp r1, r2
	beq _080FB250
_080FB222:
	strh r3, [r4]
	strh r1, [r0]
	adds r0, r3, 0
	bl GetRegionMapSectionAt
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_80FB758
	ldr r1, [r5]
	strb r0, [r1, 0x16]
	ldr r0, [r5]
	ldrh r3, [r0, 0x14]
	cmp r4, r3
	beq _080FB24C
	strh r4, [r0, 0x14]
	ldrh r1, [r0, 0x14]
	movs r2, 0x10
	bl sub_80FBFB4
_080FB24C:
	bl sub_80FBA18
_080FB250:
	ldr r0, _080FB264 @ =gUnknown_020388CC
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x6C
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080FB268 @ =sub_80FAD04
	str r0, [r2, 0x18]
	movs r0, 0x3
	b _080FB26E
	.align 2, 0
_080FB264: .4byte gUnknown_020388CC
_080FB268: .4byte sub_80FAD04
_080FB26C:
	movs r0, 0x2
_080FB26E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FADE4

	thumb_func_start sub_80FAEC4
sub_80FAEC4: @ 80FB274
	push {r4-r6,lr}
	ldr r1, _080FB2F0 @ =gUnknown_020388CC
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r3, [r0]
	adds r5, r1, 0
	cmp r3, 0
	bne _080FB2F8
	subs r0, 0x1A
	strh r3, [r0]
	subs r0, 0x2
	strh r3, [r0]
	str r3, [r2, 0x40]
	str r3, [r2, 0x3C]
	adds r4, r2, 0
	adds r4, 0x54
	ldrh r0, [r4]
	lsls r0, 3
	subs r0, 0x34
	adds r1, r2, 0
	adds r1, 0x60
	strh r0, [r1]
	movs r0, 0x56
	adds r0, r2
	mov r12, r0
	ldrh r0, [r0]
	lsls r0, 3
	subs r0, 0x44
	adds r3, r2, 0
	adds r3, 0x62
	strh r0, [r3]
	movs r6, 0
	ldrsh r0, [r1, r6]
	lsls r0, 8
	cmp r0, 0
	bge _080FB2C0
	adds r0, 0xF
_080FB2C0:
	asrs r0, 4
	str r0, [r2, 0x44]
	movs r1, 0
	ldrsh r0, [r3, r1]
	lsls r0, 8
	cmp r0, 0
	bge _080FB2D0
	adds r0, 0xF
_080FB2D0:
	asrs r0, 4
	str r0, [r2, 0x48]
	ldrh r1, [r4]
	adds r0, r2, 0
	adds r0, 0x64
	strh r1, [r0]
	mov r3, r12
	ldrh r0, [r3]
	adds r1, r2, 0
	adds r1, 0x66
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 9
	str r0, [r2, 0x4C]
	ldr r0, _080FB2F4 @ =0xfffff800
	b _080FB356
	.align 2, 0
_080FB2F0: .4byte gUnknown_020388CC
_080FB2F4: .4byte 0xfffff800
_080FB2F8:
	adds r0, r2, 0
	adds r0, 0x5C
	movs r6, 0
	ldrsh r0, [r0, r6]
	lsls r0, 8
	str r0, [r2, 0x3C]
	adds r0, r2, 0
	adds r0, 0x5E
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r0, 8
	str r0, [r2, 0x40]
	adds r0, r2, 0
	adds r0, 0x60
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r0, [r2, 0x3C]
	cmp r0, 0
	bge _080FB324
	adds r0, 0xF
_080FB324:
	asrs r0, 4
	negs r0, r0
	str r0, [r2, 0x44]
	ldr r0, [r2, 0x40]
	cmp r0, 0
	bge _080FB332
	adds r0, 0xF
_080FB332:
	asrs r0, 4
	negs r0, r0
	str r0, [r2, 0x48]
	adds r0, r2, 0
	adds r0, 0x64
	ldrh r1, [r0]
	subs r0, 0x10
	strh r1, [r0]
	adds r0, 0x12
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0x56
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 8
	str r0, [r2, 0x4C]
	movs r0, 0x80
	lsls r0, 4
_080FB356:
	str r0, [r2, 0x50]
	ldr r0, [r5]
	adds r0, 0x6E
	movs r1, 0
	strh r1, [r0]
	bl sub_80FBCA0
	bl sub_80FBDF8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80FAEC4

	thumb_func_start sub_80FAFC0
sub_80FAFC0: @ 80FB370
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r0, _080FB388 @ =gUnknown_020388CC
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x6E
	ldrh r1, [r2]
	adds r5, r0, 0
	cmp r1, 0xF
	bls _080FB38C
	movs r0, 0
	b _080FB514
	.align 2, 0
_080FB388: .4byte gUnknown_020388CC
_080FB38C:
	adds r0, r1, 0x1
	movs r1, 0
	strh r0, [r2]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bne _080FB400
	str r1, [r3, 0x44]
	str r1, [r3, 0x48]
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r1, [r0]
	subs r0, 0x4
	strh r1, [r0]
	adds r0, 0x6
	ldrh r0, [r0]
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	adds r1, 0x1A
	ldrb r0, [r1]
	movs r2, 0x80
	lsls r2, 9
	cmp r0, 0
	bne _080FB3C2
	movs r2, 0x80
	lsls r2, 8
_080FB3C2:
	str r2, [r3, 0x4C]
	movs r2, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080FB3CE
	movs r2, 0x1
_080FB3CE:
	strb r2, [r1]
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x78
	ldrb r0, [r0]
	ldr r2, _080FB3F8 @ =sub_80FAD04
	cmp r0, 0
	bne _080FB3E0
	ldr r2, _080FB3FC @ =sub_80FAB78
_080FB3E0:
	str r2, [r1, 0x18]
	adds r0, r1, 0
	adds r0, 0x58
	ldrh r0, [r0]
	adds r1, 0x5A
	ldrh r1, [r1]
	bl sub_80FBB3C
	bl sub_80FBE24
	movs r4, 0
	b _080FB4E2
	.align 2, 0
_080FB3F8: .4byte sub_80FAD04
_080FB3FC: .4byte sub_80FAB78
_080FB400:
	ldr r2, [r3, 0x3C]
	ldr r0, [r3, 0x44]
	adds r2, r0
	str r2, [r3, 0x3C]
	ldr r0, [r3, 0x40]
	ldr r1, [r3, 0x48]
	adds r0, r1
	str r0, [r3, 0x40]
	asrs r2, 8
	adds r4, r3, 0
	adds r4, 0x5C
	strh r2, [r4]
	ldr r0, [r3, 0x40]
	asrs r0, 8
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	ldr r0, [r3, 0x4C]
	ldr r1, [r3, 0x50]
	adds r0, r1
	str r0, [r3, 0x4C]
	ldr r2, [r3, 0x44]
	cmp r2, 0
	bge _080FB440
	adds r0, r3, 0
	adds r0, 0x60
	movs r6, 0
	ldrsh r1, [r4, r6]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	blt _080FB454
_080FB440:
	cmp r2, 0
	ble _080FB464
	adds r0, r3, 0
	adds r0, 0x60
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	ble _080FB464
_080FB454:
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r2, [r0]
	subs r0, 0x4
	movs r1, 0
	strh r2, [r0]
	str r1, [r3, 0x44]
_080FB464:
	ldr r2, [r5]
	ldr r4, [r2, 0x48]
	cmp r4, 0
	bge _080FB480
	adds r0, r2, 0
	adds r0, 0x5E
	adds r3, r2, 0
	adds r3, 0x62
	movs r6, 0
	ldrsh r1, [r0, r6]
	movs r6, 0
	ldrsh r0, [r3, r6]
	cmp r1, r0
	blt _080FB498
_080FB480:
	cmp r4, 0
	ble _080FB4AA
	adds r1, r2, 0
	adds r1, 0x5E
	adds r0, r2, 0
	adds r0, 0x62
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	ble _080FB4AA
_080FB498:
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x62
	ldrh r1, [r0]
	adds r3, r2, 0
	adds r3, 0x5E
	movs r0, 0
	strh r1, [r3]
	str r0, [r2, 0x48]
_080FB4AA:
	ldr r0, _080FB4C8 @ =gUnknown_020388CC
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r3, [r0]
	cmp r3, 0
	bne _080FB4D0
	ldr r1, [r2, 0x4C]
	ldr r0, _080FB4CC @ =0x00007fff
	cmp r1, r0
	bgt _080FB4E0
	adds r0, 0x1
	str r0, [r2, 0x4C]
	str r3, [r2, 0x50]
	b _080FB4E0
	.align 2, 0
_080FB4C8: .4byte gUnknown_020388CC
_080FB4CC: .4byte 0x00007fff
_080FB4D0:
	ldr r0, [r2, 0x4C]
	movs r1, 0x80
	lsls r1, 9
	cmp r0, r1
	ble _080FB4E0
	str r1, [r2, 0x4C]
	movs r0, 0
	str r0, [r2, 0x50]
_080FB4E0:
	movs r4, 0x1
_080FB4E2:
	ldr r0, _080FB51C @ =gUnknown_020388CC
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x5C
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r1, r3, 0
	adds r1, 0x5E
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, [r3, 0x4C]
	lsls r2, 8
	lsrs r2, 16
	str r2, [sp]
	ldr r2, [r3, 0x4C]
	lsls r2, 8
	lsrs r2, 16
	str r2, [sp, 0x4]
	movs r2, 0
	str r2, [sp, 0x8]
	movs r2, 0x38
	movs r3, 0x48
	bl sub_80FB170
	adds r0, r4, 0
_080FB514:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080FB51C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FAFC0

	thumb_func_start sub_80FB170
sub_80FB170: @ 80FB520
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r7, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r4, 16
	lsrs r4, 16
	mov r8, r4
	lsls r7, 16
	adds r4, r7, 0
	lsrs r4, 16
	mov r9, r4
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080FB5E0 @ =gUnknown_020388CC
	ldr r6, [r4]
	ldr r7, _080FB5E4 @ =gSineTable
	mov r12, r7
	adds r4, r5, 0
	adds r4, 0x40
	lsls r4, 1
	add r4, r12
	movs r7, 0
	ldrsh r4, [r4, r7]
	str r4, [sp]
	mov r7, r8
	muls r7, r4
	adds r4, r7, 0
	asrs r4, 8
	mov r10, r4
	str r4, [r6, 0x2C]
	lsls r5, 1
	add r5, r12
	movs r7, 0
	ldrsh r5, [r5, r7]
	negs r4, r5
	mov r7, r8
	muls r7, r4
	adds r4, r7, 0
	asrs r4, 8
	mov r12, r4
	str r4, [r6, 0x30]
	mov r7, r9
	muls r7, r5
	adds r5, r7, 0
	asrs r5, 8
	str r5, [r6, 0x34]
	ldr r7, [sp]
	mov r4, r9
	muls r4, r7
	asrs r4, 8
	mov r8, r4
	str r4, [r6, 0x38]
	lsls r0, 16
	asrs r0, 8
	lsls r2, 16
	asrs r2, 16
	lsls r4, r2, 8
	adds r0, r4
	lsls r3, 16
	asrs r3, 16
	adds r4, r3, 0
	muls r4, r5
	mov r5, r10
	muls r5, r2
	adds r4, r5
	subs r0, r4
	str r0, [r6, 0x24]
	lsls r1, 16
	asrs r1, 8
	lsls r0, r3, 8
	adds r1, r0
	mov r0, r8
	muls r0, r3
	mov r3, r12
	muls r3, r2
	adds r2, r3, 0
	adds r0, r2
	subs r1, r0
	str r1, [r6, 0x28]
	adds r6, 0x7D
	movs r0, 0x1
	strb r0, [r6]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB5E0: .4byte gUnknown_020388CC
_080FB5E4: .4byte gSineTable
	thumb_func_end sub_80FB170

	thumb_func_start sub_80FB238
sub_80FB238: @ 80FB5E8
	ldr r2, _080FB60C @ =gUnknown_020388CC
	ldr r2, [r2]
	lsls r0, 16
	asrs r0, 8
	movs r3, 0xE0
	lsls r3, 5
	adds r0, r3
	str r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 8
	movs r0, 0x90
	lsls r0, 6
	adds r1, r0
	str r1, [r2, 0x28]
	adds r2, 0x7D
	movs r0, 0x1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080FB60C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FB238

	thumb_func_start sub_80FB260
sub_80FB260: @ 80FB610
	push {lr}
	ldr r0, _080FB64C @ =gUnknown_020388CC
	ldr r2, [r0]
	adds r3, r2, 0
	adds r3, 0x7D
	ldrb r0, [r3]
	cmp r0, 0
	beq _080FB648
	ldr r1, _080FB650 @ =0x04000020
	ldr r0, [r2, 0x2C]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x34]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x30]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x38]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r2, 0x24]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r2, 0x28]
	str r0, [r1]
	movs r0, 0
	strb r0, [r3]
_080FB648:
	pop {r0}
	bx r0
	.align 2, 0
_080FB64C: .4byte gUnknown_020388CC
_080FB650: .4byte 0x04000020
	thumb_func_end sub_80FB260

	thumb_func_start sub_80FB2A4
sub_80FB2A4: @ 80FB654
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x38
	movs r3, 0x48
	bl sub_80FB170
	bl sub_80FB260
	ldr r0, _080FB698 @ =gUnknown_020388CC
	ldr r2, [r0]
	ldr r1, [r2, 0x20]
	cmp r1, 0
	beq _080FB690
	negs r0, r4
	strh r0, [r1, 0x24]
	ldr r1, [r2, 0x20]
	negs r0, r5
	strh r0, [r1, 0x26]
_080FB690:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FB698: .4byte gUnknown_020388CC
	thumb_func_end sub_80FB2A4

	thumb_func_start GetRegionMapSectionAt
GetRegionMapSectionAt: @ 80FB69C
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	ldr r0, _080FB6BC @ =0xfffe0000
	adds r1, r0
	lsrs r2, r1, 16
	cmp r2, 0xE
	bhi _080FB6B6
	cmp r3, 0
	beq _080FB6B6
	cmp r3, 0x1C
	bls _080FB6C0
_080FB6B6:
	movs r0, 0x58
	b _080FB6D4
	.align 2, 0
_080FB6BC: .4byte 0xfffe0000
_080FB6C0:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _080FB6D8 @ =gRegionMapSections
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3, r0
	adds r0, r1
	ldrb r0, [r0]
_080FB6D4:
	pop {r1}
	bx r1
	.align 2, 0
_080FB6D8: .4byte gRegionMapSections
	thumb_func_end GetRegionMapSectionAt

	thumb_func_start sub_80FB32C
sub_80FB32C: @ 80FB6DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080FB708 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	adds r2, r0, 0
	cmp r1, 0x19
	bne _080FB70C
	ldrb r0, [r2, 0x5]
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _080FB70C
	bl sub_80FB600
	b _080FB998
	.align 2, 0
_080FB708: .4byte gSaveBlock1
_080FB70C:
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	movs r1, 0x5
	ldrsb r1, [r2, r1]
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x8
	bhi _080FB754
	lsls r0, 2
	ldr r1, _080FB72C @ =_080FB730
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FB72C: .4byte _080FB730
	.align 2, 0
_080FB730:
	.4byte _080FB754
	.4byte _080FB754
	.4byte _080FB754
	.4byte _080FB790
	.4byte _080FB754
	.4byte _080FB754
	.4byte _080FB790
	.4byte _080FB814
	.4byte _080FB7D8
_080FB754:
	ldr r4, _080FB784 @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r3, _080FB788 @ =gMapHeader
	ldrb r1, [r3, 0x14]
	movs r2, 0
	strh r1, [r0, 0x14]
	adds r0, 0x7F
	strb r2, [r0]
	ldr r0, [r3]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldr r0, _080FB78C @ =gSaveBlock1
	ldrh r6, [r0]
	ldrh r3, [r0, 0x2]
	ldr r1, [r4]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x45
	beq _080FB77C
	b _080FB87C
_080FB77C:
	adds r1, 0x7F
	movs r0, 0x1
	strb r0, [r1]
	b _080FB87C
	.align 2, 0
_080FB784: .4byte gUnknown_020388CC
_080FB788: .4byte gMapHeader
_080FB78C: .4byte gSaveBlock1
_080FB790:
	ldr r4, _080FB7D0 @ =gSaveBlock1
	adds r0, r4, 0
	adds r0, 0x24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	adds r1, 0x25
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	ldr r0, _080FB7D4 @ =gUnknown_020388CC
	ldr r0, [r0]
	ldrb r1, [r2, 0x14]
	strh r1, [r0, 0x14]
	adds r0, 0x7F
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldrh r6, [r4, 0x28]
	ldrh r3, [r4, 0x2A]
	b _080FB87C
	.align 2, 0
_080FB7D0: .4byte gSaveBlock1
_080FB7D4: .4byte gUnknown_020388CC
_080FB7D8:
	ldr r4, _080FB80C @ =gSaveBlock1
	movs r0, 0x14
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x15
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	ldr r0, _080FB810 @ =gUnknown_020388CC
	ldr r0, [r0]
	ldrb r1, [r2, 0x14]
	strh r1, [r0, 0x14]
	adds r0, 0x7F
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r2]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldrh r6, [r4, 0x18]
	ldrh r3, [r4, 0x1A]
	b _080FB87C
	.align 2, 0
_080FB80C: .4byte gSaveBlock1
_080FB810: .4byte gUnknown_020388CC
_080FB814:
	ldr r5, _080FB83C @ =gUnknown_020388CC
	ldr r0, [r5]
	ldr r1, _080FB840 @ =gMapHeader
	ldrb r1, [r1, 0x14]
	strh r1, [r0, 0x14]
	cmp r1, 0x57
	beq _080FB848
	ldr r4, _080FB844 @ =0x02025758
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	b _080FB866
	.align 2, 0
_080FB83C: .4byte gUnknown_020388CC
_080FB840: .4byte gMapHeader
_080FB844: .4byte 0x02025758
_080FB848:
	ldr r4, _080FB8F8 @ =0x02025748
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r2, r0, 0
	ldr r1, [r5]
	ldrb r0, [r2, 0x14]
	strh r0, [r1, 0x14]
_080FB866:
	ldr r0, _080FB8FC @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x7F
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	ldrh r2, [r0]
	ldrh r0, [r0, 0x4]
	mov r8, r0
	ldrh r6, [r4, 0x4]
	ldrh r3, [r4, 0x6]
_080FB87C:
	mov r9, r6
	ldr r4, _080FB8FC @ =gUnknown_020388CC
	ldr r0, [r4]
	ldrh r5, [r0, 0x14]
	lsls r0, r5, 3
	ldr r1, _080FB900 @ =gRegionMapLocations
	adds r0, r1
	mov r10, r0
	ldrb r7, [r0, 0x2]
	adds r0, r2, 0
	adds r1, r7, 0
	str r3, [sp]
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r3, [sp]
	cmp r1, 0
	bne _080FB8A4
	movs r1, 0x1
_080FB8A4:
	adds r0, r6, 0
	str r3, [sp]
	bl __udivsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	cmp r6, r7
	bcc _080FB8BC
	subs r0, r7, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB8BC:
	mov r2, r10
	ldrb r4, [r2, 0x3]
	mov r0, r8
	adds r1, r4, 0
	str r3, [sp]
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r3, [sp]
	cmp r1, 0
	bne _080FB8D6
	movs r1, 0x1
_080FB8D6:
	adds r0, r3, 0
	bl __udivsi3
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _080FB8EA
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_080FB8EA:
	cmp r5, 0x24
	beq _080FB94C
	cmp r5, 0x24
	bgt _080FB904
	cmp r5, 0x1D
	beq _080FB90E
	b _080FB96E
	.align 2, 0
_080FB8F8: .4byte 0x02025748
_080FB8FC: .4byte gUnknown_020388CC
_080FB900: .4byte gRegionMapLocations
_080FB904:
	cmp r5, 0x29
	beq _080FB916
	cmp r5, 0x33
	beq _080FB916
	b _080FB96E
_080FB90E:
	cmp r3, 0
	beq _080FB96E
	movs r6, 0
	b _080FB96E
_080FB916:
	movs r6, 0
	ldr r1, _080FB948 @ =gSaveBlock1
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _080FB924
	movs r6, 0x1
_080FB924:
	cmp r0, 0x33
	ble _080FB92E
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB92E:
	movs r3, 0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0x25
	ble _080FB93A
	movs r3, 0x1
_080FB93A:
	cmp r0, 0x38
	ble _080FB96E
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	b _080FB96E
	.align 2, 0
_080FB948: .4byte gSaveBlock1
_080FB94C:
	movs r6, 0
	mov r0, r9
	cmp r0, 0xE
	bls _080FB956
	movs r6, 0x1
_080FB956:
	mov r1, r9
	cmp r1, 0x1C
	bls _080FB962
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB962:
	mov r2, r9
	cmp r2, 0x36
	bls _080FB96E
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FB96E:
	ldr r0, _080FB9A8 @ =gUnknown_020388CC
	ldr r2, [r0]
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	ldr r1, _080FB9AC @ =gRegionMapLocations
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r6, r0
	adds r0, 0x1
	adds r1, r2, 0
	adds r1, 0x54
	strh r0, [r1]
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	ldr r1, _080FB9AC @ =gRegionMapLocations
	adds r0, r1
	ldrb r0, [r0, 0x1]
	adds r0, r3, r0
	adds r0, 0x2
	adds r2, 0x56
	strh r0, [r2]
_080FB998:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FB9A8: .4byte gUnknown_020388CC
_080FB9AC: .4byte gRegionMapLocations
	thumb_func_end sub_80FB32C

	thumb_func_start sub_80FB600
sub_80FB600: @ 80FB9B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r7, 0
	movs r0, 0
	mov r8, r0
	mov r4, sp
	adds r4, 0x1
	mov r5, sp
	adds r5, 0x2
	add r6, sp, 0x4
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_810D9EC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r5
	cmp r0, 0x4
	bhi _080FBA44
	lsls r0, 2
	ldr r1, _080FB9EC @ =_080FB9F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FB9EC: .4byte _080FB9F0
	.align 2, 0
_080FB9F0:
	.4byte _080FBA44
	.4byte _080FBA04
	.4byte _080FBA14
	.4byte _080FBA24
	.4byte _080FBA34
_080FBA04:
	ldr r2, _080FBA10 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	b _080FBAC0
	.align 2, 0
_080FBA10: .4byte gUnknown_020388CC
_080FBA14:
	ldr r2, _080FBA20 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0xC
	strh r0, [r1, 0x14]
	b _080FBAC0
	.align 2, 0
_080FBA20: .4byte gUnknown_020388CC
_080FBA24:
	ldr r2, _080FBA30 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0x27
	strh r0, [r1, 0x14]
	b _080FBAC0
	.align 2, 0
_080FBA30: .4byte gUnknown_020388CC
_080FBA34:
	ldr r2, _080FBA40 @ =gUnknown_020388CC
	ldr r1, [r2]
	movs r0, 0x2E
	strh r0, [r1, 0x14]
	b _080FBAC0
	.align 2, 0
_080FBA40: .4byte gUnknown_020388CC
_080FBA44:
	mov r0, sp
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl get_mapheader_by_bank_and_number
	ldr r1, _080FBB00 @ =gUnknown_020388CC
	mov r9, r1
	ldr r2, [r1]
	ldrb r1, [r0, 0x14]
	strh r1, [r2, 0x14]
	ldr r6, [r0]
	ldr r1, _080FBB04 @ =gRegionMapLocations
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	adds r5, r0, r1
	ldrb r4, [r5, 0x2]
	ldr r0, [r6]
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080FBA76
	movs r1, 0x1
_080FBA76:
	mov r2, r10
	movs r3, 0
	ldrsh r0, [r2, r3]
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r8, r4
	bcc _080FBA92
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_080FBA92:
	ldrb r4, [r5, 0x3]
	ldr r0, [r6, 0x4]
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080FBAA6
	movs r1, 0x1
_080FBAA6:
	mov r2, sp
	movs r3, 0x4
	ldrsh r0, [r2, r3]
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r2, r9
	cmp r7, r4
	bcc _080FBAC0
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080FBAC0:
	ldr r0, [r2]
	adds r0, 0x7F
	movs r1, 0
	strb r1, [r0]
	ldr r2, [r2]
	ldr r3, _080FBB04 @ =gRegionMapLocations
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0]
	add r0, r8
	adds r0, 0x1
	adds r1, r2, 0
	adds r1, 0x54
	strh r0, [r1]
	ldrh r0, [r2, 0x14]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, r7, r0
	adds r0, 0x2
	adds r2, 0x56
	strh r0, [r2]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FBB00: .4byte gUnknown_020388CC
_080FBB04: .4byte gRegionMapLocations
	thumb_func_end sub_80FB600

	thumb_func_start sub_80FB758
sub_80FB758: @ 80FBB08
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x58
	bls _080FBB14
	b _080FBD50
_080FBB14:
	lsls r0, 2
	ldr r1, _080FBB20 @ =_080FBB24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FBB20: .4byte _080FBB24
	.align 2, 0
_080FBB24:
	.4byte _080FBC8C
	.4byte _080FBC94
	.4byte _080FBC9A
	.4byte _080FBCA4
	.4byte _080FBCAC
	.4byte _080FBCB4
	.4byte _080FBCBC
	.4byte _080FBCC4
	.4byte _080FBCCC
	.4byte _080FBCD4
	.4byte _080FBCDC
	.4byte _080FBCE4
	.4byte _080FBCEC
	.4byte _080FBCF4
	.4byte _080FBCFC
	.4byte _080FBD04
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD1C
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD38
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBD50
	.4byte _080FBC88
_080FBC88:
	movs r0, 0
	b _080FBD52
_080FBC8C:
	ldr r0, _080FBC90 @ =0x0000080f
	b _080FBD06
	.align 2, 0
_080FBC90: .4byte 0x0000080f
_080FBC94:
	movs r0, 0x81
	lsls r0, 4
	b _080FBD06
_080FBC9A:
	ldr r0, _080FBCA0 @ =0x00000811
	b _080FBD06
	.align 2, 0
_080FBCA0: .4byte 0x00000811
_080FBCA4:
	ldr r0, _080FBCA8 @ =0x00000812
	b _080FBD06
	.align 2, 0
_080FBCA8: .4byte 0x00000812
_080FBCAC:
	ldr r0, _080FBCB0 @ =0x00000813
	b _080FBD06
	.align 2, 0
_080FBCB0: .4byte 0x00000813
_080FBCB4:
	ldr r0, _080FBCB8 @ =0x00000814
	b _080FBD06
	.align 2, 0
_080FBCB8: .4byte 0x00000814
_080FBCBC:
	ldr r0, _080FBCC0 @ =0x00000815
	b _080FBD06
	.align 2, 0
_080FBCC0: .4byte 0x00000815
_080FBCC4:
	ldr r0, _080FBCC8 @ =0x00000816
	b _080FBD06
	.align 2, 0
_080FBCC8: .4byte 0x00000816
_080FBCCC:
	ldr r0, _080FBCD0 @ =0x00000817
	b _080FBD06
	.align 2, 0
_080FBCD0: .4byte 0x00000817
_080FBCD4:
	ldr r0, _080FBCD8 @ =0x00000818
	b _080FBD06
	.align 2, 0
_080FBCD8: .4byte 0x00000818
_080FBCDC:
	ldr r0, _080FBCE0 @ =0x00000819
	b _080FBD06
	.align 2, 0
_080FBCE0: .4byte 0x00000819
_080FBCE4:
	ldr r0, _080FBCE8 @ =0x0000081a
	b _080FBD06
	.align 2, 0
_080FBCE8: .4byte 0x0000081a
_080FBCEC:
	ldr r0, _080FBCF0 @ =0x0000081b
	b _080FBD06
	.align 2, 0
_080FBCF0: .4byte 0x0000081b
_080FBCF4:
	ldr r0, _080FBCF8 @ =0x0000081c
	b _080FBD06
	.align 2, 0
_080FBCF8: .4byte 0x0000081c
_080FBCFC:
	ldr r0, _080FBD00 @ =0x0000081d
	b _080FBD06
	.align 2, 0
_080FBD00: .4byte 0x0000081d
_080FBD04:
	ldr r0, _080FBD18 @ =0x0000081e
_080FBD06:
	bl FlagGet
	lsls r0, 24
	movs r1, 0x3
	cmp r0, 0
	beq _080FBD14
	movs r1, 0x2
_080FBD14:
	adds r0, r1, 0
	b _080FBD52
	.align 2, 0
_080FBD18: .4byte 0x0000081e
_080FBD1C:
	ldr r0, _080FBD34 @ =0x00000848
	bl FlagGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	negs r0, r1
	orrs r0, r1
	asrs r0, 31
	movs r1, 0x4
	ands r0, r1
	b _080FBD52
	.align 2, 0
_080FBD34: .4byte 0x00000848
_080FBD38:
	ldr r0, _080FBD4C @ =0x00000849
	bl FlagGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	b _080FBD52
	.align 2, 0
_080FBD4C: .4byte 0x00000849
_080FBD50:
	movs r0, 0x1
_080FBD52:
	pop {r1}
	bx r1
	thumb_func_end sub_80FB758

	thumb_func_start GetRegionMapSectionAt_
GetRegionMapSectionAt_: @ 80FBD58
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	bl GetRegionMapSectionAt
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GetRegionMapSectionAt_

	thumb_func_start sub_80FB9C0
sub_80FB9C0: @ 80FBD70
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r0, _080FBD98 @ =gUnknown_083E7684
	ldrh r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x58
	beq _080FBDAC
	adds r5, r4, 0
	adds r6, r4, 0x2
_080FBD86:
	lsls r1, r2, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r0, r3
	bne _080FBD9C
	adds r0, r1, r6
	ldrh r0, [r0]
	b _080FBDAE
	.align 2, 0
_080FBD98: .4byte gUnknown_083E7684
_080FBD9C:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 2
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _080FBD86
_080FBDAC:
	adds r0, r3, 0
_080FBDAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FB9C0

	thumb_func_start sub_80FBA04
sub_80FBA04: @ 80FBDB4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_80FB9C0
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FBA04

	thumb_func_start sub_80FBA18
sub_80FBA18: @ 80FBDC8
	push {r4-r6,lr}
	ldr r0, _080FBDDC @ =gUnknown_020388CC
	ldr r1, [r0]
	ldrh r0, [r1, 0x14]
	cmp r0, 0x58
	bne _080FBDE0
	movs r0, 0
	strb r0, [r1, 0x17]
	b _080FBE46
	.align 2, 0
_080FBDDC: .4byte gUnknown_020388CC
_080FBDE0:
	adds r0, r1, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FBDF0
	adds r0, r1, 0
	adds r0, 0x54
	b _080FBDF4
_080FBDF0:
	adds r0, r1, 0
	adds r0, 0x64
_080FBDF4:
	ldrh r4, [r0]
	adds r0, 0x2
	ldrh r5, [r0]
	movs r6, 0
	b _080FBE20
_080FBDFE:
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetRegionMapSectionAt
	ldr r1, _080FBE3C @ =gUnknown_020388CC
	ldr r1, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x14]
	cmp r0, r1
	bne _080FBE20
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080FBE20:
	cmp r4, 0x1
	bhi _080FBDFE
	adds r0, r5, 0
	bl sub_80FBAA0
	lsls r0, 24
	cmp r0, 0
	beq _080FBE40
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0x1D
	b _080FBE20
	.align 2, 0
_080FBE3C: .4byte gUnknown_020388CC
_080FBE40:
	ldr r0, _080FBE4C @ =gUnknown_020388CC
	ldr r0, [r0]
	strb r6, [r0, 0x17]
_080FBE46:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FBE4C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBA18

	thumb_func_start sub_80FBAA0
sub_80FBAA0: @ 80FBE50
	push {r4,r5,lr}
	lsls r0, 16
	ldr r1, _080FBE64 @ =0xffff0000
	adds r0, r1
	lsrs r5, r0, 16
	ldr r0, _080FBE68 @ =0x0000ffff
	cmp r5, r0
	bne _080FBE70
	b _080FBE92
	.align 2, 0
_080FBE64: .4byte 0xffff0000
_080FBE68: .4byte 0x0000ffff
_080FBE6C:
	movs r0, 0x1
	b _080FBE94
_080FBE70:
	movs r4, 0x1
_080FBE72:
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetRegionMapSectionAt
	ldr r1, _080FBE9C @ =gUnknown_020388CC
	ldr r1, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x14]
	cmp r0, r1
	beq _080FBE6C
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1C
	bls _080FBE72
_080FBE92:
	movs r0, 0
_080FBE94:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080FBE9C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBAA0

	thumb_func_start sub_80FBAF0
sub_80FBAF0: @ 80FBEA0
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _080FBEE4 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r3, r1, 0
	adds r3, 0x7A
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r0, 0
	beq _080FBEDE
	adds r0, r1, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r4, [r2, 0x20]
	adds r0, r4
	strh r0, [r2, 0x20]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r1, [r2, 0x22]
	adds r0, r1
	strh r0, [r2, 0x22]
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
_080FBEDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBEE4: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBAF0

	thumb_func_start nullsub_66
nullsub_66: @ 80FBEE8
	bx lr
	thumb_func_end nullsub_66

	thumb_func_start sub_80FBB3C
sub_80FBB3C: @ 80FBEEC
	push {r4-r7,lr}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r1, _080FBF5C @ =gUnknown_083E76E8
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [sp, 0x20]
	str r2, [sp, 0x24]
	mov r2, sp
	ldr r1, _080FBF60 @ =gSpriteTemplate_83E76F0
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	lsrs r3, r0, 16
	add r2, sp, 0x18
	ldrh r1, [r2, 0x4]
	orrs r1, r0
	str r1, [r2, 0x4]
	mov r0, sp
	strh r3, [r0]
	ldr r0, _080FBF64 @ =gUnknown_020388CC
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x58
	strh r3, [r0]
	ldr r5, _080FBF68 @ =0xffff0000
	add r1, sp, 0x20
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r6
	str r0, [r1, 0x4]
	mov r0, sp
	strh r6, [r0, 0x2]
	adds r3, r4, 0
	adds r0, r3, 0
	adds r0, 0x5A
	strh r6, [r0]
	adds r0, 0x1E
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	bne _080FBF70
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r3, r1
	str r0, [sp, 0x18]
	ldr r0, [r2, 0x4]
	ands r0, r5
	subs r1, 0x80
	orrs r0, r1
	str r0, [r2, 0x4]
	ldr r0, _080FBF6C @ =sub_80FBAF0
	b _080FBF86
	.align 2, 0
_080FBF5C: .4byte gUnknown_083E76E8
_080FBF60: .4byte gSpriteTemplate_83E76F0
_080FBF64: .4byte gUnknown_020388CC
_080FBF68: .4byte 0xffff0000
_080FBF6C: .4byte sub_80FBAF0
_080FBF70:
	movs r3, 0xA0
	lsls r3, 2
	adds r0, r4, r3
	str r0, [sp, 0x18]
	ldr r0, [r2, 0x4]
	ands r0, r5
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	str r0, [r2, 0x4]
	ldr r0, _080FBFE8 @ =nullsub_66
_080FBF86:
	str r0, [sp, 0x14]
	adds r0, r2, 0
	bl LoadSpriteSheet
	adds r0, r7, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0x38
	movs r2, 0x48
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080FC040
	ldr r4, _080FBFEC @ =gUnknown_020388CC
	ldr r2, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080FBFF0 @ =gSprites
	adds r3, r0, r1
	str r3, [r2, 0x1C]
	adds r2, 0x78
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _080FBFF4
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x3]
	ldr r2, [r4]
	ldr r1, [r2, 0x1C]
	ldrh r0, [r1, 0x20]
	subs r0, 0x8
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x1C]
	ldrh r0, [r1, 0x22]
	subs r0, 0x8
	strh r0, [r1, 0x22]
	ldr r0, [r2, 0x1C]
	movs r1, 0x1
	bl StartSpriteAnim
	b _080FC01C
	.align 2, 0
_080FBFE8: .4byte nullsub_66
_080FBFEC: .4byte gUnknown_020388CC
_080FBFF0: .4byte gSprites
_080FBFF4:
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3, 0x3]
	ldr r1, [r4]
	ldr r2, [r1, 0x1C]
	adds r0, r1, 0
	adds r0, 0x54
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x20]
	ldr r2, [r1, 0x1C]
	adds r1, 0x56
	ldrh r0, [r1]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x22]
_080FC01C:
	ldr r4, _080FC048 @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r1, [r0, 0x1C]
	movs r0, 0x2
	strh r0, [r1, 0x30]
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	ldr r1, [r4]
	ldr r2, [r1, 0x1C]
	lsls r0, 24
	lsrs r0, 20
	ldr r4, _080FC04C @ =0x00000101
	adds r0, r4
	strh r0, [r2, 0x32]
	ldr r1, [r1, 0x1C]
	movs r0, 0x1
	strh r0, [r1, 0x34]
_080FC040:
	add sp, 0x28
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC048: .4byte gUnknown_020388CC
_080FC04C: .4byte 0x00000101
	thumb_func_end sub_80FBB3C

	thumb_func_start sub_80FBCA0
sub_80FBCA0: @ 80FC050
	push {r4,lr}
	ldr r4, _080FC07C @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080FC074
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FC074:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC07C: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBCA0

	thumb_func_start unref_sub_80FBCD0
unref_sub_80FBCD0: @ 80FC080
	ldr r0, _080FC08C @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	movs r0, 0x1
	strh r0, [r1, 0x34]
	bx lr
	.align 2, 0
_080FC08C: .4byte gUnknown_020388CC
	thumb_func_end unref_sub_80FBCD0

	thumb_func_start unref_sub_80FBCE0
unref_sub_80FBCE0: @ 80FC090
	ldr r0, _080FC09C @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x34]
	bx lr
	.align 2, 0
_080FC09C: .4byte gUnknown_020388CC
	thumb_func_end unref_sub_80FBCE0

	thumb_func_start sub_80FBCF0
sub_80FBCF0: @ 80FC0A0
	push {r4,r5,lr}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080FC148 @ =gRegionMapBrendanIconTiles
	str r2, [sp, 0x18]
	movs r2, 0x80
	add r5, sp, 0x18
	lsrs r3, r0, 16
	orrs r0, r2
	str r0, [r5, 0x4]
	ldr r0, _080FC14C @ =gRegionMapBrendanIconPalette
	str r0, [sp, 0x20]
	ldr r2, _080FC150 @ =0xffff0000
	add r4, sp, 0x20
	ldr r0, [r4, 0x4]
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	movs r2, 0
	strh r3, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _080FC154 @ =gUnknown_083E7708
	str r0, [sp, 0x4]
	ldr r0, _080FC158 @ =gUnknown_083E7718
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080FC15C @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _080FC160 @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	ldr r0, _080FC164 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _080FC0F2
	ldr r0, _080FC168 @ =gRegionMapMayIconTiles
	str r0, [sp, 0x18]
	ldr r0, _080FC16C @ =gRegionMapMayIconPalette
	str r0, [sp, 0x20]
_080FC0F2:
	adds r0, r5, 0
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080FC170 @ =gUnknown_020388CC
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080FC174 @ =gSprites
	adds r1, r0
	str r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FC17C
	adds r0, r2, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x22]
	ldr r1, [r2, 0x20]
	ldr r0, _080FC178 @ =sub_80FBF34
	b _080FC19A
	.align 2, 0
_080FC148: .4byte gRegionMapBrendanIconTiles
_080FC14C: .4byte gRegionMapBrendanIconPalette
_080FC150: .4byte 0xffff0000
_080FC154: .4byte gUnknown_083E7708
_080FC158: .4byte gUnknown_083E7718
_080FC15C: .4byte gDummySpriteAffineAnimTable
_080FC160: .4byte SpriteCallbackDummy
_080FC164: .4byte gSaveBlock2
_080FC168: .4byte gRegionMapMayIconTiles
_080FC16C: .4byte gRegionMapMayIconPalette
_080FC170: .4byte gUnknown_020388CC
_080FC174: .4byte gSprites
_080FC178: .4byte sub_80FBF34
_080FC17C:
	adds r0, r2, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x30
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x42
	strh r0, [r1, 0x22]
	ldr r1, [r2, 0x20]
	ldr r0, _080FC1A4 @ =sub_80FBEA4
_080FC19A:
	str r0, [r1, 0x1C]
	add sp, 0x28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC1A4: .4byte sub_80FBEA4
	thumb_func_end sub_80FBCF0

	thumb_func_start sub_80FBDF8
sub_80FBDF8: @ 80FC1A8
	push {lr}
	ldr r3, _080FC1CC @ =gUnknown_020388CC
	ldr r0, [r3]
	ldr r2, [r0, 0x20]
	cmp r2, 0
	beq _080FC1C6
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, [r0, 0x20]
	ldr r0, _080FC1D0 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
_080FC1C6:
	pop {r0}
	bx r0
	.align 2, 0
_080FC1CC: .4byte gUnknown_020388CC
_080FC1D0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80FBDF8

	thumb_func_start sub_80FBE24
sub_80FBE24: @ 80FC1D4
	push {lr}
	ldr r0, _080FC20C @ =gUnknown_020388CC
	ldr r3, [r0]
	ldr r1, [r3, 0x20]
	cmp r1, 0
	beq _080FC24A
	adds r0, r3, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FC214
	adds r0, r3, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x30
	strh r0, [r1, 0x20]
	ldr r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x42
	strh r0, [r1, 0x22]
	ldr r1, [r3, 0x20]
	ldr r0, _080FC210 @ =sub_80FBEA4
	b _080FC23C
	.align 2, 0
_080FC20C: .4byte gUnknown_020388CC
_080FC210: .4byte sub_80FBEA4
_080FC214:
	adds r0, r3, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	movs r2, 0
	strh r0, [r1, 0x20]
	ldr r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x22]
	ldr r0, [r3, 0x20]
	strh r2, [r0, 0x24]
	ldr r0, [r3, 0x20]
	strh r2, [r0, 0x26]
	ldr r1, [r3, 0x20]
	ldr r0, _080FC250 @ =sub_80FBF34
_080FC23C:
	str r0, [r1, 0x1C]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_080FC24A:
	pop {r0}
	bx r0
	.align 2, 0
_080FC250: .4byte sub_80FBF34
	thumb_func_end sub_80FBE24

	thumb_func_start sub_80FBEA4
sub_80FBEA4: @ 80FC254
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080FC2B8 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x5C
	movs r4, 0
	ldrsh r2, [r0, r4]
	lsls r2, 1
	negs r2, r2
	strh r2, [r3, 0x24]
	adds r1, 0x5E
	movs r4, 0
	ldrsh r0, [r1, r4]
	lsls r0, 1
	negs r0, r0
	strh r0, [r3, 0x26]
	ldrh r1, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x20]
	adds r1, r2
	adds r2, r3, 0
	adds r2, 0x28
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	adds r2, r1
	strh r2, [r3, 0x30]
	adds r0, 0x8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB0
	bhi _080FC2B4
	lsls r0, r2, 16
	asrs r2, r0, 16
	movs r0, 0x8
	negs r0, r0
	cmp r2, r0
	blt _080FC2B4
	cmp r2, 0xF8
	ble _080FC2BC
_080FC2B4:
	movs r0, 0
	b _080FC2BE
	.align 2, 0
_080FC2B8: .4byte gUnknown_020388CC
_080FC2BC:
	movs r0, 0x1
_080FC2BE:
	strh r0, [r3, 0x32]
	movs r1, 0x32
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080FC2D0
	adds r0, r3, 0
	bl sub_80FBF40
	b _080FC2DC
_080FC2D0:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080FC2DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FBEA4

	thumb_func_start sub_80FBF34
sub_80FBF34: @ 80FC2E4
	push {lr}
	bl sub_80FBF40
	pop {r0}
	bx r0
	thumb_func_end sub_80FBF34

	thumb_func_start sub_80FBF40
sub_80FBF40: @ 80FC2F0
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FC330 @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x7E
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC334
	ldrh r0, [r2, 0x3C]
	adds r0, 0x1
	strh r0, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080FC340
	movs r0, 0
	strh r0, [r2, 0x3C]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080FC340
	.align 2, 0
_080FC330: .4byte gUnknown_020388CC
_080FC334:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080FC340:
	pop {r0}
	bx r0
	thumb_func_end sub_80FBF40

	thumb_func_start sub_80FBF94
sub_80FBF94: @ 80FC344
	push {lr}
	ldr r0, _080FC360 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x7F
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC35A
	adds r1, 0x7E
	movs r0, 0x1
	strb r0, [r1]
_080FC35A:
	pop {r0}
	bx r0
	.align 2, 0
_080FC360: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBF94

	thumb_func_start sub_80FBFB4
sub_80FBFB4: @ 80FC364
	push {lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r1, 0x56
	bne _080FC37A
	bl GetSecretBaseMapName
	b _080FC3A2
_080FC37A:
	cmp r1, 0x57
	bhi _080FC394
	ldr r0, _080FC390 @ =gRegionMapLocations
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r3, 0
	bl StringCopy
	b _080FC3A2
	.align 2, 0
_080FC390: .4byte gRegionMapLocations
_080FC394:
	cmp r2, 0
	bne _080FC39A
	movs r2, 0x12
_080FC39A:
	adds r0, r3, 0
	movs r1, 0
	bl StringFill
_080FC3A2:
	pop {r1}
	bx r1
	thumb_func_end sub_80FBFB4

	thumb_func_start CopyMapName
CopyMapName: @ 80FC3A8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x56
	beq _080FC3C4
	cmp r1, 0x57
	bne _080FC3D0
	ldr r1, _080FC3C0 @ =gOtherText_Ferry
	bl StringCopy
	b _080FC3D6
	.align 2, 0
_080FC3C0: .4byte gOtherText_Ferry
_080FC3C4:
	ldr r1, _080FC3CC @ =gOtherText_SecretBase
	bl StringCopy
	b _080FC3D6
	.align 2, 0
_080FC3CC: .4byte gOtherText_SecretBase
_080FC3D0:
	movs r2, 0
	bl sub_80FBFB4
_080FC3D6:
	pop {r1}
	bx r1
	thumb_func_end CopyMapName

	thumb_func_start sub_80FC02C
sub_80FC02C: @ 80FC3DC
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x42
	beq _080FC3EC
	bl CopyMapName
	b _080FC3F2
_080FC3EC:
	ldr r1, _080FC3F8 @ =gOtherText_Hideout
	bl StringCopy
_080FC3F2:
	pop {r1}
	bx r1
	.align 2, 0
_080FC3F8: .4byte gOtherText_Hideout
	thumb_func_end sub_80FC02C

	thumb_func_start sub_80FC04C
sub_80FC04C: @ 80FC3FC
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 16
	ldr r4, _080FC420 @ =gRegionMapLocations
	lsrs r0, 13
	adds r0, r4
	ldrb r4, [r0]
	strh r4, [r1]
	ldrb r1, [r0, 0x1]
	strh r1, [r2]
	ldrb r1, [r0, 0x2]
	strh r1, [r3]
	ldrb r0, [r0, 0x3]
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC420: .4byte gRegionMapLocations
	thumb_func_end sub_80FC04C

	thumb_func_start sub_80FC074
sub_80FC074: @ 80FC424
	push {r4,lr}
	ldr r0, _080FC440 @ =gMain
	ldr r1, _080FC444 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _080FC434
	b _080FC5A2
_080FC434:
	lsls r0, 2
	ldr r1, _080FC448 @ =_080FC44C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FC440: .4byte gMain
_080FC444: .4byte 0x0000043c
_080FC448: .4byte _080FC44C
	.align 2, 0
_080FC44C:
	.4byte _080FC474
	.4byte _080FC4B4
	.4byte _080FC4C0
	.4byte _080FC4D0
	.4byte _080FC50C
	.4byte _080FC520
	.4byte _080FC534
	.4byte _080FC554
	.4byte _080FC55A
	.4byte _080FC574
_080FC474:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x10
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	b _080FC596
_080FC4B4:
	ldr r0, _080FC4BC @ =gWindowConfig_81E7224
	bl SetUpWindowConfig
	b _080FC596
	.align 2, 0
_080FC4BC: .4byte gWindowConfig_81E7224
_080FC4C0:
	ldr r0, _080FC4CC @ =gWindowConfig_81E7224
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _080FC596
	.align 2, 0
_080FC4CC: .4byte gWindowConfig_81E7224
_080FC4D0:
	ldr r4, _080FC508 @ =0x02000008
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0
	movs r1, 0
	bl sub_80FBB3C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	adds r1, r4, 0
	subs r1, 0x8
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x6]
	movs r2, 0xA4
	lsls r2, 4
	adds r4, r2
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xC
	bl StringFill
	bl sub_80FC254
	b _080FC596
	.align 2, 0
_080FC508: .4byte 0x02000008
_080FC50C:
	ldr r0, _080FC518 @ =gUnknown_083E773C
	ldr r1, _080FC51C @ =0x0600c000
	bl LZ77UnCompVram
	b _080FC596
	.align 2, 0
_080FC518: .4byte gUnknown_083E773C
_080FC51C: .4byte 0x0600c000
_080FC520:
	ldr r0, _080FC52C @ =gUnknown_083E7774
	ldr r1, _080FC530 @ =0x0600f000
	bl LZ77UnCompVram
	b _080FC596
	.align 2, 0
_080FC52C: .4byte gUnknown_083E7774
_080FC530: .4byte 0x0600f000
_080FC534:
	ldr r0, _080FC54C @ =gUnknown_083E771C
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080FC550 @ =gOtherText_FlyToWhere
	movs r1, 0x1
	movs r2, 0x90
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	b _080FC596
	.align 2, 0
_080FC54C: .4byte gUnknown_083E771C
_080FC550: .4byte gOtherText_FlyToWhere
_080FC554:
	bl sub_80FC31C
	b _080FC596
_080FC55A:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _080FC570 @ =sub_80FC214
	bl SetVBlankCallback
	b _080FC596
	.align 2, 0
_080FC570: .4byte sub_80FC214
_080FC574:
	ldr r1, _080FC5A8 @ =0x04000050
	movs r0, 0
	strh r0, [r1]
	subs r1, 0x46
	ldr r2, _080FC5AC @ =0x00001e0d
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _080FC5B0 @ =0x00001741
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080FC5B4 @ =sub_80FC5B4
	bl sub_80FC244
	ldr r0, _080FC5B8 @ =sub_80FC228
	bl SetMainCallback2
_080FC596:
	ldr r1, _080FC5BC @ =gMain
	ldr r0, _080FC5C0 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080FC5A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC5A8: .4byte 0x04000050
_080FC5AC: .4byte 0x00001e0d
_080FC5B0: .4byte 0x00001741
_080FC5B4: .4byte sub_80FC5B4
_080FC5B8: .4byte sub_80FC228
_080FC5BC: .4byte gMain
_080FC5C0: .4byte 0x0000043c
	thumb_func_end sub_80FC074

	thumb_func_start sub_80FC214
sub_80FC214: @ 80FC5C4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80FC214

	thumb_func_start sub_80FC228
sub_80FC228: @ 80FC5D8
	push {lr}
	ldr r0, _080FC5F0 @ =0x02000000
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080FC5F0: .4byte 0x02000000
	thumb_func_end sub_80FC228

	thumb_func_start sub_80FC244
sub_80FC244: @ 80FC5F4
	ldr r1, _080FC600 @ =0x02000000
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0x4]
	bx lr
	.align 2, 0
_080FC600: .4byte 0x02000000
	thumb_func_end sub_80FC244

	thumb_func_start sub_80FC254
sub_80FC254: @ 80FC604
	push {r4,r5,lr}
	ldr r4, _080FC65C @ =0x02000000
	ldrb r0, [r4, 0x1E]
	cmp r0, 0x2
	beq _080FC612
	cmp r0, 0x4
	bne _080FC69C
_080FC612:
	movs r1, 0
	ldr r2, _080FC660 @ =gUnknown_083E79C0
	adds r5, r4, 0
_080FC618:
	lsls r0, r1, 3
	adds r4, r0, r2
	ldrh r0, [r5, 0x1C]
	ldrh r3, [r4, 0x4]
	cmp r0, r3
	bne _080FC664
	ldrh r0, [r4, 0x6]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC66E
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	adds r0, 0x8
	movs r1, 0x11
	movs r2, 0xF
	bl MenuPrint
	ldrb r0, [r5, 0x1F]
	ldr r1, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1D
	movs r2, 0x11
	bl MenuPrint_RightAligned
	b _080FC6C0
	.align 2, 0
_080FC65C: .4byte 0x02000000
_080FC660: .4byte gUnknown_083E79C0
_080FC664:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080FC618
_080FC66E:
	movs r0, 0
	cmp r0, 0
	bne _080FC6C0
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _080FC698 @ =0x02000008
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	b _080FC6C0
	.align 2, 0
_080FC698: .4byte 0x02000008
_080FC69C:
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _080FC6C8 @ =0x00000a48
	adds r0, r4, r1
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_080FC6C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC6C8: .4byte 0x00000a48
	thumb_func_end sub_80FC254

	thumb_func_start sub_80FC31C
sub_80FC31C: @ 80FC6CC
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080FC710 @ =gUnknown_083E784C
	ldr r4, _080FC714 @ =0x02000888
	adds r1, r4, 0
	bl LZ77UnCompWram
	str r4, [sp]
	ldr r1, _080FC718 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 1
	orrs r0, r1
	ldr r1, _080FC71C @ =0x0000ffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 10
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _080FC720 @ =gUnknown_083E79CC
	bl LoadSpritePalette
	bl sub_80FC374
	bl sub_80FC484
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC710: .4byte gUnknown_083E784C
_080FC714: .4byte 0x02000888
_080FC718: .4byte 0xffff0000
_080FC71C: .4byte 0x0000ffff
_080FC720: .4byte gUnknown_083E79CC
	thumb_func_end sub_80FC31C

	thumb_func_start sub_80FC374
sub_80FC374: @ 80FC724
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _080FC784 @ =0x0000080f
	str r0, [sp, 0xC]
	movs r1, 0
	mov r9, r1
	mov r2, sp
	adds r2, 0x6
	str r2, [sp, 0x14]
	mov r3, sp
	adds r3, 0xA
	str r3, [sp, 0x18]
	mov r0, sp
	adds r0, 0x8
	str r0, [sp, 0x10]
	add r1, sp, 0x4
	mov r10, r1
_080FC74E:
	ldr r2, [sp, 0x18]
	str r2, [sp]
	mov r0, r9
	add r1, sp, 0x4
	mov r2, sp
	adds r2, 0x6
	ldr r3, [sp, 0x10]
	bl sub_80FC04C
	mov r3, r10
	ldrh r0, [r3]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r3]
	mov r1, sp
	ldrh r0, [r1, 0x6]
	adds r0, 0x2
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x6]
	ldr r2, [sp, 0x10]
	ldrh r0, [r2]
	cmp r0, 0x2
	bne _080FC788
	movs r7, 0x1
	b _080FC794
	.align 2, 0
_080FC784: .4byte 0x0000080f
_080FC788:
	ldr r3, [sp, 0x18]
	ldrh r0, [r3]
	movs r7, 0
	cmp r0, 0x2
	bne _080FC794
	movs r7, 0x2
_080FC794:
	mov r0, r10
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, 0x14]
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _080FC7E0 @ =gSpriteTemplate_83E7A38
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080FC808
	ldr r1, _080FC7E4 @ =gSprites
	mov r8, r1
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r6, r0, 2
	adds r2, r6, r1
	lsls r3, r7, 6
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x1]
	ldr r0, [sp, 0xC]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC7EC
	mov r0, r8
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _080FC7E8 @ =sub_80FC55C
	str r1, [r0]
	b _080FC7F2
	.align 2, 0
_080FC7E0: .4byte gSpriteTemplate_83E7A38
_080FC7E4: .4byte gSprites
_080FC7E8: .4byte sub_80FC55C
_080FC7EC:
	adds r0, r7, 0x3
	lsls r0, 16
	lsrs r7, r0, 16
_080FC7F2:
	adds r4, r5
	lsls r4, 2
	ldr r0, _080FC830 @ =gSprites
	adds r4, r0
	lsls r1, r7, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	mov r2, r9
	strh r2, [r4, 0x2E]
_080FC808:
	ldr r0, [sp, 0xC]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0xF
	bls _080FC74E
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC830: .4byte gSprites
	thumb_func_end sub_80FC374

	thumb_func_start sub_80FC484
sub_80FC484: @ 80FC834
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r8, r0
	ldr r6, _080FC8FC @ =gUnknown_083E79D4
	ldrh r0, [r6, 0x2]
	cmp r0, 0x58
	beq _080FC8EC
	mov r5, sp
	adds r5, 0x6
	add r7, sp, 0x4
	ldr r1, _080FC900 @ =gSprites
	mov r9, r1
	movs r0, 0x1C
	add r0, r9
	mov r10, r0
_080FC85C:
	mov r1, r8
	lsls r4, r1, 2
	adds r0, r4, r6
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC8D4
	adds r0, r6, 0x2
	adds r0, r4, r0
	ldrh r6, [r0]
	mov r0, sp
	adds r0, 0xA
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	add r3, sp, 0x8
	bl sub_80FC04C
	ldrh r0, [r7]
	adds r0, 0x1
	lsls r0, 3
	strh r0, [r7]
	ldrh r0, [r5]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r5]
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldr r0, _080FC904 @ =gSpriteTemplate_83E7A38
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080FC8D4
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	mov r1, r9
	adds r4, r2, r1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
	add r2, r10
	ldr r0, _080FC908 @ =sub_80FC55C
	str r0, [r2]
	adds r0, r4, 0
	movs r1, 0x6
	bl StartSpriteAnim
	strh r6, [r4, 0x2E]
_080FC8D4:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r6, _080FC8FC @ =gUnknown_083E79D4
	lsls r0, 2
	adds r1, r6, 0x2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _080FC85C
_080FC8EC:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC8FC: .4byte gUnknown_083E79D4
_080FC900: .4byte gSprites
_080FC904: .4byte gSpriteTemplate_83E7A38
_080FC908: .4byte sub_80FC55C
	thumb_func_end sub_80FC484

	thumb_func_start sub_80FC55C
sub_80FC55C: @ 80FC90C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FC94C @ =0x02000000
	ldrh r1, [r0, 0x1C]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080FC950
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080FC95E
	movs r0, 0
	strh r0, [r2, 0x30]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080FC95E
	.align 2, 0
_080FC94C: .4byte 0x02000000
_080FC950:
	movs r0, 0x10
	strh r0, [r2, 0x30]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x15
	ands r0, r1
	strb r0, [r2]
_080FC95E:
	pop {r0}
	bx r0
	thumb_func_end sub_80FC55C

	thumb_func_start sub_80FC5B4
sub_80FC5B4: @ 80FC964
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080FC978 @ =0x02000000
	ldrh r1, [r4, 0x4]
	cmp r1, 0
	beq _080FC97C
	cmp r1, 0x1
	beq _080FC994
	b _080FC9A4
	.align 2, 0
_080FC978: .4byte 0x02000000
_080FC97C:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	b _080FC9A4
_080FC994:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080FC9A4
	ldr r0, _080FC9AC @ =sub_80FC600
	bl sub_80FC244
_080FC9A4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC9AC: .4byte sub_80FC600
	thumb_func_end sub_80FC5B4

	thumb_func_start sub_80FC600
sub_80FC600: @ 80FC9B0
	push {r4,lr}
	ldr r0, _080FC9D0 @ =0x02000000
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _080FCA3A
	bl sub_80FAB60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080FCA3A
	lsls r0, 2
	ldr r1, _080FC9D4 @ =_080FC9D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FC9D0: .4byte 0x02000000
_080FC9D4: .4byte _080FC9D8
	.align 2, 0
_080FC9D8:
	.4byte _080FCA3A
	.4byte _080FCA3A
	.4byte _080FCA3A
	.4byte _080FC9F0
	.4byte _080FC9F6
	.4byte _080FCA24
_080FC9F0:
	bl sub_80FC254
	b _080FCA3A
_080FC9F6:
	ldr r4, _080FCA18 @ =0x02000000
	ldrb r0, [r4, 0x1E]
	cmp r0, 0x2
	beq _080FCA02
	cmp r0, 0x4
	bne _080FCA3A
_080FCA02:
	movs r0, 0x5
	bl m4aSongNumStart
	ldr r1, _080FCA1C @ =0x00000a6e
	adds r0, r4, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FCA20 @ =sub_80FC69C
	bl sub_80FC244
	b _080FCA3A
	.align 2, 0
_080FCA18: .4byte 0x02000000
_080FCA1C: .4byte 0x00000a6e
_080FCA20: .4byte sub_80FC69C
_080FCA24:
	movs r0, 0x5
	bl m4aSongNumStart
	ldr r0, _080FCA40 @ =0x02000000
	ldr r1, _080FCA44 @ =0x00000a6e
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FCA48 @ =sub_80FC69C
	bl sub_80FC244
_080FCA3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCA40: .4byte 0x02000000
_080FCA44: .4byte 0x00000a6e
_080FCA48: .4byte sub_80FC69C
	thumb_func_end sub_80FC600

	thumb_func_start sub_80FC69C
sub_80FC69C: @ 80FCA4C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080FCA60 @ =0x02000000
	ldrh r1, [r4, 0x4]
	cmp r1, 0
	beq _080FCA64
	cmp r1, 0x1
	beq _080FCA7C
	b _080FCB42
	.align 2, 0
_080FCA60: .4byte 0x02000000
_080FCA64:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	b _080FCB42
_080FCA7C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080FCB42
	bl sub_80FAB10
	ldr r1, _080FCAA4 @ =0x00000a6e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FCB3C
	ldrh r0, [r4, 0x1C]
	cmp r0, 0xF
	beq _080FCAD4
	cmp r0, 0xF
	bgt _080FCAA8
	cmp r0, 0
	beq _080FCAC0
	b _080FCAF8
	.align 2, 0
_080FCAA4: .4byte 0x00000a6e
_080FCAA8:
	cmp r0, 0x3A
	beq _080FCAB8
	cmp r0, 0x49
	bne _080FCAF8
	movs r0, 0x16
	bl sub_8053538
	b _080FCB36
_080FCAB8:
	movs r0, 0x15
	bl sub_8053538
	b _080FCB36
_080FCAC0:
	ldr r0, _080FCAD0 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0xD
	cmp r0, 0
	bne _080FCAEA
	movs r1, 0xC
	b _080FCAEA
	.align 2, 0
_080FCAD0: .4byte gSaveBlock2
_080FCAD4:
	ldr r0, _080FCAF4 @ =0x00000854
	bl FlagGet
	lsls r0, 24
	movs r1, 0xB
	cmp r0, 0
	beq _080FCAEA
	ldrb r0, [r4, 0x1F]
	cmp r0, 0
	bne _080FCAEA
	movs r1, 0x14
_080FCAEA:
	adds r0, r1, 0
	bl sub_8053538
	b _080FCB36
	.align 2, 0
_080FCAF4: .4byte 0x00000854
_080FCAF8:
	ldr r3, _080FCB14 @ =gUnknown_083E7920
	ldr r0, _080FCB18 @ =0x02000000
	ldrh r1, [r0, 0x1C]
	lsls r0, r1, 1
	adds r2, r0, r1
	adds r0, r3, 0x2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FCB1C
	bl sub_8053538
	b _080FCB36
	.align 2, 0
_080FCB14: .4byte gUnknown_083E7920
_080FCB18: .4byte 0x02000000
_080FCB1C:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	bl warp1_set_2
_080FCB36:
	bl sub_80865BC
	b _080FCB42
_080FCB3C:
	ldr r0, _080FCB4C @ =sub_808AD58
	bl SetMainCallback2
_080FCB42:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FCB4C: .4byte sub_808AD58
	thumb_func_end sub_80FC69C

	.align 2, 0 @ Don't pad with nop.
