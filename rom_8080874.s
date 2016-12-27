	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start palette_bg_faded_fill_black
palette_bg_faded_fill_black: @ 8080CA8
	push {lr}
	sub sp, 0x4
	ldr r0, _08080CC0 @ =0x7fff7fff
	str r0, [sp]
	ldr r1, _08080CC4 @ =gPlttBufferFaded
	ldr r2, _08080CC8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08080CC0: .4byte 0x7fff7fff
_08080CC4: .4byte gPlttBufferFaded
_08080CC8: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_black

	thumb_func_start palette_bg_faded_fill_white
palette_bg_faded_fill_white: @ 8080CCC
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _08080CE4 @ =gPlttBufferFaded
	ldr r2, _08080CE8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08080CE4: .4byte gPlttBufferFaded
_08080CE8: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_white

	thumb_func_start pal_fill_for_maplights
pal_fill_for_maplights: @ 8080CEC
	push {r4,lr}
	bl get_map_light_from_warp0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sav1_map_get_light_level
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl fade_type_for_given_maplight_pair
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08080D16
	cmp r0, 0x1
	beq _08080D24
	b _08080D30
_08080D16:
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
	b _08080D30
_08080D24:
	movs r0, 0x2
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_black
_08080D30:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pal_fill_for_maplights

	thumb_func_start pal_fill_black
pal_fill_black: @ 8080D38
	push {lr}
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
	pop {r0}
	bx r0
	thumb_func_end pal_fill_black

	thumb_func_start sub_8080918
sub_8080918: @ 8080D4C
	push {r4,lr}
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl warp1_get_mapheader
	ldrb r1, [r0, 0x17]
	adds r0, r4, 0
	bl sub_810CDB8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08080D72
	cmp r0, 0x1
	beq _08080D7C
	b _08080D84
_08080D72:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _08080D84
_08080D7C:
	movs r0, 0x3
	movs r1, 0
	bl fade_screen
_08080D84:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8080918

	thumb_func_start sub_8080958
sub_8080958: @ 8080D8C
	push {lr}
	lsls r0, 24
	movs r1, 0
	cmp r0, 0
	bne _08080D98
	movs r1, 0x1
_08080D98:
	adds r0, r1, 0
	bl sub_8059B88
	pop {r0}
	bx r0
	thumb_func_end sub_8080958

	thumb_func_start task0A_asap_script_env_2_enable_and_set_ctx_running
task0A_asap_script_env_2_enable_and_set_ctx_running: @ 8080DA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080DBC
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08080DBC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task0A_asap_script_env_2_enable_and_set_ctx_running

	thumb_func_start sub_8080990
sub_8080990: @ 8080DC4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _08080DE0 @ =task0A_asap_script_env_2_enable_and_set_ctx_running
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080DE0: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_8080990

	thumb_func_start sub_80809B0
sub_80809B0: @ 8080DE4
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _08080DFC @ =task0A_asap_script_env_2_enable_and_set_ctx_running
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080DFC: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_80809B0

	thumb_func_start task_mpl_807DD60
task_mpl_807DD60: @ 8080E00
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r2, _08080E24 @ =gTasks
	adds r4, r0, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080E3A
	cmp r0, 0x1
	bgt _08080E28
	cmp r0, 0
	beq _08080E2E
	b _08080E6A
	.align 2, 0
_08080E24: .4byte gTasks
_08080E28:
	cmp r0, 0x2
	beq _08080E58
	b _08080E6A
_08080E2E:
	bl sub_8083664
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	b _08080E50
_08080E3A:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _08080E6A
	bl pal_fill_for_maplights
_08080E50:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080E6A
_08080E58:
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080E6A
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080E6A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807DD60

	thumb_func_start sub_8080A3C
sub_8080A3C: @ 8080E70
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl palette_bg_faded_fill_white
	ldr r0, _08080E8C @ =task_mpl_807DD60
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080E8C: .4byte task_mpl_807DD60
	thumb_func_end sub_8080A3C

	thumb_func_start sub_8080A5C
sub_8080A5C: @ 8080E90
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08080EB4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080EC4
	cmp r0, 0x1
	bgt _08080EB8
	cmp r0, 0
	beq _08080EBE
	b _08080EF0
	.align 2, 0
_08080EB4: .4byte gTasks
_08080EB8:
	cmp r0, 0x2
	beq _08080EDA
	b _08080EF0
_08080EBE:
	bl sub_80084A4
	b _08080ED2
_08080EC4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08080EF0
	bl pal_fill_for_maplights
_08080ED2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080EF0
_08080EDA:
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080EF0
	bl sub_8007B14
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080EF0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8080A5C

	thumb_func_start sub_8080AC4
sub_8080AC4: @ 8080EF8
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl palette_bg_faded_fill_white
	ldr r0, _08080F14 @ =sub_8080A5C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080F14: .4byte sub_8080A5C
	thumb_func_end sub_8080AC4

	thumb_func_start sub_8080AE4
sub_8080AE4: @ 8080F18
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
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08080F50
	ldr r1, _08080F4C @ =sub_8080B9C
	b _08080F62
	.align 2, 0
_08080F4C: .4byte sub_8080B9C
_08080F50:
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08080F74 @ =task_map_chg_seq_0807E2CC
	cmp r0, 0x1
	bne _08080F62
	ldr r1, _08080F78 @ =task_map_chg_seq_0807E20C
_08080F62:
	adds r0, r1, 0
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080F74: .4byte task_map_chg_seq_0807E2CC
_08080F78: .4byte task_map_chg_seq_0807E20C
	thumb_func_end sub_8080AE4

	thumb_func_start mapldr_default
mapldr_default: @ 8080F7C
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl sub_8080AE4
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end mapldr_default

	thumb_func_start sub_8080B60
sub_8080B60: @ 8080F94
	push {lr}
	bl sub_8053E90
	bl pal_fill_black
	bl sub_8080AE4
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_8080B60

	thumb_func_start sub_8080B78
sub_8080B78: @ 8080FAC
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	movs r0, 0x2E
	bl PlaySE
	ldr r0, _08080FCC @ =task_map_chg_seq_0807E2CC
	movs r1, 0xA
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08080FCC: .4byte task_map_chg_seq_0807E2CC
	thumb_func_end sub_8080B78

	thumb_func_start sub_8080B9C
sub_8080B9C: @ 8080FD0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08080FFC @ =gTasks
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _080810E2
	lsls r0, 2
	ldr r1, _08081000 @ =_08081004
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080FFC: .4byte gTasks
_08081000: .4byte _08081004
	.align 2, 0
_08081004:
	.4byte _08081018
	.4byte _0808103C
	.4byte _08081074
	.4byte _080810B8
	.4byte _080810D8
_08081018:
	movs r0, 0
	bl sub_8080958
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl FieldSetDoorOpened
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _080810E2
_0808103C:
	bl sub_8080E70
	cmp r0, 0
	beq _080810E2
	movs r0, 0x1
	bl sub_8080958
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08081070 @ =gMapObjects
	adds r0, r1
	movs r1, 0x8
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080810E2
	.align 2, 0
_08081070: .4byte gMapObjects
_08081074:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _080810E2
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl FieldAnimateDoorClose
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080810B4 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080810E2
	.align 2, 0
_080810B4: .4byte gMapObjects
_080810B8:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _080810CE
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080810E2
_080810CE:
	bl sub_806451C
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _080810E2
_080810D8:
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_080810E2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8080B9C

	thumb_func_start task_map_chg_seq_0807E20C
task_map_chg_seq_0807E20C: @ 80810E8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08081114 @ =gTasks
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0808113A
	cmp r0, 0x1
	bgt _08081118
	cmp r0, 0
	beq _08081122
	b _080811A2
	.align 2, 0
_08081114: .4byte gTasks
_08081118:
	cmp r0, 0x2
	beq _08081184
	cmp r0, 0x3
	beq _08081198
	b _080811A2
_08081122:
	movs r0, 0
	bl sub_8080958
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _080811A2
_0808113A:
	bl sub_8080E70
	cmp r0, 0
	beq _080811A2
	movs r0, 0x1
	bl sub_8080958
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08081180 @ =gMapObjects
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080811A2
	.align 2, 0
_08081180: .4byte gMapObjects
_08081184:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _080811A2
	bl sub_806451C
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080811A2
_08081198:
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_080811A2:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E20C

	thumb_func_start task_map_chg_seq_0807E2CC
task_map_chg_seq_0807E2CC: @ 80811A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080811C8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080811CC
	cmp r0, 0x1
	beq _080811DC
	b _080811F2
	.align 2, 0
_080811C8: .4byte gTasks
_080811CC:
	bl player_bitmagic
	bl ScriptContext2_Enable
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080811F2
_080811DC:
	bl sub_8080E70
	cmp r0, 0
	beq _080811F2
	bl sub_806451C
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_080811F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E2CC

	thumb_func_start sub_8080DC4
sub_8080DC4: @ 80811F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08081214
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _0808121C @ =sub_80712B4
	movs r1, 0x50
	bl CreateTask
_08081214:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808121C: .4byte sub_80712B4
	thumb_func_end sub_8080DC4

	thumb_func_start atk17_seteffectuser
atk17_seteffectuser: @ 8081220
	push {lr}
	bl pal_fill_black
	ldr r0, _08081234 @ =sub_8080DC4
	bl CreateStartMenuTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08081234: .4byte sub_8080DC4
	thumb_func_end atk17_seteffectuser

	thumb_func_start task_mpl_807E3C8
task_mpl_807E3C8: @ 8081238
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08081254
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8064E2C
_08081254:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807E3C8

	thumb_func_start sub_8080E28
sub_8080E28: @ 808125C
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _08081274 @ =task_mpl_807E3C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081274: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E28

	thumb_func_start sub_8080E44
sub_8080E44: @ 8081278
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _08081294 @ =task_mpl_807E3C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081294: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E44

	thumb_func_start sub_8080E64
sub_8080E64: @ 8081298
	ldr r0, _080812A0 @ =gPaletteFade
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	bx lr
	.align 2, 0
_080812A0: .4byte gPaletteFade
	thumb_func_end sub_8080E64

	thumb_func_start sub_8080E70
sub_8080E70: @ 80812A4
	push {lr}
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080812B6
	movs r0, 0
	b _080812B8
_080812B6:
	movs r0, 0x1
_080812B8:
	pop {r1}
	bx r1
	thumb_func_end sub_8080E70

	thumb_func_start sub_8080E88
sub_8080E88: @ 80812BC
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	bl PlayRainSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _080812E8 @ =gUnknown_0300485C
	ldr r1, _080812EC @ =mapldr_default
	str r1, [r0]
	ldr r0, _080812F0 @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080812E8: .4byte gUnknown_0300485C
_080812EC: .4byte mapldr_default
_080812F0: .4byte task0A_fade_n_map_maybe
	thumb_func_end sub_8080E88

	thumb_func_start sp13E_warp_to_last_warp
sp13E_warp_to_last_warp: @ 80812F4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	bl PlayRainSoundEffect
	ldr r0, _08081318 @ =gUnknown_0300485C
	ldr r1, _0808131C @ =mapldr_default
	str r1, [r0]
	ldr r0, _08081320 @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081318: .4byte gUnknown_0300485C
_0808131C: .4byte mapldr_default
_08081320: .4byte task0A_fade_n_map_maybe
	thumb_func_end sp13E_warp_to_last_warp

	thumb_func_start sub_8080EF0
sub_8080EF0: @ 8081324
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _0808133C @ =gUnknown_0300485C
	ldr r1, _08081340 @ =mapldr_default
	str r1, [r0]
	ldr r0, _08081344 @ =sub_808115C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808133C: .4byte gUnknown_0300485C
_08081340: .4byte mapldr_default
_08081344: .4byte sub_808115C
	thumb_func_end sub_8080EF0

	thumb_func_start sp13F_fall_to_last_warp
sp13F_fall_to_last_warp: @ 8081348
	push {lr}
	bl sp13E_warp_to_last_warp
	ldr r1, _08081358 @ =gUnknown_0300485C
	ldr r0, _0808135C @ =sub_8086748
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08081358: .4byte gUnknown_0300485C
_0808135C: .4byte sub_8086748
	thumb_func_end sp13F_fall_to_last_warp

	thumb_func_start sub_8080F2C
sub_8080F2C: @ 8081360
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_8086A2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8080F2C

	thumb_func_start sub_8080F48
sub_8080F48: @ 808137C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_80871B8
	pop {r0}
	bx r0
	thumb_func_end sub_8080F48

	thumb_func_start sub_8080F58
sub_8080F58: @ 808138C
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_8087654
	pop {r0}
	bx r0
	thumb_func_end sub_8080F58

	thumb_func_start sub_8080F68
sub_8080F68: @ 808139C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	movs r0, 0x2D
	bl PlaySE
	ldr r0, _080813C4 @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	ldr r1, _080813C8 @ =gUnknown_0300485C
	ldr r0, _080813CC @ =sub_8080B78
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080813C4: .4byte task0A_fade_n_map_maybe
_080813C8: .4byte gUnknown_0300485C
_080813CC: .4byte sub_8080B78
	thumb_func_end sub_8080F68

	thumb_func_start sub_8080F9C
sub_8080F9C: @ 80813D0
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8080918
	ldr r0, _080813EC @ =task0A_fade_n_map_maybe
	movs r1, 0xA
	bl CreateTask
	ldr r1, _080813F0 @ =gUnknown_0300485C
	ldr r0, _080813F4 @ =sub_80C791C
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080813EC: .4byte task0A_fade_n_map_maybe
_080813F0: .4byte gUnknown_0300485C
_080813F4: .4byte sub_80C791C
	thumb_func_end sub_8080F9C

	thumb_func_start sub_8080FC4
sub_8080FC4: @ 80813F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0808141C @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0808142C
	cmp r0, 0x1
	bgt _08081420
	cmp r0, 0
	beq _08081426
	b _08081456
	.align 2, 0
_0808141C: .4byte gTasks
_08081420:
	cmp r0, 0x2
	beq _08081446
	b _08081456
_08081426:
	bl ScriptContext2_Enable
	b _0808143E
_0808142C:
	bl sub_8080E64
	cmp r0, 0
	bne _08081456
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081456
_0808143E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08081456
_08081446:
	bl warp_in
	ldr r0, _0808145C @ =sub_8054588
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081456:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808145C: .4byte sub_8054588
	thumb_func_end sub_8080FC4

	thumb_func_start sub_808102C
sub_808102C: @ 8081460
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08081480 @ =sub_8080FC4
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081480: .4byte sub_8080FC4
	thumb_func_end sub_808102C

	thumb_func_start sub_8081050
sub_8081050: @ 8081484
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080814A8 @ =0x03004b38
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080814CA
	cmp r0, 0x1
	bgt _080814AC
	cmp r0, 0
	beq _080814B2
	b _08081500
	.align 2, 0
_080814A8: .4byte 0x03004b38
_080814AC:
	cmp r0, 0x2
	beq _080814E8
	b _08081500
_080814B2:
	bl ClearLinkCallback_2
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_8053FF8
	movs r0, 0x9
	bl PlaySE
	b _080814E0
_080814CA:
	bl sub_8080E64
	cmp r0, 0
	bne _08081500
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081500
	bl sub_800832C
_080814E0:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08081500
_080814E8:
	ldr r0, _08081508 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08081500
	bl warp_in
	ldr r0, _0808150C @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081500:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081508: .4byte gReceivedRemoteLinkPlayers
_0808150C: .4byte CB2_LoadMap
	thumb_func_end sub_8081050

	thumb_func_start sub_80810DC
sub_80810DC: @ 8081510
	push {lr}
	ldr r0, _08081520 @ =sub_8081050
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081520: .4byte sub_8081050
	thumb_func_end sub_80810DC

	thumb_func_start task0A_fade_n_map_maybe
task0A_fade_n_map_maybe: @ 8081524
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081548 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0808155C
	cmp r0, 0x1
	bgt _0808154C
	cmp r0, 0
	beq _08081552
	b _08081586
	.align 2, 0
_08081548: .4byte gTasks
_0808154C:
	cmp r0, 0x2
	beq _08081576
	b _08081586
_08081552:
	bl player_bitmagic
	bl ScriptContext2_Enable
	b _0808156E
_0808155C:
	bl sub_8080E64
	cmp r0, 0
	bne _08081586
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081586
_0808156E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08081586
_08081576:
	bl warp_in
	ldr r0, _0808158C @ =CB2_LoadMap
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081586:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808158C: .4byte CB2_LoadMap
	thumb_func_end task0A_fade_n_map_maybe

	thumb_func_start sub_808115C
sub_808115C: @ 8081590
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080815C0 @ =gTasks
	adds r5, r1, r0
	adds r4, r5, 0
	adds r4, 0xC
	adds r6, r5, 0
	adds r6, 0xE
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	adds r2, r0, 0
	cmp r1, 0x4
	bls _080815B4
	b _080816F0
_080815B4:
	lsls r0, r1, 2
	ldr r1, _080815C4 @ =_080815C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080815C0: .4byte gTasks
_080815C4: .4byte _080815C8
	.align 2, 0
_080815C8:
	.4byte _080815DC
	.4byte _08081618
	.4byte _08081674
	.4byte _080816C0
	.4byte _080816DC
_080815DC:
	bl player_bitmagic
	adds r0, r4, 0
	adds r1, r6, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_8058790
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl FieldAnimateDoorOpen
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _080816F0
_08081618:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _0808162E
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080816F0
_0808162E:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _08081670 @ =gMapObjects
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimActive
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x9
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080816F0
	.align 2, 0
_08081670: .4byte gMapObjects
_08081674:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _080816F0
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl FieldAnimateDoorClose
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080816BC @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0
	bl sub_8080958
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080816F0
	.align 2, 0
_080816BC: .4byte gMapObjects
_080816C0:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _080816D6
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080816F0
_080816D6:
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _080816F0
_080816DC:
	bl sub_8053FF8
	bl sub_8080918
	bl PlayRainSoundEffect
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080816F8 @ =task0A_fade_n_map_maybe
	str r0, [r5]
_080816F0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080816F8: .4byte task0A_fade_n_map_maybe
	thumb_func_end sub_808115C

	thumb_func_start sub_80812C8
sub_80812C8: @ 80816FC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081720 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081734
	cmp r0, 0x1
	bgt _08081724
	cmp r0, 0
	beq _0808172A
	b _0808175E
	.align 2, 0
_08081720: .4byte gTasks
_08081724:
	cmp r0, 0x2
	beq _0808174E
	b _0808175E
_0808172A:
	bl player_bitmagic
	bl ScriptContext2_Enable
	b _08081746
_08081734:
	bl sub_8080E64
	cmp r0, 0
	bne _0808175E
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _0808175E
_08081746:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0808175E
_0808174E:
	bl warp_in
	ldr r0, _08081764 @ =sub_8054534
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0808175E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081764: .4byte sub_8054534
	thumb_func_end sub_80812C8

	thumb_func_start sub_8081334
sub_8081334: @ 8081768
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	bl PlayRainSoundEffect
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08081794 @ =gUnknown_0300485C
	ldr r1, _08081798 @ =sub_8080B60
	str r1, [r0]
	ldr r0, _0808179C @ =sub_80812C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081794: .4byte gUnknown_0300485C
_08081798: .4byte sub_8080B60
_0808179C: .4byte sub_80812C8
	thumb_func_end sub_8081334

	thumb_func_start sub_808136C
sub_808136C: @ 80817A0
	push {lr}
	cmp r1, 0xA0
	bhi _080817C8
	cmp r2, 0
	bge _080817AC
	movs r2, 0
_080817AC:
	cmp r2, 0xFF
	ble _080817B2
	movs r2, 0xFF
_080817B2:
	cmp r3, 0
	bge _080817B8
	movs r3, 0
_080817B8:
	cmp r3, 0xFF
	ble _080817BE
	movs r3, 0xFF
_080817BE:
	lsls r1, 1
	adds r1, r0
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
_080817C8:
	pop {r0}
	bx r0
	thumb_func_end sub_808136C

	thumb_func_start sub_8081398
sub_8081398: @ 80817CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	mov r10, r1
	mov r9, r2
	adds r6, r3, 0
	mov r8, r6
	movs r7, 0
	cmp r6, 0
	blt _08081848
_080817E8:
	mov r0, r9
	subs r1, r0, r7
	mov r0, r10
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	subs r1, r0, r6
	mov r0, r10
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r1, r8
	adds r1, 0x1
	lsls r0, r7, 1
	subs r1, r0
	mov r8, r1
	adds r7, 0x1
	cmp r1, 0
	bge _08081844
	subs r1, r6, 0x1
	lsls r0, r1, 1
	add r8, r0
	adds r6, r1, 0
_08081844:
	cmp r6, r7
	bge _080817E8
_08081848:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8081398

	thumb_func_start sub_8081424
sub_8081424: @ 8081858
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0808187C @ =0x03004b38
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080818B4
	cmp r0, 0x1
	bgt _08081880
	cmp r0, 0
	beq _08081886
	b _08081916
	.align 2, 0
_0808187C: .4byte 0x03004b38
_08081880:
	cmp r0, 0x2
	beq _0808190C
	b _08081916
_08081886:
	ldr r0, _080818AC @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080818B0 @ =gUnknown_03004DE0
	adds r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_8081398
	movs r0, 0x1
	strh r0, [r4]
	b _08081916
	.align 2, 0
_080818AC: .4byte gUnknown_03004DC0
_080818B0: .4byte gUnknown_03004DE0
_080818B4:
	ldr r0, _080818FC @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08081900 @ =gUnknown_03004DE0
	adds r0, r1
	movs r6, 0x2
	ldrsh r1, [r4, r6]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r6, 0x6
	ldrsh r3, [r4, r6]
	bl sub_8081398
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08081916
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _08081904
	bl remove_some_task
	movs r0, 0x2
	strh r0, [r4]
	b _08081916
	.align 2, 0
_080818FC: .4byte gUnknown_03004DC0
_08081900: .4byte gUnknown_03004DE0
_08081904:
	adds r0, r5, 0
	bl DestroyTask
	b _08081916
_0808190C:
	bl dp12_8087EA4
	adds r0, r5, 0
	bl DestroyTask
_08081916:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8081424

	thumb_func_start sub_80814E8
sub_80814E8: @ 808191C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08081940 @ =sub_8081424
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081938
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081938:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081940: .4byte sub_8081424
	thumb_func_end sub_80814E8

	thumb_func_start sub_8081510
sub_8081510: @ 8081944
	push {r4,lr}
	ldr r4, _08081964 @ =sub_80814E8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0808195C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0808195C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081964: .4byte sub_80814E8
	thumb_func_end sub_8081510

	thumb_func_start sub_8081534
sub_8081534: @ 8081968
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080819AC @ =sub_8081424
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080819B0 @ =0x03004b38
	adds r1, r0, r1
	strh r5, [r1, 0x6]
	strh r4, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0x2]
	mov r0, r9
	strh r0, [r1, 0x4]
	strh r6, [r1, 0xC]
	cmp r5, r4
	bge _080819B4
	strh r7, [r1, 0xA]
	b _080819B8
	.align 2, 0
_080819AC: .4byte sub_8081424
_080819B0: .4byte 0x03004b38
_080819B4:
	negs r0, r7
	strh r0, [r1, 0xA]
_080819B8:
	adds r0, r2, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8081534

	thumb_func_start sub_8081594
sub_8081594: @ 80819C8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	cmp r4, 0
	bne _080819E2
	movs r5, 0x1
_080819E2:
	ldr r1, _08081A10 @ =gUnknown_0839ACDC
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r3, [r0]
	str r5, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_8081534
	bl sub_8081510
	bl ScriptContext2_Enable
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081A10: .4byte gUnknown_0839ACDC
	thumb_func_end sub_8081594

	thumb_func_start sub_80815E0
sub_80815E0: @ 8081A14
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08081A42
	ldr r4, _08081A48 @ =gUnknown_03004DE0
	ldr r1, _08081A4C @ =gUnknown_0839ACDC
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x50
	bl sub_8081398
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
_08081A42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081A48: .4byte gUnknown_03004DE0
_08081A4C: .4byte gUnknown_0839ACDC
	thumb_func_end sub_80815E0

	thumb_func_start sub_808161C
sub_808161C: @ 8081A50
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	cmp r0, 0
	bne _08081A5E
	movs r1, 0x1F
	b _08081A64
_08081A5E:
	movs r0, 0xF8
	lsls r0, 7
	adds r1, r0, 0
_08081A64:
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	movs r4, 0xF0
	lsls r4, 16
_08081A6E:
	lsrs r1, r4, 16
	mov r0, sp
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x1
	cmp r5, 0xF
	ble _08081A6E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808161C

	thumb_func_start sub_8081658
sub_8081658: @ 8081A8C
	push {lr}
	lsls r0, 16
	ldr r2, _08081AAC @ =0x04000052
	ldrh r1, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	ldrh r1, [r2]
	lsrs r2, r1, 8
	cmp r0, 0
	beq _08081AB0
	cmp r3, 0
	beq _08081ABA
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _08081ABA
	.align 2, 0
_08081AAC: .4byte 0x04000052
_08081AB0:
	cmp r2, 0xF
	bhi _08081ABA
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08081ABA:
	ldr r1, _08081AD0 @ =0x04000052
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
	cmp r3, 0
	bne _08081AD4
	cmp r2, 0x10
	bne _08081AD4
	movs r0, 0x1
	b _08081AD6
	.align 2, 0
_08081AD0: .4byte 0x04000052
_08081AD4:
	movs r0, 0
_08081AD6:
	pop {r1}
	bx r1
	thumb_func_end sub_8081658

	thumb_func_start sub_80816A8
sub_80816A8: @ 8081ADC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08081B04 @ =0x03004b38
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x7
	bls _08081AF8
	b _08081CC6
_08081AF8:
	lsls r0, 2
	ldr r1, _08081B08 @ =_08081B0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08081B04: .4byte 0x03004b38
_08081B08: .4byte _08081B0C
	.align 2, 0
_08081B0C:
	.4byte _08081B2C
	.4byte _08081BC4
	.4byte _08081BF0
	.4byte _08081C0C
	.4byte _08081C22
	.4byte _08081C86
	.4byte _08081C4C
	.4byte _08081C5A
_08081B2C:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	strh r0, [r7, 0xC]
	ldr r3, _08081BA0 @ =0x04000050
	ldrh r0, [r3]
	strh r0, [r7, 0xE]
	ldr r6, _08081BA4 @ =0x04000052
	ldrh r0, [r6]
	strh r0, [r7, 0x10]
	ldr r5, _08081BA8 @ =0x04000048
	ldrh r0, [r5]
	strh r0, [r7, 0x12]
	ldr r4, _08081BAC @ =0x0400004a
	ldrh r0, [r4]
	strh r0, [r7, 0x14]
	ldrh r1, [r2]
	ldr r0, _08081BB0 @ =0x0000bfff
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08081BB4 @ =gUnknown_081E29E8
	ldrh r0, [r3]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r2, _08081BB8 @ =0x0000070c
	adds r0, r2, 0
	strh r0, [r6]
	movs r0, 0x3F
	strh r0, [r5]
	movs r0, 0x1E
	strh r0, [r4]
	ldr r4, _08081BBC @ =gUnknown_03004DE0
	movs r0, 0x4
	ldrsh r1, [r7, r0]
	movs r0, 0x6
	ldrsh r2, [r7, r0]
	adds r0, r4, 0
	movs r3, 0x1
	bl sub_8081398
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r4, r2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
	ldr r2, _08081BC0 @ =gUnknown_0839ACEC
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
	movs r0, 0x1
	strh r0, [r7]
	b _08081CC6
	.align 2, 0
_08081BA0: .4byte 0x04000050
_08081BA4: .4byte 0x04000052
_08081BA8: .4byte 0x04000048
_08081BAC: .4byte 0x0400004a
_08081BB0: .4byte 0x0000bfff
_08081BB4: .4byte gUnknown_081E29E8
_08081BB8: .4byte 0x0000070c
_08081BBC: .4byte gUnknown_03004DE0
_08081BC0: .4byte gUnknown_0839ACEC
_08081BC4:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r7, 0x2]
	bl sub_808161C
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	movs r2, 0x6
	ldrsh r1, [r7, r2]
	movs r2, 0x1
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r3, 0xA0
	bl sub_8081534
	strh r4, [r7]
	b _08081CC6
_08081BF0:
	ldr r0, _08081C08 @ =sub_8081424
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081CC6
	bl EnableBothScriptContexts
	movs r0, 0x3
	strh r0, [r7]
	b _08081CC6
	.align 2, 0
_08081C08: .4byte sub_8081424
_08081C0C:
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r7, 0xA]
	movs r0, 0x4
	strh r0, [r7, 0x8]
	strh r0, [r7]
	b _08081CC6
_08081C22:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081CC6
	movs r0, 0x4
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	movs r1, 0x4
	negs r1, r1
	cmp r0, 0
	beq _08081C44
	movs r1, 0x4
_08081C44:
	movs r0, 0
	bl SetCameraPanning
	b _08081CC6
_08081C4C:
	bl InstallCameraPanAheadCallback
	movs r0, 0x8
	strh r0, [r7, 0x8]
	movs r0, 0x7
	strh r0, [r7]
	b _08081CC6
_08081C5A:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081CC6
	movs r0, 0x8
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	ldrh r0, [r7, 0xA]
	bl sub_8081658
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081CC6
	movs r0, 0x5
	strh r0, [r7]
	b _08081CC6
_08081C86:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08081CD0 @ =gWindowConfig_81E6CE4
	bl LoadFontDefaultPalette
	ldr r1, _08081CD4 @ =0x04000040
	movs r0, 0xFF
	strh r0, [r1]
	subs r1, 0x40
	ldrh r0, [r7, 0xC]
	strh r0, [r1]
	adds r1, 0x50
	ldrh r0, [r7, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x10]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r7, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x14]
	strh r0, [r1]
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081CC6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081CD0: .4byte gWindowConfig_81E6CE4
_08081CD4: .4byte 0x04000040
	thumb_func_end sub_80816A8

	thumb_func_start sub_80818A4
sub_80818A4: @ 8081CD8
	push {lr}
	ldr r0, _08081D00 @ =sub_80816A8
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08081D04 @ =0x03004b38
	adds r1, r0
	ldr r0, _08081D08 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _08081D0C
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _08081D24
	.align 2, 0
_08081D00: .4byte sub_80816A8
_08081D04: .4byte 0x03004b38
_08081D08: .4byte gScriptResult
_08081D0C:
	cmp r0, 0x1
	bne _08081D16
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _08081D24
_08081D16:
	cmp r0, 0x2
	bne _08081D1E
	movs r0, 0
	b _08081D20
_08081D1E:
	movs r0, 0x1
_08081D20:
	strh r0, [r1, 0x2]
	movs r0, 0x78
_08081D24:
	strh r0, [r1, 0x4]
	movs r0, 0x50
	strh r0, [r1, 0x6]
	pop {r0}
	bx r0
	thumb_func_end sub_80818A4

	thumb_func_start sub_80818FC
sub_80818FC: @ 8081D30
	push {lr}
	ldr r0, _08081D50 @ =sub_80816A8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081D54 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08081D50: .4byte sub_80816A8
_08081D54: .4byte gTasks
	thumb_func_end sub_80818FC

	thumb_func_start sub_8081924
sub_8081924: @ 8081D58
	push {lr}
	bl sub_8054044
	ldr r0, _08081D6C @ =task50_0807F0C8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081D6C: .4byte task50_0807F0C8
	thumb_func_end sub_8081924

	thumb_func_start task50_0807F0C8
task50_0807F0C8: @ 8081D70
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081D8C
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08081D8C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807F0C8

	.align 2, 0 @ Don't pad with nop.
