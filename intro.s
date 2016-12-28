	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start VBlankCB_Intro
VBlankCB_Intro: @ 813BB60
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_Intro

	thumb_func_start MainCB2_Intro
MainCB2_Intro: @ 813BB74
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0813BBA4 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _0813BBB0
	ldr r0, _0813BBA8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813BBB0
	ldr r0, _0813BBAC @ =MainCB2_EndIntro
	bl SetMainCallback2
	b _0813BBC0
	.align 2, 0
_0813BBA4: .4byte gMain
_0813BBA8: .4byte gPaletteFade
_0813BBAC: .4byte MainCB2_EndIntro
_0813BBB0:
	ldr r2, _0813BBC4 @ =gIntroFrameCounter
	ldr r1, [r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0813BBC0
	adds r0, r1, 0x1
	str r0, [r2]
_0813BBC0:
	pop {r0}
	bx r0
	.align 2, 0
_0813BBC4: .4byte gIntroFrameCounter
	thumb_func_end MainCB2_Intro

	thumb_func_start MainCB2_EndIntro
MainCB2_EndIntro: @ 813BBC8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0813BBDA
	ldr r0, _0813BBE0 @ =CB2_InitTitleScreen
	bl SetMainCallback2
_0813BBDA:
	pop {r0}
	bx r0
	.align 2, 0
_0813BBE0: .4byte CB2_InitTitleScreen
	thumb_func_end MainCB2_EndIntro

	thumb_func_start LoadCopyrightGraphics
LoadCopyrightGraphics: @ 813BBE4
	push {r4-r6,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0813BC24 @ =gIntroCopyright_Gfx
	movs r6, 0xC0
	lsls r6, 19
	adds r3, r6
	adds r1, r3, 0
	bl LZ77UnCompVram
	ldr r0, _0813BC28 @ =gIntroCopyright_Pal
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0813BC2C @ =gIntroCopyright_Tilemap
	adds r4, r6
	movs r2, 0xA0
	lsls r2, 2
	adds r1, r4, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BC24: .4byte gIntroCopyright_Gfx
_0813BC28: .4byte gIntroCopyright_Pal
_0813BC2C: .4byte gIntroCopyright_Tilemap
	thumb_func_end LoadCopyrightGraphics

	thumb_func_start SerialCb_CopyrightScreen
SerialCb_CopyrightScreen: @ 813BC30
	push {lr}
	ldr r0, _0813BC3C @ =gUnknown_03005EE0
	bl GameCubeMultiBoot_HandleSerialInterrupt
	pop {r0}
	bx r0
	.align 2, 0
_0813BC3C: .4byte gUnknown_03005EE0
	thumb_func_end SerialCb_CopyrightScreen

	thumb_func_start SetUpCopyrightScreen
SetUpCopyrightScreen: @ 813BC40
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _0813BC5C @ =gMain
	ldr r1, _0813BC60 @ =0x0000043c
	adds r5, r0, r1
	ldrb r4, [r5]
	cmp r4, 0x8C
	bne _0813BC52
	b _0813BDA0
_0813BC52:
	cmp r4, 0x8C
	bgt _0813BC64
	cmp r4, 0
	beq _0813BC6C
	b _0813BD3E
	.align 2, 0
_0813BC5C: .4byte gMain
_0813BC60: .4byte 0x0000043c
_0813BC64:
	cmp r4, 0x8D
	bne _0813BC6A
	b _0813BDCC
_0813BC6A:
	b _0813BD3E
_0813BC6C:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0813BD58 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _0813BD5C @ =0x00007fff
	adds r0, r2, 0
	strh r0, [r1]
	movs r5, 0x80
	lsls r5, 19
	strh r4, [r5]
	ldr r0, _0813BD60 @ =REG_BG0HOFS
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	add r0, sp, 0x4
	strh r4, [r0]
	ldr r1, _0813BD64 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0813BD68 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0813BD6C @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r1]
	ldr r0, _0813BD70 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _0813BD74 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	movs r1, 0xE0
	lsls r1, 6
	movs r0, 0
	movs r2, 0
	bl LoadCopyrightGraphics
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813BD78 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813BD7C @ =REG_BG0CNT
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0813BD80 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0813BD84 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0813BD88 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0813BD8C @ =VBlankCB_Intro
	bl SetVBlankCallback
	movs r1, 0xA0
	lsls r1, 1
	adds r0, r1, 0
	strh r0, [r5]
	ldr r0, _0813BD90 @ =SerialCb_CopyrightScreen
	bl SetSerialCallback
	ldr r0, _0813BD94 @ =gUnknown_03005EE0
	bl GameCubeMultiBoot_Init
_0813BD3E:
	bl UpdatePaletteFade
	ldr r0, _0813BD98 @ =gMain
	ldr r2, _0813BD9C @ =0x0000043c
	adds r0, r2
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _0813BD94 @ =gUnknown_03005EE0
	bl GameCubeMultiBoot_Main
	b _0813BE14
	.align 2, 0
_0813BD58: .4byte REG_BLDCNT
_0813BD5C: .4byte 0x00007fff
_0813BD60: .4byte REG_BG0HOFS
_0813BD64: .4byte 0x040000d4
_0813BD68: .4byte 0x8100c000
_0813BD6C: .4byte 0x85000100
_0813BD70: .4byte 0x05000002
_0813BD74: .4byte 0x810001ff
_0813BD78: .4byte 0x0000ffff
_0813BD7C: .4byte REG_BG0CNT
_0813BD80: .4byte 0x04000208
_0813BD84: .4byte 0x04000200
_0813BD88: .4byte REG_DISPSTAT
_0813BD8C: .4byte VBlankCB_Intro
_0813BD90: .4byte SerialCb_CopyrightScreen
_0813BD94: .4byte gUnknown_03005EE0
_0813BD98: .4byte gMain
_0813BD9C: .4byte 0x0000043c
_0813BDA0:
	ldr r4, _0813BDC8 @ =gUnknown_03005EE0
	adds r0, r4, 0
	bl GameCubeMultiBoot_Main
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	beq _0813BE14
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0813BE14
	.align 2, 0
_0813BDC8: .4byte gUnknown_03005EE0
_0813BDCC:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0813BE14
	ldr r0, _0813BDF4 @ =Task_IntroLoadPart1Graphics
	movs r1, 0
	bl CreateTask
	ldr r0, _0813BDF8 @ =MainCB2_Intro
	bl SetMainCallback2
	ldr r1, _0813BDFC @ =gUnknown_03005EE0
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	beq _0813BE00
	adds r0, r1, 0
	bl GameCubeMultiBoot_ExecuteProgram
	b _0813BE0A
	.align 2, 0
_0813BDF4: .4byte Task_IntroLoadPart1Graphics
_0813BDF8: .4byte MainCB2_Intro
_0813BDFC: .4byte gUnknown_03005EE0
_0813BE00:
	bl GameCubeMultiBoot_Quit
	ldr r0, _0813BE10 @ =SerialCB
	bl SetSerialCallback
_0813BE0A:
	movs r0, 0
	b _0813BE16
	.align 2, 0
_0813BE10: .4byte SerialCB
_0813BE14:
	movs r0, 0x1
_0813BE16:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end SetUpCopyrightScreen

	thumb_func_start c2_copyright_1
c2_copyright_1: @ 813BA44
	push {lr}
	bl SetUpCopyrightScreen
	lsls r0, 24
	cmp r0, 0
	bne _0813BA7A
	bl sub_8052E4C
	bl sub_81251B8
	movs r0, 0
	bl sub_8125EC8
	ldr r0, _0813BA80 @ =gSaveFileStatus
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813BA6A
	cmp r0, 0x2
	bne _0813BA6E
_0813BA6A:
	bl ClearSav2
_0813BA6E:
	ldr r0, _0813BA84 @ =gSaveBlock2
	ldrb r0, [r0, 0x15]
	lsls r0, 31
	lsrs r0, 31
	bl SetPokemonCryStereo
_0813BA7A:
	pop {r0}
	bx r0
	.align 2, 0
_0813BA80: .4byte gSaveFileStatus
_0813BA84: .4byte gSaveBlock2
	thumb_func_end c2_copyright_1

	thumb_func_start CB2_InitCopyrightScreen
CB2_InitCopyrightScreen: @ 813BA88
	push {lr}
	bl SetUpCopyrightScreen
	pop {r0}
	bx r0
	thumb_func_end CB2_InitCopyrightScreen

	thumb_func_start Task_IntroLoadPart1Graphics
Task_IntroLoadPart1Graphics: @ 813BE70
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	bl SetVBlankCallback
	ldr r4, _0813BFF4 @ =gUnknown_02039318
	bl Random
	movs r1, 0x1
	ands r1, r0
	strh r1, [r4]
	bl intro_reset_and_hide_bgs
	ldr r0, _0813BFF8 @ =REG_BG3VOFS
	movs r6, 0
	strh r6, [r0]
	ldr r1, _0813BFFC @ =REG_BG2VOFS
	movs r0, 0x50
	strh r0, [r1]
	subs r1, 0x4
	movs r0, 0x18
	strh r0, [r1]
	subs r1, 0x4
	movs r0, 0x28
	strh r0, [r1]
	ldr r0, _0813C000 @ =gUnknown_08407764
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0813C004 @ =gUnknown_08406B74
	ldr r1, _0813C008 @ =0x06008000
	bl LZ77UnCompVram
	ldr r1, _0813C00C @ =0x06008800
	add r0, sp, 0x8
	strh r6, [r0]
	ldr r4, _0813C010 @ =0x040000d4
	str r0, [r4]
	str r1, [r4, 0x4]
	ldr r5, _0813C014 @ =0x81000400
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813C018 @ =gUnknown_08406F28
	ldr r1, _0813C01C @ =0x06009000
	bl LZ77UnCompVram
	ldr r1, _0813C020 @ =0x06009800
	add r0, sp, 0x8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813C024 @ =gUnknown_0840725C
	ldr r1, _0813C028 @ =0x0600a000
	bl LZ77UnCompVram
	ldr r1, _0813C02C @ =0x0600a800
	add r0, sp, 0x8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813C030 @ =gUnknown_0840754C
	ldr r1, _0813C034 @ =0x0600b000
	bl LZ77UnCompVram
	ldr r1, _0813C038 @ =0x0600b800
	add r0, sp, 0x8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813C03C @ =gUnknown_08406974
	movs r5, 0x80
	lsls r5, 2
	movs r1, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r1, _0813C040 @ =REG_BG3CNT
	ldr r2, _0813C044 @ =0x00009603
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r3, _0813C048 @ =0x00009402
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0813C04C @ =0x00009201
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	movs r3, 0x90
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0813C050 @ =gUnknown_0840B008
	bl LoadCompressedObjectPic
	ldr r0, _0813C054 @ =gUnknown_0840B018
	bl LoadCompressedObjectPic
	ldr r0, _0813C058 @ =gUnknown_0840B028
	bl LoadSpritePalettes
	ldr r4, _0813C05C @ =0x0202ecc8
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0x10
	bl CpuSet
	movs r2, 0xE1
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r4, 0
	movs r2, 0xF
	bl CpuSet
	movs r3, 0xD2
	lsls r3, 1
	adds r1, r4, r3
	adds r0, r4, 0
	movs r2, 0xE
	bl CpuSet
	movs r0, 0xC3
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xD
	bl CpuSet
	movs r2, 0xB4
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r4, 0
	movs r2, 0xC
	bl CpuSet
	movs r3, 0xA5
	lsls r3, 1
	adds r1, r4, r3
	adds r0, r4, 0
	movs r2, 0xB
	bl CpuSet
	movs r0, 0x96
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xA
	bl CpuSet
	movs r1, 0xE
	negs r1, r1
	movs r0, 0x78
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0xEC
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_813D584
	ldr r2, _0813C060 @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
	ldr r0, _0813C064 @ =Task_IntroFadeIn
	str r0, [r1]
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BFF4: .4byte gUnknown_02039318
_0813BFF8: .4byte REG_BG3VOFS
_0813BFFC: .4byte REG_BG2VOFS
_0813C000: .4byte gUnknown_08407764
_0813C004: .4byte gUnknown_08406B74
_0813C008: .4byte 0x06008000
_0813C00C: .4byte 0x06008800
_0813C010: .4byte 0x040000d4
_0813C014: .4byte 0x81000400
_0813C018: .4byte gUnknown_08406F28
_0813C01C: .4byte 0x06009000
_0813C020: .4byte 0x06009800
_0813C024: .4byte gUnknown_0840725C
_0813C028: .4byte 0x0600a000
_0813C02C: .4byte 0x0600a800
_0813C030: .4byte gUnknown_0840754C
_0813C034: .4byte 0x0600b000
_0813C038: .4byte 0x0600b800
_0813C03C: .4byte gUnknown_08406974
_0813C040: .4byte REG_BG3CNT
_0813C044: .4byte 0x00009603
_0813C048: .4byte 0x00009402
_0813C04C: .4byte 0x00009201
_0813C050: .4byte gUnknown_0840B008
_0813C054: .4byte gUnknown_0840B018
_0813C058: .4byte gUnknown_0840B028
_0813C05C: .4byte 0x0202ecc8
_0813C060: .4byte gTasks
_0813C064: .4byte Task_IntroFadeIn
	thumb_func_end Task_IntroLoadPart1Graphics

	thumb_func_start Task_IntroFadeIn
Task_IntroFadeIn: @ 813C068
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0813C0BC @ =VBlankCB_Intro
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813C0C0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C0C4 @ =Task_IntroWaterDrops
	str r1, [r0]
	ldr r0, _0813C0C8 @ =gIntroFrameCounter
	str r5, [r0]
	movs r0, 0xCF
	lsls r0, 1
	bl m4aSongNumStart
	bl ResetSerial
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C0BC: .4byte VBlankCB_Intro
_0813C0C0: .4byte gTasks
_0813C0C4: .4byte Task_IntroWaterDrops
_0813C0C8: .4byte gIntroFrameCounter
	thumb_func_end Task_IntroFadeIn

	thumb_func_start Task_IntroWaterDrops
Task_IntroWaterDrops: @ 813C0CC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	ldr r4, _0813C1B0 @ =gIntroFrameCounter
	ldr r0, [r4]
	cmp r0, 0x4C
	bne _0813C0FA
	ldr r2, _0813C1B4 @ =gSprites
	ldr r1, _0813C1B8 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r6, 0x8
	ldrsh r1, [r0, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
_0813C0FA:
	ldr r0, [r4]
	cmp r0, 0xFB
	bne _0813C11C
	ldr r2, _0813C1B4 @ =gSprites
	ldr r1, _0813C1B8 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r3, 0x8
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
_0813C11C:
	ldr r1, [r4]
	movs r0, 0xB8
	lsls r0, 1
	cmp r1, r0
	bne _0813C13C
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x70
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x30
	movs r1, 0
	movs r3, 0x5
	bl sub_813D584
_0813C13C:
	ldr r1, [r4]
	movs r0, 0xC0
	lsls r0, 1
	cmp r1, r0
	bne _0813C15C
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x80
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0xC8
	movs r1, 0x3C
	movs r3, 0x9
	bl sub_813D584
_0813C15C:
	ldr r1, [r4]
	movs r0, 0x8C
	lsls r0, 2
	cmp r1, r0
	bne _0813C17C
	ldr r0, _0813C1BC @ =sub_813CCE8
	movs r1, 0
	bl CreateTask
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x78
	movs r1, 0x50
	bl sub_813D954
_0813C17C:
	ldr r1, [r4]
	ldr r0, _0813C1C0 @ =0x000002e3
	cmp r1, r0
	bls _0813C1A6
	ldr r1, _0813C1B8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x50
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r1, 0x18
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	movs r1, 0x28
	strh r1, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldr r1, _0813C1C4 @ =task_intro_4
	str r1, [r0]
_0813C1A6:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813C1B0: .4byte gIntroFrameCounter
_0813C1B4: .4byte gSprites
_0813C1B8: .4byte gTasks
_0813C1BC: .4byte sub_813CCE8
_0813C1C0: .4byte 0x000002e3
_0813C1C4: .4byte task_intro_4
	thumb_func_end Task_IntroWaterDrops

	thumb_func_start task_intro_4
task_intro_4: @ 813C1C8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r0, _0813C25C @ =gIntroFrameCounter
	ldr r3, [r0]
	ldr r0, _0813C260 @ =0x00000387
	cmp r3, r0
	bhi _0813C288
	ldr r0, _0813C264 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	lsls r0, 16
	ldrh r2, [r1, 0xC]
	adds r0, r2
	ldr r2, _0813C268 @ =0xffff4000
	adds r0, r2
	asrs r2, r0, 16
	strh r2, [r1, 0xA]
	strh r0, [r1, 0xC]
	ldr r0, _0813C26C @ =REG_BG2VOFS
	strh r2, [r0]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	lsls r0, 16
	ldrh r2, [r1, 0x10]
	adds r0, r2
	ldr r2, _0813C270 @ =0xffff0000
	adds r0, r2
	asrs r2, r0, 16
	strh r2, [r1, 0xE]
	strh r0, [r1, 0x10]
	ldr r0, _0813C274 @ =REG_BG1VOFS
	strh r2, [r0]
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	lsls r0, 16
	ldrh r2, [r1, 0x14]
	adds r0, r2
	ldr r2, _0813C278 @ =0xfffe8000
	adds r0, r2
	asrs r2, r0, 16
	strh r2, [r1, 0x12]
	strh r0, [r1, 0x14]
	ldr r0, _0813C27C @ =REG_BG0VOFS
	strh r2, [r0]
	movs r0, 0xDC
	lsls r0, 2
	cmp r3, r0
	bne _0813C2AE
	ldr r0, _0813C280 @ =gSpriteTemplate_840AFF0
	movs r1, 0xC8
	movs r2, 0xA0
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813C284 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0813C2AE
	.align 2, 0
_0813C25C: .4byte gIntroFrameCounter
_0813C260: .4byte 0x00000387
_0813C264: .4byte gTasks
_0813C268: .4byte 0xffff4000
_0813C26C: .4byte REG_BG2VOFS
_0813C270: .4byte 0xffff0000
_0813C274: .4byte REG_BG1VOFS
_0813C278: .4byte 0xfffe8000
_0813C27C: .4byte REG_BG0VOFS
_0813C280: .4byte gSpriteTemplate_840AFF0
_0813C284: .4byte gSprites
_0813C288:
	ldr r0, _0813C2B8 @ =0x000003ef
	cmp r3, r0
	bls _0813C2AE
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C2BC @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813C2C0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C2C4 @ =task_intro_5
	str r1, [r0]
_0813C2AE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C2B8: .4byte 0x000003ef
_0813C2BC: .4byte 0x0000ffff
_0813C2C0: .4byte gTasks
_0813C2C4: .4byte task_intro_5
	thumb_func_end task_intro_4

	thumb_func_start task_intro_5
task_intro_5: @ 813C2C8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813C2EC @ =gIntroFrameCounter
	ldr r1, [r0]
	ldr r0, _0813C2F0 @ =0x00000402
	cmp r1, r0
	bls _0813C2E6
	ldr r0, _0813C2F4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813C2F8 @ =Task_IntroLoadPart2Graphics
	str r0, [r1]
_0813C2E6:
	pop {r0}
	bx r0
	.align 2, 0
_0813C2EC: .4byte gIntroFrameCounter
_0813C2F0: .4byte 0x00000402
_0813C2F4: .4byte gTasks
_0813C2F8: .4byte Task_IntroLoadPart2Graphics
	thumb_func_end task_intro_5

	thumb_func_start Task_IntroLoadPart2Graphics
Task_IntroLoadPart2Graphics: @ 813C2FC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl intro_reset_and_hide_bgs
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0813C33C @ =gUnknown_02039358
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0813C340 @ =gUnknown_0203935A
	strh r1, [r0]
	movs r0, 0x1
	bl load_intro_part2_graphics
	ldr r1, _0813C344 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C348 @ =Task_IntroStartBikeRide
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C33C: .4byte gUnknown_02039358
_0813C340: .4byte gUnknown_0203935A
_0813C344: .4byte gTasks
_0813C348: .4byte Task_IntroStartBikeRide
	thumb_func_end Task_IntroLoadPart2Graphics

	thumb_func_start Task_IntroStartBikeRide
Task_IntroStartBikeRide: @ 813C34C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813C364 @ =gUnknown_02039318
	ldrh r0, [r0]
	cmp r0, 0
	bne _0813C36C
	ldr r0, _0813C368 @ =gIntro2BrendanSpriteSheet
	bl LoadCompressedObjectPic
	b _0813C372
	.align 2, 0
_0813C364: .4byte gUnknown_02039318
_0813C368: .4byte gIntro2BrendanSpriteSheet
_0813C36C:
	ldr r0, _0813C398 @ =gIntro2MaySpriteSheet
	bl LoadCompressedObjectPic
_0813C372:
	ldr r0, _0813C39C @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _0813C3A0 @ =gIntro2LatiosSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _0813C3A4 @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	ldr r0, _0813C3A8 @ =gUnknown_02039318
	ldrh r0, [r0]
	cmp r0, 0
	bne _0813C3AC
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x64
	bl intro_create_brendan_sprite
	b _0813C3B6
	.align 2, 0
_0813C398: .4byte gIntro2MaySpriteSheet
_0813C39C: .4byte gIntro2BicycleSpriteSheet
_0813C3A0: .4byte gIntro2LatiosSpriteSheet
_0813C3A4: .4byte gIntro2SpritePalettes
_0813C3A8: .4byte gUnknown_02039318
_0813C3AC:
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x64
	bl intro_create_may_sprite
_0813C3B6:
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _0813C43C @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r2, 0
	adds r5, 0x1C
	adds r3, r0, r5
	ldr r1, _0813C440 @ =sub_813D788
	str r1, [r3]
	adds r2, 0x8
	adds r0, r2
	ldr r1, _0813C444 @ =gUnknown_0840AE80
	str r1, [r0]
	ldr r0, _0813C448 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	strh r6, [r4, 0xA]
	movs r0, 0x40
	negs r0, r0
	movs r1, 0x3C
	bl intro_create_latios_sprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r1, _0813C44C @ =sub_813D880
	str r1, [r0]
	strh r6, [r4, 0xC]
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C450 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0813C454 @ =VBlankCB_Intro
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 7
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x1
	movs r3, 0x10
	bl sub_8148EC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	movs r0, 0x1
	bl sub_8148C78
	ldr r0, _0813C458 @ =task_intro_8
	str r0, [r4]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C43C: .4byte gSprites
_0813C440: .4byte sub_813D788
_0813C444: .4byte gUnknown_0840AE80
_0813C448: .4byte gTasks
_0813C44C: .4byte sub_813D880
_0813C450: .4byte 0x0000ffff
_0813C454: .4byte VBlankCB_Intro
_0813C458: .4byte task_intro_8
	thumb_func_end Task_IntroStartBikeRide

	thumb_func_start task_intro_8
task_intro_8: @ 813C45C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _0813C598 @ =gIntroFrameCounter
	ldr r1, [r5]
	ldr r0, _0813C59C @ =0x0000071f
	cmp r1, r0
	bls _0813C490
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C5A0 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813C5A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C5A8 @ =task_intro_9
	str r1, [r0]
_0813C490:
	ldr r1, [r5]
	ldr r0, _0813C5AC @ =0x00000455
	ldr r3, _0813C5A4 @ =gTasks
	cmp r1, r0
	bne _0813C4B4
	ldr r2, _0813C5B0 @ =gSprites
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
_0813C4B4:
	ldr r1, [r5]
	ldr r0, _0813C5B4 @ =0x000004be
	cmp r1, r0
	bne _0813C4D6
	ldr r2, _0813C5B0 @ =gSprites
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
_0813C4D6:
	ldr r1, [r5]
	ldr r0, _0813C5B8 @ =0x00000572
	cmp r1, r0
	bne _0813C4F8
	ldr r2, _0813C5B0 @ =gSprites
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xC
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
_0813C4F8:
	ldr r1, [r5]
	ldr r0, _0813C5BC @ =0x00000576
	cmp r1, r0
	bne _0813C51A
	ldr r2, _0813C5B0 @ =gSprites
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
_0813C51A:
	ldr r1, [r5]
	ldr r0, _0813C5C0 @ =0x00000632
	cmp r1, r0
	bne _0813C53C
	ldr r2, _0813C5B0 @ =gSprites
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0, 0x2E]
_0813C53C:
	ldr r1, [r5]
	ldr r0, _0813C5C4 @ =0x000006bf
	cmp r1, r0
	bne _0813C55E
	ldr r2, _0813C5B0 @ =gSprites
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r4, 0xA
	ldrsh r1, [r0, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x4
	strh r1, [r0, 0x2E]
_0813C55E:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 18
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0x30
	bl Sin
	ldr r1, _0813C5C8 @ =gUnknown_0203935A
	strh r0, [r1]
	ldrh r2, [r4, 0xE]
	movs r7, 0xE
	ldrsh r1, [r4, r7]
	ldr r0, _0813C5CC @ =0x000001ff
	cmp r1, r0
	bgt _0813C58A
	adds r0, r2, 0x1
	strh r0, [r4, 0xE]
_0813C58A:
	movs r0, 0x1
	bl sub_8149020
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C598: .4byte gIntroFrameCounter
_0813C59C: .4byte 0x0000071f
_0813C5A0: .4byte 0x0000ffff
_0813C5A4: .4byte gTasks
_0813C5A8: .4byte task_intro_9
_0813C5AC: .4byte 0x00000455
_0813C5B0: .4byte gSprites
_0813C5B4: .4byte 0x000004be
_0813C5B8: .4byte 0x00000572
_0813C5BC: .4byte 0x00000576
_0813C5C0: .4byte 0x00000632
_0813C5C4: .4byte 0x000006bf
_0813C5C8: .4byte gUnknown_0203935A
_0813C5CC: .4byte 0x000001ff
	thumb_func_end task_intro_8

	thumb_func_start task_intro_9
task_intro_9: @ 813C5D0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813C5FC @ =gIntroFrameCounter
	ldr r1, [r0]
	ldr r0, _0813C600 @ =0x00000814
	cmp r1, r0
	bls _0813C5F4
	ldr r0, _0813C604 @ =gTasks
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl DestroyTask
	ldr r0, _0813C608 @ =task_intro_10
	str r0, [r4]
_0813C5F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C5FC: .4byte gIntroFrameCounter
_0813C600: .4byte 0x00000814
_0813C604: .4byte gTasks
_0813C608: .4byte task_intro_10
	thumb_func_end task_intro_9

	thumb_func_start task_intro_10
task_intro_10: @ 813C60C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl intro_reset_and_hide_bgs
	ldr r0, _0813C69C @ =gUnknown_08409C04
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0813C6A0 @ =gUnknown_08409AD4
	ldr r1, _0813C6A4 @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _0813C6A8 @ =gUnknown_084098D4
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadPalette
	ldr r0, _0813C6AC @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r5, 0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r0, 0x78
	movs r1, 0x50
	movs r2, 0
	movs r3, 0
	bl sub_813CE30
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C6B0 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813C6B4 @ =REG_BG2CNT
	ldr r2, _0813C6B8 @ =0x00004883
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	ldr r2, _0813C6BC @ =0x00001441
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0813C6C0 @ =task_intro_11
	str r0, [r4]
	ldr r0, _0813C6C4 @ =gIntroFrameCounter
	str r5, [r0]
	movs r0, 0xDD
	lsls r0, 1
	bl m4aSongNumStart
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C69C: .4byte gUnknown_08409C04
_0813C6A0: .4byte gUnknown_08409AD4
_0813C6A4: .4byte 0x06004000
_0813C6A8: .4byte gUnknown_084098D4
_0813C6AC: .4byte gTasks
_0813C6B0: .4byte 0x0000ffff
_0813C6B4: .4byte REG_BG2CNT
_0813C6B8: .4byte 0x00004883
_0813C6BC: .4byte 0x00001441
_0813C6C0: .4byte task_intro_11
_0813C6C4: .4byte gIntroFrameCounter
	thumb_func_end task_intro_10

	thumb_func_start task_intro_11
task_intro_11: @ 813C6C8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0813C700 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r1, 0x80
	lsls r1, 3
	adds r0, r1, 0
	ldrh r1, [r3, 0x8]
	adds r0, r1
	strh r0, [r3, 0x8]
	ldrh r4, [r3, 0xA]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	ldr r0, _0813C704 @ =0x000006bf
	cmp r1, r0
	bgt _0813C708
	ldrh r0, [r3, 0xC]
	adds r1, r4, r0
	strh r1, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	b _0813C70C
	.align 2, 0
_0813C700: .4byte gTasks
_0813C704: .4byte 0x000006bf
_0813C708:
	ldr r0, _0813C754 @ =task_intro_12
	str r0, [r3]
_0813C70C:
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r2
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x80
	lsls r0, 9
	bl __divsi3
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldrh r3, [r4, 0x8]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_813CE30
	ldr r0, _0813C758 @ =gIntroFrameCounter
	ldr r0, [r0]
	cmp r0, 0x2C
	bne _0813C74A
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C75C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0813C74A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C754: .4byte task_intro_12
_0813C758: .4byte gIntroFrameCounter
_0813C75C: .4byte 0x0000ffff
	thumb_func_end task_intro_11

	thumb_func_start task_intro_12
task_intro_12: @ 813C760
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813C780 @ =gIntroFrameCounter
	ldr r0, [r0]
	cmp r0, 0x3B
	bls _0813C77C
	ldr r0, _0813C784 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813C788 @ =task_intro_13
	str r0, [r1]
_0813C77C:
	pop {r0}
	bx r0
	.align 2, 0
_0813C780: .4byte gIntroFrameCounter
_0813C784: .4byte gTasks
_0813C788: .4byte task_intro_13
	thumb_func_end task_intro_12

	thumb_func_start task_intro_13
task_intro_13: @ 813C78C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl intro_reset_and_hide_bgs
	movs r1, 0
	ldr r2, _0813C8C0 @ =0x02000000
	movs r7, 0
	adds r6, r2, 0
	adds r6, 0x20
	adds r5, r2, 0
	adds r5, 0x40
	mov r12, r2
	movs r4, 0x11
	movs r3, 0x22
_0813C7B0:
	adds r0, r1, r2
	strb r7, [r0]
	adds r0, r1, r6
	strb r4, [r0]
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1F
	bls _0813C7B0
	movs r1, 0xC0
	lsls r1, 19
	ldr r0, _0813C8C4 @ =0x040000d4
	mov r2, r12
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0813C8C8 @ =0x80000030
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r1, 0
	ldr r5, _0813C8CC @ =gPlttBufferUnfaded
	ldr r6, _0813C8D0 @ =gPlttBufferFaded
	mov r0, r8
	lsls r7, r0, 2
	ldr r4, _0813C8D4 @ =0x06003000
	ldr r2, _0813C8D8 @ =0x0000f001
	adds r3, r2, 0
	ldr r2, _0813C8DC @ =0x0000027f
_0813C7EA:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _0813C7EA
	movs r1, 0
	ldr r3, _0813C8E0 @ =0x06003800
	ldr r0, _0813C8E4 @ =0x0000f002
	adds r2, r0, 0
_0813C802:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7F
	bls _0813C802
	movs r1, 0
	ldr r4, _0813C8E8 @ =0x06003900
	movs r2, 0xF0
	lsls r2, 8
	adds r3, r2, 0
	ldr r2, _0813C8EC @ =0x0000017f
_0813C81E:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _0813C81E
	movs r1, 0
	ldr r3, _0813C8F0 @ =0x06003c00
	ldr r0, _0813C8E4 @ =0x0000f002
	adds r2, r0, 0
_0813C836:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7F
	bls _0813C836
	movs r0, 0xF0
	lsls r0, 1
	adds r2, r5, r0
	movs r4, 0
	ldr r1, _0813C8F4 @ =0x00007fff
	strh r1, [r2]
	adds r0, r6, r0
	strh r1, [r0]
	movs r0, 0x1
	bl sub_813D084
	movs r0, 0xF2
	lsls r0, 1
	adds r1, r5, r0
	strh r4, [r1]
	adds r0, r6, r0
	strh r4, [r0]
	ldr r0, _0813C8F8 @ =gUnknown_0840A778
	ldr r1, _0813C8FC @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _0813C900 @ =gUnknown_0840A7E4
	ldr r1, _0813C904 @ =0x06007000
	bl LZ77UnCompVram
	ldr r0, _0813C908 @ =gUnknown_0840A758
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0813C90C @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0813C910 @ =gUnknown_0840B20C
	bl LoadCompressedObjectPic
	ldr r0, _0813C914 @ =gUnknown_0840B21C
	bl LoadCompressedObjectPic
	ldr r0, _0813C918 @ =gUnknown_0840B22C
	bl LoadCompressedObjectPalette
	ldr r0, _0813C91C @ =gUnknown_0840B23C
	bl LoadSpritePalettes
	ldr r1, _0813C920 @ =gTasks
	mov r2, r8
	adds r0, r7, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C924 @ =task_intro_14
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C8C0: .4byte 0x02000000
_0813C8C4: .4byte 0x040000d4
_0813C8C8: .4byte 0x80000030
_0813C8CC: .4byte gPlttBufferUnfaded
_0813C8D0: .4byte gPlttBufferFaded
_0813C8D4: .4byte 0x06003000
_0813C8D8: .4byte 0x0000f001
_0813C8DC: .4byte 0x0000027f
_0813C8E0: .4byte 0x06003800
_0813C8E4: .4byte 0x0000f002
_0813C8E8: .4byte 0x06003900
_0813C8EC: .4byte 0x0000017f
_0813C8F0: .4byte 0x06003c00
_0813C8F4: .4byte 0x00007fff
_0813C8F8: .4byte gUnknown_0840A778
_0813C8FC: .4byte 0x06004000
_0813C900: .4byte gUnknown_0840A7E4
_0813C904: .4byte 0x06007000
_0813C908: .4byte gUnknown_0840A758
_0813C90C: .4byte gReservedSpritePaletteCount
_0813C910: .4byte gUnknown_0840B20C
_0813C914: .4byte gUnknown_0840B21C
_0813C918: .4byte gUnknown_0840B22C
_0813C91C: .4byte gUnknown_0840B23C
_0813C920: .4byte gTasks
_0813C924: .4byte task_intro_14
	thumb_func_end task_intro_13

	thumb_func_start task_intro_14
task_intro_14: @ 813C928
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0813C998 @ =REG_WIN0H
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x1C
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1D
	strh r0, [r1]
	subs r1, 0x3C
	ldr r2, _0813C99C @ =0x00000603
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x6
	adds r2, 0xFD
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x8
	movs r2, 0xE5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0813C9A0 @ =sub_813CAF4
	movs r1, 0
	bl CreateTask
	ldr r5, _0813C9A4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	strh r0, [r1, 0x26]
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	strh r3, [r0, 0x8]
	strh r3, [r1, 0x8]
	ldr r0, _0813C9A8 @ =task_intro_15
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C998: .4byte REG_WIN0H
_0813C99C: .4byte 0x00000603
_0813C9A0: .4byte sub_813CAF4
_0813C9A4: .4byte gTasks
_0813C9A8: .4byte task_intro_15
	thumb_func_end task_intro_14

	thumb_func_start task_intro_15
task_intro_15: @ 813C9AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813C9DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r1, [r3, 0x8]
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	cmp r0, 0x20
	beq _0813C9E4
	adds r0, r1, 0x4
	strh r0, [r3, 0x8]
	ldr r2, _0813C9E0 @ =REG_WIN0V
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	lsls r0, 8
	subs r1, 0x9C
	subs r0, r1
	strh r0, [r2]
	b _0813C9F2
	.align 2, 0
_0813C9DC: .4byte gTasks
_0813C9E0: .4byte REG_WIN0V
_0813C9E4:
	ldr r0, _0813C9F8 @ =REG_WIN0V
	movs r2, 0x82
	lsls r2, 6
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0813C9FC @ =task_intro_16
	str r0, [r3]
_0813C9F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C9F8: .4byte REG_WIN0V
_0813C9FC: .4byte task_intro_16
	thumb_func_end task_intro_15

	thumb_func_start task_intro_16
task_intro_16: @ 813CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813CA14 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813CA18 @ =task_intro_17
	str r0, [r1]
	bx lr
	.align 2, 0
_0813CA14: .4byte gTasks
_0813CA18: .4byte task_intro_17
	thumb_func_end task_intro_16

	thumb_func_start task_intro_17
task_intro_17: @ 813CA1C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813CA38 @ =gUnknown_0203931A
	movs r1, 0
	strh r1, [r2]
	ldr r2, _0813CA3C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813CA40 @ =Task_IntroPokemonBattle
	str r0, [r1]
	bx lr
	.align 2, 0
_0813CA38: .4byte gUnknown_0203931A
_0813CA3C: .4byte gTasks
_0813CA40: .4byte Task_IntroPokemonBattle
	thumb_func_end task_intro_17

	thumb_func_start Task_IntroPokemonBattle
Task_IntroPokemonBattle: @ 813CA44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813CE00 @ =gIntroFrameCounter
	mov r8, r0
	ldr r0, [r0]
	cmp r0, 0x50
	bne _0813CA88
	ldr r0, _0813CE04 @ =0x0000014b
	movs r4, 0x1
	str r4, [sp]
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x5
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _0813CE0C @ =sub_813DB9C
	str r2, [r1]
	adds r0, r3
	movs r1, 0
	strh r4, [r0, 0x30]
	strh r1, [r0, 0x32]
_0813CA88:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, 0x98
	bne _0813CABE
	ldr r0, _0813CE10 @ =0x00000169
	movs r4, 0x1
	str r4, [sp]
	movs r1, 0
	movs r2, 0xA0
	movs r3, 0x4
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _0813CE0C @ =sub_813DB9C
	str r2, [r1]
	adds r0, r3
	movs r1, 0x2
	strh r1, [r0, 0x30]
	strh r4, [r0, 0x32]
_0813CABE:
	mov r3, r8
	ldr r0, [r3]
	cmp r0, 0xDB
	bne _0813CAFC
	movs r0, 0
	bl sub_813D084
	ldr r0, _0813CE14 @ =gUnknown_02039318
	ldrh r0, [r0]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x60
	movs r3, 0x6
	bl sub_813CFA8
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CE18 @ =sub_813DE70
	str r1, [r0]
	ldr r1, _0813CE1C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
_0813CAFC:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bne _0813CB34
	ldr r3, _0813CE1C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r3
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r3
	movs r2, 0x4
	strh r2, [r0, 0x8]
	ldr r2, _0813CE08 @ =gSprites
	movs r3, 0xA
	ldrsh r1, [r1, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
_0813CB34:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xC0
	lsls r0, 1
	cmp r1, r0
	bne _0813CB6C
	ldr r3, _0813CE1C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r3
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r3
	movs r2, 0
	strh r2, [r0, 0x8]
	ldr r2, _0813CE08 @ =gSprites
	movs r3, 0xA
	ldrsh r1, [r1, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x4
	strh r1, [r0, 0x2E]
_0813CB6C:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xC8
	lsls r0, 1
	cmp r1, r0
	bne _0813CB8A
	movs r0, 0xFF
	lsls r0, 16
	ldr r1, _0813CE20 @ =0x00007eff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0813CB8A:
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0xD8
	lsls r0, 1
	cmp r1, r0
	bne _0813CBB2
	ldr r2, _0813CE08 @ =gSprites
	ldr r1, _0813CE1C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x2E]
_0813CBB2:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xE7
	lsls r0, 1
	cmp r1, r0
	bne _0813CBEA
	ldr r3, _0813CE08 @ =gSprites
	ldr r4, _0813CE1C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r4
	movs r0, 0xA
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x6
	strh r2, [r0, 0x2E]
	movs r3, 0x26
	ldrsh r1, [r1, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x8]
_0813CBEA:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CE24 @ =0x000001cf
	cmp r1, r0
	bne _0813CC30
	movs r0, 0x1
	bl sub_813D084
	ldr r0, _0813CE04 @ =0x0000014b
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xD0
	movs r2, 0x8
	movs r3, 0x5
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CE28 @ =sub_813E10C
	str r1, [r0]
	ldr r1, _0813CE1C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xC]
	adds r0, r2, 0
	bl sub_813E7C0
_0813CC30:
	mov r3, r8
	ldr r1, [r3]
	ldr r0, _0813CE2C @ =0x0000021b
	cmp r1, r0
	bne _0813CC70
	subs r0, 0xB2
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xF8
	movs r2, 0x10
	movs r3, 0x4
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CE28 @ =sub_813E10C
	str r1, [r0]
	ldr r1, _0813CE1C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xE]
	adds r0, r2, 0
	bl sub_813E930
_0813CC70:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CE30 @ =0x0000026f
	cmp r1, r0
	bne _0813CCB4
	ldr r4, _0813CE08 @ =gSprites
	ldr r5, _0813CE1C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r5
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	movs r3, 0x2
	strh r3, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r3, 0x26
	ldrsh r1, [r1, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x3
	strh r1, [r0, 0x8]
_0813CCB4:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x9C
	lsls r0, 2
	cmp r1, r0
	bne _0813CCFC
	movs r0, 0
	bl sub_813D084
	ldr r0, _0813CE34 @ =0x0000011b
	movs r1, 0
	str r1, [sp]
	movs r1, 0x20
	movs r2, 0x98
	movs r3, 0
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CE38 @ =sub_813E210
	str r1, [r0]
	ldr r1, _0813CE1C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	adds r0, r2, 0
	bl sub_813EDBC
_0813CCFC:
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0xAF
	lsls r0, 2
	cmp r1, r0
	bne _0813CD42
	movs r0, 0x8C
	lsls r0, 1
	movs r1, 0x8
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x1
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CE08 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CE38 @ =sub_813E210
	str r1, [r0]
	ldr r1, _0813CE1C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x12]
	adds r0, r2, 0
	bl sub_813EB4C
_0813CD42:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xC2
	lsls r0, 2
	cmp r1, r0
	bne _0813CD8E
	ldr r1, _0813CE3C @ =gUnknown_0203931A
	movs r0, 0x1
	strh r0, [r1]
	ldr r4, _0813CE08 @ =gSprites
	ldr r6, _0813CE1C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r6
	movs r3, 0x10
	ldrsh r2, [r1, r3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	movs r5, 0
	movs r3, 0x2
	strh r3, [r0, 0x2E]
	movs r0, 0x12
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r3, 0x26
	ldrsh r1, [r1, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r5, [r0, 0x8]
_0813CD8E:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CE40 @ =0x0000030d
	cmp r1, r0
	bne _0813CE52
	movs r0, 0x2
	bl sub_813D084
	ldr r4, _0813CE08 @ =gSprites
	ldr r0, _0813CE1C @ =gTasks
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r2, r0
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0x3
	strh r3, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r0, 0x12
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	ldr r0, _0813CE44 @ =gSpriteTemplate_840B1F4
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0xF
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	b _0813CE48
	.align 2, 0
_0813CE00: .4byte gIntroFrameCounter
_0813CE04: .4byte 0x0000014b
_0813CE08: .4byte gSprites
_0813CE0C: .4byte sub_813DB9C
_0813CE10: .4byte 0x00000169
_0813CE14: .4byte gUnknown_02039318
_0813CE18: .4byte sub_813DE70
_0813CE1C: .4byte gTasks
_0813CE20: .4byte 0x00007eff
_0813CE24: .4byte 0x000001cf
_0813CE28: .4byte sub_813E10C
_0813CE2C: .4byte 0x0000021b
_0813CE30: .4byte 0x0000026f
_0813CE34: .4byte 0x0000011b
_0813CE38: .4byte sub_813E210
_0813CE3C: .4byte gUnknown_0203931A
_0813CE40: .4byte 0x0000030d
_0813CE44: .4byte gSpriteTemplate_840B1F4
_0813CE48:
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0813CE52:
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0xC8
	lsls r0, 2
	cmp r1, r0
	bne _0813CE64
	movs r0, 0x67
	bl PlaySE
_0813CE64:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CEA4 @ =0x00000352
	cmp r1, r0
	bne _0813CE80
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813CEA8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0813CE80:
	mov r3, r8
	ldr r1, [r3]
	ldr r0, _0813CEAC @ =0x000003b2
	cmp r1, r0
	bne _0813CE98
	ldr r0, _0813CEB0 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813CEB4 @ =task_intro_19
	str r0, [r1]
_0813CE98:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813CEA4: .4byte 0x00000352
_0813CEA8: .4byte 0x0000ffff
_0813CEAC: .4byte 0x000003b2
_0813CEB0: .4byte gTasks
_0813CEB4: .4byte task_intro_19
	thumb_func_end Task_IntroPokemonBattle

	thumb_func_start task_intro_19
task_intro_19: @ 813CEB8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _0813CECC @ =MainCB2_EndIntro
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813CECC: .4byte MainCB2_EndIntro
	thumb_func_end task_intro_19

	.align 2, 0 @ Don't pad with nop.
