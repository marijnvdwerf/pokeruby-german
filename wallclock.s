	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start WallClockVblankCallback
WallClockVblankCallback: @ 810AAF8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end WallClockVblankCallback

	thumb_func_start LoadWallClockGraphics
LoadWallClockGraphics: @ 810AB0C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	subs r0, 0x2
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
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _0810ABEC @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0810ABF0 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0810AB70:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0810AB70
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _0810ABEC @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0810ABF4 @ =gMiscClock_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0810ABF8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810AC00
	ldr r0, _0810ABFC @ =gMiscClockMale_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _0810AC0A
	.align 2, 0
_0810ABEC: .4byte 0x040000d4
_0810ABF0: .4byte 0x81000800
_0810ABF4: .4byte gMiscClock_Gfx
_0810ABF8: .4byte gSpecialVar_0x8004
_0810ABFC: .4byte gMiscClockMale_Pal
_0810AC00:
	ldr r0, _0810AC44 @ =gMiscClockFemale_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
_0810AC0A:
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _0810AC48 @ =gUnknown_083F7A90
	bl LoadCompressedObjectPic
	ldr r0, _0810AC4C @ =gUnknown_083F7AA0
	bl LoadSpritePalettes
	ldr r0, _0810AC50 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _0810AC54 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AC44: .4byte gMiscClockFemale_Pal
_0810AC48: .4byte gUnknown_083F7A90
_0810AC4C: .4byte gUnknown_083F7AA0
_0810AC50: .4byte gWindowConfig_81E6C3C
_0810AC54: .4byte gWindowConfig_81E6CE4
	thumb_func_end LoadWallClockGraphics

	thumb_func_start WallClockInit
WallClockInit: @ 810AC58
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _0810ACC4 @ =0x04000208
	ldrh r2, [r3]
	strh r5, [r3]
	ldr r4, _0810ACC8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0810ACCC @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0810ACD0 @ =WallClockVblankCallback
	bl SetVBlankCallback
	ldr r0, _0810ACD4 @ =WallClockMainCallback
	bl SetMainCallback2
	ldr r0, _0810ACD8 @ =0x04000050
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r1, _0810ACDC @ =0x0400000e
	ldr r2, _0810ACE0 @ =0x00000701
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x6
	ldr r2, _0810ACE4 @ =0x00001f08
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x8
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810ACC4: .4byte 0x04000208
_0810ACC8: .4byte 0x04000200
_0810ACCC: .4byte 0x04000004
_0810ACD0: .4byte WallClockVblankCallback
_0810ACD4: .4byte WallClockMainCallback
_0810ACD8: .4byte 0x04000050
_0810ACDC: .4byte 0x0400000e
_0810ACE0: .4byte 0x00000701
_0810ACE4: .4byte 0x00001f08
	thumb_func_end WallClockInit

	thumb_func_start Cb2_StartWallClock
Cb2_StartWallClock: @ 810ACE8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	bl LoadWallClockGraphics
	ldr r0, _0810ADE4 @ =gUnknown_08E954B0
	ldr r1, _0810ADE8 @ =0x06003800
	bl LZ77UnCompVram
	ldr r0, _0810ADEC @ =Task_SetClock1
	movs r1, 0
	bl CreateTask
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _0810ADF0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0xC]
	strh r2, [r0, 0xE]
	strh r2, [r0, 0x10]
	strh r2, [r0, 0x12]
	strh r2, [r0, 0x14]
	strh r2, [r0, 0x8]
	movs r1, 0x96
	lsls r1, 1
	strh r1, [r0, 0xA]
	ldr r0, _0810ADF4 @ =gSpriteTemplate_83F7AD8
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810ADF8 @ =gSprites
	mov r8, r1
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r6, [r1, 0x2E]
	ldrb r2, [r1, 0x1]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	movs r2, 0x1
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r2, [r1, 0x3]
	movs r4, 0x3F
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x3]
	ldr r0, _0810ADFC @ =gSpriteTemplate_83F7AF0
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r6, [r1, 0x2E]
	ldrb r0, [r1, 0x1]
	ands r5, r0
	mov r0, r9
	orrs r5, r0
	strb r5, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	ands r4, r0
	movs r0, 0x2
	orrs r4, r0
	strb r4, [r1, 0x3]
	ldr r0, _0810AE00 @ =gSpriteTemplate_83F7B28
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r6, [r1, 0x2E]
	movs r0, 0x2D
	strh r0, [r1, 0x30]
	ldr r0, _0810AE04 @ =gSpriteTemplate_83F7B40
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	strh r6, [r1, 0x2E]
	movs r0, 0x5A
	strh r0, [r1, 0x30]
	bl WallClockInit
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810ADE4: .4byte gUnknown_08E954B0
_0810ADE8: .4byte 0x06003800
_0810ADEC: .4byte Task_SetClock1
_0810ADF0: .4byte gTasks
_0810ADF4: .4byte gSpriteTemplate_83F7AD8
_0810ADF8: .4byte gSprites
_0810ADFC: .4byte gSpriteTemplate_83F7AF0
_0810AE00: .4byte gSpriteTemplate_83F7B28
_0810AE04: .4byte gSpriteTemplate_83F7B40
	thumb_func_end Cb2_StartWallClock

	thumb_func_start Cb2_ViewWallClock
Cb2_ViewWallClock: @ 810AE08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl LoadWallClockGraphics
	ldr r0, _0810AE4C @ =gUnknown_08E95774
	ldr r1, _0810AE50 @ =0x06003800
	bl LZ77UnCompVram
	ldr r0, _0810AE54 @ =Task_ViewClock1
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r7, 0
	bl InitClockWithRtc
	ldr r1, _0810AE58 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0810AE5C
	movs r2, 0x2D
	mov r9, r2
	movs r0, 0x5A
	mov r10, r0
	b _0810AE64
	.align 2, 0
_0810AE4C: .4byte gUnknown_08E95774
_0810AE50: .4byte 0x06003800
_0810AE54: .4byte Task_ViewClock1
_0810AE58: .4byte gTasks
_0810AE5C:
	movs r1, 0x5A
	mov r9, r1
	movs r2, 0x87
	mov r10, r2
_0810AE64:
	ldr r0, _0810AF1C @ =gSpriteTemplate_83F7AD8
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0810AF20 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	strh r7, [r1, 0x2E]
	ldrb r2, [r1, 0x1]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	movs r2, 0x1
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r2, [r1, 0x3]
	movs r4, 0x3F
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x3]
	ldr r0, _0810AF24 @ =gSpriteTemplate_83F7AF0
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	strh r7, [r1, 0x2E]
	ldrb r0, [r1, 0x1]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	ands r4, r0
	movs r0, 0x2
	orrs r4, r0
	strb r4, [r1, 0x3]
	ldr r0, _0810AF28 @ =gSpriteTemplate_83F7B28
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	strh r7, [r1, 0x2E]
	mov r2, r9
	strh r2, [r1, 0x30]
	ldr r0, _0810AF2C @ =gSpriteTemplate_83F7B40
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	strh r7, [r1, 0x2E]
	mov r0, r10
	strh r0, [r1, 0x30]
	bl WallClockInit
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810AF1C: .4byte gSpriteTemplate_83F7AD8
_0810AF20: .4byte gSprites
_0810AF24: .4byte gSpriteTemplate_83F7AF0
_0810AF28: .4byte gSpriteTemplate_83F7B28
_0810AF2C: .4byte gSpriteTemplate_83F7B40
	thumb_func_end Cb2_ViewWallClock

	thumb_func_start WallClockMainCallback
WallClockMainCallback: @ 810AF30
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end WallClockMainCallback

	thumb_func_start Task_SetClock1
Task_SetClock1: @ 810AF48
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810AF6C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810AF68
	ldr r0, _0810AF70 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810AF74 @ =Task_SetClock2
	str r0, [r1]
_0810AF68:
	pop {r0}
	bx r0
	.align 2, 0
_0810AF6C: .4byte gPaletteFade
_0810AF70: .4byte gTasks
_0810AF74: .4byte Task_SetClock2
	thumb_func_end Task_SetClock1

	thumb_func_start Task_SetClock2
Task_SetClock2: @ 810AF78
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0810AFA8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	beq _0810AFAC
	ldrh r0, [r5, 0x8]
	ldrb r1, [r5, 0x10]
	ldrb r2, [r5, 0x14]
	bl CalcNewMinHandAngle
	strh r0, [r5, 0x8]
	b _0810B04E
	.align 2, 0
_0810AFA8: .4byte gTasks
_0810AFAC:
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	strh r0, [r5, 0x8]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	movs r1, 0xC
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 1
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	adds r4, r1
	strh r4, [r5, 0xA]
	ldr r2, _0810AFF8 @ =gMain
	ldrh r0, [r2, 0x2E]
	movs r3, 0x1
	adds r1, r3, 0
	ands r1, r0
	cmp r1, 0
	beq _0810B000
	ldr r0, _0810AFFC @ =Task_SetClock3
	str r0, [r5]
	b _0810B04E
	.align 2, 0
_0810AFF8: .4byte gMain
_0810AFFC: .4byte Task_SetClock3
_0810B000:
	strh r1, [r5, 0x10]
	ldrh r1, [r2, 0x2C]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0810B00E
	strh r3, [r5, 0x10]
_0810B00E:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0810B01C
	movs r0, 0x2
	strh r0, [r5, 0x10]
_0810B01C:
	ldrh r1, [r5, 0x10]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0810B04C
	ldrh r2, [r5, 0x14]
	movs r3, 0x14
	ldrsh r0, [r5, r3]
	cmp r0, 0xFE
	bgt _0810B034
	adds r0, r2, 0x1
	strh r0, [r5, 0x14]
_0810B034:
	ldrh r0, [r5, 0x8]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r5, 0x14]
	bl CalcNewMinHandAngle
	strh r0, [r5, 0x8]
	ldrb r1, [r5, 0x10]
	adds r0, r6, 0
	bl AdvanceClock
	b _0810B04E
_0810B04C:
	strh r0, [r5, 0x14]
_0810B04E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end Task_SetClock2

	thumb_func_start Task_SetClock3
Task_SetClock3: @ 810B054
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x10
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0810B0B8 @ =gOtherText_CorrectTimePrompt
	movs r1, 0x3
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r3, _0810B0BC @ =gUnknown_08376D74
	movs r0, 0x18
	movs r1, 0x9
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x18
	movs r2, 0x9
	movs r3, 0x2
	bl InitMenu
	ldr r1, _0810B0C0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B0C4 @ =Task_SetClock4
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B0B8: .4byte gOtherText_CorrectTimePrompt
_0810B0BC: .4byte gUnknown_08376D74
_0810B0C0: .4byte gTasks
_0810B0C4: .4byte Task_SetClock4
	thumb_func_end Task_SetClock3

	thumb_func_start Task_SetClock4
Task_SetClock4: @ 810B0C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0810B0EE
	cmp r1, 0
	bgt _0810B0E8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0810B10C
	b _0810B13C
_0810B0E8:
	cmp r1, 0x1
	beq _0810B10C
	b _0810B13C
_0810B0EE:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0810B104 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B108 @ =Task_SetClock5
	b _0810B13A
	.align 2, 0
_0810B104: .4byte gTasks
_0810B108: .4byte Task_SetClock5
_0810B10C:
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0x2
	movs r1, 0x10
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _0810B144 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B148 @ =Task_SetClock2
_0810B13A:
	str r0, [r1]
_0810B13C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B144: .4byte gTasks
_0810B148: .4byte Task_SetClock2
	thumb_func_end Task_SetClock4

	thumb_func_start Task_SetClock5
Task_SetClock5: @ 810B14C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810B188 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	bl RtcInitLocalTimeOffset
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810B18C @ =Task_SetClock6
	str r0, [r4]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B188: .4byte gTasks
_0810B18C: .4byte Task_SetClock6
	thumb_func_end Task_SetClock5

	thumb_func_start Task_SetClock6
Task_SetClock6: @ 810B190
	push {lr}
	ldr r0, _0810B1AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B1A6
	ldr r0, _0810B1B0 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810B1A6:
	pop {r0}
	bx r0
	.align 2, 0
_0810B1AC: .4byte gPaletteFade
_0810B1B0: .4byte gMain
	thumb_func_end Task_SetClock6

	thumb_func_start Task_ViewClock1
Task_ViewClock1: @ 810B1B4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810B1D8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B1D4
	ldr r0, _0810B1DC @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B1E0 @ =Task_ViewClock2
	str r0, [r1]
_0810B1D4:
	pop {r0}
	bx r0
	.align 2, 0
_0810B1D8: .4byte gPaletteFade
_0810B1DC: .4byte gTasks
_0810B1E0: .4byte Task_ViewClock2
	thumb_func_end Task_ViewClock1

	thumb_func_start Task_ViewClock2
Task_ViewClock2: @ 810B1E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl InitClockWithRtc
	ldr r0, _0810B210 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0810B20A
	ldr r0, _0810B214 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B218 @ =Task_ViewClock3
	str r0, [r1]
_0810B20A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B210: .4byte gMain
_0810B214: .4byte gTasks
_0810B218: .4byte Task_ViewClock3
	thumb_func_end Task_ViewClock2

	thumb_func_start Task_ViewClock3
Task_ViewClock3: @ 810B21C
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
	ldr r1, _0810B24C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B250 @ =Task_ViewClock4
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B24C: .4byte gTasks
_0810B250: .4byte Task_ViewClock4
	thumb_func_end Task_ViewClock3

	thumb_func_start Task_ViewClock4
Task_ViewClock4: @ 810B254
	push {lr}
	ldr r0, _0810B270 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810B26A
	ldr r0, _0810B274 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810B26A:
	pop {r0}
	bx r0
	.align 2, 0
_0810B270: .4byte gPaletteFade
_0810B274: .4byte gMain
	thumb_func_end Task_ViewClock4

	thumb_func_start CalcMinHandDelta
CalcMinHandDelta: @ 810B278
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x3C
	bls _0810B288
	movs r0, 0x6
	b _0810B29A
_0810B288:
	cmp r0, 0x1E
	bls _0810B290
	movs r0, 0x3
	b _0810B29A
_0810B290:
	cmp r1, 0xA
	bhi _0810B298
	movs r0, 0x1
	b _0810B29A
_0810B298:
	movs r0, 0x2
_0810B29A:
	pop {r1}
	bx r1
	thumb_func_end CalcMinHandDelta

	thumb_func_start CalcNewMinHandAngle
CalcNewMinHandAngle: @ 810B2A0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r2, 0
	bl CalcMinHandDelta
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, 0x1
	beq _0810B2C2
	cmp r5, 0x2
	beq _0810B2D4
	b _0810B2E8
_0810B2C2:
	cmp r4, 0
	beq _0810B2CA
	subs r0, r4, r1
	b _0810B2E0
_0810B2CA:
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	b _0810B2E0
_0810B2D4:
	movs r0, 0xB4
	lsls r0, 1
	subs r0, r1
	cmp r4, r0
	bge _0810B2E6
	adds r0, r4, r1
_0810B2E0:
	lsls r0, 16
	lsrs r4, r0, 16
	b _0810B2E8
_0810B2E6:
	movs r4, 0
_0810B2E8:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CalcNewMinHandAngle

	thumb_func_start AdvanceClock
AdvanceClock: @ 810B2F0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r4, 0x1
	beq _0810B304
	cmp r4, 0x2
	beq _0810B344
	b _0810B382
_0810B304:
	ldr r0, _0810B320 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xE]
	movs r5, 0xE
	ldrsh r0, [r1, r5]
	cmp r0, 0
	ble _0810B324
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _0810B382
	.align 2, 0
_0810B320: .4byte gTasks
_0810B324:
	movs r0, 0x3B
	strh r0, [r1, 0xE]
	ldrh r2, [r1, 0xC]
	movs r6, 0xC
	ldrsh r0, [r1, r6]
	cmp r0, 0
	ble _0810B336
	subs r0, r2, 0x1
	b _0810B338
_0810B336:
	movs r0, 0x17
_0810B338:
	strh r0, [r1, 0xC]
	adds r0, r3, 0
	adds r1, r4, 0
	bl UpdateClockPeriod
	b _0810B382
_0810B344:
	ldr r0, _0810B360 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xE]
	movs r5, 0xE
	ldrsh r0, [r1, r5]
	cmp r0, 0x3A
	bgt _0810B364
	adds r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _0810B382
	.align 2, 0
_0810B360: .4byte gTasks
_0810B364:
	movs r5, 0
	strh r5, [r1, 0xE]
	ldrh r2, [r1, 0xC]
	movs r6, 0xC
	ldrsh r0, [r1, r6]
	cmp r0, 0x16
	bgt _0810B378
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _0810B37A
_0810B378:
	strh r5, [r1, 0xC]
_0810B37A:
	adds r0, r3, 0
	adds r1, r4, 0
	bl UpdateClockPeriod
_0810B382:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end AdvanceClock

	thumb_func_start UpdateClockPeriod
UpdateClockPeriod: @ 810B38C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _0810B3AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0xC]
	cmp r3, 0x1
	beq _0810B3B0
	cmp r3, 0x2
	beq _0810B3C2
	b _0810B3CE
	.align 2, 0
_0810B3AC: .4byte gTasks
_0810B3B0:
	cmp r0, 0xB
	beq _0810B3BA
	cmp r0, 0x17
	beq _0810B3BE
	b _0810B3CE
_0810B3BA:
	movs r0, 0
	b _0810B3CC
_0810B3BE:
	strh r3, [r1, 0x12]
	b _0810B3CE
_0810B3C2:
	cmp r0, 0
	beq _0810B3CC
	cmp r0, 0xC
	bne _0810B3CE
	movs r0, 0x1
_0810B3CC:
	strh r0, [r1, 0x12]
_0810B3CE:
	pop {r0}
	bx r0
	thumb_func_end UpdateClockPeriod

	thumb_func_start InitClockWithRtc
InitClockWithRtc: @ 810B3D4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl RtcCalcLocalTime
	ldr r1, _0810B43C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r6, r0, r1
	ldr r5, _0810B440 @ =gLocalTime
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	strh r0, [r6, 0xC]
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	strh r0, [r6, 0xE]
	movs r0, 0xE
	ldrsh r1, [r6, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	strh r0, [r6, 0x8]
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	movs r1, 0xC
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 1
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	adds r4, r1
	strh r4, [r6, 0xA]
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	cmp r0, 0xB
	bgt _0810B444
	movs r0, 0
	b _0810B446
	.align 2, 0
_0810B43C: .4byte gTasks
_0810B440: .4byte gLocalTime
_0810B444:
	movs r0, 0x1
_0810B446:
	strh r0, [r6, 0x12]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end InitClockWithRtc

	thumb_func_start sub_810B05C
sub_810B05C: @ 810B450
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r2, _0810B4E0 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r4, [r0, 0x8]
	adds r7, r4, 0
	adds r0, r4, 0
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0810B478
	adds r0, 0xF
_0810B478:
	lsls r0, 12
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0810B48C
	adds r0, 0xF
_0810B48C:
	lsls r1, r0, 12
	lsrs r1, 16
	lsls r3, r5, 16
	lsrs r2, r3, 16
	negs r3, r3
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0
	bl SetOamMatrix
	ldr r1, _0810B4E4 @ =gClockHandCoords
	lsls r2, r7, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r3, r0, 16
	adds r1, 0x1
	adds r2, r1
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r3, 0x80
	bls _0810B4C8
	movs r1, 0xFF
	lsls r1, 8
	adds r0, r1, 0
	orrs r3, r0
_0810B4C8:
	cmp r2, 0x80
	bls _0810B4D4
	movs r1, 0xFF
	lsls r1, 8
	adds r0, r1, 0
	orrs r2, r0
_0810B4D4:
	strh r3, [r6, 0x24]
	strh r2, [r6, 0x26]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B4E0: .4byte gTasks
_0810B4E4: .4byte gClockHandCoords
	thumb_func_end sub_810B05C

	thumb_func_start sub_810B0F4
sub_810B0F4: @ 810B4E8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r2, _0810B578 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r4, [r0, 0xA]
	adds r7, r4, 0
	adds r0, r4, 0
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0810B510
	adds r0, 0xF
_0810B510:
	lsls r0, 12
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0810B524
	adds r0, 0xF
_0810B524:
	lsls r1, r0, 12
	lsrs r1, 16
	lsls r3, r5, 16
	lsrs r2, r3, 16
	negs r3, r3
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x1
	bl SetOamMatrix
	ldr r1, _0810B57C @ =gClockHandCoords
	lsls r2, r7, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r3, r0, 16
	adds r1, 0x1
	adds r2, r1
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r3, 0x80
	bls _0810B560
	movs r1, 0xFF
	lsls r1, 8
	adds r0, r1, 0
	orrs r3, r0
_0810B560:
	cmp r2, 0x80
	bls _0810B56C
	movs r1, 0xFF
	lsls r1, 8
	adds r0, r1, 0
	orrs r2, r0
_0810B56C:
	strh r3, [r6, 0x24]
	strh r2, [r6, 0x26]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B578: .4byte gTasks
_0810B57C: .4byte gClockHandCoords
	thumb_func_end sub_810B0F4

	thumb_func_start sub_810B18C
sub_810B18C: @ 810B580
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0810B5BC @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0810B5C0
	ldrh r1, [r4, 0x30]
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _0810B5AC
	adds r0, r1, 0x5
	strh r0, [r4, 0x30]
_0810B5AC:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _0810B5E0
	adds r0, r1, 0x1
	b _0810B5DE
	.align 2, 0
_0810B5BC: .4byte gTasks
_0810B5C0:
	ldrh r1, [r4, 0x30]
	adds r0, r1, 0
	subs r0, 0x2E
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _0810B5D2
	subs r0, r1, 0x5
	strh r0, [r4, 0x30]
_0810B5D2:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x4B
	ble _0810B5E0
	subs r0, r1, 0x1
_0810B5DE:
	strh r0, [r4, 0x30]
_0810B5E0:
	ldrh r0, [r4, 0x30]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r0, r1, 1
	cmp r0, 0
	bge _0810B5F8
	ldr r1, _0810B620 @ =0x00000fff
	adds r0, r1
_0810B5F8:
	asrs r0, 12
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r0, r1, 1
	cmp r0, 0
	bge _0810B614
	ldr r2, _0810B620 @ =0x00000fff
	adds r0, r2
_0810B614:
	asrs r0, 12
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B620: .4byte 0x00000fff
	thumb_func_end sub_810B18C

	thumb_func_start sub_810B230
sub_810B230: @ 810B624
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0810B660 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0810B664
	ldrh r1, [r4, 0x30]
	adds r0, r1, 0
	subs r0, 0x69
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _0810B650
	adds r0, r1, 0x5
	strh r0, [r4, 0x30]
_0810B650:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x68
	bgt _0810B684
	adds r0, r1, 0x1
	b _0810B682
	.align 2, 0
_0810B660: .4byte gTasks
_0810B664:
	ldrh r1, [r4, 0x30]
	adds r0, r1, 0
	subs r0, 0x5B
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1D
	bhi _0810B676
	subs r0, r1, 0x5
	strh r0, [r4, 0x30]
_0810B676:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	ble _0810B684
	subs r0, r1, 0x1
_0810B682:
	strh r0, [r4, 0x30]
_0810B684:
	ldrh r0, [r4, 0x30]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r0, r1, 1
	cmp r0, 0
	bge _0810B69C
	ldr r1, _0810B6C4 @ =0x00000fff
	adds r0, r1
_0810B69C:
	asrs r0, 12
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r0, r1, 1
	cmp r0, 0
	bge _0810B6B8
	ldr r2, _0810B6C4 @ =0x00000fff
	adds r0, r2
_0810B6B8:
	asrs r0, 12
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B6C4: .4byte 0x00000fff
	thumb_func_end sub_810B230

	.align 2, 0 @ Don't pad with nop.
