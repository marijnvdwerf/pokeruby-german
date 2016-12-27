	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start Task_DestroySelf
Task_DestroySelf: @ 80071E0
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
InitLinkTestBG_Unused: @ 8007288
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
	ldr r0, _080072EC @ =sLinkTestDigitPalette
	mov r2, r8
	lsls r1, r2, 4
	movs r2, 0x20
	bl LoadPalette
	ldr r2, _080072F0 @ =0x040000d4
	ldr r0, _080072F4 @ =sLinkTestDigitTiles
	str r0, [r2]
	lsls r0, r6, 14
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _080072F8 @ =0x80000110
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080072FC @ =gLinkTestBGInfo
	str r4, [r0]
	mov r1, r8
	str r1, [r0, 0x4]
	ldr r0, _08007300 @ =gBGControlRegs
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
_080072EC: .4byte sLinkTestDigitPalette
_080072F0: .4byte 0x040000d4
_080072F4: .4byte sLinkTestDigitTiles
_080072F8: .4byte 0x80000110
_080072FC: .4byte gLinkTestBGInfo
_08007300: .4byte gBGControlRegs
	thumb_func_end InitLinkTestBG_Unused

	thumb_func_start LinkTestScreen
LinkTestScreen: @ 8007304
	push {r4-r6,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _080073A8 @ =VBlankCB_LinkTest
	bl SetVBlankCallback
	ldr r4, _080073AC @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl ResetBlockSend
	ldr r1, _080073B0 @ =gLinkType
	ldr r2, _080073B4 @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	bl OpenLink
	ldr r0, _080073B8 @ =gMain
	ldrh r0, [r0, 0x20]
	bl SeedRng
	movs r4, 0
	ldr r6, _080073BC @ =0x02024eae
	movs r5, 0xFF
_08007344:
	bl Random
	adds r1, r4, r6
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _08007344
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
	ldr r0, _080073C0 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _080073C4 @ =0x03000444
	movs r0, 0
	str r0, [r1]
	bl InitLocalLinkPlayer
	ldr r0, _080073C8 @ =Task_PrintTestData
	movs r1, 0
	bl CreateTask
	ldr r0, _080073CC @ =CB2_LinkTest
	bl SetMainCallback2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080073A8: .4byte VBlankCB_LinkTest
_080073AC: .4byte gWindowConfig_81E6CE4
_080073B0: .4byte gLinkType
_080073B4: .4byte 0x00001111
_080073B8: .4byte gMain
_080073BC: .4byte 0x02024eae
_080073C0: .4byte Task_DestroySelf
_080073C4: .4byte 0x03000444
_080073C8: .4byte Task_PrintTestData
_080073CC: .4byte CB2_LinkTest
	thumb_func_end LinkTestScreen

	thumb_func_start sub_8007270
sub_8007270: @ 80073D0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080073DC @ =localLinkPlayer
	strh r0, [r1, 0x18]
	bx lr
	.align 2, 0
_080073DC: .4byte localLinkPlayer
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
OpenLink: @ 80074D8
	push {r4-r6,lr}
	bl ResetSerial
	bl InitLink
	ldr r1, _08007538 @ =gLinkCallback
	ldr r0, _0800753C @ =LinkCB_RequestPlayerDataExchange
	str r0, [r1]
	ldr r0, _08007540 @ =gLinkVSyncDisabled
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08007544 @ =gLinkErrorOccurred
	strb r1, [r0]
	ldr r0, _08007548 @ =gSuppressLinkErrorMessage
	strb r1, [r0]
	bl ResetBlockReceivedFlags
	ldr r0, _0800754C @ =0x0300042c
	movs r1, 0
	str r1, [r0]
	ldr r0, _08007550 @ =byte_3002A68
	strb r1, [r0]
	ldr r0, _08007554 @ =gLinkDummyBool
	strb r1, [r0]
	ldr r0, _08007558 @ =gReceivedRemoteLinkPlayers
	strb r1, [r0]
	ldr r6, _0800755C @ =gLinkPlayerPending
	movs r2, 0
	movs r5, 0x1
	ldr r4, _08007560 @ =u8_array_3002B78
	ldr r3, _08007564 @ =u8_array_3002B70
_08007516:
	adds r0, r1, r6
	strb r5, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0x3
	ble _08007516
	ldr r0, _08007568 @ =Task_TriggerHandshake
	movs r1, 0x2
	bl CreateTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007538: .4byte gLinkCallback
_0800753C: .4byte LinkCB_RequestPlayerDataExchange
_08007540: .4byte gLinkVSyncDisabled
_08007544: .4byte gLinkErrorOccurred
_08007548: .4byte gSuppressLinkErrorMessage
_0800754C: .4byte 0x0300042c
_08007550: .4byte byte_3002A68
_08007554: .4byte gLinkDummyBool
_08007558: .4byte gReceivedRemoteLinkPlayers
_0800755C: .4byte gLinkPlayerPending
_08007560: .4byte u8_array_3002B78
_08007564: .4byte u8_array_3002B70
_08007568: .4byte Task_TriggerHandshake
	thumb_func_end OpenLink

	thumb_func_start CloseLink
CloseLink: @ 800756C
	push {lr}
	ldr r0, _08007580 @ =gReceivedRemoteLinkPlayers
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08007584 @ =gLinkOpen
	strb r1, [r0]
	bl DisableSerial
	pop {r0}
	bx r0
	.align 2, 0
_08007580: .4byte gReceivedRemoteLinkPlayers
_08007584: .4byte gLinkOpen
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
LinkMain2: @ 8007750
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08007760 @ =gLinkOpen
	ldrb r0, [r0]
	cmp r0, 0
	bne _08007764
	movs r0, 0
	b _080077AC
	.align 2, 0
_08007760: .4byte gLinkOpen
_08007764:
	movs r1, 0
	ldr r5, _080077B4 @ =gLinkHeldKeys
	ldr r3, _080077B8 @ =gSendCmd
	movs r2, 0
_0800776C:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0800776C
	ldrh r0, [r4]
	strh r0, [r5]
	ldr r0, _080077BC @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080077A8
	ldr r0, _080077C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bl ProcessRecvCmds
	ldr r0, _080077C4 @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	beq _080077A4
	bl _call_via_r0
_080077A4:
	bl CheckErrorStatus
_080077A8:
	ldr r0, _080077BC @ =gLinkStatus
	ldrh r0, [r0]
_080077AC:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080077B4: .4byte gLinkHeldKeys
_080077B8: .4byte gSendCmd
_080077BC: .4byte gLinkStatus
_080077C0: .4byte 0x04000128
_080077C4: .4byte gLinkCallback
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
sub_8007B14: @ 8007CDC
	ldr r1, _08007CE4 @ =gLinkCallback
	ldr r0, _08007CE8 @ =sub_8007B44
	str r0, [r1]
	bx lr
	.align 2, 0
_08007CE4: .4byte gLinkCallback
_08007CE8: .4byte sub_8007B44
	thumb_func_end sub_8007B14

	thumb_func_start sub_8007B24
sub_8007B24: @ 8007CEC
	push {lr}
	ldr r0, _08007CFC @ =gLinkCallback
	ldr r1, [r0]
	ldr r0, _08007D00 @ =sub_8007B44
	cmp r1, r0
	beq _08007D04
	movs r0, 0
	b _08007D06
	.align 2, 0
_08007CFC: .4byte gLinkCallback
_08007D00: .4byte sub_8007B44
_08007D04:
	movs r0, 0x1
_08007D06:
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
ClearLinkCallback: @ 8007D28
	ldr r1, _08007D30 @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007D30: .4byte gLinkCallback
	thumb_func_end ClearLinkCallback

	thumb_func_start ClearLinkCallback_2
ClearLinkCallback_2: @ 8007D34
	ldr r1, _08007D3C @ =gLinkCallback
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007D3C: .4byte gLinkCallback
	thumb_func_end ClearLinkCallback_2

	thumb_func_start GetLinkPlayerCount
GetLinkPlayerCount: @ 8007D40
	ldr r0, _08007D4C @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_08007D4C: .4byte gLinkStatus
	thumb_func_end GetLinkPlayerCount

	thumb_func_start OpenLinkTimed
OpenLinkTimed: @ 8007D50
	push {lr}
	ldr r0, _08007D68 @ =0x03000434
	movs r1, 0
	str r1, [r0]
	ldr r0, _08007D6C @ =gLinkTimeOutCounter
	strh r1, [r0]
	bl ResetBlockSend
	bl OpenLink
	pop {r0}
	bx r0
	.align 2, 0
_08007D68: .4byte 0x03000434
_08007D6C: .4byte gLinkTimeOutCounter
	thumb_func_end OpenLinkTimed

	thumb_func_start GetLinkPlayerDataExchangeStatusTimed
GetLinkPlayerDataExchangeStatusTimed: @ 8007D70
	push {r4-r7,lr}
	movs r7, 0
	ldr r0, _08007D98 @ =gReceivedRemoteLinkPlayers
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _08007DEC
	bl GetLinkPlayerCount
	lsls r0, 24
	cmp r0, 0
	bne _08007D8E
	ldr r0, _08007D9C @ =gLinkErrorOccurred
	strb r4, [r0]
	bl CloseLink
_08007D8E:
	movs r6, 0
	ldr r4, _08007DA0 @ =gLinkPlayers
	movs r5, 0
	b _08007DB8
	.align 2, 0
_08007D98: .4byte gReceivedRemoteLinkPlayers
_08007D9C: .4byte gLinkErrorOccurred
_08007DA0: .4byte gLinkPlayers
_08007DA4:
	adds r0, r4, 0
	adds r0, 0x14
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	bne _08007DB4
	adds r7, 0x1
_08007DB4:
	adds r5, 0x1C
	adds r6, 0x1
_08007DB8:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	blt _08007DA4
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r7, r0
	bne _08007DDC
	ldr r1, _08007DD8 @ =0x03000434
	movs r0, 0x1
	b _08007DE0
	.align 2, 0
_08007DD8: .4byte 0x03000434
_08007DDC:
	ldr r1, _08007DE8 @ =0x03000434
	movs r0, 0x3
_08007DE0:
	str r0, [r1]
	adds r2, r1, 0
	b _08007E04
	.align 2, 0
_08007DE8: .4byte 0x03000434
_08007DEC:
	ldr r0, _08007E0C @ =gLinkTimeOutCounter
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 18
	ldr r2, _08007E10 @ =0x03000434
	cmp r1, r0
	bls _08007E04
	movs r0, 0x2
	str r0, [r2]
_08007E04:
	ldrb r0, [r2]
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007E0C: .4byte gLinkTimeOutCounter
_08007E10: .4byte 0x03000434
	thumb_func_end GetLinkPlayerDataExchangeStatusTimed

	thumb_func_start IsLinkPlayerDataExchangeComplete
IsLinkPlayerDataExchangeComplete: @ 8007E14
	push {r4-r6,lr}
	movs r6, 0
	movs r4, 0
	ldr r5, _08007E20 @ =gLinkPlayers
	b _08007E44
	.align 2, 0
_08007E20: .4byte gLinkPlayers
_08007E24:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x14
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r5, 0x14]
	cmp r1, r0
	bne _08007E3E
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08007E3E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08007E44:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08007E24
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _08007E68
	movs r2, 0x1
	ldr r0, _08007E64 @ =0x03000434
	str r2, [r0]
	b _08007E70
	.align 2, 0
_08007E64: .4byte 0x03000434
_08007E68:
	movs r2, 0
	ldr r1, _08007E78 @ =0x03000434
	movs r0, 0x3
	str r0, [r1]
_08007E70:
	adds r0, r2, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08007E78: .4byte 0x03000434
	thumb_func_end IsLinkPlayerDataExchangeComplete

	thumb_func_start GetLinkPlayerTrainerId
GetLinkPlayerTrainerId: @ 8007E7C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08007E90 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r2, 0x4
	adds r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08007E90: .4byte gLinkPlayers
	thumb_func_end GetLinkPlayerTrainerId

	thumb_func_start ResetLinkPlayers
ResetLinkPlayers: @ 8007E94
	push {r4,r5,lr}
	ldr r5, _08007EB4 @ =gLinkPlayers
	movs r4, 0x3
_08007E9A:
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1C
	bl memset
	adds r5, 0x1C
	subs r4, 0x1
	cmp r4, 0
	bge _08007E9A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007EB4: .4byte gLinkPlayers
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
sub_8007E24: @ 8007FF0
	ldr r1, _08008000 @ =dword_20238BC
	movs r0, 0
	str r0, [r1]
	ldr r1, _08008004 @ =gLinkCallback
	ldr r0, _08008008 @ =sub_8007E04
	str r0, [r1]
	bx lr
	.align 2, 0
_08008000: .4byte dword_20238BC
_08008004: .4byte gLinkCallback
_08008008: .4byte sub_8007E04
	thumb_func_end sub_8007E24

	thumb_func_start sub_8007E40
sub_8007E40: @ 800800C
	ldr r0, _08008014 @ =dword_20238BC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08008014: .4byte dword_20238BC
	thumb_func_end sub_8007E40

	thumb_func_start sub_8007E4C
sub_8007E4C: @ 8008018
	push {lr}
	ldr r0, _08008024 @ =0x0000aaaa
	bl BuildSendCmd
	pop {r0}
	bx r0
	.align 2, 0
_08008024: .4byte 0x0000aaaa
	thumb_func_end sub_8007E4C

	thumb_func_start GetMultiplayerId
GetMultiplayerId: @ 8008028
	ldr r0, _08008034 @ =0x04000128
	ldr r0, [r0]
	lsls r0, 26
	lsrs r0, 30
	bx lr
	.align 2, 0
_08008034: .4byte 0x04000128
	thumb_func_end GetMultiplayerId

	thumb_func_start bitmask_all_link_players_but_self
bitmask_all_link_players_but_self: @ 8008038
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
SendBlock: @ 8008054
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
sub_8007E9C: @ 8008068
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0800807C @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	beq _08008080
	movs r0, 0
	b _0800808C
	.align 2, 0
_0800807C: .4byte gLinkCallback
_08008080:
	ldr r0, _08008090 @ =gBlockRequestType
	strb r1, [r0]
	ldr r0, _08008094 @ =0x0000cccc
	bl BuildSendCmd
	movs r0, 0x1
_0800808C:
	pop {r1}
	bx r1
	.align 2, 0
_08008090: .4byte gBlockRequestType
_08008094: .4byte 0x0000cccc
	thumb_func_end sub_8007E9C

	thumb_func_start sub_8007ECC
sub_8007ECC: @ 8008098
	push {lr}
	movs r1, 0
	ldr r0, _080080AC @ =gLinkCallback
	ldr r0, [r0]
	cmp r0, 0
	bne _080080A6
	movs r1, 0x1
_080080A6:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080080AC: .4byte gLinkCallback
	thumb_func_end sub_8007ECC

	thumb_func_start GetBlockReceivedStatus
GetBlockReceivedStatus: @ 80080B0
	ldr r2, _080080CC @ =gBlockReceived
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
_080080CC: .4byte gBlockReceived
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
ResetBlockReceivedFlags: @ 80080E4
	push {lr}
	ldr r1, _080080F8 @ =gBlockReceived
	movs r2, 0
	adds r0, r1, 0x3
_080080EC:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080080EC
	pop {r0}
	bx r0
	.align 2, 0
_080080F8: .4byte gBlockReceived
	thumb_func_end ResetBlockReceivedFlags

	thumb_func_start ResetBlockReceivedFlag
ResetBlockReceivedFlag: @ 80080FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08008114 @ =gBlockReceived
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08008110
	movs r0, 0
	strb r0, [r1]
_08008110:
	pop {r0}
	bx r0
	.align 2, 0
_08008114: .4byte gBlockReceived
	thumb_func_end ResetBlockReceivedFlag

	thumb_func_start sub_8007F4C
sub_8007F4C: @ 8008118
	push {lr}
	ldr r0, _08008138 @ =gLinkStatus
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08008134
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bls _08008134
	ldr r1, _0800813C @ =gShouldAdvanceLinkState
	movs r0, 0x1
	strb r0, [r1]
_08008134:
	pop {r0}
	bx r0
	.align 2, 0
_08008138: .4byte gLinkStatus
_0800813C: .4byte gShouldAdvanceLinkState
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
SetLinkDebugValues: @ 8008350
	ldr r2, _0800835C @ =gLinkDebugValue1
	str r0, [r2]
	ldr r0, _08008360 @ =gLinkDebugValue2
	str r1, [r0]
	bx lr
	.align 2, 0
_0800835C: .4byte gLinkDebugValue1
_08008360: .4byte gLinkDebugValue2
	thumb_func_end SetLinkDebugValues

	thumb_func_start sub_8008198
sub_8008198: @ 8008364
	push {r4,lr}
	movs r1, 0
	movs r2, 0
	ldr r0, _08008390 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r1, r0
	bge _08008386
	movs r4, 0x1
	adds r3, r0, 0
_08008376:
	adds r0, r4, 0
	lsls r0, r2
	orrs r1, r0
	lsls r0, r1, 24
	lsrs r1, r0, 24
	adds r2, 0x1
	cmp r2, r3
	blt _08008376
_08008386:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008390: .4byte gSavedLinkPlayerCount
	thumb_func_end sub_8008198

	thumb_func_start sub_80081C8
sub_80081C8: @ 8008394
	push {r4-r7,lr}
	ldr r1, _080083C8 @ =gSavedLinkPlayerCount
	strb r0, [r1]
	bl GetMultiplayerId
	ldr r1, _080083CC @ =gSavedMultiplayerId
	strb r0, [r1]
	ldr r4, _080083D0 @ =gLinkPlayers
	ldr r3, _080083D4 @ =gSavedLinkPlayers
	movs r2, 0x3
_080083A8:
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
	bge _080083A8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080083C8: .4byte gSavedLinkPlayerCount
_080083CC: .4byte gSavedMultiplayerId
_080083D0: .4byte gLinkPlayers
_080083D4: .4byte gSavedLinkPlayers
	thumb_func_end sub_80081C8

	thumb_func_start sub_800820C
sub_800820C: @ 80083D8
	ldr r0, _080083E0 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080083E0: .4byte gSavedLinkPlayerCount
	thumb_func_end sub_800820C

	thumb_func_start sub_8008218
sub_8008218: @ 80083E4
	ldr r0, _080083EC @ =gSavedMultiplayerId
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080083EC: .4byte gSavedMultiplayerId
	thumb_func_end sub_8008218

	thumb_func_start sub_8008224
sub_8008224: @ 80083F0
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _08008424 @ =gSavedLinkPlayerCount
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r5, r2
	bge _0800841A
	ldr r1, _08008428 @ =gLinkPlayers
	ldr r0, _0800842C @ =gSavedLinkPlayers
	adds r4, r0, 0x4
	adds r3, r1, 0x4
_08008406:
	ldr r1, [r3]
	ldr r0, [r4]
	cmp r1, r0
	bne _08008410
	adds r5, 0x1
_08008410:
	adds r4, 0x1C
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bne _08008406
_0800841A:
	ldrb r6, [r6]
	cmp r5, r6
	beq _08008430
	movs r0, 0
	b _08008432
	.align 2, 0
_08008424: .4byte gSavedLinkPlayerCount
_08008428: .4byte gLinkPlayers
_0800842C: .4byte gSavedLinkPlayers
_08008430:
	movs r0, 0x1
_08008432:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8008224

	thumb_func_start sub_800826C
sub_800826C: @ 8008438
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, _080084A4 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08008498
	ldr r6, _080084A8 @ =gSavedLinkPlayers
	ldr r5, _080084AC @ =gLinkPlayers
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
_08008456:
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
	bne _0800847A
	mov r1, r8
	adds r0, r2, r1
	adds r1, r2, r7
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _0800848A
_0800847A:
	ldr r1, _080084B0 @ =gLinkErrorOccurred
	movs r0, 0x1
	strb r0, [r1]
	bl CloseLink
	ldr r0, _080084B4 @ =CB2_LinkError
	bl SetMainCallback2
_0800848A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080084A4 @ =gSavedLinkPlayerCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08008456
_08008498:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080084A4: .4byte gSavedLinkPlayerCount
_080084A8: .4byte gSavedLinkPlayers
_080084AC: .4byte gLinkPlayers
_080084B0: .4byte gLinkErrorOccurred
_080084B4: .4byte CB2_LinkError
	thumb_func_end sub_800826C

	thumb_func_start sub_80082EC
sub_80082EC: @ 80084B8
	ldr r0, _080084C4 @ =gSavedLinkPlayerCount
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080084C8 @ =gSavedMultiplayerId
	strb r1, [r0]
	bx lr
	.align 2, 0
_080084C4: .4byte gSavedLinkPlayerCount
_080084C8: .4byte gSavedMultiplayerId
	thumb_func_end sub_80082EC

	thumb_func_start GetLinkPlayerCount_2
GetLinkPlayerCount_2: @ 80084CC
	ldr r0, _080084D8 @ =gLinkStatus
	ldr r0, [r0]
	movs r1, 0x1C
	ands r0, r1
	lsrs r0, 2
	bx lr
	.align 2, 0
_080084D8: .4byte gLinkStatus
	thumb_func_end GetLinkPlayerCount_2

	thumb_func_start IsLinkMaster
IsLinkMaster: @ 80084DC
	ldr r0, _080084E8 @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080084E8: .4byte gLinkStatus
	thumb_func_end IsLinkMaster

	thumb_func_start GetDummy2
GetDummy2: @ 80084EC
	ldr r0, _080084F4 @ =0x03000430
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080084F4: .4byte 0x03000430
	thumb_func_end GetDummy2

	thumb_func_start sub_800832C
sub_800832C: @ 80084F8
	push {lr}
	ldr r2, _08008510 @ =gLinkCallback
	ldr r1, [r2]
	cmp r1, 0
	bne _0800850A
	ldr r0, _08008514 @ =sub_8008350
	str r0, [r2]
	ldr r0, _08008518 @ =gLinkDummyBool
	strb r1, [r0]
_0800850A:
	pop {r0}
	bx r0
	.align 2, 0
_08008510: .4byte gLinkCallback
_08008514: .4byte sub_8008350
_08008518: .4byte gLinkDummyBool
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
sub_8008480: @ 800864C
	push {lr}
	ldr r2, _08008664 @ =gLinkCallback
	ldr r1, [r2]
	cmp r1, 0
	bne _0800865E
	ldr r0, _08008668 @ =sub_8008454
	str r0, [r2]
	ldr r0, _0800866C @ =gLinkDummyBool
	strb r1, [r0]
_0800865E:
	pop {r0}
	bx r0
	.align 2, 0
_08008664: .4byte gLinkCallback
_08008668: .4byte sub_8008454
_0800866C: .4byte gLinkDummyBool
	thumb_func_end sub_8008480

	thumb_func_start sub_80084A4
sub_80084A4: @ 8008670
	push {lr}
	ldr r1, _08008688 @ =gLinkCallback
	ldr r0, [r1]
	cmp r0, 0
	bne _0800867E
	ldr r0, _0800868C @ =sub_80084C8
	str r0, [r1]
_0800867E:
	ldr r1, _08008690 @ =gLinkDummyBool
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08008688: .4byte gLinkCallback
_0800868C: .4byte sub_80084C8
_08008690: .4byte gLinkDummyBool
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
CB2_LinkError: @ 8008788
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetPaletteFadeControl
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl ResetTasks
	ldr r0, _08008804 @ =VBlankCB_LinkTest
	bl SetVBlankCallback
	ldr r4, _08008808 @ =gWindowConfig_81E7198
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r0, _0800880C @ =0x04000052
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
	ldr r0, _08008810 @ =gUnknown_3001BB4
	strb r1, [r0]
	ldr r0, _08008814 @ =Task_DestroySelf
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _08008818 @ =CB2_PrintErrorMessage
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008804: .4byte VBlankCB_LinkTest
_08008808: .4byte gWindowConfig_81E7198
_0800880C: .4byte 0x04000052
_08008810: .4byte gUnknown_3001BB4
_08008814: .4byte Task_DestroySelf
_08008818: .4byte CB2_PrintErrorMessage
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
GetSioMultiSI: @ 8008888
	ldr r0, _08008894 @ =0x04000128
	ldrh r0, [r0]
	lsrs r0, 2
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08008894: .4byte 0x04000128
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
IsLinkConnectionEstablished: @ 80088C0
	ldr r0, _080088CC @ =gLinkStatus
	ldr r0, [r0]
	lsrs r0, 6
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080088CC: .4byte gLinkStatus
	thumb_func_end IsLinkConnectionEstablished

	thumb_func_start SetSuppressLinkErrorMessage
SetSuppressLinkErrorMessage: @ 80088D0
	ldr r1, _080088D8 @ =gSuppressLinkErrorMessage
	strb r0, [r1]
	bx lr
	.align 2, 0
_080088D8: .4byte gSuppressLinkErrorMessage
	thumb_func_end SetSuppressLinkErrorMessage

	thumb_func_start HasLinkErrorOccurred
HasLinkErrorOccurred: @ 80088DC
	ldr r0, _080088E4 @ =gLinkErrorOccurred
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080088E4: .4byte gLinkErrorOccurred
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
ResetSerial: @ 8008A04
	push {lr}
	bl EnableSerial
	bl DisableSerial
	pop {r0}
	bx r0
	thumb_func_end ResetSerial

	thumb_func_start LinkMain1
LinkMain1: @ 8008A14
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, _08008A30 @ =gLink
	ldrb r0, [r0, 0x1]
	cmp r0, 0x4
	bhi _08008AC6
	lsls r0, 2
	ldr r1, _08008A34 @ =_08008A38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008A30: .4byte gLink
_08008A34: .4byte _08008A38
	.align 2, 0
_08008A38:
	.4byte _08008A4C
	.4byte _08008A5C
	.4byte _08008A74
	.4byte _08008AB0
	.4byte _08008ABA
_08008A4C:
	bl DisableSerial
	ldr r1, _08008A58 @ =gLink
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _08008AC6
	.align 2, 0
_08008A58: .4byte gLink
_08008A5C:
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08008AC6
	bl EnableSerial
	ldr r1, _08008A70 @ =gLink
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _08008AC6
	.align 2, 0
_08008A70: .4byte gLink
_08008A74:
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _08008A84
	cmp r1, 0x2
	beq _08008A9C
	bl CheckMasterOrSlave
	b _08008AC6
_08008A84:
	ldr r2, _08008A98 @ =gLink
	ldrb r0, [r2]
	cmp r0, 0x8
	bne _08008AC6
	ldrb r0, [r2, 0x3]
	cmp r0, 0x1
	bls _08008AC6
	strb r1, [r2, 0xE]
	b _08008AC6
	.align 2, 0
_08008A98: .4byte gLink
_08008A9C:
	ldr r0, _08008AA8 @ =gLink
	movs r1, 0
	strb r1, [r0, 0x1]
	ldr r0, _08008AAC @ =0x0400012a
	strh r1, [r0]
	b _08008AC6
	.align 2, 0
_08008AA8: .4byte gLink
_08008AAC: .4byte 0x0400012a
_08008AB0:
	bl InitTimer
	ldr r1, _08008B00 @ =gLink
	movs r0, 0x4
	strb r0, [r1, 0x1]
_08008ABA:
	adds r0, r5, 0
	bl EnqueueSendCmd
	adds r0, r6, 0
	bl DequeueRecvCmds
_08008AC6:
	movs r0, 0
	strb r0, [r4]
	ldr r1, _08008B00 @ =gLink
	ldrb r2, [r1, 0x2]
	ldrb r0, [r1, 0x3]
	lsls r0, 2
	orrs r2, r0
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _08008ADE
	movs r0, 0x20
	orrs r2, r0
_08008ADE:
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
	bne _08008B04
	movs r0, 0x40
	orrs r0, r3
	orrs r0, r2
	b _08008B08
	.align 2, 0
_08008B00: .4byte gLink
_08008B04:
	adds r0, r2, 0
	orrs r0, r3
_08008B08:
	orrs r0, r4
	orrs r0, r5
	orrs r0, r6
	orrs r0, r7
	adds r2, r0, 0
	ldrb r3, [r1, 0x13]
	cmp r3, 0x1
	bne _08008B1E
	movs r0, 0x80
	lsls r0, 9
	orrs r2, r0
_08008B1E:
	ldrb r0, [r1, 0x2]
	cmp r0, 0x3
	bls _08008B2A
	movs r0, 0x80
	lsls r0, 10
	orrs r2, r0
_08008B2A:
	adds r1, r2, 0
	cmp r3, 0x2
	bne _08008B36
	movs r0, 0x80
	lsls r0, 11
	orrs r1, r0
_08008B36:
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
LinkVSync: @ 8008DB8
	push {r4,lr}
	ldr r3, _08008DE0 @ =gLink
	ldrb r4, [r3]
	cmp r4, 0
	beq _08008DF4
	ldrb r0, [r3, 0x1]
	cmp r0, 0x2
	beq _08008DEE
	cmp r0, 0x4
	bne _08008E1E
	movs r0, 0xD
	ldrsb r0, [r3, r0]
	cmp r0, 0x8
	bgt _08008DE4
	ldrb r0, [r3, 0x10]
	cmp r0, 0x1
	beq _08008DEE
	movs r0, 0x1
	strb r0, [r3, 0x13]
	b _08008E1E
	.align 2, 0
_08008DE0: .4byte gLink
_08008DE4:
	ldrb r0, [r3, 0x13]
	cmp r0, 0x1
	beq _08008E1E
	movs r0, 0
	strb r0, [r3, 0xD]
_08008DEE:
	bl StartTransfer
	b _08008E1E
_08008DF4:
	ldrb r2, [r3, 0x1]
	cmp r2, 0x4
	beq _08008DFE
	cmp r2, 0x2
	bne _08008E1E
_08008DFE:
	ldr r1, _08008E24 @ =0x03000450
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bls _08008E1E
	cmp r2, 0x4
	bne _08008E16
	movs r0, 0x2
	strb r0, [r3, 0x13]
_08008E16:
	cmp r2, 0x2
	bne _08008E1E
	strb r4, [r3, 0x3]
	strb r4, [r3, 0xF]
_08008E1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008E24: .4byte 0x03000450
	thumb_func_end LinkVSync

	thumb_func_start Timer3Intr
Timer3Intr: @ 8008E28
	push {lr}
	bl StopTimer
	bl StartTransfer
	pop {r0}
	bx r0
	thumb_func_end Timer3Intr

	thumb_func_start SerialCB
SerialCB: @ 8008E38
	push {r4,lr}
	ldr r4, _08008E64 @ =gLink
	ldr r0, _08008E68 @ =0x04000128
	ldr r1, [r0]
	lsls r0, r1, 26
	lsrs r0, 30
	strb r0, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	beq _08008E6C
	cmp r0, 0x4
	bne _08008E8A
	lsls r0, r1, 25
	lsrs r0, 31
	strb r0, [r4, 0x10]
	bl DoRecv
	bl DoSend
	bl SendRecvDone
	b _08008E8A
	.align 2, 0
_08008E64: .4byte gLink
_08008E68: .4byte 0x04000128
_08008E6C:
	bl DoHandshake
	lsls r0, 24
	cmp r0, 0
	beq _08008E8A
	ldrb r0, [r4]
	cmp r0, 0
	beq _08008E86
	movs r0, 0x3
	strb r0, [r4, 0x1]
	movs r0, 0x8
	strb r0, [r4, 0xD]
	b _08008E8A
_08008E86:
	movs r0, 0x4
	strb r0, [r4, 0x1]
_08008E8A:
	ldr r3, _08008EB0 @ =gLink
	ldrb r0, [r3, 0xD]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r3, 0xD]
	ldr r1, _08008EB4 @ =0x03000450
	strb r2, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	bne _08008EAA
	ldr r0, _08008EB8 @ =gLastRecvQueueCount
	ldr r2, _08008EBC @ =0x00000fbd
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
_08008EAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08008EB0: .4byte gLink
_08008EB4: .4byte 0x03000450
_08008EB8: .4byte gLastRecvQueueCount
_08008EBC: .4byte 0x00000fbd
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
ResetSendBuffer: @ 80091FC
	push {r4-r6,lr}
	ldr r1, _08009244 @ =gLink
	ldr r2, _08009248 @ =0x00000339
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
	ldr r4, _0800924C @ =0x0000efff
_0800921A:
	movs r2, 0
	adds r1, r0, 0x1
	adds r3, r0, 0
	muls r3, r6
_08009222:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _08009222
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0800921A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009244: .4byte gLink
_08009248: .4byte 0x00000339
_0800924C: .4byte 0x0000efff
	thumb_func_end ResetSendBuffer

	thumb_func_start ResetRecvBuffer
ResetRecvBuffer: @ 8009250
	push {r4-r7,lr}
	ldr r1, _080092B0 @ =gLink
	ldr r2, _080092B4 @ =0x00000fbd
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _080092B8 @ =0x00000fbc
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, 0x64
	mov r12, r0
	movs r3, 0xCF
	lsls r3, 2
	adds r7, r1, r3
	ldr r6, _080092BC @ =0x0000efff
_0800926E:
	movs r3, 0
	lsls r0, r2, 1
	adds r5, r2, 0x1
	adds r0, r2
	lsls r0, 3
	adds r0, r2
	lsls r4, r0, 5
_0800927C:
	movs r2, 0
	adds r1, r3, 0x1
	mov r0, r12
	muls r0, r3
	adds r3, r0, 0
_08009286:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r4
	adds r0, r7
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x31
	bls _08009286
	lsls r0, r1, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _0800927C
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0800926E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080092B0: .4byte gLink
_080092B4: .4byte 0x00000fbd
_080092B8: .4byte 0x00000fbc
_080092BC: .4byte 0x0000efff
	thumb_func_end ResetRecvBuffer

	.align 2, 0 @ Don't pad with nop.
