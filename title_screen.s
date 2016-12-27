	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SpriteCallback_VersionBannerLeft
SpriteCallback_VersionBannerLeft: @ 807C1C0
	push {r4,lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0807C1F4
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807C1F8
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	movs r0, 0x54
	strh r0, [r2, 0x22]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x59
	ands r0, r1
	strb r0, [r2]
	b _0807C240
	.align 2, 0
_0807C1F4: .4byte gTasks
_0807C1F8:
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0807C206
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
_0807C206:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	bgt _0807C240
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x22]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r0, 0x54
	beq _0807C22A
	adds r0, r1, 0x1
	strh r0, [r2, 0x22]
_0807C22A:
	ldr r3, _0807C248
	ldr r2, _0807C24C
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
_0807C240:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C248: .4byte 0x04000052
_0807C24C: .4byte gUnknown_08393E64
	thumb_func_end SpriteCallback_VersionBannerLeft

	thumb_func_start SpriteCallback_VersionBannerRight
SpriteCallback_VersionBannerRight: @ 807C250
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0807C284
	adds r1, r0, r1
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0807C288
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	movs r0, 0x54
	strh r0, [r2, 0x22]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x59
	ands r0, r1
	strb r0, [r2]
	b _0807C2AC
	.align 2, 0
_0807C284: .4byte gTasks
_0807C288:
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _0807C2AC
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x22]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r0, 0x54
	beq _0807C2AC
	adds r0, r1, 0x1
	strh r0, [r2, 0x22]
_0807C2AC:
	pop {r0}
	bx r0
	thumb_func_end SpriteCallback_VersionBannerRight

	thumb_func_start SpriteCallback_PressStartCopyrightBanner
SpriteCallback_PressStartCopyrightBanner: @ 807C2B0
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _0807C2D8
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0807C2D8
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0807C2E4
_0807C2D8:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0807C2E4:
	pop {r0}
	bx r0
	thumb_func_end SpriteCallback_PressStartCopyrightBanner

	thumb_func_start CreatePressStartBanner
CreatePressStartBanner: @ 807C2E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	ldr r2, _0807C3AC
	adds r0, r2
	lsrs r0, 16
	movs r6, 0
	lsls r1, 16
	mov r10, r1
	mov r8, r10
_0807C302:
	lsls r5, r0, 16
	asrs r5, 16
	ldr r0, _0807C3B0
	adds r1, r5, 0
	mov r3, r8
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807C3B4
	mov r9, r0
	add r4, r9
	adds r0, r4, 0
	adds r1, r6, 0
	bl StartSpriteAnim
	movs r7, 0x1
	strh r7, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r5, 0x20
	lsls r5, 16
	lsrs r0, r5, 16
	cmp r6, 0x2
	bls _0807C302
	ldr r1, _0807C3B0
	mov r8, r1
	lsls r5, r0, 16
	asrs r5, 16
	mov r2, r10
	asrs r6, r2, 16
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	adds r0, r4, 0
	movs r1, 0x8
	bl StartSpriteAnim
	strh r7, [r4, 0x2E]
	subs r5, 0x60
	lsls r5, 16
	asrs r5, 16
	subs r6, 0x8
	lsls r6, 16
	asrs r6, 16
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	adds r0, r4, 0
	movs r1, 0x9
	bl StartSpriteAnim
	strh r7, [r4, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C3AC: .4byte 0xffe00000
_0807C3B0: .4byte gSpriteTemplate_8393F74
_0807C3B4: .4byte gSprites
	thumb_func_end CreatePressStartBanner

	thumb_func_start CreateCopyrightBanner
CreateCopyrightBanner: @ 807C3B8
	push {r4-r6,lr}
	lsls r0, 16
	ldr r2, _0807C408
	adds r0, r2
	lsrs r0, 16
	movs r5, 0
	lsls r6, r1, 16
_0807C3C6:
	lsls r4, r0, 16
	asrs r4, 16
	ldr r0, _0807C40C
	adds r1, r4, 0
	asrs r2, r6, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0807C410
	adds r2, r0
	adds r1, r5, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x20
	lsls r4, 16
	lsrs r0, r4, 16
	cmp r5, 0x4
	bls _0807C3C6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C408: .4byte 0xffc00000
_0807C40C: .4byte gSpriteTemplate_8393F74
_0807C410: .4byte gSprites
	thumb_func_end CreateCopyrightBanner

	thumb_func_start SpriteCallback_PokemonLogoShine
SpriteCallback_PokemonLogoShine: @ 807C414
	push {r4,lr}
	adds r3, r0, 0
	ldr r2, _0807C460
	ldr r0, _0807C464
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0807C4A4
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	ldr r0, _0807C468
	ldrh r4, [r3, 0x20]
	cmp r1, r0
	bgt _0807C4A4
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0807C498
	cmp r1, 0x77
	bgt _0807C46C
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0x1E
	bgt _0807C484
	adds r1, 0x1
	strh r1, [r3, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x1E
	bgt _0807C484
	adds r0, r1, 0x1
	b _0807C482
	.align 2, 0
_0807C460: .4byte gTasks
_0807C464: .4byte gUnknown_0202F7E4
_0807C468: .4byte 0x0000010f
_0807C46C:
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0807C484
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	beq _0807C484
	subs r0, r1, 0x2
_0807C482:
	strh r0, [r3, 0x30]
_0807C484:
	ldrh r1, [r3, 0x30]
	movs r0, 0x1F
	ands r0, r1
	lsls r1, r0, 10
	lsls r2, r0, 5
	adds r1, r2
	orrs r1, r0
	ldr r0, _0807C4A0
	strh r1, [r0]
	strh r1, [r0, 0x2A]
_0807C498:
	adds r0, r4, 0x4
	strh r0, [r3, 0x20]
	b _0807C4B2
	.align 2, 0
_0807C4A0: .4byte gPlttBufferFaded
_0807C4A4:
	ldr r1, _0807C4B8
	movs r0, 0
	strh r0, [r1]
	strh r0, [r1, 0x2A]
	adds r0, r3, 0
	bl DestroySprite
_0807C4B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C4B8: .4byte gPlttBufferFaded
	thumb_func_end SpriteCallback_PokemonLogoShine

	thumb_func_start StartPokemonLogoShine
StartPokemonLogoShine: @ 807C4BC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807C4F4
	movs r1, 0
	movs r2, 0x44
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C4F8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x1]
	strh r4, [r1, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C4F4: .4byte gSpriteTemplate_8393FC0
_0807C4F8: .4byte gSprites
_0807C4FC:
	push {lr}
	bl sub_8089668
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _0807C51C
	ldr r1, _0807C520
	ldrh r1, [r1]
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C51C: .4byte 0x04000016
_0807C520: .4byte gUnknown_030041B4
	thumb_func_end StartPokemonLogoShine

	thumb_func_start CB2_InitTitleScreen
CB2_InitTitleScreen: @ 807C524
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0807C540
	ldr r1, _0807C544
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0807C564
	lsls r0, 2
	ldr r1, _0807C548
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C540: .4byte gMain
_0807C544: .4byte 0x0000043c
_0807C548: .4byte _0807C54C
	.align 2, 0
_0807C54C:
	.4byte _0807C564
	.4byte _0807C618
	.4byte _0807C6EC
	.4byte _0807C73C
	.4byte _0807C770
	.4byte _0807C84C
_0807C564:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0807C5F4
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0xA0
	lsls r2, 19
	ldr r3, _0807C5F8
	adds r0, r3, 0
	strh r0, [r2]
	movs r0, 0x80
	lsls r0, 19
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x10
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
	add r0, sp, 0xC
	strh r1, [r0]
	ldr r1, _0807C5FC
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0807C600
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x10]
	add r0, sp, 0x10
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0807C604
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _0807C608
	str r0, [r1, 0x4]
	ldr r0, _0807C60C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0807C610
	ldr r1, _0807C614
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0807C87A
	.align 2, 0
_0807C5F4: .4byte 0x04000050
_0807C5F8: .4byte 0x00007fff
_0807C5FC: .4byte 0x040000d4
_0807C600: .4byte 0x8100c000
_0807C604: .4byte 0x85000100
_0807C608: .4byte 0x05000002
_0807C60C: .4byte 0x810001ff
_0807C610: .4byte gMain
_0807C614: .4byte 0x0000043c
_0807C618:
	ldr r0, _0807C6A4
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0807C6A8
	ldr r1, _0807C6AC
	bl LZ77UnCompVram
	ldr r4, _0807C6B0
	movs r5, 0xE0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r0, _0807C6B4
	ldr r1, _0807C6B8
	bl LZ77UnCompVram
	ldr r0, _0807C6BC
	ldr r1, _0807C6C0
	bl LZ77UnCompVram
	ldr r0, _0807C6C4
	ldr r1, _0807C6C8
	bl LZ77UnCompVram
	ldr r0, _0807C6CC
	movs r1, 0xE0
	movs r2, 0x40
	bl LoadPalette
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0807C6D0
	movs r0, 0xE
	strb r0, [r1]
	ldr r0, _0807C6D4
	bl LoadCompressedObjectPic
	ldr r0, _0807C6D8
	bl LoadCompressedObjectPic
	ldr r0, _0807C6DC
	bl LoadCompressedObjectPic
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r0, _0807C6E0
	bl LoadSpritePalette
	ldr r0, _0807C6E4
	ldr r2, _0807C6E8
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	b _0807C87A
	.align 2, 0
_0807C6A4: .4byte gUnknown_08E9D8CC
_0807C6A8: .4byte gUnknown_08E9F7E4
_0807C6AC: .4byte 0x06004800
_0807C6B0: .4byte gUnknown_08E9F624
_0807C6B4: .4byte gUnknown_08393250
_0807C6B8: .4byte 0x06008000
_0807C6BC: .4byte gUnknown_083939EC
_0807C6C0: .4byte 0x0600c000
_0807C6C4: .4byte gUnknown_08393BF8
_0807C6C8: .4byte 0x0600c800
_0807C6CC: .4byte gUnknown_08393210
_0807C6D0: .4byte gReservedSpritePaletteCount
_0807C6D4: .4byte gUnknown_08393EFC
_0807C6D8: .4byte gUnknown_08393F8C
_0807C6DC: .4byte gUnknown_08393FD8
_0807C6E0: .4byte gUnknown_08393F9C
_0807C6E4: .4byte gMain
_0807C6E8: .4byte 0x0000043c
_0807C6EC:
	ldr r0, _0807C724
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C728
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r3, 0
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldr r2, _0807C72C
	strh r2, [r1, 0xC]
	subs r2, 0x10
	strh r2, [r1, 0xE]
	ldr r1, _0807C730
	strb r0, [r1]
	ldr r0, _0807C734
	ldr r3, _0807C738
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	b _0807C87A
	.align 2, 0
_0807C724: .4byte Task_TitleScreenPhase1
_0807C728: .4byte gTasks
_0807C72C: .4byte 0x0000fff0
_0807C730: .4byte gUnknown_0202F7E4
_0807C734: .4byte gMain
_0807C738: .4byte 0x0000043c
_0807C73C:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0807C760
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0807C764
	bl SetVBlankCallback
	ldr r0, _0807C768
	ldr r1, _0807C76C
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _0807C87A
	.align 2, 0
_0807C760: .4byte 0x0000ffff
_0807C764: .4byte _0807C4FC
_0807C768: .4byte gMain
_0807C76C: .4byte 0x0000043c
_0807C770:
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x78
	movs r1, 0x50
	movs r3, 0
	bl sub_813CE30
	ldr r1, _0807C808
	ldr r0, _0807C80C
	str r0, [r1]
	adds r1, 0x4
	ldr r0, _0807C810
	str r0, [r1]
	ldr r0, _0807C814
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r1, 0x1C
	ldr r2, _0807C818
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _0807C81C
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0x84
	strh r0, [r1]
	ldr r0, _0807C820
	strh r4, [r0]
	adds r0, 0x2
	movs r5, 0x8
	strh r5, [r0]
	subs r1, 0x48
	ldr r2, _0807C824
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _0807C828
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807C82C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0807C830
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0807C834
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _0807C838
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	subs r1, 0x4
	ldr r3, _0807C83C
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0807C840
	bl m4aSongNumStart
	ldr r0, _0807C844
	ldr r1, _0807C848
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	b _0807C87A
	.align 2, 0
_0807C808: .4byte 0x04000028
_0807C80C: .4byte 0xffffe300
_0807C810: .4byte 0xffffdf00
_0807C814: .4byte 0x04000040
_0807C818: .4byte 0x00001f1f
_0807C81C: .4byte 0x00003f1f
_0807C820: .4byte 0x04000052
_0807C824: .4byte 0x0000180b
_0807C828: .4byte 0x0000190a
_0807C82C: .4byte 0x00004981
_0807C830: .4byte 0x04000208
_0807C834: .4byte 0x04000200
_0807C838: .4byte 0x04000004
_0807C83C: .4byte 0x0000b441
_0807C840: .4byte 0x0000019d
_0807C844: .4byte gMain
_0807C848: .4byte 0x0000043c
_0807C84C:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807C87A
	movs r0, 0
	bl StartPokemonLogoShine
	str r4, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA0
	movs r2, 0x4
	movs r3, 0x4
	bl sub_8089944
	ldr r0, _0807C884
	bl SetMainCallback2
_0807C87A:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C884: .4byte _0807C888
_0807C888:
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_InitTitleScreen

	thumb_func_start Task_TitleScreenPhase1
Task_TitleScreenPhase1: @ 807C8A0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0807C908
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	ldr r5, _0807C90C
	cmp r0, 0
	bne _0807C8C6
	lsls r0, r6, 2
	adds r1, r0, r6
	lsls r1, 3
	adds r1, r5
	movs r2, 0xA
	ldrsh r1, [r1, r2]
	adds r4, r0, 0
	cmp r1, 0
	beq _0807C8D8
_0807C8C6:
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r5
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0xA]
	strh r2, [r0, 0x8]
	adds r4, r3, 0
_0807C8D8:
	adds r0, r4, r6
	lsls r0, 3
	adds r7, r0, r5
	movs r3, 0x8
	ldrsh r2, [r7, r3]
	cmp r2, 0
	beq _0807C910
	ldrh r0, [r7, 0x8]
	cmp r0, 0xA0
	beq _0807C8F0
	cmp r0, 0x40
	bne _0807C8F6
_0807C8F0:
	movs r0, 0x1
	bl StartPokemonLogoShine
_0807C8F6:
	ldr r0, _0807C90C
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	subs r0, 0x1
	strh r0, [r1, 0x8]
	b _0807C98C
	.align 2, 0
_0807C908: .4byte gMain
_0807C90C: .4byte gTasks
_0807C910:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0807C994
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0807C998
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r1, 0x50
	ldr r3, _0807C99C
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1F
	strh r0, [r1]
	ldr r0, _0807C9A0
	strh r2, [r0]
	ldr r0, _0807C9A4
	movs r1, 0x6C
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0807C9A8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r4, 0x4
	orrs r0, r4
	strb r0, [r2]
	strh r6, [r1, 0x30]
	ldr r0, _0807C9AC
	movs r1, 0xAC
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	strh r6, [r1, 0x30]
	movs r0, 0x58
	strh r0, [r7, 0x12]
	movs r0, 0x90
	strh r0, [r7, 0x8]
	ldr r0, _0807C9B0
	str r0, [r7]
_0807C98C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C994: .4byte 0x00001441
_0807C998: .4byte 0x04000048
_0807C99C: .4byte 0x00003f50
_0807C9A0: .4byte 0x04000054
_0807C9A4: .4byte gSpriteTemplate_8393ECC
_0807C9A8: .4byte gSprites
_0807C9AC: .4byte gSpriteTemplate_8393EE4
_0807C9B0: .4byte Task_TitleScreenPhase2
	thumb_func_end Task_TitleScreenPhase1

	thumb_func_start Task_TitleScreenPhase2
Task_TitleScreenPhase2: @ 807C9B4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807CA04
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	ldr r2, _0807CA08
	cmp r0, 0
	bne _0807C9DA
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r1, r2
	movs r3, 0xA
	ldrsh r1, [r1, r3]
	adds r7, r0, 0
	cmp r1, 0
	beq _0807C9EC
_0807C9DA:
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0xA]
	strh r2, [r0, 0x8]
	adds r7, r3, 0
_0807C9EC:
	ldr r1, _0807CA08
	adds r0, r7, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	movs r1, 0x8
	ldrsh r6, [r4, r1]
	cmp r6, 0
	beq _0807CA0C
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _0807CA30
	.align 2, 0
_0807CA04: .4byte gMain
_0807CA08: .4byte gTasks
_0807CA0C:
	movs r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0807CA68
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x76
	movs r1, 0x6C
	bl CreatePressStartBanner
	movs r0, 0x78
	movs r1, 0x94
	bl CreateCopyrightBanner
	strh r6, [r4, 0x10]
	ldr r0, _0807CA6C
	str r0, [r4]
_0807CA30:
	ldr r2, _0807CA70
	adds r0, r7, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r1, [r3, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807CA50
	ldrh r1, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _0807CA50
	adds r0, r1, 0x1
	strh r0, [r3, 0xE]
_0807CA50:
	ldr r0, _0807CA74
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r2
	movs r2, 0xE
	ldrsh r1, [r1, r2]
	lsls r1, 8
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA68: .4byte 0x00001741
_0807CA6C: .4byte Task_TitleScreenPhase3
_0807CA70: .4byte gTasks
_0807CA74: .4byte 0x0400002c
	thumb_func_end Task_TitleScreenPhase2

	thumb_func_start Task_TitleScreenPhase3
Task_TitleScreenPhase3: @ 807CA78
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0807CAD0
	ldr r2, _0807CAD4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807CAD8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r4, _0807CADC
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807CAAE
	movs r0, 0x8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _0807CAE8
_0807CAAE:
	movs r0, 0x4
	bl FadeOutBGM
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0807CAE0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807CAE4
	bl SetMainCallback2
	b _0807CB82
	.align 2, 0
_0807CAD0: .4byte 0x04000050
_0807CAD4: .4byte 0x00002142
_0807CAD8: .4byte 0x00001f0f
_0807CADC: .4byte gMain
_0807CAE0: .4byte 0x0000ffff
_0807CAE4: .4byte CB2_GoToMainMenu
_0807CAE8:
	ldrh r1, [r4, 0x2C]
	movs r0, 0x46
	ands r0, r1
	cmp r0, 0x46
	bne _0807CAF8
	ldr r0, _0807CB28
	bl SetMainCallback2
_0807CAF8:
	ldrh r1, [r4, 0x2C]
	movs r0, 0x26
	ands r0, r1
	cmp r0, 0x26
	bne _0807CB30
	bl sub_80691DC
	cmp r0, 0x1
	bne _0807CB30
	movs r0, 0x4
	bl FadeOutBGM
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807CB2C
	bl SetMainCallback2
	b _0807CB82
	.align 2, 0
_0807CB28: .4byte CB2_GoToClearSaveDataScreen
_0807CB2C: .4byte CB2_GoToResetRtcScreen
_0807CB30:
	ldr r0, _0807CB8C
	movs r3, 0
	str r3, [r0]
	ldr r1, _0807CB90
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807CB5C
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	ldr r1, _0807CB94
	strh r0, [r1]
	ldr r0, _0807CB98
	strh r3, [r0]
_0807CB5C:
	ldrb r0, [r2, 0x8]
	bl UpdateLegendaryMarkingColor
	ldr r0, _0807CB9C
	ldr r1, _0807CBA0
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _0807CB82
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807CBA4
	bl SetMainCallback2
_0807CB82:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB8C: .4byte 0x0400002c
_0807CB90: .4byte gTasks
_0807CB94: .4byte gUnknown_030041B4
_0807CB98: .4byte gUnknown_030042C0
_0807CB9C: .4byte gMPlay_BGM
_0807CBA0: .4byte 0x0000ffff
_0807CBA4: .4byte CB2_GoToCopyrightScreen
	thumb_func_end Task_TitleScreenPhase3

	thumb_func_start CB2_GoToMainMenu
CB2_GoToMainMenu: @ 807CBA8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807CBBA
	ldr r0, _0807CBC0
	bl SetMainCallback2
_0807CBBA:
	pop {r0}
	bx r0
	.align 2, 0
_0807CBC0: .4byte CB2_InitMainMenu
	thumb_func_end CB2_GoToMainMenu

	thumb_func_start CB2_GoToCopyrightScreen
CB2_GoToCopyrightScreen: @ 807CBC4
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807CBD6
	ldr r0, _0807CBDC
	bl SetMainCallback2
_0807CBD6:
	pop {r0}
	bx r0
	.align 2, 0
_0807CBDC: .4byte CB2_InitCopyrightScreen
	thumb_func_end CB2_GoToCopyrightScreen

	thumb_func_start CB2_GoToClearSaveDataScreen
CB2_GoToClearSaveDataScreen: @ 807CBE0
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807CBF2
	ldr r0, _0807CBF8
	bl SetMainCallback2
_0807CBF2:
	pop {r0}
	bx r0
	.align 2, 0
_0807CBF8: .4byte CB2_InitClearSaveDataScreen
	thumb_func_end CB2_GoToClearSaveDataScreen

	thumb_func_start CB2_GoToResetRtcScreen
CB2_GoToResetRtcScreen: @ 807CBFC
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807CC0E
	ldr r0, _0807CC14
	bl SetMainCallback2
_0807CC0E:
	pop {r0}
	bx r0
	.align 2, 0
_0807CC14: .4byte CB2_InitResetRtcScreen
	thumb_func_end CB2_GoToResetRtcScreen

	thumb_func_start UpdateLegendaryMarkingColor
UpdateLegendaryMarkingColor: @ 807CC18
	push {lr}
	sub sp, 0x4
	lsls r1, r0, 24
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r1
	cmp r0, 0
	bne _0807CC54
	lsrs r0, r1, 26
	movs r1, 0x1F
	adds r2, r0, 0
	ands r2, r1
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0807CC40
	lsls r1, r2, 10
	mov r0, sp
	strh r1, [r0]
	b _0807CC4A
_0807CC40:
	movs r0, 0x1F
	subs r0, r2
	lsls r0, 10
	mov r1, sp
	strh r0, [r1]
_0807CC4A:
	mov r0, sp
	movs r1, 0xEF
	movs r2, 0x2
	bl LoadPalette
_0807CC54:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end UpdateLegendaryMarkingColor

	.align 2, 0 @ Don't pad with nop.
