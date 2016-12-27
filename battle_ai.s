	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start BattleAICmd_if_status_in_party
BattleAICmd_if_status_in_party: @ 8108D70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08108D88
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	cmp r1, 0x1
	bne _08108DB0
	ldr r1, _08108D8C
	b _08108DB2
	.align 2, 0
_08108D88: .4byte gAIScriptPtr
_08108D8C: .4byte gEnemyParty
_08108D90:
	ldr r3, _08108DAC
	ldr r2, [r3]
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108E1E
	.align 2, 0
_08108DAC: .4byte gAIScriptPtr
_08108DB0:
	ldr r1, _08108E2C
_08108DB2:
	mov r9, r1
	ldr r1, [r0]
	ldrb r7, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r7, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r7, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r7, r0
	movs r0, 0
	mov r8, r0
	movs r1, 0xCE
	lsls r1, 1
	mov r10, r1
_08108DD4:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r9
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	cmp r5, 0
	beq _08108E0C
	cmp r5, r10
	beq _08108E0C
	cmp r6, 0
	beq _08108E0C
	cmp r0, r7
	beq _08108D90
_08108E0C:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _08108DD4
	ldr r1, _08108E30
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_08108E1E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108E2C: .4byte gPlayerParty
_08108E30: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_status_in_party

	thumb_func_start BattleAICmd_if_status_not_in_party
BattleAICmd_if_status_not_in_party: @ 8108E34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08108E50
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _08108E58
	ldr r0, _08108E54
	mov r10, r0
	b _08108E5C
	.align 2, 0
_08108E50: .4byte gAIScriptPtr
_08108E54: .4byte gEnemyParty
_08108E58:
	ldr r1, _08108EF0
	mov r10, r1
_08108E5C:
	ldr r1, [r2]
	ldrb r7, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r7, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r7, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r7, r0
	movs r0, 0
	mov r8, r0
	mov r9, r2
_08108E78:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	cmp r5, 0
	beq _08108EBC
	movs r1, 0xCE
	lsls r1, 1
	cmp r5, r1
	beq _08108EBC
	cmp r6, 0
	beq _08108EBC
	cmp r0, r7
	bne _08108EBC
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_08108EBC:
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _08108E78
	ldr r3, _08108EF4
	ldr r2, [r3]
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08108EF0: .4byte gPlayerParty
_08108EF4: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_status_not_in_party

	thumb_func_start BattleAICmd_unk_36
BattleAICmd_unk_36: @ 8108EF8
	push {lr}
	ldr r2, _08108F48
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08108F0C
	ldr r1, _08108F4C
	movs r0, 0x1
	str r0, [r1, 0x8]
_08108F0C:
	ldrh r2, [r2]
	movs r0, 0x18
	ands r0, r2
	adds r3, r2, 0
	cmp r0, 0
	beq _08108F1E
	ldr r1, _08108F4C
	movs r0, 0x2
	str r0, [r1, 0x8]
_08108F1E:
	movs r0, 0x60
	ands r0, r3
	cmp r0, 0
	beq _08108F2C
	ldr r1, _08108F4C
	movs r0, 0
	str r0, [r1, 0x8]
_08108F2C:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08108F3A
	ldr r1, _08108F4C
	movs r0, 0x3
	str r0, [r1, 0x8]
_08108F3A:
	ldr r1, _08108F50
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08108F48: .4byte word_2024DB8
_08108F4C: .4byte 0x02016800
_08108F50: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_unk_36

	thumb_func_start BattleAICmd_if_effect
BattleAICmd_if_effect: @ 8108F54
	push {lr}
	ldr r2, _08108F88
	ldr r0, _08108F8C
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r3, _08108F90
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	bne _08108F94
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108F98
	.align 2, 0
_08108F88: .4byte gBattleMoves
_08108F8C: .4byte 0x02016800
_08108F90: .4byte gAIScriptPtr
_08108F94:
	adds r0, r2, 0x6
	str r0, [r3]
_08108F98:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_effect

	thumb_func_start BattleAICmd_if_not_effect
BattleAICmd_if_not_effect: @ 8108F9C
	push {lr}
	ldr r2, _08108FD0
	ldr r0, _08108FD4
	ldrh r1, [r0, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r3, _08108FD8
	ldr r2, [r3]
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1]
	cmp r0, r1
	beq _08108FDC
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08108FE0
	.align 2, 0
_08108FD0: .4byte gBattleMoves
_08108FD4: .4byte 0x02016800
_08108FD8: .4byte gAIScriptPtr
_08108FDC:
	adds r0, r2, 0x6
	str r0, [r3]
_08108FE0:
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_not_effect

	thumb_func_start BattleAICmd_if_stat_level_less_than
BattleAICmd_if_stat_level_less_than: @ 8108FE4
	push {r4,lr}
	ldr r0, _08108FF8
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109000
	ldr r0, _08108FFC
	b _08109002
	.align 2, 0
_08108FF8: .4byte gAIScriptPtr
_08108FFC: .4byte gUnknown_02024C07
_08109000:
	ldr r0, _08109038
_08109002:
	ldrb r3, [r0]
	ldr r1, _0810903C
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bge _08109040
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08109046
	.align 2, 0
_08109038: .4byte gUnknown_02024C08
_0810903C: .4byte gBattleMons
_08109040:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_08109046:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_less_than

	thumb_func_start BattleAICmd_if_stat_level_more_than
BattleAICmd_if_stat_level_more_than: @ 810904C
	push {r4,lr}
	ldr r0, _08109060
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109068
	ldr r0, _08109064
	b _0810906A
	.align 2, 0
_08109060: .4byte gAIScriptPtr
_08109064: .4byte gUnknown_02024C07
_08109068:
	ldr r0, _081090A0
_0810906A:
	ldrb r3, [r0]
	ldr r1, _081090A4
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	ble _081090A8
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081090AE
	.align 2, 0
_081090A0: .4byte gUnknown_02024C08
_081090A4: .4byte gBattleMons
_081090A8:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_081090AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_more_than

	thumb_func_start BattleAICmd_if_stat_level_equal
BattleAICmd_if_stat_level_equal: @ 81090B4
	push {r4,lr}
	ldr r0, _081090C8
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _081090D0
	ldr r0, _081090CC
	b _081090D2
	.align 2, 0
_081090C8: .4byte gAIScriptPtr
_081090CC: .4byte gUnknown_02024C07
_081090D0:
	ldr r0, _08109108
_081090D2:
	ldrb r3, [r0]
	ldr r1, _0810910C
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bne _08109110
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08109116
	.align 2, 0
_08109108: .4byte gUnknown_02024C08
_0810910C: .4byte gBattleMons
_08109110:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_08109116:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_equal

	thumb_func_start BattleAICmd_if_stat_level_not_equal
BattleAICmd_if_stat_level_not_equal: @ 810911C
	push {r4,lr}
	ldr r0, _08109130
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109138
	ldr r0, _08109134
	b _0810913A
	.align 2, 0
_08109130: .4byte gAIScriptPtr
_08109134: .4byte gUnknown_02024C07
_08109138:
	ldr r0, _08109170
_0810913A:
	ldrb r3, [r0]
	ldr r1, _08109174
	ldr r2, [r4]
	movs r0, 0x58
	muls r0, r3
	ldrb r3, [r2, 0x2]
	adds r0, r3
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	beq _08109178
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0810917E
	.align 2, 0
_08109170: .4byte gUnknown_02024C08
_08109174: .4byte gBattleMons
_08109178:
	adds r0, r2, 0
	adds r0, 0x8
	str r0, [r4]
_0810917E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_stat_level_not_equal

	thumb_func_start BattleAICmd_if_can_faint
BattleAICmd_if_can_faint: @ 8109184
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _08109228
	ldr r6, _0810922C
	ldrh r1, [r6, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bls _08109258
	ldr r0, _08109230
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08109234
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, 0x3
	adds r0, r6, r2
	movs r2, 0x1
	mov r8, r2
	mov r2, r8
	strb r2, [r0]
	ldr r0, _08109238
	strb r1, [r0]
	ldr r0, _0810923C
	strb r2, [r0]
	ldr r5, _08109240
	ldrh r0, [r6, 0x2]
	strh r0, [r5]
	ldr r4, _08109244
	ldrb r0, [r4]
	ldr r7, _08109248
	ldrb r1, [r7]
	bl sub_801CAF8
	ldrh r0, [r5]
	ldrb r1, [r4]
	ldrb r2, [r7]
	bl move_effectiveness_something
	ldr r4, _0810924C
	adds r0, r6, 0
	adds r0, 0x18
	ldrb r6, [r6, 0x1]
	adds r0, r6
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _081091FA
	mov r0, r8
	str r0, [r4]
_081091FA:
	ldr r2, _08109250
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x28]
	ldr r0, [r4]
	cmp r1, r0
	bgt _08109258
	ldr r3, _08109254
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08109260
	.align 2, 0
_08109228: .4byte gBattleMoves
_0810922C: .4byte 0x02016800
_08109230: .4byte gUnknown_02024DEC
_08109234: .4byte 0xfffff81c
_08109238: .4byte gUnknown_02024C68
_0810923C: .4byte gCritMultiplier
_08109240: .4byte gUnknown_02024BE6
_08109244: .4byte gUnknown_02024C07
_08109248: .4byte gUnknown_02024C08
_0810924C: .4byte gUnknown_02024BEC
_08109250: .4byte gBattleMons
_08109254: .4byte gAIScriptPtr
_08109258:
	ldr r1, _0810926C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08109260:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810926C: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_can_faint

	thumb_func_start BattleAICmd_if_cant_faint
BattleAICmd_if_cant_faint: @ 8109270
	push {r4-r7,lr}
	ldr r2, _08109304
	ldr r7, _08109308
	ldrh r1, [r7, 0x2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bls _08109334
	ldr r0, _0810930C
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08109310
	adds r0, r7, r2
	strb r1, [r0]
	adds r2, 0x3
	adds r0, r7, r2
	movs r2, 0x1
	strb r2, [r0]
	ldr r0, _08109314
	strb r1, [r0]
	ldr r0, _08109318
	strb r2, [r0]
	ldr r6, _0810931C
	ldrh r0, [r7, 0x2]
	strh r0, [r6]
	ldr r4, _08109320
	ldrb r0, [r4]
	ldr r5, _08109324
	ldrb r1, [r5]
	bl sub_801CAF8
	ldrh r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r5]
	bl move_effectiveness_something
	ldr r4, _08109328
	adds r0, r7, 0
	adds r0, 0x18
	ldrb r7, [r7, 0x1]
	adds r0, r7
	ldrb r1, [r0]
	ldr r0, [r4]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	ldr r3, _0810932C
	ldrb r2, [r5]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r1, [r1, 0x28]
	cmp r1, r0
	ble _08109334
	ldr r3, _08109330
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0810933C
	.align 2, 0
_08109304: .4byte gBattleMoves
_08109308: .4byte 0x02016800
_0810930C: .4byte gUnknown_02024DEC
_08109310: .4byte 0xfffff81c
_08109314: .4byte gUnknown_02024C68
_08109318: .4byte gCritMultiplier
_0810931C: .4byte gUnknown_02024BE6
_08109320: .4byte gUnknown_02024C07
_08109324: .4byte gUnknown_02024C08
_08109328: .4byte gUnknown_02024BEC
_0810932C: .4byte gBattleMons
_08109330: .4byte gAIScriptPtr
_08109334:
	ldr r1, _08109344
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0810933C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109344: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_cant_faint

	thumb_func_start BattleAICmd_unk_3F
BattleAICmd_unk_3F: @ 8109348
	push {r4-r7,lr}
	ldr r1, _08109364
	ldr r0, [r1]
	adds r6, r0, 0x2
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08109370
	cmp r0, 0x1
	bgt _08109368
	cmp r0, 0
	beq _081093B4
	b _08109414
	.align 2, 0
_08109364: .4byte gAIScriptPtr
_08109368:
	cmp r0, 0x2
	beq _081093B4
	cmp r0, 0x3
	bne _08109414
_08109370:
	movs r3, 0
	ldr r2, _081093AC
	ldr r5, _081093B0
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _081093A6
	adds r7, r5, 0
	movs r6, 0x58
	adds r5, r2, 0
	adds r2, r1, 0
_08109390:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _081093A6
	lsls r1, r3, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r1, r0
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, r2
	bne _08109390
_081093A6:
	cmp r3, 0x4
	beq _081093EA
	b _081093FC
	.align 2, 0
_081093AC: .4byte gBattleMons
_081093B0: .4byte gUnknown_02024C07
_081093B4:
	movs r3, 0
	ldr r5, _081093F4
	ldr r1, _081093F8
	ldrb r0, [r1]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r5
	ldrh r0, [r0]
	ldrh r2, [r6]
	cmp r0, r2
	beq _081093E6
	adds r6, r5, 0
	adds r5, r1, 0
_081093CE:
	adds r3, 0x1
	cmp r3, 0x7
	bgt _081093E6
	lsls r0, r3, 1
	ldrb r1, [r5]
	lsrs r1, 1
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r2
	bne _081093CE
_081093E6:
	cmp r3, 0x8
	bne _081093FC
_081093EA:
	ldr r0, [r4]
	adds r0, 0x8
	str r0, [r4]
	b _08109414
	.align 2, 0
_081093F4: .4byte 0x02016a00
_081093F8: .4byte gUnknown_02024C08
_081093FC:
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_08109414:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_unk_3F

	thumb_func_start BattleAICmd_unk_40
BattleAICmd_unk_40: @ 810941C
	push {r4-r7,lr}
	ldr r1, _08109438
	ldr r0, [r1]
	adds r6, r0, 0x2
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08109444
	cmp r0, 0x1
	bgt _0810943C
	cmp r0, 0
	beq _08109488
	b _081094E8
	.align 2, 0
_08109438: .4byte gAIScriptPtr
_0810943C:
	cmp r0, 0x2
	beq _08109488
	cmp r0, 0x3
	bne _081094E8
_08109444:
	movs r3, 0
	ldr r2, _08109480
	ldr r5, _08109484
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldrh r1, [r6]
	cmp r0, r1
	beq _0810947A
	adds r7, r5, 0
	movs r6, 0x58
	adds r5, r2, 0
	adds r2, r1, 0
_08109464:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _0810947A
	lsls r1, r3, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r1, r0
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, r2
	bne _08109464
_0810947A:
	cmp r3, 0x4
	bne _081094BE
	b _081094D0
	.align 2, 0
_08109480: .4byte gBattleMons
_08109484: .4byte gUnknown_02024C07
_08109488:
	movs r3, 0
	ldr r5, _081094C8
	ldr r1, _081094CC
	ldrb r0, [r1]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r5
	ldrh r0, [r0]
	ldrh r2, [r6]
	cmp r0, r2
	beq _081094BA
	adds r6, r5, 0
	adds r5, r1, 0
_081094A2:
	adds r3, 0x1
	cmp r3, 0x7
	bgt _081094BA
	lsls r0, r3, 1
	ldrb r1, [r5]
	lsrs r1, 1
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r2
	bne _081094A2
_081094BA:
	cmp r3, 0x8
	beq _081094D0
_081094BE:
	ldr r0, [r4]
	adds r0, 0x8
	str r0, [r4]
	b _081094E8
	.align 2, 0
_081094C8: .4byte 0x02016a00
_081094CC: .4byte gUnknown_02024C08
_081094D0:
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	ldrb r0, [r2, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_081094E8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_unk_40

	thumb_func_start BattleAICmd_if_move_effect
BattleAICmd_if_move_effect: @ 81094F0
	push {r4-r7,lr}
	ldr r1, _08109508
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08109514
	cmp r0, 0x1
	bgt _0810950C
	cmp r0, 0
	beq _08109568
	b _081095C4
	.align 2, 0
_08109508: .4byte gAIScriptPtr
_0810950C:
	cmp r0, 0x2
	beq _08109568
	cmp r0, 0x3
	bne _081095C4
_08109514:
	movs r3, 0
	ldr r1, _08109558
	ldr r0, _0810955C
	ldrb r2, [r0]
	ldr r6, _08109560
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
	ldr r5, _08109564
_08109528:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109542
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810954A
_08109542:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _08109528
_0810954A:
	cmp r3, 0x4
	bne _081095AC
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	b _081095C4
	.align 2, 0
_08109558: .4byte gBattleMons
_0810955C: .4byte gUnknown_02024C07
_08109560: .4byte gBattleMoves
_08109564: .4byte gAIScriptPtr
_08109568:
	movs r3, 0
	ldr r1, _081095CC
	ldr r0, _081095D0
	ldrb r2, [r0]
	ldr r7, _081095D4
	ldr r6, _081095D8
	ldr r5, _081095DC
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
_0810957E:
	lsls r1, r3, 1
	ldrh r0, [r2]
	cmp r0, 0
	beq _081095A4
	ldrb r0, [r5]
	lsrs r0, 1
	lsls r0, 4
	adds r0, r1, r0
	adds r0, r6
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _081095AC
_081095A4:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _0810957E
_081095AC:
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
_081095C4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081095CC: .4byte gBattleMons
_081095D0: .4byte gUnknown_02024C07
_081095D4: .4byte gBattleMoves
_081095D8: .4byte 0x02016a00
_081095DC: .4byte gUnknown_02024C08
	thumb_func_end BattleAICmd_if_move_effect

	thumb_func_start BattleAICmd_if_not_move_effect
BattleAICmd_if_not_move_effect: @ 81095E0
	push {r4-r6,lr}
	ldr r1, _081095F8
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r0, 0x1
	beq _08109604
	cmp r0, 0x1
	bgt _081095FC
	cmp r0, 0
	beq _08109668
	b _081096A0
	.align 2, 0
_081095F8: .4byte gAIScriptPtr
_081095FC:
	cmp r0, 0x2
	beq _08109668
	cmp r0, 0x3
	bne _081096A0
_08109604:
	movs r3, 0
	ldr r1, _08109658
	ldr r0, _0810965C
	ldrb r2, [r0]
	ldr r6, _08109660
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r2, r0, r1
	ldr r5, _08109664
_08109618:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109632
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r1, [r5]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810963A
_08109632:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _08109618
_0810963A:
	cmp r3, 0x4
	bne _0810969A
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081096A0
	.align 2, 0
_08109658: .4byte gBattleMons
_0810965C: .4byte gUnknown_02024C07
_08109660: .4byte gBattleMoves
_08109664: .4byte gAIScriptPtr
_08109668:
	movs r3, 0
	ldr r1, _081096A8
	ldr r0, _081096AC
	ldrb r0, [r0]
	lsrs r0, 1
	lsls r0, 4
	adds r2, r0, r1
	ldr r5, _081096B0
_08109678:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08109692
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, [r4]
	ldrb r0, [r0]
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810969A
_08109692:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _08109678
_0810969A:
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
_081096A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081096A8: .4byte 0x02016a00
_081096AC: .4byte gUnknown_02024C08
_081096B0: .4byte gBattleMoves
	thumb_func_end BattleAICmd_if_not_move_effect

	thumb_func_start BattleAICmd_if_last_move_did_damage
BattleAICmd_if_last_move_did_damage: @ 81096B4
	push {r4,r5,lr}
	ldr r0, _081096C8
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x1
	bne _081096D0
	ldr r0, _081096CC
	b _081096D2
	.align 2, 0
_081096C8: .4byte gAIScriptPtr
_081096CC: .4byte gUnknown_02024C07
_081096D0:
	ldr r0, _081096F0
_081096D2:
	ldrb r3, [r0]
	adds r4, r5, 0
	ldr r2, [r4]
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _081096F8
	ldr r0, _081096F4
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x4]
	cmp r0, 0
	beq _081096FC
	b _08109712
	.align 2, 0
_081096F0: .4byte gUnknown_02024C08
_081096F4: .4byte gUnknown_02024CA8
_081096F8:
	cmp r0, 0x1
	beq _08109702
_081096FC:
	adds r0, r2, 0x7
	str r0, [r4]
	b _08109734
_08109702:
	ldr r0, _0810972C
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	beq _08109730
_08109712:
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08109734
	.align 2, 0
_0810972C: .4byte gUnknown_02024CA8
_08109730:
	adds r0, r2, 0x7
	str r0, [r5]
_08109734:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_last_move_did_damage

	thumb_func_start BattleAICmd_if_encored
BattleAICmd_if_encored: @ 810973C
	push {r4,lr}
	ldr r4, _08109750
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	cmp r0, 0
	beq _08109754
	cmp r0, 0x1
	beq _0810977C
	b _081097B8
	.align 2, 0
_08109750: .4byte gAIScriptPtr
_08109754:
	ldr r2, _08109770
	ldr r0, _08109774
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08109778
	ldrh r0, [r0, 0x4]
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	beq _08109794
	b _081097B8
	.align 2, 0
_08109770: .4byte gUnknown_02024CA8
_08109774: .4byte gUnknown_02024A60
_08109778: .4byte 0x02016800
_0810977C:
	ldr r2, _081097AC
	ldr r0, _081097B0
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _081097B4
	ldrh r0, [r0, 0x6]
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	bne _081097B8
_08109794:
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081097BC
	.align 2, 0
_081097AC: .4byte gUnknown_02024CA8
_081097B0: .4byte gUnknown_02024A60
_081097B4: .4byte 0x02016800
_081097B8:
	adds r0, r3, 0x6
	str r0, [r4]
_081097BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_encored

	thumb_func_start BattleAICmd_unk_45
BattleAICmd_unk_45: @ 81097C4
	ldr r2, _081097D0
	ldrb r1, [r2, 0x10]
	movs r0, 0xB
	orrs r0, r1
	strb r0, [r2, 0x10]
	bx lr
	.align 2, 0
_081097D0: .4byte 0x02016800
	thumb_func_end BattleAICmd_unk_45

	thumb_func_start BattleAICmd_if_random_2
BattleAICmd_if_random_2: @ 81097D4
	push {r4,lr}
	ldr r0, _08109818
	ldr r1, _0810981C
	adds r0, r1
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08109824
	ldr r3, _08109820
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0810982C
	.align 2, 0
_08109818: .4byte 0x02000000
_0810981C: .4byte 0x00016088
_08109820: .4byte gAIScriptPtr
_08109824:
	ldr r1, _08109834
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0810982C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109834: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_random_2

	thumb_func_start BattleAICmd_unk_47
BattleAICmd_unk_47: @ 8109838
	ldr r2, _08109844
	ldrb r1, [r2, 0x10]
	movs r0, 0xD
	orrs r0, r1
	strb r0, [r2, 0x10]
	bx lr
	.align 2, 0
_08109844: .4byte 0x02016800
	thumb_func_end BattleAICmd_unk_47

	thumb_func_start BattleAICmd_get_hold_effect
BattleAICmd_get_hold_effect: @ 8109848
	push {r4,lr}
	ldr r0, _08109858
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _08109860
	ldr r0, _0810985C
	b _08109862
	.align 2, 0
_08109858: .4byte gAIScriptPtr
_0810985C: .4byte gUnknown_02024C07
_08109860:
	ldr r0, _08109888
_08109862:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08109894
	adds r0, r4, 0
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	ldr r2, _0810988C
	ldr r3, _08109890
	adds r0, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	str r0, [r2, 0x8]
	b _081098AA
	.align 2, 0
_08109888: .4byte gUnknown_02024C08
_0810988C: .4byte 0x02016800
_08109890: .4byte 0x00000222
_08109894:
	ldr r1, _081098B8
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffect
	ldr r1, _081098BC
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x8]
_081098AA:
	ldr r1, _081098C0
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081098B8: .4byte gBattleMons
_081098BC: .4byte 0x02016800
_081098C0: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_get_hold_effect

	thumb_func_start BattleAICmd_get_gender
BattleAICmd_get_gender: @ 81098C4
	push {lr}
	ldr r0, _081098D4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0x1
	bne _081098DC
	ldr r0, _081098D8
	b _081098DE
	.align 2, 0
_081098D4: .4byte gAIScriptPtr
_081098D8: .4byte gUnknown_02024C07
_081098DC:
	ldr r0, _08109908
_081098DE:
	ldrb r1, [r0]
	ldr r2, _0810990C
	movs r0, 0x58
	muls r1, r0
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, 0x48
	adds r1, r2
	ldr r1, [r1]
	bl GetGenderFromSpeciesAndPersonality
	ldr r1, _08109910
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x8]
	ldr r1, _08109914
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08109908: .4byte gUnknown_02024C08
_0810990C: .4byte gBattleMons
_08109910: .4byte 0x02016800
_08109914: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_get_gender

	thumb_func_start BattleAICmd_is_first_turn
BattleAICmd_is_first_turn: @ 8109918
	push {r4,lr}
	ldr r0, _0810992C
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109934
	ldr r0, _08109930
	b _08109936
	.align 2, 0
_0810992C: .4byte gAIScriptPtr
_08109930: .4byte gUnknown_02024C07
_08109934:
	ldr r0, _08109954
_08109936:
	ldrb r3, [r0]
	ldr r2, _08109958
	ldr r1, _0810995C
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109954: .4byte gUnknown_02024C08
_08109958: .4byte 0x02016800
_0810995C: .4byte gUnknown_02024CA8
	thumb_func_end BattleAICmd_is_first_turn

	thumb_func_start BattleAICmd_get_stockpile_count
BattleAICmd_get_stockpile_count: @ 8109960
	push {r4,lr}
	ldr r0, _08109974
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _0810997C
	ldr r0, _08109978
	b _0810997E
	.align 2, 0
_08109974: .4byte gAIScriptPtr
_08109978: .4byte gUnknown_02024C07
_0810997C:
	ldr r0, _0810999C
_0810997E:
	ldrb r3, [r0]
	ldr r2, _081099A0
	ldr r1, _081099A4
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x9]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810999C: .4byte gUnknown_02024C08
_081099A0: .4byte 0x02016800
_081099A4: .4byte gUnknown_02024CA8
	thumb_func_end BattleAICmd_get_stockpile_count

	thumb_func_start BattleAICmd_unk_4C
BattleAICmd_unk_4C: @ 81099A8
	ldr r2, _081099C0
	ldr r0, _081099C4
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r1, _081099C8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081099C0: .4byte 0x02016800
_081099C4: .4byte gUnknown_020239F8
_081099C8: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_unk_4C

	thumb_func_start BattleAICmd_get_item
BattleAICmd_get_item: @ 81099CC
	push {lr}
	ldr r0, _081099E0
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _081099E8
	ldr r0, _081099E4
	b _081099EA
	.align 2, 0
_081099E0: .4byte gAIScriptPtr
_081099E4: .4byte gUnknown_02024C07
_081099E8:
	ldr r0, _08109A04
_081099EA:
	ldrb r0, [r0]
	ldr r1, _08109A08
	lsls r0, 1
	adds r0, r1
	ldr r3, _08109A0C
	adds r0, r3
	ldrb r0, [r0]
	str r0, [r1, 0x8]
	ldr r0, [r2]
	adds r0, 0x2
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08109A04: .4byte gUnknown_02024C08
_08109A08: .4byte 0x02016800
_08109A0C: .4byte 0xfffff8cc
	thumb_func_end BattleAICmd_get_item

	thumb_func_start BattleAICmd_unk_4E
BattleAICmd_unk_4E: @ 8109A10
	ldr r3, _08109A2C
	ldr r2, _08109A30
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	str r0, [r3, 0x8]
	ldr r1, _08109A34
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08109A2C: .4byte 0x02016800
_08109A30: .4byte gBattleMoves
_08109A34: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_unk_4E

	thumb_func_start BattleAICmd_unk_4F
BattleAICmd_unk_4F: @ 8109A38
	ldr r3, _08109A54
	ldr r2, _08109A58
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	str r0, [r3, 0x8]
	ldr r1, _08109A5C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08109A54: .4byte 0x02016800
_08109A58: .4byte gBattleMoves
_08109A5C: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_unk_4F

	thumb_func_start BattleAICmd_unk_50
BattleAICmd_unk_50: @ 8109A60
	ldr r3, _08109A7C
	ldr r2, _08109A80
	ldr r1, [r3, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	str r0, [r3, 0x8]
	ldr r1, _08109A84
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08109A7C: .4byte 0x02016800
_08109A80: .4byte gBattleMoves
_08109A84: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_unk_50

	thumb_func_start BattleAICmd_get_protect_count
BattleAICmd_get_protect_count: @ 8109A88
	push {r4,lr}
	ldr r0, _08109A9C
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0x1
	bne _08109AA4
	ldr r0, _08109AA0
	b _08109AA6
	.align 2, 0
_08109A9C: .4byte gAIScriptPtr
_08109AA0: .4byte gUnknown_02024C07
_08109AA4:
	ldr r0, _08109AC4
_08109AA6:
	ldrb r3, [r0]
	ldr r2, _08109AC8
	ldr r1, _08109ACC
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	str r0, [r2, 0x8]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109AC4: .4byte gUnknown_02024C08
_08109AC8: .4byte 0x02016800
_08109ACC: .4byte gUnknown_02024CA8
	thumb_func_end BattleAICmd_get_protect_count

	thumb_func_start BattleAICmd_unk_52
BattleAICmd_unk_52: @ 8109AD0
	bx lr
	thumb_func_end BattleAICmd_unk_52

	thumb_func_start BattleAICmd_unk_53
BattleAICmd_unk_53: @ 8109AD4
	bx lr
	thumb_func_end BattleAICmd_unk_53

	thumb_func_start BattleAICmd_unk_54
BattleAICmd_unk_54: @ 8109AD8
	bx lr
	thumb_func_end BattleAICmd_unk_54

	thumb_func_start BattleAICmd_unk_55
BattleAICmd_unk_55: @ 8109ADC
	bx lr
	thumb_func_end BattleAICmd_unk_55

	thumb_func_start BattleAICmd_unk_56
BattleAICmd_unk_56: @ 8109AE0
	bx lr
	thumb_func_end BattleAICmd_unk_56

	thumb_func_start BattleAICmd_unk_57
BattleAICmd_unk_57: @ 8109AE4
	bx lr
	thumb_func_end BattleAICmd_unk_57

	thumb_func_start BattleAICmd_call
BattleAICmd_call: @ 8109AE8
	push {r4,lr}
	ldr r4, _08109B14
	ldr r0, [r4]
	adds r0, 0x5
	bl sub_81098C4
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109B14: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_call

	thumb_func_start BattleAICmd_jump
BattleAICmd_jump: @ 8109B18
	ldr r3, _08109B34
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08109B34: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_jump

	thumb_func_start BattleAICmd_unk_5A
BattleAICmd_unk_5A: @ 8109B38
	push {lr}
	bl sub_8109908
	lsls r0, 24
	cmp r0, 0
	bne _08109B4E
	ldr r2, _08109B54
	ldrb r1, [r2, 0x10]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x10]
_08109B4E:
	pop {r0}
	bx r0
	.align 2, 0
_08109B54: .4byte 0x02016800
	thumb_func_end BattleAICmd_unk_5A

	thumb_func_start BattleAICmd_if_level_cond
BattleAICmd_if_level_cond: @ 8109B58
	push {r4,r5,lr}
	ldr r5, _08109B70
	ldr r4, [r5]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _08109BAC
	cmp r0, 0x1
	bgt _08109B74
	cmp r0, 0
	beq _08109B7A
	b _08109C28
	.align 2, 0
_08109B70: .4byte gAIScriptPtr
_08109B74:
	cmp r0, 0x2
	beq _08109BDC
	b _08109C28
_08109B7A:
	ldr r3, _08109BA0
	ldr r0, _08109BA4
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _08109BA8
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bhi _08109BFE
	b _08109C24
	.align 2, 0
_08109BA0: .4byte gBattleMons
_08109BA4: .4byte gUnknown_02024C07
_08109BA8: .4byte gUnknown_02024C08
_08109BAC:
	ldr r3, _08109BD0
	ldr r0, _08109BD4
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _08109BD8
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08109BFE
	b _08109C24
	.align 2, 0
_08109BD0: .4byte gBattleMons
_08109BD4: .4byte gUnknown_02024C07
_08109BD8: .4byte gUnknown_02024C08
_08109BDC:
	ldr r3, _08109C18
	ldr r0, _08109C1C
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	adds r1, r3
	adds r1, 0x2A
	ldr r0, _08109C20
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08109C24
_08109BFE:
	ldrb r1, [r4, 0x2]
	ldrb r0, [r4, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r5]
	b _08109C28
	.align 2, 0
_08109C18: .4byte gBattleMons
_08109C1C: .4byte gUnknown_02024C07
_08109C20: .4byte gUnknown_02024C08
_08109C24:
	adds r0, r4, 0x6
	str r0, [r5]
_08109C28:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end BattleAICmd_if_level_cond

	thumb_func_start BattleAICmd_if_taunted
BattleAICmd_if_taunted: @ 8109C30
	push {lr}
	ldr r2, _08109C64
	ldr r0, _08109C68
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08109C70
	ldr r3, _08109C6C
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08109C78
	.align 2, 0
_08109C64: .4byte gUnknown_02024CA8
_08109C68: .4byte gUnknown_02024C08
_08109C6C: .4byte gAIScriptPtr
_08109C70:
	ldr r1, _08109C7C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08109C78:
	pop {r0}
	bx r0
	.align 2, 0
_08109C7C: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_taunted

	thumb_func_start BattleAICmd_if_not_taunted
BattleAICmd_if_not_taunted: @ 8109C80
	push {lr}
	ldr r2, _08109CB4
	ldr r0, _08109CB8
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	bne _08109CC0
	ldr r3, _08109CBC
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08109CC8
	.align 2, 0
_08109CB4: .4byte gUnknown_02024CA8
_08109CB8: .4byte gUnknown_02024C08
_08109CBC: .4byte gAIScriptPtr
_08109CC0:
	ldr r1, _08109CCC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08109CC8:
	pop {r0}
	bx r0
	.align 2, 0
_08109CCC: .4byte gAIScriptPtr
	thumb_func_end BattleAICmd_if_not_taunted

	thumb_func_start sub_81098C4
sub_81098C4: @ 8109CD0
	push {r4,lr}
	ldr r4, _08109CEC
	adds r3, r4, 0
	adds r3, 0x20
	ldrb r1, [r3]
	adds r2, r1, 0x1
	strb r2, [r3]
	lsls r1, 24
	lsrs r1, 22
	adds r1, r4
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109CEC: .4byte 0x02016c00
	thumb_func_end sub_81098C4

	thumb_func_start unref_sub_81098E4
unref_sub_81098E4: @ 8109CF0
	ldr r3, _08109D0C
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r1, _08109D10
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08109D0C: .4byte 0x02016c00
_08109D10: .4byte gAIScriptPtr
	thumb_func_end unref_sub_81098E4

	thumb_func_start sub_8109908
sub_8109908: @ 8109D14
	push {lr}
	ldr r3, _08109D28
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0
	bne _08109D2C
	movs r0, 0
	b _08109D3E
	.align 2, 0
_08109D28: .4byte 0x02016c00
_08109D2C:
	subs r0, 0x1
	strb r0, [r2]
	ldr r1, _08109D44
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r1]
	movs r0, 0x1
_08109D3E:
	pop {r1}
	bx r1
	.align 2, 0
_08109D44: .4byte gAIScriptPtr
	thumb_func_end sub_8109908

	.align 2, 0 @ Don't pad with nop.
