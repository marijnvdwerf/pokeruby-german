	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetStarterPokemon
GetStarterPokemon: @ 810A25C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _0810A268
	movs r1, 0
_0810A268:
	ldr r0, _0810A274 @ =gStarterMons
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0810A274: .4byte gStarterMons
	thumb_func_end GetStarterPokemon

	thumb_func_start VblankCallback
VblankCallback: @ 810A278
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VblankCallback

	thumb_func_start CB2_ChooseStarter
CB2_ChooseStarter: @ 810A28C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r10, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _0810A498 @ =0x0400000e
	strh r1, [r6]
	ldr r3, _0810A49C @ =0x0400000c
	mov r8, r3
	strh r1, [r3]
	adds r0, 0xA
	strh r1, [r0]
	ldr r5, _0810A4A0 @ =0x04000008
	strh r1, [r5]
	adds r0, 0x12
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _0810A4A4 @ =0x040000d4
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _0810A4A8 @ =0x8100c000
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0
	mov r9, r0
	str r0, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _0810A4AC @ =0x85000100
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	mov r3, r9
	strh r3, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _0810A4B0 @ =0x81000200
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0810A4B4 @ =gBirchHelpGfx
	bl LZ77UnCompVram
	ldr r0, _0810A4B8 @ =gBirchBagTilemap
	ldr r1, _0810A4BC @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _0810A4C0 @ =gBirchGrassTilemap
	ldr r1, _0810A4C4 @ =0x06003800
	bl LZ77UnCompVram
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _0810A4C8 @ =gBirchBagGrassPal
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0810A4CC @ =gUnknown_083F7794
	bl LoadCompressedObjectPic
	ldr r0, _0810A4D0 @ =gUnknown_083F77A4
	bl LoadCompressedObjectPic
	ldr r0, _0810A4D4 @ =gUnknown_083F77B4
	bl LoadSpritePalettes
	ldr r0, _0810A4D8 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _0810A4DC @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	movs r0, 0x1
	negs r0, r0
	mov r1, r9
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _0810A4E0 @ =0x04000208
	ldrh r2, [r3]
	mov r0, r9
	strh r0, [r3]
	ldr r4, _0810A4E4 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0810A4E8 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0810A4EC @ =VblankCallback
	bl SetVBlankCallback
	ldr r0, _0810A4F0 @ =MainCallback2
	bl SetMainCallback2
	ldr r1, _0810A4F4 @ =0x04000048
	movs r0, 0x3F
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1F
	strh r0, [r1]
	ldr r0, _0810A4F8 @ =0x04000040
	mov r1, r9
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _0810A4FC @ =0x04000050
	movs r0, 0xFE
	strh r0, [r1]
	ldr r0, _0810A500 @ =0x04000052
	mov r3, r9
	strh r3, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	ldr r1, _0810A504 @ =0x00000703
	adds r0, r1, 0
	strh r0, [r6]
	ldr r3, _0810A508 @ =0x00000602
	adds r0, r3, 0
	mov r1, r8
	strh r0, [r1]
	ldr r3, _0810A50C @ =0x00001f08
	adds r0, r3, 0
	strh r0, [r5]
	movs r1, 0xF5
	lsls r1, 6
	adds r0, r1, 0
	mov r3, r10
	strh r0, [r3]
	ldr r0, _0810A510 @ =Task_StarterChoose1
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0810A514 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	mov r10, r1
	mov r3, r10
	strh r3, [r0, 0x8]
	ldr r0, _0810A518 @ =gSpriteTemplate_83F77CC
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810A51C @ =gSprites
	mov r8, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r4, [r1, 0x2E]
	ldr r6, _0810A520 @ =gSpriteTemplate_83F77E4
	ldr r5, _0810A524 @ =gStarterChoose_PokeballCoords
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	adds r0, r6, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r4, [r1, 0x2E]
	mov r3, r9
	strh r3, [r1, 0x30]
	ldrb r1, [r5, 0x2]
	ldrb r2, [r5, 0x3]
	adds r0, r6, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r4, [r1, 0x2E]
	mov r0, r10
	strh r0, [r1, 0x30]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x5]
	adds r0, r6, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r4, [r1, 0x2E]
	movs r0, 0x2
	strh r0, [r1, 0x30]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A498: .4byte 0x0400000e
_0810A49C: .4byte 0x0400000c
_0810A4A0: .4byte 0x04000008
_0810A4A4: .4byte 0x040000d4
_0810A4A8: .4byte 0x8100c000
_0810A4AC: .4byte 0x85000100
_0810A4B0: .4byte 0x81000200
_0810A4B4: .4byte gBirchHelpGfx
_0810A4B8: .4byte gBirchBagTilemap
_0810A4BC: .4byte 0x06003000
_0810A4C0: .4byte gBirchGrassTilemap
_0810A4C4: .4byte 0x06003800
_0810A4C8: .4byte gBirchBagGrassPal
_0810A4CC: .4byte gUnknown_083F7794
_0810A4D0: .4byte gUnknown_083F77A4
_0810A4D4: .4byte gUnknown_083F77B4
_0810A4D8: .4byte gWindowConfig_81E6C3C
_0810A4DC: .4byte gWindowConfig_81E6CE4
_0810A4E0: .4byte 0x04000208
_0810A4E4: .4byte 0x04000200
_0810A4E8: .4byte 0x04000004
_0810A4EC: .4byte VblankCallback
_0810A4F0: .4byte MainCallback2
_0810A4F4: .4byte 0x04000048
_0810A4F8: .4byte 0x04000040
_0810A4FC: .4byte 0x04000050
_0810A500: .4byte 0x04000052
_0810A504: .4byte 0x00000703
_0810A508: .4byte 0x00000602
_0810A50C: .4byte 0x00001f08
_0810A510: .4byte Task_StarterChoose1
_0810A514: .4byte gTasks
_0810A518: .4byte gSpriteTemplate_83F77CC
_0810A51C: .4byte gSprites
_0810A520: .4byte gSpriteTemplate_83F77E4
_0810A524: .4byte gStarterChoose_PokeballCoords
	thumb_func_end CB2_ChooseStarter

	thumb_func_start MainCallback2
MainCallback2: @ 810A528
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end MainCallback2

	thumb_func_start Task_StarterChoose1
Task_StarterChoose1: @ 810A540
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810A578 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r1, [r4, 0x8]
	movs r0, 0xFF
	bl CreateStarterPokemonLabel
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0810A57C @ =gOtherText_BirchInTrouble
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _0810A580 @ =Task_StarterChoose2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A578: .4byte gTasks
_0810A57C: .4byte gOtherText_BirchInTrouble
_0810A580: .4byte Task_StarterChoose2
	thumb_func_end Task_StarterChoose1

	thumb_func_start Task_StarterChoose2
Task_StarterChoose2: @ 810A584
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0810A624 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r6, r0, r2
	ldrh r7, [r6, 0x8]
	ldrb r4, [r6, 0x8]
	ldr r1, _0810A628 @ =gMain
	ldrh r3, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0810A64C
	ldr r1, _0810A62C @ =gStarterChoose_LabelCoords
	lsls r4, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, 0x1
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r2, r0, 0
	adds r2, 0xD
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x3
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	ldr r0, _0810A630 @ =0x04000040
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r0, _0810A634 @ =gSpriteTemplate_83F77FC
	ldr r1, _0810A638 @ =gStarterChoose_PokeballCoords
	adds r2, r4, r1
	ldrb r5, [r2]
	adds r1, 0x1
	adds r4, r1
	ldrb r4, [r4]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xC]
	ldrh r0, [r6, 0x8]
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreatePokemonFrontSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0810A63C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r4, 0
	adds r2, 0x10
	adds r2, r1, r2
	ldr r3, _0810A640 @ =gUnknown_083F778C
	str r3, [r2]
	adds r4, 0x1C
	adds r1, r4
	ldr r2, _0810A644 @ =StarterPokemonSpriteAnimCallback
	str r2, [r1]
	strh r0, [r6, 0xA]
	ldr r0, _0810A648 @ =Task_StarterChoose3
	str r0, [r6]
	b _0810A68E
	.align 2, 0
_0810A624: .4byte gTasks
_0810A628: .4byte gMain
_0810A62C: .4byte gStarterChoose_LabelCoords
_0810A630: .4byte 0x04000040
_0810A634: .4byte gSpriteTemplate_83F77FC
_0810A638: .4byte gStarterChoose_PokeballCoords
_0810A63C: .4byte gSprites
_0810A640: .4byte gUnknown_083F778C
_0810A644: .4byte StarterPokemonSpriteAnimCallback
_0810A648: .4byte Task_StarterChoose3
_0810A64C:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0810A668
	cmp r4, 0
	beq _0810A668
	subs r1, r7, 0x1
	strh r1, [r6, 0x8]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl CreateStarterPokemonLabel
	b _0810A68E
_0810A668:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0810A68E
	cmp r4, 0x1
	bhi _0810A68E
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl CreateStarterPokemonLabel
_0810A68E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_StarterChoose2

	thumb_func_start Task_StarterChoose3
Task_StarterChoose3: @ 810A694
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0810A6D8 @ =gSprites
	ldr r2, _0810A6DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0810A6D2
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x78
	bne _0810A6D2
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x40
	bne _0810A6D2
	ldr r0, _0810A6E0 @ =Task_StarterChoose4
	str r0, [r2]
_0810A6D2:
	pop {r0}
	bx r0
	.align 2, 0
_0810A6D8: .4byte gSprites
_0810A6DC: .4byte gTasks
_0810A6E0: .4byte Task_StarterChoose4
	thumb_func_end Task_StarterChoose3

	thumb_func_start Task_StarterChoose4
Task_StarterChoose4: @ 810A6E4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810A730 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x8]
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl PlayCry1
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0810A734 @ =gOtherText_DoYouChoosePoke
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0810A738 @ =Task_StarterChoose5
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810A730: .4byte gTasks
_0810A734: .4byte gOtherText_DoYouChoosePoke
_0810A738: .4byte Task_StarterChoose5
	thumb_func_end Task_StarterChoose4

	thumb_func_start Task_StarterChoose5
Task_StarterChoose5: @ 810A73C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0810A762
	cmp r1, 0
	bgt _0810A75C
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0810A788
	b _0810A7EE
_0810A75C:
	cmp r1, 0x1
	beq _0810A788
	b _0810A7EE
_0810A762:
	ldr r2, _0810A77C @ =gScriptResult
	ldr r1, _0810A780 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strh r0, [r2]
	ldr r0, _0810A784 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	b _0810A7EE
	.align 2, 0
_0810A77C: .4byte gScriptResult
_0810A780: .4byte gTasks
_0810A784: .4byte gMain
_0810A788:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1B
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _0810A7F4 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	ldrb r0, [r5, 0xA]
	ldr r6, _0810A7F8 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	ldrb r0, [r5, 0xC]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _0810A7FC @ =Task_StarterChoose6
	str r0, [r5]
_0810A7EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810A7F4: .4byte gTasks
_0810A7F8: .4byte gSprites
_0810A7FC: .4byte Task_StarterChoose6
	thumb_func_end Task_StarterChoose5

	thumb_func_start Task_StarterChoose6
Task_StarterChoose6: @ 810A800
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810A814 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810A818 @ =Task_StarterChoose1
	str r0, [r1]
	bx lr
	.align 2, 0
_0810A814: .4byte gTasks
_0810A818: .4byte Task_StarterChoose1
	thumb_func_end Task_StarterChoose6

	thumb_func_start AddTextColorCtrlCode
AddTextColorCtrlCode: @ 810A81C
	push {r4,lr}
	movs r4, 0xFC
	strb r4, [r0]
	adds r0, 0x1
	movs r4, 0x4
	strb r4, [r0]
	adds r0, 0x1
	strb r2, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strb r3, [r0, 0x1]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end AddTextColorCtrlCode

	thumb_func_start CreateStarterPokemonLabel
CreateStarterPokemonLabel: @ 810A838
	push {r4-r7,lr}
	sub sp, 0x48
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0xFF
	beq _0810A872
	ldr r1, _0810A960 @ =gStarterChoose_LabelCoords
	lsls r2, r0, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r1, 0x1
	adds r2, r1
	ldrb r1, [r2]
	adds r2, r0, 0
	adds r2, 0xD
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x3
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	ldr r0, _0810A964 @ =0x04000040
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
_0810A872:
	adds r0, r5, 0
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r6, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	bl GetPokemonCategory
	adds r4, r0, 0
	mov r0, sp
	movs r1, 0
	movs r2, 0xF
	movs r3, 0x8
	bl AddTextColorCtrlCode
	movs r2, 0x8
	movs r3, 0
	ldrb r0, [r4]
	lsls r5, 1
	mov r7, sp
	adds r7, 0x5
	cmp r0, 0xFF
	beq _0810A8CA
_0810A8A8:
	mov r0, sp
	adds r1, r0, r2
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0810A8CA
	cmp r3, 0xA
	bls _0810A8A8
_0810A8CA:
	mov r0, sp
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	mov r1, sp
	movs r0, 0xFC
	strb r0, [r1, 0x5]
	movs r0, 0x11
	strb r0, [r1, 0x6]
	mov r2, sp
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 1
	movs r0, 0x70
	subs r0, r1
	asrs r0, 1
	strb r0, [r2, 0x7]
	ldr r0, _0810A960 @ =gStarterChoose_LabelCoords
	adds r1, r5, r0
	ldrb r4, [r1]
	adds r0, 0x1
	adds r0, r5, r0
	ldrb r5, [r0]
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0
	movs r2, 0xF
	movs r3, 0x8
	bl AddTextColorCtrlCode
	movs r0, 0xB
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _0810A968 @ =gSpeciesNames
	adds r1, r0
	adds r0, r7, 0
	movs r2, 0x70
	movs r3, 0x2
	bl sub_8072C74
	adds r2, r5, 0x2
	lsls r2, 24
	lsrs r2, 24
	mov r0, sp
	adds r1, r4, 0
	bl MenuPrint
	lsls r0, r4, 3
	adds r0, 0x4
	lsls r0, 24
	adds r4, 0xD
	lsls r4, 3
	adds r4, 0x4
	lsls r4, 24
	lsrs r4, 24
	lsls r1, r5, 27
	adds r5, 0x4
	lsls r5, 27
	lsrs r5, 24
	ldr r2, _0810A964 @ =0x04000040
	lsrs r0, 16
	orrs r0, r4
	strh r0, [r2]
	ldr r0, _0810A96C @ =0x04000044
	lsrs r1, 16
	orrs r1, r5
	strh r1, [r0]
	add sp, 0x48
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810A960: .4byte gStarterChoose_LabelCoords
_0810A964: .4byte 0x04000040
_0810A968: .4byte gSpeciesNames
_0810A96C: .4byte 0x04000044
	thumb_func_end CreateStarterPokemonLabel

	thumb_func_start nullsub_72
nullsub_72: @ 810A970
	bx lr
	thumb_func_end nullsub_72

	thumb_func_start CreatePokemonFrontSprite
CreatePokemonFrontSprite: @ 810A974
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	mov r8, r1
	mov r9, r2
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r6, r5, 3
	ldr r0, _0810AA04 @ =gMonFrontPicTable
	adds r0, r6, r0
	ldr r1, _0810AA08 @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _0810AA0C @ =gUnknown_081FAF4C
	ldr r3, [r4]
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	ldr r0, _0810AA10 @ =gMonPaletteTable
	adds r6, r0
	adds r0, r6, 0
	bl LoadCompressedObjectPalette
	adds r0, r5, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0810AA14 @ =gUnknown_02024E8C
	mov r1, r8
	mov r2, r9
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0810AA18 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r1, r2, r1
	ldr r3, _0810AA1C @ =nullsub_72
	str r3, [r1]
	adds r2, r4
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0810AA04: .4byte gMonFrontPicTable
_0810AA08: .4byte gMonFrontPicCoords
_0810AA0C: .4byte gUnknown_081FAF4C
_0810AA10: .4byte gMonPaletteTable
_0810AA14: .4byte gUnknown_02024E8C
_0810AA18: .4byte gSprites
_0810AA1C: .4byte nullsub_72
	thumb_func_end CreatePokemonFrontSprite

	thumb_func_start sub_810A62C
sub_810A62C: @ 810AA20
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0810AA78 @ =gUnknown_083F76E4
	ldr r3, _0810AA7C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r4, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	lsls r0, 1
	adds r2, 0x1
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x4
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810AA78: .4byte gUnknown_083F76E4
_0810AA7C: .4byte gTasks
	thumb_func_end sub_810A62C

	thumb_func_start sub_810A68C
sub_810A68C: @ 810AA80
	push {lr}
	adds r3, r0, 0
	ldr r2, _0810AAA8 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _0810AAAC
	adds r0, r3, 0
	movs r1, 0x1
	bl StartSpriteAnimIfDifferent
	b _0810AAB4
	.align 2, 0
_0810AAA8: .4byte gTasks
_0810AAAC:
	adds r0, r3, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
_0810AAB4:
	pop {r0}
	bx r0
	thumb_func_end sub_810A68C

	thumb_func_start StarterPokemonSpriteAnimCallback
StarterPokemonSpriteAnimCallback: @ 810AAB8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x78
	ble _0810AACA
	subs r0, r2, 0x4
	strh r0, [r1, 0x20]
_0810AACA:
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x77
	bgt _0810AAD8
	adds r0, r2, 0x4
	strh r0, [r1, 0x20]
_0810AAD8:
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x40
	ble _0810AAE6
	subs r0, r2, 0x2
	strh r0, [r1, 0x22]
_0810AAE6:
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _0810AAF4
	adds r0, r2, 0x2
	strh r0, [r1, 0x22]
_0810AAF4:
	pop {r0}
	bx r0
	thumb_func_end StarterPokemonSpriteAnimCallback

	.align 2, 0 @ Don't pad with nop.
