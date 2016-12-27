	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8067EEC
sub_8067EEC: @ 806822C
	push {r4,r5,lr}
	movs r1, 0x2
	negs r1, r1
	movs r3, 0x3
	negs r3, r3
	movs r4, 0x5
	negs r4, r4
	movs r5, 0x9
	negs r5, r5
	movs r2, 0
	strb r2, [r0]
	ldrb r2, [r0, 0x1]
	ands r1, r2
	ands r1, r3
	ands r1, r4
	ands r1, r5
	strb r1, [r0, 0x1]
	movs r1, 0
	strb r1, [r0, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8067EEC

	thumb_func_start process_overworld_input
process_overworld_input: @ 8068258
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _08068328 @ =gPlayerAvatar
	ldrb r6, [r0, 0x3]
	ldrb r0, [r0, 0x2]
	mov r9, r0
	bl cur_mapdata_block_role_at_player_pos
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056FFC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0x2
	bne _0806828C
	cmp r7, 0
	beq _08068290
_0806828C:
	cmp r6, 0
	bne _080682F2
_08068290:
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080682DC
	movs r0, 0x8
	ands r0, r5
	cmp r0, 0
	beq _080682AC
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_080682AC:
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	beq _080682BC
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
_080682BC:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _080682CC
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
_080682CC:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080682DC
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_080682DC:
	movs r0, 0xF0
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _080682F2
	ldrb r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4]
_080682F2:
	cmp r7, 0
	bne _08068318
	cmp r6, 0x2
	bne _08068308
	mov r0, r9
	cmp r0, 0x2
	bne _08068308
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4]
_08068308:
	cmp r7, 0
	bne _08068318
	cmp r6, 0x2
	bne _08068318
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
_08068318:
	movs r0, 0x40
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _0806832C
	movs r0, 0x2
	b _08068354
	.align 2, 0
_08068328: .4byte gPlayerAvatar
_0806832C:
	movs r0, 0x80
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _0806833A
	movs r0, 0x1
	b _08068354
_0806833A:
	movs r0, 0x20
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068348
	movs r0, 0x3
	b _08068354
_08068348:
	movs r0, 0x10
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068356
	movs r0, 0x4
_08068354:
	strb r0, [r4, 0x2]
_08068356:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end process_overworld_input

	thumb_func_start sub_8068024
sub_8068024: @ 8068364
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	bl CheckTrainers
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
	bl mapheader_run_first_tag2_script_list_match
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080683B6
	bl sub_80687A4
	cmp r0, 0x1
	beq _08068490
_080683B6:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080683D8
	movs r0, 0x5
	bl sav12_xor_increment
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80687E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
_080683D8:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080683F0
	adds r0, r4, 0
	bl is_it_battle_time_3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
_080683F0:
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08068412
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _08068412
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl mapheader_run_first_tag2_script_list_match_conditionally
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
_08068412:
	mov r4, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08068448
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80681F0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
_08068448:
	ldrb r1, [r5]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806846A
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806846A
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl map_warp_consider_2_to_inside
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068490
_0806846A:
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806847C
	bl sub_8068770
	cmp r0, 0x1
	beq _08068490
_0806847C:
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08068494
	movs r0, 0x6
	bl PlaySE
	bl sub_8071310
_08068490:
	movs r0, 0x1
	b _080684A6
_08068494:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080684A4
	bl sub_80A6D1C
	cmp r0, 0x1
	beq _08068490
_080684A4:
	movs r0, 0
_080684A6:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068024

	thumb_func_start player_get_pos_to_and_height
player_get_pos_to_and_height: @ 80684B0
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0x2
	bl PlayerGetDestCoords
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end player_get_pos_to_and_height

	thumb_func_start player_get_next_pos_and_height
player_get_next_pos_and_height: @ 80684C8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r1, r5, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080684FA
	bl PlayerGetZCoord
_080684FA:
	strb r0, [r5, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end player_get_next_pos_and_height

	thumb_func_start cur_mapdata_block_role_at_player_pos
cur_mapdata_block_role_at_player_pos: @ 8068504
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_block_role_at_player_pos

	thumb_func_start sub_80681F0
sub_80681F0: @ 8068530
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	bl TryGetScriptOnPressingA
	adds r4, r0, 0
	cmp r4, 0
	bne _08068548
	movs r0, 0
	b _08068574
_08068548:
	ldr r0, _0806857C @ =LittlerootTown_BrendansHouse_2F_EventScript_15281E
	cmp r4, r0
	beq _0806856C
	ldr r0, _08068580 @ =gUnknown_08152C39
	cmp r4, r0
	beq _0806856C
	ldr r0, _08068584 @ =gUnknown_0815F36C
	cmp r4, r0
	beq _0806856C
	ldr r0, _08068588 @ =gUnknown_0815F43A
	cmp r4, r0
	beq _0806856C
	ldr r0, _0806858C @ =gUnknown_081A0009
	cmp r4, r0
	beq _0806856C
	movs r0, 0x5
	bl PlaySE
_0806856C:
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_08068574:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806857C: .4byte LittlerootTown_BrendansHouse_2F_EventScript_15281E
_08068580: .4byte gUnknown_08152C39
_08068584: .4byte gUnknown_0815F36C
_08068588: .4byte gUnknown_0815F43A
_0806858C: .4byte gUnknown_081A0009
	thumb_func_end sub_80681F0

	thumb_func_start TryGetScriptOnPressingA
TryGetScriptOnPressingA: @ 8068590
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r4, r2, 24
	adds r7, r4, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068364
	cmp r0, 0
	bne _080685DC
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl TryGetInvisibleMapObjectScript
	cmp r0, 0
	bne _080685DC
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068500
	cmp r0, 0
	bne _080685DC
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	bl TryGetFieldMoveScript
	cmp r0, 0
	bne _080685DC
	movs r0, 0
_080685DC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetScriptOnPressingA

	thumb_func_start sub_80682A8
sub_80682A8: @ 80685E8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	cmp r0, 0
	bne _08068610
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	b _0806862E
_08068610:
	ldr r1, _08068654 @ =gUnknown_0821664C
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
_0806862E:
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0806864E
	ldr r1, _08068658 @ =gMapObjects
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	adds r5, r1, 0
	cmp r0, 0xFF
	bne _0806865C
_0806864E:
	movs r0, 0
	b _0806868E
	.align 2, 0
_08068654: .4byte gUnknown_0821664C
_08068658: .4byte gMapObjects
_0806865C:
	movs r4, 0
	ldr r1, _08068694 @ =gLinkPlayerMapObjects
_08068660:
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _0806866C
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	beq _0806864E
_0806866C:
	adds r1, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _08068660
	ldr r0, _08068698 @ =gSelectedMapObject
	strb r3, [r0]
	ldr r1, _0806869C @ =gScriptLastTalked
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	ldr r0, _080686A0 @ =gScriptFacing
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
_0806868E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068694: .4byte gLinkPlayerMapObjects
_08068698: .4byte gSelectedMapObject
_0806869C: .4byte gScriptLastTalked
_080686A0: .4byte gScriptFacing
	thumb_func_end sub_80682A8

	thumb_func_start sub_8068364
sub_8068364: @ 80686A4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _080686D2
	ldr r1, _08068720 @ =gMapObjects
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _08068728
_080686D2:
	adds r0, r5, 0
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806871C
	ldr r1, _08068724 @ =gUnknown_0821664C
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0806871C
	ldr r1, _08068720 @ =gMapObjects
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _08068728
_0806871C:
	movs r0, 0
	b _0806874C
	.align 2, 0
_08068720: .4byte gMapObjects
_08068724: .4byte gUnknown_0821664C
_08068728:
	ldr r0, _08068754 @ =gSelectedMapObject
	strb r3, [r0]
	ldr r4, _08068758 @ =gScriptLastTalked
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	strh r0, [r4]
	ldr r0, _0806875C @ =gScriptFacing
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r1, r0, 0
	ldrb r0, [r4]
	bl GetRamScript
	adds r1, r0, 0
_0806874C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068754: .4byte gSelectedMapObject
_08068758: .4byte gScriptLastTalked
_0806875C: .4byte gScriptFacing
	thumb_func_end sub_8068364

	thumb_func_start TryGetInvisibleMapObjectScript
TryGetInvisibleMapObjectScript: @ 8068760
	push {r4,r5,lr}
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _08068790 @ =gMapHeader
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl FindInvisibleMapObjectByPosition
	cmp r0, 0
	beq _080687D4
	ldr r2, [r0, 0x8]
	cmp r2, 0
	bne _08068798
	ldr r0, _08068794 @ =gUnknown_081C6C02
	b _0806883A
	.align 2, 0
_08068790: .4byte gMapHeader
_08068794: .4byte gUnknown_081C6C02
_08068798:
	ldrb r0, [r0, 0x5]
	cmp r0, 0x8
	bhi _08068838
	lsls r0, 2
	ldr r1, _080687A8 @ =_080687AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080687A8: .4byte _080687AC
	.align 2, 0
_080687AC:
	.4byte _08068838
	.4byte _080687D0
	.4byte _080687D8
	.4byte _080687DE
	.4byte _080687E4
	.4byte _080687EA
	.4byte _080687EA
	.4byte _080687EA
	.4byte _08068818
_080687D0:
	cmp r5, 0x2
	beq _08068838
_080687D4:
	movs r0, 0
	b _0806883A
_080687D8:
	cmp r5, 0x1
	beq _08068838
	b _080687D4
_080687DE:
	cmp r5, 0x4
	beq _08068838
	b _080687D4
_080687E4:
	cmp r5, 0x3
	beq _08068838
	b _080687D4
_080687EA:
	ldr r1, _0806880C @ =gSpecialVar_0x8004
	lsrs r0, r2, 16
	movs r3, 0x96
	lsls r3, 2
	adds r0, r3
	strh r0, [r1]
	ldr r0, _08068810 @ =gSpecialVar_0x8005
	strh r2, [r0]
	ldrh r0, [r1]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080687D4
	ldr r0, _08068814 @ =HiddenItemScript
	b _0806883A
	.align 2, 0
_0806880C: .4byte gSpecialVar_0x8004
_08068810: .4byte gSpecialVar_0x8005
_08068814: .4byte HiddenItemScript
_08068818:
	cmp r5, 0x2
	bne _080687D4
	ldr r0, _08068830 @ =gSpecialVar_0x8004
	strh r2, [r0]
	bl sub_80BC050
	lsls r0, 24
	cmp r0, 0
	beq _080687D4
	ldr r0, _08068834 @ =gUnknown_081A2C51
	b _0806883A
	.align 2, 0
_08068830: .4byte gSpecialVar_0x8004
_08068834: .4byte gUnknown_081A2C51
_08068838:
	adds r0, r2, 0
_0806883A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end TryGetInvisibleMapObjectScript

	thumb_func_start sub_8068500
sub_8068500: @ 8068840
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r2, 0
	bl MetatileBehavior_IsPlayerFacingTVScreen
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068864
	ldr r0, _08068860 @ =Event_TV
	b _08068A2E
	.align 2, 0
_08068860: .4byte Event_TV
_08068864:
	adds r0, r5, 0
	bl MetatileBehavior_IsPC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806887C
	ldr r0, _08068878 @ =gUnknown_081A0009
	b _08068A2E
	.align 2, 0
_08068878: .4byte gUnknown_081A0009
_0806887C:
	adds r0, r5, 0
	bl is_tile_x8B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068894
	ldr r0, _08068890 @ =ClosedSootopolisGymDoorScript
	b _08068A2E
	.align 2, 0
_08068890: .4byte ClosedSootopolisGymDoorScript
_08068894:
	adds r0, r5, 0
	bl is_tile_x84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688AC
	ldr r0, _080688A8 @ =gUnknown_081A4363
	b _08068A2E
	.align 2, 0
_080688A8: .4byte gUnknown_081A4363
_080688AC:
	adds r0, r5, 0
	bl is_tile_x87
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688C4
	ldr r0, _080688C0 @ =gUnknown_081C346A
	b _08068A2E
	.align 2, 0
_080688C0: .4byte gUnknown_081C346A
_080688C4:
	adds r0, r5, 0
	bl is_tile_x8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688DC
	ldr r0, _080688D8 @ =gUnknown_081616E1
	b _08068A2E
	.align 2, 0
_080688D8: .4byte gUnknown_081616E1
_080688DC:
	adds r0, r5, 0
	bl is_tile_x85
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688F4
	ldr r0, _080688F0 @ =Event_WorldMap
	b _08068A2E
	.align 2, 0
_080688F0: .4byte Event_WorldMap
_080688F4:
	adds r0, r5, 0
	bl sub_805791C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806890C
	ldr r0, _08068908 @ =Event_RunningShoesManual
	b _08068A2E
	.align 2, 0
_08068908: .4byte Event_RunningShoesManual
_0806890C:
	adds r0, r5, 0
	bl sub_8057930
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068924
	ldr r0, _08068920 @ =PictureBookShelfScript
	b _08068A2E
	.align 2, 0
_08068920: .4byte PictureBookShelfScript
_08068924:
	adds r0, r5, 0
	bl sub_8057944
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806893C
	ldr r0, _08068938 @ =BookshelfScript
	b _08068A2E
	.align 2, 0
_08068938: .4byte BookshelfScript
_0806893C:
	adds r0, r5, 0
	bl sub_8057958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068954
	ldr r0, _08068950 @ =PokemonCenterBookshelfScript
	b _08068A2E
	.align 2, 0
_08068950: .4byte PokemonCenterBookshelfScript
_08068954:
	adds r0, r5, 0
	bl sub_805796C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806896C
	ldr r0, _08068968 @ =VaseScript
	b _08068A2E
	.align 2, 0
_08068968: .4byte VaseScript
_0806896C:
	adds r0, r5, 0
	bl sub_8057980
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068984
	ldr r0, _08068980 @ =TrashCanScript
	b _08068A2E
	.align 2, 0
_08068980: .4byte TrashCanScript
_08068984:
	adds r0, r5, 0
	bl sub_8057994
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806899C
	ldr r0, _08068998 @ =ShopShelfScript
	b _08068A2E
	.align 2, 0
_08068998: .4byte ShopShelfScript
_0806899C:
	adds r0, r5, 0
	bl sub_80579A8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080689B4
	ldr r0, _080689B0 @ =BlueprintScript
	b _08068A2E
	.align 2, 0
_080689B0: .4byte BlueprintScript
_080689B4:
	movs r4, 0x4
	ldrsb r4, [r6, r4]
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08068A2C
	adds r0, r5, 0
	bl sub_8057238
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080689E4
	ldr r0, _080689E0 @ =gUnknown_0815F36C
	b _08068A2E
	.align 2, 0
_080689E0: .4byte gUnknown_0815F36C
_080689E4:
	adds r0, r5, 0
	bl sub_805724C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080689FC
	ldr r0, _080689F8 @ =gUnknown_0815F43A
	b _08068A2E
	.align 2, 0
_080689F8: .4byte gUnknown_0815F43A
_080689FC:
	adds r0, r5, 0
	bl sub_8057364
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A14
	ldr r0, _08068A10 @ =gUnknown_0815F523
	b _08068A2E
	.align 2, 0
_08068A10: .4byte gUnknown_0815F523
_08068A14:
	adds r0, r5, 0
	bl sub_8057378
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A2C
	ldr r0, _08068A28 @ =gUnknown_0815F528
	b _08068A2E
	.align 2, 0
_08068A28: .4byte gUnknown_0815F528
_08068A2C:
	movs r0, 0
_08068A2E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068500

	thumb_func_start TryGetFieldMoveScript
TryGetFieldMoveScript: @ 8068A34
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08068A64 @ =0x0000080b
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A6C
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A6C
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A6C
	ldr r0, _08068A68 @ =UseSurfScript
	b _08068AAA
	.align 2, 0
_08068A64: .4byte 0x0000080b
_08068A68: .4byte UseSurfScript
_08068A6C:
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AA8
	ldr r0, _08068A98 @ =0x0000080e
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AA0
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AA0
	ldr r0, _08068A9C @ =UseWaterfallScript
	b _08068AAA
	.align 2, 0
_08068A98: .4byte 0x0000080e
_08068A9C: .4byte UseWaterfallScript
_08068AA0:
	ldr r0, _08068AA4 @ =CannotUseWaterfallScript
	b _08068AAA
	.align 2, 0
_08068AA4: .4byte CannotUseWaterfallScript
_08068AA8:
	movs r0, 0
_08068AAA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldMoveScript

	thumb_func_start sub_8068770
sub_8068770: @ 8068AB0
	push {lr}
	ldr r0, _08068AD4 @ =0x0000080d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08068ADC
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08068ADC
	ldr r0, _08068AD8 @ =UseDiveScript
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08068ADE
	.align 2, 0
_08068AD4: .4byte 0x0000080d
_08068AD8: .4byte UseDiveScript
_08068ADC:
	movs r0, 0
_08068ADE:
	pop {r1}
	bx r1
	thumb_func_end sub_8068770

	thumb_func_start sub_80687A4
sub_80687A4: @ 8068AE4
	push {lr}
	ldr r0, _08068B10 @ =0x0000080d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08068B1C
	ldr r0, _08068B14 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068B1C
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B1C
	ldr r0, _08068B18 @ =UnderwaterUseDiveScript
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08068B1E
	.align 2, 0
_08068B10: .4byte 0x0000080d
_08068B14: .4byte gMapHeader
_08068B18: .4byte UnderwaterUseDiveScript
_08068B1C:
	movs r0, 0
_08068B1E:
	pop {r1}
	bx r1
	thumb_func_end sub_80687A4

	thumb_func_start sub_80687E4
sub_80687E4: @ 8068B24
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl mapheader_trigger_activate_at__run_now
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068B74
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8068A64
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068B74
	adds r0, r6, 0
	bl sub_8068870
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068B74
	bl sub_8068894
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068B74
	bl UpdateRepelCounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068B74
	movs r0, 0
	b _08068B76
_08068B74:
	movs r0, 0x1
_08068B76:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80687E4

	thumb_func_start mapheader_trigger_activate_at__run_now
mapheader_trigger_activate_at__run_now: @ 8068B7C
	push {r4,lr}
	ldr r4, _08068BA4 @ =gMapHeader
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	cmp r0, 0
	beq _08068BA8
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08068BAA
	.align 2, 0
_08068BA4: .4byte gMapHeader
_08068BA8:
	movs r0, 0
_08068BAA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at__run_now

	thumb_func_start sub_8068870
sub_8068870: @ 8068BB0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	bne _08068BC4
	movs r0, 0
	b _08068BCC
_08068BC4:
	ldr r0, _08068BD0 @ =GraniteCave_B1F_EventScript_1C6BC5
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_08068BCC:
	pop {r1}
	bx r1
	.align 2, 0
_08068BD0: .4byte GraniteCave_B1F_EventScript_1C6BC5
	thumb_func_end sub_8068870

	thumb_func_start sub_8068894
sub_8068894: @ 8068BD4
	push {lr}
	bl sub_8082B78
	bl happiness_algorithm_step
	bl overworld_poison_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068BF4
	ldr r0, _08068BF0 @ =gUnknown_081A14B8
	b _08068C28
	.align 2, 0
_08068BF0: .4byte gUnknown_081A14B8
_08068BF4:
	bl sub_80422A0
	lsls r0, 24
	cmp r0, 0
	beq _08068C0C
	movs r0, 0xD
	bl sav12_xor_increment
	ldr r0, _08068C08 @ =Event_EggHatch
	b _08068C28
	.align 2, 0
_08068C08: .4byte Event_EggHatch
_08068C0C:
	bl SafariZoneTakeStep
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068C2C
	movs r0, 0x1
	bl sub_810D9B0
	cmp r0, 0x1
	beq _08068C26
	movs r0, 0
	b _08068C2E
_08068C26:
	ldr r0, _08068C34 @ =gUnknown_0815FD0D
_08068C28:
	bl ScriptContext1_SetupScript
_08068C2C:
	movs r0, 0x1
_08068C2E:
	pop {r1}
	bx r1
	.align 2, 0
_08068C34: .4byte gUnknown_0815FD0D
	thumb_func_end sub_8068894

	thumb_func_start unref_sub_80688F8
unref_sub_80688F8: @ 8068C38
	push {lr}
	ldr r0, _08068C48 @ =0x0000402a
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068C48: .4byte 0x0000402a
	thumb_func_end unref_sub_80688F8

	thumb_func_start happiness_algorithm_step
happiness_algorithm_step: @ 8068C4C
	push {r4,r5,lr}
	ldr r0, _08068C80 @ =0x0000402a
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _08068C7A
	ldr r5, _08068C84 @ =gPlayerParty
	movs r4, 0x5
_08068C6A:
	adds r0, r5, 0
	movs r1, 0x5
	bl AdjustFriendship
	adds r5, 0x64
	subs r4, 0x1
	cmp r4, 0
	bge _08068C6A
_08068C7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068C80: .4byte 0x0000402a
_08068C84: .4byte gPlayerParty
	thumb_func_end happiness_algorithm_step

	thumb_func_start overworld_poison_timer_set
overworld_poison_timer_set: @ 8068C88
	push {lr}
	ldr r0, _08068C98 @ =0x0000402b
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068C98: .4byte 0x0000402b
	thumb_func_end overworld_poison_timer_set

	thumb_func_start overworld_poison_step
overworld_poison_step: @ 8068C9C
	push {lr}
	ldr r0, _08068CD4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	beq _08068CDC
	ldr r0, _08068CD8 @ =0x0000402b
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x3
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _08068CDC
	bl overworld_poison
	cmp r0, 0x1
	beq _08068CDC
	cmp r0, 0x1
	ble _08068CDC
	cmp r0, 0x2
	bne _08068CDC
	movs r0, 0x1
	b _08068CDE
	.align 2, 0
_08068CD4: .4byte gMapHeader
_08068CD8: .4byte 0x0000402b
_08068CDC:
	movs r0, 0
_08068CDE:
	pop {r1}
	bx r1
	thumb_func_end overworld_poison_step

	thumb_func_start prev_quest_postbuffer_cursor_backup_reset
prev_quest_postbuffer_cursor_backup_reset: @ 8068CE4
	ldr r1, _08068CEC @ =gUnknown_0202E8C0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08068CEC: .4byte gUnknown_0202E8C0
	thumb_func_end prev_quest_postbuffer_cursor_backup_reset

	thumb_func_start is_it_battle_time_3
is_it_battle_time_3: @ 8068CF0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r4, 0
	ldr r6, _08068D0C @ =gUnknown_0202E8C0
	ldrb r0, [r6]
	cmp r0, 0x3
	bhi _08068D14
	adds r0, 0x1
	strb r0, [r6]
	ldr r0, _08068D10 @ =gUnknown_0202E8C2
	strh r4, [r0]
	movs r0, 0
	b _08068D38
	.align 2, 0
_08068D0C: .4byte gUnknown_0202E8C0
_08068D10: .4byte gUnknown_0202E8C2
_08068D14:
	ldr r5, _08068D2C @ =gUnknown_0202E8C2
	ldrh r1, [r5]
	adds r0, r4, 0
	bl StandardWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068D30
	strh r4, [r5]
	movs r0, 0
	b _08068D38
	.align 2, 0
_08068D2C: .4byte gUnknown_0202E8C2
_08068D30:
	movs r0, 0
	strb r0, [r6]
	strh r7, [r5]
	movs r0, 0x1
_08068D38:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end is_it_battle_time_3

	thumb_func_start mapheader_run_first_tag2_script_list_match_conditionally
mapheader_run_first_tag2_script_list_match_conditionally: @ 8068D40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08068D94 @ =gMapHeader
	mov r8, r0
	adds r1, r7, 0
	bl map_warp_check_packed
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl is_non_stair_warp_tile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D98
	lsls r0, r6, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068D98
	bl walkrun_find_lowest_active_bit_in_bitfield
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	bl sub_8068C30
	bl sub_8080E88
	movs r0, 0x1
	b _08068D9A
	.align 2, 0
_08068D94: .4byte gMapHeader
_08068D98:
	movs r0, 0
_08068D9A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match_conditionally

	thumb_func_start sub_8068A64
sub_8068A64: @ 8068DA4
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _08068DFC @ =gMapHeader
	adds r0, r7, 0
	adds r1, r6, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068E68
	adds r0, r5, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068E68
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8068C30
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068E00
	adds r0, r4, 0
	bl sub_8080F2C
	movs r0, 0x1
	b _08068E6A
	.align 2, 0
_08068DFC: .4byte gMapHeader
_08068E00:
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068E16
	bl sub_8080F48
	movs r0, 0x1
	b _08068E6A
_08068E16:
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068E2C
	bl sub_8080F58
	movs r0, 0x1
	b _08068E6A
_08068E2C:
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068E42
	bl sub_8080F68
	movs r0, 0x1
	b _08068E6A
_08068E42:
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068E60
	ldr r0, _08068E5C @ =gUnknown_081C6BDE
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08068E6A
	.align 2, 0
_08068E5C: .4byte gUnknown_081C6BDE
_08068E60:
	bl sub_8080E88
	movs r0, 0x1
	b _08068E6A
_08068E68:
	movs r0, 0
_08068E6A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8068A64

	thumb_func_start sub_8068B30
sub_8068B30: @ 8068E70
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068EEA
	movs r0, 0
	b _08068EEC
_08068EEA:
	movs r0, 0x1
_08068EEC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068B30

	thumb_func_start is_non_stair_warp_tile
is_non_stair_warp_tile: @ 8068EF4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x2
	beq _08068F18
	cmp r1, 0x2
	bgt _08068F0E
	cmp r1, 0x1
	beq _08068F22
	b _08068F44
_08068F0E:
	cmp r2, 0x3
	beq _08068F2C
	cmp r2, 0x4
	beq _08068F36
	b _08068F44
_08068F18:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsNorthArrowWarp
	b _08068F3E
_08068F22:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSouthArrowWarp
	b _08068F3E
_08068F2C:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWestArrowWarp
	b _08068F3E
_08068F36:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsEastArrowWarp
_08068F3E:
	lsls r0, 24
	lsrs r0, 24
	b _08068F46
_08068F44:
	movs r0, 0
_08068F46:
	pop {r1}
	bx r1
	thumb_func_end is_non_stair_warp_tile

	thumb_func_start map_warp_check_packed
map_warp_check_packed: @ 8068F4C
	push {lr}
	adds r3, r1, 0
	ldrh r1, [r3]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r3, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r3, 0x4]
	bl map_warp_check
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end map_warp_check_packed

	thumb_func_start sub_8068C30
sub_8068C30: @ 8068F70
	push {r4-r7,lr}
	adds r5, r2, 0
	ldr r0, _08068F90 @ =gMapHeader
	ldr r0, [r0, 0x4]
	lsls r1, 24
	asrs r7, r1, 24
	lsls r6, r7, 3
	ldr r0, [r0, 0x8]
	adds r4, r0, r6
	ldrb r0, [r4, 0x6]
	cmp r0, 0x7F
	bne _08068F94
	ldrb r0, [r4, 0x5]
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	b _08068FDE
	.align 2, 0
_08068F90: .4byte gMapHeader
_08068F94:
	movs r0, 0x7
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	ldrsb r1, [r4, r1]
	movs r2, 0x5
	ldrsb r2, [r4, r2]
	bl warp1_set_2
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_80535C4
	ldrb r0, [r4, 0x7]
	ldrb r1, [r4, 0x6]
	bl get_mapheader_by_bank_and_number
	ldr r1, [r0, 0x4]
	ldrb r0, [r4, 0x5]
	ldr r1, [r1, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x7F
	bne _08068FDE
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	ldr r2, _08068FE4 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, 0x5]
	lsls r2, 24
	asrs r2, 24
	adds r3, r7, 0
	bl saved_warp2_set
_08068FDE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068FE4: .4byte gSaveBlock1
	thumb_func_end sub_8068C30

	thumb_func_start map_warp_consider_2_to_inside
map_warp_consider_2_to_inside: @ 8068FE8
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r0, r1, 16
	adds r7, r0, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x2
	bne _0806906C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069020
	ldr r0, _0806901C @ =gMapHeader
	ldr r1, [r0, 0x4]
	adds r0, r5, 0
	bl sub_80BC038
	movs r0, 0x1
	b _0806906E
	.align 2, 0
_0806901C: .4byte gMapHeader
_08069020:
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806906C
	ldr r6, _08069068 @ =gMapHeader
	adds r0, r6, 0
	adds r1, r5, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0806906C
	adds r0, r7, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806906C
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8068C30
	bl sub_8080EF0
	movs r0, 0x1
	b _0806906E
	.align 2, 0
_08069068: .4byte gMapHeader
_0806906C:
	movs r0, 0
_0806906E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end map_warp_consider_2_to_inside

	thumb_func_start map_warp_check
map_warp_check: @ 8069074
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x8]
	ldrb r3, [r0, 0x1]
	movs r2, 0
	cmp r2, r3
	bge _080690B2
_0806908E:
	ldrh r0, [r1]
	cmp r0, r6
	bne _080690AA
	ldrh r0, [r1, 0x2]
	cmp r0, r5
	bne _080690AA
	ldrb r0, [r1, 0x4]
	cmp r0, r4
	beq _080690A4
	cmp r0, 0
	bne _080690AA
_080690A4:
	lsls r0, r2, 24
	asrs r0, 24
	b _080690B6
_080690AA:
	adds r2, 0x1
	adds r1, 0x8
	cmp r2, r3
	blt _0806908E
_080690B2:
	movs r0, 0x1
	negs r0, r0
_080690B6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end map_warp_check

	thumb_func_start trigger_activate
trigger_activate: @ 80690BC
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _080690F2
	ldr r1, [r4, 0xC]
	cmp r1, 0
	bne _080690D2
	ldrb r0, [r4, 0x6]
	bl sub_8069408
	b _080690F2
_080690D2:
	ldrh r0, [r4, 0x6]
	cmp r0, 0
	beq _080690EC
	ldrh r0, [r4, 0x6]
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _080690F2
	ldr r0, [r4, 0xC]
	b _080690F4
_080690EC:
	adds r0, r1, 0
	bl ScriptContext2_RunNewScript
_080690F2:
	movs r0, 0
_080690F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end trigger_activate

	thumb_func_start mapheader_trigger_activate_at
mapheader_trigger_activate_at: @ 80690FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0xC]
	ldrb r7, [r0, 0x2]
	movs r6, 0
	cmp r6, r7
	bge _08069152
	adds r5, r1, 0
	adds r4, r5, 0
_08069128:
	ldrh r0, [r4]
	cmp r0, r10
	bne _08069148
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bne _08069148
	ldrb r0, [r4, 0x4]
	cmp r0, r8
	beq _0806913E
	cmp r0, 0
	bne _08069148
_0806913E:
	adds r0, r5, 0
	bl trigger_activate
	cmp r0, 0
	bne _08069154
_08069148:
	adds r4, 0x10
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r7
	blt _08069128
_08069152:
	movs r0, 0
_08069154:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at

	thumb_func_start sub_8068E24
sub_8068E24: @ 8069164
	push {r4,lr}
	ldr r4, _08069188 @ =gMapHeader
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08069188: .4byte gMapHeader
	thumb_func_end sub_8068E24

	thumb_func_start FindInvisibleMapObjectByPosition
FindInvisibleMapObjectByPosition: @ 806918C
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, [r0, 0x4]
	ldr r4, [r0, 0x10]
	ldrb r3, [r0, 0x3]
	movs r2, 0
	cmp r2, r3
	bcs _080691D2
_080691A6:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _080691C8
	ldrh r0, [r1, 0x2]
	cmp r0, r6
	bne _080691C8
	ldrb r0, [r1, 0x4]
	cmp r0, r5
	beq _080691C4
	cmp r0, 0
	bne _080691C8
_080691C4:
	adds r0, r1, 0
	b _080691D4
_080691C8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080691A6
_080691D2:
	movs r0, 0
_080691D4:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FindInvisibleMapObjectByPosition

	thumb_func_start dive_warp
dive_warp: @ 80691DC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08069210 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08069214
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08069214
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	b _08069238
	.align 2, 0
_08069210: .4byte gMapHeader
_08069214:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069250
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
_08069238:
	lsls r0, 24
	cmp r0, 0
	beq _08069250
	bl walkrun_find_lowest_active_bit_in_bitfield
	bl sp13E_warp_to_last_warp
	movs r0, 0xE9
	bl PlaySE
	movs r0, 0x1
	b _08069252
_08069250:
	movs r0, 0
_08069252:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start sub_8068F18
sub_8068F18: @ 8069258
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080692B0 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _080692B4
	adds r0, r5, 0
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _080692B4
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080692E4
	movs r0, 0x1
	b _080692E6
	.align 2, 0
_080692B0: .4byte gMapHeader
_080692B4:
	adds r0, r5, 0
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080692E4
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080692E4
	movs r0, 0x2
	b _080692E6
_080692E4:
	movs r0, 0
_080692E6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8068F18

	thumb_func_start GetFieldObjectScriptPointerForComparison
GetFieldObjectScriptPointerForComparison: @ 80692F0
	push {r4,r5,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	adds r2, r4, 0
	bl sub_8068364
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerForComparison

	thumb_func_start sub_8068FEC
sub_8068FEC: @ 806932C
	push {r4,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	ldr r4, _0806936C @ =gMapHeader
	adds r0, r4, 0
	mov r1, sp
	bl map_warp_check_packed
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	mov r2, sp
	bl sub_8068C30
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806936C: .4byte gMapHeader
	thumb_func_end sub_8068FEC

	thumb_func_start sub_8069030
sub_8069030: @ 8069370
	push {r4,lr}
	ldr r4, _080693A4 @ =0x02026954
	movs r2, 0x90
	lsls r2, 1
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x90
	lsls r0, 1
	adds r4, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, 0
	movs r1, 0
	bl memset
	ldr r0, _080693A8 @ =gUnknown_0202E8E2
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080693A4: .4byte 0x02026954
_080693A8: .4byte gUnknown_0202E8E2
	thumb_func_end sub_8069030

	thumb_func_start sub_806906C
sub_806906C: @ 80693AC
	push {lr}
	ldr r0, _080693E0 @ =0x02026954
	movs r1, 0
	str r1, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _080693E4 @ =0x0000084d
	bl FlagReset
	ldr r0, _080693E8 @ =0x0000084e
	bl FlagReset
	ldr r0, _080693EC @ =0x00000829
	bl FlagReset
	ldr r0, _080693F0 @ =0x00000861
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080693E0: .4byte 0x02026954
_080693E4: .4byte 0x0000084d
_080693E8: .4byte 0x0000084e
_080693EC: .4byte 0x00000829
_080693F0: .4byte 0x00000861
	thumb_func_end sub_806906C

	thumb_func_start sub_80690B4
sub_80690B4: @ 80693F4
	push {lr}
	ldr r0, _08069404 @ =0x02026a6c
	movs r1, 0
	movs r2, 0x8
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08069404: .4byte 0x02026a6c
	thumb_func_end sub_80690B4

	thumb_func_start sub_80690C8
sub_80690C8: @ 8069408
	push {lr}
	ldr r0, _08069424 @ =0x00004046
	bl GetVarPointer
	ldr r2, _08069428 @ =gSaveBlock2
	movs r1, 0
	strb r1, [r2, 0x1A]
	strh r1, [r0]
	ldr r0, _0806942C @ =0x00000836
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08069424: .4byte 0x00004046
_08069428: .4byte gSaveBlock2
_0806942C: .4byte 0x00000836
	thumb_func_end sub_80690C8

	thumb_func_start sub_80690F0
sub_80690F0: @ 8069430
	push {r4,r5,lr}
	ldr r0, _0806945C @ =0x00004046
	bl GetVarPointer
	ldr r4, _08069460 @ =gSaveBlock2
	movs r5, 0
	movs r1, 0xDA
	strb r1, [r4, 0x1A]
	ldr r2, _08069464 @ =0x00000302
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08069468 @ =0x00000836
	bl FlagSet
	movs r0, 0x1
	strb r0, [r4, 0x19]
	strb r5, [r4, 0x18]
	bl sub_808C0A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806945C: .4byte 0x00004046
_08069460: .4byte gSaveBlock2
_08069464: .4byte 0x00000302
_08069468: .4byte 0x00000836
	thumb_func_end sub_80690F0

	thumb_func_start IsNationalPokedex
IsNationalPokedex: @ 806946C
	push {lr}
	ldr r0, _08069494 @ =gSaveBlock2
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xDA
	bne _080694A4
	ldr r0, _08069498 @ =0x00004046
	bl VarGet
	lsls r0, 16
	ldr r1, _0806949C @ =0x03020000
	cmp r0, r1
	bne _080694A4
	ldr r0, _080694A0 @ =0x00000836
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080694A4
	movs r0, 0x1
	b _080694A6
	.align 2, 0
_08069494: .4byte gSaveBlock2
_08069498: .4byte 0x00004046
_0806949C: .4byte 0x03020000
_080694A0: .4byte 0x00000836
_080694A4:
	movs r0, 0
_080694A6:
	pop {r1}
	bx r1
	thumb_func_end IsNationalPokedex

	thumb_func_start unref_sub_806916C
unref_sub_806916C: @ 80694AC
	push {lr}
	ldr r0, _080694B8 @ =0x0000084c
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080694B8: .4byte 0x0000084c
	thumb_func_end unref_sub_806916C

	thumb_func_start unref_sub_806917C
unref_sub_806917C: @ 80694BC
	push {lr}
	ldr r0, _080694C8 @ =0x0000084c
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080694C8: .4byte 0x0000084c
	thumb_func_end unref_sub_806917C

	thumb_func_start IsMysteryGiftAvailable
IsMysteryGiftAvailable: @ 80694CC
	push {lr}
	ldr r0, _080694DC @ =0x0000084c
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080694DC: .4byte 0x0000084c
	thumb_func_end IsMysteryGiftAvailable

	thumb_func_start sub_80691A0
sub_80691A0: @ 80694E0
	push {lr}
	ldr r0, _080694F4 @ =0x0000402c
	movs r1, 0
	bl VarSet
	ldr r0, _080694F8 @ =0x00000862
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080694F4: .4byte 0x0000402c
_080694F8: .4byte 0x00000862
	thumb_func_end sub_80691A0

	thumb_func_start sub_80691BC
sub_80691BC: @ 80694FC
	push {lr}
	ldr r0, _08069514 @ =0x0000402c
	movs r1, 0x92
	lsls r1, 4
	bl VarSet
	ldr r0, _08069518 @ =0x00000862
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08069514: .4byte 0x0000402c
_08069518: .4byte 0x00000862
	thumb_func_end sub_80691BC

	thumb_func_start sub_80691DC
sub_80691DC: @ 806951C
	push {lr}
	ldr r0, _08069540 @ =0x00000862
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069548
	ldr r0, _08069544 @ =0x0000402c
	bl VarGet
	lsls r0, 16
	movs r1, 0x92
	lsls r1, 20
	cmp r0, r1
	bne _08069548
	movs r0, 0x1
	b _0806954A
	.align 2, 0
_08069540: .4byte 0x00000862
_08069544: .4byte 0x0000402c
_08069548:
	movs r0, 0
_0806954A:
	pop {r1}
	bx r1
	thumb_func_end sub_80691DC

	.align 2, 0 @ Don't pad with nop.
