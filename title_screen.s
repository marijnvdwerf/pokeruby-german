	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SpriteCallback_VersionBannerLeft
SpriteCallback_VersionBannerLeft: @ 807BE00
	push {r4,lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0807BE34 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807BE38
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
	b _0807BE80
	.align 2, 0
_0807BE34: .4byte gTasks
_0807BE38:
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0807BE46
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
_0807BE46:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	bgt _0807BE80
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
	beq _0807BE6A
	adds r0, r1, 0x1
	strh r0, [r2, 0x22]
_0807BE6A:
	ldr r3, _0807BE88 @ =0x04000052
	ldr r2, _0807BE8C @ =gUnknown_08393E64
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
_0807BE80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE88: .4byte 0x04000052
_0807BE8C: .4byte gUnknown_08393E64
	thumb_func_end SpriteCallback_VersionBannerLeft

	thumb_func_start SpriteCallback_VersionBannerRight
SpriteCallback_VersionBannerRight: @ 807BE90
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0807BEC4 @ =gTasks
	adds r1, r0, r1
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0807BEC8
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
	b _0807BEEC
	.align 2, 0
_0807BEC4: .4byte gTasks
_0807BEC8:
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _0807BEEC
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
	beq _0807BEEC
	adds r0, r1, 0x1
	strh r0, [r2, 0x22]
_0807BEEC:
	pop {r0}
	bx r0
	thumb_func_end SpriteCallback_VersionBannerRight

	thumb_func_start SpriteCallback_PressStartCopyrightBanner
SpriteCallback_PressStartCopyrightBanner: @ 807BEF0
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _0807BF18
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0807BF18
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0807BF24
_0807BF18:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0807BF24:
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
	ldr r2, _0807C3AC @ =0xffe00000
	adds r0, r2
	lsrs r0, 16
	movs r6, 0
	lsls r1, 16
	mov r10, r1
	mov r8, r10
_0807C302:
	lsls r5, r0, 16
	asrs r5, 16
	ldr r0, _0807C3B0 @ =gSpriteTemplate_8393F74
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
	ldr r0, _0807C3B4 @ =gSprites
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
	ldr r1, _0807C3B0 @ =gSpriteTemplate_8393F74
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
	ldr r2, _0807C408 @ =0xffc00000
	adds r0, r2
	lsrs r0, 16
	movs r5, 0
	lsls r6, r1, 16
_0807C3C6:
	lsls r4, r0, 16
	asrs r4, 16
	ldr r0, _0807C40C @ =gSpriteTemplate_8393F74
	adds r1, r4, 0
	asrs r2, r6, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0807C410 @ =gSprites
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
SpriteCallback_PokemonLogoShine: @ 807BFE0
	push {r4,lr}
	adds r3, r0, 0
	ldr r2, _0807C02C @ =gTasks
	ldr r0, _0807C030 @ =gUnknown_0202F7E4
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0807C070
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	ldr r0, _0807C034 @ =0x0000010f
	ldrh r4, [r3, 0x20]
	cmp r1, r0
	bgt _0807C070
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0807C064
	cmp r1, 0x77
	bgt _0807C038
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0x1E
	bgt _0807C050
	adds r1, 0x1
	strh r1, [r3, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x1E
	bgt _0807C050
	adds r0, r1, 0x1
	b _0807C04E
	.align 2, 0
_0807C02C: .4byte gTasks
_0807C030: .4byte gUnknown_0202F7E4
_0807C034: .4byte 0x0000010f
_0807C038:
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0807C050
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	beq _0807C050
	subs r0, r1, 0x2
_0807C04E:
	strh r0, [r3, 0x30]
_0807C050:
	ldrh r1, [r3, 0x30]
	movs r0, 0x1F
	ands r0, r1
	lsls r1, r0, 10
	lsls r2, r0, 5
	adds r1, r2
	orrs r1, r0
	ldr r0, _0807C06C @ =gPlttBufferFaded
	strh r1, [r0]
	strh r1, [r0, 0x2A]
_0807C064:
	adds r0, r4, 0x4
	strh r0, [r3, 0x20]
	b _0807C07E
	.align 2, 0
_0807C06C: .4byte gPlttBufferFaded
_0807C070:
	ldr r1, _0807C084 @ =gPlttBufferFaded
	movs r0, 0
	strh r0, [r1]
	strh r0, [r1, 0x2A]
	adds r0, r3, 0
	bl DestroySprite
_0807C07E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C084: .4byte gPlttBufferFaded
	thumb_func_end SpriteCallback_PokemonLogoShine

	thumb_func_start StartPokemonLogoShine
StartPokemonLogoShine: @ 807C4BC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807C4F4 @ =gSpriteTemplate_8393FC0
	movs r1, 0
	movs r2, 0x44
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C4F8 @ =gSprites
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
	ldr r0, _0807C51C @ =0x04000016
	ldr r1, _0807C520 @ =gUnknown_030041B4
	ldrh r1, [r1]
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C51C: .4byte 0x04000016
_0807C520: .4byte gUnknown_030041B4
	thumb_func_end StartPokemonLogoShine

	thumb_func_start CB2_InitTitleScreen
CB2_InitTitleScreen: @ 807C0F0
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0807C10C @ =gMain
	ldr r1, _0807C110 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0807C130
	lsls r0, 2
	ldr r1, _0807C114 @ =_0807C118
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C10C: .4byte gMain
_0807C110: .4byte 0x0000043c
_0807C114: .4byte _0807C118
	.align 2, 0
_0807C118:
	.4byte _0807C130
	.4byte _0807C1E4
	.4byte _0807C2B8
	.4byte _0807C308
	.4byte _0807C33C
	.4byte _0807C418
_0807C130:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0807C1C0 @ =0x04000050
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0xA0
	lsls r2, 19
	ldr r3, _0807C1C4 @ =0x00007fff
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
	ldr r1, _0807C1C8 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0807C1CC @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x10]
	add r0, sp, 0x10
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0807C1D0 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _0807C1D4 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _0807C1D8 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0807C1DC @ =gMain
	ldr r1, _0807C1E0 @ =0x0000043c
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C1C0: .4byte 0x04000050
_0807C1C4: .4byte 0x00007fff
_0807C1C8: .4byte 0x040000d4
_0807C1CC: .4byte 0x8100c000
_0807C1D0: .4byte 0x85000100
_0807C1D4: .4byte 0x05000002
_0807C1D8: .4byte 0x810001ff
_0807C1DC: .4byte gMain
_0807C1E0: .4byte 0x0000043c
_0807C1E4:
	ldr r0, _0807C270 @ =gUnknown_08E9D8CC
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0807C274 @ =gUnknown_08E9F7E4
	ldr r1, _0807C278 @ =0x06004800
	bl LZ77UnCompVram
	ldr r4, _0807C27C @ =gUnknown_08E9F624
	movs r5, 0xE0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r0, _0807C280 @ =gUnknown_08393250
	ldr r1, _0807C284 @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _0807C288 @ =gUnknown_083939EC
	ldr r1, _0807C28C @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _0807C290 @ =gUnknown_08393BF8
	ldr r1, _0807C294 @ =0x0600c800
	bl LZ77UnCompVram
	ldr r0, _0807C298 @ =gUnknown_08393210
	movs r1, 0xE0
	movs r2, 0x40
	bl LoadPalette
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0807C29C @ =gReservedSpritePaletteCount
	movs r0, 0xE
	strb r0, [r1]
	ldr r0, _0807C2A0 @ =gUnknown_08393EFC
	bl LoadCompressedObjectPic
	ldr r0, _0807C2A4 @ =gUnknown_08393F8C
	bl LoadCompressedObjectPic
	ldr r0, _0807C2A8 @ =gUnknown_08393FD8
	bl LoadCompressedObjectPic
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r0, _0807C2AC @ =gUnknown_08393F9C
	bl LoadSpritePalette
	ldr r0, _0807C2B0 @ =gMain
	ldr r2, _0807C2B4 @ =0x0000043c
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C270: .4byte gUnknown_08E9D8CC
_0807C274: .4byte gUnknown_08E9F7E4
_0807C278: .4byte 0x06004800
_0807C27C: .4byte gUnknown_08E9F624
_0807C280: .4byte gUnknown_08393250
_0807C284: .4byte 0x06008000
_0807C288: .4byte gUnknown_083939EC
_0807C28C: .4byte 0x0600c000
_0807C290: .4byte gUnknown_08393BF8
_0807C294: .4byte 0x0600c800
_0807C298: .4byte gUnknown_08393210
_0807C29C: .4byte gReservedSpritePaletteCount
_0807C2A0: .4byte gUnknown_08393EFC
_0807C2A4: .4byte gUnknown_08393F8C
_0807C2A8: .4byte gUnknown_08393FD8
_0807C2AC: .4byte gUnknown_08393F9C
_0807C2B0: .4byte gMain
_0807C2B4: .4byte 0x0000043c
_0807C2B8:
	ldr r0, _0807C2F0 @ =Task_TitleScreenPhase1
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C2F4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r3, 0
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldr r2, _0807C2F8 @ =0x0000fff0
	strh r2, [r1, 0xC]
	subs r2, 0x10
	strh r2, [r1, 0xE]
	ldr r1, _0807C2FC @ =gUnknown_0202F7E4
	strb r0, [r1]
	ldr r0, _0807C300 @ =gMain
	ldr r3, _0807C304 @ =0x0000043c
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C2F0: .4byte Task_TitleScreenPhase1
_0807C2F4: .4byte gTasks
_0807C2F8: .4byte 0x0000fff0
_0807C2FC: .4byte gUnknown_0202F7E4
_0807C300: .4byte gMain
_0807C304: .4byte 0x0000043c
_0807C308:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0807C32C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0807C330 @ =_0807C4FC
	bl SetVBlankCallback
	ldr r0, _0807C334 @ =gMain
	ldr r1, _0807C338 @ =0x0000043c
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C32C: .4byte 0x0000ffff
_0807C330: .4byte _0807C4FC
_0807C334: .4byte gMain
_0807C338: .4byte 0x0000043c
_0807C33C:
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x78
	movs r1, 0x50
	movs r3, 0
	bl sub_813CE30
	ldr r1, _0807C3D4 @ =0x04000028
	ldr r0, _0807C3D8 @ =0xffffe300
	str r0, [r1]
	adds r1, 0x4
	ldr r0, _0807C3DC @ =0xffffdf00
	str r0, [r1]
	ldr r0, _0807C3E0 @ =0x04000040
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r1, 0x1C
	ldr r2, _0807C3E4 @ =0x00001f1f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _0807C3E8 @ =0x00003f1f
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0x84
	strh r0, [r1]
	ldr r0, _0807C3EC @ =0x04000052
	strh r4, [r0]
	adds r0, 0x2
	movs r5, 0x8
	strh r5, [r0]
	subs r1, 0x48
	ldr r2, _0807C3F0 @ =0x0000180b
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _0807C3F4 @ =0x0000190a
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807C3F8 @ =0x00004981
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0807C3FC @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0807C400 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _0807C404 @ =0x04000004
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	subs r1, 0x4
	ldr r3, _0807C408 @ =0x0000b441
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0807C40C @ =0x0000019d
	bl m4aSongNumStart
	ldr r0, _0807C410 @ =gMain
	ldr r1, _0807C414 @ =0x0000043c
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C3D4: .4byte 0x04000028
_0807C3D8: .4byte 0xffffe300
_0807C3DC: .4byte 0xffffdf00
_0807C3E0: .4byte 0x04000040
_0807C3E4: .4byte 0x00001f1f
_0807C3E8: .4byte 0x00003f1f
_0807C3EC: .4byte 0x04000052
_0807C3F0: .4byte 0x0000180b
_0807C3F4: .4byte 0x0000190a
_0807C3F8: .4byte 0x00004981
_0807C3FC: .4byte 0x04000208
_0807C400: .4byte 0x04000200
_0807C404: .4byte 0x04000004
_0807C408: .4byte 0x0000b441
_0807C40C: .4byte 0x0000019d
_0807C410: .4byte gMain
_0807C414: .4byte 0x0000043c
_0807C418:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807C446
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
	ldr r0, _0807C450 @ =_0807C454
	bl SetMainCallback2
_0807C446:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C450: .4byte _0807C454
_0807C454:
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
	ldr r0, _0807C908 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	ldr r5, _0807C90C @ =gTasks
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
	ldr r0, _0807C90C @ =gTasks
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
	ldr r3, _0807C994 @ =0x00001441
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0807C998 @ =0x04000048
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r1, 0x50
	ldr r3, _0807C99C @ =0x00003f50
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1F
	strh r0, [r1]
	ldr r0, _0807C9A0 @ =0x04000054
	strh r2, [r0]
	ldr r0, _0807C9A4 @ =gSpriteTemplate_8393ECC
	movs r1, 0x6C
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0807C9A8 @ =gSprites
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
	ldr r0, _0807C9AC @ =gSpriteTemplate_8393EE4
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
	ldr r0, _0807C9B0 @ =Task_TitleScreenPhase2
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
	ldr r0, _0807CA04 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	ldr r2, _0807CA08 @ =gTasks
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
	ldr r1, _0807CA08 @ =gTasks
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
	ldr r2, _0807CA68 @ =0x00001741
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x76
	movs r1, 0x6C
	bl CreatePressStartBanner
	movs r0, 0x78
	movs r1, 0x94
	bl CreateCopyrightBanner
	strh r6, [r4, 0x10]
	ldr r0, _0807CA6C @ =Task_TitleScreenPhase3
	str r0, [r4]
_0807CA30:
	ldr r2, _0807CA70 @ =gTasks
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
	ldr r0, _0807CA74 @ =0x0400002c
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
	ldr r1, _0807CAD0 @ =0x04000050
	ldr r2, _0807CAD4 @ =0x00002142
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807CAD8 @ =0x00001f0f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r4, _0807CADC @ =gMain
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
	ldr r1, _0807CAE0 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807CAE4 @ =CB2_GoToMainMenu
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
	ldr r0, _0807CB28 @ =CB2_GoToClearSaveDataScreen
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
	ldr r0, _0807CB2C @ =CB2_GoToResetRtcScreen
	bl SetMainCallback2
	b _0807CB82
	.align 2, 0
_0807CB28: .4byte CB2_GoToClearSaveDataScreen
_0807CB2C: .4byte CB2_GoToResetRtcScreen
_0807CB30:
	ldr r0, _0807CB8C @ =0x0400002c
	movs r3, 0
	str r3, [r0]
	ldr r1, _0807CB90 @ =gTasks
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
	ldr r1, _0807CB94 @ =gUnknown_030041B4
	strh r0, [r1]
	ldr r0, _0807CB98 @ =gUnknown_030042C0
	strh r3, [r0]
_0807CB5C:
	ldrb r0, [r2, 0x8]
	bl UpdateLegendaryMarkingColor
	ldr r0, _0807CB9C @ =gMPlay_BGM
	ldr r1, _0807CBA0 @ =0x0000ffff
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
	ldr r0, _0807CBA4 @ =CB2_GoToCopyrightScreen
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
	ldr r0, _0807CBC0 @ =CB2_InitMainMenu
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
	ldr r0, _0807CBDC @ =CB2_InitCopyrightScreen
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
	ldr r0, _0807CBF8 @ =CB2_InitClearSaveDataScreen
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
	ldr r0, _0807CC14 @ =CB2_InitResetRtcScreen
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
