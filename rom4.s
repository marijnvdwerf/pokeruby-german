	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8052F5C
sub_8052F5C: @ 8052F5C
	push {lr}
	ldr r0, _08052F88 @ =gUnknown_0819FC74
	bl ScriptContext2_RunNewScript
	ldr r1, _08052F8C @ =gSaveBlock1
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
_08052F88: .4byte gUnknown_0819FC74
_08052F8C: .4byte gSaveBlock1
	thumb_func_end sub_8052F5C

	thumb_func_start flag_var_implications_of_teleport_
flag_var_implications_of_teleport_: @ 8052F90
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _08052FB8 @ =0x0000082b
	bl FlagReset
	ldr r0, _08052FBC @ =0x0000082d
	bl FlagReset
	ldr r0, _08052FC0 @ =0x0000082c
	bl FlagReset
	ldr r0, _08052FC4 @ =0x00000829
	bl FlagReset
	ldr r0, _08052FC8 @ =0x00000828
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08052FB8: .4byte 0x0000082b
_08052FBC: .4byte 0x0000082d
_08052FC0: .4byte 0x0000082c
_08052FC4: .4byte 0x00000829
_08052FC8: .4byte 0x00000828
	thumb_func_end flag_var_implications_of_teleport_

	thumb_func_start new_game
new_game: @ 8052FCC
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _08052FFC @ =0x0000082b
	bl FlagReset
	ldr r0, _08053000 @ =0x0000082d
	bl FlagReset
	ldr r0, _08053004 @ =0x0000082c
	bl FlagReset
	ldr r0, _08053008 @ =0x00000829
	bl FlagReset
	ldr r0, _0805300C @ =0x00000828
	bl FlagReset
	ldr r0, _08053010 @ =gUnknown_0819FC9F
	bl ScriptContext2_RunNewScript
	pop {r0}
	bx r0
	.align 2, 0
_08052FFC: .4byte 0x0000082b
_08053000: .4byte 0x0000082d
_08053004: .4byte 0x0000082c
_08053008: .4byte 0x00000829
_0805300C: .4byte 0x00000828
_08053010: .4byte gUnknown_0819FC9F
	thumb_func_end new_game

	thumb_func_start sub_8053014
sub_8053014: @ 8053014
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _0805303C @ =0x0000082b
	bl FlagReset
	ldr r0, _08053040 @ =0x0000082d
	bl FlagReset
	ldr r0, _08053044 @ =0x0000082c
	bl FlagReset
	ldr r0, _08053048 @ =0x00000829
	bl FlagReset
	ldr r0, _0805304C @ =0x00000828
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0805303C: .4byte 0x0000082b
_08053040: .4byte 0x0000082d
_08053044: .4byte 0x0000082c
_08053048: .4byte 0x00000829
_0805304C: .4byte 0x00000828
	thumb_func_end sub_8053014

	thumb_func_start sub_8053050
sub_8053050: @ 8053050
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _08053078 @ =0x0000082b
	bl FlagReset
	ldr r0, _0805307C @ =0x0000082d
	bl FlagReset
	ldr r0, _08053080 @ =0x0000082c
	bl FlagReset
	ldr r0, _08053084 @ =0x00000829
	bl FlagReset
	ldr r0, _08053088 @ =0x00000828
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08053078: .4byte 0x0000082b
_0805307C: .4byte 0x0000082d
_08053080: .4byte 0x0000082c
_08053084: .4byte 0x00000829
_08053088: .4byte 0x00000828
	thumb_func_end sub_8053050

	thumb_func_start sub_805308C
sub_805308C: @ 805308C
	push {lr}
	ldr r0, _080530A8 @ =0x0000082c
	bl FlagReset
	bl sub_8054164
	bl ResetCyclingRoadChallengeData
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134348
	pop {r0}
	bx r0
	.align 2, 0
_080530A8: .4byte 0x0000082c
	thumb_func_end sub_805308C

	thumb_func_start sub_80530AC
sub_80530AC: @ 80530AC
	push {lr}
	ldr r0, _080530C8 @ =gSaveBlock1
	movs r2, 0
	movs r1, 0x31
	ldr r3, _080530CC @ =0x00001604
	adds r0, r3
_080530B8:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080530B8
	pop {r0}
	bx r0
	.align 2, 0
_080530C8: .4byte gSaveBlock1
_080530CC: .4byte 0x00001604
	thumb_func_end sub_80530AC

	thumb_func_start sav12_xor_increment
sav12_xor_increment: @ 80530D0
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _08053100
	ldr r0, _080530F4 @ =gSaveBlock1
	lsls r1, 2
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2
	adds r1, r0
	ldr r2, [r1]
	ldr r0, _080530F8 @ =0x00fffffe
	cmp r2, r0
	bhi _080530FC
	adds r0, r2, 0x1
	b _080530FE
	.align 2, 0
_080530F4: .4byte gSaveBlock1
_080530F8: .4byte 0x00fffffe
_080530FC:
	ldr r0, _08053104 @ =0x00ffffff
_080530FE:
	str r0, [r1]
_08053100:
	pop {r0}
	bx r0
	.align 2, 0
_08053104: .4byte 0x00ffffff
	thumb_func_end sav12_xor_increment

	thumb_func_start sub_8053108
sub_8053108: @ 8053108
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _08053128
	ldr r0, _08053124 @ =gSaveBlock1
	lsls r1, 2
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2
	adds r1, r0
	ldr r0, [r1]
	b _0805312A
	.align 2, 0
_08053124: .4byte gSaveBlock1
_08053128:
	movs r0, 0
_0805312A:
	pop {r1}
	bx r1
	thumb_func_end sub_8053108

	thumb_func_start sav12_xor_set
sav12_xor_set: @ 8053130
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _0805314A
	ldr r0, _08053150 @ =gSaveBlock1
	lsls r1, 2
	movs r3, 0xAA
	lsls r3, 5
	adds r0, r3
	adds r1, r0
	str r2, [r1]
_0805314A:
	pop {r0}
	bx r0
	.align 2, 0
_08053150: .4byte gSaveBlock1
	thumb_func_end sav12_xor_set

	thumb_func_start sub_8053154
sub_8053154: @ 8053154
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r4, _0805318C @ =gSaveBlock1 + 0xC20
	ldr r2, _08053190 @ =0x05000180
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08053194 @ =gMapHeader
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
_0805318C: .4byte gSaveBlock1 + 0xC20
_08053190: .4byte 0x05000180
_08053194: .4byte gMapHeader
	thumb_func_end sub_8053154

	thumb_func_start sub_8053198
sub_8053198: @ 8053198
	push {lr}
	ldr r0, _080531B8 @ =gMapHeader
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x4]
	ldr r3, _080531BC @ =gSaveBlock1 + 0xC20
	movs r2, 0x3F
_080531A4:
	ldr r0, [r1, 0x10]
	str r0, [r3, 0x10]
	adds r1, 0x18
	adds r3, 0x18
	subs r2, 0x1
	cmp r2, 0
	bge _080531A4
	pop {r0}
	bx r0
	.align 2, 0
_080531B8: .4byte gMapHeader
_080531BC: .4byte gSaveBlock1 + 0xC20
	thumb_func_end sub_8053198

	thumb_func_start update_saveblock1_field_object_coords
update_saveblock1_field_object_coords: @ 80531C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r3, _080531E0 @ =gSaveBlock1 + 0xC20
_080531D2:
	ldrb r0, [r3]
	cmp r0, r5
	bne _080531E4
	strh r4, [r3, 0x4]
	strh r2, [r3, 0x6]
	b _080531EC
	.align 2, 0
_080531E0: .4byte gSaveBlock1 + 0xC20
_080531E4:
	adds r3, 0x18
	adds r1, 0x1
	cmp r1, 0x3F
	ble _080531D2
_080531EC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end update_saveblock1_field_object_coords

	thumb_func_start update_saveblock1_field_object_movement_behavior
update_saveblock1_field_object_movement_behavior: @ 80531F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	ldr r2, _0805320C @ =gSaveBlock1 + 0xC20
_08053202:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08053210
	strb r1, [r2, 0x9]
	b _08053218
	.align 2, 0
_0805320C: .4byte gSaveBlock1 + 0xC20
_08053210:
	adds r2, 0x18
	adds r3, 0x1
	cmp r3, 0x3F
	ble _08053202
_08053218:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end update_saveblock1_field_object_movement_behavior

	thumb_func_start mapdata_load_assets_to_gpu_and_full_redraw
mapdata_load_assets_to_gpu_and_full_redraw: @ 8053220
	push {r4,lr}
	bl move_tilemap_camera_to_upper_left_corner
	ldr r4, _08053244 @ =gMapHeader
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
_08053244: .4byte gMapHeader
	thumb_func_end mapdata_load_assets_to_gpu_and_full_redraw

	thumb_func_start get_mapdata_header
get_mapdata_header: @ 8053248
	push {lr}
	ldr r0, _08053258 @ =gSaveBlock1
	ldrh r1, [r0, 0x32]
	cmp r1, 0
	bne _0805325C
	movs r0, 0
	b _08053266
	.align 2, 0
_08053258: .4byte gSaveBlock1
_0805325C:
	ldr r0, _0805326C @ =gMapAttributes
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_08053266:
	pop {r1}
	bx r1
	.align 2, 0
_0805326C: .4byte gMapAttributes
	thumb_func_end get_mapdata_header

	thumb_func_start warp_shift
warp_shift: @ 8053270
	ldr r2, _0805329C @ =gUnknown_020297F0
	ldr r3, _080532A0 @ =gSaveBlock1
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080532A4 @ =gUnknown_020297F8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r3, 0x4]
	str r1, [r3, 0x8]
	ldr r2, _080532A8 @ =gUnknown_02029800
	ldr r0, _080532AC @ =gDummyWarpData
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r2, _080532B0 @ =gUnknown_02029808
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_0805329C: .4byte gUnknown_020297F0
_080532A0: .4byte gSaveBlock1
_080532A4: .4byte gUnknown_020297F8
_080532A8: .4byte gUnknown_02029800
_080532AC: .4byte gDummyWarpData
_080532B0: .4byte gUnknown_02029808
	thumb_func_end warp_shift

	thumb_func_start warp_set
warp_set: @ 80532B4
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
warp_data_is_not_neg_1: @ 80532D4
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08053308
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08053308
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	cmp r2, r0
	bne _08053308
	movs r0, 0x4
	ldrsh r3, [r1, r0]
	cmp r3, r2
	bne _08053308
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bne _08053308
	movs r0, 0x1
	b _0805330A
_08053308:
	movs r0, 0
_0805330A:
	pop {r1}
	bx r1
	thumb_func_end warp_data_is_not_neg_1

	thumb_func_start get_mapheader_by_bank_and_number
get_mapheader_by_bank_and_number: @ 8053310
	lsls r0, 16
	lsls r1, 16
	ldr r2, _08053324 @ =gMapGroups
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08053324: .4byte gMapGroups
	thumb_func_end get_mapheader_by_bank_and_number

	thumb_func_start warp1_get_mapheader
warp1_get_mapheader: @ 8053328
	push {lr}
	ldr r1, _08053348 @ =gUnknown_020297F8
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
_08053348: .4byte gUnknown_020297F8
	thumb_func_end warp1_get_mapheader

	thumb_func_start set_current_map_header_from_sav1_save_old_name
set_current_map_header_from_sav1_save_old_name: @ 805334C
	push {r4-r6,lr}
	ldr r5, _08053384 @ =gMapHeader
	ldr r4, _08053388 @ =gSaveBlock1
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
_08053384: .4byte gMapHeader
_08053388: .4byte gSaveBlock1
	thumb_func_end set_current_map_header_from_sav1_save_old_name

	thumb_func_start sub_805338C
sub_805338C: @ 805338C
	push {r4,r5,lr}
	ldr r4, _080533C4 @ =gMapHeader
	ldr r1, _080533C8 @ =gSaveBlock1
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
_080533C4: .4byte gMapHeader
_080533C8: .4byte gSaveBlock1
	thumb_func_end sub_805338C

	thumb_func_start sub_80533CC
sub_80533CC: @ 80533CC
	push {r4,lr}
	ldr r0, _080533FC @ =gSaveBlock1
	movs r1, 0x6
	ldrsb r1, [r0, r1]
	adds r3, r0, 0
	cmp r1, 0
	blt _08053404
	movs r1, 0x6
	ldrsb r1, [r3, r1]
	ldr r0, _08053400 @ =gMapHeader
	ldr r2, [r0, 0x4]
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bge _08053404
	ldr r0, [r2, 0x8]
	lsls r1, 3
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r3]
	ldr r0, [r2, 0x8]
	adds r1, r0
	ldrh r0, [r1, 0x2]
	b _08053434
	.align 2, 0
_080533FC: .4byte gSaveBlock1
_08053400: .4byte gMapHeader
_08053404:
	ldrh r2, [r3, 0x8]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	blt _0805341E
	ldrh r1, [r3, 0xA]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	cmp r0, 0
	blt _0805341E
	strh r2, [r3]
	strh r1, [r3, 0x2]
	b _08053436
_0805341E:
	ldr r0, _0805343C @ =gMapHeader
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
_08053434:
	strh r0, [r3, 0x2]
_08053436:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805343C: .4byte gMapHeader
	thumb_func_end sub_80533CC

	thumb_func_start warp_in
warp_in: @ 8053440
	push {lr}
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_80533CC
	pop {r0}
	bx r0
	thumb_func_end warp_in

	thumb_func_start warp1_set
warp1_set: @ 8053454
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _0805348C @ =gUnknown_020297F8
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
_0805348C: .4byte gUnknown_020297F8
	thumb_func_end warp1_set

	thumb_func_start warp1_set_2
warp1_set_2: @ 8053490
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
saved_warp2_set: @ 80534B0
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080534E8 @ =gSaveBlock1 + 0x14
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
_080534E8: .4byte gSaveBlock1 + 0x14
	thumb_func_end saved_warp2_set

	thumb_func_start saved_warp2_set_2
saved_warp2_set_2: @ 80534EC
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r0, _0805351C @ =gSaveBlock1 + 0x14
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
_0805351C: .4byte gSaveBlock1 + 0x14
	thumb_func_end saved_warp2_set_2

	thumb_func_start copy_saved_warp2_bank_and_enter_x_to_warp1
copy_saved_warp2_bank_and_enter_x_to_warp1: @ 8053520
	ldr r2, _08053530 @ =gUnknown_020297F8
	ldr r0, _08053534 @ =gSaveBlock1
	ldr r1, [r0, 0x18]
	ldr r0, [r0, 0x14]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053530: .4byte gUnknown_020297F8
_08053534: .4byte gSaveBlock1
	thumb_func_end copy_saved_warp2_bank_and_enter_x_to_warp1

	thumb_func_start sub_8053538
sub_8053538: @ 8053538
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocation
	adds r4, r0, 0
	cmp r4, 0
	beq _08053566
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
_08053566:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053538

	thumb_func_start sub_8053570
sub_8053570: @ 8053570
	ldr r2, _08053580 @ =gUnknown_020297F8
	ldr r0, _08053584 @ =gSaveBlock1
	ldr r1, [r0, 0x20]
	ldr r0, [r0, 0x1C]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053580: .4byte gUnknown_020297F8
_08053584: .4byte gSaveBlock1
	thumb_func_end sub_8053570

	thumb_func_start sub_8053588
sub_8053588: @ 8053588
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocation
	adds r5, r0, 0
	cmp r5, 0
	beq _080535B8
	ldr r0, _080535C0 @ =gSaveBlock1 + 0x1C
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
_080535B8:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080535C0: .4byte gSaveBlock1 + 0x1C
	thumb_func_end sub_8053588

	thumb_func_start sub_80535C4
sub_80535C4: @ 80535C4
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
	ldr r1, _08053634 @ =gUnknown_020297F8
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
	beq _0805362A
	adds r0, r5, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805362A
	ldr r1, _08053638 @ =gSaveBlock1
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
_0805362A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053634: .4byte gUnknown_020297F8
_08053638: .4byte gSaveBlock1
	thumb_func_end sub_80535C4

	thumb_func_start sub_805363C
sub_805363C: @ 805363C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08053674 @ =gSaveBlock1 + 0x24
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
_08053674: .4byte gSaveBlock1 + 0x24
	thumb_func_end sub_805363C

	thumb_func_start sub_8053678
sub_8053678: @ 8053678
	ldr r2, _08053688 @ =gUnknown_020297F8
	ldr r0, _0805368C @ =gSaveBlock1
	ldr r1, [r0, 0x28]
	ldr r0, [r0, 0x24]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053688: .4byte gUnknown_020297F8
_0805368C: .4byte gSaveBlock1
	thumb_func_end sub_8053678

	thumb_func_start sub_8053690
sub_8053690: @ 8053690
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080536C8 @ =gUnknown_02029800
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
_080536C8: .4byte gUnknown_02029800
	thumb_func_end sub_8053690

	thumb_func_start warp1_set_to_warp2
warp1_set_to_warp2: @ 80536CC
	ldr r2, _080536DC @ =gUnknown_020297F8
	ldr r0, _080536E0 @ =gUnknown_02029800
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080536DC: .4byte gUnknown_020297F8
_080536E0: .4byte gUnknown_02029800
	thumb_func_end warp1_set_to_warp2

	thumb_func_start sub_80536E4
sub_80536E4: @ 80536E4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _0805371C @ =gUnknown_02029808
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
_0805371C: .4byte gUnknown_02029808
	thumb_func_end sub_80536E4

	thumb_func_start sub_8053720
sub_8053720: @ 8053720
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r4, _08053748 @ =gUnknown_02029808
	adds r0, r4, 0
	bl warp_data_is_not_neg_1
	cmp r0, 0x1
	bne _08053754
	ldr r2, _0805374C @ =gUnknown_020297F8
	ldr r0, _08053750 @ =gUnknown_020297F0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	b _0805376E
	.align 2, 0
_08053748: .4byte gUnknown_02029808
_0805374C: .4byte gUnknown_020297F8
_08053750: .4byte gUnknown_020297F0
_08053754:
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
_0805376E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8053720

	thumb_func_start sub_8053778
sub_8053778: @ 8053778
	ldr r2, _08053788 @ =gUnknown_020297F8
	ldr r0, _0805378C @ =gSaveBlock1
	ldr r1, [r0, 0x10]
	ldr r0, [r0, 0xC]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053788: .4byte gUnknown_020297F8
_0805378C: .4byte gSaveBlock1
	thumb_func_end sub_8053778

	thumb_func_start unref_sub_8053790
unref_sub_8053790: @ 8053790
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080537C8 @ =gSaveBlock1 + 0xC
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
_080537C8: .4byte gSaveBlock1 + 0xC
	thumb_func_end unref_sub_8053790

	thumb_func_start sub_80537CC
sub_80537CC: @ 80537CC
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl GetHealLocation
	adds r5, r0, 0
	cmp r5, 0
	beq _080537FC
	ldr r0, _08053804 @ =gSaveBlock1 + 0xC
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
_080537FC:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053804: .4byte gSaveBlock1 + 0xC
	thumb_func_end sub_80537CC

	thumb_func_start gpu_sync_bg_hide
gpu_sync_bg_hide: @ 8053808
	ldr r2, _08053814 @ =gSaveBlock1
	ldr r0, [r2, 0x14]
	ldr r1, [r2, 0x18]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	bx lr
	.align 2, 0
_08053814: .4byte gSaveBlock1
	thumb_func_end gpu_sync_bg_hide

	thumb_func_start sub_8053818
sub_8053818: @ 8053818
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0805382C @ =gMapHeader
	ldr r0, [r0, 0xC]
	ldr r3, [r0]
	ldr r1, [r0, 0x4]
	cmp r1, 0
	bne _08053834
	b _08053848
	.align 2, 0
_0805382C: .4byte gMapHeader
_08053830:
	adds r0, r1, 0
	b _0805384A
_08053834:
	movs r2, 0
	cmp r2, r3
	bge _08053848
_0805383A:
	ldrb r0, [r1]
	cmp r0, r4
	beq _08053830
	adds r2, 0x1
	adds r1, 0xC
	cmp r2, r3
	blt _0805383A
_08053848:
	movs r0, 0
_0805384A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053818

	thumb_func_start sub_8053850
sub_8053850: @ 8053850
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
	beq _08053888
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
	b _080538A4
_08053888:
	bl mapheader_run_script_with_tag_x6
	ldr r0, _0805389C @ =gUnknown_02029800
	bl warp_data_is_not_neg_1
	cmp r0, 0
	beq _080538A0
	movs r0, 0
	b _080538A6
	.align 2, 0
_0805389C: .4byte gUnknown_02029800
_080538A0:
	bl warp1_set_to_warp2
_080538A4:
	movs r0, 0x1
_080538A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8053850

	thumb_func_start sub_80538B0
sub_80538B0: @ 80538B0
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
sub_80538D0: @ 80538D0
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
sub_80538F0: @ 80538F0
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
	ldr r4, _08053990 @ =gMapHeader
	ldr r0, [r4]
	bl sub_8056D38
	ldr r0, [r4]
	bl apply_map_tileset2_palette
	movs r4, 0x6
_0805395C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D874
	adds r4, 0x1
	cmp r4, 0xB
	ble _0805395C
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
_08053990: .4byte gMapHeader
	thumb_func_end sub_80538F0

	thumb_func_start sub_8053994
sub_8053994: @ 8053994
	push {r4-r6,lr}
	adds r6, r0, 0
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8053154
	ldr r4, _08053A2C @ =gMapHeader
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
	ldr r1, _08053A30 @ =gSaveBlock1
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
	beq _080539E2
	bl DoTimeBasedEvents
_080539E2:
	bl sub_80806E4
	bl sub_8054164
	cmp r5, 0
	beq _080539F4
	ldr r0, _08053A34 @ =0x00000828
	bl FlagReset
_080539F4:
	bl sub_8053C98
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134348
	bl not_trainer_hill_battle_pyramid
	cmp r6, 0x1
	beq _08053A24
	cmp r4, 0
	beq _08053A24
	ldr r1, _08053A38 @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	bl UpdateTVScreensOnMap
	movs r0, 0x1
	bl sub_80BBCCC
_08053A24:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053A2C: .4byte gMapHeader
_08053A30: .4byte gSaveBlock1
_08053A34: .4byte 0x00000828
_08053A38: .4byte gUnknown_03004870
	thumb_func_end sub_8053994

	thumb_func_start player_avatar_init_params_reset
player_avatar_init_params_reset: @ 8053A3C
	ldr r1, _08053A48 @ =gUnknown_02029810
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08053A48: .4byte gUnknown_02029810
	thumb_func_end player_avatar_init_params_reset

	thumb_func_start walkrun_find_lowest_active_bit_in_bitfield
walkrun_find_lowest_active_bit_in_bitfield: @ 8053A4C
	push {r4,lr}
	bl player_get_direction_lower_nybble
	ldr r4, _08053A68 @ =gUnknown_02029810
	strb r0, [r4, 0x1]
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A6C
	movs r0, 0x2
	b _08053A9E
	.align 2, 0
_08053A68: .4byte gUnknown_02029810
_08053A6C:
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A7C
	movs r0, 0x4
	b _08053A9E
_08053A7C:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A8C
	movs r0, 0x8
	b _08053A9E
_08053A8C:
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A9C
	movs r0, 0x10
	b _08053A9E
_08053A9C:
	movs r0, 0x1
_08053A9E:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end walkrun_find_lowest_active_bit_in_bitfield

	thumb_func_start sub_8053AA8
sub_8053AA8: @ 8053AA8
	push {r4-r7,lr}
	bl sav1_map_get_light_level
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl cur_mapdata_block_role_at_screen_center_acc_to_sav1
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _08053AF4 @ =gUnknown_02029810
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8053B00
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08053AF8 @ =0xffffff00
	ands r7, r0
	orrs r7, r1
	adds r0, r6, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_8053B60
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _08053AFC @ =0xffff00ff
	ands r7, r1
	orrs r7, r0
	str r7, [r6]
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08053AF4: .4byte gUnknown_02029810
_08053AF8: .4byte 0xffffff00
_08053AFC: .4byte 0xffff00ff
	thumb_func_end sub_8053AA8

	thumb_func_start sub_8053B00
sub_8053B00: @ 8053B00
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x8
	beq _08053B1C
	ldr r0, _08053B24 @ =0x0000082d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08053B56
_08053B1C:
	cmp r4, 0x5
	bne _08053B28
	movs r0, 0x10
	b _08053B58
	.align 2, 0
_08053B24: .4byte 0x0000082d
_08053B28:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053B3C
	movs r0, 0x8
	b _08053B58
_08053B3C:
	bl sub_8053C44
	cmp r0, 0x1
	bne _08053B56
	ldrb r0, [r6]
	cmp r0, 0x2
	bne _08053B4E
	movs r0, 0x2
	b _08053B58
_08053B4E:
	cmp r0, 0x4
	bne _08053B56
	movs r0, 0x4
	b _08053B58
_08053B56:
	movs r0, 0x1
_08053B58:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8053B00

	thumb_func_start sub_8053B60
sub_8053B60: @ 8053B60
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _08053BC0 @ =0x0000082d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053B80
	cmp r5, 0x6
	beq _08053BE0
_08053B80:
	lsls r4, 24
	lsrs r5, r4, 24
	adds r0, r5, 0
	bl sub_8056F24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053BBC
	adds r0, r5, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C16
	adds r0, r5, 0
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C16
	adds r0, r5, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053BC4
_08053BBC:
	movs r0, 0x2
	b _08053C1C
	.align 2, 0
_08053BC0: .4byte 0x0000082d
_08053BC4:
	adds r0, r5, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C16
	adds r0, r5, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053BE4
_08053BE0:
	movs r0, 0x4
	b _08053C1C
_08053BE4:
	adds r0, r5, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053BF6
	movs r0, 0x3
	b _08053C1C
_08053BF6:
	ldrb r0, [r6]
	cmp r0, 0x10
	bne _08053C00
	cmp r7, 0x8
	beq _08053C1A
_08053C00:
	cmp r0, 0x8
	bne _08053C08
	cmp r7, 0x10
	beq _08053C1A
_08053C08:
	lsrs r0, r4, 24
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C1A
_08053C16:
	movs r0, 0x1
	b _08053C1C
_08053C1A:
	ldrb r0, [r6, 0x1]
_08053C1C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8053B60

	thumb_func_start cur_mapdata_block_role_at_screen_center_acc_to_sav1
cur_mapdata_block_role_at_screen_center_acc_to_sav1: @ 8053C24
	push {lr}
	ldr r1, _08053C40 @ =gSaveBlock1
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
_08053C40: .4byte gSaveBlock1
	thumb_func_end cur_mapdata_block_role_at_screen_center_acc_to_sav1

	thumb_func_start sub_8053C44
sub_8053C44: @ 8053C44
	push {lr}
	ldr r0, _08053C80 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	adds r2, r0, 0
	cmp r1, 0x1D
	bne _08053C5E
	ldrb r0, [r2, 0x5]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08053C7C
_08053C5E:
	ldr r0, _08053C84 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	beq _08053C90
	cmp r0, 0x9
	beq _08053C90
	cmp r0, 0x5
	beq _08053C90
	ldrh r1, [r2, 0x4]
	ldr r0, _08053C88 @ =0x00002418
	cmp r1, r0
	beq _08053C90
	ldr r0, _08053C8C @ =0x00002a18
	cmp r1, r0
	beq _08053C90
_08053C7C:
	movs r0, 0x1
	b _08053C92
	.align 2, 0
_08053C80: .4byte gSaveBlock1
_08053C84: .4byte gMapHeader
_08053C88: .4byte 0x00002418
_08053C8C: .4byte 0x00002a18
_08053C90:
	movs r0, 0
_08053C92:
	pop {r1}
	bx r1
	thumb_func_end sub_8053C44

	thumb_func_start sub_8053C98
sub_8053C98: @ 8053C98
	push {lr}
	ldr r0, _08053CA8 @ =gMapHeader
	ldrb r1, [r0, 0x15]
	cmp r1, 0
	bne _08053CB0
	ldr r0, _08053CAC @ =gSaveBlock1
	b _08053CD2
	.align 2, 0
_08053CA8: .4byte gMapHeader
_08053CAC: .4byte gSaveBlock1
_08053CB0:
	ldr r0, _08053CC4 @ =0x00000828
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053CCC
	ldr r0, _08053CC8 @ =gSaveBlock1
	adds r0, 0x30
	movs r1, 0x1
	b _08053CD4
	.align 2, 0
_08053CC4: .4byte 0x00000828
_08053CC8: .4byte gSaveBlock1
_08053CCC:
	ldr r0, _08053CDC @ =gSaveBlock1
	ldr r1, _08053CE0 @ =gUnknown_0839ACE8
	ldr r1, [r1]
_08053CD2:
	adds r0, 0x30
_08053CD4:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08053CDC: .4byte gSaveBlock1
_08053CE0: .4byte gUnknown_0839ACE8
	thumb_func_end sub_8053C98

	thumb_func_start sub_8053CE4
sub_8053CE4: @ 8053CE4
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	blt _08053CF4
	ldr r0, _08053D00 @ =gUnknown_0839ACE8
	ldr r0, [r0]
	cmp r1, r0
	ble _08053CF6
_08053CF4:
	movs r1, 0
_08053CF6:
	ldr r0, _08053D04 @ =gSaveBlock1
	adds r0, 0x30
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08053D00: .4byte gUnknown_0839ACE8
_08053D04: .4byte gSaveBlock1
	thumb_func_end sub_8053CE4

	thumb_func_start sav1_get_flash_used_on_map
sav1_get_flash_used_on_map: @ 8053D08
	ldr r0, _08053D10 @ =gSaveBlock1
	adds r0, 0x30
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08053D10: .4byte gSaveBlock1
	thumb_func_end sav1_get_flash_used_on_map

	thumb_func_start sub_8053D14
sub_8053D14: @ 8053D14
	push {lr}
	ldr r1, _08053D28 @ =gSaveBlock1
	strh r0, [r1, 0x32]
	bl get_mapdata_header
	ldr r1, _08053D2C @ =gMapHeader
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08053D28: .4byte gSaveBlock1
_08053D2C: .4byte gMapHeader
	thumb_func_end sub_8053D14

	thumb_func_start sub_8053D30
sub_8053D30: @ 8053D30
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08053D60 @ =0x0000082a
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053D64
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _08053D64
	movs r0, 0x1
	ldrsb r0, [r4, r0]
	cmp r0, 0x5
	blt _08053D64
	cmp r0, 0x8
	ble _08053D5C
	cmp r0, 0x2B
	bgt _08053D64
	cmp r0, 0x27
	blt _08053D64
_08053D5C:
	movs r0, 0x1
	b _08053D66
	.align 2, 0
_08053D60: .4byte 0x0000082a
_08053D64:
	movs r0, 0
_08053D66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D30

	thumb_func_start sub_8053D6C
sub_8053D6C: @ 8053D6C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08053D90 @ =0x000040b3
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _08053D8A
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x20
	bne _08053D8A
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bls _08053D94
_08053D8A:
	movs r0, 0
	b _08053D96
	.align 2, 0
_08053D90: .4byte 0x000040b3
_08053D94:
	movs r0, 0x1
_08053D96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D6C

	thumb_func_start sub_8053D9C
sub_8053D9C: @ 8053D9C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8053D30
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08053DB2
	movs r0, 0xDE
	lsls r0, 1
	b _08053DDC
_08053DB2:
	adds r0, r4, 0
	bl sub_8053D6C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08053DD8
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
	b _08053DDC
_08053DD8:
	movs r0, 0xCB
	lsls r0, 1
_08053DDC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D9C

	thumb_func_start sav1_map_get_music
sav1_map_get_music: @ 8053DE4
	push {r4,lr}
	ldr r0, _08053E04 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0xD0
	lsls r0, 5
	cmp r1, r0
	bne _08053E0C
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _08053E0C
	ldr r0, _08053E08 @ =0x00000199
	b _08053E40
	.align 2, 0
_08053E04: .4byte gSaveBlock1
_08053E08: .4byte 0x00000199
_08053E0C:
	ldr r4, _08053E24 @ =gSaveBlock1 + 0x4
	adds r0, r4, 0
	bl sub_8053D9C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08053E28 @ =0x00007fff
	cmp r1, r0
	beq _08053E2C
	adds r0, r1, 0
	b _08053E40
	.align 2, 0
_08053E24: .4byte gSaveBlock1 + 0x4
_08053E28: .4byte 0x00007fff
_08053E2C:
	subs r0, r4, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x17
	ble _08053E3C
	movs r0, 0xC9
	lsls r0, 1
	b _08053E40
_08053E3C:
	movs r0, 0xB4
	lsls r0, 1
_08053E40:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sav1_map_get_music

	thumb_func_start warp1_target_get_music
warp1_target_get_music: @ 8053E48
	push {lr}
	ldr r0, _08053E60 @ =gUnknown_020297F8
	bl sub_8053D9C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08053E64 @ =0x00007fff
	cmp r1, r0
	beq _08053E68
	adds r0, r1, 0
	b _08053E80
	.align 2, 0
_08053E60: .4byte gUnknown_020297F8
_08053E64: .4byte 0x00007fff
_08053E68:
	ldr r0, _08053E78 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 2
	cmp r1, r0
	beq _08053E7C
	subs r0, 0x6E
	b _08053E80
	.align 2, 0
_08053E78: .4byte gSaveBlock1
_08053E7C:
	movs r0, 0xB4
	lsls r0, 1
_08053E80:
	pop {r1}
	bx r1
	thumb_func_end warp1_target_get_music

	thumb_func_start call_map_music_set_to_zero
call_map_music_set_to_zero: @ 8053E84
	push {lr}
	bl ResetMapMusic
	pop {r0}
	bx r0
	thumb_func_end call_map_music_set_to_zero

	thumb_func_start sub_8053E90
sub_8053E90: @ 8053E90
	push {r4,lr}
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xDE
	lsls r0, 1
	cmp r4, r0
	beq _08053ED6
	ldr r1, _08053EB0 @ =gSaveBlock1
	ldrh r0, [r1, 0x2C]
	cmp r0, 0
	beq _08053EB4
	adds r4, r0, 0
	b _08053ED6
	.align 2, 0
_08053EB0: .4byte gSaveBlock1
_08053EB4:
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _08053EC8
	ldr r4, _08053EC4 @ =0x0000019b
	b _08053ED6
	.align 2, 0
_08053EC4: .4byte 0x0000019b
_08053EC8:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053ED6
	ldr r4, _08053EF0 @ =0x0000016d
_08053ED6:
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08053EE8
	adds r0, r4, 0
	bl PlayNewMapMusic
_08053EE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053EF0: .4byte 0x0000016d
	thumb_func_end sub_8053E90

	thumb_func_start sav1_set_battle_music_maybe
sav1_set_battle_music_maybe: @ 8053EF4
	ldr r1, _08053EFC @ =gSaveBlock1
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08053EFC: .4byte gSaveBlock1
	thumb_func_end sav1_set_battle_music_maybe

	thumb_func_start sav1_reset_battle_music_maybe
sav1_reset_battle_music_maybe: @ 8053F00
	ldr r1, _08053F08 @ =gSaveBlock1
	movs r0, 0
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08053F08: .4byte gSaveBlock1
	thumb_func_end sav1_reset_battle_music_maybe

	thumb_func_start sub_8053F0C
sub_8053F0C: @ 8053F0C
	push {r4-r6,lr}
	ldr r0, _08053F6C @ =0x00004001
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053F7C
	bl warp1_target_get_music
	lsls r0, 16
	lsrs r5, r0, 16
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xDE
	lsls r0, 1
	cmp r5, r0
	beq _08053F4E
	subs r0, 0x21
	cmp r4, r0
	beq _08053F7C
	ldr r6, _08053F70 @ =0x0000016d
	cmp r4, r6
	beq _08053F7C
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053F4E
	adds r5, r6, 0
_08053F4E:
	cmp r5, r4
	beq _08053F7C
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053F74
	adds r0, r5, 0
	movs r1, 0x4
	movs r2, 0x4
	bl FadeOutAndFadeInNewMapMusic
	b _08053F7C
	.align 2, 0
_08053F6C: .4byte 0x00004001
_08053F70: .4byte 0x0000016d
_08053F74:
	adds r0, r5, 0
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08053F7C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8053F0C

	thumb_func_start sub_8053F84
sub_8053F84: @ 8053F84
	push {r4,lr}
	bl GetCurrentMapMusic
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08053FAA
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08053FAA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053F84

	thumb_func_start sub_8053FB0
sub_8053FB0: @ 8053FB0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	beq _08053FD2
	movs r0, 0xDE
	lsls r0, 1
	cmp r1, r0
	beq _08053FD2
	adds r0, r4, 0
	movs r1, 0x8
	bl FadeOutAndPlayNewMapMusic
_08053FD2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053FB0

	thumb_func_start is_warp1_light_level_8_or_9
is_warp1_light_level_8_or_9: @ 8053FD8
	push {lr}
	bl warp1_get_mapheader
	ldrb r0, [r0, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053FF0
	movs r0, 0x4
	b _08053FF2
_08053FF0:
	movs r0, 0x2
_08053FF2:
	pop {r1}
	bx r1
	thumb_func_end is_warp1_light_level_8_or_9

	thumb_func_start sub_8053FF8
sub_8053FF8: @ 8053FF8
	push {r4,lr}
	bl warp1_target_get_music
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08054030 @ =0x00004001
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08054028
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08054028
	bl is_warp1_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	bl FadeOutMapMusic
_08054028:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054030: .4byte 0x00004001
	thumb_func_end sub_8053FF8

	thumb_func_start sub_8054034
sub_8054034: @ 8054034
	push {lr}
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8054034

	thumb_func_start sub_8054044
sub_8054044: @ 8054044
	push {lr}
	movs r0, 0x4
	bl FadeOutMapMusic
	pop {r0}
	bx r0
	thumb_func_end sub_8054044

	thumb_func_start sub_8054050
sub_8054050: @ 8054050
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r0, _080540C8 @ =gUnknown_02029816
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08054084
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
	beq _080540C0
_08054084:
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
	ldr r0, _080540CC @ =gUnknown_02029814
	ldrh r0, [r0]
	lsls r4, 24
	asrs r4, 24
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	movs r3, 0x1
	bl PlayCry2
_080540C0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080540C8: .4byte gUnknown_02029816
_080540CC: .4byte gUnknown_02029814
	thumb_func_end sub_8054050

	thumb_func_start sub_80540D0
sub_80540D0: @ 80540D0
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x4
	bhi _0805415E
	lsls r0, 2
	ldr r1, _080540E8 @ =_080540EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080540E8: .4byte _080540EC
	.align 2, 0
_080540EC:
	.4byte _08054100
	.4byte _08054114
	.4byte _08054130
	.4byte _0805414A
	.4byte _0805415E
_08054100:
	ldr r0, _0805410C @ =gUnknown_02029814
	ldrh r0, [r0]
	cmp r0, 0
	bne _08054110
	movs r0, 0x4
	b _0805415C
	.align 2, 0
_0805410C: .4byte gUnknown_02029814
_08054110:
	movs r0, 0x1
	b _0805415C
_08054114:
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
	b _0805415C
_08054130:
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
	b _0805415C
_0805414A:
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _0805415E
	bl sub_8054050
	movs r0, 0x2
_0805415C:
	strh r0, [r6]
_0805415E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80540D0

	thumb_func_start sub_8054164
sub_8054164: @ 8054164
	push {lr}
	ldr r0, _08054188 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0xB4
	lsls r0, 6
	cmp r1, r0
	bne _08054190
	bl sub_810D32C
	lsls r0, 24
	cmp r0, 0
	bne _08054190
	ldr r1, _0805418C @ =gUnknown_02029816
	movs r0, 0x1
	strb r0, [r1]
	bl GetMirageIslandMon
	b _08054196
	.align 2, 0
_08054188: .4byte gSaveBlock1
_0805418C: .4byte gUnknown_02029816
_08054190:
	ldr r0, _080541A0 @ =gUnknown_02029816
	bl GetLocalWildMon
_08054196:
	ldr r1, _080541A4 @ =gUnknown_02029814
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080541A0: .4byte gUnknown_02029816
_080541A4: .4byte gUnknown_02029814
	thumb_func_end sub_8054164

	thumb_func_start get_map_light_level_by_bank_and_number
get_map_light_level_by_bank_and_number: @ 80541A8
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
get_map_light_level_from_warp: @ 80541C0
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
sav1_map_get_light_level: @ 80541D8
	push {lr}
	ldr r0, _080541E8 @ =gSaveBlock1 + 0x4
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080541E8: .4byte gSaveBlock1 + 0x4
	thumb_func_end sav1_map_get_light_level

	thumb_func_start get_map_light_from_warp0
get_map_light_from_warp0: @ 80541EC
	push {lr}
	ldr r0, _080541FC @ =gUnknown_020297F0
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080541FC: .4byte gUnknown_020297F0
	thumb_func_end get_map_light_from_warp0

	thumb_func_start is_light_level_1_2_3_5_or_6
is_light_level_1_2_3_5_or_6: @ 8054200
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0805421A
	cmp r0, 0x1
	beq _0805421A
	cmp r0, 0x5
	beq _0805421A
	cmp r0, 0x2
	beq _0805421A
	cmp r0, 0x6
	bne _0805421E
_0805421A:
	movs r0, 0x1
	b _08054220
_0805421E:
	movs r0, 0
_08054220:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_5_or_6

	thumb_func_start is_light_level_1_2_3_or_6
is_light_level_1_2_3_or_6: @ 8054224
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0805423A
	cmp r0, 0x1
	beq _0805423A
	cmp r0, 0x6
	beq _0805423A
	cmp r0, 0x2
	bne _0805423E
_0805423A:
	movs r0, 0x1
	b _08054240
_0805423E:
	movs r0, 0
_08054240:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_or_6

	thumb_func_start is_light_level_8_or_9
is_light_level_8_or_9: @ 8054244
	push {lr}
	lsls r0, 24
	movs r1, 0xF8
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08054258
	movs r0, 0
	b _0805425A
_08054258:
	movs r0, 0x1
_0805425A:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_8_or_9

	thumb_func_start unref_sub_8054260
unref_sub_8054260: @ 8054260
	push {lr}
	ldr r1, _08054280 @ =gSaveBlock1
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
_08054280: .4byte gSaveBlock1
	thumb_func_end unref_sub_8054260

	thumb_func_start sav1_map_get_name
sav1_map_get_name: @ 8054284
	push {lr}
	ldr r1, _080542A4 @ =gSaveBlock1
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
_080542A4: .4byte gSaveBlock1
	thumb_func_end sav1_map_get_name

	thumb_func_start sav1_map_get_battletype
sav1_map_get_battletype: @ 80542A8
	push {lr}
	ldr r1, _080542C8 @ =gSaveBlock1
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
_080542C8: .4byte gSaveBlock1
	thumb_func_end sav1_map_get_battletype

	thumb_func_start ResetSafariZoneFlag_
ResetSafariZoneFlag_: @ 80542CC
	push {lr}
	bl ResetSafariZoneFlag
	pop {r0}
	bx r0
	thumb_func_end ResetSafariZoneFlag_

	thumb_func_start is_c1_link_related_active
is_c1_link_related_active: @ 80542D8
	push {lr}
	ldr r0, _080542E8 @ =gMain
	ldr r1, [r0]
	ldr r0, _080542EC @ =sub_8055354
	cmp r1, r0
	beq _080542F0
	movs r0, 0
	b _080542F2
	.align 2, 0
_080542E8: .4byte gMain
_080542EC: .4byte sub_8055354
_080542F0:
	movs r0, 0x1
_080542F2:
	pop {r1}
	bx r1
	thumb_func_end is_c1_link_related_active

	thumb_func_start c1_overworld_normal
c1_overworld_normal: @ 80542F8
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
	bne _08054346
	mov r0, sp
	bl sub_8068024
	cmp r0, 0x1
	bne _0805433C
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	b _08054346
_0805433C:
	ldrb r0, [r6, 0x2]
	adds r1, r5, 0
	adds r2, r4, 0
	bl player_step
_08054346:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end c1_overworld_normal

	thumb_func_start c1_overworld
c1_overworld: @ 8054350
	push {lr}
	ldr r2, _08054368 @ =gMain
	ldr r1, [r2, 0x4]
	ldr r0, _0805436C @ =c2_overworld
	cmp r1, r0
	bne _08054364
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x2C]
	bl c1_overworld_normal
_08054364:
	pop {r0}
	bx r0
	.align 2, 0
_08054368: .4byte gMain
_0805436C: .4byte c2_overworld
	thumb_func_end c1_overworld

	thumb_func_start c2_overworld_basic
c2_overworld_basic: @ 8054370
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
sub_8054398: @ 8054398
	push {lr}
	bl c2_overworld_basic
	pop {r0}
	bx r0
	thumb_func_end sub_8054398

	thumb_func_start c2_overworld
c2_overworld: @ 80543A4
	push {r4,lr}
	ldr r0, _080543CC @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	adds r4, r0, 0
	cmp r4, 0
	beq _080543B8
	movs r0, 0
	bl SetVBlankCallback
_080543B8:
	bl c2_overworld_basic
	cmp r4, 0
	beq _080543C4
	bl SetFieldVBlankCallback
_080543C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080543CC: .4byte gPaletteFade
	thumb_func_end c2_overworld

	thumb_func_start set_callback1
set_callback1: @ 80543D0
	ldr r1, _080543D8 @ =gMain
	str r0, [r1]
	bx lr
	.align 2, 0
_080543D8: .4byte gMain
	thumb_func_end set_callback1

	thumb_func_start sub_80543DC
sub_80543DC: @ 80543DC
	ldr r1, _080543E4 @ =gUnknown_03000584
	str r0, [r1]
	bx lr
	.align 2, 0
_080543E4: .4byte gUnknown_03000584
	thumb_func_end sub_80543DC

	thumb_func_start sub_80543E8
sub_80543E8: @ 80543E8
	push {lr}
	ldr r0, _080543F8 @ =gUnknown_0300485C
	ldr r0, [r0]
	cmp r0, 0
	beq _080543FC
	bl _call_via_r0
	b _08054400
	.align 2, 0
_080543F8: .4byte gUnknown_0300485C
_080543FC:
	bl mapldr_default
_08054400:
	ldr r1, _0805440C @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805440C: .4byte gUnknown_0300485C
	thumb_func_end sub_80543E8

	thumb_func_start CB2_NewGame
CB2_NewGame: @ 8054410
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl ResetSafariZoneFlag_
	bl NewGameInitData
	bl player_avatar_init_params_reset
	bl PlayTimeCounter_Start
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _08054454 @ =gUnknown_0300485C
	ldr r0, _08054458 @ =ExecuteTruckSequence
	str r0, [r1]
	ldr r0, _0805445C @ =0x03001bac
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _08054460 @ =c1_overworld
	bl set_callback1
	ldr r0, _08054464 @ =c2_overworld
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08054454: .4byte gUnknown_0300485C
_08054458: .4byte ExecuteTruckSequence
_0805445C: .4byte 0x03001bac
_08054460: .4byte c1_overworld
_08054464: .4byte c2_overworld
	thumb_func_end CB2_NewGame

	thumb_func_start c2_whiteout
c2_whiteout: @ 8054468
	push {lr}
	sub sp, 0x4
	ldr r1, _080544C4 @ =gMain
	ldr r0, _080544C8 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _080544BE
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl ResetSafariZoneFlag_
	bl sub_8052F5C
	bl player_avatar_init_params_reset
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	ldr r1, _080544CC @ =gUnknown_0300485C
	ldr r0, _080544D0 @ =sub_8080B60
	str r0, [r1]
	mov r1, sp
	movs r0, 0
	strb r0, [r1]
	mov r0, sp
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _080544D4 @ =c1_overworld
	bl set_callback1
	ldr r0, _080544D8 @ =c2_overworld
	bl SetMainCallback2
_080544BE:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080544C4: .4byte gMain
_080544C8: .4byte 0x0000043c
_080544CC: .4byte gUnknown_0300485C
_080544D0: .4byte sub_8080B60
_080544D4: .4byte c1_overworld
_080544D8: .4byte c2_overworld
	thumb_func_end c2_whiteout

	thumb_func_start CB2_LoadMap
CB2_LoadMap: @ 80544DC
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl set_callback1
	ldr r0, _08054500 @ =sub_810CC80
	bl SetMainCallback2
	ldr r1, _08054504 @ =gMain
	ldr r0, _08054508 @ =CB2_LoadMap2
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08054500: .4byte sub_810CC80
_08054504: .4byte gMain
_08054508: .4byte CB2_LoadMap2
	thumb_func_end CB2_LoadMap

	thumb_func_start CB2_LoadMap2
CB2_LoadMap2: @ 805450C
	push {lr}
	ldr r0, _08054528 @ =0x03001bac
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _0805452C @ =c1_overworld
	bl set_callback1
	ldr r0, _08054530 @ =c2_overworld
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08054528: .4byte 0x03001bac
_0805452C: .4byte c1_overworld
_08054530: .4byte c2_overworld
	thumb_func_end CB2_LoadMap2

	thumb_func_start sub_8054534
sub_8054534: @ 8054534
	push {r4,lr}
	ldr r0, _08054578 @ =gMain
	ldr r1, _0805457C @ =0x0000043c
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _08054554
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	movs r0, 0
	bl set_callback1
_08054554:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_805493C
	cmp r0, 0
	beq _08054570
	bl SetFieldVBlankCallback
	ldr r0, _08054580 @ =c1_overworld
	bl set_callback1
	ldr r0, _08054584 @ =c2_overworld
	bl SetMainCallback2
_08054570:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054578: .4byte gMain
_0805457C: .4byte 0x0000043c
_08054580: .4byte c1_overworld
_08054584: .4byte c2_overworld
	thumb_func_end sub_8054534

	thumb_func_start sub_8054588
sub_8054588: @ 8054588
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r0, _080545A0 @ =gUnknown_0300485C
	ldr r1, _080545A4 @ =sub_8080AC4
	str r1, [r0]
	ldr r0, _080545A8 @ =c2_80567AC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080545A0: .4byte gUnknown_0300485C
_080545A4: .4byte sub_8080AC4
_080545A8: .4byte c2_80567AC
	thumb_func_end sub_8054588

	thumb_func_start c2_80567AC
c2_80567AC: @ 80545AC
	push {lr}
	ldr r0, _080545D4 @ =0x03001bac
	bl sub_805483C
	cmp r0, 0
	beq _080545CE
	bl SetFieldVBlankCallback
	ldr r0, _080545D8 @ =sub_8055354
	bl set_callback1
	ldr r0, _080545DC @ =sub_8055390
	bl sub_80543DC
	ldr r0, _080545E0 @ =c2_overworld
	bl SetMainCallback2
_080545CE:
	pop {r0}
	bx r0
	.align 2, 0
_080545D4: .4byte 0x03001bac
_080545D8: .4byte sub_8055354
_080545DC: .4byte sub_8055390
_080545E0: .4byte c2_overworld
	thumb_func_end c2_80567AC

	thumb_func_start c2_exit_to_overworld_2_switch
c2_exit_to_overworld_2_switch: @ 80545E4
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080545FC
	ldr r0, _080545F8 @ =c2_exit_to_overworld_2_link
	bl SetMainCallback2
	b _08054606
	.align 2, 0
_080545F8: .4byte c2_exit_to_overworld_2_link
_080545FC:
	bl FieldClearVBlankHBlankCallbacks
	ldr r0, _0805460C @ =c2_exit_to_overworld_2_local
	bl SetMainCallback2
_08054606:
	pop {r0}
	bx r0
	.align 2, 0
_0805460C: .4byte c2_exit_to_overworld_2_local
	thumb_func_end c2_exit_to_overworld_2_switch

	thumb_func_start c2_exit_to_overworld_2_local
c2_exit_to_overworld_2_local: @ 8054610
	push {lr}
	ldr r0, _0805462C @ =0x03001bac
	bl sub_8054A4C
	cmp r0, 0
	beq _08054626
	bl SetFieldVBlankCallback
	ldr r0, _08054630 @ =c2_overworld
	bl SetMainCallback2
_08054626:
	pop {r0}
	bx r0
	.align 2, 0
_0805462C: .4byte 0x03001bac
_08054630: .4byte c2_overworld
	thumb_func_end c2_exit_to_overworld_2_local

	thumb_func_start c2_exit_to_overworld_2_link
c2_exit_to_overworld_2_link: @ 8054634
	push {lr}
	bl sub_8055870
	cmp r0, 0
	bne _0805464E
	ldr r0, _08054654 @ =0x03001bac
	bl sub_8054A9C
	cmp r0, 0
	beq _0805464E
	ldr r0, _08054658 @ =c2_overworld
	bl SetMainCallback2
_0805464E:
	pop {r0}
	bx r0
	.align 2, 0
_08054654: .4byte 0x03001bac
_08054658: .4byte c2_overworld
	thumb_func_end c2_exit_to_overworld_2_link

	thumb_func_start sub_805465C
sub_805465C: @ 805465C
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	bl StopMapMusic
	bl sub_8054F70
	ldr r0, _0805468C @ =sub_8055354
	bl set_callback1
	ldr r0, _08054690 @ =sub_8055390
	bl sub_80543DC
	ldr r1, _08054694 @ =gUnknown_0300485C
	ldr r0, _08054698 @ =sub_8080A3C
	str r0, [r1]
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_0805468C: .4byte sub_8055354
_08054690: .4byte sub_8055390
_08054694: .4byte gUnknown_0300485C
_08054698: .4byte sub_8080A3C
	thumb_func_end sub_805465C

	thumb_func_start sub_805469C
sub_805469C: @ 805469C
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _080546B0 @ =gUnknown_0300485C
	ldr r0, _080546B4 @ =atk17_seteffectuser
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080546B0: .4byte gUnknown_0300485C
_080546B4: .4byte atk17_seteffectuser
	thumb_func_end sub_805469C

	thumb_func_start sub_80546B8
sub_80546B8: @ 80546B8
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _080546CC @ =gUnknown_0300485C
	ldr r0, _080546D0 @ =sub_80809B0
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080546CC: .4byte gUnknown_0300485C
_080546D0: .4byte sub_80809B0
	thumb_func_end sub_80546B8

	thumb_func_start c2_exit_to_overworld_1_continue_scripts_restart_music
c2_exit_to_overworld_1_continue_scripts_restart_music: @ 80546D4
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _080546E8 @ =gUnknown_0300485C
	ldr r0, _080546EC @ =sub_8080990
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080546E8: .4byte gUnknown_0300485C
_080546EC: .4byte sub_8080990
	thumb_func_end c2_exit_to_overworld_1_continue_scripts_restart_music

	thumb_func_start sub_80546F0
sub_80546F0: @ 80546F0
	push {lr}
	bl FieldClearVBlankHBlankCallbacks
	ldr r1, _08054704 @ =gUnknown_0300485C
	ldr r0, _08054708 @ =sub_8080B60
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_08054704: .4byte gUnknown_0300485C
_08054708: .4byte sub_8080B60
	thumb_func_end sub_80546F0

	thumb_func_start sub_805470C
sub_805470C: @ 805470C
	push {lr}
	ldr r0, _08054730 @ =gMapHeader
	ldrb r0, [r0, 0x1A]
	cmp r0, 0x1
	bne _08054726
	bl sub_80BBB24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054726
	bl AddMapNamePopUpWindowTask
_08054726:
	bl sub_8080B60
	pop {r0}
	bx r0
	.align 2, 0
_08054730: .4byte gMapHeader
	thumb_func_end sub_805470C

	thumb_func_start CB2_ContinueSavedGame
CB2_ContinueSavedGame: @ 8054734
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
	bne _08054788
	bl ClearSecretBase2Field_9
	bl sub_8053778
	bl warp_in
	ldr r0, _08054784 @ =CB2_LoadMap
	bl SetMainCallback2
	b _08054798
	.align 2, 0
_08054784: .4byte CB2_LoadMap
_08054788:
	ldr r0, _0805479C @ =gUnknown_0300485C
	ldr r1, _080547A0 @ =sub_805470C
	str r1, [r0]
	ldr r0, _080547A4 @ =c1_overworld
	bl set_callback1
	bl c2_exit_to_overworld_2_switch
_08054798:
	pop {r0}
	bx r0
	.align 2, 0
_0805479C: .4byte gUnknown_0300485C
_080547A0: .4byte sub_805470C
_080547A4: .4byte c1_overworld
	thumb_func_end CB2_ContinueSavedGame

	thumb_func_start FieldClearVBlankHBlankCallbacks
FieldClearVBlankHBlankCallbacks: @ 80547A8
	push {r4,lr}
	ldr r4, _080547D8 @ =0x04000208
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r2, _080547DC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080547E0 @ =0x0000fffd
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
_080547D8: .4byte 0x04000208
_080547DC: .4byte 0x04000200
_080547E0: .4byte 0x0000fffd
	thumb_func_end FieldClearVBlankHBlankCallbacks

	thumb_func_start SetFieldVBlankCallback
SetFieldVBlankCallback: @ 80547E4
	push {lr}
	ldr r0, _080547F0 @ =VBlankCB_Field
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_080547F0: .4byte VBlankCB_Field
	thumb_func_end SetFieldVBlankCallback

	thumb_func_start VBlankCB_Field
VBlankCB_Field: @ 80547F4
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
sub_8054814: @ 8054814
	push {lr}
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08054832
	bl sub_80815E0
	ldr r2, _08054838 @ =gUnknown_08216694
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
_08054832:
	pop {r0}
	bx r0
	.align 2, 0
_08054838: .4byte gUnknown_08216694
	thumb_func_end sub_8054814

	thumb_func_start sub_805483C
sub_805483C: @ 805483C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bhi _08054934
	lsls r0, 2
	ldr r1, _08054850 @ =_08054854
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054850: .4byte _08054854
	.align 2, 0
_08054854:
	.4byte _0805488C
	.4byte _080548A2
	.4byte _080548AA
	.4byte _080548B2
	.4byte _080548C4
	.4byte _080548E4
	.4byte _080548EA
	.4byte _080548F8
	.4byte _08054908
	.4byte _08054918
	.4byte _0805491E
	.4byte _08054928
	.4byte _08054924
	.4byte _08054930
_0805488C:
	bl FieldClearVBlankHBlankCallbacks
	bl ScriptContext1_Init
	bl ScriptContext2_Disable
	bl sub_8054F70
	bl sub_8054BA8
	b _08054928
_080548A2:
	movs r0, 0x1
	bl sub_8053994
	b _08054928
_080548AA:
	movs r0, 0x1
	bl sub_8054D4C
	b _08054928
_080548B2:
	bl sub_8054E98
	bl sub_8054D90
	bl sub_8054EC8
	bl sub_8054E60
	b _08054928
_080548C4:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _080548DC @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080548E0 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	b _08054928
	.align 2, 0
_080548DC: .4byte gWindowConfig_81E6C3C
_080548E0: .4byte gWindowConfig_81E6CE4
_080548E4:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054928
_080548EA:
	ldr r0, _080548F4 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D28
	b _08054928
	.align 2, 0
_080548F4: .4byte gMapHeader
_080548F8:
	ldr r0, _08054904 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D38
	b _08054928
	.align 2, 0
_08054904: .4byte gMapHeader
_08054908:
	ldr r0, _08054914 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054928
	.align 2, 0
_08054914: .4byte gMapHeader
_08054918:
	bl DrawWholeMapView
	b _08054928
_0805491E:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054928
_08054924:
	bl sub_80543E8
_08054928:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054934
_08054930:
	movs r0, 0x1
	b _08054936
_08054934:
	movs r0, 0
_08054936:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805483C

	thumb_func_start sub_805493C
sub_805493C: @ 805493C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bls _0805494A
	b _08054A44
_0805494A:
	lsls r0, 2
	ldr r1, _08054954 @ =_08054958
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054954: .4byte _08054958
	.align 2, 0
_08054958:
	.4byte _08054990
	.4byte _0805499C
	.4byte _080549A2
	.4byte _080549AA
	.4byte _080549B4
	.4byte _080549D4
	.4byte _080549DA
	.4byte _080549E8
	.4byte _080549F8
	.4byte _08054A08
	.4byte _08054A0E
	.4byte _08054A14
	.4byte _08054A34
	.4byte _08054A40
_08054990:
	bl FieldClearVBlankHBlankCallbacks
	adds r0, r5, 0
	bl sub_8053994
	b _08054A38
_0805499C:
	bl sub_8054BA8
	b _08054A38
_080549A2:
	adds r0, r5, 0
	bl sub_8054D4C
	b _08054A38
_080549AA:
	bl mli4_mapscripts_and_other
	bl sub_8054E34
	b _08054A38
_080549B4:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _080549CC @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080549D0 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	b _08054A38
	.align 2, 0
_080549CC: .4byte gWindowConfig_81E6C3C
_080549D0: .4byte gWindowConfig_81E6CE4
_080549D4:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054A38
_080549DA:
	ldr r0, _080549E4 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D28
	b _08054A38
	.align 2, 0
_080549E4: .4byte gMapHeader
_080549E8:
	ldr r0, _080549F4 @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D38
	b _08054A38
	.align 2, 0
_080549F4: .4byte gMapHeader
_080549F8:
	ldr r0, _08054A04 @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054A38
	.align 2, 0
_08054A04: .4byte gMapHeader
_08054A08:
	bl DrawWholeMapView
	b _08054A38
_08054A0E:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054A38
_08054A14:
	ldr r0, _08054A30 @ =gMapHeader
	ldrb r0, [r0, 0x1A]
	cmp r0, 0x1
	bne _08054A38
	bl sub_80BBB24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054A38
	bl AddMapNamePopUpWindowTask
	b _08054A38
	.align 2, 0
_08054A30: .4byte gMapHeader
_08054A34:
	bl sub_80543E8
_08054A38:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054A44
_08054A40:
	movs r0, 0x1
	b _08054A46
_08054A44:
	movs r0, 0
_08054A46:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805493C

	thumb_func_start sub_8054A4C
sub_8054A4C: @ 8054A4C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08054A7E
	cmp r0, 0x1
	bgt _08054A60
	cmp r0, 0
	beq _08054A6A
	b _08054A94
_08054A60:
	cmp r0, 0x2
	beq _08054A84
	cmp r0, 0x3
	beq _08054A90
	b _08054A94
_08054A6A:
	bl sub_8054BA8
	movs r0, 0
	bl sub_8054D4C
	bl sub_8054E20
	bl sub_8054E34
	b _08054A88
_08054A7E:
	bl sub_8054C2C
	b _08054A88
_08054A84:
	bl sub_80543E8
_08054A88:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054A94
_08054A90:
	movs r0, 0x1
	b _08054A96
_08054A94:
	movs r0, 0
_08054A96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054A4C

	thumb_func_start sub_8054A9C
sub_8054A9C: @ 8054A9C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bhi _08054B86
	lsls r0, 2
	ldr r1, _08054AB0 @ =_08054AB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054AB0: .4byte _08054AB4
	.align 2, 0
_08054AB4:
	.4byte _08054AEC
	.4byte _08054AF6
	.4byte _08054AFE
	.4byte _08054B0C
	.4byte _08054B2C
	.4byte _08054B32
	.4byte _08054B40
	.4byte _08054B50
	.4byte _08054B60
	.4byte _08054B66
	.4byte _08054B70
	.4byte _08054B70
	.4byte _08054B6C
	.4byte _08054B78
_08054AEC:
	bl FieldClearVBlankHBlankCallbacks
	bl sub_8054BA8
	b _08054B70
_08054AF6:
	movs r0, 0x1
	bl sub_8054D4C
	b _08054B70
_08054AFE:
	bl sub_8054F48
	bl sub_8054E20
	bl sub_8054E7C
	b _08054B70
_08054B0C:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054B24 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08054B28 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	b _08054B70
	.align 2, 0
_08054B24: .4byte gWindowConfig_81E6C3C
_08054B28: .4byte gWindowConfig_81E6CE4
_08054B2C:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054B70
_08054B32:
	ldr r0, _08054B3C @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D28
	b _08054B70
	.align 2, 0
_08054B3C: .4byte gMapHeader
_08054B40:
	ldr r0, _08054B4C @ =gMapHeader
	ldr r0, [r0]
	bl sub_8056D38
	b _08054B70
	.align 2, 0
_08054B4C: .4byte gMapHeader
_08054B50:
	ldr r0, _08054B5C @ =gMapHeader
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054B70
	.align 2, 0
_08054B5C: .4byte gMapHeader
_08054B60:
	bl DrawWholeMapView
	b _08054B70
_08054B66:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054B70
_08054B6C:
	bl sub_80543E8
_08054B70:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054B86
_08054B78:
	bl SetFieldVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	b _08054B88
_08054B86:
	movs r0, 0
_08054B88:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054A9C

	thumb_func_start do_load_map_stuff_loop
do_load_map_stuff_loop: @ 8054B90
	push {r4,lr}
	adds r4, r0, 0
_08054B94:
	adds r0, r4, 0
	movs r1, 0
	bl sub_805493C
	cmp r0, 0
	beq _08054B94
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end do_load_map_stuff_loop

	thumb_func_start sub_8054BA8
sub_8054BA8: @ 8054BA8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	bl remove_some_task
	ldr r2, _08054C1C @ =0x05000002
	mov r0, sp
	strh r4, [r0]
	ldr r1, _08054C20 @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08054C24 @ =0x810001ff
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
	ldr r7, _08054C28 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08054BE2:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08054BE2
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
_08054C1C: .4byte 0x05000002
_08054C20: .4byte 0x040000d4
_08054C24: .4byte 0x810001ff
_08054C28: .4byte 0x81000800
	thumb_func_end sub_8054BA8

	thumb_func_start sub_8054C2C
sub_8054C2C: @ 8054C2C
	push {lr}
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054C4C @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08054C50 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	bl mapdata_load_assets_to_gpu_and_full_redraw
	pop {r0}
	bx r0
	.align 2, 0
_08054C4C: .4byte gWindowConfig_81E6C3C
_08054C50: .4byte gWindowConfig_81E6CE4
	thumb_func_end sub_8054C2C

	thumb_func_start sub_8054C54
sub_8054C54: @ 8054C54
	push {r4-r6,lr}
	ldr r0, _08054D08 @ =REG_MOSAIC
	movs r3, 0
	strh r3, [r0]
	ldr r1, _08054D0C @ =REG_WININ
	ldr r2, _08054D10 @ =0x00001f1f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r4, _08054D14 @ =0x00000101
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _08054D18 @ =REG_WIN0H
	movs r1, 0xFF
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	ldr r6, _08054D1C @ =0x0000ffff
	adds r1, r6, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r4, _08054D20 @ =REG_BLDCNT
	ldr r1, _08054D24 @ =gUnknown_081E29E0
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
	ldr r1, _08054D28 @ =REG_BLDALPHA
	ldr r4, _08054D2C @ =0x0000070d
	adds r0, r4, 0
	strh r0, [r1]
	ldr r5, _08054D30 @ =gBGHOffsetRegs
	ldr r0, [r5]
	strh r3, [r0]
	ldr r4, _08054D34 @ =gBGVOffsetRegs
	ldr r0, [r4]
	strh r3, [r0]
	ldr r2, _08054D38 @ =gBGControlRegs
	ldr r0, [r2]
	strh r3, [r0]
	ldr r0, [r5, 0x4]
	strh r3, [r0]
	ldr r0, [r4, 0x4]
	strh r3, [r0]
	ldr r1, [r2, 0x4]
	ldr r6, _08054D3C @ =0x00001d41
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
	ldr r2, _08054D40 @ =0x00001e43
	adds r0, r2, 0
	strh r0, [r1]
	movs r3, 0x80
	lsls r3, 19
	ldr r2, _08054D44 @ =gUnknown_081E29D8
	ldrh r0, [r2, 0x2]
	ldr r4, _08054D48 @ =0x00007060
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
_08054D08: .4byte REG_MOSAIC
_08054D0C: .4byte REG_WININ
_08054D10: .4byte 0x00001f1f
_08054D14: .4byte 0x00000101
_08054D18: .4byte REG_WIN0H
_08054D1C: .4byte 0x0000ffff
_08054D20: .4byte REG_BLDCNT
_08054D24: .4byte gUnknown_081E29E0
_08054D28: .4byte REG_BLDALPHA
_08054D2C: .4byte 0x0000070d
_08054D30: .4byte gBGHOffsetRegs
_08054D34: .4byte gBGVOffsetRegs
_08054D38: .4byte gBGControlRegs
_08054D3C: .4byte 0x00001d41
_08054D40: .4byte 0x00001e43
_08054D44: .4byte gUnknown_081E29D8
_08054D48: .4byte 0x00007060
	thumb_func_end sub_8054C54

	thumb_func_start sub_8054D4C
sub_8054D4C: @ 8054D4C
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
	bne _08054D86
	bl overworld_ensure_per_step_coros_running
_08054D86:
	bl mapheader_run_script_with_tag_x5
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8054D4C

	thumb_func_start sub_8054D90
sub_8054D90: @ 8054D90
	push {lr}
	ldr r0, _08054DB0 @ =gUnknown_0300489C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08054DB4 @ =gUnknown_03004898
	strh r1, [r0]
	bl sub_805AA98
	movs r0, 0
	movs r1, 0
	bl sub_805B55C
	bl mapheader_run_first_tag4_script_list_match
	pop {r0}
	bx r0
	.align 2, 0
_08054DB0: .4byte gUnknown_0300489C
_08054DB4: .4byte gUnknown_03004898
	thumb_func_end sub_8054D90

	thumb_func_start mli4_mapscripts_and_other
mli4_mapscripts_and_other: @ 8054DB8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08054E14 @ =gUnknown_0300489C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08054E18 @ =gUnknown_03004898
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
	ldr r3, _08054E1C @ =gSaveBlock2
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
_08054E14: .4byte gUnknown_0300489C
_08054E18: .4byte gUnknown_03004898
_08054E1C: .4byte gSaveBlock2
	thumb_func_end mli4_mapscripts_and_other

	thumb_func_start sub_8054E20
sub_8054E20: @ 8054E20
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_805B710
	bl sub_80C8080
	pop {r0}
	bx r0
	thumb_func_end sub_8054E20

	thumb_func_start sub_8054E34
sub_8054E34: @ 8054E34
	push {lr}
	ldr r2, _08054E58 @ =gMapObjects
	ldr r3, _08054E5C @ =gPlayerAvatar
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
_08054E58: .4byte gMapObjects
_08054E5C: .4byte gPlayerAvatar
	thumb_func_end sub_8054E34

	thumb_func_start sub_8054E60
sub_8054E60: @ 8054E60
	push {lr}
	ldr r0, _08054E78 @ =gUnknown_03004860
	ldrb r0, [r0]
	bl sub_8055AE8
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08054E78: .4byte gUnknown_03004860
	thumb_func_end sub_8054E60

	thumb_func_start sub_8054E7C
sub_8054E7C: @ 8054E7C
	push {lr}
	ldr r0, _08054E94 @ =gUnknown_03004860
	ldrb r0, [r0]
	bl sub_8055AE8
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08054E94: .4byte gUnknown_03004860
	thumb_func_end sub_8054E7C

	thumb_func_start sub_8054E98
sub_8054E98: @ 8054E98
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	mov r2, sp
	ldr r0, _08054EC4 @ =gUnknown_03004860
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
_08054EC4: .4byte gUnknown_03004860
	thumb_func_end sub_8054E98

	thumb_func_start sub_8054EC8
sub_8054EC8: @ 8054EC8
	push {r4-r7,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	mov r3, sp
	mov r2, sp
	ldr r0, _08054F38 @ =gUnknown_03004860
	ldrb r1, [r0]
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r3]
	movs r5, 0
	ldr r0, _08054F3C @ =gFieldLinkPlayerCount
	adds r7, r4, 0
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08054F2A
	ldr r6, _08054F40 @ =gLinkPlayers
_08054EF4:
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
	ldr r0, _08054F3C @ =gFieldLinkPlayerCount
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08054EF4
_08054F2A:
	ldr r0, _08054F44 @ =word_3002910
	bl sub_8055340
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054F38: .4byte gUnknown_03004860
_08054F3C: .4byte gFieldLinkPlayerCount
_08054F40: .4byte gLinkPlayers
_08054F44: .4byte word_3002910
	thumb_func_end sub_8054EC8

	thumb_func_start sub_8054F48
sub_8054F48: @ 8054F48
	push {r4,lr}
	movs r4, 0
	b _08054F5C
_08054F4E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl CreateLinkPlayerSprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08054F5C:
	ldr r0, _08054F6C @ =gFieldLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08054F4E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054F6C: .4byte gFieldLinkPlayerCount
	thumb_func_end sub_8054F48

	thumb_func_start sub_8054F70
sub_8054F70: @ 8054F70
	push {lr}
	ldr r1, _08054F84 @ =gUnknown_03000580
	movs r2, 0x80
	adds r0, r1, 0x3
_08054F78:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08054F78
	pop {r0}
	bx r0
	.align 2, 0
_08054F84: .4byte gUnknown_03000580
	thumb_func_end sub_8054F70

	thumb_func_start sub_8054F88
sub_8054F88: @ 8054F88
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08054FA8 @ =gFieldLinkPlayerCount
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _08054FB6
	ldr r4, _08054FAC @ =gUnknown_03000580
_08054F9A:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _08054FB0
	movs r0, 0
	b _08054FB8
	.align 2, 0
_08054FA8: .4byte gFieldLinkPlayerCount
_08054FAC: .4byte gUnknown_03000580
_08054FB0:
	adds r1, 0x1
	cmp r1, r2
	blt _08054F9A
_08054FB6:
	movs r0, 0x1
_08054FB8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054F88

	thumb_func_start sub_8054FC0
sub_8054FC0: @ 8054FC0
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08054FE0 @ =gFieldLinkPlayerCount
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _08054FEE
	ldr r4, _08054FE4 @ =gUnknown_03000580
_08054FD2:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08054FE8
	movs r0, 0x1
	b _08054FF0
	.align 2, 0
_08054FE0: .4byte gFieldLinkPlayerCount
_08054FE4: .4byte gUnknown_03000580
_08054FE8:
	adds r1, 0x1
	cmp r1, r2
	blt _08054FD2
_08054FEE:
	movs r0, 0
_08054FF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054FC0

	thumb_func_start sub_8054FF8
sub_8054FF8: @ 8054FF8
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
	ldr r0, _08055048 @ =gUnknown_03000580
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, 0x80
	beq _08055018
	b _08055192
_08055018:
	adds r0, r6, 0
	bl sub_8055648
	adds r4, r0, 0
	cmp r4, 0
	beq _08055050
	bl sub_8055758
	mov r1, r9
	strh r0, [r1]
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08055038
	b _08055206
_08055038:
	ldr r0, _0805504C @ =sub_80553E4
	bl sub_80543DC
	adds r0, r4, 0
	bl sub_8055808
	b _08055206
	.align 2, 0
_08055048: .4byte gUnknown_03000580
_0805504C: .4byte sub_80553E4
_08055050:
	movs r0, 0x83
	bl sub_8054FC0
	cmp r0, 0x1
	bne _08055078
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08055066
	b _08055206
_08055066:
	ldr r0, _08055074 @ =sub_80553E4
	bl sub_80543DC
	bl sub_805585C
	b _08055206
	.align 2, 0
_08055074: .4byte sub_80553E4
_08055078:
	mov r0, r8
	subs r0, 0x12
	cmp r0, 0xA
	bls _08055082
	b _08055192
_08055082:
	lsls r0, 2
	ldr r1, _0805508C @ =_08055090
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805508C: .4byte _08055090
	.align 2, 0
_08055090:
	.4byte _080550E8
	.4byte _08055192
	.4byte _08055192
	.4byte _08055192
	.4byte _08055192
	.4byte _08055192
	.4byte _080550BC
	.4byte _08055114
	.4byte _08055192
	.4byte _08055144
	.4byte _08055170
_080550BC:
	adds r0, r6, 0
	bl sub_8055630
	cmp r0, 0
	beq _08055192
	ldr r0, _080550E0 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _080550E4 @ =sub_80553E4
	bl sub_80543DC
	bl sub_80557F4
	b _08055192
	.align 2, 0
_080550E0: .4byte gUnknown_03000580
_080550E4: .4byte sub_80553E4
_080550E8:
	adds r0, r6, 0
	bl sub_8055660
	cmp r0, 0x1
	bne _08055192
	ldr r0, _0805510C @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _08055110 @ =sub_80553E4
	bl sub_80543DC
	bl sub_8055824
	b _08055192
	.align 2, 0
_0805510C: .4byte gUnknown_03000580
_08055110: .4byte sub_80553E4
_08055114:
	adds r0, r6, 0
	bl sub_805568C
	adds r4, r0, 0
	cmp r4, 0
	beq _08055192
	ldr r0, _0805513C @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _08055140 @ =sub_80553E4
	bl sub_80543DC
	adds r0, r4, 0
	bl sub_8055840
	b _08055192
	.align 2, 0
_0805513C: .4byte gUnknown_03000580
_08055140: .4byte sub_80553E4
_08055144:
	adds r0, r6, 0
	bl sub_8055618
	cmp r0, 0
	beq _08055192
	ldr r0, _08055168 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _0805516C @ =sub_8055408
	bl sub_80543DC
	bl sub_80557E8
	b _08055192
	.align 2, 0
_08055168: .4byte gUnknown_03000580
_0805516C: .4byte sub_8055408
_08055170:
	adds r0, r6, 0
	bl sub_8055618
	cmp r0, 0
	beq _08055192
	ldr r0, _080551A4 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _080551A8 @ =sub_8055438
	bl sub_80543DC
	bl sub_80557E8
_08055192:
	mov r0, r8
	cmp r0, 0x17
	beq _080551B8
	cmp r0, 0x17
	bgt _080551AC
	cmp r0, 0x16
	beq _080551C8
	b _08055206
	.align 2, 0
_080551A4: .4byte gUnknown_03000580
_080551A8: .4byte sub_8055438
_080551AC:
	mov r1, r8
	cmp r1, 0x1A
	beq _080551D8
	cmp r1, 0x1D
	beq _080551F8
	b _08055206
_080551B8:
	ldr r0, _080551C4 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x83
	strb r1, [r0]
	b _08055206
	.align 2, 0
_080551C4: .4byte gUnknown_03000580
_080551C8:
	ldr r0, _080551D4 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x82
	strb r1, [r0]
	b _08055206
	.align 2, 0
_080551D4: .4byte gUnknown_03000580
_080551D8:
	ldr r0, _080551F0 @ =gUnknown_03000580
	adds r0, r7, r0
	movs r1, 0x80
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055206
	ldr r0, _080551F4 @ =sub_8055390
	bl sub_80543DC
	b _08055206
	.align 2, 0
_080551F0: .4byte gUnknown_03000580
_080551F4: .4byte sub_8055390
_080551F8:
	ldr r0, _08055214 @ =gUnknown_03000580
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, 0x82
	bne _08055206
	movs r0, 0x81
	strb r0, [r1]
_08055206:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055214: .4byte gUnknown_03000580
	thumb_func_end sub_8054FF8

	thumb_func_start sub_8055218
sub_8055218: @ 8055218
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
_0805522C:
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
	ldr r0, _0805527C @ =gUnknown_03000580
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	bne _0805525C
	adds r0, r5, 0
	bl sub_805530C
	mov r1, r9
	strh r0, [r1]
_0805525C:
	lsls r0, r6, 24
	lsrs r0, 24
	ldrb r1, [r4]
	bl sub_8055BFC
	adds r7, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0805522C
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805527C: .4byte gUnknown_03000580
	thumb_func_end sub_8055218

	thumb_func_start sub_8055280
sub_8055280: @ 8055280
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _08055298 @ =0xffef0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xC
	bhi _080552A0
	ldr r0, _0805529C @ =word_3004858
	strh r1, [r0]
	b _080552A6
	.align 2, 0
_08055298: .4byte 0xffef0000
_0805529C: .4byte word_3004858
_080552A0:
	ldr r1, _080552AC @ =word_3004858
	movs r0, 0x11
	strh r0, [r1]
_080552A6:
	pop {r0}
	bx r0
	.align 2, 0
_080552AC: .4byte word_3004858
	thumb_func_end sub_8055280

	thumb_func_start sub_80552B0
sub_80552B0: @ 80552B0
	push {lr}
	ldr r2, _080552C4 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080552C8
	movs r0, 0x13
	b _08055308
	.align 2, 0
_080552C4: .4byte gMain
_080552C8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080552D4
	movs r0, 0x12
	b _08055308
_080552D4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080552E0
	movs r0, 0x14
	b _08055308
_080552E0:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080552EC
	movs r0, 0x15
	b _08055308
_080552EC:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080552FA
	movs r0, 0x18
	b _08055308
_080552FA:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08055306
	movs r0, 0x11
	b _08055308
_08055306:
	movs r0, 0x19
_08055308:
	pop {r1}
	bx r1
	thumb_func_end sub_80552B0

	thumb_func_start sub_805530C
sub_805530C: @ 805530C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x13
	beq _08055332
	cmp r0, 0x13
	bgt _08055322
	cmp r0, 0x12
	beq _08055336
	b _0805533A
_08055322:
	cmp r1, 0x14
	beq _0805532E
	cmp r1, 0x15
	bne _0805533A
	movs r0, 0x4
	b _0805533C
_0805532E:
	movs r0, 0x3
	b _0805533C
_08055332:
	movs r0, 0x1
	b _0805533C
_08055336:
	movs r0, 0x2
	b _0805533C
_0805533A:
	movs r0, 0
_0805533C:
	pop {r1}
	bx r1
	thumb_func_end sub_805530C

	thumb_func_start sub_8055340
sub_8055340: @ 8055340
	push {lr}
	movs r2, 0x11
	adds r1, r0, 0x6
_08055346:
	strh r2, [r1]
	subs r1, 0x2
	cmp r1, r0
	bge _08055346
	pop {r0}
	bx r0
	thumb_func_end sub_8055340

	thumb_func_start sub_8055354
sub_8055354: @ 8055354
	push {r4,r5,lr}
	ldr r0, _08055384 @ =gUnknown_03004860
	ldrb r4, [r0]
	ldr r5, _08055388 @ =word_3002910
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8055218
	ldr r0, _0805538C @ =gUnknown_03000584
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
_08055384: .4byte gUnknown_03004860
_08055388: .4byte word_3002910
_0805538C: .4byte gUnknown_03000584
	thumb_func_end sub_8055354

	thumb_func_start sub_8055390
sub_8055390: @ 8055390
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080553A4
	movs r0, 0x11
	b _080553DA
_080553A4:
	ldr r1, _080553B4 @ =gLink
	ldr r2, _080553B8 @ =0x00000fbd
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080553BC
	movs r0, 0x1B
	b _080553DA
	.align 2, 0
_080553B4: .4byte gLink
_080553B8: .4byte 0x00000fbd
_080553BC:
	ldr r2, _080553CC @ =0x00000339
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080553D0
	movs r0, 0x1C
	b _080553DA
	.align 2, 0
_080553CC: .4byte 0x00000339
_080553D0:
	adds r0, r4, 0
	bl sub_80552B0
	lsls r0, 16
	lsrs r0, 16
_080553DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055390

	thumb_func_start sub_80553E0
sub_80553E0: @ 80553E0
	movs r0, 0x11
	bx lr
	thumb_func_end sub_80553E0

	thumb_func_start sub_80553E4
sub_80553E4: @ 80553E4
	push {r4,lr}
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x11
	cmp r0, 0x1
	beq _080553FC
	movs r4, 0x1A
	ldr r0, _08055404 @ =sub_80553E0
	bl sub_80543DC
_080553FC:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055404: .4byte sub_80553E0
	thumb_func_end sub_80553E4

	thumb_func_start sub_8055408
sub_8055408: @ 8055408
	push {r4,lr}
	ldr r0, _0805542C @ =gLink
	ldr r1, _08055430 @ =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08055424
	movs r4, 0x1A
	bl ScriptContext2_Disable
	ldr r0, _08055434 @ =sub_80553E0
	bl sub_80543DC
_08055424:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805542C: .4byte gLink
_08055430: .4byte 0x00000fbd
_08055434: .4byte sub_80553E0
	thumb_func_end sub_8055408

	thumb_func_start sub_8055438
sub_8055438: @ 8055438
	push {r4,lr}
	ldr r0, _0805545C @ =gLink
	ldr r1, _08055460 @ =0x00000339
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08055454
	movs r4, 0x1A
	bl ScriptContext2_Disable
	ldr r0, _08055464 @ =sub_80553E0
	bl sub_80543DC
_08055454:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805545C: .4byte gLink
_08055460: .4byte 0x00000339
_08055464: .4byte sub_80553E0
	thumb_func_end sub_8055438

	thumb_func_start sub_8055468
sub_8055468: @ 8055468
	movs r0, 0x11
	bx lr
	thumb_func_end sub_8055468

	thumb_func_start sub_805546C
sub_805546C: @ 805546C
	push {lr}
	ldr r1, _08055490 @ =gUnknown_03000580
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	bne _0805549C
	ldr r0, _08055494 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0805549C
	ldr r0, _08055498 @ =sub_8055468
	bl sub_80543DC
	movs r0, 0x1D
	b _0805549E
	.align 2, 0
_08055490: .4byte gUnknown_03000580
_08055494: .4byte gMain
_08055498: .4byte sub_8055468
_0805549C:
	movs r0, 0x11
_0805549E:
	pop {r1}
	bx r1
	thumb_func_end sub_805546C

	thumb_func_start sub_80554A4
sub_80554A4: @ 80554A4
	push {lr}
	ldr r0, _080554B4 @ =sub_805546C
	bl sub_80543DC
	movs r0, 0x16
	pop {r1}
	bx r1
	.align 2, 0
_080554B4: .4byte sub_805546C
	thumb_func_end sub_80554A4

	thumb_func_start sub_80554B8
sub_80554B8: @ 80554B8
	movs r0, 0x11
	bx lr
	thumb_func_end sub_80554B8

	thumb_func_start sub_80554BC
sub_80554BC: @ 80554BC
	push {lr}
	movs r0, 0x83
	bl sub_8054F88
	cmp r0, 0x1
	bne _080554D4
	ldr r0, _080554DC @ =gUnknown_081A4508
	bl ScriptContext1_SetupScript
	ldr r0, _080554E0 @ =sub_80554B8
	bl sub_80543DC
_080554D4:
	movs r0, 0x11
	pop {r1}
	bx r1
	.align 2, 0
_080554DC: .4byte gUnknown_081A4508
_080554E0: .4byte sub_80554B8
	thumb_func_end sub_80554BC

	thumb_func_start sub_80554E4
sub_80554E4: @ 80554E4
	push {lr}
	ldr r0, _080554F4 @ =sub_80554BC
	bl sub_80543DC
	movs r0, 0x17
	pop {r1}
	bx r1
	.align 2, 0
_080554F4: .4byte sub_80554BC
	thumb_func_end sub_80554E4

	thumb_func_start sub_80554F8
sub_80554F8: @ 80554F8
	push {lr}
	movs r0, 0x83
	bl sub_8054FC0
	cmp r0, 0x1
	beq _0805554A
	ldr r0, _08055524 @ =gUnknown_03000584
	ldr r2, [r0]
	ldr r1, _08055528 @ =sub_805546C
	adds r3, r0, 0
	cmp r2, r1
	bne _08055534
	ldr r1, _0805552C @ =gUnknown_03000580
	ldr r0, _08055530 @ =gUnknown_03004860
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	beq _08055534
	movs r0, 0
	b _08055562
	.align 2, 0
_08055524: .4byte gUnknown_03000584
_08055528: .4byte sub_805546C
_0805552C: .4byte gUnknown_03000580
_08055530: .4byte gUnknown_03004860
_08055534:
	ldr r1, [r3]
	ldr r0, _08055550 @ =sub_8055468
	cmp r1, r0
	bne _0805555C
	ldr r1, _08055554 @ =gUnknown_03000580
	ldr r0, _08055558 @ =gUnknown_03004860
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x81
	bne _0805555C
_0805554A:
	movs r0, 0x2
	b _08055562
	.align 2, 0
_08055550: .4byte sub_8055468
_08055554: .4byte gUnknown_03000580
_08055558: .4byte gUnknown_03004860
_0805555C:
	movs r0, 0x82
	bl sub_8054F88
_08055562:
	pop {r1}
	bx r1
	thumb_func_end sub_80554F8

	thumb_func_start unref_sub_8055568
unref_sub_8055568: @ 8055568
	push {lr}
	movs r0, 0x83
	bl sub_8054FC0
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8055568

	thumb_func_start sub_8055574
sub_8055574: @ 8055574
	push {lr}
	ldr r0, _08055584 @ =sub_80554A4
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08055584: .4byte sub_80554A4
	thumb_func_end sub_8055574

	thumb_func_start sub_8055588
sub_8055588: @ 8055588
	push {lr}
	ldr r0, _08055598 @ =sub_80553E4
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08055598: .4byte sub_80553E4
	thumb_func_end sub_8055588

	thumb_func_start sub_805559C
sub_805559C: @ 805559C
	push {lr}
	ldr r0, _080555AC @ =sub_80554E4
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080555AC: .4byte sub_80554E4
	thumb_func_end sub_805559C

	thumb_func_start sub_80555B0
sub_80555B0: @ 80555B0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	strb r4, [r6]
	movs r0, 0
	cmp r4, r1
	bne _080555C2
	movs r0, 0x1
_080555C2:
	strb r0, [r6, 0x1]
	ldr r1, _08055614 @ =gLinkPlayerMapObjects
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
_08055614: .4byte gLinkPlayerMapObjects
	thumb_func_end sub_80555B0

	thumb_func_start sub_8055618
sub_8055618: @ 8055618
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _08055624
	cmp r0, 0
	bne _08055628
_08055624:
	movs r0, 0x1
	b _0805562A
_08055628:
	movs r0, 0
_0805562A:
	pop {r1}
	bx r1
	thumb_func_end sub_8055618

	thumb_func_start sub_8055630
sub_8055630: @ 8055630
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _0805563C
	cmp r0, 0
	bne _08055640
_0805563C:
	movs r0, 0x1
	b _08055642
_08055640:
	movs r0, 0
_08055642:
	pop {r1}
	bx r1
	thumb_func_end sub_8055630

	thumb_func_start sub_8055648
sub_8055648: @ 8055648
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1, 0x2]
	cmp r0, 0x2
	bne _0805565A
	adds r0, r1, 0x4
	bl sub_8068E24
	b _0805565C
_0805565A:
	movs r0, 0
_0805565C:
	pop {r1}
	bx r1
	thumb_func_end sub_8055648

	thumb_func_start sub_8055660
sub_8055660: @ 8055660
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _0805566E
	cmp r0, 0
	bne _08055684
_0805566E:
	ldrb r0, [r4, 0xC]
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _08055684
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _08055684
	movs r0, 0x1
	b _08055686
_08055684:
	movs r0, 0
_08055686:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055660

	thumb_func_start sub_805568C
sub_805568C: @ 805568C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _080556A0
	cmp r0, 0x2
	beq _080556A0
	movs r0, 0
	b _0805574E
_080556A0:
	ldr r0, [r4, 0x4]
	ldr r1, [r4, 0x8]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r3, _08055710 @ =gUnknown_0821664C
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r0, r3
	ldr r0, [r0]
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08055714 @ =0xffff0000
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
	ldr r1, _08055718 @ =0x0000ffff
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r2, _0805571C @ =0xffffff00
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
	beq _08055744
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0805570C
	ldr r0, _08055720 @ =gUnknown_03000580
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	beq _08055728
_0805570C:
	ldr r0, _08055724 @ =gUnknown_081A4495
	b _0805574E
	.align 2, 0
_08055710: .4byte gUnknown_0821664C
_08055714: .4byte 0xffff0000
_08055718: .4byte 0x0000ffff
_0805571C: .4byte 0xffffff00
_08055720: .4byte gUnknown_03000580
_08055724: .4byte gUnknown_081A4495
_08055728:
	adds r0, r2, 0
	bl sub_8083BF4
	cmp r0, 0
	bne _0805573C
	ldr r0, _08055738 @ =gUnknown_081A4479
	b _0805574E
	.align 2, 0
_08055738: .4byte gUnknown_081A4479
_0805573C:
	ldr r0, _08055740 @ =gUnknown_081A4487
	b _0805574E
	.align 2, 0
_08055740: .4byte gUnknown_081A4487
_08055744:
	ldrb r1, [r4, 0xC]
	ldrb r2, [r4, 0x3]
	mov r0, sp
	bl sub_80682A8
_0805574E:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805568C

	thumb_func_start sub_8055758
sub_8055758: @ 8055758
	push {lr}
	adds r1, r0, 0
	ldr r0, _080557A4 @ =DoubleBattleColosseum_EventScript_1A4383
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557A8 @ =DoubleBattleColosseum_EventScript_1A439E
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557AC @ =gUnknown_081A43B9
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557B0 @ =DoubleBattleColosseum_EventScript_1A43D4
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557B4 @ =gUnknown_081A4418
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557B8 @ =gUnknown_081A442D
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557BC @ =gUnknown_081A4442
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557C0 @ =RecordCorner_EventScript_1A4457
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557C4 @ =SingleBattleColosseum_EventScript_1A436F
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557C8 @ =SingleBattleColosseum_EventScript_1A4379
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557CC @ =TradeCenter_EventScript_1A43F0
	cmp r1, r0
	bne _080557D0
_0805579E:
	movs r0, 0xA
	b _080557E2
	.align 2, 0
_080557A4: .4byte DoubleBattleColosseum_EventScript_1A4383
_080557A8: .4byte DoubleBattleColosseum_EventScript_1A439E
_080557AC: .4byte gUnknown_081A43B9
_080557B0: .4byte DoubleBattleColosseum_EventScript_1A43D4
_080557B4: .4byte gUnknown_081A4418
_080557B8: .4byte gUnknown_081A442D
_080557BC: .4byte gUnknown_081A4442
_080557C0: .4byte RecordCorner_EventScript_1A4457
_080557C4: .4byte SingleBattleColosseum_EventScript_1A436F
_080557C8: .4byte SingleBattleColosseum_EventScript_1A4379
_080557CC: .4byte TradeCenter_EventScript_1A43F0
_080557D0:
	ldr r0, _080557DC @ =gUnknown_081A43FA
	cmp r1, r0
	beq _080557E0
	movs r0, 0
	b _080557E2
	.align 2, 0
_080557DC: .4byte gUnknown_081A43FA
_080557E0:
	movs r0, 0x9
_080557E2:
	pop {r1}
	bx r1
	thumb_func_end sub_8055758

	thumb_func_start sub_80557E8
sub_80557E8: @ 80557E8
	push {lr}
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_80557E8

	thumb_func_start sub_80557F4
sub_80557F4: @ 80557F4
	push {lr}
	movs r0, 0x6
	bl PlaySE
	bl sub_8071310
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_80557F4

	thumb_func_start sub_8055808
sub_8055808: @ 8055808
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
sub_8055824: @ 8055824
	push {lr}
	movs r0, 0x6
	bl PlaySE
	ldr r0, _0805583C @ =gUnknown_081A44E5
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0805583C: .4byte gUnknown_081A44E5
	thumb_func_end sub_8055824

	thumb_func_start sub_8055840
sub_8055840: @ 8055840
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
sub_805585C: @ 805585C
	push {lr}
	ldr r0, _0805586C @ =gUnknown_081A44FE
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0805586C: .4byte gUnknown_081A44FE
	thumb_func_end sub_805585C

	thumb_func_start sub_8055870
sub_8055870: @ 8055870
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0
	bne _0805587E
	movs r0, 0
	b _080558A4
_0805587E:
	ldr r0, _08055890 @ =gLink
	ldr r1, _08055894 @ =0x00000fbd
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0805589C
	ldr r1, _08055898 @ =gUnknown_03000588
	movs r0, 0x1
	b _080558A0
	.align 2, 0
_08055890: .4byte gLink
_08055894: .4byte 0x00000fbd
_08055898: .4byte gUnknown_03000588
_0805589C:
	ldr r1, _080558A8 @ =gUnknown_03000588
	movs r0, 0
_080558A0:
	strb r0, [r1]
	ldrb r0, [r1]
_080558A4:
	pop {r1}
	bx r1
	.align 2, 0
_080558A8: .4byte gUnknown_03000588
	thumb_func_end sub_8055870

	thumb_func_start sub_80558AC
sub_80558AC: @ 80558AC
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08055908
	bl sub_8007B24
	cmp r0, 0x1
	bne _08055908
	ldr r0, _080558F4 @ =gUnknown_03000584
	ldr r1, [r0]
	ldr r0, _080558F8 @ =sub_8055408
	cmp r1, r0
	beq _080558F0
	ldr r0, _080558FC @ =sub_80553E4
	cmp r1, r0
	bne _08055908
	ldr r0, _08055900 @ =gUnknown_03000588
	ldrb r2, [r0]
	movs r1, 0
	strb r1, [r0]
	cmp r2, 0x1
	beq _080558F0
	ldr r2, _08055904 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08055908
	ldrb r1, [r2, 0xA]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08055908
_080558F0:
	movs r0, 0x1
	b _0805590A
	.align 2, 0
_080558F4: .4byte gUnknown_03000584
_080558F8: .4byte sub_8055408
_080558FC: .4byte sub_80553E4
_08055900: .4byte gUnknown_03000588
_08055904: .4byte gPaletteFade
_08055908:
	movs r0, 0
_0805590A:
	pop {r1}
	bx r1
	thumb_func_end sub_80558AC

	thumb_func_start sub_8055910
sub_8055910: @ 8055910
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _0805592C
	bl sub_8007B24
	cmp r0, 0x1
	bne _0805592C
	ldr r0, _08055930 @ =gUnknown_03000584
	ldr r1, [r0]
	ldr r0, _08055934 @ =sub_8055438
	cmp r1, r0
	beq _08055938
_0805592C:
	movs r0, 0
	b _0805593A
	.align 2, 0
_08055930: .4byte gUnknown_03000584
_08055934: .4byte sub_8055438
_08055938:
	movs r0, 0x1
_0805593A:
	pop {r1}
	bx r1
	thumb_func_end sub_8055910

	thumb_func_start sub_8055940
sub_8055940: @ 8055940
	push {lr}
	bl sub_8007B24
	cmp r0, 0
	beq _0805594E
	movs r0, 0x1
	b _08055950
_0805594E:
	movs r0, 0
_08055950:
	pop {r1}
	bx r1
	thumb_func_end sub_8055940

	thumb_func_start ZeroLinkPlayerMapObject
ZeroLinkPlayerMapObject: @ 8055954
	movs r1, 0
	str r1, [r0]
	bx lr
	thumb_func_end ZeroLinkPlayerMapObject

	thumb_func_start strange_npc_table_clear
strange_npc_table_clear: @ 805595C
	push {lr}
	ldr r0, _0805596C @ =gLinkPlayerMapObjects
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0805596C: .4byte gLinkPlayerMapObjects
	thumb_func_end strange_npc_table_clear

	thumb_func_start ZeroMapObject
ZeroMapObject: @ 8055970
	push {lr}
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	thumb_func_end ZeroMapObject

	thumb_func_start SpawnLinkPlayerMapObject
SpawnLinkPlayerMapObject: @ 8055980
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
	ldr r0, _08055A24 @ =gLinkPlayerMapObjects
	adds r4, r0
	lsls r5, r6, 3
	adds r5, r6
	lsls r5, 2
	ldr r0, _08055A28 @ =gMapObjects
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
_08055A24: .4byte gLinkPlayerMapObjects
_08055A28: .4byte gMapObjects
	thumb_func_end SpawnLinkPlayerMapObject

	thumb_func_start InitLinkPlayerMapObjectPos
InitLinkPlayerMapObjectPos: @ 8055A2C
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
unref_sub_8055A6C: @ 8055A6C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _08055A94 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08055A8E
	ldrb r0, [r1, 0x2]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08055A98 @ =gMapObjects
	adds r1, r0
	strb r2, [r1, 0x19]
_08055A8E:
	pop {r0}
	bx r0
	.align 2, 0
_08055A94: .4byte gLinkPlayerMapObjects
_08055A98: .4byte gMapObjects
	thumb_func_end unref_sub_8055A6C

	thumb_func_start unref_sub_8055A9C
unref_sub_8055A9C: @ 8055A9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08055ADC @ =gLinkPlayerMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055AE0 @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x40
	beq _08055AC8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055AE4 @ =gSprites
	adds r0, r1
	bl DestroySprite
_08055AC8:
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
_08055ADC: .4byte gLinkPlayerMapObjects
_08055AE0: .4byte gMapObjects
_08055AE4: .4byte gSprites
	thumb_func_end unref_sub_8055A9C

	thumb_func_start sub_8055AE8
sub_8055AE8: @ 8055AE8
	lsls r0, 24
	ldr r1, _08055B00 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B04 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_08055B00: .4byte gLinkPlayerMapObjects
_08055B04: .4byte gMapObjects
	thumb_func_end sub_8055AE8

	thumb_func_start sub_8055B08
sub_8055B08: @ 8055B08
	lsls r0, 24
	ldr r3, _08055B28 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r3
	ldrb r3, [r0, 0x2]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _08055B2C @ =gMapObjects
	adds r0, r3
	ldrh r3, [r0, 0x10]
	strh r3, [r1]
	ldrh r0, [r0, 0x12]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08055B28: .4byte gLinkPlayerMapObjects
_08055B2C: .4byte gMapObjects
	thumb_func_end sub_8055B08

	thumb_func_start sub_8055B30
sub_8055B30: @ 8055B30
	lsls r0, 24
	ldr r1, _08055B48 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B4C @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x19]
	bx lr
	.align 2, 0
_08055B48: .4byte gLinkPlayerMapObjects
_08055B4C: .4byte gMapObjects
	thumb_func_end sub_8055B30

	thumb_func_start sub_8055B50
sub_8055B50: @ 8055B50
	lsls r0, 24
	ldr r1, _08055B6C @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B70 @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08055B6C: .4byte gLinkPlayerMapObjects
_08055B70: .4byte gMapObjects
	thumb_func_end sub_8055B50

	thumb_func_start unref_sub_8055B74
unref_sub_8055B74: @ 8055B74
	lsls r0, 24
	ldr r1, _08055B94 @ =gLinkPlayerMapObjects
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B98 @ =gMapObjects
	adds r0, r1
	adds r0, 0x21
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x10
	subs r0, r1
	bx lr
	.align 2, 0
_08055B94: .4byte gLinkPlayerMapObjects
_08055B98: .4byte gMapObjects
	thumb_func_end unref_sub_8055B74

	thumb_func_start GetLinkPlayerIdAt
GetLinkPlayerIdAt: @ 8055B9C
	push {r4-r6,lr}
	movs r2, 0
	ldr r5, _08055BE0 @ =gLinkPlayerMapObjects
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r3, r1, 16
_08055BAA:
	lsls r0, r2, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	beq _08055BE8
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08055BBE
	cmp r0, 0x2
	bne _08055BE8
_08055BBE:
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055BE4 @ =gMapObjects
	adds r1, r0, r1
	movs r6, 0x10
	ldrsh r0, [r1, r6]
	cmp r0, r4
	bne _08055BE8
	movs r6, 0x12
	ldrsh r0, [r1, r6]
	cmp r0, r3
	bne _08055BE8
	adds r0, r2, 0
	b _08055BF4
	.align 2, 0
_08055BE0: .4byte gLinkPlayerMapObjects
_08055BE4: .4byte gMapObjects
_08055BE8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08055BAA
	movs r0, 0x4
_08055BF4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLinkPlayerIdAt

	thumb_func_start sub_8055BFC
sub_8055BFC: @ 8055BFC
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	adds r2, r3, 0
	lsrs r0, 22
	ldr r1, _08055C2C @ =gLinkPlayerMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055C30 @ =gMapObjects
	adds r6, r0, r1
	ldrb r0, [r5]
	cmp r0, 0
	beq _08055C58
	cmp r3, 0xA
	bls _08055C34
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	b _08055C58
	.align 2, 0
_08055C2C: .4byte gLinkPlayerMapObjects
_08055C30: .4byte gMapObjects
_08055C34:
	ldr r4, _08055C60 @ =gUnknown_082166D8
	ldr r1, _08055C64 @ =gUnknown_082166A0
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
_08055C58:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055C60: .4byte gUnknown_082166D8
_08055C64: .4byte gUnknown_082166A0
	thumb_func_end sub_8055BFC

	thumb_func_start sub_8055C68
sub_8055C68: @ 8055C68
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08055C84 @ =gUnknown_082166AC
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
_08055C84: .4byte gUnknown_082166AC
	thumb_func_end sub_8055C68

	thumb_func_start sub_8055C88
sub_8055C88: @ 8055C88
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8055C88

	thumb_func_start sub_8055C8C
sub_8055C8C: @ 8055C8C
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08055CA8 @ =gUnknown_082166AC
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
_08055CA8: .4byte gUnknown_082166AC
	thumb_func_end sub_8055C8C

	thumb_func_start sub_8055CAC
sub_8055CAC: @ 8055CAC
	movs r0, 0
	bx lr
	thumb_func_end sub_8055CAC

	thumb_func_start sub_8055CB0
sub_8055CB0: @ 8055CB0
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
	bne _08055D0E
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
	b _08055D10
_08055D0E:
	movs r0, 0
_08055D10:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8055CB0

	thumb_func_start sub_8055D18
sub_8055D18: @ 8055D18
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
sub_8055D30: @ 8055D30
	movs r1, 0
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end sub_8055D30

	thumb_func_start sub_8055D38
sub_8055D38: @ 8055D38
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
	bne _08055D68
	adds r0, r4, 0
	bl npc_coords_shift_still
	movs r0, 0x2
	strb r0, [r6, 0x3]
_08055D68:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8055D38

	thumb_func_start npc_something3
npc_something3: @ 8055D70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _08055DC8
	lsls r0, 2
	ldr r1, _08055D8C @ =_08055D90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055D8C: .4byte _08055D90
	.align 2, 0
_08055D90:
	.4byte _08055DB8
	.4byte _08055DBC
	.4byte _08055DC0
	.4byte _08055DC4
	.4byte _08055DC8
	.4byte _08055DC8
	.4byte _08055DB8
	.4byte _08055DBC
	.4byte _08055DC0
	.4byte _08055DC4
_08055DB8:
	movs r0, 0x2
	b _08055DCA
_08055DBC:
	movs r0, 0x1
	b _08055DCA
_08055DC0:
	movs r0, 0x3
	b _08055DCA
_08055DC4:
	movs r0, 0x4
	b _08055DCA
_08055DC8:
	adds r0, r2, 0
_08055DCA:
	pop {r1}
	bx r1
	thumb_func_end npc_something3

	thumb_func_start LinkPlayerDetectCollision
LinkPlayerDetectCollision: @ 8055DD0
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
	ldr r0, _08055E34 @ =gMapObjects
	mov r9, r0
	lsrs r2, r3, 16
	mov r10, r2
	asrs r6, r3, 16
_08055DF4:
	mov r7, r12
	lsls r3, r7, 16
	mov r0, r10
	lsls r5, r0, 16
	cmp r4, r8
	beq _08055E38
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	asrs r2, r3, 16
	cmp r0, r2
	bne _08055E1C
	movs r7, 0x12
	ldrsh r0, [r1, r7]
	cmp r0, r6
	beq _08055E2E
_08055E1C:
	movs r7, 0x14
	ldrsh r0, [r1, r7]
	cmp r0, r2
	bne _08055E38
	movs r0, 0x16
	ldrsh r1, [r1, r0]
	asrs r0, r5, 16
	cmp r1, r0
	bne _08055E38
_08055E2E:
	movs r0, 0x1
	b _08055E4E
	.align 2, 0
_08055E34: .4byte gMapObjects
_08055E38:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08055DF4
	asrs r0, r3, 16
	asrs r1, r5, 16
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
_08055E4E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LinkPlayerDetectCollision

	thumb_func_start CreateLinkPlayerSprite
CreateLinkPlayerSprite: @ 8055E5C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, r5, 2
	ldr r0, _08055EC8 @ =gLinkPlayerMapObjects
	adds r2, r0
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055ECC @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	beq _08055EBE
	ldrb r1, [r4]
	lsls r1, 30
	lsrs r1, 31
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08055ED0 @ =SpriteCB_LinkPlayer
	movs r2, 0
	str r2, [sp]
	movs r3, 0
	bl AddPseudoFieldObject
	strb r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055ED4 @ =gSprites
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
_08055EBE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055EC8: .4byte gLinkPlayerMapObjects
_08055ECC: .4byte gMapObjects
_08055ED0: .4byte SpriteCB_LinkPlayer
_08055ED4: .4byte gSprites
	thumb_func_end CreateLinkPlayerSprite

	thumb_func_start SpriteCB_LinkPlayer
SpriteCB_LinkPlayer: @ 8055ED8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 2
	ldr r0, _08055F3C @ =gLinkPlayerMapObjects
	adds r4, r0
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055F40 @ =gMapObjects
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
	bne _08055F44
	ldrb r0, [r6, 0x19]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	b _08055F56
	.align 2, 0
_08055F3C: .4byte gLinkPlayerMapObjects
_08055F40: .4byte gMapObjects
_08055F44:
	ldrb r0, [r6, 0x19]
	bl get_go_image_anim_num
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
_08055F56:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrb r0, [r6]
	lsls r0, 29
	cmp r0, 0
	bge _08055F88
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
_08055F88:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_LinkPlayer

	.align 2, 0 @ Don't pad with nop.
