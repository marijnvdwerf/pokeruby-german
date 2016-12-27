	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start mapconnection_get_mapheader
mapconnection_get_mapheader: @ 80562D0
	push {lr}
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	pop {r1}
	bx r1
	thumb_func_end mapconnection_get_mapheader

	thumb_func_start not_trainer_hill_battle_pyramid
not_trainer_hill_battle_pyramid: @ 80562E0
	push {r4,lr}
	ldr r4, _080562FC @ =gMapHeader
	adds r0, r4, 0
	bl mapheader_copy_mapdata_with_padding
	ldr r0, [r4, 0x4]
	bl sub_80BB970
	bl mapheader_run_script_with_tag_x1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080562FC: .4byte gMapHeader
	thumb_func_end not_trainer_hill_battle_pyramid

	thumb_func_start sub_8055FC0
sub_8055FC0: @ 8056300
	push {r4,lr}
	ldr r4, _08056330 @ =gMapHeader
	adds r0, r4, 0
	bl mapheader_copy_mapdata_with_padding
	movs r0, 0
	bl sub_80BBCCC
	ldr r0, [r4, 0x4]
	bl sub_80BB970
	bl sub_8056670
	bl mapheader_run_script_with_tag_x1
	ldr r1, _08056334 @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	bl UpdateTVScreensOnMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056330: .4byte gMapHeader
_08056334: .4byte gUnknown_03004870
	thumb_func_end sub_8055FC0

	thumb_func_start mapheader_copy_mapdata_with_padding
mapheader_copy_mapdata_with_padding: @ 8056338
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r5, [r6]
	ldr r0, _08056384 @ =0x03ff03ff
	str r0, [sp]
	ldr r4, _08056388 @ =0x02029828
	ldr r2, _0805638C @ =0x01001400
	mov r0, sp
	adds r1, r4, 0
	bl CpuFastSet
	ldr r2, _08056390 @ =gUnknown_03004870
	str r4, [r2, 0x8]
	ldr r1, [r5]
	adds r1, 0xF
	str r1, [r2]
	ldr r0, [r5, 0x4]
	adds r0, 0xE
	str r0, [r2, 0x4]
	muls r1, r0
	movs r0, 0xA0
	lsls r0, 6
	cmp r1, r0
	bgt _0805637A
	ldr r0, [r5, 0xC]
	ldrh r1, [r5]
	ldrh r2, [r5, 0x4]
	bl map_copy_with_padding
	adds r0, r6, 0
	bl sub_80560AC
_0805637A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056384: .4byte 0x03ff03ff
_08056388: .4byte 0x02029828
_0805638C: .4byte 0x01001400
_08056390: .4byte gUnknown_03004870
	thumb_func_end mapheader_copy_mapdata_with_padding

	thumb_func_start map_copy_with_padding
map_copy_with_padding: @ 8056394
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080563E8 @ =gUnknown_03004870
	ldr r4, [r0, 0x8]
	ldr r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, 0xE
	adds r4, r0
	cmp r2, 0
	beq _080563DC
	mov r0, r8
	lsls r6, r0, 1
	adds r5, r2, 0
	movs r0, 0x1E
	adds r0, r6
	mov r9, r0
_080563C8:
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, r8
	bl CpuSet
	add r4, r9
	adds r7, r6
	subs r5, 0x1
	cmp r5, 0
	bne _080563C8
_080563DC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080563E8: .4byte gUnknown_03004870
	thumb_func_end map_copy_with_padding

	thumb_func_start sub_80560AC
sub_80560AC: @ 80563EC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [r6, 0xC]
	ldr r1, [r0]
	ldr r5, [r0, 0x4]
	ldr r2, _08056420 @ =0x0202e850
	ldr r0, _08056424 @ =0x08314610
	ldr r0, [r0]
	str r0, [r2]
	cmp r1, 0
	ble _0805646C
	adds r4, r2, 0
	adds r7, r1, 0
_08056406:
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldr r2, [r5, 0x4]
	ldrb r0, [r5]
	cmp r0, 0x2
	beq _0805643E
	cmp r0, 0x2
	bgt _08056428
	cmp r0, 0x1
	beq _08056432
	b _08056464
	.align 2, 0
_08056420: .4byte 0x0202e850
_08056424: .4byte 0x08314610
_08056428:
	cmp r0, 0x3
	beq _0805644A
	cmp r0, 0x4
	beq _08056456
	b _08056464
_08056432:
	adds r0, r6, 0
	bl fillSouthConnection
	ldrb r0, [r4]
	movs r1, 0x1
	b _08056460
_0805643E:
	adds r0, r6, 0
	bl fillNorthConnection
	ldrb r0, [r4]
	movs r1, 0x2
	b _08056460
_0805644A:
	adds r0, r6, 0
	bl fillWestConnection
	ldrb r0, [r4]
	movs r1, 0x4
	b _08056460
_08056456:
	adds r0, r6, 0
	bl fillEastConnection
	ldrb r0, [r4]
	movs r1, 0x8
_08056460:
	orrs r0, r1
	strb r0, [r4]
_08056464:
	subs r7, 0x1
	adds r5, 0xC
	cmp r7, 0
	bne _08056406
_0805646C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80560AC

	thumb_func_start sub_8056134
sub_8056134: @ 8056474
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, 0x18]
	ldr r4, [r2]
	ldr r7, [r4]
	adds r2, r7, 0
	muls r2, r5
	adds r2, r3
	lsls r2, 1
	ldr r3, [r4, 0xC]
	adds r6, r3, r2
	ldr r3, _080564D0 @ =gUnknown_03004870
	ldr r2, [r3]
	muls r1, r2
	adds r1, r0
	lsls r1, 1
	ldr r0, [r3, 0x8]
	adds r5, r0, r1
	ldr r0, [sp, 0x20]
	cmp r0, 0
	ble _080564C6
	adds r4, r0, 0
	ldr r3, _080564D4 @ =0x001fffff
	mov r8, r3
_080564A6:
	adds r0, r6, 0
	adds r1, r5, 0
	ldr r2, [sp, 0x1C]
	mov r3, r8
	ands r2, r3
	bl CpuSet
	ldr r0, _080564D0 @ =gUnknown_03004870
	ldr r0, [r0]
	lsls r0, 1
	adds r5, r0
	lsls r0, r7, 1
	adds r6, r0
	subs r4, 0x1
	cmp r4, 0
	bne _080564A6
_080564C6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080564D0: .4byte gUnknown_03004870
_080564D4: .4byte 0x001fffff
	thumb_func_end sub_8056134

	thumb_func_start fillSouthConnection
fillSouthConnection: @ 80564D8
	push {r4-r7,lr}
	sub sp, 0xC
	adds r3, r0, 0
	adds r5, r1, 0
	cmp r5, 0
	beq _08056532
	ldr r0, [r5]
	ldr r4, [r0]
	adds r2, 0x7
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	adds r7, r0, 0x7
	cmp r2, 0
	bge _0805650C
	negs r6, r2
	adds r2, r4
	ldr r0, _08056508 @ =gUnknown_03004870
	ldr r3, [r0]
	cmp r2, r3
	bge _08056502
	adds r3, r2, 0
_08056502:
	movs r2, 0
	b _0805651C
	.align 2, 0
_08056508: .4byte gUnknown_03004870
_0805650C:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _0805653C @ =gUnknown_03004870
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _0805651C
	adds r3, r4, 0
_0805651C:
	movs r0, 0
	str r0, [sp]
	str r3, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	adds r0, r2, 0
	adds r1, r7, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8056134
_08056532:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805653C: .4byte gUnknown_03004870
	thumb_func_end fillSouthConnection

	thumb_func_start fillNorthConnection
fillNorthConnection: @ 8056540
	push {r4-r7,lr}
	sub sp, 0xC
	adds r5, r1, 0
	cmp r5, 0
	beq _08056594
	ldr r0, [r5]
	ldr r4, [r0]
	ldr r0, [r0, 0x4]
	adds r2, 0x7
	subs r7, r0, 0x7
	cmp r2, 0
	bge _08056570
	negs r6, r2
	adds r2, r4
	ldr r0, _0805656C @ =gUnknown_03004870
	ldr r3, [r0]
	cmp r2, r3
	bge _08056566
	adds r3, r2, 0
_08056566:
	movs r2, 0
	b _08056580
	.align 2, 0
_0805656C: .4byte gUnknown_03004870
_08056570:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _0805659C @ =gUnknown_03004870
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _08056580
	adds r3, r4, 0
_08056580:
	str r7, [sp]
	str r3, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8056134
_08056594:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805659C: .4byte gUnknown_03004870
	thumb_func_end fillNorthConnection

	thumb_func_start fillWestConnection
fillWestConnection: @ 80565A0
	push {r4-r7,lr}
	sub sp, 0xC
	adds r5, r1, 0
	cmp r5, 0
	beq _080565F4
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r4, [r0, 0x4]
	adds r2, 0x7
	subs r7, r1, 0x7
	cmp r2, 0
	bge _080565D0
	negs r6, r2
	adds r1, r2, r4
	ldr r0, _080565CC @ =gUnknown_03004870
	ldr r3, [r0, 0x4]
	cmp r1, r3
	bge _080565C6
	adds r3, r1, 0
_080565C6:
	movs r2, 0
	b _080565E0
	.align 2, 0
_080565CC: .4byte gUnknown_03004870
_080565D0:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _080565FC @ =gUnknown_03004870
	ldr r1, [r1, 0x4]
	subs r3, r1, r2
	cmp r0, r1
	bge _080565E0
	adds r3, r4, 0
_080565E0:
	str r6, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r0, 0
	adds r1, r2, 0
	adds r2, r5, 0
	adds r3, r7, 0
	bl sub_8056134
_080565F4:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080565FC: .4byte gUnknown_03004870
	thumb_func_end fillWestConnection

	thumb_func_start fillEastConnection
fillEastConnection: @ 8056600
	push {r4-r7,lr}
	sub sp, 0xC
	adds r3, r0, 0
	adds r5, r1, 0
	cmp r5, 0
	beq _08056658
	ldr r0, [r5]
	ldr r4, [r0, 0x4]
	ldr r0, [r3]
	ldr r0, [r0]
	adds r7, r0, 0x7
	adds r2, 0x7
	cmp r2, 0
	bge _08056634
	negs r6, r2
	adds r1, r2, r4
	ldr r0, _08056630 @ =gUnknown_03004870
	ldr r3, [r0, 0x4]
	cmp r1, r3
	bge _0805662A
	adds r3, r1, 0
_0805662A:
	movs r2, 0
	b _08056644
	.align 2, 0
_08056630: .4byte gUnknown_03004870
_08056634:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _08056660 @ =gUnknown_03004870
	ldr r1, [r1, 0x4]
	subs r3, r1, r2
	cmp r0, r1
	bge _08056644
	adds r3, r4, 0
_08056644:
	str r6, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	adds r0, r7, 0
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_8056134
_08056658:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056660: .4byte gUnknown_03004870
	thumb_func_end fillEastConnection

	thumb_func_start MapGridGetZCoordAt
MapGridGetZCoordAt: @ 8056664
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	cmp r2, 0
	blt _08056694
	ldr r1, _08056690 @ =gUnknown_03004870
	ldr r3, [r1]
	cmp r2, r3
	bge _08056694
	cmp r4, 0
	blt _08056694
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bge _08056694
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080566B6
	.align 2, 0
_08056690: .4byte gUnknown_03004870
_08056694:
	ldr r0, _080566C0 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r2, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r4, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_080566B6:
	ldr r0, _080566C4 @ =0x000003ff
	cmp r1, r0
	beq _080566C8
	lsrs r0, r1, 12
	b _080566CA
	.align 2, 0
_080566C0: .4byte gMapHeader
_080566C4: .4byte 0x000003ff
_080566C8:
	movs r0, 0
_080566CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridGetZCoordAt

	thumb_func_start MapGridIsImpassableAt
MapGridIsImpassableAt: @ 80566D0
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	cmp r2, 0
	blt _08056700
	ldr r1, _080566FC @ =gUnknown_03004870
	ldr r3, [r1]
	cmp r2, r3
	bge _08056700
	cmp r4, 0
	blt _08056700
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bge _08056700
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08056722
	.align 2, 0
_080566FC: .4byte gUnknown_03004870
_08056700:
	ldr r0, _08056734 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r2, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r4, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_08056722:
	ldr r0, _08056738 @ =0x000003ff
	cmp r1, r0
	beq _0805673C
	movs r0, 0xC0
	lsls r0, 4
	ands r1, r0
	lsrs r0, r1, 10
	b _0805673E
	.align 2, 0
_08056734: .4byte gMapHeader
_08056738: .4byte 0x000003ff
_0805673C:
	movs r0, 0x1
_0805673E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridIsImpassableAt

	thumb_func_start MapGridGetMetatileIdAt
MapGridGetMetatileIdAt: @ 8056744
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	blt _08056774
	ldr r1, _08056770 @ =gUnknown_03004870
	ldr r2, [r1]
	cmp r5, r2
	bge _08056774
	cmp r6, 0
	blt _08056774
	ldr r0, [r1, 0x4]
	cmp r6, r0
	bge _08056774
	adds r0, r2, 0
	muls r0, r6
	adds r0, r5, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	b _08056798
	.align 2, 0
_08056770: .4byte gUnknown_03004870
_08056774:
	ldr r0, _080567A4 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r5, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r6, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	adds r4, r0, 0
	orrs r4, r1
_08056798:
	ldr r0, _080567A8 @ =0x000003ff
	cmp r4, r0
	beq _080567AC
	ands r4, r0
	adds r0, r4, 0
	b _080567D0
	.align 2, 0
_080567A4: .4byte gMapHeader
_080567A8: .4byte 0x000003ff
_080567AC:
	ldr r0, _080567D8 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r5, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r6, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r1, r2, 0
	orrs r0, r1
	ands r0, r4
_080567D0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080567D8: .4byte gMapHeader
	thumb_func_end MapGridGetMetatileIdAt

	thumb_func_start MapGridGetMetatileBehaviorAt
MapGridGetMetatileBehaviorAt: @ 80567DC
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	adds r1, r0, 0
	movs r0, 0xFF
	ands r0, r1
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileBehaviorAt

	thumb_func_start MapGridGetMetatileLayerTypeAt
MapGridGetMetatileLayerTypeAt: @ 80567F4
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	adds r1, r0, 0
	movs r0, 0xF0
	lsls r0, 8
	ands r0, r1
	lsrs r0, 12
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileLayerTypeAt

	thumb_func_start MapGridSetMetatileIdAt
MapGridSetMetatileIdAt: @ 8056810
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08056848
	ldr r2, _08056850 @ =gUnknown_03004870
	ldr r4, [r2]
	cmp r3, r4
	bge _08056848
	cmp r1, 0
	blt _08056848
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08056848
	muls r1, r4
	adds r1, r3, r1
	ldr r0, [r2, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xF0
	lsls r2, 8
	ands r2, r0
	ldr r0, _08056854 @ =0x00000fff
	ands r0, r5
	orrs r2, r0
	strh r2, [r1]
_08056848:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056850: .4byte gUnknown_03004870
_08056854: .4byte 0x00000fff
	thumb_func_end MapGridSetMetatileIdAt

	thumb_func_start MapGridSetMetatileEntryAt
MapGridSetMetatileEntryAt: @ 8056858
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08056884
	ldr r2, _0805688C @ =gUnknown_03004870
	ldr r4, [r2]
	cmp r3, r4
	bge _08056884
	cmp r1, 0
	blt _08056884
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08056884
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3, r0
	ldr r1, [r2, 0x8]
	lsls r0, 1
	adds r0, r1
	strh r5, [r0]
_08056884:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805688C: .4byte gUnknown_03004870
	thumb_func_end MapGridSetMetatileEntryAt

	thumb_func_start GetBehaviorByMetatileId
GetBehaviorByMetatileId: @ 8056890
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	adds r3, r2, 0
	ldr r0, _080568AC @ =0x000001ff
	cmp r2, r0
	bhi _080568B4
	ldr r0, _080568B0 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	ldr r1, [r0, 0x10]
	lsls r0, r2, 1
	b _080568D2
	.align 2, 0
_080568AC: .4byte 0x000001ff
_080568B0: .4byte gMapHeader
_080568B4:
	ldr r0, _080568C0 @ =0x000003ff
	cmp r2, r0
	bls _080568C4
	movs r0, 0xFF
	b _080568D6
	.align 2, 0
_080568C0: .4byte 0x000003ff
_080568C4:
	ldr r0, _080568DC @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r1, [r0, 0x10]
	lsls r0, r3, 1
	adds r0, r1
	ldr r1, _080568E0 @ =0xfffffc00
_080568D2:
	adds r0, r1
	ldrh r0, [r0]
_080568D6:
	pop {r1}
	bx r1
	.align 2, 0
_080568DC: .4byte gMapHeader
_080568E0: .4byte 0xfffffc00
	thumb_func_end GetBehaviorByMetatileId

	thumb_func_start save_serialize_map
save_serialize_map: @ 80568E4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _0805694C @ =0x02025768
	ldr r0, _08056950 @ =gUnknown_03004870
	ldr r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	subs r0, 0x34
	movs r1, 0
	ldrsh r6, [r0, r1]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _0805693E
	mov r12, r1
	ldr r1, _08056954 @ =0x02029828
	mov r9, r1
	lsls r7, r6, 1
_08056910:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r4, r0, 0x1
	cmp r1, r3
	bge _08056938
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_0805692A:
	ldrh r0, [r2]
	strh r0, [r5]
	adds r5, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _0805692A
_08056938:
	adds r0, r4, 0
	cmp r0, r12
	blt _08056910
_0805693E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805694C: .4byte 0x02025768
_08056950: .4byte gUnknown_03004870
_08056954: .4byte 0x02029828
	thumb_func_end save_serialize_map

	thumb_func_start sub_8056618
sub_8056618: @ 8056958
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _0805697C @ =0x02025768
	ldr r3, _08056980 @ =0x000001ff
_08056962:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r0, [r0]
	orrs r2, r0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08056962
	cmp r2, 0
	beq _08056984
	movs r0, 0
	b _08056986
	.align 2, 0
_0805697C: .4byte 0x02025768
_08056980: .4byte 0x000001ff
_08056984:
	movs r0, 0x1
_08056986:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056618

	thumb_func_start sav2_mapdata_clear
sav2_mapdata_clear: @ 805698C
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080569A8 @ =0x02025768
	ldr r2, _080569AC @ =0x01000100
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080569A8: .4byte 0x02025768
_080569AC: .4byte 0x01000100
	thumb_func_end sav2_mapdata_clear

	thumb_func_start sub_8056670
sub_8056670: @ 80569B0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _08056A24 @ =0x02025768
	bl sub_8056618
	cmp r0, 0
	bne _08056A16
	ldr r0, _08056A28 @ =gUnknown_03004870
	ldr r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	subs r0, 0x34
	movs r1, 0
	ldrsh r6, [r0, r1]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _08056A12
	mov r12, r1
	ldr r1, _08056A2C @ =0x02029828
	mov r9, r1
	lsls r7, r6, 1
_080569E4:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r4, r0, 0x1
	cmp r1, r3
	bge _08056A0C
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_080569FE:
	ldrh r0, [r5]
	strh r0, [r2]
	adds r5, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080569FE
_08056A0C:
	adds r0, r4, 0
	cmp r0, r12
	blt _080569E4
_08056A12:
	bl sav2_mapdata_clear
_08056A16:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056A24: .4byte 0x02025768
_08056A28: .4byte gUnknown_03004870
_08056A2C: .4byte 0x02029828
	thumb_func_end sub_8056670

	thumb_func_start sub_80566F0
sub_80566F0: @ 8056A30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _08056A74 @ =0x02025768
	mov r10, r0
	ldr r0, _08056A78 @ =gUnknown_03004870
	ldr r0, [r0]
	str r0, [sp]
	movs r3, 0
	mov r9, r3
	mov r8, r3
	mov r0, r10
	subs r0, 0x34
	movs r6, 0
	ldrsh r4, [r0, r6]
	str r4, [sp, 0x4]
	movs r3, 0x2
	ldrsh r5, [r0, r3]
	movs r7, 0xF
	movs r4, 0xE
	mov r12, r4
	cmp r1, 0x2
	beq _08056A86
	cmp r1, 0x2
	bgt _08056A7C
	cmp r1, 0x1
	beq _08056A8E
	b _08056AA6
	.align 2, 0
_08056A74: .4byte 0x02025768
_08056A78: .4byte gUnknown_03004870
_08056A7C:
	cmp r2, 0x3
	beq _08056A98
	cmp r2, 0x4
	beq _08056AA0
	b _08056AA6
_08056A86:
	adds r5, 0x1
	movs r6, 0xD
	mov r12, r6
	b _08056AA6
_08056A8E:
	movs r0, 0x1
	mov r8, r0
	movs r1, 0xD
	mov r12, r1
	b _08056AA6
_08056A98:
	ldr r3, [sp, 0x4]
	adds r3, 0x1
	str r3, [sp, 0x4]
	b _08056AA4
_08056AA0:
	movs r4, 0x1
	mov r9, r4
_08056AA4:
	movs r7, 0xE
_08056AA6:
	movs r1, 0
	cmp r1, r12
	bge _08056AE8
_08056AAC:
	adds r4, r1, 0x1
	cmp r7, 0
	beq _08056AE2
	adds r0, r1, r5
	ldr r6, [sp]
	adds r2, r6, 0
	muls r2, r0
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	add r0, r9
	ldr r1, [sp, 0x4]
	adds r2, r1, r2
	adds r3, r7, 0
	lsls r2, 1
	ldr r6, _08056AFC @ =0x02029828
	adds r2, r6
	lsls r0, 1
	mov r6, r10
	adds r1, r0, r6
_08056AD4:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08056AD4
_08056AE2:
	adds r1, r4, 0
	cmp r1, r12
	blt _08056AAC
_08056AE8:
	bl sav2_mapdata_clear
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056AFC: .4byte 0x02029828
	thumb_func_end sub_80566F0

	thumb_func_start GetMapBorderIdAt
GetMapBorderIdAt: @ 8056B00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	cmp r4, 0
	blt _08056B3C
	ldr r1, _08056B34 @ =gUnknown_03004870
	ldr r2, [r1]
	cmp r4, r2
	bge _08056B3C
	cmp r5, 0
	blt _08056B3C
	ldr r0, [r1, 0x4]
	cmp r5, r0
	bge _08056B3C
	adds r0, r2, 0
	muls r0, r5
	adds r0, r4, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08056B38 @ =0x000003ff
	cmp r1, r0
	beq _08056BD4
	b _08056B64
	.align 2, 0
_08056B34: .4byte gUnknown_03004870
_08056B38: .4byte 0x000003ff
_08056B3C:
	ldr r0, _08056B80 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r4, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r5, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r0, r1
	ldr r1, _08056B84 @ =0x000003ff
	cmp r0, r1
	beq _08056BD4
_08056B64:
	ldr r1, _08056B88 @ =gUnknown_03004870
	ldr r0, [r1]
	subs r0, 0x8
	cmp r4, r0
	blt _08056B90
	ldr r0, _08056B8C @ =0x0202e850
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08056BD4
	movs r0, 0x4
	b _08056BE6
	.align 2, 0
_08056B80: .4byte gMapHeader
_08056B84: .4byte 0x000003ff
_08056B88: .4byte gUnknown_03004870
_08056B8C: .4byte 0x0202e850
_08056B90:
	cmp r4, 0x6
	bgt _08056BA8
	ldr r0, _08056BA4 @ =0x0202e850
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08056BD4
	movs r0, 0x3
	b _08056BE6
	.align 2, 0
_08056BA4: .4byte 0x0202e850
_08056BA8:
	ldr r0, [r1, 0x4]
	subs r0, 0x7
	cmp r5, r0
	blt _08056BC4
	ldr r0, _08056BC0 @ =0x0202e850
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08056BD4
	movs r0, 0x1
	b _08056BE6
	.align 2, 0
_08056BC0: .4byte 0x0202e850
_08056BC4:
	cmp r5, 0x6
	bgt _08056BE4
	ldr r0, _08056BDC @ =0x0202e850
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08056BE0
_08056BD4:
	movs r0, 0x1
	negs r0, r0
	b _08056BE6
	.align 2, 0
_08056BDC: .4byte 0x0202e850
_08056BE0:
	movs r0, 0x2
	b _08056BE6
_08056BE4:
	movs r0, 0
_08056BE6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetMapBorderIdAt

	thumb_func_start GetPostCameraMoveMapBorderId
GetPostCameraMoveMapBorderId: @ 8056BEC
	push {r4,lr}
	adds r3, r1, 0
	ldr r1, _08056C10 @ =gSaveBlock1
	movs r4, 0
	ldrsh r2, [r1, r4]
	adds r0, 0x7
	adds r2, r0
	movs r0, 0x2
	ldrsh r1, [r1, r0]
	adds r3, 0x7
	adds r1, r3
	adds r0, r2, 0
	bl GetMapBorderIdAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08056C10: .4byte gSaveBlock1
	thumb_func_end GetPostCameraMoveMapBorderId

	thumb_func_start CanCameraMoveInDirection
CanCameraMoveInDirection: @ 8056C14
	push {r4,r5,lr}
	ldr r4, _08056C48 @ =gSaveBlock1
	movs r1, 0
	ldrsh r3, [r4, r1]
	ldr r2, _08056C4C @ =gUnknown_0821664C
	lsls r0, 3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r1, 0x7
	adds r3, r1
	movs r5, 0x2
	ldrsh r1, [r4, r5]
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	adds r0, 0x7
	adds r1, r0
	adds r0, r3, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _08056C50
	movs r0, 0x1
	b _08056C52
	.align 2, 0
_08056C48: .4byte gSaveBlock1
_08056C4C: .4byte gUnknown_0821664C
_08056C50:
	movs r0, 0
_08056C52:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CanCameraMoveInDirection

	thumb_func_start sub_8056918
sub_8056918: @ 8056C58
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	cmp r4, 0x2
	beq _08056CB8
	cmp r4, 0x2
	bgt _08056C76
	cmp r4, 0x1
	beq _08056CA4
	b _08056CC8
_08056C76:
	cmp r4, 0x3
	beq _08056C90
	cmp r4, 0x4
	bne _08056CC8
	ldr r1, _08056C8C @ =gSaveBlock1
	negs r0, r6
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08056CC6
	.align 2, 0
_08056C8C: .4byte gSaveBlock1
_08056C90:
	ldr r1, _08056CA0 @ =gSaveBlock1
	ldr r0, [r3]
	ldr r0, [r0]
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08056CC6
	.align 2, 0
_08056CA0: .4byte gSaveBlock1
_08056CA4:
	ldr r1, _08056CB4 @ =gSaveBlock1
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	negs r0, r7
	b _08056CC6
	.align 2, 0
_08056CB4: .4byte gSaveBlock1
_08056CB8:
	ldr r1, _08056CD0 @ =gSaveBlock1
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
_08056CC6:
	strh r0, [r1, 0x2]
_08056CC8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056CD0: .4byte gSaveBlock1
	thumb_func_end sub_8056918

	thumb_func_start CameraMove
CameraMove: @ 8056CD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	str r1, [sp]
	ldr r1, _08056D14 @ =gUnknown_0202E844
	ldrb r0, [r1]
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	ldr r2, _08056D14 @ =gUnknown_0202E844
	strb r1, [r2]
	mov r0, r10
	ldr r1, [sp]
	bl GetPostCameraMoveMapBorderId
	adds r7, r0, 0
	adds r0, r7, 0x1
	cmp r0, 0x1
	bhi _08056D1C
	ldr r0, _08056D18 @ =gSaveBlock1
	ldrh r1, [r0]
	add r1, r10
	strh r1, [r0]
	ldrh r1, [r0, 0x2]
	ldr r2, [sp]
	adds r1, r2
	strh r1, [r0, 0x2]
	b _08056D82
	.align 2, 0
_08056D14: .4byte gUnknown_0202E844
_08056D18: .4byte gSaveBlock1
_08056D1C:
	bl save_serialize_map
	ldr r5, _08056D9C @ =gSaveBlock1
	movs r0, 0
	ldrsh r6, [r5, r0]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	mov r8, r1
	lsls r0, r7, 24
	lsrs r0, 24
	mov r9, r0
	adds r1, r6, 0
	mov r2, r8
	bl sub_8056A64
	adds r4, r0, 0
	adds r1, r7, 0
	mov r2, r10
	ldr r3, [sp]
	bl sub_8056918
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	bl sub_80538F0
	ldr r1, _08056DA0 @ =gUnknown_0202E844
	ldrb r0, [r1]
	movs r1, 0x1
	orrs r0, r1
	ldr r2, _08056DA0 @ =gUnknown_0202E844
	strb r0, [r2]
	movs r1, 0
	ldrsh r0, [r5, r1]
	subs r6, r0
	str r6, [r2, 0x4]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	mov r1, r8
	subs r1, r0
	ldr r2, _08056DA0 @ =gUnknown_0202E844
	str r1, [r2, 0x8]
	ldrh r0, [r5]
	add r0, r10
	strh r0, [r5]
	ldrh r0, [r5, 0x2]
	ldr r1, [sp]
	adds r0, r1
	strh r0, [r5, 0x2]
	mov r0, r9
	bl sub_80566F0
_08056D82:
	ldr r0, _08056DA0 @ =gUnknown_0202E844
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08056D9C: .4byte gSaveBlock1
_08056DA0: .4byte gUnknown_0202E844
	thumb_func_end CameraMove

	thumb_func_start sub_8056A64
sub_8056A64: @ 8056DA4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	mov r8, r2
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08056DE0 @ =gMapHeader
	ldr r0, [r0, 0xC]
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r5, 0
	cmp r5, r7
	bge _08056DEC
_08056DC2:
	ldrb r0, [r4]
	cmp r0, r6
	bne _08056DE4
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	adds r3, r4, 0
	bl sub_8056ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08056DE4
	adds r0, r4, 0
	b _08056DEE
	.align 2, 0
_08056DE0: .4byte gMapHeader
_08056DE4:
	adds r5, 0x1
	adds r4, 0xC
	cmp r5, r7
	blt _08056DC2
_08056DEC:
	movs r0, 0
_08056DEE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056A64

	thumb_func_start sub_8056ABC
sub_8056ABC: @ 8056DFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r2, r0, 0
	cmp r4, 0x1
	blt _08056E54
	cmp r4, 0x2
	bgt _08056E34
	ldr r0, _08056E30 @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r2]
	ldr r2, [r0]
	ldr r3, [r5, 0x4]
	adds r0, r7, 0
	b _08056E46
	.align 2, 0
_08056E30: .4byte gMapHeader
_08056E34:
	cmp r6, 0x4
	bgt _08056E54
	ldr r0, _08056E50 @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	ldr r0, [r2]
	ldr r2, [r0, 0x4]
	ldr r3, [r5, 0x4]
	mov r0, r8
_08056E46:
	bl sub_8056B20
	lsls r0, 24
	lsrs r0, 24
	b _08056E56
	.align 2, 0
_08056E50: .4byte gMapHeader
_08056E54:
	movs r0, 0
_08056E56:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056ABC

	thumb_func_start sub_8056B20
sub_8056B20: @ 8056E60
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r2, 0
	adds r2, r3, 0
	cmp r3, 0
	bge _08056E6E
	movs r3, 0
_08056E6E:
	adds r2, r0, r2
	cmp r2, r1
	bge _08056E76
	adds r1, r2, 0
_08056E76:
	cmp r3, r4
	bgt _08056E82
	cmp r4, r1
	bgt _08056E82
	movs r0, 0x1
	b _08056E84
_08056E82:
	movs r0, 0
_08056E84:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B20

	thumb_func_start sub_8056B4C
sub_8056B4C: @ 8056E8C
	push {lr}
	cmp r0, 0
	blt _08056E9A
	cmp r0, r1
	bge _08056E9A
	movs r0, 0x1
	b _08056E9C
_08056E9A:
	movs r0, 0
_08056E9C:
	pop {r1}
	bx r1
	thumb_func_end sub_8056B4C

	thumb_func_start sub_8056B60
sub_8056B60: @ 8056EA0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	blt _08056ED8
	cmp r0, 0x2
	bgt _08056EC6
	ldr r0, [r4, 0x4]
	subs r0, r5, r0
	ldr r1, [r1]
	ldr r1, [r1]
	bl sub_8056B4C
	b _08056EDA
_08056EC6:
	cmp r0, 0x4
	bgt _08056ED8
	ldr r0, [r4, 0x4]
	subs r0, r6, r0
	ldr r1, [r1]
	ldr r1, [r1, 0x4]
	bl sub_8056B4C
	b _08056EDA
_08056ED8:
	movs r0, 0
_08056EDA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B60

	thumb_func_start sub_8056BA0
sub_8056BA0: @ 8056EE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08056F00 @ =gMapHeader
	ldr r0, [r2, 0xC]
	cmp r0, 0
	bne _08056F08
	b _08056F7E
	.align 2, 0
_08056F00: .4byte gMapHeader
_08056F04:
	adds r0, r4, 0
	b _08056F80
_08056F08:
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r6, 0
	cmp r6, r7
	bge _08056F7E
	lsls r0, r1, 16
	asrs r5, r0, 16
	mov r9, r2
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	mov r10, r0
_08056F20:
	ldrb r1, [r4]
	adds r3, r1, 0
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056F76
	cmp r1, 0x2
	bne _08056F36
	cmp r5, 0x6
	bgt _08056F76
_08056F36:
	cmp r1, 0x1
	bne _08056F46
	mov r2, r9
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r0, 0x7
	cmp r5, r0
	blt _08056F76
_08056F46:
	mov r0, r8
	lsls r2, r0, 16
	cmp r1, 0x3
	bne _08056F54
	mov r1, r10
	cmp r1, 0x6
	bgt _08056F76
_08056F54:
	cmp r3, 0x4
	bne _08056F66
	asrs r1, r2, 16
	mov r3, r9
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, 0x7
	cmp r1, r0
	blt _08056F76
_08056F66:
	asrs r1, r2, 16
	subs r1, 0x7
	adds r0, r4, 0
	subs r2, r5, 0x7
	bl sub_8056B60
	cmp r0, 0x1
	beq _08056F04
_08056F76:
	adds r6, 0x1
	adds r4, 0xC
	cmp r6, r7
	blt _08056F20
_08056F7E:
	movs r0, 0
_08056F80:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056BA0

	thumb_func_start sub_8056C50
sub_8056C50: @ 8056F90
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08056FA4 @ =gSaveBlock1
	subs r0, 0x7
	strh r0, [r2]
	subs r1, 0x7
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08056FA4: .4byte gSaveBlock1
	thumb_func_end sub_8056C50

	thumb_func_start sav1_camera_get_focus_coords
sav1_camera_get_focus_coords: @ 8056FA8
	ldr r3, _08056FB8 @ =gSaveBlock1
	ldrh r2, [r3]
	adds r2, 0x7
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	adds r0, 0x7
	strh r0, [r1]
	bx lr
	.align 2, 0
_08056FB8: .4byte gSaveBlock1
	thumb_func_end sav1_camera_get_focus_coords

	thumb_func_start unref_sub_8056C7C
unref_sub_8056C7C: @ 8056FBC
	ldr r2, _08056FC4 @ =gSaveBlock1
	strh r0, [r2]
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08056FC4: .4byte gSaveBlock1
	thumb_func_end unref_sub_8056C7C

	thumb_func_start GetCameraCoords
GetCameraCoords: @ 8056FC8
	ldr r3, _08056FD4 @ =gSaveBlock1
	ldrh r2, [r3]
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08056FD4: .4byte gSaveBlock1
	thumb_func_end GetCameraCoords

	thumb_func_start sub_8056C98
sub_8056C98: @ 8056FD8
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	beq _08056FF8
	ldrb r0, [r2]
	cmp r0, 0
	bne _08056FF2
	ldr r0, [r2, 0x4]
	movs r2, 0x80
	lsls r2, 5
	bl CpuFastSet
	b _08056FF8
_08056FF2:
	ldr r0, [r2, 0x4]
	bl LZ77UnCompVram
_08056FF8:
	pop {r0}
	bx r0
	thumb_func_end sub_8056C98

	thumb_func_start sub_8056CBC
sub_8056CBC: @ 8056FFC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	cmp r4, 0
	beq _0805705E
	ldrb r1, [r4, 0x1]
	cmp r1, 0
	bne _0805702E
	mov r0, sp
	strh r1, [r0]
	lsls r1, r5, 16
	lsrs r1, 16
	movs r2, 0x2
	bl LoadPalette
	ldr r0, [r4, 0x8]
	adds r0, 0x2
	adds r1, r5, 0x1
	lsls r1, 16
	lsrs r1, 16
	subs r2, r6, 0x2
	lsls r2, 16
	b _0805703C
_0805702E:
	cmp r1, 0x1
	bne _08057044
	ldr r0, [r4, 0x8]
	adds r0, 0xC0
	lsls r1, r5, 16
	lsrs r1, 16
	lsls r2, r6, 16
_0805703C:
	lsrs r2, 16
	bl LoadPalette
	b _0805705E
_08057044:
	ldr r0, [r4, 0x8]
	movs r4, 0x80
	lsls r4, 18
	adds r1, r4, 0
	bl LZ77UnCompVram
	lsls r1, r5, 16
	lsrs r1, 16
	lsls r2, r6, 16
	lsrs r2, 16
	adds r0, r4, 0
	bl LoadPalette
_0805705E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8056CBC

	thumb_func_start sub_8056D28
sub_8056D28: @ 8057068
	push {lr}
	movs r1, 0xC0
	lsls r1, 19
	ldr r0, [r0, 0x10]
	bl sub_8056C98
	pop {r0}
	bx r0
	thumb_func_end sub_8056D28

	thumb_func_start sub_8056D38
sub_8056D38: @ 8057078
	push {lr}
	ldr r1, _08057088 @ =0x06004000
	ldr r0, [r0, 0x14]
	bl sub_8056C98
	pop {r0}
	bx r0
	.align 2, 0
_08057088: .4byte 0x06004000
	thumb_func_end sub_8056D38

	thumb_func_start apply_map_tileset1_palette
apply_map_tileset1_palette: @ 805708C
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0
	movs r2, 0xC0
	bl sub_8056CBC
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_palette

	thumb_func_start apply_map_tileset2_palette
apply_map_tileset2_palette: @ 805709C
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0x60
	movs r2, 0xC0
	bl sub_8056CBC
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset2_palette

	thumb_func_start copy_map_tileset1_tileset2_to_vram
copy_map_tileset1_tileset2_to_vram: @ 80570AC
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _080570BE
	bl sub_8056D28
	adds r0, r4, 0
	bl sub_8056D38
_080570BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset1_tileset2_to_vram

	thumb_func_start apply_map_tileset1_tileset2_palette
apply_map_tileset1_tileset2_palette: @ 80570C4
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _080570D6
	bl apply_map_tileset1_palette
	adds r0, r4, 0
	bl apply_map_tileset2_palette
_080570D6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_tileset2_palette

	.align 2, 0 @ Don't pad with nop.
