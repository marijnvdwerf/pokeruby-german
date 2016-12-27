	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start UnusedPokedexAreaScreen
UnusedPokedexAreaScreen: @ 8110A5C
	push {lr}
	ldr r3, _08110A70 @ =0x02000000
	str r1, [r3, 0x4]
	str r2, [r3, 0x8]
	strh r0, [r3, 0xE]
	ldr r0, _08110A74 @ =CB2_UnusedPokedexAreaScreen
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08110A70: .4byte 0x02000000
_08110A74: .4byte CB2_UnusedPokedexAreaScreen
	thumb_func_end UnusedPokedexAreaScreen

	thumb_func_start CB2_UnusedPokedexAreaScreen
CB2_UnusedPokedexAreaScreen: @ 8110A78
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08110A94 @ =gMain
	ldr r1, _08110A98 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08110A8A
	b _08110BB8
_08110A8A:
	lsls r0, 2
	ldr r1, _08110A9C @ =_08110AA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110A94: .4byte gMain
_08110A98: .4byte 0x0000043c
_08110A9C: .4byte _08110AA0
	.align 2, 0
_08110AA0:
	.4byte _08110AC0
	.4byte _08110B18
	.4byte _08110B38
	.4byte _08110B3E
	.4byte _08110B4A
	.4byte _08110B68
	.4byte _08110B7A
	.4byte _08110BA0
_08110AC0:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC4
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	ldr r0, _08110B08 @ =0x04000010
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08110B0C @ =0x04000012
	ldr r3, _08110B10 @ =0x0000fff8
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _08110B14 @ =0x0400001a
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _08110BB8
	.align 2, 0
_08110B08: .4byte 0x04000010
_08110B0C: .4byte 0x04000012
_08110B10: .4byte 0x0000fff8
_08110B14: .4byte 0x0400001a
_08110B18:
	ldr r4, _08110B34 @ =0x020006e8
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _08110BB8
	.align 2, 0
_08110B34: .4byte 0x020006e8
_08110B38:
	bl sub_8110824
	b _08110BB8
_08110B3E:
	bl DrawAreaGlow
	lsls r0, 24
	cmp r0, 0
	bne _08110BC4
	b _08110BB8
_08110B4A:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	movs r1, 0x8
	negs r1, r1
	movs r0, 0
	bl sub_80FB2A4
	ldr r0, _08110B64 @ =sub_81107DC
	bl SetVBlankCallback
	b _08110BB8
	.align 2, 0
_08110B64: .4byte sub_81107DC
_08110B68:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08110BB8
_08110B7A:
	ldr r1, _08110B94 @ =0x04000050
	ldr r2, _08110B98 @ =0x00003f41
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8111084
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _08110B9C @ =0x00007741
	adds r0, r3, 0
	strh r0, [r1]
	b _08110BB8
	.align 2, 0
_08110B94: .4byte 0x04000050
_08110B98: .4byte 0x00003f41
_08110B9C: .4byte 0x00007741
_08110BA0:
	ldr r0, _08110BB0 @ =sub_8111288
	bl sub_8110814
	ldr r0, _08110BB4 @ =sub_81107F0
	bl SetMainCallback2
	b _08110BC4
	.align 2, 0
_08110BB0: .4byte sub_8111288
_08110BB4: .4byte sub_81107F0
_08110BB8:
	ldr r1, _08110BCC @ =gMain
	ldr r0, _08110BD0 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08110BC4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110BCC: .4byte gMain
_08110BD0: .4byte 0x0000043c
	thumb_func_end CB2_UnusedPokedexAreaScreen

	thumb_func_start sub_81107DC
sub_81107DC: @ 8110BD4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_81107DC

	thumb_func_start sub_81107F0
sub_81107F0: @ 8110BE8
	push {lr}
	ldr r0, _08110C08 @ =0x02000000
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_8111110
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08110C08: .4byte 0x02000000
	thumb_func_end sub_81107F0

	thumb_func_start sub_8110814
sub_8110814: @ 8110C0C
	ldr r1, _08110C18 @ =0x02000000
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0xC]
	bx lr
	.align 2, 0
_08110C18: .4byte 0x02000000
	thumb_func_end sub_8110814

	thumb_func_start sub_8110824
sub_8110824: @ 8110C1C
	ldr r0, _08110C2C @ =0x02000000
	movs r1, 0x8A
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08110C2C: .4byte 0x02000000
	thumb_func_end sub_8110824

	thumb_func_start DrawAreaGlow
DrawAreaGlow: @ 8110C30
	push {lr}
	ldr r1, _08110C4C @ =0x02000000
	movs r2, 0x8A
	lsls r2, 1
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x5
	bhi _08110CDC
	lsls r0, 2
	ldr r1, _08110C50 @ =_08110C54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110C4C: .4byte 0x02000000
_08110C50: .4byte _08110C54
	.align 2, 0
_08110C54:
	.4byte _08110C6C
	.4byte _08110C7C
	.4byte _08110C82
	.4byte _08110C94
	.4byte _08110CB8
	.4byte _08110CC8
_08110C6C:
	ldr r0, _08110C78 @ =0x02000000
	ldrh r0, [r0, 0xE]
	bl FindMapsWithMon
	b _08110CE8
	.align 2, 0
_08110C78: .4byte 0x02000000
_08110C7C:
	bl BuildAreaGlowTilemap
	b _08110CE8
_08110C82:
	ldr r0, _08110C8C @ =gUnknown_083F8438
	ldr r1, _08110C90 @ =0x0600c000
	bl LZ77UnCompVram
	b _08110CE8
	.align 2, 0
_08110C8C: .4byte gUnknown_083F8438
_08110C90: .4byte 0x0600c000
_08110C94:
	ldr r1, _08110CA8 @ =0x040000d4
	ldr r0, _08110CAC @ =0x02000116
	str r0, [r1]
	ldr r0, _08110CB0 @ =0x0600f000
	str r0, [r1, 0x4]
	ldr r0, _08110CB4 @ =0x80000280
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _08110CE8
	.align 2, 0
_08110CA8: .4byte 0x040000d4
_08110CAC: .4byte 0x02000116
_08110CB0: .4byte 0x0600f000
_08110CB4: .4byte 0x80000280
_08110CB8:
	ldr r0, _08110CC4 @ =gUnknown_083F8418
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _08110CE8
	.align 2, 0
_08110CC4: .4byte gUnknown_083F8418
_08110CC8:
	ldr r1, _08110CE0 @ =0x04000008
	ldr r3, _08110CE4 @ =0x00001e0d
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08110CDC:
	movs r0, 0
	b _08110CF8
	.align 2, 0
_08110CE0: .4byte 0x04000008
_08110CE4: .4byte 0x00001e0d
_08110CE8:
	ldr r1, _08110CFC @ =0x02000000
	movs r2, 0x8A
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_08110CF8:
	pop {r1}
	bx r1
	.align 2, 0
_08110CFC: .4byte 0x02000000
	thumb_func_end DrawAreaGlow

	thumb_func_start FindMapsWithMon
FindMapsWithMon: @ 8110D00
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0xCC
	lsls r0, 1
	cmp r7, r0
	bne _08110D16
	b _08110E3C
_08110D16:
	ldr r2, _08110D80 @ =0x02000000
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r6, 0
	ldr r1, _08110D84 @ =gUnknown_083F856C
_08110D2E:
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	bne _08110D3A
	b _08110E84
_08110D3A:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _08110D2E
	movs r6, 0
	ldr r4, _08110D88 @ =gUnknown_083F856E
	ldrh r0, [r4]
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08110DC8
	mov r8, r4
	adds r5, r4, 0x4
	mov r9, r1
_08110D58:
	lsls r0, r6, 1
	adds r1, r0, r6
	lsls r2, r1, 1
	mov r3, r8
	adds r1, r2, r3
	adds r3, r0, 0
	ldrh r1, [r1]
	cmp r7, r1
	bne _08110DB2
	adds r0, r4, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, 0x18
	beq _08110D9E
	cmp r0, 0x18
	bgt _08110D8C
	cmp r0, 0
	beq _08110D92
	b _08110DB2
	.align 2, 0
_08110D80: .4byte 0x02000000
_08110D84: .4byte gUnknown_083F856C
_08110D88: .4byte gUnknown_083F856E
_08110D8C:
	cmp r0, 0x1A
	beq _08110D9E
	b _08110DB2
_08110D92:
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r0, 0
	bl SetAreaHasMon
	b _08110DB2
_08110D9E:
	adds r1, r3, r6
	lsls r1, 1
	mov r0, r8
	adds r0, 0x2
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r1, r5
	ldrh r1, [r1]
	bl SetSpecialMapHasMon
_08110DB2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _08110DF8 @ =gUnknown_083F856E
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r9
	bne _08110D58
_08110DC8:
	movs r6, 0
	ldr r1, _08110DFC @ =gWildMonHeaders
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08110E84
_08110DD2:
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 2
	adds r5, r0, r1
	adds r0, r5, 0
	adds r1, r7, 0
	bl MapHasMon
	lsls r0, 24
	cmp r0, 0
	beq _08110E20
	ldrb r0, [r5]
	cmp r0, 0x18
	beq _08110E10
	cmp r0, 0x18
	bgt _08110E00
	cmp r0, 0
	beq _08110E06
	b _08110E20
	.align 2, 0
_08110DF8: .4byte gUnknown_083F856E
_08110DFC: .4byte gWildMonHeaders
_08110E00:
	cmp r0, 0x1A
	beq _08110E10
	b _08110E20
_08110E06:
	ldrb r1, [r5, 0x1]
	movs r0, 0
	bl SetAreaHasMon
	b _08110E20
_08110E10:
	ldr r0, _08110E38 @ =gWildMonHeaders
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl SetSpecialMapHasMon
_08110E20:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _08110E38 @ =gWildMonHeaders
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08110DD2
	b _08110E84
	.align 2, 0
_08110E38: .4byte gWildMonHeaders
_08110E3C:
	ldr r4, _08110E74 @ =0x02000000
	movs r0, 0x89
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08110E78 @ =0x02028878
	ldrb r2, [r0, 0x13]
	cmp r2, 0
	beq _08110E7C
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x11
	bl GetRoamerLocation
	ldrb r0, [r4, 0x10]
	ldrb r1, [r4, 0x11]
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	strh r0, [r4, 0x12]
	movs r3, 0x88
	lsls r3, 1
	adds r1, r4, r3
	movs r0, 0x1
	strh r0, [r1]
	b _08110E84
	.align 2, 0
_08110E74: .4byte 0x02000000
_08110E78: .4byte 0x02028878
_08110E7C:
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	strh r2, [r0]
_08110E84:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end FindMapsWithMon

	thumb_func_start SetAreaHasMon
SetAreaHasMon: @ 8110E90
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _08110ED8 @ =0x02000000
	movs r0, 0x88
	lsls r0, 1
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x3F
	bhi _08110ED0
	lsls r0, 2
	adds r0, r5
	strb r2, [r0, 0x10]
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r5
	strb r1, [r0, 0x11]
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	bl sub_80FBA04
	ldrh r1, [r4]
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x12]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_08110ED0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08110ED8: .4byte 0x02000000
	thumb_func_end SetAreaHasMon

	thumb_func_start SetSpecialMapHasMon
SetSpecialMapHasMon: @ 8110EDC
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08110F94 @ =0x02000000
	movs r3, 0x89
	lsls r3, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0x1F
	bhi _08110F8E
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	adds r6, r0, 0
	ldrb r0, [r6, 0x14]
	cmp r0, 0x57
	bhi _08110F8E
	movs r4, 0
	ldr r1, _08110F98 @ =gUnknown_083F857A
	ldrh r0, [r1]
	cmp r0, 0x58
	beq _08110F3A
	adds r5, r1, 0
_08110F0E:
	lsls r2, r4, 2
	adds r1, r2, r5
	ldrb r0, [r6, 0x14]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08110F2A
	adds r0, r5, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08110F8E
_08110F2A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _08110F0E
_08110F3A:
	movs r4, 0
	ldr r0, _08110F94 @ =0x02000000
	movs r1, 0x89
	lsls r1, 1
	adds r2, r0, r1
	ldrh r3, [r2]
	adds r1, r0, 0
	cmp r4, r3
	bcs _08110F6E
	movs r0, 0xC4
	lsls r0, 3
	adds r5, r1, r0
	ldrh r0, [r5]
	ldrb r2, [r6, 0x14]
	cmp r0, r2
	beq _08110F6E
_08110F5A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r3
	bcs _08110F6E
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r2
	bne _08110F5A
_08110F6E:
	movs r3, 0x89
	lsls r3, 1
	adds r2, r1, r3
	ldrh r0, [r2]
	cmp r4, r0
	bne _08110F8E
	lsls r0, r4, 1
	movs r3, 0xC4
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrb r1, [r6, 0x14]
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_08110F8E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110F94: .4byte 0x02000000
_08110F98: .4byte gUnknown_083F857A
	thumb_func_end SetSpecialMapHasMon

	thumb_func_start MapHasMon
MapHasMon: @ 8110F9C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	ldr r0, [r5, 0x4]
	adds r1, r4, 0
	movs r2, 0xC
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110FEA
	ldr r0, [r5, 0x8]
	adds r1, r4, 0
	movs r2, 0x5
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110FEA
	ldr r0, [r5, 0x10]
	adds r1, r4, 0
	movs r2, 0xC
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110FEA
	ldr r0, [r5, 0xC]
	adds r1, r6, 0
	movs r2, 0x5
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110FEA
	movs r0, 0
	b _08110FEC
_08110FEA:
	movs r0, 0x1
_08110FEC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MapHasMon

	thumb_func_start MonListHasMon
MonListHasMon: @ 8110FF4
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0
	beq _08111022
	movs r3, 0
	cmp r3, r2
	bcs _08111022
	ldr r1, [r0, 0x4]
_0811100A:
	lsls r0, r3, 2
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, r4
	bne _08111018
	movs r0, 0x1
	b _08111024
_08111018:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _0811100A
_08111022:
	movs r0, 0
_08111024:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonListHasMon

	thumb_func_start BuildAreaGlowTilemap
BuildAreaGlowTilemap: @ 811102C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, _08111254 @ =gUnknown_02039260
	movs r0, 0
	strh r0, [r1]
	mov r9, r1
	ldr r0, _08111258 @ =0x02000000
	mov r8, r0
	ldr r1, _0811125C @ =gUnknown_02039262
	mov r12, r1
	mov r1, r9
	movs r4, 0x8B
	lsls r4, 1
	add r4, r8
	ldr r3, _08111260 @ =0x0000027f
	movs r2, 0
_08111054:
	ldrh r0, [r1]
	lsls r0, 1
	adds r0, r4
	strh r2, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bls _08111054
	movs r0, 0
	mov r3, r9
	strh r0, [r3]
	movs r1, 0x88
	lsls r1, 1
	add r1, r8
	ldrh r0, [r1]
	cmp r0, 0
	beq _081110FC
	ldr r4, _08111264 @ =gUnknown_02039266
	movs r2, 0
	ldr r5, _0811125C @ =gUnknown_02039262
	mov r0, r8
	str r0, [sp, 0x8]
	movs r1, 0x8B
	lsls r1, 1
	add r1, r8
	mov r10, r1
	ldr r6, _08111268 @ =gUnknown_02039264
	mov r7, r9
_08111092:
	strh r2, [r4]
	ldr r3, _08111268 @ =gUnknown_02039264
	strh r2, [r3]
_08111098:
	mov r0, r12
	strh r2, [r0]
_0811109C:
	ldrh r0, [r5]
	ldrh r1, [r6]
	str r2, [sp]
	bl GetRegionMapSectionAt_
	ldrh r1, [r7]
	lsls r1, 2
	ldr r3, [sp, 0x8]
	adds r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp]
	ldrh r1, [r1, 0x12]
	cmp r0, r1
	bne _081110C4
	ldrh r0, [r4]
	lsls r0, 1
	add r0, r10
	ldr r1, _0811126C @ =0x0000ffff
	strh r1, [r0]
_081110C4:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bls _0811109C
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811125C @ =gUnknown_02039262
	mov r12, r1
	cmp r0, 0x13
	bls _08111098
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08111270 @ =0x02000110
	ldrh r3, [r3]
	cmp r0, r3
	bcc _08111092
_081110FC:
	movs r0, 0
	ldr r1, _08111264 @ =gUnknown_02039266
	strh r0, [r1]
	ldr r3, _08111268 @ =gUnknown_02039264
	strh r0, [r3]
	ldr r6, _0811125C @ =gUnknown_02039262
	mov r10, r0
	adds r3, r1, 0
	ldr r5, _08111274 @ =0x02000116
	ldr r4, _0811126C @ =0x0000ffff
	ldr r7, _08111268 @ =gUnknown_02039264
_08111112:
	mov r0, r10
	strh r0, [r6]
_08111116:
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r4
	bne _08111208
	ldrh r0, [r6]
	cmp r0, 0
	beq _0811113A
	subs r0, r1, 0x1
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _0811113A
	movs r0, 0x2
	orrs r0, r1
	strh r0, [r2]
_0811113A:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08111154
	ldrh r0, [r3]
	adds r0, 0x1
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08111154
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2]
_08111154:
	ldrh r0, [r7]
	cmp r0, 0
	beq _0811116E
	ldrh r0, [r3]
	subs r0, 0x20
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _0811116E
	movs r0, 0x8
	orrs r0, r1
	strh r0, [r2]
_0811116E:
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08111188
	ldrh r0, [r3]
	adds r0, 0x20
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08111188
	movs r0, 0x4
	orrs r0, r1
	strh r0, [r2]
_08111188:
	ldrh r0, [r6]
	cmp r0, 0
	beq _081111A8
	ldrh r0, [r7]
	cmp r0, 0
	beq _081111A8
	ldrh r0, [r3]
	subs r0, 0x21
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _081111A8
	movs r0, 0x10
	orrs r0, r1
	strh r0, [r2]
_081111A8:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _081111C8
	ldrh r0, [r7]
	cmp r0, 0
	beq _081111C8
	ldrh r0, [r3]
	subs r0, 0x1F
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _081111C8
	movs r0, 0x40
	orrs r0, r1
	strh r0, [r2]
_081111C8:
	ldrh r0, [r6]
	cmp r0, 0
	beq _081111E8
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _081111E8
	ldrh r0, [r3]
	adds r0, 0x1F
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _081111E8
	movs r0, 0x20
	orrs r0, r1
	strh r0, [r2]
_081111E8:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08111208
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08111208
	ldrh r0, [r3]
	adds r0, 0x21
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08111208
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r2]
_08111208:
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bhi _0811121E
	b _08111116
_0811121E:
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x13
	bhi _0811122E
	b _08111112
_0811122E:
	movs r0, 0
	mov r1, r9
	strh r0, [r1]
_08111234:
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	movs r4, 0x8B
	lsls r4, 1
	add r4, r8
	adds r3, r0, r4
	ldrh r2, [r3]
	adds r1, r2, 0
	ldr r0, _0811126C @ =0x0000ffff
	cmp r1, r0
	bne _08111278
	movs r0, 0x10
	strh r0, [r3]
	b _08111456
	.align 2, 0
_08111254: .4byte gUnknown_02039260
_08111258: .4byte 0x02000000
_0811125C: .4byte gUnknown_02039262
_08111260: .4byte 0x0000027f
_08111264: .4byte gUnknown_02039266
_08111268: .4byte gUnknown_02039264
_0811126C: .4byte 0x0000ffff
_08111270: .4byte 0x02000110
_08111274: .4byte 0x02000116
_08111278:
	cmp r1, 0
	bne _0811127E
	b _08111456
_0811127E:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0811128C
	ldr r0, _08111320 @ =0x0000ffcf
	ands r0, r2
	strh r0, [r3]
_0811128C:
	mov r1, r9
	ldrh r0, [r1]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081112A4
	ldr r0, _08111324 @ =0x0000ff3f
	ands r0, r1
	strh r0, [r2]
_081112A4:
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _081112BC
	ldr r0, _08111328 @ =0x0000ffaf
	ands r0, r1
	strh r0, [r2]
_081112BC:
	mov r1, r9
	ldrh r0, [r1]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _081112D4
	ldr r0, _0811132C @ =0x0000ff5f
	ands r0, r1
	strh r0, [r2]
_081112D4:
	ldr r6, _08111330 @ =gUnknown_02039268
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r0]
	movs r5, 0xF
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r6]
	ldr r2, _08111334 @ =gUnknown_0203926A
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	strh r0, [r2]
	ldrh r1, [r3]
	adds r3, r2, 0
	cmp r0, 0
	bne _08111302
	b _08111456
_08111302:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r2, [r0]
	adds r1, r5, 0
	ands r1, r2
	strh r1, [r0]
	ldrh r0, [r6]
	cmp r0, 0xA
	bls _08111316
	b _08111456
_08111316:
	lsls r0, 2
	ldr r1, _08111338 @ =_0811133C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111320: .4byte 0x0000ffcf
_08111324: .4byte 0x0000ff3f
_08111328: .4byte 0x0000ffaf
_0811132C: .4byte 0x0000ff5f
_08111330: .4byte gUnknown_02039268
_08111334: .4byte gUnknown_0203926A
_08111338: .4byte _0811133C
	.align 2, 0
_0811133C:
	.4byte _08111368
	.4byte _081113A4
	.4byte _08111386
	.4byte _08111456
	.4byte _081113FA
	.4byte _0811142E
	.4byte _0811142E
	.4byte _08111456
	.4byte _081113C6
	.4byte _08111442
	.4byte _08111442
_08111368:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _08111456
	mov r0, r9
	ldrh r2, [r0]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x10
	lsrs r1, 20
	b _081113C0
_08111386:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _08111456
	mov r3, r9
	ldrh r2, [r3]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1E
	lsrs r1, 20
	b _081113C0
_081113A4:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _08111456
	mov r0, r9
	ldrh r2, [r0]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x20
	lsrs r1, 22
_081113C0:
	adds r0, r1
	strh r0, [r2]
	b _08111456
_081113C6:
	ldrh r2, [r3]
	cmp r2, 0
	beq _08111456
	movs r0, 0x80
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r3, r0, 31
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _081113E4
	movs r0, 0x2
	orrs r3, r0
_081113E4:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x20
	adds r0, r3
	b _08111454
_081113FA:
	ldrh r2, [r3]
	cmp r2, 0
	beq _08111456
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r3, r0, 31
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _08111418
	movs r0, 0x2
	orrs r3, r0
_08111418:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x21
	adds r0, r3
	b _08111454
_0811142E:
	mov r3, r9
	ldrh r1, [r3]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x27
	b _08111454
_08111442:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x25
_08111454:
	strh r0, [r1]
_08111456:
	mov r3, r9
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	ldr r1, _08111478 @ =0x027f0000
	cmp r0, r1
	bhi _08111468
	b _08111234
_08111468:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111478: .4byte 0x027f0000
	thumb_func_end BuildAreaGlowTilemap

	thumb_func_start sub_8111084
sub_8111084: @ 811147C
	push {lr}
	ldr r0, _081114A4 @ =0x02000000
	movs r2, 0x89
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	beq _081114AC
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _081114AC
	ldr r0, _081114A8 @ =0x0000061e
	adds r1, r2, r0
	movs r0, 0x1
	b _081114B2
	.align 2, 0
_081114A4: .4byte 0x02000000
_081114A8: .4byte 0x0000061e
_081114AC:
	ldr r3, _081114F4 @ =0x0000061e
	adds r1, r2, r3
	movs r0, 0
_081114B2:
	strb r0, [r1]
	ldr r1, _081114F8 @ =0x00000616
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0xC3
	lsls r3, 3
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _081114FC @ =0x0000061c
	adds r1, r2, r0
	movs r0, 0x40
	strh r0, [r1]
	adds r3, 0x5
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08111500 @ =0x04000050
	ldr r2, _08111504 @ =0x00003f41
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	bl sub_8111110
	pop {r0}
	bx r0
	.align 2, 0
_081114F4: .4byte 0x0000061e
_081114F8: .4byte 0x00000616
_081114FC: .4byte 0x0000061c
_08111500: .4byte 0x04000050
_08111504: .4byte 0x00003f41
	thumb_func_end sub_8111084

	thumb_func_start sub_8111110
sub_8111110: @ 8111508
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08111544 @ =0x02000000
	ldr r2, _08111548 @ =0x0000061e
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r0, 0
	cmp r1, 0
	bne _081115D6
	ldr r3, _0811154C @ =0x00000616
	adds r1, r5, r3
	ldrh r0, [r1]
	cmp r0, 0
	bne _081115D0
	movs r1, 0xC3
	lsls r1, 3
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08111550
	subs r2, 0x4
	adds r0, r5, r2
	b _08111554
	.align 2, 0
_08111544: .4byte 0x02000000
_08111548: .4byte 0x0000061e
_0811154C: .4byte 0x00000616
_08111550:
	ldr r3, _081115B8 @ =0x0000061c
	adds r0, r5, r3
_08111554:
	ldrh r1, [r0]
	adds r1, 0x4
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	ldr r2, _081115BC @ =gSineTable
	ldr r1, _081115C0 @ =0x0000061a
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 20
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _081115B8 @ =0x0000061c
	adds r0, r5, r3
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	lsls r0, 16
	ldr r2, _081115C4 @ =0x04000052
	lsrs r0, 8
	orrs r1, r0
	strh r1, [r2]
	ldr r1, _081115C8 @ =0x00000616
	adds r0, r5, r1
	movs r2, 0
	strh r2, [r0]
	subs r3, 0x4
	adds r1, r5, r3
	ldrh r0, [r1]
	cmp r0, 0x40
	bne _08111666
	strh r2, [r1]
	movs r1, 0x89
	lsls r1, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08111666
	ldr r2, _081115CC @ =0x0000061e
	adds r1, r5, r2
	movs r0, 0x1
	b _08111664
	.align 2, 0
_081115B8: .4byte 0x0000061c
_081115BC: .4byte gSineTable
_081115C0: .4byte 0x0000061a
_081115C4: .4byte 0x04000052
_081115C8: .4byte 0x00000616
_081115CC: .4byte 0x0000061e
_081115D0:
	subs r0, 0x1
	strh r0, [r1]
	b _08111666
_081115D6:
	ldr r3, _08111674 @ =0x00000616
	adds r1, r5, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC
	bls _08111666
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08111678 @ =0x0000061f
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r4, 0
	movs r2, 0x89
	lsls r2, 1
	adds r0, r5, r2
	ldrh r3, [r0]
	cmp r4, r3
	bcs _08111644
	movs r2, 0xCC
	lsls r2, 3
	adds r2, r5
	mov r9, r2
	mov r8, r1
	movs r3, 0x1
	mov r12, r3
	adds r6, r0, 0
	movs r7, 0x5
	negs r7, r7
_08111618:
	lsls r0, r4, 2
	add r0, r9
	ldr r3, [r0]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	adds r3, 0x3E
	ands r1, r0
	mov r2, r12
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r3, [r6]
	cmp r4, r3
	bcc _08111618
_08111644:
	ldr r0, _08111678 @ =0x0000061f
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0x4
	bls _08111666
	movs r0, 0x1
	strb r0, [r1]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08111666
	ldr r2, _0811167C @ =0x0000061e
	adds r1, r5, r2
	movs r0, 0
_08111664:
	strb r0, [r1]
_08111666:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111674: .4byte 0x00000616
_08111678: .4byte 0x0000061f
_0811167C: .4byte 0x0000061e
	thumb_func_end sub_8111110

	thumb_func_start sub_8111288
sub_8111288: @ 8111680
	push {lr}
	ldr r1, _08111690 @ =0x02000000
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	beq _08111694
	cmp r0, 0x1
	beq _0811169A
	b _081116AA
	.align 2, 0
_08111690: .4byte 0x02000000
_08111694:
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _081116AA
_0811169A:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081116AA
	ldr r0, _081116B0 @ =sub_81112BC
	bl sub_8110814
_081116AA:
	pop {r0}
	bx r0
	.align 2, 0
_081116B0: .4byte sub_81112BC
	thumb_func_end sub_8111288

	thumb_func_start sub_81112BC
sub_81112BC: @ 81116B4
	push {lr}
	ldr r0, _081116D4 @ =0x02000000
	ldrh r0, [r0, 0xC]
	cmp r0, 0
	bne _08111700
	ldr r0, _081116D8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081116E0
	ldr r0, _081116DC @ =sub_8111314
	bl sub_8110814
	b _08111700
	.align 2, 0
_081116D4: .4byte 0x02000000
_081116D8: .4byte gMain
_081116DC: .4byte sub_8111314
_081116E0:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _081116FA
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08111700
	ldr r0, _08111704 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08111700
_081116FA:
	ldr r0, _08111708 @ =sub_8111360
	bl sub_8110814
_08111700:
	pop {r0}
	bx r0
	.align 2, 0
_08111704: .4byte gSaveBlock2
_08111708: .4byte sub_8111360
	thumb_func_end sub_81112BC

	thumb_func_start sub_8111314
sub_8111314: @ 811170C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08111720 @ =0x02000000
	ldrh r1, [r4, 0xC]
	cmp r1, 0
	beq _08111724
	cmp r1, 0x1
	beq _0811173C
	b _08111750
	.align 2, 0
_08111720: .4byte 0x02000000
_08111724:
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _08111750
_0811173C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08111750
	bl sub_80FAB10
	ldr r0, [r4, 0x4]
	bl SetMainCallback2
_08111750:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8111314

	thumb_func_start sub_8111360
sub_8111360: @ 8111758
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _0811176C @ =0x02000000
	ldrh r1, [r4, 0xC]
	cmp r1, 0
	beq _08111770
	cmp r1, 0x1
	beq _08111788
	b _0811179C
	.align 2, 0
_0811176C: .4byte 0x02000000
_08111770:
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _0811179C
_08111788:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0811179C
	bl sub_80FAB10
	ldr r0, [r4, 0x8]
	bl SetMainCallback2
_0811179C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8111360

	thumb_func_start ShowPokedexAreaScreen
ShowPokedexAreaScreen: @ 81117A4
	push {r4,lr}
	ldr r2, _081117D4 @ =0x02000000
	movs r3, 0
	movs r4, 0
	strh r0, [r2, 0xE]
	ldr r0, _081117D8 @ =0x000006e4
	adds r2, r0
	str r1, [r2]
	strb r3, [r1]
	ldr r0, _081117DC @ =Task_PokedexAreaScreen_0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081117E0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081117D4: .4byte 0x02000000
_081117D8: .4byte 0x000006e4
_081117DC: .4byte Task_PokedexAreaScreen_0
_081117E0: .4byte gTasks
	thumb_func_end ShowPokedexAreaScreen

	thumb_func_start Task_PokedexAreaScreen_0
Task_PokedexAreaScreen_0: @ 81117E4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0811180C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0xB
	bls _08111802
	b _08111938
_08111802:
	lsls r0, 2
	ldr r1, _08111810 @ =_08111814
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811180C: .4byte gTasks
_08111810: .4byte _08111814
	.align 2, 0
_08111814:
	.4byte _08111844
	.4byte _08111880
	.4byte _0811188E
	.4byte _081118B0
	.4byte _081118B6
	.4byte _081118C2
	.4byte _081118D6
	.4byte _081118DC
	.4byte _081118E2
	.4byte _081118E8
	.4byte _081118FA
	.4byte _08111920
_08111844:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xC4
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08111870 @ =0x04000010
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08111874 @ =0x04000012
	ldr r3, _08111878 @ =0x0000fff8
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _0811187C @ =0x0400001a
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _08111938
	.align 2, 0
_08111870: .4byte 0x04000010
_08111874: .4byte 0x04000012
_08111878: .4byte 0x0000fff8
_0811187C: .4byte 0x0400001a
_08111880:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08111938
_0811188E:
	ldr r4, _081118AC @ =0x020006e8
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _08111938
	.align 2, 0
_081118AC: .4byte 0x020006e8
_081118B0:
	bl sub_8110824
	b _08111938
_081118B6:
	bl DrawAreaGlow
	lsls r0, 24
	cmp r0, 0
	bne _08111948
	b _08111938
_081118C2:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	movs r1, 0x8
	negs r1, r1
	movs r0, 0
	bl sub_80FB2A4
	b _08111938
_081118D6:
	bl CreateAreaMarkerSprites
	b _08111938
_081118DC:
	bl LoadAreaUnknownGraphics
	b _08111938
_081118E2:
	bl CreateAreaUnknownSprites
	b _08111938
_081118E8:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08111938
_081118FA:
	ldr r1, _08111914 @ =0x04000050
	ldr r2, _08111918 @ =0x00003f41
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8111084
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0811191C @ =0x00007741
	adds r0, r3, 0
	strh r0, [r1]
	b _08111938
	.align 2, 0
_08111914: .4byte 0x04000050
_08111918: .4byte 0x00003f41
_0811191C: .4byte 0x00007741
_08111920:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldr r1, _08111934 @ =Task_PokedexAreaScreen_1
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x8]
	b _08111948
	.align 2, 0
_08111934: .4byte Task_PokedexAreaScreen_1
_08111938:
	ldr r0, _08111950 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08111948:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111950: .4byte gTasks
	thumb_func_end Task_PokedexAreaScreen_0

	thumb_func_start Task_PokedexAreaScreen_1
Task_PokedexAreaScreen_1: @ 8111954
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8111110
	ldr r1, _0811197C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x1
	beq _081119AC
	cmp r1, 0x1
	bgt _08111980
	cmp r1, 0
	beq _08111996
	b _08111988
	.align 2, 0
_0811197C: .4byte gTasks
_08111980:
	cmp r1, 0x2
	beq _081119F0
	cmp r1, 0x3
	beq _08111A02
_08111988:
	ldr r0, _081119A4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
_08111996:
	ldr r0, _081119A8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08111A44
	b _08111A34
	.align 2, 0
_081119A4: .4byte gTasks
_081119A8: .4byte gPaletteFade
_081119AC:
	ldr r0, _081119C4 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _081119C8
	strh r1, [r5, 0xA]
	movs r0, 0x3
	bl PlaySE
	b _08111A34
	.align 2, 0
_081119C4: .4byte gMain
_081119C8:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _081119E2
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _08111A44
	ldr r0, _081119EC @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08111A44
_081119E2:
	strh r3, [r5, 0xA]
	movs r0, 0x6D
	bl PlaySE
	b _08111A34
	.align 2, 0
_081119EC: .4byte gSaveBlock2
_081119F0:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08111A34
_08111A02:
	ldr r0, _08111A28 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08111A44
	bl DestroyAreaSprites
	ldr r0, _08111A2C @ =0x02000000
	ldr r1, _08111A30 @ =0x000006e4
	adds r0, r1
	ldr r1, [r0]
	ldrh r0, [r5, 0xA]
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
	b _08111A44
	.align 2, 0
_08111A28: .4byte gPaletteFade
_08111A2C: .4byte 0x02000000
_08111A30: .4byte 0x000006e4
_08111A34:
	ldr r0, _08111A4C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08111A44:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111A4C: .4byte gTasks
	thumb_func_end Task_PokedexAreaScreen_1

	thumb_func_start CreateAreaMarkerSprites
CreateAreaMarkerSprites: @ 8111A50
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08111B18 @ =gUnknown_083F858C
	bl LoadSpriteSheet
	ldr r0, _08111B1C @ =gUnknown_083F8594
	bl LoadSpritePalette
	movs r5, 0
	movs r1, 0
	ldr r0, _08111B20 @ =0x02000000
	movs r3, 0x89
	lsls r3, 1
	adds r2, r0, r3
	ldrh r7, [r2]
	cmp r5, r7
	bge _08111B04
	adds r6, r0, 0
	mov r8, r2
_08111A78:
	lsls r0, r1, 16
	asrs r4, r0, 16
	lsls r1, r4, 1
	movs r2, 0xC4
	lsls r2, 3
	adds r0, r6, r2
	adds r1, r0
	ldr r2, _08111B24 @ =gRegionMapLocations
	movs r3, 0
	ldrsh r0, [r1, r3]
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldrb r2, [r0, 0x1]
	lsls r2, 19
	ldrb r3, [r0, 0x2]
	subs r3, 0x1
	lsls r3, 2
	ldrb r0, [r0, 0x3]
	subs r0, 0x1
	lsls r0, 2
	movs r7, 0xE0
	lsls r7, 13
	adds r2, r7
	asrs r2, 16
	adds r1, r3
	adds r2, r0
	ldr r0, _08111B28 @ =gSpriteTemplate_83F85A4
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08111AF4
	ldr r0, _08111B2C @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r1, r5, 0
	lsls r0, r1, 16
	movs r3, 0x80
	lsls r3, 9
	adds r0, r3
	lsrs r5, r0, 16
	lsls r1, 16
	asrs r1, 14
	movs r7, 0xCC
	lsls r7, 3
	adds r0, r6, r7
	adds r1, r0
	str r2, [r1]
_08111AF4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	mov r2, r8
	ldrh r2, [r2]
	cmp r0, r2
	blt _08111A78
_08111B04:
	ldr r0, _08111B20 @ =0x02000000
	movs r3, 0xDC
	lsls r3, 3
	adds r0, r3
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111B18: .4byte gUnknown_083F858C
_08111B1C: .4byte gUnknown_083F8594
_08111B20: .4byte 0x02000000
_08111B24: .4byte gRegionMapLocations
_08111B28: .4byte gSpriteTemplate_83F85A4
_08111B2C: .4byte gSprites
	thumb_func_end CreateAreaMarkerSprites

	thumb_func_start DestroyAreaSprites
DestroyAreaSprites: @ 8111B30
	push {r4-r6,lr}
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	movs r0, 0x2
	bl FreeSpritePaletteByTag
	movs r4, 0
	ldr r1, _08111B9C @ =0x02000000
	movs r2, 0xDC
	lsls r2, 3
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _08111B6E
	adds r6, r1, 0
	adds r5, r0, 0
_08111B52:
	lsls r0, r4, 2
	movs r2, 0xCC
	lsls r2, 3
	adds r1, r6, r2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r0, [r5]
	cmp r4, r0
	bcc _08111B52
_08111B6E:
	movs r0, 0x3
	bl FreeSpriteTilesByTag
	movs r0, 0x3
	bl FreeSpritePaletteByTag
	movs r4, 0
	ldr r5, _08111BA0 @ =0x02000fa8
_08111B7E:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	beq _08111B8C
	bl DestroySprite
_08111B8C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111B7E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111B9C: .4byte 0x02000000
_08111BA0: .4byte 0x02000fa8
	thumb_func_end DestroyAreaSprites

	thumb_func_start LoadAreaUnknownGraphics
LoadAreaUnknownGraphics: @ 8111BA4
	push {lr}
	sub sp, 0x8
	ldr r0, _08111BCC @ =gUnknown_083F8664
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _08111BD0 @ =gAreaUnknownTiles
	ldr r1, _08111BD4 @ =0x02000fb4
	bl LZ77UnCompWram
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _08111BD8 @ =gUnknown_083F865C
	bl LoadSpritePalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08111BCC: .4byte gUnknown_083F8664
_08111BD0: .4byte gAreaUnknownTiles
_08111BD4: .4byte 0x02000fb4
_08111BD8: .4byte gUnknown_083F865C
	thumb_func_end LoadAreaUnknownGraphics

	thumb_func_start CreateAreaUnknownSprites
CreateAreaUnknownSprites: @ 8111BDC
	push {r4-r7,lr}
	ldr r1, _08111C08 @ =0x02000000
	movs r2, 0x88
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08111C10
	movs r4, 0
	ldr r7, _08111C0C @ =0x00000fa8
	adds r2, r1, r7
	movs r1, 0
_08111BF4:
	lsls r0, r4, 2
	adds r0, r2
	str r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111BF4
	b _08111C86
	.align 2, 0
_08111C08: .4byte 0x02000000
_08111C0C: .4byte 0x00000fa8
_08111C10:
	movs r4, 0
	ldr r6, _08111C60 @ =gSprites
	ldr r0, _08111C64 @ =0x00000fa8
	adds r5, r1, r0
_08111C18:
	lsls r1, r4, 21
	movs r2, 0xA0
	lsls r2, 16
	adds r1, r2
	asrs r1, 16
	ldr r0, _08111C68 @ =gSpriteTemplate_83F8674
	movs r2, 0x8C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08111C74
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrh r3, [r2, 0x4]
	lsls r0, r3, 22
	lsrs r0, 22
	lsls r1, r4, 4
	adds r0, r1
	ldr r7, _08111C6C @ =0x000003ff
	adds r1, r7, 0
	ands r0, r1
	ldr r7, _08111C70 @ =0xfffffc00
	adds r1, r7, 0
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, 0x4]
	lsls r0, r4, 2
	adds r0, r5
	str r2, [r0]
	b _08111C7C
	.align 2, 0
_08111C60: .4byte gSprites
_08111C64: .4byte 0x00000fa8
_08111C68: .4byte gSpriteTemplate_83F8674
_08111C6C: .4byte 0x000003ff
_08111C70: .4byte 0xfffffc00
_08111C74:
	lsls r0, r4, 2
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_08111C7C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111C18
_08111C86:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateAreaUnknownSprites

	.align 2, 0 @ Don't pad with nop.
