	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start write_word_to_mem
write_word_to_mem: @ 8052D00
	strb r0, [r1]
	lsrs r2, r0, 8
	strb r2, [r1, 0x1]
	lsrs r2, r0, 16
	strb r2, [r1, 0x2]
	lsrs r0, 24
	strb r0, [r1, 0x3]
	bx lr
	thumb_func_end write_word_to_mem

	thumb_func_start sub_8052D10
sub_8052D10: @ 8052D10
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	movs r2, 0
_08052D18:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08052D18
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8052D10

	thumb_func_start set_player_trainer_id
set_player_trainer_id: @ 8052D2C
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	ldr r1, _08052D50 @ =0x02024eae
	adds r0, r4, 0
	bl write_word_to_mem
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052D50: .4byte 0x02024eae
	thumb_func_end set_player_trainer_id

	thumb_func_start SetDefaultOptions
SetDefaultOptions: @ 8052D54
	ldr r2, _08052D74 @ =gSaveBlock2
	movs r0, 0x1
	strb r0, [r2, 0x14]
	ldrb r1, [r2, 0x15]
	subs r0, 0x3
	ands r0, r1
	movs r1, 0x3
	negs r1, r1
	ands r0, r1
	subs r1, 0x2
	ands r0, r1
	subs r1, 0x4
	ands r0, r1
	strb r0, [r2, 0x15]
	bx lr
	.align 2, 0
_08052D74: .4byte gSaveBlock2
	thumb_func_end SetDefaultOptions

	thumb_func_start sub_8052D78
sub_8052D78: @ 8052D78
	push {r4,lr}
	ldr r0, _08052DA0 @ =gUnknown_03005CE8
	movs r1, 0
	strb r1, [r0]
	ldr r4, _08052DA4 @ =0x02024ecc
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x34
	bl memset
	adds r4, 0x34
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x34
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052DA0: .4byte gUnknown_03005CE8
_08052DA4: .4byte 0x02024ecc
	thumb_func_end sub_8052D78

	thumb_func_start sub_8052DA8
sub_8052DA8: @ 8052DA8
	push {r4-r7,lr}
	bl sub_80B2D1C
	ldr r0, _08052DD8 @ =gSaveBlock1
	ldr r4, _08052DDC @ =gUnknown_08216604
	ldr r1, _08052DE0 @ =0x00002efc
	adds r3, r0, r1
	movs r2, 0x4
_08052DB8:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	adds r3, 0x20
	subs r2, 0x1
	cmp r2, 0
	bge _08052DB8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052DD8: .4byte gSaveBlock1
_08052DDC: .4byte gUnknown_08216604
_08052DE0: .4byte 0x00002efc
	thumb_func_end sub_8052DA8

	thumb_func_start sub_8052DE4
sub_8052DE4: @ 8052DE4
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _08052DFC @ =0x02024f4c
	ldr r2, _08052E00 @ =0x050001fa
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08052DFC: .4byte 0x02024f4c
_08052E00: .4byte 0x050001fa
	thumb_func_end sub_8052DE4

	thumb_func_start sub_8052E04
sub_8052E04: @ 8052E04
	push {lr}
	sub sp, 0x4
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	movs r0, 0x19
	movs r1, 0x28
	adds r2, r3, 0
	bl warp1_set
	bl warp_in
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_8052E04

	thumb_func_start ClearSav2
ClearSav2: @ 8052E24
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08052E44 @ =gSaveBlock2
	ldr r2, _08052E48 @ =0x01000448
	mov r0, sp
	bl CpuSet
	bl SetDefaultOptions
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08052E44: .4byte gSaveBlock2
_08052E48: .4byte 0x01000448
	thumb_func_end ClearSav2

	thumb_func_start sub_8052E4C
sub_8052E4C: @ 8052E4C
	push {lr}
	ldr r1, _08052E68 @ =gUnknown_020297EC
	movs r0, 0
	strb r0, [r1]
	bl sub_808C0A0
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	bl sub_80A3684
	pop {r0}
	bx r0
	.align 2, 0
_08052E68: .4byte gUnknown_020297EC
	thumb_func_end sub_8052E4C

	thumb_func_start NewGameInitData
NewGameInitData: @ 8052E6C
	push {r4,r5,lr}
	ldr r0, _08052F3C @ =gSaveFileStatus
	ldrh r0, [r0]
	cmp r0, 0
	beq _08052E7A
	cmp r0, 0x2
	bne _08052E7E
_08052E7A:
	bl RtcReset
_08052E7E:
	ldr r1, _08052F40 @ =gUnknown_020297EC
	movs r0, 0x1
	strb r0, [r1]
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	bl sub_808C02C
	bl sub_8052DE4
	ldr r4, _08052F44 @ =gSaveBlock1
	movs r2, 0xEB
	lsls r2, 6
	adds r0, r4, 0
	movs r1, 0
	bl memset
	bl sub_80A2B18
	ldr r0, _08052F48 @ =gSaveBlock2
	movs r5, 0
	strb r5, [r0, 0x9]
	bl set_player_trainer_id
	bl PlayTimeCounter_Reset
	bl sub_8052D78
	bl sub_8069030
	bl sub_80BD7A8
	bl sub_80BDAB4
	bl sub_80BB5B4
	bl sub_80B4A90
	movs r0, 0x92
	lsls r0, 3
	adds r1, r4, r0
	ldr r0, _08052F4C @ =0x00000bb8
	str r0, [r1]
	bl sub_80AB1B0
	bl sub_80530AC
	bl sub_8052DA8
	bl InitLinkBattleRecords
	bl InitShroomishSizeRecord
	bl InitBarboachSizeRecord
	ldr r0, _08052F50 @ =gPlayerPartyCount
	strb r5, [r0]
	bl ZeroPlayerPartyMons
	bl sub_80961D8
	bl sub_81341F8
	bl sub_813420C
	ldr r0, _08052F54 @ =0x00000496
	adds r4, r0
	strh r5, [r4]
	bl sub_80A3714
	bl NewGameInitPCItems
	bl sub_810C994
	bl sub_8133F80
	bl sub_80E6764
	bl sub_80F7AA4
	bl sub_80FA17C
	bl sub_810FA54
	bl sub_8145A78
	bl sub_8052E04
	ldr r0, _08052F58 @ =gUnknown_0819FA81
	bl ScriptContext2_RunNewScript
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F3C: .4byte gSaveFileStatus
_08052F40: .4byte gUnknown_020297EC
_08052F44: .4byte gSaveBlock1
_08052F48: .4byte gSaveBlock2
_08052F4C: .4byte 0x00000bb8
_08052F50: .4byte gPlayerPartyCount
_08052F54: .4byte 0x00000496
_08052F58: .4byte gUnknown_0819FA81
	thumb_func_end NewGameInitData

	.align 2, 0 @ Don't pad with nop.
