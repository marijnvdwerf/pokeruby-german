	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start UpdateBGRegs
UpdateBGRegs: @ 8002AE0
	ldrb r2, [r0]
	ldr r1, _08002B10 @ =gBGHOffsetRegs
	lsls r2, 2
	adds r1, r2, r1
	ldr r1, [r1]
	movs r3, 0
	strh r3, [r1]
	ldr r1, _08002B14 @ =gBGVOffsetRegs
	adds r1, r2, r1
	ldr r1, [r1]
	strh r3, [r1]
	ldr r1, _08002B18 @ =gBGControlRegs
	adds r2, r1
	ldr r3, [r2]
	ldrb r2, [r0, 0x3]
	ldrb r1, [r0, 0x2]
	lsls r1, 8
	orrs r2, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	orrs r2, r0
	strh r2, [r3]
	bx lr
	.align 2, 0
_08002B10: .4byte gBGHOffsetRegs
_08002B14: .4byte gBGVOffsetRegs
_08002B18: .4byte gBGControlRegs
	thumb_func_end UpdateBGRegs

	thumb_func_start ClearBGMem
ClearBGMem: @ 8002B1C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r5, 0
	str r5, [sp]
	ldr r1, [r4, 0x10]
	ldr r2, _08002B48 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r1, [r4, 0x14]
	cmp r1, 0
	beq _08002B40
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r2, _08002B4C @ =0x01000200
	bl CpuFastSet
_08002B40:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002B48: .4byte 0x01000008
_08002B4C: .4byte 0x01000200
	thumb_func_end ClearBGMem

	thumb_func_start LoadFontDefaultPalette
LoadFontDefaultPalette: @ 8002A1C
	push {lr}
	ldr r2, _08002A30 @ =gFontDefaultPalette
	ldrb r1, [r0, 0x4]
	lsls r1, 4
	adds r0, r2, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08002A30: .4byte gFontDefaultPalette
	thumb_func_end LoadFontDefaultPalette

	thumb_func_start SetUpWindowConfig
SetUpWindowConfig: @ 8002A34
	push {r4,lr}
	adds r4, r0, 0
	bl UpdateBGRegs
	adds r0, r4, 0
	bl ClearBGMem
	adds r0, r4, 0
	bl LoadFontDefaultPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SetUpWindowConfig

	thumb_func_start InitWindowTileData
InitWindowTileData: @ 8002A50
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	strh r3, [r2, 0x1A]
	movs r4, 0
	ldr r0, [r2, 0x2C]
	ldrb r1, [r0, 0x9]
	cmp r1, 0x1
	beq _08002A72
	cmp r1, 0x2
	bne _08002ACE
	adds r0, r2, 0
	adds r1, r3, 0
	bl InitVariableWidthFontTileData
	b _08002ACA
_08002A72:
	ldrb r0, [r0, 0x8]
	cmp r0, 0x6
	bhi _08002ACE
	lsls r0, 2
	ldr r1, _08002A84 @ =_08002A88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002A84: .4byte _08002A88
	.align 2, 0
_08002A88:
	.4byte _08002AA4
	.4byte _08002AAE
	.4byte _08002AAE
	.4byte _08002AA4
	.4byte _08002AB8
	.4byte _08002AB8
	.4byte _08002AC2
_08002AA4:
	adds r0, r2, 0
	adds r1, r3, 0
	bl LoadFixedWidthFont
	b _08002ACA
_08002AAE:
	adds r0, r2, 0
	adds r1, r3, 0
	bl LoadFixedWidthFont_Font1Latin
	b _08002ACA
_08002AB8:
	adds r0, r2, 0
	adds r1, r3, 0
	bl LoadFixedWidthFont_Font4Latin
	b _08002ACA
_08002AC2:
	adds r0, r2, 0
	adds r1, r3, 0
	bl LoadFixedWidthFont_Braille
_08002ACA:
	lsls r0, 16
	lsrs r4, r0, 16
_08002ACE:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end InitWindowTileData

	thumb_func_start InitVariableWidthFontTileData
InitVariableWidthFontTileData: @ 8002C0C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r2, 0
	strh r1, [r4, 0x1A]
	movs r0, 0x2
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0x1A]
	lsls r0, 5
	ldr r5, [r4, 0x24]
	adds r5, r0
	str r2, [sp]
	ldr r2, _08002C58 @ =0x01000008
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _08002C5C @ =sBlankTile
	adds r5, 0x20
	ldr r1, [r4, 0x2C]
	ldrb r2, [r1, 0x5]
	ldrb r3, [r1, 0x6]
	adds r1, r5, 0
	bl ApplyColors_UnshadowedFont
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	ldrb r2, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	muls r1, r2
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08002C58: .4byte 0x01000008
_08002C5C: .4byte sBlankTile
	thumb_func_end InitVariableWidthFontTileData

	thumb_func_start LoadFixedWidthFont
LoadFixedWidthFont: @ 8002C60
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r6, 0x24]
	adds r5, r0, r1
	movs r4, 0
_08002C6E:
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl LoadFixedWidthGlyph
	adds r5, 0x40
	adds r4, 0x1
	cmp r4, 0xFF
	ble _08002C6E
	lsls r0, r4, 17
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end LoadFixedWidthFont

	thumb_func_start LoadFixedWidthFont_Font1Latin
LoadFixedWidthFont_Font1Latin: @ 8002C8C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r6, 0x24]
	adds r5, r0, r1
	movs r4, 0
_08002C9A:
	lsls r0, r4, 3
	ldr r1, _08002CBC @ =0x081f096c
	adds r0, r1
	ldrb r2, [r6, 0x3]
	ldrb r3, [r6, 0x4]
	adds r1, r5, 0
	bl ApplyColors_UnshadowedFont
	adds r5, 0x20
	adds r4, 0x1
	cmp r4, 0xFF
	ble _08002C9A
	lsls r0, r4, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002CBC: .4byte 0x081f096c
	thumb_func_end LoadFixedWidthFont_Font1Latin

	thumb_func_start LoadFixedWidthFont_Font4Latin
LoadFixedWidthFont_Font4Latin: @ 8002CC0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r4, 0x24]
	adds r6, r0, r1
	movs r5, 0
_08002CD0:
	lsls r0, r5, 5
	ldr r1, _08002CF8 @ =gFont4LatinGlyphs
	adds r0, r1
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	str r1, [sp]
	adds r1, r6, 0
	bl ApplyColors_ShadowedFont
	adds r6, 0x20
	adds r5, 0x1
	cmp r5, 0xFF
	ble _08002CD0
	lsls r0, r5, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002CF8: .4byte gFont4LatinGlyphs
	thumb_func_end LoadFixedWidthFont_Font4Latin

	thumb_func_start LoadFixedWidthFont_Braille
LoadFixedWidthFont_Braille: @ 8002CFC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r6, 0x24]
	adds r5, r0, r1
	movs r4, 0
_08002D0A:
	lsls r0, r4, 3
	ldr r1, _08002D2C @ =0x081f286c
	adds r0, r1
	ldrb r2, [r6, 0x3]
	ldrb r3, [r6, 0x4]
	adds r1, r5, 0
	bl ApplyColors_UnshadowedFont
	adds r5, 0x20
	adds r4, 0x1
	cmp r4, 0xFF
	ble _08002D0A
	lsls r0, r4, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002D2C: .4byte 0x081f286c
	thumb_func_end LoadFixedWidthFont_Braille

	thumb_func_start MultistepInitWindowTileData
MultistepInitWindowTileData: @ 8002BFC
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r0, _08002C30 @ =0x03000320
	str r2, [r0]
	ldr r1, _08002C34 @ =0x03000326
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08002C38 @ =0x03000324
	strh r4, [r0]
	strh r4, [r2, 0x1A]
	movs r0, 0
	ldr r3, [r2, 0x2C]
	ldrb r1, [r3, 0x9]
	cmp r1, 0x1
	beq _08002C3C
	cmp r1, 0x2
	bne _08002C4C
	adds r0, r2, 0
	adds r1, r4, 0
	bl InitVariableWidthFontTileData
	lsls r0, 16
	lsrs r0, 16
	b _08002C4C
	.align 2, 0
_08002C30: .4byte 0x03000320
_08002C34: .4byte 0x03000326
_08002C38: .4byte 0x03000324
_08002C3C:
	movs r0, 0x80
	lsls r0, 1
	ldrb r1, [r3, 0x8]
	cmp r1, 0
	beq _08002C4A
	cmp r1, 0x3
	bne _08002C4C
_08002C4A:
	lsls r0, 1
_08002C4C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MultistepInitWindowTileData

	thumb_func_start MultistepLoadFont
MultistepLoadFont: @ 8002C54
	push {r4,r5,lr}
	movs r5, 0x1
	ldr r0, _08002C6C @ =0x03000320
	ldr r0, [r0]
	ldr r0, [r0, 0x2C]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x1
	bne _08002CA2
	ldr r0, _08002C70 @ =0x03000326
	ldrh r4, [r0]
	adds r0, r4, 0
	b _08002C8A
	.align 2, 0
_08002C6C: .4byte 0x03000320
_08002C70: .4byte 0x03000326
_08002C74:
	ldr r0, _08002CAC @ =0x03000320
	ldr r0, [r0]
	ldr r1, _08002CB0 @ =0x03000324
	ldrh r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl MultistepLoadFont_LoadGlyph
	adds r4, 0x1
	ldr r0, _08002CB4 @ =0x03000326
	ldrh r0, [r0]
_08002C8A:
	adds r0, 0x10
	cmp r4, r0
	blt _08002C74
	ldr r1, _08002CB4 @ =0x03000326
	ldrh r0, [r1]
	adds r0, 0x10
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bhi _08002CA2
	movs r5, 0
_08002CA2:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08002CAC: .4byte 0x03000320
_08002CB0: .4byte 0x03000324
_08002CB4: .4byte 0x03000326
	thumb_func_end MultistepLoadFont

	thumb_func_start MultistepLoadFont_LoadGlyph
MultistepLoadFont_LoadGlyph: @ 8002DEC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 24
	lsrs r2, 24
	ldr r0, [r4, 0x2C]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bhi _08002E78
	lsls r0, 2
	ldr r1, _08002E0C @ =_08002E10
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002E0C: .4byte _08002E10
	.align 2, 0
_08002E10:
	.4byte _08002E28
	.4byte _08002E3E
	.4byte _08002E3E
	.4byte _08002E28
	.4byte _08002E5C
	.4byte _08002E5C
_08002E28:
	lsls r0, r3, 5
	ldr r1, [r4, 0x24]
	adds r1, r0
	lsls r0, r2, 6
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r2, 0
	adds r2, r5, 0
	bl LoadFixedWidthGlyph
	b _08002E78
_08002E3E:
	adds r0, r2, r3
	lsls r0, 5
	ldr r1, [r4, 0x24]
	adds r5, r1, r0
	lsls r0, r2, 3
	ldr r1, _08002E58 @ =0x081f096c
	adds r0, r1
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x4]
	adds r1, r5, 0
	bl ApplyColors_UnshadowedFont
	b _08002E78
	.align 2, 0
_08002E58: .4byte 0x081f096c
_08002E5C:
	adds r0, r2, r3
	lsls r0, 5
	ldr r1, [r4, 0x24]
	adds r5, r1, r0
	lsls r0, r2, 5
	ldr r1, _08002E80 @ =gFont4LatinGlyphs
	adds r0, r1
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	str r1, [sp]
	adds r1, r5, 0
	bl ApplyColors_ShadowedFont
_08002E78:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002E80: .4byte gFont4LatinGlyphs
	thumb_func_end MultistepLoadFont_LoadGlyph

	thumb_func_start EmptyFunc
EmptyFunc: @ 8002D50
	bx lr
	thumb_func_end EmptyFunc

	thumb_func_start InitWindowFromConfig
InitWindowFromConfig: @ 8002D54
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r4, 0
	ldr r0, _08002DBC @ =0x081f3a20
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	str r5, [r4, 0x2C]
	ldrb r0, [r5, 0x9]
	strb r0, [r4]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xE]
	ldrb r0, [r5, 0x8]
	strb r0, [r4, 0x1]
	ldrb r0, [r5, 0x4]
	strb r0, [r4, 0x6]
	ldrb r0, [r5, 0xB]
	strb r0, [r4, 0x7]
	ldrb r0, [r5, 0xC]
	strb r0, [r4, 0x8]
	ldrb r0, [r5, 0xD]
	strb r0, [r4, 0x9]
	ldrb r0, [r5, 0xE]
	strb r0, [r4, 0xA]
	ldr r0, [r5, 0x10]
	str r0, [r4, 0x24]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x28]
	adds r0, r4, 0
	bl InitColors
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl SetBackgroundColor
	ldrb r1, [r5, 0x7]
	adds r0, r4, 0
	bl SetShadowColor
	ldrb r1, [r5, 0x5]
	adds r0, r4, 0
	bl SetForegroundColor
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002DBC: .4byte 0x081f3a20
	thumb_func_end InitWindowFromConfig

	thumb_func_start InitWindow
InitWindow: @ 8002DC0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r0, [sp, 0x14]
	lsls r0, 24
	mov r8, r0
	ldr r5, [r4, 0x2C]
	ldrb r0, [r5, 0x9]
	movs r6, 0
	strb r0, [r4]
	ldrb r0, [r5, 0x8]
	strb r0, [r4, 0x1]
	movs r0, 0x5
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0x4]
	strb r0, [r4, 0x6]
	strb r6, [r4, 0xB]
	strb r6, [r4, 0xC]
	strb r6, [r4, 0xD]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xE]
	strb r6, [r4, 0xF]
	ldrb r0, [r5, 0xB]
	strb r0, [r4, 0x7]
	ldrb r0, [r5, 0xC]
	strb r0, [r4, 0x8]
	ldrb r0, [r5, 0xD]
	strb r0, [r4, 0x9]
	ldrb r0, [r5, 0xE]
	strb r0, [r4, 0xA]
	str r1, [r4, 0x20]
	movs r0, 0
	strh r6, [r4, 0x1E]
	strh r2, [r4, 0x1A]
	strh r6, [r4, 0x1C]
	lsls r3, 3
	strb r3, [r4, 0x12]
	strb r0, [r4, 0x10]
	mov r1, r8
	lsrs r1, 21
	strh r1, [r4, 0x14]
	strb r0, [r4, 0x11]
	movs r0, 0x1
	strh r0, [r4, 0x16]
	strh r6, [r4, 0x18]
	ldr r0, [r5, 0x10]
	str r0, [r4, 0x24]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x28]
	adds r0, r4, 0
	bl InitColors
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl SetBackgroundColor
	ldrb r1, [r5, 0x7]
	adds r0, r4, 0
	bl SetShadowColor
	ldrb r1, [r5, 0x5]
	adds r0, r4, 0
	bl SetForegroundColor
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end InitWindow

	thumb_func_start sub_8002E4C
sub_8002E4C: @ 8002E4C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	lsls r2, 16
	lsrs r2, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0
	str r0, [sp]
	adds r0, r7, 0
	movs r3, 0
	bl InitWindow
	strb r4, [r7, 0x12]
	strh r5, [r7, 0x14]
	movs r0, 0
	cmp r6, 0
	beq _08002E7C
	movs r0, 0xFF
_08002E7C:
	strb r0, [r7, 0xF]
	cmp r0, 0
	beq _08002E88
	adds r0, r7, 0
	bl ClipLeft
_08002E88:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8002E4C

	thumb_func_start sub_8002E90
sub_8002E90: @ 8002E90
	push {r4,lr}
	movs r4, 0
	movs r3, 0
	movs r2, 0x2
	strh r2, [r0, 0x16]
	str r1, [r0, 0x20]
	strh r3, [r0, 0x1E]
	strh r3, [r0, 0x18]
	movs r1, 0xFF
	strb r1, [r0, 0xB]
	strb r4, [r0, 0xC]
	strb r4, [r0, 0xD]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8002E90

	thumb_func_start sub_8002EB0
sub_8002EB0: @ 8002EB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	ldr r5, [sp, 0x1C]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08002F30 @ =gMain
	movs r0, 0
	mov r8, r0
	movs r4, 0
	movs r0, 0x3
	strh r0, [r6, 0x36]
	strh r4, [r6, 0x34]
	ldr r0, _08002F34 @ =0x03000358
	mov r4, r8
	strb r4, [r0]
	ldr r4, _08002F38 @ =0x03000359
	movs r0, 0x1A
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, 0
	bl InitWindow
	movs r0, 0xFF
	strb r0, [r7, 0xB]
	ldrb r0, [r7]
	cmp r0, 0
	bne _08002F24
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r4, [r7, 0x24]
	adds r4, r0
	ldr r0, _08002F3C @ =sBlankTile
	ldrb r3, [r7, 0x4]
	adds r1, r4, 0
	adds r2, r3, 0
	bl ApplyColors_UnshadowedFont
	ldr r0, _08002F40 @ =0x081f0cdc
	adds r4, 0x20
	ldrb r2, [r7, 0x3]
	ldrb r3, [r7, 0x4]
	adds r1, r4, 0
	bl ApplyColors_UnshadowedFont
	movs r0, 0x2
	strh r0, [r7, 0x1C]
_08002F24:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F30: .4byte gMain
_08002F34: .4byte 0x03000358
_08002F38: .4byte 0x03000359
_08002F3C: .4byte sBlankTile
_08002F40: .4byte 0x081f0cdc
	thumb_func_end sub_8002EB0

	thumb_func_start sub_8002F44
sub_8002F44: @ 8002F44
	push {r4,lr}
	adds r4, r0, 0
	b _08002F92
_08002F4A:
	cmp r0, 0x6
	bne _08002F6C
	adds r0, r4, 0
	movs r1, 0x10
	bl AddToCursorY
	movs r0, 0
	strb r0, [r4, 0x10]
	ldrb r0, [r4, 0xF]
	cmp r0, 0
	beq _08002F66
	adds r0, r4, 0
	bl ClipLeft
_08002F66:
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08002F8C
_08002F6C:
	cmp r0, 0x7
	bne _08002F8C
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r0, [r0]
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8002FA0
_08002F8C:
	adds r0, r4, 0
	bl InterpretText
_08002F92:
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _08002F4A
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8002F44

	thumb_func_start sub_8002FA0
sub_8002FA0: @ 80030D4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	mov r9, r0
	ldr r6, [r4, 0x20]
	ldrh r0, [r4, 0x1E]
	mov r8, r0
	str r1, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x1E]
	movs r5, 0x2
	strh r5, [r4, 0x16]
	adds r0, r4, 0
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	str r6, [r4, 0x20]
	mov r1, r8
	strh r1, [r4, 0x1E]
	strh r5, [r4, 0x16]
	mov r1, r9
	strb r1, [r4, 0x2]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8002FA0

	thumb_func_start InterpretText
InterpretText: @ 8003114
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [r4, 0x20]
	adds r1, r0
	ldrb r3, [r1]
	adds r0, r3, 0
	subs r0, 0xFA
	cmp r0, 0x5
	bhi _08003196
	lsls r0, 2
	ldr r1, _0800313C @ =_08003140
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800313C: .4byte _08003140
	.align 2, 0
_08003140:
	.4byte _0800317C
	.4byte _08003172
	.4byte _0800318A
	.4byte _08003164
	.4byte _08003168
	.4byte _08003158
_08003158:
	adds r0, r4, 0
	bl ClipRight
	movs r0, 0
	strh r0, [r4, 0x16]
	b _080031AA
_08003164:
	movs r0, 0x7
	b _08003184
_08003168:
	adds r0, r4, 0
	bl ClipRight
	movs r0, 0x6
	b _08003184
_08003172:
	adds r0, r4, 0
	bl DrawInitialDownArrow
	movs r0, 0x8
	b _08003184
_0800317C:
	adds r0, r4, 0
	bl DrawInitialDownArrow
	movs r0, 0x9
_08003184:
	strh r0, [r4, 0x16]
	movs r0, 0x2
	b _080031AA
_0800318A:
	adds r0, r4, 0
	bl HandleExtCtrlCode
	lsls r0, 24
	lsrs r0, 24
	b _080031AA
_08003196:
	ldr r0, _080031B0 @ =0x081f39f8
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r4, 0
	adds r1, r3, 0
	bl _call_via_r2
	movs r0, 0x1
_080031AA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080031B0: .4byte 0x081f39f8
	thumb_func_end InterpretText

	thumb_func_start HandleExtCtrlCode
HandleExtCtrlCode: @ 80031B4
	push {lr}
	ldr r3, _080031DC @ =0x081f3a50
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080031DC: .4byte 0x081f3a50
	thumb_func_end HandleExtCtrlCode

	thumb_func_start ExtCtrlCode_Nop
ExtCtrlCode_Nop: @ 80031E0
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_Nop

	thumb_func_start ExtCtrlCode_ForegroundColor
ExtCtrlCode_ForegroundColor: @ 80031E4
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl SetForegroundColor
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_ForegroundColor

	thumb_func_start ExtCtrlCode_BackgroundColor
ExtCtrlCode_BackgroundColor: @ 8003200
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl SetBackgroundColor
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_BackgroundColor

	thumb_func_start ExtCtrlCode_ShadowColor
ExtCtrlCode_ShadowColor: @ 800321C
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl SetShadowColor
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_ShadowColor

	thumb_func_start ExtCtrlCode_AllColors
ExtCtrlCode_AllColors: @ 8003238
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl SetForegroundColor
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl SetBackgroundColor
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl SetShadowColor
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_AllColors

	thumb_func_start ExtCtrlCode_Palette
ExtCtrlCode_Palette: @ 8003288
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0, 0x6]
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_Palette

	thumb_func_start ExtCtrlCode_Font
ExtCtrlCode_Font: @ 80032A0
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0, 0x1]
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_Font

	thumb_func_start ExtCtrlCode_DefaultFont
ExtCtrlCode_DefaultFont: @ 80032B8
	ldr r1, [r0, 0x2C]
	ldrb r1, [r1, 0x8]
	strb r1, [r0, 0x1]
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_DefaultFont

	thumb_func_start ExtCtrlCode_Pause
ExtCtrlCode_Pause: @ 80032C4
	push {r4,lr}
	adds r4, r0, 0
	bl ClipRight
	movs r0, 0x4
	strh r0, [r4, 0x16]
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4, 0xD]
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_Pause

	thumb_func_start ExtCtrlCode_WaitButton
ExtCtrlCode_WaitButton: @ 80032EC
	push {r4,lr}
	adds r4, r0, 0
	bl ClipRight
	movs r0, 0x5
	strh r0, [r4, 0x16]
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_WaitButton

	thumb_func_start ExtCtrlCode_WaitSound
ExtCtrlCode_WaitSound: @ 8003300
	push {r4,lr}
	adds r4, r0, 0
	bl ClipRight
	movs r0, 0xA
	strh r0, [r4, 0x16]
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_WaitSound

	thumb_func_start ExtCtrlCode_PlayBGM
ExtCtrlCode_PlayBGM: @ 8003314
	push {r4,lr}
	ldrh r1, [r0, 0x1E]
	adds r2, r1, 0x1
	strh r2, [r0, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r0, 0x20]
	adds r1, r3, r1
	ldrb r4, [r1]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 8
	orrs r4, r0
	adds r0, r4, 0
	bl PlayBGM
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_PlayBGM

	thumb_func_start ExtCtrlCode_Escape
ExtCtrlCode_Escape: @ 8003344
	push {lr}
	ldr r1, _0800336C @ =0x081f39f8
	ldrb r3, [r0]
	lsls r3, 2
	adds r3, r1
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, [r3]
	bl _call_via_r2
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0800336C: .4byte 0x081f39f8
	thumb_func_end ExtCtrlCode_Escape

	thumb_func_start ExtCtrlCode_Nop2
ExtCtrlCode_Nop2: @ 8003370
	movs r0, 0x1
	bx lr
	thumb_func_end ExtCtrlCode_Nop2

	thumb_func_start ExtCtrlCode_SetCursorY
ExtCtrlCode_SetCursorY: @ 8003374
	push {r4,lr}
	adds r4, r0, 0
	bl ClipRight
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 27
	lsrs r1, 24
	adds r0, r4, 0
	bl AddToCursorY
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_SetCursorY

	thumb_func_start ExtCtrlCode_ClearWindowTextLines
ExtCtrlCode_ClearWindowTextLines: @ 80033A0
	push {lr}
	bl ClearWindowTextLines
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_ClearWindowTextLines

	thumb_func_start ExtCtrlCode_PlaySE
ExtCtrlCode_PlaySE: @ 80033AC
	push {r4,lr}
	ldrh r1, [r0, 0x1E]
	adds r2, r1, 0x1
	strh r2, [r0, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r0, 0x20]
	adds r1, r3, r1
	ldrb r4, [r1]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 8
	orrs r4, r0
	adds r0, r4, 0
	bl PlaySE
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_PlaySE

	thumb_func_start DrawSpace
DrawSpace: @ 80033DC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _080033FA
	ldrb r0, [r5, 0x12]
	ldrb r1, [r5, 0x10]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _080033FA
	ldrb r0, [r5, 0xE]
	cmp r0, 0x7
	bhi _08003414
_080033FA:
	ldr r0, _08003410 @ =0x081f39f8
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r5, 0
	movs r1, 0
	bl _call_via_r2
	b _0800346C
	.align 2, 0
_08003410: .4byte 0x081f39f8
_08003414:
	ldr r0, _08003474 @ =0x03000360
	ldr r4, [r0, 0x40]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r4, [r1]
	str r4, [r1, 0x4]
	str r4, [r1, 0x8]
	str r4, [r1, 0xC]
	str r4, [r1, 0x10]
	str r4, [r1, 0x14]
	str r4, [r1, 0x18]
	str r4, [r1, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r4, [r1]
	str r4, [r1, 0x4]
	str r4, [r1, 0x8]
	str r4, [r1, 0xC]
	str r4, [r1, 0x10]
	str r4, [r1, 0x14]
	str r4, [r1, 0x18]
	str r4, [r1, 0x1C]
	adds r0, r5, 0
	movs r1, 0x1
	bl UpdateTilemap
	adds r0, r5, 0
	movs r1, 0x8
	bl AddToCursorX
_0800346C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003474: .4byte 0x03000360
	thumb_func_end DrawSpace

	thumb_func_start sub_8003344
sub_8003344: @ 8003478
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldrb r6, [r4, 0xE]
	ldrb r1, [r4, 0x10]
	subs r0, r5, r1
	cmp r0, 0x8
	ble _080034AA
	ldrb r0, [r4, 0x12]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	movs r1, 0x8
	subs r1, r0
	strb r1, [r4, 0xE]
	b _080034AC
_0800349A:
	adds r0, r4, 0
	bl DrawSpace
	ldrb r0, [r4, 0x10]
	subs r0, r5, r0
	cmp r0, 0x7
	ble _080034AA
	movs r0, 0x8
_080034AA:
	strb r0, [r4, 0xE]
_080034AC:
	ldrb r0, [r4, 0x10]
	cmp r0, r5
	bcc _0800349A
	strb r6, [r4, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8003344

	thumb_func_start ExtCtrlCode_Skip
ExtCtrlCode_Skip: @ 80034BC
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	ldrb r2, [r0, 0x10]
	adds r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_8003344
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_Skip

	thumb_func_start ExtCtrlCode_SetCursorX
ExtCtrlCode_SetCursorX: @ 80034E0
	push {r4,lr}
	adds r4, r0, 0
	bl ClipRight
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl SetCursorX
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_SetCursorX

	thumb_func_start ExtCtrlCode_SkipTo
ExtCtrlCode_SkipTo: @ 8003508
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8003344
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ExtCtrlCode_SkipTo

	thumb_func_start ExtCtrlCode_Spacing
ExtCtrlCode_Spacing: @ 8003524
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0, 0xE]
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_Spacing

	thumb_func_start ExtCtrlCode_Japanese
ExtCtrlCode_Japanese: @ 800353C
	movs r1, 0x1
	strb r1, [r0, 0x2]
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_Japanese

	thumb_func_start ExtCtrlCode_Latin
ExtCtrlCode_Latin: @ 8003544
	movs r1, 0x5
	strb r1, [r0, 0x2]
	movs r0, 0x2
	bx lr
	thumb_func_end ExtCtrlCode_Latin

	thumb_func_start sub_8003418
sub_8003418: @ 8003418
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x1
	b _08003452
_08003420:
	cmp r0, 0x6
	bne _08003440
	adds r0, r4, 0
	movs r1, 0x10
	bl AddToCursorY
	movs r0, 0
	strb r0, [r4, 0x10]
	ldrb r0, [r4, 0xF]
	cmp r0, 0
	beq _0800343C
	adds r0, r4, 0
	bl ClipLeft
_0800343C:
	movs r0, 0x2
	strh r0, [r4, 0x16]
_08003440:
	adds r0, r4, 0
	bl InterpretText
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08003452
	movs r5, 0
	b _08003458
_08003452:
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _08003420
_08003458:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8003418

	thumb_func_start sub_8003460
sub_8003460: @ 8003460
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, [sp, 0xC]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r4, 0
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003460

	thumb_func_start sub_8003490
sub_8003490: @ 8003490
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r4, [sp, 0x14]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	add r0, sp, 0x4
	strb r1, [r0]
	adds r1, r0, 0
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	str r4, [sp]
	adds r0, r5, 0
	bl InitWindow
	adds r0, r5, 0
	bl InterpretText
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl ClipRight
	adds r0, r4, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8003490

	thumb_func_start sub_80034D4
sub_80034D4: @ 80034D4
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080034E8 @ =gWindowConfig_81E6C74
	adds r1, r3, 0
	bl sub_8004E3C
	pop {r0}
	bx r0
	.align 2, 0
_080034E8: .4byte gWindowConfig_81E6C74
	thumb_func_end sub_80034D4

	thumb_func_start sub_80034EC
sub_80034EC: @ 80034EC
	push {lr}
	adds r1, r0, 0
	ldr r0, _08003500 @ =gWindowConfig_81E6C74
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08003500: .4byte gWindowConfig_81E6C74
	thumb_func_end sub_80034EC

	thumb_func_start sub_8003504
sub_8003504: @ 8003504
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	adds r6, r2, 0
	adds r4, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08003550 @ =0x03000328
	ldr r0, _08003554 @ =gWindowConfig_81E6C74
	str r0, [r5, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl InitWindow
	str r4, [sp]
	adds r0, r5, 0
	mov r1, r8
	mov r2, r9
	adds r3, r6, 0
	bl AlignInt2
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08003550: .4byte 0x03000328
_08003554: .4byte gWindowConfig_81E6C74
	thumb_func_end sub_8003504

	thumb_func_start sub_8003558
sub_8003558: @ 8003558
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	adds r6, r2, 0
	adds r4, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080035A4 @ =0x03000328
	ldr r0, _080035A8 @ =gWindowConfig_81E6C74
	str r0, [r5, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0
	bl InitWindow
	str r4, [sp]
	adds r0, r5, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl AlignString
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080035A4: .4byte 0x03000328
_080035A8: .4byte gWindowConfig_81E6C74
	thumb_func_end sub_8003558

	thumb_func_start sub_80035AC
sub_80035AC: @ 80035AC
	push {lr}
	ldr r2, _080035C0 @ =0x03000358
	movs r1, 0
	strb r1, [r2]
	bl UpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080035C0: .4byte 0x03000358
	thumb_func_end sub_80035AC

	thumb_func_start UpdateWindowText
UpdateWindowText: @ 80036F8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x16]
	cmp r0, 0xA
	bls _08003704
	b _0800380C
_08003704:
	lsls r0, 2
	ldr r1, _08003710 @ =_08003714
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003710: .4byte _08003714
	.align 2, 0
_08003714:
	.4byte _08003810
	.4byte _080037F4
	.4byte _08003814
	.4byte _0800377C
	.4byte _080037A4
	.4byte _08003740
	.4byte _080037E8
	.4byte _080037E0
	.4byte _080037B0
	.4byte _080037C8
	.4byte _080037FC
_08003740:
	adds r0, r4, 0
	bl PlayerCanInterruptWait
	lsls r0, 24
	cmp r0, 0
	beq _08003768
	ldr r0, _08003764 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0800375A
	b _08003878
_0800375A:
	movs r0, 0x5
	bl PlaySE
	b _08003776
	.align 2, 0
_08003764: .4byte gMain
_08003768:
	ldrb r0, [r4, 0xD]
	subs r0, 0x1
	strb r0, [r4, 0xD]
	lsls r0, 24
	cmp r0, 0
	beq _08003776
	b _08003878
_08003776:
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003878
_0800377C:
	adds r0, r4, 0
	bl PlayerCanInterruptWait
	lsls r0, 24
	cmp r0, 0
	beq _080037A4
	ldr r2, _080037A0 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080037A4
	ldrh r0, [r2, 0x34]
	cmp r0, 0x1
	bne _080037A4
	movs r0, 0
	strb r0, [r4, 0xD]
	b _08003806
	.align 2, 0
_080037A0: .4byte gMain
_080037A4:
	ldrb r0, [r4, 0xD]
	cmp r0, 0
	beq _08003806
	subs r0, 0x1
	strb r0, [r4, 0xD]
	b _08003800
_080037B0:
	adds r0, r4, 0
	bl WaitWithDownArrow
	lsls r0, 24
	cmp r0, 0
	beq _08003878
	adds r0, r4, 0
	bl ClearWindowTextLines
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003878
_080037C8:
	adds r0, r4, 0
	bl WaitWithDownArrow
	lsls r0, 24
	cmp r0, 0
	beq _08003878
	adds r0, r4, 0
	bl ScrollWindowTextLines
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003878
_080037E0:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	b _08003806
_080037E8:
	adds r0, r4, 0
	bl ScrollWindowTextLines
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003878
_080037F4:
	adds r0, r4, 0
	bl ClearWindowTextLines
	b _08003814
_080037FC:
	bl IsSEPlaying
_08003800:
	lsls r0, 24
	cmp r0, 0
	bne _08003878
_08003806:
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003814
_0800380C:
	movs r0, 0
	strh r0, [r4, 0x16]
_08003810:
	movs r0, 0x1
	b _0800387A
_08003814:
	adds r0, r4, 0
	bl InterpretText
	ldrh r0, [r4, 0x16]
	cmp r0, 0xA
	bhi _0800386C
	lsls r0, 2
	ldr r1, _0800382C @ =_08003830
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800382C: .4byte _08003830
	.align 2, 0
_08003830:
	.4byte _08003810
	.4byte _0800386C
	.4byte _0800386C
	.4byte _0800386C
	.4byte _08003878
	.4byte _0800385C
	.4byte _08003878
	.4byte _0800386C
	.4byte _0800385C
	.4byte _0800385C
	.4byte _08003878
_0800385C:
	adds r0, r4, 0
	bl PlayerCanInterruptWait
	lsls r0, 24
	cmp r0, 0
	bne _08003878
	movs r0, 0x3C
	b _08003876
_0800386C:
	movs r0, 0x3
	strh r0, [r4, 0x16]
	adds r0, r4, 0
	bl GetTextDelay
_08003876:
	strb r0, [r4, 0xD]
_08003878:
	movs r0, 0
_0800387A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end UpdateWindowText

	thumb_func_start sub_800374C
sub_800374C: @ 800374C
	push {r4,r5,lr}
	ldr r5, _08003770 @ =0x03000358
	movs r1, 0x1
	strb r1, [r5]
	ldr r4, _08003774 @ =0x03000359
	movs r1, 0x1B
	strb r1, [r4]
	bl UpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1A
	strb r1, [r4]
	movs r1, 0
	strb r1, [r5]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08003770: .4byte 0x03000358
_08003774: .4byte 0x03000359
	thumb_func_end sub_800374C

	thumb_func_start sub_8003778
sub_8003778: @ 8003778
	push {r4,lr}
	ldr r4, _08003798 @ =0x03000358
	movs r1, 0x2
	strb r1, [r4]
	ldr r2, _0800379C @ =0x03000359
	movs r1, 0x1A
	strb r1, [r2]
	bl UpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strb r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08003798: .4byte 0x03000358
_0800379C: .4byte 0x03000359
	thumb_func_end sub_8003778

	thumb_func_start sub_80037A0
sub_80037A0: @ 80037A0
	push {r4,lr}
	ldr r2, _080037C0 @ =0x03000358
	movs r1, 0x3
	strb r1, [r2]
	ldr r4, _080037C4 @ =0x03000359
	movs r1, 0x11
	strb r1, [r4]
	bl UpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1A
	strb r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080037C0: .4byte 0x03000358
_080037C4: .4byte 0x03000359
	thumb_func_end sub_80037A0

	thumb_func_start sub_80037C8
sub_80037C8: @ 80037C8
	push {r4,lr}
	ldr r3, _080037E8 @ =0x03000358
	movs r2, 0
	strb r2, [r3]
	ldr r4, _080037EC @ =0x03000359
	strb r1, [r4]
	bl UpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1A
	strb r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080037E8: .4byte 0x03000358
_080037EC: .4byte 0x03000359
	thumb_func_end sub_80037C8

	thumb_func_start PrintGlyph_TextMode0
PrintGlyph_TextMode0: @ 8003924
	push {r4,lr}
	adds r4, r0, 0
	bl DrawGlyph_TextMode0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AddToCursorX
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	beq _08003944
	adds r0, r4, 0
	bl ClipRight
_08003944:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PrintGlyph_TextMode0

	thumb_func_start DrawGlyph_TextMode0
DrawGlyph_TextMode0: @ 800394C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	bl GetGlyphWidth
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl DrawGlyphTiles
	adds r1, r0, 0
	adds r0, r5, 0
	bl UpdateTilemap
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end DrawGlyph_TextMode0

	thumb_func_start PrintGlyph_TextMode1
PrintGlyph_TextMode1: @ 8003978
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08003998 @ =0x081f3a04
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r4, 0
	bl _call_via_r2
	ldrb r0, [r4, 0x10]
	adds r0, 0x8
	strb r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003998: .4byte 0x081f3a04
	thumb_func_end PrintGlyph_TextMode1

	thumb_func_start WriteGlyphTilemap_Font0_Font3
WriteGlyphTilemap_Font0_Font3: @ 800399C
	push {lr}
	lsls r2, r1, 1
	ldrh r1, [r0, 0x1A]
	adds r2, r1
	lsls r2, 16
	lsrs r1, r2, 16
	movs r3, 0x80
	lsls r3, 9
	adds r2, r3
	lsrs r2, 16
	bl WriteGlyphTilemap
	pop {r0}
	bx r0
	thumb_func_end WriteGlyphTilemap_Font0_Font3

	thumb_func_start WriteGlyphTilemap_Font1_Font4
WriteGlyphTilemap_Font1_Font4: @ 80039B8
	push {r4,lr}
	lsls r3, r1, 1
	ldr r4, _080039E0 @ =0x081f2f6c
	adds r1, r3, r4
	ldrb r1, [r1]
	ldrh r2, [r0, 0x1A]
	adds r1, r2, r1
	lsls r1, 16
	lsrs r1, 16
	adds r3, 0x1
	adds r3, r4
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl WriteGlyphTilemap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080039E0: .4byte 0x081f2f6c
	thumb_func_end WriteGlyphTilemap_Font1_Font4

	thumb_func_start WriteGlyphTilemap_Font2_Font5
WriteGlyphTilemap_Font2_Font5: @ 80039E4
	push {lr}
	adds r3, r1, 0
	ldrh r2, [r0, 0x1A]
	adds r1, r2, 0
	adds r1, 0xD4
	lsls r1, 16
	lsrs r1, 16
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl WriteGlyphTilemap
	pop {r0}
	bx r0
	thumb_func_end WriteGlyphTilemap_Font2_Font5

	thumb_func_start WriteGlyphTilemap_Font6
WriteGlyphTilemap_Font6: @ 8003A00
	push {r4,lr}
	lsls r3, r1, 1
	ldr r4, _08003A28 @ =0x081f315a
	adds r1, r3, r4
	ldrb r1, [r1]
	ldrh r2, [r0, 0x1A]
	adds r1, r2, r1
	lsls r1, 16
	lsrs r1, 16
	adds r3, 0x1
	adds r3, r4
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl WriteGlyphTilemap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003A28: .4byte 0x081f315a
	thumb_func_end WriteGlyphTilemap_Font6

	thumb_func_start PrintGlyph_TextMode2
PrintGlyph_TextMode2: @ 8003A2C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	bl GetGlyphWidth
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl DrawGlyph_TextMode2
	adds r0, r6, 0
	adds r1, r4, 0
	bl AddToCursorX
	ldrb r0, [r6, 0xB]
	cmp r0, 0
	beq _08003A58
	adds r0, r6, 0
	bl ClipRight
_08003A58:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PrintGlyph_TextMode2

	thumb_func_start DrawGlyph_TextMode2
DrawGlyph_TextMode2: @ 8003A60
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl GetGlyphWidth
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl DrawGlyphTiles
	adds r1, r0, 0
	adds r0, r4, 0
	bl UpdateTilemap
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DrawGlyph_TextMode2

	thumb_func_start LoadFixedWidthGlyph
LoadFixedWidthGlyph: @ 8003A88
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r3, r1, 0
	adds r5, r2, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	lsls r3, 16
	lsrs r3, 16
	add r2, sp, 0x8
	str r2, [sp]
	adds r2, r3, 0
	add r3, sp, 0x4
	bl GetGlyphTilePointers
	ldrb r0, [r4, 0x1]
	cmp r0, 0x6
	bhi _08003B16
	lsls r0, 2
	ldr r1, _08003AB8 @ =_08003ABC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003AB8: .4byte _08003ABC
	.align 2, 0
_08003ABC:
	.4byte _08003AD8
	.4byte _08003AD8
	.4byte _08003AD8
	.4byte _08003AF4
	.4byte _08003AF4
	.4byte _08003AF4
	.4byte _08003AD8
_08003AD8:
	ldr r0, [sp, 0x4]
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x4]
	adds r1, r5, 0
	bl ApplyColors_UnshadowedFont
	ldr r0, [sp, 0x8]
	adds r1, r5, 0
	adds r1, 0x20
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x4]
	bl ApplyColors_UnshadowedFont
	b _08003B16
_08003AF4:
	ldr r0, [sp, 0x4]
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	str r1, [sp]
	adds r1, r5, 0
	bl ApplyColors_ShadowedFont
	ldr r0, [sp, 0x8]
	adds r1, r5, 0
	adds r1, 0x20
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r4, [r4, 0x4]
	str r4, [sp]
	bl ApplyColors_ShadowedFont
_08003B16:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadFixedWidthGlyph

	thumb_func_start WriteGlyphTilemap
WriteGlyphTilemap: @ 8003B20
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	bl GetCursorTilemapPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08003B4A
	ldrb r1, [r4, 0x6]
	lsls r1, 28
	lsrs r1, 16
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x40
	adds r0, r6, 0
	orrs r0, r1
	strh r0, [r2]
_08003B4A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end WriteGlyphTilemap

	thumb_func_start GetGlyphTilePointers
GetGlyphTilePointers: @ 8003B50
	push {r4-r6,lr}
	adds r5, r3, 0
	ldr r6, [sp, 0x10]
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r0, 0x1
	bne _08003B6A
	movs r0, 0
	b _08003B6C
_08003B6A:
	movs r0, 0x7
_08003B6C:
	adds r0, r3
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08003B88 @ =0x081f3aac
	adds r3, r1, r0
	ldr r0, [r3]
	cmp r0, 0x4
	bhi _08003C20
	lsls r0, 2
	ldr r1, _08003B8C @ =_08003B90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003B88: .4byte 0x081f3aac
_08003B8C: .4byte _08003B90
	.align 2, 0
_08003B90:
	.4byte _08003BA4
	.4byte _08003BB4
	.4byte _08003BC0
	.4byte _08003BD4
	.4byte _08003C00
_08003BA4:
	ldrh r0, [r3, 0x8]
	adds r1, r4, 0
	muls r1, r0
	ldr r0, [r3, 0x4]
	adds r0, r1
	str r0, [r5]
	ldrh r1, [r3, 0xA]
	b _08003BF4
_08003BB4:
	lsls r0, r4, 17
	lsrs r4, r0, 16
	ldr r2, _08003BBC @ =0x081f2f6c
	b _08003BDA
	.align 2, 0
_08003BBC: .4byte 0x081f2f6c
_08003BC0:
	ldrh r1, [r3, 0x8]
	movs r0, 0xD4
	muls r1, r0
	ldr r0, [r3, 0x4]
	adds r0, r1
	str r0, [r5]
	ldrh r0, [r3, 0x8]
	adds r1, r4, 0
	muls r1, r0
	b _08003BF2
_08003BD4:
	lsls r0, r4, 17
	lsrs r4, r0, 16
	ldr r2, _08003BFC @ =0x081f315a
_08003BDA:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrh r0, [r3, 0x8]
	muls r1, r0
	ldr r0, [r3, 0x4]
	adds r0, r1
	str r0, [r5]
	adds r0, r4, 0x1
	adds r0, r2
	ldrb r1, [r0]
	ldrh r0, [r3, 0x8]
	muls r1, r0
_08003BF2:
	ldr r0, [r3, 0x4]
_08003BF4:
	adds r0, r1
	str r0, [r6]
	b _08003C20
	.align 2, 0
_08003BFC: .4byte 0x081f315a
_08003C00:
	ldr r0, _08003C28 @ =0x0000fff0
	ands r0, r4
	ldrh r2, [r3, 0x8]
	muls r0, r2
	ldr r1, [r3, 0x4]
	adds r1, r0
	movs r0, 0xF
	ands r4, r0
	adds r0, r4, 0
	muls r0, r2
	asrs r0, 1
	adds r1, r0
	str r1, [r5]
	ldrh r0, [r3, 0xA]
	adds r1, r0
	str r1, [r6]
_08003C20:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003C28: .4byte 0x0000fff0
	thumb_func_end GetGlyphTilePointers

	thumb_func_start GetCursorTilemapPointer
GetCursorTilemapPointer: @ 8003C2C
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0
	ldr r4, [r3, 0x28]
	cmp r4, 0
	beq _08003C5E
	ldrb r1, [r3, 0x12]
	ldrb r0, [r3, 0x10]
	adds r1, r0
	lsrs r1, 3
	ldrb r0, [r3, 0x7]
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldrh r0, [r3, 0x14]
	ldrb r2, [r3, 0x11]
	adds r0, r2
	lsrs r0, 3
	ldrb r3, [r3, 0x8]
	adds r0, r3
	lsls r0, 24
	lsrs r0, 19
	adds r0, r1
	lsls r0, 1
	adds r0, r4, r0
_08003C5E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetCursorTilemapPointer

	thumb_func_start ApplyColors_UnshadowedFont
ApplyColors_UnshadowedFont: @ 8003C64
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	adds r7, r0, 0
	str r3, [sp]
	str r2, [sp, 0x4]
	movs r5, 0
	movs r4, 0x1
	mov r3, sp
	adds r6, r1, 0
_08003C7E:
	adds r0, r7, r5
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 2
	adds r1, r3
	lsls r2, 24
	lsrs r0, r2, 25
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 4
	ldr r1, [r1]
	orrs r1, r0
	lsrs r0, r2, 26
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 8
	orrs r1, r0
	lsrs r0, r2, 27
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 12
	orrs r1, r0
	lsrs r0, r2, 28
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 16
	orrs r1, r0
	lsrs r0, r2, 29
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 20
	orrs r1, r0
	lsrs r0, r2, 30
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 24
	orrs r1, r0
	lsrs r2, 31
	lsls r2, 2
	adds r2, r3
	ldr r0, [r2]
	lsls r0, 28
	orrs r1, r0
	stm r6!, {r1}
	adds r5, 0x1
	cmp r5, 0x7
	ble _08003C7E
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ApplyColors_UnshadowedFont

	thumb_func_start ApplyColors_ShadowedFont
ApplyColors_ShadowedFont: @ 8003D00
	push {r4-r7,lr}
	sub sp, 0x40
	ldr r5, [sp, 0x54]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp, 0x4]
	movs r4, 0x2
	str r4, [sp, 0x8]
	movs r4, 0x3
	str r4, [sp, 0xC]
	movs r4, 0x4
	str r4, [sp, 0x10]
	movs r4, 0x5
	str r4, [sp, 0x14]
	movs r4, 0x6
	str r4, [sp, 0x18]
	movs r4, 0x7
	str r4, [sp, 0x1C]
	movs r4, 0x8
	str r4, [sp, 0x20]
	movs r4, 0x9
	str r4, [sp, 0x24]
	movs r4, 0xA
	str r4, [sp, 0x28]
	movs r4, 0xB
	str r4, [sp, 0x2C]
	movs r4, 0xC
	str r4, [sp, 0x30]
	movs r4, 0xD
	str r4, [sp, 0x34]
	str r5, [sp]
	str r3, [sp, 0x38]
	str r2, [sp, 0x3C]
	movs r3, 0xF
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0x7
_08003D54:
	ldm r6!, {r2}
	adds r0, r2, 0
	ands r0, r3
	lsls r0, 2
	mov r7, sp
	adds r1, r7, r0
	lsrs r0, r2, 4
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 4
	ldr r1, [r1]
	orrs r1, r0
	lsrs r0, r2, 8
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 8
	orrs r1, r0
	lsrs r0, r2, 12
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 12
	orrs r1, r0
	lsrs r0, r2, 16
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 16
	orrs r1, r0
	lsrs r0, r2, 20
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 20
	orrs r1, r0
	lsrs r0, r2, 24
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 24
	orrs r1, r0
	lsrs r2, 28
	lsls r2, 2
	adds r0, r7, r2
	ldr r0, [r0]
	lsls r0, 28
	orrs r1, r0
	stm r5!, {r1}
	subs r4, 0x1
	cmp r4, 0
	bge _08003D54
	add sp, 0x40
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ApplyColors_ShadowedFont

	thumb_func_start SetCursorX
SetCursorX: @ 8003DD4
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	bne _08003DF6
	ldrb r0, [r2, 0x12]
	ldrb r1, [r2, 0x10]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08003DF6
	ldrh r0, [r2, 0x1C]
	adds r0, 0x2
	strh r0, [r2, 0x1C]
_08003DF6:
	strb r3, [r2, 0x10]
	pop {r0}
	bx r0
	thumb_func_end SetCursorX

	thumb_func_start AddToCursorX
AddToCursorX: @ 8003DFC
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	cmp r0, 0
	bne _08003E2A
	ldrb r3, [r4, 0x10]
	adds r0, r1, r3
	strb r0, [r4, 0x10]
	ldrb r0, [r4, 0x12]
	ldrb r1, [r4, 0x10]
	adds r1, r0, r1
	movs r2, 0xF8
	ands r1, r2
	adds r0, r3
	ands r0, r2
	cmp r1, r0
	beq _08003E30
	ldrh r0, [r4, 0x1C]
	adds r0, 0x2
	strh r0, [r4, 0x1C]
	b _08003E30
_08003E2A:
	ldrb r0, [r4, 0x10]
	adds r0, r1, r0
	strb r0, [r4, 0x10]
_08003E30:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AddToCursorX

	thumb_func_start AddToCursorY
AddToCursorY: @ 8003E38
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	bne _08003E5A
	ldrb r0, [r2, 0x12]
	ldrb r1, [r2, 0x10]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08003E5A
	ldrh r0, [r2, 0x1C]
	adds r0, 0x2
	strh r0, [r2, 0x1C]
_08003E5A:
	ldrb r0, [r2, 0x11]
	adds r0, r3, r0
	strb r0, [r2, 0x11]
	pop {r0}
	bx r0
	thumb_func_end AddToCursorY

	thumb_func_start EraseAtCursor
EraseAtCursor: @ 8003E64
	push {lr}
	adds r3, r0, 0
	ldrb r0, [r3]
	cmp r0, 0x1
	beq _08003E88
	cmp r0, 0x1
	bgt _08003E78
	cmp r0, 0
	beq _08003E7C
	b _08003E9A
_08003E78:
	cmp r0, 0x2
	bne _08003E9A
_08003E7C:
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0x8
	bl DrawGlyphTiles
	b _08003E9A
_08003E88:
	ldr r0, _08003EA0 @ =0x081f3a04
	ldrb r1, [r3, 0x1]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r3, 0
	movs r1, 0
	bl _call_via_r2
_08003E9A:
	pop {r0}
	bx r0
	.align 2, 0
_08003EA0: .4byte 0x081f3a04
	thumb_func_end EraseAtCursor

	thumb_func_start ClipLeft
ClipLeft: @ 8003EA4
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0x12]
	movs r1, 0x7
	ands r1, r0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08003F70
	cmp r1, 0
	beq _08003F70
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08003F78 @ =0x081f3958
	adds r0, r1
	ldr r1, [r0]
	mvns r5, r1
	ldr r0, _08003F7C @ =0x03000360
	ldr r4, [r0, 0x40]
	ands r4, r1
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
_08003F70:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003F78: .4byte 0x081f3958
_08003F7C: .4byte 0x03000360
	thumb_func_end ClipLeft

	thumb_func_start ClipRight
ClipRight: @ 8003F80
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0x10]
	ldrb r1, [r6, 0x12]
	adds r2, r0, r1
	movs r0, 0x7
	ands r2, r0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08004062
	cmp r2, 0
	beq _08004062
	movs r0, 0x8
	subs r0, r2
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 5
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r2, _08004068 @ =0x081f3658
	adds r0, r2
	adds r1, r0
	ldr r5, [r1]
	ldr r0, _0800406C @ =0x03000360
	ldr r4, [r0, 0x40]
	bics r4, r5
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
	adds r0, r6, 0
	movs r1, 0x1
	bl UpdateTilemap
_08004062:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004068: .4byte 0x081f3658
_0800406C: .4byte 0x03000360
	thumb_func_end ClipRight

	thumb_func_start InitColors
InitColors: @ 8004070
	push {lr}
	movs r1, 0
	strb r1, [r0, 0x4]
	movs r1, 0xE
	strb r1, [r0, 0x5]
	movs r1, 0xF
	strb r1, [r0, 0x3]
	movs r1, 0
	ldr r0, _08004090 @ =0x03000360
	adds r0, 0x44
_08004084:
	stm r0!, {r1}
	adds r1, 0x1
	cmp r1, 0xF
	bls _08004084
	pop {r0}
	bx r0
	.align 2, 0
_08004090: .4byte 0x03000360
	thumb_func_end InitColors

	thumb_func_start SetBackgroundColor
SetBackgroundColor: @ 8004094
	lsls r1, 24
	lsrs r1, 24
	strb r1, [r0, 0x4]
	ldr r3, _080040B0 @ =0x03000360
	str r1, [r3, 0x44]
	lsls r2, r1, 4
	orrs r2, r1
	lsls r0, r2, 8
	orrs r0, r2
	lsls r1, r0, 16
	orrs r0, r1
	str r0, [r3, 0x40]
	bx lr
	.align 2, 0
_080040B0: .4byte 0x03000360
	thumb_func_end SetBackgroundColor

	thumb_func_start SetShadowColor
SetShadowColor: @ 80040B4
	lsls r1, 24
	lsrs r1, 24
	strb r1, [r0, 0x5]
	ldr r0, _080040C0 @ =0x03000360
	str r1, [r0, 0x7C]
	bx lr
	.align 2, 0
_080040C0: .4byte 0x03000360
	thumb_func_end SetShadowColor

	thumb_func_start SetForegroundColor
SetForegroundColor: @ 80040C4
	lsls r1, 24
	lsrs r1, 24
	strb r1, [r0, 0x3]
	ldr r0, _080040D4 @ =0x03000360
	adds r0, 0x80
	str r1, [r0]
	bx lr
	.align 2, 0
_080040D4: .4byte 0x03000360
	thumb_func_end SetForegroundColor

	thumb_func_start GetTextDelay
GetTextDelay: @ 80040D8
	push {lr}
	bl PlayerCanInterruptWait
	lsls r0, 24
	cmp r0, 0
	beq _080040FC
	ldr r1, _080040F4 @ =0x081f3b54
	ldr r0, _080040F8 @ =gSaveBlock2
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	adds r0, r1
	ldrb r0, [r0]
	b _080040FE
	.align 2, 0
_080040F4: .4byte 0x081f3b54
_080040F8: .4byte gSaveBlock2
_080040FC:
	movs r0, 0x3
_080040FE:
	pop {r1}
	bx r1
	thumb_func_end GetTextDelay

	thumb_func_start PlayerCanInterruptWait
PlayerCanInterruptWait: @ 8004104
	push {lr}
	movs r1, 0x1
	ldr r0, _0800411C @ =0x03000358
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08004126
	cmp r0, 0x2
	bgt _08004120
	cmp r0, 0x1
	beq _0800413C
	b _08004144
	.align 2, 0
_0800411C: .4byte 0x03000358
_08004120:
	cmp r0, 0x3
	beq _0800412A
	b _08004144
_08004126:
	movs r1, 0
	b _08004144
_0800412A:
	movs r1, 0
	ldr r0, _08004138 @ =gUnknown_0203869A
	ldrb r0, [r0]
	cmp r0, 0
	bne _08004144
	movs r1, 0x1
	b _08004144
	.align 2, 0
_08004138: .4byte gUnknown_0203869A
_0800413C:
	ldr r0, _0800414C @ =gUnknown_020239F8
	ldrh r0, [r0]
	lsrs r0, 1
	bics r1, r0
_08004144:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_0800414C: .4byte gUnknown_020239F8
	thumb_func_end PlayerCanInterruptWait

	thumb_func_start ScrollWindowTextLines
ScrollWindowTextLines: @ 8004150
	push {lr}
	ldrb r1, [r0]
	cmp r1, 0x1
	beq _0800416E
	cmp r1, 0x1
	bgt _08004162
	cmp r1, 0
	beq _08004168
	b _08004178
_08004162:
	cmp r1, 0x2
	beq _08004174
	b _08004178
_08004168:
	bl ScrollWindowTextLines_TextMode0
	b _08004178
_0800416E:
	bl ScrollWindowTextLines_TextMode1
	b _08004178
_08004174:
	bl ScrollWindowTextLines_TextMode2
_08004178:
	pop {r0}
	bx r0
	thumb_func_end ScrollWindowTextLines

	thumb_func_start ScrollWindowTextLines_TextMode0
ScrollWindowTextLines_TextMode0: @ 800417C
	push {r4,lr}
	adds r2, r0, 0
	ldrb r3, [r2, 0x11]
	cmp r3, 0
	bne _080041A0
	ldr r0, _0800419C @ =0x03000359
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, 0x2
	movs r1, 0
	strh r0, [r2, 0x1C]
	strb r1, [r2, 0x10]
	adds r0, r3, 0
	adds r0, 0x10
	strb r0, [r2, 0x11]
	b _080041D6
	.align 2, 0
_0800419C: .4byte 0x03000359
_080041A0:
	ldrb r1, [r2, 0xC]
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r1
	adds r4, r1, 0
	cmp r0, 0
	beq _080041C0
	ldr r1, _080041BC @ =0x03000359
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, 0x2
	strh r0, [r2, 0x1C]
	adds r3, r1, 0
	b _080041C4
	.align 2, 0
_080041BC: .4byte 0x03000359
_080041C0:
	strh r3, [r2, 0x1C]
	ldr r3, _080041DC @ =0x03000359
_080041C4:
	movs r0, 0x2
	eors r0, r4
	movs r1, 0
	strb r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	ldrb r1, [r3]
	adds r0, r2, 0
	bl DoScroll_TextMode0
_080041D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080041DC: .4byte 0x03000359
	thumb_func_end ScrollWindowTextLines_TextMode0

	thumb_func_start DoScroll_TextMode0
DoScroll_TextMode0: @ 80041E0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r6, r1, 16
	lsrs r6, 16
	ldr r5, [r4, 0x28]
	ldrh r0, [r4, 0x14]
	lsrs r0, 3
	lsls r0, 5
	ldrb r1, [r4, 0x12]
	lsrs r1, 3
	adds r0, r1
	lsls r0, 1
	adds r5, r0
	adds r0, r4, 0
	bl GetBlankTileNum
	ldrb r4, [r4, 0x6]
	lsls r4, 12
	orrs r4, r0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x80
	adds r0, r5
	mov r8, r0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	movs r0, 0xC0
	adds r0, r5
	mov r9, r0
	adds r5, 0x40
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	mov r0, sp
	strh r4, [r0]
	movs r5, 0x80
	lsls r5, 17
	orrs r5, r6
	mov r1, r8
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r4, [r0]
	mov r1, r9
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DoScroll_TextMode0

	thumb_func_start ScrollWindowTextLines_TextMode1
ScrollWindowTextLines_TextMode1: @ 8004260
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x11]
	adds r1, r0, 0
	cmp r1, 0
	bne _08004274
	strb r1, [r2, 0x10]
	adds r0, 0x10
	strb r0, [r2, 0x11]
	b _0800428A
_08004274:
	ldrb r0, [r2, 0xC]
	movs r1, 0x2
	eors r0, r1
	movs r1, 0
	strb r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	ldr r0, _08004290 @ =0x03000359
	ldrb r1, [r0]
	adds r0, r2, 0
	bl DoScroll_TextMode1
_0800428A:
	pop {r0}
	bx r0
	.align 2, 0
_08004290: .4byte 0x03000359
	thumb_func_end ScrollWindowTextLines_TextMode1

	thumb_func_start DoScroll_TextMode1
DoScroll_TextMode1: @ 8004294
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r6, r1, 16
	lsrs r6, 16
	bl GetCursorTilemapPointer
	adds r7, r0, 0
	adds r5, r7, 0
	subs r5, 0x40
	adds r0, r4, 0
	bl GetBlankTileNum
	ldrb r4, [r4, 0x6]
	lsls r4, 12
	orrs r4, r0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x40
	adds r0, r7
	mov r8, r0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	movs r0, 0x80
	adds r0, r7
	mov r9, r0
	adds r1, r7, 0
	adds r2, r6, 0
	bl CpuSet
	mov r0, sp
	strh r4, [r0]
	movs r5, 0x80
	lsls r5, 17
	orrs r5, r6
	mov r1, r8
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r4, [r0]
	mov r1, r9
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DoScroll_TextMode1

	thumb_func_start ScrollWindowTextLines_TextMode2
ScrollWindowTextLines_TextMode2: @ 8004308
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x11]
	adds r1, r0, 0
	cmp r1, 0
	bne _0800431C
	strb r1, [r2, 0x10]
	adds r0, 0x10
	strb r0, [r2, 0x11]
	b _08004332
_0800431C:
	ldrb r0, [r2, 0xC]
	movs r1, 0x2
	eors r0, r1
	movs r1, 0
	strb r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	ldr r0, _08004338 @ =0x03000359
	ldrb r1, [r0]
	adds r0, r2, 0
	bl DoScroll_TextMode2
_08004332:
	pop {r0}
	bx r0
	.align 2, 0
_08004338: .4byte 0x03000359
	thumb_func_end ScrollWindowTextLines_TextMode2

	thumb_func_start DoScroll_TextMode2
DoScroll_TextMode2: @ 800433C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	movs r2, 0x2
	negs r2, r2
	movs r1, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	mov r8, r1
	add r8, r0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r4, [r5, 0x24]
	adds r4, r0
	lsls r0, r7, 3
	mov r9, r0
	adds r0, r4, 0
	mov r1, r8
	mov r2, r9
	bl CpuFastSet
	ldr r1, _08004448 @ =0x03000360
	mov r10, r1
	ldr r0, [r1, 0x40]
	str r0, [sp, 0x8]
	add r0, sp, 0x8
	movs r6, 0x80
	lsls r6, 17
	mov r1, r9
	orrs r6, r1
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuFastSet
	ldrb r0, [r5, 0x9]
	lsls r0, 5
	adds r4, r0
	add r8, r0
	adds r0, r4, 0
	mov r1, r8
	mov r2, r9
	bl CpuFastSet
	mov r1, r10
	ldr r0, [r1, 0x40]
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuFastSet
	adds r0, r5, 0
	bl GetCursorTilemapPointer
	adds r4, r0, 0
	subs r4, 0x80
	mov r3, sp
	ldrh r2, [r5, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r2, r0
	ldrh r0, [r5, 0x14]
	lsrs r0, 3
	ldrb r1, [r5, 0x9]
	muls r0, r1
	adds r2, r0
	ldrb r1, [r5, 0x12]
	lsrs r1, 3
	adds r1, r2
	ldrb r0, [r5, 0x6]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3]
	mov r2, sp
	ldrb r0, [r5, 0x9]
	adds r1, r0
	strh r1, [r2, 0x2]
	ldrb r0, [r5, 0x9]
	adds r1, r0
	strh r1, [r2, 0x4]
	ldrb r0, [r5, 0x9]
	adds r1, r0
	strh r1, [r2, 0x6]
	movs r5, 0
	cmp r5, r7
	bcs _08004436
_08004402:
	ldrh r1, [r3]
	adds r0, r1, 0x1
	strh r0, [r3]
	strh r1, [r4]
	adds r2, r4, 0
	adds r2, 0x40
	ldrh r1, [r3, 0x2]
	adds r0, r1, 0x1
	strh r0, [r3, 0x2]
	strh r1, [r2]
	adds r2, 0x40
	ldrh r1, [r3, 0x4]
	adds r0, r1, 0x1
	strh r0, [r3, 0x4]
	strh r1, [r2]
	adds r2, 0x40
	ldrh r1, [r3, 0x6]
	adds r0, r1, 0x1
	strh r0, [r3, 0x6]
	strh r1, [r2]
	adds r4, 0x2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _08004402
_08004436:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004448: .4byte 0x03000360
	thumb_func_end DoScroll_TextMode2

	thumb_func_start ClearWindowTextLines
ClearWindowTextLines: @ 8004318
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08004348
	cmp r0, 0x1
	bgt _0800432C
	cmp r0, 0
	beq _08004332
	b _08004362
_0800432C:
	cmp r0, 0x2
	beq _08004358
	b _08004362
_08004332:
	ldr r0, _08004344 @ =0x03000359
	ldrb r1, [r0]
	adds r0, r4, 0
	bl ClearWindowTextLines_TextMode0_TextMode1
	movs r0, 0x2
	strh r0, [r4, 0x1C]
	b _08004362
	.align 2, 0
_08004344: .4byte 0x03000359
_08004348:
	ldr r0, _08004354 @ =0x03000359
	ldrb r1, [r0]
	adds r0, r4, 0
	bl ClearWindowTextLines_TextMode0_TextMode1
	b _08004362
	.align 2, 0
_08004354: .4byte 0x03000359
_08004358:
	ldr r0, _08004368 @ =0x03000359
	ldrb r1, [r0]
	adds r0, r4, 0
	bl ClearWindowTextLines_TextMode2
_08004362:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004368: .4byte 0x03000359
	thumb_func_end ClearWindowTextLines

	thumb_func_start ClearWindowTextLines_TextMode0_TextMode1
ClearWindowTextLines_TextMode0_TextMode1: @ 80044A0
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r0, 0
	strb r0, [r4, 0x10]
	strb r0, [r4, 0x11]
	strb r0, [r4, 0xC]
	adds r0, r4, 0
	bl GetCursorTilemapPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl GetBlankTileNum
	ldrb r1, [r4, 0x6]
	lsls r1, 12
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
_080044CA:
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x40
	adds r3, r0, 0x1
	cmp r2, r6
	bcs _080044E6
_080044D6:
	lsls r0, r2, 1
	adds r0, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _080044D6
_080044E6:
	adds r5, r4, 0
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080044CA
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ClearWindowTextLines_TextMode0_TextMode1

	thumb_func_start ClearWindowTextLines_TextMode2
ClearWindowTextLines_TextMode2: @ 80044F8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	movs r0, 0
	strb r0, [r6, 0x10]
	strb r0, [r6, 0x11]
	strb r0, [r6, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r4, [r6, 0x24]
	adds r4, r0
	ldr r0, _08004588 @ =0x03000360
	mov r8, r0
	ldr r0, [r0, 0x40]
	str r0, [sp]
	lsls r5, 3
	movs r0, 0x80
	lsls r0, 17
	orrs r5, r0
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldrb r0, [r6, 0x9]
	lsls r0, 5
	adds r4, r0
	mov r1, r8
	ldr r0, [r1, 0x40]
	str r0, [sp, 0x4]
	add r0, sp, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldrb r0, [r6, 0x9]
	lsls r0, 5
	adds r4, r0
	mov r1, r8
	ldr r0, [r1, 0x40]
	str r0, [sp, 0x8]
	add r0, sp, 0x8
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldrb r0, [r6, 0x9]
	lsls r0, 5
	adds r4, r0
	mov r1, r8
	ldr r0, [r1, 0x40]
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004588: .4byte 0x03000360
	thumb_func_end ClearWindowTextLines_TextMode2

	thumb_func_start DrawDownArrow
DrawDownArrow: @ 800458C
	push {r4-r7,lr}
	sub sp, 0x1C
	adds r5, r0, 0
	bl PlayerCanInterruptWait
	lsls r0, 24
	cmp r0, 0
	bne _0800459E
	b _080046F0
_0800459E:
	ldrh r0, [r5, 0x18]
	movs r1, 0xF0
	lsls r1, 4
	ands r1, r0
	lsrs r1, 2
	ldr r0, _080045BC @ =0x081f2e6c
	adds r7, r1, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _080045C6
	cmp r0, 0x1
	bgt _080045C0
	cmp r0, 0
	beq _08004616
	b _080046F0
	.align 2, 0
_080045BC: .4byte 0x081f2e6c
_080045C0:
	cmp r0, 0x2
	beq _08004616
	b _080046F0
_080045C6:
	ldrh r0, [r5, 0x1A]
	adds r0, 0xFE
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _080045D8
	cmp r0, 0x3
	bne _080045DC
_080045D8:
	lsls r0, r6, 17
	lsrs r6, r0, 16
_080045DC:
	lsls r0, r6, 5
	ldr r4, [r5, 0x24]
	adds r4, r0
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x5]
	ldrb r0, [r5, 0x4]
	str r0, [sp]
	adds r0, r7, 0
	adds r1, r4, 0
	bl ApplyColors_ShadowedFont
	adds r0, r7, 0
	adds r0, 0x20
	adds r4, 0x20
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x5]
	ldrb r1, [r5, 0x4]
	str r1, [sp]
	adds r1, r4, 0
	bl ApplyColors_ShadowedFont
	adds r2, r6, 0x1
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl WriteGlyphTilemap
	b _080046F0
_08004616:
	add r1, sp, 0x4
	ldrb r0, [r5]
	strb r0, [r1]
	adds r2, r1, 0
	ldrb r0, [r5, 0x10]
	ldrb r1, [r5, 0x12]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	strb r0, [r2, 0x1]
	cmp r0, 0
	beq _0800468A
	ldrb r0, [r5, 0x1]
	ldrb r1, [r5, 0x2]
	add r3, sp, 0x14
	add r2, sp, 0x18
	str r2, [sp]
	movs r2, 0
	bl GetGlyphTilePointers
	add r2, sp, 0x4
	adds r0, r2, 0
	ldrb r1, [r0, 0x1]
	movs r0, 0x8
	subs r0, r1
	strb r0, [r2, 0x2]
	ldr r0, [sp, 0x14]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	ldr r0, _080046E4 @ =0x030003a4
	str r0, [sp, 0x10]
	add r0, sp, 0x4
	bl DrawGlyphTile_ShadowedFont
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl DrawGlyphTile_ShadowedFont
_0800468A:
	add r1, sp, 0x4
	movs r0, 0x8
	strb r0, [r1, 0x2]
	str r7, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	ldr r0, _080046E4 @ =0x030003a4
	str r0, [sp, 0x10]
	add r0, sp, 0x4
	bl DrawGlyphTile_ShadowedFont
	ldr r0, [sp, 0x8]
	adds r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl DrawGlyphTile_ShadowedFont
	add r0, sp, 0x4
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080046E8
	adds r0, r5, 0
	movs r1, 0x2
	bl UpdateTilemap
	b _080046F0
	.align 2, 0
_080046E4: .4byte 0x030003a4
_080046E8:
	adds r0, r5, 0
	movs r1, 0x1
	bl UpdateTilemap
_080046F0:
	add sp, 0x1C
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawDownArrow

	thumb_func_start WaitWithDownArrow
WaitWithDownArrow: @ 80046F8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x1
	bl PlayerCanInterruptWait
	lsls r0, 24
	cmp r0, 0
	bne _08004716
	ldrb r0, [r4, 0xD]
	subs r0, 0x1
	strb r0, [r4, 0xD]
	lsls r0, 24
	cmp r0, 0
	beq _08004728
	b _08004734
_08004716:
	ldr r0, _08004730 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08004734
	movs r0, 0x5
	bl PlaySE
_08004728:
	adds r0, r4, 0
	bl TryEraseDownArrow
	b _0800473C
	.align 2, 0
_08004730: .4byte gMain
_08004734:
	adds r0, r4, 0
	bl DrawMovingDownArrow
	movs r5, 0
_0800473C:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end WaitWithDownArrow

	thumb_func_start DrawInitialDownArrow
DrawInitialDownArrow: @ 8004744
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x18]
	bl DrawDownArrow
	pop {r0}
	bx r0
	thumb_func_end DrawInitialDownArrow

	thumb_func_start DrawMovingDownArrow
DrawMovingDownArrow: @ 8004754
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrh r1, [r6, 0x18]
	movs r0, 0xF0
	lsls r0, 4
	ands r0, r1
	lsrs r4, r0, 8
	movs r5, 0xF
	ands r5, r1
	adds r5, 0x1
	cmp r5, 0x6
	bne _08004780
	movs r5, 0
	adds r4, 0x1
	cmp r4, 0x3
	bls _08004776
	movs r4, 0
_08004776:
	lsls r0, r4, 8
	strh r0, [r6, 0x18]
	adds r0, r6, 0
	bl DrawDownArrow
_08004780:
	lsls r0, r4, 8
	orrs r0, r5
	strh r0, [r6, 0x18]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DrawMovingDownArrow

	thumb_func_start TryEraseDownArrow
TryEraseDownArrow: @ 800478C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x18]
	adds r0, r4, 0
	bl PlayerCanInterruptWait
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080047A8
	adds r0, r4, 0
	bl EraseAtCursor
_080047A8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end TryEraseDownArrow

	thumb_func_start GetWindowTilemapEntry
GetWindowTilemapEntry: @ 800467C
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r0, [r0, 0x28]
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bx lr
	thumb_func_end GetWindowTilemapEntry

	thumb_func_start DrawWindowRect
DrawWindowRect: @ 8004690
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	lsls r1, r3, 6
	ldr r0, [r0, 0x28]
	adds r2, r0, r1
	mov r1, r8
	cmp r1, r4
	bhi _080046D2
_080046C2:
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bls _080046C2
_080046D2:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	mov r3, r9
	subs r3, 0x1
	cmp r1, r3
	bge _080046FC
	mov r0, r8
	lsls r7, r0, 1
	lsls r5, r4, 1
_080046E8:
	adds r2, 0x40
	adds r0, r7, r2
	strh r6, [r0]
	adds r0, r5, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r3
	blt _080046E8
_080046FC:
	cmp r12, r9
	beq _08004718
	adds r2, 0x40
	mov r1, r8
	cmp r1, r4
	bhi _08004718
_08004708:
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bls _08004708
_08004718:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawWindowRect

	thumb_func_start DrawWindowRect_DefaultPalette
DrawWindowRect_DefaultPalette: @ 8004724
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r6, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r0, 0x6]
	lsls r1, 28
	orrs r1, r6
	lsrs r1, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DrawWindowRect
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DrawWindowRect_DefaultPalette

	thumb_func_start FillWindowRect
FillWindowRect: @ 8004758
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	adds r2, r3, 0
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	lsls r1, r2, 6
	ldr r0, [r0, 0x28]
	adds r4, r0, r1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r2, r9
	bhi _080047BA
_08004790:
	mov r1, r8
	adds r5, r3, 0x1
	adds r2, r4, 0
	adds r2, 0x40
	cmp r1, r6
	bhi _080047AE
_0800479C:
	lsls r0, r1, 1
	adds r0, r4
	mov r7, r12
	strh r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bls _0800479C
_080047AE:
	adds r4, r2, 0
	adds r1, r3, 0
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r1, r9
	bls _08004790
_080047BA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end FillWindowRect

	thumb_func_start FillWindowRect_DefaultPalette
FillWindowRect_DefaultPalette: @ 80047C8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r6, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r0, 0x6]
	lsls r1, 28
	orrs r1, r6
	lsrs r1, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl FillWindowRect
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FillWindowRect_DefaultPalette

	thumb_func_start ZeroFillWindowRect
ZeroFillWindowRect: @ 80047FC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r1, 24
	lsrs r1, 24
	str r3, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl FillWindowRect_DefaultPalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ZeroFillWindowRect

	thumb_func_start FillWindowRectWithBlankTile
FillWindowRectWithBlankTile: @ 800482C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x20]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	bl GetBlankTileNum
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r0, r9
	adds r2, r6, 0
	mov r3, r8
	bl FillWindowRect_DefaultPalette
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FillWindowRectWithBlankTile

	thumb_func_start GetBlankTileNum
GetBlankTileNum: @ 80049B0
	push {lr}
	ldrh r2, [r0, 0x1A]
	ldrb r1, [r0]
	cmp r1, 0x1
	beq _080049C6
	cmp r1, 0x1
	ble _08004A04
	cmp r1, 0x2
	bne _08004A04
	adds r0, r2, 0x1
	b _080049FC
_080049C6:
	ldrb r0, [r0, 0x1]
	cmp r0, 0x6
	bhi _08004A02
	lsls r0, 2
	ldr r1, _080049D8 @ =_080049DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080049D8: .4byte _080049DC
	.align 2, 0
_080049DC:
	.4byte _08004A04
	.4byte _080049F8
	.4byte _080049F8
	.4byte _08004A04
	.4byte _080049F8
	.4byte _080049F8
	.4byte _08004A04
_080049F8:
	adds r0, r2, 0
	adds r0, 0xD4
_080049FC:
	lsls r0, 16
	lsrs r2, r0, 16
	b _08004A04
_08004A02:
	movs r2, 0
_08004A04:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end GetBlankTileNum

	thumb_func_start sub_80048D8
sub_80048D8: @ 8004A0C
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	strb r1, [r3, 0x10]
	movs r1, 0xF8
	ands r2, r1
	strb r2, [r3, 0x11]
	bx lr
	thumb_func_end sub_80048D8

	thumb_func_start GetGlyphWidth
GetGlyphWidth: @ 8004A1C
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	movs r1, 0x8
	ldrb r0, [r2, 0x2]
	cmp r0, 0x1
	beq _08004A9A
	ldrb r1, [r2, 0xE]
	cmp r1, 0
	bne _08004A9A
	ldrb r0, [r2, 0x1]
	cmp r0, 0x6
	bhi _08004A98
	lsls r0, 2
	ldr r1, _08004A40 @ =_08004A44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08004A40: .4byte _08004A44
	.align 2, 0
_08004A44:
	.4byte _08004A70
	.4byte _08004A7C
	.4byte _08004A7C
	.4byte _08004A60
	.4byte _08004A68
	.4byte _08004A68
	.4byte _08004A98
_08004A60:
	ldr r0, _08004A64 @ =0x081f3510
	b _08004A72
	.align 2, 0
_08004A64: .4byte 0x081f3510
_08004A68:
	ldr r2, _08004A6C @ =0x081f3336
	b _08004A7E
	.align 2, 0
_08004A6C: .4byte 0x081f3336
_08004A70:
	ldr r0, _08004A78 @ =0x081f3412
_08004A72:
	adds r0, r3, r0
	ldrb r1, [r0]
	b _08004A9A
	.align 2, 0
_08004A78: .4byte 0x081f3412
_08004A7C:
	ldr r2, _08004A90 @ =0x081f325a
_08004A7E:
	ldr r1, _08004A94 @ =0x081f2f6c
	lsls r0, r3, 1
	adds r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
	ldrb r1, [r0]
	b _08004A9A
	.align 2, 0
_08004A90: .4byte 0x081f325a
_08004A94: .4byte 0x081f2f6c
_08004A98:
	movs r1, 0x8
_08004A9A:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end GetGlyphWidth

	thumb_func_start GetExtCtrlCodeLength
GetExtCtrlCodeLength: @ 800496C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0
	cmp r1, 0x16
	bhi _0800497E
	ldr r0, _08004984 @ =0x081f3b57
	adds r0, r1, r0
	ldrb r0, [r0]
_0800497E:
	pop {r1}
	bx r1
	.align 2, 0
_08004984: .4byte 0x081f3b57
	thumb_func_end GetExtCtrlCodeLength

	thumb_func_start AlignInt1
AlignInt1: @ 8004988
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, r2, 0
	ldr r0, [sp, 0x20]
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r0, 0x1
	beq _080049C4
	cmp r0, 0x1
	bgt _080049AC
	cmp r0, 0
	beq _080049B2
	b _08004A3C
_080049AC:
	cmp r2, 0x2
	beq _080049F4
	b _08004A3C
_080049B2:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	b _08004A2C
_080049C4:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _080049E8
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	strb r0, [r4, 0x2]
	adds r4, 0x3
_080049E8:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	b _08004A3C
_080049F4:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004A1E
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004A1E:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	cmp r6, r5
	bls _08004A3C
_08004A2C:
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	strb r6, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xFF
	strb r0, [r4]
_08004A3C:
	adds r0, r4, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end AlignInt1

	thumb_func_start AlignInt2
AlignInt2: @ 8004A48
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, r2, 0
	ldr r0, [sp, 0x20]
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r0, 0x1
	beq _08004A9A
	cmp r0, 0x1
	bgt _08004A6C
	cmp r0, 0
	beq _08004A72
	b _08004B1A
_08004A6C:
	cmp r2, 0x2
	beq _08004ACA
	b _08004B1A
_08004A72:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	b _08004B12
_08004A9A:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004ABE
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004ABE:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	b _08004B1A
_08004ACA:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004AF4
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004AF4:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	cmp r6, r5
	bls _08004B1A
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
_08004B12:
	strb r0, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xFF
	strb r0, [r4]
_08004B1A:
	adds r0, r4, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end AlignInt2

	thumb_func_start AlignString
AlignString: @ 8004B24
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r7, r2, 0
	ldr r0, [sp, 0x14]
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _08004B58
	cmp r0, 0x1
	bgt _08004B46
	cmp r0, 0
	beq _08004B4C
	b _08004BC4
_08004B46:
	cmp r1, 0x2
	beq _08004B82
	b _08004BC4
_08004B4C:
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r4, r0, 0
	b _08004BB4
_08004B58:
	adds r0, r5, 0
	adds r1, r7, 0
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004B76
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004B76:
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r4, r0, 0
	b _08004BC4
_08004B82:
	adds r0, r5, 0
	adds r1, r7, 0
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004BA6
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004BA6:
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r4, r0, 0
	cmp r6, r5
	bls _08004BC4
_08004BB4:
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	strb r6, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xFF
	strb r0, [r4]
_08004BC4:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end AlignString

	thumb_func_start GetStringWidth
GetStringWidth: @ 8004BCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	adds r7, r1, 0
	movs r2, 0
	ldrb r0, [r5, 0x1]
	mov r10, r0
	ldrb r1, [r5, 0x2]
	mov r9, r1
	ldrb r0, [r5, 0xE]
	mov r8, r0
	movs r6, 0
	ldrb r0, [r7]
	cmp r0, 0xFF
	beq _08004CE6
_08004BF2:
	adds r0, r7, r6
	ldrb r1, [r0]
	cmp r1, 0xFC
	beq _08004C22
	cmp r1, 0xFD
	bne _08004CCC
	adds r6, 0x1
	ldrb r4, [r5, 0x2]
	adds r0, r7, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r5, 0
	bl GetStringWidth
	ldr r2, [sp]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
	strb r4, [r5, 0x2]
	adds r6, 0x1
	b _08004CDE
_08004C22:
	adds r6, 0x1
	adds r0, r7, r6
	ldrb r0, [r0]
	subs r0, 0x6
	cmp r0, 0x10
	bhi _08004CB8
	lsls r0, 2
	ldr r1, _08004C38 @ =_08004C3C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08004C38: .4byte _08004C3C
	.align 2, 0
_08004C3C:
	.4byte _08004C80
	.4byte _08004C88
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004C90
	.4byte _08004C9C
	.4byte _08004C9C
	.4byte _08004CA8
	.4byte _08004CB0
	.4byte _08004CB4
_08004C80:
	adds r0, r6, r7
	ldrb r0, [r0, 0x1]
	strb r0, [r5, 0x1]
	b _08004CB8
_08004C88:
	ldr r0, [r5, 0x2C]
	ldrb r0, [r0, 0x8]
	strb r0, [r5, 0x1]
	b _08004CB8
_08004C90:
	adds r0, r6, r7
	ldrb r0, [r0, 0x1]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
	b _08004CB8
_08004C9C:
	adds r0, r6, r7
	ldrb r1, [r0, 0x1]
	cmp r2, r1
	bcs _08004CB8
	ldrb r2, [r0, 0x1]
	b _08004CB8
_08004CA8:
	adds r0, r6, r7
	ldrb r0, [r0, 0x1]
	strb r0, [r5, 0xE]
	b _08004CB8
_08004CB0:
	movs r0, 0x1
	b _08004CB6
_08004CB4:
	movs r0, 0x5
_08004CB6:
	strb r0, [r5, 0x2]
_08004CB8:
	adds r0, r7, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0
	ldr r2, [sp]
	b _08004CDE
_08004CCC:
	adds r6, 0x1
	adds r0, r5, 0
	str r2, [sp]
	bl GetGlyphWidth
	ldr r2, [sp]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
_08004CDE:
	adds r0, r7, r6
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08004BF2
_08004CE6:
	mov r0, r8
	strb r0, [r5, 0xE]
	mov r1, r9
	strb r1, [r5, 0x2]
	mov r0, r10
	strb r0, [r5, 0x1]
	adds r0, r2, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetStringWidth

	thumb_func_start sub_8004D04
sub_8004D04: @ 8004D04
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	bl sub_8002E4C
	adds r0, r5, 0
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8004D04

	thumb_func_start sub_8004D38
sub_8004D38: @ 8004D38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	adds r6, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x20]
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	bl GetStringWidth
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r7, 0x7
	lsrs r0, 3
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r5, [sp]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	adds r3, r4, 0
	bl InitWindow
	mov r0, r9
	bl EraseAtCursor
	movs r0, 0x7
	ands r7, r0
	cmp r7, 0
	beq _08004D8E
	movs r0, 0x8
	subs r0, r7
	lsls r0, 24
	lsrs r7, r0, 24
_08004D8E:
	mov r0, r9
	adds r1, r7, 0
	movs r2, 0
	bl sub_80048D8
	mov r0, r9
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8004D38

	thumb_func_start sub_8004DB0
sub_8004DB0: @ 8004DB0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	mov r8, r0
	mov r9, r1
	adds r4, r3, 0
	ldr r6, [sp, 0x20]
	ldr r5, [sp, 0x24]
	lsls r2, 16
	lsrs r2, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 16
	str r2, [sp, 0x4]
	bl GetStringWidth
	lsrs r5, 17
	lsls r0, 24
	lsrs r0, 25
	subs r5, r0
	lsls r5, 24
	lsrs r5, 24
	lsrs r0, r5, 3
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r6, [sp]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, 0x4]
	adds r3, r4, 0
	bl InitWindow
	mov r0, r8
	bl EraseAtCursor
	movs r1, 0x7
	ands r1, r5
	mov r0, r8
	movs r2, 0
	bl sub_80048D8
	mov r0, r8
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8004DB0

	thumb_func_start sub_8004E24
sub_8004E24: @ 8004E24
	ldrb r0, [r0, 0x6]
	bx lr
	thumb_func_end sub_8004E24

	thumb_func_start sub_8004E28
sub_8004E28: @ 8004E28
	push {r4,lr}
	ldrb r4, [r0, 0x3]
	strb r4, [r1]
	ldrb r1, [r0, 0x4]
	strb r1, [r2]
	ldrb r0, [r0, 0x5]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8004E28

	thumb_func_start sub_8004E3C
sub_8004E3C: @ 8004E3C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r1, r2, 0
	ldr r4, _08004E68 @ =0x03000328
	str r0, [r4, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl InitWindow
	str r5, [r4, 0x24]
	adds r0, r4, 0
	bl sub_8002F44
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004E68: .4byte 0x03000328
	thumb_func_end sub_8004E3C

	thumb_func_start GetStringWidthGivenWindowConfig
GetStringWidthGivenWindowConfig: @ 8004E6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	ldr r4, _08004E98 @ =0x03000328
	str r0, [r4, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl InitWindow
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetStringWidth
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004E98: .4byte 0x03000328
	thumb_func_end GetStringWidthGivenWindowConfig

	thumb_func_start ConvertInternationalString
ConvertInternationalString: @ 8004E9C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _08004EFC
	bl StripExtCtrlCodes
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r2, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	adds r1, r4, r1
	movs r0, 0xFC
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r4, r3
	movs r0, 0x16
	strb r0, [r3]
	adds r0, r2, 0x1
	lsls r0, 24
	adds r2, r4, r2
	movs r1, 0xFF
	strb r1, [r2]
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	b _08004EEE
_08004EE4:
	adds r1, r2, r4
	ldrb r0, [r1]
	strb r0, [r1, 0x2]
	subs r0, r2, 0x1
	lsls r0, 24
_08004EEE:
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08004EE4
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x15
	strb r0, [r4, 0x1]
_08004EFC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ConvertInternationalString

	thumb_func_start StripExtCtrlCodes
StripExtCtrlCodes: @ 8004F04
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	movs r6, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08004F54
_08004F12:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFC
	bne _08004F34
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, r4
	ldrb r0, [r0]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _08004F4C
_08004F34:
	adds r2, r6, 0
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, r5, r2
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r1, r5, r1
	ldrb r0, [r1]
	strb r0, [r2]
_08004F4C:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08004F12
_08004F54:
	adds r1, r5, r6
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end StripExtCtrlCodes

	thumb_func_start SkipExtCtrlCode
SkipExtCtrlCode: @ 8005094
	push {r4,lr}
	adds r4, r0, 0
	b _080050A8
_0800509A:
	adds r4, 0x1
	ldrb r0, [r4]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0
_080050A8:
	ldrb r0, [r4]
	cmp r0, 0xFC
	beq _0800509A
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SkipExtCtrlCode

	thumb_func_start StringCompareWithoutExtCtrlCodes
StringCompareWithoutExtCtrlCodes: @ 8004F84
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r6, 0
	b _08004FA6
_08004F8E:
	cmp r1, r0
	bcs _08004F9C
	movs r6, 0x1
	negs r6, r6
	cmp r0, 0xFF
	bne _08004F9C
	movs r6, 0x1
_08004F9C:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08004FC6
	adds r4, 0x1
	adds r5, 0x1
_08004FA6:
	adds r0, r4, 0
	bl SkipExtCtrlCode
	adds r4, r0, 0
	adds r0, r5, 0
	bl SkipExtCtrlCode
	adds r5, r0, 0
	ldrb r1, [r4]
	ldrb r0, [r5]
	cmp r1, r0
	bls _08004F8E
	movs r6, 0x1
	cmp r1, 0xFF
	bne _08004FC6
	subs r6, 0x2
_08004FC6:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StringCompareWithoutExtCtrlCodes

	thumb_func_start sub_8004FD0
sub_8004FD0: @ 8004FD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	mov r10, r0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x38]
	ldr r1, [sp, 0x3C]
	ldr r2, [sp, 0x40]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x8]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	movs r7, 0
	cmp r5, 0
	bne _08005008
	ldr r5, _0800500C @ =gStringVar4
_08005008:
	str r5, [sp, 0x14]
	b _0800505A
	.align 2, 0
_0800500C: .4byte gStringVar4
_08005010:
	ldrb r1, [r6]
	cmp r1, 0xFC
	beq _08005024
	cmp r1, 0xFE
	beq _08005042
	strb r1, [r5]
	adds r5, 0x1
	adds r6, 0x1
	movs r0, 0x1
	b _0800505C
_08005024:
	ldrb r0, [r6, 0x1]
	bl GetExtCtrlCodeLength
	adds r4, r0, 0
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl memcpy
	adds r5, r4
	adds r6, r4
	b _0800505E
_08005042:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	mov r0, r9
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	adds r5, 0x4
	adds r6, 0x1
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_0800505A:
	movs r0, 0
_0800505C:
	mov r8, r0
_0800505E:
	ldrb r0, [r6]
	cmp r0, 0xFF
	bne _08005010
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	mov r0, r9
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	mov r0, r8
	cmp r0, 0
	beq _08005080
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08005080:
	ldr r0, [sp, 0x10]
	str r0, [sp]
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x4]
	mov r0, r10
	ldr r1, [sp, 0x14]
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0xC]
	bl sub_8002E4C
	mov r0, r10
	bl sub_8002F44
	adds r0, r7, 0
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8004FD0

	thumb_func_start DrawGlyphTile_UnshadowedFont
DrawGlyphTile_UnshadowedFont: @ 80051E0
	push {r4-r7,lr}
	sub sp, 0x8
	adds r7, r0, 0
	ldr r6, _08005278 @ =0x03000360
	ldr r5, [r7, 0x8]
	ldrb r0, [r7, 0x2]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 5
	ldrb r1, [r7, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0800527C @ =0x081f3658
	adds r0, r1
	adds r2, r0
	ldr r1, [r2]
	ldr r0, [r2, 0x8]
	orrs r1, r0
	ldr r0, [r5]
	ands r0, r1
	str r0, [r6]
	ldr r0, [r5, 0x4]
	ands r0, r1
	str r0, [r6, 0x4]
	ldr r0, [r5, 0x8]
	ands r0, r1
	str r0, [r6, 0x8]
	ldr r0, [r5, 0xC]
	ands r0, r1
	str r0, [r6, 0xC]
	ldr r0, [r5, 0x10]
	ands r0, r1
	str r0, [r6, 0x10]
	ldr r0, [r5, 0x14]
	ands r0, r1
	str r0, [r6, 0x14]
	ldr r0, [r5, 0x18]
	ands r0, r1
	str r0, [r6, 0x18]
	ldr r0, [r5, 0x1C]
	ands r0, r1
	str r0, [r6, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _080052B0
	ldr r1, [r2, 0x4]
	ldrb r0, [r7]
	cmp r0, 0x2
	bne _08005280
	ldr r0, [r5, 0x20]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x24]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x28]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x2C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x30]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x34]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x38]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x3C]
	b _080052AC
	.align 2, 0
_08005278: .4byte 0x03000360
_0800527C: .4byte 0x081f3658
_08005280:
	ldr r0, [r5, 0x40]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x44]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x48]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x4C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x50]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x54]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x58]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x5C]
_080052AC:
	ands r0, r1
	str r0, [r6, 0x3C]
_080052B0:
	ldr r1, [r7, 0xC]
	ldr r0, [r1]
	str r0, [sp]
	ldr r0, [r1, 0x3C]
	str r0, [sp, 0x4]
	ldr r1, _08005334 @ =0x081f3b70
	ldrb r0, [r7, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r7, 0x4]
	ldrb r3, [r7, 0x1]
	ldr r4, [r0]
	adds r0, r6, 0
	mov r2, sp
	bl _call_via_r4
	ldr r0, [r6]
	str r0, [r5]
	ldr r0, [r6, 0x4]
	str r0, [r5, 0x4]
	ldr r0, [r6, 0x8]
	str r0, [r5, 0x8]
	ldr r0, [r6, 0xC]
	str r0, [r5, 0xC]
	ldr r0, [r6, 0x10]
	str r0, [r5, 0x10]
	ldr r0, [r6, 0x14]
	str r0, [r5, 0x14]
	ldr r0, [r6, 0x18]
	str r0, [r5, 0x18]
	ldr r0, [r6, 0x1C]
	str r0, [r5, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _08005322
	ldrb r0, [r7]
	cmp r0, 0x2
	beq _08005302
	adds r5, 0x20
_08005302:
	ldr r0, [r6, 0x20]
	str r0, [r5, 0x20]
	ldr r0, [r6, 0x24]
	str r0, [r5, 0x24]
	ldr r0, [r6, 0x28]
	str r0, [r5, 0x28]
	ldr r0, [r6, 0x2C]
	str r0, [r5, 0x2C]
	ldr r0, [r6, 0x30]
	str r0, [r5, 0x30]
	ldr r0, [r6, 0x34]
	str r0, [r5, 0x34]
	ldr r0, [r6, 0x38]
	str r0, [r5, 0x38]
	ldr r0, [r6, 0x3C]
	str r0, [r5, 0x3C]
_08005322:
	ldrb r1, [r7, 0x1]
	ldrb r0, [r7, 0x2]
	adds r0, r1, r0
	asrs r0, 3
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005334: .4byte 0x081f3b70
	thumb_func_end DrawGlyphTile_UnshadowedFont

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width0
ShiftGlyphTile_UnshadowedFont_Width0: @ 8005338
	bx lr
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width0

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width1
ShiftGlyphTile_UnshadowedFont_Width1: @ 800533C
	push {r4-r7,lr}
	mov r12, r0
	adds r7, r1, 0
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005384 @ =0x081f39b8
	adds r5, r3, r0
	movs r4, 0
_0800534E:
	adds r0, r7, r4
	ldrb r0, [r0]
	lsrs r0, 7
	lsls r0, 2
	adds r0, r6
	ldr r3, [r0]
	lsls r2, r4, 2
	add r2, r12
	ldr r0, [r5]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r5, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0800534E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005384: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width1

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width2
ShiftGlyphTile_UnshadowedFont_Width2: @ 8005388
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080053F0 @ =0x081f39b8
	adds r5, r3, r0
	movs r4, 0
	movs r7, 0x1
_080053A0:
	mov r1, r12
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, 24
	lsrs r1, r0, 31
	ands r1, r7
	lsls r1, 2
	adds r1, r6
	lsrs r0, 30
	ands r0, r7
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsls r2, r4, 2
	add r2, r8
	ldr r0, [r5]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r5, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080053A0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080053F0: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width2

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width3
ShiftGlyphTile_UnshadowedFont_Width3: @ 80053F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005478 @ =0x081f39b8
	adds r7, r3, r0
	movs r5, 0
	movs r6, 0x1
_0800540C:
	mov r1, r12
	adds r0, r1, r5
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r2, 28
	ands r2, r6
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 12
	orrs r3, r0
	lsls r2, r5, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0800540C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005478: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width3

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width4
ShiftGlyphTile_UnshadowedFont_Width4: @ 800547C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005500 @ =0x081f39b8
	adds r7, r3, r0
	movs r5, 0
	movs r6, 0x1
_08005494:
	mov r1, r12
	adds r0, r1, r5
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r2, 28
	ands r2, r6
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 12
	orrs r3, r0
	lsls r2, r5, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08005494
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005500: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width4

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width5
ShiftGlyphTile_UnshadowedFont_Width5: @ 8005504
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005594 @ =0x081f39b8
	adds r7, r3, r0
	movs r5, 0
	movs r6, 0x1
_0800551C:
	mov r1, r12
	adds r0, r1, r5
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r2, 27
	ands r2, r6
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 16
	orrs r3, r0
	lsls r2, r5, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0800551C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005594: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width5

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width6
ShiftGlyphTile_UnshadowedFont_Width6: @ 8005598
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005638 @ =0x081f39b8
	adds r7, r3, r0
	movs r6, 0
	movs r5, 0x1
_080055B0:
	mov r1, r12
	adds r0, r1, r6
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r5
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r0, r2, 27
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 16
	orrs r3, r0
	lsrs r2, 26
	ands r2, r5
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 20
	orrs r3, r0
	lsls r2, r6, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _080055B0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005638: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width6

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width7
ShiftGlyphTile_UnshadowedFont_Width7: @ 800563C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080056E8 @ =0x081f39b8
	adds r7, r3, r0
	movs r6, 0
	movs r5, 0x1
_08005654:
	mov r1, r12
	adds r0, r1, r6
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r5
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r0, r2, 27
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 16
	orrs r3, r0
	lsrs r0, r2, 26
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 20
	orrs r3, r0
	lsrs r2, 25
	ands r2, r5
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 24
	orrs r3, r0
	lsls r2, r6, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08005654
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080056E8: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width7

	thumb_func_start ShiftGlyphTile_UnshadowedFont_Width8
ShiftGlyphTile_UnshadowedFont_Width8: @ 80056EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r8, r1
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080057B0 @ =0x081f39b8
	adds r3, r0
	mov r12, r3
	movs r7, 0
	movs r6, 0x1
_08005708:
	mov r1, r8
	adds r0, r1, r7
	ldrb r4, [r0]
	lsls r2, r4, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r5
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r0, r2, 27
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 16
	orrs r3, r0
	lsrs r0, r2, 26
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 20
	orrs r3, r0
	lsrs r2, 25
	ands r2, r6
	lsls r2, 2
	adds r2, r5
	ldr r0, [r2]
	lsls r0, 24
	orrs r3, r0
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 28
	orrs r3, r0
	lsls r2, r7, 2
	add r2, r9
	mov r1, r12
	ldr r0, [r1]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	mov r1, r12
	ldr r0, [r1, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _08005708
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080057B0: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_UnshadowedFont_Width8

	thumb_func_start DrawGlyphTile_ShadowedFont
DrawGlyphTile_ShadowedFont: @ 80057B4
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r6, _08005848 @ =0x03000360
	ldr r5, [r7, 0x8]
	ldrb r0, [r7, 0x2]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 5
	ldrb r1, [r7, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0800584C @ =0x081f3658
	adds r0, r1
	adds r2, r0
	ldr r1, [r2]
	ldr r0, [r2, 0x8]
	orrs r1, r0
	ldr r0, [r5]
	ands r0, r1
	str r0, [r6]
	ldr r0, [r5, 0x4]
	ands r0, r1
	str r0, [r6, 0x4]
	ldr r0, [r5, 0x8]
	ands r0, r1
	str r0, [r6, 0x8]
	ldr r0, [r5, 0xC]
	ands r0, r1
	str r0, [r6, 0xC]
	ldr r0, [r5, 0x10]
	ands r0, r1
	str r0, [r6, 0x10]
	ldr r0, [r5, 0x14]
	ands r0, r1
	str r0, [r6, 0x14]
	ldr r0, [r5, 0x18]
	ands r0, r1
	str r0, [r6, 0x18]
	ldr r0, [r5, 0x1C]
	ands r0, r1
	str r0, [r6, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _08005880
	ldr r1, [r2, 0x4]
	ldrb r0, [r7]
	cmp r0, 0x2
	bne _08005850
	ldr r0, [r5, 0x20]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x24]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x28]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x2C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x30]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x34]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x38]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x3C]
	b _0800587C
	.align 2, 0
_08005848: .4byte 0x03000360
_0800584C: .4byte 0x081f3658
_08005850:
	ldr r0, [r5, 0x40]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x44]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x48]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x4C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x50]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x54]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x58]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x5C]
_0800587C:
	ands r0, r1
	str r0, [r6, 0x3C]
_08005880:
	ldr r1, _080058F8 @ =0x081f3b94
	ldrb r0, [r7, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r7, 0x4]
	ldr r2, [r7, 0xC]
	ldrb r3, [r7, 0x1]
	ldr r4, [r0]
	adds r0, r6, 0
	bl _call_via_r4
	ldr r0, [r6]
	str r0, [r5]
	ldr r0, [r6, 0x4]
	str r0, [r5, 0x4]
	ldr r0, [r6, 0x8]
	str r0, [r5, 0x8]
	ldr r0, [r6, 0xC]
	str r0, [r5, 0xC]
	ldr r0, [r6, 0x10]
	str r0, [r5, 0x10]
	ldr r0, [r6, 0x14]
	str r0, [r5, 0x14]
	ldr r0, [r6, 0x18]
	str r0, [r5, 0x18]
	ldr r0, [r6, 0x1C]
	str r0, [r5, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _080058E8
	ldrb r0, [r7]
	cmp r0, 0x2
	beq _080058C8
	adds r5, 0x20
_080058C8:
	ldr r0, [r6, 0x20]
	str r0, [r5, 0x20]
	ldr r0, [r6, 0x24]
	str r0, [r5, 0x24]
	ldr r0, [r6, 0x28]
	str r0, [r5, 0x28]
	ldr r0, [r6, 0x2C]
	str r0, [r5, 0x2C]
	ldr r0, [r6, 0x30]
	str r0, [r5, 0x30]
	ldr r0, [r6, 0x34]
	str r0, [r5, 0x34]
	ldr r0, [r6, 0x38]
	str r0, [r5, 0x38]
	ldr r0, [r6, 0x3C]
	str r0, [r5, 0x3C]
_080058E8:
	ldrb r1, [r7, 0x1]
	ldrb r0, [r7, 0x2]
	adds r0, r1, r0
	asrs r0, 3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080058F8: .4byte 0x081f3b94
	thumb_func_end DrawGlyphTile_ShadowedFont

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width0
ShiftGlyphTile_ShadowedFont_Width0: @ 80058FC
	bx lr
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width0

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width1
ShiftGlyphTile_ShadowedFont_Width1: @ 8005900
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	adds r7, r1, 0
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005958 @ =0x081f39b8
	adds r5, r3, r0
	movs r4, 0
	movs r0, 0xF
	mov r8, r0
_0800591A:
	lsls r2, r4, 2
	adds r0, r2, r7
	ldr r0, [r0]
	mov r1, r8
	ands r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r3, [r0]
	add r2, r12
	ldr r0, [r5]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r5, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0800591A
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005958: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width1

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width2
ShiftGlyphTile_ShadowedFont_Width2: @ 800595C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080059C0 @ =0x081f39b8
	adds r5, r3, r0
	movs r4, 0
	movs r7, 0xF
_08005974:
	lsls r3, r4, 2
	mov r1, r12
	adds r0, r3, r1
	ldr r0, [r0]
	adds r1, r0, 0
	ands r1, r7
	lsls r1, 2
	adds r1, r6
	lsrs r0, 4
	ands r0, r7
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 4
	ldr r2, [r1]
	orrs r2, r0
	add r3, r8
	ldr r0, [r5]
	adds r1, r2, 0
	lsls r1, r0
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldr r0, [r5, 0x4]
	lsrs r2, r0
	ldr r0, [r3, 0x20]
	orrs r0, r2
	str r0, [r3, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08005974
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080059C0: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width2

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width3
ShiftGlyphTile_ShadowedFont_Width3: @ 80059C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r8, r1
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005A40 @ =0x081f39b8
	adds r7, r3, r0
	movs r5, 0
	movs r0, 0xF
	mov r12, r0
_080059E0:
	lsls r4, r5, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r2, [r0]
	adds r1, r2, 0
	mov r3, r12
	ands r1, r3
	lsls r1, 2
	adds r1, r6
	lsrs r0, r2, 4
	ands r0, r3
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r2, 8
	mov r0, r12
	ands r2, r0
	lsls r2, 2
	adds r2, r6
	ldr r0, [r2]
	lsls r0, 8
	orrs r3, r0
	add r4, r9
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r4, 0x20]
	orrs r0, r3
	str r0, [r4, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080059E0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005A40: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width3

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width4
ShiftGlyphTile_ShadowedFont_Width4: @ 8005A44
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r8, r1
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005AD0 @ =0x081f39b8
	adds r3, r0
	mov r12, r3
	movs r6, 0
	movs r7, 0xF
_08005A60:
	lsls r4, r6, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r2, [r0]
	adds r1, r2, 0
	ands r1, r7
	lsls r1, 2
	adds r1, r5
	lsrs r0, r2, 4
	ands r0, r7
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 8
	ands r0, r7
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r2, 12
	ands r2, r7
	lsls r2, 2
	adds r2, r5
	ldr r0, [r2]
	lsls r0, 12
	orrs r3, r0
	add r4, r9
	mov r1, r12
	ldr r0, [r1]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
	mov r1, r12
	ldr r0, [r1, 0x4]
	lsrs r3, r0
	ldr r0, [r4, 0x20]
	orrs r0, r3
	str r0, [r4, 0x20]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08005A60
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005AD0: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width4

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width5
ShiftGlyphTile_ShadowedFont_Width5: @ 8005AD4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _08005DE0 @ =0x081f39b8
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	orrs r7, r1
	lsrs r5, 16
	ands r5, r6
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 16
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005DE0: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width5

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width6
ShiftGlyphTile_ShadowedFont_Width6: @ 8005DE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _08006160 @ =0x081f39b8
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	orrs r7, r1
	lsrs r1, r5, 16
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 16
	orrs r7, r1
	lsrs r5, 20
	ands r5, r6
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 20
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006160: .4byte 0x081f39b8
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width6

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width7
ShiftGlyphTile_ShadowedFont_Width7: @ 8006164
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _08006548 @ =0x081f39b8
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	orrs r7, r1
	lsrs r1, r5, 16
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 16
	orrs r7, r1
	lsrs r1, r5, 20
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 20
	orrs r7, r1
	lsrs r5, 24
	ands r5, r6
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 24
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	b _0800654C
	.align 2, 0
_08006548: .4byte 0x081f39b8
_0800654C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width7

	thumb_func_start ShiftGlyphTile_ShadowedFont_Width8
ShiftGlyphTile_ShadowedFont_Width8: @ 8006558
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _0800694C @ =0x081f39b8
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	b _08006950
	.align 2, 0
_0800694C: .4byte 0x081f39b8
_08006950:
	orrs r7, r1
	lsrs r1, r5, 16
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 16
	orrs r7, r1
	lsrs r1, r5, 20
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 20
	orrs r7, r1
	lsrs r1, r5, 24
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 24
	orrs r7, r1
	lsrs r5, 28
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 28
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ShiftGlyphTile_ShadowedFont_Width8

	thumb_func_start DrawGlyphTiles
DrawGlyphTiles: @ 80069A8
	push {r4-r7,lr}
	sub sp, 0x1C
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	movs r7, 0
	ldrb r0, [r6, 0x1]
	ldrb r1, [r6, 0x2]
	lsls r4, 16
	lsrs r4, 16
	add r3, sp, 0x14
	add r2, sp, 0x18
	str r2, [sp]
	adds r2, r4, 0
	bl GetGlyphTilePointers
	add r1, sp, 0x4
	ldrb r0, [r6]
	strb r0, [r1]
	adds r2, r1, 0
	ldrb r0, [r6, 0x10]
	ldrb r1, [r6, 0x12]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	strb r0, [r2, 0x1]
	adds r0, r2, 0
	strb r5, [r0, 0x2]
	ldr r0, [sp, 0x14]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	ldr r0, _08006A0C @ =0x030003a4
	str r0, [sp, 0x10]
	ldrb r0, [r6, 0x1]
	cmp r0, 0x6
	bhi _08006A7C
	lsls r0, 2
	ldr r1, _08006A10 @ =_08006A14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006A0C: .4byte 0x030003a4
_08006A10: .4byte _08006A14
	.align 2, 0
_08006A14:
	.4byte _08006A30
	.4byte _08006A30
	.4byte _08006A30
	.4byte _08006A56
	.4byte _08006A56
	.4byte _08006A56
	.4byte _08006A30
_08006A30:
	add r0, sp, 0x4
	bl DrawGlyphTile_UnshadowedFont
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl DrawGlyphTile_UnshadowedFont
	b _08006A7A
_08006A56:
	add r0, sp, 0x4
	bl DrawGlyphTile_ShadowedFont
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl DrawGlyphTile_ShadowedFont
_08006A7A:
	adds r7, r0, 0
_08006A7C:
	adds r0, r7, 0
	add sp, 0x1C
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DrawGlyphTiles

	thumb_func_start UpdateTilemap
UpdateTilemap: @ 8006A88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	bl GetCursorTilemapPointer
	adds r6, r0, 0
	mov r0, r8
	cmp r0, 0
	beq _08006B02
	cmp r6, 0
	beq _08006B02
	ldrb r0, [r5, 0x6]
	lsls r0, 28
	lsrs r7, r0, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetCursorTileNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r7
	strh r4, [r6]
	adds r1, r6, 0
	adds r1, 0x40
	orrs r0, r7
	strh r0, [r1]
	mov r0, r8
	cmp r0, 0x2
	bne _08006B02
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetCursorTileNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x1
	bl GetCursorTileNum
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r7
	strh r4, [r6, 0x2]
	adds r1, r6, 0
	adds r1, 0x42
	orrs r0, r7
	strh r0, [r1]
_08006B02:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end UpdateTilemap

	thumb_func_start GetCursorTileNum
GetCursorTileNum: @ 8006B0C
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _08006B42
	ldrh r2, [r3, 0x1C]
	ldrh r0, [r3, 0x1A]
	adds r2, r0
	ldrh r0, [r3, 0x14]
	ldrb r1, [r3, 0x11]
	adds r0, r1
	asrs r0, 3
	adds r0, r4
	ldrb r1, [r3, 0x9]
	muls r0, r1
	adds r2, r0
	ldrb r0, [r3, 0x12]
	ldrb r1, [r3, 0x10]
	adds r0, r1
	asrs r0, 3
	adds r0, r5
	adds r2, r0
	lsls r2, 16
	lsrs r0, r2, 16
	b _08006B52
_08006B42:
	ldrh r0, [r3, 0x1C]
	ldrh r3, [r3, 0x1A]
	adds r0, r3
	lsls r1, r5, 1
	adds r0, r1
	adds r0, r4
	lsls r0, 16
	lsrs r0, 16
_08006B52:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetCursorTileNum

	.align 2, 0 @ Don't pad with nop.
