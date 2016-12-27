	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_813CAF4
sub_813CAF4: @ 813CED0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813CF08 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x26]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _0813CEF4
	b _0813D004
_0813CEF4:
	cmp r0, 0x4
	bgt _0813CF0C
	cmp r0, 0x2
	beq _0813CF3C
	cmp r0, 0x2
	bgt _0813CFA0
	cmp r0, 0
	beq _0813CF22
	b _0813D06A
	.align 2, 0
_0813CF08: .4byte gTasks
_0813CF0C:
	cmp r0, 0x1E
	beq _0813CFCA
	cmp r0, 0x1E
	bgt _0813CF1A
	cmp r0, 0x14
	beq _0813CF66
	b _0813D06A
_0813CF1A:
	cmp r0, 0x28
	bne _0813CF20
	b _0813D032
_0813CF20:
	b _0813D06A
_0813CF22:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xE5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0813CF38 @ =0x0400000c
	strh r6, [r0]
	movs r0, 0xFF
	strh r0, [r4, 0x8]
	b _0813D06A
	.align 2, 0
_0813CF38: .4byte 0x0400000c
_0813CF3C:
	ldr r0, _0813CF8C @ =0x0000ffff
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813CF90 @ =0x0400000c
	ldr r2, _0813CF94 @ =0x00000e07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x14
	strh r0, [r4, 0x8]
_0813CF66:
	ldr r2, _0813CF98 @ =0x0400001a
	ldr r0, _0813CF9C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	strh r0, [r2]
	subs r2, 0x2
	ldrh r0, [r1, 0xC]
	strh r0, [r2]
	ldrh r0, [r1, 0xA]
	adds r0, 0x6
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xC]
	subs r0, 0x8
	strh r0, [r1, 0xC]
	b _0813D06A
	.align 2, 0
_0813CF8C: .4byte 0x0000ffff
_0813CF90: .4byte 0x0400000c
_0813CF94: .4byte 0x00000e07
_0813CF98: .4byte 0x0400001a
_0813CF9C: .4byte gTasks
_0813CFA0:
	ldr r0, _0813CFF0 @ =0x0000ffff
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813CFF4 @ =0x0400000c
	ldr r2, _0813CFF8 @ =0x00000e07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x1E
	strh r0, [r4, 0x8]
_0813CFCA:
	ldr r2, _0813CFFC @ =0x0400001a
	ldr r0, _0813D000 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	strh r0, [r2]
	subs r2, 0x2
	ldrh r0, [r1, 0xC]
	strh r0, [r2]
	ldrh r0, [r1, 0xA]
	subs r0, 0x6
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xC]
	adds r0, 0x8
	strh r0, [r1, 0xC]
	b _0813D06A
	.align 2, 0
_0813CFF0: .4byte 0x0000ffff
_0813CFF4: .4byte 0x0400000c
_0813CFF8: .4byte 0x00000e07
_0813CFFC: .4byte 0x0400001a
_0813D000: .4byte gTasks
_0813D004:
	ldr r0, _0813D074 @ =0x000037f7
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x5
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813D078 @ =0x0400000c
	ldr r2, _0813D07C @ =0x00000e07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x8
	strh r0, [r4, 0xE]
	movs r0, 0x28
	strh r0, [r4, 0x8]
_0813D032:
	ldr r2, _0813D080 @ =0x0400001a
	ldr r1, _0813D084 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xA]
	strh r0, [r2]
	ldr r1, _0813D088 @ =0x04000018
	ldrh r0, [r3, 0xC]
	strh r0, [r1]
	ldrh r0, [r3, 0xA]
	ldrh r2, [r3, 0xE]
	subs r0, r2
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	adds r0, r2, r1
	strh r0, [r3, 0xC]
	ldrh r1, [r3, 0x26]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813D06A
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813D06A
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_0813D06A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813D074: .4byte 0x000037f7
_0813D078: .4byte 0x0400000c
_0813D07C: .4byte 0x00000e07
_0813D080: .4byte 0x0400001a
_0813D084: .4byte gTasks
_0813D088: .4byte 0x04000018
	thumb_func_end sub_813CAF4

	thumb_func_start intro_reset_and_hide_bgs
intro_reset_and_hide_bgs: @ 813D08C
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x1C
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3E
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	thumb_func_end intro_reset_and_hide_bgs

	thumb_func_start sub_813CCE8
sub_813CCE8: @ 813D0C4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813D0E8 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0813D104
	lsls r0, 2
	ldr r1, _0813D0EC @ =_0813D0F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813D0E8: .4byte gTasks
_0813D0EC: .4byte _0813D0F0
	.align 2, 0
_0813D0F0:
	.4byte _0813D104
	.4byte _0813D138
	.4byte _0813D168
	.4byte _0813D184
	.4byte _0813D1D8
_0813D104:
	ldr r1, _0813D130 @ =0x04000050
	ldr r4, _0813D134 @ =0x00003f50
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r4, 0x80
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r2
	movs r1, 0x40
	strh r1, [r0, 0xA]
	movs r1, 0x1
	strh r1, [r0, 0x8]
	b _0813D202
	.align 2, 0
_0813D130: .4byte 0x04000050
_0813D134: .4byte 0x00003f50
_0813D138:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r2
	ldrh r1, [r2, 0xA]
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0813D154
	subs r0, r1, 0x1
	strh r0, [r2, 0xA]
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	b _0813D19E
_0813D154:
	ldr r1, _0813D160 @ =0x04000052
	ldr r0, _0813D164 @ =gUnknown_08393E64
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, 0x80
	b _0813D1C6
	.align 2, 0
_0813D160: .4byte 0x04000052
_0813D164: .4byte gUnknown_08393E64
_0813D168:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	movs r3, 0xA
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _0813D1EA
	strh r2, [r1, 0xA]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0813D202
_0813D184:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r2
	ldrh r1, [r2, 0xA]
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	cmp r0, 0x3D
	bgt _0813D1BC
	adds r0, r1, 0x1
	strh r0, [r2, 0xA]
	movs r1, 0xA
	ldrsh r0, [r2, r1]
_0813D19E:
	lsrs r1, r0, 31
	adds r0, r1
	movs r2, 0xFF
	lsls r2, 1
	ldr r3, _0813D1B4 @ =0x04000052
	ldr r1, _0813D1B8 @ =gUnknown_08393E64
	ands r0, r2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	b _0813D202
	.align 2, 0
_0813D1B4: .4byte 0x04000052
_0813D1B8: .4byte gUnknown_08393E64
_0813D1BC:
	ldr r1, _0813D1D0 @ =0x04000052
	ldr r0, _0813D1D4 @ =gUnknown_08393E64
	ldrh r0, [r0, 0x3E]
	strh r0, [r1]
	movs r0, 0x10
_0813D1C6:
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _0813D202
	.align 2, 0
_0813D1D0: .4byte 0x04000052
_0813D1D4: .4byte gUnknown_08393E64
_0813D1D8:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	movs r4, 0xA
	ldrsh r2, [r1, r4]
	cmp r2, 0
	beq _0813D1F0
_0813D1EA:
	subs r0, 0x1
	strh r0, [r1, 0xA]
	b _0813D202
_0813D1F0:
	ldr r0, _0813D208 @ =0x04000050
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, r3, 0
	bl DestroyTask
_0813D202:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D208: .4byte 0x04000050
	thumb_func_end sub_813CCE8

	thumb_func_start sub_813CE30
sub_813CE30: @ 813D20C
	push {r4,lr}
	sub sp, 0x24
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0x80
	lsls r4, 8
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r4, sp
	strh r0, [r4, 0x8]
	mov r0, sp
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	strh r2, [r0, 0xE]
	strh r3, [r0, 0x10]
	add r4, sp, 0x14
	adds r1, r4, 0
	movs r2, 0x1
	bl BgAffineSet
	ldr r1, _0813D260 @ =0x04000020
	ldrh r0, [r4]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x4]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x6]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r4, 0x8]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r4, 0xC]
	str r0, [r1]
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D260: .4byte 0x04000020
	thumb_func_end sub_813CE30

	thumb_func_start sub_813CE88
sub_813CE88: @ 813D264
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r4, 24
	lsrs r6, r4, 24
	cmp r6, 0
	beq _0813D2CC
	lsls r0, r7, 3
	ldr r1, _0813D2C0 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0813D2C4 @ =gMonFrontPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0813D2C8 @ =gUnknown_0840B5A0
	mov r6, r8
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _0813D2F8
	.align 2, 0
_0813D2C0: .4byte gMonFrontPicTable
_0813D2C4: .4byte gMonFrontPicCoords
_0813D2C8: .4byte gUnknown_0840B5A0
_0813D2CC:
	lsls r0, r7, 3
	ldr r1, _0813D36C @ =gMonBackPicTable
	adds r0, r1
	ldr r1, _0813D370 @ =gMonBackPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0813D374 @ =gUnknown_0840B5A0
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	bl sub_800D378
_0813D2F8:
	ldr r2, _0813D378 @ =0x0000ffff
	adds r0, r7, 0
	movs r1, 0
	bl species_and_otid_get_pal
	mov r6, r8
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8143648
	ldr r0, _0813D37C @ =gUnknown_02024E8C
	mov r3, r9
	lsls r1, r3, 16
	asrs r1, 16
	mov r5, r10
	lsls r2, r5, 16
	asrs r2, 16
	mov r3, r8
	adds r3, 0x1
	lsls r3, 26
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813D380 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813D36C: .4byte gMonBackPicTable
_0813D370: .4byte gMonBackPicCoords
_0813D374: .4byte gUnknown_0840B5A0
_0813D378: .4byte 0x0000ffff
_0813D37C: .4byte gUnknown_02024E8C
_0813D380: .4byte gSprites
	thumb_func_end sub_813CE88

	thumb_func_start sub_813CFA8
sub_813CFA8: @ 813D384
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	mov r10, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r6, 16
	lsrs r6, 16
	lsls r7, r0, 3
	ldr r1, _0813D444 @ =gTrainerBackPicTable
	mov r8, r1
	add r8, r7
	ldr r1, _0813D448 @ =gTrainerBackPicCoords
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0813D44C @ =gUnknown_0840B5A0
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _0813D450 @ =gTrainerBackPicPaletteTable
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8143680
	ldr r0, _0813D454 @ =gUnknown_02024E8C
	ldr r1, _0813D458 @ =gUnknown_0840B064
	str r1, [r0, 0x8]
	mov r1, r9
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813D45C @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813D444: .4byte gTrainerBackPicTable
_0813D448: .4byte gTrainerBackPicCoords
_0813D44C: .4byte gUnknown_0840B5A0
_0813D450: .4byte gTrainerBackPicPaletteTable
_0813D454: .4byte gUnknown_02024E8C
_0813D458: .4byte gUnknown_0840B064
_0813D45C: .4byte gSprites
	thumb_func_end sub_813CFA8

	thumb_func_start sub_813D084
sub_813D084: @ 813D460
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0813D47C
	cmp r0, 0x1
	ble _0813D472
	cmp r0, 0x2
	beq _0813D484
_0813D472:
	ldr r2, _0813D478 @ =0x00003ff6
	b _0813D486
	.align 2, 0
_0813D478: .4byte 0x00003ff6
_0813D47C:
	ldr r2, _0813D480 @ =0x000031df
	b _0813D486
	.align 2, 0
_0813D480: .4byte 0x000031df
_0813D484:
	ldr r2, _0813D49C @ =0x0000518c
_0813D486:
	ldr r0, _0813D4A0 @ =gPlttBufferUnfaded
	movs r1, 0xF1
	lsls r1, 1
	adds r0, r1
	strh r2, [r0]
	ldr r0, _0813D4A4 @ =gPlttBufferFaded
	adds r0, r1
	strh r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0813D49C: .4byte 0x0000518c
_0813D4A0: .4byte gPlttBufferUnfaded
_0813D4A4: .4byte gPlttBufferFaded
	thumb_func_end sub_813D084

	thumb_func_start sub_813D0CC
sub_813D0CC: @ 813D4A8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xBF
	ble _0813D524
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813D4C6
	subs r0, r1, 0x1
	strh r0, [r4, 0x34]
	b _0813D52A
_0813D4C6:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x32]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 5
	subs r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4, 0x32]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	adds r0, r1, 0
	subs r0, 0xC0
	cmp r0, 0
	bge _0813D508
	adds r0, 0x7F
_0813D508:
	asrs r0, 7
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _0813D516
	movs r0, 0xF
_0813D516:
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	b _0813D52A
_0813D524:
	adds r0, r4, 0
	bl DestroySprite
_0813D52A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813D0CC

	thumb_func_start sub_813D158
sub_813D158: @ 813D534
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0813D5A8 @ =gSprites
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0813D5B0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	movs r0, 0x3
	ands r0, r1
	lsls r0, 3
	strh r0, [r4, 0x34]
	ldr r0, _0813D5AC @ =sub_813D0CC
	str r0, [r4, 0x1C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x2
	bl CalcCenterToCornerVec
	b _0813D5DC
	.align 2, 0
_0813D5A8: .4byte gSprites
_0813D5AC: .4byte sub_813D0CC
_0813D5B0:
	ldrh r0, [r1, 0x24]
	strh r0, [r4, 0x24]
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x26]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x20]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x22]
_0813D5DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813D158

	thumb_func_start sub_813D208
sub_813D208: @ 813D5E4
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0813D5F4
	ldr r0, _0813D5F8 @ =sub_813D220
	str r0, [r1, 0x1C]
_0813D5F4:
	pop {r0}
	bx r0
	.align 2, 0
_0813D5F8: .4byte sub_813D220
	thumb_func_end sub_813D208

	thumb_func_start sub_813D220
sub_813D220: @ 813D5FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	ldrh r4, [r7, 0x20]
	movs r1, 0x20
	ldrsh r0, [r7, r1]
	cmp r0, 0x74
	bgt _0813D63C
	ldrh r0, [r7, 0x26]
	ldrh r1, [r7, 0x22]
	adds r0, r1
	movs r1, 0
	strh r0, [r7, 0x22]
	strh r1, [r7, 0x26]
	adds r0, r4, 0x4
	strh r0, [r7, 0x20]
	ldr r0, _0813D634 @ =0x0000fffc
	strh r0, [r7, 0x24]
	movs r0, 0x80
	strh r0, [r7, 0x36]
	ldr r0, _0813D638 @ =sub_813D368
	str r0, [r7, 0x1C]
	b _0813D72E
	.align 2, 0
_0813D634: .4byte 0x0000fffc
_0813D638: .4byte sub_813D368
_0813D63C:
	ldrh r1, [r7, 0x36]
	ldr r5, _0813D740 @ =gSineTable
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	adds r0, r1, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r3, [r0]
	adds r1, 0x2
	strh r1, [r7, 0x36]
	lsls r2, 16
	asrs r0, r2, 16
	cmp r0, 0
	bge _0813D662
	adds r0, 0x1F
_0813D662:
	asrs r0, 5
	strh r0, [r7, 0x26]
	subs r0, r4, 0x1
	strh r0, [r7, 0x20]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813D678
	ldrh r0, [r7, 0x22]
	adds r0, 0x1
	strh r0, [r7, 0x22]
_0813D678:
	lsls r0, r3, 16
	asrs r0, 16
	negs r0, r0
	cmp r0, 0
	bge _0813D684
	adds r0, 0xF
_0813D684:
	lsls r1, r0, 12
	lsrs r1, 16
	ldrh r4, [r7, 0x32]
	ldrh r3, [r7, 0x34]
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	adds r1, 0x30
	lsls r1, 24
	lsrs r1, 23
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r1, 0
	muls r0, r4
	cmp r0, 0
	bge _0813D6AE
	adds r0, 0xFF
_0813D6AE:
	lsls r0, 8
	lsrs r0, 16
	mov r8, r0
	lsls r0, r2, 16
	asrs r2, r0, 16
	negs r0, r2
	muls r0, r3
	cmp r0, 0
	bge _0813D6C2
	adds r0, 0xFF
_0813D6C2:
	lsls r0, 8
	lsrs r0, 16
	mov r10, r0
	adds r0, r2, 0
	muls r0, r4
	cmp r0, 0
	bge _0813D6D2
	adds r0, 0xFF
_0813D6D2:
	lsls r0, 8
	lsrs r5, r0, 16
	adds r0, r1, 0
	muls r0, r3
	cmp r0, 0
	bge _0813D6E0
	adds r0, 0xFF
_0813D6E0:
	lsls r6, r0, 8
	lsrs r6, 16
	ldrh r0, [r7, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r3, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r0, [r7, 0x30]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r5
	mov r1, r10
	lsls r5, r1, 16
	lsrs r3, r5, 16
	lsls r4, r6, 16
	str r6, [sp]
	mov r1, r8
	mov r2, r9
	bl SetOamMatrix
	ldrh r0, [r7, 0x30]
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 1
	lsrs r5, 16
	lsls r4, 1
	lsrs r4, 16
	str r4, [sp]
	mov r1, r8
	mov r2, r9
	adds r3, r5, 0
	bl SetOamMatrix
_0813D72E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813D740: .4byte gSineTable
	thumb_func_end sub_813D220

	thumb_func_start sub_813D368
sub_813D368: @ 813D744
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	adds r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	adds r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	adds r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0x40
	beq _0813D7DC
	adds r0, r1, 0
	subs r0, 0x8
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x36]
	adds r1, r0, 0
	ldr r2, _0813D7D8 @ =gSineTable
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bge _0813D7BE
	adds r0, 0x3F
_0813D7BE:
	asrs r0, 6
	strh r0, [r4, 0x24]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0813D7D2
	adds r0, 0x3F
_0813D7D2:
	asrs r0, 6
	strh r0, [r4, 0x26]
	b _0813D7E4
	.align 2, 0
_0813D7D8: .4byte gSineTable
_0813D7DC:
	movs r0, 0
	strh r0, [r4, 0x36]
	ldr r0, _0813D7EC @ =sub_813D414
	str r0, [r4, 0x1C]
_0813D7E4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D7EC: .4byte sub_813D414
	thumb_func_end sub_813D368

	thumb_func_start sub_813D414
sub_813D414: @ 813D7F0
	push {r4,lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _0813D850
	ldrh r0, [r1, 0x36]
	adds r0, 0x8
	strh r0, [r1, 0x36]
	ldr r3, _0813D84C @ =gSineTable
	lsls r0, 24
	lsrs r0, 23
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bge _0813D814
	adds r0, 0xF
_0813D814:
	asrs r0, 4
	adds r0, 0x40
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bge _0813D830
	adds r0, 0x3F
_0813D830:
	asrs r0, 6
	strh r0, [r1, 0x24]
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _0813D844
	adds r0, 0x3F
_0813D844:
	asrs r0, 6
	strh r0, [r1, 0x26]
	b _0813D854
	.align 2, 0
_0813D84C: .4byte gSineTable
_0813D850:
	ldr r0, _0813D85C @ =sub_813D484
	str r0, [r1, 0x1C]
_0813D854:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D85C: .4byte sub_813D484
	thumb_func_end sub_813D414

	thumb_func_start sub_813D484
sub_813D484: @ 813D860
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0813D878
	adds r0, r2, 0x4
	strh r0, [r4, 0x22]
	b _0813D8D4
_0813D878:
	movs r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	movs r0, 0x3
	ands r0, r1
	lsls r0, 3
	strh r0, [r4, 0x34]
	ldr r0, _0813D8DC @ =sub_813D0CC
	str r0, [r4, 0x1C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x2
	bl CalcCenterToCornerVec
_0813D8D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D8DC: .4byte sub_813D0CC
	thumb_func_end sub_813D484

	thumb_func_start sub_813D504
sub_813D504: @ 813D8E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0813D8F8
	adds r0, r2, 0x4
	strh r0, [r4, 0x22]
	b _0813D954
_0813D8F8:
	movs r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	movs r0, 0x3
	ands r0, r1
	lsls r0, 3
	strh r0, [r4, 0x34]
	ldr r0, _0813D95C @ =sub_813D0CC
	str r0, [r4, 0x1C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x2
	bl CalcCenterToCornerVec
_0813D954:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D95C: .4byte sub_813D0CC
	thumb_func_end sub_813D504

	thumb_func_start sub_813D584
sub_813D584: @ 813D960
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, [sp, 0x34]
	ldr r0, [sp, 0x38]
	mov r8, r0
	lsls r4, 16
	lsls r5, 16
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x8]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0xC]
	lsls r6, 16
	lsrs r6, 16
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _0813DA1C @ =gSpriteTemplate_840AE20
	lsrs r2, r4, 16
	mov r10, r2
	asrs r4, 16
	lsrs r1, r5, 16
	str r1, [sp, 0x4]
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _0813DA20 @ =gSprites
	mov r9, r2
	lsls r0, r7, 4
	adds r0, r7
	lsls r5, r0, 2
	adds r4, r5, r2
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x3C]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	strh r0, [r4, 0x30]
	mov r1, sp
	ldrh r1, [r1, 0x8]
	strh r1, [r4, 0x32]
	mov r2, sp
	ldrh r2, [r2, 0x8]
	strh r2, [r4, 0x34]
	strh r6, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0, 0x8]
	strh r0, [r4, 0x3A]
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ldr r1, [sp, 0xC]
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CalcCenterToCornerVec
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	mov r1, r8
	cmp r1, 0
	bne _0813DA28
	mov r0, r9
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _0813DA24 @ =sub_813D208
	b _0813DA30
	.align 2, 0
_0813DA1C: .4byte gSpriteTemplate_840AE20
_0813DA20: .4byte gSprites
_0813DA24: .4byte sub_813D208
_0813DA28:
	mov r0, r9
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _0813DB50 @ =sub_813D504
_0813DA30:
	str r1, [r0]
	str r7, [sp, 0x10]
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	ldr r0, [sp, 0x4]
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	ldr r0, _0813DB54 @ =gSpriteTemplate_840AE20
	mov r1, r10
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0813DB58 @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r0, r4, r5
	mov r1, sp
	ldrh r1, [r1, 0x10]
	strh r1, [r0, 0x3C]
	ldr r2, [sp, 0xC]
	adds r2, 0x1
	mov r9, r2
	strh r2, [r0, 0x30]
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	mov r2, r9
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 1
	ldrb r3, [r0, 0x3]
	movs r6, 0x3F
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x3]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CalcCenterToCornerVec
	ldr r2, _0813DB5C @ =0x02020020
	adds r4, r2
	ldr r0, _0813DB60 @ =sub_813D158
	str r0, [r4]
	ldr r0, _0813DB54 @ =gSpriteTemplate_840AE20
	mov r1, r10
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r5, r4, r5
	mov r1, sp
	ldrh r1, [r1, 0x10]
	strh r1, [r5, 0x3C]
	ldr r2, [sp, 0xC]
	adds r2, 0x2
	mov r8, r2
	strh r2, [r5, 0x30]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	mov r0, r8
	movs r2, 0x1F
	ands r0, r2
	lsls r0, 1
	ldrb r1, [r5, 0x3]
	ands r6, r1
	orrs r6, r0
	strb r6, [r5, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CalcCenterToCornerVec
	ldr r0, _0813DB5C @ =0x02020020
	adds r4, r0
	ldr r1, _0813DB60 @ =sub_813D158
	str r1, [r4]
	ldr r2, [sp, 0xC]
	lsls r0, r2, 24
	lsrs r0, 24
	ldr r5, [sp, 0x8]
	adds r5, 0x20
	lsls r4, r5, 16
	lsrs r4, 16
	str r4, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	str r4, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 17
	lsrs r5, 16
	str r5, [sp]
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r0, [sp, 0x10]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813DB50: .4byte sub_813D504
_0813DB54: .4byte gSpriteTemplate_840AE20
_0813DB58: .4byte gSprites
_0813DB5C: .4byte 0x02020020
_0813DB60: .4byte sub_813D158
	thumb_func_end sub_813D584

	thumb_func_start sub_813D788
sub_813D788: @ 813DB64
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0813DC0C
	lsls r0, 2
	ldr r1, _0813DB7C @ =_0813DB80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813DB7C: .4byte _0813DB80
	.align 2, 0
_0813DB80:
	.4byte _0813DB94
	.4byte _0813DBA2
	.4byte _0813DBC0
	.4byte _0813DBE8
	.4byte _0813DBF2
_0813DB94:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	b _0813DC0A
_0813DBA2:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldr r0, _0813DBBC @ =gIntroFrameCounter
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813DC56
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	b _0813DC0A
	.align 2, 0
_0813DBBC: .4byte gIntroFrameCounter
_0813DBC0:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _0813DBDE
	ldr r0, _0813DBE4 @ =gIntroFrameCounter
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0813DC18
_0813DBDE:
	adds r0, r2, 0x1
	b _0813DC0A
	.align 2, 0
_0813DBE4: .4byte gIntroFrameCounter
_0813DBE8:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
	b _0813DC0C
_0813DBF2:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _0813DC0C
	subs r0, r2, 0x2
_0813DC0A:
	strh r0, [r4, 0x20]
_0813DC0C:
	ldr r0, _0813DC28 @ =gIntroFrameCounter
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813DC56
_0813DC18:
	movs r1, 0x26
	ldrsh r5, [r4, r1]
	cmp r5, 0
	beq _0813DC2C
	movs r0, 0
	strh r0, [r4, 0x26]
	b _0813DC56
	.align 2, 0
_0813DC28: .4byte gIntroFrameCounter
_0813DC2C:
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x1
	beq _0813DC54
	cmp r1, 0x1
	bgt _0813DC42
	cmp r1, 0
	beq _0813DC4A
	b _0813DC56
_0813DC42:
	cmp r1, 0x3
	bgt _0813DC56
	strh r5, [r4, 0x26]
	b _0813DC56
_0813DC4A:
	ldr r0, _0813DC50 @ =0x0000ffff
	strh r0, [r4, 0x26]
	b _0813DC56
	.align 2, 0
_0813DC50: .4byte 0x0000ffff
_0813DC54:
	strh r1, [r4, 0x26]
_0813DC56:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813D788

	thumb_func_start sub_813D880
sub_813D880: @ 813DC5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813DC76
	cmp r0, 0x1
	ble _0813DCBE
	cmp r0, 0x2
	beq _0813DC96
	cmp r0, 0x3
	beq _0813DCB0
	b _0813DCBE
_0813DC76:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	ldr r1, _0813DC8C @ =0x0000012f
	cmp r0, r1
	bgt _0813DC90
	ldrh r0, [r4, 0x24]
	adds r0, 0x8
	b _0813DCBC
	.align 2, 0
_0813DC8C: .4byte 0x0000012f
_0813DC90:
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	b _0813DCBE
_0813DC96:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0x78
	ble _0813DCAA
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	b _0813DCBC
_0813DCAA:
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	b _0813DCBE
_0813DCB0:
	ldrh r1, [r4, 0x24]
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _0813DCBE
	subs r0, r1, 0x2
_0813DCBC:
	strh r0, [r4, 0x24]
_0813DCBE:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl Sin
	ldr r1, _0813DCE0 @ =gUnknown_0203935A
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813DCE0: .4byte gUnknown_0203935A
	thumb_func_end sub_813D880

	thumb_func_start sub_813D908
sub_813D908: @ 813DCE4
	push {lr}
	adds r3, r0, 0
	ldr r2, _0813DD0C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0813DD10
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0813DD2A
	.align 2, 0
_0813DD0C: .4byte gTasks
_0813DD10:
	cmp r0, 0x4
	beq _0813DD24
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _0813DD2A
_0813DD24:
	adds r0, r3, 0
	bl DestroySprite
_0813DD2A:
	pop {r0}
	bx r0
	thumb_func_end sub_813D908

	thumb_func_start sub_813D954
sub_813D954: @ 813DD30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r5, 0
	ldr r7, _0813DE24 @ =gUnknown_0840AF50
	lsls r0, 16
	mov r9, r0
	lsls r0, r6, 16
	str r0, [sp, 0x4]
	mov r1, r9
	asrs r1, 16
	str r1, [sp]
_0813DD58:
	lsls r4, r5, 2
	adds r0, r7, 0x2
	adds r0, r4, r0
	ldrh r1, [r0]
	ldr r2, [sp]
	adds r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r3, r2, 16
	mov r10, r3
	ldr r0, _0813DE28 @ =0xfffc0000
	adds r2, r0
	ldr r0, _0813DE2C @ =gSpriteTemplate_840AF94
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813DE30 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x2E]
	adds r4, r7
	ldrb r1, [r4]
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x8
	bls _0813DD58
	movs r5, 0
	ldr r7, _0813DE34 @ =gUnknown_0840AF74
	mov r0, r10
	adds r0, 0xC
	lsls r0, 16
	mov r10, r0
_0813DDAC:
	lsls r4, r5, 2
	adds r0, r7, 0x2
	adds r0, r4, r0
	mov r2, r9
	asrs r1, r2, 16
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0813DE38 @ =gSpriteTemplate_840AFAC
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r6, _0813DE30 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x2E]
	adds r4, r7
	ldrb r1, [r4]
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _0813DDAC
	ldr r0, _0813DE3C @ =gSpriteTemplate_840AFC4
	ldr r3, [sp, 0x4]
	ldr r1, _0813DE28 @ =0xfffc0000
	adds r2, r3, r1
	asrs r2, 16
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	mov r3, r8
	strh r3, [r0, 0x2E]
	adds r0, r2, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813DE24: .4byte gUnknown_0840AF50
_0813DE28: .4byte 0xfffc0000
_0813DE2C: .4byte gSpriteTemplate_840AF94
_0813DE30: .4byte gSprites
_0813DE34: .4byte gUnknown_0840AF74
_0813DE38: .4byte gSpriteTemplate_840AFAC
_0813DE3C: .4byte gSpriteTemplate_840AFC4
	thumb_func_end sub_813D954

	thumb_func_start sub_813DA64
sub_813DA64: @ 813DE40
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813DE58
	cmp r0, 0x1
	beq _0813DE9C
_0813DE58:
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x80
	strh r0, [r4, 0x30]
	ldr r0, _0813DE98 @ =0x0000ffe8
	strh r0, [r4, 0x32]
	movs r0, 0
	b _0813DF6E
	.align 2, 0
_0813DE98: .4byte 0x0000ffe8
_0813DE9C:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x4F
	bgt _0813DED4
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x78
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8C
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	ble _0813DED4
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
_0813DED4:
	ldr r2, _0813DF3C @ =gSineTable
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	ldrh r3, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	adds r1, r0, 0
	muls r1, r2
	adds r0, r1, 0
	cmp r1, 0
	bge _0813DEFC
	adds r0, 0xFF
_0813DEFC:
	lsls r0, 8
	lsrs r6, r0, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	negs r0, r3
	muls r0, r2
	cmp r0, 0
	bge _0813DF0E
	adds r0, 0xFF
_0813DF0E:
	lsls r0, 8
	lsrs r5, r0, 16
	adds r0, r3, 0
	muls r0, r2
	cmp r0, 0
	bge _0813DF1C
	adds r0, 0xFF
_0813DF1C:
	lsls r0, 8
	lsrs r2, r0, 16
	adds r1, r6, 0
	adds r3, r5, 0
	str r1, [sp]
	movs r0, 0x1
	bl SetOamMatrix
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	bgt _0813DF40
	adds r0, r1, 0
	adds r0, 0x8
	b _0813DF44
	.align 2, 0
_0813DF3C: .4byte gSineTable
_0813DF40:
	adds r0, r1, 0
	adds r0, 0x20
_0813DF44:
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x17
	bgt _0813DF54
	adds r0, r1, 0x1
	strh r0, [r4, 0x32]
_0813DF54:
	ldrh r2, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	bgt _0813DF62
	adds r0, r2, 0x2
	b _0813DF6E
_0813DF62:
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0813DF70
	adds r0, r2, 0x1
_0813DF6E:
	strh r0, [r4, 0x34]
_0813DF70:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813DA64

	thumb_func_start sub_813DB9C
sub_813DB9C: @ 813DF78
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0813DFA8
	lsls r0, 2
	ldr r1, _0813DF90 @ =_0813DF94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813DF90: .4byte _0813DF94
	.align 2, 0
_0813DF94:
	.4byte _0813DFA8
	.4byte _0813DFCE
	.4byte _0813E000
	.4byte _0813E01A
	.4byte _0813E086
_0813DFA8:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813DFBC
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	b _0813DFC8
_0813DFBC:
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
_0813DFC8:
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_0813DFCE:
	ldrh r1, [r4, 0x22]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	cmp r0, 0x60
	ble _0813DFF4
	subs r0, r1, 0x4
	strh r0, [r4, 0x22]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813DFEC
	ldrh r0, [r4, 0x20]
	adds r0, 0x2
	strh r0, [r4, 0x20]
	b _0813E12A
_0813DFEC:
	ldrh r0, [r4, 0x20]
	subs r0, 0x2
	strh r0, [r4, 0x20]
	b _0813E12A
_0813DFF4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x8
	strh r0, [r4, 0x34]
	b _0813E12A
_0813E000:
	ldrh r0, [r4, 0x34]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _0813E010
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _0813E12A
_0813E010:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x34]
	b _0813E12A
_0813E01A:
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813E066
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xFF
	lsls r1, 8
	movs r2, 0x80
	lsls r2, 1
	str r2, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813E07A
_0813E066:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 1
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813E07A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x36]
	b _0813E12A
_0813E086:
	ldrh r0, [r4, 0x36]
	adds r2, r0, 0x1
	strh r2, [r4, 0x36]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _0813E124
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r3, 0x24
	ldrsh r1, [r4, r3]
	adds r0, r1
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	ble _0813E124
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	adds r3, r0, 0
	muls r3, r0
	adds r0, r3, 0
	negs r0, r0
	cmp r0, 0
	bge _0813E0C2
	adds r0, 0x7
_0813E0C2:
	asrs r0, 3
	strh r0, [r4, 0x26]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, 0x32]
	cmp r0, 0
	beq _0813E0D6
	ldrh r0, [r4, 0x24]
	adds r0, r2
	b _0813E0DA
_0813E0D6:
	ldrh r0, [r4, 0x24]
	subs r0, r2
_0813E0DA:
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _0813E0EC
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r4, 0x34]
_0813E0EC:
	ldrh r0, [r4, 0x34]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 16
	cmp r0, 0
	beq _0813E110
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	negs r1, r2
	lsls r1, 16
	lsrs r1, 16
	str r2, [sp]
	b _0813E11A
_0813E110:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r2, [sp]
	adds r1, r2, 0
_0813E11A:
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813E12A
_0813E124:
	adds r0, r4, 0
	bl DestroySprite
_0813E12A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813DB9C

	thumb_func_start sub_813DD58
sub_813DD58: @ 813E134
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813E18A
	cmp r0, 0x1
	ble _0813E14E
	cmp r0, 0x2
	beq _0813E242
	cmp r0, 0x3
	beq _0813E202
_0813E14E:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x34]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_0813E18A:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _0813E1CA
	subs r1, 0x80
	strh r1, [r4, 0x34]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813E1B6
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r4, 0x34]
	str r2, [sp]
	b _0813E1C0
_0813E1B6:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x34]
	str r1, [sp]
_0813E1C0:
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813E242
_0813E1CA:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813E1E8
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xFF
	lsls r1, 8
	str r2, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813E1FA
_0813E1E8:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r2, [sp]
	adds r1, r2, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813E1FA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0813E242
_0813E202:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	cmp r0, 0
	bge _0813E218
	adds r0, 0x1F
_0813E218:
	asrs r0, 5
	strh r0, [r4, 0x26]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813E232
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0813E22E
	adds r0, 0x3
_0813E22E:
	asrs r0, 2
	b _0813E240
_0813E232:
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _0813E23C
	adds r0, 0x3
_0813E23C:
	asrs r0, 2
	negs r0, r0
_0813E240:
	strh r0, [r4, 0x24]
_0813E242:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813DD58

	thumb_func_start sub_813DE70
sub_813DE70: @ 813E24C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0x6
	bhi _0813E28C
	lsls r0, 2
	ldr r1, _0813E26C @ =_0813E270
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E26C: .4byte _0813E270
	.align 2, 0
_0813E270:
	.4byte _0813E28C
	.4byte _0813E4D4
	.4byte _0813E2D0
	.4byte _0813E308
	.4byte _0813E330
	.4byte _0813E484
	.4byte _0813E4AC
_0813E28C:
	ldrh r1, [r7, 0x20]
	movs r2, 0x20
	ldrsh r0, [r7, r2]
	cmp r0, 0x28
	ble _0813E29C
	subs r0, r1, 0x4
	strh r0, [r7, 0x20]
	b _0813E4D4
_0813E29C:
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r4, _0813E2CC @ =gSpriteTemplate_840B084
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x68
	movs r3, 0x64
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x3A]
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0x6A
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x3C]
	b _0813E31E
	.align 2, 0
_0813E2CC: .4byte gSpriteTemplate_840B084
_0813E2D0:
	adds r0, r7, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, _0813E304 @ =gSprites
	movs r3, 0x3A
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrh r0, [r7, 0x2E]
	adds r0, 0x1
	strh r0, [r7, 0x2E]
	b _0813E4D4
	.align 2, 0
_0813E304: .4byte gSprites
_0813E308:
	ldrh r1, [r7, 0x22]
	movs r2, 0x22
	ldrsh r0, [r7, r2]
	cmp r0, 0xA0
	ble _0813E324
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0813E31E:
	movs r0, 0x1
	strh r0, [r7, 0x2E]
	b _0813E4D4
_0813E324:
	adds r0, r1, 0x2
	strh r0, [r7, 0x22]
	ldrh r0, [r7, 0x20]
	subs r0, 0x1
	strh r0, [r7, 0x20]
	b _0813E4D4
_0813E330:
	ldr r6, _0813E470 @ =gSprites
	movs r3, 0x3A
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x24]
	ldrh r1, [r0, 0x20]
	adds r5, r1
	lsls r5, 16
	lsrs r5, 16
	ldrh r4, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r4, r2
	lsls r4, 16
	lsrs r4, 16
	bl DestroySprite
	movs r0, 0x8C
	lsls r0, 1
	lsls r5, 16
	asrs r1, r5, 16
	lsls r4, 16
	asrs r2, r4, 16
	movs r3, 0x1
	mov r8, r3
	str r3, [sp]
	movs r3, 0x2
	bl sub_813CE88
	strh r0, [r7, 0x3A]
	movs r0, 0x3A
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813E474 @ =0x02020020
	adds r0, r1
	ldr r2, _0813E478 @ =sub_813DD58
	mov r10, r2
	str r2, [r0]
	movs r3, 0x3A
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	mov r9, r2
	mov r3, r9
	orrs r1, r3
	strb r1, [r0]
	movs r0, 0x3A
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x30]
	movs r2, 0x3A
	ldrsh r1, [r7, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r3, r8
	strh r3, [r0, 0x32]
	lsrs r5, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_813E580
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x24]
	ldrh r1, [r0, 0x20]
	adds r5, r1
	lsls r5, 16
	lsrs r5, 16
	ldrh r4, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r4, r2
	lsls r4, 16
	lsrs r4, 16
	bl DestroySprite
	ldr r0, _0813E47C @ =0x0000011b
	lsls r5, 16
	asrs r1, r5, 16
	lsls r4, 16
	asrs r2, r4, 16
	mov r3, r8
	str r3, [sp]
	movs r3, 0x3
	bl sub_813CE88
	strh r0, [r7, 0x3C]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813E474 @ =0x02020020
	adds r0, r1
	mov r2, r10
	str r2, [r0]
	movs r3, 0x3C
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	mov r2, r9
	orrs r1, r2
	strb r1, [r0]
	movs r3, 0x3C
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	strh r1, [r0, 0x30]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	strh r1, [r0, 0x32]
	lsrs r5, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_813E580
	movs r0, 0xFF
	lsls r0, 16
	ldr r1, _0813E480 @ =0x00007eff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	mov r2, r8
	strh r2, [r7, 0x2E]
	b _0813E4D4
	.align 2, 0
_0813E470: .4byte gSprites
_0813E474: .4byte 0x02020020
_0813E478: .4byte sub_813DD58
_0813E47C: .4byte 0x0000011b
_0813E480: .4byte 0x00007eff
_0813E484:
	ldr r3, _0813E4A8 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0x3
	strh r2, [r0, 0x2E]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x2E]
	b _0813E4D4
	.align 2, 0
_0813E4A8: .4byte gSprites
_0813E4AC:
	movs r2, 0x3A
	ldrsh r1, [r7, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0813E4E4 @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r3, 0x3C
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r0, r7, 0
	bl DestroySprite
_0813E4D4:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E4E4: .4byte gSprites
	thumb_func_end sub_813DE70

	thumb_func_start sub_813E10C
sub_813E10C: @ 813E4E8
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0813E518
	lsls r0, 2
	ldr r1, _0813E500 @ =_0813E504
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E500: .4byte _0813E504
	.align 2, 0
_0813E504:
	.4byte _0813E518
	.4byte _0813E554
	.4byte _0813E582
	.4byte _0813E59E
	.4byte _0813E5B2
_0813E518:
	ldrh r4, [r3, 0x24]
	movs r2, 0x24
	ldrsh r1, [r3, r2]
	movs r0, 0x38
	negs r0, r0
	cmp r1, r0
	ble _0813E534
	adds r0, r4, 0
	subs r0, 0x8
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	adds r0, 0x6
	strh r0, [r3, 0x26]
	b _0813E5E4
_0813E534:
	ldrh r0, [r3, 0x20]
	movs r2, 0
	strh r0, [r3, 0x3A]
	ldrh r1, [r3, 0x22]
	strh r1, [r3, 0x3C]
	adds r0, r4
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	adds r1, r0
	strh r1, [r3, 0x22]
	strh r2, [r3, 0x24]
	strh r2, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	strh r2, [r3, 0x30]
	b _0813E5E4
_0813E554:
	ldrh r1, [r3, 0x30]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0813E57C
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _0813E578
	ldr r0, _0813E574 @ =0x0000ffff
	strh r0, [r3, 0x24]
	strh r2, [r3, 0x26]
	b _0813E57C
	.align 2, 0
_0813E574: .4byte 0x0000ffff
_0813E578:
	strh r0, [r3, 0x24]
	strh r0, [r3, 0x26]
_0813E57C:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _0813E5E4
_0813E582:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x3A]
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x3C]
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	b _0813E5E4
_0813E59E:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_0813E5B2:
	ldrh r2, [r3, 0x24]
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	movs r0, 0x38
	negs r0, r0
	cmp r1, r0
	ble _0813E5CC
	subs r0, r2, 0x4
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	adds r0, 0x3
	strh r0, [r3, 0x26]
	b _0813E5E4
_0813E5CC:
	ldrh r1, [r3, 0x20]
	adds r0, r2, r1
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_0813E5E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813E10C

	thumb_func_start sub_813E210
sub_813E210: @ 813E5EC
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0813E61C
	lsls r0, 2
	ldr r1, _0813E604 @ =_0813E608
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E604: .4byte _0813E608
	.align 2, 0
_0813E608:
	.4byte _0813E61C
	.4byte _0813E654
	.4byte _0813E682
	.4byte _0813E69E
	.4byte _0813E6B2
_0813E61C:
	ldrh r4, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	cmp r0, 0x37
	bgt _0813E634
	adds r0, r4, 0
	adds r0, 0x8
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	subs r0, 0x6
	strh r0, [r3, 0x26]
	b _0813E6E0
_0813E634:
	ldrh r0, [r3, 0x20]
	movs r2, 0
	strh r0, [r3, 0x3A]
	ldrh r1, [r3, 0x22]
	strh r1, [r3, 0x3C]
	adds r0, r4
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	adds r1, r0
	strh r1, [r3, 0x22]
	strh r2, [r3, 0x24]
	strh r2, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	strh r2, [r3, 0x30]
	b _0813E6E0
_0813E654:
	ldrh r1, [r3, 0x30]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0813E67C
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _0813E678
	strh r2, [r3, 0x24]
	ldr r0, _0813E674 @ =0x0000ffff
	b _0813E67A
	.align 2, 0
_0813E674: .4byte 0x0000ffff
_0813E678:
	strh r0, [r3, 0x24]
_0813E67A:
	strh r0, [r3, 0x26]
_0813E67C:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _0813E6E0
_0813E682:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x3A]
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x3C]
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	b _0813E6E0
_0813E69E:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_0813E6B2:
	ldrh r1, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	cmp r0, 0x37
	bgt _0813E6C8
	adds r0, r1, 0x4
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	subs r0, 0x3
	strh r0, [r3, 0x26]
	b _0813E6E0
_0813E6C8:
	ldrh r2, [r3, 0x20]
	adds r0, r1, r2
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_0813E6E0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813E210

	thumb_func_start sub_813E30C
sub_813E30C: @ 813E6E8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	bls _0813E6FE
	b _0813E888
_0813E6FE:
	lsls r0, 2
	ldr r1, _0813E708 @ =_0813E70C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E708: .4byte _0813E70C
	.align 2, 0
_0813E70C:
	.4byte _0813E888
	.4byte _0813E760
	.4byte _0813E7F8
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E784
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E888
	.4byte _0813E81C
_0813E760:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	movs r0, 0x24
	strh r0, [r4, 0x36]
_0813E784:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x90
	bgt _0813E7AE
	adds r0, r1, 0x4
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x18
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	strh r0, [r4, 0x32]
_0813E7AE:
	ldrh r0, [r4, 0x34]
	ldrh r2, [r4, 0x36]
	subs r0, r2
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E7CA
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813E7CA
	subs r0, r2, 0x1
	strh r0, [r4, 0x36]
_0813E7CA:
	ldr r2, _0813E7F4 @ =gSineTable
	ldrh r1, [r4, 0x34]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	ldrh r4, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r2
	ldrh r1, [r1]
	negs r3, r4
	lsls r3, 16
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x1
	adds r2, r4, 0
	bl SetOamMatrix
	b _0813E888
	.align 2, 0
_0813E7F4: .4byte gSineTable
_0813E7F8:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	movs r0, 0x24
	strh r0, [r4, 0x36]
_0813E81C:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x60
	bgt _0813E846
	adds r0, r1, 0x3
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x18
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	strh r0, [r4, 0x32]
_0813E846:
	ldrh r0, [r4, 0x34]
	ldrh r2, [r4, 0x36]
	subs r0, r2
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E862
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813E862
	subs r0, r2, 0x1
	strh r0, [r4, 0x36]
_0813E862:
	ldr r2, _0813E890 @ =gSineTable
	ldrh r1, [r4, 0x34]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	ldrh r4, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r2
	ldrh r1, [r1]
	negs r3, r4
	lsls r3, 16
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x2
	adds r2, r4, 0
	bl SetOamMatrix
_0813E888:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E890: .4byte gSineTable
	thumb_func_end sub_813E30C

	thumb_func_start sub_813E4B8
sub_813E4B8: @ 813E894
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E8B6
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	b _0813E8C0
_0813E8B6:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
_0813E8C0:
	strb r0, [r2]
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0x3F
	ble _0813E8D4
	adds r0, r5, 0
	bl DestroySprite
	b _0813E950
_0813E8D4:
	adds r0, r1, 0x2
	strh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 29
	lsrs r0, 24
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	bl Cos
	strh r0, [r5, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	lsls r0, 29
	lsrs r0, 24
	adds r1, r4, 0
	bl Sin
	strh r0, [r5, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0813E950
	ldrh r0, [r5, 0x34]
	ldrh r2, [r5, 0x30]
	subs r0, r2
	strh r0, [r5, 0x34]
	ldrh r1, [r5, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E92C
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813E92C
	subs r0, r2, 0x1
	strh r0, [r5, 0x30]
_0813E92C:
	ldr r3, _0813E958 @ =gSineTable
	ldrh r1, [r5, 0x34]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r3
	ldrh r2, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r3
	ldrh r1, [r1]
	negs r3, r2
	lsls r3, 16
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x10
	bl SetOamMatrix
_0813E950:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813E958: .4byte gSineTable
	thumb_func_end sub_813E4B8

	thumb_func_start sub_813E580
sub_813E580: @ 813E95C
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _0813E9B4 @ =gSprites
	lsls r6, r0, 16
	lsls r5, r1, 16
_0813E966:
	ldr r0, _0813E9B8 @ =gSpriteTemplate_840B0B0
	asrs r1, r6, 16
	asrs r2, r5, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrb r1, [r2, 0x1]
	movs r3, 0x4
	negs r3, r3
	adds r0, r3, 0
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	subs r3, 0x3B
	adds r0, r3, 0
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r2, 0x3]
	strh r4, [r2, 0x2E]
	movs r0, 0x20
	strh r0, [r2, 0x30]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0813E966
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E9B4: .4byte gSprites
_0813E9B8: .4byte gSpriteTemplate_840B0B0
	thumb_func_end sub_813E580

	thumb_func_start sub_813E5E0
sub_813E5E0: @ 813E9BC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0813E9D0 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E9D4
	adds r0, r3, 0
	bl DestroySprite
	b _0813EA8E
	.align 2, 0
_0813E9D0: .4byte gUnknown_0203931A
_0813E9D4:
	ldr r2, _0813EA94 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r4, r12
	ldrb r2, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r3, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	cmp r0, 0xB
	bgt _0813EA0C
	adds r0, r1, 0x1
	strh r0, [r3, 0x3C]
_0813EA0C:
	ldrh r0, [r3, 0x3A]
	adds r0, 0x4
	strh r0, [r3, 0x3A]
	ldr r4, _0813EA98 @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	muls r0, r1
	cmp r0, 0
	bge _0813EA2E
	adds r0, 0xFF
_0813EA2E:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	muls r0, r1
	cmp r0, 0
	bge _0813EA50
	adds r0, 0xFF
_0813EA50:
	asrs r0, 8
	ldrh r1, [r3, 0x38]
	adds r2, r0, r1
	strh r2, [r3, 0x22]
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813EA72
	adds r0, 0xFF
_0813EA72:
	asrs r0, 8
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x30]
	adds r0, 0x10
	strh r0, [r3, 0x30]
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x32
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _0813EA8E
	adds r0, r3, 0
	bl DestroySprite
_0813EA8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EA94: .4byte gSprites
_0813EA98: .4byte gSineTable
	thumb_func_end sub_813E5E0

	thumb_func_start sub_813E6C0
sub_813E6C0: @ 813EA9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _0813EABC @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EAC0
	adds r0, r4, 0
	bl DestroySprite
	b _0813EB84
	.align 2, 0
_0813EABC: .4byte gUnknown_0203931A
_0813EAC0:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r3, _0813EB94 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _0813EB84
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0813EB84
	ldrh r0, [r2, 0x20]
	ldrh r7, [r4, 0x30]
	adds r0, r7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldrh r0, [r2, 0x22]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	mov r8, r3
	ldr r2, [sp]
	lsls r2, 16
	mov r10, r2
	lsls r7, r6, 16
	mov r9, r7
_0813EB16:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0813EB98 @ =gSpriteTemplate_840B0DC
	mov r2, r10
	asrs r1, r2, 16
	mov r7, r9
	asrs r2, r7, 16
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813EB7A
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	add r3, r8
	ldrh r0, [r4, 0x2E]
	strh r0, [r3, 0x2E]
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 18
	movs r0, 0x7
	ands r1, r0
	lsls r1, 5
	lsls r0, r5, 2
	adds r0, r5
	lsls r2, r0, 4
	adds r0, r2
	adds r1, r0
	strh r1, [r3, 0x30]
	ldrh r0, [r4, 0x34]
	strh r0, [r3, 0x32]
	movs r0, 0x68
	strh r0, [r3, 0x34]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r3, 0x36]
	strh r6, [r3, 0x38]
	movs r1, 0
	strh r1, [r3, 0x3A]
_0813EB7A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0813EB16
_0813EB84:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB94: .4byte gSprites
_0813EB98: .4byte gSpriteTemplate_840B0DC
	thumb_func_end sub_813E6C0

	thumb_func_start sub_813E7C0
sub_813E7C0: @ 813EB9C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EBD4 @ =gSpriteTemplate_840B0F4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EBCE
	ldr r1, _0813EBD8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0
	strh r4, [r0, 0x2E]
	ldr r1, _0813EBDC @ =0x0000fff4
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	movs r1, 0x88
	strh r1, [r0, 0x34]
_0813EBCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EBD4: .4byte gSpriteTemplate_840B0F4
_0813EBD8: .4byte gSprites
_0813EBDC: .4byte 0x0000fff4
	thumb_func_end sub_813E7C0

	thumb_func_start sub_813E804
sub_813E804: @ 813EBE0
	push {r4-r7,lr}
	adds r3, r0, 0
	ldr r0, _0813EBF4 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EBF8
	adds r0, r3, 0
	bl DestroySprite
	b _0813ED04
	.align 2, 0
_0813EBF4: .4byte gUnknown_0203931A
_0813EBF8:
	ldr r6, _0813ECE0 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r7, r12
	ldrb r2, [r7]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0x27
	bgt _0813EC36
	adds r0, r1, 0x2
	strh r0, [r3, 0x34]
_0813EC36:
	movs r7, 0x2E
	ldrsh r1, [r3, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r2, r1, r0
	ldr r4, _0813ECE4 @ =gSineTable
	ldrh r5, [r3, 0x30]
	adds r0, r5, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x34
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r0, 0
	bge _0813EC66
	adds r0, 0xFF
_0813EC66:
	asrs r0, 8
	adds r0, r2, r0
	strh r0, [r3, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r2, r1, r0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x34
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r0, 0
	bge _0813EC9A
	ldr r1, _0813ECE8 @ =0x000001ff
	adds r0, r1
_0813EC9A:
	asrs r0, 9
	adds r0, r2, r0
	strh r0, [r3, 0x22]
	adds r1, r5, 0x2
	strh r1, [r3, 0x30]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r0, 0
	bge _0813ECB8
	adds r0, 0x1F
_0813ECB8:
	asrs r0, 5
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x32]
	adds r0, 0x8
	strh r0, [r3, 0x32]
	movs r0, 0xFF
	ands r1, r0
	cmp r1, 0x7F
	bgt _0813ECEC
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	b _0813ECFE
	.align 2, 0
_0813ECE0: .4byte gSprites
_0813ECE4: .4byte gSineTable
_0813ECE8: .4byte 0x000001ff
_0813ECEC:
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x43
	ldrb r0, [r0]
	adds r0, 0x1
_0813ECFE:
	adds r1, r3, 0
	adds r1, 0x43
	strb r0, [r1]
_0813ED04:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813E804

	thumb_func_start sub_813E930
sub_813E930: @ 813ED0C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r7, _0813ED54 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r7
_0813ED1E:
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r0, 0x22
	ldrsh r2, [r5, r0]
	ldr r0, _0813ED58 @ =gSpriteTemplate_840B124
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0813ED44
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r6, [r0, 0x2E]
	lsls r1, r4, 5
	strh r1, [r0, 0x30]
_0813ED44:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0813ED1E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813ED54: .4byte gSprites
_0813ED58: .4byte gSpriteTemplate_840B124
	thumb_func_end sub_813E930

	thumb_func_start GetCurrentTrainerHillMapId
GetCurrentTrainerHillMapId: @ 813ED5C
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _0813ED70 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813ED74
	adds r0, r3, 0
	bl DestroySprite
	b _0813EE2C
	.align 2, 0
_0813ED70: .4byte gUnknown_0203931A
_0813ED74:
	ldr r2, _0813EE34 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r5, r12
	ldrb r2, [r5]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r0, [r3, 0x3A]
	adds r4, r0, 0
	adds r4, 0x8
	strh r4, [r3, 0x3A]
	ldr r2, _0813EE38 @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r5, 0
	ldrsh r1, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r3, r5]
	muls r0, r1
	cmp r0, 0
	bge _0813EDC8
	adds r0, 0xFF
_0813EDC8:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r5, 0x3A
	ldrsh r0, [r3, r5]
	muls r0, r1
	cmp r0, 0
	bge _0813EDEA
	adds r0, 0xFF
_0813EDEA:
	asrs r0, 8
	ldrh r1, [r3, 0x38]
	adds r0, r1
	strh r0, [r3, 0x22]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0813EDFC
	adds r0, 0xF
_0813EDFC:
	asrs r0, 4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _0813EE08
	movs r0, 0x9
_0813EE08:
	adds r1, r0, 0
	adds r1, 0x12
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _0813EE2C
	adds r0, r3, 0
	bl DestroySprite
_0813EE2C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EE34: .4byte gSprites
_0813EE38: .4byte gSineTable
	thumb_func_end GetCurrentTrainerHillMapId

	thumb_func_start sub_813EA60
sub_813EA60: @ 813EE3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, _0813EE58 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EE5C
	adds r0, r5, 0
	bl DestroySprite
	b _0813EF0E
	.align 2, 0
_0813EE58: .4byte gUnknown_0203931A
_0813EE5C:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813EF1C @ =gSprites
	mov r9, r0
	movs r4, 0x2E
	ldrsh r1, [r5, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r3, r0, r1
	movs r4, 0x2E
	ldrsh r1, [r3, r4]
	cmp r1, 0x1
	bne _0813EF0E
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	lsls r0, r1, 16
	asrs r6, r0, 16
	cmp r6, 0
	bne _0813EF0E
	ldrh r1, [r3, 0x20]
	ldrh r0, [r5, 0x30]
	adds r1, r0
	lsls r1, 16
	ldrh r2, [r3, 0x22]
	ldrh r4, [r5, 0x32]
	adds r2, r4
	lsls r2, 16
	ldr r0, _0813EF20 @ =gSpriteTemplate_840B150
	lsrs r4, r1, 16
	mov r8, r4
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813EF0E
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x24
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrh r0, [r5, 0x2E]
	strh r0, [r4, 0x2E]
	ldr r2, _0813EF24 @ =gUnknown_0840B168
	ldrh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7
	ands r0, r1
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	strh r7, [r4, 0x38]
	strh r6, [r4, 0x3A]
_0813EF0E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EF1C: .4byte gSprites
_0813EF20: .4byte gSpriteTemplate_840B150
_0813EF24: .4byte gUnknown_0840B168
	thumb_func_end sub_813EA60

	thumb_func_start sub_813EB4C
sub_813EB4C: @ 813EF28
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EF8C @ =gSpriteTemplate_840B170
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EF5C
	ldr r1, _0813EF90 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r4, [r0, 0x2E]
	strh r1, [r0, 0x30]
	movs r1, 0x8
	strh r1, [r0, 0x32]
	movs r1, 0x18
	strh r1, [r0, 0x34]
_0813EF5C:
	movs r4, 0
	ldr r5, _0813EF94 @ =gUnknown_0840B188
_0813EF60:
	adds r0, r4, 0
	adds r0, 0x12
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0813EF60
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EF8C: .4byte gSpriteTemplate_840B170
_0813EF90: .4byte gSprites
_0813EF94: .4byte gUnknown_0840B188
	thumb_func_end sub_813EB4C

	thumb_func_start sub_813EBBC
sub_813EBBC: @ 813EF98
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0813EFAC @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EFB0
	adds r0, r3, 0
	bl DestroySprite
	b _0813F05C
	.align 2, 0
_0813EFAC: .4byte gUnknown_0203931A
_0813EFB0:
	ldr r2, _0813F064 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r4, r12
	ldrb r2, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r0, [r3, 0x3A]
	adds r0, 0x8
	strh r0, [r3, 0x3A]
	ldr r2, _0813F068 @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813F002
	adds r0, 0xFF
_0813F002:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r4, 0x34
	ldrsh r0, [r3, r4]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813F024
	adds r0, 0xFF
_0813F024:
	asrs r0, 8
	ldrh r4, [r3, 0x38]
	adds r1, r0, r4
	strh r1, [r3, 0x22]
	movs r4, 0x30
	ldrsh r0, [r3, r4]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _0813F040
	adds r0, 0x3F
_0813F040:
	asrs r0, 6
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x30]
	adds r0, 0x10
	strh r0, [r3, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	movs r4, 0x32
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _0813F05C
	adds r0, r3, 0
	bl DestroySprite
_0813F05C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F064: .4byte gSprites
_0813F068: .4byte gSineTable
	thumb_func_end sub_813EBBC

	thumb_func_start sub_813EC90
sub_813EC90: @ 813F06C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, _0813F088 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813F08C
	adds r0, r5, 0
	bl DestroySprite
	b _0813F17C
	.align 2, 0
_0813F088: .4byte gUnknown_0203931A
_0813F08C:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813F18C @ =gSprites
	mov r9, r0
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r4, r9
	adds r3, r0, r4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	bne _0813F150
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	lsls r0, r1, 16
	asrs r6, r0, 16
	cmp r6, 0
	bne _0813F142
	ldrh r1, [r3, 0x20]
	ldrh r2, [r5, 0x30]
	adds r1, r2
	lsls r1, 16
	ldrh r2, [r3, 0x22]
	ldrh r4, [r5, 0x32]
	adds r2, r4
	lsls r2, 16
	ldr r0, _0813F190 @ =gSpriteTemplate_840B1B0
	lsrs r4, r1, 16
	mov r8, r4
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813F142
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x22
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrh r0, [r5, 0x2E]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 18
	movs r1, 0x7
	ands r0, r1
	lsls r0, 5
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x34]
	strh r0, [r4, 0x32]
	movs r0, 0xE8
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	strh r7, [r4, 0x38]
	strh r6, [r4, 0x3A]
_0813F142:
	ldrh r1, [r5, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r5, r2]
	cmp r0, 0x6F
	bgt _0813F150
	adds r0, r1, 0x4
	strh r0, [r5, 0x3A]
_0813F150:
	ldr r1, _0813F194 @ =gSineTable
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	movs r4, 0
	ldrsh r0, [r0, r4]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x11
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813F17C:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F18C: .4byte gSprites
_0813F190: .4byte gSpriteTemplate_840B1B0
_0813F194: .4byte gSineTable
	thumb_func_end sub_813EC90

	thumb_func_start sub_813EDBC
sub_813EDBC: @ 813F198
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813F1D0 @ =gSpriteTemplate_840B1C8
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813F1CA
	ldr r1, _0813F1D4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r4, [r0, 0x2E]
	strh r1, [r0, 0x30]
	movs r1, 0xC
	strh r1, [r0, 0x32]
	movs r1, 0x18
	strh r1, [r0, 0x34]
_0813F1CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F1D0: .4byte gSpriteTemplate_840B1C8
_0813F1D4: .4byte gSprites
	thumb_func_end sub_813EDBC

	thumb_func_start sub_813EDFC
sub_813EDFC: @ 813F1D8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0813F1EE
	adds r4, r5, 0
	adds r4, 0x3E
	cmp r0, 0x1
	beq _0813F226
_0813F1EE:
	adds r4, r5, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x24
	orrs r0, r1
	strb r0, [r5, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	strh r0, [r5, 0x2E]
_0813F226:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813F23E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	b _0813F256
_0813F23E:
	ldrb r0, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	ldrh r1, [r5, 0x30]
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	cmp r0, 0x3F
	bgt _0813F256
	adds r0, r1, 0x1
	strh r0, [r5, 0x30]
_0813F256:
	ldr r1, _0813F28C @ =gSineTable
	ldrh r0, [r5, 0x30]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x12
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813F28C: .4byte gSineTable
	thumb_func_end sub_813EDFC

	thumb_func_start FieldInitRegionMap
FieldInitRegionMap: @ 813F290
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl SetVBlankCallback
	ldr r2, _0813F2B4 @ =0x02000000
	ldr r0, _0813F2B8 @ =0x00000888
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	str r4, [r2]
	ldr r0, _0813F2BC @ =CB2_FieldInitRegionMap
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F2B4: .4byte 0x02000000
_0813F2B8: .4byte 0x00000888
_0813F2BC: .4byte CB2_FieldInitRegionMap
	thumb_func_end FieldInitRegionMap

	thumb_func_start CB2_FieldInitRegionMap
CB2_FieldInitRegionMap: @ 813F2C0
	push {r4,lr}
	sub sp, 0x4
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
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0813F374 @ =0x02000008
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0
	movs r1, 0
	bl sub_80FBCF0
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBB3C
	ldr r4, _0813F378 @ =gWindowConfig_81E709C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r1, _0813F37C @ =0x04000008
	movs r2, 0xF8
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x15
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813F380 @ =gOtherText_Hoenn
	movs r1, 0x16
	movs r2, 0x1
	movs r3, 0x38
	bl sub_8072BD8
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	bl sub_813F0C8
	ldr r0, _0813F384 @ =CB2_FieldRegionMap
	bl SetMainCallback2
	ldr r0, _0813F388 @ =VBlankCB_FieldRegionMap
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F374: .4byte 0x02000008
_0813F378: .4byte gWindowConfig_81E709C
_0813F37C: .4byte 0x04000008
_0813F380: .4byte gOtherText_Hoenn
_0813F384: .4byte CB2_FieldRegionMap
_0813F388: .4byte VBlankCB_FieldRegionMap
	thumb_func_end CB2_FieldInitRegionMap

	thumb_func_start VBlankCB_FieldRegionMap
VBlankCB_FieldRegionMap: @ 813F38C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_FieldRegionMap

	thumb_func_start CB2_FieldRegionMap
CB2_FieldRegionMap: @ 813F3A0
	push {lr}
	bl sub_813EFDC
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_FieldRegionMap

	thumb_func_start sub_813EFDC
sub_813EFDC: @ 813F3B8
	push {lr}
	sub sp, 0x4
	ldr r1, _0813F3D4 @ =0x02000000
	ldr r2, _0813F3D8 @ =0x00000888
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0813F494
	lsls r0, 2
	ldr r1, _0813F3DC @ =_0813F3E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813F3D4: .4byte 0x02000000
_0813F3D8: .4byte 0x00000888
_0813F3DC: .4byte _0813F3E0
	.align 2, 0
_0813F3E0:
	.4byte _0813F3F4
	.4byte _0813F40C
	.4byte _0813F428
	.4byte _0813F454
	.4byte _0813F47C
_0813F3F4:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0813F404 @ =0x00001541
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0813F408 @ =0x00000888
	adds r1, r2, r0
	b _0813F46A
	.align 2, 0
_0813F404: .4byte 0x00001541
_0813F408: .4byte 0x00000888
_0813F40C:
	ldr r0, _0813F420 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813F494
	ldr r3, _0813F424 @ =0x00000888
	adds r1, r2, r3
	b _0813F46A
	.align 2, 0
_0813F420: .4byte gPaletteFade
_0813F424: .4byte 0x00000888
_0813F428:
	bl sub_80FAB60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0813F43A
	bl sub_813F0C8
	b _0813F494
_0813F43A:
	cmp r0, 0x3
	blt _0813F494
	cmp r0, 0x5
	bgt _0813F494
	ldr r1, _0813F44C @ =0x02000000
	ldr r0, _0813F450 @ =0x00000888
	adds r1, r0
	b _0813F46A
	.align 2, 0
_0813F44C: .4byte 0x02000000
_0813F450: .4byte 0x00000888
_0813F454:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813F474 @ =0x02000000
	ldr r2, _0813F478 @ =0x00000888
	adds r1, r2
_0813F46A:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0813F494
	.align 2, 0
_0813F474: .4byte 0x02000000
_0813F478: .4byte 0x00000888
_0813F47C:
	ldr r0, _0813F49C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813F494
	bl sub_80FAB10
	ldr r0, _0813F4A0 @ =0x02000000
	ldr r0, [r0]
	bl SetMainCallback2
_0813F494:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813F49C: .4byte gPaletteFade
_0813F4A0: .4byte 0x02000000
	thumb_func_end sub_813EFDC

	thumb_func_start sub_813F0C8
sub_813F0C8: @ 813F4A4
	push {lr}
	movs r0, 0x11
	movs r1, 0x11
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	ldr r1, _0813F4CC @ =0x02000000
	ldrb r0, [r1, 0x1E]
	cmp r0, 0
	beq _0813F4C6
	adds r0, r1, 0
	adds r0, 0x8
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
_0813F4C6:
	pop {r0}
	bx r0
	.align 2, 0
_0813F4CC: .4byte 0x02000000
	thumb_func_end sub_813F0C8

	thumb_func_start unref_sub_813F0F4
unref_sub_813F0F4: @ 813F4D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	ldr r0, _0813F688 @ =gUnknown_0202F7C8
	ldrb r3, [r0]
	ldr r0, _0813F68C @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0813F690 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r1, _0813F694 @ =0x04000048
	ldr r2, _0813F698 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r4, _0813F69C @ =0x00003f3d
	adds r0, r4, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0813F6A0 @ =0x04000050
	ldr r2, _0813F6A4 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r4, 0x80
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	ldr r2, _0813F6A8 @ =0x0400000a
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	mov r9, r0
	ands r0, r1
	movs r1, 0x4
	mov r8, r1
	mov r4, r8
	orrs r0, r4
	strb r0, [r2]
	ldr r0, _0813F6AC @ =gUnknown_03004340
	adds r3, r0
	ldrb r0, [r3]
	ldr r1, _0813F6B0 @ =gSprites
	mov r10, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r7, [r4, 0x6]
	ldrh r6, [r4, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0813F6B4 @ =SpriteCallbackDummy
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r0, _0813F6B4 @ =SpriteCallbackDummy
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	ldrb r1, [r4, 0x5]
	mov r0, r9
	ands r0, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r5, r7, 4
	adds r5, r7
	lsls r5, 2
	add r5, r10
	ldrb r1, [r5, 0x5]
	mov r0, r9
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x5]
	mov r0, r9
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [sp, 0x14]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	mov r1, r10
	adds r7, r6, r1
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x44
	bl memcpy
	ldr r2, [sp, 0x18]
	lsls r4, r2, 4
	adds r4, r2
	lsls r4, 2
	adds r0, r4, 0
	add r0, r10
	mov r8, r0
	adds r1, r5, 0
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r7, 0x1]
	mov r0, r9
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x1]
	mov r2, r8
	ldrb r0, [r2, 0x1]
	mov r2, r9
	ands r2, r0
	orrs r2, r1
	mov r0, r8
	strb r2, [r0, 0x1]
	movs r1, 0x1C
	add r10, r1
	add r6, r10
	ldr r2, _0813F6B4 @ =SpriteCallbackDummy
	str r2, [r6]
	add r4, r10
	str r2, [r4]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _0813F6B8 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0813F6BC @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0813F6C0 @ =gUnknown_08D2EE48
	bl LZDecompressVram
	ldr r0, _0813F6C4 @ =gUnknown_08D2EDFC
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0813F6C8 @ =gUnknown_08D2E150
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0813F6CC @ =gUnknown_030042C0
	ldrh r0, [r7, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r1]
	ldr r1, _0813F6D0 @ =gUnknown_030041B4
	ldrh r0, [r7, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1]
	ldr r1, _0813F6D4 @ =gTasks
	ldr r4, [sp, 0x10]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA0
	lsls r1, 2
	strh r1, [r0, 0xA]
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0, 0x8]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0xC]
	ldr r1, _0813F6D8 @ =sub_813F300
	str r1, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F688: .4byte gUnknown_0202F7C8
_0813F68C: .4byte gUnknown_030042C4
_0813F690: .4byte gUnknown_03004240
_0813F694: .4byte 0x04000048
_0813F698: .4byte 0x00003f3f
_0813F69C: .4byte 0x00003f3d
_0813F6A0: .4byte 0x04000050
_0813F6A4: .4byte 0x00003f42
_0813F6A8: .4byte 0x0400000a
_0813F6AC: .4byte gUnknown_03004340
_0813F6B0: .4byte gSprites
_0813F6B4: .4byte SpriteCallbackDummy
_0813F6B8: .4byte 0x040000d4
_0813F6BC: .4byte 0x85000400
_0813F6C0: .4byte gUnknown_08D2EE48
_0813F6C4: .4byte gUnknown_08D2EDFC
_0813F6C8: .4byte gUnknown_08D2E150
_0813F6CC: .4byte gUnknown_030042C0
_0813F6D0: .4byte gUnknown_030041B4
_0813F6D4: .4byte gTasks
_0813F6D8: .4byte sub_813F300
	thumb_func_end unref_sub_813F0F4

	thumb_func_start sub_813F300
sub_813F300: @ 813F6DC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813F728 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, _0813F72C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	movs r3, 0
	strh r1, [r4, 0x22]
	ldr r2, _0813F730 @ =gUnknown_030041B4
	lsls r0, r1, 16
	lsrs r0, 24
	ldrh r5, [r2]
	adds r0, r5
	strh r0, [r2]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x22]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813F770
	cmp r0, 0x1
	bgt _0813F734
	cmp r0, 0
	beq _0813F73A
	b _0813F88E
	.align 2, 0
_0813F728: .4byte gUnknown_0202F7C8
_0813F72C: .4byte gTasks
_0813F730: .4byte gUnknown_030041B4
_0813F734:
	cmp r0, 0x2
	beq _0813F788
	b _0813F88E
_0813F73A:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _0813F74A
	b _0813F88E
_0813F74A:
	strh r3, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	adds r1, 0x1
	strh r1, [r4, 0x20]
	ldr r2, _0813F76C @ =0x04000052
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	beq _0813F768
	b _0813F88E
_0813F768:
	b _0813F780
	.align 2, 0
_0813F76C: .4byte 0x04000052
_0813F770:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	beq _0813F780
	b _0813F88E
_0813F780:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _0813F88E
_0813F788:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0813F88E
	strh r3, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	subs r1, 0x1
	strh r1, [r4, 0x20]
	ldr r6, _0813F89C @ =0x04000052
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r6]
	movs r3, 0x20
	ldrsh r5, [r4, r3]
	cmp r5, 0
	bne _0813F88E
	movs r0, 0
	bl sub_8076464
	ldr r0, _0813F8A0 @ =gUnknown_030042C4
	strh r5, [r0]
	ldr r0, _0813F8A4 @ =gUnknown_03004240
	strh r5, [r0]
	ldr r0, _0813F8A8 @ =0x04000048
	ldr r2, _0813F8AC @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0813F7E2
	ldr r2, _0813F8B0 @ =0x0400000a
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0813F7E2:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _0813F8B4 @ =0x04000050
	strh r5, [r0]
	strh r5, [r6]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813F8B8 @ =gSprites
	mov r8, r1
	add r0, r8
	bl DestroySprite
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	bl DestroySprite
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r1, _0813F8BC @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0813F8C0 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r2, _0813F8B0 @ =0x0400000a
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _0813F8C4 @ =gUnknown_03004340
	add r0, r9
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r6, [r1, 0x6]
	ldrh r4, [r1, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r5, 0x4
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r8
	ldrb r3, [r1, 0x5]
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	add r0, r8
	ldrb r1, [r0, 0x5]
	ands r2, r1
	orrs r2, r5
	strb r2, [r0, 0x5]
	adds r0, r7, 0
	bl move_anim_task_del
_0813F88E:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F89C: .4byte 0x04000052
_0813F8A0: .4byte gUnknown_030042C4
_0813F8A4: .4byte gUnknown_03004240
_0813F8A8: .4byte 0x04000048
_0813F8AC: .4byte 0x00003f3f
_0813F8B0: .4byte 0x0400000a
_0813F8B4: .4byte 0x04000050
_0813F8B8: .4byte gSprites
_0813F8BC: .4byte 0x040000d4
_0813F8C0: .4byte 0x85000200
_0813F8C4: .4byte gUnknown_03004340
	thumb_func_end sub_813F300

	thumb_func_start sub_813F4EC
sub_813F4EC: @ 813F8C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r1, _0813F9AC @ =gUnknown_03004340
	ldr r0, _0813F9B0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	ldr r7, _0813F9B4 @ =gSprites
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r7
	ldrb r0, [r6, 0x6]
	str r0, [sp, 0x4]
	ldrh r4, [r6, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F9B8 @ =0x0000d709
	bl AllocSpritePalette
	mov r8, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _0813F9BC @ =0x0000d70a
	bl AllocSpritePalette
	mov r9, r0
	mov r2, r9
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	ldrb r0, [r6, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r1, 0x80
	lsls r1, 1
	adds r3, r1, 0
	orrs r0, r3
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r7
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	orrs r4, r3
	lsls r0, 1
	ldr r2, _0813F9C0 @ =gPlttBufferUnfaded
	mov r10, r2
	add r0, r10
	mov r1, r8
	lsls r1, 4
	mov r8, r1
	adds r1, r3, r1
	movs r2, 0x20
	str r3, [sp, 0x8]
	bl LoadPalette
	lsls r4, 1
	add r4, r10
	mov r2, r9
	lsls r2, 4
	mov r9, r2
	ldr r3, [sp, 0x8]
	add r3, r9
	adds r0, r4, 0
	adds r1, r3, 0
	movs r2, 0x20
	bl LoadPalette
	ldrb r1, [r6, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r6, 0x5]
	ldr r0, [sp, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r3, [r1, 0x5]
	adds r0, r2, 0
	ands r0, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5, 0x5]
	ands r2, r0
	mov r0, r9
	orrs r2, r0
	strb r2, [r5, 0x5]
	ldr r0, [sp]
	bl move_anim_task_del
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F9AC: .4byte gUnknown_03004340
_0813F9B0: .4byte gUnknown_0202F7C8
_0813F9B4: .4byte gSprites
_0813F9B8: .4byte 0x0000d709
_0813F9BC: .4byte 0x0000d70a
_0813F9C0: .4byte gPlttBufferUnfaded
	thumb_func_end sub_813F4EC

	thumb_func_start sub_813F5E8
sub_813F5E8: @ 813F9C4
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0813FA60 @ =gUnknown_03004340
	ldr r0, _0813FA64 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0813FA68 @ =gSprites
	mov r9, r1
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	add r5, r9
	ldrb r0, [r5, 0x6]
	mov r10, r0
	ldrh r6, [r5, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0813FA6C @ =0x0000d709
	bl FreeSpritePaletteByTag
	ldr r0, _0813FA70 @ =0x0000d70a
	bl FreeSpritePaletteByTag
	ldr r0, _0813FA74 @ =0x0000d6ff
	bl IndexOfSpritePaletteTag
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813FA78 @ =0x0000d704
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsls r4, 4
	ldrb r2, [r5, 0x5]
	movs r3, 0xF
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r4
	strb r1, [r5, 0x5]
	mov r1, r10
	lsls r2, r1, 4
	add r2, r10
	lsls r2, 2
	add r2, r9
	ldrb r5, [r2, 0x5]
	adds r1, r3, 0
	ands r1, r5
	orrs r1, r4
	strb r1, [r2, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r9
	lsrs r0, 20
	ldrb r2, [r1, 0x5]
	ands r3, r2
	orrs r3, r0
	strb r3, [r1, 0x5]
	mov r0, r8
	bl move_anim_task_del
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FA60: .4byte gUnknown_03004340
_0813FA64: .4byte gUnknown_0202F7C8
_0813FA68: .4byte gSprites
_0813FA6C: .4byte 0x0000d709
_0813FA70: .4byte 0x0000d70a
_0813FA74: .4byte 0x0000d6ff
_0813FA78: .4byte 0x0000d704
	thumb_func_end sub_813F5E8

	thumb_func_start sub_813F6A0
sub_813F6A0: @ 813FA7C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813FA9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0813FAA0 @ =gUnknown_03004B00
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x1E]
	ldr r0, _0813FAA4 @ =sub_813F6CC
	str r0, [r1]
	bx lr
	.align 2, 0
_0813FA9C: .4byte gTasks
_0813FAA0: .4byte gUnknown_03004B00
_0813FAA4: .4byte sub_813F6CC
	thumb_func_end sub_813F6A0

	thumb_func_start sub_813F6CC
sub_813F6CC: @ 813FAA8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813FAF4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r6, 0
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0813FB68
	strh r6, [r4, 0x8]
	ldr r0, _0813FAF8 @ =0x0000d709
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0x1C
	ldrsh r0, [r4, r3]
	movs r1, 0x2
	cmp r0, 0
	bne _0813FAE6
	movs r1, 0x6
_0813FAE6:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0813FAFC
	cmp r0, 0x1
	beq _0813FB38
	b _0813FB68
	.align 2, 0
_0813FAF4: .4byte gTasks
_0813FAF8: .4byte 0x0000d709
_0813FAFC:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0813FB0E
	movs r0, 0x10
	strh r0, [r4, 0xC]
_0813FB0E:
	lsls r0, r2, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	orrs r0, r1
	ldrb r2, [r4, 0xC]
	ldr r3, _0813FB34 @ =0x00007f74
	movs r1, 0x1
	bl BlendPalette
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bne _0813FB68
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _0813FB68
	.align 2, 0
_0813FB34: .4byte 0x00007f74
_0813FB38:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bge _0813FB46
	strh r6, [r4, 0xC]
_0813FB46:
	lsls r0, r2, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	orrs r0, r1
	ldrb r2, [r4, 0xC]
	ldr r3, _0813FB70 @ =0x00007f74
	movs r1, 0x1
	bl BlendPalette
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _0813FB68
	adds r0, r5, 0
	bl move_anim_task_del
_0813FB68:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FB70: .4byte 0x00007f74
	thumb_func_end sub_813F6CC

	thumb_func_start sub_813F798
sub_813F798: @ 813FB74
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0813FBA0 @ =gUnknown_02024BE0
	ldr r0, _0813FBA4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r5, [r0]
	ldr r1, _0813FBA8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813FBC2
	cmp r0, 0x1
	bgt _0813FBAC
	cmp r0, 0
	beq _0813FBB2
	b _0813FC14
	.align 2, 0
_0813FBA0: .4byte gUnknown_02024BE0
_0813FBA4: .4byte gUnknown_0202F7C8
_0813FBA8: .4byte gTasks
_0813FBAC:
	cmp r0, 0x2
	beq _0813FBF4
	b _0813FC14
_0813FBB2:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x1C]
	b _0813FBE6
_0813FBC2:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x30
	strh r0, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	adds r0, r5, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8079A64
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	ldr r0, _0813FBF0 @ =0x000002cf
	cmp r1, r0
	ble _0813FC14
_0813FBE6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0813FC14
	.align 2, 0
_0813FBF0: .4byte 0x000002cf
_0813FBF4:
	adds r0, r5, 0
	bl sub_8078F40
	ldr r1, _0813FC1C @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, 0
	bl move_anim_task_del
_0813FC14:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FC1C: .4byte gSprites
	thumb_func_end sub_813F798

	thumb_func_start sub_813F844
sub_813F844: @ 813FC20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813FC58 @ =gUnknown_02024BE0
	ldr r4, _0813FC5C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r1, [r1]
	mov r9, r1
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0813FC68
	ldr r1, _0813FC60 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813FC64 @ =gPlayerParty
	b _0813FC78
	.align 2, 0
_0813FC58: .4byte gUnknown_02024BE0
_0813FC5C: .4byte gUnknown_0202F7C8
_0813FC60: .4byte gUnknown_02024A6A
_0813FC64: .4byte gPlayerParty
_0813FC68:
	ldr r1, _0813FCA8 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813FCAC @ =gEnemyParty
_0813FC78:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _0813FCB0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r6, r0, r2
	movs r0, 0x8
	ldrsh r7, [r6, r0]
	cmp r7, 0
	beq _0813FCB4
	cmp r7, 0x1
	beq _0813FD34
	b _0813FD5E
	.align 2, 0
_0813FCA8: .4byte gUnknown_02024A6A
_0813FCAC: .4byte gEnemyParty
_0813FCB0: .4byte gTasks
_0813FCB4:
	ldr r5, _0813FD2C @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	adds r1, r0, 0
	lsls r1, 24
	ldr r2, _0813FD30 @ =gSprites
	mov r3, r9
	lsls r0, r3, 4
	add r0, r9
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r0, 0x43
	ldrb r3, [r0]
	movs r0, 0x80
	lsls r0, 22
	adds r1, r0
	lsrs r1, 24
	mov r0, r8
	str r0, [sp]
	adds r0, r4, 0
	bl sub_814086C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1C]
	str r7, [sp]
	str r7, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r2, r0, 0
	ldrb r1, [r5]
	movs r0, 0
	mov r3, r8
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _0813FD5E
	.align 2, 0
_0813FD2C: .4byte gUnknown_0202F7C8
_0813FD30: .4byte gSprites
_0813FD34:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _0813FD5E
	movs r3, 0x1E
	ldrsh r0, [r6, r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _0813FD5E
	adds r0, r5, 0
	bl move_anim_task_del
_0813FD5E:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813F844

	thumb_func_start sub_813F990
sub_813F990: @ 813FD6C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813FD90 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r0, 24
	bl sub_80478DC
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FD90: .4byte gUnknown_02024C04
	thumb_func_end sub_813F990

	thumb_func_start sub_813F9B8
sub_813F9B8: @ 813FD94
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813FDB8 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r0, 24
	bl sub_804794C
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FDB8: .4byte gUnknown_02024C04
	thumb_func_end sub_813F9B8

	thumb_func_start sub_813F9E0
sub_813F9E0: @ 813FDBC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813FDD0 @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _0813FDDC
	ldr r1, _0813FDD4 @ =gUnknown_03004B00
	ldr r0, _0813FDD8 @ =0x0000ffff
	b _0813FDE0
	.align 2, 0
_0813FDD0: .4byte 0x02017840
_0813FDD4: .4byte gUnknown_03004B00
_0813FDD8: .4byte 0x0000ffff
_0813FDDC:
	ldr r1, _0813FDEC @ =gUnknown_03004B00
	movs r0, 0
_0813FDE0:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0813FDEC: .4byte gUnknown_03004B00
	thumb_func_end sub_813F9E0

	thumb_func_start ball_number_to_ball_processing_index
ball_number_to_ball_processing_index: @ 813FDF0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	subs r0, 0x1
	cmp r0, 0xB
	bhi _0813FE68
	lsls r0, 2
	ldr r1, _0813FE08 @ =_0813FE0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813FE08: .4byte _0813FE0C
	.align 2, 0
_0813FE0C:
	.4byte _0813FE3C
	.4byte _0813FE40
	.4byte _0813FE44
	.4byte _0813FE68
	.4byte _0813FE48
	.4byte _0813FE4C
	.4byte _0813FE50
	.4byte _0813FE54
	.4byte _0813FE58
	.4byte _0813FE5C
	.4byte _0813FE60
	.4byte _0813FE64
_0813FE3C:
	movs r0, 0x4
	b _0813FE6A
_0813FE40:
	movs r0, 0x3
	b _0813FE6A
_0813FE44:
	movs r0, 0x1
	b _0813FE6A
_0813FE48:
	movs r0, 0x2
	b _0813FE6A
_0813FE4C:
	movs r0, 0x5
	b _0813FE6A
_0813FE50:
	movs r0, 0x6
	b _0813FE6A
_0813FE54:
	movs r0, 0x7
	b _0813FE6A
_0813FE58:
	movs r0, 0x8
	b _0813FE6A
_0813FE5C:
	movs r0, 0x9
	b _0813FE6A
_0813FE60:
	movs r0, 0xA
	b _0813FE6A
_0813FE64:
	movs r0, 0xB
	b _0813FE6A
_0813FE68:
	movs r0, 0
_0813FE6A:
	pop {r1}
	bx r1
	thumb_func_end ball_number_to_ball_processing_index

	thumb_func_start sub_813FA94
sub_813FA94: @ 813FE70
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0813FF34 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _0813FF38 @ =gSpriteTemplate_820AAB4
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0813FF3C @ =gSprites
	mov r9, r1
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r1
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r2, _0813FF40 @ =gUnknown_0202F7C9
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	mov r0, r9
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _0813FF44 @ =sub_813FD90
	str r0, [r4]
	ldr r3, _0813FF48 @ =0x02017840
	ldr r1, _0813FF4C @ =gUnknown_02024BE0
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	lsls r1, 1
	ldrb r2, [r3, 0x9]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x9]
	ldr r1, _0813FF50 @ =gTasks
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _0813FF54 @ =sub_813FB7C
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FF34: .4byte gUnknown_02024C04
_0813FF38: .4byte gSpriteTemplate_820AAB4
_0813FF3C: .4byte gSprites
_0813FF40: .4byte gUnknown_0202F7C9
_0813FF44: .4byte sub_813FD90
_0813FF48: .4byte 0x02017840
_0813FF4C: .4byte gUnknown_02024BE0
_0813FF50: .4byte gTasks
_0813FF54: .4byte sub_813FB7C
	thumb_func_end sub_813FA94

	thumb_func_start sub_813FB7C
sub_813FB7C: @ 813FF58
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813FF88 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	ldr r2, _0813FF8C @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	ldr r0, _0813FF90 @ =0x0000ffff
	cmp r1, r0
	bne _0813FF82
	adds r0, r3, 0
	bl move_anim_task_del
_0813FF82:
	pop {r0}
	bx r0
	.align 2, 0
_0813FF88: .4byte gTasks
_0813FF8C: .4byte gSprites
_0813FF90: .4byte 0x0000ffff
	thumb_func_end sub_813FB7C

	thumb_func_start sub_813FBB8
sub_813FBB8: @ 813FF94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813FFB4 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0813FFB8
	movs r6, 0x20
	movs r5, 0xB
	b _0813FFBC
	.align 2, 0
_0813FFB4: .4byte gUnknown_020239F8
_0813FFB8:
	movs r6, 0x17
	movs r5, 0x5
_0813FFBC:
	ldr r0, _08140078 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079E90
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814007C @ =gSpriteTemplate_820AAB4
	adds r0, r1
	adds r1, r6, 0
	adds r1, 0x20
	movs r2, 0x50
	orrs r5, r2
	adds r2, r5, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08140080 @ =gSprites
	mov r9, r0
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r0
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r1, _08140084 @ =gUnknown_0202F7C9
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	mov r0, r9
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _08140088 @ =SpriteCallbackDummy
	str r0, [r4]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _0814008C @ =gUnknown_02024BE0
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, _08140090 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _08140094 @ =sub_813FCBC
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140078: .4byte gUnknown_02024C04
_0814007C: .4byte gSpriteTemplate_820AAB4
_08140080: .4byte gSprites
_08140084: .4byte gUnknown_0202F7C9
_08140088: .4byte SpriteCallbackDummy
_0814008C: .4byte gUnknown_02024BE0
_08140090: .4byte gTasks
_08140094: .4byte sub_813FCBC
	thumb_func_end sub_813FBB8

	thumb_func_start sub_813FCBC
sub_813FCBC: @ 8140098
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _081400F8 @ =gSprites
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _081400FC @ =gUnknown_02024BE0
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081400F2
	movs r0, 0x3D
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r0, _08140100 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08140104 @ =sub_813FD90
	str r1, [r0]
	ldr r0, _08140108 @ =sub_813FD34
	movs r1, 0xA
	bl CreateTask
	ldr r0, _0814010C @ =sub_813FB7C
	str r0, [r4]
_081400F2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081400F8: .4byte gSprites
_081400FC: .4byte gUnknown_02024BE0
_08140100: .4byte gTasks
_08140104: .4byte sub_813FD90
_08140108: .4byte sub_813FD34
_0814010C: .4byte sub_813FB7C
	thumb_func_end sub_813FCBC

	thumb_func_start sub_813FD34
sub_813FD34: @ 8140110
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08140164 @ =gSprites
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _08140168 @ =gUnknown_02024BE0
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0814015C
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl DestroyTask
_0814015C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08140164: .4byte gSprites
_08140168: .4byte gUnknown_02024BE0
	thumb_func_end sub_813FD34

	thumb_func_start sub_813FD90
sub_813FD90: @ 814016C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x32]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r0, _08140194 @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _08140198 @ =sub_813FDC0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140194: .4byte 0x0000ffd8
_08140198: .4byte sub_813FDC0
	thumb_func_end sub_813FD90

	thumb_func_start sub_813FDC0
sub_813FDC0: @ 814019C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _08140236
	ldr r0, _081401BC @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _081401C4
	ldr r0, _081401C0 @ =sub_81407B8
	str r0, [r4, 0x1C]
	b _08140236
	.align 2, 0
_081401BC: .4byte 0x02017840
_081401C0: .4byte sub_81407B8
_081401C4:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r1, r4, 0
	adds r1, 0x2E
	movs r2, 0
	adds r0, r4, 0
	adds r0, 0x3C
_081401EC:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _081401EC
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _08140240 @ =sub_813FE70
	str r0, [r4, 0x1C]
	ldr r0, _08140244 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _08140236
	cmp r5, 0
	blt _08140236
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldr r0, _08140248 @ =gUnknown_0202F7C9
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_08140236:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140240: .4byte sub_813FE70
_08140244: .4byte gUnknown_02024C04
_08140248: .4byte gUnknown_0202F7C9
	thumb_func_end sub_813FDC0

	thumb_func_start sub_813FE70
sub_813FE70: @ 814024C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08140288
	ldr r0, _08140290 @ =TaskDummy
	movs r1, 0x32
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _08140294 @ =sub_813FEC8
	str r0, [r4, 0x1C]
	ldr r2, _08140298 @ =gSprites
	ldr r1, _0814029C @ =gUnknown_02024BE0
	ldr r0, _081402A0 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
_08140288:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140290: .4byte TaskDummy
_08140294: .4byte sub_813FEC8
_08140298: .4byte gSprites
_0814029C: .4byte gUnknown_02024BE0
_081402A0: .4byte gUnknown_0202F7C9
	thumb_func_end sub_813FE70

	thumb_func_start sub_813FEC8
sub_813FEC8: @ 81402A4
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r1, _081402E8 @ =gUnknown_02024BE0
	ldr r0, _081402EC @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r0, r1
	ldrb r4, [r0]
	ldrh r0, [r7, 0x38]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _081402F0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _081402D6
	movs r0, 0x3C
	bl PlaySE
_081402D6:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0814034C
	cmp r0, 0x1
	bgt _081402F4
	cmp r0, 0
	beq _081402FA
	b _081403B8
	.align 2, 0
_081402E8: .4byte gUnknown_02024BE0
_081402EC: .4byte gUnknown_0202F7C9
_081402F0: .4byte gTasks
_081402F4:
	cmp r0, 0x2
	beq _08140390
	b _081403B8
_081402FA:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x1C]
	ldr r1, _0814033C @ =gUnknown_03005F0C
	movs r0, 0x1C
	str r0, [r1]
	ldr r2, _08140340 @ =gUnknown_03005F14
	ldr r1, _08140344 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	ldrh r0, [r7, 0x26]
	ldrh r7, [r7, 0x22]
	adds r0, r7
	subs r1, r0
	strh r1, [r2]
	ldr r4, _08140348 @ =gUnknown_03005F10
	ldrh r0, [r2]
	lsls r0, 8
	movs r1, 0x1C
	bl __udivsi3
	strh r0, [r4]
	strh r0, [r5, 0xC]
	b _081403AA
	.align 2, 0
_0814033C: .4byte gUnknown_03005F0C
_08140340: .4byte gUnknown_03005F14
_08140344: .4byte gSprites
_08140348: .4byte gUnknown_03005F10
_0814034C:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x20
	strh r0, [r5, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0xC]
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _08140388 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r5, r0]
	ldr r0, _0814038C @ =0x0000047f
	cmp r1, r0
	ble _081403E0
	b _081403AA
	.align 2, 0
_08140388: .4byte gSprites
_0814038C: .4byte 0x0000047f
_08140390:
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _081403B4 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_081403AA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _081403E0
	.align 2, 0
_081403B4: .4byte gSprites
_081403B8:
	ldr r0, _081403E8 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	ble _081403E0
	adds r0, r6, 0
	bl DestroyTask
	adds r0, r7, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r7, 0x38]
	ldr r0, _081403EC @ =sub_8140014
	str r0, [r7, 0x1C]
_081403E0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081403E8: .4byte gTasks
_081403EC: .4byte sub_8140014
	thumb_func_end sub_813FEC8

	thumb_func_start sub_8140014
sub_8140014: @ 81403F0
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814042A
	movs r1, 0
	strh r1, [r4, 0x34]
	movs r0, 0x20
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _08140430 @ =sub_8140058
	str r0, [r4, 0x1C]
_0814042A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140430: .4byte sub_8140058
	thumb_func_end sub_8140014

	thumb_func_start sub_8140058
sub_8140058: @ 8140434
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _0814044A
	cmp r1, 0x1
	beq _081404BE
	b _081404EA
_0814044A:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _081404EA
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _08140494 @ =0x00000101
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _08140486
	movs r5, 0x1
_08140486:
	cmp r0, 0x2
	beq _081404A6
	cmp r0, 0x2
	bgt _08140498
	cmp r0, 0x1
	beq _0814049E
	b _081404B6
	.align 2, 0
_08140494: .4byte 0x00000101
_08140498:
	cmp r0, 0x3
	beq _081404AE
	b _081404B6
_0814049E:
	movs r0, 0x38
	bl PlaySE
	b _081404EA
_081404A6:
	movs r0, 0x39
	bl PlaySE
	b _081404EA
_081404AE:
	movs r0, 0x3A
	bl PlaySE
	b _081404EA
_081404B6:
	movs r0, 0x3B
	bl PlaySE
	b _081404EA
_081404BE:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _081404EA
	strh r5, [r4, 0x38]
	ldr r0, _08140514 @ =0xffffff00
	ands r0, r2
	strh r0, [r4, 0x34]
_081404EA:
	cmp r5, 0
	beq _0814052A
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	ldr r0, _08140518 @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08140520
	strh r5, [r4, 0x38]
	ldr r0, _0814051C @ =sub_8140410
	str r0, [r4, 0x1C]
	b _0814052A
	.align 2, 0
_08140514: .4byte 0xffffff00
_08140518: .4byte 0x02017840
_0814051C: .4byte sub_8140410
_08140520:
	ldr r0, _08140530 @ =sub_8140158
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_0814052A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140530: .4byte sub_8140158
	thumb_func_end sub_8140058

	thumb_func_start sub_8140158
sub_8140158: @ 8140534
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0814056C
	strh r5, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08140574 @ =0x02017840
	strh r5, [r0, 0xC]
	ldr r0, _08140578 @ =sub_81401A0
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySE
_0814056C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140574: .4byte 0x02017840
_08140578: .4byte sub_81401A0
	thumb_func_end sub_8140158

	thumb_func_start sub_81401A0
sub_81401A0: @ 814057C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x6
	bls _0814058C
	b _081407A0
_0814058C:
	lsls r0, r1, 2
	ldr r1, _08140598 @ =_0814059C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08140598: .4byte _0814059C
	.align 2, 0
_0814059C:
	.4byte _081405B8
	.4byte _08140602
	.4byte _08140648
	.4byte _0814069C
	.4byte _081406EC
	.4byte _08140744
	.4byte _081407A0
_081405B8:
	ldr r0, _081405D4 @ =0x02017840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _081405D8
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _081405DC
	.align 2, 0
_081405D4: .4byte 0x02017840
_081405D8:
	adds r0, r2, 0
	adds r0, 0xB0
_081405DC:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bhi _08140600
	b _081407E6
_08140600:
	b _08140690
_08140602:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _081406A8
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _0814063E
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _081407E6
_0814063E:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _081407E6
_08140648:
	ldr r0, _08140664 @ =0x02017840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _08140668
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _0814066C
	.align 2, 0
_08140664: .4byte 0x02017840
_08140668:
	adds r0, r2, 0
	adds r0, 0xB0
_0814066C:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0xC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bhi _08140690
	b _081407E6
_08140690:
	strh r3, [r5, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	b _081407E6
_0814069C:
	ldrh r0, [r4, 0x38]
	adds r1, r0, 0x1
	strh r1, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _081406B6
_081406A8:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _081407E6
_081406B6:
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _081406E4
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _081406EC
_081406E4:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_081406EC:
	ldr r0, _08140708 @ =0x02017840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _0814070C
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140710
	.align 2, 0
_08140708: .4byte 0x02017840
_0814070C:
	adds r0, r2, 0
	adds r0, 0xB0
_08140710:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _081407E6
	strh r3, [r5, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	b _081407E6
_08140744:
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r1, r0, 24
	ldr r0, _08140770 @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r1, r0
	bne _08140778
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08140774 @ =sub_8140410
	str r0, [r4, 0x1C]
	b _081407E6
	.align 2, 0
_08140770: .4byte 0x02017840
_08140774: .4byte sub_8140410
_08140778:
	cmp r0, 0x4
	bne _0814078C
	cmp r1, 0x3
	bne _0814078C
	ldr r0, _08140788 @ =sub_8140434
	str r0, [r4, 0x1C]
	b _08140792
	.align 2, 0
_08140788: .4byte sub_8140434
_0814078C:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_08140792:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _081407E6
_081407A0:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _081407E6
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _081407D4 @ =0xffffff00
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _081407D8
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _081407E0
	.align 2, 0
_081407D4: .4byte 0xffffff00
_081407D8:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_081407E0:
	movs r0, 0x17
	bl PlaySE
_081407E6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81401A0

	thumb_func_start sub_8140410
sub_8140410: @ 81407EC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x38]
	adds r0, 0x1
	strh r0, [r1, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08140806
	movs r0, 0
	strh r0, [r1, 0x38]
	ldr r0, _0814080C @ =sub_81405F4
	str r0, [r1, 0x1C]
_08140806:
	pop {r0}
	bx r0
	.align 2, 0
_0814080C: .4byte sub_81405F4
	thumb_func_end sub_8140410

	thumb_func_start sub_8140434
sub_8140434: @ 8140810
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _0814082C @ =sub_8140454
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_0814082C: .4byte sub_8140454
	thumb_func_end sub_8140434

	thumb_func_start sub_8140454
sub_8140454: @ 8140830
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r7, _08140860 @ =gUnknown_0202F7C9
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _081408A8
	cmp r1, 0x5F
	bne _0814086C
	ldr r0, _08140864 @ =gUnknown_02024E6D
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	bl sub_8043EB4
	bl m4aMPlayAllStop
	ldr r0, _08140868 @ =0x00000173
	bl PlaySE
	b _081408A8
	.align 2, 0
_08140860: .4byte gUnknown_0202F7C9
_08140864: .4byte gUnknown_02024E6D
_08140868: .4byte 0x00000173
_0814086C:
	ldr r0, _081408B0 @ =0x0000013b
	cmp r1, r0
	bne _081408A8
	ldr r5, _081408B4 @ =gSprites
	ldr r4, _081408B8 @ =gUnknown_02024BE0
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0
	strh r0, [r6, 0x2E]
	ldr r0, _081408BC @ =sub_81404E4
	str r0, [r6, 0x1C]
_081408A8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081408B0: .4byte 0x0000013b
_081408B4: .4byte gSprites
_081408B8: .4byte gUnknown_02024BE0
_081408BC: .4byte sub_81404E4
	thumb_func_end sub_8140454

	thumb_func_start sub_81404E4
sub_81404E4: @ 81408C0
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0814092C
	cmp r0, 0x1
	bgt _081408D8
	cmp r0, 0
	beq _081408DE
	b _08140970
_081408D8:
	cmp r0, 0x2
	beq _0814095C
	b _08140970
_081408DE:
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r1, _08140924 @ =0x04000050
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [r4, 0x14]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldr r0, _08140928 @ =0x00007fff
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08140968
	.align 2, 0
_08140924: .4byte 0x04000050
_08140928: .4byte 0x00007fff
_0814092C:
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _0814098E
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	ldr r3, _08140958 @ =0x04000052
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _0814098E
	b _08140968
	.align 2, 0
_08140958: .4byte 0x04000052
_0814095C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08140968:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0814098E
_08140970:
	ldr r0, _08140998 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0814098E
	ldr r0, _0814099C @ =0x04000050
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	strh r1, [r4, 0x2E]
	ldr r0, _081409A0 @ =sub_81405C8
	str r0, [r4, 0x1C]
_0814098E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140998: .4byte gPaletteFade
_0814099C: .4byte 0x04000050
_081409A0: .4byte sub_81405C8
	thumb_func_end sub_81404E4

	thumb_func_start sub_81405C8
sub_81405C8: @ 81409A4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _081409BC
	ldr r0, _081409B8 @ =0x0000ffff
	strh r0, [r4, 0x2E]
	b _081409C8
	.align 2, 0
_081409B8: .4byte 0x0000ffff
_081409BC:
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_081409C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81405C8

	thumb_func_start sub_81405F4
sub_81405F4: @ 81409D0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _08140A84 @ =sub_81406BC
	str r0, [r4, 0x1C]
	ldr r0, _08140A88 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _08140A22
	cmp r5, 0
	blt _08140A22
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldr r0, _08140A8C @ =gUnknown_0202F7C9
	ldrb r1, [r0]
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_08140A22:
	ldr r6, _08140A90 @ =gSprites
	ldr r5, _08140A94 @ =gUnknown_02024BE0
	ldr r4, _08140A8C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl AnimateSprite
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08140A84: .4byte sub_81406BC
_08140A88: .4byte gUnknown_02024C04
_08140A8C: .4byte gUnknown_0202F7C9
_08140A90: .4byte gSprites
_08140A94: .4byte gUnknown_02024BE0
	thumb_func_end sub_81405F4

	thumb_func_start sub_81406BC
sub_81406BC: @ 8140A98
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08140AB6
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08140AB6:
	ldr r4, _08140AE4 @ =gSprites
	ldr r3, _08140AE8 @ =gUnknown_02024BE0
	ldr r2, _08140AEC @ =gUnknown_0202F7C9
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _08140AF0
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r5, 0x1
	b _08140B10
	.align 2, 0
_08140AE4: .4byte gSprites
_08140AE8: .4byte gUnknown_02024BE0
_08140AEC: .4byte gUnknown_0202F7C9
_08140AF0:
	ldr r6, _08140B78 @ =0xfffffee0
	adds r0, r6, 0
	ldrh r6, [r1, 0x30]
	adds r0, r6
	strh r0, [r1, 0x30]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_08140B10:
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08140B72
	cmp r5, 0
	beq _08140B72
	ldr r4, _08140B7C @ =gSprites
	ldr r3, _08140B80 @ =gUnknown_02024BE0
	ldr r2, _08140B84 @ =gUnknown_0202F7C9
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0
	movs r5, 0
	strh r5, [r0, 0x26]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _08140B88 @ =0x02017840
	ldrb r1, [r0, 0x9]
	lsls r1, 30
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r7, 0x2E]
	ldr r0, _08140B8C @ =sub_81405C8
	str r0, [r7, 0x1C]
	ldr r0, _08140B90 @ =gUnknown_02024E6D
	strb r6, [r0]
	movs r0, 0x1
	bl sub_8043EB4
_08140B72:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140B78: .4byte 0xfffffee0
_08140B7C: .4byte gSprites
_08140B80: .4byte gUnknown_02024BE0
_08140B84: .4byte gUnknown_0202F7C9
_08140B88: .4byte 0x02017840
_08140B8C: .4byte sub_81405C8
_08140B90: .4byte gUnknown_02024E6D
	thumb_func_end sub_81406BC

	thumb_func_start sub_81407B8
sub_81407B8: @ 8140B94
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	ldr r4, _08140BCC @ =sub_81407F4
	movs r3, 0
	movs r1, 0x5
	adds r0, r2, 0
	adds r0, 0x38
_08140BB8:
	strh r3, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _08140BB8
	str r4, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140BCC: .4byte sub_81407F4
	thumb_func_end sub_81407B8

	thumb_func_start sub_81407F4
sub_81407F4: @ 8140BD0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x80
	lsls r0, 4
	adds r2, r0, 0
	ldrh r1, [r4, 0x2E]
	adds r2, r1
	movs r0, 0xD0
	lsls r0, 3
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	adds r3, r1
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x2E]
	ands r3, r0
	strh r3, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	bgt _08140C26
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _08140C3A
_08140C26:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _08140C40 @ =sub_81405C8
	str r0, [r4, 0x1C]
	ldr r1, _08140C44 @ =gUnknown_02024E6D
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl sub_8043EB4
_08140C3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140C40: .4byte sub_81405C8
_08140C44: .4byte gUnknown_02024E6D
	thumb_func_end sub_81407F4

	thumb_func_start sub_814086C
sub_814086C: @ 8140C48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r5, r4, 0
	ldr r0, _08140CEC @ =gUnknown_0840B258
	lsls r6, r5, 3
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08140CF0 @ =0xffff0000
	cmp r0, r1
	bne _08140C92
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	ldr r0, _08140CF4 @ =gUnknown_0840B2B8
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_08140C92:
	ldr r1, _08140CF8 @ =gUnknown_0840B384
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08140CFC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	mov r1, r10
	strh r1, [r0, 0xA]
	mov r1, r9
	strh r1, [r0, 0xC]
	mov r1, r8
	strh r1, [r0, 0xE]
	strh r7, [r0, 0x10]
	strh r5, [r0, 0x26]
	movs r0, 0xF
	bl PlaySE
	ldr r0, _08140D00 @ =gMain
	ldr r1, _08140D04 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08140CDC
	ldr r1, _08140D08 @ =0x02017840
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_08140CDC:
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08140CEC: .4byte gUnknown_0840B258
_08140CF0: .4byte 0xffff0000
_08140CF4: .4byte gUnknown_0840B2B8
_08140CF8: .4byte gUnknown_0840B384
_08140CFC: .4byte gTasks
_08140D00: .4byte gMain
_08140D04: .4byte 0x0000043d
_08140D08: .4byte 0x02017840
	thumb_func_end sub_814086C

	thumb_func_start sub_8140930
sub_8140930: @ 8140D0C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _08140DAC @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0xF
	bgt _08140DC0
	ldrb r1, [r7, 0xA]
	ldrb r2, [r7, 0xC]
	ldrb r6, [r7, 0xE]
	ldrb r3, [r7, 0x10]
	mov r4, r8
	lsls r0, r4, 1
	add r0, r8
	lsls r0, 3
	ldr r4, _08140DB0 @ =gSpriteTemplate_840B3B4
	adds r0, r4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _08140DB4 @ =gSprites
	adds r2, r4, r5
	ldr r0, _08140DB8 @ =gUnknown_0840B378
	add r0, r8
	ldrb r1, [r0]
	adds r0, r2, 0
	str r2, [sp]
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _08140DBC @ =sub_8140A08
	str r0, [r4]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldr r2, [sp]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, 0x5]
	ldrb r0, [r7, 0x8]
	cmp r0, 0x7
	bls _08140D92
	subs r0, 0x8
	lsls r0, 24
	lsrs r0, 24
_08140D92:
	lsls r0, 5
	strh r0, [r2, 0x2E]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0xF
	bne _08140DC0
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	mov r0, r9
	bl DestroyTask
	b _08140DD2
	.align 2, 0
_08140DAC: .4byte gTasks
_08140DB0: .4byte gSpriteTemplate_840B3B4
_08140DB4: .4byte gSprites
_08140DB8: .4byte gUnknown_0840B378
_08140DBC: .4byte sub_8140A08
_08140DC0:
	ldr r0, _08140DE0 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08140DD2:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140DE0: .4byte gTasks
	thumb_func_end sub_8140930

	thumb_func_start sub_8140A08
sub_8140A08: @ 8140DE4
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x30]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08140DFC
	ldr r0, _08140DF8 @ =sub_8140A28
	str r0, [r1, 0x1C]
	b _08140E00
	.align 2, 0
_08140DF8: .4byte sub_8140A28
_08140DFC:
	subs r0, r2, 0x1
	strh r0, [r1, 0x30]
_08140E00:
	pop {r0}
	bx r0
	thumb_func_end sub_8140A08

	thumb_func_start sub_8140A28
sub_8140A28: @ 8140E04
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bne _08140E38
	adds r0, r4, 0
	bl sub_8141294
_08140E38:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8140A28

	thumb_func_start sub_8140A64
sub_8140A64: @ 8140E40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140F00 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140F04 @ =gSprites
	mov r8, r3
	ldr r0, _08140F08 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140E84:
	ldr r0, _08140F0C @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140F10 @ =0x02020020
	adds r1, r5, r3
	ldr r0, _08140F14 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x36]
	movs r0, 0x2
	strh r0, [r4, 0x38]
	movs r2, 0x1
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140E84
	ldr r0, _08140F04 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140F00: .4byte gTasks
_08140F04: .4byte gSprites
_08140F08: .4byte gUnknown_0840B378
_08140F0C: .4byte gSpriteTemplate_840B3B4
_08140F10: .4byte 0x02020020
_08140F14: .4byte sub_8140ECC
	thumb_func_end sub_8140A64

	thumb_func_start sub_8140B3C
sub_8140B3C: @ 8140F18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140FD8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140FDC @ =gSprites
	mov r8, r3
	ldr r0, _08140FE0 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140F5C:
	ldr r0, _08140FE4 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140FE8 @ =0x02020020
	adds r1, r5, r3
	ldr r0, _08140FEC @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x36]
	movs r1, 0x1
	strh r1, [r4, 0x38]
	movs r0, 0x2
	strh r0, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140F5C
	ldr r0, _08140FDC @ =gSprites
	adds r0, r5, r0
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140FD8: .4byte gTasks
_08140FDC: .4byte gSprites
_08140FE0: .4byte gUnknown_0840B378
_08140FE4: .4byte gSpriteTemplate_840B3B4
_08140FE8: .4byte 0x02020020
_08140FEC: .4byte sub_8140ECC
	thumb_func_end sub_8140B3C

	thumb_func_start sub_8140C14
sub_8140C14: @ 8140FF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081410AC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _081410B0 @ =gSprites
	mov r8, r3
	ldr r0, _081410B4 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08141034:
	ldr r0, _081410B8 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _081410BC @ =0x02020020
	adds r1, r5, r3
	ldr r0, _081410C0 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0x4
	strh r0, [r4, 0x36]
	movs r2, 0x1
	strh r2, [r4, 0x38]
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08141034
	ldr r0, _081410B0 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081410AC: .4byte gTasks
_081410B0: .4byte gSprites
_081410B4: .4byte gUnknown_0840B378
_081410B8: .4byte gSpriteTemplate_840B3B4
_081410BC: .4byte 0x02020020
_081410C0: .4byte sub_8140ECC
	thumb_func_end sub_8140C14

	thumb_func_start sub_8140CE8
sub_8140CE8: @ 81410C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08141188 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _0814118C @ =gSprites
	mov r8, r3
	ldr r0, _08141190 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08141108:
	ldr r0, _08141194 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08141198 @ =0x02020020
	adds r1, r5, r3
	ldr r0, _0814119C @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	adds r0, r6
	strh r0, [r4, 0x2E]
	movs r0, 0x5
	strh r0, [r4, 0x36]
	movs r2, 0x1
	strh r2, [r4, 0x38]
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _08141108
	ldr r0, _0814118C @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141188: .4byte gTasks
_0814118C: .4byte gSprites
_08141190: .4byte gUnknown_0840B378
_08141194: .4byte gSpriteTemplate_840B3B4
_08141198: .4byte 0x02020020
_0814119C: .4byte sub_8140ECC
	thumb_func_end sub_8140CE8

	thumb_func_start sub_8140DC4
sub_8140DC4: @ 81411A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081411CC @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrh r1, [r3, 0x16]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _081411D0
	subs r0, r1, 0x1
	strh r0, [r3, 0x16]
	b _08141280
	.align 2, 0
_081411CC: .4byte gTasks
_081411D0:
	ldrh r0, [r3, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r3, 0xA]
	str r1, [sp]
	ldrb r4, [r3, 0xC]
	str r4, [sp, 0x4]
	ldrb r1, [r3, 0xE]
	str r1, [sp, 0x8]
	ldrb r3, [r3, 0x10]
	str r3, [sp, 0xC]
	movs r6, 0
	str r2, [sp, 0x10]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	mov r10, r1
	ldr r3, _08141290 @ =gSprites
	mov r8, r3
	ldr r1, _08141294 @ =gUnknown_0840B378
	adds r0, r1
	mov r9, r0
_081411FC:
	ldr r0, _08141298 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r3, r9
	ldrb r1, [r3]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0814129C @ =0x02020020
	adds r1, r5, r0
	ldr r0, _081412A0 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r2, 0x8
	strh r2, [r4, 0x36]
	movs r0, 0x2
	strh r0, [r4, 0x38]
	strh r0, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _081411FC
	ldr r0, _081412A4 @ =gTasks
	ldr r4, [sp, 0x10]
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x16]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _08141280
	ldr r0, _08141290 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
_08141280:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141290: .4byte gSprites
_08141294: .4byte gUnknown_0840B378
_08141298: .4byte gSpriteTemplate_840B3B4
_0814129C: .4byte 0x02020020
_081412A0: .4byte sub_8140ECC
_081412A4: .4byte gTasks
	thumb_func_end sub_8140DC4

	thumb_func_start sub_8140ECC
sub_8140ECC: @ 81412A8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x30]
	adds r0, r2
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _081412F8
	adds r0, r4, 0
	bl sub_8141294
_081412F8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8140ECC

	thumb_func_start sub_8140F24
sub_8140F24: @ 8141300
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081413BC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _081413C0 @ =gSprites
	mov r8, r3
	ldr r0, _081413C4 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08141344:
	ldr r0, _081413C8 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _081413CC @ =0x02020020
	adds r1, r5, r3
	ldr r0, _081413D0 @ =sub_8140FF8
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r6
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _08141344
	ldr r0, _081413C0 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081413BC: .4byte gTasks
_081413C0: .4byte gSprites
_081413C4: .4byte gUnknown_0840B378
_081413C8: .4byte gSpriteTemplate_840B3B4
_081413CC: .4byte 0x02020020
_081413D0: .4byte sub_8140FF8
	thumb_func_end sub_8140F24

	thumb_func_start sub_8140FF8
sub_8140FF8: @ 81413D4
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _0814142C
	adds r0, r5, 0
	bl sub_8141294
_0814142C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8140FF8

	thumb_func_start sub_8141058
sub_8141058: @ 8141434
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r1, _081414E0 @ =gTasks
	lsls r0, 2
	ldr r2, [sp]
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r3, [r0, 0xA]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xC]
	str r2, [sp, 0x8]
	ldrb r3, [r0, 0xE]
	str r3, [sp, 0xC]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0x10]
	movs r0, 0
	mov r8, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	str r0, [sp, 0x14]
	ldr r0, _081414E4 @ =gUnknown_0840B378
	adds r1, r0
	mov r10, r1
_0814147A:
	movs r7, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_08141482:
	ldr r0, _081414E8 @ =gSpriteTemplate_840B3B4
	ldr r2, [sp, 0x14]
	adds r0, r2, r0
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r3, _081414EC @ =gSprites
	adds r5, r4, r3
	mov r0, r10
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _081414F0 @ =0x02020020
	adds r4, r1
	ldr r0, _081414F4 @ =sub_8140ECC
	str r0, [r4]
	movs r0, 0x3
	ldr r1, [sp, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r2, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0x8
	strh r0, [r5, 0x36]
	mov r0, r8
	cmp r0, 0
	bne _081414F8
	movs r0, 0x2
	strh r0, [r5, 0x38]
	movs r0, 0x1
	b _081414FE
	.align 2, 0
_081414E0: .4byte gTasks
_081414E4: .4byte gUnknown_0840B378
_081414E8: .4byte gSpriteTemplate_840B3B4
_081414EC: .4byte gSprites
_081414F0: .4byte 0x02020020
_081414F4: .4byte sub_8140ECC
_081414F8:
	movs r0, 0x1
	strh r0, [r5, 0x38]
	movs r0, 0x2
_081414FE:
	strh r0, [r5, 0x3A]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _08141482
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _0814147A
	ldr r0, _0814153C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	ldr r0, [sp]
	bl DestroyTask
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814153C: .4byte gSprites
	thumb_func_end sub_8141058

	thumb_func_start sub_8141164
sub_8141164: @ 8141540
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081415F4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _081415F8 @ =gSprites
	mov r8, r3
	ldr r0, _081415FC @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08141584:
	ldr r0, _08141600 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08141604 @ =0x02020020
	adds r1, r5, r3
	ldr r0, _08141608 @ =sub_8141230
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08141584
	ldr r0, _081415F8 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081415F4: .4byte gTasks
_081415F8: .4byte gSprites
_081415FC: .4byte gUnknown_0840B378
_08141600: .4byte gSpriteTemplate_840B3B4
_08141604: .4byte 0x02020020
_08141608: .4byte sub_8141230
	thumb_func_end sub_8141164

	thumb_func_start sub_8141230
sub_8141230: @ 814160C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, 0x2E]
	movs r0, 0x3F
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _08141668
	adds r0, r5, 0
	bl sub_8141294
_08141668:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8141230

	thumb_func_start sub_8141294
sub_8141294: @ 8141670
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _08141694 @ =gMain
	ldr r1, _08141698 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0814169C
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _081416CE
	adds r0, r5, 0
	bl DestroySpriteAndFreeResources
	b _081416EA
	.align 2, 0
_08141694: .4byte gMain
_08141698: .4byte 0x0000043d
_0814169C:
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _081416E4
	ldr r1, _081416D8 @ =0x02017840
	ldrb r0, [r1, 0xA]
	subs r0, 0x1
	strb r0, [r1, 0xA]
	lsls r0, 24
	cmp r0, 0
	bne _081416CE
	movs r7, 0
	ldr r6, _081416DC @ =gUnknown_0840B258
	ldr r4, _081416E0 @ =gUnknown_0840B2B8
_081416B8:
	ldrh r0, [r6, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	adds r6, 0x8
	adds r4, 0x8
	adds r7, 0x1
	cmp r7, 0xB
	ble _081416B8
_081416CE:
	adds r0, r5, 0
	bl DestroySprite
	b _081416EA
	.align 2, 0
_081416D8: .4byte 0x02017840
_081416DC: .4byte gUnknown_0840B258
_081416E0: .4byte gUnknown_0840B2B8
_081416E4:
	adds r0, r5, 0
	bl DestroySprite
_081416EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8141294

	thumb_func_start sub_8141314
sub_8141314: @ 81416F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	mov r9, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r3, 24
	lsrs r7, r3, 24
	ldr r0, _08141754 @ =sub_81413DC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08141758 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r5, r0, r1
	strh r7, [r5, 0x26]
	strh r6, [r5, 0xE]
	mov r0, r9
	strh r0, [r5, 0x1C]
	mov r1, r9
	lsrs r0, r1, 16
	strh r0, [r5, 0x1E]
	cmp r4, 0
	bne _08141760
	lsls r0, r6, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldr r2, _0814175C @ =gUnknown_0840B4D4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	movs r0, 0x1
	strh r0, [r5, 0xA]
	b _08141786
	.align 2, 0
_08141754: .4byte sub_81413DC
_08141758: .4byte gTasks
_0814175C: .4byte gUnknown_0840B4D4
_08141760:
	lsls r0, r6, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r2, _081417A8 @ =gUnknown_0840B4D4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x10
	bl BlendPalette
	movs r0, 0x10
	strh r0, [r5, 0x8]
	ldr r0, _081417AC @ =0x0000ffff
	strh r0, [r5, 0xA]
	ldr r0, _081417B0 @ =sub_814146C
	str r0, [r5]
_08141786:
	ldr r0, _081417B4 @ =0x00007fff
	str r0, [sp]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081417A8: .4byte gUnknown_0840B4D4
_081417AC: .4byte 0x0000ffff
_081417B0: .4byte sub_814146C
_081417B4: .4byte 0x00007fff
	thumb_func_end sub_8141314

	thumb_func_start sub_81413DC
sub_81413DC: @ 81417B8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08141808 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bgt _08141810
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _0814180C @ =gUnknown_0840B4D4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _08141838
	.align 2, 0
_08141808: .4byte gTasks
_0814180C: .4byte gUnknown_0840B4D4
_08141810:
	ldr r0, _08141840 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08141838
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _08141844 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r5, 0
	bl DestroyTask
_08141838:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141840: .4byte gPaletteFade
_08141844: .4byte 0x00007fff
	thumb_func_end sub_81413DC

	thumb_func_start sub_814146C
sub_814146C: @ 8141848
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08141888 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08141880
	ldr r0, _0814188C @ =gTasks
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _08141890 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08141894 @ =sub_81414BC
	str r0, [r4]
_08141880:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141888: .4byte gPaletteFade
_0814188C: .4byte gTasks
_08141890: .4byte 0x00007fff
_08141894: .4byte sub_81414BC
	thumb_func_end sub_814146C

	thumb_func_start sub_81414BC
sub_81414BC: @ 8141898
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _081418E4 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bgt _081418EC
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _081418E8 @ =gUnknown_0840B4D4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _081418F2
	.align 2, 0
_081418E4: .4byte gTasks
_081418E8: .4byte gUnknown_0840B4D4
_081418EC:
	adds r0, r2, 0
	bl DestroyTask
_081418F2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81414BC

	thumb_func_start sub_814151C
sub_814151C: @ 81418F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r0, _0814192C @ =gUnknown_02024BE0
	ldr r3, _08141930 @ =gUnknown_0202F7C8
	ldrb r2, [r3]
	adds r0, r2, r0
	ldrb r6, [r0]
	ldr r1, _08141934 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _081419D0
	cmp r0, 0x1
	bgt _08141938
	cmp r0, 0
	beq _0814193E
	b _08141A92
	.align 2, 0
_0814192C: .4byte gUnknown_02024BE0
_08141930: .4byte gUnknown_0202F7C8
_08141934: .4byte gTasks
_08141938:
	cmp r0, 0x2
	beq _081419E2
	b _08141A92
_0814193E:
	ldr r0, _08141978 @ =gUnknown_03004B00
	ldrh r0, [r0]
	strh r0, [r5, 0x1E]
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r4, [r5, 0x8]
	adds r0, r4
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08141980
	ldr r2, _0814197C @ =gSprites
	lsls r3, r6, 4
	adds r1, r3, r6
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	adds r4, r3, 0
	b _08141998
	.align 2, 0
_08141978: .4byte gUnknown_03004B00
_0814197C: .4byte gSprites
_08141980:
	ldr r3, _081419C8 @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
_08141998:
	ldr r1, _081419CC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrb r0, [r3, 0x8]
	strh r0, [r3, 0x8]
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r4, 0x24
	ldrsh r0, [r0, r4]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _08141A92
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	b _08141A92
	.align 2, 0
_081419C8: .4byte gSprites
_081419CC: .4byte gTasks
_081419D0:
	ldrb r1, [r5, 0x1E]
	adds r0, r2, 0
	adds r2, r6, 0
	bl refresh_graphics_maybe
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	b _08141A92
_081419E2:
	movs r1, 0xA0
	lsls r1, 3
	adds r0, r1, 0
	ldrh r2, [r5, 0x8]
	adds r0, r2
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08141A18
	ldr r0, _08141A14 @ =gSprites
	lsls r3, r6, 4
	adds r2, r3, r6
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r4, r3, 0
	b _08141A30
	.align 2, 0
_08141A14: .4byte gSprites
_08141A18:
	ldr r0, _08141A64 @ =gSprites
	lsls r2, r6, 4
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	adds r4, r2, 0
_08141A30:
	ldr r1, _08141A68 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	strh r1, [r0, 0x8]
	ldr r0, _08141A6C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08141A70
	ldr r0, _08141A64 @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bgt _08141A86
	movs r0, 0
	strh r0, [r1, 0x24]
	b _08141A8C
	.align 2, 0
_08141A64: .4byte gSprites
_08141A68: .4byte gTasks
_08141A6C: .4byte gUnknown_0202F7C8
_08141A70:
	ldr r0, _08141A9C @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	blt _08141A86
	strh r2, [r1, 0x24]
	movs r4, 0x1
	mov r8, r4
_08141A86:
	mov r0, r8
	cmp r0, 0
	beq _08141A92
_08141A8C:
	adds r0, r7, 0
	bl move_anim_task_del
_08141A92:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141A9C: .4byte gSprites
	thumb_func_end sub_814151C

	thumb_func_start sub_81416C4
sub_81416C4: @ 8141AA0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08141AC4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08141B20
	cmp r0, 0x1
	bgt _08141AC8
	cmp r0, 0
	beq _08141ACE
	b _08141B94
	.align 2, 0
_08141AC4: .4byte gTasks
_08141AC8:
	cmp r0, 0x2
	beq _08141B58
	b _08141B94
_08141ACE:
	ldr r0, _08141AE4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08141AF0
	ldr r1, _08141AE8 @ =0x04000050
	ldr r2, _08141AEC @ =0x00003f42
	b _08141AF4
	.align 2, 0
_08141AE4: .4byte gUnknown_0202F7C8
_08141AE8: .4byte 0x04000050
_08141AEC: .4byte 0x00003f42
_08141AF0:
	ldr r1, _08141B10 @ =0x04000050
	ldr r2, _08141B14 @ =0x00003f44
_08141AF4:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08141B18 @ =0x04000052
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _08141B1C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _08141B94
	.align 2, 0
_08141B10: .4byte 0x04000050
_08141B14: .4byte 0x00003f44
_08141B18: .4byte 0x04000052
_08141B1C: .4byte gTasks
_08141B20:
	ldrh r0, [r4, 0xA]
	adds r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08141B94
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r1, 0x1
	strh r1, [r4, 0x8]
	ldr r3, _08141B54 @ =0x04000052
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _08141B94
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _08141B94
	.align 2, 0
_08141B54: .4byte 0x04000052
_08141B58:
	ldr r1, _08141B9C @ =gUnknown_02024BE0
	ldr r3, _08141BA0 @ =gUnknown_0202F7C8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08141BA4 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _08141BA8 @ =0x06010000
	adds r0, r1
	movs r1, 0
	str r1, [sp]
	ldr r1, _08141BAC @ =0x040000d4
	mov r2, sp
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08141BB0 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrb r0, [r3]
	bl sub_80324E0
	adds r0, r5, 0
	bl move_anim_task_del
_08141B94:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141B9C: .4byte gUnknown_02024BE0
_08141BA0: .4byte gUnknown_0202F7C8
_08141BA4: .4byte gSprites
_08141BA8: .4byte 0x06010000
_08141BAC: .4byte 0x040000d4
_08141BB0: .4byte 0x85000200
	thumb_func_end sub_81416C4

	thumb_func_start sub_81417D8
sub_81417D8: @ 8141BB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08141BD8 @ =gUnknown_03004B00
	ldr r1, _08141BDC @ =gUnknown_0202F7C8
	ldrb r1, [r1]
	lsls r1, 2
	ldr r2, _08141BE0 @ =0x02017800
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r3, 0xE]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08141BD8: .4byte gUnknown_03004B00
_08141BDC: .4byte gUnknown_0202F7C8
_08141BE0: .4byte 0x02017800
	thumb_func_end sub_81417D8

	thumb_func_start sub_8141808
sub_8141808: @ 8141BE4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141BFC @ =gUnknown_0202F7C9
	ldr r1, _08141C00 @ =gUnknown_02024C0A
	ldrb r1, [r1]
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08141BFC: .4byte gUnknown_0202F7C9
_08141C00: .4byte gUnknown_02024C0A
	thumb_func_end sub_8141808

	thumb_func_start sub_8141828
sub_8141828: @ 8141C04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	mov r8, r0
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	ldr r1, _08141CBC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r6, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08141CD8
	lsrs r0, r5, 16
	ldr r7, _08141CC0 @ =0x0000ffff
	ands r5, r7
	eors r0, r5
	lsrs r1, r4, 16
	eors r0, r1
	ands r4, r7
	eors r0, r4
	cmp r0, 0x7
	bhi _08141C5E
	movs r0, 0x1
	mov r8, r0
_08141C5E:
	mov r0, r8
	cmp r0, 0
	beq _08141CD8
	ldr r0, _08141CC4 @ =0x000027f9
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bne _08141C7E
	ldr r0, _08141CC8 @ =0x0838a094
	bl LoadCompressedObjectPic
	ldr r0, _08141CCC @ =0x0838a99c
	bl LoadCompressedObjectPalette
_08141C7E:
	ldr r5, _08141CD0 @ =sub_814191C
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08141CD4 @ =gTasks
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r2, r3
	movs r4, 0
	strh r6, [r2, 0x8]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	strh r6, [r1, 0x8]
	strh r4, [r2, 0xA]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	b _08141CEA
	.align 2, 0
_08141CBC: .4byte 0x02017810
_08141CC0: .4byte 0x0000ffff
_08141CC4: .4byte 0x000027f9
_08141CC8: .4byte 0x0838a094
_08141CCC: .4byte 0x0838a99c
_08141CD0: .4byte sub_814191C
_08141CD4: .4byte gTasks
_08141CD8:
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	ldr r1, _08141CF4 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_08141CEA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141CF4: .4byte 0x02017810
	thumb_func_end sub_8141828

	thumb_func_start sub_814191C
sub_814191C: @ 8141CF8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08141D20 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _08141D24
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	b _08141E94
	.align 2, 0
_08141D20: .4byte gTasks
_08141D24:
	ldr r0, _08141D74 @ =0x02017840
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _08141D2E
	b _08141E94
_08141D2E:
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	beq _08141D42
	b _08141E94
_08141D42:
	ldrb r0, [r4, 0x8]
	mov r8, r0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08141D7C
	ldr r0, _08141D78 @ =gBattleAnimSpriteTemplate_84024E8
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	b _08141DDE
	.align 2, 0
_08141D74: .4byte 0x02017840
_08141D78: .4byte gBattleAnimSpriteTemplate_84024E8
_08141D7C:
	cmp r0, 0
	blt _08141DB0
	cmp r0, 0x3
	bgt _08141DB0
	ldr r0, _08141DA8 @ =gSpriteTemplate_8402500
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08141DAC @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x4
	b _08141DD0
	.align 2, 0
_08141DA8: .4byte gSpriteTemplate_8402500
_08141DAC: .4byte gSprites
_08141DB0:
	ldr r0, _08141E08 @ =gSpriteTemplate_8402500
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08141E0C @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x5
_08141DD0:
	ldr r4, _08141E10 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _08141E14 @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08141DDE:
	ldr r2, _08141E18 @ =gTasks
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	mov r9, r1
	cmp r0, 0
	bne _08141E20
	ldr r1, _08141E0C @ =gSprites
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08141E1C @ =sub_8141B20
	str r1, [r0]
	adds r4, r2, 0
	b _08141E68
	.align 2, 0
_08141E08: .4byte gSpriteTemplate_8402500
_08141E0C: .4byte gSprites
_08141E10: .4byte 0x000003ff
_08141E14: .4byte 0xfffffc00
_08141E18: .4byte gTasks
_08141E1C: .4byte sub_8141B20
_08141E20:
	ldr r3, _08141EA0 @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08141EA4 @ =sub_8141B74
	str r2, [r0]
	adds r1, r3
	ldr r0, _08141EA8 @ =0x0000ffe0
	strh r0, [r1, 0x24]
	movs r0, 0x20
	strh r0, [r1, 0x26]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08141E68
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x3F
	cmp r0, 0
	bne _08141E5E
	movs r1, 0xC0
_08141E5E:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x66
	bl PlaySE12WithPanning
_08141E68:
	ldr r1, _08141EA0 @ =gSprites
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	strh r7, [r0, 0x2E]
	ldr r1, _08141EAC @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r2, r0, r1
	ldrh r1, [r2, 0x1E]
	adds r1, 0x1
	strh r1, [r2, 0x1E]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	bne _08141E94
	ldr r0, _08141EB0 @ =sub_8141AD8
	str r0, [r2]
_08141E94:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141EA0: .4byte gSprites
_08141EA4: .4byte sub_8141B74
_08141EA8: .4byte 0x0000ffe0
_08141EAC: .4byte gTasks
_08141EB0: .4byte sub_8141AD8
	thumb_func_end sub_814191C

	thumb_func_start sub_8141AD8
sub_8141AD8: @ 8141EB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	ldr r1, _08141EF4 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x20
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08141EF0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _08141EEA
	ldrb r1, [r1, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08141EF8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_08141EEA:
	adds r0, r3, 0
	bl DestroyTask
_08141EF0:
	pop {r0}
	bx r0
	.align 2, 0
_08141EF4: .4byte gTasks
_08141EF8: .4byte 0x02017810
	thumb_func_end sub_8141AD8

	thumb_func_start sub_8141B20
sub_8141B20: @ 8141EFC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xC
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08141F46
	ldr r2, _08141F4C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_08141F46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141F4C: .4byte gTasks
	thumb_func_end sub_8141B20

	thumb_func_start sub_8141B74
sub_8141B74: @ 8141F50
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bgt _08141F64
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08141FA6
_08141F64:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4, 0x24]
	adds r1, 0x5
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r0, 0x5
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x20
	ble _08141FA6
	ldr r2, _08141FAC @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_08141FA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141FAC: .4byte gTasks
	thumb_func_end sub_8141B74

	thumb_func_start sub_8141BD4
sub_8141BD4: @ 8141FB0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08141FD8 @ =0x0838a1b4
	bl LoadCompressedObjectPic
	ldr r0, _08141FDC @ =0x0838aabc
	bl LoadCompressedObjectPalette
	ldr r0, _08141FE0 @ =0x0000281d
	bl IndexOfSpritePaletteTag
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141FD8: .4byte 0x0838a1b4
_08141FDC: .4byte 0x0838aabc
_08141FE0: .4byte 0x0000281d
	thumb_func_end sub_8141BD4

	thumb_func_start sub_8141C08
sub_8141C08: @ 8141FE4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08142008 @ =0x0000281d
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142008: .4byte 0x0000281d
	thumb_func_end sub_8141C08

	thumb_func_start sub_8141C30
sub_8141C30: @ 814200C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r5, _08142080 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r4, 0x32]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _08142084 @ =0x0000ffe0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r1, _08142088 @ =gUnknown_02024BE0
	ldr r0, _0814208C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08142090 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08142094 @ =sub_8141CBC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142080: .4byte gUnknown_03004B00
_08142084: .4byte 0x0000ffe0
_08142088: .4byte gUnknown_02024BE0
_0814208C: .4byte gUnknown_0202F7C8
_08142090: .4byte gSprites
_08142094: .4byte sub_8141CBC
	thumb_func_end sub_8141C30

	thumb_func_start sub_8141CBC
sub_8141CBC: @ 8142098
	push {lr}
	adds r3, r0, 0
	ldr r2, _081420C0 @ =gSprites
	ldr r1, _081420C4 @ =gUnknown_02024BE0
	ldr r0, _081420C8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081420BC
	ldr r0, _081420CC @ =sub_8141CF4
	str r0, [r3, 0x1C]
_081420BC:
	pop {r0}
	bx r0
	.align 2, 0
_081420C0: .4byte gSprites
_081420C4: .4byte gUnknown_02024BE0
_081420C8: .4byte gUnknown_0202F7C8
_081420CC: .4byte sub_8141CF4
	thumb_func_end sub_8141CBC

	thumb_func_start sub_8141CF4
sub_8141CF4: @ 81420D0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _081420F2
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _081420F8 @ =sub_8141D20
	str r0, [r4, 0x1C]
_081420F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081420F8: .4byte sub_8141D20
	thumb_func_end sub_8141CF4

	thumb_func_start sub_8141D20
sub_8141D20: @ 81420FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0814214C @ =gSprites
	ldr r3, _08142150 @ =gUnknown_02024BE0
	ldr r2, _08142154 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _08142144
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	ble _08142144
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl move_anim_8072740
_08142144:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814214C: .4byte gSprites
_08142150: .4byte gUnknown_02024BE0
_08142154: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8141D20

	thumb_func_start sub_8141D7C
sub_8141D7C: @ 8142158
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08142180 @ =gUnknown_0202F7C8
	strb r0, [r1]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _08142184 @ =gUnknown_0202F7C9
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142180: .4byte gUnknown_0202F7C8
_08142184: .4byte gUnknown_0202F7C9
	thumb_func_end sub_8141D7C

	thumb_func_start sub_8141DAC
sub_8141DAC: @ 8142188
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0814219C @ =0x02017840
	ldrh r1, [r0]
	cmp r1, 0x53
	bne _081421A4
	ldr r1, _081421A0 @ =gUnknown_03004B00
	movs r0, 0x1
	b _081421DC
	.align 2, 0
_0814219C: .4byte 0x02017840
_081421A0: .4byte gUnknown_03004B00
_081421A4:
	cmp r1, 0xFA
	bne _081421B4
	ldr r1, _081421B0 @ =gUnknown_03004B00
	movs r0, 0x2
	b _081421DC
	.align 2, 0
_081421B0: .4byte gUnknown_03004B00
_081421B4:
	cmp r1, 0x80
	bne _081421C4
	ldr r1, _081421C0 @ =gUnknown_03004B00
	movs r0, 0x3
	b _081421DC
	.align 2, 0
_081421C0: .4byte gUnknown_03004B00
_081421C4:
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _081421D8
	ldr r1, _081421D4 @ =gUnknown_03004B00
	movs r0, 0x4
	b _081421DC
	.align 2, 0
_081421D4: .4byte gUnknown_03004B00
_081421D8:
	ldr r1, _081421E8 @ =gUnknown_03004B00
	movs r0, 0
_081421DC:
	strh r0, [r1]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_081421E8: .4byte gUnknown_03004B00
	thumb_func_end sub_8141DAC

	thumb_func_start sub_8141E10
sub_8141E10: @ 81421EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08142208 @ =gUnknown_0202F7C8
	ldr r1, _0814220C @ =0x02017840
	ldrh r1, [r1]
	strb r1, [r2]
	ldr r2, _08142210 @ =gUnknown_0202F7C9
	lsrs r1, 8
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08142208: .4byte gUnknown_0202F7C8
_0814220C: .4byte 0x02017840
_08142210: .4byte gUnknown_0202F7C9
	thumb_func_end sub_8141E10

	thumb_func_start sub_8141E38
sub_8141E38: @ 8142214
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8141E38

	thumb_func_start sub_8141E4C
sub_8141E4C: @ 8142228
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8141E4C

	thumb_func_start sub_8141E64
sub_8141E64: @ 8142240
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0814225C @ =gMain
	ldr r1, _08142260 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0814227C
	lsls r0, 2
	ldr r1, _08142264 @ =_08142268
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814225C: .4byte gMain
_08142260: .4byte 0x0000043c
_08142264: .4byte _08142268
	.align 2, 0
_08142268:
	.4byte _0814227C
	.4byte _0814229C
	.4byte _081422A2
	.4byte _081422F8
	.4byte _08142334
_0814227C:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_81433E0
	ldr r0, _08142294 @ =gMain
	ldr r2, _08142298 @ =0x0000043c
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08142360
	.align 2, 0
_08142294: .4byte gMain
_08142298: .4byte 0x0000043c
_0814229C:
	bl sub_8143570
	b _08142314
_081422A2:
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081422E0 @ =sub_8141E38
	bl SetVBlankCallback
	ldr r3, _081422E4 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _081422E8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081422EC @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _081422F0 @ =gMain
	ldr r2, _081422F4 @ =0x0000043c
	adds r1, r2
	b _0814231A
	.align 2, 0
_081422E0: .4byte sub_8141E38
_081422E4: .4byte 0x04000208
_081422E8: .4byte 0x04000200
_081422EC: .4byte 0x04000004
_081422F0: .4byte gMain
_081422F4: .4byte 0x0000043c
_081422F8:
	ldr r1, _08142324 @ =0x04000050
	ldr r2, _08142328 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	bl sub_81435B8
_08142314:
	ldr r1, _0814232C @ =gMain
	ldr r0, _08142330 @ =0x0000043c
	adds r1, r0
_0814231A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08142360
	.align 2, 0
_08142324: .4byte 0x04000050
_08142328: .4byte 0x00003f42
_0814232C: .4byte gMain
_08142330: .4byte 0x0000043c
_08142334:
	bl UpdatePaletteFade
	ldr r0, _08142358 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08142360
	ldr r0, _0814235C @ =sub_8141E4C
	bl SetMainCallback2
	movs r0, 0xDA
	lsls r0, 1
	bl PlayBGM
	movs r0, 0
	b _08142362
	.align 2, 0
_08142358: .4byte gPaletteFade
_0814235C: .4byte sub_8141E4C
_08142360:
	movs r0, 0x1
_08142362:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141E64

	thumb_func_start sub_8141F90
sub_8141F90: @ 814236C
	push {r4,lr}
	bl sub_8141E64
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08142392
	ldr r0, _08142398 @ =sub_8141FF8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814239C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08142392:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142398: .4byte sub_8141FF8
_0814239C: .4byte gTasks
	thumb_func_end sub_8141F90

	thumb_func_start sub_8141FC4
sub_8141FC4: @ 81423A0
	push {lr}
	bl sub_8141E64
	lsls r0, 24
	cmp r0, 0
	bne _081423C6
	ldr r0, _081423CC @ =sub_8141FF8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081423D0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
_081423C6:
	pop {r0}
	bx r0
	.align 2, 0
_081423CC: .4byte sub_8141FF8
_081423D0: .4byte gTasks
	thumb_func_end sub_8141FC4

	thumb_func_start sub_8141FF8
sub_8141FF8: @ 81423D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081424A4 @ =0x0201c000
	mov r9, r0
	ldr r1, _081424A8 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r7, 0
	ldr r4, _081424AC @ =0xfffffe00
	mov r10, r4
_08142400:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _081424B0 @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r3, r0, 0
	cmp r3, 0
	beq _081424B8
	adds r0, r6, 0
	movs r1, 0x41
	bl GetMonData
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 2
	mov r1, r9
	adds r5, r1, r4
	ldr r2, _081424B4 @ =0x000001ff
	adds r1, r2, 0
	ands r0, r1
	ldrh r1, [r5, 0x8]
	mov r2, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r1, r9
	adds r1, 0x4
	adds r1, r4
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 1
	ldrb r2, [r5, 0x9]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x9]
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	movs r2, 0
	mov r6, r8
	lsls r5, r6, 2
	mov r3, r9
	adds r3, 0xA
_0814247C:
	adds r1, r2, r4
	adds r1, r3, r1
	mov r6, sp
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bls _0814247C
	ldr r0, _081424A8 @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	b _081424E4
	.align 2, 0
_081424A4: .4byte 0x0201c000
_081424A8: .4byte gTasks
_081424AC: .4byte 0xfffffe00
_081424B0: .4byte gPlayerParty
_081424B4: .4byte 0x000001ff
_081424B8:
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 2
	mov r4, r9
	adds r2, r4, r1
	ldrh r0, [r2, 0x8]
	mov r6, r10
	ands r0, r6
	strh r0, [r2, 0x8]
	str r3, [r2]
	mov r0, r9
	adds r0, 0x4
	adds r0, r1
	str r3, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2, 0x9]
	movs r0, 0xFF
	strb r0, [r2, 0xA]
	mov r0, r8
	lsls r5, r0, 2
_081424E4:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _08142400
	ldr r0, _08142534 @ =gUnknown_0203931C
	movs r3, 0
	str r3, [r0]
	ldr r4, _08142538 @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r2, r1, r4
	strh r3, [r2, 0xA]
	movs r0, 0xFF
	strh r0, [r2, 0x10]
	movs r7, 0
	adds r3, r4, 0
	adds r3, 0x8
	movs r2, 0xFF
_0814250C:
	adds r0, r7, 0x5
	lsls r0, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _0814250C
	mov r6, r8
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r4
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08142540
	ldr r0, _0814253C @ =sub_81422E8
	b _08142542
	.align 2, 0
_08142534: .4byte gUnknown_0203931C
_08142538: .4byte gTasks
_0814253C: .4byte sub_81422E8
_08142540:
	ldr r0, _08142554 @ =sub_814217C
_08142542:
	str r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142554: .4byte sub_814217C
	thumb_func_end sub_8141FF8

	thumb_func_start sub_814217C
sub_814217C: @ 8142558
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081425A0 @ =0x0201c000
	mov r9, r0
	movs r7, 0x80
	lsls r7, 6
	add r7, r9
	ldr r0, _081425A4 @ =gUnknown_02039324
	ldrb r0, [r0]
	cmp r0, 0
	bne _081425B0
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r5, _081425A8 @ =0xfffe4000
	add r5, r9
	movs r3, 0xF0
	lsls r3, 9
	movs r2, 0
	ldr r1, _081425AC @ =0x00001fff
_0814258E:
	adds r0, r4, r3
	adds r0, r5
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	bls _0814258E
	b _081425BC
	.align 2, 0
_081425A0: .4byte 0x0201c000
_081425A4: .4byte gUnknown_02039324
_081425A8: .4byte 0xfffe4000
_081425AC: .4byte 0x00001fff
_081425B0:
	movs r0, 0x3
	bl sub_8125EC8
	mov r0, r8
	lsls r0, 2
	mov r10, r0
_081425BC:
	movs r4, 0
	ldrh r1, [r7, 0x8]
	ldr r2, _081425C4 @ =0x000001ff
	b _081425D6
	.align 2, 0
_081425C4: .4byte 0x000001ff
_081425C8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, 0x78
	cmp r4, 0x31
	bhi _081425E2
	ldrh r1, [r7, 0x8]
_081425D6:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _081425C8
	cmp r4, 0x31
	bls _08142604
_081425E2:
	ldr r5, _08142640 @ =0x0201e000
	adds r6, r5, 0
	adds r5, 0x78
	movs r4, 0
	subs r7, 0x78
_081425EC:
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x78
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, 0x78
	adds r5, 0x78
	cmp r4, 0x30
	bls _081425EC
_08142604:
	adds r0, r7, 0
	mov r1, r9
	movs r2, 0x78
	bl memcpy
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08142644 @ =gMenuText_HOFSaving
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08142648 @ =gTasks
	mov r0, r10
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814264C @ =sub_8142274
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142640: .4byte 0x0201e000
_08142644: .4byte gMenuText_HOFSaving
_08142648: .4byte gTasks
_0814264C: .4byte sub_8142274
	thumb_func_end sub_814217C

	thumb_func_start sub_8142274
sub_8142274: @ 8142650
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08142684 @ =gUnknown_03005EBC
	ldr r0, _08142688 @ =sub_8141FC4
	str r0, [r1]
	movs r0, 0x3
	bl sub_8125D44
	movs r0, 0x37
	bl PlaySE
	ldr r1, _0814268C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142690 @ =sub_81422B8
	str r1, [r0]
	movs r1, 0x20
	strh r1, [r0, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142684: .4byte gUnknown_03005EBC
_08142688: .4byte sub_8141FC4
_0814268C: .4byte gTasks
_08142690: .4byte sub_81422B8
	thumb_func_end sub_8142274

	thumb_func_start sub_81422B8
sub_81422B8: @ 8142694
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081426B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _081426B8
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _081426BC
	.align 2, 0
_081426B4: .4byte gTasks
_081426B8:
	ldr r0, _081426C0 @ =sub_81422E8
	str r0, [r1]
_081426BC:
	pop {r0}
	bx r0
	.align 2, 0
_081426C0: .4byte sub_81422E8
	thumb_func_end sub_81422B8

	thumb_func_start sub_81422E8
sub_81422E8: @ 81426C4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _081426F0 @ =gWindowConfig_81E7198
	adds r0, r5, 0
	bl SetUpWindowConfig
	adds r0, r5, 0
	bl InitMenuWindow
	ldr r1, _081426F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081426F8 @ =sub_8142320
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081426F0: .4byte gWindowConfig_81E7198
_081426F4: .4byte gTasks
_081426F8: .4byte sub_8142320
	thumb_func_end sub_81422E8

	thumb_func_start sub_8142320
sub_8142320: @ 81426FC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _0814272C @ =0x0201c000
	ldr r0, _08142730 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r6, [r1, 0xA]
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _08142738
	ldr r1, _08142734 @ =gUnknown_0840B534
	b _0814273A
	.align 2, 0
_0814272C: .4byte 0x0201c000
_08142730: .4byte gTasks
_08142734: .4byte gUnknown_0840B534
_08142738:
	ldr r1, _081427CC @ =gUnknown_0840B564
_0814273A:
	lsls r2, r6, 3
	adds r0, r2, r1
	ldrh r5, [r0]
	adds r0, r1, 0x2
	adds r0, r2, r0
	ldrh r3, [r0]
	adds r0, r1, 0x4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x6
	adds r2, r1
	ldrh r2, [r2]
	mov r8, r2
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	lsls r1, r5, 16
	asrs r1, 16
	lsls r2, r3, 16
	asrs r2, 16
	ldr r3, [r4]
	str r3, [sp]
	ldr r3, [r4, 0x4]
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_81436BC
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081427D0 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r4, 0
	mov r5, r9
	strh r5, [r2, 0x30]
	mov r5, r8
	strh r5, [r2, 0x32]
	strh r4, [r2, 0x2E]
	adds r3, 0x1C
	adds r1, r3
	ldr r2, _081427D4 @ =sub_81435DC
	str r2, [r1]
	ldr r5, _081427D8 @ =gTasks
	adds r1, r6, 0x5
	lsls r1, 1
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r1, r4
	adds r2, r5, 0
	adds r2, 0x8
	adds r1, r2
	strh r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r4, r5
	ldr r0, _081427DC @ =sub_8142404
	str r0, [r4]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081427CC: .4byte gUnknown_0840B564
_081427D0: .4byte gSprites
_081427D4: .4byte sub_81435DC
_081427D8: .4byte gTasks
_081427DC: .4byte sub_8142404
	thumb_func_end sub_8142320

	thumb_func_start sub_8142404
sub_8142404: @ 81427E0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0814284C @ =0x0201c000
	ldr r3, _08142850 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r5, r2, r3
	ldrh r1, [r5, 0xA]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r6, r0, r4
	ldr r4, _08142854 @ =gSprites
	adds r1, 0x5
	lsls r1, 1
	adds r1, r2
	adds r3, 0x8
	adds r1, r3
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08142846
	ldrh r2, [r6, 0x8]
	ldr r0, _08142858 @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08142834
	lsls r0, r2, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_08142834:
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_8143088
	movs r0, 0x78
	strh r0, [r5, 0xE]
	ldr r0, _0814285C @ =sub_8142484
	str r0, [r5]
_08142846:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814284C: .4byte 0x0201c000
_08142850: .4byte gTasks
_08142854: .4byte gSprites
_08142858: .4byte 0x000001ff
_0814285C: .4byte sub_8142484
	thumb_func_end sub_8142404

	thumb_func_start sub_8142484
sub_8142484: @ 8142860
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _08142898 @ =0x0201c000
	ldr r1, _0814289C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	adds r4, r6, r1
	ldrh r3, [r4, 0xA]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r2
	mov r9, r0
	ldrh r2, [r4, 0xE]
	movs r7, 0xE
	ldrsh r0, [r4, r7]
	mov r12, r1
	cmp r0, 0
	beq _081428A0
	subs r0, r2, 0x1
	strh r0, [r4, 0xE]
	b _08142938
	.align 2, 0
_08142898: .4byte 0x0201c000
_0814289C: .4byte gTasks
_081428A0:
	ldr r2, _08142918 @ =gUnknown_0203931C
	ldr r0, _0814291C @ =gSprites
	mov r8, r0
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r6
	mov r1, r12
	adds r1, 0x8
	adds r6, r0, r1
	movs r7, 0
	ldrsh r1, [r6, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	ldr r3, [r2]
	orrs r3, r1
	str r3, [r2]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _0814292C
	mov r7, r9
	ldrh r1, [r7, 0x1C]
	ldr r0, _08142920 @ =0x000001ff
	ands r0, r1
	cmp r0, 0
	beq _0814292C
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	ldr r0, _08142924 @ =0x0000735f
	str r0, [sp]
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r0, _08142928 @ =sub_8142320
	str r0, [r4]
	b _08142938
	.align 2, 0
_08142918: .4byte gUnknown_0203931C
_0814291C: .4byte gSprites
_08142920: .4byte 0x000001ff
_08142924: .4byte 0x0000735f
_08142928: .4byte sub_8142320
_0814292C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r12
	ldr r1, _08142948 @ =sub_8142570
	str r1, [r0]
_08142938:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142948: .4byte sub_8142570
	thumb_func_end sub_8142484

	thumb_func_start sub_8142570
sub_8142570: @ 814294C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081429E0 @ =0xffff0000
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r3, 0
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r5, r0, 3
	ldr r0, _081429E4 @ =0x03004b38
	mov r12, r0
	mov r8, r1
	ldr r6, _081429E8 @ =gSprites
	movs r7, 0xD
	negs r7, r7
_0814297A:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	mov r2, r12
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _0814299C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1, 0x5]
_0814299C:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _0814297A
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xF
	bl sub_8143068
	movs r0, 0x69
	bl PlaySE
	ldr r1, _081429EC @ =gTasks
	mov r2, r8
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC8
	lsls r1, 1
	strh r1, [r0, 0xE]
	ldr r1, _081429F0 @ =sub_8142618
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081429E0: .4byte 0xffff0000
_081429E4: .4byte 0x03004b38
_081429E8: .4byte gSprites
_081429EC: .4byte gTasks
_081429F0: .4byte sub_8142618
	thumb_func_end sub_8142570

	thumb_func_start sub_8142618
sub_8142618: @ 81429F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _08142A34 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r5, r0, 3
	adds r1, r5, r7
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08142A38
	subs r2, 0x1
	strh r2, [r1, 0xE]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08142AAE
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x6E
	ble _08142AAE
	bl sub_81438C4
	b _08142AAE
	.align 2, 0
_08142A34: .4byte gTasks
_08142A38:
	movs r3, 0
	mov r9, r4
	ldr r0, _08142AC0 @ =gUnknown_0203931C
	mov r10, r0
	adds r4, r5, 0
	adds r7, 0x8
	mov r8, r7
	ldr r7, _08142AC4 @ =gSprites
	movs r1, 0xD
	negs r1, r1
	mov r12, r1
	movs r5, 0x4
_08142A50:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r4
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _08142A74
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x5]
	mov r0, r12
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
_08142A74:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08142A50
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _08142AC8 @ =0x0000735f
	str r1, [sp]
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _08142ACC @ =gTasks
	mov r2, r9
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x7
	strh r1, [r0, 0xE]
	ldr r1, _08142AD0 @ =sub_81426F8
	str r1, [r0]
_08142AAE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142AC0: .4byte gUnknown_0203931C
_08142AC4: .4byte gSprites
_08142AC8: .4byte 0x0000735f
_08142ACC: .4byte gTasks
_08142AD0: .4byte sub_81426F8
	thumb_func_end sub_8142618

	thumb_func_start sub_81426F8
sub_81426F8: @ 8142AD4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08142AF4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0xF
	ble _08142AFC
	ldr r0, _08142AF8 @ =sub_8142738
	str r0, [r2]
	b _08142B0A
	.align 2, 0
_08142AF4: .4byte gTasks
_08142AF8: .4byte sub_8142738
_08142AFC:
	adds r0, r1, 0x1
	strh r0, [r2, 0xE]
	ldr r1, _08142B10 @ =0x04000052
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	lsls r0, 8
	strh r0, [r1]
_08142B0A:
	pop {r0}
	bx r0
	.align 2, 0
_08142B10: .4byte 0x04000052
	thumb_func_end sub_81426F8

	thumb_func_start sub_8142738
sub_8142738: @ 8142B14
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _08142B60 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08142B64 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x78
	movs r2, 0x48
	movs r3, 0x6
	bl sub_81437A4
	ldr r2, _08142B68 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x10]
	movs r0, 0x78
	strh r0, [r1, 0xE]
	ldr r0, _08142B6C @ =sub_8142794
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142B60: .4byte gWindowConfig_81E71B4
_08142B64: .4byte gSaveBlock2
_08142B68: .4byte gTasks
_08142B6C: .4byte sub_8142794
	thumb_func_end sub_8142738

	thumb_func_start sub_8142794
sub_8142794: @ 8142B70
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08142B90 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08142B94
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _08142BE6
	.align 2, 0
_08142B90: .4byte gTasks
_08142B94:
	ldr r2, _08142BB4 @ =gSprites
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0xA0
	beq _08142BB8
	adds r0, r2, 0x1
	strh r0, [r1, 0x20]
	b _08142BE6
	.align 2, 0
_08142BB4: .4byte gSprites
_08142BB8:
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xF
	movs r3, 0x9
	bl MenuDrawTextWindow
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8143300
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08142BEC @ =gMenuText_HOFCongratulations
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _08142BF0 @ =sub_8142818
	str r0, [r4]
_08142BE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142BEC: .4byte gMenuText_HOFCongratulations
_08142BF0: .4byte sub_8142818
	thumb_func_end sub_8142794

	thumb_func_start sub_8142818
sub_8142818: @ 8142BF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142C20 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08142C1A
	movs r0, 0x4
	bl FadeOutBGM
	ldr r0, _08142C24 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142C28 @ =sub_8142850
	str r0, [r1]
_08142C1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142C20: .4byte gMain
_08142C24: .4byte gTasks
_08142C28: .4byte sub_8142850
	thumb_func_end sub_8142818

	thumb_func_start sub_8142850
sub_8142850: @ 8142C2C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08142C6C @ =gPlttBufferFaded
	ldr r1, _08142C70 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08142C74 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142C78 @ =sub_81428A0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142C6C: .4byte gPlttBufferFaded
_08142C70: .4byte gPlttBufferUnfaded
_08142C74: .4byte gTasks
_08142C78: .4byte sub_81428A0
	thumb_func_end sub_8142850

	thumb_func_start sub_81428A0
sub_81428A0: @ 8142C7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08142CA0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08142C9A
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _08142CA4 @ =sub_81439D0
	bl SetMainCallback2
_08142C9A:
	pop {r0}
	bx r0
	.align 2, 0
_08142CA0: .4byte gPaletteFade
_08142CA4: .4byte sub_81439D0
	thumb_func_end sub_81428A0

	thumb_func_start sub_81428CC
sub_81428CC: @ 8142CA8
	push {r4,r5,lr}
	ldr r0, _08142CC0 @ =gMain
	ldr r1, _08142CC4 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08142CE4
	lsls r0, 2
	ldr r1, _08142CC8 @ =_08142CCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08142CC0: .4byte gMain
_08142CC4: .4byte 0x0000043c
_08142CC8: .4byte _08142CCC
	.align 2, 0
_08142CCC:
	.4byte _08142CE4
	.4byte _08142D04
	.4byte _08142D18
	.4byte _08142D5C
	.4byte _08142D9C
	.4byte _08142DC8
_08142CE4:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_81433E0
	ldr r0, _08142CFC @ =gMain
	ldr r2, _08142D00 @ =0x0000043c
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08142DEE
	.align 2, 0
_08142CFC: .4byte gMain
_08142D00: .4byte 0x0000043c
_08142D04:
	bl sub_8143570
	ldr r1, _08142D10 @ =gMain
	ldr r3, _08142D14 @ =0x0000043c
	adds r1, r3
	b _08142DB8
	.align 2, 0
_08142D10: .4byte gMain
_08142D14: .4byte 0x0000043c
_08142D18:
	ldr r0, _08142D44 @ =sub_8141E38
	bl SetVBlankCallback
	ldr r3, _08142D48 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08142D4C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08142D50 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08142D54 @ =gMain
	ldr r4, _08142D58 @ =0x0000043c
	adds r1, r4
	b _08142DB8
	.align 2, 0
_08142D44: .4byte sub_8141E38
_08142D48: .4byte 0x04000208
_08142D4C: .4byte 0x04000200
_08142D50: .4byte 0x04000004
_08142D54: .4byte gMain
_08142D58: .4byte 0x0000043c
_08142D5C:
	ldr r0, _08142D88 @ =0x04000050
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_81435B8
	ldr r0, _08142D8C @ =0x0201c000
	adds r2, r0, 0
	ldr r1, _08142D90 @ =gUnknown_0840B57C
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5CD4
	ldr r1, _08142D94 @ =gMain
	ldr r4, _08142D98 @ =0x0000043c
	adds r1, r4
	b _08142DB8
	.align 2, 0
_08142D88: .4byte 0x04000050
_08142D8C: .4byte 0x0201c000
_08142D90: .4byte gUnknown_0840B57C
_08142D94: .4byte gMain
_08142D98: .4byte 0x0000043c
_08142D9C:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_80C5DCC
	lsls r0, 24
	cmp r0, 0
	beq _08142DEE
	ldr r1, _08142DC0 @ =gMain
	ldr r5, _08142DC4 @ =0x0000043c
	adds r1, r5
_08142DB8:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08142DEE
	.align 2, 0
_08142DC0: .4byte gMain
_08142DC4: .4byte 0x0000043c
_08142DC8:
	ldr r1, _08142DF4 @ =0x04000050
	ldr r2, _08142DF8 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xE2
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08142DFC @ =sub_8142A28
	movs r1, 0
	bl CreateTask
	ldr r0, _08142E00 @ =sub_8141E4C
	bl SetMainCallback2
_08142DEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142DF4: .4byte 0x04000050
_08142DF8: .4byte 0x00003f42
_08142DFC: .4byte sub_8142A28
_08142E00: .4byte sub_8141E4C
	thumb_func_end sub_81428CC

	thumb_func_start sub_8142A28
sub_8142A28: @ 8142E04
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x3
	bl sub_8125EC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08142E30
	ldr r0, _08142E28 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142E2C @ =sub_8142FEC
	str r0, [r1]
	b _08142EC6
	.align 2, 0
_08142E28: .4byte gTasks
_08142E2C: .4byte sub_8142FEC
_08142E30:
	ldr r2, _08142E68 @ =0x0201e000
	movs r3, 0
	ldrh r1, [r2, 0x8]
	ldr r4, _08142E6C @ =0x000001ff
	adds r0, r4, 0
	ands r0, r1
	ldr r7, _08142E70 @ =gTasks
	lsls r6, r5, 2
	cmp r0, 0
	beq _08142E5A
_08142E44:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x78
	cmp r3, 0x31
	bhi _08142E74
	ldrh r1, [r2, 0x8]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08142E44
_08142E5A:
	cmp r3, 0x31
	bhi _08142E74
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r7
	subs r1, r3, 0x1
	b _08142E7C
	.align 2, 0
_08142E68: .4byte 0x0201e000
_08142E6C: .4byte 0x000001ff
_08142E70: .4byte gTasks
_08142E74:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x31
_08142E7C:
	strh r1, [r0, 0x8]
	movs r0, 0xA
	bl sub_8053108
	ldr r2, _08142ECC @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0xA]
	movs r3, 0
	ldr r7, _08142ED0 @ =0x0600381a
	ldr r4, _08142ED4 @ =0x0600385a
_08142E94:
	lsls r1, r3, 1
	adds r2, r1, r7
	adds r0, r3, 0x3
	strh r0, [r2]
	adds r1, r4
	adds r0, 0x11
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x10
	bls _08142E94
	ldr r4, _08142ED8 @ =gWindowConfig_81E7198
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _08142ECC @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142EDC @ =sub_8142B04
	str r1, [r0]
_08142EC6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142ECC: .4byte gTasks
_08142ED0: .4byte 0x0600381a
_08142ED4: .4byte 0x0600385a
_08142ED8: .4byte gWindowConfig_81E7198
_08142EDC: .4byte sub_8142B04
	thumb_func_end sub_8142A28

	thumb_func_start sub_8142B04
sub_8142B04: @ 8142EE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r3, _08142F94 @ =0x0201e000
	movs r5, 0
	ldr r1, _08142F98 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	ldr r2, _08142F9C @ =gUnknown_0203931C
	cmp r5, r0
	bge _08142F1A
	adds r1, r0, 0
_08142F0E:
	adds r3, 0x78
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r1
	blt _08142F0E
_08142F1A:
	adds r4, r3, 0
	movs r0, 0
	str r0, [r2]
	mov r5, r8
	lsls r2, r5, 2
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r6
	strh r0, [r1, 0xC]
	strh r0, [r1, 0x10]
	movs r5, 0
	str r2, [sp, 0xC]
	ldr r6, _08142FA0 @ =0x000001ff
	adds r2, r1, 0
_08142F36:
	ldrh r1, [r4, 0x8]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _08142F46
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
_08142F46:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	cmp r5, 0x5
	bls _08142F36
	adds r4, r3, 0
	movs r5, 0
	ldr r1, _08142F98 @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r7, r0, 3
	adds r6, r7, r1
	str r6, [sp, 0x8]
	adds r1, 0x8
	mov r9, r1
	ldr r0, _08142FA4 @ =gUnknown_0840B564
	mov r10, r0
_08142F6A:
	ldrh r1, [r4, 0x8]
	ldr r2, _08142FA0 @ =0x000001ff
	adds r0, r2, 0
	ands r0, r1
	adds r6, r1, 0
	cmp r0, 0
	beq _0814300C
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _08142FB0
	lsls r1, r5, 3
	ldr r0, _08142FA8 @ =gUnknown_0840B534
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r0, _08142FAC @ =gUnknown_0840B53A
	adds r1, r0
	b _08142FBE
	.align 2, 0
_08142F94: .4byte 0x0201e000
_08142F98: .4byte gTasks
_08142F9C: .4byte gUnknown_0203931C
_08142FA0: .4byte 0x000001ff
_08142FA4: .4byte gUnknown_0840B564
_08142FA8: .4byte gUnknown_0840B534
_08142FAC: .4byte gUnknown_0840B53A
_08142FB0:
	lsls r1, r5, 3
	mov r0, r10
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r2, _08143004 @ =gUnknown_0840B56A
	adds r1, r2
_08142FBE:
	ldrh r2, [r1]
	lsls r0, r6, 23
	lsrs r0, 23
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldr r3, [r4]
	str r3, [sp]
	ldr r3, [r4, 0x4]
	str r3, [sp, 0x4]
	adds r3, r5, 0
	bl sub_81436BC
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08143008 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r6, 0xD
	negs r6, r6
	adds r2, r6, 0
	ands r3, r2
	movs r2, 0x4
	orrs r3, r2
	strb r3, [r1, 0x5]
	adds r1, r5, 0x5
	lsls r1, 1
	adds r1, r7
	add r1, r9
	strh r0, [r1]
	b _08143018
	.align 2, 0
_08143004: .4byte gUnknown_0840B56A
_08143008: .4byte gSprites
_0814300C:
	adds r0, r5, 0x5
	lsls r0, 1
	adds r0, r7
	add r0, r9
	movs r1, 0xFF
	strh r1, [r0]
_08143018:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	cmp r5, 0x5
	bls _08142F6A
	ldr r0, _0814308C @ =0xffff0000
	ldr r2, _08143090 @ =0x0000735f
	movs r1, 0xC
	bl BlendPalettes
	ldr r3, _08143094 @ =gStringVar1
	ldr r1, _08143098 @ =gMenuText_HOFNumber
	adds r0, r3, 0
	bl StringCopy
	adds r3, r0, 0
	movs r5, 0xFC
	strb r5, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0x6
	strb r0, [r3, 0x2]
	adds r3, 0x3
	ldr r0, _0814309C @ =gTasks
	ldr r4, [sp, 0xC]
	add r4, r8
	lsls r4, 3
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	adds r0, r3, 0
	bl ConvertIntToDecimalString
	adds r3, r0, 0
	strb r5, [r3]
	movs r0, 0x13
	strb r0, [r3, 0x1]
	movs r0, 0xF0
	strb r0, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r0, _08143094 @ =gStringVar1
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	ldr r0, _081430A0 @ =sub_8142CC8
	str r0, [r4]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814308C: .4byte 0xffff0000
_08143090: .4byte 0x0000735f
_08143094: .4byte gStringVar1
_08143098: .4byte gMenuText_HOFNumber
_0814309C: .4byte gTasks
_081430A0: .4byte sub_8142CC8
	thumb_func_end sub_8142B04

	thumb_func_start sub_8142CC8
sub_8142CC8: @ 81430A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081431AC @ =0x0201e000
	mov r8, r0
	movs r3, 0
	ldr r1, _081431B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r3, r0
	bge _081430DA
	adds r1, r0, 0
_081430CC:
	movs r0, 0x78
	add r8, r0
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	blt _081430CC
_081430DA:
	movs r3, 0
	lsls r6, r4, 2
	adds r0, r6, r4
	lsls r5, r0, 3
	ldr r1, _081431B4 @ =0x03004b38
	mov r10, r1
	ldr r2, _081431B8 @ =gSprites
	mov r12, r2
	movs r0, 0xD
	negs r0, r0
	mov r9, r0
	movs r7, 0x4
_081430F2:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	add r0, r10
	ldrh r1, [r0]
	cmp r1, 0xFF
	beq _08143112
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x5]
	mov r1, r9
	ands r1, r2
	orrs r1, r7
	strb r1, [r0, 0x5]
_08143112:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _081430F2
	adds r1, r6, r4
	lsls r1, 3
	ldr r2, _081431B0 @ =gTasks
	adds r5, r1, r2
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	adds r0, 0x5
	lsls r0, 1
	adds r0, r1
	ldr r1, _081431B0 @ =gTasks
	adds r1, 0x8
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081431B8 @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r1
	ldr r1, _081431BC @ =0xffff0000
	eors r0, r1
	ldr r2, _081431C0 @ =gUnknown_0203931C
	str r0, [r2]
	ldr r2, _081431C4 @ =0x0000735f
	movs r1, 0xC
	bl BlendPalettesUnfaded
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	mov r1, r8
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	ldr r0, _081431C8 @ =0x000001ff
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0814318E
	bl StopCryAndClearCrySongs
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_0814318E:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_8143088
	ldr r0, _081431CC @ =sub_8142DF4
	str r0, [r5]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081431AC: .4byte 0x0201e000
_081431B0: .4byte gTasks
_081431B4: .4byte 0x03004b38
_081431B8: .4byte gSprites
_081431BC: .4byte 0xffff0000
_081431C0: .4byte gUnknown_0203931C
_081431C4: .4byte 0x0000735f
_081431C8: .4byte 0x000001ff
_081431CC: .4byte sub_8142DF4
	thumb_func_end sub_8142CC8

	thumb_func_start sub_8142DF4
sub_8142DF4: @ 81431D0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08143264 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	adds r3, r1, 0
	cmp r0, 0
	beq _081432A0
	ldr r7, _08143268 @ =gTasks
	lsls r0, r6, 2
	adds r1, r0, r6
	lsls r3, r1, 3
	adds r4, r3, r7
	ldrh r2, [r4, 0x8]
	movs r5, 0x8
	ldrsh r1, [r4, r5]
	mov r8, r0
	cmp r1, 0
	beq _08143274
	subs r0, r2, 0x1
	strh r0, [r4, 0x8]
	movs r5, 0
	adds r7, 0x8
	mov r9, r7
	adds r7, r3, 0
_0814320C:
	adds r0, r5, 0x5
	lsls r0, 1
	adds r0, r7
	add r0, r9
	ldrb r1, [r0]
	cmp r1, 0xFF
	beq _0814323A
	ldr r0, _0814326C @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl DestroySprite
_0814323A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0814320C
	ldr r0, _08143268 @ =gTasks
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0814325C
	subs r0, r2, 0x1
	strh r0, [r1, 0xA]
_0814325C:
	ldr r0, _08143270 @ =sub_8142B04
	str r0, [r1]
	b _08143340
	.align 2, 0
_08143264: .4byte gMain
_08143268: .4byte gTasks
_0814326C: .4byte gSprites
_08143270: .4byte sub_8142B04
_08143274:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _0814328E
	bl StopCryAndClearCrySongs
	ldr r0, _08143294 @ =gMPlay_BGM
	ldr r1, _08143298 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_0814328E:
	ldr r0, _0814329C @ =sub_8142F78
	str r0, [r4]
	b _08143340
	.align 2, 0
_08143294: .4byte gMPlay_BGM
_08143298: .4byte 0x0000ffff
_0814329C: .4byte sub_8142F78
_081432A0:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _081432E4
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _081432C2
	bl StopCryAndClearCrySongs
	ldr r0, _081432D4 @ =gMPlay_BGM
	ldr r1, _081432D8 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_081432C2:
	ldr r0, _081432DC @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _081432E0 @ =sub_8142F78
	str r0, [r1]
	b _08143340
	.align 2, 0
_081432D4: .4byte gMPlay_BGM
_081432D8: .4byte 0x0000ffff
_081432DC: .4byte gTasks
_081432E0: .4byte sub_8142F78
_081432E4:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _08143314
	ldr r0, _0814330C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08143314
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	ldr r0, _08143310 @ =sub_8142CC8
	str r0, [r1]
	b _08143340
	.align 2, 0
_0814330C: .4byte gTasks
_08143310: .4byte sub_8142CC8
_08143314:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08143340
	ldr r1, _0814334C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	movs r5, 0xC
	ldrsh r1, [r2, r5]
	movs r3, 0x10
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	cmp r1, r0
	bge _08143340
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ldr r0, _08143350 @ =sub_8142CC8
	str r0, [r2]
_08143340:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814334C: .4byte gTasks
_08143350: .4byte sub_8142CC8
	thumb_func_end sub_8142DF4

	thumb_func_start sub_8142F78
sub_8142F78: @ 8143354
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08143390 @ =gPlttBufferFaded
	ldr r1, _08143394 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	ldr r0, _08143398 @ =0x0201c000
	adds r2, r0, 0
	ldr r1, _0814339C @ =gUnknown_0840B57C
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5E38
	ldr r1, _081433A0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081433A4 @ =sub_8142FCC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08143390: .4byte gPlttBufferFaded
_08143394: .4byte gPlttBufferUnfaded
_08143398: .4byte 0x0201c000
_0814339C: .4byte gUnknown_0840B57C
_081433A0: .4byte gTasks
_081433A4: .4byte sub_8142FCC
	thumb_func_end sub_8142F78

	thumb_func_start sub_8142FCC
sub_8142FCC: @ 81433A8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _081433C2
	adds r0, r4, 0
	bl DestroyTask
	bl ReturnFromHallOfFamePC
_081433C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8142FCC

	thumb_func_start sub_8142FEC
sub_8142FEC: @ 81433C8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081433FC @ =gMenuText_HOFCorrupt
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08143400 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143404 @ =sub_814302C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081433FC: .4byte gMenuText_HOFCorrupt
_08143400: .4byte gTasks
_08143404: .4byte sub_814302C
	thumb_func_end sub_8142FEC

	thumb_func_start sub_814302C
sub_814302C: @ 8143408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08143432
	ldr r0, _08143438 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08143432
	ldr r0, _0814343C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143440 @ =sub_8142F78
	str r0, [r1]
_08143432:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143438: .4byte gMain
_0814343C: .4byte gTasks
_08143440: .4byte sub_8142F78
	thumb_func_end sub_814302C

	thumb_func_start sub_8143068
sub_8143068: @ 8143444
	push {lr}
	lsls r2, r1, 24
	ldr r0, _08143460 @ =gMenuText_WelcomeToHOFAndDexRating
	movs r1, 0x80
	lsls r1, 17
	adds r2, r1
	lsrs r2, 24
	movs r1, 0
	movs r3, 0xF0
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08143460: .4byte gMenuText_WelcomeToHOFAndDexRating
	thumb_func_end sub_8143068

	thumb_func_start sub_8143088
sub_8143088: @ 8143464
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldr r7, _08143564 @ =gStringVar1
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0x28
	strb r0, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	mov r0, r9
	ldrh r2, [r0, 0x8]
	ldr r0, _08143568 @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _081434C6
	lsls r0, r2, 23
	lsrs r0, 23
	bl SpeciesToPokedexNum
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0814356C @ =0x0000ffff
	cmp r6, r0
	beq _081434C6
	ldr r1, _08143570 @ =gOtherText_Number2
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_081434C6:
	ldr r5, _08143564 @ =gStringVar1
	mov r1, r8
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r4, r10
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	adds r7, r5, 0
	movs r3, 0
	mov r1, r9
	ldrb r0, [r1, 0xA]
	str r4, [sp]
	mov r2, r8
	adds r2, 0x9
	str r2, [sp, 0xC]
	mov r6, r10
	adds r6, 0x3
	str r6, [sp, 0x8]
	cmp r0, 0xFF
	beq _08143516
	mov r2, r9
	adds r2, 0xA
_081434FC:
	adds r1, r7, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bhi _08143516
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081434FC
_08143516:
	adds r7, r3
	movs r2, 0xFF
	strb r2, [r7]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	ldr r1, _08143568 @ =0x000001ff
	ands r1, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08143574
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0xA0
	strb r0, [r7, 0x2]
	strb r2, [r7, 0x3]
	ldr r0, _08143564 @ =gStringVar1
	ldr r2, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	ldr r3, [sp]
	lsls r2, r3, 24
	lsrs r2, 24
	bl MenuPrint
	ldr r6, [sp, 0x8]
	lsls r1, r6, 24
	lsrs r1, 24
	mov r3, r10
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r2, 0x1D
	bl MenuZeroFillWindowRect
	b _081436C0
	.align 2, 0
_08143564: .4byte gStringVar1
_08143568: .4byte 0x000001ff
_0814356C: .4byte 0x0000ffff
_08143570: .4byte gOtherText_Number2
_08143574:
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0x3E
	strb r0, [r7, 0x2]
	adds r7, 0x3
	movs r0, 0xBA
	strb r0, [r7]
	adds r7, 0x1
	movs r3, 0
	ldr r2, _08143614 @ =gSpeciesNames
	mov r1, r9
	ldrh r0, [r1, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0xB
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0]
	mov r6, r8
	adds r6, 0x7
	str r6, [sp, 0x4]
	mov r1, r8
	adds r1, 0xD
	str r1, [sp, 0x10]
	cmp r0, 0xFF
	beq _081435E0
	adds r5, r2, 0
	movs r4, 0xB
_081435B0:
	adds r1, r7, r3
	mov r6, r9
	ldrh r0, [r6, 0x8]
	lsls r0, 23
	lsrs r0, 23
	muls r0, r4
	adds r0, r3, r0
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bhi _081435E0
	ldrh r0, [r6, 0x8]
	lsls r0, 23
	lsrs r0, 23
	muls r0, r4
	adds r0, r3, r0
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081435B0
_081435E0:
	adds r7, r3
	movs r0, 0
	strb r0, [r7]
	adds r7, 0x1
	mov r1, r9
	ldrh r0, [r1, 0x8]
	ldr r1, _08143618 @ =0x000001ff
	ands r1, r0
	cmp r1, 0x20
	beq _08143626
	cmp r1, 0x1D
	beq _08143626
	lsls r0, 23
	lsrs r0, 23
	mov r2, r9
	ldr r1, [r2, 0x4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0814361C
	cmp r0, 0xFE
	beq _08143620
	b _08143626
	.align 2, 0
_08143614: .4byte gSpeciesNames
_08143618: .4byte 0x000001ff
_0814361C:
	movs r0, 0xB5
	b _08143622
_08143620:
	movs r0, 0xB6
_08143622:
	strb r0, [r7]
	adds r7, 0x1
_08143626:
	movs r4, 0xFC
	strb r4, [r7]
	movs r3, 0x13
	mov r8, r3
	strb r3, [r7, 0x1]
	movs r0, 0xA0
	strb r0, [r7, 0x2]
	movs r6, 0xFF
	mov r10, r6
	strb r6, [r7, 0x3]
	ldr r5, _081436D0 @ =gStringVar1
	ldr r0, [sp, 0xC]
	lsls r1, r0, 24
	lsrs r1, 24
	ldr r3, [sp]
	lsls r2, r3, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	mov r6, r9
	ldrb r0, [r6, 0x9]
	lsrs r6, r0, 1
	ldr r1, _081436D4 @ =gOtherText_Level3
	adds r0, r5, 0
	bl StringCopy
	adds r7, r0, 0
	strb r4, [r7]
	movs r0, 0x14
	strb r0, [r7, 0x1]
	movs r0, 0x6
	strb r0, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	strb r4, [r7]
	mov r0, r8
	strb r0, [r7, 0x1]
	movs r0, 0x30
	strb r0, [r7, 0x2]
	mov r1, r10
	strb r1, [r7, 0x3]
	ldr r2, [sp, 0x4]
	lsls r1, r2, 24
	lsrs r1, 24
	ldr r3, [sp, 0x8]
	lsls r4, r3, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	mov r0, r9
	ldrh r6, [r0]
	ldr r1, _081436D8 @ =gOtherText_IDNumber
	adds r0, r5, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r2, [sp, 0x10]
	lsls r1, r2, 24
	lsrs r1, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl MenuPrint
_081436C0:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081436D0: .4byte gStringVar1
_081436D4: .4byte gOtherText_Level3
_081436D8: .4byte gOtherText_IDNumber
	thumb_func_end sub_8143088

	thumb_func_start sub_8143300
sub_8143300: @ 81436DC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsls r4, 24
	ldr r0, _081437A8 @ =gOtherText_Name
	lsrs r1, r5, 24
	mov r8, r1
	movs r2, 0x80
	lsls r2, 17
	adds r5, r2
	lsrs r5, 24
	lsrs r6, r4, 24
	adds r4, r2
	lsrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	ldr r0, _081437AC @ =gSaveBlock2
	mov r10, r0
	movs r1, 0xE
	add r8, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	mov r1, r8
	adds r2, r4, 0
	bl MenuPrint_RightAligned
	ldr r0, _081437B0 @ =gOtherText_IDNumber2
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	mov r0, r10
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldr r2, _081437B4 @ =gStringVar1
	mov r9, r2
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, r9
	mov r1, r8
	adds r2, r4, 0
	bl MenuPrint_RightAligned
	ldr r0, _081437B8 @ =gMainMenuString_Time
	adds r6, 0x5
	lsls r6, 24
	lsrs r6, 24
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	mov r0, r10
	ldrh r1, [r0, 0xE]
	mov r0, r9
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2]
	movs r0, 0xF0
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	adds r2, 0x3
	mov r0, r10
	ldrb r1, [r0, 0x10]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	bl MenuPrint_RightAligned
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081437A8: .4byte gOtherText_Name
_081437AC: .4byte gSaveBlock2
_081437B0: .4byte gOtherText_IDNumber2
_081437B4: .4byte gStringVar1
_081437B8: .4byte gMainMenuString_Time
	thumb_func_end sub_8143300

	thumb_func_start sub_81433E0
sub_81433E0: @ 81437BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x8
	strh r1, [r0]
	adds r0, 0xA
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xA
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _08143928 @ =gHallOfFame_Gfx
	mov r9, r1
	mov r2, sp
	movs r6, 0
	ldr r1, _0814392C @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143930 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08143820:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08143820
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _0814392C @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r9
	bl LZ77UnCompVram
	movs r1, 0
	ldr r3, _08143934 @ =0x06003800
	movs r2, 0x1
_0814388E:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3F
	bls _0814388E
	movs r1, 0
	ldr r5, _08143938 @ =0x02000000
	ldr r3, _0814393C @ =0x06003b80
	movs r2, 0x1
_081438A6:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xBF
	bls _081438A6
	movs r1, 0
	ldr r4, _08143940 @ =0x06003000
	movs r3, 0x2
	ldr r2, _08143944 @ =0x000003ff
_081438BE:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _081438BE
	adds r2, r5, 0
	movs r3, 0x80
	lsls r3, 7
	mov r4, sp
	movs r6, 0
	ldr r1, _0814392C @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143930 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_081438E6:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _081438E6
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _08143948 @ =gHallOfFame_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143928: .4byte gHallOfFame_Gfx
_0814392C: .4byte 0x040000d4
_08143930: .4byte 0x81000800
_08143934: .4byte 0x06003800
_08143938: .4byte 0x02000000
_0814393C: .4byte 0x06003b80
_08143940: .4byte 0x06003000
_08143944: .4byte 0x000003ff
_08143948: .4byte gHallOfFame_Pal
	thumb_func_end sub_81433E0

	thumb_func_start sub_8143570
sub_8143570: @ 814394C
	push {r4,lr}
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08143984 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _08143988 @ =gUnknown_0840B514
	bl LoadCompressedObjectPic
	ldr r0, _0814398C @ =gUnknown_0840B524
	bl LoadCompressedObjectPalette
	ldr r4, _08143990 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143984: .4byte gReservedSpritePaletteCount
_08143988: .4byte gUnknown_0840B514
_0814398C: .4byte gUnknown_0840B524
_08143990: .4byte gWindowConfig_81E71B4
	thumb_func_end sub_8143570

	thumb_func_start sub_81435B8
sub_81435B8: @ 8143994
	ldr r1, _081439B4 @ =0x0400000a
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	subs r2, 0xFD
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xDA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081439B4: .4byte 0x0400000a
	thumb_func_end sub_81435B8

	thumb_func_start sub_81435DC
sub_81435DC: @ 81439B8
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, [r2, 0x20]
	ldr r0, [r2, 0x30]
	cmp r1, r0
	beq _08143A0E
	ldrh r3, [r2, 0x20]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r4, 0x30
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _081439D8
	adds r0, r3, 0
	adds r0, 0xF
	strh r0, [r2, 0x20]
_081439D8:
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _081439E8
	adds r0, r3, 0
	subs r0, 0xF
	strh r0, [r2, 0x20]
_081439E8:
	ldrh r3, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _081439FC
	adds r0, r3, 0
	adds r0, 0xA
	strh r0, [r2, 0x22]
_081439FC:
	ldrh r3, [r2, 0x22]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _08143A16
	adds r0, r3, 0
	subs r0, 0xA
	strh r0, [r2, 0x22]
	b _08143A16
_08143A0E:
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	ldr r0, _08143A1C @ =nullsub_81
	str r0, [r2, 0x1C]
_08143A16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143A1C: .4byte nullsub_81
	thumb_func_end sub_81435DC

	thumb_func_start nullsub_81
nullsub_81: @ 8143A20
	bx lr
	thumb_func_end nullsub_81

	thumb_func_start sub_8143648
sub_8143648: @ 8143A24
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _08143A4C @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _08143A50 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08143A54 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _08143A58 @ =gSpriteAnimTable_81E7C64
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143A4C: .4byte gUnknown_02024E8C
_08143A50: .4byte gUnknown_0840B6B8
_08143A54: .4byte gUnknown_0840B69C
_08143A58: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end sub_8143648

	thumb_func_start sub_8143680
sub_8143680: @ 8143A5C
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _08143A88 @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _08143A8C @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08143A90 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _08143A94 @ =gUnknown_081EC2A4
	ldr r0, [r0]
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143A88: .4byte gUnknown_02024E8C
_08143A8C: .4byte gUnknown_0840B6B8
_08143A90: .4byte gUnknown_0840B69C
_08143A94: .4byte gUnknown_081EC2A4
	thumb_func_end sub_8143680

	thumb_func_start sub_81436BC
sub_81436BC: @ 8143A98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	mov r10, r2
	mov r8, r3
	ldr r7, [sp, 0x34]
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r0, r6, 3
	ldr r1, _08143B6C @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08143B70 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08143B74 @ =gUnknown_0840B5A0
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	adds r0, r6, 0
	ldr r1, [sp, 0x30]
	adds r2, r7, 0
	bl species_and_otid_get_pal
	lsls r4, r5, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8143648
	ldr r0, _08143B78 @ =gUnknown_02024E8C
	mov r5, r9
	lsls r5, 16
	asrs r5, 16
	mov r9, r5
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	movs r3, 0xA
	mov r2, r8
	subs r3, r2
	lsls r3, 24
	lsrs r3, 24
	mov r1, r9
	mov r2, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08143B7C @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143B6C: .4byte gMonFrontPicTable
_08143B70: .4byte gMonFrontPicCoords
_08143B74: .4byte gUnknown_0840B5A0
_08143B78: .4byte gUnknown_02024E8C
_08143B7C: .4byte gSprites
	thumb_func_end sub_81436BC

	thumb_func_start sub_81437A4
sub_81437A4: @ 8143B80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	mov r10, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r6, 16
	lsrs r6, 16
	lsls r7, r0, 3
	ldr r1, _08143C30 @ =gTrainerFrontPicTable
	mov r8, r1
	add r8, r7
	ldr r1, _08143C34 @ =gTrainerFrontPicCoords
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _08143C38 @ =gUnknown_0840B5A0
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _08143C3C @ =gTrainerFrontPicPaletteTable
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8143680
	ldr r0, _08143C40 @ =gUnknown_02024E8C
	mov r1, r9
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08143C44 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143C30: .4byte gTrainerFrontPicTable
_08143C34: .4byte gTrainerFrontPicCoords
_08143C38: .4byte gUnknown_0840B5A0
_08143C3C: .4byte gTrainerFrontPicPaletteTable
_08143C40: .4byte gUnknown_02024E8C
_08143C44: .4byte gSprites
	thumb_func_end sub_81437A4

	thumb_func_start sub_814386C
sub_814386C: @ 8143C48
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x78
	ble _08143C5E
	adds r0, r5, 0
	bl DestroySprite
	b _08143C96
_08143C5E:
	adds r0, r1, 0x1
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, 0x8
	ldr r1, _08143C9C @ =gSineTable
	lsls r4, 1
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	muls r0, r1
	cmp r0, 0
	bge _08143C8C
	adds r0, 0xFF
_08143C8C:
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x4
	strh r0, [r5, 0x2E]
_08143C96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08143C9C: .4byte gSineTable
	thumb_func_end sub_814386C

	thumb_func_start sub_81438C4
sub_81438C4: @ 8143CA0
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x7
	ands r2, r0
	negs r2, r2
	ldr r0, _08143D10 @ =gSpriteTemplate_840B7A4
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r4, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08143D14 @ =gSprites
	adds r4, r1, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _08143D18
	movs r0, 0
	b _08143D1A
	.align 2, 0
_08143D10: .4byte gSpriteTemplate_840B7A4
_08143D14: .4byte gSprites
_08143D18:
	movs r0, 0x1
_08143D1A:
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81438C4

	thumb_func_start sub_8143948
sub_8143948: @ 8143D24
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8143948

	thumb_func_start sub_814395C
sub_814395C: @ 8143D38
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _08143D94 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08143D8E
	ldr r0, _08143D98 @ =gUnknown_02039324
	ldrb r0, [r0]
	cmp r0, 0
	beq _08143D8E
	ldr r2, _08143D9C @ =gTasks
	ldr r0, _08143DA0 @ =gUnknown_02039322
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08143DA4 @ =sub_8143B68
	cmp r1, r0
	bne _08143D8E
	bl sub_8143948
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _08143DA8 @ =gUnknown_02039325
	movs r0, 0x1
	strb r0, [r1]
_08143D8E:
	pop {r0}
	bx r0
	.align 2, 0
_08143D94: .4byte gMain
_08143D98: .4byte gUnknown_02039324
_08143D9C: .4byte gTasks
_08143DA0: .4byte gUnknown_02039322
_08143DA4: .4byte sub_8143B68
_08143DA8: .4byte gUnknown_02039325
	thumb_func_end sub_814395C

	thumb_func_start sub_81439D0
sub_81439D0: @ 8143DAC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	bl sub_8144130
	movs r0, 0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetTasks
	ldr r0, _08143ECC @ =sub_8143B38
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08143ED0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x16]
	strh r1, [r0, 0x1E]
	movs r1, 0x1
	strh r1, [r0, 0x22]
_08143DEA:
	movs r0, 0
	adds r1, r7, 0
	bl sub_8144ECC
	lsls r0, 24
	cmp r0, 0
	beq _08143DEA
	ldr r6, _08143ED0 @ =gTasks
	lsls r5, r7, 2
	adds r5, r7
	lsls r5, 3
	adds r5, r6
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	movs r1, 0
	mov r9, r1
	movs r2, 0
	mov r8, r2
	movs r1, 0x28
	strh r1, [r0, 0x8]
	ldr r4, _08143ED4 @ =gWindowConfig_81E7208
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08143ED8 @ =gUnknown_0840B7BC
	movs r1, 0x80
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08143EDC @ =gUnknown_0840B7FC
	ldr r1, _08143EE0 @ =0x0600bee0
	movs r2, 0x20
	bl CpuSet
	ldr r1, _08143EE4 @ =0x04000012
	ldr r2, _08143EE8 @ =0x0000fffc
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08143EEC @ =sub_81441B8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	strh r7, [r1, 0xA]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	negs r0, r0
	mov r1, r8
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08143EF0 @ =0x04000208
	ldrh r2, [r3]
	mov r0, r8
	strh r0, [r3]
	ldr r4, _08143EF4 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143EF8 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08143EFC @ =sub_8143948
	bl SetVBlankCallback
	ldr r0, _08143F00 @ =0x000001c7
	bl m4aSongNumStart
	ldr r0, _08143F04 @ =sub_814395C
	bl SetMainCallback2
	ldr r0, _08143F08 @ =gUnknown_02039325
	mov r1, r9
	strb r1, [r0]
	ldr r4, _08143F0C @ =0x0201c000
	bl sub_81458DC
	adds r0, r4, 0
	adds r0, 0x82
	mov r2, r8
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	ldr r0, _08143F10 @ =gUnknown_02039322
	strh r7, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143ECC: .4byte sub_8143B38
_08143ED0: .4byte gTasks
_08143ED4: .4byte gWindowConfig_81E7208
_08143ED8: .4byte gUnknown_0840B7BC
_08143EDC: .4byte gUnknown_0840B7FC
_08143EE0: .4byte 0x0600bee0
_08143EE4: .4byte 0x04000012
_08143EE8: .4byte 0x0000fffc
_08143EEC: .4byte sub_81441B8
_08143EF0: .4byte 0x04000208
_08143EF4: .4byte 0x04000200
_08143EF8: .4byte 0x04000004
_08143EFC: .4byte sub_8143948
_08143F00: .4byte 0x000001c7
_08143F04: .4byte sub_814395C
_08143F08: .4byte gUnknown_02039325
_08143F0C: .4byte 0x0201c000
_08143F10: .4byte gUnknown_02039322
	thumb_func_end sub_81439D0

	thumb_func_start sub_8143B38
sub_8143B38: @ 8143F14
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08143F38 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08143F34
	ldr r0, _08143F3C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143F40 @ =sub_8143B68
	str r0, [r1]
_08143F34:
	pop {r0}
	bx r0
	.align 2, 0
_08143F38: .4byte gPaletteFade
_08143F3C: .4byte gTasks
_08143F40: .4byte sub_8143B68
	thumb_func_end sub_8143B38

	thumb_func_start sub_8143B68
sub_8143B68: @ 8143F44
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08143F78 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08143F80
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1E
	strh r1, [r0, 0x8]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x20]
	ldr r0, _08143F7C @ =sub_8143EBC
	b _08143FCA
	.align 2, 0
_08143F78: .4byte gTasks
_08143F7C: .4byte sub_8143EBC
_08143F80:
	ldr r0, _08143FA8 @ =gUnknown_02039320
	strh r1, [r0]
	ldrh r2, [r4, 0x1E]
	movs r3, 0x1E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _08143FB0
	strh r2, [r4, 0x22]
	strh r1, [r4, 0x1E]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08143FAC @ =sub_8143BFC
	b _08143FCA
	.align 2, 0
_08143FA8: .4byte gUnknown_02039320
_08143FAC: .4byte sub_8143BFC
_08143FB0:
	cmp r0, 0x2
	bne _08143FCC
	strh r2, [r4, 0x22]
	strh r1, [r4, 0x1E]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08143FD4 @ =sub_8143CC0
_08143FCA:
	str r0, [r4]
_08143FCC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143FD4: .4byte sub_8143CC0
	thumb_func_end sub_8143B68

	thumb_func_start sub_8143BFC
sub_8143BFC: @ 8143FD8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08144010 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08144008
	movs r0, 0x80
	lsls r0, 19
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_81450AC
	ldr r1, _08144014 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08144018 @ =c2_080C9BFC
	str r1, [r0]
_08144008:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08144010: .4byte gPaletteFade
_08144014: .4byte gTasks
_08144018: .4byte c2_080C9BFC
	thumb_func_end sub_8143BFC

	thumb_func_start c2_080C9BFC
c2_080C9BFC: @ 814401C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _08144084 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r0, [r5, 0x16]
	adds r1, r4, 0
	bl sub_8144ECC
	lsls r0, 24
	cmp r0, 0
	beq _0814407C
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08144088 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0814408C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08144090 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08144094 @ =sub_8143948
	bl SetVBlankCallback
	ldr r0, _08144098 @ =sub_8143B38
	str r0, [r5]
_0814407C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08144084: .4byte gTasks
_08144088: .4byte 0x04000208
_0814408C: .4byte 0x04000200
_08144090: .4byte 0x04000004
_08144094: .4byte sub_8143948
_08144098: .4byte sub_8143B38
	thumb_func_end c2_080C9BFC

	thumb_func_start sub_8143CC0
sub_8143CC0: @ 814409C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081440D4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _081440CC
	movs r0, 0x80
	lsls r0, 19
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_81450AC
	ldr r1, _081440D8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081440DC @ =sub_8143D04
	str r1, [r0]
_081440CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081440D4: .4byte gPaletteFade
_081440D8: .4byte gTasks
_081440DC: .4byte sub_8143D04
	thumb_func_end sub_8143CC0

	thumb_func_start sub_8143D04
sub_8143D04: @ 81440E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _081441A4 @ =gMain
	ldr r1, _081441A8 @ =0x0000043c
	adds r1, r0
	mov r8, r1
	ldrb r7, [r1]
	cmp r7, 0
	beq _08144100
	cmp r7, 0x1
	beq _081441E8
_08144100:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _081441AC @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _081441B0 @ =gBirchHelpGfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _081441B4 @ =gBirchGrassTilemap
	ldr r1, _081441B8 @ =0x06003800
	bl LZ77UnCompVram
	ldr r0, _081441BC @ =0x0840281a
	movs r1, 0x1
	movs r2, 0x3E
	bl LoadPalette
	movs r1, 0
	ldr r4, _081441C0 @ =0x0201e000
	movs r3, 0x11
	ldr r2, _081441C4 @ =0x000007ff
_08144132:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08144132
	movs r1, 0
	ldr r2, _081441C8 @ =0x0201f800
	ldr r6, _081441CC @ =gUnknown_0840CAA0
	ldr r0, _081441D0 @ =0xfffff000
	adds r5, r2, r0
	movs r4, 0x22
	ldr r3, _081441C4 @ =0x000007ff
_0814414E:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _0814414E
	movs r1, 0
	ldr r5, _081441D4 @ =0x0201f000
	movs r4, 0x33
	ldr r3, _081441C4 @ =0x000007ff
_08144164:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08144164
	movs r0, 0
	strh r0, [r2]
	ldr r1, _081441D8 @ =0x000053ff
	adds r0, r1, 0
	strh r0, [r2, 0x2]
	ldr r1, _081441DC @ =0x0000529f
	adds r0, r1, 0
	strh r0, [r2, 0x4]
	ldr r1, _081441E0 @ =0x00007e94
	adds r0, r1, 0
	strh r0, [r2, 0x6]
	adds r0, r6, 0
	bl LoadSpriteSheet
	ldr r0, _081441E4 @ =gUnknown_0840CAB0
	bl LoadSpritePalette
	ldr r1, _081441A4 @ =gMain
	ldr r2, _081441A8 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0814426C
	.align 2, 0
_081441A4: .4byte gMain
_081441A8: .4byte 0x0000043c
_081441AC: .4byte gReservedSpritePaletteCount
_081441B0: .4byte gBirchHelpGfx
_081441B4: .4byte gBirchGrassTilemap
_081441B8: .4byte 0x06003800
_081441BC: .4byte 0x0840281a
_081441C0: .4byte 0x0201e000
_081441C4: .4byte 0x000007ff
_081441C8: .4byte 0x0201f800
_081441CC: .4byte gUnknown_0840CAA0
_081441D0: .4byte 0xfffff000
_081441D4: .4byte 0x0201f000
_081441D8: .4byte 0x000053ff
_081441DC: .4byte 0x0000529f
_081441E0: .4byte 0x00007e94
_081441E4: .4byte gUnknown_0840CAB0
_081441E8:
	ldr r0, _0814427C @ =sub_8144514
	movs r1, 0
	bl CreateTask
	ldr r2, _08144280 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	movs r5, 0
	strh r0, [r4, 0xE]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	strh r7, [r0, 0x8]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	strh r6, [r0, 0xA]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r4, 0x16]
	strh r1, [r0, 0xC]
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08144284 @ =0x0400001c
	strh r5, [r0]
	ldr r1, _08144288 @ =0x0400001e
	movs r0, 0x20
	strh r0, [r1]
	subs r1, 0x10
	ldr r2, _0814428C @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	mov r1, r9
	mov r0, r8
	strb r1, [r0]
	ldr r0, _08144290 @ =gUnknown_0203935C
	strh r5, [r0]
	ldr r0, _08144294 @ =sub_8143B38
	str r0, [r4]
_0814426C:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814427C: .4byte sub_8144514
_08144280: .4byte gTasks
_08144284: .4byte 0x0400001c
_08144288: .4byte 0x0400001e
_0814428C: .4byte 0x00000703
_08144290: .4byte gUnknown_0203935C
_08144294: .4byte sub_8143B38
	thumb_func_end sub_8143D04

	thumb_func_start sub_8143EBC
sub_8143EBC: @ 8144298
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081442BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x20]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _081442C0
	subs r0, 0x1
	strh r0, [r4, 0x20]
	b _081442D4
	.align 2, 0
_081442BC: .4byte gTasks
_081442C0:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0xC
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081442DC @ =sub_8143F04
	str r0, [r4]
_081442D4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081442DC: .4byte sub_8143F04
	thumb_func_end sub_8143EBC

	thumb_func_start sub_8143F04
sub_8143F04: @ 81442E0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0814430C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144306
	adds r0, r4, 0
	bl sub_81450AC
	ldr r0, _08144310 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08144314 @ =sub_8143F3C
	str r0, [r1]
_08144306:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814430C: .4byte gPaletteFade
_08144310: .4byte gTasks
_08144314: .4byte sub_8143F3C
	thumb_func_end sub_8143F04

	thumb_func_start sub_8143F3C
sub_8143F3C: @ 8144318
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl sub_8144130
	bl ResetPaletteFade
	movs r1, 0xE0
	lsls r1, 6
	movs r0, 0
	movs r2, 0
	bl sub_8145128
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _081443A0 @ =0x04000008
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _081443A4 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _081443A8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081443AC @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081443B0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x8]
	ldr r1, _081443B4 @ =sub_8143FDC
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081443A0: .4byte 0x04000008
_081443A4: .4byte 0x04000208
_081443A8: .4byte 0x04000200
_081443AC: .4byte 0x04000004
_081443B0: .4byte gTasks
_081443B4: .4byte sub_8143FDC
	thumb_func_end sub_8143F3C

	thumb_func_start sub_8143FDC
sub_8143FDC: @ 81443B8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081443DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _081443E0
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _081443F4
	.align 2, 0
_081443DC: .4byte gTasks
_081443E0:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0x6
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081443FC @ =sub_8144024
	str r0, [r4]
_081443F4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081443FC: .4byte sub_8144024
	thumb_func_end sub_8143FDC

	thumb_func_start sub_8144024
sub_8144024: @ 8144400
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08144450 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08144446
	movs r0, 0xE0
	lsls r0, 6
	movs r1, 0
	bl sub_81452D0
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08144454 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE1
	lsls r1, 5
	strh r1, [r0, 0x8]
	ldr r1, _08144458 @ =sub_8144080
	str r1, [r0]
_08144446:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08144450: .4byte gPaletteFade
_08144454: .4byte gTasks
_08144458: .4byte sub_8144080
	thumb_func_end sub_8144024

	thumb_func_start sub_8144080
sub_8144080: @ 814445C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081444A8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081444E0
	ldr r1, _081444AC @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _0814448A
	ldr r0, _081444B0 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _081444BC
_0814448A:
	movs r0, 0x4
	bl FadeOutBGM
	movs r0, 0x1
	negs r0, r0
	ldr r1, _081444B4 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081444B8 @ =sub_8144114
	str r0, [r4]
	b _081444E0
	.align 2, 0
_081444A8: .4byte gPaletteFade
_081444AC: .4byte gTasks
_081444B0: .4byte gMain
_081444B4: .4byte 0x0000ffff
_081444B8: .4byte sub_8144114
_081444BC:
	ldr r0, _081444E8 @ =0x00001be8
	cmp r1, r0
	bne _081444C8
	movs r0, 0x8
	bl FadeOutBGM
_081444C8:
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	ldr r0, _081444EC @ =0x00001ab8
	cmp r1, r0
	bne _081444DA
	movs r0, 0xE4
	lsls r0, 1
	bl m4aSongNumStart
_081444DA:
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
_081444E0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081444E8: .4byte 0x00001be8
_081444EC: .4byte 0x00001ab8
	thumb_func_end sub_8144080

	thumb_func_start sub_8144114
sub_8144114: @ 81444F0
	push {lr}
	ldr r0, _08144508 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144504
	movs r0, 0xFF
	bl SoftReset
_08144504:
	pop {r0}
	bx r0
	.align 2, 0
_08144508: .4byte gPaletteFade
	thumb_func_end sub_8144114

	thumb_func_start sub_8144130
sub_8144130: @ 814450C
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x1C
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3E
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _08144580 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08144584 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08144588 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _0814458C @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _08144590 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x8
	bx lr
	.align 2, 0
_08144580: .4byte 0x040000d4
_08144584: .4byte 0x8100c000
_08144588: .4byte 0x85000100
_0814458C: .4byte 0x05000002
_08144590: .4byte 0x810001ff
	thumb_func_end sub_8144130

	thumb_func_start sub_81441B8
sub_81441B8: @ 8144594
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081445C0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0xA
	bhi _081445F4
	lsls r0, 2
	ldr r1, _081445C4 @ =_081445C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081445C0: .4byte gTasks
_081445C4: .4byte _081445C8
	.align 2, 0
_081445C8:
	.4byte _081445F4
	.4byte _08144634
	.4byte _08144654
	.4byte _08144734
	.4byte _08144768
	.4byte _081447D4
	.4byte _081445F4
	.4byte _081445F4
	.4byte _081445F4
	.4byte _081445F4
	.4byte _08144804
_081445F4:
	ldr r0, _0814462C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08144606
	b _08144822
_08144606:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x1
	strh r1, [r0, 0x8]
	movs r1, 0x58
	strh r1, [r0, 0xE]
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r2, [r0, 0x24]
	ldr r0, _08144630 @ =gUnknown_02039320
	strh r2, [r0]
	b _08144822
	.align 2, 0
_0814462C: .4byte gPaletteFade
_08144630: .4byte gUnknown_02039320
_08144634:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0814464C
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _08144822
_0814464C:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08144822
_08144654:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _081446FC @ =0x0000feff
	ands r0, r1
	strh r0, [r2]
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r3, r0, r6
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r4, r0, r6
	ldr r1, [r4]
	ldr r0, _08144700 @ =sub_8143B68
	mov r8, r2
	cmp r1, r0
	bne _0814472E
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0x30
	bgt _08144728
	movs r4, 0
	ldr r7, _08144704 @ =gCreditsEntryPointerTable
	adds r6, r3, 0
_0814468C:
	movs r2, 0xC
	ldrsh r1, [r6, r2]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r4
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsls r2, r4, 25
	movs r3, 0x90
	lsls r3, 20
	adds r2, r3
	lsrs r2, 24
	movs r1, 0
	movs r3, 0xF0
	bl sub_8072BD8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0814468C
	ldr r3, _08144708 @ =gTasks
	mov r0, r8
	adds r1, r0, r5
	lsls r1, 3
	adds r1, r3
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xA
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r3
	movs r2, 0x1
	strh r2, [r0, 0x24]
	movs r2, 0xA
	ldrsh r1, [r1, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r3, 0x22
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _08144710
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _0814470C @ =0x0000328d
	b _08144716
	.align 2, 0
_081446FC: .4byte 0x0000feff
_08144700: .4byte sub_8143B68
_08144704: .4byte gCreditsEntryPointerTable
_08144708: .4byte gTasks
_0814470C: .4byte 0x0000328d
_08144710:
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _08144724 @ =0x00001967
_08144716:
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08144822
	.align 2, 0
_08144724: .4byte 0x00001967
_08144728:
	movs r0, 0xA
	strh r0, [r3, 0x8]
	b _08144822
_0814472E:
	movs r0, 0
	strh r0, [r4, 0x24]
	b _08144822
_08144734:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08144764 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144822
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x8D
	strh r1, [r0, 0xE]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _08144822
	.align 2, 0
_08144764: .4byte gPaletteFade
_08144768:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08144780
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _08144822
_08144780:
	ldrb r0, [r4, 0xC]
	ldrb r1, [r4, 0xA]
	bl sub_8144454
	lsls r0, 24
	cmp r0, 0
	beq _08144796
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08144822
_08144796:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	movs r1, 0x22
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _081447BC
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _081447B8 @ =0x0000328d
	b _081447C2
	.align 2, 0
_081447B8: .4byte 0x0000328d
_081447BC:
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _081447D0 @ =0x00001967
_081447C2:
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08144822
	.align 2, 0
_081447D0: .4byte 0x00001967
_081447D4:
	ldr r0, _081447FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144822
	movs r0, 0
	movs r1, 0x9
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08144800 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	b _08144822
	.align 2, 0
_081447FC: .4byte gPaletteFade
_08144800: .4byte gTasks
_08144804:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r2, 0xA
	ldrsh r1, [r0, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	movs r1, 0x1
	strh r1, [r0, 0x10]
	adds r0, r5, 0
	bl DestroyTask
_08144822:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81441B8

	thumb_func_start sub_8144454
sub_8144454: @ 8144830
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	lsls r1, 24
	lsrs r2, r1, 24
	adds r5, r2, 0
	ldr r4, _081448E4 @ =gTasks
	cmp r3, 0x6
	bne _08144850
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_08144850:
	cmp r3, 0xC
	bne _08144862
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x16]
	strh r1, [r0, 0x1E]
_08144862:
	cmp r3, 0x12
	bne _08144872
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_08144872:
	cmp r3, 0x18
	bne _08144886
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x16]
	movs r1, 0x1
	strh r1, [r0, 0x1E]
_08144886:
	cmp r3, 0x1E
	bne _08144896
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_08144896:
	cmp r3, 0x23
	bne _081448AA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x3
	strh r1, [r0, 0x16]
	movs r1, 0x1
	strh r1, [r0, 0x1E]
_081448AA:
	cmp r3, 0x28
	bne _081448BA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_081448BA:
	cmp r6, 0x2D
	bne _081448CE
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x4
	strh r1, [r0, 0x16]
	movs r1, 0x1
	strh r1, [r0, 0x1E]
_081448CE:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r4
	movs r1, 0x1E
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _081448E8
	movs r0, 0
	b _081448EA
	.align 2, 0
_081448E4: .4byte gTasks
_081448E8:
	movs r0, 0x1
_081448EA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8144454

	thumb_func_start sub_8144514
sub_8144514: @ 81448F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _08144924 @ =0x0201c000
	ldr r3, _08144928 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r2, r0, r3
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _0814492C
	cmp r0, 0x1
	bgt _08144918
	b _08144A34
_08144918:
	cmp r0, 0x2
	beq _08144960
	cmp r0, 0x3
	bne _08144922
	b _08144A20
_08144922:
	b _08144A34
	.align 2, 0
_08144924: .4byte 0x0201c000
_08144928: .4byte gTasks
_0814492C:
	adds r0, r6, 0
	adds r0, 0x84
	ldrh r0, [r0]
	cmp r0, 0
	bne _0814494A
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08144A34
_0814494A:
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x24]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	b _08144A32
_08144960:
	adds r0, r6, 0
	adds r0, 0x82
	ldrh r1, [r0]
	mov r9, r0
	cmp r1, 0x41
	beq _08144A34
	movs r4, 0xA
	ldrsh r1, [r2, r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r0]
	ldr r0, _081449C8 @ =sub_8143B68
	cmp r1, r0
	bne _08144A34
	adds r7, r6, 0
	adds r7, 0x86
	ldrh r0, [r7]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	ldr r4, _081449CC @ =gUnknown_0840CA00
	adds r5, r6, 0
	adds r5, 0x84
	ldrh r3, [r5]
	lsls r2, r3, 1
	adds r1, r2, r4
	ldrb r1, [r1]
	adds r4, 0x1
	adds r2, r4
	ldrb r2, [r2]
	bl sub_81456B4
	lsls r0, 24
	lsrs r2, r0, 24
	ldrh r1, [r7]
	adds r0, r6, 0
	adds r0, 0x88
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bge _081449D4
	adds r0, r1, 0x1
	strh r0, [r7]
	ldr r1, _081449D0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x32
	b _081449E6
	.align 2, 0
_081449C8: .4byte sub_8143B68
_081449CC: .4byte gUnknown_0840CA00
_081449D0: .4byte gSprites
_081449D4:
	movs r0, 0
	strh r0, [r7]
	ldr r1, _081449FC @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x80
	lsls r1, 2
_081449E6:
	strh r1, [r0, 0x34]
	mov r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, 0x2
	bne _08144A00
	movs r0, 0
	b _08144A02
	.align 2, 0
_081449FC: .4byte gSprites
_08144A00:
	adds r0, 0x1
_08144A02:
	strh r0, [r5]
	ldr r0, _08144A1C @ =gTasks
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x32
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08144A34
	.align 2, 0
_08144A1C: .4byte gTasks
_08144A20:
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08144A30
	subs r0, r1, 0x1
	strh r0, [r2, 0xE]
	b _08144A34
_08144A30:
	movs r0, 0x1
_08144A32:
	strh r0, [r2, 0x8]
_08144A34:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8144514

	thumb_func_start sub_8144664
sub_8144664: @ 8144A40
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08144A68 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0x32
	bls _08144A5C
	b _08144D08
_08144A5C:
	lsls r0, 2
	ldr r1, _08144A6C @ =_08144A70
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144A68: .4byte gTasks
_08144A6C: .4byte _08144A70
	.align 2, 0
_08144A70:
	.4byte _08144B3C
	.4byte _08144B60
	.4byte _08144BB4
	.4byte _08144BCC
	.4byte _08144C08
	.4byte _08144C2C
	.4byte _08144C78
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144C84
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144CA4
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144CC8
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144D08
	.4byte _08144CFC
_08144B3C:
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0xC
	bl Sin
	ldr r1, _08144B5C @ =gUnknown_0203935A
	strh r0, [r1]
	b _08144B84
	.align 2, 0
_08144B5C: .4byte gUnknown_0203935A
_08144B60:
	ldr r7, _08144B8C @ =gUnknown_0203935A
	movs r3, 0
	ldrsh r4, [r7, r3]
	cmp r4, 0
	beq _08144B90
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0xC
	bl Sin
	strh r0, [r7]
_08144B84:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	b _08144D08
	.align 2, 0
_08144B8C: .4byte gUnknown_0203935A
_08144B90:
	ldr r3, _08144BB0 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x2
	strh r2, [r0, 0x2E]
	strh r4, [r1, 0x12]
	b _08144C24
	.align 2, 0
_08144BB0: .4byte gSprites
_08144BB4:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0x12]
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _08144C24
	adds r0, r2, 0x1
	strh r0, [r1, 0x12]
	b _08144C42
_08144BCC:
	ldr r3, _08144C04 @ =gSprites
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r6
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x3
	strh r1, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	movs r0, 0x78
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _08144D08
	.align 2, 0
_08144C04: .4byte gSprites
_08144C08:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08144C20
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	b _08144D08
_08144C20:
	movs r0, 0x40
	strh r0, [r1, 0x12]
_08144C24:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08144D08
_08144C2C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0x12]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08144C58
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
_08144C42:
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0x14
	bl Sin
	ldr r1, _08144C54 @ =gUnknown_0203935A
	strh r0, [r1]
	b _08144D08
	.align 2, 0
_08144C54: .4byte gUnknown_0203935A
_08144C58:
	ldr r2, _08144C74 @ =gSprites
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08144D08
	.align 2, 0
_08144C74: .4byte gSprites
_08144C78:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x32
	b _08144D06
_08144C84:
	ldr r3, _08144CA0 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x2
	b _08144CBC
	.align 2, 0
_08144CA0: .4byte gSprites
_08144CA4:
	ldr r3, _08144CC4 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x4
_08144CBC:
	strh r2, [r0, 0x2E]
	movs r0, 0x32
	strh r0, [r1, 0x8]
	b _08144D08
	.align 2, 0
_08144CC4: .4byte gSprites
_08144CC8:
	ldr r3, _08144CF8 @ =gSprites
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r6
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x5
	strh r1, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x3
	strh r1, [r0, 0x2E]
	movs r0, 0x32
	strh r0, [r2, 0x8]
	b _08144D08
	.align 2, 0
_08144CF8: .4byte gSprites
_08144CFC:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0
_08144D06:
	strh r1, [r0, 0x8]
_08144D08:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8144664

	thumb_func_start sub_8144934
sub_8144934: @ 8144D10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08144D34 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _08144D50
	lsls r0, 2
	ldr r1, _08144D38 @ =_08144D3C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144D34: .4byte gTasks
_08144D38: .4byte _08144D3C
	.align 2, 0
_08144D3C:
	.4byte _08144D50
	.4byte _08144D94
	.4byte _08144DA0
	.4byte _08144DE8
	.4byte _08144E38
_08144D50:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	ldr r5, _08144D9C @ =0x00007fff
	cmp r0, r5
	beq _08144D94
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r4
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _08144D94
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x14
	strh r0, [r1, 0x8]
	strh r5, [r2, 0xA]
_08144D94:
	movs r0, 0
	bl sub_8149020
	b _08144E3E
	.align 2, 0
_08144D9C: .4byte 0x00007fff
_08144DA0:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	ldr r5, _08144DE4 @ =0x00007fff
	cmp r0, r5
	beq _08144E30
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r4
	ldrh r1, [r3, 0x12]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	movs r1, 0xA0
	lsls r1, 2
	cmp r0, r1
	bne _08144E30
	movs r0, 0x1
	strh r0, [r3, 0x8]
	strh r5, [r2, 0xA]
	b _08144E30
	.align 2, 0
_08144DE4: .4byte 0x00007fff
_08144DE8:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	ldrh r3, [r2, 0xA]
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	ldr r5, _08144E24 @ =0x00007fff
	cmp r1, r5
	beq _08144E30
	ldr r0, _08144E28 @ =0x0000022a
	cmp r1, r0
	bne _08144E2C
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xA
	strh r1, [r0, 0x8]
	strh r5, [r2, 0xA]
	b _08144E30
	.align 2, 0
_08144E24: .4byte 0x00007fff
_08144E28: .4byte 0x0000022a
_08144E2C:
	adds r0, r3, 0x1
	strh r0, [r2, 0xA]
_08144E30:
	movs r0, 0x1
	bl sub_8149020
	b _08144E3E
_08144E38:
	movs r0, 0x2
	bl sub_8149020
_08144E3E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8144934

	thumb_func_start sub_8144A68
sub_8144A68: @ 8144E44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r0, 0x4
	bls _08144E5A
	b _081451D8
_08144E5A:
	lsls r0, 2
	ldr r1, _08144E64 @ =_08144E68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144E64: .4byte _08144E68
	.align 2, 0
_08144E68:
	.4byte _08144E7C
	.4byte _08144F24
	.4byte _08144FD0
	.4byte _0814507C
	.4byte _0814512C
_08144E7C:
	ldr r5, _08144F1C @ =gSprites
	ldr r0, _08144F20 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r2, 0x88
	lsls r2, 1
	strh r2, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	movs r2, 0x20
	b _081451CC
	.align 2, 0
_08144F1C: .4byte gSprites
_08144F20: .4byte gTasks
_08144F24:
	ldr r5, _08144FC8 @ =gSprites
	ldr r0, _08144FCC @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	movs r2, 0x20
	b _081451CC
	.align 2, 0
_08144FC8: .4byte gSprites
_08144FCC: .4byte gTasks
_08144FD0:
	ldr r5, _08145074 @ =gSprites
	ldr r0, _08145078 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x1
	b _081451CC
	.align 2, 0
_08145074: .4byte gSprites
_08145078: .4byte gTasks
_0814507C:
	ldr r5, _08145120 @ =gSprites
	ldr r0, _08145124 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08145128 @ =0x0000ffe0
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x1
	b _081451CC
	.align 2, 0
_08145120: .4byte gSprites
_08145124: .4byte gTasks
_08145128: .4byte 0x0000ffe0
_0814512C:
	ldr r5, _08145298 @ =gSprites
	ldr r0, _0814529C @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x58
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x98
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x2
_081451CC:
	movs r3, 0x8
	bl sub_8148EC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
_081451D8:
	ldr r0, _081452A0 @ =sub_8144934
	movs r1, 0
	bl CreateTask
	ldr r6, _0814529C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r5, r1, r6
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	strh r0, [r5, 0xC]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x8]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0xA]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r7, [r0, 0xC]
	ldr r0, _081452A4 @ =sub_8144664
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0x8]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r7, [r0, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r5, 0x12]
	strh r1, [r0, 0xC]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r5, 0x14]
	strh r1, [r0, 0xE]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0x10]
	mov r1, r8
	cmp r1, 0x2
	bne _0814528C
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	movs r0, 0x8
	strh r0, [r1, 0x12]
_0814528C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08145298: .4byte gSprites
_0814529C: .4byte gTasks
_081452A0: .4byte sub_8144934
_081452A4: .4byte sub_8144664
	thumb_func_end sub_8144A68

	thumb_func_start sub_8144ECC
sub_8144ECC: @ 81452A8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08145304 @ =gMain
	ldr r1, _08145308 @ =0x0000043c
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08145314
	cmp r0, 0x1
	ble _081452CC
	cmp r0, 0x2
	beq _08145338
	cmp r0, 0x3
	bne _081452CC
	b _08145468
_081452CC:
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	ldr r2, _0814530C @ =0x0400001c
	movs r0, 0x8
	strh r0, [r2]
	ldr r0, _08145310 @ =0x0400001e
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3A
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	strb r0, [r6]
	b _0814547E
	.align 2, 0
_08145304: .4byte gMain
_08145308: .4byte 0x0000043c
_0814530C: .4byte 0x0400001c
_08145310: .4byte 0x0400001e
_08145314:
	ldr r1, _08145330 @ =gUnknown_02039358
	movs r0, 0x22
	strh r0, [r1]
	ldr r1, _08145334 @ =gUnknown_0203935A
	movs r0, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8148CB0
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0814547E
	.align 2, 0
_08145330: .4byte gUnknown_02039358
_08145334: .4byte gUnknown_0203935A
_08145338:
	ldr r0, _08145398 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _081453BC
	ldr r0, _0814539C @ =gIntro2BrendanSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _081453A0 @ =gUnknown_08416E34
	bl LoadCompressedObjectPic
	ldr r0, _081453A4 @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _081453A8 @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl intro_create_brendan_sprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081453AC @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _081453B0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _081453B4 @ =sub_8145378
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _081453B8 @ =gUnknown_0840CA54
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl intro_create_may_sprite
	b _08145410
	.align 2, 0
_08145398: .4byte gSaveBlock2
_0814539C: .4byte gIntro2BrendanSpriteSheet
_081453A0: .4byte gUnknown_08416E34
_081453A4: .4byte gIntro2BicycleSpriteSheet
_081453A8: .4byte gIntro2SpritePalettes
_081453AC: .4byte gTasks
_081453B0: .4byte gSprites
_081453B4: .4byte sub_8145378
_081453B8: .4byte gUnknown_0840CA54
_081453BC:
	ldr r0, _08145438 @ =gIntro2MaySpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _0814543C @ =gUnknown_08416E24
	bl LoadCompressedObjectPic
	ldr r0, _08145440 @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08145444 @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl intro_create_may_sprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08145448 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _0814544C @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08145450 @ =sub_8145378
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08145454 @ =gUnknown_0840CA54
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl intro_create_brendan_sprite
_08145410:
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r4, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r5
	ldr r1, _08145458 @ =sub_8145420
	str r1, [r5]
	adds r0, r6
	ldr r1, _0814545C @ =gUnknown_0840CA94
	str r1, [r0]
	ldr r1, _08145460 @ =gMain
	ldr r0, _08145464 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0814547E
	.align 2, 0
_08145438: .4byte gIntro2MaySpriteSheet
_0814543C: .4byte gUnknown_08416E24
_08145440: .4byte gIntro2BicycleSpriteSheet
_08145444: .4byte gIntro2SpritePalettes
_08145448: .4byte gTasks
_0814544C: .4byte gSprites
_08145450: .4byte sub_8145378
_08145454: .4byte gUnknown_0840CA54
_08145458: .4byte sub_8145420
_0814545C: .4byte gUnknown_0840CA94
_08145460: .4byte gMain
_08145464: .4byte 0x0000043c
_08145468:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8144A68
	adds r0, r4, 0
	bl sub_8148E90
	movs r0, 0
	strb r0, [r6]
	movs r0, 0x1
	b _08145480
_0814547E:
	movs r0, 0
_08145480:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8144ECC

	thumb_func_start sub_81450AC
sub_81450AC: @ 8145488
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081454FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081454AE
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0x8]
_081454AE:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081454C4
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xA]
_081454C4:
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081454DA
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xC]
_081454DA:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081454F0
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xE]
_081454F0:
	ldr r1, _08145500 @ =gUnknown_0203935C
	movs r0, 0x1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081454FC: .4byte gTasks
_08145500: .4byte gUnknown_0203935C
	thumb_func_end sub_81450AC

	thumb_func_start sub_8145128
sub_8145128: @ 8145504
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r4, r2, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r4, 16
	lsrs r5, r4, 16
	ldr r0, _081455C8 @ =gCreditsCopyrightEnd_Gfx
	movs r6, 0xC0
	lsls r6, 19
	adds r3, r6
	adds r1, r3, 0
	bl LZ77UnCompVram
	ldr r0, _081455CC @ =gIntroCopyright_Pal
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	lsrs r4, 20
	lsls r4, 28
	lsrs r4, 16
	movs r2, 0
	adds r1, r4, 0x1
	ldr r3, _081455D0 @ =0x000003ff
_0814553A:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r6
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _0814553A
	movs r2, 0
	adds r0, r4, 0x2
	adds r6, r4, 0
	adds r6, 0x17
	movs r1, 0x2B
	adds r1, r4
	mov r12, r1
	adds r4, 0x42
	ldr r5, _081455D4 @ =0x060001c8
	adds r3, r0, 0
_08145560:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x14
	bls _08145560
	movs r2, 0
	ldr r5, _081455D8 @ =0x06000248
	adds r3, r6, 0
_0814557A:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x13
	bls _0814557A
	movs r2, 0
	ldr r5, _081455DC @ =0x060002c8
	mov r3, r12
_08145594:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x16
	bls _08145594
	movs r2, 0
	ldr r3, _081455E0 @ =0x06000348
_081455AC:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r3
	adds r1, r2, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xB
	bls _081455AC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081455C8: .4byte gCreditsCopyrightEnd_Gfx
_081455CC: .4byte gIntroCopyright_Pal
_081455D0: .4byte 0x000003ff
_081455D4: .4byte 0x060001c8
_081455D8: .4byte 0x06000248
_081455DC: .4byte 0x060002c8
_081455E0: .4byte 0x06000348
	thumb_func_end sub_8145128

	thumb_func_start sub_8145208
sub_8145208: @ 81455E4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	movs r0, 0x3F
	ands r0, r2
	adds r1, r0, 0
	adds r1, 0x50
	cmp r2, 0xFF
	bne _081455FC
	movs r0, 0x1
	b _08145622
_081455FC:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0814560C
	movs r2, 0x80
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_0814560C:
	movs r0, 0x40
	ands r3, r0
	cmp r3, 0
	beq _08145620
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	orrs r1, r0
	lsls r0, r1, 16
	lsrs r1, r0, 16
_08145620:
	adds r0, r1, 0
_08145622:
	pop {r1}
	bx r1
	thumb_func_end sub_8145208

	thumb_func_start sub_814524C
sub_814524C: @ 8145628
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x8]
	lsls r0, 16
	lsrs r0, 20
	lsls r0, 28
	lsrs r0, 16
	mov r9, r0
	movs r5, 0
_08145656:
	movs r4, 0
	lsls r7, r5, 1
	ldr r1, [sp, 0x4]
	adds r0, r1, r5
	adds r2, r5, 0x1
	mov r8, r2
	lsls r0, 6
	ldr r1, [sp, 0x8]
	adds r6, r0, r1
_08145668:
	adds r0, r7, r5
	adds r0, r4
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_8145208
	mov r2, r10
	adds r1, r2, r4
	lsls r1, 1
	adds r1, r6
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	add r0, r9
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08145668
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08145656
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814524C

	thumb_func_start sub_81452D0
sub_81452D0: @ 81456AC
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	lsrs r1, 20
	lsls r1, 28
	lsrs r1, 16
	movs r2, 0
	ldr r7, _0814571C @ =gUnknown_0840B85A
	movs r6, 0xC0
	lsls r6, 19
	adds r1, 0x1
	ldr r3, _08145720 @ =0x000003ff
_081456CA:
	lsls r0, r2, 1
	adds r0, r4
	adds r0, r6
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _081456CA
	str r5, [sp]
	adds r0, r7, 0
	movs r1, 0x7
	movs r2, 0x7
	adds r3, r4, 0
	bl sub_814524C
	ldr r0, _08145724 @ =gUnknown_0840B869
	str r5, [sp]
	movs r1, 0xB
	movs r2, 0x7
	adds r3, r4, 0
	bl sub_814524C
	ldr r0, _08145728 @ =gUnknown_0840B878
	str r5, [sp]
	movs r1, 0xF
	movs r2, 0x7
	adds r3, r4, 0
	bl sub_814524C
	str r5, [sp]
	adds r0, r7, 0
	movs r1, 0x13
	movs r2, 0x7
	adds r3, r4, 0
	bl sub_814524C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814571C: .4byte gUnknown_0840B85A
_08145720: .4byte 0x000003ff
_08145724: .4byte gUnknown_0840B869
_08145728: .4byte gUnknown_0840B878
	thumb_func_end sub_81452D0

	thumb_func_start sub_8145378
sub_8145378: @ 814572C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08145744 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08145748
	adds r0, r4, 0
	bl DestroySprite
	b _081457CC
	.align 2, 0
_08145744: .4byte gUnknown_0203935C
_08145748:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bhi _081457CC
	lsls r0, 2
	ldr r1, _0814575C @ =_08145760
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814575C: .4byte _08145760
	.align 2, 0
_08145760:
	.4byte _08145778
	.4byte _08145782
	.4byte _08145788
	.4byte _08145792
	.4byte _0814579C
	.4byte _081457B2
_08145778:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	b _081457CC
_08145782:
	adds r0, r4, 0
	movs r1, 0x1
	b _081457B6
_08145788:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
	b _081457CC
_08145792:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
	b _081457CC
_0814579C:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	ble _081457CC
	subs r0, r1, 0x1
	b _081457CA
_081457B2:
	adds r0, r4, 0
	movs r1, 0
_081457B6:
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _081457CC
	subs r0, r2, 0x1
_081457CA:
	strh r0, [r4, 0x20]
_081457CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8145378

	thumb_func_start sub_8145420
sub_8145420: @ 81457D4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081457EC @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081457F0
	adds r0, r4, 0
	bl DestroySprite
	b _0814588C
	.align 2, 0
_081457EC: .4byte gUnknown_0203935C
_081457F0:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08145818
	cmp r0, 0x1
	bgt _08145802
	cmp r0, 0
	beq _0814580C
	b _0814588C
_08145802:
	cmp r0, 0x2
	beq _08145854
	cmp r0, 0x3
	beq _08145872
	b _0814588C
_0814580C:
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	b _0814588C
_08145818:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0xC8
	ble _0814582A
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnimIfDifferent
	b _08145832
_0814582A:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
_08145832:
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _08145844
	subs r0, r2, 0x2
	strh r0, [r4, 0x20]
_08145844:
	ldr r0, _08145850 @ =gUnknown_0203935A
	ldrh r0, [r0]
	negs r0, r0
	strh r0, [r4, 0x26]
	b _0814588C
	.align 2, 0
_08145850: .4byte gUnknown_0203935A
_08145854:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0814588C
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	b _0814588A
_08145872:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _0814588C
	subs r0, r2, 0x1
_0814588A:
	strh r0, [r4, 0x20]
_0814588C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8145420

	thumb_func_start sub_81454E0
sub_81454E0: @ 8145894
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, _081458AC @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081458B0
	adds r0, r5, 0
	bl DestroySprite
	b _08145A5A
	.align 2, 0
_081458AC: .4byte gUnknown_0203935C
_081458B0:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0xA
	bhi _081458F8
	lsls r0, 2
	ldr r1, _081458C8 @ =_081458CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081458C8: .4byte _081458CC
	.align 2, 0
_081458CC:
	.4byte _081458F8
	.4byte _08145952
	.4byte _081459D4
	.4byte _08145A14
	.4byte _081458F8
	.4byte _081458F8
	.4byte _081458F8
	.4byte _081458F8
	.4byte _081458F8
	.4byte _081458F8
	.4byte _08145A4A
_081458F8:
	ldrb r1, [r5, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	movs r0, 0x10
	strh r0, [r5, 0x32]
	ldrh r4, [r5, 0x30]
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 9
	movs r1, 0x10
	bl __divsi3
	adds r1, r0, 0
	str r1, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	b _08145A5A
_08145952:
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	bgt _08145988
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r5, 0x32]
	ldrh r4, [r5, 0x30]
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 9
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0814598E
_08145988:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0814598E:
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	cmp r1, 0x2
	beq _08145A5A
	cmp r1, 0x2
	bgt _081459A0
	cmp r1, 0x1
	beq _081459A6
	b _08145A5A
_081459A0:
	cmp r1, 0x3
	beq _081459BE
	b _08145A5A
_081459A6:
	ldrh r1, [r5, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081459B6
	ldrh r0, [r5, 0x22]
	adds r0, 0x1
	strh r0, [r5, 0x22]
_081459B6:
	ldrh r0, [r5, 0x20]
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _08145A5A
_081459BE:
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	cmp r1, 0
	bne _081459CC
	ldrh r0, [r5, 0x22]
	adds r0, 0x1
	strh r0, [r5, 0x22]
_081459CC:
	ldrh r0, [r5, 0x20]
	adds r0, 0x2
	strh r0, [r5, 0x20]
	b _08145A5A
_081459D4:
	ldrh r1, [r5, 0x34]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _081459E4
	subs r0, r1, 0x1
	strh r0, [r5, 0x34]
	b _08145A5A
_081459E4:
	ldr r1, _08145A10 @ =0x04000050
	movs r2, 0xF4
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldrb r1, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _08145A5A
	.align 2, 0
_08145A10: .4byte 0x04000050
_08145A14:
	ldrh r1, [r5, 0x34]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08145A38
	subs r1, 0x1
	strh r1, [r5, 0x34]
	ldr r3, _08145A34 @ =0x04000052
	movs r0, 0x34
	ldrsh r2, [r5, r0]
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	adds r1, r0
	strh r1, [r3]
	b _08145A5A
	.align 2, 0
_08145A34: .4byte 0x04000052
_08145A38:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA
	strh r0, [r5, 0x2E]
	b _08145A5A
_08145A4A:
	ldr r0, _08145A64 @ =0x04000050
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl DestroySprite
_08145A5A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08145A64: .4byte 0x04000050
	thumb_func_end sub_81454E0

	thumb_func_start sub_81456B4
sub_81456B4: @ 8145A68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x10]
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	adds r6, r0, 0
	cmp r6, 0xC9
	beq _08145AAC
	movs r0, 0x9A
	lsls r0, 1
	cmp r6, r0
	beq _08145AA2
	movs r7, 0
	b _08145AB0
_08145AA2:
	ldr r0, _08145AA8 @ =gSaveBlock2
	ldr r7, [r0, 0x20]
	b _08145AB0
	.align 2, 0
_08145AA8: .4byte gSaveBlock2
_08145AAC:
	ldr r0, _08145B9C @ =gSaveBlock2
	ldr r7, [r0, 0x1C]
_08145AB0:
	lsls r0, r6, 3
	ldr r1, _08145BA0 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08145BA4 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08145BA8 @ =gUnknown_0840B5A0
	mov r8, r4
	mov r5, r9
	lsls r4, r5, 2
	add r4, r8
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	ldr r2, _08145BAC @ =0x0000ffff
	adds r0, r6, 0
	movs r1, 0
	bl species_and_otid_get_pal
	lsls r5, 4
	mov r8, r5
	movs r1, 0x80
	lsls r1, 1
	add r1, r8
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r7, r9
	lsls r6, r7, 24
	lsrs r6, 24
	mov r0, r9
	adds r1, r6, 0
	bl sub_8143648
	ldr r0, _08145BB0 @ =gUnknown_02024E8C
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldr r3, [sp, 0x10]
	lsls r2, r3, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08145BB4 @ =gSprites
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r3, r2, r5
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r8
	orrs r0, r7
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3, 0x5]
	mov r0, r9
	adds r0, 0x1
	strh r0, [r3, 0x30]
	movs r0, 0x3E
	adds r0, r3
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x1C
	adds r2, r0
	ldr r0, _08145BB8 @ =sub_81454E0
	str r0, [r2]
	ldr r0, _08145BBC @ =gSpriteTemplate_840CAEC
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r7, 0x22
	ldrsh r2, [r3, r7]
	movs r3, 0x1
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r4, [r0, 0x2E]
	adds r1, r6, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r4, 0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08145B9C: .4byte gSaveBlock2
_08145BA0: .4byte gMonFrontPicTable
_08145BA4: .4byte gMonFrontPicCoords
_08145BA8: .4byte gUnknown_0840B5A0
_08145BAC: .4byte 0x0000ffff
_08145BB0: .4byte gUnknown_02024E8C
_08145BB4: .4byte gSprites
_08145BB8: .4byte sub_81454E0
_08145BBC: .4byte gSpriteTemplate_840CAEC
	thumb_func_end sub_81456B4

	thumb_func_start sub_814580C
sub_814580C: @ 8145BC0
	push {r4,lr}
	adds r3, r0, 0
	ldr r4, _08145BEC @ =gSprites
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	beq _08145BE4
	ldr r0, _08145BF0 @ =gUnknown_0203935C
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _08145BF4
_08145BE4:
	adds r0, r3, 0
	bl DestroySprite
	b _08145C88
	.align 2, 0
_08145BEC: .4byte gSprites
_08145BF0: .4byte gUnknown_0203935C
_08145BF4:
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r0, r12
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r0, 0xC
	ands r0, r1
	ldrb r2, [r3, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r2, 0x4
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	movs r1, 0x3E
	ands r1, r0
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r3, 0x20]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r3, 0x22]
_08145C88:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814580C

	thumb_func_start sub_81458DC
sub_81458DC: @ 8145C90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r7, _08145D2C @ =0x0201c000
	ldr r0, _08145D30 @ =0x00004023
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r4, 0x1
	movs r5, 0
	ldr r0, _08145D34 @ =0x00000181
	mov r8, r0
_08145CC2:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	adds r6, r7, 0
	adds r6, 0x8A
	cmp r0, 0
	beq _08145CE0
	lsls r0, r5, 1
	adds r0, r6, r0
	strh r4, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08145CE0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _08145CC2
	adds r4, r5, 0
	ldr r0, _08145D34 @ =0x00000181
	lsls r1, r4, 16
	mov r9, r1
	movs r2, 0x88
	adds r2, r7
	mov r8, r2
	adds r1, r7, 0
	adds r1, 0x80
	str r1, [sp]
	cmp r4, r0
	bhi _08145D18
	adds r1, r6, 0
	movs r3, 0
	adds r2, r0, 0
_08145D08:
	lsls r0, r4, 1
	adds r0, r1, r0
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bls _08145D08
_08145D18:
	ldr r2, _08145D38 @ =0x0000038e
	adds r0, r7, r2
	strh r5, [r0]
	mov r1, r9
	lsrs r0, r1, 16
	cmp r0, 0x40
	bhi _08145D3C
	mov r2, r8
	strh r5, [r2]
	b _08145D42
	.align 2, 0
_08145D2C: .4byte 0x0201c000
_08145D30: .4byte 0x00004023
_08145D34: .4byte 0x00000181
_08145D38: .4byte 0x0000038e
_08145D3C:
	movs r0, 0x41
	mov r1, r8
	strh r0, [r1]
_08145D42:
	movs r5, 0
	ldr r2, _08145D4C @ =0x0000038e
	adds r4, r7, r2
	mov r9, r5
	b _08145D54
	.align 2, 0
_08145D4C: .4byte 0x0000038e
_08145D50:
	cmp r5, 0x40
	bhi _08145DA4
_08145D54:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, r5, 1
	adds r1, r7, r1
	lsls r0, r2, 1
	adds r3, r6, r0
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r9
	strh r0, [r3]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	beq _08145D9E
	ldrh r0, [r4]
	lsls r0, 1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r3]
	ldrh r0, [r4]
	lsls r0, 1
	adds r0, r6, r0
	mov r1, r9
	strh r1, [r0]
_08145D9E:
	ldrh r0, [r4]
	cmp r0, 0
	bne _08145D50
_08145DA4:
	mov r2, r8
	ldrh r0, [r2]
	cmp r0, 0x40
	bhi _08145DDC
	adds r5, r0, 0
	movs r2, 0
	cmp r5, 0x40
	bhi _08145E12
	mov r3, r8
_08145DB6:
	lsls r1, r5, 1
	adds r1, r7, r1
	lsls r0, r2, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r3]
	cmp r2, r0
	bne _08145DD0
	movs r2, 0
_08145DD0:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x40
	bls _08145DB6
	b _08145E12
_08145DDC:
	movs r4, 0
	ldrh r0, [r7]
	cmp r0, r10
	beq _08145DF8
_08145DE4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	cmp r0, r10
	beq _08145DF8
	cmp r4, 0x40
	bls _08145DE4
_08145DF8:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, 0x1
	cmp r4, r0
	bge _08145E12
	lsls r0, r4, 1
	adds r0, r7, r0
	ldr r2, [sp]
	ldrh r1, [r2]
	strh r1, [r0]
	mov r0, r10
	strh r0, [r2]
	b _08145E18
_08145E12:
	mov r2, r10
	ldr r1, [sp]
	strh r2, [r1]
_08145E18:
	movs r0, 0x41
	mov r1, r8
	strh r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81458DC

	.align 2, 0 @ Don't pad with nop.
