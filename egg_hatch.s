	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreatedHatchedMon
CreatedHatchedMon: @ 8042BC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x48
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r4, 0
	add r7, sp, 0x18
	mov r0, sp
	adds r0, 0x31
	str r0, [sp, 0x38]
	mov r1, sp
	adds r1, 0x32
	str r1, [sp, 0x3C]
	add r0, sp, 0x30
	mov r9, r0
	adds r1, 0x1
	str r1, [sp, 0x40]
	mov r0, sp
	adds r0, 0x34
	str r0, [sp, 0x44]
_08042C02:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	lsls r1, r4, 1
	add r1, sp
	adds r1, 0x10
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08042C02
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	movs r4, 0
_08042C2A:
	adds r1, r4, 0
	adds r1, 0x27
	adds r0, r6, 0
	bl GetMonData
	lsls r1, r4, 2
	adds r1, r7, r1
	str r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08042C2A
	adds r0, r6, 0
	movs r1, 0x25
	bl GetMonData
	ldr r1, [sp, 0x38]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x8
	bl GetMonData
	ldr r1, [sp, 0x3C]
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x22
	bl GetMonData
	str r0, [sp, 0x34]
	movs r0, 0x1
	str r0, [sp]
	mov r0, r8
	str r0, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	mov r1, r10
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r4, 0
_08042C82:
	adds r1, r4, 0
	adds r1, 0xD
	lsls r0, r4, 1
	mov r2, sp
	adds r2, r0
	adds r2, 0x10
	adds r0, r5, 0
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08042C82
	movs r4, 0
_08042CA0:
	adds r1, r4, 0
	adds r1, 0x27
	lsls r2, r4, 2
	adds r2, r7, r2
	adds r0, r5, 0
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08042CA0
	movs r0, 0x5
	mov r1, r9
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, r9
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x25
	ldr r2, [sp, 0x38]
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x8
	ldr r2, [sp, 0x3C]
	bl SetMonData
	movs r0, 0x78
	ldr r1, [sp, 0x40]
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x20
	ldr r2, [sp, 0x40]
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x22
	ldr r2, [sp, 0x44]
	bl SetMonData
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	add sp, 0x48
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreatedHatchedMon

	thumb_func_start AddHatchedMonToParty
AddHatchedMonToParty: @ 8042D10
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r5, r0, 0
	muls r5, r1
	ldr r0, _08042DC0
	adds r5, r0
	ldr r1, _08042DC4
	adds r0, r5, 0
	bl CreatedHatchedMon
	add r2, sp, 0xC
	movs r6, 0
	strb r6, [r2]
	adds r0, r5, 0
	movs r1, 0x2D
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	adds r1, r4, 0
	bl GetSpeciesName
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8090D90
	ldr r1, _08042DC8
	adds r0, r5, 0
	bl pokemon_get_nick
	mov r2, sp
	adds r2, 0xE
	movs r0, 0x4
	strh r0, [r2]
	adds r0, r5, 0
	movs r1, 0x26
	bl SetMonData
	add r2, sp, 0x10
	strh r6, [r2]
	adds r0, r5, 0
	movs r1, 0x24
	bl SetMonData
	bl sav1_map_get_name
	mov r2, sp
	adds r2, 0x12
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0x23
	bl SetMonData
	adds r0, r5, 0
	bl sub_8040B1C
	adds r0, r5, 0
	bl CalculateMonStats
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042DC0: .4byte gPlayerParty
_08042DC4: .4byte gEnemyParty
_08042DC8: .4byte gStringVar1
	thumb_func_end AddHatchedMonToParty

	thumb_func_start ScriptHatchMon
ScriptHatchMon: @ 8042DCC
	push {lr}
	ldr r0, _08042DDC
	ldrb r0, [r0]
	bl AddHatchedMonToParty
	pop {r0}
	bx r0
	.align 2, 0
_08042DDC: .4byte gSpecialVar_0x8004
	thumb_func_end ScriptHatchMon

	thumb_func_start sub_8042ABC
sub_8042ABC: @ 8042DE0
	push {r4-r6,lr}
	sub sp, 0x20
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r5, r0
	mov r1, sp
	bl pokemon_get_nick_
	lsls r0, r4, 3
	subs r0, r4
	lsls r1, r0, 3
	adds r0, r5, r1
	adds r0, 0xC0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08042E64
	adds r0, r1, 0
	adds r0, 0xA0
	adds r5, r0
	adds r6, r5, 0
	adds r6, 0x2C
	mov r0, sp
	adds r1, r6, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08042E2C
	ldr r0, _08042E54
	adds r1, r5, 0
	adds r1, 0x24
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _08042E64
_08042E2C:
	ldr r0, _08042E58
	mov r1, sp
	bl StringCopy
	ldr r4, _08042E5C
	adds r1, r5, 0
	adds r1, 0x24
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _08042E60
	adds r1, r6, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	movs r0, 0x1
	b _08042E66
	.align 2, 0
_08042E54: .4byte gSaveBlock2
_08042E58: .4byte gStringVar1
_08042E5C: .4byte gStringVar2
_08042E60: .4byte gStringVar3
_08042E64:
	movs r0, 0
_08042E66:
	add sp, 0x20
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8042ABC

	thumb_func_start sub_8042B4C
sub_8042B4C: @ 8042E70
	push {lr}
	ldr r0, _08042E84
	ldr r1, _08042E88
	ldrb r1, [r1]
	bl sub_8042ABC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08042E84: .4byte 0x020286d0
_08042E88: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8042B4C

	thumb_func_start EggHatchCreateMonSprite
EggHatchCreateMonSprite: @ 8042E8C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r1, r2, 24
	adds r2, r1, 0
	movs r5, 0
	mov r9, r5
	movs r7, 0
	cmp r3, 0
	bne _08042EBA
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08042ED4
	adds r7, r1, r0
	movs r5, 0x1
_08042EBA:
	cmp r3, 0x1
	bne _08042ECA
	movs r0, 0x64
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _08042ED4
	adds r7, r1, r0
	movs r5, 0x3
_08042ECA:
	cmp r6, 0
	beq _08042ED8
	cmp r6, 0x1
	beq _08042F38
	b _08042F74
	.align 2, 0
_08042ED4: .4byte gPlayerParty
_08042ED8:
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	lsls r0, r5, 3
	ldr r1, _08042F28
	adds r0, r1
	ldr r1, _08042F2C
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08042F30
	ldr r6, _08042F34
	lsls r4, 1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl sub_800D334
	adds r0, r7, 0
	bl sub_8040990
	bl LoadCompressedObjectPalette
	b _08042F74
	.align 2, 0
_08042F28: .4byte gMonFrontPicTable
_08042F2C: .4byte gMonFrontPicCoords
_08042F30: .4byte 0x02000000
_08042F34: .4byte gUnknown_081FAF4C
_08042F38:
	adds r0, r7, 0
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r5, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08042F84
	movs r1, 0x78
	movs r2, 0x46
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _08042F88
	lsls r1, r0, 4
	add r1, r9
	lsls r1, 2
	adds r2, r1, r4
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r2]
	adds r4, 0x1C
	adds r1, r4
	ldr r0, _08042F8C
	str r0, [r1]
_08042F74:
	mov r0, r9
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042F84: .4byte gUnknown_02024E8C
_08042F88: .4byte gSprites
_08042F8C: .4byte SpriteCallbackDummy
	thumb_func_end EggHatchCreateMonSprite

	thumb_func_start VBlankCB_EggHatch
VBlankCB_EggHatch: @ 8042F90
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_EggHatch

	thumb_func_start EggHatch
EggHatch: @ 8042FA4
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08042FCC
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08042FCC: .4byte Task_EggHatch
	thumb_func_end EggHatch

	thumb_func_start Task_EggHatch
Task_EggHatch: @ 8042FD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08042FFC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08042FF4
	ldr r0, _08043000
	bl SetMainCallback2
	ldr r1, _08043004
	ldr r0, _08043008
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_08042FF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042FFC: .4byte gPaletteFade
_08043000: .4byte CB2_EggHatch_0
_08043004: .4byte gUnknown_0300485C
_08043008: .4byte sub_8080990
	thumb_func_end Task_EggHatch

	thumb_func_start CB2_EggHatch_0
CB2_EggHatch_0: @ 804300C
	push {r4-r7,lr}
	ldr r0, _08043028
	ldr r1, _0804302C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _0804301C
	b _08043292
_0804301C:
	lsls r0, 2
	ldr r1, _08043030
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043028: .4byte gMain
_0804302C: .4byte 0x0000043c
_08043030: .4byte _08043034
	.align 2, 0
_08043034:
	.4byte _08043058
	.4byte _080430B4
	.4byte _080430E8
	.4byte _08043144
	.4byte _08043164
	.4byte _08043198
	.4byte _080431AC
	.4byte _080431D4
	.4byte _08043264
_08043058:
	movs r0, 0x80
	lsls r0, 19
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08043098
	ldr r0, _0804309C
	str r0, [r1]
	ldr r1, _080430A0
	ldrh r1, [r1]
	strb r1, [r0, 0x4]
	adds r0, 0x3A
	strb r2, [r0]
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _080430A4
	bl SetVBlankCallback
	ldr r1, _080430A8
	ldr r2, _080430AC
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, _080430B0
	strh r0, [r1]
	b _08043292
	.align 2, 0
_08043098: .4byte gUnknown_0300481C
_0804309C: .4byte 0x02018000
_080430A0: .4byte gSpecialVar_0x8004
_080430A4: .4byte VBlankCB_EggHatch
_080430A8: .4byte gMain
_080430AC: .4byte 0x0000043c
_080430B0: .4byte gSpecialVar_0x8005
_080430B4:
	ldr r5, _080430E0
	adds r0, r5, 0
	bl SetUpWindowConfig
	ldr r4, _080430E4
	ldr r0, [r4]
	adds r0, 0x8
	adds r1, r5, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r4]
	adds r1, 0x38
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x8
	bl LoadTextWindowGraphics
	b _08043228
	.align 2, 0
_080430E0: .4byte gWindowConfig_81E6F84
_080430E4: .4byte gUnknown_0300481C
_080430E8:
	ldr r0, _08043120
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _08043124
	ldr r4, _08043128
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r1, _0804312C
	str r4, [r1]
	ldr r0, _08043130
	str r0, [r1, 0x4]
	ldr r0, _08043134
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _08043138
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0804313C
	ldr r2, _08043140
	adds r1, r2
	b _0804322E
	.align 2, 0
_08043120: .4byte gUnknown_08D00000
_08043124: .4byte gUnknown_08D00524
_08043128: .4byte 0x02000000
_0804312C: .4byte 0x040000d4
_08043130: .4byte 0x06002800
_08043134: .4byte 0x80000280
_08043138: .4byte gUnknown_08D004E0
_0804313C: .4byte gMain
_08043140: .4byte 0x0000043c
_08043144:
	ldr r0, _08043158
	bl LoadSpriteSheet
	ldr r0, _0804315C
	bl LoadSpriteSheet
	ldr r0, _08043160
	bl LoadSpritePalette
	b _08043228
	.align 2, 0
_08043158: .4byte gUnknown_0820A3B0
_0804315C: .4byte gUnknown_0820A3B8
_08043160: .4byte gUnknown_0820A3C0
_08043164:
	ldr r0, _08043188
	movs r1, 0x78
	movs r2, 0x4B
	movs r3, 0x5
	bl CreateSprite
	ldr r2, _0804318C
	ldr r1, [r2]
	strb r0, [r1]
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	bl AddHatchedMonToParty
	ldr r1, _08043190
	ldr r2, _08043194
	adds r1, r2
	b _0804322E
	.align 2, 0
_08043188: .4byte gSpriteTemplate_820A3C8
_0804318C: .4byte gUnknown_0300481C
_08043190: .4byte gMain
_08043194: .4byte 0x0000043c
_08043198:
	ldr r0, _080431A8
	ldr r0, [r0]
	ldrb r2, [r0, 0x4]
	movs r0, 0
	movs r1, 0
	bl EggHatchCreateMonSprite
	b _08043228
	.align 2, 0
_080431A8: .4byte gUnknown_0300481C
_080431AC:
	ldr r4, _080431C8
	ldr r0, [r4]
	ldrb r2, [r0, 0x4]
	movs r0, 0
	movs r1, 0x1
	bl EggHatchCreateMonSprite
	ldr r1, [r4]
	strb r0, [r1, 0x1]
	ldr r1, _080431CC
	ldr r2, _080431D0
	adds r1, r2
	b _0804322E
	.align 2, 0
_080431C8: .4byte gUnknown_0300481C
_080431CC: .4byte gMain
_080431D0: .4byte 0x0000043c
_080431D4:
	ldr r0, _08043238
	ldr r2, _0804323C
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08043240
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _08043244
	ldr r4, _08043248
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804324C
	ldr r6, _08043250
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_080431FA:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _080431FA
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08043254
	ldr r2, _08043258
	ldr r0, _0804324C
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08043250
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_08043228:
	ldr r1, _0804325C
	ldr r0, _08043260
	adds r1, r0
_0804322E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08043292
	.align 2, 0
_08043238: .4byte 0x0400000c
_0804323C: .4byte 0x00004c06
_08043240: .4byte gUnknown_0820C9F8
_08043244: .4byte gUnknown_0820CA98
_08043248: .4byte 0x06004000
_0804324C: .4byte 0x040000d4
_08043250: .4byte 0x80000800
_08043254: .4byte gUnknown_0820F798
_08043258: .4byte 0x06006000
_0804325C: .4byte gMain
_08043260: .4byte 0x0000043c
_08043264:
	ldr r1, _08043298
	ldr r2, _0804329C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080432A0
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r0, _080432A4
	bl SetMainCallback2
	ldr r0, _080432A8
	ldr r0, [r0]
	strb r4, [r0, 0x2]
_08043292:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043298: .4byte 0x0400000a
_0804329C: .4byte 0x00000501
_080432A0: .4byte 0x04000010
_080432A4: .4byte CB2_EggHatch_1
_080432A8: .4byte gUnknown_0300481C
	thumb_func_end CB2_EggHatch_0

	thumb_func_start EggHatchSetMonNickname
EggHatchSetMonNickname: @ 80432AC
	push {lr}
	ldr r0, _080432CC
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080432D0
	adds r0, r1
	ldr r2, _080432D4
	movs r1, 0x2
	bl SetMonData
	ldr r0, _080432D8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080432CC: .4byte gSpecialVar_0x8004
_080432D0: .4byte gPlayerParty
_080432D4: .4byte gStringVar3
_080432D8: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end EggHatchSetMonNickname

	thumb_func_start Task_EggHatchPlayBGM
Task_EggHatchPlayBGM: @ 80432DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08043328
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080432F8
	bl StopMapMusic
_080432F8:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08043308
	movs r0, 0xBC
	lsls r0, 1
	bl PlayBGM
_08043308:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	ble _0804331C
	ldr r0, _0804332C
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_0804331C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043328: .4byte gTasks
_0804332C: .4byte 0x00000179
	thumb_func_end Task_EggHatchPlayBGM

	thumb_func_start CB2_EggHatch_1
CB2_EggHatch_1: @ 8043330
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r1, _08043354
	ldr r0, [r1]
	ldrb r0, [r0, 0x2]
	adds r5, r1, 0
	cmp r0, 0xB
	bls _0804334A
	b _080435DE
_0804334A:
	lsls r0, 2
	ldr r1, _08043358
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043354: .4byte gUnknown_0300481C
_08043358: .4byte _0804335C
	.align 2, 0
_0804335C:
	.4byte _0804338C
	.4byte _080433C4
	.4byte _080433E4
	.4byte _0804341C
	.4byte _08043448
	.4byte _08043488
	.4byte _08043496
	.4byte _080434A4
	.4byte _080434DC
	.4byte _080434FE
	.4byte _080435AC
	.4byte _080435CC
_0804338C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080433BC
	ldr r1, [r0]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r0, _080433C0
	movs r1, 0x5
	bl CreateTask
	b _080435DE
	.align 2, 0
_080433BC: .4byte gUnknown_0300481C
_080433C0: .4byte Task_EggHatchPlayBGM
_080433C4:
	ldr r0, _080433E0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080433D6
	b _080435DE
_080433D6:
	ldr r0, [r5]
	strb r1, [r0, 0x3]
	ldr r1, [r5]
	b _080435C0
	.align 2, 0
_080433E0: .4byte gPaletteFade
_080433E4:
	ldr r1, [r5]
	ldrb r0, [r1, 0x3]
	adds r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bhi _080433F6
	b _080435DE
_080433F6:
	ldr r1, [r5]
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	ldr r2, _08043414
	ldr r0, [r5]
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08043418
	str r1, [r0]
	b _080435DE
	.align 2, 0
_08043414: .4byte gSprites
_08043418: .4byte SpriteCB_Egg_0
_0804341C:
	ldr r2, _08043440
	ldr r3, [r5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08043444
	cmp r1, r0
	beq _08043436
	b _080435DE
_08043436:
	ldrb r0, [r3, 0x2]
	adds r0, 0x1
	strb r0, [r3, 0x2]
	b _080435DE
	.align 2, 0
_08043440: .4byte gSprites
_08043444: .4byte SpriteCallbackDummy
_08043448:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08043474
	adds r0, r1
	ldr r1, _08043478
	bl pokemon_get_nick
	ldr r4, _0804347C
	ldr r1, _08043480
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	bl EggHatchPrintMessage2
	ldr r0, _08043484
	bl PlayFanfare
	ldr r1, [r5]
	b _080435C0
	.align 2, 0
_08043474: .4byte gPlayerParty
_08043478: .4byte gStringVar1
_0804347C: .4byte gStringVar4
_08043480: .4byte gOtherText_HatchedFromEgg
_08043484: .4byte 0x00000173
_08043488:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	bne _08043494
	b _080435DE
_08043494:
	b _080435BC
_08043496:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	bne _080434A2
	b _080435DE
_080434A2:
	b _080435BC
_080434A4:
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080434CC
	adds r0, r1
	ldr r1, _080434D0
	bl pokemon_get_nick
	ldr r4, _080434D4
	ldr r1, _080434D8
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	bl EggHatchPrintMessage1
	ldr r1, [r5]
	b _080435C0
	.align 2, 0
_080434CC: .4byte gPlayerParty
_080434D0: .4byte gStringVar1
_080434D4: .4byte gStringVar4
_080434D8: .4byte gOtherText_NickHatchPrompt
_080434DC:
	bl EggHatchUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _080435DE
	movs r0, 0x16
	movs r1, 0x8
	movs r2, 0x1B
	movs r3, 0xD
	bl MenuDrawTextWindow
	movs r0, 0x16
	movs r1, 0x8
	movs r2, 0x4
	bl InitYesNoMenu
	b _080435BC
_080434FE:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	movs r1, 0x2
	negs r1, r1
	cmp r0, r1
	beq _080435DE
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080435BC
	cmp r1, 0x1
	beq _080435BC
	ldr r0, _0804359C
	mov r9, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x4]
	movs r1, 0x64
	mov r8, r1
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	ldr r6, _080435A0
	adds r0, r6
	ldr r1, _080435A4
	mov r10, r1
	bl pokemon_get_nick
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl GetMonGender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, 0x4]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _080435A8
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl DoNamingScreen
	b _080435DE
	.align 2, 0
_0804359C: .4byte gUnknown_0300481C
_080435A0: .4byte gPlayerParty
_080435A4: .4byte gStringVar3
_080435A8: .4byte EggHatchSetMonNickname
_080435AC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080435BC:
	ldr r0, _080435C8
	ldr r1, [r0]
_080435C0:
	ldrb r0, [r1, 0x2]
	adds r0, 0x1
	strb r0, [r1, 0x2]
	b _080435DE
	.align 2, 0
_080435C8: .4byte gUnknown_0300481C
_080435CC:
	ldr r0, _08043600
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080435DE
	ldr r0, _08043604
	bl SetMainCallback2
_080435DE:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043600: .4byte gPaletteFade
_08043604: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end CB2_EggHatch_1

	thumb_func_start SpriteCB_Egg_0
SpriteCB_Egg_0: @ 8043608
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08043628
	ldr r0, _08043624
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	b _08043658
	.align 2, 0
_08043624: .4byte SpriteCB_Egg_1
_08043628:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08043658
	movs r0, 0x17
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
_08043658:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_0

	thumb_func_start SpriteCB_Egg_1
SpriteCB_Egg_1: @ 8043660
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080436BC
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08043690
	ldr r0, _0804368C
	str r0, [r4, 0x1C]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x32]
	b _080436BC
	.align 2, 0
_0804368C: .4byte SpriteCB_Egg_2
_08043690:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _080436BC
	movs r0, 0x17
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080436BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_1

	thumb_func_start SpriteCB_Egg_2
SpriteCB_Egg_2: @ 80436C4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _0804377E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x26
	ble _0804373C
	ldr r0, _08043728
	str r0, [r4, 0x1C]
	strh r6, [r4, 0x2E]
	ldr r5, _0804372C
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08043730
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	ldr r4, _08043734
	ldr r3, [r5]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r6, [r1, 0x24]
	ldrb r2, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldr r2, _08043738
	lsrs r0, 14
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	b _0804377E
	.align 2, 0
_08043728: .4byte SpriteCB_Egg_3
_0804372C: .4byte gUnknown_0300481C
_08043730: .4byte gPlayerParty
_08043734: .4byte gSprites
_08043738: .4byte gMonFrontPicCoords
_0804373C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bne _08043770
	movs r0, 0x17
	bl PlaySE
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	bl CreateRandomEggShardSprite
	bl CreateRandomEggShardSprite
_08043770:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	bne _0804377E
	movs r0, 0x17
	bl PlaySE
_0804377E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_Egg_2

	thumb_func_start SpriteCB_Egg_3
SpriteCB_Egg_3: @ 8043784
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _0804379E
	ldr r0, _080437A4
	str r0, [r1, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x2E]
_0804379E:
	pop {r0}
	bx r0
	.align 2, 0
_080437A4: .4byte SpriteCB_Egg_4
	thumb_func_end SpriteCB_Egg_3

	thumb_func_start SpriteCB_Egg_4
SpriteCB_Egg_4: @ 80437A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080437C8
	movs r1, 0x1
	negs r1, r1
	ldr r0, _0804381C
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080437C8:
	ldrh r0, [r5, 0x2E]
	cmp r0, 0x3
	bhi _080437E4
	movs r4, 0
_080437D0:
	bl CreateRandomEggShardSprite
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080437D0
_080437E4:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	ldr r0, _08043820
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08043812
	movs r0, 0x71
	bl PlaySE
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08043824
	str r0, [r5, 0x1C]
	strh r4, [r5, 0x2E]
_08043812:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804381C: .4byte 0x0000ffff
_08043820: .4byte gPaletteFade
_08043824: .4byte SpriteCB_Egg_5
	thumb_func_end SpriteCB_Egg_4

	thumb_func_start SpriteCB_Egg_5
SpriteCB_Egg_5: @ 8043828
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08043864
	ldr r4, _080438B8
	ldr r3, _080438BC
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08043864:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x8
	bne _0804387E
	movs r1, 0x1
	negs r1, r1
	ldr r0, _080438C0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804387E:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x9
	bgt _0804389C
	ldr r2, _080438B8
	ldr r0, _080438BC
	ldr r0, [r0]
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_0804389C:
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x28
	ble _080438AA
	ldr r0, _080438C4
	str r0, [r5, 0x1C]
_080438AA:
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080438B8: .4byte gSprites
_080438BC: .4byte gUnknown_0300481C
_080438C0: .4byte 0x0000ffff
_080438C4: .4byte SpriteCallbackDummy
	thumb_func_end SpriteCB_Egg_5

	thumb_func_start SpriteCB_EggShard
SpriteCB_EggShard: @ 80438C8
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x38]
	adds r0, r1, r3
	strh r0, [r2, 0x38]
	movs r4, 0x36
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bge _080438E6
	adds r0, 0xFF
_080438E6:
	asrs r0, 8
	strh r0, [r2, 0x24]
	movs r3, 0x38
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080438F4
	adds r0, 0xFF
_080438F4:
	asrs r0, 8
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r3, r1, r0
	strh r3, [r2, 0x32]
	movs r4, 0x22
	ldrsh r1, [r2, r4]
	movs r4, 0x26
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	adds r1, 0x14
	cmp r0, r1
	ble _0804391A
	lsls r0, r3, 16
	cmp r0, 0
	ble _0804391A
	adds r0, r2, 0
	bl DestroySprite
_0804391A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_EggShard

	thumb_func_start CreateRandomEggShardSprite
CreateRandomEggShardSprite: @ 8043920
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r3, _08043970
	ldr r0, _08043974
	ldr r4, [r0]
	adds r4, 0x3A
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r1, r0, r3
	ldrh r6, [r1]
	adds r3, 0x2
	adds r0, r3
	ldrh r5, [r0]
	adds r2, 0x1
	strb r2, [r4]
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	movs r0, 0x64
	str r0, [sp]
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x3C
	adds r2, r6, 0
	adds r3, r5, 0
	bl CreateEggShardSprite
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043970: .4byte gEggShardVelocities
_08043974: .4byte gUnknown_0300481C
	thumb_func_end CreateRandomEggShardSprite

	thumb_func_start CreateEggShardSprite
CreateEggShardSprite: @ 8043978
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x1C]
	mov r9, r0
	ldr r1, [sp, 0x20]
	mov r10, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _080439F0
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x4
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080439F4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x30]
	mov r1, r8
	strh r1, [r0, 0x32]
	mov r1, r9
	strh r1, [r0, 0x34]
	mov r1, r10
	bl StartSpriteAnim
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080439F0: .4byte gSpriteTemplate_820A418
_080439F4: .4byte gSprites
	thumb_func_end CreateEggShardSprite

	thumb_func_start EggHatchPrintMessage1
EggHatchPrintMessage1: @ 80439F8
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08043A1C
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08043A1C: .4byte gUnknown_0300481C
	thumb_func_end EggHatchPrintMessage1

	thumb_func_start EggHatchPrintMessage2
EggHatchPrintMessage2: @ 8043A20
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08043A44
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x8
	adds r2, 0x38
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08043A44: .4byte gUnknown_0300481C
	thumb_func_end EggHatchPrintMessage2

	thumb_func_start EggHatchUpdateWindowText
EggHatchUpdateWindowText: @ 8043A48
	push {lr}
	ldr r0, _08043A5C
	ldr r0, [r0]
	adds r0, 0x8
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08043A5C: .4byte gUnknown_0300481C
	thumb_func_end EggHatchUpdateWindowText

	.align 2, 0 @ Don't pad with nop.
