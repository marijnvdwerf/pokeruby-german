	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start VBlankCB
VBlankCB: @ 814612C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB

	thumb_func_start sub_8145D88
sub_8145D88: @ 8146140
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r8, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08146268 @ =0x0400000e
	strh r1, [r6]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x14
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
	ldr r2, _0814626C @ =0x040000d4
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08146270 @ =0x8100c000
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r5, 0
	str r5, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146274 @ =0x85000100
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r5, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146278 @ =0x81000200
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0814627C @ =gDiplomaTiles
	bl LZ77UnCompVram
	ldr r0, _08146280 @ =gDiplomaTilemap
	ldr r1, _08146284 @ =0x06003000
	bl LZ77UnCompVram
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _08146288 @ =gDiplomaPalettes
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0814628C @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08146290 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	bl DisplayDiplomaText
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08146294 @ =0x04000208
	ldrh r2, [r3]
	strh r5, [r3]
	ldr r4, _08146298 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0814629C @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081462A0 @ =VBlankCB
	bl SetVBlankCallback
	ldr r0, _081462A4 @ =MainCB2
	bl SetMainCallback2
	ldr r0, _081462A8 @ =0x04000050
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r1, _081462AC @ =0x00004603
	adds r0, r1, 0
	strh r0, [r6]
	movs r1, 0xCA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _081462B0 @ =Task_DiplomaFadeIn
	movs r1, 0
	bl CreateTask
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08146268: .4byte 0x0400000e
_0814626C: .4byte 0x040000d4
_08146270: .4byte 0x8100c000
_08146274: .4byte 0x85000100
_08146278: .4byte 0x81000200
_0814627C: .4byte gDiplomaTiles
_08146280: .4byte gDiplomaTilemap
_08146284: .4byte 0x06003000
_08146288: .4byte gDiplomaPalettes
_0814628C: .4byte gWindowConfig_81E6C3C
_08146290: .4byte gWindowConfig_81E6CE4
_08146294: .4byte 0x04000208
_08146298: .4byte 0x04000200
_0814629C: .4byte 0x04000004
_081462A0: .4byte VBlankCB
_081462A4: .4byte MainCB2
_081462A8: .4byte 0x04000050
_081462AC: .4byte 0x00004603
_081462B0: .4byte Task_DiplomaFadeIn
	thumb_func_end sub_8145D88

	thumb_func_start MainCB2
MainCB2: @ 81462B4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end MainCB2

	thumb_func_start Task_DiplomaFadeIn
Task_DiplomaFadeIn: @ 81462CC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081462F0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081462EC
	ldr r0, _081462F4 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _081462F8 @ =Task_DiplomaWaitForKeyPress
	str r0, [r1]
_081462EC:
	pop {r0}
	bx r0
	.align 2, 0
_081462F0: .4byte gPaletteFade
_081462F4: .4byte gTasks
_081462F8: .4byte Task_DiplomaWaitForKeyPress
	thumb_func_end Task_DiplomaFadeIn

	thumb_func_start Task_DiplomaWaitForKeyPress
Task_DiplomaWaitForKeyPress: @ 81462FC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08146338 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0814632E
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0814633C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08146340 @ =Task_DiplomaFadeOut
	str r1, [r0]
_0814632E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146338: .4byte gMain
_0814633C: .4byte gTasks
_08146340: .4byte Task_DiplomaFadeOut
	thumb_func_end Task_DiplomaWaitForKeyPress

	thumb_func_start Task_DiplomaFadeOut
Task_DiplomaFadeOut: @ 8146344
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08146368 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08146362
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _0814636C @ =sub_80546F0
	bl SetMainCallback2
_08146362:
	pop {r0}
	bx r0
	.align 2, 0
_08146368: .4byte gPaletteFade
_0814636C: .4byte sub_80546F0
	thumb_func_end Task_DiplomaFadeOut

	thumb_func_start DisplayDiplomaText
DisplayDiplomaText: @ 8146370
	push {lr}
	bl sub_8090FF4
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _081463A0
	ldr r1, _08146394 @ =0x0400001c
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08146398 @ =gStringVar1
	ldr r1, _0814639C @ =gOtherText_NationalDex
	bl StringCopy
	b _081463AC
	.align 2, 0
_08146394: .4byte 0x0400001c
_08146398: .4byte gStringVar1
_0814639C: .4byte gOtherText_NationalDex
_081463A0:
	ldr r0, _081463BC @ =0x0400001c
	strh r1, [r0]
	ldr r0, _081463C0 @ =gStringVar1
	ldr r1, _081463C4 @ =gOtherText_HoennDex
	bl StringCopy
_081463AC:
	ldr r0, _081463C8 @ =gOtherText_DiplomaCertificationGameFreak
	movs r1, 0x6
	movs r2, 0x2
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_081463BC: .4byte 0x0400001c
_081463C0: .4byte gStringVar1
_081463C4: .4byte gOtherText_HoennDex
_081463C8: .4byte gOtherText_DiplomaCertificationGameFreak
	thumb_func_end DisplayDiplomaText

	.align 2, 0 @ Don't pad with nop.
