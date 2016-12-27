	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8106630
sub_8106630: @ 8106A18
	push {r4-r7,lr}
	ldr r2, _08106A44
	subs r4, r2, 0x2
	subs r5, r2, 0x1
	ldr r3, _08106A48
	subs r0, 0x1
	lsls r1, r0, 5
	adds r1, r3
	ldr r3, _08106A4C
	adds r1, r3
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r3,r6,r7}
	stm r2!, {r3,r6,r7}
	ldm r1!, {r6,r7}
	stm r2!, {r6,r7}
	strb r0, [r4]
	movs r0, 0
	strb r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106A44: .4byte 0x02015de0
_08106A48: .4byte gSaveBlock1
_08106A4C: .4byte 0x00002dfc
	thumb_func_end sub_8106630

	thumb_func_start CB2_ContestPainting
CB2_ContestPainting: @ 8106A50
	push {lr}
	bl ShowContestPainting
	pop {r0}
	bx r0
	thumb_func_end CB2_ContestPainting

	thumb_func_start ShowContestPainting
ShowContestPainting: @ 8106A5C
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _08106A7C
	ldr r2, _08106A80
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _08106A70
	b _08106BC8
_08106A70:
	lsls r0, 2
	ldr r1, _08106A84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106A7C: .4byte gMain
_08106A80: .4byte 0x0000043c
_08106A84: .4byte _08106A88
	.align 2, 0
_08106A88:
	.4byte _08106A9C
	.4byte _08106AC0
	.4byte _08106B1C
	.4byte _08106B44
	.4byte _08106B74
_08106A9C:
	bl remove_some_task
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _08106AB8
	ldr r0, _08106ABC
	str r0, [r1]
	movs r0, 0x1
	bl ContestPaintingInitVars
	bl ContestPaintingInitBG
	b _08106B56
	.align 2, 0
_08106AB8: .4byte gUnknown_03005E8C
_08106ABC: .4byte 0x02015de0
_08106AC0:
	bl ResetPaletteFade
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	movs r5, 0
	ldr r1, _08106B0C
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _08106B10
	movs r7, 0x85
	lsls r7, 24
_08106ADA:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _08106ADA
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetSpriteData
	ldr r1, _08106B14
	ldr r2, _08106B18
	adds r1, r2
	b _08106B5C
	.align 2, 0
_08106B0C: .4byte 0x040000d4
_08106B10: .4byte 0x85000400
_08106B14: .4byte gMain
_08106B18: .4byte 0x0000043c
_08106B1C:
	ldrh r0, [r4, 0x20]
	bl SeedRng
	bl InitKeys
	ldr r0, _08106B38
	ldr r1, _08106B3C
	adds r0, r1
	ldrb r0, [r0]
	bl ContestPaintingInitWindow
	ldr r2, _08106B40
	adds r1, r4, r2
	b _08106B5C
	.align 2, 0
_08106B38: .4byte 0x02000000
_08106B3C: .4byte 0x00015ddf
_08106B40: .4byte 0x0000043c
_08106B44:
	ldr r1, _08106B64
	ldr r2, _08106B68
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8107090
_08106B56:
	ldr r1, _08106B6C
	ldr r0, _08106B70
	adds r1, r0
_08106B5C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08106BC8
	.align 2, 0
_08106B64: .4byte 0x02000000
_08106B68: .4byte 0x00015dde
_08106B6C: .4byte gMain
_08106B70: .4byte 0x0000043c
_08106B74:
	ldr r1, _08106BD0
	ldr r2, _08106BD4
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl ContestPaintingPrintCaption
	ldr r0, _08106BD8
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	movs r1, 0xA0
	lsls r1, 19
	movs r4, 0
	str r4, [sp]
	ldr r0, _08106BDC
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08106BE0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x2
	bl BeginFastPaletteFade
	ldr r0, _08106BE4
	bl SetVBlankCallback
	ldr r0, _08106BE8
	strb r4, [r0]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08106BEC
	bl SetMainCallback2
_08106BC8:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106BD0: .4byte 0x02000000
_08106BD4: .4byte 0x00015dde
_08106BD8: .4byte gUnknown_083F6140
_08106BDC: .4byte 0x040000d4
_08106BE0: .4byte 0x85000100
_08106BE4: .4byte VBlankCB_ContestPainting
_08106BE8: .4byte gUnknown_03000750
_08106BEC: .4byte CB2_HoldContestPainting
	thumb_func_end ShowContestPainting

	thumb_func_start CB2_HoldContestPainting
CB2_HoldContestPainting: @ 8106BF0
	push {lr}
	bl HoldContestPainting
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_HoldContestPainting

	thumb_func_start CB2_QuitContestPainting
CB2_QuitContestPainting: @ 8106C00
	push {lr}
	ldr r0, _08106C10
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08106C10: .4byte gMain
	thumb_func_end CB2_QuitContestPainting

	thumb_func_start HoldContestPainting
HoldContestPainting: @ 8106C14
	push {lr}
	sub sp, 0x4
	ldr r3, _08106C2C
	ldrb r1, [r3]
	cmp r1, 0x1
	beq _08106C68
	cmp r1, 0x1
	bgt _08106C30
	cmp r1, 0
	beq _08106C36
	b _08106CCE
	.align 2, 0
_08106C2C: .4byte gUnknown_03000750
_08106C30:
	cmp r1, 0x2
	beq _08106CA8
	b _08106CCE
_08106C36:
	ldr r0, _08106C5C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08106C46
	movs r0, 0x1
	strb r0, [r3]
_08106C46:
	ldr r0, _08106C60
	ldrb r0, [r0]
	cmp r0, 0
	beq _08106CCE
	ldr r1, _08106C64
	ldrh r0, [r1]
	cmp r0, 0
	beq _08106CCE
	subs r0, 0x1
	b _08106CCC
	.align 2, 0
_08106C5C: .4byte gPaletteFade
_08106C60: .4byte gUnknown_03000756
_08106C64: .4byte gUnknown_03000754
_08106C68:
	ldr r0, _08106C9C
	ldrh r2, [r0, 0x2E]
	ands r1, r2
	cmp r1, 0
	bne _08106C7A
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08106C8C
_08106C7A:
	movs r0, 0x2
	strb r0, [r3]
	subs r0, 0x3
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08106C8C:
	ldr r0, _08106CA0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08106CCE
	ldr r1, _08106CA4
	movs r0, 0
	b _08106CCC
	.align 2, 0
_08106C9C: .4byte gMain
_08106CA0: .4byte gUnknown_03000756
_08106CA4: .4byte gUnknown_03000754
_08106CA8:
	ldr r0, _08106CD4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08106CBA
	ldr r0, _08106CD8
	bl SetMainCallback2
_08106CBA:
	ldr r0, _08106CDC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08106CCE
	ldr r1, _08106CE0
	ldrh r0, [r1]
	cmp r0, 0x1D
	bhi _08106CCE
	adds r0, 0x1
_08106CCC:
	strh r0, [r1]
_08106CCE:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08106CD4: .4byte gPaletteFade
_08106CD8: .4byte CB2_QuitContestPainting
_08106CDC: .4byte gUnknown_03000756
_08106CE0: .4byte gUnknown_03000754
	thumb_func_end HoldContestPainting

	thumb_func_start ContestPaintingInitWindow
ContestPaintingInitWindow: @ 8106CE4
	push {r4,lr}
	ldr r4, _08106CFC
	adds r0, r4, 0
	bl InitMenuWindow
	adds r0, r4, 0
	bl SetUpWindowConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106CFC: .4byte gWindowConfig_81E7160
	thumb_func_end ContestPaintingInitWindow

	thumb_func_start ContestPaintingPrintCaption
ContestPaintingPrintCaption: @ 8106D00
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	beq _08106DA6
	ldr r2, _08106D5C
	ldr r6, _08106D60
	ldr r0, [r6]
	ldrb r0, [r0, 0xA]
	cmp r3, 0x7
	bhi _08106D70
	ldr r1, _08106D64
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _08106D68
	bl StringCopy
	adds r2, r0, 0
	ldr r1, [r6]
	adds r1, 0xB
	bl StringCopy10
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x16
	strb r0, [r2, 0x1]
	adds r2, 0x2
	ldr r1, _08106D6C
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, [r6]
	adds r1, 0x16
	bl StringCopy
	movs r1, 0x6
	b _08106D96
	.align 2, 0
_08106D5C: .4byte gUnknown_03005E40
_08106D60: .4byte gUnknown_03005E8C
_08106D64: .4byte gUnknown_083F60AC
_08106D68: .4byte gContestText_ContestWinner
_08106D6C: .4byte gOtherText_Unknown1
_08106D70:
	ldr r4, _08106DAC
	lsls r5, r0, 3
	adds r0, r5, r4
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, [r6]
	adds r1, 0xB
	bl StringCopy10
	adds r2, r0, 0
	adds r4, 0x4
	adds r5, r4
	ldr r1, [r5]
	bl StringCopy
	movs r1, 0x3
_08106D96:
	movs r2, 0xE
	ldr r0, _08106DB0
	lsls r1, 3
	adds r1, 0x1
	lsls r2, 3
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_08106DA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08106DAC: .4byte gUnknown_083F60C0
_08106DB0: .4byte gUnknown_03005E40
	thumb_func_end ContestPaintingPrintCaption

	thumb_func_start ContestPaintingInitBG
ContestPaintingInitBG: @ 8106DB4
	movs r0, 0x80
	lsls r0, 19
	movs r3, 0
	strh r3, [r0]
	ldr r2, _08106DE4
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08106DE8
	ldr r2, _08106DEC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08106DF0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08106DF4
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	bx lr
	.align 2, 0
_08106DE4: .4byte 0x04000200
_08106DE8: .4byte 0x04000008
_08106DEC: .4byte 0x00000c42
_08106DF0: .4byte 0x00000a45
_08106DF4: .4byte 0x04000050
	thumb_func_end ContestPaintingInitBG

	thumb_func_start ContestPaintingInitVars
ContestPaintingInitVars: @ 8106DF8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08106E1C
	ldr r0, _08106E10
	strb r1, [r0]
	ldr r0, _08106E14
	strh r1, [r0]
	ldr r0, _08106E18
	strh r1, [r0]
	b _08106E2E
	.align 2, 0
_08106E10: .4byte gUnknown_03000756
_08106E14: .4byte gUnknown_03000752
_08106E18: .4byte gUnknown_03000754
_08106E1C:
	ldr r1, _08106E34
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08106E38
	movs r0, 0xF
	strh r0, [r1]
	ldr r1, _08106E3C
	movs r0, 0x1E
	strh r0, [r1]
_08106E2E:
	pop {r0}
	bx r0
	.align 2, 0
_08106E34: .4byte gUnknown_03000756
_08106E38: .4byte gUnknown_03000752
_08106E3C: .4byte gUnknown_03000754
	thumb_func_end ContestPaintingInitVars

	thumb_func_start ContestPaintingMosaic
ContestPaintingMosaic: @ 8106E40
	push {lr}
	ldr r0, _08106E50
	ldrb r1, [r0]
	cmp r1, 0
	bne _08106E58
	ldr r0, _08106E54
	strh r1, [r0]
	b _08106E7A
	.align 2, 0
_08106E50: .4byte gUnknown_03000756
_08106E54: .4byte 0x0400004c
_08106E58:
	ldr r1, _08106E80
	ldr r2, _08106E84
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _08106E88
	ldr r0, _08106E8C
	ldrh r1, [r0]
	lsrs r1, 1
	strh r1, [r2]
	ldr r3, _08106E90
	lsls r0, r1, 12
	lsls r2, r1, 8
	orrs r0, r2
	lsls r2, r1, 4
	orrs r0, r2
	orrs r0, r1
	strh r0, [r3]
_08106E7A:
	pop {r0}
	bx r0
	.align 2, 0
_08106E80: .4byte 0x0400000a
_08106E84: .4byte 0x00000a45
_08106E88: .4byte gUnknown_03000752
_08106E8C: .4byte gUnknown_03000754
_08106E90: .4byte 0x0400004c
	thumb_func_end ContestPaintingMosaic

	thumb_func_start VBlankCB_ContestPainting
VBlankCB_ContestPainting: @ 8106E94
	push {lr}
	bl ContestPaintingMosaic
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_ContestPainting

	thumb_func_start sub_8106AC4
sub_8106AC4: @ 8106EAC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _08106F10
	ldr r0, [r7]
	ldr r1, [r0, 0x4]
	ldr r2, [r0]
	adds r0, r6, 0
	bl species_and_otid_get_pal
	ldr r1, _08106F14
	mov r8, r1
	ldr r1, [r1]
	bl LZDecompressVram
	cmp r4, 0
	bne _08106F28
	lsls r0, r6, 3
	ldr r1, _08106F18
	adds r0, r1
	ldr r1, _08106F1C
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08106F20
	ldr r5, [r4, 0x4]
	str r5, [sp]
	str r6, [sp, 0x4]
	ldr r4, [r7]
	ldr r4, [r4]
	str r4, [sp, 0x8]
	bl sub_800D334
	mov r2, r8
	ldr r1, [r2]
	ldr r0, _08106F24
	ldr r2, [r0]
	adds r0, r5, 0
	bl sub_8106B90
	b _08106F5C
	.align 2, 0
_08106F10: .4byte gUnknown_03005E8C
_08106F14: .4byte gUnknown_03005E90
_08106F18: .4byte gMonFrontPicTable
_08106F1C: .4byte gMonFrontPicCoords
_08106F20: .4byte gUnknown_081FAF4C
_08106F24: .4byte gUnknown_03005E10
_08106F28:
	lsls r0, r6, 3
	ldr r1, _08106F68
	adds r0, r1
	ldr r1, _08106F6C
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08106F70
	ldr r5, [r4]
	str r5, [sp]
	str r6, [sp, 0x4]
	ldr r4, [r7]
	ldr r4, [r4]
	str r4, [sp, 0x8]
	bl sub_800D334
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _08106F74
	ldr r2, [r0]
	adds r0, r5, 0
	bl sub_8106B90
_08106F5C:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106F68: .4byte gMonBackPicTable
_08106F6C: .4byte gMonBackPicCoords
_08106F70: .4byte gUnknown_081FAF4C
_08106F74: .4byte gUnknown_03005E10
	thumb_func_end sub_8106AC4

	thumb_func_start sub_8106B90
sub_8106B90: @ 8106F78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r10, r0
	mov r9, r1
	str r2, [sp]
	movs r0, 0
_08106F8C:
	movs r3, 0
	adds r1, r0, 0x1
	str r1, [sp, 0x4]
	lsls r0, 3
	str r0, [sp, 0x8]
_08106F96:
	movs r1, 0
	adds r2, r3, 0x1
	mov r8, r2
	ldr r7, [sp, 0x8]
	adds r0, r7, r3
	lsls r0, 5
	mov r12, r0
	lsls r4, r3, 3
_08106FA6:
	movs r3, 0
	lsls r0, r1, 2
	adds r6, r1, 0x1
	mov r2, r12
	adds r5, r2, r0
	ldr r7, [sp, 0x8]
	adds r0, r7, r1
	lsls r0, 7
	ldr r1, [sp]
	adds r2, r0, r1
_08106FBA:
	lsrs r0, r3, 1
	adds r0, r5, r0
	add r0, r10
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08106FCE
	lsrs r1, 4
	b _08106FD2
_08106FCE:
	movs r0, 0xF
	ands r1, r0
_08106FD2:
	cmp r1, 0
	bne _08106FE4
	adds r0, r4, r3
	lsls r0, 1
	adds r0, r2
	movs r7, 0x80
	lsls r7, 8
	adds r1, r7, 0
	b _08106FF0
_08106FE4:
	adds r0, r4, r3
	lsls r0, 1
	adds r0, r2
	lsls r1, 1
	add r1, r9
	ldrh r1, [r1]
_08106FF0:
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x7
	bls _08106FBA
	lsls r0, r6, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _08106FA6
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
	cmp r3, 0x7
	bls _08106F96
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r0, 0x7
	bls _08106F8C
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8106B90

	thumb_func_start sub_8106C40
sub_8106C40: @ 8107028
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08107064
	movs r2, 0x80
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	cmp r4, 0x1
	beq _08107046
	b _0810719C
_08107046:
	ldr r0, _08107068
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08107104
	lsls r0, 2
	ldr r1, _0810706C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08107064: .4byte gPictureFramePalettes
_08107068: .4byte gUnknown_03005E8C
_0810706C: .4byte _08107070
	.align 2, 0
_08107070:
	.4byte _08107084
	.4byte _0810709C
	.4byte _081070B4
	.4byte _081070CC
	.4byte _081070F0
_08107084:
	ldr r0, _08107094
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107098
	b _081070D8
	.align 2, 0
_08107094: .4byte gPictureFrameTiles_0
_08107098: .4byte gPictureFrameTilemap_0
_0810709C:
	ldr r0, _081070AC
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _081070B0
	b _081070D8
	.align 2, 0
_081070AC: .4byte gPictureFrameTiles_1
_081070B0: .4byte gPictureFrameTilemap_1
_081070B4:
	ldr r0, _081070C4
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _081070C8
	b _081070D8
	.align 2, 0
_081070C4: .4byte gPictureFrameTiles_2
_081070C8: .4byte gPictureFrameTilemap_2
_081070CC:
	ldr r0, _081070E4
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _081070E8
_081070D8:
	ldr r1, _081070EC
	ldr r1, [r1]
	bl RLUnCompWram
	b _08107104
	.align 2, 0
_081070E4: .4byte gPictureFrameTiles_3
_081070E8: .4byte gPictureFrameTilemap_3
_081070EC: .4byte gUnknown_03005E10
_081070F0:
	ldr r0, _08107180
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107184
	ldr r1, _08107188
	ldr r1, [r1]
	bl RLUnCompWram
_08107104:
	movs r1, 0
	ldr r5, _0810718C
	ldr r0, _08107190
	adds r4, r0, 0
_0810710C:
	movs r3, 0
	lsls r2, r1, 5
_08107110:
	adds r0, r2, r3
	lsls r0, 1
	adds r0, r5
	strh r4, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _08107110
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bls _0810710C
	movs r1, 0
	ldr r0, _08107194
	mov r12, r0
	ldr r7, _08107188
_08107134:
	movs r3, 0
	adds r6, r1, 0x1
	lsls r5, r1, 5
	lsls r4, r1, 6
_0810713C:
	adds r2, r5, r3
	lsls r2, 1
	add r2, r12
	ldr r0, [r7]
	adds r0, r4, r0
	lsls r1, r3, 1
	adds r0, r1
	adds r0, 0x8C
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x11
	bls _0810713C
	lsls r0, r6, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	bls _08107134
	movs r3, 0
	ldr r4, _08107198
	ldr r2, _08107188
_08107168:
	lsls r1, r3, 1
	adds r1, r4
	ldr r0, [r2]
	adds r0, 0x8E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _08107168
	b _0810726E
	.align 2, 0
_08107180: .4byte gPictureFrameTiles_4
_08107184: .4byte gPictureFrameTilemap_4
_08107188: .4byte gUnknown_03005E10
_0810718C: .4byte 0x06006000
_08107190: .4byte 0x00001015
_08107194: .4byte 0x0600608c
_08107198: .4byte 0x0600608e
_0810719C:
	cmp r5, 0x7
	bhi _081071B8
	ldr r0, _081071B0
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _081071B4
	b _08107248
	.align 2, 0
_081071B0: .4byte gPictureFrameTiles_5
_081071B4: .4byte gPictureFrameTilemap_5
_081071B8:
	ldr r0, _081071D8
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0810726E
	lsls r0, 2
	ldr r1, _081071DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081071D8: .4byte gUnknown_03005E8C
_081071DC: .4byte _081071E0
	.align 2, 0
_081071E0:
	.4byte _081071F4
	.4byte _0810720C
	.4byte _08107224
	.4byte _0810723C
	.4byte _0810725C
_081071F4:
	ldr r0, _08107204
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107208
	b _08107248
	.align 2, 0
_08107204: .4byte gPictureFrameTiles_0
_08107208: .4byte gPictureFrameTilemap_0
_0810720C:
	ldr r0, _0810721C
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107220
	b _08107248
	.align 2, 0
_0810721C: .4byte gPictureFrameTiles_1
_08107220: .4byte gPictureFrameTilemap_1
_08107224:
	ldr r0, _08107234
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107238
	b _08107248
	.align 2, 0
_08107234: .4byte gPictureFrameTiles_2
_08107238: .4byte gPictureFrameTilemap_2
_0810723C:
	ldr r0, _08107250
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107254
_08107248:
	ldr r1, _08107258
	bl RLUnCompVram
	b _0810726E
	.align 2, 0
_08107250: .4byte gPictureFrameTiles_3
_08107254: .4byte gPictureFrameTilemap_3
_08107258: .4byte 0x06006000
_0810725C:
	ldr r0, _08107274
	movs r1, 0xC0
	lsls r1, 19
	bl RLUnCompVram
	ldr r0, _08107278
	ldr r1, _0810727C
	bl RLUnCompVram
_0810726E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08107274: .4byte gPictureFrameTiles_4
_08107278: .4byte gPictureFrameTilemap_4
_0810727C: .4byte 0x06006000
	thumb_func_end sub_8106C40

	thumb_func_start sub_8106E98
sub_8106E98: @ 8107280
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _081072B8
	ldr r1, _081072BC
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r4, 0x3C]
	str r2, [r4, 0x40]
	adds r3, r4, 0
	adds r3, 0x40
	ldrh r2, [r3]
	ldr r1, _081072C0
	ands r1, r2
	strh r1, [r3]
	ldrh r1, [r4, 0x3E]
	ldr r0, _081072C4
	ands r0, r1
	movs r1, 0x58
	orrs r0, r1
	strh r0, [r4, 0x3E]
	adds r1, r4, 0
	adds r1, 0x3C
	movs r0, 0x18
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081072B8: .4byte gMain
_081072BC: .4byte gOamData_83F6138
_081072C0: .4byte 0xfffffc00
_081072C4: .4byte 0xfffffe00
	thumb_func_end sub_8106E98

	thumb_func_start sub_8106EE0
sub_8106EE0: @ 81072C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _081072E0
	ldr r0, _081072DC
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	b _081072F0
	.align 2, 0
_081072DC: .4byte gUnknown_03005E8C
_081072E0:
	ldr r0, _08107300
	ldr r0, [r0]
	ldrb r0, [r0, 0xA]
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
_081072F0:
	cmp r0, 0x4
	bhi _0810732E
	lsls r0, 2
	ldr r1, _08107304
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08107300: .4byte gUnknown_03005E8C
_08107304: .4byte _08107308
	.align 2, 0
_08107308:
	.4byte _0810731C
	.4byte _08107320
	.4byte _08107324
	.4byte _08107328
	.4byte _0810732C
_0810731C:
	movs r0, 0x9
	b _0810732E
_08107320:
	movs r0, 0xD
	b _0810732E
_08107324:
	movs r0, 0x2
	b _0810732E
_08107328:
	movs r0, 0x24
	b _0810732E
_0810732C:
	movs r0, 0x6
_0810732E:
	pop {r1}
	bx r1
	thumb_func_end sub_8106EE0

	thumb_func_start sub_8106F4C
sub_8106F4C: @ 8107334
	ldr r0, _08107344
	ldr r1, _08107348
	str r1, [r0]
	ldr r0, _0810734C
	ldr r2, _08107350
	adds r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08107344: .4byte gUnknown_03005E90
_08107348: .4byte 0x02017e00
_0810734C: .4byte gUnknown_03005E10
_08107350: .4byte 0xffffe000
	thumb_func_end sub_8106F4C

	thumb_func_start sub_8106F6C
sub_8106F6C: @ 8107354
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08107394
	ldr r0, _08107398
	ldr r0, [r0]
	str r0, [r1, 0x4]
	ldr r0, _0810739C
	ldr r0, [r0]
	str r0, [r1, 0x8]
	movs r2, 0
	strb r2, [r1, 0x18]
	ldr r0, _081073A0
	ldr r0, [r0]
	ldrb r0, [r0]
	strb r0, [r1, 0x1F]
	strb r2, [r1, 0x19]
	strb r2, [r1, 0x1A]
	movs r0, 0x40
	strb r0, [r1, 0x1B]
	strb r0, [r1, 0x1C]
	strb r0, [r1, 0x1D]
	strb r0, [r1, 0x1E]
	subs r0, r3, 0x2
	adds r4, r1, 0
	cmp r0, 0x22
	bhi _08107438
	lsls r0, 2
	ldr r1, _081073A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08107394: .4byte gUnknown_03005E20
_08107398: .4byte gUnknown_03005E10
_0810739C: .4byte gUnknown_03005E90
_081073A0: .4byte gUnknown_03005E8C
_081073A4: .4byte _081073A8
	.align 2, 0
_081073A8:
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107434
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107438
	.4byte _08107434
_08107434:
	movs r0, 0x3
	b _0810743A
_08107438:
	movs r0, 0x1
_0810743A:
	strh r0, [r4, 0x14]
	movs r0, 0x2
	strh r0, [r4, 0x16]
	strb r3, [r4]
	ldr r0, _08107470
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80FC7A0
	adds r0, r4, 0
	bl sub_80FDA18
	adds r0, r4, 0
	bl sub_80FD8CC
	ldr r0, _08107474
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x80
	lsls r2, 2
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08107470: .4byte 0x06010000
_08107474: .4byte gUnknown_03005E90
	thumb_func_end sub_8106F6C

	thumb_func_start sub_8107090
sub_8107090: @ 8107478
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	bl sub_8106F4C
	ldr r0, _081074B8
	ldr r0, [r0]
	ldrh r0, [r0, 0x8]
	movs r1, 0
	bl sub_8106AC4
	adds r0, r4, 0
	bl sub_8106EE0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8106F6C
	adds r0, r4, 0
	bl sub_8106E98
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8106C40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081074B8: .4byte gUnknown_03005E8C
	thumb_func_end sub_8107090

	.align 2, 0 @ Don't pad with nop.
