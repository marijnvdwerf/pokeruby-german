	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ClearTilesetAnimDmas
ClearTilesetAnimDmas: @ 80731B8
	push {lr}
	sub sp, 0x4
	ldr r1, _080731D8 @ =0x030006c0
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	str r0, [sp]
	ldr r1, _080731DC @ =0x0202e9d8
	ldr r2, _080731E0 @ =0x0500003c
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
	ldr r3, _0807322C @ =0x030006c0
	ldrb r0, [r3]
	cmp r0, 0x13
	bhi _08073224
	ldr r2, _08073230 @ =0x0202e9d8
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
sub_8072E74: @ 8072E74
	push {r4-r6,lr}
	movs r3, 0
	ldr r4, _08072EB0 @ =0x030006c0
	adds r6, r4, 0
	ldrb r0, [r4]
	cmp r3, r0
	bge _08072EA6
	ldr r2, _08072EB4 @ =0x040000d4
	ldr r1, _08072EB8 @ =0x0202e9d8
	movs r5, 0x80
	lsls r5, 24
_08072E8A:
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
	blt _08072E8A
_08072EA6:
	movs r0, 0
	strb r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072EB0: .4byte 0x030006c0
_08072EB4: .4byte 0x040000d4
_08072EB8: .4byte 0x0202e9d8
	thumb_func_end sub_8072E74

	thumb_func_start cur_mapheader_run_tileset_funcs_after_some_cpuset
cur_mapheader_run_tileset_funcs_after_some_cpuset: @ 8072EBC
	push {lr}
	bl ClearTilesetAnimDmas
	bl StartTileset1Animation
	bl StartTileset2Animation
	pop {r0}
	bx r0
	thumb_func_end cur_mapheader_run_tileset_funcs_after_some_cpuset

	thumb_func_start sub_8072ED0
sub_8072ED0: @ 8072ED0
	push {lr}
	bl StartTileset2Animation
	pop {r0}
	bx r0
	thumb_func_end sub_8072ED0

	thumb_func_start sub_8072EDC
sub_8072EDC: @ 8072EDC
	push {r4,lr}
	bl ClearTilesetAnimDmas
	ldr r2, _08072F34 @ =0x030006c2
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r1, _08072F38 @ =0x030006c4
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _08072EFA
	movs r0, 0
	strh r0, [r2]
_08072EFA:
	ldr r4, _08072F3C @ =0x030006c6
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r1, _08072F40 @ =0x030006c8
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bcc _08072F12
	movs r0, 0
	strh r0, [r4]
_08072F12:
	ldr r0, _08072F44 @ =0x030006cc
	ldr r1, [r0]
	cmp r1, 0
	beq _08072F20
	ldrh r0, [r2]
	bl _call_via_r1
_08072F20:
	ldr r0, _08072F48 @ =0x030006d0
	ldr r1, [r0]
	cmp r1, 0
	beq _08072F2E
	ldrh r0, [r4]
	bl _call_via_r1
_08072F2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072F34: .4byte 0x030006c2
_08072F38: .4byte 0x030006c4
_08072F3C: .4byte 0x030006c6
_08072F40: .4byte 0x030006c8
_08072F44: .4byte 0x030006cc
_08072F48: .4byte 0x030006d0
	thumb_func_end sub_8072EDC

	thumb_func_start StartTileset1Animation
StartTileset1Animation: @ 807330C
	push {lr}
	ldr r0, _08073338 @ =0x030006c2
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0807333C @ =0x030006c4
	strh r1, [r0]
	ldr r1, _08073340 @ =0x030006cc
	movs r0, 0
	str r0, [r1]
	ldr r0, _08073344 @ =gMapHeader
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
	ldr r0, _08073374 @ =0x030006c6
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08073378 @ =0x030006c8
	strh r1, [r0]
	ldr r1, _0807337C @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	ldr r0, _08073380 @ =gMapHeader
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
TilesetCB_General: @ 8072FC4
	ldr r1, _08072FDC @ =0x030006c2
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08072FE0 @ =0x030006c4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08072FE4 @ =0x030006cc
	ldr r0, _08072FE8 @ =sub_8073014
	str r0, [r1]
	bx lr
	.align 2, 0
_08072FDC: .4byte 0x030006c2
_08072FE0: .4byte 0x030006c4
_08072FE4: .4byte 0x030006cc
_08072FE8: .4byte sub_8073014
	thumb_func_end TilesetCB_General

	thumb_func_start TilesetCB_Building
TilesetCB_Building: @ 8072FEC
	ldr r1, _08073004 @ =0x030006c2
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073008 @ =0x030006c4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0807300C @ =0x030006cc
	ldr r0, _08073010 @ =sub_8073058
	str r0, [r1]
	bx lr
	.align 2, 0
_08073004: .4byte 0x030006c2
_08073008: .4byte 0x030006c4
_0807300C: .4byte 0x030006cc
_08073010: .4byte sub_8073058
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
	ldr r0, _08073450 @ =gTilesetAnimTable_General_0
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073454 @ =0x06003f80
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
	ldr r1, _08073478 @ =gTilesetAnimTable_General_1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0807347C @ =0x06003600
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
	ldr r0, _080734A0 @ =gTilesetAnimTable_General_2
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080734A4 @ =0x06003a00
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
	ldr r0, _080734C8 @ =gTilesetAnimTable_General_3
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _080734CC @ =0x06003e00
	movs r2, 0xC0
	bl QueueTilesetAnimDma
	pop {r0}
	bx r0
	.align 2, 0
_080734C8: .4byte gTilesetAnimTable_General_3
_080734CC: .4byte 0x06003e00
	thumb_func_end sub_80730E8

	thumb_func_start TilesetCB_Petalburg
TilesetCB_Petalburg: @ 8073110
	ldr r1, _08073128 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807312C @ =0x030006c8
	ldr r0, _08073130 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073134 @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073128: .4byte 0x030006c6
_0807312C: .4byte 0x030006c8
_08073130: .4byte 0x030006c4
_08073134: .4byte 0x030006d0
	thumb_func_end TilesetCB_Petalburg

	thumb_func_start TilesetCB_Rustboro
TilesetCB_Rustboro: @ 8073138
	ldr r1, _08073150 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073154 @ =0x030006c8
	ldr r0, _08073158 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807315C @ =0x030006d0
	ldr r0, _08073160 @ =sub_8073424
	str r0, [r1]
	bx lr
	.align 2, 0
_08073150: .4byte 0x030006c6
_08073154: .4byte 0x030006c8
_08073158: .4byte 0x030006c4
_0807315C: .4byte 0x030006d0
_08073160: .4byte sub_8073424
	thumb_func_end TilesetCB_Rustboro

	thumb_func_start TilesetCB_Dewford
TilesetCB_Dewford: @ 8073164
	ldr r1, _0807317C @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073180 @ =0x030006c8
	ldr r0, _08073184 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073188 @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0807317C: .4byte 0x030006c6
_08073180: .4byte 0x030006c8
_08073184: .4byte 0x030006c4
_08073188: .4byte 0x030006d0
	thumb_func_end TilesetCB_Dewford

	thumb_func_start TilesetCB_Slateport
TilesetCB_Slateport: @ 807318C
	ldr r1, _080731A4 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080731A8 @ =0x030006c8
	ldr r0, _080731AC @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080731B0 @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080731A4: .4byte 0x030006c6
_080731A8: .4byte 0x030006c8
_080731AC: .4byte 0x030006c4
_080731B0: .4byte 0x030006d0
	thumb_func_end TilesetCB_Slateport

	thumb_func_start TilesetCB_Mauville
TilesetCB_Mauville: @ 80731B4
	ldr r1, _080731CC @ =0x030006c6
	ldr r0, _080731D0 @ =0x030006c2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080731D4 @ =0x030006c8
	ldr r0, _080731D8 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080731DC @ =0x030006d0
	ldr r0, _080731E0 @ =sub_80734A0
	str r0, [r1]
	bx lr
	.align 2, 0
_080731CC: .4byte 0x030006c6
_080731D0: .4byte 0x030006c2
_080731D4: .4byte 0x030006c8
_080731D8: .4byte 0x030006c4
_080731DC: .4byte 0x030006d0
_080731E0: .4byte sub_80734A0
	thumb_func_end TilesetCB_Mauville

	thumb_func_start TilesetCB_Lavaridge
TilesetCB_Lavaridge: @ 80731E4
	ldr r1, _080731FC @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073200 @ =0x030006c8
	ldr r0, _08073204 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073208 @ =0x030006d0
	ldr r0, _0807320C @ =sub_8073514
	str r0, [r1]
	bx lr
	.align 2, 0
_080731FC: .4byte 0x030006c6
_08073200: .4byte 0x030006c8
_08073204: .4byte 0x030006c4
_08073208: .4byte 0x030006d0
_0807320C: .4byte sub_8073514
	thumb_func_end TilesetCB_Lavaridge

	thumb_func_start TilesetCB_Fallarbor
TilesetCB_Fallarbor: @ 8073210
	ldr r1, _08073228 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807322C @ =0x030006c8
	ldr r0, _08073230 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073234 @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073228: .4byte 0x030006c6
_0807322C: .4byte 0x030006c8
_08073230: .4byte 0x030006c4
_08073234: .4byte 0x030006d0
	thumb_func_end TilesetCB_Fallarbor

	thumb_func_start TilesetCB_Fortree
TilesetCB_Fortree: @ 8073238
	ldr r1, _08073250 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073254 @ =0x030006c8
	ldr r0, _08073258 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807325C @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073250: .4byte 0x030006c6
_08073254: .4byte 0x030006c8
_08073258: .4byte 0x030006c4
_0807325C: .4byte 0x030006d0
	thumb_func_end TilesetCB_Fortree

	thumb_func_start TilesetCB_Lilycove
TilesetCB_Lilycove: @ 8073260
	ldr r1, _08073278 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807327C @ =0x030006c8
	ldr r0, _08073280 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073284 @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073278: .4byte 0x030006c6
_0807327C: .4byte 0x030006c8
_08073280: .4byte 0x030006c4
_08073284: .4byte 0x030006d0
	thumb_func_end TilesetCB_Lilycove

	thumb_func_start TilesetCB_Mossdeep
TilesetCB_Mossdeep: @ 8073288
	ldr r1, _080732A0 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080732A4 @ =0x030006c8
	ldr r0, _080732A8 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080732AC @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_080732A0: .4byte 0x030006c6
_080732A4: .4byte 0x030006c8
_080732A8: .4byte 0x030006c4
_080732AC: .4byte 0x030006d0
	thumb_func_end TilesetCB_Mossdeep

	thumb_func_start TilesetCB_EverGrande
TilesetCB_EverGrande: @ 80732B0
	ldr r1, _080732C8 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080732CC @ =0x030006c8
	ldr r0, _080732D0 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080732D4 @ =0x030006d0
	ldr r0, _080732D8 @ =sub_8073540
	str r0, [r1]
	bx lr
	.align 2, 0
_080732C8: .4byte 0x030006c6
_080732CC: .4byte 0x030006c8
_080732D0: .4byte 0x030006c4
_080732D4: .4byte 0x030006d0
_080732D8: .4byte sub_8073540
	thumb_func_end TilesetCB_EverGrande

	thumb_func_start TilesetCB_Pacifidlog
TilesetCB_Pacifidlog: @ 80732DC
	ldr r1, _080732F4 @ =0x030006c6
	ldr r0, _080732F8 @ =0x030006c2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080732FC @ =0x030006c8
	ldr r0, _08073300 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073304 @ =0x030006d0
	ldr r0, _08073308 @ =sub_80735B4
	str r0, [r1]
	bx lr
	.align 2, 0
_080732F4: .4byte 0x030006c6
_080732F8: .4byte 0x030006c2
_080732FC: .4byte 0x030006c8
_08073300: .4byte 0x030006c4
_08073304: .4byte 0x030006d0
_08073308: .4byte sub_80735B4
	thumb_func_end TilesetCB_Pacifidlog

	thumb_func_start TilesetCB_Sootopolis
TilesetCB_Sootopolis: @ 807330C
	ldr r1, _08073324 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073328 @ =0x030006c8
	ldr r0, _0807332C @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08073330 @ =0x030006d0
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08073324: .4byte 0x030006c6
_08073328: .4byte 0x030006c8
_0807332C: .4byte 0x030006c4
_08073330: .4byte 0x030006d0
	thumb_func_end TilesetCB_Sootopolis

	thumb_func_start TilesetCB_Underwater
TilesetCB_Underwater: @ 8073334
	ldr r1, _08073348 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807334C @ =0x030006c8
	movs r0, 0x80
	strh r0, [r1]
	ldr r1, _08073350 @ =0x030006d0
	ldr r0, _08073354 @ =sub_80735E4
	str r0, [r1]
	bx lr
	.align 2, 0
_08073348: .4byte 0x030006c6
_0807334C: .4byte 0x030006c8
_08073350: .4byte 0x030006d0
_08073354: .4byte sub_80735E4
	thumb_func_end TilesetCB_Underwater

	thumb_func_start TilesetCB_SootopolisGym
TilesetCB_SootopolisGym: @ 8073358
	ldr r1, _0807336C @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073370 @ =0x030006c8
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _08073374 @ =0x030006d0
	ldr r0, _08073378 @ =sub_80738A8
	str r0, [r1]
	bx lr
	.align 2, 0
_0807336C: .4byte 0x030006c6
_08073370: .4byte 0x030006c8
_08073374: .4byte 0x030006d0
_08073378: .4byte sub_80738A8
	thumb_func_end TilesetCB_SootopolisGym

	thumb_func_start TilesetCB_Cave
TilesetCB_Cave: @ 807337C
	ldr r1, _08073394 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073398 @ =0x030006c8
	ldr r0, _0807339C @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080733A0 @ =0x030006d0
	ldr r0, _080733A4 @ =sub_8073600
	str r0, [r1]
	bx lr
	.align 2, 0
_08073394: .4byte 0x030006c6
_08073398: .4byte 0x030006c8
_0807339C: .4byte 0x030006c4
_080733A0: .4byte 0x030006d0
_080733A4: .4byte sub_8073600
	thumb_func_end TilesetCB_Cave

	thumb_func_start TilesetCB_EliteFour
TilesetCB_EliteFour: @ 80733A8
	ldr r1, _080733BC @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080733C0 @ =0x030006c8
	movs r0, 0x80
	strh r0, [r1]
	ldr r1, _080733C4 @ =0x030006d0
	ldr r0, _080733C8 @ =sub_80738C0
	str r0, [r1]
	bx lr
	.align 2, 0
_080733BC: .4byte 0x030006c6
_080733C0: .4byte 0x030006c8
_080733C4: .4byte 0x030006d0
_080733C8: .4byte sub_80738C0
	thumb_func_end TilesetCB_EliteFour

	thumb_func_start TilesetCB_MauvilleGym
TilesetCB_MauvilleGym: @ 80733CC
	ldr r1, _080733E4 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080733E8 @ =0x030006c8
	ldr r0, _080733EC @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _080733F0 @ =0x030006d0
	ldr r0, _080733F4 @ =sub_8073890
	str r0, [r1]
	bx lr
	.align 2, 0
_080733E4: .4byte 0x030006c6
_080733E8: .4byte 0x030006c8
_080733EC: .4byte 0x030006c4
_080733F0: .4byte 0x030006d0
_080733F4: .4byte sub_8073890
	thumb_func_end TilesetCB_MauvilleGym

	thumb_func_start TilesetCB_BikeShop
TilesetCB_BikeShop: @ 80733F8
	ldr r1, _08073410 @ =0x030006c6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08073414 @ =0x030006c8
	ldr r0, _08073418 @ =0x030006c4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807341C @ =0x030006d0
	ldr r0, _08073420 @ =sub_80738EC
	str r0, [r1]
	bx lr
	.align 2, 0
_08073410: .4byte 0x030006c6
_08073414: .4byte 0x030006c8
_08073418: .4byte 0x030006c4
_0807341C: .4byte 0x030006d0
_08073420: .4byte sub_80738EC
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
	ldr r0, _080739FC @ =gTilesetAnimTable_General_4
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073A00 @ =0x06003c00
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
	ldr r5, _08073A40 @ =gTilesetAnimTable_Lavaridge
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	ldr r1, _08073A44 @ =0x06006400
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
	ldr r1, _08073A48 @ =0x06006480
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
	ldr r0, _08073A6C @ =gTilesetAnimTable_Pacifidlog_0
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073A70 @ =0x06007a00
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
	ldr r0, _08073A94 @ =gTilesetAnimTable_Underwater
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073A98 @ =0x06007e00
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
	ldr r0, _08073ABC @ =gTilesetAnimTable_Pacifidlog_1
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073AC0 @ =0x06007e00
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
	ldr r0, _08073B10 @ =gTilesetAnimTable_Mauville_0A
	lsrs r4, 14
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073B14 @ =gUnknown_0837BAE4
	lsls r5, r6, 2
	adds r1, r5, r1
	ldr r1, [r1]
	movs r2, 0x80
	bl QueueTilesetAnimDma
	ldr r0, _08073B18 @ =gTilesetAnimTable_Mauville_1A
	adds r4, r0
	ldr r0, [r4]
	ldr r1, _08073B1C @ =gUnknown_0837BB04
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
	ldr r0, _08073B54 @ =gTilesetAnimTable_Mauville_0B
	lsls r5, 2
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _08073B58 @ =gUnknown_0837BAE4
	lsls r4, r6, 2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, 0x80
	bl QueueTilesetAnimDma
	ldr r0, _08073B5C @ =gTilesetAnimTable_Mauville_1B
	adds r5, r0
	ldr r0, [r5]
	ldr r1, _08073B60 @ =gUnknown_0837BB04
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
	ldr r0, _08073B98 @ =gTilesetAnimTable_Rustboro_0
	lsrs r1, 14
	adds r1, r0
	ldr r2, [r1]
	cmp r2, 0
	beq _08073B94
	ldr r0, _08073B9C @ =gUnknown_0837BFA4
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
	ldr r1, _08073BC0 @ =gTilesetAnimTable_Rustboro_1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073BC4 @ =0x06007800
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
	ldr r0, _08073BE8 @ =gTilesetAnimTable_Cave
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073BEC @ =0x06005400
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
	ldr r0, _08073C20 @ =gTilesetAnimTable_EverGrande
	lsrs r2, 14
	adds r2, r0
	ldr r0, [r2]
	ldr r2, _08073C24 @ =gUnknown_0837C93C
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
	ldr r0, _08073C48 @ =gTilesetAnimTable_Cave
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073C4C @ =0x06007400
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
	ldr r1, _08073CE4 @ =gTilesetAnimTable_Building
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073CE8 @ =0x06003e00
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
	ldr r0, _08073D24 @ =gTilesetAnimTable_SootopolisGym_0
	lsrs r4, 14
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08073D28 @ =0x06007e00
	movs r2, 0xC0
	lsls r2, 1
	bl QueueTilesetAnimDma
	ldr r0, _08073D2C @ =gTilesetAnimTable_SootopolisGym_1
	adds r4, r0
	ldr r0, [r4]
	ldr r1, _08073D30 @ =0x06007a00
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
	ldr r0, _08073D54 @ =gTilesetAnimTable_EliteFour_0
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	ldr r1, _08073D58 @ =0x06007f00
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
	ldr r1, _08073D7C @ =gTilesetAnimTable_EliteFour_1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073D80 @ =0x06007c00
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
	ldr r1, _08073DA4 @ =gTilesetAnimTable_MauvilleGym
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073DA8 @ =0x06005200
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
	ldr r1, _08073DCC @ =gTilesetAnimTable_BikeShop
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08073DD0 @ =0x06007e00
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
