	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8052F5C
sub_8052F5C: @ 805329C
	push {lr}
	ldr r0, _080532C8 @ =gUnknown_0819FC74
	bl ScriptContext2_RunNewScript
	ldr r1, _080532CC @ =gSaveBlock1
	movs r0, 0x92
	lsls r0, 3
	adds r1, r0
	ldr r0, [r1]
	lsrs r0, 1
	str r0, [r1]
	bl HealPlayerParty
	bl sub_8053050
	bl sub_8053570
	bl warp_in
	pop {r0}
	bx r0
	.align 2, 0
_080532C8: .4byte gUnknown_0819FC74
_080532CC: .4byte gSaveBlock1
	thumb_func_end sub_8052F5C

	thumb_func_start flag_var_implications_of_teleport_
flag_var_implications_of_teleport_: @ 80532D0
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _080532F8 @ =0x0000082b
	bl FlagReset
	ldr r0, _080532FC @ =0x0000082d
	bl FlagReset
	ldr r0, _08053300 @ =0x0000082c
	bl FlagReset
	ldr r0, _08053304 @ =0x00000829
	bl FlagReset
	ldr r0, _08053308 @ =0x00000828
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080532F8: .4byte 0x0000082b
_080532FC: .4byte 0x0000082d
_08053300: .4byte 0x0000082c
_08053304: .4byte 0x00000829
_08053308: .4byte 0x00000828
	thumb_func_end flag_var_implications_of_teleport_

	thumb_func_start new_game
new_game: @ 805330C
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _0805333C @ =0x0000082b
	bl FlagReset
	ldr r0, _08053340 @ =0x0000082d
	bl FlagReset
	ldr r0, _08053344 @ =0x0000082c
	bl FlagReset
	ldr r0, _08053348 @ =0x00000829
	bl FlagReset
	ldr r0, _0805334C @ =0x00000828
	bl FlagReset
	ldr r0, _08053350 @ =gUnknown_0819FC9F
	bl ScriptContext2_RunNewScript
	pop {r0}
	bx r0
	.align 2, 0
_0805333C: .4byte 0x0000082b
_08053340: .4byte 0x0000082d
_08053344: .4byte 0x0000082c
_08053348: .4byte 0x00000829
_0805334C: .4byte 0x00000828
_08053350: .4byte gUnknown_0819FC9F
	thumb_func_end new_game

	thumb_func_start sub_8053014
sub_8053014: @ 8053354
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _0805337C @ =0x0000082b
	bl FlagReset
	ldr r0, _08053380 @ =0x0000082d
	bl FlagReset
	ldr r0, _08053384 @ =0x0000082c
	bl FlagReset
	ldr r0, _08053388 @ =0x00000829
	bl FlagReset
	ldr r0, _0805338C @ =0x00000828
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0805337C: .4byte 0x0000082b
_08053380: .4byte 0x0000082d
_08053384: .4byte 0x0000082c
_08053388: .4byte 0x00000829
_0805338C: .4byte 0x00000828
	thumb_func_end sub_8053014

	thumb_func_start sub_8053050
sub_8053050: @ 8053390
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _080533B8 @ =0x0000082b
	bl FlagReset
	ldr r0, _080533BC @ =0x0000082d
	bl FlagReset
	ldr r0, _080533C0 @ =0x0000082c
	bl FlagReset
	ldr r0, _080533C4 @ =0x00000829
	bl FlagReset
	ldr r0, _080533C8 @ =0x00000828
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080533B8: .4byte 0x0000082b
_080533BC: .4byte 0x0000082d
_080533C0: .4byte 0x0000082c
_080533C4: .4byte 0x00000829
_080533C8: .4byte 0x00000828
	thumb_func_end sub_8053050

	thumb_func_start sub_805308C
sub_805308C: @ 80533CC
	push {lr}
	ldr r0, _080533E8 @ =0x0000082c
	bl FlagReset
	bl sub_8054164
	bl ResetCyclingRoadChallengeData
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134348
	pop {r0}
	bx r0
	.align 2, 0
_080533E8: .4byte 0x0000082c
	thumb_func_end sub_805308C

	thumb_func_start sub_80530AC
sub_80530AC: @ 80533EC
	push {lr}
	ldr r0, _08053408 @ =gSaveBlock1
	movs r2, 0
	movs r1, 0x31
	ldr r3, _0805340C @ =0x00001604
	adds r0, r3
_080533F8:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080533F8
	pop {r0}
	bx r0
	.align 2, 0
_08053408: .4byte gSaveBlock1
_0805340C: .4byte 0x00001604
	thumb_func_end sub_80530AC

	thumb_func_start sav12_xor_increment
sav12_xor_increment: @ 8053410
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _08053440
	ldr r0, _08053434 @ =gSaveBlock1
	lsls r1, 2
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2
	adds r1, r0
	ldr r2, [r1]
	ldr r0, _08053438 @ =0x00fffffe
	cmp r2, r0
	bhi _0805343C
	adds r0, r2, 0x1
	b _0805343E
	.align 2, 0
_08053434: .4byte gSaveBlock1
_08053438: .4byte 0x00fffffe
_0805343C:
	ldr r0, _08053444 @ =0x00ffffff
_0805343E:
	str r0, [r1]
_08053440:
	pop {r0}
	bx r0
	.align 2, 0
_08053444: .4byte 0x00ffffff
	thumb_func_end sav12_xor_increment

	thumb_func_start sub_8053108
sub_8053108: @ 8053448
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _08053468
	ldr r0, _08053464 @ =gSaveBlock1
	lsls r1, 2
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2
	adds r1, r0
	ldr r0, [r1]
	b _0805346A
	.align 2, 0
_08053464: .4byte gSaveBlock1
_08053468:
	movs r0, 0
_0805346A:
	pop {r1}
	bx r1
	thumb_func_end sub_8053108

	thumb_func_start sav12_xor_set
sav12_xor_set: @ 8053470
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _0805348A
	ldr r0, _08053490 @ =gSaveBlock1
	lsls r1, 2
	movs r3, 0xAA
	lsls r3, 5
	adds r0, r3
	adds r1, r0
	str r2, [r1]
_0805348A:
	pop {r0}
	bx r0
	.align 2, 0
_08053490: .4byte gSaveBlock1
	thumb_func_end sav12_xor_set

	thumb_func_start sub_8053154
sub_8053154: @ 8053494
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r4, _080534CC @ =0x02026354
	ldr r2, _080534D0 @ =0x05000180
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _080534D4 @ =gMapHeader
	ldr r1, [r0, 0x4]
	ldr r0, [r1, 0x4]
	ldrb r1, [r1]
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 1
	movs r1, 0x80
	lsls r1, 19
	orrs r2, r1
	adds r1, r4, 0
	bl CpuSet
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080534CC: .4byte 0x02026354
_080534D0: .4byte 0x05000180
_080534D4: .4byte gMapHeader
	thumb_func_end sub_8053154

	thumb_func_start sub_8053198
sub_8053198: @ 80534D8
	push {lr}
	ldr r0, _080534F8 @ =gMapHeader
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x4]
	ldr r3, _080534FC @ =0x02026354
	movs r2, 0x3F
_080534E4:
	ldr r0, [r1, 0x10]
	str r0, [r3, 0x10]
	adds r1, 0x18
	adds r3, 0x18
	subs r2, 0x1
	cmp r2, 0
	bge _080534E4
	pop {r0}
	bx r0
	.align 2, 0
_080534F8: .4byte gMapHeader
_080534FC: .4byte 0x02026354
	thumb_func_end sub_8053198

	thumb_func_start update_saveblock1_field_object_coords
update_saveblock1_field_object_coords: @ 8053500
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r3, _08053520 @ =0x02026354
_08053512:
	ldrb r0, [r3]
	cmp r0, r5
	bne _08053524
	strh r4, [r3, 0x4]
	strh r2, [r3, 0x6]
	b _0805352C
	.align 2, 0
_08053520: .4byte 0x02026354
_08053524:
	adds r3, 0x18
	adds r1, 0x1
	cmp r1, 0x3F
	ble _08053512
_0805352C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end update_saveblock1_field_object_coords

	thumb_func_start update_saveblock1_field_object_movement_behavior
update_saveblock1_field_object_movement_behavior: @ 8053534
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	ldr r2, _0805354C @ =0x02026354
_08053542:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08053550
	strb r1, [r2, 0x9]
	b _08053558
	.align 2, 0
_0805354C: .4byte 0x02026354
_08053550:
	adds r2, 0x18
	adds r3, 0x1
	cmp r3, 0x3F
	ble _08053542
_08053558:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end update_saveblock1_field_object_movement_behavior

	thumb_func_start mapdata_load_assets_to_gpu_and_full_redraw
mapdata_load_assets_to_gpu_and_full_redraw: @ 8053560
	push {r4,lr}
	bl move_tilemap_camera_to_upper_left_corner
	ldr r4, _08053584 @ =gMapHeader
	ldr r0, [r4]
	bl copy_map_tileset1_tileset2_to_vram
	ldr r0, [r4]
	bl apply_map_tileset1_tileset2_palette
	bl DrawWholeMapView
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053584: .4byte gMapHeader
	thumb_func_end mapdata_load_assets_to_gpu_and_full_redraw

	thumb_func_start get_mapdata_header
get_mapdata_header: @ 8053588
	push {lr}
	ldr r0, _08053598 @ =gSaveBlock1
	ldrh r1, [r0, 0x32]
	cmp r1, 0
	bne _0805359C
	movs r0, 0
	b _080535A6
	.align 2, 0
_08053598: .4byte gSaveBlock1
_0805359C:
	ldr r0, _080535AC @ =gMapAttributes
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_080535A6:
	pop {r1}
	bx r1
	.align 2, 0
_080535AC: .4byte gMapAttributes
	thumb_func_end get_mapdata_header

	thumb_func_start warp_shift
warp_shift: @ 80535B0
	ldr r2, _080535DC @ =gUnknown_020297F0
	ldr r3, _080535E0 @ =gSaveBlock1
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080535E4 @ =gUnknown_020297F8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r3, 0x4]
	str r1, [r3, 0x8]
	ldr r2, _080535E8 @ =gUnknown_02029800
	ldr r0, _080535EC @ =gDummyWarpData
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r2, _080535F0 @ =gUnknown_02029808
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080535DC: .4byte gUnknown_020297F0
_080535E0: .4byte gSaveBlock1
_080535E4: .4byte gUnknown_020297F8
_080535E8: .4byte gUnknown_02029800
_080535EC: .4byte gDummyWarpData
_080535F0: .4byte gUnknown_02029808
	thumb_func_end warp_shift

	thumb_func_start warp_set
warp_set: @ 80535F4
	push {r4,r5,lr}
	ldr r4, [sp, 0xC]
	ldr r5, [sp, 0x10]
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r3, [r0, 0x2]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r0, 0x4]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r0, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end warp_set

	thumb_func_start warp_data_is_not_neg_1
warp_data_is_not_neg_1: @ 8053614
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08053648
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08053648
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	cmp r2, r0
	bne _08053648
	movs r0, 0x4
	ldrsh r3, [r1, r0]
	cmp r3, r2
	bne _08053648
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bne _08053648
	movs r0, 0x1
	b _0805364A
_08053648:
	movs r0, 0
_0805364A:
	pop {r1}
	bx r1
	thumb_func_end warp_data_is_not_neg_1

	thumb_func_start get_mapheader_by_bank_and_number
get_mapheader_by_bank_and_number: @ 8053650
	lsls r0, 16
	lsls r1, 16
	ldr r2, _08053664 @ =gMapGroups
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08053664: .4byte gMapGroups
	thumb_func_end get_mapheader_by_bank_and_number

	thumb_func_start warp1_get_mapheader
warp1_get_mapheader: @ 8053668
	push {lr}
	ldr r1, _08053688 @ =gUnknown_020297F8
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	pop {r1}
	bx r1
	.align 2, 0
_08053688: .4byte gUnknown_020297F8
	thumb_func_end warp1_get_mapheader

	thumb_func_start set_current_map_header_from_sav1_save_old_name
set_current_map_header_from_sav1_save_old_name: @ 805368C
	push {r4-r6,lr}
	ldr r5, _080536C4 @ =gMapHeader
	ldr r4, _080536C8 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r5, 0
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldrh r0, [r5, 0x12]
	strh r0, [r4, 0x32]
	bl get_mapdata_header
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080536C4: .4byte gMapHeader
_080536C8: .4byte gSaveBlock1
	thumb_func_end set_current_map_header_from_sav1_save_old_name

	thumb_func_start sub_805338C
sub_805338C: @ 80536CC
	push {r4,r5,lr}
	ldr r4, _08053704 @ =gMapHeader
	ldr r1, _08053708 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r4, 0
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	bl get_mapdata_header
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053704: .4byte gMapHeader
_08053708: .4byte gSaveBlock1
	thumb_func_end sub_805338C

	thumb_func_start sub_80533CC
sub_80533CC: @ 805370C
	push {r4,lr}
	ldr r0, _0805373C @ =gSaveBlock1
	movs r1, 0x6
	ldrsb r1, [r0, r1]
	adds r3, r0, 0
	cmp r1, 0
	blt _08053744
	movs r1, 0x6
	ldrsb r1, [r3, r1]
	ldr r0, _08053740 @ =gMapHeader
	ldr r2, [r0, 0x4]
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bge _08053744
	ldr r0, [r2, 0x8]
	lsls r1, 3
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r3]
	ldr r0, [r2, 0x8]
	adds r1, r0
	ldrh r0, [r1, 0x2]
	b _08053774
	.align 2, 0
_0805373C: .4byte gSaveBlock1
_08053740: .4byte gMapHeader
_08053744:
	ldrh r2, [r3, 0x8]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	blt _0805375E
	ldrh r1, [r3, 0xA]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	cmp r0, 0
	blt _0805375E
	strh r2, [r3]
	strh r1, [r3, 0x2]
	b _08053776
_0805375E:
	ldr r0, _0805377C @ =gMapHeader
	ldr r2, [r0]
	ldr r0, [r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r3]
	ldr r0, [r2, 0x4]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
_08053774:
	strh r0, [r3, 0x2]
_08053776:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805377C: .4byte gMapHeader
	thumb_func_end sub_80533CC

	thumb_func_start warp_in
warp_in: @ 8053780
	push {lr}
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_80533CC
	pop {r0}
	bx r0
	thumb_func_end warp_in

	thumb_func_start warp1_set
warp1_set: @ 8053794
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080537CC @ =gUnknown_020297F8
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080537CC: .4byte gUnknown_020297F8
	thumb_func_end warp1_set

	thumb_func_start warp1_set_2
warp1_set_2: @ 80537D0
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	asrs r0, 24
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	bl warp1_set
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end warp1_set_2

	thumb_func_start saved_warp2_set
saved_warp2_set: @ 80537F0
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _08053828 @ =0x02025748
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	lsls r3, 24
	asrs r3, 24
	movs r4, 0x14
	negs r4, r4
	adds r4, r0
	mov r12, r4
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	mov r5, r12
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053828: .4byte 0x02025748
	thumb_func_end saved_warp2_set

	thumb_func_start saved_warp2_set_2
saved_warp2_set_2: @ 805382C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r0, _0805385C @ =0x02025748
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	lsls r3, 24
	asrs r3, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r5, 24
	asrs r5, 24
	str r5, [sp, 0x4]
	bl warp_set
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805385C: .4byte 0x02025748
	thumb_func_end saved_warp2_set_2

	thumb_func_start copy_saved_warp2_bank_and_enter_x_to_warp1
copy_saved_warp2_bank_and_enter_x_to_warp1: @ 8053860
	ldr r2, _08053870 @ =gUnknown_020297F8
	ldr r0, _08053874 @ =gSaveBlock1
	ldr r1, [r0, 0x18]
	ldr r0, [r0, 0x14]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053870: .4byte gUnknown_020297F8
_08053874: .4byte gSaveBlock1
	thumb_func_end copy_saved_warp2_bank_and_enter_x_to_warp1

	thumb_func_start sub_8053538
sub_8053538: @ 8053878
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocation
	adds r4, r0, 0
	cmp r4, 0
	beq _080538A6
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	movs r3, 0x2
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, 0x4]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_080538A6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053538

	thumb_func_start sub_8053570
sub_8053570: @ 80538B0
	ldr r2, _080538C0 @ =gUnknown_020297F8
	ldr r0, _080538C4 @ =gSaveBlock1
	ldr r1, [r0, 0x20]
	ldr r0, [r0, 0x1C]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080538C0: .4byte gUnknown_020297F8
_080538C4: .4byte gSaveBlock1
	thumb_func_end sub_8053570

	thumb_func_start sub_8053588
sub_8053588: @ 80538C8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocation
	adds r5, r0, 0
	cmp r5, 0
	beq _080538F8
	ldr r0, _08053900 @ =0x02025750
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	movs r3, 0x1
	negs r3, r3
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x4
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
_080538F8:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053900: .4byte 0x02025750
	thumb_func_end sub_8053588

	thumb_func_start sub_80535C4
sub_80535C4: @ 8053904
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08053974 @ =gUnknown_020297F8
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0805396A
	adds r0, r5, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805396A
	ldr r1, _08053978 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	subs r3, r6, 0x7
	lsls r3, 24
	asrs r3, 24
	subs r4, r7, 0x6
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl sub_805363C
_0805396A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053974: .4byte gUnknown_020297F8
_08053978: .4byte gSaveBlock1
	thumb_func_end sub_80535C4

	thumb_func_start sub_805363C
sub_805363C: @ 805397C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080539B4 @ =0x02025758
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080539B4: .4byte 0x02025758
	thumb_func_end sub_805363C

	thumb_func_start sub_8053678
sub_8053678: @ 80539B8
	ldr r2, _080539C8 @ =gUnknown_020297F8
	ldr r0, _080539CC @ =gSaveBlock1
	ldr r1, [r0, 0x28]
	ldr r0, [r0, 0x24]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080539C8: .4byte gUnknown_020297F8
_080539CC: .4byte gSaveBlock1
	thumb_func_end sub_8053678

	thumb_func_start sub_8053690
sub_8053690: @ 80539D0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08053A08 @ =gUnknown_02029800
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053A08: .4byte gUnknown_02029800
	thumb_func_end sub_8053690

	thumb_func_start warp1_set_to_warp2
warp1_set_to_warp2: @ 8053A0C
	ldr r2, _08053A1C @ =gUnknown_020297F8
	ldr r0, _08053A20 @ =gUnknown_02029800
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053A1C: .4byte gUnknown_020297F8
_08053A20: .4byte gUnknown_02029800
	thumb_func_end warp1_set_to_warp2

	thumb_func_start sub_80536E4
sub_80536E4: @ 8053A24
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08053A5C @ =gUnknown_02029808
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053A5C: .4byte gUnknown_02029808
	thumb_func_end sub_80536E4

	thumb_func_start sub_8053720
sub_8053720: @ 8053A60
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r4, _08053A88 @ =gUnknown_02029808
	adds r0, r4, 0
	bl warp_data_is_not_neg_1
	cmp r0, 0x1
	bne _08053A94
	ldr r2, _08053A8C @ =gUnknown_020297F8
	ldr r0, _08053A90 @ =gUnknown_020297F0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	b _08053AAE
	.align 2, 0
_08053A88: .4byte gUnknown_02029808
_08053A8C: .4byte gUnknown_020297F8
_08053A90: .4byte gUnknown_020297F0
_08053A94:
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	lsls r3, r5, 24
	asrs r3, 24
	lsls r4, r6, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_08053AAE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8053720

	thumb_func_start sub_8053778
sub_8053778: @ 8053AB8
	ldr r2, _08053AC8 @ =gUnknown_020297F8
	ldr r0, _08053ACC @ =gSaveBlock1
	ldr r1, [r0, 0x10]
	ldr r0, [r0, 0xC]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053AC8: .4byte gUnknown_020297F8
_08053ACC: .4byte gSaveBlock1
	thumb_func_end sub_8053778

	thumb_func_start unref_sub_8053790
unref_sub_8053790: @ 8053AD0
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08053B08 @ =0x02025740
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053B08: .4byte 0x02025740
	thumb_func_end unref_sub_8053790

	thumb_func_start sub_80537CC
sub_80537CC: @ 8053B0C
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocation
	adds r5, r0, 0
	cmp r5, 0
	beq _08053B3C
	ldr r0, _08053B44 @ =0x02025740
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	movs r3, 0x1
	negs r3, r3
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x4
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
_08053B3C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053B44: .4byte 0x02025740
	thumb_func_end sub_80537CC

	thumb_func_start gpu_sync_bg_hide
gpu_sync_bg_hide: @ 8053B48
	ldr r2, _08053B54 @ =gSaveBlock1
	ldr r0, [r2, 0x14]
	ldr r1, [r2, 0x18]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	bx lr
	.align 2, 0
_08053B54: .4byte gSaveBlock1
	thumb_func_end gpu_sync_bg_hide

	thumb_func_start sub_8053818
sub_8053818: @ 8053B58
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08053B6C @ =gMapHeader
	ldr r0, [r0, 0xC]
	ldr r3, [r0]
	ldr r1, [r0, 0x4]
	cmp r1, 0
	bne _08053B74
	b _08053B88
	.align 2, 0
_08053B6C: .4byte gMapHeader
_08053B70:
	adds r0, r1, 0
	b _08053B8A
_08053B74:
	movs r2, 0
	cmp r2, r3
	bge _08053B88
_08053B7A:
	ldrb r0, [r1]
	cmp r0, r4
	beq _08053B70
	adds r2, 0x1
	adds r1, 0xC
	cmp r2, r3
	blt _08053B7A
_08053B88:
	movs r0, 0
_08053B8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053818

	thumb_func_start sub_8053850
sub_8053850: @ 8053B90
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	bl sub_8053818
	adds r1, r0, 0
	cmp r1, 0
	beq _08053BC8
	movs r0, 0x8
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x9]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	lsls r3, r4, 24
	asrs r3, 24
	lsls r4, r5, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
	b _08053BE4
_08053BC8:
	bl mapheader_run_script_with_tag_x6
	ldr r0, _08053BDC @ =gUnknown_02029800
	bl warp_data_is_not_neg_1
	cmp r0, 0
	beq _08053BE0
	movs r0, 0
	b _08053BE6
	.align 2, 0
_08053BDC: .4byte gUnknown_02029800
_08053BE0:
	bl warp1_set_to_warp2
_08053BE4:
	movs r0, 0x1
_08053BE6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8053850

	thumb_func_start sub_80538B0
sub_80538B0: @ 8053BF0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x6
	adds r1, r3, 0
	bl sub_8053850
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80538B0

	thumb_func_start sub_80538D0
sub_80538D0: @ 8053C10
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x5
	adds r1, r3, 0
	bl sub_8053850
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80538D0

	thumb_func_start sub_80538F0
sub_80538F0: @ 8053C30
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	asrs r0, 24
	lsrs r4, r1, 24
	asrs r1, 24
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	adds r2, r3, 0
	bl warp1_set
	bl sub_8053F0C
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8053154
	bl sub_806906C
	bl ResetCyclingRoadChallengeData
	bl prev_quest_postbuffer_cursor_backup_reset
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8082BD0
	bl DoTimeBasedEvents
	bl sub_80806E4
	bl sub_8054164
	bl sub_8053C98
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl not_trainer_hill_battle_pyramid
	ldr r4, _08053CD0 @ =gMapHeader
	ldr r0, [r4]
	bl sub_8056D38
	ldr r0, [r4]
	bl apply_map_tileset2_palette
	movs r4, 0x6
_08053C9C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D874
	adds r4, 0x1
	cmp r4, 0xB
	ble _08053C9C
	bl sub_8072ED0
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134394
	bl sub_808073C
	bl wild_encounter_reset_coro_args
	bl mapheader_run_script_with_tag_x5
	bl AddMapNamePopUpWindowTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053CD0: .4byte gMapHeader
	thumb_func_end sub_80538F0

	thumb_func_start sub_8053994
sub_8053994: @ 8053CD4
	push {r4-r6,lr}
	adds r6, r0, 0
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8053154
	ldr r4, _08053D6C @ =gMapHeader
	ldrb r0, [r4, 0x17]
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806906C
	bl ResetCyclingRoadChallengeData
	bl prev_quest_postbuffer_cursor_backup_reset
	ldr r1, _08053D70 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082BD0
	cmp r6, 0x1
	beq _08053D22
	bl DoTimeBasedEvents
_08053D22:
	bl sub_80806E4
	bl sub_8054164
	cmp r5, 0
	beq _08053D34
	ldr r0, _08053D74 @ =0x00000828
	bl FlagReset
_08053D34:
	bl sub_8053C98
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134348
	bl not_trainer_hill_battle_pyramid
	cmp r6, 0x1
	beq _08053D64
	cmp r4, 0
	beq _08053D64
	ldr r1, _08053D78 @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	bl UpdateTVScreensOnMap
	movs r0, 0x1
	bl sub_80BBCCC
_08053D64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053D6C: .4byte gMapHeader
_08053D70: .4byte gSaveBlock1
_08053D74: .4byte 0x00000828
_08053D78: .4byte gUnknown_03004870
	thumb_func_end sub_8053994

	thumb_func_start player_avatar_init_params_reset
player_avatar_init_params_reset: @ 8053D7C
	ldr r1, _08053D88 @ =gUnknown_02029810
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08053D88: .4byte gUnknown_02029810
	thumb_func_end player_avatar_init_params_reset

	thumb_func_start walkrun_find_lowest_active_bit_in_bitfield
walkrun_find_lowest_active_bit_in_bitfield: @ 8053D8C
	push {r4,lr}
	bl player_get_direction_lower_nybble
	ldr r4, _08053DA8 @ =gUnknown_02029810
	strb r0, [r4, 0x1]
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053DAC
	movs r0, 0x2
	b _08053DDE
	.align 2, 0
_08053DA8: .4byte gUnknown_02029810
_08053DAC:
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053DBC
	movs r0, 0x4
	b _08053DDE
_08053DBC:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053DCC
	movs r0, 0x8
	b _08053DDE
_08053DCC:
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053DDC
	movs r0, 0x10
	b _08053DDE
_08053DDC:
	movs r0, 0x1
_08053DDE:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end walkrun_find_lowest_active_bit_in_bitfield

	thumb_func_start sub_8053AA8
sub_8053AA8: @ 8053DE8
	push {r4-r7,lr}
	bl sav1_map_get_light_level
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl cur_mapdata_block_role_at_screen_center_acc_to_sav1
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _08053E34 @ =gUnknown_02029810
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8053B00
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08053E38 @ =0xffffff00
	ands r7, r0
	orrs r7, r1
	adds r0, r6, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_8053B60
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _08053E3C @ =0xffff00ff
	ands r7, r1
	orrs r7, r0
	str r7, [r6]
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08053E34: .4byte gUnknown_02029810
_08053E38: .4byte 0xffffff00
_08053E3C: .4byte 0xffff00ff
	thumb_func_end sub_8053AA8

	thumb_func_start sub_8053B00
sub_8053B00: @ 8053E40
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x8
	beq _08053E5C
	ldr r0, _08053E64 @ =0x0000082d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08053E96
_08053E5C:
	cmp r4, 0x5
	bne _08053E68
	movs r0, 0x10
	b _08053E98
	.align 2, 0
_08053E64: .4byte 0x0000082d
_08053E68:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053E7C
	movs r0, 0x8
	b _08053E98
_08053E7C:
	bl sub_8053C44
	cmp r0, 0x1
	bne _08053E96
	ldrb r0, [r6]
	cmp r0, 0x2
	bne _08053E8E
	movs r0, 0x2
	b _08053E98
_08053E8E:
	cmp r0, 0x4
	bne _08053E96
	movs r0, 0x4
	b _08053E98
_08053E96:
	movs r0, 0x1
_08053E98:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8053B00

	thumb_func_start sub_8053B60
sub_8053B60: @ 8053EA0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _08053F00 @ =0x0000082d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053EC0
	cmp r5, 0x6
	beq _08053F20
_08053EC0:
	lsls r4, 24
	lsrs r5, r4, 24
	adds r0, r5, 0
	bl sub_8056F24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053EFC
	adds r0, r5, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053F56
	adds r0, r5, 0
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053F56
	adds r0, r5, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053F04
_08053EFC:
	movs r0, 0x2
	b _08053F5C
	.align 2, 0
_08053F00: .4byte 0x0000082d
_08053F04:
	adds r0, r5, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053F56
	adds r0, r5, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053F24
_08053F20:
	movs r0, 0x4
	b _08053F5C
_08053F24:
	adds r0, r5, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053F36
	movs r0, 0x3
	b _08053F5C
_08053F36:
	ldrb r0, [r6]
	cmp r0, 0x10
	bne _08053F40
	cmp r7, 0x8
	beq _08053F5A
_08053F40:
	cmp r0, 0x8
	bne _08053F48
	cmp r7, 0x10
	beq _08053F5A
_08053F48:
	lsrs r0, r4, 24
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053F5A
_08053F56:
	movs r0, 0x1
	b _08053F5C
_08053F5A:
	ldrb r0, [r6, 0x1]
_08053F5C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8053B60

	thumb_func_start cur_mapdata_block_role_at_screen_center_acc_to_sav1
cur_mapdata_block_role_at_screen_center_acc_to_sav1: @ 8053F64
	push {lr}
	ldr r1, _08053F80 @ =gSaveBlock1
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x7
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	adds r1, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08053F80: .4byte gSaveBlock1
	thumb_func_end cur_mapdata_block_role_at_screen_center_acc_to_sav1

	thumb_func_start sub_8053C44
sub_8053C44: @ 8053F84
	push {lr}
	ldr r0, _08053FC0 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	adds r2, r0, 0
	cmp r1, 0x1D
	bne _08053F9E
	ldrb r0, [r2, 0x5]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08053FBC
_08053F9E:
	ldr r0, _08053FC4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	beq _08053FD0
	cmp r0, 0x9
	beq _08053FD0
	cmp r0, 0x5
	beq _08053FD0
	ldrh r1, [r2, 0x4]
	ldr r0, _08053FC8 @ =0x00002418
	cmp r1, r0
	beq _08053FD0
	ldr r0, _08053FCC @ =0x00002a18
	cmp r1, r0
	beq _08053FD0
_08053FBC:
	movs r0, 0x1
	b _08053FD2
	.align 2, 0
_08053FC0: .4byte gSaveBlock1
_08053FC4: .4byte gMapHeader
_08053FC8: .4byte 0x00002418
_08053FCC: .4byte 0x00002a18
_08053FD0:
	movs r0, 0
_08053FD2:
	pop {r1}
	bx r1
	thumb_func_end sub_8053C44

	thumb_func_start sub_8053C98
sub_8053C98: @ 8053FD8
	push {lr}
	ldr r0, _08053FE8 @ =gMapHeader
	ldrb r1, [r0, 0x15]
	cmp r1, 0
	bne _08053FF0
	ldr r0, _08053FEC @ =gSaveBlock1
	b _08054012
	.align 2, 0
_08053FE8: .4byte gMapHeader
_08053FEC: .4byte gSaveBlock1
_08053FF0:
	ldr r0, _08054004 @ =0x00000828
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805400C
	ldr r0, _08054008 @ =gSaveBlock1
	adds r0, 0x30
	movs r1, 0x1
	b _08054014
	.align 2, 0
_08054004: .4byte 0x00000828
_08054008: .4byte gSaveBlock1
_0805400C:
	ldr r0, _0805401C @ =gSaveBlock1
	ldr r1, _08054020 @ =gUnknown_0839ACE8
	ldr r1, [r1]
_08054012:
	adds r0, 0x30
_08054014:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0805401C: .4byte gSaveBlock1
_08054020: .4byte gUnknown_0839ACE8
	thumb_func_end sub_8053C98

	thumb_func_start sub_8053CE4
sub_8053CE4: @ 8054024
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	blt _08054034
	ldr r0, _08054040 @ =gUnknown_0839ACE8
	ldr r0, [r0]
	cmp r1, r0
	ble _08054036
_08054034:
	movs r1, 0
_08054036:
	ldr r0, _08054044 @ =gSaveBlock1
	adds r0, 0x30
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08054040: .4byte gUnknown_0839ACE8
_08054044: .4byte gSaveBlock1
	thumb_func_end sub_8053CE4

	thumb_func_start sav1_get_flash_used_on_map
sav1_get_flash_used_on_map: @ 8054048
	ldr r0, _08054050 @ =gSaveBlock1
	adds r0, 0x30
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08054050: .4byte gSaveBlock1
	thumb_func_end sav1_get_flash_used_on_map

	thumb_func_start sub_8053D14
sub_8053D14: @ 8054054
	push {lr}
	ldr r1, _08054068 @ =gSaveBlock1
	strh r0, [r1, 0x32]
	bl get_mapdata_header
	ldr r1, _0805406C @ =gMapHeader
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08054068: .4byte gSaveBlock1
_0805406C: .4byte gMapHeader
	thumb_func_end sub_8053D14

	thumb_func_start sub_8053D30
sub_8053D30: @ 8054070
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080540A0 @ =0x0000082a
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080540A4
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _080540A4
	movs r0, 0x1
	ldrsb r0, [r4, r0]
	cmp r0, 0x5
	blt _080540A4
	cmp r0, 0x8
	ble _0805409C
	cmp r0, 0x2B
	bgt _080540A4
	cmp r0, 0x27
	blt _080540A4
_0805409C:
	movs r0, 0x1
	b _080540A6
	.align 2, 0
_080540A0: .4byte 0x0000082a
_080540A4:
	movs r0, 0
_080540A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D30

	thumb_func_start sub_8053D6C
sub_8053D6C: @ 80540AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080540D0 @ =0x000040b3
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080540CA
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x20
	bne _080540CA
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bls _080540D4
_080540CA:
	movs r0, 0
	b _080540D6
	.align 2, 0
_080540D0: .4byte 0x000040b3
_080540D4:
	movs r0, 0x1
_080540D6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D6C

	thumb_func_start sub_8053D9C
sub_8053D9C: @ 80540DC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8053D30
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _080540F2
	movs r0, 0xDE
	lsls r0, 1
	b _0805411C
_080540F2:
	adds r0, r4, 0
	bl sub_8053D6C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08054118
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrh r0, [r0, 0x10]
	b _0805411C
_08054118:
	movs r0, 0xCB
	lsls r0, 1
_0805411C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D9C

	thumb_func_start sav1_map_get_music
sav1_map_get_music: @ 8054124
	push {r4,lr}
	ldr r0, _08054144 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0xD0
	lsls r0, 5
	cmp r1, r0
	bne _0805414C
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _0805414C
	ldr r0, _08054148 @ =0x00000199
	b _08054180
	.align 2, 0
_08054144: .4byte gSaveBlock1
_08054148: .4byte 0x00000199
_0805414C:
	ldr r4, _08054164 @ =0x02025738
	adds r0, r4, 0
	bl sub_8053D9C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08054168 @ =0x00007fff
	cmp r1, r0
	beq _0805416C
	adds r0, r1, 0
	b _08054180
	.align 2, 0
_08054164: .4byte 0x02025738
_08054168: .4byte 0x00007fff
_0805416C:
	subs r0, r4, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x17
	ble _0805417C
	movs r0, 0xC9
	lsls r0, 1
	b _08054180
_0805417C:
	movs r0, 0xB4
	lsls r0, 1
_08054180:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sav1_map_get_music

	thumb_func_start warp1_target_get_music
warp1_target_get_music: @ 8054188
	push {lr}
	ldr r0, _080541A0 @ =gUnknown_020297F8
	bl sub_8053D9C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080541A4 @ =0x00007fff
	cmp r1, r0
	beq _080541A8
	adds r0, r1, 0
	b _080541C0
	.align 2, 0
_080541A0: .4byte gUnknown_020297F8
_080541A4: .4byte 0x00007fff
_080541A8:
	ldr r0, _080541B8 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 2
	cmp r1, r0
	beq _080541BC
	subs r0, 0x6E
	b _080541C0
	.align 2, 0
_080541B8: .4byte gSaveBlock1
_080541BC:
	movs r0, 0xB4
	lsls r0, 1
_080541C0:
	pop {r1}
	bx r1
	thumb_func_end warp1_target_get_music

	thumb_func_start call_map_music_set_to_zero
call_map_music_set_to_zero: @ 80541C4
	push {lr}
	bl ResetMapMusic
	pop {r0}
	bx r0
	thumb_func_end call_map_music_set_to_zero

	thumb_func_start sub_8053E90
sub_8053E90: @ 80541D0
	push {r4,lr}
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xDE
	lsls r0, 1
	cmp r4, r0
	beq _08054216
	ldr r1, _080541F0 @ =gSaveBlock1
	ldrh r0, [r1, 0x2C]
	cmp r0, 0
	beq _080541F4
	adds r4, r0, 0
	b _08054216
	.align 2, 0
_080541F0: .4byte gSaveBlock1
_080541F4:
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _08054208
	ldr r4, _08054204 @ =0x0000019b
	b _08054216
	.align 2, 0
_08054204: .4byte 0x0000019b
_08054208:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08054216
	ldr r4, _08054230 @ =0x0000016d
_08054216:
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08054228
	adds r0, r4, 0
	bl PlayNewMapMusic
_08054228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054230: .4byte 0x0000016d
	thumb_func_end sub_8053E90

	thumb_func_start sav1_set_battle_music_maybe
sav1_set_battle_music_maybe: @ 8054234
	ldr r1, _0805423C @ =gSaveBlock1
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_0805423C: .4byte gSaveBlock1
	thumb_func_end sav1_set_battle_music_maybe

	thumb_func_start sav1_reset_battle_music_maybe
sav1_reset_battle_music_maybe: @ 8054240
	ldr r1, _08054248 @ =gSaveBlock1
	movs r0, 0
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08054248: .4byte gSaveBlock1
	thumb_func_end sav1_reset_battle_music_maybe

	thumb_func_start sub_8053F0C
sub_8053F0C: @ 805424C
	push {r4-r6,lr}
	ldr r0, _080542AC @ =0x00004001
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080542BC
	bl warp1_target_get_music
	lsls r0, 16
	lsrs r5, r0, 16
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xDE
	lsls r0, 1
	cmp r5, r0
	beq _0805428E
	subs r0, 0x21
	cmp r4, r0
	beq _080542BC
	ldr r6, _080542B0 @ =0x0000016d
	cmp r4, r6
	beq _080542BC
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805428E
	adds r5, r6, 0
_0805428E:
	cmp r5, r4
	beq _080542BC
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080542B4
	adds r0, r5, 0
	movs r1, 0x4
	movs r2, 0x4
	bl FadeOutAndFadeInNewMapMusic
	b _080542BC
	.align 2, 0
_080542AC: .4byte 0x00004001
_080542B0: .4byte 0x0000016d
_080542B4:
	adds r0, r5, 0
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_080542BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8053F0C

	thumb_func_start sub_8053F84
sub_8053F84: @ 80542C4
	push {r4,lr}
	bl GetCurrentMapMusic
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _080542EA
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_080542EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053F84

	thumb_func_start sub_8053FB0
sub_8053FB0: @ 80542F0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	beq _08054312
	movs r0, 0xDE
	lsls r0, 1
	cmp r1, r0
	beq _08054312
	adds r0, r4, 0
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08054312:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053FB0

	thumb_func_start is_warp1_light_level_8_or_9
is_warp1_light_level_8_or_9: @ 8054318
	push {lr}
	bl warp1_get_mapheader
	ldrb r0, [r0, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08054330
	movs r0, 0x4
	b _08054332
_08054330:
	movs r0, 0x2
_08054332:
	pop {r1}
	bx r1
	thumb_func_end is_warp1_light_level_8_or_9

	thumb_func_start sub_8053FF8
sub_8053FF8: @ 8054338
	push {r4,lr}
	bl warp1_target_get_music
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08054370 @ =0x00004001
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08054368
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08054368
	bl is_warp1_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	bl FadeOutMapMusic
_08054368:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054370: .4byte 0x00004001
	thumb_func_end sub_8053FF8

	thumb_func_start sub_8054034
sub_8054034: @ 8054374
	push {lr}
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8054034

	thumb_func_start sub_8054044
sub_8054044: @ 8054384
	push {lr}
	movs r0, 0x4
	bl FadeOutMapMusic
	pop {r0}
	bx r0
	thumb_func_end sub_8054044

	thumb_func_start sub_8054050
sub_8054050: @ 8054390
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r0, _08054408 @ =gUnknown_02029816
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080543C4
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _08054400
_080543C4:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x58
	bl __umodsi3
	adds r4, r0, 0
	adds r4, 0xD4
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r2, r0, 0
	adds r2, 0x32
	ldr r0, _0805440C @ =gUnknown_02029814
	ldrh r0, [r0]
	lsls r4, 24
	asrs r4, 24
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	movs r3, 0x1
	bl PlayCry2
_08054400:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054408: .4byte gUnknown_02029816
_0805440C: .4byte gUnknown_02029814
	thumb_func_end sub_8054050

	thumb_func_start sub_80540D0
sub_80540D0: @ 8054410
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x4
	bhi _0805449E
	lsls r0, 2
	ldr r1, _08054428 @ =_0805442C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054428: .4byte _0805442C
	.align 2, 0
_0805442C:
	.4byte _08054440
	.4byte _08054454
	.4byte _08054470
	.4byte _0805448A
	.4byte _0805449E
_08054440:
	ldr r0, _0805444C @ =gUnknown_02029814
	ldrh r0, [r0]
	cmp r0, 0
	bne _08054450
	movs r0, 0x4
	b _0805449C
	.align 2, 0
_0805444C: .4byte gUnknown_02029814
_08054450:
	movs r0, 0x1
	b _0805449C
_08054454:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x96
	lsls r1, 4
	bl __umodsi3
	movs r1, 0x96
	lsls r1, 3
	adds r0, r1
	strh r0, [r5]
	movs r0, 0x3
	b _0805449C
_08054470:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x96
	lsls r4, 3
	adds r1, r4, 0
	bl __umodsi3
	adds r0, r4
	strh r0, [r5]
	movs r0, 0x3
	b _0805449C
_0805448A:
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _0805449E
	bl sub_8054050
	movs r0, 0x2
_0805449C:
	strh r0, [r6]
_0805449E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80540D0

	thumb_func_start sub_8054164
sub_8054164: @ 80544A4
	push {lr}
	ldr r0, _080544C8 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0xB4
	lsls r0, 6
	cmp r1, r0
	bne _080544D0
	bl sub_810D32C
	lsls r0, 24
	cmp r0, 0
	bne _080544D0
	ldr r1, _080544CC @ =gUnknown_02029816
	movs r0, 0x1
	strb r0, [r1]
	bl GetMirageIslandMon
	b _080544D6
	.align 2, 0
_080544C8: .4byte gSaveBlock1
_080544CC: .4byte gUnknown_02029816
_080544D0:
	ldr r0, _080544E0 @ =gUnknown_02029816
	bl GetLocalWildMon
_080544D6:
	ldr r1, _080544E4 @ =gUnknown_02029814
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080544E0: .4byte gUnknown_02029816
_080544E4: .4byte gUnknown_02029814
	thumb_func_end sub_8054164

	thumb_func_start get_map_light_level_by_bank_and_number
get_map_light_level_by_bank_and_number: @ 80544E8
	push {lr}
	lsls r0, 24
	asrs r0, 8
	lsrs r0, 16
	lsls r1, 24
	asrs r1, 8
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x17]
	pop {r1}
	bx r1
	thumb_func_end get_map_light_level_by_bank_and_number

	thumb_func_start get_map_light_level_from_warp
get_map_light_level_from_warp: @ 8054500
	push {lr}
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	adds r0, r2, 0
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end get_map_light_level_from_warp

	thumb_func_start sav1_map_get_light_level
sav1_map_get_light_level: @ 8054518
	push {lr}
	ldr r0, _08054528 @ =0x02025738
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08054528: .4byte 0x02025738
	thumb_func_end sav1_map_get_light_level

	thumb_func_start get_map_light_from_warp0
get_map_light_from_warp0: @ 805452C
	push {lr}
	ldr r0, _0805453C @ =gUnknown_020297F0
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805453C: .4byte gUnknown_020297F0
	thumb_func_end get_map_light_from_warp0

	thumb_func_start is_light_level_1_2_3_5_or_6
is_light_level_1_2_3_5_or_6: @ 8054540
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0805455A
	cmp r0, 0x1
	beq _0805455A
	cmp r0, 0x5
	beq _0805455A
	cmp r0, 0x2
	beq _0805455A
	cmp r0, 0x6
	bne _0805455E
_0805455A:
	movs r0, 0x1
	b _08054560
_0805455E:
	movs r0, 0
_08054560:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_5_or_6

	thumb_func_start is_light_level_1_2_3_or_6
is_light_level_1_2_3_or_6: @ 8054564
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0805457A
	cmp r0, 0x1
	beq _0805457A
	cmp r0, 0x6
	beq _0805457A
	cmp r0, 0x2
	bne _0805457E
_0805457A:
	movs r0, 0x1
	b _08054580
_0805457E:
	movs r0, 0
_08054580:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_or_6

	thumb_func_start is_light_level_8_or_9
is_light_level_8_or_9: @ 8054584
	push {lr}
	lsls r0, 24
	movs r1, 0xF8
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08054598
	movs r0, 0
	b _0805459A
_08054598:
	movs r0, 0x1
_0805459A:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_8_or_9

	thumb_func_start unref_sub_8054260
unref_sub_8054260: @ 80545A0
	push {lr}
	ldr r1, _080545C0 @ =gSaveBlock1
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x15]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_080545C0: .4byte gSaveBlock1
	thumb_func_end unref_sub_8054260

	thumb_func_start sav1_map_get_name
sav1_map_get_name: @ 80545C4
	push {lr}
	ldr r1, _080545E4 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_080545E4: .4byte gSaveBlock1
	thumb_func_end sav1_map_get_name

	thumb_func_start sav1_map_get_battletype
sav1_map_get_battletype: @ 80545E8
	push {lr}
	ldr r1, _08054608 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x1B]
	pop {r1}
	bx r1
	.align 2, 0
_08054608: .4byte gSaveBlock1
	thumb_func_end sav1_map_get_battletype

	thumb_func_start ResetSafariZoneFlag_
ResetSafariZoneFlag_: @ 805460C
	push {lr}
	bl ResetSafariZoneFlag
	pop {r0}
	bx r0
	thumb_func_end ResetSafariZoneFlag_

	thumb_func_start is_c1_link_related_active
is_c1_link_related_active: @ 8054618
	push {lr}
	ldr r0, _08054628 @ =gMain
	ldr r1, [r0]
	ldr r0, _0805462C @ =sub_8055354
	cmp r1, r0
	beq _08054630
	movs r0, 0
	b _08054632
	.align 2, 0
_08054628: .4byte gMain
_0805462C: .4byte sub_8055354
_08054630:
	movs r0, 0x1
_08054632:
	pop {r1}
	bx r1
	thumb_func_end is_c1_link_related_active

	thumb_func_start c1_overworld_normal
c1_overworld_normal: @ 8054638
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r4, r1, 0
	bl sub_8059204
	mov r6, sp
	mov r0, sp
	bl sub_8067EEC
	mov r0, sp
	adds r1, r5, 0
	adds r2, r4, 0
	bl process_overworld_input
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _08054686
	mov r0, sp
	bl sub_8068024
	cmp r0, 0x1
	bne _0805467C
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	b _08054686
_0805467C:
	ldrb r0, [r6, 0x2]
	adds r1, r5, 0
	adds r2, r4, 0
	bl player_step
_08054686:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end c1_overworld_normal

	thumb_func_start c1_overworld
c1_overworld: @ 8054690
	push {lr}
	ldr r2, _080546A8 @ =gMain
	ldr r1, [r2, 0x4]
	ldr r0, _080546AC @ =c2_overworld
	cmp r1, r0
	bne _080546A4
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x2C]
	bl c1_overworld_normal
_080546A4:
	pop {r0}
	bx r0
	.align 2, 0
_080546A8: .4byte gMain
_080546AC: .4byte c2_overworld
	thumb_func_end c1_overworld

	thumb_func_start c2_overworld_basic
c2_overworld_basic: @ 80546B0
	push {lr}
	bl ScriptContext2_RunScript
	bl RunTasks
	bl AnimateSprites
	bl CameraUpdate
	bl UpdateCameraPanning
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_8072EDC
	pop {r0}
	bx r0
	thumb_func_end c2_overworld_basic

	thumb_func_start sub_8054398
sub_8054398: @ 80546D8
	push {lr}
	bl c2_overworld_basic
	pop {r0}
	bx r0
	thumb_func_end sub_8054398

	thumb_func_start c2_overworld
c2_overworld: @ 80546E4
	push {r4,lr}
	ldr r0, _0805470C @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	adds r4, r0, 0
	cmp r4, 0
	beq _080546F8
	movs r0, 0
	bl SetVBlankCallback
_080546F8:
	bl c2_overworld_basic
	cmp r4, 0
	beq _08054704
	bl SetFieldVBlankCallback
_08054704:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805470C: .4byte gPaletteFade
	thumb_func_end c2_overworld

	thumb_func_start set_callback1
set_callback1: @ 8054710
	ldr r1, _08054718 @ =gMain
	str r0, [r1]
	bx lr
	.align 2, 0
_08054718: .4byte gMain
	thumb_func_end set_callback1

	thumb_func_start sub_80543DC
sub_80543DC: @ 805471C
	ldr r1, _08054724 @ =gUnknown_03000584
	str r0, [r1]
	bx lr
	.align 2, 0
_08054724: .4byte gUnknown_03000584
	thumb_func_end sub_80543DC

	thumb_func_start sub_80543E8
sub_80543E8: @ 8054728
	push {lr}
	ldr r0, _08054738 @ =gUnknown_0300485C
	ldr r0, [r0]
	cmp r0, 0
	beq _0805473C
	bl _call_via_r0
	b _08054740
	.align 2, 0
_08054738: .4byte gUnknown_0300485C
_0805473C:
	bl mapldr_default
_08054740:
	ldr r1, _0805474C @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805474C: .4byte gUnknown_0300485C
	thumb_func_end sub_80543E8

	thumb_func_start CB2_NewGame
CB2_NewGame: @ 8054750
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl ResetSafariZoneFlag_
	bl NewGameInitData
	bl player_avatar_init_params_reset
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _08054794 @ =gUnknown_0300485C
	ldr r0, _08054798 @ =ExecuteTruckSequence
	str r0, [r1]
	ldr r0, _0805479C @ =0x03001bac
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _080547A0 @ =c1_overworld
	bl set_callback1
	ldr r0, _080547A4 @ =c2_overworld
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08054794: .4byte gUnknown_0300485C
_08054798: .4byte ExecuteTruckSequence
_0805479C: .4byte 0x03001bac
_080547A0: .4byte c1_overworld
_080547A4: .4byte c2_overworld
	thumb_func_end CB2_NewGame

	thumb_func_start c2_whiteout
c2_whiteout: @ 80547A8
	push {lr}
	sub sp, 0x4
	ldr r1, _08054804 @ =gMain
	ldr r0, _08054808 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _080547FE
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl ResetSafariZoneFlag_
	bl sub_8052F5C
	bl player_avatar_init_params_reset
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _0805480C @ =gUnknown_0300485C
	ldr r0, _08054810 @ =sub_8080B60
	str r0, [r1]
	mov r1, sp
	movs r0, 0
	strb r0, [r1]
	mov r0, sp
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _08054814 @ =c1_overworld
	bl set_callback1
	ldr r0, _08054818 @ =c2_overworld
	bl SetMainCallback2
_080547FE:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08054804: .4byte gMain
_08054808: .4byte 0x0000043c
_0805480C: .4byte gUnknown_0300485C
_08054810: .4byte sub_8080B60
_08054814: .4byte c1_overworld
_08054818: .4byte c2_overworld
	thumb_func_end c2_whiteout

	thumb_func_start CB2_LoadMap
CB2_LoadMap: @ 805481C
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl set_callback1
	ldr r0, _08054840 @ =sub_810CC80
	bl SetMainCallback2
	ldr r1, _08054844 @ =gMain
	ldr r0, _08054848 @ =CB2_LoadMap2
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08054840: .4byte sub_810CC80
_08054844: .4byte gMain
_08054848: .4byte CB2_LoadMap2
	thumb_func_end CB2_LoadMap

	thumb_func_start CB2_LoadMap2
CB2_LoadMap2: @ 805484C
	push {lr}
	ldr r0, _08054868 @ =0x03001bac
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _0805486C @ =c1_overworld
	bl set_callback1
	ldr r0, _08054870 @ =c2_overworld
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08054868: .4byte 0x03001bac
_0805486C: .4byte c1_overworld
_08054870: .4byte c2_overworld
	thumb_func_end CB2_LoadMap2

	thumb_func_start sub_8054534
sub_8054534: @ 8054874
	push {r4,lr}
	ldr r0, _080548B8 @ =gMain
	ldr r1, _080548BC @ =0x0000043c
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _08054894
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl set_callback1
_08054894:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_805493C
	cmp r0, 0
	beq _080548B0
	bl SetFieldVBlankCallback
	ldr r0, _080548C0 @ =c1_overworld
	bl set_callback1
	ldr r0, _080548C4 @ =c2_overworld
	bl SetMainCallback2
_080548B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080548B8: .4byte gMain
_080548BC: .4byte 0x0000043c
_080548C0: .4byte c1_overworld
_080548C4: .4byte c2_overworld
	thumb_func_end sub_8054534

	thumb_func_start sub_8054588
sub_8054588: @ 80548C8
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r0, _080548E0 @ =gUnknown_0300485C
	ldr r1, _080548E4 @ =sub_8080AC4
	str r1, [r0]
	ldr r0, _080548E8 @ =c2_80567AC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080548E0: .4byte gUnknown_0300485C
_080548E4: .4byte sub_8080AC4
_080548E8: .4byte c2_80567AC
	thumb_func_end sub_8054588

	thumb_func_start c2_80567AC
c2_80567AC: @ 80548EC
	push {lr}
	ldr r0, _08054914 @ =0x03001bac
	bl sub_805483C
	cmp r0, 0
	beq _0805490E
	bl SetFieldVBlankCallback
	ldr r0, _08054918 @ =sub_8055354
	bl set_callback1
	ldr r0, _0805491C @ =sub_8055390
	bl sub_80543DC
	ldr r0, _08054920 @ =c2_overworld
	bl SetMainCallback2
_0805490E:
	pop {r0}
	bx r0
	.align 2, 0
_08054914: .4byte 0x03001bac
_08054918: .4byte sub_8055354
_0805491C: .4byte sub_8055390
_08054920: .4byte c2_overworld
	thumb_func_end c2_80567AC

	thumb_func_start c2_exit_to_overworld_2_switch
c2_exit_to_overworld_2_switch: @ 8054924
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _0805493C
	ldr r0, _08054938 @ =c2_exit_to_overworld_2_link
	bl SetMainCallback2
	b _08054946
	.align 2, 0
_08054938: .4byte c2_exit_to_overworld_2_link
_0805493C:
	bl FieldClearVBlankHBlankCallbacks
	ldr r0, _0805494C @ =c2_exit_to_overworld_2_local
	bl SetMainCallback2
_08054946:
	pop {r0}
	bx r0
	.align 2, 0
_0805494C: .4byte c2_exit_to_overworld_2_local
	thumb_func_end c2_exit_to_overworld_2_switch

	thumb_func_start c2_exit_to_overworld_2_local
c2_exit_to_overworld_2_local: @ 8054950
	push {lr}
	ldr r0, _0805496C @ =0x03001bac
	bl sub_8054A4C
	cmp r0, 0
	beq _08054966
	bl SetFieldVBlankCallback
	ldr r0, _08054970 @ =c2_overworld
	bl SetMainCallback2
_08054966:
	pop {r0}
	bx r0
	.align 2, 0
_0805496C: .4byte 0x03001bac
_08054970: .4byte c2_overworld
	thumb_func_end c2_exit_to_overworld_2_local

	thumb_func_start c2_exit_to_overworld_2_link
c2_exit_to_overworld_2_link: @ 8054974
	push {lr}
	bl sub_8055870
	cmp r0, 0
	bne _0805498E
	ldr r0, _08054994 @ =0x03001bac
	bl sub_8054A9C
	cmp r0, 0
	beq _0805498E
	ldr r0, _08054998 @ =c2_overworld
	bl SetMainCallback2
_0805498E:
	pop {r0}
	bx r0
	.align 2, 0
_08054994: .4byte 0x03001bac
_08054998: .4byte c2_overworld
	thumb_func_end c2_exit_to_overworld_2_link

	thumb_func_start sub_805465C
sub_805465C: @ 805499C
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl sub_8054F70
	ldr r0, _080549CC @ =sub_8055354
	bl set_callback1
	ldr r0, _080549D0 @ =sub_8055390
	bl sub_80543DC
	ldr r1, _080549D4 @ =gUnknown_0300485C
	ldr r0, _080549D8 @ =sub_8080A3C
	str r0, [r1]
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080549CC: .4byte sub_8055354
_080549D0: .4byte sub_8055390
_080549D4: .4byte gUnknown_0300485C
_080549D8: .4byte sub_8080A3C
	thumb_func_end sub_805465C

	thumb_func_start sub_805469C
sub_805469C: @ 80549DC
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _080549F0 @ =gUnknown_0300485C
	ldr r0, _080549F4 @ =atk17_seteffectuser
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080549F0: .4byte gUnknown_0300485C
_080549F4: .4byte atk17_seteffectuser
	thumb_func_end sub_805469C

	thumb_func_start sub_80546B8
sub_80546B8: @ 80549F8
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08054A0C @ =gUnknown_0300485C
	ldr r0, _08054A10 @ =sub_80809B0
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_08054A0C: .4byte gUnknown_0300485C
_08054A10: .4byte sub_80809B0
	thumb_func_end sub_80546B8

	thumb_func_start c2_exit_to_overworld_1_continue_scripts_restart_music
c2_exit_to_overworld_1_continue_scripts_restart_music: @ 8054A14
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08054A28 @ =gUnknown_0300485C
	ldr r0, _08054A2C @ =sub_8080990
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_08054A28: .4byte gUnknown_0300485C
_08054A2C: .4byte sub_8080990
	thumb_func_end c2_exit_to_overworld_1_continue_scripts_restart_music

	thumb_func_start sub_80546F0
sub_80546F0: @ 8054A30
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08054A44 @ =gUnknown_0300485C
	ldr r0, _08054A48 @ =sub_8080B60
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_08054A44: .4byte gUnknown_0300485C
_08054A48: .4byte sub_8080B60
	thumb_func_end sub_80546F0

	thumb_func_start sub_805470C
sub_805470C: @ 8054A4C
	push {lr}
	ldr r0, _08054A70 @ =gMapHeader
	ldrb r0, [r0, 0x1A]
	cmp r0, 0x1
	bne _08054A66
	bl sub_80BBB24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054A66
	bl AddMapNamePopUpWindowTask
_08054A66:
	bl sub_8080B60
	pop {r0}
	bx r0
	.align 2, 0
_08054A70: .4byte gMapHeader
	thumb_func_end sub_805470C

	thumb_func_start CB2_ContinueSavedGame
CB2_ContinueSavedGame: @ 8054A74
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl ResetSafariZoneFlag_
	bl sub_805338C
	bl sub_8053198
	bl sub_806451C
	bl DoTimeBasedEvents
	bl sub_805308C
	bl sub_8055FC0
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl GetSecretBase2Field_9
	cmp r0, 0x1
	bne _08054AC8
	bl ClearSecretBase2Field_9
	bl sub_8053778
	bl warp_in
	ldr r0, _08054AC4 @ =CB2_LoadMap
	bl SetMainCallback2
	b _08054AD8
	.align 2, 0
_08054AC4: .4byte CB2_LoadMap
_08054AC8:
	ldr r0, _08054ADC @ =gUnknown_0300485C
	ldr r1, _08054AE0 @ =sub_805470C
	str r1, [r0]
	ldr r0, _08054AE4 @ =c1_overworld
	bl set_callback1
	bl c2_exit_to_overworld_2_switch
_08054AD8:
	pop {r0}
	bx r0
	.align 2, 0
_08054ADC: .4byte gUnknown_0300485C
_08054AE0: .4byte sub_805470C
_08054AE4: .4byte c1_overworld
	thumb_func_end CB2_ContinueSavedGame

	thumb_func_start FieldClearVBlankHBlankCallbacks
FieldClearVBlankHBlankCallbacks: @ 8054AE8
	push {r4,lr}
	ldr r4, _08054B18 @ =0x04000208
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r2, _08054B1C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08054B20 @ =0x0000fffd
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	strh r3, [r4]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054B18: .4byte 0x04000208
_08054B1C: .4byte 0x04000200
_08054B20: .4byte 0x0000fffd
	thumb_func_end FieldClearVBlankHBlankCallbacks

	thumb_func_start SetFieldVBlankCallback
SetFieldVBlankCallback: @ 8054B24
	push {lr}
	ldr r0, _08054B30 @ =VBlankCB_Field
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_08054B30: .4byte VBlankCB_Field
	thumb_func_end SetFieldVBlankCallback

	thumb_func_start VBlankCB_Field
VBlankCB_Field: @ 8054B34
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_8089668
	bl sub_8057A58
	bl TransferPlttBuffer
	bl sub_8072E74
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_Field

	thumb_func_start sub_8054814
sub_8054814: @ 8054B54
	push {lr}
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08054B72
	bl sub_80815E0
	ldr r2, _08054B78 @ =gUnknown_08216694
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
_08054B72:
	pop {r0}
	bx r0
	.align 2, 0
_08054B78: .4byte gUnknown_08216694
	thumb_func_end sub_8054814

	thumb_func_start sub_805483C
sub_805483C: @ 8054B7C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bhi _08054C74
	lsls r0, 2
	ldr r1, _08054B90 @ =_08054B94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054B90: .4byte _08054B94
	.align 2, 0
_08054B94:
	.4byte _08054BCC
	.4byte _08054BE2
	.4byte _08054BEA
	.4byte _08054BF2
	.4byte _08054C04
	.4byte _08054C24
	.4byte _08054C2A
	.4byte _08054C38
	.4byte _08054C48
	.4byte _08054C58
	.4byte _08054C5E
	.4byte _08054C68
	.4byte _08054C64
	.4byte _08054C70
_08054BCC:
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl sub_8054F70
	bl sub_8054BA8
	b _08054C68
_08054BE2:
	movs r0, 0x1
	bl sub_8053994
	b _08054C68
_08054BEA:
	movs r0, 0x1
	bl sub_8054D4C
	b _08054C68
_08054BF2:
	bl sub_8054E98
	bl sub_8054D90
	bl sub_8054EC8
	bl sub_8054E60
	b _08054C68
_08054C04:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054C1C @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08054C20 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	b _08054C68
	.align 2, 0
_08054C1C: .4byte gWindowConfig_81E6C3C
_08054C20: .4byte gWindowConfig_81E6CE4
_08054C24:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054C68
_08054C2A:
	ldr r0, _08054C34 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D28
	b _08054C68
	.align 2, 0
_08054C34: .4byte gMapHeader
_08054C38:
	ldr r0, _08054C44 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D38
	b _08054C68
	.align 2, 0
_08054C44: .4byte gMapHeader
_08054C48:
	ldr r0, _08054C54 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054C68
	.align 2, 0
_08054C54: .4byte gMapHeader
_08054C58:
	bl DrawWholeMapView
	b _08054C68
_08054C5E:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054C68
_08054C64:
	bl sub_80543E8
_08054C68:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054C74
_08054C70:
	movs r0, 0x1
	b _08054C76
_08054C74:
	movs r0, 0
_08054C76:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805483C

	thumb_func_start sub_805493C
sub_805493C: @ 8054C7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bls _08054C8A
	b _08054D84
_08054C8A:
	lsls r0, 2
	ldr r1, _08054C94 @ =_08054C98
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054C94: .4byte _08054C98
	.align 2, 0
_08054C98:
	.4byte _08054CD0
	.4byte _08054CDC
	.4byte _08054CE2
	.4byte _08054CEA
	.4byte _08054CF4
	.4byte _08054D14
	.4byte _08054D1A
	.4byte _08054D28
	.4byte _08054D38
	.4byte _08054D48
	.4byte _08054D4E
	.4byte _08054D54
	.4byte _08054D74
	.4byte _08054D80
_08054CD0:
	bl FieldClearVBlankHBlankCallbacks
	adds r0, r5, 0
	bl sub_8053994
	b _08054D78
_08054CDC:
	bl sub_8054BA8
	b _08054D78
_08054CE2:
	adds r0, r5, 0
	bl sub_8054D4C
	b _08054D78
_08054CEA:
	bl mli4_mapscripts_and_other
	bl sub_8054E34
	b _08054D78
_08054CF4:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054D0C @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08054D10 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	b _08054D78
	.align 2, 0
_08054D0C: .4byte gWindowConfig_81E6C3C
_08054D10: .4byte gWindowConfig_81E6CE4
_08054D14:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054D78
_08054D1A:
	ldr r0, _08054D24 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D28
	b _08054D78
	.align 2, 0
_08054D24: .4byte gMapHeader
_08054D28:
	ldr r0, _08054D34 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D38
	b _08054D78
	.align 2, 0
_08054D34: .4byte gMapHeader
_08054D38:
	ldr r0, _08054D44 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054D78
	.align 2, 0
_08054D44: .4byte gMapHeader
_08054D48:
	bl DrawWholeMapView
	b _08054D78
_08054D4E:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054D78
_08054D54:
	ldr r0, _08054D70 @ =gMapHeader
	ldrb r0, [r0, 0x1A]
	cmp r0, 0x1
	bne _08054D78
	bl sub_80BBB24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054D78
	bl AddMapNamePopUpWindowTask
	b _08054D78
	.align 2, 0
_08054D70: .4byte gMapHeader
_08054D74:
	bl sub_80543E8
_08054D78:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054D84
_08054D80:
	movs r0, 0x1
	b _08054D86
_08054D84:
	movs r0, 0
_08054D86:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805493C

	thumb_func_start sub_8054A4C
sub_8054A4C: @ 8054D8C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08054DBE
	cmp r0, 0x1
	bgt _08054DA0
	cmp r0, 0
	beq _08054DAA
	b _08054DD4
_08054DA0:
	cmp r0, 0x2
	beq _08054DC4
	cmp r0, 0x3
	beq _08054DD0
	b _08054DD4
_08054DAA:
	bl sub_8054BA8
	movs r0, 0
	bl sub_8054D4C
	bl sub_8054E20
	bl sub_8054E34
	b _08054DC8
_08054DBE:
	bl sub_8054C2C
	b _08054DC8
_08054DC4:
	bl sub_80543E8
_08054DC8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054DD4
_08054DD0:
	movs r0, 0x1
	b _08054DD6
_08054DD4:
	movs r0, 0
_08054DD6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054A4C

	thumb_func_start sub_8054A9C
sub_8054A9C: @ 8054DDC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bhi _08054EC6
	lsls r0, 2
	ldr r1, _08054DF0 @ =_08054DF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054DF0: .4byte _08054DF4
	.align 2, 0
_08054DF4:
	.4byte _08054E2C
	.4byte _08054E36
	.4byte _08054E3E
	.4byte _08054E4C
	.4byte _08054E6C
	.4byte _08054E72
	.4byte _08054E80
	.4byte _08054E90
	.4byte _08054EA0
	.4byte _08054EA6
	.4byte _08054EB0
	.4byte _08054EB0
	.4byte _08054EAC
	.4byte _08054EB8
_08054E2C:
	bl FieldClearVBlankHBlankCallbacks
	bl sub_8054BA8
	b _08054EB0
_08054E36:
	movs r0, 0x1
	bl sub_8054D4C
	b _08054EB0
_08054E3E:
	bl sub_8054F48
	bl sub_8054E20
	bl sub_8054E7C
	b _08054EB0
_08054E4C:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054E64 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08054E68 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	b _08054EB0
	.align 2, 0
_08054E64: .4byte gWindowConfig_81E6C3C
_08054E68: .4byte gWindowConfig_81E6CE4
_08054E6C:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054EB0
_08054E72:
	ldr r0, _08054E7C @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D28
	b _08054EB0
	.align 2, 0
_08054E7C: .4byte gMapHeader
_08054E80:
	ldr r0, _08054E8C @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D38
	b _08054EB0
	.align 2, 0
_08054E8C: .4byte gMapHeader
_08054E90:
	ldr r0, _08054E9C @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054EB0
	.align 2, 0
_08054E9C: .4byte gMapHeader
_08054EA0:
	bl DrawWholeMapView
	b _08054EB0
_08054EA6:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054EB0
_08054EAC:
	bl sub_80543E8
_08054EB0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054EC6
_08054EB8:
	bl SetFieldVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	b _08054EC8
_08054EC6:
	movs r0, 0
_08054EC8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054A9C

	thumb_func_start do_load_map_stuff_loop
do_load_map_stuff_loop: @ 8054ED0
	push {r4,lr}
	adds r4, r0, 0
_08054ED4:
	adds r0, r4, 0
	movs r1, 0
	bl sub_805493C
	cmp r0, 0
	beq _08054ED4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end do_load_map_stuff_loop

	thumb_func_start sub_8054BA8
sub_8054BA8: @ 8054EE8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	bl remove_some_task
	ldr r2, _08054F5C @ =0x05000002
	mov r0, sp
	strh r4, [r0]
	ldr r1, _08054F60 @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08054F64 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08054F68 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08054F22:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08054F22
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054F5C: .4byte 0x05000002
_08054F60: .4byte 0x040000d4
_08054F64: .4byte 0x810001ff
_08054F68: .4byte 0x81000800
	thumb_func_end sub_8054BA8

	thumb_func_start sub_8054C2C
sub_8054C2C: @ 8054F6C
	push {lr}
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054F8C @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08054F90 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	bl mapdata_load_assets_to_gpu_and_full_redraw
	pop {r0}
	bx r0
	.align 2, 0
_08054F8C: .4byte gWindowConfig_81E6C3C
_08054F90: .4byte gWindowConfig_81E6CE4
	thumb_func_end sub_8054C2C

	thumb_func_start sub_8054C54
sub_8054C54: @ 8054F94
	push {r4-r6,lr}
	ldr r0, _08055048 @ =0x0400004c
	movs r3, 0
	strh r3, [r0]
	ldr r1, _0805504C @ =0x04000048
	ldr r2, _08055050 @ =0x00001f1f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r4, _08055054 @ =0x00000101
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _08055058 @ =0x04000040
	movs r1, 0xFF
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	ldr r6, _0805505C @ =0x0000ffff
	adds r1, r6, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r4, _08055060 @ =0x04000050
	ldr r1, _08055064 @ =gUnknown_081E29E0
	ldrh r0, [r1, 0x2]
	ldrh r2, [r1, 0x4]
	orrs r0, r2
	ldrh r1, [r1, 0x6]
	orrs r0, r1
	movs r2, 0x82
	lsls r2, 5
	adds r1, r2, 0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _08055068 @ =0x04000052
	ldr r4, _0805506C @ =0x0000070d
	adds r0, r4, 0
	strh r0, [r1]
	ldr r5, _08055070 @ =gBGHOffsetRegs
	ldr r0, [r5]
	strh r3, [r0]
	ldr r4, _08055074 @ =gBGVOffsetRegs
	ldr r0, [r4]
	strh r3, [r0]
	ldr r2, _08055078 @ =gBGControlRegs
	ldr r0, [r2]
	strh r3, [r0]
	ldr r0, [r5, 0x4]
	strh r3, [r0]
	ldr r0, [r4, 0x4]
	strh r3, [r0]
	ldr r1, [r2, 0x4]
	ldr r6, _0805507C @ =0x00001d41
	adds r0, r6, 0
	strh r0, [r1]
	ldr r0, [r5, 0x8]
	strh r3, [r0]
	ldr r0, [r4, 0x8]
	strh r3, [r0]
	ldr r1, [r2, 0x8]
	subs r6, 0xFF
	adds r0, r6, 0
	strh r0, [r1]
	ldr r0, [r5, 0xC]
	strh r3, [r0]
	ldr r0, [r4, 0xC]
	strh r3, [r0]
	ldr r1, [r2, 0xC]
	ldr r2, _08055080 @ =0x00001e43
	adds r0, r2, 0
	strh r0, [r1]
	movs r3, 0x80
	lsls r3, 19
	ldr r2, _08055084 @ =gUnknown_081E29D8
	ldrh r0, [r2, 0x2]
	ldr r4, _08055088 @ =0x00007060
	adds r1, r4, 0
	orrs r0, r1
	ldrh r1, [r2, 0x4]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	ldrh r1, [r2, 0x6]
	orrs r0, r1
	strh r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055048: .4byte 0x0400004c
_0805504C: .4byte 0x04000048
_08055050: .4byte 0x00001f1f
_08055054: .4byte 0x00000101
_08055058: .4byte 0x04000040
_0805505C: .4byte 0x0000ffff
_08055060: .4byte 0x04000050
_08055064: .4byte gUnknown_081E29E0
_08055068: .4byte 0x04000052
_0805506C: .4byte 0x0000070d
_08055070: .4byte gBGHOffsetRegs
_08055074: .4byte gBGVOffsetRegs
_08055078: .4byte gBGControlRegs
_0805507C: .4byte 0x00001d41
_08055080: .4byte 0x00001e43
_08055084: .4byte gUnknown_081E29D8
_08055088: .4byte 0x00007060
	thumb_func_end sub_8054C54

	thumb_func_start sub_8054D4C
sub_8054D4C: @ 805508C
	push {r4,lr}
	adds r4, r0, 0
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl dp12_8087EA4
	bl ResetCameraUpdateInfo
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl sub_805C7C4
	bl FieldEffectActiveListClear
	bl InitFieldMessageBox
	bl sub_807C828
	bl sub_8080750
	cmp r4, 0
	bne _080550C6
	bl overworld_ensure_per_step_coros_running
_080550C6:
	bl mapheader_run_script_with_tag_x5
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8054D4C

	thumb_func_start sub_8054D90
sub_8054D90: @ 80550D0
	push {lr}
	ldr r0, _080550F0 @ =gUnknown_0300489C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080550F4 @ =gUnknown_03004898
	strh r1, [r0]
	bl sub_805AA98
	movs r0, 0
	movs r1, 0
	bl sub_805B55C
	bl mapheader_run_first_tag4_script_list_match
	pop {r0}
	bx r0
	.align 2, 0
_080550F0: .4byte gUnknown_0300489C
_080550F4: .4byte gUnknown_03004898
	thumb_func_end sub_8054D90

	thumb_func_start mli4_mapscripts_and_other
mli4_mapscripts_and_other: @ 80550F8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08055154 @ =gUnknown_0300489C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08055158 @ =gUnknown_03004898
	strh r1, [r0]
	bl sub_805AA98
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	bl sub_8053AA8
	adds r5, r0, 0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldrb r2, [r5, 0x1]
	ldr r3, _0805515C @ =gSaveBlock2
	ldrb r3, [r3, 0x8]
	bl InitPlayerAvatar
	ldrb r0, [r5]
	bl SetPlayerAvatarTransitionFlags
	bl player_avatar_init_params_reset
	movs r0, 0
	movs r1, 0
	bl sub_805B55C
	bl ResetBerryTreeSparkleFlags
	bl mapheader_run_first_tag4_script_list_match
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055154: .4byte gUnknown_0300489C
_08055158: .4byte gUnknown_03004898
_0805515C: .4byte gSaveBlock2
	thumb_func_end mli4_mapscripts_and_other

	thumb_func_start sub_8054E20
sub_8054E20: @ 8055160
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_805B710
	bl sub_80C8080
	pop {r0}
	bx r0
	thumb_func_end sub_8054E20

	thumb_func_start sub_8054E34
sub_8054E34: @ 8055174
	push {lr}
	ldr r2, _08055198 @ =gMapObjects
	ldr r3, _0805519C @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r0, [r3, 0x4]
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08055198: .4byte gMapObjects
_0805519C: .4byte gPlayerAvatar
	thumb_func_end sub_8054E34

	thumb_func_start sub_8054E60
sub_8054E60: @ 80551A0
	push {lr}
	ldr r0, _080551B8 @ =gUnknown_03004860
	ldrb r0, [r0]
	bl sub_8055AE8
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_080551B8: .4byte gUnknown_03004860
	thumb_func_end sub_8054E60

	thumb_func_start sub_8054E7C
sub_8054E7C: @ 80551BC
	push {lr}
	ldr r0, _080551D4 @ =gUnknown_03004860
	ldrb r0, [r0]
	bl sub_8055AE8
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_080551D4: .4byte gUnknown_03004860
	thumb_func_end sub_8054E7C

	thumb_func_start sub_8054E98
sub_8054E98: @ 80551D8
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	mov r2, sp
	ldr r0, _08055204 @ =gUnknown_03004860
	ldrb r1, [r0]
	ldrh r0, [r2]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	bl sub_8056C50
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055204: .4byte gUnknown_03004860
	thumb_func_end sub_8054E98

	thumb_func_start sub_8054EC8
sub_8054EC8: @ 8055208
	push {r4-r7,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	mov r3, sp
	mov r2, sp
	ldr r0, _08055278 @ =gUnknown_03004860
	ldrb r1, [r0]
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r3]
	movs r5, 0
	ldr r0, _0805527C @ =gFieldLinkPlayerCount
	adds r7, r4, 0
	ldrb r0, [r0]
	cmp r5, r0
	bcs _0805526A
	ldr r6, _08055280 @ =gLinkPlayers
_08055234:
	lsls r4, r5, 24
	lsrs r4, 24
	mov r0, sp
	ldrh r1, [r0]
	adds r1, r5, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	ldrsh r2, [r7, r0]
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r6
	ldrb r3, [r0, 0x13]
	adds r0, r4, 0
	bl SpawnLinkPlayerMapObject
	adds r0, r4, 0
	bl CreateLinkPlayerSprite
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0805527C @ =gFieldLinkPlayerCount
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08055234
_0805526A:
	ldr r0, _08055284 @ =word_3002910
	bl sub_8055340
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055278: .4byte gUnknown_03004860
_0805527C: .4byte gFieldLinkPlayerCount
_08055280: .4byte gLinkPlayers
_08055284: .4byte word_3002910
	thumb_func_end sub_8054EC8

	thumb_func_start sub_8054F48
sub_8054F48: @ 8055288
	push {r4,lr}
	movs r4, 0
	b _0805529C
_0805528E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl CreateLinkPlayerSprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_0805529C:
	ldr r0, _080552AC @ =gFieldLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0805528E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080552AC: .4byte gFieldLinkPlayerCount
	thumb_func_end sub_8054F48

	thumb_func_start sub_8054F70
sub_8054F70: @ 80552B0
	push {lr}
	ldr r1, _080552C4 @ =gUnknown_03000580
	movs r2, 0x80
	adds r0, r1, 0x3
_080552B8:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080552B8
	pop {r0}
	bx r0
	.align 2, 0
_080552C4: .4byte gUnknown_03000580
	thumb_func_end sub_8054F70

	thumb_func_start sub_8054F88
sub_8054F88: @ 80552C8
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080552E8 @ =gFieldLinkPlayerCount
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _080552F6
	ldr r4, _080552EC @ =gUnknown_03000580
_080552DA:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _080552F0
	movs r0, 0
	b _080552F8
	.align 2, 0
_080552E8: .4byte gFieldLinkPlayerCount
_080552EC: .4byte gUnknown_03000580
_080552F0:
	adds r1, 0x1
	cmp r1, r2
	blt _080552DA
_080552F6:
	movs r0, 0x1
_080552F8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054F88

	thumb_func_start sub_8054FC0
sub_8054FC0: @ 8055300
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08055320 @ =gFieldLinkPlayerCount
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _0805532E
	ldr r4, _08055324 @ =gUnknown_03000580
_08055312:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08055328
	movs r0, 0x1
	b _08055330
	.align 2, 0
_08055320: .4byte gFieldLinkPlayerCount
_08055324: .4byte gUnknown_03000580
_08055328:
	adds r1, 0x1
	cmp r1, r2
	blt _08055312
_0805532E:
	movs r0, 0
_08055330:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054FC0

	thumb_func_start sub_8054FF8
sub_8054FF8: @ 8055338
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r2, 0
	mov r9, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r0, _08055388 @ =gUnknown_03000580
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, 0x80
	beq _08055358
	b _080554D2
_08055358:
	adds r0, r6, 0
	bl sub_8055648
	adds r4, r0, 0
	cmp r4, 0
	beq _08055390
	bl sub_8055758
	mov r1, r9
	strh r0, [r1]
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08055378
	b _08055546
_08055378:
	ldr r0, _0805538C @ =sub_80553E4
	bl sub_80543DC
	adds r0, r4, 0
	bl sub_8055808
	b _08055546
	.align 2, 0
_08055388: .4byte gUnknown_03000580
_0805538C: .4byte sub_80553E4
_08055390:
	movs r0, 0x83
	bl sub_8054FC0
	cmp r0, 0x1
	bne _080553B8
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _080553A6
	b _08055546
_080553A6:
	ldr r0, _080553B4 @ =sub_80553E4
	bl sub_80543DC
	bl sub_805585C
	b _08055546
	.align 2, 0
_080553B4: .4byte sub_80553E4
_080553B8:
	mov r0, r8
	subs r0, 0x12
	cmp r0, 0xA
	bls _080553C2
	b _080554D2
_080553C2:
	lsls r0, 2
	ldr r1, _080553CC @ =_080553D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080553CC: .4byte _080553D0
	.align 2, 0
_080553D0:
	.4byte _08055428
	.4byte _080554D2
	.4byte _080554D2
	.4byte _080554D2
	.4byte _080554D2
	.4byte _080554D2
	.4byte _080553FC
	.4byte _08055454
	.4byte _080554D2
	.4byte _08055484
	.4byte _080554B0
_080553FC:
	adds r0, r6, 0
	bl sub_8055630
	cmp r0, 0
	beq _080554D2
	ldr r0, _08055420 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _080554D2
	ldr r0, _08055424 @ =sub_80553E4
	bl sub_80543DC
	bl sub_80557F4
	b _080554D2
	.align 2, 0
_08055420: .4byte gUnknown_03000580
_08055424: .4byte sub_80553E4
_08055428:
	adds r0, r6, 0
	bl sub_8055660
	cmp r0, 0x1
	bne _080554D2
	ldr r0, _0805544C @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _080554D2
	ldr r0, _08055450 @ =sub_80553E4
	bl sub_80543DC
	bl sub_8055824
	b _080554D2
	.align 2, 0
_0805544C: .4byte gUnknown_03000580
_08055450: .4byte sub_80553E4
_08055454:
	adds r0, r6, 0
	bl sub_805568C
	adds r4, r0, 0
	cmp r4, 0
	beq _080554D2
	ldr r0, _0805547C @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _080554D2
	ldr r0, _08055480 @ =sub_80553E4
	bl sub_80543DC
	adds r0, r4, 0
	bl sub_8055840
	b _080554D2
	.align 2, 0
_0805547C: .4byte gUnknown_03000580
_08055480: .4byte sub_80553E4
_08055484:
	adds r0, r6, 0
	bl sub_8055618
	cmp r0, 0
	beq _080554D2
	ldr r0, _080554A8 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _080554D2
	ldr r0, _080554AC @ =sub_8055408
	bl sub_80543DC
	bl sub_80557E8
	b _080554D2
	.align 2, 0
_080554A8: .4byte gUnknown_03000580
_080554AC: .4byte sub_8055408
_080554B0:
	adds r0, r6, 0
	bl sub_8055618
	cmp r0, 0
	beq _080554D2
	ldr r0, _080554E4 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _080554D2
	ldr r0, _080554E8 @ =sub_8055438
	bl sub_80543DC
	bl sub_80557E8
_080554D2:
	mov r0, r8
	cmp r0, 0x17
	beq _080554F8
	cmp r0, 0x17
	bgt _080554EC
	cmp r0, 0x16
	beq _08055508
	b _08055546
	.align 2, 0
_080554E4: .4byte gUnknown_03000580
_080554E8: .4byte sub_8055438
_080554EC:
	mov r1, r8
	cmp r1, 0x1A
	beq _08055518
	cmp r1, 0x1D
	beq _08055538
	b _08055546
_080554F8:
	ldr r0, _08055504 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x83
	strb r1, [r0]
	b _08055546
	.align 2, 0
_08055504: .4byte gUnknown_03000580
_08055508:
	ldr r0, _08055514 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x82
	strb r1, [r0]
	b _08055546
	.align 2, 0
_08055514: .4byte gUnknown_03000580
_08055518:
	ldr r0, _08055530 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x80
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055546
	ldr r0, _08055534 @ =sub_8055390
	bl sub_80543DC
	b _08055546
	.align 2, 0
_08055530: .4byte gUnknown_03000580
_08055534: .4byte sub_8055390
_08055538:
	ldr r0, _08055554 @ =gUnknown_03000580
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, 0x82
	bne _08055546
	movs r0, 0x81
	strb r0, [r1]
_08055546:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055554: .4byte gUnknown_03000580
	thumb_func_end sub_8054FF8

	thumb_func_start sub_8055218
sub_8055218: @ 8055558
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r1
	movs r6, 0
	add r4, sp, 0x10
	mov r9, r4
	adds r7, r0, 0
_0805556C:
	ldrh r5, [r7]
	movs r0, 0
	strh r0, [r4]
	adds r0, r6, 0
	mov r1, r8
	mov r2, sp
	bl sub_80555B0
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, sp
	adds r3, r4, 0
	bl sub_8054FF8
	ldr r0, _080555BC @ =gUnknown_03000580
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	bne _0805559C
	adds r0, r5, 0
	bl sub_805530C
	mov r1, r9
	strh r0, [r1]
_0805559C:
	lsls r0, r6, 24
	lsrs r0, 24
	ldrb r1, [r4]
	bl sub_8055BFC
	adds r7, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0805556C
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080555BC: .4byte gUnknown_03000580
	thumb_func_end sub_8055218

	thumb_func_start sub_8055280
sub_8055280: @ 80555C0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080555D8 @ =0xffef0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xC
	bhi _080555E0
	ldr r0, _080555DC @ =word_3004858
	strh r1, [r0]
	b _080555E6
	.align 2, 0
_080555D8: .4byte 0xffef0000
_080555DC: .4byte word_3004858
_080555E0:
	ldr r1, _080555EC @ =word_3004858
	movs r0, 0x11
	strh r0, [r1]
_080555E6:
	pop {r0}
	bx r0
	.align 2, 0
_080555EC: .4byte word_3004858
	thumb_func_end sub_8055280

	thumb_func_start sub_80552B0
sub_80552B0: @ 80555F0
	push {lr}
	ldr r2, _08055604 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08055608
	movs r0, 0x13
	b _08055648
	.align 2, 0
_08055604: .4byte gMain
_08055608:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08055614
	movs r0, 0x12
	b _08055648
_08055614:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08055620
	movs r0, 0x14
	b _08055648
_08055620:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0805562C
	movs r0, 0x15
	b _08055648
_0805562C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805563A
	movs r0, 0x18
	b _08055648
_0805563A:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08055646
	movs r0, 0x11
	b _08055648
_08055646:
	movs r0, 0x19
_08055648:
	pop {r1}
	bx r1
	thumb_func_end sub_80552B0

	thumb_func_start sub_805530C
sub_805530C: @ 805564C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x13
	beq _08055672
	cmp r0, 0x13
	bgt _08055662
	cmp r0, 0x12
	beq _08055676
	b _0805567A
_08055662:
	cmp r1, 0x14
	beq _0805566E
	cmp r1, 0x15
	bne _0805567A
	movs r0, 0x4
	b _0805567C
_0805566E:
	movs r0, 0x3
	b _0805567C
_08055672:
	movs r0, 0x1
	b _0805567C
_08055676:
	movs r0, 0x2
	b _0805567C
_0805567A:
	movs r0, 0
_0805567C:
	pop {r1}
	bx r1
	thumb_func_end sub_805530C

	thumb_func_start sub_8055340
sub_8055340: @ 8055680
	push {lr}
	movs r2, 0x11
	adds r1, r0, 0x6
_08055686:
	strh r2, [r1]
	subs r1, 0x2
	cmp r1, r0
	bge _08055686
	pop {r0}
	bx r0
	thumb_func_end sub_8055340

	thumb_func_start sub_8055354
sub_8055354: @ 8055694
	push {r4,r5,lr}
	ldr r0, _080556C4 @ =gUnknown_03004860
	ldrb r4, [r0]
	ldr r5, _080556C8 @ =word_3002910
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8055218
	ldr r0, _080556CC @ =gUnknown_03000584
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 16
	lsrs r0, 16
	bl sub_8055280
	adds r0, r5, 0
	bl sub_8055340
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080556C4: .4byte gUnknown_03004860
_080556C8: .4byte word_3002910
_080556CC: .4byte gUnknown_03000584
	thumb_func_end sub_8055354

	thumb_func_start sub_8055390
sub_8055390: @ 80556D0
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080556E4
	movs r0, 0x11
	b _0805571A
_080556E4:
	ldr r1, _080556F4 @ =gLink
	ldr r2, _080556F8 @ =0x00000fbd
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080556FC
	movs r0, 0x1B
	b _0805571A
	.align 2, 0
_080556F4: .4byte gLink
_080556F8: .4byte 0x00000fbd
_080556FC:
	ldr r2, _0805570C @ =0x00000339
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _08055710
	movs r0, 0x1C
	b _0805571A
	.align 2, 0
_0805570C: .4byte 0x00000339
_08055710:
	adds r0, r4, 0
	bl sub_80552B0
	lsls r0, 16
	lsrs r0, 16
_0805571A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055390

	thumb_func_start sub_80553E0
sub_80553E0: @ 8055720
	movs r0, 0x11
	bx lr
	thumb_func_end sub_80553E0

	thumb_func_start sub_80553E4
sub_80553E4: @ 8055724
	push {r4,lr}
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x11
	cmp r0, 0x1
	beq _0805573C
	movs r4, 0x1A
	ldr r0, _08055744 @ =sub_80553E0
	bl sub_80543DC
_0805573C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055744: .4byte sub_80553E0
	thumb_func_end sub_80553E4

	thumb_func_start sub_8055408
sub_8055408: @ 8055748
	push {r4,lr}
	ldr r0, _0805576C @ =gLink
	ldr r1, _08055770 @ =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08055764
	movs r4, 0x1A
	bl ScriptContext2_Disable
	ldr r0, _08055774 @ =sub_80553E0
	bl sub_80543DC
_08055764:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805576C: .4byte gLink
_08055770: .4byte 0x00000fbd
_08055774: .4byte sub_80553E0
	thumb_func_end sub_8055408

	thumb_func_start sub_8055438
sub_8055438: @ 8055778
	push {r4,lr}
	ldr r0, _0805579C @ =gLink
	ldr r1, _080557A0 @ =0x00000339
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08055794
	movs r4, 0x1A
	bl ScriptContext2_Disable
	ldr r0, _080557A4 @ =sub_80553E0
	bl sub_80543DC
_08055794:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805579C: .4byte gLink
_080557A0: .4byte 0x00000339
_080557A4: .4byte sub_80553E0
	thumb_func_end sub_8055438

	thumb_func_start sub_8055468
sub_8055468: @ 80557A8
	movs r0, 0x11
	bx lr
	thumb_func_end sub_8055468

	thumb_func_start sub_805546C
sub_805546C: @ 80557AC
	push {lr}
	ldr r1, _080557D0 @ =gUnknown_03000580
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	bne _080557DC
	ldr r0, _080557D4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080557DC
	ldr r0, _080557D8 @ =sub_8055468
	bl sub_80543DC
	movs r0, 0x1D
	b _080557DE
	.align 2, 0
_080557D0: .4byte gUnknown_03000580
_080557D4: .4byte gMain
_080557D8: .4byte sub_8055468
_080557DC:
	movs r0, 0x11
_080557DE:
	pop {r1}
	bx r1
	thumb_func_end sub_805546C

	thumb_func_start sub_80554A4
sub_80554A4: @ 80557E4
	push {lr}
	ldr r0, _080557F4 @ =sub_805546C
	bl sub_80543DC
	movs r0, 0x16
	pop {r1}
	bx r1
	.align 2, 0
_080557F4: .4byte sub_805546C
	thumb_func_end sub_80554A4

	thumb_func_start sub_80554B8
sub_80554B8: @ 80557F8
	movs r0, 0x11
	bx lr
	thumb_func_end sub_80554B8

	thumb_func_start sub_80554BC
sub_80554BC: @ 80557FC
	push {lr}
	movs r0, 0x83
	bl sub_8054F88
	cmp r0, 0x1
	bne _08055814
	ldr r0, _0805581C @ =gUnknown_081A4508
	bl ScriptContext1_SetupScript
	ldr r0, _08055820 @ =sub_80554B8
	bl sub_80543DC
_08055814:
	movs r0, 0x11
	pop {r1}
	bx r1
	.align 2, 0
_0805581C: .4byte gUnknown_081A4508
_08055820: .4byte sub_80554B8
	thumb_func_end sub_80554BC

	thumb_func_start sub_80554E4
sub_80554E4: @ 8055824
	push {lr}
	ldr r0, _08055834 @ =sub_80554BC
	bl sub_80543DC
	movs r0, 0x17
	pop {r1}
	bx r1
	.align 2, 0
_08055834: .4byte sub_80554BC
	thumb_func_end sub_80554E4

	thumb_func_start sub_80554F8
sub_80554F8: @ 8055838
	push {lr}
	movs r0, 0x83
	bl sub_8054FC0
	cmp r0, 0x1
	beq _0805588A
	ldr r0, _08055864 @ =gUnknown_03000584
	ldr r2, [r0]
	ldr r1, _08055868 @ =sub_805546C
	adds r3, r0, 0
	cmp r2, r1
	bne _08055874
	ldr r1, _0805586C @ =gUnknown_03000580
	ldr r0, _08055870 @ =gUnknown_03004860
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	beq _08055874
	movs r0, 0
	b _080558A2
	.align 2, 0
_08055864: .4byte gUnknown_03000584
_08055868: .4byte sub_805546C
_0805586C: .4byte gUnknown_03000580
_08055870: .4byte gUnknown_03004860
_08055874:
	ldr r1, [r3]
	ldr r0, _08055890 @ =sub_8055468
	cmp r1, r0
	bne _0805589C
	ldr r1, _08055894 @ =gUnknown_03000580
	ldr r0, _08055898 @ =gUnknown_03004860
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x81
	bne _0805589C
_0805588A:
	movs r0, 0x2
	b _080558A2
	.align 2, 0
_08055890: .4byte sub_8055468
_08055894: .4byte gUnknown_03000580
_08055898: .4byte gUnknown_03004860
_0805589C:
	movs r0, 0x82
	bl sub_8054F88
_080558A2:
	pop {r1}
	bx r1
	thumb_func_end sub_80554F8

	thumb_func_start unref_sub_8055568
unref_sub_8055568: @ 80558A8
	push {lr}
	movs r0, 0x83
	bl sub_8054FC0
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8055568

	thumb_func_start sub_8055574
sub_8055574: @ 80558B4
	push {lr}
	ldr r0, _080558C4 @ =sub_80554A4
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080558C4: .4byte sub_80554A4
	thumb_func_end sub_8055574

	thumb_func_start sub_8055588
sub_8055588: @ 80558C8
	push {lr}
	ldr r0, _080558D8 @ =sub_80553E4
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080558D8: .4byte sub_80553E4
	thumb_func_end sub_8055588

	thumb_func_start sub_805559C
sub_805559C: @ 80558DC
	push {lr}
	ldr r0, _080558EC @ =sub_80554E4
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080558EC: .4byte sub_80554E4
	thumb_func_end sub_805559C

	thumb_func_start sub_80555B0
sub_80555B0: @ 80558F0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	strb r4, [r6]
	movs r0, 0
	cmp r4, r1
	bne _08055902
	movs r0, 0x1
_08055902:
	strb r0, [r6, 0x1]
	ldr r1, _08055954 @ =gLinkPlayerMapObjects
	lsls r0, r4, 2
	adds r0, r1
	ldrb r0, [r0, 0x3]
	strb r0, [r6, 0x2]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8055B30
	strb r0, [r6, 0x3]
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl sub_8055B08
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	ldrh r0, [r5]
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	bl sub_8055B50
	strb r0, [r6, 0x8]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	strh r0, [r6, 0xC]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055954: .4byte gLinkPlayerMapObjects
	thumb_func_end sub_80555B0

	thumb_func_start sub_8055618
sub_8055618: @ 8055958
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _08055964
	cmp r0, 0
	bne _08055968
_08055964:
	movs r0, 0x1
	b _0805596A
_08055968:
	movs r0, 0
_0805596A:
	pop {r1}
	bx r1
	thumb_func_end sub_8055618

	thumb_func_start sub_8055630
sub_8055630: @ 8055970
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _0805597C
	cmp r0, 0
	bne _08055980
_0805597C:
	movs r0, 0x1
	b _08055982
_08055980:
	movs r0, 0
_08055982:
	pop {r1}
	bx r1
	thumb_func_end sub_8055630

	thumb_func_start sub_8055648
sub_8055648: @ 8055988
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1, 0x2]
	cmp r0, 0x2
	bne _0805599A
	adds r0, r1, 0x4
	bl sub_8068E24
	b _0805599C
_0805599A:
	movs r0, 0
_0805599C:
	pop {r1}
	bx r1
	thumb_func_end sub_8055648

	thumb_func_start sub_8055660
sub_8055660: @ 80559A0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080559AE
	cmp r0, 0
	bne _080559C4
_080559AE:
	ldrb r0, [r4, 0xC]
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _080559C4
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _080559C4
	movs r0, 0x1
	b _080559C6
_080559C4:
	movs r0, 0
_080559C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055660

	thumb_func_start sub_805568C
sub_805568C: @ 80559CC
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _080559E0
	cmp r0, 0x2
	beq _080559E0
	movs r0, 0
	b _08055A8E
_080559E0:
	ldr r0, [r4, 0x4]
	ldr r1, [r4, 0x8]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r3, _08055A50 @ =gUnknown_0821664C
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r0, r3
	ldr r0, [r0]
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08055A54 @ =0xffff0000
	ldr r2, [sp]
	ands r2, r1
	orrs r2, r0
	str r2, [sp]
	asrs r1, r2, 16
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r3, 0x4
	adds r0, r3
	ldr r0, [r0]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08055A58 @ =0x0000ffff
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r2, _08055A5C @ =0xffffff00
	ldr r0, [sp, 0x4]
	ands r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r1, 16
	bl GetLinkPlayerIdAt
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x4
	beq _08055A84
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08055A4C
	ldr r0, _08055A60 @ =gUnknown_03000580
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	beq _08055A68
_08055A4C:
	ldr r0, _08055A64 @ =gUnknown_081A4495
	b _08055A8E
	.align 2, 0
_08055A50: .4byte gUnknown_0821664C
_08055A54: .4byte 0xffff0000
_08055A58: .4byte 0x0000ffff
_08055A5C: .4byte 0xffffff00
_08055A60: .4byte gUnknown_03000580
_08055A64: .4byte gUnknown_081A4495
_08055A68:
	adds r0, r2, 0
	bl sub_8083BF4
	cmp r0, 0
	bne _08055A7C
	ldr r0, _08055A78 @ =gUnknown_081A4479
	b _08055A8E
	.align 2, 0
_08055A78: .4byte gUnknown_081A4479
_08055A7C:
	ldr r0, _08055A80 @ =gUnknown_081A4487
	b _08055A8E
	.align 2, 0
_08055A80: .4byte gUnknown_081A4487
_08055A84:
	ldrb r1, [r4, 0xC]
	ldrb r2, [r4, 0x3]
	mov r0, sp
	bl sub_80682A8
_08055A8E:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805568C

	thumb_func_start sub_8055758
sub_8055758: @ 8055A98
	push {lr}
	adds r1, r0, 0
	ldr r0, _08055AE4 @ =DoubleBattleColosseum_EventScript_1A4383
	cmp r1, r0
	beq _08055ADE
	ldr r0, _08055AE8 @ =DoubleBattleColosseum_EventScript_1A439E
	cmp r1, r0
	beq _08055B20
	ldr r0, _08055AEC @ =gUnknown_081A43B9
	cmp r1, r0
	beq _08055ADE
	ldr r0, _08055AF0 @ =DoubleBattleColosseum_EventScript_1A43D4
	cmp r1, r0
	beq _08055B20
	ldr r0, _08055AF4 @ =gUnknown_081A4418
	cmp r1, r0
	beq _08055ADE
	ldr r0, _08055AF8 @ =gUnknown_081A442D
	cmp r1, r0
	beq _08055B20
	ldr r0, _08055AFC @ =gUnknown_081A4442
	cmp r1, r0
	beq _08055ADE
	ldr r0, _08055B00 @ =RecordCorner_EventScript_1A4457
	cmp r1, r0
	beq _08055B20
	ldr r0, _08055B04 @ =SingleBattleColosseum_EventScript_1A436F
	cmp r1, r0
	beq _08055ADE
	ldr r0, _08055B08 @ =SingleBattleColosseum_EventScript_1A4379
	cmp r1, r0
	beq _08055B20
	ldr r0, _08055B0C @ =TradeCenter_EventScript_1A43F0
	cmp r1, r0
	bne _08055B10
_08055ADE:
	movs r0, 0xA
	b _08055B22
	.align 2, 0
_08055AE4: .4byte DoubleBattleColosseum_EventScript_1A4383
_08055AE8: .4byte DoubleBattleColosseum_EventScript_1A439E
_08055AEC: .4byte gUnknown_081A43B9
_08055AF0: .4byte DoubleBattleColosseum_EventScript_1A43D4
_08055AF4: .4byte gUnknown_081A4418
_08055AF8: .4byte gUnknown_081A442D
_08055AFC: .4byte gUnknown_081A4442
_08055B00: .4byte RecordCorner_EventScript_1A4457
_08055B04: .4byte SingleBattleColosseum_EventScript_1A436F
_08055B08: .4byte SingleBattleColosseum_EventScript_1A4379
_08055B0C: .4byte TradeCenter_EventScript_1A43F0
_08055B10:
	ldr r0, _08055B1C @ =gUnknown_081A43FA
	cmp r1, r0
	beq _08055B20
	movs r0, 0
	b _08055B22
	.align 2, 0
_08055B1C: .4byte gUnknown_081A43FA
_08055B20:
	movs r0, 0x9
_08055B22:
	pop {r1}
	bx r1
	thumb_func_end sub_8055758

	thumb_func_start sub_80557E8
sub_80557E8: @ 8055B28
	push {lr}
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_80557E8

	thumb_func_start sub_80557F4
sub_80557F4: @ 8055B34
	push {lr}
	movs r0, 0x6
	bl PlaySE
	bl sub_8071310
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_80557F4

	thumb_func_start sub_8055808
sub_8055808: @ 8055B48
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8055808

	thumb_func_start sub_8055824
sub_8055824: @ 8055B64
	push {lr}
	movs r0, 0x6
	bl PlaySE
	ldr r0, _08055B7C @ =gUnknown_081A44E5
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08055B7C: .4byte gUnknown_081A44E5
	thumb_func_end sub_8055824

	thumb_func_start sub_8055840
sub_8055840: @ 8055B80
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8055840

	thumb_func_start sub_805585C
sub_805585C: @ 8055B9C
	push {lr}
	ldr r0, _08055BAC @ =gUnknown_081A44FE
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08055BAC: .4byte gUnknown_081A44FE
	thumb_func_end sub_805585C

	thumb_func_start sub_8055870
sub_8055870: @ 8055BB0
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08055BBE
	movs r0, 0
	b _08055BE4
_08055BBE:
	ldr r0, _08055BD0 @ =gLink
	ldr r1, _08055BD4 @ =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _08055BDC
	ldr r1, _08055BD8 @ =gUnknown_03000588
	movs r0, 0x1
	b _08055BE0
	.align 2, 0
_08055BD0: .4byte gLink
_08055BD4: .4byte 0x00000fbd
_08055BD8: .4byte gUnknown_03000588
_08055BDC:
	ldr r1, _08055BE8 @ =gUnknown_03000588
	movs r0, 0
_08055BE0:
	strb r0, [r1]
	ldrb r0, [r1]
_08055BE4:
	pop {r1}
	bx r1
	.align 2, 0
_08055BE8: .4byte gUnknown_03000588
	thumb_func_end sub_8055870

	thumb_func_start sub_80558AC
sub_80558AC: @ 8055BEC
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08055C48
	bl sub_8007B24
	cmp r0, 0x1
	bne _08055C48
	ldr r0, _08055C34 @ =gUnknown_03000584
	ldr r1, [r0]
	ldr r0, _08055C38 @ =sub_8055408
	cmp r1, r0
	beq _08055C30
	ldr r0, _08055C3C @ =sub_80553E4
	cmp r1, r0
	bne _08055C48
	ldr r0, _08055C40 @ =gUnknown_03000588
	ldrb r2, [r0]
	movs r1, 0
	strb r1, [r0]
	cmp r2, 0x1
	beq _08055C30
	ldr r2, _08055C44 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08055C48
	ldrb r1, [r2, 0xA]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08055C48
_08055C30:
	movs r0, 0x1
	b _08055C4A
	.align 2, 0
_08055C34: .4byte gUnknown_03000584
_08055C38: .4byte sub_8055408
_08055C3C: .4byte sub_80553E4
_08055C40: .4byte gUnknown_03000588
_08055C44: .4byte gPaletteFade
_08055C48:
	movs r0, 0
_08055C4A:
	pop {r1}
	bx r1
	thumb_func_end sub_80558AC

	thumb_func_start sub_8055910
sub_8055910: @ 8055C50
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08055C6C
	bl sub_8007B24
	cmp r0, 0x1
	bne _08055C6C
	ldr r0, _08055C70 @ =gUnknown_03000584
	ldr r1, [r0]
	ldr r0, _08055C74 @ =sub_8055438
	cmp r1, r0
	beq _08055C78
_08055C6C:
	movs r0, 0
	b _08055C7A
	.align 2, 0
_08055C70: .4byte gUnknown_03000584
_08055C74: .4byte sub_8055438
_08055C78:
	movs r0, 0x1
_08055C7A:
	pop {r1}
	bx r1
	thumb_func_end sub_8055910

	thumb_func_start sub_8055940
sub_8055940: @ 8055C80
	push {lr}
	bl sub_8007B24
	cmp r0, 0
	beq _08055C8E
	movs r0, 0x1
	b _08055C90
_08055C8E:
	movs r0, 0
_08055C90:
	pop {r1}
	bx r1
	thumb_func_end sub_8055940

	thumb_func_start ZeroLinkPlayerMapObject
ZeroLinkPlayerMapObject: @ 8055C94
	movs r1, 0
	str r1, [r0]
	bx lr
	thumb_func_end ZeroLinkPlayerMapObject

	thumb_func_start strange_npc_table_clear
strange_npc_table_clear: @ 8055C9C
	push {lr}
	ldr r0, _08055CAC @ =gLinkPlayerMapObjects
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08055CAC: .4byte gLinkPlayerMapObjects
	thumb_func_end strange_npc_table_clear

	thumb_func_start ZeroMapObject
ZeroMapObject: @ 8055CB0
	push {lr}
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	thumb_func_end ZeroMapObject

	thumb_func_start SpawnLinkPlayerMapObject
SpawnLinkPlayerMapObject: @ 8055CC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r1
	mov r10, r2
	mov r8, r3
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	bl sub_805AB54
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, r7, 2
	ldr r0, _08055D64 @ =gLinkPlayerMapObjects
	adds r4, r0
	lsls r5, r6, 3
	adds r5, r6
	lsls r5, 2
	ldr r0, _08055D68 @ =gMapObjects
	adds r5, r0
	adds r0, r4, 0
	bl ZeroLinkPlayerMapObject
	adds r0, r5, 0
	bl ZeroMapObject
	movs r2, 0
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r4]
	strb r7, [r4, 0x1]
	strb r6, [r4, 0x2]
	strb r2, [r4, 0x3]
	ldrb r0, [r5]
	orrs r0, r1
	mov r2, r8
	ands r2, r1
	lsls r2, 1
	movs r1, 0x3
	negs r1, r1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x19]
	movs r0, 0x40
	strb r0, [r5, 0x4]
	mov r0, r9
	lsls r0, 16
	asrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	adds r0, r5, 0
	mov r1, r9
	mov r2, r10
	bl InitLinkPlayerMapObjectPos
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055D64: .4byte gLinkPlayerMapObjects
_08055D68: .4byte gMapObjects
	thumb_func_end SpawnLinkPlayerMapObject

	thumb_func_start InitLinkPlayerMapObjectPos
InitLinkPlayerMapObjectPos: @ 8055D6C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0xC
	adds r3, r4, 0
	adds r3, 0xE
	bl sub_80603CC
	ldrh r0, [r4, 0xC]
	adds r0, 0x8
	strh r0, [r4, 0xC]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoord
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InitLinkPlayerMapObjectPos

	thumb_func_start unref_sub_8055A6C
unref_sub_8055A6C: @ 8055DAC
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _08055DD4 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08055DCE
	ldrb r0, [r1, 0x2]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08055DD8 @ =gMapObjects
	adds r1, r0
	strb r2, [r1, 0x19]
_08055DCE:
	pop {r0}
	bx r0
	.align 2, 0
_08055DD4: .4byte gLinkPlayerMapObjects
_08055DD8: .4byte gMapObjects
	thumb_func_end unref_sub_8055A6C

	thumb_func_start unref_sub_8055A9C
unref_sub_8055A9C: @ 8055DDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08055E1C @ =gLinkPlayerMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055E20 @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x40
	beq _08055E08
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055E24 @ =gSprites
	adds r0, r1
	bl DestroySprite
_08055E08:
	movs r0, 0
	strb r0, [r5]
	ldrb r1, [r4]
	subs r0, 0x2
	ands r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055E1C: .4byte gLinkPlayerMapObjects
_08055E20: .4byte gMapObjects
_08055E24: .4byte gSprites
	thumb_func_end unref_sub_8055A9C

	thumb_func_start sub_8055AE8
sub_8055AE8: @ 8055E28
	lsls r0, 24
	ldr r1, _08055E40 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055E44 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_08055E40: .4byte gLinkPlayerMapObjects
_08055E44: .4byte gMapObjects
	thumb_func_end sub_8055AE8

	thumb_func_start sub_8055B08
sub_8055B08: @ 8055E48
	lsls r0, 24
	ldr r3, _08055E68 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r3
	ldrb r3, [r0, 0x2]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _08055E6C @ =gMapObjects
	adds r0, r3
	ldrh r3, [r0, 0x10]
	strh r3, [r1]
	ldrh r0, [r0, 0x12]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08055E68: .4byte gLinkPlayerMapObjects
_08055E6C: .4byte gMapObjects
	thumb_func_end sub_8055B08

	thumb_func_start sub_8055B30
sub_8055B30: @ 8055E70
	lsls r0, 24
	ldr r1, _08055E88 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055E8C @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x19]
	bx lr
	.align 2, 0
_08055E88: .4byte gLinkPlayerMapObjects
_08055E8C: .4byte gMapObjects
	thumb_func_end sub_8055B30

	thumb_func_start sub_8055B50
sub_8055B50: @ 8055E90
	lsls r0, 24
	ldr r1, _08055EAC @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055EB0 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08055EAC: .4byte gLinkPlayerMapObjects
_08055EB0: .4byte gMapObjects
	thumb_func_end sub_8055B50

	thumb_func_start unref_sub_8055B74
unref_sub_8055B74: @ 8055EB4
	lsls r0, 24
	ldr r1, _08055ED4 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055ED8 @ =gMapObjects
	adds r0, r1
	adds r0, 0x21
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x10
	subs r0, r1
	bx lr
	.align 2, 0
_08055ED4: .4byte gLinkPlayerMapObjects
_08055ED8: .4byte gMapObjects
	thumb_func_end unref_sub_8055B74

	thumb_func_start GetLinkPlayerIdAt
GetLinkPlayerIdAt: @ 8055EDC
	push {r4-r6,lr}
	movs r2, 0
	ldr r5, _08055F20 @ =gLinkPlayerMapObjects
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r3, r1, 16
_08055EEA:
	lsls r0, r2, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	beq _08055F28
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08055EFE
	cmp r0, 0x2
	bne _08055F28
_08055EFE:
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055F24 @ =gMapObjects
	adds r1, r0, r1
	movs r6, 0x10
	ldrsh r0, [r1, r6]
	cmp r0, r4
	bne _08055F28
	movs r6, 0x12
	ldrsh r0, [r1, r6]
	cmp r0, r3
	bne _08055F28
	adds r0, r2, 0
	b _08055F34
	.align 2, 0
_08055F20: .4byte gLinkPlayerMapObjects
_08055F24: .4byte gMapObjects
_08055F28:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08055EEA
	movs r0, 0x4
_08055F34:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLinkPlayerIdAt

	thumb_func_start sub_8055BFC
sub_8055BFC: @ 8055F3C
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	adds r2, r3, 0
	lsrs r0, 22
	ldr r1, _08055F6C @ =gLinkPlayerMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055F70 @ =gMapObjects
	adds r6, r0, r1
	ldrb r0, [r5]
	cmp r0, 0
	beq _08055F98
	cmp r3, 0xA
	bls _08055F74
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	b _08055F98
	.align 2, 0
_08055F6C: .4byte gLinkPlayerMapObjects
_08055F70: .4byte gMapObjects
_08055F74:
	ldr r4, _08055FA0 @ =gUnknown_082166D8
	ldr r1, _08055FA4 @ =gUnknown_082166A0
	ldrb r0, [r5, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r2, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl _call_via_r2
_08055F98:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055FA0: .4byte gUnknown_082166D8
_08055FA4: .4byte gUnknown_082166A0
	thumb_func_end sub_8055BFC

	thumb_func_start sub_8055C68
sub_8055C68: @ 8055FA8
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08055FC4 @ =gUnknown_082166AC
	lsls r3, r2, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055FC4: .4byte gUnknown_082166AC
	thumb_func_end sub_8055C68

	thumb_func_start sub_8055C88
sub_8055C88: @ 8055FC8
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8055C88

	thumb_func_start sub_8055C8C
sub_8055C8C: @ 8055FCC
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08055FE8 @ =gUnknown_082166AC
	lsls r3, r2, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055FE8: .4byte gUnknown_082166AC
	thumb_func_end sub_8055C8C

	thumb_func_start sub_8055CAC
sub_8055CAC: @ 8055FEC
	movs r0, 0
	bx lr
	thumb_func_end sub_8055CAC

	thumb_func_start sub_8055CB0
sub_8055CB0: @ 8055FF0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x19]
	bl npc_something3
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x19]
	mov r6, sp
	adds r6, 0x2
	adds r0, r5, 0
	mov r2, sp
	adds r3, r6, 0
	bl FieldObjectMoveDestCoords
	ldrb r0, [r4, 0x2]
	ldrb r1, [r5, 0x19]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r4, 0
	ldrsh r3, [r6, r4]
	bl LinkPlayerDetectCollision
	lsls r0, 24
	cmp r0, 0
	bne _0805604E
	adds r1, r5, 0
	adds r1, 0x21
	movs r0, 0x10
	strb r0, [r1]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r3, 0
	ldrsh r2, [r6, r3]
	adds r0, r5, 0
	bl npc_coords_shift
	adds r0, r5, 0
	bl FieldObjectUpdateZCoord
	movs r0, 0x1
	b _08056050
_0805604E:
	movs r0, 0
_08056050:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8055CB0

	thumb_func_start sub_8055D18
sub_8055D18: @ 8056058
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x19]
	bl npc_something3
	strb r0, [r4, 0x19]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055D18

	thumb_func_start sub_8055D30
sub_8055D30: @ 8056070
	movs r1, 0
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end sub_8055D30

	thumb_func_start sub_8055D38
sub_8055D38: @ 8056078
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r4, 0
	adds r5, 0x21
	ldrb r0, [r5]
	subs r0, 0x1
	strb r0, [r5]
	movs r0, 0x1
	strb r0, [r6, 0x3]
	ldrb r0, [r4, 0x19]
	adds r1, 0xC
	adds r2, r4, 0
	adds r2, 0xE
	bl MoveCoords
	ldrb r0, [r5]
	cmp r0, 0
	bne _080560A8
	adds r0, r4, 0
	bl npc_coords_shift_still
	movs r0, 0x2
	strb r0, [r6, 0x3]
_080560A8:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8055D38

	thumb_func_start npc_something3
npc_something3: @ 80560B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _08056108
	lsls r0, 2
	ldr r1, _080560CC @ =_080560D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080560CC: .4byte _080560D0
	.align 2, 0
_080560D0:
	.4byte _080560F8
	.4byte _080560FC
	.4byte _08056100
	.4byte _08056104
	.4byte _08056108
	.4byte _08056108
	.4byte _080560F8
	.4byte _080560FC
	.4byte _08056100
	.4byte _08056104
_080560F8:
	movs r0, 0x2
	b _0805610A
_080560FC:
	movs r0, 0x1
	b _0805610A
_08056100:
	movs r0, 0x3
	b _0805610A
_08056104:
	movs r0, 0x4
	b _0805610A
_08056108:
	adds r0, r2, 0
_0805610A:
	pop {r1}
	bx r1
	thumb_func_end npc_something3

	thumb_func_start LinkPlayerDetectCollision
LinkPlayerDetectCollision: @ 8056110
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r3, 16
	movs r4, 0
	ldr r0, _08056174 @ =gMapObjects
	mov r9, r0
	lsrs r2, r3, 16
	mov r10, r2
	asrs r6, r3, 16
_08056134:
	mov r7, r12
	lsls r3, r7, 16
	mov r0, r10
	lsls r5, r0, 16
	cmp r4, r8
	beq _08056178
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	asrs r2, r3, 16
	cmp r0, r2
	bne _0805615C
	movs r7, 0x12
	ldrsh r0, [r1, r7]
	cmp r0, r6
	beq _0805616E
_0805615C:
	movs r7, 0x14
	ldrsh r0, [r1, r7]
	cmp r0, r2
	bne _08056178
	movs r0, 0x16
	ldrsh r1, [r1, r0]
	asrs r0, r5, 16
	cmp r1, r0
	bne _08056178
_0805616E:
	movs r0, 0x1
	b _0805618E
	.align 2, 0
_08056174: .4byte gMapObjects
_08056178:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08056134
	asrs r0, r3, 16
	asrs r1, r5, 16
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
_0805618E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LinkPlayerDetectCollision

	thumb_func_start CreateLinkPlayerSprite
CreateLinkPlayerSprite: @ 805619C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, r5, 2
	ldr r0, _08056208 @ =gLinkPlayerMapObjects
	adds r2, r0
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805620C @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	beq _080561FE
	ldrb r1, [r4]
	lsls r1, 30
	lsrs r1, 31
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08056210 @ =SpriteCB_LinkPlayer
	movs r2, 0
	str r2, [sp]
	movs r3, 0
	bl AddPseudoFieldObject
	strb r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08056214 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, 0x2E]
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_080561FE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056208: .4byte gLinkPlayerMapObjects
_0805620C: .4byte gMapObjects
_08056210: .4byte SpriteCB_LinkPlayer
_08056214: .4byte gSprites
	thumb_func_end CreateLinkPlayerSprite

	thumb_func_start SpriteCB_LinkPlayer
SpriteCB_LinkPlayer: @ 8056218
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 2
	ldr r0, _0805627C @ =gLinkPlayerMapObjects
	adds r4, r0
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08056280 @ =gMapObjects
	adds r6, r0, r1
	ldrh r0, [r6, 0xC]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0xE]
	strh r0, [r5, 0x22]
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	adds r1, r5, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	bl ZCoordToPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	ldrb r0, [r4, 0x3]
	cmp r0, 0
	bne _08056284
	ldrb r0, [r6, 0x19]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	b _08056296
	.align 2, 0
_0805627C: .4byte gLinkPlayerMapObjects
_08056280: .4byte gMapObjects
_08056284:
	ldrb r0, [r6, 0x19]
	bl get_go_image_anim_num
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
_08056296:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrb r0, [r6]
	lsls r0, 29
	cmp r0, 0
	bge _080562C8
	ldrh r0, [r5, 0x3C]
	movs r1, 0x4
	ands r1, r0
	lsls r1, 16
	adds r3, r5, 0
	adds r3, 0x3E
	lsrs r1, 18
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_080562C8:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_LinkPlayer

	.align 2, 0 @ Don't pad with nop.
