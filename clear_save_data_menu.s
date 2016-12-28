	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CB2_InitClearSaveDataScreen
CB2_InitClearSaveDataScreen: @ 8148800
	push {lr}
	bl InitClearSaveDataScreen
	lsls r0, 24
	cmp r0, 0
	beq _08148814
	ldr r0, _08148818 @ =Task_InitMenu
	movs r1, 0
	bl CreateTask
_08148814:
	pop {r0}
	bx r0
	.align 2, 0
_08148818: .4byte Task_InitMenu
	thumb_func_end CB2_InitClearSaveDataScreen

	thumb_func_start VBlankCB_ClearSaveDataScreen
VBlankCB_ClearSaveDataScreen: @ 8148BD8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_ClearSaveDataScreen

	thumb_func_start Task_InitMenu
Task_InitMenu: @ 8148BEC
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ResetSpriteData
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08148C64 @ =VBlankCB_ClearSaveDataScreen
	bl SetVBlankCallback
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08148C68 @ =gSystemText_ClearAllSaveDataPrompt
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x6
	bl MenuDrawTextWindow
	ldr r3, _08148C6C @ =gUnknown_08376D74
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x2
	bl InitMenu
	ldr r1, _08148C70 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08148C74 @ =Task_ProcessMenuInput
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148C64: .4byte VBlankCB_ClearSaveDataScreen
_08148C68: .4byte gSystemText_ClearAllSaveDataPrompt
_08148C6C: .4byte gUnknown_08376D74
_08148C70: .4byte gTasks
_08148C74: .4byte Task_ProcessMenuInput
	thumb_func_end Task_InitMenu

	thumb_func_start Task_ProcessMenuInput
Task_ProcessMenuInput: @ 8148C78
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08148C9E
	cmp r1, 0
	bgt _08148C98
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08148CC8
	b _08148CDA
_08148C98:
	cmp r1, 0x1
	beq _08148CC8
	b _08148CDA
_08148C9E:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08148CBC @ =gSystemText_ClearingData
	bl sub_8071F40
	ldr r1, _08148CC0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08148CC4 @ =Task_ClearSaveData
	str r1, [r0]
	b _08148CDA
	.align 2, 0
_08148CBC: .4byte gSystemText_ClearingData
_08148CC0: .4byte gTasks
_08148CC4: .4byte Task_ClearSaveData
_08148CC8:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08148CE8 @ =CB2_SoftReset
	bl SetMainCallback2
_08148CDA:
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148CE8: .4byte CB2_SoftReset
	thumb_func_end Task_ProcessMenuInput

	thumb_func_start Task_ClearSaveData
Task_ClearSaveData: @ 8148CEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ClearSaveData
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08148D0C @ =CB2_SoftReset
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148D0C: .4byte CB2_SoftReset
	thumb_func_end Task_ClearSaveData

	thumb_func_start CB2_ClearSaveDataScreen
CB2_ClearSaveDataScreen: @ 8148D10
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_ClearSaveDataScreen

	thumb_func_start VBlankCB_InitClearSaveDataScreen
VBlankCB_InitClearSaveDataScreen: @ 8148D20
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_InitClearSaveDataScreen

	thumb_func_start InitClearSaveDataScreen
InitClearSaveDataScreen: @ 8148D2C
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _08148E60 @ =gMain
	ldr r1, _08148E64 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148D42
	cmp r0, 0x1
	bne _08148D42
	b _08148EC0
_08148D42:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x10
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0xA
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x22
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x6
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	add r0, sp, 0x4
	strh r4, [r0]
	ldr r1, _08148E68 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08148E6C @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08148E70 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _08148E74 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _08148E78 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r2, _08148E7C @ =gPlttBufferUnfaded
	ldr r0, _08148E80 @ =0x00007fff
	strh r0, [r2]
	ldr r1, _08148E84 @ =gPlttBufferFaded
	strh r0, [r1]
	ldr r0, _08148E88 @ =0x00003945
	strh r0, [r2, 0x2]
	strh r0, [r1, 0x2]
	movs r1, 0
	ldr r3, _08148E8C @ =0x06000020
	ldr r0, _08148E90 @ =0x00001111
	adds r2, r0, 0
_08148DD0:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08148DD0
	movs r1, 0
	ldr r4, _08148E94 @ =0x06003800
	movs r3, 0x1
	ldr r2, _08148E98 @ =0x000004ff
_08148DE8:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08148DE8
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _08148E9C @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08148EA0 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08148EA4 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08148EA8 @ =0x04000208
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	ldr r3, _08148EAC @ =0x04000200
	ldrh r0, [r3]
	movs r4, 0x1
	orrs r0, r4
	strh r0, [r3]
	strh r1, [r2]
	ldr r2, _08148EB0 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08148EB4 @ =VBlankCB_InitClearSaveDataScreen
	bl SetVBlankCallback
	ldr r1, _08148EB8 @ =0x0400000e
	ldr r2, _08148EBC @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0x90
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08148E60 @ =gMain
	ldr r1, _08148E64 @ =0x0000043c
	adds r0, r1
	strb r4, [r0]
	b _08148EE4
	.align 2, 0
_08148E60: .4byte gMain
_08148E64: .4byte 0x0000043c
_08148E68: .4byte 0x040000d4
_08148E6C: .4byte 0x8100c000
_08148E70: .4byte 0x85000100
_08148E74: .4byte 0x05000002
_08148E78: .4byte 0x810001ff
_08148E7C: .4byte gPlttBufferUnfaded
_08148E80: .4byte 0x00007fff
_08148E84: .4byte gPlttBufferFaded
_08148E88: .4byte 0x00003945
_08148E8C: .4byte 0x06000020
_08148E90: .4byte 0x00001111
_08148E94: .4byte 0x06003800
_08148E98: .4byte 0x000004ff
_08148E9C: .4byte gWindowConfig_81E6C3C
_08148EA0: .4byte gWindowConfig_81E6CE4
_08148EA4: .4byte 0x0000ffff
_08148EA8: .4byte 0x04000208
_08148EAC: .4byte 0x04000200
_08148EB0: .4byte 0x04000004
_08148EB4: .4byte VBlankCB_InitClearSaveDataScreen
_08148EB8: .4byte 0x0400000e
_08148EBC: .4byte 0x00000703
_08148EC0:
	bl UpdatePaletteFade
	ldr r0, _08148EDC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148EE4
	ldr r0, _08148EE0 @ =CB2_ClearSaveDataScreen
	bl SetMainCallback2
	movs r0, 0x1
	b _08148EE6
	.align 2, 0
_08148EDC: .4byte gPaletteFade
_08148EE0: .4byte CB2_ClearSaveDataScreen
_08148EE4:
	movs r0, 0
_08148EE6:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end InitClearSaveDataScreen

	thumb_func_start CB2_SoftReset
CB2_SoftReset: @ 8148EF0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08148F1C @ =gMain
	ldr r1, _08148F20 @ =0x0000043c
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _08148F04
	cmp r0, 0x1
	beq _08148F28
_08148F04:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08148F24 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strb r0, [r4]
	b _08148F3C
	.align 2, 0
_08148F1C: .4byte gMain
_08148F20: .4byte 0x0000043c
_08148F24: .4byte 0x0000ffff
_08148F28:
	bl UpdatePaletteFade
	ldr r0, _08148F44 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148F3C
	bl DoSoftReset
_08148F3C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148F44: .4byte gPaletteFade
	thumb_func_end CB2_SoftReset

	.align 2, 0 @ Don't pad with nop.
