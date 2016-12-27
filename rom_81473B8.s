	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81473B8
sub_81473B8: @ 8147774
	push {lr}
	ldr r0, _081477A4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081477BC
	ldr r2, _081477A8
	ldrh r1, [r2, 0x4]
	ldr r0, _081477AC
	cmp r1, r0
	bne _081477BC
	ldr r1, [r2]
	ldr r0, _081477B0
	cmp r1, r0
	beq _081477A0
	ldr r0, _081477B4
	cmp r1, r0
	beq _081477A0
	ldr r0, _081477B8
	cmp r1, r0
	bne _081477BC
_081477A0:
	movs r0, 0x1
	b _081477BE
	.align 2, 0
_081477A4: .4byte 0x0000084f
_081477A8: .4byte gSaveBlock1
_081477AC: .4byte 0x00004718
_081477B0: .4byte 0x0003000a
_081477B4: .4byte 0x00030009
_081477B8: .4byte 0x0003000b
_081477BC:
	movs r0, 0
_081477BE:
	pop {r1}
	bx r1
	thumb_func_end sub_81473B8

	thumb_func_start sub_8147408
sub_8147408: @ 81477C4
	push {lr}
	ldr r2, _0814781C
	movs r0, 0x10
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147820
	movs r0, 0x11
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147824
	movs r0, 0x10
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _08147828
	movs r0, 0x11
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _0814782C
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _08147830
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_0814781C: .4byte 0x0000022a
_08147820: .4byte 0x0000022b
_08147824: .4byte 0x00000e32
_08147828: .4byte 0x00000233
_0814782C: .4byte 0x00000e34
_08147830: .4byte 0x0000084f
	thumb_func_end sub_8147408

	thumb_func_start sub_8147478
sub_8147478: @ 8147834
	push {r4,lr}
	ldr r4, _08147870
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	ldr r1, _08147874
	cmp r0, r1
	bne _0814787C
	bl CalculatePlayerPartyCount
	ldr r0, _08147878
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	adds r1, r4, 0
	subs r1, 0x64
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0x9D
	lsls r1, 1
	cmp r0, r1
	bne _0814787C
	movs r0, 0x1
	b _0814787E
	.align 2, 0
_08147870: .4byte gPlayerParty
_08147874: .4byte 0x0000017d
_08147878: .4byte gPlayerPartyCount
_0814787C:
	movs r0, 0
_0814787E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8147478

	thumb_func_start sub_81474C8
sub_81474C8: @ 8147884
	push {lr}
	movs r0, 0x85
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081478C8
	ldr r2, _081478B8
	ldrh r1, [r2, 0x4]
	movs r0, 0xC3
	lsls r0, 3
	cmp r1, r0
	bne _081478C8
	ldr r1, [r2]
	ldr r0, _081478BC
	cmp r1, r0
	beq _081478B4
	ldr r0, _081478C0
	cmp r1, r0
	beq _081478B4
	ldr r0, _081478C4
	cmp r1, r0
	bne _081478C8
_081478B4:
	movs r0, 0x1
	b _081478CA
	.align 2, 0
_081478B8: .4byte gSaveBlock1
_081478BC: .4byte 0x0017000a
_081478C0: .4byte 0x00170009
_081478C4: .4byte 0x0017000b
_081478C8:
	movs r0, 0
_081478CA:
	pop {r1}
	bx r1
	thumb_func_end sub_81474C8

	thumb_func_start sub_8147514
sub_8147514: @ 81478D0
	push {lr}
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	ldr r2, _08147930
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147934
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147938
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _0814793C
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147940
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	movs r0, 0x85
	lsls r0, 4
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147930: .4byte 0x0000022a
_08147934: .4byte 0x0000022b
_08147938: .4byte 0x00000e32
_0814793C: .4byte 0x00000233
_08147940: .4byte 0x00000e34
	thumb_func_end sub_8147514

	thumb_func_start sub_8147588
sub_8147588: @ 8147944
	push {lr}
	ldr r0, _08147968
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08147978
	ldr r2, _0814796C
	ldrh r1, [r2, 0x4]
	ldr r0, _08147970
	cmp r1, r0
	bne _08147978
	ldr r1, [r2]
	ldr r0, _08147974
	cmp r1, r0
	bne _08147978
	movs r0, 0x1
	b _0814797A
	.align 2, 0
_08147968: .4byte 0x00000852
_0814796C: .4byte gSaveBlock1
_08147970: .4byte 0x00004418
_08147974: .4byte 0x00190008
_08147978:
	movs r0, 0
_0814797A:
	pop {r1}
	bx r1
	thumb_func_end sub_8147588

	thumb_func_start sub_81475C4
sub_81475C4: @ 8147980
	push {lr}
	ldr r0, _08147994
	ldr r1, _08147998
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x3C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08147994: .4byte gUnknown_0202FF84
_08147998: .4byte gUnknown_03005CE0
	thumb_func_end sub_81475C4

	thumb_func_start FldEff_UseFlyAncientTomb
FldEff_UseFlyAncientTomb: @ 814799C
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081479C0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _081479C4
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081479C0: .4byte gTasks
_081479C4: .4byte sub_814760C
	thumb_func_end FldEff_UseFlyAncientTomb

	thumb_func_start sub_814760C
sub_814760C: @ 81479C8
	push {lr}
	movs r0, 0x3C
	bl FieldEffectActiveListRemove
	bl sub_814761C
	pop {r0}
	bx r0
	thumb_func_end sub_814760C

	thumb_func_start sub_814761C
sub_814761C: @ 81479D8
	push {lr}
	ldr r2, _08147A30
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147A34
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147A38
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147A3C
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147A40
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySE
	ldr r0, _08147A44
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147A30: .4byte 0x0000022a
_08147A34: .4byte 0x0000022b
_08147A38: .4byte 0x00000e32
_08147A3C: .4byte 0x00000233
_08147A40: .4byte 0x00000e34
_08147A44: .4byte 0x00000852
	thumb_func_end sub_814761C

	thumb_func_start sub_814768C
sub_814768C: @ 8147A48
	push {lr}
	ldr r0, _08147A64
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08147A5E
	ldr r0, _08147A68
	movs r1, 0x50
	bl CreateTask
_08147A5E:
	pop {r0}
	bx r0
	.align 2, 0
_08147A64: .4byte 0x00000851
_08147A68: .4byte sub_81476B0
	thumb_func_end sub_814768C

	thumb_func_start sub_81476B0
sub_81476B0: @ 8147A6C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08147A90
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _08147B26
	lsls r0, 2
	ldr r1, _08147A94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147A90: .4byte 0x03004b38
_08147A94: .4byte _08147A98
	.align 2, 0
_08147A98:
	.4byte _08147AAC
	.4byte _08147ABA
	.4byte _08147AEC
	.4byte _08147B04
	.4byte _08147B16
_08147AAC:
	movs r1, 0xE1
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4]
	b _08147B26
_08147ABA:
	bl sub_8147774
	cmp r0, 0
	beq _08147AD2
	bl MenuZeroFillScreen
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	strh r0, [r4]
	b _08147B26
_08147AD2:
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _08147B26
	bl MenuZeroFillScreen
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x1E
	strh r0, [r4, 0x2]
	b _08147B26
_08147AEC:
	bl sub_8147774
	cmp r0, 0
	beq _08147B04
	bl sub_8064E2C
	adds r0, r5, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	b _08147B26
_08147B04:
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _08147B26
	movs r0, 0x4
	strh r0, [r4]
	b _08147B26
_08147B16:
	bl sub_8064E2C
	ldr r0, _08147B2C
	bl ScriptContext1_SetupScript
	adds r0, r5, 0
	bl DestroyTask
_08147B26:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147B2C: .4byte gUnknown_0815EF19
	thumb_func_end sub_81476B0

	thumb_func_start sub_8147774
sub_8147774: @ 8147B30
	push {lr}
	movs r1, 0xFF
	ldr r0, _08147B60
	ldrb r2, [r0, 0x13]
	cmp r2, 0x1
	bne _08147B44
	movs r3, 0xC0
	lsls r3, 2
	adds r0, r3, 0
	orrs r1, r0
_08147B44:
	cmp r2, 0x2
	bne _08147B50
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	orrs r1, r0
_08147B50:
	ldr r0, _08147B64
	ldrh r0, [r0, 0x2E]
	ands r1, r0
	cmp r1, 0
	bne _08147B68
	movs r0, 0
	b _08147B6A
	.align 2, 0
_08147B60: .4byte gSaveBlock2
_08147B64: .4byte gMain
_08147B68:
	movs r0, 0x1
_08147B6A:
	pop {r1}
	bx r1
	thumb_func_end sub_8147774

	thumb_func_start sub_81477B4
sub_81477B4: @ 8147B70
	push {lr}
	ldr r0, _08147BA4
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147BA8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	movs r0, 0x2
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0x32
	strh r0, [r1, 0x14]
	movs r0, 0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_08147BA4: .4byte sub_814782C
_08147BA8: .4byte gTasks
	thumb_func_end sub_81477B4

	thumb_func_start sub_81477F0
sub_81477F0: @ 8147BAC
	push {lr}
	ldr r0, _08147BE0
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147BE4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	movs r0, 0x3
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_08147BE0: .4byte sub_814782C
_08147BE4: .4byte gTasks
	thumb_func_end sub_81477F0

	thumb_func_start sub_814782C
sub_814782C: @ 8147BE8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08147C48
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _08147C40
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08147C40
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl InstallCameraPanAheadCallback
_08147C40:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147C48: .4byte gTasks
	thumb_func_end sub_814782C

	thumb_func_start sub_8147890
sub_8147890: @ 8147C4C
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8147890

	thumb_func_start sub_81478A8
sub_81478A8: @ 8147C64
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_81478A8

	thumb_func_start sub_81478BC
sub_81478BC: @ 8147C78
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08147C94
	ldr r1, _08147C98
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xD
	bls _08147C8A
	b _08147E8C
_08147C8A:
	lsls r0, 2
	ldr r1, _08147C9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147C94: .4byte gMain
_08147C98: .4byte 0x0000043c
_08147C9C: .4byte _08147CA0
	.align 2, 0
_08147CA0:
	.4byte _08147CD8
	.4byte _08147CF4
	.4byte _08147D08
	.4byte _08147D1C
	.4byte _08147D22
	.4byte _08147D3C
	.4byte _08147D48
	.4byte _08147D74
	.4byte _08147D98
	.4byte _08147DB0
	.4byte _08147DDC
	.4byte _08147DF8
	.4byte _08147E18
	.4byte _08147E48
_08147CD8:
	bl sub_80F9438
	bl sub_80F9368
	bl sub_8147B04
	ldr r1, _08147CEC
	ldr r2, _08147CF0
	adds r1, r2
	b _08147E06
	.align 2, 0
_08147CEC: .4byte gMain
_08147CF0: .4byte 0x0000043c
_08147CF4:
	bl ResetPaletteFade
	ldr r2, _08147D04
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	b _08147E00
	.align 2, 0
_08147D04: .4byte gPaletteFade
_08147D08:
	bl ResetSpriteData
	ldr r1, _08147D14
	ldr r2, _08147D18
	adds r1, r2
	b _08147E06
	.align 2, 0
_08147D14: .4byte gMain
_08147D18: .4byte 0x0000043c
_08147D1C:
	bl FreeAllSpritePalettes
	b _08147E00
_08147D22:
	ldr r0, _08147D30
	bl SetUpWindowConfig
	ldr r1, _08147D34
	ldr r2, _08147D38
	adds r1, r2
	b _08147E06
	.align 2, 0
_08147D30: .4byte gWindowConfig_81E6E50
_08147D34: .4byte gMain
_08147D38: .4byte 0x0000043c
_08147D3C:
	ldr r0, _08147D44
	bl MultistepInitMenuWindowBegin
	b _08147E00
	.align 2, 0
_08147D44: .4byte gWindowConfig_81E6E50
_08147D48:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _08147D52
	b _08147E8C
_08147D52:
	ldr r0, _08147D64
	ldr r1, _08147D68
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r1, _08147D6C
	ldr r2, _08147D70
	adds r1, r2
	b _08147E06
	.align 2, 0
_08147D64: .4byte 0x02000000
_08147D68: .4byte 0x0001ffff
_08147D6C: .4byte gMain
_08147D70: .4byte 0x0000043c
_08147D74:
	ldr r0, _08147D90
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08147D94
	adds r0, r1
	bl sub_8147B20
	lsls r0, 24
	cmp r0, 0
	bne _08147D8C
	b _08147E8C
_08147D8C:
	b _08147E00
	.align 2, 0
_08147D90: .4byte gUnknown_02039310
_08147D94: .4byte gPlayerParty
_08147D98:
	bl sub_81480B4
	ldr r1, _08147DA8
	ldr r2, _08147DAC
	adds r1, r2
	strb r0, [r1]
	b _08147E00
	.align 2, 0
_08147DA8: .4byte 0x02000000
_08147DAC: .4byte 0x0001fffd
_08147DB0:
	ldr r0, _08147DCC
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08147DD0
	adds r0, r1
	bl sub_8147F84
	ldr r1, _08147DD4
	ldr r2, _08147DD8
	adds r1, r2
	strb r0, [r1]
	b _08147E00
	.align 2, 0
_08147DCC: .4byte gUnknown_02039310
_08147DD0: .4byte gPlayerParty
_08147DD4: .4byte 0x02000000
_08147DD8: .4byte 0x0001fffe
_08147DDC:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _08147DF0
	ldr r2, _08147DF4
	adds r1, r2
	b _08147E06
	.align 2, 0
_08147DF0: .4byte gMain
_08147DF4: .4byte 0x0000043c
_08147DF8:
	bl sub_8055870
	cmp r0, 0x1
	beq _08147E8C
_08147E00:
	ldr r1, _08147E10
	ldr r0, _08147E14
	adds r1, r0
_08147E06:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08147E8C
	.align 2, 0
_08147E10: .4byte gMain
_08147E14: .4byte 0x0000043c
_08147E18:
	ldr r3, _08147E6C
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08147E70
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08147E74
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08147E78
	bl SetVBlankCallback
	ldr r1, _08147E7C
	ldr r2, _08147E80
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08147E48:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08147E84
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08147E88
	bl SetMainCallback2
	movs r0, 0x1
	b _08147E8E
	.align 2, 0
_08147E6C: .4byte 0x04000208
_08147E70: .4byte 0x04000200
_08147E74: .4byte 0x04000004
_08147E78: .4byte sub_81478A8
_08147E7C: .4byte gMain
_08147E80: .4byte 0x0000043c
_08147E84: .4byte gPaletteFade
_08147E88: .4byte sub_8147890
_08147E8C:
	movs r0, 0
_08147E8E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81478BC

	thumb_func_start sub_8147ADC
sub_8147ADC: @ 8147E98
	push {lr}
_08147E9A:
	bl sub_81478BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147EAE
	movs r0, 0x1
	bl sub_8147DDC
	b _08147EBA
_08147EAE:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147E9A
_08147EBA:
	pop {r0}
	bx r0
	thumb_func_end sub_8147ADC

	thumb_func_start sub_8147B04
sub_8147B04: @ 8147EC0
	ldr r1, _08147ED4
	ldr r2, _08147ED8
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08147ED4: .4byte 0x0400000a
_08147ED8: .4byte 0x00001d02
	thumb_func_end sub_8147B04

	thumb_func_start sub_8147B20
sub_8147B20: @ 8147EDC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _08147EFC
	ldr r1, _08147F00
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _08147EF0
	b _08148040
_08147EF0:
	lsls r0, 2
	ldr r1, _08147F04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147EFC: .4byte 0x02000000
_08147F00: .4byte 0x0001ffff
_08147F04: .4byte _08147F08
	.align 2, 0
_08147F08:
	.4byte _08147F2C
	.4byte _08147F74
	.4byte _08147FAC
	.4byte _08147FB8
	.4byte _08147FC4
	.4byte _08147FD0
	.4byte _08147FE8
	.4byte _08147FF4
	.4byte _0814801C
_08147F2C:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _08147F68
	adds r0, r1
	ldr r1, _08147F6C
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08147F70
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	bl sub_800D334
	b _08147FFC
	.align 2, 0
_08147F68: .4byte gMonFrontPicTable
_08147F6C: .4byte gMonFrontPicCoords
_08147F70: .4byte gUnknown_081FAF4C
_08147F74:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	ldrh r0, [r4, 0x4]
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	b _08147FFC
_08147FAC:
	ldr r0, _08147FB4
	bl LoadCompressedObjectPic
	b _08147FFC
	.align 2, 0
_08147FB4: .4byte gUnknown_083F7F74
_08147FB8:
	ldr r0, _08147FC0
	bl LoadCompressedObjectPalette
	b _08147FFC
	.align 2, 0
_08147FC0: .4byte gUnknown_083F7F7C
_08147FC4:
	ldr r0, _08147FCC
	bl LoadCompressedObjectPic
	b _08147FFC
	.align 2, 0
_08147FCC: .4byte gUnknown_084121DC
_08147FD0:
	ldr r0, _08147FE0
	ldrb r0, [r0]
	bl sub_8147C90
	ldr r0, _08147FE4
	bl LoadCompressedObjectPalette
	b _08147FFC
	.align 2, 0
_08147FE0: .4byte gScriptItemId
_08147FE4: .4byte gUnknown_02039350
_08147FE8:
	ldr r0, _08147FF0
	movs r1, 0xC0
	lsls r1, 19
	b _08147FF8
	.align 2, 0
_08147FF0: .4byte gBattleTerrainTiles_Building
_08147FF4:
	ldr r0, _0814800C
	ldr r1, _08148010
_08147FF8:
	bl LZDecompressVram
_08147FFC:
	ldr r1, _08148014
	ldr r0, _08148018
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08148040
	.align 2, 0
_0814800C: .4byte gUnknown_08E782FC
_08148010: .4byte 0x0600e800
_08148014: .4byte 0x02000000
_08148018: .4byte 0x0001ffff
_0814801C:
	ldr r0, _08148034
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	ldr r0, _08148038
	ldr r1, _0814803C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _08148042
	.align 2, 0
_08148034: .4byte gBattleTerrainPalette_BattleTower
_08148038: .4byte 0x02000000
_0814803C: .4byte 0x0001ffff
_08148040:
	movs r0, 0
_08148042:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8147B20

	thumb_func_start sub_8147C90
sub_8147C90: @ 814804C
	push {lr}
	lsls r0, 24
	lsrs r0, 21
	ldr r1, _08148074
	adds r0, r1
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r2, _08148078
	ldr r1, _0814807C
	lsrs r0, 22
	subs r0, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08148080
	strh r0, [r2, 0x4]
	pop {r0}
	bx r0
	.align 2, 0
_08148074: .4byte 0x02025f2c
_08148078: .4byte gUnknown_02039350
_0814807C: .4byte gUnknown_084120A4
_08148080: .4byte 0x000039e2
	thumb_func_end sub_8147C90

	thumb_func_start sub_8147CC8
sub_8147CC8: @ 8148084
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081480BC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08148098
	b _0814818A
_08148098:
	ldr r0, _081480C0
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x8
	ldrsh r3, [r1, r0]
	ldr r0, _081480C4
	adds r5, r2, 0
	cmp r3, r0
	beq _0814810C
	cmp r3, r0
	bgt _081480C8
	cmp r3, 0
	beq _081480DC
	cmp r3, 0xFF
	beq _081480F4
	b _08148148
	.align 2, 0
_081480BC: .4byte gPaletteFade
_081480C0: .4byte gTasks
_081480C4: .4byte 0x0000010d
_081480C8:
	ldr r0, _081480D8
	cmp r3, r0
	beq _08148124
	adds r0, 0x10
	cmp r3, r0
	beq _0814813C
	b _08148148
	.align 2, 0
_081480D8: .4byte 0x00000119
_081480DC:
	ldr r0, _081480EC
	strb r3, [r0]
	ldr r0, _081480F0
	strh r3, [r0]
	bl sub_81481DC
	b _08148148
	.align 2, 0
_081480EC: .4byte gUnknown_03005F3C
_081480F0: .4byte gUnknown_03005F94
_081480F4:
	ldr r0, _08148104
	ldr r2, _08148108
	adds r0, r2
	ldrb r0, [r0]
	ldrb r1, [r1, 0xA]
	bl sub_8148108
	b _08148148
	.align 2, 0
_08148104: .4byte 0x02000000
_08148108: .4byte 0x0001fffd
_0814810C:
	bl sub_814817C
	ldr r1, _0814811C
	ldr r2, _08148120
	adds r1, r2
	strb r0, [r1]
	b _08148148
	.align 2, 0
_0814811C: .4byte 0x02000000
_08148120: .4byte 0x0001fffc
_08148124:
	ldr r0, _08148134
	ldr r1, _08148138
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8148044
	b _08148148
	.align 2, 0
_08148134: .4byte 0x02000000
_08148138: .4byte 0x0001fffe
_0814813C:
	ldr r0, _08148144
	str r0, [r1]
	b _0814818A
	.align 2, 0
_08148144: .4byte sub_8147E40
_08148148:
	ldr r0, _0814815C
	ldr r1, _08148160
	ldrh r2, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bcs _08148164
	bl sub_814825C
	b _08148174
	.align 2, 0
_0814815C: .4byte gUnknown_03005F94
_08148160: .4byte gUnknown_03005F34
_08148164:
	cmp r2, r0
	bne _08148174
	ldr r0, _08148190
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xFE
	strh r0, [r1, 0x8]
_08148174:
	ldr r1, _08148194
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _08148190
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0814818A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08148190: .4byte gTasks
_08148194: .4byte gUnknown_03005F94
	thumb_func_end sub_8147CC8

	thumb_func_start sub_8147DDC
sub_8147DDC: @ 8148198
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081481C4
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081481C8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081481C4: .4byte sub_8147CC8
_081481C8: .4byte gTasks
	thumb_func_end sub_8147DDC

	thumb_func_start sub_8147E10
sub_8147E10: @ 81481CC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081481EC
	ldr r0, _081481F4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081481F8
	str r0, [r1]
_081481EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081481F4: .4byte gTasks
_081481F8: .4byte sub_8147F4C
	thumb_func_end sub_8147E10

	thumb_func_start sub_8147E40
sub_8147E40: @ 81481FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08148250
	ldrb r1, [r0]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08148254
	adds r5, r0
	ldr r0, _08148258
	ldrh r4, [r0]
	lsls r4, 3
	ldr r0, _0814825C
	adds r4, r0
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_810CAE4
	ldr r6, _08148260
	strh r0, [r6]
	ldr r1, _08148264
	adds r0, r5, 0
	bl GetMonNickname
	ldr r1, _08148268
	adds r0, r4, 0
	bl sub_810CB44
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08148274
	ldr r0, _0814826C
	ldr r1, _08148270
	bl StringExpandPlaceholders
	b _08148294
	.align 2, 0
_08148250: .4byte gUnknown_02039310
_08148254: .4byte gPlayerParty
_08148258: .4byte gScriptItemId
_0814825C: .4byte 0x02025f2c
_08148260: .4byte gUnknown_02039312
_08148264: .4byte gStringVar1
_08148268: .4byte gStringVar2
_0814826C: .4byte gStringVar4
_08148270: .4byte gContestStatsText_NormallyAte
_08148274:
	cmp r0, 0
	ble _0814828C
	ldr r0, _08148284
	ldr r1, _08148288
	bl StringExpandPlaceholders
	b _08148294
	.align 2, 0
_08148284: .4byte gStringVar4
_08148288: .4byte gContestStatsText_HappilyAte
_0814828C:
	ldr r0, _081482B4
	ldr r1, _081482B8
	bl StringExpandPlaceholders
_08148294:
	ldr r0, _081482B4
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _081482BC
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _081482C0
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081482B4: .4byte gStringVar4
_081482B8: .4byte gContestStatsText_DisdainfullyAte
_081482BC: .4byte gTasks
_081482C0: .4byte sub_8147E10
	thumb_func_end sub_8147E40

	thumb_func_start sub_8147F08
sub_8147F08: @ 81482C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081482F8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081482F0
	ldr r0, _081482FC
	ldr r1, _08148300
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r0, _08148304
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_081482F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081482F8: .4byte gPaletteFade
_081482FC: .4byte gMPlay_BGM
_08148300: .4byte 0x0000ffff
_08148304: .4byte gMain
	thumb_func_end sub_8147F08

	thumb_func_start sub_8147F4C
sub_8147F4C: @ 8148308
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
	ldr r1, _08148338
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814833C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148338: .4byte gTasks
_0814833C: .4byte sub_8147F08
	thumb_func_end sub_8147F4C

	thumb_func_start sub_8147F84
sub_8147F84: @ 8148340
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _081483E0
	movs r1, 0x30
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081483E4
	strh r4, [r0]
	ldr r0, _081483E8
	mov r1, r8
	strb r1, [r0]
	adds r0, r5, 0
	bl GetNature
	ldr r1, _081483EC
	strb r0, [r1]
	ldr r7, _081483F0
	mov r1, r8
	lsls r0, r1, 4
	add r0, r8
	lsls r5, r0, 2
	adds r6, r5, r7
	strh r4, [r6, 0x32]
	adds r0, r7, 0
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _081483F4
	str r1, [r0]
	ldr r0, _081483F8
	mov r9, r0
	movs r0, 0x1
	mov r1, r9
	strb r0, [r1]
	adds r0, r4, 0
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _081483D2
	adds r0, r7, 0
	adds r0, 0x10
	adds r0, r5, r0
	ldr r1, _081483FC
	str r1, [r0]
	ldrb r3, [r6, 0x1]
	movs r0, 0x3
	orrs r3, r0
	strb r3, [r6, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r6, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r6, 0
	bl CalcCenterToCornerVec
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
_081483D2:
	mov r0, r8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081483E0: .4byte gUnknown_02024E8C
_081483E4: .4byte gUnknown_03005F24
_081483E8: .4byte gUnknown_03005F2C
_081483EC: .4byte gUnknown_03005F30
_081483F0: .4byte gSprites
_081483F4: .4byte SpriteCallbackDummy
_081483F8: .4byte gUnknown_03005F28
_081483FC: .4byte gSpriteAffineAnimTable_84120EC
	thumb_func_end sub_8147F84

	thumb_func_start sub_8148044
sub_8148044: @ 8148400
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08148428
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r0, 0x30
	strh r0, [r2, 0x20]
	movs r0, 0x50
	strh r0, [r2, 0x22]
	ldr r0, _0814842C
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x30]
	adds r3, 0x1C
	adds r1, r3
	ldr r0, _08148430
	str r0, [r1]
	bx lr
	.align 2, 0
_08148428: .4byte gSprites
_0814842C: .4byte 0x0000fff8
_08148430: .4byte sub_8148078
	thumb_func_end sub_8148044

	thumb_func_start sub_8148078
sub_8148078: @ 8148434
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x2E]
	ldrh r2, [r4, 0x22]
	adds r1, r0, r2
	strh r1, [r4, 0x22]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0814845A
	ldrh r0, [r4, 0x32]
	movs r1, 0
	bl PlayCry1
_0814845A:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bne _08148466
	ldr r0, _0814846C
	str r0, [r4, 0x1C]
_08148466:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814846C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8148078

	thumb_func_start sub_81480B4
sub_81480B4: @ 8148470
	push {r4,r5,lr}
	movs r0, 0xBC
	movs r1, 0x64
	movs r2, 0x2
	bl sub_810BA50
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _081484B8
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r0, r3, r5
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r1, r5, 0
	adds r1, 0x10
	adds r1, r3, r1
	ldr r2, _081484BC
	str r2, [r1]
	adds r5, 0x1C
	adds r3, r5
	ldr r1, _081484C0
	str r1, [r3]
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081484B8: .4byte gSprites
_081484BC: .4byte gSpriteAffineAnimTable_84121A0
_081484C0: .4byte SpriteCallbackDummy
	thumb_func_end sub_81480B4

	thumb_func_start sub_8148108
sub_8148108: @ 81484C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08148504
	mov r8, r0
	lsls r0, r7, 4
	adds r0, r7
	lsls r6, r0, 2
	mov r0, r8
	adds r4, r6, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	cmp r5, 0
	bne _0814850C
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _08148508
	b _08148514
	.align 2, 0
_08148504: .4byte gSprites
_08148508: .4byte gSpriteAffineAnimTable_84121A4
_0814850C:
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _08148530
_08148514:
	str r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08148534
	adds r0, r1
	bl InitSpriteAffineAnim
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148530: .4byte gSpriteAffineAnimTable_84121A8
_08148534: .4byte gSprites
	thumb_func_end sub_8148108

	thumb_func_start sub_814817C
sub_814817C: @ 8148538
	push {lr}
	ldr r0, _08148560
	movs r1, 0xAE
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08148564
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r2, _08148568
	strh r2, [r1, 0x2E]
	movs r2, 0x1
	strh r2, [r1, 0x30]
	pop {r1}
	bx r1
	.align 2, 0
_08148560: .4byte gSpriteTemplate_84121E4
_08148564: .4byte gSprites
_08148568: .4byte 0x0000fff4
	thumb_func_end sub_814817C

	thumb_func_start sub_81481B0
sub_81481B0: @ 814856C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	subs r0, 0x4
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	ldrh r3, [r2, 0x22]
	adds r1, r0, r3
	strh r1, [r2, 0x22]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08148592
	adds r0, r2, 0
	bl DestroySprite
_08148592:
	pop {r0}
	bx r0
	thumb_func_end sub_81481B0

	thumb_func_start sub_81481DC
sub_81481DC: @ 8148598
	push {r4-r7,lr}
	ldr r6, _08148608
	movs r0, 0x1
	strh r0, [r6]
	ldr r1, _0814860C
	ldr r0, _08148610
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r3, [r0]
	movs r4, 0
	ldr r2, _08148614
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r7, r2, 0
	adds r7, 0x8
	adds r0, r1, r7
	ldrh r0, [r0]
	adds r0, 0x1
	strh r0, [r6]
	adds r5, r2, 0
	adds r5, 0x12
	adds r1, r5
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08148600
	adds r2, r6, 0
	adds r6, r5, 0
	adds r5, r7, 0
_081485D6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r4, 0x7
	bhi _08148600
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	ldrh r7, [r2]
	adds r0, r7
	strh r0, [r2]
	adds r1, r6
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x1
	bne _081485D6
_08148600:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148608: .4byte gUnknown_03005F34
_0814860C: .4byte gNatureToMonPokeblockAnim
_08148610: .4byte gUnknown_03005F30
_08148614: .4byte gMonPokeblockAnims
	thumb_func_end sub_81481DC

	thumb_func_start sub_814825C
sub_814825C: @ 8148618
	push {lr}
	ldr r0, _08148630
	ldrb r0, [r0]
	cmp r0, 0x5A
	bls _08148624
	b _081488EE
_08148624:
	lsls r0, 2
	ldr r1, _08148634
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148630: .4byte gUnknown_03005F3C
_08148634: .4byte _08148638
	.align 2, 0
_08148638:
	.4byte _081487A4
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081487F8
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _08148836
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _08148888
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488E0
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
	.4byte _081488EE
_081487A4:
	ldr r2, _081487D8
	ldr r1, _081487DC
	ldr r0, _081487E0
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _081487E4
	ldr r0, _081487E8
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _081487EC
	adds r1, r0
	str r1, [r2]
	ldr r0, _081487F0
	movs r2, 0x44
	bl memcpy
	ldr r1, _081487F4
	movs r0, 0xA
	strb r0, [r1]
	b _081488EE
	.align 2, 0
_081487D8: .4byte gUnknown_03005F40
_081487DC: .4byte gNatureToMonPokeblockAnim
_081487E0: .4byte gUnknown_03005F30
_081487E4: .4byte gUnknown_03005F20
_081487E8: .4byte gUnknown_03005F2C
_081487EC: .4byte gSprites
_081487F0: .4byte gUnknown_03005F50
_081487F4: .4byte gUnknown_03005F3C
_081487F8:
	bl sub_8148540
	ldr r1, _08148860
	ldr r0, _08148864
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148830
	ldr r3, _08148868
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r2, [r3]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x3]
	ldr r0, [r3]
	ldr r1, _0814886C
	str r1, [r0, 0x10]
	bl InitSpriteAffineAnim
_08148830:
	ldr r1, _08148870
	movs r0, 0x32
	strb r0, [r1]
_08148836:
	ldr r1, _08148860
	ldr r0, _08148864
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x1
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, 0
	beq _081488AA
	ldr r0, _08148874
	ldrb r0, [r0]
	cmp r0, 0
	bne _08148878
	ldr r0, _08148868
	ldr r0, [r0]
	adds r1, 0xA
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAffineAnim
	b _081488AA
	.align 2, 0
_08148860: .4byte gNatureToMonPokeblockAnim
_08148864: .4byte gUnknown_03005F30
_08148868: .4byte gUnknown_03005F20
_0814886C: .4byte gSpriteAffineAnimTable_8412050
_08148870: .4byte gUnknown_03005F3C
_08148874: .4byte gUnknown_03005F28
_08148878:
	ldr r0, _08148884
	ldr r0, [r0]
	ldrb r1, [r2]
	bl StartSpriteAffineAnim
	b _081488AA
	.align 2, 0
_08148884: .4byte gUnknown_03005F20
_08148888:
	bl sub_81485CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081488EE
	ldr r0, _081488B4
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _081488C0
	ldr r1, _081488B8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8148540
_081488AA:
	ldr r1, _081488BC
	movs r0, 0x3C
	strb r0, [r1]
	b _081488EE
	.align 2, 0
_081488B4: .4byte gUnknown_03005FA0
_081488B8: .4byte gUnknown_03005F40
_081488BC: .4byte gUnknown_03005F3C
_081488C0:
	ldr r0, _081488D8
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r1, _081488DC
	movs r0, 0x46
	strb r0, [r1]
	b _081488EE
	.align 2, 0
_081488D8: .4byte gUnknown_03005F20
_081488DC: .4byte gUnknown_03005F3C
_081488E0:
	bl sub_8148618
	ldr r0, _081488F4
	movs r1, 0
	strb r1, [r0]
	ldr r0, _081488F8
	strb r1, [r0]
_081488EE:
	pop {r0}
	bx r0
	.align 2, 0
_081488F4: .4byte gUnknown_03005F40
_081488F8: .4byte gUnknown_03005F3C
	thumb_func_end sub_814825C

	thumb_func_start sub_8148540
sub_8148540: @ 81488FC
	push {r4-r7,lr}
	movs r4, 0
	ldr r5, _08148970
	mov r12, r5
	ldr r7, _08148974
	ldr r6, _08148978
_08148908:
	lsls r2, r4, 1
	mov r0, r12
	adds r3, r2, r0
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	adds r2, r7
	ldrh r0, [r2]
	strh r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08148908
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08148980
	movs r2, 0
	ldrsh r0, [r5, r2]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x14]
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x8]
	strh r0, [r5, 0x18]
	ldr r0, _0814897C
	ldr r1, [r0]
	ldrh r0, [r1, 0x24]
	strh r0, [r5, 0x1A]
	ldrh r0, [r1, 0x26]
	strh r0, [r5, 0x1C]
	bl sub_8148710
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x8]
	bl sub_814862C
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x8]
	movs r0, 0
	b _08148982
	.align 2, 0
_08148970: .4byte gUnknown_03005FA0
_08148974: .4byte gMonPokeblockAnims
_08148978: .4byte gUnknown_03005F40
_0814897C: .4byte gUnknown_03005F20
_08148980:
	movs r0, 0x1
_08148982:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8148540

	thumb_func_start sub_81485CC
sub_81485CC: @ 8148988
	push {r4,lr}
	ldr r3, _081489C0
	ldrh r0, [r3, 0x18]
	ldrh r1, [r3, 0x8]
	subs r0, r1
	lsls r0, 16
	ldr r1, _081489C4
	ldr r4, [r1]
	lsrs r0, 15
	ldr r1, _081489C8
	adds r2, r0, r1
	ldrh r2, [r2]
	strh r2, [r4, 0x24]
	movs r2, 0x80
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	cmp r0, 0
	beq _081489CC
	movs r0, 0
	b _081489CE
	.align 2, 0
_081489C0: .4byte gUnknown_03005FA0
_081489C4: .4byte gUnknown_03005F20
_081489C8: .4byte 0x0201d000
_081489CC:
	movs r0, 0x1
_081489CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81485CC

	thumb_func_start sub_8148618
sub_8148618: @ 81489D4
	push {lr}
	ldr r0, _081489E4
	ldr r0, [r0]
	bl FreeSpriteOamMatrix
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081489E4: .4byte gUnknown_03005F20
	thumb_func_end sub_8148618

	thumb_func_start sub_814862C
sub_814862C: @ 81489E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r1, _08148ABC
	ldrh r0, [r1, 0x10]
	mov r8, r0
	ldrh r0, [r1, 0x18]
	mov r2, r8
	subs r0, r2
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r1, 0xC]
	ldrh r3, [r1, 0x1A]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldrh r0, [r1, 0xE]
	ldrh r1, [r1, 0x1C]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r6, 0
	subs r0, r7, 0x1
	ldr r4, _08148AC0
	mov r10, r4
	cmp r6, r0
	bge _08148A90
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	str r0, [sp, 0x4]
_08148A30:
	mov r2, r8
	adds r5, r2, r6
	lsls r5, 1
	ldr r4, _08148AC4
	adds r3, r5, r4
	ldrh r2, [r3]
	ldr r0, [sp, 0x4]
	subs r1, r2, r0
	ldr r4, _08148AC8
	adds r5, r4
	ldrh r0, [r5]
	mov r12, r0
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r4, r12
	subs r0, r4, r0
	lsls r4, r0, 16
	lsrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r6, 0x1
	adds r0, r1, 0
	muls r0, r6
	adds r1, r7, 0
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	bl __divsi3
	ldr r2, [sp, 0x8]
	subs r2, r0
	ldr r3, [sp, 0xC]
	strh r2, [r3]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	muls r0, r6
	adds r1, r7, 0
	bl __divsi3
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	lsls r6, 16
	lsrs r6, 16
	subs r0, r7, 0x1
	cmp r6, r0
	blt _08148A30
_08148A90:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 1
	mov r2, r10
	adds r1, r0, r2
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r1]
	movs r1, 0x80
	lsls r1, 3
	add r1, r10
	adds r0, r1
	mov r4, r9
	strh r4, [r0]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148ABC: .4byte gUnknown_03005FA0
_08148AC0: .4byte 0x0201cffe
_08148AC4: .4byte 0x0201d000
_08148AC8: .4byte 0x0201d400
	thumb_func_end sub_814862C

	thumb_func_start sub_8148710
sub_8148710: @ 8148ACC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _08148B60
	ldrh r2, [r1, 0x1A]
	ldrh r0, [r1, 0x14]
	subs r2, r0
	ldrh r3, [r1, 0x1C]
	ldrh r0, [r1, 0x16]
	subs r3, r0
	adds r6, r1, 0
	ldr r1, _08148B64
	mov r9, r1
	lsls r2, 16
	asrs r2, 16
	mov r8, r2
	movs r2, 0x80
	lsls r2, 3
	add r2, r9
	mov r10, r2
	lsls r3, 16
	asrs r7, r3, 16
_08148B02:
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _08148B0C
	negs r0, r0
_08148B0C:
	lsls r0, 16
	lsrs r0, 16
	ldrh r2, [r6, 0x6]
	adds r0, r2
	lsls r5, r0, 16
	strh r0, [r6, 0x6]
	ldrh r2, [r6, 0x4]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _08148B26
	movs r0, 0x1
	str r0, [sp]
_08148B26:
	ldrh r0, [r6, 0x18]
	ldrh r1, [r6, 0x8]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r1, 0
	beq _08148BAC
	ldr r1, [sp]
	cmp r1, 0
	bne _08148B68
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsrs r5, 24
	adds r1, r2, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r4, 1
	mov r2, r9
	adds r1, r4, r2
	add r0, r8
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x6]
	adds r1, r5
	b _08148B8A
	.align 2, 0
_08148B60: .4byte gUnknown_03005FA0
_08148B64: .4byte 0x0201d000
_08148B68:
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsrs r5, 24
	subs r1, r2, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r4, 1
	mov r2, r9
	adds r1, r4, r2
	add r0, r8
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x6]
	subs r1, r5
_08148B8A:
	lsls r1, 16
	asrs r1, 16
	bl Cos
	add r4, r10
	adds r0, r7, r0
	strh r0, [r4]
	ldrh r0, [r6, 0x2]
	ldrh r2, [r6]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6]
	ldrh r0, [r6, 0x8]
	subs r0, 0x1
	strh r0, [r6, 0x8]
	b _08148B02
_08148BAC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8148710

	.align 2, 0 @ Don't pad with nop.
