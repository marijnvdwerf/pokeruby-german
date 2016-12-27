	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C2020
sub_80C2020: @ 80C21E4
	push {r4,r5,lr}
	movs r5, 0x80
	lsls r5, 19
	movs r0, 0x40
	strh r0, [r5]
	ldr r4, _080C22B4 @ =gWindowConfig_81E6FA0
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _080C22B8 @ =gMenuWindow
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _080C22BC @ =0x04000008
	movs r2, 0xF8
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080C22C0 @ =0x00001803
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080C22C4 @ =0x00001c03
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080C22C8 @ =0x00003a03
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080C22CC @ =0x0400004c
	movs r2, 0
	strh r2, [r0]
	adds r1, 0x3A
	ldr r3, _080C22D0 @ =0x00003f3f
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r3, 0x11
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080C22D4 @ =0x04000040
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	subs r0, 0x2
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	adds r0, 0xA
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	subs r0, 0x44
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	ldrh r0, [r5]
	movs r3, 0xFE
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080C22D8 @ =gUnknown_030042A4
	strh r2, [r0]
	ldr r0, _080C22DC @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r0, _080C22E0 @ =gUnknown_030042C0
	strh r2, [r0]
	ldr r0, _080C22E4 @ =gUnknown_030041B4
	strh r2, [r0]
	ldr r0, _080C22E8 @ =gUnknown_03004288
	strh r2, [r0]
	ldr r0, _080C22EC @ =gUnknown_03004280
	strh r2, [r0]
	ldr r0, _080C22F0 @ =gUnknown_030041B0
	strh r2, [r0]
	ldr r0, _080C22F4 @ =gUnknown_030041B8
	strh r2, [r0]
	ldr r0, _080C22F8 @ =gUnknown_030042C4
	strh r2, [r0]
	ldr r0, _080C22FC @ =gUnknown_03004240
	strh r2, [r0]
	ldr r0, _080C2300 @ =gUnknown_03004200
	strh r2, [r0]
	ldr r0, _080C2304 @ =gUnknown_03004244
	strh r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C22B4: .4byte gWindowConfig_81E6FA0
_080C22B8: .4byte gMenuWindow
_080C22BC: .4byte 0x04000008
_080C22C0: .4byte 0x00001803
_080C22C4: .4byte 0x00001c03
_080C22C8: .4byte 0x00003a03
_080C22CC: .4byte 0x0400004c
_080C22D0: .4byte 0x00003f3f
_080C22D4: .4byte 0x04000040
_080C22D8: .4byte gUnknown_030042A4
_080C22DC: .4byte gUnknown_030042A0
_080C22E0: .4byte gUnknown_030042C0
_080C22E4: .4byte gUnknown_030041B4
_080C22E8: .4byte gUnknown_03004288
_080C22EC: .4byte gUnknown_03004280
_080C22F0: .4byte gUnknown_030041B0
_080C22F4: .4byte gUnknown_030041B8
_080C22F8: .4byte gUnknown_030042C4
_080C22FC: .4byte gUnknown_03004240
_080C2300: .4byte gUnknown_03004200
_080C2304: .4byte gUnknown_03004244
	thumb_func_end sub_80C2020

	thumb_func_start sub_80C2144
sub_80C2144: @ 80C2308
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	ldr r0, _080C23D0 @ =gUnknown_08D1977C
	mov r12, r0
	movs r5, 0
	ldr r1, _080C23D4 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080C23D8 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_080C2326:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080C2326
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r12
	bl LZDecompressVram
	ldr r0, _080C23DC @ =gUnknown_08D1A490
	ldr r1, _080C23E0 @ =0x0600d000
	bl LZDecompressVram
	ldr r0, _080C23E4 @ =gUnknown_08D1A364
	ldr r1, _080C23E8 @ =0x0600e000
	bl LZDecompressVram
	ldr r0, _080C23EC @ =gUnknown_08D1A250
	ldr r1, _080C23F0 @ =0x0600f000
	bl LZDecompressVram
	bl sub_80C37E4
	ldr r0, _080C23F4 @ =gUnknown_08D1A618
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadCompressedPalette
	ldr r0, _080C23F8 @ =gWindowConfig_81E6FA0
	bl LoadFontDefaultPalette
	movs r6, 0
_080C2384:
	lsls r5, r6, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80C3990
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80C39E4
	movs r5, 0
	lsls r1, r6, 1
	adds r2, r6, 0x1
	mov r12, r2
	lsls r4, 24
	asrs r7, r4, 24
	adds r1, r6
	lsls r1, 6
	lsls r4, r0, 24
_080C23B0:
	ldr r6, _080C23FC @ =0x000060b2
	cmp r5, r7
	bge _080C23B8
	adds r6, 0x2
_080C23B8:
	asrs r2, r4, 24
	adds r0, r2, 0
	cmp r2, 0
	bge _080C23C2
	negs r0, r2
_080C23C2:
	cmp r5, r0
	bge _080C2404
	ldr r3, _080C2400 @ =0x000060a4
	cmp r2, 0
	bge _080C2406
	adds r3, 0x2
	b _080C2406
	.align 2, 0
_080C23D0: .4byte gUnknown_08D1977C
_080C23D4: .4byte 0x040000d4
_080C23D8: .4byte 0x85000400
_080C23DC: .4byte gUnknown_08D1A490
_080C23E0: .4byte 0x0600d000
_080C23E4: .4byte gUnknown_08D1A364
_080C23E8: .4byte 0x0600e000
_080C23EC: .4byte gUnknown_08D1A250
_080C23F0: .4byte 0x0600f000
_080C23F4: .4byte gUnknown_08D1A618
_080C23F8: .4byte gWindowConfig_81E6FA0
_080C23FC: .4byte 0x000060b2
_080C2400: .4byte 0x000060a4
_080C2404:
	ldr r3, _080C2428 @ =0x000060a2
_080C2406:
	ldr r2, _080C242C @ =0x0600c166
	adds r0, r1, r2
	strh r6, [r0]
	adds r2, 0x40
	adds r0, r1, r2
	strh r3, [r0]
	adds r1, 0x2
	adds r5, 0x1
	cmp r5, 0x9
	ble _080C23B0
	mov r6, r12
	cmp r6, 0x3
	ble _080C2384
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2428: .4byte 0x000060a2
_080C242C: .4byte 0x0600c166
	thumb_func_end sub_80C2144

	thumb_func_start sub_80C226C
sub_80C226C: @ 80C2430
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C244C @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	cmp r5, r0
	bne _080C2458
	ldr r0, _080C2450 @ =gUnknown_020238CC
	ldr r1, _080C2454 @ =gUnknown_083D17DC
	bl StringCopy
	adds r2, r0, 0
	b _080C245A
	.align 2, 0
_080C244C: .4byte gContestPlayerMonIndex
_080C2450: .4byte gUnknown_020238CC
_080C2454: .4byte gUnknown_083D17DC
_080C2458:
	ldr r2, _080C24AC @ =gUnknown_020238CC
_080C245A:
	movs r4, 0xFC
	strb r4, [r2]
	movs r0, 0x6
	strb r0, [r2, 0x1]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	lsls r6, r5, 6
	ldr r7, _080C24B0 @ =0x02038572
	adds r1, r6, r7
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r4, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x32
	strb r0, [r2, 0x2]
	adds r2, 0x3
	ldr r1, _080C24B4 @ =gUnknown_083D17E0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _080C24B8 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C24C0
	lsls r4, r5, 3
	subs r1, r4, r5
	lsls r1, 2
	ldr r0, _080C24BC @ =0x03002988
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	b _080C24CE
	.align 2, 0
_080C24AC: .4byte gUnknown_020238CC
_080C24B0: .4byte 0x02038572
_080C24B4: .4byte gUnknown_083D17E0
_080C24B8: .4byte gUnknown_0203869A
_080C24BC: .4byte 0x03002988
_080C24C0:
	adds r1, r7, 0
	adds r1, 0xB
	adds r1, r6, r1
	adds r0, r2, 0
	bl StringCopy
	lsls r4, r5, 3
_080C24CE:
	ldr r0, _080C24F8 @ =gMenuWindow
	ldr r1, _080C24FC @ =gUnknown_020238CC
	adds r2, r4, r5
	lsls r2, 18
	ldr r3, _080C2500 @ =0x03020000
	adds r2, r3
	lsrs r2, 16
	lsls r3, r5, 1
	adds r3, r5
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r3, 0x7
	bl sub_8003460
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C24F8: .4byte gMenuWindow
_080C24FC: .4byte gUnknown_020238CC
_080C2500: .4byte 0x03020000
	thumb_func_end sub_80C226C

	thumb_func_start sub_80C2340
sub_80C2340: @ 80C2504
	push {r4,lr}
	movs r4, 0
_080C2508:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80C226C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C2508
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C2340

	thumb_func_start sub_80C2358
sub_80C2358: @ 80C251C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080C25D0 @ =gPaletteFade
	ldrb r0, [r5, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5, 0x8]
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80C2020
	bl dp12_8087EA4
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl sub_80C2144
	bl sub_80C310C
	movs r0, 0
	movs r1, 0x1
	bl sub_80C30D4
	bl sub_80C2340
	ldr r4, _080C25D4 @ =0x02018000
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x18
	bl memset
	adds r0, r4, 0
	adds r0, 0x18
	movs r1, 0
	movs r2, 0x50
	bl memset
	bl sub_80C33DC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrb r1, [r5, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5, 0x8]
	ldr r0, _080C25D8 @ =sub_80C24F4
	movs r1, 0x5
	bl CreateTask
	strb r0, [r4, 0x2]
	ldr r0, _080C25DC @ =sub_80C2430
	bl SetMainCallback2
	ldr r1, _080C25E0 @ =gUnknown_03004200
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _080C25E4 @ =gUnknown_03004244
	ldr r2, _080C25E8 @ =0x000080a0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080C25EC @ =sub_80C2F28
	movs r1, 0x14
	bl CreateTask
	bl sub_80C3F00
	movs r0, 0xDF
	lsls r0, 1
	bl PlayBGM
	ldr r0, _080C25F0 @ =sub_80C2448
	bl SetVBlankCallback
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C25D0: .4byte gPaletteFade
_080C25D4: .4byte 0x02018000
_080C25D8: .4byte sub_80C24F4
_080C25DC: .4byte sub_80C2430
_080C25E0: .4byte gUnknown_03004200
_080C25E4: .4byte gUnknown_03004244
_080C25E8: .4byte 0x000080a0
_080C25EC: .4byte sub_80C2F28
_080C25F0: .4byte sub_80C2448
	thumb_func_end sub_80C2358

	thumb_func_start sub_80C2430
sub_80C2430: @ 80C25F4
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80C2430

	thumb_func_start sub_80C2448
sub_80C2448: @ 80C260C
	push {lr}
	ldr r1, _080C2684 @ =0x04000010
	ldr r0, _080C2688 @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C268C @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C2690 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C2694 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C2698 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C269C @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C26A0 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080C26A4 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x22
	ldr r0, _080C26A8 @ =gUnknown_030042C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080C26AC @ =gUnknown_03004240
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	ldr r0, _080C26B0 @ =gUnknown_03004200
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080C26B4 @ =gUnknown_03004244
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080C2684: .4byte 0x04000010
_080C2688: .4byte gUnknown_030042A4
_080C268C: .4byte gUnknown_030042A0
_080C2690: .4byte gUnknown_030042C0
_080C2694: .4byte gUnknown_030041B4
_080C2698: .4byte gUnknown_03004288
_080C269C: .4byte gUnknown_03004280
_080C26A0: .4byte gUnknown_030041B0
_080C26A4: .4byte gUnknown_030041B8
_080C26A8: .4byte gUnknown_030042C4
_080C26AC: .4byte gUnknown_03004240
_080C26B0: .4byte gUnknown_03004200
_080C26B4: .4byte gUnknown_03004244
	thumb_func_end sub_80C2448

	thumb_func_start sub_80C24F4
sub_80C24F4: @ 80C26B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	ldr r0, _080C26F0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C2712
	ldr r0, _080C26F4 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2704
	ldr r0, _080C26F8 @ =gOtherText_LinkStandby
	bl sub_80C3698
	ldr r1, _080C26FC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2700 @ =sub_80C255C
	str r1, [r0]
	b _080C2712
	.align 2, 0
_080C26F0: .4byte gPaletteFade
_080C26F4: .4byte gUnknown_0203869A
_080C26F8: .4byte gOtherText_LinkStandby
_080C26FC: .4byte gTasks
_080C2700: .4byte sub_80C255C
_080C2704:
	ldr r0, _080C2718 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C271C @ =sub_80C2600
	str r0, [r1]
_080C2712:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2718: .4byte gTasks
_080C271C: .4byte sub_80C2600
	thumb_func_end sub_80C24F4

	thumb_func_start sub_80C255C
sub_80C255C: @ 80C2720
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2758 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C2750
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C2750
	ldr r0, _080C275C @ =sub_80C25A4
	movs r1, 0
	bl CreateTask
	ldr r1, _080C2760 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2764 @ =TaskDummy
	str r1, [r0]
_080C2750:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2758: .4byte gReceivedRemoteLinkPlayers
_080C275C: .4byte sub_80C25A4
_080C2760: .4byte gTasks
_080C2764: .4byte TaskDummy
	thumb_func_end sub_80C255C

	thumb_func_start sub_80C25A4
sub_80C25A4: @ 80C2768
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C277C @ =sub_80C89DC
	ldr r2, _080C2780 @ =sub_80C25C0
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C277C: .4byte sub_80C89DC
_080C2780: .4byte sub_80C25C0
	thumb_func_end sub_80C25A4

	thumb_func_start sub_80C25C0
sub_80C25C0: @ 80C2784
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C27B0
	adds r0, r4, 0
	bl DestroyTask
	ldr r2, _080C27B8 @ =gTasks
	ldr r0, _080C27BC @ =0x02018000
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080C27C0 @ =sub_80C2600
	str r1, [r0]
	bl sub_80C3764
_080C27B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C27B8: .4byte gTasks
_080C27BC: .4byte 0x02018000
_080C27C0: .4byte sub_80C2600
	thumb_func_end sub_80C25C0

	thumb_func_start sub_80C2600
sub_80C2600: @ 80C27C4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C2808 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrh r1, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080C2818
	ldr r0, _080C280C @ =sub_80C2F64
	movs r1, 0x14
	bl CreateTask
	ldr r4, _080C2810 @ =gContestText_AnnounceResults
	ldr r0, _080C2814 @ =0x02018000
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	movs r2, 0x78
	b _080C286A
	.align 2, 0
_080C2808: .4byte gTasks
_080C280C: .4byte sub_80C2F64
_080C2810: .4byte gContestText_AnnounceResults
_080C2814: .4byte 0x02018000
_080C2818:
	cmp r0, 0x1
	bne _080C282C
	ldr r0, _080C2828 @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	bne _080C2898
	b _080C2840
	.align 2, 0
_080C2828: .4byte 0x02018000
_080C282C:
	cmp r0, 0x2
	bne _080C2848
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080C2898
	movs r0, 0
_080C2840:
	strh r0, [r5, 0xA]
	adds r0, r1, 0x1
	strh r0, [r5, 0x8]
	b _080C2898
_080C2848:
	cmp r0, 0x3
	bne _080C2884
	ldr r4, _080C2878 @ =gContestText_PreliminaryResults
	ldr r0, _080C287C @ =0x02018000
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C2880 @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
_080C286A:
	bl sub_80C34CC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080C2898
	.align 2, 0
_080C2878: .4byte gContestText_PreliminaryResults
_080C287C: .4byte 0x02018000
_080C2880: .4byte 0x0000ffff
_080C2884:
	cmp r0, 0x4
	bne _080C2898
	ldr r0, _080C28A0 @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x2
	bne _080C2898
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080C28A4 @ =sub_80C26E4
	str r0, [r5]
_080C2898:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C28A0: .4byte 0x02018000
_080C28A4: .4byte sub_80C26E4
	thumb_func_end sub_80C2600

	thumb_func_start sub_80C26E4
sub_80C26E4: @ 80C28A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C28CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C2908
	cmp r0, 0x1
	bgt _080C28D0
	cmp r0, 0
	beq _080C28D6
	b _080C292A
	.align 2, 0
_080C28CC: .4byte gTasks
_080C28D0:
	cmp r0, 0x2
	beq _080C2918
	b _080C292A
_080C28D6:
	ldr r5, _080C28FC @ =0x02018000
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _080C292A
	ldrh r1, [r4, 0xC]
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_80C40D4
	ldrb r0, [r5, 0x14]
	cmp r0, 0
	bne _080C2900
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080C292A
	.align 2, 0
_080C28FC: .4byte 0x02018000
_080C2900:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C292A
_080C2908:
	ldr r0, _080C2914 @ =0x02018000
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _080C292A
	strh r0, [r4, 0x8]
	b _080C292A
	.align 2, 0
_080C2914: .4byte 0x02018000
_080C2918:
	movs r0, 0x88
	lsls r0, 3
	bl sub_80C3520
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xC]
	ldr r0, _080C2930 @ =sub_80C2770
	str r0, [r4]
_080C292A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2930: .4byte sub_80C2770
	thumb_func_end sub_80C26E4

	thumb_func_start sub_80C2770
sub_80C2770: @ 80C2934
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r5, _080C2980 @ =0x02018000
	ldrb r3, [r5, 0x4]
	cmp r3, 0
	bne _080C2990
	ldr r1, _080C2984 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080C29A2
	strh r3, [r1, 0xA]
	ldr r4, _080C2988 @ =gContestText_Round2Results
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C298C @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	bl sub_80C34CC
	b _080C29A2
	.align 2, 0
_080C2980: .4byte 0x02018000
_080C2984: .4byte gTasks
_080C2988: .4byte gContestText_Round2Results
_080C298C: .4byte 0x0000ffff
_080C2990:
	cmp r3, 0x2
	bne _080C29A2
	ldr r0, _080C29A8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C29AC @ =sub_80C27EC
	str r0, [r1]
_080C29A2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C29A8: .4byte gTasks
_080C29AC: .4byte sub_80C27EC
	thumb_func_end sub_80C2770

	thumb_func_start sub_80C27EC
sub_80C27EC: @ 80C29B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C29D4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C2A10
	cmp r0, 0x1
	bgt _080C29D8
	cmp r0, 0
	beq _080C29DE
	b _080C2A30
	.align 2, 0
_080C29D4: .4byte gTasks
_080C29D8:
	cmp r0, 0x2
	beq _080C2A20
	b _080C2A30
_080C29DE:
	ldr r5, _080C2A04 @ =0x02018000
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _080C2A30
	ldrh r1, [r4, 0xC]
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_80C40D4
	ldrb r0, [r5, 0x14]
	cmp r0, 0
	bne _080C2A08
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080C2A30
	.align 2, 0
_080C2A04: .4byte 0x02018000
_080C2A08:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C2A30
_080C2A10:
	ldr r0, _080C2A1C @ =0x02018000
	ldrb r0, [r0, 0x14]
	cmp r0, 0
	bne _080C2A30
	strh r0, [r4, 0x8]
	b _080C2A30
	.align 2, 0
_080C2A1C: .4byte 0x02018000
_080C2A20:
	movs r0, 0x88
	lsls r0, 3
	bl sub_80C3520
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080C2A38 @ =sub_80C2878
	str r0, [r4]
_080C2A30:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2A38: .4byte sub_80C2878
	thumb_func_end sub_80C27EC

	thumb_func_start sub_80C2878
sub_80C2878: @ 80C2A3C
	push {r4-r7,lr}
	sub sp, 0x64
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C2A64 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x5
	bls _080C2A5A
	b _080C2C44
_080C2A5A:
	lsls r0, 2
	ldr r1, _080C2A68 @ =_080C2A6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C2A64: .4byte gTasks
_080C2A68: .4byte _080C2A6C
	.align 2, 0
_080C2A6C:
	.4byte _080C2A84
	.4byte _080C2AA4
	.4byte _080C2AC2
	.4byte _080C2AFC
	.4byte _080C2B60
	.4byte _080C2C34
_080C2A84:
	ldr r0, _080C2AA0 @ =0x02018000
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _080C2A8E
	b _080C2C44
_080C2A8E:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C2C44
	.align 2, 0
_080C2AA0: .4byte 0x02018000
_080C2AA4:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	beq _080C2ABC
	b _080C2C44
_080C2ABC:
	movs r0, 0
	strh r0, [r1, 0xA]
	b _080C2C0E
_080C2AC2:
	movs r4, 0
	lsls r6, r5, 2
	ldr r7, _080C2AF0 @ =gTasks
_080C2AC8:
	ldr r0, _080C2AF4 @ =sub_80C3A5C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r7
	ldr r0, _080C2AF8 @ =gUnknown_02038690
	adds r0, r4, r0
	ldrb r0, [r0]
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C2AC8
	b _080C2C06
	.align 2, 0
_080C2AF0: .4byte gTasks
_080C2AF4: .4byte sub_80C3A5C
_080C2AF8: .4byte gUnknown_02038690
_080C2AFC:
	ldr r0, _080C2B54 @ =0x02018000
	ldrb r0, [r0, 0x5]
	cmp r0, 0x4
	beq _080C2B06
	b _080C2C44
_080C2B06:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	beq _080C2B1E
	b _080C2C44
_080C2B1E:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldr r0, _080C2B58 @ =sub_80C3B30
	movs r1, 0xA
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r4, 0
	ldr r1, _080C2B5C @ =gUnknown_02038690
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C2B48
_080C2B3A:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080C2B48
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2B3A
_080C2B48:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0xE
	bl sub_80C3E60
	b _080C2C44
	.align 2, 0
_080C2B54: .4byte 0x02018000
_080C2B58: .4byte sub_80C3B30
_080C2B5C: .4byte gUnknown_02038690
_080C2B60:
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r2, r0, r2
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	adds r6, r1, 0
	cmp r0, 0x15
	bne _080C2C44
	movs r0, 0
	strh r0, [r2, 0xA]
	movs r4, 0
	ldr r2, _080C2BB8 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r1, _080C2BBC @ =gUnknown_0203869A
	ldr r3, _080C2BC0 @ =gStringVar1
	cmp r0, 0
	beq _080C2B98
_080C2B8A:
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080C2B98
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2B8A
_080C2B98:
	ldrb r1, [r1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2BC8
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r0, _080C2BC4 @ =0x03002988
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	lsls r4, 6
	b _080C2BD4
	.align 2, 0
_080C2BB8: .4byte gUnknown_02038690
_080C2BBC: .4byte gUnknown_0203869A
_080C2BC0: .4byte gStringVar1
_080C2BC4: .4byte 0x03002988
_080C2BC8:
	lsls r4, 6
	ldr r1, _080C2C18 @ =gUnknown_0203857D
	adds r1, r4, r1
	adds r0, r3, 0
	bl StringCopy
_080C2BD4:
	ldr r0, _080C2C1C @ =gStringVar2
	ldr r1, _080C2C20 @ =0x02038572
	adds r1, r4, r1
	bl StringCopy
	ldr r1, _080C2C24 @ =gContestText_PokeWon
	mov r0, sp
	bl StringExpandPlaceholders
	ldr r0, _080C2C28 @ =0x02018000
	ldrb r1, [r0]
	mov r0, sp
	bl sub_80C3158
	mov r0, sp
	bl sub_80C34AC
	lsls r0, 16
	asrs r0, 16
	ldr r2, _080C2C2C @ =0x0000ffff
	movs r3, 0x88
	lsls r3, 3
	movs r1, 0x90
	bl sub_80C34CC
_080C2C06:
	ldr r0, _080C2C30 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
_080C2C0E:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C2C44
	.align 2, 0
_080C2C18: .4byte gUnknown_0203857D
_080C2C1C: .4byte gStringVar2
_080C2C20: .4byte 0x02038572
_080C2C24: .4byte gContestText_PokeWon
_080C2C28: .4byte 0x02018000
_080C2C2C: .4byte 0x0000ffff
_080C2C30: .4byte gTasks
_080C2C34:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080C2C4C @ =sub_80C2A8C
	str r1, [r0]
_080C2C44:
	add sp, 0x64
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2C4C: .4byte sub_80C2A8C
	thumb_func_end sub_80C2878

	thumb_func_start sub_80C2A8C
sub_80C2A8C: @ 80C2C50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080C2C80 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _080C2C76
	b _080C2EC8
_080C2C76:
	lsls r0, 2
	ldr r1, _080C2C84 @ =_080C2C88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C2C80: .4byte gTasks
_080C2C84: .4byte _080C2C88
	.align 2, 0
_080C2C88:
	.4byte _080C2CA0
	.4byte _080C2DC8
	.4byte _080C2E18
	.4byte _080C2E28
	.4byte _080C2E6C
	.4byte _080C2EAC
_080C2CA0:
	ldr r1, _080C2D88 @ =gUnknown_030042C4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r1, _080C2D8C @ =gUnknown_03004240
	ldr r3, _080C2D90 @ =0x00005050
	adds r0, r3, 0
	strh r0, [r1]
	movs r1, 0
	ldr r3, _080C2D94 @ =gUnknown_02038690
	ldrb r0, [r3]
	lsls r4, r7, 2
	mov r10, r4
	ldr r2, _080C2D98 @ =gContestMons
	ldr r5, _080C2D9C @ =gMonFrontPicTable
	mov r12, r5
	ldr r4, _080C2DA0 @ =gMonFrontPicCoords
	mov r8, r4
	ldr r5, _080C2DA4 @ =gUnknown_081FAF4C
	mov r9, r5
	cmp r0, 0
	beq _080C2CD8
_080C2CCA:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _080C2CD8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C2CCA
_080C2CD8:
	lsls r1, 6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r1, r0
	ldr r4, [r0]
	adds r0, r2, 0
	adds r0, 0x3C
	adds r1, r0
	ldr r1, [r1]
	str r1, [sp, 0xC]
	lsls r0, r6, 3
	add r0, r12
	lsls r2, r6, 2
	add r2, r8
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	mov r5, r9
	ldr r3, [r5, 0x4]
	str r3, [sp]
	str r6, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r3, _080C2DA8 @ =0x02000000
	bl sub_800D334
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	adds r2, r4, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080C2DAC @ =gUnknown_02024E8C
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x2]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x50
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080C2DB0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r3, r2, r5
	strh r6, [r3, 0x30]
	ldrb r4, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	strb r1, [r3, 0x5]
	adds r5, 0x1C
	adds r2, r5
	ldr r1, _080C2DB4 @ =sub_80C3C44
	str r1, [r2]
	ldr r2, _080C2DA8 @ =0x02000000
	movs r3, 0xC0
	lsls r3, 9
	adds r1, r2, r3
	strb r0, [r1, 0x8]
	ldr r0, _080C2DB8 @ =gUnknown_083D17CC
	bl LoadCompressedObjectPic
	ldr r0, _080C2DBC @ =gUnknown_083D17D4
	bl LoadCompressedObjectPalette
	ldr r0, _080C2DC0 @ =sub_80C3D04
	movs r1, 0xA
	bl CreateTask
	ldr r0, _080C2DC4 @ =gTasks
	mov r4, r10
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C2EC8
	.align 2, 0
_080C2D88: .4byte gUnknown_030042C4
_080C2D8C: .4byte gUnknown_03004240
_080C2D90: .4byte 0x00005050
_080C2D94: .4byte gUnknown_02038690
_080C2D98: .4byte gContestMons
_080C2D9C: .4byte gMonFrontPicTable
_080C2DA0: .4byte gMonFrontPicCoords
_080C2DA4: .4byte gUnknown_081FAF4C
_080C2DA8: .4byte 0x02000000
_080C2DAC: .4byte gUnknown_02024E8C
_080C2DB0: .4byte gSprites
_080C2DB4: .4byte sub_80C3C44
_080C2DB8: .4byte gUnknown_083D17CC
_080C2DBC: .4byte gUnknown_083D17D4
_080C2DC0: .4byte sub_80C3D04
_080C2DC4: .4byte gTasks
_080C2DC8:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080C2EC8
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _080C2DF4
	movs r0, 0x20
	strh r0, [r4, 0xC]
_080C2DF4:
	ldrb r2, [r4, 0xC]
	ldr r3, _080C2E14 @ =gUnknown_03004240
	movs r0, 0x50
	subs r0, r2
	lsls r0, 8
	adds r1, r2, 0
	adds r1, 0x50
	orrs r0, r1
	strh r0, [r3]
	cmp r2, 0x20
	bne _080C2EC8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C2EC8
	.align 2, 0
_080C2E14: .4byte gUnknown_03004240
_080C2E18:
	ldr r0, _080C2E24 @ =0x02018000
	ldrb r0, [r0, 0x6]
	cmp r0, 0x1
	bne _080C2EC8
	b _080C2E94
	.align 2, 0
_080C2E24: .4byte 0x02018000
_080C2E28:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r4
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x79
	bne _080C2EC8
	movs r0, 0
	strh r0, [r3, 0xA]
	ldr r2, _080C2E60 @ =gSprites
	ldr r0, _080C2E64 @ =0x02018000
	ldrb r1, [r0, 0x8]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080C2E68 @ =sub_80C3CB8
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080C2EC8
	.align 2, 0
_080C2E60: .4byte gSprites
_080C2E64: .4byte 0x02018000
_080C2E68: .4byte sub_80C3CB8
_080C2E6C:
	ldr r0, _080C2EA4 @ =0x02018000
	ldrb r0, [r0, 0x6]
	cmp r0, 0x2
	bne _080C2EC8
	ldr r3, _080C2EA8 @ =gUnknown_03004240
	ldrh r0, [r3]
	lsrs r2, r0, 8
	adds r0, r2, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x50
	bls _080C2E86
	movs r2, 0x50
_080C2E86:
	lsls r1, r2, 8
	movs r0, 0xA0
	subs r0, r2
	orrs r1, r0
	strh r1, [r3]
	cmp r2, 0x50
	bne _080C2EC8
_080C2E94:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C2EC8
	.align 2, 0
_080C2EA4: .4byte 0x02018000
_080C2EA8: .4byte gUnknown_03004240
_080C2EAC:
	ldr r2, _080C2ED8 @ =0x02018000
	ldrb r0, [r2, 0x6]
	cmp r0, 0x2
	bne _080C2EC8
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x9]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
	strh r1, [r0, 0x8]
	ldr r1, _080C2EDC @ =sub_80C2D1C
	str r1, [r0]
_080C2EC8:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2ED8: .4byte 0x02018000
_080C2EDC: .4byte sub_80C2D1C
	thumb_func_end sub_80C2A8C

	thumb_func_start sub_80C2D1C
sub_80C2D1C: @ 80C2EE0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080C2F30 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080C2F2A
	ldr r0, _080C2F34 @ =gUnknown_0203869A
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	lsls r6, r7, 2
	cmp r0, 0
	bne _080C2F1E
	ldr r5, _080C2F38 @ =gContestMons
	movs r4, 0x3
_080C2F06:
	ldrh r0, [r5]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bge _080C2F06
_080C2F1E:
	ldr r0, _080C2F3C @ =gTasks
	adds r1, r6, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2F40 @ =sub_80C2D80
	str r0, [r1]
_080C2F2A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F30: .4byte gMain
_080C2F34: .4byte gUnknown_0203869A
_080C2F38: .4byte gContestMons
_080C2F3C: .4byte gTasks
_080C2F40: .4byte sub_80C2D80
	thumb_func_end sub_80C2D1C

	thumb_func_start sub_80C2D80
sub_80C2D80: @ 80C2F44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2F70 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C2F80
	ldr r0, _080C2F74 @ =gOtherText_LinkStandby
	bl sub_80C3698
	bl sub_800832C
	ldr r1, _080C2F78 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2F7C @ =sub_80C2DD8
	str r1, [r0]
	b _080C2F8E
	.align 2, 0
_080C2F70: .4byte gUnknown_0203869A
_080C2F74: .4byte gOtherText_LinkStandby
_080C2F78: .4byte gTasks
_080C2F7C: .4byte sub_80C2DD8
_080C2F80:
	ldr r0, _080C2F94 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C2F98 @ =sub_80C2E14
	str r0, [r1]
_080C2F8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F94: .4byte gTasks
_080C2F98: .4byte sub_80C2E14
	thumb_func_end sub_80C2D80

	thumb_func_start sub_80C2DD8
sub_80C2DD8: @ 80C2F9C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C2FC8 @ =gReceivedRemoteLinkPlayers
	ldrb r1, [r0]
	cmp r1, 0
	bne _080C2FC0
	ldr r0, _080C2FCC @ =gUnknown_0203869A
	strb r1, [r0]
	bl sub_80C3764
	ldr r1, _080C2FD0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C2FD4 @ =sub_80C2E14
	str r1, [r0]
_080C2FC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2FC8: .4byte gReceivedRemoteLinkPlayers
_080C2FCC: .4byte gUnknown_0203869A
_080C2FD0: .4byte gTasks
_080C2FD4: .4byte sub_80C2E14
	thumb_func_end sub_80C2DD8

	thumb_func_start sub_80C2E14
sub_80C2E14: @ 80C2FD8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080C3044 @ =gUnknown_02038690
	ldr r0, _080C3048 @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80BE284
	movs r0, 0x2
	bl sub_810FB10
	ldr r0, _080C304C @ =gScriptContestRank
	ldrb r0, [r0]
	bl sub_80B2A7C
	movs r0, 0xFE
	bl sub_80B2A7C
	ldr r4, _080C3050 @ =0x02000000
	ldr r0, _080C3054 @ =0x00015ddf
	adds r1, r4, r0
	movs r6, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0xFE
	movs r1, 0
	bl sub_80B2C4C
	ldr r1, _080C3058 @ =0x00015dde
	adds r4, r1
	strb r0, [r4]
	str r6, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldr r1, _080C305C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C3060 @ =sub_80C2EA0
	str r1, [r0]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3044: .4byte gUnknown_02038690
_080C3048: .4byte gContestPlayerMonIndex
_080C304C: .4byte gScriptContestRank
_080C3050: .4byte 0x02000000
_080C3054: .4byte 0x00015ddf
_080C3058: .4byte 0x00015dde
_080C305C: .4byte gTasks
_080C3060: .4byte sub_80C2EA0
	thumb_func_end sub_80C2E14

	thumb_func_start sub_80C2EA0
sub_80C2EA0: @ 80C3064
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	ldr r0, _080C309C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080C30DC
	ldr r1, _080C30A0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C30AC
	ldr r0, _080C30A4 @ =0x02018000
	ldrb r0, [r0, 0x3]
	bl DestroyTask
	ldr r0, _080C30A8 @ =0x0000ffff
	b _080C30B2
	.align 2, 0
_080C309C: .4byte gPaletteFade
_080C30A0: .4byte gTasks
_080C30A4: .4byte 0x02018000
_080C30A8: .4byte 0x0000ffff
_080C30AC:
	cmp r0, 0x1
	bne _080C30C8
	ldr r0, _080C30C4 @ =0xffff0000
_080C30B2:
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080C30DC
	.align 2, 0
_080C30C4: .4byte 0xffff0000
_080C30C8:
	ldr r0, _080C30E4 @ =0x04000050
	strh r3, [r0]
	adds r0, 0x4
	strh r3, [r0]
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _080C30E8 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080C30DC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C30E4: .4byte 0x04000050
_080C30E8: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C2EA0

	thumb_func_start sub_80C2F28
sub_80C2F28: @ 80C30EC
	push {r4,r5,lr}
	ldr r2, _080C3120 @ =gUnknown_030041B0
	ldrh r3, [r2]
	adds r0, r3, 0x2
	strh r0, [r2]
	ldr r4, _080C3124 @ =gUnknown_030041B8
	ldrh r5, [r4]
	adds r1, r5, 0x1
	strh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _080C310C
	adds r0, r3, 0
	subs r0, 0xFD
	strh r0, [r2]
_080C310C:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _080C311A
	adds r0, r5, 0
	subs r0, 0xFE
	strh r0, [r4]
_080C311A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3120: .4byte gUnknown_030041B0
_080C3124: .4byte gUnknown_030041B8
	thumb_func_end sub_80C2F28

	thumb_func_start sub_80C2F64
sub_80C2F64: @ 80C3128
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C3158 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080C31AA
	movs r0, 0
	strh r0, [r2, 0x8]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080C315C
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	b _080C3160
	.align 2, 0
_080C3158: .4byte gTasks
_080C315C:
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
_080C3160:
	strh r0, [r2, 0xA]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x10
	bne _080C3176
	movs r0, 0x1
	b _080C317A
_080C3176:
	cmp r0, 0
	bne _080C317C
_080C317A:
	strh r0, [r1, 0xC]
_080C317C:
	ldr r0, _080C31C4 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r2, [r4, 0xA]
	ldr r3, _080C31C8 @ =0x00002ede
	movs r0, 0x6B
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldr r3, _080C31CC @ =0x00007fff
	movs r0, 0x68
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldr r3, _080C31D0 @ =0x000077be
	movs r0, 0x6E
	movs r1, 0x1
	bl BlendPalette
_080C31AA:
	ldr r1, _080C31C4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r3, 0xA
	ldrsh r4, [r0, r3]
	cmp r4, 0
	bne _080C31D8
	ldr r0, _080C31D4 @ =0x02018000
	strb r4, [r0, 0xA]
	b _080C31DE
	.align 2, 0
_080C31C4: .4byte gTasks
_080C31C8: .4byte 0x00002ede
_080C31CC: .4byte 0x00007fff
_080C31D0: .4byte 0x000077be
_080C31D4: .4byte 0x02018000
_080C31D8:
	ldr r1, _080C31E4 @ =0x02018000
	movs r0, 0x1
	strb r0, [r1, 0xA]
_080C31DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C31E4: .4byte 0x02018000
	thumb_func_end sub_80C2F64

	thumb_func_start sub_80C3024
sub_80C3024: @ 80C31E8
	push {r4-r6,lr}
	ldr r6, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	cmp r3, 0
	beq _080C3274
	adds r1, r6, 0
	bl sub_809D4F4
	lsls r1, r5, 9
	adds r0, r1
	adds r0, 0x80
	lsls r1, r4, 9
	ldr r2, _080C3264 @ =0x06004000
	adds r1, r2
	ldr r2, _080C3268 @ =0x040000d4
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080C326C @ =0x84000060
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, r4, 0
	adds r1, 0xA
	lsls r1, 28
	lsls r0, r4, 20
	movs r2, 0x80
	lsls r2, 18
	adds r0, r2
	orrs r0, r1
	lsrs r1, r0, 16
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 21
	movs r2, 0x83
	lsls r2, 16
	adds r0, r2
	lsrs r5, r0, 16
	movs r2, 0
	ldr r6, _080C3270 @ =0x0600c000
_080C3240:
	lsls r0, r2, 5
	adds r4, r2, 0x1
	adds r0, r5
	movs r3, 0x3
	lsls r0, 1
	adds r2, r0, r6
_080C324C:
	strh r1, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C324C
	adds r2, r4, 0
	cmp r2, 0x2
	ble _080C3240
	b _080C328E
	.align 2, 0
_080C3264: .4byte 0x06004000
_080C3268: .4byte 0x040000d4
_080C326C: .4byte 0x84000060
_080C3270: .4byte 0x0600c000
_080C3274:
	adds r1, r6, 0
	bl sub_809D4F4
	lsls r1, r5, 9
	adds r0, r1
	adds r0, 0x80
	lsls r1, r4, 9
	ldr r2, _080C3294 @ =0x06004000
	adds r1, r2
	movs r2, 0xC0
	lsls r2, 1
	bl RequestSpriteCopy
_080C328E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3294: .4byte 0x06004000
	thumb_func_end sub_80C3024

	thumb_func_start sub_80C30D4
sub_80C30D4: @ 80C3298
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r5, 0
	ldr r4, _080C32CC @ =gContestMons
_080C32A8:
	ldrh r0, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r2, [r4, 0x38]
	str r2, [sp]
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_80C3024
	adds r4, 0x40
	adds r5, 0x1
	cmp r5, 0x3
	ble _080C32A8
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C32CC: .4byte gContestMons
	thumb_func_end sub_80C30D4

	thumb_func_start sub_80C310C
sub_80C310C: @ 80C32D0
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _080C3310 @ =gMonIconPaletteIndices
	movs r5, 0xA0
	lsls r5, 16
_080C32DA:
	ldr r1, _080C3314 @ =gContestMons
	lsls r0, r4, 6
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 5
	ldr r1, _080C3318 @ =gMonIconPalettes
	adds r0, r1
	lsrs r1, r5, 16
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 13
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C32DA
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3310: .4byte gMonIconPaletteIndices
_080C3314: .4byte gContestMons
_080C3318: .4byte gMonIconPalettes
	thumb_func_end sub_80C310C

	thumb_func_start sub_80C3158
sub_80C3158: @ 80C331C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r3, _080C3484 @ =gSprites
	adds r2, r3
	mov r1, sp
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r1]
	mov r4, sp
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x2]
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x4]
	movs r0, 0x32
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 22
	strh r0, [r4, 0x6]
	ldr r1, _080C3488 @ =gWindowConfig_81E7278
	mov r8, r1
	ldr r7, _080C348C @ =0x06010000
	ldr r2, _080C3490 @ =0x040000d4
	ldr r6, _080C3494 @ =0x85000100
	mov r1, sp
	movs r5, 0
	add r3, sp, 0x8
	movs r4, 0x3
_080C3392:
	ldrh r0, [r1]
	lsls r0, 5
	adds r0, r7
	str r5, [sp, 0x8]
	str r3, [r2]
	str r0, [r2, 0x4]
	str r6, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080C3392
	mov r0, r8
	mov r1, r9
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080C3498 @ =gUnknown_020238CC
	ldr r1, _080C349C @ =gUnknown_083D17E2
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	mvns r0, r5
	adds r1, r0, 0x1
	movs r0, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080C33DC
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	lsrs r0, r1, 1
	strb r0, [r2, 0x2]
	adds r2, 0x3
_080C33DC:
	adds r6, r5, 0x7
	movs r1, 0x8
	negs r1, r1
	adds r0, r1, 0
	ands r6, r0
	lsls r6, 24
	lsrs r5, r6, 24
	adds r0, r2, 0
	mov r1, r9
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	strb r5, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080C34A0 @ =0x02018068
	mov r10, r0
	ldr r1, _080C3498 @ =gUnknown_020238CC
	bl sub_80034D4
	mov r0, sp
	ldrh r4, [r0]
	lsls r4, 5
	ldr r1, _080C348C @ =0x06010000
	adds r7, r4, r1
	ldr r0, _080C34A4 @ =gUnknown_083D1624
	mov r9, r0
	ldr r1, _080C34A8 @ =0x04000008
	mov r8, r1
	adds r1, r7, 0
	mov r2, r8
	bl CpuSet
	mov r5, r9
	adds r5, 0x80
	ldr r0, _080C34AC @ =0x06010100
	adds r1, r4, r0
	adds r0, r5, 0
	mov r2, r8
	bl CpuSet
	ldr r0, _080C34B0 @ =0x06010200
	adds r1, r4, r0
	adds r0, r5, 0
	mov r2, r8
	bl CpuSet
	mov r0, r9
	adds r0, 0x40
	ldr r1, _080C34B4 @ =0x06010300
	adds r4, r1
	adds r1, r4, 0
	mov r2, r8
	bl CpuSet
	lsrs r5, r6, 27
	movs r4, 0
	cmp r4, r5
	bgt _080C3546
	mov r6, sp
	mov r0, r10
	adds r0, 0x20
	str r0, [sp, 0xC]
	mov r1, r10
	str r1, [sp, 0x10]
	ldr r0, _080C34B8 @ =0x0600fd20
	str r0, [sp, 0x14]
	ldr r1, _080C34BC @ =0x0600fe20
	str r1, [sp, 0x18]
	ldr r0, _080C34C0 @ =0x0600ff20
	mov r10, r0
	ldr r1, _080C34C4 @ =0x06010020
	mov r9, r1
_080C3476:
	cmp r4, 0x6
	bgt _080C34C8
	ldrh r0, [r6]
	lsls r0, 5
	mov r1, r9
	b _080C34E6
	.align 2, 0
_080C3484: .4byte gSprites
_080C3488: .4byte gWindowConfig_81E7278
_080C348C: .4byte 0x06010000
_080C3490: .4byte 0x040000d4
_080C3494: .4byte 0x85000100
_080C3498: .4byte gUnknown_020238CC
_080C349C: .4byte gUnknown_083D17E2
_080C34A0: .4byte 0x02018068
_080C34A4: .4byte gUnknown_083D1624
_080C34A8: .4byte 0x04000008
_080C34AC: .4byte 0x06010100
_080C34B0: .4byte 0x06010200
_080C34B4: .4byte 0x06010300
_080C34B8: .4byte 0x0600fd20
_080C34BC: .4byte 0x0600fe20
_080C34C0: .4byte 0x0600ff20
_080C34C4: .4byte 0x06010020
_080C34C8:
	cmp r4, 0xE
	bgt _080C34D4
	ldrh r0, [r6, 0x2]
	lsls r0, 5
	mov r1, r10
	b _080C34E6
_080C34D4:
	cmp r4, 0x16
	bgt _080C34E0
	ldrh r0, [r6, 0x4]
	lsls r0, 5
	ldr r1, [sp, 0x18]
	b _080C34E6
_080C34E0:
	ldrh r0, [r6, 0x6]
	lsls r0, 5
	ldr r1, [sp, 0x14]
_080C34E6:
	adds r7, r0, r1
	cmp r4, r5
	beq _080C3546
	ldr r0, _080C3594 @ =gUnknown_083D16E4
	adds r1, r7, 0
	mov r2, r8
	bl CpuSet
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r7, r0
	ldr r0, _080C3594 @ =gUnknown_083D16E4
	adds r0, 0x20
	mov r2, r8
	bl CpuSet
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	ldr r0, [sp, 0x10]
	mov r2, r8
	bl CpuSet
	movs r0, 0x80
	lsls r0, 2
	adds r1, r7, r0
	ldr r0, [sp, 0xC]
	mov r2, r8
	bl CpuSet
	ldr r1, [sp, 0xC]
	adds r1, 0x40
	str r1, [sp, 0xC]
	ldr r0, [sp, 0x10]
	adds r0, 0x40
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	adds r1, 0x20
	str r1, [sp, 0x14]
	ldr r0, [sp, 0x18]
	adds r0, 0x20
	str r0, [sp, 0x18]
	movs r1, 0x20
	add r10, r1
	add r9, r1
	adds r4, 0x1
	cmp r4, r5
	ble _080C3476
_080C3546:
	ldr r4, _080C3598 @ =gUnknown_083D1644
	ldr r5, _080C359C @ =0x04000008
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl CpuSet
	adds r6, r4, 0
	adds r6, 0x80
	movs r0, 0x80
	lsls r0, 1
	adds r1, r7, r0
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x80
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	adds r4, 0x40
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r7, r0
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3594: .4byte gUnknown_083D16E4
_080C3598: .4byte gUnknown_083D1644
_080C359C: .4byte 0x04000008
	thumb_func_end sub_80C3158

	thumb_func_start sub_80C33DC
sub_80C33DC: @ 80C35A0
	push {r4-r6,lr}
	sub sp, 0x20
	mov r1, sp
	ldr r0, _080C365C @ =gSpriteTemplate_83D174C
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	add r5, sp, 0x18
	ldr r6, _080C3660 @ =gUnknown_083D1764
	movs r4, 0x7
_080C35B6:
	adds r0, r6, 0
	bl LoadSpriteSheet
	adds r6, 0x8
	subs r4, 0x1
	cmp r4, 0
	bge _080C35B6
	ldr r0, _080C3664 @ =gUnknown_083D17A4
	bl LoadSpritePalette
	movs r4, 0
	mov r6, sp
_080C35CE:
	mov r0, sp
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x90
	movs r3, 0xA
	bl CreateSprite
	adds r1, r5, r4
	strb r0, [r1]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	adds r4, 0x1
	cmp r4, 0x7
	ble _080C35CE
	ldr r2, _080C3668 @ =gSprites
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x1]
	movs r3, 0
	strh r1, [r0, 0x2E]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x2]
	strh r1, [r0, 0x30]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x3]
	strh r1, [r0, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x5]
	strh r1, [r0, 0x2E]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x6]
	strh r1, [r0, 0x30]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r5, 0x7]
	strh r1, [r0, 0x32]
	ldr r1, _080C366C @ =0x02018000
	ldrb r0, [r5]
	strb r0, [r1]
	strb r3, [r1, 0x4]
	ldrb r0, [r5, 0x4]
	strb r0, [r1, 0x1]
	bl sub_80C3764
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C365C: .4byte gSpriteTemplate_83D174C
_080C3660: .4byte gUnknown_083D1764
_080C3664: .4byte gUnknown_083D17A4
_080C3668: .4byte gSprites
_080C366C: .4byte 0x02018000
	thumb_func_end sub_80C33DC

	thumb_func_start sub_80C34AC
sub_80C34AC: @ 80C3670
	push {lr}
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 25
	lsrs r1, 25
	movs r0, 0x70
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80C34AC

	thumb_func_start sub_80C34CC
sub_80C34CC: @ 80C3690
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r4, _080C36D8 @ =0x02018000
	mov r8, r4
	ldrb r5, [r4]
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r5, _080C36DC @ =gSprites
	adds r4, r5
	movs r6, 0
	movs r5, 0x88
	lsls r5, 1
	strh r5, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r6, [r4, 0x24]
	strh r6, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x20
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	strh r3, [r4, 0x3A]
	strh r6, [r4, 0x3C]
	ldr r0, _080C36E0 @ =sub_80C3588
	str r0, [r4, 0x1C]
	movs r0, 0x1
	mov r1, r8
	strb r0, [r1, 0x4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C36D8: .4byte 0x02018000
_080C36DC: .4byte gSprites
_080C36E0: .4byte sub_80C3588
	thumb_func_end sub_80C34CC

	thumb_func_start sub_80C3520
sub_80C3520: @ 80C36E4
	push {r4,r5,lr}
	ldr r4, _080C371C @ =0x02018000
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _080C3720 @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	movs r3, 0
	strh r2, [r1, 0x20]
	ldrh r2, [r1, 0x26]
	ldrh r5, [r1, 0x22]
	adds r2, r5
	strh r2, [r1, 0x22]
	strh r3, [r1, 0x26]
	strh r3, [r1, 0x24]
	strh r0, [r1, 0x3A]
	strh r3, [r1, 0x3C]
	ldr r0, _080C3724 @ =sub_80C3630
	str r0, [r1, 0x1C]
	movs r0, 0x3
	strb r0, [r4, 0x4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C371C: .4byte 0x02018000
_080C3720: .4byte gSprites
_080C3724: .4byte sub_80C3630
	thumb_func_end sub_80C3520

	thumb_func_start sub_80C3564
sub_80C3564: @ 80C3728
	movs r3, 0
	movs r2, 0
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r1, 0x90
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x26]
	strh r2, [r0, 0x24]
	ldr r1, _080C3744 @ =SpriteCallbackDummy
	str r1, [r0, 0x1C]
	ldr r0, _080C3748 @ =0x02018000
	strb r3, [r0, 0x4]
	bx lr
	.align 2, 0
_080C3744: .4byte SpriteCallbackDummy
_080C3748: .4byte 0x02018000
	thumb_func_end sub_80C3564

	thumb_func_start sub_80C3588
sub_80C3588: @ 80C374C
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	ldrh r0, [r3, 0x3C]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r3, 0x3C]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r3, 0x36]
	movs r4, 0x36
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _080C3776
	strh r2, [r3, 0x20]
_080C3776:
	movs r4, 0
	ldr r6, _080C37B8 @ =gSprites
	movs r5, 0x40
	adds r2, r3, 0
	adds r2, 0x2E
_080C3780:
	movs r7, 0
	ldrsh r0, [r2, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r3, 0x24]
	ldrh r7, [r3, 0x20]
	adds r0, r7
	adds r0, r5
	strh r0, [r1, 0x20]
	adds r5, 0x40
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _080C3780
	movs r0, 0x20
	ldrsh r1, [r3, r0]
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _080C37B0
	ldr r0, _080C37BC @ =sub_80C35FC
	str r0, [r3, 0x1C]
_080C37B0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C37B8: .4byte gSprites
_080C37BC: .4byte sub_80C35FC
	thumb_func_end sub_80C3588

	thumb_func_start sub_80C35FC
sub_80C35FC: @ 80C37C0
	push {lr}
	adds r2, r0, 0
	ldr r0, _080C37EC @ =0x02018000
	movs r1, 0x2
	strb r1, [r0, 0x4]
	ldrh r3, [r2, 0x38]
	ldr r1, _080C37F0 @ =0xffff0000
	lsrs r0, r1, 16
	cmp r3, r0
	beq _080C37E8
	subs r0, r3, 0x1
	strh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 16
	asrs r1, 16
	cmp r0, r1
	bne _080C37E8
	ldrh r0, [r2, 0x3A]
	bl sub_80C3520
_080C37E8:
	pop {r0}
	bx r0
	.align 2, 0
_080C37EC: .4byte 0x02018000
_080C37F0: .4byte 0xffff0000
	thumb_func_end sub_80C35FC

	thumb_func_start sub_80C3630
sub_80C3630: @ 80C37F4
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	ldrh r0, [r3, 0x3C]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x3C]
	movs r4, 0
	ldr r6, _080C3858 @ =gSprites
	movs r5, 0x40
	adds r2, r3, 0
	adds r2, 0x2E
_080C3818:
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r3, 0x24]
	ldrh r7, [r3, 0x20]
	adds r0, r7
	adds r0, r5
	strh r0, [r1, 0x20]
	adds r5, 0x40
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _080C3818
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	movs r2, 0x24
	ldrsh r1, [r3, r2]
	adds r0, r1
	movs r1, 0xE0
	negs r1, r1
	cmp r0, r1
	bge _080C3850
	adds r0, r3, 0
	bl sub_80C3564
_080C3850:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3858: .4byte gSprites
	thumb_func_end sub_80C3630

	thumb_func_start sub_80C3698
sub_80C3698: @ 80C385C
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080C3910 @ =0x02018000
	ldrb r1, [r5, 0x1]
	bl sub_80C3158
	adds r0, r4, 0
	bl sub_80C34AC
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r5, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r3, _080C3914 @ =gSprites
	adds r4, r1, r3
	adds r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x50
	strh r0, [r4, 0x22]
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r5]
	movs r5, 0
	adds r6, r3, 0
	mov r12, r2
	movs r3, 0x40
_080C389E:
	lsls r0, r5, 1
	adds r2, r4, 0
	adds r2, 0x2E
	adds r2, r0
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r4, 0x24]
	ldrh r7, [r4, 0x20]
	adds r0, r7
	adds r0, r3
	strh r0, [r1, 0x20]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x22]
	strh r1, [r0, 0x22]
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	adds r3, 0x40
	adds r5, 0x1
	cmp r5, 0x2
	ble _080C389E
	ldr r1, _080C3918 @ =gUnknown_030042C4
	movs r0, 0xF0
	strh r0, [r1]
	ldr r2, _080C391C @ =gUnknown_03004240
	ldrh r1, [r4, 0x22]
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 8
	adds r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080C3920 @ =0x04000048
	ldr r2, _080C3924 @ =0x00003f3e
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3910: .4byte 0x02018000
_080C3914: .4byte gSprites
_080C3918: .4byte gUnknown_030042C4
_080C391C: .4byte gUnknown_03004240
_080C3920: .4byte 0x04000048
_080C3924: .4byte 0x00003f3e
	thumb_func_end sub_80C3698

	thumb_func_start sub_80C3764
sub_80C3764: @ 80C3928
	push {r4-r7,lr}
	ldr r0, _080C398C @ =0x02018000
	ldrb r0, [r0, 0x1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r3, _080C3990 @ =gSprites
	adds r2, r3
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r7, _080C3994 @ =gUnknown_030042C4
	ldr r6, _080C3998 @ =gUnknown_03004240
	adds r5, r3, 0
	movs r4, 0x4
	adds r2, 0x2E
	movs r3, 0x2
_080C3954:
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3954
	movs r1, 0
	strh r1, [r7]
	strh r1, [r6]
	ldr r0, _080C399C @ =0x04000040
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _080C39A0 @ =0x04000048
	ldr r2, _080C39A4 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C398C: .4byte 0x02018000
_080C3990: .4byte gSprites
_080C3994: .4byte gUnknown_030042C4
_080C3998: .4byte gUnknown_03004240
_080C399C: .4byte 0x04000040
_080C39A0: .4byte 0x04000048
_080C39A4: .4byte 0x00003f3f
	thumb_func_end sub_80C3764

	thumb_func_start de_sub_80C39A8
de_sub_80C39A8: @ 80C39A8
	push {r4,lr}
	sub sp, 0x10
	adds r1, r0, 0
	ldr r0, _080C39DC @ =gUnknown_0203869A
	ldrb r0, [r0]
	movs r4, 0x1
	ands r4, r0
	cmp r4, 0
	beq _080C39E8
	ldr r0, _080C39E0 @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080C39E4 @ =gUnknown_08E964B8
	movs r2, 0xB
	str r2, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	movs r2, 0x8
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x8
	b _080C3A74
	.align 2, 0
_080C39DC: .4byte gUnknown_0203869A
_080C39E0: .4byte 0x0600e000
_080C39E4: .4byte gUnknown_08E964B8
_080C39E8:
	ldr r0, _080C3A08 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r0, 0
	bne _080C3A14
	ldr r0, _080C3A0C @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080C3A10 @ =gUnknown_08E964B8
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r2, 0xB
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	b _080C3A6C
	.align 2, 0
_080C3A08: .4byte gScriptContestRank
_080C3A0C: .4byte 0x0600e000
_080C3A10: .4byte gUnknown_08E964B8
_080C3A14:
	cmp r0, 0x1
	bne _080C3A2C
	ldr r0, _080C3A24 @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080C3A28 @ =gUnknown_08E964B8
	movs r2, 0xB
	b _080C3A3A
	.align 2, 0
_080C3A24: .4byte 0x0600e000
_080C3A28: .4byte gUnknown_08E964B8
_080C3A2C:
	cmp r0, 0x2
	bne _080C3A58
	ldr r0, _080C3A50 @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080C3A54 @ =gUnknown_08E964B8
	movs r2, 0x15
_080C3A3A:
	str r2, [sp]
	str r4, [sp, 0x4]
	movs r2, 0xA
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0xA
	b _080C3A74
	.align 2, 0
_080C3A50: .4byte 0x0600e000
_080C3A54: .4byte gUnknown_08E964B8
_080C3A58:
	ldr r0, _080C3A7C @ =0x0600e000
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080C3A80 @ =gUnknown_08E964B8
	str r4, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	movs r2, 0xB
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
_080C3A6C:
	movs r2, 0
	bl sub_809D104
	movs r0, 0xB
_080C3A74:
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C3A7C: .4byte 0x0600e000
_080C3A80: .4byte gUnknown_08E964B8
	thumb_func_end de_sub_80C39A8

	thumb_func_start de_sub_80C3A84
de_sub_80C3A84: @ 80C3A84
	push {r4,lr}
	sub sp, 0x10
	adds r2, r0, 0
	ldr r0, _080C3AAC @ =gScriptContestCategory
	ldrh r4, [r0]
	cmp r4, 0
	bne _080C3AB8
	str r4, [r1]
	ldr r0, _080C3AB0 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _080C3AB4 @ =gUnknown_08E964B8
	movs r2, 0x13
	str r2, [sp]
	movs r4, 0x3
	str r4, [sp, 0x4]
	movs r2, 0x7
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
	b _080C3AD6
	.align 2, 0
_080C3AAC: .4byte gScriptContestCategory
_080C3AB0: .4byte 0x0600e000
_080C3AB4: .4byte gUnknown_08E964B8
_080C3AB8:
	cmp r4, 0x1
	bne _080C3AE8
	str r4, [r1]
	ldr r0, _080C3AE0 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _080C3AE4 @ =gUnknown_08E964B8
	movs r2, 0
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	movs r2, 0x7
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
_080C3AD6:
	movs r2, 0
	bl sub_809D104
	movs r0, 0x7
	b _080C3B68
	.align 2, 0
_080C3AE0: .4byte 0x0600e000
_080C3AE4: .4byte gUnknown_08E964B8
_080C3AE8:
	cmp r4, 0x2
	bne _080C3B18
	str r4, [r1]
	ldr r0, _080C3B10 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _080C3B14 @ =gUnknown_08E964B8
	movs r2, 0x7
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	movs r2, 0x4
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x4
	b _080C3B68
	.align 2, 0
_080C3B10: .4byte 0x0600e000
_080C3B14: .4byte gUnknown_08E964B8
_080C3B18:
	cmp r4, 0x3
	bne _080C3B44
	str r4, [r1]
	ldr r0, _080C3B3C @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _080C3B40 @ =gUnknown_08E964B8
	movs r2, 0xB
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x6
	b _080C3B68
	.align 2, 0
_080C3B3C: .4byte 0x0600e000
_080C3B40: .4byte gUnknown_08E964B8
_080C3B44:
	movs r0, 0x4
	str r0, [r1]
	ldr r0, _080C3B70 @ =0x0600e000
	lsls r1, r2, 16
	lsrs r1, 16
	ldr r3, _080C3B74 @ =gUnknown_08E964B8
	movs r2, 0x11
	str r2, [sp]
	movs r2, 0x6
	str r2, [sp, 0x4]
	movs r2, 0x5
	str r2, [sp, 0x8]
	movs r2, 0x3
	str r2, [sp, 0xC]
	movs r2, 0
	bl sub_809D104
	movs r0, 0x5
_080C3B68:
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C3B70: .4byte 0x0600e000
_080C3B74: .4byte gUnknown_08E964B8
	thumb_func_end de_sub_80C3A84

	thumb_func_start sub_80C37E4
sub_80C37E4: @ 80C3B78
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x6
	bl de_sub_80C39A8
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x6
	mov r1, sp
	bl de_sub_80C3A84
	ldr r5, _080C3BB8 @ =0x00000fff
	ldr r0, [sp]
	lsls r4, r0, 12
	ldr r2, _080C3BBC @ =0x0600e000
	movs r3, 0x7F
_080C3B98:
	ldrh r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r2]
	ldrh r1, [r2]
	adds r0, r4, 0
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3B98
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BB8: .4byte 0x00000fff
_080C3BBC: .4byte 0x0600e000
	thumb_func_end sub_80C37E4

	thumb_func_start sub_80C3990
sub_80C3990: @ 80C3BC0
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r1, _080C3C0C @ =gUnknown_02038670
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x3F
	bl __udivsi3
	adds r1, r0, 0
	ldr r0, _080C3C10 @ =0x0000ffff
	ands r0, r1
	cmp r0, 0
	beq _080C3BEC
	movs r0, 0x80
	lsls r0, 9
	adds r1, r0
_080C3BEC:
	lsrs r1, 16
	cmp r1, 0
	bne _080C3BF8
	cmp r4, 0
	beq _080C3BF8
	movs r1, 0x1
_080C3BF8:
	cmp r5, 0
	beq _080C3C02
	cmp r1, 0xA
	bls _080C3C02
	movs r1, 0xA
_080C3C02:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C3C0C: .4byte gUnknown_02038670
_080C3C10: .4byte 0x0000ffff
	thumb_func_end sub_80C3990

	thumb_func_start sub_80C39E4
sub_80C39E4: @ 80C3C14
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080C3C74 @ =gUnknown_02038688
	lsls r0, r5, 1
	adds r0, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0
	bge _080C3C30
	negs r0, r0
_080C3C30:
	lsls r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x50
	bl __udivsi3
	adds r2, r0, 0
	ldr r0, _080C3C78 @ =0x0000ffff
	ands r0, r2
	cmp r0, 0
	beq _080C3C4A
	movs r0, 0x80
	lsls r0, 9
	adds r2, r0
_080C3C4A:
	lsrs r2, 16
	cmp r2, 0
	bne _080C3C56
	cmp r4, 0
	beq _080C3C56
	movs r2, 0x1
_080C3C56:
	cmp r6, 0
	beq _080C3C60
	cmp r2, 0xA
	bls _080C3C60
	movs r2, 0xA
_080C3C60:
	lsls r0, r5, 1
	adds r0, r7
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _080C3C7C
	negs r0, r2
	lsls r0, 24
	b _080C3C7E
	.align 2, 0
_080C3C74: .4byte gUnknown_02038688
_080C3C78: .4byte 0x0000ffff
_080C3C7C:
	lsls r0, r2, 24
_080C3C7E:
	lsrs r0, 24
	lsls r0, 24
	asrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C39E4

	thumb_func_start sub_80C3A5C
sub_80C3A5C: @ 80C3C8C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _080C3CC0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0x1C]
	movs r1, 0x1C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080C3CC4
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	movs r1, 0x3
	subs r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	strh r0, [r3, 0x1E]
	adds r0, r2, 0x1
	strh r0, [r3, 0x1C]
	b _080C3D42
	.align 2, 0
_080C3CC0: .4byte gTasks
_080C3CC4:
	cmp r0, 0x1
	bne _080C3D42
	ldrh r0, [r3, 0x1E]
	subs r0, 0x1
	strh r0, [r3, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080C3D42
	movs r0, 0x8
	ldrsh r2, [r3, r0]
	lsls r2, 17
	ldr r1, _080C3D48 @ =0x50430000
	adds r2, r1
	lsrs r2, 16
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3D4C @ =0x0600e142
	adds r0, r1
	strh r2, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3D50 @ =0x0600e144
	adds r0, r1
	adds r1, r2, 0x1
	strh r1, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3D54 @ =0x0600e182
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x10
	strh r1, [r0]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 6
	ldr r1, _080C3D58 @ =0x0600e184
	adds r0, r1
	adds r2, 0x11
	strh r2, [r0]
	ldr r1, _080C3D5C @ =0x02018000
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0x18
	bl PlaySE
_080C3D42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D48: .4byte 0x50430000
_080C3D4C: .4byte 0x0600e142
_080C3D50: .4byte 0x0600e144
_080C3D54: .4byte 0x0600e182
_080C3D58: .4byte 0x0600e184
_080C3D5C: .4byte 0x02018000
	thumb_func_end sub_80C3A5C

	thumb_func_start sub_80C3B30
sub_80C3B30: @ 80C3D60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r5, 0
	ldr r1, _080C3DF0 @ =gUnknown_02038690
	ldrb r0, [r1]
	ldr r2, _080C3DF4 @ =gTasks
	mov r10, r2
	cmp r0, 0
	beq _080C3D8C
_080C3D7E:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _080C3D8C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C3D7E
_080C3D8C:
	movs r1, 0
	lsls r0, r5, 1
	mov r2, r12
	lsls r2, 2
	mov r9, r2
	adds r0, r5
	lsls r0, 5
	mov r8, r0
	ldr r7, _080C3DF8 @ =0x00000fff
	movs r0, 0x90
	lsls r0, 8
	adds r6, r0, 0
_080C3DA4:
	lsls r0, r1, 5
	adds r4, r1, 0x1
	add r0, r8
	movs r3, 0x1D
	lsls r0, 1
	ldr r1, _080C3DFC @ =0x0600e100
	adds r2, r0, r1
_080C3DB2:
	ldrh r1, [r2]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2]
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C3DB2
	adds r1, r4, 0
	cmp r1, 0x2
	ble _080C3DA4
	mov r0, r9
	add r0, r12
	lsls r0, 3
	add r0, r10
	strh r5, [r0, 0x1C]
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r2, _080C3E00 @ =sub_80C3BD8
	str r2, [r0]
	mov r1, r12
	ldr r0, _080C3E04 @ =0x02018000
	strb r1, [r0, 0x3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3DF0: .4byte gUnknown_02038690
_080C3DF4: .4byte gTasks
_080C3DF8: .4byte 0x00000fff
_080C3DFC: .4byte 0x0600e100
_080C3E00: .4byte sub_80C3BD8
_080C3E04: .4byte 0x02018000
	thumb_func_end sub_80C3B30

	thumb_func_start sub_80C3BD8
sub_80C3BD8: @ 80C3E08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C3E54 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0x1
	bne _080C3E6C
	movs r0, 0
	strh r0, [r4, 0x1E]
	ldrh r2, [r4, 0x20]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080C3E58 @ =0x00006f8d
	movs r0, 0x91
	movs r1, 0x1
	bl BlendPalette
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C3E5C
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080C3E6C
	strh r5, [r4, 0x22]
	b _080C3E6C
	.align 2, 0
_080C3E54: .4byte gTasks
_080C3E58: .4byte 0x00006f8d
_080C3E5C:
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080C3E6C
	strh r0, [r4, 0x22]
_080C3E6C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C3BD8

	thumb_func_start sub_80C3C44
sub_80C3C44: @ 80C3E74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x9
	bgt _080C3E9C
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080C3ED8
	ldrh r0, [r4, 0x30]
	movs r1, 0
	bl PlayCry1
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080C3ED8
_080C3E9C:
	movs r0, 0xC0
	lsls r0, 3
	adds r2, r0, 0
	ldrh r1, [r4, 0x30]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	bgt _080C3EC2
	movs r0, 0x78
	strh r0, [r4, 0x20]
_080C3EC2:
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	bne _080C3ED8
	ldr r0, _080C3EE0 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r1, _080C3EE4 @ =0x02018000
	movs r0, 0x1
	strb r0, [r1, 0x6]
_080C3ED8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3EE0: .4byte SpriteCallbackDummy
_080C3EE4: .4byte 0x02018000
	thumb_func_end sub_80C3C44

	thumb_func_start sub_80C3CB8
sub_80C3CB8: @ 80C3EE8
	push {lr}
	adds r3, r0, 0
	movs r0, 0xC0
	lsls r0, 3
	adds r2, r0, 0
	ldrh r0, [r3, 0x30]
	adds r2, r0
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x20]
	subs r0, r1
	strh r0, [r3, 0x20]
	movs r1, 0xFF
	ands r2, r1
	strh r2, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080C3F28
	ldr r0, _080C3F2C @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080C3F30 @ =0x02018000
	movs r0, 0x2
	strb r0, [r1, 0x6]
_080C3F28:
	pop {r0}
	bx r0
	.align 2, 0
_080C3F2C: .4byte SpriteCallbackDummy
_080C3F30: .4byte 0x02018000
	thumb_func_end sub_80C3CB8

	thumb_func_start sub_80C3D04
sub_80C3D04: @ 80C3F34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080C4008 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080C3FEE
	movs r0, 0
	strh r0, [r1, 0x8]
	ldr r0, _080C400C @ =0x02018000
	mov r8, r0
	ldrb r0, [r0, 0x7]
	cmp r0, 0x27
	bhi _080C3FEE
	ldr r4, _080C4010 @ =gSpriteTemplate_83D17B4
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r1, r0, 0
	subs r1, 0x14
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x2C
	movs r3, 0x5
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	ldr r1, _080C4014 @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r1
	lsls r0, 23
	lsrs r0, 23
	strh r0, [r5, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	adds r0, 0x10
	strh r0, [r5, 0x30]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xFF
	ands r0, r1
	adds r0, 0x30
	strh r0, [r5, 0x32]
	bl Random
	ldrh r6, [r5, 0x4]
	lsls r4, r6, 22
	lsrs r4, 22
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r4, r0
	ldr r1, _080C4018 @ =0x000003ff
	adds r0, r1, 0
	ands r4, r0
	ldr r0, _080C401C @ =0xfffffc00
	ands r0, r6
	orrs r0, r4
	strh r0, [r5, 0x4]
	mov r1, r8
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
_080C3FEE:
	ldr r0, _080C400C @ =0x02018000
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _080C3FFC
	adds r0, r7, 0
	bl DestroyTask
_080C3FFC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4008: .4byte gTasks
_080C400C: .4byte 0x02018000
_080C4010: .4byte gSpriteTemplate_83D17B4
_080C4014: .4byte gSprites
_080C4018: .4byte 0x000003ff
_080C401C: .4byte 0xfffffc00
	thumb_func_end sub_80C3D04

	thumb_func_start sub_80C3DF0
sub_80C3DF0: @ 80C4020
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x32]
	ldrh r0, [r4, 0x36]
	adds r1, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x36]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	ldr r5, _080C408C @ =0x02018000
	ldrb r0, [r5, 0x9]
	cmp r0, 0
	beq _080C406A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080C406A:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0xF8
	bgt _080C407A
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x74
	ble _080C4086
_080C407A:
	adds r0, r4, 0
	bl DestroySprite
	ldrb r0, [r5, 0x7]
	subs r0, 0x1
	strb r0, [r5, 0x7]
_080C4086:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C408C: .4byte 0x02018000
	thumb_func_end sub_80C3DF0

	thumb_func_start sub_80C3E60
sub_80C3E60: @ 80C4090
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080C40C8 @ =sub_80C3EA4
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C40CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	ldr r0, _080C40D0 @ =gContestMons
	lsls r4, 6
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r1, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C40C8: .4byte sub_80C3EA4
_080C40CC: .4byte gTasks
_080C40D0: .4byte gContestMons
	thumb_func_end sub_80C3E60

	thumb_func_start sub_80C3EA4
sub_80C3EA4: @ 80C40D4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C4128 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrb r5, [r4, 0x8]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080C411E
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xC]
	ldrb r2, [r4, 0x1E]
	ldr r1, _080C412C @ =gContestMons
	lsls r3, r5, 6
	adds r1, 0x38
	adds r3, r1
	ldr r1, [r3]
	str r1, [sp]
	adds r1, r5, 0
	movs r3, 0
	bl sub_80C3024
	ldrh r0, [r4, 0x1E]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x1E]
_080C411E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4128: .4byte gTasks
_080C412C: .4byte gContestMons
	thumb_func_end sub_80C3EA4

	thumb_func_start sub_80C3F00
sub_80C3F00: @ 80C4130
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _080C42C8 @ =gUnknown_02038678
	ldrh r2, [r0]
	adds r4, r0, 0
	adds r3, r4, 0x2
	movs r0, 0x2
	mov r8, r0
_080C4146:
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080C4154
	ldrh r2, [r3]
_080C4154:
	adds r3, 0x2
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, 0
	bge _080C4146
	lsls r0, r2, 16
	mov r9, r0
	cmp r0, 0
	bge _080C4192
	ldrh r2, [r4]
	adds r3, r4, 0x2
	movs r4, 0x2
	mov r8, r4
_080C4172:
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble _080C4180
	ldrh r2, [r3]
_080C4180:
	adds r3, 0x2
	movs r0, 0x1
	negs r0, r0
	add r8, r0
	lsls r1, r2, 16
	mov r9, r1
	mov r4, r8
	cmp r4, 0
	bge _080C4172
_080C4192:
	movs r5, 0
	mov r8, r5
	mov r10, r5
_080C4198:
	ldr r0, _080C42CC @ =gUnknown_02038670
	mov r1, r8
	lsls r7, r1, 1
	adds r0, r7, r0
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	mov r4, r9
	asrs r6, r4, 16
	adds r1, r6, 0
	cmp r6, 0
	bge _080C41BA
	negs r1, r6
_080C41BA:
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C41CC
	adds r4, 0xA
_080C41CC:
	ldr r0, _080C42D0 @ =0x02018018
	mov r1, r10
	adds r5, r1, r0
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	str r0, [r5]
	ldr r0, _080C42D4 @ =gUnknown_02038688
	adds r7, r0
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r1, 0
	bge _080C41EA
	negs r1, r1
_080C41EA:
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r6, 0
	cmp r1, 0
	bge _080C41FC
	negs r1, r1
_080C41FC:
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C420E
	adds r4, 0xA
_080C420E:
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	str r0, [r5, 0x4]
	movs r4, 0
	ldrsh r0, [r7, r4]
	cmp r0, 0
	bge _080C4224
	movs r0, 0x1
	strb r0, [r5, 0x10]
_080C4224:
	ldr r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	subs r0, r1
	lsls r0, 11
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	movs r4, 0xFF
	ands r0, r4
	cmp r0, 0x7F
	bls _080C4246
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
_080C4246:
	lsrs r0, r1, 8
	str r0, [r5, 0x8]
	ldr r1, [r5, 0x4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	subs r0, r1
	lsls r0, 11
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	ands r0, r4
	cmp r0, 0x7F
	bls _080C426A
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
_080C426A:
	lsrs r0, r1, 8
	str r0, [r5, 0xC]
	mov r0, r8
	lsls r4, r0, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80C3990
	strb r0, [r5, 0x11]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80C39E4
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080C4290
	negs r0, r0
_080C4290:
	strb r0, [r5, 0x12]
	ldr r0, _080C42D8 @ =gUnknown_02038690
	add r0, r8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C42E4
	ldr r4, [r5, 0x8]
	ldrh r2, [r5, 0x8]
	ldr r3, [r5, 0xC]
	ldrh r1, [r5, 0xC]
	ldrb r0, [r5, 0x10]
	cmp r0, 0
	beq _080C42B0
	lsls r0, r1, 16
	negs r0, r0
	lsrs r1, r0, 16
_080C42B0:
	lsls r0, r2, 16
	asrs r2, r0, 16
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r0, r2, r1
	cmp r0, 0x58
	bne _080C42E4
	cmp r1, 0
	ble _080C42DC
	subs r0, r3, 0x1
	str r0, [r5, 0xC]
	b _080C42E4
	.align 2, 0
_080C42C8: .4byte gUnknown_02038678
_080C42CC: .4byte gUnknown_02038670
_080C42D0: .4byte 0x02018018
_080C42D4: .4byte gUnknown_02038688
_080C42D8: .4byte gUnknown_02038690
_080C42DC:
	cmp r2, 0
	ble _080C42E4
	subs r0, r4, 0x1
	str r0, [r5, 0x8]
_080C42E4:
	movs r1, 0x14
	add r10, r1
	movs r2, 0x1
	add r8, r2
	mov r4, r8
	cmp r4, 0x3
	bgt _080C42F4
	b _080C4198
_080C42F4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C3F00

	thumb_func_start sub_80C40D4
sub_80C40D4: @ 80C4304
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	mov r10, r1
	movs r2, 0
	str r2, [sp]
	cmp r0, 0
	bne _080C43C8
	mov r8, r2
	ldr r0, _080C43AC @ =0x02018018
	subs r1, 0x18
	adds r1, r0
	mov r9, r1
	adds r4, r0, 0
	adds r4, 0x8
	movs r6, 0xA0
_080C4332:
	ldrb r0, [r4, 0x9]
	cmp r7, r0
	bcs _080C439A
	adds r0, 0x13
	adds r0, r6, r0
	subs r0, r7
	lsls r0, 1
	ldr r2, _080C43B0 @ =0x0600bffe
	adds r0, r2
	ldr r2, _080C43B4 @ =0x000060b3
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _080C43B8 @ =sub_80C42C0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r4]
	lsls r0, 16
	ldrb r1, [r4, 0x9]
	bl __udivsi3
	adds r1, r7, 0x1
	adds r3, r0, 0
	muls r3, r1
	ldr r0, _080C43BC @ =0x0000ffff
	ands r0, r3
	ldr r1, _080C43C0 @ =0x00007fff
	cmp r0, r1
	bls _080C4376
	movs r0, 0x80
	lsls r0, 9
	adds r3, r0
_080C4376:
	ldr r1, _080C43C4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x8]
	lsrs r1, r3, 16
	strh r1, [r0, 0xA]
	mov r2, r9
	ldrb r0, [r2, 0x14]
	adds r0, 0x1
	strb r0, [r2, 0x14]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_080C439A:
	adds r4, 0x14
	adds r6, 0x60
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x3
	ble _080C4332
	b _080C44C2
	.align 2, 0
_080C43AC: .4byte 0x02018018
_080C43B0: .4byte 0x0600bffe
_080C43B4: .4byte 0x000060b3
_080C43B8: .4byte sub_80C42C0
_080C43BC: .4byte 0x0000ffff
_080C43C0: .4byte 0x00007fff
_080C43C4: .4byte gTasks
_080C43C8:
	movs r2, 0
	mov r8, r2
	ldr r0, _080C4450 @ =0x02018018
	mov r12, r0
	mov r9, r2
	movs r1, 0xC0
	str r1, [sp, 0x4]
_080C43D6:
	mov r6, r9
	add r6, r12
	ldrb r1, [r6, 0x12]
	ldrb r0, [r6, 0x10]
	ldr r2, _080C4454 @ =0x000060a3
	cmp r0, 0
	beq _080C43E6
	adds r2, 0x2
_080C43E6:
	lsls r0, r1, 24
	asrs r0, 24
	cmp r7, r0
	bge _080C44AE
	adds r0, 0x13
	ldr r1, [sp, 0x4]
	adds r0, r1, r0
	subs r0, r7
	lsls r0, 1
	ldr r1, _080C4458 @ =0x0600bffe
	adds r0, r1
	strh r2, [r0]
	ldr r0, _080C445C @ =sub_80C42C0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r6, 0xC]
	lsls r0, 16
	ldrb r1, [r6, 0x12]
	bl __udivsi3
	adds r1, r7, 0x1
	adds r3, r0, 0
	muls r3, r1
	ldr r0, _080C4460 @ =0x0000ffff
	ands r0, r3
	ldr r1, _080C4464 @ =0x00007fff
	cmp r0, r1
	bls _080C442A
	movs r2, 0x80
	lsls r2, 9
	adds r3, r2
_080C442A:
	ldr r1, _080C4468 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r4, r0, r1
	mov r0, r8
	strh r0, [r4, 0x8]
	ldrb r0, [r6, 0x10]
	adds r6, r1, 0
	cmp r0, 0
	beq _080C446C
	movs r0, 0x1
	strh r0, [r4, 0xC]
	ldr r0, [sp]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	b _080C4476
	.align 2, 0
_080C4450: .4byte 0x02018018
_080C4454: .4byte 0x000060a3
_080C4458: .4byte 0x0600bffe
_080C445C: .4byte sub_80C42C0
_080C4460: .4byte 0x0000ffff
_080C4464: .4byte 0x00007fff
_080C4468: .4byte gTasks
_080C446C:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_080C4476:
	ldr r0, _080C4494 @ =0x02018018
	mov r1, r9
	adds r4, r1, r0
	ldrb r1, [r4, 0x10]
	mov r12, r0
	cmp r1, 0
	beq _080C4498
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r6
	lsrs r2, r3, 16
	ldr r1, [r4, 0x8]
	subs r1, r2
	b _080C44A4
	.align 2, 0
_080C4494: .4byte 0x02018018
_080C4498:
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r6
	lsrs r2, r3, 16
	ldr r1, [r4, 0x8]
	adds r1, r2
_080C44A4:
	strh r1, [r0, 0xA]
	ldr r1, _080C44EC @ =0x02018000
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
_080C44AE:
	movs r2, 0x14
	add r9, r2
	ldr r0, [sp, 0x4]
	adds r0, 0x60
	str r0, [sp, 0x4]
	movs r1, 0x1
	add r8, r1
	mov r2, r8
	cmp r2, 0x3
	ble _080C43D6
_080C44C2:
	ldr r0, [sp]
	cmp r0, 0
	beq _080C44CE
	movs r0, 0x16
	bl PlaySE
_080C44CE:
	mov r1, r10
	cmp r1, 0
	beq _080C44DA
	movs r0, 0x15
	bl PlaySE
_080C44DA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C44EC: .4byte 0x02018000
	thumb_func_end sub_80C40D4

	thumb_func_start sub_80C42C0
sub_80C42C0: @ 80C44F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	mov r9, r6
	ldr r1, _080C4538 @ =gTasks
	lsls r0, 2
	add r0, r12
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x8]
	ldrh r7, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	mov r8, r1
	movs r2, 0xC
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080C4540
	ldr r1, _080C453C @ =0x02018000
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0xC
	adds r0, r2, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r10, r1
	adds r4, r2, 0
	cmp r0, 0
	bgt _080C4558
	b _080C4556
	.align 2, 0
_080C4538: .4byte gTasks
_080C453C: .4byte 0x02018000
_080C4540:
	ldr r1, _080C4580 @ =0x02018000
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0xC
	adds r0, r2, r0
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r10, r1
	adds r4, r2, 0
	cmp r0, 0x57
	ble _080C4558
_080C4556:
	movs r6, 0x1
_080C4558:
	mov r0, r10
	adds r0, 0xC
	adds r3, r4, r0
	ldrh r2, [r3]
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	bne _080C4570
	movs r1, 0x1
	mov r9, r1
_080C4570:
	mov r0, r9
	cmp r0, 0
	bne _080C4592
	cmp r6, 0
	beq _080C4584
	strh r7, [r3]
	b _080C4592
	.align 2, 0
_080C4580: .4byte 0x02018000
_080C4584:
	mov r1, r8
	cmp r1, 0
	beq _080C458E
	subs r0, r2, 0x1
	b _080C4590
_080C458E:
	adds r0, r2, 0x1
_080C4590:
	strh r0, [r3]
_080C4592:
	cmp r6, 0
	bne _080C45F8
	mov r2, r9
	cmp r2, 0
	bne _080C45FE
	movs r2, 0
	ldr r0, _080C45B8 @ =0x0201800c
	adds r6, r4, r0
	adds r0, r4, r5
	lsls r5, r0, 5
_080C45A6:
	movs r0, 0
	ldrsh r3, [r6, r0]
	adds r0, r2, 0x1
	lsls r1, r0, 3
	adds r4, r0, 0
	cmp r3, r1
	blt _080C45BC
	movs r0, 0x8
	b _080C45D8
	.align 2, 0
_080C45B8: .4byte 0x0201800c
_080C45BC:
	lsls r0, r2, 3
	cmp r3, r0
	blt _080C45D6
	adds r0, r3, 0
	cmp r3, 0
	bge _080C45CA
	adds r0, r3, 0x7
_080C45CA:
	asrs r0, 3
	lsls r0, 3
	subs r0, r3, r0
	lsls r0, 24
	lsrs r0, 24
	b _080C45D8
_080C45D6:
	movs r0, 0
_080C45D8:
	cmp r0, 0x3
	bhi _080C45E4
	ldr r3, _080C45E0 @ =0x0000504c
	b _080C45E6
	.align 2, 0
_080C45E0: .4byte 0x0000504c
_080C45E4:
	ldr r3, _080C461C @ =0x00005057
_080C45E6:
	adds r1, r0, r3
	adds r0, r5, r2
	lsls r0, 1
	ldr r2, _080C4620 @ =0x0600e18e
	adds r0, r2
	strh r1, [r0]
	adds r2, r4, 0
	cmp r2, 0xA
	ble _080C45A6
_080C45F8:
	mov r3, r9
	cmp r3, 0
	beq _080C460C
_080C45FE:
	mov r1, r10
	ldrb r0, [r1, 0x14]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	mov r0, r12
	bl DestroyTask
_080C460C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C461C: .4byte 0x00005057
_080C4620: .4byte 0x0600e18e
	thumb_func_end sub_80C42C0

	thumb_func_start sub_80C43F4
sub_80C43F4: @ 80C4624
	push {r4,r5,lr}
	ldr r0, _080C465C @ =gUnknown_02038694
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080C4660 @ =gPlayerParty
	adds r0, r1
	bl sub_80AE47C
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r5, 0
	beq _080C4652
	ldr r4, _080C4664 @ =gScriptContestCategory
	ldrb r0, [r4]
	ldr r1, _080C4668 @ =gScriptContestRank
	ldrb r1, [r1]
	bl sub_80AE398
	ldrb r0, [r4]
	bl sub_80AE82C
_080C4652:
	ldr r0, _080C466C @ =gScriptResult
	strh r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C465C: .4byte gUnknown_02038694
_080C4660: .4byte gPlayerParty
_080C4664: .4byte gScriptContestCategory
_080C4668: .4byte gScriptContestRank
_080C466C: .4byte gScriptResult
	thumb_func_end sub_80C43F4

	thumb_func_start sub_80C4440
sub_80C4440: @ 80C4670
	push {r4,lr}
	movs r4, 0
	ldr r0, _080C4694 @ =gUnknown_02038694
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080C4698 @ =gPlayerParty
	adds r2, r1, r0
	ldr r0, _080C469C @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080C46E2
	lsls r0, 2
	ldr r1, _080C46A0 @ =_080C46A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4694: .4byte gUnknown_02038694
_080C4698: .4byte gPlayerParty
_080C469C: .4byte gScriptContestCategory
_080C46A0: .4byte _080C46A4
	.align 2, 0
_080C46A4:
	.4byte _080C46B8
	.4byte _080C46BE
	.4byte _080C46C4
	.4byte _080C46CA
	.4byte _080C46D0
_080C46B8:
	adds r0, r2, 0
	movs r1, 0x32
	b _080C46D4
_080C46BE:
	adds r0, r2, 0
	movs r1, 0x33
	b _080C46D4
_080C46C4:
	adds r0, r2, 0
	movs r1, 0x34
	b _080C46D4
_080C46CA:
	adds r0, r2, 0
	movs r1, 0x35
	b _080C46D4
_080C46D0:
	adds r0, r2, 0
	movs r1, 0x36
_080C46D4:
	bl GetMonData
	ldr r1, _080C46EC @ =gScriptContestRank
	ldrh r1, [r1]
	cmp r0, r1
	bls _080C46E2
	movs r4, 0x1
_080C46E2:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C46EC: .4byte gScriptContestRank
	thumb_func_end sub_80C4440

	thumb_func_start sub_80C44C0
sub_80C44C0: @ 80C46F0
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _080C4718 @ =gUnknown_02038690
	ldr r0, _080C471C @ =gContestPlayerMonIndex
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C4704
	b _080C488E
_080C4704:
	ldr r0, _080C4720 @ =gScriptContestCategory
	ldrh r0, [r0]
	cmp r0, 0x4
	bls _080C470E
	b _080C488E
_080C470E:
	lsls r0, 2
	ldr r1, _080C4724 @ =_080C4728
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4718: .4byte gUnknown_02038690
_080C471C: .4byte gContestPlayerMonIndex
_080C4720: .4byte gScriptContestCategory
_080C4724: .4byte _080C4728
	.align 2, 0
_080C4728:
	.4byte _080C473C
	.4byte _080C4784
	.4byte _080C47C8
	.4byte _080C480C
	.4byte _080C4854
_080C473C:
	ldr r6, _080C4778 @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080C477C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x32
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	mov r0, sp
	strb r1, [r0]
	ldr r0, _080C4780 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r1, r0
	bls _080C4760
	b _080C488E
_080C4760:
	adds r0, r1, 0
	cmp r0, 0x3
	bls _080C4768
	b _080C488E
_080C4768:
	adds r1, r0, 0x1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x32
	b _080C4840
	.align 2, 0
_080C4778: .4byte gUnknown_02038694
_080C477C: .4byte gPlayerParty
_080C4780: .4byte gScriptContestRank
_080C4784:
	mov r4, sp
	ldr r7, _080C47BC @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C47C0 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x33
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C47C4 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C488E
	cmp r2, 0x3
	bhi _080C488E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x33
	b _080C4840
	.align 2, 0
_080C47BC: .4byte gUnknown_02038694
_080C47C0: .4byte gPlayerParty
_080C47C4: .4byte gScriptContestRank
_080C47C8:
	mov r4, sp
	ldr r7, _080C4800 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C4804 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x34
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4808 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C488E
	cmp r2, 0x3
	bhi _080C488E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x34
	b _080C4840
	.align 2, 0
_080C4800: .4byte gUnknown_02038694
_080C4804: .4byte gPlayerParty
_080C4808: .4byte gScriptContestRank
_080C480C:
	mov r4, sp
	ldr r7, _080C4848 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C484C @ =gPlayerParty
	adds r0, r5
	movs r1, 0x35
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C4850 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C488E
	cmp r2, 0x3
	bhi _080C488E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x35
_080C4840:
	mov r2, sp
	bl SetMonData
	b _080C488E
	.align 2, 0
_080C4848: .4byte gUnknown_02038694
_080C484C: .4byte gPlayerParty
_080C4850: .4byte gScriptContestRank
_080C4854:
	mov r4, sp
	ldr r7, _080C4898 @ =gUnknown_02038694
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080C489C @ =gPlayerParty
	adds r0, r5
	movs r1, 0x36
	bl GetMonData
	strb r0, [r4]
	mov r0, sp
	ldrb r2, [r0]
	ldr r0, _080C48A0 @ =gScriptContestRank
	ldrh r0, [r0]
	cmp r2, r0
	bhi _080C488E
	cmp r2, 0x3
	bhi _080C488E
	mov r1, sp
	adds r0, r2, 0x1
	strb r0, [r1]
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r5
	movs r1, 0x36
	mov r2, sp
	bl SetMonData
_080C488E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4898: .4byte gUnknown_02038694
_080C489C: .4byte gPlayerParty
_080C48A0: .4byte gScriptContestRank
	thumb_func_end sub_80C44C0

	thumb_func_start sub_80C4674
sub_80C4674: @ 80C48A4
	push {r4,lr}
	adds r4, r0, 0
	bl StringCopy
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _080C48C0
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _080C48C0
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_080C48C0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4674

	thumb_func_start sub_80C4698
sub_80C4698: @ 80C48C8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r4, 6
	ldr r0, _080C4910 @ =0x02038572
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	ldr r0, _080C4914 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C490A
	ldr r0, _080C4918 @ =gLinkPlayers
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x1
	bne _080C490A
	adds r0, r5, 0
	bl sub_80C86A0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl ConvertInternationalString
_080C490A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4910: .4byte 0x02038572
_080C4914: .4byte gUnknown_0203869A
_080C4918: .4byte gLinkPlayers
	thumb_func_end sub_80C4698

	thumb_func_start sub_80C46EC
sub_80C46EC: @ 80C491C
	push {lr}
	ldr r0, _080C4940 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4950
	ldr r0, _080C4944 @ =gStringVar1
	ldr r1, _080C4948 @ =gSpecialVar_0x8006
	ldrh r2, [r1]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r2, _080C494C @ =0x03002988
	adds r1, r2
	bl sub_80C4674
	b _080C4960
	.align 2, 0
_080C4940: .4byte gUnknown_0203869A
_080C4944: .4byte gStringVar1
_080C4948: .4byte gSpecialVar_0x8006
_080C494C: .4byte 0x03002988
_080C4950:
	ldr r0, _080C4964 @ =gStringVar1
	ldr r1, _080C4968 @ =gSpecialVar_0x8006
	ldrh r1, [r1]
	lsls r1, 6
	ldr r2, _080C496C @ =gUnknown_0203857D
	adds r1, r2
	bl sub_80C4674
_080C4960:
	pop {r0}
	bx r0
	.align 2, 0
_080C4964: .4byte gStringVar1
_080C4968: .4byte gSpecialVar_0x8006
_080C496C: .4byte gUnknown_0203857D
	thumb_func_end sub_80C46EC

	thumb_func_start sub_80C4740
sub_80C4740: @ 80C4970
	push {lr}
	ldr r0, _080C4980 @ =gStringVar3
	ldr r1, _080C4984 @ =gSpecialVar_0x8006
	ldrb r1, [r1]
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4980: .4byte gStringVar3
_080C4984: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4740

	thumb_func_start sub_80C4758
sub_80C4758: @ 80C4988
	push {r4-r6,lr}
	movs r1, 0
	movs r2, 0
	ldr r5, _080C49C4 @ =gSpecialVar_0x8004
	ldr r4, _080C49C8 @ =gUnknown_02038670
	ldr r0, _080C49CC @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r4
	movs r6, 0
	ldrsh r3, [r0, r6]
_080C499E:
	lsls r0, r1, 1
	adds r0, r4
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r3, r0
	bge _080C49B0
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080C49B0:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C499E
	strh r2, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C49C4: .4byte gSpecialVar_0x8004
_080C49C8: .4byte gUnknown_02038670
_080C49CC: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4758

	thumb_func_start sub_80C47A0
sub_80C47A0: @ 80C49D0
	ldr r2, _080C49E4 @ =gSpecialVar_0x8004
	ldr r1, _080C49E8 @ =gUnknown_02038670
	ldr r0, _080C49EC @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C49E4: .4byte gSpecialVar_0x8004
_080C49E8: .4byte gUnknown_02038670
_080C49EC: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C47A0

	thumb_func_start sub_80C47C0
sub_80C47C0: @ 80C49F0
	push {lr}
	movs r1, 0
	ldr r2, _080C4A18 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r3, _080C4A1C @ =gSpecialVar_0x8005
	cmp r0, 0
	beq _080C4A10
_080C49FE:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080C4A10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C49FE
_080C4A10:
	strh r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_080C4A18: .4byte gUnknown_02038690
_080C4A1C: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80C47C0

	thumb_func_start sub_80C47F0
sub_80C47F0: @ 80C4A20
	push {r4,lr}
	movs r2, 0
	ldr r3, _080C4A60 @ =gUnknown_02038690
	ldrb r0, [r3]
	ldr r1, _080C4A64 @ =gUnknown_0203869A
	ldr r4, _080C4A68 @ =gStringVar3
	cmp r0, 0
	beq _080C4A42
_080C4A30:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bhi _080C4A42
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4A30
_080C4A42:
	ldrb r1, [r1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C4A70
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _080C4A6C @ =0x03002988
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
	b _080C4A7C
	.align 2, 0
_080C4A60: .4byte gUnknown_02038690
_080C4A64: .4byte gUnknown_0203869A
_080C4A68: .4byte gStringVar3
_080C4A6C: .4byte 0x03002988
_080C4A70:
	lsls r1, r2, 6
	ldr r0, _080C4A84 @ =gUnknown_0203857D
	adds r1, r0
	adds r0, r4, 0
	bl sub_80C4674
_080C4A7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4A84: .4byte gUnknown_0203857D
	thumb_func_end sub_80C47F0

	thumb_func_start sub_80C4858
sub_80C4858: @ 80C4A88
	push {lr}
	movs r1, 0
	ldr r2, _080C4AB4 @ =gUnknown_02038690
	ldrb r0, [r2]
	ldr r3, _080C4AB8 @ =gStringVar1
	cmp r0, 0
	beq _080C4AA8
_080C4A96:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080C4AA8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4A96
_080C4AA8:
	adds r0, r3, 0
	bl sub_80C4698
	pop {r0}
	bx r0
	.align 2, 0
_080C4AB4: .4byte gUnknown_02038690
_080C4AB8: .4byte gStringVar1
	thumb_func_end sub_80C4858

	thumb_func_start sub_80C488C
sub_80C488C: @ 80C4ABC
	push {lr}
	ldr r0, _080C4AC8 @ =sub_80AB47C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C4AC8: .4byte sub_80AB47C
	thumb_func_end sub_80C488C

	thumb_func_start sub_80C489C
sub_80C489C: @ 80C4ACC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C4AF0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C4AEA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080C4AF4 @ =sub_80C488C
	bl SetMainCallback2
_080C4AEA:
	pop {r0}
	bx r0
	.align 2, 0
_080C4AF0: .4byte gPaletteFade
_080C4AF4: .4byte sub_80C488C
	thumb_func_end sub_80C489C

	thumb_func_start sub_80C48C8
sub_80C48C8: @ 80C4AF8
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080C4B20 @ =sub_80C489C
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C4B20: .4byte sub_80C489C
	thumb_func_end sub_80C48C8

	thumb_func_start sub_80C48F4
sub_80C48F4: @ 80C4B24
	ldr r2, _080C4B38 @ =gSpecialVar_0x8004
	ldr r1, _080C4B3C @ =gContestMons
	ldr r0, _080C4B40 @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 6
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_080C4B38: .4byte gSpecialVar_0x8004
_080C4B3C: .4byte gContestMons
_080C4B40: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C48F4

	thumb_func_start sub_80C4914
sub_80C4914: @ 80C4B44
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C4B68 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C4B62
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080C4B6C @ =sub_80C2358
	bl SetMainCallback2
_080C4B62:
	pop {r0}
	bx r0
	.align 2, 0
_080C4B68: .4byte gPaletteFade
_080C4B6C: .4byte sub_80C2358
	thumb_func_end sub_80C4914

	thumb_func_start sub_80C4940
sub_80C4940: @ 80C4B70
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080C4B98 @ =sub_80C4914
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C4B98: .4byte sub_80C4914
	thumb_func_end sub_80C4940

	thumb_func_start sub_80C496C
sub_80C496C: @ 80C4B9C
	ldr r0, _080C4BA8 @ =gSpecialVar_0x8004
	ldr r1, _080C4BAC @ =gContestPlayerMonIndex
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080C4BA8: .4byte gSpecialVar_0x8004
_080C4BAC: .4byte gContestPlayerMonIndex
	thumb_func_end sub_80C496C

	thumb_func_start sub_80C4980
sub_80C4980: @ 80C4BB0
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl ScriptContext2_Enable
	ldr r6, _080C4BE8 @ =sub_80C8604
	adds r0, r6, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080C4BEC @ =sub_80C49C4
	adds r0, r4, 0
	adds r1, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080C4BF0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1A]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4BE8: .4byte sub_80C8604
_080C4BEC: .4byte sub_80C49C4
_080C4BF0: .4byte gTasks
	thumb_func_end sub_80C4980

	thumb_func_start sub_80C49C4
sub_80C49C4: @ 80C4BF4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C4C14 @ =gUnknown_02038694
	ldrb r0, [r0]
	bl sub_80AE098
	ldr r1, _080C4C18 @ =sub_80C8734
	ldr r2, _080C4C1C @ =sub_80C49F0
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4C14: .4byte gUnknown_02038694
_080C4C18: .4byte sub_80C8734
_080C4C1C: .4byte sub_80C49F0
	thumb_func_end sub_80C49C4

	thumb_func_start sub_80C49F0
sub_80C49F0: @ 80C4C20
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4C34 @ =sub_80C88AC
	ldr r2, _080C4C38 @ =sub_80C4A0C
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4C34: .4byte sub_80C88AC
_080C4C38: .4byte sub_80C4A0C
	thumb_func_end sub_80C49F0

	thumb_func_start sub_80C4A0C
sub_80C4A0C: @ 80C4C3C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4C50 @ =sub_80C8E1C
	ldr r2, _080C4C54 @ =sub_80C4A28
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4C50: .4byte sub_80C8E1C
_080C4C54: .4byte sub_80C4A28
	thumb_func_end sub_80C4A0C

	thumb_func_start sub_80C4A28
sub_80C4A28: @ 80C4C58
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C4C6C @ =sub_80C8938
	ldr r2, _080C4C70 @ =sub_80C4A44
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080C4C6C: .4byte sub_80C8938
_080C4C70: .4byte sub_80C4A44
	thumb_func_end sub_80C4A28

	thumb_func_start sub_80C4A44
sub_80C4A44: @ 80C4C74
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r0, _080C4CD0 @ =gSpecialVar_0x8004
	mov r8, r0
	add r1, sp, 0x4
	mov r12, r1
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r4, r0, 3
	ldr r6, _080C4CD4 @ =0x03004b38
	adds r7, r1, 0
_080C4C94:
	mov r0, sp
	adds r2, r0, r3
	adds r1, r3, 0x1
	lsls r0, r1, 1
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r3, 0x3
	bls _080C4C94
	movs r3, 0
	mov r2, sp
_080C4CB0:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bhi _080C4CC6
	mov r0, sp
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C4CB0
_080C4CC6:
	cmp r3, 0x4
	bne _080C4CD8
	movs r0, 0
	b _080C4CDA
	.align 2, 0
_080C4CD0: .4byte gSpecialVar_0x8004
_080C4CD4: .4byte 0x03004b38
_080C4CD8:
	movs r0, 0x1
_080C4CDA:
	mov r1, r8
	strh r0, [r1]
	movs r3, 0
	mov r4, r12
	adds r0, r7, r5
	lsls r2, r0, 3
	ldr r6, _080C4D28 @ =0x03004b38
_080C4CE8:
	adds r1, r4, r3
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r2
	adds r0, r6
	ldrh r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080C4CE8
	mov r0, r12
	bl sub_80C4B34
	ldr r1, _080C4D2C @ =gUnknown_0203869B
	strb r0, [r1]
	ldr r0, _080C4D30 @ =gScriptContestCategory
	ldrb r0, [r0]
	bl sub_80AE82C
	ldr r1, _080C4D34 @ =sub_80C8EBC
	ldr r2, _080C4D38 @ =sub_80C4B0C
	adds r0, r5, 0
	bl SetTaskFuncWithFollowupFunc
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4D28: .4byte 0x03004b38
_080C4D2C: .4byte gUnknown_0203869B
_080C4D30: .4byte gScriptContestCategory
_080C4D34: .4byte sub_80C8EBC
_080C4D38: .4byte sub_80C4B0C
	thumb_func_end sub_80C4A44

	thumb_func_start sub_80C4B0C
sub_80C4B0C: @ 80C4D3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80B0F28
	ldr r1, _080C4D5C @ =sub_80C8F34
	ldr r2, _080C4D60 @ =sub_80C4B5C
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4D5C: .4byte sub_80C8F34
_080C4D60: .4byte sub_80C4B5C
	thumb_func_end sub_80C4B0C

	thumb_func_start sub_80C4B34
sub_80C4B34: @ 80C4D64
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	movs r2, 0x1
_080C4D6C:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080C4D7C
	lsls r0, r2, 24
	lsrs r4, r0, 24
_080C4D7C:
	adds r2, 0x1
	cmp r2, 0x3
	ble _080C4D6C
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C4B34

	thumb_func_start sub_80C4B5C
sub_80C4B5C: @ 80C4D8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C4DB4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080C4DC0
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C4DCE
	ldr r0, _080C4DB8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C4DBC @ =sub_80C4BA4
	str r0, [r1]
	b _080C4DCE
	.align 2, 0
_080C4DB4: .4byte gSpecialVar_0x8004
_080C4DB8: .4byte gTasks
_080C4DBC: .4byte sub_80C4BA4
_080C4DC0:
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080C4DCE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C4B5C

	thumb_func_start sub_80C4BA4
sub_80C4BA4: @ 80C4DD4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _080C4DF4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C4DF8 @ =sub_80C4BCC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4DF4: .4byte gTasks
_080C4DF8: .4byte sub_80C4BCC
	thumb_func_end sub_80C4BA4

	thumb_func_start sub_80C4BCC
sub_80C4BCC: @ 80C4DFC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080C4E1C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4E18
	adds r0, r1, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_080C4E18:
	pop {r0}
	bx r0
	.align 2, 0
_080C4E1C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80C4BCC

	.align 2, 0 @ Don't pad with nop.
