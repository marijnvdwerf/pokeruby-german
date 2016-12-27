	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetTextWindowBaseTileNum
SetTextWindowBaseTileNum: @ 8065234
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08065244
	strh r0, [r1]
	adds r0, 0x9
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_08065244: .4byte 0x030005ac
	thumb_func_end SetTextWindowBaseTileNum

	thumb_func_start LoadTextWindowGraphics
LoadTextWindowGraphics: @ 8065248
	push {r4,lr}
	ldr r1, [r0, 0x2C]
	ldr r0, _08065270
	ldrh r0, [r0]
	lsls r0, 5
	ldr r1, [r1, 0x10]
	adds r1, r0
	ldr r4, _08065274
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	bl LoadTextWindowTiles
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	movs r1, 0xE
	bl LoadTextWindowPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065270: .4byte 0x030005ac
_08065274: .4byte gSaveBlock2
	thumb_func_end LoadTextWindowGraphics

	thumb_func_start LoadTextWindowGraphics_OverridePalSlot
LoadTextWindowGraphics_OverridePalSlot: @ 8065278
	push {r4,r5,lr}
	lsls r5, r1, 24
	lsrs r5, 24
	ldr r1, [r0, 0x2C]
	ldr r0, _080652A4
	ldrh r0, [r0]
	lsls r0, 5
	ldr r1, [r1, 0x10]
	adds r1, r0
	ldr r4, _080652A8
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	bl LoadTextWindowTiles
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	adds r1, r5, 0
	bl LoadTextWindowPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080652A4: .4byte 0x030005ac
_080652A8: .4byte gSaveBlock2
	thumb_func_end LoadTextWindowGraphics_OverridePalSlot

	thumb_func_start LoadTextWindowGraphics_OverrideFrameType
LoadTextWindowGraphics_OverrideFrameType: @ 80652AC
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r1, [r0, 0x2C]
	ldr r0, _080652D4
	ldrh r0, [r0]
	lsls r0, 5
	ldr r1, [r1, 0x10]
	adds r1, r0
	adds r0, r4, 0
	bl LoadTextWindowTiles
	adds r0, r4, 0
	movs r1, 0xE
	bl LoadTextWindowPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080652D4: .4byte 0x030005ac
	thumb_func_end LoadTextWindowGraphics_OverrideFrameType

	thumb_func_start DrawTextWindow
DrawTextWindow: @ 80652D8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r2, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, [r0, 0x2C]
	ldr r0, [r0, 0x14]
	ldr r1, _08065310
	ldrh r1, [r1]
	str r3, [sp]
	str r2, [sp, 0x4]
	adds r2, r4, 0
	adds r3, r5, 0
	bl DrawTextWindowInternal
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065310: .4byte 0x030005ac
	thumb_func_end DrawTextWindow

	thumb_func_start GetTextWindowFrameGraphics
GetTextWindowFrameGraphics: @ 8065314
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _0806532C
	lsls r0, 3
	ldr r1, _08065328
	adds r0, r1
	b _0806532E
	.align 2, 0
_08065328: .4byte gUnknown_083761F0
_0806532C:
	ldr r0, _08065334
_0806532E:
	pop {r1}
	bx r1
	.align 2, 0
_08065334: .4byte gUnknown_083761F0
	thumb_func_end GetTextWindowFrameGraphics

	thumb_func_start LoadTextWindowTiles
LoadTextWindowTiles: @ 8065338
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetTextWindowFrameGraphics
	ldr r0, [r0]
	adds r1, r4, 0
	movs r2, 0x48
	bl CpuFastSet
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end LoadTextWindowTiles

	thumb_func_start LoadTextWindowPalette
LoadTextWindowPalette: @ 8065354
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl GetTextWindowFrameGraphics
	ldr r0, [r0, 0x4]
	lsls r4, 4
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end LoadTextWindowPalette

	thumb_func_start DrawTextWindowInternal
DrawTextWindowInternal: @ 8065378
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r7, r0, 0
	ldr r0, [sp, 0x3C]
	ldr r4, [sp, 0x40]
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	adds r6, r2, 0
	lsls r3, 24
	lsrs r5, r3, 24
	mov r10, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	adds r1, r0, 0
	cmp r0, r2
	bls _080653AE
	adds r1, r2, 0
_080653AE:
	str r1, [sp]
	adds r1, r6, 0
	cmp r6, r0
	bcs _080653B8
	adds r1, r0, 0
_080653B8:
	adds r6, r1, 0
	adds r3, r4, 0
	cmp r4, r5
	bls _080653C2
	adds r3, r5, 0
_080653C2:
	adds r5, r3, 0
	mov r0, r10
	cmp r10, r8
	bcs _080653CC
	mov r0, r8
_080653CC:
	str r0, [sp, 0x4]
	lsls r3, r5, 5
	ldr r0, [sp]
	adds r1, r3, r0
	lsls r1, 1
	adds r1, r7
	movs r4, 0xE0
	lsls r4, 8
	adds r2, r4, 0
	mov r0, r9
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [sp]
	adds r1, 0x1
	lsls r0, r1, 24
	lsrs r2, r0, 24
	str r1, [sp, 0x18]
	mov r4, r9
	adds r4, 0x2
	adds r5, 0x1
	mov r8, r5
	mov r5, r9
	adds r5, 0x6
	str r5, [sp, 0x10]
	mov r0, r9
	adds r0, 0x8
	str r0, [sp, 0x14]
	cmp r2, r6
	bcs _08065426
	mov r10, r3
	mov r1, r9
	adds r1, 0x1
	ldr r5, _08065504
	adds r0, r5, 0
	orrs r1, r0
_08065412:
	mov r5, r10
	adds r0, r5, r2
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _08065412
_08065426:
	adds r0, r3, r6
	lsls r0, 1
	adds r0, r7
	ldr r2, _08065504
	adds r1, r2, 0
	orrs r4, r1
	strh r4, [r0]
	mov r4, r8
	lsls r0, r4, 24
	lsrs r3, r0, 24
	ldr r5, [sp, 0x4]
	lsls r5, 5
	mov r10, r5
	ldr r0, [sp, 0x4]
	cmp r3, r0
	bcs _080654AA
	movs r2, 0x3
	add r2, r9
	orrs r2, r1
	mov r8, r2
	ldr r4, [sp, 0x18]
	lsls r4, 24
	str r4, [sp, 0x8]
	movs r5, 0x5
	add r5, r9
	orrs r5, r1
	mov r12, r5
	mov r0, r9
	adds r0, 0x4
	str r0, [sp, 0xC]
_08065462:
	lsls r1, r3, 5
	ldr r2, [sp]
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r7
	mov r4, r8
	strh r4, [r0]
	ldr r5, [sp, 0x8]
	lsrs r2, r5, 24
	adds r5, r1, 0
	adds r3, 0x1
	cmp r2, r6
	bcs _08065496
	ldr r4, _08065504
	adds r0, r4, 0
	ldr r4, [sp, 0xC]
	orrs r4, r0
_08065484:
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r7
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _08065484
_08065496:
	adds r0, r5, r6
	lsls r0, 1
	adds r0, r7
	mov r5, r12
	strh r5, [r0]
	lsls r0, r3, 24
	lsrs r3, r0, 24
	ldr r0, [sp, 0x4]
	cmp r3, r0
	bcc _08065462
_080654AA:
	ldr r0, [sp]
	add r0, r10
	lsls r0, 1
	adds r0, r7
	ldr r1, _08065504
	adds r4, r1, 0
	ldr r2, [sp, 0x10]
	orrs r2, r4
	strh r2, [r0]
	ldr r1, [sp, 0x18]
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcs _080654E0
	mov r3, r10
	mov r1, r9
	adds r1, 0x7
	orrs r1, r4
_080654CE:
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _080654CE
_080654E0:
	mov r2, r10
	adds r0, r2, r6
	lsls r0, 1
	adds r0, r7
	ldr r4, _08065504
	adds r1, r4, 0
	ldr r5, [sp, 0x14]
	orrs r5, r1
	strh r5, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065504: .4byte 0xffffe000
	thumb_func_end DrawTextWindowInternal

	thumb_func_start SetMessageBoxBaseTileNum
SetMessageBoxBaseTileNum: @ 8065508
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08065518
	strh r0, [r1]
	adds r0, 0xE
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_08065518: .4byte 0x030005ae
	thumb_func_end SetMessageBoxBaseTileNum

	thumb_func_start unref_sub_80651DC
unref_sub_80651DC: @ 806551C
	push {lr}
	sub sp, 0x4
	ldr r2, _0806553C
	ldrh r2, [r2]
	adds r2, 0xE
	lsls r2, 16
	lsrs r2, 16
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0806553C: .4byte 0x030005ae
	thumb_func_end unref_sub_80651DC

	thumb_func_start DisplayMessageBox
DisplayMessageBox: @ 8065540
	push {r4,lr}
	adds r4, r0, 0
	bl LoadMessageBoxTiles
	adds r0, r4, 0
	bl DrawStandardMessageBox
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DisplayMessageBox

	thumb_func_start GetMessageBoxTilemapEntry
GetMessageBoxTilemapEntry: @ 8065554
	push {r4-r6,lr}
	ldr r4, [sp, 0x10]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r0, r4, 24
	movs r1, 0x9
	cmp r2, r0
	bcc _0806557C
	subs r0, r2, r0
	adds r0, 0x3
	lsls r0, 24
	lsrs r2, r0, 24
	b _08065582
_0806557C:
	cmp r2, 0x1
	bls _08065582
	movs r2, 0x2
_08065582:
	adds r0, r3, 0x2
	cmp r5, r0
	blt _08065592
	subs r0, r5, r0
	adds r0, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	b _08065598
_08065592:
	cmp r5, 0x2
	bls _08065598
	movs r5, 0x3
_08065598:
	cmp r5, 0x6
	bhi _080655AE
	cmp r2, 0x4
	bhi _080655AE
	ldr r1, _080655BC
	lsls r0, r2, 3
	subs r0, r2
	adds r0, r5
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
_080655AE:
	adds r0, r1, r6
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r1, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080655BC: .4byte gMessageBoxTilemap
	thumb_func_end GetMessageBoxTilemapEntry

	thumb_func_start DrawMessageBox
DrawMessageBox: @ 80655C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, [sp, 0x4]
	ldrb r0, [r1, 0x6]
	lsls r0, 12
	ldr r1, _0806566C
	ldrh r1, [r1]
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
	ldr r3, [sp, 0x4]
	ldr r0, [r3, 0x2C]
	ldr r0, [r0, 0x14]
	mov r10, r0
	movs r5, 0
	mov r0, r9
	adds r0, 0x2
	cmp r5, r0
	bge _0806565C
	ldr r7, [sp, 0x10]
	adds r7, 0x6
	str r0, [sp, 0x18]
_08065612:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _08065650
	ldr r1, [sp, 0xC]
	adds r0, r1, r5
	lsls r6, r0, 5
_08065622:
	mov r3, r9
	str r3, [sp]
	ldr r0, [sp, 0x14]
	adds r1, r4, 0
	adds r2, r5, 0
	ldr r3, [sp, 0x10]
	bl GetMessageBoxTilemapEntry
	ldr r1, [sp, 0x8]
	adds r2, r1, r4
	adds r2, r6, r2
	lsls r2, 1
	add r2, r10
	ldr r3, [sp, 0x4]
	ldrb r1, [r3, 0x6]
	lsls r1, 12
	orrs r1, r0
	strh r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	blt _08065622
_08065650:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	ldr r3, [sp, 0x18]
	cmp r5, r3
	blt _08065612
_0806565C:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806566C: .4byte 0x030005ae
	thumb_func_end DrawMessageBox

	thumb_func_start DrawStandardMessageBox
DrawStandardMessageBox: @ 8065670
	push {lr}
	sub sp, 0x4
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x1A
	bl DrawMessageBox
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end DrawStandardMessageBox

	thumb_func_start LoadMessageBoxTiles
LoadMessageBoxTiles: @ 8065688
	push {lr}
	ldr r0, [r0, 0x2C]
	ldr r1, [r0, 0x10]
	ldr r0, _080656A4
	ldr r2, _080656A8
	ldrh r2, [r2]
	lsls r2, 5
	adds r1, r2
	movs r2, 0x70
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080656A4: .4byte gMessageBox_Gfx
_080656A8: .4byte 0x030005ae
	thumb_func_end LoadMessageBoxTiles

	thumb_func_start ClearStandardMessageBox
ClearStandardMessageBox: @ 80656AC
	push {lr}
	ldr r1, [r0, 0x2C]
	ldr r1, [r1, 0x14]
	movs r2, 0xE0
	lsls r2, 2
	adds r1, r2
	ldrb r0, [r0, 0x6]
	lsls r0, 28
	lsrs r3, r0, 16
	movs r2, 0
_080656C0:
	lsls r0, r2, 1
	adds r0, r1
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xBF
	bls _080656C0
	pop {r0}
	bx r0
	thumb_func_end ClearStandardMessageBox

	.align 2, 0 @ Don't pad with nop.
