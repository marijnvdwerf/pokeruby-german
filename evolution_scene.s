	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CB2_BeginEvolutionScene
CB2_BeginEvolutionScene: @ 8111C8C
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end CB2_BeginEvolutionScene

	thumb_func_start Task_BeginEvolutionScene
Task_BeginEvolutionScene: @ 8111C9C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	movs r7, 0
	ldr r1, _08111CC0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08111CC4
	cmp r0, 0x1
	beq _08111CDC
	b _08111D10
	.align 2, 0
_08111CC0: .4byte gTasks
_08111CC4:
	movs r0, 0x1
	negs r0, r0
	str r7, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08111D10
_08111CDC:
	ldr r0, _08111D18
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08111D10
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 16
	orrs r7, r0
	ldrh r5, [r4, 0x10]
	ldrb r6, [r4, 0x12]
	ldrh r4, [r4, 0x20]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r2, 0
	bl DestroyTask
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl EvolutionScene
_08111D10:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111D18: .4byte gPaletteFade
	thumb_func_end Task_BeginEvolutionScene

	thumb_func_start BeginEvolutionScene
BeginEvolutionScene: @ 8111D1C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08111D70
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08111D74
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0xA]
	mov r0, r8
	lsrs r0, 16
	strh r0, [r1, 0xC]
	strh r4, [r1, 0x10]
	strh r5, [r1, 0x12]
	strh r6, [r1, 0x20]
	ldr r0, _08111D78
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111D70: .4byte Task_BeginEvolutionScene
_08111D74: .4byte gTasks
_08111D78: .4byte CB2_BeginEvolutionScene
	thumb_func_end BeginEvolutionScene

	thumb_func_start EvolutionScene
EvolutionScene: @ 8111D7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r0, [sp, 0x20]
	mov r10, r1
	mov r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x24]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x28]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r5, 0
	str r5, [sp, 0x1C]
	add r0, sp, 0x1C
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08112008
	bl CpuSet
	ldr r0, _0811200C
	strh r5, [r0]
	subs r0, 0xC
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r4, _08112010
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08112014
	strh r5, [r0]
	ldr r0, _08112018
	strh r5, [r0]
	ldr r0, _0811201C
	strh r5, [r0]
	ldr r0, _08112020
	strh r5, [r0]
	ldr r0, _08112024
	strh r5, [r0]
	ldr r0, _08112028
	strh r5, [r0]
	ldr r1, _0811202C
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08112030
	strh r5, [r0]
	ldr r0, _08112034
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _08112038
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl remove_some_task
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r0, _0811203C
	movs r3, 0x4
	strb r3, [r0]
	ldr r0, [sp, 0x20]
	movs r1, 0x2
	add r2, sp, 0x8
	bl GetMonData
	ldr r0, _08112040
	add r1, sp, 0x8
	bl StringCopy10
	ldr r0, _08112044
	movs r1, 0xB
	mov r4, r10
	muls r4, r1
	adds r1, r4, 0
	ldr r2, _08112048
	adds r1, r2
	bl StringCopy
	ldr r0, [sp, 0x20]
	movs r1, 0xB
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [sp, 0x20]
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x2C]
	ldr r0, [sp, 0x20]
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x30]
	lsls r0, r6, 3
	ldr r1, _0811204C
	adds r0, r1
	lsls r2, r6, 2
	ldr r3, _08112050
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _08112054
	ldr r3, [r4, 0x4]
	str r3, [sp]
	str r6, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 18
	bl DecompressPicFromTable_2
	adds r0, r6, 0
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x30]
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08112058
	mov r9, r0
	ldr r1, _0811205C
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r3, _08112060
	strb r0, [r3]
	ldr r7, _08112064
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	movs r4, 0x1C
	adds r4, r7
	mov r8, r4
	adds r0, r1, r4
	ldr r2, _08112068
	str r2, [r0]
	adds r1, r7
	ldrb r2, [r1, 0x5]
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	mov r1, r10
	lsls r0, r1, 3
	ldr r2, _0811204C
	adds r0, r2
	lsls r2, r1, 2
	ldr r3, _08112050
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	str r2, [sp, 0x34]
	ldr r2, _08112054
	ldr r2, [r2, 0xC]
	str r2, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	ldr r2, [sp, 0x34]
	movs r3, 0x80
	lsls r3, 18
	bl DecompressPicFromTable_2
	mov r0, r10
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x30]
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r0, r10
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811205C
	mov r1, r9
	str r0, [r1, 0x10]
	mov r0, r9
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r3, _08112060
	strb r0, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r8, r1
	ldr r0, _08112068
	mov r2, r8
	str r0, [r2]
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r4, r0
	movs r0, 0x20
	orrs r4, r0
	strb r4, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	bl sub_8149954
	ldr r0, _0811206C
	movs r1, 0
	bl CreateTask
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r4, _08112060
	strb r0, [r4, 0x2]
	ldr r1, _08112070
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xE]
	mov r1, r10
	strh r1, [r0, 0x10]
	mov r2, sp
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0xA]
	ldr r3, [sp, 0x20]
	lsrs r1, r3, 16
	strh r1, [r0, 0xC]
	mov r4, sp
	ldrh r4, [r4, 0x24]
	strh r4, [r0, 0x12]
	movs r1, 0x1
	strh r1, [r0, 0x14]
	strh r5, [r0, 0x1E]
	mov r1, sp
	ldrh r1, [r1, 0x28]
	strh r1, [r0, 0x20]
	ldr r0, _08112074
	ldr r1, _08112078
	movs r2, 0x60
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0811207C
	bl SetHBlankCallback
	ldr r0, _08112080
	bl SetVBlankCallback
	bl m4aMPlayAllStop
	ldr r0, _08112084
	bl SetMainCallback2
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112008: .4byte 0x05006000
_0811200C: .4byte 0x0400004c
_08112010: .4byte gWindowConfig_81E6C58
_08112014: .4byte gUnknown_030042A4
_08112018: .4byte gUnknown_030042A0
_0811201C: .4byte gUnknown_030042C0
_08112020: .4byte gUnknown_030041B4
_08112024: .4byte gUnknown_03004288
_08112028: .4byte gUnknown_03004280
_0811202C: .4byte gUnknown_030041B0
_08112030: .4byte gUnknown_030041B8
_08112034: .4byte gUnknown_03004210
_08112038: .4byte gUnknown_0300428C
_0811203C: .4byte gReservedSpritePaletteCount
_08112040: .4byte gStringVar1
_08112044: .4byte gStringVar2
_08112048: .4byte gSpeciesNames
_0811204C: .4byte gMonFrontPicTable
_08112050: .4byte gMonFrontPicCoords
_08112054: .4byte gUnknown_081FAF4C
_08112058: .4byte gUnknown_02024E8C
_0811205C: .4byte gDummySpriteAffineAnimTable
_08112060: .4byte 0x02014800
_08112064: .4byte gSprites
_08112068: .4byte nullsub_37
_0811206C: .4byte Task_EvolutionScene
_08112070: .4byte gTasks
_08112074: .4byte 0x02009000
_08112078: .4byte 0x0202eb08
_0811207C: .4byte HBlankCB_EvolutionScene
_08112080: .4byte VBlankCB_EvolutionScene
_08112084: .4byte CB2_EvolutionSceneUpdate_0
	thumb_func_end EvolutionScene

	thumb_func_start CB2_EvolutionSceneLoadGraphics
CB2_EvolutionSceneLoadGraphics: @ 8112088
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	ldr r2, _0811220C
	ldr r0, _08112210
	mov r9, r0
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	adds r4, r2, 0
	muls r4, r1
	ldr r1, _08112214
	adds r4, r1
	ldrh r6, [r0, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08112218
	add r0, sp, 0x8
	bl CpuSet
	ldr r0, _0811221C
	strh r5, [r0]
	subs r0, 0xC
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r4, _08112220
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08112224
	strh r5, [r0]
	ldr r0, _08112228
	strh r5, [r0]
	ldr r0, _0811222C
	strh r5, [r0]
	ldr r0, _08112230
	strh r5, [r0]
	ldr r0, _08112234
	strh r5, [r0]
	ldr r0, _08112238
	strh r5, [r0]
	ldr r1, _0811223C
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08112240
	strh r5, [r0]
	ldr r0, _08112244
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _08112248
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0811224C
	movs r0, 0x4
	strb r0, [r1]
	lsls r0, r6, 3
	ldr r1, _08112250
	adds r0, r1
	ldr r1, _08112254
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08112258
	ldr r4, [r4, 0xC]
	str r4, [sp]
	str r6, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r6, 0
	mov r1, r10
	mov r2, r8
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811225C
	ldr r1, _08112260
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r2, r0, 24
	lsrs r2, 24
	mov r1, r9
	strb r0, [r1, 0x1]
	ldr r3, _08112264
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08112268
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0811226C
	bl SetHBlankCallback
	ldr r0, _08112270
	bl SetVBlankCallback
	ldr r0, _08112274
	bl SetMainCallback2
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811220C: .4byte gTasks
_08112210: .4byte 0x02014800
_08112214: .4byte gPlayerParty
_08112218: .4byte 0x05006000
_0811221C: .4byte 0x0400004c
_08112220: .4byte gWindowConfig_81E6C58
_08112224: .4byte gUnknown_030042A4
_08112228: .4byte gUnknown_030042A0
_0811222C: .4byte gUnknown_030042C0
_08112230: .4byte gUnknown_030041B4
_08112234: .4byte gUnknown_03004288
_08112238: .4byte gUnknown_03004280
_0811223C: .4byte gUnknown_030041B0
_08112240: .4byte gUnknown_030041B8
_08112244: .4byte gUnknown_03004210
_08112248: .4byte gUnknown_0300428C
_0811224C: .4byte gReservedSpritePaletteCount
_08112250: .4byte gMonFrontPicTable
_08112254: .4byte gMonFrontPicCoords
_08112258: .4byte gUnknown_081FAF4C
_0811225C: .4byte gUnknown_02024E8C
_08112260: .4byte gDummySpriteAffineAnimTable
_08112264: .4byte gSprites
_08112268: .4byte nullsub_37
_0811226C: .4byte HBlankCB_EvolutionScene
_08112270: .4byte VBlankCB_EvolutionScene
_08112274: .4byte CB2_EvolutionSceneUpdate_0
	thumb_func_end CB2_EvolutionSceneLoadGraphics

	thumb_func_start CB2_TradeEvolutionSceneLoadGraphics
CB2_TradeEvolutionSceneLoadGraphics: @ 8112278
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r2, _081122B0
	ldr r0, _081122B4
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	muls r2, r1
	ldr r1, _081122B8
	adds r4, r2, r1
	ldrh r7, [r0, 0x10]
	ldr r0, _081122BC
	ldr r2, _081122C0
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _081122A6
	b _081124CE
_081122A6:
	lsls r0, 2
	ldr r1, _081122C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081122B0: .4byte gTasks
_081122B4: .4byte 0x02014800
_081122B8: .4byte gPlayerParty
_081122BC: .4byte gMain
_081122C0: .4byte 0x0000043c
_081122C4: .4byte _081122C8
	.align 2, 0
_081122C8:
	.4byte _081122E4
	.4byte _08112360
	.4byte _08112380
	.4byte _081123D4
	.4byte _081123DA
	.4byte _08112440
	.4byte _081124AC
_081122E4:
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08112334
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _08112338
	strh r4, [r0]
	ldr r0, _0811233C
	strh r4, [r0]
	ldr r0, _08112340
	strh r4, [r0]
	ldr r0, _08112344
	strh r4, [r0]
	ldr r0, _08112348
	strh r4, [r0]
	ldr r0, _0811234C
	strh r4, [r0]
	ldr r1, _08112350
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08112354
	strh r4, [r0]
	ldr r1, _08112358
	ldr r0, _0811235C
	adds r1, r0
	b _08112486
	.align 2, 0
_08112334: .4byte gReservedSpritePaletteCount
_08112338: .4byte gUnknown_030042A4
_0811233C: .4byte gUnknown_030042A0
_08112340: .4byte gUnknown_030042C0
_08112344: .4byte gUnknown_030041B4
_08112348: .4byte gUnknown_03004288
_0811234C: .4byte gUnknown_03004280
_08112350: .4byte gUnknown_030041B0
_08112354: .4byte gUnknown_030041B8
_08112358: .4byte gMain
_0811235C: .4byte 0x0000043c
_08112360:
	ldr r4, _08112378
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _0811237C
	ldr r0, [r0]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	b _08112480
	.align 2, 0
_08112378: .4byte gWindowConfig_81E6F84
_0811237C: .4byte gUnknown_03004828
_08112380:
	ldr r4, _081123C0
	ldr r0, [r4]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r4]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl ResetPaletteFade
	ldr r1, _081123C4
	ldr r0, _081123C8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _081123CC
	bl SetHBlankCallback
	ldr r0, _081123D0
	bl SetVBlankCallback
	b _081124CE
	.align 2, 0
_081123C0: .4byte gUnknown_03004828
_081123C4: .4byte gMain
_081123C8: .4byte 0x0000043c
_081123CC: .4byte HBlankCB_EvolutionScene
_081123D0: .4byte VBlankCB_TradeEvolutionScene
_081123D4:
	bl sub_804E22C
	b _08112480
_081123DA:
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r0, r7, 3
	ldr r1, _0811242C
	adds r0, r1
	ldr r1, _08112430
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08112434
	ldr r4, [r4, 0xC]
	str r4, [sp]
	str r7, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _08112438
	ldr r0, _0811243C
	adds r1, r0
	b _08112486
	.align 2, 0
_0811242C: .4byte gMonFrontPicTable
_08112430: .4byte gMonFrontPicCoords
_08112434: .4byte gUnknown_081FAF4C
_08112438: .4byte gMain
_0811243C: .4byte 0x0000043c
_08112440:
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08112490
	ldr r1, _08112494
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	ldr r1, _08112498
	lsls r2, r0, 24
	lsrs r2, 24
	strb r0, [r1, 0x1]
	ldr r3, _0811249C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _081124A0
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
_08112480:
	ldr r1, _081124A4
	ldr r2, _081124A8
	adds r1, r2
_08112486:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081124CE
	.align 2, 0
_08112490: .4byte gUnknown_02024E8C
_08112494: .4byte gDummySpriteAffineAnimTable
_08112498: .4byte 0x02014800
_0811249C: .4byte gSprites
_081124A0: .4byte nullsub_37
_081124A4: .4byte gMain
_081124A8: .4byte 0x0000043c
_081124AC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081124D8
	bl SetMainCallback2
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
_081124CE:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081124D8: .4byte CB2_EvolutionSceneUpdate_1
	thumb_func_end CB2_TradeEvolutionSceneLoadGraphics

	thumb_func_start TradeEvolutionScene
TradeEvolutionScene: @ 81124DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x1C]
	adds r5, r1, 0
	adds r4, r2, 0
	mov r10, r3
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp, 0x1C]
	movs r1, 0x2
	add r2, sp, 0x8
	bl GetMonData
	ldr r0, _0811262C
	add r1, sp, 0x8
	bl StringCopy10
	ldr r0, _08112630
	movs r1, 0xB
	muls r1, r5
	ldr r2, _08112634
	adds r1, r2
	bl StringCopy
	ldr r1, _08112638
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [sp, 0x1C]
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r0, [sp, 0x1C]
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [sp, 0x1C]
	movs r1, 0x1
	bl GetMonData
	adds r7, r0, 0
	ldr r2, _0811263C
	mov r9, r2
	strb r4, [r2]
	lsls r0, r5, 3
	ldr r1, _08112640
	adds r0, r1
	ldr r1, _08112644
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08112648
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811264C
	ldr r1, _08112650
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	mov r1, r9
	strb r0, [r1, 0x1]
	ldr r3, _08112654
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08112658
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bl sub_8149954
	ldr r0, _0811265C
	movs r1, 0
	bl CreateTask
	lsls r1, r0, 24
	lsrs r2, r1, 24
	mov r1, r9
	strb r0, [r1, 0x2]
	ldr r1, _08112660
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r2, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r0, 0xA]
	ldr r1, [sp, 0x1C]
	lsrs r1, 16
	str r1, [sp, 0x20]
	strh r1, [r0, 0xC]
	movs r1, 0x1
	strh r1, [r0, 0x14]
	movs r1, 0
	strh r1, [r0, 0x1E]
	mov r2, r10
	strh r2, [r0, 0x20]
	ldr r0, _08112664
	bl SetMainCallback2
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811262C: .4byte gStringVar1
_08112630: .4byte gStringVar2
_08112634: .4byte gSpeciesNames
_08112638: .4byte gAffineAnimsDisabled
_0811263C: .4byte 0x02014800
_08112640: .4byte gMonFrontPicTable
_08112644: .4byte gMonFrontPicCoords
_08112648: .4byte gUnknown_081FAF4C
_0811264C: .4byte gUnknown_02024E8C
_08112650: .4byte gDummySpriteAffineAnimTable
_08112654: .4byte gSprites
_08112658: .4byte nullsub_37
_0811265C: .4byte Task_TradeEvolutionScene
_08112660: .4byte gTasks
_08112664: .4byte CB2_EvolutionSceneUpdate_1
	thumb_func_end TradeEvolutionScene

	thumb_func_start CB2_EvolutionSceneUpdate_0
CB2_EvolutionSceneUpdate_0: @ 8112668
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08112684
	bl sub_800374C
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_08112684: .4byte gUnknown_03004210
	thumb_func_end CB2_EvolutionSceneUpdate_0

	thumb_func_start CB2_EvolutionSceneUpdate_1
CB2_EvolutionSceneUpdate_1: @ 8112688
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _081126A8
	ldr r0, [r0]
	adds r0, 0x4
	bl sub_80035AC
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_081126A8: .4byte gUnknown_03004828
	thumb_func_end CB2_EvolutionSceneUpdate_1

	thumb_func_start CreateShedinja
CreateShedinja: @ 81126AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0
	str r0, [sp]
	ldr r0, _081127EC
	mov r8, r0
	lsls r1, r7, 2
	mov r9, r1
	adds r0, r1, r7
	lsls r4, r0, 3
	mov r0, r8
	adds r6, r4, r0
	ldrh r0, [r6]
	cmp r0, 0xD
	beq _081126DA
	b _081127DA
_081126DA:
	ldr r1, _081127F0
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _081127DA
	adds r1, r0, 0
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081127F4
	adds r5, r1, r0
	adds r0, r5, 0
	mov r1, r10
	movs r2, 0x64
	bl CopyMon
	mov r1, r8
	adds r2, r1, r4
	adds r2, 0xC
	adds r0, r5, 0
	movs r1, 0xB
	bl SetMonData
	ldrh r1, [r6, 0xC]
	movs r0, 0xB
	adds r2, r1, 0
	muls r2, r0
	ldr r0, _081127F8
	adds r2, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xA
	mov r2, sp
	bl SetMonData
	movs r4, 0x32
	mov r6, r9
_0811273A:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x36
	ble _0811273A
	movs r4, 0x43
_0811274C:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x4F
	ble _0811274C
	adds r0, r5, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x40
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	bl CalculatePlayerPartyCount
	ldr r0, _081127EC
	adds r4, r6, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _081127FC
	cmp r0, r1
	bne _081127DA
	adds r0, r5, 0
	movs r1, 0x3
	bl GetMonData
	cmp r0, 0x1
	bne _081127DA
	mov r0, r10
	movs r1, 0xB
	bl GetMonData
	movs r1, 0x97
	lsls r1, 1
	cmp r0, r1
	bne _081127DA
	ldr r2, _08112800
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
_081127DA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081127EC: .4byte gEvolutionTable
_081127F0: .4byte gPlayerPartyCount
_081127F4: .4byte gPlayerParty
_081127F8: .4byte gSpeciesNames
_081127FC: .4byte 0x0000012f
_08112800: .4byte gUnknown_083F868C
	thumb_func_end CreateShedinja

	thumb_func_start Task_EvolutionScene
Task_EvolutionScene: @ 8112804
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08112888
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	mov r9, r0
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r0, 16
	mov r1, r9
	orrs r1, r0
	mov r9, r1
	ldr r0, _0811288C
	ldrh r1, [r0, 0x2C]
	adds r6, r2, 0
	adds r4, r0, 0
	cmp r1, 0x2
	bne _08112866
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	cmp r0, 0x8
	bne _08112866
	ldrh r1, [r3, 0x12]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08112866
	movs r0, 0x10
	strh r0, [r3, 0x8]
	ldr r0, _08112890
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112866
	strh r2, [r1, 0x18]
_08112866:
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r0, r6
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	mov r8, r1
	cmp r0, 0x15
	bls _0811287C
	bl _081133C8
_0811287C:
	lsls r0, 2
	ldr r1, _08112894
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112888: .4byte gTasks
_0811288C: .4byte gMain
_08112890: .4byte gUnknown_02024D1E
_08112894: .4byte _08112898
	.align 2, 0
_08112898:
	.4byte _081128F0
	.4byte _08112934
	.4byte _08112980
	.4byte _0811298C
	.4byte _081129B4
	.4byte _081129F4
	.4byte _08112A28
	.4byte _08112A64
	.4byte _08112A98
	.4byte _08112AD8
	.4byte _08112AF4
	.4byte _08112B20
	.4byte _08112B4C
	.4byte _08112B98
	.4byte _08112C44
	.4byte _08112CDC
	.4byte _08112D2C
	.4byte _08112D6C
	.4byte _08112D98
	.4byte _08112DE0
	.4byte _08112E44
	.4byte _08112E80
_081128F0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08112928
	ldr r0, _0811292C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08112930
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112E26
	.align 2, 0
_08112928: .4byte gSprites
_0811292C: .4byte 0x02014800
_08112930: .4byte gTasks
_08112934:
	ldr r0, _0811296C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112944
	bl _081133C8
_08112944:
	ldr r4, _08112970
	ldr r1, _08112974
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112978
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _0811297C
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112E26
	.align 2, 0
_0811296C: .4byte gPaletteFade
_08112970: .4byte gStringVar4
_08112974: .4byte gUnknown_08400C4A
_08112978: .4byte gUnknown_03004210
_0811297C: .4byte gTasks
_08112980:
	ldr r0, _08112988
	ldrh r0, [r0, 0x16]
	b _08112D74
	.align 2, 0
_08112988: .4byte gUnknown_03004210
_0811298C:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _0811299A
	bl _081133C8
_0811299A:
	movs r0, 0xBC
	lsls r0, 1
	bl PlaySE
	ldr r0, _081129B0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112E26
	.align 2, 0
_081129B0: .4byte gTasks
_081129B4:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _081129C4
	bl _081133C8
_081129C4:
	ldr r0, _081129EC
	bl PlayNewMapMusic
	ldr r0, _081129F0
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r4, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _081133C8
	.align 2, 0
_081129EC: .4byte 0x00000179
_081129F0: .4byte gTasks
_081129F4:
	ldr r0, _08112A1C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112A04
	bl _081133C8
_08112A04:
	movs r0, 0x11
	bl sub_8149970
	ldr r1, _08112A20
	strb r0, [r1, 0x2]
	ldr r0, _08112A24
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112E26
	.align 2, 0
_08112A1C: .4byte gPaletteFade
_08112A20: .4byte gUnknown_02024D1E
_08112A24: .4byte gTasks
_08112A28:
	ldr r4, _08112A5C
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112A3E
	bl _081133C8
_08112A3E:
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r6
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _08112A60
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_8149A90
	strb r0, [r4, 0x2]
	bl _081133C8
	.align 2, 0
_08112A5C: .4byte gUnknown_02024D1E
_08112A60: .4byte 0x02014800
_08112A64:
	ldr r4, _08112A90
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112A7A
	bl _081133C8
_08112A7A:
	ldr r1, _08112A94
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8149E7C
	strb r0, [r4, 0x2]
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	adds r1, r6
	b _08112E26
	.align 2, 0
_08112A90: .4byte gUnknown_02024D1E
_08112A94: .4byte 0x02014800
_08112A98:
	ldr r1, _08112AD0
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _08112AAA
	bl _081133C8
_08112AAA:
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _08112AD4
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08112AC4
	bl _081133C8
_08112AC4:
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r6
	b _08112E26
	.align 2, 0
_08112AD0: .4byte 0x02014800
_08112AD4: .4byte gUnknown_02024D1E
_08112AD8:
	bl sub_8149B44
	ldr r1, _08112AEC
	strb r0, [r1, 0x2]
	ldr r0, _08112AF0
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112E26
	.align 2, 0
_08112AEC: .4byte gUnknown_02024D1E
_08112AF0: .4byte gTasks
_08112AF4:
	ldr r5, _08112B1C
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112B0A
	bl _081133C8
_08112B0A:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x10]
	bl sub_8149C20
	strb r0, [r5, 0x2]
	b _08112D8A
	.align 2, 0
_08112B1C: .4byte gUnknown_02024D1E
_08112B20:
	ldr r0, _08112B48
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08112B36
	bl _081133C8
_08112B36:
	movs r0, 0x21
	bl PlaySE
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r6
	b _08112E26
	.align 2, 0
_08112B48: .4byte gUnknown_02024D1E
_08112B4C:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112B5A
	bl _081133C8
_08112B5A:
	bl m4aMPlayAllStop
	ldr r0, _08112B8C
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x10]
	movs r1, 0
	bl PlayCry1
	ldr r0, _08112B90
	ldr r1, _08112B94
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1C
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08112D8A
	.align 2, 0
_08112B8C: .4byte gTasks
_08112B90: .4byte 0x0202eb08
_08112B94: .4byte 0x02009000
_08112B98:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _08112BA6
	bl _081133C8
_08112BA6:
	ldr r0, _08112C2C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112BB6
	bl _081133C8
_08112BB6:
	ldr r4, _08112C30
	ldr r1, _08112C34
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112C38
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112C3C
	bl PlayBGM
	ldr r2, _08112C40
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0x10
	mov r0, r9
	movs r1, 0xB
	bl SetMonData
	mov r0, r9
	bl CalculateMonStats
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	mov r0, r9
	bl sub_803FB68
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	movs r0, 0xE
	bl sav12_xor_increment
	b _081133C8
	.align 2, 0
_08112C2C: .4byte gPaletteFade
_08112C30: .4byte gStringVar4
_08112C34: .4byte gUnknown_08400C60
_08112C38: .4byte gUnknown_03004210
_08112C3C: .4byte 0x00000173
_08112C40: .4byte gTasks
_08112C44:
	ldr r0, _08112C9C
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112C4E
	b _081133C8
_08112C4E:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r5, r0, r6
	ldrb r1, [r5, 0x14]
	mov r0, r9
	bl sub_803B7C8
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _08112CBC
	movs r2, 0x1E
	ldrsh r4, [r5, r2]
	cmp r4, 0
	bne _08112CBC
	bl sub_8053E90
	ldrh r1, [r5, 0x12]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0x12]
	strh r4, [r5, 0x14]
	strh r4, [r5, 0x18]
	mov r0, r9
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _08112CA0
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _08112CA4
	cmp r6, r0
	bne _08112CA8
	movs r0, 0x15
	strh r0, [r5, 0x8]
	b _081133C8
	.align 2, 0
_08112C9C: .4byte gUnknown_03004210
_08112CA0: .4byte gUnknown_030041C0
_08112CA4: .4byte 0x0000ffff
_08112CA8:
	ldr r0, _08112CB8
	cmp r6, r0
	bne _08112CB0
	b _081133C8
_08112CB0:
	movs r0, 0x13
	strh r0, [r5, 0x8]
	b _081133C8
	.align 2, 0
_08112CB8: .4byte 0x0000fffe
_08112CBC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08112CD8
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112E26
	.align 2, 0
_08112CD8: .4byte gTasks
_08112CDC:
	ldr r0, _08112D24
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08112CEC
	b _081133C8
_08112CEC:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0x12]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08112D02
	bl sub_8053E90
_08112D02:
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08112D12
	ldrh r0, [r4, 0xE]
	mov r1, r9
	bl CreateShedinja
_08112D12:
	adds r0, r7, 0
	bl DestroyTask
	ldr r0, _08112D28
	ldr r0, [r0]
	bl SetMainCallback2
	b _081133C8
	.align 2, 0
_08112D24: .4byte gPaletteFade
_08112D28: .4byte gUnknown_03005E94
_08112D2C:
	ldr r0, _08112D60
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08112D40
	b _081133C8
_08112D40:
	bl m4aMPlayAllStop
	ldr r0, _08112D64
	ldr r1, _08112D68
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r6
	b _08112E26
	.align 2, 0
_08112D60: .4byte gUnknown_02024D1E
_08112D64: .4byte 0x0006001c
_08112D68: .4byte 0x00007fff
_08112D6C:
	ldr r0, _08112D94
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
_08112D74:
	cmp r0, 0
	beq _08112D7A
	b _081133C8
_08112D7A:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0xE]
	movs r1, 0
	bl PlayCry1
_08112D8A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _081133C8
	.align 2, 0
_08112D94: .4byte gPaletteFade
_08112D98:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _08112DA4
	b _081133C8
_08112DA4:
	ldr r4, _08112DD0
	ldr r1, _08112DD4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112DD8
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112DDC
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x1E]
	b _08113392
	.align 2, 0
_08112DD0: .4byte gStringVar4
_08112DD4: .4byte gUnknown_08400C8D
_08112DD8: .4byte gUnknown_03004210
_08112DDC: .4byte gTasks
_08112DE0:
	ldr r4, _08112E30
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112DEA
	b _081133C8
_08112DEA:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112DF6
	b _081133C8
_08112DF6:
	bl sub_8024CEC
	ldr r0, _08112E34
	bl PlayFanfare
	ldr r0, _08112E38
	ldr r0, [r0, 0xC]
	bl get_battle_strings_
	ldr r1, _08112E3C
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112E40
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x14]
_08112E26:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _081133C8
	.align 2, 0
_08112E30: .4byte gUnknown_03004210
_08112E34: .4byte 0x0000016f
_08112E38: .4byte gUnknown_08400F8C
_08112E3C: .4byte gUnknown_020238CC
_08112E40: .4byte gTasks
_08112E44:
	ldr r0, _08112E78
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112E4E
	b _081133C8
_08112E4E:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112E5A
	b _081133C8
_08112E5A:
	ldr r0, _08112E7C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	subs r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	cmp r0, 0
	beq _08112E72
	b _081133C8
_08112E72:
	movs r0, 0xE
	strh r0, [r1, 0x8]
	b _081133C8
	.align 2, 0
_08112E78: .4byte gUnknown_03004210
_08112E7C: .4byte gTasks
_08112E80:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r6
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0xB
	bls _08112E92
	b _081133C8
_08112E92:
	lsls r0, 2
	ldr r1, _08112E9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112E9C: .4byte _08112EA0
	.align 2, 0
_08112EA0:
	.4byte _08112ED0
	.4byte _08112F24
	.4byte _08112F74
	.4byte _08112FB8
	.4byte _08113004
	.4byte _08113134
	.4byte _08113184
	.4byte _08113290
	.4byte _081132E0
	.4byte _08113330
	.4byte _08113370
	.4byte _081133A8
_08112ED0:
	ldr r4, _08112F14
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112EDA
	b _081133C8
_08112EDA:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112EE6
	b _081133C8
_08112EE6:
	bl sub_8024CEC
	ldr r0, _08112F18
	ldr r0, [r0, 0x10]
	bl get_battle_strings_
	ldr r1, _08112F1C
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112F20
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _081133C6
	.align 2, 0
_08112F14: .4byte gUnknown_03004210
_08112F18: .4byte gUnknown_08400F8C
_08112F1C: .4byte gUnknown_020238CC
_08112F20: .4byte gTasks
_08112F24:
	ldr r4, _08112F64
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112F2E
	b _081133C8
_08112F2E:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112F3A
	b _081133C8
_08112F3A:
	ldr r0, _08112F68
	ldr r0, [r0, 0x14]
	bl get_battle_strings_
	ldr r1, _08112F6C
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112F70
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _081133C6
	.align 2, 0
_08112F64: .4byte gUnknown_03004210
_08112F68: .4byte gUnknown_08400F8C
_08112F6C: .4byte gUnknown_020238CC
_08112F70: .4byte gTasks
_08112F74:
	ldr r4, _08112FF0
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112F7E
	b _081133C8
_08112F7E:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112FB8
	ldr r0, _08112FF4
	ldr r0, [r0, 0x18]
	bl get_battle_strings_
	ldr r1, _08112FF8
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112FFC
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x1A]
	movs r0, 0x9
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
_08112FB8:
	ldr r0, _08112FF0
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112FC2
	b _081133C8
_08112FC2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112FCE
	b _081133C8
_08112FCE:
	bl sub_8023A80
	ldr r0, _08112FFC
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x18]
	ldr r0, _08113000
	strb r2, [r0, 0x1]
	bl sub_802BC6C
	b _081133C8
	.align 2, 0
_08112FF0: .4byte gUnknown_03004210
_08112FF4: .4byte gUnknown_08400F8C
_08112FF8: .4byte gUnknown_020238CC
_08112FFC: .4byte gTasks
_08113000: .4byte gUnknown_02024D1E
_08113004:
	ldr r0, _0811309C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811302A
	ldr r4, _081130A0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0811302A
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_0811302A:
	ldr r0, _0811309C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113050
	ldr r4, _081130A0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08113050
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08113050:
	ldr r0, _0811309C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081130DA
	bl sub_8023AD8
	ldr r0, _081130A4
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _081130A8
	ldr r1, _081130AC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081130A0
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _081130B4
	ldr r0, _081130B0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x18]
	b _081130DA
	.align 2, 0
_0811309C: .4byte gMain
_081130A0: .4byte gUnknown_02024D1E
_081130A4: .4byte gUnknown_08400F8C
_081130A8: .4byte gUnknown_03004210
_081130AC: .4byte gUnknown_020238CC
_081130B0: .4byte gTasks
_081130B4:
	ldr r0, _08113120
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _081130DA
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_081130DA:
	ldr r0, _08113124
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081130E8
	b _081133C8
_081130E8:
	bl sub_8023AD8
	ldr r0, _08113128
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _0811312C
	ldr r1, _08113130
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08113120
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	strh r1, [r0, 0x18]
	b _081133C8
	.align 2, 0
_08113120: .4byte gTasks
_08113124: .4byte gMain
_08113128: .4byte gUnknown_08400F8C
_0811312C: .4byte gUnknown_03004210
_08113130: .4byte gUnknown_020238CC
_08113134:
	ldr r0, _08113170
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113142
	b _081133C8
_08113142:
	ldr r0, _08113174
	mov r3, r8
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r6
	ldrh r1, [r5, 0x20]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08113178
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0811317C
	ldr r4, _08113180
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldrh r0, [r5, 0x18]
	adds r0, 0x1
	strh r0, [r5, 0x18]
	b _081133C8
	.align 2, 0
_08113170: .4byte gPaletteFade
_08113174: .4byte gPlayerParty
_08113178: .4byte gPlayerPartyCount
_0811317C: .4byte CB2_EvolutionSceneLoadGraphics
_08113180: .4byte word_2024E82
_08113184:
	ldr r0, _081131B8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113192
	b _081133C8
_08113192:
	ldr r1, [r4, 0x4]
	ldr r0, _081131BC
	cmp r1, r0
	beq _0811319C
	b _081133C8
_0811319C:
	bl sub_809FA30
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _081131C4
	ldr r0, _081131C0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _081133C6
	.align 2, 0
_081131B8: .4byte gPaletteFade
_081131BC: .4byte CB2_EvolutionSceneUpdate_0
_081131C0: .4byte gTasks
_081131C4:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _0811321C
	ldr r0, _08113208
	ldr r3, _0811320C
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08113210
	ldr r1, _08113214
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113218
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x18]
	b _081133C8
	.align 2, 0
_08113208: .4byte gUnknown_08400F8C
_0811320C: .4byte 0x000004cc
_08113210: .4byte gUnknown_03004210
_08113214: .4byte gUnknown_020238CC
_08113218: .4byte gTasks
_0811321C:
	ldr r1, _08113278
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r9
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _0811327C
	ldrh r1, [r0]
	mov r0, r9
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _08113280
	movs r3, 0xCF
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08113284
	ldr r1, _08113288
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _0811328C
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _081133C6
	.align 2, 0
_08113278: .4byte gUnknown_03004290
_0811327C: .4byte word_2024E82
_08113280: .4byte gUnknown_08400F8C
_08113284: .4byte gUnknown_03004210
_08113288: .4byte gUnknown_020238CC
_0811328C: .4byte gTasks
_08113290:
	ldr r4, _081132D0
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _0811329A
	b _081133C8
_0811329A:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081132A6
	b _081133C8
_081132A6:
	ldr r0, _081132D4
	ldr r0, [r0, 0x1C]
	bl get_battle_strings_
	ldr r1, _081132D8
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081132DC
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _081133C6
	.align 2, 0
_081132D0: .4byte gUnknown_03004210
_081132D4: .4byte gUnknown_08400F8C
_081132D8: .4byte gUnknown_020238CC
_081132DC: .4byte gTasks
_081132E0:
	ldr r4, _08113320
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _081133C8
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _081133C8
	ldr r0, _08113324
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r1, _08113328
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0811332C
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x13
	strh r1, [r0, 0x8]
	b _081133C8
	.align 2, 0
_08113320: .4byte gUnknown_03004210
_08113324: .4byte gUnknown_08400F8C
_08113328: .4byte gUnknown_020238CC
_0811332C: .4byte gTasks
_08113330:
	ldr r0, _08113360
	ldr r0, [r0, 0x20]
	bl get_battle_strings_
	ldr r0, _08113364
	ldr r1, _08113368
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0811336C
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x1A]
	strh r2, [r0, 0x1C]
	movs r1, 0x3
	strh r1, [r0, 0x18]
	b _081133C8
	.align 2, 0
_08113360: .4byte gUnknown_08400F8C
_08113364: .4byte gUnknown_03004210
_08113368: .4byte gUnknown_020238CC
_0811336C: .4byte gTasks
_08113370:
	ldr r0, _08113398
	ldr r0, [r0, 0x24]
	bl get_battle_strings_
	ldr r0, _0811339C
	ldr r1, _081133A0
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081133A4
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
_08113392:
	movs r1, 0xE
	strh r1, [r0, 0x8]
	b _081133C8
	.align 2, 0
_08113398: .4byte gUnknown_08400F8C
_0811339C: .4byte gUnknown_03004210
_081133A0: .4byte gUnknown_020238CC
_081133A4: .4byte gTasks
_081133A8:
	ldr r0, _081133D8
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _081133C8
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _081133C8
	ldr r0, _081133DC
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_081133C6:
	strh r0, [r1, 0x18]
_081133C8:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081133D8: .4byte gUnknown_03004210
_081133DC: .4byte gTasks
	thumb_func_end Task_EvolutionScene

	thumb_func_start Task_TradeEvolutionScene
Task_TradeEvolutionScene: @ 81133E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08113424
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r2
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	mov r8, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	lsls r0, 16
	mov r3, r8
	orrs r3, r0
	mov r8, r3
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	adds r6, r2, 0
	cmp r0, 0x11
	bls _08113418
	bl _08113F32
_08113418:
	lsls r0, 2
	ldr r1, _08113428
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113424: .4byte gTasks
_08113428: .4byte _0811342C
	.align 2, 0
_0811342C:
	.4byte _08113474
	.4byte _081134B0
	.4byte _081134D4
	.4byte _08113504
	.4byte _08113544
	.4byte _08113584
	.4byte _081135C0
	.4byte _081135EC
	.4byte _08113624
	.4byte _08113640
	.4byte _0811366C
	.4byte _081136A0
	.4byte _081136F0
	.4byte _081137A0
	.4byte _08113864
	.4byte _08113888
	.4byte _081138F0
	.4byte _08113930
_08113474:
	ldr r4, _081134A0
	ldr r1, _081134A4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _081134A8
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081134AC
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113690
	.align 2, 0
_081134A0: .4byte gStringVar4
_081134A4: .4byte gUnknown_08400C4A
_081134A8: .4byte gUnknown_03004828
_081134AC: .4byte gTasks
_081134B0:
	ldr r0, _081134D0
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081134BE
	bl _08113F32
_081134BE:
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0xE]
	movs r1, 0
	bl PlayCry1
	b _081136DA
	.align 2, 0
_081134D0: .4byte gUnknown_03004828
_081134D4:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081134E2
	bl _08113F32
_081134E2:
	ldr r0, _081134FC
	bl m4aSongNumStop
	movs r0, 0xBC
	lsls r0, 1
	bl PlaySE
	ldr r1, _08113500
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113690
	.align 2, 0
_081134FC: .4byte 0x00000179
_08113500: .4byte gTasks
_08113504:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _08113514
	bl _08113F32
_08113514:
	ldr r0, _0811353C
	bl PlayBGM
	ldr r1, _08113540
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	str r5, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _08113F32
	.align 2, 0
_0811353C: .4byte 0x00000179
_08113540: .4byte gTasks
_08113544:
	ldr r0, _08113578
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113554
	bl _08113F32
_08113554:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x11
	bl sub_8149970
	ldr r1, _0811357C
	strb r0, [r1, 0x2]
	ldr r1, _08113580
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113690
	.align 2, 0
_08113578: .4byte gPaletteFade
_0811357C: .4byte gUnknown_02024D1E
_08113580: .4byte gTasks
_08113584:
	ldr r4, _081135B8
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0811359A
	bl _08113F32
_0811359A:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	ldr r1, _081135BC
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_8149A90
	strb r0, [r4, 0x2]
	bl _08113F32
	.align 2, 0
_081135B8: .4byte gUnknown_02024D1E
_081135BC: .4byte 0x02014800
_081135C0:
	ldr r4, _081135E4
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081135D6
	bl _08113F32
_081135D6:
	ldr r1, _081135E8
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8149E7C
	strb r0, [r4, 0x2]
	b _08113688
	.align 2, 0
_081135E4: .4byte gUnknown_02024D1E
_081135E8: .4byte 0x02014800
_081135EC:
	ldr r1, _0811361C
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _081135FE
	bl _08113F32
_081135FE:
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _08113620
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08113618
	bl _08113F32
_08113618:
	b _08113688
	.align 2, 0
_0811361C: .4byte 0x02014800
_08113620: .4byte gUnknown_02024D1E
_08113624:
	bl sub_8149B44
	ldr r1, _08113638
	strb r0, [r1, 0x2]
	ldr r1, _0811363C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113690
	.align 2, 0
_08113638: .4byte gUnknown_02024D1E
_0811363C: .4byte gTasks
_08113640:
	ldr r5, _08113668
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08113656
	bl _08113F32
_08113656:
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x10]
	bl sub_8149D5C
	strb r0, [r5, 0x2]
	b _081136DA
	.align 2, 0
_08113668: .4byte gUnknown_02024D1E
_0811366C:
	ldr r0, _0811369C
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08113682
	bl _08113F32
_08113682:
	movs r0, 0x21
	bl PlaySE
_08113688:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r6
_08113690:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	bl _08113F32
	.align 2, 0
_0811369C: .4byte gUnknown_02024D1E
_081136A0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _081136AE
	bl _08113F32
_081136AE:
	ldr r0, _081136E4
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x10]
	movs r1, 0
	bl PlayCry1
	ldr r0, _081136E8
	ldr r1, _081136EC
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_081136DA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl _08113F32
	.align 2, 0
_081136E4: .4byte gTasks
_081136E8: .4byte 0x0202eb08
_081136EC: .4byte 0x02009000
_081136F0:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081136FE
	bl _08113F32
_081136FE:
	ldr r0, _08113788
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811370E
	bl _08113F32
_0811370E:
	ldr r4, _0811378C
	ldr r1, _08113790
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08113794
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113798
	bl PlayFanfare
	ldr r2, _0811379C
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0x10
	mov r0, r8
	movs r1, 0xB
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	mov r0, r8
	bl sub_803FB68
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	movs r0, 0xE
	bl sav12_xor_increment
	b _08113F32
	.align 2, 0
_08113788: .4byte gPaletteFade
_0811378C: .4byte gStringVar4
_08113790: .4byte gUnknown_08400C60
_08113794: .4byte gUnknown_03004828
_08113798: .4byte 0x00000173
_0811379C: .4byte gTasks
_081137A0:
	ldr r0, _08113808
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081137AC
	b _08113F32
_081137AC:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081137BA
	b _08113F32
_081137BA:
	ldr r1, _0811380C
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrb r1, [r5, 0x14]
	mov r0, r8
	bl sub_803B7C8
	lsls r0, 16
	lsrs r6, r0, 16
	mov r9, r4
	cmp r6, 0
	beq _0811382C
	movs r3, 0x1E
	ldrsh r2, [r5, r3]
	cmp r2, 0
	bne _0811382C
	ldrh r1, [r5, 0x12]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x18]
	mov r0, r8
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _08113810
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _08113814
	cmp r6, r0
	bne _08113818
	movs r0, 0x11
	strh r0, [r5, 0x8]
	b _08113F32
	.align 2, 0
_08113808: .4byte gUnknown_03004828
_0811380C: .4byte gTasks
_08113810: .4byte gUnknown_030041C0
_08113814: .4byte 0x0000ffff
_08113818:
	ldr r0, _08113828
	cmp r6, r0
	bne _08113820
	b _08113F32
_08113820:
	movs r0, 0xF
	strh r0, [r5, 0x8]
	b _08113F32
	.align 2, 0
_08113828: .4byte 0x0000fffe
_0811382C:
	ldr r0, _08113854
	bl PlayBGM
	ldr r0, _08113858
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _0811385C
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113860
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _081138D4
	.align 2, 0
_08113854: .4byte 0x00000179
_08113858: .4byte gUnknown_03004828
_0811385C: .4byte gOtherText_LinkStandby2
_08113860: .4byte gTasks
_08113864:
	ldr r0, _08113880
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113870
	b _08113F32
_08113870:
	adds r0, r7, 0
	bl DestroyTask
	ldr r0, _08113884
	ldr r0, [r0]
	bl SetMainCallback2
	b _08113F32
	.align 2, 0
_08113880: .4byte gUnknown_03004828
_08113884: .4byte gUnknown_03005E94
_08113888:
	ldr r4, _081138DC
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113894
	b _08113F32
_08113894:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081138A0
	b _08113F32
_081138A0:
	bl sub_8024CEC
	ldr r0, _081138E0
	bl PlayFanfare
	ldr r0, _081138E4
	ldr r0, [r0, 0xC]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081138E8
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081138EC
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x14]
_081138D4:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08113F32
	.align 2, 0
_081138DC: .4byte gUnknown_03004828
_081138E0: .4byte 0x0000016f
_081138E4: .4byte gUnknown_08400F8C
_081138E8: .4byte gUnknown_020238CC
_081138EC: .4byte gTasks
_081138F0:
	ldr r0, _08113928
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081138FC
	b _08113F32
_081138FC:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811390A
	b _08113F32
_0811390A:
	ldr r0, _0811392C
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	subs r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	cmp r0, 0
	beq _08113922
	b _08113F32
_08113922:
	movs r0, 0xD
	strh r0, [r1, 0x8]
	b _08113F32
	.align 2, 0
_08113928: .4byte gUnknown_03004828
_0811392C: .4byte gTasks
_08113930:
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r0, r6
	movs r3, 0x18
	ldrsh r0, [r0, r3]
	mov r9, r1
	cmp r0, 0xB
	bls _08113944
	b _08113F32
_08113944:
	lsls r0, 2
	ldr r1, _08113950
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113950: .4byte _08113954
	.align 2, 0
_08113954:
	.4byte _08113984
	.4byte _081139DC
	.4byte _08113A30
	.4byte _08113A7A
	.4byte _08113B14
	.4byte _08113C74
	.4byte _08113CC4
	.4byte _08113DE0
	.4byte _08113E34
	.4byte _08113E88
	.4byte _08113ED0
	.4byte _08113F10
_08113984:
	ldr r4, _081139CC
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113990
	b _08113F32
_08113990:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0811399C
	b _08113F32
_0811399C:
	bl sub_8024CEC
	ldr r0, _081139D0
	ldr r0, [r0, 0x10]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081139D4
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081139D8
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113F30
	.align 2, 0
_081139CC: .4byte gUnknown_03004828
_081139D0: .4byte gUnknown_08400F8C
_081139D4: .4byte gUnknown_020238CC
_081139D8: .4byte gTasks
_081139DC:
	ldr r4, _08113A20
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081139E8
	b _08113F32
_081139E8:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081139F4
	b _08113F32
_081139F4:
	ldr r0, _08113A24
	ldr r0, [r0, 0x14]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113A28
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113A2C
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113F30
	.align 2, 0
_08113A20: .4byte gUnknown_03004828
_08113A24: .4byte gUnknown_08400F8C
_08113A28: .4byte gUnknown_020238CC
_08113A2C: .4byte gTasks
_08113A30:
	ldr r4, _08113AF4
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113A3C
	b _08113F32
_08113A3C:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113A7A
	ldr r0, _08113AF8
	ldr r0, [r0, 0x18]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113AFC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113B00
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x1A]
	movs r0, 0x9
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
_08113A7A:
	ldr r5, _08113AF4
	ldr r0, [r5]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113A86
	b _08113F32
_08113A86:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _08113A94
	b _08113F32
_08113A94:
	ldr r0, [r5]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl DrawTextWindow
	ldr r4, _08113B04
	strb r6, [r4, 0x1]
	ldr r2, [r5]
	adds r0, r2, 0x4
	ldr r1, _08113B08
	adds r2, 0x34
	ldrb r2, [r2]
	adds r2, 0x80
	movs r3, 0x9
	str r3, [sp]
	movs r3, 0x19
	bl InitWindow
	ldr r0, [r5]
	adds r0, 0x4
	bl sub_8002F44
	ldr r1, _08113B0C
	ldr r3, _08113B10
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	bl sub_81150D8
	ldr r0, _08113B00
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x18]
	strb r2, [r4, 0x1]
	b _08113F32
	.align 2, 0
_08113AF4: .4byte gUnknown_03004828
_08113AF8: .4byte gUnknown_08400F8C
_08113AFC: .4byte gUnknown_020238CC
_08113B00: .4byte gTasks
_08113B04: .4byte gUnknown_02024D1E
_08113B08: .4byte gOtherText_YesNoAndPlayer
_08113B0C: .4byte 0x0000ffff
_08113B10: .4byte 0x00002d9f
_08113B14:
	ldr r0, _08113BC4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08113B3A
	ldr r4, _08113BC8
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08113B3A
	movs r0, 0x5
	bl PlaySE
	bl HBlankCB_TradeEvolutionScene
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_81150D8
_08113B3A:
	ldr r0, _08113BC4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113B60
	ldr r4, _08113BC8
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08113B60
	movs r0, 0x5
	bl PlaySE
	bl HBlankCB_TradeEvolutionScene
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_81150D8
_08113B60:
	ldr r0, _08113BC4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08113C02
	ldr r4, _08113BCC
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl ZeroFillWindowRect
	bl sub_814A7FC
	ldr r0, _08113BD0
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113BD4
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08113BC8
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _08113BDC
	ldr r0, _08113BD8
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x18]
	b _08113C02
	.align 2, 0
_08113BC4: .4byte gMain
_08113BC8: .4byte gUnknown_02024D1E
_08113BCC: .4byte gUnknown_03004828
_08113BD0: .4byte gUnknown_08400F8C
_08113BD4: .4byte gUnknown_020238CC
_08113BD8: .4byte gTasks
_08113BDC:
	ldr r0, _08113C60
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08113C02
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08113C02:
	ldr r0, _08113C64
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08113C10
	b _08113F32
_08113C10:
	ldr r4, _08113C68
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl ZeroFillWindowRect
	bl sub_814A7FC
	ldr r0, _08113C6C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113C70
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08113C60
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	strh r1, [r0, 0x18]
	b _08113F32
	.align 2, 0
_08113C60: .4byte gTasks
_08113C64: .4byte gMain
_08113C68: .4byte gUnknown_03004828
_08113C6C: .4byte gUnknown_08400F8C
_08113C70: .4byte gUnknown_020238CC
_08113C74:
	ldr r0, _08113CB0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113C82
	b _08113F32
_08113C82:
	ldr r0, _08113CB4
	mov r3, r9
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r6
	ldrh r1, [r5, 0x20]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08113CB8
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08113CBC
	ldr r4, _08113CC0
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldrh r0, [r5, 0x18]
	adds r0, 0x1
	strh r0, [r5, 0x18]
	b _08113F32
	.align 2, 0
_08113CB0: .4byte gPaletteFade
_08113CB4: .4byte gPlayerParty
_08113CB8: .4byte gPlayerPartyCount
_08113CBC: .4byte CB2_TradeEvolutionSceneLoadGraphics
_08113CC0: .4byte word_2024E82
_08113CC4:
	ldr r0, _08113CF8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113CD2
	b _08113F32
_08113CD2:
	ldr r0, _08113CFC
	ldr r1, [r0, 0x4]
	ldr r0, _08113D00
	cmp r1, r0
	beq _08113CDE
	b _08113F32
_08113CDE:
	bl sub_809FA30
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _08113D08
	ldr r0, _08113D04
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _08113F30
	.align 2, 0
_08113CF8: .4byte gPaletteFade
_08113CFC: .4byte gMain
_08113D00: .4byte CB2_EvolutionSceneUpdate_1
_08113D04: .4byte gTasks
_08113D08:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _08113D68
	ldr r0, _08113D54
	ldr r3, _08113D58
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08113D5C
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113D60
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113D64
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x18]
	b _08113F32
	.align 2, 0
_08113D54: .4byte gUnknown_08400F8C
_08113D58: .4byte 0x000004cc
_08113D5C: .4byte gUnknown_03004828
_08113D60: .4byte gUnknown_020238CC
_08113D64: .4byte gTasks
_08113D68:
	ldr r1, _08113DC8
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r8
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _08113DCC
	ldrh r1, [r0]
	mov r0, r8
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _08113DD0
	movs r3, 0xCF
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08113DD4
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113DD8
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113DDC
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113F30
	.align 2, 0
_08113DC8: .4byte gUnknown_03004290
_08113DCC: .4byte word_2024E82
_08113DD0: .4byte gUnknown_08400F8C
_08113DD4: .4byte gUnknown_03004828
_08113DD8: .4byte gUnknown_020238CC
_08113DDC: .4byte gTasks
_08113DE0:
	ldr r4, _08113E24
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113DEC
	b _08113F32
_08113DEC:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08113DF8
	b _08113F32
_08113DF8:
	ldr r0, _08113E28
	ldr r0, [r0, 0x1C]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113E2C
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113E30
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113F30
	.align 2, 0
_08113E24: .4byte gUnknown_03004828
_08113E28: .4byte gUnknown_08400F8C
_08113E2C: .4byte gUnknown_020238CC
_08113E30: .4byte gTasks
_08113E34:
	ldr r4, _08113E78
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	bne _08113F32
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113F32
	ldr r0, _08113E7C
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113E80
	adds r2, 0x34
	ldrb r2, [r2]
	movs r4, 0xF
	str r4, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113E84
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _08113F32
	.align 2, 0
_08113E78: .4byte gUnknown_03004828
_08113E7C: .4byte gUnknown_08400F8C
_08113E80: .4byte gUnknown_020238CC
_08113E84: .4byte gTasks
_08113E88:
	ldr r0, _08113EC0
	ldr r0, [r0, 0x20]
	bl get_battle_strings_
	ldr r0, _08113EC4
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113EC8
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113ECC
	mov r3, r9
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x1A]
	strh r2, [r0, 0x1C]
	movs r1, 0x3
	strh r1, [r0, 0x18]
	b _08113F32
	.align 2, 0
_08113EC0: .4byte gUnknown_08400F8C
_08113EC4: .4byte gUnknown_03004828
_08113EC8: .4byte gUnknown_020238CC
_08113ECC: .4byte gTasks
_08113ED0:
	ldr r0, _08113F00
	ldr r0, [r0, 0x24]
	bl get_battle_strings_
	ldr r0, _08113F04
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113F08
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113F0C
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xD
	strh r1, [r0, 0x8]
	b _08113F32
	.align 2, 0
_08113F00: .4byte gUnknown_08400F8C
_08113F04: .4byte gUnknown_03004828
_08113F08: .4byte gUnknown_020238CC
_08113F0C: .4byte gTasks
_08113F10:
	ldr r0, _08113F40
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	bne _08113F32
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113F32
	ldr r0, _08113F44
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_08113F30:
	strh r0, [r1, 0x18]
_08113F32:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113F40: .4byte gUnknown_03004828
_08113F44: .4byte gTasks
	thumb_func_end Task_TradeEvolutionScene

	thumb_func_start unref_sub_8113B50
unref_sub_8113B50: @ 8113F48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r1, 0
	str r1, [sp, 0x10]
	movs r2, 0
	str r2, [sp, 0x8]
	ldr r3, _08114058
	mov r12, r3
	ldr r4, _0811405C
	add r4, r12
	mov r10, r4
	ldr r5, _08114060
	add r5, r12
	mov r8, r5
_08113F74:
	adds r0, r3, 0
	adds r0, 0x84
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	strb r2, [r0]
	adds r0, r3, 0x4
	adds r0, r1, r0
	strb r2, [r0]
	ldr r4, _08114064
	adds r0, r1, r4
	strb r2, [r0]
	movs r6, 0
	lsls r1, 5
	mov r9, r1
	ldr r5, [sp, 0x8]
	lsls r4, r5, 6
_08113F94:
	mov r0, r9
	adds r1, r6, r0
	ldr r5, _08114068
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r10
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r8
	adds r0, r1, r5
	strb r2, [r0]
	ldr r5, _0811406C
	adds r0, r1, r5
	strb r2, [r0]
	adds r7, r3, 0
	adds r7, 0xC4
	adds r0, r1, r7
	strb r2, [r0]
	ldr r5, _08114070
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08114074
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08114078
	adds r0, r3, r5
	adds r1, r0
	strb r2, [r1]
	lsls r1, r6, 1
	adds r1, r4
	ldr r5, _0811407C
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08114080
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08114084
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08114088
	adds r0, r3, r5
	adds r1, r0
	strh r2, [r1]
	adds r6, 0x1
	cmp r6, 0x1F
	ble _08113F94
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113F74
	ldr r1, _0811408C
	add r1, r12
	movs r0, 0x40
	strb r0, [r1]
	movs r1, 0
	mov r8, r1
	movs r2, 0
	str r2, [sp, 0x8]
	movs r3, 0x80
	lsls r3, 5
	adds r3, r7
	mov r12, r3
	movs r4, 0xC0
	lsls r4, 5
	adds r4, r7
	mov r9, r4
	movs r5, 0
	adds r4, r7, 0
	subs r4, 0xC0
_0811402A:
	movs r3, 0
	ldr r2, [sp]
	add r2, r8
	movs r6, 0
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x30]
	ldr r1, [sp, 0x8]
	lsls r1, 7
	mov r10, r1
	movs r7, 0x1
	negs r7, r7
_08114042:
	asrs r0, r6, 1
	lsls r0, 2
	add r0, r10
	ldr r1, _08114090
	adds r0, r1
	str r2, [r0]
	cmp r3, 0
	beq _08114094
	cmp r3, 0x1
	beq _081140BE
	b _081140EC
	.align 2, 0
_08114058: .4byte 0x02014800
_0811405C: .4byte 0x000018c4
_08114060: .4byte 0x000020c4
_08114064: .4byte 0x02014844
_08114068: .4byte 0x020158c4
_0811406C: .4byte 0x020170c4
_08114070: .4byte 0x000008c4
_08114074: .4byte 0x000030c4
_08114078: .4byte 0x000038c4
_0811407C: .4byte 0x000060c4
_08114080: .4byte 0x000070c4
_08114084: .4byte 0x000080c4
_08114088: .4byte 0x000090c4
_0811408C: .4byte 0x0000a0c4
_08114090: .4byte 0x020188c4
_08114094:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _081140A2
	cmp r0, 0x1
	beq _081140A8
	b _081140EC
_081140A2:
	ldrb r1, [r2]
	movs r0, 0xF
	b _081140AC
_081140A8:
	ldrb r1, [r2]
	movs r0, 0xF0
_081140AC:
	ands r0, r1
	cmp r0, 0
	beq _081140EC
	ldrb r0, [r4]
	adds r0, r5
	add r0, r12
	strb r6, [r0]
	movs r3, 0x1
	b _081140EC
_081140BE:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _081140CC
	cmp r0, 0x1
	beq _081140D2
	b _081140EC
_081140CC:
	ldrb r1, [r2]
	movs r0, 0xF
	b _081140D6
_081140D2:
	ldrb r1, [r2]
	movs r0, 0xF0
_081140D6:
	ands r0, r1
	cmp r0, 0
	bne _081140EC
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r7, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_081140EC:
	adds r0, r6, 0x1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _081140FA
	adds r2, 0x1D
	b _08114104
_081140FA:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08114104
	adds r2, 0x1
_08114104:
	adds r7, 0x1
	adds r6, 0x1
	cmp r6, 0x3F
	ble _08114042
	cmp r3, 0
	beq _0811411E
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0811411E:
	movs r0, 0x7
	ldr r2, [sp, 0x30]
	ands r2, r0
	cmp r2, 0
	bne _0811412E
	movs r3, 0xE4
	add r8, r3
	b _08114132
_0811412E:
	movs r0, 0x4
	add r8, r0
_08114132:
	adds r5, 0x20
	adds r4, 0x1
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x8]
	cmp r1, 0x3F
	bgt _08114142
	b _0811402A
_08114142:
	movs r2, 0
	mov r8, r2
	movs r3, 0
	str r3, [sp, 0x8]
	ldr r0, _0811417C
	movs r4, 0x82
	lsls r4, 6
	adds r4, r0
	mov r10, r4
	movs r5, 0xA2
	lsls r5, 6
	adds r7, r0, r5
	movs r5, 0
	adds r4, r0, 0
	movs r0, 0x1
	mov r9, r0
_08114162:
	movs r3, 0
	ldr r2, [sp, 0x4]
	add r2, r8
	movs r6, 0
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x30]
_08114170:
	cmp r3, 0
	beq _08114180
	cmp r3, 0x1
	beq _081141AC
	b _081141DC
	.align 2, 0
_0811417C: .4byte 0x02014844
_08114180:
	adds r0, r6, 0
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	beq _08114190
	cmp r0, 0x1
	beq _08114196
	b _081141DC
_08114190:
	ldrb r1, [r2]
	movs r0, 0xF
	b _0811419A
_08114196:
	ldrb r1, [r2]
	movs r0, 0xF0
_0811419A:
	ands r0, r1
	cmp r0, 0
	beq _081141DC
	ldrb r0, [r4]
	adds r0, r5
	add r0, r10
	strb r6, [r0]
	movs r3, 0x1
	b _081141DC
_081141AC:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _081141BA
	cmp r0, 0x1
	beq _081141C0
	b _081141DC
_081141BA:
	ldrb r1, [r2]
	movs r0, 0xF
	b _081141C4
_081141C0:
	ldrb r1, [r2]
	movs r0, 0xF0
_081141C4:
	ands r0, r1
	cmp r0, 0
	bne _081141DC
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	subs r1, r6, 0x1
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_081141DC:
	adds r1, r6, 0x1
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _081141EA
	adds r2, 0x1D
	b _081141F4
_081141EA:
	mov r0, r9
	ands r6, r0
	cmp r6, 0
	beq _081141F4
	adds r2, 0x1
_081141F4:
	adds r6, r1, 0
	cmp r6, 0x3F
	ble _08114170
	cmp r3, 0
	beq _0811420C
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0811420C:
	movs r0, 0x7
	ldr r1, [sp, 0x30]
	ands r1, r0
	cmp r1, 0
	bne _0811421C
	movs r2, 0xE4
	add r8, r2
	b _08114220
_0811421C:
	movs r3, 0x4
	add r8, r3
_08114220:
	adds r5, 0x20
	adds r4, 0x1
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08114162
	movs r1, 0
	str r1, [sp, 0x8]
_08114232:
	ldr r3, [sp, 0x8]
	ldr r4, _081142B4
	adds r2, r3, r4
	ldr r5, _081142B8
	adds r1, r3, r5
	ldrb r0, [r2]
	adds r3, 0x1
	str r3, [sp, 0x30]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0811424A
	b _08114396
_0811424A:
	movs r0, 0
	str r0, [sp, 0xC]
	ldrb r2, [r2]
	cmp r0, r2
	bge _0811434C
	ldr r0, _081142BC
	adds r0, 0x4
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	str r0, [sp, 0x18]
_0811425E:
	movs r2, 0x80
	lsls r2, 1
	str r2, [sp, 0x14]
	movs r6, 0
	ldr r3, [sp, 0x8]
	ldr r4, _081142B8
	adds r0, r3, r4
	ldr r5, [sp, 0xC]
	adds r5, 0x1
	str r5, [sp, 0x34]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08114336
	ldr r0, _081142BC
	mov r10, r0
	lsls r0, r3, 5
	ldr r2, [sp, 0xC]
	adds r1, r2, r0
	mov r9, r0
	ldr r0, _081142BC
	adds r0, 0xC4
	mov r3, r9
	adds r7, r3, r0
	mov r5, r9
	ldr r4, _081142BC
	ldr r2, _081142C0
	adds r0, r4, r2
	adds r1, r0
	mov r8, r1
	ldrb r3, [r1]
	str r3, [sp, 0x1C]
_0811429C:
	ldr r0, _081142C4
	add r0, r10
	adds r0, r5, r0
	ldr r4, [sp, 0x1C]
	ldrb r1, [r0]
	cmp r4, r1
	bls _081142C8
	mov r2, r8
	ldrb r1, [r2]
	ldrb r0, [r0]
	b _081142CE
	.align 2, 0
_081142B4: .4byte 0x02014804
_081142B8: .4byte 0x02014844
_081142BC: .4byte 0x02014800
_081142C0: .4byte 0x000010c4
_081142C4: .4byte 0x000020c4
_081142C8:
	ldrb r1, [r0]
	mov r3, r8
	ldrb r0, [r3]
_081142CE:
	subs r3, r1, r0
	ldr r1, [sp, 0xC]
	add r1, r9
	ldr r0, _081142F4
	add r0, r10
	adds r4, r1, r0
	ldr r0, _081142F8
	add r0, r10
	adds r2, r5, r0
	ldrb r0, [r4]
	ldr r1, _081142FC
	mov r12, r1
	ldrb r1, [r2]
	cmp r0, r1
	bls _08114300
	adds r1, r0, 0
	ldrb r0, [r2]
	b _08114304
	.align 2, 0
_081142F4: .4byte 0x000018c4
_081142F8: .4byte 0x000028c4
_081142FC: .4byte 0x02014800
_08114300:
	ldrb r1, [r2]
	ldrb r0, [r4]
_08114304:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _08114324
	ldrb r0, [r7]
	cmp r0, 0
	bne _08114324
	ldr r0, _08114448
	add r0, r12
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114324
	str r6, [sp, 0x10]
	str r3, [sp, 0x14]
_08114324:
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r3, [sp, 0x8]
	ldr r4, _0811444C
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r6, r0
	blt _0811429C
_08114336:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	ldr r5, [sp, 0x34]
	str r5, [sp, 0xC]
	ldr r0, [sp, 0x18]
	ldrb r0, [r0]
	cmp r5, r0
	blt _0811425E
_0811434C:
	movs r6, 0
	ldr r2, _08114450
	ldr r1, [sp, 0x8]
	ldr r3, _0811444C
	adds r0, r1, r3
	adds r4, r2, 0
	mov r12, r4
	ldrb r0, [r0]
	cmp r6, r0
	bge _08114396
	mov r0, r12
	adds r0, 0x44
	adds r4, r1, r0
_08114366:
	ldr r5, [sp, 0x8]
	lsls r0, r5, 5
	adds r1, r6, r0
	adds r0, r2, 0
	adds r0, 0xC4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811438C
	ldr r3, _08114448
	adds r0, r2, r3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811438C
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_811430C
_0811438C:
	adds r6, 0x1
	ldr r2, _08114450
	ldrb r5, [r4]
	cmp r6, r5
	blt _08114366
_08114396:
	ldr r0, [sp, 0x8]
	ldr r1, _08114454
	adds r2, r0, r1
	ldr r3, _0811444C
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _081143C4
	movs r6, 0
	ldrb r4, [r2]
	cmp r6, r4
	bge _081143C4
	adds r4, r2, 0
_081143B2:
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	adds r6, 0x1
	ldrb r5, [r4]
	cmp r6, r5
	blt _081143B2
_081143C4:
	ldr r0, [sp, 0x8]
	ldr r1, _08114454
	adds r2, r0, r1
	ldr r3, _0811444C
	adds r1, r0, r3
	ldrb r0, [r2]
	ldr r4, _08114450
	ldrb r5, [r1]
	cmp r0, r5
	bhi _081143DA
	b _081145BC
_081143DA:
	movs r0, 0
	str r0, [sp, 0x10]
	ldrb r1, [r1]
	cmp r0, r1
	blt _081143E6
	b _081144FC
_081143E6:
	str r2, [sp, 0x2C]
	ldr r1, [sp, 0x8]
	lsls r1, 5
	mov r9, r1
	adds r0, r4, 0
	adds r0, 0x44
	ldr r2, [sp, 0x8]
	adds r0, r2, r0
	str r0, [sp, 0x20]
	mov r3, r9
	str r3, [sp, 0x24]
_081143FC:
	movs r4, 0x80
	lsls r4, 1
	str r4, [sp, 0x14]
	movs r6, 0
	ldr r5, [sp, 0x10]
	adds r5, 0x1
	str r5, [sp, 0x38]
	ldr r0, [sp, 0x2C]
	ldrb r0, [r0]
	cmp r6, r0
	bge _081144BC
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x24]
	adds r1, r2
	mov r10, r1
	ldr r0, _08114450
	adds r0, 0xC4
	adds r2, r0
	mov r8, r2
	ldr r7, [sp, 0x24]
	ldr r3, _08114450
	ldr r4, _08114458
	adds r0, r3, r4
	adds r5, r7, r0
	ldr r0, _0811445C
	add r0, r10
	mov r12, r0
	ldrb r1, [r0]
	str r1, [sp, 0x28]
_08114436:
	ldrb r0, [r5]
	ldr r2, [sp, 0x28]
	cmp r0, r2
	bls _08114460
	adds r1, r0, 0
	mov r3, r12
	ldrb r0, [r3]
	b _08114466
	.align 2, 0
_08114448: .4byte 0x000008c4
_0811444C: .4byte 0x02014844
_08114450: .4byte 0x02014800
_08114454: .4byte 0x02014804
_08114458: .4byte 0x000010c4
_0811445C: .4byte 0x020168c4
_08114460:
	mov r4, r12
	ldrb r1, [r4]
	ldrb r0, [r5]
_08114466:
	subs r3, r1, r0
	ldr r1, _08114484
	ldr r2, _08114488
	adds r0, r1, r2
	adds r4, r7, r0
	ldr r2, _0811448C
	add r2, r10
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bls _08114490
	adds r1, r0, 0
	ldrb r0, [r2]
	b _08114494
	.align 2, 0
_08114484: .4byte 0x02014800
_08114488: .4byte 0x000018c4
_0811448C: .4byte 0x020170c4
_08114490:
	ldrb r1, [r2]
	ldrb r0, [r4]
_08114494:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _081144AA
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, 0
	bne _081144AA
	str r6, [sp, 0xC]
	str r3, [sp, 0x14]
_081144AA:
	movs r0, 0x1
	add r8, r0
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r1, [sp, 0x2C]
	ldrb r1, [r1]
	cmp r6, r1
	blt _08114436
_081144BC:
	ldr r3, [sp, 0xC]
	add r3, r9
	ldr r2, _0811455C
	ldr r4, _08114560
	adds r1, r2, r4
	adds r1, r3, r1
	ldr r2, [sp, 0x10]
	add r2, r9
	ldr r5, _08114564
	adds r0, r2, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0811455C
	ldr r4, _08114568
	adds r1, r0, r4
	adds r1, r3, r1
	ldr r5, _0811456C
	adds r2, r5
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r0, _0811455C
	adds r0, 0xC4
	adds r3, r0
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, [sp, 0x38]
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x20]
	ldrb r1, [r1]
	cmp r0, r1
	bge _081144FC
	b _081143FC
_081144FC:
	movs r6, 0
	ldr r4, _0811455C
	ldr r2, [sp, 0x8]
	ldr r3, _08114570
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r6, r0
	bge _081145BC
	adds r7, r4, 0
	mov r9, r6
	movs r5, 0xC4
	adds r5, r7
	mov r8, r5
_08114516:
	ldr r1, [sp, 0x8]
	lsls r0, r1, 5
	adds r2, r6, r0
	ldr r3, _08114574
	adds r0, r7, r3
	adds r0, r2
	mov r10, r0
	ldr r5, _08114560
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	ldr r3, _08114578
	adds r0, r7, r3
	adds r3, r2, r0
	ldr r5, _08114568
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r3]
	mov r0, r8
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811457C
	mov r2, r9
	strb r2, [r1]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	b _081145AC
	.align 2, 0
_0811455C: .4byte 0x02014800
_08114560: .4byte 0x000030c4
_08114564: .4byte 0x020168c4
_08114568: .4byte 0x000038c4
_0811456C: .4byte 0x020170c4
_08114570: .4byte 0x02014804
_08114574: .4byte 0x000020c4
_08114578: .4byte 0x000028c4
_0811457C:
	ldr r5, _081145D8
	adds r1, r4, r5
	adds r1, r2, r1
	ldr r5, _081145DC
	adds r0, r4, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	ldrb r2, [r1]
	subs r0, r2
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	strb r2, [r3]
	mov r0, r10
	strb r2, [r0]
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
_081145AC:
	adds r6, 0x1
	ldr r4, _081145E0
	ldr r1, [sp, 0x8]
	ldr r2, _081145E4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r6, r0
	blt _08114516
_081145BC:
	ldr r3, [sp, 0x30]
	str r3, [sp, 0x8]
	cmp r3, 0x3F
	bgt _081145C6
	b _08114232
_081145C6:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081145D8: .4byte 0x000010c4
_081145DC: .4byte 0x000018c4
_081145E0: .4byte 0x02014800
_081145E4: .4byte 0x02014804
	thumb_func_end unref_sub_8113B50

	thumb_func_start sub_81141F0
sub_81141F0: @ 81145E8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	mov r8, r1
	mov r9, r2
	ldr r3, _08114644
	lsls r1, r2, 5
	mov r0, r8
	adds r4, r0, r1
	ldr r5, _08114648
	adds r2, r3, r5
	adds r2, r4, r2
	adds r1, r6, r1
	ldr r7, _0811464C
	adds r0, r3, r7
	adds r5, r1, r0
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r0, _08114650
	adds r2, r3, r0
	adds r2, r4, r2
	ldr r7, _08114654
	adds r0, r3, r7
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	movs r7, 0
	ldr r1, _08114658
	adds r0, r3, r1
	adds r2, r4, r0
	ldrb r1, [r5]
	ldrb r0, [r2]
	mov r12, r3
	cmp r1, r0
	bcs _0811465C
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x4
	strb r1, [r0]
	ldrb r1, [r2]
	ldrb r0, [r5]
	b _0811466E
	.align 2, 0
_08114644: .4byte 0x02014800
_08114648: .4byte 0x000030c4
_0811464C: .4byte 0x000010c4
_08114650: .4byte 0x000038c4
_08114654: .4byte 0x000018c4
_08114658: .4byte 0x000020c4
_0811465C:
	cmp r1, r0
	bls _08114670
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x1
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r2]
_0811466E:
	subs r7, r1, r0
_08114670:
	mov r5, r8
	lsls r3, r5, 1
	mov r0, r9
	lsls r4, r0, 6
	adds r0, r3, r4
	ldr r1, _081146B4
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	movs r7, 0
	mov r1, r9
	lsls r2, r1, 5
	adds r1, r6, r2
	ldr r0, _081146B8
	add r0, r12
	adds r6, r1, r0
	adds r1, r5, r2
	ldr r0, _081146BC
	add r0, r12
	adds r5, r1, r0
	ldrb r2, [r6]
	ldrb r0, [r5]
	cmp r2, r0
	bcs _081146C4
	ldr r0, _081146C0
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r6]
	b _081146D6
	.align 2, 0
_081146B4: .4byte 0x000080c4
_081146B8: .4byte 0x000018c4
_081146BC: .4byte 0x000028c4
_081146C0: .4byte 0x000008c4
_081146C4:
	cmp r2, r0
	bls _081146D8
	ldr r0, _081146FC
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x2
	strb r1, [r0]
	ldrb r1, [r6]
	ldrb r0, [r5]
_081146D6:
	subs r7, r1, r0
_081146D8:
	adds r0, r3, r4
	ldr r1, _08114700
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	mov r1, r12
	adds r1, 0x84
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081146FC: .4byte 0x000008c4
_08114700: .4byte 0x000090c4
	thumb_func_end sub_81141F0

	thumb_func_start sub_811430C
sub_811430C: @ 8114704
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r5, _081147A4
	lsls r4, r1, 5
	adds r4, r0, r4
	ldr r2, _081147A8
	adds r2, r5
	mov r10, r2
	add r10, r4
	mov r3, r10
	ldrb r2, [r3]
	ldr r6, _081147AC
	adds r6, r5
	mov r8, r6
	add r8, r4
	mov r6, r8
	ldrb r3, [r6]
	subs r7, r2, r3
	ldr r2, _081147B0
	adds r6, r5, r2
	adds r6, r4, r6
	ldr r2, _081147B4
	adds r2, r5
	mov r9, r2
	add r9, r4
	lsrs r2, r7, 31
	adds r2, r7, r2
	asrs r2, 1
	adds r3, r2
	mov r2, r9
	strb r3, [r2]
	strb r3, [r6]
	adds r2, r5, 0
	adds r2, 0xC4
	adds r2, r4, r2
	movs r3, 0x5
	strb r3, [r2]
	ldr r3, _081147B8
	adds r2, r5, r3
	adds r4, r2
	movs r2, 0x7
	strb r2, [r4]
	adds r3, r5, 0
	adds r3, 0x84
	adds r3, r1, r3
	ldrb r2, [r3]
	adds r2, 0x1
	strb r2, [r3]
	ldrb r3, [r6]
	mov r4, r8
	ldrb r2, [r4]
	subs r7, r3, r2
	lsls r0, 1
	lsls r1, 6
	adds r0, r1
	ldr r6, _081147BC
	adds r1, r5, r6
	adds r1, r0, r1
	lsls r2, r7, 4
	strh r2, [r1]
	mov r1, r10
	ldrb r2, [r1]
	mov r3, r9
	ldrb r1, [r3]
	subs r7, r2, r1
	ldr r4, _081147C0
	adds r5, r4
	adds r0, r5
	lsls r1, r7, 4
	strh r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081147A4: .4byte 0x02014800
_081147A8: .4byte 0x000028c4
_081147AC: .4byte 0x000020c4
_081147B0: .4byte 0x000030c4
_081147B4: .4byte 0x000038c4
_081147B8: .4byte 0x000008c4
_081147BC: .4byte 0x000080c4
_081147C0: .4byte 0x000090c4
	thumb_func_end sub_811430C

	thumb_func_start unref_sub_81143CC
unref_sub_81143CC: @ 81147C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r0, 0x1
	str r0, [sp, 0x4]
	ldr r0, _08114800
	ldr r2, _08114804
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r4, r0, 0
	cmp r3, 0
	beq _081147E6
	subs r0, r3, 0x1
	strb r0, [r1]
_081147E6:
	movs r5, 0
	str r5, [sp]
_081147EA:
	movs r3, 0
	adds r2, r4, 0
	adds r0, r4, 0
	adds r0, 0x84
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, 0x1
	str r1, [sp, 0x8]
	bl _0811517C
	.align 2, 0
_08114800: .4byte 0x02014800
_08114804: .4byte 0x0000a0c4
_08114808:
	ldr r5, [sp]
	lsls r0, r5, 5
	adds r1, r3, r0
	adds r2, 0xC4
	adds r1, r2
	ldrb r2, [r1]
	mov r8, r0
	adds r0, r3, 0x1
	mov r10, r0
	cmp r2, 0xC
	bls _08114820
	b _08114CCA
_08114820:
	lsls r0, r2, 2
	ldr r1, _0811482C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811482C: .4byte _08114830
	.align 2, 0
_08114830:
	.4byte _08114CCA
	.4byte _08114864
	.4byte _081148E8
	.4byte _08114974
	.4byte _081149F8
	.4byte _08114A84
	.4byte _08114AC0
	.4byte _08114AFC
	.4byte _08114B38
	.4byte _08114B74
	.4byte _08114BC8
	.4byte _08114C08
	.4byte _08114C50
_08114864:
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081148D8
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081148DC
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811489E
	b _08114CCA
_0811489E:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081148E0
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081148E4
	add r0, r9
	adds r2, r7, r0
_081148B0:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081148D0
	b _08114C98
_081148D0:
	adds r6, 0x1
	cmp r6, r5
	blt _081148B0
	b _08114CCA
	.align 2, 0
_081148D8: .4byte 0x000060c4
_081148DC: .4byte 0x000080c4
_081148E0: .4byte 0x000030c4
_081148E4: .4byte 0x000020c4
_081148E8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114960
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114964
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114968
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _08114924
	b _08114CCA
_08114924:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _0811496C
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114970
	add r0, r9
	adds r2, r7, r0
_08114936:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114940
	b _08114CB0
_08114940:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _08114936
	b _08114CCA
	.align 2, 0
_08114960: .4byte 0x02014800
_08114964: .4byte 0x000060c4
_08114968: .4byte 0x000080c4
_0811496C: .4byte 0x000030c4
_08114970: .4byte 0x000020c4
_08114974:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _081149E8
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _081149EC
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081149AE
	b _08114CCA
_081149AE:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081149F0
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081149F4
	add r0, r9
	adds r2, r7, r0
_081149C0:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081149E0
	b _08114CA4
_081149E0:
	adds r6, 0x1
	cmp r6, r5
	blt _081149C0
	b _08114CCA
	.align 2, 0
_081149E8: .4byte 0x000060c4
_081149EC: .4byte 0x000080c4
_081149F0: .4byte 0x000030c4
_081149F4: .4byte 0x000020c4
_081149F8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114A70
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114A74
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114A78
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _08114A34
	b _08114CCA
_08114A34:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114A7C
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114A80
	add r0, r9
	adds r2, r7, r0
_08114A46:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114A50
	b _08114CB0
_08114A50:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _08114A46
	b _08114CCA
	.align 2, 0
_08114A70: .4byte 0x02014800
_08114A74: .4byte 0x000060c4
_08114A78: .4byte 0x000080c4
_08114A7C: .4byte 0x000030c4
_08114A80: .4byte 0x000020c4
_08114A84:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _08114AB8
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114ABC
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114AAC
	b _08114CCA
_08114AAC:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x9
	strb r1, [r0]
	b _08114CCA
	.align 2, 0
_08114AB8: .4byte 0x02014800
_08114ABC: .4byte 0x000030c4
_08114AC0:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114AF4
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114AF8
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114AE8
	b _08114CCA
_08114AE8:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xA
	strb r1, [r0]
	b _08114CCA
	.align 2, 0
_08114AF4: .4byte 0x02014800
_08114AF8: .4byte 0x000030c4
_08114AFC:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114B30
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114B34
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114B24
	b _08114CCA
_08114B24:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xB
	strb r1, [r0]
	b _08114CCA
	.align 2, 0
_08114B30: .4byte 0x02014800
_08114B34: .4byte 0x000030c4
_08114B38:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114B6C
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114B70
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114B60
	b _08114CCA
_08114B60:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xC
	strb r1, [r0]
	b _08114CCA
	.align 2, 0
_08114B6C: .4byte 0x02014800
_08114B70: .4byte 0x000030c4
_08114B74:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _08114BAC
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _08114BB0
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r2, _08114BB4
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114BB8
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114C3C
	.align 2, 0
_08114BAC: .4byte 0x02014800
_08114BB0: .4byte 0x000030c4
_08114BB4: .4byte 0x000020c4
_08114BB8:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r3, 0x1
	mov r10, r0
	b _08114CCA
_08114BC8:
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r6, _08114BFC
	mov r2, r8
	adds r5, r3, r2
	ldr r0, _08114C00
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _08114C04
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114C7A
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x2
	b _08114C3A
	.align 2, 0
_08114BFC: .4byte 0x02014800
_08114C00: .4byte 0x000030c4
_08114C04: .4byte 0x000020c4
_08114C08:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _08114C44
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114C48
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r1, _08114C4C
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114C7A
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x3
_08114C3A:
	strb r1, [r0]
_08114C3C:
	adds r5, r3, 0x1
	mov r10, r5
	b _08114CCA
	.align 2, 0
_08114C44: .4byte 0x02014800
_08114C48: .4byte 0x000030c4
_08114C4C: .4byte 0x000020c4
_08114C50:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _08114C8C
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114C90
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _08114C94
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114CBC
_08114C7A:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r2, sp
	ldrb r2, [r2, 0x4]
	strb r2, [r0]
	adds r4, r3, 0x1
	mov r10, r4
	b _08114CCA
	.align 2, 0
_08114C8C: .4byte 0x02014800
_08114C90: .4byte 0x000030c4
_08114C94: .4byte 0x000020c4
_08114C98:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r5, 0
	strb r5, [r0]
	b _08114CCA
_08114CA4:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _08114CCA
_08114CB0:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _08114CCA
_08114CBC:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x4
	strb r1, [r0]
	adds r2, r3, 0x1
	mov r10, r2
_08114CCA:
	ldr r0, _08114CEC
	mov r4, r8
	adds r1, r3, r4
	ldr r5, _08114CF0
	adds r2, r0, r5
	adds r1, r2
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0xC
	bls _08114CE0
	b _0811516E
_08114CE0:
	lsls r0, r1, 2
	ldr r1, _08114CF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08114CEC: .4byte 0x02014800
_08114CF0: .4byte 0x000008c4
_08114CF4: .4byte _08114CF8
	.align 2, 0
_08114CF8:
	.4byte _0811516E
	.4byte _08114D2C
	.4byte _08114DB0
	.4byte _08114E34
	.4byte _08114EB8
	.4byte _08114F3C
	.4byte _08114F74
	.4byte _08114FAC
	.4byte _08114FE4
	.4byte _0811501C
	.4byte _08115070
	.4byte _081150B0
	.4byte _081150F0
_08114D2C:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _08114DA0
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _08114DA4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114D62
	b _0811516E
_08114D62:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114DA8
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _08114DAC
	add r0, r9
	adds r2, r7, r0
_08114D76:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114D96
	b _08115144
_08114D96:
	adds r6, 0x1
	cmp r6, r5
	blt _08114D76
	b _0811516E
	.align 2, 0
_08114DA0: .4byte 0x000070c4
_08114DA4: .4byte 0x000090c4
_08114DA8: .4byte 0x000038c4
_08114DAC: .4byte 0x000028c4
_08114DB0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114E20
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114E24
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114E28
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114DE8
	b _0811516E
_08114DE8:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114E2C
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114E30
	add r0, r9
	adds r2, r7, r0
_08114DFA:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114E04
	b _08115134
_08114E04:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114DFA
	b _0811516E
	.align 2, 0
_08114E20: .4byte 0x02014800
_08114E24: .4byte 0x000070c4
_08114E28: .4byte 0x000090c4
_08114E2C: .4byte 0x000038c4
_08114E30: .4byte 0x000028c4
_08114E34:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114EA8
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114EAC
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114E6A
	b _0811516E
_08114E6A:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114EB0
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _08114EB4
	add r0, r9
	adds r2, r7, r0
_08114E7E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114E9E
	b _08115144
_08114E9E:
	adds r6, 0x1
	cmp r6, r5
	blt _08114E7E
	b _0811516E
	.align 2, 0
_08114EA8: .4byte 0x000070c4
_08114EAC: .4byte 0x000090c4
_08114EB0: .4byte 0x000038c4
_08114EB4: .4byte 0x000028c4
_08114EB8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114F28
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114F2C
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114F30
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114EF0
	b _0811516E
_08114EF0:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114F34
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114F38
	add r0, r9
	adds r2, r7, r0
_08114F02:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114F0C
	b _08115154
_08114F0C:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114F02
	b _0811516E
	.align 2, 0
_08114F28: .4byte 0x02014800
_08114F2C: .4byte 0x000070c4
_08114F30: .4byte 0x000090c4
_08114F34: .4byte 0x000038c4
_08114F38: .4byte 0x000028c4
_08114F3C:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _08114F68
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114F6C
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114F5C
	b _0811516E
_08114F5C:
	ldr r2, _08114F70
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0x9
	b _0811516C
	.align 2, 0
_08114F68: .4byte 0x02014800
_08114F6C: .4byte 0x000038c4
_08114F70: .4byte 0x000008c4
_08114F74:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114FA0
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114FA4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114F94
	b _0811516E
_08114F94:
	ldr r2, _08114FA8
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xA
	b _0811516C
	.align 2, 0
_08114FA0: .4byte 0x02014800
_08114FA4: .4byte 0x000038c4
_08114FA8: .4byte 0x000008c4
_08114FAC:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114FD8
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114FDC
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114FCC
	b _0811516E
_08114FCC:
	ldr r2, _08114FE0
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xB
	b _0811516C
	.align 2, 0
_08114FD8: .4byte 0x02014800
_08114FDC: .4byte 0x000038c4
_08114FE0: .4byte 0x000008c4
_08114FE4:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08115010
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08115014
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08115004
	b _0811516E
_08115004:
	ldr r2, _08115018
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xC
	b _0811516C
	.align 2, 0
_08115010: .4byte 0x02014800
_08115014: .4byte 0x000038c4
_08115018: .4byte 0x000008c4
_0811501C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _08115050
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _08115054
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r2, _08115058
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08115060
	ldr r4, _0811505C
	adds r0, r6, r4
	adds r0, r5, r0
	mov r5, sp
	ldrb r5, [r5, 0x4]
	strb r5, [r0]
	b _0811516E
	.align 2, 0
_08115050: .4byte 0x02014800
_08115054: .4byte 0x000038c4
_08115058: .4byte 0x000028c4
_0811505C: .4byte 0x000008c4
_08115060:
	ldr r1, _0811506C
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x1
	b _0811516C
	.align 2, 0
_0811506C: .4byte 0x000008c4
_08115070:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _081150A0
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _081150A4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _081150A8
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08115116
	ldr r1, _081150AC
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x2
	b _0811516C
	.align 2, 0
_081150A0: .4byte 0x02014800
_081150A4: .4byte 0x000038c4
_081150A8: .4byte 0x000028c4
_081150AC: .4byte 0x000008c4
_081150B0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _081150E0
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _081150E4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r1, _081150E8
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08115116
	ldr r1, _081150EC
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x3
	b _0811516C
	.align 2, 0
_081150E0: .4byte 0x02014800
_081150E4: .4byte 0x000038c4
_081150E8: .4byte 0x000028c4
_081150EC: .4byte 0x000008c4
_081150F0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08115124
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08115128
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _0811512C
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08115164
_08115116:
	ldr r2, _08115130
	adds r0, r6, r2
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _0811516E
	.align 2, 0
_08115124: .4byte 0x02014800
_08115128: .4byte 0x000038c4
_0811512C: .4byte 0x000028c4
_08115130: .4byte 0x000008c4
_08115134:
	ldr r0, _08115140
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _0811516C
	.align 2, 0
_08115140: .4byte 0x000008c4
_08115144:
	ldr r0, _08115150
	add r0, r9
	adds r0, r7, r0
	strb r3, [r0]
	b _0811516E
	.align 2, 0
_08115150: .4byte 0x000008c4
_08115154:
	ldr r0, _08115160
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _0811516C
	.align 2, 0
_08115160: .4byte 0x000008c4
_08115164:
	ldr r1, _081151A4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x4
_0811516C:
	strb r1, [r0]
_0811516E:
	mov r3, r10
	ldr r2, _081151A8
	adds r0, r2, 0
	adds r0, 0x84
	ldr r4, [sp]
	adds r0, r4, r0
	adds r4, r2, 0
_0811517C:
	ldrb r0, [r0]
	cmp r3, r0
	bge _08115186
	bl _08114808
_08115186:
	ldr r5, [sp, 0x8]
	str r5, [sp]
	cmp r5, 0x3F
	bgt _08115192
	bl _081147EA
_08115192:
	ldr r0, [sp, 0x4]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081151A4: .4byte 0x000008c4
_081151A8: .4byte 0x02014800
	thumb_func_end unref_sub_81143CC

	thumb_func_start sub_8114DB4
sub_8114DB4: @ 81151AC
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _081151D4
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _081151D8
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _081151DC
	ldrb r0, [r2]
	movs r1, 0xF0
	b _081151E0
	.align 2, 0
_081151D4: .4byte 0x02014800
_081151D8: .4byte 0x000040c4
_081151DC:
	ldrb r0, [r2]
	movs r1, 0xF
_081151E0:
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_8114DB4

	thumb_func_start sub_8114DF0
sub_8114DF0: @ 81151E8
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08115220
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08115224
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0xC0
	lsls r0, 7
	adds r1, r2, r0
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08115228
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _0811523A
	ldrb r1, [r2]
	movs r0, 0xF
	b _08115236
	.align 2, 0
_08115220: .4byte 0x02014800
_08115224: .4byte 0x000040c4
_08115228:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0811523A
	ldrb r1, [r2]
	movs r0, 0xF0
_08115236:
	ands r0, r1
	strb r0, [r2]
_0811523A:
	pop {r0}
	bx r0
	thumb_func_end sub_8114DF0

	thumb_func_start sub_8114E48
sub_8114E48: @ 8115240
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08115264
	ldr r2, _08115268
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	bne _08115258
	b _08115356
_08115258:
	movs r1, 0
	movs r3, 0
	cmp r4, 0
	bne _0811526C
	movs r1, 0x1
	b _0811529E
	.align 2, 0
_08115264: .4byte 0x02014800
_08115268: .4byte 0x0000a0c4
_0811526C:
	subs r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811529E
	ldr r7, _081152BC
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811529E
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _0811529E
	cmp r4, 0
	bne _0811526C
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r1, r0, 24
_0811529E:
	cmp r3, 0x20
	bne _081152AC
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_081152AC:
	movs r3, 0
	cmp r4, 0x3F
	bne _081152C0
	lsls r0, r1, 24
	movs r7, 0x80
	lsls r7, 17
	adds r0, r7
	b _081152F0
	.align 2, 0
_081152BC: .4byte 0x000008c4
_081152C0:
	adds r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _081152F2
	ldr r7, _0811535C
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _081152F2
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _081152F2
	cmp r4, 0x3F
	bne _081152C0
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
_081152F0:
	lsrs r1, r0, 24
_081152F2:
	cmp r3, 0x20
	bne _08115300
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08115300:
	cmp r1, 0x2
	beq _08115356
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r0, 0
	bge _08115310
	movs r1, 0
_08115310:
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _0811531E
	movs r2, 0x3F
_0811531E:
	lsls r1, 24
	asrs r3, r1, 24
	lsls r0, r2, 24
	asrs r2, r0, 24
	adds r6, r1, 0
	adds r7, r0, 0
	cmp r3, r2
	bge _08115374
	cmp r4, 0
	beq _08115374
	subs r0, r4, 0x1
	lsls r5, r0, 7
	ldr r0, _08115360
	mov r12, r0
_0811533A:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	add r0, r12
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08115364
	ldrb r1, [r1]
	movs r0, 0xF0
_08115350:
	ands r0, r1
	cmp r0, 0
	beq _0811536A
_08115356:
	movs r0, 0x1
	b _081153C2
	.align 2, 0
_0811535C: .4byte 0x000008c4
_08115360: .4byte 0x020188c4
_08115364:
	ldrb r1, [r1]
	movs r0, 0xF
	b _08115350
_0811536A:
	adds r3, 0x1
	cmp r3, r2
	bge _08115374
	cmp r4, 0
	bne _0811533A
_08115374:
	asrs r3, r6, 24
	asrs r1, r7, 24
	cmp r3, r1
	bge _081153C0
	cmp r4, 0x3F
	beq _081153C0
	adds r0, r4, 0x1
	lsls r5, r0, 7
	ldr r6, _081153A8
	adds r2, r1, 0
_08115388:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	adds r0, r6
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _081153AC
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _081153B6
	b _08115356
	.align 2, 0
_081153A8: .4byte 0x020188c4
_081153AC:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08115356
_081153B6:
	adds r3, 0x1
	cmp r3, r2
	bge _081153C0
	cmp r4, 0x3F
	bne _08115388
_081153C0:
	movs r0, 0
_081153C2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8114E48

	thumb_func_start HBlankCB_EvolutionScene
HBlankCB_EvolutionScene: @ 81153C8
	bx lr
	thumb_func_end HBlankCB_EvolutionScene

	thumb_func_start VBlankCB_EvolutionScene
VBlankCB_EvolutionScene: @ 81153CC
	push {lr}
	ldr r1, _0811542C
	ldr r2, _08115430
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r0, _08115434
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115438
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0811543C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115440
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115444
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115448
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0811544C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115450
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_0811542C: .4byte 0x04000008
_08115430: .4byte 0x00009803
_08115434: .4byte gUnknown_030042A4
_08115438: .4byte gUnknown_030042A0
_0811543C: .4byte gUnknown_030042C0
_08115440: .4byte gUnknown_030041B4
_08115444: .4byte gUnknown_03004288
_08115448: .4byte gUnknown_03004280
_0811544C: .4byte gUnknown_030041B0
_08115450: .4byte gUnknown_030041B8
	thumb_func_end VBlankCB_EvolutionScene

	thumb_func_start VBlankCB_TradeEvolutionScene
VBlankCB_TradeEvolutionScene: @ 8115454
	push {lr}
	ldr r1, _081154AC
	ldr r0, _081154B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154B8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154BC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154C8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081154CC
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_081154AC: .4byte 0x04000010
_081154B0: .4byte gUnknown_030042A4
_081154B4: .4byte gUnknown_030042A0
_081154B8: .4byte gUnknown_030042C0
_081154BC: .4byte gUnknown_030041B4
_081154C0: .4byte gUnknown_03004288
_081154C4: .4byte gUnknown_03004280
_081154C8: .4byte gUnknown_030041B0
_081154CC: .4byte gUnknown_030041B8
	thumb_func_end VBlankCB_TradeEvolutionScene

	thumb_func_start sub_81150D8
sub_81150D8: @ 81154D0
	push {lr}
	ldr r0, _081154EC
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC8
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_081154EC: .4byte gUnknown_02024D1E
	thumb_func_end sub_81150D8

	thumb_func_start HBlankCB_TradeEvolutionScene
HBlankCB_TradeEvolutionScene: @ 81154F0
	bx lr
	thumb_func_end HBlankCB_TradeEvolutionScene

	.align 2, 0 @ Don't pad with nop.
