	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8146900
sub_8146900: @ 8146CB0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8146900

	thumb_func_start sub_8146914
sub_8146914: @ 8146CC4
	push {lr}
	movs r2, 0
	ldr r1, _08146CDC
	ldrh r0, [r1, 0x1A]
	ldrh r1, [r1, 0x36]
	cmp r0, r1
	bne _08146CD4
	movs r2, 0x1
_08146CD4:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_08146CDC: .4byte gLinkPlayers
	thumb_func_end sub_8146914

	thumb_func_start CB2_InitMysteryEventMenu
CB2_InitMysteryEventMenu: @ 8146CE0
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _08146D4C
	bl SetVBlankCallback
	ldr r4, _08146D50
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08146D54
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	ldr r0, _08146D58
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146D4C: .4byte sub_8146900
_08146D50: .4byte gWindowConfig_81E6CE4
_08146D54: .4byte Task_DestroySelf
_08146D58: .4byte sub_81469E4
	thumb_func_end CB2_InitMysteryEventMenu

	thumb_func_start sub_81469AC
sub_81469AC: @ 8146D5C
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r5, 0x1
	cmp r4, 0
	bne _08146D70
	ldr r1, _08146D8C
	bl StringCopy
	movs r5, 0
_08146D70:
	cmp r4, 0x2
	bne _08146D76
	movs r5, 0
_08146D76:
	cmp r4, 0x1
	bne _08146D82
	ldr r1, _08146D90
	adds r0, r6, 0
	bl StringCopy
_08146D82:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08146D8C: .4byte gSystemText_EventLoadSuccess
_08146D90: .4byte gSystemText_LoadingError
	thumb_func_end sub_81469AC

	thumb_func_start sub_81469E4
sub_81469E4: @ 8146D94
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _08146DB4
	ldr r2, _08146DB8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x10
	bls _08146DA8
	b _08147154
_08146DA8:
	lsls r0, 2
	ldr r1, _08146DBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146DB4: .4byte gMain
_08146DB8: .4byte 0x0000043c
_08146DBC: .4byte _08146DC0
	.align 2, 0
_08146DC0:
	.4byte _08146E04
	.4byte _08146E1E
	.4byte _08146E4C
	.4byte _08146E84
	.4byte _08146EC8
	.4byte _08146ED6
	.4byte _08146F40
	.4byte _08147014
	.4byte _08147022
	.4byte _08147044
	.4byte _08147050
	.4byte _08147064
	.4byte _081470AC
	.4byte _081470C8
	.4byte _08147100
	.4byte _0814711C
	.4byte _08147144
_08146E04:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _08147128
_08146E1E:
	ldr r0, _08146E3C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08146E2C
	b _08147154
_08146E2C:
	ldr r0, _08146E40
	bl sub_8072044
	ldr r1, _08146E44
	ldr r2, _08146E48
	adds r1, r2
	b _08147132
	.align 2, 0
_08146E3C: .4byte gPaletteFade
_08146E40: .4byte gSystemText_LinkStandby
_08146E44: .4byte gMain
_08146E48: .4byte 0x0000043c
_08146E4C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146E58
	b _08147154
_08146E58:
	ldr r1, _08146E74
	ldr r0, _08146E78
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08146E7C
	ldr r2, _08146E80
	adds r0, r2, 0
	strh r0, [r1]
	bl OpenLink
	b _08147154
	.align 2, 0
_08146E74: .4byte gMain
_08146E78: .4byte 0x0000043c
_08146E7C: .4byte gLinkType
_08146E80: .4byte 0x00005501
_08146E84:
	ldr r0, _08146EB8
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08146E92
	b _08146FE8
_08146E92:
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bhi _08146E9C
	b _08146FE8
_08146E9C:
	movs r0, 0x15
	bl PlaySE
	ldr r0, _08146EBC
	bl sub_8072044
	ldr r1, _08146EC0
	ldr r0, _08146EC4
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146FE8
	.align 2, 0
_08146EB8: .4byte gLinkStatus
_08146EBC: .4byte gSystemText_LoadEventPressA
_08146EC0: .4byte gMain
_08146EC4: .4byte 0x0000043c
_08146EC8:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146ED4
	b _08147154
_08146ED4:
	b _0814712C
_08146ED6:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _08146FC0
	ldr r4, _08146F14
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146F20
	movs r0, 0x5
	bl PlaySE
	bl sub_8007F4C
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuDrawTextWindow
	ldr r0, _08146F18
	movs r1, 0x7
	movs r2, 0x6
	bl MenuPrint
	ldr r2, _08146F1C
	adds r1, r4, r2
	b _08147132
	.align 2, 0
_08146F14: .4byte gMain
_08146F18: .4byte gSystemText_LoadingEvent
_08146F1C: .4byte 0x0000043c
_08146F20:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08146F2A
	b _08147154
_08146F2A:
	movs r0, 0x5
	bl PlaySE
	bl CloseLink
	ldr r0, _08146F3C
	adds r1, r4, r0
	b _08147004
	.align 2, 0
_08146F3C: .4byte 0x0000043c
_08146F40:
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08146FE8
	ldr r0, _08146F88
	ldrb r0, [r0]
	cmp r0, 0
	bne _08146F54
	b _08147154
_08146F54:
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08146F98
	bl sub_800832C
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	ldr r4, _08146F8C
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146F90
	ldr r2, _08146F94
	adds r0, r2
	b _08146FD6
	.align 2, 0
_08146F88: .4byte gReceivedRemoteLinkPlayers
_08146F8C: .4byte gStringVar4
_08146F90: .4byte gMain
_08146F94: .4byte 0x0000043c
_08146F98:
	bl sub_8146914
	lsls r0, 24
	cmp r0, 0
	beq _08146FB0
	ldr r0, _08146FAC
	bl sub_8072044
	b _0814712C
	.align 2, 0
_08146FAC: .4byte gSystemText_DontCutLink
_08146FB0:
	bl CloseLink
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
_08146FC0:
	ldr r4, _08146FDC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146FE0
	ldr r1, _08146FE4
	adds r0, r1
_08146FD6:
	movs r1, 0xD
	strb r1, [r0]
	b _08147154
	.align 2, 0
_08146FDC: .4byte gStringVar4
_08146FE0: .4byte gMain
_08146FE4: .4byte 0x0000043c
_08146FE8:
	ldr r4, _0814700C
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08146FF6
	b _08147154
_08146FF6:
	movs r0, 0x5
	bl PlaySE
	bl CloseLink
	ldr r2, _08147010
	adds r1, r4, r2
_08147004:
	movs r0, 0xF
	strb r0, [r1]
	b _08147154
	.align 2, 0
_0814700C: .4byte gMain
_08147010: .4byte 0x0000043c
_08147014:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08147020
	b _08147154
_08147020:
	b _0814712C
_08147022:
	bl GetBlockReceivedStatus
	lsls r0, 24
	cmp r0, 0
	bne _0814702E
	b _08147154
_0814702E:
	bl ResetBlockReceivedFlags
	ldr r1, _0814703C
	ldr r2, _08147040
	adds r1, r2
	b _08147132
	.align 2, 0
_0814703C: .4byte gMain
_08147040: .4byte 0x0000043c
_08147044:
	ldr r0, _0814704C
	adds r1, r4, r0
	b _08147132
	.align 2, 0
_0814704C: .4byte 0x0000043c
_08147050:
	bl sub_800832C
	ldr r1, _0814705C
	ldr r2, _08147060
	adds r1, r2
	b _08147132
	.align 2, 0
_0814705C: .4byte gMain
_08147060: .4byte 0x0000043c
_08147064:
	ldr r0, _0814709C
	ldrb r6, [r0]
	cmp r6, 0
	bne _08147154
	ldr r5, _081470A0
	adds r0, r5, 0
	bl sub_812613C
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	str r6, [sp, 0x4]
	ldr r2, _081470A4
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _081470A8
	adds r1, r4, 0
	bl sub_81469AC
	lsls r0, 24
	cmp r0, 0
	bne _0814712C
	movs r0, 0
	bl sub_8125D44
	b _0814712C
	.align 2, 0
_0814709C: .4byte gReceivedRemoteLinkPlayers
_081470A0: .4byte 0x02000000
_081470A4: .4byte 0x050001f5
_081470A8: .4byte gStringVar4
_081470AC:
	ldr r0, _081470BC
	bl sub_8072044
	ldr r1, _081470C0
	ldr r2, _081470C4
	adds r1, r2
	b _08147132
	.align 2, 0
_081470BC: .4byte gStringVar4
_081470C0: .4byte gMain
_081470C4: .4byte 0x0000043c
_081470C8:
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08147154
	ldr r1, _081470F4
	ldr r0, _081470F8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _081470FC
	strb r2, [r0]
	b _08147154
	.align 2, 0
_081470F4: .4byte gMain
_081470F8: .4byte 0x0000043c
_081470FC: .4byte gUnknown_02039338
_08147100:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08147154
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08147118
	adds r1, r4, r2
	b _08147132
	.align 2, 0
_08147118: .4byte 0x0000043c
_0814711C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_08147128:
	bl BeginNormalPaletteFade
_0814712C:
	ldr r1, _0814713C
	ldr r0, _08147140
	adds r1, r0
_08147132:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08147154
	.align 2, 0
_0814713C: .4byte gMain
_08147140: .4byte 0x0000043c
_08147144:
	ldr r0, _081471AC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08147154
	bl DoSoftReset
_08147154:
	ldr r0, _081471B0
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08147194
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _08147194
	bl CloseLink
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	ldr r4, _081471B4
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _081471B8
	ldr r1, _081471BC
	adds r0, r1
	movs r1, 0xD
	strb r1, [r0]
_08147194:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081471AC: .4byte gPaletteFade
_081471B0: .4byte gLinkStatus
_081471B4: .4byte gStringVar4
_081471B8: .4byte gMain
_081471BC: .4byte 0x0000043c
	thumb_func_end sub_81469E4

	.align 2, 0 @ Don't pad with nop.
