	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CalculateBaseDamage
CalculateBaseDamage: @ 803BC00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	adds r7, r0, 0
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, [sp, 0x4C]
	ldr r1, [sp, 0x50]
	ldr r2, [sp, 0x54]
	ldr r4, [sp, 0x58]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0
	cmp r3, 0
	bne _0803BC54
	ldr r2, _0803BC4C @ =gBattleMovePower
	ldr r1, _0803BC50 @ =gBattleMoves
	ldr r3, [sp, 0x8]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2]
	b _0803BC58
	.align 2, 0
_0803BC4C: .4byte gBattleMovePower
_0803BC50: .4byte gBattleMoves
_0803BC54:
	ldr r0, _0803BC70 @ =gBattleMovePower
	strh r3, [r0]
_0803BC58:
	cmp r6, 0
	bne _0803BC78
	ldr r1, _0803BC74 @ =gBattleMoves
	ldr r6, [sp, 0x8]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	mov r9, r0
	b _0803BC82
	.align 2, 0
_0803BC70: .4byte gBattleMovePower
_0803BC74: .4byte gBattleMoves
_0803BC78:
	movs r0, 0x3F
	mov r9, r0
	mov r1, r9
	ands r1, r6
	mov r9, r1
_0803BC82:
	ldrh r6, [r7, 0x2]
	ldr r2, [sp, 0x4]
	ldrh r2, [r2, 0x4]
	str r2, [sp, 0x14]
	ldrh r3, [r7, 0x8]
	mov r8, r3
	ldr r0, [sp, 0x4]
	ldrh r0, [r0, 0xA]
	str r0, [sp, 0x18]
	ldrh r0, [r7, 0x2E]
	cmp r0, 0xAF
	bne _0803BCB4
	ldr r1, _0803BCB0 @ =gEnigmaBerries
	ldr r2, [sp, 0x10]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	mov r10, r3
	ldrb r0, [r0, 0x1A]
	b _0803BCCA
	.align 2, 0
_0803BCB0: .4byte gEnigmaBerries
_0803BCB4:
	ldrh r0, [r7, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrh r0, [r7, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0803BCCA:
	str r0, [sp, 0x20]
	ldr r1, [sp, 0x4]
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0803BCFA
	ldr r1, _0803BCE4 @ =gEnigmaBerries
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x7]
	str r0, [sp, 0x1C]
	b _0803BD10
	.align 2, 0
_0803BCE4: .4byte gEnigmaBerries
_0803BCE8:
	ldr r0, [sp, 0x20]
	adds r0, 0x64
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	b _0803BEB0
_0803BCFA:
	ldr r2, [sp, 0x4]
	ldrh r0, [r2, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
	ldr r3, [sp, 0x4]
	ldrh r0, [r3, 0x2E]
	bl ItemId_GetHoldEffectParam
_0803BD10:
	adds r0, r7, 0
	adds r0, 0x20
	ldrb r1, [r0]
	str r0, [sp, 0x24]
	cmp r1, 0x25
	beq _0803BD20
	cmp r1, 0x4A
	bne _0803BD24
_0803BD20:
	lsls r0, r6, 17
	lsrs r6, r0, 16
_0803BD24:
	ldr r0, _0803BE8C @ =gUnknown_020239F8
	ldrh r1, [r0]
	ldr r0, _0803BE90 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	beq _0803BD32
	b _0803BE4C
_0803BD32:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BD6C
	ldr r0, _0803BE94 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BD6C
	ldr r0, _0803BE98 @ =0x00000807
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BD6C
	ldr r0, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BD6C
	movs r0, 0x6E
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BD6C:
	ldr r0, _0803BE8C @ =gUnknown_020239F8
	ldrh r1, [r0]
	ldr r0, _0803BE90 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0803BE4C
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BDB6
	ldr r0, _0803BE94 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BDB6
	ldr r0, _0803BE9C @ =0x0000080b
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BDB6
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BDB6
	movs r0, 0x6E
	ldr r1, [sp, 0x14]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803BDB6:
	ldr r0, _0803BE8C @ =gUnknown_020239F8
	ldrh r1, [r0]
	ldr r0, _0803BE90 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0803BE4C
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BE02
	ldr r0, _0803BE94 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BE02
	ldr r0, _0803BEA0 @ =0x0000080d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BE02
	ldr r0, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BE02
	movs r0, 0x6E
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BE02:
	ldr r0, _0803BE8C @ =gUnknown_020239F8
	ldrh r1, [r0]
	ldr r0, _0803BE90 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _0803BE4C
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BE4C
	ldr r0, _0803BE94 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BE4C
	ldr r0, _0803BEA0 @ =0x0000080d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BE4C
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BE4C
	movs r0, 0x6E
	ldr r3, [sp, 0x18]
	muls r0, r3
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803BE4C:
	movs r2, 0
	ldr r4, _0803BEA4 @ =gHoldEffectToType
	ldr r0, [sp, 0x4]
	adds r0, 0x20
	str r0, [sp, 0x28]
	adds r3, r4, 0
_0803BE58:
	lsls r1, r2, 1
	ldrb r0, [r3]
	cmp r10, r0
	bne _0803BEA8
	adds r0, r4, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r9, r0
	bne _0803BEA8
	mov r1, r9
	cmp r1, 0x8
	bhi _0803BE72
	b _0803BCE8
_0803BE72:
	ldr r0, [sp, 0x20]
	adds r0, 0x64
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _0803BEB0
	.align 2, 0
_0803BE8C: .4byte gUnknown_020239F8
_0803BE90: .4byte 0x00000902
_0803BE94: .4byte gTrainerBattleOpponent
_0803BE98: .4byte 0x00000807
_0803BE9C: .4byte 0x0000080b
_0803BEA0: .4byte 0x0000080d
_0803BEA4: .4byte gHoldEffectToType
_0803BEA8:
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x10
	bls _0803BE58
_0803BEB0:
	mov r3, r10
	cmp r3, 0x1D
	bne _0803BEC4
	movs r0, 0x96
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BEC4:
	mov r0, r10
	cmp r0, 0x22
	bne _0803BEFC
	ldr r0, _0803C1B0 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0803BEFC
	ldr r1, _0803C1B4 @ =0xfffffe69
	adds r0, r1, 0
	ldrh r2, [r7]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803BEFC
	movs r0, 0x96
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BEFC:
	ldr r0, [sp, 0x1C]
	cmp r0, 0x22
	bne _0803BF34
	ldr r0, _0803C1B0 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0803BF34
	ldr r1, _0803C1B4 @ =0xfffffe69
	adds r0, r1, 0
	ldr r2, [sp, 0x4]
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803BF34
	movs r0, 0x96
	ldr r3, [sp, 0x18]
	muls r0, r3
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803BF34:
	mov r0, r10
	cmp r0, 0x23
	bne _0803BF4A
	ldrh r1, [r7]
	ldr r0, _0803C1B8 @ =0x00000175
	cmp r1, r0
	bne _0803BF4A
	mov r1, r8
	lsls r0, r1, 17
	lsrs r0, 16
	mov r8, r0
_0803BF4A:
	ldr r2, [sp, 0x1C]
	cmp r2, 0x24
	bne _0803BF62
	ldr r3, [sp, 0x4]
	ldrh r1, [r3]
	ldr r0, _0803C1B8 @ =0x00000175
	cmp r1, r0
	bne _0803BF62
	ldr r1, [sp, 0x18]
	lsls r0, r1, 17
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803BF62:
	mov r2, r10
	cmp r2, 0x2D
	bne _0803BF76
	ldrh r0, [r7]
	cmp r0, 0x19
	bne _0803BF76
	mov r3, r8
	lsls r0, r3, 17
	lsrs r0, 16
	mov r8, r0
_0803BF76:
	ldr r0, [sp, 0x1C]
	cmp r0, 0x40
	bne _0803BF8C
	ldr r1, [sp, 0x4]
	ldrh r0, [r1]
	cmp r0, 0x84
	bne _0803BF8C
	ldr r2, [sp, 0x14]
	lsls r0, r2, 17
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803BF8C:
	mov r3, r10
	cmp r3, 0x41
	bne _0803BFA2
	ldrh r0, [r7]
	subs r0, 0x68
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803BFA2
	lsls r0, r6, 17
	lsrs r6, r0, 16
_0803BFA2:
	ldr r1, [sp, 0x28]
	ldrb r0, [r1]
	cmp r0, 0x2F
	bne _0803BFBA
	mov r2, r9
	cmp r2, 0xA
	beq _0803BFB4
	cmp r2, 0xF
	bne _0803BFBA
_0803BFB4:
	mov r3, r8
	lsrs r3, 1
	mov r8, r3
_0803BFBA:
	ldr r0, [sp, 0x24]
	ldrb r4, [r0]
	cmp r4, 0x37
	bne _0803BFD0
	movs r0, 0x96
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BFD0:
	cmp r4, 0x39
	bne _0803BFFE
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x3A
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803BFFE
	movs r0, 0x96
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BFFE:
	ldr r2, [sp, 0x24]
	ldrb r0, [r2]
	cmp r0, 0x3A
	bne _0803C030
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x39
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803C030
	movs r0, 0x96
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803C030:
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x3E
	bne _0803C04C
	ldr r0, [r7, 0x4C]
	cmp r0, 0
	beq _0803C04C
	movs r0, 0x96
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803C04C:
	ldr r2, [sp, 0x28]
	ldrb r0, [r2]
	cmp r0, 0x3F
	bne _0803C06E
	ldr r3, [sp, 0x4]
	ldr r0, [r3, 0x4C]
	cmp r0, 0
	beq _0803C06E
	movs r0, 0x96
	ldr r1, [sp, 0x14]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803C06E:
	mov r2, r9
	cmp r2, 0xD
	bne _0803C092
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0
	movs r3, 0xFD
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803C092
	ldr r1, _0803C1BC @ =gBattleMovePower
	ldrh r0, [r1]
	lsrs r0, 1
	strh r0, [r1]
_0803C092:
	mov r3, r9
	cmp r3, 0xA
	bne _0803C0B6
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0
	movs r3, 0xFE
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803C0B6
	ldr r1, _0803C1BC @ =gBattleMovePower
	ldrh r0, [r1]
	lsrs r0, 1
	strh r0, [r1]
_0803C0B6:
	mov r0, r9
	cmp r0, 0xC
	bne _0803C0E6
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x41
	bne _0803C0E6
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803C0E6
	ldr r4, _0803C1BC @ =gBattleMovePower
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803C0E6:
	mov r2, r9
	cmp r2, 0xA
	bne _0803C116
	ldr r3, [sp, 0x24]
	ldrb r0, [r3]
	cmp r0, 0x42
	bne _0803C116
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803C116
	ldr r4, _0803C1BC @ =gBattleMovePower
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803C116:
	mov r0, r9
	cmp r0, 0xB
	bne _0803C146
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x43
	bne _0803C146
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803C146
	ldr r4, _0803C1BC @ =gBattleMovePower
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803C146:
	mov r2, r9
	cmp r2, 0x6
	bne _0803C176
	ldr r3, [sp, 0x24]
	ldrb r0, [r3]
	cmp r0, 0x44
	bne _0803C176
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803C176
	ldr r4, _0803C1BC @ =gBattleMovePower
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803C176:
	ldr r2, _0803C1C0 @ =gBattleMoves
	ldr r0, _0803C1C4 @ =gUnknown_02024BE6
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _0803C190
	ldr r0, [sp, 0x14]
	lsrs r0, 1
	str r0, [sp, 0x14]
_0803C190:
	mov r1, r9
	cmp r1, 0x8
	bls _0803C198
	b _0803C2F6
_0803C198:
	ldr r0, _0803C1C8 @ =gCritMultiplier
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0803C1D4
	movs r0, 0x19
	ldrsb r0, [r7, r0]
	cmp r0, 0x6
	ble _0803C1D0
	ldr r2, _0803C1CC @ =gStatStageRatios
	b _0803C1DA
	.align 2, 0
_0803C1B0: .4byte gUnknown_020239F8
_0803C1B4: .4byte 0xfffffe69
_0803C1B8: .4byte 0x00000175
_0803C1BC: .4byte gBattleMovePower
_0803C1C0: .4byte gBattleMoves
_0803C1C4: .4byte gUnknown_02024BE6
_0803C1C8: .4byte gCritMultiplier
_0803C1CC: .4byte gStatStageRatios
_0803C1D0:
	adds r5, r6, 0
	b _0803C1F2
_0803C1D4:
	ldr r2, _0803C224 @ =gStatStageRatios
	movs r0, 0x19
	ldrsb r0, [r7, r0]
_0803C1DA:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r6, 0
	muls r5, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r5, 0
	bl __divsi3
	adds r5, r0, 0
_0803C1F2:
	ldr r0, _0803C228 @ =gBattleMovePower
	ldrh r0, [r0]
	muls r5, r0
	adds r0, r7, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x2
	muls r5, r0
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _0803C230
	ldr r2, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	bgt _0803C22C
	ldr r2, _0803C224 @ =gStatStageRatios
	ldr r3, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r3, r0]
	b _0803C238
	.align 2, 0
_0803C224: .4byte gStatStageRatios
_0803C228: .4byte gBattleMovePower
_0803C22C:
	ldr r3, [sp, 0x14]
	b _0803C252
_0803C230:
	ldr r2, _0803C2B0 @ =gStatStageRatios
	ldr r1, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
_0803C238:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r6, [sp, 0x14]
	adds r3, r6, 0
	muls r3, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	bl __divsi3
	adds r3, r0, 0
_0803C252:
	adds r0, r5, 0
	adds r1, r3, 0
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0x32
	bl __divsi3
	adds r5, r0, 0
	ldr r0, [r7, 0x4C]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803C27C
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x3E
	beq _0803C27C
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C27C:
	movs r0, 0x1
	ldr r2, [sp, 0xC]
	ands r0, r2
	cmp r0, 0
	beq _0803C2BE
	ldrb r1, [r4]
	cmp r1, 0x1
	bne _0803C2BE
	ldr r0, _0803C2B4 @ =gUnknown_020239F8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0803C2B8
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C2B8
	adds r0, r5, 0
	movs r1, 0x3
	bl __divsi3
	lsls r5, r0, 1
	b _0803C2BE
	.align 2, 0
_0803C2B0: .4byte gStatStageRatios
_0803C2B4: .4byte gUnknown_020239F8
_0803C2B8:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C2BE:
	ldr r0, _0803C31C @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803C2F0
	ldr r0, _0803C320 @ =gBattleMoves
	ldr r3, [sp, 0x8]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _0803C2F0
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C2F0
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C2F0:
	cmp r5, 0
	bne _0803C2F6
	movs r5, 0x1
_0803C2F6:
	mov r6, r9
	cmp r6, 0x9
	bne _0803C2FE
	movs r5, 0
_0803C2FE:
	mov r0, r9
	cmp r0, 0x9
	bhi _0803C306
	b _0803C504
_0803C306:
	ldr r0, _0803C324 @ =gCritMultiplier
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0803C330
	movs r0, 0x1C
	ldrsb r0, [r7, r0]
	cmp r0, 0x6
	ble _0803C32C
	ldr r2, _0803C328 @ =gStatStageRatios
	b _0803C336
	.align 2, 0
_0803C31C: .4byte gUnknown_020239F8
_0803C320: .4byte gBattleMoves
_0803C324: .4byte gCritMultiplier
_0803C328: .4byte gStatStageRatios
_0803C32C:
	mov r5, r8
	b _0803C34E
_0803C330:
	ldr r2, _0803C37C @ =gStatStageRatios
	movs r0, 0x1C
	ldrsb r0, [r7, r0]
_0803C336:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	mov r5, r8
	muls r5, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r5, 0
	bl __divsi3
	adds r5, r0, 0
_0803C34E:
	ldr r0, _0803C380 @ =gBattleMovePower
	ldrh r0, [r0]
	muls r5, r0
	adds r0, r7, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x2
	muls r5, r0
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _0803C388
	ldr r1, [sp, 0x4]
	movs r0, 0x1D
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0803C384
	ldr r2, _0803C37C @ =gStatStageRatios
	b _0803C390
	.align 2, 0
_0803C37C: .4byte gStatStageRatios
_0803C380: .4byte gBattleMovePower
_0803C384:
	ldr r3, [sp, 0x18]
	b _0803C3AA
_0803C388:
	ldr r2, _0803C3F0 @ =gStatStageRatios
	ldr r1, [sp, 0x4]
	movs r0, 0x1D
	ldrsb r0, [r1, r0]
_0803C390:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r6, [sp, 0x18]
	adds r3, r6, 0
	muls r3, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	bl __divsi3
	adds r3, r0, 0
_0803C3AA:
	adds r0, r5, 0
	adds r1, r3, 0
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0x32
	bl __divsi3
	adds r5, r0, 0
	movs r0, 0x2
	ldr r1, [sp, 0xC]
	ands r0, r1
	cmp r0, 0
	beq _0803C3FE
	ldrb r1, [r4]
	cmp r1, 0x1
	bne _0803C3FE
	ldr r0, _0803C3F4 @ =gUnknown_020239F8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0803C3F8
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C3F8
	adds r0, r5, 0
	movs r1, 0x3
	bl __divsi3
	lsls r5, r0, 1
	b _0803C3FE
	.align 2, 0
_0803C3F0: .4byte gStatStageRatios
_0803C3F4: .4byte gUnknown_020239F8
_0803C3F8:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C3FE:
	ldr r0, _0803C478 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803C430
	ldr r0, _0803C47C @ =gBattleMoves
	ldr r2, [sp, 0x8]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _0803C430
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C430
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C430:
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0803C4E0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0803C4E0
	ldr r2, _0803C480 @ =word_2024DB8
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	beq _0803C498
	mov r3, r9
	cmp r3, 0xA
	beq _0803C484
	cmp r3, 0xB
	beq _0803C48C
	b _0803C498
	.align 2, 0
_0803C478: .4byte gUnknown_020239F8
_0803C47C: .4byte gBattleMoves
_0803C480: .4byte word_2024DB8
_0803C484:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
	b _0803C498
_0803C48C:
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
_0803C498:
	ldrh r1, [r4]
	movs r0, 0x9F
	ands r0, r1
	cmp r0, 0
	beq _0803C4B0
	ldr r0, _0803C4C8 @ =gUnknown_02024BE6
	ldrh r0, [r0]
	cmp r0, 0x4C
	bne _0803C4B0
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C4B0:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0803C4E0
	mov r6, r9
	cmp r6, 0xA
	beq _0803C4CC
	cmp r6, 0xB
	beq _0803C4DA
	b _0803C4E0
	.align 2, 0
_0803C4C8: .4byte gUnknown_02024BE6
_0803C4CC:
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	b _0803C4E0
_0803C4DA:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C4E0:
	ldr r1, _0803C518 @ =0x02017100
	ldr r2, [sp, 0x10]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803C504
	mov r3, r9
	cmp r3, 0xA
	bne _0803C504
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
_0803C504:
	adds r0, r5, 0x2
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803C518: .4byte 0x02017100
	thumb_func_end CalculateBaseDamage

	.align 2, 0 @ Don't pad with nop.
