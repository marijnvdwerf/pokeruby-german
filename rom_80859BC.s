	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreateTrainerSprite_BirchSpeech
CreateTrainerSprite_BirchSpeech: @ 8085E10
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r9, r3
	ldr r7, [sp, 0x34]
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsrs r4, 21
	ldr r3, _08085E98 @ =gTrainerFrontPicPaletteTable
	mov r8, r3
	add r8, r4
	mov r0, r8
	adds r1, r7, 0
	bl LoadCompressedObjectPaletteOverrideBuffer
	ldr r0, _08085E9C @ =gTrainerFrontPicTable
	adds r4, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl LoadCompressedObjectPicOverrideBuffer
	mov r1, sp
	ldrh r0, [r4, 0x6]
	movs r2, 0
	strh r0, [r1]
	mov r3, r8
	ldrh r0, [r3, 0x4]
	strh r0, [r1, 0x2]
	ldr r0, _08085EA0 @ =gOamData_839F0F4
	str r0, [sp, 0x4]
	ldr r0, _08085EA4 @ =gDummySpriteAnimTable
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _08085EA8 @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _08085EAC @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08085E98: .4byte gTrainerFrontPicPaletteTable
_08085E9C: .4byte gTrainerFrontPicTable
_08085EA0: .4byte gOamData_839F0F4
_08085EA4: .4byte gDummySpriteAnimTable
_08085EA8: .4byte gDummySpriteAffineAnimTable
_08085EAC: .4byte SpriteCallbackDummy
	thumb_func_end CreateTrainerSprite_BirchSpeech

	thumb_func_start LoadTrainerGfx_TrainerCard
LoadTrainerGfx_TrainerCard: @ 8085EB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r2, 0
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08085EE0 @ =gTrainerFrontPicTable
	lsrs r4, 21
	adds r0, r4, r0
	ldr r0, [r0]
	bl LZDecompressVram
	ldr r0, _08085EE4 @ =gTrainerFrontPicPaletteTable
	adds r4, r0
	ldr r0, [r4]
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085EE0: .4byte gTrainerFrontPicTable
_08085EE4: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end LoadTrainerGfx_TrainerCard

	thumb_func_start CreateBirchSprite
CreateBirchSprite: @ 8085EE8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08085F20 @ =gUnknown_0839F114
	bl LoadSpritePalette
	ldr r0, _08085F24 @ =gSpriteTemplate_839F128
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08085F20: .4byte gUnknown_0839F114
_08085F24: .4byte gSpriteTemplate_839F128
	thumb_func_end CreateBirchSprite

	thumb_func_start CreateMonSprite_PicBox
CreateMonSprite_PicBox: @ 8085F28
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r10, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, r4, 3
	mov r9, r0
	ldr r0, _08085FC8 @ =gMonFrontPicTable
	add r0, r9
	ldr r1, _08085FCC @ =gMonFrontPicCoords
	lsls r2, r4, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08085FD0 @ =gUnknown_081FAF4C
	ldr r3, [r3, 0xC]
	str r3, [sp]
	str r4, [sp, 0x4]
	bl DecompressPicFromTable_2
	ldr r5, _08085FD4 @ =gMonPaletteTable
	add r9, r5
	mov r0, r9
	bl LoadCompressedObjectPalette
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r4, _08085FD8 @ =gUnknown_02024E8C
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_807DE38
	lsls r6, 16
	asrs r6, 16
	mov r0, r8
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08085FC8: .4byte gMonFrontPicTable
_08085FCC: .4byte gMonFrontPicCoords
_08085FD0: .4byte gUnknown_081FAF4C
_08085FD4: .4byte gMonPaletteTable
_08085FD8: .4byte gUnknown_02024E8C
	thumb_func_end CreateMonSprite_PicBox

	thumb_func_start CreateMonSprite_FieldMove
CreateMonSprite_FieldMove: @ 8085FDC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	adds r5, r0, 0
	mov r10, r1
	adds r4, r2, 0
	adds r6, r3, 0
	ldr r0, [sp, 0x28]
	mov r8, r0
	ldr r0, [sp, 0x2C]
	mov r9, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _08086088 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0808608C @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08086090 @ =gUnknown_081FAF4C
	ldr r3, [r3, 0xC]
	str r3, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	bl sub_800D334
	adds r0, r5, 0
	mov r1, r10
	adds r2, r4, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r5, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _08086094 @ =gUnknown_02024E8C
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2]
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_807DE38
	lsls r6, 16
	asrs r6, 16
	mov r0, r8
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086088: .4byte gMonFrontPicTable
_0808608C: .4byte gMonFrontPicCoords
_08086090: .4byte gUnknown_081FAF4C
_08086094: .4byte gUnknown_02024E8C
	thumb_func_end CreateMonSprite_FieldMove

	thumb_func_start FreeResourcesAndDestroySprite
FreeResourcesAndDestroySprite: @ 8086098
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807DE68
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	cmp r0, 0
	beq _080860C2
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_080860C2:
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FreeResourcesAndDestroySprite

	thumb_func_start MultiplyInvertedPaletteRGBComponents
MultiplyInvertedPaletteRGBComponents: @ 80860D0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08086154 @ =gPlttBufferUnfaded
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r9, r5
	mov r8, r4
	mov r6, r8
	ands r6, r5
	mov r8, r6
	movs r6, 0xF8
	lsls r6, 2
	ands r6, r4
	lsrs r6, 5
	movs r5, 0xF8
	lsls r5, 7
	ands r4, r5
	lsrs r4, 10
	mov r7, r9
	mov r5, r8
	subs r7, r5
	mov r12, r7
	mov r7, r12
	muls r7, r1
	adds r1, r7, 0
	asrs r1, 4
	add r8, r1
	mov r5, r9
	subs r1, r5, r6
	muls r1, r2
	asrs r1, 4
	adds r6, r1
	subs r5, r4
	mov r9, r5
	mov r1, r9
	muls r1, r3
	asrs r1, 4
	adds r4, r1
	mov r7, r8
	lsls r7, 16
	lsls r6, 21
	orrs r6, r7
	lsls r4, 26
	orrs r4, r6
	lsrs r4, 16
	ldr r1, _08086158 @ =gPlttBufferFaded
	adds r0, r1
	strh r4, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086154: .4byte gPlttBufferUnfaded
_08086158: .4byte gPlttBufferFaded
	thumb_func_end MultiplyInvertedPaletteRGBComponents

	thumb_func_start MultiplyPaletteRGBComponents
MultiplyPaletteRGBComponents: @ 808615C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _080861CC @ =gPlttBufferUnfaded
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r8, r5
	mov r6, r8
	ands r6, r4
	mov r8, r6
	movs r5, 0xF8
	lsls r5, 2
	ands r5, r4
	lsrs r5, 5
	movs r6, 0xF8
	lsls r6, 7
	ands r4, r6
	lsrs r4, 10
	mov r6, r8
	muls r6, r1
	adds r1, r6, 0
	asrs r1, 4
	mov r6, r8
	subs r6, r1
	adds r1, r5, 0
	muls r1, r2
	asrs r1, 4
	subs r5, r1
	adds r1, r4, 0
	muls r1, r3
	asrs r1, 4
	subs r4, r1
	lsls r6, 16
	lsls r5, 21
	orrs r5, r6
	lsls r4, 26
	orrs r4, r5
	lsrs r4, 16
	ldr r1, _080861D0 @ =gPlttBufferFaded
	adds r0, r1
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080861CC: .4byte gPlttBufferUnfaded
_080861D0: .4byte gPlttBufferFaded
	thumb_func_end MultiplyPaletteRGBComponents

	thumb_func_start FldEff_PokecenterHeal
FldEff_PokecenterHeal: @ 80861D4
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08086210 @ =Task_PokecenterHeal
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086214 @ =gTasks
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x5D
	strh r0, [r1, 0xC]
	movs r0, 0x24
	strh r0, [r1, 0xE]
	movs r0, 0x7C
	strh r0, [r1, 0x10]
	movs r0, 0x18
	strh r0, [r1, 0x12]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086210: .4byte Task_PokecenterHeal
_08086214: .4byte gTasks
	thumb_func_end FldEff_PokecenterHeal

	thumb_func_start Task_PokecenterHeal
Task_PokecenterHeal: @ 8086218
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086240 @ =gTasks
	adds r1, r0
	ldr r2, _08086244 @ =gUnknown_0839F268
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08086240: .4byte gTasks
_08086244: .4byte gUnknown_0839F268
	thumb_func_end Task_PokecenterHeal

	thumb_func_start PokecenterHealEffect_0
PokecenterHealEffect_0: @ 8086248
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0x1
	bl CreatePokeballGlowSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl PokecenterHealEffectHelper
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokecenterHealEffect_0

	thumb_func_start PokecenterHealEffect_1
PokecenterHealEffect_1: @ 8086284
	push {r4,lr}
	adds r2, r0, 0
	ldr r3, _080862BC @ =gSprites
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	cmp r0, 0x1
	ble _080862B6
	movs r0, 0x16
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_080862B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080862BC: .4byte gSprites
	thumb_func_end PokecenterHealEffect_1

	thumb_func_start PokecenterHealEffect_2
PokecenterHealEffect_2: @ 80862C0
	push {lr}
	adds r3, r0, 0
	ldr r2, _080862E4 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _080862E0
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080862E0:
	pop {r0}
	bx r0
	.align 2, 0
_080862E4: .4byte gSprites
	thumb_func_end PokecenterHealEffect_2

	thumb_func_start PokecenterHealEffect_3
PokecenterHealEffect_3: @ 80862E8
	push {lr}
	ldr r2, _08086320 @ =gSprites
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _0808631A
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x19
	bl FieldEffectActiveListRemove
	ldr r0, _08086324 @ =Task_PokecenterHeal
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808631A:
	pop {r0}
	bx r0
	.align 2, 0
_08086320: .4byte gSprites
_08086324: .4byte Task_PokecenterHeal
	thumb_func_end PokecenterHealEffect_3

	thumb_func_start FldEff_HallOfFameRecord
FldEff_HallOfFameRecord: @ 8086328
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0808635C @ =Task_HallOfFameRecord
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086360 @ =gTasks
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x75
	strh r0, [r1, 0xC]
	movs r0, 0x34
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808635C: .4byte Task_HallOfFameRecord
_08086360: .4byte gTasks
	thumb_func_end FldEff_HallOfFameRecord

	thumb_func_start Task_HallOfFameRecord
Task_HallOfFameRecord: @ 8086364
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808638C @ =gTasks
	adds r1, r0
	ldr r2, _08086390 @ =gUnknown_0839F278
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0808638C: .4byte gTasks
_08086390: .4byte gUnknown_0839F278
	thumb_func_end Task_HallOfFameRecord

	thumb_func_start HallOfFameRecordEffect_0
HallOfFameRecordEffect_0: @ 8086394
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreatePokeballGlowSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	ldr r0, _08086404 @ =Task_HallOfFameRecord
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x18
	movs r3, 0
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0x28
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0x48
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0xA8
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x8
	movs r3, 0x1
	bl HallOfFameRecordEffectHelper
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086404: .4byte Task_HallOfFameRecord
	thumb_func_end HallOfFameRecordEffect_0

	thumb_func_start HallOfFameRecordEffect_1
HallOfFameRecordEffect_1: @ 8086408
	push {lr}
	adds r3, r0, 0
	ldr r2, _08086434 @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	ble _0808642E
	ldrh r0, [r3, 0x26]
	adds r0, 0x1
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0808642E:
	pop {r0}
	bx r0
	.align 2, 0
_08086434: .4byte gSprites
	thumb_func_end HallOfFameRecordEffect_1

	thumb_func_start HallOfFameRecordEffect_2
HallOfFameRecordEffect_2: @ 8086438
	push {lr}
	adds r3, r0, 0
	ldr r2, _0808645C @ =gSprites
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08086458
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086458:
	pop {r0}
	bx r0
	.align 2, 0
_0808645C: .4byte gSprites
	thumb_func_end HallOfFameRecordEffect_2

	thumb_func_start HallOfFameRecordEffect_3
HallOfFameRecordEffect_3: @ 8086460
	push {lr}
	ldr r2, _08086498 @ =gSprites
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _08086492
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x3E
	bl FieldEffectActiveListRemove
	ldr r0, _0808649C @ =Task_HallOfFameRecord
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086492:
	pop {r0}
	bx r0
	.align 2, 0
_08086498: .4byte gSprites
_0808649C: .4byte Task_HallOfFameRecord
	thumb_func_end HallOfFameRecordEffect_3

	thumb_func_start CreatePokeballGlowSprite
CreatePokeballGlowSprite: @ 80864A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080864EC @ =SpriteCB_PokeballGlowEffect
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _080864F0 @ =gSprites
	adds r1, r2
	strh r4, [r1, 0x24]
	strh r5, [r1, 0x26]
	strh r6, [r1, 0x38]
	mov r2, r8
	strh r2, [r1, 0x3A]
	strh r0, [r1, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080864EC: .4byte SpriteCB_PokeballGlowEffect
_080864F0: .4byte gSprites
	thumb_func_end CreatePokeballGlowSprite

	thumb_func_start SpriteCB_PokeballGlowEffect
SpriteCB_PokeballGlowEffect: @ 80864F4
	push {lr}
	ldr r2, _0808650C @ =gUnknown_0839F288
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0808650C: .4byte gUnknown_0839F288
	thumb_func_end SpriteCB_PokeballGlowEffect

	thumb_func_start PokeballGlowEffect_0
PokeballGlowEffect_0: @ 8086510
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08086528
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08086584
_08086528:
	movs r0, 0x19
	strh r0, [r4, 0x30]
	ldr r0, _0808659C @ =gSpriteTemplate_839F208
	ldr r1, _080865A0 @ =gUnknown_0839F2A8
	movs r2, 0x32
	ldrsh r3, [r4, r2]
	lsls r3, 2
	adds r3, r1
	ldrh r1, [r4, 0x24]
	ldrh r2, [r3]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x26]
	ldrh r3, [r3, 0x2]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080865A4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldrh r0, [r4, 0x3C]
	strh r0, [r1, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	subs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x17
	bl PlaySE
_08086584:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086596
	movs r0, 0x20
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08086596:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808659C: .4byte gSpriteTemplate_839F208
_080865A0: .4byte gUnknown_0839F2A8
_080865A4: .4byte gSprites
	thumb_func_end PokeballGlowEffect_0

	thumb_func_start PokeballGlowEffect_1
PokeballGlowEffect_1: @ 80865A8
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _080865D8
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	movs r0, 0x8
	strh r0, [r1, 0x30]
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x34]
	movs r2, 0x38
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080865D8
	movs r0, 0xB8
	lsls r0, 1
	bl PlayFanfare
_080865D8:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_1

	thumb_func_start PokeballGlowEffect_2
PokeballGlowEffect_2: @ 80865DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldrh r0, [r7, 0x30]
	subs r0, 0x1
	strh r0, [r7, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _0808660C
	movs r0, 0x8
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r7, 0x32]
	cmp r0, 0
	bne _0808660C
	ldrh r0, [r7, 0x34]
	adds r0, 0x1
	strh r0, [r7, 0x34]
_0808660C:
	ldrh r4, [r7, 0x32]
	adds r4, 0x3
	movs r0, 0x3
	mov r8, r0
	mov r1, r8
	ands r4, r1
	ldr r3, _08086704 @ =0x00001007
	mov r10, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r6, _08086708 @ =gUnknown_0839F2C0
	adds r1, r4, r6
	ldrb r1, [r1]
	ldr r5, _0808670C @ =gUnknown_0839F2C4
	adds r2, r4, r5
	ldrb r2, [r2]
	ldr r3, _08086710 @ =gUnknown_0839F2C8
	mov r9, r3
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	adds r4, 0x2
	mov r0, r8
	ands r4, r0
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	adds r4, 0x1
	mov r3, r8
	ands r4, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r4, [r7, 0x32]
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r3, _08086714 @ =0x01050000
	adds r0, r3
	lsrs r0, 16
	adds r6, r4, r6
	ldrb r6, [r6]
	adds r5, r4, r5
	ldrb r5, [r5]
	add r4, r9
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08086718 @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	cmp r0, 0x2
	ble _080866F6
	ldrh r0, [r7, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r7, 0x2E]
	movs r0, 0x8
	strh r0, [r7, 0x30]
	strh r1, [r7, 0x32]
_080866F6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086704: .4byte 0x00001007
_08086708: .4byte gUnknown_0839F2C0
_0808670C: .4byte gUnknown_0839F2C4
_08086710: .4byte gUnknown_0839F2C8
_08086714: .4byte 0x01050000
_08086718: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_2

	thumb_func_start PokeballGlowEffect_3
PokeballGlowEffect_3: @ 808671C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _0808674C
	movs r0, 0x8
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r2, 0x32]
	cmp r0, 0x3
	bne _0808674C
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0x1E
	strh r0, [r2, 0x30]
_0808674C:
	ldrh r4, [r2, 0x32]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080867F8 @ =0x00001007
	mov r8, r0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r1, _080867FC @ =gUnknown_0839F2C0
	adds r1, r4, r1
	ldrb r6, [r1]
	ldr r1, _08086800 @ =gUnknown_0839F2C4
	adds r1, r4, r1
	ldrb r5, [r1]
	ldr r1, _08086804 @ =gUnknown_0839F2C8
	adds r4, r1
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08086808 @ =0x01050000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _0808680C @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl MultiplyInvertedPaletteRGBComponents
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080867F8: .4byte 0x00001007
_080867FC: .4byte gUnknown_0839F2C0
_08086800: .4byte gUnknown_0839F2C4
_08086804: .4byte gUnknown_0839F2C8
_08086808: .4byte 0x01050000
_0808680C: .4byte 0x01030000
	thumb_func_end PokeballGlowEffect_3

	thumb_func_start PokeballGlowEffect_4
PokeballGlowEffect_4: @ 8086810
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08086826
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_08086826:
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_4

	thumb_func_start PokeballGlowEffect_5
PokeballGlowEffect_5: @ 808682C
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	bx lr
	thumb_func_end PokeballGlowEffect_5

	thumb_func_start PokeballGlowEffect_6
PokeballGlowEffect_6: @ 8086834
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0808684A
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08086850
_0808684A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08086850:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokeballGlowEffect_6

	thumb_func_start PokeballGlowEffect_7
PokeballGlowEffect_7: @ 8086858
	bx lr
	thumb_func_end PokeballGlowEffect_7

	thumb_func_start SpriteCB_PokeballGlow
SpriteCB_PokeballGlow: @ 808685C
	push {lr}
	adds r3, r0, 0
	ldr r2, _08086880 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _0808687C
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_0808687C:
	pop {r0}
	bx r0
	.align 2, 0
_08086880: .4byte gSprites
	thumb_func_end SpriteCB_PokeballGlow

	thumb_func_start PokecenterHealEffectHelper
PokecenterHealEffectHelper: @ 8086884
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080868D4 @ =gSpriteTemplate_839F220
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080868D8 @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _080868DC @ =gUnknown_0839F1A0
	bl SetSubspriteTables
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080868D4: .4byte gSpriteTemplate_839F220
_080868D8: .4byte gSprites
_080868DC: .4byte gUnknown_0839F1A0
	thumb_func_end PokecenterHealEffectHelper

	thumb_func_start SpriteCB_PokecenterMonitor
SpriteCB_PokecenterMonitor: @ 80868E0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08086904
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_08086904:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08086918
	adds r0, r4, 0
	bl FieldEffectFreeGraphicsResources
_08086918:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_PokecenterMonitor

	thumb_func_start HallOfFameRecordEffectHelper
HallOfFameRecordEffectHelper: @ 8086920
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	cmp r3, 0
	bne _08086968
	ldr r0, _0808695C @ =gSpriteTemplate_839F238
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08086960 @ =gSprites
	adds r0, r1
	ldr r1, _08086964 @ =gUnknown_0839F1C8
	bl SetSubspriteTables
	b _0808697C
	.align 2, 0
_0808695C: .4byte gSpriteTemplate_839F238
_08086960: .4byte gSprites
_08086964: .4byte gUnknown_0839F1C8
_08086968:
	ldr r0, _0808699C @ =gSpriteTemplate_839F250
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
_0808697C:
	ldr r1, _080869A0 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808699C: .4byte gSpriteTemplate_839F250
_080869A0: .4byte gSprites
	thumb_func_end HallOfFameRecordEffectHelper

	thumb_func_start SpriteCB_HallOfFameMonitor
SpriteCB_HallOfFameMonitor: @ 80869A4
	push {lr}
	adds r3, r0, 0
	ldr r2, _08086A0C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080869FA
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080869D2
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080869F4
_080869D2:
	movs r0, 0x10
	strh r0, [r3, 0x30]
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
_080869F4:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
_080869FA:
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0x7F
	ble _08086A08
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_08086A08:
	pop {r0}
	bx r0
	.align 2, 0
_08086A0C: .4byte gTasks
	thumb_func_end SpriteCB_HallOfFameMonitor

	thumb_func_start sub_80865BC
sub_80865BC: @ 8086A10
	push {lr}
	ldr r0, _08086A24 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _08086A28 @ =gUnknown_0300485C
	ldr r0, _08086A2C @ =mapldr_080842E8
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08086A24: .4byte c2_exit_to_overworld_2_switch
_08086A28: .4byte gUnknown_0300485C
_08086A2C: .4byte mapldr_080842E8
	thumb_func_end sub_80865BC

	thumb_func_start mapldr_080842E8
mapldr_080842E8: @ 8086A30
	push {lr}
	bl pal_fill_black
	ldr r0, _08086A50 @ =task00_8084310
	movs r1, 0
	bl CreateTask
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08086A54 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08086A50: .4byte task00_8084310
_08086A54: .4byte gUnknown_0300485C
	thumb_func_end mapldr_080842E8

	thumb_func_start task00_8084310
task00_8084310: @ 8086A58
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08086AC0 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _08086A94
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08086ABA
	ldr r1, _08086AC4 @ =gUnknown_0202FF84
	ldr r0, _08086AC8 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	cmp r0, 0x5
	ble _08086A88
	str r5, [r1]
_08086A88:
	movs r0, 0x1F
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086A94:
	movs r0, 0x1F
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086ABA
	bl flag_var_implications_of_teleport_
	bl warp_in
	ldr r0, _08086ACC @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08086AD0 @ =gUnknown_0300485C
	ldr r0, _08086AD4 @ =mapldr_08084390
	str r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_08086ABA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086AC0: .4byte gTasks
_08086AC4: .4byte gUnknown_0202FF84
_08086AC8: .4byte gUnknown_03005CE0
_08086ACC: .4byte CB2_LoadMap
_08086AD0: .4byte gUnknown_0300485C
_08086AD4: .4byte mapldr_08084390
	thumb_func_end task00_8084310

	thumb_func_start mapldr_08084390
mapldr_08084390: @ 8086AD8
	push {r4,lr}
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _08086B30 @ =c3_080843F8
	movs r1, 0
	bl CreateTask
	ldr r4, _08086B34 @ =gMapObjects
	ldr r3, _08086B38 @ =gPlayerAvatar
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08086B1A
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3
	bl FieldObjectTurn
_08086B1A:
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08086B3C @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086B30: .4byte c3_080843F8
_08086B34: .4byte gMapObjects
_08086B38: .4byte gPlayerAvatar
_08086B3C: .4byte gUnknown_0300485C
	thumb_func_end mapldr_08084390

	thumb_func_start c3_080843F8
c3_080843F8: @ 8086B40
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08086B94 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086B72
	ldr r0, _08086B98 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08086B8C
	movs r0, 0x20
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086B72:
	movs r0, 0x20
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086B8C
	bl ScriptContext2_Disable
	bl sub_806451C
	adds r0, r5, 0
	bl DestroyTask
_08086B8C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086B94: .4byte gTasks
_08086B98: .4byte gPaletteFade
	thumb_func_end c3_080843F8

	thumb_func_start sub_8086748
sub_8086748: @ 8086B9C
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _08086BC0 @ =sub_8086774
	movs r1, 0
	bl CreateTask
	ldr r1, _08086BC4 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08086BC0: .4byte sub_8086774
_08086BC4: .4byte gUnknown_0300485C
	thumb_func_end sub_8086748

	thumb_func_start sub_8086774
sub_8086774: @ 8086BC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086BF8 @ =gTasks
	adds r4, r1, r0
	ldr r5, _08086BFC @ =gUnknown_0839F2CC
_08086BDA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086BDA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086BF8: .4byte gTasks
_08086BFC: .4byte gUnknown_0839F2CC
	thumb_func_end sub_8086774

	thumb_func_start sub_80867AC
sub_80867AC: @ 8086C00
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r9, r0
	ldr r6, _08086C9C @ =gPlayerAvatar
	ldrb r0, [r6, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _08086CA0 @ =gMapObjects
	mov r8, r0
	add r5, r8
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086CA4 @ =gSprites
	adds r4, r0
	bl CameraObjectReset2
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	adds r3, r4, 0
	adds r3, 0x42
	ldrb r0, [r3]
	lsrs r0, 6
	mov r1, r9
	strh r0, [r1, 0x10]
	ldrb r0, [r5, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r1, [r3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086C9C: .4byte gPlayerAvatar
_08086CA0: .4byte gMapObjects
_08086CA4: .4byte gSprites
	thumb_func_end sub_80867AC

	thumb_func_start sub_8086854
sub_8086854: @ 8086CA8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08086CBC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086CBC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086854

	thumb_func_start sub_8086870
sub_8086870: @ 8086CC4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08086D28 @ =gPlayerAvatar
	ldrb r0, [r6, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08086D2C @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08086D30 @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	movs r1, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0xC]
	ldr r2, _08086D34 @ =gMapObjects
	ldrb r0, [r6, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x2B
	bl PlaySE
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086D28: .4byte gPlayerAvatar
_08086D2C: .4byte gSprites
_08086D30: .4byte gSpriteCoordOffsetY
_08086D34: .4byte gMapObjects
	thumb_func_end sub_8086870

	thumb_func_start sub_80868E4
sub_80868E4: @ 8086D38
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r2, _08086DE4 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086DE8 @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086DEC @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _08086D7A
	ldrh r1, [r4, 0xC]
	adds r0, r2, r1
	strh r0, [r4, 0xC]
	movs r1, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08086D7A
	lsls r0, r2, 1
	strh r0, [r4, 0xA]
_08086D7A:
	ldrh r2, [r4, 0xE]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086DB8
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _08086DB8
	adds r0, r2, 0x1
	strh r0, [r4, 0xE]
	ldrb r1, [r6, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x3]
	ldrb r1, [r4, 0x10]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
_08086DB8:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08086DDC
	movs r0, 0xD6
	bl PlaySE
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086DDC:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086DE4: .4byte gPlayerAvatar
_08086DE8: .4byte gMapObjects
_08086DEC: .4byte gSprites
	thumb_func_end sub_80868E4

	thumb_func_start sub_808699C
sub_808699C: @ 8086DF0
	push {lr}
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0, 0x8]
	movs r1, 0x4
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_808699C

	thumb_func_start sub_80869B8
sub_80869B8: @ 8086E0C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08086E34
	lsls r0, r2, 16
	asrs r0, 17
	strh r0, [r4, 0xA]
_08086E34:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086E42
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086E42:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80869B8

	thumb_func_start sub_80869F8
sub_80869F8: @ 8086E4C
	push {lr}
	ldr r1, _08086E78 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl sub_806451C
	bl InstallCameraPanAheadCallback
	ldr r0, _08086E7C @ =sub_8086774
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086E78: .4byte gPlayerAvatar
_08086E7C: .4byte sub_8086774
	thumb_func_end sub_80869F8

	thumb_func_start sub_8086A2C
sub_8086A2C: @ 8086E80
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08086EB4 @ =sub_8086A68
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086EB8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	cmp r4, 0x6A
	bne _08086EAC
	movs r0, 0x1
	strh r0, [r1, 0xA]
_08086EAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086EB4: .4byte sub_8086A68
_08086EB8: .4byte gTasks
	thumb_func_end sub_8086A2C

	thumb_func_start sub_8086A68
sub_8086A68: @ 8086EBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086EEC @ =gTasks
	adds r4, r1, r0
	ldr r5, _08086EF0 @ =gUnknown_0839F2E8
_08086ECE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086ECE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086EEC: .4byte gTasks
_08086EF0: .4byte gUnknown_0839F2E8
	thumb_func_end sub_8086A68

	thumb_func_start sub_8086AA0
sub_8086AA0: @ 8086EF4
	push {r4,lr}
	adds r4, r0, 0
	bl player_bitmagic
	bl CameraObjectReset2
	ldrb r0, [r4, 0xA]
	bl sub_80B4824
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086AA0

	thumb_func_start sub_8086AC0
sub_8086AC0: @ 8086F14
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086F7C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F80 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08086F3E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086F72
_08086F3E:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
	strh r1, [r5, 0xE]
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _08086F6C
	movs r0, 0x4
	strh r0, [r5, 0x8]
_08086F6C:
	movs r0, 0x50
	bl PlaySE
_08086F72:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086F7C: .4byte gPlayerAvatar
_08086F80: .4byte gMapObjects
	thumb_func_end sub_8086AC0

	thumb_func_start sub_8086B30
sub_8086B30: @ 8086F84
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086B98
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _08086F9E
	bl sub_8086C30
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086F9E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086B30

	thumb_func_start sub_8086B54
sub_8086B54: @ 8086FA8
	push {lr}
	bl sub_8086B98
	bl sub_8086C40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8086B54

	thumb_func_start sub_8086B64
sub_8086B64: @ 8086FB8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086BE4
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _08086FD2
	bl sub_8086C30
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086FD2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086B64

	thumb_func_start sub_8086B88
sub_8086B88: @ 8086FDC
	push {lr}
	bl sub_8086BE4
	bl sub_8086C40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8086B88

	thumb_func_start sub_8086B98
sub_8086B98: @ 8086FEC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08087030 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087034 @ =gSprites
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808702A
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_0808702A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087030: .4byte gPlayerAvatar
_08087034: .4byte gSprites
	thumb_func_end sub_8086B98

	thumb_func_start sub_8086BE4
sub_8086BE4: @ 8087038
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _0808707C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087080 @ =gSprites
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08087076
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08087076:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808707C: .4byte gPlayerAvatar
_08087080: .4byte gSprites
	thumb_func_end sub_8086BE4

	thumb_func_start sub_8086C30
sub_8086C30: @ 8087084
	push {lr}
	bl sub_8053FF8
	bl sub_8080918
	pop {r0}
	bx r0
	thumb_func_end sub_8086C30

	thumb_func_start sub_8086C40
sub_8086C40: @ 8087094
	push {lr}
	ldr r0, _080870D4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080870D0
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080870D0
	bl sub_80B483C
	bl warp_in
	ldr r1, _080870D8 @ =gUnknown_0300485C
	ldr r0, _080870DC @ =sub_8086C94
	str r0, [r1]
	ldr r0, _080870E0 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _080870E4 @ =sub_8086A68
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080870D0:
	pop {r0}
	bx r0
	.align 2, 0
_080870D4: .4byte gPaletteFade
_080870D8: .4byte gUnknown_0300485C
_080870DC: .4byte sub_8086C94
_080870E0: .4byte CB2_LoadMap
_080870E4: .4byte sub_8086A68
	thumb_func_end sub_8086C40

	thumb_func_start sub_8086C94
sub_8086C94: @ 80870E8
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	ldr r0, _08087108 @ =sub_8086CBC
	movs r1, 0
	bl CreateTask
	ldr r1, _0808710C @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08087108: .4byte sub_8086CBC
_0808710C: .4byte gUnknown_0300485C
	thumb_func_end sub_8086C94

	thumb_func_start sub_8086CBC
sub_8086CBC: @ 8087110
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08087140 @ =gTasks
	adds r4, r1, r0
	ldr r5, _08087144 @ =gUnknown_0839F300
_08087122:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08087122
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087140: .4byte gTasks
_08087144: .4byte gUnknown_0839F300
	thumb_func_end sub_8086CBC

	thumb_func_start sub_8086CF4
sub_8086CF4: @ 8087148
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl CameraObjectReset2
	ldr r0, _080871A8 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080871AC @ =gMapObjects
	adds r4, r0
	movs r0, 0x4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
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
	lsrs r1, r0, 24
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x10
	strh r0, [r5, 0xA]
	cmp r1, 0x6B
	bne _080871B0
	movs r1, 0x1
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080871B2
	.align 2, 0
_080871A8: .4byte gPlayerAvatar
_080871AC: .4byte gMapObjects
_080871B0:
	movs r1, 0
_080871B2:
	adds r0, r1, 0
	bl sub_80B4824
	movs r0, 0x1
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8086CF4

	thumb_func_start sub_8086D70
sub_8086D70: @ 80871C4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080871FC @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08087200 @ =gSprites
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080871FC: .4byte gPlayerAvatar
_08087200: .4byte gSprites
	thumb_func_end sub_8086D70

	thumb_func_start sub_8086DB0
sub_8086DB0: @ 8087204
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _0808725C @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087260 @ =gSprites
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08087242
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08087242:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08087252
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	movs r0, 0x5
	strh r0, [r4, 0x8]
_08087252:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808725C: .4byte gPlayerAvatar
_08087260: .4byte gSprites
	thumb_func_end sub_8086DB0

	thumb_func_start sub_8086E10
sub_8086E10: @ 8087264
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _0808729C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080872A0 @ =gSprites
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808729C: .4byte gPlayerAvatar
_080872A0: .4byte gSprites
	thumb_func_end sub_8086E10

	thumb_func_start sub_8086E50
sub_8086E50: @ 80872A4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080872FC @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087300 @ =gSprites
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080872E2
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_080872E2:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080872F4
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080872F4:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080872FC: .4byte gPlayerAvatar
_08087300: .4byte gSprites
	thumb_func_end sub_8086E50

	thumb_func_start sub_8086EB0
sub_8086EB0: @ 8087304
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80B4850
	lsls r0, 24
	cmp r0, 0
	bne _08087320
	bl sub_80B483C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08087322
_08087320:
	movs r0, 0
_08087322:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086EB0

	thumb_func_start sub_8086ED4
sub_8086ED4: @ 8087328
	push {r4,lr}
	ldr r0, _08087374 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087378 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808736C
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	movs r0, 0x4
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _0808737C @ =sub_8086CBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808736C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087374: .4byte gPlayerAvatar
_08087378: .4byte gMapObjects
_0808737C: .4byte sub_8086CBC
	thumb_func_end sub_8086ED4

	thumb_func_start FldEff_UseWaterfall
FldEff_UseWaterfall: @ 8087380
	push {r4,lr}
	ldr r4, _080873AC @ =sub_8086F64
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080873B0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080873B4 @ =gUnknown_0202FF84
	ldr r2, [r2]
	strh r2, [r1, 0xA]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080873AC: .4byte sub_8086F64
_080873B0: .4byte gTasks
_080873B4: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseWaterfall

	thumb_func_start sub_8086F64
sub_8086F64: @ 80873B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080873F4 @ =gUnknown_0839F31C
	ldr r2, _080873F8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080873CA:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _080873FC @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087400 @ =gMapObjects
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _080873CA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080873F4: .4byte gUnknown_0839F31C
_080873F8: .4byte gTasks
_080873FC: .4byte gPlayerAvatar
_08087400: .4byte gMapObjects
	thumb_func_end sub_8086F64

	thumb_func_start sub_8086FB0
sub_8086FB0: @ 8087404
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08087420 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087420: .4byte gPlayerAvatar
	thumb_func_end sub_8086FB0

	thumb_func_start waterfall_1_do_anim_probably
waterfall_1_do_anim_probably: @ 8087424
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl ScriptContext2_Enable
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08087454
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldr r1, _0808745C @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087454:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808745C: .4byte gUnknown_0202FF84
	thumb_func_end waterfall_1_do_anim_probably

	thumb_func_start waterfall_2_wait_anim_finish_probably
waterfall_2_wait_anim_finish_probably: @ 8087460
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _0808747A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _0808747C
_0808747A:
	movs r0, 0
_0808747C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end waterfall_2_wait_anim_finish_probably

	thumb_func_start sub_8087030
sub_8087030: @ 8087484
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0x2
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8087030

	thumb_func_start sub_8087058
sub_8087058: @ 80874AC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	bne _080874C2
	movs r0, 0
	b _080874FE
_080874C2:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080874F8
	bl ScriptContext2_Disable
	ldr r0, _080874F0 @ =gPlayerAvatar
	strb r4, [r0, 0x6]
	ldr r0, _080874F4 @ =sub_8086F64
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2B
	bl FieldEffectActiveListRemove
	movs r0, 0
	b _080874FE
	.align 2, 0
_080874F0: .4byte gPlayerAvatar
_080874F4: .4byte sub_8086F64
_080874F8:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	movs r0, 0x1
_080874FE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8087058

	thumb_func_start FldEff_UseDive
FldEff_UseDive: @ 8087504
	push {r4,lr}
	ldr r4, _08087534 @ =Task_Dive
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08087538 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _0808753C @ =gUnknown_0202FF84
	ldr r2, [r3]
	strh r2, [r1, 0x26]
	ldr r2, [r3, 0x4]
	strh r2, [r1, 0x24]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087534: .4byte Task_Dive
_08087538: .4byte gTasks
_0808753C: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseDive

	thumb_func_start Task_Dive
Task_Dive: @ 8087540
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08087570 @ =gUnknown_0839F330
	ldr r2, _08087574 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087552:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08087552
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087570: .4byte gUnknown_0839F330
_08087574: .4byte gTasks
	thumb_func_end Task_Dive

	thumb_func_start sub_8087124
sub_8087124: @ 8087578
	ldr r2, _08087588 @ =gPlayerAvatar
	movs r1, 0x1
	strb r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_08087588: .4byte gPlayerAvatar
	thumb_func_end sub_8087124

	thumb_func_start dive_2_unknown
dive_2_unknown: @ 808758C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _080875B0 @ =gUnknown_0202FF84
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080875B0: .4byte gUnknown_0202FF84
	thumb_func_end dive_2_unknown

	thumb_func_start dive_3_unknown
dive_3_unknown: @ 80875B4
	push {lr}
	sub sp, 0x8
	mov r1, sp
	adds r1, 0x2
	mov r0, sp
	bl PlayerGetDestCoords
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080875F8
	ldr r2, _08087600 @ =gMapObjects
	ldr r0, _08087604 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1E]
	mov r0, sp
	bl dive_warp
	ldr r0, _08087608 @ =Task_Dive
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2C
	bl FieldEffectActiveListRemove
_080875F8:
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_08087600: .4byte gMapObjects
_08087604: .4byte gPlayerAvatar
_08087608: .4byte Task_Dive
	thumb_func_end dive_3_unknown

	thumb_func_start sub_80871B8
sub_80871B8: @ 808760C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08087620 @ =sub_80871D0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087620: .4byte sub_80871D0
	thumb_func_end sub_80871B8

	thumb_func_start sub_80871D0
sub_80871D0: @ 8087624
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0808766C @ =gUnknown_0839F33C
	ldr r2, _08087670 @ =gTasks
	ldr r5, _08087674 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087638:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087678 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0808767C @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08087638
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808766C: .4byte gUnknown_0839F33C
_08087670: .4byte gTasks
_08087674: .4byte gPlayerAvatar
_08087678: .4byte gMapObjects
_0808767C: .4byte gSprites
	thumb_func_end sub_80871D0

	thumb_func_start sub_808722C
sub_808722C: @ 8087680
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl player_bitmagic
	bl CameraObjectReset2
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r0, _080876B4 @ =gPlayerAvatar
	movs r2, 0x1
	strb r2, [r0, 0x6]
	ldrb r0, [r5, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x3]
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080876B4: .4byte gPlayerAvatar
	thumb_func_end sub_808722C

	thumb_func_start sub_8087264
sub_8087264: @ 80876B8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080876E4
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080876E4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8087264

	thumb_func_start sub_8087298
sub_8087298: @ 80876EC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r3, _08087734 @ =gUnknown_0202FF84
	movs r5, 0x10
	ldrsh r0, [r1, r5]
	str r0, [r3]
	movs r5, 0x12
	ldrsh r0, [r1, r5]
	str r0, [r3, 0x4]
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r2, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x32
	bl FieldEffectStart
	movs r0, 0xB2
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087734: .4byte gUnknown_0202FF84
	thumb_func_end sub_8087298

	thumb_func_start sub_80872E4
sub_80872E4: @ 8087738
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x11
	bgt _08087772
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _08087784
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _08087784
	lsls r0, r2, 1
	b _08087782
_08087772:
	movs r0, 0x4
	ands r1, r0
	cmp r1, 0
	bne _08087784
	lsls r0, r2, 16
	cmp r0, 0
	ble _08087784
	asrs r0, 17
_08087782:
	strh r0, [r4, 0xA]
_08087784:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _080877D0
	adds r0, r5, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r2, r1, 17
	negs r2, r2
	movs r7, 0x26
	ldrsh r3, [r5, r7]
	movs r7, 0x22
	ldrsh r0, [r5, r7]
	adds r0, r1
	ldr r1, _080877C8 @ =gSpriteCoordOffsetY
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r0, r1
	asrs r2, 16
	adds r0, r2
	cmn r3, r0
	ble _080877CC
	ldrh r0, [r5, 0x26]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _080877D0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080877D0
	.align 2, 0
_080877C8: .4byte gSpriteCoordOffsetY
_080877CC:
	movs r0, 0x1
	strh r0, [r4, 0x10]
_080877D0:
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808780E
	movs r7, 0x26
	ldrsh r1, [r5, r7]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _0808780E
	adds r0, r2, 0x1
	strh r0, [r4, 0x12]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_0808780E:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08087824
	movs r7, 0x10
	ldrsh r0, [r4, r7]
	cmp r0, 0
	beq _08087824
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087824:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80872E4

	thumb_func_start sub_80873D8
sub_80873D8: @ 808782C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8053FF8
	bl sub_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80873D8

	thumb_func_start sub_80873F4
sub_80873F4: @ 8087848
	push {lr}
	ldr r0, _08087888 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087880
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08087880
	bl warp_in
	ldr r1, _0808788C @ =gUnknown_0300485C
	ldr r0, _08087890 @ =mapldr_080851BC
	str r0, [r1]
	ldr r0, _08087894 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08087898 @ =sub_80871D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08087880:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087888: .4byte gPaletteFade
_0808788C: .4byte gUnknown_0300485C
_08087890: .4byte mapldr_080851BC
_08087894: .4byte CB2_LoadMap
_08087898: .4byte sub_80871D0
	thumb_func_end sub_80873F4

	thumb_func_start mapldr_080851BC
mapldr_080851BC: @ 808789C
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	ldr r0, _080878BC @ =gUnknown_0300485C
	movs r1, 0
	str r1, [r0]
	ldr r0, _080878C0 @ =sub_8087470
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080878BC: .4byte gUnknown_0300485C
_080878C0: .4byte sub_8087470
	thumb_func_end mapldr_080851BC

	thumb_func_start sub_8087470
sub_8087470: @ 80878C4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0808790C @ =gUnknown_0839F354
	ldr r2, _08087910 @ =gTasks
	ldr r5, _08087914 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080878D8:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087918 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0808791C @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080878D8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808790C: .4byte gUnknown_0839F354
_08087910: .4byte gTasks
_08087914: .4byte gPlayerAvatar
_08087918: .4byte gMapObjects
_0808791C: .4byte gSprites
	thumb_func_end sub_8087470

	thumb_func_start sub_80874CC
sub_80874CC: @ 8087920
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl CameraObjectReset2
	bl player_bitmagic
	ldr r1, _0808794C @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808794C: .4byte gPlayerAvatar
	thumb_func_end sub_80874CC

	thumb_func_start sub_80874FC
sub_80874FC: @ 8087950
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087990
	ldr r1, _08087998 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087990:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08087998: .4byte gUnknown_0202FF84
	thumb_func_end sub_80874FC

	thumb_func_start sub_8087548
sub_8087548: @ 808799C
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080879EC @ =gSprites
	adds r0, r1
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _080879E4
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl CameraObjectReset1
	movs r0, 0xAF
	bl PlaySE
	movs r0, 0x4
	bl sub_80608A4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
_080879E4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080879EC: .4byte gSprites
	thumb_func_end sub_8087548

	thumb_func_start sub_808759C
sub_808759C: @ 80879F0
	push {lr}
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087A1A
	ldr r1, _08087A20 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl sub_806451C
	ldr r0, _08087A24 @ =sub_8087470
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08087A1A:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087A20: .4byte gPlayerAvatar
_08087A24: .4byte sub_8087470
	thumb_func_end sub_808759C

	thumb_func_start FldEff_LavaridgeGymWarp
FldEff_LavaridgeGymWarp: @ 8087A28
	push {r4,lr}
	ldr r4, _08087A80 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08087A84 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x84
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08087A88 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087A80: .4byte gUnknown_0202FF84
_08087A84: .4byte gFieldEffectObjectTemplatePointers
_08087A88: .4byte gSprites
	thumb_func_end FldEff_LavaridgeGymWarp

	thumb_func_start sub_8087638
sub_8087638: @ 8087A8C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08087AA4
	adds r0, r2, 0
	movs r1, 0x32
	bl FieldEffectStop
_08087AA4:
	pop {r0}
	bx r0
	thumb_func_end sub_8087638

	thumb_func_start sub_8087654
sub_8087654: @ 8087AA8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08087ABC @ =sub_808766C
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087ABC: .4byte sub_808766C
	thumb_func_end sub_8087654

	thumb_func_start sub_808766C
sub_808766C: @ 8087AC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08087B08 @ =gUnknown_0839F364
	ldr r2, _08087B0C @ =gTasks
	ldr r5, _08087B10 @ =gPlayerAvatar
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087AD4:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087B14 @ =gMapObjects
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08087B18 @ =gSprites
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08087AD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087B08: .4byte gUnknown_0839F364
_08087B0C: .4byte gTasks
_08087B10: .4byte gPlayerAvatar
_08087B14: .4byte gMapObjects
_08087B18: .4byte gSprites
	thumb_func_end sub_808766C

	thumb_func_start sub_80876C8
sub_80876C8: @ 8087B1C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl player_bitmagic
	bl CameraObjectReset2
	ldr r1, _08087B48 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087B48: .4byte gPlayerAvatar
	thumb_func_end sub_80876C8

	thumb_func_start sub_80876F8
sub_80876F8: @ 8087B4C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087BC0
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0x3
	ble _08087BA0
	ldr r1, _08087B9C @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _08087BC0
	.align 2, 0
_08087B9C: .4byte gUnknown_0202FF84
_08087BA0:
	adds r0, r1, 0x1
	strh r0, [r5, 0xA]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x27
	bl PlaySE
_08087BC0:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80876F8

	thumb_func_start sub_8087774
sub_8087774: @ 8087BC8
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r2, _08087BFC @ =gSprites
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08087BF2
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08087BF2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087BFC: .4byte gSprites
	thumb_func_end sub_8087774

	thumb_func_start sub_80877AC
sub_80877AC: @ 8087C00
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08087C1E
	bl sub_8053FF8
	bl sub_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087C1E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80877AC

	thumb_func_start sub_80877D4
sub_80877D4: @ 8087C28
	push {lr}
	ldr r0, _08087C68 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087C60
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08087C60
	bl warp_in
	ldr r1, _08087C6C @ =gUnknown_0300485C
	ldr r0, _08087C70 @ =sub_8086748
	str r0, [r1]
	ldr r0, _08087C74 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08087C78 @ =sub_808766C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08087C60:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087C68: .4byte gPaletteFade
_08087C6C: .4byte gUnknown_0300485C
_08087C70: .4byte sub_8086748
_08087C74: .4byte CB2_LoadMap
_08087C78: .4byte sub_808766C
	thumb_func_end sub_80877D4

	thumb_func_start FldEff_PopOutOfAsh
FldEff_PopOutOfAsh: @ 8087C7C
	push {r4,lr}
	ldr r4, _08087CD4 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08087CD8 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x80
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08087CDC @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087CD4: .4byte gUnknown_0202FF84
_08087CD8: .4byte gFieldEffectObjectTemplatePointers
_08087CDC: .4byte gSprites
	thumb_func_end FldEff_PopOutOfAsh

	thumb_func_start sub_808788C
sub_808788C: @ 8087CE0
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08087CF8
	adds r0, r2, 0
	movs r1, 0x31
	bl FieldEffectStop
_08087CF8:
	pop {r0}
	bx r0
	thumb_func_end sub_808788C

	thumb_func_start sub_80878A8
sub_80878A8: @ 8087CFC
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _08087D14 @ =sub_80878C4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087D14: .4byte sub_80878C4
	thumb_func_end sub_80878A8

	thumb_func_start sub_80878C4
sub_80878C4: @ 8087D18
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087D40 @ =gUnknown_0839F378
	ldr r2, _08087D44 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087D40: .4byte gUnknown_0839F378
_08087D44: .4byte gTasks
	thumb_func_end sub_80878C4

	thumb_func_start sub_80878F4
sub_80878F4: @ 8087D48
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x40
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80878F4

	thumb_func_start sub_8087914
sub_8087914: @ 8087D68
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087E0C @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldrh r1, [r4, 0x24]
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087D94
	subs r0, r1, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _08087D94
	bl sub_8053FF8
	bl sub_8080918
_08087D94:
	ldr r0, _08087E10 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087E14 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08087DBA
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087E74
_08087DBA:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08087E2C
	ldr r0, _08087E18 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087E2C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08087E2C
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetDirection
	bl sub_8053678
	bl warp_in
	ldr r1, _08087E1C @ =gUnknown_0300485C
	ldr r0, _08087E20 @ =mapldr_080859D4
	str r0, [r1]
	ldr r0, _08087E24 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r0, _08087E28 @ =sub_80878C4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08087E74
	.align 2, 0
_08087E0C: .4byte gUnknown_0839F380
_08087E10: .4byte gPlayerAvatar
_08087E14: .4byte gMapObjects
_08087E18: .4byte gPaletteFade
_08087E1C: .4byte gUnknown_0300485C
_08087E20: .4byte mapldr_080859D4
_08087E24: .4byte CB2_LoadMap
_08087E28: .4byte sub_80878C4
_08087E2C:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087E40
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087E74
_08087E40:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r0, [r0]
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0xB
	bgt _08087E68
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
_08087E68:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 18
	movs r0, 0x8
	asrs r0, r1
	strh r0, [r4, 0xA]
_08087E74:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8087914

	thumb_func_start mapldr_080859D4
mapldr_080859D4: @ 8087E7C
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08087EB8 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	ldr r2, _08087EBC @ =gMapObjects
	ldr r0, _08087EC0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, _08087EC4 @ =sub_8087A74
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087EB8: .4byte gUnknown_0300485C
_08087EBC: .4byte gMapObjects
_08087EC0: .4byte gPlayerAvatar
_08087EC4: .4byte sub_8087A74
	thumb_func_end mapldr_080859D4

	thumb_func_start sub_8087A74
sub_8087A74: @ 8087EC8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087EF0 @ =gUnknown_0839F388
	ldr r2, _08087EF4 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087EF0: .4byte gUnknown_0839F388
_08087EF4: .4byte gTasks
	thumb_func_end sub_8087A74

	thumb_func_start sub_8087AA4
sub_8087AA4: @ 8087EF8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087F16
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
_08087F16:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087AA4

	thumb_func_start sub_8087AC8
sub_8087AC8: @ 8087F1C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _08087FA0 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08087FA4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087FA8 @ =gMapObjects
	adds r6, r0, r1
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08087F4E
	subs r0, r1, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087FE0
_08087F4E:
	adds r0, r6, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08087F66
	adds r0, r6, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087FF4
_08087F66:
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08087FB0
	movs r2, 0x26
	ldrsh r4, [r5, r2]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08087FB0
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	bl ScriptContext2_Disable
	bl sub_806451C
	ldr r0, _08087FAC @ =sub_8087A74
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08087FF4
	.align 2, 0
_08087FA0: .4byte gUnknown_0839F380
_08087FA4: .4byte gPlayerAvatar
_08087FA8: .4byte gMapObjects
_08087FAC: .4byte sub_8087A74
_08087FB0:
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r0, [r0]
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x1F
	bgt _08087FD8
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
_08087FD8:
	ldrh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 18
	strh r0, [r5, 0xA]
_08087FE0:
	ldrb r2, [r6, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
_08087FF4:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8087AC8

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087FFC
	push {lr}
	ldr r0, _0808800C @ =sub_8087BBC
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808800C: .4byte sub_8087BBC
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BBC
sub_8087BBC: @ 8088010
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088038 @ =gUnknown_0839F390
	ldr r2, _0808803C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088038: .4byte gUnknown_0839F390
_0808803C: .4byte gTasks
	thumb_func_end sub_8087BBC

	thumb_func_start sub_8087BEC
sub_8087BEC: @ 8088040
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl CameraObjectReset2
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087BEC

	thumb_func_start sub_8087C14
sub_8087C14: @ 8088068
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080880EC @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _080880F0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080880F4 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0808809A
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _080880B4
_0808809A:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080880B4:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _080880E2
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _080880E2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0xA]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	movs r0, 0x2D
	bl PlaySE
_080880E2:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080880EC: .4byte gUnknown_0839F380
_080880F0: .4byte gPlayerAvatar
_080880F4: .4byte gMapObjects
	thumb_func_end sub_8087C14

	thumb_func_start sub_8087CA4
sub_8087CA4: @ 80880F8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080881BC @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _080881C0 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080881C4 @ =gMapObjects
	adds r3, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080881C8 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08088142
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, 0
	bl FieldObjectTurn
_08088142:
	ldrh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r0, r1, r2
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _0808816E
	movs r0, 0x4
	strh r0, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _0808816E
	lsls r0, r1, 1
	strh r0, [r4, 0xE]
_0808816E:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _0808819C
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0808819C
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_0808819C:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xA7
	ble _080881B2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8053FF8
	bl sub_8080918
_080881B2:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080881BC: .4byte gUnknown_0839F380
_080881C0: .4byte gPlayerAvatar
_080881C4: .4byte gMapObjects
_080881C8: .4byte gSprites
	thumb_func_end sub_8087CA4

	thumb_func_start sub_8087D78
sub_8087D78: @ 80881CC
	push {lr}
	ldr r0, _0808820C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08088208
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08088208
	bl sub_8053570
	bl warp_in
	ldr r0, _08088210 @ =CB2_LoadMap
	bl SetMainCallback2
	ldr r1, _08088214 @ =gUnknown_0300485C
	ldr r0, _08088218 @ =mapldr_08085D88
	str r0, [r1]
	ldr r0, _0808821C @ =sub_8087BBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088208:
	pop {r0}
	bx r0
	.align 2, 0
_0808820C: .4byte gPaletteFade
_08088210: .4byte CB2_LoadMap
_08088214: .4byte gUnknown_0300485C
_08088218: .4byte mapldr_08085D88
_0808821C: .4byte sub_8087BBC
	thumb_func_end sub_8087D78

	thumb_func_start mapldr_08085D88
mapldr_08085D88: @ 8088220
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08088260 @ =gUnknown_0300485C
	movs r0, 0
	str r0, [r1]
	ldr r2, _08088264 @ =gMapObjects
	ldr r0, _08088268 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl CameraObjectReset2
	ldr r0, _0808826C @ =sub_8087E1C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08088260: .4byte gUnknown_0300485C
_08088264: .4byte gMapObjects
_08088268: .4byte gPlayerAvatar
_0808826C: .4byte sub_8087E1C
	thumb_func_end mapldr_08085D88

	thumb_func_start sub_8087E1C
sub_8087E1C: @ 8088270
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088298 @ =gUnknown_0839F3A0
	ldr r2, _0808829C @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088298: .4byte gUnknown_0839F3A0
_0808829C: .4byte gTasks
	thumb_func_end sub_8087E1C

	thumb_func_start sub_8087E4C
sub_8087E4C: @ 80882A0
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08088316
	ldr r5, _0808831C @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08088320 @ =gSprites
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08088324 @ =gSpriteCoordOffsetY
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	strh r0, [r2, 0x26]
	ldr r3, _08088328 @ =gMapObjects
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x8
	strh r0, [r6, 0xA]
	movs r0, 0x1
	strh r0, [r6, 0xC]
	adds r2, 0x42
	ldrb r0, [r2]
	lsrs r0, 6
	strh r0, [r6, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	movs r0, 0x2D
	bl PlaySE
_08088316:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808831C: .4byte gPlayerAvatar
_08088320: .4byte gSprites
_08088324: .4byte gSpriteCoordOffsetY
_08088328: .4byte gMapObjects
	thumb_func_end sub_8087E4C

	thumb_func_start sub_8087ED8
sub_8087ED8: @ 808832C
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08088394 @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08088398 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808839C @ =gMapObjects
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080883A0 @ =gSprites
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _080883A4
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080883CA
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, 0x24]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080883CA
	.align 2, 0
_08088394: .4byte gUnknown_0839F380
_08088398: .4byte gPlayerAvatar
_0808839C: .4byte gMapObjects
_080883A0: .4byte gSprites
_080883A4:
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _080883CA
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_080883CA:
	ldrh r2, [r5, 0x26]
	movs r3, 0x26
	ldrsh r1, [r5, r3]
	movs r0, 0x30
	negs r0, r0
	cmp r1, r0
	blt _080883EE
	ldrh r1, [r4, 0xA]
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	ble _080883EE
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080883EE
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
_080883EE:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	movs r7, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08088410
	movs r0, 0x4
	strh r0, [r4, 0xC]
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, 0
	bl FieldObjectTurn
_08088410:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08088426
	strh r7, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r7, [r4, 0xC]
_08088426:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8087ED8

	thumb_func_start sub_8087FDC
sub_8087FDC: @ 8088430
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080884AC @ =gUnknown_0839F380
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _080884B0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080884B4 @ =gMapObjects
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _080884A4
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080884A4
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _080884A4
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl sub_806451C
	ldr r0, _080884B8 @ =sub_8087E1C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080884A4:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080884AC: .4byte gUnknown_0839F380
_080884B0: .4byte gPlayerAvatar
_080884B4: .4byte gMapObjects
_080884B8: .4byte sub_8087E1C
	thumb_func_end sub_8087FDC

	thumb_func_start FldEff_FieldMoveShowMon
FldEff_FieldMoveShowMon: @ 80884BC
	push {r4,lr}
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080884DC
	ldr r0, _080884D8 @ =sub_8088120
	b _080884DE
	.align 2, 0
_080884D8: .4byte sub_8088120
_080884DC:
	ldr r0, _0808850C @ =sub_808847C
_080884DE:
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _08088510 @ =gUnknown_0202FF84
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_8088830
	ldr r2, _08088514 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x26]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808850C: .4byte sub_808847C
_08088510: .4byte gUnknown_0202FF84
_08088514: .4byte gTasks
	thumb_func_end FldEff_FieldMoveShowMon

	thumb_func_start FldEff_FieldMoveShowMonInit
FldEff_FieldMoveShowMonInit: @ 8088518
	push {r4-r6,lr}
	ldr r5, _0808856C @ =gUnknown_0202FF84
	ldr r0, [r5]
	movs r6, 0x80
	lsls r6, 24
	ands r6, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _08088570 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	str r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, 0x6
	bl FieldEffectStart
	movs r0, 0x3B
	bl FieldEffectActiveListRemove
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808856C: .4byte gUnknown_0202FF84
_08088570: .4byte gPlayerParty
	thumb_func_end FldEff_FieldMoveShowMonInit

	thumb_func_start sub_8088120
sub_8088120: @ 8088574
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0808859C @ =gUnknown_0839F3AC
	ldr r2, _080885A0 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0808859C: .4byte gUnknown_0839F3AC
_080885A0: .4byte gTasks
	thumb_func_end sub_8088120

	thumb_func_start sub_8088150
sub_8088150: @ 80885A4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080885F4 @ =0x04000048
	ldrh r0, [r6]
	strh r0, [r4, 0x1E]
	ldr r5, _080885F8 @ =0x0400004a
	ldrh r0, [r5]
	strh r0, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080885FC @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r1, _08088600 @ =0x0000f0f1
	strh r1, [r4, 0xA]
	ldr r0, _08088604 @ =0x00005051
	strh r0, [r4, 0xC]
	movs r0, 0x3F
	strh r0, [r4, 0xE]
	movs r0, 0x3E
	strh r0, [r4, 0x10]
	ldr r0, _08088608 @ =0x04000040
	strh r1, [r0]
	ldr r1, _0808860C @ =0x04000044
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r0, [r4, 0xE]
	strh r0, [r6]
	ldrh r0, [r4, 0x10]
	strh r0, [r5]
	ldr r0, _08088610 @ =sub_80883DC
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080885F4: .4byte 0x04000048
_080885F8: .4byte 0x0400004a
_080885FC: .4byte gMain
_08088600: .4byte 0x0000f0f1
_08088604: .4byte 0x00005051
_08088608: .4byte 0x04000040
_0808860C: .4byte 0x04000044
_08088610: .4byte sub_80883DC
	thumb_func_end sub_8088150

	thumb_func_start sub_80881C0
sub_80881C0: @ 8088614
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _0808866C @ =0x04000008
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	ldr r0, _08088670 @ =gFieldMoveStreaksTiles
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x80
	lsls r2, 1
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	adds r5, r4, r5
	ldr r2, _08088674 @ =0x05000200
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _08088678 @ =gFieldMoveStreaksPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl sub_808843C
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808866C: .4byte 0x04000008
_08088670: .4byte gFieldMoveStreaksTiles
_08088674: .4byte 0x05000200
_08088678: .4byte gFieldMoveStreaksPalette
	thumb_func_end sub_80881C0

	thumb_func_start sub_8088228
sub_8088228: @ 808867C
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r6, [r3, 0xA]
	ldrh r2, [r3, 0xC]
	movs r7, 0xFF
	lsrs r1, r6, 8
	subs r1, 0x10
	lsls r1, 16
	lsrs r0, r2, 8
	subs r0, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r7, 0
	ands r0, r2
	adds r5, r0, 0x2
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080886A8
	movs r2, 0
_080886A8:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _080886B2
	movs r4, 0x28
_080886B2:
	cmp r5, 0x78
	ble _080886B8
	movs r5, 0x78
_080886B8:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 8
	adds r0, r7, 0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, 0xA]
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r4, 8
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r3, 0xC]
	cmp r2, 0
	bne _080886F8
	cmp r4, 0x28
	bne _080886F8
	cmp r1, 0x78
	bne _080886F8
	ldr r2, _08088700 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08088704 @ =sub_8088890
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080886F8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088700: .4byte gSprites
_08088704: .4byte sub_8088890
	thumb_func_end sub_8088228

	thumb_func_start sub_80882B4
sub_80882B4: @ 8088708
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldr r2, _08088734 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0808872E
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0808872E:
	pop {r0}
	bx r0
	.align 2, 0
_08088734: .4byte gSprites
	thumb_func_end sub_80882B4

	thumb_func_start sub_80882E4
sub_80882E4: @ 8088738
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r2, [r3, 0xC]
	lsls r1, r2, 16
	movs r0, 0xFF
	asrs r1, 24
	adds r1, 0x6
	lsls r1, 16
	ands r0, r2
	subs r0, 0x6
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r4, r1, 16
	asrs r1, 16
	cmp r1, 0x50
	ble _08088760
	movs r4, 0x50
_08088760:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	bgt _0808876A
	movs r2, 0x51
_0808876A:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r0, 8
	lsls r2, 16
	asrs r2, 16
	orrs r1, r2
	strh r1, [r3, 0xC]
	cmp r0, 0x50
	bne _08088786
	cmp r2, 0x51
	bne _08088786
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08088786:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80882E4

	thumb_func_start sub_8088338
sub_8088338: @ 808878C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _080887CC @ =0x04000008
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _080887D0 @ =0x05000200
	mov r0, sp
	bl CpuSet
	movs r0, 0xF1
	strh r0, [r4, 0xA]
	movs r0, 0xA1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1E]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080887CC: .4byte 0x04000008
_080887D0: .4byte 0x05000200
	thumb_func_end sub_8088338

	thumb_func_start sub_8088380
sub_8088380: @ 80887D4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	ldr r4, _08088824 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088828 @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _0808882C @ =sub_8088120
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088824: .4byte gWindowConfig_81E6CE4
_08088828: .4byte gSprites
_0808882C: .4byte sub_8088120
	thumb_func_end sub_8088380

	thumb_func_start sub_80883DC
sub_80883DC: @ 8088830
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08088884 @ =sub_8088120
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08088888 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _0808888C @ =0x04000040
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x10]
	strh r0, [r1]
	subs r1, 0x3A
	ldrh r0, [r4, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088884: .4byte sub_8088120
_08088888: .4byte gTasks
_0808888C: .4byte 0x04000040
	thumb_func_end sub_80883DC

	thumb_func_start sub_808843C
sub_808843C: @ 8088890
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080888C4 @ =0x06000140
	adds r2, r0, r1
	movs r1, 0
	ldr r5, _080888C8 @ =gFieldMoveStreaksTilemap
	movs r0, 0xF0
	lsls r0, 8
	adds r4, r0, 0
	ldr r3, _080888CC @ =0x0000013f
_080888A6:
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	cmp r1, r3
	bls _080888A6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080888C4: .4byte 0x06000140
_080888C8: .4byte gFieldMoveStreaksTilemap
_080888CC: .4byte 0x0000013f
	thumb_func_end sub_808843C

	thumb_func_start sub_808847C
sub_808847C: @ 80888D0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080888F8 @ =gUnknown_0839F3C8
	ldr r2, _080888FC @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080888F8: .4byte gUnknown_0839F3C8
_080888FC: .4byte gTasks
	thumb_func_end sub_808847C

	thumb_func_start sub_80884AC
sub_80884AC: @ 8088900
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _08088930 @ =0x04000010
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _08088934 @ =gMain
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r0, _08088938 @ =sub_80886B0
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088930: .4byte 0x04000010
_08088934: .4byte gMain
_08088938: .4byte sub_80886B0
	thumb_func_end sub_80884AC

	thumb_func_start sub_80884E8
sub_80884E8: @ 808893C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088998 @ =0x04000008
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	movs r0, 0
	mov r8, r0
	strh r4, [r6, 0x20]
	ldr r0, _0808899C @ =gDarknessFieldMoveStreaksTiles
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r5
	ldr r2, _080889A0 @ =0x05000200
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _080889A4 @ =gDarknessFieldMoveStreaksPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088998: .4byte 0x04000008
_0808899C: .4byte gDarknessFieldMoveStreaksTiles
_080889A0: .4byte 0x05000200
_080889A4: .4byte gDarknessFieldMoveStreaksPalette
	thumb_func_end sub_80884E8

	thumb_func_start sub_8088554
sub_8088554: @ 80889A8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8088708
	lsls r0, 24
	cmp r0, 0
	beq _080889DE
	ldr r1, _080889EC @ =0x04000042
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080889F0 @ =0x00002878
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080889F4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080889F8 @ =sub_8088890
	str r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080889DE:
	adds r0, r4, 0
	bl sub_80886F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080889EC: .4byte 0x04000042
_080889F0: .4byte 0x00002878
_080889F4: .4byte gSprites
_080889F8: .4byte sub_8088890
	thumb_func_end sub_8088554

	thumb_func_start sub_80885A8
sub_80885A8: @ 80889FC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldr r2, _08088A28 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08088A20
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088A20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088A28: .4byte gSprites
	thumb_func_end sub_80885A8

	thumb_func_start sub_80885D8
sub_80885D8: @ 8088A2C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldrh r1, [r4, 0xA]
	movs r0, 0x7
	ands r0, r1
	movs r1, 0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	ldr r0, _08088A58 @ =0x04000042
	ldr r2, _08088A5C @ =0x0000ffff
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088A58: .4byte 0x04000042
_08088A5C: .4byte 0x0000ffff
	thumb_func_end sub_80885D8

	thumb_func_start sub_808860C
sub_808860C: @ 8088A60
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	adds r0, r4, 0
	bl sub_80887C0
	lsls r0, 24
	cmp r0, 0
	beq _08088A7A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088A7A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808860C

	thumb_func_start sub_808862C
sub_808862C: @ 8088A80
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, _08088AF0 @ =0x04000008
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _08088AF4 @ =0x05000200
	mov r0, sp
	bl CpuSet
	adds r0, r5, 0
	adds r0, 0x22
	add r1, sp, 0x4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, 0x4]
	bl SetVBlankCallback
	ldr r4, _08088AF8 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088AFC @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _08088B00 @ =sub_808847C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088AF0: .4byte 0x04000008
_08088AF4: .4byte 0x05000200
_08088AF8: .4byte gWindowConfig_81E6CE4
_08088AFC: .4byte gSprites
_08088B00: .4byte sub_808847C
	thumb_func_end sub_808862C

	thumb_func_start sub_80886B0
sub_80886B0: @ 8088B04
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08088B40 @ =sub_808847C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08088B44 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _08088B48 @ =0x04000010
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088B40: .4byte sub_808847C
_08088B44: .4byte gTasks
_08088B48: .4byte 0x04000010
	thumb_func_end sub_80886B0

	thumb_func_start sub_80886F8
sub_80886F8: @ 8088B4C
	ldrh r1, [r0, 0xA]
	subs r1, 0x10
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xE]
	adds r1, 0x10
	strh r1, [r0, 0xE]
	bx lr
	thumb_func_end sub_80886F8

	thumb_func_start sub_8088708
sub_8088708: @ 8088B5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x10]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08088B78
	movs r0, 0x1
	b _08088BFC
_08088B78:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r3, r0, 19
	movs r1, 0x1F
	ands r3, r1
	movs r4, 0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _08088BFA
	movs r0, 0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r2
	mov r12, r0
	mov r7, r12
	ands r7, r1
	mov r12, r7
	ldrh r0, [r5, 0x20]
	ldr r1, _08088C0C @ =0x06000140
	adds r1, r0
	mov r8, r1
	movs r4, 0
	ldr r7, _08088C10 @ =gDarknessFieldMoveStreaksTilemap
	mov r10, r7
	movs r0, 0xF0
	lsls r0, 8
	mov r9, r0
	adds r1, r3, 0x1
	movs r0, 0x1F
	ands r1, r0
	str r1, [sp]
	mov r6, r12
	adds r6, 0x1
	ands r6, r0
_08088BBC:
	lsls r1, r4, 5
	adds r2, r1, r3
	lsls r2, 1
	add r2, r8
	mov r7, r12
	adds r0, r7, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r7, r9
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, 1
	add r2, r8
	adds r1, r6, r1
	lsls r1, 1
	add r1, r10
	ldrh r0, [r1]
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x9
	bls _08088BBC
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08088BFA:
	movs r0, 0
_08088BFC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08088C0C: .4byte 0x06000140
_08088C10: .4byte gDarknessFieldMoveStreaksTilemap
	thumb_func_end sub_8088708

	thumb_func_start sub_80887C0
sub_80887C0: @ 8088C14
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08088C24
	movs r0, 0x1
	b _08088C78
_08088C24:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _08088C76
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r2, r0, 19
	movs r0, 0x1F
	ands r2, r0
	ldrh r0, [r5, 0x20]
	ldr r1, _08088C80 @ =0x06000140
	adds r6, r0, r1
	movs r3, 0
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
	adds r4, r2, 0x1
	movs r0, 0x1F
	ands r4, r0
_08088C54:
	lsls r0, r3, 5
	adds r1, r0, r2
	lsls r1, 1
	adds r1, r6
	strh r7, [r1]
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _08088C54
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08088C76:
	movs r0, 0
_08088C78:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08088C80: .4byte 0x06000140
	thumb_func_end sub_80887C0

	thumb_func_start sub_8088830
sub_8088830: @ 8088C84
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0x80
	lsls r5, 24
	ands r5, r6
	lsrs r5, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08088CD8 @ =0x7fffffff
	ands r6, r0
	lsls r0, r6, 16
	lsrs r0, 16
	movs r3, 0xA0
	lsls r3, 1
	movs r4, 0x50
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl CreateMonSprite_FieldMove
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088CDC @ =gSprites
	adds r2, r1
	ldr r1, _08088CE0 @ =SpriteCallbackDummy
	str r1, [r2, 0x1C]
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r6, [r2, 0x2E]
	strh r5, [r2, 0x3A]
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088CD8: .4byte 0x7fffffff
_08088CDC: .4byte gSprites
_08088CE0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8088830

	thumb_func_start sub_8088890
sub_8088890: @ 8088CE4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x20]
	subs r0, 0x14
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _08088D24
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x1E
	strh r0, [r1, 0x30]
	ldr r0, _08088D18 @ =sub_80888D4
	str r0, [r1, 0x1C]
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08088D1C
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	b _08088D24
	.align 2, 0
_08088D18: .4byte sub_80888D4
_08088D1C:
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	bl PlayCry1
_08088D24:
	pop {r0}
	bx r0
	thumb_func_end sub_8088890

	thumb_func_start sub_80888D4
sub_80888D4: @ 8088D28
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08088D3C
	ldr r0, _08088D40 @ =sub_80888F0
	str r0, [r1, 0x1C]
_08088D3C:
	pop {r0}
	bx r0
	.align 2, 0
_08088D40: .4byte sub_80888F0
	thumb_func_end sub_80888D4

	thumb_func_start sub_80888F0
sub_80888F0: @ 8088D44
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x20]
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08088D5C
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	b _08088D62
_08088D5C:
	adds r0, r3, 0
	subs r0, 0x14
	strh r0, [r2, 0x20]
_08088D62:
	pop {r0}
	bx r0
	thumb_func_end sub_80888F0

	thumb_func_start FldEff_UseSurf
FldEff_UseSurf: @ 8088D68
	push {lr}
	ldr r0, _08088D98 @ =sub_8088954
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088D9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08088DA0 @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r1, 0x26]
	bl sav1_reset_battle_music_maybe
	ldr r0, _08088DA4 @ =0x0000016d
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088D98: .4byte sub_8088954
_08088D9C: .4byte gTasks
_08088DA0: .4byte gUnknown_0202FF84
_08088DA4: .4byte 0x0000016d
	thumb_func_end FldEff_UseSurf

	thumb_func_start sub_8088954
sub_8088954: @ 8088DA8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088DD0 @ =gUnknown_0839F3E4
	ldr r2, _08088DD4 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088DD0: .4byte gUnknown_0839F3E4
_08088DD4: .4byte gTasks
	thumb_func_end sub_8088954

	thumb_func_start sub_8088984
sub_8088984: @ 8088DD8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r5, _08088E30 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	adds r6, r4, 0
	adds r6, 0xA
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _08088E34 @ =gMapObjects
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	adds r1, r6, 0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088E30: .4byte gPlayerAvatar
_08088E34: .4byte gMapObjects
	thumb_func_end sub_8088984

	thumb_func_start sub_80889E4
sub_80889E4: @ 8088E38
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08088E7C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088E80 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088E62
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088E74
_08088E62:
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088E74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088E7C: .4byte gPlayerAvatar
_08088E80: .4byte gMapObjects
	thumb_func_end sub_80889E4

	thumb_func_start sub_8088A30
sub_8088A30: @ 8088E84
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088EC0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088EC4 @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08088EBA
	ldr r2, _08088EC8 @ =gUnknown_0202FF84
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088EBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088EC0: .4byte gPlayerAvatar
_08088EC4: .4byte gMapObjects
_08088EC8: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A30

	thumb_func_start sub_8088A78
sub_8088A78: @ 8088ECC
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088F36
	ldr r5, _08088F3C @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088F40 @ =gMapObjects
	adds r4, r0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _08088F44 @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08088F36:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088F3C: .4byte gPlayerAvatar
_08088F40: .4byte gMapObjects
_08088F44: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A78

	thumb_func_start sub_8088AF4
sub_8088AF4: @ 8088F48
	push {r4,r5,lr}
	ldr r5, _08088FB0 @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088FB4 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088FA8
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r1, [r5]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	bl sub_806451C
	bl ScriptContext2_Disable
	movs r0, 0x9
	bl FieldEffectActiveListRemove
	ldr r0, _08088FB8 @ =sub_8088954
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088FA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088FB0: .4byte gPlayerAvatar
_08088FB4: .4byte gMapObjects
_08088FB8: .4byte sub_8088954
	thumb_func_end sub_8088AF4

	thumb_func_start FldEff_NPCFlyOut
FldEff_NPCFlyOut: @ 8088FBC
	push {r4,lr}
	ldr r0, _08089008 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0x78
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	ldr r0, _0808900C @ =gSprites
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08089010 @ =sub_8088BC4
	str r0, [r2, 0x1C]
	ldr r0, _08089014 @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r2, 0x30]
	movs r0, 0x9E
	bl PlaySE
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08089008: .4byte gFieldEffectObjectTemplatePointers
_0808900C: .4byte gSprites
_08089010: .4byte sub_8088BC4
_08089014: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_NPCFlyOut

	thumb_func_start sub_8088BC4
sub_8088BC4: @ 8089018
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0808907A
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089090 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_0808907A:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _0808908A
	adds r0, r4, 0
	movs r1, 0x1E
	bl FieldEffectStop
_0808908A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089090: .4byte gSprites
	thumb_func_end sub_8088BC4

	thumb_func_start FldEff_UseFly
FldEff_UseFly: @ 8089094
	push {lr}
	ldr r0, _080890B8 @ =sub_8088C70
	movs r1, 0xFE
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080890BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080890C0 @ =gUnknown_0202FF84
	ldr r0, [r0]
	strh r0, [r1, 0xA]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080890B8: .4byte sub_8088C70
_080890BC: .4byte gTasks
_080890C0: .4byte gUnknown_0202FF84
	thumb_func_end FldEff_UseFly

	thumb_func_start sub_8088C70
sub_8088C70: @ 80890C4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080890EC @ =gUnknown_0839F3F8
	ldr r2, _080890F0 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080890EC: .4byte gUnknown_0839F3F8
_080890F0: .4byte gTasks
	thumb_func_end sub_8088C70

	thumb_func_start sub_8088CA0
sub_8088CA0: @ 80890F4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08089144 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089148 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808911E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808913C
_0808911E:
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0808913C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089144: .4byte gPlayerAvatar
_08089148: .4byte gMapObjects
	thumb_func_end sub_8088CA0

	thumb_func_start sub_8088CF8
sub_8088CF8: @ 808914C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08089184 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089188 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808917C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r1, _0808918C @ =gUnknown_0202FF84
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
_0808917C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089184: .4byte gPlayerAvatar
_08089188: .4byte gMapObjects
_0808918C: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088CF8

	thumb_func_start sub_8088D3C
sub_8088D3C: @ 8089190
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080891D8
	ldr r0, _080891E0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080891E4 @ =gMapObjects
	adds r5, r0, r1
	ldrh r1, [r4, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080891C8
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_8127EFC
_080891C8:
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080891D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080891E0: .4byte gPlayerAvatar
_080891E4: .4byte gMapObjects
	thumb_func_end sub_8088D3C

	thumb_func_start sub_8088D94
sub_8088D94: @ 80891E8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _0808921C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _08089224 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089228 @ =gMapObjects
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectSetSpecialAnim
_0808921C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089224: .4byte gPlayerAvatar
_08089228: .4byte gMapObjects
	thumb_func_end sub_8088D94

	thumb_func_start sub_8088DD8
sub_8088DD8: @ 808922C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08089278 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808927C @ =gMapObjects
	adds r2, r0, r1
	ldrh r1, [r4, 0xC]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08089252
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08089270
_08089252:
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08089270
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x9E
	bl PlaySE
	ldrb r0, [r4, 0xA]
	bl sub_8088FC0
_08089270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089278: .4byte gPlayerAvatar
_0808927C: .4byte gMapObjects
	thumb_func_end sub_8088DD8

	thumb_func_start sub_8088E2C
sub_8088E2C: @ 8089280
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080892F6
	ldr r0, _080892FC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089300 @ =gMapObjects
	adds r4, r0, r1
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08089304 @ =gSprites
	adds r0, r6
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0x48
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080892EC
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
_080892EC:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0xC]
_080892F6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080892FC: .4byte gPlayerAvatar
_08089300: .4byte gMapObjects
_08089304: .4byte gSprites
	thumb_func_end sub_8088E2C

	thumb_func_start sub_8088EB4
sub_8088EB4: @ 8089308
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08089354
	ldr r0, _0808935C @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08089360 @ =gMapObjects
	adds r4, r0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
	bl CameraObjectReset2
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08089354:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808935C: .4byte gPlayerAvatar
_08089360: .4byte gMapObjects
	thumb_func_end sub_8088EB4

	thumb_func_start sub_8088F10
sub_8088F10: @ 8089364
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _0808937E
	bl sub_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808937E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8088F10

	thumb_func_start sub_8088F30
sub_8088F30: @ 8089384
	push {lr}
	ldr r0, _080893AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080893A6
	movs r0, 0x1F
	bl FieldEffectActiveListRemove
	ldr r0, _080893B0 @ =sub_8088C70
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080893A6:
	pop {r0}
	bx r0
	.align 2, 0
_080893AC: .4byte gPaletteFade
_080893B0: .4byte sub_8088C70
	thumb_func_end sub_8088F30

	thumb_func_start sub_8088F60
sub_8088F60: @ 80893B4
	push {lr}
	ldr r0, _080893EC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x68]
	movs r1, 0xFF
	movs r2, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _080893F0 @ =gSprites
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	ldr r1, _080893F4 @ =sub_8089018
	str r1, [r2, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_080893EC: .4byte gFieldEffectObjectTemplatePointers
_080893F0: .4byte gSprites
_080893F4: .4byte sub_8089018
	thumb_func_end sub_8088F60

	thumb_func_start sub_8088FA4
sub_8088FA4: @ 80893F8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08089410 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08089410: .4byte gSprites
	thumb_func_end sub_8088FA4

	thumb_func_start sub_8088FC0
sub_8088FC0: @ 8089414
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08089448 @ =gSprites
	adds r4, r0
	ldr r0, _0808944C @ =sub_80890D8
	str r0, [r4, 0x1C]
	movs r1, 0
	movs r0, 0x78
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2E
	movs r2, 0x10
	bl memset
	movs r0, 0x40
	strh r0, [r4, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089448: .4byte gSprites
_0808944C: .4byte sub_80890D8
	thumb_func_end sub_8088FC0

	thumb_func_start sub_8088FFC
sub_8088FFC: @ 8089450
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089468 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3A]
	bx lr
	.align 2, 0
_08089468: .4byte gSprites
	thumb_func_end sub_8088FFC

	thumb_func_start sub_8089018
sub_8089018: @ 808946C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08089518
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080894B0
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _08089520 @ =gUnknown_0839F44C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r0, 0x76
	strh r0, [r4, 0x20]
	ldr r0, _08089524 @ =0x0000ffd0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x40
	strh r0, [r4, 0x30]
	adds r0, 0xC0
	strh r0, [r4, 0x32]
_080894B0:
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	ldr r0, _08089528 @ =0x000007ff
	cmp r1, r0
	bgt _080894E6
	adds r0, r2, 0
	adds r0, 0x60
	strh r0, [r4, 0x32]
_080894E6:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x81
	ble _08089518
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_08089518:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089520: .4byte gUnknown_0839F44C
_08089524: .4byte 0x0000ffd0
_08089528: .4byte 0x000007ff
	thumb_func_end sub_8089018

	thumb_func_start sub_80890D8
sub_80890D8: @ 808952C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _0808958A
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0808959C @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_0808958A:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08089596
	movs r0, 0x1
	strh r0, [r4, 0x3C]
_08089596:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808959C: .4byte gSprites
	thumb_func_end sub_80890D8

	thumb_func_start sub_808914C
sub_808914C: @ 80895A0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08089674
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080895EA
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0808967C @ =gUnknown_0839F44C
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0x5E
	strh r0, [r4, 0x20]
	ldr r0, _08089680 @ =0x0000ffe0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xF0
	strh r0, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0x80
	strh r0, [r4, 0x36]
_080895EA:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r2, r1
	ldrh r0, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _0808962C
	ldrh r0, [r4, 0x36]
	subs r0, r1, r0
	strh r0, [r4, 0x32]
_0808962C:
	ldrh r1, [r4, 0x36]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0xFF
	bgt _0808963C
	adds r0, r1, 0
	adds r0, 0x18
	strh r0, [r4, 0x36]
_0808963C:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	bgt _08089646
	strh r2, [r4, 0x32]
_08089646:
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	ble _08089674
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08089674:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808967C: .4byte gUnknown_0839F44C
_08089680: .4byte 0x0000ffe0
	thumb_func_end sub_808914C

	thumb_func_start sub_8089230
sub_8089230: @ 8089684
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8088FC0
	ldr r1, _080896A8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080896AC @ =sub_808914C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080896A8: .4byte gSprites
_080896AC: .4byte sub_808914C
	thumb_func_end sub_8089230

	thumb_func_start FldEff_FlyIn
FldEff_FlyIn: @ 80896B0
	push {lr}
	ldr r0, _080896C0 @ =sub_8089270
	movs r1, 0xFE
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080896C0: .4byte sub_8089270
	thumb_func_end FldEff_FlyIn

	thumb_func_start sub_8089270
sub_8089270: @ 80896C4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080896EC @ =gUnknown_0839F454
	ldr r2, _080896F0 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080896EC: .4byte gUnknown_0839F454
_080896F0: .4byte gTasks
	thumb_func_end sub_8089270

	thumb_func_start sub_80892A0
sub_80892A0: @ 80896F4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0808979C @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080897A0 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808971E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08089796
_0808971E:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x11
	strh r0, [r5, 0xC]
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08089746
	ldrb r0, [r4, 0x1A]
	movs r1, 0
	bl sub_8127ED0
_08089746:
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	bl CameraObjectReset2
	adds r0, r4, 0
	movs r1, 0x3
	bl FieldObjectTurn
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080897A4 @ =gSprites
	adds r0, r1
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	bl sub_8088FC0
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
_08089796:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808979C: .4byte gPlayerAvatar
_080897A0: .4byte gMapObjects
_080897A4: .4byte gSprites
	thumb_func_end sub_80892A0

	thumb_func_start sub_8089354
sub_8089354: @ 80897A8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080897C0
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08089800
_080897C0:
	ldr r0, _08089808 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808980C @ =gMapObjects
	adds r0, r1
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08089810 @ =gSprites
	adds r4, r0
	ldrb r0, [r5, 0xA]
	movs r1, 0x40
	bl sub_8088FFC
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
_08089800:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089808: .4byte gPlayerAvatar
_0808980C: .4byte gMapObjects
_08089810: .4byte gSprites
	thumb_func_end sub_8089354

	thumb_func_start sub_80893C0
sub_80893C0: @ 8089814
	push {r4,lr}
	sub sp, 0x24
	adds r4, r0, 0
	ldr r1, _0808985C @ =gUnknown_0839F470
	mov r0, sp
	movs r2, 0x24
	bl memcpy
	ldr r0, _08089860 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089864 @ =gSprites
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _08089852
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08089852:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808985C: .4byte gUnknown_0839F470
_08089860: .4byte gPlayerAvatar
_08089864: .4byte gSprites
	thumb_func_end sub_80893C0

	thumb_func_start sub_8089414
sub_8089414: @ 8089868
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _080898CC
	ldr r0, _080898D4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _080898D8 @ =gMapObjects
	adds r5, r0
	ldrb r0, [r5, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080898DC @ =gSprites
	adds r4, r0
	ldrb r1, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, 0
	bl sub_805C058
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	bl sub_8059BF4
	adds r0, r5, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_080898CC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080898D4: .4byte gPlayerAvatar
_080898D8: .4byte gMapObjects
_080898DC: .4byte gSprites
	thumb_func_end sub_8089414

	thumb_func_start sub_808948C
sub_808948C: @ 80898E0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08089910 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089914 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08089908
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r4, 0xA]
	bl sub_8089230
_08089908:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089910: .4byte gPlayerAvatar
_08089914: .4byte gMapObjects
	thumb_func_end sub_808948C

	thumb_func_start sub_80894C4
sub_80894C4: @ 8089918
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08089944
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808994C @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_08089944:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808994C: .4byte gSprites
	thumb_func_end sub_80894C4

	thumb_func_start fishE
fishE: @ 8089950
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _080899BA
	ldr r6, _080899C0 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080899C4 @ =gMapObjects
	adds r4, r0, r1
	movs r7, 0
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08089984
	movs r7, 0x3
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
_08089984:
	adds r0, r7, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	movs r1, 0x1
	bl FieldObjectTurn
	ldrh r0, [r5, 0x26]
	strb r0, [r6]
	movs r0, 0
	strb r0, [r6, 0x6]
	movs r0, 0x20
	bl FieldEffectActiveListRemove
	ldr r0, _080899C8 @ =sub_8089270
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080899BA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080899C0: .4byte gPlayerAvatar
_080899C4: .4byte gMapObjects
_080899C8: .4byte sub_8089270
	thumb_func_end fishE

	thumb_func_start remove_some_task
remove_some_task: @ 80899CC
	push {r4,lr}
	ldr r4, _080899FC @ =gUnknown_03004DC0
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _08089A00 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _08089A04 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _08089A08 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x18]
	cmp r0, 0xFF
	beq _080899F6
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r4, 0x18]
_080899F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080899FC: .4byte gUnknown_03004DC0
_08089A00: .4byte 0x040000b0
_08089A04: .4byte 0x0000c5ff
_08089A08: .4byte 0x00007fff
	thumb_func_end remove_some_task

	thumb_func_start dp12_8087EA4
dp12_8087EA4: @ 8089A0C
	push {r4,lr}
	sub sp, 0x4
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, _08089A40 @ =gUnknown_03004DE0
	ldr r2, _08089A44 @ =0x01000780
	bl CpuSet
	ldr r0, _08089A48 @ =gUnknown_03004DC0
	movs r1, 0
	str r1, [r0]
	str r1, [r0, 0x4]
	str r1, [r0, 0x8]
	str r1, [r0, 0xC]
	strb r4, [r0, 0x14]
	strb r4, [r0, 0x15]
	strb r4, [r0, 0x16]
	strb r4, [r0, 0x17]
	movs r1, 0xFF
	strb r1, [r0, 0x18]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089A40: .4byte gUnknown_03004DE0
_08089A44: .4byte 0x01000780
_08089A48: .4byte gUnknown_03004DC0
	thumb_func_end dp12_8087EA4

	thumb_func_start sub_80895F8
sub_80895F8: @ 8089A4C
	push {lr}
	sub sp, 0xC
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, _08089A70 @ =0xa2600001
	cmp r1, r0
	bne _08089A80
	ldr r0, _08089A74 @ =gUnknown_03004DC0
	ldr r1, _08089A78 @ =gUnknown_03004DE2
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08089A7C @ =sub_80896F4
	b _08089A90
	.align 2, 0
_08089A70: .4byte 0xa2600001
_08089A74: .4byte gUnknown_03004DC0
_08089A78: .4byte gUnknown_03004DE2
_08089A7C: .4byte sub_80896F4
_08089A80:
	ldr r0, _08089AB0 @ =gUnknown_03004DC0
	ldr r1, _08089AB4 @ =gUnknown_03004DE4
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08089AB8 @ =sub_8089714
_08089A90:
	str r1, [r0, 0x10]
	adds r1, r0, 0
	ldr r0, [sp, 0x4]
	str r0, [r1, 0xC]
	ldr r0, [sp]
	str r0, [r1, 0x8]
	mov r0, sp
	ldrb r0, [r0, 0x8]
	strb r0, [r1, 0x15]
	mov r0, sp
	ldrb r0, [r0, 0x9]
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_08089AB0: .4byte gUnknown_03004DC0
_08089AB4: .4byte gUnknown_03004DE4
_08089AB8: .4byte sub_8089714
	thumb_func_end sub_80895F8

	thumb_func_start sub_8089668
sub_8089668: @ 8089ABC
	push {r4,lr}
	ldr r4, _08089AEC @ =gUnknown_03004DC0
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _08089B36
	cmp r0, 0x3
	bne _08089B00
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _08089AF0 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _08089AF4 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _08089AF8 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r1, _08089AFC @ =gUnknown_0202FFA4
	movs r0, 0x1
	strb r0, [r1]
	b _08089B36
	.align 2, 0
_08089AEC: .4byte gUnknown_03004DC0
_08089AF0: .4byte 0x040000b0
_08089AF4: .4byte 0x0000c5ff
_08089AF8: .4byte 0x00007fff
_08089AFC: .4byte gUnknown_0202FFA4
_08089B00:
	ldr r1, _08089B3C @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _08089B40 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _08089B44 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x14]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, 0x8]
	str r0, [r1, 0x4]
	ldr r0, [r4, 0xC]
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, [r4, 0x10]
	bl _call_via_r0
	ldrb r0, [r4, 0x14]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4, 0x14]
_08089B36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089B3C: .4byte 0x040000b0
_08089B40: .4byte 0x0000c5ff
_08089B44: .4byte 0x00007fff
	thumb_func_end sub_8089668

	thumb_func_start sub_80896F4
sub_80896F4: @ 8089B48
	ldr r0, _08089B60 @ =gUnknown_03004DC0
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08089B64 @ =gUnknown_03004DE0
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08089B60: .4byte gUnknown_03004DC0
_08089B64: .4byte gUnknown_03004DE0
	thumb_func_end sub_80896F4

	thumb_func_start sub_8089714
sub_8089714: @ 8089B68
	ldr r0, _08089B80 @ =gUnknown_03004DC0
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08089B84 @ =gUnknown_03004DE0
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_08089B80: .4byte gUnknown_03004DC0
_08089B84: .4byte gUnknown_03004DE0
	thumb_func_end sub_8089714

	thumb_func_start task00_for_dp12
task00_for_dp12: @ 8089B88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	ldr r0, _08089BB0 @ =gUnknown_0202FFA4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089BB8
	mov r0, r12
	bl DestroyTask
	ldr r1, _08089BB4 @ =gUnknown_03004DC0
	movs r0, 0xFF
	strb r0, [r1, 0x18]
	b _08089D38
	.align 2, 0
_08089BB0: .4byte gUnknown_0202FFA4
_08089BB4: .4byte gUnknown_03004DC0
_08089BB8:
	ldr r1, _08089BE4 @ =gTasks
	mov r0, r12
	lsls r2, r0, 2
	adds r0, r2, r0
	lsls r0, 3
	adds r3, r0, r1
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	mov r10, r1
	mov r9, r2
	cmp r0, 0
	beq _08089C64
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	cmp r0, 0xE
	bhi _08089C64
	lsls r0, 2
	ldr r1, _08089BE8 @ =_08089BEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089BE4: .4byte gTasks
_08089BE8: .4byte _08089BEC
	.align 2, 0
_08089BEC:
	.4byte _08089C28
	.4byte _08089C64
	.4byte _08089C30
	.4byte _08089C64
	.4byte _08089C38
	.4byte _08089C64
	.4byte _08089C40
	.4byte _08089C64
	.4byte _08089C48
	.4byte _08089C64
	.4byte _08089C50
	.4byte _08089C64
	.4byte _08089C58
	.4byte _08089C64
	.4byte _08089C60
_08089C28:
	ldr r0, _08089C2C @ =gUnknown_030042A4
	b _08089C62
	.align 2, 0
_08089C2C: .4byte gUnknown_030042A4
_08089C30:
	ldr r0, _08089C34 @ =gUnknown_030042A0
	b _08089C62
	.align 2, 0
_08089C34: .4byte gUnknown_030042A0
_08089C38:
	ldr r0, _08089C3C @ =gUnknown_030042C0
	b _08089C62
	.align 2, 0
_08089C3C: .4byte gUnknown_030042C0
_08089C40:
	ldr r0, _08089C44 @ =gUnknown_030041B4
	b _08089C62
	.align 2, 0
_08089C44: .4byte gUnknown_030041B4
_08089C48:
	ldr r0, _08089C4C @ =gUnknown_03004288
	b _08089C62
	.align 2, 0
_08089C4C: .4byte gUnknown_03004288
_08089C50:
	ldr r0, _08089C54 @ =gUnknown_03004280
	b _08089C62
	.align 2, 0
_08089C54: .4byte gUnknown_03004280
_08089C58:
	ldr r0, _08089C5C @ =gUnknown_030041B0
	b _08089C62
	.align 2, 0
_08089C5C: .4byte gUnknown_030041B0
_08089C60:
	ldr r0, _08089CC4 @ =gUnknown_030041B8
_08089C62:
	ldrh r6, [r0]
_08089C64:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r2, r10
	adds r1, r0, r2
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08089CD0
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _08089D38
	ldr r5, _08089CC8 @ =gUnknown_03004DE0
	ldr r0, _08089CCC @ =gUnknown_03004DC0
	mov r8, r0
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
_08089C9E:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _08089C9E
	b _08089D38
	.align 2, 0
_08089CC4: .4byte gUnknown_030041B8
_08089CC8: .4byte gUnknown_03004DE0
_08089CCC: .4byte gUnknown_03004DC0
_08089CD0:
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x10]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _08089D18
	ldr r5, _08089D48 @ =gUnknown_03004DE0
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
	ldr r0, _08089D4C @ =gUnknown_03004DC0
	mov r8, r0
_08089CF6:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _08089CF6
_08089D18:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r3, r10
	adds r2, r0, r3
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bne _08089D38
	movs r0, 0
	strh r0, [r2, 0xE]
_08089D38:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089D48: .4byte gUnknown_03004DE0
_08089D4C: .4byte gUnknown_03004DC0
	thumb_func_end task00_for_dp12

	thumb_func_start sub_80898FC
sub_80898FC: @ 8089D50
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0
	movs r2, 0
	ldr r0, _08089D94 @ =gSineTable
	mov r12, r0
_08089D64:
	lsls r0, r1, 1
	adds r3, r0, r6
	lsls r0, r2, 1
	add r0, r12
	movs r7, 0
	ldrsh r0, [r0, r7]
	muls r0, r4
	cmp r0, 0
	bge _08089D78
	adds r0, 0xFF
_08089D78:
	asrs r0, 8
	strh r0, [r3]
	adds r0, r2, r5
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _08089D64
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089D94: .4byte gSineTable
	thumb_func_end sub_80898FC

	thumb_func_start sub_8089944
sub_8089944: @ 8089D98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r5, r0, 0
	str r1, [sp, 0x10]
	ldr r0, [sp, 0x40]
	mov r8, r0
	ldr r1, [sp, 0x44]
	mov r9, r1
	ldr r0, [sp, 0x48]
	mov r10, r0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, [sp, 0x10]
	lsls r1, 24
	str r1, [sp, 0x14]
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	str r1, [sp, 0x18]
	lsls r2, r3, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r3, r9
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl dp12_8087EA4
	ldr r0, _08089EA4 @ =0x04000010
	add r0, r9
	str r0, [sp]
	ldr r0, _08089EA8 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _08089EAC @ =task00_for_dp12
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08089EB0 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	strh r5, [r4, 0x8]
	mov r3, sp
	ldrh r3, [r3, 0xC]
	strh r3, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ldr r1, [sp, 0x18]
	bl __divsi3
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4, 0xE]
	mov r1, r8
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x12]
	mov r3, r9
	strh r3, [r4, 0x14]
	mov r0, r10
	strh r0, [r4, 0x16]
	ldr r0, _08089EB4 @ =gUnknown_03004DC0
	strb r7, [r0, 0x18]
	ldr r0, _08089EB8 @ =gUnknown_0202FFA4
	movs r1, 0
	strb r1, [r0]
	ldr r4, _08089EBC @ =gUnknown_03005060
	ldr r3, [sp, 0xC]
	subs r6, r3, r5
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r4, 0
	ldr r1, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	bl sub_80898FC
	ldr r0, [sp, 0xC]
	cmp r5, r0
	bge _08089E92
	ldr r1, _08089EC0 @ =0xfffffd80
	adds r2, r4, r1
	lsls r1, r5, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r1, r3
	adds r3, r0, r2
	adds r1, r2
	adds r2, r4, 0
	adds r5, r6, 0
_08089E7E:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, 0x2
	adds r3, 0x2
	adds r1, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08089E7E
_08089E92:
	adds r0, r7, 0
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089EA4: .4byte 0x04000010
_08089EA8: .4byte 0xa2600001
_08089EAC: .4byte task00_for_dp12
_08089EB0: .4byte gTasks
_08089EB4: .4byte gUnknown_03004DC0
_08089EB8: .4byte gUnknown_0202FFA4
_08089EBC: .4byte gUnknown_03005060
_08089EC0: .4byte 0xfffffd80
	thumb_func_end sub_8089944

	thumb_func_start sub_8089A70
sub_8089A70: @ 8089EC4
	push {lr}
	ldr r0, _08089EDC @ =gPaletteFade
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	movs r0, 0
	movs r1, 0
	bl OpenPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_08089EDC: .4byte gPaletteFade
	thumb_func_end sub_8089A70

	thumb_func_start sub_8089A8C
sub_8089A8C: @ 8089EE0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _08089F24 @ =gUnknown_0202FFA9
	movs r0, 0
	strb r0, [r5]
	ldr r0, _08089F28 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089F2C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08089F34
	ldr r4, _08089F30 @ =gUnknown_0202FFAA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl AppendToList
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl AppendToList
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl AppendToList
	b _0808A01C
	.align 2, 0
_08089F24: .4byte gUnknown_0202FFA9
_08089F28: .4byte gUnknown_03005CE0
_08089F2C: .4byte gPlayerParty
_08089F30: .4byte gUnknown_0202FFAA
_08089F34:
	movs r6, 0
	ldr r0, _08089F78 @ =gUnknown_0839F554
	ldrh r0, [r0]
	mov r8, r0
_08089F3C:
	movs r4, 0
	adds r7, r6, 0x1
	mov r0, r8
	cmp r0, 0xFF
	beq _08089F9C
	ldr r5, _08089F78 @ =gUnknown_0839F554
_08089F48:
	ldr r0, _08089F7C @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089F80 @ =gPlayerParty
	adds r0, r1
	adds r1, r6, 0
	adds r1, 0xD
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	cmp r0, r1
	bne _08089F8C
	adds r2, r4, 0
	adds r2, 0xA
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08089F84 @ =gUnknown_0202FFAA
	ldr r1, _08089F88 @ =gUnknown_0202FFA9
	bl AppendToList
	b _08089F9C
	.align 2, 0
_08089F78: .4byte gUnknown_0839F554
_08089F7C: .4byte gUnknown_03005CE0
_08089F80: .4byte gPlayerParty
_08089F84: .4byte gUnknown_0202FFAA
_08089F88: .4byte gUnknown_0202FFA9
_08089F8C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0xFF
	bne _08089F48
_08089F9C:
	lsls r0, r7, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08089F3C
	ldr r4, _08089FF8 @ =gUnknown_0202FFAA
	ldr r5, _08089FFC @ =gUnknown_0202FFA9
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl AppendToList
	ldr r6, _0808A000 @ =0x030043d4
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08089FCA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl AppendToList
_08089FCA:
	ldr r0, _0808A004 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	adds r1, r6, 0
	subs r1, 0x64
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A008
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x7
	bl AppendToList
	b _0808A012
	.align 2, 0
_08089FF8: .4byte gUnknown_0202FFAA
_08089FFC: .4byte gUnknown_0202FFA9
_0808A000: .4byte 0x030043d4
_0808A004: .4byte gUnknown_03005CE0
_0808A008:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl AppendToList
_0808A012:
	ldr r0, _0808A028 @ =gUnknown_0202FFAA
	ldr r1, _0808A02C @ =gUnknown_0202FFA9
	movs r2, 0x3
	bl AppendToList
_0808A01C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A028: .4byte gUnknown_0202FFAA
_0808A02C: .4byte gUnknown_0202FFA9
	thumb_func_end sub_8089A8C

	thumb_func_start sub_8089BDC
sub_8089BDC: @ 808A030
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r7, [sp, 0x20]
	ldr r1, [sp, 0x24]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl sub_806D538
	adds r4, r5, r4
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r3, r0, 1
	adds r3, r6, r3
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	str r7, [sp]
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	ldr r3, [sp, 0x1C]
	bl PrintMenuItemsReordered
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8089BDC

	thumb_func_start sub_8089C50
sub_8089C50: @ 808A0A4
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r4, 0x1
	str r4, [sp, 0x8]
	bl sub_8089BDC
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8089C50

	thumb_func_start sub_8089C7C
sub_8089C7C: @ 808A0D0
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0808A11C @ =gUnknown_0202FFA9
	ldrb r0, [r6]
	lsls r0, 1
	movs r4, 0x12
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldrb r3, [r6]
	ldr r0, _0808A120 @ =gPokemonMenuActions
	str r0, [sp]
	ldr r0, _0808A124 @ =gUnknown_0202FFAA
	str r0, [sp, 0x4]
	movs r0, 0x3
	str r0, [sp, 0x8]
	movs r0, 0x13
	adds r1, r4, 0
	movs r2, 0xA
	bl sub_8089BDC
	movs r2, 0x1
	orrs r2, r4
	ldrb r3, [r6]
	str r5, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x14
	bl InitMenu
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A11C: .4byte gUnknown_0202FFA9
_0808A120: .4byte gPokemonMenuActions
_0808A124: .4byte gUnknown_0202FFAA
	thumb_func_end sub_8089C7C

	thumb_func_start sub_8089CD4
sub_8089CD4: @ 808A128
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A154 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0808A1D8
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0808A158
	cmp r0, 0x2
	beq _0808A1B4
	b _0808A1D8
	.align 2, 0
_0808A154: .4byte gPaletteFade
_0808A158:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808A19C @ =gUnknown_03005CE0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808A1A0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0808A1A4 @ =gStringVar1
	bl GetMonNickname
	bl sub_8089A8C
	ldr r0, _0808A1A8 @ =gUnknown_0202FFA8
	strb r5, [r0]
	movs r0, 0
	bl sub_8089C7C
	ldr r1, _0808A1AC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A1B0 @ =sub_8089D94
	str r1, [r0]
	adds r0, r4, 0
	bl sub_808B5B4
	b _0808A1D8
	.align 2, 0
_0808A19C: .4byte gUnknown_03005CE0
_0808A1A0: .4byte gPlayerParty
_0808A1A4: .4byte gStringVar1
_0808A1A8: .4byte gUnknown_0202FFA8
_0808A1AC: .4byte gTasks
_0808A1B0: .4byte sub_8089D94
_0808A1B4:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A1E0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A1E4 @ =sub_8089E4C
	str r1, [r0]
_0808A1D8:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A1E0: .4byte gTasks
_0808A1E4: .4byte sub_8089E4C
	thumb_func_end sub_8089CD4

	thumb_func_start sub_8089D94
sub_8089D94: @ 808A1E8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _0808A21C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A298
	ldr r2, _0808A220 @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _0808A228
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r1, _0808A224 @ =gUnknown_0202FFA8
	strb r0, [r1]
	b _0808A26E
	.align 2, 0
_0808A21C: .4byte gPaletteFade
_0808A220: .4byte gMain
_0808A224: .4byte gUnknown_0202FFA8
_0808A228:
	cmp r1, 0x80
	bne _0808A244
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _0808A240 @ =gUnknown_0202FFA8
	strb r0, [r1]
	b _0808A26E
	.align 2, 0
_0808A240: .4byte gUnknown_0202FFA8
_0808A244:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808A284
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808A278 @ =gPokemonMenuActions
	ldr r2, _0808A27C @ =gUnknown_0202FFAA
	ldr r0, _0808A280 @ =gUnknown_0202FFA8
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_0808A26E:
	adds r0, r4, 0
	bl sub_808B5B4
	b _0808A298
	.align 2, 0
_0808A278: .4byte gPokemonMenuActions
_0808A27C: .4byte gUnknown_0202FFAA
_0808A280: .4byte gUnknown_0202FFA8
_0808A284:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808A298
	adds r0, r5, 0
	bl PokemonMenu_Cancel
	adds r0, r5, 0
	bl sub_808B5B4
_0808A298:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8089D94

	thumb_func_start sub_8089E4C
sub_8089E4C: @ 808A2A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A2CC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0808A2C6
	ldr r0, _0808A2D0 @ =gUnknown_03005CE0
	strb r1, [r0]
	ldr r0, _0808A2D4 @ =sub_805469C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808A2C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A2CC: .4byte gPaletteFade
_0808A2D0: .4byte gUnknown_03005CE0
_0808A2D4: .4byte sub_805469C
	thumb_func_end sub_8089E4C

	thumb_func_start sub_8089E84
sub_8089E84: @ 808A2D8
	push {lr}
	ldr r0, _0808A300 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808A304 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0808A308 @ =gStringVar1
	bl GetMonNickname
	bl sub_8089A8C
	ldr r1, _0808A30C @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	bl sub_8089C7C
	pop {r0}
	bx r0
	.align 2, 0
_0808A300: .4byte gUnknown_03005CE0
_0808A304: .4byte gPlayerParty
_0808A308: .4byte gStringVar1
_0808A30C: .4byte gUnknown_0202FFA8
	thumb_func_end sub_8089E84

	thumb_func_start sub_8089EBC
sub_8089EBC: @ 808A310
	push {r4,r5,lr}
	ldr r4, _0808A318 @ =0x0201b260
	ldr r5, _0808A31C @ =gUnknown_020384F0
	b _0808A32C
	.align 2, 0
_0808A318: .4byte 0x0201b260
_0808A31C: .4byte gUnknown_020384F0
_0808A320:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A358
_0808A32C:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A320
	ldrb r0, [r4]
	ldrb r1, [r5]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r1, _0808A360 @ =gUnknown_03005CE0
	ldrb r0, [r5]
	strb r0, [r1]
	bl sub_8089E84
	ldr r0, _0808A364 @ =sub_806AEDC
	bl SetMainCallback2
_0808A358:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A360: .4byte gUnknown_03005CE0
_0808A364: .4byte sub_806AEDC
	thumb_func_end sub_8089EBC

	thumb_func_start sub_8089F14
sub_8089F14: @ 808A368
	push {lr}
	ldr r2, _0808A38C @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0808A390 @ =sub_8089D94
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _0808A394 @ =sub_8089EBC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808A38C: .4byte gPaletteFade
_0808A390: .4byte sub_8089D94
_0808A394: .4byte sub_8089EBC
	thumb_func_end sub_8089F14

	thumb_func_start sub_8089F44
sub_8089F44: @ 808A398
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0808A400 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0808A3F6
	ldr r2, _0808A404 @ =gSprites
	ldr r1, _0808A408 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _0808A40C @ =0x0201b000
	ldr r1, _0808A410 @ =0x00000262
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _0808A414 @ =gPlayerParty
	ldr r1, _0808A418 @ =gPlayerPartyCount
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0808A41C @ =sub_8089F14
	str r5, [sp]
	adds r1, r4, 0
	bl sub_809D8BC
_0808A3F6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A400: .4byte gPaletteFade
_0808A404: .4byte gSprites
_0808A408: .4byte gTasks
_0808A40C: .4byte 0x0201b000
_0808A410: .4byte 0x00000262
_0808A414: .4byte gPlayerParty
_0808A418: .4byte gPlayerPartyCount
_0808A41C: .4byte sub_8089F14
	thumb_func_end sub_8089F44

	thumb_func_start PokemonMenu_Summary
PokemonMenu_Summary: @ 808A420
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A450 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A454 @ =sub_8089F44
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A450: .4byte gTasks
_0808A454: .4byte sub_8089F44
	thumb_func_end PokemonMenu_Summary

	thumb_func_start sub_808A004
sub_808A004: @ 808A458
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808A478 @ =sub_806CA60
	ldr r2, _0808A47C @ =sub_8089CD4
	bl SetTaskFuncWithFollowupFunc
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	.align 2, 0
_0808A478: .4byte sub_806CA60
_0808A47C: .4byte sub_8089CD4
	thumb_func_end sub_808A004

	thumb_func_start PokemonMenu_Switch
PokemonMenu_Switch: @ 808A480
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r0, _0808A4A8 @ =0x02001000
	ldr r1, _0808A4AC @ =sub_806CD5C
	str r1, [r0, 0xC]
	ldr r1, _0808A4B0 @ =0x0001a272
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_808A004
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A4A8: .4byte 0x02001000
_0808A4AC: .4byte sub_806CD5C
_0808A4B0: .4byte 0x0001a272
	thumb_func_end PokemonMenu_Switch

	thumb_func_start sub_808A060
sub_808A060: @ 808A4B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A524 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0808A4DA
	ldr r4, _0808A528 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0808A4DA
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
_0808A4DA:
	ldr r0, _0808A524 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0808A4F8
	ldr r4, _0808A528 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _0808A4F8
	movs r0, 0x1
	bl MoveMenuCursor
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
_0808A4F8:
	ldr r0, _0808A524 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808A534
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808A52C @ =gUnknown_0839F578
	ldr r2, _0808A530 @ =gPokemonMenuActions
	ldr r0, _0808A528 @ =gUnknown_0202FFA8
	ldrb r3, [r0]
	movs r0, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0808A54A
	.align 2, 0
_0808A524: .4byte gMain
_0808A528: .4byte gUnknown_0202FFA8
_0808A52C: .4byte gUnknown_0839F578
_0808A530: .4byte gPokemonMenuActions
_0808A534:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808A54A
	ldr r1, _0808A550 @ =gUnknown_0839F578
	movs r0, 0
	bl sub_806E7D0
	adds r0, r5, 0
	bl PokemonMenu_CancelSubmenu
_0808A54A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A550: .4byte gUnknown_0839F578
	thumb_func_end sub_808A060

	thumb_func_start sub_808A100
sub_808A100: @ 808A554
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0808A584 @ =gUnknown_0839F578
	ldr r2, _0808A588 @ =gPokemonMenuActions
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	movs r0, 0xD
	movs r1, 0x2
	bl sub_806D538
	ldr r1, _0808A58C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A590 @ =sub_808A060
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A584: .4byte gUnknown_0839F578
_0808A588: .4byte gPokemonMenuActions
_0808A58C: .4byte gTasks
_0808A590: .4byte sub_808A060
	thumb_func_end sub_808A100

	thumb_func_start PokemonMenu_Item
PokemonMenu_Item: @ 808A594
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r1, _0808A5C8 @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0808A5CC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A5D0 @ =sub_808A100
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5C8: .4byte gUnknown_0202FFA8
_0808A5CC: .4byte gTasks
_0808A5D0: .4byte sub_808A100
	thumb_func_end PokemonMenu_Item

	thumb_func_start sub_808A180
sub_808A180: @ 808A5D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A624 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A61E
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A628 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808A62C @ =0x02028280
	adds r1, r0
	ldr r2, _0808A630 @ =sub_808A520
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
_0808A61E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A624: .4byte gPaletteFade
_0808A628: .4byte gPlayerParty
_0808A62C: .4byte 0x02028280
_0808A630: .4byte sub_808A520
	thumb_func_end sub_808A180

	thumb_func_start sub_808A1E0
sub_808A1E0: @ 808A634
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A670 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A66A
	adds r0, r4, 0
	bl sub_806CA38
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DF60
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _0808A674 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A678 @ =sub_8089CD4
	str r1, [r0]
_0808A66A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A670: .4byte gUnknown_0202E8F6
_0808A674: .4byte gTasks
_0808A678: .4byte sub_8089CD4
	thumb_func_end sub_808A1E0

	thumb_func_start sub_808A228
sub_808A228: @ 808A67C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A6BC @ =gScriptItemId
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A6CC
	ldr r0, _0808A6C0 @ =gUnknown_0202E8F4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808A6CC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A6C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A6C8 @ =sub_808A180
	str r1, [r0]
	b _0808A6EE
	.align 2, 0
_0808A6BC: .4byte gScriptItemId
_0808A6C0: .4byte gUnknown_0202E8F4
_0808A6C4: .4byte gTasks
_0808A6C8: .4byte sub_808A180
_0808A6CC:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0808A6F8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808A6FC @ =sub_8089CD4
	str r0, [r1]
_0808A6EE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6F8: .4byte gTasks
_0808A6FC: .4byte sub_8089CD4
	thumb_func_end sub_808A228

	thumb_func_start sub_808A2AC
sub_808A2AC: @ 808A700
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0808A724 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A71E
	ldr r0, _0808A728 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808A72C @ =sub_808A228
	adds r0, r3, 0
	bl sub_806E964
_0808A71E:
	pop {r0}
	bx r0
	.align 2, 0
_0808A724: .4byte gPaletteFade
_0808A728: .4byte gScriptItemId
_0808A72C: .4byte sub_808A228
	thumb_func_end sub_808A2AC

	thumb_func_start sub_808A2DC
sub_808A2DC: @ 808A730
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A778 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808A77C @ =0x02028280
	adds r1, r0
	ldr r2, _0808A780 @ =sub_808A520
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A778: .4byte gPlayerParty
_0808A77C: .4byte 0x02028280
_0808A780: .4byte sub_808A520
	thumb_func_end sub_808A2DC

	thumb_func_start sub_808A330
sub_808A330: @ 808A784
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808A798 @ =gScriptItemId
	ldrh r1, [r1]
	ldr r2, _0808A79C @ =sub_808A2DC
	bl sub_806E964
	pop {r0}
	bx r0
	.align 2, 0
_0808A798: .4byte gScriptItemId
_0808A79C: .4byte sub_808A2DC
	thumb_func_end sub_808A330

	thumb_func_start sub_808A34C
sub_808A34C: @ 808A7A0
	push {lr}
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_808A34C

	thumb_func_start sub_808A358
sub_808A358: @ 808A7AC
	push {r4,lr}
	ldr r4, _0808A7B4 @ =0x0201b260
	b _0808A7C4
	.align 2, 0
_0808A7B4: .4byte 0x0201b260
_0808A7B8:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A7E8
_0808A7C4:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A7B8
	ldrb r0, [r4]
	ldr r1, _0808A7F0 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808A7F4 @ =sub_806AEDC
	bl SetMainCallback2
_0808A7E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A7F0: .4byte gUnknown_03005CE0
_0808A7F4: .4byte sub_806AEDC
	thumb_func_end sub_808A358

	thumb_func_start sub_808A3A4
sub_808A3A4: @ 808A7F8
	push {r4,r5,lr}
	ldr r4, _0808A82C @ =0x0201b260
	adds r5, r4, 0x2
_0808A7FE:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A838
	ldrb r0, [r4]
	ldr r1, _0808A830 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	movs r0, 0x3
	strb r0, [r5]
	bl sub_8089E84
	ldr r0, _0808A834 @ =sub_806AEDC
	bl SetMainCallback2
	b _0808A844
	.align 2, 0
_0808A82C: .4byte 0x0201b260
_0808A830: .4byte gUnknown_03005CE0
_0808A834: .4byte sub_806AEDC
_0808A838:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A7FE
_0808A844:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808A3A4

	thumb_func_start sub_808A3F8
sub_808A3F8: @ 808A84C
	push {r4,lr}
	ldr r0, _0808A8B4 @ =gScriptItemId
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A8D2
	ldr r0, _0808A8B8 @ =sub_808A330
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0808A8BC @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806BD58
	ldr r0, _0808A8C0 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_806C994
	adds r0, r4, 0
	movs r1, 0
	bl sub_806BF74
	adds r0, r4, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A8C4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 24
	cmp r0, 0
	bne _0808A8CC
	ldr r0, _0808A8C8 @ =sub_808A34C
	bl SetMainCallback2
	b _0808A91A
	.align 2, 0
_0808A8B4: .4byte gScriptItemId
_0808A8B8: .4byte sub_808A330
_0808A8BC: .4byte gPaletteFade
_0808A8C0: .4byte gUnknown_03005CE0
_0808A8C4: .4byte gPlayerParty
_0808A8C8: .4byte sub_808A34C
_0808A8CC:
	adds r0, r4, 0
	bl DestroyTask
_0808A8D2:
	ldr r2, _0808A8F8 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808A8FC @ =gScriptItemId
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808A908
	ldr r2, _0808A900 @ =sub_808A2AC
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0xFF
	bl sub_806AF4C
	ldr r0, _0808A904 @ =sub_808A358
	bl SetMainCallback2
	b _0808A91A
	.align 2, 0
_0808A8F8: .4byte gPaletteFade
_0808A8FC: .4byte gScriptItemId
_0808A900: .4byte sub_808A2AC
_0808A904: .4byte sub_808A358
_0808A908:
	ldr r2, _0808A920 @ =sub_8089D94
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _0808A924 @ =sub_808A3A4
	bl SetMainCallback2
_0808A91A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A920: .4byte sub_8089D94
_0808A924: .4byte sub_808A3A4
	thumb_func_end sub_808A3F8

	thumb_func_start sub_808A4D4
sub_808A4D4: @ 808A928
	push {r4,lr}
	ldr r4, _0808A930 @ =0x0201b260
	b _0808A940
	.align 2, 0
_0808A930: .4byte 0x0201b260
_0808A934:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A964
_0808A940:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A934
	ldrb r0, [r4]
	ldr r1, _0808A96C @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808A970 @ =sub_806AEDC
	bl SetMainCallback2
_0808A964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A96C: .4byte gUnknown_03005CE0
_0808A970: .4byte sub_806AEDC
	thumb_func_end sub_808A4D4

	thumb_func_start sub_808A520
sub_808A520: @ 808A974
	push {r4-r7,lr}
	ldr r2, _0808A9D8 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808A9DC @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _0808A9F0
	ldr r7, _0808A9E0 @ =gUnknown_0202E8F8
	ldrh r0, [r7]
	cmp r0, 0
	beq _0808A996
	movs r1, 0x1
	bl RemoveBagItem
_0808A996:
	ldr r6, _0808A9E4 @ =gUnknown_03005CE0
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0808A9E8 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl AddBagItem
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	bl sub_80A2DF8
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	adds r2, r7, 0
	bl SetMonData
	ldr r2, _0808A9EC @ =sub_8089CD4
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0
	bl sub_806AF4C
	b _0808A9FC
	.align 2, 0
_0808A9D8: .4byte gPaletteFade
_0808A9DC: .4byte gScriptResult
_0808A9E0: .4byte gUnknown_0202E8F8
_0808A9E4: .4byte gUnknown_03005CE0
_0808A9E8: .4byte gPlayerParty
_0808A9EC: .4byte sub_8089CD4
_0808A9F0:
	ldr r2, _0808AA08 @ =sub_808A5BC
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0xFF
	bl sub_806AF4C
_0808A9FC:
	ldr r0, _0808AA0C @ =sub_808A4D4
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA08: .4byte sub_808A5BC
_0808AA0C: .4byte sub_808A4D4
	thumb_func_end sub_808A520

	thumb_func_start sub_808A5BC
sub_808A5BC: @ 808AA10
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AA44 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808AA3E
	ldr r0, _0808AA48 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	ldr r1, _0808AA4C @ =gScriptItemId
	ldrh r1, [r1]
	movs r2, 0
	bl sub_806EBF0
	ldr r1, _0808AA50 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AA54 @ =sub_808A1E0
	str r1, [r0]
_0808AA3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA44: .4byte gPaletteFade
_0808AA48: .4byte gUnknown_03005CE0
_0808AA4C: .4byte gScriptItemId
_0808AA50: .4byte gTasks
_0808AA54: .4byte sub_808A1E0
	thumb_func_end sub_808A5BC

	thumb_func_start sub_808A604
sub_808A604: @ 808AA58
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AA7C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808AA76
	ldr r0, _0808AA80 @ =sub_80A61D0
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808AA76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA7C: .4byte gPaletteFade
_0808AA80: .4byte sub_80A61D0
	thumb_func_end sub_808A604

	thumb_func_start PokemonMenu_GiveItem
PokemonMenu_GiveItem: @ 808AA84
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808AAC0 @ =gUnknown_0202E8F5
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808AAC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AAC8 @ =sub_808A604
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAC0: .4byte gUnknown_0202E8F5
_0808AAC4: .4byte gTasks
_0808AAC8: .4byte sub_808A604
	thumb_func_end PokemonMenu_GiveItem

	thumb_func_start sub_808A678
sub_808A678: @ 808AACC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808A8D4
	pop {r0}
	bx r0
	thumb_func_end sub_808A678

	thumb_func_start PokemonMenu_TakeItem
PokemonMenu_TakeItem: @ 808AADC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r1, _0808AB08 @ =sub_808A678
	adds r0, r4, 0
	bl sub_806ECE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB08: .4byte sub_808A678
	thumb_func_end PokemonMenu_TakeItem

	thumb_func_start PokemonMenu_TakeMail
PokemonMenu_TakeMail: @ 808AB0C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r1, _0808AB38 @ =sub_808A678
	adds r0, r4, 0
	bl sub_806EE08
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB38: .4byte sub_808A678
	thumb_func_end PokemonMenu_TakeMail

	thumb_func_start PokemonMenu_Mail
PokemonMenu_Mail: @ 808AB3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r1, _0808AB7C @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0808AB80 @ =gUnknown_0839F584
	ldr r2, _0808AB84 @ =gPokemonMenuActions
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	ldr r1, _0808AB88 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AB8C @ =sub_808A73C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB7C: .4byte gUnknown_0202FFA8
_0808AB80: .4byte gUnknown_0839F584
_0808AB84: .4byte gPokemonMenuActions
_0808AB88: .4byte gTasks
_0808AB8C: .4byte sub_808A73C
	thumb_func_end PokemonMenu_Mail

	thumb_func_start sub_808A73C
sub_808A73C: @ 808AB90
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808ABB8 @ =gMain
	ldrh r0, [r0, 0x30]
	cmp r0, 0x40
	bne _0808ABCE
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808ABBC @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	cmp r0, 0
	bne _0808ABC4
	ldr r0, _0808ABC0 @ =gUnknown_0839F584
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	b _0808ABC8
	.align 2, 0
_0808ABB8: .4byte gMain
_0808ABBC: .4byte gUnknown_0202FFA8
_0808ABC0: .4byte gUnknown_0839F584
_0808ABC4:
	movs r0, 0x1
	negs r0, r0
_0808ABC8:
	bl MoveMenuCursor
	strb r0, [r4]
_0808ABCE:
	ldr r0, _0808ABF4 @ =gMain
	ldrh r0, [r0, 0x30]
	cmp r0, 0x80
	bne _0808AC08
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808ABF8 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	ldr r1, _0808ABFC @ =gUnknown_0839F584
	ldrb r2, [r1]
	subs r1, r2, 0x1
	cmp r0, r1
	bne _0808AC00
	movs r0, 0x1
	subs r0, r2
	lsls r0, 24
	asrs r0, 24
	b _0808AC02
	.align 2, 0
_0808ABF4: .4byte gMain
_0808ABF8: .4byte gUnknown_0202FFA8
_0808ABFC: .4byte gUnknown_0839F584
_0808AC00:
	movs r0, 0x1
_0808AC02:
	bl MoveMenuCursor
	strb r0, [r4]
_0808AC08:
	ldr r0, _0808AC34 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808AC44
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808AC38 @ =gUnknown_0839F584
	ldr r2, _0808AC3C @ =gPokemonMenuActions
	ldr r0, _0808AC40 @ =gUnknown_0202FFA8
	ldrb r3, [r0]
	movs r0, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0808AC5A
	.align 2, 0
_0808AC34: .4byte gMain
_0808AC38: .4byte gUnknown_0839F584
_0808AC3C: .4byte gPokemonMenuActions
_0808AC40: .4byte gUnknown_0202FFA8
_0808AC44:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808AC5A
	ldr r1, _0808AC60 @ =gUnknown_0839F584
	movs r0, 0
	bl sub_806E7D0
	adds r0, r5, 0
	bl PokemonMenu_Cancel
_0808AC5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC60: .4byte gUnknown_0839F584
	thumb_func_end sub_808A73C

	thumb_func_start PokemonMenu_ReadMail
PokemonMenu_ReadMail: @ 808AC64
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808AC94 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AC98 @ =sub_808A848
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC94: .4byte gTasks
_0808AC98: .4byte sub_808A848
	thumb_func_end PokemonMenu_ReadMail

	thumb_func_start sub_808A848
sub_808A848: @ 808AC9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808ACEC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808ACE4
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808ACF0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808ACF4 @ =0x02028280
	adds r0, r1
	ldr r1, _0808ACF8 @ =sub_808A8A8
	movs r2, 0x1
	bl sub_80F890C
_0808ACE4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808ACEC: .4byte gPaletteFade
_0808ACF0: .4byte gPlayerParty
_0808ACF4: .4byte 0x02028280
_0808ACF8: .4byte sub_808A8A8
	thumb_func_end sub_808A848

	thumb_func_start sub_808A8A8
sub_808A8A8: @ 808ACFC
	push {lr}
	ldr r1, _0808AD18 @ =gUnknown_020384F0
	ldr r0, _0808AD1C @ =gUnknown_03005CE0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0808AD20 @ =0x0201b000
	ldr r1, _0808AD24 @ =0x00000262
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	bl sub_8089F14
	pop {r0}
	bx r0
	.align 2, 0
_0808AD18: .4byte gUnknown_020384F0
_0808AD1C: .4byte gUnknown_03005CE0
_0808AD20: .4byte 0x0201b000
_0808AD24: .4byte 0x00000262
	thumb_func_end sub_808A8A8

	thumb_func_start sub_808A8D4
sub_808A8D4: @ 808AD28
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0808AD60 @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _0808AD64 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AD68 @ =sub_8089CD4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AD60: .4byte gUnknown_0202FFA8
_0808AD64: .4byte gTasks
_0808AD68: .4byte sub_8089CD4
	thumb_func_end sub_808A8D4

	thumb_func_start PokemonMenu_Cancel
PokemonMenu_Cancel: @ 808AD6C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_808A8D4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokemonMenu_Cancel

	thumb_func_start PokemonMenu_CancelSubmenu
PokemonMenu_CancelSubmenu: @ 808AD8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r0, _0808ADCC @ =gUnknown_0202FFA8
	ldrb r0, [r0]
	bl sub_8089C7C
	ldr r1, _0808ADD0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808ADD4 @ =sub_8089D94
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ADCC: .4byte gUnknown_0202FFA8
_0808ADD0: .4byte gTasks
_0808ADD4: .4byte sub_8089D94
	thumb_func_end PokemonMenu_CancelSubmenu

	thumb_func_start PokemonMenu_FieldMove
PokemonMenu_FieldMove: @ 808ADD8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0808AE24 @ =0x03004b38
	adds r4, r6, r7
	bl sub_8072DEC
	ldr r1, _0808AE28 @ =gUnknown_0202FFAA
	ldr r0, _0808AE2C @ =gUnknown_0202FFA8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0xA
	strh r0, [r4, 0x16]
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AE30
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldrh r0, [r4, 0x16]
	subs r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0808AF0E
	movs r0, 0x9
	b _0808AF06
	.align 2, 0
_0808AE24: .4byte 0x03004b38
_0808AE28: .4byte gUnknown_0202FFAA
_0808AE2C: .4byte gUnknown_0202FFA8
_0808AE30:
	ldrh r1, [r4, 0x16]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	bgt _0808AE80
	ldr r2, _0808AE74 @ =0x00000807
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AE80
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r0, _0808AE78 @ =gOtherText_CantBeUsedBadge
	movs r1, 0x1
	bl sub_806E834
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0808AE7C @ =sub_808AAF0
	str r1, [r0]
	b _0808AF2E
	.align 2, 0
_0808AE74: .4byte 0x00000807
_0808AE78: .4byte gOtherText_CantBeUsedBadge
_0808AE7C: .4byte sub_808AAF0
_0808AE80:
	ldr r1, _0808AECC @ =gFieldMoveFuncs
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AEE4
	ldr r1, _0808AED0 @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r4, 0x16]
	subs r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0808AEDC
	ldr r1, _0808AED4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AED8 @ =sub_808AB34
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0808AF2E
	.align 2, 0
_0808AECC: .4byte gFieldMoveFuncs
_0808AED0: .4byte gUnknown_0202FFA8
_0808AED4: .4byte gTasks
_0808AED8: .4byte sub_808AB34
_0808AEDC:
	adds r0, r5, 0
	bl sub_8133D28
	b _0808AF2E
_0808AEE4:
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _0808AF0E
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0808AF0E
	movs r0, 0x8
_0808AF06:
	movs r1, 0
	bl sub_806D538
	b _0808AF20
_0808AF0E:
	ldr r0, _0808AF38 @ =gFieldMoveFuncs
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x4]
	movs r1, 0
	bl sub_806D538
_0808AF20:
	ldr r0, _0808AF3C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808AF40 @ =sub_808ABF4
	str r0, [r1]
_0808AF2E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF38: .4byte gFieldMoveFuncs
_0808AF3C: .4byte gTasks
_0808AF40: .4byte sub_808ABF4
	thumb_func_end PokemonMenu_FieldMove

	thumb_func_start sub_808AAF0
sub_808AAF0: @ 808AF44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AF80 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808AF78
	ldr r0, _0808AF84 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808AF66
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808AF78
_0808AF66:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl PokemonMenu_Cancel
_0808AF78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF80: .4byte gUnknown_0202E8F6
_0808AF84: .4byte gMain
	thumb_func_end sub_808AAF0

	thumb_func_start sub_808AB34
sub_808AB34: @ 808AF88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AFC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808AFD8
	ldr r0, _0808AFC4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x1E
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bne _0808AFB6
	bl sub_8147588
	lsls r0, 24
	cmp r0, 0
	beq _0808AFCC
_0808AFB6:
	ldr r0, _0808AFC8 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _0808AFD2
	.align 2, 0
_0808AFC0: .4byte gPaletteFade
_0808AFC4: .4byte gTasks
_0808AFC8: .4byte c2_exit_to_overworld_2_switch
_0808AFCC:
	ldr r0, _0808AFE0 @ =sub_80FC074
	bl SetMainCallback2
_0808AFD2:
	adds r0, r4, 0
	bl DestroyTask
_0808AFD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AFE0: .4byte sub_80FC074
	thumb_func_end sub_808AB34

	thumb_func_start sub_808AB90
sub_808AB90: @ 808AFE4
	push {lr}
	bl pal_fill_black
	ldr r0, _0808AFF8 @ =sub_808ABA8
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808AFF8: .4byte sub_808ABA8
	thumb_func_end sub_808AB90

	thumb_func_start sub_808ABA8
sub_808ABA8: @ 808AFFC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B032
	ldr r0, _0808B038 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B03C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0808B040 @ =gUnknown_0202FF84
	str r0, [r1]
	ldr r0, _0808B044 @ =gUnknown_03005CE4
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, 0
	bl DestroyTask
_0808B032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B038: .4byte gUnknown_03005CE0
_0808B03C: .4byte gPlayerParty
_0808B040: .4byte gUnknown_0202FF84
_0808B044: .4byte gUnknown_03005CE4
	thumb_func_end sub_808ABA8

	thumb_func_start sub_808ABF4
sub_808ABF4: @ 808B048
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B07C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808B062
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808B074
_0808B062:
	movs r0, 0x1
	movs r1, 0x11
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl PokemonMenu_Cancel
_0808B074:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B07C: .4byte gMain
	thumb_func_end sub_808ABF4

	thumb_func_start sub_808AC2C
sub_808AC2C: @ 808B080
	push {lr}
	ldr r0, _0808B094 @ =gUnknown_0202FF84
	ldr r1, _0808B098 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x9
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808B094: .4byte gUnknown_0202FF84
_0808B098: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AC2C

	thumb_func_start SetUpFieldMove_Surf
SetUpFieldMove_Surf: @ 808B09C
	push {lr}
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B0D8
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B0D8
	ldr r1, _0808B0C8 @ =gUnknown_0300485C
	ldr r0, _0808B0CC @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808B0D0 @ =gUnknown_03005CE4
	ldr r0, _0808B0D4 @ =sub_808AC2C
	str r0, [r1]
	movs r0, 0x1
	b _0808B0DA
	.align 2, 0
_0808B0C8: .4byte gUnknown_0300485C
_0808B0CC: .4byte sub_808AB90
_0808B0D0: .4byte gUnknown_03005CE4
_0808B0D4: .4byte sub_808AC2C
_0808B0D8:
	movs r0, 0
_0808B0DA:
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Surf

	thumb_func_start sub_808AC8C
sub_808AC8C: @ 808B0E0
	push {lr}
	ldr r0, _0808B0F4 @ =gUnknown_0202FF84
	ldr r1, _0808B0F8 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x1F
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808B0F4: .4byte gUnknown_0202FF84
_0808B0F8: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AC8C

	thumb_func_start SetUpFieldMove_Fly
SetUpFieldMove_Fly: @ 808B0FC
	push {lr}
	bl sub_8147588
	lsls r0, 24
	cmp r0, 0
	beq _0808B124
	ldr r1, _0808B114 @ =gUnknown_0300485C
	ldr r0, _0808B118 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808B11C @ =gUnknown_03005CE4
	ldr r0, _0808B120 @ =sub_81475C4
	b _0808B146
	.align 2, 0
_0808B114: .4byte gUnknown_0300485C
_0808B118: .4byte sub_808AB90
_0808B11C: .4byte gUnknown_03005CE4
_0808B120: .4byte sub_81475C4
_0808B124:
	ldr r0, _0808B138 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B13C
	movs r0, 0
	b _0808B14A
	.align 2, 0
_0808B138: .4byte gMapHeader
_0808B13C:
	ldr r1, _0808B150 @ =gUnknown_0300485C
	ldr r0, _0808B154 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808B158 @ =gUnknown_03005CE4
	ldr r0, _0808B15C @ =sub_808AC8C
_0808B146:
	str r0, [r1]
	movs r0, 0x1
_0808B14A:
	pop {r1}
	bx r1
	.align 2, 0
_0808B150: .4byte gUnknown_0300485C
_0808B154: .4byte sub_808AB90
_0808B158: .4byte gUnknown_03005CE4
_0808B15C: .4byte sub_808AC8C
	thumb_func_end SetUpFieldMove_Fly

	thumb_func_start sub_808AD0C
sub_808AD0C: @ 808B160
	push {r4,lr}
	ldr r4, _0808B168 @ =0x0201b260
	b _0808B178
	.align 2, 0
_0808B168: .4byte 0x0201b260
_0808B16C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B19C
_0808B178:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B16C
	ldrb r0, [r4]
	ldr r1, _0808B1A4 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B1A8 @ =sub_806AEDC
	bl SetMainCallback2
_0808B19C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B1A4: .4byte gUnknown_03005CE0
_0808B1A8: .4byte sub_806AEDC
	thumb_func_end sub_808AD0C

	thumb_func_start sub_808AD58
sub_808AD58: @ 808B1AC
	push {lr}
	ldr r2, _0808B1D0 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0808B1D4 @ =sub_8089CD4
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0
	bl sub_806AF4C
	ldr r0, _0808B1D8 @ =sub_808AD0C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B1D0: .4byte gPaletteFade
_0808B1D4: .4byte sub_8089CD4
_0808B1D8: .4byte sub_808AD0C
	thumb_func_end sub_808AD58

	thumb_func_start unref_sub_808AD88
unref_sub_808AD88: @ 808B1DC
	push {lr}
	ldr r0, _0808B1F8 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B1FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0808B1F8: .4byte gUnknown_03005CE0
_0808B1FC: .4byte gPlayerParty
	thumb_func_end unref_sub_808AD88

	thumb_func_start sub_808ADAC
sub_808ADAC: @ 808B200
	push {lr}
	ldr r0, _0808B214 @ =gUnknown_0202FF84
	ldr r1, _0808B218 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x2C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808B214: .4byte gUnknown_0202FF84
_0808B218: .4byte gUnknown_03005CE0
	thumb_func_end sub_808ADAC

	thumb_func_start SetUpFieldMove_Dive
SetUpFieldMove_Dive: @ 808B21C
	push {lr}
	bl sub_8068F18
	ldr r1, _0808B234 @ =gUnknown_0202FF84
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x4]
	cmp r0, 0
	bne _0808B238
	movs r0, 0
	b _0808B246
	.align 2, 0
_0808B234: .4byte gUnknown_0202FF84
_0808B238:
	ldr r1, _0808B24C @ =gUnknown_0300485C
	ldr r0, _0808B250 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808B254 @ =gUnknown_03005CE4
	ldr r0, _0808B258 @ =sub_808ADAC
	str r0, [r1]
	movs r0, 0x1
_0808B246:
	pop {r1}
	bx r1
	.align 2, 0
_0808B24C: .4byte gUnknown_0300485C
_0808B250: .4byte sub_808AB90
_0808B254: .4byte gUnknown_03005CE4
_0808B258: .4byte sub_808ADAC
	thumb_func_end SetUpFieldMove_Dive

	thumb_func_start sub_808AE08
sub_808AE08: @ 808B25C
	push {lr}
	ldr r0, _0808B270 @ =gUnknown_0202FF84
	ldr r1, _0808B274 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x2B
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808B270: .4byte gUnknown_0202FF84
_0808B274: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AE08

	thumb_func_start SetUpFieldMove_Waterfall
SetUpFieldMove_Waterfall: @ 808B278
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B2D4
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B2D4
	ldr r1, _0808B2C4 @ =gUnknown_0300485C
	ldr r0, _0808B2C8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808B2CC @ =gUnknown_03005CE4
	ldr r0, _0808B2D0 @ =sub_808AE08
	str r0, [r1]
	movs r0, 0x1
	b _0808B2D6
	.align 2, 0
_0808B2C4: .4byte gUnknown_0300485C
_0808B2C8: .4byte sub_808AB90
_0808B2CC: .4byte gUnknown_03005CE4
_0808B2D0: .4byte sub_808AE08
_0808B2D4:
	movs r0, 0
_0808B2D6:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Waterfall

	thumb_func_start sub_808AE8C
sub_808AE8C: @ 808B2E0
	push {r4-r6,lr}
	ldr r0, _0808B32C @ =gScriptItemId
	ldrb r0, [r0]
	subs r0, 0x21
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_0808B2EE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808B330 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808B364
	adds r0, r5, 0
	bl sub_806D668
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808B322
	adds r0, r4, 0
	adds r1, r6, 0
	bl CanMonLearnTMHM
	cmp r0, 0
	bne _0808B334
_0808B322:
	adds r0, r5, 0
	movs r1, 0x9A
	bl sub_806BC3C
	b _0808B364
	.align 2, 0
_0808B32C: .4byte gScriptItemId
_0808B330: .4byte gPlayerParty
_0808B334:
	ldr r0, _0808B358 @ =gScriptItemId
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _0808B35C
	adds r0, r5, 0
	movs r1, 0xA8
	bl sub_806BC3C
	b _0808B364
	.align 2, 0
_0808B358: .4byte gScriptItemId
_0808B35C:
	adds r0, r5, 0
	movs r1, 0x8C
	bl sub_806BC3C
_0808B364:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0808B2EE
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_808AE8C

	thumb_func_start sub_808AF20
sub_808AF20: @ 808B374
	push {r4,r5,lr}
	movs r5, 0
_0808B378:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808B3CC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808B3BA
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808B3AC
	ldr r0, _0808B3D0 @ =gScriptItemId
	ldrh r2, [r0]
	adds r0, r4, 0
	movs r1, 0x3
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	cmp r0, 0
	bne _0808B3BA
_0808B3AC:
	adds r0, r5, 0
	bl sub_806D668
	adds r0, r5, 0
	movs r1, 0
	bl sub_806BC3C
_0808B3BA:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0808B378
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3CC: .4byte gPlayerParty
_0808B3D0: .4byte gScriptItemId
	thumb_func_end sub_808AF20

	thumb_func_start sub_808AF80
sub_808AF80: @ 808B3D4
	push {r4,r5,lr}
	ldr r5, _0808B404 @ =0x0201b260
_0808B3D8:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B460
	ldr r0, _0808B408 @ =gUnknown_02038561
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808B41A
	ldr r0, _0808B40C @ =gScriptItemId
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B410
	cmp r0, 0x2
	beq _0808B416
	b _0808B41A
	.align 2, 0
_0808B404: .4byte 0x0201b260
_0808B408: .4byte gUnknown_02038561
_0808B40C: .4byte gScriptItemId
_0808B410:
	bl sub_808AE8C
	b _0808B41A
_0808B416:
	bl sub_808AF20
_0808B41A:
	ldr r4, _0808B454 @ =gUnknown_03005CE0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0808B436
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B458 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0808B43A
_0808B436:
	movs r0, 0
	strb r0, [r4]
_0808B43A:
	ldrb r0, [r5]
	ldr r1, _0808B454 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B45C @ =sub_806AEDC
	bl SetMainCallback2
	b _0808B46C
	.align 2, 0
_0808B454: .4byte gUnknown_03005CE0
_0808B458: .4byte gPlayerParty
_0808B45C: .4byte sub_806AEDC
_0808B460:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B3D8
_0808B46C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808AF80

	thumb_func_start sub_808B020
sub_808B020: @ 808B474
	push {lr}
	ldr r2, _0808B494 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808B498 @ =gUnknown_02038561
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808B4F4
	cmp r0, 0x1
	bgt _0808B49C
	cmp r0, 0
	beq _0808B4A6
	b _0808B500
	.align 2, 0
_0808B494: .4byte gPaletteFade
_0808B498: .4byte gUnknown_02038561
_0808B49C:
	cmp r0, 0x3
	beq _0808B4F4
	cmp r0, 0x4
	beq _0808B4E0
	b _0808B500
_0808B4A6:
	ldr r0, _0808B4C4 @ =gScriptItemId
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B4CC
	ldr r2, _0808B4C8 @ =sub_808B0C0
	movs r0, 0
	movs r1, 0
	movs r3, 0x14
	bl sub_806AF4C
	b _0808B500
	.align 2, 0
_0808B4C4: .4byte gScriptItemId
_0808B4C8: .4byte sub_808B0C0
_0808B4CC:
	ldr r2, _0808B4DC @ =sub_808B0C0
	movs r0, 0
	movs r1, 0
	movs r3, 0x3
	bl sub_806AF4C
	b _0808B500
	.align 2, 0
_0808B4DC: .4byte sub_808B0C0
_0808B4E0:
	ldr r2, _0808B4F0 @ =sub_808B1EC
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	b _0808B500
	.align 2, 0
_0808B4F0: .4byte sub_808B1EC
_0808B4F4:
	ldr r2, _0808B50C @ =sub_808B0C0
	movs r0, 0
	movs r1, 0
	movs r3, 0x4
	bl sub_806AF4C
_0808B500:
	ldr r0, _0808B510 @ =sub_808AF80
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B50C: .4byte sub_808B0C0
_0808B510: .4byte sub_808AF80
	thumb_func_end sub_808B020

	thumb_func_start sub_808B0C0
sub_808B0C0: @ 808B514
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B540 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0808B622
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0808B544
	cmp r0, 0x2
	beq _0808B5D8
	b _0808B622
	.align 2, 0
_0808B540: .4byte gPaletteFade
_0808B544:
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808B56C @ =gUnknown_03005CE0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B570 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0808B574
	movs r0, 0x20
	bl PlaySE
	b _0808B622
	.align 2, 0
_0808B56C: .4byte gUnknown_03005CE0
_0808B570: .4byte gPlayerParty
_0808B574:
	bl sub_806D5A4
	ldr r5, _0808B5C0 @ =gUnknown_02038561
	ldrb r0, [r5]
	cmp r0, 0
	bne _0808B590
	ldr r3, _0808B5C4 @ =gUnknown_03004AE4
	ldr r0, _0808B5C8 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808B5CC @ =sub_808B224
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
_0808B590:
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _0808B5A8
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808B5C8 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808B5D0 @ =sub_808B2EC
	adds r0, r4, 0
	bl sub_806E964
_0808B5A8:
	ldrb r0, [r5]
	cmp r0, 0x3
	bne _0808B622
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808B5D4 @ =sub_808B2B4
	adds r0, r4, 0
	bl sub_806EC44
	b _0808B622
	.align 2, 0
_0808B5C0: .4byte gUnknown_02038561
_0808B5C4: .4byte gUnknown_03004AE4
_0808B5C8: .4byte gScriptItemId
_0808B5CC: .4byte sub_808B224
_0808B5D0: .4byte sub_808B2EC
_0808B5D4: .4byte sub_808B2B4
_0808B5D8:
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808B62C @ =gUnknown_03005CE0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _0808B630 @ =gUnknown_02038561
	ldrb r0, [r2]
	cmp r0, 0x1
	bhi _0808B60E
	ldr r0, _0808B634 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B638 @ =sub_808B25C
	str r0, [r1]
_0808B60E:
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0808B622
	ldr r0, _0808B634 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B63C @ =sub_808B2B4
	str r0, [r1]
_0808B622:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B62C: .4byte gUnknown_03005CE0
_0808B630: .4byte gUnknown_02038561
_0808B634: .4byte gTasks
_0808B638: .4byte sub_808B25C
_0808B63C: .4byte sub_808B2B4
	thumb_func_end sub_808B0C0

	thumb_func_start sub_808B1EC
sub_808B1EC: @ 808B640
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B668 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B662
	ldr r3, _0808B66C @ =gUnknown_03004AE4
	ldr r0, _0808B670 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808B674 @ =sub_808B224
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
_0808B662:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B668: .4byte gPaletteFade
_0808B66C: .4byte gUnknown_03004AE4
_0808B670: .4byte gScriptItemId
_0808B674: .4byte sub_808B224
	thumb_func_end sub_808B1EC

	thumb_func_start sub_808B224
sub_808B224: @ 808B678
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B6A8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B6AC @ =sub_808B25C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B6A8: .4byte gTasks
_0808B6AC: .4byte sub_808B25C
	thumb_func_end sub_808B224

	thumb_func_start sub_808B25C
sub_808B25C: @ 808B6B0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B6D4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B6CE
	ldr r0, _0808B6D8 @ =sub_80A5B40
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808B6CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B6D4: .4byte gPaletteFade
_0808B6D8: .4byte sub_80A5B40
	thumb_func_end sub_808B25C

	thumb_func_start sub_808B288
sub_808B288: @ 808B6DC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B700 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B6FA
	ldr r0, _0808B704 @ =sub_813B6F8
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808B6FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B700: .4byte gPaletteFade
_0808B704: .4byte sub_813B6F8
	thumb_func_end sub_808B288

	thumb_func_start sub_808B2B4
sub_808B2B4: @ 808B708
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B738 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B73C @ =sub_808B288
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B738: .4byte gTasks
_0808B73C: .4byte sub_808B288
	thumb_func_end sub_808B2B4

	thumb_func_start sub_808B2EC
sub_808B2EC: @ 808B740
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B770 @ =gUnknown_0202E8F4
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0808B77C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B774 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B778 @ =sub_808B338
	str r1, [r0]
	b _0808B782
	.align 2, 0
_0808B770: .4byte gUnknown_0202E8F4
_0808B774: .4byte gTasks
_0808B778: .4byte sub_808B338
_0808B77C:
	adds r0, r4, 0
	bl sub_808B224
_0808B782:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808B2EC

	thumb_func_start sub_808B338
sub_808B338: @ 808B78C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808B7E0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B7D8
	adds r0, r5, 0
	bl sub_806CA38
	ldr r1, _0808B7E4 @ =gUnknown_03005CE0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B7E8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808B7EC @ =0x02028280
	adds r1, r0
	ldr r2, _0808B7F0 @ =sub_808B3EC
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
_0808B7D8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B7E0: .4byte gPaletteFade
_0808B7E4: .4byte gUnknown_03005CE0
_0808B7E8: .4byte gPlayerParty
_0808B7EC: .4byte 0x02028280
_0808B7F0: .4byte sub_808B3EC
	thumb_func_end sub_808B338

	thumb_func_start sub_808B3A0
sub_808B3A0: @ 808B7F4
	push {r4,lr}
	ldr r4, _0808B7FC @ =0x0201b260
	b _0808B80C
	.align 2, 0
_0808B7FC: .4byte 0x0201b260
_0808B800:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B830
_0808B80C:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B800
	ldrb r0, [r4]
	ldr r1, _0808B838 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B83C @ =sub_806AEDC
	bl SetMainCallback2
_0808B830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B838: .4byte gUnknown_03005CE0
_0808B83C: .4byte sub_806AEDC
	thumb_func_end sub_808B3A0

	thumb_func_start sub_808B3EC
sub_808B3EC: @ 808B840
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808B8B8 @ =gPaletteFade
	mov r8, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x80
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	ldr r0, _0808B8BC @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _0808B8D4
	ldr r7, _0808B8C0 @ =gUnknown_0202E8F8
	ldrh r0, [r7]
	cmp r0, 0
	beq _0808B86A
	movs r1, 0x1
	bl RemoveBagItem
_0808B86A:
	ldr r6, _0808B8C4 @ =gUnknown_03005CE0
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0808B8C8 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl AddBagItem
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	bl sub_80A2DF8
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	adds r2, r7, 0
	bl SetMonData
	ldr r0, _0808B8CC @ =sub_808B25C
	movs r1, 0x5
	bl CreateTask
	mov r0, r8
	ldrb r1, [r0, 0x8]
	movs r0, 0x7F
	ands r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	ldr r0, _0808B8D0 @ =sub_806AEDC
	b _0808B8E2
	.align 2, 0
_0808B8B8: .4byte gPaletteFade
_0808B8BC: .4byte gScriptResult
_0808B8C0: .4byte gUnknown_0202E8F8
_0808B8C4: .4byte gUnknown_03005CE0
_0808B8C8: .4byte gPlayerParty
_0808B8CC: .4byte sub_808B25C
_0808B8D0: .4byte sub_806AEDC
_0808B8D4:
	ldr r2, _0808B8F0 @ =sub_808B4A4
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	ldr r0, _0808B8F4 @ =sub_808B3A0
_0808B8E2:
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B8F0: .4byte sub_808B4A4
_0808B8F4: .4byte sub_808B3A0
	thumb_func_end sub_808B3EC

	thumb_func_start sub_808B4A4
sub_808B4A4: @ 808B8F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B92C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B926
	ldr r0, _0808B930 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	ldr r1, _0808B934 @ =gScriptItemId
	ldrh r1, [r1]
	movs r2, 0x1
	bl sub_806EBF0
	ldr r1, _0808B938 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B93C @ =sub_808B4EC
	str r1, [r0]
_0808B926:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B92C: .4byte gPaletteFade
_0808B930: .4byte gUnknown_03005CE0
_0808B934: .4byte gScriptItemId
_0808B938: .4byte gTasks
_0808B93C: .4byte sub_808B4EC
	thumb_func_end sub_808B4A4

	thumb_func_start sub_808B4EC
sub_808B4EC: @ 808B940
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0808B958 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808B954
	adds r0, r1, 0
	bl sub_808B224
_0808B954:
	pop {r0}
	bx r0
	.align 2, 0
_0808B958: .4byte gUnknown_0202E8F6
	thumb_func_end sub_808B4EC

	thumb_func_start sub_808B508
sub_808B508: @ 808B95C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808B224
	pop {r0}
	bx r0
	thumb_func_end sub_808B508

	thumb_func_start sub_808B518
sub_808B518: @ 808B96C
	push {r4,lr}
	ldr r4, _0808B974 @ =0x0201b260
	b _0808B984
	.align 2, 0
_0808B974: .4byte 0x0201b260
_0808B978:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B9A8
_0808B984:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B978
	ldrb r0, [r4]
	ldr r1, _0808B9B0 @ =gUnknown_020384F0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B9B4 @ =sub_806AEDC
	bl SetMainCallback2
_0808B9A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B9B0: .4byte gUnknown_020384F0
_0808B9B4: .4byte sub_806AEDC
	thumb_func_end sub_808B518

	thumb_func_start sub_808B564
sub_808B564: @ 808B9B8
	push {lr}
	ldr r2, _0808B9E0 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	bl sub_809FA30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _0808B9E8
	ldr r2, _0808B9E4 @ =sub_806F490
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	b _0808B9F4
	.align 2, 0
_0808B9E0: .4byte gPaletteFade
_0808B9E4: .4byte sub_806F490
_0808B9E8:
	ldr r2, _0808BA00 @ =sub_806F588
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
_0808B9F4:
	ldr r0, _0808BA04 @ =sub_808B518
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808BA00: .4byte sub_806F588
_0808BA04: .4byte sub_808B518
	thumb_func_end sub_808B564

	thumb_func_start sub_808B5B4
sub_808B5B4: @ 808BA08
	push {lr}
	ldr r3, _0808BA2C @ =gUnknown_03005CF0
	ldr r2, _0808BA30 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, [r1]
	str r2, [r3]
	ldr r2, _0808BA34 @ =sub_808B5E4
	str r2, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0808BA2C: .4byte gUnknown_03005CF0
_0808BA30: .4byte gTasks
_0808BA34: .4byte sub_808B5E4
	thumb_func_end sub_808B5B4

	thumb_func_start sub_808B5E4
sub_808B5E4: @ 808BA38
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _0808BA56
	ldr r1, _0808BA5C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808BA60 @ =gUnknown_03005CF0
	ldr r1, [r1]
	str r1, [r0]
_0808BA56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808BA5C: .4byte gTasks
_0808BA60: .4byte gUnknown_03005CF0
_0808BA64:
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
_0808BA7C:
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_808B5E4

	.align 2, 0 @ Don't pad with nop.
