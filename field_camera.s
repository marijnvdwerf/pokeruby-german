	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start move_tilemap_camera_to_upper_left_corner_
move_tilemap_camera_to_upper_left_corner_: @ 8057CFC
	movs r1, 0
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	strb r1, [r0]
	strb r1, [r0, 0x1]
	movs r1, 0x1
	strb r1, [r0, 0x4]
	bx lr
	thumb_func_end move_tilemap_camera_to_upper_left_corner_

	thumb_func_start tilemap_move_something
tilemap_move_something: @ 8057D0C
	ldrb r3, [r0, 0x2]
	adds r3, r1
	strb r3, [r0, 0x2]
	ldrb r1, [r0, 0x2]
	movs r3, 0x1F
	ands r1, r3
	strb r1, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	adds r1, r2
	strb r1, [r0, 0x3]
	ldrb r1, [r0, 0x3]
	ands r1, r3
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end tilemap_move_something

	thumb_func_start coords8_add
coords8_add: @ 8057D28
	ldrb r3, [r0]
	adds r3, r1
	strb r3, [r0]
	ldrb r1, [r0, 0x1]
	adds r1, r2
	strb r1, [r0, 0x1]
	bx lr
	thumb_func_end coords8_add

	thumb_func_start move_tilemap_camera_to_upper_left_corner
move_tilemap_camera_to_upper_left_corner: @ 80579F8
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _08057A44 @ =gUnknown_03000590
	bl move_tilemap_camera_to_upper_left_corner_
	mov r0, sp
	movs r6, 0
	strh r6, [r0]
	ldr r4, _08057A48 @ =0x020221cc
	ldr r5, _08057A4C @ =0x01000400
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r6, [r0]
	ldr r2, _08057A50 @ =0xfffff800
	adds r1, r4, r2
	adds r2, r5, 0
	bl CpuSet
	add r0, sp, 0x4
	ldr r2, _08057A54 @ =0x00003014
	adds r1, r2, 0
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 4
	adds r4, r1
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057A44: .4byte gUnknown_03000590
_08057A48: .4byte 0x020221cc
_08057A4C: .4byte 0x01000400
_08057A50: .4byte 0xfffff800
_08057A54: .4byte 0x00003014
	thumb_func_end move_tilemap_camera_to_upper_left_corner

	thumb_func_start sub_8057A58
sub_8057A58: @ 8057A58
	push {r4-r7,lr}
	ldr r5, _08057AE8 @ =gBGHOffsetRegs
	ldr r1, [r5, 0x4]
	ldr r6, _08057AEC @ =gUnknown_03000590
	ldr r4, _08057AF0 @ =gUnknown_03000598
	ldrh r0, [r4]
	ldrb r2, [r6]
	adds r0, r2
	strh r0, [r1]
	ldr r3, _08057AF4 @ =gBGVOffsetRegs
	ldr r1, [r3, 0x4]
	ldr r2, _08057AF8 @ =gUnknown_0300059A
	ldrh r0, [r2]
	ldrb r7, [r6, 0x1]
	adds r0, r7
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, [r5, 0x8]
	ldrh r0, [r4]
	ldrb r7, [r6]
	adds r0, r7
	strh r0, [r1]
	ldr r1, [r3, 0x8]
	ldrh r0, [r2]
	ldrb r7, [r6, 0x1]
	adds r0, r7
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, [r5, 0xC]
	ldrh r0, [r4]
	ldrb r4, [r6]
	adds r0, r4
	strh r0, [r1]
	ldr r1, [r3, 0xC]
	ldrh r0, [r2]
	ldrb r7, [r6, 0x1]
	adds r0, r7
	adds r0, 0x8
	strh r0, [r1]
	ldrb r0, [r6, 0x4]
	cmp r0, 0
	beq _08057AE0
	ldr r0, _08057AFC @ =0x040000d4
	ldr r2, _08057B00 @ =0x020219cc
	str r2, [r0]
	ldr r1, _08057B04 @ =0x0600e800
	str r1, [r0, 0x4]
	ldr r3, _08057B08 @ =0x80000400
	str r3, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r4, 0x80
	lsls r4, 4
	adds r1, r2, r4
	str r1, [r0]
	ldr r1, _08057B0C @ =0x0600e000
	str r1, [r0, 0x4]
	str r3, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r7, 0x80
	lsls r7, 5
	adds r2, r7
	str r2, [r0]
	ldr r1, _08057B10 @ =0x0600f000
	str r1, [r0, 0x4]
	str r3, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0
	strb r0, [r6, 0x4]
_08057AE0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057AE8: .4byte gBGHOffsetRegs
_08057AEC: .4byte gUnknown_03000590
_08057AF0: .4byte gUnknown_03000598
_08057AF4: .4byte gBGVOffsetRegs
_08057AF8: .4byte gUnknown_0300059A
_08057AFC: .4byte 0x040000d4
_08057B00: .4byte 0x020219cc
_08057B04: .4byte 0x0600e800
_08057B08: .4byte 0x80000400
_08057B0C: .4byte 0x0600e000
_08057B10: .4byte 0x0600f000
	thumb_func_end sub_8057A58

	thumb_func_start sub_8057B14
sub_8057B14: @ 8057B14
	push {r4,lr}
	ldr r3, _08057B34 @ =gUnknown_03000590
	ldr r2, _08057B38 @ =gUnknown_03000598
	ldrh r2, [r2]
	ldrb r4, [r3]
	adds r2, r4
	strh r2, [r0]
	ldr r0, _08057B3C @ =gUnknown_0300059A
	ldrh r0, [r0]
	ldrb r3, [r3, 0x1]
	adds r0, r3
	adds r0, 0x8
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057B34: .4byte gUnknown_03000590
_08057B38: .4byte gUnknown_03000598
_08057B3C: .4byte gUnknown_0300059A
	thumb_func_end sub_8057B14

	thumb_func_start DrawWholeMapView
DrawWholeMapView: @ 8057B40
	push {lr}
	ldr r1, _08057B60 @ =gSaveBlock1
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	ldr r2, _08057B64 @ =gMapHeader
	ldr r2, [r2]
	bl DrawWholeMapViewInternal
	ldr r1, _08057B68 @ =gUnknown_03000590
	movs r0, 0x1
	strb r0, [r1, 0x4]
	pop {r0}
	bx r0
	.align 2, 0
_08057B60: .4byte gSaveBlock1
_08057B64: .4byte gMapHeader
_08057B68: .4byte gUnknown_03000590
	thumb_func_end DrawWholeMapView

	thumb_func_start DrawWholeMapViewInternal
DrawWholeMapViewInternal: @ 8057EAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r1, 0
_08057EC0:
	ldr r2, _08057F2C @ =gUnknown_03000590
	ldrb r0, [r2, 0x3]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057ED4
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057ED4:
	lsls r6, r0, 5
	movs r4, 0
	adds r7, r1, 0x2
	str r7, [sp]
	lsrs r5, r1, 1
_08057EDE:
	ldr r1, _08057F2C @ =gUnknown_03000590
	ldrb r0, [r1, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057EF2
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057EF2:
	adds r1, r6, r0
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r4, 1
	add r2, r10
	mov r0, r8
	mov r7, r9
	adds r3, r7, r5
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057EDE
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08057EC0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057F2C: .4byte gUnknown_03000590
	thumb_func_end DrawWholeMapViewInternal

	thumb_func_start RedrawMapSlicesForCameraUpdate
RedrawMapSlicesForCameraUpdate: @ 8057F30
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	adds r7, r2, 0
	ldr r0, _08057F78 @ =gMapHeader
	ldr r4, [r0]
	cmp r6, 0
	ble _08057F48
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceWest
_08057F48:
	cmp r6, 0
	bge _08057F54
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceEast
_08057F54:
	cmp r7, 0
	ble _08057F60
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceNorth
_08057F60:
	cmp r7, 0
	bge _08057F6C
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceSouth
_08057F6C:
	movs r0, 0x1
	strb r0, [r5, 0x4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057F78: .4byte gMapHeader
	thumb_func_end RedrawMapSlicesForCameraUpdate

	thumb_func_start RedrawMapSliceNorth
RedrawMapSliceNorth: @ 8057F7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r0, [r5, 0x3]
	adds r0, 0x1C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057F98
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057F98:
	lsls r7, r0, 5
	movs r4, 0
	ldr r6, _08057FE0 @ =gSaveBlock1
_08057F9E:
	ldrb r0, [r5, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057FB0
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057FB0:
	adds r1, r7, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	ldrsh r2, [r6, r0]
	lsrs r0, r4, 1
	adds r2, r0
	movs r0, 0x2
	ldrsh r3, [r6, r0]
	adds r3, 0xE
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057F9E
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057FE0: .4byte gSaveBlock1
	thumb_func_end RedrawMapSliceNorth

	thumb_func_start RedrawMapSliceSouth
RedrawMapSliceSouth: @ 8057FE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r0, [r5, 0x3]
	lsls r7, r0, 5
	movs r4, 0
	ldr r6, _08058030 @ =gSaveBlock1
_08057FF6:
	ldrb r0, [r5, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08058008
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08058008:
	adds r1, r7, r0
	movs r0, 0
	ldrsh r2, [r6, r0]
	lsrs r0, r4, 1
	adds r2, r0
	movs r0, 0x2
	ldrsh r3, [r6, r0]
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057FF6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058030: .4byte gSaveBlock1
	thumb_func_end RedrawMapSliceSouth

	thumb_func_start RedrawMapSliceEast
RedrawMapSliceEast: @ 8058034
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r6, [r5, 0x2]
	movs r4, 0
_08058042:
	ldrb r0, [r5, 0x3]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08058054
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08058054:
	lsls r1, r0, 5
	adds r1, r6
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08058084 @ =gSaveBlock1
	movs r3, 0
	ldrsh r2, [r0, r3]
	movs r7, 0x2
	ldrsh r3, [r0, r7]
	lsrs r0, r4, 1
	adds r3, r0
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08058042
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058084: .4byte gSaveBlock1
	thumb_func_end RedrawMapSliceEast

	thumb_func_start RedrawMapSliceWest
RedrawMapSliceWest: @ 8058088
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	ldrb r0, [r6, 0x2]
	adds r0, 0x1C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1F
	bls _080580A6
	adds r0, r5, 0
	subs r0, 0x20
	lsls r0, 24
	lsrs r5, r0, 24
_080580A6:
	movs r4, 0
	ldr r7, _080580EC @ =gSaveBlock1
_080580AA:
	ldrb r0, [r6, 0x3]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _080580BC
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_080580BC:
	lsls r1, r0, 5
	adds r1, r5
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	ldrsh r2, [r7, r0]
	adds r2, 0xE
	movs r0, 0x2
	ldrsh r3, [r7, r0]
	lsrs r0, r4, 1
	adds r3, r0
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _080580AA
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080580EC: .4byte gSaveBlock1
	thumb_func_end RedrawMapSliceWest

	thumb_func_start CurrentMapDrawMetatileAt
CurrentMapDrawMetatileAt: @ 8057DB0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, _08057DE4 @ =gUnknown_03000590
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl MapPosToBgTilemapOffset
	adds r1, r0, 0
	cmp r1, 0
	blt _08057DDC
	ldr r0, _08057DE8 @ =gMapHeader
	ldr r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	adds r2, r4, 0
	adds r3, r5, 0
	bl DrawMetatileAt
	movs r0, 0x1
	strb r0, [r6, 0x4]
_08057DDC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057DE4: .4byte gUnknown_03000590
_08057DE8: .4byte gMapHeader
	thumb_func_end CurrentMapDrawMetatileAt

	thumb_func_start DrawDoorMetatileAt
DrawDoorMetatileAt: @ 8057DEC
	push {r4-r6,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r6, _08057E1C @ =gUnknown_03000590
	adds r0, r6, 0
	adds r1, r3, 0
	adds r2, r4, 0
	bl MapPosToBgTilemapOffset
	cmp r0, 0
	blt _08057E14
	lsls r2, r0, 16
	lsrs r2, 16
	movs r0, 0x1
	adds r1, r5, 0
	bl DrawMetatile
	movs r0, 0x1
	strb r0, [r6, 0x4]
_08057E14:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057E1C: .4byte gUnknown_03000590
	thumb_func_end DrawDoorMetatileAt

	thumb_func_start DrawMetatileAt
DrawMetatileAt: @ 8058160
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r6, r2, 0
	adds r7, r3, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x80
	lsls r0, 3
	cmp r4, r0
	bls _08058188
	movs r4, 0
_08058188:
	ldr r0, _08058194 @ =0x000001ff
	cmp r4, r0
	bhi _08058198
	ldr r0, [r5, 0x10]
	ldr r5, [r0, 0xC]
	b _080581A4
	.align 2, 0
_08058194: .4byte 0x000001ff
_08058198:
	ldr r0, [r5, 0x14]
	ldr r5, [r0, 0xC]
	ldr r1, _080581C4 @ =0xfffffe00
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080581A4:
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileLayerTypeAt
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 4
	adds r1, r5, r1
	mov r2, r8
	bl DrawMetatile
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080581C4: .4byte 0xfffffe00
	thumb_func_end DrawMetatileAt

	thumb_func_start DrawMetatile
DrawMetatile: @ 80581C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	cmp r0, 0x1
	beq _08058268
	cmp r0, 0x1
	bgt _080581E6
	cmp r0, 0
	bne _080581E4
	b _080582E0
_080581E4:
	b _08058350
_080581E6:
	cmp r0, 0x2
	beq _080581EC
	b _08058350
_080581EC:
	ldr r0, _08058264 @ =gBGTilemapBuffers
	mov r12, r0
	lsls r1, r6, 1
	mov r9, r1
	movs r5, 0xC0
	lsls r5, 5
	add r5, r12
	adds r1, r5
	ldrh r0, [r7]
	movs r2, 0
	mov r8, r2
	strh r0, [r1]
	adds r4, r6, 0x1
	lsls r4, 1
	adds r1, r4, r5
	ldrh r0, [r7, 0x2]
	strh r0, [r1]
	adds r3, r6, 0
	adds r3, 0x20
	lsls r3, 1
	adds r1, r3, r5
	ldrh r0, [r7, 0x4]
	strh r0, [r1]
	adds r2, r6, 0
	adds r2, 0x21
	lsls r2, 1
	adds r5, r2, r5
	ldrh r0, [r7, 0x6]
	strh r0, [r5]
	movs r1, 0x80
	lsls r1, 5
	add r1, r12
	mov r5, r9
	adds r0, r5, r1
	mov r5, r8
	strh r5, [r0]
	adds r0, r4, r1
	strh r5, [r0]
	adds r0, r3, r1
	strh r5, [r0]
	adds r1, r2, r1
	strh r5, [r1]
	movs r5, 0x80
	lsls r5, 4
	add r5, r12
	add r9, r5
	ldrh r0, [r7, 0x8]
	mov r1, r9
	strh r0, [r1]
	adds r4, r5
	ldrh r0, [r7, 0xA]
	strh r0, [r4]
	adds r3, r5
	ldrh r0, [r7, 0xC]
	strh r0, [r3]
	adds r2, r5
	ldrh r0, [r7, 0xE]
	strh r0, [r2]
	b _08058350
	.align 2, 0
_08058264: .4byte gBGTilemapBuffers
_08058268:
	ldr r2, _080582D8 @ =gBGTilemapBuffers
	mov r12, r2
	lsls r3, r6, 1
	mov r8, r3
	movs r2, 0xC0
	lsls r2, 5
	add r2, r12
	adds r1, r3, r2
	ldrh r0, [r7]
	movs r5, 0
	mov r9, r5
	strh r0, [r1]
	adds r5, r6, 0x1
	lsls r5, 1
	adds r1, r5, r2
	ldrh r0, [r7, 0x2]
	strh r0, [r1]
	adds r4, r6, 0
	adds r4, 0x20
	lsls r4, 1
	adds r1, r4, r2
	ldrh r0, [r7, 0x4]
	strh r0, [r1]
	adds r3, r6, 0
	adds r3, 0x21
	lsls r3, 1
	adds r2, r3, r2
	ldrh r0, [r7, 0x6]
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	add r1, r12
	mov r0, r8
	adds r2, r0, r1
	ldrh r0, [r7, 0x8]
	strh r0, [r2]
	adds r2, r5, r1
	ldrh r0, [r7, 0xA]
	strh r0, [r2]
	adds r2, r4, r1
	ldrh r0, [r7, 0xC]
	strh r0, [r2]
	adds r1, r3, r1
	ldrh r0, [r7, 0xE]
	strh r0, [r1]
	ldr r1, _080582DC @ =0x020219cc
	add r8, r1
	mov r0, r9
	mov r2, r8
	strh r0, [r2]
	adds r5, r1
	strh r0, [r5]
	adds r4, r1
	strh r0, [r4]
	adds r3, r1
	b _0805834E
	.align 2, 0
_080582D8: .4byte gBGTilemapBuffers
_080582DC: .4byte 0x020219cc
_080582E0:
	ldr r1, _0805835C @ =gBGTilemapBuffers
	mov r9, r1
	lsls r2, r6, 1
	mov r8, r2
	movs r1, 0xC0
	lsls r1, 5
	add r1, r9
	adds r0, r2, r1
	ldr r2, _08058360 @ =0x00003014
	strh r2, [r0]
	adds r5, r6, 0x1
	lsls r5, 1
	adds r0, r5, r1
	strh r2, [r0]
	adds r4, r6, 0
	adds r4, 0x20
	lsls r4, 1
	adds r0, r4, r1
	strh r2, [r0]
	adds r3, r6, 0
	adds r3, 0x21
	lsls r3, 1
	adds r1, r3, r1
	strh r2, [r1]
	movs r1, 0x80
	lsls r1, 5
	add r1, r9
	mov r0, r8
	adds r2, r0, r1
	ldrh r0, [r7]
	strh r0, [r2]
	adds r2, r5, r1
	ldrh r0, [r7, 0x2]
	strh r0, [r2]
	adds r2, r4, r1
	ldrh r0, [r7, 0x4]
	strh r0, [r2]
	adds r1, r3, r1
	ldrh r0, [r7, 0x6]
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 4
	add r2, r9
	add r8, r2
	ldrh r0, [r7, 0x8]
	mov r1, r8
	strh r0, [r1]
	adds r5, r2
	ldrh r0, [r7, 0xA]
	strh r0, [r5]
	adds r4, r2
	ldrh r0, [r7, 0xC]
	strh r0, [r4]
	adds r3, r2
	ldrh r0, [r7, 0xE]
_0805834E:
	strh r0, [r3]
_08058350:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805835C: .4byte gBGTilemapBuffers
_08058360: .4byte 0x00003014
	thumb_func_end DrawMetatile

	thumb_func_start MapPosToBgTilemapOffset
MapPosToBgTilemapOffset: @ 8058364
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r4, _08058394 @ =gSaveBlock1
	movs r5, 0
	ldrsh r0, [r4, r5]
	subs r1, r0
	lsls r1, 1
	cmp r1, 0x1F
	bhi _0805838C
	ldrb r0, [r3, 0x2]
	adds r1, r0
	cmp r1, 0x1F
	ble _08058380
	subs r1, 0x20
_08058380:
	movs r5, 0x2
	ldrsh r0, [r4, r5]
	subs r0, r2, r0
	lsls r2, r0, 1
	cmp r2, 0x1F
	bls _08058398
_0805838C:
	movs r0, 0x1
	negs r0, r0
	b _080583A6
	.align 2, 0
_08058394: .4byte gSaveBlock1
_08058398:
	ldrb r0, [r3, 0x3]
	adds r2, r0
	cmp r2, 0x1F
	ble _080583A2
	subs r2, 0x20
_080583A2:
	lsls r0, r2, 5
	adds r0, r1
_080583A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end MapPosToBgTilemapOffset

	thumb_func_start CameraUpdateCallback
CameraUpdateCallback: @ 80583AC
	push {lr}
	adds r3, r0, 0
	ldr r2, [r3, 0x4]
	cmp r2, 0
	beq _080583CC
	ldr r1, _080583D0 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x8]
	movs r1, 0x34
	ldrsh r0, [r0, r1]
	str r0, [r3, 0xC]
_080583CC:
	pop {r0}
	bx r0
	.align 2, 0
_080583D0: .4byte gSprites
	thumb_func_end CameraUpdateCallback

	thumb_func_start ResetCameraUpdateInfo
ResetCameraUpdateInfo: @ 8058094
	ldr r1, _080580A8 @ =gUnknown_03004880
	movs r0, 0
	str r0, [r1, 0x8]
	str r0, [r1, 0xC]
	str r0, [r1, 0x10]
	str r0, [r1, 0x14]
	str r0, [r1, 0x4]
	str r0, [r1]
	bx lr
	.align 2, 0
_080580A8: .4byte gUnknown_03004880
	thumb_func_end ResetCameraUpdateInfo

	thumb_func_start InitCameraUpdateCallback
InitCameraUpdateCallback: @ 80580AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080580E0 @ =gUnknown_03004880
	ldr r1, [r4, 0x4]
	cmp r1, 0
	beq _080580C8
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080580E4 @ =gSprites
	adds r0, r1
	bl DestroySprite
_080580C8:
	adds r0, r5, 0
	bl AddCameraObject
	lsls r0, 24
	lsrs r0, 24
	str r0, [r4, 0x4]
	ldr r0, _080580E8 @ =CameraUpdateCallback
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080580E0: .4byte gUnknown_03004880
_080580E4: .4byte gSprites
_080580E8: .4byte CameraUpdateCallback
	thumb_func_end InitCameraUpdateCallback

	thumb_func_start CameraUpdate
CameraUpdate: @ 80580EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _080581EC @ =gUnknown_03004880
	ldr r1, [r6]
	cmp r1, 0
	beq _08058100
	adds r0, r6, 0
	bl _call_via_r1
_08058100:
	ldr r7, [r6, 0x8]
	ldr r0, [r6, 0xC]
	mov r8, r0
	movs r4, 0
	movs r5, 0
	ldr r1, [r6, 0x10]
	ldr r0, [r6, 0x14]
	cmp r1, 0
	bne _0805811E
	cmp r7, 0
	beq _0805811E
	subs r4, 0x1
	cmp r7, 0
	ble _0805811E
	movs r4, 0x1
_0805811E:
	cmp r0, 0
	bne _08058132
	mov r2, r8
	cmp r2, 0
	beq _08058132
	movs r5, 0x1
	negs r5, r5
	cmp r2, 0
	ble _08058132
	movs r5, 0x1
_08058132:
	cmp r1, 0
	beq _08058144
	cmn r1, r7
	bne _08058144
	movs r4, 0x1
	negs r4, r4
	cmp r7, 0
	ble _08058144
	movs r4, 0x1
_08058144:
	cmp r0, 0
	beq _08058158
	mov r3, r8
	cmn r0, r3
	bne _08058158
	movs r4, 0x1
	negs r4, r4
	cmp r3, 0
	ble _08058158
	movs r4, 0x1
_08058158:
	ldr r2, _080581EC @ =gUnknown_03004880
	ldr r0, [r2, 0x10]
	adds r1, r0, r7
	str r1, [r2, 0x10]
	adds r0, r1, 0
	cmp r1, 0
	bge _08058168
	adds r0, 0xF
_08058168:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	mov r3, r8
	adds r1, r0, r3
	str r1, [r2, 0x14]
	adds r0, r1, 0
	cmp r1, 0
	bge _08058180
	adds r0, 0xF
_08058180:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x14]
	cmp r4, 0
	bne _08058190
	cmp r5, 0
	beq _080581C6
_08058190:
	adds r0, r4, 0
	adds r1, r5, 0
	bl CameraMove
	adds r0, r4, 0
	adds r1, r5, 0
	bl UpdateFieldObjectsForCameraUpdate
	adds r0, r4, 0
	adds r1, r5, 0
	bl RotatingGatePuzzleCameraUpdate
	bl ResetBerryTreeSparkleFlags
	ldr r6, _080581F0 @ =gUnknown_03000590
	lsls r4, 1
	lsls r5, 1
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl tilemap_move_something
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl RedrawMapSlicesForCameraUpdate
_080581C6:
	ldr r0, _080581F0 @ =gUnknown_03000590
	adds r1, r7, 0
	mov r2, r8
	bl coords8_add
	ldr r1, _080581F4 @ =gUnknown_0300489C
	ldrh r0, [r1]
	subs r0, r7
	strh r0, [r1]
	ldr r1, _080581F8 @ =gUnknown_03004898
	ldrh r0, [r1]
	mov r2, r8
	subs r0, r2
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080581EC: .4byte gUnknown_03004880
_080581F0: .4byte gUnknown_03000590
_080581F4: .4byte gUnknown_0300489C
_080581F8: .4byte gUnknown_03004898
	thumb_func_end CameraUpdate

	thumb_func_start camera_move_and_redraw
camera_move_and_redraw: @ 80581FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl CameraMove
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl UpdateFieldObjectsForCameraUpdate
	bl DrawWholeMapView
	ldr r1, _08058230 @ =gUnknown_0300489C
	lsls r4, 4
	ldrh r0, [r1]
	subs r0, r4
	strh r0, [r1]
	ldr r1, _08058234 @ =gUnknown_03004898
	lsls r5, 4
	ldrh r0, [r1]
	subs r0, r5
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058230: .4byte gUnknown_0300489C
_08058234: .4byte gUnknown_03004898
	thumb_func_end camera_move_and_redraw

	thumb_func_start SetCameraPanningCallback
SetCameraPanningCallback: @ 8058238
	ldr r1, _08058240 @ =gUnknown_030005A0
	str r0, [r1]
	bx lr
	.align 2, 0
_08058240: .4byte gUnknown_030005A0
	thumb_func_end SetCameraPanningCallback

	thumb_func_start SetCameraPanning
SetCameraPanning: @ 8058244
	ldr r2, _08058254 @ =gUnknown_03000598
	strh r0, [r2]
	ldr r0, _08058258 @ =gUnknown_0300059A
	lsls r1, 16
	asrs r1, 16
	adds r1, 0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_08058254: .4byte gUnknown_03000598
_08058258: .4byte gUnknown_0300059A
	thumb_func_end SetCameraPanning

	thumb_func_start InstallCameraPanAheadCallback
InstallCameraPanAheadCallback: @ 805825C
	ldr r1, _08058278 @ =gUnknown_030005A0
	ldr r0, _0805827C @ =CameraPanningCB_PanAhead
	str r0, [r1]
	ldr r1, _08058280 @ =gUnknown_0300059C
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08058284 @ =gUnknown_03000598
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08058288 @ =gUnknown_0300059A
	movs r0, 0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_08058278: .4byte gUnknown_030005A0
_0805827C: .4byte CameraPanningCB_PanAhead
_08058280: .4byte gUnknown_0300059C
_08058284: .4byte gUnknown_03000598
_08058288: .4byte gUnknown_0300059A
	thumb_func_end InstallCameraPanAheadCallback

	thumb_func_start UpdateCameraPanning
UpdateCameraPanning: @ 805828C
	push {lr}
	ldr r0, _080582BC @ =gUnknown_030005A0
	ldr r0, [r0]
	cmp r0, 0
	beq _0805829A
	bl _call_via_r0
_0805829A:
	ldr r2, _080582C0 @ =gSpriteCoordOffsetX
	ldr r0, _080582C4 @ =gUnknown_0300489C
	ldr r1, _080582C8 @ =gUnknown_03000598
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r2, _080582CC @ =gSpriteCoordOffsetY
	ldr r0, _080582D0 @ =gUnknown_03004898
	ldr r1, _080582D4 @ =gUnknown_0300059A
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	subs r0, 0x8
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080582BC: .4byte gUnknown_030005A0
_080582C0: .4byte gSpriteCoordOffsetX
_080582C4: .4byte gUnknown_0300489C
_080582C8: .4byte gUnknown_03000598
_080582CC: .4byte gSpriteCoordOffsetY
_080582D0: .4byte gUnknown_03004898
_080582D4: .4byte gUnknown_0300059A
	thumb_func_end UpdateCameraPanning

	thumb_func_start CameraPanningCB_PanAhead
CameraPanningCB_PanAhead: @ 8058618
	push {lr}
	ldr r0, _08058628 @ =gUnknown_0202E854
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805862C
	bl InstallCameraPanAheadCallback
	b _080586B4
	.align 2, 0
_08058628: .4byte gUnknown_0202E854
_0805862C:
	ldr r0, _08058644 @ =gPlayerAvatar
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	bne _0805864C
	ldr r0, _08058648 @ =gUnknown_0300059C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	cmp r1, 0
	beq _080586B4
	b _08058652
	.align 2, 0
_08058644: .4byte gPlayerAvatar
_08058648: .4byte gUnknown_0300059C
_0805864C:
	ldr r1, _08058674 @ =gUnknown_0300059C
	movs r0, 0
	strb r0, [r1]
_08058652:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805867C
	ldr r2, _08058678 @ =gUnknown_0300059A
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	ble _080586B4
	subs r0, r3, 0x2
	b _080586B2
	.align 2, 0
_08058674: .4byte gUnknown_0300059C
_08058678: .4byte gUnknown_0300059A
_0805867C:
	cmp r0, 0x1
	bne _08058698
	ldr r1, _08058694 @ =gUnknown_0300059A
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x47
	bgt _080586B4
	adds r0, r2, 0x2
	strh r0, [r1]
	b _080586B4
	.align 2, 0
_08058694: .4byte gUnknown_0300059A
_08058698:
	ldr r2, _080586A8 @ =gUnknown_0300059A
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x1F
	bgt _080586AC
	adds r0, 0x2
	b _080586B2
	.align 2, 0
_080586A8: .4byte gUnknown_0300059A
_080586AC:
	cmp r1, 0x20
	ble _080586B4
	subs r0, 0x2
_080586B2:
	strh r0, [r2]
_080586B4:
	pop {r0}
	bx r0
	thumb_func_end CameraPanningCB_PanAhead

	.align 2, 0 @ Don't pad with nop.
