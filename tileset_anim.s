	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ClearTilesetAnimDmas
ClearTilesetAnimDmas: @ 80731B8
	push {lr}
	sub sp, 0x4
	ldr r1, _080731D8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	str r0, [sp]
	ldr r1, _080731DC
	ldr r2, _080731E0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080731D8: .4byte 0x030006c0
_080731DC: .4byte 0x0202e9d8
_080731E0: .4byte 0x0500003c
	thumb_func_end ClearTilesetAnimDmas

	thumb_func_start QueueTilesetAnimDma
QueueTilesetAnimDma: @ 80731E4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r3, _0807322C
	ldrb r0, [r3]
	cmp r0, 0x13
	bhi _08073224
	ldr r2, _08073230
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x8]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_08073224:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807322C: .4byte 0x030006c0
_08073230: .4byte 0x0202e9d8
	thumb_func_end QueueTilesetAnimDma

	thumb_func_start sub_8072E74
sub_8072E74: @ 8073234
	push {r4-r6,lr}
	movs r3, 0
	ldr r4, _08073270
	adds r6, r4, 0
	ldrb r0, [r4]
	cmp r3, r0
	bge _08073266
	ldr r2, _08073274
	ldr r1, _08073278
	movs r5, 0x80
	lsls r5, 24
_0807324A:
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, 0x4]
	str r0, [r2, 0x4]
	ldrh r0, [r1, 0x8]
	lsrs r0, 1
	orrs r0, r5
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0xC
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _0807324A
_08073266:
	movs r0, 0
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073270: .4byte 0x030006c0
_08073274: .4byte 0x040000d4
_08073278: .4byte 0x0202e9d8
	thumb_func_end sub_8072E74

	thumb_func_start cur_mapheader_run_tileset_funcs_after_some_cpuset
cur_mapheader_run_tileset_funcs_after_some_cpuset: @ 807327C
	push {lr}
	bl ClearTilesetAnimDmas
	bl StartTileset1Animation
	bl StartTileset2Animation
	pop {r0}
	bx r0
	thumb_func_end cur_mapheader_run_tileset_funcs_after_some_cpuset

	thumb_func_start sub_8072ED0
sub_8072ED0: @ 8073290
	push {lr}
	bl StartTileset2Animation
	pop {r0}
	bx r0
	thumb_func_end sub_8072ED0

	thumb_func_start sub_8072EDC
sub_8072EDC: @ 807329C
	push {r4,lr}
	bl ClearTilesetAnimDmas
	ldr r2, _080732F4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r1, _080732F8
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _080732BA
	movs r0, 0
	strh r0, [r2]
_080732BA:
	ldr r4, _080732FC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r1, _08073300
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _080732D2
	movs r0, 0
	strh r0, [r4]
_080732D2:
	ldr r0, _08073304
	ldr r1, [r0]
	cmp r1, 0
	beq _080732E0
	ldrh r0, [r2]
	bl _call_via_r1
_080732E0:
	ldr r0, _08073308
	ldr r1, [r0]
	cmp r1, 0
	beq _080732EE
	ldrh r0, [r4]
	bl _call_via_r1
_080732EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080732F4: .4byte 0x030006c2
_080732F8: .4byte 0x030006c4
_080732FC: .4byte 0x030006c6
_08073300: .4byte 0x030006c8
_08073304: .4byte 0x030006cc
_08073308: .4byte 0x030006d0
	thumb_func_end sub_8072EDC

	thumb_func_start StartTileset1Animation
StartTileset1Animation: @ 807330C
	push {lr}
	ldr r0, _08073338
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0807333C
	strh r1, [r0]
	ldr r1, _08073340
	movs r0, 0
	str r0, [r1]
	ldr r0, _08073344
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	cmp r0, 0
	beq _08073332
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _08073332
	bl _call_via_r0
_08073332:
	pop {r0}
	bx r0
	.align 2, 0
_08073338: .4byte 0x030006c2
_0807333C: .4byte 0x030006c4
_08073340: .4byte 0x030006cc
_08073344: .4byte gMapHeader
	thumb_func_end StartTileset1Animation

	thumb_func_start StartTileset2Animation
StartTileset2Animation: @ 8073348
	push {lr}
	ldr r0, _08073374
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08073378
	strh r1, [r0]
	ldr r1, _0807337C
	movs r0, 0
	str r0, [r1]
	ldr r0, _08073380
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _0807336E
	ldr r0, [r0, 0x14]
	cmp r0, 0
	beq _0807336E
	bl _call_via_r0
_0807336E:
	pop {r0}
	bx r0
	.align 2, 0
_08073374: .4byte 0x030006c6
_08073378: .4byte 0x030006c8
_0807337C: .4byte 0x030006d0
_08073380: .4byte gMapHeader
	thumb_func_end StartTileset2Animation

	thumb_func_start TilesetCB_General
TilesetCB_General: @ 8073384
	ldr r1, _0807339C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080733A0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080733A4
	ldr r0, _080733A8
	str r0, [r1]
	bx lr
	.align 2, 0
_0807339C: .4byte 0x030006c2
_080733A0: .4byte 0x030006c4
_080733A4: .4byte 0x030006cc
_080733A8: .4byte sub_8073014
	thumb_func_end TilesetCB_General

	thumb_func_start TilesetCB_Building
TilesetCB_Building: @ 80733AC
	ldr r1, _080733C4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080733C8
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080733CC
	ldr r0, _080733D0
	str r0, [r1]
	bx lr
	.align 2, 0
_080733C4: .4byte 0x030006c2
_080733C8: .4byte 0x030006c4
_080733CC: .4byte 0x030006cc
_080733D0: .4byte sub_8073058
	thumb_func_end TilesetCB_Building

	thumb_func_start sub_8073014
sub_8073014: @ 80733D4
	push {r4,r5,lr}
	lsls r5, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r5
	lsrs r4, r0, 16
	cmp r4, 0
	bne _080733EA
	lsrs r0, r5, 20
	bl sub_8073070
_080733EA:
	cmp r4, 0x1
	bne _080733F4
	lsrs r0, r5, 20
	bl sub_8073098
_080733F4:
	cmp r4, 0x2
	bne _080733FE
	lsrs r0, r5, 20
	bl sub_80730C0
_080733FE:
	cmp r4, 0x3
	bne _08073408
	lsrs r0, r5, 20
	bl sub_80730E8
_08073408:
	cmp r4, 0x4
	bne _08073412
	lsrs r0, r5, 20
	bl sub_807361C
_08073412:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8073014

	thumb_func_start sub_8073058
sub_8073058: @ 8073418
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r1
	cmp r0, 0
	bne _0807342C
	lsrs r0, r1, 19
	bl sub_8073904
_0807342C:
	pop {r0}
	bx r0
	thumb_func_end sub_8073058

	thumb_func_start sub_8073070
sub_8073070: @ 8073430
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073450
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073454
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073450: .4byte gTilesetAnimTable_General_0
_08073454: .4byte 0x06003f80
	thumb_func_end sub_8073070

	thumb_func_start sub_8073098
sub_8073098: @ 8073458
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	ands r0, r1
	ldr r1, _08073478
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0807347C
	movs r2, 0xF0
	lsls r2, 2
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073478: .4byte gTilesetAnimTable_General_1
_0807347C: .4byte 0x06003600
	thumb_func_end sub_8073098

	thumb_func_start sub_80730C0
sub_80730C0: @ 8073480
	push {lr}
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	ldr r0, _080734A0
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080734A4
	movs r2, 0xA0
	lsls r2, 1
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_080734A0: .4byte gTilesetAnimTable_General_2
_080734A4: .4byte 0x06003a00
	thumb_func_end sub_80730C0

	thumb_func_start sub_80730E8
sub_80730E8: @ 80734A8
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _080734C8
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080734CC
	movs r2, 0xC0
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_080734C8: .4byte gTilesetAnimTable_General_3
_080734CC: .4byte 0x06003e00
	thumb_func_end sub_80730E8

	thumb_func_start TilesetCB_Petalburg
TilesetCB_Petalburg: @ 80734D0
	ldr r1, _080734E8
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080734EC
	ldr r0, _080734F0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080734F4
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080734E8: .4byte 0x030006c6
_080734EC: .4byte 0x030006c8
_080734F0: .4byte 0x030006c4
_080734F4: .4byte 0x030006d0
	thumb_func_end TilesetCB_Petalburg

	thumb_func_start TilesetCB_Rustboro
TilesetCB_Rustboro: @ 80734F8
	ldr r1, _08073510
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073514
	ldr r0, _08073518
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807351C
	ldr r0, _08073520
	str r0, [r1]
	bx lr
	.align 2, 0
_08073510: .4byte 0x030006c6
_08073514: .4byte 0x030006c8
_08073518: .4byte 0x030006c4
_0807351C: .4byte 0x030006d0
_08073520: .4byte sub_8073424
	thumb_func_end TilesetCB_Rustboro

	thumb_func_start TilesetCB_Dewford
TilesetCB_Dewford: @ 8073524
	ldr r1, _0807353C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073540
	ldr r0, _08073544
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073548
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0807353C: .4byte 0x030006c6
_08073540: .4byte 0x030006c8
_08073544: .4byte 0x030006c4
_08073548: .4byte 0x030006d0
	thumb_func_end TilesetCB_Dewford

	thumb_func_start TilesetCB_Slateport
TilesetCB_Slateport: @ 807354C
	ldr r1, _08073564
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073568
	ldr r0, _0807356C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073570
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073564: .4byte 0x030006c6
_08073568: .4byte 0x030006c8
_0807356C: .4byte 0x030006c4
_08073570: .4byte 0x030006d0
	thumb_func_end TilesetCB_Slateport

	thumb_func_start TilesetCB_Mauville
TilesetCB_Mauville: @ 8073574
	ldr r1, _0807358C
	ldr r0, _08073590
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073594
	ldr r0, _08073598
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807359C
	ldr r0, _080735A0
	str r0, [r1]
	bx lr
	.align 2, 0
_0807358C: .4byte 0x030006c6
_08073590: .4byte 0x030006c2
_08073594: .4byte 0x030006c8
_08073598: .4byte 0x030006c4
_0807359C: .4byte 0x030006d0
_080735A0: .4byte sub_80734A0
	thumb_func_end TilesetCB_Mauville

	thumb_func_start TilesetCB_Lavaridge
TilesetCB_Lavaridge: @ 80735A4
	ldr r1, _080735BC
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080735C0
	ldr r0, _080735C4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080735C8
	ldr r0, _080735CC
	str r0, [r1]
	bx lr
	.align 2, 0
_080735BC: .4byte 0x030006c6
_080735C0: .4byte 0x030006c8
_080735C4: .4byte 0x030006c4
_080735C8: .4byte 0x030006d0
_080735CC: .4byte sub_8073514
	thumb_func_end TilesetCB_Lavaridge

	thumb_func_start TilesetCB_Fallarbor
TilesetCB_Fallarbor: @ 80735D0
	ldr r1, _080735E8
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080735EC
	ldr r0, _080735F0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080735F4
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080735E8: .4byte 0x030006c6
_080735EC: .4byte 0x030006c8
_080735F0: .4byte 0x030006c4
_080735F4: .4byte 0x030006d0
	thumb_func_end TilesetCB_Fallarbor

	thumb_func_start TilesetCB_Fortree
TilesetCB_Fortree: @ 80735F8
	ldr r1, _08073610
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073614
	ldr r0, _08073618
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807361C
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073610: .4byte 0x030006c6
_08073614: .4byte 0x030006c8
_08073618: .4byte 0x030006c4
_0807361C: .4byte 0x030006d0
	thumb_func_end TilesetCB_Fortree

	thumb_func_start TilesetCB_Lilycove
TilesetCB_Lilycove: @ 8073620
	ldr r1, _08073638
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807363C
	ldr r0, _08073640
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073644
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073638: .4byte 0x030006c6
_0807363C: .4byte 0x030006c8
_08073640: .4byte 0x030006c4
_08073644: .4byte 0x030006d0
	thumb_func_end TilesetCB_Lilycove

	thumb_func_start TilesetCB_Mossdeep
TilesetCB_Mossdeep: @ 8073648
	ldr r1, _08073660
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073664
	ldr r0, _08073668
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807366C
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073660: .4byte 0x030006c6
_08073664: .4byte 0x030006c8
_08073668: .4byte 0x030006c4
_0807366C: .4byte 0x030006d0
	thumb_func_end TilesetCB_Mossdeep

	thumb_func_start TilesetCB_EverGrande
TilesetCB_EverGrande: @ 8073670
	ldr r1, _08073688
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807368C
	ldr r0, _08073690
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073694
	ldr r0, _08073698
	str r0, [r1]
	bx lr
	.align 2, 0
_08073688: .4byte 0x030006c6
_0807368C: .4byte 0x030006c8
_08073690: .4byte 0x030006c4
_08073694: .4byte 0x030006d0
_08073698: .4byte sub_8073540
	thumb_func_end TilesetCB_EverGrande

	thumb_func_start TilesetCB_Pacifidlog
TilesetCB_Pacifidlog: @ 807369C
	ldr r1, _080736B4
	ldr r0, _080736B8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080736BC
	ldr r0, _080736C0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080736C4
	ldr r0, _080736C8
	str r0, [r1]
	bx lr
	.align 2, 0
_080736B4: .4byte 0x030006c6
_080736B8: .4byte 0x030006c2
_080736BC: .4byte 0x030006c8
_080736C0: .4byte 0x030006c4
_080736C4: .4byte 0x030006d0
_080736C8: .4byte sub_80735B4
	thumb_func_end TilesetCB_Pacifidlog

	thumb_func_start TilesetCB_Sootopolis
TilesetCB_Sootopolis: @ 80736CC
	ldr r1, _080736E4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080736E8
	ldr r0, _080736EC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080736F0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080736E4: .4byte 0x030006c6
_080736E8: .4byte 0x030006c8
_080736EC: .4byte 0x030006c4
_080736F0: .4byte 0x030006d0
	thumb_func_end TilesetCB_Sootopolis

	thumb_func_start TilesetCB_Underwater
TilesetCB_Underwater: @ 80736F4
	ldr r1, _08073708
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807370C
	movs r0, 0x80
	strh r0, [r1]
	ldr r1, _08073710
	ldr r0, _08073714
	str r0, [r1]
	bx lr
	.align 2, 0
_08073708: .4byte 0x030006c6
_0807370C: .4byte 0x030006c8
_08073710: .4byte 0x030006d0
_08073714: .4byte sub_80735E4
	thumb_func_end TilesetCB_Underwater

	thumb_func_start TilesetCB_SootopolisGym
TilesetCB_SootopolisGym: @ 8073718
	ldr r1, _0807372C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073730
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _08073734
	ldr r0, _08073738
	str r0, [r1]
	bx lr
	.align 2, 0
_0807372C: .4byte 0x030006c6
_08073730: .4byte 0x030006c8
_08073734: .4byte 0x030006d0
_08073738: .4byte sub_80738A8
	thumb_func_end TilesetCB_SootopolisGym

	thumb_func_start TilesetCB_Cave
TilesetCB_Cave: @ 807373C
	ldr r1, _08073754
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073758
	ldr r0, _0807375C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073760
	ldr r0, _08073764
	str r0, [r1]
	bx lr
	.align 2, 0
_08073754: .4byte 0x030006c6
_08073758: .4byte 0x030006c8
_0807375C: .4byte 0x030006c4
_08073760: .4byte 0x030006d0
_08073764: .4byte sub_8073600
	thumb_func_end TilesetCB_Cave

	thumb_func_start TilesetCB_EliteFour
TilesetCB_EliteFour: @ 8073768
	ldr r1, _0807377C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073780
	movs r0, 0x80
	strh r0, [r1]
	ldr r1, _08073784
	ldr r0, _08073788
	str r0, [r1]
	bx lr
	.align 2, 0
_0807377C: .4byte 0x030006c6
_08073780: .4byte 0x030006c8
_08073784: .4byte 0x030006d0
_08073788: .4byte sub_80738C0
	thumb_func_end TilesetCB_EliteFour

	thumb_func_start TilesetCB_MauvilleGym
TilesetCB_MauvilleGym: @ 807378C
	ldr r1, _080737A4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080737A8
	ldr r0, _080737AC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080737B0
	ldr r0, _080737B4
	str r0, [r1]
	bx lr
	.align 2, 0
_080737A4: .4byte 0x030006c6
_080737A8: .4byte 0x030006c8
_080737AC: .4byte 0x030006c4
_080737B0: .4byte 0x030006d0
_080737B4: .4byte sub_8073890
	thumb_func_end TilesetCB_MauvilleGym

	thumb_func_start TilesetCB_BikeShop
TilesetCB_BikeShop: @ 80737B8
	ldr r1, _080737D0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080737D4
	ldr r0, _080737D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080737DC
	ldr r0, _080737E0
	str r0, [r1]
	bx lr
	.align 2, 0
_080737D0: .4byte 0x030006c6
_080737D4: .4byte 0x030006c8
_080737D8: .4byte 0x030006c4
_080737DC: .4byte 0x030006d0
_080737E0: .4byte sub_80738EC
	thumb_func_end TilesetCB_BikeShop

	thumb_func_start sub_8073424
sub_8073424: @ 80737E4
	push {r4-r6,lr}
	lsls r5, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r5
	lsrs r6, r0, 16
	cmp r6, 0
	bne _08073804
	lsrs r4, r5, 19
	adds r0, r4, 0
	movs r1, 0
	bl sub_80737A4
	adds r0, r4, 0
	bl sub_80737E0
_08073804:
	cmp r6, 0x1
	bne _08073810
	lsrs r0, r5, 19
	movs r1, 0x1
	bl sub_80737A4
_08073810:
	cmp r6, 0x2
	bne _0807381C
	lsrs r0, r5, 19
	movs r1, 0x2
	bl sub_80737A4
_0807381C:
	cmp r6, 0x3
	bne _08073828
	lsrs r0, r5, 19
	movs r1, 0x3
	bl sub_80737A4
_08073828:
	cmp r6, 0x4
	bne _08073834
	lsrs r0, r5, 19
	movs r1, 0x4
	bl sub_80737A4
_08073834:
	cmp r6, 0x5
	bne _08073840
	lsrs r0, r5, 19
	movs r1, 0x5
	bl sub_80737A4
_08073840:
	cmp r6, 0x6
	bne _0807384C
	lsrs r0, r5, 19
	movs r1, 0x6
	bl sub_80737A4
_0807384C:
	cmp r6, 0x7
	bne _08073858
	lsrs r0, r5, 19
	movs r1, 0x7
	bl sub_80737A4
_08073858:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8073424

	thumb_func_start sub_80734A0
sub_80734A0: @ 8073860
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _08073878
	lsrs r0, r4, 19
	movs r1, 0
	bl sub_8073704
_08073878:
	cmp r5, 0x1
	bne _08073884
	lsrs r0, r4, 19
	movs r1, 0x1
	bl sub_8073704
_08073884:
	cmp r5, 0x2
	bne _08073890
	lsrs r0, r4, 19
	movs r1, 0x2
	bl sub_8073704
_08073890:
	cmp r5, 0x3
	bne _0807389C
	lsrs r0, r4, 19
	movs r1, 0x3
	bl sub_8073704
_0807389C:
	cmp r5, 0x4
	bne _080738A8
	lsrs r0, r4, 19
	movs r1, 0x4
	bl sub_8073704
_080738A8:
	cmp r5, 0x5
	bne _080738B4
	lsrs r0, r4, 19
	movs r1, 0x5
	bl sub_8073704
_080738B4:
	cmp r5, 0x6
	bne _080738C0
	lsrs r0, r4, 19
	movs r1, 0x6
	bl sub_8073704
_080738C0:
	cmp r5, 0x7
	bne _080738CC
	lsrs r0, r4, 19
	movs r1, 0x7
	bl sub_8073704
_080738CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80734A0

	thumb_func_start sub_8073514
sub_8073514: @ 80738D4
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080738EE
	lsrs r0, r4, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_8073644
_080738EE:
	cmp r5, 0x1
	bne _080738F8
	lsrs r0, r4, 20
	bl sub_8073808
_080738F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8073514

	thumb_func_start sub_8073540
sub_8073540: @ 8073900
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _08073918
	lsrs r0, r4, 19
	movs r1, 0
	bl sub_8073830
_08073918:
	cmp r5, 0x1
	bne _08073924
	lsrs r0, r4, 19
	movs r1, 0x1
	bl sub_8073830
_08073924:
	cmp r5, 0x2
	bne _08073930
	lsrs r0, r4, 19
	movs r1, 0x2
	bl sub_8073830
_08073930:
	cmp r5, 0x3
	bne _0807393C
	lsrs r0, r4, 19
	movs r1, 0x3
	bl sub_8073830
_0807393C:
	cmp r5, 0x4
	bne _08073948
	lsrs r0, r4, 19
	movs r1, 0x4
	bl sub_8073830
_08073948:
	cmp r5, 0x5
	bne _08073954
	lsrs r0, r4, 19
	movs r1, 0x5
	bl sub_8073830
_08073954:
	cmp r5, 0x6
	bne _08073960
	lsrs r0, r4, 19
	movs r1, 0x6
	bl sub_8073830
_08073960:
	cmp r5, 0x7
	bne _0807396C
	lsrs r0, r4, 19
	movs r1, 0x7
	bl sub_8073830
_0807396C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8073540

	thumb_func_start sub_80735B4
sub_80735B4: @ 8073974
	push {r4,r5,lr}
	lsls r4, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r4
	lsrs r5, r0, 16
	cmp r5, 0
	bne _0807398E
	lsrs r0, r4, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_807368C
_0807398E:
	cmp r5, 0x1
	bne _0807399C
	lsrs r0, r4, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_80736DC
_0807399C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80735B4

	thumb_func_start sub_80735E4
sub_80735E4: @ 80739A4
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _080739BC
	lsrs r0, r1, 20
	lsls r0, 24
	lsrs r0, 24
	bl sub_80736B4
_080739BC:
	pop {r0}
	bx r0
	thumb_func_end sub_80735E4

	thumb_func_start sub_8073600
sub_8073600: @ 80739C0
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	lsrs r0, 16
	cmp r0, 0x1
	bne _080739D6
	lsrs r0, r1, 20
	bl sub_8073868
_080739D6:
	pop {r0}
	bx r0
	thumb_func_end sub_8073600

	thumb_func_start sub_807361C
sub_807361C: @ 80739DC
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _080739FC
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073A00
	movs r2, 0xA0
	lsls r2, 1
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_080739FC: .4byte gTilesetAnimTable_General_4
_08073A00: .4byte 0x06003c00
	thumb_func_end sub_807361C

	thumb_func_start sub_8073644
sub_8073644: @ 8073A04
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
	ands r0, r4
	ldr r5, _08073A40
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldr r1, _08073A44
	movs r2, 0x80
	bl QueueTilesetAnimDma
	adds r1, r4, 0x2
	adds r0, r1, 0
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 22
	adds r0, r5
	ldr r0, [r0]
	ldr r1, _08073A48
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073A40: .4byte gTilesetAnimTable_Lavaridge
_08073A44: .4byte 0x06006400
_08073A48: .4byte 0x06006480
	thumb_func_end sub_8073644

	thumb_func_start sub_807368C
sub_807368C: @ 8073A4C
	push {lr}
	lsls r0, 24
	movs r1, 0xC0
	lsls r1, 18
	ands r1, r0
	ldr r0, _08073A6C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073A70
	movs r2, 0xF0
	lsls r2, 2
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073A6C: .4byte gTilesetAnimTable_Pacifidlog_0
_08073A70: .4byte 0x06007a00
	thumb_func_end sub_807368C

	thumb_func_start sub_80736B4
sub_80736B4: @ 8073A74
	push {lr}
	lsls r0, 24
	movs r1, 0xC0
	lsls r1, 18
	ands r1, r0
	ldr r0, _08073A94
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073A98
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073A94: .4byte gTilesetAnimTable_Underwater
_08073A98: .4byte 0x06007e00
	thumb_func_end sub_80736B4

	thumb_func_start sub_80736DC
sub_80736DC: @ 8073A9C
	push {lr}
	lsls r0, 24
	movs r1, 0xE0
	lsls r1, 19
	ands r1, r0
	ldr r0, _08073ABC
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073AC0
	movs r2, 0x80
	lsls r2, 1
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073ABC: .4byte gTilesetAnimTable_Pacifidlog_1
_08073AC0: .4byte 0x06007e00
	thumb_func_end sub_80736DC

	thumb_func_start sub_8073704
sub_8073704: @ 8073AC4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	subs r0, r5, r6
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xB
	bhi _08073B20
	adds r0, r5, 0
	movs r1, 0xC
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08073B10
	lsrs r4, 14
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073B14
	lsls r5, r6, 2
	adds r1, r5, r1
	ldr r1, [r1]
	movs r2, 0x80
	bl QueueTilesetAnimDma
	ldr r0, _08073B18
	adds r4, r0
	ldr r0, [r4]
	ldr r1, _08073B1C
	adds r5, r1
	ldr r1, [r5]
	movs r2, 0x80
	bl QueueTilesetAnimDma
	b _08073B4C
	.align 2, 0
_08073B10: .4byte gTilesetAnimTable_Mauville_0A
_08073B14: .4byte gUnknown_0837BAE4
_08073B18: .4byte gTilesetAnimTable_Mauville_1A
_08073B1C: .4byte gUnknown_0837BB04
_08073B20:
	movs r0, 0x3
	ands r5, r0
	ldr r0, _08073B54
	lsls r5, 2
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _08073B58
	lsls r4, r6, 2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, 0x80
	bl QueueTilesetAnimDma
	ldr r0, _08073B5C
	adds r5, r0
	ldr r0, [r5]
	ldr r1, _08073B60
	adds r4, r1
	ldr r1, [r4]
	movs r2, 0x80
	bl QueueTilesetAnimDma
_08073B4C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073B54: .4byte gTilesetAnimTable_Mauville_0B
_08073B58: .4byte gUnknown_0837BAE4
_08073B5C: .4byte gTilesetAnimTable_Mauville_1B
_08073B60: .4byte gUnknown_0837BB04
	thumb_func_end sub_8073704

	thumb_func_start sub_80737A4
sub_80737A4: @ 8073B64
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r3, r1, 24
	subs r0, r3
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	ldr r0, _08073B98
	lsrs r1, 14
	adds r1, r0
	ldr r2, [r1]
	cmp r2, 0
	beq _08073B94
	ldr r0, _08073B9C
	lsls r1, r3, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	movs r2, 0x80
	bl QueueTilesetAnimDma
_08073B94:
	pop {r0}
	bx r0
	.align 2, 0
_08073B98: .4byte gTilesetAnimTable_Rustboro_0
_08073B9C: .4byte gUnknown_0837BFA4
	thumb_func_end sub_80737A4

	thumb_func_start sub_80737E0
sub_80737E0: @ 8073BA0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073BC0
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073BC4
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073BC0: .4byte gTilesetAnimTable_Rustboro_1
_08073BC4: .4byte 0x06007800
	thumb_func_end sub_80737E0

	thumb_func_start sub_8073808
sub_8073808: @ 8073BC8
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073BE8
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073BEC
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073BE8: .4byte gTilesetAnimTable_Cave
_08073BEC: .4byte 0x06005400
	thumb_func_end sub_8073808

	thumb_func_start sub_8073830
sub_8073830: @ 8073BF0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	subs r0, r1
	lsls r0, 16
	movs r2, 0xE0
	lsls r2, 11
	ands r2, r0
	ldr r0, _08073C20
	lsrs r2, 14
	adds r2, r0
	ldr r0, [r2]
	ldr r2, _08073C24
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073C20: .4byte gTilesetAnimTable_EverGrande
_08073C24: .4byte gUnknown_0837C93C
	thumb_func_end sub_8073830

	thumb_func_start sub_8073868
sub_8073868: @ 8073C28
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073C48
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073C4C
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073C48: .4byte gTilesetAnimTable_Cave
_08073C4C: .4byte 0x06007400
	thumb_func_end sub_8073868

	thumb_func_start sub_8073890
sub_8073890: @ 8073C50
	push {lr}
	lsls r2, r0, 16
	lsrs r0, r2, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08073C64
	lsrs r0, r2, 17
	bl sub_80739C4
_08073C64:
	pop {r0}
	bx r0
	thumb_func_end sub_8073890

	thumb_func_start sub_80738A8
sub_80738A8: @ 8073C68
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xE0
	lsls r0, 11
	ands r0, r1
	cmp r0, 0
	bne _08073C7C
	lsrs r0, r1, 19
	bl sub_807392C
_08073C7C:
	pop {r0}
	bx r0
	thumb_func_end sub_80738A8

	thumb_func_start sub_80738C0
sub_80738C0: @ 8073C80
	push {r4,r5,lr}
	lsls r4, r0, 16
	lsrs r0, r4, 16
	adds r5, r0, 0
	movs r0, 0x3F
	ands r0, r5
	cmp r0, 0
	bne _08073C96
	lsrs r0, r4, 22
	bl sub_807399C
_08073C96:
	movs r0, 0x7
	ands r0, r5
	cmp r0, 0x1
	bne _08073CA4
	lsrs r0, r4, 19
	bl sub_8073974
_08073CA4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80738C0

	thumb_func_start sub_80738EC
sub_80738EC: @ 8073CAC
	push {lr}
	lsls r1, r0, 16
	movs r0, 0xC0
	lsls r0, 10
	ands r0, r1
	cmp r0, 0
	bne _08073CC0
	lsrs r0, r1, 18
	bl sub_80739EC
_08073CC0:
	pop {r0}
	bx r0
	thumb_func_end sub_80738EC

	thumb_func_start sub_8073904
sub_8073904: @ 8073CC4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073CE4
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073CE8
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073CE4: .4byte gTilesetAnimTable_Building
_08073CE8: .4byte 0x06003e00
	thumb_func_end sub_8073904

	thumb_func_start sub_807392C
sub_807392C: @ 8073CEC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	ldr r0, _08073D24
	lsrs r4, 14
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073D28
	movs r2, 0xC0
	lsls r2, 1
	bl QueueTilesetAnimDma
	ldr r0, _08073D2C
	adds r4, r0
	ldr r0, [r4]
	ldr r1, _08073D30
	movs r2, 0xA0
	lsls r2, 2
	bl QueueTilesetAnimDma
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D24: .4byte gTilesetAnimTable_SootopolisGym_0
_08073D28: .4byte 0x06007e00
_08073D2C: .4byte gTilesetAnimTable_SootopolisGym_1
_08073D30: .4byte 0x06007a00
	thumb_func_end sub_807392C

	thumb_func_start sub_8073974
sub_8073974: @ 8073D34
	push {lr}
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	ldr r0, _08073D54
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073D58
	movs r2, 0x20
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073D54: .4byte gTilesetAnimTable_EliteFour_0
_08073D58: .4byte 0x06007f00
	thumb_func_end sub_8073974

	thumb_func_start sub_807399C
sub_807399C: @ 8073D5C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073D7C
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073D80
	movs r2, 0x80
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073D7C: .4byte gTilesetAnimTable_EliteFour_1
_08073D80: .4byte 0x06007c00
	thumb_func_end sub_807399C

	thumb_func_start sub_80739C4
sub_80739C4: @ 8073D84
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073DA4
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073DA8
	movs r2, 0x80
	lsls r2, 2
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073DA4: .4byte gTilesetAnimTable_MauvilleGym
_08073DA8: .4byte 0x06005200
	thumb_func_end sub_80739C4

	thumb_func_start sub_80739EC
sub_80739EC: @ 8073DAC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08073DCC
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073DD0
	movs r2, 0x90
	lsls r2, 1
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_08073DCC: .4byte gTilesetAnimTable_BikeShop
_08073DD0: .4byte 0x06007e00
	thumb_func_end sub_80739EC

	.align 2, 0 @ Don't pad with nop.
