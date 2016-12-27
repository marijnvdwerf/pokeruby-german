	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_800D238
sub_800D238: @ 800D40C
	push {lr}
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end sub_800D238

	thumb_func_start LZDecompressVram
LZDecompressVram: @ 800D418
	push {lr}
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	thumb_func_end LZDecompressVram

	thumb_func_start LoadCompressedObjectPic
LoadCompressedObjectPic: @ 800D424
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [r4]
	movs r5, 0x80
	lsls r5, 18
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadCompressedObjectPic

	thumb_func_start LoadCompressedObjectPicOverrideBuffer
LoadCompressedObjectPicOverrideBuffer: @ 800D450
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadCompressedObjectPicOverrideBuffer

	thumb_func_start LoadCompressedObjectPalette
LoadCompressedObjectPalette: @ 800D478
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5]
	movs r4, 0x80
	lsls r4, 18
	adds r1, r4, 0
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, 0x4]
	ldr r1, _0800D4A8 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D4A8: .4byte 0xffff0000
	thumb_func_end LoadCompressedObjectPalette

	thumb_func_start LoadCompressedObjectPaletteOverrideBuffer
LoadCompressedObjectPaletteOverrideBuffer: @ 800D4AC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, [r5]
	bl LZ77UnCompWram
	str r4, [sp]
	ldrh r2, [r5, 0x4]
	ldr r1, _0800D4D8 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D4D8: .4byte 0xffff0000
	thumb_func_end LoadCompressedObjectPaletteOverrideBuffer

	thumb_func_start DecompressPicFromTable_2
DecompressPicFromTable_2: @ 800D4DC
	push {lr}
	adds r2, r0, 0
	ldr r3, [sp, 0x4]
	ldr r1, [sp, 0x8]
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	ble _0800D4FC
	ldr r0, _0800D4F8 @ =gMonFrontPicTable
	ldr r0, [r0]
	adds r1, r3, 0
	bl LZ77UnCompWram
	b _0800D504
	.align 2, 0
_0800D4F8: .4byte gMonFrontPicTable
_0800D4FC:
	ldr r0, [r2]
	adds r1, r3, 0
	bl LZ77UnCompWram
_0800D504:
	pop {r0}
	bx r0
	thumb_func_end DecompressPicFromTable_2

	thumb_func_start sub_800D334
sub_800D334: @ 800D508
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r2, [sp, 0x20]
	ldr r1, _0800D528 @ =gUnknown_081FAF4C
	ldr r0, [r1]
	cmp r2, r0
	beq _0800D522
	ldr r0, [r1, 0x8]
	cmp r2, r0
	bne _0800D52C
_0800D522:
	movs r1, 0
	b _0800D52E
	.align 2, 0
_0800D528: .4byte gUnknown_081FAF4C
_0800D52C:
	movs r1, 0x1
_0800D52E:
	str r2, [sp]
	ldr r0, [sp, 0x24]
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x28]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_800D378
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_800D334

	thumb_func_start sub_800D378
sub_800D378: @ 800D54C
	push {r4-r7,lr}
	adds r1, r0, 0
	ldr r5, [sp, 0x14]
	ldr r6, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0xC9
	bne _0800D5C0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r4
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r4
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r4
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r4
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0800D594
	movs r1, 0xC9
	b _0800D59E
_0800D594:
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r1, r2
	lsls r0, 16
	lsrs r1, r0, 16
_0800D59E:
	cmp r7, 0
	bne _0800D5B0
	ldr r0, _0800D5AC @ =gMonBackPicTable
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800D5CC
	.align 2, 0
_0800D5AC: .4byte gMonBackPicTable
_0800D5B0:
	ldr r0, _0800D5BC @ =gMonFrontPicTable
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	b _0800D5CC
	.align 2, 0
_0800D5BC: .4byte gMonFrontPicTable
_0800D5C0:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	ble _0800D5D8
	ldr r0, _0800D5D4 @ =gMonFrontPicTable
	ldr r0, [r0]
_0800D5CC:
	adds r1, r5, 0
	bl LZ77UnCompWram
	b _0800D5E0
	.align 2, 0
_0800D5D4: .4byte gMonFrontPicTable
_0800D5D8:
	ldr r0, [r1]
	adds r1, r5, 0
	bl LZ77UnCompWram
_0800D5E0:
	lsls r0, r6, 16
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r7, 0
	bl DrawSpindaSpots
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800D378

	thumb_func_start Unused_LZDecompressWramIndirect
Unused_LZDecompressWramIndirect: @ 800D5F4
	push {lr}
	ldr r0, [r0]
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	thumb_func_end Unused_LZDecompressWramIndirect

	.align 2, 0 @ Don't pad with nop.
