	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_800D42C
unref_sub_800D42C: @ 800D600
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	mov r9, r0
	str r1, [sp]
	str r2, [sp, 0x4]
	adds r5, r3, 0
	movs r0, 0x1
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	bne _0800D620
	b _0800D7B8
_0800D620:
	asrs r0, r1, 1
	adds r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	movs r0, 0
	ldr r2, [sp]
	cmp r0, r2
	blt _0800D634
	b _0800D848
_0800D634:
	movs r4, 0x8
	subs r1, r4, r1
	str r1, [sp, 0x10]
_0800D63A:
	movs r7, 0
	adds r0, 0x1
	str r0, [sp, 0x14]
	ldr r0, [sp, 0x10]
	cmp r7, r0
	bge _0800D6B6
	ldr r1, [sp, 0x8]
	lsls r1, 8
	str r1, [sp, 0x18]
	movs r2, 0
	mov r10, r2
	mov r0, r9
	movs r4, 0x8
	subs r0, r4, r0
	str r0, [sp, 0xC]
_0800D658:
	movs r3, 0
	asrs r0, r7, 1
	adds r1, r7, 0
	movs r2, 0x1
	ands r1, r2
	str r1, [sp, 0x20]
	lsls r0, 8
	mov r8, r0
	mov r12, r5
_0800D66A:
	lsls r1, r3, 5
	ldr r4, [sp, 0x18]
	adds r0, r5, r4
	adds r0, r1
	mov r1, r8
	adds r2, r0, r1
	mov r1, r12
	add r1, r8
	movs r6, 0xF
_0800D67C:
	ldr r4, [sp, 0x20]
	cmp r4, 0
	bne _0800D68C
	strb r4, [r1]
	add r4, sp, 0x20
	ldrb r4, [r4]
	strb r4, [r2, 0x10]
	b _0800D69A
_0800D68C:
	mov r0, r10
	strb r0, [r1, 0x10]
	movs r4, 0x80
	lsls r4, 1
	adds r4, r2, r4
	str r4, [sp, 0x1C]
	strb r0, [r4]
_0800D69A:
	adds r2, 0x1
	adds r1, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0800D67C
	movs r0, 0x20
	add r12, r0
	adds r3, 0x1
	cmp r3, 0x7
	ble _0800D66A
	adds r7, 0x1
	ldr r1, [sp, 0xC]
	cmp r7, r1
	blt _0800D658
_0800D6B6:
	movs r7, 0
	movs r2, 0
_0800D6BA:
	movs r6, 0
	adds r4, r7, 0x1
	mov r8, r4
	lsls r4, r7, 5
_0800D6C2:
	adds r0, r6, 0x1
	mov r10, r0
	lsls r1, r6, 8
	adds r0, r1, 0
	adds r0, 0xC0
	adds r0, r5, r0
	adds r0, r4
	adds r1, r5, r1
	adds r1, r4
	movs r3, 0x1F
_0800D6D6:
	strb r2, [r1]
	strb r2, [r0]
	adds r0, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D6D6
	mov r6, r10
	cmp r6, 0x7
	ble _0800D6C2
	mov r7, r8
	cmp r7, 0x1
	ble _0800D6BA
	mov r1, r9
	cmp r1, 0x5
	bne _0800D6FC
	movs r2, 0x90
	lsls r2, 1
	adds r5, r2
_0800D6FC:
	movs r7, 0
	cmp r7, r9
	bge _0800D792
_0800D702:
	movs r3, 0
	adds r7, 0x1
	mov r8, r7
	cmp r3, r9
	bge _0800D772
_0800D70C:
	adds r3, 0x1
	mov r10, r3
	ldr r4, [sp, 0x4]
	adds r4, 0x20
	adds r7, r5, 0
	adds r7, 0x20
	movs r0, 0x12
	adds r0, r5
	mov r12, r0
	ldr r2, [sp, 0x4]
	adds r3, r5, 0
	movs r6, 0x3
_0800D724:
	ldrb r0, [r2]
	mov r1, r12
	strb r0, [r1]
	ldrb r0, [r2, 0x1]
	strb r0, [r1, 0x1]
	ldrb r0, [r2, 0x2]
	strb r0, [r1, 0x1E]
	ldrb r0, [r2, 0x3]
	strb r0, [r1, 0x1F]
	movs r0, 0x81
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x10]
	strb r0, [r1]
	ldr r0, _0800D77C
	adds r1, r3, r0
	ldrb r0, [r2, 0x11]
	strb r0, [r1]
	movs r0, 0x90
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r2, 0x12]
	strb r0, [r1]
	ldr r0, _0800D780
	adds r1, r3, r0
	ldrb r0, [r2, 0x13]
	strb r0, [r1]
	movs r1, 0x4
	add r12, r1
	adds r2, 0x4
	adds r3, 0x4
	subs r6, 0x1
	cmp r6, 0
	bge _0800D724
	str r4, [sp, 0x4]
	adds r5, r7, 0
	mov r3, r10
	cmp r3, r9
	blt _0800D70C
_0800D772:
	mov r2, r9
	cmp r2, 0x7
	bne _0800D784
	adds r5, 0x20
	b _0800D78C
	.align 2, 0
_0800D77C: .4byte 0x00000103
_0800D780: .4byte 0x00000121
_0800D784:
	mov r4, r9
	cmp r4, 0x5
	bne _0800D78C
	adds r5, 0x60
_0800D78C:
	mov r7, r8
	cmp r7, r9
	blt _0800D702
_0800D792:
	mov r0, r9
	cmp r0, 0x7
	bne _0800D7A0
	movs r1, 0x80
	lsls r1, 1
	adds r5, r1
	b _0800D7AC
_0800D7A0:
	mov r2, r9
	cmp r2, 0x5
	bne _0800D7AC
	movs r4, 0xF0
	lsls r4, 1
	adds r5, r4
_0800D7AC:
	ldr r0, [sp, 0x14]
	ldr r1, [sp]
	cmp r0, r1
	bge _0800D7B6
	b _0800D63A
_0800D7B6:
	b _0800D848
_0800D7B8:
	movs r6, 0
	ldr r2, [sp]
	cmp r6, r2
	bge _0800D848
_0800D7C0:
	adds r6, 0x1
	mov r10, r6
	mov r4, r9
	cmp r4, 0x6
	bne _0800D7D8
	movs r0, 0
	movs r3, 0xFF
_0800D7CE:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D7CE
_0800D7D8:
	movs r7, 0
	cmp r7, r9
	bge _0800D82C
_0800D7DE:
	adds r7, 0x1
	mov r8, r7
	mov r1, r9
	lsls r0, r1, 5
	cmp r1, 0x6
	bne _0800D7F8
	movs r1, 0
	movs r3, 0x1F
_0800D7EE:
	strb r1, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D7EE
_0800D7F8:
	adds r1, r0, 0
	cmp r1, 0
	ble _0800D812
	adds r3, r1, 0
_0800D800:
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	strb r0, [r5]
	adds r2, 0x1
	str r2, [sp, 0x4]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800D800
_0800D812:
	mov r4, r9
	cmp r4, 0x6
	bne _0800D826
	movs r0, 0
	movs r3, 0x1F
_0800D81C:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D81C
_0800D826:
	mov r7, r8
	cmp r7, r9
	blt _0800D7DE
_0800D82C:
	mov r0, r9
	cmp r0, 0x6
	bne _0800D840
	movs r0, 0
	movs r3, 0xFF
_0800D836:
	strb r0, [r5]
	adds r5, 0x1
	subs r3, 0x1
	cmp r3, 0
	bge _0800D836
_0800D840:
	mov r6, r10
	ldr r1, [sp]
	cmp r6, r1
	blt _0800D7C0
_0800D848:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_800D42C

	thumb_func_start unref_sub_800D684
unref_sub_800D684: @ 800D858
	push {lr}
	bl ResetSpriteData
	ldr r0, _0800D88C
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800D890
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0800D894
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0800D88C: .4byte gSpriteTemplate_81F96D0
_0800D890: .4byte gSprites
_0800D894: .4byte sub_800D6C4
	thumb_func_end unref_sub_800D684

	thumb_func_start sub_800D6C4
sub_800D6C4: @ 800D898
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_800D6C4

	thumb_func_start sub_800D6D4
sub_800D6D4: @ 800D8A8
	push {r4,r5,lr}
	ldr r3, _0800D900
	ldrh r2, [r3]
	movs r5, 0
	strh r5, [r3]
	ldr r4, _0800D904
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _0800D908
	movs r0, 0x8
	strh r0, [r1]
	adds r1, 0x4
	movs r2, 0x98
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0800D90C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0800D910
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0800D914
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0800D918
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r1, 0xE
	ldr r2, _0800D91C
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D900: .4byte 0x04000208
_0800D904: .4byte 0x04000200
_0800D908: .4byte 0x04000004
_0800D90C: .4byte 0x00009c04
_0800D910: .4byte 0x00005e05
_0800D914: .4byte 0x00005a0b
_0800D918: .4byte 0x04000050
_0800D91C: .4byte 0x0000bf40
	thumb_func_end sub_800D6D4

	thumb_func_start sub_800D74C
sub_800D74C: @ 800D920
	push {r4,lr}
	movs r0, 0x12
	bl SetTextWindowBaseTileNum
	ldr r4, _0800D970
	adds r0, r4, 0
	movs r1, 0x1
	bl LoadTextWindowGraphics_OverridePalSlot
	movs r0, 0x22
	bl SetTextWindowBaseTileNum
	adds r0, r4, 0
	movs r1, 0x1
	bl LoadTextWindowGraphics_OverridePalSlot
	ldr r3, _0800D974
	adds r0, r3, 0
	adds r0, 0xB8
	ldr r1, _0800D978
	strh r1, [r0]
	adds r2, r3, 0
	adds r2, 0xBA
	ldr r1, _0800D97C
	strh r1, [r2]
	adds r2, 0x2
	ldr r1, _0800D980
	strh r1, [r2]
	adds r2, 0x2
	ldr r1, _0800D984
	strh r1, [r2]
	ldr r1, _0800D988
	movs r2, 0x4
	bl CpuSet
	bl sub_8032A38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D970: .4byte gUnknown_03004210
_0800D974: .4byte gPlttBufferUnfaded
_0800D978: .4byte 0x00007fe0
_0800D97C: .4byte 0x00002529
_0800D980: .4byte 0x00007fff
_0800D984: .4byte 0x0000675a
_0800D988: .4byte 0x0202ef80
	thumb_func_end sub_800D74C

	thumb_func_start sub_800D7B8
sub_800D7B8: @ 800D98C
	push {r4,r5,lr}
	ldr r0, _0800D9B0
	ldrh r1, [r0]
	ldr r0, _0800D9B4
	ands r0, r1
	cmp r0, 0
	beq _0800D9CC
	ldr r0, _0800D9B8
	ldr r1, _0800D9BC
	bl LZDecompressVram
	ldr r0, _0800D9C0
	ldr r1, _0800D9C4
	bl LZDecompressVram
	ldr r0, _0800D9C8
	b _0800DC3A
	.align 2, 0
_0800D9B0: .4byte gUnknown_020239F8
_0800D9B4: .4byte 0x00000902
_0800D9B8: .4byte gBattleTerrainTiles_Building
_0800D9BC: .4byte 0x06008000
_0800D9C0: .4byte gBattleTerrainTilemap_Building
_0800D9C4: .4byte 0x0600d000
_0800D9C8: .4byte gBattleTerrainPalette_BattleTower
_0800D9CC:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800DA34
	ldr r0, _0800D9F4
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800DA0C
	ldr r0, _0800D9F8
	ldr r1, _0800D9FC
	bl LZDecompressVram
	ldr r0, _0800DA00
	ldr r1, _0800DA04
	bl LZDecompressVram
	ldr r0, _0800DA08
	b _0800DC3A
	.align 2, 0
_0800D9F4: .4byte gGameVersion
_0800D9F8: .4byte gBattleTerrainTiles_Cave
_0800D9FC: .4byte 0x06008000
_0800DA00: .4byte gBattleTerrainTilemap_Cave
_0800DA04: .4byte 0x0600d000
_0800DA08: .4byte gBattleTerrainPalette_Groudon
_0800DA0C:
	ldr r0, _0800DA20
	ldr r1, _0800DA24
	bl LZDecompressVram
	ldr r0, _0800DA28
	ldr r1, _0800DA2C
	bl LZDecompressVram
	ldr r0, _0800DA30
	b _0800DC3A
	.align 2, 0
_0800DA20: .4byte gBattleTerrainTiles_Water
_0800DA24: .4byte 0x06008000
_0800DA28: .4byte gBattleTerrainTilemap_Water
_0800DA2C: .4byte 0x0600d000
_0800DA30: .4byte gBattleTerrainPalette_Kyogre
_0800DA34:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800DAAC
	ldr r2, _0800DA64
	ldr r0, _0800DA68
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x19
	bne _0800DA80
	ldr r0, _0800DA6C
	ldr r1, _0800DA70
	bl LZDecompressVram
	ldr r0, _0800DA74
	ldr r1, _0800DA78
	bl LZDecompressVram
	ldr r0, _0800DA7C
	b _0800DC3A
	.align 2, 0
_0800DA64: .4byte gTrainers
_0800DA68: .4byte gTrainerBattleOpponent
_0800DA6C: .4byte gBattleTerrainTiles_Building
_0800DA70: .4byte 0x06008000
_0800DA74: .4byte gBattleTerrainTilemap_Building
_0800DA78: .4byte 0x0600d000
_0800DA7C: .4byte gBattleTerrainPalette_BuildingLeader
_0800DA80:
	cmp r0, 0x20
	bne _0800DAAC
	ldr r0, _0800DA98
	ldr r1, _0800DA9C
	bl LZDecompressVram
	ldr r0, _0800DAA0
	ldr r1, _0800DAA4
	bl LZDecompressVram
	ldr r0, _0800DAA8
	b _0800DC3A
	.align 2, 0
_0800DA98: .4byte gBattleTerrainTiles_Stadium
_0800DA9C: .4byte 0x06008000
_0800DAA0: .4byte gBattleTerrainTilemap_Stadium
_0800DAA4: .4byte 0x0600d000
_0800DAA8: .4byte gBattleTerrainPalette_StadiumSteven
_0800DAAC:
	bl sav1_map_get_battletype
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _0800DABA
	b _0800DC72
_0800DABA:
	lsls r0, 2
	ldr r1, _0800DAC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DAC4: .4byte _0800DAC8
	.align 2, 0
_0800DAC8:
	.4byte _0800DAEC
	.4byte _0800DB38
	.4byte _0800DB60
	.4byte _0800DB88
	.4byte _0800DBB0
	.4byte _0800DBD8
	.4byte _0800DC00
	.4byte _0800DC28
	.4byte _0800DC58
_0800DAEC:
	ldr r4, _0800DB28
	ldr r5, _0800DB2C
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldr r1, _0800DB30
	bl LZDecompressVram
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0800DB34
	bl LZDecompressVram
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r4, 0x10
	adds r0, r4
	ldr r0, [r0]
	b _0800DC3A
	.align 2, 0
_0800DB28: .4byte gBattleTerrainTable
_0800DB2C: .4byte gUnknown_0300428C
_0800DB30: .4byte 0x06008000
_0800DB34: .4byte 0x0600d000
_0800DB38:
	ldr r0, _0800DB4C
	ldr r1, _0800DB50
	bl LZDecompressVram
	ldr r0, _0800DB54
	ldr r1, _0800DB58
	bl LZDecompressVram
	ldr r0, _0800DB5C
	b _0800DC3A
	.align 2, 0
_0800DB4C: .4byte gBattleTerrainTiles_Building
_0800DB50: .4byte 0x06008000
_0800DB54: .4byte gBattleTerrainTilemap_Building
_0800DB58: .4byte 0x0600d000
_0800DB5C: .4byte gBattleTerrainPalette_BuildingGym
_0800DB60:
	ldr r0, _0800DB74
	ldr r1, _0800DB78
	bl LZDecompressVram
	ldr r0, _0800DB7C
	ldr r1, _0800DB80
	bl LZDecompressVram
	ldr r0, _0800DB84
	b _0800DC3A
	.align 2, 0
_0800DB74: .4byte gBattleTerrainTiles_Stadium
_0800DB78: .4byte 0x06008000
_0800DB7C: .4byte gBattleTerrainTilemap_Stadium
_0800DB80: .4byte 0x0600d000
_0800DB84: .4byte gBattleTerrainPalette_StadiumMagma
_0800DB88:
	ldr r0, _0800DB9C
	ldr r1, _0800DBA0
	bl LZDecompressVram
	ldr r0, _0800DBA4
	ldr r1, _0800DBA8
	bl LZDecompressVram
	ldr r0, _0800DBAC
	b _0800DC3A
	.align 2, 0
_0800DB9C: .4byte gBattleTerrainTiles_Stadium
_0800DBA0: .4byte 0x06008000
_0800DBA4: .4byte gBattleTerrainTilemap_Stadium
_0800DBA8: .4byte 0x0600d000
_0800DBAC: .4byte gBattleTerrainPalette_StadiumAqua
_0800DBB0:
	ldr r0, _0800DBC4
	ldr r1, _0800DBC8
	bl LZDecompressVram
	ldr r0, _0800DBCC
	ldr r1, _0800DBD0
	bl LZDecompressVram
	ldr r0, _0800DBD4
	b _0800DC3A
	.align 2, 0
_0800DBC4: .4byte gBattleTerrainTiles_Stadium
_0800DBC8: .4byte 0x06008000
_0800DBCC: .4byte gBattleTerrainTilemap_Stadium
_0800DBD0: .4byte 0x0600d000
_0800DBD4: .4byte gBattleTerrainPalette_StadiumSidney
_0800DBD8:
	ldr r0, _0800DBEC
	ldr r1, _0800DBF0
	bl LZDecompressVram
	ldr r0, _0800DBF4
	ldr r1, _0800DBF8
	bl LZDecompressVram
	ldr r0, _0800DBFC
	b _0800DC3A
	.align 2, 0
_0800DBEC: .4byte gBattleTerrainTiles_Stadium
_0800DBF0: .4byte 0x06008000
_0800DBF4: .4byte gBattleTerrainTilemap_Stadium
_0800DBF8: .4byte 0x0600d000
_0800DBFC: .4byte gBattleTerrainPalette_StadiumPhoebe
_0800DC00:
	ldr r0, _0800DC14
	ldr r1, _0800DC18
	bl LZDecompressVram
	ldr r0, _0800DC1C
	ldr r1, _0800DC20
	bl LZDecompressVram
	ldr r0, _0800DC24
	b _0800DC3A
	.align 2, 0
_0800DC14: .4byte gBattleTerrainTiles_Stadium
_0800DC18: .4byte 0x06008000
_0800DC1C: .4byte gBattleTerrainTilemap_Stadium
_0800DC20: .4byte 0x0600d000
_0800DC24: .4byte gBattleTerrainPalette_StadiumGlacia
_0800DC28:
	ldr r0, _0800DC44
	ldr r1, _0800DC48
	bl LZDecompressVram
	ldr r0, _0800DC4C
	ldr r1, _0800DC50
	bl LZDecompressVram
	ldr r0, _0800DC54
_0800DC3A:
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	b _0800DC72
	.align 2, 0
_0800DC44: .4byte gBattleTerrainTiles_Stadium
_0800DC48: .4byte 0x06008000
_0800DC4C: .4byte gBattleTerrainTilemap_Stadium
_0800DC50: .4byte 0x0600d000
_0800DC54: .4byte gBattleTerrainPalette_StadiumDrake
_0800DC58:
	ldr r0, _0800DC78
	ldr r1, _0800DC7C
	bl LZDecompressVram
	ldr r0, _0800DC80
	ldr r1, _0800DC84
	bl LZDecompressVram
	ldr r0, _0800DC88
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
_0800DC72:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800DC78: .4byte gBattleTerrainTiles_Building
_0800DC7C: .4byte 0x06008000
_0800DC80: .4byte gBattleTerrainTilemap_Building
_0800DC84: .4byte 0x0600d000
_0800DC88: .4byte gBattleTerrainPalette_BattleTower
	thumb_func_end sub_800D7B8

	thumb_func_start sub_800DAB8
sub_800DAB8: @ 800DC8C
	push {lr}
	ldr r0, _0800DCBC
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0800DCC0
	ldr r1, _0800DCC4
	movs r2, 0x80
	lsls r2, 4
	bl CpuSet
	ldr r0, _0800DCC8
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	bl sub_800D74C
	bl sub_800D7B8
	pop {r0}
	bx r0
	.align 2, 0
_0800DCBC: .4byte gUnknown_08D00000
_0800DCC0: .4byte gUnknown_08D00524
_0800DCC4: .4byte 0x0600c000
_0800DCC8: .4byte gUnknown_08D004E0
	thumb_func_end sub_800DAB8

	thumb_func_start sub_800DAF8
sub_800DAF8: @ 800DCCC
	push {r4-r7,lr}
	sub sp, 0xC
	adds r7, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r3, r1, 24
	movs r4, 0
	ldr r0, _0800DD0C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800DD88
	ldr r0, _0800DD10
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0800DD26
	cmp r3, 0x1
	beq _0800DD4E
	cmp r3, 0x1
	bgt _0800DD14
	cmp r3, 0
	beq _0800DD1E
	b _0800DD58
	.align 2, 0
_0800DD0C: .4byte gUnknown_020239F8
_0800DD10: .4byte gTasks
_0800DD14:
	cmp r3, 0x2
	beq _0800DD22
	cmp r3, 0x3
	beq _0800DD42
	b _0800DD58
_0800DD1E:
	ldrh r0, [r1, 0xE]
	b _0800DD44
_0800DD22:
	ldrh r1, [r1, 0xE]
	b _0800DD50
_0800DD26:
	cmp r3, 0x1
	beq _0800DD42
	cmp r3, 0x1
	bgt _0800DD34
	cmp r3, 0
	beq _0800DD3E
	b _0800DD58
_0800DD34:
	cmp r3, 0x2
	beq _0800DD4A
	cmp r3, 0x3
	beq _0800DD4E
	b _0800DD58
_0800DD3E:
	ldrh r0, [r1, 0xE]
	b _0800DD44
_0800DD42:
	ldrh r0, [r1, 0x10]
_0800DD44:
	movs r4, 0x3F
	ands r4, r0
	b _0800DD58
_0800DD4A:
	ldrh r1, [r1, 0xE]
	b _0800DD50
_0800DD4E:
	ldrh r1, [r1, 0x10]
_0800DD50:
	movs r0, 0xFC
	lsls r0, 4
	ands r0, r1
	lsrs r4, r0, 6
_0800DD58:
	movs r3, 0
	movs r6, 0x3
	ldr r0, _0800DD84
	adds r5, r0, 0
	mov r2, sp
_0800DD62:
	lsls r1, r3, 1
	adds r0, r6, 0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r5
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x2
	ble _0800DD62
	mov r0, sp
	adds r1, r7, 0
	movs r2, 0x3
	bl CpuSet
	b _0800DDE6
	.align 2, 0
_0800DD84: .4byte 0x00006001
_0800DD88:
	ldr r0, _0800DDA4
	ldr r1, _0800DDA8
	adds r0, r1
	ldrb r0, [r0]
	cmp r3, r0
	bne _0800DDB0
	ldr r1, _0800DDAC
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrh r4, [r0, 0xE]
	b _0800DDBC
	.align 2, 0
_0800DDA4: .4byte 0x02000000
_0800DDA8: .4byte 0x000160cb
_0800DDAC: .4byte gTasks
_0800DDB0:
	ldr r1, _0800DDF0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r4, [r0, 0x10]
_0800DDBC:
	movs r3, 0
	movs r6, 0x3
	ldr r2, _0800DDF4
	adds r5, r2, 0
	mov r2, sp
_0800DDC6:
	lsls r1, r3, 1
	adds r0, r6, 0
	lsls r0, r1
	ands r0, r4
	asrs r0, r1
	adds r0, r5
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	ble _0800DDC6
	mov r0, sp
	adds r1, r7, 0
	movs r2, 0x6
	bl CpuSet
_0800DDE6:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800DDF0: .4byte gTasks
_0800DDF4: .4byte 0x00006001
	thumb_func_end sub_800DAF8

	thumb_func_start sub_800DC24
sub_800DC24: @ 800DDF8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _0800DE14
	ldrb r2, [r0]
	cmp r2, 0x3
	bne _0800DE20
	ldr r4, _0800DE18
	ldr r1, _0800DE1C
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0xA0
	movs r3, 0xD
	b _0800DF9E
	.align 2, 0
_0800DE14: .4byte gUnknown_02024D26
_0800DE18: .4byte gUnknown_03004210
_0800DE1C: .4byte gUnknown_08400E57
_0800DE20:
	ldr r0, _0800DE54
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800DF0C
	cmp r2, 0x1
	bne _0800DEA0
	ldr r2, _0800DE58
	ldr r0, _0800DE5C
	ldr r1, _0800DE60
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _0800DE70
	cmp r0, 0x1
	bgt _0800DE64
	cmp r0, 0
	bne _0800DE52
	b _0800DF7C
_0800DE52:
	b _0800DFF0
	.align 2, 0
_0800DE54: .4byte gUnknown_020239F8
_0800DE58: .4byte gLinkPlayers
_0800DE5C: .4byte 0x02000000
_0800DE60: .4byte 0x000160cb
_0800DE64:
	cmp r0, 0x2
	bne _0800DE6A
	b _0800DF7C
_0800DE6A:
	cmp r0, 0x3
	beq _0800DE70
	b _0800DFF0
_0800DE70:
	ldr r4, _0800DE94
	ldr r1, _0800DE98
	movs r5, 0x2
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xA0
	movs r3, 0x14
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0800DE9C
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xAC
	movs r3, 0x5
	b _0800DF9E
	.align 2, 0
_0800DE94: .4byte gUnknown_03004210
_0800DE98: .4byte gUnknown_08400E48
_0800DE9C: .4byte gUnknown_08400E4F
_0800DEA0:
	ldr r2, _0800DEC4
	ldr r0, _0800DEC8
	ldr r1, _0800DECC
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _0800DF7C
	cmp r0, 0x1
	bgt _0800DED0
	cmp r0, 0
	beq _0800DEDC
	b _0800DFF0
	.align 2, 0
_0800DEC4: .4byte gLinkPlayers
_0800DEC8: .4byte 0x02000000
_0800DECC: .4byte 0x000160cb
_0800DED0:
	cmp r0, 0x2
	beq _0800DEDC
	cmp r0, 0x3
	beq _0800DEDA
	b _0800DFF0
_0800DEDA:
	b _0800DF7C
_0800DEDC:
	ldr r4, _0800DF00
	ldr r1, _0800DF04
	movs r5, 0x2
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xA0
	movs r3, 0x14
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0800DF08
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xAC
	movs r3, 0x5
	b _0800DF9E
	.align 2, 0
_0800DF00: .4byte gUnknown_03004210
_0800DF04: .4byte gUnknown_08400E48
_0800DF08: .4byte gUnknown_08400E4F
_0800DF0C:
	cmp r2, 0x1
	bne _0800DF64
	ldr r2, _0800DF4C
	ldr r0, _0800DF50
	ldr r1, _0800DF54
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800DF7C
	ldr r4, _0800DF58
	ldr r1, _0800DF5C
	movs r5, 0x2
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xA0
	movs r3, 0x14
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0800DF60
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xAC
	movs r3, 0x5
	b _0800DF9E
	.align 2, 0
_0800DF4C: .4byte gLinkPlayers
_0800DF50: .4byte 0x02000000
_0800DF54: .4byte 0x000160cb
_0800DF58: .4byte gUnknown_03004210
_0800DF5C: .4byte gUnknown_08400E48
_0800DF60: .4byte gUnknown_08400E4F
_0800DF64:
	ldr r2, _0800DFAC
	ldr r0, _0800DFB0
	ldr r1, _0800DFB4
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800DFC4
_0800DF7C:
	ldr r4, _0800DFB8
	ldr r1, _0800DFBC
	movs r5, 0x2
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xA0
	movs r3, 0x5
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0800DFC0
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xAC
	movs r3, 0x14
_0800DF9E:
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	b _0800DFF0
	.align 2, 0
_0800DFAC: .4byte gLinkPlayers
_0800DFB0: .4byte 0x02000000
_0800DFB4: .4byte 0x000160cb
_0800DFB8: .4byte gUnknown_03004210
_0800DFBC: .4byte gUnknown_08400E48
_0800DFC0: .4byte gUnknown_08400E4F
_0800DFC4:
	ldr r4, _0800DFF8
	ldr r1, _0800DFFC
	movs r5, 0x2
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xA0
	movs r3, 0x14
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0800E000
	str r5, [sp]
	adds r0, r4, 0
	movs r2, 0xAC
	movs r3, 0x5
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
_0800DFF0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800DFF8: .4byte gUnknown_03004210
_0800DFFC: .4byte gUnknown_08400E48
_0800E000: .4byte gUnknown_08400E4F
	thumb_func_end sub_800DC24

	thumb_func_start sub_800DE30
sub_800DE30: @ 800E004
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _0800E038
	lsls r0, 2
	mov r10, r0
	add r0, r9
	lsls r0, 3
	adds r6, r0, r1
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _0800E02C
	b _0800E170
_0800E02C:
	cmp r0, 0x1
	bgt _0800E03C
	cmp r0, 0
	beq _0800E044
	b _0800E3E6
	.align 2, 0
_0800E038: .4byte gTasks
_0800E03C:
	cmp r0, 0x2
	bne _0800E042
	b _0800E210
_0800E042:
	b _0800E3E6
_0800E044:
	ldr r0, _0800E0A4
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800E0B4
	ldr r0, _0800E0A8
	ldr r2, _0800E0AC
	mov r8, r2
	adds r7, r0, 0
	adds r7, 0x8
	movs r5, 0x3
_0800E05C:
	ldrb r0, [r7, 0x10]
	movs r1, 0x3
	ands r1, r0
	str r1, [sp, 0x8]
	lsls r4, r1, 1
	adds r4, r1
	lsls r4, 2
	mov r2, r8
	adds r0, r4, r2
	ldr r1, [r0]
	str r1, [sp, 0xC]
	ldrh r2, [r0, 0x4]
	ldrb r3, [r0, 0x6]
	ldrb r0, [r0, 0x7]
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r1, 0
	adds r1, r7, 0
	bl sub_8002E4C
	ldr r0, [sp, 0xC]
	bl sub_8002F44
	ldr r2, _0800E0B0
	adds r4, r2
	ldr r2, [r4]
	mov r0, r9
	ldr r1, [sp, 0x8]
	bl sub_800DAF8
	adds r7, 0x1C
	subs r5, 0x1
	cmp r5, 0
	bge _0800E05C
	b _0800E144
	.align 2, 0
_0800E0A4: .4byte gUnknown_020239F8
_0800E0A8: .4byte gLinkPlayers
_0800E0AC: .4byte gUnknown_081F9680
_0800E0B0: .4byte 0x08206604
_0800E0B4:
	ldr r0, _0800E158
	ldr r5, _0800E15C
	adds r0, r5
	ldrb r7, [r0]
	movs r0, 0x1
	adds r6, r7, 0
	eors r6, r0
	adds r1, r6, 0
	ldr r2, _0800E160
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x18]
	cmp r0, 0
	beq _0800E0D8
	adds r6, r7, 0
	adds r7, r1, 0
_0800E0D8:
	ldr r0, _0800E164
	mov r8, r0
	adds r0, 0x30
	mov r1, r8
	ldr r4, [r1, 0x30]
	lsls r1, r7, 3
	subs r1, r7
	lsls r1, 2
	ldr r2, _0800E168
	adds r1, r2
	ldrh r2, [r0, 0x4]
	ldrb r3, [r0, 0x6]
	ldrb r0, [r0, 0x7]
	str r0, [sp]
	movs r5, 0x1
	str r5, [sp, 0x4]
	adds r0, r4, 0
	bl sub_8002E4C
	adds r0, r4, 0
	bl sub_8002F44
	mov r0, r8
	ldr r2, [r0, 0x38]
	mov r0, r9
	adds r1, r7, 0
	bl sub_800DAF8
	mov r0, r8
	adds r0, 0x3C
	mov r1, r8
	ldr r4, [r1, 0x3C]
	lsls r1, r6, 3
	subs r1, r6
	lsls r1, 2
	ldr r2, _0800E168
	adds r1, r2
	ldrh r2, [r0, 0x4]
	ldrb r3, [r0, 0x6]
	ldrb r0, [r0, 0x7]
	str r0, [sp]
	str r5, [sp, 0x4]
	adds r0, r4, 0
	bl sub_8002E4C
	adds r0, r4, 0
	bl sub_8002F44
	mov r5, r8
	ldr r2, [r5, 0x44]
	mov r0, r9
	adds r1, r6, 0
	bl sub_800DAF8
_0800E144:
	ldr r0, _0800E16C
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0800E3E6
	.align 2, 0
_0800E158: .4byte 0x02000000
_0800E15C: .4byte 0x000160cb
_0800E160: .4byte gLinkPlayers
_0800E164: .4byte gUnknown_081F9680
_0800E168: .4byte 0x03002988
_0800E16C: .4byte gTasks
_0800E170:
	ldr r0, _0800E1E4
	bl AllocSpritePalette
	lsls r0, 24
	ldr r2, _0800E1E8
	lsrs r0, 19
	ldr r1, _0800E1EC
	adds r0, r1
	adds r2, r0, r2
	ldr r1, _0800E1F0
	adds r0, r1
	ldr r1, _0800E1F4
	strh r1, [r0]
	strh r1, [r2]
	ldr r0, _0800E1F8
	movs r1, 0x6C
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r4, _0800E1FC
	ldr r2, _0800E200
	adds r7, r4, r2
	strb r0, [r7]
	ldr r0, _0800E204
	movs r1, 0x84
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r5, _0800E208
	adds r4, r5
	strb r0, [r4]
	ldr r3, _0800E20C
	ldrb r1, [r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _0800E3E6
	.align 2, 0
_0800E1E4: .4byte 0x00002710
_0800E1E8: .4byte gPlttBufferUnfaded
_0800E1EC: .4byte 0x0000021e
_0800E1F0: .4byte gPlttBufferFaded
_0800E1F4: .4byte 0x00007fff
_0800E1F8: .4byte gSpriteTemplate_81F9574
_0800E1FC: .4byte 0x02000000
_0800E200: .4byte 0x0001608a
_0800E204: .4byte gSpriteTemplate_81F958C
_0800E208: .4byte 0x0001608b
_0800E20C: .4byte gSprites
_0800E210:
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _0800E278
	ldr r4, _0800E264
	ldrh r0, [r6, 0xA]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800E22A
	adds r0, 0x1F
_0800E22A:
	asrs r1, r0, 5
	movs r2, 0x14
	negs r2, r2
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4]
	ldr r4, _0800E268
	ldrh r0, [r6, 0xC]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800E248
	adds r0, 0x1F
_0800E248:
	asrs r1, r0, 5
	movs r5, 0x8C
	negs r5, r5
	adds r0, r5, 0
	subs r0, r1
	strh r0, [r4]
	ldr r0, _0800E26C
	ldr r2, _0800E270
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0800E274
	strh r1, [r0]
	b _0800E2E4
	.align 2, 0
_0800E264: .4byte gUnknown_030042C0
_0800E268: .4byte gUnknown_03004288
_0800E26C: .4byte gUnknown_030041B4
_0800E270: .4byte 0x0000ffdc
_0800E274: .4byte gUnknown_03004280
_0800E278:
	ldr r4, _0800E308
	ldrh r0, [r6, 0xA]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800E28A
	adds r0, 0x1F
_0800E28A:
	asrs r1, r0, 5
	movs r5, 0x14
	negs r5, r5
	adds r0, r5, 0
	subs r0, r1
	strh r0, [r4]
	ldr r4, _0800E30C
	ldrh r0, [r6, 0xA]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800E2A8
	adds r0, 0x1F
_0800E2A8:
	asrs r0, 5
	subs r0, 0xA4
	strh r0, [r4]
	ldr r4, _0800E310
	ldrh r0, [r6, 0xC]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800E2C0
	adds r0, 0x1F
_0800E2C0:
	asrs r1, r0, 5
	movs r2, 0x8C
	negs r2, r2
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4]
	ldr r4, _0800E314
	ldrh r0, [r6, 0xC]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0800E2DE
	adds r0, 0x1F
_0800E2DE:
	asrs r0, 5
	subs r0, 0xA4
	strh r0, [r4]
_0800E2E4:
	ldr r1, _0800E318
	mov r5, r9
	lsls r0, r5, 2
	add r0, r9
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xC]
	movs r2, 0xC
	ldrsh r7, [r1, r2]
	cmp r7, 0
	beq _0800E31C
	subs r0, 0x2
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0xA]
	adds r0, 0x2
	strh r0, [r1, 0xA]
	b _0800E3E6
	.align 2, 0
_0800E308: .4byte gUnknown_030042C0
_0800E30C: .4byte gUnknown_030041B4
_0800E310: .4byte gUnknown_03004288
_0800E314: .4byte gUnknown_03004280
_0800E318: .4byte gTasks
_0800E31C:
	movs r5, 0x12
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _0800E328
	bl sub_800DC24
_0800E328:
	movs r0, 0x78
	bl PlaySE
	mov r0, r9
	bl DestroyTask
	ldr r4, _0800E3F8
	ldr r0, _0800E3FC
	mov r8, r0
	ldr r1, _0800E400
	add r1, r8
	mov r9, r1
	ldrb r0, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r5, _0800E404
	add r8, r5
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r5, _0800E408
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _0800E40C
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x2E]
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	mov r5, r9
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x30]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x32]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x32]
_0800E3E6:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E3F8: .4byte gSprites
_0800E3FC: .4byte 0x02000000
_0800E400: .4byte 0x0001608a
_0800E404: .4byte 0x0001608b
_0800E408: .4byte 0x000003ff
_0800E40C: .4byte 0xfffffc00
	thumb_func_end sub_800DE30

	thumb_func_start sub_800E23C
sub_800E23C: @ 800E410
	push {r4,r5,lr}
	ldr r0, _0800E470
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800E4B0
	ldr r0, _0800E474
	ldr r1, _0800E478
	bl LZDecompressVram
	ldr r4, _0800E47C
	ldr r1, _0800E480
	adds r0, r4, 0
	bl LZDecompressVram
	ldr r1, _0800E484
	adds r0, r4, 0
	bl LZDecompressVram
	ldr r0, _0800E488
	ldr r1, _0800E48C
	bl LZDecompressVram
	ldr r0, _0800E490
	movs r1, 0x60
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0800E494
	ldr r2, _0800E498
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0800E49C
	movs r1, 0x36
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r0, _0800E4A0
	ldr r2, _0800E4A4
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0800E4A8
	strh r1, [r0]
	ldr r0, _0800E4AC
	bl LoadCompressedObjectPic
	b _0800E5D0
	.align 2, 0
_0800E470: .4byte gUnknown_020239F8
_0800E474: .4byte gVersusFrameGfx
_0800E478: .4byte 0x06004000
_0800E47C: .4byte gVersusFrameTilemap
_0800E480: .4byte 0x0600e000
_0800E484: .4byte 0x0600f000
_0800E488: .4byte gUnknown_08E5DC2C
_0800E48C: .4byte 0x06010000
_0800E490: .4byte gVersusFramePal
_0800E494: .4byte 0x0400000a
_0800E498: .4byte 0x00005c04
_0800E49C: .4byte 0x04000048
_0800E4A0: .4byte gUnknown_030041B4
_0800E4A4: .4byte 0x0000ff5c
_0800E4A8: .4byte gUnknown_03004280
_0800E4AC: .4byte gUnknown_081F95A4
_0800E4B0:
	ldr r0, _0800E4C4
	ands r0, r1
	cmp r0, 0
	beq _0800E4D4
	ldr r0, _0800E4C8
	ldr r1, _0800E4CC
	bl LZDecompressVram
	ldr r0, _0800E4D0
	b _0800E5A6
	.align 2, 0
_0800E4C4: .4byte 0x00000902
_0800E4C8: .4byte gBattleTerrainAnimTiles_Building
_0800E4CC: .4byte 0x06004000
_0800E4D0: .4byte gBattleTerrainAnimTilemap_Building
_0800E4D4:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800E51C
	ldr r0, _0800E4F4
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800E504
	ldr r0, _0800E4F8
	ldr r1, _0800E4FC
	bl LZDecompressVram
	ldr r0, _0800E500
	b _0800E5A6
	.align 2, 0
_0800E4F4: .4byte gGameVersion
_0800E4F8: .4byte gBattleTerrainAnimTiles_Cave
_0800E4FC: .4byte 0x06004000
_0800E500: .4byte gBattleTerrainAnimTilemap_Cave
_0800E504:
	ldr r0, _0800E510
	ldr r1, _0800E514
	bl LZDecompressVram
	ldr r0, _0800E518
	b _0800E5A6
	.align 2, 0
_0800E510: .4byte gBattleTerrainAnimTiles_Underwater
_0800E514: .4byte 0x06004000
_0800E518: .4byte gBattleTerrainAnimTilemap_Underwater
_0800E51C:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800E574
	ldr r2, _0800E544
	ldr r0, _0800E548
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x19
	bne _0800E558
	ldr r0, _0800E54C
	ldr r1, _0800E550
	bl LZDecompressVram
	ldr r0, _0800E554
	b _0800E5A6
	.align 2, 0
_0800E544: .4byte gTrainers
_0800E548: .4byte gTrainerBattleOpponent
_0800E54C: .4byte gBattleTerrainAnimTiles_Building
_0800E550: .4byte 0x06004000
_0800E554: .4byte gBattleTerrainAnimTilemap_Building
_0800E558:
	cmp r0, 0x20
	bne _0800E574
	ldr r0, _0800E568
	ldr r1, _0800E56C
	bl LZDecompressVram
	ldr r0, _0800E570
	b _0800E5A6
	.align 2, 0
_0800E568: .4byte gBattleTerrainAnimTiles_Building
_0800E56C: .4byte 0x06004000
_0800E570: .4byte gBattleTerrainAnimTilemap_Building
_0800E574:
	bl sav1_map_get_battletype
	lsls r0, 24
	cmp r0, 0
	bne _0800E5C0
	ldr r4, _0800E5B0
	ldr r5, _0800E5B4
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0800E5B8
	bl LZDecompressVram
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r4, 0xC
	adds r0, r4
	ldr r0, [r0]
_0800E5A6:
	ldr r1, _0800E5BC
	bl LZDecompressVram
	b _0800E5D0
	.align 2, 0
_0800E5B0: .4byte gBattleTerrainTable
_0800E5B4: .4byte gUnknown_0300428C
_0800E5B8: .4byte 0x06004000
_0800E5BC: .4byte 0x0600e000
_0800E5C0:
	ldr r0, _0800E5D8
	ldr r1, _0800E5DC
	bl LZDecompressVram
	ldr r0, _0800E5E0
	ldr r1, _0800E5E4
	bl LZDecompressVram
_0800E5D0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E5D8: .4byte gBattleTerrainAnimTiles_Building
_0800E5DC: .4byte 0x06004000
_0800E5E0: .4byte gBattleTerrainAnimTilemap_Building
_0800E5E4: .4byte 0x0600e000
	thumb_func_end sub_800E23C

	thumb_func_start sub_800E414
sub_800E414: @ 800E5E8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	cmp r0, 0x6
	bls _0800E5F6
	b _0800E98E
_0800E5F6:
	lsls r0, 2
	ldr r1, _0800E600
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E600: .4byte _0800E604
	.align 2, 0
_0800E604:
	.4byte _0800E620
	.4byte _0800E630
	.4byte _0800E648
	.4byte _0800E658
	.4byte _0800E764
	.4byte _0800E870
	.4byte _0800E988
_0800E620:
	ldr r0, _0800E62C
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _0800E990
	.align 2, 0
_0800E62C: .4byte gUnknown_08D00000
_0800E630:
	ldr r0, _0800E640
	ldr r1, _0800E644
	movs r2, 0x80
	lsls r2, 4
	bl CpuSet
	b _0800E990
	.align 2, 0
_0800E640: .4byte gUnknown_08D00524
_0800E644: .4byte 0x0600c000
_0800E648:
	ldr r0, _0800E654
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	b _0800E990
	.align 2, 0
_0800E654: .4byte gUnknown_08D004E0
_0800E658:
	ldr r0, _0800E67C
	ldrh r1, [r0]
	ldr r0, _0800E680
	ands r0, r1
	cmp r0, 0
	beq _0800E666
	b _0800E750
_0800E666:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800E694
	ldr r0, _0800E684
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800E68C
	ldr r0, _0800E688
	b _0800E752
	.align 2, 0
_0800E67C: .4byte gUnknown_020239F8
_0800E680: .4byte 0x00000902
_0800E684: .4byte gGameVersion
_0800E688: .4byte gBattleTerrainTiles_Cave
_0800E68C:
	ldr r0, _0800E690
	b _0800E752
	.align 2, 0
_0800E690: .4byte gBattleTerrainTiles_Water
_0800E694:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800E6C4
	ldr r2, _0800E6B8
	ldr r0, _0800E6BC
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x19
	beq _0800E750
	cmp r0, 0x20
	bne _0800E6C4
	ldr r0, _0800E6C0
	b _0800E752
	.align 2, 0
_0800E6B8: .4byte gTrainers
_0800E6BC: .4byte gTrainerBattleOpponent
_0800E6C0: .4byte gBattleTerrainTiles_Stadium
_0800E6C4:
	bl sav1_map_get_battletype
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _0800E6D2
	b _0800E990
_0800E6D2:
	lsls r0, 2
	ldr r1, _0800E6DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E6DC: .4byte _0800E6E0
	.align 2, 0
_0800E6E0:
	.4byte _0800E704
	.4byte _0800E750
	.4byte _0800E720
	.4byte _0800E728
	.4byte _0800E730
	.4byte _0800E738
	.4byte _0800E740
	.4byte _0800E748
	.4byte _0800E750
_0800E704:
	ldr r2, _0800E718
	ldr r0, _0800E71C
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	b _0800E752
	.align 2, 0
_0800E718: .4byte gBattleTerrainTable
_0800E71C: .4byte gUnknown_0300428C
_0800E720:
	ldr r0, _0800E724
	b _0800E752
	.align 2, 0
_0800E724: .4byte gBattleTerrainTiles_Stadium
_0800E728:
	ldr r0, _0800E72C
	b _0800E752
	.align 2, 0
_0800E72C: .4byte gBattleTerrainTiles_Stadium
_0800E730:
	ldr r0, _0800E734
	b _0800E752
	.align 2, 0
_0800E734: .4byte gBattleTerrainTiles_Stadium
_0800E738:
	ldr r0, _0800E73C
	b _0800E752
	.align 2, 0
_0800E73C: .4byte gBattleTerrainTiles_Stadium
_0800E740:
	ldr r0, _0800E744
	b _0800E752
	.align 2, 0
_0800E744: .4byte gBattleTerrainTiles_Stadium
_0800E748:
	ldr r0, _0800E74C
	b _0800E752
	.align 2, 0
_0800E74C: .4byte gBattleTerrainTiles_Stadium
_0800E750:
	ldr r0, _0800E75C
_0800E752:
	ldr r1, _0800E760
	bl LZDecompressVram
	b _0800E990
	.align 2, 0
_0800E75C: .4byte gBattleTerrainTiles_Building
_0800E760: .4byte 0x06008000
_0800E764:
	ldr r0, _0800E788
	ldrh r1, [r0]
	ldr r0, _0800E78C
	ands r0, r1
	cmp r0, 0
	beq _0800E772
	b _0800E85C
_0800E772:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800E7A0
	ldr r0, _0800E790
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800E798
	ldr r0, _0800E794
	b _0800E85E
	.align 2, 0
_0800E788: .4byte gUnknown_020239F8
_0800E78C: .4byte 0x00000902
_0800E790: .4byte gGameVersion
_0800E794: .4byte gBattleTerrainTilemap_Cave
_0800E798:
	ldr r0, _0800E79C
	b _0800E85E
	.align 2, 0
_0800E79C: .4byte gBattleTerrainTilemap_Water
_0800E7A0:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800E7D0
	ldr r2, _0800E7C4
	ldr r0, _0800E7C8
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x19
	beq _0800E85C
	cmp r0, 0x20
	bne _0800E7D0
	ldr r0, _0800E7CC
	b _0800E85E
	.align 2, 0
_0800E7C4: .4byte gTrainers
_0800E7C8: .4byte gTrainerBattleOpponent
_0800E7CC: .4byte gBattleTerrainTilemap_Stadium
_0800E7D0:
	bl sav1_map_get_battletype
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _0800E7DE
	b _0800E990
_0800E7DE:
	lsls r0, 2
	ldr r1, _0800E7E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E7E8: .4byte _0800E7EC
	.align 2, 0
_0800E7EC:
	.4byte _0800E810
	.4byte _0800E85C
	.4byte _0800E82C
	.4byte _0800E834
	.4byte _0800E83C
	.4byte _0800E844
	.4byte _0800E84C
	.4byte _0800E854
	.4byte _0800E85C
_0800E810:
	ldr r2, _0800E824
	ldr r0, _0800E828
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	b _0800E85E
	.align 2, 0
_0800E824: .4byte gBattleTerrainTable
_0800E828: .4byte gUnknown_0300428C
_0800E82C:
	ldr r0, _0800E830
	b _0800E85E
	.align 2, 0
_0800E830: .4byte gBattleTerrainTilemap_Stadium
_0800E834:
	ldr r0, _0800E838
	b _0800E85E
	.align 2, 0
_0800E838: .4byte gBattleTerrainTilemap_Stadium
_0800E83C:
	ldr r0, _0800E840
	b _0800E85E
	.align 2, 0
_0800E840: .4byte gBattleTerrainTilemap_Stadium
_0800E844:
	ldr r0, _0800E848
	b _0800E85E
	.align 2, 0
_0800E848: .4byte gBattleTerrainTilemap_Stadium
_0800E84C:
	ldr r0, _0800E850
	b _0800E85E
	.align 2, 0
_0800E850: .4byte gBattleTerrainTilemap_Stadium
_0800E854:
	ldr r0, _0800E858
	b _0800E85E
	.align 2, 0
_0800E858: .4byte gBattleTerrainTilemap_Stadium
_0800E85C:
	ldr r0, _0800E868
_0800E85E:
	ldr r1, _0800E86C
	bl LZDecompressVram
	b _0800E990
	.align 2, 0
_0800E868: .4byte gBattleTerrainTilemap_Building
_0800E86C: .4byte 0x0600d000
_0800E870:
	ldr r0, _0800E894
	ldrh r1, [r0]
	ldr r0, _0800E898
	ands r0, r1
	cmp r0, 0
	beq _0800E87E
	b _0800E978
_0800E87E:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _0800E8AC
	ldr r0, _0800E89C
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0800E8A4
	ldr r0, _0800E8A0
	b _0800E97A
	.align 2, 0
_0800E894: .4byte gUnknown_020239F8
_0800E898: .4byte 0x00000902
_0800E89C: .4byte gGameVersion
_0800E8A0: .4byte gBattleTerrainPalette_Groudon
_0800E8A4:
	ldr r0, _0800E8A8
	b _0800E97A
	.align 2, 0
_0800E8A8: .4byte gBattleTerrainPalette_Kyogre
_0800E8AC:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0800E8E4
	ldr r2, _0800E8CC
	ldr r0, _0800E8D0
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0x19
	bne _0800E8D8
	ldr r0, _0800E8D4
	b _0800E97A
	.align 2, 0
_0800E8CC: .4byte gTrainers
_0800E8D0: .4byte gTrainerBattleOpponent
_0800E8D4: .4byte gBattleTerrainPalette_BuildingLeader
_0800E8D8:
	cmp r0, 0x20
	bne _0800E8E4
	ldr r0, _0800E8E0
	b _0800E97A
	.align 2, 0
_0800E8E0: .4byte gBattleTerrainPalette_StadiumSteven
_0800E8E4:
	bl sav1_map_get_battletype
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bhi _0800E990
	lsls r0, 2
	ldr r1, _0800E8FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E8FC: .4byte _0800E900
	.align 2, 0
_0800E900:
	.4byte _0800E924
	.4byte _0800E940
	.4byte _0800E948
	.4byte _0800E950
	.4byte _0800E958
	.4byte _0800E960
	.4byte _0800E968
	.4byte _0800E970
	.4byte _0800E978
_0800E924:
	ldr r2, _0800E938
	ldr r0, _0800E93C
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x10
	adds r0, r2
	ldr r0, [r0]
	b _0800E97A
	.align 2, 0
_0800E938: .4byte gBattleTerrainTable
_0800E93C: .4byte gUnknown_0300428C
_0800E940:
	ldr r0, _0800E944
	b _0800E97A
	.align 2, 0
_0800E944: .4byte gBattleTerrainPalette_BuildingGym
_0800E948:
	ldr r0, _0800E94C
	b _0800E97A
	.align 2, 0
_0800E94C: .4byte gBattleTerrainPalette_StadiumMagma
_0800E950:
	ldr r0, _0800E954
	b _0800E97A
	.align 2, 0
_0800E954: .4byte gBattleTerrainPalette_StadiumAqua
_0800E958:
	ldr r0, _0800E95C
	b _0800E97A
	.align 2, 0
_0800E95C: .4byte gBattleTerrainPalette_StadiumSidney
_0800E960:
	ldr r0, _0800E964
	b _0800E97A
	.align 2, 0
_0800E964: .4byte gBattleTerrainPalette_StadiumPhoebe
_0800E968:
	ldr r0, _0800E96C
	b _0800E97A
	.align 2, 0
_0800E96C: .4byte gBattleTerrainPalette_StadiumGlacia
_0800E970:
	ldr r0, _0800E974
	b _0800E97A
	.align 2, 0
_0800E974: .4byte gBattleTerrainPalette_StadiumDrake
_0800E978:
	ldr r0, _0800E984
_0800E97A:
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	b _0800E990
	.align 2, 0
_0800E984: .4byte gBattleTerrainPalette_BattleTower
_0800E988:
	bl sub_800D74C
	b _0800E990
_0800E98E:
	movs r4, 0x1
_0800E990:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_800E414

	thumb_func_start sub_800E7C4
sub_800E7C4: @ 800E998
	push {lr}
	ldr r0, _0800E9B8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800E9C4
	bl sub_800B858
	ldr r0, _0800E9BC
	bl SetMainCallback2
	ldr r1, _0800E9C0
	movs r0, 0
	strb r0, [r1]
	b _0800E9C8
	.align 2, 0
_0800E9B8: .4byte gUnknown_020239F8
_0800E9BC: .4byte sub_800F104
_0800E9C0: .4byte gUnknown_02024D1E
_0800E9C4:
	bl sub_800E7F8
_0800E9C8:
	pop {r0}
	bx r0
	thumb_func_end sub_800E7C4

	thumb_func_start sub_800E7F8
sub_800E7F8: @ 800E9CC
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r4, 0
	str r4, [sp]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0800EAE0
	mov r0, sp
	bl CpuSet
	ldr r0, _0800EAE4
	strh r4, [r0]
	subs r0, 0xC
	movs r2, 0xF0
	strh r2, [r0]
	adds r0, 0x4
	ldr r3, _0800EAE8
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r0, _0800EAEC
	strh r2, [r0]
	ldr r0, _0800EAF0
	strh r1, [r0]
	bl dp12_8087EA4
	ldr r0, _0800EAF4
	movs r3, 0xF0
	movs r5, 0xF0
	lsls r5, 3
	adds r2, r0, r5
	movs r1, 0x4F
_0800EA1E:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0800EA1E
	movs r1, 0x50
	ldr r4, _0800EAF8
	ldr r0, _0800EAF4
	ldr r3, _0800EAFC
	movs r5, 0x82
	lsls r5, 4
	adds r2, r0, r5
	adds r0, 0xA0
_0800EA3C:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	ble _0800EA3C
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	bl sub_80895F8
	ldr r4, _0800EB00
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _0800EB04
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0800EB08
	strh r1, [r0]
	ldr r0, _0800EB0C
	strh r1, [r0]
	ldr r0, _0800EB10
	strh r1, [r0]
	ldr r0, _0800EB14
	strh r1, [r0]
	ldr r0, _0800EB18
	strh r1, [r0]
	ldr r0, _0800EB1C
	strh r1, [r0]
	ldr r0, _0800EB20
	strh r1, [r0]
	bl sub_8081D3C
	ldr r1, _0800EB24
	strb r0, [r1]
	ldr r0, _0800EB28
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r0, _0800EB2C
	ldr r1, _0800EB30
	bl InitWindowFromConfig
	ldr r0, _0800EB34
	ldr r1, _0800EB38
	bl InitWindowFromConfig
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl ResetTasks
	bl sub_800E23C
	bl FreeAllSpritePalettes
	ldr r1, _0800EB3C
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _0800EB40
	bl SetVBlankCallback
	bl sub_800B884
	ldr r0, _0800EB44
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800EB4C
	ldr r0, _0800EB48
	bl SetMainCallback2
	b _0800EB52
	.align 2, 0
_0800EAE0: .4byte 0x05006000
_0800EAE4: .4byte 0x0400004c
_0800EAE8: .4byte 0x00005051
_0800EAEC: .4byte gUnknown_030042C4
_0800EAF0: .4byte gUnknown_03004240
_0800EAF4: .4byte gUnknown_03004DE0
_0800EAF8: .4byte gUnknown_081F9674
_0800EAFC: .4byte 0x0000ff10
_0800EB00: .4byte gWindowConfig_81E6C58
_0800EB04: .4byte gUnknown_030042A4
_0800EB08: .4byte gUnknown_030042A0
_0800EB0C: .4byte gUnknown_030042C0
_0800EB10: .4byte gUnknown_030041B4
_0800EB14: .4byte gUnknown_03004288
_0800EB18: .4byte gUnknown_03004280
_0800EB1C: .4byte gUnknown_030041B0
_0800EB20: .4byte gUnknown_030041B8
_0800EB24: .4byte gUnknown_0300428C
_0800EB28: .4byte gUnknown_03004210
_0800EB2C: .4byte gUnknown_030041D0
_0800EB30: .4byte gWindowConfig_81E71D0
_0800EB34: .4byte gUnknown_03004250
_0800EB38: .4byte gWindowConfig_81E71EC
_0800EB3C: .4byte gReservedSpritePaletteCount
_0800EB40: .4byte sub_800FCFC
_0800EB44: .4byte gUnknown_020239F8
_0800EB48: .4byte sub_800F298
_0800EB4C:
	ldr r0, _0800EBA0
	bl SetMainCallback2
_0800EB52:
	ldr r0, _0800EBA4
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0800EB6C
	ldr r0, _0800EBA8
	ldr r1, _0800EBAC
	ldrh r1, [r1]
	bl sub_800F8E8
	bl sub_8040C38
_0800EB6C:
	ldr r0, _0800EBB0
	ldr r1, _0800EBB4
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r4, _0800EBB8
	movs r3, 0xFA
	lsls r3, 1
	adds r5, r4, r3
_0800EB82:
	adds r0, r4, 0
	movs r1, 0x3
	bl AdjustFriendship
	adds r4, 0x64
	cmp r4, r5
	ble _0800EB82
	movs r1, 0
	ldr r0, _0800EBBC
	strb r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EBA0: .4byte sub_800EC9C
_0800EBA4: .4byte gUnknown_020239F8
_0800EBA8: .4byte gEnemyParty
_0800EBAC: .4byte gTrainerBattleOpponent
_0800EBB0: .4byte gMain
_0800EBB4: .4byte 0x0000043d
_0800EBB8: .4byte gPlayerParty
_0800EBBC: .4byte gUnknown_02024D1E
	thumb_func_end sub_800E7F8

	thumb_func_start sub_800E9EC
sub_800E9EC: @ 800EBC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	mov r9, r6
	movs r0, 0xCE
	lsls r0, 1
	mov r10, r0
	mov r8, r6
_0800EBD6:
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0800EC78
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _0800EC52
	cmp r5, r10
	beq _0800EC1E
	cmp r7, 0
	beq _0800EC1E
	cmp r1, 0
	bne _0800EC1E
	movs r0, 0x1
	mov r2, r8
	lsls r0, r2
	orrs r6, r0
	lsls r0, r6, 16
	lsrs r6, r0, 16
_0800EC1E:
	cmp r5, 0
	beq _0800EC52
	cmp r7, 0
	beq _0800EC3A
	cmp r5, r10
	beq _0800EC2E
	cmp r1, 0
	beq _0800EC3A
_0800EC2E:
	movs r0, 0x2
	mov r1, r8
	lsls r0, r1
	orrs r6, r0
	lsls r0, r6, 16
	lsrs r6, r0, 16
_0800EC3A:
	cmp r5, 0
	beq _0800EC52
	cmp r5, r10
	beq _0800EC52
	cmp r7, 0
	bne _0800EC52
	movs r0, 0x3
	mov r2, r8
	lsls r0, r2
	orrs r6, r0
	lsls r0, r6, 16
	lsrs r6, r0, 16
_0800EC52:
	movs r0, 0x2
	add r8, r0
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	cmp r2, 0x5
	ble _0800EBD6
	ldr r1, _0800EC7C
	strb r6, [r1, 0x2]
	lsrs r0, r6, 8
	strb r0, [r1, 0x3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC78: .4byte gPlayerParty
_0800EC7C: .4byte 0x02000000
	thumb_func_end sub_800E9EC

	thumb_func_start sub_800EAAC
sub_800EAAC: @ 800EC80
	push {r4-r6,lr}
	ldr r4, _0800ECC8
	movs r2, 0
	ldr r6, _0800ECCC
	ldr r0, _0800ECD0
	adds r3, r6, r0
_0800EC8C:
	adds r0, r4, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _0800EC8C
	movs r2, 0
	adds r3, r4, 0
	adds r3, 0x8
	ldr r5, _0800ECD4
_0800ECA2:
	adds r0, r3, r2
	adds r1, r2, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x11
	ble _0800ECA2
	ldr r1, _0800ECD8
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r4, 0x7]
	adds r1, 0x1
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r4, 0x1A]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800ECC8: .4byte 0x02000004
_0800ECCC: .4byte gSaveBlock1
_0800ECD0: .4byte 0x00003160
_0800ECD4: .4byte 0x02028daa
_0800ECD8: .4byte 0x00003688
	thumb_func_end sub_800EAAC

	thumb_func_start sub_800EB08
sub_800EB08: @ 800ECDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800ED58
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0800ED78
	movs r3, 0
	ldr r5, _0800ED5C
	ldr r0, _0800ED60
	mov r12, r0
	adds r7, r5, 0
	ldr r6, _0800ED64
	add r6, r12
	adds r4, r5, 0
	adds r4, 0x38
_0800ED04:
	adds r1, r3, r7
	adds r2, r3, r6
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r3, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x6
	ble _0800ED04
	movs r3, 0
	ldr r4, _0800ED68
	ldr r7, _0800ED6C
	adds r6, r4, 0
	adds r6, 0x38
_0800ED22:
	adds r1, r3, r4
	adds r2, r3, r7
	ldrb r0, [r2]
	strb r0, [r1]
	adds r1, r3, r6
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x11
	ble _0800ED22
	ldr r1, _0800ED70
	add r1, r12
	ldrb r0, [r1]
	strb r0, [r5, 0x7]
	ldrb r0, [r1]
	adds r1, r5, 0
	adds r1, 0x3F
	strb r0, [r1]
	ldr r1, _0800ED74
	add r1, r12
	ldrb r0, [r1]
	strb r0, [r5, 0x1A]
	ldrb r1, [r1]
	adds r0, r5, 0
	adds r0, 0x52
	strb r1, [r0]
	b _0800EDFC
	.align 2, 0
_0800ED58: .4byte gUnknown_020239F8
_0800ED5C: .4byte gEnigmaBerries
_0800ED60: .4byte gSaveBlock1
_0800ED64: .4byte 0x00003160
_0800ED68: .4byte gUnknown_02024DF8
_0800ED6C: .4byte 0x02028daa
_0800ED70: .4byte 0x00003688
_0800ED74: .4byte 0x00003689
_0800ED78:
	movs r0, 0x40
	ands r0, r1
	movs r1, 0x2
	mov r8, r1
	cmp r0, 0
	beq _0800ED88
	movs r0, 0x4
	mov r8, r0
_0800ED88:
	movs r3, 0
	cmp r3, r8
	bge _0800EDFC
	ldr r1, _0800EE0C
	mov r12, r1
	ldr r0, _0800EE10
	mov r10, r0
	movs r1, 0x8
	add r1, r12
	mov r9, r1
_0800ED9C:
	lsls r0, r3, 8
	mov r1, r10
	adds r5, r0, r1
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	ldr r1, _0800EE14
	adds r0, r1
	ldrb r4, [r0, 0x18]
	movs r2, 0
	adds r7, r3, 0x1
	lsls r1, r4, 3
	subs r0, r1, r4
	adds r6, r1, 0
	lsls r0, 2
	mov r1, r12
	adds r3, r0, r1
_0800EDBE:
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x6
	ble _0800EDBE
	movs r2, 0
	subs r0, r6, r4
	lsls r0, 2
	mov r1, r9
	adds r3, r0, r1
	adds r1, r5, 0
	adds r1, 0x8
_0800EDDA:
	adds r0, r1, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x11
	ble _0800EDDA
	subs r0, r6, r4
	lsls r0, 2
	add r0, r12
	ldrb r1, [r5, 0x7]
	strb r1, [r0, 0x7]
	ldrb r1, [r5, 0x1A]
	strb r1, [r0, 0x1A]
	adds r3, r7, 0
	cmp r3, r8
	blt _0800ED9C
_0800EDFC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE0C: .4byte gEnigmaBerries
_0800EE10: .4byte 0x03002b94
_0800EE14: .4byte gLinkPlayers
	thumb_func_end sub_800EB08

	thumb_func_start shedinja_something
shedinja_something: @ 800EE18
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	add r5, sp, 0xC
	movs r0, 0x1
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0800EE68
	cmp r0, r1
	bne _0800EE60
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonData
	ldrb r1, [r5]
	cmp r0, r1
	beq _0800EE60
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r1, _0800EE6C
	mov r0, sp
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _0800EE60
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r5, 0
	bl SetMonData
_0800EE60:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE68: .4byte 0x0000012f
_0800EE6C: .4byte gUnknown_081F96C8
	thumb_func_end shedinja_something

	thumb_func_start sub_800EC9C
sub_800EC9C: @ 800EE70
	push {r4-r7,lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800EEA8
	ldr r1, _0800EEAC
	adds r0, r1
	strb r4, [r0]
	movs r0, 0x1
	adds r5, r4, 0
	eors r5, r0
	ldr r0, _0800EEB0
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _0800EE9E
	b _0800F1DC
_0800EE9E:
	lsls r0, 2
	ldr r1, _0800EEB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EEA8: .4byte 0x02000000
_0800EEAC: .4byte 0x000160cb
_0800EEB0: .4byte gUnknown_02024D1E
_0800EEB4: .4byte _0800EEB8
	.align 2, 0
_0800EEB8:
	.4byte _0800EEE0
	.4byte _0800EF50
	.4byte _0800F05C
	.4byte _0800F080
	.4byte _0800F0AC
	.4byte _0800F0D0
	.4byte _0800F0FC
	.4byte _0800F11C
	.4byte _0800F188
	.4byte _0800F1A0
_0800EEE0:
	ldr r2, _0800EF28
	ldrh r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800EF38
	ldr r0, _0800EF2C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800EEF6
	b _0800F1DC
_0800EEF6:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800EF02
	b _0800F1DC
_0800EF02:
	ldr r4, _0800EF30
	movs r5, 0x1
	strb r5, [r4]
	strb r5, [r4, 0x1]
	bl sub_800E9EC
	bl sub_800EAAC
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x20
	bl SendBlock
	ldr r0, _0800EF34
	strb r5, [r0]
	b _0800F1DC
	.align 2, 0
_0800EF28: .4byte gUnknown_020239F8
_0800EF2C: .4byte gReceivedRemoteLinkPlayers
_0800EF30: .4byte 0x02000000
_0800EF34: .4byte gUnknown_02024D1E
_0800EF38:
	movs r0, 0x4
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0800EF4C
	movs r0, 0x8
	strb r0, [r1]
	bl sub_800EB08
	b _0800F1DC
	.align 2, 0
_0800EF4C: .4byte gUnknown_02024D1E
_0800EF50:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	beq _0800EF5E
	b _0800F1DC
_0800EF5E:
	bl ResetBlockReceivedFlags
	movs r3, 0
	ldr r0, _0800EF7C
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bne _0800EF90
	cmp r4, 0
	bne _0800EF84
	ldr r0, _0800EF80
	ldrh r1, [r0]
	movs r2, 0xC
	b _0800EF8A
	.align 2, 0
_0800EF7C: .4byte gBlockRecvBuffer
_0800EF80: .4byte gUnknown_020239F8
_0800EF84:
	ldr r0, _0800EFB4
	ldrh r1, [r0]
	movs r2, 0x8
_0800EF8A:
	orrs r1, r2
	strh r1, [r0]
	adds r3, 0x1
_0800EF90:
	lsls r7, r5, 8
	cmp r3, 0
	bne _0800F00C
	ldr r0, _0800EFB8
	movs r1, 0x80
	lsls r1, 1
	adds r2, r0, r1
	ldrh r1, [r0]
	adds r6, r0, 0
	ldrh r2, [r2]
	cmp r1, r2
	bne _0800EFC8
	cmp r4, 0
	bne _0800EFBC
	ldr r0, _0800EFB4
	ldrh r1, [r0]
	movs r2, 0xC
	b _0800EFC2
	.align 2, 0
_0800EFB4: .4byte gUnknown_020239F8
_0800EFB8: .4byte gBlockRecvBuffer
_0800EFBC:
	ldr r0, _0800EFD8
	ldrh r1, [r0]
	movs r2, 0x8
_0800EFC2:
	orrs r1, r2
	strh r1, [r0]
	adds r3, 0x1
_0800EFC8:
	lsls r7, r5, 8
	cmp r3, 0
	bne _0800F00C
	ldrh r1, [r6]
	ldr r0, _0800EFDC
	ldr r2, _0800EFD8
	b _0800EFEE
	.align 2, 0
_0800EFD8: .4byte gUnknown_020239F8
_0800EFDC: .4byte 0x00000101
_0800EFE0:
	adds r3, 0x1
	cmp r3, 0x1
	bgt _0800EFF6
	lsls r0, r3, 8
	adds r0, r6
	ldrh r1, [r0]
	ldr r0, _0800F000
_0800EFEE:
	cmp r1, r0
	bls _0800EFE0
	cmp r3, r4
	beq _0800EFE0
_0800EFF6:
	cmp r3, 0x2
	bne _0800F004
	ldrh r0, [r2]
	movs r1, 0xC
	b _0800F008
	.align 2, 0
_0800F000: .4byte 0x00000101
_0800F004:
	ldrh r0, [r2]
	movs r1, 0x8
_0800F008:
	orrs r0, r1
	strh r0, [r2]
_0800F00C:
	bl sub_800EB08
	ldr r0, _0800F04C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800F050
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	movs r1, 0
	movs r0, 0x87
	lsls r0, 1
	strh r0, [r2, 0xA]
	movs r0, 0x5A
	strh r0, [r2, 0xC]
	strh r1, [r2, 0x12]
	ldr r0, _0800F054
	ldrb r1, [r0, 0x2]
	ldrb r0, [r0, 0x3]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2, 0xE]
	ldr r0, _0800F058
	adds r0, 0x2
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	b _0800F16A
	.align 2, 0
_0800F04C: .4byte sub_800DE30
_0800F050: .4byte gTasks
_0800F054: .4byte 0x02000000
_0800F058: .4byte gBlockRecvBuffer
_0800F05C:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800F068
	b _0800F1DC
_0800F068:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800F07C
	movs r2, 0xC8
	bl SendBlock
	b _0800F16A
	.align 2, 0
_0800F07C: .4byte gPlayerParty
_0800F080:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	beq _0800F08E
	b _0800F1DC
_0800F08E:
	bl ResetBlockReceivedFlags
	ldr r0, _0800F0A4
	lsls r1, r5, 8
	ldr r2, _0800F0A8
	adds r1, r2
	movs r2, 0xC8
	bl memcpy
	b _0800F16A
	.align 2, 0
_0800F0A4: .4byte gEnemyParty
_0800F0A8: .4byte gBlockRecvBuffer
_0800F0AC:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800F0B8
	b _0800F1DC
_0800F0B8:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800F0CC
	movs r2, 0xC8
	bl SendBlock
	b _0800F16A
	.align 2, 0
_0800F0CC: .4byte 0x03004438
_0800F0D0:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	beq _0800F0DE
	b _0800F1DC
_0800F0DE:
	bl ResetBlockReceivedFlags
	ldr r0, _0800F0F4
	lsls r1, r5, 8
	ldr r2, _0800F0F8
	adds r1, r2
	movs r2, 0xC8
	bl memcpy
	b _0800F16A
	.align 2, 0
_0800F0F4: .4byte 0x03004698
_0800F0F8: .4byte gBlockRecvBuffer
_0800F0FC:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0800F1DC
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800F118
	movs r2, 0xC8
	bl SendBlock
	b _0800F16A
	.align 2, 0
_0800F118: .4byte 0x03004500
_0800F11C:
	bl GetBlockReceivedStatus
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x3
	bne _0800F1DC
	bl ResetBlockReceivedFlags
	ldr r4, _0800F174
	lsls r1, r5, 8
	ldr r0, _0800F178
	adds r1, r0
	adds r0, r4, 0
	movs r2, 0xC8
	bl memcpy
	ldr r1, _0800F17C
	adds r0, r4, r1
	bl shedinja_something
	ldr r1, _0800F180
	adds r0, r4, r1
	bl shedinja_something
	adds r0, r4, 0
	subs r0, 0xC8
	bl shedinja_something
	adds r0, r4, 0
	subs r0, 0x64
	bl shedinja_something
	adds r0, r4, 0
	bl shedinja_something
	adds r0, r4, 0
	adds r0, 0x64
	bl shedinja_something
_0800F16A:
	ldr r1, _0800F184
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0800F1DC
	.align 2, 0
_0800F174: .4byte 0x03004760
_0800F178: .4byte gBlockRecvBuffer
_0800F17C: .4byte 0xfffffe70
_0800F180: .4byte 0xfffffed4
_0800F184: .4byte gUnknown_02024D1E
_0800F188:
	bl sub_800B950
	ldr r0, _0800F19C
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r2, [r0, 0x2]
	b _0800F1DC
	.align 2, 0
_0800F19C: .4byte gUnknown_02024D1E
_0800F1A0:
	ldr r0, _0800F1E4
	adds r1, r0, 0x1
	bl battle_load_something
	lsls r0, 24
	cmp r0, 0
	beq _0800F1DC
	ldr r2, _0800F1E8
	ldr r1, _0800F1EC
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0800F1F0
	str r0, [r1]
	ldr r0, _0800F1F4
	bl SetMainCallback2
	ldr r3, _0800F1F8
	ldrh r2, [r3]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0800F1DC
	ldr r1, _0800F1FC
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	strh r0, [r1]
	movs r0, 0x20
	orrs r0, r2
	strh r0, [r3]
_0800F1DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F1E4: .4byte gUnknown_02024D1F
_0800F1E8: .4byte gUnknown_030042D0
_0800F1EC: .4byte gMain
_0800F1F0: .4byte sub_8010824
_0800F1F4: .4byte sub_800F808
_0800F1F8: .4byte gUnknown_020239F8
_0800F1FC: .4byte gTrainerBattleOpponent
	thumb_func_end sub_800EC9C

	thumb_func_start sub_800F02C
sub_800F02C: @ 800F200
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r8, r0
	ldr r7, _0800F2CC
	mov r10, r7
_0800F212:
	mov r1, r8
	lsls r6, r1, 5
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r0, _0800F2D0
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	movs r1, 0x4
	negs r1, r1
	add r1, r10
	mov r9, r1
	adds r5, r6, r1
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	strh r0, [r5, 0x2]
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r7, 0
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	strb r0, [r5, 0xF]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r5, 0x12]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	mov r1, r10
	adds r1, 0x10
	adds r6, r1
	str r0, [r6]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r7, 0x14]
	adds r0, r4, 0
	bl GetMonGender
	strb r0, [r5, 0x1C]
	adds r0, r7, 0
	bl StripExtCtrlCodes
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonData
	strb r0, [r5, 0x1D]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0800F2A8
	adds r0, r7, 0
	movs r1, 0
	bl sub_814A518
_0800F2A8:
	adds r7, 0x20
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x2
	ble _0800F212
	ldr r0, _0800F2D4
	mov r1, r9
	movs r2, 0x60
	bl memcpy
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2CC: .4byte gUnknown_02023A04
_0800F2D0: .4byte gPlayerParty
_0800F2D4: .4byte 0x02000000
	thumb_func_end sub_800F02C

	thumb_func_start sub_800F104
sub_800F104: @ 800F2D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _0800F31C
	ldr r1, _0800F320
	adds r0, r4, r1
	strb r6, [r0]
	ldr r2, _0800F324
	adds r2, r4
	mov r9, r2
	ldr r0, _0800F328
	adds r0, r4
	mov r8, r0
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r5, _0800F32C
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _0800F374
	cmp r0, 0x1
	bgt _0800F330
	cmp r0, 0
	beq _0800F33C
	b _0800F44E
	.align 2, 0
_0800F31C: .4byte 0x02000000
_0800F320: .4byte 0x000160cb
_0800F324: .4byte 0x000160c4
_0800F328: .4byte 0x000160c2
_0800F32C: .4byte gUnknown_02024D1E
_0800F330:
	cmp r0, 0x2
	beq _0800F414
	cmp r0, 0x3
	bne _0800F33A
	b _0800F430
_0800F33A:
	b _0800F44E
_0800F33C:
	ldr r0, _0800F370
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800F346
	b _0800F44E
_0800F346:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800F352
	b _0800F44E
_0800F352:
	bl sub_800F02C
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x60
	bl SendBlock
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0800F44E
	.align 2, 0
_0800F370: .4byte gReceivedRemoteLinkPlayers
_0800F374:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	bne _0800F44E
	bl ResetBlockReceivedFlags
	movs r4, 0
	lsls r0, r6, 3
	subs r0, r6
	lsls r5, r0, 2
	movs r7, 0
_0800F38E:
	cmp r4, r6
	beq _0800F3CE
	ldr r2, _0800F3B0
	adds r0, r7, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0800F3B4
	adds r0, r5, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800F3C0
	b _0800F3CE
	.align 2, 0
_0800F3B0: .4byte gLinkPlayers
_0800F3B4:
	adds r0, r5, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800F3CE
_0800F3C0:
	lsls r1, r4, 8
	ldr r0, _0800F3FC
	adds r1, r0
	ldr r0, _0800F400
	movs r2, 0x60
	bl memcpy
_0800F3CE:
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _0800F38E
	ldr r1, _0800F404
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _0800F408
	ldr r0, [r1, 0x8]
	mov r2, r9
	str r0, [r2]
	ldr r0, _0800F40C
	ldrh r0, [r0]
	mov r2, r8
	strh r0, [r2]
	ldr r0, _0800F410
	str r0, [r1, 0x8]
	movs r0, 0x5
	movs r1, 0
	bl OpenPartyMenu
	b _0800F44E
	.align 2, 0
_0800F3FC: .4byte gBlockRecvBuffer
_0800F400: .4byte gUnknown_02023A00
_0800F404: .4byte gUnknown_02024D1E
_0800F408: .4byte gMain
_0800F40C: .4byte gUnknown_020239F8
_0800F410: .4byte sub_800F104
_0800F414:
	ldr r0, _0800F42C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800F44E
	movs r0, 0x3
	strb r0, [r5]
	bl sub_800832C
	b _0800F44E
	.align 2, 0
_0800F42C: .4byte gPaletteFade
_0800F430:
	ldr r0, _0800F45C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800F44E
	ldr r1, _0800F460
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _0800F464
	mov r2, r9
	ldr r0, [r2]
	str r0, [r1, 0x8]
	ldr r0, _0800F468
	bl SetMainCallback2
_0800F44E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F45C: .4byte gReceivedRemoteLinkPlayers
_0800F460: .4byte gUnknown_020239F8
_0800F464: .4byte gMain
_0800F468: .4byte sub_800E7F8
	thumb_func_end sub_800F104

	thumb_func_start sub_800F298
sub_800F298: @ 800F46C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0800F4A4
	ldr r1, _0800F4A8
	adds r0, r1
	strb r6, [r0]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0800F4AC
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _0800F498
	b _0800F9B4
_0800F498:
	lsls r0, 2
	ldr r1, _0800F4B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F4A4: .4byte 0x02000000
_0800F4A8: .4byte 0x000160cb
_0800F4AC: .4byte gUnknown_02024D1E
_0800F4B0: .4byte _0800F4B4
	.align 2, 0
_0800F4B4:
	.4byte _0800F4D4
	.4byte _0800F514
	.4byte _0800F6B2
	.4byte _0800F6D8
	.4byte _0800F7CC
	.4byte _0800F7F0
	.4byte _0800F960
	.4byte _0800F978
_0800F4D4:
	ldr r0, _0800F50C
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800F4DE
	b _0800F9B4
_0800F4DE:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800F4EA
	b _0800F9B4
_0800F4EA:
	ldr r4, _0800F510
	movs r0, 0x1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	bl sub_800E9EC
	bl sub_800EAAC
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x20
	bl SendBlock
	b _0800F944
	.align 2, 0
_0800F50C: .4byte gReceivedRemoteLinkPlayers
_0800F510: .4byte 0x02000000
_0800F514:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _0800F522
	b _0800F9B4
_0800F522:
	bl ResetBlockReceivedFlags
	movs r4, 0
	ldr r0, _0800F540
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bne _0800F554
	cmp r6, 0
	bne _0800F548
	ldr r0, _0800F544
	ldrh r1, [r0]
	movs r2, 0xC
	b _0800F54E
	.align 2, 0
_0800F540: .4byte gBlockRecvBuffer
_0800F544: .4byte gUnknown_020239F8
_0800F548:
	ldr r0, _0800F584
	ldrh r1, [r0]
	movs r2, 0x8
_0800F54E:
	orrs r1, r2
	strh r1, [r0]
	adds r4, 0x1
_0800F554:
	cmp r4, 0
	bne _0800F5F0
	movs r2, 0
	ldr r1, _0800F588
	adds r5, r1, 0
	movs r3, 0x80
	lsls r3, 1
_0800F562:
	adds r1, r3
	adds r2, 0x1
	cmp r2, 0x3
	bgt _0800F572
	ldrh r0, [r5]
	ldrh r7, [r1]
	cmp r0, r7
	beq _0800F562
_0800F572:
	cmp r2, 0x4
	bne _0800F598
	cmp r6, 0
	bne _0800F58C
	ldr r0, _0800F584
	ldrh r1, [r0]
	movs r2, 0xC
	b _0800F592
	.align 2, 0
_0800F584: .4byte gUnknown_020239F8
_0800F588: .4byte gBlockRecvBuffer
_0800F58C:
	ldr r0, _0800F5DC
	ldrh r1, [r0]
	movs r2, 0x8
_0800F592:
	orrs r1, r2
	strh r1, [r0]
	adds r4, 0x1
_0800F598:
	cmp r4, 0
	bne _0800F5F0
	ldr r0, _0800F5E0
	ldrh r2, [r0]
	ldr r1, _0800F5E4
	adds r3, r0, 0
	ldr r5, _0800F5DC
	cmp r2, r1
	beq _0800F5CA
_0800F5AA:
	lsls r0, r4, 8
	adds r0, r3
	ldrh r0, [r0]
	ldr r1, _0800F5E4
	cmp r0, r1
	bls _0800F5BA
	cmp r4, r6
	bne _0800F5D2
_0800F5BA:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0800F5D2
	lsls r0, r4, 8
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r1
	bne _0800F5AA
_0800F5CA:
	cmp r4, r6
	beq _0800F5AA
	cmp r4, r6
	bge _0800F5AA
_0800F5D2:
	cmp r4, 0x4
	bne _0800F5E8
	ldrh r0, [r5]
	movs r1, 0xC
	b _0800F5EC
	.align 2, 0
_0800F5DC: .4byte gUnknown_020239F8
_0800F5E0: .4byte gBlockRecvBuffer
_0800F5E4: .4byte 0x00000101
_0800F5E8:
	ldrh r0, [r5]
	movs r1, 0x8
_0800F5EC:
	orrs r0, r1
	strh r0, [r5]
_0800F5F0:
	bl sub_800EB08
	ldr r0, _0800F648
	ldr r1, _0800F64C
	movs r2, 0x96
	lsls r2, 1
	bl memcpy
	ldr r0, _0800F650
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800F654
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x87
	lsls r0, 1
	strh r0, [r1, 0xA]
	movs r0, 0x5A
	strh r0, [r1, 0xC]
	strh r2, [r1, 0x12]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
	adds r2, r1, 0
	ldr r0, _0800F658
	adds r3, r0, 0x2
	ldr r6, _0800F65C
	movs r5, 0x3F
	movs r7, 0x80
	lsls r7, 1
	movs r4, 0x3
_0800F638:
	ldrh r0, [r6, 0x18]
	cmp r0, 0x1
	beq _0800F672
	cmp r0, 0x1
	bgt _0800F660
	cmp r0, 0
	beq _0800F66A
	b _0800F698
	.align 2, 0
_0800F648: .4byte 0x0201d000
_0800F64C: .4byte gPlayerParty
_0800F650: .4byte sub_800DE30
_0800F654: .4byte gTasks
_0800F658: .4byte gBlockRecvBuffer
_0800F65C: .4byte gLinkPlayers
_0800F660:
	cmp r0, 0x2
	beq _0800F67A
	cmp r0, 0x3
	beq _0800F68A
	b _0800F698
_0800F66A:
	ldrh r0, [r3]
	adds r1, r5, 0
	ands r1, r0
	b _0800F682
_0800F672:
	ldrh r0, [r3]
	adds r1, r5, 0
	ands r1, r0
	b _0800F692
_0800F67A:
	ldrh r0, [r3]
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 6
_0800F682:
	ldrh r0, [r2, 0xE]
	orrs r1, r0
	strh r1, [r2, 0xE]
	b _0800F698
_0800F68A:
	ldrh r0, [r3]
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 6
_0800F692:
	ldrh r0, [r2, 0x10]
	orrs r1, r0
	strh r1, [r2, 0x10]
_0800F698:
	adds r3, r7
	adds r6, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _0800F638
	bl ZeroPlayerPartyMons
	bl ZeroEnemyPartyMons
	ldr r1, _0800F6D0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0800F6B2:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800F6BE
	b _0800F9B4
_0800F6BE:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800F6D4
	movs r2, 0xC8
	bl SendBlock
	b _0800F944
	.align 2, 0
_0800F6D0: .4byte gUnknown_02024D1E
_0800F6D4: .4byte 0x0201d000
_0800F6D8:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _0800F6E6
	b _0800F9B4
_0800F6E6:
	bl ResetBlockReceivedFlags
	movs r4, 0
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	mov r8, r0
	ldr r5, _0800F710
	movs r7, 0
_0800F6F8:
	cmp r4, r6
	bne _0800F72C
	ldr r0, _0800F714
	adds r0, r7, r0
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _0800F718
	cmp r0, 0x1
	bge _0800F724
	cmp r0, 0
	beq _0800F71C
	b _0800F7B6
	.align 2, 0
_0800F710: .4byte gBlockRecvBuffer
_0800F714: .4byte gLinkPlayers
_0800F718:
	cmp r0, 0x3
	bne _0800F7B6
_0800F71C:
	ldr r0, _0800F720
	b _0800F79C
	.align 2, 0
_0800F720: .4byte gPlayerParty
_0800F724:
	ldr r0, _0800F728
	b _0800F79C
	.align 2, 0
_0800F728: .4byte 0x0300449c
_0800F72C:
	ldr r2, _0800F74C
	adds r0, r7, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0800F750
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800F75E
	b _0800F784
	.align 2, 0
_0800F74C: .4byte gLinkPlayers
_0800F750:
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800F784
_0800F75E:
	adds r0, r7, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _0800F770
	cmp r2, 0x1
	bge _0800F77C
	cmp r2, 0
	beq _0800F774
	b _0800F7B6
_0800F770:
	cmp r2, 0x3
	bne _0800F7B6
_0800F774:
	ldr r0, _0800F778
	b _0800F79C
	.align 2, 0
_0800F778: .4byte gPlayerParty
_0800F77C:
	ldr r0, _0800F780
	b _0800F79C
	.align 2, 0
_0800F780: .4byte 0x0300449c
_0800F784:
	adds r0, r7, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _0800F796
	cmp r2, 0x1
	bge _0800F7AC
	cmp r2, 0
	beq _0800F79A
	b _0800F7B6
_0800F796:
	cmp r2, 0x3
	bne _0800F7B6
_0800F79A:
	ldr r0, _0800F7A8
_0800F79C:
	adds r1, r5, 0
	movs r2, 0xC8
	bl memcpy
	b _0800F7B6
	.align 2, 0
_0800F7A8: .4byte gEnemyParty
_0800F7AC:
	ldr r0, _0800F7C8
	adds r1, r5, 0
	movs r2, 0xC8
	bl memcpy
_0800F7B6:
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _0800F6F8
	b _0800F944
	.align 2, 0
_0800F7C8: .4byte 0x030046fc
_0800F7CC:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0800F7D8
	b _0800F9B4
_0800F7D8:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800F7EC
	movs r2, 0x64
	bl SendBlock
	b _0800F944
	.align 2, 0
_0800F7EC: .4byte 0x0201d0c8
_0800F7F0:
	bl GetBlockReceivedStatus
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0xF
	beq _0800F7FE
	b _0800F9B4
_0800F7FE:
	bl ResetBlockReceivedFlags
	movs r4, 0
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	mov r8, r0
	ldr r5, _0800F828
	movs r7, 0
_0800F810:
	cmp r4, r6
	bne _0800F844
	ldr r0, _0800F82C
	adds r0, r7, r0
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _0800F830
	cmp r0, 0x1
	bge _0800F83C
	cmp r0, 0
	beq _0800F834
	b _0800F8CE
	.align 2, 0
_0800F828: .4byte gBlockRecvBuffer
_0800F82C: .4byte gLinkPlayers
_0800F830:
	cmp r0, 0x3
	bne _0800F8CE
_0800F834:
	ldr r0, _0800F838
	b _0800F8B4
	.align 2, 0
_0800F838: .4byte 0x03004438
_0800F83C:
	ldr r0, _0800F840
	b _0800F8B4
	.align 2, 0
_0800F840: .4byte 0x03004564
_0800F844:
	ldr r2, _0800F864
	adds r0, r7, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _0800F868
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800F876
	b _0800F89C
	.align 2, 0
_0800F864: .4byte gLinkPlayers
_0800F868:
	mov r1, r8
	adds r0, r1, r2
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800F89C
_0800F876:
	adds r0, r7, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _0800F888
	cmp r2, 0x1
	bge _0800F894
	cmp r2, 0
	beq _0800F88C
	b _0800F8CE
_0800F888:
	cmp r2, 0x3
	bne _0800F8CE
_0800F88C:
	ldr r0, _0800F890
	b _0800F8B4
	.align 2, 0
_0800F890: .4byte 0x03004438
_0800F894:
	ldr r0, _0800F898
	b _0800F8B4
	.align 2, 0
_0800F898: .4byte 0x03004564
_0800F89C:
	adds r0, r7, r2
	ldrh r2, [r0, 0x18]
	cmp r2, 0x2
	bgt _0800F8AE
	cmp r2, 0x1
	bge _0800F8C4
	cmp r2, 0
	beq _0800F8B2
	b _0800F8CE
_0800F8AE:
	cmp r2, 0x3
	bne _0800F8CE
_0800F8B2:
	ldr r0, _0800F8C0
_0800F8B4:
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	b _0800F8CE
	.align 2, 0
_0800F8C0: .4byte 0x03004698
_0800F8C4:
	ldr r0, _0800F950
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
_0800F8CE:
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	adds r7, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _0800F810
	ldr r4, _0800F954
	adds r0, r4, 0
	bl shedinja_something
	adds r0, r4, 0
	adds r0, 0x64
	bl shedinja_something
	adds r0, r4, 0
	adds r0, 0xC8
	bl shedinja_something
	movs r1, 0x96
	lsls r1, 1
	adds r0, r4, r1
	bl shedinja_something
	movs r7, 0xC8
	lsls r7, 1
	adds r0, r4, r7
	bl shedinja_something
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r4, r1
	bl shedinja_something
	ldr r4, _0800F958
	adds r0, r4, 0
	bl shedinja_something
	adds r0, r4, 0
	adds r0, 0x64
	bl shedinja_something
	adds r0, r4, 0
	adds r0, 0xC8
	bl shedinja_something
	subs r7, 0x64
	adds r0, r4, r7
	bl shedinja_something
	movs r1, 0xC8
	lsls r1, 1
	adds r0, r4, r1
	bl shedinja_something
	adds r7, 0xC8
	adds r0, r4, r7
	bl shedinja_something
_0800F944:
	ldr r1, _0800F95C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0800F9B4
	.align 2, 0
_0800F950: .4byte 0x030047c4
_0800F954: .4byte gPlayerParty
_0800F958: .4byte gEnemyParty
_0800F95C: .4byte gUnknown_02024D1E
_0800F960:
	bl sub_800B950
	ldr r0, _0800F974
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r2, [r0, 0x2]
	b _0800F9B4
	.align 2, 0
_0800F974: .4byte gUnknown_02024D1E
_0800F978:
	ldr r0, _0800F9C0
	adds r1, r0, 0x1
	bl battle_load_something
	lsls r0, 24
	cmp r0, 0
	beq _0800F9B4
	ldr r2, _0800F9C4
	ldr r1, _0800F9C8
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0800F9CC
	str r0, [r1]
	ldr r0, _0800F9D0
	bl SetMainCallback2
	ldr r3, _0800F9D4
	ldrh r2, [r3]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0800F9B4
	ldr r1, _0800F9D8
	movs r4, 0x80
	lsls r4, 4
	adds r0, r4, 0
	strh r0, [r1]
	movs r0, 0x20
	orrs r0, r2
	strh r0, [r3]
_0800F9B4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F9C0: .4byte gUnknown_02024D1F
_0800F9C4: .4byte gUnknown_030042D0
_0800F9C8: .4byte gMain
_0800F9CC: .4byte sub_8010824
_0800F9D0: .4byte sub_800F808
_0800F9D4: .4byte gUnknown_020239F8
_0800F9D8: .4byte gTrainerBattleOpponent
	thumb_func_end sub_800F298

	thumb_func_start sub_800F808
sub_800F808: @ 800F9DC
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0800F9F8
	bl sub_800374C
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_0800F9F8: .4byte gUnknown_03004210
	thumb_func_end sub_800F808

	thumb_func_start sub_800F828
sub_800F828: @ 800F9FC
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r1, _0800FA08
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0800FA08: .4byte sub_800F838
	thumb_func_end sub_800F828

	thumb_func_start sub_800F838
sub_800F838: @ 800FA0C
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r5, _0800FA24
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _0800FA40
	cmp r1, 0x1
	bgt _0800FA28
	cmp r1, 0
	beq _0800FA2E
	b _0800FAB0
	.align 2, 0
_0800FA24: .4byte 0x02000000
_0800FA28:
	cmp r1, 0x2
	beq _0800FA9C
	b _0800FAB0
_0800FA2E:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	strh r1, [r3, 0x30]
	ldr r0, _0800FA98
	strh r0, [r3, 0x32]
	strh r1, [r3, 0x34]
	movs r0, 0x1
	strh r0, [r3, 0x36]
_0800FA40:
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _0800FAB0
	movs r0, 0x2
	strh r0, [r3, 0x36]
	movs r4, 0x30
	ldrsh r2, [r3, r4]
	movs r0, 0x34
	ldrsh r1, [r3, r0]
	lsls r1, 5
	adds r2, r1
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	subs r0, r1
	movs r4, 0x3D
	lsls r0, 1
	adds r0, r5
	lsls r2, 1
	adds r2, r5
	movs r1, 0x1C
_0800FA6E:
	strh r4, [r2]
	strh r4, [r0]
	adds r0, 0x4
	adds r2, 0x4
	subs r1, 0x2
	cmp r1, 0
	bge _0800FA6E
	ldrh r0, [r3, 0x34]
	adds r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _0800FAB0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	movs r0, 0x20
	strh r0, [r3, 0x30]
	b _0800FAB0
	.align 2, 0
_0800FA98: .4byte 0x00000281
_0800FA9C:
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _0800FAB0
	ldr r0, _0800FAB8
	bl SetMainCallback2
_0800FAB0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FAB8: .4byte sub_800E7C4
	thumb_func_end sub_800F838

	thumb_func_start sub_800F8E8
sub_800F8E8: @ 800FABC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x10]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x14]
	movs r0, 0
	mov r9, r0
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0800FAE0
	movs r0, 0
	b _0800FE88
_0800FAE0:
	ldr r0, _0800FB10
	ldrh r1, [r0]
	ldr r0, _0800FB14
	ands r0, r1
	ldr r1, [sp, 0x14]
	lsls r1, 2
	str r1, [sp, 0x20]
	cmp r0, 0x8
	beq _0800FAF4
	b _0800FE78
_0800FAF4:
	bl ZeroEnemyPartyMons
	movs r2, 0
	str r2, [sp, 0x18]
	ldr r2, _0800FB18
	ldr r1, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	adds r0, 0x20
	ldr r4, [sp, 0x18]
	b _0800FE5A
	.align 2, 0
_0800FB10: .4byte gUnknown_020239F8
_0800FB14: .4byte 0x00000908
_0800FB18: .4byte gTrainers
_0800FB1C:
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r0, 3
	adds r1, r0, r2
	ldrb r0, [r1, 0x18]
	cmp r0, 0x1
	bne _0800FB30
	movs r4, 0x80
	mov r10, r4
	b _0800FB42
_0800FB30:
	ldrb r1, [r1, 0x2]
	movs r0, 0x80
	ands r0, r1
	movs r1, 0x88
	mov r10, r1
	cmp r0, 0
	beq _0800FB42
	movs r2, 0x78
	mov r10, r2
_0800FB42:
	movs r6, 0
	ldr r0, _0800FB98
	ldr r2, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r1, r2, r3
	lsls r1, 3
	adds r3, r0, 0x4
	adds r1, r3
	ldrb r1, [r1]
	adds r4, r0, 0
	ldr r0, [sp, 0x18]
	adds r0, 0x1
	str r0, [sp, 0x1C]
	cmp r1, 0xFF
	beq _0800FB7A
_0800FB60:
	ldr r0, [sp, 0x14]
	adds r1, r2, r0
	lsls r1, 3
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0800FB60
_0800FB7A:
	adds r2, r4, 0
	ldr r1, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r1, r0, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0800FC30
	cmp r0, 0x1
	bgt _0800FB9C
	cmp r0, 0
	beq _0800FBAA
	b _0800FE48
	.align 2, 0
_0800FB98: .4byte gTrainers
_0800FB9C:
	cmp r0, 0x2
	bne _0800FBA2
	b _0800FCF0
_0800FBA2:
	cmp r0, 0x3
	bne _0800FBA8
	b _0800FD84
_0800FBA8:
	b _0800FE48
_0800FBAA:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r4, [r0]
	movs r6, 0
	ldr r0, [sp, 0x18]
	lsls r2, r0, 3
	adds r0, r2, r4
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _0800FC2C
	adds r0, r1
	ldrb r0, [r0]
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _0800FBEC
	adds r3, r1, 0
	movs r7, 0xB
_0800FBD0:
	adds r0, r2, r4
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r7
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0800FBD0
_0800FBEC:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	adds r4, r5, r4
	ldrh r1, [r4]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, [sp, 0x18]
	movs r1, 0x64
	adds r0, r3, 0
	muls r0, r1
	ldr r2, [sp, 0x10]
	adds r0, r2, r0
	ldrh r1, [r4, 0x4]
	ldrb r2, [r4, 0x2]
	movs r3, 0x1
	str r3, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r3, 0x2
	str r3, [sp, 0x8]
	movs r3, 0
	str r3, [sp, 0xC]
	adds r3, r6, 0
	bl CreateMon
	b _0800FE48
	.align 2, 0
_0800FC2C: .4byte gSpeciesNames
_0800FC30:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r7, [r0]
	movs r6, 0
	ldr r4, [sp, 0x18]
	lsls r2, r4, 4
	adds r0, r2, r7
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _0800FCE8
	adds r0, r1
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, 0xFF
	beq _0800FC72
	adds r3, r1, 0
	movs r4, 0xB
_0800FC56:
	adds r0, r2, r7
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r4
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0800FC56
_0800FC72:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	mov r3, r8
	adds r4, r3, r7
	ldrh r1, [r4]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x18]
	movs r1, 0x64
	adds r5, r0, 0
	muls r5, r1
	ldr r2, [sp, 0x10]
	adds r5, r2, r5
	ldrh r1, [r4, 0x4]
	ldrb r2, [r4, 0x2]
	movs r0, 0x1
	str r0, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r3, r6, 0
	bl CreateMon
	movs r6, 0
	mov r0, r8
	adds r0, 0x6
	adds r4, r7, r0
_0800FCBC:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r5, 0
	adds r2, r4, 0
	bl SetMonData
	adds r1, r6, 0
	adds r1, 0x11
	ldrh r0, [r4]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0800FCEC
	adds r2, r0
	adds r0, r5, 0
	bl SetMonData
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0800FCBC
	b _0800FE48
	.align 2, 0
_0800FCE8: .4byte gSpeciesNames
_0800FCEC: .4byte 0x08208100
_0800FCF0:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r4, [r0]
	movs r6, 0
	ldr r0, [sp, 0x18]
	lsls r2, r0, 3
	adds r0, r2, r4
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _0800FD80
	adds r0, r1
	ldrb r0, [r0]
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _0800FD32
	adds r3, r1, 0
	movs r7, 0xB
_0800FD16:
	adds r0, r2, r4
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r7
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0800FD16
_0800FD32:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	adds r5, r4
	ldrh r1, [r5]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, [sp, 0x18]
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r1, [sp, 0x10]
	adds r4, r1, r4
	ldrh r1, [r5, 0x4]
	ldrb r2, [r5, 0x2]
	movs r0, 0x1
	str r0, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r4, 0
	adds r3, r6, 0
	bl CreateMon
	adds r5, 0x6
	adds r0, r4, 0
	movs r1, 0xC
	adds r2, r5, 0
	bl SetMonData
	b _0800FE48
	.align 2, 0
_0800FD80: .4byte gSpeciesNames
_0800FD84:
	adds r0, r4, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r7, [r0]
	movs r6, 0
	ldr r4, [sp, 0x18]
	lsls r2, r4, 4
	adds r0, r2, r7
	ldrh r1, [r0, 0x4]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _0800FE98
	adds r0, r1
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, 0xFF
	beq _0800FDC6
	adds r3, r1, 0
	movs r4, 0xB
_0800FDAA:
	adds r0, r2, r7
	ldrh r0, [r0, 0x4]
	adds r1, r0, 0
	muls r1, r4
	adds r0, r6, r1
	adds r0, r3
	ldrb r0, [r0]
	add r9, r0
	adds r6, 0x1
	adds r1, r6, r1
	adds r1, r3
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0800FDAA
_0800FDC6:
	mov r2, r9
	lsls r0, r2, 8
	add r10, r0
	mov r3, r8
	adds r5, r3, r7
	ldrh r1, [r5]
	lsls r0, r1, 5
	subs r0, r1
	movs r1, 0xFF
	bl __divsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x18]
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r2, [sp, 0x10]
	adds r4, r2, r4
	ldrh r1, [r5, 0x4]
	ldrb r2, [r5, 0x2]
	movs r0, 0x1
	str r0, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r4, 0
	adds r3, r6, 0
	bl CreateMon
	adds r5, 0x6
	adds r0, r4, 0
	movs r1, 0xC
	adds r2, r5, 0
	bl SetMonData
	movs r6, 0
	adds r5, r4, 0
	mov r0, r8
	adds r0, 0x8
	adds r4, r7, r0
_0800FE1E:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r5, 0
	adds r2, r4, 0
	bl SetMonData
	adds r1, r6, 0
	adds r1, 0x11
	ldrh r0, [r4]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0800FE9C
	adds r2, r0
	adds r0, r5, 0
	bl SetMonData
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0800FE1E
_0800FE48:
	ldr r4, [sp, 0x1C]
	str r4, [sp, 0x18]
	ldr r2, _0800FEA0
	ldr r1, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	adds r0, 0x20
_0800FE5A:
	ldrb r0, [r0]
	cmp r4, r0
	bge _0800FE62
	b _0800FB1C
_0800FE62:
	ldr r2, _0800FEA4
	ldr r1, _0800FEA0
	ldr r4, [sp, 0x20]
	ldr r3, [sp, 0x14]
	adds r0, r4, r3
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x18]
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0800FE78:
	ldr r0, _0800FEA0
	ldr r4, [sp, 0x20]
	ldr r2, [sp, 0x14]
	adds r1, r4, r2
	lsls r1, 3
	adds r1, r0
	adds r1, 0x20
	ldrb r0, [r1]
_0800FE88:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800FE98: .4byte gSpeciesNames
_0800FE9C: .4byte 0x08208100
_0800FEA0: .4byte gTrainers
_0800FEA4: .4byte gUnknown_020239F8
	thumb_func_end sub_800F8E8

	thumb_func_start sub_800FCD4
sub_800FCD4: @ 800FEA8
	push {lr}
	ldr r0, _0800FEC8
	ldrh r0, [r0]
	subs r0, 0x6F
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x30
	bhi _0800FEC2
	ldr r1, _0800FECC
	movs r2, 0x98
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
_0800FEC2:
	pop {r0}
	bx r0
	.align 2, 0
_0800FEC8: .4byte 0x04000006
_0800FECC: .4byte 0x04000008
	thumb_func_end sub_800FCD4

	thumb_func_start sub_800FCFC
sub_800FCFC: @ 800FED0
	push {lr}
	bl Random
	ldr r1, _0800FF4C
	ldr r0, _0800FF50
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF54
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF58
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF5C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF60
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF64
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF68
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FF6C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x22
	ldr r0, _0800FF70
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0800FF74
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	ldr r0, _0800FF78
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0800FF7C
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_0800FF4C: .4byte 0x04000010
_0800FF50: .4byte gUnknown_030042A4
_0800FF54: .4byte gUnknown_030042A0
_0800FF58: .4byte gUnknown_030042C0
_0800FF5C: .4byte gUnknown_030041B4
_0800FF60: .4byte gUnknown_03004288
_0800FF64: .4byte gUnknown_03004280
_0800FF68: .4byte gUnknown_030041B0
_0800FF6C: .4byte gUnknown_030041B8
_0800FF70: .4byte gUnknown_030042C4
_0800FF74: .4byte gUnknown_03004240
_0800FF78: .4byte gUnknown_03004200
_0800FF7C: .4byte gUnknown_03004244
	thumb_func_end sub_800FCFC

	thumb_func_start nullsub_36
nullsub_36: @ 800FF80
	bx lr
	thumb_func_end nullsub_36

	thumb_func_start sub_800FDB0
sub_800FDB0: @ 800FF84
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0800FFA4
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	lsrs r0, 8
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x20]
	b _0800FFB6
_0800FFA4:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	asrs r0, 8
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x20]
_0800FFB6:
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800FFEA
	ldr r4, _0800FFF0
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
_0800FFEA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FFF0: .4byte 0x00002710
	thumb_func_end sub_800FDB0

	thumb_func_start sub_800FE20
sub_800FE20: @ 800FFF4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08010010
	str r0, [r4, 0x1C]
	movs r0, 0x68
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010010: .4byte sub_800FDB0
	thumb_func_end sub_800FE20

	thumb_func_start sub_800FE40
sub_800FE40: @ 8010014
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r0, _0801005C
	ldr r2, _08010060
	adds r0, r2
	ldrb r2, [r0]
	ldr r0, _08010064
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08010088
	ldr r1, _08010068
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _08010074
	cmp r0, 0x1
	bgt _0801006C
	cmp r0, 0
	beq _08010088
	b _08010090
	.align 2, 0
_0801005C: .4byte 0x02000000
_08010060: .4byte 0x000160cb
_08010064: .4byte gUnknown_020239F8
_08010068: .4byte gLinkPlayers
_0801006C:
	cmp r0, 0x2
	beq _08010088
	cmp r0, 0x3
	bne _08010090
_08010074:
	ldr r1, _08010080
	str r1, [sp, 0x4]
	ldr r2, _08010084
	str r2, [sp, 0x8]
	b _08010090
	.align 2, 0
_08010080: .4byte gEnemyParty
_08010084: .4byte gPlayerParty
_08010088:
	ldr r3, _080101DC
	str r3, [sp, 0x4]
	ldr r0, _080101E0
	str r0, [sp, 0x8]
_08010090:
	movs r7, 0
	movs r1, 0
	mov r8, r1
	ldr r2, [sp]
	lsls r2, 2
	str r2, [sp, 0xC]
	movs r3, 0xCE
	lsls r3, 1
	mov r10, r3
	mov r9, r1
_080100A4:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r0, [sp, 0x4]
	adds r4, r0, r4
	adds r0, r4, 0
	movs r1, 0x41
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
	adds r1, r0, 0
	cmp r5, 0
	beq _08010114
	cmp r5, r10
	beq _080100E8
	cmp r6, 0
	beq _080100E8
	cmp r1, 0
	bne _080100E8
	movs r0, 0x1
	mov r2, r9
	lsls r0, r2
	orrs r7, r0
_080100E8:
	cmp r5, 0
	beq _08010114
	cmp r6, 0
	beq _08010100
	cmp r5, r10
	beq _080100F8
	cmp r1, 0
	beq _08010100
_080100F8:
	movs r0, 0x2
	mov r3, r9
	lsls r0, r3
	orrs r7, r0
_08010100:
	cmp r5, 0
	beq _08010114
	cmp r5, r10
	beq _08010114
	cmp r6, 0
	bne _08010114
	movs r0, 0x3
	mov r1, r9
	lsls r0, r1
	orrs r7, r0
_08010114:
	movs r2, 0x2
	add r9, r2
	movs r3, 0x1
	add r8, r3
	mov r0, r8
	cmp r0, 0x5
	ble _080100A4
	ldr r1, _080101E4
	ldr r2, [sp, 0xC]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0xE]
	movs r7, 0
	movs r0, 0
	mov r8, r0
	movs r1, 0xCE
	lsls r1, 1
	mov r10, r1
	mov r9, r0
_0801013E:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r2, [sp, 0x8]
	adds r4, r2, r4
	adds r0, r4, 0
	movs r1, 0x41
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
	adds r1, r0, 0
	cmp r5, 0
	beq _080101AE
	cmp r5, r10
	beq _08010182
	cmp r6, 0
	beq _08010182
	cmp r1, 0
	bne _08010182
	movs r0, 0x1
	mov r3, r9
	lsls r0, r3
	orrs r7, r0
_08010182:
	cmp r5, 0
	beq _080101AE
	cmp r6, 0
	beq _0801019A
	cmp r5, r10
	beq _08010192
	cmp r1, 0
	beq _0801019A
_08010192:
	movs r0, 0x2
	mov r1, r9
	lsls r0, r1
	orrs r7, r0
_0801019A:
	cmp r5, 0
	beq _080101AE
	cmp r5, r10
	beq _080101AE
	cmp r6, 0
	bne _080101AE
	movs r0, 0x3
	mov r2, r9
	lsls r0, r2
	orrs r7, r0
_080101AE:
	movs r3, 0x2
	add r9, r3
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _0801013E
	ldr r1, _080101E4
	ldr r2, [sp, 0xC]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x10]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080101DC: .4byte gPlayerParty
_080101E0: .4byte gEnemyParty
_080101E4: .4byte gTasks
	thumb_func_end sub_800FE40

	thumb_func_start c2_8011A1C
c2_8011A1C: @ 80101E8
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r4, 0
	str r4, [sp]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08010318
	mov r0, sp
	bl CpuSet
	ldr r0, _0801031C
	strh r4, [r0]
	subs r0, 0xC
	movs r2, 0xF0
	strh r2, [r0]
	adds r0, 0x4
	ldr r3, _08010320
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r0, _08010324
	strh r2, [r0]
	ldr r0, _08010328
	strh r1, [r0]
	bl dp12_8087EA4
	ldr r0, _0801032C
	movs r3, 0xF0
	movs r4, 0xF0
	lsls r4, 3
	adds r2, r0, r4
	movs r1, 0x4F
_0801023A:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0801023A
	movs r1, 0x50
	ldr r5, _08010330
	ldr r0, _0801032C
	ldr r3, _08010334
	movs r4, 0x82
	lsls r4, 4
	adds r2, r0, r4
	adds r0, 0xA0
_08010258:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	ble _08010258
	adds r0, r5, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08010338
	movs r4, 0
	strh r4, [r0]
	ldr r0, _0801033C
	strh r4, [r0]
	ldr r0, _08010340
	strh r4, [r0]
	ldr r0, _08010344
	strh r4, [r0]
	ldr r0, _08010348
	strh r4, [r0]
	ldr r0, _0801034C
	strh r4, [r0]
	ldr r0, _08010350
	strh r4, [r0]
	ldr r0, _08010354
	strh r4, [r0]
	ldr r0, _08010358
	adds r1, r5, 0
	bl InitWindowFromConfig
	ldr r0, _0801035C
	ldr r1, _08010360
	bl InitWindowFromConfig
	ldr r0, _08010364
	ldr r1, _08010368
	bl InitWindowFromConfig
	bl sub_800D6D4
	ldr r0, _0801036C
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	bl sub_800D74C
	bl ResetSpriteData
	bl ResetTasks
	bl sub_800E23C
	ldr r1, _08010370
	movs r0, 0x37
	strh r0, [r1]
	bl FreeAllSpritePalettes
	ldr r1, _08010374
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _08010378
	bl SetVBlankCallback
	ldr r0, _0801037C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08010380
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x87
	lsls r2, 1
	strh r2, [r1, 0xA]
	movs r2, 0x5A
	strh r2, [r1, 0xC]
	movs r2, 0x1
	strh r2, [r1, 0x12]
	bl sub_800FE40
	ldr r0, _08010384
	bl SetMainCallback2
	ldr r0, _08010388
	strb r4, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010318: .4byte 0x05006000
_0801031C: .4byte 0x0400004c
_08010320: .4byte 0x00005051
_08010324: .4byte gUnknown_030042C4
_08010328: .4byte gUnknown_03004240
_0801032C: .4byte gUnknown_03004DE0
_08010330: .4byte gWindowConfig_81E6C58
_08010334: .4byte 0x0000ff10
_08010338: .4byte gUnknown_030042A4
_0801033C: .4byte gUnknown_030042A0
_08010340: .4byte gUnknown_030042C0
_08010344: .4byte gUnknown_030041B4
_08010348: .4byte gUnknown_03004288
_0801034C: .4byte gUnknown_03004280
_08010350: .4byte gUnknown_030041B0
_08010354: .4byte gUnknown_030041B8
_08010358: .4byte gUnknown_03004210
_0801035C: .4byte gUnknown_030041D0
_08010360: .4byte gWindowConfig_81E71D0
_08010364: .4byte gUnknown_03004250
_08010368: .4byte gWindowConfig_81E71EC
_0801036C: .4byte gUnknown_08D004E0
_08010370: .4byte 0x0400004a
_08010374: .4byte gReservedSpritePaletteCount
_08010378: .4byte sub_800FCFC
_0801037C: .4byte sub_800DE30
_08010380: .4byte gTasks
_08010384: .4byte sub_80101B8
_08010388: .4byte gUnknown_02024D1E
	thumb_func_end c2_8011A1C

	thumb_func_start sub_80101B8
sub_80101B8: @ 801038C
	push {lr}
	bl c2_081284E0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80101B8

	thumb_func_start c2_081284E0
c2_081284E0: @ 80103A8
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080103C0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _080103D0
	cmp r0, 0x1
	bgt _080103C4
	cmp r0, 0
	beq _080103CA
	b _0801040A
	.align 2, 0
_080103C0: .4byte gUnknown_02024D1E
_080103C4:
	cmp r0, 0x2
	beq _080103F6
	b _0801040A
_080103CA:
	movs r0, 0xFF
	strb r0, [r4, 0x1]
	b _080103EE
_080103D0:
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0801040A
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080103EE:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0801040A
_080103F6:
	ldr r0, _08010414
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801040A
	ldr r0, _08010418
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0801040A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010414: .4byte gPaletteFade
_08010418: .4byte gMain
	thumb_func_end c2_081284E0

	thumb_func_start oac_poke_opponent
oac_poke_opponent: @ 801041C
	push {lr}
	sub sp, 0x4
	ldr r1, _08010444
	str r1, [r0, 0x1C]
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	movs r0, 0x80
	lsls r0, 10
	ldr r1, _08010448
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xA
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08010444: .4byte sub_8010278
_08010448: .4byte 0x00003def
	thumb_func_end oac_poke_opponent

	thumb_func_start sub_8010278
sub_8010278: @ 801044C
	push {lr}
	adds r2, r0, 0
	ldr r0, _08010478
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08010474
	ldrh r0, [r2, 0x24]
	adds r0, 0x2
	strh r0, [r2, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _08010474
	ldr r0, _0801047C
	str r0, [r2, 0x1C]
	ldrh r0, [r2, 0x32]
	movs r1, 0x19
	bl PlayCry1
_08010474:
	pop {r0}
	bx r0
	.align 2, 0
_08010478: .4byte gUnknown_02024DE8
_0801047C: .4byte sub_80102AC
	thumb_func_end sub_8010278

	thumb_func_start sub_80102AC
sub_80102AC: @ 8010480
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080104C8
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_804777C
	ldr r1, _080104D0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r0, _080104D4
	str r0, [r4, 0x1C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	movs r0, 0x80
	lsls r0, 10
	ldr r1, _080104D8
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl BeginNormalPaletteFade
_080104C8:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080104D0: .4byte gUnknown_03004340
_080104D4: .4byte nullsub_37
_080104D8: .4byte 0x00003def
	thumb_func_end sub_80102AC

	thumb_func_start nullsub_37
nullsub_37: @ 80104DC
	bx lr
	thumb_func_end nullsub_37

	thumb_func_start unref_sub_801030C
unref_sub_801030C: @ 80104E0
	movs r1, 0x6
	strh r1, [r0, 0x34]
	movs r1, 0x1
	strh r1, [r0, 0x36]
	ldr r1, _080104F0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080104F0: .4byte sub_8010320
	thumb_func_end unref_sub_801030C

	thumb_func_start sub_8010320
sub_8010320: @ 80104F4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08010548
	movs r0, 0x8
	strh r0, [r3, 0x36]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r4, 0x5
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08010548
	ldrb r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r0, _08010550
	str r0, [r3, 0x1C]
	ldr r0, _08010554
	str r2, [r0]
_08010548:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010550: .4byte nullsub_37
_08010554: .4byte gUnknown_03004284
	thumb_func_end sub_8010320

	thumb_func_start sub_8010384
sub_8010384: @ 8010558
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, r6, 2
	ldr r0, _08010578
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _0801057C
	adds r4, r0, 0
	b _08010580
	.align 2, 0
_08010578: .4byte 0x02017800
_0801057C:
	mov r0, r9
	ldrh r4, [r0, 0x32]
_08010580:
	ldr r1, _080105E8
	lsls r0, r6, 1
	adds r5, r0, r1
	ldrh r0, [r5]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _080105EC
	adds r0, r7
	movs r1, 0
	bl GetMonData
	cmp r4, 0xC9
	bne _08010604
	ldrh r0, [r5]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _080105F0
	movs r0, 0xC9
	b _080105FA
	.align 2, 0
_080105E8: .4byte gUnknown_02024A6A
_080105EC: .4byte gEnemyParty
_080105F0:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_080105FA:
	ldr r1, _08010600
	lsls r0, 2
	b _0801063C
	.align 2, 0
_08010600: .4byte gMonFrontPicCoords
_08010604:
	ldr r0, _0801061C
	cmp r4, r0
	bne _08010628
	ldr r0, _08010620
	ldr r1, _08010624
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08010640
	.align 2, 0
_0801061C: .4byte 0x00000181
_08010620: .4byte gUnknownCastformCoords_0837F598
_08010624: .4byte gUnknown_02024E84
_08010628:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08010638
	ldr r0, _08010634
	b _0801063E
	.align 2, 0
_08010634: .4byte gMonFrontPicCoords
_08010638:
	ldr r1, _08010660
	lsls r0, r4, 2
_0801063C:
	adds r0, r1
_0801063E:
	ldrb r0, [r0, 0x1]
_08010640:
	lsrs r1, r0, 3
	movs r0, 0x8
	subs r0, r1
	mov r1, r9
	strh r0, [r1, 0x34]
	movs r0, 0x1
	strh r0, [r1, 0x36]
	ldr r0, _08010664
	str r0, [r1, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010660: .4byte gMonFrontPicCoords
_08010664: .4byte sub_8010494
	thumb_func_end sub_8010384

	thumb_func_start sub_8010494
sub_8010494: @ 8010668
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	subs r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _080106E4
	movs r0, 0x2
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x26]
	adds r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bge _0801069C
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _080106E4
_0801069C:
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	ldr r1, _080106EC
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r2, _080106F0
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 11
	ldr r2, [r0]
	adds r2, r1
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 8
	adds r2, r0
	movs r1, 0
	movs r0, 0xFF
_080106CA:
	strb r1, [r2]
	adds r2, 0x1
	subs r0, 0x1
	cmp r0, 0
	bge _080106CA
	ldr r0, _080106F0
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r4, 0
	bl StartSpriteAnim
_080106E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080106EC: .4byte gUnknown_081FAF4C
_080106F0: .4byte gUnknown_02024E84
	thumb_func_end sub_8010494

	thumb_func_start sub_8010520
sub_8010520: @ 80106F4
	movs r1, 0x8
	strh r1, [r0, 0x34]
	adds r1, r0, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r0, 0x36]
	ldr r1, _0801070C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0801070C: .4byte sub_801053C
	thumb_func_end sub_8010520

	thumb_func_start sub_801053C
sub_801053C: @ 8010710
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _08010742
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0x8
	strh r0, [r3, 0x34]
_08010742:
	pop {r0}
	bx r0
	thumb_func_end sub_801053C

	thumb_func_start sub_8010574
sub_8010574: @ 8010748
	movs r1, 0x3E
	adds r1, r0
	mov r12, r1
	movs r1, 0x1
	ldrh r2, [r0, 0x36]
	ands r2, r1
	lsls r2, 2
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0
	strh r1, [r0, 0x36]
	ldr r1, _08010770
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08010770: .4byte nullsub_37
	thumb_func_end sub_8010574

	thumb_func_start sub_80105A0
sub_80105A0: @ 8010774
	ldr r1, _0801077C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0801077C: .4byte oac_poke_ally_
	thumb_func_end sub_80105A0

	thumb_func_start oac_poke_ally_
oac_poke_ally_: @ 8010780
	push {lr}
	adds r2, r0, 0
	ldr r0, _080107A8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080107A4
	ldrh r0, [r2, 0x24]
	subs r0, 0x2
	strh r0, [r2, 0x24]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080107A4
	ldr r0, _080107AC
	str r0, [r2, 0x1C]
	strh r1, [r2, 0x30]
_080107A4:
	pop {r0}
	bx r0
	.align 2, 0
_080107A8: .4byte gUnknown_02024DE8
_080107AC: .4byte nullsub_86
	thumb_func_end oac_poke_ally_

	thumb_func_start sub_80105DC
sub_80105DC: @ 80107B0
	ldr r1, _080107B8
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080107B8: .4byte nullsub_86
	thumb_func_end sub_80105DC

	thumb_func_start nullsub_86
nullsub_86: @ 80107BC
	bx lr
	thumb_func_end nullsub_86

	thumb_func_start sub_80105EC
sub_80105EC: @ 80107C0
	push {lr}
	adds r2, r0, 0
	ldr r0, _080107E4
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080107E0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
_080107E0:
	pop {r0}
	bx r0
	.align 2, 0
_080107E4: .4byte gUnknown_02024DE8
	thumb_func_end sub_80105EC

	thumb_func_start dp11b_obj_instanciate
dp11b_obj_instanciate: @ 80107E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	cmp r1, 0
	beq _08010820
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 2
	ldr r1, _0801081C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	b _0801082E
	.align 2, 0
_0801081C: .4byte 0x02017810
_08010820:
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 2
	ldr r1, _0801086C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
_0801082E:
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	bne _080108CE
	ldr r0, _08010870
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	cmp r0, 0x1
	bne _0801087C
	ldr r0, _08010874
	adds r0, r4, r0
	ldrb r7, [r0]
	adds r0, r6, r4
	lsls r0, 2
	ldr r1, _0801086C
	adds r0, r1
	strb r5, [r0, 0x2]
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _08010878
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x80
	b _080108A0
	.align 2, 0
_0801086C: .4byte 0x02017810
_08010870: .4byte objc_dp11b_pingpong
_08010874: .4byte gUnknown_03004340
_08010878: .4byte gSprites
_0801087C:
	ldr r0, _080108DC
	adds r0, r4, r0
	ldrb r7, [r0]
	adds r0, r6, r4
	lsls r0, 2
	ldr r1, _080108E0
	adds r0, r1
	strb r5, [r0, 0x3]
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _080108E4
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0xC0
_080108A0:
	strh r1, [r0, 0x2E]
	adds r4, r2, 0
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r4
	mov r2, r9
	lsls r0, r2, 24
	asrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x30]
	mov r3, r10
	lsls r0, r3, 24
	asrs r0, 24
	strh r0, [r1, 0x32]
	strh r7, [r1, 0x34]
	mov r0, r8
	strh r0, [r1, 0x36]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
_080108CE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080108DC: .4byte gUnknown_02024BE0
_080108E0: .4byte 0x02017810
_080108E4: .4byte gSprites
	thumb_func_end dp11b_obj_instanciate

	thumb_func_start dp11b_obj_free
dp11b_obj_free: @ 80108E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _08010930
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08010928
	adds r5, r0, r1
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08010974
	ldr r2, _0801092C
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x34]
	lsls r1, 24
	lsrs r4, r1, 24
	bl DestroySprite
	ldrb r1, [r5]
	movs r0, 0x3
	negs r0, r0
	b _08010960
	.align 2, 0
_08010928: .4byte 0x02017810
_0801092C: .4byte gSprites
_08010930:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0801097C
	adds r5, r0, r1
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08010974
	ldr r2, _08010980
	ldrb r1, [r5, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x34]
	lsls r1, 24
	lsrs r4, r1, 24
	bl DestroySprite
	ldrb r1, [r5]
	movs r0, 0x5
	negs r0, r0
_08010960:
	ands r0, r1
	strb r0, [r5]
	ldr r0, _08010980
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x24]
	strh r0, [r1, 0x26]
_08010974:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801097C: .4byte 0x02017810
_08010980: .4byte gSprites
	thumb_func_end dp11b_obj_free

	thumb_func_start objc_dp11b_pingpong
objc_dp11b_pingpong: @ 8010984
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _0801099C
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	b _080109A0
_0801099C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
_080109A0:
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	ldr r2, _080109CC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080109CC: .4byte gSprites
	thumb_func_end objc_dp11b_pingpong

	thumb_func_start nullsub_41
nullsub_41: @ 80109D0
	bx lr
	thumb_func_end nullsub_41

	thumb_func_start sub_8010800
sub_8010800: @ 80109D4
	push {lr}
	bl sub_8010874
	ldr r1, _080109EC
	movs r0, 0
	strb r0, [r1, 0x1]
	ldr r1, _080109F0
	ldr r0, _080109F4
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080109EC: .4byte gUnknown_02024D1E
_080109F0: .4byte gUnknown_030042D4
_080109F4: .4byte bc_8012FAC
	thumb_func_end sub_8010800

	thumb_func_start sub_8010824
sub_8010824: @ 80109F8
	push {r4,r5,lr}
	ldr r0, _08010A38
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08010A3C
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08010A40
	ldrb r0, [r0]
	cmp r0, 0
	beq _08010A32
	ldr r5, _08010A44
	adds r4, r1, 0
_08010A14:
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08010A40
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08010A14
_08010A32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010A38: .4byte gUnknown_030042D4
_08010A3C: .4byte gUnknown_02024A60
_08010A40: .4byte gUnknown_02024A68
_08010A44: .4byte gUnknown_03004330
	thumb_func_end sub_8010824

	thumb_func_start sub_8010874
sub_8010874: @ 8010A48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	bl sub_801365C
	bl sub_801377C
	movs r2, 0
	movs r3, 0
	ldr r0, _08010C9C
	mov r10, r0
	ldr r1, _08010CA0
	mov r9, r1
	ldr r4, _08010CA4
	mov r8, r4
	ldr r0, _08010CA8
	mov r12, r0
	ldr r4, _08010CAC
	movs r5, 0
	ldr r7, _08010CB0
	ldr r6, _08010CB4
_08010A78:
	ldr r0, _08010CB8
	adds r0, r5, r0
	str r3, [r0]
	movs r1, 0
_08010A80:
	adds r0, r4, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0x1B
	bls _08010A80
	movs r0, 0x2
	strb r0, [r4, 0x16]
	ldr r1, _08010CBC
	adds r0, r2, r1
	strb r3, [r0]
	mov r0, r12
	strh r3, [r0]
	mov r1, r8
	strh r3, [r1]
	mov r0, r9
	strh r3, [r0]
	mov r1, r10
	strh r3, [r1]
	ldr r0, _08010CC0
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	strh r3, [r6]
	strh r3, [r7]
	ldr r1, _08010CC4
	adds r0, r5, r1
	str r3, [r0]
	movs r0, 0x2
	add r10, r0
	add r9, r0
	add r8, r0
	add r12, r0
	adds r4, 0x1C
	adds r5, 0x4
	adds r7, 0x2
	adds r6, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _08010A78
	movs r5, 0
	ldr r3, _08010CC8
	ldr r4, _08010CCC
	movs r2, 0x1
_08010AD6:
	strh r5, [r4]
	movs r1, 0
_08010ADA:
	adds r0, r3, r1
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0xB
	bls _08010ADA
	adds r3, 0xC
	adds r4, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _08010AD6
	movs r1, 0
	ldr r2, _08010CD0
	strb r1, [r2]
	ldr r3, _08010CD4
	strb r1, [r3]
	ldr r4, _08010CD8
	strh r1, [r4]
	ldr r1, _08010CDC
	movs r2, 0
	movs r3, 0
_08010B02:
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x2B
	bls _08010B02
	movs r0, 0
	ldr r1, _08010CE0
	str r0, [r1]
	ldr r2, _08010CE4
	ldrh r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08010B30
	ldr r3, _08010CE8
	ldrb r1, [r3, 0x15]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08010B30
	movs r0, 0x80
	ldr r4, _08010CE0
	str r0, [r4]
_08010B30:
	ldr r1, _08010CE8
	ldrb r0, [r1, 0x15]
	lsls r0, 30
	lsrs r0, 31
	ldr r3, _08010CEC
	ldr r4, _08010CF0
	adds r2, r3, r4
	movs r1, 0
	strb r0, [r2]
	ldr r0, _08010CF4
	strb r1, [r0]
	ldr r2, _08010CF8
	strb r1, [r2]
	ldr r3, _08010CFC
	str r1, [r3]
	movs r2, 0
	ldr r4, _08010D00
	strh r1, [r4]
	ldr r1, _08010CEC
	ldr r3, _08010D04
	adds r0, r1, r3
	strb r2, [r0]
	ldr r4, _08010D08
	adds r0, r1, r4
	strb r2, [r0]
	ldr r1, _08010D0C
	movs r2, 0
	adds r0, r1, 0x7
_08010B68:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08010B68
	movs r5, 0
	ldr r0, _08010D10
	strh r5, [r0]
	movs r0, 0
	ldr r1, _08010D14
	str r0, [r1]
	ldr r2, _08010D18
	strh r0, [r2]
	ldr r4, _08010CEC
	ldr r3, _08010D1C
	adds r0, r4, r3
	strb r5, [r0]
	ldr r1, _08010D20
	adds r0, r4, r1
	strb r5, [r0]
	ldr r2, _08010D24
	strb r5, [r2]
	ldr r3, _08010D28
	strb r5, [r3]
	subs r1, 0x29
	adds r0, r4, r1
	strb r5, [r0]
	ldr r2, _08010D2C
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _08010D30
	adds r0, r4, r3
	strb r5, [r0]
	ldr r0, _08010D34
	movs r1, 0xB
	bl GetMonData
	ldr r2, _08010D38
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08010D3C
	bl __divsi3
	ldr r2, _08010D40
	adds r1, r4, r2
	strb r0, [r1]
	ldr r3, _08010D44
	adds r1, r4, r3
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _08010D48
	adds r0, r4, r1
	strb r5, [r0]
	subs r2, 0x33
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	movs r2, 0
	movs r1, 0
_08010BE6:
	ldr r3, _08010D4C
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x20
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x1C
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x8
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x10
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x8
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x7
	ble _08010BE6
	ldr r4, _08010CEC
	ldr r1, _08010D50
	adds r0, r4, r1
	movs r2, 0
	movs r1, 0x6
	strb r1, [r0]
	subs r3, 0x3F
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _08010D54
	adds r0, r4, r1
	strb r2, [r0]
	ldr r3, _08010D58
	movs r1, 0
	movs r2, 0xA
	adds r0, r3, 0
	adds r0, 0x40
_08010C3E:
	strb r1, [r0]
	subs r0, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _08010C3E
	movs r1, 0
	strb r1, [r3, 0x13]
	strb r1, [r3]
	strb r1, [r3, 0x1]
	strb r1, [r3, 0x2]
	strb r1, [r3, 0x3]
	strb r1, [r3, 0x4]
	ldrb r2, [r3, 0x5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	movs r2, 0x3
	negs r2, r2
	ands r0, r2
	strb r0, [r3, 0x5]
	strh r1, [r3, 0x20]
	strh r1, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x6]
	strh r1, [r3, 0x26]
	strh r1, [r3, 0x28]
	movs r2, 0
	adds r5, r3, 0
	adds r5, 0x8
	movs r4, 0
	adds r1, r3, 0
	adds r1, 0x14
_08010C7E:
	adds r0, r2, r5
	strb r4, [r0]
	strb r4, [r1]
	strb r4, [r1, 0x16]
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x9
	ble _08010C7E
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010C9C: .4byte gUnknown_02024C4C
_08010CA0: .4byte gUnknown_02024C44
_08010CA4: .4byte gUnknown_02024C3C
_08010CA8: .4byte gUnknown_02024C34
_08010CAC: .4byte gUnknown_02024CA8
_08010CB0: .4byte gUnknown_02024C2C
_08010CB4: .4byte gUnknown_02024C54
_08010CB8: .4byte gUnknown_02024C98
_08010CBC: .4byte gUnknown_02024C70
_08010CC0: .4byte gUnknown_02024C5C
_08010CC4: .4byte 0x02017100
_08010CC8: .4byte gUnknown_02024C80
_08010CCC: .4byte gUnknown_02024C7A
_08010CD0: .4byte gUnknown_02024C07
_08010CD4: .4byte gUnknown_02024C08
_08010CD8: .4byte word_2024DB8
_08010CDC: .4byte gUnknown_02024DBC
_08010CE0: .4byte gUnknown_02024C6C
_08010CE4: .4byte gUnknown_020239F8
_08010CE8: .4byte gSaveBlock2
_08010CEC: .4byte 0x02000000
_08010CF0: .4byte 0x00016084
_08010CF4: .4byte gUnknown_02024C0E
_08010CF8: .4byte gUnknown_02024D26
_08010CFC: .4byte gUnknown_02024A64
_08010D00: .4byte gUnknown_02024D1A
_08010D04: .4byte 0x00017130
_08010D08: .4byte 0x00017160
_08010D0C: .4byte gUnknown_02024D1E
_08010D10: .4byte gUnknown_02024D18
_08010D14: .4byte gUnknown_02024BEC
_08010D18: .4byte gUnknown_02024DE8
_08010D1C: .4byte 0x00016002
_08010D20: .4byte 0x000160a1
_08010D24: .4byte gUnknown_03004324
_08010D28: .4byte gUnknown_02024C0C
_08010D2C: .4byte 0x00016086
_08010D30: .4byte 0x00016087
_08010D34: .4byte gEnemyParty
_08010D38: .4byte gBaseStats
_08010D3C: .4byte 0x000004fb
_08010D40: .4byte 0x00016089
_08010D44: .4byte 0x00016088
_08010D48: .4byte 0x0001601b
_08010D4C: .4byte 0x000160ac
_08010D50: .4byte 0x000160c8
_08010D54: .4byte 0x00016113
_08010D58: .4byte gUnknown_030042E0
	thumb_func_end sub_8010874

	thumb_func_start sub_8010B88
sub_8010B88: @ 8010D5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r4, _08010EC0
	ldr r5, _08010EC4
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r1, sp
	adds r0, r4
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08010EC8
	ldr r3, _08010ECC
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	mov r10, r4
	adds r7, r5, 0
	ldr r1, _08010ED0
	mov r8, r1
	ldr r2, _08010ED4
	mov r12, r2
	cmp r0, 0x7F
	beq _08010E3A
	movs r5, 0
	adds r4, r7, 0
	movs r3, 0x58
	mov r2, r8
	adds r2, 0x18
	movs r1, 0x6
_08010DB0:
	ldrb r0, [r4]
	muls r0, r3
	adds r0, r5, r0
	adds r0, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x7
	ble _08010DB0
	movs r5, 0
	ldr r3, _08010ED8
	ldrb r3, [r3]
	cmp r5, r3
	bge _08010E26
	ldr r6, _08010EDC
	mov r9, r6
	ldr r3, _08010EC0
	ldr r4, _08010ED4
_08010DD2:
	movs r0, 0x58
	muls r0, r5
	add r0, r9
	str r0, [sp, 0x20]
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 19
	ands r0, r1
	cmp r0, 0
	beq _08010DF8
	ldrb r0, [r3, 0x14]
	ldr r2, _08010EC4
	ldrb r2, [r2]
	cmp r0, r2
	bne _08010DF8
	ldr r0, _08010EE0
	ands r1, r0
	ldr r6, [sp, 0x20]
	str r1, [r6]
_08010DF8:
	ldr r1, [r4]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08010E18
	ldrb r0, [r3, 0x15]
	ldr r2, _08010EC4
	ldrb r2, [r2]
	cmp r0, r2
	bne _08010E18
	movs r0, 0x19
	negs r0, r0
	ands r1, r0
	str r1, [r4]
	movs r0, 0
	strb r0, [r3, 0x15]
_08010E18:
	adds r3, 0x1C
	adds r4, 0x4
	adds r5, 0x1
	ldr r6, _08010ED8
	ldrb r6, [r6]
	cmp r5, r6
	blt _08010DD2
_08010E26:
	ldr r1, _08010ECC
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _08010EC8
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x7F
	bne _08010EEC
_08010E3A:
	ldrb r1, [r7]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08010EE4
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r7]
	lsls r1, 2
	add r1, r12
	ldr r0, [r1]
	ldr r2, _08010EE8
	ands r0, r2
	str r0, [r1]
	movs r5, 0
	ldr r3, _08010ED8
	ldrb r3, [r3]
	cmp r5, r3
	bge _08010F04
	movs r6, 0
_08010E6A:
	ldrb r0, [r7]
	bl battle_side_get_owner
	adds r4, r0, 0
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08010EAA
	ldr r1, _08010ED4
	lsls r0, r5, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08010EAA
	ldr r0, _08010EC0
	adds r0, r6, r0
	ldrb r0, [r0, 0x15]
	ldrb r3, [r7]
	cmp r0, r3
	bne _08010EAA
	movs r0, 0x19
	negs r0, r0
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	str r1, [r2]
_08010EAA:
	adds r6, 0x1C
	adds r5, 0x1
	ldr r0, _08010ED8
	ldrb r0, [r0]
	cmp r5, r0
	blt _08010E6A
	ldr r6, _08010EC0
	mov r10, r6
	ldr r7, _08010EC4
	b _08010F04
	.align 2, 0
_08010EC0: .4byte gUnknown_02024CA8
_08010EC4: .4byte gUnknown_02024A60
_08010EC8: .4byte gBattleMoves
_08010ECC: .4byte gUnknown_02024BE6
_08010ED0: .4byte gBattleMons
_08010ED4: .4byte gUnknown_02024C98
_08010ED8: .4byte gUnknown_02024A68
_08010EDC: .4byte gUnknown_02024AD0
_08010EE0: .4byte 0xfbffffff
_08010EE4: .4byte 0x15100007
_08010EE8: .4byte 0x0003043f
_08010EEC:
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	mov r1, r8
	adds r1, 0x50
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	add r0, r12
	str r1, [r0]
_08010F04:
	movs r5, 0
	ldr r6, _080110D0
	ldr r0, _080110D4
	ldrb r0, [r0]
	cmp r5, r0
	bge _08010F66
	ldr r1, _080110D8
	mov r9, r1
	ldr r2, _080110DC
	mov r8, r2
	ldr r4, _080110E0
	mov r12, r6
_08010F1C:
	movs r0, 0x58
	muls r0, r5
	mov r1, r9
	adds r3, r0, r1
	ldrb r0, [r4]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	lsls r2, r0, 16
	ldr r1, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _08010F3C
	bics r1, r2
	str r1, [r3]
_08010F3C:
	ldr r1, [r3]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08010F5C
	ldr r2, _080110E4
	adds r0, r5, r2
	add r0, r12
	ldrb r0, [r0]
	ldrb r2, [r4]
	cmp r0, r2
	bne _08010F5C
	ldr r0, _080110E8
	ands r1, r0
	str r1, [r3]
_08010F5C:
	adds r5, 0x1
	ldr r3, _080110D4
	ldrb r3, [r3]
	cmp r5, r3
	blt _08010F1C
_08010F66:
	ldrb r0, [r7]
	ldr r1, _080110EC
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r7]
	ldr r2, _080110F0
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r3, r10
	adds r1, r0, r3
	movs r5, 0
	movs r2, 0
_08010F88:
	adds r0, r1, r5
	strb r2, [r0]
	adds r5, 0x1
	cmp r5, 0x1B
	bls _08010F88
	ldr r1, _080110F4
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _080110F8
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x7F
	bne _08011000
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	mov r1, sp
	ldrb r1, [r1, 0xA]
	strb r1, [r0, 0xA]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	mov r1, sp
	ldrb r1, [r1, 0x15]
	strb r1, [r0, 0x15]
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r10
	mov r0, sp
	ldrb r2, [r0, 0xF]
	lsls r2, 28
	movs r4, 0xF
	lsrs r2, 28
	ldrb r3, [r1, 0xF]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xF]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	mov r1, sp
	ldrb r1, [r1, 0xF]
	lsrs r1, 4
	lsls r1, 4
	ldrb r2, [r0, 0xF]
	ands r4, r2
	orrs r4, r1
	strb r4, [r0, 0xF]
_08011000:
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	movs r3, 0
	movs r1, 0x2
	strb r1, [r0, 0x16]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _080110FC
	adds r0, r1
	movs r2, 0
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011100
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011104
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011108
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _0801110C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	ldr r1, _08011110
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011114
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x53
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	subs r1, 0x1B
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldr r2, _08011118
	adds r1, r6, r2
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	str r3, [r0]
	ldr r6, _080110F4
	strh r3, [r6]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080110D0: .4byte 0x02000000
_080110D4: .4byte gUnknown_02024A68
_080110D8: .4byte gUnknown_02024AD0
_080110DC: .4byte gBitTable
_080110E0: .4byte gUnknown_02024A60
_080110E4: .4byte 0x00016020
_080110E8: .4byte 0xffff1fff
_080110EC: .4byte gUnknown_02024E60
_080110F0: .4byte gUnknown_02024E64
_080110F4: .4byte gUnknown_02024BE6
_080110F8: .4byte gBattleMoves
_080110FC: .4byte gUnknown_02024C34
_08011100: .4byte gUnknown_02024C3C
_08011104: .4byte gUnknown_02024C44
_08011108: .4byte gUnknown_02024C4C
_0801110C: .4byte gUnknown_02024C2C
_08011110: .4byte gUnknown_02024C5C
_08011114: .4byte 0x000160ac
_08011118: .4byte 0x00017100
	thumb_func_end sub_8010B88

	thumb_func_start sub_8010F48
sub_8010F48: @ 801111C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r4, 0
	ldr r7, _0801143C
	ldr r0, _08011440
	mov r9, r0
	ldr r1, _08011444
	mov r8, r1
	ldr r2, _08011448
	mov r12, r2
	ldr r6, _0801144C
	adds r5, r7, 0
	movs r3, 0x58
	ldr r2, _08011450
	adds r2, 0x18
	movs r1, 0x6
_08011144:
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r4, r0
	adds r0, r2
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x7
	ble _08011144
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	ldr r2, _08011450
	adds r2, 0x50
	adds r0, r2
	movs r1, 0
	str r1, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	add r0, r9
	str r1, [r0]
	movs r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	bge _080111E6
	adds r3, r2, 0
	movs r5, 0
	ldr r1, _08011454
	mov r10, r1
	ldr r2, _08011448
	mov r9, r2
_08011182:
	ldr r1, [r3]
	movs r0, 0x80
	lsls r0, 19
	ands r0, r1
	cmp r0, 0
	beq _080111A0
	ldr r2, _08011458
	adds r0, r5, r2
	ldrb r0, [r0, 0x14]
	ldrb r2, [r7]
	cmp r0, r2
	bne _080111A0
	ldr r0, _0801145C
	ands r1, r0
	str r1, [r3]
_080111A0:
	ldrb r0, [r7]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	lsls r2, r0, 16
	ldr r1, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080111B8
	bics r1, r2
	str r1, [r3]
_080111B8:
	ldr r1, [r3]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080111D8
	ldr r2, _08011460
	adds r0, r4, r2
	add r0, r9
	ldrb r0, [r0]
	ldrb r2, [r7]
	cmp r0, r2
	bne _080111D8
	ldr r0, _08011464
	ands r1, r0
	str r1, [r3]
_080111D8:
	adds r3, 0x58
	adds r5, 0x1C
	adds r4, 0x1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _08011182
_080111E6:
	ldrb r0, [r7]
	ldr r1, _08011468
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r7]
	ldr r2, _0801146C
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r2, _08011458
	adds r1, r0, r2
	movs r4, 0
	movs r2, 0
_08011208:
	adds r0, r1, r4
	strb r2, [r0]
	adds r4, 0x1
	cmp r4, 0x1B
	bls _08011208
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	mov r9, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	mov r8, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	mov r10, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r5, 0x21
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r4, 0x41
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r5, r1
	strb r5, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r3, r1
	strb r3, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	mov r2, r9
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	mov r2, r8
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	mov r2, r10
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08011458
	adds r0, r1
	movs r3, 0
	movs r1, 0x2
	strb r1, [r0, 0x16]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r2, _08011470
	adds r0, r2
	movs r2, 0
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011474
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011478
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _0801147C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011480
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	ldr r1, _08011484
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08011488
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	subs r1, 0x3D
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x53
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldr r1, _0801148C
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	str r3, [r0]
	ldrb r0, [r7]
	movs r3, 0x58
	adds r1, r0, 0
	muls r1, r3
	ldr r2, _08011450
	adds r1, r2
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r2, _08011490
	adds r0, r2
	ldrb r0, [r0, 0x6]
	adds r1, 0x21
	strb r0, [r1]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r3
	ldr r0, _08011450
	adds r1, r0
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r2, _08011490
	adds r0, r2
	ldrb r0, [r0, 0x7]
	adds r1, 0x22
	strb r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801143C: .4byte gUnknown_02024A60
_08011440: .4byte gUnknown_02024C98
_08011444: .4byte gUnknown_02024A68
_08011448: .4byte 0x02000000
_0801144C: .4byte gUnknown_02024D28
_08011450: .4byte gBattleMons
_08011454: .4byte gBitTable
_08011458: .4byte gUnknown_02024CA8
_0801145C: .4byte 0xfbffffff
_08011460: .4byte 0x00016020
_08011464: .4byte 0xffff1fff
_08011468: .4byte gUnknown_02024E60
_0801146C: .4byte gUnknown_02024E64
_08011470: .4byte gUnknown_02024C34
_08011474: .4byte gUnknown_02024C3C
_08011478: .4byte gUnknown_02024C44
_0801147C: .4byte gUnknown_02024C4C
_08011480: .4byte gUnknown_02024C2C
_08011484: .4byte gUnknown_02024C5C
_08011488: .4byte 0x000160e8
_0801148C: .4byte 0x00017100
_08011490: .4byte gBaseStats
	thumb_func_end sub_8010F48

	thumb_func_start bc_8012FAC
bc_8012FAC: @ 8011494
	push {r4,r5,lr}
	ldr r5, _080114A4
	ldrb r0, [r5]
	cmp r0, 0
	beq _080114A8
	cmp r0, 0x1
	beq _080114CC
	b _08011502
	.align 2, 0
_080114A4: .4byte gUnknown_02024D1E
_080114A8:
	ldr r4, _080114C8
	ldrb r0, [r5, 0x1]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x00_a_b_0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08011502
	.align 2, 0
_080114C8: .4byte gUnknown_02024A60
_080114CC:
	ldr r0, _080114F0
	ldr r2, [r0]
	cmp r2, 0
	bne _08011502
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
	ldr r1, _080114F4
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08011500
	ldr r1, _080114F8
	ldr r0, _080114FC
	str r0, [r1]
	b _08011502
	.align 2, 0
_080114F0: .4byte gUnknown_02024A64
_080114F4: .4byte gUnknown_02024A68
_080114F8: .4byte gUnknown_030042D4
_080114FC: .4byte bc_load_battlefield
_08011500:
	strb r2, [r5]
_08011502:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end bc_8012FAC

	thumb_func_start bc_load_battlefield
bc_load_battlefield: @ 8011508
	push {r4,r5,lr}
	ldr r0, _08011540
	ldr r5, [r0]
	cmp r5, 0
	bne _08011538
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _08011544
	strb r0, [r4]
	ldr r0, _08011548
	ldrb r1, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x2E_a
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _0801154C
	ldr r0, _08011550
	str r0, [r1]
	ldr r0, _08011554
	strb r5, [r0]
	strb r5, [r0, 0x1]
_08011538:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011540: .4byte gUnknown_02024A64
_08011544: .4byte gUnknown_02024A60
_08011548: .4byte gUnknown_0300428C
_0801154C: .4byte gUnknown_030042D4
_08011550: .4byte sub_8011384
_08011554: .4byte gUnknown_02024D1E
	thumb_func_end bc_load_battlefield

	thumb_func_start sub_8011384
sub_8011384: @ 8011558
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080115B4
	ldr r1, [r0]
	cmp r1, 0
	beq _0801156A
	b _080117AE
_0801156A:
	ldr r2, _080115B8
	strb r1, [r2]
	ldr r0, _080115BC
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08011578
	b _080117A8
_08011578:
	movs r7, 0x58
	ldr r0, _080115C0
	mov r9, r0
	mov r8, r2
_08011580:
	ldr r0, _080115C4
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080115C8
	ldr r4, _080115B8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080115C8
	ldrb r0, [r4]
	muls r0, r7
	mov r1, r9
	adds r3, r0, r1
	movs r2, 0
	movs r1, 0
_080115A6:
	adds r0, r3, r2
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _080115A6
	b _08011692
	.align 2, 0
_080115B4: .4byte gUnknown_02024A64
_080115B8: .4byte gUnknown_02024A60
_080115BC: .4byte gUnknown_02024A68
_080115C0: .4byte gBattleMons
_080115C4: .4byte gUnknown_020239F8
_080115C8:
	mov r2, r8
	ldrb r0, [r2]
	muls r0, r7
	mov r1, r9
	adds r3, r0, r1
	movs r2, 0
	ldr r6, _08011704
	ldr r5, _08011708
	ldr r4, _0801170C
_080115DA:
	adds r0, r3, r2
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _080115DA
	mov r2, r8
	ldrb r0, [r2]
	adds r2, r0, 0
	muls r2, r7
	add r2, r9
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x6]
	adds r2, 0x21
	strb r0, [r2]
	mov r1, r8
	ldrb r0, [r1]
	adds r2, r0, 0
	muls r2, r7
	add r2, r9
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x7]
	adds r2, 0x22
	strb r0, [r2]
	mov r2, r8
	ldrb r0, [r2]
	adds r1, r0, 0
	muls r1, r7
	add r1, r9
	ldrh r0, [r1]
	ldrb r1, [r1, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	mov r2, r8
	ldrb r1, [r2]
	muls r1, r7
	add r1, r9
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	ldr r1, _08011710
	adds r0, r1
	mov r2, r8
	ldrb r1, [r2]
	muls r1, r7
	add r1, r9
	ldrh r1, [r1, 0x28]
	strh r1, [r0]
	movs r2, 0
	ldr r4, _0801170C
	movs r5, 0x58
	ldr r1, _08011714
	adds r6, r4, 0
	movs r0, 0x18
	negs r0, r0
	adds r0, r1
	mov r12, r0
	movs r3, 0x6
_08011672:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r2, r0
	adds r0, r1
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x7
	ble _08011672
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r7
	mov r0, r12
	adds r0, 0x50
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_08011692:
	ldr r4, _0801170C
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _080116AC
	movs r0, 0
	bl dp01_build_cmdbuf_x07_7_7_7
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080116AC:
	ldr r5, _08011718
	ldrh r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08011720
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080116D2
	movs r0, 0
	bl dp01_build_cmdbuf_x07_7_7_7
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080116D2:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0801175C
	ldrh r1, [r5]
	ldr r2, _0801171C
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801175C
	ldrb r0, [r4]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	b _0801175C
	.align 2, 0
_08011704: .4byte gBaseStats
_08011708: .4byte gUnknown_02024260
_0801170C: .4byte gUnknown_02024A60
_08011710: .4byte 0x020160bc
_08011714: .4byte gUnknown_02024A98
_08011718: .4byte gUnknown_020239F8
_0801171C: .4byte 0x00000902
_08011720:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0801175C
	ldrh r1, [r5]
	ldr r2, _080117BC
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0801175C
	ldrb r0, [r4]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	movs r0, 0
	bl dp01_build_cmdbuf_x04_4_4_4
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0801175C:
	ldr r0, _080117C0
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08011792
	ldr r4, _080117C4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08011786
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08011792
_08011786:
	movs r0, 0
	bl dp01_build_cmdbuf_x07_7_7_7
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011792:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _080117C8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080117A8
	b _08011580
_080117A8:
	ldr r1, _080117CC
	ldr r0, _080117D0
	str r0, [r1]
_080117AE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080117BC: .4byte 0x00000902
_080117C0: .4byte gUnknown_020239F8
_080117C4: .4byte gUnknown_02024A60
_080117C8: .4byte gUnknown_02024A68
_080117CC: .4byte gUnknown_030042D4
_080117D0: .4byte bc_801333C
	thumb_func_end sub_8011384

	thumb_func_start bc_801333C
bc_801333C: @ 80117D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	ldr r0, _0801182C
	ldr r0, [r0]
	cmp r0, 0
	beq _080117E6
	b _08011960
_080117E6:
	ldr r0, _08011830
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080117F4
	b _08011900
_080117F4:
	movs r7, 0
	add r0, sp, 0x4
	mov r8, r0
	mov r6, r8
	mov r5, sp
_080117FE:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08011834
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08011824
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _0801183C
_08011824:
	ldr r0, _08011838
	strh r0, [r5]
	movs r0, 0
	b _0801184E
	.align 2, 0
_0801182C: .4byte gUnknown_02024A64
_08011830: .4byte gUnknown_020239F8
_08011834: .4byte gEnemyParty
_08011838: .4byte 0x0000ffff
_0801183C:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_0801184E:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _080117FE
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r4, _080118A8
	strb r0, [r4]
	movs r0, 0
	mov r1, sp
	movs r2, 0x80
	bl dp01_build_cmdbuf_x30_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	movs r7, 0
	mov r6, r8
	mov r5, sp
_0801187A:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080118AC
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080118A0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _080118B4
_080118A0:
	ldr r0, _080118B0
	strh r0, [r5]
	movs r0, 0
	b _080118C6
	.align 2, 0
_080118A8: .4byte gUnknown_02024A60
_080118AC: .4byte gPlayerParty
_080118B0: .4byte 0x0000ffff
_080118B4:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_080118C6:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _0801187A
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _080118F4
	strb r0, [r4]
	movs r0, 0
	mov r1, sp
	movs r2, 0x80
	bl dp01_build_cmdbuf_x30_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080118F8
	ldr r0, _080118FC
	b _0801195E
	.align 2, 0
_080118F4: .4byte gUnknown_02024A60
_080118F8: .4byte gUnknown_030042D4
_080118FC: .4byte bc_battle_begin_message
_08011900:
	movs r7, 0
	add r6, sp, 0x4
	mov r5, sp
_08011906:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08011934
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0801192C
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _0801193C
_0801192C:
	ldr r0, _08011938
	strh r0, [r5]
	movs r0, 0
	b _0801194E
	.align 2, 0
_08011934: .4byte gPlayerParty
_08011938: .4byte 0x0000ffff
_0801193C:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_0801194E:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _08011906
	ldr r1, _0801196C
	ldr r0, _08011970
_0801195E:
	str r0, [r1]
_08011960:
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801196C: .4byte gUnknown_030042D4
_08011970: .4byte bc_8013568
	thumb_func_end bc_801333C

	thumb_func_start bc_battle_begin_message
bc_battle_begin_message: @ 8011974
	push {lr}
	ldr r0, _0801199C
	ldr r0, [r0]
	cmp r0, 0
	bne _08011996
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _080119A0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0
	bl b_std_message
	ldr r1, _080119A4
	ldr r0, _080119A8
	str r0, [r1]
_08011996:
	pop {r0}
	bx r0
	.align 2, 0
_0801199C: .4byte gUnknown_02024A64
_080119A0: .4byte gUnknown_02024A60
_080119A4: .4byte gUnknown_030042D4
_080119A8: .4byte sub_8011800
	thumb_func_end bc_battle_begin_message

	thumb_func_start bc_8013568
bc_8013568: @ 80119AC
	push {lr}
	ldr r0, _080119C8
	ldr r0, [r0]
	cmp r0, 0
	bne _080119C4
	ldr r1, _080119CC
	ldr r0, _080119D0
	str r0, [r1]
	movs r0, 0
	movs r1, 0
	bl b_std_message
_080119C4:
	pop {r0}
	bx r0
	.align 2, 0
_080119C8: .4byte gUnknown_02024A64
_080119CC: .4byte gUnknown_030042D4
_080119D0: .4byte sub_8011970
	thumb_func_end bc_8013568

	thumb_func_start sub_8011800
sub_8011800: @ 80119D4
	push {lr}
	ldr r0, _080119FC
	ldr r0, [r0]
	cmp r0, 0
	bne _080119F6
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl b_std_message
	ldr r1, _08011A00
	ldr r0, _08011A04
	str r0, [r1]
_080119F6:
	pop {r0}
	bx r0
	.align 2, 0
_080119FC: .4byte gUnknown_02024A64
_08011A00: .4byte gUnknown_030042D4
_08011A04: .4byte sub_8011834
	thumb_func_end sub_8011800

	thumb_func_start sub_8011834
sub_8011834: @ 8011A08
	push {r4,lr}
	ldr r0, _08011A80
	ldr r1, [r0]
	cmp r1, 0
	bne _08011A78
	ldr r2, _08011A84
	strb r1, [r2]
	ldr r0, _08011A88
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011A72
	adds r4, r2, 0
_08011A20:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011A3A
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011A3A:
	ldr r0, _08011A8C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08011A60
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08011A60
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011A60:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011A88
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011A20
_08011A72:
	ldr r1, _08011A90
	ldr r0, _08011A94
	str r0, [r1]
_08011A78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011A80: .4byte gUnknown_02024A64
_08011A84: .4byte gUnknown_02024A60
_08011A88: .4byte gUnknown_02024A68
_08011A8C: .4byte gUnknown_020239F8
_08011A90: .4byte gUnknown_030042D4
_08011A94: .4byte bc_801362C
	thumb_func_end sub_8011834

	thumb_func_start bc_801362C
bc_801362C: @ 8011A98
	push {r4,r5,lr}
	ldr r0, _08011B04
	ldr r1, [r0]
	cmp r1, 0
	bne _08011AFE
	ldr r2, _08011B08
	strb r1, [r2]
	ldr r0, _08011B0C
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011AF8
	adds r4, r2, 0
	ldr r5, _08011B10
_08011AB2:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011AE6
	ldr r0, _08011B14
	ldrh r1, [r0]
	ldr r2, _08011B18
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08011AE6
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r5
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
_08011AE6:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011B0C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011AB2
_08011AF8:
	ldr r1, _08011B1C
	ldr r0, _08011B20
	str r0, [r1]
_08011AFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011B04: .4byte gUnknown_02024A64
_08011B08: .4byte gUnknown_02024A60
_08011B0C: .4byte gUnknown_02024A68
_08011B10: .4byte gBattleMons
_08011B14: .4byte gUnknown_020239F8
_08011B18: .4byte 0x00000902
_08011B1C: .4byte gUnknown_030042D4
_08011B20: .4byte sub_8011970
	thumb_func_end bc_801362C

	thumb_func_start unref_sub_8011950
unref_sub_8011950: @ 8011B24
	push {lr}
	ldr r0, _08011B38
	ldr r0, [r0]
	cmp r0, 0
	bne _08011B34
	ldr r1, _08011B3C
	ldr r0, _08011B40
	str r0, [r1]
_08011B34:
	pop {r0}
	bx r0
	.align 2, 0
_08011B38: .4byte gUnknown_02024A64
_08011B3C: .4byte gUnknown_030042D4
_08011B40: .4byte sub_8011970
	thumb_func_end unref_sub_8011950

	thumb_func_start sub_8011970
sub_8011970: @ 8011B44
	push {lr}
	ldr r0, _08011B78
	ldr r0, [r0]
	cmp r0, 0
	bne _08011B72
	ldr r0, _08011B7C
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08011B6C
	movs r0, 0
	bl battle_get_side_with_given_state
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl b_std_message
_08011B6C:
	ldr r1, _08011B80
	ldr r0, _08011B84
	str r0, [r1]
_08011B72:
	pop {r0}
	bx r0
	.align 2, 0
_08011B78: .4byte gUnknown_02024A64
_08011B7C: .4byte gUnknown_020239F8
_08011B80: .4byte gUnknown_030042D4
_08011B84: .4byte sub_80119B4
	thumb_func_end sub_8011970

	thumb_func_start sub_80119B4
sub_80119B4: @ 8011B88
	push {r4,lr}
	ldr r0, _08011C14
	ldr r1, [r0]
	cmp r1, 0
	bne _08011C0C
	ldr r2, _08011C18
	strb r1, [r2]
	ldr r0, _08011C1C
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011BF0
	adds r4, r2, 0
_08011BA0:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _08011BB8
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011BB8:
	ldr r0, _08011C20
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08011BDE
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08011BDE
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011BDE:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011C1C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011BA0
_08011BF0:
	ldr r1, _08011C24
	ldr r2, _08011C28
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08011C2C
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08011C30
	adds r1, r0
	strb r2, [r1]
	ldr r1, _08011C34
	ldr r0, _08011C38
	str r0, [r1]
_08011C0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011C14: .4byte gUnknown_02024A64
_08011C18: .4byte gUnknown_02024A60
_08011C1C: .4byte gUnknown_02024A68
_08011C20: .4byte gUnknown_020239F8
_08011C24: .4byte 0x02000000
_08011C28: .4byte 0x00016058
_08011C2C: .4byte 0x000160f9
_08011C30: .4byte 0x000160e6
_08011C34: .4byte gUnknown_030042D4
_08011C38: .4byte sub_8011B00
	thumb_func_end sub_80119B4

	thumb_func_start unref_sub_8011A68
unref_sub_8011A68: @ 8011C3C
	push {r4,r5,lr}
	ldr r0, _08011CAC
	ldr r1, [r0]
	cmp r1, 0
	bne _08011CA6
	ldr r2, _08011CB0
	strb r1, [r2]
	ldr r0, _08011CB4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011C8A
	adds r4, r2, 0
	ldr r5, _08011CB8
_08011C56:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08011C78
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	bl sub_800C704
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011C78:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011CB4
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011C56
_08011C8A:
	ldr r1, _08011CBC
	ldr r2, _08011CC0
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08011CC4
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08011CC8
	adds r1, r0
	strb r2, [r1]
	ldr r1, _08011CCC
	ldr r0, _08011CD0
	str r0, [r1]
_08011CA6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011CAC: .4byte gUnknown_02024A64
_08011CB0: .4byte gUnknown_02024A60
_08011CB4: .4byte gUnknown_02024A68
_08011CB8: .4byte gUnknown_02024A6A
_08011CBC: .4byte 0x02000000
_08011CC0: .4byte 0x00016058
_08011CC4: .4byte 0x000160f9
_08011CC8: .4byte 0x000160e6
_08011CCC: .4byte gUnknown_030042D4
_08011CD0: .4byte sub_8011B00
	thumb_func_end unref_sub_8011A68

	thumb_func_start sub_8011B00
sub_8011B00: @ 8011CD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	ldr r0, _08011D18
	ldr r0, [r0]
	cmp r0, 0
	beq _08011CEC
	b _08011F42
_08011CEC:
	ldr r0, _08011D1C
	ldr r1, _08011D20
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08011D76
	movs r5, 0
	ldr r1, _08011D24
	adds r3, r1, 0
	ldrb r2, [r1]
	cmp r5, r2
	bge _08011D12
	ldr r2, _08011D28
_08011D06:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, 0x1
	ldrb r0, [r1]
	cmp r5, r0
	blt _08011D06
_08011D12:
	movs r5, 0
	b _08011D6C
	.align 2, 0
_08011D18: .4byte gUnknown_02024A64
_08011D1C: .4byte 0x02000000
_08011D20: .4byte 0x00016058
_08011D24: .4byte gUnknown_02024A68
_08011D28: .4byte gUnknown_02024A7A
_08011D2C:
	adds r4, r5, 0x1
	mov r8, r4
	ldrb r1, [r1]
	cmp r8, r1
	bge _08011D6A
	ldr r6, _08011D9C
	ldr r3, _08011DA0
	lsls r7, r5, 24
_08011D3C:
	adds r0, r5, r6
	ldrb r0, [r0]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, 0x1
	str r3, [sp, 0x4]
	bl b_first_side
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _08011D60
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r7, 24
	bl sub_8012FBC
	ldr r3, [sp, 0x4]
_08011D60:
	adds r4, 0x1
	ldr r0, _08011DA0
	ldrb r0, [r0]
	cmp r4, r0
	blt _08011D3C
_08011D6A:
	mov r5, r8
_08011D6C:
	adds r1, r3, 0
	ldrb r0, [r3]
	subs r0, 0x1
	cmp r5, r0
	blt _08011D2C
_08011D76:
	ldr r0, _08011DA4
	ldr r1, _08011DA8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _08011DAC
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08011DAC
	movs r0, 0x1
	strb r0, [r4]
	b _08011F42
	.align 2, 0
_08011D9C: .4byte gUnknown_02024A7A
_08011DA0: .4byte gUnknown_02024A68
_08011DA4: .4byte 0x02000000
_08011DA8: .4byte 0x000160e6
_08011DAC:
	ldr r0, _08011F50
	ldr r3, _08011F54
	adds r2, r0, r3
	ldr r1, _08011F58
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08011DFC
	ldr r5, _08011F5C
	adds r4, r2, 0
_08011DC0:
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08011DE2
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08011DE2:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	mov r1, r9
	cmp r1, 0
	beq _08011DF0
	b _08011F42
_08011DF0:
	ldr r1, _08011F58
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011DC0
_08011DFC:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08011E16
	b _08011F42
_08011E16:
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08011E2C
	b _08011F42
_08011E2C:
	ldr r0, _08011F50
	ldr r3, _08011F60
	adds r2, r0, r3
	ldr r0, _08011F58
	ldrb r1, [r2]
	adds r3, r0, 0
	ldrb r0, [r3]
	cmp r1, r0
	bcs _08011E7C
	ldr r5, _08011F5C
	adds r4, r2, 0
_08011E42:
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	str r3, [sp, 0x4]
	bl sub_801A02C
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _08011E64
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08011E64:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	mov r1, r9
	cmp r1, 0
	bne _08011F42
	ldr r1, _08011F58
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011E42
_08011E7C:
	ldrb r0, [r3]
	cmp r0, 0
	beq _08011E8A
	adds r5, r0, 0
_08011E84:
	subs r5, 0x1
	cmp r5, 0
	bne _08011E84
_08011E8A:
	movs r5, 0
	ldr r0, _08011F50
	mov r8, r5
	ldr r3, _08011F64
	ldr r1, _08011F68
	adds r2, r0, r1
	movs r7, 0x6
	ldr r6, _08011F6C
	movs r4, 0xFF
_08011E9C:
	strb r7, [r2]
	adds r1, r5, r6
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, r8
	strh r0, [r3]
	adds r3, 0x2
	adds r2, 0x1
	adds r5, 0x1
	cmp r5, 0x3
	ble _08011E9C
	movs r0, 0
	bl sub_801365C
	bl sub_801377C
	ldr r0, _08011F50
	ldr r1, _08011F70
	ldrb r1, [r1]
	ldr r2, _08011F74
	adds r0, r2
	strb r1, [r0]
	ldr r1, _08011F78
	ldr r0, _08011F7C
	str r0, [r1]
	bl sub_80156DC
	ldr r1, _08011F80
	movs r2, 0
	adds r0, r1, 0x7
_08011EDA:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08011EDA
	movs r5, 0
	ldr r3, _08011F58
	ldr r2, _08011F50
	ldr r6, _08011F84
	ldrb r0, [r3]
	cmp r5, r0
	bge _08011F0A
	ldr r0, _08011F88
	movs r4, 0x9
	negs r4, r4
	adds r1, r0, 0
	adds r1, 0x50
_08011EFA:
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
	adds r1, 0x58
	adds r5, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	blt _08011EFA
_08011F0A:
	movs r1, 0xB0
	lsls r1, 9
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _08011F8C
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _08011F90
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, 0x1
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _08011F94
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, 0x4D
	adds r0, r2, r3
	strb r1, [r0]
	subs r3, 0x4B
	adds r0, r2, r3
	strb r1, [r0]
	strb r1, [r6]
	bl Random
	ldr r1, _08011F98
	strh r0, [r1]
_08011F42:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011F50: .4byte 0x02000000
_08011F54: .4byte 0x00016058
_08011F58: .4byte gUnknown_02024A68
_08011F5C: .4byte gUnknown_02024A7A
_08011F60: .4byte 0x000160f9
_08011F64: .4byte gUnknown_02024C60
_08011F68: .4byte 0x00016068
_08011F6C: .4byte gUnknown_02024C18
_08011F70: .4byte gUnknown_02024C0C
_08011F74: .4byte 0x000160a6
_08011F78: .4byte gUnknown_030042D4
_08011F7C: .4byte sub_8012324
_08011F80: .4byte gUnknown_02024D1E
_08011F84: .4byte gUnknown_02024C68
_08011F88: .4byte gBattleMons
_08011F8C: .4byte 0x00016001
_08011F90: .4byte 0x00016110
_08011F94: .4byte 0x0001600c
_08011F98: .4byte gUnknown_02024D1C
	thumb_func_end sub_8011B00

	thumb_func_start bc_8013B1C
bc_8013B1C: @ 8011F9C
	push {r4-r6,lr}
	ldr r0, _08012034
	ldr r0, [r0]
	cmp r0, 0
	bne _0801202E
	ldr r1, _08012038
	ldr r0, _0801203C
	str r0, [r1]
	ldr r3, _08012040
	ldr r1, _08012044
	movs r2, 0
	adds r0, r1, 0x7
_08011FB4:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08011FB4
	movs r4, 0
	ldrb r3, [r3]
	cmp r4, r3
	bge _08012006
	ldr r5, _08012048
	adds r6, r5, 0
	adds r6, 0x4C
_08011FCA:
	movs r0, 0x58
	adds r2, r4, 0
	muls r2, r0
	adds r1, r5, 0
	adds r1, 0x50
	adds r1, r2, r1
	ldr r3, [r1]
	subs r0, 0x61
	ands r3, r0
	str r3, [r1]
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08011FFC
	movs r0, 0x80
	lsls r0, 5
	ands r3, r0
	cmp r3, 0
	beq _08011FFC
	lsls r0, r4, 24
	lsrs r0, 24
	bl b_cancel_multi_turn_move_maybe
_08011FFC:
	adds r4, 0x1
	ldr r0, _08012040
	ldrb r0, [r0]
	cmp r4, r0
	blt _08011FCA
_08012006:
	ldr r0, _0801204C
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _08012050
	adds r1, r0, r3
	strb r2, [r1]
	ldr r3, _08012054
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
_08012024:
	ldr r1, _08012058
	adds r0, r1
	strb r2, [r0]
	ldr r0, _0801205C
	strb r2, [r0]
_0801202E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012034: .4byte gUnknown_02024A64
_08012038: .4byte gUnknown_030042D4
_0801203C: .4byte sub_8011E8C
_08012040: .4byte gUnknown_02024A68
_08012044: .4byte gUnknown_02024D1E
_08012048: .4byte gBattleMons
_0801204C: .4byte 0x02000000
_08012050: .4byte 0x00016001
_08012054: .4byte 0x00016110
_08012058: .4byte 0x0001600e
_0801205C: .4byte gUnknown_02024C68
	thumb_func_end bc_8013B1C

	thumb_func_start sub_8011E8C
sub_8011E8C: @ 8012060
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0x1
	bl sub_801365C
	ldr r0, _08012110
	ldrb r0, [r0]
	cmp r0, 0
	bne _08012090
	bl sub_8015DFC
	lsls r0, 24
	cmp r0, 0
	beq _08012084
	b _080121C2
_08012084:
	bl sub_8016558
	lsls r0, 24
	cmp r0, 0
	beq _08012090
	b _080121C2
_08012090:
	bl sub_80173A4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0801209E
	b _080121C2
_0801209E:
	ldr r5, _08012114
	ldr r2, _08012118
	adds r0, r5, r2
	strb r1, [r0]
	bl sub_80170DC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080120B4
	b _080121C2
_080120B4:
	movs r0, 0
	bl sub_801365C
	ldr r2, _0801211C
	ldr r0, [r2]
	ldr r1, _08012120
	ands r0, r1
	ldr r1, _08012124
	ands r0, r1
	ldr r1, _08012128
	ands r0, r1
	ldr r1, _0801212C
	ands r0, r1
	str r0, [r2]
	ldr r3, _08012130
	adds r0, r5, r3
	strb r4, [r0]
	ldr r1, _08012134
	adds r0, r5, r1
	strb r4, [r0]
	ldr r2, _08012138
	adds r0, r5, r2
	strb r4, [r0]
	ldr r0, _0801213C
	str r4, [r0]
	ldr r0, _08012140
	strb r4, [r0]
	ldr r1, _08012144
	movs r2, 0
	adds r0, r1, 0x4
_080120F0:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080120F0
	ldr r0, _08012110
	ldrb r0, [r0]
	cmp r0, 0
	beq _08012154
	ldr r1, _08012148
	movs r0, 0xC
	strb r0, [r1]
	ldr r1, _0801214C
	ldr r0, _08012150
	str r0, [r1]
	b _080121C2
	.align 2, 0
_08012110: .4byte gUnknown_02024D26
_08012114: .4byte 0x02000000
_08012118: .4byte 0x00016059
_0801211C: .4byte gUnknown_02024C6C
_08012120: .4byte 0xfffffdff
_08012124: .4byte 0xfff7ffff
_08012128: .4byte 0xffbfffff
_0801212C: .4byte 0xffefffff
_08012130: .4byte 0x00016002
_08012134: .4byte 0x000160a1
_08012138: .4byte 0x0001600c
_0801213C: .4byte gUnknown_02024BEC
_08012140: .4byte gUnknown_02024C68
_08012144: .4byte gUnknown_02024D1E
_08012148: .4byte gUnknown_02024A7F
_0801214C: .4byte gUnknown_030042D4
_08012150: .4byte sub_80138F0
_08012154:
	ldr r1, _080121D0
	ldrb r0, [r1, 0x13]
	cmp r0, 0xFE
	bhi _08012160
	adds r0, 0x1
	strb r0, [r1, 0x13]
_08012160:
	movs r2, 0
	ldr r4, _080121D4
	ldr r3, _080121D8
	mov r9, r3
	ldr r0, _080121DC
	mov r10, r0
	ldr r1, _080121E0
	mov r12, r1
	ldr r3, _080121E4
	mov r8, r3
	ldrb r0, [r4]
	cmp r2, r0
	bge _08012196
	ldr r7, _080121E8
	movs r6, 0xFF
	movs r5, 0
	ldr r3, _080121EC
_08012182:
	adds r1, r2, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	strh r5, [r3]
	adds r3, 0x2
	adds r2, 0x1
	ldrb r1, [r4]
	cmp r2, r1
	blt _08012182
_08012196:
	ldr r0, _080121D8
	movs r1, 0x6
	movs r2, 0x3
	ldr r3, _080121F0
	adds r0, r3
_080121A0:
	strb r1, [r0]
	subs r0, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _080121A0
	mov r0, r12
	ldrb r1, [r0]
	ldr r0, _080121F4
	add r0, r9
	strb r1, [r0]
	mov r1, r8
	mov r2, r10
	str r1, [r2]
	bl Random
	ldr r1, _080121F8
	strh r0, [r1]
_080121C2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080121D0: .4byte gUnknown_030042E0
_080121D4: .4byte gUnknown_02024A68
_080121D8: .4byte 0x02000000
_080121DC: .4byte gUnknown_030042D4
_080121E0: .4byte gUnknown_02024C0C
_080121E4: .4byte sub_8012324
_080121E8: .4byte gUnknown_02024C18
_080121EC: .4byte gUnknown_02024C60
_080121F0: .4byte 0x0001606b
_080121F4: .4byte 0x000160a6
_080121F8: .4byte gUnknown_02024D1C
	thumb_func_end sub_8011E8C

	thumb_func_start sub_8012028
sub_8012028: @ 80121FC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _08012220
	ldr r0, _08012224
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801222C
	ldr r1, _08012228
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x7]
	b _08012236
	.align 2, 0
_08012220: .4byte gBattleMons
_08012224: .4byte gUnknown_02024A60
_08012228: .4byte gEnigmaBerries
_0801222C:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r2, r0, 24
_08012236:
	ldr r1, _08012350
	ldr r3, _08012354
	ldrb r0, [r3]
	strb r0, [r1]
	cmp r2, 0x25
	bne _08012244
	b _080123C8
_08012244:
	ldr r0, _08012358
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08012252
	b _080123C8
_08012252:
	ldr r1, _0801235C
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x32
	bne _08012266
	b _080123C8
_08012266:
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _08012360
	ldrb r0, [r0]
	cmp r5, r0
	bge _080122FA
	movs r7, 0
_0801227C:
	lsrs r4, r7, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _080122A0
	ldr r1, _0801235C
	movs r0, 0x58
	muls r0, r5
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0x17
	bne _080122A0
	b _080123D0
_080122A0:
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _080122EA
	ldr r3, _0801235C
	ldr r0, _08012354
	ldrb r0, [r0]
	movs r2, 0x58
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	beq _080122EA
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080122EA
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080122EA
	adds r0, r5, 0
	muls r0, r2
	adds r0, r3
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0x47
	bne _080122EA
	b _080123F4
_080122EA:
	movs r0, 0x80
	lsls r0, 17
	adds r7, r0
	adds r5, 0x1
	ldr r0, _08012360
	ldrb r0, [r0]
	cmp r5, r0
	blt _0801227C
_080122FA:
	ldr r4, _08012354
	ldrb r1, [r4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _08012374
	ldr r6, _0801235C
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _08012332
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08012374
_08012332:
	ldr r0, _08012364
	subs r1, r5, 0x1
	ldr r2, _08012368
	adds r0, r2
	strb r1, [r0]
	ldr r2, _0801236C
	adds r0, r1, 0
	muls r0, r3
	adds r0, r6
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _08012370
	movs r0, 0x2
	b _0801241C
	.align 2, 0
_08012350: .4byte gUnknown_02024C0B
_08012354: .4byte gUnknown_02024A60
_08012358: .4byte gUnknown_020239F8
_0801235C: .4byte gBattleMons
_08012360: .4byte gUnknown_02024A68
_08012364: .4byte 0x02000000
_08012368: .4byte 0x00016003
_0801236C: .4byte byte_2024C06
_08012370: .4byte gUnknown_02024D1E
_08012374:
	ldr r1, _080123A8
	ldr r0, _080123AC
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080123B0
	ands r0, r1
	cmp r0, 0
	bne _0801239E
	ldr r1, _080123B4
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _080123BC
_0801239E:
	ldr r1, _080123B8
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _0801241E
	.align 2, 0
_080123A8: .4byte gBattleMons
_080123AC: .4byte gUnknown_02024A60
_080123B0: .4byte 0x0400e000
_080123B4: .4byte gUnknown_02024C98
_080123B8: .4byte gUnknown_02024D1E
_080123BC:
	ldr r0, _080123CC
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08012418
_080123C8:
	movs r0, 0
	b _0801241E
	.align 2, 0
_080123CC: .4byte gUnknown_020239F8
_080123D0:
	ldr r0, _080123E4
	ldr r1, _080123E8
	adds r0, r1
	strb r5, [r0]
	ldr r1, _080123EC
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _080123F0
	movs r0, 0x2
	b _0801241C
	.align 2, 0
_080123E4: .4byte 0x02000000
_080123E8: .4byte 0x00016003
_080123EC: .4byte byte_2024C06
_080123F0: .4byte gUnknown_02024D1E
_080123F4:
	ldr r0, _08012408
	ldr r1, _0801240C
	adds r0, r1
	strb r5, [r0]
	ldr r1, _08012410
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _08012414
	movs r0, 0x2
	b _0801241C
	.align 2, 0
_08012408: .4byte 0x02000000
_0801240C: .4byte 0x00016003
_08012410: .4byte byte_2024C06
_08012414: .4byte gUnknown_02024D1E
_08012418:
	ldr r1, _08012428
	movs r0, 0x1
_0801241C:
	strb r0, [r1, 0x5]
_0801241E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012428: .4byte gUnknown_02024D1E
	thumb_func_end sub_8012028

	thumb_func_start sub_8012258
sub_8012258: @ 801242C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r7, _080124B8
	ldr r4, _080124BC
	ldr r1, _080124C0
	lsls r6, r5, 1
	ldr r2, _080124C4
	adds r0, r5, r2
	adds r0, r6, r0
	adds r2, r0, r1
_08012444:
	adds r1, r3, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _08012444
	adds r0, r6, r7
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _080124C0
	ldr r1, _080124C8
	adds r0, r5, r1
	adds r0, r7
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8094C98
	ldr r0, _080124CC
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080124D0
	movs r3, 0
	ldr r2, _080124C4
	movs r0, 0x2
	adds r1, r5, 0
	eors r1, r0
	adds r0, r5, r2
	adds r0, r6, r0
	adds r4, r0, r7
	ldr r5, _080124BC
	lsls r0, r1, 1
	adds r0, r1
	adds r0, r2
	adds r2, r0, r7
_080124A0:
	adds r0, r3, r5
	ldrb r1, [r0]
	strb r1, [r4]
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _080124A0
	b _080124EA
	.align 2, 0
_080124B8: .4byte gUnknown_02024A6A
_080124BC: .4byte gUnknown_02038470
_080124C0: .4byte 0x02000000
_080124C4: .4byte 0x0001606c
_080124C8: .4byte 0x00016068
_080124CC: .4byte gUnknown_020239F8
_080124D0:
	movs r3, 0
	ldr r2, _080124F0
	adds r0, r5, r2
	adds r0, r6, r0
	adds r1, r0, r7
	ldr r2, _080124F4
_080124DC:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _080124DC
_080124EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080124F0: .4byte 0x0001606c
_080124F4: .4byte gUnknown_02038470
	thumb_func_end sub_8012258

	thumb_func_start sub_8012324
sub_8012324: @ 80124F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _08012514
	movs r1, 0
	strb r1, [r0, 0x4]
	ldr r0, _08012518
	strb r1, [r0]
	ldr r0, _0801251C
	bl _08013148
	.align 2, 0
_08012514: .4byte gUnknown_02024D1E
_08012518: .4byte gUnknown_02024A60
_0801251C: .4byte gUnknown_02024A68
_08012520:
	ldr r4, _08012548
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0801254C
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _0801253C
	bl _0801313A
_0801253C:
	lsls r0, 2
	ldr r1, _08012550
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012548: .4byte gUnknown_02024A60
_0801254C: .4byte gUnknown_02024D1E
_08012550: .4byte _08012554
	.align 2, 0
_08012554:
	.4byte _08012570
	.4byte _0801269C
	.4byte _08012BFC
	.4byte _08012F7C
	.4byte _08013024
	.4byte _08013068
	.4byte _0801310C
_08012570:
	ldr r4, _08012608
	ldr r0, _0801260C
	ldrb r0, [r0]
	ldr r1, _08012610
	adds r0, r1
	adds r0, r4
	movs r1, 0x6
	strb r1, [r0]
	ldr r0, _08012614
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080125CC
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080125CC
	eors r5, r1
	adds r0, r5, 0
	bl battle_get_side_with_given_state
	ldr r2, _08012618
	adds r1, r4, r2
	ldrb r1, [r1]
	ldr r2, _0801261C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080125CC
	ldr r4, _08012620
	adds r0, r5, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _080125CC
	bl _0801313A
_080125CC:
	ldr r0, _08012608
	ldr r3, _08012618
	adds r0, r3
	ldrb r3, [r0]
	ldr r1, _0801261C
	ldr r4, _0801260C
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ands r3, r0
	cmp r3, 0
	beq _0801263C
	ldr r0, _08012624
	adds r0, r2, r0
	movs r1, 0xD
	strb r1, [r0]
	ldr r0, _08012614
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08012628
	ldr r0, _08012620
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x4
	strb r0, [r1]
	bl _0801313A
	.align 2, 0
_08012608: .4byte 0x02000000
_0801260C: .4byte gUnknown_02024A60
_08012610: .4byte 0x00016068
_08012614: .4byte gUnknown_020239F8
_08012618: .4byte 0x000160a6
_0801261C: .4byte gBitTable
_08012620: .4byte gUnknown_02024D1E
_08012624: .4byte gUnknown_02024C18
_08012628:
	ldr r0, _08012638
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x3
	strb r0, [r1]
	bl _0801313A
	.align 2, 0
_08012638: .4byte gUnknown_02024D1E
_0801263C:
	ldr r1, _08012670
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _0801265C
	movs r0, 0x80
	lsls r0, 15
	ands r1, r0
	cmp r1, 0
	beq _0801267C
_0801265C:
	ldr r0, _08012674
	adds r0, r2, r0
	strb r3, [r0]
	ldr r1, _08012678
	ldrb r0, [r4]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _0801313A
	.align 2, 0
_08012670: .4byte gBattleMons
_08012674: .4byte gUnknown_02024C18
_08012678: .4byte gUnknown_02024D1E
_0801267C:
	ldr r0, _08012694
	ldrb r1, [r0]
	ldr r0, _08012698
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0
	bl dp01_build_cmdbuf_x12_a_bb
	bl _08013006
	.align 2, 0
_08012694: .4byte gUnknown_02024C18
_08012698: .4byte gUnknown_02024260
_0801269C:
	ldr r4, _080126F4
	ldr r1, _080126F8
	ldr r3, _080126FC
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _080126CA
	bl _0801313A
_080126CA:
	ldr r2, _08012700
	adds r2, r5, r2
	ldr r1, _08012704
	lsls r0, r5, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r3]
	lsls r0, 9
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _080126E8
	b _08012B3C
_080126E8:
	lsls r0, 2
	ldr r1, _08012708
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080126F4: .4byte gUnknown_02024A64
_080126F8: .4byte gBitTable
_080126FC: .4byte gUnknown_02024A60
_08012700: .4byte gUnknown_02024C18
_08012704: .4byte gUnknown_02024260
_08012708: .4byte _0801270C
	.align 2, 0
_0801270C:
	.4byte _08012740
	.4byte _08012888
	.4byte _080128B4
	.4byte _08012B3C
	.4byte _08012B3C
	.4byte _08012A84
	.4byte _08012ADC
	.4byte _08012B3C
	.4byte _08012B3C
	.4byte _08012B3C
	.4byte _08012B3C
	.4byte _08012B3C
	.4byte _08012B00
_08012740:
	bl sub_8015C90
	lsls r0, 24
	cmp r0, 0
	beq _080127A4
	ldr r0, _08012788
	ldr r2, _0801278C
	ldrb r1, [r2]
	adds r1, r0
	movs r4, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r3, _08012790
	ldrb r0, [r2]
	ldr r1, _08012794
	adds r0, r1
	adds r0, r3
	strb r4, [r0]
	ldrb r0, [r2]
	ldr r4, _08012798
	adds r0, r4
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r2]
	ldr r0, _0801279C
	adds r2, r1, r0
	adds r2, r3
	ldr r0, _080127A0
	lsls r1, 9
	adds r0, 0x3
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	bl _08013164
	.align 2, 0
_08012788: .4byte gUnknown_02024D1E
_0801278C: .4byte gUnknown_02024A60
_08012790: .4byte 0x02000000
_08012794: .4byte 0x00016060
_08012798: .4byte 0x00016094
_0801279C: .4byte 0x00016010
_080127A0: .4byte gUnknown_02024260
_080127A4:
	ldr r1, _080127D0
	ldr r5, _080127D4
	ldrb r4, [r5]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r2, [r0, 0x6]
	cmp r2, 0
	beq _080127E0
	ldr r1, _080127D8
	lsls r0, r4, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _080127DC
	ldrb r0, [r5]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08013164
	.align 2, 0
_080127D0: .4byte gUnknown_02024CA8
_080127D4: .4byte gUnknown_02024A60
_080127D8: .4byte gUnknown_02024C60
_080127DC: .4byte gUnknown_02024D1E
_080127E0:
	add r2, sp, 0x4
	ldr r3, _08012880
	movs r1, 0x58
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x21
	ldrb r0, [r0]
	strb r0, [r2, 0x12]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x22
	ldrb r0, [r0]
	strb r0, [r2, 0x13]
	movs r4, 0
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x18]
	add r2, sp, 0x10
	mov r10, r2
	mov r8, r3
	adds r7, r5, 0
	movs r6, 0x58
	movs r3, 0xC
	add r3, r8
	mov r9, r3
	add r5, sp, 0x4
_08012822:
	lsls r2, r4, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r2, r0
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r0, [sp, 0x18]
	adds r3, r0, r4
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r2, r1
	add r2, r9
	ldrh r0, [r2]
	add r1, r8
	adds r1, 0x3B
	ldrb r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl CalculatePPWithBonus
	mov r2, r10
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08012822
	ldr r0, _08012884
	ldrb r0, [r0]
	movs r1, 0x1
	ands r1, r0
	movs r0, 0
	movs r2, 0
	add r3, sp, 0x4
	bl sub_800CBA4
	b _08012A72
	.align 2, 0
_08012880: .4byte gBattleMons
_08012884: .4byte gUnknown_020239F8
_08012888:
	ldr r0, _080128A4
	ldrh r1, [r0]
	ldr r0, _080128A8
	ands r0, r1
	cmp r0, 0
	bne _08012896
	b _08012ADC
_08012896:
	ldr r1, _080128AC
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080128B0
	b _08012BA0
	.align 2, 0
_080128A4: .4byte gUnknown_020239F8
_080128A8: .4byte 0x00000902
_080128AC: .4byte gUnknown_02024C1C
_080128B0: .4byte gUnknown_081D9B29
_080128B4:
	ldr r3, _0801290C
	ldr r5, _08012910
	ldrb r0, [r5]
	ldr r4, _08012914
	adds r1, r0, r4
	adds r1, r3
	ldr r2, _08012918
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r7, _0801291C
	ldrb r2, [r5]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08012920
	ands r0, r1
	cmp r0, 0
	bne _080128F6
	ldr r0, _08012924
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	lsls r0, 3
	ands r1, r0
	cmp r1, 0
	beq _0801292C
_080128F6:
	lsls r0, r2, 1
	adds r0, r2
	ldr r2, _08012928
	adds r1, r3, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x6
	b _08012A40
	.align 2, 0
_0801290C: .4byte 0x02000000
_08012910: .4byte gUnknown_02024A60
_08012914: .4byte 0x00016064
_08012918: .4byte gUnknown_02024A6A
_0801291C: .4byte gBattleMons
_08012920: .4byte 0x0400e000
_08012924: .4byte gUnknown_02024C98
_08012928: .4byte 0x0001606c
_0801292C:
	str r1, [sp]
	movs r0, 0xC
	adds r1, r2, 0
	movs r2, 0x17
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080129B4
	ldrb r1, [r5]
	str r4, [sp]
	movs r0, 0xC
	movs r2, 0x47
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0801297C
	ldrb r0, [r5]
	muls r0, r6
	adds r1, r0, r7
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0801297C
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0801297C
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	bne _080129B4
_0801297C:
	ldr r5, _080129DC
	ldrb r1, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080129EC
	ldr r2, _080129E0
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _080129B4
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080129EC
_080129B4:
	subs r1, r4, 0x1
	lsls r1, 4
	movs r0, 0x4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080129E4
	ldrb r3, [r0]
	ldr r0, _080129DC
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	ldr r2, _080129E8
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r2, 0x6
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
	b _08012A72
	.align 2, 0
_080129DC: .4byte gUnknown_02024A60
_080129E0: .4byte gBattleMons
_080129E4: .4byte byte_2024C06
_080129E8: .4byte 0x0201606c
_080129EC:
	ldr r0, _08012A04
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, 0x2
	bne _08012A14
	ldr r0, _08012A08
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08012A14
	ldr r3, _08012A0C
	ldr r4, _08012A10
	b _08012A28
	.align 2, 0
_08012A04: .4byte gUnknown_02024A60
_08012A08: .4byte gUnknown_02024C18
_08012A0C: .4byte 0x02000000
_08012A10: .4byte 0x00016068
_08012A14:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _08012A58
	ldr r0, _08012A48
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _08012A58
	ldr r3, _08012A4C
	ldr r4, _08012A50
_08012A28:
	adds r0, r3, r4
	ldrb r2, [r0]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08012A54
	adds r3, r1
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r1, 0
_08012A40:
	movs r3, 0
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
	b _08012A72
	.align 2, 0
_08012A48: .4byte gUnknown_02024C18
_08012A4C: .4byte 0x02000000
_08012A50: .4byte 0x00016069
_08012A54: .4byte 0x0001606c
_08012A58:
	ldr r0, _08012A7C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08012A80
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
_08012A72:
	ldr r0, _08012A7C
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08012B3C
	.align 2, 0
_08012A7C: .4byte gUnknown_02024A60
_08012A80: .4byte 0x0201606c
_08012A84:
	bl PlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	beq _08012B3C
	ldr r1, _08012AC0
	ldr r2, _08012AC4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08012AC8
	str r1, [r0]
	ldr r0, _08012ACC
	ldrb r1, [r2]
	adds r1, r0
	movs r3, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r1, _08012AD0
	ldrb r0, [r2]
	ldr r4, _08012AD4
	adds r0, r4
	adds r0, r1
	strb r3, [r0]
	ldrb r0, [r2]
	ldr r2, _08012AD8
	adds r0, r2
	adds r0, r1
	strb r3, [r0]
	b _08013164
	.align 2, 0
_08012AC0: .4byte gUnknown_02024C1C
_08012AC4: .4byte gUnknown_02024A60
_08012AC8: .4byte gUnknown_081D8E4A
_08012ACC: .4byte gUnknown_02024D1E
_08012AD0: .4byte 0x02000000
_08012AD4: .4byte 0x00016060
_08012AD8: .4byte 0x00016094
_08012ADC:
	ldr r4, _08012AF8
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08012AFC
	adds r1, r0
	movs r0, 0
	bl sub_800CBE0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08012B3C
	.align 2, 0
_08012AF8: .4byte gUnknown_02024A60
_08012AFC: .4byte 0x0201606c
_08012B00:
	ldr r4, _08012B38
	mov r3, r8
	ldrb r1, [r3]
	adds r1, r4
	movs r5, 0
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r3]
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strb r5, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x32_32_32_32
	mov r4, r8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08013164
	.align 2, 0
_08012B38: .4byte gUnknown_02024D1E
_08012B3C:
	ldr r0, _08012B68
	ldrh r1, [r0]
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0x8
	bne _08012B7C
	ldr r0, _08012B6C
	ldr r4, _08012B70
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _08012B7C
	ldr r0, _08012B74
	bl b_call_bc_move_exec
	ldr r1, _08012B78
	ldrb r0, [r4]
	adds r0, r1
	b _08012DD2
	.align 2, 0
_08012B68: .4byte gUnknown_020239F8
_08012B6C: .4byte gUnknown_02024260
_08012B70: .4byte gUnknown_02024A60
_08012B74: .4byte gUnknown_081D8E37
_08012B78: .4byte gUnknown_02024D1E
_08012B7C:
	bl sub_8012028
	lsls r0, 24
	cmp r0, 0
	beq _08012BE8
	ldr r0, _08012BC8
	ldr r3, _08012BCC
	ldrb r2, [r3]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _08012BE8
	ldr r1, _08012BD0
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08012BD4
_08012BA0:
	str r1, [r0]
	ldr r0, _08012BD8
	ldrb r1, [r3]
	adds r1, r0
	movs r2, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r1, _08012BDC
	ldrb r0, [r3]
	ldr r4, _08012BE0
	adds r0, r4
	adds r0, r1
	strb r2, [r0]
	ldrb r0, [r3]
	ldr r3, _08012BE4
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	b _08013164
	.align 2, 0
_08012BC8: .4byte gUnknown_02024260
_08012BCC: .4byte gUnknown_02024A60
_08012BD0: .4byte gUnknown_02024C1C
_08012BD4: .4byte gUnknown_081D8E44
_08012BD8: .4byte gUnknown_02024D1E
_08012BDC: .4byte 0x02000000
_08012BE0: .4byte 0x00016060
_08012BE4: .4byte 0x00016094
_08012BE8:
	ldr r2, _08012BF4
	ldr r0, _08012BF8
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012BF4: .4byte gUnknown_02024D1E
_08012BF8: .4byte gUnknown_02024A60
_08012BFC:
	ldr r4, _08012C40
	ldr r1, _08012C44
	ldr r3, _08012C48
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _08012C28
	b _0801313A
_08012C28:
	ldr r1, _08012C4C
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x9
	bls _08012C36
	b _0801313A
_08012C36:
	lsls r0, 2
	ldr r1, _08012C50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012C40: .4byte gUnknown_02024A64
_08012C44: .4byte gBitTable
_08012C48: .4byte gUnknown_02024A60
_08012C4C: .4byte gUnknown_02024C18
_08012C50: .4byte _08012C54
	.align 2, 0
_08012C54:
	.4byte _08012C7C
	.4byte _08012D84
	.4byte _08012DBC
	.4byte _08012EB4
	.4byte _08012ED8
	.4byte _08012EEC
	.4byte _08012F00
	.4byte _08012F30
	.4byte _08012F44
	.4byte _08012F68
_08012C7C:
	ldr r0, _08012C9C
	mov r1, r8
	ldrb r4, [r1]
	lsls r1, r4, 9
	adds r2, r0, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0x9
	bgt _08012CA0
	cmp r1, 0x3
	blt _08012CA0
	adds r0, r4, r3
	strb r1, [r0]
	b _08013164
	.align 2, 0
_08012C9C: .4byte gUnknown_02024260
_08012CA0:
	adds r3, r6, 0
	mov r5, r8
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r7, r3, 0x2
	adds r0, r1, r7
	ldrb r2, [r0]
	adds r3, 0x3
	mov r9, r3
	add r1, r9
	ldrb r0, [r1]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08012CC8
	cmp r2, r0
	bne _08012CD0
	ldr r0, _08012CCC
	adds r0, r4, r0
	b _08012DD2
	.align 2, 0
_08012CC8: .4byte 0x0000ffff
_08012CCC: .4byte gUnknown_02024D1E
_08012CD0:
	bl sub_8015894
	lsls r0, 24
	cmp r0, 0
	beq _08012D1C
	ldr r0, _08012D0C
	ldrb r1, [r5]
	adds r1, r0
	movs r2, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r3, _08012D10
	ldrb r0, [r5]
	ldr r4, _08012D14
	adds r0, r4
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, r6, 0x1
	adds r0, r1
	strb r2, [r0]
	ldrb r0, [r5]
	ldr r1, _08012D18
	adds r0, r1
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	b _08013164
	.align 2, 0
_08012D0C: .4byte gUnknown_02024D1E
_08012D10: .4byte 0x02000000
_08012D14: .4byte 0x00016060
_08012D18: .4byte 0x00016094
_08012D1C:
	ldr r6, _08012D6C
	mov r2, r8
	ldrb r0, [r2]
	ldr r2, _08012D70
	adds r1, r0, r2
	adds r1, r6
	lsls r0, 9
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08012D74
	mov r4, r8
	ldrb r3, [r4]
	lsls r5, r3, 1
	adds r5, r0
	ldr r4, _08012D78
	adds r2, r3, r2
	adds r2, r6
	ldrb r0, [r2]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r3
	adds r0, r1
	adds r4, 0xC
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r5]
	mov r1, r8
	ldrb r0, [r1]
	ldr r2, _08012D7C
	adds r1, r0, r2
	adds r1, r6
	lsls r0, 9
	add r0, r9
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08012D80
	mov r3, r8
	ldrb r1, [r3]
	b _08013010
	.align 2, 0
_08012D6C: .4byte 0x02000000
_08012D70: .4byte 0x0001608c
_08012D74: .4byte gUnknown_02024C60
_08012D78: .4byte gBattleMons
_08012D7C: .4byte 0x00016010
_08012D80: .4byte gUnknown_02024D1E
_08012D84:
	ldr r2, _08012DAC
	ldr r5, _08012DB0
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _08012DA2
	b _08013134
_08012DA2:
	ldr r0, _08012DB4
	strh r3, [r0]
	ldr r0, _08012DB8
	ldrb r1, [r5]
	b _08013010
	.align 2, 0
_08012DAC: .4byte gUnknown_02024260
_08012DB0: .4byte gUnknown_02024A60
_08012DB4: .4byte gUnknown_02024C04
_08012DB8: .4byte gUnknown_02024D1E
_08012DBC:
	ldr r4, _08012DD8
	ldr r7, _08012DDC
	ldrb r2, [r7]
	lsls r0, r2, 9
	adds r1, r4, 0x1
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0x6
	bne _08012DE4
	ldr r0, _08012DE0
	adds r0, r2, r0
_08012DD2:
	movs r1, 0
	strb r1, [r0]
	b _0801313A
	.align 2, 0
_08012DD8: .4byte gUnknown_02024260
_08012DDC: .4byte gUnknown_02024A60
_08012DE0: .4byte gUnknown_02024D1E
_08012DE4:
	ldr r0, _08012E98
	mov r12, r0
	ldr r3, _08012E9C
	adds r0, r2, r3
	add r0, r12
	strb r1, [r0]
	ldr r0, _08012EA0
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08012E92
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r5, _08012EA4
	adds r1, r5
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r2, r0, 1
	adds r2, r0
	adds r2, r5
	add r2, r12
	lsls r0, 9
	adds r6, r4, 0x2
	adds r0, r6
	ldrb r1, [r0]
	movs r3, 0xF0
	adds r0, r3, 0
	ands r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r2, _08012EA8
	adds r1, r2
	add r1, r12
	lsls r0, 9
	adds r4, 0x3
	mov r8, r4
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r4, 0x2
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	add r1, r12
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, 4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	lsls r1, r4, 1
	adds r1, r4
	ldr r3, _08012EAC
	adds r1, r3
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 9
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
_08012E92:
	ldr r0, _08012EB0
	ldrb r1, [r7]
	b _08013010
	.align 2, 0
_08012E98: .4byte 0x02000000
_08012E9C: .4byte 0x00016068
_08012EA0: .4byte gUnknown_020239F8
_08012EA4: .4byte 0x0001606c
_08012EA8: .4byte 0x0001606d
_08012EAC: .4byte 0x0001606e
_08012EB0: .4byte gUnknown_02024D1E
_08012EB4:
	ldr r2, _08012ECC
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012ED0
	ldr r0, _08012ED4
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012ECC: .4byte gUnknown_02024C6C
_08012ED0: .4byte gUnknown_02024D1E
_08012ED4: .4byte gUnknown_02024A60
_08012ED8:
	ldr r2, _08012EE4
	ldr r0, _08012EE8
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012EE4: .4byte gUnknown_02024D1E
_08012EE8: .4byte gUnknown_02024A60
_08012EEC:
	ldr r2, _08012EF8
	ldr r0, _08012EFC
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012EF8: .4byte gUnknown_02024D1E
_08012EFC: .4byte gUnknown_02024A60
_08012F00:
	ldr r2, _08012F24
	ldr r0, _08012F28
	ldrb r4, [r0]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _08012F1E
	b _08013134
_08012F1E:
	ldr r1, _08012F2C
	adds r1, r4, r1
	b _08013012
	.align 2, 0
_08012F24: .4byte gUnknown_02024260
_08012F28: .4byte gUnknown_02024A60
_08012F2C: .4byte gUnknown_02024D1E
_08012F30:
	ldr r2, _08012F3C
	ldr r0, _08012F40
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012F3C: .4byte gUnknown_02024D1E
_08012F40: .4byte gUnknown_02024A60
_08012F44:
	ldr r2, _08012F5C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012F60
	ldr r0, _08012F64
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012F5C: .4byte gUnknown_02024C6C
_08012F60: .4byte gUnknown_02024D1E
_08012F64: .4byte gUnknown_02024A60
_08012F68:
	ldr r2, _08012F74
	ldr r0, _08012F78
	ldrb r1, [r0]
	adds r1, r2
	b _08013012
	.align 2, 0
_08012F74: .4byte gUnknown_02024D1E
_08012F78: .4byte gUnknown_02024A60
_08012F7C:
	ldr r3, _08012FE4
	ldr r4, _08012FE8
	ldr r0, _08012FEC
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	beq _08012FA6
	b _0801313A
_08012FA6:
	ldr r0, _08012FF0
	ldrh r1, [r0]
	movs r0, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _08012FDA
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08012FDA
	adds r0, r5, 0
	eors r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08012FF4
	ldr r2, _08012FF8
	adds r1, r2
	ldrb r1, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08012FFC
_08012FDA:
	movs r0, 0
	movs r1, 0
	bl sub_800D1D8
	b _08013004
	.align 2, 0
_08012FE4: .4byte gUnknown_02024A64
_08012FE8: .4byte gBitTable
_08012FEC: .4byte gUnknown_02024A60
_08012FF0: .4byte gUnknown_020239F8
_08012FF4: .4byte 0x02000000
_08012FF8: .4byte 0x000160a6
_08012FFC:
	movs r0, 0
	movs r1, 0x1
	bl sub_800D1D8
_08013004:
	ldr r4, _0801301C
_08013006:
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, _08013020
	ldrb r1, [r4]
_08013010:
	adds r1, r0
_08013012:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0801313A
	.align 2, 0
_0801301C: .4byte gUnknown_02024A60
_08013020: .4byte gUnknown_02024D1E
_08013024:
	ldr r3, _08013058
	ldr r1, _0801305C
	ldr r0, _08013060
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _0801313A
	ldr r1, _08013064
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0801313A
	.align 2, 0
_08013058: .4byte gUnknown_02024A64
_0801305C: .4byte gBitTable
_08013060: .4byte gUnknown_02024A60
_08013064: .4byte gUnknown_02024D1E
_08013068:
	ldr r2, _0801308C
	ldr r5, _08013090
	ldrb r1, [r5]
	ldr r3, _08013094
	adds r0, r1, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080130A0
	ldr r0, _08013098
	adds r0, r1, r0
	ldr r4, _0801309C
	adds r1, r4
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _0801313A
	.align 2, 0
_0801308C: .4byte 0x02000000
_08013090: .4byte gUnknown_02024A60
_08013094: .4byte 0x00016060
_08013098: .4byte gUnknown_02024D1E
_0801309C: .4byte 0x00016094
_080130A0:
	ldr r0, _080130F4
	strb r1, [r0]
	ldr r7, _080130F8
	ldr r6, _080130FC
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r4, [r0]
	str r4, [r7]
	ldr r3, _08013100
	ldr r1, _08013104
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _080130E6
	ldr r0, _08013108
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_080130E6:
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r7]
	str r1, [r0]
	b _0801313A
	.align 2, 0
_080130F4: .4byte gUnknown_02024C07
_080130F8: .4byte gUnknown_02024C10
_080130FC: .4byte gUnknown_02024C1C
_08013100: .4byte gUnknown_02024A64
_08013104: .4byte gBitTable
_08013108: .4byte gUnknown_081FA73C
_0801310C:
	ldr r3, _08013174
	ldr r1, _08013178
	ldr r0, _0801317C
	ldrb r4, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r3, [r3]
	ands r3, r0
	cmp r3, 0
	bne _0801313A
_08013134:
	ldr r0, _08013180
	adds r0, r4, r0
	strb r3, [r0]
_0801313A:
	ldr r0, _0801317C
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08013184
	lsls r1, 24
	lsrs r1, 24
_08013148:
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r1, r0
	bcs _08013154
	bl _08012520
_08013154:
	ldr r0, _08013180
	ldrb r0, [r0, 0x4]
	ldrb r2, [r2]
	cmp r0, r2
	bne _08013164
	ldr r1, _08013188
	ldr r0, _0801318C
	str r0, [r1]
_08013164:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013174: .4byte gUnknown_02024A64
_08013178: .4byte gBitTable
_0801317C: .4byte gUnknown_02024A60
_08013180: .4byte gUnknown_02024D1E
_08013184: .4byte gUnknown_02024A68
_08013188: .4byte gUnknown_030042D4
_0801318C: .4byte sub_80133C8
	thumb_func_end sub_8012324

	thumb_func_start sub_8012FBC
sub_8012FBC: @ 8013190
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080131BC
	adds r4, r0, r2
	ldrb r5, [r4]
	adds r2, r1, r2
	ldrb r3, [r2]
	strb r3, [r4]
	strb r5, [r2]
	ldr r2, _080131C0
	adds r0, r2
	ldrb r5, [r0]
	adds r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	strb r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080131BC: .4byte gUnknown_02024A76
_080131C0: .4byte gUnknown_02024A7A
	thumb_func_end sub_8012FBC

	thumb_func_start b_first_side
b_first_side: @ 80131C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801328C
	ldr r1, [sp, 0x8]
	str r1, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801328C
	ldr r1, _08013244
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x21
	bne _08013230
	ldr r0, _08013248
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08013240
_08013230:
	cmp r3, 0x22
	bne _0801324C
	ldr r0, _08013248
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0801324C
_08013240:
	movs r3, 0x2
	b _0801324E
	.align 2, 0
_08013244: .4byte gBattleMons
_08013248: .4byte word_2024DB8
_0801324C:
	movs r3, 0x1
_0801324E:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08013284
	adds r0, r2
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x21
	bne _0801326E
	ldr r0, _08013288
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801327E
_0801326E:
	cmp r2, 0x22
	bne _0801328E
	ldr r0, _08013288
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0801328E
_0801327E:
	movs r7, 0x2
	b _08013290
	.align 2, 0
_08013284: .4byte gBattleMons
_08013288: .4byte word_2024DB8
_0801328C:
	movs r3, 0x1
_0801328E:
	movs r7, 0x1
_08013290:
	ldr r1, _080132D4
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	muls r3, r0
	ldr r2, _080132D8
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	mov r8, r0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _080132E0
	ldr r1, _080132DC
	mov r3, r9
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _080132F4
	.align 2, 0
_080132D4: .4byte gBattleMons
_080132D8: .4byte gStatStageRatios
_080132DC: .4byte gEnigmaBerries
_080132E0:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_080132F4:
	ldr r0, _080133B0
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08013328
	ldr r0, _080133B4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08013328
	mov r0, r9
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08013328
	movs r0, 0x6E
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __udivsi3
	mov r8, r0
_08013328:
	cmp r6, 0x18
	bne _08013332
	mov r2, r8
	lsrs r2, 1
	mov r8, r2
_08013332:
	ldr r1, _080133B8
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08013350
	mov r0, r8
	lsrs r0, 2
	mov r8, r0
_08013350:
	cmp r6, 0x1A
	bne _0801336C
	ldr r0, _080133BC
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _0801336C
	movs r1, 0x1
	negs r1, r1
	mov r8, r1
_0801336C:
	ldr r1, _080133B8
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	adds r3, r0, 0
	muls r3, r7
	ldr r2, _080133C0
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	adds r7, r0, 0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _080133C8
	ldr r1, _080133C4
	mov r3, r10
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _080133DC
	.align 2, 0
_080133B0: .4byte gUnknown_020239F8
_080133B4: .4byte 0x00000809
_080133B8: .4byte gBattleMons
_080133BC: .4byte gUnknown_02024D1C
_080133C0: .4byte gStatStageRatios
_080133C4: .4byte gEnigmaBerries
_080133C8:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_080133DC:
	ldr r0, _08013454
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0801340C
	ldr r0, _08013458
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801340C
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801340C
	movs r0, 0x6E
	muls r0, r7
	movs r1, 0x64
	bl __udivsi3
	adds r7, r0, 0
_0801340C:
	cmp r6, 0x18
	bne _08013412
	lsrs r7, 1
_08013412:
	ldr r2, _0801345C
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801342E
	lsrs r7, 2
_0801342E:
	cmp r6, 0x1A
	bne _08013448
	ldr r0, _08013460
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08013448
	movs r7, 0x1
	negs r7, r7
_08013448:
	ldr r2, [sp, 0x4]
	cmp r2, 0
	beq _08013464
	movs r3, 0
	b _08013508
	.align 2, 0
_08013454: .4byte gUnknown_020239F8
_08013458: .4byte 0x00000809
_0801345C: .4byte gBattleMons
_08013460: .4byte gUnknown_02024D1C
_08013464:
	ldr r0, _08013484
	mov r3, r9
	adds r1, r3, r0
	ldrb r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	bne _080134B8
	ldr r0, _08013488
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _0801348C
	movs r3, 0xA5
	b _080134BA
	.align 2, 0
_08013484: .4byte gUnknown_02024C18
_08013488: .4byte gUnknown_02024D28
_0801348C:
	ldr r1, _080134AC
	ldr r0, _080134B0
	add r0, r9
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r3, r9
	muls r3, r1
	adds r1, r3, 0
	adds r0, r1
	ldr r1, _080134B4
	adds r1, 0xC
	adds r0, r1
	ldrh r3, [r0]
	b _080134BA
	.align 2, 0
_080134AC: .4byte 0x02000000
_080134B0: .4byte 0x0001608c
_080134B4: .4byte gBattleMons
_080134B8:
	movs r3, 0
_080134BA:
	mov r1, r10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013508
	ldr r0, _080134D8
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _080134DC
	movs r2, 0xA5
	b _0801350A
	.align 2, 0
_080134D8: .4byte gUnknown_02024D28
_080134DC:
	ldr r1, _080134FC
	ldr r0, _08013500
	add r0, r10
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	adds r0, r1
	ldr r1, _08013504
	adds r1, 0xC
	adds r0, r1
	ldrh r2, [r0]
	b _0801350A
	.align 2, 0
_080134FC: .4byte 0x02000000
_08013500: .4byte 0x0001608c
_08013504: .4byte gBattleMons
_08013508:
	movs r2, 0
_0801350A:
	ldr r4, _08013554
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	movs r1, 0x7
	ldrsb r1, [r0, r1]
	lsls r3, r2, 1
	cmp r1, 0
	bne _0801352E
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0801356C
_0801352E:
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _08013562
	cmp r8, r7
	bne _08013558
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08013558
	movs r3, 0x2
	b _08013588
	.align 2, 0
_08013554: .4byte gBattleMoves
_08013558:
	cmp r8, r7
	bcs _0801358A
	movs r0, 0x1
	str r0, [sp, 0x8]
	b _0801358A
_08013562:
	cmp r1, r0
	bge _0801358A
	movs r1, 0x1
	str r1, [sp, 0x8]
	b _0801358A
_0801356C:
	cmp r8, r7
	bne _08013582
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08013582
	movs r2, 0x2
	str r2, [sp, 0x8]
	b _0801358A
_08013582:
	cmp r8, r7
	bcs _0801358A
	movs r3, 0x1
_08013588:
	str r3, [sp, 0x8]
_0801358A:
	ldr r0, [sp, 0x8]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end b_first_side

	thumb_func_start sub_80133C8
sub_80133C8: @ 801359C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r3, 0
	ldr r0, _080135F0
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08013608
	ldr r0, _080135F4
	strb r3, [r0]
	ldr r4, _080135F8
	mov r8, r0
	ldrb r0, [r4]
	cmp r3, r0
	bcc _080135C4
	b _080137F6
_080135C4:
	ldr r7, _080135FC
	ldr r6, _08013600
	mov r2, r8
	ldr r5, _08013604
_080135CC:
	adds r1, r3, r7
	ldrb r0, [r2]
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	cmp r0, r1
	bcc _080135CC
	b _080137F6
	.align 2, 0
_080135F0: .4byte gUnknown_020239F8
_080135F4: .4byte gUnknown_02024A60
_080135F8: .4byte gUnknown_02024A68
_080135FC: .4byte gUnknown_02024A76
_08013600: .4byte gUnknown_02024C18
_08013604: .4byte gUnknown_02024A7A
_08013608:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013658
	ldr r0, _0801364C
	strb r3, [r0]
	ldr r1, _08013650
	mov r8, r0
	adds r2, r1, 0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _08013668
	ldr r0, _08013654
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x3
	beq _08013666
_0801362A:
	mov r7, r8
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08013650
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08013668
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0801362A
	b _08013666
	.align 2, 0
_0801364C: .4byte gUnknown_02024A60
_08013650: .4byte gUnknown_02024A68
_08013654: .4byte gUnknown_02024C18
_08013658:
	ldr r0, _080136D0
	ldrb r0, [r0]
	ldr r2, _080136D4
	mov r8, r2
	cmp r0, 0x3
	bne _08013668
	strb r3, [r2]
_08013666:
	movs r3, 0x5
_08013668:
	cmp r3, 0x5
	bne _080136F4
	ldr r6, _080136D8
	ldr r1, _080136D0
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r2, _080136DC
	ldrb r0, [r3]
	strb r0, [r2]
	movs r3, 0x1
	movs r5, 0
	adds r4, r1, 0
	ldr r7, _080136E0
	mov r9, r7
	ldr r0, _080136E4
	mov r12, r0
	ldr r1, _080136E8
	mov r10, r1
	ldr r7, _080136EC
	ldrb r7, [r7]
	cmp r5, r7
	bge _080136C0
	adds r7, r6, 0
	adds r6, r4, 0
	adds r4, r2, 0
	ldr r2, _080136EC
_080136A2:
	mov r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	beq _080136B8
	adds r1, r3, r7
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r3, 0x1
_080136B8:
	adds r5, 0x1
	ldrb r1, [r2]
	cmp r5, r1
	blt _080136A2
_080136C0:
	mov r2, r12
	mov r3, r9
	str r2, [r3]
	ldr r1, _080136F0
	add r1, r10
	movs r0, 0
	strb r0, [r1]
	b _08013806
	.align 2, 0
_080136D0: .4byte gUnknown_02024C18
_080136D4: .4byte gUnknown_02024A60
_080136D8: .4byte gUnknown_02024A76
_080136DC: .4byte gUnknown_02024A7A
_080136E0: .4byte gUnknown_030042D4
_080136E4: .4byte bc_80154A0
_080136E8: .4byte 0x02000000
_080136EC: .4byte gUnknown_02024A68
_080136F0: .4byte 0x0001601d
_080136F4:
	movs r0, 0
	mov r7, r8
	strb r0, [r7]
	ldr r1, _08013784
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801373A
	ldr r6, _08013788
	mov r2, r8
	ldr r5, _0801378C
	ldr r4, _08013790
_0801370A:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013728
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_08013728:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08013784
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801370A
_0801373A:
	movs r0, 0
	mov r2, r8
	strb r0, [r2]
	ldr r7, _08013784
	ldrb r0, [r7]
	cmp r0, 0
	beq _0801377E
	ldr r6, _08013788
	ldr r5, _0801378C
	ldr r4, _08013790
_0801374E:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0801376C
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_0801376C:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08013784
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801374E
_0801377E:
	movs r5, 0
	b _080137EC
	.align 2, 0
_08013784: .4byte gUnknown_02024A68
_08013788: .4byte gUnknown_02024C18
_0801378C: .4byte gUnknown_02024A76
_08013790: .4byte gUnknown_02024A7A
_08013794:
	adds r4, r5, 0x1
	adds r7, r4, 0
	ldrb r1, [r1]
	cmp r7, r1
	bge _080137EA
	ldr r6, _08013814
	lsls r2, r5, 24
	mov r8, r2
_080137A4:
	ldr r0, _08013818
	adds r1, r5, r0
	ldrb r3, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, r6
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _080137E0
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080137E0
	cmp r2, 0x2
	beq _080137E0
	cmp r0, 0x2
	beq _080137E0
	adds r0, r3, 0
	movs r2, 0
	bl b_first_side
	lsls r0, 24
	cmp r0, 0
	beq _080137E0
	lsls r1, r4, 24
	lsrs r1, 24
	mov r3, r8
	lsrs r0, r3, 24
	bl sub_8012FBC
_080137E0:
	adds r4, 0x1
	ldr r0, _0801381C
	ldrb r0, [r0]
	cmp r4, r0
	blt _080137A4
_080137EA:
	adds r5, r7, 0
_080137EC:
	ldr r1, _0801381C
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _08013794
_080137F6:
	ldr r1, _08013820
	ldr r0, _08013824
	str r0, [r1]
	ldr r0, _08013828
	ldr r7, _0801382C
	adds r0, r7
	movs r1, 0
	strb r1, [r0]
_08013806:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013814: .4byte gUnknown_02024A76
_08013818: .4byte gUnknown_02024A7A
_0801381C: .4byte gUnknown_02024A68
_08013820: .4byte gUnknown_030042D4
_08013824: .4byte bc_80154A0
_08013828: .4byte 0x02000000
_0801382C: .4byte 0x0001601d
	thumb_func_end sub_80133C8

	thumb_func_start sub_801365C
sub_801365C: @ 8013830
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _08013888
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0801388C
	ldrb r2, [r0]
	adds r5, r1, 0
	cmp r2, 0
	beq _08013928
	ldr r7, _08013890
	adds r6, r5, 0
	ldr r0, _08013894
	mov r12, r0
	ldr r1, _08013898
	mov r8, r1
	mov r10, r8
_0801385E:
	mov r2, r9
	cmp r2, 0
	beq _0801389C
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _080138F8
	.align 2, 0
_08013888: .4byte gUnknown_02024A60
_0801388C: .4byte gUnknown_02024A68
_08013890: .4byte gUnknown_02024D28
_08013894: .4byte gUnknown_02024AD0
_08013898: .4byte gUnknown_02024CA8
_0801389C:
	ldrb r0, [r6]
	lsls r0, 4
	adds r2, r0, r7
	movs r1, 0
	mov r4, r10
	movs r3, 0
_080138A8:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0xF
	bls _080138A8
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0
	beq _080138C6
	subs r0, 0x1
	strb r0, [r1, 0x16]
_080138C6:
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	beq _080138F8
	subs r0, 0x1
	strb r0, [r1, 0x19]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x19]
	cmp r0, 0
	bne _080138F8
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _08013940
	ands r0, r1
	str r0, [r2]
_080138F8:
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	bne _08013916
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _08013944
	ands r0, r1
	str r0, [r2]
_08013916:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08013948
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801385E
_08013928:
	movs r0, 0
	ldr r2, _0801394C
	strb r0, [r2, 0x8]
	strb r0, [r2, 0x14]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013940: .4byte 0xffbfffff
_08013944: .4byte 0xfeffffff
_08013948: .4byte gUnknown_02024A68
_0801394C: .4byte gUnknown_02024C80
	thumb_func_end sub_801365C

	thumb_func_start sub_801377C
sub_801377C: @ 8013950
	push {r4-r6,lr}
	ldr r2, _08013994
	movs r0, 0
	strb r0, [r2]
	ldr r0, _08013998
	ldrb r1, [r0]
	adds r6, r0, 0
	cmp r1, 0
	beq _0801398E
	adds r3, r2, 0
	movs r4, 0
	ldr r5, _0801399C
_08013968:
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r5
	movs r1, 0
_08013974:
	adds r0, r2, r1
	strb r4, [r0]
	adds r1, 0x1
	cmp r1, 0x13
	bls _08013974
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	cmp r0, r1
	bcc _08013968
_0801398E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013994: .4byte gUnknown_02024A60
_08013998: .4byte gUnknown_02024A68
_0801399C: .4byte gUnknown_02024D68
	thumb_func_end sub_801377C

	thumb_func_start bc_80154A0
bc_80154A0: @ 80139A0
	push {r4-r7,lr}
	ldr r0, _08013A24
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _08013A58
	ldr r0, _08013A28
	ldr r1, _08013A2C
	adds r2, r0, r1
	ldr r0, _08013A30
	ldrb r1, [r2]
	adds r7, r0, 0
	ldrb r0, [r7]
	cmp r1, r0
	bcs _08013A58
	ldr r6, _08013A34
	ldr r5, _08013A38
	adds r4, r2, 0
	movs r1, 0x84
	lsls r1, 1
	mov r12, r1
_080139CE:
	ldrb r0, [r4]
	strb r0, [r5]
	strb r0, [r6]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013A3C
	ldrb r3, [r6]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r12
	bne _08013A50
	ldr r1, _08013A40
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08013A50
	ldr r2, _08013A44
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _08013A50
	ldr r0, _08013A48
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	blt _08013A50
	ldr r0, _08013A4C
	bl b_call_bc_move_exec
	b _08013A92
	.align 2, 0
_08013A24: .4byte gUnknown_02024C6C
_08013A28: .4byte 0x02000000
_08013A2C: .4byte 0x0001601d
_08013A30: .4byte gUnknown_02024A68
_08013A34: .4byte gUnknown_02024A60
_08013A38: .4byte gUnknown_02024C07
_08013A3C: .4byte gUnknown_02024C60
_08013A40: .4byte gBattleMons
_08013A44: .4byte gUnknown_02024CA8
_08013A48: .4byte gUnknown_02024D28
_08013A4C: .4byte gUnknown_081D94DA
_08013A50:
	ldrb r0, [r4]
	ldrb r2, [r7]
	cmp r0, r2
	bcc _080139CE
_08013A58:
	bl b_clear_atk_up_if_hit_flag_unless_enraged
	ldr r1, _08013A98
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013A9C
	ldr r0, _08013AA0
	movs r2, 0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08013AA4
	movs r3, 0
	strh r2, [r0]
	ldr r1, _08013AA8
	ldr r2, _08013AAC
	adds r0, r1, r2
	strb r3, [r0]
	ldr r2, _08013AB0
	ldr r0, _08013AB4
	str r0, [r2]
	ldr r0, _08013AB8
	strb r3, [r0, 0x3]
	strb r3, [r0, 0x4]
	ldr r2, _08013ABC
	adds r0, r1, r2
	strb r3, [r0]
	ldr r0, _08013AC0
	adds r1, r0
	strb r3, [r1]
_08013A92:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013A98: .4byte gUnknown_02024A7E
_08013A9C: .4byte gUnknown_02024A7F
_08013AA0: .4byte gUnknown_02024A76
_08013AA4: .4byte gUnknown_02024DEC
_08013AA8: .4byte 0x02000000
_08013AAC: .4byte 0x0001601c
_08013AB0: .4byte gUnknown_030042D4
_08013AB4: .4byte sub_80138F0
_08013AB8: .4byte gUnknown_02024D1E
_08013ABC: .4byte 0x00016112
_08013AC0: .4byte 0x00017130
	thumb_func_end bc_80154A0

	thumb_func_start sub_80138F0
sub_80138F0: @ 8013AC4
	push {r4-r6,lr}
	ldr r6, _08013B18
	ldrb r0, [r6]
	ldr r2, _08013B1C
	cmp r0, 0
	beq _08013AD4
	movs r0, 0xC
	strb r0, [r2]
_08013AD4:
	ldr r1, _08013B20
	ldr r4, _08013B24
	ldrb r0, [r4]
	ldr r3, _08013B28
	adds r5, r1, r3
	strb r0, [r5]
	ldr r1, _08013B2C
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08013B30
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08013B44
	ldr r2, _08013B34
	ldr r0, [r2]
	ldr r1, _08013B38
	ands r0, r1
	str r0, [r2]
	ldr r3, _08013B3C
	ldr r2, _08013B40
	ldrb r1, [r6]
	movs r0, 0x7F
	ands r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	b _08013B58
	.align 2, 0
_08013B18: .4byte gUnknown_02024D26
_08013B1C: .4byte gUnknown_02024A7F
_08013B20: .4byte 0x02000000
_08013B24: .4byte gUnknown_02024A7E
_08013B28: .4byte 0x00016057
_08013B2C: .4byte gUnknown_081FA640
_08013B30: .4byte gUnknown_02024A68
_08013B34: .4byte gUnknown_02024C6C
_08013B38: .4byte 0xffefffff
_08013B3C: .4byte gUnknown_030042D4
_08013B40: .4byte gUnknown_081FA678
_08013B44:
	ldrb r0, [r5]
	cmp r0, r1
	beq _08013B58
	ldr r2, _08013B60
	ldr r0, [r2]
	ldr r1, _08013B64
	ands r0, r1
	ldr r1, _08013B68
	ands r0, r1
	str r0, [r2]
_08013B58:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013B60: .4byte gUnknown_02024C6C
_08013B64: .4byte 0xfffffdff
_08013B68: .4byte 0xfff7ffff
	thumb_func_end sub_80138F0

	thumb_func_start sub_8013998
sub_8013998: @ 8013B6C
	push {r4,lr}
	ldr r1, _08013BA4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08013BA8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013BC0
	ldr r1, _08013BAC
	ldr r4, _08013BB0
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08013BB4
	strb r0, [r1]
	ldr r1, _08013BB8
	ldr r0, _08013BBC
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08013D1C
	.align 2, 0
_08013BA4: .4byte gUnknown_02024A7F
_08013BA8: .4byte gUnknown_020239F8
_08013BAC: .4byte gUnknown_030041C0
_08013BB0: .4byte gUnknown_02024D26
_08013BB4: .4byte gUnknown_02024C07
_08013BB8: .4byte gUnknown_02024C10
_08013BBC: .4byte gUnknown_081D8E02
_08013BC0:
	movs r0, 0x90
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08013BD8
	ldr r1, _08013BD0
	ldr r0, _08013BD4
	b _08013D1A
	.align 2, 0
_08013BD0: .4byte gUnknown_02024C10
_08013BD4: .4byte gUnknown_081D8E0D
_08013BD8:
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0x8
	beq _08013BE2
	b _08013D16
_08013BE2:
	bl sub_80325B8
	ldr r1, _08013C10
	ldr r0, _08013C14
	str r0, [r1]
	ldr r2, _08013C18
	ldr r0, _08013C1C
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	cmp r0, 0x31
	bls _08013C04
	b _08013D0C
_08013C04:
	lsls r0, 2
	ldr r1, _08013C20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013C10: .4byte gUnknown_02024C10
_08013C14: .4byte gUnknown_081D8DBE
_08013C18: .4byte gTrainers
_08013C1C: .4byte gTrainerBattleOpponent
_08013C20: .4byte _08013C24
	.align 2, 0
_08013C24:
	.4byte _08013CF8
	.4byte _08013CF8
	.4byte _08013CF8
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013CEC
	.4byte _08013D02
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013CEC
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013D0C
	.4byte _08013CF8
	.4byte _08013CF8
	.4byte _08013CF8
_08013CEC:
	ldr r0, _08013CF4
	bl PlayBGM
	b _08013D1C
	.align 2, 0
_08013CF4: .4byte 0x00000163
_08013CF8:
	movs r0, 0xD4
	lsls r0, 1
	bl PlayBGM
	b _08013D1C
_08013D02:
	movs r0, 0xB1
	lsls r0, 1
	bl PlayBGM
	b _08013D1C
_08013D0C:
	movs r0, 0xCE
	lsls r0, 1
	bl PlayBGM
	b _08013D1C
_08013D16:
	ldr r1, _08013D28
	ldr r0, _08013D2C
_08013D1A:
	str r0, [r1]
_08013D1C:
	ldr r1, _08013D30
	ldr r0, _08013D34
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D28: .4byte gUnknown_02024C10
_08013D2C: .4byte gUnknown_081D8DCE
_08013D30: .4byte gUnknown_030042D4
_08013D34: .4byte sub_8013C9C
	thumb_func_end sub_8013998

	thumb_func_start sub_8013B64
sub_8013B64: @ 8013D38
	push {r4,lr}
	ldr r1, _08013D70
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08013D74
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013D8C
	ldr r1, _08013D78
	ldr r4, _08013D7C
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08013D80
	strb r0, [r1]
	ldr r1, _08013D84
	ldr r0, _08013D88
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08013D92
	.align 2, 0
_08013D70: .4byte gUnknown_02024A7F
_08013D74: .4byte gUnknown_020239F8
_08013D78: .4byte gUnknown_030041C0
_08013D7C: .4byte gUnknown_02024D26
_08013D80: .4byte gUnknown_02024C07
_08013D84: .4byte gUnknown_02024C10
_08013D88: .4byte gUnknown_081D8E02
_08013D8C:
	ldr r1, _08013DA0
	ldr r0, _08013DA4
	str r0, [r1]
_08013D92:
	ldr r1, _08013DA8
	ldr r0, _08013DAC
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DA0: .4byte gUnknown_02024C10
_08013DA4: .4byte gUnknown_081D8DD1
_08013DA8: .4byte gUnknown_030042D4
_08013DAC: .4byte sub_8013C9C
	thumb_func_end sub_8013B64

	thumb_func_start sub_8013BDC
sub_8013BDC: @ 8013DB0
	push {lr}
	ldr r1, _08013DD8
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013DDC
	ldr r0, _08013DE0
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r0, 30
	cmp r0, 0x1
	beq _08013DEC
	cmp r0, 0x2
	beq _08013DFC
	ldr r1, _08013DE4
	ldr r0, _08013DE8
	b _08013E00
	.align 2, 0
_08013DD8: .4byte gUnknown_02024A7F
_08013DDC: .4byte gUnknown_02024D28
_08013DE0: .4byte gUnknown_02024C07
_08013DE4: .4byte gUnknown_02024C10
_08013DE8: .4byte gUnknown_081D8E29
_08013DEC:
	ldr r1, _08013DF4
	ldr r0, _08013DF8
	b _08013E00
	.align 2, 0
_08013DF4: .4byte gUnknown_02024C10
_08013DF8: .4byte gUnknown_081D8E14
_08013DFC:
	ldr r1, _08013E0C
	ldr r0, _08013E10
_08013E00:
	str r0, [r1]
	ldr r1, _08013E14
	ldr r0, _08013E18
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013E0C: .4byte gUnknown_02024C10
_08013E10: .4byte gUnknown_081D8E22
_08013E14: .4byte gUnknown_030042D4
_08013E18: .4byte sub_8013C9C
	thumb_func_end sub_8013BDC

	thumb_func_start sub_8013C48
sub_8013C48: @ 8013E1C
	ldr r1, _08013E50
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013E54
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _08013E58
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _08013E5C
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08013E60
	ldr r0, _08013E64
	str r0, [r1]
	ldr r1, _08013E68
	ldr r0, _08013E6C
	str r0, [r1]
	bx lr
	.align 2, 0
_08013E50: .4byte gUnknown_02024A7F
_08013E54: .4byte gUnknown_030041C0
_08013E58: .4byte gUnknown_02024C07
_08013E5C: .4byte gUnknown_02024A6A
_08013E60: .4byte gUnknown_02024C10
_08013E64: .4byte gUnknown_081D8E30
_08013E68: .4byte gUnknown_030042D4
_08013E6C: .4byte sub_8013C9C
	thumb_func_end sub_8013C48

	thumb_func_start sub_8013C9C
sub_8013C9C: @ 8013E70
	push {r4-r7,lr}
	ldr r0, _08013ED4
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013F50
	ldr r0, _08013ED8
	ldrh r0, [r0]
	ldr r1, _08013EDC
	ands r1, r0
	cmp r1, 0
	bne _08013F20
	ldr r2, _08013EE0
	strb r1, [r2]
	ldr r0, _08013EE4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08013F1C
	adds r4, r2, 0
	ldr r6, _08013EE8
	movs r5, 0x58
	adds r7, r6, 0
	adds r7, 0x30
_08013EA2:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08013F0A
	ldr r2, _08013EEC
	ldrh r0, [r2, 0x6]
	cmp r0, 0
	bne _08013EF0
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x8
	bl StringCopy
	b _08013F0A
	.align 2, 0
_08013ED4: .4byte gUnknown_02024A7F
_08013ED8: .4byte gUnknown_020239F8
_08013EDC: .4byte 0x00000b92
_08013EE0: .4byte gUnknown_02024A60
_08013EE4: .4byte gUnknown_02024A68
_08013EE8: .4byte gBattleMons
_08013EEC: .4byte gUnknown_030042E0
_08013EF0:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x26]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x14
	bl StringCopy
_08013F0A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013F3C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013EA2
_08013F1C:
	bl sub_80BDEC8
_08013F20:
	movs r0, 0x3
	bl BeginFastPaletteFade
	movs r0, 0x5
	bl FadeOutMapMusic
	ldr r1, _08013F40
	ldr r0, _08013F44
	str r0, [r1]
	ldr r1, _08013F48
	ldr r0, _08013F4C
	str r0, [r1]
	b _08013F6A
	.align 2, 0
_08013F3C: .4byte gUnknown_02024A68
_08013F40: .4byte gUnknown_030042D4
_08013F44: .4byte sub_8013DA8
_08013F48: .4byte gUnknown_03005E94
_08013F4C: .4byte sub_800F808
_08013F50:
	ldr r0, _08013F70
	ldr r0, [r0]
	cmp r0, 0
	bne _08013F6A
	ldr r1, _08013F74
	ldr r0, _08013F78
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013F6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013F70: .4byte gUnknown_02024A64
_08013F74: .4byte gUnknown_081FA73C
_08013F78: .4byte gUnknown_02024C10
	thumb_func_end sub_8013C9C

	thumb_func_start sub_8013DA8
sub_8013DA8: @ 8013F7C
	push {lr}
	ldr r0, _08013FA4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08013FBE
	bl ResetSpriteData
	ldr r0, _08013FA8
	ldrb r0, [r0]
	cmp r0, 0
	beq _08013F9E
	ldr r0, _08013FAC
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08013FB8
_08013F9E:
	ldr r1, _08013FB0
	ldr r0, _08013FB4
	b _08013FBC
	.align 2, 0
_08013FA4: .4byte gPaletteFade
_08013FA8: .4byte gUnknown_03004324
_08013FAC: .4byte gUnknown_02024D26
_08013FB0: .4byte gUnknown_030042D4
_08013FB4: .4byte c4_overworld
_08013FB8:
	ldr r1, _08013FC4
	ldr r0, _08013FC8
_08013FBC:
	str r0, [r1]
_08013FBE:
	pop {r0}
	bx r0
	.align 2, 0
_08013FC4: .4byte gUnknown_030042D4
_08013FC8: .4byte bc_evolution_cutscene
	thumb_func_end sub_8013DA8

	thumb_func_start bc_evolution_cutscene
bc_evolution_cutscene: @ 8013FCC
	push {r4,r5,lr}
	ldr r0, _08014020
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0
	beq _08014042
_08013FD8:
	movs r5, 0
_08013FDA:
	ldrb r2, [r3]
	ldr r0, _08014024
	lsls r1, r5, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08014034
	bics r2, r1
	strb r2, [r3]
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08014028
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08014034
	ldr r0, _0801402C
	ldr r1, _08014030
	str r1, [r0]
	lsls r3, r5, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x81
	bl EvolutionScene
	b _08014048
	.align 2, 0
_08014020: .4byte gUnknown_03004324
_08014024: .4byte gBitTable
_08014028: .4byte gPlayerParty
_0801402C: .4byte gUnknown_030042D4
_08014030: .4byte sub_8013E88
_08014034:
	adds r5, 0x1
	ldr r3, _08014050
	cmp r5, 0x5
	ble _08013FDA
	ldrb r0, [r3]
	cmp r0, 0
	bne _08013FD8
_08014042:
	ldr r1, _08014054
	ldr r0, _08014058
	str r0, [r1]
_08014048:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014050: .4byte gUnknown_03004324
_08014054: .4byte gUnknown_030042D4
_08014058: .4byte c4_overworld
	thumb_func_end bc_evolution_cutscene

	thumb_func_start sub_8013E88
sub_8013E88: @ 801405C
	push {lr}
	ldr r0, _08014074
	ldr r1, [r0, 0x4]
	ldr r0, _08014078
	cmp r1, r0
	bne _0801406E
	ldr r1, _0801407C
	ldr r0, _08014080
	str r0, [r1]
_0801406E:
	pop {r0}
	bx r0
	.align 2, 0
_08014074: .4byte gMain
_08014078: .4byte sub_800F808
_0801407C: .4byte gUnknown_030042D4
_08014080: .4byte bc_evolution_cutscene
	thumb_func_end sub_8013E88

	thumb_func_start c4_overworld
c4_overworld: @ 8014084
	push {r4-r6,lr}
	ldr r5, _08014104
	ldrh r1, [r5]
	movs r6, 0x2
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _080140A2
	ldr r4, _08014108
	adds r0, r4, 0
	bl RandomlyGivePartyPokerus
	adds r0, r4, 0
	bl PartySpreadPokerus
_080140A2:
	ldrh r4, [r5]
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	beq _080140B4
	ldr r0, _0801410C
	ldrb r0, [r0]
	cmp r0, 0
	bne _080140FE
_080140B4:
	ldr r1, _08014110
	ldr r5, _08014114
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r3, _08014118
	ldr r0, _0801411C
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08014120
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	ands r0, r4
	cmp r0, 0
	beq _080140F0
	ldr r0, _08014124
	bl sub_8134504
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _080140EC
	cmp r0, 0x7
	bne _080140F0
_080140EC:
	bl sub_813452C
_080140F0:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r0, _08014118
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_080140FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014104: .4byte gUnknown_020239F8
_08014108: .4byte gPlayerParty
_0801410C: .4byte gReceivedRemoteLinkPlayers
_08014110: .4byte gScriptResult
_08014114: .4byte gUnknown_02024D26
_08014118: .4byte gMain
_0801411C: .4byte 0x0000043d
_08014120: .4byte gUnknown_030042D0
_08014124: .4byte gEnemyParty
	thumb_func_end c4_overworld

	thumb_func_start sub_8013F54
sub_8013F54: @ 8014128
	push {lr}
	ldr r0, _08014158
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08014164
	ldr r2, _0801415C
	adds r1, r2, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _08014148
	subs r0, 0x1
	strb r0, [r1]
_08014148:
	ldr r0, _08014160
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	b _0801417E
	.align 2, 0
_08014158: .4byte gUnknown_02024A7F
_0801415C: .4byte 0x02017140
_08014160: .4byte gUnknown_030042D4
_08014164:
	ldr r0, _08014184
	ldr r0, [r0]
	cmp r0, 0
	bne _0801417E
	ldr r1, _08014188
	ldr r0, _0801418C
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0801417E:
	pop {r0}
	bx r0
	.align 2, 0
_08014184: .4byte gUnknown_02024A64
_08014188: .4byte gUnknown_081FA73C
_0801418C: .4byte gUnknown_02024C10
	thumb_func_end sub_8013F54

	thumb_func_start sub_8013FBC
sub_8013FBC: @ 8014190
	push {lr}
	ldr r0, _080141B0
	ldr r0, [r0]
	cmp r0, 0
	bne _080141AC
	ldr r1, _080141B4
	ldr r0, _080141B8
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_080141AC:
	pop {r0}
	bx r0
	.align 2, 0
_080141B0: .4byte gUnknown_02024A64
_080141B4: .4byte gUnknown_081FA73C
_080141B8: .4byte gUnknown_02024C10
	thumb_func_end sub_8013FBC

	thumb_func_start sub_8013FE8
sub_8013FE8: @ 80141BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0x4
	str r0, [sp]
	ldr r7, _080141FC
	ldr r1, _08014200
	ldr r0, _08014204
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r1, _08014208
	mov r10, r1
	ldr r0, _0801420C
	add r0, r10
	ldrb r2, [r0]
	ldr r1, _08014210
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08014218
	ldr r1, _08014214
	movs r0, 0xC
	b _080148A0
	.align 2, 0
_080141FC: .4byte gUnknown_02024C07
_08014200: .4byte gUnknown_02024A7A
_08014204: .4byte gUnknown_02024A7E
_08014208: .4byte 0x02000000
_0801420C: .4byte 0x000160a6
_08014210: .4byte gBitTable
_08014214: .4byte gUnknown_02024A7F
_08014218:
	ldr r1, _0801428C
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08014290
	add r1, r10
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08014294
	add r0, r10
	strb r2, [r0]
	ldr r0, _08014298
	strb r2, [r0]
	ldr r0, _0801429C
	strb r2, [r0]
	ldr r0, _080142A0
	strb r2, [r0, 0x6]
	ldr r3, _080142A4
	ldrb r0, [r7]
	ldr r2, _080142A8
	adds r0, r2
	add r0, r10
	ldrb r0, [r0]
	ldr r4, _080142AC
	strb r0, [r4]
	strb r0, [r3]
	ldr r1, _080142B0
	ldrb r2, [r7]
	lsls r0, r2, 4
	adds r5, r0, r1
	ldrb r1, [r5]
	lsls r0, r1, 29
	adds r4, r2, 0
	mov r8, r3
	cmp r0, 0
	bge _080142C4
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	ldr r2, _080142B4
	ldr r1, _080142B8
	movs r0, 0xA5
	strh r0, [r1]
	strh r0, [r2]
	ldr r2, _080142BC
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r2]
	movs r0, 0xA5
	movs r1, 0
	bl sub_801B5C0
	ldrb r1, [r7]
	ldr r2, _080142C0
	adds r1, r2
	b _080143D4
	.align 2, 0
_0801428C: .4byte gCritMultiplier
_08014290: .4byte 0x0001601f
_08014294: .4byte 0x000160e7
_08014298: .4byte gUnknown_02024C68
_0801429C: .4byte gUnknown_02024C0E
_080142A0: .4byte gUnknown_02024D1E
_080142A4: .4byte gUnknown_02024BE4
_080142A8: .4byte 0x0001608c
_080142AC: .4byte gUnknown_02024BE5
_080142B0: .4byte gUnknown_02024D28
_080142B4: .4byte gUnknown_02024BE6
_080142B8: .4byte gUnknown_02024BE8
_080142BC: .4byte gUnknown_02024C6C
_080142C0: .4byte 0x00016010
_080142C4:
	ldr r1, _080142FC
	movs r0, 0x58
	adds r5, r4, 0
	muls r5, r0
	adds r0, r1, 0
	adds r0, 0x50
	adds r0, r5, r0
	ldr r2, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r2
	cmp r0, 0
	bne _080142E8
	movs r6, 0x80
	lsls r6, 15
	ands r6, r2
	cmp r6, 0
	beq _0801430C
_080142E8:
	ldr r3, _08014300
	ldr r2, _08014304
	ldr r1, _08014308
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	b _08014454
	.align 2, 0
_080142FC: .4byte gBattleMons
_08014300: .4byte gUnknown_02024BE6
_08014304: .4byte gUnknown_02024BE8
_08014308: .4byte gUnknown_02024C54
_0801430C:
	ldr r3, _0801435C
	mov r12, r3
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r2, r0, r3
	ldrh r4, [r2, 0x6]
	adds r1, r4, 0
	cmp r1, 0
	beq _080143EC
	ldrb r3, [r2, 0xC]
	lsls r0, r3, 1
	adds r0, r5
	str r0, [sp, 0x8]
	ldr r0, _08014360
	adds r0, 0xC
	mov r9, r0
	ldr r0, [sp, 0x8]
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	bne _08014374
	ldr r1, _08014364
	ldr r0, _08014368
	strh r4, [r0]
	strh r4, [r1]
	ldrb r0, [r2, 0xC]
	ldr r2, _0801436C
	strb r0, [r2]
	mov r3, r8
	strb r0, [r3]
	ldrh r0, [r1]
	movs r1, 0
	bl sub_801B5C0
	ldrb r1, [r7]
	ldr r4, _08014370
	adds r1, r4
	b _080143D4
	.align 2, 0
_0801435C: .4byte gUnknown_02024CA8
_08014360: .4byte gBattleMons
_08014364: .4byte gUnknown_02024BE6
_08014368: .4byte gUnknown_02024BE8
_0801436C: .4byte gUnknown_02024BE5
_08014370: .4byte 0x00016010
_08014374:
	cmp r1, 0
	beq _080143EC
	cmp r1, r0
	beq _080143EC
	ldr r0, _080143DC
	strb r3, [r0]
	mov r1, r8
	strb r3, [r1]
	ldr r3, _080143E0
	ldr r1, _080143E4
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r3]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	movs r2, 0
	strh r6, [r0, 0x6]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r2, [r0, 0xC]
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldrh r0, [r3]
	movs r1, 0
	bl sub_801B5C0
	ldrb r1, [r7]
	ldr r3, _080143E8
	adds r1, r3
_080143D4:
	add r1, r10
	strb r0, [r1]
	b _08014454
	.align 2, 0
_080143DC: .4byte gUnknown_02024BE5
_080143E0: .4byte gUnknown_02024BE6
_080143E4: .4byte gUnknown_02024BE8
_080143E8: .4byte 0x00016010
_080143EC:
	mov r4, r8
	ldrb r0, [r4]
	lsls r0, 1
	ldr r4, _08014430
	ldrb r2, [r4]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	ldr r1, _08014434
	adds r1, 0xC
	adds r0, r1
	ldr r1, _08014438
	lsls r2, 1
	adds r2, r1
	ldrh r3, [r0]
	ldrh r2, [r2]
	cmp r3, r2
	beq _0801444C
	ldr r1, _0801443C
	ldr r0, _08014440
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r1]
	movs r1, 0
	bl sub_801B5C0
	ldr r2, _08014444
	ldrb r1, [r4]
	ldr r3, _08014448
	adds r1, r3
	adds r1, r2
	strb r0, [r1]
	b _08014454
	.align 2, 0
_08014430: .4byte gUnknown_02024C07
_08014434: .4byte gBattleMons
_08014438: .4byte gUnknown_02024C60
_0801443C: .4byte gUnknown_02024BE6
_08014440: .4byte gUnknown_02024BE8
_08014444: .4byte 0x02000000
_08014448: .4byte 0x00016010
_0801444C:
	ldr r1, _0801446C
	ldr r0, _08014470
	strh r3, [r0]
	strh r3, [r1]
_08014454:
	ldr r0, _08014474
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801447C
	ldr r0, _08014478
	ldr r1, _0801446C
	ldrh r1, [r1]
	strh r1, [r0, 0x22]
	b _08014484
	.align 2, 0
_0801446C: .4byte gUnknown_02024BE6
_08014470: .4byte gUnknown_02024BE8
_08014474: .4byte gUnknown_02024C07
_08014478: .4byte gUnknown_030042E0
_0801447C:
	ldr r0, _080144E8
	ldr r1, _080144EC
	ldrh r1, [r1]
	strh r1, [r0, 0x24]
_08014484:
	ldr r4, _080144F0
	ldrb r0, [r4]
	bl battle_side_get_owner
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080144F4
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	adds r3, r4, 0
	cmp r0, 0
	beq _08014504
	ldr r2, _080144F8
	ldr r0, _080144EC
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _08014504
	ldrb r0, [r3]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5, 0x9]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08014504
	ldr r1, _080144FC
	ldrb r2, [r5, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08014504
	ldr r0, _08014500
	strb r2, [r0]
	b _08014880
	.align 2, 0
_080144E8: .4byte gUnknown_030042E0
_080144EC: .4byte gUnknown_02024BE6
_080144F0: .4byte gUnknown_02024C07
_080144F4: .4byte gUnknown_02024C80
_080144F8: .4byte gBattleMoves
_080144FC: .4byte gBattleMons
_08014500: .4byte gUnknown_02024C08
_08014504:
	ldr r2, _08014628
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	ldr r3, _0801462C
	mov r9, r2
	cmp r0, 0
	bne _08014516
	b _080147F0
_08014516:
	ldr r1, _08014630
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r7, [r0, 0x8]
	cmp r7, 0
	beq _08014528
	b _08014744
_08014528:
	ldr r2, _08014634
	ldr r0, _08014638
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08014544
	ldrb r0, [r4, 0x6]
	cmp r0, 0x10
	bne _08014544
	b _08014744
_08014544:
	ldr r3, _0801463C
	ldr r0, _08014640
	mov r8, r0
	ldr r2, _0801462C
	ldrb r5, [r2]
	ldr r1, _08014644
	adds r0, r5, r1
	add r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0x1F
	bne _08014568
	b _08014744
_08014568:
	ldrb r0, [r4, 0x2]
	cmp r0, 0xD
	beq _08014570
	b _08014744
_08014570:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08014648
	strb r7, [r1]
	ldr r0, _0801464C
	ldrb r0, [r0]
	cmp r7, r0
	bcs _080145EA
	adds r4, r1, 0
	mov r5, r8
_0801458A:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _080145D8
	ldr r0, _0801462C
	ldrb r0, [r0]
	ldr r2, _08014644
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	ldrb r3, [r4]
	cmp r0, r3
	beq _080145D8
	ldr r1, _0801463C
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _080145D8
	adds r0, r2, 0
	bl sub_801E3B4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r0, r1
	bcs _080145D8
	ldrb r0, [r4]
	bl sub_801E3B4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_080145D8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0801464C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801458A
_080145EA:
	ldr r2, [sp]
	cmp r2, 0x4
	beq _080145F2
	b _080146F6
_080145F2:
	ldr r2, _08014634
	ldr r0, _08014650
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	ldr r3, [sp]
	ands r3, r0
	cmp r3, 0
	beq _08014678
	ldr r0, _0801462C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014658
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014654
	movs r0, 0x1
	b _0801466A
	.align 2, 0
_08014628: .4byte gUnknown_020239F8
_0801462C: .4byte gUnknown_02024C07
_08014630: .4byte gUnknown_02024C80
_08014634: .4byte gBattleMoves
_08014638: .4byte gUnknown_02024BE6
_0801463C: .4byte gBattleMons
_08014640: .4byte 0x02000000
_08014644: .4byte 0x00016010
_08014648: .4byte gUnknown_02024A60
_0801464C: .4byte gUnknown_02024A68
_08014650: .4byte gUnknown_02024BE8
_08014654:
	movs r0, 0x3
	b _0801466A
_08014658:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014668
	movs r0, 0
	b _0801466A
_08014668:
	movs r0, 0x2
_0801466A:
	bl battle_get_side_with_given_state
	ldr r1, _08014674
	strb r0, [r1]
	b _0801468A
	.align 2, 0
_08014674: .4byte gUnknown_02024C08
_08014678:
	ldr r2, _080146C0
	ldr r1, _080146C4
	ldr r0, _080146C8
	ldrb r0, [r0]
	ldr r4, _080146CC
	adds r0, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
_0801468A:
	ldr r7, _080146D0
	ldrb r0, [r7]
	ldr r1, _080146D4
	mov r8, r1
	ldr r5, _080146C0
	ldrb r1, [r5]
	lsls r1, 2
	add r1, r8
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _080146A4
	b _08014880
_080146A4:
	ldr r6, _080146C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080146D8
	ldrb r0, [r5]
	b _0801486E
	.align 2, 0
_080146C0: .4byte gUnknown_02024C08
_080146C4: .4byte 0x02000000
_080146C8: .4byte gUnknown_02024C07
_080146CC: .4byte 0x00016010
_080146D0: .4byte gUnknown_02024C0C
_080146D4: .4byte gBitTable
_080146D8:
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r5]
	lsls r0, r2, 2
	add r0, r8
	b _08014864
_080146F6:
	ldr r4, _08014730
	ldr r0, _08014734
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _08014738
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	adds r1, 0x20
	ldrb r1, [r1]
	bl sub_81074C4
	ldr r2, _0801473C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08014740
	ldrb r0, [r4]
	strb r0, [r1]
	b _08014880
	.align 2, 0
_08014730: .4byte gUnknown_02024A60
_08014734: .4byte gUnknown_02024A7A
_08014738: .4byte gBattleMons
_0801473C: .4byte gUnknown_02024D68
_08014740: .4byte gUnknown_02024C08
_08014744:
	mov r4, r9
	ldrh r1, [r4]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080147F0
	ldr r2, _08014788
	ldr r0, _0801478C
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080147F0
	ldrb r0, [r3]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014794
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _08014790
	movs r0, 0x1
	b _080147A6
	.align 2, 0
_08014788: .4byte gBattleMoves
_0801478C: .4byte gUnknown_02024BE8
_08014790:
	movs r0, 0x3
	b _080147A6
_08014794:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080147A4
	movs r0, 0
	b _080147A6
_080147A4:
	movs r0, 0x2
_080147A6:
	bl battle_get_side_with_given_state
	ldr r1, _080147E0
	strb r0, [r1]
	ldr r0, _080147E4
	ldrb r1, [r0]
	ldr r2, _080147E8
	ldr r5, _080147E0
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08014880
	ldr r0, _080147EC
	ldrb r0, [r0]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08014880
	ldrb r0, [r5]
	b _0801486E
	.align 2, 0
_080147E0: .4byte gUnknown_02024C08
_080147E4: .4byte gUnknown_02024C0C
_080147E8: .4byte gBitTable
_080147EC: .4byte gUnknown_02024C07
_080147F0:
	ldr r5, _08014834
	ldr r1, _08014838
	adds r2, r3, 0
	ldrb r0, [r2]
	ldr r4, _0801483C
	adds r0, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r6, _08014840
	ldrb r1, [r6]
	ldr r7, _08014844
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08014880
	ldrb r0, [r2]
	str r3, [sp, 0x4]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r4, r0
	beq _08014848
	ldrb r0, [r5]
	b _0801486E
	.align 2, 0
_08014834: .4byte gUnknown_02024C08
_08014838: .4byte 0x02000000
_0801483C: .4byte 0x00016010
_08014840: .4byte gUnknown_02024C0C
_08014844: .4byte gBitTable
_08014848:
	ldrb r0, [r3]
	bl battle_get_per_side_status
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r5]
	ldrb r1, [r6]
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r7
_08014864:
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08014880
	adds r0, r2, 0
_0801486E:
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r5]
_08014880:
	ldr r4, _080148B4
	ldr r3, _080148B8
	ldr r2, _080148BC
	ldr r0, _080148C0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	ldr r1, _080148C4
	movs r0, 0xA
_080148A0:
	strb r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080148B4: .4byte gUnknown_02024C10
_080148B8: .4byte gUnknown_081D6BBC
_080148BC: .4byte gBattleMoves
_080148C0: .4byte gUnknown_02024BE6
_080148C4: .4byte gUnknown_02024A7F
	thumb_func_end sub_8013FE8

	thumb_func_start sub_80146F4
sub_80146F4: @ 80148C8
	push {r4,lr}
	ldr r3, _08014938
	ldr r1, _0801493C
	ldr r0, _08014940
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _08014944
	movs r2, 0
	strh r2, [r0]
	ldr r0, _08014948
	strh r2, [r0]
	ldr r1, _0801494C
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r1, _08014950
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r2, _08014954
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldrb r4, [r3]
	strb r4, [r2, 0x2]
	ldr r1, _08014958
	ldrb r0, [r3]
	ldr r3, _0801495C
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	ldr r0, _08014960
	adds r1, r0
	strb r4, [r1]
	ldr r1, _08014964
	ldr r0, _08014968
	str r0, [r1]
	ldr r1, _0801496C
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08014970
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _08014930
	adds r0, 0x1
	strb r0, [r1, 0x2]
_08014930:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014938: .4byte gUnknown_02024C07
_0801493C: .4byte gUnknown_02024A7A
_08014940: .4byte gUnknown_02024A7E
_08014944: .4byte gUnknown_030042A4
_08014948: .4byte gUnknown_030042A0
_0801494C: .4byte gUnknown_02024E60
_08014950: .4byte gUnknown_02024E64
_08014954: .4byte gUnknown_030041C0
_08014958: .4byte 0x02000000
_0801495C: .4byte 0x00016064
_08014960: .4byte 0x00016003
_08014964: .4byte gUnknown_02024C10
_08014968: .4byte gUnknown_081D8E4E
_0801496C: .4byte gUnknown_02024A7F
_08014970: .4byte gUnknown_030042E0
	thumb_func_end sub_80146F4

	thumb_func_start sub_80147A0
sub_80147A0: @ 8014974
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _080149D8
	ldr r2, _080149DC
	ldr r1, _080149E0
	ldr r0, _080149E4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r4]
	ldr r0, _080149E8
	movs r2, 0
	strh r2, [r0]
	ldr r0, _080149EC
	strh r2, [r0]
	ldr r3, _080149F0
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	strb r2, [r0, 0x10]
	ldr r5, _080149F4
	ldr r2, _080149F8
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	strh r3, [r5]
	cmp r3, 0xC
	bhi _08014A04
	ldr r2, _080149FC
	ldr r1, _08014A00
	ldrh r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	b _08014C60
	.align 2, 0
_080149D8: .4byte gUnknown_02024C07
_080149DC: .4byte gUnknown_02024C08
_080149E0: .4byte gUnknown_02024A7A
_080149E4: .4byte gUnknown_02024A7E
_080149E8: .4byte gUnknown_030042A4
_080149EC: .4byte gUnknown_030042A0
_080149F0: .4byte gUnknown_02024CA8
_080149F4: .4byte gUnknown_02024C04
_080149F8: .4byte gUnknown_02024260
_080149FC: .4byte gUnknown_02024C10
_08014A00: .4byte gUnknown_081D9E48
_08014A04:
	adds r0, r3, 0
	subs r0, 0x50
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _08014A20
	ldr r0, _08014A18
	ldr r1, _08014A1C
	b _08014A30
	.align 2, 0
_08014A18: .4byte gUnknown_02024C10
_08014A1C: .4byte gUnknown_081D9E94
_08014A20:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014A40
	ldr r0, _08014A38
	ldr r1, _08014A3C
_08014A30:
	ldr r1, [r1]
	str r1, [r0]
	b _08014C60
	.align 2, 0
_08014A38: .4byte gUnknown_02024C10
_08014A3C: .4byte gUnknown_081D9E7C
_08014A40:
	ldr r2, _08014A74
	ldrb r0, [r4]
	ldr r3, _08014A78
	adds r1, r2, r3
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _08014A7C
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x1
	mov r8, r4
	ldr r3, _08014A80
	mov r9, r3
	ldr r1, _08014A84
	mov r10, r1
	adds r7, r2, 0
	cmp r0, 0x4
	bls _08014A6A
	b _08014C48
_08014A6A:
	lsls r0, 2
	ldr r1, _08014A88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08014A74: .4byte 0x02000000
_08014A78: .4byte 0x00016003
_08014A7C: .4byte 0x000160d8
_08014A80: .4byte gUnknown_02024C10
_08014A84: .4byte gUnknown_081D9E7C
_08014A88: .4byte _08014A8C
	.align 2, 0
_08014A8C:
	.4byte _08014C48
	.4byte _08014C48
	.4byte _08014AA0
	.4byte _08014B2C
	.4byte _08014C04
_08014AA0:
	ldr r2, _08014AD8
	movs r0, 0
	strb r0, [r2, 0x5]
	ldr r1, _08014ADC
	ldrb r0, [r1]
	lsrs r0, 1
	ldr r6, _08014AE0
	adds r0, r6
	adds r0, r7
	ldrb r3, [r0]
	movs r0, 0x1
	ands r0, r3
	mov r8, r1
	cmp r0, 0
	beq _08014AEC
	movs r0, 0x3E
	ands r0, r3
	ldr r3, _08014AE4
	mov r9, r3
	ldr r1, _08014AE8
	mov r10, r1
	cmp r0, 0
	bne _08014AD0
	b _08014C48
_08014AD0:
	movs r0, 0x5
	strb r0, [r2, 0x5]
	b _08014C48
	.align 2, 0
_08014AD8: .4byte gUnknown_02024D1E
_08014ADC: .4byte gUnknown_02024C07
_08014AE0: .4byte 0x000160da
_08014AE4: .4byte gUnknown_02024C10
_08014AE8: .4byte gUnknown_081D9E7C
_08014AEC:
	ldr r3, _08014B24
	mov r9, r3
	ldr r0, _08014B28
	mov r10, r0
	adds r5, r7, 0
	mov r4, r8
	adds r3, r6, 0
_08014AFA:
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r5
	ldrb r1, [r0]
	lsrs r1, 1
	strb r1, [r0]
	ldrb r0, [r2, 0x5]
	adds r0, 0x1
	strb r0, [r2, 0x5]
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08014AFA
	b _08014C48
	.align 2, 0
_08014B24: .4byte gUnknown_02024C10
_08014B28: .4byte gUnknown_081D9E7C
_08014B2C:
	ldr r3, _08014B60
	movs r0, 0x4
	strb r0, [r3, 0x5]
	ldr r2, _08014B64
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, _08014B68
	mov r12, r1
	add r0, r12
	adds r6, r0, r7
	ldrb r1, [r6]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r2
	cmp r5, 0
	beq _08014B74
	movs r0, 0x5
	strb r0, [r3, 0x5]
	ldr r2, _08014B6C
	mov r9, r2
	ldr r3, _08014B70
	mov r10, r3
	b _08014C48
	.align 2, 0
_08014B60: .4byte gUnknown_02024D1E
_08014B64: .4byte gUnknown_02024C07
_08014B68: .4byte 0x000160da
_08014B6C: .4byte gUnknown_02024C10
_08014B70: .4byte gUnknown_081D9E7C
_08014B74:
	ldr r3, _08014BEC
	movs r4, 0xFD
	strb r4, [r3]
	movs r0, 0x5
	strb r0, [r3, 0x1]
	movs r2, 0x1
	strb r2, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r1, _08014BF0
	strb r4, [r1]
	strb r5, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r5, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldrb r0, [r6]
	ands r2, r0
	ldr r0, _08014BF4
	mov r9, r0
	ldr r1, _08014BF8
	mov r10, r1
	adds r6, r3, 0
	cmp r2, 0
	bne _08014BD6
	adds r3, r7, 0
	mov r5, r8
	mov r4, r12
	adds r2, r6, 0
_08014BB0:
	ldrb r0, [r5]
	lsrs r0, 1
	adds r0, r4
	adds r0, r3
	ldrb r1, [r0]
	lsrs r1, 1
	strb r1, [r0]
	ldrb r0, [r2, 0x2]
	adds r0, 0x1
	strb r0, [r2, 0x2]
	ldrb r0, [r5]
	lsrs r0, 1
	adds r0, r4
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08014BB0
_08014BD6:
	ldrb r0, [r6, 0x2]
	adds r0, 0xE
	ldr r2, _08014BFC
	adds r1, r7, r2
	movs r2, 0
	strb r0, [r1]
	ldr r3, _08014C00
	adds r0, r7, r3
	strb r2, [r0]
	b _08014C48
	.align 2, 0
_08014BEC: .4byte gUnknown_030041C0
_08014BF0: .4byte gUnknown_03004290
_08014BF4: .4byte gUnknown_02024C10
_08014BF8: .4byte gUnknown_081D9E7C
_08014BFC: .4byte 0x000160a4
_08014C00: .4byte 0x000160a5
_08014C04:
	ldr r0, _08014C24
	ldrh r0, [r0]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014C38
	ldr r1, _08014C28
	movs r0, 0x2
	strb r0, [r1, 0x5]
	ldr r0, _08014C2C
	mov r8, r0
	ldr r1, _08014C30
	mov r9, r1
	ldr r2, _08014C34
	mov r10, r2
	b _08014C48
	.align 2, 0
_08014C24: .4byte gUnknown_020239F8
_08014C28: .4byte gUnknown_02024D1E
_08014C2C: .4byte gUnknown_02024C07
_08014C30: .4byte gUnknown_02024C10
_08014C34: .4byte gUnknown_081D9E7C
_08014C38:
	ldr r0, _08014C74
	strb r1, [r0, 0x5]
	ldr r3, _08014C78
	mov r8, r3
	ldr r0, _08014C7C
	mov r9, r0
	ldr r1, _08014C80
	mov r10, r1
_08014C48:
	mov r2, r8
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r3, _08014C84
	adds r0, r3
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	mov r1, r9
	str r0, [r1]
_08014C60:
	movs r0, 0xA
	ldr r2, _08014C88
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014C74: .4byte gUnknown_02024D1E
_08014C78: .4byte gUnknown_02024C07
_08014C7C: .4byte gUnknown_02024C10
_08014C80: .4byte gUnknown_081D9E7C
_08014C84: .4byte 0x000160d8
_08014C88: .4byte gUnknown_02024A7F
	thumb_func_end sub_80147A0

	thumb_func_start sub_8014AB8
sub_8014AB8: @ 8014C8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r1, _08014CB0
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08014CB8
	ldr r1, _08014CB4
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	b _08014CC2
	.align 2, 0
_08014CB0: .4byte gBattleMons
_08014CB4: .4byte gEnigmaBerries
_08014CB8:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r1, r0, 24
_08014CC2:
	ldr r0, _08014CEC
	strb r4, [r0]
	cmp r1, 0x25
	bne _08014CFC
	ldr r2, _08014CF0
	ldr r1, _08014CF4
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r0, _08014CF8
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	b _08014D24
	.align 2, 0
_08014CEC: .4byte gUnknown_02024C0B
_08014CF0: .4byte gUnknown_02024C04
_08014CF4: .4byte gBattleMons
_08014CF8: .4byte gUnknown_02024D28
_08014CFC:
	ldr r6, _08014D30
	movs r2, 0x58
	adds r0, r4, 0
	muls r0, r2
	adds r3, r0, r6
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x32
	bne _08014D3C
	ldr r0, _08014D34
	strb r1, [r0]
	ldr r0, _08014D38
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
_08014D24:
	orrs r0, r1
	strb r0, [r2, 0x1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _08014D96
	.align 2, 0
_08014D30: .4byte gBattleMons
_08014D34: .4byte byte_2024C06
_08014D38: .4byte gUnknown_02024D28
_08014D3C:
	ldr r0, _08014DB0
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08014D8A
	movs r1, 0x1
	adds r0, r4, 0
	eors r0, r1
	muls r0, r2
	adds r2, r0, r6
	ldrh r0, [r3, 0x6]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	bcs _08014D84
	lsls r0, 7
	ldrh r1, [r2, 0x6]
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _08014DB4
	ldr r1, _08014DB8
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	movs r1, 0xFF
	ands r1, r0
	cmp r4, r1
	bls _08014D8A
_08014D84:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08014D8A:
	ldr r1, _08014DB4
	ldr r0, _08014DB8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08014D96:
	cmp r5, 0
	beq _08014DA8
	ldr r1, _08014DBC
	ldr r0, _08014DC0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08014DC4
	movs r0, 0x4
	strb r0, [r1]
_08014DA8:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014DB0: .4byte gUnknown_020239F8
_08014DB4: .4byte 0x02000000
_08014DB8: .4byte 0x00016078
_08014DBC: .4byte gUnknown_02024A7E
_08014DC0: .4byte gUnknown_02024A68
_08014DC4: .4byte gUnknown_02024D26
	thumb_func_end sub_8014AB8

	thumb_func_start sub_8014BF4
sub_8014BF4: @ 8014DC8
	push {r4-r6,lr}
	ldr r4, _08014E18
	ldr r1, _08014E1C
	ldr r5, _08014E20
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08014E24
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08014E70
	ldr r0, _08014E28
	ldrb r1, [r0]
	strb r1, [r5]
	ldr r2, _08014E2C
	movs r0, 0
	strb r0, [r2]
	lsls r1, 24
	cmp r1, 0
	beq _08014E5C
	adds r4, r2, 0
	ldr r6, _08014E30
	ldr r5, _08014E34
_08014DFC:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014E38
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08014E4A
	ldrb r0, [r5]
	movs r1, 0x2
	b _08014E46
	.align 2, 0
_08014E18: .4byte gUnknown_02024C07
_08014E1C: .4byte gUnknown_02024A7A
_08014E20: .4byte gUnknown_02024A7E
_08014E24: .4byte gUnknown_020239F8
_08014E28: .4byte gUnknown_02024A68
_08014E2C: .4byte gUnknown_02024A60
_08014E30: .4byte gUnknown_02024C18
_08014E34: .4byte gUnknown_02024D26
_08014E38:
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08014E4A
	ldrb r0, [r5]
	movs r1, 0x1
_08014E46:
	orrs r0, r1
	strb r0, [r5]
_08014E4A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08014E68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08014DFC
_08014E5C:
	ldr r0, _08014E6C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _08014F14
	.align 2, 0
_08014E68: .4byte gUnknown_02024A68
_08014E6C: .4byte gUnknown_02024D26
_08014E70:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014EC8
	ldrb r0, [r4]
	bl sub_8014AB8
	lsls r0, 24
	cmp r0, 0
	bne _08014F14
	ldr r1, _08014EB0
	ldrb r2, [r4]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _08014EB4
	ands r0, r1
	str r0, [r2]
	ldr r1, _08014EB8
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r1, _08014EBC
	ldr r0, _08014EC0
	str r0, [r1]
	ldr r1, _08014EC4
	movs r0, 0xA
	b _08014F12
	.align 2, 0
_08014EB0: .4byte gBattleMons
_08014EB4: .4byte 0xfdffffff
_08014EB8: .4byte gUnknown_02024D1E
_08014EBC: .4byte gUnknown_02024C10
_08014EC0: .4byte gUnknown_081D8E3B
_08014EC4: .4byte gUnknown_02024A7F
_08014EC8:
	ldr r1, _08014EF0
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08014EF4
	ands r0, r1
	cmp r0, 0
	beq _08014F08
	ldr r1, _08014EF8
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r1, _08014EFC
	ldr r0, _08014F00
	str r0, [r1]
	ldr r1, _08014F04
	movs r0, 0xA
	b _08014F12
	.align 2, 0
_08014EF0: .4byte gBattleMons
_08014EF4: .4byte 0x0400e000
_08014EF8: .4byte gUnknown_02024D1E
_08014EFC: .4byte gUnknown_02024C10
_08014F00: .4byte gUnknown_081D8E3B
_08014F04: .4byte gUnknown_02024A7F
_08014F08:
	ldr r0, _08014F1C
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _08014F20
	movs r0, 0x6
_08014F12:
	strb r0, [r1]
_08014F14:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014F1C: .4byte gUnknown_02024A68
_08014F20: .4byte gUnknown_02024D26
	thumb_func_end sub_8014BF4

	thumb_func_start sub_8014D50
sub_8014D50: @ 8014F24
	ldr r2, _08014F4C
	ldr r1, _08014F50
	ldr r0, _08014F54
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014F58
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014F5C
	strh r1, [r0]
	ldr r1, _08014F60
	ldr r0, _08014F64
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08014F68
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014F4C: .4byte gUnknown_02024C07
_08014F50: .4byte gUnknown_02024A7A
_08014F54: .4byte gUnknown_02024A7E
_08014F58: .4byte gUnknown_030042A4
_08014F5C: .4byte gUnknown_030042A0
_08014F60: .4byte gUnknown_02024C10
_08014F64: .4byte gUnknown_081D9E98
_08014F68: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014D50

	thumb_func_start sub_8014D98
sub_8014D98: @ 8014F6C
	ldr r2, _08014FA4
	ldr r1, _08014FA8
	ldr r0, _08014FAC
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014FB0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014FB4
	strh r1, [r0]
	ldr r1, _08014FB8
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r1, _08014FBC
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08014FC0
	ldr r0, _08014FC4
	ldr r0, [r0, 0x14]
	str r0, [r1]
	ldr r1, _08014FC8
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014FA4: .4byte gUnknown_02024C07
_08014FA8: .4byte gUnknown_02024A7A
_08014FAC: .4byte gUnknown_02024A7E
_08014FB0: .4byte gUnknown_030042A4
_08014FB4: .4byte gUnknown_030042A0
_08014FB8: .4byte gNumSafariBalls
_08014FBC: .4byte gUnknown_02024C04
_08014FC0: .4byte gUnknown_02024C10
_08014FC4: .4byte gUnknown_081D9E48
_08014FC8: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014D98

	thumb_func_start sub_8014DF8
sub_8014DF8: @ 8014FCC
	push {r4-r6,lr}
	ldr r3, _0801503C
	ldr r1, _08015040
	ldr r0, _08015044
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _08015048
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0801504C
	strh r1, [r0]
	ldr r6, _08015050
	ldr r2, _08015054
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r6, 0x5]
	ldr r1, _08015058
	ldrb r0, [r3]
	lsls r0, 9
	adds r2, 0x2
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r2, _0801505C
	ldr r0, _08015060
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08015016
	adds r0, 0x1
	strb r0, [r1]
_08015016:
	ldr r0, _08015064
	adds r4, r2, r0
	ldrb r5, [r4]
	adds r3, r5, 0
	cmp r3, 0x1
	bls _08015070
	ldr r2, _08015068
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	ldrb r6, [r6, 0x5]
	adds r0, r6
	adds r0, r2
	ldrb r0, [r0]
	cmp r3, r0
	bcs _0801506C
	movs r0, 0x1
	b _0801506E
	.align 2, 0
_0801503C: .4byte gUnknown_02024C07
_08015040: .4byte gUnknown_02024A7A
_08015044: .4byte gUnknown_02024A7E
_08015048: .4byte gUnknown_030042A4
_0801504C: .4byte gUnknown_030042A0
_08015050: .4byte gUnknown_02024D1E
_08015054: .4byte gUnknown_02024260
_08015058: .4byte gUnknown_02024C04
_0801505C: .4byte 0x02000000
_08015060: .4byte 0x00016087
_08015064: .4byte 0x00016088
_08015068: .4byte gUnknown_081FA70C
_0801506C:
	subs r0, r5, r0
_0801506E:
	strb r0, [r4]
_08015070:
	ldr r1, _08015084
	ldr r0, _08015088
	ldr r0, [r0, 0x8]
	str r0, [r1]
	ldr r1, _0801508C
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015084: .4byte gUnknown_02024C10
_08015088: .4byte gUnknown_081D9E98
_0801508C: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014DF8

	thumb_func_start sub_8014EBC
sub_8014EBC: @ 8015090
	push {r4,r5,lr}
	ldr r2, _080150FC
	ldr r1, _08015100
	ldr r0, _08015104
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08015108
	movs r5, 0
	strh r5, [r0]
	ldr r0, _0801510C
	strh r5, [r0]
	ldr r3, _08015110
	ldr r0, _08015114
	adds r2, r3, r0
	ldr r1, _08015118
	subs r0, 0x3
	adds r4, r3, r0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	bls _080150CE
	movs r0, 0x14
	strb r0, [r2]
_080150CE:
	ldr r0, _0801511C
	adds r2, r3, r0
	ldr r1, _08015120
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	bls _080150EC
	movs r0, 0x14
	strb r0, [r2]
_080150EC:
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _08015128
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _08015124
	strb r5, [r0, 0x5]
	b _0801512E
	.align 2, 0
_080150FC: .4byte gUnknown_02024C07
_08015100: .4byte gUnknown_02024A7A
_08015104: .4byte gUnknown_02024A7E
_08015108: .4byte gUnknown_030042A4
_0801510C: .4byte gUnknown_030042A0
_08015110: .4byte 0x02000000
_08015114: .4byte 0x00016089
_08015118: .4byte gUnknown_081FA71B
_0801511C: .4byte 0x00016088
_08015120: .4byte gUnknown_081FA71F
_08015124: .4byte gUnknown_02024D1E
_08015128:
	ldr r1, _08015144
	movs r0, 0x1
	strb r0, [r1, 0x5]
_0801512E:
	ldr r1, _08015148
	ldr r0, _0801514C
	ldr r0, [r0, 0x4]
	str r0, [r1]
	ldr r1, _08015150
	movs r0, 0xA
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015144: .4byte gUnknown_02024D1E
_08015148: .4byte gUnknown_02024C10
_0801514C: .4byte gUnknown_081D9E98
_08015150: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014EBC

	thumb_func_start bs8_exit_by_flight
bs8_exit_by_flight: @ 8015154
	push {r4,lr}
	ldr r2, _0801517C
	ldr r1, _08015180
	ldr r4, _08015184
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x11
	bl PlaySE
	ldr r0, _08015188
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _0801518C
	movs r0, 0x4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801517C: .4byte gUnknown_02024C07
_08015180: .4byte gUnknown_02024A7A
_08015184: .4byte gUnknown_02024A7E
_08015188: .4byte gUnknown_02024A68
_0801518C: .4byte gUnknown_02024D26
	thumb_func_end bs8_exit_by_flight

	thumb_func_start sub_8014FBC
sub_8014FBC: @ 8015190
	ldr r3, _080151DC
	ldr r1, _080151E0
	ldr r0, _080151E4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	strb r2, [r3]
	ldr r0, _080151E8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080151EC
	strh r1, [r0]
	ldr r1, _080151F0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _080151F4
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _080151F8
	ldr r0, _080151FC
	ldr r0, [r0, 0xC]
	str r0, [r1]
	ldr r1, _08015200
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08015204
	movs r0, 0xC
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_080151DC: .4byte gUnknown_02024C07
_080151E0: .4byte gUnknown_02024A7A
_080151E4: .4byte gUnknown_02024A7E
_080151E8: .4byte gUnknown_030042A4
_080151EC: .4byte gUnknown_030042A0
_080151F0: .4byte gUnknown_030041C0
_080151F4: .4byte gUnknown_02024A6A
_080151F8: .4byte gUnknown_02024C10
_080151FC: .4byte gUnknown_081D9E98
_08015200: .4byte gUnknown_02024A7F
_08015204: .4byte gUnknown_02024A76
	thumb_func_end sub_8014FBC

	thumb_func_start bsB_exit_by_move
bsB_exit_by_move: @ 8015208
	push {lr}
	bl sub_80173A4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08015224
	ldr r0, _08015228
	ldr r2, _0801522C
	adds r0, r2
	strb r1, [r0]
	ldr r1, _08015230
	movs r0, 0xC
	strb r0, [r1]
_08015224:
	pop {r0}
	bx r0
	.align 2, 0
_08015228: .4byte 0x02000000
_0801522C: .4byte 0x00016059
_08015230: .4byte gUnknown_02024A7F
	thumb_func_end bsB_exit_by_move

	thumb_func_start sub_8015060
sub_8015060: @ 8015234
	ldr r1, _08015254
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08015258
	ldr r2, _0801525C
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r2, _08015260
	ldr r0, [r2]
	ldr r1, _08015264
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_08015254: .4byte gUnknown_02024A7E
_08015258: .4byte gUnknown_02024A7F
_0801525C: .4byte gUnknown_02024A76
_08015260: .4byte gUnknown_02024C6C
_08015264: .4byte 0xf1e892af
	thumb_func_end sub_8015060

	thumb_func_start bsC_8016D70
bsC_8016D70: @ 8015268
	push {r4,r5,lr}
	ldr r1, _080152E0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _080152E4
	ldr r2, _080152E8
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	bl sub_801377C
	ldr r2, _080152EC
	ldr r0, [r2]
	ldr r1, _080152F0
	ands r0, r1
	str r0, [r2]
	ldr r0, _080152F4
	movs r4, 0
	str r4, [r0]
	ldr r1, _080152F8
	ldr r2, _080152FC
	adds r0, r1, r2
	strb r4, [r0]
	ldr r3, _08015300
	adds r0, r1, r3
	strb r4, [r0]
	ldr r2, _08015304
	ldr r5, _08015308
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	strh r4, [r0]
	ldr r3, _0801530C
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r3
	strh r4, [r0]
	ldr r3, _08015310
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015314
	strh r4, [r0]
	subs r3, 0x10
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015318
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x4]
	ldr r3, _0801531C
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015320
	adds r1, r0
	strb r2, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080152E0: .4byte gUnknown_02024A7E
_080152E4: .4byte gUnknown_02024A7F
_080152E8: .4byte gUnknown_02024A76
_080152EC: .4byte gUnknown_02024C6C
_080152F0: .4byte 0xf1e892af
_080152F4: .4byte gUnknown_02024BEC
_080152F8: .4byte 0x02000000
_080152FC: .4byte 0x00016002
_08015300: .4byte 0x000160a1
_08015304: .4byte gUnknown_02024C3C
_08015308: .4byte gUnknown_02024C07
_0801530C: .4byte gUnknown_02024C44
_08015310: .4byte 0x0001601c
_08015314: .4byte gUnknown_02024DEC
_08015318: .4byte gUnknown_02024D1E
_0801531C: .4byte 0x00016112
_08015320: .4byte 0x00017130
	thumb_func_end bsC_8016D70

	thumb_func_start sub_8015150
sub_8015150: @ 8015324
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r0, 0xA
	bhi _0801539C
	lsls r0, 2
	ldr r1, _0801533C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801533C: .4byte _08015340
	.align 2, 0
_08015340:
	.4byte _0801536C
	.4byte _08015374
	.4byte _0801537C
	.4byte _08015398
	.4byte _0801539C
	.4byte _08015398
	.4byte _0801539C
	.4byte _08015384
	.4byte _0801539C
	.4byte _0801539C
	.4byte _08015388
_0801536C:
	ldr r0, _08015370
	b _0801539A
	.align 2, 0
_08015370: .4byte gUnknown_02024C08
_08015374:
	ldr r0, _08015378
	b _0801539A
	.align 2, 0
_08015378: .4byte gUnknown_02024C07
_0801537C:
	ldr r0, _08015380
	b _0801539A
	.align 2, 0
_08015380: .4byte gUnknown_02024C0A
_08015384:
	movs r2, 0
	b _0801539C
_08015388:
	ldr r0, _08015390
	ldr r1, _08015394
	adds r0, r1
	b _0801539A
	.align 2, 0
_08015390: .4byte 0x02000000
_08015394: .4byte 0x00016003
_08015398:
	ldr r0, _080153A4
_0801539A:
	ldrb r2, [r0]
_0801539C:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080153A4: .4byte gUnknown_02024C09
	thumb_func_end sub_8015150

	thumb_func_start sub_80151D4
sub_80151D4: @ 80153A8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _080153D8
	movs r4, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x2E
	bne _0801545A
	movs r3, 0
	adds r0, r5, 0
	muls r0, r4
	adds r1, 0xC
	adds r1, r0, r1
	b _080153E4
	.align 2, 0
_080153D8: .4byte gBattleMons
_080153DC:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080153EA
_080153E4:
	ldrh r0, [r1]
	cmp r0, r2
	bne _080153DC
_080153EA:
	cmp r3, 0x4
	beq _0801545A
	movs r7, 0x58
	adds r2, r5, 0
	muls r2, r7
	adds r0, r3, r2
	mov r6, r12
	adds r6, 0x24
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015406
	subs r0, 0x1
	strb r0, [r1]
_08015406:
	mov r0, r12
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0801545A
	ldr r1, _08015464
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08015468
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0801545A
	ldr r4, _0801546C
	strb r5, [r4]
	adds r1, r3, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r7
	adds r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0801545A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015464: .4byte gUnknown_02024CA8
_08015468: .4byte gBitTable
_0801546C: .4byte gUnknown_02024A60
	thumb_func_end sub_80151D4

	thumb_func_start sub_801529C
sub_801529C: @ 8015470
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x4
	mov r8, r0
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _08015590
	ldrb r0, [r0]
	cmp r4, r0
	bge _08015518
	ldr r1, _08015594
	movs r0, 0x58
	adds r7, r5, 0
	muls r7, r0
	adds r1, 0xC
	mov r10, r1
_080154A6:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	adds r6, r4, 0x1
	cmp r9, r0
	beq _0801550E
	ldr r0, _08015594
	movs r3, 0x58
	adds r1, r4, 0
	muls r1, r3
	adds r1, r0
	adds r1, 0x20
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0x2E
	bne _0801550E
	movs r2, 0
	adds r0, r5, 0
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	cmp r0, r1
	beq _080154F6
	adds r3, r1, 0
	mov r0, r10
	adds r1, r7, r0
_080154E8:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _080154F6
	ldrh r0, [r1]
	cmp r0, r3
	bne _080154E8
_080154F6:
	cmp r2, 0x4
	beq _0801550E
	mov r8, r2
	adds r1, r2, r7
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801550E
	subs r0, 0x1
	strb r0, [r1]
_0801550E:
	adds r4, r6, 0
	ldr r0, _08015590
	ldrb r0, [r0]
	cmp r4, r0
	blt _080154A6
_08015518:
	mov r1, r8
	cmp r1, 0x4
	beq _08015580
	ldr r6, _08015594
	movs r3, 0x58
	adds r0, r5, 0
	muls r0, r3
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08015580
	ldr r1, _08015598
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0801559C
	mov r4, r8
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08015580
	ldr r4, _080155A0
	strb r5, [r4]
	mov r1, r8
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r3
	adds r2, r6, 0
	adds r2, 0x24
	adds r0, r2
	add r0, r8
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08015580:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015590: .4byte gUnknown_02024A68
_08015594: .4byte gBattleMons
_08015598: .4byte gUnknown_02024CA8
_0801559C: .4byte gBitTable
_080155A0: .4byte gUnknown_02024A60
	thumb_func_end sub_801529C

	thumb_func_start sub_80153D0
sub_80153D0: @ 80155A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	movs r6, 0x4
	movs r1, 0
	ldr r0, _0801569C
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bge _08015626
	ldr r7, _080156A0
	movs r2, 0x58
	mov r12, r2
	mov r5, r12
	muls r5, r3
	adds r0, r7, 0
	adds r0, 0xC
	adds r2, r5, r0
	mov r10, r2
	mov r9, r5
_080155D6:
	mov r0, r12
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r1, 0x1
	cmp r0, 0x2E
	bne _0801561C
	cmp r1, r3
	beq _0801561C
	movs r2, 0
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, 0xC3
	beq _08015606
	ldr r1, _080156A4
	add r1, r9
_080155F8:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015606
	ldrh r0, [r1]
	cmp r0, 0xC3
	bne _080155F8
_08015606:
	cmp r2, 0x4
	beq _0801561C
	adds r6, r2, 0
	adds r0, r6, r5
	ldr r2, _080156A8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801561C
	subs r0, 0x1
	strb r0, [r1]
_0801561C:
	adds r1, r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	blt _080155D6
_08015626:
	cmp r6, 0x4
	beq _0801568A
	ldr r7, _080156A0
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0801568A
	ldr r1, _080156AC
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080156B0
	lsls r0, r6, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0801568A
	ldr r4, _080156B4
	strb r3, [r4]
	adds r1, r6, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r5
	adds r2, r7, 0
	adds r2, 0x24
	adds r0, r2
	adds r0, r6
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0801568A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801569C: .4byte gUnknown_02024A68
_080156A0: .4byte gBattleMons
_080156A4: .4byte gUnknown_02024A8C
_080156A8: .4byte gUnknown_02024AA4
_080156AC: .4byte gUnknown_02024CA8
_080156B0: .4byte gBitTable
_080156B4: .4byte gUnknown_02024A60
	thumb_func_end sub_80153D0

	thumb_func_start unref_sub_80154E4
unref_sub_80154E4: @ 80156B8
	push {r4,r5,lr}
	ldr r0, _080156E8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080156F8
	movs r2, 0
	ldr r4, _080156EC
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015716
	ldr r3, _080156F0
	ldr r5, _080156F4
_080156D4:
	ldm r5!, {r1}
	lsls r1, 28
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _080156D4
	b _08015716
	.align 2, 0
_080156E8: .4byte gUnknown_020239F8
_080156EC: .4byte gUnknown_02024A68
_080156F0: .4byte gUnknown_02024A64
_080156F4: .4byte gBitTable
_080156F8:
	movs r2, 0
	ldr r4, _0801571C
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015716
	ldr r3, _08015720
	ldr r5, _08015724
_08015706:
	ldr r0, [r3]
	ldm r5!, {r1}
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015706
_08015716:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801571C: .4byte gUnknown_02024A68
_08015720: .4byte gUnknown_02024A64
_08015724: .4byte gBitTable
	thumb_func_end unref_sub_80154E4

	thumb_func_start dp01_battle_side_mark_buffer_for_execution
dp01_battle_side_mark_buffer_for_execution: @ 8015728
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08015750
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801575C
	ldr r2, _08015754
	ldr r1, _08015758
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _0801576C
	.align 2, 0
_08015750: .4byte gUnknown_020239F8
_08015754: .4byte gUnknown_02024A64
_08015758: .4byte gBitTable
_0801575C:
	ldr r2, _08015770
	ldr r1, _08015774
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_0801576C:
	pop {r0}
	bx r0
	.align 2, 0
_08015770: .4byte gUnknown_02024A64
_08015774: .4byte gBitTable
	thumb_func_end dp01_battle_side_mark_buffer_for_execution

	thumb_func_start sub_80155A4
sub_80155A4: @ 8015778
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r5, _0801578C
	ldr r1, _08015790
	lsls r0, r7, 2
	adds r6, r0, r1
	b _080157A2
	.align 2, 0
_0801578C: .4byte gUnknown_02024A64
_08015790: .4byte gBitTable
_08015794:
	lsls r0, r4, 2
	ldr r1, [r6]
	lsls r1, r0
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	adds r4, 0x1
_080157A2:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _08015794
	ldr r2, _080157C4
	movs r1, 0x80
	lsls r1, 21
	lsls r1, r7
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080157C4: .4byte gUnknown_02024A64
	thumb_func_end sub_80155A4

	thumb_func_start b_cancel_multi_turn_move_maybe
b_cancel_multi_turn_move_maybe: @ 80157C8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015818
	movs r2, 0x58
	adds r3, r0, 0
	muls r3, r2
	adds r1, 0x50
	adds r3, r1
	ldr r1, [r3]
	ldr r2, _0801581C
	ands r1, r2
	ldr r2, _08015820
	ands r1, r2
	movs r2, 0x71
	negs r2, r2
	ands r1, r2
	ldr r2, _08015824
	ands r1, r2
	str r1, [r3]
	ldr r1, _08015828
	lsls r2, r0, 2
	adds r2, r1
	ldr r1, [r2]
	ldr r3, _0801582C
	ands r1, r3
	str r1, [r2]
	ldr r2, _08015830
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x11]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x11]
	movs r0, 0
	strb r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08015818: .4byte gBattleMons
_0801581C: .4byte 0xffffefff
_08015820: .4byte 0xfffff3ff
_08015824: .4byte 0xfffffcff
_08015828: .4byte gUnknown_02024C98
_0801582C: .4byte 0xfffbff3f
_08015830: .4byte gUnknown_02024CA8
	thumb_func_end b_cancel_multi_turn_move_maybe

	thumb_func_start sub_8015660
sub_8015660: @ 8015834
	push {lr}
	lsls r0, 24
	ldr r1, _08015880
	lsrs r0, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	bne _0801587A
	ldrb r2, [r1, 0x1]
	lsls r0, r2, 30
	cmp r0, 0
	blt _0801587A
	lsls r0, r2, 26
	cmp r0, 0
	blt _0801587A
	lsls r0, r2, 25
	cmp r0, 0
	blt _0801587A
	lsrs r0, r2, 7
	cmp r0, 0
	bne _0801587A
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 31
	cmp r0, 0
	bne _0801587A
	lsls r0, r1, 30
	cmp r0, 0
	blt _0801587A
	lsls r0, r1, 29
	cmp r0, 0
	blt _0801587A
	lsls r0, r2, 31
	cmp r0, 0
	beq _08015884
_0801587A:
	movs r0, 0x1
	b _08015886
	.align 2, 0
_08015880: .4byte gUnknown_02024D28
_08015884:
	movs r0, 0
_08015886:
	pop {r1}
	bx r1
	thumb_func_end sub_8015660

	thumb_func_start b_std_message
b_std_message: @ 801588C
	push {r4,lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080158AC
	strb r1, [r4]
	movs r0, 0
	adds r1, r2, 0
	bl dp01_build_cmdbuf_x10_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080158AC: .4byte gUnknown_02024A60
	thumb_func_end b_std_message

	thumb_func_start sub_80156DC
sub_80156DC: @ 80158B0
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _08015904
	strb r3, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0
	ldr r0, _08015908
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r1, r2
	bge _080158DE
	ldr r5, _0801590C
	adds r4, r2, 0
	ldr r2, _08015910
_080158CC:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	orrs r3, r0
	adds r2, 0x4
	adds r1, 0x2
	cmp r1, r4
	blt _080158CC
_080158DE:
	movs r1, 0x1
	adds r2, r6, 0
	ldrb r0, [r2]
	cmp r1, r0
	bge _080158FE
	ldr r5, _08015904
	movs r4, 0x2
_080158EC:
	adds r0, r1, 0
	ands r0, r4
	asrs r0, 1
	adds r0, r5
	strb r3, [r0]
	adds r1, 0x2
	ldrb r0, [r2]
	cmp r1, r0
	blt _080158EC
_080158FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015904: .4byte gUnknown_02024DEA
_08015908: .4byte gUnknown_02024A68
_0801590C: .4byte gBitTable
_08015910: .4byte gUnknown_02024A6A
	thumb_func_end sub_80156DC

	thumb_func_start sub_8015740
sub_8015740: @ 8015914
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08015978
	movs r0, 0x2
	ands r0, r5
	lsls r0, 24
	lsrs r0, 25
	mov r12, r0
	ldr r1, _08015984
	adds r0, r1
	strb r4, [r0]
	adds r5, r4, 0
	ldr r0, _08015988
	ldrb r2, [r0]
	mov r8, r1
	cmp r4, r2
	bge _08015972
	ldr r0, _0801598C
	ldrb r7, [r0]
	ldr r1, _08015990
	adds r6, r2, 0
	ldr r3, _08015994
	adds r2, r1, 0
_08015956:
	ldr r0, [r2]
	ands r0, r7
	cmp r0, 0
	bne _08015968
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r4, r0
_08015968:
	adds r3, 0x4
	adds r2, 0x8
	adds r5, 0x2
	cmp r5, r6
	blt _08015956
_08015972:
	mov r0, r12
	add r0, r8
	strb r4, [r0]
_08015978:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015984: .4byte gUnknown_02024DEA
_08015988: .4byte gUnknown_02024A68
_0801598C: .4byte gUnknown_02024C0C
_08015990: .4byte gBitTable
_08015994: .4byte gUnknown_02024A6A
	thumb_func_end sub_8015740

	thumb_func_start sub_80157C4
sub_80157C4: @ 8015998
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080159B4
	adds r0, r4, 0
	bl sub_8015740
	b _080159EA
_080159B4:
	movs r3, 0x1
	ldr r5, _080159F0
	ldrb r0, [r5]
	cmp r3, r0
	bge _080159EA
	ldr r0, _080159F4
	mov r12, r0
	movs r7, 0x2
	ldr r6, _080159F8
	ldr r1, _080159FC
	lsls r0, r4, 1
	adds r4, r0, r1
_080159CC:
	adds r2, r3, 0
	ands r2, r7
	asrs r2, 1
	add r2, r12
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080159CC
_080159EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080159F0: .4byte gUnknown_02024A68
_080159F4: .4byte gUnknown_02024DEA
_080159F8: .4byte gBitTable
_080159FC: .4byte gUnknown_02024A6A
	thumb_func_end sub_80157C4

	thumb_func_start b_movescr_stack_push
b_movescr_stack_push: @ 8015A00
	push {r4,lr}
	ldr r4, _08015A1C
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
_08015A1C: .4byte 0x02017110
	thumb_func_end b_movescr_stack_push

	thumb_func_start b_movescr_stack_push_cursor
b_movescr_stack_push_cursor: @ 8015A20
	ldr r3, _08015A3C
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r1, _08015A40
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08015A3C: .4byte 0x02017110
_08015A40: .4byte gUnknown_02024C10
	thumb_func_end b_movescr_stack_push_cursor

	thumb_func_start b_movescr_stack_pop_cursor
b_movescr_stack_pop_cursor: @ 8015A44
	ldr r3, _08015A60
	ldr r2, _08015A64
	adds r1, r2, 0
	adds r1, 0x20
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	bx lr
	.align 2, 0
_08015A60: .4byte gUnknown_02024C10
_08015A64: .4byte 0x02017110
	thumb_func_end b_movescr_stack_pop_cursor

	thumb_func_start sub_8015894
sub_8015894: @ 8015A68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r2, _08015B80
	ldr r1, _08015B84
	ldr r5, _08015B88
	ldrb r3, [r5]
	lsls r0, r3, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r3
	adds r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r4, [r0]
	lsls r0, r3, 1
	ldr r2, _08015B8C
	adds r0, r2
	mov r8, r0
	ldr r1, _08015B90
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x4]
	cmp r0, r4
	bne _08015AC2
	cmp r4, 0
	beq _08015AC2
	adds r0, r2, 0
	subs r0, 0xE5
	strb r3, [r0]
	ldr r0, _08015B94
	strh r4, [r0]
	ldr r1, _08015B98
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015B9C
	str r1, [r0]
	movs r6, 0x1
_08015AC2:
	ldr r1, _08015BA0
	ldr r5, _08015B88
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r4, r0
	bne _08015AFE
	cmp r4, 0xA5
	beq _08015AFE
	ldr r1, _08015B80
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bge _08015AFE
	adds r0, r2, 0
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08015B98
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015BA4
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015AFE:
	ldr r2, _08015B90
	ldr r3, _08015B88
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08015B3A
	ldr r0, _08015BA8
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08015B3A
	ldr r0, _08015B94
	strh r4, [r0]
	ldr r1, _08015B98
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015BAC
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015B3A:
	ldr r5, _08015B88
	ldrb r0, [r5]
	adds r1, r4, 0
	bl sub_8015D5C
	lsls r0, 24
	cmp r0, 0
	beq _08015B60
	ldr r0, _08015B94
	strh r4, [r0]
	ldr r1, _08015B98
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015BB0
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015B60:
	ldr r1, _08015B80
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08015BB8
	ldr r1, _08015BB4
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	b _08015BC2
	.align 2, 0
_08015B80: .4byte gBattleMons
_08015B84: .4byte gUnknown_02024260
_08015B88: .4byte gUnknown_02024A60
_08015B8C: .4byte 0x020160e8
_08015B90: .4byte gUnknown_02024CA8
_08015B94: .4byte gUnknown_02024BE6
_08015B98: .4byte gUnknown_02024C1C
_08015B9C: .4byte gUnknown_081D9144
_08015BA0: .4byte gUnknown_02024C34
_08015BA4: .4byte gUnknown_081D937C
_08015BA8: .4byte gBattleMoves
_08015BAC: .4byte gUnknown_081D938B
_08015BB0: .4byte gUnknown_081D9464
_08015BB4: .4byte gEnigmaBerries
_08015BB8:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r3, r0, 24
_08015BC2:
	ldr r2, _08015C44
	ldr r1, _08015C48
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r7, _08015C4C
	adds r5, r1, 0
	cmp r3, 0x1D
	bne _08015C0A
	mov r0, r8
	ldrh r2, [r0]
	adds r1, r2, 0
	cmp r1, 0
	beq _08015C0A
	ldr r0, _08015C50
	cmp r1, r0
	beq _08015C0A
	cmp r1, r4
	beq _08015C0A
	ldr r0, _08015C54
	strh r2, [r0]
	ldr r2, _08015C58
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r1, _08015C5C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015C60
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015C0A:
	ldr r0, _08015C64
	ldrb r2, [r5]
	lsls r1, r2, 9
	adds r0, 0x2
	adds r1, r0
	movs r0, 0x58
	muls r0, r2
	ldrb r1, [r1]
	adds r0, r1
	adds r1, r7, 0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015C38
	ldr r1, _08015C5C
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08015C68
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015C38:
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015C44: .4byte gUnknown_02024C0B
_08015C48: .4byte gUnknown_02024A60
_08015C4C: .4byte gBattleMons
_08015C50: .4byte 0x0000ffff
_08015C54: .4byte gUnknown_02024BE6
_08015C58: .4byte gUnknown_02024C04
_08015C5C: .4byte gUnknown_02024C1C
_08015C60: .4byte gUnknown_081D9AC2
_08015C64: .4byte gUnknown_02024260
_08015C68: .4byte gUnknown_081D9369
	thumb_func_end sub_8015894

	thumb_func_start sub_8015A98
sub_8015A98: @ 8015C6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r3, r2, 24
	lsls r1, r7, 1
	ldr r0, _08015CAC
	adds r1, r0
	str r1, [sp, 0x4]
	ldr r1, _08015CB0
	movs r0, 0x58
	muls r0, r7
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08015CB8
	ldr r2, _08015CB4
	lsls r1, r7, 3
	subs r0, r1, r7
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	str r0, [sp]
	b _08015CCA
	.align 2, 0
_08015CAC: .4byte 0x020160e8
_08015CB0: .4byte gBattleMons
_08015CB4: .4byte gEnigmaBerries
_08015CB8:
	ldrh r0, [r1, 0x2E]
	str r3, [sp, 0x14]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, r7, 3
	ldr r3, [sp, 0x14]
_08015CCA:
	ldr r0, _08015E44
	strb r7, [r0]
	movs r0, 0
	mov r9, r0
	lsls r2, r7, 1
	str r2, [sp, 0xC]
	ldr r5, _08015E48
	mov r12, r5
	ldr r0, _08015E4C
	movs r2, 0x58
	adds r6, r7, 0
	muls r6, r2
	str r6, [sp, 0x8]
	ldr r2, _08015E50
	adds r5, r6, r2
	movs r6, 0
	str r6, [sp, 0x10]
	mov r10, r0
	subs r0, r1, r7
	lsls r0, 2
	mov r8, r0
	ldr r6, _08015E54
_08015CF6:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08015D0C
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08015D0C
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015D0C:
	ldr r0, [sp, 0x8]
	add r0, r9
	mov r1, r10
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08015D2C
	movs r0, 0x2
	ands r0, r3
	cmp r0, 0
	beq _08015D2C
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015D2C:
	mov r1, r8
	add r1, r12
	ldrh r0, [r5]
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	bne _08015D48
	movs r0, 0x4
	ands r0, r3
	cmp r0, 0
	beq _08015D48
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015D48:
	movs r0, 0x58
	adds r2, r7, 0
	muls r2, r0
	ldr r1, [sp, 0x10]
	adds r0, r1, r2
	ldr r1, _08015E50
	adds r0, r1
	mov r12, r0
	ldr r1, _08015E58
	ldr r0, [sp, 0xC]
	adds r1, r0, r1
	str r1, [sp, 0x18]
	mov r1, r12
	ldrh r1, [r1]
	mov r12, r1
	ldr r0, [sp, 0x18]
	ldrh r0, [r0]
	cmp r12, r0
	bne _08015D8A
	movs r0, 0x8
	ands r0, r3
	cmp r0, 0
	beq _08015D8A
	mov r0, r10
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bge _08015D8A
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015D8A:
	ldr r0, _08015E48
	add r0, r8
	ldrb r0, [r0, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08015DB8
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _08015DB8
	ldr r2, _08015E5C
	ldrh r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08015DB8
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015DB8:
	ldrh r1, [r5]
	adds r0, r7, 0
	str r3, [sp, 0x14]
	bl sub_8015D5C
	lsls r0, 24
	ldr r3, [sp, 0x14]
	cmp r0, 0
	beq _08015DDA
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08015DDA
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015DDA:
	ldr r1, _08015E48
	mov r0, r8
	adds r2, r0, r1
	ldrb r0, [r2, 0xE]
	lsls r0, 28
	mov r12, r1
	cmp r0, 0
	beq _08015DFA
	ldrh r0, [r2, 0x6]
	ldrh r1, [r5]
	cmp r0, r1
	beq _08015DFA
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015DFA:
	ldr r2, [sp]
	cmp r2, 0x1D
	bne _08015E1C
	ldr r0, [sp, 0x4]
	ldrh r1, [r0]
	cmp r1, 0
	beq _08015E1C
	ldr r0, _08015E60
	cmp r1, r0
	beq _08015E1C
	ldrh r2, [r5]
	cmp r1, r2
	beq _08015E1C
	ldr r0, [r6]
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08015E1C:
	adds r6, 0x4
	adds r5, 0x2
	ldr r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x10]
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	cmp r2, 0x3
	bgt _08015E32
	b _08015CF6
_08015E32:
	adds r0, r4, 0
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015E44: .4byte gUnknown_02024C0B
_08015E48: .4byte gUnknown_02024CA8
_08015E4C: .4byte gBattleMons
_08015E50: .4byte gUnknown_02024A8C
_08015E54: .4byte gBitTable
_08015E58: .4byte gUnknown_02024C34
_08015E5C: .4byte gBattleMoves
_08015E60: .4byte 0x0000ffff
	thumb_func_end sub_8015A98

	thumb_func_start sub_8015C90
sub_8015C90: @ 8015E64
	push {r4-r6,lr}
	ldr r5, _08015ED0
	ldrb r0, [r5]
	movs r1, 0
	movs r2, 0xFF
	bl sub_8015A98
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bne _08015F0C
	ldr r0, _08015ED4
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _08015ED8
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08015EDC
	str r1, [r0]
	ldr r0, _08015EE0
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08015EE8
	ldrb r0, [r5]
	bl battle_get_per_side_status
	adds r4, r0, 0
	bl Random
	movs r1, 0x1
	eors r4, r1
	movs r1, 0x2
	ands r1, r0
	orrs r4, r1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl battle_get_side_with_given_state
	ldr r2, _08015EE4
	ldrb r1, [r5]
	lsls r1, 9
	adds r2, 0x3
	adds r1, r2
	b _08015F1C
	.align 2, 0
_08015ED0: .4byte gUnknown_02024A60
_08015ED4: .4byte gUnknown_02024D28
_08015ED8: .4byte gUnknown_02024C1C
_08015EDC: .4byte gUnknown_081D9365
_08015EE0: .4byte gUnknown_020239F8
_08015EE4: .4byte gUnknown_02024260
_08015EE8:
	ldrb r0, [r5]
	bl battle_get_per_side_status
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	ldr r2, _08015F08
	ldrb r1, [r5]
	lsls r1, 9
	adds r2, 0x3
	adds r1, r2
	b _08015F1C
	.align 2, 0
_08015F08: .4byte gUnknown_02024260
_08015F0C:
	ldr r0, _08015F2C
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_08015F1C:
	strb r0, [r1]
	movs r0, 0
	cmp r6, 0xF
	bne _08015F26
	movs r0, 0x1
_08015F26:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08015F2C: .4byte gUnknown_02024D28
	thumb_func_end sub_8015C90

	thumb_func_start sub_8015D5C
sub_8015D5C: @ 8015F30
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	movs r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _08015FC4
	ldrb r0, [r0]
	cmp r6, r0
	bge _08015FB4
	ldr r7, _08015FC8
	mov r8, r7
_08015F5A:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r9, r0
	beq _08015FAA
	ldr r1, _08015FCC
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _08015FAA
	movs r2, 0
	movs r0, 0x58
	adds r1, r4, 0
	muls r1, r0
	adds r0, r1, r7
	ldrh r0, [r0]
	cmp r5, r0
	beq _08015FA0
	mov r4, r8
	adds r0, r1, r4
_08015F92:
	adds r0, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015FAA
	ldrh r1, [r0]
	cmp r5, r1
	bne _08015F92
_08015FA0:
	cmp r2, 0x3
	bgt _08015FAA
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08015FAA:
	adds r4, r3, 0
	ldr r0, _08015FC4
	ldrb r0, [r0]
	cmp r4, r0
	blt _08015F5A
_08015FB4:
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015FC4: .4byte gUnknown_02024A68
_08015FC8: .4byte gUnknown_02024A8C
_08015FCC: .4byte gUnknown_02024C98
	thumb_func_end sub_8015D5C

	thumb_func_start sub_8015DFC
sub_8015DFC: @ 8015FD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	mov r9, r0
	ldr r1, _08016074
	mov r2, r9
	strb r2, [r1]
	ldr r0, _08016078
	ldrb r4, [r0]
	adds r6, r1, 0
	mov r10, r0
	ldr r7, _0801607C
	ldr r3, _08016080
	mov r12, r3
	cmp r9, r4
	bcs _08016024
	ldr r2, _08016084
	ldrb r1, [r2]
	ldr r5, _08016088
	ldr r0, [r5]
	ands r1, r0
	cmp r1, 0
	beq _08016024
	adds r3, r6, 0
_08016006:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _08016024
	ldrb r0, [r2]
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08016006
_08016024:
	movs r0, 0
	strb r0, [r7]
	mov r0, r10
	ldrb r4, [r0]
	cmp r4, 0
	beq _0801605E
	ldr r2, _08016084
	ldrb r1, [r2]
	ldr r5, _08016088
	ldr r0, [r5]
	ands r1, r0
	cmp r1, 0
	beq _0801605E
	adds r3, r7, 0
_08016040:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcs _0801605E
	ldrb r0, [r2]
	ldrb r1, [r7]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08016040
_0801605E:
	ldr r0, _0801608C
	add r0, r12
	ldrb r0, [r0]
	cmp r0, 0xA
	bls _0801606A
	b _080166FE
_0801606A:
	lsls r0, 2
	ldr r1, _08016090
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016074: .4byte gUnknown_02024C07
_08016078: .4byte gUnknown_02024A68
_0801607C: .4byte gUnknown_02024C08
_08016080: .4byte 0x02000000
_08016084: .4byte gUnknown_02024C0C
_08016088: .4byte gBitTable
_0801608C: .4byte 0x0001600e
_08016090: .4byte _08016094
	.align 2, 0
_08016094:
	.4byte _080160C0
	.4byte _08016148
	.4byte _08016208
	.4byte _080162C8
	.4byte _0801639C
	.4byte _08016448
	.4byte _080164F8
	.4byte _0801657C
	.4byte _080165F4
	.4byte _08016668
	.4byte _080166F4
_080160C0:
	movs r5, 0
	ldr r1, _080160E0
	mov r10, r1
	ldrb r2, [r1]
	cmp r5, r2
	bge _080160DA
	ldr r2, _080160E4
_080160CE:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, 0x1
	ldrb r3, [r1]
	cmp r5, r3
	blt _080160CE
_080160DA:
	movs r5, 0
	b _08016128
	.align 2, 0
_080160E0: .4byte gUnknown_02024A68
_080160E4: .4byte gUnknown_02024A7A
_080160E8:
	adds r4, r5, 0x1
	adds r6, r4, 0
	ldrb r1, [r1]
	cmp r6, r1
	bge _08016126
	ldr r7, _080161D8
	ldr r0, _080161DC
	mov r10, r0
	lsls r1, r5, 24
	mov r8, r1
_080160FC:
	adds r0, r5, r7
	ldrb r0, [r0]
	adds r1, r4, r7
	ldrb r1, [r1]
	movs r2, 0
	bl b_first_side
	lsls r0, 24
	cmp r0, 0
	beq _0801611C
	lsls r1, r4, 24
	lsrs r1, 24
	mov r2, r8
	lsrs r0, r2, 24
	bl sub_8012FBC
_0801611C:
	adds r4, 0x1
	ldr r0, _080161DC
	ldrb r0, [r0]
	cmp r4, r0
	blt _080160FC
_08016126:
	adds r5, r6, 0
_08016128:
	mov r1, r10
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _080160E8
	ldr r1, _080161E0
	ldr r3, _080161E4
	adds r2, r1, r3
	ldrb r0, [r2]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r2]
	ldr r2, _080161E8
	adds r0, r1, r2
	strb r3, [r0]
	mov r12, r1
_08016148:
	ldr r1, _080161E8
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bls _08016154
	b _0801640A
_08016154:
	ldr r3, _080161EC
	mov r8, r3
	adds r6, r1, 0
	movs r7, 0
	ldr r5, _080161F0
_0801615E:
	ldr r0, _080161F4
	ldrb r4, [r6]
	strb r4, [r0]
	mov r0, r8
	strb r4, [r0]
	ldr r0, _080161F8
	lsls r2, r4, 1
	adds r3, r2, r0
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080161BC
	ldr r0, _080161FC
	adds r1, r2, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r4, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _080161BC
	ldrh r0, [r3]
	ldr r2, _08016200
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08016204
	bl b_call_bc_move_exec
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	movs r0, 0x73
	strb r0, [r5, 0x2]
	strb r7, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r4
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080161BC:
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	ldr r3, _080161E0
	mov r12, r3
	mov r1, r9
	cmp r1, 0
	beq _080161CE
	b _08016706
_080161CE:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0801615E
	b _0801640A
	.align 2, 0
_080161D8: .4byte gUnknown_02024A7A
_080161DC: .4byte gUnknown_02024A68
_080161E0: .4byte 0x02000000
_080161E4: .4byte 0x0001600e
_080161E8: .4byte 0x000160fc
_080161EC: .4byte gUnknown_02024A60
_080161F0: .4byte gUnknown_030041C0
_080161F4: .4byte gUnknown_02024C07
_080161F8: .4byte gUnknown_02024C7A
_080161FC: .4byte gUnknown_02024C80
_08016200: .4byte 0x0000fffe
_08016204: .4byte gUnknown_081D9030
_08016208:
	ldr r1, _080162A0
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bls _08016214
	b _08016356
_08016214:
	adds r7, r1, 0
	movs r3, 0x2
	mov r10, r3
	movs r0, 0
	mov r8, r0
	ldr r5, _080162A4
_08016220:
	ldr r0, _080162A8
	ldrb r4, [r7]
	strb r4, [r0]
	ldr r1, _080162AC
	strb r4, [r1]
	ldr r0, _080162B0
	lsls r2, r4, 1
	adds r3, r2, r0
	ldrh r1, [r3]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08016284
	ldr r0, _080162B4
	adds r1, r2, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r1, 0x1]
	movs r6, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _08016284
	ldrh r0, [r3]
	ldr r2, _080162B8
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _080162BC
	bl b_call_bc_move_exec
	ldr r0, _080162C0
	strb r4, [r0, 0x5]
	movs r0, 0xFD
	strb r0, [r5]
	mov r3, r10
	strb r3, [r5, 0x1]
	movs r0, 0x71
	strb r0, [r5, 0x2]
	mov r0, r8
	strb r0, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r6
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016284:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	ldr r1, _080162C4
	mov r12, r1
	mov r2, r9
	cmp r2, 0
	beq _08016296
	b _08016706
_08016296:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08016220
	b _08016356
	.align 2, 0
_080162A0: .4byte 0x000160fc
_080162A4: .4byte gUnknown_030041C0
_080162A8: .4byte gUnknown_02024C07
_080162AC: .4byte gUnknown_02024A60
_080162B0: .4byte gUnknown_02024C7A
_080162B4: .4byte gUnknown_02024C80
_080162B8: .4byte 0x0000fffd
_080162BC: .4byte gUnknown_081D9030
_080162C0: .4byte gUnknown_02024D1E
_080162C4: .4byte 0x02000000
_080162C8:
	ldr r1, _08016370
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _08016356
	ldr r0, _08016374
	mov r10, r0
	adds r7, r1, 0
	movs r1, 0
	mov r8, r1
	ldr r5, _08016378
_080162DE:
	ldr r0, _0801637C
	ldrb r4, [r7]
	strb r4, [r0]
	mov r2, r10
	strb r4, [r2]
	ldr r1, _08016380
	lsls r3, r4, 1
	adds r0, r3, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _0801633C
	subs r0, 0x1
	strb r0, [r1, 0x2]
	movs r6, 0xFF
	lsls r0, 24
	cmp r0, 0
	bne _0801633C
	ldr r2, _08016384
	adds r2, r3, r2
	ldrh r0, [r2]
	ldr r3, _08016388
	adds r1, r3, 0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0801638C
	bl b_call_bc_move_exec
	ldr r0, _08016390
	strb r4, [r0, 0x5]
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x1]
	movs r0, 0x36
	strb r0, [r5, 0x2]
	mov r0, r8
	strb r0, [r5, 0x3]
	ldrb r0, [r5, 0x4]
	orrs r0, r6
	strb r0, [r5, 0x4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801633C:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	ldr r1, _08016394
	mov r12, r1
	mov r2, r9
	cmp r2, 0
	beq _0801634E
	b _08016706
_0801634E:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080162DE
_08016356:
	mov r3, r9
	cmp r3, 0
	beq _0801635E
	b _08016706
_0801635E:
	ldr r0, _08016398
	add r0, r12
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08016370
	add r0, r12
	strb r3, [r0]
	b _080166FE
	.align 2, 0
_08016370: .4byte 0x000160fc
_08016374: .4byte gUnknown_02024A60
_08016378: .4byte gUnknown_030041C0
_0801637C: .4byte gUnknown_02024C07
_08016380: .4byte gUnknown_02024C80
_08016384: .4byte gUnknown_02024C7A
_08016388: .4byte 0x0000feff
_0801638C: .4byte gUnknown_081D9030
_08016390: .4byte gUnknown_02024D1E
_08016394: .4byte 0x02000000
_08016398: .4byte 0x0001600e
_0801639C:
	ldr r1, _08016424
	add r1, r12
	ldrb r0, [r1]
	cmp r0, 0x1
	bhi _0801640A
	ldr r7, _08016428
	adds r5, r1, 0
	ldr r6, _0801642C
_080163AC:
	ldrb r4, [r5]
	strb r4, [r6]
	strb r4, [r7]
	ldr r0, _08016430
	lsls r2, r4, 1
	adds r3, r2, r0
	ldrh r1, [r3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080163F0
	ldr r0, _08016434
	adds r1, r2, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x7]
	subs r0, 0x1
	strb r0, [r1, 0x7]
	lsls r0, 24
	cmp r0, 0
	bne _080163F0
	ldrh r0, [r3]
	ldr r2, _08016438
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0801643C
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080163F0:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldr r3, _08016440
	mov r12, r3
	mov r1, r9
	cmp r1, 0
	beq _08016402
	b _08016706
_08016402:
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080163AC
_0801640A:
	mov r2, r9
	cmp r2, 0
	beq _08016412
	b _08016706
_08016412:
	ldr r0, _08016444
	add r0, r12
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08016424
	add r0, r12
	strb r2, [r0]
	b _080166FE
	.align 2, 0
_08016424: .4byte 0x000160fc
_08016428: .4byte gUnknown_02024A60
_0801642C: .4byte gUnknown_02024C07
_08016430: .4byte gUnknown_02024C7A
_08016434: .4byte gUnknown_02024C80
_08016438: .4byte 0x0000ffdf
_0801643C: .4byte gUnknown_081D9041
_08016440: .4byte 0x02000000
_08016444: .4byte 0x0001600e
_08016448:
	ldr r2, _080164D0
	add r2, r12
	ldr r1, _080164D4
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080164BC
	ldr r5, _080164D8
	adds r4, r2, 0
	ldr r6, _080164DC
_0801645C:
	ldr r1, _080164E0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r0, [r5]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801649E
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0801649E
	ldr r1, _080164E4
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801649E
	ldr r0, _080164E8
	strb r2, [r0]
	ldr r0, _080164EC
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801649E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r3, _080164F0
	mov r12, r3
	mov r1, r9
	cmp r1, 0
	beq _080164B0
	b _08016706
_080164B0:
	ldr r1, _080164D4
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801645C
_080164BC:
	mov r2, r9
	cmp r2, 0
	beq _080164C4
	b _08016706
_080164C4:
	ldr r1, _080164F4
	add r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080166FE
	.align 2, 0
_080164D0: .4byte 0x000160fc
_080164D4: .4byte gUnknown_02024A68
_080164D8: .4byte gUnknown_02024A60
_080164DC: .4byte gUnknown_02024DDC
_080164E0: .4byte gUnknown_02024A7A
_080164E4: .4byte gBattleMons
_080164E8: .4byte gUnknown_02024C08
_080164EC: .4byte gUnknown_081D939A
_080164F0: .4byte 0x02000000
_080164F4: .4byte 0x0001600e
_080164F8:
	ldr r3, _08016530
	ldrh r2, [r3]
	movs r0, 0x7
	ands r0, r2
	cmp r0, 0
	bne _08016506
	b _080166CC
_08016506:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	bne _08016552
	ldr r1, _08016534
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08016544
	ldr r0, _08016538
	ands r0, r2
	ldr r1, _0801653C
	ands r0, r1
	strh r0, [r3]
	ldr r1, _08016540
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08016570
	.align 2, 0
_08016530: .4byte word_2024DB8
_08016534: .4byte gUnknown_02024DBC
_08016538: .4byte 0x0000fffe
_0801653C: .4byte 0x0000fffd
_08016540: .4byte gUnknown_02024D1E
_08016544:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _0801655E
	b _0801656C
_08016552:
	movs r0, 0x2
	ands r0, r2
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0801656C
_0801655E:
	ldr r1, _08016568
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08016570
	.align 2, 0
_08016568: .4byte gUnknown_02024D1E
_0801656C:
	ldr r0, _08016574
	strb r1, [r0, 0x5]
_08016570:
	ldr r0, _08016578
	b _080166BE
	.align 2, 0
_08016574: .4byte gUnknown_02024D1E
_08016578: .4byte gUnknown_081D8F62
_0801657C:
	ldr r3, _080165B0
	ldrh r2, [r3]
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _0801658A
	b _080166CC
_0801658A:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _080165C4
	ldr r1, _080165B4
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080165C4
	ldr r0, _080165B8
	ands r0, r2
	strh r0, [r3]
	ldr r1, _080165BC
	ldr r0, _080165C0
	b _080165C8
	.align 2, 0
_080165B0: .4byte word_2024DB8
_080165B4: .4byte gUnknown_02024DBC
_080165B8: .4byte 0x0000fff7
_080165BC: .4byte gUnknown_02024C10
_080165C0: .4byte gUnknown_081D8FFF
_080165C4:
	ldr r1, _080165E0
	ldr r0, _080165E4
_080165C8:
	str r0, [r1]
	adds r3, r1, 0
	ldr r1, _080165E8
	ldr r0, _080165EC
	adds r1, r0
	movs r2, 0
	movs r0, 0xC
	strb r0, [r1]
	ldr r0, _080165F0
	strb r2, [r0, 0x5]
	b _080166BC
	.align 2, 0
_080165E0: .4byte gUnknown_02024C10
_080165E4: .4byte gUnknown_081D8F7D
_080165E8: .4byte 0x02000000
_080165EC: .4byte 0x000160a4
_080165F0: .4byte gUnknown_02024D1E
_080165F4:
	ldr r3, _08016624
	ldrh r2, [r3]
	movs r0, 0x60
	ands r0, r2
	cmp r0, 0
	beq _08016650
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _08016638
	ldr r1, _08016628
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08016638
	ldr r0, _0801662C
	ands r0, r2
	strh r0, [r3]
	ldr r1, _08016630
	ldr r0, _08016634
	b _0801663C
	.align 2, 0
_08016624: .4byte word_2024DB8
_08016628: .4byte gUnknown_02024DBC
_0801662C: .4byte 0x0000ffdf
_08016630: .4byte gUnknown_02024C10
_08016634: .4byte gUnknown_081D9016
_08016638:
	ldr r1, _08016658
	ldr r0, _0801665C
_0801663C:
	str r0, [r1]
	adds r3, r1, 0
	ldr r0, [r3]
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016650:
	ldr r2, _08016660
	ldr r0, _08016664
	adds r1, r2, r0
	b _080166D2
	.align 2, 0
_08016658: .4byte gUnknown_02024C10
_0801665C: .4byte gUnknown_081D9008
_08016660: .4byte 0x02000000
_08016664: .4byte 0x0001600e
_08016668:
	ldr r3, _08016690
	ldrh r2, [r3]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080166CC
	ldr r1, _08016694
	adds r1, 0x28
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _080166A4
	ldr r0, _08016698
	ands r0, r2
	strh r0, [r3]
	ldr r1, _0801669C
	ldr r0, _080166A0
	b _080166A8
	.align 2, 0
_08016690: .4byte word_2024DB8
_08016694: .4byte gUnknown_02024DBC
_08016698: .4byte 0x0000ff7f
_0801669C: .4byte gUnknown_02024C10
_080166A0: .4byte gUnknown_081D8FFF
_080166A4:
	ldr r1, _080166DC
	ldr r0, _080166E0
_080166A8:
	str r0, [r1]
	adds r3, r1, 0
	ldr r0, _080166E4
	ldr r1, _080166E8
	adds r0, r1
	movs r1, 0xD
	strb r1, [r0]
	ldr r1, _080166EC
	movs r0, 0x1
	strb r0, [r1, 0x5]
_080166BC:
	ldr r0, [r3]
_080166BE:
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080166CC:
	ldr r2, _080166E4
	ldr r3, _080166F0
	adds r1, r2, r3
_080166D2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	b _080166FE
	.align 2, 0
_080166DC: .4byte gUnknown_02024C10
_080166E0: .4byte gUnknown_081D8F7D
_080166E4: .4byte 0x02000000
_080166E8: .4byte 0x000160a4
_080166EC: .4byte gUnknown_02024D1E
_080166F0: .4byte 0x0001600e
_080166F4:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080166FE:
	mov r0, r9
	cmp r0, 0
	bne _08016706
	b _0801605E
_08016706:
	ldr r0, _08016724
	ldr r1, [r0]
	ldr r0, _08016728
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08016724: .4byte gUnknown_030042D4
_08016728: .4byte sub_8011E8C
	thumb_func_end sub_8015DFC

	thumb_func_start sub_8016558
sub_8016558: @ 801672C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	ldr r2, _0801674C
	ldr r0, [r2]
	ldr r1, _08016750
	orrs r0, r1
	str r0, [r2]
	bl _0801725C
	.align 2, 0
_0801674C: .4byte gUnknown_02024C6C
_08016750: .4byte 0x01000020
_08016754:
	ldr r3, _08016788
	ldr r4, _0801678C
	ldr r1, _08016790
	adds r5, r7, r2
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	strb r0, [r3]
	ldr r0, _08016794
	ldrb r1, [r0]
	ldr r2, _08016798
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	adds r6, r3, 0
	cmp r1, 0
	beq _0801679C
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	bl _0801725C
	.align 2, 0
_08016788: .4byte gUnknown_02024A60
_0801678C: .4byte gUnknown_02024C07
_08016790: .4byte gUnknown_02024A7A
_08016794: .4byte gUnknown_02024C0C
_08016798: .4byte gBitTable
_0801679C:
	movs r5, 0xB0
	lsls r5, 9
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, 0x13
	bls _080167AC
	bl _0801724C
_080167AC:
	lsls r0, 2
	ldr r1, _080167B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080167B8: .4byte _080167BC
	.align 2, 0
_080167BC:
	.4byte _0801680C
	.4byte _0801687C
	.4byte _080168AC
	.4byte _08016904
	.4byte _0801699C
	.4byte _080169FC
	.4byte _08016A94
	.4byte _08016AF0
	.4byte _08016B50
	.4byte _08016BB0
	.4byte _08016D4C
	.4byte _08016E74
	.4byte _08016F2C
	.4byte _08017004
	.4byte _080170D0
	.4byte _080170F4
	.4byte _08017140
	.4byte _08017170
	.4byte _080168D8
	.4byte _08017238
_0801680C:
	ldr r1, _08016868
	ldrb r3, [r6]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _0801685A
	ldr r0, _0801686C
	movs r1, 0x58
	muls r1, r3
	adds r0, r1, r0
	ldrh r2, [r0, 0x28]
	ldrh r7, [r0, 0x2C]
	cmp r2, r7
	beq _0801685A
	cmp r2, 0
	beq _0801685A
	ldr r1, _08016870
	ldrh r0, [r0, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08016844
	movs r0, 0x1
	str r0, [r1]
_08016844:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldr r0, _08016874
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801685A:
	ldr r1, _08016878
	movs r0, 0xB0
	lsls r0, 9
	adds r1, r0
	bl _08017246
	.align 2, 0
_08016868: .4byte gUnknown_02024C98
_0801686C: .4byte gBattleMons
_08016870: .4byte gUnknown_02024BEC
_08016874: .4byte gUnknown_081D93D1
_08016878: .4byte 0x02000000
_0801687C:
	ldrb r1, [r6]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0801689C
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801689C:
	ldr r1, _080168A8
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r2
	bl _08017246
	.align 2, 0
_080168A8: .4byte 0x02000000
_080168AC:
	ldrb r1, [r6]
	movs r0, 0x1
	movs r2, 0
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	beq _080168C6
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080168C6:
	ldr r1, _080168D4
	movs r3, 0xB0
	lsls r3, 9
	adds r1, r3
	bl _08017246
	.align 2, 0
_080168D4: .4byte 0x02000000
_080168D8:
	ldrb r1, [r6]
	movs r0, 0x1
	movs r2, 0x1
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	beq _080168F2
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080168F2:
	ldr r1, _08016900
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	bl _08017246
	.align 2, 0
_08016900: .4byte 0x02000000
_08016904:
	ldr r0, _0801697C
	ldrb r2, [r6]
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08016970
	ldr r3, _08016980
	movs r5, 0x3
	ands r5, r1
	movs r1, 0x58
	adds r0, r5, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08016970
	adds r0, r2, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08016970
	ldr r0, _08016984
	strb r5, [r0]
	ldr r2, _08016988
	ldrb r0, [r6]
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _08016950
	movs r0, 0x1
	str r0, [r2]
_08016950:
	ldr r1, _0801698C
	ldr r7, _08016990
	adds r0, r1, r7
	strb r5, [r0]
	ldrb r0, [r4]
	ldr r2, _08016994
	adds r1, r2
	strb r0, [r1]
	ldr r0, _08016998
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016970:
	ldr r1, _0801698C
	movs r3, 0xB0
	lsls r3, 9
	adds r1, r3
	bl _08017246
	.align 2, 0
_0801697C: .4byte gUnknown_02024C98
_08016980: .4byte gBattleMons
_08016984: .4byte gUnknown_02024C08
_08016988: .4byte gUnknown_02024BEC
_0801698C: .4byte 0x02000000
_08016990: .4byte 0x000160a4
_08016994: .4byte 0x000160a5
_08016998: .4byte gUnknown_081D904B
_0801699C:
	ldr r2, _080169EC
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080169DE
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _080169DE
	ldr r2, _080169F0
	ldrh r0, [r1, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _080169CE
	movs r0, 0x1
	str r0, [r2]
_080169CE:
	ldr r0, _080169F4
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080169DE:
	ldr r1, _080169F8
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	bl _08017246
	.align 2, 0
_080169EC: .4byte gBattleMons
_080169F0: .4byte gUnknown_02024BEC
_080169F4: .4byte gUnknown_081D9518
_080169F8: .4byte 0x02000000
_080169FC:
	ldr r4, _08016A84
	ldrb r0, [r6]
	movs r7, 0x58
	mov r8, r7
	mov r2, r8
	muls r2, r0
	adds r3, r4, 0
	adds r3, 0x4C
	adds r0, r2, r3
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08016A76
	adds r1, r2, r4
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08016A76
	ldr r5, _08016A88
	ldrh r0, [r1, 0x2C]
	lsrs r0, 4
	str r0, [r5]
	cmp r0, 0
	bne _08016A30
	movs r0, 0x1
	str r0, [r5]
_08016A30:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r2, r0, r3
	ldr r1, [r2]
	movs r4, 0xF0
	lsls r4, 4
	adds r0, r1, 0
	ands r0, r4
	cmp r0, r4
	beq _08016A50
	movs r7, 0x80
	lsls r7, 1
	adds r0, r1, r7
	str r0, [r2]
_08016A50:
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r3
	ldr r0, [r0]
	ands r0, r4
	lsrs r0, 8
	ldr r1, [r5]
	muls r0, r1
	str r0, [r5]
	ldr r0, _08016A8C
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016A76:
	ldr r1, _08016A90
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r2
	bl _08017246
	.align 2, 0
_08016A84: .4byte gBattleMons
_08016A88: .4byte gUnknown_02024BEC
_08016A8C: .4byte gUnknown_081D9518
_08016A90: .4byte 0x02000000
_08016A94:
	ldr r2, _08016AE0
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08016AD6
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08016AD6
	ldr r2, _08016AE4
	ldrh r0, [r1, 0x2C]
	lsrs r0, 3
	str r0, [r2]
	cmp r0, 0
	bne _08016AC6
	movs r0, 0x1
	str r0, [r2]
_08016AC6:
	ldr r0, _08016AE8
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016AD6:
	ldr r1, _08016AEC
	movs r3, 0xB0
	lsls r3, 9
	adds r1, r3
	b _08017246
	.align 2, 0
_08016AE0: .4byte gBattleMons
_08016AE4: .4byte gUnknown_02024BEC
_08016AE8: .4byte gUnknown_081D953A
_08016AEC: .4byte 0x02000000
_08016AF0:
	ldr r2, _08016B40
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 20
	ands r0, r1
	cmp r0, 0
	beq _08016B34
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08016B34
	ldr r2, _08016B44
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _08016B24
	movs r0, 0x1
	str r0, [r2]
_08016B24:
	ldr r0, _08016B48
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016B34:
	ldr r1, _08016B4C
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	b _08017246
	.align 2, 0
_08016B40: .4byte gBattleMons
_08016B44: .4byte gUnknown_02024BEC
_08016B48: .4byte gUnknown_081D9613
_08016B4C: .4byte 0x02000000
_08016B50:
	ldr r2, _08016BA0
	ldrb r1, [r6]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 21
	ands r0, r1
	cmp r0, 0
	beq _08016B94
	adds r1, r3, r2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08016B94
	ldr r2, _08016BA4
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _08016B84
	movs r0, 0x1
	str r0, [r2]
_08016B84:
	ldr r0, _08016BA8
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016B94:
	ldr r1, _08016BAC
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017246
	.align 2, 0
_08016BA0: .4byte gBattleMons
_08016BA4: .4byte gUnknown_02024BEC
_08016BA8: .4byte gUnknown_081D9624
_08016BAC: .4byte 0x02000000
_08016BB0:
	ldr r0, _08016C60
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x58
	mov r10, r1
	mov r1, r10
	muls r1, r0
	mov r5, r8
	adds r5, 0x50
	adds r3, r1, r5
	ldr r2, [r3]
	movs r4, 0xE0
	lsls r4, 8
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _08016CCA
	mov r7, r8
	adds r0, r1, r7
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08016CCA
	ldr r1, _08016C64
	adds r0, r2, r1
	str r0, [r3]
	ldrb r1, [r6]
	mov r0, r10
	muls r0, r1
	adds r0, r5
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08016C88
	ldr r2, _08016C68
	lsls r0, r1, 1
	ldr r4, _08016C6C
	adds r0, r4
	adds r0, r2
	ldrb r1, [r0]
	ldr r3, _08016C70
	adds r0, r2, r3
	strb r1, [r0]
	ldrb r0, [r6]
	lsls r0, 1
	subs r3, 0x9F
	adds r0, r3
	adds r0, r2
	ldrb r1, [r0]
	ldr r5, _08016C74
	adds r0, r2, r5
	strb r1, [r0]
	ldr r1, _08016C78
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r4
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08016C7C
	ldr r0, _08016C80
	str r0, [r1]
	ldr r2, _08016C84
	ldrb r0, [r6]
	mov r7, r10
	muls r7, r0
	adds r0, r7, 0
	add r0, r8
	ldrh r0, [r0, 0x2C]
	lsrs r0, 4
	str r0, [r2]
	cmp r0, 0
	bne _08016CBA
	movs r0, 0x1
	str r0, [r2]
	b _08016CBA
	.align 2, 0
_08016C60: .4byte gBattleMons
_08016C64: .4byte 0xffffe000
_08016C68: .4byte 0x02000000
_08016C6C: .4byte 0x00016004
_08016C70: .4byte 0x000160a4
_08016C74: .4byte 0x000160a5
_08016C78: .4byte gUnknown_030041C0
_08016C7C: .4byte gUnknown_02024C10
_08016C80: .4byte gUnknown_081D95E2
_08016C84: .4byte gUnknown_02024BEC
_08016C88:
	ldr r1, _08016CD4
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r2, _08016CD8
	ldrb r0, [r6]
	lsls r0, 1
	ldr r3, _08016CDC
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	lsls r0, 1
	ldr r5, _08016CE0
	adds r0, r5
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08016CE4
	ldr r0, _08016CE8
	str r0, [r1]
_08016CBA:
	ldr r0, [r1]
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016CCA:
	ldr r1, _08016CD8
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017246
	.align 2, 0
_08016CD4: .4byte gUnknown_030041C0
_08016CD8: .4byte 0x02000000
_08016CDC: .4byte 0x00016004
_08016CE0: .4byte 0x00016005
_08016CE4: .4byte gUnknown_02024C10
_08016CE8: .4byte gUnknown_081D95F4
_08016CEC:
	movs r0, 0x8
	negs r0, r0
	ands r4, r0
	str r4, [r2]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	mov r0, r10
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08016D3C
	ands r0, r1
	str r0, [r2]
	ldr r1, _08016D40
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r0, _08016D44
	bl b_call_bc_move_exec
	ldr r4, _08016D48
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08016DB4
	.align 2, 0
_08016D3C: .4byte 0xf7ffffff
_08016D40: .4byte gUnknown_02024D1E
_08016D44: .4byte gUnknown_081D950F
_08016D48: .4byte gUnknown_02024A60
_08016D4C:
	ldr r2, _08016DC8
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x70
	ands r1, r0
	adds r7, r2, 0
	cmp r1, 0
	beq _08016E56
	movs r0, 0
	strb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	cmp r1, 0
	beq _08016DB4
	mov r10, r7
	adds r6, r4, 0
	movs r3, 0x58
	mov r8, r3
	movs r5, 0x4C
	adds r5, r7
	mov r9, r5
	str r1, [sp, 0x4]
	movs r0, 0x7
	mov r12, r0
_08016D86:
	ldrb r1, [r6]
	mov r3, r8
	muls r3, r1
	mov r5, r9
	adds r2, r3, r5
	ldr r4, [r2]
	adds r0, r4, 0
	mov r5, r12
	ands r0, r5
	cmp r0, 0
	beq _08016DA6
	adds r0, r3, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	bne _08016CEC
_08016DA6:
	adds r0, r1, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp, 0x4]
	cmp r0, r1
	bcc _08016D86
_08016DB4:
	ldr r2, _08016DCC
	ldr r1, _08016DD0
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08016DD4
	movs r2, 0x2
	mov r9, r2
	b _08017252
	.align 2, 0
_08016DC8: .4byte gBattleMons
_08016DCC: .4byte gUnknown_02024C07
_08016DD0: .4byte gUnknown_02024A68
_08016DD4:
	ldr r5, _08016E0C
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r2, _08016E10
	ldrb r0, [r5]
	movs r7, 0x58
	adds r1, r0, 0
	muls r1, r7
	adds r6, r2, 0
	adds r6, 0x50
	adds r1, r6
	ldr r0, [r1]
	subs r0, 0x10
	str r0, [r1]
	ldrb r0, [r5]
	bl sub_8015660
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08016E18
	ldrb r0, [r5]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08016E14
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08016E4C
	.align 2, 0
_08016E0C: .4byte gUnknown_02024A60
_08016E10: .4byte gBattleMons
_08016E14: .4byte gUnknown_02024D1E
_08016E18:
	ldrb r3, [r5]
	adds r0, r3, 0
	muls r0, r7
	adds r2, r0, r6
	ldr r0, [r2]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	beq _08016E40
	ldr r0, _08016E3C
	strb r4, [r0, 0x5]
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	b _08016E4C
	.align 2, 0
_08016E3C: .4byte gUnknown_02024D1E
_08016E40:
	ldr r1, _08016E68
	movs r0, 0x1
	strb r0, [r1, 0x5]
	adds r0, r3, 0
	bl b_cancel_multi_turn_move_maybe
_08016E4C:
	ldr r0, _08016E6C
	bl b_call_bc_move_exec
	movs r3, 0x1
	mov r9, r3
_08016E56:
	mov r5, r9
	cmp r5, 0x2
	bne _08016E5E
	b _0801724C
_08016E5E:
	ldr r1, _08016E70
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017246
	.align 2, 0
_08016E68: .4byte gUnknown_02024D1E
_08016E6C: .4byte gUnknown_081D957E
_08016E70: .4byte 0x02000000
_08016E74:
	ldr r1, _08016EAC
	ldrb r0, [r6]
	movs r7, 0x58
	muls r0, r7
	adds r5, r1, 0
	adds r5, 0x50
	adds r2, r0, r5
	ldr r1, [r2]
	movs r4, 0xC0
	lsls r4, 4
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	beq _08016F10
	ldr r3, _08016EB0
	adds r0, r1, r3
	str r0, [r2]
	ldrb r0, [r6]
	bl sub_8015660
	lsls r0, 24
	cmp r0, 0
	beq _08016EB4
	ldrb r0, [r6]
	bl b_cancel_multi_turn_move_maybe
	b _08016F10
	.align 2, 0
_08016EAC: .4byte gBattleMons
_08016EB0: .4byte 0xfffffc00
_08016EB4:
	ldrb r0, [r6]
	muls r0, r7
	adds r2, r0, r5
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	bne _08016F10
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _08016F10
	ldr r0, _08016F1C
	ands r1, r0
	str r1, [r2]
	ldrb r0, [r6]
	muls r0, r7
	adds r0, r5
	ldr r0, [r0]
	movs r4, 0x7
	ands r0, r4
	cmp r0, 0
	bne _08016F10
	ldr r1, _08016F20
	movs r0, 0x47
	strb r0, [r1, 0x3]
	movs r0, 0x1
	movs r1, 0
	bl sub_801E3EC
	ldrb r0, [r6]
	muls r0, r7
	adds r0, r5
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08016F06
	ldr r0, _08016F24
	bl b_call_bc_move_exec
_08016F06:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016F10:
	ldr r1, _08016F28
	movs r5, 0xB0
	lsls r5, 9
	adds r1, r5
	b _08017246
	.align 2, 0
_08016F1C: .4byte 0xffffefff
_08016F20: .4byte gUnknown_02024D1E
_08016F24: .4byte gUnknown_081D9587
_08016F28: .4byte 0x02000000
_08016F2C:
	ldr r0, _08016FA8
	ldrb r3, [r6]
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r5, r1, r0
	ldrb r1, [r5, 0xB]
	lsls r1, 28
	adds r7, r0, 0
	cmp r1, 0
	beq _08016FF2
	movs r4, 0
	ldr r2, _08016FAC
	movs r0, 0x58
	adds r1, r3, 0
	muls r1, r0
	adds r2, 0xC
	adds r1, r2
	ldrh r0, [r5, 0x4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08016F80
	mov r12, r7
	mov r8, r2
	adds r5, r6, 0
	movs r3, 0x58
_08016F60:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08016F80
	ldrb r2, [r5]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r12
	lsls r0, r4, 1
	muls r2, r3
	adds r0, r2
	add r0, r8
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08016F60
_08016F80:
	cmp r4, 0x4
	bne _08016FB0
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0
	strh r1, [r0, 0x4]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	b _08016FF2
	.align 2, 0
_08016FA8: .4byte gUnknown_02024CA8
_08016FAC: .4byte gBattleMons
_08016FB0:
	ldrb r0, [r6]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r2, r7
	ldrb r3, [r2, 0xB]
	lsls r1, r3, 28
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0xB]
	adds r2, r1, 0
	cmp r2, 0
	bne _08016FF2
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x4]
	ldr r0, _08016FFC
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08016FF2:
	ldr r1, _08017000
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017246
	.align 2, 0
_08016FFC: .4byte gUnknown_081D9148
_08017000: .4byte 0x02000000
_08017004:
	ldr r3, _08017050
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r2, r0, r3
	ldrb r5, [r2, 0xE]
	lsls r4, r5, 28
	cmp r4, 0
	beq _080170BC
	ldr r0, _08017054
	mov r8, r0
	ldrb r0, [r2, 0xC]
	lsls r0, 1
	movs r7, 0x58
	muls r1, r7
	adds r0, r1
	mov r1, r8
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	beq _08017058
	movs r0, 0
	strh r0, [r2, 0x6]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	b _080170BC
	.align 2, 0
_08017050: .4byte gUnknown_02024CA8
_08017054: .4byte gBattleMons
_08017058:
	lsrs r1, r4, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r4, 0x10
	negs r4, r4
	adds r0, r4, 0
	ands r0, r5
	orrs r0, r1
	strb r0, [r2, 0xE]
	cmp r1, 0
	beq _0801708C
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	muls r1, r7
	ldrb r0, [r0, 0xC]
	adds r1, r0
	mov r0, r8
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080170BC
_0801708C:
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x6]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0xE]
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldr r0, _080170C8
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_080170BC:
	ldr r1, _080170CC
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r2
	b _08017246
	.align 2, 0
_080170C8: .4byte gUnknown_081D914F
_080170CC: .4byte 0x02000000
_080170D0:
	ldr r0, _080170F0
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	beq _080170E8
	adds r0, r2, 0
	subs r0, 0x8
	str r0, [r1]
_080170E8:
	movs r1, 0xB0
	lsls r1, 9
	b _08017244
	.align 2, 0
_080170F0: .4byte gUnknown_02024C98
_080170F4:
	ldr r2, _08017134
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r2
	ldrb r2, [r3, 0x12]
	lsls r1, r2, 28
	cmp r1, 0
	beq _0801712E
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x12]
	cmp r1, 0
	bne _0801712E
	ldr r0, _08017138
	ldrb r2, [r6]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _0801713C
	ands r0, r1
	str r0, [r2]
_0801712E:
	movs r1, 0xB0
	lsls r1, 9
	b _08017244
	.align 2, 0
_08017134: .4byte gUnknown_02024CA8
_08017138: .4byte gUnknown_02024C98
_0801713C: .4byte 0xfffffdff
_08017140:
	ldr r2, _0801716C
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r3, r0, r2
	ldrb r2, [r3, 0x13]
	lsls r1, r2, 28
	cmp r1, 0
	beq _08017166
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x13]
_08017166:
	movs r1, 0xB0
	lsls r1, 9
	b _08017244
	.align 2, 0
_0801716C: .4byte gUnknown_02024CA8
_08017170:
	ldr r4, _08017220
	ldrb r0, [r6]
	lsls r0, 2
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, 0xC0
	lsls r3, 5
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _08017216
	ldr r5, _08017224
	adds r0, r1, r5
	str r0, [r2]
	ldrb r2, [r6]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, 0
	bne _08017216
	ldr r3, _08017228
	movs r5, 0x58
	adds r1, r2, 0
	muls r1, r5
	adds r4, r3, 0
	adds r4, 0x4C
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08017216
	adds r0, r1, r3
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	beq _08017216
	cmp r0, 0xF
	beq _08017216
	adds r0, r2, 0
	bl sub_8025A44
	lsls r0, 24
	cmp r0, 0
	bne _08017216
	ldrb r0, [r6]
	bl b_cancel_multi_turn_move_maybe
	bl Random
	ldrb r1, [r6]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r6]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _0801722C
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r0, _08017230
	bl b_call_bc_move_exec
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08017216:
	ldr r1, _08017234
	movs r7, 0xB0
	lsls r7, 9
	adds r1, r7
	b _08017246
	.align 2, 0
_08017220: .4byte gUnknown_02024C98
_08017224: .4byte 0xfffff800
_08017228: .4byte gBattleMons
_0801722C: .4byte gUnknown_02024C0A
_08017230: .4byte gUnknown_081D964C
_08017234: .4byte 0x02000000
_08017238:
	movs r1, 0xB0
	lsls r1, 9
	add r1, r10
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08017258
_08017244:
	add r1, r10
_08017246:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0801724C:
	mov r0, r9
	cmp r0, 0
	beq _0801725C
_08017252:
	mov r0, r9
	b _0801728C
	.align 2, 0
_08017258: .4byte 0x00016001
_0801725C:
	ldr r7, _0801729C
	ldr r2, _080172A0
	adds r0, r7, r2
	ldr r1, _080172A4
	ldrb r0, [r0]
	mov r10, r7
	mov r8, r1
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08017280
	movs r3, 0xB0
	lsls r3, 9
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, 0x13
	bhi _08017280
	bl _08016754
_08017280:
	ldr r0, _080172A8
	ldr r1, [r0]
	ldr r2, _080172AC
	ands r1, r2
	str r1, [r0]
	movs r0, 0
_0801728C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801729C: .4byte 0x02000000
_080172A0: .4byte 0x00016001
_080172A4: .4byte gUnknown_02024A68
_080172A8: .4byte gUnknown_02024C6C
_080172AC: .4byte 0xfeffffdf
	thumb_func_end sub_8016558

	thumb_func_start sub_80170DC
sub_80170DC: @ 80172B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _080172DC
	ldr r0, [r2]
	ldr r1, _080172E0
	orrs r0, r1
	str r0, [r2]
	ldr r1, _080172E4
	ldr r3, _080172E8
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0
	beq _080172EC
	cmp r0, 0x1
	bne _080172D8
	b _0801742C
_080172D8:
	b _08017554
	.align 2, 0
_080172DC: .4byte gUnknown_02024C6C
_080172E0: .4byte 0x01000020
_080172E4: .4byte 0x02000000
_080172E8: .4byte 0x00016110
_080172EC:
	ldr r2, _08017330
	add r2, r8
	ldr r0, _08017334
	ldrb r1, [r2]
	mov r9, r0
	ldrb r0, [r0]
	cmp r1, r0
	bcc _080172FE
	b _0801741C
_080172FE:
	ldr r4, _08017338
	adds r5, r2, 0
	ldr r1, _0801733C
	mov r12, r1
	movs r2, 0x8
	add r2, r12
	mov r10, r2
	mov r7, r12
	adds r7, 0x18
	ldr r6, _08017340
_08017312:
	ldrb r3, [r5]
	strb r3, [r4]
	ldr r0, _08017344
	ldrb r1, [r0]
	ldr r2, _08017348
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801734C
	adds r0, r3, 0x1
	strb r0, [r5]
	b _08017410
	.align 2, 0
_08017330: .4byte 0x00016111
_08017334: .4byte gUnknown_02024A68
_08017338: .4byte gUnknown_02024A60
_0801733C: .4byte gUnknown_02024DBC
_08017340: .4byte gUnknown_030041C0
_08017344: .4byte gUnknown_02024C0C
_08017348: .4byte gBitTable
_0801734C:
	adds r0, r3, 0x1
	strb r0, [r5]
	ldr r1, _08017388
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08017410
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08017410
	ldr r1, _0801738C
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08017410
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, 0xF8
	bne _08017394
	ldr r0, _08017390
	strb r3, [r0, 0x5]
	b _0801739A
	.align 2, 0
_08017388: .4byte gUnknown_02024DBC
_0801738C: .4byte gBattleMons
_08017390: .4byte gUnknown_02024D1E
_08017394:
	ldr r1, _080173F4
	movs r0, 0x1
	strb r0, [r1, 0x5]
_0801739A:
	movs r0, 0xFD
	strb r0, [r6]
	movs r0, 0x2
	strb r0, [r6, 0x1]
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strb r0, [r6, 0x2]
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r6, 0x3]
	movs r0, 0xFF
	strb r0, [r6, 0x4]
	ldr r3, _080173F8
	ldrb r0, [r4]
	strb r0, [r3]
	ldr r1, _080173FC
	mov r0, r12
	adds r0, 0x4
	ldrb r2, [r4]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08017400
	ldrb r0, [r4]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08017404
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, _08017408
	str r1, [r0]
	ldr r0, _0801740C
	b _08017538
	.align 2, 0
_080173F4: .4byte gUnknown_02024D1E
_080173F8: .4byte gUnknown_02024C08
_080173FC: .4byte gUnknown_02024C07
_08017400: .4byte gUnknown_02024BEC
_08017404: .4byte gUnknown_02024D68
_08017408: .4byte 0x0000ffff
_0801740C: .4byte gUnknown_081D92D7
_08017410:
	ldrb r0, [r5]
	mov r3, r9
	ldrb r3, [r3]
	cmp r0, r3
	bcs _0801741C
	b _08017312
_0801741C:
	ldr r1, _08017470
	add r1, r8
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08017474
	add r0, r8
	strb r2, [r0]
_0801742C:
	ldr r2, _08017474
	add r2, r8
	ldr r0, _08017478
	ldrb r1, [r2]
	mov r9, r0
	ldrb r0, [r0]
	cmp r1, r0
	bcc _0801743E
	b _08017554
_0801743E:
	ldr r5, _0801747C
	adds r3, r2, 0
	ldr r4, _08017480
	ldr r7, _08017484
_08017446:
	ldr r2, _08017488
	ldr r1, _0801748C
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r5]
	ldr r0, _08017490
	ldrb r1, [r0]
	ldr r2, _08017494
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08017498
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _08017548
	.align 2, 0
_08017470: .4byte 0x00016110
_08017474: .4byte 0x00016111
_08017478: .4byte gUnknown_02024A68
_0801747C: .4byte gUnknown_02024A60
_08017480: .4byte gUnknown_030041C0
_08017484: .4byte gUnknown_02024CA8
_08017488: .4byte gUnknown_02024C07
_0801748C: .4byte gUnknown_02024A7A
_08017490: .4byte gUnknown_02024C0C
_08017494: .4byte gBitTable
_08017498:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldr r6, _08017508
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08017548
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0xF]
	lsls r0, 28
	lsrs r0, 28
	strb r0, [r4, 0x4]
	movs r0, 0xFF
	strb r0, [r4, 0x5]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r4, r0, r7
	ldrb r3, [r4, 0xF]
	lsls r1, r3, 28
	cmp r1, 0
	bne _0801751C
	lsls r2, 2
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldr r3, _0801750C
	ldr r2, _08017510
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	str r0, [r3]
	ldr r1, _08017514
	ldr r0, _08017518
	b _08017534
	.align 2, 0
_08017508: .4byte gUnknown_02024C98
_0801750C: .4byte gUnknown_02024BEC
_08017510: .4byte gBattleMons
_08017514: .4byte gUnknown_02024C10
_08017518: .4byte gUnknown_081D9202
_0801751C:
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0xF]
	ldr r1, _08017540
	ldr r0, _08017544
_08017534:
	str r0, [r1]
	ldr r0, [r1]
_08017538:
	bl b_call_bc_move_exec
	movs r0, 0x1
	b _08017560
	.align 2, 0
_08017540: .4byte gUnknown_02024C10
_08017544: .4byte gUnknown_081D921D
_08017548:
	ldrb r0, [r3]
	mov r1, r9
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08017554
	b _08017446
_08017554:
	ldr r2, _08017570
	ldr r0, [r2]
	ldr r1, _08017574
	ands r0, r1
	str r0, [r2]
	movs r0, 0
_08017560:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017570: .4byte gUnknown_02024C6C
_08017574: .4byte 0xfeffffdf
	thumb_func_end sub_80170DC

	thumb_func_start sub_80173A4
sub_80173A4: @ 8017578
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _08017594
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080175CC
	b _08017880
	.align 2, 0
_08017594: .4byte gUnknown_020239F8
_08017598:
	ldr r0, _080175A8
	bl b_call_bc_move_exec
	ldr r1, _080175AC
	add r1, r10
	movs r0, 0x2
	b _080175BC
	.align 2, 0
_080175A8: .4byte gUnknown_081D8C72
_080175AC: .4byte 0x00016059
_080175B0:
	ldr r0, _080175C4
	bl b_call_bc_move_exec
	ldr r1, _080175C8
	add r1, r8
	movs r0, 0x5
_080175BC:
	strb r0, [r1]
_080175BE:
	movs r0, 0x1
	b _08017882
	.align 2, 0
_080175C4: .4byte gUnknown_081D8C7B
_080175C8: .4byte 0x00016059
_080175CC:
	ldr r0, _080175E8
	mov r9, r0
_080175D0:
	ldr r0, _080175EC
	add r0, r9
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _080175DC
	b _08017874
_080175DC:
	lsls r0, 2
	ldr r1, _080175F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080175E8: .4byte 0x02000000
_080175EC: .4byte 0x00016059
_080175F0: .4byte _080175F4
	.align 2, 0
_080175F4:
	.4byte _08017614
	.4byte _08017664
	.4byte _08017708
	.4byte _08017750
	.4byte _08017762
	.4byte _080177D0
	.4byte _0801780C
	.4byte _08017874
_08017614:
	ldr r1, _080176DC
	add r1, r9
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080176E0
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r5, 0
	ldr r0, _080176E4
	ldrb r0, [r0]
	cmp r5, r0
	bge _08017664
	ldr r6, _080176E8
_08017632:
	ldrb r0, [r6]
	ldr r2, _080176EC
	lsls r1, r5, 2
	adds r1, r2
	ldr r4, [r1]
	ands r0, r4
	cmp r0, 0
	beq _0801765A
	lsls r0, r5, 24
	lsrs r0, 24
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	bne _0801765A
	ldrb r0, [r6]
	bics r0, r4
	strb r0, [r6]
_0801765A:
	adds r5, 0x1
	ldr r0, _080176E4
	ldrb r0, [r0]
	cmp r5, r0
	blt _08017632
_08017664:
	ldr r1, _080176F0
	mov r9, r1
	ldr r0, _080176F4
	mov r12, r0
	ldr r1, _080176F8
	mov r8, r1
	mov r10, r9
	ldr r5, _080176DC
	add r5, r9
	ldr r7, _080176FC
	ldr r6, _08017700
	add r6, r9
_0801767C:
	ldrb r0, [r5]
	mov r1, r8
	strb r0, [r1]
	mov r1, r12
	strb r0, [r1]
	ldrb r3, [r5]
	movs r0, 0x58
	muls r0, r3
	adds r0, r7
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080176BE
	ldrb r2, [r6]
	ldr r4, _080176EC
	ldr r1, _08017704
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _080176BE
	ldr r0, _080176E8
	ldrb r1, [r0]
	lsls r0, r3, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080176BE
	b _08017598
_080176BE:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldr r1, _080176E4
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801767C
	ldr r1, _080176E0
	add r1, r9
	movs r0, 0x3
	strb r0, [r1]
	b _08017874
	.align 2, 0
_080176DC: .4byte 0x0001605a
_080176E0: .4byte 0x00016059
_080176E4: .4byte gUnknown_02024A68
_080176E8: .4byte gUnknown_02024C0C
_080176EC: .4byte gBitTable
_080176F0: .4byte 0x02000000
_080176F4: .4byte gUnknown_02024C09
_080176F8: .4byte gUnknown_02024C08
_080176FC: .4byte gBattleMons
_08017700: .4byte 0x00016113
_08017704: .4byte gUnknown_02024A6A
_08017708:
	ldr r0, _08017730
	ldrb r0, [r0]
	bl sub_8015740
	ldr r2, _08017734
	ldr r0, _08017738
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _0801773C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08017744
	ldr r0, _08017740
	adds r1, r2, r0
	movs r0, 0x3
	b _08017870
	.align 2, 0
_08017730: .4byte gUnknown_02024C09
_08017734: .4byte 0x02000000
_08017738: .4byte 0x0001605a
_0801773C: .4byte gUnknown_02024A68
_08017740: .4byte 0x00016059
_08017744:
	ldr r0, _0801774C
	adds r1, r2, r0
	movs r0, 0x1
	b _08017870
	.align 2, 0
_0801774C: .4byte 0x00016059
_08017750:
	ldr r1, _080177AC
	add r1, r9
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080177B0
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08017762:
	ldr r7, _080177B4
	ldr r6, _080177B8
	ldr r1, _080177BC
	mov r8, r1
	ldr r3, _080177AC
	add r3, r8
	ldr r5, _080177C0
	ldr r4, _080177C4
_08017772:
	ldrb r0, [r3]
	strb r0, [r6]
	strb r0, [r7]
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08017798
	ldr r0, _080177C8
	ldrb r1, [r0]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08017798
	b _080175B0
_08017798:
	adds r0, r2, 0x1
	strb r0, [r3]
	ldr r1, _080177CC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _08017772
	b _080177E6
	.align 2, 0
_080177AC: .4byte 0x0001605a
_080177B0: .4byte 0x00016059
_080177B4: .4byte gUnknown_02024C09
_080177B8: .4byte gUnknown_02024C08
_080177BC: .4byte 0x02000000
_080177C0: .4byte gBattleMons
_080177C4: .4byte gBitTable
_080177C8: .4byte gUnknown_02024C0C
_080177CC: .4byte gUnknown_02024A68
_080177D0:
	ldr r0, _080177F0
	add r0, r9
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _080177F4
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0]
	cmp r1, r0
	bne _080177FC
_080177E6:
	ldr r1, _080177F8
	add r1, r9
	movs r0, 0x6
	strb r0, [r1]
	b _08017874
	.align 2, 0
_080177F0: .4byte 0x0001605a
_080177F4: .4byte gUnknown_02024A68
_080177F8: .4byte 0x00016059
_080177FC:
	ldr r1, _08017808
	add r1, r9
	movs r0, 0x4
	strb r0, [r1]
	b _08017874
	.align 2, 0
_08017808: .4byte 0x00016059
_0801780C:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08017826
	b _080175BE
_08017826:
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0801783C
	b _080175BE
_0801783C:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_801A02C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08017850
	b _080175BE
_08017850:
	str r0, [sp]
	movs r0, 0x6
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08017866
	b _080175BE
_08017866:
	ldr r2, _08017894
	ldr r0, _08017898
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
_08017870:
	strb r0, [r1]
	mov r9, r2
_08017874:
	ldr r0, _08017898
	add r0, r9
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _08017880
	b _080175D0
_08017880:
	movs r0, 0
_08017882:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08017894: .4byte 0x02000000
_08017898: .4byte 0x00016059
	thumb_func_end sub_80173A4

	thumb_func_start b_clear_atk_up_if_hit_flag_unless_enraged
b_clear_atk_up_if_hit_flag_unless_enraged: @ 801789C
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _080178DC
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r3, r0
	bge _080178D4
	ldr r4, _080178E0
	movs r6, 0x80
	lsls r6, 16
	ldr r2, _080178E4
_080178B2:
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _080178C8
	ldrh r0, [r4]
	cmp r0, 0x63
	beq _080178C8
	ldr r0, _080178E8
	ands r1, r0
	str r1, [r2]
_080178C8:
	adds r4, 0x2
	adds r2, 0x58
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080178B2
_080178D4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080178DC: .4byte gUnknown_02024A68
_080178E0: .4byte gUnknown_02024C60
_080178E4: .4byte gUnknown_02024AD0
_080178E8: .4byte 0xff7fffff
	thumb_func_end b_clear_atk_up_if_hit_flag_unless_enraged

	thumb_func_start sub_8017718
sub_8017718: @ 80178EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r0, 0
	mov r9, r0
	ldr r1, _08017908
	mov r10, r1
	ldr r2, _0801790C
	add r2, r10
	mov r8, r2
	b _0801791A
	.align 2, 0
_08017908: .4byte 0x02016090
_0801790C: .4byte 0xfffe9f70
_08017910:
	mov r4, r9
	cmp r4, 0
	beq _0801791A
	bl _08018180
_0801791A:
	ldr r0, _08017934
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xE
	bls _08017928
	bl _08018172
_08017928:
	lsls r0, 2
	ldr r1, _08017938
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017934: .4byte 0x000160e7
_08017938: .4byte _0801793C
	.align 2, 0
_0801793C:
	.4byte _08017978
	.4byte _080179B8
	.4byte _08017AF4
	.4byte _08017BAC
	.4byte _08017C24
	.4byte _08017C9C
	.4byte _08017CF0
	.4byte _08017D6C
	.4byte _08017DF0
	.4byte _08017E34
	.4byte _08017F10
	.4byte _08017F94
	.4byte _08018030
	.4byte _0801811C
	.4byte _08018172
_08017978:
	ldr r1, _080179A4
	ldr r3, _080179A8
	ldrb r2, [r3]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _080179AC
	ands r0, r1
	str r0, [r2]
	ldr r0, _080179B0
	ldrb r2, [r3]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _080179B4
	ands r0, r1
	str r0, [r2]
	bl _08018168
	.align 2, 0
_080179A4: .4byte gBattleMons
_080179A8: .4byte gUnknown_02024C07
_080179AC: .4byte 0xfdffffff
_080179B0: .4byte gUnknown_02024C98
_080179B4: .4byte 0xffffbfff
_080179B8:
	ldr r7, _08017A20
	ldr r4, _08017A24
	ldrb r1, [r4]
	movs r5, 0x58
	adds r0, r1, 0
	muls r0, r5
	adds r6, r7, 0
	adds r6, 0x4C
	adds r0, r6
	ldr r0, [r0]
	movs r2, 0x7
	mov r8, r2
	ands r0, r2
	cmp r0, 0
	bne _080179D8
	b _08017F64
_080179D8:
	adds r0, r1, 0
	bl sub_8025A44
	lsls r0, 24
	cmp r0, 0
	beq _08017A38
	ldrb r0, [r4]
	adds r2, r0, 0
	muls r2, r5
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	ldrb r0, [r4]
	adds r2, r0, 0
	muls r2, r5
	adds r0, r7, 0
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08017A28
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _08017A2C
	movs r0, 0x1
	strb r0, [r1, 0x5]
	ldr r1, _08017A30
	ldr r0, _08017A34
	str r0, [r1]
	movs r4, 0x2
	mov r9, r4
	b _08017F64
	.align 2, 0
_08017A20: .4byte gBattleMons
_08017A24: .4byte gUnknown_02024C07
_08017A28: .4byte 0xf7ffffff
_08017A2C: .4byte gUnknown_02024D1E
_08017A30: .4byte gUnknown_02024C10
_08017A34: .4byte gUnknown_081D94FB
_08017A38:
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r0, r1, r7
	adds r0, 0x20
	ldrb r0, [r0]
	movs r3, 0x1
	cmp r0, 0x30
	bne _08017A4C
	movs r3, 0x2
_08017A4C:
	adds r2, r1, r6
	ldr r1, [r2]
	adds r0, r1, 0
	mov r7, r8
	ands r0, r7
	cmp r0, r3
	bcs _08017A64
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	b _08017A68
_08017A64:
	subs r0, r1, r3
	str r0, [r2]
_08017A68:
	ldr r2, _08017AAC
	ldr r0, _08017AB0
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r4, [r0]
	movs r0, 0x7
	ands r4, r0
	cmp r4, 0
	beq _08017AC4
	ldr r0, _08017AB4
	ldrh r0, [r0]
	cmp r0, 0xAD
	bne _08017A8C
	b _08017F64
_08017A8C:
	cmp r0, 0xD6
	bne _08017A92
	b _08017F64
_08017A92:
	ldr r1, _08017AB8
	ldr r0, _08017ABC
	str r0, [r1]
	ldr r2, _08017AC0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x2
	mov r9, r0
	b _08017F64
	.align 2, 0
_08017AAC: .4byte gBattleMons
_08017AB0: .4byte gUnknown_02024C07
_08017AB4: .4byte gUnknown_02024BE6
_08017AB8: .4byte gUnknown_02024C10
_08017ABC: .4byte gUnknown_081D94EE
_08017AC0: .4byte gUnknown_02024C6C
_08017AC4:
	adds r2, 0x50
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r1, _08017AE4
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r0, _08017AE8
	strb r4, [r0, 0x5]
	ldr r1, _08017AEC
	ldr r0, _08017AF0
	str r0, [r1]
	movs r1, 0x2
	b _08017F62
	.align 2, 0
_08017AE4: .4byte 0xf7ffffff
_08017AE8: .4byte gUnknown_02024D1E
_08017AEC: .4byte gUnknown_02024C10
_08017AF0: .4byte gUnknown_081D94FB
_08017AF4:
	ldr r1, _08017B50
	ldr r7, _08017B54
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	adds r5, r1, 0
	adds r5, 0x4C
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08017B10
	b _08018168
_08017B10:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08017B7C
	ldr r2, _08017B58
	ldr r0, _08017B5C
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7D
	beq _08017B6C
	ldr r1, _08017B60
	ldr r0, _08017B64
	str r0, [r1]
	ldr r2, _08017B68
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r2]
	b _08017B9C
	.align 2, 0
_08017B50: .4byte gBattleMons
_08017B54: .4byte gUnknown_02024C07
_08017B58: .4byte gBattleMoves
_08017B5C: .4byte gUnknown_02024BE6
_08017B60: .4byte gUnknown_02024C10
_08017B64: .4byte gUnknown_081D9545
_08017B68: .4byte gUnknown_02024C6C
_08017B6C:
	ldr r2, _08017B74
	ldr r7, _08017B78
	adds r1, r2, r7
	b _08017F6A
	.align 2, 0
_08017B74: .4byte 0x02000000
_08017B78: .4byte 0x000160e7
_08017B7C:
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r5
	ldr r0, [r2]
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _08017BA0
	ldr r0, _08017BA4
	str r0, [r1]
	ldr r0, _08017BA8
	strb r4, [r0, 0x5]
_08017B9C:
	movs r0, 0x2
	b _08018010
	.align 2, 0
_08017BA0: .4byte gUnknown_02024C10
_08017BA4: .4byte gUnknown_081D9552
_08017BA8: .4byte gUnknown_02024D1E
_08017BAC:
	ldr r1, _08017C04
	ldr r0, _08017C08
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x36
	beq _08017BC2
	b _08017F64
_08017BC2:
	ldr r0, _08017C0C
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _08017BD6
	b _08017F64
_08017BD6:
	adds r0, r2, 0
	bl b_cancel_multi_turn_move_maybe
	ldr r2, _08017C10
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08017C14
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _08017C18
	ldr r0, _08017C1C
	str r0, [r1]
	ldr r2, _08017C20
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r2, 0x1
	mov r9, r2
	b _08017F64
	.align 2, 0
_08017C04: .4byte gBattleMons
_08017C08: .4byte gUnknown_02024C07
_08017C0C: .4byte gUnknown_02024CA8
_08017C10: .4byte gUnknown_02024C6C
_08017C14: .4byte gUnknown_02024D1E
_08017C18: .4byte gUnknown_02024C10
_08017C1C: .4byte gUnknown_081D9977
_08017C20: .4byte gUnknown_02024C68
_08017C24:
	ldr r1, _08017C78
	ldr r3, _08017C7C
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 15
	ands r0, r1
	cmp r0, 0
	beq _08017C70
	ldr r0, _08017C80
	ands r1, r0
	str r1, [r2]
	ldr r2, _08017C84
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x19]
	ldrb r0, [r3]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08017C88
	ldr r0, _08017C8C
	str r0, [r1]
	ldr r2, _08017C90
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r7, 0x1
	mov r9, r7
_08017C70:
	ldr r2, _08017C94
	ldr r0, _08017C98
	adds r1, r2, r0
	b _08017F6A
	.align 2, 0
_08017C78: .4byte gBattleMons
_08017C7C: .4byte gUnknown_02024C07
_08017C80: .4byte 0xffbfffff
_08017C84: .4byte gUnknown_02024CA8
_08017C88: .4byte gUnknown_02024C10
_08017C8C: .4byte gUnknown_081D7956
_08017C90: .4byte gUnknown_02024C6C
_08017C94: .4byte 0x02000000
_08017C98: .4byte 0x000160e7
_08017C9C:
	ldr r1, _08017CDC
	ldr r3, _08017CE0
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08017CB6
	b _08017F64
_08017CB6:
	movs r0, 0x9
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	ldr r0, _08017CE4
	ldrb r2, [r3]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r0, [r3]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08017CE8
	ldr r0, _08017CEC
	b _08017F52
	.align 2, 0
_08017CDC: .4byte gBattleMons
_08017CE0: .4byte gUnknown_02024C07
_08017CE4: .4byte gUnknown_02024D28
_08017CE8: .4byte gUnknown_02024C10
_08017CEC: .4byte gUnknown_081D9573
_08017CF0:
	ldr r0, _08017D48
	ldr r3, _08017D4C
	ldrb r2, [r3]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, _08017D50
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0]
	cmp r1, r0
	beq _08017D0A
	b _08017F64
_08017D0A:
	cmp r1, 0
	bne _08017D10
	b _08017F64
_08017D10:
	ldr r0, _08017D54
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _08017D58
	ldrb r1, [r3]
	ldr r7, _08017D5C
	adds r0, r7
	strb r1, [r0]
	ldrb r0, [r3]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08017D60
	ldr r0, _08017D64
	str r0, [r1]
	ldr r2, _08017D68
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x1
	mov r9, r0
	b _08017F64
	.align 2, 0
_08017D48: .4byte gUnknown_02024CA8
_08017D4C: .4byte gUnknown_02024C07
_08017D50: .4byte gUnknown_02024BE6
_08017D54: .4byte gUnknown_02024D28
_08017D58: .4byte 0x02000000
_08017D5C: .4byte 0x00016003
_08017D60: .4byte gUnknown_02024C10
_08017D64: .4byte gUnknown_081D9139
_08017D68: .4byte gUnknown_02024C6C
_08017D6C:
	ldr r0, _08017DC8
	ldr r4, _08017DCC
	ldrb r3, [r4]
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x13]
	lsls r0, 28
	cmp r0, 0
	beq _08017DC0
	ldr r2, _08017DD0
	ldr r0, _08017DD4
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08017DC0
	ldr r0, _08017DD8
	lsls r2, r3, 4
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r0, [r4]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08017DDC
	ldr r0, _08017DE0
	str r0, [r1]
	ldr r2, _08017DE4
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r7, 0x1
	mov r9, r7
_08017DC0:
	ldr r2, _08017DE8
	ldr r0, _08017DEC
	adds r1, r2, r0
	b _08017F6A
	.align 2, 0
_08017DC8: .4byte gUnknown_02024CA8
_08017DCC: .4byte gUnknown_02024C07
_08017DD0: .4byte gBattleMoves
_08017DD4: .4byte gUnknown_02024BE6
_08017DD8: .4byte gUnknown_02024D28
_08017DDC: .4byte gUnknown_02024C10
_08017DE0: .4byte gUnknown_081D938F
_08017DE4: .4byte gUnknown_02024C6C
_08017DE8: .4byte 0x02000000
_08017DEC: .4byte 0x000160e7
_08017DF0:
	ldr r4, _08017E20
	ldrb r0, [r4]
	ldr r1, _08017E24
	ldrh r1, [r1]
	bl sub_8015D5C
	lsls r0, 24
	cmp r0, 0
	bne _08017E04
	b _08017F64
_08017E04:
	ldr r0, _08017E28
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r4]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08017E2C
	ldr r0, _08017E30
	b _08017F52
	.align 2, 0
_08017E20: .4byte gUnknown_02024C07
_08017E24: .4byte gUnknown_02024BE6
_08017E28: .4byte gUnknown_02024D28
_08017E2C: .4byte gUnknown_02024C10
_08017E30: .4byte gUnknown_081D9459
_08017E34:
	ldr r7, _08017E80
	ldr r5, _08017E84
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	adds r4, r7, 0
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r3, 0x7
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _08017E52
	b _08018168
_08017E52:
	subs r0, r1, 0x1
	str r0, [r2]
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r4
	ldr r0, [r0]
	ands r0, r3
	cmp r0, 0
	beq _08017EF8
	bl Random
	movs r1, 0x1
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08017E8C
	ldr r1, _08017E88
	movs r0, 0
	strb r0, [r1, 0x5]
	bl b_movescr_stack_push_cursor
	b _08017ED6
	.align 2, 0
_08017E80: .4byte gBattleMons
_08017E84: .4byte gUnknown_02024C07
_08017E88: .4byte gUnknown_02024D1E
_08017E8C:
	ldr r0, _08017EDC
	movs r4, 0x1
	strb r1, [r0, 0x5]
	ldr r1, _08017EE0
	ldrb r0, [r5]
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r7
	movs r0, 0x28
	str r0, [sp]
	str r2, [sp, 0x4]
	ldrb r0, [r5]
	str r0, [sp, 0x8]
	ldrb r0, [r5]
	str r0, [sp, 0xC]
	adds r0, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl CalculateBaseDamage
	ldr r1, _08017EE4
	str r0, [r1]
	ldr r0, _08017EE8
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	orrs r0, r4
	strb r0, [r1, 0x1]
	ldr r2, _08017EEC
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
_08017ED6:
	ldr r1, _08017EF0
	ldr r0, _08017EF4
	b _08017F00
	.align 2, 0
_08017EDC: .4byte gUnknown_02024D1E
_08017EE0: .4byte gUnknown_02024C08
_08017EE4: .4byte gUnknown_02024BEC
_08017EE8: .4byte gUnknown_02024D28
_08017EEC: .4byte gUnknown_02024C6C
_08017EF0: .4byte gUnknown_02024C10
_08017EF4: .4byte gUnknown_081D9595
_08017EF8:
	bl b_movescr_stack_push_cursor
	ldr r1, _08017F08
	ldr r0, _08017F0C
_08017F00:
	str r0, [r1]
	movs r7, 0x1
	b _08018162
	.align 2, 0
_08017F08: .4byte gUnknown_02024C10
_08017F0C: .4byte gUnknown_081D95D4
_08017F10:
	ldr r1, _08017F74
	ldr r4, _08017F78
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08017F64
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	bne _08017F64
	ldr r0, _08017F7C
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08017F80
	ldr r0, _08017F84
_08017F52:
	str r0, [r1]
	ldr r2, _08017F88
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	movs r1, 0x1
_08017F62:
	mov r9, r1
_08017F64:
	ldr r2, _08017F8C
	ldr r4, _08017F90
	adds r1, r2, r4
_08017F6A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r8, r2
	b _08018172
	.align 2, 0
_08017F74: .4byte gBattleMons
_08017F78: .4byte gUnknown_02024C07
_08017F7C: .4byte gUnknown_02024D28
_08017F80: .4byte gUnknown_02024C10
_08017F84: .4byte gUnknown_081D9566
_08017F88: .4byte gUnknown_02024C6C
_08017F8C: .4byte 0x02000000
_08017F90: .4byte 0x000160e7
_08017F94:
	ldr r1, _08017FD0
	ldr r4, _08017FD4
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0xF0
	lsls r0, 12
	ands r1, r0
	cmp r1, 0
	bne _08017FB0
	b _08018168
_08017FB0:
	lsrs r0, r1, 16
	bl sub_804114C
	ldr r1, _08017FD8
	ldr r7, _08017FDC
	adds r1, r7
	strb r0, [r1]
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08017FE0
	bl b_movescr_stack_push_cursor
	b _08018008
	.align 2, 0
_08017FD0: .4byte gBattleMons
_08017FD4: .4byte gUnknown_02024C07
_08017FD8: .4byte 0x02000000
_08017FDC: .4byte 0x00016003
_08017FE0:
	ldr r0, _08018018
	bl b_movescr_stack_push
	ldr r2, _0801801C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r2]
	ldr r0, _08018020
	ldrb r2, [r4]
	lsls r2, 4
	adds r2, r0
	ldrb r0, [r2, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r4]
	bl b_cancel_multi_turn_move_maybe
_08018008:
	ldr r1, _08018024
	ldr r0, _08018028
	str r0, [r1]
	movs r0, 0x1
_08018010:
	mov r9, r0
	ldr r1, _0801802C
	mov r8, r1
	b _08018168
	.align 2, 0
_08018018: .4byte gUnknown_081D9608
_0801801C: .4byte gUnknown_02024C6C
_08018020: .4byte gUnknown_02024D28
_08018024: .4byte gUnknown_02024C10
_08018028: .4byte gUnknown_081D95FB
_0801802C: .4byte 0x02000000
_08018030:
	ldr r1, _0801806C
	ldr r6, _08018070
	ldrb r0, [r6]
	movs r5, 0x58
	muls r0, r5
	adds r1, 0x50
	adds r3, r0, r1
	ldr r2, [r3]
	movs r4, 0xC0
	lsls r4, 2
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	bne _0801804E
	b _08018168
_0801804E:
	ldr r7, _08018074
	adds r0, r2, r7
	str r0, [r3]
	ldrb r0, [r6]
	muls r0, r5
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, 0
	ands r0, r4
	cmp r0, 0
	beq _08018080
	ldr r1, _08018078
	ldr r0, _0801807C
	b _0801810C
	.align 2, 0
_0801806C: .4byte gBattleMons
_08018070: .4byte gUnknown_02024C07
_08018074: .4byte 0xffffff00
_08018078: .4byte gUnknown_02024C10
_0801807C: .4byte gUnknown_081D90A7
_08018080:
	ldr r0, _080180E0
	ands r2, r0
	str r2, [r1]
	ldr r2, _080180E4
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08018108
	ldr r1, _080180E8
	movs r0, 0x75
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r0, 1
	mov r1, r10
	str r0, [r1]
	ldr r4, _080180EC
	ldr r1, _080180F0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _080180F4
	ldrb r1, [r0]
	ldr r2, _080180F8
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080180D2
	movs r0, 0x75
	movs r1, 0x1
	bl sub_801B5C0
	strb r0, [r4]
_080180D2:
	ldr r1, _080180FC
	ldr r0, _08018100
	str r0, [r1]
	ldr r2, _08018104
	mov r8, r2
	b _0801810E
	.align 2, 0
_080180E0: .4byte 0xffffefff
_080180E4: .4byte gUnknown_02024BF4
_080180E8: .4byte gUnknown_02024BE6
_080180EC: .4byte gUnknown_02024C08
_080180F0: .4byte gUnknown_02024C74
_080180F4: .4byte gUnknown_02024C0C
_080180F8: .4byte gBitTable
_080180FC: .4byte gUnknown_02024C10
_08018100: .4byte gUnknown_081D90B2
_08018104: .4byte 0x02000000
_08018108:
	ldr r1, _08018114
	ldr r0, _08018118
_0801810C:
	str r0, [r1]
_0801810E:
	movs r4, 0x1
	mov r9, r4
	b _08018168
	.align 2, 0
_08018114: .4byte gUnknown_02024C10
_08018118: .4byte gUnknown_081D90F1
_0801811C:
	ldr r1, _080181C0
	ldr r0, _080181C4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r4, r0, r1
	ldr r3, [r4]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _08018168
	ldr r2, _080181C8
	ldr r0, _080181CC
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7D
	bne _08018160
	movs r0, 0x21
	negs r0, r0
	ands r3, r0
	str r3, [r4]
	bl b_movescr_stack_push_cursor
	ldr r1, _080181D0
	ldr r0, _080181D4
	str r0, [r1]
	ldr r1, _080181D8
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08018160:
	movs r7, 0x2
_08018162:
	mov r9, r7
	ldr r0, _080181DC
	mov r8, r0
_08018168:
	ldr r1, _080181E0
	add r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08018172:
	ldr r0, _080181E0
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0xE
	beq _08018180
	bl _08017910
_08018180:
	mov r1, r9
	cmp r1, 0x2
	bne _080181AC
	ldr r4, _080181E4
	ldr r0, _080181C4
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _080181E8
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080181AC:
	mov r0, r9
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080181C0: .4byte gBattleMons
_080181C4: .4byte gUnknown_02024C07
_080181C8: .4byte gBattleMoves
_080181CC: .4byte gUnknown_02024BE6
_080181D0: .4byte gUnknown_02024C10
_080181D4: .4byte gUnknown_081D9552
_080181D8: .4byte gUnknown_02024D1E
_080181DC: .4byte 0x02000000
_080181E0: .4byte 0x000160e7
_080181E4: .4byte gUnknown_02024A60
_080181E8: .4byte gUnknown_02024ACC
	thumb_func_end sub_8017718

	thumb_func_start sub_8018018
sub_8018018: @ 80181EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r3, r4, 0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	ldr r0, _08018218
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801821C
	movs r0, 0
	b _0801836C
	.align 2, 0
_08018218: .4byte gUnknown_020239F8
_0801821C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080182A8
	adds r0, r4, 0
	bl sub_803FC34
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _080182A0
	mov r8, r1
	cmp r0, 0
	bne _08018242
	ldr r2, _080182A4
	mov r8, r2
_08018242:
	adds r0, r7, 0
	bl sub_803FBFC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 1
	adds r5, r0, r6
	adds r0, r5, 0x3
	cmp r5, r0
	bge _0801828E
	adds r7, r0, 0
_08018258:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08018288
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08018288
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _0801828E
_08018288:
	adds r5, 0x1
	cmp r5, r7
	blt _08018258
_0801828E:
	movs r1, 0
	lsls r0, r6, 1
	adds r0, r6
	adds r0, 0x3
	cmp r5, r0
	bne _0801829C
	movs r1, 0x1
_0801829C:
	adds r0, r1, 0
	b _0801836C
	.align 2, 0
_080182A0: .4byte gEnemyParty
_080182A4: .4byte gPlayerParty
_080182A8:
	adds r0, r3, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080182D4
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080182D0
	mov r8, r2
	b _080182EC
	.align 2, 0
_080182D0: .4byte gEnemyParty
_080182D4:
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0801837C
	mov r8, r0
_080182EC:
	mov r1, r10
	cmp r1, 0x6
	bne _080182FC
	ldr r1, _08018380
	lsls r0, r7, 1
	adds r0, r1
	ldrb r0, [r0]
	mov r10, r0
_080182FC:
	mov r2, r9
	cmp r2, 0x6
	bne _0801830C
	ldr r1, _08018380
	lsls r0, r6, 1
	adds r0, r1
	ldrb r0, [r0]
	mov r9, r0
_0801830C:
	movs r5, 0
_0801830E:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0801835E
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0801835E
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0801835E
	cmp r5, r10
	beq _0801835E
	cmp r5, r9
	beq _0801835E
	ldr r1, _08018384
	ldr r2, _08018388
	adds r0, r7, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r5, r0
	beq _0801835E
	adds r0, r6, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r5, r0
	bne _08018364
_0801835E:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0801830E
_08018364:
	movs r0, 0
	cmp r5, 0x6
	bne _0801836C
	movs r0, 0x1
_0801836C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801837C: .4byte gPlayerParty
_08018380: .4byte gUnknown_02024A6A
_08018384: .4byte 0x02000000
_08018388: .4byte 0x00016068
	thumb_func_end sub_8018018

	thumb_func_start castform_switch
castform_switch: @ 801838C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _080183FC
	movs r0, 0x58
	muls r0, r6
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _08018400
	cmp r1, r0
	bne _08018430
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3B
	bne _08018430
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	beq _08018430
	str r5, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _080183DE
	str r5, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08018404
_080183DE:
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0
	beq _08018404
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0
	beq _08018404
	strb r5, [r2]
	strb r5, [r1]
	movs r0, 0x1
	b _080184E8
	.align 2, 0
_080183FC: .4byte gBattleMons
_08018400: .4byte 0x00000181
_08018404:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08018430
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08018434
_08018430:
	movs r0, 0
	b _080184E8
_08018434:
	ldr r1, _080184F0
	ldrh r0, [r1]
	movs r2, 0xE7
	ands r2, r0
	adds r4, r1, 0
	cmp r2, 0
	bne _08018462
	ldr r1, _080184F4
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r3, r1, 0
	adds r3, 0x21
	ldrb r0, [r3]
	cmp r0, 0
	beq _08018462
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0
	beq _08018462
	strb r2, [r3]
	strb r2, [r1]
	movs r5, 0x1
_08018462:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0801848E
	ldr r1, _080184F4
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xA
	beq _0801848E
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xA
	beq _0801848E
	movs r0, 0xA
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x2
_0801848E:
	ldrh r1, [r4]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080184BA
	ldr r1, _080184F4
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xB
	beq _080184BA
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xB
	beq _080184BA
	movs r0, 0xB
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x3
_080184BA:
	ldrh r1, [r4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080184E6
	ldr r1, _080184F4
	movs r0, 0x58
	muls r0, r6
	adds r1, r0, r1
	adds r2, r1, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0xF
	beq _080184E6
	adds r1, 0x22
	ldrb r0, [r1]
	cmp r0, 0xF
	beq _080184E6
	movs r0, 0xF
	strb r0, [r2]
	strb r0, [r1]
	movs r5, 0x4
_080184E6:
	adds r0, r5, 0
_080184E8:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080184F0: .4byte word_2024DB8
_080184F4: .4byte gBattleMons
	thumb_func_end castform_switch

	thumb_func_start sub_8018324
sub_8018324: @ 80184F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0
	mov r9, r0
	ldr r5, _08018554
	ldr r1, _08018558
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08018534
	mov r1, r10
	strb r1, [r5]
_08018534:
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08018564
	ldr r1, _0801855C
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08018560
	b _08018574
	.align 2, 0
_08018554: .4byte gUnknown_02024C07
_08018558: .4byte gUnknown_02024A68
_0801855C: .4byte gUnknown_02024A6A
_08018560: .4byte gPlayerParty
_08018564:
	ldr r1, _080185A4
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080185A8
_08018574:
	adds r7, r1, r0
	ldr r5, _080185AC
	ldr r1, _080185B0
	ldrb r0, [r5]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08018586
	mov r2, r10
	strb r2, [r5]
_08018586:
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080185B8
	ldr r1, _080185A4
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080185B4
	b _080185C8
	.align 2, 0
_080185A4: .4byte gUnknown_02024A6A
_080185A8: .4byte gEnemyParty
_080185AC: .4byte gUnknown_02024C08
_080185B0: .4byte gUnknown_02024A68
_080185B4: .4byte gPlayerParty
_080185B8:
	ldr r1, _08018618
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801861C
_080185C8:
	adds r5, r1, r0
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x14]
	ldr r0, _08018620
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0801860A
	bl _0801A166
_0801860A:
	mov r3, r8
	cmp r3, 0
	beq _08018628
	ldr r0, _08018624
	strb r3, [r0]
	mov r8, r0
	b _0801863E
	.align 2, 0
_08018618: .4byte gUnknown_02024A6A
_0801861C: .4byte gEnemyParty
_08018620: .4byte gUnknown_020239F8
_08018624: .4byte byte_2024C06
_08018628:
	ldr r2, _08018648
	ldr r1, _0801864C
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2]
	mov r8, r2
_0801863E:
	cmp r4, 0
	beq _08018650
	adds r3, r4, 0
	b _08018654
	.align 2, 0
_08018648: .4byte byte_2024C06
_0801864C: .4byte gBattleMons
_08018650:
	ldr r0, _08018668
	ldrh r3, [r0]
_08018654:
	ldr r1, _0801866C
	ldr r2, _08018670
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	beq _08018674
	movs r4, 0x3F
	ands r4, r0
	b _08018680
	.align 2, 0
_08018668: .4byte gUnknown_02024BE6
_0801866C: .4byte 0x02000000
_08018670: .4byte 0x0001601c
_08018674:
	ldr r1, _08018694
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x2]
_08018680:
	ldr r5, [sp, 0x4]
	cmp r5, 0x13
	bls _0801868A
	bl _0801A14A
_0801868A:
	lsls r0, r5, 2
	ldr r1, _08018698
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018694: .4byte gBattleMoves
_08018698: .4byte _0801869C
	.align 2, 0
_0801869C:
	.4byte _080186EC
	.4byte _080189E8
	.4byte _08018C14
	.4byte _08018CAC
	.4byte _08018EC4
	.4byte _0801961C
	.4byte _08019988
	.4byte _080199D8
	.4byte _08019A54
	.4byte _08019AD0
	.4byte _08019CF0
	.4byte _08019B14
	.4byte _08019D34
	.4byte _08019D90
	.4byte _08019DEC
	.4byte _08019EEC
	.4byte _08019F30
	.4byte _08019F8C
	.4byte _0801A118
	.4byte _08019EA8
_080186EC:
	ldr r2, _08018720
	ldr r0, _08018724
	ldrb r1, [r2]
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r1, r0
	bcc _080186FE
	mov r1, r10
	strb r1, [r2]
_080186FE:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0x2D
	bne _08018708
	b _0801888C
_08018708:
	cmp r0, 0x2D
	bgt _08018738
	cmp r0, 0xD
	bne _08018712
	b _080189B0
_08018712:
	cmp r0, 0xD
	bgt _08018728
	cmp r0, 0x2
	bne _0801871C
	b _08018854
_0801871C:
	bl _0801A14A
	.align 2, 0
_08018720: .4byte gUnknown_02024C07
_08018724: .4byte gUnknown_02024A68
_08018728:
	cmp r0, 0x16
	bne _0801872E
	b _080188FC
_0801872E:
	cmp r0, 0x24
	bne _08018734
	b _08018974
_08018734:
	bl _0801A14A
_08018738:
	cmp r0, 0x46
	bne _0801873E
	b _080188C4
_0801873E:
	cmp r0, 0x46
	bgt _0801874C
	cmp r0, 0x3B
	bne _08018748
	b _08018930
_08018748:
	bl _0801A14A
_0801874C:
	cmp r0, 0x4D
	bne _08018752
	b _080189B0
_08018752:
	cmp r0, 0xFF
	beq _0801875A
	bl _0801A14A
_0801875A:
	bl weather_get_current
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0xA
	bhi _08018820
	lsls r0, 2
	ldr r1, _08018774
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018774: .4byte _08018778
	.align 2, 0
_08018778:
	.4byte _080187A4
	.4byte _08018820
	.4byte _080187A4
	.4byte _08018820
	.4byte _08018820
	.4byte _080187CC
	.4byte _08018820
	.4byte _08018820
	.4byte _08018820
	.4byte _080187F4
	.4byte _080187A4
_080187A4:
	ldr r2, _080187C0
	ldrh r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08018820
	movs r0, 0x5
	strh r0, [r2]
	ldr r0, _080187C4
	ldr r3, _080187C8
	adds r2, r0, r3
	movs r1, 0xA
	b _0801880C
	.align 2, 0
_080187C0: .4byte word_2024DB8
_080187C4: .4byte 0x02000000
_080187C8: .4byte 0x000160a4
_080187CC:
	ldr r3, _080187E8
	ldrh r1, [r3]
	movs r2, 0x18
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08018820
	strh r2, [r3]
	ldr r0, _080187EC
	ldr r3, _080187F0
	adds r2, r0, r3
	movs r1, 0xC
	b _0801880C
	.align 2, 0
_080187E8: .4byte word_2024DB8
_080187EC: .4byte 0x02000000
_080187F0: .4byte 0x000160a4
_080187F4:
	ldr r3, _0801883C
	ldrh r1, [r3]
	movs r2, 0x60
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08018820
	strh r2, [r3]
	ldr r0, _08018840
	ldr r3, _08018844
	adds r2, r0, r3
	movs r1, 0xB
_0801880C:
	strb r1, [r2]
	ldr r5, _08018848
	adds r0, r5
	mov r1, r10
	strb r1, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08018820:
	mov r2, r9
	cmp r2, 0
	bne _0801882A
	bl _0801A166
_0801882A:
	bl weather_get_current
	ldr r1, _0801884C
	strb r0, [r1, 0x5]
	ldr r0, _08018850
	bl b_push_move_exec
	bl _0801A14A
	.align 2, 0
_0801883C: .4byte word_2024DB8
_08018840: .4byte 0x02000000
_08018844: .4byte 0x000160a4
_08018848: .4byte 0x00016003
_0801884C: .4byte gUnknown_02024D1E
_08018850: .4byte gUnknown_081D901D
_08018854:
	ldr r2, _0801887C
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08018864
	bl _0801A14A
_08018864:
	movs r0, 0x5
	strh r0, [r2]
	ldr r0, _08018880
	bl b_push_move_exec
	ldr r0, _08018884
	ldr r3, _08018888
	adds r0, r3
	mov r5, r10
	strb r5, [r0]
	bl _0801A0F6
	.align 2, 0
_0801887C: .4byte word_2024DB8
_08018880: .4byte gUnknown_081D9704
_08018884: .4byte 0x02000000
_08018888: .4byte 0x00016003
_0801888C:
	ldr r2, _080188B4
	ldrh r1, [r2]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801889C
	bl _0801A14A
_0801889C:
	movs r0, 0x18
	strh r0, [r2]
	ldr r0, _080188B8
	bl b_push_move_exec
	ldr r0, _080188BC
	ldr r1, _080188C0
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	bl _0801A0F6
	.align 2, 0
_080188B4: .4byte word_2024DB8
_080188B8: .4byte gUnknown_081D9744
_080188BC: .4byte 0x02000000
_080188C0: .4byte 0x00016003
_080188C4:
	ldr r2, _080188EC
	ldrh r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080188D4
	bl _0801A14A
_080188D4:
	movs r0, 0x60
	strh r0, [r2]
	ldr r0, _080188F0
	bl b_push_move_exec
	ldr r0, _080188F4
	ldr r3, _080188F8
	adds r0, r3
	mov r5, r10
	strb r5, [r0]
	bl _0801A0F6
	.align 2, 0
_080188EC: .4byte word_2024DB8
_080188F0: .4byte gUnknown_081D97FE
_080188F4: .4byte 0x02000000
_080188F8: .4byte 0x00016003
_080188FC:
	ldr r0, _08018928
	mov r1, r10
	lsls r2, r1, 2
	adds r1, r2, r1
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, 28
	cmp r0, 0
	bge _08018914
	bl _0801A14A
_08018914:
	ldr r1, _0801892C
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 12
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x8
	b _0801899E
	.align 2, 0
_08018928: .4byte gUnknown_02024D68
_0801892C: .4byte gUnknown_02024C98
_08018930:
	mov r0, r10
	bl castform_switch
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	bne _08018944
	bl _0801A166
_08018944:
	ldr r0, _08018964
	bl b_push_move_exec
	ldr r0, _08018968
	ldr r2, _0801896C
	adds r1, r0, r2
	mov r3, r10
	strb r3, [r1]
	mov r1, r9
	subs r1, 0x1
	ldr r5, _08018970
	adds r0, r5
	strb r1, [r0]
	bl _0801A14A
	.align 2, 0
_08018964: .4byte gUnknown_081D977D
_08018968: .4byte 0x02000000
_0801896C: .4byte 0x00016003
_08018970: .4byte 0x0001609b
_08018974:
	ldr r0, _080189A8
	mov r1, r10
	lsls r2, r1, 2
	adds r1, r2, r1
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3]
	lsls r0, 27
	cmp r0, 0
	bge _0801898C
	bl _0801A14A
_0801898C:
	ldr r1, _080189AC
	adds r1, r2, r1
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 13
	orrs r0, r2
	str r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x10
_0801899E:
	orrs r0, r1
	strb r0, [r3]
	bl _0801A14A
	.align 2, 0
_080189A8: .4byte gUnknown_02024D68
_080189AC: .4byte gUnknown_02024C98
_080189B0:
	movs r6, 0
	ldrb r5, [r5]
	cmp r6, r5
	bcc _080189BC
	bl _0801A14A
_080189BC:
	adds r0, r6, 0
	bl castform_switch
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	beq _080189D0
	bl _08019FE8
_080189D0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080189E4
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080189BC
	bl _0801A14A
	.align 2, 0
_080189E4: .4byte gUnknown_02024A68
_080189E8:
	ldr r2, _08018A18
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r4, r1, r2
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	bne _080189FC
	bl _0801A14A
_080189FC:
	ldr r0, _08018A1C
	mov r3, r10
	strb r3, [r0]
	mov r3, r8
	ldrb r5, [r3]
	cmp r5, 0x2C
	beq _08018A2E
	cmp r5, 0x2C
	bgt _08018A20
	cmp r5, 0x3
	bne _08018A14
	b _08018B8C
_08018A14:
	bl _0801A14A
	.align 2, 0
_08018A18: .4byte gBattleMons
_08018A1C: .4byte gUnknown_02024C07
_08018A20:
	cmp r5, 0x36
	bne _08018A26
	b _08018BEC
_08018A26:
	cmp r5, 0x3D
	beq _08018AB0
	bl _0801A14A
_08018A2E:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08018A4A
	bl _0801A14A
_08018A4A:
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08018A62
	bl _0801A14A
_08018A62:
	ldr r0, _08018AA4
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08018A72
	bl _0801A14A
_08018A72:
	ldrh r0, [r4, 0x2C]
	ldrh r1, [r4, 0x28]
	cmp r0, r1
	bhi _08018A7E
	bl _0801A14A
_08018A7E:
	mov r2, r8
	strb r5, [r2]
	ldr r0, _08018AA8
	bl b_push_move_exec
	ldr r1, _08018AAC
	ldrh r0, [r4, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08018A98
	movs r0, 0x1
	str r0, [r1]
_08018A98:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	bl _0801A0F6
	.align 2, 0
_08018AA4: .4byte word_2024DB8
_08018AA8: .4byte gUnknown_081D9730
_08018AAC: .4byte gUnknown_02024BEC
_08018AB0:
	adds r0, r2, 0
	adds r0, 0x4C
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _08018AC0
	bl _0801A14A
_08018AC0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08018ADA
	bl _0801A14A
_08018ADA:
	ldr r0, [r5]
	movs r1, 0x88
	ands r0, r1
	cmp r0, 0
	beq _08018AEC
	ldr r0, _08018B64
	ldr r1, _08018B68
	bl StringCopy
_08018AEC:
	ldr r0, [r5]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08018AFE
	ldr r0, _08018B64
	ldr r1, _08018B6C
	bl StringCopy
_08018AFE:
	ldr r0, [r5]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08018B10
	ldr r0, _08018B64
	ldr r1, _08018B70
	bl StringCopy
_08018B10:
	ldr r0, [r5]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08018B22
	ldr r0, _08018B64
	ldr r1, _08018B74
	bl StringCopy
_08018B22:
	ldr r0, [r5]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08018B34
	ldr r0, _08018B64
	ldr r1, _08018B78
	bl StringCopy
_08018B34:
	str r4, [r5]
	ldr r0, _08018B7C
	ldr r4, _08018B80
	mov r3, r10
	strb r3, [r4]
	ldr r1, _08018B84
	adds r0, r1
	strb r3, [r0]
	ldr r0, _08018B88
	bl b_push_move_exec
	str r5, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	bl _0801A0F6
	.align 2, 0
_08018B64: .4byte gUnknown_030041C0
_08018B68: .4byte gStatusConditionString_PoisonJpn
_08018B6C: .4byte gStatusConditionString_SleepJpn
_08018B70: .4byte gStatusConditionString_ParalysisJpn
_08018B74: .4byte gStatusConditionString_BurnJpn
_08018B78: .4byte gStatusConditionString_IceJpn
_08018B7C: .4byte 0x02000000
_08018B80: .4byte gUnknown_02024A60
_08018B84: .4byte 0x00016003
_08018B88: .4byte gUnknown_081D9758
_08018B8C:
	ldrb r2, [r4, 0x1B]
	movs r0, 0x1B
	ldrsb r0, [r4, r0]
	cmp r0, 0xB
	ble _08018B9A
	bl _0801A14A
_08018B9A:
	ldr r0, _08018BD8
	mov r3, r10
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x16]
	cmp r0, 0x2
	bne _08018BB0
	bl _0801A14A
_08018BB0:
	adds r0, r2, 0x1
	movs r2, 0
	strb r0, [r4, 0x1B]
	ldr r5, _08018BDC
	adds r1, r7, r5
	movs r0, 0x11
	strb r0, [r1]
	ldr r1, _08018BE0
	adds r0, r7, r1
	strb r2, [r0]
	ldr r0, _08018BE4
	bl b_push_move_exec
	ldr r2, _08018BE8
	adds r0, r7, r2
	mov r3, r10
	strb r3, [r0]
	bl _0801A0F6
	.align 2, 0
_08018BD8: .4byte gUnknown_02024CA8
_08018BDC: .4byte 0x000160a4
_08018BE0: .4byte 0x000160a5
_08018BE4: .4byte gUnknown_081D9718
_08018BE8: .4byte 0x00016003
_08018BEC:
	ldr r2, _08018C10
	ldrb r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x18]
	lsls r0, r3, 31
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x18]
	bl _0801A14A
	.align 2, 0
_08018C10: .4byte gUnknown_02024CA8
_08018C14:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0x2B
	beq _08018C20
	bl _0801A14A
_08018C20:
	movs r4, 0
	ldr r0, _08018C90
	ldrh r2, [r0]
	ldr r5, _08018C94
	adds r1, r0, 0
	cmp r2, r5
	bne _08018C32
	bl _0801A14A
_08018C32:
	cmp r2, r3
	beq _08018C4A
	adds r2, r1, 0
_08018C38:
	adds r2, 0x2
	adds r4, 0x1
	ldrh r0, [r2]
	cmp r0, r5
	bne _08018C46
	bl _0801A14A
_08018C46:
	cmp r0, r3
	bne _08018C38
_08018C4A:
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08018C94
	cmp r1, r0
	bne _08018C5A
	bl _0801A14A
_08018C5A:
	ldr r1, _08018C98
	ldr r0, _08018C9C
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _08018C80
	ldr r0, _08018CA0
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 4
	orrs r1, r2
	str r1, [r0]
_08018C80:
	ldr r1, _08018CA4
	ldr r0, _08018CA8
	str r0, [r1]
	movs r0, 0x1
	mov r9, r0
	bl _0801A150
	.align 2, 0
_08018C90: .4byte gUnknown_081FA724
_08018C94: .4byte 0x0000ffff
_08018C98: .4byte gBattleMons
_08018C9C: .4byte gUnknown_02024C07
_08018CA0: .4byte gUnknown_02024C6C
_08018CA4: .4byte gUnknown_02024C10
_08018CA8: .4byte gUnknown_081D98F3
_08018CAC:
	cmp r3, 0
	bne _08018CB4
	bl _0801A14A
_08018CB4:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0xB
	beq _08018D24
	cmp r0, 0xB
	bgt _08018CC6
	cmp r0, 0xA
	beq _08018CCC
	b _08018E3E
_08018CC6:
	cmp r0, 0x12
	beq _08018D7C
	b _08018E3E
_08018CCC:
	cmp r4, 0xD
	beq _08018CD2
	b _08018E3E
_08018CD2:
	ldr r0, _08018CFC
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08018CE4
	b _08018E3E
_08018CE4:
	ldr r1, _08018D00
	ldr r0, _08018D04
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018D10
	ldr r1, _08018D08
	ldr r0, _08018D0C
	b _08018D14
	.align 2, 0
_08018CFC: .4byte gBattleMoves
_08018D00: .4byte gUnknown_02024D28
_08018D04: .4byte gUnknown_02024C07
_08018D08: .4byte gUnknown_02024C10
_08018D0C: .4byte gUnknown_081D9843
_08018D10:
	ldr r1, _08018D1C
	ldr r0, _08018D20
_08018D14:
	str r0, [r1]
	movs r2, 0x1
	b _08018E3C
	.align 2, 0
_08018D1C: .4byte gUnknown_02024C10
_08018D20: .4byte gUnknown_081D9842
_08018D24:
	cmp r4, 0xB
	beq _08018D2A
	b _08018E3E
_08018D2A:
	ldr r0, _08018D54
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08018D3C
	b _08018E3E
_08018D3C:
	ldr r1, _08018D58
	ldr r0, _08018D5C
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018D68
	ldr r1, _08018D60
	ldr r0, _08018D64
	b _08018D6C
	.align 2, 0
_08018D54: .4byte gBattleMoves
_08018D58: .4byte gUnknown_02024D28
_08018D5C: .4byte gUnknown_02024C07
_08018D60: .4byte gUnknown_02024C10
_08018D64: .4byte gUnknown_081D9843
_08018D68:
	ldr r1, _08018D74
	ldr r0, _08018D78
_08018D6C:
	str r0, [r1]
	movs r3, 0x1
	mov r9, r3
	b _08018E3E
	.align 2, 0
_08018D74: .4byte gUnknown_02024C10
_08018D78: .4byte gUnknown_081D9842
_08018D7C:
	cmp r4, 0xA
	bne _08018E3E
	ldr r1, _08018DC8
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08018E3E
	ldr r2, _08018DCC
	mov r0, r10
	lsls r1, r0, 2
	adds r0, r1, r2
	ldr r3, [r0]
	movs r4, 0x1
	ands r3, r4
	adds r5, r1, 0
	cmp r3, 0
	bne _08018E04
	ldr r0, _08018DD0
	strb r3, [r0, 0x5]
	ldr r1, _08018DD4
	ldr r0, _08018DD8
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018DE4
	ldr r1, _08018DDC
	ldr r0, _08018DE0
	b _08018DE8
	.align 2, 0
_08018DC8: .4byte gBattleMons
_08018DCC: .4byte 0x02017100
_08018DD0: .4byte gUnknown_02024D1E
_08018DD4: .4byte gUnknown_02024D28
_08018DD8: .4byte gUnknown_02024C07
_08018DDC: .4byte gUnknown_02024C10
_08018DE0: .4byte gUnknown_081D987C
_08018DE4:
	ldr r1, _08018DFC
	ldr r0, _08018E00
_08018DE8:
	str r0, [r1]
	adds r0, r5, r2
	ldr r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	str r1, [r0]
	movs r1, 0x2
	mov r9, r1
	b _08018E3E
	.align 2, 0
_08018DFC: .4byte gUnknown_02024C10
_08018E00: .4byte gUnknown_081D987B
_08018E04:
	ldr r0, _08018E20
	strb r4, [r0, 0x5]
	ldr r1, _08018E24
	ldr r0, _08018E28
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018E34
	ldr r1, _08018E2C
	ldr r0, _08018E30
	b _08018E38
	.align 2, 0
_08018E20: .4byte gUnknown_02024D1E
_08018E24: .4byte gUnknown_02024D28
_08018E28: .4byte gUnknown_02024C07
_08018E2C: .4byte gUnknown_02024C10
_08018E30: .4byte gUnknown_081D987C
_08018E34:
	ldr r1, _08018E78
	ldr r0, _08018E7C
_08018E38:
	str r0, [r1]
	movs r2, 0x2
_08018E3C:
	mov r9, r2
_08018E3E:
	mov r3, r9
	cmp r3, 0x1
	beq _08018E48
	bl _0801A14A
_08018E48:
	ldr r1, _08018E80
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r1, r0, r1
	ldrh r0, [r1, 0x2C]
	ldrh r2, [r1, 0x28]
	cmp r0, r2
	bne _08018EA4
	ldr r1, _08018E84
	ldr r0, _08018E88
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 28
	cmp r0, 0
	bge _08018E90
	ldr r1, _08018E78
	ldr r0, _08018E8C
	str r0, [r1]
	bl _0801A14A
	.align 2, 0
_08018E78: .4byte gUnknown_02024C10
_08018E7C: .4byte gUnknown_081D987B
_08018E80: .4byte gBattleMons
_08018E84: .4byte gUnknown_02024D28
_08018E88: .4byte gUnknown_02024C07
_08018E8C: .4byte gUnknown_081D9866
_08018E90:
	ldr r1, _08018E9C
	ldr r0, _08018EA0
	str r0, [r1]
	bl _0801A14A
	.align 2, 0
_08018E9C: .4byte gUnknown_02024C10
_08018EA0: .4byte gUnknown_081D9865
_08018EA4:
	ldr r2, _08018EC0
	ldrh r0, [r1, 0x2C]
	lsrs r0, 2
	str r0, [r2]
	cmp r0, 0
	bne _08018EB4
	mov r3, r9
	str r3, [r2]
_08018EB4:
	ldr r0, [r2]
	negs r0, r0
	str r0, [r2]
	bl _0801A14A
	.align 2, 0
_08018EC0: .4byte gUnknown_02024BEC
_08018EC4:
	mov r5, r8
	ldrb r0, [r5]
	subs r0, 0x9
	cmp r0, 0x2F
	bls _08018ED2
	bl _0801A14A
_08018ED2:
	lsls r0, 2
	ldr r1, _08018EDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018EDC: .4byte _08018EE0
	.align 2, 0
_08018EE0:
	.4byte _080192FC
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _08018FA0
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _08019068
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _08019128
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _08019220
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _080193D8
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _0801A14A
	.4byte _080194B4
_08018FA0:
	ldr r0, _08019048
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08018FB0
	bl _0801A14A
_08018FB0:
	cmp r3, 0xA5
	bne _08018FB8
	bl _0801A14A
_08018FB8:
	ldr r0, _0801904C
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08018FCC
	bl _0801A14A
_08018FCC:
	ldr r2, _08019050
	ldr r0, _08019054
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018FF4
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08018FF4
	bl _0801A14A
_08018FF4:
	ldr r1, _08019058
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r1, r0, r1
	adds r3, r1, 0
	adds r3, 0x21
	ldrb r0, [r3]
	cmp r0, r4
	bne _0801900E
	bl _0801A14A
_0801900E:
	adds r2, r1, 0
	adds r2, 0x22
	ldrb r0, [r2]
	cmp r0, r4
	bne _0801901C
	bl _0801A14A
_0801901C:
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	bne _08019026
	bl _0801A14A
_08019026:
	strb r4, [r3]
	strb r4, [r2]
	ldr r1, _0801905C
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019060
	ldr r0, _08019064
	str r0, [r1]
	bl _0801A0F6
	.align 2, 0
_08019048: .4byte gUnknown_02024C68
_0801904C: .4byte gBattleMoves
_08019050: .4byte gUnknown_02024D68
_08019054: .4byte gUnknown_02024C08
_08019058: .4byte gBattleMons
_0801905C: .4byte gUnknown_030041C0
_08019060: .4byte gUnknown_02024C10
_08019064: .4byte gUnknown_081D9921
_08019068:
	ldr r0, _08019100
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08019078
	bl _0801A14A
_08019078:
	ldr r1, _08019104
	ldr r0, _08019108
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r4, r0, r1
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	bne _0801908E
	bl _0801A14A
_0801908E:
	ldr r0, _0801910C
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _080190A0
	bl _0801A14A
_080190A0:
	ldr r2, _08019110
	ldr r0, _08019114
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _080190C8
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _080190C8
	bl _0801A14A
_080190C8:
	ldr r1, _08019118
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080190E2
	bl _0801A14A
_080190E2:
	ldr r1, _0801911C
	ldrh r0, [r4, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _080190F0
	str r2, [r1]
_080190F0:
	bl b_movescr_stack_push_cursor
	ldr r1, _08019120
	ldr r0, _08019124
	str r0, [r1]
	bl _0801A0F6
	.align 2, 0
_08019100: .4byte gUnknown_02024C68
_08019104: .4byte gBattleMons
_08019108: .4byte gUnknown_02024C07
_0801910C: .4byte gUnknown_02024D28
_08019110: .4byte gUnknown_02024D68
_08019114: .4byte gUnknown_02024C08
_08019118: .4byte gBattleMoves
_0801911C: .4byte gUnknown_02024BEC
_08019120: .4byte gUnknown_02024C10
_08019124: .4byte gUnknown_081D9928
_08019128:
	ldr r0, _080191F4
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08019138
	bl _0801A14A
_08019138:
	ldr r1, _080191F8
	ldr r0, _080191FC
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801914E
	bl _0801A14A
_0801914E:
	ldr r0, _08019200
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08019160
	bl _0801A14A
_08019160:
	ldr r2, _08019204
	ldr r0, _08019208
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019188
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019188
	bl _0801A14A
_08019188:
	ldr r1, _0801920C
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080191A0
	bl _0801A14A
_080191A0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _080191B8
	bl _0801A14A
_080191B8:
	ldr r5, _08019210
	movs r4, 0x3
_080191BC:
	bl Random
	ands r0, r4
	strb r0, [r5, 0x3]
	cmp r0, 0
	beq _080191BC
	ldr r1, _08019210
	ldrb r0, [r1, 0x3]
	cmp r0, 0x3
	bne _080191D4
	adds r0, 0x2
	strb r0, [r1, 0x3]
_080191D4:
	ldrb r0, [r1, 0x3]
	adds r0, 0x40
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019214
	ldr r0, _08019218
	str r0, [r1]
	ldr r2, _0801921C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801A0F6
	.align 2, 0
_080191F4: .4byte gUnknown_02024C68
_080191F8: .4byte gBattleMons
_080191FC: .4byte gUnknown_02024C07
_08019200: .4byte gUnknown_02024D28
_08019204: .4byte gUnknown_02024D68
_08019208: .4byte gUnknown_02024C08
_0801920C: .4byte gBattleMoves
_08019210: .4byte gUnknown_02024D1E
_08019214: .4byte gUnknown_02024C10
_08019218: .4byte gUnknown_081D9950
_0801921C: .4byte gUnknown_02024C6C
_08019220:
	ldr r0, _080192D0
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08019230
	bl _0801A14A
_08019230:
	ldr r1, _080192D4
	ldr r0, _080192D8
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08019246
	bl _0801A14A
_08019246:
	ldr r0, _080192DC
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08019258
	bl _0801A14A
_08019258:
	ldr r2, _080192E0
	ldr r0, _080192E4
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019280
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019280
	bl _0801A14A
_08019280:
	ldr r1, _080192E8
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019298
	bl _0801A14A
_08019298:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _080192B0
	bl _0801A14A
_080192B0:
	ldr r1, _080192EC
	movs r0, 0x42
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _080192F0
	ldr r0, _080192F4
	str r0, [r1]
	ldr r2, _080192F8
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801A0F6
	.align 2, 0
_080192D0: .4byte gUnknown_02024C68
_080192D4: .4byte gBattleMons
_080192D8: .4byte gUnknown_02024C07
_080192DC: .4byte gUnknown_02024D28
_080192E0: .4byte gUnknown_02024D68
_080192E4: .4byte gUnknown_02024C08
_080192E8: .4byte gBattleMoves
_080192EC: .4byte gUnknown_02024D1E
_080192F0: .4byte gUnknown_02024C10
_080192F4: .4byte gUnknown_081D9950
_080192F8: .4byte gUnknown_02024C6C
_080192FC:
	ldr r0, _080193AC
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801930C
	bl _0801A14A
_0801930C:
	ldr r1, _080193B0
	ldr r0, _080193B4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08019322
	bl _0801A14A
_08019322:
	ldr r0, _080193B8
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08019334
	bl _0801A14A
_08019334:
	ldr r2, _080193BC
	ldr r0, _080193C0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801935C
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801935C
	bl _0801A14A
_0801935C:
	ldr r1, _080193C4
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019374
	bl _0801A14A
_08019374:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0801938C
	bl _0801A14A
_0801938C:
	ldr r1, _080193C8
	movs r0, 0x45
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _080193CC
	ldr r0, _080193D0
	str r0, [r1]
	ldr r2, _080193D4
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801A0F6
	.align 2, 0
_080193AC: .4byte gUnknown_02024C68
_080193B0: .4byte gBattleMons
_080193B4: .4byte gUnknown_02024C07
_080193B8: .4byte gUnknown_02024D28
_080193BC: .4byte gUnknown_02024D68
_080193C0: .4byte gUnknown_02024C08
_080193C4: .4byte gBattleMoves
_080193C8: .4byte gUnknown_02024D1E
_080193CC: .4byte gUnknown_02024C10
_080193D0: .4byte gUnknown_081D9950
_080193D4: .4byte gUnknown_02024C6C
_080193D8:
	ldr r0, _08019488
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _080193E8
	bl _0801A14A
_080193E8:
	ldr r1, _0801948C
	ldr r0, _08019490
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080193FE
	bl _0801A14A
_080193FE:
	ldr r0, _08019494
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _08019410
	bl _0801A14A
_08019410:
	ldr r1, _08019498
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019428
	bl _0801A14A
_08019428:
	ldr r2, _0801949C
	ldr r0, _080194A0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019450
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019450
	bl _0801A14A
_08019450:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08019468
	bl _0801A14A
_08019468:
	ldr r1, _080194A4
	movs r0, 0x43
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	ldr r1, _080194A8
	ldr r0, _080194AC
	str r0, [r1]
	ldr r2, _080194B0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r2]
	bl _0801A0F6
	.align 2, 0
_08019488: .4byte gUnknown_02024C68
_0801948C: .4byte gBattleMons
_08019490: .4byte gUnknown_02024C07
_08019494: .4byte gUnknown_02024D28
_08019498: .4byte gBattleMoves
_0801949C: .4byte gUnknown_02024D68
_080194A0: .4byte gUnknown_02024C08
_080194A4: .4byte gUnknown_02024D1E
_080194A8: .4byte gUnknown_02024C10
_080194AC: .4byte gUnknown_081D9950
_080194B0: .4byte gUnknown_02024C6C
_080194B4:
	ldr r0, _080195F4
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _080194C4
	bl _0801A14A
_080194C4:
	ldr r5, _080195F8
	ldr r7, _080195FC
	ldrb r1, [r7]
	movs r6, 0x58
	adds r0, r1, 0
	muls r0, r6
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _080194DC
	bl _0801A14A
_080194DC:
	ldr r0, _08019600
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 31
	cmp r0, 0
	beq _080194EE
	bl _0801A14A
_080194EE:
	ldr r1, _08019604
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08019506
	bl _0801A14A
_08019506:
	ldr r3, _08019608
	ldr r0, _0801960C
	mov r8, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r2, r0, 2
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019530
	adds r0, r3, 0
	adds r0, 0xC
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08019530
	bl _0801A14A
_08019530:
	adds r0, r1, 0
	muls r0, r6
	adds r0, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08019540
	bl _0801A14A
_08019540:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _08019558
	bl _0801A14A
_08019558:
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0xC
	bne _0801956A
	bl _0801A14A
_0801956A:
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	bl GetGenderFromSpeciesAndPersonality
	adds r4, r0, 0
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08019588
	bl _0801A14A
_08019588:
	ldrb r0, [r7]
	muls r0, r6
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080195A2
	bl _0801A14A
_080195A2:
	ldr r0, [sp, 0x8]
	ldr r1, [sp, 0x10]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080195B6
	bl _0801A14A
_080195B6:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x14]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080195CA
	bl _0801A14A
_080195CA:
	ldrb r0, [r7]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r1, _08019610
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 16
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019614
	ldr r0, _08019618
	str r0, [r1]
	bl _0801A0F6
	.align 2, 0
_080195F4: .4byte gUnknown_02024C68
_080195F8: .4byte gBattleMons
_080195FC: .4byte gUnknown_02024C07
_08019600: .4byte gUnknown_02024D28
_08019604: .4byte gBattleMoves
_08019608: .4byte gUnknown_02024D68
_0801960C: .4byte gUnknown_02024C08
_08019610: .4byte gBitTable
_08019614: .4byte gUnknown_02024C10
_08019618: .4byte gUnknown_081D9943
_0801961C:
	movs r5, 0
	mov r10, r5
	ldr r0, _08019650
	ldrb r0, [r0]
	cmp r10, r0
	bcc _0801962C
	bl _0801A14A
_0801962C:
	ldr r1, _08019654
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	subs r0, 0x7
	adds r2, r1, 0
	cmp r0, 0x41
	bls _08019646
	b _080198AA
_08019646:
	lsls r0, 2
	ldr r1, _08019658
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019650: .4byte gUnknown_02024A68
_08019654: .4byte gBattleMons
_08019658: .4byte _0801965C
	.align 2, 0
_0801965C:
	.4byte _080197C0
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _08019884
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080197E8
	.4byte _080198AA
	.4byte _08019764
	.4byte _080198AA
	.4byte _080198AA
	.4byte _08019790
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _08019854
	.4byte _08019824
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080198AA
	.4byte _080197E8
_08019764:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08019784
	ands r0, r1
	cmp r0, 0
	bne _0801977E
	b _080198AA
_0801977E:
	ldr r0, _08019788
	ldr r1, _0801978C
	b _08019870
	.align 2, 0
_08019784: .4byte 0x00000f88
_08019788: .4byte gUnknown_030041C0
_0801978C: .4byte gStatusConditionString_PoisonJpn
_08019790:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _080197AA
	b _080198AA
_080197AA:
	ldr r0, _080197B8
	ldr r1, _080197BC
	bl StringCopy
	movs r2, 0x2
	mov r9, r2
	b _080198B0
	.align 2, 0
_080197B8: .4byte gUnknown_030041C0
_080197BC: .4byte gStatusConditionString_ConfusionJpn
_080197C0:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080198AA
	ldr r0, _080197E0
	ldr r1, _080197E4
	b _08019870
	.align 2, 0
_080197E0: .4byte gUnknown_030041C0
_080197E4: .4byte gStatusConditionString_ParalysisJpn
_080197E8:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080198AA
	adds r2, 0x50
	adds r2, r3, r2
	ldr r0, [r2]
	ldr r1, _08019818
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801981C
	ldr r1, _08019820
	bl StringCopy
	movs r0, 0x1
	mov r9, r0
	b _080198B0
	.align 2, 0
_08019818: .4byte 0xf7ffffff
_0801981C: .4byte gUnknown_030041C0
_08019820: .4byte gStatusConditionString_SleepJpn
_08019824:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080198AA
	ldr r0, _0801984C
	ldr r1, _08019850
	bl StringCopy
	movs r2, 0x1
	mov r9, r2
	b _080198B0
	.align 2, 0
_0801984C: .4byte gUnknown_030041C0
_08019850: .4byte gStatusConditionString_BurnJpn
_08019854:
	movs r0, 0x58
	mov r3, r10
	muls r3, r0
	adds r0, r3, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080198AA
	ldr r0, _0801987C
	ldr r1, _08019880
_08019870:
	bl StringCopy
	movs r5, 0x1
	mov r9, r5
	b _080198B0
	.align 2, 0
_0801987C: .4byte gUnknown_030041C0
_08019880: .4byte gStatusConditionString_IceJpn
_08019884:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	beq _080198AA
	ldr r0, _080198C0
	ldr r1, _080198C4
	bl StringCopy
	movs r2, 0x3
	mov r9, r2
_080198AA:
	mov r3, r9
	cmp r3, 0
	beq _0801996C
_080198B0:
	mov r5, r9
	cmp r5, 0x2
	beq _080198E4
	cmp r5, 0x2
	bgt _080198C8
	cmp r5, 0x1
	beq _080198D0
	b _08019910
	.align 2, 0
_080198C0: .4byte gUnknown_030041C0
_080198C4: .4byte gStatusConditionString_LoveJpn
_080198C8:
	mov r0, r9
	cmp r0, 0x3
	beq _080198FC
	b _08019910
_080198D0:
	ldr r1, _080198E0
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x4C
	adds r2, r1
	movs r0, 0
	b _0801990E
	.align 2, 0
_080198E0: .4byte gBattleMons
_080198E4:
	ldr r1, _080198F8
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x8
	negs r1, r1
	b _0801990C
	.align 2, 0
_080198F8: .4byte gBattleMons
_080198FC:
	ldr r1, _0801994C
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _08019950
_0801990C:
	ands r0, r1
_0801990E:
	str r0, [r2]
_08019910:
	bl b_movescr_stack_push_cursor
	ldr r1, _08019954
	ldr r0, _08019958
	str r0, [r1]
	ldr r0, _0801995C
	ldr r1, _08019960
	adds r0, r1
	mov r2, r10
	strb r2, [r0]
	ldr r4, _08019964
	strb r2, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _08019968
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	bl _0801A166
	.align 2, 0
_0801994C: .4byte gBattleMons
_08019950: .4byte 0xfff0ffff
_08019954: .4byte gUnknown_02024C10
_08019958: .4byte gUnknown_081D9956
_0801995C: .4byte 0x02000000
_08019960: .4byte 0x00016003
_08019964: .4byte gUnknown_02024A60
_08019968: .4byte gUnknown_02024ACC
_0801996C:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08019984
	ldrb r0, [r0]
	cmp r10, r0
	bcs _08019980
	b _0801962C
_08019980:
	bl _0801A14A
	.align 2, 0
_08019984: .4byte gUnknown_02024A68
_08019988:
	movs r3, 0
	mov r10, r3
	ldr r0, _080199D0
	ldrb r0, [r0]
	cmp r10, r0
	bcc _08019996
	b _0801A14A
_08019996:
	ldr r4, _080199D4
_08019998:
	movs r0, 0x58
	mov r5, r10
	muls r5, r0
	adds r0, r5, 0
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3B
	bne _080199BC
	mov r0, r10
	bl castform_switch
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r0, 0
	beq _080199BC
	b _0801A014
_080199BC:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080199D0
	ldrb r0, [r0]
	cmp r10, r0
	bcc _08019998
	b _0801A14A
	.align 2, 0
_080199D0: .4byte gUnknown_02024A68
_080199D4: .4byte gBattleMons
_080199D8:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x1C
	beq _080199E2
	b _0801A14A
_080199E2:
	ldr r4, _08019A34
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _080199F2
	b _0801A14A
_080199F2:
	ldr r0, _08019A38
	ands r1, r0
	str r1, [r4]
	ldr r3, _08019A3C
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	cmp r0, 0x6
	bne _08019A0C
	movs r0, 0x2
	strb r0, [r2]
_08019A0C:
	ldr r1, _08019A40
	ldrb r0, [r2]
	adds r0, 0x40
	strb r0, [r1, 0x3]
	ldr r0, _08019A44
	ldrb r1, [r0]
	ldr r5, _08019A48
	adds r0, r7, r5
	strb r1, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019A4C
	ldr r0, _08019A50
	str r0, [r1]
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r4]
	b _0801A0F6
	.align 2, 0
_08019A34: .4byte gUnknown_02024C6C
_08019A38: .4byte 0xffffbfff
_08019A3C: .4byte 0x000160ca
_08019A40: .4byte gUnknown_02024D1E
_08019A44: .4byte gUnknown_02024C08
_08019A48: .4byte 0x00016003
_08019A4C: .4byte gUnknown_02024C10
_08019A50: .4byte gUnknown_081D9953
_08019A54:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x1C
	beq _08019A5E
	b _0801A14A
_08019A5E:
	ldr r4, _08019AB0
	ldr r1, [r4]
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _08019A6E
	b _0801A14A
_08019A6E:
	ldr r0, _08019AB4
	ands r1, r0
	str r1, [r4]
	ldr r3, _08019AB8
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	cmp r0, 0x6
	bne _08019A88
	movs r0, 0x2
	strb r0, [r2]
_08019A88:
	ldr r1, _08019ABC
	ldrb r0, [r2]
	strb r0, [r1, 0x3]
	ldr r0, _08019AC0
	ldrb r1, [r0]
	ldr r5, _08019AC4
	adds r0, r7, r5
	strb r1, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _08019AC8
	ldr r0, _08019ACC
	str r0, [r1]
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	str r0, [r4]
	b _0801A0F6
	.align 2, 0
_08019AB0: .4byte gUnknown_02024C6C
_08019AB4: .4byte 0xffffbfff
_08019AB8: .4byte 0x000160ca
_08019ABC: .4byte gUnknown_02024D1E
_08019AC0: .4byte gUnknown_02024C07
_08019AC4: .4byte 0x00016003
_08019AC8: .4byte gUnknown_02024C10
_08019ACC: .4byte gUnknown_081D9953
_08019AD0:
	movs r4, 0
	ldr r0, _08019B08
	ldrb r1, [r0]
	cmp r4, r1
	blt _08019ADC
	b _0801A14A
_08019ADC:
	ldr r0, _08019B0C
	adds r5, r1, 0
	ldr r2, _08019B10
	adds r3, r0, 0
	adds r3, 0x20
	movs r6, 0x80
	lsls r6, 12
_08019AEA:
	ldrb r1, [r3]
	cmp r1, 0x16
	bne _08019AFA
	ldr r0, [r2]
	ands r0, r6
	cmp r0, 0
	beq _08019AFA
	b _0801A040
_08019AFA:
	adds r2, 0x4
	adds r3, 0x58
	adds r4, 0x1
	cmp r4, r5
	blt _08019AEA
	b _0801A14A
	.align 2, 0
_08019B08: .4byte gUnknown_02024A68
_08019B0C: .4byte gBattleMons
_08019B10: .4byte gUnknown_02024C98
_08019B14:
	movs r4, 0
	ldr r0, _08019BF0
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019B20
	b _0801A14A
_08019B20:
	ldr r0, _08019BF4
	mov r8, r0
	ldr r1, _08019BF8
	adds r1, 0x20
	str r1, [sp, 0x1C]
	movs r2, 0
	str r2, [sp, 0x20]
_08019B2E:
	ldr r3, [sp, 0x1C]
	ldrb r0, [r3]
	cmp r0, 0x24
	beq _08019B38
	b _08019CCA
_08019B38:
	ldr r0, _08019BFC
	ldr r5, [sp, 0x20]
	adds r0, r5, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 13
	ands r1, r0
	str r5, [sp, 0x18]
	cmp r1, 0
	bne _08019B4E
	b _08019CCA
_08019B4E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	movs r1, 0x1
	adds r5, r0, 0
	eors r5, r1
	ands r5, r1
	adds r0, r5, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08019C00
	ldrh r1, [r0]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08019B82
	b _08019C90
_08019B82:
	movs r1, 0x58
	adds r0, r6, 0
	muls r0, r1
	ldr r3, _08019BF8
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019C4C
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019C08
	movs r1, 0x58
	adds r0, r7, 0
	muls r0, r1
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019C08
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019C08
	str r2, [sp, 0x24]
	bl Random
	ldr r2, [sp, 0x24]
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 1
	orrs r5, r1
	adds r0, r5, 0
	bl battle_get_side_with_given_state
	mov r2, r8
	strb r0, [r2]
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	ldr r5, _08019BF8
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	ldrb r0, [r2]
	muls r0, r3
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	ldr r2, _08019C04
	strb r0, [r2]
	b _08019CB8
	.align 2, 0
_08019BF0: .4byte gUnknown_02024A68
_08019BF4: .4byte gUnknown_02024A60
_08019BF8: .4byte gBattleMons
_08019BFC: .4byte gUnknown_02024C98
_08019C00: .4byte gUnknown_020239F8
_08019C04: .4byte byte_2024C06
_08019C08:
	ldr r3, _08019C48
	movs r2, 0x58
	adds r0, r6, 0
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019C4C
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019C4C
	mov r5, r8
	strb r6, [r5]
	adds r1, r4, 0
	muls r1, r2
	adds r1, r3
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	b _08019CB4
	.align 2, 0
_08019C48: .4byte gBattleMons
_08019C4C:
	ldr r3, _08019C8C
	movs r2, 0x58
	adds r0, r7, 0
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _08019CC2
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019CC2
	mov r5, r8
	strb r7, [r5]
	adds r1, r4, 0
	muls r1, r2
	adds r1, r3
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	b _08019CB4
	.align 2, 0
_08019C8C: .4byte gBattleMons
_08019C90:
	mov r2, r8
	strb r6, [r2]
	movs r3, 0x58
	adds r0, r6, 0
	muls r0, r3
	ldr r5, _08019CE4
	adds r0, r5
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r1, [r2]
	cmp r1, 0
	beq _08019CC2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08019CC2
	ldr r0, [sp, 0x1C]
	strb r1, [r0]
	ldrb r0, [r2]
_08019CB4:
	ldr r1, _08019CE8
	strb r0, [r1]
_08019CB8:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019CC2:
	mov r2, r9
	cmp r2, 0
	beq _08019CCA
	b _0801A05C
_08019CCA:
	ldr r3, [sp, 0x1C]
	adds r3, 0x58
	str r3, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	adds r5, 0x4
	str r5, [sp, 0x20]
	adds r4, 0x1
	ldr r0, _08019CEC
	ldrb r0, [r0]
	cmp r4, r0
	bge _08019CE2
	b _08019B2E
_08019CE2:
	b _0801A14A
	.align 2, 0
_08019CE4: .4byte gBattleMons
_08019CE8: .4byte byte_2024C06
_08019CEC: .4byte gUnknown_02024A68
_08019CF0:
	movs r4, 0
	ldr r0, _08019D28
	ldrb r1, [r0]
	cmp r4, r1
	blt _08019CFC
	b _0801A14A
_08019CFC:
	ldr r0, _08019D2C
	adds r5, r1, 0
	ldr r2, _08019D30
	adds r3, r0, 0
	adds r3, 0x20
	movs r6, 0x80
	lsls r6, 12
_08019D0A:
	ldrb r1, [r3]
	cmp r1, 0x16
	bne _08019D1A
	ldr r0, [r2]
	ands r0, r6
	cmp r0, 0
	beq _08019D1A
	b _0801A0D8
_08019D1A:
	adds r2, 0x4
	adds r3, 0x58
	adds r4, 0x1
	cmp r4, r5
	blt _08019D0A
	b _0801A14A
	.align 2, 0
_08019D28: .4byte gUnknown_02024A68
_08019D2C: .4byte gBattleMons
_08019D30: .4byte gUnknown_02024C98
_08019D34:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019D84
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019D4A
	b _0801A14A
_08019D4A:
	ldr r7, _08019D88
_08019D4C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r0, r5
	beq _08019D76
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019D76
	ldr r0, _08019D8C
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019D76:
	adds r4, r3, 0
	ldr r0, _08019D84
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019D4C
	b _0801A14A
	.align 2, 0
_08019D84: .4byte gUnknown_02024A68
_08019D88: .4byte gBattleMons
_08019D8C: .4byte byte_2024C06
_08019D90:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019DE0
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019DA6
	b _0801A14A
_08019DA6:
	ldr r7, _08019DE4
_08019DA8:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	adds r3, r4, 0x1
	cmp r0, r5
	bne _08019DD2
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019DD2
	ldr r0, _08019DE8
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019DD2:
	adds r4, r3, 0
	ldr r0, _08019DE0
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019DA8
	b _0801A14A
	.align 2, 0
_08019DE0: .4byte gUnknown_02024A68
_08019DE4: .4byte gBattleMons
_08019DE8: .4byte byte_2024C06
_08019DEC:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0xFD
	beq _08019E14
	cmp r0, 0xFE
	beq _08019E4C
	movs r4, 0
	ldr r0, _08019E0C
	adds r5, r0, 0
	ldrb r2, [r5]
	cmp r4, r2
	blt _08019E06
	b _0801A14A
_08019E06:
	ldr r2, _08019E10
	b _08019E84
	.align 2, 0
_08019E0C: .4byte gUnknown_02024A68
_08019E10: .4byte gBattleMons
_08019E14:
	movs r4, 0
	ldr r0, _08019E44
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019E20
	b _0801A14A
_08019E20:
	ldr r5, _08019E48
	movs r2, 0x80
	lsls r2, 9
	adds r1, r0, 0
_08019E28:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	ands r0, r2
	adds r3, r4, 0x1
	cmp r0, 0
	beq _08019E3C
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019E3C:
	adds r4, r3, 0
	cmp r4, r1
	blt _08019E28
	b _0801A14A
	.align 2, 0
_08019E44: .4byte gUnknown_02024A68
_08019E48: .4byte gUnknown_02024C98
_08019E4C:
	movs r4, 0
	ldr r0, _08019E7C
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019E58
	b _0801A14A
_08019E58:
	ldr r5, _08019E80
	movs r2, 0x80
	lsls r2, 10
	adds r1, r0, 0
_08019E60:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	ands r0, r2
	adds r3, r4, 0x1
	cmp r0, 0
	beq _08019E74
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019E74:
	adds r4, r3, 0
	cmp r4, r1
	blt _08019E60
	b _0801A14A
	.align 2, 0
_08019E7C: .4byte gUnknown_02024A68
_08019E80: .4byte gUnknown_02024C98
_08019E84:
	movs r0, 0x58
	muls r0, r4
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r4, 0x1
	cmp r0, r6
	bne _08019E9E
	mov r0, r8
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019E9E:
	adds r4, r3, 0
	ldrb r1, [r5]
	cmp r4, r1
	blt _08019E84
	b _0801A14A
_08019EA8:
	movs r4, 0
	ldr r0, _08019EE4
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019EB4
	b _0801A14A
_08019EB4:
	ldr r7, _08019EE8
	adds r2, r0, 0
	movs r5, 0x58
_08019EBA:
	adds r0, r4, 0
	muls r0, r5
	adds r1, r0, r7
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r4, 0x1
	cmp r0, r6
	bne _08019EDC
	ldrh r0, [r1, 0x28]
	cmp r0, 0
	beq _08019EDC
	mov r0, r8
	strb r6, [r0]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019EDC:
	adds r4, r3, 0
	cmp r4, r2
	blt _08019EBA
	b _0801A14A
	.align 2, 0
_08019EE4: .4byte gUnknown_02024A68
_08019EE8: .4byte gBattleMons
_08019EEC:
	movs r4, 0
	ldr r0, _08019F24
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019EF8
	b _0801A14A
_08019EF8:
	ldr r7, _08019F28
	adds r1, r0, 0
	movs r5, 0x58
	ldr r2, _08019F2C
_08019F00:
	adds r0, r4, 0
	muls r0, r5
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r4, 0x1
	cmp r0, r6
	bne _08019F1C
	cmp r4, r10
	beq _08019F1C
	strb r6, [r2]
	lsls r0, r3, 24
	lsrs r0, 24
	mov r9, r0
_08019F1C:
	adds r4, r3, 0
	cmp r4, r1
	blt _08019F00
	b _0801A14A
	.align 2, 0
_08019F24: .4byte gUnknown_02024A68
_08019F28: .4byte gBattleMons
_08019F2C: .4byte byte_2024C06
_08019F30:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019F80
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019F46
	b _0801A14A
_08019F46:
	ldr r7, _08019F84
_08019F48:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	beq _08019F74
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019F74
	ldr r0, _08019F88
	strb r6, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019F74:
	adds r4, 0x1
	ldr r0, _08019F80
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019F48
	b _0801A14A
	.align 2, 0
_08019F80: .4byte gUnknown_02024A68
_08019F84: .4byte gBattleMons
_08019F88: .4byte byte_2024C06
_08019F8C:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _08019FDC
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019FA2
	b _0801A14A
_08019FA2:
	ldr r7, _08019FE0
_08019FA4:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _08019FD0
	movs r0, 0x58
	muls r0, r4
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r6
	bne _08019FD0
	ldr r0, _08019FE4
	strb r6, [r0]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08019FD0:
	adds r4, 0x1
	ldr r0, _08019FDC
	ldrb r0, [r0]
	cmp r4, r0
	blt _08019FA4
	b _0801A14A
	.align 2, 0
_08019FDC: .4byte gUnknown_02024A68
_08019FE0: .4byte gBattleMons
_08019FE4: .4byte byte_2024C06
_08019FE8:
	ldr r0, _0801A004
	bl b_push_move_exec
	ldr r0, _0801A008
	ldr r2, _0801A00C
	adds r1, r0, r2
	strb r6, [r1]
	mov r1, r9
	subs r1, 0x1
	ldr r3, _0801A010
	adds r0, r3
	strb r1, [r0]
	b _0801A14A
	.align 2, 0
_0801A004: .4byte gUnknown_081D977D
_0801A008: .4byte 0x02000000
_0801A00C: .4byte 0x00016003
_0801A010: .4byte 0x0001609b
_0801A014:
	ldr r0, _0801A030
	bl b_push_move_exec
	ldr r0, _0801A034
	ldr r5, _0801A038
	adds r1, r0, r5
	mov r2, r10
	strb r2, [r1]
	mov r1, r9
	subs r1, 0x1
	ldr r3, _0801A03C
	adds r0, r3
	strb r1, [r0]
	b _0801A166
	.align 2, 0
_0801A030: .4byte gUnknown_081D977D
_0801A034: .4byte 0x02000000
_0801A038: .4byte 0x00016003
_0801A03C: .4byte 0x0001609b
_0801A040:
	mov r5, r8
	strb r1, [r5]
	ldr r0, [r2]
	ldr r1, _0801A054
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801A058
	bl b_push_move_exec
	b _0801A0EE
	.align 2, 0
_0801A054: .4byte 0xfff7ffff
_0801A058: .4byte gUnknown_081D978C
_0801A05C:
	ldr r0, _0801A0B0
	bl b_push_move_exec
	ldr r1, _0801A0B4
	ldr r2, [sp, 0x18]
	adds r1, r2, r1
	ldr r0, [r1]
	ldr r2, _0801A0B8
	ands r0, r2
	str r0, [r1]
	ldr r0, _0801A0BC
	ldr r3, _0801A0C0
	adds r0, r3
	strb r4, [r0]
	ldr r1, _0801A0C4
	movs r4, 0xFD
	strb r4, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r2, _0801A0C8
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _0801A0CC
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0801A0D0
	strb r4, [r1]
	movs r0, 0x9
	strb r0, [r1, 0x1]
	ldr r0, _0801A0D4
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x3]
	b _0801A14A
	.align 2, 0
_0801A0B0: .4byte gUnknown_081D9726
_0801A0B4: .4byte gUnknown_02024C98
_0801A0B8: .4byte 0xffefffff
_0801A0BC: .4byte 0x02000000
_0801A0C0: .4byte 0x00016003
_0801A0C4: .4byte gUnknown_030041C0
_0801A0C8: .4byte gUnknown_02024A60
_0801A0CC: .4byte gUnknown_02024A6A
_0801A0D0: .4byte gUnknown_03004290
_0801A0D4: .4byte byte_2024C06
_0801A0D8:
	mov r5, r8
	strb r1, [r5]
	ldr r0, [r2]
	ldr r1, _0801A104
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801A108
	ldr r0, _0801A10C
	str r0, [r1]
_0801A0EE:
	ldr r0, _0801A110
	ldr r1, _0801A114
	adds r0, r1
	strb r4, [r0]
_0801A0F6:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	b _0801A14A
	.align 2, 0
_0801A104: .4byte 0xfff7ffff
_0801A108: .4byte gUnknown_02024C10
_0801A10C: .4byte gUnknown_081D9795
_0801A110: .4byte 0x02000000
_0801A114: .4byte 0x000160dd
_0801A118:
	movs r4, 0
	ldr r0, _0801A178
	ldrb r1, [r0]
	cmp r4, r1
	bge _0801A14A
	ldr r0, _0801A17C
	adds r2, r1, 0
	adds r1, r0, 0
	adds r1, 0x20
	ldr r3, _0801A180
_0801A12C:
	ldrb r0, [r1]
	cmp r0, r6
	bne _0801A142
	cmp r4, r10
	beq _0801A142
	strb r6, [r3]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_0801A142:
	adds r1, 0x58
	adds r4, 0x1
	cmp r4, r2
	blt _0801A12C
_0801A14A:
	mov r2, r9
	cmp r2, 0
	beq _0801A166
_0801A150:
	ldr r3, [sp, 0x4]
	cmp r3, 0xB
	bhi _0801A166
	ldr r1, _0801A180
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801A166
	adds r1, r0, 0
	mov r0, r10
	bl sub_81074C4
_0801A166:
	mov r0, r9
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801A178: .4byte gUnknown_02024A68
_0801A17C: .4byte gBattleMons
_0801A180: .4byte byte_2024C06
	thumb_func_end sub_8018324

	thumb_func_start b_call_bc_move_exec
b_call_bc_move_exec: @ 801A184
	ldr r1, _0801A1AC
	str r0, [r1]
	ldr r3, _0801A1B0
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r2, _0801A1B4
	ldr r1, [r2]
	str r1, [r0]
	ldr r0, _0801A1B8
	str r0, [r2]
	ldr r1, _0801A1BC
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801A1AC: .4byte gUnknown_02024C10
_0801A1B0: .4byte 0x02017140
_0801A1B4: .4byte gUnknown_030042D4
_0801A1B8: .4byte sub_8013F54
_0801A1BC: .4byte gUnknown_02024A7F
	thumb_func_end b_call_bc_move_exec

	thumb_func_start b_push_move_exec
b_push_move_exec: @ 801A1C0
	push {r4,lr}
	adds r4, r0, 0
	bl b_movescr_stack_push_cursor
	ldr r0, _0801A1F0
	str r4, [r0]
	ldr r3, _0801A1F4
	adds r2, r3, 0
	adds r2, 0x20
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r3
	ldr r2, _0801A1F8
	ldr r1, [r2]
	str r1, [r0]
	ldr r0, _0801A1FC
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A1F0: .4byte gUnknown_02024C10
_0801A1F4: .4byte 0x02017140
_0801A1F8: .4byte gUnknown_030042D4
_0801A1FC: .4byte sub_8013FBC
	thumb_func_end b_push_move_exec

	thumb_func_start sub_801A02C
sub_801A02C: @ 801A200
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r0, 0
	mov r10, r0
	movs r1, 0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	strb r1, [r0]
	ldr r4, _0801A24C
	ldr r1, _0801A250
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0801A258
	ldr r1, _0801A254
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	ldrb r0, [r0, 0x1A]
	b _0801A26C
	.align 2, 0
_0801A24C: .4byte gUnknown_02024C04
_0801A250: .4byte gBattleMons
_0801A254: .4byte gEnigmaBerries
_0801A258:
	ldrh r0, [r4]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0801A26C:
	mov r9, r0
	ldr r1, _0801A294
	ldr r0, _0801A298
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	str r0, [sp, 0x14]
	cmp r0, 0xAF
	bne _0801A2A0
	ldr r1, _0801A29C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	mov r8, r3
	ldrb r0, [r0, 0x1A]
	b _0801A2B6
	.align 2, 0
_0801A294: .4byte gBattleMons
_0801A298: .4byte gUnknown_02024C07
_0801A29C: .4byte gEnigmaBerries
_0801A2A0:
	ldr r0, [sp, 0x14]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, [sp, 0x14]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r0, 24
_0801A2B6:
	str r0, [sp, 0x10]
	ldr r2, _0801A2EC
	ldr r0, _0801A2F0
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	cmp r4, 0xAF
	beq _0801A2D6
	adds r0, r4, 0
	bl ItemId_GetHoldEffect
	adds r0, r4, 0
	bl ItemId_GetHoldEffectParam
_0801A2D6:
	ldr r4, [sp, 0x8]
	cmp r4, 0x4
	bls _0801A2E0
	bl _0801B59E
_0801A2E0:
	lsls r0, r4, 2
	ldr r1, _0801A2F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A2EC: .4byte gBattleMons
_0801A2F0: .4byte gUnknown_02024C08
_0801A2F4: .4byte _0801A2F8
	.align 2, 0
_0801A2F8:
	.4byte _0801A30C
	.4byte _0801A3A8
	.4byte _0801B59E
	.4byte _0801AFE0
	.4byte _0801B440
_0801A30C:
	cmp r5, 0x17
	beq _0801A330
	cmp r5, 0x20
	beq _0801A318
	bl _0801B59E
_0801A318:
	ldr r0, _0801A328
	ldr r5, _0801A32C
	adds r0, r5
	movs r1, 0x2
	strb r1, [r0]
	bl _0801B59E
	.align 2, 0
_0801A328: .4byte 0x02000000
_0801A32C: .4byte 0x00016056
_0801A330:
	ldr r0, _0801A38C
	mov r8, r0
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801A346:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801A354
	strb r2, [r1]
	movs r4, 0x5
	str r4, [sp, 0xC]
_0801A354:
	adds r1, 0x1
	movs r5, 0x1
	negs r5, r5
	add r10, r5
	mov r0, r10
	cmp r0, 0
	bge _0801A346
	ldr r1, [sp, 0xC]
	cmp r1, 0
	bne _0801A36C
	bl _0801B59E
_0801A36C:
	ldr r0, _0801A390
	ldr r2, _0801A394
	adds r0, r2
	strb r7, [r0]
	ldr r0, _0801A398
	strb r7, [r0]
	ldr r1, _0801A39C
	ldr r0, _0801A3A0
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801A3A4
	bl b_call_bc_move_exec
	bl _0801B59E
	.align 2, 0
_0801A38C: .4byte gBattleMons
_0801A390: .4byte 0x02000000
_0801A394: .4byte 0x00016003
_0801A398: .4byte gUnknown_02024C0B
_0801A39C: .4byte gUnknown_02024A60
_0801A3A0: .4byte gUnknown_02024C07
_0801A3A4: .4byte gUnknown_081D9A5E
_0801A3A8:
	ldr r1, _0801A3D0
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x28]
	mov r8, r1
	cmp r0, 0
	bne _0801A3BC
	bl _0801B59E
_0801A3BC:
	subs r0, r5, 0x1
	cmp r0, 0x2A
	bls _0801A3C6
	bl _0801AF2E
_0801A3C6:
	lsls r0, 2
	ldr r1, _0801A3D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801A3D0: .4byte gBattleMons
_0801A3D4: .4byte _0801A3D8
	.align 2, 0
_0801A3D8:
	.4byte _0801A484
	.4byte _0801AC9C
	.4byte _0801AD58
	.4byte _0801ACCC
	.4byte _0801AD00
	.4byte _0801AD30
	.4byte _0801A4CC
	.4byte _0801AD9C
	.4byte _0801ADCC
	.4byte _0801A6A0
	.4byte _0801A71C
	.4byte _0801A798
	.4byte _0801A808
	.4byte _0801A89C
	.4byte _0801A930
	.4byte _0801A9A8
	.4byte _0801AA0C
	.4byte _0801AA70
	.4byte _0801AAD4
	.4byte _0801AB50
	.4byte _0801AB9C
	.4byte _0801AF2E
	.4byte _0801A5CC
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AEF8
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801AF2E
	.4byte _0801A640
_0801A484:
	movs r0, 0x58
	muls r0, r7
	mov r3, r8
	adds r2, r0, r3
	ldrh r0, [r2, 0x2C]
	ldrh r1, [r2, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A49A
	bl _0801AF2E
_0801A49A:
	cmp r6, 0
	beq _0801A4A2
	bl _0801AF2E
_0801A4A2:
	ldr r4, _0801A4C4
	mov r5, r9
	str r5, [r4]
	ldrh r3, [r2, 0x28]
	adds r0, r3, r5
	ldrh r1, [r2, 0x2C]
	cmp r0, r1
	ble _0801A4B6
	subs r0, r1, r3
	str r0, [r4]
_0801A4B6:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	ldr r0, _0801A4C8
	bl b_call_bc_move_exec
	b _0801A926
	.align 2, 0
_0801A4C4: .4byte gUnknown_02024BEC
_0801A4C8: .4byte gUnknown_081D9A74
_0801A4CC:
	cmp r6, 0
	beq _0801A4D4
	bl _0801AF2E
_0801A4D4:
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801A4F8
	ldr r1, _0801A4F0
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801A4F4
	b _0801A506
	.align 2, 0
_0801A4F0: .4byte gUnknown_02024A6A
_0801A4F4: .4byte gPlayerParty
_0801A4F8:
	ldr r1, _0801A574
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0801A578
_0801A506:
	adds r4, r1, r0
	movs r1, 0
	mov r10, r1
	add r5, sp, 0x4
_0801A50E:
	mov r1, r10
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r10
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r6, 0
	beq _0801A53E
	ldrb r0, [r5]
	cmp r0, 0
	beq _0801A548
_0801A53E:
	movs r2, 0x1
	add r10, r2
	mov r3, r10
	cmp r3, 0x3
	ble _0801A50E
_0801A548:
	mov r4, r10
	cmp r4, 0x4
	bne _0801A552
	bl _0801AF2E
_0801A552:
	lsls r2, r4, 24
	lsrs r2, 24
	adds r0, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r2, r0, 24
	add r0, sp, 0x4
	ldrb r0, [r0]
	mov r5, r9
	adds r1, r0, r5
	cmp r1, r2
	ble _0801A57C
	add r0, sp, 0x4
	strb r2, [r0]
	b _0801A580
	.align 2, 0
_0801A574: .4byte gUnknown_02024A6A
_0801A578: .4byte gEnemyParty
_0801A57C:
	add r0, sp, 0x4
	strb r1, [r0]
_0801A580:
	ldr r1, _0801A5C0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r6, [r1, 0x2]
	lsrs r0, r6, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r0, _0801A5C4
	bl b_call_bc_move_exec
	mov r1, r10
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	add r0, sp, 0x4
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldr r0, _0801A5C8
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	movs r1, 0x3
	str r1, [sp, 0xC]
	bl _0801AF36
	.align 2, 0
_0801A5C0: .4byte gUnknown_030041C0
_0801A5C4: .4byte gUnknown_081D9A91
_0801A5C8: .4byte gUnknown_02024A60
_0801A5CC:
	ldr r0, _0801A624
	movs r1, 0x58
	muls r1, r7
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r3, 0x7
	mov r10, r3
_0801A5DC:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801A5EA
	strb r2, [r1]
	movs r4, 0x5
	str r4, [sp, 0xC]
_0801A5EA:
	adds r1, 0x1
	movs r5, 0x1
	negs r5, r5
	add r10, r5
	mov r0, r10
	cmp r0, 0
	bge _0801A5DC
	movs r1, 0x8
	mov r10, r1
	ldr r2, [sp, 0xC]
	cmp r2, 0
	bne _0801A606
	bl _0801B59E
_0801A606:
	ldr r0, _0801A628
	ldr r3, _0801A62C
	adds r0, r3
	strb r7, [r0]
	ldr r0, _0801A630
	strb r7, [r0]
	ldr r1, _0801A634
	ldr r0, _0801A638
	strb r7, [r0]
	strb r7, [r1]
	ldr r0, _0801A63C
	bl b_call_bc_move_exec
	bl _0801AF2E
	.align 2, 0
_0801A624: .4byte gBattleMons
_0801A628: .4byte 0x02000000
_0801A62C: .4byte 0x00016003
_0801A630: .4byte gUnknown_02024C0B
_0801A634: .4byte gUnknown_02024A60
_0801A638: .4byte gUnknown_02024C07
_0801A63C: .4byte gUnknown_081D9A5E
_0801A640:
	movs r0, 0x58
	muls r0, r7
	mov r4, r8
	adds r1, r0, r4
	ldrh r0, [r1, 0x28]
	ldrh r2, [r1, 0x2C]
	cmp r0, r2
	bcc _0801A654
	bl _0801AF2E
_0801A654:
	cmp r6, 0
	beq _0801A65C
	bl _0801AF2E
_0801A65C:
	ldr r3, _0801A698
	ldrh r0, [r1, 0x2C]
	lsrs r0, 4
	str r0, [r3]
	cmp r0, 0
	bne _0801A66C
	movs r0, 0x1
	str r0, [r3]
_0801A66C:
	ldrh r2, [r1, 0x28]
	ldr r0, [r3]
	adds r0, r2, r0
	ldrh r1, [r1, 0x2C]
	cmp r0, r1
	ble _0801A67C
	subs r0, r1, r2
	str r0, [r3]
_0801A67C:
	ldr r0, [r3]
	negs r0, r0
	str r0, [r3]
	ldr r0, _0801A69C
	bl b_call_bc_move_exec
	movs r3, 0x4
	str r3, [sp, 0xC]
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_81074F8
	bl _0801AF2E
	.align 2, 0
_0801A698: .4byte gUnknown_02024BEC
_0801A69C: .4byte gUnknown_081D9AA1
_0801A6A0:
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	str r4, [sp, 0x18]
	add r4, r8
	ldrh r0, [r4, 0x2C]
	ldrh r1, [r4, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A6B8
	bl _0801AF2E
_0801A6B8:
	cmp r6, 0
	beq _0801A6C0
	bl _0801AF2E
_0801A6C0:
	ldr r1, _0801A714
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	strb r6, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r5, _0801A718
	ldrh r0, [r4, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _0801A6E4
	movs r0, 0x1
	str r0, [r5]
_0801A6E4:
	ldrh r2, [r4, 0x28]
	ldr r0, [r5]
	adds r0, r2, r0
	ldrh r1, [r4, 0x2C]
	cmp r0, r1
	ble _0801A6F4
	subs r0, r1, r2
	str r0, [r5]
_0801A6F4:
	ldr r0, [r5]
	negs r0, r0
	str r0, [r5]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x18]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0
_0801A706:
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	bge _0801A712
	b _0801A90C
_0801A712:
	b _0801A920
	.align 2, 0
_0801A714: .4byte gUnknown_030041C0
_0801A718: .4byte gUnknown_02024BEC
_0801A71C:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	str r1, [sp, 0x1C]
	adds r5, r1, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A736
	bl _0801AF2E
_0801A736:
	cmp r6, 0
	beq _0801A73E
	bl _0801AF2E
_0801A73E:
	ldr r1, _0801A790
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r6, 0x1
	strb r6, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A794
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A762
	str r6, [r4]
_0801A762:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A772
	subs r0, r1, r2
	str r0, [r4]
_0801A772:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r2, [sp, 0x1C]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x1
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	blt _0801A878
	b _0801A88C
	.align 2, 0
_0801A790: .4byte gUnknown_030041C0
_0801A794: .4byte gUnknown_02024BEC
_0801A798:
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	str r4, [sp, 0x20]
	adds r5, r4, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A7B0
	b _0801AF2E
_0801A7B0:
	cmp r6, 0
	beq _0801A7B6
	b _0801AF2E
_0801A7B6:
	ldr r1, _0801A800
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A804
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A7DC
	movs r0, 0x1
	str r0, [r4]
_0801A7DC:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A7EC
	subs r0, r1, r2
	str r0, [r4]
_0801A7EC:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x20]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x2
	b _0801A706
	.align 2, 0
_0801A800: .4byte gUnknown_030041C0
_0801A804: .4byte gUnknown_02024BEC
_0801A808:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	str r1, [sp, 0x24]
	adds r5, r1, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A820
	b _0801AF2E
_0801A820:
	cmp r6, 0
	beq _0801A826
	b _0801AF2E
_0801A826:
	ldr r1, _0801A880
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A884
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A84C
	movs r0, 0x1
	str r0, [r4]
_0801A84C:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A85C
	subs r0, r1, r2
	str r0, [r4]
_0801A85C:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r2, [sp, 0x24]
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x3
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	bge _0801A88C
_0801A878:
	ldr r0, _0801A888
	bl b_call_bc_move_exec
	b _0801A892
	.align 2, 0
_0801A880: .4byte gUnknown_030041C0
_0801A884: .4byte gUnknown_02024BEC
_0801A888: .4byte gUnknown_081D9AD4
_0801A88C:
	ldr r0, _0801A898
	bl b_call_bc_move_exec
_0801A892:
	movs r3, 0x4
	str r3, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801A898: .4byte gUnknown_081D9A74
_0801A89C:
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	str r4, [sp, 0x28]
	adds r5, r4, 0
	add r5, r8
	ldrh r0, [r5, 0x2C]
	ldrh r1, [r5, 0x28]
	lsrs r0, 1
	cmp r1, r0
	bls _0801A8B4
	b _0801AF2E
_0801A8B4:
	cmp r6, 0
	beq _0801A8BA
	b _0801AF2E
_0801A8BA:
	ldr r1, _0801A914
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x8
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r4, _0801A918
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801A8E0
	movs r0, 0x1
	str r0, [r4]
_0801A8E0:
	ldrh r2, [r5, 0x28]
	ldr r0, [r4]
	adds r0, r2, r0
	ldrh r1, [r5, 0x2C]
	cmp r0, r1
	ble _0801A8F0
	subs r0, r1, r2
	str r0, [r4]
_0801A8F0:
	ldr r0, [r4]
	negs r0, r0
	str r0, [r4]
	mov r0, r8
	adds r0, 0x48
	ldr r5, [sp, 0x28]
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x4
	bl sub_8040A7C
	lsls r0, 24
	cmp r0, 0
	bge _0801A920
_0801A90C:
	ldr r0, _0801A91C
	bl b_call_bc_move_exec
	b _0801A926
	.align 2, 0
_0801A914: .4byte gUnknown_030041C0
_0801A918: .4byte gUnknown_02024BEC
_0801A91C: .4byte gUnknown_081D9AD4
_0801A920:
	ldr r0, _0801A92C
	bl b_call_bc_move_exec
_0801A926:
	movs r0, 0x4
	str r0, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801A92C: .4byte gUnknown_081D9A74
_0801A930:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A948
	b _0801AF2E
_0801A948:
	cmp r6, 0
	beq _0801A94E
	b _0801AF2E
_0801A94E:
	movs r0, 0x19
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A958
	b _0801AF2E
_0801A958:
	ldr r1, _0801A990
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _0801A994
	strb r2, [r1]
	strb r6, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r6, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldr r0, _0801A998
	strb r7, [r0]
	ldr r1, _0801A99C
	ldr r3, _0801A9A0
	adds r2, r1, r3
	movs r0, 0x11
	strb r0, [r2]
	ldr r4, _0801A9A4
	adds r2, r1, r4
	movs r0, 0xF
	b _0801AB20
	.align 2, 0
_0801A990: .4byte gUnknown_030041C0
_0801A994: .4byte gUnknown_03004290
_0801A998: .4byte gUnknown_02024C0A
_0801A99C: .4byte 0x02000000
_0801A9A0: .4byte 0x0001601e
_0801A9A4: .4byte 0x000160a4
_0801A9A8:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801A9C0
	b _0801AF2E
_0801A9C0:
	cmp r6, 0
	beq _0801A9C6
	b _0801AF2E
_0801A9C6:
	movs r0, 0x1A
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801A9D0
	b _0801AF2E
_0801A9D0:
	ldr r1, _0801A9F8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801A9FC
	strb r7, [r0]
	ldr r1, _0801AA00
	ldr r3, _0801AA04
	adds r2, r1, r3
	movs r0, 0x12
	strb r0, [r2]
	ldr r4, _0801AA08
	adds r2, r1, r4
	movs r0, 0x10
	b _0801AB20
	.align 2, 0
_0801A9F8: .4byte gUnknown_030041C0
_0801A9FC: .4byte gUnknown_02024C0A
_0801AA00: .4byte 0x02000000
_0801AA04: .4byte 0x0001601e
_0801AA08: .4byte 0x000160a4
_0801AA0C:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801AA24
	b _0801AF2E
_0801AA24:
	cmp r6, 0
	beq _0801AA2A
	b _0801AF2E
_0801AA2A:
	movs r0, 0x1B
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801AA34
	b _0801AF2E
_0801AA34:
	ldr r1, _0801AA5C
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x3
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801AA60
	strb r7, [r0]
	ldr r1, _0801AA64
	ldr r3, _0801AA68
	adds r2, r1, r3
	movs r0, 0x13
	strb r0, [r2]
	ldr r4, _0801AA6C
	adds r2, r1, r4
	movs r0, 0x11
	b _0801AB20
	.align 2, 0
_0801AA5C: .4byte gUnknown_030041C0
_0801AA60: .4byte gUnknown_02024C0A
_0801AA64: .4byte 0x02000000
_0801AA68: .4byte 0x0001601e
_0801AA6C: .4byte 0x000160a4
_0801AA70:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801AA88
	b _0801AF2E
_0801AA88:
	cmp r6, 0
	beq _0801AA8E
	b _0801AF2E
_0801AA8E:
	movs r0, 0x1C
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801AA98
	b _0801AF2E
_0801AA98:
	ldr r1, _0801AAC0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801AAC4
	strb r7, [r0]
	ldr r1, _0801AAC8
	ldr r3, _0801AACC
	adds r2, r1, r3
	movs r0, 0x14
	strb r0, [r2]
	ldr r4, _0801AAD0
	adds r2, r1, r4
	movs r0, 0x12
	b _0801AB20
	.align 2, 0
_0801AAC0: .4byte gUnknown_030041C0
_0801AAC4: .4byte gUnknown_02024C0A
_0801AAC8: .4byte 0x02000000
_0801AACC: .4byte 0x0001601e
_0801AAD0: .4byte 0x000160a4
_0801AAD4:
	movs r0, 0x58
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	ldrh r4, [r5, 0x28]
	ldrh r0, [r5, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801AAEC
	b _0801AF2E
_0801AAEC:
	cmp r6, 0
	beq _0801AAF2
	b _0801AF2E
_0801AAF2:
	movs r0, 0x1D
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	ble _0801AAFC
	b _0801AF2E
_0801AAFC:
	ldr r1, _0801AB34
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801AB38
	strb r7, [r0]
	ldr r1, _0801AB3C
	ldr r3, _0801AB40
	adds r2, r1, r3
	movs r0, 0x15
	strb r0, [r2]
	ldr r4, _0801AB44
	adds r2, r1, r4
	movs r0, 0x13
_0801AB20:
	strb r0, [r2]
	ldr r5, _0801AB48
	adds r1, r5
	strb r6, [r1]
	ldr r0, _0801AB4C
	bl b_call_bc_move_exec
	movs r0, 0x5
	str r0, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801AB34: .4byte gUnknown_030041C0
_0801AB38: .4byte gUnknown_02024C0A
_0801AB3C: .4byte 0x02000000
_0801AB40: .4byte 0x0001601e
_0801AB44: .4byte 0x000160a4
_0801AB48: .4byte 0x000160a5
_0801AB4C: .4byte gUnknown_081D9AFE
_0801AB50:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r1, r8
	adds r0, r5, r1
	ldrh r4, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801AB6A
	b _0801AF2E
_0801AB6A:
	cmp r6, 0
	beq _0801AB70
	b _0801AF2E
_0801AB70:
	mov r0, r8
	adds r0, 0x50
	adds r1, r5, r0
	ldr r2, [r1]
	movs r3, 0x80
	lsls r3, 13
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _0801AB86
	b _0801AF2E
_0801AB86:
	orrs r2, r3
	str r2, [r1]
	ldr r0, _0801AB98
	bl b_call_bc_move_exec
	movs r2, 0x2
	str r2, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801AB98: .4byte gUnknown_081D9B19
_0801AB9C:
	cmp r6, 0
	beq _0801ABA2
	b _0801AF2E
_0801ABA2:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r3, r8
	adds r0, r5, r3
	ldrh r4, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	mov r1, r9
	bl __divsi3
	cmp r4, r0
	ble _0801ABBC
	b _0801AF2E
_0801ABBC:
	movs r4, 0
	mov r10, r4
	adds r0, r5, 0x1
	mov r1, r8
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	ble _0801ABEC
	mov r0, r8
	adds r0, 0x19
	adds r1, r5, r0
_0801ABD8:
	adds r1, 0x1
	movs r5, 0x1
	add r10, r5
	mov r0, r10
	cmp r0, 0x4
	bgt _0801ABEC
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0801ABD8
_0801ABEC:
	mov r1, r10
	cmp r1, 0x5
	bne _0801ABF4
	b _0801AF2E
_0801ABF4:
	movs r0, 0x58
	muls r0, r7
	adds r4, r0, 0x1
	ldr r5, _0801AC78
_0801ABFC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xC
	beq _0801ABFC
	ldr r1, _0801AC7C
	movs r3, 0
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	mov r0, r10
	adds r0, 0x1
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0801AC80
	strb r2, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0xD1
	strb r1, [r0, 0x2]
	strb r3, [r0, 0x3]
	strb r3, [r0, 0x4]
	movs r1, 0xD2
	strb r1, [r0, 0x5]
	strb r3, [r0, 0x6]
	subs r1, 0xD3
	strb r1, [r0, 0x7]
	ldr r0, _0801AC84
	strb r7, [r0]
	ldr r1, _0801AC88
	mov r2, r10
	adds r2, 0x21
	ldr r4, _0801AC8C
	adds r0, r1, r4
	strb r2, [r0]
	adds r2, 0x6
	ldr r5, _0801AC90
	adds r0, r1, r5
	strb r2, [r0]
	ldr r0, _0801AC94
	adds r1, r0
	strb r3, [r1]
	ldr r0, _0801AC98
	bl b_call_bc_move_exec
	movs r1, 0x5
	str r1, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801AC78: .4byte gUnknown_02024A98
_0801AC7C: .4byte gUnknown_030041C0
_0801AC80: .4byte gUnknown_03004290
_0801AC84: .4byte gUnknown_02024C0A
_0801AC88: .4byte 0x02000000
_0801AC8C: .4byte 0x0001601e
_0801AC90: .4byte 0x000160a4
_0801AC94: .4byte 0x000160a5
_0801AC98: .4byte gUnknown_081D9AFE
_0801AC9C:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _0801ACB4
	b _0801AF2E
_0801ACB4:
	movs r0, 0x41
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801ACC8
	bl b_call_bc_move_exec
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801ACC8: .4byte gUnknown_081D99B6
_0801ACCC:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x88
	ands r0, r2
	cmp r0, 0
	bne _0801ACE4
	b _0801AF2E
_0801ACE4:
	ldr r0, _0801ACF8
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801ACFC
	bl b_call_bc_move_exec
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801ACF8: .4byte 0xfffff077
_0801ACFC: .4byte gUnknown_081D99CE
_0801AD00:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0801AD18
	b _0801AF2E
_0801AD18:
	movs r0, 0x11
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AD2C
	bl b_call_bc_move_exec
	movs r4, 0x1
	str r4, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801AD2C: .4byte gUnknown_081D99E6
_0801AD30:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x4C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0801AD48
	b _0801AF2E
_0801AD48:
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AD54
	b _0801AEE2
	.align 2, 0
_0801AD54: .4byte gUnknown_081D99FE
_0801AD58:
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	mov r0, r8
	adds r0, 0x4C
	adds r2, r3, r0
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801AD70
	b _0801AF2E
_0801AD70:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	mov r1, r8
	adds r1, 0x50
	adds r1, r3, r1
	ldr r0, [r1]
	ldr r2, _0801AD94
	ands r0, r2
	str r0, [r1]
	ldr r0, _0801AD98
	bl b_call_bc_move_exec
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801AD94: .4byte 0xf7ffffff
_0801AD98: .4byte gUnknown_081D9A16
_0801AD9C:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x7
	ands r0, r2
	cmp r0, 0
	bne _0801ADB4
	b _0801AF2E
_0801ADB4:
	movs r0, 0x8
	negs r0, r0
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801ADC8
	bl b_call_bc_move_exec
	movs r1, 0x2
	str r1, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801ADC8: .4byte gUnknown_081D9A2E
_0801ADCC:
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	mov r0, r8
	adds r0, 0x4C
	adds r4, r5, r0
	ldr r2, [r4]
	ldrb r0, [r4]
	cmp r0, 0
	bne _0801ADF2
	mov r0, r8
	adds r0, 0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801ADF2
	b _0801AF2E
_0801ADF2:
	movs r3, 0
	mov r10, r3
	movs r0, 0x88
	ands r2, r0
	cmp r2, 0
	beq _0801AE0A
	ldr r0, _0801AE98
	ldr r1, _0801AE9C
	bl StringCopy
	movs r0, 0x1
	mov r10, r0
_0801AE0A:
	ldr r0, [r4]
	movs r1, 0x7
	mov r9, r1
	ands r0, r1
	mov r6, r8
	adds r6, 0x50
	cmp r0, 0
	beq _0801AE30
	adds r2, r5, r6
	ldr r0, [r2]
	ldr r1, _0801AEA0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801AE98
	ldr r1, _0801AEA4
	bl StringCopy
	movs r2, 0x1
	add r10, r2
_0801AE30:
	ldr r0, [r4]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801AE46
	ldr r0, _0801AE98
	ldr r1, _0801AEA8
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801AE46:
	ldr r0, [r4]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801AE5C
	ldr r0, _0801AE98
	ldr r1, _0801AEAC
	bl StringCopy
	movs r0, 0x1
	add r10, r0
_0801AE5C:
	ldr r0, [r4]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801AE72
	ldr r0, _0801AE98
	ldr r1, _0801AEB0
	bl StringCopy
	movs r1, 0x1
	add r10, r1
_0801AE72:
	adds r0, r5, r6
	ldr r0, [r0]
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	beq _0801AE8A
	ldr r0, _0801AE98
	ldr r1, _0801AEB4
	bl StringCopy
	movs r3, 0x1
	add r10, r3
_0801AE8A:
	mov r4, r10
	cmp r4, 0x1
	bgt _0801AEBC
	ldr r1, _0801AEB8
	movs r0, 0
	b _0801AEC0
	.align 2, 0
_0801AE98: .4byte gUnknown_030041C0
_0801AE9C: .4byte gStatusConditionString_PoisonJpn
_0801AEA0: .4byte 0xf7ffffff
_0801AEA4: .4byte gStatusConditionString_SleepJpn
_0801AEA8: .4byte gStatusConditionString_ParalysisJpn
_0801AEAC: .4byte gStatusConditionString_BurnJpn
_0801AEB0: .4byte gStatusConditionString_IceJpn
_0801AEB4: .4byte gStatusConditionString_ConfusionJpn
_0801AEB8: .4byte gUnknown_02024D1E
_0801AEBC:
	ldr r1, _0801AEEC
	movs r0, 0x1
_0801AEC0:
	strb r0, [r1, 0x5]
	ldr r2, _0801AEF0
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r3, r0
	movs r1, 0
	str r1, [r0]
	adds r2, 0x50
	adds r3, r2
	ldr r0, [r3]
	subs r1, 0x8
	ands r0, r1
	str r0, [r3]
	ldr r0, _0801AEF4
_0801AEE2:
	bl b_call_bc_move_exec
	movs r5, 0x1
	str r5, [sp, 0xC]
	b _0801AF36
	.align 2, 0
_0801AEEC: .4byte gUnknown_02024D1E
_0801AEF0: .4byte gBattleMons
_0801AEF4: .4byte gUnknown_081D9A44
_0801AEF8:
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x50
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r2
	cmp r0, 0
	beq _0801AF2E
	ldr r0, _0801AF58
	ands r2, r0
	str r2, [r1]
	ldr r0, _0801AF5C
	ldr r1, _0801AF60
	bl StringCopy
	ldr r0, _0801AF64
	bl b_call_bc_move_exec
	ldr r1, _0801AF68
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0x2
	str r0, [sp, 0xC]
_0801AF2E:
	ldr r1, [sp, 0xC]
	cmp r1, 0
	bne _0801AF36
	b _0801B59E
_0801AF36:
	ldr r0, _0801AF6C
	ldr r2, _0801AF70
	adds r0, r2
	strb r7, [r0]
	ldr r0, _0801AF74
	strb r7, [r0]
	ldr r4, _0801AF78
	ldr r0, _0801AF7C
	strb r7, [r0]
	strb r7, [r4]
	ldr r3, [sp, 0xC]
	cmp r3, 0x1
	beq _0801AF80
	cmp r3, 0x3
	beq _0801AF86
	b _0801B59E
	.align 2, 0
_0801AF58: .4byte 0xfff0ffff
_0801AF5C: .4byte gUnknown_030041C0
_0801AF60: .4byte gStatusConditionString_LoveJpn
_0801AF64: .4byte gUnknown_081D9A44
_0801AF68: .4byte gUnknown_02024D1E
_0801AF6C: .4byte 0x02000000
_0801AF70: .4byte 0x00016003
_0801AF74: .4byte gUnknown_02024C0B
_0801AF78: .4byte gUnknown_02024A60
_0801AF7C: .4byte gUnknown_02024C07
_0801AF80:
	movs r0, 0x58
	muls r0, r7
	b _0801B3F8
_0801AF86:
	ldr r4, _0801AFD4
	movs r0, 0x58
	adds r3, r7, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	beq _0801AFA2
	b _0801B59E
_0801AFA2:
	ldr r1, _0801AFD8
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0801AFDC
	mov r5, r10
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801AFC2
	b _0801B59E
_0801AFC2:
	adds r1, r5, r3
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	add r0, sp, 0x4
	ldrb r0, [r0]
	strb r0, [r1]
	b _0801B59E
	.align 2, 0
_0801AFD4: .4byte gBattleMons
_0801AFD8: .4byte gUnknown_02024CA8
_0801AFDC: .4byte gBitTable
_0801AFE0:
	movs r7, 0
	ldr r0, _0801B010
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0801AFEC
	b _0801B59E
_0801AFEC:
	ldr r4, _0801B014
	ldr r1, _0801B018
	movs r0, 0x58
	muls r0, r7
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0801B020
	ldr r1, _0801B01C
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	b _0801B030
	.align 2, 0
_0801B010: .4byte gUnknown_02024A68
_0801B014: .4byte gUnknown_02024C04
_0801B018: .4byte gBattleMons
_0801B01C: .4byte gEnigmaBerries
_0801B020:
	ldrh r0, [r4]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4]
	bl ItemId_GetHoldEffectParam
_0801B030:
	subs r0, r5, 0x2
	cmp r0, 0x1A
	bls _0801B038
	b _0801B3DC
_0801B038:
	lsls r0, 2
	ldr r1, _0801B044
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B044: .4byte _0801B048
	.align 2, 0
_0801B048:
	.4byte _0801B0B4
	.4byte _0801B19C
	.4byte _0801B0F0
	.4byte _0801B12C
	.4byte _0801B168
	.4byte _0801B3DC
	.4byte _0801B1EC
	.4byte _0801B280
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B374
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B3DC
	.4byte _0801B228
_0801B0B4:
	ldr r1, _0801B0E4
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0801B0CA
	b _0801B3DC
_0801B0CA:
	movs r0, 0x41
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B0E8
	ldr r0, _0801B0EC
	str r0, [r1]
	movs r0, 0x1
	str r0, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B0E4: .4byte gBattleMons
_0801B0E8: .4byte gUnknown_02024C10
_0801B0EC: .4byte gUnknown_081D99BC
_0801B0F0:
	ldr r1, _0801B11C
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0801B106
	b _0801B3DC
_0801B106:
	ldr r0, _0801B120
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B124
	ldr r0, _0801B128
	str r0, [r1]
	movs r1, 0x1
	str r1, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B11C: .4byte gBattleMons
_0801B120: .4byte 0xfffff077
_0801B124: .4byte gUnknown_02024C10
_0801B128: .4byte gUnknown_081D99D4
_0801B12C:
	ldr r1, _0801B15C
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0801B142
	b _0801B3DC
_0801B142:
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B160
	ldr r0, _0801B164
	str r0, [r1]
	movs r2, 0x1
	str r2, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B15C: .4byte gBattleMons
_0801B160: .4byte gUnknown_02024C10
_0801B164: .4byte gUnknown_081D99EC
_0801B168:
	ldr r1, _0801B190
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x4C
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801B17E
	b _0801B3DC
_0801B17E:
	movs r0, 0x21
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B194
	ldr r0, _0801B198
	b _0801B33C
	.align 2, 0
_0801B190: .4byte gBattleMons
_0801B194: .4byte gUnknown_02024C10
_0801B198: .4byte gUnknown_081D9A04
_0801B19C:
	ldr r2, _0801B1DC
	movs r0, 0x58
	adds r4, r7, 0
	muls r4, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r3, r4, r0
	ldr r1, [r3]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801B1B6
	b _0801B3DC
_0801B1B6:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r3]
	adds r2, 0x50
	adds r2, r4, r2
	ldr r0, [r2]
	ldr r1, _0801B1E0
	ands r0, r1
	str r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B1E4
	ldr r0, _0801B1E8
	str r0, [r1]
	movs r4, 0x1
	str r4, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B1DC: .4byte gBattleMons
_0801B1E0: .4byte 0xf7ffffff
_0801B1E4: .4byte gUnknown_02024C10
_0801B1E8: .4byte gUnknown_081D9A1C
_0801B1EC:
	ldr r1, _0801B21C
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801B202
	b _0801B3DC
_0801B202:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B220
	ldr r0, _0801B224
	str r0, [r1]
	movs r5, 0x2
	str r5, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B21C: .4byte gBattleMons
_0801B220: .4byte gUnknown_02024C10
_0801B224: .4byte gUnknown_081D9A34
_0801B228:
	ldr r1, _0801B264
	movs r0, 0x58
	muls r0, r7
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	bne _0801B240
	b _0801B3DC
_0801B240:
	ldr r0, _0801B268
	ands r1, r0
	str r1, [r2]
	ldr r0, _0801B26C
	ldr r1, _0801B270
	bl StringCopy
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B274
	movs r0, 0
	strb r0, [r1, 0x5]
	ldr r1, _0801B278
	ldr r0, _0801B27C
	str r0, [r1]
	movs r0, 0x2
	str r0, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B264: .4byte gBattleMons
_0801B268: .4byte 0xfff0ffff
_0801B26C: .4byte gUnknown_030041C0
_0801B270: .4byte gStatusConditionString_LoveJpn
_0801B274: .4byte gUnknown_02024D1E
_0801B278: .4byte gUnknown_02024C10
_0801B27C: .4byte gUnknown_081D9A4A
_0801B280:
	ldr r4, _0801B344
	movs r0, 0x58
	adds r5, r7, 0
	muls r5, r0
	adds r0, r4, 0
	adds r0, 0x4C
	adds r6, r5, r0
	ldr r2, [r6]
	ldrb r0, [r6]
	cmp r0, 0
	bne _0801B2A8
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801B2A8
	b _0801B3DC
_0801B2A8:
	movs r0, 0x88
	ands r2, r0
	cmp r2, 0
	beq _0801B2B8
	ldr r0, _0801B348
	ldr r1, _0801B34C
	bl StringCopy
_0801B2B8:
	ldr r0, [r6]
	movs r1, 0x7
	mov r8, r1
	ands r0, r1
	adds r4, 0x50
	cmp r0, 0
	beq _0801B2D8
	adds r2, r5, r4
	ldr r0, [r2]
	ldr r1, _0801B350
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801B348
	ldr r1, _0801B354
	bl StringCopy
_0801B2D8:
	ldr r0, [r6]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801B2EA
	ldr r0, _0801B348
	ldr r1, _0801B358
	bl StringCopy
_0801B2EA:
	ldr r0, [r6]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0801B2FC
	ldr r0, _0801B348
	ldr r1, _0801B35C
	bl StringCopy
_0801B2FC:
	ldr r0, [r6]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801B30E
	ldr r0, _0801B348
	ldr r1, _0801B360
	bl StringCopy
_0801B30E:
	adds r5, r4
	ldr r0, [r5]
	mov r2, r8
	ands r0, r2
	cmp r0, 0
	beq _0801B322
	ldr r0, _0801B348
	ldr r1, _0801B364
	bl StringCopy
_0801B322:
	movs r4, 0
	str r4, [r6]
	ldr r0, [r5]
	movs r1, 0x8
	negs r1, r1
	ands r0, r1
	str r0, [r5]
	bl b_movescr_stack_push_cursor
	ldr r0, _0801B368
	strb r4, [r0, 0x5]
	ldr r1, _0801B36C
	ldr r0, _0801B370
_0801B33C:
	str r0, [r1]
	movs r3, 0x1
	str r3, [sp, 0xC]
	b _0801B3E2
	.align 2, 0
_0801B344: .4byte gBattleMons
_0801B348: .4byte gUnknown_030041C0
_0801B34C: .4byte gStatusConditionString_PoisonJpn
_0801B350: .4byte 0xf7ffffff
_0801B354: .4byte gStatusConditionString_SleepJpn
_0801B358: .4byte gStatusConditionString_ParalysisJpn
_0801B35C: .4byte gStatusConditionString_BurnJpn
_0801B360: .4byte gStatusConditionString_IceJpn
_0801B364: .4byte gStatusConditionString_ConfusionJpn
_0801B368: .4byte gUnknown_02024D1E
_0801B36C: .4byte gUnknown_02024C10
_0801B370: .4byte gUnknown_081D9A4A
_0801B374:
	ldr r4, _0801B3C4
	mov r8, r4
	movs r0, 0x58
	adds r1, r7, 0
	muls r1, r0
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	movs r2, 0x6
	movs r5, 0x7
	mov r10, r5
_0801B38A:
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0801B398
	strb r2, [r1]
	movs r0, 0x5
	str r0, [sp, 0xC]
_0801B398:
	adds r1, 0x1
	movs r3, 0x1
	negs r3, r3
	add r10, r3
	mov r4, r10
	cmp r4, 0
	bge _0801B38A
	ldr r5, [sp, 0xC]
	cmp r5, 0
	beq _0801B428
	ldr r0, _0801B3C8
	ldr r1, _0801B3CC
	adds r0, r1
	strb r7, [r0]
	ldr r0, _0801B3D0
	strb r7, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B3D4
	ldr r0, _0801B3D8
	str r0, [r1]
	b _0801B59E
	.align 2, 0
_0801B3C4: .4byte gBattleMons
_0801B3C8: .4byte 0x02000000
_0801B3CC: .4byte 0x00016003
_0801B3D0: .4byte gUnknown_02024C0B
_0801B3D4: .4byte gUnknown_02024C10
_0801B3D8: .4byte gUnknown_081D9A64
_0801B3DC:
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _0801B428
_0801B3E2:
	ldr r0, _0801B414
	ldr r3, _0801B418
	adds r0, r3
	strb r7, [r0]
	ldr r0, _0801B41C
	strb r7, [r0]
	ldr r4, _0801B420
	strb r7, [r4]
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
_0801B3F8:
	ldr r1, _0801B424
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0801B59E
	.align 2, 0
_0801B414: .4byte 0x02000000
_0801B418: .4byte 0x00016003
_0801B41C: .4byte gUnknown_02024C0B
_0801B420: .4byte gUnknown_02024A60
_0801B424: .4byte gUnknown_02024ACC
_0801B428:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0801B43C
	ldrb r0, [r0]
	cmp r7, r0
	bcs _0801B438
	b _0801AFEC
_0801B438:
	b _0801B59E
	.align 2, 0
_0801B43C: .4byte gUnknown_02024A68
_0801B440:
	ldr r7, _0801B458
	ldr r0, [r7]
	cmp r0, 0
	bne _0801B44A
	b _0801B59E
_0801B44A:
	mov r4, r8
	cmp r4, 0x1E
	beq _0801B45C
	cmp r4, 0x3E
	beq _0801B504
	b _0801B59E
	.align 2, 0
_0801B458: .4byte gUnknown_02024BEC
_0801B45C:
	ldr r0, _0801B4E8
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801B46A
	b _0801B59E
_0801B46A:
	ldr r2, _0801B4EC
	ldr r4, _0801B4F0
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r1, r0, 2
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801B490
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0801B490
	b _0801B59E
_0801B490:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r9
	bcs _0801B59E
	ldr r2, _0801B4F4
	ldr r0, _0801B4F8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801B59E
	ldr r2, _0801B4FC
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801B59E
	ldr r1, _0801B500
	movs r0, 0x8
	strb r0, [r1, 0x3]
	bl b_movescr_stack_push_cursor
	movs r0, 0
	movs r1, 0
	bl sub_801E3EC
	bl b_movescr_stack_pop_cursor
	b _0801B59E
	.align 2, 0
_0801B4E8: .4byte gUnknown_02024C68
_0801B4EC: .4byte gUnknown_02024D68
_0801B4F0: .4byte gUnknown_02024C08
_0801B4F4: .4byte gBattleMoves
_0801B4F8: .4byte gUnknown_02024BE6
_0801B4FC: .4byte gBattleMons
_0801B500: .4byte gUnknown_02024D1E
_0801B504:
	ldr r0, _0801B5B0
	ldrb r0, [r0]
	movs r4, 0x29
	ands r4, r0
	cmp r4, 0
	bne _0801B59E
	ldr r1, _0801B5B4
	ldr r5, _0801B5B8
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r6, r1, 0x4
	adds r0, r6
	ldr r1, [r0]
	cmp r1, 0
	beq _0801B59E
	ldr r0, _0801B5BC
	cmp r1, r0
	beq _0801B59E
	ldr r0, _0801B5C0
	ldrb r3, [r0]
	cmp r3, r2
	beq _0801B59E
	ldr r2, _0801B5C4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	beq _0801B59E
	cmp r1, 0
	beq _0801B59E
	ldr r0, _0801B5C8
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0]
	ldr r0, _0801B5CC
	strb r3, [r0]
	ldr r0, _0801B5D0
	ldr r2, _0801B5D4
	adds r0, r2
	strb r3, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldr r1, [sp, 0x10]
	bl __divsi3
	negs r0, r0
	str r0, [r7]
	ldrb r1, [r5]
	cmp r0, 0
	bne _0801B580
	movs r0, 0x1
	negs r0, r0
	str r0, [r7]
_0801B580:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	str r4, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801B5D8
	ldr r0, _0801B5DC
	str r0, [r1]
	ldr r0, [sp, 0xC]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
_0801B59E:
	ldr r0, [sp, 0xC]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B5B0: .4byte gUnknown_02024C68
_0801B5B4: .4byte gUnknown_02024D68
_0801B5B8: .4byte gUnknown_02024C08
_0801B5BC: .4byte 0x0000ffff
_0801B5C0: .4byte gUnknown_02024C07
_0801B5C4: .4byte gBattleMons
_0801B5C8: .4byte gUnknown_02024C04
_0801B5CC: .4byte gUnknown_02024C0B
_0801B5D0: .4byte 0x02000000
_0801B5D4: .4byte 0x00016003
_0801B5D8: .4byte gUnknown_02024C10
_0801B5DC: .4byte gUnknown_081D9AA7
	thumb_func_end sub_801A02C

	thumb_func_start unref_sub_801B40C
unref_sub_801B40C: @ 801B5E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	str r0, [sp]
	ldr r0, _0801B638
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801B5FE
	b _0801B742
_0801B5FE:
	movs r1, 0x1
	mov r9, r1
_0801B602:
	movs r5, 0
	ldr r4, _0801B63C
	ldr r2, [sp]
	adds r2, 0x1
	str r2, [sp, 0x4]
_0801B60C:
	ldr r0, _0801B640
	ldrb r2, [r0]
	ldr r3, _0801B644
	lsls r0, r5, 2
	adds r0, r3
	ldr r0, [r0]
	ands r0, r2
	cmp r0, 0
	bne _0801B62E
	adds r0, r5, 0x2
	lsls r1, r0, 2
	adds r1, r3
	ldr r1, [r1]
	ands r2, r1
	adds r7, r0, 0
	cmp r2, 0
	beq _0801B648
_0801B62E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _0801B72A
	.align 2, 0
_0801B638: .4byte gUnknown_020239F8
_0801B63C: .4byte gUnknown_081FC1D0
_0801B640: .4byte gUnknown_02024C0C
_0801B644: .4byte gBitTable
_0801B648:
	ldr r0, _0801B754
	ldr r2, [sp]
	lsls r1, r2, 3
	adds r6, r1, r0
	ldr r4, _0801B758
	lsls r0, r5, 1
	adds r3, r0, r4
	ldrh r2, [r6]
	mov r8, r1
	mov r10, r0
	ldrh r3, [r3]
	cmp r2, r3
	bne _0801B6B8
	lsls r0, r7, 1
	adds r0, r4
	ldrh r1, [r6, 0x2]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0801B6B8
	adds r0, r5, 0
	bl battle_get_per_side_status
	mov r2, r9
	ands r2, r0
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	ldr r0, _0801B75C
	adds r1, r0
	lsls r0, r7, 4
	orrs r0, r5
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	bl battle_get_per_side_status
	mov r1, r9
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0801B75C
	adds r0, r1
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0x4]
	adds r0, r5, 0
	bl battle_get_per_side_status
	mov r1, r9
	ands r1, r0
	lsls r1, 1
	ldr r2, _0801B760
	adds r1, r2
	ldrh r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strh r0, [r1]
_0801B6B8:
	ldr r0, _0801B754
	mov r1, r8
	adds r4, r1, r0
	ldr r2, _0801B758
	lsls r0, r7, 1
	adds r0, r2
	ldrh r1, [r4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0801B722
	mov r0, r10
	adds r1, r0, r2
	ldrh r0, [r4, 0x2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801B722
	adds r0, r5, 0
	bl battle_get_per_side_status
	mov r2, r9
	ands r2, r0
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	ldr r2, _0801B75C
	adds r1, r2
	lsls r0, r5, 4
	orrs r0, r7
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	bl battle_get_per_side_status
	mov r1, r9
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0801B75C
	adds r0, r1
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x4]
	adds r0, r5, 0
	bl battle_get_per_side_status
	mov r1, r9
	ands r1, r0
	lsls r1, 1
	ldr r2, _0801B760
	adds r1, r2
	ldrh r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strh r0, [r1]
_0801B722:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0801B754
_0801B72A:
	cmp r5, 0x1
	bhi _0801B730
	b _0801B60C
_0801B730:
	ldr r0, [sp, 0x4]
	str r0, [sp]
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0]
	ldr r0, _0801B764
	cmp r1, r0
	beq _0801B742
	b _0801B602
_0801B742:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B754: .4byte gUnknown_081FC1D0
_0801B758: .4byte gUnknown_02024C60
_0801B75C: .4byte gUnknown_02024C80
_0801B760: .4byte gUnknown_02024C7A
_0801B764: .4byte 0x0000ffff
	thumb_func_end unref_sub_801B40C

	thumb_func_start sub_801B594
sub_801B594: @ 801B768
	push {lr}
	ldr r0, _0801B788
	ldr r0, [r0]
	cmp r0, 0
	bne _0801B784
	ldr r1, _0801B78C
	ldr r0, _0801B790
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0801B784:
	pop {r0}
	bx r0
	.align 2, 0
_0801B788: .4byte gUnknown_02024A64
_0801B78C: .4byte gUnknown_081FA73C
_0801B790: .4byte gUnknown_02024C10
	thumb_func_end sub_801B594

	thumb_func_start sub_801B5C0
sub_801B5C0: @ 801B794
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r0, r1, 24
	movs r5, 0
	cmp r0, 0
	beq _0801B7B2
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _0801B7BE
_0801B7B2:
	ldr r1, _0801B7D0
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x6]
_0801B7BE:
	cmp r6, 0x40
	bls _0801B7C4
	b _0801BAD4
_0801B7C4:
	lsls r0, r6, 2
	ldr r1, _0801B7D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B7D0: .4byte gBattleMoves
_0801B7D4: .4byte _0801B7D8
	.align 2, 0
_0801B7D8:
	.4byte _0801B8DC
	.4byte _0801B9DC
	.4byte _0801BAD0
	.4byte _0801BAD4
	.4byte _0801B9F4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801B9DC
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD0
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801B9DC
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801BAD4
	.4byte _0801B9DC
_0801B8DC:
	ldr r0, _0801B9BC
	ldrb r0, [r0]
	bl battle_side_get_owner
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801B9C0
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _0801B90E
	ldr r1, _0801B9C4
	ldrb r4, [r2, 0x9]
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801B90E
	b _0801BA24
_0801B90E:
	ldr r0, _0801B9BC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r7, 1
	mov r8, r0
_0801B91E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0801B9C8
	ldrb r1, [r1]
	bl __modsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0801B9BC
	ldrb r2, [r6]
	cmp r5, r2
	beq _0801B91E
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _0801B91E
	ldr r0, _0801B9CC
	ldrb r2, [r0]
	ldr r1, _0801B9D0
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _0801B91E
	ldr r0, _0801B9D4
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	cmp r0, 0xD
	beq _0801B96C
	b _0801BAD4
_0801B96C:
	ldrb r1, [r6]
	str r2, [sp]
	movs r0, 0x10
	movs r2, 0x1F
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801B982
	b _0801BAD4
_0801B982:
	ldr r2, _0801B9C4
	movs r1, 0x58
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _0801B996
	b _0801BAD4
_0801B996:
	movs r4, 0x2
	eors r5, r4
	adds r0, r5, 0
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_81074C4
	ldr r1, _0801B9D8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	b _0801BAD4
	.align 2, 0
_0801B9BC: .4byte gUnknown_02024C07
_0801B9C0: .4byte gUnknown_02024C80
_0801B9C4: .4byte gBattleMons
_0801B9C8: .4byte gUnknown_02024A68
_0801B9CC: .4byte gUnknown_02024C0C
_0801B9D0: .4byte gBitTable
_0801B9D4: .4byte gBattleMoves
_0801B9D8: .4byte gUnknown_02024D68
_0801B9DC:
	ldr r0, _0801B9F0
	ldrb r0, [r0]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	b _0801BA86
	.align 2, 0
_0801B9F0: .4byte gUnknown_02024C07
_0801B9F4:
	ldr r0, _0801BA28
	ldrb r0, [r0]
	bl battle_side_get_owner
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801BA2C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _0801BA34
	ldr r1, _0801BA30
	ldrb r4, [r2, 0x9]
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801BA34
_0801BA24:
	adds r5, r4, 0
	b _0801BAD4
	.align 2, 0
_0801BA28: .4byte gUnknown_02024C07
_0801BA2C: .4byte gUnknown_02024C80
_0801BA30: .4byte gBattleMons
_0801BA34:
	ldr r0, _0801BA68
	ldrh r1, [r0]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0801BAB0
	movs r0, 0x4
	ands r6, r0
	cmp r6, 0
	beq _0801BAB0
	ldr r0, _0801BA6C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801BA74
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _0801BA70
	movs r0, 0x1
	b _0801BA86
	.align 2, 0
_0801BA68: .4byte gUnknown_020239F8
_0801BA6C: .4byte gUnknown_02024C07
_0801BA70:
	movs r0, 0x3
	b _0801BA86
_0801BA74:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _0801BA84
	movs r0, 0
	b _0801BA86
_0801BA84:
	movs r0, 0x2
_0801BA86:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0801BAA8
	ldrb r1, [r0]
	ldr r2, _0801BAAC
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801BAD4
	movs r0, 0x2
	eors r5, r0
	b _0801BAD4
	.align 2, 0
_0801BAA8: .4byte gUnknown_02024C0C
_0801BAAC: .4byte gBitTable
_0801BAB0:
	ldr r0, _0801BACC
	ldrb r0, [r0]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r2, 0x1
	movs r0, 0x1
	ands r0, r1
	eors r0, r2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r5, r0, 24
	b _0801BAD4
	.align 2, 0
_0801BACC: .4byte gUnknown_02024C07
_0801BAD0:
	ldr r0, _0801BAF0
	ldrb r5, [r0]
_0801BAD4:
	ldr r1, _0801BAF4
	ldr r0, _0801BAF0
	ldrb r0, [r0]
	ldr r2, _0801BAF8
	adds r0, r2
	adds r0, r1
	strb r5, [r0]
	adds r0, r5, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BAF0: .4byte gUnknown_02024C07
_0801BAF4: .4byte 0x02000000
_0801BAF8: .4byte 0x00016010
	thumb_func_end sub_801B5C0

	thumb_func_start sub_801B928
sub_801B928: @ 801BAFC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r0, _0801BBB4
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0801BBAE
	ldr r7, _0801BBB8
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0801BBAE
	ldr r5, _0801BBBC
	ldrb r0, [r7]
	movs r1, 0x58
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r5, 0
	adds r0, 0x54
	adds r0, r1, r0
	ldr r0, [r0]
	adds r2, r5, 0
	adds r2, 0x3C
	adds r1, r2
	bl sub_8040AD0
	lsls r0, 24
	cmp r0, 0
	beq _0801BBAE
	ldr r0, _0801BBC0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0801BBAE
	movs r6, 0xA
	ldr r0, _0801BBC4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801BB62
	movs r6, 0x1E
_0801BB62:
	ldr r0, _0801BBC8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801BB70
	movs r6, 0x32
_0801BB70:
	ldr r0, _0801BBCC
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0801BB7E
	movs r6, 0x46
_0801BB7E:
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r6
	bls _0801BBAE
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, r5
	adds r0, 0x2A
	ldrb r0, [r0]
	adds r0, r6
	muls r0, r1
	asrs r4, r0, 8
	cmp r4, r6
	bge _0801BBD0
_0801BBAE:
	movs r0, 0
	b _0801BDF8
	.align 2, 0
_0801BBB4: .4byte gUnknown_020239F8
_0801BBB8: .4byte gUnknown_02024C07
_0801BBBC: .4byte gBattleMons
_0801BBC0: .4byte 0x0000080e
_0801BBC4: .4byte 0x00000808
_0801BBC8: .4byte 0x0000080a
_0801BBCC: .4byte 0x0000080c
_0801BBD0:
	ldr r3, _0801BC10
	ldrh r0, [r3]
	cmp r0, 0x63
	bne _0801BBE6
	adds r0, r5, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r2, _0801BC14
	ands r1, r2
	str r1, [r0]
_0801BBE6:
	ldrb r0, [r7]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r1, r5, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801BC20
	ldrh r0, [r3]
	cmp r0, 0xAD
	beq _0801BC08
	cmp r0, 0xD6
	bne _0801BC20
_0801BC08:
	ldr r1, _0801BC18
	ldr r0, _0801BC1C
	b _0801BDA2
	.align 2, 0
_0801BC10: .4byte gUnknown_02024BE6
_0801BC14: .4byte 0xff7fffff
_0801BC18: .4byte gUnknown_02024C10
_0801BC1C: .4byte gUnknown_081D995F
_0801BC20:
	bl Random
	movs r5, 0xFF
	adds r1, r5, 0
	ands r1, r0
	ldr r7, _0801BCD8
	ldr r2, _0801BCDC
	mov r9, r2
	ldrb r3, [r2]
	movs r0, 0x58
	mov r8, r0
	mov r0, r8
	muls r0, r3
	adds r0, r7
	adds r0, 0x2A
	ldrb r2, [r0]
	adds r0, r2, r6
	muls r0, r1
	asrs r4, r0, 8
	cmp r4, r6
	bge _0801BD10
	ldr r7, _0801BCE0
	ldr r5, _0801BCE4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0]
	adds r0, r3, 0
	movs r2, 0xFF
	bl sub_8015A98
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bne _0801BC68
	b _0801BD92
_0801BC68:
	adds r6, r5, 0
	ldr r1, _0801BCE8
	mov r9, r1
	movs r2, 0x3
	mov r8, r2
_0801BC72:
	bl Random
	mov r1, r8
	ands r0, r1
	mov r2, r9
	strb r0, [r2]
	strb r0, [r6]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r5, [r0]
	ands r5, r4
	cmp r5, 0
	bne _0801BC72
	ldr r4, _0801BCEC
	ldr r3, _0801BCD8
	ldr r0, _0801BCE4
	ldrb r0, [r0]
	lsls r0, 1
	ldr r1, _0801BCDC
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, _0801BCF0
	strb r5, [r0, 0x3]
	ldr r0, _0801BCF4
	movs r1, 0
	strh r5, [r0]
	ldr r0, _0801BCF8
	ldr r2, _0801BCFC
	adds r0, r2
	strb r1, [r0]
	ldr r1, _0801BD00
	ldr r0, _0801BD04
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _0801BD08
	strb r0, [r1]
	ldr r2, _0801BD0C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 14
	b _0801BDF2
	.align 2, 0
_0801BCD8: .4byte gBattleMons
_0801BCDC: .4byte gUnknown_02024C07
_0801BCE0: .4byte gBitTable
_0801BCE4: .4byte gUnknown_02024BE4
_0801BCE8: .4byte gUnknown_02024BE5
_0801BCEC: .4byte gUnknown_02024BEA
_0801BCF0: .4byte gUnknown_02024D1E
_0801BCF4: .4byte gUnknown_02024DEC
_0801BCF8: .4byte 0x02000000
_0801BCFC: .4byte 0x0001601c
_0801BD00: .4byte gUnknown_02024C10
_0801BD04: .4byte gUnknown_081D996F
_0801BD08: .4byte gUnknown_02024C08
_0801BD0C: .4byte gUnknown_02024C6C
_0801BD10:
	subs r0, r2, r6
	lsls r0, 24
	lsrs r6, r0, 24
	bl Random
	adds r4, r5, 0
	ands r4, r0
	cmp r4, r6
	bge _0801BD8C
	mov r1, r9
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r7, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _0801BD8C
	adds r0, r1, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	beq _0801BD8C
	cmp r0, 0xF
	beq _0801BD8C
	movs r2, 0
	ldr r0, _0801BD80
	ldrb r3, [r0]
	mov r8, r0
	cmp r2, r3
	bge _0801BD72
	ldr r0, [r7, 0x50]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	bne _0801BD72
	adds r1, r7, 0
	adds r1, 0x50
	movs r5, 0x70
_0801BD62:
	adds r1, 0x58
	adds r2, 0x1
	cmp r2, r3
	bge _0801BD72
	ldr r0, [r1]
	ands r0, r5
	cmp r0, 0
	beq _0801BD62
_0801BD72:
	mov r0, r8
	ldrb r0, [r0]
	cmp r2, r0
	bne _0801BD8C
	ldr r1, _0801BD84
	ldr r0, _0801BD88
	b _0801BDA2
	.align 2, 0
_0801BD80: .4byte gUnknown_02024A68
_0801BD84: .4byte gUnknown_02024C10
_0801BD88: .4byte gUnknown_081D9989
_0801BD8C:
	subs r4, r6
	cmp r4, r6
	blt _0801BDB4
_0801BD92:
	bl Random
	ldr r2, _0801BDA8
	movs r1, 0x3
	ands r1, r0
	strb r1, [r2, 0x5]
	ldr r1, _0801BDAC
	ldr r0, _0801BDB0
_0801BDA2:
	str r0, [r1]
	movs r0, 0x1
	b _0801BDF8
	.align 2, 0
_0801BDA8: .4byte gUnknown_02024D1E
_0801BDAC: .4byte gUnknown_02024C10
_0801BDB0: .4byte gUnknown_081D9977
_0801BDB4:
	ldr r4, _0801BE08
	ldrb r1, [r4]
	movs r0, 0x58
	muls r1, r0
	ldr r0, _0801BE0C
	adds r1, r0
	movs r0, 0x28
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	str r0, [sp, 0x8]
	ldrb r0, [r4]
	str r0, [sp, 0xC]
	adds r0, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl CalculateBaseDamage
	ldr r1, _0801BE10
	str r0, [r1]
	ldr r1, _0801BE14
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r1, _0801BE18
	ldr r0, _0801BE1C
	str r0, [r1]
	ldr r2, _0801BE20
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 12
_0801BDF2:
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x2
_0801BDF8:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801BE08: .4byte gUnknown_02024C07
_0801BE0C: .4byte gBattleMons
_0801BE10: .4byte gUnknown_02024BEC
_0801BE14: .4byte gUnknown_02024C08
_0801BE18: .4byte gUnknown_02024C10
_0801BE1C: .4byte gUnknown_081D99A0
_0801BE20: .4byte gUnknown_02024C6C
	thumb_func_end sub_801B928

	thumb_func_start atk00_attackcanceler
atk00_attackcanceler: @ 801BE24
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r0, _0801BE40
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801BE48
	ldr r1, _0801BE44
	movs r0, 0xC
	strb r0, [r1]
	b _0801C1C8
	.align 2, 0
_0801BE40: .4byte gUnknown_02024D26
_0801BE44: .4byte gUnknown_02024A7F
_0801BE48:
	ldr r2, _0801BE78
	ldr r0, _0801BE7C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0801BE8C
	ldr r2, _0801BE80
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0801BE8C
	movs r0, 0x80
	lsls r0, 12
	orrs r1, r0
	str r1, [r2]
	ldr r1, _0801BE84
	ldr r0, _0801BE88
	b _0801C1C6
	.align 2, 0
_0801BE78: .4byte gBattleMons
_0801BE7C: .4byte gUnknown_02024C07
_0801BE80: .4byte gUnknown_02024C6C
_0801BE84: .4byte gUnknown_02024C10
_0801BE88: .4byte BattleScript_1D6F62
_0801BE8C:
	bl sub_8017718
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0801BE9A
	b _0801C1C8
_0801BE9A:
	ldr r0, _0801BF08
	ldrb r1, [r0]
	str r2, [sp]
	movs r0, 0x2
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0801BEB2
	b _0801C1C8
_0801BEB2:
	ldr r4, _0801BF0C
	ldr r0, _0801BF10
	ldrb r1, [r0]
	ldr r3, _0801BF14
	ldrb r2, [r3]
	movs r0, 0x58
	muls r2, r0
	adds r1, r2
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	ldr r5, _0801BF18
	cmp r0, 0
	bne _0801BF30
	ldr r0, _0801BF1C
	ldrh r0, [r0]
	cmp r0, 0xA5
	beq _0801BF30
	ldr r0, [r5]
	ldr r1, _0801BF20
	ands r0, r1
	cmp r0, 0
	bne _0801BF30
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _0801BF30
	ldr r1, _0801BF24
	ldr r0, _0801BF28
	str r0, [r1]
	ldr r2, _0801BF2C
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	b _0801C1C8
	.align 2, 0
_0801BF08: .4byte gUnknown_02024C08
_0801BF0C: .4byte gBattleMons
_0801BF10: .4byte gUnknown_02024BE4
_0801BF14: .4byte gUnknown_02024C07
_0801BF18: .4byte gUnknown_02024C6C
_0801BF1C: .4byte gUnknown_02024BE6
_0801BF20: .4byte 0x00800200
_0801BF24: .4byte gUnknown_02024C10
_0801BF28: .4byte gUnknown_081D936D
_0801BF2C: .4byte gUnknown_02024C68
_0801BF30:
	ldr r0, [r5]
	ldr r1, _0801BF74
	ands r0, r1
	str r0, [r5]
	movs r6, 0x80
	lsls r6, 18
	ands r0, r6
	cmp r0, 0
	bne _0801BF88
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r1, r4, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _0801BF88
	bl sub_801B928
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0801BF88
	cmp r2, 0x2
	bne _0801BF78
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	b _0801C1C8
	.align 2, 0
_0801BF74: .4byte 0xff7fffff
_0801BF78:
	ldr r0, _0801BF84
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _0801C1C8
	.align 2, 0
_0801BF84: .4byte gUnknown_02024C68
_0801BF88:
	ldr r2, _0801BFEC
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 18
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0801BFF0
	ldr r1, _0801BFF4
	ldrb r3, [r1]
	lsls r0, r3, 4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 27
	mov r8, r1
	mov r9, r2
	cmp r0, 0
	bge _0801C010
	ldr r2, _0801BFF8
	ldr r0, _0801BFFC
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801C010
	ldr r0, _0801C000
	ldrb r0, [r0]
	ldr r2, _0801C004
	adds r1, r3, 0
	bl sub_80151D4
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, 4
	add r1, r9
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801C008
	ldr r0, _0801C00C
	b _0801C1C6
	.align 2, 0
_0801BFEC: .4byte gUnknown_02024C6C
_0801BFF0: .4byte gUnknown_02024D28
_0801BFF4: .4byte gUnknown_02024C08
_0801BFF8: .4byte gBattleMoves
_0801BFFC: .4byte gUnknown_02024BE6
_0801C000: .4byte gUnknown_02024C07
_0801C004: .4byte 0x00000115
_0801C008: .4byte gUnknown_02024C10
_0801C00C: .4byte gUnknown_081D946F
_0801C010:
	movs r2, 0
	ldr r0, _0801C08C
	ldrb r0, [r0]
	cmp r2, r0
	bge _0801C052
	ldr r6, _0801C090
	ldr r1, _0801C094
	mov r12, r1
	adds r5, r0, 0
	ldr r7, _0801C098
_0801C024:
	adds r4, r2, r7
	ldrb r3, [r4]
	lsls r0, r3, 4
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0801C04C
	ldr r0, _0801C09C
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r1, [r0, 0x8]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801C04C
	b _0801C178
_0801C04C:
	adds r2, 0x1
	cmp r2, r5
	blt _0801C024
_0801C052:
	ldr r0, _0801C0A0
	mov r1, r8
	ldrb r2, [r1]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r3, [r1]
	lsls r0, r3, 30
	cmp r0, 0
	bge _0801C0B0
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	strb r0, [r1]
	ldr r4, _0801C0A4
	movs r0, 0x1F
	strb r0, [r4]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801C0A8
	ldr r0, _0801C0AC
	str r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	ldrb r1, [r4]
	bl sub_81074C4
	b _0801C1C8
	.align 2, 0
_0801C08C: .4byte gUnknown_02024A68
_0801C090: .4byte gUnknown_02024D28
_0801C094: .4byte gBattleMoves
_0801C098: .4byte gUnknown_02024A7A
_0801C09C: .4byte gUnknown_02024BE6
_0801C0A0: .4byte gUnknown_02024D68
_0801C0A4: .4byte byte_2024C06
_0801C0A8: .4byte gUnknown_02024C10
_0801C0AC: .4byte gUnknown_081D9812
_0801C0B0:
	lsls r0, r2, 4
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0801C0BE
	b _0801C1C0
_0801C0BE:
	ldr r1, _0801C154
	ldr r2, _0801C158
	ldrh r3, [r2]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x2
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	beq _0801C1C0
	cmp r3, 0xAE
	bne _0801C0FC
	ldr r2, _0801C15C
	ldr r0, _0801C160
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _0801C0FC
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _0801C1C0
_0801C0FC:
	ldrh r0, [r4]
	bl sub_8028350
	lsls r0, 24
	cmp r0, 0
	beq _0801C122
	ldr r1, _0801C15C
	ldr r0, _0801C160
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _0801C1C0
_0801C122:
	ldr r0, _0801C160
	ldrb r0, [r0]
	bl b_cancel_multi_turn_move_maybe
	ldr r2, _0801C164
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801C168
	ldr r3, _0801C16C
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801C170
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _0801C174
	movs r0, 0x1
	strb r0, [r1, 0x6]
	b _0801C1C0
	.align 2, 0
_0801C154: .4byte gBattleMoves
_0801C158: .4byte gUnknown_02024BE6
_0801C15C: .4byte gBattleMons
_0801C160: .4byte gUnknown_02024C07
_0801C164: .4byte gUnknown_02024C68
_0801C168: .4byte gUnknown_02024C3C
_0801C16C: .4byte gUnknown_02024C08
_0801C170: .4byte gUnknown_02024C44
_0801C174: .4byte gUnknown_02024D1E
_0801C178:
	ldr r0, _0801C1A8
	ldrb r0, [r0]
	ldr r2, _0801C1AC
	adds r1, r3, 0
	bl sub_80151D4
	ldrb r1, [r4]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _0801C1B0
	ldrb r1, [r4]
	ldr r2, _0801C1B4
	adds r0, r2
	strb r1, [r0]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801C1B8
	ldr r0, _0801C1BC
	b _0801C1C6
	.align 2, 0
_0801C1A8: .4byte gUnknown_02024C07
_0801C1AC: .4byte 0x00000121
_0801C1B0: .4byte 0x02000000
_0801C1B4: .4byte 0x00016003
_0801C1B8: .4byte gUnknown_02024C10
_0801C1BC: .4byte gUnknown_081D9487
_0801C1C0:
	ldr r1, _0801C1D8
	ldr r0, [r1]
	adds r0, 0x1
_0801C1C6:
	str r0, [r1]
_0801C1C8:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C1D8: .4byte gUnknown_02024C10
	thumb_func_end atk00_attackcanceler

	thumb_func_start mcmd_jump_if_move_not_executed
mcmd_jump_if_move_not_executed: @ 801C1DC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r1, _0801C228
	ldr r5, [r1]
	adds r4, r5, r0
	ldr r0, _0801C22C
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801C23C
	ldr r1, _0801C230
	ldr r3, _0801C234
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801C238
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldrb r4, [r5, 0x1]
	ldrb r0, [r5, 0x2]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r5, 0x3]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r5, 0x4]
	lsls r0, 24
	orrs r4, r0
	b _0801C256
	.align 2, 0
_0801C228: .4byte gUnknown_02024C10
_0801C22C: .4byte gUnknown_02024C68
_0801C230: .4byte gUnknown_02024C3C
_0801C234: .4byte gUnknown_02024C08
_0801C238: .4byte gUnknown_02024C44
_0801C23C:
	bl b_feature_update_destiny_bond
	ldr r0, _0801C264
	ldrb r1, [r0]
	str r6, [sp]
	movs r0, 0x3
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801C25A
_0801C256:
	ldr r0, _0801C268
	str r4, [r0]
_0801C25A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C264: .4byte gUnknown_02024C08
_0801C268: .4byte gUnknown_02024C10
	thumb_func_end mcmd_jump_if_move_not_executed

	thumb_func_start atk40_801DBA0
atk40_801DBA0: @ 801C26C
	push {lr}
	ldr r1, _0801C2B4
	ldr r0, _0801C2B8
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0801C2CC
	ldr r2, _0801C2BC
	ldr r0, _0801C2C0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801C2CC
	ldr r2, _0801C2C4
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x5
	movs r1, 0
	bl mcmd_jump_if_move_not_executed
	ldr r1, _0801C2C8
	movs r0, 0x1
	strb r0, [r1, 0x6]
	b _0801C2D4
	.align 2, 0
_0801C2B4: .4byte gUnknown_02024D28
_0801C2B8: .4byte gUnknown_02024C08
_0801C2BC: .4byte gBattleMoves
_0801C2C0: .4byte gUnknown_02024BE6
_0801C2C4: .4byte gUnknown_02024C68
_0801C2C8: .4byte gUnknown_02024D1E
_0801C2CC:
	ldr r1, _0801C2D8
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0801C2D4:
	pop {r0}
	bx r0
	.align 2, 0
_0801C2D8: .4byte gUnknown_02024C10
	thumb_func_end atk40_801DBA0

	thumb_func_start sub_801C108
sub_801C108: @ 801C2DC
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r4, 0
	ldr r1, _0801C330
	ldr r0, _0801C334
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0801C328
	ldr r2, _0801C338
	ldr r0, _0801C33C
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x8]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801C328
	ldr r2, _0801C340
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x7
	adds r1, r3, 0
	bl mcmd_jump_if_move_not_executed
	ldr r1, _0801C344
	movs r0, 0x1
	strb r0, [r1, 0x6]
	movs r4, 0x1
_0801C328:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801C330: .4byte gUnknown_02024D28
_0801C334: .4byte gUnknown_02024C08
_0801C338: .4byte gBattleMoves
_0801C33C: .4byte gUnknown_02024BE6
_0801C340: .4byte gUnknown_02024C68
_0801C344: .4byte gUnknown_02024D1E
	thumb_func_end sub_801C108

	thumb_func_start sub_801C174
sub_801C174: @ 801C348
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _0801C3A8
	ldr r3, _0801C3AC
	ldrb r4, [r3]
	lsls r0, r4, 2
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x18
	ands r1, r0
	adds r6, r2, 0
	cmp r1, 0
	beq _0801C37A
	ldr r1, _0801C3B0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _0801C3B4
	ldrb r0, [r0, 0x15]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0801C464
_0801C37A:
	ldr r0, _0801C3B8
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 9
	ands r1, r2
	adds r2, r0, 0
	cmp r1, 0
	bne _0801C3C0
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801C3C0
_0801C39A:
	ldr r0, _0801C3BC
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _0801C464
	.align 2, 0
_0801C3A8: .4byte gUnknown_02024C98
_0801C3AC: .4byte gUnknown_02024C08
_0801C3B0: .4byte gUnknown_02024CA8
_0801C3B4: .4byte gUnknown_02024C07
_0801C3B8: .4byte gUnknown_02024C6C
_0801C3BC: .4byte gUnknown_02024C68
_0801C3C0:
	ldr r0, [r2]
	ldr r1, _0801C470
	ands r0, r1
	str r0, [r2]
	movs r1, 0x80
	lsls r1, 10
	ands r0, r1
	cmp r0, 0
	bne _0801C3E2
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0801C39A
_0801C3E2:
	ldr r0, [r2]
	ldr r1, _0801C474
	ands r0, r1
	str r0, [r2]
	movs r1, 0x80
	lsls r1, 11
	ands r0, r1
	cmp r0, 0
	bne _0801C402
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	bne _0801C39A
_0801C402:
	ldr r0, [r2]
	ldr r1, _0801C478
	ands r0, r1
	str r0, [r2]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r5, 1
	cmp r0, 0
	bne _0801C452
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801C452
	ldr r0, _0801C47C
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801C452
	ldr r0, _0801C480
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x98
	beq _0801C464
_0801C452:
	ldr r1, _0801C480
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x11
	beq _0801C464
	cmp r0, 0x4E
	bne _0801C484
_0801C464:
	movs r0, 0x7
	adds r1, r5, 0
	bl mcmd_jump_if_move_not_executed
	movs r0, 0x1
	b _0801C486
	.align 2, 0
_0801C470: .4byte 0xfffeffff
_0801C474: .4byte 0xfffdffff
_0801C478: .4byte 0xfffbffff
_0801C47C: .4byte word_2024DB8
_0801C480: .4byte gBattleMoves
_0801C484:
	movs r0, 0
_0801C486:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_801C174

	thumb_func_start atk01_accuracycheck
atk01_accuracycheck: @ 801C490
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _0801C4E8
	ldr r5, [r0]
	ldrb r6, [r5, 0x5]
	ldrb r1, [r5, 0x6]
	lsls r1, 8
	orrs r6, r1
	adds r1, r6, 0x2
	lsls r1, 16
	lsrs r1, 16
	adds r7, r0, 0
	cmp r1, 0x1
	bhi _0801C54C
	ldr r2, _0801C4EC
	ldr r3, _0801C4F0
	ldrb r4, [r3]
	lsls r0, r4, 2
	adds r0, r2
	ldr r1, [r0]
	movs r0, 0x18
	ands r1, r0
	cmp r1, 0
	beq _0801C500
	ldr r0, _0801C4F4
	cmp r6, r0
	bne _0801C500
	ldr r1, _0801C4F8
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _0801C4FC
	ldrb r0, [r0, 0x15]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801C500
	adds r0, r5, 0x7
	str r0, [r7]
	b _0801C806
	.align 2, 0
_0801C4E8: .4byte gUnknown_02024C10
_0801C4EC: .4byte gUnknown_02024C98
_0801C4F0: .4byte gUnknown_02024C08
_0801C4F4: .4byte 0x0000ffff
_0801C4F8: .4byte gUnknown_02024CA8
_0801C4FC: .4byte gUnknown_02024C07
_0801C500:
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ldr r1, _0801C52C
	ands r0, r1
	cmp r0, 0
	beq _0801C530
	ldr r2, [r7]
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
	str r1, [r7]
	b _0801C806
	.align 2, 0
_0801C52C: .4byte 0x000400c0
_0801C530:
	movs r0, 0
	bl sub_801C108
	lsls r0, 24
	cmp r0, 0
	beq _0801C53E
	b _0801C806
_0801C53E:
	ldr r1, _0801C548
	ldr r0, [r1]
	adds r0, 0x7
	str r0, [r1]
	b _0801C806
	.align 2, 0
_0801C548: .4byte gUnknown_02024C10
_0801C54C:
	cmp r6, 0
	bne _0801C554
	ldr r0, _0801C56C
	ldrh r6, [r0]
_0801C554:
	ldr r0, _0801C570
	ldr r1, _0801C574
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801C578
	movs r2, 0x3F
	mov r10, r2
	mov r3, r10
	ands r3, r0
	mov r10, r3
	b _0801C586
	.align 2, 0
_0801C56C: .4byte gUnknown_02024BE6
_0801C570: .4byte 0x02000000
_0801C574: .4byte 0x0001601c
_0801C578:
	ldr r1, _0801C5CC
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	mov r10, r0
_0801C586:
	adds r0, r6, 0
	bl sub_801C108
	lsls r0, 24
	cmp r0, 0
	beq _0801C594
	b _0801C806
_0801C594:
	adds r0, r6, 0
	bl sub_801C174
	lsls r0, 24
	cmp r0, 0
	beq _0801C5A2
	b _0801C806
_0801C5A2:
	ldr r3, _0801C5D0
	ldr r0, _0801C5D4
	ldrb r0, [r0]
	movs r2, 0x58
	adds r4, r0, 0
	muls r4, r2
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801C5DC
	ldr r0, _0801C5D8
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	ldrb r5, [r0, 0x1E]
	b _0801C5F2
	.align 2, 0
_0801C5CC: .4byte gBattleMoves
_0801C5D0: .4byte gBattleMons
_0801C5D4: .4byte gUnknown_02024C08
_0801C5D8: .4byte gUnknown_02024C07
_0801C5DC:
	ldr r0, _0801C740
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	ldrb r0, [r0, 0x1E]
	adds r0, 0x6
	adds r1, r4, r3
	ldrb r1, [r1, 0x1F]
	subs r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
_0801C5F2:
	lsls r0, r5, 24
	cmp r0, 0
	bge _0801C5FA
	movs r5, 0
_0801C5FA:
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0xC
	ble _0801C604
	movs r5, 0xC
_0801C604:
	ldr r1, _0801C744
	lsls r4, r6, 1
	adds r0, r4, r6
	lsls r0, 2
	adds r7, r0, r1
	ldrb r0, [r7, 0x3]
	mov r8, r0
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp, 0x4]
	cmp r0, 0
	bne _0801C656
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801C656
	ldr r0, _0801C748
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0801C656
	ldrb r0, [r7]
	cmp r0, 0x98
	bne _0801C656
	movs r1, 0x32
	mov r8, r1
_0801C656:
	ldr r1, _0801C74C
	lsls r0, r5, 24
	asrs r0, 22
	adds r0, r1
	ldrb r1, [r0]
	mov r4, r8
	muls r4, r1
	ldrb r1, [r0, 0x1]
	adds r0, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r7, _0801C750
	ldr r0, _0801C740
	ldrb r0, [r0]
	movs r5, 0x58
	muls r0, r5
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0xE
	bne _0801C694
	lsls r0, r4, 6
	adds r0, r4
	lsls r0, 1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801C694:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0801C6EC
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801C6EC
	ldr r0, _0801C754
	ldrb r0, [r0]
	muls r0, r5
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _0801C6EC
	ldr r0, _0801C748
	ldrh r1, [r0]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _0801C6EC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801C6EC:
	ldr r2, _0801C750
	ldr r0, _0801C740
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	mov r9, r2
	cmp r0, 0x37
	bne _0801C718
	mov r2, r10
	cmp r2, 0x8
	bhi _0801C718
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801C718:
	ldr r3, _0801C754
	mov r8, r3
	ldrb r2, [r3]
	movs r7, 0x58
	adds r0, r2, 0
	muls r0, r7
	mov r3, r9
	adds r1, r0, r3
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801C75C
	ldr r1, _0801C758
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r5, [r0, 0x7]
	ldrb r2, [r0, 0x1A]
	b _0801C778
	.align 2, 0
_0801C740: .4byte gUnknown_02024C07
_0801C744: .4byte gBattleMoves
_0801C748: .4byte word_2024DB8
_0801C74C: .4byte gAccuracyStageRatios
_0801C750: .4byte gBattleMons
_0801C754: .4byte gUnknown_02024C08
_0801C758: .4byte gEnigmaBerries
_0801C75C:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r2, r0, 24
_0801C778:
	ldr r0, _0801C7DC
	ldr r1, _0801C7E0
	ldrb r1, [r1]
	strb r1, [r0]
	cmp r5, 0x16
	bne _0801C794
	movs r0, 0x64
	subs r0, r2
	muls r0, r4
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r4, r0, 16
_0801C794:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x1
	cmp r0, r4
	ble _0801C7FE
	ldr r2, _0801C7E4
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801C7E8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801C7F4
	ldr r1, _0801C7EC
	ldr r2, [sp, 0x4]
	adds r0, r2, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x8
	beq _0801C7D6
	cmp r0, 0x20
	bne _0801C7F4
_0801C7D6:
	ldr r1, _0801C7F0
	movs r0, 0x2
	b _0801C7F8
	.align 2, 0
_0801C7DC: .4byte gUnknown_02024C0B
_0801C7E0: .4byte gUnknown_02024C08
_0801C7E4: .4byte gUnknown_02024C68
_0801C7E8: .4byte gUnknown_020239F8
_0801C7EC: .4byte gBattleMoves
_0801C7F0: .4byte gUnknown_02024D1E
_0801C7F4:
	ldr r1, _0801C818
	movs r0, 0
_0801C7F8:
	strb r0, [r1, 0x6]
	bl b_wonderguard_and_levitate
_0801C7FE:
	movs r0, 0x7
	adds r1, r6, 0
	bl mcmd_jump_if_move_not_executed
_0801C806:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C818: .4byte gUnknown_02024D1E
	thumb_func_end atk01_accuracycheck

	thumb_func_start atk02_attackstring
atk02_attackstring: @ 801C81C
	push {r4,r5,lr}
	ldr r0, _0801C85C
	ldr r5, [r0]
	cmp r5, 0
	bne _0801C854
	ldr r4, _0801C860
	ldr r0, [r4]
	movs r1, 0xC0
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	bne _0801C848
	ldr r0, _0801C864
	ldrb r1, [r0]
	movs r0, 0x4
	bl b_std_message
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	str r0, [r4]
_0801C848:
	ldr r0, _0801C868
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _0801C86C
	strb r5, [r0, 0x7]
_0801C854:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801C85C: .4byte gUnknown_02024A64
_0801C860: .4byte gUnknown_02024C6C
_0801C864: .4byte gUnknown_02024C07
_0801C868: .4byte gUnknown_02024C10
_0801C86C: .4byte gUnknown_02024D1E
	thumb_func_end atk02_attackstring

	thumb_func_start atk03_ppreduce
atk03_ppreduce: @ 801C870
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r6, 0x1
	ldr r0, _0801C8C0
	ldr r0, [r0]
	cmp r0, 0
	beq _0801C888
	b _0801CA22
_0801C888:
	ldr r1, _0801C8C4
	ldr r2, _0801C8C8
	ldrb r3, [r2]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r4, r0, 31
	mov r9, r2
	cmp r4, 0
	bne _0801C92A
	ldr r2, _0801C8CC
	ldr r0, _0801C8D0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0x20
	beq _0801C8DA
	cmp r0, 0x20
	bgt _0801C8D4
	cmp r0, 0x8
	beq _0801C8F0
	b _0801C90A
	.align 2, 0
_0801C8C0: .4byte gUnknown_02024A64
_0801C8C4: .4byte gUnknown_02024D68
_0801C8C8: .4byte gUnknown_02024C07
_0801C8CC: .4byte gBattleMoves
_0801C8D0: .4byte gUnknown_02024BE6
_0801C8D4:
	cmp r0, 0x40
	beq _0801C8F0
	b _0801C90A
_0801C8DA:
	str r4, [sp]
	movs r0, 0x12
	adds r1, r3, 0
	movs r2, 0x2E
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0x1
	b _0801C92A
_0801C8F0:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0x2E
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0
	b _0801C92A
_0801C90A:
	ldr r1, _0801C98C
	mov r2, r9
	ldrb r0, [r2]
	ldrb r7, [r1]
	cmp r0, r7
	beq _0801C92A
	ldr r2, _0801C990
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2E
	bne _0801C92A
	adds r6, 0x1
_0801C92A:
	ldr r0, _0801C994
	ldr r4, [r0]
	movs r0, 0xA0
	lsls r0, 4
	ands r4, r0
	cmp r4, 0
	bne _0801CA10
	ldr r2, _0801C990
	ldr r3, _0801C998
	ldr r1, _0801C99C
	ldrb r5, [r1]
	movs r0, 0x58
	mov r8, r0
	mov r0, r8
	muls r0, r5
	ldrb r7, [r3]
	adds r0, r7
	movs r7, 0x24
	adds r7, r2
	mov r12, r7
	add r0, r12
	ldrb r0, [r0]
	mov r9, r1
	mov r10, r2
	adds r7, r3, 0
	cmp r0, 0
	beq _0801CA10
	ldr r0, _0801C9A0
	lsls r1, r5, 4
	adds r1, r0
	ldrb r0, [r1, 0x2]
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x2]
	mov r1, r9
	ldrb r0, [r1]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldrb r1, [r7]
	adds r0, r1
	mov r1, r12
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, r6
	ble _0801C9A4
	subs r0, r6
	strb r0, [r2]
	b _0801C9A6
	.align 2, 0
_0801C98C: .4byte gUnknown_02024C08
_0801C990: .4byte gBattleMons
_0801C994: .4byte gUnknown_02024C6C
_0801C998: .4byte gUnknown_02024BE4
_0801C99C: .4byte gUnknown_02024C07
_0801C9A0: .4byte gUnknown_02024D28
_0801C9A4:
	strb r4, [r2]
_0801C9A6:
	mov r2, r9
	ldrb r3, [r2]
	movs r4, 0x58
	adds r0, r3, 0
	muls r0, r4
	mov r1, r10
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0801CA10
	ldr r1, _0801CA34
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0801CA38
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0801CA10
	ldr r0, _0801CA3C
	strb r3, [r0]
	ldrb r1, [r7]
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r4
	mov r2, r10
	adds r2, 0x24
	adds r0, r2
	ldrb r7, [r7]
	adds r0, r7
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	mov r7, r9
	ldrb r0, [r7]
	bl dp01_battle_side_mark_buffer_for_execution
_0801CA10:
	ldr r2, _0801CA40
	ldr r0, [r2]
	ldr r1, _0801CA44
	ands r0, r1
	str r0, [r2]
	ldr r1, _0801CA48
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801CA22:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CA34: .4byte gUnknown_02024CA8
_0801CA38: .4byte gBitTable
_0801CA3C: .4byte gUnknown_02024A60
_0801CA40: .4byte gUnknown_02024C6C
_0801CA44: .4byte 0xfffff7ff
_0801CA48: .4byte gUnknown_02024C10
	thumb_func_end atk03_ppreduce

	thumb_func_start atk04_critcalc
atk04_critcalc: @ 801CA4C
	push {r4-r7,lr}
	ldr r1, _0801CA70
	ldr r0, _0801CA74
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	cmp r0, 0xAF
	bne _0801CA7C
	ldr r1, _0801CA78
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	b _0801CA84
	.align 2, 0
_0801CA70: .4byte gBattleMons
_0801CA74: .4byte gUnknown_02024C07
_0801CA78: .4byte gEnigmaBerries
_0801CA7C:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
_0801CA84:
	ldr r1, _0801CB10
	ldr r3, _0801CB14
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r4, _0801CB18
	ldrb r1, [r3]
	movs r0, 0x58
	adds r7, r1, 0
	muls r7, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	negs r0, r0
	asrs r5, r0, 31
	movs r0, 0x2
	ands r5, r0
	ldr r2, _0801CB1C
	ldr r0, _0801CB20
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	mov r12, r3
	cmp r1, 0x2B
	bne _0801CAC4
	adds r5, 0x1
_0801CAC4:
	adds r0, r5, 0
	cmp r1, 0x4B
	bne _0801CACC
	adds r0, 0x1
_0801CACC:
	cmp r1, 0xC8
	bne _0801CAD2
	adds r0, 0x1
_0801CAD2:
	adds r2, r0, 0
	cmp r1, 0xD1
	bne _0801CADA
	adds r2, 0x1
_0801CADA:
	movs r1, 0
	cmp r6, 0x3F
	bne _0801CAEA
	adds r0, r7, r4
	ldrh r0, [r0]
	cmp r0, 0x71
	bne _0801CAEA
	movs r1, 0x1
_0801CAEA:
	lsls r5, r1, 1
	movs r3, 0
	cmp r6, 0x42
	bne _0801CB04
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0x53
	bne _0801CB04
	movs r3, 0x1
_0801CB04:
	lsls r1, r3, 1
	cmp r6, 0x29
	bne _0801CB24
	adds r0, r5, 0x1
	adds r0, r2, r0
	b _0801CB26
	.align 2, 0
_0801CB10: .4byte gUnknown_02024C0B
_0801CB14: .4byte gUnknown_02024C07
_0801CB18: .4byte gBattleMons
_0801CB1C: .4byte gBattleMoves
_0801CB20: .4byte gUnknown_02024BE6
_0801CB24:
	adds r0, r2, r5
_0801CB26:
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	cmp r5, 0x4
	bls _0801CB34
	movs r5, 0x4
_0801CB34:
	ldr r0, _0801CB90
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r4, [r0]
	cmp r4, 0x4
	beq _0801CBA4
	cmp r4, 0x4B
	beq _0801CBA4
	ldr r1, _0801CB94
	mov r2, r12
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _0801CBA4
	ldr r0, _0801CB98
	ldrh r1, [r0]
	movs r0, 0x84
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _0801CBA4
	bl Random
	ldr r2, _0801CB9C
	lsls r1, r5, 1
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _0801CBA4
	ldr r1, _0801CBA0
	movs r0, 0x2
	b _0801CBA8
	.align 2, 0
_0801CB90: .4byte gUnknown_02024C08
_0801CB94: .4byte gUnknown_02024C98
_0801CB98: .4byte gUnknown_020239F8
_0801CB9C: .4byte gCriticalHitChance
_0801CBA0: .4byte gCritMultiplier
_0801CBA4:
	ldr r1, _0801CBB8
	movs r0, 0x1
_0801CBA8:
	strb r0, [r1]
	ldr r1, _0801CBBC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CBB8: .4byte gCritMultiplier
_0801CBBC: .4byte gUnknown_02024C10
	thumb_func_end atk04_critcalc

	thumb_func_start atk05_damagecalc1
atk05_damagecalc1: @ 801CBC0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r4, _0801CC90
	ldr r6, _0801CC94
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldr r0, _0801CC98
	mov r8, r0
	ldrb r0, [r0]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _0801CC9C
	adds r0, r2
	ldrb r1, [r6]
	muls r1, r4
	adds r1, r2
	ldr r2, _0801CCA0
	mov r9, r2
	ldrh r2, [r2]
	ldr r4, _0801CCA4
	ldrh r4, [r4]
	str r4, [sp]
	ldr r5, _0801CCA8
	ldr r7, _0801CCAC
	adds r4, r5, r7
	ldrb r4, [r4]
	str r4, [sp, 0x4]
	mov r7, r8
	ldrb r4, [r7]
	str r4, [sp, 0x8]
	ldrb r4, [r6]
	str r4, [sp, 0xC]
	bl CalculateBaseDamage
	ldr r4, _0801CCB0
	ldr r1, _0801CCB4
	ldrb r1, [r1]
	muls r1, r0
	ldr r0, _0801CCB8
	adds r5, r0
	ldrb r0, [r5]
	adds r3, r1, 0
	muls r3, r0
	str r3, [r4]
	ldr r1, _0801CCBC
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _0801CC56
	ldr r2, _0801CCC0
	mov r7, r9
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	cmp r0, 0xD
	bne _0801CC56
	lsls r0, r3, 1
	str r0, [r4]
_0801CC56:
	ldr r1, _0801CCC4
	ldr r0, _0801CC98
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _0801CC78
	ldr r4, _0801CCB0
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0801CC78:
	ldr r1, _0801CCC8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CC90: .4byte gUnknown_02024C7A
_0801CC94: .4byte gUnknown_02024C08
_0801CC98: .4byte gUnknown_02024C07
_0801CC9C: .4byte gBattleMons
_0801CCA0: .4byte gUnknown_02024BE6
_0801CCA4: .4byte gUnknown_02024DEC
_0801CCA8: .4byte 0x02000000
_0801CCAC: .4byte 0x0001601c
_0801CCB0: .4byte gUnknown_02024BEC
_0801CCB4: .4byte gCritMultiplier
_0801CCB8: .4byte 0x0001601f
_0801CCBC: .4byte gUnknown_02024C98
_0801CCC0: .4byte gBattleMoves
_0801CCC4: .4byte gUnknown_02024D28
_0801CCC8: .4byte gUnknown_02024C10
	thumb_func_end atk05_damagecalc1

	thumb_func_start sub_801CAF8
sub_801CAF8: @ 801CCCC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0801CD90
	adds r0, r5, 0
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x58
	adds r0, r7, 0
	muls r0, r1
	ldr r2, _0801CD94
	adds r0, r2
	muls r1, r5
	adds r1, r2
	ldr r2, _0801CD98
	mov r9, r2
	ldrh r2, [r2]
	ldr r4, _0801CD9C
	mov r8, r4
	ldrh r4, [r4]
	str r4, [sp]
	ldr r6, _0801CDA0
	ldr r4, _0801CDA4
	ldrb r4, [r4, r6]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	str r5, [sp, 0xC]
	bl CalculateBaseDamage
	ldr r4, _0801CDA8
	movs r1, 0
	mov r2, r8
	strh r1, [r2]
	ldr r1, _0801CDAC
	ldrb r1, [r1]
	muls r1, r0
	ldr r0, _0801CDB0
	adds r6, r0
	ldrb r0, [r6]
	adds r3, r1, 0
	muls r3, r0
	str r3, [r4]
	ldr r1, _0801CDB4
	lsls r0, r7, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 2
	ands r0, r1
	cmp r0, 0
	beq _0801CD62
	ldr r2, _0801CDB8
	mov r6, r9
	ldrh r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	cmp r0, 0xD
	bne _0801CD62
	lsls r0, r3, 1
	str r0, [r4]
_0801CD62:
	ldr r0, _0801CDBC
	lsls r1, r7, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 28
	cmp r0, 0
	bge _0801CD80
	ldr r4, _0801CDA8
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0801CD80:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CD90: .4byte gUnknown_02024C7A
_0801CD94: .4byte gBattleMons
_0801CD98: .4byte gUnknown_02024BE6
_0801CD9C: .4byte gUnknown_02024DEC
_0801CDA0: .4byte 0x02000000
_0801CDA4: .4byte 0x0001601c
_0801CDA8: .4byte gUnknown_02024BEC
_0801CDAC: .4byte gCritMultiplier
_0801CDB0: .4byte 0x0001601f
_0801CDB4: .4byte gUnknown_02024C98
_0801CDB8: .4byte gBattleMoves
_0801CDBC: .4byte gUnknown_02024D28
	thumb_func_end sub_801CAF8

	thumb_func_start battle_attack_damage_modulate_by_effectivity
battle_attack_damage_modulate_by_effectivity: @ 801CDC0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0801CDF0
	ldr r0, [r5]
	muls r0, r4
	movs r1, 0xA
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _0801CDE0
	cmp r4, 0
	beq _0801CDE0
	movs r0, 0x1
	str r0, [r5]
_0801CDE0:
	cmp r4, 0x5
	beq _0801CE10
	cmp r4, 0x5
	bgt _0801CDF4
	cmp r4, 0
	beq _0801CDFA
	b _0801CE92
	.align 2, 0
_0801CDF0: .4byte gUnknown_02024BEC
_0801CDF4:
	cmp r4, 0x14
	beq _0801CE50
	b _0801CE92
_0801CDFA:
	ldr r2, _0801CE0C
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0xFB
	ands r0, r1
	movs r1, 0xFD
	ands r0, r1
	b _0801CE90
	.align 2, 0
_0801CE0C: .4byte gUnknown_02024C68
_0801CE10:
	ldr r2, _0801CE40
	ldr r0, _0801CE44
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801CE92
	ldr r2, _0801CE48
	ldrb r1, [r2]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801CE92
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801CE4C
	movs r0, 0xFD
	ands r0, r1
	b _0801CE90
	.align 2, 0
_0801CE40: .4byte gBattleMoves
_0801CE44: .4byte gUnknown_02024BE6
_0801CE48: .4byte gUnknown_02024C68
_0801CE4C:
	movs r0, 0x4
	b _0801CE8E
_0801CE50:
	ldr r2, _0801CE80
	ldr r0, _0801CE84
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801CE92
	ldr r2, _0801CE88
	ldrb r1, [r2]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801CE92
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801CE8C
	movs r0, 0xFB
	ands r0, r1
	b _0801CE90
	.align 2, 0
_0801CE80: .4byte gBattleMoves
_0801CE84: .4byte gUnknown_02024BE6
_0801CE88: .4byte gUnknown_02024C68
_0801CE8C:
	movs r0, 0x2
_0801CE8E:
	orrs r0, r1
_0801CE90:
	strb r0, [r2]
_0801CE92:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end battle_attack_damage_modulate_by_effectivity

	thumb_func_start atk06_damagecalc2
atk06_damagecalc2: @ 801CE98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r3, 0
	ldr r1, _0801CEC4
	ldrh r0, [r1]
	cmp r0, 0xA5
	bne _0801CEAC
	b _0801D0C8
_0801CEAC:
	ldr r0, _0801CEC8
	ldr r2, _0801CECC
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801CED0
	movs r1, 0x3F
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	b _0801CEE0
	.align 2, 0
_0801CEC4: .4byte gUnknown_02024BE6
_0801CEC8: .4byte 0x02000000
_0801CECC: .4byte 0x0001601c
_0801CED0:
	ldr r2, _0801CF68
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	mov r8, r0
_0801CEE0:
	ldr r2, _0801CF6C
	ldr r0, _0801CF70
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	adds r5, r2, 0
	cmp r0, r8
	beq _0801CF02
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r8
	bne _0801CF18
_0801CF02:
	ldr r4, _0801CF74
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	str r0, [r4]
	movs r1, 0xA
	str r3, [sp, 0x4]
	bl __divsi3
	str r0, [r4]
	ldr r3, [sp, 0x4]
_0801CF18:
	ldr r2, _0801CF78
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r2, 0
	cmp r0, 0x1A
	bne _0801CF90
	mov r1, r8
	cmp r1, 0x4
	bne _0801CF90
	ldr r3, _0801CF7C
	strb r0, [r3]
	ldr r2, _0801CF80
	ldrb r0, [r2]
	movs r1, 0x9
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801CF84
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801CF88
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldr r0, _0801CF8C
	mov r2, r8
	strb r2, [r0, 0x6]
	ldrb r0, [r4]
	ldrb r1, [r3]
	bl sub_81074C4
	b _0801D02C
	.align 2, 0
_0801CF68: .4byte gBattleMoves
_0801CF6C: .4byte gBattleMons
_0801CF70: .4byte gUnknown_02024C07
_0801CF74: .4byte gUnknown_02024BEC
_0801CF78: .4byte gUnknown_02024C08
_0801CF7C: .4byte byte_2024C06
_0801CF80: .4byte gUnknown_02024C68
_0801CF84: .4byte gUnknown_02024C3C
_0801CF88: .4byte gUnknown_02024C44
_0801CF8C: .4byte gUnknown_02024D1E
_0801CF90:
	ldr r1, _0801CF9C
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r2, r1, 0
	b _0801D00C
	.align 2, 0
_0801CF9C: .4byte gTypeEffectiveness
_0801CFA0:
	adds r3, 0x3
	b _0801D008
_0801CFA4:
	ldr r5, _0801D0DC
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, r8
	bne _0801D000
	adds r1, r3, 0x1
	adds r1, r5
	ldr r2, _0801D0E0
	ldr r7, _0801D0E4
	ldrb r0, [r7]
	movs r6, 0x58
	muls r0, r6
	adds r0, r2
	adds r0, 0x21
	ldrb r4, [r1]
	ldrb r0, [r0]
	cmp r4, r0
	bne _0801CFDA
	adds r0, r3, 0x2
	adds r0, r5
	ldrb r0, [r0]
	str r2, [sp]
	str r3, [sp, 0x4]
	bl battle_attack_damage_modulate_by_effectivity
	ldr r3, [sp, 0x4]
	ldr r2, [sp]
_0801CFDA:
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r4, r1
	bne _0801D000
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r4
	beq _0801D000
	adds r0, r3, 0x2
	adds r0, r5
	ldrb r0, [r0]
	str r3, [sp, 0x4]
	bl battle_attack_damage_modulate_by_effectivity
	ldr r3, [sp, 0x4]
_0801D000:
	adds r3, 0x3
	ldr r5, _0801D0E0
	ldr r4, _0801D0E4
	ldr r2, _0801D0DC
_0801D008:
	adds r0, r3, r2
	ldrb r0, [r0]
_0801D00C:
	cmp r0, 0xFF
	beq _0801D02C
	cmp r0, 0xFE
	bne _0801CFA4
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r1, r5, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801CFA0
_0801D02C:
	ldr r2, _0801D0E0
	ldr r5, _0801D0E4
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r6, [r0]
	cmp r6, 0x19
	bne _0801D0AA
	ldr r0, _0801D0E8
	ldrb r0, [r0]
	ldr r7, _0801D0EC
	ldrh r1, [r7]
	bl move_weather_interaction
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0801D0AA
	ldr r1, _0801D0F0
	mov r8, r1
	ldrb r4, [r1]
	ands r0, r4
	cmp r0, 0
	beq _0801D068
	movs r0, 0x6
	ands r0, r4
	cmp r0, 0x6
	bne _0801D0AA
_0801D068:
	ldr r2, _0801D0F4
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801D0AA
	ldr r3, _0801D0F8
	strb r6, [r3]
	movs r0, 0x1
	orrs r0, r4
	mov r2, r8
	strb r0, [r2]
	ldr r1, _0801D0FC
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0801D100
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _0801D104
	movs r0, 0x3
	strb r0, [r1, 0x6]
	ldrb r0, [r5]
	ldrb r1, [r3]
	bl sub_81074C4
_0801D0AA:
	ldr r0, _0801D0F0
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801D0C8
	ldr r2, _0801D108
	ldr r0, _0801D0E8
	ldrb r1, [r0]
	lsls r1, 4
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x1]
_0801D0C8:
	ldr r1, _0801D10C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D0DC: .4byte gTypeEffectiveness
_0801D0E0: .4byte gBattleMons
_0801D0E4: .4byte gUnknown_02024C08
_0801D0E8: .4byte gUnknown_02024C07
_0801D0EC: .4byte gUnknown_02024BE6
_0801D0F0: .4byte gUnknown_02024C68
_0801D0F4: .4byte gBattleMoves
_0801D0F8: .4byte byte_2024C06
_0801D0FC: .4byte gUnknown_02024C3C
_0801D100: .4byte gUnknown_02024C44
_0801D104: .4byte gUnknown_02024D1E
_0801D108: .4byte gUnknown_02024D28
_0801D10C: .4byte gUnknown_02024C10
	thumb_func_end atk06_damagecalc2

	thumb_func_start b_wonderguard_and_levitate
b_wonderguard_and_levitate: @ 801D110
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _0801D154
	ldrh r1, [r0]
	mov r9, r0
	cmp r1, 0xA5
	bne _0801D128
	b _0801D378
_0801D128:
	ldr r2, _0801D158
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _0801D13A
	b _0801D378
_0801D13A:
	ldr r0, _0801D15C
	ldr r2, _0801D160
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801D164
	movs r1, 0x3F
	mov r12, r1
	mov r2, r12
	ands r2, r0
	mov r12, r2
	b _0801D168
	.align 2, 0
_0801D154: .4byte gUnknown_02024BE6
_0801D158: .4byte gBattleMoves
_0801D15C: .4byte 0x02000000
_0801D160: .4byte 0x0001601c
_0801D164:
	ldrb r1, [r1, 0x2]
	mov r12, r1
_0801D168:
	ldr r2, _0801D19C
	ldr r3, _0801D1A0
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r1, [r0]
	adds r7, r2, 0
	mov r8, r3
	cmp r1, 0x1A
	bne _0801D1AC
	mov r0, r12
	cmp r0, 0x4
	bne _0801D1AC
	ldr r0, _0801D1A4
	strb r1, [r0]
	ldr r0, _0801D1A8
	mov r1, r12
	strb r1, [r0, 0x6]
	ldrb r0, [r3]
	movs r1, 0x1A
	bl sub_81074C4
	b _0801D378
	.align 2, 0
_0801D19C: .4byte gBattleMons
_0801D1A0: .4byte gUnknown_02024C08
_0801D1A4: .4byte byte_2024C06
_0801D1A8: .4byte gUnknown_02024D1E
_0801D1AC:
	ldr r1, _0801D1B8
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r4, r1, 0
	b _0801D2FE
	.align 2, 0
_0801D1B8: .4byte gTypeEffectiveness
_0801D1BC:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, r12
	beq _0801D1C6
	b _0801D2F8
_0801D1C6:
	adds r2, r5, 0x1
	adds r3, r2, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x21
	ldrb r1, [r3]
	adds r3, r2, 0
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801D206
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801D206
	ldr r2, _0801D384
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801D388
	ldr r0, _0801D38C
	ldrb r2, [r0]
	lsls r2, 4
	adds r2, r1
	ldrb r0, [r2, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1]
_0801D206:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _0801D24C
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _0801D24C
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801D24C
	ldr r2, _0801D384
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801D388
	ldr r0, _0801D38C
	ldrb r2, [r0]
	lsls r2, 4
	adds r2, r1
	ldrb r0, [r2, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x1]
_0801D24C:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x21
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801D270
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _0801D270
	movs r0, 0x1
	orrs r6, r0
_0801D270:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _0801D29E
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _0801D29E
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _0801D29E
	movs r0, 0x1
	orrs r6, r0
_0801D29E:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x21
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0801D2C6
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _0801D2C6
	movs r0, 0x2
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0801D2C6:
	adds r2, r3, r4
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _0801D2F8
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _0801D2F8
	adds r0, r5, 0x2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _0801D2F8
	movs r0, 0x2
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_0801D2F8:
	adds r5, 0x3
	adds r0, r5, r4
	ldrb r0, [r0]
_0801D2FE:
	cmp r0, 0xFF
	beq _0801D322
	cmp r0, 0xFE
	beq _0801D308
	b _0801D1BC
_0801D308:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801D2F8
_0801D322:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r4, [r0]
	cmp r4, 0x19
	bne _0801D378
	ldr r0, _0801D38C
	ldrb r0, [r0]
	mov r2, r9
	ldrh r1, [r2]
	bl move_weather_interaction
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0801D378
	movs r0, 0x3
	ands r6, r0
	cmp r6, 0x1
	beq _0801D378
	ldr r2, _0801D390
	mov r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0801D378
	ldr r0, _0801D394
	strb r4, [r0]
	ldr r1, _0801D398
	movs r0, 0x3
	strb r0, [r1, 0x6]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x19
	bl sub_81074C4
_0801D378:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D384: .4byte gUnknown_02024C68
_0801D388: .4byte gUnknown_02024D28
_0801D38C: .4byte gUnknown_02024C07
_0801D390: .4byte gBattleMoves
_0801D394: .4byte byte_2024C06
_0801D398: .4byte gUnknown_02024D1E
	thumb_func_end b_wonderguard_and_levitate

	thumb_func_start b_attack_effectivity_adapt
b_attack_effectivity_adapt: @ 801D39C
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _0801D3D0
	ldr r0, [r7]
	muls r0, r4
	movs r1, 0xA
	bl __divsi3
	str r0, [r7]
	cmp r0, 0
	bne _0801D3C2
	cmp r4, 0
	beq _0801D3C2
	movs r0, 0x1
	str r0, [r7]
_0801D3C2:
	cmp r4, 0x5
	beq _0801D3EA
	cmp r4, 0x5
	bgt _0801D3D4
	cmp r4, 0
	beq _0801D3DA
	b _0801D44E
	.align 2, 0
_0801D3D0: .4byte gUnknown_02024BEC
_0801D3D4:
	cmp r4, 0x14
	beq _0801D41C
	b _0801D44E
_0801D3DA:
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0xFB
	ands r0, r1
	movs r1, 0xFD
	ands r0, r1
	b _0801D44C
_0801D3EA:
	ldr r0, _0801D414
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801D44E
	ldrb r1, [r6]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801D44E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801D418
	movs r0, 0xFD
	ands r0, r1
	b _0801D44C
	.align 2, 0
_0801D414: .4byte gBattleMoves
_0801D418:
	movs r0, 0x4
	b _0801D44A
_0801D41C:
	ldr r0, _0801D444
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801D44E
	ldrb r1, [r6]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801D44E
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801D448
	movs r0, 0xFB
	ands r0, r1
	b _0801D44C
	.align 2, 0
_0801D444: .4byte gBattleMoves
_0801D448:
	movs r0, 0x2
_0801D44A:
	orrs r0, r1
_0801D44C:
	strb r0, [r6]
_0801D44E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end b_attack_effectivity_adapt

	thumb_func_start move_effectiveness_something
move_effectiveness_something: @ 801D454
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	movs r7, 0
	mov r0, sp
	strb r7, [r0]
	mov r0, r10
	cmp r0, 0xA5
	bne _0801D482
	movs r0, 0
	b _0801D60E
_0801D482:
	ldr r1, _0801D4F0
	mov r3, r10
	lsls r2, r3, 1
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	str r0, [sp, 0x8]
	ldr r1, _0801D4F4
	movs r0, 0x58
	ldr r3, [sp, 0x4]
	muls r0, r3
	adds r3, r0, r1
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r0, [r0]
	str r2, [sp, 0xC]
	adds r5, r1, 0
	ldr r1, [sp, 0x8]
	cmp r0, r1
	beq _0801D4B6
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	bne _0801D4C8
_0801D4B6:
	ldr r4, _0801D4F8
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	str r0, [r4]
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_0801D4C8:
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	bne _0801D4FC
	ldr r3, [sp, 0x8]
	cmp r3, 0x4
	bne _0801D4FC
	movs r1, 0x9
	mov r0, sp
	ldrb r0, [r0]
	orrs r0, r1
	mov r1, sp
	strb r0, [r1]
	b _0801D5B0
	.align 2, 0
_0801D4F0: .4byte gBattleMoves
_0801D4F4: .4byte gBattleMons
_0801D4F8: .4byte gUnknown_02024BEC
_0801D4FC:
	ldr r1, _0801D518
	adds r0, r7, r1
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xFF
	beq _0801D5B0
	cmp r0, 0xFE
	bne _0801D520
	movs r0, 0x58
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	b _0801D59E
	.align 2, 0
_0801D518: .4byte gTypeEffectiveness
_0801D51C:
	adds r7, 0x3
	b _0801D58A
_0801D520:
	ldr r6, _0801D620
	adds r0, r7, r6
	ldrb r0, [r0]
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _0801D584
	adds r1, r7, 0x1
	adds r1, r6
	ldr r3, _0801D624
	mov r8, r3
	movs r3, 0x58
	mov r0, r9
	muls r0, r3
	mov r2, r8
	adds r5, r0, r2
	adds r0, r5, 0
	adds r0, 0x21
	ldrb r4, [r1]
	ldrb r0, [r0]
	cmp r4, r0
	bne _0801D55C
	adds r0, r7, 0x2
	adds r0, r6
	ldrb r0, [r0]
	mov r1, r10
	mov r2, sp
	str r3, [sp, 0x10]
	bl b_attack_effectivity_adapt
	ldr r3, [sp, 0x10]
_0801D55C:
	adds r0, r5, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r4, r0
	bne _0801D584
	ldr r0, _0801D628
	ldrb r0, [r0]
	muls r0, r3
	add r0, r8
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r4
	beq _0801D584
	adds r0, r7, 0x2
	adds r0, r6
	ldrb r0, [r0]
	mov r1, r10
	mov r2, sp
	bl b_attack_effectivity_adapt
_0801D584:
	adds r7, 0x3
	ldr r5, _0801D624
	ldr r2, _0801D620
_0801D58A:
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0801D5B0
	cmp r0, 0xFE
	bne _0801D520
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
_0801D59E:
	adds r1, r5, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _0801D51C
_0801D5B0:
	movs r0, 0x58
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x19
	bne _0801D60A
	mov r0, sp
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801D60A
	ldr r0, [sp, 0x4]
	mov r1, r10
	bl move_weather_interaction
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _0801D60A
	mov r0, sp
	ldrb r3, [r0]
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0801D5F2
	movs r0, 0x6
	ands r0, r3
	cmp r0, 0x6
	bne _0801D60A
_0801D5F2:
	ldr r0, _0801D62C
	ldr r1, [sp, 0xC]
	add r1, r10
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801D60A
	mov r0, sp
	movs r1, 0x1
	orrs r1, r3
	strb r1, [r0]
_0801D60A:
	mov r0, sp
	ldrb r0, [r0]
_0801D60E:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D620: .4byte gTypeEffectiveness
_0801D624: .4byte gBattleMons
_0801D628: .4byte gUnknown_02024C08
_0801D62C: .4byte gBattleMoves
	thumb_func_end move_effectiveness_something

	thumb_func_start ai_rate_move
ai_rate_move: @ 801D630
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r7, 0
	mov r0, sp
	strb r7, [r0]
	ldr r2, _0801D66C
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	str r1, [sp, 0x8]
	ldrb r0, [r0, 0x7]
	mov r8, r0
	cmp r6, 0xA5
	bne _0801D670
	movs r0, 0
	b _0801D728
	.align 2, 0
_0801D66C: .4byte gBaseStats
_0801D670:
	ldr r2, _0801D694
	lsls r1, r6, 1
	adds r0, r1, r6
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	mov r9, r0
	str r1, [sp, 0xC]
	ldr r3, [sp, 0x4]
	cmp r3, 0x1A
	bne _0801D698
	cmp r0, 0x4
	bne _0801D698
	movs r1, 0x9
	mov r0, sp
	strb r1, [r0]
	b _0801D6F2
	.align 2, 0
_0801D694: .4byte gBattleMoves
_0801D698:
	ldr r0, _0801D738
	mov r10, r0
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _0801D6F2
	adds r4, r1, 0
_0801D6A6:
	ldrb r0, [r4]
	cmp r0, 0xFE
	beq _0801D6E4
	cmp r0, r9
	bne _0801D6E4
	ldrb r5, [r4, 0x1]
	ldr r1, [sp, 0x8]
	cmp r5, r1
	bne _0801D6C2
	ldrb r0, [r4, 0x2]
	adds r1, r6, 0
	mov r2, sp
	bl b_attack_effectivity_adapt
_0801D6C2:
	cmp r5, r8
	bne _0801D6E4
	ldr r0, _0801D73C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	ldr r3, _0801D740
	adds r0, r3
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r8
	beq _0801D6E4
	ldrb r0, [r4, 0x2]
	adds r1, r6, 0
	mov r2, sp
	bl b_attack_effectivity_adapt
_0801D6E4:
	adds r4, 0x3
	adds r7, 0x3
	mov r1, r10
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0801D6A6
_0801D6F2:
	ldr r3, [sp, 0x4]
	cmp r3, 0x19
	bne _0801D724
	mov r0, sp
	ldrb r2, [r0]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0801D70C
	movs r0, 0x6
	ands r0, r2
	cmp r0, 0x6
	bne _0801D724
_0801D70C:
	ldr r0, _0801D744
	ldr r3, [sp, 0xC]
	adds r1, r3, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _0801D724
	mov r0, sp
	movs r1, 0x8
	orrs r1, r2
	strb r1, [r0]
_0801D724:
	mov r0, sp
	ldrb r0, [r0]
_0801D728:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D738: .4byte gTypeEffectiveness
_0801D73C: .4byte gUnknown_02024C08
_0801D740: .4byte gBattleMons
_0801D744: .4byte gBattleMoves
	thumb_func_end ai_rate_move

	thumb_func_start unref_sub_801D574
unref_sub_801D574: @ 801D748
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0801D780
	ldr r0, [r4]
	cmp r0, 0
	beq _0801D77A
	muls r0, r1
	str r0, [r4]
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801D77A
	movs r0, 0x1
	str r0, [r4]
_0801D77A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D780: .4byte gUnknown_02024BEC
	thumb_func_end unref_sub_801D574

	thumb_func_start atk07_damagecalc3
atk07_damagecalc3: @ 801D784
	push {r4-r7,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0801D7DC
	ldr r0, [r4]
	cmp r0, 0
	beq _0801D7B6
	muls r0, r1
	str r0, [r4]
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801D7B6
	movs r0, 0x1
	str r0, [r4]
_0801D7B6:
	ldr r7, _0801D7E0
	ldr r6, _0801D7E4
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801D7EC
	ldr r1, _0801D7E8
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _0801D806
	.align 2, 0
_0801D7DC: .4byte gUnknown_02024BEC
_0801D7E0: .4byte gBattleMons
_0801D7E4: .4byte gUnknown_02024C08
_0801D7E8: .4byte gEnigmaBerries
_0801D7EC:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r6, r0, 24
_0801D806:
	ldr r1, _0801D8C8
	ldr r5, _0801D8CC
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _0801D844
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _0801D844
	ldrb r0, [r5]
	movs r1, 0x27
	bl sub_81074F8
	ldr r2, _0801D8D0
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0801D844:
	ldr r2, _0801D8D4
	ldr r3, _0801D8CC
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 17
	ands r1, r0
	adds r5, r2, 0
	cmp r1, 0
	bne _0801D914
	ldr r2, _0801D8D8
	ldr r0, _0801D8DC
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x65
	beq _0801D896
	ldr r0, _0801D8E0
	lsls r1, r4, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _0801D896
	ldr r0, _0801D8D0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801D914
_0801D896:
	ldrb r0, [r3]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r1, [r0, 0x28]
	ldr r2, _0801D8E4
	ldr r0, [r2]
	cmp r1, r0
	bgt _0801D914
	subs r0, r1, 0x1
	str r0, [r2]
	ldr r1, _0801D8E0
	ldrb r3, [r3]
	lsls r0, r3, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _0801D8EC
	ldr r0, _0801D8E8
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0801D914
	.align 2, 0
_0801D8C8: .4byte gUnknown_02024C0B
_0801D8CC: .4byte gUnknown_02024C08
_0801D8D0: .4byte gUnknown_02024D68
_0801D8D4: .4byte gBattleMons
_0801D8D8: .4byte gBattleMoves
_0801D8DC: .4byte gUnknown_02024BE6
_0801D8E0: .4byte gUnknown_02024D28
_0801D8E4: .4byte gUnknown_02024BEC
_0801D8E8: .4byte gUnknown_02024C68
_0801D8EC:
	ldr r0, _0801D924
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801D914
	ldr r2, _0801D928
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801D92C
	adds r0, r3, 0
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_0801D914:
	ldr r1, _0801D930
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D924: .4byte gUnknown_02024D68
_0801D928: .4byte gUnknown_02024C68
_0801D92C: .4byte gUnknown_02024C04
_0801D930: .4byte gUnknown_02024C10
	thumb_func_end atk07_damagecalc3

	thumb_func_start atk08_cmd8
atk08_cmd8: @ 801D934
	push {r4-r7,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x64
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _0801D98C
	ldr r0, [r4]
	cmp r0, 0
	beq _0801D966
	muls r0, r1
	str r0, [r4]
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801D966
	movs r0, 0x1
	str r0, [r4]
_0801D966:
	ldr r7, _0801D990
	ldr r6, _0801D994
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0801D99C
	ldr r1, _0801D998
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _0801D9B6
	.align 2, 0
_0801D98C: .4byte gUnknown_02024BEC
_0801D990: .4byte gBattleMons
_0801D994: .4byte gUnknown_02024C08
_0801D998: .4byte gEnigmaBerries
_0801D99C:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r6, r0, 24
_0801D9B6:
	ldr r1, _0801DA5C
	ldr r5, _0801DA60
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _0801D9F4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _0801D9F4
	ldrb r0, [r5]
	movs r1, 0x27
	bl sub_81074F8
	ldr r2, _0801DA64
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_0801D9F4:
	ldr r4, _0801DA68
	ldr r6, _0801DA60
	ldrb r2, [r6]
	movs r7, 0x58
	adds r3, r2, 0
	muls r3, r7
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	bne _0801DAA0
	ldr r5, _0801DA6C
	lsls r0, r2, 4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	blt _0801DA32
	ldr r0, _0801DA64
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801DAA0
_0801DA32:
	adds r0, r3, r4
	ldrh r1, [r0, 0x28]
	ldr r2, _0801DA70
	ldr r0, [r2]
	cmp r1, r0
	bgt _0801DAA0
	subs r0, r1, 0x1
	str r0, [r2]
	ldrb r3, [r6]
	lsls r0, r3, 4
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _0801DA78
	ldr r0, _0801DA74
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0801DAA0
	.align 2, 0
_0801DA5C: .4byte gUnknown_02024C0B
_0801DA60: .4byte gUnknown_02024C08
_0801DA64: .4byte gUnknown_02024D68
_0801DA68: .4byte gBattleMons
_0801DA6C: .4byte gUnknown_02024D28
_0801DA70: .4byte gUnknown_02024BEC
_0801DA74: .4byte gUnknown_02024C68
_0801DA78:
	ldr r0, _0801DAB0
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _0801DAA0
	ldr r2, _0801DAB4
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0801DAB8
	adds r0, r3, 0
	muls r0, r7
	adds r0, r4
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_0801DAA0:
	ldr r1, _0801DABC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DAB0: .4byte gUnknown_02024D68
_0801DAB4: .4byte gUnknown_02024C68
_0801DAB8: .4byte gUnknown_02024C04
_0801DABC: .4byte gUnknown_02024C10
	thumb_func_end atk08_cmd8

	thumb_func_start sub_801D8EC
sub_801D8EC: @ 801DAC0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	ldr r0, _0801DB14
	ldr r0, [r0]
	cmp r0, 0
	beq _0801DAD4
	b _0801DC1E
_0801DAD4:
	ldr r0, _0801DB18
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	ldr r3, _0801DB1C
	cmp r0, 0
	beq _0801DB34
	ldrh r0, [r3]
	cmp r0, 0x90
	beq _0801DB34
	cmp r0, 0xA4
	beq _0801DB34
	ldr r4, _0801DB20
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801DB24
	str r0, [r4]
	ldr r1, _0801DB28
	ldr r0, _0801DB2C
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r2, _0801DB30
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0801DC1E
	.align 2, 0
_0801DB14: .4byte gUnknown_02024A64
_0801DB18: .4byte gUnknown_02024C6C
_0801DB1C: .4byte gUnknown_02024BE6
_0801DB20: .4byte gUnknown_02024C10
_0801DB24: .4byte gUnknown_081D8EEF
_0801DB28: .4byte 0x02000000
_0801DB2C: .4byte 0x00016002
_0801DB30: .4byte 0x000160a1
_0801DB34:
	ldr r2, _0801DBE0
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0801DB5A
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0801DB5A
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0801DB66
_0801DB5A:
	ldr r0, _0801DBE4
	ldr r1, _0801DBE8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0801DBD4
_0801DB66:
	ldr r0, _0801DBEC
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801DC10
	ldr r1, _0801DBF0
	ldr r2, _0801DBF4
	mov r9, r2
	ldrb r0, [r2]
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r6, _0801DBE4
	ldr r0, _0801DBF8
	adds r0, r6
	mov r8, r0
	ldrb r2, [r0]
	ldr r0, _0801DBFC
	ldrh r3, [r0]
	ldr r0, _0801DC00
	ldr r0, [r0]
	str r0, [sp]
	ldr r5, _0801DC04
	mov r0, r9
	ldrb r4, [r0]
	movs r0, 0x58
	muls r0, r4
	adds r0, r5
	adds r0, 0x2B
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	mov r0, r9
	ldrb r4, [r0]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r4, _0801DC08
	adds r0, r4
	str r0, [sp, 0x8]
	movs r0, 0
	bl dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, _0801DBE8
	adds r6, r2
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	mov r1, r9
	ldrb r0, [r1]
	bl dp01_battle_side_mark_buffer_for_execution
_0801DBD4:
	ldr r1, _0801DC0C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _0801DC1E
	.align 2, 0
_0801DBE0: .4byte gBattleMoves
_0801DBE4: .4byte 0x02000000
_0801DBE8: .4byte 0x000160a1
_0801DBEC: .4byte gUnknown_02024C68
_0801DBF0: .4byte gUnknown_02024A60
_0801DBF4: .4byte gUnknown_02024C07
_0801DBF8: .4byte 0x00016002
_0801DBFC: .4byte gBattleMovePower
_0801DC00: .4byte gUnknown_02024BEC
_0801DC04: .4byte gBattleMons
_0801DC08: .4byte gUnknown_02024CA8
_0801DC0C: .4byte gUnknown_02024C10
_0801DC10:
	ldr r4, _0801DC2C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801DC30
	str r0, [r4]
_0801DC1E:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DC2C: .4byte gUnknown_02024C10
_0801DC30: .4byte gUnknown_081D8EEF
	thumb_func_end sub_801D8EC

	thumb_func_start sub_801DA60
sub_801DA60: @ 801DC34
	push {lr}
	ldr r0, _0801DC4C
	ldr r0, [r0]
	cmp r0, 0
	bne _0801DC46
	ldr r1, _0801DC50
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801DC46:
	pop {r0}
	bx r0
	.align 2, 0
_0801DC4C: .4byte gUnknown_02024A64
_0801DC50: .4byte gUnknown_02024C10
	thumb_func_end sub_801DA60

	thumb_func_start sub_801DA80
sub_801DA80: @ 801DC54
	push {r4,r5,lr}
	ldr r0, _0801DCB8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801DD0A
	ldr r0, _0801DCBC
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801DD02
	ldr r0, _0801DCC0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r2, _0801DCC4
	strb r0, [r2]
	ldr r1, _0801DCC8
	ldrb r2, [r2]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _0801DCD4
	ldr r0, _0801DCCC
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	beq _0801DCD4
	ldr r0, _0801DCD0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	bne _0801DCD4
	movs r0, 0x80
	adds r1, r2, 0
	bl b_std_message
	b _0801DD02
	.align 2, 0
_0801DCB8: .4byte gUnknown_02024A64
_0801DCBC: .4byte gUnknown_02024C68
_0801DCC0: .4byte gUnknown_02024C10
_0801DCC4: .4byte gUnknown_02024A60
_0801DCC8: .4byte gBattleMons
_0801DCCC: .4byte gUnknown_02024CA8
_0801DCD0: .4byte gUnknown_02024C6C
_0801DCD4:
	ldr r5, _0801DD10
	ldrh r1, [r5]
	movs r0, 0
	bl dp01_build_cmdbuf_x18_0_aa_health_bar_update
	ldr r4, _0801DD14
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801DD02
	ldr r0, [r5]
	cmp r0, 0
	ble _0801DD02
	ldr r0, _0801DD18
	ldrb r1, [r0, 0x5]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x5]
_0801DD02:
	ldr r1, _0801DD1C
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_0801DD0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD10: .4byte gUnknown_02024BEC
_0801DD14: .4byte gUnknown_02024A60
_0801DD18: .4byte gUnknown_030042E0
_0801DD1C: .4byte gUnknown_02024C10
	thumb_func_end sub_801DA80

	thumb_func_start atk0C_datahpupdate
atk0C_datahpupdate: @ 801DD20
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _0801DD48
	ldr r0, [r0]
	cmp r0, 0
	beq _0801DD2E
	b _0801E102
_0801DD2E:
	ldr r0, _0801DD4C
	ldr r1, _0801DD50
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0
	beq _0801DD54
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0801DD54
	movs r6, 0x3F
	ands r6, r1
	b _0801DD64
	.align 2, 0
_0801DD48: .4byte gUnknown_02024A64
_0801DD4C: .4byte 0x02000000
_0801DD50: .4byte 0x0001601c
_0801DD54:
	ldr r2, _0801DDF0
	ldr r0, _0801DDF4
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r6, [r0, 0x2]
_0801DD64:
	ldr r0, _0801DDF8
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0801DD72
	b _0801E0D4
_0801DD72:
	ldr r0, _0801DDFC
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r7, _0801DE00
	strb r0, [r7]
	ldr r1, _0801DE04
	ldrb r2, [r7]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _0801DE88
	ldr r0, _0801DE08
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r4, r1, r0
	ldrb r1, [r4, 0xA]
	mov r12, r0
	cmp r1, 0
	beq _0801DE88
	ldr r0, _0801DE0C
	ldr r3, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r3, r0
	cmp r3, 0
	bne _0801DE88
	adds r5, r1, 0
	ldr r6, _0801DE10
	ldr r4, [r6]
	cmp r5, r4
	blt _0801DE1C
	ldr r0, _0801DE14
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	bne _0801DDD6
	str r4, [r1]
_0801DDD6:
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldr r2, [r6]
	ldrb r0, [r1, 0xA]
	subs r0, r2
	strb r0, [r1, 0xA]
	ldr r1, _0801DE18
	ldr r0, [r6]
	str r0, [r1]
	b _0801DE4C
	.align 2, 0
_0801DDF0: .4byte gBattleMoves
_0801DDF4: .4byte gUnknown_02024BE6
_0801DDF8: .4byte gUnknown_02024C68
_0801DDFC: .4byte gUnknown_02024C10
_0801DE00: .4byte gUnknown_02024A60
_0801DE04: .4byte gBattleMons
_0801DE08: .4byte gUnknown_02024CA8
_0801DE0C: .4byte gUnknown_02024C6C
_0801DE10: .4byte gUnknown_02024BEC
_0801DE14: .4byte gUnknown_02024D68
_0801DE18: .4byte gUnknown_02024BF0
_0801DE1C:
	ldr r0, _0801DE74
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	bne _0801DE30
	str r5, [r1]
_0801DE30:
	ldr r2, _0801DE78
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xA]
	str r0, [r2]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r3, [r0, 0xA]
_0801DE4C:
	ldr r0, _0801DE7C
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _0801DE60
	b _0801E0FA
_0801DE60:
	ldr r4, _0801DE80
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	bl b_movescr_stack_push_cursor
	ldr r0, _0801DE84
	str r0, [r4]
	b _0801E102
	.align 2, 0
_0801DE74: .4byte gUnknown_02024D68
_0801DE78: .4byte gUnknown_02024BF0
_0801DE7C: .4byte gUnknown_02024A60
_0801DE80: .4byte gUnknown_02024C10
_0801DE84: .4byte gUnknown_081D99AB
_0801DE88:
	ldr r0, _0801DEC8
	ldr r2, [r0]
	ldr r1, _0801DECC
	ands r2, r1
	str r2, [r0]
	ldr r1, _0801DED0
	ldr r5, [r1]
	mov r12, r0
	adds r7, r1, 0
	cmp r5, 0
	bge _0801DEDC
	ldr r4, _0801DED4
	ldr r2, _0801DED8
	ldrb r0, [r2]
	movs r3, 0x58
	adds r1, r0, 0
	muls r1, r3
	adds r1, r4
	ldrh r0, [r1, 0x28]
	subs r0, r5
	strh r0, [r1, 0x28]
	ldrb r0, [r2]
	muls r0, r3
	adds r1, r0, r4
	ldrh r3, [r1, 0x2C]
	ldrh r0, [r1, 0x28]
	adds r5, r2, 0
	cmp r0, r3
	bhi _0801DEC4
	b _0801E09A
_0801DEC4:
	strh r3, [r1, 0x28]
	b _0801E09A
	.align 2, 0
_0801DEC8: .4byte gUnknown_02024C6C
_0801DECC: .4byte 0xfffffeff
_0801DED0: .4byte gUnknown_02024BEC
_0801DED4: .4byte gBattleMons
_0801DED8: .4byte gUnknown_02024A60
_0801DEDC:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0801DEF8
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	mov r0, r12
	str r2, [r0]
	ldr r5, _0801DEF4
	b _0801DF40
	.align 2, 0
_0801DEF4: .4byte gUnknown_02024A60
_0801DEF8:
	ldr r0, _0801DF20
	ldr r2, _0801DF24
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	adds r0, r5
	str r0, [r1]
	ldr r0, _0801DF28
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	adds r5, r2, 0
	cmp r0, 0
	bne _0801DF34
	ldr r1, _0801DF2C
	ldrb r0, [r5]
	adds r0, r1
	ldr r1, _0801DF30
	b _0801DF3C
	.align 2, 0
_0801DF20: .4byte gUnknown_02024BF4
_0801DF24: .4byte gUnknown_02024A60
_0801DF28: .4byte gUnknown_02024C10
_0801DF2C: .4byte gUnknown_02024C74
_0801DF30: .4byte gUnknown_02024C07
_0801DF34:
	ldr r1, _0801DF60
	ldrb r0, [r5]
	adds r0, r1
	ldr r1, _0801DF64
_0801DF3C:
	ldrb r1, [r1]
	strb r1, [r0]
_0801DF40:
	ldr r4, _0801DF68
	ldrb r0, [r5]
	movs r3, 0x58
	muls r0, r3
	adds r2, r0, r4
	ldrh r0, [r2, 0x28]
	ldr r1, [r7]
	cmp r0, r1
	ble _0801DF70
	subs r0, r1
	strh r0, [r2, 0x28]
	ldr r0, _0801DF6C
	str r1, [r0]
	adds r7, r0, 0
	b _0801DF80
	.align 2, 0
_0801DF60: .4byte gUnknown_02024C74
_0801DF64: .4byte gUnknown_02024C08
_0801DF68: .4byte gBattleMons
_0801DF6C: .4byte gUnknown_02024BF0
_0801DF70:
	ldr r2, _0801DFF4
	str r0, [r2]
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r4
	movs r1, 0
	strh r1, [r0, 0x28]
	adds r7, r2, 0
_0801DF80:
	ldr r2, _0801DFF8
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r3, r0, r1
	ldr r0, [r3]
	adds r4, r2, 0
	cmp r0, 0
	bne _0801DFA8
	mov r1, r12
	ldr r0, [r1]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0801DFA8
	ldr r0, [r7]
	str r0, [r3]
_0801DFA8:
	cmp r6, 0x8
	bhi _0801E030
	mov r1, r12
	ldr r0, [r1]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0801E02C
	ldr r0, _0801DFFC
	ldrh r0, [r0]
	cmp r0, 0xDC
	beq _0801E02C
	ldr r3, _0801E000
	ldrb r0, [r5]
	lsls r0, 4
	adds r1, r3, 0x4
	adds r0, r1
	ldr r2, [r7]
	str r2, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x8
	adds r0, r1
	str r2, [r0]
	ldr r0, _0801E004
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _0801E00C
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801E008
	b _0801E014
	.align 2, 0
_0801DFF4: .4byte gUnknown_02024BF0
_0801DFF8: .4byte gUnknown_02024D68
_0801DFFC: .4byte gUnknown_02024BE6
_0801E000: .4byte gUnknown_02024D28
_0801E004: .4byte gUnknown_02024C10
_0801E008: .4byte gUnknown_02024C07
_0801E00C:
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801E028
_0801E014:
	ldrb r1, [r2]
	strb r1, [r0, 0xC]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r2]
	strb r1, [r0, 0x10]
	b _0801E09A
	.align 2, 0
_0801E028: .4byte gUnknown_02024C08
_0801E02C:
	cmp r6, 0x8
	bls _0801E09A
_0801E030:
	mov r1, r12
	ldr r0, [r1]
	movs r1, 0x80
	lsls r1, 13
	ands r0, r1
	cmp r0, 0
	bne _0801E09A
	ldr r3, _0801E074
	ldrb r0, [r5]
	lsls r0, 4
	adds r1, r3, 0
	adds r1, 0x8
	adds r0, r1
	ldr r2, [r7]
	str r2, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	str r2, [r0]
	ldr r0, _0801E078
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _0801E080
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801E07C
	b _0801E088
	.align 2, 0
_0801E074: .4byte gUnknown_02024D28
_0801E078: .4byte gUnknown_02024C10
_0801E07C: .4byte gUnknown_02024C07
_0801E080:
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r3
	ldr r2, _0801E0C8
_0801E088:
	ldrb r1, [r2]
	strb r1, [r0, 0xD]
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r2]
	strb r1, [r0, 0x11]
_0801E09A:
	mov r1, r12
	ldr r0, [r1]
	ldr r1, _0801E0CC
	ands r0, r1
	mov r1, r12
	str r0, [r1]
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _0801E0D0
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2A
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0801E0FA
	.align 2, 0
_0801E0C8: .4byte gUnknown_02024C08
_0801E0CC: .4byte 0xffefffff
_0801E0D0: .4byte gUnknown_02024AA8
_0801E0D4:
	ldr r0, _0801E10C
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _0801E110
	strb r0, [r1]
	ldr r2, _0801E114
	ldrb r1, [r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, 0
	bne _0801E0FA
	ldr r0, _0801E118
	str r0, [r1]
_0801E0FA:
	ldr r1, _0801E10C
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_0801E102:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E10C: .4byte gUnknown_02024C10
_0801E110: .4byte gUnknown_02024A60
_0801E114: .4byte gUnknown_02024D68
_0801E118: .4byte 0x0000ffff
	thumb_func_end atk0C_datahpupdate

	thumb_func_start atk0D_critmessage
atk0D_critmessage: @ 801E11C
	push {lr}
	ldr r0, _0801E158
	ldr r0, [r0]
	cmp r0, 0
	bne _0801E152
	ldr r0, _0801E15C
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0801E14A
	ldr r0, _0801E160
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801E14A
	ldr r0, _0801E164
	ldrb r1, [r0]
	movs r0, 0xD9
	bl b_std_message
	ldr r1, _0801E168
	movs r0, 0x1
	strb r0, [r1, 0x7]
_0801E14A:
	ldr r1, _0801E16C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801E152:
	pop {r0}
	bx r0
	.align 2, 0
_0801E158: .4byte gUnknown_02024A64
_0801E15C: .4byte gCritMultiplier
_0801E160: .4byte gUnknown_02024C68
_0801E164: .4byte gUnknown_02024C07
_0801E168: .4byte gUnknown_02024D1E
_0801E16C: .4byte gUnknown_02024C10
	thumb_func_end atk0D_critmessage

	thumb_func_start atk0E_missmessage
atk0E_missmessage: @ 801E170
	push {r4,lr}
	ldr r0, _0801E1A8
	ldr r0, [r0]
	cmp r0, 0
	bne _0801E230
	ldr r4, _0801E1AC
	ldr r0, _0801E1B0
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _0801E1B4
	ldrb r2, [r1]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0801E228
	movs r0, 0xFE
	ands r0, r2
	cmp r0, 0x10
	beq _0801E1E2
	cmp r0, 0x10
	bgt _0801E1BE
	cmp r0, 0x4
	beq _0801E1D2
	cmp r0, 0x4
	bgt _0801E1B8
	cmp r0, 0x2
	beq _0801E1CC
	b _0801E1E2
	.align 2, 0
_0801E1A8: .4byte gUnknown_02024A64
_0801E1AC: .4byte gUnknown_02024A60
_0801E1B0: .4byte gUnknown_02024C08
_0801E1B4: .4byte gUnknown_02024C68
_0801E1B8:
	cmp r0, 0x8
	beq _0801E228
	b _0801E1E2
_0801E1BE:
	cmp r0, 0x40
	beq _0801E1E2
	cmp r0, 0x40
	bgt _0801E1E2
	cmp r0, 0x20
	beq _0801E228
	b _0801E1E2
_0801E1CC:
	movs r0, 0
	movs r1, 0xE
	b _0801E1D6
_0801E1D2:
	movs r0, 0
	movs r1, 0xC
_0801E1D6:
	bl dp01_build_cmdbuf_x2B_aa_0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0801E228
_0801E1E2:
	ldrb r1, [r1]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801E1F2
	movs r0, 0
	movs r1, 0xE
	b _0801E1FE
_0801E1F2:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801E210
	movs r0, 0
	movs r1, 0xC
_0801E1FE:
	bl dp01_build_cmdbuf_x2B_aa_0
	ldr r0, _0801E20C
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0801E228
	.align 2, 0
_0801E20C: .4byte gUnknown_02024A60
_0801E210:
	movs r0, 0x28
	ands r0, r1
	cmp r0, 0
	bne _0801E228
	movs r0, 0
	movs r1, 0xD
	bl dp01_build_cmdbuf_x2B_aa_0
	ldr r0, _0801E238
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
_0801E228:
	ldr r1, _0801E23C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801E230:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E238: .4byte gUnknown_02024A60
_0801E23C: .4byte gUnknown_02024C10
	thumb_func_end atk0E_missmessage

	thumb_func_start atk0F_resultmessage
atk0F_resultmessage: @ 801E240
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _0801E27C
	ldr r0, [r0]
	cmp r0, 0
	beq _0801E24E
	b _0801E3E0
_0801E24E:
	ldr r1, _0801E280
	ldrb r2, [r1]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r2
	adds r6, r1, 0
	ldr r7, _0801E284
	cmp r0, 0
	beq _0801E28C
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0801E26E
	ldrb r0, [r7, 0x6]
	cmp r0, 0x2
	bls _0801E28C
_0801E26E:
	ldr r1, _0801E288
	ldrb r0, [r7, 0x6]
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	strb r4, [r7, 0x7]
	b _0801E3CA
	.align 2, 0
_0801E27C: .4byte gUnknown_02024A64
_0801E280: .4byte gUnknown_02024C68
_0801E284: .4byte gUnknown_02024D1E
_0801E288: .4byte gUnknown_08401508
_0801E28C:
	movs r0, 0x1
	strb r0, [r7, 0x7]
	ldrb r5, [r6]
	movs r0, 0xFE
	ands r0, r5
	cmp r0, 0x10
	beq _0801E2D0
	cmp r0, 0x10
	bgt _0801E2B2
	cmp r0, 0x4
	beq _0801E2CC
	cmp r0, 0x4
	bgt _0801E2AC
	cmp r0, 0x2
	beq _0801E2C8
	b _0801E318
_0801E2AC:
	cmp r0, 0x8
	beq _0801E324
	b _0801E318
_0801E2B2:
	cmp r0, 0x40
	beq _0801E2D4
	cmp r0, 0x40
	bgt _0801E2C2
	cmp r0, 0x20
	bne _0801E2C0
	b _0801E3C4
_0801E2C0:
	b _0801E318
_0801E2C2:
	cmp r0, 0x80
	beq _0801E2D8
	b _0801E318
_0801E2C8:
	movs r3, 0xDE
	b _0801E3CE
_0801E2CC:
	movs r3, 0xDD
	b _0801E3CE
_0801E2D0:
	movs r3, 0xDA
	b _0801E3CE
_0801E2D4:
	movs r3, 0x99
	b _0801E3CE
_0801E2D8:
	ldr r4, _0801E300
	ldr r2, _0801E304
	ldr r3, _0801E308
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	ldr r1, _0801E30C
	ldrb r0, [r3]
	strb r0, [r1]
	movs r0, 0x3F
	ands r0, r5
	strb r0, [r6]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801E310
	ldr r0, _0801E314
	b _0801E3DE
	.align 2, 0
_0801E300: .4byte gUnknown_02024C04
_0801E304: .4byte gBattleMons
_0801E308: .4byte gUnknown_02024C08
_0801E30C: .4byte gUnknown_02024C0B
_0801E310: .4byte gUnknown_02024C10
_0801E314: .4byte gUnknown_081D9AC6
_0801E318:
	adds r2, r6, 0
	ldrb r5, [r2]
	movs r0, 0x8
	ands r0, r5
	cmp r0, 0
	beq _0801E328
_0801E324:
	movs r3, 0x1B
	b _0801E3CE
_0801E328:
	movs r0, 0x10
	ands r0, r5
	cmp r0, 0
	beq _0801E350
	movs r0, 0xEF
	ands r0, r5
	movs r1, 0xFD
	ands r0, r1
	movs r1, 0xFB
	ands r0, r1
	strb r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801E348
	ldr r0, _0801E34C
	b _0801E3DE
	.align 2, 0
_0801E348: .4byte gUnknown_02024C10
_0801E34C: .4byte gUnknown_081D94A9
_0801E350:
	movs r0, 0x40
	ands r0, r5
	cmp r0, 0
	beq _0801E370
	movs r0, 0x3F
	ands r0, r5
	strb r0, [r2]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801E368
	ldr r0, _0801E36C
	b _0801E3DE
	.align 2, 0
_0801E368: .4byte gUnknown_02024C10
_0801E36C: .4byte gUnknown_081D94A2
_0801E370:
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	beq _0801E3B8
	ldr r4, _0801E3A0
	ldr r2, _0801E3A4
	ldr r3, _0801E3A8
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strh r0, [r4]
	ldr r1, _0801E3AC
	ldrb r0, [r3]
	strb r0, [r1]
	movs r0, 0x3F
	ands r0, r5
	strb r0, [r6]
	bl b_movescr_stack_push_cursor
	ldr r1, _0801E3B0
	ldr r0, _0801E3B4
	b _0801E3DE
	.align 2, 0
_0801E3A0: .4byte gUnknown_02024C04
_0801E3A4: .4byte gBattleMons
_0801E3A8: .4byte gUnknown_02024C08
_0801E3AC: .4byte gUnknown_02024C0B
_0801E3B0: .4byte gUnknown_02024C10
_0801E3B4: .4byte gUnknown_081D9AC6
_0801E3B8:
	movs r0, 0x20
	ands r0, r5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0801E3C8
_0801E3C4:
	movs r3, 0xE5
	b _0801E3CE
_0801E3C8:
	strb r0, [r7, 0x7]
_0801E3CA:
	cmp r3, 0
	beq _0801E3D8
_0801E3CE:
	adds r0, r3, 0
	ldr r1, _0801E3E8
	ldrb r1, [r1]
	bl b_std_message
_0801E3D8:
	ldr r1, _0801E3EC
	ldr r0, [r1]
	adds r0, 0x1
_0801E3DE:
	str r0, [r1]
_0801E3E0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E3E8: .4byte gUnknown_02024C07
_0801E3EC: .4byte gUnknown_02024C10
	thumb_func_end atk0F_resultmessage

	thumb_func_start atk10_printstring
atk10_printstring: @ 801E3F0
	push {r4,lr}
	ldr r0, _0801E420
	ldr r0, [r0]
	cmp r0, 0
	bne _0801E41A
	ldr r4, _0801E424
	ldr r1, [r4]
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1, 0x2]
	lsls r1, 8
	orrs r0, r1
	ldr r1, _0801E428
	ldrb r1, [r1]
	bl b_std_message
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	ldr r1, _0801E42C
	movs r0, 0x1
	strb r0, [r1, 0x7]
_0801E41A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E420: .4byte gUnknown_02024A64
_0801E424: .4byte gUnknown_02024C10
_0801E428: .4byte gUnknown_02024C07
_0801E42C: .4byte gUnknown_02024D1E
	thumb_func_end atk10_printstring

	thumb_func_start atk11_printstring2
atk11_printstring2: @ 801E430
	push {r4,r5,lr}
	ldr r5, _0801E464
	ldr r0, _0801E468
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _0801E46C
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl dp01_build_cmdbuf_x11_TODO
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	ldr r1, _0801E470
	movs r0, 0x1
	strb r0, [r1, 0x7]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E464: .4byte gUnknown_02024A60
_0801E468: .4byte gUnknown_02024C07
_0801E46C: .4byte gUnknown_02024C10
_0801E470: .4byte gUnknown_02024D1E
	thumb_func_end atk11_printstring2

	thumb_func_start atk12_waitmessage
atk12_waitmessage: @ 801E474
	push {r4-r6,lr}
	ldr r0, _0801E490
	ldr r4, [r0]
	cmp r4, 0
	bne _0801E4C2
	ldr r6, _0801E494
	ldrb r0, [r6, 0x7]
	cmp r0, 0
	bne _0801E49C
	ldr r1, _0801E498
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
	b _0801E4C2
	.align 2, 0
_0801E490: .4byte gUnknown_02024A64
_0801E494: .4byte gUnknown_02024D1E
_0801E498: .4byte gUnknown_02024C10
_0801E49C:
	ldr r5, _0801E4C8
	ldr r2, [r5]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r3, _0801E4CC
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bcc _0801E4C2
	movs r1, 0
	strh r4, [r3]
	adds r0, r2, 0x3
	str r0, [r5]
	strb r1, [r6, 0x7]
_0801E4C2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E4C8: .4byte gUnknown_02024C10
_0801E4CC: .4byte gUnknown_02024D18
	thumb_func_end atk12_waitmessage

	thumb_func_start atk13_printfromtable
atk13_printfromtable: @ 801E4D0
	push {r4,r5,lr}
	ldr r0, _0801E514
	ldr r0, [r0]
	cmp r0, 0
	bne _0801E50E
	ldr r4, _0801E518
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
	ldr r5, _0801E51C
	ldrb r0, [r5, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r1, _0801E520
	ldrb r1, [r1]
	bl b_std_message
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	movs r0, 0x1
	strb r0, [r5, 0x7]
_0801E50E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801E514: .4byte gUnknown_02024A64
_0801E518: .4byte gUnknown_02024C10
_0801E51C: .4byte gUnknown_02024D1E
_0801E520: .4byte gUnknown_02024C07
	thumb_func_end atk13_printfromtable

	thumb_func_start atk14_printfromtable2
atk14_printfromtable2: @ 801E524
	push {r4-r6,lr}
	ldr r0, _0801E574
	ldr r0, [r0]
	cmp r0, 0
	bne _0801E56E
	ldr r5, _0801E578
	ldr r2, [r5]
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
	ldr r6, _0801E57C
	ldrb r0, [r6, 0x5]
	lsls r0, 1
	adds r1, r0
	ldr r4, _0801E580
	ldr r0, _0801E584
	ldrb r0, [r0]
	strb r0, [r4]
	ldrh r1, [r1]
	movs r0, 0
	bl dp01_build_cmdbuf_x11_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x5
	str r0, [r5]
	movs r0, 0x1
	strb r0, [r6, 0x7]
_0801E56E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E574: .4byte gUnknown_02024A64
_0801E578: .4byte gUnknown_02024C10
_0801E57C: .4byte gUnknown_02024D1E
_0801E580: .4byte gUnknown_02024A60
_0801E584: .4byte gUnknown_02024C07
	thumb_func_end atk14_printfromtable2

	thumb_func_start sub_801E3B4
sub_801E3B4: @ 801E588
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r0, _0801E5B8
	ldrb r3, [r0]
	cmp r1, r3
	bge _0801E5AE
	ldr r4, _0801E5BC
	ldrb r0, [r4]
	cmp r0, r2
	beq _0801E5AE
_0801E5A0:
	adds r1, 0x1
	cmp r1, r3
	bge _0801E5AE
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _0801E5A0
_0801E5AE:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801E5B8: .4byte gUnknown_02024A68
_0801E5BC: .4byte gUnknown_02024A7A
	thumb_func_end sub_801E3B4

	thumb_func_start sub_801E3EC
sub_801E3EC: @ 801E5C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0
	mov r10, r0
	movs r6, 0
	movs r1, 0x1
	str r1, [sp, 0x4]
	ldr r1, _0801E604
	ldrb r3, [r1, 0x3]
	movs r0, 0x40
	ands r0, r3
	adds r7, r1, 0
	cmp r0, 0
	beq _0801E618
	ldr r2, _0801E608
	ldr r0, _0801E60C
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0xBF
	ands r0, r3
	strb r0, [r7, 0x3]
	movs r6, 0x40
	ldr r0, _0801E610
	ldr r1, _0801E614
	b _0801E624
	.align 2, 0
_0801E604: .4byte gUnknown_02024D1E
_0801E608: .4byte gUnknown_02024C0A
_0801E60C: .4byte gUnknown_02024C07
_0801E610: .4byte 0x02000000
_0801E614: .4byte gUnknown_02024C08
_0801E618:
	ldr r2, _0801E70C
	ldr r0, _0801E710
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _0801E714
	ldr r1, _0801E718
_0801E624:
	ldrb r1, [r1]
	ldr r3, _0801E71C
	adds r0, r3
	strb r1, [r0]
	mov r8, r2
	ldr r2, _0801E720
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x13
	bne _0801E65E
	ldr r0, _0801E724
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	bne _0801E65E
	cmp r4, 0
	bne _0801E65E
	ldrb r0, [r7, 0x3]
	cmp r0, 0x9
	bhi _0801E65E
	bl _0801F7B0
_0801E65E:
	mov r1, r8
	ldrb r0, [r1]
	bl battle_get_per_side_status
	ldr r2, _0801E728
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0801E698
	ldr r0, _0801E724
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	bne _0801E698
	cmp r4, 0
	bne _0801E698
	ldr r0, _0801E72C
	ldrb r0, [r0, 0x3]
	cmp r0, 0x7
	bhi _0801E698
	bl _0801F7B0
_0801E698:
	ldr r3, _0801E720
	ldr r2, _0801E70C
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	mov r8, r2
	mov r9, r3
	cmp r0, 0
	bne _0801E6BE
	ldr r0, _0801E72C
	ldrb r0, [r0, 0x3]
	cmp r0, 0xB
	beq _0801E6BE
	cmp r0, 0x1F
	beq _0801E6BE
	bl _0801F7B0
_0801E6BE:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	mov r1, r9
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _0801E6E0
	cmp r6, 0x40
	beq _0801E6E0
	bl _0801F7B0
_0801E6E0:
	ldr r0, _0801E72C
	ldrb r1, [r0, 0x3]
	adds r7, r0, 0
	cmp r1, 0x6
	bls _0801E6EC
	b _0801ED1E
_0801E6EC:
	ldr r1, _0801E730
	ldrb r0, [r7, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0x10
	bne _0801E6FC
	b _0801E8E8
_0801E6FC:
	cmp r0, 0x10
	bhi _0801E734
	cmp r0, 0x7
	beq _0801E74E
	cmp r0, 0x8
	bne _0801E70A
	b _0801E804
_0801E70A:
	b _0801EBE8
	.align 2, 0
_0801E70C: .4byte gUnknown_02024C0A
_0801E710: .4byte gUnknown_02024C08
_0801E714: .4byte 0x02000000
_0801E718: .4byte gUnknown_02024C07
_0801E71C: .4byte 0x00016003
_0801E720: .4byte gBattleMons
_0801E724: .4byte gUnknown_02024C6C
_0801E728: .4byte gUnknown_02024C7A
_0801E72C: .4byte gUnknown_02024D1E
_0801E730: .4byte gUnknown_081FAB5C
_0801E734:
	cmp r0, 0x40
	bne _0801E73A
	b _0801EA5C
_0801E73A:
	cmp r0, 0x40
	bhi _0801E746
	cmp r0, 0x20
	bne _0801E744
	b _0801E9BE
_0801E744:
	b _0801EBE8
_0801E746:
	cmp r0, 0x80
	bne _0801E74C
	b _0801EAB8
_0801E74C:
	b _0801EBE8
_0801E74E:
	mov r3, r8
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	add r0, r9
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	beq _0801E7B0
	ldr r0, _0801E7A8
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0801E7AC
	ldrb r3, [r1]
	adds r7, r0, 0
	mov r12, r1
	cmp r3, 0
	beq _0801E7BC
	mov r4, r9
	ldr r0, [r4, 0x50]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	bne _0801E7BC
	adds r1, r7, 0
	mov r6, r9
	adds r6, 0x50
	movs r5, 0x58
	movs r4, 0x70
_0801E788:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcs _0801E7BC
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r6
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _0801E788
	b _0801E7BC
	.align 2, 0
_0801E7A8: .4byte gUnknown_02024A60
_0801E7AC: .4byte gUnknown_02024A68
_0801E7B0:
	ldr r0, _0801E7FC
	ldr r2, _0801E800
	ldrb r1, [r2]
	strb r1, [r0]
	adds r7, r0, 0
	mov r12, r2
_0801E7BC:
	mov r0, r8
	ldrb r2, [r0]
	movs r0, 0x58
	adds r1, r2, 0
	muls r1, r0
	mov r0, r9
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0801E7D4
	b _0801EBE8
_0801E7D4:
	ldrb r0, [r7]
	mov r3, r12
	ldrb r3, [r3]
	cmp r0, r3
	beq _0801E7E0
	b _0801EBE8
_0801E7E0:
	mov r4, r9
	adds r0, r1, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x48
	bne _0801E7EE
	b _0801EBE8
_0801E7EE:
	cmp r0, 0xF
	bne _0801E7F4
	b _0801EBE8
_0801E7F4:
	adds r0, r2, 0
	bl b_cancel_multi_turn_move_maybe
	b _0801EBD8
	.align 2, 0
_0801E7FC: .4byte gUnknown_02024A60
_0801E800: .4byte gUnknown_02024A68
_0801E804:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	add r0, r9
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x11
	bne _0801E85C
	cmp r4, 0x1
	beq _0801E81E
	cmp r5, 0x80
	bne _0801E85C
_0801E81E:
	ldr r0, _0801E84C
	strb r1, [r0]
	mov r3, r8
	ldrb r0, [r3]
	movs r1, 0x11
	bl sub_81074C4
	ldr r4, _0801E850
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801E854
_0801E838:
	str r0, [r4]
	ldr r2, _0801E858
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _0801E84A
	b _0801EAFC
_0801E84A:
	b _0801EB20
	.align 2, 0
_0801E84C: .4byte byte_2024C06
_0801E850: .4byte gUnknown_02024C10
_0801E854: .4byte BattleScript_1D98BD
_0801E858: .4byte gUnknown_02024C6C
_0801E85C:
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x58
	muls r0, r1
	add r0, r9
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r1, 0x3
	beq _0801E880
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0801E880
	cmp r1, 0x8
	beq _0801E880
	cmp r0, 0x8
	bne _0801E89A
_0801E880:
	ldr r0, _0801E8E4
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _0801E89A
	cmp r4, 0x1
	bne _0801E894
	b _0801EB60
_0801E894:
	cmp r5, 0x80
	bne _0801E89A
	b _0801EB60
_0801E89A:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	muls r1, r0
	mov r4, r9
	adds r3, r1, r4
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r4, [r0]
	cmp r4, 0x3
	bne _0801E8B2
	b _0801EBE8
_0801E8B2:
	adds r0, 0x1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0801E8BC
	b _0801EBE8
_0801E8BC:
	cmp r4, 0x8
	bne _0801E8C2
	b _0801EBE8
_0801E8C2:
	cmp r0, 0x8
	bne _0801E8C8
	b _0801EBE8
_0801E8C8:
	mov r0, r9
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0801E8D6
	b _0801EBE8
_0801E8D6:
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x11
	bne _0801E8E2
	b _0801EBE8
_0801E8E2:
	b _0801EBD8
	.align 2, 0
_0801E8E4: .4byte gUnknown_02024C6C
_0801E8E8:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	muls r0, r1
	add r0, r9
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x29
	bne _0801E92C
	cmp r4, 0x1
	beq _0801E902
	cmp r5, 0x80
	bne _0801E92C
_0801E902:
	ldr r0, _0801E920
	strb r1, [r0]
	mov r3, r8
	ldrb r0, [r3]
	movs r1, 0x29
	bl sub_81074C4
	ldr r4, _0801E924
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801E928
	b _0801E838
	.align 2, 0
_0801E920: .4byte byte_2024C06
_0801E924: .4byte gUnknown_02024C10
_0801E928: .4byte BattleScript_1D98A5
_0801E92C:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	mov r2, r9
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xA
	beq _0801E94C
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _0801E97C
_0801E94C:
	ldr r0, _0801E970
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _0801E97C
	cmp r4, 0x1
	beq _0801E962
	cmp r5, 0x80
	bne _0801E97C
_0801E962:
	ldr r4, _0801E974
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801E978
	b _0801EB6C
	.align 2, 0
_0801E970: .4byte gUnknown_02024C6C
_0801E974: .4byte gUnknown_02024C10
_0801E978: .4byte BattleScript_1D98A5
_0801E97C:
	mov r3, r8
	ldrb r0, [r3]
	movs r1, 0x58
	adds r2, r0, 0
	muls r2, r1
	mov r4, r9
	adds r1, r2, r4
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _0801E996
	b _0801EBE8
_0801E996:
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xA
	bne _0801E9A2
	b _0801EBE8
_0801E9A2:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _0801E9AE
	b _0801EBE8
_0801E9AE:
	mov r0, r9
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0801E9BC
	b _0801EBE8
_0801E9BC:
	b _0801EBD8
_0801E9BE:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0801E9FA
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0801E9FA
	ldr r0, _0801EA50
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0801E9FA
	movs r1, 0
	str r1, [sp, 0x4]
_0801E9FA:
	ldr r4, _0801EA54
	ldr r0, _0801EA58
	ldrb r3, [r0]
	movs r0, 0x58
	adds r2, r3, 0
	muls r2, r0
	adds r1, r2, r4
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xF
	bne _0801EA14
	b _0801EBE8
_0801EA14:
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xF
	bne _0801EA20
	b _0801EBE8
_0801EA20:
	adds r0, r4, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0801EA2E
	b _0801EBE8
_0801EA2E:
	ldr r2, [sp, 0x4]
	cmp r2, 0
	bne _0801EA36
	b _0801EBE8
_0801EA36:
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x28
	bne _0801EA42
	b _0801EBE8
_0801EA42:
	adds r0, r3, 0
	bl b_cancel_multi_turn_move_maybe
	movs r3, 0x1
	mov r10, r3
	b _0801EBE8
	.align 2, 0
_0801EA50: .4byte word_2024DB8
_0801EA54: .4byte gBattleMons
_0801EA58: .4byte gUnknown_02024C0A
_0801EA5C:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	mov r2, r9
	adds r0, r1, r2
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x7
	bne _0801EAA4
	cmp r4, 0x1
	beq _0801EA7A
	cmp r5, 0x80
	beq _0801EA7A
	b _0801EBE8
_0801EA7A:
	ldr r0, _0801EA98
	strb r2, [r0]
	mov r3, r8
	ldrb r0, [r3]
	movs r1, 0x7
	bl sub_81074C4
	ldr r4, _0801EA9C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801EAA0
	b _0801E838
	.align 2, 0
_0801EA98: .4byte byte_2024C06
_0801EA9C: .4byte gUnknown_02024C10
_0801EAA0: .4byte BattleScript_1D98B1
_0801EAA4:
	mov r0, r9
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0801EAB2
	b _0801EBE8
_0801EAB2:
	movs r4, 0x1
	mov r10, r4
	b _0801EBE8
_0801EAB8:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r9
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x11
	bne _0801EB26
	cmp r4, 0x1
	beq _0801EAD2
	cmp r5, 0x80
	bne _0801EB26
_0801EAD2:
	ldr r0, _0801EB0C
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x11
	bl sub_81074C4
	ldr r4, _0801EB10
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801EB14
	str r0, [r4]
	ldr r2, _0801EB18
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _0801EB20
_0801EAFC:
	movs r0, 0x1
	strb r0, [r7, 0x5]
	ldr r0, _0801EB1C
	ands r1, r0
	str r1, [r2]
	bl _0801F7CE
	.align 2, 0
_0801EB0C: .4byte byte_2024C06
_0801EB10: .4byte gUnknown_02024C10
_0801EB14: .4byte BattleScript_1D98BD
_0801EB18: .4byte gUnknown_02024C6C
_0801EB1C: .4byte 0xffffdfff
_0801EB20:
	strb r0, [r7, 0x5]
	bl _0801F7CE
_0801EB26:
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x58
	muls r0, r1
	add r0, r9
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r1, 0x3
	beq _0801EB4A
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0801EB4A
	cmp r1, 0x8
	beq _0801EB4A
	cmp r0, 0x8
	bne _0801EB88
_0801EB4A:
	ldr r0, _0801EB78
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _0801EB88
	cmp r4, 0x1
	beq _0801EB60
	cmp r5, 0x80
	bne _0801EB88
_0801EB60:
	ldr r4, _0801EB7C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801EB80
_0801EB6C:
	str r0, [r4]
	ldr r1, _0801EB84
	movs r0, 0x2
	strb r0, [r1, 0x5]
	bl _0801F7CE
	.align 2, 0
_0801EB78: .4byte gUnknown_02024C6C
_0801EB7C: .4byte gUnknown_02024C10
_0801EB80: .4byte BattleScript_1D98BD
_0801EB84: .4byte gUnknown_02024D1E
_0801EB88:
	mov r3, r8
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	mov r2, r9
	adds r2, 0x4C
	adds r5, r0, r2
	ldr r4, [r5]
	cmp r4, 0
	bne _0801EBE8
	mov r3, r9
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r3, [r0]
	cmp r3, 0x3
	beq _0801EBDE
	adds r0, 0x1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0801EBDE
	cmp r3, 0x8
	beq _0801EBDE
	cmp r0, 0x8
	beq _0801EBDE
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x11
	beq _0801EBE8
	mov r4, r8
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x9
	negs r2, r2
	ands r0, r2
	str r0, [r1]
_0801EBD8:
	movs r0, 0x1
	mov r10, r0
	b _0801EBE8
_0801EBDE:
	ldr r0, _0801EC2C
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_0801EBE8:
	mov r1, r10
	cmp r1, 0x1
	beq _0801EBF0
	b _0801ED10
_0801EBF0:
	ldr r0, _0801EC30
	ldr r0, [r0]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801EC34
	ldr r0, _0801EC38
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	cmp r3, 0x7
	bne _0801EC44
	bl Random
	ldr r2, _0801EC3C
	ldr r1, _0801EC40
	ldrb r3, [r1]
	movs r1, 0x58
	muls r3, r1
	adds r2, 0x4C
	adds r3, r2
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	b _0801EC58
	.align 2, 0
_0801EC2C: .4byte gUnknown_02024C68
_0801EC30: .4byte gUnknown_02024C10
_0801EC34: .4byte gUnknown_081FAB5C
_0801EC38: .4byte gUnknown_02024D1E
_0801EC3C: .4byte gBattleMons
_0801EC40: .4byte gUnknown_02024C0A
_0801EC44:
	ldr r2, _0801ECA8
	ldr r0, _0801ECAC
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r2, 0x4C
	adds r1, r2
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_0801EC58:
	ldr r2, _0801ECB0
	ldr r1, _0801ECB4
	ldr r5, _0801ECB8
	ldrb r0, [r5, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r4, _0801ECBC
	ldr r1, _0801ECAC
	ldrb r0, [r1]
	strb r0, [r4]
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	ldr r1, _0801ECC0
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r2, _0801ECC4
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _0801ECCC
	movs r0, 0x1
	strb r0, [r5, 0x5]
	ldr r0, _0801ECC8
	ands r1, r0
	str r1, [r2]
	b _0801ECCE
	.align 2, 0
_0801ECA8: .4byte gBattleMons
_0801ECAC: .4byte gUnknown_02024C0A
_0801ECB0: .4byte gUnknown_02024C10
_0801ECB4: .4byte gUnknown_081FAC4C
_0801ECB8: .4byte gUnknown_02024D1E
_0801ECBC: .4byte gUnknown_02024A60
_0801ECC0: .4byte gUnknown_02024ACC
_0801ECC4: .4byte gUnknown_02024C6C
_0801ECC8: .4byte 0xffffdfff
_0801ECCC:
	strb r0, [r5, 0x5]
_0801ECCE:
	ldr r0, _0801ED00
	ldrb r2, [r0, 0x3]
	adds r7, r0, 0
	cmp r2, 0x2
	beq _0801ECE8
	cmp r2, 0x6
	beq _0801ECE8
	cmp r2, 0x5
	beq _0801ECE8
	cmp r2, 0x3
	beq _0801ECE8
	bl _0801F7CE
_0801ECE8:
	ldr r0, _0801ED04
	ldrb r1, [r7, 0x3]
	ldr r2, _0801ED08
	adds r0, r2
	strb r1, [r0]
	ldr r2, _0801ED0C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 7
	bl _0801F6C6
	.align 2, 0
_0801ED00: .4byte gUnknown_02024D1E
_0801ED04: .4byte 0x02000000
_0801ED08: .4byte 0x000160ca
_0801ED0C: .4byte gUnknown_02024C6C
_0801ED10:
	mov r3, r10
	cmp r3, 0
	beq _0801ED1A
	bl _0801F7CE
_0801ED1A:
	bl _0801F7B0
_0801ED1E:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	mov r0, r9
	adds r0, 0x50
	adds r1, r0
	ldr r2, _0801ED58
	ldrb r3, [r7, 0x3]
	lsls r0, r3, 2
	adds r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801ED42
	bl _0801F7B0
_0801ED42:
	subs r0, r3, 0x7
	cmp r0, 0x34
	bls _0801ED4C
	bl _0801F7CE
_0801ED4C:
	lsls r0, 2
	ldr r1, _0801ED5C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801ED58: .4byte gUnknown_081FAB5C
_0801ED5C: .4byte _0801ED60
	.align 2, 0
_0801ED60:
	.4byte _0801EE34
	.4byte _0801EEA8
	.4byte _0801F020
	.4byte _0801EF34
	.4byte _0801EFB0
	.4byte _0801F058
	.4byte _0801F0A0
	.4byte _0801F17C
	.4byte _0801F1C0
	.4byte _0801F1C0
	.4byte _0801F1C0
	.4byte _0801F1C0
	.4byte _0801F1C0
	.4byte _0801F1C0
	.4byte _0801F1C0
	.4byte _0801F214
	.4byte _0801F214
	.4byte _0801F214
	.4byte _0801F214
	.4byte _0801F214
	.4byte _0801F214
	.4byte _0801F214
	.4byte _0801F310
	.4byte _0801F358
	.4byte _0801F378
	.4byte _0801F538
	.4byte _0801F574
	.4byte _0801F590
	.4byte _0801F5A8
	.4byte _0801F5C0
	.4byte _0801F620
	.4byte _0801F638
	.4byte _0801F268
	.4byte _0801F268
	.4byte _0801F268
	.4byte _0801F268
	.4byte _0801F268
	.4byte _0801F268
	.4byte _0801F268
	.4byte _0801F2BC
	.4byte _0801F2BC
	.4byte _0801F2BC
	.4byte _0801F2BC
	.4byte _0801F2BC
	.4byte _0801F2BC
	.4byte _0801F2BC
	.4byte _0801F67C
	.4byte _0801F6D4
	.4byte _0801F7CE
	.4byte _0801F7CE
	.4byte _0801F7CE
	.4byte _0801F7CE
	.4byte _0801F7C0
_0801EE34:
	mov r1, r8
	ldrb r0, [r1]
	movs r5, 0x58
	adds r1, r0, 0
	muls r1, r5
	mov r2, r9
	adds r0, r1, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _0801EE4E
	bl _0801F7B0
_0801EE4E:
	mov r4, r9
	adds r4, 0x50
	adds r0, r1, r4
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0801EE62
	bl _0801F7B0
_0801EE62:
	bl Random
	mov r3, r8
	ldrb r1, [r3]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	adds r1, 0x2
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r4, _0801EE9C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801EEA0
	ldr r0, _0801EEA4
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _0801F7CC
	.align 2, 0
_0801EE9C: .4byte gUnknown_02024C10
_0801EEA0: .4byte gUnknown_081FAC4C
_0801EEA4: .4byte gUnknown_02024D1E
_0801EEA8:
	mov r0, r8
	ldrb r2, [r0]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	add r0, r9
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x27
	bne _0801EEEC
	cmp r4, 0x1
	beq _0801EEC8
	cmp r5, 0x80
	beq _0801EEC8
	bl _0801F7B0
_0801EEC8:
	ldr r0, _0801EEE0
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x27
	bl sub_81074C4
	ldr r1, _0801EEE4
	ldr r0, _0801EEE8
	str r0, [r1]
	bl _0801F7CE
	.align 2, 0
_0801EEE0: .4byte byte_2024C06
_0801EEE4: .4byte gUnknown_02024C10
_0801EEE8: .4byte gUnknown_081D98D7
_0801EEEC:
	adds r0, r2, 0
	bl sub_801E3B4
	ldr r1, _0801EF28
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bhi _0801EF02
	bl _0801F7B0
_0801EF02:
	mov r2, r8
	ldrb r0, [r2]
	adds r2, r0, 0
	muls r2, r6
	mov r0, r9
	adds r0, 0x50
	adds r2, r0
	ldr r1, _0801EF2C
	ldr r0, _0801EF30
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
	bl _0801F7B0
	.align 2, 0
_0801EF28: .4byte gUnknown_02024A7E
_0801EF2C: .4byte gUnknown_081FAB5C
_0801EF30: .4byte gUnknown_02024D1E
_0801EF34:
	mov r3, r8
	ldrb r0, [r3]
	movs r5, 0x58
	muls r0, r5
	mov r4, r9
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r0, 0x70
	ands r0, r1
	cmp r0, 0
	beq _0801EF50
	bl _0801F7B0
_0801EF50:
	movs r0, 0x80
	lsls r0, 5
	orrs r1, r0
	str r1, [r2]
	ldr r1, _0801EF9C
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _0801EFA0
	ldrh r1, [r1]
	strh r1, [r0]
	bl Random
	mov r2, r8
	ldrb r1, [r2]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x2
	lsls r1, 4
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r4, _0801EFA4
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801EFA8
	ldr r0, _0801EFAC
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _0801F7CC
	.align 2, 0
_0801EF9C: .4byte gUnknown_02024C54
_0801EFA0: .4byte gUnknown_02024BE6
_0801EFA4: .4byte gUnknown_02024C10
_0801EFA8: .4byte gUnknown_081FAC4C
_0801EFAC: .4byte gUnknown_02024D1E
_0801EFB0:
	ldr r5, _0801F004
	ldrb r0, [r5]
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0801EFE8
	ldr r4, _0801F008
	ldrh r3, [r4]
	ldr r2, _0801F00C
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r3, r0
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r3, r0
	bls _0801EFE8
	ldr r3, _0801F010
	adds r0, r3, 0
	strh r0, [r4]
_0801EFE8:
	ldr r4, _0801F014
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801F018
	ldr r0, _0801F01C
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _0801F7CC
	.align 2, 0
_0801F004: .4byte gUnknown_02024C07
_0801F008: .4byte gUnknown_02024D1A
_0801F00C: .4byte gBattleMons
_0801F010: .4byte 0x0000ffff
_0801F014: .4byte gUnknown_02024C10
_0801F018: .4byte gUnknown_081FAC4C
_0801F01C: .4byte gUnknown_02024D1E
_0801F020:
	mov r4, r8
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	mov r1, r9
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _0801F036
	b _0801F7B0
_0801F036:
	bl Random
	ldr r4, _0801F054
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x3
	strb r0, [r4, 0x3]
	movs r0, 0
	movs r1, 0
	bl sub_801E3EC
	b _0801F7CE
	.align 2, 0
_0801F054: .4byte gUnknown_02024D1E
_0801F058:
	mov r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r9
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801F094
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldr r1, _0801F098
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r0, _0801F09C
	ldrb r1, [r2]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1, 0x1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x1]
	b _0801F7B0
	.align 2, 0
_0801F094: .4byte gUnknown_02024C54
_0801F098: .4byte gUnknown_02024BE6
_0801F09C: .4byte gUnknown_02024D28
_0801F0A0:
	mov r3, r8
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	mov r4, r9
	adds r4, 0x50
	adds r0, r4
	ldr r5, [r0]
	movs r0, 0xE0
	lsls r0, 8
	ands r5, r0
	cmp r5, 0
	beq _0801F0BC
	b _0801F7B0
_0801F0BC:
	bl Random
	mov r2, r8
	ldrb r1, [r2]
	adds r2, r1, 0
	muls r2, r6
	adds r2, r4
	movs r1, 0x3
	ands r1, r0
	adds r1, 0x3
	lsls r1, 13
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0801F154
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 1
	ldr r4, _0801F158
	adds r0, r4
	adds r0, r2
	ldr r6, _0801F15C
	ldrh r1, [r6]
	strb r1, [r0]
	ldrb r0, [r3]
	lsls r0, 1
	ldr r1, _0801F160
	adds r0, r1
	adds r0, r2
	ldrh r1, [r6]
	lsrs r1, 8
	strb r1, [r0]
	ldrb r0, [r3]
	ldr r3, _0801F164
	adds r0, r3
	adds r0, r2
	ldr r1, _0801F168
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r4, _0801F16C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801F170
	ldr r2, _0801F174
	ldrb r0, [r2, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r4]
	strb r5, [r2, 0x5]
	ldr r1, _0801F178
	ldrh r0, [r1]
	ldrh r4, [r6]
	cmp r0, r4
	bne _0801F130
	b _0801F7CE
_0801F130:
	adds r3, r1, 0
	adds r1, r6, 0
_0801F134:
	ldrb r0, [r2, 0x5]
	adds r0, 0x1
	strb r0, [r2, 0x5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0801F144
	b _0801F7CE
_0801F144:
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	ldrh r4, [r1]
	cmp r0, r4
	bne _0801F134
	b _0801F7CE
	.align 2, 0
_0801F154: .4byte 0x02000000
_0801F158: .4byte 0x00016004
_0801F15C: .4byte gUnknown_02024BE6
_0801F160: .4byte 0x00016005
_0801F164: .4byte 0x00016020
_0801F168: .4byte gUnknown_02024C07
_0801F16C: .4byte gUnknown_02024C10
_0801F170: .4byte gUnknown_081FAC4C
_0801F174: .4byte gUnknown_02024D1E
_0801F178: .4byte gUnknown_0840164C
_0801F17C:
	ldr r1, _0801F1AC
	ldr r0, _0801F1B0
	ldr r0, [r0]
	cmp r0, 0
	bge _0801F188
	adds r0, 0x3
_0801F188:
	asrs r0, 2
	str r0, [r1]
	cmp r0, 0
	bne _0801F194
	movs r0, 0x1
	str r0, [r1]
_0801F194:
	ldr r4, _0801F1B4
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801F1B8
	ldr r0, _0801F1BC
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	b _0801F7CC
	.align 2, 0
_0801F1AC: .4byte gUnknown_02024BEC
_0801F1B0: .4byte gUnknown_02024BF0
_0801F1B4: .4byte gUnknown_02024C10
_0801F1B8: .4byte gUnknown_081FAC4C
_0801F1BC: .4byte gUnknown_02024D1E
_0801F1C0:
	ldrb r1, [r7, 0x3]
	adds r1, 0xF2
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x10
	adds r2, r6, 0
	movs r3, 0
	bl sub_8025E20
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _0801F1DC
	b _0801F7B0
_0801F1DC:
	ldr r2, _0801F200
	ldrb r1, [r7, 0x3]
	movs r0, 0x3F
	ands r0, r1
	ldr r4, _0801F204
	adds r1, r2, r4
	strb r0, [r1]
	ldr r0, _0801F208
	adds r2, r0
	strb r3, [r2]
	ldr r4, _0801F20C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F210
	b _0801F7CC
	.align 2, 0
_0801F200: .4byte 0x02000000
_0801F204: .4byte 0x000160a4
_0801F208: .4byte 0x000160a5
_0801F20C: .4byte gUnknown_02024C10
_0801F210: .4byte gUnknown_081D71E5
_0801F214:
	movs r0, 0x70
	negs r0, r0
	ldrb r1, [r7, 0x3]
	adds r1, 0xEB
	lsls r1, 24
	lsrs r1, 24
	adds r2, r6, 0
	movs r3, 0
	bl sub_8025E20
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _0801F232
	b _0801F7B0
_0801F232:
	ldr r2, _0801F254
	ldrb r1, [r7, 0x3]
	movs r0, 0x3F
	ands r0, r1
	ldr r4, _0801F258
	adds r1, r2, r4
	strb r0, [r1]
	ldr r0, _0801F25C
	adds r2, r0
	strb r3, [r2]
	ldr r4, _0801F260
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F264
	b _0801F7CC
	.align 2, 0
_0801F254: .4byte 0x02000000
_0801F258: .4byte 0x000160a4
_0801F25C: .4byte 0x000160a5
_0801F260: .4byte gUnknown_02024C10
_0801F264: .4byte gUnknown_081D7276
_0801F268:
	ldrb r1, [r7, 0x3]
	adds r1, 0xDA
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x20
	adds r2, r6, 0
	movs r3, 0
	bl sub_8025E20
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _0801F284
	b _0801F7B0
_0801F284:
	ldr r2, _0801F2A8
	ldrb r1, [r7, 0x3]
	movs r0, 0x3F
	ands r0, r1
	ldr r4, _0801F2AC
	adds r1, r2, r4
	strb r0, [r1]
	ldr r0, _0801F2B0
	adds r2, r0
	strb r3, [r2]
	ldr r4, _0801F2B4
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F2B8
	b _0801F7CC
	.align 2, 0
_0801F2A8: .4byte 0x02000000
_0801F2AC: .4byte 0x000160a4
_0801F2B0: .4byte 0x000160a5
_0801F2B4: .4byte gUnknown_02024C10
_0801F2B8: .4byte gUnknown_081D71E5
_0801F2BC:
	movs r0, 0x60
	negs r0, r0
	ldrb r1, [r7, 0x3]
	adds r1, 0xD3
	lsls r1, 24
	lsrs r1, 24
	adds r2, r6, 0
	movs r3, 0
	bl sub_8025E20
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _0801F2DA
	b _0801F7B0
_0801F2DA:
	ldr r2, _0801F2FC
	ldrb r1, [r7, 0x3]
	movs r0, 0x3F
	ands r0, r1
	ldr r4, _0801F300
	adds r1, r2, r4
	strb r0, [r1]
	ldr r0, _0801F304
	adds r2, r0
	strb r3, [r2]
	ldr r4, _0801F308
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F30C
	b _0801F7CC
	.align 2, 0
_0801F2FC: .4byte 0x02000000
_0801F300: .4byte 0x000160a4
_0801F304: .4byte 0x000160a5
_0801F308: .4byte gUnknown_02024C10
_0801F30C: .4byte gUnknown_081D7276
_0801F310:
	mov r2, r8
	ldrb r1, [r2]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r9
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 15
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0801F34C
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0, 0x19]
	ldr r1, _0801F350
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _0801F354
	ldrh r1, [r1]
	strh r1, [r0]
	b _0801F7B0
	.align 2, 0
_0801F34C: .4byte gUnknown_02024CA8
_0801F350: .4byte gUnknown_02024C54
_0801F354: .4byte gUnknown_02024BE6
_0801F358:
	ldr r0, _0801F374
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r9
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 16
_0801F36E:
	orrs r0, r1
	str r0, [r2]
	b _0801F7B0
	.align 2, 0
_0801F374: .4byte gUnknown_02024C07
_0801F378:
	ldr r4, _0801F428
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0801F3AC
	ldr r0, _0801F42C
	ldrh r1, [r0]
	ldr r0, _0801F430
	ands r0, r1
	cmp r0, 0
	bne _0801F3E8
	ldr r0, _0801F434
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0801F3AC
	b _0801F7B0
_0801F3AC:
	ldr r0, _0801F42C
	ldrh r1, [r0]
	ldr r0, _0801F430
	ands r0, r1
	cmp r0, 0
	bne _0801F3E8
	ldr r0, _0801F434
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0801F3E8
	ldr r0, _0801F438
	adds r0, 0x29
	adds r0, r6, r0
	ldrb r1, [r0]
	ldr r3, _0801F43C
	ldr r2, _0801F440
	ldr r0, _0801F428
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801F3E8
	b _0801F7B0
_0801F3E8:
	ldr r2, _0801F444
	ldr r1, _0801F448
	ldrb r0, [r1]
	movs r3, 0x58
	muls r0, r3
	adds r4, r0, r2
	ldrh r0, [r4, 0x2E]
	adds r7, r1, 0
	mov r9, r2
	cmp r0, 0
	beq _0801F458
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3C
	bne _0801F458
	ldr r1, _0801F44C
	ldr r0, _0801F450
	str r0, [r1]
	ldr r1, _0801F454
	ldrb r0, [r7]
	muls r0, r3
	add r0, r9
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldrb r1, [r1]
	bl sub_81074C4
	b _0801F7CE
	.align 2, 0
_0801F428: .4byte gUnknown_02024C07
_0801F42C: .4byte gUnknown_020239F8
_0801F430: .4byte 0x00000902
_0801F434: .4byte gTrainerBattleOpponent
_0801F438: .4byte gUnknown_02024DBC
_0801F43C: .4byte gBitTable
_0801F440: .4byte gUnknown_02024A6A
_0801F444: .4byte gBattleMons
_0801F448: .4byte gUnknown_02024C08
_0801F44C: .4byte gUnknown_02024C10
_0801F450: .4byte gUnknown_081D9913
_0801F454: .4byte byte_2024C06
_0801F458:
	ldr r4, _0801F514
	mov r10, r4
	ldrb r1, [r4]
	movs r0, 0x58
	mov r8, r0
	mov r0, r8
	muls r0, r1
	add r0, r9
	ldrh r3, [r0, 0x2E]
	cmp r3, 0
	beq _0801F470
	b _0801F7B0
_0801F470:
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	add r0, r9
	ldrh r2, [r0, 0x2E]
	adds r0, r2, 0
	cmp r0, 0xAF
	bne _0801F484
	b _0801F7B0
_0801F484:
	cmp r0, 0
	bne _0801F48A
	b _0801F7B0
_0801F48A:
	lsls r0, r1, 1
	ldr r5, _0801F518
	adds r0, r5
	ldr r1, _0801F51C
	strh r2, [r0]
	strh r2, [r1]
	ldrb r0, [r7]
	mov r4, r8
	muls r4, r0
	adds r0, r4, 0
	add r0, r9
	movs r6, 0
	strh r3, [r0, 0x2E]
	ldr r4, _0801F520
	mov r2, r10
	ldrb r0, [r2]
	strb r0, [r4]
	str r1, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	mov r3, r10
	ldrb r0, [r3]
	bl dp01_battle_side_mark_buffer_for_execution
	ldrb r0, [r7]
	strb r0, [r4]
	ldrb r0, [r7]
	mov r4, r8
	muls r4, r0
	adds r0, r4, 0
	mov r1, r9
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r7]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r4, _0801F524
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F528
	str r0, [r4]
	ldr r0, _0801F52C
	adds r5, r0
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _0801F530
	adds r0, r1
	adds r0, r5
	strb r6, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r2, _0801F534
	adds r0, r2
	adds r0, r5
	strb r6, [r0]
	b _0801F7CE
	.align 2, 0
_0801F514: .4byte gUnknown_02024C07
_0801F518: .4byte 0x020160f0
_0801F51C: .4byte gUnknown_02024C04
_0801F520: .4byte gUnknown_02024A60
_0801F524: .4byte gUnknown_02024C10
_0801F528: .4byte gUnknown_081D96F6
_0801F52C: .4byte 0xfffe9f10
_0801F530: .4byte 0x000160e8
_0801F534: .4byte 0x000160e9
_0801F538:
	ldr r3, _0801F568
	ldrb r1, [r3]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r9
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0801F56C
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0801F570
	ldrb r1, [r1]
	strb r1, [r0, 0x14]
	b _0801F7B0
	.align 2, 0
_0801F568: .4byte gUnknown_02024C08
_0801F56C: .4byte gUnknown_02024CA8
_0801F570: .4byte gUnknown_02024C07
_0801F574:
	ldr r0, _0801F58C
	ldrb r1, [r0]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r9
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 20
	b _0801F36E
	.align 2, 0
_0801F58C: .4byte gUnknown_02024C08
_0801F590:
	ldr r4, _0801F5A0
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F5A4
	b _0801F7CC
	.align 2, 0
_0801F5A0: .4byte gUnknown_02024C10
_0801F5A4: .4byte gUnknown_081D9224
_0801F5A8:
	ldr r4, _0801F5B8
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F5BC
	b _0801F7CC
	.align 2, 0
_0801F5B8: .4byte gUnknown_02024C10
_0801F5BC: .4byte gUnknown_081D92C0
_0801F5C0:
	ldr r6, _0801F610
	ldrb r0, [r6]
	movs r2, 0x58
	muls r0, r2
	mov r1, r9
	adds r1, 0x4C
	adds r5, r0, r1
	ldr r4, [r5]
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	bne _0801F5DA
	b _0801F7B0
_0801F5DA:
	movs r0, 0x41
	negs r0, r0
	ands r4, r0
	str r4, [r5]
	ldr r4, _0801F614
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r4, _0801F618
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F61C
	b _0801F7CC
	.align 2, 0
_0801F610: .4byte gUnknown_02024C08
_0801F614: .4byte gUnknown_02024A60
_0801F618: .4byte gUnknown_02024C10
_0801F61C: .4byte gUnknown_081D9635
_0801F620:
	ldr r4, _0801F630
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F634
	b _0801F7CC
	.align 2, 0
_0801F630: .4byte gUnknown_02024C10
_0801F634: .4byte gUnknown_081D93FA
_0801F638:
	ldr r4, _0801F668
	ldr r0, _0801F66C
	ldr r0, [r0]
	movs r1, 0x3
	bl __divsi3
	str r0, [r4]
	cmp r0, 0
	bne _0801F64E
	movs r0, 0x1
	str r0, [r4]
_0801F64E:
	ldr r4, _0801F670
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r1, _0801F674
	ldr r0, _0801F678
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	b _0801F7CC
	.align 2, 0
_0801F668: .4byte gUnknown_02024BEC
_0801F66C: .4byte gUnknown_02024BF0
_0801F670: .4byte gUnknown_02024C10
_0801F674: .4byte gUnknown_081FAC4C
_0801F678: .4byte gUnknown_02024D1E
_0801F67C:
	mov r3, r8
	ldrb r0, [r3]
	movs r5, 0x58
	muls r0, r5
	mov r4, r9
	adds r4, 0x50
	adds r2, r0, r4
	ldr r1, [r2]
	movs r0, 0xC0
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _0801F698
	b _0801F7B0
_0801F698:
	movs r0, 0x80
	lsls r0, 5
	orrs r1, r0
	str r1, [r2]
	ldr r1, _0801F6CC
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _0801F6D0
	ldrh r1, [r1]
	strh r1, [r0]
	bl Random
	mov r2, r8
	ldrb r1, [r2]
	adds r2, r1, 0
	muls r2, r5
	adds r2, r4
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x2
	lsls r1, 10
	ldr r0, [r2]
_0801F6C6:
	orrs r0, r1
	str r0, [r2]
	b _0801F7CE
	.align 2, 0
_0801F6CC: .4byte gUnknown_02024C54
_0801F6D0: .4byte gUnknown_02024BE6
_0801F6D4:
	mov r5, r8
	ldrb r3, [r5]
	movs r4, 0x58
	adds r0, r3, 0
	muls r0, r4
	mov r2, r9
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x3C
	bne _0801F714
	ldrh r0, [r1, 0x2E]
	cmp r0, 0
	beq _0801F7B0
	ldr r0, _0801F708
	strb r2, [r0]
	ldr r1, _0801F70C
	ldr r0, _0801F710
	str r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x3C
	bl sub_81074C4
	b _0801F7CE
	.align 2, 0
_0801F708: .4byte byte_2024C06
_0801F70C: .4byte gUnknown_02024C10
_0801F710: .4byte gUnknown_081D9913
_0801F714:
	ldrh r0, [r1, 0x2E]
	cmp r0, 0
	beq _0801F7B0
	adds r0, r3, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0801F78C
	mov r3, r8
	ldrb r0, [r3]
	muls r0, r4
	add r0, r9
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	ldrb r0, [r3]
	muls r0, r4
	add r0, r9
	movs r5, 0
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r2, _0801F790
	adds r2, 0x29
	adds r2, r6, r2
	ldr r3, _0801F794
	ldr r1, _0801F798
	mov r4, r8
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _0801F79C
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F7A0
	str r0, [r4]
	ldr r1, _0801F7A4
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	ldr r3, _0801F7A8
	adds r0, r3
	adds r0, r1
	strb r5, [r0]
	ldrb r0, [r2]
	lsls r0, 1
	ldr r4, _0801F7AC
	adds r0, r4
	adds r0, r1
	strb r5, [r0]
	b _0801F7CE
	.align 2, 0
_0801F78C: .4byte gUnknown_02024C04
_0801F790: .4byte gUnknown_02024DBC
_0801F794: .4byte gBitTable
_0801F798: .4byte gUnknown_02024A6A
_0801F79C: .4byte gUnknown_02024C10
_0801F7A0: .4byte gUnknown_081D944B
_0801F7A4: .4byte 0x02000000
_0801F7A8: .4byte 0x000160e8
_0801F7AC: .4byte 0x000160e9
_0801F7B0:
	ldr r1, _0801F7BC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _0801F7CE
	.align 2, 0
_0801F7BC: .4byte gUnknown_02024C10
_0801F7C0:
	ldr r4, _0801F7E0
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _0801F7E4
_0801F7CC:
	str r0, [r4]
_0801F7CE:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F7E0: .4byte gUnknown_02024C10
_0801F7E4: .4byte gUnknown_081D94B0
	thumb_func_end sub_801E3EC

	thumb_func_start atk15_seteffectwithchancetarget
atk15_seteffectwithchancetarget: @ 801F7E8
	push {r4,lr}
	ldr r2, _0801F814
	ldr r0, _0801F818
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x20
	bne _0801F824
	ldr r2, _0801F81C
	ldr r0, _0801F820
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 1
	b _0801F834
	.align 2, 0
_0801F814: .4byte gBattleMons
_0801F818: .4byte gUnknown_02024C07
_0801F81C: .4byte gBattleMoves
_0801F820: .4byte gUnknown_02024BE6
_0801F824:
	ldr r2, _0801F854
	ldr r0, _0801F858
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r4, [r0, 0x5]
_0801F834:
	ldr r3, _0801F85C
	ldrb r2, [r3, 0x3]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0801F864
	ldr r0, _0801F860
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801F864
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r3, 0x3]
	b _0801F892
	.align 2, 0
_0801F854: .4byte gBattleMoves
_0801F858: .4byte gUnknown_02024BE6
_0801F85C: .4byte gUnknown_02024D1E
_0801F860: .4byte gUnknown_02024C68
_0801F864:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bhi _0801F8AE
	ldr r0, _0801F89C
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _0801F8AE
	ldr r0, _0801F8A0
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _0801F8AE
	cmp r4, 0x63
	bls _0801F8A4
_0801F892:
	movs r0, 0
	movs r1, 0x80
	bl sub_801E3EC
	b _0801F8B6
	.align 2, 0
_0801F89C: .4byte gUnknown_02024D1E
_0801F8A0: .4byte gUnknown_02024C68
_0801F8A4:
	movs r0, 0
	movs r1, 0
	bl sub_801E3EC
	b _0801F8B6
_0801F8AE:
	ldr r1, _0801F8CC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0801F8B6:
	ldr r0, _0801F8D0
	movs r1, 0
	strb r1, [r0, 0x3]
	ldr r0, _0801F8D4
	ldr r2, _0801F8D8
	adds r0, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F8CC: .4byte gUnknown_02024C10
_0801F8D0: .4byte gUnknown_02024D1E
_0801F8D4: .4byte 0x02000000
_0801F8D8: .4byte 0x00016112
	thumb_func_end atk15_seteffectwithchancetarget

	thumb_func_start sub_801F708
sub_801F708: @ 801F8DC
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl sub_801E3EC
	pop {r0}
	bx r0
	thumb_func_end sub_801F708

	thumb_func_start sub_801F718
sub_801F718: @ 801F8EC
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_801E3EC
	pop {r0}
	bx r0
	thumb_func_end sub_801F718

	thumb_func_start sub_801F728
sub_801F728: @ 801F8FC
	push {lr}
	ldr r0, _0801F920
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r2, _0801F924
	strb r0, [r2]
	ldr r3, _0801F928
	ldrb r0, [r3, 0x3]
	cmp r0, 0x6
	bhi _0801F930
	ldr r1, _0801F92C
	ldrb r2, [r2]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x4C
	b _0801F93A
	.align 2, 0
_0801F920: .4byte gUnknown_02024C10
_0801F924: .4byte gUnknown_02024A60
_0801F928: .4byte gUnknown_02024D1E
_0801F92C: .4byte gBattleMons
_0801F930:
	ldr r1, _0801F968
	ldrb r2, [r2]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
_0801F93A:
	adds r2, r1
	ldr r1, _0801F96C
	ldrb r0, [r3, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	ldr r0, _0801F970
	movs r2, 0
	strb r2, [r0, 0x3]
	ldr r1, _0801F974
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	ldr r0, _0801F978
	ldr r1, _0801F97C
	adds r0, r1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0801F968: .4byte gBattleMons
_0801F96C: .4byte gUnknown_081FAB5C
_0801F970: .4byte gUnknown_02024D1E
_0801F974: .4byte gUnknown_02024C10
_0801F978: .4byte 0x02000000
_0801F97C: .4byte 0x00016112
	thumb_func_end sub_801F728

	thumb_func_start sub_801F7AC
sub_801F7AC: @ 801F980
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0801F9F0
	ldr r2, [r0]
	ldrb r1, [r2, 0x2]
	adds r6, r0, 0
	cmp r1, 0
	beq _0801FA08
	ldrb r0, [r2, 0x1]
	bl sub_8015150
	ldr r5, _0801F9F4
	strb r0, [r5]
	ldr r2, _0801F9F8
	ldr r1, _0801F9FC
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	ands r0, r1
	cmp r0, 0
	bne _0801F9BA
	b _0801FCF0
_0801F9BA:
	ldr r1, [r6]
	ldrb r4, [r1, 0x3]
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r1, 0x6]
	lsls r0, 24
	orrs r4, r0
	bl b_movescr_stack_pop_cursor
	str r4, [r6]
	ldrb r0, [r5]
	bl battle_side_get_owner
	ldr r1, _0801FA00
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r2, [r0]
	ldr r1, _0801FA04
	ands r1, r2
	strh r1, [r0]
	b _0801FCF6
	.align 2, 0
_0801F9F0: .4byte gUnknown_02024C10
_0801F9F4: .4byte gUnknown_02024A60
_0801F9F8: .4byte gUnknown_02024C6C
_0801F9FC: .4byte gBitTable
_0801FA00: .4byte gUnknown_02024C7A
_0801FA04: .4byte 0x0000fdff
_0801FA08:
	ldrb r0, [r2, 0x1]
	cmp r0, 0x1
	bne _0801FA30
	ldr r1, _0801FA20
	ldr r0, _0801FA24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0801FA28
	ldrb r7, [r0]
	ldr r4, _0801FA2C
	b _0801FA3E
	.align 2, 0
_0801FA20: .4byte gUnknown_02024A60
_0801FA24: .4byte gUnknown_02024C07
_0801FA28: .4byte gUnknown_02024C08
_0801FA2C: .4byte gUnknown_081D8C58
_0801FA30:
	ldr r1, _0801FB28
	ldr r0, _0801FB2C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0801FB30
	ldrb r7, [r0]
	ldr r4, _0801FB34
_0801FA3E:
	ldr r0, _0801FB38
	ldrb r1, [r0]
	ldr r0, _0801FB3C
	mov r12, r0
	ldr r2, _0801FB28
	mov r8, r2
	ldrb r2, [r2]
	lsls r0, r2, 2
	add r0, r12
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0801FA5A
	b _0801FCF0
_0801FA5A:
	ldr r3, _0801FB40
	mov r10, r3
	movs r5, 0x58
	mov r9, r5
	mov r0, r9
	muls r0, r2
	add r0, r10
	ldrh r3, [r0, 0x28]
	cmp r3, 0
	beq _0801FA70
	b _0801FCF0
_0801FA70:
	ldr r2, _0801FB44
	lsls r1, r7, 1
	ldr r5, _0801FB48
	adds r0, r1, r5
	adds r0, r2
	strb r3, [r0]
	ldr r0, _0801FB4C
	adds r1, r0
	adds r1, r2
	strb r3, [r1]
	lsls r1, r7, 2
	adds r5, 0x54
	adds r0, r1, r5
	adds r0, r2
	strb r3, [r0]
	adds r5, 0x1
	adds r0, r1, r5
	adds r0, r2
	strb r3, [r0]
	adds r5, 0x1
	adds r0, r1, r5
	adds r0, r2
	strb r3, [r0]
	ldr r0, _0801FB50
	adds r1, r0
	adds r1, r2
	strb r3, [r1]
	ldr r5, _0801FB54
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 2
	add r0, r12
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	ldr r0, [r6]
	adds r0, 0x7
	bl b_movescr_stack_push
	str r4, [r6]
	mov r2, r8
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801FB84
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 15
	orrs r0, r1
	str r0, [r5]
	ldr r1, _0801FB58
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _0801FAE8
	adds r0, 0x1
	strb r0, [r1]
_0801FAE8:
	mov r0, r9
	muls r0, r7
	add r0, r10
	adds r3, r0, 0
	adds r3, 0x2A
	mov r4, r8
	ldrb r2, [r4]
	mov r0, r9
	muls r0, r2
	add r0, r10
	adds r1, r0, 0
	adds r1, 0x2A
	ldrb r0, [r3]
	ldrb r5, [r1]
	cmp r0, r5
	bls _0801FBA0
	ldrb r1, [r1]
	subs r0, r1
	cmp r0, 0x1D
	ble _0801FB64
	ldr r1, _0801FB5C
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0801FB60
	adds r0, r1
	movs r1, 0x8
	bl AdjustFriendship
	b _0801FBA0
	.align 2, 0
_0801FB28: .4byte gUnknown_02024A60
_0801FB2C: .4byte gUnknown_02024C08
_0801FB30: .4byte gUnknown_02024C07
_0801FB34: .4byte gUnknown_081D8C65
_0801FB38: .4byte gUnknown_02024C0C
_0801FB3C: .4byte gBitTable
_0801FB40: .4byte gBattleMons
_0801FB44: .4byte 0x02000000
_0801FB48: .4byte 0x000160ac
_0801FB4C: .4byte 0x000160ad
_0801FB50: .4byte 0x00016103
_0801FB54: .4byte gUnknown_02024C6C
_0801FB58: .4byte gUnknown_030042E0
_0801FB5C: .4byte gUnknown_02024A6A
_0801FB60: .4byte gPlayerParty
_0801FB64:
	ldr r1, _0801FB7C
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0801FB80
	adds r0, r1
	movs r1, 0x6
	bl AdjustFriendship
	b _0801FBA0
	.align 2, 0
_0801FB7C: .4byte gUnknown_02024A6A
_0801FB80: .4byte gPlayerParty
_0801FB84:
	ldr r1, _0801FCB4
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFE
	bhi _0801FB90
	adds r0, 0x1
	strb r0, [r1, 0x1]
_0801FB90:
	ldr r2, _0801FCB8
	ldrb r0, [r2]
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
_0801FBA0:
	ldr r0, _0801FCBC
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801FBD6
	ldr r6, _0801FCC0
	ldr r0, _0801FCC4
	ldrb r0, [r0]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801FBD6
	ldr r4, _0801FCC8
	ldr r0, [r4]
	bl b_movescr_stack_push
	ldr r1, _0801FCCC
	adds r0, r7, 0
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x28]
	str r0, [r1]
	ldr r0, _0801FCD0
	str r0, [r4]
_0801FBD6:
	ldr r1, _0801FCD4
	ldr r6, _0801FCD8
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 7
	ands r0, r1
	cmp r0, 0
	bne _0801FBEE
	b _0801FCF6
_0801FBEE:
	ldr r0, _0801FCBC
	ldr r5, [r0]
	movs r0, 0x80
	lsls r0, 17
	ands r5, r0
	cmp r5, 0
	bne _0801FCF6
	ldr r4, _0801FCC4
	mov r8, r4
	ldrb r0, [r4]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0801FCF6
	ldr r0, _0801FCC0
	mov r9, r0
	mov r1, r8
	ldrb r2, [r1]
	movs r7, 0x58
	adds r3, r2, 0
	muls r3, r7
	adds r0, r3, r0
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801FCF6
	ldr r0, _0801FCDC
	ldrh r0, [r0]
	cmp r0, 0xA5
	beq _0801FCF6
	ldr r1, _0801FCE0
	ldr r4, _0801FCE4
	adds r0, r2, r4
	adds r0, r1
	ldrb r4, [r0]
	adds r0, r4, r3
	mov r6, r9
	adds r6, 0x24
	adds r0, r6
	strb r5, [r0]
	ldr r5, _0801FCC8
	ldr r0, [r5]
	bl b_movescr_stack_push
	ldr r0, _0801FCE8
	str r0, [r5]
	ldr r5, _0801FCB8
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r5]
	adds r1, r4, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r5]
	muls r0, r7
	adds r0, r6
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _0801FCEC
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	lsls r4, 1
	mov r2, r8
	ldrb r0, [r2]
	muls r0, r7
	adds r0, r4, r0
	mov r2, r9
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	mov r3, r8
	ldrb r0, [r3]
	muls r0, r7
	adds r4, r0
	adds r4, r2
	ldrh r0, [r4]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	b _0801FCF6
	.align 2, 0
_0801FCB4: .4byte gUnknown_030042E0
_0801FCB8: .4byte gUnknown_02024A60
_0801FCBC: .4byte gUnknown_02024C6C
_0801FCC0: .4byte gBattleMons
_0801FCC4: .4byte gUnknown_02024C07
_0801FCC8: .4byte gUnknown_02024C10
_0801FCCC: .4byte gUnknown_02024BEC
_0801FCD0: .4byte gUnknown_081D9156
_0801FCD4: .4byte gUnknown_02024C98
_0801FCD8: .4byte gUnknown_02024C08
_0801FCDC: .4byte gUnknown_02024BE6
_0801FCE0: .4byte 0x02000000
_0801FCE4: .4byte 0x0001608c
_0801FCE8: .4byte gUnknown_081D9468
_0801FCEC: .4byte gUnknown_030041C0
_0801FCF0:
	ldr r0, [r6]
	adds r0, 0x7
	str r0, [r6]
_0801FCF6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_801F7AC

	thumb_func_start sub_801FB34
sub_801FB34: @ 801FD08
	push {r4,r5,lr}
	ldr r0, _0801FD38
	ldr r0, [r0]
	cmp r0, 0
	bne _0801FD32
	ldr r5, _0801FD3C
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _0801FD40
	strb r0, [r4]
	movs r0, 0
	bl dp01_build_cmdbuf_x0A_A_A_A
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_0801FD32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD38: .4byte gUnknown_02024A64
_0801FD3C: .4byte gUnknown_02024C10
_0801FD40: .4byte gUnknown_02024A60
	thumb_func_end sub_801FB34

	thumb_func_start atkE2_cmde2
atkE2_cmde2: @ 801FD44
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0801FD98
	ldr r6, [r0]
	cmp r6, 0
	bne _0801FD90
	ldr r5, _0801FD9C
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _0801FDA0
	strb r0, [r4]
	ldr r1, _0801FDA4
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	str r6, [r0]
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	bl sub_8010F48
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_0801FD90:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD98: .4byte gUnknown_02024A64
_0801FD9C: .4byte gUnknown_02024C10
_0801FDA0: .4byte gUnknown_02024A60
_0801FDA4: .4byte gBattleMons
	thumb_func_end atkE2_cmde2

	thumb_func_start atk1C_jumpifstatus
atk1C_jumpifstatus: @ 801FDA8
	push {r4,r5,lr}
	ldr r5, _0801FE04
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	ldrb r4, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	lsls r1, 8
	adds r4, r1
	ldrb r1, [r2, 0x4]
	lsls r1, 16
	adds r4, r1
	ldrb r1, [r2, 0x5]
	lsls r1, 24
	adds r4, r1
	ldrb r3, [r2, 0x6]
	ldrb r1, [r2, 0x7]
	lsls r1, 8
	adds r3, r1
	ldrb r1, [r2, 0x8]
	lsls r1, 16
	adds r3, r1
	ldrb r1, [r2, 0x9]
	lsls r1, 24
	adds r3, r1
	ldr r2, _0801FE08
	movs r1, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _0801FE0C
	adds r0, r1, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801FE0C
	str r3, [r5]
	b _0801FE14
	.align 2, 0
_0801FE04: .4byte gUnknown_02024C10
_0801FE08: .4byte gBattleMons
_0801FE0C:
	ldr r1, _0801FE1C
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_0801FE14:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE1C: .4byte gUnknown_02024C10
	thumb_func_end atk1C_jumpifstatus

	thumb_func_start atk1D_jumpifsecondarystatus
atk1D_jumpifsecondarystatus: @ 801FE20
	push {r4,r5,lr}
	ldr r5, _0801FE7C
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [r5]
	ldrb r4, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	lsls r1, 8
	adds r4, r1
	ldrb r1, [r2, 0x4]
	lsls r1, 16
	adds r4, r1
	ldrb r1, [r2, 0x5]
	lsls r1, 24
	adds r4, r1
	ldrb r3, [r2, 0x6]
	ldrb r1, [r2, 0x7]
	lsls r1, 8
	adds r3, r1
	ldrb r1, [r2, 0x8]
	lsls r1, 16
	adds r3, r1
	ldrb r1, [r2, 0x9]
	lsls r1, 24
	adds r3, r1
	ldr r2, _0801FE80
	movs r1, 0x58
	muls r1, r0
	adds r0, r2, 0
	adds r0, 0x50
	adds r0, r1, r0
	ldr r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _0801FE84
	adds r0, r1, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0801FE84
	str r3, [r5]
	b _0801FE8C
	.align 2, 0
_0801FE7C: .4byte gUnknown_02024C10
_0801FE80: .4byte gBattleMons
_0801FE84:
	ldr r1, _0801FE94
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
_0801FE8C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE94: .4byte gUnknown_02024C10
	thumb_func_end atk1D_jumpifsecondarystatus

	thumb_func_start atk1E_jumpifability
atk1E_jumpifability: @ 801FE98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r6, _0801FEEC
	ldr r2, [r6]
	ldrb r5, [r2, 0x2]
	mov r8, r5
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	adds r7, r1, r0
	ldrb r0, [r2, 0x1]
	cmp r0, 0x8
	bne _0801FEF8
	ldr r0, _0801FEF0
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD
	adds r2, r5, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0801FF74
	ldr r1, _0801FEF4
	strb r5, [r1]
	str r7, [r6]
	subs r4, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	ldrb r1, [r1]
	b _0801FF54
	.align 2, 0
_0801FEEC: .4byte gUnknown_02024C10
_0801FEF0: .4byte gUnknown_02024C07
_0801FEF4: .4byte byte_2024C06
_0801FEF8:
	cmp r0, 0x9
	bne _0801FF30
	ldr r0, _0801FF28
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC
	adds r2, r5, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0801FF74
	ldr r1, _0801FF2C
	strb r5, [r1]
	str r7, [r6]
	subs r4, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	ldrb r1, [r1]
	b _0801FF54
	.align 2, 0
_0801FF28: .4byte gUnknown_02024C07
_0801FF2C: .4byte byte_2024C06
_0801FF30:
	ldrb r0, [r2, 0x1]
	bl sub_8015150
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0801FF64
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, r8
	bne _0801FF74
	ldr r0, _0801FF68
	strb r1, [r0]
	str r7, [r6]
	ldrb r1, [r0]
	adds r0, r4, 0
_0801FF54:
	bl sub_81074C4
	ldr r0, _0801FF6C
	ldr r1, _0801FF70
	adds r0, r1
	strb r4, [r0]
	b _0801FF7A
	.align 2, 0
_0801FF64: .4byte gBattleMons
_0801FF68: .4byte byte_2024C06
_0801FF6C: .4byte 0x02000000
_0801FF70: .4byte 0x000160f8
_0801FF74:
	ldr r0, [r6]
	adds r0, 0x7
	str r0, [r6]
_0801FF7A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk1E_jumpifability

	thumb_func_start sub_801FDB4
sub_801FDB4: @ 801FF88
	push {r4-r6,lr}
	ldr r0, _0801FFA0
	ldr r0, [r0]
	ldrb r4, [r0, 0x1]
	cmp r4, 0x1
	bne _0801FFA8
	ldr r0, _0801FFA4
	ldrb r0, [r0]
	bl battle_get_per_side_status
	b _0801FFB2
	.align 2, 0
_0801FFA0: .4byte gUnknown_02024C10
_0801FFA4: .4byte gUnknown_02024C07
_0801FFA8:
	ldr r0, _0801FFE8
	ldrb r0, [r0]
	bl battle_get_per_side_status
	movs r4, 0x1
_0801FFB2:
	ands r4, r0
	ldr r6, _0801FFEC
	ldr r3, [r6]
	ldrb r2, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	adds r5, r1, r0
	ldr r1, _0801FFF0
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _0801FFF4
	str r5, [r6]
	b _0801FFFA
	.align 2, 0
_0801FFE8: .4byte gUnknown_02024C08
_0801FFEC: .4byte gUnknown_02024C10
_0801FFF0: .4byte gUnknown_02024C7A
_0801FFF4:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r6]
_0801FFFA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_801FDB4

	thumb_func_start sub_801FE2C
sub_801FE2C: @ 8020000
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08020034
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08020038
	ldr r3, [r4]
	movs r1, 0x58
	muls r0, r1
	ldrb r1, [r3, 0x3]
	adds r0, r1
	adds r2, 0x18
	adds r0, r2
	ldrb r2, [r0]
	ldrb r0, [r3, 0x2]
	cmp r0, 0x5
	bhi _080200BE
	lsls r0, 2
	ldr r1, _0802003C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020034: .4byte gUnknown_02024C10
_08020038: .4byte gBattleMons
_0802003C: .4byte _08020040
	.align 2, 0
_08020040:
	.4byte _08020058
	.4byte _08020068
	.4byte _08020078
	.4byte _08020088
	.4byte _08020098
	.4byte _080200AC
_08020058:
	ldr r0, _08020064
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	bne _080200BE
	b _080200B8
	.align 2, 0
_08020064: .4byte gUnknown_02024C10
_08020068:
	ldr r0, _08020074
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	beq _080200BE
	b _080200B8
	.align 2, 0
_08020074: .4byte gUnknown_02024C10
_08020078:
	ldr r0, _08020084
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	bls _080200BE
	b _080200B8
	.align 2, 0
_08020084: .4byte gUnknown_02024C10
_08020088:
	ldr r0, _08020094
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	cmp r2, r0
	bcs _080200BE
	b _080200B8
	.align 2, 0
_08020094: .4byte gUnknown_02024C10
_08020098:
	ldr r0, _080200A8
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	ands r2, r0
	cmp r2, 0
	beq _080200BE
	b _080200B8
	.align 2, 0
_080200A8: .4byte gUnknown_02024C10
_080200AC:
	ldr r0, _080200E0
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	ands r2, r0
	cmp r2, 0
	bne _080200BE
_080200B8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080200BE:
	cmp r5, 0
	beq _080200E4
	ldr r3, _080200E0
	ldr r2, [r3]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	b _080200EC
	.align 2, 0
_080200E0: .4byte gUnknown_02024C10
_080200E4:
	ldr r1, _080200F4
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
_080200EC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080200F4: .4byte gUnknown_02024C10
	thumb_func_end sub_801FE2C

	thumb_func_start atk21_jumpifspecialstatusflag
atk21_jumpifspecialstatusflag: @ 80200F8
	push {r4-r6,lr}
	ldr r4, _0802014C
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r5, _08020150
	strb r0, [r5]
	ldr r2, [r4]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	adds r6, r1, r0
	ldrb r1, [r2, 0x7]
	ldrb r0, [r2, 0x8]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0xA]
	lsls r0, 24
	adds r3, r1, r0
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _08020158
	ldr r0, _08020154
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	ands r0, r6
	cmp r0, 0
	bne _08020170
	b _08020168
	.align 2, 0
_0802014C: .4byte gUnknown_02024C10
_08020150: .4byte gUnknown_02024A60
_08020154: .4byte gUnknown_02024C98
_08020158:
	ldr r0, _0802016C
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	ands r0, r6
	cmp r0, 0
	beq _08020170
_08020168:
	str r3, [r4]
	b _08020176
	.align 2, 0
_0802016C: .4byte gUnknown_02024C98
_08020170:
	adds r0, r2, 0
	adds r0, 0xB
	str r0, [r4]
_08020176:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk21_jumpifspecialstatusflag

	thumb_func_start sub_801FFA8
sub_801FFA8: @ 802017C
	push {r4-r6,lr}
	ldr r4, _080201C4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldrb r5, [r3, 0x2]
	ldrb r2, [r3, 0x3]
	ldrb r1, [r3, 0x4]
	lsls r1, 8
	adds r2, r1
	ldrb r1, [r3, 0x5]
	lsls r1, 16
	adds r2, r1
	ldrb r1, [r3, 0x6]
	lsls r1, 24
	adds r6, r2, r1
	ldr r2, _080201C8
	movs r1, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r5
	beq _080201C0
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r5
	bne _080201CC
_080201C0:
	str r6, [r4]
	b _080201D0
	.align 2, 0
_080201C4: .4byte gUnknown_02024C10
_080201C8: .4byte gBattleMons
_080201CC:
	adds r0, r3, 0x7
	str r0, [r4]
_080201D0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_801FFA8

	thumb_func_start sub_8020004
sub_8020004: @ 80201D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	ldr r0, _08020220
	mov r10, r0
	ldr r0, _08020224
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _08020228
	strb r0, [r1]
	ldr r2, _0802022C
	movs r1, 0x2
	ands r1, r0
	lsls r1, 24
	lsrs r1, 25
	adds r1, r2
	ldrb r1, [r1]
	mov r8, r1
	mov r0, r10
	subs r0, 0x4D
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08020214
	bl _08020B6A
_08020214:
	lsls r0, 2
	ldr r1, _08020230
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020220: .4byte 0x0201605c
_08020224: .4byte gUnknown_02024C10
_08020228: .4byte gUnknown_02024C09
_0802022C: .4byte gUnknown_02024DEA
_08020230: .4byte _08020234
	.align 2, 0
_08020234:
	.4byte _08020250
	.4byte _080202D0
	.4byte _080203EA
	.4byte _08020730
	.4byte _0802081C
	.4byte _08020AE4
	.4byte _08020B40
_08020250:
	ldr r4, _0802027C
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802026C
	ldr r0, _08020280
	ldrh r1, [r0]
	ldr r0, _08020284
	ands r0, r1
	cmp r0, 0
	beq _08020290
_0802026C:
	ldr r0, _08020288
	ldr r1, _0802028C
	adds r0, r1
	movs r1, 0x6
	strb r1, [r0]
	bl _08020B6A
	.align 2, 0
_0802027C: .4byte gUnknown_02024C09
_08020280: .4byte gUnknown_020239F8
_08020284: .4byte 0x00000982
_08020288: .4byte 0x02000000
_0802028C: .4byte 0x0001600f
_08020290:
	ldr r2, _080202BC
	ldr r3, _080202C0
	adds r1, r2, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _080202C4
	adds r2, r0
	ldr r3, _080202C8
	ldr r1, _080202CC
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bl _08020B6A
	.align 2, 0
_080202BC: .4byte 0x02000000
_080202C0: .4byte 0x0001600f
_080202C4: .4byte 0x00016113
_080202C8: .4byte gBitTable
_080202CC: .4byte gUnknown_02024A6A
_080202D0:
	movs r5, 0
	movs r7, 0
	ldr r1, _08020324
	mov r9, r1
_080202D8:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08020328
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0802033E
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0802033E
	ldr r0, _0802032C
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	mov r2, r8
	ands r0, r2
	cmp r0, 0
	beq _0802030C
	adds r5, 0x1
_0802030C:
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08020330
	mov r3, r9
	ldrb r4, [r3]
	b _08020338
	.align 2, 0
_08020324: .4byte 0x02028dbc
_08020328: .4byte gPlayerParty
_0802032C: .4byte gBitTable
_08020330:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
_08020338:
	cmp r4, 0x19
	bne _0802033E
	adds r6, 0x1
_0802033E:
	adds r7, 0x1
	cmp r7, 0x5
	ble _080202D8
	ldr r3, _080203A4
	ldr r2, _080203A8
	ldr r0, _080203AC
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x9]
	adds r1, 0x2A
	ldrb r0, [r1]
	muls r0, r2
	movs r1, 0x7
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r6, 0
	beq _080203B4
	lsrs r4, r0, 17
	adds r0, r4, 0
	adds r1, r5, 0
	bl __divsi3
	mov r1, r10
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0802038A
	movs r0, 0x1
	strh r0, [r1]
_0802038A:
	ldr r5, _080203B0
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _080203CE
	movs r0, 0x1
	strh r0, [r5]
	b _080203CE
	.align 2, 0
_080203A4: .4byte gBaseStats
_080203A8: .4byte gBattleMons
_080203AC: .4byte gUnknown_02024C09
_080203B0: .4byte gUnknown_02024DEE
_080203B4:
	adds r0, r1, 0
	adds r1, r5, 0
	bl __divsi3
	mov r2, r10
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bne _080203CA
	movs r0, 0x1
	strh r0, [r2]
_080203CA:
	ldr r0, _0802041C
	strh r6, [r0]
_080203CE:
	ldr r1, _08020420
	ldr r3, _08020424
	adds r2, r1, r3
	ldrb r0, [r2]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r2]
	ldr r2, _08020428
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0802042C
	adds r1, r3
	mov r0, r8
	strb r0, [r1]
_080203EA:
	ldr r0, _08020430
	ldr r0, [r0]
	cmp r0, 0
	beq _080203F4
	b _08020B6A
_080203F4:
	ldr r0, _08020420
	ldr r1, _08020428
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08020434
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08020440
	ldr r0, _08020438
	ldr r2, _0802043C
	adds r0, r2
	ldrb r4, [r0]
	b _08020448
	.align 2, 0
_0802041C: .4byte gUnknown_02024DEE
_08020420: .4byte 0x02000000
_08020424: .4byte 0x0001600f
_08020428: .4byte 0x00016018
_0802042C: .4byte 0x0001605f
_08020430: .4byte gUnknown_02024A64
_08020434: .4byte gPlayerParty
_08020438: .4byte gSaveBlock1
_0802043C: .4byte 0x00003688
_08020440:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
_08020448:
	ldr r5, _08020468
	cmp r4, 0x19
	beq _08020474
	ldr r3, _0802046C
	adds r1, r5, r3
	ldrb r0, [r1]
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	bne _08020474
	lsrs r0, 1
	strb r0, [r1]
	ldr r0, _08020470
	adds r1, r5, r0
	b _0802049C
	.align 2, 0
_08020468: .4byte 0x02000000
_0802046C: .4byte 0x0001605f
_08020470: .4byte 0x0001600f
_08020474:
	ldr r1, _080204A8
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080204AC
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	bne _080204BC
	ldr r2, _080204B0
	adds r1, r5, r2
	ldrb r0, [r1]
	lsrs r0, 1
	movs r2, 0
	strb r0, [r1]
	ldr r3, _080204B4
	adds r1, r5, r3
_0802049C:
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, _080204B8
	str r2, [r0]
	b _08020B6A
	.align 2, 0
_080204A8: .4byte 0x00016018
_080204AC: .4byte gPlayerParty
_080204B0: .4byte 0x0001605f
_080204B4: .4byte 0x0001600f
_080204B8: .4byte gUnknown_02024BEC
_080204BC:
	ldr r0, _08020520
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080204EA
	ldr r0, _08020524
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _080204EA
	ldr r0, _08020528
	adds r5, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _080204EA
	bl sub_80325B8
	ldr r0, _0802052C
	bl PlayBGM
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_080204EA:
	ldr r5, _08020530
	ldr r1, _08020534
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08020538
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _08020506
	b _080206F2
_08020506:
	ldr r2, _0802053C
	adds r0, r5, r2
	ldrb r0, [r0]
	movs r3, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08020544
	ldr r1, _08020540
	mov r3, r10
	ldrh r0, [r3]
	str r0, [r1]
	mov r8, r1
	b _0802054A
	.align 2, 0
_08020520: .4byte gUnknown_020239F8
_08020524: .4byte gBattleMons
_08020528: .4byte 0x0001601b
_0802052C: .4byte 0x00000161
_08020530: .4byte 0x02000000
_08020534: .4byte 0x00016018
_08020538: .4byte gPlayerParty
_0802053C: .4byte 0x0001605f
_08020540: .4byte gUnknown_02024BEC
_08020544:
	ldr r0, _080205C0
	str r3, [r0]
	mov r8, r0
_0802054A:
	cmp r4, 0x19
	bne _0802055A
	ldr r0, _080205C4
	ldrh r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	adds r0, r1
	str r0, [r2]
_0802055A:
	cmp r4, 0x28
	bne _08020570
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	mov r1, r8
	str r0, [r1]
_08020570:
	ldr r0, _080205C8
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802058C
	ldr r4, _080205C0
	ldr r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
_0802058C:
	ldr r0, _080205CC
	ldr r2, _080205D0
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080205D4
	adds r0, r1
	bl sub_8040AA4
	lsls r0, 24
	cmp r0, 0
	beq _080205D8
	ldr r4, _080205C0
	ldr r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	movs r7, 0xA5
	lsls r7, 1
	mov r8, r4
	b _080205DE
	.align 2, 0
_080205C0: .4byte gUnknown_02024BEC
_080205C4: .4byte gUnknown_02024DEE
_080205C8: .4byte gUnknown_020239F8
_080205CC: .4byte 0x02000000
_080205D0: .4byte 0x00016018
_080205D4: .4byte gPlayerParty
_080205D8:
	ldr r7, _08020610
	ldr r3, _08020614
	mov r8, r3
_080205DE:
	ldr r0, _08020618
	ldrh r0, [r0]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0802065C
	ldr r1, _0802061C
	ldr r0, _08020620
	ldr r3, _08020624
	adds r2, r0, r3
	ldrh r1, [r1, 0x4]
	adds r5, r0, 0
	ldr r4, _08020628
	ldr r3, _0802062C
	ldrb r2, [r2]
	cmp r1, r2
	bne _08020634
	ldrb r1, [r3]
	ldr r0, [r4, 0x8]
	ands r1, r0
	cmp r1, 0
	bne _08020634
	ldr r0, _08020630
	adds r1, r5, r0
	b _08020650
	.align 2, 0
_08020610: .4byte 0x00000149
_08020614: .4byte gUnknown_02024BEC
_08020618: .4byte gUnknown_020239F8
_0802061C: .4byte gUnknown_02024A6A
_08020620: .4byte 0x02000000
_08020624: .4byte 0x00016018
_08020628: .4byte gBitTable
_0802062C: .4byte gUnknown_02024C0C
_08020630: .4byte 0x000160a2
_08020634:
	ldrb r2, [r3]
	ldr r0, [r4]
	ands r2, r0
	cmp r2, 0
	bne _0802064C
	ldr r1, _08020648
	adds r0, r5, r1
	strb r2, [r0]
	b _08020664
	.align 2, 0
_08020648: .4byte 0x000160a2
_0802064C:
	ldr r2, _08020658
	adds r1, r5, r2
_08020650:
	movs r0, 0x2
	strb r0, [r1]
	b _08020664
	.align 2, 0
_08020658: .4byte 0x000160a2
_0802065C:
	ldr r0, _08020704
	ldr r3, _08020708
	adds r0, r3
	strb r1, [r0]
_08020664:
	ldr r1, _0802070C
	movs r3, 0
	movs r2, 0xFD
	strb r2, [r1]
	movs r5, 0x4
	strb r5, [r1, 0x1]
	ldr r4, _08020704
	ldr r0, _08020708
	adds r6, r4, r0
	ldrb r0, [r6]
	strb r0, [r1, 0x2]
	ldr r0, _08020710
	adds r4, r0
	ldrb r0, [r4]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08020714
	strb r2, [r1]
	strb r3, [r1, 0x1]
	strb r7, [r1, 0x2]
	movs r3, 0xFF
	lsls r3, 8
	ands r7, r3
	asrs r0, r7, 8
	strb r0, [r1, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x4]
	ldr r1, _08020718
	strb r2, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0x5
	strb r0, [r1, 0x3]
	mov r0, r8
	ldr r2, [r0]
	strb r2, [r1, 0x4]
	adds r0, r2, 0
	ands r0, r3
	asrs r0, 8
	strb r0, [r1, 0x5]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r2
	asrs r0, 16
	strb r0, [r1, 0x6]
	lsrs r2, 24
	strb r2, [r1, 0x7]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x8]
	ldrb r1, [r6]
	movs r0, 0xD
	bl b_std_message
	ldrb r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802071C
	adds r0, r1
	ldr r3, _08020720
	ldr r1, _08020724
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r1, [r1]
	bl MonGainEVs
_080206F2:
	ldr r1, _08020704
	ldr r3, _08020728
	adds r2, r1, r3
	ldrb r0, [r2]
	lsrs r0, 1
	strb r0, [r2]
	ldr r0, _0802072C
	adds r1, r0
	b _080207EC
	.align 2, 0
_08020704: .4byte 0x02000000
_08020708: .4byte 0x000160a2
_0802070C: .4byte gUnknown_030041C0
_08020710: .4byte 0x00016018
_08020714: .4byte gUnknown_03004290
_08020718: .4byte gUnknown_030042B0
_0802071C: .4byte gPlayerParty
_08020720: .4byte gBattleMons
_08020724: .4byte gUnknown_02024C09
_08020728: .4byte 0x0001605f
_0802072C: .4byte 0x0001600f
_08020730:
	ldr r0, _080207F4
	ldr r2, [r0]
	cmp r2, 0
	beq _0802073A
	b _08020B6A
_0802073A:
	ldr r1, _080207F8
	ldr r4, _080207FC
	ldr r3, _08020800
	adds r3, r4
	mov r8, r3
	ldrb r0, [r3]
	lsls r0, 9
	adds r0, r1
	strb r2, [r0]
	ldr r0, _08020804
	adds r7, r4, r0
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08020808
	adds r0, r5
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080207E6
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _080207E6
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3A
	bl GetMonData
	ldr r1, _0802080C
	adds r4, r1
	strh r0, [r4]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3B
	bl GetMonData
	strh r0, [r4, 0x2]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3C
	bl GetMonData
	strh r0, [r4, 0x4]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3D
	bl GetMonData
	strh r0, [r4, 0x6]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3E
	bl GetMonData
	strh r0, [r4, 0x8]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x3F
	bl GetMonData
	strh r0, [r4, 0xA]
	ldr r4, _08020810
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r1, [r7]
	ldr r0, _08020814
	ldrh r2, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x19_a_bb
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080207E6:
	ldr r1, _080207FC
	ldr r3, _08020818
	adds r1, r3
_080207EC:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08020B6A
	.align 2, 0
_080207F4: .4byte gUnknown_02024A64
_080207F8: .4byte gUnknown_02024260
_080207FC: .4byte 0x02000000
_08020800: .4byte 0x000160a2
_08020804: .4byte 0x00016018
_08020808: .4byte gPlayerParty
_0802080C: .4byte 0x00017180
_08020810: .4byte gUnknown_02024A60
_08020814: .4byte gUnknown_02024BEC
_08020818: .4byte 0x0001600f
_0802081C:
	ldr r0, _08020A80
	ldr r0, [r0]
	cmp r0, 0
	beq _08020826
	b _08020B6A
_08020826:
	ldr r1, _08020A84
	ldr r4, _08020A88
	ldr r2, _08020A8C
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _08020A90
	ldrb r3, [r1]
	lsls r1, r3, 9
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x21
	beq _08020842
	b _08020AC4
_08020842:
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0xB
	beq _0802084E
	b _08020AC4
_0802084E:
	ldr r0, _08020A94
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0802087C
	ldr r1, _08020A98
	lsls r0, r3, 1
	adds r2, r0, r1
	ldr r0, _08020A9C
	adds r1, r4, r0
	ldrh r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802087C
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08020AA0
	adds r0, r1
	adds r1, r3, 0
	bl sub_80324F8
_0802087C:
	ldr r1, _08020AA4
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r5, _08020A84
	ldrb r0, [r5]
	strb r0, [r1, 0x2]
	ldr r0, _08020A88
	ldr r3, _08020A9C
	adds r6, r0, r3
	ldrb r0, [r6]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r4, _08020AA8
	strb r2, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	movs r0, 0x3
	strb r0, [r4, 0x3]
	ldrb r0, [r6]
	movs r1, 0x64
	mov r8, r1
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldr r7, _08020AA0
	adds r0, r7
	movs r1, 0x38
	bl GetMonData
	strb r0, [r4, 0x4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x5]
	bl b_movescr_stack_push_cursor
	ldr r2, _08020AAC
	ldr r1, _08020AB0
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08020AB4
	ldr r0, _08020AB8
	str r0, [r1]
	ldr r4, _08020ABC
	ldr r2, _08020A90
	ldrb r1, [r5]
	lsls r1, 9
	adds r0, r2, 0x2
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	str r3, [r4]
	ldrb r0, [r6]
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7
	movs r1, 0
	bl AdjustFriendship
	ldr r0, _08020A98
	ldrb r1, [r6]
	ldrh r0, [r0]
	cmp r0, r1
	bne _080209C0
	ldr r4, _08020AC0
	ldrh r0, [r4, 0x28]
	cmp r0, 0
	beq _080209C0
	mov r0, r8
	muls r0, r1
	adds r0, r7
	movs r1, 0x38
	bl GetMonData
	adds r1, r4, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x28]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r4, 0x2C]
	ldrb r0, [r6]
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7
	movs r1, 0x3B
	bl GetMonData
	strh r0, [r4, 0x2]
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0x3C
	bl GetMonData
	strh r0, [r4, 0x4]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3D
	bl GetMonData
	strh r0, [r4, 0x6]
	ldrb r0, [r6]
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7
	movs r1, 0x3D
	bl GetMonData
	strh r0, [r4, 0x6]
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0x3E
	bl GetMonData
	strh r0, [r4, 0x8]
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0x3F
	bl GetMonData
	strh r0, [r4, 0xA]
_080209C0:
	ldr r0, _08020A98
	ldr r1, _08020A88
	ldr r3, _08020A9C
	adds r7, r1, r3
	ldrb r2, [r7]
	ldrh r0, [r0, 0x4]
	cmp r0, r2
	bne _08020ACA
	ldr r6, _08020AC0
	movs r0, 0xD8
	adds r0, r6
	mov r8, r0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08020ACA
	ldr r0, _08020A94
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08020ACA
	movs r5, 0x64
	adds r0, r2, 0
	muls r0, r5
	ldr r4, _08020AA0
	adds r0, r4
	movs r1, 0x38
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xDA
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xDC
	strh r0, [r1]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3B
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xB2
	strh r0, [r1]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3C
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xB4
	strh r0, [r1]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3D
	bl GetMonData
	movs r2, 0xB6
	adds r2, r6
	mov r8, r2
	strh r0, [r2]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3D
	bl GetMonData
	mov r3, r8
	strh r0, [r3]
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r4
	movs r1, 0x3E
	bl GetMonData
	adds r1, r6, 0
	adds r1, 0xB8
	strh r0, [r1]
	b _08020ACA
	.align 2, 0
_08020A80: .4byte gUnknown_02024A64
_08020A84: .4byte gUnknown_02024A60
_08020A88: .4byte 0x02000000
_08020A8C: .4byte 0x000160a2
_08020A90: .4byte gUnknown_02024260
_08020A94: .4byte gUnknown_020239F8
_08020A98: .4byte gUnknown_02024A6A
_08020A9C: .4byte 0x00016018
_08020AA0: .4byte gPlayerParty
_08020AA4: .4byte gUnknown_030041C0
_08020AA8: .4byte gUnknown_03004290
_08020AAC: .4byte gUnknown_03004324
_08020AB0: .4byte gBitTable
_08020AB4: .4byte gUnknown_02024C10
_08020AB8: .4byte gUnknown_081D8EF3
_08020ABC: .4byte gUnknown_02024BEC
_08020AC0: .4byte gBattleMons
_08020AC4:
	ldr r1, _08020AD8
	movs r0, 0
	str r0, [r1]
_08020ACA:
	ldr r0, _08020ADC
	ldr r1, _08020AE0
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	b _08020B6A
	.align 2, 0
_08020AD8: .4byte gUnknown_02024BEC
_08020ADC: .4byte 0x02000000
_08020AE0: .4byte 0x0001600f
_08020AE4:
	ldr r0, _08020AF8
	ldr r0, [r0]
	cmp r0, 0
	beq _08020B04
	ldr r0, _08020AFC
	ldr r2, _08020B00
	adds r0, r2
	movs r1, 0x3
	strb r1, [r0]
	b _08020B6A
	.align 2, 0
_08020AF8: .4byte gUnknown_02024BEC
_08020AFC: .4byte 0x02000000
_08020B00: .4byte 0x0001600f
_08020B04:
	ldr r2, _08020B24
	ldr r3, _08020B28
	adds r1, r2, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08020B30
	ldr r0, _08020B2C
	adds r1, r2, r0
	movs r0, 0x2
	strb r0, [r1]
	b _08020B6A
	.align 2, 0
_08020B24: .4byte 0x02000000
_08020B28: .4byte 0x00016018
_08020B2C: .4byte 0x0001600f
_08020B30:
	ldr r3, _08020B3C
	adds r1, r2, r3
	movs r0, 0x6
	strb r0, [r1]
	b _08020B6A
	.align 2, 0
_08020B3C: .4byte 0x0001600f
_08020B40:
	ldr r0, _08020B78
	ldr r5, [r0]
	cmp r5, 0
	bne _08020B6A
	ldr r4, _08020B7C
	ldr r2, _08020B80
	ldrb r0, [r2]
	movs r1, 0x58
	muls r0, r1
	adds r0, r4
	movs r3, 0
	strh r5, [r0, 0x2E]
	ldrb r0, [r2]
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	strb r3, [r0]
	ldr r1, _08020B84
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08020B6A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020B78: .4byte gUnknown_02024A64
_08020B7C: .4byte gBattleMons
_08020B80: .4byte gUnknown_02024C09
_08020B84: .4byte gUnknown_02024C10
	thumb_func_end sub_8020004

	thumb_func_start sub_80209B4
sub_80209B4: @ 8020B88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r0, _08020CC4
	ldr r0, [r0]
	cmp r0, 0
	beq _08020B9A
	b _08020D1A
_08020B9A:
	movs r5, 0
_08020B9C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08020CC8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08020BCC
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08020BCC
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
_08020BCC:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08020B9C
	cmp r6, 0
	bne _08020BE0
	ldr r0, _08020CCC
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_08020BE0:
	movs r6, 0
	movs r5, 0
_08020BE4:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08020CD0
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08020C14
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08020C14
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
_08020C14:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08020BE4
	ldr r2, _08020CCC
	cmp r6, 0
	bne _08020C28
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_08020C28:
	ldrb r0, [r2]
	cmp r0, 0
	bne _08020D12
	ldr r2, _08020CD4
	ldrh r1, [r2]
	movs r0, 0x2
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _08020D12
	movs r2, 0
	movs r5, 0
	ldr r0, _08020CD8
	ldrb r3, [r0]
	mov r12, r0
	ldr r7, _08020CDC
	cmp r2, r3
	bge _08020C74
	ldr r0, _08020CE0
	movs r1, 0x80
	lsls r1, 21
	ldr r6, [r0]
	adds r4, r3, 0
	ldr r3, _08020CE4
_08020C58:
	adds r0, r1, 0
	lsls r0, r5
	ands r0, r6
	cmp r0, 0
	beq _08020C6C
	ldrb r0, [r3]
	lsls r0, 25
	cmp r0, 0
	blt _08020C6C
	adds r2, 0x1
_08020C6C:
	adds r3, 0x28
	adds r5, 0x2
	cmp r5, r4
	blt _08020C58
_08020C74:
	movs r4, 0
	movs r5, 0x1
	mov r0, r12
	ldrb r3, [r0]
	cmp r5, r3
	bge _08020CAE
	ldr r0, _08020CE0
	movs r1, 0x80
	lsls r1, 21
	mov r12, r1
	ldr r1, [r0]
	ldr r0, _08020CE4
	adds r6, r3, 0
	adds r3, r0, 0
	adds r3, 0x14
_08020C92:
	mov r0, r12
	lsls r0, r5
	ands r0, r1
	cmp r0, 0
	beq _08020CA6
	ldrb r0, [r3]
	lsls r0, 25
	cmp r0, 0
	blt _08020CA6
	adds r4, 0x1
_08020CA6:
	adds r3, 0x28
	adds r5, 0x2
	cmp r5, r6
	blt _08020C92
_08020CAE:
	mov r0, r8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08020CE8
	adds r0, r4, r2
	cmp r0, 0x1
	bgt _08020CF0
	b _08020D0A
	.align 2, 0
_08020CC4: .4byte gUnknown_02024A64
_08020CC8: .4byte gPlayerParty
_08020CCC: .4byte gUnknown_02024D26
_08020CD0: .4byte gEnemyParty
_08020CD4: .4byte gUnknown_020239F8
_08020CD8: .4byte gUnknown_02024A68
_08020CDC: .4byte gUnknown_02024C10
_08020CE0: .4byte gUnknown_02024C6C
_08020CE4: .4byte gUnknown_02024D68
_08020CE8:
	cmp r4, 0
	beq _08020D0A
	cmp r2, 0
	beq _08020D0A
_08020CF0:
	ldr r2, [r7]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	str r1, [r7]
	b _08020D1A
_08020D0A:
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	b _08020D1A
_08020D12:
	ldr r1, _08020D24
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08020D1A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020D24: .4byte gUnknown_02024C10
	thumb_func_end sub_80209B4

	thumb_func_start sub_8020B54
sub_8020B54: @ 8020D28
	ldr r1, _08020D54
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08020D58
	ldr r1, _08020D5C
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08020D60
	strb r1, [r0]
	ldr r0, _08020D64
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x6]
	ldr r2, _08020D68
	ldr r0, [r2]
	subs r1, 0x42
	ands r0, r1
	ldr r1, _08020D6C
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_08020D54: .4byte gUnknown_02024C68
_08020D58: .4byte 0x02000000
_08020D5C: .4byte 0x0001601f
_08020D60: .4byte gCritMultiplier
_08020D64: .4byte gUnknown_02024D1E
_08020D68: .4byte gUnknown_02024C6C
_08020D6C: .4byte 0xffffbfff
	thumb_func_end sub_8020B54

	thumb_func_start atk25_resetflags
atk25_resetflags: @ 8020D70
	push {lr}
	bl sub_8020B54
	ldr r1, _08020D84
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08020D84: .4byte gUnknown_02024C10
	thumb_func_end atk25_resetflags

	thumb_func_start sub_8020BB4
sub_8020BB4: @ 8020D88
	ldr r3, _08020D98
	ldr r2, _08020D9C
	ldr r0, [r2]
	ldrb r1, [r0, 0x1]
	strb r1, [r3]
	adds r0, 0x2
	str r0, [r2]
	bx lr
	.align 2, 0
_08020D98: .4byte gUnknown_02024C0E
_08020D9C: .4byte gUnknown_02024C10
	thumb_func_end sub_8020BB4

	thumb_func_start atk27_cmd27
atk27_cmd27: @ 8020DA0
	push {lr}
	ldr r1, _08020DBC
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _08020DC4
	ldr r1, _08020DC0
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08020DDE
	.align 2, 0
_08020DBC: .4byte gUnknown_02024C0E
_08020DC0: .4byte gUnknown_02024C10
_08020DC4:
	ldr r3, _08020DE4
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
_08020DDE:
	pop {r0}
	bx r0
	.align 2, 0
_08020DE4: .4byte gUnknown_02024C10
	thumb_func_end atk27_cmd27

	thumb_func_start sub_8020C14
sub_8020C14: @ 8020DE8
	ldr r3, _08020E04
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08020E04: .4byte gUnknown_02024C10
	thumb_func_end sub_8020C14

	thumb_func_start atk29_jumpifbyte
atk29_jumpifbyte: @ 8020E08
	push {r4-r6,lr}
	ldr r3, _08020E4C
	ldr r1, [r3]
	ldrb r6, [r1, 0x1]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x6]
	ldrb r2, [r1, 0x7]
	ldrb r0, [r1, 0x8]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x9]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 24
	adds r2, r0
	adds r1, 0xB
	str r1, [r3]
	cmp r6, 0x5
	bhi _08020EA0
	lsls r0, r6, 2
	ldr r1, _08020E50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020E4C: .4byte gUnknown_02024C10
_08020E50: .4byte _08020E54
	.align 2, 0
_08020E54:
	.4byte _08020E6C
	.4byte _08020E74
	.4byte _08020E7C
	.4byte _08020E84
	.4byte _08020E8C
	.4byte _08020E96
_08020E6C:
	ldrb r0, [r5]
	cmp r0, r4
	bne _08020EA0
	b _08020E9E
_08020E74:
	ldrb r0, [r5]
	cmp r0, r4
	beq _08020EA0
	b _08020E9E
_08020E7C:
	ldrb r0, [r5]
	cmp r0, r4
	bls _08020EA0
	b _08020E9E
_08020E84:
	ldrb r0, [r5]
	cmp r0, r4
	bcs _08020EA0
	b _08020E9E
_08020E8C:
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, 0
	beq _08020EA0
	b _08020E9E
_08020E96:
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, 0
	bne _08020EA0
_08020E9E:
	str r2, [r3]
_08020EA0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk29_jumpifbyte

	thumb_func_start sub_8020CD4
sub_8020CD4: @ 8020EA8
	push {r4-r6,lr}
	ldr r3, _08020EF4
	ldr r1, [r3]
	ldrb r6, [r1, 0x1]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x6]
	ldrb r0, [r1, 0x7]
	lsls r0, 8
	orrs r4, r0
	ldrb r2, [r1, 0x8]
	ldrb r0, [r1, 0x9]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 24
	adds r2, r0
	adds r1, 0xC
	str r1, [r3]
	cmp r6, 0x5
	bhi _08020F48
	lsls r0, r6, 2
	ldr r1, _08020EF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020EF4: .4byte gUnknown_02024C10
_08020EF8: .4byte _08020EFC
	.align 2, 0
_08020EFC:
	.4byte _08020F14
	.4byte _08020F1C
	.4byte _08020F24
	.4byte _08020F2C
	.4byte _08020F34
	.4byte _08020F3E
_08020F14:
	ldrh r0, [r5]
	cmp r0, r4
	bne _08020F48
	b _08020F46
_08020F1C:
	ldrh r0, [r5]
	cmp r0, r4
	beq _08020F48
	b _08020F46
_08020F24:
	ldrh r0, [r5]
	cmp r0, r4
	bls _08020F48
	b _08020F46
_08020F2C:
	ldrh r0, [r5]
	cmp r0, r4
	bcs _08020F48
	b _08020F46
_08020F34:
	ldrh r0, [r5]
	ands r4, r0
	cmp r4, 0
	beq _08020F48
	b _08020F46
_08020F3E:
	ldrh r0, [r5]
	ands r4, r0
	cmp r4, 0
	bne _08020F48
_08020F46:
	str r2, [r3]
_08020F48:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8020CD4

	thumb_func_start sub_8020D7C
sub_8020D7C: @ 8020F50
	push {r4-r6,lr}
	ldr r3, _08020FA8
	ldr r1, [r3]
	ldrb r6, [r1, 0x1]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x6]
	ldrb r0, [r1, 0x7]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r1, 0x9]
	lsls r0, 24
	orrs r4, r0
	ldrb r2, [r1, 0xA]
	ldrb r0, [r1, 0xB]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xD]
	lsls r0, 24
	adds r2, r0
	adds r1, 0xE
	str r1, [r3]
	cmp r6, 0x5
	bhi _08020FFC
	lsls r0, r6, 2
	ldr r1, _08020FAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020FA8: .4byte gUnknown_02024C10
_08020FAC: .4byte _08020FB0
	.align 2, 0
_08020FB0:
	.4byte _08020FC8
	.4byte _08020FD0
	.4byte _08020FD8
	.4byte _08020FE0
	.4byte _08020FE8
	.4byte _08020FF2
_08020FC8:
	ldr r0, [r5]
	cmp r0, r4
	bne _08020FFC
	b _08020FFA
_08020FD0:
	ldr r0, [r5]
	cmp r0, r4
	beq _08020FFC
	b _08020FFA
_08020FD8:
	ldr r0, [r5]
	cmp r0, r4
	bls _08020FFC
	b _08020FFA
_08020FE0:
	ldr r0, [r5]
	cmp r0, r4
	bcs _08020FFC
	b _08020FFA
_08020FE8:
	ldr r0, [r5]
	ands r0, r4
	cmp r0, 0
	beq _08020FFC
	b _08020FFA
_08020FF2:
	ldr r0, [r5]
	ands r0, r4
	cmp r0, 0
	bne _08020FFC
_08020FFA:
	str r2, [r3]
_08020FFC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8020D7C

	thumb_func_start sub_8020E30
sub_8020E30: @ 8021004
	push {r4-r7,lr}
	ldr r2, _0802105C
	ldr r3, [r2]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 24
	adds r5, r1, r0
	ldrb r1, [r3, 0x5]
	ldrb r0, [r3, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x8]
	lsls r0, 24
	adds r4, r1, r0
	ldrb r6, [r3, 0x9]
	ldrb r1, [r3, 0xA]
	ldrb r0, [r3, 0xB]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0xC]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0xD]
	lsls r0, 24
	adds r1, r0
	mov r12, r1
	movs r1, 0
	cmp r1, r6
	bcs _0802107C
	ldrb r0, [r5]
	ldrb r7, [r4]
	cmp r0, r7
	beq _08021060
	adds r0, r3, 0
	b _08021078
	.align 2, 0
_0802105C: .4byte gUnknown_02024C10
_08021060:
	adds r5, 0x1
	adds r4, 0x1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcs _0802107C
	ldrb r0, [r5]
	ldrb r3, [r4]
	cmp r0, r3
	beq _08021060
	ldr r0, [r2]
_08021078:
	adds r0, 0xE
	str r0, [r2]
_0802107C:
	cmp r1, r6
	bne _08021084
	mov r7, r12
	str r7, [r2]
_08021084:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8020E30

	thumb_func_start sub_8020EB8
sub_8020EB8: @ 802108C
	push {r4-r7,lr}
	movs r7, 0
	ldr r3, _08021100
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r2, [r1, 0x5]
	ldrb r0, [r1, 0x6]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x7]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 24
	adds r4, r2, r0
	ldrb r6, [r1, 0x9]
	ldrb r2, [r1, 0xA]
	ldrb r0, [r1, 0xB]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xD]
	lsls r0, 24
	adds r2, r0
	mov r12, r2
	movs r1, 0
	cmp r7, r6
	bcs _080210F6
_080210DA:
	ldrb r0, [r5]
	ldrb r2, [r4]
	cmp r0, r2
	bne _080210E8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080210E8:
	adds r5, 0x1
	adds r4, 0x1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _080210DA
_080210F6:
	cmp r7, r6
	beq _08021104
	mov r0, r12
	b _08021108
	.align 2, 0
_08021100: .4byte gUnknown_02024C10
_08021104:
	ldr r0, [r3]
	adds r0, 0xE
_08021108:
	str r0, [r3]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8020EB8

	thumb_func_start sub_8020F3C
sub_8020F3C: @ 8021110
	ldr r3, _08021134
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r2, 0x5]
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_08021134: .4byte gUnknown_02024C10
	thumb_func_end sub_8020F3C

	thumb_func_start sub_8020F64
sub_8020F64: @ 8021138
	ldr r3, _08021160
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r2, 0x5]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_08021160: .4byte gUnknown_02024C10
	thumb_func_end sub_8020F64

	thumb_func_start sub_8020F90
sub_8020F90: @ 8021164
	ldr r3, _0802118C
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r1]
	ldrb r2, [r2, 0x5]
	subs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_0802118C: .4byte gUnknown_02024C10
	thumb_func_end sub_8020F90

	thumb_func_start atk31_copyarray
atk31_copyarray: @ 8021190
	push {r4-r6,lr}
	ldr r3, _080211E0
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	adds r6, r2, r0
	ldrb r2, [r1, 0x5]
	ldrb r0, [r1, 0x6]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x7]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0x9]
	movs r2, 0
	cmp r2, r4
	bge _080211D4
_080211C6:
	adds r0, r6, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r4
	blt _080211C6
_080211D4:
	ldr r0, [r3]
	adds r0, 0xA
	str r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080211E0: .4byte gUnknown_02024C10
	thumb_func_end atk31_copyarray

	thumb_func_start atk32_memcpy_with_offset
atk32_memcpy_with_offset: @ 80211E4
	push {r4-r7,lr}
	ldr r3, _0802124C
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	adds r7, r2, r0
	ldrb r2, [r1, 0x5]
	ldrb r0, [r1, 0x6]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0x7]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0x8]
	lsls r0, 24
	adds r6, r2, r0
	ldrb r2, [r1, 0x9]
	ldrb r0, [r1, 0xA]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r1, 0xC]
	lsls r0, 24
	adds r5, r2, r0
	ldrb r4, [r1, 0xD]
	movs r2, 0
	cmp r2, r4
	bge _08021240
_0802122E:
	adds r0, r7, r2
	ldrb r1, [r5]
	adds r1, r2, r1
	adds r1, r6, r1
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r4
	blt _0802122E
_08021240:
	ldr r0, [r3]
	adds r0, 0xE
	str r0, [r3]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802124C: .4byte gUnknown_02024C10
	thumb_func_end atk32_memcpy_with_offset

	thumb_func_start sub_802107C
sub_802107C: @ 8021250
	ldr r3, _08021278
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r0, [r1]
	ldrb r2, [r2, 0x5]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_08021278: .4byte gUnknown_02024C10
	thumb_func_end sub_802107C

	thumb_func_start atk34_orhalfword
atk34_orhalfword: @ 802127C
	push {r4,lr}
	ldr r4, _080212B0
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 24
	adds r2, r0
	ldrb r1, [r3, 0x5]
	ldrb r0, [r3, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080212B0: .4byte gUnknown_02024C10
	thumb_func_end atk34_orhalfword

	thumb_func_start atk35_orword
atk35_orword: @ 80212B4
	push {r4,lr}
	ldr r4, _080212F4
	ldr r2, [r4]
	ldrb r3, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r3, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r3, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r3, r0
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	adds r1, r0
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldr r0, [r4]
	adds r0, 0x9
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080212F4: .4byte gUnknown_02024C10
	thumb_func_end atk35_orword

	thumb_func_start sub_8021124
sub_8021124: @ 80212F8
	ldr r3, _08021320
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r2, [r2, 0x5]
	ldrb r0, [r1]
	bics r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x6
	str r0, [r3]
	bx lr
	.align 2, 0
_08021320: .4byte gUnknown_02024C10
	thumb_func_end sub_8021124

	thumb_func_start atk37_bichalfword
atk37_bichalfword: @ 8021324
	push {r4,lr}
	ldr r4, _08021358
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 24
	adds r1, r0
	ldrb r2, [r3, 0x5]
	ldrb r0, [r3, 0x6]
	lsls r0, 8
	orrs r2, r0
	ldrh r0, [r1]
	bics r0, r2
	strh r0, [r1]
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021358: .4byte gUnknown_02024C10
	thumb_func_end atk37_bichalfword

	thumb_func_start atk38_bicword
atk38_bicword: @ 802135C
	push {r4,lr}
	ldr r4, _0802139C
	ldr r2, [r4]
	ldrb r3, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	adds r3, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	adds r3, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	adds r3, r0
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	adds r1, r0
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	ldr r0, [r4]
	adds r0, 0x9
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802139C: .4byte gUnknown_02024C10
	thumb_func_end atk38_bicword

	thumb_func_start atk39_pause
atk39_pause: @ 80213A0
	push {r4,r5,lr}
	ldr r0, _080213D4
	ldr r4, [r0]
	cmp r4, 0
	bne _080213CC
	ldr r5, _080213D8
	ldr r2, [r5]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r3, _080213DC
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bcc _080213CC
	strh r4, [r3]
	adds r0, r2, 0x3
	str r0, [r5]
_080213CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080213D4: .4byte gUnknown_02024A64
_080213D8: .4byte gUnknown_02024C10
_080213DC: .4byte gUnknown_02024D18
	thumb_func_end atk39_pause

	thumb_func_start sub_802120C
sub_802120C: @ 80213E0
	push {lr}
	ldr r0, _080213F8
	ldr r0, [r0]
	cmp r0, 0
	bne _080213F2
	ldr r1, _080213FC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_080213F2:
	pop {r0}
	bx r0
	.align 2, 0
_080213F8: .4byte gUnknown_02024A64
_080213FC: .4byte gUnknown_02024C10
	thumb_func_end sub_802120C

	thumb_func_start atk3B_8022C68
atk3B_8022C68: @ 8021400
	push {lr}
	ldr r0, _08021414
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08021420
	ldr r0, _08021418
	ldr r1, _0802141C
	b _08021424
	.align 2, 0
_08021414: .4byte gUnknown_02024C10
_08021418: .4byte gUnknown_02024A60
_0802141C: .4byte gUnknown_02024C08
_08021420:
	ldr r0, _08021448
	ldr r1, _0802144C
_08021424:
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r0, _08021450
	ldrh r1, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x18_0_aa_health_bar_update
	ldr r0, _08021448
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08021454
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08021448: .4byte gUnknown_02024A60
_0802144C: .4byte gUnknown_02024C07
_08021450: .4byte gUnknown_02024BEC
_08021454: .4byte gUnknown_02024C10
	thumb_func_end atk3B_8022C68

	thumb_func_start atk3C_return
atk3C_return: @ 8021458
	push {lr}
	bl b_movescr_stack_pop_cursor
	pop {r0}
	bx r0
	thumb_func_end atk3C_return

	thumb_func_start sub_8021290
sub_8021290: @ 8021464
	ldr r0, _08021478
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0802147C
	strb r1, [r0]
	ldr r1, _08021480
	movs r0, 0xB
	strb r0, [r1]
	bx lr
	.align 2, 0
_08021478: .4byte gUnknown_02024C68
_0802147C: .4byte gUnknown_02024A60
_08021480: .4byte gUnknown_02024A7F
	thumb_func_end sub_8021290

	thumb_func_start sub_80212B0
sub_80212B0: @ 8021484
	ldr r1, _08021494
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08021498
	movs r0, 0xB
	strb r0, [r1]
	bx lr
	.align 2, 0
_08021494: .4byte gUnknown_02024A60
_08021498: .4byte gUnknown_02024A7F
	thumb_func_end sub_80212B0

	thumb_func_start atk3F_end3
atk3F_end3: @ 802149C
	push {lr}
	bl b_movescr_stack_pop_cursor
	ldr r2, _080214C4
	adds r1, r2, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _080214B2
	subs r0, 0x1
	strb r0, [r1]
_080214B2:
	ldr r0, _080214C8
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080214C4: .4byte 0x02017140
_080214C8: .4byte gUnknown_030042D4
	thumb_func_end atk3F_end3

	thumb_func_start atk41_call
atk41_call: @ 80214CC
	push {r4,lr}
	ldr r4, _080214F8
	ldr r0, [r4]
	adds r0, 0x5
	bl b_movescr_stack_push
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
_080214F8: .4byte gUnknown_02024C10
	thumb_func_end atk41_call

	thumb_func_start atk42_jumpiftype2
atk42_jumpiftype2: @ 80214FC
	push {r4,lr}
	ldr r4, _08021544
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldr r2, _08021548
	movs r1, 0x58
	muls r0, r1
	adds r0, r2
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r2, [r3, 0x2]
	ldrb r1, [r1]
	cmp r2, r1
	beq _0802152A
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r2, r0
	bne _0802154C
_0802152A:
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08021550
	.align 2, 0
_08021544: .4byte gUnknown_02024C10
_08021548: .4byte gBattleMons
_0802154C:
	adds r0, r3, 0x7
	str r0, [r4]
_08021550:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atk42_jumpiftype2

	thumb_func_start sub_8021384
sub_8021384: @ 8021558
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08021590
	ldr r0, [r4]
	ldrb r2, [r0, 0x1]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08021594
	ldr r2, [r4]
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
	str r1, [r4]
	b _0802159A
	.align 2, 0
_08021590: .4byte gUnknown_02024C10
_08021594:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_0802159A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8021384

	thumb_func_start sub_80213D0
sub_80213D0: @ 80215A4
	ldr r1, _080215B8
	ldr r0, _080215BC
	ldrb r0, [r0]
	ldr r2, _080215C0
	adds r0, r2
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_080215B8: .4byte 0x02000000
_080215BC: .4byte gUnknown_02024C07
_080215C0: .4byte 0x00016060
	thumb_func_end sub_80213D0

	thumb_func_start atk46_cmd46
atk46_cmd46: @ 80215C4
	push {r4-r6,lr}
	ldr r5, _08021618
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r6, _0802161C
	strb r0, [r6]
	ldr r2, [r5]
	ldrb r1, [r2, 0x3]
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
	adds r3, r1, r0
	ldrb r4, [r2, 0x2]
	adds r0, r4, 0
	cmp r0, 0x1
	beq _080215FA
	cmp r0, 0x11
	beq _080215FA
	cmp r0, 0x2
	bne _08021620
_080215FA:
	ldr r4, _08021618
	ldr r0, [r4]
	ldrb r1, [r0, 0x2]
	ldrh r2, [r3]
	movs r0, 0
	bl dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
	ldr r0, _0802161C
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	b _08021682
	.align 2, 0
_08021618: .4byte gUnknown_02024C10
_0802161C: .4byte gUnknown_02024A60
_08021620:
	ldr r0, _08021638
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08021640
	adds r0, r2, 0x7
	bl b_movescr_stack_push
	ldr r0, _0802163C
	b _08021680
	.align 2, 0
_08021638: .4byte gUnknown_02024C6C
_0802163C: .4byte gUnknown_081D8EEF
_08021640:
	adds r0, r4, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _0802166C
	ldr r1, _08021664
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08021668
	ands r0, r1
	cmp r0, 0
	beq _0802166C
	adds r0, r2, 0x7
	b _08021680
	.align 2, 0
_08021664: .4byte gUnknown_02024C98
_08021668: .4byte 0x000400c0
_0802166C:
	ldrb r1, [r2, 0x2]
	ldrh r2, [r3]
	movs r0, 0
	bl dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
	ldrb r0, [r6]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x7
_08021680:
	str r0, [r5]
_08021682:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end atk46_cmd46

	thumb_func_start sub_80214B4
sub_80214B4: @ 8021688
	push {r4-r7,lr}
	ldr r6, _080216F0
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r7, _080216F4
	strb r0, [r7]
	ldr r2, [r6]
	ldrb r1, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	adds r3, r1, r0
	ldrb r1, [r2, 0x6]
	ldrb r0, [r2, 0x7]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x9]
	lsls r0, 24
	adds r4, r1, r0
	ldrb r5, [r3]
	adds r0, r5, 0
	cmp r0, 0x1
	beq _080216D2
	cmp r0, 0x11
	beq _080216D2
	cmp r0, 0x2
	bne _080216F8
_080216D2:
	ldrb r1, [r3]
	ldrh r2, [r4]
	movs r0, 0
	bl dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
	ldr r0, _080216F4
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080216F0
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
	b _0802174E
	.align 2, 0
_080216F0: .4byte gUnknown_02024C10
_080216F4: .4byte gUnknown_02024A60
_080216F8:
	ldr r0, _08021708
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0802170C
	adds r0, r2, 0
	b _0802174A
	.align 2, 0
_08021708: .4byte gUnknown_02024C6C
_0802170C:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08021738
	ldr r1, _08021730
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08021734
	ands r0, r1
	cmp r0, 0
	beq _08021738
	adds r0, r2, 0
	b _0802174A
	.align 2, 0
_08021730: .4byte gUnknown_02024C98
_08021734: .4byte 0x000400c0
_08021738:
	ldrb r1, [r3]
	ldrh r2, [r4]
	movs r0, 0
	bl dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
	ldrb r0, [r7]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r6]
_0802174A:
	adds r0, 0xA
	str r0, [r6]
_0802174E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80214B4

	thumb_func_start atk47
atk47: @ 8021754
	push {r4,lr}
	movs r3, 0
	ldr r0, _08021774
	ldr r2, _08021778
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r2, 0xF0
	ands r2, r1
	adds r4, r0, 0
	cmp r2, 0x20
	beq _0802178A
	cmp r2, 0x20
	bgt _0802177C
	cmp r2, 0x10
	beq _08021786
	b _08021794
	.align 2, 0
_08021774: .4byte 0x02000000
_08021778: .4byte 0x0001601e
_0802177C:
	cmp r2, 0x90
	beq _0802178E
	cmp r2, 0xA0
	beq _08021792
	b _08021794
_08021786:
	movs r3, 0xF
	b _08021794
_0802178A:
	movs r3, 0x27
	b _08021794
_0802178E:
	movs r3, 0x16
	b _08021794
_08021792:
	movs r3, 0x2E
_08021794:
	ldr r1, _080217C0
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, 0xF
	ands r0, r1
	adds r0, r3, r0
	subs r0, 0x1
	ldr r2, _080217C4
	adds r1, r4, r2
	movs r2, 0
	strb r0, [r1]
	ldr r1, _080217C8
	adds r0, r4, r1
	strb r2, [r0]
	ldr r1, _080217CC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080217C0: .4byte 0x0001601e
_080217C4: .4byte 0x000160a4
_080217C8: .4byte 0x000160a5
_080217CC: .4byte gUnknown_02024C10
	thumb_func_end atk47

	thumb_func_start atk48_playstatchangeanimation
atk48_playstatchangeanimation: @ 80217D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r7, 0
	movs r0, 0
	mov r8, r0
	movs r3, 0
	ldr r5, _08021844
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	str r3, [sp]
	bl sub_8015150
	ldr r2, _08021848
	strb r0, [r2]
	ldr r0, [r5]
	ldrb r4, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	movs r0, 0x1
	ands r0, r1
	ldr r3, [sp]
	cmp r0, 0
	beq _080218E4
	movs r0, 0x2
	ands r0, r1
	movs r1, 0x15
	cmp r0, 0
	beq _08021810
	movs r1, 0x2D
_08021810:
	cmp r4, 0
	beq _080218B8
	movs r0, 0x1
	mov r10, r0
	ldr r0, _0802184C
	mov r9, r0
	lsls r5, r1, 16
_0802181E:
	adds r0, r4, 0
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	beq _080218AA
	ldr r0, _08021844
	ldr r0, [r0]
	ldrb r1, [r0, 0x3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08021850
	ldr r0, _08021848
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7, r0
	b _08021898
	.align 2, 0
_08021844: .4byte gUnknown_02024C10
_08021848: .4byte gUnknown_02024A60
_0802184C: .4byte gUnknown_02024A98
_08021850:
	ldr r6, _080218D4
	ldrb r0, [r6]
	str r3, [sp]
	bl battle_get_per_side_status
	mov r1, r10
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080218D8
	adds r0, r1
	ldrb r0, [r0, 0x2]
	ldr r3, [sp]
	cmp r0, 0
	bne _080218AA
	ldr r0, _080218DC
	ldrb r2, [r6]
	movs r1, 0x58
	muls r2, r1
	adds r0, r2, r0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1D
	beq _080218AA
	cmp r0, 0x49
	beq _080218AA
	cmp r0, 0x33
	bne _0802188E
	cmp r7, 0x6
	beq _080218AA
_0802188E:
	cmp r0, 0x34
	bne _08021896
	cmp r7, 0x1
	beq _080218AA
_08021896:
	adds r0, r7, r2
_08021898:
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	ble _080218AA
	lsrs r0, r5, 16
	mov r8, r0
	adds r3, 0x1
_080218AA:
	lsrs r4, 1
	movs r1, 0x80
	lsls r1, 9
	adds r5, r1
	adds r7, 0x1
	cmp r4, 0
	bne _0802181E
_080218B8:
	ldr r0, _080218E0
	mov r9, r0
	cmp r3, 0x1
	ble _08021946
	ldr r0, [r0]
	ldrb r1, [r0, 0x3]
	movs r0, 0x2
	ands r0, r1
	movs r1, 0x39
	mov r8, r1
	cmp r0, 0
	beq _08021946
	movs r0, 0x3A
	b _08021944
	.align 2, 0
_080218D4: .4byte gUnknown_02024A60
_080218D8: .4byte gUnknown_02024C80
_080218DC: .4byte gBattleMons
_080218E0: .4byte gUnknown_02024C10
_080218E4:
	movs r0, 0x2
	ands r0, r1
	movs r1, 0xE
	cmp r0, 0
	beq _080218F0
	movs r1, 0x26
_080218F0:
	mov r9, r5
	cmp r4, 0
	beq _0802192C
	ldr r6, _08021960
	adds r5, r2, 0
	lsls r2, r1, 16
_080218FC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0802191E
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r0, r7, r0
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xB
	bgt _0802191E
	lsrs r1, r2, 16
	mov r8, r1
	adds r3, 0x1
_0802191E:
	lsrs r4, 1
	movs r0, 0x80
	lsls r0, 9
	adds r2, r0
	adds r7, 0x1
	cmp r4, 0
	bne _080218FC
_0802192C:
	cmp r3, 0x1
	ble _08021946
	mov r1, r9
	ldr r0, [r1]
	ldrb r1, [r0, 0x3]
	movs r0, 0x2
	ands r0, r1
	movs r1, 0x37
	mov r8, r1
	cmp r0, 0
	beq _08021946
	movs r0, 0x38
_08021944:
	mov r8, r0
_08021946:
	mov r1, r9
	ldr r2, [r1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08021964
	cmp r3, 0x1
	bgt _08021964
	adds r0, r2, 0x4
	mov r1, r9
	b _080219BA
	.align 2, 0
_08021960: .4byte gUnknown_02024A98
_08021964:
	cmp r3, 0
	beq _080219B4
	ldr r0, _080219A4
	ldr r1, _080219A8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _080219B4
	movs r0, 0
	movs r1, 0x1
	mov r2, r8
	str r3, [sp]
	bl dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
	ldr r0, _080219AC
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, _080219B0
	ldr r0, [r0]
	ldrb r1, [r0, 0x3]
	movs r0, 0x4
	ands r0, r1
	ldr r3, [sp]
	cmp r0, 0
	beq _080219A0
	cmp r3, 0x1
	ble _080219A0
	movs r0, 0x1
	strb r0, [r4]
_080219A0:
	ldr r1, _080219B0
	b _080219B6
	.align 2, 0
_080219A4: .4byte 0x02000000
_080219A8: .4byte 0x000160dc
_080219AC: .4byte gUnknown_02024A60
_080219B0: .4byte gUnknown_02024C10
_080219B4:
	mov r1, r9
_080219B6:
	ldr r0, [r1]
	adds r0, 0x4
_080219BA:
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk48_playstatchangeanimation

	thumb_func_start sub_80217F8
sub_80217F8: @ 80219CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	movs r0, 0
	mov r10, r0
	ldr r0, _08021A08
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	str r1, [sp, 0x10]
	ldrb r0, [r0, 0x2]
	str r0, [sp, 0x14]
	ldr r1, _08021A0C
	ldr r0, _08021A10
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08021A18
	ldr r1, _08021A14
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x7]
	b _08021A22
	.align 2, 0
_08021A08: .4byte gUnknown_02024C10
_08021A0C: .4byte gBattleMons
_08021A10: .4byte gUnknown_02024C07
_08021A14: .4byte gEnigmaBerries
_08021A18:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_08021A22:
	str r0, [sp, 0x8]
	ldr r0, _08021A40
	ldrb r1, [r0]
	lsls r1, 1
	ldr r0, _08021A44
	adds r1, r0
	str r1, [sp, 0xC]
	subs r0, 0xCC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08021A94
	movs r2, 0x3F
	ands r2, r0
	str r2, [sp, 0x4]
	b _08021AA6
	.align 2, 0
_08021A40: .4byte gUnknown_02024C07
_08021A44: .4byte 0x020160e8
_08021A48:
	strb r2, [r7]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	ldr r0, _08021A80
	ldr r3, _08021A84
	adds r0, r3
	strb r4, [r0]
	bl sub_8020B54
	ldr r2, _08021A88
	mov r4, r8
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	bl b_movescr_stack_push
	ldr r1, _08021A8C
	ldr r0, _08021A90
	bl _08022470
	.align 2, 0
_08021A80: .4byte 0x02000000
_08021A84: .4byte 0x0001600c
_08021A88: .4byte gUnknown_081D6BBC
_08021A8C: .4byte gUnknown_02024C10
_08021A90: .4byte gUnknown_081D9B2D
_08021A94:
	ldr r2, _08021AAC
	ldr r0, _08021AB0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	str r0, [sp, 0x4]
_08021AA6:
	ldr r5, _08021AB4
	mov r12, r5
	b _08021AC2
	.align 2, 0
_08021AAC: .4byte gBattleMoves
_08021AB0: .4byte gUnknown_02024BE6
_08021AB4: .4byte 0x02000000
_08021AB8:
	mov r0, r10
	cmp r0, 0
	beq _08021AC2
	bl _0802245A
_08021AC2:
	ldr r0, _08021ADC
	add r0, r12
	ldrb r0, [r0]
	cmp r0, 0x11
	bls _08021AD0
	bl _08022422
_08021AD0:
	lsls r0, 2
	ldr r1, _08021AE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021ADC: .4byte 0x0001600c
_08021AE0: .4byte _08021AE4
	.align 2, 0
_08021AE4:
	.4byte _08021B2C
	.4byte _08021C08
	.4byte _08021CC4
	.4byte _08021CF4
	.4byte _08021D18
	.4byte _08021D4C
	.4byte _08021D70
	.4byte _08021E14
	.4byte _08021E4C
	.4byte _08021E7C
	.4byte _08021EA0
	.4byte _08021EEC
	.4byte _08021F80
	.4byte _08022004
	.4byte _08022044
	.4byte _0802223C
	.4byte _08022394
	.4byte _08022422
_08021B2C:
	ldr r5, _08021BDC
	ldr r2, _08021BE0
	ldrb r4, [r2]
	movs r6, 0x58
	adds r3, r4, 0
	muls r3, r6
	adds r0, r5, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 16
	ands r1, r0
	cmp r1, 0
	beq _08021BD2
	adds r0, r3, r5
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08021BD2
	ldr r0, _08021BE4
	ldrb r1, [r0]
	cmp r1, r4
	beq _08021BD2
	adds r0, r1, 0
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r1, _08021BE0
	ldrb r0, [r1]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08021BD2
	ldr r0, _08021BE8
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08021BD2
	ldr r2, _08021BEC
	ldr r4, _08021BE0
	ldrb r3, [r4]
	lsls r1, r3, 4
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _08021B9C
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _08021BD2
_08021B9C:
	ldr r2, _08021BF0
	ldr r0, _08021BF4
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _08021BD2
	adds r0, r3, 0
	muls r0, r6
	adds r1, r0, r5
	ldrb r2, [r1, 0x19]
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _08021BD2
	adds r0, r2, 0x1
	strb r0, [r1, 0x19]
	bl b_movescr_stack_push_cursor
	ldr r1, _08021BF8
	ldr r0, _08021BFC
	str r0, [r1]
	movs r5, 0x1
	mov r10, r5
_08021BD2:
	ldr r2, _08021C00
	ldr r0, _08021C04
	adds r1, r2, r0
	b _08021FD4
	.align 2, 0
_08021BDC: .4byte gBattleMons
_08021BE0: .4byte gUnknown_02024C08
_08021BE4: .4byte gUnknown_02024C07
_08021BE8: .4byte gUnknown_02024C68
_08021BEC: .4byte gUnknown_02024D28
_08021BF0: .4byte gBattleMoves
_08021BF4: .4byte gUnknown_02024BE6
_08021BF8: .4byte gUnknown_02024C10
_08021BFC: .4byte gUnknown_081D9132
_08021C00: .4byte 0x02000000
_08021C04: .4byte 0x0001600c
_08021C08:
	ldr r2, _08021CA4
	ldr r1, _08021CA8
	ldrb r4, [r1]
	movs r3, 0x58
	mov r12, r3
	mov r3, r12
	muls r3, r4
	adds r7, r2, 0
	adds r7, 0x4C
	adds r6, r3, r7
	ldr r5, [r6]
	movs r0, 0x20
	ands r0, r5
	cmp r0, 0
	bne _08021C28
	b _08021FCE
_08021C28:
	adds r0, r3, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08021C32
	b _08021FCE
_08021C32:
	ldr r0, _08021CAC
	ldrb r0, [r0]
	cmp r0, r4
	bne _08021C3C
	b _08021FCE
_08021C3C:
	ldr r0, _08021CB0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	adds r0, 0xC
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	bne _08021C50
	b _08021FCE
_08021C50:
	ldr r0, _08021CB4
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08021C5E
	b _08021FCE
_08021C5E:
	ldr r4, [sp, 0x4]
	cmp r4, 0xA
	beq _08021C66
	b _08021FCE
_08021C66:
	movs r0, 0x21
	negs r0, r0
	ands r5, r0
	str r5, [r6]
	ldr r4, _08021CB8
	ldr r5, _08021CA8
	ldrb r0, [r5]
	strb r0, [r4]
	ldrb r0, [r5]
	mov r1, r12
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	bl b_movescr_stack_push_cursor
	ldr r1, _08021CBC
	ldr r0, _08021CC0
	str r0, [r1]
	movs r2, 0x1
	mov r10, r2
	b _08021FCE
	.align 2, 0
_08021CA4: .4byte gBattleMons
_08021CA8: .4byte gUnknown_02024C08
_08021CAC: .4byte gUnknown_02024C07
_08021CB0: .4byte gUnknown_02024D68
_08021CB4: .4byte gUnknown_02024C68
_08021CB8: .4byte gUnknown_02024A60
_08021CBC: .4byte gUnknown_02024C10
_08021CC0: .4byte gUnknown_081D955D
_08021CC4:
	ldr r0, _08021CE8
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08021CE0
	movs r4, 0x1
	mov r10, r4
_08021CE0:
	ldr r2, _08021CEC
	ldr r5, _08021CF0
	adds r1, r2, r5
	b _08021FD4
	.align 2, 0
_08021CE8: .4byte gUnknown_02024C08
_08021CEC: .4byte 0x02000000
_08021CF0: .4byte 0x0001600c
_08021CF4:
	ldr r0, _08021D14
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x4
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _08021D0E
	b _08021FCE
_08021D0E:
	movs r0, 0x1
	mov r10, r0
	b _08021FCE
	.align 2, 0
_08021D14: .4byte gUnknown_02024C08
_08021D18:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08021D3C
	movs r4, 0x1
	mov r10, r4
	ldr r5, _08021D38
	mov r12, r5
	b _08022422
	.align 2, 0
_08021D38: .4byte 0x02000000
_08021D3C:
	ldr r2, _08021D44
	ldr r0, _08021D48
	adds r1, r2, r0
	b _08021FD4
	.align 2, 0
_08021D44: .4byte 0x02000000
_08021D48: .4byte 0x0001600c
_08021D4C:
	ldr r0, _08021D6C
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x8
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _08021D66
	b _08021FCE
_08021D66:
	movs r1, 0x1
	mov r10, r1
	b _08021FCE
	.align 2, 0
_08021D6C: .4byte gUnknown_02024C07
_08021D70:
	ldr r0, _08021DFC
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _08021DB4
	ldr r4, [sp, 0x8]
	cmp r4, 0x1D
	bne _08021DB4
	ldr r0, _08021E00
	ldrh r2, [r0]
	adds r7, r0, 0
	cmp r2, 0xA5
	beq _08021DB4
	ldr r5, [sp, 0xC]
	ldrh r1, [r5]
	cmp r1, 0
	beq _08021D9C
	ldr r0, _08021E04
	cmp r1, r0
	bne _08021DB4
_08021D9C:
	cmp r2, 0xE2
	bne _08021DAE
	ldr r0, _08021E08
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08021DAE
	b _08022418
_08021DAE:
	ldrh r0, [r7]
	ldr r1, [sp, 0xC]
	strh r0, [r1]
_08021DB4:
	movs r4, 0
	ldr r2, _08021E0C
	ldr r3, _08021E10
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r2, 0xC
	adds r0, r2
	ldrh r0, [r0]
	ldr r5, [sp, 0xC]
	ldrh r1, [r5]
	mov r9, r3
	cmp r0, r1
	beq _08021DEC
	mov r6, r9
	movs r3, 0x58
	adds r5, r1, 0
_08021DD6:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08021DEC
	lsls r0, r4, 1
	ldrb r1, [r6]
	muls r1, r3
	adds r0, r1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r5
	bne _08021DD6
_08021DEC:
	cmp r4, 0x4
	beq _08021DF2
	b _08022418
_08021DF2:
	movs r0, 0
	ldr r1, [sp, 0xC]
_08021DF6:
	strh r0, [r1]
	b _08022418
	.align 2, 0
_08021DFC: .4byte gUnknown_02024C6C
_08021E00: .4byte gUnknown_02024BE8
_08021E04: .4byte 0x0000ffff
_08021E08: .4byte gUnknown_02024C68
_08021E0C: .4byte gBattleMons
_08021E10: .4byte gUnknown_02024C07
_08021E14:
	movs r4, 0
	ldr r0, _08021E40
	ldrb r2, [r0]
	cmp r4, r2
	blt _08021E20
	b _08022418
_08021E20:
	movs r5, 0
	ldr r2, _08021E44
	ldr r3, _08021E48
_08021E26:
	ldrh r1, [r2]
	cmp r1, 0
	beq _08021E30
	strh r1, [r3, 0x2E]
	strh r5, [r2]
_08021E30:
	adds r2, 0x2
	adds r3, 0x58
	adds r4, 0x1
	ldrb r1, [r0]
	cmp r4, r1
	blt _08021E26
	b _08022418
	.align 2, 0
_08021E40: .4byte gUnknown_02024A68
_08021E44: .4byte 0x020160f0
_08021E48: .4byte gBattleMons
_08021E4C:
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	beq _08021E6C
	movs r2, 0x1
	mov r10, r2
	ldr r3, _08021E68
	mov r12, r3
	b _08022422
	.align 2, 0
_08021E68: .4byte 0x02000000
_08021E6C:
	ldr r2, _08021E74
	ldr r4, _08021E78
	adds r1, r2, r4
	b _08021FD4
	.align 2, 0
_08021E74: .4byte 0x02000000
_08021E78: .4byte 0x0001600c
_08021E7C:
	movs r0, 0x4
	movs r1, 0
	movs r2, 0
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	beq _08021E90
	movs r5, 0x1
	mov r10, r5
_08021E90:
	ldr r2, _08021E98
	ldr r0, _08021E9C
	adds r1, r2, r0
	b _08021FD4
	.align 2, 0
_08021E98: .4byte 0x02000000
_08021E9C: .4byte 0x0001600c
_08021EA0:
	ldr r1, _08021ED8
	ldr r0, _08021EDC
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08021EE0
	ands r0, r1
	cmp r0, 0
	bne _08021EB6
	b _08021FCE
_08021EB6:
	ldr r0, _08021EE4
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08021EC4
	b _08021FCE
_08021EC4:
	ldr r4, _08021EE8
	strb r2, [r4]
	movs r0, 0
	movs r1, 0x1
	bl dp01_build_cmdbuf_x33_a_33_33
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08021FCE
	.align 2, 0
_08021ED8: .4byte gUnknown_02024C98
_08021EDC: .4byte gUnknown_02024C07
_08021EE0: .4byte 0x000400c0
_08021EE4: .4byte gUnknown_02024C6C
_08021EE8: .4byte gUnknown_02024A60
_08021EEC:
	ldr r0, _08021F5C
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08021F18
	ldr r1, _08021F60
	ldr r0, _08021F64
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08021F68
	ands r0, r1
	cmp r0, 0
	beq _08021F18
	adds r0, r2, 0
	bl sub_8015660
	lsls r0, 24
	cmp r0, 0
	beq _08021F52
_08021F18:
	ldr r4, _08021F6C
	ldr r5, _08021F64
	ldrb r0, [r5]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x33_a_33_33
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, _08021F60
	ldrb r2, [r5]
	lsls r2, 2
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08021F70
	ands r0, r1
	str r0, [r2]
	ldr r2, _08021F74
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08021F52:
	ldr r2, _08021F78
	ldr r4, _08021F7C
	adds r1, r2, r4
	b _08021FD4
	.align 2, 0
_08021F5C: .4byte gUnknown_02024C68
_08021F60: .4byte gUnknown_02024C98
_08021F64: .4byte gUnknown_02024C07
_08021F68: .4byte 0x000400c0
_08021F6C: .4byte gUnknown_02024A60
_08021F70: .4byte 0xfffbff3f
_08021F74: .4byte gUnknown_02024D68
_08021F78: .4byte 0x02000000
_08021F7C: .4byte 0x0001600c
_08021F80:
	ldr r2, _08021FE0
	ldr r1, _08021FE4
	ldrb r3, [r1]
	lsls r4, r3, 2
	adds r0, r4, r3
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _08021FCE
	ldr r0, _08021FE8
	ldrb r0, [r0]
	cmp r3, r0
	bcs _08021FCE
	ldr r5, _08021FEC
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _08021FF0
	ands r0, r1
	cmp r0, 0
	bne _08021FCE
	ldr r4, _08021FF4
	strb r3, [r4]
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x33_a_33_33
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, _08021FE4
	ldrb r2, [r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, [r2]
	ldr r1, _08021FF8
	ands r0, r1
	str r0, [r2]
_08021FCE:
	ldr r2, _08021FFC
	ldr r3, _08022000
	adds r1, r2, r3
_08021FD4:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r12, r2
	b _08022422
	.align 2, 0
_08021FE0: .4byte gUnknown_02024D68
_08021FE4: .4byte gUnknown_02024C08
_08021FE8: .4byte gUnknown_02024A68
_08021FEC: .4byte gUnknown_02024C98
_08021FF0: .4byte 0x000400c0
_08021FF4: .4byte gUnknown_02024A60
_08021FF8: .4byte 0xfffbff3f
_08021FFC: .4byte 0x02000000
_08022000: .4byte 0x0001600c
_08022004:
	movs r4, 0
	ldr r0, _08022034
	ldrb r5, [r0]
	cmp r4, r5
	blt _08022010
	b _08022418
_08022010:
	ldr r2, _08022038
	ldr r5, _0802203C
	adds r3, r0, 0
	ldr r1, _08022040
_08022018:
	ldrb r0, [r2, 0xA]
	cmp r0, 0
	bne _08022024
	ldr r0, [r1]
	ands r0, r5
	str r0, [r1]
_08022024:
	adds r2, 0x1C
	adds r1, 0x58
	adds r4, 0x1
	ldrb r0, [r3]
	cmp r4, r0
	blt _08022018
	b _08022418
	.align 2, 0
_08022034: .4byte gUnknown_02024A68
_08022038: .4byte gUnknown_02024CA8
_0802203C: .4byte 0xfeffffff
_08022040: .4byte gUnknown_02024AD0
_08022044:
	ldr r1, _08022100
	ldr r3, [r1]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r3
	ldr r2, _08022104
	mov r9, r2
	adds r5, r1, 0
	cmp r0, 0
	beq _0802206E
	ldr r0, _08022108
	ldrb r2, [r2]
	strb r2, [r0]
	ldr r1, _0802210C
	ldrb r0, [r1]
	mov r4, r9
	strb r0, [r4]
	strb r2, [r1]
	ldr r0, _08022110
	ands r3, r0
	str r3, [r5]
_0802206E:
	ldr r1, _08022114
	ldr r2, _08022118
	ldrh r3, [r2]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	mov r8, r1
	adds r7, r2, 0
	cmp r0, 0x7F
	bne _08022092
	ldr r0, _0802211C
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802209E
_08022092:
	ldr r1, _08022120
	mov r2, r9
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	strh r3, [r0]
_0802209E:
	ldr r0, _08022124
	ldrb r1, [r0]
	ldr r2, _08022128
	mov r3, r9
	ldrb r4, [r3]
	lsls r0, r4, 2
	adds r0, r2
	ldr r3, [r0]
	ands r1, r3
	adds r6, r2, 0
	cmp r1, 0
	beq _080220B8
	b _08022418
_080220B8:
	ldr r0, _0802212C
	add r0, r12
	ldrb r0, [r0]
	ands r0, r3
	cmp r0, 0
	beq _080220C6
	b _08022418
_080220C6:
	ldrh r2, [r7]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0x7F
	bne _080220D8
	b _08022418
_080220D8:
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _0802213C
	ldr r1, _08022130
	lsls r0, r4, 1
	adds r0, r1
	strh r2, [r0]
	ldr r0, _08022134
	mov r4, r9
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r0
	ldr r0, _08022138
	ldrh r0, [r0]
	strh r0, [r1]
	b _08022156
	.align 2, 0
_08022100: .4byte gUnknown_02024C6C
_08022104: .4byte gUnknown_02024C07
_08022108: .4byte gUnknown_02024A60
_0802210C: .4byte gUnknown_02024C08
_08022110: .4byte 0xffffefff
_08022114: .4byte gBattleMoves
_08022118: .4byte gUnknown_02024BE8
_0802211C: .4byte gUnknown_02024C68
_08022120: .4byte gUnknown_02024C2C
_08022124: .4byte gUnknown_02024C0C
_08022128: .4byte gBitTable
_0802212C: .4byte 0x000160a6
_08022130: .4byte gUnknown_02024C34
_08022134: .4byte gUnknown_02024C4C
_08022138: .4byte gUnknown_02024BE6
_0802213C:
	ldr r1, _080221A4
	lsls r0, r4, 1
	adds r0, r1
	ldr r1, _080221A8
	strh r1, [r0]
	ldr r1, _080221AC
	mov r2, r9
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0]
_08022156:
	ldr r2, _080221B0
	ldrb r3, [r2]
	lsls r0, r3, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 28
	ldr r1, [r5]
	ands r1, r0
	cmp r1, 0
	bne _08022174
	ldr r0, _080221B4
	adds r0, r3, r0
	mov r3, r9
	ldrb r1, [r3]
	strb r1, [r0]
_08022174:
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _08022220
	ldr r0, _080221B8
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08022220
	ldrh r2, [r7]
	ldr r0, _080221A8
	cmp r2, r0
	bne _080221C0
	ldr r1, _080221BC
	ldr r4, _080221B0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	strh r2, [r0]
	b _08022418
	.align 2, 0
_080221A4: .4byte gUnknown_02024C34
_080221A8: .4byte 0x0000ffff
_080221AC: .4byte gUnknown_02024C4C
_080221B0: .4byte gUnknown_02024C08
_080221B4: .4byte gUnknown_02024C5C
_080221B8: .4byte gUnknown_02024C68
_080221BC: .4byte gUnknown_02024C3C
_080221C0:
	ldr r0, _080221E8
	ldr r5, _080221EC
	ldrb r1, [r5]
	lsls r1, 1
	adds r1, r0
	ldr r4, _080221F0
	ldrh r0, [r4]
	strh r0, [r1]
	ldr r0, _080221F4
	add r0, r12
	ldrb r3, [r0]
	cmp r3, 0
	beq _080221FC
	ldr r0, _080221F8
	ldrb r1, [r5]
	lsls r1, 1
	adds r1, r0
	movs r0, 0x3F
	ands r0, r3
	b _08021DF6
	.align 2, 0
_080221E8: .4byte gUnknown_02024C3C
_080221EC: .4byte gUnknown_02024C08
_080221F0: .4byte gUnknown_02024BE6
_080221F4: .4byte 0x0001601c
_080221F8: .4byte gUnknown_02024C44
_080221FC:
	ldr r0, _08022218
	ldr r1, _0802221C
	ldrb r2, [r1]
	lsls r2, 1
	adds r2, r0
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x2]
	strh r0, [r2]
	b _08022418
	.align 2, 0
_08022218: .4byte gUnknown_02024C44
_0802221C: .4byte gUnknown_02024C08
_08022220:
	ldr r0, _08022230
	ldr r2, _08022234
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	ldr r0, _08022238
	b _08021DF6
	.align 2, 0
_08022230: .4byte gUnknown_02024C3C
_08022234: .4byte gUnknown_02024C08
_08022238: .4byte 0x0000ffff
_0802223C:
	ldr r0, _08022300
	ldrb r1, [r0]
	ldr r6, _08022304
	ldr r2, _08022308
	ldrb r5, [r2]
	lsls r0, r5, 2
	adds r0, r6
	ldr r4, [r0]
	ands r1, r4
	mov r9, r2
	cmp r1, 0
	beq _08022256
	b _08022418
_08022256:
	ldr r0, _0802230C
	add r0, r12
	ldrb r0, [r0]
	ands r0, r4
	cmp r0, 0
	beq _08022264
	b _08022418
_08022264:
	ldr r1, _08022310
	ldr r4, _08022314
	ldrh r3, [r4]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x8]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08022330
	ldr r0, _08022318
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 18
	ands r0, r1
	cmp r0, 0
	beq _08022330
	ldr r2, _0802231C
	ldrb r0, [r2]
	cmp r5, r0
	bne _08022294
	b _08022418
_08022294:
	adds r2, r0, 0
	lsls r0, r2, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 28
	ands r1, r0
	cmp r1, 0
	bne _08022330
	ldr r0, _08022320
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _08022330
	lsls r0, r2, 1
	ldr r5, _08022324
	adds r0, r5
	add r0, r12
	strb r3, [r0]
	ldr r0, _0802231C
	ldrb r1, [r0]
	lsls r1, 1
	ldr r2, _08022328
	adds r1, r2
	add r1, r12
	ldrh r0, [r4]
	lsrs r0, 8
	strb r0, [r1]
	ldr r3, _0802231C
	ldrb r2, [r3]
	lsls r2, 2
	mov r5, r9
	ldrb r0, [r5]
	lsrs r0, 1
	lsls r0, 1
	ldr r1, _0802232C
	adds r0, r1
	adds r2, r0
	add r2, r12
	ldrh r0, [r4]
	strb r0, [r2]
	ldrb r2, [r3]
	lsls r2, 2
	ldrb r0, [r5]
	lsrs r0, 1
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	adds r2, r0
	add r2, r12
	ldrh r0, [r4]
	lsrs r0, 8
	strb r0, [r2]
	b _08022418
	.align 2, 0
_08022300: .4byte gUnknown_02024C0C
_08022304: .4byte gBitTable
_08022308: .4byte gUnknown_02024C07
_0802230C: .4byte 0x000160a6
_08022310: .4byte gBattleMoves
_08022314: .4byte gUnknown_02024BE8
_08022318: .4byte gUnknown_02024C6C
_0802231C: .4byte gUnknown_02024C08
_08022320: .4byte gUnknown_02024C68
_08022324: .4byte 0x000160ac
_08022328: .4byte 0x000160ad
_0802232C: .4byte 0x00016100
_08022330:
	mov r1, r9
	ldrb r0, [r1]
	ldr r2, _08022388
	ldrb r2, [r2]
	cmp r0, r2
	beq _08022418
	ldr r3, _08022388
	ldrb r0, [r3]
	lsls r0, 1
	ldr r4, _0802238C
	adds r0, r4
	add r0, r12
	movs r3, 0
	strb r3, [r0]
	ldr r5, _08022388
	ldrb r0, [r5]
	lsls r0, 1
	ldr r1, _08022390
	adds r0, r1
	add r0, r12
	strb r3, [r0]
	ldrb r2, [r5]
	lsls r2, 2
	mov r4, r9
	ldrb r0, [r4]
	lsrs r0, 1
	lsls r0, 1
	adds r1, 0x53
	adds r0, r1
	adds r2, r0
	add r2, r12
	strb r3, [r2]
	ldrb r2, [r5]
	lsls r2, 2
	ldrb r0, [r4]
	lsrs r0, 1
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	adds r2, r0
	add r2, r12
	strb r3, [r2]
	b _08022418
	.align 2, 0
_08022388: .4byte gUnknown_02024C08
_0802238C: .4byte 0x000160ac
_08022390: .4byte 0x000160ad
_08022394:
	ldr r5, _08022484
	ldr r2, [r5]
	movs r0, 0x80
	lsls r0, 12
	ands r0, r2
	cmp r0, 0
	bne _08022418
	ldr r0, _08022488
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08022418
	ldr r1, _0802248C
	ldr r0, _08022490
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	blt _08022418
	ldr r0, _08022494
	mov r9, r0
	ldr r1, _08022498
	mov r8, r1
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _08022418
	movs r6, 0x80
	lsls r6, 2
	adds r4, r6, 0
	ands r4, r2
	cmp r4, 0
	bne _08022418
	ldr r7, _0802249C
	ldrb r0, [r7]
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080224A0
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _0802240E
	bl _08021A48
_0802240E:
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	ldr r2, _080224A4
	mov r12, r2
_08022418:
	ldr r1, _080224A8
	add r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08022422:
	ldr r3, [sp, 0x10]
	cmp r3, 0x1
	bne _08022436
	mov r4, r10
	cmp r4, 0
	bne _08022436
	ldr r1, _080224A8
	add r1, r12
	movs r0, 0x11
	strb r0, [r1]
_08022436:
	ldr r5, [sp, 0x10]
	cmp r5, 0x2
	bne _0802244C
	ldr r1, _080224A8
	add r1, r12
	ldr r0, [sp, 0x14]
	ldrb r2, [r1]
	cmp r0, r2
	bne _0802244C
	movs r0, 0x11
	strb r0, [r1]
_0802244C:
	ldr r0, _080224A8
	add r0, r12
	ldrb r0, [r0]
	cmp r0, 0x11
	beq _0802245A
	bl _08021AB8
_0802245A:
	ldr r0, _080224A8
	add r0, r12
	ldrb r0, [r0]
	cmp r0, 0x11
	bne _08022472
	mov r3, r10
	cmp r3, 0
	bne _08022472
	ldr r1, _080224AC
	ldr r0, [r1]
	adds r0, 0x3
_08022470:
	str r0, [r1]
_08022472:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022484: .4byte gUnknown_02024C6C
_08022488: .4byte gUnknown_020239F8
_0802248C: .4byte gUnknown_02024D28
_08022490: .4byte gUnknown_02024C07
_08022494: .4byte gBattleMoves
_08022498: .4byte gUnknown_02024BE6
_0802249C: .4byte gUnknown_02024C08
_080224A0: .4byte gBattleMons
_080224A4: .4byte 0x02000000
_080224A8: .4byte 0x0001600c
_080224AC: .4byte gUnknown_02024C10
	thumb_func_end sub_80217F8

	thumb_func_start atk4A_damageflags
atk4A_damageflags: @ 80224B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	movs r5, 0
	ldr r2, _08022514
	ldr r0, _08022518
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	mov r8, r0
	ldr r2, _0802251C
	ldr r3, _08022520
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r2
	adds r7, r3, 0
	cmp r0, 0x1A
	bne _08022544
	mov r1, r8
	cmp r1, 0x4
	bne _08022544
	ldr r3, _08022524
	strb r0, [r3]
	ldr r2, _08022528
	ldrb r0, [r2]
	movs r1, 0x9
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802252C
	ldrb r0, [r7]
	lsls r0, 1
	adds r0, r1
	strh r4, [r0]
	ldr r0, _08022530
	mov r2, r8
	strb r2, [r0, 0x6]
	ldrb r0, [r7]
	ldrb r1, [r3]
	bl sub_81074C4
	b _08022626
	.align 2, 0
_08022514: .4byte gBattleMoves
_08022518: .4byte gUnknown_02024BE6
_0802251C: .4byte gBattleMons
_08022520: .4byte gUnknown_02024C08
_08022524: .4byte byte_2024C06
_08022528: .4byte gUnknown_02024C68
_0802252C: .4byte gUnknown_02024C3C
_08022530: .4byte gUnknown_02024D1E
_08022534:
	ldr r0, _08022540
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
	b _08022626
	.align 2, 0
_08022540: .4byte gUnknown_02024C68
_08022544:
	ldr r1, _08022550
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r6, r1, 0
	b _08022606
	.align 2, 0
_08022550: .4byte gTypeEffectiveness
_08022554:
	adds r0, r5, r6
	ldrb r0, [r0]
	cmp r0, r8
	bne _08022600
	adds r2, r5, 0x1
	adds r3, r2, r6
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r0, 0x21
	ldrb r1, [r3]
	adds r3, r2, 0
	ldrb r0, [r0]
	cmp r1, r0
	bne _08022592
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r1, [r0]
	cmp r1, 0
	beq _08022534
	cmp r1, 0x5
	bne _08022586
	movs r0, 0x4
	orrs r4, r0
_08022586:
	cmp r1, 0x14
	bne _08022592
	movs r0, 0x2
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08022592:
	adds r2, r3, r6
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _08022600
	adds r0, 0x21
	ldrb r1, [r0]
	cmp r1, r2
	beq _080225BA
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0
	beq _08022534
_080225BA:
	cmp r1, r2
	beq _080225D0
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080225D0
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080225D0:
	adds r2, r3, r6
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r1, r0, 0
	adds r1, 0x22
	ldrb r2, [r2]
	ldrb r1, [r1]
	cmp r2, r1
	bne _08022600
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, r2
	beq _08022600
	adds r0, r5, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x14
	bne _08022600
	movs r0, 0x2
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08022600:
	adds r5, 0x3
	adds r0, r5, r6
	ldrb r0, [r0]
_08022606:
	cmp r0, 0xFF
	beq _08022626
	cmp r0, 0xFE
	bne _08022554
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	mov r1, r12
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 22
	ands r0, r1
	cmp r0, 0
	beq _08022600
_08022626:
	ldr r2, _080226D4
	ldr r0, _080226D8
	mov r8, r0
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x20
	ldrb r6, [r0]
	cmp r6, 0x19
	bne _080226A2
	movs r5, 0x29
	ands r5, r4
	cmp r5, 0
	bne _080226A2
	ldr r0, _080226DC
	ldrb r0, [r0]
	ldr r7, _080226E0
	ldrh r1, [r7]
	bl move_weather_interaction
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _080226A2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08022668
	movs r0, 0x6
	ands r4, r0
	cmp r4, 0x6
	bne _080226A2
_08022668:
	ldr r2, _080226E4
	ldrh r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080226A2
	ldr r3, _080226E8
	strb r6, [r3]
	ldr r2, _080226EC
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080226F0
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r1
	strh r5, [r0]
	ldr r1, _080226F4
	movs r0, 0x3
	strb r0, [r1, 0x6]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl sub_81074C4
_080226A2:
	ldr r0, _080226EC
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080226C0
	ldr r2, _080226F8
	ldr r0, _080226DC
	ldrb r1, [r0]
	lsls r1, 4
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1, 0x1]
_080226C0:
	ldr r1, _080226FC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080226D4: .4byte gBattleMons
_080226D8: .4byte gUnknown_02024C08
_080226DC: .4byte gUnknown_02024C07
_080226E0: .4byte gUnknown_02024BE6
_080226E4: .4byte gBattleMoves
_080226E8: .4byte byte_2024C06
_080226EC: .4byte gUnknown_02024C68
_080226F0: .4byte gUnknown_02024C3C
_080226F4: .4byte gUnknown_02024D1E
_080226F8: .4byte gUnknown_02024D28
_080226FC: .4byte gUnknown_02024C10
	thumb_func_end atk4A_damageflags

	thumb_func_start atk4B_cmd4b
atk4B_cmd4b: @ 8022700
	push {r4,lr}
	ldr r4, _0802273C
	ldr r0, _08022740
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r2, _08022744
	ldr r1, _08022748
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	ands r0, r1
	cmp r0, 0
	bne _0802272E
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x06_a
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0802272E:
	ldr r1, _0802274C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802273C: .4byte gUnknown_02024A60
_08022740: .4byte gUnknown_02024C07
_08022744: .4byte gUnknown_02024C6C
_08022748: .4byte gBitTable
_0802274C: .4byte gUnknown_02024C10
	thumb_func_end atk4B_cmd4b

	thumb_func_start atk4C_switch1
atk4C_switch1: @ 8022750
	push {r4-r6,lr}
	ldr r0, _080227A8
	ldr r0, [r0]
	cmp r0, 0
	bne _080227A0
	ldr r5, _080227AC
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _080227B0
	strb r0, [r4]
	ldr r3, _080227B4
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r3
	ldr r2, _080227B8
	ldr r6, _080227BC
	adds r0, r6
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _080227C0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x00_a_b_0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_080227A0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080227A8: .4byte gUnknown_02024A64
_080227AC: .4byte gUnknown_02024C10
_080227B0: .4byte gUnknown_02024A60
_080227B4: .4byte gUnknown_02024A6A
_080227B8: .4byte 0x02000000
_080227BC: .4byte 0x00016068
_080227C0: .4byte gBitTable
	thumb_func_end atk4C_switch1

	thumb_func_start sub_80225F0
sub_80225F0: @ 80227C4
	push {r4-r7,lr}
	sub sp, 0x58
	ldr r0, _08022920
	ldr r0, [r0]
	cmp r0, 0
	beq _080227D2
	b _08022918
_080227D2:
	ldr r0, _08022924
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08022928
	strb r0, [r4]
	ldr r6, _0802292C
	ldrb r0, [r4]
	movs r5, 0x58
	adds r1, r0, 0
	muls r1, r5
	adds r1, r6
	mov r0, sp
	movs r2, 0x58
	bl memcpy
	ldrb r0, [r4]
	muls r0, r5
	adds r3, r0, r6
	movs r2, 0
	ldr r5, _08022930
	adds r7, r4, 0
_08022800:
	adds r0, r3, r2
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _08022800
	ldr r4, _0802292C
	ldrb r0, [r7]
	movs r6, 0x58
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r3, _08022934
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x6]
	adds r2, 0x21
	strb r0, [r2]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r4
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x7]
	adds r1, 0x22
	strb r0, [r1]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r4
	ldrh r0, [r1]
	ldrb r1, [r1, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	ldrb r1, [r7]
	muls r1, r6
	adds r1, r4
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08022938
	adds r0, 0x29
	adds r0, r2, r0
	ldrb r1, [r0]
	ldr r3, _0802293C
	ldr r2, _08022940
	ldrb r5, [r7]
	lsls r0, r5, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	mov r12, r4
	cmp r1, 0
	beq _0802289E
	adds r0, r5, 0
	muls r0, r6
	add r0, r12
	movs r1, 0
	strh r1, [r0, 0x2E]
_0802289E:
	ldr r2, _08022944
	ldr r0, _08022948
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7F
	bne _080228E4
	movs r2, 0
	adds r4, r7, 0
	movs r6, 0x58
	mov r5, r12
	adds r5, 0x18
	add r3, sp, 0x18
_080228BE:
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r2, r1
	adds r1, r5
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _080228BE
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	mov r1, r12
	adds r1, 0x50
	adds r0, r1
	ldr r1, [sp, 0x50]
	str r1, [r0]
_080228E4:
	bl sub_8010B88
	ldr r0, _0802294C
	ldr r3, _08022928
	ldrb r2, [r3]
	ldr r1, _08022950
	adds r0, r1
	strb r2, [r0]
	ldr r1, _08022954
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _08022940
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08022924
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08022918:
	add sp, 0x58
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022920: .4byte gUnknown_02024A64
_08022924: .4byte gUnknown_02024C10
_08022928: .4byte gUnknown_02024A60
_0802292C: .4byte gBattleMons
_08022930: .4byte gUnknown_02024260
_08022934: .4byte gBaseStats
_08022938: .4byte gUnknown_02024DBC
_0802293C: .4byte gBitTable
_08022940: .4byte gUnknown_02024A6A
_08022944: .4byte gBattleMoves
_08022948: .4byte gUnknown_02024BE6
_0802294C: .4byte 0x02000000
_08022950: .4byte 0x00016003
_08022954: .4byte gUnknown_030041C0
	thumb_func_end sub_80225F0

	thumb_func_start sub_8022784
sub_8022784: @ 8022958
	push {r4,r5,lr}
	ldr r0, _080229E0
	ldr r0, [r0]
	cmp r0, 0
	bne _080229DA
	ldr r0, _080229E4
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _080229E8
	strb r0, [r4]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080229A4
	ldr r0, _080229EC
	ldrh r1, [r0]
	ldr r0, _080229F0
	ands r0, r1
	cmp r0, 0
	bne _080229A4
	ldr r2, _080229F4
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
_080229A4:
	ldr r2, _080229F8
	ldr r1, _080229FC
	ldr r5, _080229E8
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _08022A00
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r1
	ldrb r1, [r0]
	ldr r4, _080229E4
	ldr r0, [r4]
	ldrb r2, [r0, 0x2]
	movs r0, 0
	bl sub_800C704
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
_080229DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080229E0: .4byte gUnknown_02024A64
_080229E4: .4byte gUnknown_02024C10
_080229E8: .4byte gUnknown_02024A60
_080229EC: .4byte gUnknown_020239F8
_080229F0: .4byte 0x00000902
_080229F4: .4byte gBattleMons
_080229F8: .4byte gUnknown_02024C0C
_080229FC: .4byte gBitTable
_08022A00: .4byte gUnknown_02024A6A
	thumb_func_end sub_8022784

	thumb_func_start sub_8022830
sub_8022830: @ 8022A04
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _08022A68
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	movs r0, 0x7F
	ands r0, r1
	bl sub_8015150
	ldr r3, _08022A6C
	strb r0, [r3]
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08022A7C
	ldr r1, _08022A70
	ldrb r3, [r3]
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08022A74
	ands r0, r1
	cmp r0, 0
	bne _08022A50
	ldr r1, _08022A78
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _08022A7C
_08022A50:
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
	str r1, [r4]
	b _08022C00
	.align 2, 0
_08022A68: .4byte gUnknown_02024C10
_08022A6C: .4byte gUnknown_02024A60
_08022A70: .4byte gBattleMons
_08022A74: .4byte 0x0400e000
_08022A78: .4byte gUnknown_02024C98
_08022A7C:
	ldr r5, _08022B08
	ldrh r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08022B1C
	ldr r4, _08022B0C
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08022B10
	mov r8, r1
	cmp r0, 0x1
	bne _08022AA0
	ldr r0, _08022B14
	mov r8, r0
_08022AA0:
	movs r5, 0
	ldrb r0, [r4]
	bl sub_803FC34
	lsls r0, 24
	lsrs r0, 24
	bl sub_803FBFC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08022ABA
	movs r5, 0x3
_08022ABA:
	adds r6, r5, 0x3
	cmp r5, r6
	bge _08022B02
	ldr r7, _08022B18
_08022AC2:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08022AFC
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08022AFC
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08022AFC
	ldr r0, _08022B0C
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r5
	bne _08022B02
_08022AFC:
	adds r5, 0x1
	cmp r5, r6
	blt _08022AC2
_08022B02:
	cmp r5, r6
	beq _08022BD0
	b _08022BF8
	.align 2, 0
_08022B08: .4byte gUnknown_020239F8
_08022B0C: .4byte gUnknown_02024A60
_08022B10: .4byte gPlayerParty
_08022B14: .4byte gEnemyParty
_08022B18: .4byte gUnknown_02024A6A
_08022B1C:
	ldr r0, _08022B4C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08022B5C
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r1, [r5]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08022B50
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	b _08022B52
	.align 2, 0
_08022B4C: .4byte gUnknown_02024A60
_08022B50:
	adds r6, r7, 0
_08022B52:
	ldr r0, _08022B58
	mov r8, r0
	b _08022B82
	.align 2, 0
_08022B58: .4byte gEnemyParty
_08022B5C:
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08022B7C
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	b _08022B7E
_08022B7C:
	adds r6, r7, 0
_08022B7E:
	ldr r1, _08022BEC
	mov r8, r1
_08022B82:
	movs r5, 0
_08022B84:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08022BC6
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08022BC6
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08022BC6
	ldr r1, _08022BF0
	lsls r0, r7, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	beq _08022BC6
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r5, r0
	bne _08022BCC
_08022BC6:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08022B84
_08022BCC:
	cmp r5, 0x6
	bne _08022BF8
_08022BD0:
	ldr r3, _08022BF4
	ldr r2, [r3]
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
	b _08022C00
	.align 2, 0
_08022BEC: .4byte gPlayerParty
_08022BF0: .4byte gUnknown_02024A6A
_08022BF4: .4byte gUnknown_02024C10
_08022BF8:
	ldr r1, _08022C0C
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
_08022C00:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022C0C: .4byte gUnknown_02024C10
	thumb_func_end sub_8022830

	thumb_func_start sub_8022A3C
sub_8022A3C: @ 8022C10
	push {r4,r5,lr}
	sub sp, 0x4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08022C58
	ldr r5, _08022C5C
	ldrb r0, [r5]
	ldr r3, _08022C60
	adds r1, r0, r3
	adds r1, r4
	ldr r3, _08022C64
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08022C68
	adds r4, r1
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x1
	movs r3, 0
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022C58: .4byte 0x02000000
_08022C5C: .4byte gUnknown_02024A60
_08022C60: .4byte 0x00016064
_08022C64: .4byte gUnknown_02024A6A
_08022C68: .4byte 0x0001606c
	thumb_func_end sub_8022A3C

	thumb_func_start atk50_openpartyscreen
atk50_openpartyscreen: @ 8022C6C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r7, 0
	movs r0, 0
	mov r9, r0
	ldr r6, _08022D18
	ldr r1, [r6]
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r2, r0
	mov r8, r2
	ldrb r2, [r1, 0x1]
	adds r0, r2, 0
	mov r12, r6
	cmp r0, 0x5
	beq _08022CA2
	b _08023148
_08022CA2:
	ldr r0, _08022D1C
	ldrh r0, [r0]
	movs r1, 0x41
	ands r1, r0
	cmp r1, 0x1
	beq _08022D90
	ldr r1, _08022D20
	strb r7, [r1]
	ldr r0, _08022D24
	ldrb r0, [r0]
	cmp r7, r0
	bcc _08022CBC
	b _08023136
_08022CBC:
	ldr r7, _08022D28
	ldr r6, _08022D2C
	adds r4, r1, 0
	ldr r0, _08022D30
	mov r8, r0
_08022CC6:
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r7]
	ands r0, r1
	cmp r0, 0
	beq _08022D68
	adds r0, r2, 0
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _08022D34
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r7]
	bics r0, r1
	str r0, [r7]
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08022D76
	.align 2, 0
_08022D18: .4byte gUnknown_02024C10
_08022D1C: .4byte gUnknown_020239F8
_08022D20: .4byte gUnknown_02024A60
_08022D24: .4byte gUnknown_02024A68
_08022D28: .4byte gUnknown_02024C6C
_08022D2C: .4byte gBitTable
_08022D30: .4byte gUnknown_02024C0C
_08022D34:
	ldr r5, _08022D64
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08022D76
	movs r0, 0x6
	bl sub_8022A3C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _08022D76
	.align 2, 0
_08022D64: .4byte gUnknown_02024D68
_08022D68:
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08022D76:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08022D8C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08022CC6
	b _08023136
	.align 2, 0
_08022D8C: .4byte gUnknown_02024A68
_08022D90:
	ands r1, r0
	cmp r1, 0
	bne _08022D98
	b _08023136
_08022D98:
	ldr r0, _08022DF0
	mov r8, r0
	ldr r0, [r0]
	lsrs r5, r0, 28
	ldr r6, _08022DF4
	ldr r0, [r6]
	ands r0, r5
	cmp r0, 0
	beq _08022E52
	ldr r4, _08022DF8
	strb r7, [r4]
	movs r0, 0
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _08022E00
	ldr r2, _08022DFC
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	mov r2, r8
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x2A_2A_2A_2A
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08022E52
	.align 2, 0
_08022DF0: .4byte gUnknown_02024C6C
_08022DF4: .4byte gBitTable
_08022DF8: .4byte gUnknown_02024A60
_08022DFC: .4byte gUnknown_02024C0C
_08022E00:
	ldr r6, _08022E34
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08022E40
	ldr r0, _08022E38
	ldr r1, _08022E3C
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8022A3C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _08022E52
	.align 2, 0
_08022E34: .4byte gUnknown_02024D68
_08022E38: .4byte 0x02000000
_08022E3C: .4byte 0x0001606a
_08022E40:
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	movs r2, 0x1
	mov r9, r2
_08022E52:
	ldr r6, _08022EAC
	ldr r0, [r6, 0x8]
	ands r0, r5
	cmp r0, 0
	beq _08022F14
	ldr r0, [r6]
	ands r0, r5
	cmp r0, 0
	bne _08022F14
	ldr r4, _08022EB0
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0x2
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _08022EBC
	ldr r2, _08022EB4
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08022EB8
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x2A_2A_2A_2A
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08022F14
	.align 2, 0
_08022EAC: .4byte gBitTable
_08022EB0: .4byte gUnknown_02024A60
_08022EB4: .4byte gUnknown_02024C0C
_08022EB8: .4byte gUnknown_02024C6C
_08022EBC:
	ldr r6, _08022EF0
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08022EFC
	ldr r0, _08022EF4
	ldr r1, _08022EF8
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8022A3C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _08022F14
	.align 2, 0
_08022EF0: .4byte gUnknown_02024D68
_08022EF4: .4byte 0x02000000
_08022EF8: .4byte 0x00016068
_08022EFC:
	movs r0, 0x1
	mov r2, r9
	ands r0, r2
	cmp r0, 0
	bne _08022F14
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08022F14:
	ldr r6, _08022F64
	ldr r0, [r6, 0x4]
	ands r0, r5
	cmp r0, 0
	beq _08022FCA
	ldr r4, _08022F68
	movs r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _08022F74
	ldr r2, _08022F6C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08022F70
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x2A_2A_2A_2A
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08022FCA
	.align 2, 0
_08022F64: .4byte gBitTable
_08022F68: .4byte gUnknown_02024A60
_08022F6C: .4byte gUnknown_02024C0C
_08022F70: .4byte gUnknown_02024C6C
_08022F74:
	ldr r6, _08022FA8
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08022FB4
	ldr r0, _08022FAC
	ldr r1, _08022FB0
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8022A3C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _08022FCA
	.align 2, 0
_08022FA8: .4byte gUnknown_02024D68
_08022FAC: .4byte 0x02000000
_08022FB0: .4byte 0x0001606b
_08022FB4:
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	movs r0, 0x2
	mov r2, r9
	orrs r2, r0
	mov r9, r2
_08022FCA:
	ldr r6, _08023024
	ldr r0, [r6, 0xC]
	ands r0, r5
	cmp r0, 0
	beq _0802308C
	ldr r0, [r6, 0x4]
	ands r0, r5
	cmp r0, 0
	bne _0802308C
	ldr r4, _08023028
	movs r0, 0x3
	strb r0, [r4]
	movs r0, 0x3
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _08023034
	ldr r2, _0802302C
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _08023030
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x2A_2A_2A_2A
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0802308C
	.align 2, 0
_08023024: .4byte gBitTable
_08023028: .4byte gUnknown_02024A60
_0802302C: .4byte gUnknown_02024C0C
_08023030: .4byte gUnknown_02024C6C
_08023034:
	ldr r6, _08023068
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08023074
	ldr r0, _0802306C
	ldr r1, _08023070
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8022A3C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _0802308C
	.align 2, 0
_08023068: .4byte gUnknown_02024D68
_0802306C: .4byte 0x02000000
_08023070: .4byte 0x00016069
_08023074:
	movs r0, 0x2
	mov r2, r9
	ands r2, r0
	cmp r2, 0
	bne _0802308C
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0802308C:
	ldr r1, _080230BC
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _080230E0
	adds r0, r1, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	blt _080230E0
	cmp r5, 0
	beq _080230E0
	ldr r0, _080230C0
	ldrb r1, [r0]
	ldr r0, _080230C4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080230CC
	ldr r1, _080230C8
	movs r0, 0x2
	strb r0, [r1]
	b _080230D0
	.align 2, 0
_080230BC: .4byte gUnknown_02024D68
_080230C0: .4byte gUnknown_02024C0C
_080230C4: .4byte gBitTable
_080230C8: .4byte gUnknown_02024A60
_080230CC:
	ldr r0, _08023110
	strb r1, [r0]
_080230D0:
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldr r0, _08023110
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
_080230E0:
	ldr r1, _08023114
	ldrb r0, [r1, 0x14]
	lsls r0, 25
	cmp r0, 0
	blt _08023136
	adds r0, r1, 0
	adds r0, 0x3C
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	blt _08023136
	cmp r5, 0
	beq _08023136
	ldr r0, _08023118
	ldrb r0, [r0]
	ldr r1, _0802311C
	ldr r1, [r1, 0x4]
	ands r0, r1
	cmp r0, 0
	beq _08023120
	ldr r1, _08023110
	movs r0, 0x3
	b _08023124
	.align 2, 0
_08023110: .4byte gUnknown_02024A60
_08023114: .4byte gUnknown_02024D68
_08023118: .4byte gUnknown_02024C0C
_0802311C: .4byte gBitTable
_08023120:
	ldr r1, _08023140
	movs r0, 0x1
_08023124:
	strb r0, [r1]
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldr r0, _08023140
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
_08023136:
	ldr r1, _08023144
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	b _080234D6
	.align 2, 0
_08023140: .4byte gUnknown_02024A60
_08023144: .4byte gUnknown_02024C10
_08023148:
	cmp r0, 0x6
	beq _0802314E
	b _08023344
_0802314E:
	ldr r0, _080231C4
	ldrh r2, [r0]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _0802315C
	b _080232E0
_0802315C:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _08023166
	b _080232E0
_08023166:
	ldr r7, _080231C8
	ldr r0, [r7]
	lsrs r5, r0, 28
	ldr r4, _080231CC
	ldr r0, [r4, 0x8]
	ands r0, r5
	cmp r0, 0
	beq _0802320E
	ldr r0, [r4]
	ands r0, r5
	cmp r0, 0
	beq _0802320E
	ldr r6, _080231D0
	movs r0, 0x2
	strb r0, [r6]
	ldr r0, _080231D4
	ldrb r1, [r0, 0x1]
	movs r0, 0x2
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _080231DC
	ldr r2, _080231D8
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r7]
	bics r0, r1
	str r0, [r7]
	movs r0, 0
	bl dp01_build_cmdbuf_x2A_2A_2A_2A
	ldrb r0, [r6]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0802320E
	.align 2, 0
_080231C4: .4byte gUnknown_020239F8
_080231C8: .4byte gUnknown_02024C6C
_080231CC: .4byte gBitTable
_080231D0: .4byte gUnknown_02024A60
_080231D4: .4byte gUnknown_02024260
_080231D8: .4byte gUnknown_02024C0C
_080231DC:
	ldr r4, _0802326C
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _0802320E
	ldr r0, _08023270
	ldr r1, _08023274
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8022A3C
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_0802320E:
	ldr r4, _08023278
	ldr r0, [r4, 0xC]
	ands r0, r5
	cmp r0, 0
	beq _080232C2
	ldr r0, [r4, 0x4]
	ands r5, r0
	cmp r5, 0
	beq _080232C2
	ldr r5, _0802327C
	movs r0, 0x3
	strb r0, [r5]
	ldr r0, _08023280
	ldr r2, _08023284
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x3
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _08023290
	ldr r2, _08023288
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0802328C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x2A_2A_2A_2A
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	b _080232C2
	.align 2, 0
_0802326C: .4byte gUnknown_02024D68
_08023270: .4byte 0x02000000
_08023274: .4byte 0x00016068
_08023278: .4byte gBitTable
_0802327C: .4byte gUnknown_02024A60
_08023280: .4byte gUnknown_02024260
_08023284: .4byte 0x00000201
_08023288: .4byte gUnknown_02024C0C
_0802328C: .4byte gUnknown_02024C6C
_08023290:
	ldr r4, _080232D0
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _080232C2
	ldr r0, _080232D4
	ldr r1, _080232D8
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8022A3C
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_080232C2:
	ldr r1, _080232DC
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	mov r12, r1
	b _080232E4
	.align 2, 0
_080232D0: .4byte gUnknown_02024D68
_080232D4: .4byte 0x02000000
_080232D8: .4byte 0x00016069
_080232DC: .4byte gUnknown_02024C10
_080232E0:
	adds r0, r1, 0x6
	str r0, [r6]
_080232E4:
	ldr r0, _08023334
	ldr r0, [r0]
	lsrs r5, r0, 28
	ldr r1, _08023338
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0802333C
	ldr r2, [r4]
	ands r2, r5
	ldr r6, _08023340
	cmp r2, 0
	bne _08023320
	adds r7, r6, 0
	ldrb r0, [r6]
	cmp r2, r0
	bcs _08023320
	adds r3, r1, 0
_08023306:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldrb r2, [r3]
	lsls r0, r2, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _08023320
	ldrb r0, [r7]
	cmp r2, r0
	bcc _08023306
_08023320:
	ldrb r0, [r1]
	ldrb r6, [r6]
	cmp r0, r6
	beq _0802332A
	b _080234D6
_0802332A:
	mov r1, r8
	mov r2, r12
	str r1, [r2]
	b _080234D6
	.align 2, 0
_08023334: .4byte gUnknown_02024C6C
_08023338: .4byte gUnknown_02024C09
_0802333C: .4byte gBitTable
_08023340: .4byte gUnknown_02024A68
_08023344:
	movs r0, 0x80
	ands r0, r2
	movs r5, 0x1
	cmp r0, 0
	beq _08023350
	movs r5, 0
_08023350:
	movs r0, 0x7F
	ands r0, r2
	bl sub_8015150
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08023378
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _0802337C
	ldr r0, [r6]
	adds r0, 0x6
	str r0, [r6]
	b _080234D6
	.align 2, 0
_08023378: .4byte gUnknown_02024D68
_0802337C:
	adds r0, r7, 0
	movs r1, 0x6
	movs r2, 0x6
	bl sub_8018018
	lsls r0, 24
	cmp r0, 0
	beq _080233CC
	ldr r2, _080233BC
	strb r7, [r2]
	ldr r3, _080233C0
	ldr r4, _080233C4
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r3, _080233C8
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r4
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	mov r0, r8
	str r0, [r6]
	b _080234D6
	.align 2, 0
_080233BC: .4byte gUnknown_02024A60
_080233C0: .4byte gUnknown_02024C0C
_080233C4: .4byte gBitTable
_080233C8: .4byte gUnknown_02024C6C
_080233CC:
	ldr r4, _08023474
	strb r7, [r4]
	ldr r3, _08023478
	ldrb r0, [r4]
	ldr r2, _0802347C
	adds r1, r0, r2
	adds r1, r3
	ldr r2, _08023480
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	ldr r1, _08023484
	adds r0, r1
	adds r0, r3
	ldrb r2, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08023488
	adds r3, r1
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	adds r1, r5, 0
	movs r3, 0
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r6]
	adds r0, 0x6
	str r0, [r6]
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _0802342E
	ldr r1, _0802348C
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _0802342E
	adds r0, 0x1
	strb r0, [r1, 0x2]
_0802342E:
	ldr r0, _08023490
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08023498
	ldr r1, _08023474
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08023494
	ldrb r0, [r0]
	cmp r0, 0
	beq _080234D6
	adds r4, r1, 0
_0802344A:
	ldrb r0, [r4]
	cmp r0, r7
	beq _0802345E
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0802345E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08023494
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0802344A
	b _080234D6
	.align 2, 0
_08023474: .4byte gUnknown_02024A60
_08023478: .4byte 0x02000000
_0802347C: .4byte 0x00016064
_08023480: .4byte gUnknown_02024A6A
_08023484: .4byte 0x00016068
_08023488: .4byte 0x0001606c
_0802348C: .4byte gUnknown_030042E0
_08023490: .4byte gUnknown_020239F8
_08023494: .4byte gUnknown_02024A68
_08023498:
	adds r0, r7, 0
	bl battle_get_per_side_status
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	ldr r4, _080234E4
	strb r0, [r4]
	ldr r0, _080234E8
	ldrb r1, [r0]
	ldr r2, _080234EC
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080234C8
	movs r0, 0x2
	eors r3, r0
	strb r3, [r4]
_080234C8:
	movs r0, 0
	movs r1, 0x2
	bl sub_800D1D8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080234D6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080234E4: .4byte gUnknown_02024A60
_080234E8: .4byte gUnknown_02024C0C
_080234EC: .4byte gBitTable
	thumb_func_end atk50_openpartyscreen

	thumb_func_start sub_802331C
sub_802331C: @ 80234F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08023520
	ldr r0, [r0]
	cmp r0, 0
	beq _08023500
	b _080236D2
_08023500:
	ldr r4, _08023524
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r7, _08023528
	strb r0, [r7]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x1
	beq _08023574
	cmp r0, 0x1
	bgt _0802352C
	cmp r0, 0
	beq _08023532
	b _080236CA
	.align 2, 0
_08023520: .4byte gUnknown_02024A64
_08023524: .4byte gUnknown_02024C10
_08023528: .4byte gUnknown_02024A60
_0802352C:
	cmp r0, 0x2
	beq _08023590
	b _080236CA
_08023532:
	movs r3, 0
	ldr r2, _08023564
	ldrb r0, [r2]
	cmp r3, r0
	blt _0802353E
	b _080236CA
_0802353E:
	ldr r0, _08023568
	ldr r1, _0802356C
	movs r5, 0x80
	lsls r5, 2
	adds r4, r2, 0
	ldr r6, _08023570
	adds r2, r0, r6
_0802354C:
	ldrb r0, [r1]
	cmp r0, 0x22
	bne _08023556
	ldrb r0, [r1, 0x1]
	strb r0, [r2]
_08023556:
	adds r1, r5
	adds r2, 0x1
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _0802354C
	b _080236CA
	.align 2, 0
_08023564: .4byte gUnknown_02024A68
_08023568: .4byte 0x02000000
_0802356C: .4byte gUnknown_02024260
_08023570: .4byte 0x00016068
_08023574:
	ldr r0, _0802358C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08023582
	b _080236CA
_08023582:
	ldrb r0, [r7]
	bl sub_8012258
	b _080236CA
	.align 2, 0
_0802358C: .4byte gUnknown_020239F8
_08023590:
	ldr r1, _08023658
	ldr r4, _0802365C
	ldrb r0, [r7]
	lsls r0, 9
	adds r2, r4, 0x1
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r6, _08023660
	ldrb r0, [r7]
	ldr r3, _08023664
	adds r1, r0, r3
	adds r1, r6
	lsls r0, 9
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08023668
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08023678
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r5, _0802366C
	adds r1, r5
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	adds r1, r6
	lsls r0, 9
	adds r2, r4, 0x2
	mov r12, r2
	add r0, r12
	ldrb r2, [r0]
	movs r3, 0xF0
	adds r0, r3, 0
	ands r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r2, _08023670
	adds r1, r2
	adds r1, r6
	lsls r0, 9
	adds r4, 0x3
	mov r8, r4
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r4, 0x2
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	adds r1, r6
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	adds r1, r6
	ldrb r0, [r7]
	lsls r0, 9
	add r0, r12
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, 4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	lsls r1, r4, 1
	adds r1, r4
	ldr r3, _08023674
	adds r1, r3
	adds r1, r6
	ldrb r0, [r7]
	lsls r0, 9
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
	b _0802367E
	.align 2, 0
_08023658: .4byte gUnknown_02024D1E
_0802365C: .4byte gUnknown_02024260
_08023660: .4byte 0x02000000
_08023664: .4byte 0x00016068
_08023668: .4byte gUnknown_020239F8
_0802366C: .4byte 0x0001606c
_08023670: .4byte 0x0001606d
_08023674: .4byte 0x0001606e
_08023678:
	ldrb r0, [r7]
	bl sub_8012258
_0802367E:
	ldr r1, _080236DC
	movs r5, 0xFD
	strb r5, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _080236E0
	ldr r3, _080236E4
	ldrb r0, [r3]
	movs r2, 0x58
	muls r0, r2
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r3]
	muls r0, r2
	adds r0, r4
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r2, _080236E8
	strb r5, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldr r3, _080236EC
	ldrb r0, [r3]
	strb r0, [r2, 0x2]
	ldr r1, _080236F0
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2, 0x4]
_080236CA:
	ldr r1, _080236F4
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
_080236D2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080236DC: .4byte gUnknown_030041C0
_080236E0: .4byte gBattleMons
_080236E4: .4byte gUnknown_02024C07
_080236E8: .4byte gUnknown_03004290
_080236EC: .4byte gUnknown_02024A60
_080236F0: .4byte gUnknown_02024260
_080236F4: .4byte gUnknown_02024C10
	thumb_func_end sub_802331C

	thumb_func_start sub_8023524
sub_8023524: @ 80236F8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r6, _08023804
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08023808
	strb r0, [r4]
	ldrb r0, [r4]
	bl sub_80157C4
	ldr r2, _0802380C
	ldr r1, _08023810
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	ldr r2, _08023814
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	bl battle_side_get_owner
	ldr r5, _08023818
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	mov r8, r0
	ands r0, r1
	cmp r0, 0
	bne _08023850
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08023850
	ldr r1, _0802381C
	mov r9, r1
	ldrb r2, [r4]
	movs r7, 0x58
	adds r0, r2, 0
	muls r0, r7
	adds r1, r0, r1
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08023850
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08023850
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	beq _08023850
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	mov r1, r8
	orrs r1, r2
	strh r1, [r0]
	ldrb r0, [r4]
	bl battle_side_get_owner
	ldr r2, _08023820
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x6]
	movs r1, 0x5
	subs r1, r0
	lsls r1, 25
	lsrs r1, 24
	ldr r5, _08023824
	ldrb r0, [r4]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0, 0x2C]
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _080237E8
	movs r0, 0x1
	str r0, [r5]
_080237E8:
	ldr r0, _08023828
	ldrb r1, [r4]
	ldr r2, _0802382C
	adds r0, r2
	strb r1, [r0]
	bl b_movescr_stack_push_cursor
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _08023834
	ldr r0, _08023830
	str r0, [r6]
	b _0802398A
	.align 2, 0
_08023804: .4byte gUnknown_02024C10
_08023808: .4byte gUnknown_02024A60
_0802380C: .4byte gUnknown_02024C6C
_08023810: .4byte gBitTable
_08023814: .4byte gUnknown_02024D68
_08023818: .4byte gUnknown_02024C7A
_0802381C: .4byte gBattleMons
_08023820: .4byte gUnknown_02024C80
_08023824: .4byte gUnknown_02024BEC
_08023828: .4byte 0x02000000
_0802382C: .4byte 0x00016003
_08023830: .4byte gUnknown_081D919F
_08023834:
	cmp r0, 0x1
	bne _08023844
	ldr r0, _08023840
	str r0, [r6]
	b _0802398A
	.align 2, 0
_08023840: .4byte gUnknown_081D9171
_08023844:
	ldr r0, _0802384C
	str r0, [r6]
	b _0802398A
	.align 2, 0
_0802384C: .4byte gUnknown_081D91CD
_08023850:
	ldr r1, _08023928
	ldr r5, _0802392C
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x36
	bne _08023876
	ldr r1, _08023930
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x18]
_08023876:
	ldrb r1, [r5]
	movs r0, 0
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0802388C
	b _0802398A
_0802388C:
	ldrb r1, [r5]
	movs r0, 0
	movs r2, 0
	bl sub_801A02C
	lsls r0, 24
	cmp r0, 0
	bne _0802398A
	ldrb r0, [r5]
	bl battle_side_get_owner
	ldr r1, _08023934
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r2, [r0]
	ldr r1, _08023938
	ands r1, r2
	strh r1, [r0]
	movs r4, 0
	ldr r0, _0802393C
	ldrb r3, [r0]
	cmp r4, r3
	bge _080238DA
	ldr r6, _08023940
	ldr r3, _08023944
	movs r2, 0xC
	adds r1, r0, 0
_080238C4:
	adds r0, r4, r6
	ldrb r0, [r0]
	ldrb r7, [r5]
	cmp r0, r7
	bne _080238D2
	adds r0, r4, r3
	strb r2, [r0]
_080238D2:
	adds r4, 0x1
	ldrb r0, [r1]
	cmp r4, r0
	blt _080238C4
_080238DA:
	movs r4, 0
	ldr r0, _0802393C
	ldrb r0, [r0]
	cmp r4, r0
	bge _0802390A
	ldr r5, _08023928
_080238E6:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	ldr r1, _08023948
	adds r0, r1
	movs r1, 0x58
	muls r1, r4
	adds r1, r5
	ldrh r1, [r1, 0x28]
	strh r1, [r0]
	adds r4, 0x1
	ldr r0, _0802393C
	ldrb r0, [r0]
	cmp r4, r0
	blt _080238E6
_0802390A:
	ldr r0, _0802394C
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r5, r0, 0
	cmp r1, 0x5
	bne _08023984
	ldr r0, _08023950
	ldr r0, [r0]
	lsrs r4, r0, 28
	ldr r1, _08023954
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, _08023958
	b _0802396A
	.align 2, 0
_08023928: .4byte gBattleMons
_0802392C: .4byte gUnknown_02024A60
_08023930: .4byte gUnknown_02024CA8
_08023934: .4byte gUnknown_02024C7A
_08023938: .4byte 0x0000fdff
_0802393C: .4byte gUnknown_02024A68
_08023940: .4byte gUnknown_02024A7A
_08023944: .4byte gUnknown_02024A76
_08023948: .4byte 0x020160bc
_0802394C: .4byte gUnknown_02024C10
_08023950: .4byte gUnknown_02024C6C
_08023954: .4byte gUnknown_02024C09
_08023958: .4byte gBitTable
_0802395C:
	ldr r0, _08023998
	ldrb r3, [r1]
	ldrb r0, [r0]
	cmp r3, r0
	bcs _08023984
	adds r0, r3, 0x1
	strb r0, [r1]
_0802396A:
	ldrb r0, [r1]
	lsls r0, 2
	adds r0, r2
	ldr r3, [r0]
	adds r0, r4, 0
	ands r0, r3
	cmp r0, 0
	beq _0802395C
	ldr r0, _0802399C
	ldrb r0, [r0]
	ands r0, r3
	cmp r0, 0
	bne _0802395C
_08023984:
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
_0802398A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023998: .4byte gUnknown_02024A68
_0802399C: .4byte gUnknown_02024C0C
	thumb_func_end sub_8023524

	thumb_func_start sub_80237CC
sub_80237CC: @ 80239A0
	push {lr}
	ldr r0, _080239B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	bne _080239B4
	movs r0, 0
	b _080239B6
	.align 2, 0
_080239B0: .4byte gUnknown_02024C10
_080239B4:
	movs r0, 0x1
_080239B6:
	bl battle_get_side_with_given_state
	ldr r1, _080239D8
	strb r0, [r1]
	movs r0, 0
	bl dp01_build_cmdbuf_x08_8_8_8
	ldr r0, _080239D8
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080239DC
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080239D8: .4byte gUnknown_02024A60
_080239DC: .4byte gUnknown_02024C10
	thumb_func_end sub_80237CC

	thumb_func_start atk54_802511C
atk54_802511C: @ 80239E0
	push {r4,r5,lr}
	ldr r5, _08023A10
	ldr r0, _08023A14
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _08023A18
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl dp01_build_cmdbuf_x2B_aa_0
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023A10: .4byte gUnknown_02024A60
_08023A14: .4byte gUnknown_02024C07
_08023A18: .4byte gUnknown_02024C10
	thumb_func_end atk54_802511C

	thumb_func_start sub_8023848
sub_8023848: @ 8023A1C
	push {r4,r5,lr}
	ldr r5, _08023A4C
	ldr r0, _08023A50
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r4, _08023A54
	ldr r0, [r4]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0
	bl sub_800D074
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r4]
	adds r0, 0x3
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023A4C: .4byte gUnknown_02024A60
_08023A50: .4byte gUnknown_02024C07
_08023A54: .4byte gUnknown_02024C10
	thumb_func_end sub_8023848

	thumb_func_start atk56_8025194
atk56_8025194: @ 8023A58
	push {r4,r5,lr}
	ldr r5, _08023A80
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08023A84
	strb r0, [r4]
	movs r0, 0
	bl dp01_build_cmdbuf_x2D_2D_2D_2D
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023A80: .4byte gUnknown_02024C10
_08023A84: .4byte gUnknown_02024A60
	thumb_func_end atk56_8025194

	thumb_func_start atk57_80251C4_flee
atk57_80251C4_flee: @ 8023A88
	push {r4,lr}
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _08023AB4
	strb r0, [r4]
	ldr r0, _08023AB8
	ldrb r1, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x37_a
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08023ABC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023AB4: .4byte gUnknown_02024A60
_08023AB8: .4byte gUnknown_02024D26
_08023ABC: .4byte gUnknown_02024C10
	thumb_func_end atk57_80251C4_flee

	thumb_func_start atk58_cmd58
atk58_cmd58: @ 8023AC0
	push {r4,r5,lr}
	ldr r5, _08023AEC
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08023AF0
	strb r0, [r4]
	movs r0, 0
	movs r1, 0x1
	bl dp01_build_cmdbuf_x06_a
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023AEC: .4byte gUnknown_02024C10
_08023AF0: .4byte gUnknown_02024A60
	thumb_func_end atk58_cmd58

	thumb_func_start atk59_8025230
atk59_8025230: @ 8023AF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08023B70
	ldr r2, [r0]
	ldrb r6, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r6, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r6, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r6, r0
	ldrb r4, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r2, 0x8]
	lsls r0, 24
	orrs r4, r0
	ldr r0, _08023B74
	ldr r1, _08023B78
	adds r7, r0, r1
	ldrb r1, [r7]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08023B7C
	adds r0, r1
	ldrb r1, [r2, 0x9]
	bl sub_803B7C8
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08023B80
	cmp r5, r0
	bne _08023B66
	mov r9, r7
	mov r8, r5
	movs r7, 0x64
_08023B4E:
	mov r3, r9
	ldrb r0, [r3]
	muls r0, r7
	ldr r1, _08023B7C
	adds r0, r1
	movs r1, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	beq _08023B4E
_08023B66:
	cmp r5, 0
	bne _08023B84
	ldr r0, _08023B70
	str r4, [r0]
	b _08023C2C
	.align 2, 0
_08023B70: .4byte gUnknown_02024C10
_08023B74: .4byte 0x02000000
_08023B78: .4byte 0x00016018
_08023B7C: .4byte gPlayerParty
_08023B80: .4byte 0x0000fffe
_08023B84:
	ldr r0, _08023B94
	cmp r5, r0
	bne _08023B9C
	ldr r1, _08023B98
	ldr r0, [r1]
	adds r0, 0xA
	str r0, [r1]
	b _08023C2C
	.align 2, 0
_08023B94: .4byte 0x0000ffff
_08023B98: .4byte gUnknown_02024C10
_08023B9C:
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08023C38
	strb r0, [r1]
	ldr r0, _08023C3C
	ldrb r2, [r1]
	lsls r1, r2, 1
	adds r1, r0
	ldr r0, _08023C40
	ldr r3, _08023C44
	adds r0, r3
	ldrh r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08023BDC
	ldr r3, _08023C48
	movs r0, 0x58
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08023BDC
	adds r0, r2, r3
	adds r1, r5, 0
	bl GiveMoveToBattleMon
_08023BDC:
	ldr r0, _08023C4C
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08023C28
	movs r0, 0x2
	bl battle_get_side_with_given_state
	ldr r1, _08023C38
	strb r0, [r1]
	ldr r0, _08023C3C
	ldrb r2, [r1]
	lsls r1, r2, 1
	adds r1, r0
	ldr r0, _08023C40
	ldr r3, _08023C44
	adds r0, r3
	ldrh r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08023C28
	ldr r3, _08023C48
	movs r0, 0x58
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08023C28
	adds r0, r2, r3
	adds r1, r5, 0
	bl GiveMoveToBattleMon
_08023C28:
	ldr r0, _08023C50
	str r6, [r0]
_08023C2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023C38: .4byte gUnknown_02024A60
_08023C3C: .4byte gUnknown_02024A6A
_08023C40: .4byte 0x02000000
_08023C44: .4byte 0x00016018
_08023C48: .4byte gBattleMons
_08023C4C: .4byte gUnknown_020239F8
_08023C50: .4byte gUnknown_02024C10
	thumb_func_end atk59_8025230

	thumb_func_start sub_8023A80
sub_8023A80: @ 8023C54
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x18
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl sub_802BBD4
	ldr r4, _08023C9C
	ldr r1, _08023CA0
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x9
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x19
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08023CA4
	ldr r3, _08023CA8
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023C9C: .4byte gUnknown_03004210
_08023CA0: .4byte gUnknown_08400D7A
_08023CA4: .4byte 0x0000ffff
_08023CA8: .4byte 0x00002d9f
	thumb_func_end sub_8023A80

	thumb_func_start sub_8023AD8
sub_8023AD8: @ 8023CAC
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x18
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl sub_802BBD4
	bl sub_814A7FC
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_8023AD8

	thumb_func_start sub_8023AF8
sub_8023AF8: @ 8023CCC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _08023CF8
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08023CFC
	ldr r2, _08023D00
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bls _08023CEC
	b _08024030
_08023CEC:
	lsls r0, 2
	ldr r1, _08023D04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023CF8: .4byte gUnknown_02024A60
_08023CFC: .4byte 0x02000000
_08023D00: .4byte 0x0001601a
_08023D04: .4byte _08023D08
	.align 2, 0
_08023D08:
	.4byte _08023D20
	.4byte _08023D48
	.4byte _08023E04
	.4byte _08023E58
	.4byte _0802400C
	.4byte _08024020
_08023D20:
	bl sub_8023A80
	ldr r1, _08023D3C
	ldr r0, _08023D40
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08023D44
	strb r2, [r0, 0x1]
	bl sub_802BC6C
	b _08024030
	.align 2, 0
_08023D3C: .4byte 0x02000000
_08023D40: .4byte 0x0001601a
_08023D44: .4byte gUnknown_02024D1E
_08023D48:
	ldr r0, _08023DD0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08023D6E
	ldr r4, _08023DD4
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08023D6E
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08023D6E:
	ldr r0, _08023DD0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08023D94
	ldr r4, _08023DD4
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08023D94
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08023D94:
	ldr r0, _08023DD0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08023DE0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08023DD4
	ldrb r4, [r0, 0x1]
	cmp r4, 0
	bne _08023DF0
	bl sub_8023AD8
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08023DD8
	ldr r2, _08023DDC
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _0802402E
	.align 2, 0
_08023DD0: .4byte gMain
_08023DD4: .4byte gUnknown_02024D1E
_08023DD8: .4byte 0x02000000
_08023DDC: .4byte 0x0001601a
_08023DE0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08023DEA
	b _08024030
_08023DEA:
	movs r0, 0x5
	bl PlaySE
_08023DF0:
	ldr r0, _08023DFC
	ldr r1, _08023E00
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _08024030
	.align 2, 0
_08023DFC: .4byte 0x02000000
_08023E00: .4byte 0x0001601a
_08023E04:
	ldr r0, _08023E3C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08023E12
	b _08024030
_08023E12:
	ldr r0, _08023E40
	ldr r2, _08023E44
	adds r1, r5, r2
	ldrb r1, [r1]
	ldr r2, _08023E48
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08023E4C
	ldr r4, _08023E50
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldr r0, _08023E54
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _0802402E
	.align 2, 0
_08023E3C: .4byte gPaletteFade
_08023E40: .4byte gPlayerParty
_08023E44: .4byte 0x00016018
_08023E48: .4byte gPlayerPartyCount
_08023E4C: .4byte sub_807AD58
_08023E50: .4byte word_2024E82
_08023E54: .4byte 0x0001601a
_08023E58:
	ldr r0, _08023E88
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08023E66
	b _08024030
_08023E66:
	ldr r0, _08023E8C
	ldr r1, [r0, 0x4]
	ldr r0, _08023E90
	cmp r1, r0
	beq _08023E72
	b _08024030
_08023E72:
	bl sub_809FA30
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bne _08023E9C
	ldr r0, _08023E94
	ldr r1, _08023E98
	adds r0, r1
	strb r5, [r0]
	b _08024030
	.align 2, 0
_08023E88: .4byte gPaletteFade
_08023E8C: .4byte gMain
_08023E90: .4byte sub_800F808
_08023E94: .4byte 0x02000000
_08023E98: .4byte 0x0001601a
_08023E9C:
	ldr r2, _08023EDC
	mov r9, r2
	ldr r6, _08023EE0
	add r6, r9
	ldrb r0, [r6]
	movs r1, 0x64
	mov r8, r1
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldr r7, _08023EE4
	adds r0, r7
	adds r1, r5, 0
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _08023EF4
	ldr r0, _08023EE8
	ldr r1, _08023EEC
	ldrb r1, [r1]
	bl b_std_message
	ldr r1, _08023EF0
	add r1, r9
	movs r0, 0x5
	b _0802402E
	.align 2, 0
_08023EDC: .4byte 0x02000000
_08023EE0: .4byte 0x00016018
_08023EE4: .4byte gPlayerParty
_08023EE8: .4byte 0x0000013f
_08023EEC: .4byte gUnknown_02024A60
_08023EF0: .4byte 0x0001601a
_08023EF4:
	ldr r3, _08023FE4
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
	ldr r1, _08023FE8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	adds r1, r5, 0
	bl RemoveMonPPBonus
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	ldr r7, _08023FEC
	ldrh r1, [r7]
	adds r2, r5, 0
	bl SetMonMoveSlot
	ldr r0, _08023FF0
	ldrh r0, [r0]
	ldrb r6, [r6]
	cmp r0, r6
	bne _08023F84
	ldr r4, _08023FF4
	ldr r0, [r4, 0x50]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08023F84
	ldr r0, _08023FF8
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08023FFC
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08023F84
	adds r0, r4, 0
	adds r1, r5, 0
	bl RemoveBattleMonPPBonus
	ldrh r1, [r7]
	adds r0, r4, 0
	adds r2, r5, 0
	bl SetBattleMonMoveSlot
_08023F84:
	ldr r0, _08024000
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08024030
	ldr r0, _08023FF0
	ldr r1, _08024004
	ldr r2, _08024008
	adds r1, r2
	ldrh r0, [r0, 0x4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08024030
	ldr r4, _08023FF4
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08024030
	ldr r0, _08023FF8
	adds r0, 0x50
	ldrb r1, [r0]
	lsrs r1, 4
	ldr r2, _08023FFC
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08024030
	adds r4, 0xB0
	adds r0, r4, 0
	adds r1, r5, 0
	bl RemoveBattleMonPPBonus
	ldr r0, _08023FEC
	ldrh r1, [r0]
	adds r0, r4, 0
	adds r2, r5, 0
	bl SetBattleMonMoveSlot
	b _08024030
	.align 2, 0
_08023FE4: .4byte gUnknown_02024C10
_08023FE8: .4byte gUnknown_03004290
_08023FEC: .4byte word_2024E82
_08023FF0: .4byte gUnknown_02024A6A
_08023FF4: .4byte gBattleMons
_08023FF8: .4byte gUnknown_02024CA8
_08023FFC: .4byte gBitTable
_08024000: .4byte gUnknown_020239F8
_08024004: .4byte 0x02000000
_08024008: .4byte 0x00016018
_0802400C:
	bl sub_8023AD8
	ldr r1, _0802401C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08024030
	.align 2, 0
_0802401C: .4byte gUnknown_02024C10
_08024020:
	ldr r0, _08024040
	ldr r0, [r0]
	cmp r0, 0
	bne _08024030
	ldr r2, _08024044
	adds r1, r5, r2
	movs r0, 0x2
_0802402E:
	strb r0, [r1]
_08024030:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024040: .4byte gUnknown_02024A64
_08024044: .4byte 0x0001601a
	thumb_func_end sub_8023AF8

	thumb_func_start atk5B_80256E0
atk5B_80256E0: @ 8024048
	push {r4,r5,lr}
	ldr r0, _0802405C
	ldr r1, _08024060
	adds r5, r0, r1
	ldrb r4, [r5]
	cmp r4, 0
	beq _08024064
	cmp r4, 0x1
	beq _0802407C
	b _0802414C
	.align 2, 0
_0802405C: .4byte 0x02000000
_08024060: .4byte 0x0001601a
_08024064:
	bl sub_8023A80
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldr r0, _08024078
	strb r4, [r0, 0x1]
	bl sub_802BC6C
	b _0802414C
	.align 2, 0
_08024078: .4byte gUnknown_02024D1E
_0802407C:
	ldr r0, _08024100
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080240A2
	ldr r4, _08024104
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _080240A2
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_080240A2:
	ldr r0, _08024100
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080240C8
	ldr r4, _08024104
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080240C8
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_080240C8:
	ldr r0, _08024100
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08024120
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08024104
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0802410C
	ldr r3, _08024108
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
	b _08024114
	.align 2, 0
_08024100: .4byte gMain
_08024104: .4byte gUnknown_02024D1E
_08024108: .4byte gUnknown_02024C10
_0802410C:
	ldr r1, _0802411C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08024114:
	bl sub_8023AD8
	b _0802414C
	.align 2, 0
_0802411C: .4byte gUnknown_02024C10
_08024120:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802414C
	movs r0, 0x5
	bl PlaySE
	ldr r3, _08024154
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
	bl sub_8023AD8
_0802414C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024154: .4byte gUnknown_02024C10
	thumb_func_end atk5B_80256E0

	thumb_func_start atk5C_cmd5c
atk5C_cmd5c: @ 8024158
	push {r4,lr}
	ldr r4, _080241C4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r2, _080241C8
	strb r0, [r2]
	ldr r0, _080241CC
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	bne _080241DC
	ldr r0, _080241D0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	beq _080241AA
	ldr r1, _080241D4
	ldrb r2, [r2]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _080241AA
	ldr r0, _080241D8
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _080241DC
_080241AA:
	movs r0, 0
	bl dp01_build_cmdbuf_x29_29_29_29
	ldr r0, _080241C8
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080241C4
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	b _080241E2
	.align 2, 0
_080241C4: .4byte gUnknown_02024C10
_080241C8: .4byte gUnknown_02024A60
_080241CC: .4byte gUnknown_02024C68
_080241D0: .4byte gUnknown_02024C6C
_080241D4: .4byte gBattleMons
_080241D8: .4byte gUnknown_02024CA8
_080241DC:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
_080241E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atk5C_cmd5c

	thumb_func_start sub_8024014
sub_8024014: @ 80241E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _0802421C
	ldrh r2, [r0]
	movs r1, 0x80
	lsls r1, 3
	cmp r2, r1
	bne _0802422C
	ldr r0, _08024220
	adds r1, r0, 0
	adds r1, 0x94
	ldrb r2, [r1]
	ldr r1, _08024224
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _08024228
	mov r8, r0
	b _08024314
	.align 2, 0
_0802421C: .4byte gTrainerBattleOpponent
_08024220: .4byte 0x02017000
_08024224: .4byte 0xfffff056
_08024228: .4byte 0x02025bc4
_0802422C:
	ldr r2, _08024248
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r3, r0, 3
	adds r4, r3, r2
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _08024282
	cmp r1, 0x1
	bgt _0802424C
	cmp r1, 0
	beq _08024256
	b _08024298
	.align 2, 0
_08024248: .4byte gTrainers
_0802424C:
	cmp r1, 0x2
	beq _0802426C
	cmp r1, 0x3
	beq _08024282
	b _08024298
_08024256:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	subs r0, 0x8
	b _08024296
_0802426C:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	subs r0, 0x8
	b _08024296
_08024282:
	adds r0, r2, 0
	adds r0, 0x24
	adds r0, r3, r0
	ldr r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	subs r0, 0x10
_08024296:
	ldrb r5, [r0, 0x2]
_08024298:
	ldr r0, _080242F4
	lsls r1, r6, 2
	adds r3, r1, r0
	ldrb r1, [r3]
	mov r12, r0
	lsls r4, r5, 2
	ldr r5, _080242F8
	ldr r7, _080242FC
	ldr r0, _08024300
	mov r8, r0
	cmp r1, 0xFF
	beq _080242D2
	ldr r2, _08024304
	ldr r0, _08024308
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r2, [r0, 0x1]
	adds r1, r3, 0
_080242C2:
	ldrb r0, [r1]
	cmp r0, r2
	beq _080242D2
	adds r1, 0x4
	adds r6, 0x1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080242C2
_080242D2:
	ldr r1, _0802430C
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, r4, 0
	muls r3, r0
	lsls r0, r6, 2
	add r0, r12
	ldrb r2, [r0, 0x1]
	ldrh r1, [r7]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08024310
	lsls r0, r2, 1
	adds r4, r3, 0
	muls r4, r0
	b _08024314
	.align 2, 0
_080242F4: .4byte gTrainerMoney
_080242F8: .4byte 0x02000000
_080242FC: .4byte gUnknown_020239F8
_08024300: .4byte 0x02025bc4
_08024304: .4byte gTrainers
_08024308: .4byte gTrainerBattleOpponent
_0802430C: .4byte 0x00016056
_08024310:
	adds r4, r3, 0
	muls r4, r2
_08024314:
	mov r0, r8
	adds r1, r4, 0
	bl sub_80B79B8
	ldr r1, _08024360
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x4
	strb r0, [r1, 0x2]
	movs r0, 0x5
	strb r0, [r1, 0x3]
	strb r4, [r1, 0x4]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r4
	lsrs r0, 8
	strb r0, [r1, 0x5]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r4
	lsrs r0, 16
	strb r0, [r1, 0x6]
	lsrs r0, r4, 24
	strb r0, [r1, 0x7]
	movs r0, 0xFF
	strb r0, [r1, 0x8]
	ldr r1, _08024364
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024360: .4byte gUnknown_030041C0
_08024364: .4byte gUnknown_02024C10
	thumb_func_end sub_8024014

	thumb_func_start atk5E_8025A70
atk5E_8025A70: @ 8024368
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _0802438C
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r6, _08024390
	strb r0, [r6]
	ldr r5, _08024394
	ldrb r0, [r5]
	mov r8, r4
	cmp r0, 0
	beq _08024398
	cmp r0, 0x1
	beq _080243B0
	b _08024404
	.align 2, 0
_0802438C: .4byte gUnknown_02024C10
_08024390: .4byte gUnknown_02024A60
_08024394: .4byte gUnknown_02024D1E
_08024398:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x00_a_b_0
	ldrb r0, [r6]
	bl dp01_battle_side_mark_buffer_for_execution
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _08024404
_080243B0:
	ldr r0, _08024410
	ldr r0, [r0]
	cmp r0, 0
	bne _08024404
	ldrb r0, [r6]
	lsls r0, 9
	ldr r1, _08024414
	adds r0, r1
	mov r12, r0
	movs r2, 0
	adds r4, r6, 0
	movs r5, 0x58
	ldr r6, _08024418
	adds r7, r6, 0
	subs r7, 0x18
	mov r3, r12
	adds r3, 0xC
_080243D2:
	lsls r1, r2, 1
	ldrb r0, [r4]
	muls r0, r5
	adds r1, r0
	adds r1, r7
	ldrh r0, [r3]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r2, r1
	adds r1, r6
	mov r0, r12
	adds r0, 0x24
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _080243D2
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08024404:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024410: .4byte gUnknown_02024A64
_08024414: .4byte gUnknown_02024264
_08024418: .4byte gUnknown_02024AA4
	thumb_func_end atk5E_8025A70

	thumb_func_start atk5F_8025B24
atk5F_8025B24: @ 802441C
	push {lr}
	ldr r0, _08024444
	ldr r2, _08024448
	ldrb r3, [r2]
	strb r3, [r0]
	ldr r1, _0802444C
	ldrb r0, [r1]
	strb r0, [r2]
	strb r3, [r1]
	ldr r2, _08024450
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 5
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _08024458
	ldr r0, _08024454
	ands r1, r0
	b _0802445A
	.align 2, 0
_08024444: .4byte gUnknown_02024A60
_08024448: .4byte gUnknown_02024C07
_0802444C: .4byte gUnknown_02024C08
_08024450: .4byte gUnknown_02024C6C
_08024454: .4byte 0xffffefff
_08024458:
	orrs r1, r3
_0802445A:
	str r1, [r2]
	ldr r1, _08024468
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08024468: .4byte gUnknown_02024C10
	thumb_func_end atk5F_8025B24

	thumb_func_start atk60_cmd60
atk60_cmd60: @ 802446C
	push {lr}
	ldr r0, _08024494
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08024486
	ldr r0, _08024498
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sav12_xor_increment
_08024486:
	ldr r1, _08024498
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08024494: .4byte gUnknown_02024C07
_08024498: .4byte gUnknown_02024C10
	thumb_func_end atk60_cmd60

	thumb_func_start atk61_8025BA4
atk61_8025BA4: @ 802449C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	ldr r0, _08024500
	ldr r0, [r0]
	cmp r0, 0
	bne _08024550
	ldr r0, _08024504
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _08024508
	strb r0, [r1]
	ldrb r0, [r1]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _0802450C
	mov r8, r1
	cmp r0, 0
	bne _080244CE
	ldr r0, _08024510
	mov r8, r0
_080244CE:
	movs r7, 0
	add r6, sp, 0x4
	mov r5, sp
_080244D4:
	movs r0, 0x64
	muls r0, r7
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080244F8
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08024518
_080244F8:
	ldr r0, _08024514
	strh r0, [r5]
	movs r0, 0
	b _0802452A
	.align 2, 0
_08024500: .4byte gUnknown_02024A64
_08024504: .4byte gUnknown_02024C10
_08024508: .4byte gUnknown_02024A60
_0802450C: .4byte gEnemyParty
_08024510: .4byte gPlayerParty
_08024514: .4byte 0x0000ffff
_08024518:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_0802452A:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _080244D4
	movs r0, 0
	mov r1, sp
	movs r2, 0x1
	bl dp01_build_cmdbuf_x30_TODO
	ldr r0, _0802455C
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08024560
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08024550:
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802455C: .4byte gUnknown_02024A60
_08024560: .4byte gUnknown_02024C10
	thumb_func_end atk61_8025BA4

	thumb_func_start atk62_08025C6C
atk62_08025C6C: @ 8024564
	push {r4,r5,lr}
	ldr r5, _0802458C
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08024590
	strb r0, [r4]
	movs r0, 0
	bl dp01_build_cmdbuf_x31_31_31_31
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802458C: .4byte gUnknown_02024C10
_08024590: .4byte gUnknown_02024A60
	thumb_func_end atk62_08025C6C

	thumb_func_start atk63_jumptoattack
atk63_jumptoattack: @ 8024594
	push {r4,lr}
	ldr r0, _080245AC
	ldr r1, [r0]
	ldrb r1, [r1, 0x1]
	adds r4, r0, 0
	cmp r1, 0
	beq _080245B8
	ldr r0, _080245B0
	ldr r1, _080245B4
	ldrh r1, [r1]
	strh r1, [r0]
	b _080245C6
	.align 2, 0
_080245AC: .4byte gUnknown_02024C10
_080245B0: .4byte gUnknown_02024BE6
_080245B4: .4byte gUnknown_02024BEA
_080245B8:
	ldr r2, _080245E4
	ldr r1, _080245E8
	ldr r0, _080245EC
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r2]
	adds r0, r1, 0
_080245C6:
	ldr r3, _080245F0
	ldr r2, _080245F4
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080245E4: .4byte gUnknown_02024BE8
_080245E8: .4byte gUnknown_02024BE6
_080245EC: .4byte gUnknown_02024BEA
_080245F0: .4byte gUnknown_081D6BBC
_080245F4: .4byte gBattleMoves
	thumb_func_end atk63_jumptoattack

	thumb_func_start atk64_statusanimation
atk64_statusanimation: @ 80245F8
	push {r4,lr}
	ldr r0, _08024668
	ldr r0, [r0]
	cmp r0, 0
	bne _08024660
	ldr r0, _0802466C
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08024670
	strb r0, [r4]
	ldr r1, _08024674
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08024678
	ands r0, r1
	cmp r0, 0
	bne _08024658
	ldr r0, _0802467C
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _08024658
	ldr r0, _08024680
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08024658
	ldr r1, _08024684
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x4C
	adds r0, r1
	ldr r2, [r0]
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x1B_aaaa_b
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08024658:
	ldr r1, _0802466C
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_08024660:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024668: .4byte gUnknown_02024A64
_0802466C: .4byte gUnknown_02024C10
_08024670: .4byte gUnknown_02024A60
_08024674: .4byte gUnknown_02024C98
_08024678: .4byte 0x000400c0
_0802467C: .4byte gUnknown_02024CA8
_08024680: .4byte gUnknown_02024C6C
_08024684: .4byte gBattleMons
	thumb_func_end atk64_statusanimation

	thumb_func_start atk65_8025D90
atk65_8025D90: @ 8024688
	push {r4,r5,lr}
	ldr r0, _08024710
	ldr r0, [r0]
	cmp r0, 0
	bne _08024708
	ldr r4, _08024714
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r5, _08024718
	strb r0, [r5]
	ldr r1, [r4]
	ldrb r3, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 24
	orrs r3, r0
	ldr r1, _0802471C
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08024720
	ands r0, r1
	cmp r0, 0
	bne _08024700
	ldr r0, _08024724
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _08024700
	ldr r0, _08024728
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08024700
	ldr r1, _0802472C
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r2, [r0]
	ands r2, r3
	movs r0, 0
	movs r1, 0x1
	bl dp01_build_cmdbuf_x1B_aaaa_b
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
_08024700:
	ldr r1, _08024714
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
_08024708:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024710: .4byte gUnknown_02024A64
_08024714: .4byte gUnknown_02024C10
_08024718: .4byte gUnknown_02024A60
_0802471C: .4byte gUnknown_02024C98
_08024720: .4byte 0x000400c0
_08024724: .4byte gUnknown_02024CA8
_08024728: .4byte gUnknown_02024C6C
_0802472C: .4byte gBattleMons
	thumb_func_end atk65_8025D90

	thumb_func_start atk66_8025E38
atk66_8025E38: @ 8024730
	push {r4,r5,lr}
	ldr r0, _080247A8
	ldr r0, [r0]
	cmp r0, 0
	bne _080247A2
	ldr r4, _080247AC
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r5, _080247B0
	strb r0, [r5]
	ldr r4, [r4]
	ldrb r2, [r4, 0x3]
	ldrb r0, [r4, 0x4]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r4, 0x5]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r4, 0x6]
	lsls r0, 24
	orrs r2, r0
	ldr r1, _080247B4
	ldrb r3, [r5]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080247B8
	ands r0, r1
	cmp r0, 0
	bne _0802479A
	ldr r0, _080247BC
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	cmp r0, 0
	bne _0802479A
	ldr r0, _080247C0
	ldr r0, [r0]
	movs r1, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802479A
	ldrb r1, [r4, 0x2]
	movs r0, 0
	bl dp01_build_cmdbuf_x1B_aaaa_b
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
_0802479A:
	ldr r1, _080247AC
	ldr r0, [r1]
	adds r0, 0x7
	str r0, [r1]
_080247A2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080247A8: .4byte gUnknown_02024A64
_080247AC: .4byte gUnknown_02024C10
_080247B0: .4byte gUnknown_02024A60
_080247B4: .4byte gUnknown_02024C98
_080247B8: .4byte 0x000400c0
_080247BC: .4byte gUnknown_02024CA8
_080247C0: .4byte gUnknown_02024C6C
	thumb_func_end atk66_8025E38

	thumb_func_start atk67_8025ECC
atk67_8025ECC: @ 80247C4
	push {r4,r5,lr}
	ldr r5, _080247D4
	ldrb r4, [r5]
	cmp r4, 0
	beq _080247D8
	cmp r4, 0x1
	beq _080247EA
	b _0802486A
	.align 2, 0
_080247D4: .4byte gUnknown_02024D1E
_080247D8:
	bl sub_8023A80
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	strb r4, [r5, 0x1]
	bl sub_802BC6C
	b _0802486A
_080247EA:
	ldr r0, _08024848
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802480E
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _0802480E
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0
	strb r0, [r5, 0x1]
	bl sub_802BC6C
_0802480E:
	ldr r0, _08024848
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08024834
	ldr r4, _0802484C
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08024834
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08024834:
	ldr r0, _08024848
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08024850
	ldr r1, _0802484C
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _08024858
	.align 2, 0
_08024848: .4byte gMain
_0802484C: .4byte gUnknown_02024D1E
_08024850:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802486A
_08024858:
	movs r0, 0x5
	bl PlaySE
	bl sub_8023AD8
	ldr r1, _08024870
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_0802486A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024870: .4byte gUnknown_02024C10
	thumb_func_end atk67_8025ECC

	thumb_func_start sub_80246A0
sub_80246A0: @ 8024874
	push {r4,r5,lr}
	movs r1, 0
	ldr r2, _080248A0
	ldr r5, _080248A4
	ldrb r0, [r2]
	cmp r1, r0
	bge _08024892
	ldr r4, _080248A8
	movs r3, 0xC
_08024886:
	adds r0, r1, r4
	strb r3, [r0]
	adds r1, 0x1
	ldrb r0, [r2]
	cmp r1, r0
	blt _08024886
_08024892:
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080248A0: .4byte gUnknown_02024A68
_080248A4: .4byte gUnknown_02024C10
_080248A8: .4byte gUnknown_02024A76
	thumb_func_end sub_80246A0

	thumb_func_start atk69_8025FE0
atk69_8025FE0: @ 80248AC
	push {r4-r7,lr}
	ldr r7, _080248D4
	ldr r6, _080248D8
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _080248E0
	ldr r1, _080248DC
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _080248FA
	.align 2, 0
_080248D4: .4byte gBattleMons
_080248D8: .4byte gUnknown_02024C08
_080248DC: .4byte gEnigmaBerries
_080248E0:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r6, r0, 24
_080248FA:
	ldr r1, _080249BC
	ldr r5, _080249C0
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _08024938
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _08024938
	ldrb r0, [r5]
	movs r1, 0x27
	bl sub_81074F8
	ldr r2, _080249C4
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_08024938:
	ldr r2, _080249C8
	ldr r3, _080249C0
	ldrb r4, [r3]
	movs r0, 0x58
	muls r0, r4
	adds r1, r2, 0
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 17
	ands r1, r0
	adds r5, r2, 0
	cmp r1, 0
	bne _08024A08
	ldr r2, _080249CC
	ldr r0, _080249D0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x65
	beq _0802498A
	ldr r0, _080249D4
	lsls r1, r4, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _0802498A
	ldr r0, _080249C4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _08024A08
_0802498A:
	ldrb r0, [r3]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	ldrh r1, [r0, 0x28]
	ldr r2, _080249D8
	ldr r0, [r2]
	cmp r1, r0
	bgt _08024A08
	subs r0, r1, 0x1
	str r0, [r2]
	ldr r1, _080249D4
	ldrb r3, [r3]
	lsls r0, r3, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 30
	cmp r0, 0
	bge _080249E0
	ldr r0, _080249DC
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	b _08024A08
	.align 2, 0
_080249BC: .4byte gUnknown_02024C0B
_080249C0: .4byte gUnknown_02024C08
_080249C4: .4byte gUnknown_02024D68
_080249C8: .4byte gBattleMons
_080249CC: .4byte gBattleMoves
_080249D0: .4byte gUnknown_02024BE6
_080249D4: .4byte gUnknown_02024D28
_080249D8: .4byte gUnknown_02024BEC
_080249DC: .4byte gUnknown_02024C68
_080249E0:
	ldr r0, _08024A18
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _08024A08
	ldr r2, _08024A1C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024A20
	adds r0, r3, 0
	muls r0, r4
	adds r0, r5
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
_08024A08:
	ldr r1, _08024A24
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024A18: .4byte gUnknown_02024D68
_08024A1C: .4byte gUnknown_02024C68
_08024A20: .4byte gUnknown_02024C04
_08024A24: .4byte gUnknown_02024C10
	thumb_func_end atk69_8025FE0

	thumb_func_start atk6A_stash_item_for_side
atk6A_stash_item_for_side: @ 8024A28
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08024A84
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r5, _08024A88
	strb r0, [r5]
	ldrb r4, [r5]
	lsls r1, r4, 1
	ldr r0, _08024A8C
	adds r1, r0
	ldr r2, _08024A90
	movs r3, 0x58
	adds r0, r4, 0
	muls r0, r3
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	muls r0, r3
	adds r2, 0x2E
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024A84: .4byte gUnknown_02024C10
_08024A88: .4byte gUnknown_02024A60
_08024A8C: .4byte 0x020160cc
_08024A90: .4byte gBattleMons
	thumb_func_end atk6A_stash_item_for_side

	thumb_func_start sub_80248C0
sub_80248C0: @ 8024A94
	ldr r1, _08024AC0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _08024AC4
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _08024AC8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08024ACC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08024AC0: .4byte gUnknown_030041C0
_08024AC4: .4byte gUnknown_02024C07
_08024AC8: .4byte gUnknown_02024A6A
_08024ACC: .4byte gUnknown_02024C10
	thumb_func_end sub_80248C0

	thumb_func_start sub_80248FC
sub_80248FC: @ 8024AD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r1, 0
	movs r7, 0
	ldr r0, _08024AFC
	mov r10, r0
	ldr r4, _08024B00
	add r4, r10
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08024AF0
	b _08024CC8
_08024AF0:
	cmp r0, 0x1
	bgt _08024B04
	cmp r0, 0
	beq _08024B12
	b _08024E0C
	.align 2, 0
_08024AFC: .4byte 0x02000000
_08024B00: .4byte 0x0001609c
_08024B04:
	cmp r0, 0x2
	bne _08024B0A
	b _08024DD8
_08024B0A:
	cmp r0, 0x3
	bne _08024B10
	b _08024E04
_08024B10:
	b _08024E0C
_08024B12:
	str r1, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl sub_802BBD4
	ldr r0, _08024B70
	ldr r1, _08024B74
	bl StringCopy
	adds r5, r0, 0
	movs r1, 0
	mov r8, r1
_08024B2E:
	movs r2, 0
	mov r9, r2
	ldr r0, _08024B78
	mov r1, r8
	lsls r4, r1, 2
	adds r0, r4, r0
	ldr r1, [r0]
	adds r0, r5, 0
	bl StringAppend
	adds r5, r0, 0
	ldr r0, _08024B7C
	ldr r2, _08024B80
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08024B84
	adds r0, r1
	ldr r1, _08024B88
	add r1, r8
	ldrb r1, [r1]
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	mov r0, r8
	cmp r0, 0x5
	bhi _08024BEE
	ldr r0, _08024B8C
	adds r0, r4, r0
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024B70: .4byte gStringVar4
_08024B74: .4byte gUnknown_08400D9F
_08024B78: .4byte gUnknown_0840165C
_08024B7C: .4byte 0x02000000
_08024B80: .4byte 0x00016018
_08024B84: .4byte gPlayerParty
_08024B88: .4byte gLevelUpStatBoxStats
_08024B8C: .4byte _08024B90
	.align 2, 0
_08024B90:
	.4byte _08024BA8
	.4byte _08024BB4
	.4byte _08024BC0
	.4byte _08024BCC
	.4byte _08024BD8
	.4byte _08024BE4
_08024BA8:
	ldr r0, _08024BB0
	ldrh r0, [r0]
	b _08024BE8
	.align 2, 0
_08024BB0: .4byte 0x02017180
_08024BB4:
	ldr r0, _08024BBC
	ldrh r0, [r0, 0x8]
	b _08024BE8
	.align 2, 0
_08024BBC: .4byte 0x02017180
_08024BC0:
	ldr r0, _08024BC8
	ldrh r0, [r0, 0x2]
	b _08024BE8
	.align 2, 0
_08024BC8: .4byte 0x02017180
_08024BCC:
	ldr r0, _08024BD4
	ldrh r0, [r0, 0xA]
	b _08024BE8
	.align 2, 0
_08024BD4: .4byte 0x02017180
_08024BD8:
	ldr r0, _08024BE0
	ldrh r0, [r0, 0x4]
	b _08024BE8
	.align 2, 0
_08024BE0: .4byte 0x02017180
_08024BE4:
	ldr r0, _08024C28
	ldrh r0, [r0, 0x6]
_08024BE8:
	subs r0, r1, r0
	lsls r0, 16
	lsrs r7, r0, 16
_08024BEE:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0
	bge _08024C00
	negs r0, r0
	lsls r0, 16
	lsrs r7, r0, 16
	movs r1, 0x1
	add r9, r1
_08024C00:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r1, 0x1
	mov r2, r8
	ands r1, r2
	lsls r0, r1, 3
	adds r0, r1
	adds r0, 0x5
	lsls r0, 3
	adds r0, 0x6
	strb r0, [r5, 0x2]
	adds r5, 0x3
	mov r0, r9
	cmp r0, 0
	beq _08024C30
	ldr r1, _08024C2C
	b _08024C32
	.align 2, 0
_08024C28: .4byte 0x02017180
_08024C2C: .4byte gUnknown_08400DAC
_08024C30:
	ldr r1, _08024C78
_08024C32:
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	movs r6, 0xFC
	strb r6, [r5]
	movs r4, 0x14
	strb r4, [r5, 0x1]
	movs r0, 0x6
	strb r0, [r5, 0x2]
	adds r5, 0x3
	lsls r1, r7, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	strb r6, [r5]
	strb r4, [r5, 0x1]
	movs r0, 0
	strb r0, [r5, 0x2]
	adds r5, 0x3
	movs r0, 0x1
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08024C7C
	movs r0, 0xFE
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	adds r5, 0x1
	b _08024C8C
	.align 2, 0
_08024C78: .4byte gUnknown_08400DAA
_08024C7C:
	strb r6, [r5]
	movs r0, 0x11
	strb r0, [r5, 0x1]
	movs r0, 0x8
	strb r0, [r5, 0x2]
	adds r5, 0x3
	movs r0, 0xFF
	strb r0, [r5]
_08024C8C:
	movs r2, 0x1
	add r8, r2
	mov r0, r8
	cmp r0, 0x5
	bgt _08024C98
	b _08024B2E
_08024C98:
	ldr r4, _08024CB8
	ldr r1, _08024CBC
	adds r2, 0xFF
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0xC
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08024CC0
	ldr r2, _08024CC4
	adds r1, r2
	b _08024DBE
	.align 2, 0
_08024CB8: .4byte gUnknown_03004210
_08024CBC: .4byte gStringVar4
_08024CC0: .4byte 0x02000000
_08024CC4: .4byte 0x0001609c
_08024CC8:
	ldr r0, _08024D68
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	bne _08024CD2
	b _08024E0C
_08024CD2:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08024D6C
	ldr r1, _08024D70
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0
	mov r8, r0
	mov r9, r0
	movs r6, 0xFC
	movs r7, 0x14
	ldr r1, _08024D74
	add r10, r1
_08024CF0:
	ldr r1, _08024D78
	mov r2, r8
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl StringAppend
	adds r5, r0, 0
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08024D7C
	adds r0, r1
	ldr r1, _08024D80
	add r1, r8
	ldrb r1, [r1]
	bl GetMonData
	adds r1, r0, 0
	strb r6, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r4, 0x1
	mov r2, r8
	ands r4, r2
	lsls r0, r4, 3
	adds r0, r4
	adds r0, 0x5
	lsls r0, 3
	adds r0, 0x6
	strb r0, [r5, 0x2]
	adds r5, 0x3
	strb r6, [r5]
	strb r7, [r5, 0x1]
	movs r0, 0x6
	strb r0, [r5, 0x2]
	adds r5, 0x3
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	strb r6, [r5]
	strb r7, [r5, 0x1]
	mov r0, r9
	strb r0, [r5, 0x2]
	adds r5, 0x3
	cmp r4, 0
	beq _08024D84
	movs r0, 0xFE
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	adds r5, 0x1
	b _08024D94
	.align 2, 0
_08024D68: .4byte gMain
_08024D6C: .4byte gStringVar4
_08024D70: .4byte gUnknown_08400D9F
_08024D74: .4byte 0x00016018
_08024D78: .4byte gUnknown_0840165C
_08024D7C: .4byte gPlayerParty
_08024D80: .4byte gLevelUpStatBoxStats
_08024D84:
	strb r6, [r5]
	movs r0, 0x11
	strb r0, [r5, 0x1]
	movs r0, 0x8
	strb r0, [r5, 0x2]
	adds r5, 0x3
	movs r0, 0xFF
	strb r0, [r5]
_08024D94:
	movs r1, 0x1
	add r8, r1
	mov r2, r8
	cmp r2, 0x5
	ble _08024CF0
	ldr r4, _08024DC8
	ldr r1, _08024DCC
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0xC
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08024DD0
	ldr r0, _08024DD4
	adds r1, r0
_08024DBE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08024E0C
	.align 2, 0
_08024DC8: .4byte gUnknown_03004210
_08024DCC: .4byte gStringVar4
_08024DD0: .4byte 0x02000000
_08024DD4: .4byte 0x0001609c
_08024DD8:
	ldr r0, _08024E00
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _08024E0C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl sub_802BBD4
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08024E0C
	.align 2, 0
_08024E00: .4byte gMain
_08024E04:
	ldr r1, _08024E1C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08024E0C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024E1C: .4byte gUnknown_02024C10
	thumb_func_end sub_80248FC

	thumb_func_start sub_8024C4C
sub_8024C4C: @ 8024E20
	push {lr}
	bl sub_80156DC
	ldr r1, _08024E34
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08024E34: .4byte gUnknown_02024C10
	thumb_func_end sub_8024C4C

	thumb_func_start atk6E_state0_side_becomes_attacker
atk6E_state0_side_becomes_attacker: @ 8024E38
	push {lr}
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08024E50
	strb r0, [r1]
	ldr r1, _08024E54
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08024E50: .4byte gUnknown_02024C07
_08024E54: .4byte gUnknown_02024C10
	thumb_func_end atk6E_state0_side_becomes_attacker

	thumb_func_start atk6F_8026810
atk6F_8026810: @ 8024E58
	push {r4,r5,lr}
	ldr r5, _08024E84
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r4, _08024E88
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x33_a_33_33
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024E84: .4byte gUnknown_02024C10
_08024E88: .4byte gUnknown_02024A60
	thumb_func_end atk6F_8026810

	thumb_func_start atk70_record_ability_usage_of_side
atk70_record_ability_usage_of_side: @ 8024E8C
	push {r4,lr}
	ldr r4, _08024EB4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _08024EB8
	strb r0, [r1]
	ldrb r0, [r1]
	ldr r1, _08024EBC
	ldrb r1, [r1]
	bl sub_81074C4
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024EB4: .4byte gUnknown_02024C10
_08024EB8: .4byte gUnknown_02024A60
_08024EBC: .4byte byte_2024C06
	thumb_func_end atk70_record_ability_usage_of_side

	thumb_func_start sub_8024CEC
sub_8024CEC: @ 8024EC0
	ldr r2, _08024EE0
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x2
	strb r0, [r2, 0x1]
	ldr r0, _08024EE4
	ldrh r1, [r0]
	strb r1, [r2, 0x2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	bx lr
	.align 2, 0
_08024EE0: .4byte gUnknown_03004290
_08024EE4: .4byte word_2024E82
	thumb_func_end sub_8024CEC

	thumb_func_start atk71_80268A0
atk71_80268A0: @ 8024EE8
	push {lr}
	bl sub_8024CEC
	ldr r1, _08024EFC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08024EFC: .4byte gUnknown_02024C10
	thumb_func_end atk71_80268A0

	thumb_func_start atk72_flee
atk72_flee: @ 8024F00
	push {lr}
	ldr r0, _08024F2C
	ldrb r0, [r0]
	bl sub_8014AB8
	lsls r0, 24
	cmp r0, 0
	beq _08024F34
	ldr r3, _08024F30
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
	b _08024F3C
	.align 2, 0
_08024F2C: .4byte gUnknown_02024C09
_08024F30: .4byte gUnknown_02024C10
_08024F34:
	ldr r1, _08024F40
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08024F3C:
	pop {r0}
	bx r0
	.align 2, 0
_08024F40: .4byte gUnknown_02024C10
	thumb_func_end atk72_flee

	thumb_func_start atk73_cmd73
atk73_cmd73: @ 8024F44
	push {r4,r5,lr}
	ldr r0, _08024F94
	ldrh r0, [r0]
	movs r5, 0x1
	ands r5, r0
	cmp r5, 0
	bne _08024FE6
	ldr r0, _08024F98
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _08024F9C
	strb r0, [r1]
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08024FA0
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r4, [r1, 0x28]
	movs r0, 0x64
	muls r0, r4
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	cmp r0, 0
	bne _08024F82
	movs r0, 0x1
_08024F82:
	cmp r0, 0x45
	bgt _08024F8A
	cmp r4, 0
	bne _08024FAC
_08024F8A:
	ldr r0, _08024FA4
	ldr r1, _08024FA8
	adds r0, r1
	strb r5, [r0]
	b _08024FE6
	.align 2, 0
_08024F94: .4byte gUnknown_020239F8
_08024F98: .4byte gUnknown_02024C10
_08024F9C: .4byte gUnknown_02024A60
_08024FA0: .4byte gBattleMons
_08024FA4: .4byte 0x02000000
_08024FA8: .4byte 0x000160c1
_08024FAC:
	cmp r0, 0x27
	ble _08024FC4
	ldr r0, _08024FBC
	ldr r1, _08024FC0
	adds r0, r1
	movs r1, 0x1
	b _08024FE4
	.align 2, 0
_08024FBC: .4byte 0x02000000
_08024FC0: .4byte 0x000160c1
_08024FC4:
	cmp r0, 0x9
	ble _08024FDC
	ldr r0, _08024FD4
	ldr r1, _08024FD8
	adds r0, r1
	movs r1, 0x2
	b _08024FE4
	.align 2, 0
_08024FD4: .4byte 0x02000000
_08024FD8: .4byte 0x000160c1
_08024FDC:
	ldr r0, _08024FF4
	ldr r1, _08024FF8
	adds r0, r1
	movs r1, 0x3
_08024FE4:
	strb r1, [r0]
_08024FE6:
	ldr r1, _08024FFC
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024FF4: .4byte 0x02000000
_08024FF8: .4byte 0x000160c1
_08024FFC: .4byte gUnknown_02024C10
	thumb_func_end atk73_cmd73

	thumb_func_start atk74_hp_tresholds_2
atk74_hp_tresholds_2: @ 8025000
	push {r4-r7,lr}
	ldr r0, _08025060
	ldrh r0, [r0]
	movs r7, 0x1
	ands r7, r0
	cmp r7, 0
	bne _080250A4
	ldr r0, _08025064
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	adds r4, r0, 0
	ldr r0, _08025068
	strb r4, [r0]
	movs r0, 0x1
	eors r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _0802506C
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	ldr r1, _08025070
	adds r0, r1
	adds r0, r6
	ldrb r5, [r0]
	ldr r1, _08025074
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r4, [r0, 0x28]
	subs r1, r5, r4
	movs r0, 0x64
	muls r0, r1
	adds r1, r5, 0
	bl __divsi3
	adds r1, r0, 0
	cmp r4, r5
	bcc _0802507C
	ldr r1, _08025078
	adds r0, r6, r1
	strb r7, [r0]
	b _080250A4
	.align 2, 0
_08025060: .4byte gUnknown_020239F8
_08025064: .4byte gUnknown_02024C10
_08025068: .4byte gUnknown_02024A60
_0802506C: .4byte 0x02000000
_08025070: .4byte 0x000160bc
_08025074: .4byte gBattleMons
_08025078: .4byte 0x000160c1
_0802507C:
	cmp r0, 0x1D
	bgt _0802508C
	ldr r0, _08025088
	adds r1, r6, r0
	movs r0, 0x1
	b _080250A2
	.align 2, 0
_08025088: .4byte 0x000160c1
_0802508C:
	cmp r1, 0x45
	bgt _0802509C
	ldr r0, _08025098
	adds r1, r6, r0
	movs r0, 0x2
	b _080250A2
	.align 2, 0
_08025098: .4byte 0x000160c1
_0802509C:
	ldr r0, _080250B4
	adds r1, r6, r0
	movs r0, 0x3
_080250A2:
	strb r0, [r1]
_080250A4:
	ldr r1, _080250B8
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080250B4: .4byte 0x000160c1
_080250B8: .4byte gUnknown_02024C10
	thumb_func_end atk74_hp_tresholds_2

	thumb_func_start atk75_8026A58
atk75_8026A58: @ 80250BC
	push {lr}
	sub sp, 0x4
	ldr r2, _080250FC
	ldr r1, _08025100
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r2, _08025104
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r1, _08025108
	adds r0, r1
	ldr r1, _0802510C
	ldrh r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	str r3, [sp]
	movs r3, 0
	bl sub_803E1B0
	ldr r1, _08025110
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080250FC: .4byte gUnknown_02024E6C
_08025100: .4byte gUnknown_02024C07
_08025104: .4byte gUnknown_02024A6A
_08025108: .4byte gEnemyParty
_0802510C: .4byte gUnknown_02024C04
_08025110: .4byte gUnknown_02024C10
	thumb_func_end atk75_8026A58

	thumb_func_start sub_8024F40
sub_8024F40: @ 8025114
	push {r4-r6,lr}
	ldr r4, _08025138
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _0802513C
	strb r0, [r1]
	ldr r0, [r4]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x6
	bls _0802512E
	b _080252E6
_0802512E:
	lsls r0, 2
	ldr r1, _08025140
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025138: .4byte gUnknown_02024C10
_0802513C: .4byte gUnknown_02024A60
_08025140: .4byte _08025144
	.align 2, 0
_08025144:
	.4byte _08025160
	.4byte _08025170
	.4byte _080251D0
	.4byte _080251E0
	.4byte _080251F8
	.4byte _08025234
	.4byte _0802526C
_08025160:
	ldr r0, _0802516C
	ldrb r0, [r0]
	bl b_cancel_multi_turn_move_maybe
	b _080252E6
	.align 2, 0
_0802516C: .4byte gUnknown_02024A60
_08025170:
	ldr r1, _080251AC
	ldr r4, _080251B0
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r1]
	bl battle_side_get_owner
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080251B4
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _080251BC
	ldr r1, _080251B8
	ldrb r2, [r2, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _080251BC
	strb r2, [r4]
	b _080252E6
	.align 2, 0
_080251AC: .4byte gUnknown_02024C07
_080251B0: .4byte gUnknown_02024C08
_080251B4: .4byte gUnknown_02024C80
_080251B8: .4byte gBattleMons
_080251BC:
	ldr r0, _080251C8
	ldr r1, _080251CC
	ldrb r1, [r1]
	strb r1, [r0]
	b _080252E6
	.align 2, 0
_080251C8: .4byte gUnknown_02024C08
_080251CC: .4byte gUnknown_02024A60
_080251D0:
	bl sub_8012028
	ldr r1, _080251DC
	strb r0, [r1]
	b _080252E6
	.align 2, 0
_080251DC: .4byte gUnknown_02024D1E
_080251E0:
	ldr r0, _080251F0
	ldrh r0, [r0]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _080251F4
	strb r0, [r1]
	b _080252E6
	.align 2, 0
_080251F0: .4byte gUnknown_02024BE6
_080251F4: .4byte gUnknown_02024C08
_080251F8:
	ldr r2, _08025218
	ldr r1, _0802521C
	ldr r0, _08025220
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 28
	ldr r2, [r2]
	ands r2, r0
	cmp r2, 0
	beq _08025228
	ldr r1, _08025224
	movs r0, 0x1
	strb r0, [r1]
	b _080252E6
	.align 2, 0
_08025218: .4byte gUnknown_02024C6C
_0802521C: .4byte gBitTable
_08025220: .4byte gUnknown_02024A60
_08025224: .4byte gUnknown_02024D1E
_08025228:
	ldr r0, _08025230
	strb r2, [r0]
	b _080252E6
	.align 2, 0
_08025230: .4byte gUnknown_02024D1E
_08025234:
	ldr r4, _08025264
	ldr r3, _08025268
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _080252E6
	.align 2, 0
_08025264: .4byte gUnknown_02024D68
_08025268: .4byte gUnknown_02024A60
_0802526C:
	ldr r3, _0802528C
	ldr r0, _08025290
	ldr r1, _08025294
	adds r0, r1
	ldrh r2, [r3]
	ldrb r1, [r0]
	cmp r2, r1
	beq _08025286
	ldrh r0, [r3, 0x4]
	cmp r0, r1
	bne _080252E6
	cmp r2, r0
	bne _0802529C
_08025286:
	ldr r1, _08025298
	movs r0, 0
	b _080252A0
	.align 2, 0
_0802528C: .4byte gUnknown_02024A6A
_08025290: .4byte 0x02000000
_08025294: .4byte 0x00016018
_08025298: .4byte gUnknown_02024A60
_0802529C:
	ldr r1, _080252F4
	movs r0, 0x2
_080252A0:
	strb r0, [r1]
	adds r5, r1, 0
	ldrb r2, [r5]
	lsls r1, r2, 1
	ldr r0, _080252F8
	adds r4, r1, r0
	movs r3, 0
	ldr r1, _080252FC
	movs r0, 0x58
	muls r0, r2
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	ldrh r2, [r4]
	cmp r0, r2
	beq _080252DE
	adds r6, r5, 0
	movs r5, 0x58
	adds r2, r1, 0
_080252C6:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080252DE
	lsls r1, r3, 1
	ldrb r0, [r6]
	muls r0, r5
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	ldrh r1, [r4]
	cmp r0, r1
	bne _080252C6
_080252DE:
	cmp r3, 0x4
	bne _080252E6
	movs r0, 0
	strh r0, [r4]
_080252E6:
	ldr r1, _08025300
	ldr r0, [r1]
	adds r0, 0x3
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080252F4: .4byte gUnknown_02024A60
_080252F8: .4byte 0x020160e8
_080252FC: .4byte gBattleMons
_08025300: .4byte gUnknown_02024C10
	thumb_func_end sub_8024F40

	thumb_func_start atk77_setprotect
atk77_setprotect: @ 8025304
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	ldr r2, _080253D0
	ldr r1, _080253D4
	ldrb r3, [r1]
	lsls r0, r3, 1
	adds r0, r2
	ldrh r0, [r0]
	mov r8, r1
	ldr r7, _080253D8
	cmp r0, 0xB6
	beq _08025334
	cmp r0, 0xC5
	beq _08025334
	cmp r0, 0xCB
	beq _08025334
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r7
	movs r1, 0
	strb r1, [r0, 0x8]
_08025334:
	ldr r0, _080253DC
	ldrb r1, [r0]
	ldr r0, _080253E0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _08025344
	movs r6, 0
_08025344:
	ldr r2, _080253E4
	mov r5, r8
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r4, [r0, 0x8]
	lsls r4, 1
	adds r4, r2
	bl Random
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bls _080253F8
	cmp r6, 0
	beq _080253F8
	ldr r4, _080253E8
	ldr r3, _080253EC
	ldrh r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	cmp r0, 0x6F
	bne _08025394
	ldr r0, _080253F0
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _080253F4
	movs r0, 0
	strb r0, [r1, 0x5]
_08025394:
	ldrh r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	cmp r0, 0x74
	bne _080253BA
	ldr r0, _080253F0
	ldrb r1, [r5]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _080253F4
	movs r0, 0x1
	strb r0, [r1, 0x5]
_080253BA:
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1, 0x8]
	adds r0, 0x1
	strb r0, [r1, 0x8]
	b _0802541A
	.align 2, 0
_080253D0: .4byte gUnknown_02024C4C
_080253D4: .4byte gUnknown_02024C07
_080253D8: .4byte gUnknown_02024CA8
_080253DC: .4byte gUnknown_02024A7E
_080253E0: .4byte gUnknown_02024A68
_080253E4: .4byte gProtectSuccessRates
_080253E8: .4byte gBattleMoves
_080253EC: .4byte gUnknown_02024BE6
_080253F0: .4byte gUnknown_02024D28
_080253F4: .4byte gUnknown_02024D1E
_080253F8:
	ldr r2, _0802542C
	ldr r0, _08025430
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x8]
	ldr r1, _08025434
	movs r0, 0x2
	strb r0, [r1, 0x5]
	ldr r2, _08025438
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_0802541A:
	ldr r1, _0802543C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802542C: .4byte gUnknown_02024CA8
_08025430: .4byte gUnknown_02024C07
_08025434: .4byte gUnknown_02024D1E
_08025438: .4byte gUnknown_02024C68
_0802543C: .4byte gUnknown_02024C10
	thumb_func_end atk77_setprotect

	thumb_func_start atk78_faintifabilitynotdamp
atk78_faintifabilitynotdamp: @ 8025440
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080254FC
	ldr r2, [r0]
	cmp r2, 0
	bne _08025544
	ldr r1, _08025500
	strb r2, [r1]
	ldr r0, _08025504
	ldrb r3, [r0]
	adds r5, r1, 0
	mov r8, r0
	ldr r6, _08025508
	cmp r2, r3
	bcs _0802548C
	adds r0, r6, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _0802548C
	adds r2, r3, 0
	adds r4, r6, 0
	movs r3, 0x58
_08025470:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	bcs _0802548C
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _08025470
_0802548C:
	ldrb r0, [r5]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bne _08025528
	ldr r4, _0802550C
	ldr r7, _08025510
	ldrb r0, [r7]
	strb r0, [r4]
	ldr r2, _08025514
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r6
	ldrh r0, [r0, 0x28]
	str r0, [r2]
	ldr r1, _08025518
	movs r0, 0
	bl dp01_build_cmdbuf_x18_0_aa_health_bar_update
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _0802551C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	movs r0, 0
	strb r0, [r5]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0
	beq _08025544
	adds r3, r5, 0
	ldrb r5, [r7]
	ldr r7, _08025520
	adds r4, r0, 0
	ldr r6, _08025524
_080254D8:
	ldrb r2, [r3]
	cmp r2, r5
	beq _080254EE
	ldrb r0, [r6]
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r7
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _08025544
_080254EE:
	adds r0, r2, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcc _080254D8
	b _08025544
	.align 2, 0
_080254FC: .4byte gUnknown_02024A64
_08025500: .4byte gUnknown_02024C08
_08025504: .4byte gUnknown_02024A68
_08025508: .4byte gBattleMons
_0802550C: .4byte gUnknown_02024A60
_08025510: .4byte gUnknown_02024C07
_08025514: .4byte gUnknown_02024BEC
_08025518: .4byte 0x00007fff
_0802551C: .4byte gUnknown_02024C10
_08025520: .4byte gBitTable
_08025524: .4byte gUnknown_02024C0C
_08025528:
	ldr r1, _08025550
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, 0x58
	muls r1, r0
	adds r1, r6
	adds r1, 0x20
	ldrb r1, [r1]
	bl sub_81074C4
	ldr r1, _08025554
	ldr r0, _08025558
	str r0, [r1]
_08025544:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025550: .4byte byte_2024C06
_08025554: .4byte gUnknown_02024C10
_08025558: .4byte gUnknown_081D9834
	thumb_func_end atk78_faintifabilitynotdamp

	thumb_func_start atk79_setuserhptozero
atk79_setuserhptozero: @ 802555C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080255A8
	ldr r3, [r0]
	cmp r3, 0
	bne _080255A0
	ldr r4, _080255AC
	ldr r0, _080255B0
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _080255B4
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r0, r1
	strh r3, [r0, 0x28]
	ldrb r0, [r4]
	muls r0, r2
	adds r1, 0x28
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2A
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080255B8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_080255A0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080255A8: .4byte gUnknown_02024A64
_080255AC: .4byte gUnknown_02024A60
_080255B0: .4byte gUnknown_02024C07
_080255B4: .4byte gBattleMons
_080255B8: .4byte gUnknown_02024C10
	thumb_func_end atk79_setuserhptozero

	thumb_func_start sub_80253E8
sub_80253E8: @ 80255BC
	push {r4-r7,lr}
	ldr r3, _08025634
	ldr r2, [r3]
	ldrb r4, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r4, r0
	ldr r0, _08025638
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	adds r7, r3, 0
	cmp r0, 0
	beq _08025654
	ldr r0, _0802563C
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r2, _08025640
	lsls r1, 24
	lsrs r1, 24
	adds r3, r0, 0
	ldr r6, _08025644
	ldr r5, _08025648
	ldr r0, _0802564C
	mov r12, r0
	ldrb r0, [r2]
	cmp r1, r0
	bne _08025612
_08025602:
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2]
	cmp r0, r1
	beq _08025602
_08025612:
	ldrb r0, [r6]
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r5
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _08025602
	ldrb r0, [r3]
	mov r2, r12
	ldrb r2, [r2]
	cmp r0, r2
	bcc _08025650
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	b _08025658
	.align 2, 0
_08025634: .4byte gUnknown_02024C10
_08025638: .4byte gUnknown_020239F8
_0802563C: .4byte gUnknown_02024C08
_08025640: .4byte gUnknown_02024C07
_08025644: .4byte gUnknown_02024C0C
_08025648: .4byte gBitTable
_0802564C: .4byte gUnknown_02024A68
_08025650:
	str r4, [r7]
	b _08025658
_08025654:
	adds r0, r2, 0x5
	str r0, [r3]
_08025658:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80253E8

	thumb_func_start sub_802548C
sub_802548C: @ 8025660
	push {r4-r6,lr}
	ldr r4, _080256BC
	ldr r1, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r2, r0
	ldrb r0, [r1, 0x5]
	ldr r3, _080256C0
	cmp r0, 0x1
	bne _08025688
	ldr r0, _080256C4
	ldrb r0, [r0]
	strb r0, [r3]
_08025688:
	ldr r1, _080256C8
	ldr r6, _080256CC
	ldrb r0, [r3]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _080256A2
	movs r0, 0x1
	str r0, [r1]
_080256A2:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldrb r0, [r3]
	muls r0, r5
	adds r0, r6
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	bne _080256D0
	str r2, [r4]
	b _080256D6
	.align 2, 0
_080256BC: .4byte gUnknown_02024C10
_080256C0: .4byte gUnknown_02024C08
_080256C4: .4byte gUnknown_02024C07
_080256C8: .4byte gUnknown_02024BEC
_080256CC: .4byte gBattleMons
_080256D0:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_080256D6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_802548C

	thumb_func_start sub_8025508
sub_8025508: @ 80256DC
	push {r4-r7,lr}
	ldr r3, _08025740
	ldr r4, _08025744
	ldrb r2, [r4]
	lsls r1, r2, 1
	ldr r5, _08025748
	adds r0, r1, r5
	adds r0, r3
	ldrb r7, [r0]
	ldr r0, _0802574C
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	lsls r0, 8
	orrs r7, r0
	lsls r2, 2
	ldr r1, _08025750
	adds r0, r2, r1
	adds r0, r3
	ldrb r6, [r0]
	adds r5, 0x55
	adds r0, r2, r5
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 8
	orrs r6, r0
	adds r1, 0x2
	adds r0, r2, r1
	adds r0, r3
	ldrb r5, [r0]
	ldr r0, _08025754
	adds r2, r0
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r5, r0
	cmp r7, 0
	beq _08025768
	ldr r0, _08025758
	cmp r7, r0
	beq _08025768
	ldr r2, _0802575C
	ldr r0, [r2]
	ldr r1, _08025760
	ands r0, r1
	str r0, [r2]
	ldr r4, _08025764
	strh r7, [r4]
	b _08025830
	.align 2, 0
_08025740: .4byte 0x02000000
_08025744: .4byte gUnknown_02024C07
_08025748: .4byte 0x000160ac
_0802574C: .4byte 0x000160ad
_08025750: .4byte 0x00016100
_08025754: .4byte 0x00016103
_08025758: .4byte 0x0000ffff
_0802575C: .4byte gUnknown_02024C6C
_08025760: .4byte 0xfffffbff
_08025764: .4byte gUnknown_02024BE6
_08025768:
	cmp r6, 0
	beq _08025818
	cmp r5, 0
	beq _080257EC
	ldr r0, _08025798
	cmp r6, r0
	beq _080257EC
	cmp r5, r0
	beq _080257EC
	ldr r2, _0802579C
	ldr r0, [r2]
	ldr r1, _080257A0
	ands r0, r1
	str r0, [r2]
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080257A8
	ldr r0, _080257A4
	strh r6, [r0]
	b _080257AC
	.align 2, 0
_08025798: .4byte 0x0000ffff
_0802579C: .4byte gUnknown_02024C6C
_080257A0: .4byte 0xfffffbff
_080257A4: .4byte gUnknown_02024BE6
_080257A8:
	ldr r0, _080257D8
	strh r5, [r0]
_080257AC:
	adds r5, r0, 0
	ldrh r0, [r5]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _080257DC
	strb r0, [r1]
	ldr r4, _080257E0
	ldr r3, _080257E4
	ldr r2, _080257E8
	ldrh r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	b _08025894
	.align 2, 0
_080257D8: .4byte gUnknown_02024BE6
_080257DC: .4byte gUnknown_02024C08
_080257E0: .4byte gUnknown_02024C10
_080257E4: .4byte gUnknown_081D6BBC
_080257E8: .4byte gBattleMoves
_080257EC:
	cmp r6, 0
	beq _08025818
	ldr r0, _08025808
	cmp r6, r0
	beq _08025818
	ldr r2, _0802580C
	ldr r0, [r2]
	ldr r1, _08025810
	ands r0, r1
	str r0, [r2]
	ldr r4, _08025814
	strh r6, [r4]
	b _08025830
	.align 2, 0
_08025808: .4byte 0x0000ffff
_0802580C: .4byte gUnknown_02024C6C
_08025810: .4byte 0xfffffbff
_08025814: .4byte gUnknown_02024BE6
_08025818:
	cmp r5, 0
	beq _08025878
	ldr r0, _08025858
	cmp r5, r0
	beq _08025878
	ldr r2, _0802585C
	ldr r0, [r2]
	ldr r1, _08025860
	ands r0, r1
	str r0, [r2]
	ldr r4, _08025864
	strh r5, [r4]
_08025830:
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _08025868
	strb r0, [r1]
	ldr r5, _0802586C
	ldr r3, _08025870
	ldr r2, _08025874
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r5]
	b _08025894
	.align 2, 0
_08025858: .4byte 0x0000ffff
_0802585C: .4byte gUnknown_02024C6C
_08025860: .4byte 0xfffffbff
_08025864: .4byte gUnknown_02024BE6
_08025868: .4byte gUnknown_02024C08
_0802586C: .4byte gUnknown_02024C10
_08025870: .4byte gUnknown_081D6BBC
_08025874: .4byte gBattleMoves
_08025878:
	ldr r2, _0802589C
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _080258A0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08025894:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802589C: .4byte gUnknown_02024D68
_080258A0: .4byte gUnknown_02024C10
	thumb_func_end sub_8025508

	thumb_func_start sub_80256D0
sub_80256D0: @ 80258A4
	push {lr}
	ldr r2, _080258C4
	ldrh r0, [r2]
	movs r1, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080258D0
	ldr r2, _080258C8
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080258CC
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080258E0
	.align 2, 0
_080258C4: .4byte word_2024DB8
_080258C8: .4byte gUnknown_02024C68
_080258CC: .4byte gUnknown_02024D1E
_080258D0:
	movs r0, 0x1
	strh r0, [r2]
	ldr r0, _080258EC
	strb r1, [r0, 0x5]
	ldr r0, _080258F0
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_080258E0:
	ldr r1, _080258F4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080258EC: .4byte gUnknown_02024D1E
_080258F0: .4byte gUnknown_02024DBC
_080258F4: .4byte gUnknown_02024C10
	thumb_func_end sub_80256D0

	thumb_func_start atk7E_setreflect
atk7E_setreflect: @ 80258F8
	push {r4-r6,lr}
	ldr r5, _08025928
	ldrb r0, [r5]
	bl battle_get_per_side_status
	ldr r6, _0802592C
	movs r4, 0x1
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08025938
	ldr r2, _08025930
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08025934
	movs r0, 0
	b _08025998
	.align 2, 0
_08025928: .4byte gUnknown_02024C07
_0802592C: .4byte gUnknown_02024C7A
_08025930: .4byte gUnknown_02024C68
_08025934: .4byte gUnknown_02024D1E
_08025938:
	ldrb r0, [r5]
	bl battle_get_per_side_status
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r6
	ldrh r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r5]
	bl battle_get_per_side_status
	ldr r2, _08025988
	adds r1, r4, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	ldr r0, _0802598C
	ldrh r1, [r0]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08025994
	movs r0, 0x1
	bl sub_803C348
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bne _08025994
	ldr r0, _08025990
	strb r1, [r0, 0x5]
	b _0802599A
	.align 2, 0
_08025988: .4byte gUnknown_02024C80
_0802598C: .4byte gUnknown_020239F8
_08025990: .4byte gUnknown_02024D1E
_08025994:
	ldr r1, _080259A8
	movs r0, 0x1
_08025998:
	strb r0, [r1, 0x5]
_0802599A:
	ldr r1, _080259AC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080259A8: .4byte gUnknown_02024D1E
_080259AC: .4byte gUnknown_02024C10
	thumb_func_end atk7E_setreflect

	thumb_func_start sub_80257DC
sub_80257DC: @ 80259B0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r7, _080259F0
	ldrb r5, [r7]
	movs r0, 0x29
	ands r0, r5
	cmp r0, 0
	bne _080259E2
	ldr r0, _080259F4
	mov r9, r0
	ldr r1, _080259F8
	mov r8, r1
	ldrb r4, [r1]
	lsls r0, r4, 2
	mov r2, r9
	adds r6, r0, r2
	ldr r2, [r6]
	movs r0, 0x4
	mov r12, r0
	adds r3, r2, 0
	ands r3, r0
	cmp r3, 0
	beq _08025A00
_080259E2:
	movs r0, 0x1
	orrs r0, r5
	strb r0, [r7]
	ldr r1, _080259FC
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08025A50
	.align 2, 0
_080259F0: .4byte gUnknown_02024C68
_080259F4: .4byte gUnknown_02024C98
_080259F8: .4byte gUnknown_02024C08
_080259FC: .4byte gUnknown_02024D1E
_08025A00:
	ldr r1, _08025A2C
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xC
	beq _08025A1C
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xC
	bne _08025A34
_08025A1C:
	movs r0, 0x1
	orrs r0, r5
	strb r0, [r7]
	ldr r1, _08025A30
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08025A50
	.align 2, 0
_08025A2C: .4byte gBattleMons
_08025A30: .4byte gUnknown_02024D1E
_08025A34:
	ldr r0, _08025A64
	ldrb r0, [r0]
	orrs r2, r0
	str r2, [r6]
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 2
	add r1, r9
	ldr r0, [r1]
	mov r2, r12
	orrs r0, r2
	str r0, [r1]
	ldr r0, _08025A68
	strb r3, [r0, 0x5]
_08025A50:
	ldr r1, _08025A6C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025A64: .4byte gUnknown_02024C07
_08025A68: .4byte gUnknown_02024D1E
_08025A6C: .4byte gUnknown_02024C10
	thumb_func_end sub_80257DC

	thumb_func_start atk80_manipulatedamage
atk80_manipulatedamage: @ 8025A70
	push {r4,lr}
	ldr r1, _08025A88
	ldr r0, [r1]
	ldrb r2, [r0, 0x1]
	adds r4, r1, 0
	cmp r2, 0x1
	beq _08025AA0
	cmp r2, 0x1
	bgt _08025A8C
	cmp r2, 0
	beq _08025A92
	b _08025AE0
	.align 2, 0
_08025A88: .4byte gUnknown_02024C10
_08025A8C:
	cmp r2, 0x2
	beq _08025AD8
	b _08025AE0
_08025A92:
	ldr r1, _08025A9C
	ldr r0, [r1]
	negs r0, r0
	b _08025ADE
	.align 2, 0
_08025A9C: .4byte gUnknown_02024BEC
_08025AA0:
	ldr r3, _08025ACC
	ldr r0, [r3]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	str r0, [r3]
	cmp r0, 0
	bne _08025AB2
	str r2, [r3]
_08025AB2:
	ldr r2, _08025AD0
	ldr r0, _08025AD4
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2C]
	lsrs r1, r0, 1
	ldr r0, [r3]
	cmp r1, r0
	bge _08025AE0
	str r1, [r3]
	b _08025AE0
	.align 2, 0
_08025ACC: .4byte gUnknown_02024BEC
_08025AD0: .4byte gBattleMons
_08025AD4: .4byte gUnknown_02024C08
_08025AD8:
	ldr r1, _08025AEC
	ldr r0, [r1]
	lsls r0, 1
_08025ADE:
	str r0, [r1]
_08025AE0:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025AEC: .4byte gUnknown_02024BEC
	thumb_func_end atk80_manipulatedamage

	thumb_func_start atk81_setrest
atk81_setrest: @ 8025AF0
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _08025B48
	mov r12, r0
	ldr r1, [r0]
	ldrb r6, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r6, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r6, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r6, r0
	ldr r5, _08025B4C
	ldr r2, _08025B50
	ldr r0, _08025B54
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r5]
	ldr r4, _08025B58
	ldr r1, _08025B5C
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	adds r0, r1
	ldrh r0, [r0, 0x2C]
	negs r0, r0
	str r0, [r4]
	ldrb r0, [r2]
	adds r4, r0, 0
	muls r4, r3
	adds r0, r4, r1
	ldrh r3, [r0, 0x28]
	adds r7, r5, 0
	adds r5, r2, 0
	adds r2, r1, 0
	ldrh r0, [r0, 0x2C]
	cmp r3, r0
	bne _08025B60
	mov r0, r12
	str r6, [r0]
	b _08025BB0
	.align 2, 0
_08025B48: .4byte gUnknown_02024C10
_08025B4C: .4byte gUnknown_02024A60
_08025B50: .4byte gUnknown_02024C08
_08025B54: .4byte gUnknown_02024C07
_08025B58: .4byte gUnknown_02024BEC
_08025B5C: .4byte gBattleMons
_08025B60:
	adds r0, r2, 0
	adds r0, 0x4C
	adds r0, r4, r0
	ldr r1, [r0]
	movs r0, 0xF8
	ands r1, r0
	cmp r1, 0
	beq _08025B7C
	ldr r1, _08025B78
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08025B80
	.align 2, 0
_08025B78: .4byte gUnknown_02024D1E
_08025B7C:
	ldr r0, _08025BB8
	strb r1, [r0, 0x5]
_08025B80:
	ldrb r0, [r5]
	movs r3, 0x58
	muls r0, r3
	adds r2, 0x4C
	adds r0, r2
	movs r1, 0x3
	str r1, [r0]
	ldrb r0, [r7]
	muls r0, r3
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r7]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08025BBC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08025BB0:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025BB8: .4byte gUnknown_02024D1E
_08025BBC: .4byte gUnknown_02024C10
	thumb_func_end atk81_setrest

	thumb_func_start atk82_jumpifnotfirstturn
atk82_jumpifnotfirstturn: @ 8025BC0
	push {r4,r5,lr}
	ldr r5, _08025BF4
	ldr r4, [r5]
	ldrb r3, [r4, 0x1]
	ldrb r0, [r4, 0x2]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r4, 0x4]
	lsls r0, 24
	orrs r3, r0
	ldr r2, _08025BF8
	ldr r0, _08025BFC
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x16]
	cmp r0, 0
	beq _08025C00
	adds r0, r4, 0x5
	str r0, [r5]
	b _08025C02
	.align 2, 0
_08025BF4: .4byte gUnknown_02024C10
_08025BF8: .4byte gUnknown_02024CA8
_08025BFC: .4byte gUnknown_02024C07
_08025C00:
	str r3, [r5]
_08025C02:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end atk82_jumpifnotfirstturn

	thumb_func_start sub_8025A34
sub_8025A34: @ 8025C08
	ldr r1, _08025C14
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08025C14: .4byte gUnknown_02024C10
	thumb_func_end sub_8025A34

	thumb_func_start sub_8025A44
sub_8025A44: @ 8025C18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _08025C70
	ldrb r1, [r0]
	mov r8, r0
	cmp r2, r1
	bge _08025C8C
	ldr r0, _08025C74
	mov r12, r0
	movs r0, 0x58
	muls r0, r3
	add r0, r12
	adds r5, r0, 0
	adds r5, 0x20
	ldr r6, _08025C78
	movs r3, 0
	ldr r7, _08025C7C
	adds r4, r1, 0
_08025C44:
	mov r0, r12
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x70
	ands r0, r1
	cmp r0, 0
	beq _08025C84
	ldrb r0, [r5]
	cmp r0, 0x2B
	beq _08025C84
	movs r3, 0
	strb r2, [r6]
	ldr r1, _08025C80
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08025CA4
	cmp r0, r2
	beq _08025C98
	movs r0, 0x1
	strb r0, [r7, 0x5]
	b _08025C8C
	.align 2, 0
_08025C70: .4byte gUnknown_02024A68
_08025C74: .4byte gBattleMons
_08025C78: .4byte 0x02016003
_08025C7C: .4byte gUnknown_02024D1E
_08025C80: .4byte gUnknown_02024C08
_08025C84:
	adds r3, 0x58
	adds r2, 0x1
	cmp r2, r4
	blt _08025C44
_08025C8C:
	mov r1, r8
	ldrb r1, [r1]
	cmp r2, r1
	beq _08025CA8
	movs r0, 0x1
	b _08025CAA
_08025C98:
	ldr r0, _08025CA0
	strb r3, [r0, 0x5]
	b _08025C8C
	.align 2, 0
_08025CA0: .4byte gUnknown_02024D1E
_08025CA4:
	strb r2, [r1]
	b _08025C8C
_08025CA8:
	movs r0, 0
_08025CAA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8025A44

	thumb_func_start sub_8025AE0
sub_8025AE0: @ 8025CB4
	push {r4-r6,lr}
	ldr r5, _08025CE0
	ldr r1, [r5]
	ldrb r4, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r4, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r4, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r4, r0
	ldr r6, _08025CE4
	ldrb r0, [r6]
	bl sub_8025A44
	lsls r0, 24
	cmp r0, 0
	beq _08025CE8
	str r4, [r5]
	b _08025D2A
	.align 2, 0
_08025CE0: .4byte gUnknown_02024C10
_08025CE4: .4byte gUnknown_02024C08
_08025CE8:
	ldr r1, _08025D18
	ldrb r3, [r6]
	movs r0, 0x58
	muls r0, r3
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r1, 0xF
	beq _08025D00
	cmp r1, 0x48
	bne _08025D24
_08025D00:
	ldr r2, _08025D1C
	strb r0, [r2]
	ldr r1, _08025D20
	movs r0, 0x2
	strb r0, [r1, 0x5]
	str r4, [r5]
	ldrb r1, [r2]
	adds r0, r3, 0
	bl sub_81074C4
	b _08025D2A
	.align 2, 0
_08025D18: .4byte gBattleMons
_08025D1C: .4byte byte_2024C06
_08025D20: .4byte gUnknown_02024D1E
_08025D24:
	ldr r0, [r5]
	adds r0, 0x5
	str r0, [r5]
_08025D2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8025AE0

	thumb_func_start sub_8025B5C
sub_8025B5C: @ 8025D30
	push {r4,r5,lr}
	ldr r5, _08025D58
	ldr r4, _08025D5C
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x9]
	cmp r0, 0x3
	bne _08025D68
	ldr r2, _08025D60
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08025D64
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08025D92
	.align 2, 0
_08025D58: .4byte gUnknown_02024CA8
_08025D5C: .4byte gUnknown_02024C07
_08025D60: .4byte gUnknown_02024C68
_08025D64: .4byte gUnknown_02024D1E
_08025D68:
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1, 0x9]
	ldr r2, _08025DA0
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x1]
	strb r0, [r2, 0x2]
	strb r0, [r2, 0x3]
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x9]
	strb r0, [r2, 0x4]
	movs r0, 0xFF
	strb r0, [r2, 0x5]
	ldr r0, _08025DA4
	strb r3, [r0, 0x5]
_08025D92:
	ldr r1, _08025DA8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025DA0: .4byte gUnknown_030041C0
_08025DA4: .4byte gUnknown_02024D1E
_08025DA8: .4byte gUnknown_02024C10
	thumb_func_end sub_8025B5C

	thumb_func_start atk86_stockpiletobasedamage
atk86_stockpiletobasedamage: @ 8025DAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r3, _08025DE4
	ldr r1, [r3]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r2, r0
	ldr r7, _08025DE8
	ldr r6, _08025DEC
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _08025DF0
	str r2, [r3]
	b _08025E96
	.align 2, 0
_08025DE4: .4byte gUnknown_02024C10
_08025DE8: .4byte gUnknown_02024CA8
_08025DEC: .4byte gUnknown_02024C07
_08025DF0:
	ldr r0, _08025EA4
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _08025E7C
	ldr r0, _08025EA8
	mov r8, r0
	ldr r4, _08025EAC
	ldr r5, _08025EB0
	ldrb r0, [r5]
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldrb r0, [r6]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _08025EB4
	adds r0, r2
	ldrb r1, [r5]
	muls r1, r4
	adds r1, r2
	ldr r2, _08025EB8
	ldrh r2, [r2]
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	ldrb r4, [r6]
	str r4, [sp, 0x8]
	ldrb r4, [r5]
	str r4, [sp, 0xC]
	bl CalculateBaseDamage
	ldrb r2, [r6]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r7
	ldrb r1, [r1, 0x9]
	adds r3, r0, 0
	muls r3, r1
	mov r1, r8
	str r3, [r1]
	ldr r2, _08025EBC
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x9]
	ldr r1, _08025EC0
	adds r2, r1
	strb r0, [r2]
	ldr r1, _08025EC4
	ldrb r0, [r6]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _08025E7C
	lsls r0, r3, 4
	subs r0, r3
	movs r1, 0xA
	bl __divsi3
	mov r1, r8
	str r0, [r1]
_08025E7C:
	ldr r2, _08025EC8
	ldr r0, _08025ECC
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r1, _08025ED0
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08025E96:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025EA4: .4byte gUnknown_02024D1E
_08025EA8: .4byte gUnknown_02024BEC
_08025EAC: .4byte gUnknown_02024C7A
_08025EB0: .4byte gUnknown_02024C08
_08025EB4: .4byte gBattleMons
_08025EB8: .4byte gUnknown_02024BE6
_08025EBC: .4byte 0x02000000
_08025EC0: .4byte 0x00016002
_08025EC4: .4byte gUnknown_02024D28
_08025EC8: .4byte gUnknown_02024CA8
_08025ECC: .4byte gUnknown_02024C07
_08025ED0: .4byte gUnknown_02024C10
	thumb_func_end atk86_stockpiletobasedamage

	thumb_func_start sub_8025D00
sub_8025D00: @ 8025ED4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _08025F14
	ldr r1, [r7]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldrb r0, [r1, 0x3]
	lsls r0, 16
	orrs r2, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 24
	orrs r2, r0
	ldr r0, _08025F18
	mov r8, r0
	ldr r6, _08025F1C
	ldrb r3, [r6]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	mov r1, r8
	adds r4, r0, r1
	ldrb r1, [r4, 0x9]
	cmp r1, 0
	bne _08025F24
	str r2, [r7]
	ldr r0, _08025F20
	strb r1, [r0, 0x5]
	b _08025FA4
	.align 2, 0
_08025F14: .4byte gUnknown_02024C10
_08025F18: .4byte gUnknown_02024CA8
_08025F1C: .4byte gUnknown_02024C07
_08025F20: .4byte gUnknown_02024D1E
_08025F24:
	ldr r1, _08025F48
	movs r0, 0x58
	muls r0, r3
	adds r1, r0, r1
	ldrh r0, [r1, 0x2C]
	ldrh r3, [r1, 0x28]
	cmp r0, r3
	bne _08025F54
	movs r0, 0
	strb r0, [r4, 0x9]
	str r2, [r7]
	ldr r1, _08025F4C
	ldrb r0, [r6]
	strb r0, [r1]
	ldr r1, _08025F50
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08025FA4
	.align 2, 0
_08025F48: .4byte gBattleMons
_08025F4C: .4byte gUnknown_02024C08
_08025F50: .4byte gUnknown_02024D1E
_08025F54:
	ldr r5, _08025FB0
	ldrh r0, [r1, 0x2C]
	ldrb r1, [r4, 0x9]
	movs r2, 0x3
	subs r2, r1
	movs r4, 0x1
	adds r1, r4, 0
	lsls r1, r2
	bl __divsi3
	str r0, [r5]
	cmp r0, 0
	bne _08025F70
	str r4, [r5]
_08025F70:
	ldr r0, [r5]
	negs r0, r0
	str r0, [r5]
	ldr r2, _08025FB4
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x9]
	ldr r1, _08025FB8
	adds r2, r1
	movs r3, 0
	strb r0, [r2]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	strb r3, [r0, 0x9]
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	ldr r1, _08025FBC
	ldrb r0, [r6]
	strb r0, [r1]
_08025FA4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025FB0: .4byte gUnknown_02024BEC
_08025FB4: .4byte 0x02000000
_08025FB8: .4byte 0x00016002
_08025FBC: .4byte gUnknown_02024C08
	thumb_func_end sub_8025D00

	thumb_func_start atk88_negativedamage
atk88_negativedamage: @ 8025FC0
	push {lr}
	ldr r2, _08025FE8
	ldr r0, _08025FEC
	ldr r0, [r0]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	negs r0, r0
	str r0, [r2]
	cmp r0, 0
	bne _08025FDC
	movs r0, 0x1
	negs r0, r0
	str r0, [r2]
_08025FDC:
	ldr r1, _08025FF0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08025FE8: .4byte gUnknown_02024BEC
_08025FEC: .4byte gUnknown_02024BF0
_08025FF0: .4byte gUnknown_02024C10
	thumb_func_end atk88_negativedamage

	thumb_func_start sub_8025E20
sub_8025E20: @ 8025FF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r3
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0
	mov r9, r0
	mov r10, r0
	movs r0, 0x40
	ands r0, r5
	cmp r0, 0
	beq _08026028
	ldr r0, _08026020
	ldr r1, _08026024
	b _0802602C
	.align 2, 0
_08026020: .4byte gUnknown_02024A60
_08026024: .4byte gUnknown_02024C07
_08026028:
	ldr r0, _080260CC
	ldr r1, _080260D0
_0802602C:
	ldrb r1, [r1]
	strb r1, [r0]
	movs r0, 0xBF
	ands r5, r0
	movs r0, 0x80
	ands r0, r5
	cmp r0, 0
	beq _08026046
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08026046:
	movs r0, 0x7F
	ands r5, r0
	movs r0, 0x20
	ands r0, r5
	cmp r0, 0
	beq _0802605C
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_0802605C:
	movs r0, 0xDF
	ands r5, r0
	ldr r1, _080260D4
	movs r4, 0
	movs r2, 0xFD
	strb r2, [r1]
	movs r0, 0x5
	strb r0, [r1, 0x1]
	strb r7, [r1, 0x2]
	movs r3, 0x1
	negs r3, r3
	mov r12, r3
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	lsls r0, r6, 24
	cmp r0, 0
	blt _08026080
	b _08026384
_08026080:
	ldr r4, _080260D8
	ldr r1, _080260CC
	ldrb r0, [r1]
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _08026128
	mov r2, r9
	cmp r2, 0
	bne _08026128
	ldr r0, _080260DC
	ldrh r0, [r0]
	cmp r0, 0xAE
	beq _08026158
	cmp r5, 0x1
	bne _08026148
	ldr r4, _080260E0
	ldr r3, _080260CC
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _080260E8
	ldr r0, _080260E4
	mov r4, r8
	str r4, [r0]
	b _08026148
	.align 2, 0
_080260CC: .4byte gUnknown_02024A60
_080260D0: .4byte gUnknown_02024C08
_080260D4: .4byte gUnknown_030041C0
_080260D8: .4byte gUnknown_02024C80
_080260DC: .4byte gUnknown_02024BE6
_080260E0: .4byte gUnknown_02024D68
_080260E4: .4byte gUnknown_02024C10
_080260E8:
	mov r0, r8
	bl b_movescr_stack_push
	ldr r0, _08026114
	ldr r6, _08026118
	ldrb r1, [r6]
	ldr r2, _0802611C
	adds r0, r2
	strb r1, [r0]
	ldr r1, _08026120
	ldr r0, _08026124
	str r0, [r1]
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _08026148
	.align 2, 0
_08026114: .4byte 0x02000000
_08026118: .4byte gUnknown_02024A60
_0802611C: .4byte 0x00016003
_08026120: .4byte gUnknown_02024C10
_08026124: .4byte gUnknown_081D9128
_08026128:
	ldr r0, _0802614C
	ldrh r0, [r0]
	cmp r0, 0xAE
	beq _08026158
	mov r3, r10
	cmp r3, 0x1
	beq _08026158
	movs r0, 0
	bl sub_801C108
	lsls r0, 24
	cmp r0, 0
	beq _08026158
	ldr r1, _08026150
	ldr r0, _08026154
	str r0, [r1]
_08026148:
	movs r0, 0x1
	b _08026478
	.align 2, 0
_0802614C: .4byte gUnknown_02024BE6
_08026150: .4byte gUnknown_02024C10
_08026154: .4byte BattleScript_1D83D6
_08026158:
	ldr r2, _080261A0
	ldr r1, _080261A4
	ldrb r3, [r1]
	movs r4, 0x58
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2
	adds r0, 0x20
	ldrb r0, [r0]
	mov r10, r2
	cmp r0, 0x1D
	beq _08026174
	cmp r0, 0x49
	bne _08026214
_08026174:
	mov r0, r9
	cmp r0, 0
	bne _08026214
	ldr r0, _080261A8
	ldrh r0, [r0]
	cmp r0, 0xAE
	beq _08026214
	cmp r5, 0x1
	bne _08026148
	ldr r4, _080261AC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _080261B4
	ldr r0, _080261B0
	mov r1, r8
	str r1, [r0]
	b _08026148
	.align 2, 0
_080261A0: .4byte gBattleMons
_080261A4: .4byte gUnknown_02024A60
_080261A8: .4byte gUnknown_02024BE6
_080261AC: .4byte gUnknown_02024D68
_080261B0: .4byte gUnknown_02024C10
_080261B4:
	mov r0, r8
	bl b_movescr_stack_push
	ldr r0, _080261FC
	ldr r2, _08026200
	ldrb r1, [r2]
	ldr r3, _08026204
	adds r0, r3
	strb r1, [r0]
	ldr r1, _08026208
	ldr r0, _0802620C
	str r0, [r1]
	ldr r1, _08026210
	ldrb r0, [r2]
	movs r6, 0x58
	muls r0, r6
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r2]
	ldrb r1, [r1]
	bl sub_81074C4
	ldr r0, _08026200
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _08026148
	.align 2, 0
_080261FC: .4byte 0x02000000
_08026200: .4byte gUnknown_02024A60
_08026204: .4byte 0x00016003
_08026208: .4byte gUnknown_02024C10
_0802620C: .4byte gUnknown_081D989B
_08026210: .4byte byte_2024C06
_08026214:
	ldr r1, _08026264
	ldrb r0, [r1]
	movs r4, 0x58
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x33
	bne _0802627C
	mov r2, r9
	cmp r2, 0
	bne _0802627C
	cmp r7, 0x6
	bne _0802627C
	cmp r5, 0x1
	bne _08026148
	mov r0, r8
	bl b_movescr_stack_push
	ldr r0, _08026268
	ldr r3, _08026264
	ldrb r1, [r3]
	ldr r6, _0802626C
	adds r0, r6
	strb r1, [r0]
	ldr r1, _08026270
	ldr r0, _08026274
	str r0, [r1]
	ldr r1, _08026278
	ldrb r0, [r3]
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r3]
	ldrb r1, [r1]
	bl sub_81074C4
	b _08026148
	.align 2, 0
_08026264: .4byte gUnknown_02024A60
_08026268: .4byte 0x02000000
_0802626C: .4byte 0x00016003
_08026270: .4byte gUnknown_02024C10
_08026274: .4byte gUnknown_081D9903
_08026278: .4byte byte_2024C06
_0802627C:
	ldr r1, _080262D0
	ldrb r0, [r1]
	movs r4, 0x58
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x34
	bne _080262E8
	mov r2, r9
	cmp r2, 0
	bne _080262E8
	cmp r7, 0x1
	bne _080262E8
	cmp r5, 0x1
	beq _0802629E
	b _08026148
_0802629E:
	mov r0, r8
	bl b_movescr_stack_push
	ldr r0, _080262D4
	ldr r3, _080262D0
	ldrb r1, [r3]
	ldr r6, _080262D8
	adds r0, r6
	strb r1, [r0]
	ldr r1, _080262DC
	ldr r0, _080262E0
	str r0, [r1]
	ldr r1, _080262E4
	ldrb r0, [r3]
	muls r0, r4
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r3]
	ldrb r1, [r1]
	bl sub_81074C4
	b _08026148
	.align 2, 0
_080262D0: .4byte gUnknown_02024A60
_080262D4: .4byte 0x02000000
_080262D8: .4byte 0x00016003
_080262DC: .4byte gUnknown_02024C10
_080262E0: .4byte gUnknown_081D9903
_080262E4: .4byte byte_2024C06
_080262E8:
	ldr r0, _08026374
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r10
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x13
	bne _08026300
	cmp r5, 0
	bne _08026300
	b _08026148
_08026300:
	lsls r0, r6, 24
	asrs r0, 28
	movs r1, 0x7
	ands r0, r1
	negs r0, r0
	lsls r0, 24
	ldr r3, _08026378
	movs r4, 0
	movs r1, 0xFD
	strb r1, [r3]
	movs r2, 0x1
	lsrs r6, r0, 24
	asrs r0, 24
	subs r1, 0xFF
	cmp r0, r1
	bne _0802632A
	strb r4, [r3, 0x1]
	movs r0, 0xD3
	strb r0, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0x4
_0802632A:
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	movs r0, 0xD4
	strb r0, [r1]
	adds r2, 0x1
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _08026374
	ldrb r2, [r1]
	movs r0, 0x58
	muls r0, r2
	adds r0, r7, r0
	mov r1, r10
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080263DA
	movs r1, 0
	ldr r0, _0802637C
	ldrb r0, [r0]
	ldr r3, _08026380
	mov r8, r3
	cmp r0, r2
	bne _0802636E
	movs r1, 0x1
_0802636E:
	mov r4, r8
	strb r1, [r4, 0x5]
	b _08026408
	.align 2, 0
_08026374: .4byte gUnknown_02024A60
_08026378: .4byte gUnknown_03004290
_0802637C: .4byte gUnknown_02024C08
_08026380: .4byte gUnknown_02024D1E
_08026384:
	asrs r6, r0, 28
	movs r0, 0x7
	ands r6, r0
	ldr r3, _080263E4
	strb r2, [r3]
	movs r2, 0x1
	cmp r6, 0x2
	bne _0802639E
	strb r4, [r3, 0x1]
	movs r0, 0xD1
	strb r0, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0x4
_0802639E:
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	movs r0, 0xD2
	strb r0, [r1]
	adds r2, 0x1
	adds r0, r2, r3
	strb r4, [r0]
	adds r2, 0x1
	adds r1, r2, r3
	ldrb r0, [r1]
	mov r2, r12
	orrs r0, r2
	strb r0, [r1]
	ldr r2, _080263E8
	ldr r4, _080263EC
	ldrb r3, [r4]
	movs r0, 0x58
	muls r0, r3
	adds r0, r7, r0
	adds r1, r2, 0
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	mov r10, r2
	cmp r0, 0xC
	bne _080263F4
_080263DA:
	ldr r1, _080263F0
	movs r0, 0x2
	strb r0, [r1, 0x5]
	mov r8, r1
	b _08026408
	.align 2, 0
_080263E4: .4byte gUnknown_03004290
_080263E8: .4byte gBattleMons
_080263EC: .4byte gUnknown_02024A60
_080263F0: .4byte gUnknown_02024D1E
_080263F4:
	movs r1, 0
	ldr r0, _08026488
	ldrb r0, [r0]
	ldr r2, _0802648C
	mov r8, r2
	cmp r0, r3
	bne _08026404
	movs r1, 0x1
_08026404:
	mov r3, r8
	strb r1, [r3, 0x5]
_08026408:
	ldr r2, _08026490
	ldrb r0, [r2]
	movs r4, 0x58
	adds r1, r0, 0
	muls r1, r4
	adds r1, r7, r1
	mov r3, r10
	adds r3, 0x18
	adds r1, r3
	lsls r0, r6, 24
	asrs r0, 24
	ldrb r6, [r1]
	adds r0, r6
	strb r0, [r1]
	ldrb r0, [r2]
	muls r0, r4
	adds r0, r7, r0
	adds r1, r0, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _08026438
	movs r0, 0
	strb r0, [r1]
_08026438:
	ldr r1, _08026490
	ldrb r0, [r1]
	muls r0, r4
	adds r0, r7, r0
	adds r1, r0, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0802644E
	movs r0, 0xC
	strb r0, [r1]
_0802644E:
	mov r2, r8
	ldrb r0, [r2, 0x5]
	cmp r0, 0x2
	bne _08026476
	movs r3, 0x1
	ands r3, r5
	cmp r3, 0
	beq _08026468
	ldr r0, _08026494
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
_08026468:
	mov r4, r8
	ldrb r0, [r4, 0x5]
	cmp r0, 0x2
	bne _08026476
	cmp r3, 0
	bne _08026476
	b _08026148
_08026476:
	movs r0, 0
_08026478:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026488: .4byte gUnknown_02024C08
_0802648C: .4byte gUnknown_02024D1E
_08026490: .4byte gUnknown_02024A60
_08026494: .4byte gUnknown_02024C68
	thumb_func_end sub_8025E20

	thumb_func_start atk89_statbuffchange
atk89_statbuffchange: @ 8026498
	push {r4,r5,lr}
	ldr r5, _080264E0
	ldr r2, [r5]
	ldrb r3, [r2, 0x2]
	ldrb r0, [r2, 0x3]
	lsls r0, 8
	orrs r3, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 16
	orrs r3, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 24
	orrs r3, r0
	ldr r0, _080264E4
	ldr r1, _080264E8
	adds r0, r1
	ldrb r4, [r0]
	movs r0, 0xF0
	ands r0, r4
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xF
	ands r1, r4
	ldrb r2, [r2, 0x1]
	bl sub_8025E20
	lsls r0, 24
	cmp r0, 0
	bne _080264D8
	ldr r0, [r5]
	adds r0, 0x6
	str r0, [r5]
_080264D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080264E0: .4byte gUnknown_02024C10
_080264E4: .4byte 0x02000000
_080264E8: .4byte 0x0001601e
	thumb_func_end atk89_statbuffchange

	thumb_func_start atk8A_normalisebuffs
atk8A_normalisebuffs: @ 80264EC
	push {r4-r7,lr}
	movs r2, 0
	ldr r0, _08026534
	ldrb r1, [r0]
	ldr r0, _08026538
	mov r12, r0
	cmp r2, r1
	bge _08026524
	ldr r0, _0802653C
	movs r4, 0x6
	adds r5, r1, 0
	movs r7, 0x58
	adds r6, r0, 0
	adds r6, 0x18
_08026508:
	adds r3, r2, 0x1
	movs r1, 0x7
	adds r0, r2, 0
	muls r0, r7
	adds r0, r6
	adds r0, 0x7
_08026514:
	strb r4, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _08026514
	adds r2, r3, 0
	cmp r2, r5
	blt _08026508
_08026524:
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026534: .4byte gUnknown_02024A68
_08026538: .4byte gUnknown_02024C10
_0802653C: .4byte gBattleMons
	thumb_func_end atk8A_normalisebuffs

	thumb_func_start atk8B_setbide
atk8B_setbide: @ 8026540
	push {r4,r5,lr}
	ldr r4, _08026598
	ldr r3, _0802659C
	ldrb r0, [r3]
	movs r5, 0x58
	adds r2, r0, 0
	muls r2, r5
	adds r4, 0x50
	adds r2, r4
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r2]
	ldr r1, _080265A0
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldr r1, _080265A4
	ldrh r1, [r1]
	movs r2, 0
	strh r1, [r0]
	ldr r1, _080265A8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	str r2, [r0]
	ldrb r0, [r3]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 2
	orrs r0, r2
	str r0, [r1]
	ldr r1, _080265AC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026598: .4byte gBattleMons
_0802659C: .4byte gUnknown_02024C07
_080265A0: .4byte gUnknown_02024C54
_080265A4: .4byte gUnknown_02024BE6
_080265A8: .4byte gUnknown_02024BF4
_080265AC: .4byte gUnknown_02024C10
	thumb_func_end atk8B_setbide

	thumb_func_start atk8C_confuseifrepeatingattackends
atk8C_confuseifrepeatingattackends: @ 80265B0
	push {lr}
	ldr r1, _080265E0
	ldr r0, _080265E4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 4
	ands r0, r1
	cmp r0, 0
	bne _080265D2
	ldr r1, _080265E8
	movs r0, 0x75
	strb r0, [r1, 0x3]
_080265D2:
	ldr r1, _080265EC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080265E0: .4byte gBattleMons
_080265E4: .4byte gUnknown_02024C07
_080265E8: .4byte gUnknown_02024D1E
_080265EC: .4byte gUnknown_02024C10
	thumb_func_end atk8C_confuseifrepeatingattackends

	thumb_func_start atk8D_setloopcounter
atk8D_setloopcounter: @ 80265F0
	push {r4,r5,lr}
	ldr r0, _08026604
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	cmp r1, 0
	beq _0802660C
	ldr r0, _08026608
	strb r1, [r0]
	b _08026626
	.align 2, 0
_08026604: .4byte gUnknown_02024C10
_08026608: .4byte gUnknown_02024C0E
_0802660C:
	ldr r4, _08026634
	bl Random
	movs r5, 0x3
	ands r0, r5
	strb r0, [r4]
	cmp r0, 0x1
	bls _08026622
	bl Random
	ands r0, r5
_08026622:
	adds r0, 0x2
	strb r0, [r4]
_08026626:
	ldr r1, _08026638
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026634: .4byte gUnknown_02024C0E
_08026638: .4byte gUnknown_02024C10
	thumb_func_end atk8D_setloopcounter

	thumb_func_start sub_8026468
sub_8026468: @ 802663C
	push {r4,lr}
	ldr r1, _0802667C
	ldr r0, _08026680
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0xFD
	strb r0, [r2]
	ldr r2, _08026684
	adds r0, r1, r2
	movs r2, 0x1
	strb r2, [r0]
	ldr r4, _08026688
	adds r0, r1, r4
	strb r2, [r0]
	adds r4, 0x1
	adds r0, r1, r4
	strb r2, [r0]
	ldr r2, _0802668C
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, 0x2
	adds r1, r4
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _08026690
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802667C: .4byte 0x02000000
_08026680: .4byte 0x000160e0
_08026684: .4byte 0x000160e1
_08026688: .4byte 0x000160e2
_0802668C: .4byte 0x000160e4
_08026690: .4byte gUnknown_02024C10
	thumb_func_end sub_8026468

	thumb_func_start sub_80264C0
sub_80264C0: @ 8026694
	push {r4-r7,lr}
	ldr r6, _080266C8
	ldr r7, _080266CC
	ldrb r0, [r7]
	movs r5, 0x58
	adds r1, r0, 0
	muls r1, r5
	adds r1, r6
	adds r1, 0x2A
	ldr r4, _080266D0
	ldrb r3, [r4]
	adds r0, r3, 0
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _080266E0
	ldr r0, _080266D4
	ldr r2, _080266D8
	adds r1, r3, r2
	adds r1, r0
	ldr r2, _080266DC
	lsls r0, r3, 1
	b _0802673C
	.align 2, 0
_080266C8: .4byte gBattleMons
_080266CC: .4byte gUnknown_02024C07
_080266D0: .4byte gUnknown_02024C08
_080266D4: .4byte 0x02000000
_080266D8: .4byte 0x00016064
_080266DC: .4byte gUnknown_02024A6A
_080266E0:
	bl Random
	movs r3, 0xFF
	ands r3, r0
	ldrb r0, [r7]
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r2, [r0]
	ldrb r4, [r4]
	adds r0, r4, 0
	muls r0, r5
	adds r0, r6
	adds r0, 0x2A
	ldrb r1, [r0]
	adds r2, r1
	adds r0, r3, 0
	muls r0, r2
	asrs r0, 8
	adds r0, 0x1
	lsrs r1, 2
	cmp r0, r1
	bhi _08026730
	ldr r3, _0802672C
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
	movs r0, 0
	b _0802674A
	.align 2, 0
_0802672C: .4byte gUnknown_02024C10
_08026730:
	ldr r0, _08026750
	ldr r2, _08026754
	adds r1, r4, r2
	adds r1, r0
	ldr r2, _08026758
	lsls r0, r4, 1
_0802673C:
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r1, _0802675C
	ldr r0, _08026760
	str r0, [r1]
	movs r0, 0x1
_0802674A:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026750: .4byte 0x02000000
_08026754: .4byte 0x00016064
_08026758: .4byte gUnknown_02024A6A
_0802675C: .4byte gUnknown_02024C10
_08026760: .4byte gUnknown_081D90FC
	thumb_func_end sub_80264C0

	thumb_func_start sub_8026590
sub_8026590: @ 8026764
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, _080267FC
	ldrh r1, [r4]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08026778
	b _08026A50
_08026778:
	ldr r5, _08026800
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _08026804
	mov r8, r1
	cmp r0, 0
	bne _0802678E
	ldr r2, _08026808
	mov r8, r2
_0802678E:
	ldrh r1, [r4]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802680C
	movs r7, 0
	movs r6, 0
	ldrb r0, [r5]
	bl sub_803FC34
	lsls r0, 24
	lsrs r0, 24
	bl sub_803FBFC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _080267B4
	movs r6, 0x3
_080267B4:
	adds r5, r6, 0
	adds r0, r5, 0x3
	cmp r5, r0
	bge _0802684C
_080267BC:
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080267EE
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080267EE
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080267EE
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080267EE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0x3
	cmp r5, r0
	blt _080267BC
	b _0802684C
	.align 2, 0
_080267FC: .4byte gUnknown_020239F8
_08026800: .4byte gUnknown_02024C08
_08026804: .4byte gEnemyParty
_08026808: .4byte gPlayerParty
_0802680C:
	movs r7, 0
	movs r5, 0
_08026810:
	movs r0, 0x64
	muls r0, r5
	mov r2, r8
	adds r4, r2, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08026842
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08026842
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08026842
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08026842:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08026810
_0802684C:
	cmp r7, 0x1
	bhi _0802685C
	ldr r0, _08026890
	ldrh r1, [r0]
	movs r0, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _08026874
_0802685C:
	cmp r7, 0x2
	bhi _08026898
	ldr r0, _08026890
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08026898
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08026898
_08026874:
	ldr r3, _08026894
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
	b _08026A54
	.align 2, 0
_08026890: .4byte gUnknown_020239F8
_08026894: .4byte gUnknown_02024C10
_08026898:
	bl sub_80264C0
	lsls r0, 24
	cmp r0, 0
	bne _080268A4
	b _08026A54
_080268A4:
	ldr r0, _080268E4
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08026948
_080268B0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080268E8
	ldrb r0, [r0]
	bl sub_803FC34
	lsls r0, 24
	lsrs r0, 24
	bl sub_803FBFC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _080268EC
	adds r0, r6, 0x3
	lsls r0, 24
	lsrs r5, r0, 24
	b _080268EE
	.align 2, 0
_080268E4: .4byte gUnknown_020239F8
_080268E8: .4byte gUnknown_02024C08
_080268EC:
	adds r5, r6, 0
_080268EE:
	ldr r4, _08026940
	ldr r0, _08026944
	ldrb r2, [r0]
	lsls r1, r2, 1
	adds r1, r4
	lsls r0, r5, 16
	lsrs r3, r0, 16
	ldrh r1, [r1]
	cmp r3, r1
	beq _080268B0
	movs r0, 0x2
	eors r2, r0
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r3, r0
	beq _080268B0
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080268B0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _080268B0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080268B0
	b _08026A06
	.align 2, 0
_08026940: .4byte gUnknown_02024A6A
_08026944: .4byte gUnknown_02024C08
_08026948:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080269B8
	ldr r6, _080269B0
_08026952:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080269B4
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r6
	adds r2, r5, 0
	ldrh r0, [r0]
	cmp r2, r0
	beq _08026952
	movs r0, 0x2
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r2, r0
	beq _08026952
	movs r0, 0x64
	muls r0, r5
	mov r2, r8
	adds r4, r2, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08026952
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _08026952
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08026952
	b _08026A06
	.align 2, 0
_080269B0: .4byte gUnknown_02024A6A
_080269B4: .4byte gUnknown_02024C08
_080269B8:
	ldr r6, _08026A40
_080269BA:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08026A44
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r5, r0
	beq _080269BA
	movs r0, 0x64
	muls r0, r5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080269BA
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0x1
	beq _080269BA
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080269BA
_08026A06:
	ldr r0, _08026A48
	ldr r4, _08026A44
	ldrb r1, [r4]
	ldr r2, _08026A4C
	adds r1, r2
	adds r1, r0
	strb r5, [r1]
	bl sub_806B528
	lsls r0, 24
	cmp r0, 0
	bne _08026A24
	ldrb r0, [r4]
	bl sub_8012258
_08026A24:
	ldrb r0, [r4]
	adds r1, r5, 0
	movs r2, 0
	bl sub_8094B6C
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8094B6C
	b _08026A54
	.align 2, 0
_08026A40: .4byte gUnknown_02024A6A
_08026A44: .4byte gUnknown_02024C08
_08026A48: .4byte 0x02000000
_08026A4C: .4byte 0x00016068
_08026A50:
	bl sub_80264C0
_08026A54:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8026590

	thumb_func_start sub_802688C
sub_802688C: @ 8026A60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	ldr r2, _08026AF4
	ldr r3, _08026AF8
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r1, r2, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	mov r8, r2
	cmp r0, 0
	beq _08026AA2
	movs r5, 0x58
	adds r2, r1, 0
_08026A88:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _08026AA2
	lsls r1, r6, 1
	ldrb r0, [r3]
	muls r0, r5
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	cmp r0, 0
	bne _08026A88
_08026AA2:
	movs r3, 0
	cmp r3, r6
	bcs _08026B24
	ldr r0, _08026AFC
	mov r10, r0
	ldr r5, _08026AF4
	mov r12, r5
	ldr r7, _08026AF8
	ldrb r0, [r7]
	movs r4, 0x58
	adds r5, r0, 0
	muls r5, r4
	movs r0, 0xC
	add r0, r12
	mov r9, r0
_08026AC0:
	lsls r0, r3, 1
	adds r0, r5
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrb r2, [r0, 0x2]
	cmp r2, 0x9
	bne _08026B02
	mov r0, r8
	adds r1, r5, r0
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _08026AEE
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _08026B00
_08026AEE:
	movs r2, 0x7
	b _08026B02
	.align 2, 0
_08026AF4: .4byte gBattleMons
_08026AF8: .4byte gUnknown_02024C07
_08026AFC: .4byte gBattleMoves
_08026B00:
	movs r2, 0
_08026B02:
	ldrb r0, [r7]
	muls r0, r4
	add r0, r12
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r2, r1
	beq _08026B1A
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r2, r0
	bne _08026B24
_08026B1A:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r6
	bcc _08026AC0
_08026B24:
	cmp r3, r6
	bne _08026B48
	ldr r3, _08026B44
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
	b _08026BEC
	.align 2, 0
_08026B44: .4byte gUnknown_02024C10
_08026B48:
	movs r7, 0x3
	ldr r5, _08026BA0
	mov r9, r5
_08026B4E:
	bl Random
	adds r3, r0, 0
	ands r3, r7
	cmp r3, r6
	bcs _08026B4E
	ldr r4, _08026BA4
	lsls r1, r3, 1
	ldr r3, _08026BA8
	ldrb r2, [r3]
	movs r0, 0x58
	adds r5, r2, 0
	muls r5, r0
	adds r1, r5
	adds r0, r4, 0
	adds r0, 0xC
	adds r1, r0
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r2, [r0, 0x2]
	mov r8, r4
	adds r4, r3, 0
	cmp r2, 0x9
	bne _08026BAE
	mov r0, r8
	adds r2, r5, r0
	adds r0, r2, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _08026B9C
	adds r0, r2, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _08026BAC
_08026B9C:
	movs r2, 0x7
	b _08026BAE
	.align 2, 0
_08026BA0: .4byte gBattleMoves
_08026BA4: .4byte gBattleMons
_08026BA8: .4byte gUnknown_02024C07
_08026BAC:
	movs r2, 0
_08026BAE:
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	add r0, r8
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r5, [r1]
	cmp r2, r5
	beq _08026B4E
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r2, r0
	beq _08026B4E
	strb r2, [r1]
	ldrb r0, [r4]
	muls r0, r3
	add r0, r8
	adds r0, 0x22
	strb r2, [r0]
	ldr r1, _08026BFC
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _08026C00
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08026BEC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026BFC: .4byte gUnknown_030041C0
_08026C00: .4byte gUnknown_02024C10
	thumb_func_end sub_802688C

	thumb_func_start atk91_givemoney
atk91_givemoney: @ 8026C04
	push {r4,lr}
	ldr r0, _08026C60
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08026C80
	ldr r4, _08026C64
	ldrh r0, [r4]
	cmp r0, 0
	beq _08026C80
	ldr r0, _08026C68
	ldrh r2, [r4]
	ldr r1, _08026C6C
	ldr r3, _08026C70
	adds r1, r3
	ldrb r1, [r1]
	muls r1, r2
	bl sub_80B79B8
	ldr r1, _08026C74
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0x5
	strb r0, [r1, 0x3]
	ldrh r2, [r4]
	strb r2, [r1, 0x4]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r2
	lsrs r0, 8
	strb r0, [r1, 0x5]
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	ldr r4, _08026C78
	ldr r0, [r4]
	adds r0, 0x1
	bl b_movescr_stack_push
	ldr r0, _08026C7C
	str r0, [r4]
	b _08026C88
	.align 2, 0
_08026C60: .4byte gUnknown_020239F8
_08026C64: .4byte gUnknown_02024D1A
_08026C68: .4byte 0x02025bc4
_08026C6C: .4byte 0x02000000
_08026C70: .4byte 0x00016056
_08026C74: .4byte gUnknown_030041C0
_08026C78: .4byte gUnknown_02024C10
_08026C7C: .4byte gUnknown_081D95DB
_08026C80:
	ldr r1, _08026C90
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
_08026C88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026C90: .4byte gUnknown_02024C10
	thumb_func_end atk91_givemoney

	thumb_func_start atk92_setlightscreen
atk92_setlightscreen: @ 8026C94
	push {r4-r6,lr}
	ldr r4, _08026CC4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	ldr r6, _08026CC8
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08026CD4
	ldr r2, _08026CCC
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08026CD0
	movs r0, 0
	b _08026D34
	.align 2, 0
_08026CC4: .4byte gUnknown_02024C07
_08026CC8: .4byte gUnknown_02024C7A
_08026CCC: .4byte gUnknown_02024C68
_08026CD0: .4byte gUnknown_02024D1E
_08026CD4:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r6
	ldrh r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r4]
	bl battle_get_per_side_status
	ldr r2, _08026D24
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0, 0x1]
	ldr r0, _08026D28
	ldrh r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08026D30
	movs r0, 0x1
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08026D30
	ldr r1, _08026D2C
	movs r0, 0x4
	b _08026D34
	.align 2, 0
_08026D24: .4byte gUnknown_02024C80
_08026D28: .4byte gUnknown_020239F8
_08026D2C: .4byte gUnknown_02024D1E
_08026D30:
	ldr r1, _08026D44
	movs r0, 0x3
_08026D34:
	strb r0, [r1, 0x5]
	ldr r1, _08026D48
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026D44: .4byte gUnknown_02024D1E
_08026D48: .4byte gUnknown_02024C10
	thumb_func_end atk92_setlightscreen

	thumb_func_start sub_8026B78
sub_8026B78: @ 8026D4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r7, _08026D7C
	ldr r6, _08026D80
	ldrb r2, [r6]
	movs r5, 0x58
	adds r0, r2, 0
	muls r0, r5
	adds r1, r0, r7
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08026D88
	ldr r1, _08026D84
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x7]
	ldrb r6, [r0, 0x1A]
	b _08026DA2
	.align 2, 0
_08026D7C: .4byte gBattleMons
_08026D80: .4byte gUnknown_02024C08
_08026D84: .4byte gEnigmaBerries
_08026D88:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7
	ldrh r0, [r0, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r6, r0, 24
_08026DA2:
	ldr r1, _08026E20
	ldr r5, _08026E24
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r4, 0x27
	bne _08026DE0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bcs _08026DE0
	ldrb r0, [r5]
	movs r1, 0x27
	bl sub_81074F8
	ldr r2, _08026E28
	ldrb r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
_08026DE0:
	ldr r0, _08026E2C
	mov r8, r0
	ldr r1, _08026E24
	ldrb r2, [r1]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	mov r3, r8
	adds r5, r0, r3
	adds r0, r5, 0
	adds r0, 0x20
	ldrb r3, [r0]
	mov r10, r8
	cmp r3, 0x5
	bne _08026E40
	ldr r2, _08026E30
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08026E34
	strb r3, [r0]
	ldr r1, _08026E38
	ldr r0, _08026E3C
	str r0, [r1]
	ldr r1, _08026E24
	ldrb r0, [r1]
	movs r1, 0x5
	bl sub_81074C4
	b _08027014
	.align 2, 0
_08026E20: .4byte gUnknown_02024C0B
_08026E24: .4byte gUnknown_02024C08
_08026E28: .4byte gUnknown_02024D68
_08026E2C: .4byte gBattleMons
_08026E30: .4byte gUnknown_02024C68
_08026E34: .4byte byte_2024C06
_08026E38: .4byte gUnknown_02024C10
_08026E3C: .4byte gUnknown_081D9826
_08026E40:
	ldr r1, _08026EB4
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x18
	ands r0, r1
	cmp r0, 0
	bne _08026EC8
	ldr r1, _08026EB8
	ldr r0, _08026EBC
	ldrh r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r7, _08026EC0
	ldrb r0, [r7]
	muls r0, r6
	add r0, r10
	adds r0, 0x2A
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r1, 0x2A
	ldrb r1, [r1]
	subs r0, r1
	ldrb r2, [r2, 0x3]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, 0x1
	cmp r0, r4
	bge _08026EB0
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	add r1, r10
	adds r1, 0x2A
	ldr r2, _08026EC4
	ldrb r0, [r2]
	muls r0, r6
	add r0, r10
	adds r0, 0x2A
	ldrb r1, [r1]
	movs r4, 0x1
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08026EF4
_08026EB0:
	mov r10, r8
	b _08026FB4
	.align 2, 0
_08026EB4: .4byte gUnknown_02024C98
_08026EB8: .4byte gBattleMoves
_08026EBC: .4byte gUnknown_02024BE6
_08026EC0: .4byte gUnknown_02024C07
_08026EC4: .4byte gUnknown_02024C08
_08026EC8:
	ldr r0, _08026F20
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r2, _08026F24
	ldrb r0, [r1, 0x15]
	movs r4, 0
	ldrb r3, [r2]
	cmp r0, r3
	bne _08026EF4
	ldrb r0, [r2]
	muls r0, r6
	add r0, r10
	adds r0, 0x2A
	adds r1, r5, 0
	adds r1, 0x2A
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08026EF4
	movs r4, 0x1
_08026EF4:
	cmp r4, 0
	beq _08026FB4
	ldr r0, _08026F28
	ldr r1, _08026F2C
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	bge _08026F38
	ldr r1, _08026F30
	movs r0, 0x58
	muls r0, r2
	add r0, r10
	ldrh r0, [r0, 0x28]
	subs r0, 0x1
	str r0, [r1]
	ldr r2, _08026F34
	ldrb r0, [r2]
	movs r1, 0x40
	b _08026F9A
	.align 2, 0
_08026F20: .4byte gUnknown_02024CA8
_08026F24: .4byte gUnknown_02024C07
_08026F28: .4byte gUnknown_02024D28
_08026F2C: .4byte gUnknown_02024C08
_08026F30: .4byte gUnknown_02024BEC
_08026F34: .4byte gUnknown_02024C68
_08026F38:
	ldr r0, _08026F74
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	beq _08026F88
	ldr r1, _08026F78
	movs r3, 0x58
	adds r0, r2, 0
	muls r0, r3
	add r0, r10
	ldrh r0, [r0, 0x28]
	subs r0, 0x1
	str r0, [r1]
	ldr r2, _08026F7C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08026F80
	ldr r2, _08026F84
	ldrb r0, [r2]
	muls r0, r3
	add r0, r10
	ldrh r0, [r0, 0x2E]
	strh r0, [r1]
	b _08026F9E
	.align 2, 0
_08026F74: .4byte gUnknown_02024D68
_08026F78: .4byte gUnknown_02024BEC
_08026F7C: .4byte gUnknown_02024C68
_08026F80: .4byte gUnknown_02024C04
_08026F84: .4byte gUnknown_02024C08
_08026F88:
	ldr r1, _08026FA8
	movs r0, 0x58
	muls r0, r2
	add r0, r10
	ldrh r0, [r0, 0x28]
	str r0, [r1]
	ldr r2, _08026FAC
	ldrb r0, [r2]
	movs r1, 0x10
_08026F9A:
	orrs r0, r1
	strb r0, [r2]
_08026F9E:
	ldr r1, _08026FB0
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08027014
	.align 2, 0
_08026FA8: .4byte gUnknown_02024BEC
_08026FAC: .4byte gUnknown_02024C68
_08026FB0: .4byte gUnknown_02024C10
_08026FB4:
	ldr r2, _08026FE4
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08026FE8
	ldrb r0, [r0]
	movs r2, 0x58
	adds r1, r0, 0
	muls r1, r2
	add r1, r10
	adds r1, 0x2A
	ldr r3, _08026FEC
	ldrb r0, [r3]
	muls r0, r2
	add r0, r10
	adds r0, 0x2A
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08026FF4
	ldr r1, _08026FF0
	movs r0, 0
	b _08026FF8
	.align 2, 0
_08026FE4: .4byte gUnknown_02024C68
_08026FE8: .4byte gUnknown_02024C07
_08026FEC: .4byte gUnknown_02024C08
_08026FF0: .4byte gUnknown_02024D1E
_08026FF4:
	ldr r1, _08027024
	movs r0, 0x1
_08026FF8:
	strb r0, [r1, 0x5]
	ldr r3, _08027028
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
_08027014:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027024: .4byte gUnknown_02024D1E
_08027028: .4byte gUnknown_02024C10
	thumb_func_end sub_8026B78

	thumb_func_start atk94_gethalfcurrentenemyhp
atk94_gethalfcurrentenemyhp: @ 802702C
	push {lr}
	ldr r3, _08027058
	ldr r2, _0802705C
	ldr r0, _08027060
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	lsrs r0, 1
	str r0, [r3]
	cmp r0, 0
	bne _0802704A
	movs r0, 0x1
	str r0, [r3]
_0802704A:
	ldr r1, _08027064
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08027058: .4byte gUnknown_02024BEC
_0802705C: .4byte gBattleMons
_08027060: .4byte gUnknown_02024C08
_08027064: .4byte gUnknown_02024C10
	thumb_func_end atk94_gethalfcurrentenemyhp

	thumb_func_start sub_8026E94
sub_8026E94: @ 8027068
	push {lr}
	ldr r2, _08027088
	ldrh r1, [r2]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08027094
	ldr r2, _0802708C
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08027090
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080270A6
	.align 2, 0
_08027088: .4byte word_2024DB8
_0802708C: .4byte gUnknown_02024C68
_08027090: .4byte gUnknown_02024D1E
_08027094:
	movs r0, 0x8
	strh r0, [r2]
	ldr r1, _080270B4
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r0, _080270B8
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_080270A6:
	ldr r1, _080270BC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080270B4: .4byte gUnknown_02024D1E
_080270B8: .4byte gUnknown_02024DBC
_080270BC: .4byte gUnknown_02024C10
	thumb_func_end sub_8026E94

	thumb_func_start sub_8026EEC
sub_8026EEC: @ 80270C0
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080270DE
	b _080271F0
_080270DE:
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _080270F4
	b _080271F0
_080270F4:
	ldr r2, _08027168
	ldrh r1, [r2]
	movs r0, 0x18
	ands r0, r1
	adds r4, r2, 0
	ldr r5, _0802716C
	cmp r0, 0
	beq _08027182
	ldr r0, _08027170
	ldrb r2, [r5]
	movs r1, 0x58
	muls r1, r2
	adds r3, r1, r0
	adds r0, r3, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _0802717C
	cmp r0, 0x8
	beq _0802717C
	cmp r0, 0x4
	beq _0802717C
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _0802717C
	cmp r0, 0x8
	beq _0802717C
	cmp r0, 0x4
	beq _0802717C
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _0802717C
	ldr r0, _08027174
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0802717C
	movs r0, 0x80
	lsls r0, 11
	ands r1, r0
	cmp r1, 0
	bne _0802717C
	ldr r1, _08027178
	ldrh r0, [r3, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _08027182
	movs r0, 0x1
	b _08027180
	.align 2, 0
_08027168: .4byte word_2024DB8
_0802716C: .4byte gUnknown_02024C07
_08027170: .4byte gBattleMons
_08027174: .4byte gUnknown_02024C98
_08027178: .4byte gUnknown_02024BEC
_0802717C:
	ldr r1, _080271D8
	movs r0, 0
_08027180:
	str r0, [r1]
_08027182:
	ldrh r1, [r4]
	movs r4, 0x80
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080271F8
	ldr r1, _080271DC
	ldrb r3, [r5]
	movs r0, 0x58
	muls r0, r3
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0xF
	beq _080271E4
	adds r0, r2, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0xF
	beq _080271E4
	ldr r0, _080271E0
	lsls r1, r3, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r1, 0
	ands r0, r4
	cmp r0, 0
	bne _080271E4
	movs r0, 0x80
	lsls r0, 11
	ands r1, r0
	cmp r1, 0
	bne _080271E4
	ldr r1, _080271D8
	ldrh r0, [r2, 0x2C]
	lsrs r0, 4
	str r0, [r1]
	cmp r0, 0
	bne _080271F8
	movs r0, 0x1
	str r0, [r1]
	b _080271F8
	.align 2, 0
_080271D8: .4byte gUnknown_02024BEC
_080271DC: .4byte gBattleMons
_080271E0: .4byte gUnknown_02024C98
_080271E4:
	ldr r1, _080271EC
	movs r0, 0
	str r0, [r1]
	b _080271F8
	.align 2, 0
_080271EC: .4byte gUnknown_02024BEC
_080271F0:
	ldr r1, _08027224
	movs r0, 0
	str r0, [r1]
	ldr r5, _08027228
_080271F8:
	ldr r0, _0802722C
	ldrb r1, [r0]
	ldr r2, _08027230
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08027212
	ldr r1, _08027224
	movs r0, 0
	str r0, [r1]
_08027212:
	ldr r1, _08027234
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027224: .4byte gUnknown_02024BEC
_08027228: .4byte gUnknown_02024C07
_0802722C: .4byte gUnknown_02024C0C
_08027230: .4byte gBitTable
_08027234: .4byte gUnknown_02024C10
	thumb_func_end sub_8026EEC

	thumb_func_start sub_8027064
sub_8027064: @ 8027238
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08027264
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08027270
	ldr r1, _08027268
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0802726C
	b _08027280
	.align 2, 0
_08027264: .4byte gUnknown_02024C07
_08027268: .4byte gUnknown_02024A6A
_0802726C: .4byte gPlayerParty
_08027270:
	ldr r1, _080272A4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080272A8
_08027280:
	adds r5, r1, r0
	ldr r4, _080272AC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080272B4
	ldr r1, _080272A4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080272B0
	b _080272C4
	.align 2, 0
_080272A4: .4byte gUnknown_02024A6A
_080272A8: .4byte gEnemyParty
_080272AC: .4byte gUnknown_02024C08
_080272B0: .4byte gPlayerParty
_080272B4:
	ldr r1, _08027320
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08027324
_080272C4:
	adds r4, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	mov r9, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r7, r0, 0
	ldr r5, _08027328
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	ldr r1, _0802732C
	adds r0, r1
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0xC
	bne _0802733C
	ldr r1, _08027330
	ldr r0, _08027334
	str r0, [r1]
	ldr r0, _08027338
	strb r2, [r0]
	ldrb r0, [r5]
	movs r1, 0xC
	bl sub_81074C4
	b _080273F0
	.align 2, 0
_08027320: .4byte gUnknown_02024A6A
_08027324: .4byte gEnemyParty
_08027328: .4byte gUnknown_02024C08
_0802732C: .4byte gBattleMons
_08027330: .4byte gUnknown_02024C10
_08027334: .4byte gUnknown_081D98C9
_08027338: .4byte byte_2024C06
_0802733C:
	mov r0, r10
	mov r1, r9
	bl GetGenderFromSpeciesAndPersonality
	adds r4, r0, 0
	mov r0, r8
	adds r1, r7, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0802739E
	ldr r1, _080273BC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080273C0
	ands r0, r1
	cmp r0, 0
	bne _0802739E
	adds r0, r2, 0
	muls r0, r6
	ldr r4, _080273C4
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r1, 0xF0
	lsls r1, 12
	ands r0, r1
	cmp r0, 0
	bne _0802739E
	mov r0, r10
	mov r1, r9
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0802739E
	mov r0, r8
	adds r1, r7, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080273CC
_0802739E:
	ldr r3, _080273C8
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
	b _080273F0
	.align 2, 0
_080273BC: .4byte gUnknown_02024C98
_080273C0: .4byte 0x000400c0
_080273C4: .4byte gBattleMons
_080273C8: .4byte gUnknown_02024C10
_080273CC:
	ldrb r0, [r5]
	adds r2, r0, 0
	muls r2, r6
	adds r2, r4
	ldr r1, _08027400
	ldr r0, _08027404
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 16
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08027408
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_080273F0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027400: .4byte gBitTable
_08027404: .4byte gUnknown_02024C07
_08027408: .4byte gUnknown_02024C10
	thumb_func_end sub_8027064

	thumb_func_start sub_8027238
sub_8027238: @ 802740C
	push {r4-r7,lr}
	ldr r0, _08027454
	ldr r0, [r0]
	cmp r0, 0
	bne _080274F8
	ldr r5, _08027458
	ldr r1, [r5]
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	beq _08027464
	bl sub_8015150
	ldr r4, _0802745C
	strb r0, [r4]
	ldr r3, _08027460
	ldrb r1, [r4]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r3, 0x50
	adds r2, r3
	ldr r2, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x1A_aaaa_bbbb
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	b _080274F8
	.align 2, 0
_08027454: .4byte gUnknown_02024A64
_08027458: .4byte gUnknown_02024C10
_0802745C: .4byte gUnknown_02024A60
_08027460: .4byte gBattleMons
_08027464:
	ldr r4, _08027500
	ldr r5, _08027504
	ldrb r0, [r5]
	strb r0, [r4]
	ldr r6, _08027508
	ldrb r1, [r6]
	ldr r7, _0802750C
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080274A0
	ldr r3, _08027510
	movs r0, 0x58
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r3, 0x50
	adds r2, r3
	ldr r2, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x1A_aaaa_bbbb
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080274A0:
	ldr r0, _08027514
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080274F0
	ldrb r0, [r5]
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r4]
	ldrb r1, [r6]
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080274F0
	ldr r3, _08027510
	movs r0, 0x58
	muls r2, r0
	adds r0, r3, 0
	adds r0, 0x4C
	adds r0, r2, r0
	ldr r1, [r0]
	adds r3, 0x50
	adds r2, r3
	ldr r2, [r2]
	movs r0, 0
	bl dp01_build_cmdbuf_x1A_aaaa_bbbb
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080274F0:
	ldr r1, _08027518
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
_080274F8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027500: .4byte gUnknown_02024A60
_08027504: .4byte gUnknown_02024C07
_08027508: .4byte gUnknown_02024C0C
_0802750C: .4byte gBitTable
_08027510: .4byte gBattleMons
_08027514: .4byte gUnknown_020239F8
_08027518: .4byte gUnknown_02024C10
	thumb_func_end sub_8027238

	thumb_func_start sub_8027348
sub_8027348: @ 802751C
	push {r4-r6,lr}
	ldr r6, _0802754C
	ldr r4, _08027550
	ldrb r0, [r4]
	bl battle_get_per_side_status
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _0802755C
	ldr r2, _08027554
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08027558
	strb r5, [r0, 0x5]
	b _08027594
	.align 2, 0
_0802754C: .4byte gUnknown_02024C80
_08027550: .4byte gUnknown_02024C07
_08027554: .4byte gUnknown_02024C68
_08027558: .4byte gUnknown_02024D1E
_0802755C:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strb r1, [r0, 0x2]
	ldrb r0, [r4]
	bl battle_get_per_side_status
	ldr r2, _080275A4
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	movs r3, 0
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _080275A8
	strb r3, [r0, 0x5]
_08027594:
	ldr r1, _080275AC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080275A4: .4byte gUnknown_02024C7A
_080275A8: .4byte gUnknown_02024D1E
_080275AC: .4byte gUnknown_02024C10
	thumb_func_end sub_8027348

	thumb_func_start atk9A_setincreasedcriticalchance
atk9A_setincreasedcriticalchance: @ 80275B0
	push {lr}
	ldr r1, _080275E0
	ldr r0, _080275E4
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r3, 0x80
	lsls r3, 13
	adds r2, r1, 0
	ands r2, r3
	cmp r2, 0
	beq _080275F0
	ldr r2, _080275E8
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080275EC
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _080275F8
	.align 2, 0
_080275E0: .4byte gBattleMons
_080275E4: .4byte gUnknown_02024C07
_080275E8: .4byte gUnknown_02024C68
_080275EC: .4byte gUnknown_02024D1E
_080275F0:
	orrs r1, r3
	str r1, [r0]
	ldr r0, _08027604
	strb r2, [r0, 0x5]
_080275F8:
	ldr r1, _08027608
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08027604: .4byte gUnknown_02024D1E
_08027608: .4byte gUnknown_02024C10
	thumb_func_end atk9A_setincreasedcriticalchance

	thumb_func_start atk9B_transformdataexecution
atk9B_transformdataexecution: @ 802760C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _08027664
	ldr r2, _08027668
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0802766C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r7, _08027670
	ldr r0, _08027674
	mov r12, r0
	ldrb r1, [r0]
	movs r6, 0x58
	adds r0, r1, 0
	muls r0, r6
	adds r5, r7, 0
	adds r5, 0x50
	adds r0, r5
	ldr r0, [r0]
	movs r4, 0x80
	lsls r4, 14
	ands r0, r4
	cmp r0, 0
	bne _08027652
	ldr r0, _08027678
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	ldr r0, _0802767C
	ands r2, r0
	cmp r2, 0
	beq _08027688
_08027652:
	ldr r2, _08027680
	ldrb r0, [r2]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08027684
	movs r0, 0x1
	b _0802779C
	.align 2, 0
_08027664: .4byte gUnknown_02024BE8
_08027668: .4byte 0x0000ffff
_0802766C: .4byte gUnknown_02024C10
_08027670: .4byte gBattleMons
_08027674: .4byte gUnknown_02024C08
_08027678: .4byte gUnknown_02024C98
_0802767C: .4byte 0x000400c0
_08027680: .4byte gUnknown_02024C68
_08027684: .4byte gUnknown_02024D1E
_08027688:
	ldr r3, _0802775C
	ldrb r0, [r3]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	ldr r0, [r1]
	orrs r0, r4
	str r0, [r1]
	ldr r4, _08027760
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x4]
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	mov r2, r12
	ldrb r1, [r2]
	muls r1, r6
	adds r2, r7, 0
	adds r2, 0x48
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x18]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x18]
	ldr r1, _08027764
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	mov r2, r12
	ldrb r0, [r2]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r2]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r0, [r3]
	muls r0, r6
	adds r5, r0, r7
	ldrb r0, [r2]
	muls r0, r6
	adds r2, r0, r7
	movs r4, 0
	adds r6, r3, 0
	ldr r0, _08027768
	mov r8, r0
_08027720:
	adds r0, r5, r4
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x23
	bls _08027720
	movs r4, 0
	ldr r7, _0802776C
	ldr r3, _08027770
	adds r5, r3, 0
	adds r5, 0x18
_08027738:
	lsls r1, r4, 1
	ldrb r2, [r6]
	movs r0, 0x58
	muls r2, r0
	adds r1, r2
	adds r1, r3
	ldrh r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0, 0x4]
	cmp r1, 0x4
	bhi _08027774
	adds r0, r4, r2
	adds r0, r5
	b _0802777A
	.align 2, 0
_0802775C: .4byte gUnknown_02024C07
_08027760: .4byte gUnknown_02024CA8
_08027764: .4byte gUnknown_030041C0
_08027768: .4byte gUnknown_02024A60
_0802776C: .4byte gBattleMoves
_08027770: .4byte gUnknown_02024A8C
_08027774:
	adds r0, r4, r2
	adds r0, r5
	movs r1, 0x5
_0802777A:
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _08027738
	ldrb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	movs r0, 0
	movs r1, 0x2
	bl dp01_build_cmdbuf_x38_a
	mov r2, r8
	ldrb r0, [r2]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080277A8
	movs r0, 0
_0802779C:
	strb r0, [r1, 0x5]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080277A8: .4byte gUnknown_02024D1E
	thumb_func_end atk9B_transformdataexecution

	thumb_func_start sub_80275D8
sub_80275D8: @ 80277AC
	push {r4-r7,lr}
	ldr r7, _080277DC
	ldr r6, _080277E0
	ldrb r0, [r6]
	movs r5, 0x58
	muls r0, r5
	adds r3, r0, r7
	ldrh r0, [r3, 0x2C]
	lsrs r1, r0, 2
	adds r2, r1, 0
	cmp r1, 0
	bne _080277C6
	movs r2, 0x1
_080277C6:
	ldrh r0, [r3, 0x28]
	cmp r0, r2
	bhi _080277EC
	ldr r1, _080277E4
	movs r0, 0
	str r0, [r1]
	ldr r1, _080277E8
	movs r0, 0x1
	strb r0, [r1, 0x5]
	b _08027840
	.align 2, 0
_080277DC: .4byte gBattleMons
_080277E0: .4byte gUnknown_02024C07
_080277E4: .4byte gUnknown_02024BEC
_080277E8: .4byte gUnknown_02024D1E
_080277EC:
	ldr r4, _08027850
	str r1, [r4]
	cmp r1, 0
	bne _080277F8
	movs r0, 0x1
	str r0, [r4]
_080277F8:
	ldrb r0, [r6]
	adds r2, r0, 0
	muls r2, r5
	adds r3, r7, 0
	adds r3, 0x50
	adds r2, r3
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 17
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r3
	ldr r0, [r1]
	ldr r2, _08027854
	ands r0, r2
	str r0, [r1]
	ldr r2, _08027858
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, [r4]
	movs r2, 0
	strb r1, [r0, 0xA]
	ldr r0, _0802785C
	strb r2, [r0, 0x5]
	ldr r2, _08027860
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	str r0, [r2]
_08027840:
	ldr r1, _08027864
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027850: .4byte gUnknown_02024BEC
_08027854: .4byte 0xffff1fff
_08027858: .4byte gUnknown_02024CA8
_0802785C: .4byte gUnknown_02024D1E
_08027860: .4byte gUnknown_02024C6C
_08027864: .4byte gUnknown_02024C10
	thumb_func_end sub_80275D8

	thumb_func_start sub_8027694
sub_8027694: @ 8027868
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r3, 0
	ldr r0, _080278A8
	ldrh r1, [r0]
	ldr r4, _080278AC
	adds r5, r0, 0
	cmp r1, r4
	beq _08027890
	cmp r1, r2
	beq _08027890
	adds r1, r5, 0
_08027882:
	adds r1, 0x2
	adds r3, 0x1
	ldrh r0, [r1]
	cmp r0, r4
	beq _08027890
	cmp r0, r2
	bne _08027882
_08027890:
	lsls r0, r3, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r0, _080278AC
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080278A8: .4byte gUnknown_081FACFE
_080278AC: .4byte 0x0000fffe
	thumb_func_end sub_8027694

	thumb_func_start atk9D_copyattack
atk9D_copyattack: @ 80278B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08027928
	ldr r1, _0802792C
	adds r7, r1, 0
	strh r7, [r0]
	ldr r5, _08027930
	ldr r6, _08027934
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	bl sub_8027694
	lsls r0, 24
	cmp r0, 0
	bne _0802790A
	ldr r3, _08027938
	ldr r2, _0802793C
	ldrb r1, [r2]
	movs r0, 0x58
	adds r4, r1, 0
	muls r4, r0
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r4, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	mov r12, r3
	mov r9, r2
	cmp r1, 0
	bne _0802790A
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r0]
	cmp r1, 0
	beq _0802790A
	cmp r1, r7
	bne _08027944
_0802790A:
	ldr r3, _08027940
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
	b _08027A7C
	.align 2, 0
_08027928: .4byte gUnknown_02024BE8
_0802792C: .4byte 0x0000ffff
_08027930: .4byte gUnknown_02024C34
_08027934: .4byte gUnknown_02024C08
_08027938: .4byte gBattleMons
_0802793C: .4byte gUnknown_02024C07
_08027940: .4byte gUnknown_02024C10
_08027944:
	movs r2, 0
	mov r3, r12
	adds r3, 0xC
	adds r0, r4, r3
	ldrh r0, [r0]
	ldr r4, _080279D4
	mov r10, r4
	cmp r0, r1
	beq _0802797E
	mov r8, r3
	adds r7, r5, 0
	adds r5, r6, 0
	mov r4, r9
	movs r3, 0x58
_08027960:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _0802797E
	lsls r1, r2, 1
	ldrb r0, [r4]
	muls r0, r3
	adds r1, r0
	add r1, r8
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r7
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _08027960
_0802797E:
	cmp r2, 0x4
	bne _08027A60
	ldr r5, _080279D8
	ldrb r1, [r5]
	lsls r1, 1
	mov r2, r9
	ldrb r0, [r2]
	movs r6, 0x58
	muls r0, r6
	adds r1, r0
	mov r0, r12
	adds r0, 0xC
	adds r1, r0
	ldr r2, _080279DC
	ldr r3, _080279E0
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r4, _080279E4
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r4, [r0, 0x4]
	cmp r4, 0x4
	bhi _080279E8
	mov r1, r9
	ldrb r0, [r1]
	muls r0, r6
	ldrb r1, [r5]
	adds r0, r1
	mov r1, r12
	adds r1, 0x24
	adds r0, r1
	strb r4, [r0]
	b _080279FC
	.align 2, 0
_080279D4: .4byte gUnknown_02024C10
_080279D8: .4byte gUnknown_02024BE4
_080279DC: .4byte gUnknown_02024C34
_080279E0: .4byte gUnknown_02024C08
_080279E4: .4byte gBattleMoves
_080279E8:
	mov r4, r9
	ldrb r0, [r4]
	muls r0, r6
	ldrb r1, [r5]
	adds r0, r1
	mov r1, r12
	adds r1, 0x24
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
_080279FC:
	ldr r1, _08027A54
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08027A58
	mov r2, r9
	ldrb r0, [r2]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r4, [r2, 0x18]
	lsrs r3, r4, 4
	ldr r1, _08027A5C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	orrs r1, r3
	lsls r1, 4
	movs r0, 0xF
	ands r0, r4
	orrs r0, r1
	strb r0, [r2, 0x18]
	mov r4, r10
	ldr r0, [r4]
	adds r0, 0x5
	str r0, [r4]
	b _08027A7C
	.align 2, 0
_08027A54: .4byte gUnknown_030041C0
_08027A58: .4byte gUnknown_02024CA8
_08027A5C: .4byte gBitTable
_08027A60:
	mov r0, r10
	ldr r2, [r0]
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
	mov r2, r10
	str r1, [r2]
_08027A7C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atk9D_copyattack

	thumb_func_start sub_80278B8
sub_80278B8: @ 8027A8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _08027B0C
	movs r6, 0xB1
	lsls r6, 1
	ldr r5, _08027B10
	ldr r0, _08027B14
	mov r8, r0
_08027A9E:
	bl Random
	ldr r2, _08027B18
	adds r1, r2, 0
	ands r0, r1
	adds r0, 0x1
	strh r0, [r7]
	cmp r0, r6
	bhi _08027A9E
	movs r0, 0x3
_08027AB2:
	subs r0, 0x1
	cmp r0, 0
	bge _08027AB2
	ldr r4, _08027B0C
	ldrh r2, [r4]
	ldr r3, _08027B1C
	subs r0, r5, 0x2
_08027AC0:
	adds r0, 0x2
	ldrh r1, [r0]
	cmp r1, r2
	beq _08027ACC
	cmp r1, r3
	bne _08027AC0
_08027ACC:
	ldr r0, _08027B1C
	cmp r1, r0
	bne _08027A9E
	ldr r2, _08027B20
	ldr r0, [r2]
	ldr r1, _08027B24
	ands r0, r1
	str r0, [r2]
	ldr r3, _08027B28
	ldr r2, _08027B2C
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _08027B30
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027B0C: .4byte gUnknown_02024BE6
_08027B10: .4byte gUnknown_081FACFE
_08027B14: .4byte gUnknown_02024C10
_08027B18: .4byte 0x000001ff
_08027B1C: .4byte 0x0000ffff
_08027B20: .4byte gUnknown_02024C6C
_08027B24: .4byte 0xfffffbff
_08027B28: .4byte gUnknown_081D6BBC
_08027B2C: .4byte gBattleMoves
_08027B30: .4byte gUnknown_02024C08
	thumb_func_end sub_80278B8

	thumb_func_start sub_8027960
sub_8027960: @ 8027B34
	ldr r3, _08027B54
	ldr r2, _08027B58
	ldr r0, _08027B5C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r0, [r0]
	str r0, [r3]
	ldr r1, _08027B60
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08027B54: .4byte gUnknown_02024BEC
_08027B58: .4byte gBattleMons
_08027B5C: .4byte gUnknown_02024C07
_08027B60: .4byte gUnknown_02024C10
	thumb_func_end sub_8027960

	thumb_func_start atkA0_psywavedamageeffect
atkA0_psywavedamageeffect: @ 8027B64
	push {r4,lr}
	movs r4, 0xF
_08027B68:
	bl Random
	adds r3, r4, 0
	ands r3, r0
	cmp r3, 0xA
	bgt _08027B68
	lsls r0, r3, 2
	adds r0, r3
	lsls r3, r0, 1
	ldr r4, _08027BA8
	ldr r2, _08027BAC
	ldr r0, _08027BB0
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2A
	ldrb r1, [r0]
	adds r0, r3, 0
	adds r0, 0x32
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	str r0, [r4]
	ldr r1, _08027BB4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027BA8: .4byte gUnknown_02024BEC
_08027BAC: .4byte gBattleMons
_08027BB0: .4byte gUnknown_02024C07
_08027BB4: .4byte gUnknown_02024C10
	thumb_func_end atkA0_psywavedamageeffect

	thumb_func_start atkA1_counterdamagecalculator
atkA1_counterdamagecalculator: @ 8027BB8
	push {r4-r6,lr}
	ldr r4, _08027C28
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _08027C2C
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r5
	ldrb r0, [r0, 0xC]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r0, r5, 0x4
	adds r0, r1, r0
	ldr r3, [r0]
	cmp r3, 0
	beq _08027C6C
	cmp r6, r2
	beq _08027C6C
	ldr r6, _08027C30
	adds r0, r1, r5
	ldrb r0, [r0, 0xC]
	movs r4, 0x58
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08027C6C
	ldr r1, _08027C34
	lsls r0, r3, 1
	str r0, [r1]
	ldr r1, _08027C38
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _08027C40
	ldrb r1, [r1, 0x9]
	adds r0, r1, 0
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08027C40
	ldr r0, _08027C3C
	strb r1, [r0]
	b _08027C50
	.align 2, 0
_08027C28: .4byte gUnknown_02024C07
_08027C2C: .4byte gUnknown_02024D28
_08027C30: .4byte gBattleMons
_08027C34: .4byte gUnknown_02024BEC
_08027C38: .4byte gUnknown_02024C80
_08027C3C: .4byte gUnknown_02024C08
_08027C40:
	ldr r2, _08027C5C
	ldr r1, _08027C60
	ldr r0, _08027C64
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0xC]
	strb r0, [r2]
_08027C50:
	ldr r1, _08027C68
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08027C9C
	.align 2, 0
_08027C5C: .4byte gUnknown_02024C08
_08027C60: .4byte gUnknown_02024D28
_08027C64: .4byte gUnknown_02024C07
_08027C68: .4byte gUnknown_02024C10
_08027C6C:
	ldr r2, _08027CA4
	ldr r0, _08027CA8
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08027CAC
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
_08027C9C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027CA4: .4byte gUnknown_02024D68
_08027CA8: .4byte gUnknown_02024C07
_08027CAC: .4byte gUnknown_02024C10
	thumb_func_end atkA1_counterdamagecalculator

	thumb_func_start atkA2_mirrorcoatdamagecalculator
atkA2_mirrorcoatdamagecalculator: @ 8027CB0
	push {r4-r6,lr}
	ldr r4, _08027D20
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _08027D24
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r5
	ldrb r0, [r0, 0xD]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r3, [r0]
	cmp r3, 0
	beq _08027D64
	cmp r6, r2
	beq _08027D64
	ldr r6, _08027D28
	adds r0, r1, r5
	ldrb r0, [r0, 0xD]
	movs r4, 0x58
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08027D64
	ldr r1, _08027D2C
	lsls r0, r3, 1
	str r0, [r1]
	ldr r1, _08027D30
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _08027D38
	ldrb r1, [r1, 0x9]
	adds r0, r1, 0
	muls r0, r4
	adds r0, r6
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08027D38
	ldr r0, _08027D34
	strb r1, [r0]
	b _08027D48
	.align 2, 0
_08027D20: .4byte gUnknown_02024C07
_08027D24: .4byte gUnknown_02024D28
_08027D28: .4byte gBattleMons
_08027D2C: .4byte gUnknown_02024BEC
_08027D30: .4byte gUnknown_02024C80
_08027D34: .4byte gUnknown_02024C08
_08027D38:
	ldr r2, _08027D54
	ldr r1, _08027D58
	ldr r0, _08027D5C
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0xD]
	strb r0, [r2]
_08027D48:
	ldr r1, _08027D60
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08027D94
	.align 2, 0
_08027D54: .4byte gUnknown_02024C08
_08027D58: .4byte gUnknown_02024D28
_08027D5C: .4byte gUnknown_02024C07
_08027D60: .4byte gUnknown_02024C10
_08027D64:
	ldr r2, _08027D9C
	ldr r0, _08027DA0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08027DA4
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
_08027D94:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027D9C: .4byte gUnknown_02024D68
_08027DA0: .4byte gUnknown_02024C07
_08027DA4: .4byte gUnknown_02024C10
	thumb_func_end atkA2_mirrorcoatdamagecalculator

	thumb_func_start atkA3_disablelastusedattack
atkA3_disablelastusedattack: @ 8027DA8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r4, 0
	ldr r2, _08027EA8
	ldr r3, _08027EAC
	ldrb r1, [r3]
	movs r0, 0x58
	muls r0, r1
	adds r7, r2, 0
	adds r7, 0xC
	adds r0, r7
	ldr r5, _08027EB0
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r0]
	mov r9, r2
	adds r6, r3, 0
	ldr r2, _08027EB4
	mov r8, r2
	ldrh r1, [r1]
	cmp r0, r1
	beq _08027DFC
	mov r12, r6
	movs r3, 0x58
_08027DDC:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08027DFC
	lsls r2, r4, 1
	mov r0, r12
	ldrb r1, [r0]
	adds r0, r1, 0
	muls r0, r3
	adds r2, r0
	adds r2, r7
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08027DDC
_08027DFC:
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _08027EC0
	cmp r4, 0x4
	beq _08027EC0
	movs r5, 0x58
	adds r0, r1, 0
	muls r0, r5
	adds r0, r4, r0
	mov r1, r9
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08027EC0
	ldr r1, _08027EB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	lsls r2, r4, 1
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r2, r0
	mov r3, r9
	adds r3, 0xC
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r2, r0
	adds r0, r3
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r8
	muls r1, r5
	adds r2, r1
	adds r2, r3
	ldrh r1, [r2]
	strh r1, [r0, 0x4]
	bl Random
	ldrb r2, [r6]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r8
	movs r2, 0x3
	ands r2, r0
	adds r2, 0x2
	ldrb r3, [r1, 0xB]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xB]
	ldrb r0, [r6]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r3, [r1, 0xB]
	lsls r2, r3, 28
	lsrs r2, 24
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xB]
	ldr r1, _08027EBC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08027EDA
	.align 2, 0
_08027EA8: .4byte gBattleMons
_08027EAC: .4byte gUnknown_02024C08
_08027EB0: .4byte gUnknown_02024C34
_08027EB4: .4byte gUnknown_02024CA8
_08027EB8: .4byte gUnknown_030041C0
_08027EBC: .4byte gUnknown_02024C10
_08027EC0:
	ldr r3, _08027EE8
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
_08027EDA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027EE8: .4byte gUnknown_02024C10
	thumb_func_end atkA3_disablelastusedattack

	thumb_func_start atkA4_setencore
atkA4_setencore: @ 8027EEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r3, _08027FE0
	ldr r4, _08027FE4
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r6, r3, 0
	adds r6, 0xC
	adds r0, r6
	ldr r2, _08027FE8
	lsls r1, 1
	adds r1, r2
	ldrh r0, [r0]
	mov r10, r3
	mov r8, r2
	ldr r2, _08027FEC
	mov r9, r2
	ldrh r1, [r1]
	cmp r0, r1
	beq _08027F46
	mov r12, r4
	adds r7, r6, 0
	mov r6, r8
	movs r3, 0x58
_08027F26:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _08027F46
	lsls r2, r5, 1
	mov r0, r12
	ldrb r1, [r0]
	adds r0, r1, 0
	muls r0, r3
	adds r2, r0
	adds r2, r7
	lsls r1, 1
	adds r1, r6
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08027F26
_08027F46:
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrh r2, [r0]
	cmp r2, 0xA5
	beq _08027F5A
	cmp r2, 0xE3
	beq _08027F5A
	cmp r2, 0x77
	bne _08027F5C
_08027F5A:
	movs r5, 0x4
_08027F5C:
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r2, r9
	adds r3, r0, r2
	ldrh r0, [r3, 0x6]
	cmp r0, 0
	bne _08027FF4
	cmp r5, 0x4
	beq _08027FF4
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	adds r0, r5, r2
	mov r1, r10
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08027FF4
	lsls r0, r5, 1
	adds r0, r2
	subs r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3, 0x6]
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	strb r5, [r0, 0xC]
	bl Random
	ldrb r2, [r4]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	add r1, r9
	movs r2, 0x3
	ands r2, r0
	adds r2, 0x3
	ldrb r3, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xE]
	ldrb r0, [r4]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r9
	ldrb r3, [r1, 0xE]
	lsls r2, r3, 28
	lsrs r2, 24
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xE]
	ldr r1, _08027FF0
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802800E
	.align 2, 0
_08027FE0: .4byte gBattleMons
_08027FE4: .4byte gUnknown_02024C08
_08027FE8: .4byte gUnknown_02024C34
_08027FEC: .4byte gUnknown_02024CA8
_08027FF0: .4byte gUnknown_02024C10
_08027FF4:
	ldr r3, _0802801C
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
_0802800E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802801C: .4byte gUnknown_02024C10
	thumb_func_end atkA4_setencore

	thumb_func_start sub_8027E4C
sub_8027E4C: @ 8028020
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r7, _080280C0
	ldr r0, _080280C4
	mov r8, r0
	ldrb r0, [r0]
	movs r6, 0x58
	adds r2, r0, 0
	muls r2, r6
	adds r0, r7, 0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	bne _080280EC
	ldr r1, _080280C8
	mov r12, r1
	ldrb r0, [r1]
	muls r0, r6
	adds r0, r7
	ldrh r4, [r0, 0x28]
	adds r0, r2, r7
	ldrh r2, [r0, 0x28]
	adds r4, r2
	asrs r4, 1
	ldr r5, _080280CC
	mov r9, r5
	subs r2, r4
	str r2, [r5]
	ldr r3, _080280D0
	ldr r1, _080280D4
	adds r0, r3, r1
	strb r2, [r0]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r2
	asrs r0, 8
	ldr r5, _080280D8
	adds r1, r3, r5
	strb r0, [r1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r2
	asrs r0, 16
	adds r5, 0x1
	adds r1, r3, r5
	strb r0, [r1]
	lsrs r2, 24
	ldr r0, _080280DC
	adds r3, r0
	strb r2, [r3]
	mov r1, r12
	ldrb r0, [r1]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0, 0x28]
	subs r0, r4
	mov r5, r9
	str r0, [r5]
	ldr r2, _080280E0
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r1, _080280E4
	str r1, [r0]
	ldr r1, _080280E8
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _08028106
	.align 2, 0
_080280C0: .4byte gBattleMons
_080280C4: .4byte gUnknown_02024C08
_080280C8: .4byte gUnknown_02024C07
_080280CC: .4byte gUnknown_02024BEC
_080280D0: .4byte 0x02000000
_080280D4: .4byte 0x00016014
_080280D8: .4byte 0x00016015
_080280DC: .4byte 0x00016017
_080280E0: .4byte gUnknown_02024D68
_080280E4: .4byte 0x0000ffff
_080280E8: .4byte gUnknown_02024C10
_080280EC:
	ldr r3, _08028114
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
_08028106:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028114: .4byte gUnknown_02024C10
	thumb_func_end sub_8027E4C

	thumb_func_start sub_8027F44
sub_8027F44: @ 8028118
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _0802817C
	ldr r4, _08028180
	ldrb r0, [r4]
	lsls r0, 1
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, 0
	beq _08028160
	ldr r0, _08028184
	cmp r1, r0
	beq _08028160
	ldrh r0, [r2]
	bl sub_8028350
	lsls r0, 24
	cmp r0, 0
	beq _080281F8
	ldr r2, _08028188
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _080281F8
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _080281F8
_08028160:
	ldr r3, _0802818C
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
	b _080282E4
	.align 2, 0
_0802817C: .4byte gUnknown_02024C3C
_08028180: .4byte gUnknown_02024C07
_08028184: .4byte 0x0000ffff
_08028188: .4byte gUnknown_02024D28
_0802818C: .4byte gUnknown_02024C10
_08028190:
	mov r0, r12
	strb r5, [r0]
	mov r1, r10
	ldrb r0, [r1]
	muls r0, r2
	adds r0, r7
	adds r0, 0x22
	strb r5, [r0]
	ldr r1, _080281B4
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r5, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r1, _080281B8
	b _080281E6
	.align 2, 0
_080281B4: .4byte gUnknown_030041C0
_080281B8: .4byte gUnknown_02024C10
_080281BC:
	mov r0, r8
	adds r0, 0x1
	adds r0, r3
	ldrb r2, [r0]
	strb r2, [r4]
	mov r4, r10
	ldrb r0, [r4]
	muls r0, r6
	ldr r7, _080281F0
	adds r0, r7
	adds r0, 0x22
	strb r2, [r0]
	ldr r1, _080281F4
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x3
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	mov r1, r12
_080281E6:
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _080282E4
	.align 2, 0
_080281F0: .4byte gBattleMons
_080281F4: .4byte gUnknown_030041C0
_080281F8:
	movs r4, 0
	mov r8, r4
	movs r7, 0x7F
	mov r9, r7
_08028200:
	bl Random
	mov r4, r9
	ands r4, r0
	cmp r4, 0x70
	bhi _08028200
	lsls r0, r4, 1
	adds r4, r0, r4
	ldr r6, _080282F4
	adds r3, r4, r6
	ldr r1, _080282F8
	ldr r2, _080282FC
	ldrb r5, [r2]
	lsls r0, r5, 1
	adds r0, r1
	ldrb r1, [r3]
	mov r10, r2
	ldrh r0, [r0]
	cmp r1, r0
	bne _0802825C
	adds r0, r4, 0x2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0802825C
	ldr r7, _08028300
	movs r2, 0x58
	adds r0, r5, 0
	muls r0, r2
	adds r3, r0, r7
	movs r0, 0x21
	adds r0, r3
	mov r12, r0
	adds r0, r4, 0x1
	adds r0, r6
	ldrb r5, [r0]
	mov r1, r12
	ldrb r0, [r1]
	adds r1, r5, 0
	cmp r0, r1
	beq _0802825C
	adds r0, r3, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	bne _08028190
_0802825C:
	movs r7, 0x1
	add r8, r7
	ldr r0, _08028304
	cmp r8, r0
	ble _08028200
	movs r0, 0
	mov r8, r0
	ldr r1, _08028308
	mov r12, r1
	ldr r3, _080282F4
	adds r0, r4, 0x1
	adds r0, r3
	mov r9, r0
	adds r5, r3, 0
_08028278:
	ldrb r1, [r5]
	cmp r1, 0xFF
	bgt _08028282
	cmp r1, 0xFE
	bge _080282BC
_08028282:
	mov r4, r10
	ldrb r2, [r4]
	lsls r0, r2, 1
	ldr r7, _080282F8
	adds r0, r7
	ldrh r0, [r0]
	cmp r1, r0
	bne _080282BC
	ldrb r0, [r5, 0x2]
	cmp r0, 0x5
	bhi _080282BC
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	ldr r1, _08028300
	adds r2, r0, r1
	adds r4, r2, 0
	adds r4, 0x21
	ldrb r0, [r4]
	mov r7, r9
	ldrb r1, [r7]
	cmp r0, r1
	beq _080282BC
	adds r0, r2, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, r1
	beq _080282BC
	b _080281BC
_080282BC:
	adds r5, 0x3
	movs r0, 0x3
	add r8, r0
	ldr r0, _0802830C
	cmp r8, r0
	bls _08028278
	mov r1, r12
	ldr r2, [r1]
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
	mov r4, r12
	str r1, [r4]
_080282E4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080282F4: .4byte gTypeEffectiveness
_080282F8: .4byte gUnknown_02024C44
_080282FC: .4byte gUnknown_02024C07
_08028300: .4byte gBattleMons
_08028304: .4byte 0x000003e7
_08028308: .4byte gUnknown_02024C10
_0802830C: .4byte 0x0000014f
	thumb_func_end sub_8027F44

	thumb_func_start atkA7_setalwayshitflag
atkA7_setalwayshitflag: @ 8028310
	push {r4,lr}
	ldr r4, _08028354
	ldr r3, _08028358
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x19
	negs r2, r2
	ands r0, r2
	str r0, [r1]
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x10
	orrs r0, r2
	str r0, [r1]
	ldr r2, _0802835C
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08028360
	ldrb r1, [r1]
	strb r1, [r0, 0x15]
	ldr r1, _08028364
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028354: .4byte gUnknown_02024C98
_08028358: .4byte gUnknown_02024C08
_0802835C: .4byte gUnknown_02024CA8
_08028360: .4byte gUnknown_02024C07
_08028364: .4byte gUnknown_02024C10
	thumb_func_end atkA7_setalwayshitflag

	thumb_func_start atkA8_copymovepermanently
atkA8_copymovepermanently: @ 8028368
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _080284C8
	ldr r1, _080284CC
	adds r5, r1, 0
	strh r5, [r0]
	ldr r3, _080284D0
	ldr r2, _080284D4
	ldrb r1, [r2]
	movs r0, 0x58
	adds r4, r1, 0
	muls r4, r0
	adds r0, r3, 0
	adds r0, 0x50
	adds r0, r4, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	mov r12, r3
	mov r10, r2
	cmp r1, 0
	beq _080283A0
	b _080284F4
_080283A0:
	ldr r0, _080284D8
	ldr r2, _080284DC
	ldrb r1, [r2]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	mov r9, r0
	mov r8, r2
	cmp r1, 0xA5
	bne _080283B6
	b _080284F4
_080283B6:
	cmp r1, 0
	bne _080283BC
	b _080284F4
_080283BC:
	cmp r1, r5
	bne _080283C2
	b _080284F4
_080283C2:
	cmp r1, 0xA6
	bne _080283C8
	b _080284F4
_080283C8:
	movs r7, 0
	mov r5, r9
	mov r0, r12
	adds r0, 0xC
	adds r1, r4, r0
	mov r3, r8
_080283D4:
	ldrh r2, [r1]
	cmp r2, 0xA6
	beq _080283E6
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r2, r0
	beq _080283EE
_080283E6:
	adds r1, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _080283D4
_080283EE:
	cmp r7, 0x4
	beq _080283F4
	b _080284F4
_080283F4:
	ldr r4, _080284E0
	ldrb r1, [r4]
	lsls r1, 1
	mov r2, r10
	ldrb r0, [r2]
	movs r3, 0x58
	muls r0, r3
	adds r1, r0
	mov r6, r12
	adds r6, 0xC
	adds r1, r6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, r10
	ldrb r0, [r1]
	adds r2, r0, 0
	muls r2, r3
	ldrb r4, [r4]
	adds r2, r4
	mov r5, r12
	adds r5, 0x24
	adds r2, r5
	ldr r4, _080284E4
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	add r0, r9
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x4]
	strb r0, [r2]
	ldr r1, _080284E8
	mov r2, r10
	ldrb r0, [r2]
	strb r0, [r1]
	movs r7, 0
	ldrb r0, [r2]
	muls r0, r3
	adds r4, r0, r5
	adds r3, r0, 0
	add r2, sp, 0x4
	add r5, sp, 0xC
_08028456:
	adds r0, r3, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r1, r5, r7
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x1
	adds r3, 0x2
	adds r2, 0x2
	adds r7, 0x1
	cmp r7, 0x3
	ble _08028456
	add r2, sp, 0x4
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r12
	adds r0, 0x3B
	ldrb r0, [r0]
	strb r0, [r2, 0xC]
	str r2, [sp]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x10
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldr r0, _080284E8
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _080284EC
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r3, _080284D8
	ldr r2, _080284DC
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _080284F0
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802850E
	.align 2, 0
_080284C8: .4byte gUnknown_02024BE8
_080284CC: .4byte 0x0000ffff
_080284D0: .4byte gBattleMons
_080284D4: .4byte gUnknown_02024C07
_080284D8: .4byte gUnknown_02024C2C
_080284DC: .4byte gUnknown_02024C08
_080284E0: .4byte gUnknown_02024BE4
_080284E4: .4byte gBattleMoves
_080284E8: .4byte gUnknown_02024A60
_080284EC: .4byte gUnknown_030041C0
_080284F0: .4byte gUnknown_02024C10
_080284F4:
	ldr r3, _08028520
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
_0802850E:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028520: .4byte gUnknown_02024C10
	thumb_func_end atkA8_copymovepermanently

	thumb_func_start sub_8028350
sub_8028350: @ 8028524
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08028554
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x91
	beq _0802854E
	cmp r0, 0x27
	beq _0802854E
	cmp r0, 0x4B
	beq _0802854E
	cmp r0, 0x97
	beq _0802854E
	cmp r0, 0x9B
	beq _0802854E
	cmp r0, 0x1A
	bne _08028558
_0802854E:
	movs r0, 0x1
	b _0802855A
	.align 2, 0
_08028554: .4byte gBattleMoves
_08028558:
	movs r0, 0
_0802855A:
	pop {r1}
	bx r1
	thumb_func_end sub_8028350

	thumb_func_start sub_802838C
sub_802838C: @ 8028560
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0802857E
	cmp r1, 0xD6
	beq _0802857E
	movs r0, 0x89
	lsls r0, 1
	cmp r1, r0
	beq _0802857E
	cmp r1, 0x77
	beq _0802857E
	cmp r1, 0x76
	bne _08028582
_0802857E:
	movs r0, 0x1
	b _08028584
_08028582:
	movs r0, 0
_08028584:
	pop {r1}
	bx r1
	thumb_func_end sub_802838C

	thumb_func_start move_weather_interaction
move_weather_interaction: @ 8028588
	push {lr}
	lsls r1, 16
	lsrs r2, r1, 16
	ldr r1, _080285E0
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x97
	bne _080285AC
	ldr r0, _080285E4
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _080285EC
_080285AC:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0x91
	beq _080285CE
	cmp r0, 0x27
	beq _080285CE
	cmp r0, 0x4B
	beq _080285CE
	cmp r0, 0x97
	beq _080285CE
	cmp r0, 0x9B
	beq _080285CE
	cmp r0, 0x1A
	bne _080285EC
_080285CE:
	ldr r0, _080285E8
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 20
	ands r0, r1
	cmp r0, 0
	beq _080285EC
	movs r0, 0x1
	b _080285EE
	.align 2, 0
_080285E0: .4byte gBattleMoves
_080285E4: .4byte word_2024DB8
_080285E8: .4byte gUnknown_02024C6C
_080285EC:
	movs r0, 0x2
_080285EE:
	pop {r1}
	bx r1
	thumb_func_end move_weather_interaction

	thumb_func_start sub_8028420
sub_8028420: @ 80285F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r5, 0
	ldr r0, _08028684
	mov r9, r0
	movs r1, 0x58
	mov r8, r1
	ldr r7, _08028688
	movs r0, 0x84
	lsls r0, 1
	mov r10, r0
_08028612:
	lsls r4, r5, 1
	mov r1, r9
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4, r0
	adds r0, r7
	ldrh r0, [r0]
	bl sub_802838C
	lsls r0, 24
	cmp r0, 0
	bne _08028652
	mov r1, r9
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r4, r0
	adds r0, r7
	ldrh r1, [r0]
	cmp r1, r10
	beq _08028652
	cmp r1, 0xFD
	beq _08028652
	adds r0, r1, 0
	bl sub_8028350
	lsls r0, 24
	cmp r0, 0
	beq _08028660
_08028652:
	ldr r1, _0802868C
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r6, r0
	lsls r0, r6, 24
	lsrs r6, r0, 24
_08028660:
	adds r5, 0x1
	cmp r5, 0x3
	ble _08028612
	ldr r0, _08028684
	ldrb r0, [r0]
	adds r1, r6, 0
	movs r2, 0xFD
	bl sub_8015A98
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bne _08028694
	ldr r1, _08028690
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _080286F8
	.align 2, 0
_08028684: .4byte gUnknown_02024C07
_08028688: .4byte gUnknown_02024A8C
_0802868C: .4byte gBitTable
_08028690: .4byte gUnknown_02024C10
_08028694:
	movs r7, 0x3
	ldr r4, _08028708
_08028698:
	bl Random
	adds r5, r7, 0
	ands r5, r0
	lsls r0, r5, 2
	adds r0, r4
	ldr r0, [r0]
	ands r0, r6
	cmp r0, 0
	bne _08028698
	ldr r4, _0802870C
	ldr r2, _08028710
	lsls r1, r5, 1
	ldr r0, _08028714
	ldrb r3, [r0]
	movs r0, 0x58
	muls r0, r3
	adds r1, r0
	adds r2, 0xC
	adds r1, r2
	ldrh r0, [r1]
	strh r0, [r4]
	ldr r0, _08028718
	strb r5, [r0]
	ldr r2, _0802871C
	ldr r0, [r2]
	ldr r1, _08028720
	ands r0, r1
	str r0, [r2]
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _08028724
	strb r0, [r1]
	ldr r3, _08028728
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
_080286F8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028708: .4byte gBitTable
_0802870C: .4byte gUnknown_02024BEA
_08028710: .4byte gBattleMons
_08028714: .4byte gUnknown_02024C07
_08028718: .4byte gUnknown_02024BE4
_0802871C: .4byte gUnknown_02024C6C
_08028720: .4byte 0xfffffbff
_08028724: .4byte gUnknown_02024C08
_08028728: .4byte gUnknown_02024C10
	thumb_func_end sub_8028420

	thumb_func_start sub_8028558
sub_8028558: @ 802872C
	ldr r1, _08028750
	ldr r0, _08028754
	ldrb r2, [r0]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 18
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08028758
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08028750: .4byte gBattleMons
_08028754: .4byte gUnknown_02024C07
_08028758: .4byte gUnknown_02024C10
	thumb_func_end sub_8028558

	thumb_func_start b_feature_update_destiny_bond
b_feature_update_destiny_bond: @ 802875C
	push {r4,r5,lr}
	ldr r0, _080287AC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080287B0
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080287B4
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _080287A6
	cmp r5, r3
	beq _080287A6
	ldr r2, _080287B8
	ldr r1, [r2]
	movs r0, 0x80
	lsls r0, 17
	ands r0, r1
	cmp r0, 0
	bne _080287A6
	movs r0, 0x40
	orrs r1, r0
	str r1, [r2]
_080287A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080287AC: .4byte gUnknown_02024C07
_080287B0: .4byte gUnknown_02024C08
_080287B4: .4byte gBattleMons
_080287B8: .4byte gUnknown_02024C6C
	thumb_func_end b_feature_update_destiny_bond

	thumb_func_start atkAB_802A458
atkAB_802A458: @ 80287BC
	push {lr}
	bl b_feature_update_destiny_bond
	ldr r1, _080287D0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080287D0: .4byte gUnknown_02024C10
	thumb_func_end atkAB_802A458

	thumb_func_start atkAC_remaininghptopower
atkAC_remaininghptopower: @ 80287D4
	push {lr}
	ldr r2, _08028828
	ldr r0, _0802882C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	movs r2, 0x28
	ldrsh r0, [r1, r2]
	movs r2, 0x2C
	ldrsh r1, [r1, r2]
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0
	ldr r0, _08028830
	ldrb r2, [r0]
	cmp r1, r2
	ble _0802880E
	adds r2, r0, 0
_08028800:
	adds r3, 0x2
	cmp r3, 0xB
	bgt _0802880E
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r1, r0
	bgt _08028800
_0802880E:
	ldr r2, _08028834
	ldr r1, _08028830
	adds r0, r3, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2]
	ldr r1, _08028838
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08028828: .4byte gBattleMons
_0802882C: .4byte gUnknown_02024C07
_08028830: .4byte gUnknown_081FAD26
_08028834: .4byte gUnknown_02024DEC
_08028838: .4byte gUnknown_02024C10
	thumb_func_end atkAC_remaininghptopower

	thumb_func_start sub_8028668
sub_8028668: @ 802883C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, _080289CC
	ldr r1, _080289D0
	ldrb r2, [r1]
	lsls r0, r2, 1
	adds r0, r4
	ldrh r3, [r0]
	mov r8, r1
	cmp r3, 0
	bne _0802885C
	b _080289FC
_0802885C:
	ldr r0, _080289D4
	cmp r3, r0
	bne _08028864
	b _080289FC
_08028864:
	ldr r1, _080289D8
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080289DC
	ands r0, r1
	cmp r0, 0
	beq _08028876
	b _080289FC
_08028876:
	movs r7, 0
	ldr r0, _080289E0
	movs r1, 0x58
	muls r1, r2
	adds r2, r0, 0
	adds r2, 0xC
	adds r1, r2
	ldrh r1, [r1]
	cmp r3, r1
	beq _080288AE
	adds r6, r4, 0
	mov r5, r8
	adds r4, r2, 0
	movs r3, 0x58
_08028892:
	adds r7, 0x1
	cmp r7, 0x3
	bgt _080288AE
	ldrb r0, [r5]
	lsls r2, r0, 1
	adds r2, r6
	lsls r1, r7, 1
	muls r0, r3
	adds r1, r0
	adds r1, r4
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08028892
_080288AE:
	cmp r7, 0x4
	bne _080288B4
	b _080289FC
_080288B4:
	mov r4, r8
	ldrb r0, [r4]
	movs r1, 0x58
	mov r9, r1
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7, r0
	ldr r1, _080289E0
	adds r1, 0x24
	mov r10, r1
	add r0, r10
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080288D4
	b _080289FC
_080288D4:
	bl Random
	movs r1, 0x3
	ands r1, r0
	adds r6, r1, 0x2
	ldrb r0, [r4]
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r0, r7, r0
	add r0, r10
	ldrb r0, [r0]
	cmp r0, r6
	bge _080288F2
	adds r6, r0, 0
_080288F2:
	ldr r1, _080289E4
	movs r5, 0xFD
	strb r5, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldr r2, _080289CC
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r4, _080289E8
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	strb r5, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	strb r6, [r4, 0x4]
	subs r0, 0x2
	strb r0, [r4, 0x5]
	mov r1, r8
	ldrb r0, [r1]
	mov r1, r9
	muls r1, r0
	adds r1, r7, r1
	add r1, r10
	ldrb r0, [r1]
	subs r0, r6
	strb r0, [r1]
	ldr r4, _080289EC
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r4]
	ldr r1, _080289F0
	ldrb r3, [r4]
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080289F4
	lsls r0, r7, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080289A6
	mov r2, r9
	muls r2, r3
	ldr r0, _080289E0
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080289A6
	adds r1, r7, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	mov r3, r10
	adds r0, r2, r3
	adds r0, r7
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080289A6:
	ldr r1, _080289F8
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r1, _080289E0
	ldr r0, _080289D0
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r0, r7, r0
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08028A16
	adds r0, r2, 0
	bl b_cancel_multi_turn_move_maybe
	b _08028A16
	.align 2, 0
_080289CC: .4byte gUnknown_02024C34
_080289D0: .4byte gUnknown_02024C08
_080289D4: .4byte 0x0000ffff
_080289D8: .4byte gUnknown_02024C98
_080289DC: .4byte 0x000400c0
_080289E0: .4byte gBattleMons
_080289E4: .4byte gUnknown_030041C0
_080289E8: .4byte gUnknown_03004290
_080289EC: .4byte gUnknown_02024A60
_080289F0: .4byte gUnknown_02024CA8
_080289F4: .4byte gBitTable
_080289F8: .4byte gUnknown_02024C10
_080289FC:
	ldr r3, _08028A28
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
_08028A16:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028A28: .4byte gUnknown_02024C10
	thumb_func_end sub_8028668

	thumb_func_start sub_8028858
sub_8028858: @ 8028A2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r4, 0
	str r4, [sp, 0x4]
	movs r7, 0
	ldr r0, _08028A80
	ldrh r0, [r0]
	cmp r0, 0xD7
	beq _08028A46
	b _08028BFA
_08028A46:
	ldr r5, _08028A84
	strb r7, [r5, 0x5]
	ldr r6, _08028A88
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _08028A8C
	mov r9, r1
	cmp r0, 0
	bne _08028A60
	ldr r2, _08028A90
	mov r9, r2
_08028A60:
	ldr r4, _08028A94
	ldrb r3, [r6]
	movs r0, 0x58
	adds r2, r3, 0
	muls r2, r0
	adds r0, r2, r4
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0x2B
	beq _08028A98
	adds r0, r4, 0
	adds r0, 0x4C
	adds r0, r2, r0
	str r7, [r0]
	b _08028AA8
	.align 2, 0
_08028A80: .4byte gUnknown_02024BE6
_08028A84: .4byte gUnknown_02024D1E
_08028A88: .4byte gUnknown_02024C07
_08028A8C: .4byte gEnemyParty
_08028A90: .4byte gPlayerParty
_08028A94: .4byte gBattleMons
_08028A98:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl sub_81074C4
	ldrb r0, [r5, 0x5]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x5]
_08028AA8:
	ldr r4, _08028B08
	ldr r0, _08028B0C
	ldrb r0, [r0]
	bl battle_get_per_side_status
	movs r6, 0x2
	eors r0, r6
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	ldr r1, _08028B10
	ldr r2, _08028B14
	adds r1, r2
	strb r0, [r1]
	strb r0, [r4]
	ldr r0, _08028B18
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08028B38
	ldr r0, _08028B1C
	ldrb r2, [r0]
	ldr r1, _08028B20
	ldrb r3, [r4]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _08028B38
	ldr r5, _08028B24
	movs r0, 0x58
	adds r4, r3, 0
	muls r4, r0
	adds r0, r4, r5
	adds r1, r0, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0x2B
	beq _08028B28
	adds r0, r5, 0
	adds r0, 0x4C
	adds r0, r4, r0
	str r2, [r0]
	b _08028B38
	.align 2, 0
_08028B08: .4byte gUnknown_02024A60
_08028B0C: .4byte gUnknown_02024C07
_08028B10: .4byte 0x02000000
_08028B14: .4byte 0x00016003
_08028B18: .4byte gUnknown_020239F8
_08028B1C: .4byte gUnknown_02024C0C
_08028B20: .4byte gBitTable
_08028B24: .4byte gBattleMons
_08028B28:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl sub_81074C4
	ldr r1, _08028B80
	ldrb r0, [r1, 0x5]
	orrs r0, r6
	strb r0, [r1, 0x5]
_08028B38:
	movs r6, 0
	ldr r0, _08028B84
	mov r8, r0
_08028B3E:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	add r4, r9
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0
	beq _08028BF2
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	beq _08028BF2
	ldr r2, _08028B88
	ldr r0, _08028B8C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r6
	bne _08028B90
	movs r0, 0x58
	muls r0, r1
	b _08028BC0
	.align 2, 0
_08028B80: .4byte gUnknown_02024D1E
_08028B84: .4byte gBattleMons
_08028B88: .4byte gUnknown_02024A6A
_08028B8C: .4byte gUnknown_02024C07
_08028B90:
	ldr r0, _08028BC8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08028BD8
	ldr r0, _08028BCC
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, r6
	bne _08028BD8
	ldr r0, _08028BD0
	ldrb r1, [r0]
	ldr r2, _08028BD4
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08028BD8
	movs r0, 0x58
	muls r0, r3
_08028BC0:
	add r0, r8
	adds r0, 0x20
	ldrb r0, [r0]
	b _08028BE4
	.align 2, 0
_08028BC8: .4byte gUnknown_020239F8
_08028BCC: .4byte gUnknown_02024A60
_08028BD0: .4byte gUnknown_02024C0C
_08028BD4: .4byte gBitTable
_08028BD8:
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetAbilityBySpecies
	lsls r0, 24
	lsrs r0, 24
_08028BE4:
	cmp r0, 0x2B
	beq _08028BF2
	movs r0, 0x1
	lsls r0, r6
	orrs r7, r0
	lsls r0, r7, 24
	lsrs r7, r0, 24
_08028BF2:
	adds r6, 0x1
	cmp r6, 0x5
	ble _08028B3E
	b _08028C52
_08028BFA:
	ldr r1, _08028C88
	movs r0, 0x4
	strb r0, [r1, 0x5]
	movs r7, 0x3F
	ldr r2, _08028C8C
	ldr r1, _08028C90
	ldrb r0, [r1]
	movs r6, 0x58
	muls r0, r6
	adds r5, r2, 0
	adds r5, 0x4C
	adds r0, r5
	str r4, [r0]
	ldrb r0, [r1]
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	ldr r3, _08028C94
	strb r0, [r3]
	ldr r0, _08028C98
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08028C52
	ldr r0, _08028C9C
	ldrb r2, [r0]
	ldr r1, _08028CA0
	ldrb r3, [r3]
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	bne _08028C52
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	str r2, [r0]
_08028C52:
	ldr r4, _08028C94
	ldr r0, _08028C90
	ldrb r0, [r0]
	strb r0, [r4]
	add r1, sp, 0x4
	str r1, [sp]
	movs r0, 0
	movs r1, 0x28
	adds r2, r7, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08028CA4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028C88: .4byte gUnknown_02024D1E
_08028C8C: .4byte gBattleMons
_08028C90: .4byte gUnknown_02024C07
_08028C94: .4byte gUnknown_02024A60
_08028C98: .4byte gUnknown_020239F8
_08028C9C: .4byte gUnknown_02024C0C
_08028CA0: .4byte gBitTable
_08028CA4: .4byte gUnknown_02024C10
	thumb_func_end sub_8028858

	thumb_func_start sub_8028AD4
sub_8028AD4: @ 8028CA8
	push {r4-r7,lr}
	ldr r7, _08028CF8
	ldr r0, _08028CFC
	ldrb r3, [r0]
	movs r6, 0x58
	adds r1, r3, 0
	muls r1, r6
	adds r0, r7, 0
	adds r0, 0x50
	adds r4, r1, r0
	ldr r2, [r4]
	movs r5, 0x80
	lsls r5, 21
	adds r0, r2, 0
	ands r0, r5
	cmp r0, 0
	bne _08028CDA
	ldr r1, _08028D00
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08028D04
	ands r0, r1
	cmp r0, 0
	beq _08028D0C
_08028CDA:
	ldr r3, _08028D08
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
	b _08028D30
	.align 2, 0
_08028CF8: .4byte gBattleMons
_08028CFC: .4byte gUnknown_02024C08
_08028D00: .4byte gUnknown_02024C98
_08028D04: .4byte 0x000400c0
_08028D08: .4byte gUnknown_02024C10
_08028D0C:
	orrs r2, r5
	str r2, [r4]
	ldr r1, _08028D38
	ldr r0, _08028D3C
	ldrb r0, [r0]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _08028D28
	movs r0, 0x1
	str r0, [r1]
_08028D28:
	ldr r1, _08028D40
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08028D30:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028D38: .4byte gUnknown_02024BEC
_08028D3C: .4byte gUnknown_02024C07
_08028D40: .4byte gUnknown_02024C10
	thumb_func_end sub_8028AD4

	thumb_func_start sub_8028B70
sub_8028B70: @ 8028D44
	push {r4,lr}
	ldr r4, _08028D98
	ldrb r0, [r4]
	bl battle_side_get_owner
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08028D9C
	lsls r2, r0, 1
	adds r0, r2, r0
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x6]
	cmp r0, 0x3
	bne _08028DA8
	ldr r2, _08028DA0
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r3, _08028DA4
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
	b _08028DC2
	.align 2, 0
_08028D98: .4byte gUnknown_02024C07
_08028D9C: .4byte gUnknown_02024C80
_08028DA0: .4byte gUnknown_02024D68
_08028DA4: .4byte gUnknown_02024C10
_08028DA8:
	ldr r1, _08028DC8
	adds r1, r2, r1
	ldrh r2, [r1]
	movs r0, 0x10
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r3, 0x6]
	adds r0, 0x1
	strb r0, [r3, 0x6]
	ldr r1, _08028DCC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08028DC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028DC8: .4byte gUnknown_02024C7A
_08028DCC: .4byte gUnknown_02024C10
	thumb_func_end sub_8028B70

	thumb_func_start sub_8028BFC
sub_8028BFC: @ 8028DD0
	ldr r1, _08028DF4
	ldr r0, _08028DF8
	ldrb r2, [r0]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 22
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08028DFC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08028DF4: .4byte gBattleMons
_08028DF8: .4byte gUnknown_02024C08
_08028DFC: .4byte gUnknown_02024C10
	thumb_func_end sub_8028BFC

	thumb_func_start atkB2_setperishsong
atkB2_setperishsong: @ 8028E00
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	movs r3, 0
	ldr r0, _08028E44
	adds r7, r0, 0
	ldr r0, _08028E48
	mov r8, r0
	ldrb r1, [r7]
	cmp r6, r1
	bge _08028E6C
	movs r5, 0x20
	ldr r0, _08028E4C
	mov r12, r0
	ldr r0, _08028E50
	adds r4, r0, 0
	adds r4, 0xF
	ldr r2, _08028E54
_08028E28:
	ldr r1, [r2]
	adds r0, r1, 0
	ands r0, r5
	cmp r0, 0
	bne _08028E40
	movs r0, 0x58
	muls r0, r3
	add r0, r12
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x2B
	bne _08028E58
_08028E40:
	adds r6, 0x1
	b _08028E60
	.align 2, 0
_08028E44: .4byte gUnknown_02024A68
_08028E48: .4byte gUnknown_02024C07
_08028E4C: .4byte gBattleMons
_08028E50: .4byte gUnknown_02024CA8
_08028E54: .4byte gUnknown_02024C98
_08028E58:
	orrs r1, r5
	str r1, [r2]
	movs r0, 0x33
	strb r0, [r4]
_08028E60:
	adds r4, 0x1C
	adds r2, 0x4
	adds r3, 0x1
	ldrb r0, [r7]
	cmp r3, r0
	blt _08028E28
_08028E6C:
	mov r1, r8
	ldrb r0, [r1]
	bl sub_80153D0
	ldr r0, _08028E98
	ldrb r0, [r0]
	cmp r6, r0
	bne _08028EA0
	ldr r3, _08028E9C
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
	b _08028EA8
	.align 2, 0
_08028E98: .4byte gUnknown_02024A68
_08028E9C: .4byte gUnknown_02024C10
_08028EA0:
	ldr r1, _08028EB4
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08028EA8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028EB4: .4byte gUnknown_02024C10
	thumb_func_end atkB2_setperishsong

	thumb_func_start atkB3_rolloutdamagecalculation
atkB3_rolloutdamagecalculation: @ 8028EB8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08028EDC
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _08028EEC
	ldr r0, _08028EE0
	ldrb r0, [r0]
	bl b_cancel_multi_turn_move_maybe
	ldr r1, _08028EE4
	ldr r0, _08028EE8
	str r0, [r1]
	b _08029004
	.align 2, 0
_08028EDC: .4byte gUnknown_02024C68
_08028EE0: .4byte gUnknown_02024C07
_08028EE4: .4byte gUnknown_02024C10
_08028EE8: .4byte BattleScript_1D6F74
_08028EEC:
	ldr r2, _08029010
	ldr r1, _08029014
	ldrb r3, [r1]
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r4, r2, 0
	adds r4, 0x50
	adds r0, r4
	ldr r0, [r0]
	movs r7, 0x80
	lsls r7, 5
	ands r0, r7
	adds r6, r1, 0
	mov r9, r2
	ldr r1, _08029018
	mov r12, r1
	ldr r2, _0802901C
	mov r8, r2
	cmp r0, 0
	bne _08028F5E
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x11]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	movs r2, 0x5
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x11]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x50
	orrs r1, r2
	strb r1, [r0, 0x11]
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r4
	ldr r0, [r1]
	orrs r0, r7
	str r0, [r1]
	ldr r1, _08029020
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r1
	mov r2, r8
	ldrh r1, [r2]
	strh r1, [r0]
_08028F5E:
	ldrb r0, [r6]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	add r2, r12
	ldrb r3, [r2, 0x11]
	lsls r1, r3, 28
	lsrs r1, 28
	subs r1, 0x1
	movs r0, 0xF
	ands r1, r0
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x11]
	cmp r1, 0
	bne _08028F92
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r4
	ldr r0, [r1]
	ldr r2, _08029024
	ands r0, r2
	str r0, [r1]
_08028F92:
	ldr r3, _08029028
	ldr r2, _0802902C
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r3]
	movs r2, 0x1
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r1, r12
	adds r4, r0, r1
	ldrb r0, [r4, 0x11]
	lsls r0, 28
	lsrs r0, 28
	movs r1, 0x5
	subs r1, r0
	ldr r7, _08029030
	adds r5, r3, 0
	cmp r2, r1
	bge _08028FE0
	adds r1, r5, 0
	adds r3, r4, 0
	movs r4, 0x5
_08028FCC:
	ldrh r0, [r1]
	lsls r0, 1
	strh r0, [r1]
	adds r2, 0x1
	ldrb r0, [r3, 0x11]
	lsls r0, 28
	lsrs r0, 28
	subs r0, r4, r0
	cmp r2, r0
	blt _08028FCC
_08028FE0:
	ldrb r1, [r6]
	movs r0, 0x58
	muls r0, r1
	mov r1, r9
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 23
	ands r0, r1
	cmp r0, 0
	beq _08028FFE
	ldrh r0, [r5]
	lsls r0, 1
	strh r0, [r5]
_08028FFE:
	ldr r0, [r7]
	adds r0, 0x1
	str r0, [r7]
_08029004:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029010: .4byte gBattleMons
_08029014: .4byte gUnknown_02024C07
_08029018: .4byte gUnknown_02024CA8
_0802901C: .4byte gUnknown_02024BE6
_08029020: .4byte gUnknown_02024C54
_08029024: .4byte 0xffffefff
_08029028: .4byte gUnknown_02024DEC
_0802902C: .4byte gBattleMoves
_08029030: .4byte gUnknown_02024C10
	thumb_func_end atkB3_rolloutdamagecalculation

	thumb_func_start atkB4_jumpifconfusedandattackmaxed
atkB4_jumpifconfusedandattackmaxed: @ 8029034
	push {r4,r5,lr}
	ldr r5, _08029084
	ldr r0, _08029088
	ldrb r1, [r0]
	movs r0, 0x58
	adds r3, r1, 0
	muls r3, r0
	adds r0, r5, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	ldr r4, _0802908C
	cmp r0, 0
	beq _08029090
	ldr r2, [r4]
	ldrb r0, [r2, 0x1]
	adds r0, r3
	adds r1, r5, 0
	adds r1, 0x18
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xC
	bne _08029090
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
	str r1, [r4]
	b _08029096
	.align 2, 0
_08029084: .4byte gBattleMons
_08029088: .4byte gUnknown_02024C08
_0802908C: .4byte gUnknown_02024C10
_08029090:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_08029096:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end atkB4_jumpifconfusedandattackmaxed

	thumb_func_start sub_8028EC8
sub_8028EC8: @ 802909C
	push {r4,r5,lr}
	ldr r0, _080290C4
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _080290D8
	ldr r2, _080290C8
	ldr r0, _080290CC
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strb r1, [r0, 0x10]
	ldr r1, _080290D0
	ldr r0, _080290D4
	str r0, [r1]
	b _08029130
	.align 2, 0
_080290C4: .4byte gUnknown_02024C68
_080290C8: .4byte gUnknown_02024CA8
_080290CC: .4byte gUnknown_02024C07
_080290D0: .4byte gUnknown_02024C10
_080290D4: .4byte BattleScript_1D6F74
_080290D8:
	ldr r5, _08029138
	ldr r4, _0802913C
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x10]
	cmp r0, 0x5
	beq _080290F0
	adds r0, 0x1
	strb r0, [r1, 0x10]
_080290F0:
	ldr r3, _08029140
	ldr r2, _08029144
	ldr r0, _08029148
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r3]
	movs r2, 0x1
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r4, _0802914C
	ldrb r1, [r0, 0x10]
	cmp r2, r1
	bge _0802912A
	adds r1, r3, 0
	adds r3, r0, 0
_0802911C:
	ldrh r0, [r1]
	lsls r0, 1
	strh r0, [r1]
	adds r2, 0x1
	ldrb r0, [r3, 0x10]
	cmp r2, r0
	blt _0802911C
_0802912A:
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
_08029130:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029138: .4byte gUnknown_02024CA8
_0802913C: .4byte gUnknown_02024C07
_08029140: .4byte gUnknown_02024DEC
_08029144: .4byte gBattleMoves
_08029148: .4byte gUnknown_02024BE6
_0802914C: .4byte gUnknown_02024C10
	thumb_func_end sub_8028EC8

	thumb_func_start atkB6_happinesstodamagecalculation
atkB6_happinesstodamagecalculation: @ 8029150
	push {r4,lr}
	ldr r2, _0802917C
	ldr r0, _08029180
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x79
	bne _08029190
	ldr r4, _08029184
	ldr r2, _08029188
	ldr r0, _0802918C
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2B
	ldrb r1, [r0]
	b _080291A6
	.align 2, 0
_0802917C: .4byte gBattleMoves
_08029180: .4byte gUnknown_02024BE6
_08029184: .4byte gUnknown_02024DEC
_08029188: .4byte gBattleMons
_0802918C: .4byte gUnknown_02024C07
_08029190:
	ldr r4, _080291C4
	ldr r2, _080291C8
	ldr r0, _080291CC
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	movs r1, 0xFF
	subs r1, r0
_080291A6:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	movs r1, 0x19
	bl __divsi3
	strh r0, [r4]
	ldr r1, _080291D0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080291C4: .4byte gUnknown_02024DEC
_080291C8: .4byte gBattleMons
_080291CC: .4byte gUnknown_02024C07
_080291D0: .4byte gUnknown_02024C10
	thumb_func_end atkB6_happinesstodamagecalculation

	thumb_func_start atkB7_presentdamagecalculation
atkB7_presentdamagecalculation: @ 80291D4
	push {r4,lr}
	bl Random
	movs r4, 0xFF
	ands r4, r0
	cmp r4, 0x65
	bgt _080291F0
	ldr r1, _080291EC
	movs r0, 0x28
	strh r0, [r1]
	b _08029232
	.align 2, 0
_080291EC: .4byte gUnknown_02024DEC
_080291F0:
	cmp r4, 0xB1
	bgt _08029200
	ldr r1, _080291FC
	movs r0, 0x50
	strh r0, [r1]
	b _08029232
	.align 2, 0
_080291FC: .4byte gUnknown_02024DEC
_08029200:
	cmp r4, 0xCB
	bgt _08029210
	ldr r1, _0802920C
	movs r0, 0x78
	strh r0, [r1]
	b _08029232
	.align 2, 0
_0802920C: .4byte gUnknown_02024DEC
_08029210:
	ldr r3, _0802923C
	ldr r2, _08029240
	ldr r0, _08029244
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2C]
	lsrs r0, 2
	str r0, [r3]
	cmp r0, 0
	bne _0802922C
	movs r0, 0x1
	str r0, [r3]
_0802922C:
	ldr r0, [r3]
	negs r0, r0
	str r0, [r3]
_08029232:
	cmp r4, 0xCB
	bgt _08029250
	ldr r1, _08029248
	ldr r0, _0802924C
	b _08029280
	.align 2, 0
_0802923C: .4byte gUnknown_02024BEC
_08029240: .4byte gBattleMons
_08029244: .4byte gUnknown_02024C08
_08029248: .4byte gUnknown_02024C10
_0802924C: .4byte BattleScript_1D6F44
_08029250:
	ldr r2, _0802926C
	ldr r0, _08029270
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r1, [r0, 0x2C]
	ldrh r0, [r0, 0x28]
	cmp r1, r0
	bne _0802927C
	ldr r1, _08029274
	ldr r0, _08029278
	b _08029280
	.align 2, 0
_0802926C: .4byte gBattleMons
_08029270: .4byte gUnknown_02024C08
_08029274: .4byte gUnknown_02024C10
_08029278: .4byte BattleScript_1D83B5
_0802927C:
	ldr r1, _08029288
	ldr r0, _0802928C
_08029280:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029288: .4byte gUnknown_02024C10
_0802928C: .4byte BattleScript_1D839B
	thumb_func_end atkB7_presentdamagecalculation

	thumb_func_start sub_80290BC
sub_80290BC: @ 8029290
	push {r4-r6,lr}
	ldr r4, _080292C4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	ldr r6, _080292C8
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080292D4
	ldr r2, _080292CC
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080292D0
	movs r0, 0
	strb r0, [r1, 0x5]
	b _08029306
	.align 2, 0
_080292C4: .4byte gUnknown_02024C07
_080292C8: .4byte gUnknown_02024C7A
_080292CC: .4byte gUnknown_02024C68
_080292D0: .4byte gUnknown_02024D1E
_080292D4:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r6
	ldrh r0, [r1]
	movs r2, 0x20
	orrs r0, r2
	strh r0, [r1]
	ldrb r0, [r4]
	bl battle_get_per_side_status
	ldr r2, _08029314
	adds r1, r5, 0
	ands r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0, 0x7]
	ldr r0, _08029318
	strb r1, [r0, 0x5]
_08029306:
	ldr r1, _0802931C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029314: .4byte gUnknown_02024C80
_08029318: .4byte gUnknown_02024D1E
_0802931C: .4byte gUnknown_02024C10
	thumb_func_end sub_80290BC

	thumb_func_start atkB9_magnitudedamagecalculation
atkB9_magnitudedamagecalculation: @ 8029320
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bgt _0802934C
	ldr r1, _08029348
	movs r0, 0xA
	strh r0, [r1]
	movs r3, 0x4
	b _080293B8
	.align 2, 0
_08029348: .4byte gUnknown_02024DEC
_0802934C:
	cmp r3, 0xE
	bgt _08029360
	ldr r1, _0802935C
	movs r0, 0x1E
	strh r0, [r1]
	movs r3, 0x5
	b _080293B8
	.align 2, 0
_0802935C: .4byte gUnknown_02024DEC
_08029360:
	cmp r3, 0x22
	bgt _08029374
	ldr r1, _08029370
	movs r0, 0x32
	strh r0, [r1]
	movs r3, 0x6
	b _080293B8
	.align 2, 0
_08029370: .4byte gUnknown_02024DEC
_08029374:
	cmp r3, 0x40
	bgt _08029388
	ldr r1, _08029384
	movs r0, 0x46
	strh r0, [r1]
	movs r3, 0x7
	b _080293B8
	.align 2, 0
_08029384: .4byte gUnknown_02024DEC
_08029388:
	cmp r3, 0x54
	bgt _0802939C
	ldr r1, _08029398
	movs r0, 0x5A
	strh r0, [r1]
	movs r3, 0x8
	b _080293B8
	.align 2, 0
_08029398: .4byte gUnknown_02024DEC
_0802939C:
	cmp r3, 0x5E
	bgt _080293B0
	ldr r1, _080293AC
	movs r0, 0x6E
	strh r0, [r1]
	movs r3, 0x9
	b _080293B8
	.align 2, 0
_080293AC: .4byte gUnknown_02024DEC
_080293B0:
	ldr r1, _08029424
	movs r0, 0x96
	strh r0, [r1]
	movs r3, 0xA
_080293B8:
	ldr r1, _08029428
	movs r2, 0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	movs r0, 0x2
	strb r0, [r1, 0x3]
	strb r3, [r1, 0x4]
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	ldr r1, _0802942C
	strb r2, [r1]
	ldr r0, _08029430
	ldrb r3, [r0]
	adds r6, r1, 0
	ldr r0, _08029434
	mov r8, r0
	cmp r2, r3
	bcs _08029410
	adds r4, r6, 0
	ldr r0, _08029438
	ldrb r5, [r0]
	ldr r1, _0802943C
	mov r12, r1
	ldr r7, _08029440
_080293EE:
	ldrb r2, [r4]
	cmp r2, r5
	beq _08029404
	ldrb r0, [r7]
	ldrb r1, [r6]
	lsls r1, 2
	add r1, r12
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _08029410
_08029404:
	adds r0, r2, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r3
	bcc _080293EE
_08029410:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029424: .4byte gUnknown_02024DEC
_08029428: .4byte gUnknown_030041C0
_0802942C: .4byte gUnknown_02024C08
_08029430: .4byte gUnknown_02024A68
_08029434: .4byte gUnknown_02024C10
_08029438: .4byte gUnknown_02024C07
_0802943C: .4byte gBitTable
_08029440: .4byte gUnknown_02024C0C
	thumb_func_end atkB9_magnitudedamagecalculation

	thumb_func_start sub_8029270
sub_8029270: @ 8029444
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08029468
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08029474
	ldr r0, _0802946C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08029470
	movs r0, 0x1
	b _0802948E
	.align 2, 0
_08029468: .4byte gUnknown_02024C0E
_0802946C: .4byte gUnknown_02024C07
_08029470:
	movs r0, 0
	b _0802948E
_08029474:
	ldr r0, _08029488
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0802948C
	movs r0, 0x3
	b _0802948E
	.align 2, 0
_08029488: .4byte gUnknown_02024C07
_0802948C:
	movs r0, 0x2
_0802948E:
	bl battle_get_side_with_given_state
	ldr r1, _08029550
	strb r0, [r1]
	ldr r0, _08029554
	ldr r1, _08029550
	mov r9, r1
	ldrb r3, [r1]
	adds r0, r3, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08029590
	ldr r5, _08029558
	ldr r0, _0802955C
	ldr r2, _08029560
	adds r1, r3, r2
	adds r1, r0
	ldrb r2, [r5]
	mov r10, r0
	ldrb r1, [r1]
	cmp r2, r1
	bne _08029590
	ldr r4, _08029564
	movs r2, 0x58
	adds r0, r3, 0
	muls r0, r2
	adds r1, r4, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x27
	ands r0, r1
	cmp r0, 0
	bne _08029590
	ldrb r0, [r5]
	muls r0, r2
	adds r0, r4
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08029590
	ldr r0, _08029568
	lsls r1, r3, 3
	subs r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _08029590
	ldr r0, _0802956C
	lsls r1, r3, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0xE4
	bne _08029590
	movs r1, 0
	ldr r0, _08029570
	ldr r7, _08029574
	mov r8, r7
	ldr r2, _08029578
	mov r12, r2
	ldrb r7, [r0]
	cmp r1, r7
	bge _0802952E
	ldr r6, _0802957C
	mov r5, r9
	ldr r4, _08029580
	movs r3, 0xB
	adds r2, r0, 0
_08029518:
	adds r0, r1, r6
	ldrb r0, [r0]
	ldrb r7, [r5]
	cmp r0, r7
	bne _08029526
	adds r0, r1, r4
	strb r3, [r0]
_08029526:
	adds r1, 0x1
	ldrb r0, [r2]
	cmp r1, r0
	blt _08029518
_0802952E:
	movs r0, 0xE4
	mov r1, r8
	strh r0, [r1]
	ldr r2, _08029584
	ldr r0, [r2]
	adds r0, 0x5
	str r0, [r2]
	ldr r1, _08029588
	add r1, r10
	movs r0, 0x1
	strb r0, [r1]
	mov r7, r12
	ldr r0, [r7]
	ldr r1, _0802958C
	ands r0, r1
	str r0, [r7]
	b _080295AA
	.align 2, 0
_08029550: .4byte gUnknown_02024C08
_08029554: .4byte gUnknown_02024C18
_08029558: .4byte gUnknown_02024C07
_0802955C: .4byte 0x02000000
_08029560: .4byte 0x00016010
_08029564: .4byte gBattleMons
_08029568: .4byte gUnknown_02024CA8
_0802956C: .4byte gUnknown_02024C60
_08029570: .4byte gUnknown_02024A68
_08029574: .4byte gUnknown_02024BE6
_08029578: .4byte gUnknown_02024C6C
_0802957C: .4byte gUnknown_02024A7A
_08029580: .4byte gUnknown_02024A76
_08029584: .4byte gUnknown_02024C10
_08029588: .4byte 0x00016002
_0802958C: .4byte 0xfffffbff
_08029590:
	ldr r3, _080295B8
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
_080295AA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080295B8: .4byte gUnknown_02024C10
	thumb_func_end sub_8029270

	thumb_func_start sub_80293E8
sub_80293E8: @ 80295BC
	push {lr}
	ldr r2, _080295DC
	ldrh r1, [r2]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080295E8
	ldr r2, _080295E0
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080295E4
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _080295FA
	.align 2, 0
_080295DC: .4byte word_2024DB8
_080295E0: .4byte gUnknown_02024C68
_080295E4: .4byte gUnknown_02024D1E
_080295E8:
	movs r0, 0x20
	strh r0, [r2]
	ldr r1, _08029608
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r0, _0802960C
	adds r0, 0x28
	movs r1, 0x5
	strb r1, [r0]
_080295FA:
	ldr r1, _08029610
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08029608: .4byte gUnknown_02024D1E
_0802960C: .4byte gUnknown_02024DBC
_08029610: .4byte gUnknown_02024C10
	thumb_func_end sub_80293E8

	thumb_func_start atkBC_maxattackhalvehp
atkBC_maxattackhalvehp: @ 8029614
	push {r4,r5,lr}
	ldr r5, _08029660
	ldr r4, _08029664
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	adds r2, r0, r5
	ldrh r0, [r2, 0x2C]
	lsrs r1, r0, 1
	cmp r1, 0
	bne _0802962C
	movs r1, 0x1
_0802962C:
	movs r0, 0x19
	ldrsb r0, [r2, r0]
	cmp r0, 0xB
	bgt _08029670
	ldrh r0, [r2, 0x28]
	cmp r0, r1
	bls _08029670
	movs r0, 0xC
	strb r0, [r2, 0x19]
	ldr r1, _08029668
	ldrb r0, [r4]
	muls r0, r3
	adds r0, r5
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _08029654
	movs r0, 0x1
	str r0, [r1]
_08029654:
	ldr r1, _0802966C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802968A
	.align 2, 0
_08029660: .4byte gBattleMons
_08029664: .4byte gUnknown_02024C07
_08029668: .4byte gUnknown_02024BEC
_0802966C: .4byte gUnknown_02024C10
_08029670:
	ldr r3, _08029690
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
_0802968A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029690: .4byte gUnknown_02024C10
	thumb_func_end atkBC_maxattackhalvehp

	thumb_func_start atkBD_copyfoestats
atkBD_copyfoestats: @ 8029694
	push {r4-r7,lr}
	movs r2, 0
	ldr r7, _080296CC
	ldr r6, _080296D0
	movs r4, 0x58
	ldr r3, _080296D4
	ldr r5, _080296D8
_080296A2:
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r4
	adds r1, r2, r1
	adds r1, r3
	ldrb r0, [r5]
	muls r0, r4
	adds r0, r2, r0
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0x7
	ble _080296A2
	ldr r0, [r7]
	adds r0, 0x5
	str r0, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080296CC: .4byte gUnknown_02024C10
_080296D0: .4byte gUnknown_02024C07
_080296D4: .4byte gUnknown_02024A98
_080296D8: .4byte gUnknown_02024C08
	thumb_func_end atkBD_copyfoestats

	thumb_func_start atkBE_breakfree
atkBE_breakfree: @ 80296DC
	push {r4,r5,lr}
	ldr r1, _08029744
	ldr r5, _08029748
	ldrb r2, [r5]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r3, r0, r1
	ldr r1, [r3]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08029768
	ldr r0, _0802974C
	ands r1, r0
	str r1, [r3]
	ldr r1, _08029750
	ldr r2, _08029754
	ldrb r0, [r5]
	ldr r3, _08029758
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802975C
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	ldrb r0, [r5]
	lsls r0, 1
	subs r3, 0x1C
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x2]
	ldrb r0, [r5]
	lsls r0, 1
	adds r3, 0x1
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	bl b_movescr_stack_push_cursor
	ldr r1, _08029760
	ldr r0, _08029764
	b _08029812
	.align 2, 0
_08029744: .4byte gBattleMons
_08029748: .4byte gUnknown_02024C07
_0802974C: .4byte 0xffff1fff
_08029750: .4byte gUnknown_02024C08
_08029754: .4byte 0x02000000
_08029758: .4byte 0x00016020
_0802975C: .4byte gUnknown_030041C0
_08029760: .4byte gUnknown_02024C10
_08029764: .4byte gUnknown_081D92C2
_08029768:
	ldr r4, _0802979C
	lsls r0, r2, 2
	adds r3, r0, r4
	ldr r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080297A8
	movs r0, 0x5
	negs r0, r0
	ands r1, r0
	str r1, [r3]
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r4
	ldr r0, [r1]
	movs r2, 0x4
	negs r2, r2
	ands r0, r2
	str r0, [r1]
	bl b_movescr_stack_push_cursor
	ldr r1, _080297A0
	ldr r0, _080297A4
	b _08029812
	.align 2, 0
_0802979C: .4byte gUnknown_02024C98
_080297A0: .4byte gUnknown_02024C10
_080297A4: .4byte gUnknown_081D92C9
_080297A8:
	adds r0, r2, 0
	bl battle_side_get_owner
	ldr r4, _080297F8
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0802980C
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r2, [r0]
	ldr r1, _080297FC
	ands r1, r2
	movs r4, 0
	strh r1, [r0]
	ldrb r0, [r5]
	bl battle_side_get_owner
	ldr r2, _08029800
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strb r4, [r1, 0x6]
	bl b_movescr_stack_push_cursor
	ldr r1, _08029804
	ldr r0, _08029808
	b _08029812
	.align 2, 0
_080297F8: .4byte gUnknown_02024C7A
_080297FC: .4byte 0x0000ffef
_08029800: .4byte gUnknown_02024C80
_08029804: .4byte gUnknown_02024C10
_08029808: .4byte gUnknown_081D92D0
_0802980C:
	ldr r1, _0802981C
	ldr r0, [r1]
	adds r0, 0x1
_08029812:
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802981C: .4byte gUnknown_02024C10
	thumb_func_end atkBE_breakfree

	thumb_func_start sub_802964C
sub_802964C: @ 8029820
	ldr r1, _08029844
	ldr r0, _08029848
	ldrb r2, [r0]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 23
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0802984C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08029844: .4byte gBattleMons
_08029848: .4byte gUnknown_02024C07
_0802984C: .4byte gUnknown_02024C10
	thumb_func_end sub_802964C

	thumb_func_start atkC0_recoverbasedonsunlight
atkC0_recoverbasedonsunlight: @ 8029850
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _080298BC
	ldr r5, _080298C0
	ldrb r0, [r5]
	strb r0, [r1]
	ldr r7, _080298C4
	ldrb r0, [r5]
	movs r6, 0x58
	muls r0, r6
	adds r0, r7
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	beq _08029930
	ldr r4, _080298C8
	ldrh r0, [r4]
	cmp r0, 0
	beq _080298A2
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080298A2
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _080298D0
_080298A2:
	ldr r3, _080298CC
	ldr r2, _080298C4
	ldr r0, _080298C0
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r3]
	adds r1, r3, 0
	b _0802990A
	.align 2, 0
_080298BC: .4byte gUnknown_02024C08
_080298C0: .4byte gUnknown_02024C07
_080298C4: .4byte gBattleMons
_080298C8: .4byte word_2024DB8
_080298CC: .4byte gUnknown_02024BEC
_080298D0:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080298FC
	ldr r4, _080298F8
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r7
	ldrh r1, [r0, 0x2C]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1E
	bl __divsi3
	str r0, [r4]
	adds r1, r4, 0
	b _0802990A
	.align 2, 0
_080298F8: .4byte gUnknown_02024BEC
_080298FC:
	ldr r1, _08029928
	ldrb r0, [r5]
	muls r0, r6
	adds r0, r7
	ldrh r0, [r0, 0x2C]
	lsrs r0, 2
	str r0, [r1]
_0802990A:
	adds r2, r1, 0
	ldr r0, [r2]
	cmp r0, 0
	bne _08029916
	movs r0, 0x1
	str r0, [r2]
_08029916:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldr r1, _0802992C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802994A
	.align 2, 0
_08029928: .4byte gUnknown_02024BEC
_0802992C: .4byte gUnknown_02024C10
_08029930:
	ldr r3, _08029954
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
_0802994A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029954: .4byte gUnknown_02024C10
	thumb_func_end atkC0_recoverbasedonsunlight

	thumb_func_start sub_8029784
sub_8029784: @ 8029958
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _08029A68
	ldr r0, _08029A6C
	ldrb r1, [r0]
	movs r0, 0x58
	adds r4, r1, 0
	muls r4, r0
	adds r4, r2
	ldrb r0, [r4, 0x14]
	mov r10, r0
	mov r7, r10
	lsls r7, 27
	adds r0, r7, 0
	lsrs r0, 27
	mov r10, r0
	movs r1, 0x2
	mov r2, r10
	ands r2, r1
	asrs r2, 1
	ldrh r7, [r4, 0x14]
	mov r9, r7
	mov r0, r9
	lsls r0, 22
	mov r9, r0
	lsrs r3, r0, 27
	adds r0, r1, 0
	ands r0, r3
	orrs r2, r0
	ldrb r7, [r4, 0x15]
	mov r8, r7
	mov r0, r8
	lsls r0, 25
	mov r8, r0
	lsrs r3, r0, 27
	adds r0, r1, 0
	ands r0, r3
	lsls r0, 1
	orrs r2, r0
	ldr r6, [r4, 0x14]
	lsls r6, 12
	lsrs r3, r6, 27
	adds r0, r1, 0
	ands r0, r3
	lsls r0, 2
	orrs r2, r0
	ldrh r5, [r4, 0x16]
	lsls r5, 23
	lsrs r3, r5, 27
	adds r0, r1, 0
	ands r0, r3
	lsls r0, 3
	orrs r2, r0
	ldrb r3, [r4, 0x17]
	lsls r3, 26
	lsrs r0, r3, 27
	ands r1, r0
	lsls r1, 4
	orrs r2, r1
	movs r1, 0x1
	adds r4, r1, 0
	mov r7, r10
	ands r4, r7
	mov r0, r9
	lsrs r0, 27
	mov r9, r0
	adds r0, r1, 0
	mov r7, r9
	ands r0, r7
	lsls r0, 1
	orrs r4, r0
	mov r0, r8
	lsrs r0, 27
	mov r8, r0
	adds r0, r1, 0
	mov r7, r8
	ands r0, r7
	lsls r0, 2
	orrs r4, r0
	lsrs r6, 27
	adds r0, r1, 0
	ands r0, r6
	lsls r0, 3
	orrs r4, r0
	lsrs r5, 27
	adds r0, r1, 0
	ands r0, r5
	lsls r0, 4
	orrs r4, r0
	lsrs r3, 27
	ands r1, r3
	lsls r1, 5
	orrs r4, r1
	ldr r5, _08029A70
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	movs r1, 0x3F
	bl __divsi3
	adds r0, 0x1E
	strh r0, [r5]
	ldr r5, _08029A74
	lsls r0, r4, 4
	subs r0, r4
	movs r1, 0x3F
	bl __divsi3
	adds r1, r0, 0x1
	ldr r0, _08029A78
	adds r5, r0
	strb r1, [r5]
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _08029A4A
	adds r0, r1, 0x1
	strb r0, [r5]
_08029A4A:
	ldrb r0, [r5]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r5]
	ldr r1, _08029A7C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029A68: .4byte gBattleMons
_08029A6C: .4byte gUnknown_02024C07
_08029A70: .4byte gUnknown_02024DEC
_08029A74: .4byte 0x02000000
_08029A78: .4byte 0x0001601c
_08029A7C: .4byte gUnknown_02024C10
	thumb_func_end sub_8029784

	thumb_func_start atkC2_selectnexttarget
atkC2_selectnexttarget: @ 8029A80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08029ADC
	movs r1, 0
	strb r1, [r0]
	ldr r1, _08029AE0
	ldrb r1, [r1]
	adds r6, r0, 0
	ldr r0, _08029AE4
	mov r8, r0
	cmp r1, 0
	beq _08029ACA
	adds r3, r6, 0
	ldr r0, _08029AE8
	ldrb r5, [r0]
	ldr r0, _08029AEC
	mov r12, r0
	adds r4, r1, 0
	ldr r7, _08029AF0
_08029AA8:
	ldrb r2, [r3]
	cmp r2, r5
	beq _08029ABE
	ldrb r0, [r7]
	ldrb r1, [r6]
	lsls r1, 2
	add r1, r12
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _08029ACA
_08029ABE:
	adds r0, r2, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r4
	bcc _08029AA8
_08029ACA:
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029ADC: .4byte gUnknown_02024C08
_08029AE0: .4byte gUnknown_02024A68
_08029AE4: .4byte gUnknown_02024C10
_08029AE8: .4byte gUnknown_02024C07
_08029AEC: .4byte gBitTable
_08029AF0: .4byte gUnknown_02024C0C
	thumb_func_end atkC2_selectnexttarget

	thumb_func_start atkC3_setfutureattack
atkC3_setfutureattack: @ 8029AF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, _08029B2C
	mov r8, r0
	ldr r7, _08029B30
	ldrb r1, [r7]
	adds r0, r1, r0
	ldrb r6, [r0]
	cmp r6, 0
	beq _08029B38
	ldr r3, _08029B34
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
	b _08029C02
	.align 2, 0
_08029B2C: .4byte gUnknown_02024DBC
_08029B30: .4byte gUnknown_02024C08
_08029B34: .4byte gUnknown_02024C10
_08029B38:
	lsls r1, 1
	mov r0, r8
	adds r0, 0x18
	adds r1, r0
	ldr r2, _08029BD8
	mov r9, r2
	ldrh r0, [r2]
	strh r0, [r1]
	mov r0, r8
	adds r0, 0x4
	ldrb r4, [r7]
	adds r0, r4
	ldr r5, _08029BDC
	ldrb r1, [r5]
	strb r1, [r0]
	ldrb r0, [r7]
	add r0, r8
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _08029BE0
	ldrb r0, [r7]
	bl battle_get_per_side_status
	movs r1, 0x1
	mov r10, r1
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	ldr r2, _08029BE4
	adds r0, r2
	ldrb r1, [r7]
	muls r1, r4
	adds r1, r2
	mov r4, r9
	ldrh r2, [r4]
	str r6, [sp]
	str r6, [sp, 0x4]
	ldrb r4, [r5]
	str r4, [sp, 0x8]
	ldrb r4, [r7]
	str r4, [sp, 0xC]
	bl CalculateBaseDamage
	ldrb r1, [r7]
	lsls r1, 2
	mov r2, r8
	adds r2, 0x8
	adds r1, r2
	str r0, [r1]
	ldr r1, _08029BE8
	ldrb r0, [r5]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _08029BC6
	ldrb r4, [r7]
	lsls r4, 2
	adds r4, r2
	ldr r1, [r4]
	lsls r0, r1, 4
	subs r0, r1
	movs r1, 0xA
	bl __divsi3
	str r0, [r4]
_08029BC6:
	mov r0, r9
	ldrh r1, [r0]
	ldr r0, _08029BEC
	cmp r1, r0
	bne _08029BF4
	ldr r0, _08029BF0
	mov r1, r10
	strb r1, [r0, 0x5]
	b _08029BFA
	.align 2, 0
_08029BD8: .4byte gUnknown_02024BE6
_08029BDC: .4byte gUnknown_02024C07
_08029BE0: .4byte gUnknown_02024C7A
_08029BE4: .4byte gBattleMons
_08029BE8: .4byte gUnknown_02024D28
_08029BEC: .4byte 0x00000161
_08029BF0: .4byte gUnknown_02024D1E
_08029BF4:
	ldr r1, _08029C14
	movs r0, 0
	strb r0, [r1, 0x5]
_08029BFA:
	ldr r1, _08029C18
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08029C02:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029C14: .4byte gUnknown_02024D1E
_08029C18: .4byte gUnknown_02024C10
	thumb_func_end atkC3_setfutureattack

	thumb_func_start atkC4_802B910
atkC4_802B910: @ 8029C1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08029C60
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _08029C64
	cmp r0, 0
	bne _08029C36
	ldr r7, _08029C68
_08029C36:
	ldr r2, _08029C6C
	ldr r0, _08029C70
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _08029C78
	ldr r3, _08029C74
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	b _08029E14
	.align 2, 0
_08029C60: .4byte gUnknown_02024C07
_08029C64: .4byte gEnemyParty
_08029C68: .4byte gPlayerParty
_08029C6C: .4byte gBattleMons
_08029C70: .4byte gUnknown_02024C08
_08029C74: .4byte gUnknown_02024C10
_08029C78:
	ldr r6, _08029DB4
	ldrb r0, [r6]
	mov r8, r0
	cmp r0, 0x5
	bls _08029C84
	b _08029DE0
_08029C84:
	adds r4, r6, 0
	movs r5, 0x64
_08029C88:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08029CCC
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08029CCC
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08029CCC
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r7, r0
	movs r1, 0x37
	bl GetMonData
	cmp r0, 0
	beq _08029CDC
_08029CCC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, r4, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _08029C88
_08029CDC:
	ldr r1, _08029DB4
	mov r9, r1
	ldrb r2, [r1]
	cmp r2, 0x5
	bhi _08029DE0
	ldr r1, _08029DB8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r6, _08029DBC
	ldrb r0, [r6]
	strb r0, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08029DC0
	ldr r0, [r1]
	adds r0, 0x9
	str r0, [r1]
	ldr r2, _08029DC4
	mov r8, r2
	ldr r5, _08029DC8
	mov r1, r9
	ldrb r0, [r1]
	movs r4, 0x64
	muls r0, r4
	adds r0, r7, r0
	movs r1, 0xB
	bl GetMonData
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	mov r2, r8
	str r3, [r2]
	ldr r2, _08029DCC
	ldr r0, _08029DD0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	muls r0, r3
	mov r1, r8
	str r0, [r1]
	mov r2, r9
	ldrb r0, [r2]
	muls r0, r4
	adds r0, r7, r0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 1
	movs r1, 0x5
	bl __udivsi3
	adds r0, 0x2
	mov r2, r8
	ldr r1, [r2]
	muls r0, r1
	str r0, [r2]
	ldr r3, _08029DD4
	ldr r1, _08029DD8
	ldrb r2, [r1]
	movs r1, 0x58
	muls r1, r2
	adds r1, r3
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r1, [r1, 0x2]
	bl __divsi3
	mov r1, r8
	str r0, [r1]
	movs r1, 0x32
	bl __divsi3
	adds r2, r0, 0x2
	mov r0, r8
	str r2, [r0]
	ldr r1, _08029DDC
	ldrb r0, [r6]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	bge _08029DA8
	lsls r0, r2, 4
	subs r0, r2
	movs r1, 0xA
	bl __divsi3
	mov r1, r8
	str r0, [r1]
_08029DA8:
	mov r2, r9
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _08029E1A
	.align 2, 0
_08029DB4: .4byte gUnknown_02024D1E
_08029DB8: .4byte gUnknown_030041C0
_08029DBC: .4byte gUnknown_02024C07
_08029DC0: .4byte gUnknown_02024C10
_08029DC4: .4byte gUnknown_02024BEC
_08029DC8: .4byte gBaseStats
_08029DCC: .4byte gBattleMoves
_08029DD0: .4byte gUnknown_02024BE6
_08029DD4: .4byte gBattleMons
_08029DD8: .4byte gUnknown_02024C08
_08029DDC: .4byte gUnknown_02024D28
_08029DE0:
	mov r0, r8
	cmp r0, 0
	beq _08029E00
	ldr r3, _08029DFC
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	b _08029E14
	.align 2, 0
_08029DFC: .4byte gUnknown_02024C10
_08029E00:
	ldr r3, _08029E28
	ldr r2, [r3]
	ldrb r1, [r2, 0x5]
	ldrb r0, [r2, 0x6]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x7]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x8]
_08029E14:
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
_08029E1A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08029E28: .4byte gUnknown_02024C10
	thumb_func_end atkC4_802B910

	thumb_func_start atkC5_hidepreattack
atkC5_hidepreattack: @ 8029E2C
	push {lr}
	ldr r0, _08029E40
	ldrh r1, [r0]
	cmp r1, 0x5B
	beq _08029E6C
	cmp r1, 0x5B
	bgt _08029E44
	cmp r1, 0x13
	beq _08029E50
	b _08029E98
	.align 2, 0
_08029E40: .4byte gUnknown_02024BE6
_08029E44:
	ldr r0, _08029E60
	cmp r1, r0
	beq _08029E84
	adds r0, 0x31
	cmp r1, r0
	bne _08029E98
_08029E50:
	ldr r2, _08029E64
	ldr r0, _08029E68
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x40
	b _08029E94
	.align 2, 0
_08029E60: .4byte 0x00000123
_08029E64: .4byte gUnknown_02024C98
_08029E68: .4byte gUnknown_02024C07
_08029E6C:
	ldr r2, _08029E7C
	ldr r0, _08029E80
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	b _08029E94
	.align 2, 0
_08029E7C: .4byte gUnknown_02024C98
_08029E80: .4byte gUnknown_02024C07
_08029E84:
	ldr r2, _08029EA4
	ldr r0, _08029EA8
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 11
_08029E94:
	orrs r0, r2
	str r0, [r1]
_08029E98:
	ldr r1, _08029EAC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08029EA4: .4byte gUnknown_02024C98
_08029EA8: .4byte gUnknown_02024C07
_08029EAC: .4byte gUnknown_02024C10
	thumb_func_end atkC5_hidepreattack

	thumb_func_start atkC6_unhidepostattack
atkC6_unhidepostattack: @ 8029EB0
	push {lr}
	ldr r0, _08029EC4
	ldrh r1, [r0]
	cmp r1, 0x5B
	beq _08029EF4
	cmp r1, 0x5B
	bgt _08029EC8
	cmp r1, 0x13
	beq _08029ED4
	b _08029F22
	.align 2, 0
_08029EC4: .4byte gUnknown_02024BE6
_08029EC8:
	ldr r0, _08029EE8
	cmp r1, r0
	beq _08029F10
	adds r0, 0x31
	cmp r1, r0
	bne _08029F22
_08029ED4:
	ldr r2, _08029EEC
	ldr r0, _08029EF0
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x41
	negs r2, r2
	b _08029F1E
	.align 2, 0
_08029EE8: .4byte 0x00000123
_08029EEC: .4byte gUnknown_02024C98
_08029EF0: .4byte gUnknown_02024C07
_08029EF4:
	ldr r2, _08029F08
	ldr r0, _08029F0C
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x81
	negs r2, r2
	b _08029F1E
	.align 2, 0
_08029F08: .4byte gUnknown_02024C98
_08029F0C: .4byte gUnknown_02024C07
_08029F10:
	ldr r2, _08029F30
	ldr r0, _08029F34
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	ldr r2, _08029F38
_08029F1E:
	ands r0, r2
	str r0, [r1]
_08029F22:
	ldr r1, _08029F3C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08029F30: .4byte gUnknown_02024C98
_08029F34: .4byte gUnknown_02024C07
_08029F38: .4byte 0xfffbffff
_08029F3C: .4byte gUnknown_02024C10
	thumb_func_end atkC6_unhidepostattack

	thumb_func_start atkC7_setminimize
atkC7_setminimize: @ 8029F40
	push {lr}
	ldr r0, _08029F70
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 18
	ands r0, r1
	cmp r0, 0
	beq _08029F64
	ldr r2, _08029F74
	ldr r0, _08029F78
	ldrb r1, [r0]
	lsls r1, 2
	adds r1, r2
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 1
	orrs r0, r2
	str r0, [r1]
_08029F64:
	ldr r1, _08029F7C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08029F70: .4byte gUnknown_02024C6C
_08029F74: .4byte gUnknown_02024C98
_08029F78: .4byte gUnknown_02024C07
_08029F7C: .4byte gUnknown_02024C10
	thumb_func_end atkC7_setminimize

	thumb_func_start sub_8029DAC
sub_8029DAC: @ 8029F80
	push {lr}
	ldr r3, _08029FA4
	ldrh r1, [r3]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08029FB0
	ldr r2, _08029FA8
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08029FAC
	movs r0, 0x2
	strb r0, [r1, 0x5]
	b _08029FBE
	.align 2, 0
_08029FA4: .4byte word_2024DB8
_08029FA8: .4byte gUnknown_02024C68
_08029FAC: .4byte gUnknown_02024D1E
_08029FB0:
	strh r2, [r3]
	ldr r0, _08029FCC
	movs r1, 0x5
	strb r1, [r0, 0x5]
	ldr r0, _08029FD0
	adds r0, 0x28
	strb r1, [r0]
_08029FBE:
	ldr r1, _08029FD4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08029FCC: .4byte gUnknown_02024D1E
_08029FD0: .4byte gUnknown_02024DBC
_08029FD4: .4byte gUnknown_02024C10
	thumb_func_end sub_8029DAC

	thumb_func_start atkC9_jumpifattackandspecialattackcannotfall
atkC9_jumpifattackandspecialattackcannotfall: @ 8029FD8
	push {r4,lr}
	ldr r2, _0802A01C
	ldr r0, _0802A020
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	adds r3, r2, 0
	cmp r0, 0
	bne _0802A02C
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _0802A02C
	ldr r0, _0802A024
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	beq _0802A02C
	ldr r3, _0802A028
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
	b _0802A058
	.align 2, 0
_0802A01C: .4byte gBattleMons
_0802A020: .4byte gUnknown_02024C08
_0802A024: .4byte gUnknown_02024D1E
_0802A028: .4byte gUnknown_02024C10
_0802A02C:
	ldr r4, _0802A060
	ldr r0, _0802A064
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r2, _0802A068
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0, 0x28]
	str r0, [r2]
	ldr r1, _0802A06C
	movs r0, 0
	bl dp01_build_cmdbuf_x18_0_aa_health_bar_update
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _0802A070
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802A058:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A060: .4byte gUnknown_02024A60
_0802A064: .4byte gUnknown_02024C07
_0802A068: .4byte gUnknown_02024BEC
_0802A06C: .4byte 0x00007fff
_0802A070: .4byte gUnknown_02024C10
	thumb_func_end atkC9_jumpifattackandspecialattackcannotfall

	thumb_func_start atkCA_setforcedtarget
atkCA_setforcedtarget: @ 802A074
	push {r4,r5,lr}
	ldr r4, _0802A0B4
	ldrb r0, [r4]
	bl battle_side_get_owner
	ldr r5, _0802A0B8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	strb r0, [r1, 0x8]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r4]
	strb r0, [r1, 0x9]
	ldr r1, _0802A0BC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802A0B4: .4byte gUnknown_02024C07
_0802A0B8: .4byte gUnknown_02024C80
_0802A0BC: .4byte gUnknown_02024C10
	thumb_func_end atkCA_setforcedtarget

	thumb_func_start atkCB_setcharge
atkCB_setcharge: @ 802A0C0
	push {r4,lr}
	ldr r0, _0802A114
	ldr r3, _0802A118
	ldrb r1, [r3]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 2
	orrs r0, r2
	str r0, [r1]
	ldr r4, _0802A11C
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x12]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x12]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x12]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x12]
	ldr r1, _0802A120
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A114: .4byte gUnknown_02024C98
_0802A118: .4byte gUnknown_02024C07
_0802A11C: .4byte gUnknown_02024CA8
_0802A120: .4byte gUnknown_02024C10
	thumb_func_end atkCB_setcharge

	thumb_func_start atkCC_callterrainattack
atkCC_callterrainattack: @ 802A124
	push {r4,lr}
	ldr r2, _0802A174
	ldr r0, [r2]
	ldr r1, _0802A178
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802A17C
	ldr r1, _0802A180
	ldr r0, _0802A184
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _0802A188
	strb r0, [r1]
	ldr r3, _0802A18C
	ldr r2, _0802A190
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	bl b_movescr_stack_push
	ldr r1, _0802A194
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A174: .4byte gUnknown_02024C6C
_0802A178: .4byte 0xfffffbff
_0802A17C: .4byte gUnknown_02024BE6
_0802A180: .4byte gNaturePowerMoves
_0802A184: .4byte gUnknown_0300428C
_0802A188: .4byte gUnknown_02024C08
_0802A18C: .4byte gUnknown_081D6BBC
_0802A190: .4byte gBattleMoves
_0802A194: .4byte gUnknown_02024C10
	thumb_func_end atkCC_callterrainattack

	thumb_func_start atkCD_cureifburnedparalysedorpoisoned
atkCD_cureifburnedparalysedorpoisoned: @ 802A198
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0802A1E4
	ldr r3, _0802A1E8
	ldrb r0, [r3]
	movs r6, 0x58
	muls r0, r6
	adds r5, r1, 0
	adds r5, 0x4C
	adds r2, r0, r5
	ldr r0, [r2]
	movs r1, 0xD8
	ands r0, r1
	cmp r0, 0
	beq _0802A1F4
	movs r0, 0
	str r0, [r2]
	ldr r1, _0802A1EC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r4, _0802A1F0
	ldrb r0, [r3]
	strb r0, [r4]
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r2, 0
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _0802A20E
	.align 2, 0
_0802A1E4: .4byte gBattleMons
_0802A1E8: .4byte gUnknown_02024C07
_0802A1EC: .4byte gUnknown_02024C10
_0802A1F0: .4byte gUnknown_02024A60
_0802A1F4:
	ldr r3, _0802A218
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
_0802A20E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A218: .4byte gUnknown_02024C10
	thumb_func_end atkCD_cureifburnedparalysedorpoisoned

	thumb_func_start atkCE_settorment
atkCE_settorment: @ 802A21C
	push {lr}
	ldr r1, _0802A254
	ldr r0, _0802A258
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x80
	lsls r2, 24
	cmp r1, 0
	bge _0802A260
	ldr r3, _0802A25C
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
	b _0802A26C
	.align 2, 0
_0802A254: .4byte gBattleMons
_0802A258: .4byte gUnknown_02024C08
_0802A25C: .4byte gUnknown_02024C10
_0802A260:
	orrs r1, r2
	str r1, [r0]
	ldr r1, _0802A270
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802A26C:
	pop {r0}
	bx r0
	.align 2, 0
_0802A270: .4byte gUnknown_02024C10
	thumb_func_end atkCE_settorment

	thumb_func_start atkCF_jumpifnodamage
atkCF_jumpifnodamage: @ 802A274
	push {lr}
	ldr r2, _0802A2A0
	ldr r0, _0802A2A4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	bne _0802A294
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802A2AC
_0802A294:
	ldr r1, _0802A2A8
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A2C6
	.align 2, 0
_0802A2A0: .4byte gUnknown_02024D28
_0802A2A4: .4byte gUnknown_02024C07
_0802A2A8: .4byte gUnknown_02024C10
_0802A2AC:
	ldr r3, _0802A2CC
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
_0802A2C6:
	pop {r0}
	bx r0
	.align 2, 0
_0802A2CC: .4byte gUnknown_02024C10
	thumb_func_end atkCF_jumpifnodamage

	thumb_func_start atkD0_settaunt
atkD0_settaunt: @ 802A2D0
	push {r4,lr}
	ldr r4, _0802A314
	ldr r3, _0802A318
	ldrb r0, [r3]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, r1, r4
	ldrb r1, [r2, 0x13]
	lsls r0, r1, 28
	cmp r0, 0
	bne _0802A320
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0, 0x13]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x13]
	ldr r1, _0802A31C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A33A
	.align 2, 0
_0802A314: .4byte gUnknown_02024CA8
_0802A318: .4byte gUnknown_02024C08
_0802A31C: .4byte gUnknown_02024C10
_0802A320:
	ldr r3, _0802A340
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
_0802A33A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A340: .4byte gUnknown_02024C10
	thumb_func_end atkD0_settaunt

	thumb_func_start sub_802A170
sub_802A170: @ 802A344
	push {r4,lr}
	ldr r4, _0802A3AC
	ldrb r0, [r4]
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	ldr r3, _0802A3B0
	strb r0, [r3]
	ldr r0, _0802A3B4
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0802A3C8
	ldr r0, _0802A3B8
	ldrb r1, [r0]
	ldr r2, _0802A3BC
	ldrb r3, [r3]
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802A3C8
	ldr r1, _0802A3C0
	ldrb r0, [r4]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 28
	cmp r0, 0
	blt _0802A3C8
	lsls r0, r3, 4
	adds r2, r0, r1
	ldrb r1, [r2]
	lsls r0, r1, 28
	cmp r0, 0
	blt _0802A3C8
	movs r0, 0x8
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0802A3C4
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A3E2
	.align 2, 0
_0802A3AC: .4byte gUnknown_02024C07
_0802A3B0: .4byte gUnknown_02024C08
_0802A3B4: .4byte gUnknown_020239F8
_0802A3B8: .4byte gUnknown_02024C0C
_0802A3BC: .4byte gBitTable
_0802A3C0: .4byte gUnknown_02024D28
_0802A3C4: .4byte gUnknown_02024C10
_0802A3C8:
	ldr r3, _0802A3E8
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
_0802A3E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E8: .4byte gUnknown_02024C10
	thumb_func_end sub_802A170

	thumb_func_start sub_802A218
sub_802A218: @ 802A3EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _0802A4E0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0802A420
	ldr r0, _0802A4E4
	ldrh r1, [r0]
	ldr r0, _0802A4E8
	ands r0, r1
	cmp r0, 0
	bne _0802A420
	ldr r0, _0802A4EC
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0802A4C2
_0802A420:
	ldr r4, _0802A4E0
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0802A4E4
	ldrh r1, [r0]
	ldr r0, _0802A4E8
	ands r0, r1
	cmp r0, 0
	bne _0802A464
	ldr r0, _0802A4EC
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0802A464
	ldr r0, _0802A4F0
	adds r0, 0x29
	adds r0, r2, r0
	ldrb r1, [r0]
	ldr r3, _0802A4F4
	ldr r2, _0802A4F8
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0802A4C2
_0802A464:
	ldr r0, _0802A4FC
	mov r9, r0
	ldr r1, _0802A4E0
	ldrb r4, [r1]
	movs r2, 0x58
	mov r8, r2
	mov r0, r8
	muls r0, r4
	mov r3, r9
	adds r5, r0, r3
	ldrh r3, [r5, 0x2E]
	adds r1, r3, 0
	cmp r1, 0
	bne _0802A492
	ldr r0, _0802A500
	ldrb r0, [r0]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	add r0, r9
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _0802A4C2
_0802A492:
	cmp r1, 0xAF
	beq _0802A4C2
	ldr r7, _0802A500
	ldrb r0, [r7]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	mov r1, r9
	adds r2, r0, r1
	ldrh r1, [r2, 0x2E]
	cmp r1, 0xAF
	beq _0802A4C2
	adds r0, r3, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bls _0802A4C2
	adds r0, r1, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _0802A508
_0802A4C2:
	ldr r3, _0802A504
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
	b _0802A66E
	.align 2, 0
_0802A4E0: .4byte gUnknown_02024C07
_0802A4E4: .4byte gUnknown_020239F8
_0802A4E8: .4byte 0x00000902
_0802A4EC: .4byte gTrainerBattleOpponent
_0802A4F0: .4byte gUnknown_02024DBC
_0802A4F4: .4byte gBitTable
_0802A4F8: .4byte gUnknown_02024A6A
_0802A4FC: .4byte gBattleMons
_0802A500: .4byte gUnknown_02024C08
_0802A504: .4byte gUnknown_02024C10
_0802A508:
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x3C
	bne _0802A540
	ldr r1, _0802A534
	ldr r0, _0802A538
	str r0, [r1]
	ldr r1, _0802A53C
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	add r0, r9
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	ldrb r1, [r1]
	bl sub_81074C4
	b _0802A66E
	.align 2, 0
_0802A534: .4byte gUnknown_02024C10
_0802A538: .4byte gUnknown_081D9913
_0802A53C: .4byte byte_2024C06
_0802A540:
	lsls r0, r4, 1
	ldr r4, _0802A62C
	adds r6, r0, r4
	ldrh r5, [r5, 0x2E]
	mov r10, r5
	strh r1, [r6]
	ldr r3, _0802A630
	ldrb r0, [r3]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	add r0, r9
	mov r3, r10
	strh r3, [r0, 0x2E]
	ldr r5, _0802A634
	ldr r1, _0802A630
	ldrb r0, [r1]
	strb r0, [r5]
	str r6, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldr r2, _0802A630
	ldrb r0, [r2]
	bl dp01_battle_side_mark_buffer_for_execution
	ldrb r0, [r7]
	strb r0, [r5]
	ldrb r0, [r7]
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	mov r1, r9
	adds r1, 0x2E
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x2
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r7]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, _0802A638
	adds r4, r0
	ldrb r0, [r7]
	lsls r0, 1
	ldr r2, _0802A63C
	adds r0, r2
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _0802A640
	adds r0, r1
	adds r0, r4
	movs r3, 0
	strb r3, [r0]
	ldr r3, _0802A630
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	adds r0, r4
	movs r2, 0
	strb r2, [r0]
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r1
	adds r0, r4
	strb r2, [r0]
	ldr r1, _0802A644
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	ldr r1, _0802A648
	movs r3, 0xFD
	strb r3, [r1]
	movs r2, 0xA
	strb r2, [r1, 0x1]
	ldrh r0, [r6]
	strb r0, [r1, 0x2]
	ldrh r0, [r6]
	lsrs r0, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802A64C
	strb r3, [r1]
	strb r2, [r1, 0x1]
	mov r3, r10
	strb r3, [r1, 0x2]
	mov r2, r10
	lsrs r0, r2, 8
	strb r0, [r1, 0x3]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1, 0x4]
	cmp r2, 0
	beq _0802A654
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802A668
	ldr r1, _0802A650
	movs r0, 0x2
	b _0802A66C
	.align 2, 0
_0802A62C: .4byte 0x020160f0
_0802A630: .4byte gUnknown_02024C07
_0802A634: .4byte gUnknown_02024A60
_0802A638: .4byte 0xfffe9f10
_0802A63C: .4byte 0x000160e8
_0802A640: .4byte 0x000160e9
_0802A644: .4byte gUnknown_02024C10
_0802A648: .4byte gUnknown_030041C0
_0802A64C: .4byte gUnknown_03004290
_0802A650: .4byte gUnknown_02024D1E
_0802A654:
	ldrh r0, [r6]
	cmp r0, 0
	beq _0802A668
	ldr r0, _0802A664
	movs r3, 0
	strb r3, [r0, 0x5]
	b _0802A66E
	.align 2, 0
_0802A664: .4byte gUnknown_02024D1E
_0802A668:
	ldr r1, _0802A680
	movs r0, 0x1
_0802A66C:
	strb r0, [r1, 0x5]
_0802A66E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A680: .4byte gUnknown_02024D1E
	thumb_func_end sub_802A218

	thumb_func_start sub_802A4B0
sub_802A4B0: @ 802A684
	push {r4,lr}
	ldr r3, _0802A6C4
	ldr r4, _0802A6C8
	ldrb r0, [r4]
	movs r2, 0x58
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0
	beq _0802A6D8
	cmp r0, 0x19
	beq _0802A6D8
	ldr r0, _0802A6CC
	ldrb r0, [r0]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802A6D0
	ldrb r0, [r4]
	muls r0, r2
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802A6D4
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802A6F2
	.align 2, 0
_0802A6C4: .4byte gBattleMons
_0802A6C8: .4byte gUnknown_02024C08
_0802A6CC: .4byte gUnknown_02024C07
_0802A6D0: .4byte byte_2024C06
_0802A6D4: .4byte gUnknown_02024C10
_0802A6D8:
	ldr r3, _0802A6F8
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
_0802A6F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A6F8: .4byte gUnknown_02024C10
	thumb_func_end sub_802A4B0

	thumb_func_start atkD4_802C408
atkD4_802C408: @ 802A6FC
	push {r4-r7,lr}
	ldr r7, _0802A710
	ldr r2, [r7]
	ldrb r3, [r2, 0x1]
	cmp r3, 0
	beq _0802A714
	cmp r3, 0x1
	beq _0802A74C
	b _0802A7C8
	.align 2, 0
_0802A710: .4byte gUnknown_02024C10
_0802A714:
	ldr r1, _0802A740
	ldr r4, _0802A744
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r5, [r4]
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, 0
	bne _0802A798
	movs r0, 0x2
	strb r0, [r3]
	ldrb r0, [r4]
	adds r1, 0x24
	adds r1, r0, r1
	ldr r2, _0802A748
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x6
	b _0802A7C6
	.align 2, 0
_0802A740: .4byte gUnknown_02024DBC
_0802A744: .4byte gUnknown_02024C07
_0802A748: .4byte gUnknown_02024A6A
_0802A74C:
	ldr r1, _0802A7B0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x1]
	ldr r4, _0802A7B4
	ldrb r0, [r4]
	strb r0, [r1, 0x2]
	ldr r0, _0802A7B8
	adds r0, 0x24
	ldrb r5, [r4]
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _0802A7BC
	ldr r6, _0802A7C0
	ldrb r0, [r4]
	movs r5, 0x58
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0, 0x2C]
	lsrs r0, 1
	str r0, [r1]
	cmp r0, 0
	bne _0802A784
	str r3, [r1]
_0802A784:
	ldr r0, [r1]
	negs r0, r0
	str r0, [r1]
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r1, [r0, 0x28]
	ldrh r0, [r0, 0x2C]
	cmp r1, r0
	bne _0802A7C4
_0802A798:
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
	str r1, [r7]
	b _0802A7C8
	.align 2, 0
_0802A7B0: .4byte gUnknown_030041C0
_0802A7B4: .4byte gUnknown_02024C08
_0802A7B8: .4byte gUnknown_02024DBC
_0802A7BC: .4byte gUnknown_02024BEC
_0802A7C0: .4byte gBattleMons
_0802A7C4:
	adds r0, r2, 0x6
_0802A7C6:
	str r0, [r7]
_0802A7C8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end atkD4_802C408

	thumb_func_start sub_802A5FC
sub_802A5FC: @ 802A7D0
	push {lr}
	ldr r1, _0802A808
	ldr r0, _0802A80C
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0802A814
	ldr r3, _0802A810
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
	b _0802A820
	.align 2, 0
_0802A808: .4byte gUnknown_02024C98
_0802A80C: .4byte gUnknown_02024C07
_0802A810: .4byte gUnknown_02024C10
_0802A814:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802A824
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802A820:
	pop {r0}
	bx r0
	.align 2, 0
_0802A824: .4byte gUnknown_02024C10
	thumb_func_end sub_802A5FC

	thumb_func_start atkD6_doubledamagedealtifdamaged
atkD6_doubledamagedealtifdamaged: @ 802A828
	push {lr}
	ldr r3, _0802A878
	ldr r0, _0802A87C
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r0, r3, 0x4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802A848
	adds r0, r2, r3
	ldr r1, _0802A880
	ldrb r0, [r0, 0xC]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0802A860
_0802A848:
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0802A86A
	adds r0, r2, r3
	ldr r1, _0802A880
	ldrb r0, [r0, 0xD]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0802A86A
_0802A860:
	ldr r0, _0802A884
	ldr r1, _0802A888
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
_0802A86A:
	ldr r1, _0802A88C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802A878: .4byte gUnknown_02024D28
_0802A87C: .4byte gUnknown_02024C07
_0802A880: .4byte gUnknown_02024C08
_0802A884: .4byte 0x02000000
_0802A888: .4byte 0x0001601f
_0802A88C: .4byte gUnknown_02024C10
	thumb_func_end atkD6_doubledamagedealtifdamaged

	thumb_func_start sub_802A6BC
sub_802A6BC: @ 802A890
	push {r4,lr}
	ldr r1, _0802A8D4
	ldr r0, _0802A8D8
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r4, r0, r1
	ldr r2, [r4]
	movs r0, 0xC0
	lsls r0, 5
	ands r0, r2
	cmp r0, 0
	bne _0802A8B8
	ldr r1, _0802A8DC
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802A8E4
_0802A8B8:
	ldr r3, _0802A8E0
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
	b _0802A8F4
	.align 2, 0
_0802A8D4: .4byte gUnknown_02024C98
_0802A8D8: .4byte gUnknown_02024C08
_0802A8DC: .4byte gBattleMons
_0802A8E0: .4byte gUnknown_02024C10
_0802A8E4:
	movs r0, 0x80
	lsls r0, 5
	orrs r2, r0
	str r2, [r4]
	ldr r1, _0802A8FC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802A8F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A8FC: .4byte gUnknown_02024C10
	thumb_func_end sub_802A6BC

	thumb_func_start atkD8_setdamagetohealthdifference
atkD8_setdamagetohealthdifference: @ 802A900
	push {lr}
	ldr r2, _0802A93C
	ldr r0, _0802A940
	ldrb r0, [r0]
	movs r1, 0x58
	muls r0, r1
	adds r3, r0, r2
	ldr r0, _0802A944
	ldrb r0, [r0]
	muls r0, r1
	adds r1, r0, r2
	ldrh r0, [r3, 0x28]
	ldrh r2, [r1, 0x28]
	cmp r0, r2
	bhi _0802A94C
	ldr r3, _0802A948
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
	b _0802A95E
	.align 2, 0
_0802A93C: .4byte gBattleMons
_0802A940: .4byte gUnknown_02024C08
_0802A944: .4byte gUnknown_02024C07
_0802A948: .4byte gUnknown_02024C10
_0802A94C:
	ldr r2, _0802A964
	ldrh r0, [r3, 0x28]
	ldrh r1, [r1, 0x28]
	subs r0, r1
	str r0, [r2]
	ldr r1, _0802A968
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802A95E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A964: .4byte gUnknown_02024BEC
_0802A968: .4byte gUnknown_02024C10
	thumb_func_end atkD8_setdamagetohealthdifference

	thumb_func_start atkD9_scaledamagebyhealthratio
atkD9_scaledamagebyhealthratio: @ 802A96C
	push {r4,lr}
	ldr r4, _0802A9B8
	ldrh r0, [r4]
	cmp r0, 0
	bne _0802A9A8
	ldr r2, _0802A9BC
	ldr r0, _0802A9C0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r3, [r0, 0x1]
	ldr r2, _0802A9C4
	ldr r0, _0802A9C8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r1, r0
	adds r1, r2
	ldrh r0, [r1, 0x28]
	muls r0, r3
	ldrh r1, [r1, 0x2C]
	bl __divsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0802A9A8
	movs r0, 0x1
	strh r0, [r4]
_0802A9A8:
	ldr r1, _0802A9CC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A9B8: .4byte gUnknown_02024DEC
_0802A9BC: .4byte gBattleMoves
_0802A9C0: .4byte gUnknown_02024BE6
_0802A9C4: .4byte gBattleMons
_0802A9C8: .4byte gUnknown_02024C07
_0802A9CC: .4byte gUnknown_02024C10
	thumb_func_end atkD9_scaledamagebyhealthratio

	thumb_func_start atkDA_abilityswap
atkDA_abilityswap: @ 802A9D0
	push {r4-r6,lr}
	ldr r5, _0802AA34
	ldr r0, _0802AA38
	ldrb r0, [r0]
	movs r4, 0x58
	muls r0, r4
	adds r0, r5
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r1, [r2]
	cmp r1, 0
	bne _0802A9F8
	ldr r0, _0802AA3C
	ldrb r0, [r0]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0
	beq _0802AA18
_0802A9F8:
	cmp r1, 0x19
	beq _0802AA18
	ldr r6, _0802AA3C
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x19
	beq _0802AA18
	ldr r0, _0802AA40
	ldrb r1, [r0]
	movs r0, 0x29
	ands r0, r1
	cmp r0, 0
	beq _0802AA48
_0802AA18:
	ldr r3, _0802AA44
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
	b _0802AA5E
	.align 2, 0
_0802AA34: .4byte gBattleMons
_0802AA38: .4byte gUnknown_02024C07
_0802AA3C: .4byte gUnknown_02024C08
_0802AA40: .4byte gUnknown_02024C68
_0802AA44: .4byte gUnknown_02024C10
_0802AA48:
	ldrb r1, [r2]
	strb r3, [r2]
	ldrb r0, [r6]
	muls r0, r4
	adds r0, r5
	adds r0, 0x20
	strb r1, [r0]
	ldr r1, _0802AA64
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AA5E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA64: .4byte gUnknown_02024C10
	thumb_func_end atkDA_abilityswap

	thumb_func_start atkDB_imprisoneffect
atkDB_imprisoneffect: @ 802AA68
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r0, 0
	mov r8, r0
	ldr r1, _0802AA8C
	ldr r0, _0802AA90
	ldrb r2, [r0]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 6
	ands r0, r1
	cmp r0, 0
	beq _0802AABC
	b _0802AB32
	.align 2, 0
_0802AA8C: .4byte gUnknown_02024C98
_0802AA90: .4byte gUnknown_02024C07
_0802AA94:
	ldr r0, _0802AAB4
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r2, 0x80
	lsls r2, 6
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0802AAB8
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802AB2A
	.align 2, 0
_0802AAB4: .4byte gUnknown_02024C98
_0802AAB8: .4byte gUnknown_02024C10
_0802AABC:
	adds r0, r2, 0
	bl sub_801529C
	movs r6, 0
	b _0802AB22
_0802AAC6:
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	beq _0802AB1C
	movs r4, 0
	ldr r7, _0802AB58
	mov r9, r7
	ldr r0, _0802AB5C
	mov r12, r0
	mov r1, r9
	ldrb r0, [r1]
	mov r2, r12
	adds r2, 0xC
	movs r1, 0x58
	muls r0, r1
	adds r3, r0, r2
	adds r5, r6, 0
	muls r5, r1
_0802AAF0:
	movs r2, 0
	ldrh r1, [r3]
	mov r0, r12
	adds r0, 0xC
	adds r0, r5, r0
_0802AAFA:
	ldrh r7, [r0]
	cmp r1, r7
	bne _0802AB04
	cmp r1, 0
	bne _0802AB0C
_0802AB04:
	adds r0, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _0802AAFA
_0802AB0C:
	cmp r2, 0x4
	bne _0802AB18
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0802AAF0
_0802AB18:
	cmp r4, 0x4
	bne _0802AA94
_0802AB1C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0802AB22:
	ldr r0, _0802AB60
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0802AAC6
_0802AB2A:
	ldr r0, _0802AB60
	ldrb r0, [r0]
	cmp r6, r0
	bne _0802AB4C
_0802AB32:
	ldr r3, _0802AB64
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
_0802AB4C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB58: .4byte gUnknown_02024C07
_0802AB5C: .4byte gBattleMons
_0802AB60: .4byte gUnknown_02024A68
_0802AB64: .4byte gUnknown_02024C10
	thumb_func_end atkDB_imprisoneffect

	thumb_func_start atkDC_setgrudge
atkDC_setgrudge: @ 802AB68
	push {lr}
	ldr r1, _0802ABA0
	ldr r0, _0802ABA4
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 7
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _0802ABAC
	ldr r3, _0802ABA8
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
	b _0802ABB8
	.align 2, 0
_0802ABA0: .4byte gUnknown_02024C98
_0802ABA4: .4byte gUnknown_02024C07
_0802ABA8: .4byte gUnknown_02024C10
_0802ABAC:
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802ABBC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802ABB8:
	pop {r0}
	bx r0
	.align 2, 0
_0802ABBC: .4byte gUnknown_02024C10
	thumb_func_end atkDC_setgrudge

	thumb_func_start atkDD_weightdamagecalculation
atkDD_weightdamagecalculation: @ 802ABC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0802AC24
	ldrh r0, [r2]
	ldr r1, _0802AC28
	cmp r0, r1
	beq _0802AC38
	adds r6, r2, 0
	ldr r0, _0802AC2C
	mov r8, r0
	adds r7, r1, 0
	adds r4, r6, 0
_0802ABDC:
	ldr r0, _0802AC30
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	add r0, r8
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D54
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0802AC0A
	adds r4, 0x4
	adds r5, 0x2
	ldrh r0, [r4]
	cmp r0, r7
	bne _0802ABDC
_0802AC0A:
	lsls r0, r5, 1
	adds r0, r6
	ldrh r1, [r0]
	ldr r0, _0802AC28
	cmp r1, r0
	beq _0802AC38
	ldr r0, _0802AC34
	adds r1, r5, 0x1
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	strh r1, [r0]
	b _0802AC3E
	.align 2, 0
_0802AC24: .4byte gWeightDamage
_0802AC28: .4byte 0x0000ffff
_0802AC2C: .4byte gBattleMons
_0802AC30: .4byte gUnknown_02024C08
_0802AC34: .4byte gUnknown_02024DEC
_0802AC38:
	ldr r1, _0802AC50
	movs r0, 0x78
	strh r0, [r1]
_0802AC3E:
	ldr r1, _0802AC54
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC50: .4byte gUnknown_02024DEC
_0802AC54: .4byte gUnknown_02024C10
	thumb_func_end atkDD_weightdamagecalculation

	thumb_func_start atkDE_asistattackselect
atkDE_asistattackselect: @ 802AC58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r10, r0
	ldr r0, _0802AD70
	ldrb r0, [r0]
	bl battle_get_per_side_status
	movs r1, 0x1
	ands r1, r0
	ldr r0, _0802AD74
	str r0, [sp]
	cmp r1, 0
	beq _0802AC80
	ldr r1, _0802AD78
	str r1, [sp]
_0802AC80:
	movs r2, 0
_0802AC82:
	ldr r1, _0802AD7C
	ldr r0, _0802AD70
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	adds r1, r2, 0x1
	str r1, [sp, 0x4]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0802AD28
	movs r0, 0x64
	adds r6, r2, 0
	muls r6, r0
	ldr r0, [sp]
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0802AD28
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0802AD28
	movs r5, 0
	ldr r1, _0802AD80
	mov r8, r1
	mov r9, r6
	mov r1, r10
	lsls r0, r1, 1
	ldr r1, _0802AD84
	adds r6, r0, r1
_0802ACCC:
	movs r7, 0
	adds r1, r5, 0
	adds r1, 0xD
	ldr r0, [sp]
	add r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_802838C
	lsls r0, 24
	adds r1, r5, 0x1
	cmp r0, 0
	bne _0802AD22
	ldr r0, _0802AD88
	ldrh r2, [r0]
	adds r3, r0, 0
	cmp r2, r8
	beq _0802AD16
	cmp r4, r2
	beq _0802AD0C
	ldr r5, _0802AD80
	adds r2, r3, 0
_0802ACFE:
	adds r2, 0x2
	adds r7, 0x1
	ldrh r0, [r2]
	cmp r0, r5
	beq _0802AD16
	cmp r4, r0
	bne _0802ACFE
_0802AD0C:
	lsls r0, r7, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r8
	bne _0802AD22
_0802AD16:
	cmp r4, 0
	beq _0802AD22
	strh r4, [r6]
	adds r6, 0x2
	movs r0, 0x1
	add r10, r0
_0802AD22:
	adds r5, r1, 0
	cmp r5, 0x3
	ble _0802ACCC
_0802AD28:
	ldr r2, [sp, 0x4]
	cmp r2, 0x5
	ble _0802AC82
	mov r1, r10
	cmp r1, 0
	beq _0802ADA0
	ldr r2, _0802AD8C
	ldr r0, [r2]
	ldr r1, _0802AD90
	ands r0, r1
	str r0, [r2]
	ldr r4, _0802AD94
	bl Random
	movs r1, 0xFF
	ands r1, r0
	mov r0, r10
	muls r0, r1
	asrs r0, 8
	lsls r0, 1
	ldr r1, _0802AD84
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0
	bl sub_801B5C0
	ldr r1, _0802AD98
	strb r0, [r1]
	ldr r1, _0802AD9C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802ADBA
	.align 2, 0
_0802AD70: .4byte gUnknown_02024C07
_0802AD74: .4byte gPlayerParty
_0802AD78: .4byte gEnemyParty
_0802AD7C: .4byte gUnknown_02024A6A
_0802AD80: .4byte 0x0000ffff
_0802AD84: .4byte 0x02016024
_0802AD88: .4byte gUnknown_081FACFE
_0802AD8C: .4byte gUnknown_02024C6C
_0802AD90: .4byte 0xfffffbff
_0802AD94: .4byte gUnknown_02024BEA
_0802AD98: .4byte gUnknown_02024C08
_0802AD9C: .4byte gUnknown_02024C10
_0802ADA0:
	ldr r3, _0802ADCC
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
_0802ADBA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802ADCC: .4byte gUnknown_02024C10
	thumb_func_end atkDE_asistattackselect

	thumb_func_start atkDF_setmagiccoat
atkDF_setmagiccoat: @ 802ADD0
	push {lr}
	ldr r1, _0802AE18
	ldr r3, _0802AE1C
	ldrb r0, [r3]
	strb r0, [r1]
	ldr r2, _0802AE20
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802AE24
	ldrb r1, [r0]
	ldr r0, _0802AE28
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802AE30
	ldr r3, _0802AE2C
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
	b _0802AE48
	.align 2, 0
_0802AE18: .4byte gUnknown_02024C08
_0802AE1C: .4byte gUnknown_02024C07
_0802AE20: .4byte gUnknown_02024D68
_0802AE24: .4byte gUnknown_02024A7E
_0802AE28: .4byte gUnknown_02024A68
_0802AE2C: .4byte gUnknown_02024C10
_0802AE30:
	ldr r0, _0802AE4C
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802AE50
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AE48:
	pop {r0}
	bx r0
	.align 2, 0
_0802AE4C: .4byte gUnknown_02024D28
_0802AE50: .4byte gUnknown_02024C10
	thumb_func_end atkDF_setmagiccoat

	thumb_func_start atkE0_setstealstatchange
atkE0_setstealstatchange: @ 802AE54
	push {lr}
	ldr r2, _0802AE98
	ldr r3, _0802AE9C
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0802AEA0
	ldrb r1, [r0]
	ldr r0, _0802AEA4
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _0802AEAC
	ldr r3, _0802AEA8
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
	b _0802AEC2
	.align 2, 0
_0802AE98: .4byte gUnknown_02024D68
_0802AE9C: .4byte gUnknown_02024C07
_0802AEA0: .4byte gUnknown_02024A7E
_0802AEA4: .4byte gUnknown_02024A68
_0802AEA8: .4byte gUnknown_02024C10
_0802AEAC:
	ldr r0, _0802AEC8
	ldrb r1, [r3]
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0802AECC
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AEC2:
	pop {r0}
	bx r0
	.align 2, 0
_0802AEC8: .4byte gUnknown_02024D28
_0802AECC: .4byte gUnknown_02024C10
	thumb_func_end atkE0_setstealstatchange

	thumb_func_start atkE1_802CBE4
atkE1_802CBE4: @ 802AED0
	push {r4-r6,lr}
	ldr r4, _0802AF74
	ldr r1, _0802AF78
	adds r0, r4, r1
	ldrb r0, [r0]
	subs r1, 0xDA
	adds r4, r1
	strb r0, [r4]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0802AF7C
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x9
	strb r0, [r2, 0x1]
	ldr r3, _0802AF80
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r2, _0802AF84
	ldr r1, _0802AF88
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _0802AF58
	adds r4, r2, 0
	ldr r6, _0802AF8C
_0802AF18:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	beq _0802AF3A
	ldr r0, _0802AF90
	ldrb r1, [r0]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ands r1, r0
	ldr r2, _0802AF88
	cmp r1, 0
	beq _0802AF4E
_0802AF3A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0802AF88
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	ldrb r1, [r2]
	cmp r0, r1
	bcc _0802AF18
_0802AF4E:
	ldr r0, _0802AF84
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	bcc _0802AF98
_0802AF58:
	ldr r3, _0802AF94
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
	b _0802AFA0
	.align 2, 0
_0802AF74: .4byte 0x02000000
_0802AF78: .4byte 0x000160dd
_0802AF7C: .4byte gUnknown_030041C0
_0802AF80: .4byte gBattleMons
_0802AF84: .4byte gUnknown_02024C08
_0802AF88: .4byte gUnknown_02024A68
_0802AF8C: .4byte gBitTable
_0802AF90: .4byte gUnknown_02024C0C
_0802AF94: .4byte gUnknown_02024C10
_0802AF98:
	ldr r1, _0802AFA8
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_0802AFA0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AFA8: .4byte gUnknown_02024C10
	thumb_func_end atkE1_802CBE4

	thumb_func_start sub_802ADD8
sub_802ADD8: @ 802AFAC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r6, _0802B018
	ldr r0, [r6]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r5, _0802B01C
	strb r0, [r5]
	ldr r4, _0802B020
	ldrb r0, [r5]
	movs r1, 0x58
	mov r12, r1
	mov r1, r12
	muls r1, r0
	adds r0, r1, r4
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1E
	bne _0802B008
	adds r4, 0x4C
	adds r1, r4
	movs r0, 0
	str r0, [r1]
	ldr r2, _0802B024
	ldr r1, _0802B028
	ldrb r3, [r5]
	ldr r7, _0802B02C
	adds r0, r3, r7
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	mov r0, r12
	muls r0, r3
	adds r0, r4
	str r0, [sp]
	movs r0, 0
	movs r1, 0x28
	movs r3, 0x4
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r5]
	bl dp01_battle_side_mark_buffer_for_execution
_0802B008:
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B018: .4byte gUnknown_02024C10
_0802B01C: .4byte gUnknown_02024A60
_0802B020: .4byte gBattleMons
_0802B024: .4byte gBitTable
_0802B028: .4byte 0x02000000
_0802B02C: .4byte 0x00016064
	thumb_func_end sub_802ADD8

	thumb_func_start atkE3_jumpiffainted
atkE3_jumpiffainted: @ 802B030
	push {r4,lr}
	ldr r4, _0802B06C
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8015150
	ldr r1, _0802B070
	strb r0, [r1]
	ldr r2, _0802B074
	ldrb r1, [r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, r2
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	bne _0802B078
	ldr r2, [r4]
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
	str r1, [r4]
	b _0802B07E
	.align 2, 0
_0802B06C: .4byte gUnknown_02024C10
_0802B070: .4byte gUnknown_02024A60
_0802B074: .4byte gBattleMons
_0802B078:
	ldr r0, [r4]
	adds r0, 0x6
	str r0, [r4]
_0802B07E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end atkE3_jumpiffainted

	thumb_func_start sub_802AEB0
sub_802AEB0: @ 802B084
	push {lr}
	ldr r0, _0802B098
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _0802B120
	lsls r0, 2
	ldr r1, _0802B09C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B098: .4byte gUnknown_0300428C
_0802B09C: .4byte _0802B0A0
	.align 2, 0
_0802B0A0:
	.4byte _0802B0C0
	.4byte _0802B0CC
	.4byte _0802B0D8
	.4byte _0802B0E4
	.4byte _0802B0F0
	.4byte _0802B0FC
	.4byte _0802B108
	.4byte _0802B114
_0802B0C0:
	ldr r1, _0802B0C8
	movs r0, 0x2
	b _0802B124
	.align 2, 0
_0802B0C8: .4byte gUnknown_02024D1E
_0802B0CC:
	ldr r1, _0802B0D4
	movs r0, 0x1
	b _0802B124
	.align 2, 0
_0802B0D4: .4byte gUnknown_02024D1E
_0802B0D8:
	ldr r1, _0802B0E0
	movs r0, 0x1B
	b _0802B124
	.align 2, 0
_0802B0E0: .4byte gUnknown_02024D1E
_0802B0E4:
	ldr r1, _0802B0EC
	movs r0, 0x17
	b _0802B124
	.align 2, 0
_0802B0EC: .4byte gUnknown_02024D1E
_0802B0F0:
	ldr r1, _0802B0F8
	movs r0, 0x16
	b _0802B124
	.align 2, 0
_0802B0F8: .4byte gUnknown_02024D1E
_0802B0FC:
	ldr r1, _0802B104
	movs r0, 0x18
	b _0802B124
	.align 2, 0
_0802B104: .4byte gUnknown_02024D1E
_0802B108:
	ldr r1, _0802B110
	movs r0, 0x7
	b _0802B124
	.align 2, 0
_0802B110: .4byte gUnknown_02024D1E
_0802B114:
	ldr r1, _0802B11C
	movs r0, 0x8
	b _0802B124
	.align 2, 0
_0802B11C: .4byte gUnknown_02024D1E
_0802B120:
	ldr r1, _0802B134
	movs r0, 0x5
_0802B124:
	strb r0, [r1, 0x3]
	ldr r1, _0802B138
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802B134: .4byte gUnknown_02024D1E
_0802B138: .4byte gUnknown_02024C10
	thumb_func_end sub_802AEB0

	thumb_func_start sub_802AF68
sub_802AF68: @ 802B13C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	ldr r0, _0802B188
	mov r9, r0
	ldr r1, _0802B18C
	mov r8, r1
_0802B14E:
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _0802B190
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	cmp r0, 0
	beq _0802B194
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x17]
	b _0802B19E
	.align 2, 0
_0802B188: .4byte gBaseStats
_0802B18C: .4byte gPickupItems
_0802B190: .4byte gPlayerParty
_0802B194:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x16]
_0802B19E:
	adds r4, r7, 0x1
	cmp r0, 0x35
	bne _0802B206
	cmp r5, 0
	beq _0802B206
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	beq _0802B206
	cmp r6, 0
	bne _0802B206
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _0802B206
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	mov r1, r8
	ldrh r0, [r1, 0x2]
	cmp r0, r3
	bgt _0802B1F4
	adds r1, 0x2
_0802B1E6:
	adds r1, 0x4
	adds r2, 0x2
	cmp r2, 0x11
	bgt _0802B1F4
	ldrh r0, [r1]
	cmp r0, r3
	ble _0802B1E6
_0802B1F4:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0802B220
	adds r0, r1
	lsls r2, 1
	add r2, r8
	movs r1, 0xC
	bl SetMonData
_0802B206:
	adds r7, r4, 0
	cmp r7, 0x5
	ble _0802B14E
	ldr r1, _0802B224
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B220: .4byte gPlayerParty
_0802B224: .4byte gUnknown_02024C10
	thumb_func_end sub_802AF68

	thumb_func_start atkE6_castform_transform
atkE6_castform_transform: @ 802B228
	push {r4,lr}
	ldr r4, _0802B27C
	ldr r3, _0802B280
	ldr r1, _0802B284
	adds r0, r3, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _0802B288
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 17
	ands r0, r1
	cmp r0, 0
	beq _0802B25A
	ldr r0, _0802B28C
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x80
	orrs r0, r1
	strb r0, [r2]
_0802B25A:
	ldr r1, _0802B28C
	adds r0, r3, r1
	ldrb r2, [r0]
	movs r0, 0
	movs r1, 0
	bl dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _0802B290
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B27C: .4byte gUnknown_02024A60
_0802B280: .4byte 0x02000000
_0802B284: .4byte 0x00016003
_0802B288: .4byte gBattleMons
_0802B28C: .4byte 0x0001609b
_0802B290: .4byte gUnknown_02024C10
	thumb_func_end atkE6_castform_transform

	thumb_func_start atkE7_castform_switch
atkE7_castform_switch: @ 802B294
	push {r4,r5,lr}
	ldr r1, _0802B2C8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r5, _0802B2CC
	ldr r1, _0802B2D0
	adds r0, r5, r1
	ldrb r0, [r0]
	bl castform_switch
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0802B2C0
	ldr r0, _0802B2D4
	bl b_push_move_exec
	subs r1, r4, 0x1
	ldr r2, _0802B2D8
	adds r0, r5, r2
	strb r1, [r0]
_0802B2C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2C8: .4byte gUnknown_02024C10
_0802B2CC: .4byte 0x02000000
_0802B2D0: .4byte 0x00016003
_0802B2D4: .4byte gUnknown_081D977D
_0802B2D8: .4byte 0x0001609b
	thumb_func_end atkE7_castform_switch

	thumb_func_start atkE8_settypebasedhalvers
atkE8_settypebasedhalvers: @ 802B2DC
	push {r4,lr}
	movs r4, 0
	ldr r2, _0802B318
	ldr r0, _0802B31C
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xC9
	bne _0802B32C
	ldr r1, _0802B320
	ldr r0, _0802B324
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0802B350
	orrs r1, r3
	str r1, [r2]
	ldr r0, _0802B328
	strb r4, [r0, 0x5]
	b _0802B354
	.align 2, 0
_0802B318: .4byte gBattleMoves
_0802B31C: .4byte gUnknown_02024BE6
_0802B320: .4byte gUnknown_02024C98
_0802B324: .4byte gUnknown_02024C07
_0802B328: .4byte gUnknown_02024D1E
_0802B32C:
	ldr r1, _0802B360
	ldr r0, _0802B364
	ldrb r0, [r0]
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 10
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0802B350
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0802B368
	movs r0, 0x1
	strb r0, [r1, 0x5]
	movs r4, 0x1
_0802B350:
	cmp r4, 0
	beq _0802B370
_0802B354:
	ldr r1, _0802B36C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
	b _0802B38A
	.align 2, 0
_0802B360: .4byte gUnknown_02024C98
_0802B364: .4byte gUnknown_02024C07
_0802B368: .4byte gUnknown_02024D1E
_0802B36C: .4byte gUnknown_02024C10
_0802B370:
	ldr r3, _0802B390
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
_0802B38A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B390: .4byte gUnknown_02024C10
	thumb_func_end atkE8_settypebasedhalvers

	thumb_func_start sub_802B1C0
sub_802B1C0: @ 802B394
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802B44A
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0802B44A
	ldr r3, _0802B3EC
	ldrb r0, [r3]
	ldr r2, _0802B3F0
	cmp r0, 0
	beq _0802B3D6
	ldr r0, _0802B3F4
	adds r1, r2, r0
	movs r0, 0x2
	strb r0, [r1]
_0802B3D6:
	ldrh r1, [r3]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0802B3FC
	ldr r0, _0802B3F8
	adds r1, r2, r0
	movs r0, 0x8B
	strb r0, [r1]
	b _0802B44A
	.align 2, 0
_0802B3EC: .4byte word_2024DB8
_0802B3F0: .4byte 0x02000000
_0802B3F4: .4byte 0x0001601f
_0802B3F8: .4byte 0x0001601c
_0802B3FC:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _0802B414
	ldr r0, _0802B410
	adds r1, r2, r0
	movs r0, 0x85
	strb r0, [r1]

