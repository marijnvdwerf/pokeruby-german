	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start Task_DestroySelf
Task_DestroySelf: @ 8007080
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end Task_DestroySelf

	thumb_func_start InitLinkTestBG
InitLinkTestBG: @ 80071F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	ldr r0, _08007240 @ =sLinkTestDigitPalette
	lsls r1, r4, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r2, _08007244 @ =0x040000d4
	ldr r0, _08007248 @ =sLinkTestDigitTiles
	str r0, [r2]
	lsls r0, r7, 14
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _0800724C @ =0x80000110
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08007250 @ =gLinkTestBGInfo
	str r6, [r0]
	str r4, [r0, 0x4]
	cmp r5, 0x2
	beq _08007264
	cmp r5, 0x2
	bgt _08007254
	cmp r5, 0x1
	beq _0800725C
	b _0800727A
	.align 2, 0
_08007240: .4byte sLinkTestDigitPalette
_08007244: .4byte 0x040000d4
_08007248: .4byte sLinkTestDigitTiles
_0800724C: .4byte 0x80000110
_08007250: .4byte gLinkTestBGInfo
_08007254:
	mov r0, r8
	cmp r0, 0x3
	beq _0800726C
	b _0800727A
_0800725C:
	ldr r2, _08007260 @ =0x0400000a
	b _0800726E
	.align 2, 0
_08007260: .4byte 0x0400000a
_08007264:
	ldr r2, _08007268 @ =0x0400000c
	b _0800726E
	.align 2, 0
_08007268: .4byte 0x0400000c
_0800726C:
	ldr r2, _08007284 @ =0x0400000e
_0800726E:
	lsls r0, r6, 8
	movs r1, 0x1
	orrs r0, r1
	lsls r1, r7, 2
	orrs r0, r1
	strh r0, [r2]
_0800727A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007284: .4byte 0x0400000e
	thumb_func_end InitLinkTestBG

	thumb_func_start InitLinkTestBG_Unused
InitLinkTestBG_Unused: @ 8007128
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0800718C @ =sLinkTestDigitPalette
	mov r2, r8
	lsls r1, r2, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r2, _08007190 @ =0x040000d4
	ldr r0, _08007194 @ =sLinkTestDigitTiles
	str r0, [r2]
	lsls r0, r6, 14
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _08007198 @ =0x80000110
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0800719C @ =gLinkTestBGInfo
	str r4, [r0]
	mov r1, r8
	str r1, [r0, 0x4]
	ldr r0, _080071A0 @ =gBGControlRegs
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	lsls r4, 8
	lsls r6, 2
	orrs r4, r6
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800718C: .4byte sLinkTestDigitPalette
_08007190: .4byte 0x040000d4
_08007194: .4byte sLinkTestDigitTiles
_08007198: .4byte 0x80000110
_0800719C: .4byte gLinkTestBGInfo
_080071A0: .4byte gBGControlRegs
	thumb_func_end InitLinkTestBG_Unused

	thumb_func_start LinkTestScreen
LinkTestScreen: @ 80071A4
	push {r4-r6,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _08007248 @ =VBlankCB_LinkTest
	bl SetVBlankCallback
	ldr r4, _0800724C @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl ResetBlockSend
	ldr r1, _08007250 @ =gLinkType
	ldr r2, _08007254 @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	bl OpenLink
	ldr r0, _08007258 @ =gMain
	ldrh r0, [r0, 0x20]
	bl SeedRng
	movs r4, 0
	ldr r6, _0800725C @ =0x02024eae
	movs r5, 0xFF
_080071E4:
	bl Random
	adds r1, r4, r6
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080071E4
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0
	bl InitLinkTestBG
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08007260 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _08007264 @ =0x03000444
	movs r0, 0
	str r0, [r1]
	bl InitLocalLinkPlayer
	ldr r0, _08007268 @ =Task_PrintTestData
	movs r1, 0
	bl CreateTask
	ldr r0, _0800726C @ =CB2_LinkTest
	bl SetMainCallback2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007248: .4byte VBlankCB_LinkTest
_0800724C: .4byte gWindowConfig_81E6CE4
_08007250: .4byte gLinkType
_08007254: .4byte 0x00001111
_08007258: .4byte gMain
_0800725C: .4byte 0x02024eae
_08007260: .4byte Task_DestroySelf
_08007264: .4byte 0x03000444
_08007268: .4byte Task_PrintTestData
_0800726C: .4byte CB2_LinkTest
	thumb_func_end LinkTestScreen

	thumb_func_start sub_8007270
sub_8007270: @ 8007270
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800727C @ =localLinkPlayer
	strh r0, [r1, 0x18]
	bx lr
	.align 2, 0
_0800727C: .4byte localLinkPlayer
	thumb_func_end sub_8007270

	thumb_func_start InitLocalLinkPlayer
InitLocalLinkPlayer: @ 80073E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r3, _0800744C @ =localLinkPlayer
	ldr r2, _08007450 @ =gSaveBlock2
	ldrb r1, [r2, 0xA]
	ldrb r0, [r2, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0xC]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3, 0x4]
	movs r4, 0
	adds r6, r2, 0
	ldr r7, _08007454 @ =gLinkType
	ldr r0, _08007458 @ =gGameLanguage
	mov r12, r0
	ldr r1, _0800745C @ =gGameVersion
	mov r8, r1
	adds r5, r3, 0
	adds r5, 0x8
_08007412:
	adds r0, r4, r5
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0xA
	ble _08007412
	ldrb r0, [r6, 0x8]
	movs r2, 0
	strb r0, [r3, 0x13]
	ldrh r0, [r7]
	str r0, [r3, 0x14]
	mov r4, r12
	ldrb r0, [r4]
	strh r0, [r3, 0x1A]
	mov r1, r8
	ldrb r0, [r1]
	movs r4, 0x80
	lsls r4, 7
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r3]
	strh r2, [r3, 0x2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800744C: .4byte localLinkPlayer
_08007450: .4byte gSaveBlock2
_08007454: .4byte gLinkType
_08007458: .4byte gGameLanguage
_0800745C: .4byte gGameVersion
	thumb_func_end InitLocalLinkPlayer

	thumb_func_start VBlankCB_LinkTest
VBlankCB_LinkTest: @ 8007460
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_LinkTest

	thumb_func_start InitLink
InitLink: @ 8007474
	push {lr}
	ldr r3, _08007494 @ =gLinkOpen
	ldr r1, _08007498 @ =gSendCmd
	ldr r2, _0800749C @ =0x0000efff
	adds r0, r1, 0
	adds r0, 0xE
_08007480:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08007480
	movs r0, 0x1
	strb r0, [r3]
	bl EnableSerial
	pop {r0}
	bx r0
	.align 2, 0
_08007494: .4byte gLinkOpen
_08007498: .4byte gSendCmd
_0800749C: .4byte 0x0000efff
	thumb_func_end InitLink

	thumb_func_start Task_TriggerHandshake
Task_TriggerHandshake: @ 80074A0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080074D0 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080074CA
	ldr r1, _080074D4 @ =gShouldAdvanceLinkState
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r2, 0
	bl DestroyTask
_080074CA:
	pop {r0}
	bx r0
	.align 2, 0
_080074D0: .4byte gTasks
_080074D4: .4byte gShouldAdvanceLinkState
	thumb_func_end Task_TriggerHandshake

	thumb_func_start OpenLink
OpenLink: @ 8007378
	push {r4-r6,lr}
	bl ResetSerial
	bl InitLink
	ldr r1, _080073D8 @ =gLinkCallback
	ldr r0, _080073DC @ =LinkCB_RequestPlayerDataExchange
	str r0, [r1]
	ldr r0, _080073E0 @ =gLinkVSyncDisabled
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080073E4 @ =gLinkErrorOccurred
	strb r1, [r0]
	ldr r0, _080073E8 @ =gSuppressLinkErrorMessage
	strb r1, [r0]
	bl ResetBlockReceivedFlags
	ldr r0, _080073EC @ =0x0300042c
	movs r1, 0
	str r1, [r0]
	ldr r0, _080073F0 @ =byte_3002A68
	strb r1, [r0]
	ldr r0, _080073F4 @ =gLinkDummyBool
	strb r1, [r0]
	ldr r0, _080073F8 @ =gReceivedRemoteLinkPlayers
	strb r1, [r0]
	ldr r6, _080073FC @ =gLinkPlayerPending
	movs r2, 0
	movs r5, 0x1
	ldr r4, _08007400 @ =u8_array_3002B78
	ldr r3, _08007404 @ =u8_array_3002B70
_080073B6:
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0x3
	ble _080073B6
	ldr r0, _08007408 @ =Task_TriggerHandshake
	movs r1, 0x2
	bl CreateTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080073D8: .4byte gLinkCallback
_080073DC: .4byte LinkCB_RequestPlayerDataExchange
_080073E0: .4byte gLinkVSyncDisabled
_080073E4: .4byte gLinkErrorOccurred
_080073E8: .4byte gSuppressLinkErrorMessage
_080073EC: .4byte 0x0300042c
_080073F0: .4byte byte_3002A68
_080073F4: .4byte gLinkDummyBool
_080073F8: .4byte gReceivedRemoteLinkPlayers
_080073FC: .4byte gLinkPlayerPending
_08007400: .4byte u8_array_3002B78
_08007404: .4byte u8_array_3002B70
_08007408: .4byte Task_TriggerHandshake
	thumb_func_end OpenLink

	thumb_func_start CloseLink
CloseLink: @ 800740C
	push {lr}
	ldr r0, _08007420 @ =gReceivedRemoteLinkPlayers
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08007424 @ =gLinkOpen
	strb r1, [r0]
	bl DisableSerial
	pop {r0}
	bx r0
	.align 2, 0
_08007420: .4byte gReceivedRemoteLinkPlayers
_08007424: .4byte gLinkOpen
	thumb_func_end CloseLink

	thumb_func_start TestBlockTransfer
TestBlockTransfer: @ 8007588
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _0800764C @ =0x03000448
	ldr r4, _08007650 @ =0x030003e8
	ldrb r0, [r5]
	ldrh r1, [r4]
	cmp r0, r1
	beq _080075AC
	ldrh r0, [r4]
	movs r1, 0x2
	movs r2, 0x3
	movs r3, 0x2
	bl PrintHex
	ldrh r0, [r4]
	strb r0, [r5]
_080075AC:
	movs r5, 0
	ldr r7, _08007654 @ =0x030003f8
_080075B0:
	ldr r0, _08007658 @ =0x0300044c
	adds r6, r5, r0
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r7
	ldrb r0, [r6]
	ldrh r1, [r4]
	cmp r0, r1
	beq _080075D8
	ldrh r0, [r4]
	adds r2, r5, 0x4
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x2
	movs r3, 0x2
	bl PrintHex
	ldrh r0, [r4]
	strb r0, [r6]
_080075D8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080075B0
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bne _0800763E
	movs r5, 0
	ldr r0, _08007654 @ =0x030003f8
	mov r9, r0
	ldr r1, _0800765C @ =0x00000342
	mov r8, r1
_080075F8:
	adds r0, r7, 0
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08007634
	lsls r0, r5, 8
	ldr r1, _08007660 @ =gBlockRecvBuffer
	adds r0, r1
	lsls r4, r5, 1
	adds r1, r4, r5
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x2]
	bl LinkTestCalcBlockChecksum
	ldr r1, _08007664 @ =gLinkTestBlockChecksums
	adds r4, r1
	movs r6, 0
	strh r0, [r4]
	adds r0, r5, 0
	bl ResetBlockReceivedFlag
	ldrh r0, [r4]
	cmp r0, r8
	beq _08007634
	ldr r0, _08007668 @ =gLinkTestDebugValuesEnabled
	strb r6, [r0]
	ldr r0, _0800766C @ =gLinkTestDummyBool
	strb r6, [r0]
_08007634:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080075F8
_0800763E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800764C: .4byte 0x03000448
_08007650: .4byte 0x030003e8
_08007654: .4byte 0x030003f8
_08007658: .4byte 0x0300044c
_0800765C: .4byte 0x00000342
_08007660: .4byte gBlockRecvBuffer
_08007664: .4byte gLinkTestBlockChecksums
_08007668: .4byte gLinkTestDebugValuesEnabled
_0800766C: .4byte gLinkTestDummyBool
	thumb_func_end TestBlockTransfer

	thumb_func_start LinkTestProcessKeyInput
LinkTestProcessKeyInput: @ 8007670
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _08007710 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08007686
	ldr r1, _08007714 @ =gShouldAdvanceLinkState
	movs r0, 0x1
	strb r0, [r1]
_08007686:
	ldrh r1, [r4, 0x2C]
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _0800769A
	ldr r0, _08007718 @ =0x02004000
	ldr r1, _0800771C @ =0x00002004
	bl InitBlockSend
_0800769A:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080076B6
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080076B6:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080076C6
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
_080076C6:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080076D8
	movs r0, 0x1
	bl sub_8125D44
_080076D8:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080076E6
	bl sub_800832C
_080076E6:
	ldr r0, _08007720 @ =gLinkTestDebugValuesEnabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _08007706
	ldr r2, [r4, 0x20]
	ldr r0, _08007724 @ =gLinkVSyncDisabled
	ldrb r1, [r0]
	ldr r0, _08007728 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	bne _08007700
	movs r0, 0x10
	orrs r1, r0
_08007700:
	adds r0, r2, 0
	bl SetLinkDebugValues
_08007706:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007710: .4byte gMain
_08007714: .4byte gShouldAdvanceLinkState
_08007718: .4byte 0x02004000
_0800771C: .4byte 0x00002004
_08007720: .4byte gLinkTestDebugValuesEnabled
_08007724: .4byte gLinkVSyncDisabled
_08007728: .4byte gLinkCallback
	thumb_func_end LinkTestProcessKeyInput

	thumb_func_start CB2_LinkTest
CB2_LinkTest: @ 800772C
	push {lr}
	bl LinkTestProcessKeyInput
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl TestBlockTransfer
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_LinkTest

	thumb_func_start LinkMain2
LinkMain2: @ 80075F0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08007600 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0
	bne _08007604
	movs r0, 0
	b _0800764C
	.align 2, 0
_08007600: .4byte gLinkOpen
_08007604:
	movs r1, 0
	ldr r5, _08007654 @ =gLinkHeldKeys
	ldr r3, _08007658 @ =gSendCmd
	movs r2, 0
_0800760C:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0800760C
	ldrh r0, [r4]
	strh r0, [r5]
	ldr r0, _0800765C @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08007648
	ldr r0, _08007660 @ =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bl ProcessRecvCmds
	ldr r0, _08007664 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	beq _08007644
	bl _call_via_r0
_08007644:
	bl CheckErrorStatus
_08007648:
	ldr r0, _0800765C @ =gLinkStatus
	ldrh r0, [r0]
_0800764C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08007654: .4byte gLinkHeldKeys
_08007658: .4byte gSendCmd
_0800765C: .4byte gLinkStatus
_08007660: .4byte 0x04000128
_08007664: .4byte gLinkCallback
	thumb_func_end LinkMain2

	thumb_func_start HandleReceiveRemoteLinkPlayer
HandleReceiveRemoteLinkPlayer: @ 80077C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r1, _080077DC @ =gLinkPlayerPending
	adds r0, r1
	strb r5, [r0]
	movs r4, 0
	adds r6, r1, 0
	b _080077E8
	.align 2, 0
_080077DC: .4byte gLinkPlayerPending
_080077E0:
	adds r0, r4, r6
	ldrb r0, [r0]
	adds r5, r0
	adds r4, 0x1
_080077E8:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080077E0
	cmp r5, 0
	bne _08007804
	ldr r1, _0800780C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r1]
	cmp r0, 0
	bne _08007804
	movs r0, 0x1
	strb r0, [r1]
_08007804:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800780C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end HandleReceiveRemoteLinkPlayer

	thumb_func_start ProcessRecvCmds
ProcessRecvCmds: @ 8007810
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r7, 0
	ldr r0, _0800786C @ =gRecvCmds
	adds r0, 0x8
	mov r10, r0
_08007824:
	ldr r0, _08007870 @ =word_3002910
	lsls r3, r7, 1
	adds r2, r3, r0
	movs r1, 0
	strh r1, [r2]
	ldr r4, _0800786C @ =gRecvCmds
	adds r1, r3, r4
	ldrh r0, [r1]
	mov r8, r3
	adds r5, r7, 0x1
	str r5, [sp]
	cmp r0, 0
	bne _08007840
	b _08007B54
_08007840:
	ldrh r1, [r1]
	ldr r0, _08007874 @ =0x00005fff
	cmp r1, r0
	bne _0800784A
	b _08007A92
_0800784A:
	cmp r1, r0
	bgt _08007898
	ldr r0, _08007878 @ =0x00004444
	cmp r1, r0
	bne _08007856
	b _08007B4C
_08007856:
	cmp r1, r0
	bgt _08007884
	ldr r0, _0800787C @ =0x00002222
	cmp r1, r0
	beq _080078EC
	ldr r0, _08007880 @ =0x00002ffe
	cmp r1, r0
	bne _08007868
	b _08007A9C
_08007868:
	b _08007B54
	.align 2, 0
_0800786C: .4byte gRecvCmds
_08007870: .4byte word_3002910
_08007874: .4byte 0x00005fff
_08007878: .4byte 0x00004444
_0800787C: .4byte 0x00002222
_08007880: .4byte 0x00002ffe
_08007884:
	ldr r0, _08007894 @ =0x00005555
	cmp r1, r0
	beq _0800793C
	adds r0, 0x11
	cmp r1, r0
	beq _0800793C
	b _08007B54
	.align 2, 0
_08007894: .4byte 0x00005555
_08007898:
	ldr r0, _080078B4 @ =0x0000aaab
	cmp r1, r0
	bne _080078A0
	b _08007AB2
_080078A0:
	cmp r1, r0
	bgt _080078C0
	ldr r0, _080078B8 @ =0x00008888
	cmp r1, r0
	beq _08007970
	ldr r0, _080078BC @ =0x0000aaaa
	cmp r1, r0
	bne _080078B2
	b _08007AAC
_080078B2:
	b _08007B54
	.align 2, 0
_080078B4: .4byte 0x0000aaab
_080078B8: .4byte 0x00008888
_080078BC: .4byte 0x0000aaaa
_080078C0:
	ldr r0, _080078D4 @ =0x0000cafe
	cmp r1, r0
	bne _080078C8
	b _08007B4C
_080078C8:
	cmp r1, r0
	bgt _080078DC
	ldr r0, _080078D8 @ =0x0000bbbb
	cmp r1, r0
	beq _08007948
	b _08007B54
	.align 2, 0
_080078D4: .4byte 0x0000cafe
_080078D8: .4byte 0x0000bbbb
_080078DC:
	ldr r0, _080078E8 @ =0x0000cccc
	cmp r1, r0
	bne _080078E4
	b _08007AC2
_080078E4:
	b _08007B54
	.align 2, 0
_080078E8: .4byte 0x0000cccc
_080078EC:
	bl InitLocalLinkPlayer
	ldr r0, _08007930 @ =localLinkPlayerBlock
	adds r2, r0, 0
	adds r2, 0x10
	ldr r1, _08007934 @ =localLinkPlayer
	ldm r1!, {r3,r4,r6}
	stm r2!, {r3,r4,r6}
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldr r1, [r1]
	str r1, [r2]
	ldr r4, _08007938 @ =0x081f4578
	adds r2, r0, 0
	adds r1, r4, 0
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldrh r3, [r1]
	strh r3, [r2]
	ldrb r1, [r1, 0x2]
	strb r1, [r2, 0x2]
	adds r1, r0, 0
	adds r1, 0x2C
	ldm r4!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldrh r2, [r4]
	strh r2, [r1]
	ldrb r2, [r4, 0x2]
	strb r2, [r1, 0x2]
	movs r1, 0x3C
	bl InitBlockSend
	b _08007B54
	.align 2, 0
_08007930: .4byte localLinkPlayerBlock
_08007934: .4byte localLinkPlayer
_08007938: .4byte 0x081f4578
_0800793C:
	ldr r1, _08007944 @ =byte_3002A68
	movs r0, 0x1
	strb r0, [r1]
	b _08007B54
	.align 2, 0
_08007944: .4byte byte_3002A68
_08007948:
	adds r1, r3, r7
	lsls r1, 2
	ldr r5, _08007968 @ =0x030003f8
	adds r1, r5
	movs r6, 0
	strh r6, [r1]
	mov r2, r10
	adds r0, r3, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	ldr r0, _0800796C @ =gRecvCmds
	adds r0, 0x10
	adds r0, r3, r0
	ldrh r0, [r0]
	strb r0, [r1, 0x9]
	b _08007B54
	.align 2, 0
_08007968: .4byte 0x030003f8
_0800796C: .4byte gRecvCmds
_08007970:
	adds r0, r3, r7
	lsls r0, 2
	ldr r5, _080079B0 @ =0x030003f8
	adds r4, r0, r5
	ldrh r1, [r4, 0x2]
	movs r0, 0x80
	lsls r0, 1
	adds r6, r5, 0
	mov r9, r6
	cmp r1, r0
	bls _080079BC
	ldr r6, _080079B4 @ =0x02000000
	movs r2, 0
	adds r5, r3, 0
	adds r3, r4, 0
	ldr r4, _080079B8 @ =gRecvCmds
_08007990:
	ldrh r1, [r3]
	lsrs r1, 1
	adds r1, r2
	lsls r1, 1
	adds r1, r6
	adds r2, 0x1
	lsls r0, r2, 3
	adds r0, r5, r0
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r2, 16
	cmp r2, 0x6
	bls _08007990
	b _080079E8
	.align 2, 0
_080079B0: .4byte 0x030003f8
_080079B4: .4byte 0x02000000
_080079B8: .4byte gRecvCmds
_080079BC:
	movs r2, 0
	ldr r0, _08007A50 @ =gBlockRecvBuffer
	mov r12, r0
	adds r5, r3, 0
	ldr r6, _08007A54 @ =gRecvCmds
	lsls r3, r7, 8
_080079C8:
	ldrh r1, [r4]
	lsrs r1, 1
	adds r1, r2
	lsls r1, 1
	adds r1, r3
	add r1, r12
	adds r2, 0x1
	lsls r0, r2, 3
	adds r0, r5, r0
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r2, 16
	lsrs r2, 16
	cmp r2, 0x6
	bls _080079C8
_080079E8:
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 2
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0xE
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1, 0x2]
	cmp r0, r1
	bcs _08007A02
	b _08007B54
_08007A02:
	ldr r0, _08007A58 @ =gLinkPlayerPending
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08007A88
	lsls r1, r7, 8
	ldr r0, _08007A50 @ =gBlockRecvBuffer
	adds r5, r1, r0
	lsls r4, r7, 3
	subs r1, r4, r7
	lsls r1, 2
	ldr r0, _08007A5C @ =gLinkPlayers
	adds r1, r0
	adds r0, r5, 0
	adds r0, 0x10
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r6, _08007A60 @ =0x081f4578
	adds r0, r5, 0
	adds r1, r6, 0
	bl strcmp
	cmp r0, 0
	bne _08007A48
	adds r0, r5, 0
	adds r0, 0x2C
	adds r1, r6, 0
	bl strcmp
	cmp r0, 0
	beq _08007A68
_08007A48:
	ldr r0, _08007A64 @ =CB2_LinkError
	bl SetMainCallback2
	b _08007A70
	.align 2, 0
_08007A50: .4byte gBlockRecvBuffer
_08007A54: .4byte gRecvCmds
_08007A58: .4byte gLinkPlayerPending
_08007A5C: .4byte gLinkPlayers
_08007A60: .4byte 0x081f4578
_08007A64: .4byte CB2_LinkError
_08007A68:
	lsls r0, r7, 24
	lsrs r0, 24
	bl HandleReceiveRemoteLinkPlayer
_08007A70:
	subs r2, r4, r7
	lsls r2, 2
	ldr r1, _08007A84 @ =0x03002988
	adds r0, r2, r1
	adds r1, r2
	ldrb r1, [r1, 0x12]
	bl ConvertInternationalString
	b _08007B54
	.align 2, 0
_08007A84: .4byte 0x03002988
_08007A88:
	lsls r0, r7, 24
	lsrs r0, 24
	bl SetBlockReceivedFlag
	b _08007B54
_08007A92:
	ldr r0, _08007A98 @ =u8_array_3002B78
	b _08007A9E
	.align 2, 0
_08007A98: .4byte u8_array_3002B78
_08007A9C:
	ldr r0, _08007AA8 @ =u8_array_3002B70
_08007A9E:
	adds r0, r7, r0
	movs r1, 0x1
	strb r1, [r0]
	b _08007B54
	.align 2, 0
_08007AA8: .4byte u8_array_3002B70
_08007AAC:
	bl sub_8007E24
	b _08007B54
_08007AB2:
	lsls r0, r7, 24
	lsrs r0, 24
	mov r4, r10
	adds r1, r3, r4
	ldrh r1, [r1]
	bl sub_80516C4
	b _08007B54
_08007AC2:
	ldr r4, _08007ADC @ =0x03002970
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08007AE4
	movs r0, 0x2
	strb r0, [r4]
	ldr r1, _08007AE0 @ =deuUnkValue1
	mov r5, r10
	adds r0, r3, r5
	ldrh r0, [r0]
	strb r0, [r1]
	b _08007B54
	.align 2, 0
_08007ADC: .4byte 0x03002970
_08007AE0: .4byte deuUnkValue1
_08007AE4:
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08007B26
	mov r6, r10
	adds r0, r3, r6
	ldrh r0, [r0]
	lsls r0, 3
	ldr r2, _08007B14 @ =0x081f4548
	adds r1, r0, r2
	ldr r1, [r1]
	ldr r3, _08007B18 @ =0x081f454c
	adds r0, r3
	ldrh r2, [r0]
	movs r0, 0
	bl SendBlock
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _08007B1C
	movs r0, 0x1
	strb r0, [r4]
	b _08007B54
	.align 2, 0
_08007B14: .4byte 0x081f4548
_08007B18: .4byte 0x081f454c
_08007B1C:
	movs r5, 0
	strb r5, [r4]
	adds r6, r7, 0x1
	str r6, [sp]
	b _08007B54
_08007B26:
	mov r1, r10
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, 3
	ldr r2, _08007B44 @ =0x081f4548
	adds r1, r0, r2
	ldr r1, [r1]
	ldr r3, _08007B48 @ =0x081f454c
	adds r0, r3
	ldrh r2, [r0]
	movs r0, 0
	bl SendBlock
	b _08007B54
	.align 2, 0
_08007B44: .4byte 0x081f4548
_08007B48: .4byte 0x081f454c
_08007B4C:
	mov r4, r10
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r2]
_08007B54:
	ldr r5, [sp]
	lsls r0, r5, 16
	lsrs r7, r0, 16
	cmp r7, 0x3
	bhi _08007B60
	b _08007824
_08007B60:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ProcessRecvCmds

	thumb_func_start BuildSendCmd
BuildSendCmd: @ 8007B70
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08007B94 @ =0x00006666
	cmp r2, r0
	beq _08007C38
	cmp r2, r0
	bgt _08007BC8
	ldr r0, _08007B98 @ =0x00004444
	cmp r2, r0
	beq _08007C24
	cmp r2, r0
	bgt _08007BA4
	ldr r0, _08007B9C @ =0x00002222
	cmp r2, r0
	beq _08007C10
	ldr r0, _08007BA0 @ =0x00002ffe
	b _08007BBA
	.align 2, 0
_08007B94: .4byte 0x00006666
_08007B98: .4byte 0x00004444
_08007B9C: .4byte 0x00002222
_08007BA0: .4byte 0x00002ffe
_08007BA4:
	ldr r0, _08007BB4 @ =0x00005566
	cmp r2, r0
	bne _08007BAC
	b _08007CA8
_08007BAC:
	cmp r2, r0
	bgt _08007BB8
	subs r0, 0x11
	b _08007BBA
	.align 2, 0
_08007BB4: .4byte 0x00005566
_08007BB8:
	ldr r0, _08007BC4 @ =0x00005fff
_08007BBA:
	cmp r2, r0
	bne _08007BC0
	b _08007CA8
_08007BC0:
	b _08007CCA
	.align 2, 0
_08007BC4: .4byte 0x00005fff
_08007BC8:
	ldr r0, _08007BDC @ =0x0000aaab
	cmp r2, r0
	beq _08007C80
	cmp r2, r0
	bgt _08007BE8
	ldr r0, _08007BE0 @ =0x00007777
	cmp r2, r0
	beq _08007C44
	ldr r0, _08007BE4 @ =0x0000aaaa
	b _08007BBA
	.align 2, 0
_08007BDC: .4byte 0x0000aaab
_08007BE0: .4byte 0x00007777
_08007BE4: .4byte 0x0000aaaa
_08007BE8:
	ldr r0, _08007BFC @ =0x0000cafe
	cmp r2, r0
	beq _08007CB4
	cmp r2, r0
	bgt _08007C04
	ldr r0, _08007C00 @ =0x0000bbbb
	cmp r2, r0
	beq _08007C64
	b _08007CCA
	.align 2, 0
_08007BFC: .4byte 0x0000cafe
_08007C00: .4byte 0x0000bbbb
_08007C04:
	ldr r0, _08007C0C @ =0x0000cccc
	cmp r2, r0
	beq _08007C94
	b _08007CCA
	.align 2, 0
_08007C0C: .4byte 0x0000cccc
_08007C10:
	ldr r0, _08007C1C @ =gSendCmd
	strh r2, [r0]
	ldr r1, _08007C20 @ =gLinkType
	ldrh r1, [r1]
	b _08007CC8
	.align 2, 0
_08007C1C: .4byte gSendCmd
_08007C20: .4byte gLinkType
_08007C24:
	ldr r0, _08007C30 @ =gSendCmd
	strh r2, [r0]
	ldr r1, _08007C34 @ =gMain
	ldrh r1, [r1, 0x2C]
	b _08007CC8
	.align 2, 0
_08007C30: .4byte gSendCmd
_08007C34: .4byte gMain
_08007C38:
	ldr r0, _08007C40 @ =gSendCmd
	movs r1, 0
	b _08007CC6
	.align 2, 0
_08007C40: .4byte gSendCmd
_08007C44:
	ldr r0, _08007C60 @ =gSendCmd
	strh r2, [r0]
	movs r1, 0
	adds r3, r0, 0
	movs r2, 0xEE
_08007C4E:
	adds r1, 0x1
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x4
	bls _08007C4E
	b _08007CCA
	.align 2, 0
_08007C60: .4byte gSendCmd
_08007C64:
	ldr r1, _08007C78 @ =gSendCmd
	strh r2, [r1]
	ldr r2, _08007C7C @ =0x030003e8
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x2]
	ldrb r0, [r2, 0x9]
	adds r0, 0x80
	strh r0, [r1, 0x4]
	b _08007CCA
	.align 2, 0
_08007C78: .4byte gSendCmd
_08007C7C: .4byte 0x030003e8
_08007C80:
	ldr r0, _08007C8C @ =gSendCmd
	strh r2, [r0]
	ldr r1, _08007C90 @ =gScriptItemId
	ldrh r1, [r1]
	b _08007CC8
	.align 2, 0
_08007C8C: .4byte gSendCmd
_08007C90: .4byte gScriptItemId
_08007C94:
	ldr r0, _08007CA0 @ =gSendCmd
	strh r2, [r0]
	ldr r1, _08007CA4 @ =gBlockRequestType
	ldrb r1, [r1]
	b _08007CC8
	.align 2, 0
_08007CA0: .4byte gSendCmd
_08007CA4: .4byte gBlockRequestType
_08007CA8:
	ldr r0, _08007CB0 @ =gSendCmd
	strh r2, [r0]
	b _08007CCA
	.align 2, 0
_08007CB0: .4byte gSendCmd
_08007CB4:
	ldr r0, _08007CD0 @ =word_3004858
	ldrh r1, [r0]
	cmp r1, 0
	beq _08007CCA
	ldr r0, _08007CD4 @ =gUnknown_3001764
	ldrb r0, [r0]
	cmp r0, 0
	bne _08007CCA
	ldr r0, _08007CD8 @ =gSendCmd
_08007CC6:
	strh r2, [r0]
_08007CC8:
	strh r1, [r0, 0x2]
_08007CCA:
	pop {r0}
	bx r0
	.align 2, 0
_08007CD0: .4byte word_3004858
_08007CD4: .4byte gUnknown_3001764
_08007CD8: .4byte gSendCmd
	thumb_func_end BuildSendCmd

	thumb_func_start sub_8007B14
sub_8007B14: @ 8007B14
	ldr r1, _08007B1C @ =gLinkCallback
	ldr r0, _08007B20 @ =sub_8007B44
	str r0, [r1]
	bx lr
	.align 2, 0
_08007B1C: .4byte gLinkCallback
_08007B20: .4byte sub_8007B44
	thumb_func_end sub_8007B14

	thumb_func_start sub_8007B24
sub_8007B24: @ 8007B24
	push {lr}
	ldr r0, _08007B34 @ =gLinkCallback
	ldr r1, [r0]
	ldr r0, _08007B38 @ =sub_8007B44
	cmp r1, r0
	beq _08007B3C
	movs r0, 0
	b _08007B3E
	.align 2, 0
_08007B34: .4byte gLinkCallback
_08007B38: .4byte sub_8007B44
_08007B3C:
	movs r0, 0x1
_08007B3E:
	pop {r1}
	bx r1
	thumb_func_end sub_8007B24

	thumb_func_start sub_8007B44
sub_8007B44: @ 8007D0C
	push {lr}
	ldr r0, _08007D20 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08007D1C
	ldr r0, _08007D24 @ =0x0000cafe
	bl BuildSendCmd
_08007D1C:
	pop {r0}
	bx r0
	.align 2, 0
_08007D20: .4byte gReceivedRemoteLinkPlayers
_08007D24: .4byte 0x0000cafe
	thumb_func_end sub_8007B44

	thumb_func_start ClearLinkCallback
ClearLinkCallback: @ 8007B60
	ldr r1, _08007B68 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007B68: .4byte gLinkCallback
	thumb_func_end ClearLinkCallback

	thumb_func_start ClearLinkCallback_2
ClearLinkCallback_2: @ 8007B6C
	ldr r1, _08007B74 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007B74: .4byte gLinkCallback
	thumb_func_end ClearLinkCallback_2

	thumb_func_start GetLinkPlayerCount
GetLinkPlayerCount: @ 8007B78
	ldr r0, _08007B84 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_08007B84: .4byte gLinkStatus
	thumb_func_end GetLinkPlayerCount

	thumb_func_start OpenLinkTimed
OpenLinkTimed: @ 8007B88
	push {lr}
	ldr r0, _08007BA0 @ =0x03000434
	movs r1, 0
	str r1, [r0]
	ldr r0, _08007BA4 @ =gLinkTimeOutCounter
	strh r1, [r0]
	bl ResetBlockSend
	bl OpenLink
	pop {r0}
	bx r0
	.align 2, 0
_08007BA0: .4byte 0x03000434
_08007BA4: .4byte gLinkTimeOutCounter
	thumb_func_end OpenLinkTimed

	thumb_func_start GetLinkPlayerDataExchangeStatusTimed
GetLinkPlayerDataExchangeStatusTimed: @ 8007BA4
	push {r4-r7,lr}
	movs r7, 0
	ldr r0, _08007BCC @ =gReceivedRemoteLinkPlayers
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08007C20
	bl GetLinkPlayerCount
	lsls r0, 24
	cmp r0, 0
	bne _08007BC2
	ldr r0, _08007BD0 @ =gLinkErrorOccurred
	strb r4, [r0]
	bl CloseLink
_08007BC2:
	movs r6, 0
	ldr r4, _08007BD4 @ =gLinkPlayers
	movs r5, 0
	b _08007BEC
	.align 2, 0
_08007BCC: .4byte gReceivedRemoteLinkPlayers
_08007BD0: .4byte gLinkErrorOccurred
_08007BD4: .4byte gLinkPlayers
_08007BD8:
	adds r0, r4, 0
	adds r0, 0x14
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	bne _08007BE8
	adds r7, 0x1
_08007BE8:
	adds r5, 0x1C
	adds r6, 0x1
_08007BEC:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	blt _08007BD8
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r7, r0
	bne _08007C10
	ldr r1, _08007C0C @ =0x03000434
	movs r0, 0x1
	b _08007C14
	.align 2, 0
_08007C0C: .4byte 0x03000434
_08007C10:
	ldr r1, _08007C1C @ =0x03000434
	movs r0, 0x3
_08007C14:
	str r0, [r1]
	adds r2, r1, 0
	b _08007C38
	.align 2, 0
_08007C1C: .4byte 0x03000434
_08007C20:
	ldr r0, _08007C40 @ =gLinkTimeOutCounter
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 18
	ldr r2, _08007C44 @ =0x03000434
	cmp r1, r0
	bls _08007C38
	movs r0, 0x2
	str r0, [r2]
_08007C38:
	ldrb r0, [r2]
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007C40: .4byte gLinkTimeOutCounter
_08007C44: .4byte 0x03000434
	thumb_func_end GetLinkPlayerDataExchangeStatusTimed

	thumb_func_start IsLinkPlayerDataExchangeComplete
IsLinkPlayerDataExchangeComplete: @ 8007C48
	push {r4-r6,lr}
	movs r6, 0
	movs r4, 0
	ldr r5, _08007C54 @ =gLinkPlayers
	b _08007C78
	.align 2, 0
_08007C54: .4byte gLinkPlayers
_08007C58:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x14
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r5, 0x14]
	cmp r1, r0
	bne _08007C72
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08007C72:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08007C78:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08007C58
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _08007C9C
	movs r2, 0x1
	ldr r0, _08007C98 @ =0x03000434
	str r2, [r0]
	b _08007CA4
	.align 2, 0
_08007C98: .4byte 0x03000434
_08007C9C:
	movs r2, 0
	ldr r1, _08007CAC @ =0x03000434
	movs r0, 0x3
	str r0, [r1]
_08007CA4:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08007CAC: .4byte 0x03000434
	thumb_func_end IsLinkPlayerDataExchangeComplete

	thumb_func_start GetLinkPlayerTrainerId
GetLinkPlayerTrainerId: @ 8007CB0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08007CC4 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, 0x4
	adds r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08007CC4: .4byte gLinkPlayers
	thumb_func_end GetLinkPlayerTrainerId

	thumb_func_start ResetLinkPlayers
ResetLinkPlayers: @ 8007CC8
	push {r4,r5,lr}
	ldr r5, _08007CE8 @ =gLinkPlayers
	movs r4, 0x3
_08007CCE:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1C
	bl memset
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _08007CCE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007CE8: .4byte gLinkPlayers
	thumb_func_end ResetLinkPlayers

	thumb_func_start ResetBlockSend
ResetBlockSend: @ 8007EB8
	ldr r1, _08007EC8 @ =0x030003e8
	movs r0, 0
	strb r0, [r1, 0x8]
	strh r0, [r1]
	strh r0, [r1, 0x2]
	str r0, [r1, 0x4]
	bx lr
	.align 2, 0
_08007EC8: .4byte 0x030003e8
	thumb_func_end ResetBlockSend

	thumb_func_start InitBlockSend
InitBlockSend: @ 8007ECC
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r4, _08007EE0 @ =0x030003e8
	ldrb r5, [r4, 0x8]
	cmp r5, 0
	beq _08007EE4
	movs r0, 0
	b _08007F22
	.align 2, 0
_08007EE0: .4byte 0x030003e8
_08007EE4:
	bl GetMultiplayerId
	strb r0, [r4, 0x9]
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strh r6, [r4, 0x2]
	strh r5, [r4]
	adds r0, 0xFF
	cmp r6, r0
	bls _08007EFC
	str r7, [r4, 0x4]
	b _08007F0E
_08007EFC:
	ldr r5, _08007F28 @ =gBlockSendBuffer
	cmp r7, r5
	beq _08007F0C
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl memcpy
_08007F0C:
	str r5, [r4, 0x4]
_08007F0E:
	ldr r0, _08007F2C @ =0x0000bbbb
	bl BuildSendCmd
	ldr r1, _08007F30 @ =gLinkCallback
	ldr r0, _08007F34 @ =LinkCB_BlockSendBegin
	str r0, [r1]
	ldr r1, _08007F38 @ =0x03000428
	movs r0, 0
	str r0, [r1]
	movs r0, 0x1
_08007F22:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007F28: .4byte gBlockSendBuffer
_08007F2C: .4byte 0x0000bbbb
_08007F30: .4byte gLinkCallback
_08007F34: .4byte LinkCB_BlockSendBegin
_08007F38: .4byte 0x03000428
	thumb_func_end InitBlockSend

	thumb_func_start LinkCB_BlockSendBegin
LinkCB_BlockSendBegin: @ 8007F3C
	push {lr}
	ldr r1, _08007F54 @ =0x03000428
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bls _08007F50
	ldr r1, _08007F58 @ =gLinkCallback
	ldr r0, _08007F5C @ =LinkCB_BlockSend
	str r0, [r1]
_08007F50:
	pop {r0}
	bx r0
	.align 2, 0
_08007F54: .4byte 0x03000428
_08007F58: .4byte gLinkCallback
_08007F5C: .4byte LinkCB_BlockSend
	thumb_func_end LinkCB_BlockSendBegin

	thumb_func_start LinkCB_BlockSend
LinkCB_BlockSend: @ 8007F60
	push {r4-r6,lr}
	ldr r0, _08007FB0 @ =0x030003e8
	ldr r5, [r0, 0x4]
	ldr r2, _08007FB4 @ =gSendCmd
	ldr r1, _08007FB8 @ =0x00008888
	strh r1, [r2]
	movs r3, 0
	adds r4, r0, 0
	adds r6, r4, 0
	adds r2, 0x2
_08007F74:
	lsls r0, r3, 1
	ldrh r1, [r6]
	adds r0, r1
	adds r0, r5
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	ldrb r0, [r0]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x6
	ble _08007F74
	ldrh r0, [r4]
	adds r0, 0xE
	strh r0, [r4]
	ldrh r1, [r4, 0x2]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _08007FA8
	movs r0, 0
	strb r0, [r4, 0x8]
	ldr r1, _08007FBC @ =gLinkCallback
	ldr r0, _08007FC0 @ =LinkCB_BlockSendEnd
	str r0, [r1]
_08007FA8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007FB0: .4byte 0x030003e8
_08007FB4: .4byte gSendCmd
_08007FB8: .4byte 0x00008888
_08007FBC: .4byte gLinkCallback
_08007FC0: .4byte LinkCB_BlockSendEnd
	thumb_func_end LinkCB_BlockSend

	thumb_func_start LinkCB_BlockSendEnd
LinkCB_BlockSendEnd: @ 8007FC4
	ldr r1, _08007FCC @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007FCC: .4byte gLinkCallback
	thumb_func_end LinkCB_BlockSendEnd

	thumb_func_start sub_8007E04
sub_8007E04: @ 8007FD0
	push {lr}
	bl GetMultiplayerId
	ldr r0, _08007FE8 @ =0x00004444
	bl BuildSendCmd
	ldr r1, _08007FEC @ =dword_20238BC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08007FE8: .4byte 0x00004444
_08007FEC: .4byte dword_20238BC
	thumb_func_end sub_8007E04

	thumb_func_start sub_8007E24
sub_8007E24: @ 8007E24
	ldr r1, _08007E34 @ =dword_20238BC
	movs r0, 0
	str r0, [r1]
	ldr r1, _08007E38 @ =gLinkCallback
	ldr r0, _08007E3C @ =sub_8007E04
	str r0, [r1]
	bx lr
	.align 2, 0
_08007E34: .4byte dword_20238BC
_08007E38: .4byte gLinkCallback
_08007E3C: .4byte sub_8007E04
	thumb_func_end sub_8007E24

	thumb_func_start sub_8007E40
sub_8007E40: @ 8007E40
	ldr r0, _08007E48 @ =dword_20238BC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08007E48: .4byte dword_20238BC
	thumb_func_end sub_8007E40

	thumb_func_start sub_8007E4C
sub_8007E4C: @ 8007E4C
	push {lr}
	ldr r0, _08007E58 @ =0x0000aaaa
	bl BuildSendCmd
	pop {r0}
	bx r0
	.align 2, 0
_08007E58: .4byte 0x0000aaaa
	thumb_func_end sub_8007E4C

	thumb_func_start GetMultiplayerId
GetMultiplayerId: @ 8007E5C
	ldr r0, _08007E68 @ =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bx lr
	.align 2, 0
_08007E68: .4byte 0x04000128
	thumb_func_end GetMultiplayerId

	thumb_func_start bitmask_all_link_players_but_self
bitmask_all_link_players_but_self: @ 8007E6C
	push {lr}
	bl GetMultiplayerId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0xF
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end bitmask_all_link_players_but_self

	thumb_func_start SendBlock
SendBlock: @ 8007E88
	push {lr}
	adds r0, r1, 0
	lsls r1, r2, 16
	lsrs r1, 16
	bl InitBlockSend
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end SendBlock

	thumb_func_start sub_8007E9C
sub_8007E9C: @ 8007E9C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08007EB0 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	beq _08007EB4
	movs r0, 0
	b _08007EC0
	.align 2, 0
_08007EB0: .4byte gLinkCallback
_08007EB4:
	ldr r0, _08007EC4 @ =gBlockRequestType
	strb r1, [r0]
	ldr r0, _08007EC8 @ =0x0000cccc
	bl BuildSendCmd
	movs r0, 0x1
_08007EC0:
	pop {r1}
	bx r1
	.align 2, 0
_08007EC4: .4byte gBlockRequestType
_08007EC8: .4byte 0x0000cccc
	thumb_func_end sub_8007E9C

	thumb_func_start sub_8007ECC
sub_8007ECC: @ 8007ECC
	push {lr}
	movs r1, 0
	ldr r0, _08007EE0 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	bne _08007EDA
	movs r1, 0x1
_08007EDA:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08007EE0: .4byte gLinkCallback
	thumb_func_end sub_8007ECC

	thumb_func_start GetBlockReceivedStatus
GetBlockReceivedStatus: @ 8007EE4
	ldr r2, _08007F00 @ =gBlockReceived
	ldrb r0, [r2, 0x3]
	lsls r0, 3
	ldrb r1, [r2, 0x2]
	lsls r1, 2
	orrs r0, r1
	ldrb r1, [r2, 0x1]
	lsls r1, 1
	orrs r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08007F00: .4byte gBlockReceived
	thumb_func_end GetBlockReceivedStatus

	thumb_func_start SetBlockReceivedFlag
SetBlockReceivedFlag: @ 80080D0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080080E0 @ =gBlockReceived
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bx lr
	.align 2, 0
_080080E0: .4byte gBlockReceived
	thumb_func_end SetBlockReceivedFlag

	thumb_func_start ResetBlockReceivedFlags
ResetBlockReceivedFlags: @ 8007F18
	push {lr}
	ldr r1, _08007F2C @ =gBlockReceived
	movs r2, 0
	adds r0, r1, 0x3
_08007F20:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08007F20
	pop {r0}
	bx r0
	.align 2, 0
_08007F2C: .4byte gBlockReceived
	thumb_func_end ResetBlockReceivedFlags

	thumb_func_start ResetBlockReceivedFlag
ResetBlockReceivedFlag: @ 8007F30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08007F48 @ =gBlockReceived
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08007F44
	movs r0, 0
	strb r0, [r1]
_08007F44:
	pop {r0}
	bx r0
	.align 2, 0
_08007F48: .4byte gBlockReceived
	thumb_func_end ResetBlockReceivedFlag

	thumb_func_start sub_8007F4C
sub_8007F4C: @ 8007F4C
	push {lr}
	ldr r0, _08007F6C @ =gLinkStatus
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08007F68
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bls _08007F68
	ldr r1, _08007F70 @ =gShouldAdvanceLinkState
	movs r0, 0x1
	strb r0, [r1]
_08007F68:
	pop {r0}
	bx r0
	.align 2, 0
_08007F6C: .4byte gLinkStatus
_08007F70: .4byte gShouldAdvanceLinkState
	thumb_func_end sub_8007F4C

	thumb_func_start LinkTestCalcBlockChecksum
LinkTestCalcBlockChecksum: @ 8008140
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r3, 0
	movs r2, 0
	lsrs r1, 17
	cmp r3, r1
	bcs _08008166
_08008150:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _08008150
_08008166:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end LinkTestCalcBlockChecksum

	thumb_func_start PrintHexDigit
PrintHexDigit: @ 8008170
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r4, _080081A0 @ =gLinkTestBGInfo
	ldr r3, [r4]
	lsls r3, 11
	movs r5, 0xC0
	lsls r5, 19
	adds r3, r5
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r3
	ldr r1, [r4, 0x4]
	lsls r1, 12
	adds r0, 0x1
	orrs r1, r0
	strh r1, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080081A0: .4byte gLinkTestBGInfo
	thumb_func_end PrintHexDigit

	thumb_func_start PrintHex
PrintHex: @ 80081A4
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	cmp r4, r3
	bge _080081D0
	movs r2, 0xF
_080081BE:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	lsrs r5, 4
	adds r4, 0x1
	cmp r4, r3
	blt _080081BE
_080081D0:
	subs r4, r3, 0x1
	cmp r4, 0
	blt _080081F0
_080081D6:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r1, r6, 0
	adds r2, r7, 0
	bl PrintHexDigit
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	subs r4, 0x1
	cmp r4, 0
	bge _080081D6
_080081F0:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PrintHex

	thumb_func_start LinkCB_RequestPlayerDataExchange
LinkCB_RequestPlayerDataExchange: @ 80081F8
	push {lr}
	ldr r0, _08008218 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800820C
	ldr r0, _0800821C @ =0x00002222
	bl BuildSendCmd
_0800820C:
	ldr r1, _08008220 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08008218: .4byte gLinkStatus
_0800821C: .4byte 0x00002222
_08008220: .4byte gLinkCallback
	thumb_func_end LinkCB_RequestPlayerDataExchange

	thumb_func_start Task_PrintTestData
Task_PrintTestData: @ 8008224
	push {r4-r6,lr}
	ldr r0, _08008330 @ =gShouldAdvanceLinkState
	ldrb r0, [r0]
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl PrintHex
	ldr r4, _08008334 @ =gLinkStatus
	ldr r0, [r4]
	movs r1, 0xF
	movs r2, 0x1
	movs r3, 0x8
	bl PrintHex
	ldr r0, _08008338 @ =gLink
	ldrb r0, [r0, 0x1]
	movs r1, 0x2
	movs r2, 0xA
	movs r3, 0x2
	bl PrintHex
	ldr r0, [r4]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	movs r1, 0xF
	movs r2, 0xA
	movs r3, 0x2
	bl PrintHex
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0xC
	movs r3, 0x2
	bl PrintHex
	ldr r0, _0800833C @ =gLastSendQueueCount
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x1
	movs r3, 0x2
	bl PrintHex
	ldr r0, _08008340 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	movs r1, 0x19
	movs r2, 0x2
	movs r3, 0x2
	bl PrintHex
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xF
	movs r2, 0x5
	movs r3, 0x2
	bl PrintHex
	ldr r0, _08008344 @ =gLinkDebugValue1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xC
	movs r3, 0x8
	bl PrintHex
	ldr r0, _08008348 @ =gLinkDebugValue2
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	movs r3, 0x8
	bl PrintHex
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x5
	movs r3, 0x1
	bl PrintHex
	bl IsSioMultiMaster
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x6
	movs r3, 0x1
	bl PrintHex
	bl IsLinkConnectionEstablished
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x7
	movs r3, 0x1
	bl PrintHex
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x19
	movs r2, 0x8
	movs r3, 0x1
	bl PrintHex
	movs r6, 0
	movs r5, 0x80
	lsls r5, 19
	ldr r4, _0800834C @ =gLinkTestBlockChecksums
_0800830E:
	ldrh r0, [r4]
	lsrs r2, r5, 24
	movs r1, 0xA
	movs r3, 0x4
	bl PrintHex
	movs r0, 0x80
	lsls r0, 17
	adds r5, r0
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0800830E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008330: .4byte gShouldAdvanceLinkState
_08008334: .4byte gLinkStatus
_08008338: .4byte gLink
_0800833C: .4byte gLastSendQueueCount
_08008340: .4byte gLastRecvQueueCount
_08008344: .4byte gLinkDebugValue1
_08008348: .4byte gLinkDebugValue2
_0800834C: .4byte gLinkTestBlockChecksums
	thumb_func_end Task_PrintTestData

	thumb_func_start SetLinkDebugValues
SetLinkDebugValues: @ 8008184
	ldr r2, _08008190 @ =gLinkDebugValue1
	str r0, [r2]
	ldr r0, _08008194 @ =gLinkDebugValue2
	str r1, [r0]
	bx lr
	.align 2, 0
_08008190: .4byte gLinkDebugValue1
_08008194: .4byte gLinkDebugValue2
	thumb_func_end SetLinkDebugValues

	thumb_func_start sub_8008198
sub_8008198: @ 8008198
	push {r4,lr}
	movs r1, 0
	movs r2, 0
	ldr r0, _080081C4 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r1, r0
	bge _080081BA
	movs r4, 0x1
	adds r3, r0, 0
_080081AA:
	adds r0, r4, 0
	lsls r0, r2
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r2, 0x1
	cmp r2, r3
	blt _080081AA
_080081BA:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080081C4: .4byte gSavedLinkPlayerCount
	thumb_func_end sub_8008198

	thumb_func_start sub_80081C8
sub_80081C8: @ 80081C8
	push {r4-r7,lr}
	ldr r1, _080081FC @ =gSavedLinkPlayerCount
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r1, _08008200 @ =gSavedMultiplayerId
	strb r0, [r1]
	ldr r4, _08008204 @ =gLinkPlayers
	ldr r3, _08008208 @ =gSavedLinkPlayers
	movs r2, 0x3
_080081DC:
	adds r0, r3, 0
	adds r1, r4, 0
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldm r1!, {r5-r7}
	stm r0!, {r5-r7}
	ldr r1, [r1]
	str r1, [r0]
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _080081DC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080081FC: .4byte gSavedLinkPlayerCount
_08008200: .4byte gSavedMultiplayerId
_08008204: .4byte gLinkPlayers
_08008208: .4byte gSavedLinkPlayers
	thumb_func_end sub_80081C8

	thumb_func_start sub_800820C
sub_800820C: @ 800820C
	ldr r0, _08008214 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008214: .4byte gSavedLinkPlayerCount
	thumb_func_end sub_800820C

	thumb_func_start sub_8008218
sub_8008218: @ 8008218
	ldr r0, _08008220 @ =gSavedMultiplayerId
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008220: .4byte gSavedMultiplayerId
	thumb_func_end sub_8008218

	thumb_func_start sub_8008224
sub_8008224: @ 8008224
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _08008258 @ =gSavedLinkPlayerCount
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r5, r2
	bge _0800824E
	ldr r1, _0800825C @ =gLinkPlayers
	ldr r0, _08008260 @ =gSavedLinkPlayers
	adds r4, r0, 0x4
	adds r3, r1, 0x4
_0800823A:
	ldr r1, [r3]
	ldr r0, [r4]
	cmp r1, r0
	bne _08008244
	adds r5, 0x1
_08008244:
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bne _0800823A
_0800824E:
	ldrb r6, [r6]
	cmp r5, r6
	beq _08008264
	movs r0, 0
	b _08008266
	.align 2, 0
_08008258: .4byte gSavedLinkPlayerCount
_0800825C: .4byte gLinkPlayers
_08008260: .4byte gSavedLinkPlayers
_08008264:
	movs r0, 0x1
_08008266:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8008224

	thumb_func_start sub_800826C
sub_800826C: @ 800826C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, _080082D8 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080082CC
	ldr r6, _080082DC @ =gSavedLinkPlayers
	ldr r5, _080082E0 @ =gLinkPlayers
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
_0800828A:
	lsls r0, r4, 3
	subs r0, r4
	lsls r2, r0, 2
	adds r1, r6, 0x4
	adds r1, r2, r1
	adds r0, r5, 0x4
	adds r0, r2, r0
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _080082AE
	mov r1, r8
	adds r0, r2, r1
	adds r1, r2, r7
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _080082BE
_080082AE:
	ldr r1, _080082E4 @ =gLinkErrorOccurred
	movs r0, 0x1
	strb r0, [r1]
	bl CloseLink
	ldr r0, _080082E8 @ =CB2_LinkError
	bl SetMainCallback2
_080082BE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080082D8 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0800828A
_080082CC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080082D8: .4byte gSavedLinkPlayerCount
_080082DC: .4byte gSavedLinkPlayers
_080082E0: .4byte gLinkPlayers
_080082E4: .4byte gLinkErrorOccurred
_080082E8: .4byte CB2_LinkError
	thumb_func_end sub_800826C

	thumb_func_start sub_80082EC
sub_80082EC: @ 80082EC
	ldr r0, _080082F8 @ =gSavedLinkPlayerCount
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080082FC @ =gSavedMultiplayerId
	strb r1, [r0]
	bx lr
	.align 2, 0
_080082F8: .4byte gSavedLinkPlayerCount
_080082FC: .4byte gSavedMultiplayerId
	thumb_func_end sub_80082EC

	thumb_func_start GetLinkPlayerCount_2
GetLinkPlayerCount_2: @ 8008300
	ldr r0, _0800830C @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_0800830C: .4byte gLinkStatus
	thumb_func_end GetLinkPlayerCount_2

	thumb_func_start IsLinkMaster
IsLinkMaster: @ 8008310
	ldr r0, _0800831C @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0800831C: .4byte gLinkStatus
	thumb_func_end IsLinkMaster

	thumb_func_start GetDummy2
GetDummy2: @ 8008320
	ldr r0, _08008328 @ =0x03000430
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008328: .4byte 0x03000430
	thumb_func_end GetDummy2

	thumb_func_start sub_800832C
sub_800832C: @ 800832C
	push {lr}
	ldr r2, _08008344 @ =gLinkCallback
	ldr r1, [r2]
	cmp r1, 0
	bne _0800833E
	ldr r0, _08008348 @ =sub_8008350
	str r0, [r2]
	ldr r0, _0800834C @ =gLinkDummyBool
	strb r1, [r0]
_0800833E:
	pop {r0}
	bx r0
	.align 2, 0
_08008344: .4byte gLinkCallback
_08008348: .4byte sub_8008350
_0800834C: .4byte gLinkDummyBool
	thumb_func_end sub_800832C

	thumb_func_start sub_8008350
sub_8008350: @ 800851C
	push {lr}
	ldr r0, _08008538 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	cmp r0, 0
	bne _08008532
	ldr r0, _0800853C @ =0x00005fff
	bl BuildSendCmd
	ldr r1, _08008540 @ =gLinkCallback
	ldr r0, _08008544 @ =sub_800837C
	str r0, [r1]
_08008532:
	pop {r0}
	bx r0
	.align 2, 0
_08008538: .4byte gLastRecvQueueCount
_0800853C: .4byte 0x00005fff
_08008540: .4byte gLinkCallback
_08008544: .4byte sub_800837C
	thumb_func_end sub_8008350

	thumb_func_start sub_800837C
sub_800837C: @ 8008548
	push {r4,lr}
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	movs r1, 0
	cmp r3, r2
	bge _0800856C
	ldr r4, _08008594 @ =u8_array_3002B78
_0800855C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08008566
	adds r3, 0x1
_08008566:
	adds r1, 0x1
	cmp r1, r2
	blt _0800855C
_0800856C:
	cmp r3, r2
	bne _0800858E
	ldr r2, _08008598 @ =gUnknown_020239F8
	ldrh r1, [r2]
	ldr r0, _0800859C @ =0x0000ffdf
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080085A0 @ =gLinkVSyncDisabled
	movs r4, 0x1
	strb r4, [r0]
	bl CloseLink
	ldr r1, _080085A4 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	ldr r0, _080085A8 @ =gLinkDummyBool
	strb r4, [r0]
_0800858E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008594: .4byte u8_array_3002B78
_08008598: .4byte gUnknown_020239F8
_0800859C: .4byte 0x0000ffdf
_080085A0: .4byte gLinkVSyncDisabled
_080085A4: .4byte gLinkCallback
_080085A8: .4byte gLinkDummyBool
	thumb_func_end sub_800837C

	thumb_func_start sub_80083E0
sub_80083E0: @ 80085AC
	push {r4,r5,lr}
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	movs r2, 0
	cmp r1, r3
	bge _080085DA
	ldr r5, _08008604 @ =u8_array_3002B78
	ldr r4, _08008608 @ =gLinkPlayers
_080085C2:
	ldrh r0, [r4, 0x1A]
	cmp r0, 0x1
	beq _080085D0
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _080085D2
_080085D0:
	adds r1, 0x1
_080085D2:
	adds r4, 0x1C
	adds r2, 0x1
	cmp r2, r3
	blt _080085C2
_080085DA:
	cmp r1, r3
	bne _080085FC
	ldr r2, _0800860C @ =gUnknown_020239F8
	ldrh r1, [r2]
	ldr r0, _08008610 @ =0x0000ffdf
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08008614 @ =gLinkVSyncDisabled
	movs r4, 0x1
	strb r4, [r0]
	bl CloseLink
	ldr r1, _08008618 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	ldr r0, _0800861C @ =gLinkDummyBool
	strb r4, [r0]
_080085FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008604: .4byte u8_array_3002B78
_08008608: .4byte gLinkPlayers
_0800860C: .4byte gUnknown_020239F8
_08008610: .4byte 0x0000ffdf
_08008614: .4byte gLinkVSyncDisabled
_08008618: .4byte gLinkCallback
_0800861C: .4byte gLinkDummyBool
	thumb_func_end sub_80083E0

	thumb_func_start sub_8008454
sub_8008454: @ 8008620
	push {lr}
	ldr r0, _0800863C @ =gLastRecvQueueCount
	ldrb r0, [r0]
	cmp r0, 0
	bne _08008636
	ldr r0, _08008640 @ =0x00005fff
	bl BuildSendCmd
	ldr r1, _08008644 @ =gLinkCallback
	ldr r0, _08008648 @ =sub_80083E0
	str r0, [r1]
_08008636:
	pop {r0}
	bx r0
	.align 2, 0
_0800863C: .4byte gLastRecvQueueCount
_08008640: .4byte 0x00005fff
_08008644: .4byte gLinkCallback
_08008648: .4byte sub_80083E0
	thumb_func_end sub_8008454

	thumb_func_start sub_8008480
sub_8008480: @ 8008480
	push {lr}
	ldr r2, _08008498 @ =gLinkCallback
	ldr r1, [r2]
	cmp r1, 0
	bne _08008492
	ldr r0, _0800849C @ =sub_8008454
	str r0, [r2]
	ldr r0, _080084A0 @ =gLinkDummyBool
	strb r1, [r0]
_08008492:
	pop {r0}
	bx r0
	.align 2, 0
_08008498: .4byte gLinkCallback
_0800849C: .4byte sub_8008454
_080084A0: .4byte gLinkDummyBool
	thumb_func_end sub_8008480

	thumb_func_start sub_80084A4
sub_80084A4: @ 80084A4
	push {lr}
	ldr r1, _080084BC @ =gLinkCallback
	ldr r0, [r1]
	cmp r0, 0
	bne _080084B2
	ldr r0, _080084C0 @ =sub_80084C8
	str r0, [r1]
_080084B2:
	ldr r1, _080084C4 @ =gLinkDummyBool
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080084BC: .4byte gLinkCallback
_080084C0: .4byte sub_80084C8
_080084C4: .4byte gLinkDummyBool
	thumb_func_end sub_80084A4

	thumb_func_start sub_80084C8
sub_80084C8: @ 8008694
	push {lr}
	ldr r0, _080086B0 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	cmp r0, 0
	bne _080086AA
	ldr r0, _080086B4 @ =0x00002ffe
	bl BuildSendCmd
	ldr r1, _080086B8 @ =gLinkCallback
	ldr r0, _080086BC @ =sub_80084F4
	str r0, [r1]
_080086AA:
	pop {r0}
	bx r0
	.align 2, 0
_080086B0: .4byte gLastRecvQueueCount
_080086B4: .4byte 0x00002ffe
_080086B8: .4byte gLinkCallback
_080086BC: .4byte sub_80084F4
	thumb_func_end sub_80084C8

	thumb_func_start sub_80084F4
sub_80084F4: @ 80086C0
	push {r4,lr}
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	cmp r1, r2
	bcs _080086EA
	ldr r3, _08008710 @ =u8_array_3002B70
	ldrb r0, [r3]
	cmp r0, 0
	beq _080086EA
_080086D8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _080086EA
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080086D8
_080086EA:
	cmp r1, r2
	bne _08008708
	movs r1, 0
	ldr r4, _08008714 @ =gLinkCallback
	ldr r3, _08008710 @ =u8_array_3002B70
	movs r2, 0
_080086F6:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080086F6
	movs r0, 0
	str r0, [r4]
_08008708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008710: .4byte u8_array_3002B70
_08008714: .4byte gLinkCallback
	thumb_func_end sub_80084F4

	thumb_func_start CheckErrorStatus
CheckErrorStatus: @ 8008718
	push {lr}
	ldr r0, _08008760 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800875C
	ldr r0, _08008764 @ =gLinkStatus
	ldr r1, [r0]
	movs r0, 0xFE
	lsls r0, 11
	ands r0, r1
	cmp r0, 0
	beq _0800875C
	ldr r0, _08008768 @ =gSuppressLinkErrorMessage
	ldrb r0, [r0]
	cmp r0, 0
	bne _08008752
	ldr r0, _0800876C @ =0x03000438
	str r1, [r0]
	ldr r1, _08008770 @ =0x0300043c
	ldr r0, _08008774 @ =gLastRecvQueueCount
	ldrb r0, [r0]
	str r0, [r1]
	ldr r1, _08008778 @ =0x03000440
	ldr r0, _0800877C @ =gLastSendQueueCount
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _08008780 @ =CB2_LinkError
	bl SetMainCallback2
_08008752:
	ldr r1, _08008784 @ =gLinkErrorOccurred
	movs r0, 0x1
	strb r0, [r1]
	bl CloseLink
_0800875C:
	pop {r0}
	bx r0
	.align 2, 0
_08008760: .4byte gLinkOpen
_08008764: .4byte gLinkStatus
_08008768: .4byte gSuppressLinkErrorMessage
_0800876C: .4byte 0x03000438
_08008770: .4byte 0x0300043c
_08008774: .4byte gLastRecvQueueCount
_08008778: .4byte 0x03000440
_0800877C: .4byte gLastSendQueueCount
_08008780: .4byte CB2_LinkError
_08008784: .4byte gLinkErrorOccurred
	thumb_func_end CheckErrorStatus

	thumb_func_start CB2_LinkError
CB2_LinkError: @ 80085BC
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFadeControl
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl ResetTasks
	ldr r0, _08008638 @ =VBlankCB_LinkTest
	bl SetVBlankCallback
	ldr r4, _0800863C @ =gWindowConfig_81E7198
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r0, _08008640 @ =0x04000052
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x40
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	movs r2, 0x80
	lsls r2, 19
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _08008644 @ =gUnknown_3001BB4
	strb r1, [r0]
	ldr r0, _08008648 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _0800864C @ =CB2_PrintErrorMessage
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008638: .4byte VBlankCB_LinkTest
_0800863C: .4byte gWindowConfig_81E7198
_08008640: .4byte 0x04000052
_08008644: .4byte gUnknown_3001BB4
_08008648: .4byte Task_DestroySelf
_0800864C: .4byte CB2_PrintErrorMessage
	thumb_func_end CB2_LinkError

	thumb_func_start CB2_PrintErrorMessage
CB2_PrintErrorMessage: @ 800881C
	push {lr}
	sub sp, 0x40
	ldr r0, _08008838 @ =gMain
	ldr r1, _0800883C @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1E
	beq _0800885C
	cmp r0, 0x1E
	bgt _08008840
	cmp r0, 0
	beq _0800884A
	b _0800886A
	.align 2, 0
_08008838: .4byte gMain
_0800883C: .4byte 0x0000043c
_08008840:
	cmp r0, 0x3C
	beq _0800885C
	cmp r0, 0x5A
	beq _08008864
	b _0800886A
_0800884A:
	ldr r0, _08008858 @ =gMultiText_LinkError
	movs r1, 0x14
	movs r2, 0x38
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	b _0800886A
	.align 2, 0
_08008858: .4byte gMultiText_LinkError
_0800885C:
	movs r0, 0x16
	bl PlaySE
	b _0800886A
_08008864:
	movs r0, 0x16
	bl PlaySE
_0800886A:
	ldr r0, _08008880 @ =gMain
	ldr r2, _08008884 @ =0x0000043c
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xC8
	beq _0800887A
	adds r0, 0x1
	strb r0, [r1]
_0800887A:
	add sp, 0x40
	pop {r0}
	bx r0
	.align 2, 0
_08008880: .4byte gMain
_08008884: .4byte 0x0000043c
	thumb_func_end CB2_PrintErrorMessage

	thumb_func_start GetSioMultiSI
GetSioMultiSI: @ 80086BC
	ldr r0, _080086C8 @ =0x04000128
	ldrh r0, [r0]
	lsrs r0, 2
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080086C8: .4byte 0x04000128
	thumb_func_end GetSioMultiSI

	thumb_func_start IsSioMultiMaster
IsSioMultiMaster: @ 8008898
	push {lr}
	movs r3, 0
	ldr r2, _080088BC @ =0x04000128
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080088B4
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080088B4
	movs r3, 0x1
_080088B4:
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_080088BC: .4byte 0x04000128
	thumb_func_end IsSioMultiMaster

	thumb_func_start IsLinkConnectionEstablished
IsLinkConnectionEstablished: @ 80086F4
	ldr r0, _08008700 @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 6
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08008700: .4byte gLinkStatus
	thumb_func_end IsLinkConnectionEstablished

	thumb_func_start SetSuppressLinkErrorMessage
SetSuppressLinkErrorMessage: @ 8008704
	ldr r1, _0800870C @ =gSuppressLinkErrorMessage
	strb r0, [r1]
	bx lr
	.align 2, 0
_0800870C: .4byte gSuppressLinkErrorMessage
	thumb_func_end SetSuppressLinkErrorMessage

	thumb_func_start HasLinkErrorOccurred
HasLinkErrorOccurred: @ 8008710
	ldr r0, _08008718 @ =gLinkErrorOccurred
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08008718: .4byte gLinkErrorOccurred
	thumb_func_end HasLinkErrorOccurred

	thumb_func_start DisableSerial
DisableSerial: @ 80088E8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08008928 @ =gLinkSavedIme
	ldr r2, _0800892C @ =0x04000208
	ldrh r5, [r2]
	strh r5, [r0]
	movs r4, 0
	strh r4, [r2]
	ldr r3, _08008930 @ =0x04000200
	ldrh r1, [r3]
	ldr r0, _08008934 @ =0x0000ff3f
	ands r0, r1
	strh r0, [r3]
	strh r5, [r2]
	ldr r0, _08008938 @ =0x04000128
	strh r4, [r0]
	subs r0, 0x1A
	strh r4, [r0]
	ldr r1, _0800893C @ =0x04000202
	movs r0, 0xC0
	strh r0, [r1]
	movs r0, 0
	str r0, [sp]
	ldr r1, _08008940 @ =gLink
	ldr r2, _08008944 @ =0x050003f0
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008928: .4byte gLinkSavedIme
_0800892C: .4byte 0x04000208
_08008930: .4byte 0x04000200
_08008934: .4byte 0x0000ff3f
_08008938: .4byte 0x04000128
_0800893C: .4byte 0x04000202
_08008940: .4byte gLink
_08008944: .4byte 0x050003f0
	thumb_func_end DisableSerial

	thumb_func_start EnableSerial
EnableSerial: @ 8008948
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r6, _080089C0 @ =gLinkSavedIme
	ldr r3, _080089C4 @ =0x04000208
	ldrh r2, [r3]
	movs r4, 0
	strh r4, [r3]
	ldr r5, _080089C8 @ =0x04000200
	ldrh r1, [r5]
	ldr r0, _080089CC @ =0x0000ff3f
	ands r0, r1
	strh r0, [r5]
	strh r2, [r3]
	ldr r0, _080089D0 @ =0x04000134
	strh r4, [r0]
	ldr r2, _080089D4 @ =0x04000128
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r7, _080089D8 @ =0x00004003
	adds r1, r7, 0
	orrs r0, r1
	strh r0, [r2]
	ldrh r2, [r3]
	strh r2, [r6]
	strh r4, [r3]
	ldrh r0, [r5]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r5]
	strh r2, [r3]
	ldr r0, _080089DC @ =0x0400012a
	strh r4, [r0]
	movs r5, 0
	str r5, [sp]
	ldr r1, _080089E0 @ =gLink
	ldr r2, _080089E4 @ =0x050003f0
	mov r0, sp
	bl CpuSet
	ldr r0, _080089E8 @ =0x03000450
	strb r4, [r0]
	ldr r0, _080089EC @ =0x03000452
	strh r5, [r0]
	ldr r0, _080089F0 @ =0x03000454
	strh r5, [r0]
	ldr r0, _080089F4 @ =0x03000456
	strb r4, [r0]
	ldr r0, _080089F8 @ =0x03000457
	strb r4, [r0]
	ldr r0, _080089FC @ =gLastSendQueueCount
	strb r4, [r0]
	ldr r0, _08008A00 @ =gLastRecvQueueCount
	strb r4, [r0]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080089C0: .4byte gLinkSavedIme
_080089C4: .4byte 0x04000208
_080089C8: .4byte 0x04000200
_080089CC: .4byte 0x0000ff3f
_080089D0: .4byte 0x04000134
_080089D4: .4byte 0x04000128
_080089D8: .4byte 0x00004003
_080089DC: .4byte 0x0400012a
_080089E0: .4byte gLink
_080089E4: .4byte 0x050003f0
_080089E8: .4byte 0x03000450
_080089EC: .4byte 0x03000452
_080089F0: .4byte 0x03000454
_080089F4: .4byte 0x03000456
_080089F8: .4byte 0x03000457
_080089FC: .4byte gLastSendQueueCount
_08008A00: .4byte gLastRecvQueueCount
	thumb_func_end EnableSerial

	thumb_func_start ResetSerial
ResetSerial: @ 8008838
	push {lr}
	bl EnableSerial
	bl DisableSerial
	pop {r0}
	bx r0
	thumb_func_end ResetSerial

	thumb_func_start LinkMain1
LinkMain1: @ 8008848
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _08008864 @ =gLink
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _080088FA
	lsls r0, 2
	ldr r1, _08008868 @ =_08008A38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008864: .4byte gLink
_08008868: .4byte _08008A38
	.align 2, 0
_0800886C:
	.4byte _08008880
	.4byte _08008890
	.4byte _080088A8
	.4byte _080088E4
	.4byte _080088EE
_08008880:
	bl DisableSerial
	ldr r1, _0800888C @ =gLink
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _080088FA
	.align 2, 0
_0800888C: .4byte gLink
_08008890:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080088FA
	bl EnableSerial
	ldr r1, _080088A4 @ =gLink
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _080088FA
	.align 2, 0
_080088A4: .4byte gLink
_080088A8:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _080088B8
	cmp r1, 0x2
	beq _080088D0
	bl CheckMasterOrSlave
	b _080088FA
_080088B8:
	ldr r2, _080088CC @ =gLink
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _080088FA
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _080088FA
	strb r1, [r2, 0xE]
	b _080088FA
	.align 2, 0
_080088CC: .4byte gLink
_080088D0:
	ldr r0, _080088DC @ =gLink
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, _080088E0 @ =0x0400012a
	strh r1, [r0]
	b _080088FA
	.align 2, 0
_080088DC: .4byte gLink
_080088E0: .4byte 0x0400012a
_080088E4:
	bl InitTimer
	ldr r1, _08008934 @ =gLink
	movs r0, 0x4
	strb r0, [r1, 0x1]
_080088EE:
	adds r0, r5, 0
	bl EnqueueSendCmd
	adds r0, r6, 0
	bl DequeueRecvCmds
_080088FA:
	movs r0, 0
	strb r0, [r4]
	ldr r1, _08008934 @ =gLink
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _08008912
	movs r0, 0x20
	orrs r2, r0
_08008912:
	ldrb r0, [r1, 0xC]
	lsls r3, r0, 8
	ldrb r0, [r1, 0xF]
	lsls r4, r0, 9
	ldrb r0, [r1, 0x10]
	lsls r5, r0, 12
	ldrb r0, [r1, 0x11]
	lsls r6, r0, 13
	ldrb r0, [r1, 0x12]
	lsls r7, r0, 14
	ldrb r0, [r1, 0x1]
	cmp r0, 0x4
	bne _08008938
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _0800893C
	.align 2, 0
_08008934: .4byte gLink
_08008938:
	adds r0, r2, 0
	orrs r0, r3
_0800893C:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _08008952
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_08008952:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _0800895E
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_0800895E:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _0800896A
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_0800896A:
	adds r0, r1, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end LinkMain1

	thumb_func_start CheckMasterOrSlave
CheckMasterOrSlave: @ 8008B40
	push {lr}
	ldr r0, _08008B5C @ =0x04000128
	ldr r1, [r0]
	movs r0, 0xC
	ands r1, r0
	ldr r2, _08008B60 @ =gLink
	cmp r1, 0x8
	bne _08008B64
	ldrb r0, [r2, 0x2]
	cmp r0, 0
	bne _08008B64
	strb r1, [r2]
	b _08008B68
	.align 2, 0
_08008B5C: .4byte 0x04000128
_08008B60: .4byte gLink
_08008B64:
	movs r0, 0
	strb r0, [r2]
_08008B68:
	pop {r0}
	bx r0
	thumb_func_end CheckMasterOrSlave

	thumb_func_start InitTimer
InitTimer: @ 8008B6C
	push {r4,lr}
	ldr r0, _08008BA4 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _08008B9C
	ldr r1, _08008BA8 @ =0x0400010c
	ldr r2, _08008BAC @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x41
	strh r0, [r1]
	ldr r0, _08008BB0 @ =gLinkSavedIme
	ldr r2, _08008BB4 @ =0x04000208
	ldrh r4, [r2]
	strh r4, [r0]
	movs r0, 0
	strh r0, [r2]
	ldr r3, _08008BB8 @ =0x04000200
	ldrh r0, [r3]
	movs r1, 0x40
	orrs r0, r1
	strh r0, [r3]
	strh r4, [r2]
_08008B9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008BA4: .4byte gLink
_08008BA8: .4byte 0x0400010c
_08008BAC: .4byte 0x0000ff3b
_08008BB0: .4byte gLinkSavedIme
_08008BB4: .4byte 0x04000208
_08008BB8: .4byte 0x04000200
	thumb_func_end InitTimer

	thumb_func_start EnqueueSendCmd
EnqueueSendCmd: @ 8008BBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	ldr r2, _08008C34 @ =gLinkSavedIme
	ldr r1, _08008C38 @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08008C3C @ =gLink
	ldr r4, _08008C40 @ =0x00000339
	adds r0, r1, r4
	ldrb r4, [r0]
	adds r6, r1, 0
	cmp r4, 0x31
	bhi _08008C4C
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r6, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _08008BFA
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_08008BFA:
	movs r2, 0
	ldr r4, _08008C44 @ =0x03000452
	mov r9, r4
	ldr r1, _08008C48 @ =gLastSendQueueCount
	mov r10, r1
	lsls r5, r0, 1
	movs r0, 0x18
	adds r0, r6
	mov r8, r0
	mov r12, r2
	movs r7, 0x64
_08008C10:
	ldrh r0, [r4]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r4]
	adds r0, r2, 0
	muls r0, r7
	adds r0, r5, r0
	add r0, r8
	strh r1, [r0]
	mov r1, r12
	strh r1, [r3]
	adds r3, 0x2
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _08008C10
	b _08008C58
	.align 2, 0
_08008C34: .4byte gLinkSavedIme
_08008C38: .4byte 0x04000208
_08008C3C: .4byte gLink
_08008C40: .4byte 0x00000339
_08008C44: .4byte 0x03000452
_08008C48: .4byte gLastSendQueueCount
_08008C4C:
	movs r0, 0x1
	strb r0, [r6, 0x12]
	ldr r2, _08008C90 @ =0x03000452
	mov r9, r2
	ldr r4, _08008C94 @ =gLastSendQueueCount
	mov r10, r4
_08008C58:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	beq _08008C70
	ldr r2, _08008C98 @ =0x00000339
	adds r0, r6, r2
	ldrb r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r0]
	mov r4, r9
	strh r2, [r4]
_08008C70:
	ldr r1, _08008C9C @ =0x04000208
	ldr r2, _08008CA0 @ =gLinkSavedIme
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r4, _08008C98 @ =0x00000339
	adds r0, r6, r4
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008C90: .4byte 0x03000452
_08008C94: .4byte gLastSendQueueCount
_08008C98: .4byte 0x00000339
_08008C9C: .4byte 0x04000208
_08008CA0: .4byte gLinkSavedIme
	thumb_func_end EnqueueSendCmd

	thumb_func_start DequeueRecvCmds
DequeueRecvCmds: @ 8008CA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r12, r0
	ldr r2, _08008D04 @ =gLinkSavedIme
	ldr r1, _08008D08 @ =0x04000208
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08008D0C @ =gLink
	ldr r3, _08008D10 @ =0x00000fbd
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	bne _08008D14
	movs r3, 0
	mov r8, r7
	ldrb r6, [r7, 0x3]
_08008CD0:
	movs r2, 0
	adds r5, r3, 0x1
	cmp r2, r6
	bcs _08008CF4
	lsls r0, r3, 3
	mov r1, r12
	adds r3, r0, r1
	movs r4, 0
	mov r0, r8
	ldrb r1, [r0, 0x3]
_08008CE4:
	lsls r0, r2, 1
	adds r0, r3
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _08008CE4
_08008CF4:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _08008CD0
	movs r0, 0x1
	strb r0, [r7, 0xC]
	b _08008D8C
	.align 2, 0
_08008D04: .4byte gLinkSavedIme
_08008D08: .4byte 0x04000208
_08008D0C: .4byte gLink
_08008D10: .4byte 0x00000fbd
_08008D14:
	movs r3, 0
	ldrb r1, [r7, 0x3]
	mov r9, r1
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r7
	mov r8, r2
	mov r10, r7
_08008D24:
	movs r2, 0
	adds r5, r3, 0x1
	cmp r2, r9
	bcs _08008D60
	lsls r0, r3, 3
	mov r1, r12
	adds r6, r0, r1
	ldr r0, _08008DA4 @ =0x0300403c
	ldrb r1, [r0]
	lsls r1, 1
	mov r0, r10
	ldrb r4, [r0, 0x3]
	movs r0, 0x64
	muls r0, r3
	adds r3, r1, r0
_08008D42:
	lsls r0, r2, 1
	adds r1, r0, r6
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r0, 5
	adds r0, r3, r0
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08008D42
_08008D60:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _08008D24
	adds r2, r7, 0
	ldr r3, _08008DA8 @ =0x00000fbd
	adds r1, r2, r3
	ldrb r0, [r1]
	subs r0, 0x1
	movs r3, 0
	strb r0, [r1]
	ldr r0, _08008DAC @ =0x00000fbc
	adds r2, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _08008D8A
	strb r3, [r2]
_08008D8A:
	strb r3, [r7, 0xC]
_08008D8C:
	ldr r1, _08008DB0 @ =0x04000208
	ldr r2, _08008DB4 @ =gLinkSavedIme
	ldrh r0, [r2]
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008DA4: .4byte 0x0300403c
_08008DA8: .4byte 0x00000fbd
_08008DAC: .4byte 0x00000fbc
_08008DB0: .4byte 0x04000208
_08008DB4: .4byte gLinkSavedIme
	thumb_func_end DequeueRecvCmds

	thumb_func_start LinkVSync
LinkVSync: @ 8008BEC
	push {r4,lr}
	ldr r3, _08008C14 @ =gLink
	ldrb r4, [r3]
	cmp r4, 0
	beq _08008C28
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _08008C22
	cmp r0, 0x4
	bne _08008C52
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _08008C18
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _08008C22
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _08008C52
	.align 2, 0
_08008C14: .4byte gLink
_08008C18:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _08008C52
	movs r0, 0
	strb r0, [r3, 0xD]
_08008C22:
	bl StartTransfer
	b _08008C52
_08008C28:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _08008C32
	cmp r2, 0x2
	bne _08008C52
_08008C32:
	ldr r1, _08008C58 @ =0x03000450
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _08008C52
	cmp r2, 0x4
	bne _08008C4A
	movs r0, 0x2
	strb r0, [r3, 0x13]
_08008C4A:
	cmp r2, 0x2
	bne _08008C52
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_08008C52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008C58: .4byte 0x03000450
	thumb_func_end LinkVSync

	thumb_func_start Timer3Intr
Timer3Intr: @ 8008C5C
	push {lr}
	bl StopTimer
	bl StartTransfer
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start SerialCB
SerialCB: @ 8008C6C
	push {r4,lr}
	ldr r4, _08008C98 @ =gLink
	ldr r0, _08008C9C @ =0x04000128
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _08008CA0
	cmp r0, 0x4
	bne _08008CBE
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl DoRecv
	bl DoSend
	bl SendRecvDone
	b _08008CBE
	.align 2, 0
_08008C98: .4byte gLink
_08008C9C: .4byte 0x04000128
_08008CA0:
	bl DoHandshake
	lsls r0, 24
	cmp r0, 0
	beq _08008CBE
	ldrb r0, [r4]
	cmp r0, 0
	beq _08008CBA
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _08008CBE
_08008CBA:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_08008CBE:
	ldr r3, _08008CE4 @ =gLink
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, _08008CE8 @ =0x03000450
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _08008CDE
	ldr r0, _08008CEC @ =gLastRecvQueueCount
	ldr r2, _08008CF0 @ =0x00000fbd
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_08008CDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008CE4: .4byte gLink
_08008CE8: .4byte 0x03000450
_08008CEC: .4byte gLastRecvQueueCount
_08008CF0: .4byte 0x00000fbd
	thumb_func_end SerialCB

	thumb_func_start StartTransfer
StartTransfer: @ 8008EC0
	ldr r0, _08008ECC @ =0x04000128
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08008ECC: .4byte 0x04000128
	thumb_func_end StartTransfer

	thumb_func_start DoHandshake
DoHandshake: @ 8008ED0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r5, 0
	ldr r6, _08008EEC @ =0x0000ffff
	ldr r0, _08008EF0 @ =gLink
	ldrb r1, [r0, 0xE]
	adds r7, r0, 0
	cmp r1, 0x1
	bne _08008EFC
	ldr r1, _08008EF4 @ =0x0400012a
	ldr r2, _08008EF8 @ =0x00008fff
	b _08008F00
	.align 2, 0
_08008EEC: .4byte 0x0000ffff
_08008EF0: .4byte gLink
_08008EF4: .4byte 0x0400012a
_08008EF8: .4byte 0x00008fff
_08008EFC:
	ldr r1, _08008F54 @ =0x0400012a
	ldr r2, _08008F58 @ =0x0000b9a0
_08008F00:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _08008F5C @ =0x03003084
	ldr r3, _08008F60 @ =0x04000120
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	movs r1, 0
	str r0, [r3]
	str r1, [r3, 0x4]
	strb r0, [r2, 0xA]
	movs r4, 0
	ldr r0, _08008F64 @ =0x03000457
	mov r9, r0
	mov r8, r2
	ldr r2, _08008F68 @ =0x00008fff
	ldr r1, _08008F6C @ =0x0000ffff
	mov r12, r1
_08008F28:
	lsls r0, r4, 1
	add r0, r8
	ldrh r3, [r0]
	movs r0, 0x4
	negs r0, r0
	ands r0, r3
	ldr r1, _08008F58 @ =0x0000b9a0
	cmp r0, r1
	beq _08008F40
	adds r0, r3, 0
	cmp r0, r2
	bne _08008F70
_08008F40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r3, 0
	cmp r6, r0
	bls _08008F78
	cmp r0, 0
	beq _08008F78
	adds r6, r3, 0
	b _08008F78
	.align 2, 0
_08008F54: .4byte 0x0400012a
_08008F58: .4byte 0x0000b9a0
_08008F5C: .4byte 0x03003084
_08008F60: .4byte 0x04000120
_08008F64: .4byte 0x03000457
_08008F68: .4byte 0x00008fff
_08008F6C: .4byte 0x0000ffff
_08008F70:
	cmp r0, r12
	beq _08008F82
	movs r5, 0
	b _08008F82
_08008F78:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08008F28
_08008F82:
	strb r5, [r7, 0x3]
	adds r0, r5, 0
	cmp r0, 0x1
	bls _08008FB2
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	bne _08008FA4
	ldrh r1, [r7, 0x4]
	ldr r0, _08008FA0 @ =0x00008fff
	cmp r1, r0
	bne _08008FA4
	movs r0, 0x1
	b _08008FBE
	.align 2, 0
_08008FA0: .4byte 0x00008fff
_08008FA4:
	ldrb r0, [r7, 0x3]
	cmp r0, 0x1
	bls _08008FB2
	movs r0, 0x3
	ands r6, r0
	adds r0, r6, 0x1
	b _08008FB4
_08008FB2:
	movs r0, 0
_08008FB4:
	strb r0, [r7, 0xF]
	ldrb r0, [r7, 0x3]
	mov r1, r9
	strb r0, [r1]
	movs r0, 0
_08008FBE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoHandshake

	thumb_func_start DoRecv
DoRecv: @ 8008FCC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, _08009024 @ =0x04000120
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _08009028 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r6, r0, 0
	cmp r1, 0
	bne _08009030
	movs r4, 0
	ldr r7, _0800902C @ =0x03000456
	ldrb r0, [r6, 0x3]
	cmp r4, r0
	bcs _0800901A
	adds r5, r6, 0
	ldrh r1, [r6, 0x14]
	adds r3, r7, 0
	adds r2, r6, 0
_08008FFA:
	lsls r0, r4, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _0800900E
	ldrb r0, [r3]
	cmp r0, 0
	beq _0800900E
	movs r0, 0x1
	strb r0, [r5, 0x11]
_0800900E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r2, 0x3]
	cmp r4, r0
	bcc _08008FFA
_0800901A:
	movs r0, 0
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strb r0, [r7]
	b _080090D0
	.align 2, 0
_08009024: .4byte 0x04000120
_08009028: .4byte gLink
_0800902C: .4byte 0x03000456
_08009030:
	ldr r2, _080090A0 @ =0x00000fbc
	adds r1, r6, r2
	adds r2, 0x1
	adds r0, r6, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	adds r0, r2, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800904C
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
_0800904C:
	cmp r2, 0x31
	bhi _080090A8
	movs r4, 0
	ldrb r1, [r6, 0x3]
	cmp r4, r1
	bcs _080090AC
	adds r5, r6, 0
	ldr r7, _080090A4 @ =0x03000454
	lsls r0, 1
	mov r12, r0
	movs r2, 0xCF
	lsls r2, 2
	adds r2, r6
	mov r8, r2
_08009068:
	lsls r1, r4, 1
	mov r2, sp
	adds r0, r2, r1
	ldrh r3, [r0]
	ldrh r2, [r5, 0x14]
	adds r0, r3, r2
	strh r0, [r5, 0x14]
	ldrh r0, [r7]
	orrs r0, r3
	strh r0, [r7]
	ldrb r2, [r5, 0x17]
	movs r0, 0x64
	muls r0, r2
	add r0, r12
	adds r1, r4
	lsls r1, 3
	adds r1, r4
	lsls r1, 5
	adds r0, r1
	add r0, r8
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x3]
	cmp r4, r0
	bcc _08009068
	b _080090AC
	.align 2, 0
_080090A0: .4byte 0x00000fbc
_080090A4: .4byte 0x03000454
_080090A8:
	movs r0, 0x2
	strb r0, [r6, 0x12]
_080090AC:
	ldrb r0, [r6, 0x17]
	adds r0, 0x1
	strb r0, [r6, 0x17]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _080090D0
	ldr r2, _080090DC @ =0x03000454
	ldrh r0, [r2]
	cmp r0, 0
	beq _080090D0
	ldr r1, _080090E0 @ =0x00000fbd
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0
	strh r0, [r2]
_080090D0:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080090DC: .4byte 0x03000454
_080090E0: .4byte 0x00000fbd
	thumb_func_end DoRecv

	thumb_func_start DoSend
DoSend: @ 80090E4
	push {r4,lr}
	ldr r0, _08009120 @ =gLink
	ldrb r1, [r0, 0x16]
	adds r4, r0, 0
	cmp r1, 0x8
	bne _08009136
	ldr r1, _08009124 @ =0x0400012a
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	ldr r1, _08009128 @ =0x03000451
	ldrb r2, [r1]
	cmp r2, 0
	bne _08009130
	ldr r0, _0800912C @ =0x00000339
	adds r1, r4, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r0, 0xCE
	lsls r0, 2
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	bls _0800918C
	strb r2, [r1]
	b _0800918C
	.align 2, 0
_08009120: .4byte gLink
_08009124: .4byte 0x0400012a
_08009128: .4byte 0x03000451
_0800912C: .4byte 0x00000339
_08009130:
	movs r0, 0
	strb r0, [r1]
	b _0800918C
_08009136:
	ldr r1, _0800915C @ =0x03000451
	ldrb r0, [r1]
	cmp r0, 0
	bne _08009152
	ldr r2, _08009160 @ =0x00000339
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0800914C
	movs r0, 0x1
	strb r0, [r1]
_0800914C:
	ldrb r0, [r1]
	cmp r0, 0
	beq _08009168
_08009152:
	ldr r1, _08009164 @ =0x0400012a
	movs r0, 0
	strh r0, [r1]
	b _08009186
	.align 2, 0
_0800915C: .4byte 0x03000451
_08009160: .4byte 0x00000339
_08009164: .4byte 0x0400012a
_08009168:
	ldr r3, _08009194 @ =0x0400012a
	movs r1, 0xCE
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 1
	ldrb r2, [r4, 0x16]
	movs r1, 0x64
	muls r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x18
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
_08009186:
	ldrb r0, [r4, 0x16]
	adds r0, 0x1
	strb r0, [r4, 0x16]
_0800918C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009194: .4byte 0x0400012a
	thumb_func_end DoSend

	thumb_func_start StopTimer
StopTimer: @ 8009198
	push {lr}
	ldr r0, _080091B8 @ =gLink
	ldrb r0, [r0]
	cmp r0, 0
	beq _080091B4
	ldr r2, _080091BC @ =0x0400010e
	ldrh r1, [r2]
	ldr r0, _080091C0 @ =0x0000ff7f
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080091C4 @ =0x0400010c
	ldr r2, _080091C8 @ =0x0000ff3b
	adds r0, r2, 0
	strh r0, [r1]
_080091B4:
	pop {r0}
	bx r0
	.align 2, 0
_080091B8: .4byte gLink
_080091BC: .4byte 0x0400010e
_080091C0: .4byte 0x0000ff7f
_080091C4: .4byte 0x0400010c
_080091C8: .4byte 0x0000ff3b
	thumb_func_end StopTimer

	thumb_func_start SendRecvDone
SendRecvDone: @ 80091CC
	push {lr}
	ldr r1, _080091E0 @ =gLink
	ldrb r0, [r1, 0x17]
	cmp r0, 0x8
	bne _080091E4
	movs r0, 0
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	b _080091F4
	.align 2, 0
_080091E0: .4byte gLink
_080091E4:
	ldrb r0, [r1]
	cmp r0, 0
	beq _080091F4
	ldr r0, _080091F8 @ =0x0400010e
	ldrh r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strh r1, [r0]
_080091F4:
	pop {r0}
	bx r0
	.align 2, 0
_080091F8: .4byte 0x0400010e
	thumb_func_end SendRecvDone

	thumb_func_start ResetSendBuffer
ResetSendBuffer: @ 8009030
	push {r4-r6,lr}
	ldr r1, _08009078 @ =gLink
	ldr r2, _0800907C @ =0x00000339
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	movs r3, 0xCE
	lsls r3, 2
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0
	movs r6, 0x64
	adds r5, r1, 0
	adds r5, 0x18
	ldr r4, _08009080 @ =0x0000efff
_0800904E:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_08009056:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _08009056
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800904E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009078: .4byte gLink
_0800907C: .4byte 0x00000339
_08009080: .4byte 0x0000efff
	thumb_func_end ResetSendBuffer

	thumb_func_start ResetRecvBuffer
ResetRecvBuffer: @ 8009084
	push {r4-r7,lr}
	ldr r1, _080090E4 @ =gLink
	ldr r2, _080090E8 @ =0x00000fbd
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _080090EC @ =0x00000fbc
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, _080090F0 @ =0x0000efff
_080090A2:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_080090B0:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_080090BA:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _080090BA
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _080090B0
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080090A2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080090E4: .4byte gLink
_080090E8: .4byte 0x00000fbd
_080090EC: .4byte 0x00000fbc
_080090F0: .4byte 0x0000efff
	thumb_func_end ResetRecvBuffer

	.align 2, 0 @ Don't pad with nop.
