	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CB2_MainMenu
CB2_MainMenu: @ 8009890
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_MainMenu

	thumb_func_start VBlankCB_MainMenu
VBlankCB_MainMenu: @ 80098A8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_MainMenu

	thumb_func_start CB2_InitMainMenu
CB2_InitMainMenu: @ 80098BC
	push {lr}
	movs r0, 0
	bl InitMainMenu
	pop {r0}
	bx r0
	thumb_func_end CB2_InitMainMenu

	thumb_func_start sub_80096FC
sub_80096FC: @ 80098C8
	push {lr}
	movs r0, 0x1
	bl InitMainMenu
	pop {r0}
	bx r0
	thumb_func_end sub_80096FC

	thumb_func_start InitMainMenu
InitMainMenu: @ 80098D4
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
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
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r1, _08009988
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0800998C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r5, 0
	str r5, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08009990
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r5, [r0]
	str r0, [r1]
	ldr r0, _08009994
	str r0, [r1, 0x4]
	ldr r0, _08009998
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0800999C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _080099A0
	bl SetUpWindowConfig
	ldr r0, _080099A4
	bl InitMenuWindow
	cmp r4, 0
	beq _080099A8
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080099BA
	.align 2, 0
_08009988: .4byte 0x040000d4
_0800998C: .4byte 0x8100c000
_08009990: .4byte 0x85000100
_08009994: .4byte 0x05000002
_08009998: .4byte 0x810001ff
_0800999C: .4byte gMainMenuPalette
_080099A0: .4byte gWindowConfig_81E6C3C
_080099A4: .4byte gWindowConfig_81E6CE4
_080099A8:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08009A24
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080099BA:
	ldr r0, _08009A28
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r3, _08009A2C
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r4, _08009A30
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _08009A34
	bl SetVBlankCallback
	ldr r0, _08009A38
	bl SetMainCallback2
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08009A3C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08009A40
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08009A24: .4byte 0x0000ffff
_08009A28: .4byte 0x04000040
_08009A2C: .4byte 0x04000208
_08009A30: .4byte 0x04000200
_08009A34: .4byte VBlankCB_MainMenu
_08009A38: .4byte CB2_MainMenu
_08009A3C: .4byte Task_MainMenuCheckSave
_08009A40: .4byte gTasks
	thumb_func_end InitMainMenu

	thumb_func_start Task_MainMenuCheckSave
Task_MainMenuCheckSave: @ 8009A44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08009AA0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _08009A60
	b _08009BC8
_08009A60:
	ldr r7, _08009AA4
	strh r6, [r7]
	ldr r0, _08009AA8
	mov r8, r0
	strh r6, [r0]
	ldr r1, _08009AAC
	ldr r2, _08009AB0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xF1
	strh r0, [r1]
	ldr r0, _08009AB4
	strh r6, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	ldr r0, _08009AB8
	ldrh r4, [r0]
	cmp r4, 0x2
	beq _08009B08
	cmp r4, 0x2
	bgt _08009ABC
	cmp r4, 0
	beq _08009B78
	cmp r4, 0x1
	beq _08009AC6
	b _08009B78
	.align 2, 0
_08009AA0: .4byte gPaletteFade
_08009AA4: .4byte 0x04000040
_08009AA8: .4byte 0x04000044
_08009AAC: .4byte 0x04000048
_08009AB0: .4byte 0x00001111
_08009AB4: .4byte 0x04000052
_08009AB8: .4byte gSaveFileStatus
_08009ABC:
	cmp r4, 0x4
	beq _08009B94
	cmp r4, 0xFF
	beq _08009B1C
	b _08009B78
_08009AC6:
	bl IsMysteryGiftAvailable
	cmp r0, 0x1
	bne _08009AE8
	ldr r2, _08009AE4
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x8]
	adds r1, r2, 0
	adds r2, r3, 0
	b _08009AF6
	.align 2, 0
_08009AE4: .4byte gTasks
_08009AE8:
	ldr r0, _08009B00
	lsls r2, r5, 2
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r0
	strh r4, [r1, 0x8]
	adds r1, r0, 0
_08009AF6:
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08009B04
	b _08009BC6
	.align 2, 0
_08009B00: .4byte gTasks
_08009B04: .4byte Task_MainMenuCheckRtc
_08009B08:
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08009B18
	b _08009BA2
	.align 2, 0
_08009B18: .4byte gSaveFileDeletedMessage
_08009B1C:
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08009B60
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r2, _08009B64
	adds r0, r2, 0
	strh r0, [r7]
	ldr r1, _08009B68
	adds r0, r1, 0
	mov r2, r8
	strh r0, [r2]
	ldr r1, _08009B6C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r5, 0x1
	strh r5, [r4, 0x8]
	ldr r0, _08009B70
	str r0, [r4]
	bl IsMysteryGiftAvailable
	cmp r0, 0x1
	bne _08009B74
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _08009BC8
	.align 2, 0
_08009B60: .4byte gSaveFileCorruptMessage
_08009B64: .4byte 0x000011df
_08009B68: .4byte 0x0000719f
_08009B6C: .4byte gTasks
_08009B70: .4byte Task_MainMenuWaitForSaveErrorAck
_08009B74:
	strh r5, [r4, 0x8]
	b _08009BC8
_08009B78:
	ldr r1, _08009B8C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _08009B90
	b _08009BC6
	.align 2, 0
_08009B8C: .4byte gTasks
_08009B90: .4byte Task_MainMenuCheckRtc
_08009B94:
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08009BD4
_08009BA2:
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08009BD8
	adds r0, r1, 0
	strh r0, [r7]
	ldr r2, _08009BDC
	adds r0, r2, 0
	mov r1, r8
	strh r0, [r1]
	ldr r1, _08009BE0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x8]
	ldr r1, _08009BE4
_08009BC6:
	str r1, [r0]
_08009BC8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009BD4: .4byte gBoardNotInstalledMessage
_08009BD8: .4byte 0x000011df
_08009BDC: .4byte 0x0000719f
_08009BE0: .4byte gTasks
_08009BE4: .4byte Task_MainMenuWaitForSaveErrorAck
	thumb_func_end Task_MainMenuCheckSave

	thumb_func_start Task_MainMenuWaitForSaveErrorAck
Task_MainMenuWaitForSaveErrorAck: @ 8009BE8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08009C1E
	ldr r0, _08009C24
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08009C1E
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08009C28
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08009C2C
	str r0, [r1]
_08009C1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009C24: .4byte gMain
_08009C28: .4byte gTasks
_08009C2C: .4byte Task_MainMenuCheckRtc
	thumb_func_end Task_MainMenuWaitForSaveErrorAck

	thumb_func_start Task_MainMenuCheckRtc
Task_MainMenuCheckRtc: @ 8009C30
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08009C8C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08009CDC
	ldr r6, _08009C90
	strh r2, [r6]
	ldr r7, _08009C94
	strh r2, [r7]
	ldr r1, _08009C98
	ldr r3, _08009C9C
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xF1
	strh r0, [r1]
	ldr r0, _08009CA0
	strh r2, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	bl RtcGetErrorStatus
	movs r1, 0xFF
	lsls r1, 4
	ands r1, r0
	cmp r1, 0
	bne _08009CAC
	ldr r0, _08009CA4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08009CA8
	str r0, [r1]
	b _08009CDC
	.align 2, 0
_08009C8C: .4byte gPaletteFade
_08009C90: .4byte 0x04000040
_08009C94: .4byte 0x04000044
_08009C98: .4byte 0x04000048
_08009C9C: .4byte 0x00001111
_08009CA0: .4byte 0x04000052
_08009CA4: .4byte gTasks
_08009CA8: .4byte Task_MainMenuDraw
_08009CAC:
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08009CE4
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08009CE8
	adds r0, r1, 0
	strh r0, [r6]
	ldr r3, _08009CEC
	adds r0, r3, 0
	strh r0, [r7]
	ldr r1, _08009CF0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08009CF4
	str r1, [r0]
_08009CDC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009CE4: .4byte gBatteryDryMessage
_08009CE8: .4byte 0x000011df
_08009CEC: .4byte 0x0000719f
_08009CF0: .4byte gTasks
_08009CF4: .4byte Task_MainMenuWaitForRtcErrorAck
	thumb_func_end Task_MainMenuCheckRtc

	thumb_func_start Task_MainMenuWaitForRtcErrorAck
Task_MainMenuWaitForRtcErrorAck: @ 8009CF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08009D2E
	ldr r0, _08009D34
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08009D2E
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08009D38
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08009D3C
	str r0, [r1]
_08009D2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009D34: .4byte gMain
_08009D38: .4byte gTasks
_08009D3C: .4byte Task_MainMenuDraw
	thumb_func_end Task_MainMenuWaitForRtcErrorAck

	thumb_func_start Task_MainMenuDraw
Task_MainMenuDraw: @ 8009D40
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08009DA8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08009D5A
	b _08009EEC
_08009D5A:
	ldr r0, _08009DAC
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	ldr r1, _08009DB0
	ldr r3, _08009DB4
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xF1
	strh r0, [r1]
	ldr r0, _08009DB8
	strh r2, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	mov r0, sp
	strh r2, [r0]
	movs r1, 0xFE
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _08009DBC
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08009DC4
	mov r1, sp
	ldr r2, _08009DC0
	adds r0, r2, 0
	strh r0, [r1]
	mov r0, sp
	movs r1, 0xF1
	movs r2, 0x2
	bl LoadPalette
	b _08009DD6
	.align 2, 0
_08009DA8: .4byte gPaletteFade
_08009DAC: .4byte 0x04000040
_08009DB0: .4byte 0x04000048
_08009DB4: .4byte 0x00001111
_08009DB8: .4byte 0x04000052
_08009DBC: .4byte gSaveBlock2
_08009DC0: .4byte 0x00007e04
_08009DC4:
	mov r1, sp
	ldr r3, _08009E20
	adds r0, r3, 0
	strh r0, [r1]
	mov r0, sp
	movs r1, 0xF1
	movs r2, 0x2
	bl LoadPalette
_08009DD6:
	ldr r2, _08009E24
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0x1
	beq _08009E30
	cmp r0, 0x1
	ble _08009DF2
	cmp r0, 0x2
	beq _08009E84
_08009DF2:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1C
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _08009E28
	movs r1, 0x2
	movs r2, 0x1
	bl PrintMainMenuItem
	movs r0, 0x1
	movs r1, 0x4
	movs r2, 0x1C
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _08009E2C
	movs r1, 0x2
	movs r2, 0x5
	bl PrintMainMenuItem
	b _08009EE0
	.align 2, 0
_08009E20: .4byte 0x0000547f
_08009E24: .4byte gTasks
_08009E28: .4byte gMainMenuString_NewGame
_08009E2C: .4byte gMainMenuString_Option
_08009E30:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1C
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _08009E78
	movs r1, 0x2
	movs r2, 0x1
	bl PrintMainMenuItem
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldr r0, _08009E7C
	movs r1, 0x2
	movs r2, 0x9
	bl PrintMainMenuItem
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuDrawTextWindow
	ldr r0, _08009E80
	movs r1, 0x2
	movs r2, 0xD
	bl PrintMainMenuItem
	bl PrintSaveFileInfo
	b _08009EE0
	.align 2, 0
_08009E78: .4byte gMainMenuString_Continue
_08009E7C: .4byte gMainMenuString_NewGame
_08009E80: .4byte gMainMenuString_Option
_08009E84:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1C
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _08009EF4
	movs r1, 0x2
	movs r2, 0x1
	bl PrintMainMenuItem
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldr r0, _08009EF8
	movs r1, 0x2
	movs r2, 0x9
	bl PrintMainMenuItem
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuDrawTextWindow
	ldr r0, _08009EFC
	movs r1, 0x2
	movs r2, 0xD
	bl PrintMainMenuItem
	movs r0, 0x1
	movs r1, 0x10
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08009F00
	movs r1, 0x2
	movs r2, 0x11
	bl PrintMainMenuItem
	bl PrintSaveFileInfo
_08009EE0:
	ldr r0, _08009F04
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08009F08
	str r0, [r1]
_08009EEC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009EF4: .4byte gMainMenuString_Continue
_08009EF8: .4byte gMainMenuString_NewGame
_08009EFC: .4byte gMainMenuString_MysteryEvents
_08009F00: .4byte gMainMenuString_Option
_08009F04: .4byte gTasks
_08009F08: .4byte Task_MainMenuHighlight
	thumb_func_end Task_MainMenuDraw

	thumb_func_start Task_MainMenuHighlight
Task_MainMenuHighlight: @ 8009F0C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08009F30
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0xA]
	bl HighlightCurrentMenuItem
	ldr r0, _08009F34
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009F30: .4byte gTasks
_08009F34: .4byte Task_MainMenuProcessKeyInput
	thumb_func_end Task_MainMenuHighlight

	thumb_func_start MainMenuProcessKeyInput
MainMenuProcessKeyInput: @ 8009F38
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08009F74
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	mov r12, r1
	cmp r0, 0
	beq _08009F80
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08009F78
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08009F7C
	str r1, [r0]
	b _0800A040
	.align 2, 0
_08009F74: .4byte gMain
_08009F78: .4byte gTasks
_08009F7C: .4byte Task_MainMenuPressedA
_08009F80:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08009FCC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08009FBC
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08009FC0
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _08009FC4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08009FC8
	str r1, [r0]
	b _0800A040
	.align 2, 0
_08009FBC: .4byte 0x0000ffff
_08009FC0: .4byte 0x04000040
_08009FC4: .4byte gTasks
_08009FC8: .4byte Task_MainMenuPressedB
_08009FCC:
	ldr r0, _08009FEC
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r6, r0, 0
	cmp r1, 0x1
	beq _08009FF0
	cmp r1, 0x1
	ble _08009FE8
	cmp r1, 0x2
	beq _08009FF4
_08009FE8:
	movs r5, 0x2
	b _08009FF6
	.align 2, 0
_08009FEC: .4byte gTasks
_08009FF0:
	movs r5, 0x3
	b _08009FF6
_08009FF4:
	movs r5, 0x4
_08009FF6:
	mov r7, r12
	ldrh r1, [r7, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800A01A
	adds r0, r2, r4
	lsls r0, 3
	adds r1, r0, r6
	ldrh r3, [r1, 0xA]
	movs r7, 0xA
	ldrsh r0, [r1, r7]
	cmp r0, 0
	ble _0800A01A
	subs r0, r3, 0x1
	strh r0, [r1, 0xA]
	movs r0, 0x1
	b _0800A042
_0800A01A:
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0800A040
	adds r0, r2, r4
	lsls r0, 3
	adds r2, r0, r6
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	subs r0, r5, 0x1
	cmp r1, r0
	bge _0800A040
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	movs r0, 0x1
	b _0800A042
_0800A040:
	movs r0, 0
_0800A042:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MainMenuProcessKeyInput

	thumb_func_start Task_MainMenuProcessKeyInput
Task_MainMenuProcessKeyInput: @ 800A04C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MainMenuProcessKeyInput
	lsls r0, 24
	cmp r0, 0
	beq _0800A06C
	ldr r0, _0800A074
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800A078
	str r0, [r1]
_0800A06C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A074: .4byte gTasks
_0800A078: .4byte Task_MainMenuHighlight
	thumb_func_end Task_MainMenuProcessKeyInput

	thumb_func_start Task_MainMenuPressedA
Task_MainMenuPressedA: @ 800A07C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800A0B8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800A170
	ldr r0, _0800A0BC
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r5, 0x8
	ldrsh r3, [r1, r5]
	adds r5, r0, 0
	cmp r3, 0x1
	beq _0800A0C0
	cmp r3, 0x1
	ble _0800A0AA
	cmp r3, 0x2
	beq _0800A0D2
_0800A0AA:
	movs r0, 0xA
	ldrsh r1, [r1, r0]
	cmp r1, 0
	beq _0800A0EA
	cmp r1, 0x1
	bne _0800A0EA
	b _0800A0F2
	.align 2, 0
_0800A0B8: .4byte gPaletteFade
_0800A0BC: .4byte gTasks
_0800A0C0:
	movs r0, 0xA
	ldrsh r1, [r1, r0]
	cmp r1, 0x1
	beq _0800A0EA
	cmp r1, 0x1
	ble _0800A0E6
	cmp r1, 0x2
	bne _0800A0E6
	b _0800A0F2
_0800A0D2:
	movs r0, 0xA
	ldrsh r1, [r1, r0]
	cmp r1, 0x1
	beq _0800A0EA
	cmp r1, 0x1
	ble _0800A0E6
	cmp r1, 0x2
	beq _0800A0EE
	cmp r1, 0x3
	beq _0800A0F2
_0800A0E6:
	movs r0, 0x1
	b _0800A0F4
_0800A0EA:
	movs r0, 0
	b _0800A0F4
_0800A0EE:
	movs r0, 0x3
	b _0800A0F4
_0800A0F2:
	movs r0, 0x2
_0800A0F4:
	cmp r0, 0x1
	beq _0800A128
	cmp r0, 0x1
	ble _0800A104
	cmp r0, 0x2
	beq _0800A144
	cmp r0, 0x3
	beq _0800A164
_0800A104:
	ldr r0, _0800A11C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0800A120
	strh r1, [r0]
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r5
	ldr r1, _0800A124
	str r1, [r0]
	b _0800A170
	.align 2, 0
_0800A11C: .4byte gPlttBufferUnfaded
_0800A120: .4byte gPlttBufferFaded
_0800A124: .4byte Task_NewGameSpeech1
_0800A128:
	ldr r0, _0800A138
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0800A13C
	strh r1, [r0]
	ldr r0, _0800A140
	b _0800A14C
	.align 2, 0
_0800A138: .4byte gPlttBufferUnfaded
_0800A13C: .4byte gPlttBufferFaded
_0800A140: .4byte CB2_ContinueSavedGame
_0800A144:
	ldr r0, _0800A158
	ldr r1, _0800A15C
	str r1, [r0, 0x8]
	ldr r0, _0800A160
_0800A14C:
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
	b _0800A170
	.align 2, 0
_0800A158: .4byte gMain
_0800A15C: .4byte sub_80096FC
_0800A160: .4byte CB2_InitOptionMenu
_0800A164:
	ldr r0, _0800A178
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0800A170:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A178: .4byte CB2_InitMysteryEventMenu
	thumb_func_end Task_MainMenuPressedA

	thumb_func_start Task_MainMenuPressedB
Task_MainMenuPressedB: @ 800A17C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800A1A0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800A19A
	ldr r0, _0800A1A4
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0800A19A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A1A0: .4byte gPaletteFade
_0800A1A4: .4byte CB2_InitTitleScreen
	thumb_func_end Task_MainMenuPressedB

	thumb_func_start HighlightCurrentMenuItem
HighlightCurrentMenuItem: @ 800A1A8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _0800A1D4
	ldr r4, _0800A1D8
	adds r0, r4, 0
	strh r0, [r1]
	cmp r3, 0x1
	beq _0800A1F4
	cmp r3, 0x1
	ble _0800A1C6
	cmp r3, 0x2
	beq _0800A230
_0800A1C6:
	cmp r2, 0
	beq _0800A1CE
	cmp r2, 0x1
	beq _0800A1E4
_0800A1CE:
	ldr r1, _0800A1DC
	ldr r2, _0800A1E0
	b _0800A274
	.align 2, 0
_0800A1D4: .4byte 0x04000040
_0800A1D8: .4byte 0x000009e7
_0800A1DC: .4byte 0x04000044
_0800A1E0: .4byte 0x0000011f
_0800A1E4:
	ldr r1, _0800A1EC
	ldr r4, _0800A1F0
	adds r0, r4, 0
	b _0800A276
	.align 2, 0
_0800A1EC: .4byte 0x04000044
_0800A1F0: .4byte 0x0000213f
_0800A1F4:
	cmp r2, 0x1
	beq _0800A210
	cmp r2, 0x1
	ble _0800A200
	cmp r2, 0x2
	beq _0800A220
_0800A200:
	ldr r1, _0800A208
	ldr r2, _0800A20C
	b _0800A274
	.align 2, 0
_0800A208: .4byte 0x04000044
_0800A20C: .4byte 0x0000013f
_0800A210:
	ldr r1, _0800A218
	ldr r4, _0800A21C
	adds r0, r4, 0
	b _0800A276
	.align 2, 0
_0800A218: .4byte 0x04000044
_0800A21C: .4byte 0x0000415f
_0800A220:
	ldr r1, _0800A228
	ldr r2, _0800A22C
	b _0800A274
	.align 2, 0
_0800A228: .4byte 0x04000044
_0800A22C: .4byte 0x0000617f
_0800A230:
	cmp r2, 0x1
	beq _0800A250
	cmp r2, 0x1
	ble _0800A240
	cmp r2, 0x2
	beq _0800A260
	cmp r2, 0x3
	beq _0800A270
_0800A240:
	ldr r1, _0800A248
	ldr r4, _0800A24C
	adds r0, r4, 0
	b _0800A276
	.align 2, 0
_0800A248: .4byte 0x04000044
_0800A24C: .4byte 0x0000013f
_0800A250:
	ldr r1, _0800A258
	ldr r2, _0800A25C
	b _0800A274
	.align 2, 0
_0800A258: .4byte 0x04000044
_0800A25C: .4byte 0x0000415f
_0800A260:
	ldr r1, _0800A268
	ldr r4, _0800A26C
	adds r0, r4, 0
	b _0800A276
	.align 2, 0
_0800A268: .4byte 0x04000044
_0800A26C: .4byte 0x0000617f
_0800A270:
	ldr r1, _0800A280
	ldr r2, _0800A284
_0800A274:
	adds r0, r2, 0
_0800A276:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A280: .4byte 0x04000044
_0800A284: .4byte 0x0000819f
	thumb_func_end HighlightCurrentMenuItem

	thumb_func_start PrintMainMenuItem
PrintMainMenuItem: @ 800A288
	push {r4-r6,lr}
	sub sp, 0x20
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r1, sp
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r0, 0xE
	strb r0, [r1, 0x2]
	movs r3, 0
_0800A2A6:
	adds r0, r3, 0x3
	mov r6, sp
	adds r1, r6, r0
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x19
	bls _0800A2A6
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x1D]
	mov r0, sp
	adds r1, r5, 0
	bl MenuPrint
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PrintMainMenuItem

	thumb_func_start PrintSaveFileInfo
PrintSaveFileInfo: @ 800A2D4
	push {lr}
	bl PrintPlayerName
	bl PrintPokedexCount
	bl PrintPlayTime
	bl PrintBadgeCount
	pop {r0}
	bx r0
	thumb_func_end PrintSaveFileInfo

	thumb_func_start PrintPlayerName
PrintPlayerName: @ 800A2EC
	push {lr}
	ldr r0, _0800A308
	movs r1, 0x2
	movs r2, 0x3
	bl MenuPrint
	ldr r0, _0800A30C
	movs r1, 0x9
	movs r2, 0x3
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0800A308: .4byte gMainMenuString_Player
_0800A30C: .4byte gSaveBlock2
	thumb_func_end PrintPlayerName

	thumb_func_start PrintPlayTime
PrintPlayTime: @ 800A310
	push {r4,lr}
	sub sp, 0x30
	ldr r0, _0800A350
	movs r1, 0x7C
	movs r2, 0x18
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldr r0, _0800A354
	ldrh r1, [r0, 0xE]
	ldrb r2, [r0, 0x10]
	mov r0, sp
	movs r3, 0x1
	bl FormatPlayTime
	add r4, sp, 0x10
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0x28
	movs r3, 0x1
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0x17
	movs r2, 0x3
	bl MenuPrint
	add sp, 0x30
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A350: .4byte gMainMenuString_Time
_0800A354: .4byte gSaveBlock2
	thumb_func_end PrintPlayTime

	thumb_func_start PrintPokedexCount
PrintPokedexCount: @ 800A358
	push {lr}
	sub sp, 0x10
	ldr r0, _0800A38C
	movs r1, 0x2
	movs r2, 0x5
	bl MenuPrint
	bl GetPokedexSeenCount
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, sp
	movs r2, 0x12
	movs r3, 0
	bl sub_8072C14
	mov r0, sp
	movs r1, 0x9
	movs r2, 0x5
	bl MenuPrint
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0800A38C: .4byte gMainMenuString_Pokedex
	thumb_func_end PrintPokedexCount

	thumb_func_start PrintBadgeCount
PrintBadgeCount: @ 800A390
	push {lr}
	sub sp, 0x10
	ldr r0, _0800A3C4
	movs r1, 0x7C
	movs r2, 0x28
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	bl GetBadgeCount
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	bl ConvertIntToDecimalString
	mov r0, sp
	movs r1, 0xCD
	movs r2, 0x28
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_0800A3C4: .4byte gMainMenuString_Badges
	thumb_func_end PrintBadgeCount

	thumb_func_start Task_NewGameSpeech1
Task_NewGameSpeech1: @ 800A3C8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0800A484
	bl SetUpWindowConfig
	ldr r0, _0800A488
	bl InitMenuWindow
	ldr r0, _0800A48C
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r0, _0800A490
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0800A494
	ldr r1, _0800A498
	bl LZ77UnCompVram
	ldr r0, _0800A49C
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0800A4A0
	movs r1, 0x1
	movs r2, 0x10
	bl LoadPalette
	bl remove_some_task
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	adds r0, r4, 0
	bl AddBirchSpeechObjects
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0800A4A4
	ldr r2, _0800A4A8
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0800A4AC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x10]
	ldr r1, _0800A4B0
	str r1, [r0]
	movs r1, 0xFF
	strh r1, [r0, 0xC]
	strh r1, [r0, 0xE]
	movs r1, 0xD8
	strh r1, [r0, 0x16]
	movs r0, 0xBB
	lsls r0, 1
	bl PlayBGM
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A484: .4byte gWindowConfig_81E6C3C
_0800A488: .4byte gWindowConfig_81E6CE4
_0800A48C: .4byte 0x04000040
_0800A490: .4byte gUnknown_081E768C
_0800A494: .4byte gUnknown_081E7834
_0800A498: .4byte 0x06003800
_0800A49C: .4byte gUnknown_081E764C
_0800A4A0: .4byte gUnknown_081E796C
_0800A4A4: .4byte 0x0400000a
_0800A4A8: .4byte 0x00000703
_0800A4AC: .4byte gTasks
_0800A4B0: .4byte Task_NewGameSpeech2
	thumb_func_end Task_NewGameSpeech1

	thumb_func_start Task_NewGameSpeech2
Task_NewGameSpeech2: @ 800A4B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800A4D4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x16]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0800A4D8
	subs r0, r1, 0x1
	strh r0, [r4, 0x16]
	b _0800A51E
	.align 2, 0
_0800A4D4: .4byte gTasks
_0800A4D8:
	ldrb r0, [r4, 0x18]
	ldr r2, _0800A524
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x88
	strh r0, [r1, 0x20]
	movs r0, 0x3C
	strh r0, [r1, 0x22]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	subs r0, 0x41
	ands r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x1]
	adds r0, r5, 0
	movs r1, 0xA
	bl StartSpriteFadeIn
	adds r0, r5, 0
	movs r1, 0x14
	bl StartBackgroundFadeIn
	movs r0, 0x50
	strh r0, [r4, 0x16]
	ldr r0, _0800A528
	str r0, [r4]
_0800A51E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A524: .4byte gSprites
_0800A528: .4byte Task_NewGameSpeech3
	thumb_func_end Task_NewGameSpeech2

	thumb_func_start Task_NewGameSpeech3
Task_NewGameSpeech3: @ 800A52C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800A56C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0800A58E
	ldr r2, _0800A570
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrh r1, [r4, 0x16]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0800A574
	subs r0, r1, 0x1
	strh r0, [r4, 0x16]
	b _0800A58E
	.align 2, 0
_0800A56C: .4byte gTasks
_0800A570: .4byte gSprites
_0800A574:
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _0800A594
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r0, _0800A598
	str r0, [r4]
_0800A58E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A594: .4byte gBirchSpeech_Welcome
_0800A598: .4byte Task_NewGameSpeech4
	thumb_func_end Task_NewGameSpeech3

	thumb_func_start Task_NewGameSpeech4
Task_NewGameSpeech4: @ 800A59C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800A5D8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800A5D2
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800A5D2
	ldr r1, _0800A5DC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800A5E0
	str r1, [r0]
	ldr r0, _0800A5E4
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
_0800A5D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A5D8: .4byte gPaletteFade
_0800A5DC: .4byte gTasks
_0800A5E0: .4byte Task_NewGameSpeech5
_0800A5E4: .4byte gBirchSpeech_ThisIsPokemon
	thumb_func_end Task_NewGameSpeech4

	thumb_func_start Task_NewGameSpeech5
Task_NewGameSpeech5: @ 800A5E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800A608
	ldr r0, _0800A610
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800A614
	str r0, [r1]
_0800A608:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A610: .4byte gTasks
_0800A614: .4byte Task_NewGameSpeech6
	thumb_func_end Task_NewGameSpeech5

	thumb_func_start Task_NewGameSpeech6
Task_NewGameSpeech6: @ 800A618
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800A67C
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x1A]
	ldr r1, _0800A680
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r5, 0
	movs r1, 0x68
	strh r1, [r2, 0x20]
	movs r1, 0x48
	strh r1, [r2, 0x22]
	movs r1, 0x3E
	adds r1, r2
	mov r12, r1
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	mov r3, r12
	strb r1, [r3]
	strh r5, [r2, 0x2E]
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	str r5, [sp]
	str r5, [sp, 0x4]
	movs r2, 0x20
	str r2, [sp, 0x8]
	ldr r2, _0800A684
	str r2, [sp, 0xC]
	movs r2, 0x70
	movs r3, 0x3A
	bl CreatePokeballSprite
	ldr r0, _0800A688
	str r0, [r4]
	strh r5, [r4, 0x16]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A67C: .4byte gTasks
_0800A680: .4byte gSprites
_0800A684: .4byte 0x0000ffff
_0800A688: .4byte Task_NewGameSpeech7
	thumb_func_end Task_NewGameSpeech6

	thumb_func_start Task_NewGameSpeech7
Task_NewGameSpeech7: @ 800A68C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	beq _0800A6B8
	ldr r0, _0800A6EC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r5, r1, r0
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0x5F
	ble _0800A6B8
	ldr r0, _0800A6F0
	bl MenuSetText
	ldr r0, _0800A6F4
	str r0, [r5]
_0800A6B8:
	ldr r1, _0800A6EC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r3, [r2, 0x16]
	movs r0, 0x16
	ldrsh r1, [r2, r0]
	ldr r0, _0800A6F8
	cmp r1, r0
	bgt _0800A6E4
	adds r0, r3, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _0800A6E4
	movs r0, 0xAF
	lsls r0, 1
	movs r1, 0
	bl PlayCry1
_0800A6E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A6EC: .4byte gTasks
_0800A6F0: .4byte gSystemText_NewPara
_0800A6F4: .4byte Task_NewGameSpeech8
_0800A6F8: .4byte 0x00003fff
	thumb_func_end Task_NewGameSpeech7

	thumb_func_start Task_NewGameSpeech8
Task_NewGameSpeech8: @ 800A6FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800A726
	ldr r0, _0800A72C
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r1, _0800A730
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800A734
	str r1, [r0]
_0800A726:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A72C: .4byte gBirchSpeech_WorldInhabitedByPokemon
_0800A730: .4byte gTasks
_0800A734: .4byte Task_NewGameSpeech9
	thumb_func_end Task_NewGameSpeech8

	thumb_func_start Task_NewGameSpeech9
Task_NewGameSpeech9: @ 800A738
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800A76E
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _0800A774
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r1, _0800A778
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800A77C
	str r1, [r0]
_0800A76E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A774: .4byte gBirchSpeech_AndYouAre
_0800A778: .4byte gTasks
_0800A77C: .4byte Task_NewGameSpeech10
	thumb_func_end Task_NewGameSpeech9

	thumb_func_start Task_NewGameSpeech10
Task_NewGameSpeech10: @ 800A780
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800A7E6
	ldr r5, _0800A7EC
	ldr r0, _0800A7F0
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x1]
	movs r0, 0x1A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	orrs r2, r3
	strb r2, [r0, 0x1]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteFadeOut
	adds r0, r6, 0
	movs r1, 0x1
	bl StartBackgroundFadeOut
	movs r0, 0x40
	strh r0, [r4, 0x16]
	ldr r0, _0800A7F4
	str r0, [r4]
_0800A7E6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A7EC: .4byte gSprites
_0800A7F0: .4byte gTasks
_0800A7F4: .4byte Task_NewGameSpeech11
	thumb_func_end Task_NewGameSpeech10

	thumb_func_start Task_NewGameSpeech11
Task_NewGameSpeech11: @ 800A7F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800A820
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r3, [r2, 0x10]
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	movs r0, 0x3C
	negs r0, r0
	cmp r1, r0
	beq _0800A828
	subs r1, r3, 0x2
	strh r1, [r2, 0x10]
	ldr r0, _0800A824
	strh r1, [r0]
	b _0800A830
	.align 2, 0
_0800A820: .4byte gTasks
_0800A824: .4byte 0x04000014
_0800A828:
	ldr r0, _0800A834
	strh r0, [r2, 0x10]
	ldr r0, _0800A838
	str r0, [r2]
_0800A830:
	pop {r0}
	bx r0
	.align 2, 0
_0800A834: .4byte 0x0000ffc4
_0800A838: .4byte Task_NewGameSpeech12
	thumb_func_end Task_NewGameSpeech11

	thumb_func_start Task_NewGameSpeech12
Task_NewGameSpeech12: @ 800A83C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0800A894
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0800A8E2
	ldr r2, _0800A898
	movs r0, 0x18
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r7, 0x4
	orrs r1, r7
	strb r1, [r0]
	movs r0, 0x1A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	ldrh r0, [r4, 0x16]
	movs r1, 0x16
	ldrsh r6, [r4, r1]
	cmp r6, 0
	beq _0800A89C
	subs r0, 0x1
	strh r0, [r4, 0x16]
	b _0800A8E2
	.align 2, 0
_0800A894: .4byte gTasks
_0800A898: .4byte gSprites
_0800A89C:
	ldrb r3, [r4, 0x1C]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	movs r0, 0xB4
	strh r0, [r1, 0x20]
	movs r0, 0x3C
	strh r0, [r1, 0x22]
	movs r2, 0x3E
	adds r2, r1
	mov r12, r2
	ldrb r2, [r2]
	subs r0, 0x41
	ands r0, r2
	mov r2, r12
	strb r0, [r2]
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, 0x1]
	strh r3, [r4, 0xC]
	strh r6, [r4, 0x14]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteFadeIn
	adds r0, r5, 0
	movs r1, 0x1
	bl StartBackgroundFadeIn
	ldr r0, _0800A8E8
	str r0, [r4]
_0800A8E2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A8E8: .4byte Task_NewGameSpeech13
	thumb_func_end Task_NewGameSpeech12

	thumb_func_start Task_NewGameSpeech13
Task_NewGameSpeech13: @ 800A8EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800A924
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0800A920
	ldr r2, _0800A928
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r0, _0800A92C
	str r0, [r3]
_0800A920:
	pop {r0}
	bx r0
	.align 2, 0
_0800A924: .4byte gTasks
_0800A928: .4byte gSprites
_0800A92C: .4byte Task_NewGameSpeech14
	thumb_func_end Task_NewGameSpeech13

	thumb_func_start Task_NewGameSpeech14
Task_NewGameSpeech14: @ 800A930
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _0800A964
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r1, _0800A968
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800A96C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A964: .4byte gBirchSpeech_AreYouBoyOrGirl
_0800A968: .4byte gTasks
_0800A96C: .4byte Task_NewGameSpeech15
	thumb_func_end Task_NewGameSpeech14

	thumb_func_start Task_NewGameSpeech15
Task_NewGameSpeech15: @ 800A970
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800A998
	movs r0, 0x2
	movs r1, 0x4
	bl CreateGenderMenu
	ldr r0, _0800A9A0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800A9A4
	str r0, [r1]
_0800A998:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A9A0: .4byte gTasks
_0800A9A4: .4byte Task_NewGameSpeech16
	thumb_func_end Task_NewGameSpeech15

	thumb_func_start Task_NewGameSpeech16
Task_NewGameSpeech16: @ 800A9A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl GenderMenuProcessInput
	lsls r0, 24
	asrs r4, r0, 24
	cmp r4, 0
	beq _0800A9C2
	cmp r4, 0x1
	beq _0800A9C2
	lsls r4, r5, 2
	b _0800A9EC
_0800A9C2:
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0800AA34
	strb r4, [r0, 0x8]
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	ldr r1, _0800AA38
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800AA3C
	str r1, [r0]
	adds r4, r2, 0
_0800A9EC:
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0800AA38
	adds r0, r4, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r3, r0
	beq _0800AA2E
	strh r3, [r4, 0x14]
	ldr r2, _0800AA40
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteFadeOut
	ldr r0, _0800AA44
	str r0, [r4]
_0800AA2E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800AA34: .4byte gSaveBlock2
_0800AA38: .4byte gTasks
_0800AA3C: .4byte Task_NewGameSpeech19
_0800AA40: .4byte gSprites
_0800AA44: .4byte Task_NewGameSpeech17
	thumb_func_end Task_NewGameSpeech16

	thumb_func_start Task_NewGameSpeech17
Task_NewGameSpeech17: @ 800AA48
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0800AA78
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrb r5, [r4, 0xC]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _0800AA80
	ldr r0, _0800AA7C
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x4
	strh r0, [r1, 0x20]
	b _0800AAE6
	.align 2, 0
_0800AA78: .4byte gTasks
_0800AA7C: .4byte gSprites
_0800AA80:
	ldr r3, _0800AAA0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0800AAA4
	ldrb r5, [r4, 0x1E]
	b _0800AAA6
	.align 2, 0
_0800AAA0: .4byte gSprites
_0800AAA4:
	ldrb r5, [r4, 0x1C]
_0800AAA6:
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r3
	movs r0, 0xF0
	strh r0, [r2, 0x20]
	movs r0, 0x3C
	strh r0, [r2, 0x22]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r3]
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r7
	strh r5, [r4, 0xC]
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	adds r0, r6, 0
	movs r1, 0
	bl StartSpriteFadeIn
	ldr r0, _0800AAEC
	str r0, [r4]
_0800AAE6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AAEC: .4byte Task_NewGameSpeech18
	thumb_func_end Task_NewGameSpeech17

	thumb_func_start Task_NewGameSpeech18
Task_NewGameSpeech18: @ 800AAF0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800AB1C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrb r1, [r3, 0xC]
	ldr r2, _0800AB20
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	ldrh r1, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, 0xB4
	ble _0800AB24
	subs r0, r1, 0x4
	strh r0, [r2, 0x20]
	b _0800AB3E
	.align 2, 0
_0800AB1C: .4byte gTasks
_0800AB20: .4byte gSprites
_0800AB24:
	movs r0, 0xB4
	strh r0, [r2, 0x20]
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0800AB3E
	ldrb r0, [r2, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	strb r1, [r2, 0x1]
	ldr r0, _0800AB44
	str r0, [r3]
_0800AB3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB44: .4byte Task_NewGameSpeech16
	thumb_func_end Task_NewGameSpeech18

	thumb_func_start Task_NewGameSpeech19
Task_NewGameSpeech19: @ 800AB48
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _0800AB7C
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r1, _0800AB80
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800AB84
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB7C: .4byte gBirchSpeech_WhatsYourName
_0800AB80: .4byte gTasks
_0800AB84: .4byte Task_NewGameSpeech20
	thumb_func_end Task_NewGameSpeech19

	thumb_func_start Task_NewGameSpeech20
Task_NewGameSpeech20: @ 800AB88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800ABB0
	movs r0, 0x2
	movs r1, 0x1
	bl CreateNameMenu
	ldr r0, _0800ABB8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800ABBC
	str r0, [r1]
_0800ABB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ABB8: .4byte gTasks
_0800ABBC: .4byte Task_NewGameSpeech21
	thumb_func_end Task_NewGameSpeech20

	thumb_func_start Task_NewGameSpeech21
Task_NewGameSpeech21: @ 800ABC0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	bl NameMenuProcessInput
	lsls r6, r0, 24
	asrs r4, r6, 24
	cmp r4, 0
	beq _0800AC1C
	cmp r4, 0
	bgt _0800ABE2
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _0800AC4C
	b _0800AC70
_0800ABE2:
	cmp r4, 0x4
	bgt _0800AC70
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x16
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	lsrs r0, r6, 24
	bl SetPresetPlayerName
	ldr r1, _0800AC14
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800AC18
	str r1, [r0]
	b _0800AC70
	.align 2, 0
_0800AC14: .4byte gTasks
_0800AC18: .4byte Task_NewGameSpeech23
_0800AC1C:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0800AC44
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800AC48
	str r1, [r0]
	b _0800AC70
	.align 2, 0
_0800AC44: .4byte gTasks
_0800AC48: .4byte Task_NewGameSpeech22
_0800AC4C:
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x16
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _0800AC78
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800AC7C
	str r0, [r1]
_0800AC70:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800AC78: .4byte gTasks
_0800AC7C: .4byte Task_NewGameSpeech14
	thumb_func_end Task_NewGameSpeech21

	thumb_func_start Task_NewGameSpeech22
Task_NewGameSpeech22: @ 800AC80
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _0800ACB4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0800ACAC
	movs r0, 0x1
	bl SetPresetPlayerName
	ldr r1, _0800ACB8
	ldrb r2, [r1, 0x8]
	str r4, [sp]
	ldr r0, _0800ACBC
	str r0, [sp, 0x4]
	movs r0, 0
	movs r3, 0
	bl DoNamingScreen
_0800ACAC:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800ACB4: .4byte gPaletteFade
_0800ACB8: .4byte gSaveBlock2
_0800ACBC: .4byte CB_ContinueNewGameSpeechPart2
	thumb_func_end Task_NewGameSpeech22

	thumb_func_start Task_NewGameSpeech23
Task_NewGameSpeech23: @ 800ACC0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r5, _0800ACFC
	ldr r1, _0800AD00
	adds r0, r5, 0
	bl StringExpandPlaceholders
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r1, _0800AD04
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0800AD08
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800ACFC: .4byte gStringVar4
_0800AD00: .4byte gBirchSpeech_SoItsPlayer
_0800AD04: .4byte gTasks
_0800AD08: .4byte Task_NewGameSpeech24
	thumb_func_end Task_NewGameSpeech23

	thumb_func_start Task_NewGameSpeech24
Task_NewGameSpeech24: @ 800AD0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800AD36
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0800AD3C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800AD40
	str r0, [r1]
_0800AD36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AD3C: .4byte gTasks
_0800AD40: .4byte Task_NewGameSpeech25
	thumb_func_end Task_NewGameSpeech24

	thumb_func_start Task_NewGameSpeech25
Task_NewGameSpeech25: @ 800AD44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0800AD6A
	cmp r1, 0
	bgt _0800AD64
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0800ADC4
	b _0800ADE4
_0800AD64:
	cmp r1, 0x1
	beq _0800ADC4
	b _0800ADE4
_0800AD6A:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x7
	bl MenuZeroFillWindowRect
	ldr r2, _0800ADB8
	ldr r0, _0800ADBC
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteFadeOut
	adds r0, r5, 0
	movs r1, 0x1
	bl StartBackgroundFadeOut
	ldr r0, _0800ADC0
	str r0, [r4]
	b _0800ADE4
	.align 2, 0
_0800ADB8: .4byte gSprites
_0800ADBC: .4byte gTasks
_0800ADC0: .4byte Task_NewGameSpeech26
_0800ADC4:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x7
	bl MenuZeroFillWindowRect
	ldr r0, _0800ADEC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0800ADF0
	str r0, [r1]
_0800ADE4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800ADEC: .4byte gTasks
_0800ADF0: .4byte Task_NewGameSpeech14
	thumb_func_end Task_NewGameSpeech25

	thumb_func_start Task_NewGameSpeech26
Task_NewGameSpeech26: @ 800ADF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800AE18
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0x10]
	movs r3, 0x10
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0800AE20
	adds r1, 0x2
	strh r1, [r2, 0x10]
	ldr r0, _0800AE1C
	strh r1, [r0]
	b _0800AE24
	.align 2, 0
_0800AE18: .4byte gTasks
_0800AE1C: .4byte 0x04000014
_0800AE20:
	ldr r0, _0800AE28
	str r0, [r2]
_0800AE24:
	pop {r0}
	bx r0
	.align 2, 0
_0800AE28: .4byte Task_NewGameSpeech27
	thumb_func_end Task_NewGameSpeech26

	thumb_func_start Task_NewGameSpeech27
Task_NewGameSpeech27: @ 800AE2C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0800AF08
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x12
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _0800AF00
	ldr r5, _0800AF0C
	movs r2, 0x1C
	ldrsh r1, [r7, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x4
	mov r12, r3
	mov r2, r12
	orrs r1, r2
	strb r1, [r0]
	movs r3, 0x1E
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r7, 0x18]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x88
	strh r0, [r1, 0x20]
	movs r0, 0x40
	strh r0, [r1, 0x22]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r4, 0x5
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r3]
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	mov r3, r12
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldrb r1, [r7, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x68
	strh r1, [r0, 0x20]
	movs r1, 0x48
	strh r1, [r0, 0x22]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	ands r4, r1
	strb r4, [r3]
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r1, r12
	orrs r2, r1
	strb r2, [r0, 0x1]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteFadeIn
	adds r0, r6, 0
	movs r1, 0x1
	bl StartBackgroundFadeIn
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r4, _0800AF10
	ldr r1, _0800AF14
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r0, _0800AF18
	str r0, [r7]
_0800AF00:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AF08: .4byte gTasks
_0800AF0C: .4byte gSprites
_0800AF10: .4byte gStringVar4
_0800AF14: .4byte gBirchSpeech_AhOkayYouArePlayer
_0800AF18: .4byte Task_NewGameSpeech28
	thumb_func_end Task_NewGameSpeech27

	thumb_func_start Task_NewGameSpeech28
Task_NewGameSpeech28: @ 800AF1C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800AFBC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0800AFB4
	ldr r7, _0800AFC0
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x1]
	movs r6, 0xD
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r1, 0x1A
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800AFB4
	movs r0, 0x18
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r2, [r0, 0x1]
	adds r1, r6, 0
	ands r1, r2
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r0, 0x1]
	movs r1, 0x1A
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteFadeOut
	adds r0, r5, 0
	movs r1, 0x1
	bl StartBackgroundFadeOut
	movs r0, 0x40
	strh r0, [r4, 0x16]
	ldr r0, _0800AFC4
	str r0, [r4]
_0800AFB4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AFBC: .4byte gTasks
_0800AFC0: .4byte gSprites
_0800AFC4: .4byte Task_NewGameSpeech29
	thumb_func_end Task_NewGameSpeech28

	thumb_func_start Task_NewGameSpeech29
Task_NewGameSpeech29: @ 800AFC8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0800B020
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	adds r7, r1, 0
	cmp r0, 0
	beq _0800B098
	ldr r2, _0800B024
	movs r3, 0x18
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r0]
	movs r0, 0x1A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	ldrh r1, [r4, 0x16]
	movs r3, 0x16
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0800B028
	subs r0, r1, 0x1
	strh r0, [r4, 0x16]
	b _0800B098
	.align 2, 0
_0800B020: .4byte gTasks
_0800B024: .4byte gSprites
_0800B028:
	ldr r0, _0800B034
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _0800B038
	ldrb r5, [r4, 0x1E]
	b _0800B03A
	.align 2, 0
_0800B034: .4byte gSaveBlock2
_0800B038:
	ldrb r5, [r4, 0x1C]
_0800B03A:
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r2
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x3C
	strh r0, [r1, 0x22]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	subs r0, 0x41
	ands r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x1]
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r7
	strh r5, [r4, 0xC]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteFadeIn
	adds r0, r6, 0
	movs r1, 0x1
	bl StartBackgroundFadeIn
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _0800B0A0
	movs r1, 0x3
	movs r2, 0xE
	bl MenuPrintMessage
	ldr r0, _0800B0A4
	str r0, [r4]
_0800B098:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B0A0: .4byte gBirchSpeech_AreYouReady
_0800B0A4: .4byte Task_NewGameSpeech30
	thumb_func_end Task_NewGameSpeech29

	thumb_func_start Task_NewGameSpeech30
Task_NewGameSpeech30: @ 800B0A8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800B140
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _0800B138
	ldr r7, _0800B144
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x18
	bl MenuUpdateWindowText_OverrideLineLength
	lsls r0, 24
	cmp r0, 0
	beq _0800B138
	ldrb r0, [r6, 0xC]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r5, r4, r7
	ldrb r1, [r5, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r0, r7, 0
	adds r0, 0x10
	adds r0, r4, r0
	ldr r1, _0800B148
	str r1, [r0]
	adds r0, r5, 0
	bl InitSpriteAffineAnim
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r0, r7, 0
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _0800B14C
	str r0, [r4]
	ldr r0, _0800B150
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	bl FadeOutBGM
	ldr r0, _0800B154
	str r0, [r6]
_0800B138:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B140: .4byte gTasks
_0800B144: .4byte gSprites
_0800B148: .4byte gSpriteAffineAnimTable_81E79AC
_0800B14C: .4byte sub_800B240
_0800B150: .4byte 0x0000ffff
_0800B154: .4byte Task_NewGameSpeech31
	thumb_func_end Task_NewGameSpeech30

	thumb_func_start Task_NewGameSpeech31
Task_NewGameSpeech31: @ 800B158
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800B188
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrb r1, [r3, 0xC]
	ldr r2, _0800B18C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0800B182
	ldr r0, _0800B190
	str r0, [r3]
_0800B182:
	pop {r0}
	bx r0
	.align 2, 0
_0800B188: .4byte gTasks
_0800B18C: .4byte gSprites
_0800B190: .4byte Task_NewGameSpeech32
	thumb_func_end Task_NewGameSpeech31

	thumb_func_start Task_NewGameSpeech32
Task_NewGameSpeech32: @ 800B194
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0800B1EC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800B1E4
	ldr r0, _0800B1F0
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrb r2, [r4, 0xC]
	ldr r1, _0800B1F4
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0800B1F8
	str r1, [r0]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x82
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0800B1FC
	ldr r1, _0800B200
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0800B204
	str r0, [r4]
_0800B1E4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B1EC: .4byte gPaletteFade
_0800B1F0: .4byte gTasks
_0800B1F4: .4byte gSprites
_0800B1F8: .4byte nullsub_34
_0800B1FC: .4byte 0xffff0000
_0800B200: .4byte 0x0000ffff
_0800B204: .4byte Task_NewGameSpeech33
	thumb_func_end Task_NewGameSpeech32

	thumb_func_start Task_NewGameSpeech33
Task_NewGameSpeech33: @ 800B208
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0800B22C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0800B226
	ldr r0, _0800B230
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0800B226:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B22C: .4byte gPaletteFade
_0800B230: .4byte CB2_NewGame
	thumb_func_end Task_NewGameSpeech33

	thumb_func_start CB_ContinueNewGameSpeechPart2
CB_ContinueNewGameSpeechPart2: @ 800B234
	push {r4,r5,lr}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	adds r0, 0xC
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x10
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	subs r0, 0x6
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	subs r0, 0x6
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	add r0, sp, 0x4
	strh r4, [r0]
	ldr r1, _0800B310
	str r0, [r1]
	movs r4, 0xC0
	lsls r4, 19
	str r4, [r1, 0x4]
	ldr r0, _0800B314
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0800B318
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r2, [r0]
	str r0, [r1]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0800B31C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0800B320
	adds r1, r4, 0
	bl LZ77UnCompVram
	ldr r0, _0800B324
	ldr r1, _0800B328
	bl LZ77UnCompVram
	ldr r0, _0800B32C
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	bl ResetTasks
	ldr r0, _0800B330
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800B334
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldr r0, _0800B338
	strh r0, [r4, 0x10]
	bl remove_some_task
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	adds r0, r5, 0
	bl AddBirchSpeechObjects
	ldr r0, _0800B33C
	bl SetUpWindowConfig
	ldr r0, _0800B340
	bl InitMenuWindow
	ldr r0, _0800B344
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _0800B348
	movs r0, 0x1
	strh r0, [r4, 0x14]
	ldrb r3, [r4, 0x1E]
	b _0800B34C
	.align 2, 0
_0800B310: .4byte 0x040000d4
_0800B314: .4byte 0x8100c000
_0800B318: .4byte 0x85000100
_0800B31C: .4byte 0x81000200
_0800B320: .4byte gUnknown_081E768C
_0800B324: .4byte gUnknown_081E7834
_0800B328: .4byte 0x06003800
_0800B32C: .4byte gUnknown_081E764C
_0800B330: .4byte Task_NewGameSpeech23
_0800B334: .4byte gTasks
_0800B338: .4byte 0x0000ffc4
_0800B33C: .4byte gWindowConfig_81E6C3C
_0800B340: .4byte gWindowConfig_81E6CE4
_0800B344: .4byte gSaveBlock2
_0800B348:
	strh r0, [r4, 0x14]
	ldrb r3, [r4, 0x1C]
_0800B34C:
	ldr r0, _0800B3E4
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	movs r4, 0
	movs r0, 0xB4
	strh r0, [r1, 0x20]
	movs r0, 0x3C
	strh r0, [r1, 0x22]
	adds r1, 0x3E
	ldrb r2, [r1]
	subs r0, 0x41
	ands r0, r2
	strb r0, [r1]
	ldr r1, _0800B3E8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0xC]
	ldr r1, _0800B3EC
	ldr r2, _0800B3F0
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0800B3F4
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
	ldr r3, _0800B3F8
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0800B3FC
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _0800B400
	bl SetVBlankCallback
	ldr r0, _0800B404
	bl SetMainCallback2
	ldr r1, _0800B408
	ldr r2, _0800B40C
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B3E4: .4byte gSprites
_0800B3E8: .4byte gTasks
_0800B3EC: .4byte 0x04000014
_0800B3F0: .4byte 0x0000ffc4
_0800B3F4: .4byte 0x04000040
_0800B3F8: .4byte 0x04000208
_0800B3FC: .4byte 0x04000200
_0800B400: .4byte VBlankCB_MainMenu
_0800B404: .4byte CB2_MainMenu
_0800B408: .4byte 0x0400000a
_0800B40C: .4byte 0x00000703
	thumb_func_end CB_ContinueNewGameSpeechPart2

	thumb_func_start nullsub_34
nullsub_34: @ 800B410
	bx lr
	thumb_func_end nullsub_34

	thumb_func_start sub_800B240
sub_800B240: @ 800B414
	movs r2, 0x22
	ldrsh r1, [r0, r2]
	lsls r1, 16
	movs r3, 0x2E
	ldrsh r2, [r0, r3]
	adds r1, r2
	movs r2, 0xC0
	lsls r2, 8
	adds r1, r2
	lsrs r2, r1, 16
	strh r2, [r0, 0x22]
	strh r1, [r0, 0x2E]
	bx lr
	thumb_func_end sub_800B240

	thumb_func_start CreateAzurillSprite
CreateAzurillSprite: @ 800B430
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0800B48C
	ldr r2, _0800B490
	movs r3, 0xAF
	lsls r3, 3
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r3, 0x1
	adds r2, r3
	ldrb r2, [r2]
	ldr r4, _0800B494
	ldr r3, [r4]
	ldr r4, [r4, 0x4]
	str r4, [sp]
	movs r4, 0xAF
	lsls r4, 1
	str r4, [sp, 0x4]
	bl DecompressPicFromTable_2
	ldr r0, _0800B498
	bl LoadCompressedObjectPalette
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0800B49C
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800B48C: .4byte 0x081f5dc0
_0800B490: .4byte gMonFrontPicCoords
_0800B494: .4byte gUnknown_081FAF4C
_0800B498: .4byte 0x081f8020
_0800B49C: .4byte gUnknown_02024E8C
	thumb_func_end CreateAzurillSprite

	thumb_func_start AddBirchSpeechObjects
AddBirchSpeechObjects: @ 800B4A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x88
	movs r1, 0x3C
	movs r2, 0x1
	bl CreateBirchSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800B5B0
	mov r9, r1
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	movs r3, 0x1C
	add r3, r9
	mov r8, r3
	adds r1, r2, r3
	ldr r7, _0800B5B4
	str r7, [r1]
	add r2, r9
	ldrb r3, [r2, 0x5]
	movs r6, 0xD
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x4
	mov r10, r3
	mov r3, r10
	orrs r1, r3
	strb r1, [r2]
	ldr r1, _0800B5B8
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r1
	strh r0, [r5, 0x18]
	movs r0, 0x68
	movs r1, 0x48
	bl CreateAzurillSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	mov r4, r8
	adds r1, r2, r4
	str r7, [r1]
	add r2, r9
	ldrb r3, [r2, 0x5]
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	mov r3, r10
	orrs r1, r3
	strb r1, [r2]
	strh r0, [r5, 0x1A]
	ldr r4, _0800B5BC
	str r4, [sp]
	movs r0, 0
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	mov r3, r8
	adds r1, r2, r3
	str r7, [r1]
	add r2, r9
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	mov r4, r10
	orrs r1, r4
	strb r1, [r3]
	ldrb r3, [r2, 0x5]
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r0, [r5, 0x1C]
	ldr r0, _0800B5BC
	movs r1, 0x80
	lsls r1, 4
	adds r4, r0, r1
	str r4, [sp]
	movs r0, 0x1
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	add r8, r2
	mov r3, r8
	str r7, [r3]
	add r2, r9
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	mov r4, r10
	orrs r1, r4
	strb r1, [r3]
	ldrb r1, [r2, 0x5]
	ands r6, r1
	strb r6, [r2, 0x5]
	strh r0, [r5, 0x1E]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B5B0: .4byte gSprites
_0800B5B4: .4byte nullsub_34
_0800B5B8: .4byte gTasks
_0800B5BC: .4byte 0x02000000
	thumb_func_end AddBirchSpeechObjects

	thumb_func_start Task_SpriteFadeOut
Task_SpriteFadeOut: @ 800B5C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _0800B5F4
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r3, r0, r4
	ldrh r1, [r3, 0xA]
	movs r5, 0xA
	ldrsh r0, [r3, r5]
	cmp r0, 0
	bne _0800B5F8
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x1
	strh r0, [r1, 0x12]
	adds r0, r2, 0
	bl DestroyTask
	b _0800B622
	.align 2, 0
_0800B5F4: .4byte gTasks
_0800B5F8:
	ldrh r2, [r3, 0x10]
	movs r4, 0x10
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _0800B608
	subs r0, r2, 0x1
	strh r0, [r3, 0x10]
	b _0800B622
_0800B608:
	ldrh r0, [r3, 0xE]
	strh r0, [r3, 0x10]
	subs r1, 0x1
	strh r1, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	ldr r2, _0800B628
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	lsls r0, 8
	adds r1, r0
	strh r1, [r2]
_0800B622:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B628: .4byte 0x04000052
	thumb_func_end Task_SpriteFadeOut

	thumb_func_start StartSpriteFadeOut
StartSpriteFadeOut: @ 800B62C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0800B690
	movs r2, 0x94
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0800B694
	mov r8, r0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r6, 0
	strh r6, [r0, 0x12]
	ldr r0, _0800B698
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r8
	strh r4, [r1, 0x8]
	movs r0, 0x10
	strh r0, [r1, 0xA]
	strh r6, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r5, [r1, 0x10]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B690: .4byte 0x04000050
_0800B694: .4byte gTasks
_0800B698: .4byte Task_SpriteFadeOut
	thumb_func_end StartSpriteFadeOut

	thumb_func_start Task_SpriteFadeIn
Task_SpriteFadeIn: @ 800B69C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _0800B6D0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r3, r0, r4
	ldrh r1, [r3, 0xA]
	movs r5, 0xA
	ldrsh r0, [r3, r5]
	cmp r0, 0x10
	bne _0800B6D4
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x1
	strh r0, [r1, 0x12]
	adds r0, r2, 0
	bl DestroyTask
	b _0800B6FE
	.align 2, 0
_0800B6D0: .4byte gTasks
_0800B6D4:
	ldrh r2, [r3, 0x10]
	movs r4, 0x10
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _0800B6E4
	subs r0, r2, 0x1
	strh r0, [r3, 0x10]
	b _0800B6FE
_0800B6E4:
	ldrh r0, [r3, 0xE]
	strh r0, [r3, 0x10]
	adds r1, 0x1
	strh r1, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	subs r0, 0x1
	strh r0, [r3, 0xC]
	ldr r2, _0800B704
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	lsls r0, 8
	adds r1, r0
	strh r1, [r2]
_0800B6FE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B704: .4byte 0x04000052
	thumb_func_end Task_SpriteFadeIn

	thumb_func_start StartSpriteFadeIn
StartSpriteFadeIn: @ 800B708
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0800B770
	movs r2, 0x94
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0800B774
	mov r8, r0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r6, 0
	strh r6, [r0, 0x12]
	ldr r0, _0800B778
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r8
	strh r4, [r1, 0x8]
	strh r6, [r1, 0xA]
	movs r0, 0x10
	strh r0, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r5, [r1, 0x10]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800B770: .4byte 0x04000050
_0800B774: .4byte gTasks
_0800B778: .4byte Task_SpriteFadeIn
	thumb_func_end StartSpriteFadeIn

	thumb_func_start sub_800B5A8
sub_800B5A8: @ 800B77C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0800B79C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _0800B7A0
	subs r0, r3, 0x1
	strh r0, [r1, 0xC]
	b _0800B7DC
	.align 2, 0
_0800B79C: .4byte gTasks
_0800B7A0:
	ldrh r3, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0x8
	bne _0800B7B2
	adds r0, r2, 0
	bl DestroyTask
	b _0800B7DC
_0800B7B2:
	ldrh r2, [r1, 0x10]
	movs r4, 0x10
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _0800B7C2
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	b _0800B7DC
_0800B7C2:
	ldrh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	adds r0, r3, 0x1
	strh r0, [r1, 0xA]
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r1, _0800B7E4
	adds r0, r1
	movs r1, 0x1
	movs r2, 0x10
	bl LoadPalette
_0800B7DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7E4: .4byte gUnknown_081E795C
	thumb_func_end sub_800B5A8

	thumb_func_start StartBackgroundFadeOut
StartBackgroundFadeOut: @ 800B7E8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0800B820
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800B824
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r4, [r1, 0x8]
	strh r0, [r1, 0xA]
	movs r0, 0x8
	strh r0, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r5, [r1, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B820: .4byte sub_800B5A8
_0800B824: .4byte gTasks
	thumb_func_end StartBackgroundFadeOut

	thumb_func_start sub_800B654
sub_800B654: @ 800B828
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0800B848
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _0800B84C
	subs r0, r3, 0x1
	strh r0, [r1, 0xC]
	b _0800B888
	.align 2, 0
_0800B848: .4byte gTasks
_0800B84C:
	ldrh r3, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _0800B85E
	adds r0, r2, 0
	bl DestroyTask
	b _0800B888
_0800B85E:
	ldrh r2, [r1, 0x10]
	movs r4, 0x10
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _0800B86E
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	b _0800B888
_0800B86E:
	ldrh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	subs r0, r3, 0x1
	strh r0, [r1, 0xA]
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r1, _0800B890
	adds r0, r1
	movs r1, 0x1
	movs r2, 0x10
	bl LoadPalette
_0800B888:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B890: .4byte gUnknown_081E795C
	thumb_func_end sub_800B654

	thumb_func_start StartBackgroundFadeIn
StartBackgroundFadeIn: @ 800B894
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0800B8CC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800B8D0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	movs r0, 0x8
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r5, [r1, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B8CC: .4byte sub_800B654
_0800B8D0: .4byte gTasks
	thumb_func_end StartBackgroundFadeIn

	thumb_func_start CreateGenderMenu
CreateGenderMenu: @ 800B8D4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	adds r3, r1, 0
	lsls r2, 24
	lsls r3, 24
	lsrs r5, r2, 24
	movs r0, 0xC0
	lsls r0, 19
	adds r2, r0
	lsrs r2, 24
	lsrs r4, r3, 24
	movs r0, 0xA0
	lsls r0, 19
	adds r3, r0
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl MenuDrawTextWindow
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	ldr r3, _0800B930
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B930: .4byte gUnknown_081E79B0
	thumb_func_end CreateGenderMenu

	thumb_func_start GenderMenuProcessInput
GenderMenuProcessInput: @ 800B934
	push {lr}
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GenderMenuProcessInput

	thumb_func_start CreateNameMenu
CreateNameMenu: @ 800B944
	push {r4,r5,lr}
	sub sp, 0x8
	adds r2, r0, 0
	adds r3, r1, 0
	lsls r2, 24
	lsls r3, 24
	lsrs r5, r2, 24
	movs r0, 0xA0
	lsls r0, 20
	adds r2, r0
	lsrs r2, 24
	lsrs r4, r3, 24
	movs r0, 0xB0
	lsls r0, 20
	adds r3, r0
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl MenuDrawTextWindow
	ldr r0, _0800B98C
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0800B994
	adds r5, 0x1
	lsls r0, r5, 24
	lsrs r0, 24
	adds r4, 0x1
	lsls r1, r4, 24
	lsrs r1, 24
	ldr r3, _0800B990
	movs r2, 0x5
	bl PrintMenuItems
	b _0800B9A8
	.align 2, 0
_0800B98C: .4byte gSaveBlock2
_0800B990: .4byte gMalePresetNames
_0800B994:
	adds r5, 0x1
	lsls r0, r5, 24
	lsrs r0, 24
	adds r4, 0x1
	lsls r1, r4, 24
	lsrs r1, 24
	ldr r3, _0800B9C8
	movs r2, 0x5
	bl PrintMenuItems
_0800B9A8:
	lsls r1, r5, 24
	lsrs r1, 24
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r3, 0x5
	bl InitMenu
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B9C8: .4byte gFemalePresetNames
	thumb_func_end CreateNameMenu

	thumb_func_start NameMenuProcessInput
NameMenuProcessInput: @ 800B9CC
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end NameMenuProcessInput

	thumb_func_start SetPresetPlayerName
SetPresetPlayerName: @ 800B9DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0800B9F0
	ldrb r1, [r0, 0x8]
	adds r5, r0, 0
	cmp r1, 0
	bne _0800B9F8
	ldr r1, _0800B9F4
	b _0800B9FA
	.align 2, 0
_0800B9F0: .4byte gSaveBlock2
_0800B9F4: .4byte gMalePresetNames
_0800B9F8:
	ldr r1, _0800BA24
_0800B9FA:
	lsls r0, r2, 3
	adds r0, r1
	ldr r3, [r0]
	movs r2, 0
	ldr r4, _0800BA28
_0800BA04:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bls _0800BA04
	adds r1, r2, r5
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA24: .4byte gFemalePresetNames
_0800BA28: .4byte gSaveBlock2
	thumb_func_end SetPresetPlayerName

	.align 2, 0 @ Don't pad with nop.
