	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start task01_battle_start
task01_battle_start: @ 8081D94
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081DB4 @ =0x03004b38
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08081DB8
	cmp r0, 0x1
	beq _08081DCE
	b _08081DEE
	.align 2, 0
_08081DB4: .4byte 0x03004b38
_08081DB8:
	bl FieldPoisonEffectIsRunning
	cmp r0, 0
	bne _08081DEE
	ldrb r0, [r4, 0x2]
	bl sub_811AABC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08081DEE
_08081DCE:
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081DEE
	ldr r0, _08081DF4 @ =sub_800E7C4
	bl SetMainCallback2
	bl prev_quest_postbuffer_cursor_backup_reset
	bl overworld_poison_timer_set
	adds r0, r5, 0
	bl DestroyTask
_08081DEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081DF4: .4byte sub_800E7C4
	thumb_func_end task01_battle_start

	thumb_func_start task_add_01_battle_start
task_add_01_battle_start: @ 8081DF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08081E2C @ =task01_battle_start
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081E30 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	adds r0, r5, 0
	bl current_map_music_set__default_for_battle
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081E2C: .4byte task01_battle_start
_08081E30: .4byte gTasks
	thumb_func_end task_add_01_battle_start

	thumb_func_start CheckForSafariZoneAndProceed
CheckForSafariZoneAndProceed: @ 8081E34
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _08081E44
	bl sub_8081AA4
	b _08081E48
_08081E44:
	bl sub_8081A18
_08081E48:
	pop {r0}
	bx r0
	thumb_func_end CheckForSafariZoneAndProceed

	thumb_func_start sub_8081A18
sub_8081A18: @ 8081E4C
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081E84 @ =gMain
	ldr r0, _08081E88 @ =sub_8081C8C
	str r0, [r1, 0x8]
	ldr r1, _08081E8C @ =gUnknown_020239F8
	movs r0, 0
	strh r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081E84: .4byte gMain
_08081E88: .4byte sub_8081C8C
_08081E8C: .4byte gUnknown_020239F8
	thumb_func_end sub_8081A18

	thumb_func_start sub_8081A5C
sub_8081A5C: @ 8081E90
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081ECC @ =gMain
	ldr r0, _08081ED0 @ =sub_8081C8C
	str r0, [r1, 0x8]
	ldr r1, _08081ED4 @ =gUnknown_020239F8
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081ECC: .4byte gMain
_08081ED0: .4byte sub_8081C8C
_08081ED4: .4byte gUnknown_020239F8
	thumb_func_end sub_8081A5C

	thumb_func_start sub_8081AA4
sub_8081AA4: @ 8081ED8
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081F04 @ =gMain
	ldr r0, _08081F08 @ =sub_80C824C
	str r0, [r1, 0x8]
	ldr r1, _08081F0C @ =gUnknown_020239F8
	movs r0, 0x80
	strh r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	pop {r0}
	bx r0
	.align 2, 0
_08081F04: .4byte gMain
_08081F08: .4byte sub_80C824C
_08081F0C: .4byte gUnknown_020239F8
	thumb_func_end sub_8081AA4

	thumb_func_start task_add_01_battle_start_with_music_and_stats
task_add_01_battle_start_with_music_and_stats: @ 8081F10
	push {lr}
	bl GetTrainerBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x9
	bl sav12_xor_increment
	pop {r0}
	bx r0
	thumb_func_end task_add_01_battle_start_with_music_and_stats

	thumb_func_start sub_8081AFC
sub_8081AFC: @ 8081F30
	push {lr}
	ldr r0, _08081F60 @ =gEnemyParty
	movs r1, 0xC4
	lsls r1, 1
	movs r2, 0x5
	bl CreateMaleMon
	bl ScriptContext2_Enable
	ldr r1, _08081F64 @ =gMain
	ldr r0, _08081F68 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	str r0, [r1, 0x8]
	ldr r1, _08081F6C @ =gUnknown_020239F8
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x8
	movs r1, 0
	bl task_add_01_battle_start
	pop {r0}
	bx r0
	.align 2, 0
_08081F60: .4byte gEnemyParty
_08081F64: .4byte gMain
_08081F68: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08081F6C: .4byte gUnknown_020239F8
	thumb_func_end sub_8081AFC

	thumb_func_start sub_8081B3C
sub_8081B3C: @ 8081F70
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081FA0 @ =gMain
	ldr r0, _08081FA4 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081FA8 @ =gUnknown_020239F8
	movs r0, 0
	strh r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081FA0: .4byte gMain
_08081FA4: .4byte sub_8081CEC
_08081FA8: .4byte gUnknown_020239F8
	thumb_func_end sub_8081B3C

	thumb_func_start sub_8081B78
sub_8081B78: @ 8081FAC
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081FE0 @ =gMain
	ldr r0, _08081FE4 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08081FE8 @ =gUnknown_020239F8
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	bl GetWildBattleTransition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081FE0: .4byte gMain
_08081FE4: .4byte sub_8081CEC
_08081FE8: .4byte gUnknown_020239F8
	thumb_func_end sub_8081B78

	thumb_func_start sub_8081BB8
sub_8081BB8: @ 8081FEC
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _0808201C @ =gMain
	ldr r0, _08082020 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _08082024 @ =gUnknown_020239F8
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08082028 @ =0x000001cf
	movs r0, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_0808201C: .4byte gMain
_08082020: .4byte sub_8081CEC
_08082024: .4byte gUnknown_020239F8
_08082028: .4byte 0x000001cf
	thumb_func_end sub_8081BB8

	thumb_func_start sub_8081BF8
sub_8081BF8: @ 808202C
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08082054 @ =gMain
	ldr r0, _08082058 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _0808205C @ =gUnknown_020239F8
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08082060 @ =gGameVersion
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08082068
	ldr r1, _08082064 @ =0x000001cf
	movs r0, 0xB
	bl task_add_01_battle_start
	b _08082070
	.align 2, 0
_08082054: .4byte gMain
_08082058: .4byte sub_8081CEC
_0808205C: .4byte gUnknown_020239F8
_08082060: .4byte gGameVersion
_08082064: .4byte 0x000001cf
_08082068:
	ldr r1, _08082080 @ =0x000001cf
	movs r0, 0x6
	bl task_add_01_battle_start
_08082070:
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08082080: .4byte 0x000001cf
	thumb_func_end sub_8081BF8

	thumb_func_start sub_8081C50
sub_8081C50: @ 8082084
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _080820B4 @ =gMain
	ldr r0, _080820B8 @ =sub_8081CEC
	str r0, [r1, 0x8]
	ldr r1, _080820BC @ =gUnknown_020239F8
	movs r2, 0xC0
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0xE7
	lsls r1, 1
	movs r0, 0xA
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_080820B4: .4byte gMain
_080820B8: .4byte sub_8081CEC
_080820BC: .4byte gUnknown_020239F8
	thumb_func_end sub_8081C50

	thumb_func_start sub_8081C8C
sub_8081C8C: @ 80820C0
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _080820F4 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _080820F8 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082100
	ldr r0, _080820FC @ =c2_whiteout
	bl SetMainCallback2
	b _0808210C
	.align 2, 0
_080820F4: .4byte 0x01000100
_080820F8: .4byte gUnknown_02024D26
_080820FC: .4byte c2_whiteout
_08082100:
	ldr r0, _08082114 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _08082118 @ =gUnknown_0300485C
	ldr r0, _0808211C @ =sub_8080E44
	str r0, [r1]
_0808210C:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08082114: .4byte c2_exit_to_overworld_2_switch
_08082118: .4byte gUnknown_0300485C
_0808211C: .4byte sub_8080E44
	thumb_func_end sub_8081C8C

	thumb_func_start sub_8081CEC
sub_8081CEC: @ 8082120
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08082154 @ =0x01000100
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08082158 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082160
	ldr r0, _0808215C @ =c2_whiteout
	bl SetMainCallback2
	b _08082166
	.align 2, 0
_08082154: .4byte 0x01000100
_08082158: .4byte gUnknown_02024D26
_0808215C: .4byte c2_whiteout
_08082160:
	ldr r0, _0808216C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_08082166:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808216C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8081CEC

	thumb_func_start sub_8081D3C
sub_8081D3C: @ 8082170
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
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _080821A6
	movs r0, 0
	b _080822BA
_080821A6:
	adds r0, r4, 0
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _080821B6
	movs r0, 0x1
	b _080822BA
_080821B6:
	adds r0, r4, 0
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, 24
	cmp r0, 0
	bne _080822B8
	ldr r0, _080821D8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	subs r0, 0x1
	cmp r0, 0x8
	bhi _0808223C
	lsls r0, 2
	ldr r1, _080821DC @ =_080821E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080821D8: .4byte gMapHeader
_080821DC: .4byte _080821E0
	.align 2, 0
_080821E0:
	.4byte _0808223C
	.4byte _0808223C
	.4byte _0808223C
	.4byte _08082204
	.4byte _08082228
	.4byte _0808222C
	.4byte _0808223C
	.4byte _08082214
	.4byte _08082214
_08082204:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80574C4
	lsls r0, 24
	cmp r0, 0
	beq _08082218
_08082214:
	movs r0, 0x8
	b _080822BA
_08082218:
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08082280
	movs r0, 0x7
	b _080822BA
_08082228:
	movs r0, 0x3
	b _080822BA
_0808222C:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08082292
	b _080822AE
_0808223C:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057568
	lsls r0, 24
	cmp r0, 0
	bne _08082292
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08082280
	adds r0, r4, 0
	bl sub_80574D8
	lsls r0, 24
	cmp r0, 0
	beq _08082268
	movs r0, 0x6
	b _080822BA
_08082268:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08082296
	adds r0, r4, 0
	bl sub_8057450
	lsls r0, 24
	cmp r0, 0
	beq _08082284
_08082280:
	movs r0, 0x5
	b _080822BA
_08082284:
	adds r0, r4, 0
	bl MetatileBehavior_IsBridge
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082296
_08082292:
	movs r0, 0x4
	b _080822BA
_08082296:
	ldr r0, _080822B4 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0xE0
	lsls r0, 5
	cmp r1, r0
	beq _080822B8
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	beq _080822B8
_080822AE:
	movs r0, 0x9
	b _080822BA
	.align 2, 0
_080822B4: .4byte gSaveBlock1
_080822B8:
	movs r0, 0x2
_080822BA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8081D3C

	thumb_func_start sub_8081E90
sub_8081E90: @ 80822C4
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
	lsrs r4, r0, 16
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	cmp r0, 0
	beq _080822F4
	movs r0, 0x2
	b _0808231E
_080822F4:
	lsls r0, r4, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _0808231C
	ldr r0, _08082314 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _08082318
	cmp r0, 0x5
	beq _0808231C
	movs r0, 0
	b _0808231E
	.align 2, 0
_08082314: .4byte gMapHeader
_08082318:
	movs r0, 0x1
	b _0808231E
_0808231C:
	movs r0, 0x3
_0808231E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8081E90

	thumb_func_start GetSumOfPartyMonLevel
GetSumOfPartyMonLevel: @ 8082328
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	movs r6, 0
_08082332:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08082384 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08082376
	cmp r1, 0
	beq _08082376
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08082376
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _0808237C
_08082376:
	adds r6, 0x1
	cmp r6, 0x5
	ble _08082332
_0808237C:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08082384: .4byte gPlayerParty
	thumb_func_end GetSumOfPartyMonLevel

	thumb_func_start GetSumOfEnemyPartyLevel
GetSumOfEnemyPartyLevel: @ 8082388
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r5, _080823BC @ =gTrainers
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r5
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r4
	bcs _080823A8
	adds r4, r0, 0
_080823A8:
	movs r3, 0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _080823F0
	cmp r0, 0x1
	bgt _080823C0
	cmp r0, 0
	beq _080823CA
	b _08082460
	.align 2, 0
_080823BC: .4byte gTrainers
_080823C0:
	cmp r0, 0x2
	beq _08082416
	cmp r0, 0x3
	beq _0808243C
	b _08082460
_080823CA:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _08082460
_080823D8:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _080823D8
	b _08082460
_080823F0:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _08082460
_080823FE:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _080823FE
	b _08082460
_08082416:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _08082460
_08082424:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08082424
	b _08082460
_0808243C:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _08082460
_0808244A:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _0808244A
_08082460:
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetSumOfEnemyPartyLevel

	thumb_func_start GetWildBattleTransition
GetWildBattleTransition: @ 8082468
	push {r4,r5,lr}
	bl sub_8081E90
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08082498 @ =gEnemyParty
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetSumOfPartyMonLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _080824A0
	ldr r0, _0808249C @ =gBattleTransitionTable_Wild
	lsls r1, r5, 1
	adds r0, 0x1
	b _080824A4
	.align 2, 0
_08082498: .4byte gEnemyParty
_0808249C: .4byte gBattleTransitionTable_Wild
_080824A0:
	ldr r0, _080824B0 @ =gBattleTransitionTable_Wild
	lsls r1, r5, 1
_080824A4:
	adds r1, r0
	ldrb r0, [r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080824B0: .4byte gBattleTransitionTable_Wild
	thumb_func_end GetWildBattleTransition

	thumb_func_start GetTrainerBattleTransition
GetTrainerBattleTransition: @ 80824B4
	push {r4-r6,lr}
	ldr r4, _080824E0 @ =gTrainerBattleOpponent
	ldrh r1, [r4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _08082518
	ldr r1, _080824E4 @ =gTrainers
	ldrh r2, [r4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x1]
	cmp r1, 0x18
	bne _08082514
	adds r1, r2, 0
	ldr r0, _080824E8 @ =0x00000105
	cmp r1, r0
	bne _080824EC
	movs r0, 0xC
	b _08082560
	.align 2, 0
_080824E0: .4byte gTrainerBattleOpponent
_080824E4: .4byte gTrainers
_080824E8: .4byte 0x00000105
_080824EC:
	movs r0, 0x83
	lsls r0, 1
	cmp r1, r0
	bne _080824F8
	movs r0, 0xD
	b _08082560
_080824F8:
	ldr r0, _08082504 @ =0x00000107
	cmp r1, r0
	bne _08082508
	movs r0, 0xE
	b _08082560
	.align 2, 0
_08082504: .4byte 0x00000107
_08082508:
	movs r0, 0x84
	lsls r0, 1
	cmp r1, r0
	bne _08082518
	movs r0, 0xF
	b _08082560
_08082514:
	cmp r1, 0x20
	bne _0808251C
_08082518:
	movs r0, 0x10
	b _08082560
_0808251C:
	ldrb r0, [r0, 0x18]
	movs r5, 0x1
	cmp r0, 0x1
	bne _08082526
	movs r5, 0x2
_08082526:
	bl sub_8081E90
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4]
	adds r1, r5, 0
	bl GetSumOfEnemyPartyLevel
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl GetSumOfPartyMonLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08082558
	ldr r0, _08082554 @ =gBattleTransitionTable_Trainer
	lsls r1, r6, 1
	adds r0, 0x1
	b _0808255C
	.align 2, 0
_08082554: .4byte gBattleTransitionTable_Trainer
_08082558:
	ldr r0, _08082568 @ =gBattleTransitionTable_Trainer
	lsls r1, r6, 1
_0808255C:
	adds r1, r0
	ldrb r0, [r1]
_08082560:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08082568: .4byte gBattleTransitionTable_Trainer
	thumb_func_end GetTrainerBattleTransition

	thumb_func_start GetBattleTowerBattleTransition
GetBattleTowerBattleTransition: @ 808256C
	push {r4,lr}
	ldr r0, _08082590 @ =gEnemyParty
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetSumOfPartyMonLevel
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08082594
	movs r0, 0x3
	b _08082596
	.align 2, 0
_08082590: .4byte gEnemyParty
_08082594:
	movs r0, 0x4
_08082596:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetBattleTowerBattleTransition

	thumb_func_start sub_8082168
sub_8082168: @ 808259C
	push {lr}
	ldr r0, _080825B0 @ =CB2_ChooseStarter
	bl SetMainCallback2
	ldr r1, _080825B4 @ =gMain
	ldr r0, _080825B8 @ =sub_8082188
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080825B0: .4byte CB2_ChooseStarter
_080825B4: .4byte gMain
_080825B8: .4byte sub_8082188
	thumb_func_end sub_8082168

	thumb_func_start sub_8082188
sub_8082188: @ 80825BC
	push {lr}
	sub sp, 0x8
	ldr r0, _08082600 @ =0x00004023
	bl GetVarPointer
	ldr r2, _08082604 @ =gScriptResult
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r2]
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x5
	movs r2, 0
	movs r3, 0
	bl ScriptGiveMon
	bl ResetTasks
	bl sub_80408BC
	ldr r0, _08082608 @ =sub_80821D8
	bl SetMainCallback2
	movs r0, 0
	bl sub_811AAD8
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08082600: .4byte 0x00004023
_08082604: .4byte gScriptResult
_08082608: .4byte sub_80821D8
	thumb_func_end sub_8082188

	thumb_func_start sub_80821D8
sub_80821D8: @ 808260C
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082648
	ldr r1, _0808264C @ =gUnknown_020239F8
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _08082650 @ =gMain
	ldr r0, _08082654 @ =sub_8082228
	str r0, [r1, 0x8]
	ldr r0, _08082658 @ =sub_800E7C4
	bl SetMainCallback2
	bl prev_quest_postbuffer_cursor_backup_reset
	bl overworld_poison_timer_set
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
_08082648:
	pop {r0}
	bx r0
	.align 2, 0
_0808264C: .4byte gUnknown_020239F8
_08082650: .4byte gMain
_08082654: .4byte sub_8082228
_08082658: .4byte sub_800E7C4
	thumb_func_end sub_80821D8

	thumb_func_start sub_8082228
sub_8082228: @ 808265C
	push {lr}
	bl sav1_reset_battle_music_maybe
	ldr r0, _0808266C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808266C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8082228

	thumb_func_start TrainerBattleLoadArg32
TrainerBattleLoadArg32: @ 8082670
	adds r2, r0, 0
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg32

	thumb_func_start TrainerBattleLoadArg16
TrainerBattleLoadArg16: @ 8082688
	adds r1, r0, 0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg16

	thumb_func_start TrainerBattleLoadArg8
TrainerBattleLoadArg8: @ 8082694
	ldrb r0, [r0]
	bx lr
	thumb_func_end TrainerBattleLoadArg8

	thumb_func_start trainerflag_opponent
trainerflag_opponent: @ 8082698
	ldr r1, _080826AC @ =gTrainerBattleOpponent
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080826AC: .4byte gTrainerBattleOpponent
	thumb_func_end trainerflag_opponent

	thumb_func_start battle_exit_is_player_defeat
battle_exit_is_player_defeat: @ 80826B0
	push {lr}
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080826E8
	lsls r0, 2
	ldr r1, _080826C4 @ =_080826C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080826C4: .4byte _080826C8
	.align 2, 0
_080826C8:
	.4byte _080826E8
	.4byte _080826E4
	.4byte _080826E4
	.4byte _080826E8
	.4byte _080826E8
	.4byte _080826E8
	.4byte _080826E8
_080826E4:
	movs r0, 0x1
	b _080826EA
_080826E8:
	movs r0, 0
_080826EA:
	pop {r1}
	bx r1
	thumb_func_end battle_exit_is_player_defeat

	thumb_func_start sub_80822BC
sub_80822BC: @ 80826F0
	ldr r0, _0808271C @ =gTrainerBattleMode
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08082720 @ =gTrainerBattleOpponent
	strh r1, [r0]
	ldr r0, _08082724 @ =gTrainerMapObjectLocalId
	strh r1, [r0]
	ldr r0, _08082728 @ =gTrainerIntroSpeech
	movs r1, 0
	str r1, [r0]
	ldr r0, _0808272C @ =gTrainerDefeatSpeech
	str r1, [r0]
	ldr r0, _08082730 @ =gTrainerVictorySpeech
	str r1, [r0]
	ldr r0, _08082734 @ =gTrainerCannotBattleSpeech
	str r1, [r0]
	ldr r0, _08082738 @ =gTrainerBattleScriptReturnAddress
	str r1, [r0]
	ldr r0, _0808273C @ =gTrainerBattleEndScript
	str r1, [r0]
	bx lr
	.align 2, 0
_0808271C: .4byte gTrainerBattleMode
_08082720: .4byte gTrainerBattleOpponent
_08082724: .4byte gTrainerMapObjectLocalId
_08082728: .4byte gTrainerIntroSpeech
_0808272C: .4byte gTrainerDefeatSpeech
_08082730: .4byte gTrainerVictorySpeech
_08082734: .4byte gTrainerCannotBattleSpeech
_08082738: .4byte gTrainerBattleScriptReturnAddress
_0808273C: .4byte gTrainerBattleEndScript
	thumb_func_end sub_80822BC

	thumb_func_start TrainerBattleLoadArgs
TrainerBattleLoadArgs: @ 8082740
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
_08082746:
	ldrb r0, [r4, 0x4]
	cmp r0, 0x6
	bhi _080827B8
	lsls r0, 2
	ldr r1, _08082758 @ =_0808275C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082758: .4byte _0808275C
	.align 2, 0
_0808275C:
	.4byte _08082778
	.4byte _08082786
	.4byte _08082794
	.4byte _080827A2
	.4byte _080827AA
	.4byte _080827B2
	.4byte _080827BC
_08082778:
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	ldr r1, [r4]
	strb r0, [r1]
	adds r5, 0x1
	b _080827B8
_08082786:
	adds r0, r5, 0
	bl TrainerBattleLoadArg16
	ldr r1, [r4]
	strh r0, [r1]
	adds r5, 0x2
	b _080827B8
_08082794:
	adds r0, r5, 0
	bl TrainerBattleLoadArg32
	ldr r1, [r4]
	str r0, [r1]
	adds r5, 0x4
	b _080827B8
_080827A2:
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1]
	b _080827B8
_080827AA:
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1]
	b _080827B8
_080827B2:
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_080827B8:
	adds r4, 0x8
	b _08082746
_080827BC:
	ldr r0, [r4]
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TrainerBattleLoadArgs

	thumb_func_start battle_80801F0
battle_80801F0: @ 80827C8
	push {lr}
	ldr r0, _080827EC @ =gTrainerMapObjectLocalId
	ldrh r1, [r0]
	cmp r1, 0
	beq _080827E8
	ldr r0, _080827F0 @ =gScriptLastTalked
	strh r1, [r0]
	lsls r0, r1, 24
	lsrs r0, 24
	ldr r2, _080827F4 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl GetFieldObjectIdByLocalIdAndMap
	ldr r1, _080827F8 @ =gSelectedMapObject
	strb r0, [r1]
_080827E8:
	pop {r0}
	bx r0
	.align 2, 0
_080827EC: .4byte gTrainerMapObjectLocalId
_080827F0: .4byte gScriptLastTalked
_080827F4: .4byte gSaveBlock1
_080827F8: .4byte gSelectedMapObject
	thumb_func_end battle_80801F0

	thumb_func_start TrainerBattleConfigure
TrainerBattleConfigure: @ 80827FC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80822BC
	ldr r4, _08082824 @ =gTrainerBattleMode
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, 0x1
	cmp r0, 0x7
	bhi _080828D8
	lsls r0, 2
	ldr r1, _08082828 @ =_0808282C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082824: .4byte gTrainerBattleMode
_08082828: .4byte _0808282C
	.align 2, 0
_0808282C:
	.4byte _08082868
	.4byte _08082868
	.4byte _0808284C
	.4byte _08082860
	.4byte _080828B0
	.4byte _08082870
	.4byte _08082888
	.4byte _08082870
_0808284C:
	ldr r0, _08082858 @ =gTrainerBattleSpecs_3
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	ldr r0, _0808285C @ =gUnknown_0819F878
	b _080828E6
	.align 2, 0
_08082858: .4byte gTrainerBattleSpecs_3
_0808285C: .4byte gUnknown_0819F878
_08082860:
	ldr r0, _08082864 @ =gTrainerBattleSpecs_2
	b _08082872
	.align 2, 0
_08082864: .4byte gTrainerBattleSpecs_2
_08082868:
	ldr r0, _0808286C @ =gTrainerBattleSpecs_1
	b _080828DA
	.align 2, 0
_0808286C: .4byte gTrainerBattleSpecs_1
_08082870:
	ldr r0, _08082880 @ =gTrainerBattleSpecs_4
_08082872:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _08082884 @ =gUnknown_0819F840
	b _080828E6
	.align 2, 0
_08082880: .4byte gTrainerBattleSpecs_4
_08082884: .4byte gUnknown_0819F840
_08082888:
	ldr r0, _080828A4 @ =gTrainerBattleSpecs_2
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _080828A8 @ =gTrainerBattleOpponent
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _080828AC @ =gUnknown_0819F8AE
	b _080828E6
	.align 2, 0
_080828A4: .4byte gTrainerBattleSpecs_2
_080828A8: .4byte gTrainerBattleOpponent
_080828AC: .4byte gUnknown_0819F8AE
_080828B0:
	ldr r0, _080828CC @ =gTrainerBattleSpecs_0
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _080828D0 @ =gTrainerBattleOpponent
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _080828D4 @ =gUnknown_0819F887
	b _080828E6
	.align 2, 0
_080828CC: .4byte gTrainerBattleSpecs_0
_080828D0: .4byte gTrainerBattleOpponent
_080828D4: .4byte gUnknown_0819F887
_080828D8:
	ldr r0, _080828EC @ =gTrainerBattleSpecs_0
_080828DA:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _080828F0 @ =gUnknown_0819F818
_080828E6:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080828EC: .4byte gTrainerBattleSpecs_0
_080828F0: .4byte gUnknown_0819F818
	thumb_func_end TrainerBattleConfigure

	thumb_func_start TrainerWantsBattle
TrainerWantsBattle: @ 80828F4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08082928 @ =gSelectedMapObject
	strb r0, [r2]
	ldr r4, _0808292C @ =gScriptLastTalked
	ldr r3, _08082930 @ =gMapObjects
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r0, [r2, 0x8]
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	bl TrainerBattleConfigure
	ldr r0, _08082934 @ =gUnknown_0819F80B
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082928: .4byte gSelectedMapObject
_0808292C: .4byte gScriptLastTalked
_08082930: .4byte gMapObjects
_08082934: .4byte gUnknown_0819F80B
	thumb_func_end TrainerWantsBattle

	thumb_func_start GetTrainerFlagFromScriptPointer
GetTrainerFlagFromScriptPointer: @ 8082938
	push {lr}
	adds r0, 0x2
	bl TrainerBattleLoadArg16
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetTrainerFlagFromScriptPointer

	thumb_func_start sub_8082524
sub_8082524: @ 8082958
	push {r4,lr}
	ldr r0, _08082984 @ =gSelectedMapObject
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08082988 @ =gMapObjects
	adds r4, r0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082984: .4byte gSelectedMapObject
_08082988: .4byte gMapObjects
	thumb_func_end sub_8082524

	thumb_func_start sub_8082558
sub_8082558: @ 808298C
	ldr r0, _08082994 @ =gTrainerBattleMode
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08082994: .4byte gTrainerBattleMode
	thumb_func_end sub_8082558

	thumb_func_start sub_8082564
sub_8082564: @ 8082998
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8082564

	thumb_func_start sub_808257C
sub_808257C: @ 80829B0
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_808257C

	thumb_func_start unref_sub_8082590
unref_sub_8082590: @ 80829C4
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8082590

	thumb_func_start trainer_flag_check
trainer_flag_check: @ 80829D8
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end trainer_flag_check

	thumb_func_start trainer_flag_set
trainer_flag_set: @ 80829F0
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_set

	thumb_func_start trainer_flag_clear
trainer_flag_clear: @ 8082A04
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagReset
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_clear

	thumb_func_start sub_80825E4
sub_80825E4: @ 8082A18
	push {lr}
	ldr r1, _08082A34 @ =gUnknown_020239F8
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _08082A38 @ =gMain
	ldr r0, _08082A3C @ =sub_808260C
	str r0, [r1, 0x8]
	bl task_add_01_battle_start_with_music_and_stats
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_08082A34: .4byte gUnknown_020239F8
_08082A38: .4byte gMain
_08082A3C: .4byte sub_808260C
	thumb_func_end sub_80825E4

	thumb_func_start sub_808260C
sub_808260C: @ 8082A40
	push {lr}
	ldr r0, _08082A58 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08082A60
	ldr r0, _08082A5C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	b _08082A86
	.align 2, 0
_08082A58: .4byte gTrainerBattleOpponent
_08082A5C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08082A60:
	ldr r0, _08082A74 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082A7C
	ldr r0, _08082A78 @ =c2_whiteout
	bl SetMainCallback2
	b _08082A86
	.align 2, 0
_08082A74: .4byte gUnknown_02024D26
_08082A78: .4byte c2_whiteout
_08082A7C:
	ldr r0, _08082A8C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	bl sub_808257C
_08082A86:
	pop {r0}
	bx r0
	.align 2, 0
_08082A8C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_808260C

	thumb_func_start do_choose_name_or_words_screen
do_choose_name_or_words_screen: @ 8082A90
	push {lr}
	ldr r0, _08082AA8 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08082AB0
	ldr r0, _08082AAC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	b _08082ADA
	.align 2, 0
_08082AA8: .4byte gTrainerBattleOpponent
_08082AAC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08082AB0:
	ldr r0, _08082AC4 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082ACC
	ldr r0, _08082AC8 @ =c2_whiteout
	bl SetMainCallback2
	b _08082ADA
	.align 2, 0
_08082AC4: .4byte gUnknown_02024D26
_08082AC8: .4byte c2_whiteout
_08082ACC:
	ldr r0, _08082AE0 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	bl sub_808257C
	bl sub_8082CB8
_08082ADA:
	pop {r0}
	bx r0
	.align 2, 0
_08082AE0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end do_choose_name_or_words_screen

	thumb_func_start sub_80826B0
sub_80826B0: @ 8082AE4
	push {lr}
	ldr r1, _08082B00 @ =gUnknown_020239F8
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _08082B04 @ =gMain
	ldr r0, _08082B08 @ =do_choose_name_or_words_screen
	str r0, [r1, 0x8]
	bl task_add_01_battle_start_with_music_and_stats
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_08082B00: .4byte gUnknown_020239F8
_08082B04: .4byte gMain
_08082B08: .4byte do_choose_name_or_words_screen
	thumb_func_end sub_80826B0

	thumb_func_start sub_80826D8
sub_80826D8: @ 8082B0C
	push {lr}
	bl sub_808281C
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_80826D8

	thumb_func_start sub_80826E8
sub_80826E8: @ 8082B1C
	push {lr}
	ldr r0, _08082B2C @ =gTrainerBattleScriptReturnAddress
	ldr r0, [r0]
	cmp r0, 0
	bne _08082B28
	ldr r0, _08082B30 @ =gUnknown_081C6C02
_08082B28:
	pop {r1}
	bx r1
	.align 2, 0
_08082B2C: .4byte gTrainerBattleScriptReturnAddress
_08082B30: .4byte gUnknown_081C6C02
	thumb_func_end sub_80826E8

	thumb_func_start sub_8082700
sub_8082700: @ 8082B34
	push {lr}
	ldr r0, _08082B44 @ =gTrainerBattleEndScript
	ldr r0, [r0]
	cmp r0, 0
	bne _08082B40
	ldr r0, _08082B48 @ =gUnknown_081C6C02
_08082B40:
	pop {r1}
	bx r1
	.align 2, 0
_08082B44: .4byte gTrainerBattleEndScript
_08082B48: .4byte gUnknown_081C6C02
	thumb_func_end sub_8082700

	thumb_func_start sub_8082718
sub_8082718: @ 8082B4C
	push {lr}
	bl sub_8082880
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_8082718

	thumb_func_start PlayTrainerEncounterMusic
PlayTrainerEncounterMusic: @ 8082B5C
	push {lr}
	ldr r0, _08082B84 @ =gTrainerBattleMode
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08082C36
	cmp r0, 0x8
	beq _08082C36
	ldr r0, _08082B88 @ =gTrainerBattleOpponent
	ldrh r0, [r0]
	bl sub_803FC58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _08082C30
	lsls r0, 2
	ldr r1, _08082B8C @ =_08082B90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082B84: .4byte gTrainerBattleMode
_08082B88: .4byte gTrainerBattleOpponent
_08082B8C: .4byte _08082B90
	.align 2, 0
_08082B90:
	.4byte _08082BC8
	.4byte _08082BCE
	.4byte _08082BD8
	.4byte _08082C30
	.4byte _08082BE0
	.4byte _08082BE6
	.4byte _08082BF0
	.4byte _08082BF8
	.4byte _08082C00
	.4byte _08082C08
	.4byte _08082C10
	.4byte _08082C16
	.4byte _08082C20
	.4byte _08082C28
_08082BC8:
	movs r0, 0xBE
	lsls r0, 1
	b _08082C32
_08082BCE:
	ldr r0, _08082BD4 @ =0x00000197
	b _08082C32
	.align 2, 0
_08082BD4: .4byte 0x00000197
_08082BD8:
	ldr r0, _08082BDC @ =0x0000017b
	b _08082C32
	.align 2, 0
_08082BDC: .4byte 0x0000017b
_08082BE0:
	movs r0, 0xD0
	lsls r0, 1
	b _08082C32
_08082BE6:
	ldr r0, _08082BEC @ =0x000001a1
	b _08082C32
	.align 2, 0
_08082BEC: .4byte 0x000001a1
_08082BF0:
	ldr r0, _08082BF4 @ =0x000001a3
	b _08082C32
	.align 2, 0
_08082BF4: .4byte 0x000001a3
_08082BF8:
	ldr r0, _08082BFC @ =0x000001b9
	b _08082C32
	.align 2, 0
_08082BFC: .4byte 0x000001b9
_08082C00:
	ldr r0, _08082C04 @ =0x00000181
	b _08082C32
	.align 2, 0
_08082C04: .4byte 0x00000181
_08082C08:
	ldr r0, _08082C0C @ =0x000001c1
	b _08082C32
	.align 2, 0
_08082C0C: .4byte 0x000001c1
_08082C10:
	movs r0, 0xE1
	lsls r0, 1
	b _08082C32
_08082C16:
	ldr r0, _08082C1C @ =0x000001c3
	b _08082C32
	.align 2, 0
_08082C1C: .4byte 0x000001c3
_08082C20:
	ldr r0, _08082C24 @ =0x000001c5
	b _08082C32
	.align 2, 0
_08082C24: .4byte 0x000001c5
_08082C28:
	ldr r0, _08082C2C @ =0x0000018d
	b _08082C32
	.align 2, 0
_08082C2C: .4byte 0x0000018d
_08082C30:
	ldr r0, _08082C3C @ =0x000001a7
_08082C32:
	bl PlayNewMapMusic
_08082C36:
	pop {r0}
	bx r0
	.align 2, 0
_08082C3C: .4byte 0x000001a7
	thumb_func_end PlayTrainerEncounterMusic

	thumb_func_start SanitizeString
SanitizeString: @ 8082C40
	push {lr}
	cmp r0, 0
	bne _08082C48
	ldr r0, _08082C4C @ =gOtherText_CancelWithTerminator
_08082C48:
	pop {r1}
	bx r1
	.align 2, 0
_08082C4C: .4byte gOtherText_CancelWithTerminator
	thumb_func_end SanitizeString

	thumb_func_start sub_808281C
sub_808281C: @ 8082C50
	push {lr}
	ldr r0, _08082C60 @ =gTrainerIntroSpeech
	ldr r0, [r0]
	bl SanitizeString
	pop {r1}
	bx r1
	.align 2, 0
_08082C60: .4byte gTrainerIntroSpeech
	thumb_func_end sub_808281C

	thumb_func_start sub_8082830
sub_8082830: @ 8082C64
	push {r4,lr}
	ldr r0, _08082C78 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08082C7C
	bl sub_80BCCE8
	b _08082C80
	.align 2, 0
_08082C78: .4byte gTrainerBattleOpponent
_08082C7C:
	ldr r0, _08082C98 @ =gTrainerDefeatSpeech
	ldr r0, [r0]
_08082C80:
	ldr r4, _08082C9C @ =gStringVar4
	bl SanitizeString
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082C98: .4byte gTrainerDefeatSpeech
_08082C9C: .4byte gStringVar4
	thumb_func_end sub_8082830

	thumb_func_start unref_sub_808286C
unref_sub_808286C: @ 8082CA0
	push {lr}
	ldr r0, _08082CB0 @ =gTrainerVictorySpeech
	ldr r0, [r0]
	bl SanitizeString
	pop {r1}
	bx r1
	.align 2, 0
_08082CB0: .4byte gTrainerVictorySpeech
	thumb_func_end unref_sub_808286C

	thumb_func_start sub_8082880
sub_8082880: @ 8082CB4
	push {lr}
	ldr r0, _08082CC4 @ =gTrainerCannotBattleSpeech
	ldr r0, [r0]
	bl SanitizeString
	pop {r1}
	bx r1
	.align 2, 0
_08082CC4: .4byte gTrainerCannotBattleSpeech
	thumb_func_end sub_8082880

	thumb_func_start sub_8082894
sub_8082894: @ 8082CC8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	adds r2, r0, 0
_08082CD2:
	ldrh r0, [r2]
	cmp r0, r1
	bne _08082CDC
	adds r0, r3, 0
	b _08082CE8
_08082CDC:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0x37
	ble _08082CD2
	movs r0, 0x1
	negs r0, r0
_08082CE8:
	pop {r1}
	bx r1
	thumb_func_end sub_8082894

	thumb_func_start sub_80828B8
sub_80828B8: @ 8082CEC
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r2, r0, 0
_08082CF6:
	movs r1, 0
	ldrh r0, [r2]
	cmp r0, 0
	beq _08082D1C
	movs r3, 0
_08082D00:
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, r5
	bne _08082D0C
	adds r0, r4, 0
	b _08082D28
_08082D0C:
	adds r3, 0x2
	adds r1, 0x1
	cmp r1, 0x4
	bgt _08082D1C
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _08082D00
_08082D1C:
	adds r2, 0x10
	adds r4, 0x1
	cmp r4, 0x37
	ble _08082CF6
	movs r0, 0x1
	negs r0, r0
_08082D28:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80828B8

	thumb_func_start sub_80828FC
sub_80828FC: @ 8082D30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r4, 0
	movs r5, 0
	ldr r0, _08082D9C @ =0x020260ae
	mov r9, r0
_08082D52:
	lsls r0, r5, 4
	adds r2, r0, r7
	ldrh r1, [r2, 0xA]
	adds r6, r0, 0
	adds r0, r5, 0x1
	mov r8, r0
	ldr r0, [sp]
	cmp r1, r0
	bne _08082DC4
	ldrh r0, [r2, 0xC]
	cmp r0, r10
	bne _08082DC4
	mov r1, r9
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08082DC2
	ldrh r0, [r2]
	bl trainer_flag_check
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082DC4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bhi _08082DC4
	movs r4, 0x1
	b _08082DA2
	.align 2, 0
_08082D9C: .4byte 0x020260ae
_08082DA0:
	adds r4, 0x1
_08082DA2:
	cmp r4, 0x4
	bgt _08082DBC
	adds r0, r6, r7
	lsls r1, r4, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _08082DBC
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	bne _08082DA0
_08082DBC:
	mov r1, r9
	adds r0, r5, r1
	strb r4, [r0]
_08082DC2:
	movs r4, 0x1
_08082DC4:
	mov r5, r8
	cmp r5, 0x37
	ble _08082D52
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80828FC

	thumb_func_start sub_80829A8
sub_80829A8: @ 8082DDC
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r5, _08082E08 @ =0x020260ae
	adds r3, r0, 0
	adds r3, 0xA
_08082DEE:
	ldrh r0, [r3]
	cmp r0, r4
	bne _08082E0C
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _08082E0C
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082E0C
	movs r0, 0x1
	b _08082E16
	.align 2, 0
_08082E08: .4byte 0x020260ae
_08082E0C:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _08082DEE
	movs r0, 0
_08082E16:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80829A8

	thumb_func_start sub_80829E8
sub_80829E8: @ 8082E1C
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	adds r3, r0, 0
	adds r3, 0xA
_08082E2C:
	ldrh r0, [r3]
	cmp r0, r4
	bne _08082E3C
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _08082E3C
	movs r0, 0x1
	b _08082E46
_08082E3C:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _08082E2C
	movs r0, 0
_08082E46:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80829E8

	thumb_func_start sub_8082A18
sub_8082A18: @ 8082E4C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082E80
	cmp r1, 0x63
	bgt _08082E80
	ldr r0, _08082E78 @ =gSaveBlock1
	ldr r2, _08082E7C @ =0x0000097a
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082E80
	movs r0, 0x1
	b _08082E82
	.align 2, 0
_08082E78: .4byte gSaveBlock1
_08082E7C: .4byte 0x0000097a
_08082E80:
	movs r0, 0
_08082E82:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A18

	thumb_func_start sub_8082A54
sub_8082A54: @ 8082E88
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082EBC
	cmp r1, 0x63
	bgt _08082EBC
	ldr r0, _08082EB4 @ =gSaveBlock1
	ldr r2, _08082EB8 @ =0x0000097a
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082EBC
	movs r0, 0x1
	b _08082EBE
	.align 2, 0
_08082EB4: .4byte gSaveBlock1
_08082EB8: .4byte 0x0000097a
_08082EBC:
	movs r0, 0
_08082EBE:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A54

	thumb_func_start sub_8082A90
sub_8082A90: @ 8082EC4
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08082EEC
	movs r0, 0
	b _08082F12
_08082EDE:
	subs r0, r6, 0x1
	lsls r0, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	b _08082F12
_08082EE8:
	ldrh r0, [r5]
	b _08082F12
_08082EEC:
	lsls r0, r1, 4
	adds r7, r4, r0
	movs r6, 0x1
	adds r5, r7, 0x2
	adds r4, r5, 0
_08082EF6:
	ldrh r0, [r4]
	cmp r0, 0
	beq _08082EDE
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082EE8
	adds r4, 0x2
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082EF6
	ldrh r0, [r7, 0x8]
_08082F12:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8082A90

	thumb_func_start sub_8082AE4
sub_8082AE4: @ 8082F18
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082F38
	ldr r0, _08082F3C @ =gSaveBlock1
	ldr r2, _08082F40 @ =0x0000097a
	adds r0, r2
	adds r0, r1, r0
	movs r1, 0
	strb r1, [r0]
_08082F38:
	pop {r0}
	bx r0
	.align 2, 0
_08082F3C: .4byte gSaveBlock1
_08082F40: .4byte 0x0000097a
	thumb_func_end sub_8082AE4

	thumb_func_start sub_8082B10
sub_8082B10: @ 8082F44
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082F6E
	lsls r0, r1, 4
	adds r0, r4
	ldrh r0, [r0, 0x2]
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082F6E
	movs r0, 0x1
	b _08082F70
_08082F6E:
	movs r0, 0
_08082F70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B10

	thumb_func_start sub_8082B44
sub_8082B44: @ 8082F78
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r4, _08082F98 @ =gBadgeFlags
_08082F80:
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082F9C
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082F9C
	movs r0, 0x1
	b _08082FA6
	.align 2, 0
_08082F98: .4byte gBadgeFlags
_08082F9C:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	bls _08082F80
	movs r0, 0
_08082FA6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B44

	thumb_func_start sub_8082B78
sub_8082B78: @ 8082FAC
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082FD4
	ldr r0, _08082FC8 @ =gSaveBlock1
	ldr r2, _08082FCC @ =0x00000978
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0xFE
	bls _08082FD0
	movs r0, 0xFF
	b _08082FD2
	.align 2, 0
_08082FC8: .4byte gSaveBlock1
_08082FCC: .4byte 0x00000978
_08082FD0:
	adds r0, 0x1
_08082FD2:
	strh r0, [r1]
_08082FD4:
	pop {r0}
	bx r0
	thumb_func_end sub_8082B78

	thumb_func_start sub_8082BA4
sub_8082BA4: @ 8082FD8
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082FFC
	ldr r0, _08082FF4 @ =gSaveBlock1
	ldr r1, _08082FF8 @ =0x00000978
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFE
	bls _08082FFC
	movs r0, 0x1
	b _08082FFE
	.align 2, 0
_08082FF4: .4byte gSaveBlock1
_08082FF8: .4byte 0x00000978
_08082FFC:
	movs r0, 0
_08082FFE:
	pop {r1}
	bx r1
	thumb_func_end sub_8082BA4

	thumb_func_start sub_8082BD0
sub_8082BD0: @ 8083004
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_8082BA4
	cmp r0, 0
	beq _0808302E
	ldr r0, _08083034 @ =gTrainerEyeTrainers
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80828FC
	cmp r0, 0x1
	bne _0808302E
	ldr r0, _08083038 @ =gSaveBlock1
	ldr r1, _0808303C @ =0x00000978
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
_0808302E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083034: .4byte gTrainerEyeTrainers
_08083038: .4byte gSaveBlock1
_0808303C: .4byte 0x00000978
	thumb_func_end sub_8082BD0

	thumb_func_start sub_8082C0C
sub_8082C0C: @ 8083040
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _0808305C @ =gTrainerEyeTrainers
	adds r1, r3, 0
	bl sub_80829A8
	pop {r1}
	bx r1
	.align 2, 0
_0808305C: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C0C

	thumb_func_start unref_sub_8082C2C
unref_sub_8082C2C: @ 8083060
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _0808307C @ =gTrainerEyeTrainers
	adds r1, r3, 0
	bl sub_80829E8
	pop {r1}
	bx r1
	.align 2, 0
_0808307C: .4byte gTrainerEyeTrainers
	thumb_func_end unref_sub_8082C2C

	thumb_func_start sub_8082C4C
sub_8082C4C: @ 8083080
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08083098 @ =gTrainerEyeTrainers
	bl sub_8082A90
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08083098: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C4C

	thumb_func_start sub_8082C68
sub_8082C68: @ 808309C
	push {r4,r5,lr}
	ldr r5, _080830C0 @ =gTrainerEyeTrainers
	ldr r4, _080830C4 @ =gTrainerBattleOpponent
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082A18
	lsls r0, 24
	cmp r0, 0
	bne _080830C8
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082B10
	lsls r0, 24
	lsrs r0, 24
	b _080830CA
	.align 2, 0
_080830C0: .4byte gTrainerEyeTrainers
_080830C4: .4byte gTrainerBattleOpponent
_080830C8:
	movs r0, 0x1
_080830CA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082C68

	thumb_func_start sub_8082C9C
sub_8082C9C: @ 80830D0
	push {lr}
	ldr r0, _080830E4 @ =gTrainerEyeTrainers
	ldr r1, _080830E8 @ =gTrainerBattleOpponent
	ldrh r1, [r1]
	bl sub_8082A54
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080830E4: .4byte gTrainerEyeTrainers
_080830E8: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082C9C

	thumb_func_start sub_8082CB8
sub_8082CB8: @ 80830EC
	push {lr}
	ldr r0, _08083100 @ =gTrainerEyeTrainers
	ldr r1, _08083104 @ =gTrainerBattleOpponent
	ldrh r1, [r1]
	bl sub_8082AE4
	bl sub_808257C
	pop {r0}
	bx r0
	.align 2, 0
_08083100: .4byte gTrainerEyeTrainers
_08083104: .4byte gTrainerBattleOpponent
	thumb_func_end sub_8082CB8

	.align 2, 0 @ Don't pad with nop.
