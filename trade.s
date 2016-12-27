	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8047CD8
sub_8047CD8: @ 8047FFC
	push {lr}
	ldr r0, _08048008
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08048008: .4byte sub_8047EC0
	thumb_func_end sub_8047CD8

	thumb_func_start sub_8047CE8
sub_8047CE8: @ 804800C
	push {r4-r6,lr}
	ldr r6, _08048068
	ldr r5, _0804806C
	ldr r1, [r5]
	ldr r2, _08048070
	adds r0, r6, 0
	movs r3, 0xC
	bl sub_804AFB8
	bl GetMultiplayerId
	lsls r0, 24
	ldr r1, [r5, 0xC]
	movs r3, 0x80
	lsls r3, 17
	eors r3, r0
	lsrs r3, 24
	lsls r2, r3, 3
	subs r2, r3
	lsls r2, 2
	ldr r0, _08048074
	adds r2, r0
	adds r0, r6, 0
	movs r3, 0xC
	bl sub_804AFB8
	ldr r1, [r5, 0x18]
	ldr r4, _08048078
	ldr r2, [r4]
	adds r0, r6, 0
	movs r3, 0x8
	bl sub_804AFB8
	ldr r0, [r4, 0x4]
	ldr r1, [r5, 0x20]
	movs r2, 0x14
	bl sub_804ACD8
	movs r0, 0x3
	movs r1, 0
	bl nullsub_5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048068: .4byte gWindowConfig_81E725C
_0804806C: .4byte gUnknown_020296CC
_08048070: .4byte gSaveBlock2
_08048074: .4byte 0x03002988
_08048078: .4byte gUnknown_0820C14C
	thumb_func_end sub_8047CE8

	thumb_func_start sub_8047D58
sub_8047D58: @ 804807C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	ldr r0, _08048154
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	cmp r0, 0x5
	bls _08048096
	movs r1, 0x1
_08048096:
	movs r5, 0
	lsls r2, r1, 2
	mov r6, sp
	ldr r0, _08048158
	adds r1, r0, 0x1
	adds r1, r2
	mov r8, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r4, r0, 16
_080480AA:
	mov r1, sp
	ldr r0, _0804815C
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldrh r0, [r6]
	adds r0, r5
	strh r0, [r6]
	asrs r1, r4, 16
	mov r0, sp
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x1
	bl CreateSprite
	movs r7, 0x80
	lsls r7, 14
	adds r4, r7
	adds r5, 0x1
	cmp r5, 0x2
	ble _080480AA
	bl GetMultiplayerId
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	eors r1, r0
	lsrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08048160
	adds r0, r1
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	cmp r0, 0x5
	bls _080480FE
	movs r1, 0x1
_080480FE:
	movs r5, 0
	lsls r2, r1, 2
	mov r6, sp
	ldr r0, _08048164
	adds r1, r2, r0
	mov r8, r1
	subs r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r4, r0, 16
_08048112:
	mov r1, sp
	ldr r0, _0804815C
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r5, 0x3
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r6]
	asrs r1, r4, 16
	mov r0, sp
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x1
	bl CreateSprite
	movs r7, 0x80
	lsls r7, 14
	adds r4, r7
	adds r5, 0x1
	cmp r5, 0x2
	ble _08048112
	movs r0, 0x5
	movs r1, 0
	bl nullsub_5
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048154: .4byte gSaveBlock2
_08048158: .4byte gTradeUnknownSpriteCoords
_0804815C: .4byte gSpriteTemplate_820C0EC
_08048160: .4byte 0x03002988
_08048164: .4byte 0x082192b9
	thumb_func_end sub_8047D58

	thumb_func_start sub_8047E44
sub_8047E44: @ 8048168
	push {r4-r7,lr}
	sub sp, 0x18
	movs r4, 0
	mov r5, sp
	movs r6, 0xD6
	lsls r6, 16
_08048174:
	mov r1, sp
	ldr r0, _080481E0
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r4, 0x6
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	asrs r1, r6, 16
	mov r0, sp
	movs r2, 0x98
	movs r3, 0x1
	bl CreateSprite
	movs r2, 0x80
	lsls r2, 14
	adds r6, r2
	adds r4, 0x1
	cmp r4, 0x1
	ble _08048174
	movs r4, 0
	mov r5, sp
	movs r6, 0xC0
	lsls r6, 13
_080481A8:
	mov r1, sp
	ldr r0, _080481E0
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	ldm r0!, {r2,r3,r7}
	stm r1!, {r2,r3,r7}
	adds r0, r4, 0
	adds r0, 0x8
	ldrh r3, [r5]
	adds r0, r3
	strh r0, [r5]
	asrs r1, r6, 16
	mov r0, sp
	movs r2, 0x96
	movs r3, 0x1
	bl CreateSprite
	movs r7, 0x80
	lsls r7, 14
	adds r6, r7
	adds r4, 0x1
	cmp r4, 0x4
	ble _080481A8
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080481E0: .4byte gSpriteTemplate_820C0EC
	thumb_func_end sub_8047E44

	thumb_func_start sub_8047EC0
sub_8047EC0: @ 80481E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r1, _08048208
	ldr r2, _0804820C
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x15
	bls _080481FC
	b _080487EA
_080481FC:
	lsls r0, 2
	ldr r1, _08048210
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08048208: .4byte gMain
_0804820C: .4byte 0x0000043c
_08048210: .4byte _08048214
	.align 2, 0
_08048214:
	.4byte _0804826C
	.4byte _0804836C
	.4byte _080483D8
	.4byte _08048404
	.4byte _08048454
	.4byte _08048484
	.4byte _08048496
	.4byte _080485D8
	.4byte _08048600
	.4byte _08048624
	.4byte _0804864C
	.4byte _08048670
	.4byte _08048684
	.4byte _080486DC
	.4byte _08048724
	.4byte _0804873C
	.4byte _08048754
	.4byte _0804876C
	.4byte _0804877E
	.4byte _08048794
	.4byte _080487AC
	.4byte _080487CC
_0804826C:
	ldr r5, _0804833C
	ldr r6, _08048340
	str r6, [r5]
	bl sub_804AA88
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, [r5]
	adds r0, 0xC8
	ldr r1, _08048344
	bl sub_804A964
	ldr r0, _08048348
	bl SetVBlankCallback
	ldr r0, _0804834C
	bl InitMenuWindow
	ldr r4, _08048350
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x7A
	movs r4, 0
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl sub_809D51C
	ldr r0, [r5]
	adds r0, 0x75
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7C
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x80
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x81
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0xB4
	strb r4, [r0]
	ldr r0, _08048354
	strb r4, [r0]
	ldr r1, _08048358
	ldr r3, _0804835C
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	bl sub_804AA0C
	add r0, sp, 0x10
	strh r4, [r0]
	movs r0, 0xC0
	lsls r0, 7
	adds r1, r6, r0
	ldr r2, _08048360
	add r0, sp, 0x10
	bl CpuSet
	ldr r1, _08048364
	movs r2, 0xD8
	lsls r2, 7
	adds r6, r2
	adds r0, r1, 0
	adds r0, 0x30
	ldr r2, _08048368
_0804832E:
	str r6, [r0]
	adds r6, r2
	subs r0, 0x4
	cmp r0, r1
	bge _0804832E
	b _080487EA
	.align 2, 0
_0804833C: .4byte gUnknown_03004824
_08048340: .4byte 0x02017000
_08048344: .4byte 0x06002800
_08048348: .4byte sub_80489F4
_0804834C: .4byte gWindowConfig_81E6CE4
_08048350: .4byte gWindowConfig_81E6F84
_08048354: .4byte gUnknown_03000508
_08048358: .4byte gMain
_0804835C: .4byte 0x0000043c
_08048360: .4byte 0x01000680
_08048364: .4byte gUnknown_020296CC
_08048368: .4byte 0xffffff00
_0804836C:
	ldr r1, _080483BC
	ldr r3, _080483C0
	adds r0, r3, 0
	strh r0, [r1]
	bl OpenLink
	movs r6, 0
	movs r4, 0
_0804837C:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080483C4
	adds r0, r1
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r1, 0
	movs r2, 0
	movs r3, 0x20
	bl CreateMon
	adds r6, 0x1
	cmp r6, 0x5
	ble _0804837C
	ldr r1, _080483C8
	ldr r0, _080483CC
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _080483D0
	ldr r0, [r0]
	adds r0, 0xB4
	strb r2, [r0]
	ldr r0, _080483D4
	movs r1, 0x1
	bl CreateTask
	b _080487EA
	.align 2, 0
_080483BC: .4byte gLinkType
_080483C0: .4byte 0x00001122
_080483C4: .4byte gEnemyParty
_080483C8: .4byte gMain
_080483CC: .4byte 0x0000043c
_080483D0: .4byte gUnknown_03004824
_080483D4: .4byte sub_8083C50
_080483D8:
	ldr r2, _080483FC
	ldr r1, [r2]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0xB4
	ldrb r0, [r1]
	cmp r0, 0xB
	bhi _080483F2
	b _080487EA
_080483F2:
	movs r0, 0
	strb r0, [r1]
	ldr r2, _08048400
	adds r1, r3, r2
	b _080487BC
	.align 2, 0
_080483FC: .4byte gUnknown_03004824
_08048400: .4byte 0x0000043c
_08048404:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _08048418
	b _080487EA
_08048418:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	beq _08048444
	ldr r0, _08048440
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bhi _08048438
	b _080487EA
_08048438:
	bl sub_8007F4C
	b _080487B6
	.align 2, 0
_08048440: .4byte gUnknown_03004824
_08048444:
	ldr r1, _0804844C
	ldr r0, _08048450
	adds r1, r0
	b _080487BC
	.align 2, 0
_0804844C: .4byte gMain
_08048450: .4byte 0x0000043c
_08048454:
	ldr r0, _08048478
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804845E
	b _080487EA
_0804845E:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804846C
	b _080487EA
_0804846C:
	bl CalculatePlayerPartyCount
	ldr r1, _0804847C
	ldr r2, _08048480
	adds r1, r2
	b _080487BC
	.align 2, 0
_08048478: .4byte gReceivedRemoteLinkPlayers
_0804847C: .4byte gMain
_08048480: .4byte 0x0000043c
_08048484:
	bl sub_8048D44
	lsls r0, 24
	cmp r0, 0
	bne _08048490
	b _080487EA
_08048490:
	bl sub_804AF84
	b _080487B6
_08048496:
	bl CalculateEnemyPartyCount
	ldr r4, _080485B8
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0x1D
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r4]
	ldr r1, _080485BC
	ldrb r1, [r1]
	adds r0, 0x42
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _080485C0
	ldrb r1, [r1]
	adds r0, 0x43
	strb r1, [r0]
	movs r6, 0
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bge _0804853A
	mov r8, r4
	ldr r7, _080485C4
_080484DE:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080485C8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, 19
	movs r1, 0xE0
	lsls r1, 12
	adds r2, r1
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _080485CC
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _080485D0
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x34
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	blt _080484DE
_0804853A:
	movs r6, 0
	ldr r1, _080485B8
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bge _080485AE
	ldr r0, _080485C4
	mov r8, r1
	adds r7, r0, 0
	adds r7, 0xC
_08048550:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080485D4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _080485CC
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _080485D0
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x3A
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	blt _08048550
_080485AE:
	movs r0, 0x2
	movs r1, 0
	bl nullsub_5
	b _080487B6
	.align 2, 0
_080485B8: .4byte gUnknown_03004824
_080485BC: .4byte gPlayerPartyCount
_080485C0: .4byte gEnemyPartyCount
_080485C4: .4byte gTradeMonSpriteCoords
_080485C8: .4byte gPlayerParty
_080485CC: .4byte 0xfff40000
_080485D0: .4byte sub_809D62C
_080485D4: .4byte gEnemyParty
_080485D8:
	bl sub_806DA98
	ldr r0, _080485F4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0
	bl sub_806DB90
	ldr r1, _080485F8
	ldr r0, _080485FC
	adds r1, r0
	b _080487BC
	.align 2, 0
_080485F4: .4byte gUnknown_03004824
_080485F8: .4byte gMain
_080485FC: .4byte 0x0000043c
_08048600:
	ldr r0, _08048618
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0x1
	bl sub_806DB90
	ldr r1, _0804861C
	ldr r2, _08048620
	adds r1, r2
	b _080487BC
	.align 2, 0
_08048618: .4byte gUnknown_03004824
_0804861C: .4byte gMain
_08048620: .4byte 0x0000043c
_08048624:
	bl sub_8047CE8
	ldr r1, _08048640
	ldr r3, _08048644
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08048648
	ldr r0, [r0]
	adds r0, 0xB4
	strb r2, [r0]
	b _080487EA
	.align 2, 0
_08048640: .4byte gMain
_08048644: .4byte 0x0000043c
_08048648: .4byte gUnknown_03004824
_0804864C:
	movs r0, 0x4
	movs r1, 0
	bl nullsub_5
	bl sub_804ABF8
	lsls r0, 24
	cmp r0, 0
	bne _08048660
	b _080487EA
_08048660:
	ldr r1, _08048668
	ldr r0, _0804866C
	adds r1, r0
	b _080487BC
	.align 2, 0
_08048668: .4byte gMain
_0804866C: .4byte 0x0000043c
_08048670:
	bl sub_8047D58
	ldr r1, _0804867C
	ldr r2, _08048680
	adds r1, r2
	b _080487BC
	.align 2, 0
_0804867C: .4byte gMain
_08048680: .4byte 0x0000043c
_08048684:
	bl sub_8047E44
	ldr r0, _080486C8
	ldr r2, _080486CC
	ldrb r1, [r2]
	lsls r1, 19
	movs r3, 0x80
	lsls r3, 14
	adds r1, r3
	asrs r1, 16
	ldrb r2, [r2, 0x1]
	lsls r2, 3
	movs r3, 0x2
	bl CreateSprite
	ldr r2, _080486D0
	ldr r1, [r2]
	adds r1, 0x40
	movs r3, 0
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x41
	strb r3, [r0]
	ldr r1, _080486D4
	ldr r0, _080486D8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x6
	movs r1, 0
	bl nullsub_5
	b _080487EA
	.align 2, 0
_080486C8: .4byte gSpriteTemplate_820C134
_080486CC: .4byte gTradeMonSpriteCoords
_080486D0: .4byte gUnknown_03004824
_080486D4: .4byte gMain
_080486D8: .4byte 0x0000043c
_080486DC:
	movs r0, 0
	bl sub_804ACF4
	movs r0, 0
	bl sub_804A41C
	ldr r2, _08048714
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x1]
	bl sub_8048C70
	ldr r1, _08048718
	ldr r2, _0804871C
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x7
	movs r1, 0
	bl nullsub_5
	ldr r0, _08048720
	bl PlayBGM
	b _080487EA
	.align 2, 0
_08048714: .4byte gUnknown_03004824
_08048718: .4byte gMain
_0804871C: .4byte 0x0000043c
_08048720: .4byte 0x000001b3
_08048724:
	movs r0, 0x1
	bl sub_804ACF4
	movs r0, 0x1
	bl sub_804A41C
	ldr r1, _0804874C
	ldr r3, _08048750
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804873C:
	movs r0, 0
	bl sub_8048B0C
	ldr r1, _0804874C
	ldr r0, _08048750
	adds r1, r0
	b _080487BC
	.align 2, 0
_0804874C: .4byte gMain
_08048750: .4byte 0x0000043c
_08048754:
	movs r0, 0x1
	bl sub_8048B0C
	ldr r1, _08048764
	ldr r2, _08048768
	adds r1, r2
	b _080487BC
	.align 2, 0
_08048764: .4byte gMain
_08048768: .4byte 0x0000043c
_0804876C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080487B6
_0804877E:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08048790
	adds r1, r3, r0
	b _080487BC
	.align 2, 0
_08048790: .4byte 0x0000043c
_08048794:
	movs r0, 0
	bl sub_804AE3C
	ldr r1, _080487A4
	ldr r2, _080487A8
	adds r1, r2
	b _080487BC
	.align 2, 0
_080487A4: .4byte gMain
_080487A8: .4byte 0x0000043c
_080487AC:
	movs r0, 0x1
	bl sub_804AE3C
	bl sub_804AF10
_080487B6:
	ldr r1, _080487C4
	ldr r3, _080487C8
	adds r1, r3
_080487BC:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080487EA
	.align 2, 0
_080487C4: .4byte gMain
_080487C8: .4byte 0x0000043c
_080487CC:
	ldr r0, _08048808
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080487EA
	ldr r0, _0804880C
	str r0, [r3]
	ldr r0, _08048810
	bl SetMainCallback2
	ldr r0, _08048814
	strb r4, [r0]
_080487EA:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048808: .4byte gPaletteFade
_0804880C: .4byte sub_80494D8
_08048810: .4byte sub_8048AB4
_08048814: .4byte gUnknown_03000508
	thumb_func_end sub_8047EC0

	thumb_func_start sub_80484F4
sub_80484F4: @ 8048818
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r1, _0804883C
	ldr r2, _08048840
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x15
	bls _08048830
	b _08048CEE
_08048830:
	lsls r0, 2
	ldr r1, _08048844
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804883C: .4byte gMain
_08048840: .4byte 0x0000043c
_08048844: .4byte _08048848
	.align 2, 0
_08048848:
	.4byte _080488A0
	.4byte _08048980
	.4byte _0804898C
	.4byte _08048998
	.4byte _080489A4
	.4byte _080489B8
	.4byte _080489C4
	.4byte _08048B0C
	.4byte _08048B34
	.4byte _08048B58
	.4byte _08048B80
	.4byte _08048BA4
	.4byte _08048BB8
	.4byte _08048CEE
	.4byte _08048CEE
	.4byte _08048C38
	.4byte _08048C40
	.4byte _08048C74
	.4byte _08048C94
	.4byte _08048CAC
	.4byte _08048CB8
	.4byte _08048CD4
_080488A0:
	ldr r5, _08048954
	ldr r6, _08048958
	str r6, [r5]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, [r5]
	adds r0, 0xC8
	ldr r1, _0804895C
	bl sub_804A964
	ldr r0, _08048960
	bl SetVBlankCallback
	ldr r0, _08048964
	bl InitMenuWindow
	ldr r4, _08048968
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x14
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x7A
	movs r4, 0
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl sub_809D51C
	ldr r0, [r5]
	adds r0, 0x75
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7C
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x80
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x81
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0xB4
	strb r4, [r0]
	ldr r0, _0804896C
	strb r4, [r0]
	ldr r1, _08048970
	ldr r3, _08048974
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08048978
	movs r5, 0xD8
	lsls r5, 7
	adds r6, r5
	adds r0, r1, 0
	adds r0, 0x30
	ldr r2, _0804897C
_08048946:
	str r6, [r0]
	adds r6, r2
	subs r0, 0x4
	cmp r0, r1
	bge _08048946
	b _08048CEE
	.align 2, 0
_08048954: .4byte gUnknown_03004824
_08048958: .4byte 0x02017000
_0804895C: .4byte 0x06002800
_08048960: .4byte sub_80489F4
_08048964: .4byte gWindowConfig_81E6CE4
_08048968: .4byte gWindowConfig_81E6F84
_0804896C: .4byte gUnknown_03000508
_08048970: .4byte gMain
_08048974: .4byte 0x0000043c
_08048978: .4byte gUnknown_020296CC
_0804897C: .4byte 0xffffff00
_08048980:
	ldr r0, _08048988
	adds r1, r2, r0
	b _08048B62
	.align 2, 0
_08048988: .4byte 0x0000043c
_0804898C:
	ldr r3, _08048994
	adds r1, r2, r3
	b _08048CC2
	.align 2, 0
_08048994: .4byte 0x0000043c
_08048998:
	ldr r5, _080489A0
	adds r1, r2, r5
	b _08048CC2
	.align 2, 0
_080489A0: .4byte 0x0000043c
_080489A4:
	bl CalculatePlayerPartyCount
	ldr r1, _080489B0
	ldr r0, _080489B4
	adds r1, r0
	b _08048CC2
	.align 2, 0
_080489B0: .4byte gMain
_080489B4: .4byte 0x0000043c
_080489B8:
	ldr r3, _080489C0
	adds r1, r2, r3
	b _08048CC2
	.align 2, 0
_080489C0: .4byte 0x0000043c
_080489C4:
	bl CalculateEnemyPartyCount
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r4, _08048AE4
	ldr r0, [r4]
	ldr r1, _08048AE8
	ldrb r1, [r1]
	adds r0, 0x42
	strb r1, [r0]
	ldr r0, [r4]
	ldr r1, _08048AEC
	ldrb r1, [r1]
	adds r0, 0x43
	strb r1, [r0]
	movs r0, 0
	bl sub_804A41C
	movs r0, 0x1
	bl sub_804A41C
	movs r6, 0
	ldr r0, [r4]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bge _08048A60
	mov r8, r4
	ldr r7, _08048AF0
_08048A02:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _08048AF4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, 19
	movs r1, 0xE0
	lsls r1, 12
	adds r2, r1
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _08048AF8
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _08048AFC
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x34
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	blt _08048A02
_08048A60:
	movs r6, 0
	ldr r1, _08048AE4
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bge _08048AD4
	ldr r0, _08048AF0
	mov r8, r1
	adds r7, r0, 0
	adds r7, 0xC
_08048A76:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _08048B00
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldrb r2, [r7]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	ldrb r3, [r7, 0x1]
	lsls r3, 19
	ldr r1, _08048AF8
	adds r3, r1
	asrs r3, 16
	movs r1, 0x1
	str r1, [sp]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	ldr r1, _08048AFC
	bl sub_809D2FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, 0x3A
	adds r1, r6
	strb r0, [r1]
	adds r7, 0x2
	adds r6, 0x1
	ldr r0, [r2]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	blt _08048A76
_08048AD4:
	movs r0, 0x2
	movs r1, 0
	bl nullsub_5
	ldr r1, _08048B04
	ldr r3, _08048B08
	adds r1, r3
	b _08048CC2
	.align 2, 0
_08048AE4: .4byte gUnknown_03004824
_08048AE8: .4byte gPlayerPartyCount
_08048AEC: .4byte gEnemyPartyCount
_08048AF0: .4byte gTradeMonSpriteCoords
_08048AF4: .4byte gPlayerParty
_08048AF8: .4byte 0xfff40000
_08048AFC: .4byte sub_809D62C
_08048B00: .4byte gEnemyParty
_08048B04: .4byte gMain
_08048B08: .4byte 0x0000043c
_08048B0C:
	bl sub_806DA98
	ldr r0, _08048B28
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0
	bl sub_806DB90
	ldr r1, _08048B2C
	ldr r5, _08048B30
	adds r1, r5
	b _08048CC2
	.align 2, 0
_08048B28: .4byte gUnknown_03004824
_08048B2C: .4byte gMain
_08048B30: .4byte 0x0000043c
_08048B34:
	ldr r0, _08048B4C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x42
	adds r1, 0x34
	movs r2, 0x1
	bl sub_806DB90
	ldr r1, _08048B50
	ldr r0, _08048B54
	adds r1, r0
	b _08048CC2
	.align 2, 0
_08048B4C: .4byte gUnknown_03004824
_08048B50: .4byte gMain
_08048B54: .4byte 0x0000043c
_08048B58:
	bl sub_8047CE8
	ldr r1, _08048B74
	ldr r2, _08048B78
	adds r1, r2
_08048B62:
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08048B7C
	ldr r0, [r0]
	adds r0, 0xB4
	strb r2, [r0]
	b _08048CEE
	.align 2, 0
_08048B74: .4byte gMain
_08048B78: .4byte 0x0000043c
_08048B7C: .4byte gUnknown_03004824
_08048B80:
	movs r0, 0x4
	movs r1, 0
	bl nullsub_5
	bl sub_804ABF8
	lsls r0, 24
	cmp r0, 0
	bne _08048B94
	b _08048CEE
_08048B94:
	ldr r1, _08048B9C
	ldr r3, _08048BA0
	adds r1, r3
	b _08048CC2
	.align 2, 0
_08048B9C: .4byte gMain
_08048BA0: .4byte 0x0000043c
_08048BA4:
	bl sub_8047D58
	ldr r1, _08048BB0
	ldr r5, _08048BB4
	adds r1, r5
	b _08048CC2
	.align 2, 0
_08048BB0: .4byte gMain
_08048BB4: .4byte 0x0000043c
_08048BB8:
	bl sub_8047E44
	ldr r2, _08048BD0
	ldr r0, _08048BD4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _08048BD8
	ldrb r0, [r2, 0x9]
	b _08048BDC
	.align 2, 0
_08048BD0: .4byte 0x02018000
_08048BD4: .4byte gUnknown_03004824
_08048BD8:
	ldrb r0, [r2, 0x9]
	adds r0, 0x6
_08048BDC:
	strb r0, [r1]
	ldr r0, _08048C24
	ldr r3, _08048C28
	ldr r4, _08048C2C
	ldr r1, [r4]
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r2, 1
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, 19
	movs r5, 0x80
	lsls r5, 14
	adds r1, r5
	asrs r1, 16
	adds r3, 0x1
	adds r2, r3
	ldrb r2, [r2]
	lsls r2, 3
	movs r3, 0x2
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0x40
	strb r0, [r1]
	ldr r0, _08048C30
	ldr r1, _08048C34
	adds r0, r1
	movs r1, 0xF
	strb r1, [r0]
	movs r0, 0x6
	movs r1, 0
	bl nullsub_5
	b _08048CEE
	.align 2, 0
_08048C24: .4byte gSpriteTemplate_820C134
_08048C28: .4byte gTradeMonSpriteCoords
_08048C2C: .4byte gUnknown_03004824
_08048C30: .4byte gMain
_08048C34: .4byte 0x0000043c
_08048C38:
	movs r0, 0
	bl sub_8048B0C
	b _08048CBC
_08048C40:
	movs r0, 0x1
	bl sub_8048B0C
	ldr r2, _08048C68
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x1]
	bl sub_8048C70
	movs r0, 0x7
	movs r1, 0
	bl nullsub_5
	ldr r1, _08048C6C
	ldr r3, _08048C70
	adds r1, r3
	b _08048CC2
	.align 2, 0
_08048C68: .4byte gUnknown_03004824
_08048C6C: .4byte gMain
_08048C70: .4byte 0x0000043c
_08048C74:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08048C8C
	ldr r5, _08048C90
	adds r1, r5
	b _08048CC2
	.align 2, 0
_08048C8C: .4byte gMain
_08048C90: .4byte 0x0000043c
_08048C94:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r5, _08048CA8
	adds r1, r2, r5
	b _08048CC2
	.align 2, 0
_08048CA8: .4byte 0x0000043c
_08048CAC:
	ldr r0, _08048CB4
	adds r1, r2, r0
	b _08048CC2
	.align 2, 0
_08048CB4: .4byte 0x0000043c
_08048CB8:
	bl sub_804AF10
_08048CBC:
	ldr r1, _08048CCC
	ldr r2, _08048CD0
	adds r1, r2
_08048CC2:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08048CEE
	.align 2, 0
_08048CCC: .4byte gMain
_08048CD0: .4byte 0x0000043c
_08048CD4:
	ldr r0, _08048D0C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08048CEE
	ldr r0, _08048D10
	bl SetMainCallback2
	ldr r0, _08048D14
	strb r4, [r0]
_08048CEE:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048D0C: .4byte gPaletteFade
_08048D10: .4byte sub_8048AB4
_08048D14: .4byte gUnknown_03000508
	thumb_func_end sub_80484F4

	thumb_func_start sub_80489F4
sub_80489F4: @ 8048D18
	push {lr}
	ldr r0, _08048D34
	ldr r0, [r0]
	adds r0, 0xC8
	bl sub_804A940
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08048D34: .4byte gUnknown_03004824
	thumb_func_end sub_80489F4

	thumb_func_start sub_8048A14
sub_8048A14: @ 8048D38
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08048D70
	ldr r1, [r4]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _08048D68
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xA
	strb r1, [r0]
_08048D68:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048D70: .4byte gUnknown_03004824
	thumb_func_end sub_8048A14

	thumb_func_start sub_8048A50
sub_8048A50: @ 8048D74
	push {r4,lr}
	ldr r0, _08048DA8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08048DA2
	ldr r2, _08048DAC
	ldr r4, _08048DB0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, 0x8A
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	bl sub_800832C
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xD
	strb r1, [r0]
_08048DA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048DA8: .4byte gPaletteFade
_08048DAC: .4byte gUnknown_020297D8
_08048DB0: .4byte gUnknown_03004824
	thumb_func_end sub_8048A50

	thumb_func_start sub_8048A90
sub_8048A90: @ 8048DB4
	push {lr}
	ldr r0, _08048DCC
	ldrb r1, [r0]
	cmp r1, 0
	bne _08048DC8
	ldr r0, _08048DD0
	str r1, [r0]
	ldr r0, _08048DD4
	bl SetMainCallback2
_08048DC8:
	pop {r0}
	bx r0
	.align 2, 0
_08048DCC: .4byte gReceivedRemoteLinkPlayers
_08048DD0: .4byte gMain
_08048DD4: .4byte sub_804B41C
	thumb_func_end sub_8048A90

	thumb_func_start sub_8048AB4
sub_8048AB4: @ 8048DD8
	push {r4,lr}
	bl sub_8049DE0
	bl sub_804AB30
	movs r0, 0
	bl sub_8049ED4
	movs r0, 0x1
	bl sub_8049ED4
	ldr r4, _08048E28
	ldr r3, _08048E2C
	ldr r2, [r3]
	ldrb r0, [r2]
	adds r1, r0, 0x1
	strb r1, [r2]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	adds r4, 0x4
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r2, 0x1]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048E28: .4byte 0x04000018
_08048E2C: .4byte gUnknown_03004824
	thumb_func_end sub_8048AB4

	thumb_func_start sub_8048B0C
sub_8048B0C: @ 8048E30
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08048E40
	cmp r0, 0x1
	beq _08048EF4
	b _08048F5E
_08048E40:
	ldr r5, _08048EC4
	ldr r0, _08048EC8
	mov r12, r0
	ldr r1, _08048ECC
	ldr r4, _08048ED0
	ldr r3, _08048ED4
	movs r2, 0x2F
_08048E4E:
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, 0x2
	adds r4, 0x2
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _08048E4E
	adds r3, r5, 0
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0x94
	lsls r5, 5
	ldr r1, _08048ED8
	ldr r6, _08048EDC
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08048E78:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08048E78
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	ldr r5, _08048EE0
	ldr r4, _08048EE4
	ldr r3, _08048EE8
_08048E9E:
	ldr r0, [r4]
	lsls r1, r2, 1
	adds r0, 0xDA
	adds r0, r1
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, r5
	ble _08048E9E
	ldr r1, _08048EEC
	ldr r0, _08048ED8
	mov r2, r12
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08048EF0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _08048F5E
	.align 2, 0
_08048EC4: .4byte gUnknown_08EA0348
_08048EC8: .4byte gTradeStripesBG2Tilemap
_08048ECC: .4byte gUnknown_08EA02C8
_08048ED0: .4byte gPlttBufferFaded
_08048ED4: .4byte gPlttBufferUnfaded
_08048ED8: .4byte 0x040000d4
_08048EDC: .4byte 0x80000800
_08048EE0: .4byte 0x000003ff
_08048EE4: .4byte gUnknown_03004824
_08048EE8: .4byte gUnknown_08EA15C8
_08048EEC: .4byte 0x06003000
_08048EF0: .4byte 0x80000400
_08048EF4:
	ldr r1, _08048F64
	ldr r2, _08048F68
	ldr r0, _08048F6C
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08048F70
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0
	bl sub_804A6DC
	movs r0, 0x1
	bl sub_804A6DC
	ldr r0, _08048F74
	ldr r0, [r0]
	adds r0, 0xC8
	bl sub_804A938
	ldr r2, _08048F78
	ldrh r1, [r2]
	ldr r0, _08048F7C
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08048F80
	ldr r2, _08048F84
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08048F88
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08048F8C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08048F90
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0xA
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
_08048F5E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048F64: .4byte gTradeStripesBG3Tilemap
_08048F68: .4byte 0x06003800
_08048F6C: .4byte 0x040000d4
_08048F70: .4byte 0x80000400
_08048F74: .4byte gUnknown_03004824
_08048F78: .4byte 0x04000008
_08048F7C: .4byte 0x0000fffc
_08048F80: .4byte 0x0400000a
_08048F84: .4byte 0x00000501
_08048F88: .4byte 0x00000602
_08048F8C: .4byte 0x00000703
_08048F90: .4byte 0x04000010
	thumb_func_end sub_8048B0C

	thumb_func_start sub_8048C70
sub_8048C70: @ 8048F94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r3, 0
	ldr r5, _08048FE4
	mov r8, r5
	ldr r0, _08048FE8
	mov r12, r0
	movs r1, 0x5
	negs r1, r1
	mov r9, r1
	movs r4, 0x6
	movs r7, 0x1
	movs r6, 0
_08048FB2:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x42
	ldrb r1, [r1]
	cmp r3, r1
	bge _08048FEC
	adds r0, 0x34
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x44
	adds r0, r3
	strb r7, [r0]
	b _08048FF2
	.align 2, 0
_08048FE4: .4byte gUnknown_03004824
_08048FE8: .4byte gSprites
_08048FEC:
	adds r0, 0x44
	adds r0, r3
	strb r6, [r0]
_08048FF2:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x43
	ldrb r1, [r1]
	cmp r3, r1
	bge _08049022
	adds r0, 0x3A
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x44
	adds r0, r4
	strb r7, [r0]
	b _08049028
_08049022:
	adds r0, 0x44
	adds r0, r4
	strb r6, [r0]
_08049028:
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, 0x5
	ble _08048FB2
	ldr r0, [r5]
	adds r0, 0x50
	movs r1, 0x1
	strb r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8048C70

	thumb_func_start nullsub_5
nullsub_5: @ 8049044
	bx lr
	thumb_func_end nullsub_5

	thumb_func_start sub_8048D24
sub_8048D24: @ 8049048
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r3, 0
	cmp r3, r2
	bcs _08049062
_08049054:
	adds r0, r5, r3
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, r2
	bcc _08049054
_08049062:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8048D24

	thumb_func_start sub_8048D44
sub_8048D44: @ 8049068
	push {r4-r7,lr}
	sub sp, 0xC
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _080490B4
	ldr r0, [r6]
	adds r0, 0x75
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0x64
	bl __udivsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetLinkDebugValues
	ldr r0, [r6]
	adds r0, 0x75
	ldrb r0, [r0]
	cmp r0, 0x10
	bls _080490AA
	b _080493A0
_080490AA:
	lsls r0, 2
	ldr r1, _080490B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080490B4: .4byte gUnknown_03004824
_080490B8: .4byte _080490BC
	.align 2, 0
_080490BC:
	.4byte _08049100
	.4byte _0804911C
	.4byte _0804914C
	.4byte _08049160
	.4byte _08049198
	.4byte _080491B4
	.4byte _080491C8
	.4byte _08049200
	.4byte _0804921C
	.4byte _08049230
	.4byte _08049268
	.4byte _08049284
	.4byte _08049298
	.4byte _080492D0
	.4byte _080492EC
	.4byte _08049300
	.4byte _0804933C
_08049100:
	ldr r0, _08049110
	ldr r1, _08049114
	movs r2, 0xC8
	bl sub_8048D24
	ldr r0, _08049118
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_08049110: .4byte gBlockSendBuffer
_08049114: .4byte gPlayerParty
_08049118: .4byte gUnknown_03004824
_0804911C:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _08049128
	b _080493A0
_08049128:
	bl GetBlockReceivedStatus
	lsls r0, 24
	cmp r0, 0
	bne _0804913C
	ldr r0, _08049138
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_08049138: .4byte gUnknown_03004824
_0804913C:
	bl ResetBlockReceivedFlags
	ldr r0, _08049148
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_08049148: .4byte gUnknown_03004824
_0804914C:
	cmp r7, 0
	bne _08049156
	movs r0, 0x1
	bl sub_8007E9C
_08049156:
	ldr r0, _0804915C
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_0804915C: .4byte gUnknown_03004824
_08049160:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0804916E
	b _080493A0
_0804916E:
	ldr r0, _0804918C
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08049190
	adds r1, r2
	movs r2, 0xC8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _08049194
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_0804918C: .4byte gEnemyParty
_08049190: .4byte gBlockRecvBuffer
_08049194: .4byte gUnknown_03004824
_08049198:
	ldr r0, _080491A8
	ldr r1, _080491AC
	movs r2, 0xC8
	bl sub_8048D24
	ldr r0, _080491B0
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_080491A8: .4byte gBlockSendBuffer
_080491AC: .4byte 0x03004438
_080491B0: .4byte gUnknown_03004824
_080491B4:
	cmp r7, 0
	bne _080491BE
	movs r0, 0x1
	bl sub_8007E9C
_080491BE:
	ldr r0, _080491C4
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_080491C4: .4byte gUnknown_03004824
_080491C8:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080491D6
	b _080493A0
_080491D6:
	ldr r0, _080491F4
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _080491F8
	adds r1, r2
	movs r2, 0xC8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _080491FC
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_080491F4: .4byte 0x03004698
_080491F8: .4byte gBlockRecvBuffer
_080491FC: .4byte gUnknown_03004824
_08049200:
	ldr r0, _08049210
	ldr r1, _08049214
	movs r2, 0xC8
	bl sub_8048D24
	ldr r0, _08049218
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_08049210: .4byte gBlockSendBuffer
_08049214: .4byte 0x03004500
_08049218: .4byte gUnknown_03004824
_0804921C:
	cmp r7, 0
	bne _08049226
	movs r0, 0x1
	bl sub_8007E9C
_08049226:
	ldr r0, _0804922C
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_0804922C: .4byte gUnknown_03004824
_08049230:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0804923E
	b _080493A0
_0804923E:
	ldr r0, _0804925C
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08049260
	adds r1, r2
	movs r2, 0xC8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _08049264
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_0804925C: .4byte 0x03004760
_08049260: .4byte gBlockRecvBuffer
_08049264: .4byte gUnknown_03004824
_08049268:
	ldr r0, _08049278
	ldr r1, _0804927C
	movs r2, 0xDC
	bl sub_8048D24
	ldr r0, _08049280
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_08049278: .4byte gBlockSendBuffer
_0804927C: .4byte 0x02028280
_08049280: .4byte gUnknown_03004824
_08049284:
	cmp r7, 0
	bne _0804928E
	movs r0, 0x3
	bl sub_8007E9C
_0804928E:
	ldr r0, _08049294
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_08049294: .4byte gUnknown_03004824
_08049298:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080492A6
	b _080493A0
_080492A6:
	ldr r0, _080492C4
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _080492C8
	adds r1, r2
	movs r2, 0xD8
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r0, _080492CC
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_080492C4: .4byte gUnknown_02029700
_080492C8: .4byte gBlockRecvBuffer
_080492CC: .4byte gUnknown_03004824
_080492D0:
	ldr r0, _080492E0
	ldr r1, _080492E4
	movs r2, 0xB
	bl sub_8048D24
	ldr r0, _080492E8
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_080492E0: .4byte gBlockSendBuffer
_080492E4: .4byte 0x02028844
_080492E8: .4byte gUnknown_03004824
_080492EC:
	cmp r7, 0
	bne _080492F6
	movs r0, 0x4
	bl sub_8007E9C
_080492F6:
	ldr r0, _080492FC
	ldr r1, [r0]
	b _0804932A
	.align 2, 0
_080492FC: .4byte gUnknown_03004824
_08049300:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080493A0
	ldr r4, _08049334
	ldr r0, [r4]
	adds r0, 0xB5
	movs r2, 0x1
	adds r1, r7, 0
	eors r1, r2
	lsls r1, 8
	ldr r2, _08049338
	adds r1, r2
	movs r2, 0xB
	bl sub_8048D24
	bl ResetBlockReceivedFlags
	ldr r1, [r4]
_0804932A:
	adds r1, 0x75
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080493A0
	.align 2, 0
_08049334: .4byte gUnknown_03004824
_08049338: .4byte gBlockRecvBuffer
_0804933C:
	ldr r4, _08049390
	ldr r6, _08049394
	movs r5, 0x5
_08049342:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08049382
	cmp r0, r6
	bne _08049382
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonData
	cmp r0, 0x1
	beq _08049382
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	ldr r1, _08049398
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _08049382
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, _0804939C
	bl SetMonData
_08049382:
	adds r4, 0x64
	subs r5, 0x1
	cmp r5, 0
	bge _08049342
	movs r0, 0x1
	b _080493A2
	.align 2, 0
_08049390: .4byte gEnemyParty
_08049394: .4byte 0x0000012f
_08049398: .4byte gUnknown_0820C3B0
_0804939C: .4byte 0x08204ded
_080493A0:
	movs r0, 0
_080493A2:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8048D44

	thumb_func_start sub_8049088
sub_8049088: @ 80493AC
	push {lr}
	sub sp, 0x1C
	ldr r1, _080493D4
	mov r0, sp
	bl StringCopy
	ldr r0, _080493D8
	ldr r0, [r0]
	adds r0, 0x7E
	ldrh r1, [r0]
	lsls r1, 5
	ldr r0, _080493DC
	adds r1, r0
	mov r0, sp
	movs r2, 0x14
	bl sub_804ACD8
	add sp, 0x1C
	pop {r0}
	bx r0
	.align 2, 0
_080493D4: .4byte gTradeText_TradeOkayPrompt
_080493D8: .4byte gUnknown_03004824
_080493DC: .4byte 0x06010000
	thumb_func_end sub_8049088

	thumb_func_start sub_80490BC
sub_80490BC: @ 80493E0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0x1
	adds r0, r4, 0
	ands r0, r3
	cmp r0, 0
	beq _0804946C
	ldr r1, _08049410
	lsls r0, r2, 8
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08049414
	cmp r1, r0
	beq _0804944C
	cmp r1, r0
	bgt _0804941C
	ldr r0, _08049418
	cmp r1, r0
	beq _0804943C
	b _08049466
	.align 2, 0
_08049410: .4byte gBlockRecvBuffer
_08049414: .4byte 0x0000bbbb
_08049418: .4byte 0x0000aabb
_0804941C:
	ldr r0, _08049430
	cmp r1, r0
	beq _0804945C
	ldr r0, _08049434
	cmp r1, r0
	bne _08049466
	ldr r0, _08049438
	ldr r0, [r0]
	adds r0, 0x84
	b _08049462
	.align 2, 0
_08049430: .4byte 0x0000bbcc
_08049434: .4byte 0x0000eeaa
_08049438: .4byte gUnknown_03004824
_0804943C:
	ldr r0, _08049448
	ldr r0, [r0]
	adds r0, 0x84
	strb r3, [r0]
	b _08049466
	.align 2, 0
_08049448: .4byte gUnknown_03004824
_0804944C:
	ldr r0, _08049458
	ldr r0, [r0]
	adds r0, 0x86
	strb r3, [r0]
	b _08049466
	.align 2, 0
_08049458: .4byte gUnknown_03004824
_0804945C:
	ldr r0, _08049494
	ldr r0, [r0]
	adds r0, 0x86
_08049462:
	movs r1, 0x2
	strb r1, [r0]
_08049466:
	movs r0, 0
	bl ResetBlockReceivedFlag
_0804946C:
	movs r2, 0x2
	adds r0, r4, 0
	ands r0, r2
	cmp r0, 0
	beq _080494FE
	ldr r3, _08049498
	movs r1, 0x80
	lsls r1, 1
	adds r0, r3, r1
	ldrh r1, [r0]
	ldr r0, _0804949C
	cmp r1, r0
	beq _080494E0
	cmp r1, r0
	bgt _080494A4
	ldr r0, _080494A0
	cmp r1, r0
	beq _080494C4
	b _080494F8
	.align 2, 0
_08049494: .4byte gUnknown_03004824
_08049498: .4byte gBlockRecvBuffer
_0804949C: .4byte 0x0000bbbb
_080494A0: .4byte 0x0000aabb
_080494A4:
	ldr r0, _080494B8
	cmp r1, r0
	beq _080494F0
	ldr r0, _080494BC
	cmp r1, r0
	bne _080494F8
	ldr r0, _080494C0
	ldr r0, [r0]
	adds r0, 0x85
	b _080494F6
	.align 2, 0
_080494B8: .4byte 0x0000bbcc
_080494BC: .4byte 0x0000eeaa
_080494C0: .4byte gUnknown_03004824
_080494C4:
	ldr r2, _080494DC
	ldr r1, [r2]
	movs r4, 0x81
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, 0x6
	adds r1, 0x8A
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x85
	b _080494E6
	.align 2, 0
_080494DC: .4byte gUnknown_03004824
_080494E0:
	ldr r0, _080494EC
	ldr r0, [r0]
	adds r0, 0x87
_080494E6:
	movs r1, 0x1
	strb r1, [r0]
	b _080494F8
	.align 2, 0
_080494EC: .4byte gUnknown_03004824
_080494F0:
	ldr r0, _08049504
	ldr r0, [r0]
	adds r0, 0x87
_080494F6:
	strb r2, [r0]
_080494F8:
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_080494FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049504: .4byte gUnknown_03004824
	thumb_func_end sub_80490BC

	thumb_func_start sub_80491E4
sub_80491E4: @ 8049508
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _080495E2
	ldr r2, _08049534
	ldrh r1, [r2]
	ldr r0, _08049538
	cmp r1, r0
	beq _080495CC
	cmp r1, r0
	bgt _08049544
	ldr r0, _0804953C
	cmp r1, r0
	beq _080495AC
	ldr r0, _08049540
	cmp r1, r0
	beq _08049580
	b _080495DC
	.align 2, 0
_08049534: .4byte gBlockRecvBuffer
_08049538: .4byte 0x0000ddee
_0804953C: .4byte 0x0000ccdd
_08049540: .4byte 0x0000dddd
_08049544:
	ldr r0, _08049554
	cmp r1, r0
	beq _08049558
	adds r0, 0x11
	cmp r1, r0
	beq _0804957C
	b _080495DC
	.align 2, 0
_08049554: .4byte 0x0000eebb
_08049558:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	bl sub_804AA0C
	ldr r0, _08049578
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xB
	b _080495DA
	.align 2, 0
_08049578: .4byte gUnknown_03004824
_0804957C:
	movs r0, 0x5
	b _080495CE
_08049580:
	ldr r4, _080495A8
	ldr r1, [r4]
	ldrb r0, [r2, 0x2]
	adds r0, 0x6
	adds r1, 0x8A
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x8A
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x7
	b _080495DA
	.align 2, 0
_080495A8: .4byte gUnknown_03004824
_080495AC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080495C8
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xA
	b _080495DA
	.align 2, 0
_080495C8: .4byte gUnknown_03004824
_080495CC:
	movs r0, 0x1
_080495CE:
	bl sub_804AA0C
	ldr r0, _080495F8
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x8
_080495DA:
	strb r1, [r0]
_080495DC:
	movs r0, 0
	bl ResetBlockReceivedFlag
_080495E2:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080495F0
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_080495F0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080495F8: .4byte gUnknown_03004824
	thumb_func_end sub_80491E4

	thumb_func_start sub_80492D8
sub_80492D8: @ 80495FC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08049658
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0x84
	ldrb r0, [r1]
	cmp r0, 0
	bne _08049610
	b _08049744
_08049610:
	adds r0, r2, 0
	adds r0, 0x85
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804961C
	b _08049744
_0804961C:
	ldrh r1, [r1]
	ldr r0, _0804965C
	cmp r1, r0
	bne _08049664
	adds r1, r2, 0
	adds r1, 0x7B
	movs r0, 0x6
	strb r0, [r1]
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0x8C
	movs r4, 0
	ldr r0, _08049660
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	adds r0, 0x4D
	strh r1, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r6]
	adds r2, r0, 0
	adds r2, 0x85
	strb r4, [r2]
	adds r0, 0x84
	strb r4, [r0]
	b _08049744
	.align 2, 0
_08049658: .4byte gUnknown_03004824
_0804965C: .4byte 0x00000101
_08049660: .4byte 0x0000dddd
_08049664:
	ldr r0, _080496AC
	cmp r1, r0
	bne _080496B4
	movs r0, 0x1
	bl sub_804AA0C
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0x8C
	movs r4, 0
	movs r3, 0
	ldr r0, _080496B0
	strh r0, [r2]
	adds r1, 0x8E
	strh r3, [r1]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x87
	strb r4, [r1]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x85
	strb r4, [r1]
	adds r0, 0x84
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, 0x7B
	movs r1, 0x8
	b _08049742
	.align 2, 0
_080496AC: .4byte 0x00000201
_080496B0: .4byte 0x0000eecc
_080496B4:
	movs r0, 0x81
	lsls r0, 1
	cmp r1, r0
	bne _08049700
	movs r0, 0x5
	bl sub_804AA0C
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0x8C
	movs r4, 0
	movs r3, 0
	ldr r0, _080496FC
	strh r0, [r2]
	adds r1, 0x8E
	strh r3, [r1]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x87
	strb r4, [r1]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x85
	strb r4, [r1]
	adds r0, 0x84
	strb r4, [r0]
	ldr r0, [r6]
	adds r0, 0x7B
	movs r1, 0x8
	b _08049742
	.align 2, 0
_080496FC: .4byte 0x0000ddee
_08049700:
	ldr r0, _080497E4
	cmp r1, r0
	bne _08049744
	adds r1, r2, 0
	adds r1, 0x8C
	movs r5, 0
	movs r4, 0
	ldr r0, _080497E8
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x8E
	strh r4, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r6]
	adds r1, r0, 0
	adds r1, 0x85
	strb r5, [r1]
	adds r0, 0x84
	strb r5, [r0]
	ldr r0, [r6]
	adds r0, 0x7B
	movs r1, 0xB
_08049742:
	strb r1, [r0]
_08049744:
	ldr r5, _080497EC
	ldr r3, [r5]
	adds r1, r3, 0
	adds r1, 0x86
	ldrb r0, [r1]
	cmp r0, 0
	beq _080497DC
	adds r0, r3, 0
	adds r0, 0x87
	ldrb r0, [r0]
	cmp r0, 0
	beq _080497DC
	ldrh r1, [r1]
	ldr r0, _080497F0
	cmp r1, r0
	bne _08049792
	adds r1, r3, 0
	adds r1, 0x8C
	movs r4, 0
	movs r2, 0
	ldr r0, _080497F4
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0x8E
	strh r2, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	movs r1, 0x9
	strb r1, [r0]
_08049792:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x86
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080497A8
	adds r0, r1, 0
	adds r0, 0x87
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080497DC
_080497A8:
	movs r0, 0x1
	bl sub_804AA0C
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x8C
	movs r4, 0
	movs r3, 0
	ldr r0, _080497F8
	strh r0, [r2]
	adds r1, 0x8E
	strh r3, [r1]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x86
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x87
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, 0x7B
	movs r1, 0x8
	strb r1, [r0]
_080497DC:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080497E4: .4byte 0x00000202
_080497E8: .4byte 0x0000eebb
_080497EC: .4byte gUnknown_03004824
_080497F0: .4byte 0x00000101
_080497F4: .4byte 0x0000ccdd
_080497F8: .4byte 0x0000ddee
	thumb_func_end sub_80492D8

	thumb_func_start sub_80494D8
sub_80494D8: @ 80497FC
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08049828
	cmp r4, 0
	bne _0804981E
	movs r0, 0
	bl sub_80490BC
	b _08049824
_0804981E:
	adds r0, r4, 0
	bl sub_80491E4
_08049824:
	bl ResetBlockReceivedFlags
_08049828:
	cmp r4, 0
	bne _08049830
	bl sub_80492D8
_08049830:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80494D8

	thumb_func_start sub_8049514
sub_8049514: @ 8049838
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	movs r5, 0
	ldr r2, _0804986C
	ldr r3, [r2]
	ldr r4, _08049870
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r3, 0x44
	adds r2, r1
	adds r2, r4
_0804985E:
	ldrb r1, [r2]
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08049874
	adds r6, r1, 0
	b _0804987C
	.align 2, 0
_0804986C: .4byte gUnknown_03004824
_08049870: .4byte gTradeNextSelectedMonTable
_08049874:
	adds r2, 0x1
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804985E
_0804987C:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8049514

	thumb_func_start sub_8049560
sub_8049560: @ 8049884
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r7]
	bl sub_8049514
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xC
	bne _080498DC
	ldr r5, _080498D4
	ldr r0, [r5]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080498D8
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r5]
	adds r2, 0x40
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xE0
	strh r1, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xA0
	strh r1, [r0, 0x22]
	b _08049924
	.align 2, 0
_080498D4: .4byte gUnknown_03004824
_080498D8: .4byte gSprites
_080498DC:
	ldr r4, _08049938
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0804993C
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, [r4]
	adds r4, 0x40
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r2, _08049940
	lsls r3, r6, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0x20
	strh r0, [r1, 0x20]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, 0x1
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 3
	strh r0, [r1, 0x22]
_08049924:
	ldrb r0, [r7]
	cmp r0, r6
	beq _08049930
	movs r0, 0x5
	bl PlaySE
_08049930:
	strb r6, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049938: .4byte gUnknown_03004824
_0804993C: .4byte gSprites
_08049940: .4byte gTradeMonSpriteCoords
	thumb_func_end sub_8049560

	thumb_func_start sub_8049620
sub_8049620: @ 8049944
	push {r4,lr}
	movs r0, 0
	bl sub_804AA0C
	ldr r4, _0804998C
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x5
	strb r1, [r0]
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08049994
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08049990
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	adds r0, 0x4D
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	b _0804999C
	.align 2, 0
_0804998C: .4byte gUnknown_03004824
_08049990: .4byte 0x0000aabb
_08049994:
	ldr r0, [r4]
	adds r0, 0x84
	movs r1, 0x1
	strb r1, [r0]
_0804999C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8049620

	thumb_func_start sub_8049680
sub_8049680: @ 80499A4
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080499C4
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080499CC
	ldr r0, _080499C8
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0
	bl sub_8049560
	b _08049A18
	.align 2, 0
_080499C4: .4byte gMain
_080499C8: .4byte gUnknown_03004824
_080499CC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080499E8
	ldr r0, _080499E4
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x1
	bl sub_8049560
	b _08049A18
	.align 2, 0
_080499E4: .4byte gUnknown_03004824
_080499E8:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08049A04
	ldr r0, _08049A00
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x2
	bl sub_8049560
	b _08049A18
	.align 2, 0
_08049A00: .4byte gUnknown_03004824
_08049A04:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08049A18
	ldr r0, _08049A74
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x3
	bl sub_8049560
_08049A18:
	ldr r0, _08049A78
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049ADA
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08049A74
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r1, [r1]
	cmp r1, 0x5
	bhi _08049A80
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x12
	movs r2, 0xE
	movs r3, 0x1C
	bl DrawTextWindow
	ldr r3, _08049A7C
	movs r0, 0x13
	movs r1, 0xF
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x13
	movs r2, 0xF
	movs r3, 0x2
	bl InitMenu
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x1
	strb r1, [r0]
	b _08049ADA
	.align 2, 0
_08049A74: .4byte gUnknown_03004824
_08049A78: .4byte gMain
_08049A7C: .4byte gUnknown_0820C320
_08049A80:
	cmp r1, 0xB
	bhi _08049A9E
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x2
	strb r1, [r0]
	b _08049ADA
_08049A9E:
	cmp r1, 0xC
	bne _08049ADA
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x1D
	bl DrawTextWindow
	movs r0, 0x18
	movs r1, 0xE
	movs r2, 0x4
	bl InitYesNoMenu
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x4
	strb r1, [r0]
	ldr r0, _08049B18
	ldr r0, [r0, 0x10]
	ldr r1, [r4]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _08049B1C
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
_08049ADA:
	ldr r0, _08049B20
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08049B10
	movs r2, 0
	ldr r3, _08049B24
_08049AEC:
	ldr r0, [r3]
	lsls r1, r2, 1
	adds r0, 0x8C
	adds r0, r1
	strh r2, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _08049AEC
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08049B24
	ldr r1, [r1]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049B10:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049B18: .4byte gUnknown_0820C14C
_08049B1C: .4byte 0x06010000
_08049B20: .4byte gMain
_08049B24: .4byte gUnknown_03004824
	thumb_func_end sub_8049680

	thumb_func_start sub_8049804
sub_8049804: @ 8049B28
	push {lr}
	bl sub_8072DEC
	bl sub_804A80C
	ldr r3, _08049B74
	ldr r0, [r3]
	adds r0, 0x7B
	movs r1, 0
	strb r1, [r0]
	ldr r2, _08049B78
	ldr r0, [r3]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08049B7C
	ldr r0, [r0, 0x4]
	ldr r1, [r3]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _08049B80
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
	pop {r0}
	bx r0
	.align 2, 0
_08049B74: .4byte gUnknown_03004824
_08049B78: .4byte gSprites
_08049B7C: .4byte gUnknown_0820C14C
_08049B80: .4byte 0x06010000
	thumb_func_end sub_8049804

	thumb_func_start sub_8049860
sub_8049860: @ 8049B84
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08049BA0
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049BA4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08049BB4
	.align 2, 0
_08049BA0: .4byte gMain
_08049BA4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049BC0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08049BB4:
	bl MoveMenuCursor
	ldr r1, _08049BFC
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049BC0:
	ldr r0, _08049C00
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049C5C
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08049C04
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08049BFC
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x2
	strb r1, [r0]
	b _08049C6E
	.align 2, 0
_08049BFC: .4byte gUnknown_03004824
_08049C00: .4byte gMain
_08049C04:
	ldr r4, _08049C34
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x51
	adds r1, r2, 0
	adds r1, 0x42
	ldrb r1, [r1]
	adds r2, 0x41
	ldrb r2, [r2]
	bl sub_80499F0
	lsls r0, 24
	cmp r0, 0
	bne _08049C38
	movs r0, 0x3
	movs r1, 0x2
	bl sub_804AADC
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x8
	strb r1, [r0]
	b _08049C6E
	.align 2, 0
_08049C34: .4byte gUnknown_03004824
_08049C38:
	bl sub_8049620
	ldr r2, _08049C58
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08049C6E
	.align 2, 0
_08049C58: .4byte gSprites
_08049C5C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049C6E
	movs r0, 0x5
	bl PlaySE
	bl sub_8049804
_08049C6E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8049860

	thumb_func_start sub_8049954
sub_8049954: @ 8049C78
	push {lr}
	ldr r0, _08049C9C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08049C8E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049C98
_08049C8E:
	movs r0, 0x5
	bl PlaySE
	bl sub_8049804
_08049C98:
	pop {r0}
	bx r0
	.align 2, 0
_08049C9C: .4byte gMain
	thumb_func_end sub_8049954

	thumb_func_start sub_804997C
sub_804997C: @ 8049CA0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08049CD8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08049D04
	ldr r0, _08049CDC
	ldr r2, [r0]
	adds r3, r2, 0
	adds r3, 0x41
	ldrb r1, [r3]
	cmp r1, 0x5
	bhi _08049CE8
	ldr r0, _08049CE0
	ldrb r1, [r3]
	adds r2, 0x42
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08049CE4
	movs r4, 0x4
	str r4, [sp]
	bl sub_809D8BC
	b _08049D04
	.align 2, 0
_08049CD8: .4byte gPaletteFade
_08049CDC: .4byte gUnknown_03004824
_08049CE0: .4byte gPlayerParty
_08049CE4: .4byte sub_80484F4
_08049CE8:
	ldr r0, _08049D0C
	subs r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x43
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08049D10
	movs r4, 0x4
	str r4, [sp]
	bl sub_809D8BC
_08049D04:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049D0C: .4byte gEnemyParty
_08049D10: .4byte sub_80484F4
	thumb_func_end sub_804997C

	thumb_func_start sub_80499F0
sub_80499F0: @ 8049D14
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	movs r3, 0
	cmp r1, r4
	bge _08049D3C
_08049D28:
	cmp r2, r3
	beq _08049D36
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r1, r0, 24
_08049D36:
	adds r3, 0x1
	cmp r3, r4
	blt _08049D28
_08049D3C:
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80499F0

	thumb_func_start sub_8049A20
sub_8049A20: @ 8049D44
	push {r4,r5,lr}
	sub sp, 0xC
	movs r2, 0
	ldr r0, _08049DA4
	ldr r1, [r0]
	adds r3, r1, 0
	adds r3, 0x42
	adds r5, r0, 0
	ldrb r0, [r3]
	cmp r2, r0
	bge _08049D70
	adds r4, r1, 0
	adds r4, 0x51
_08049D5E:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	ldrb r0, [r3]
	cmp r2, r0
	blt _08049D5E
_08049D70:
	adds r4, r5, 0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x42
	ldrb r1, [r1]
	adds r0, 0x41
	ldrb r2, [r0]
	mov r0, sp
	bl sub_80499F0
	lsls r0, 24
	cmp r0, 0
	bne _08049DAC
	movs r0, 0x3
	movs r1, 0x2
	bl sub_804AADC
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049DA8
	strh r1, [r0]
	movs r0, 0xB4
	movs r1, 0
	bl sub_804AADC
	b _08049DD8
	.align 2, 0
_08049DA4: .4byte gUnknown_03004824
_08049DA8: .4byte 0x0000bbcc
_08049DAC:
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x8C
	ldr r1, _08049DE0
	strh r1, [r0]
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08049DD8
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r5]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049DD8:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049DE0: .4byte 0x0000bbbb
	thumb_func_end sub_8049A20

	thumb_func_start sub_8049AC0
sub_8049AC0: @ 8049DE4
	push {r4,lr}
	ldr r0, _08049E00
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049E04
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08049E14
	.align 2, 0
_08049E00: .4byte gMain
_08049E04:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049E20
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08049E14:
	bl MoveMenuCursor
	ldr r1, _08049E44
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049E20:
	ldr r0, _08049E48
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049E88
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	bne _08049E4C
	bl sub_8049A20
	b _08049E7A
	.align 2, 0
_08049E44: .4byte gUnknown_03004824
_08049E48: .4byte gMain
_08049E4C:
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08049E7A
	ldr r4, _08049E80
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049E84
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049E7A:
	ldr r0, _08049E80
	ldr r0, [r0]
	b _08049ECE
	.align 2, 0
_08049E80: .4byte gUnknown_03004824
_08049E84: .4byte 0x0000bbcc
_08049E88:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049ED4
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	bne _08049EB0
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _08049EDC
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049EB0:
	ldr r4, _08049EDC
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049EE0
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
_08049ECE:
	adds r0, 0x7B
	movs r1, 0x64
	strb r1, [r0]
_08049ED4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049EDC: .4byte gUnknown_03004824
_08049EE0: .4byte 0x0000bbcc
	thumb_func_end sub_8049AC0

	thumb_func_start sub_8049BC0
sub_8049BC0: @ 8049EE4
	push {r4,r5,lr}
	ldr r0, _08049F00
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049F04
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08049F14
	.align 2, 0
_08049F00: .4byte gMain
_08049F04:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049F20
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08049F14:
	bl MoveMenuCursor
	ldr r1, _08049F80
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049F20:
	ldr r0, _08049F84
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049F96
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08049F90
	movs r0, 0x4
	bl sub_804AA0C
	ldr r4, _08049F80
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x8C
	ldr r1, _08049F88
	strh r1, [r2]
	adds r0, 0x8E
	strh r5, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r2, _08049F8C
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x64
	strb r1, [r0]
	b _08049FA8
	.align 2, 0
_08049F80: .4byte gUnknown_03004824
_08049F84: .4byte gMain
_08049F88: .4byte 0x0000eeaa
_08049F8C: .4byte gSprites
_08049F90:
	bl sub_8049804
	b _08049FA8
_08049F96:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049FA8
	movs r0, 0x5
	bl PlaySE
	bl sub_8049804
_08049FA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8049BC0

	thumb_func_start sub_8049C8C
sub_8049C8C: @ 8049FB0
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _08049FD2
	ldr r4, _08049FE4
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x8A
	ldrb r0, [r0]
	bl sub_8049E9C
_08049FD2:
	ldr r0, _08049FE4
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x7
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049FE4: .4byte gUnknown_03004824
	thumb_func_end sub_8049C8C

	thumb_func_start sub_8049CC4
sub_8049CC4: @ 8049FE8
	push {r4,lr}
	ldr r4, _0804A00C
	ldr r0, [r4]
	adds r0, 0x80
	ldrh r1, [r0]
	ldr r0, _0804A010
	cmp r1, r0
	bne _0804A004
	bl sub_8049088
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xE
	strb r1, [r0]
_0804A004:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A00C: .4byte gUnknown_03004824
_0804A010: .4byte 0x00000505
	thumb_func_end sub_8049CC4

	thumb_func_start DisplayMessageAndContinueTask
DisplayMessageAndContinueTask: @ 804A014
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _0804A064
	ldr r1, [r4]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0xB4
	ldrb r0, [r0]
	cmp r0, 0x78
	bls _0804A05A
	adds r0, r1, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x1D
	bl DrawTextWindow
	movs r0, 0x18
	movs r1, 0xE
	movs r2, 0x4
	bl InitYesNoMenu
	ldr r0, [r4]
	adds r0, 0xB4
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x3
	strb r1, [r0]
_0804A05A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A064: .4byte gUnknown_03004824
	thumb_func_end DisplayMessageAndContinueTask

	thumb_func_start sub_8049D44
sub_8049D44: @ 804A068
	push {lr}
	ldr r0, _0804A0B4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804A0AE
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_804A840
	movs r0, 0x1
	bl sub_804A840
	ldr r2, _0804A0B8
	ldr r0, [r2]
	adds r0, 0x7B
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0804A0BC
	ldr r0, [r2]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0804A0AE:
	pop {r0}
	bx r0
	.align 2, 0
_0804A0B4: .4byte gMain
_0804A0B8: .4byte gUnknown_03004824
_0804A0BC: .4byte gSprites
	thumb_func_end sub_8049D44

	thumb_func_start sub_8049D9C
sub_8049D9C: @ 804A0C0
	push {lr}
	ldr r0, _0804A0E0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804A0DC
	bl sub_800832C
	ldr r0, _0804A0E4
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xC
	strb r1, [r0]
_0804A0DC:
	pop {r0}
	bx r0
	.align 2, 0
_0804A0E0: .4byte gPaletteFade
_0804A0E4: .4byte gUnknown_03004824
	thumb_func_end sub_8049D9C

	thumb_func_start sub_8049DC4
sub_8049DC4: @ 804A0E8
	push {lr}
	ldr r0, _0804A0FC
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804A0F8
	ldr r0, _0804A100
	bl SetMainCallback2
_0804A0F8:
	pop {r0}
	bx r0
	.align 2, 0
_0804A0FC: .4byte gReceivedRemoteLinkPlayers
_0804A100: .4byte sub_805465C
	thumb_func_end sub_8049DC4

	thumb_func_start sub_8049DE0
sub_8049DE0: @ 804A104
	push {lr}
	ldr r0, _0804A11C
	ldr r0, [r0]
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0xF
	bhi _0804A1BC
	lsls r0, 2
	ldr r1, _0804A120
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804A11C: .4byte gUnknown_03004824
_0804A120: .4byte _0804A124
	.align 2, 0
_0804A124:
	.4byte _0804A164
	.4byte _0804A16A
	.4byte _0804A170
	.4byte _0804A176
	.4byte _0804A17C
	.4byte _0804A1BC
	.4byte _0804A182
	.4byte _0804A188
	.4byte _0804A18E
	.4byte _0804A194
	.4byte _0804A19A
	.4byte _0804A1A0
	.4byte _0804A1A6
	.4byte _0804A1AC
	.4byte _0804A1B2
	.4byte _0804A1B8
_0804A164:
	bl sub_8049680
	b _0804A1BC
_0804A16A:
	bl sub_8049860
	b _0804A1BC
_0804A170:
	bl sub_804997C
	b _0804A1BC
_0804A176:
	bl sub_8049AC0
	b _0804A1BC
_0804A17C:
	bl sub_8049BC0
	b _0804A1BC
_0804A182:
	bl sub_8049C8C
	b _0804A1BC
_0804A188:
	bl sub_8049CC4
	b _0804A1BC
_0804A18E:
	bl sub_8049D44
	b _0804A1BC
_0804A194:
	bl sub_8048A14
	b _0804A1BC
_0804A19A:
	bl sub_8048A50
	b _0804A1BC
_0804A1A0:
	bl sub_8049D9C
	b _0804A1BC
_0804A1A6:
	bl sub_8049DC4
	b _0804A1BC
_0804A1AC:
	bl sub_8048A90
	b _0804A1BC
_0804A1B2:
	bl DisplayMessageAndContinueTask
	b _0804A1BC
_0804A1B8:
	bl sub_8049954
_0804A1BC:
	pop {r0}
	bx r0
	thumb_func_end sub_8049DE0

	thumb_func_start sub_8049E9C
sub_8049E9C: @ 804A1C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0804A1F4
	ldr r0, [r3]
	adds r0, 0x80
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A1EC
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x82
	adds r0, r2
	strb r4, [r0]
_0804A1EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1F4: .4byte gUnknown_03004824
	thumb_func_end sub_8049E9C

	thumb_func_start sub_8049ED4
sub_8049ED4: @ 804A1F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x74
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0804A248
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0x82
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x1
	str r1, [sp, 0x6C]
	cmp r0, 0x5
	bhi _0804A222
	movs r2, 0
	str r2, [sp, 0x6C]
_0804A222:
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r5, 0
	adds r0, 0x80
	mov r1, r10
	adds r3, r0, r1
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _0804A23E
	b _0804A3D0
_0804A23E:
	cmp r0, 0x2
	bgt _0804A24C
	cmp r0, 0x1
	beq _0804A25A
	b _0804A5B8
	.align 2, 0
_0804A248: .4byte gUnknown_03004824
_0804A24C:
	cmp r0, 0x3
	bne _0804A252
	b _0804A408
_0804A252:
	cmp r0, 0x4
	bne _0804A258
	b _0804A568
_0804A258:
	b _0804A5B8
_0804A25A:
	movs r4, 0
	adds r0, r5, 0
	adds r0, 0x42
	add r0, r10
	ldr r7, _0804A3B8
	ldr r2, [sp, 0x6C]
	lsls r2, 1
	mov r9, r2
	ldr r3, _0804A3BC
	mov r12, r3
	mov r5, r10
	lsls r5, 4
	str r5, [sp, 0x70]
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0804A2B2
	adds r6, r7, 0
	ldr r2, _0804A3C0
	ldr r0, [sp, 0x6C]
	add r0, r9
	lsls r3, r0, 1
	movs r5, 0x4
_0804A286:
	ldr r0, [r2]
	adds r1, r4, r3
	adds r0, 0x34
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r2]
	adds r0, 0x42
	add r0, r10
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0804A286
_0804A2B2:
	ldr r1, _0804A3C0
	ldr r0, [r1]
	ldr r5, [sp, 0x6C]
	add r5, r9
	lsls r3, r5, 1
	mov r2, r8
	adds r6, r2, r3
	adds r0, 0x34
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _0804A3C0
	ldr r4, [r0]
	adds r4, 0x34
	adds r4, r6
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x14
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	lsls r5, 2
	mov r1, r12
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, 0x1
	lsls r3, 1
	add r3, r12
	ldrb r1, [r3]
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r2, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	mov r0, r12
	adds r0, 0x1
	adds r5, r0
	ldrb r0, [r5]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _0804A3C4
	bl oamt_set_x3A_32
	ldr r2, _0804A3C0
	ldr r1, [r2]
	adds r1, 0x80
	add r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x34
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl sub_8078A34
	bl sub_8072DEC
	ldr r3, _0804A3C0
	ldr r0, [r3]
	adds r0, 0x4
	ldr r1, _0804A3C8
	mov r5, r9
	adds r2, r5, r1
	ldrb r2, [r2]
	adds r1, 0x1
	add r1, r9
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r1, _0804A3C0
	ldr r0, [r1]
	adds r0, 0xC8
	ldr r2, [sp, 0x70]
	mov r3, r10
	subs r1, r2, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804A3CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x11
	str r2, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r2, 0
	bl _0804AD20
	ldr r0, [sp, 0x6C]
	cmp r0, 0
	beq _0804A3B0
	b _0804A5B8
_0804A3B0:
	bl sub_804A80C
	b _0804A5B8
	.align 2, 0
_0804A3B8: .4byte gSprites
_0804A3BC: .4byte gTradeMonSpriteCoords
_0804A3C0: .4byte gUnknown_03004824
_0804A3C4: .4byte sub_809D62C
_0804A3C8: .4byte gUnknown_0820C330
_0804A3CC: .4byte gTradePartyBoxTilemap
_0804A3D0:
	ldr r2, _0804A400
	ldr r1, [sp, 0x6C]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	add r0, r8
	adds r1, r5, 0
	adds r1, 0x34
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0804A404
	cmp r1, r0
	beq _0804A3F8
	b _0804A5B8
_0804A3F8:
	movs r0, 0x3
	strb r0, [r3]
	b _0804A5B8
	.align 2, 0
_0804A400: .4byte gSprites
_0804A404: .4byte sub_809D62C
_0804A408:
	adds r0, r5, 0
	adds r0, 0xC8
	ldr r2, [sp, 0x6C]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804A54C
	movs r2, 0xF
	str r2, [sp]
	movs r7, 0x11
	str r7, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r2, 0
	bl _0804AD20
	ldr r0, _0804A550
	ldr r3, [r0]
	ldr r1, [sp, 0x6C]
	lsls r6, r1, 1
	adds r1, r6
	mov r9, r1
	lsls r1, 1
	mov r2, r8
	adds r0, r2, r1
	adds r3, 0x34
	adds r3, r0
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r5, _0804A554
	adds r2, r5
	ldr r4, _0804A558
	mov r0, r9
	lsls r5, r0, 2
	adds r0, r5, r4
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 1
	adds r1, r4
	ldrb r1, [r1]
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r2, 0x20]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _0804A554
	adds r1, r2
	adds r4, 0x1
	adds r5, r4
	ldrb r0, [r5]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x22]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r5, 0
	strh r5, [r0, 0x24]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x26]
	mov r0, sp
	adds r0, 0x12
	ldr r1, [sp, 0x6C]
	mov r2, r8
	bl sub_804A2B4
	add r1, sp, 0xC
	movs r3, 0xFC
	strb r3, [r1]
	adds r2, r1, 0
	movs r1, 0x6
	strb r1, [r2, 0x1]
	movs r1, 0x4
	strb r1, [r2, 0x2]
	adds r1, r2, 0
	strb r3, [r1, 0x3]
	strb r7, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x40
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	strb r1, [r2, 0x5]
	ldr r0, _0804A550
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x7A
	ldrb r2, [r1]
	mov r1, r9
	lsls r1, 6
	mov r9, r1
	add r2, r9
	ldr r4, _0804A55C
	ldr r3, [sp, 0x6C]
	lsls r1, r3, 2
	adds r3, r1, r4
	ldrb r3, [r3]
	ldr r5, _0804A560
	adds r1, r5
	ldrb r1, [r1]
	str r1, [sp]
	add r1, sp, 0xC
	bl sub_8003460
	add r7, sp, 0x34
	adds r0, r7, 0
	ldr r1, [sp, 0x6C]
	mov r2, r8
	bl sub_804A33C
	ldr r0, _0804A550
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _0804A564
	adds r2, 0x7A
	ldrb r2, [r2]
	add r2, r9
	adds r2, 0x20
	adds r6, 0x1
	lsls r6, 1
	adds r4, r6, r4
	ldrb r5, [r4]
	ldr r3, _0804A560
	adds r6, r3
	ldrb r4, [r6]
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	adds r3, r5, 0
	bl sub_8003460
	ldr r0, _0804A550
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x7A
	ldrb r2, [r1]
	add r2, r9
	adds r2, 0x26
	str r4, [sp]
	adds r1, r7, 0
	adds r3, r5, 0
	bl sub_8003460
	ldr r2, _0804A550
	ldr r1, [r2]
	b _0804A5AE
	.align 2, 0
_0804A54C: .4byte gTradeMovesBoxTilemap
_0804A550: .4byte gUnknown_03004824
_0804A554: .4byte gSprites
_0804A558: .4byte gTradeMonSpriteCoords
_0804A55C: .4byte gUnknown_0820C334
_0804A560: .4byte 0x08219305
_0804A564: .4byte gOtherText_Terminator2
_0804A568:
	ldr r0, _0804A5C8
	ldr r0, [r0, 0x14]
	adds r1, r5, 0
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r3, _0804A5CC
	adds r1, r3
	movs r2, 0x14
	bl sub_804ACD8
	ldr r0, _0804A5D0
	mov r5, r10
	lsls r1, r5, 1
	adds r4, r1, r0
	ldrb r2, [r4]
	adds r2, 0x4
	lsls r2, 24
	lsrs r2, 24
	adds r0, 0x1
	adds r1, r0
	ldrb r3, [r1]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r1]
	str r0, [sp, 0x4]
	mov r0, r10
	mov r1, r8
	bl sub_804A51C
	ldr r0, _0804A5D4
	ldr r1, [r0]
_0804A5AE:
	adds r1, 0x80
	add r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804A5B8:
	add sp, 0x74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A5C8: .4byte gUnknown_0820C14C
_0804A5CC: .4byte 0x06010000
_0804A5D0: .4byte gUnknown_0820C3D1
_0804A5D4: .4byte gUnknown_03004824
	thumb_func_end sub_8049ED4

	thumb_func_start sub_804A2B4
sub_804A2B4: @ 804A5D8
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	bne _0804A618
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _0804A614
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, 0
	bl GetMonGender
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	b _0804A642
	.align 2, 0
_0804A614: .4byte gPlayerParty
_0804A618:
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _0804A658
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, 0
	bl GetMonGender
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
_0804A642:
	ldr r0, _0804A65C
	adds r1, r5, 0
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804A658: .4byte gEnemyParty
_0804A65C: .4byte gWindowConfig_81E7294
	thumb_func_end sub_804A2B4

	thumb_func_start sub_804A33C
sub_804A33C: @ 804A660
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0804A6A8
	ldr r1, [r0]
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 1
	adds r0, r2, r0
	adds r1, 0x5D
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A718
	movs r4, 0
	movs r0, 0x64
	adds r5, r2, 0
	muls r5, r0
	ldr r0, _0804A6AC
	mov r9, r0
	ldr r2, _0804A6B0
	mov r8, r2
_0804A69A:
	cmp r7, 0
	bne _0804A6B4
	adds r1, r4, 0
	adds r1, 0xD
	mov r2, r9
	b _0804A6BA
	.align 2, 0
_0804A6A8: .4byte gUnknown_03004824
_0804A6AC: .4byte gPlayerParty
_0804A6B0: .4byte gEnemyParty
_0804A6B4:
	adds r1, r4, 0
	adds r1, 0xD
	mov r2, r8
_0804A6BA:
	adds r0, r5, r2
	movs r2, 0
	bl GetMonData
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0804A69A
	ldr r1, _0804A70C
	adds r0, r6, 0
	bl StringCopy
	movs r4, 0
_0804A6DC:
	lsls r0, r4, 1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0804A6F8
	adds r1, r0, 0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _0804A710
	adds r1, r0
	adds r0, r6, 0
	bl StringAppend
_0804A6F8:
	adds r0, r6, 0
	ldr r1, _0804A714
	bl StringAppend
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0804A6DC
	b _0804A728
	.align 2, 0
_0804A70C: .4byte gOtherText_Terminator
_0804A710: .4byte gMoveNames
_0804A714: .4byte gOtherText_ControlAndMiscText
_0804A718:
	ldr r1, _0804A738
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _0804A73C
	adds r0, r6, 0
	bl StringAppend
_0804A728:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A738: .4byte gOtherText_Terminator
_0804A73C: .4byte gOtherText_FourQuestions
	thumb_func_end sub_804A33C

	thumb_func_start sub_804A41C
sub_804A41C: @ 804A740
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x44
	lsls r0, 24
	lsrs r5, r0, 24
	add r3, sp, 0x1C
	movs r2, 0
	movs r1, 0xFC
	strb r1, [r3]
	movs r0, 0x6
	strb r0, [r3, 0x1]
	movs r0, 0x4
	strb r0, [r3, 0x2]
	strb r1, [r3, 0x3]
	movs r0, 0x11
	strb r0, [r3, 0x4]
	strb r2, [r3, 0x5]
	movs r6, 0
	ldr r1, _0804A794
	ldr r0, [r1]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804A828
	mov r8, r3
	adds r7, r1, 0
	ldr r0, _0804A798
	mov r9, r0
	movs r4, 0x1
	add r4, r9
	mov r10, r4
_0804A786:
	cmp r5, 0
	bne _0804A7A0
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804A79C
	b _0804A7A8
	.align 2, 0
_0804A794: .4byte gUnknown_03004824
_0804A798: .4byte gTradeMonSpriteCoords
_0804A79C: .4byte gPlayerParty
_0804A7A0:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804A838
_0804A7A8:
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	mov r0, sp
	adds r0, 0x22
	add r1, sp, 0x4
	bl StringCopy10
	adds r0, r4, 0
	bl GetMonGender
	mov r1, sp
	adds r1, 0x22
	ldr r0, _0804A83C
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x32
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	adds r0, r1, 0x4
	adds r1, 0x7A
	lsls r2, r5, 5
	adds r2, r5
	lsls r2, 2
	ldrb r1, [r1]
	adds r2, r1
	movs r1, 0x16
	muls r1, r6
	adds r2, r1
	lsls r2, 16
	lsrs r2, 16
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 1
	adds r1, r6, r1
	lsls r1, 1
	mov r4, r9
	adds r3, r1, r4
	ldrb r3, [r3]
	add r1, r10
	ldrb r1, [r1]
	str r1, [sp]
	mov r1, r8
	bl sub_8003460
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [r7]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804A786
_0804A828:
	add sp, 0x44
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A838: .4byte gEnemyParty
_0804A83C: .4byte gWindowConfig_81E7294
	thumb_func_end sub_804A41C

	thumb_func_start sub_804A51C
sub_804A51C: @ 804A840
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	ldr r5, [sp, 0x4C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x24]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0804A8C0
	ldr r0, [r0]
	adds r0, 0xC8
	ldr r3, _0804A8C4
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_804A96C
	mov r0, r8
	cmp r0, 0
	bne _0804A8CC
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0804A8C8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0xC
	bl GetMonData
	b _0804A8F8
	.align 2, 0
_0804A8C0: .4byte gUnknown_03004824
_0804A8C4: .4byte gTradeMonBoxTilemap
_0804A8C8: .4byte gPlayerParty
_0804A8CC:
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0804A980
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0xC
	bl GetMonData
_0804A8F8:
	ldr r1, _0804A984
	ldr r5, [r1]
	mov r3, r8
	lsls r0, r3, 1
	add r0, r8
	lsls r0, 1
	add r0, r9
	adds r1, r5, 0
	adds r1, 0x5D
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A9B4
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [sp, 0x24]
	lsls r2, r0, 5
	cmp r4, 0
	beq _0804A938
	mov r1, r10
	adds r0, r1, r2
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0xDA
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x60
	strh r0, [r1]
_0804A938:
	ldr r3, _0804A984
	ldr r4, [r3]
	mov r0, r10
	adds r5, r0, r2
	adds r0, r5, 0x1
	lsls r0, 1
	adds r4, 0xDA
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x70
	strh r0, [r4]
	cmp r7, 0
	bne _0804A988
	add r0, sp, 0xC
	movs r1, 0
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _0804A9F0
	ldr r3, _0804A984
	ldr r1, [r3]
	adds r0, r5, 0
	subs r0, 0x1F
	lsls r0, 1
	adds r1, 0xDA
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804A9EE
	.align 2, 0
_0804A980: .4byte gEnemyParty
_0804A984: .4byte gUnknown_03004824
_0804A988:
	cmp r7, 0xFE
	bne _0804A9F0
	add r0, sp, 0xC
	movs r1, 0xFE
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _0804A9F0
	ldr r0, _0804A9B0
	ldr r1, [r0]
	adds r0, r5, 0
	subs r0, 0x1F
	lsls r0, 1
	adds r1, 0xDA
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x2
	b _0804A9EE
	.align 2, 0
_0804A9B0: .4byte gUnknown_03004824
_0804A9B4:
	ldr r1, [sp, 0x24]
	lsls r0, r1, 5
	mov r1, r10
	adds r3, r1, r0
	adds r1, r3, 0
	subs r1, 0x20
	lsls r1, 1
	adds r2, r5, 0
	adds r2, 0xDA
	adds r1, r2, r1
	adds r0, r3, 0
	subs r0, 0x21
	lsls r0, 1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r3, 0
	subs r1, 0x1F
	lsls r1, 1
	adds r1, r2, r1
	adds r0, r3, 0
	subs r0, 0x24
	lsls r0, 1
	adds r2, r0
	ldrh r2, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	orrs r0, r2
_0804A9EE:
	strh r0, [r1]
_0804A9F0:
	ldr r0, _0804AA0C
	ldr r0, [r0]
	adds r0, 0xD8
	movs r1, 0x1
	strb r1, [r0]
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA0C: .4byte gUnknown_03004824
	thumb_func_end sub_804A51C

	thumb_func_start sub_804A6DC
sub_804A6DC: @ 804AA10
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r0, _0804AA68
	ldr r0, [r0]
	adds r0, 0x42
	adds r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804AA60
	lsls r0, r6, 1
	adds r0, r6
	ldr r1, _0804AA6C
	lsls r0, 2
	adds r5, r0, r1
	ldr r1, _0804AA70
	adds r4, r0, r1
_0804AA36:
	lsls r1, r7, 24
	lsrs r1, 24
	ldrb r2, [r5]
	ldrb r3, [r5, 0x1]
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r4, 0x1]
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl sub_804A51C
	adds r5, 0x2
	adds r4, 0x2
	adds r7, 0x1
	ldr r0, _0804AA68
	ldr r0, [r0]
	adds r0, 0x42
	adds r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AA36
_0804AA60:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA68: .4byte gUnknown_03004824
_0804AA6C: .4byte gTradeLevelDisplayCoords
_0804AA70: .4byte gTradeMonBoxCoords
	thumb_func_end sub_804A6DC

	thumb_func_start sub_804A740
sub_804A740: @ 804AA74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r7, 0
	ldr r3, _0804AB34
	ldr r0, [r3]
	adds r0, 0x42
	add r0, r12
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804AB26
	ldr r6, _0804AB38
	mov r9, r3
	mov r1, r12
	lsls r0, r1, 1
	add r0, r12
	lsls r2, r0, 1
	mov r10, r2
	ldr r1, _0804AB3C
	movs r2, 0
	mov r8, r2
	lsls r0, 2
	adds r5, r0, r1
_0804AAAC:
	mov r1, r9
	ldr r0, [r1]
	mov r2, r10
	adds r4, r7, r2
	adds r0, 0x34
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	mov r0, r9
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x34
	adds r2, r4
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r5]
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r1, 0x20]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r5, 0x1]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r2, r8
	strh r2, [r0, 0x26]
	adds r5, 0x2
	adds r7, 0x1
	adds r3, 0x42
	add r3, r12
	ldrb r3, [r3]
	cmp r7, r3
	blt _0804AAAC
_0804AB26:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AB34: .4byte gUnknown_03004824
_0804AB38: .4byte gSprites
_0804AB3C: .4byte gTradeMonSpriteCoords
	thumb_func_end sub_804A740

	thumb_func_start sub_804A80C
sub_804A80C: @ 804AB40
	push {lr}
	sub sp, 0x8
	ldr r0, _0804AB6C
	ldr r0, [r0]
	adds r0, 0x4
	ldr r1, _0804AB70
	ldrb r2, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	movs r0, 0x1
	bl sub_804A41C
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0804AB6C: .4byte gUnknown_03004824
_0804AB70: .4byte gUnknown_0820C330
	thumb_func_end sub_804A80C

	thumb_func_start sub_804A840
sub_804A840: @ 804AB74
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0804ABDC
	ldr r4, _0804ABD0
	ldr r0, [r4]
	adds r0, 0x4
	ldr r1, _0804ABD4
	ldrb r2, [r1]
	ldrb r1, [r1, 0x1]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, [r4]
	adds r0, 0xC8
	ldr r3, _0804ABD8
	movs r1, 0xF
	str r1, [sp]
	movs r1, 0x11
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	bl _0804AD20
	movs r0, 0
	bl sub_804A6DC
	movs r0, 0
	bl sub_804A41C
	movs r0, 0
	bl sub_804A740
	ldr r0, [r4]
	adds r0, 0xC8
	bl sub_804A938
	b _0804AC2E
	.align 2, 0
_0804ABD0: .4byte gUnknown_03004824
_0804ABD4: .4byte gUnknown_0820C330
_0804ABD8: .4byte gTradePartyBoxTilemap
_0804ABDC:
	bl sub_8072DEC
	ldr r4, _0804AC58
	ldr r0, [r4]
	adds r0, 0x4
	ldr r1, _0804AC5C
	ldrb r2, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, [r4]
	adds r0, 0xC8
	ldr r3, _0804AC60
	movs r1, 0xF
	str r1, [sp]
	movs r1, 0x11
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0xF
	movs r2, 0
	bl _0804AD20
	movs r0, 0x1
	bl sub_804A6DC
	movs r0, 0x1
	bl sub_804A41C
	movs r0, 0x1
	bl sub_804A740
	ldr r0, [r4]
	adds r0, 0xC8
	bl sub_804A938
_0804AC2E:
	ldr r0, _0804AC64
	ldr r0, [r0, 0x4]
	ldr r4, _0804AC58
	ldr r1, [r4]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _0804AC68
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
	ldr r0, [r4]
	adds r0, 0x80
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AC58: .4byte gUnknown_03004824
_0804AC5C: .4byte gUnknown_0820C330
_0804AC60: .4byte gTradePartyBoxTilemap
_0804AC64: .4byte gUnknown_0820C14C
_0804AC68: .4byte 0x06010000
	thumb_func_end sub_804A840

	thumb_func_start sub_804A938
sub_804A938: @ 804AC6C
	movs r1, 0x1
	strb r1, [r0, 0x10]
	bx lr
	thumb_func_end sub_804A938

	thumb_func_start sub_804A940
sub_804A940: @ 804AC74
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _0804AC90
	adds r0, r4, 0
	adds r0, 0x12
	ldr r1, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	movs r0, 0
	strb r0, [r4, 0x10]
_0804AC90:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804A940

	thumb_func_start sub_804A964
sub_804A964: @ 804AC98
	movs r2, 0
	strb r2, [r0, 0x10]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end sub_804A964

	thumb_func_start sub_804A96C
sub_804A96C: @ 804ACA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	mov r10, r3
	ldr r0, [sp, 0x20]
	ldr r3, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r4, 16
	lsrs r7, r4, 16
	movs r2, 0
	cmp r2, r12
	bge _0804AD10
	movs r0, 0x12
	add r0, r8
	mov r9, r0
	lsls r0, r6, 5
	adds r0, r1
	mov r8, r0
_0804ACDC:
	movs r4, 0
	adds r6, r2, 0x1
	cmp r4, r5
	bge _0804AD0A
	lsls r1, r2, 5
	add r1, r8
	adds r0, r5, 0
	muls r0, r2
	lsls r0, 1
	mov r2, r10
	adds r3, r0, r2
	lsls r1, 1
	mov r0, r9
	adds r2, r1, r0
_0804ACF8:
	ldrh r1, [r3]
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	adds r4, 0x1
	cmp r4, r5
	blt _0804ACF8
_0804AD0A:
	adds r2, r6, 0
	cmp r2, r12
	blt _0804ACDC
_0804AD10:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
_0804AD20:
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r0, [sp, 0x1C]
	thumb_func_end sub_804A96C

	thumb_func_start de_sub_804AD28
de_sub_804AD28: @ 804AD28
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	adds r0, r6, 0
	bl sub_804A96C
	movs r0, 0x1
	strb r0, [r6, 0x10]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end de_sub_804AD28

	thumb_func_start sub_804A9F4
sub_804A9F4: @ 804AD58
	push {lr}
	bl MenuZeroFillScreen
	pop {r0}
	bx r0
	thumb_func_end sub_804A9F4

	thumb_func_start sub_804AA00
sub_804AA00: @ 804AD64
	push {lr}
	bl MenuZeroFillScreen
	pop {r0}
	bx r0
	thumb_func_end sub_804AA00

	thumb_func_start sub_804AA0C
sub_804AA0C: @ 804AD70
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0804ADE0
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0x4
	ldr r2, _0804ADE4
	lsrs r4, 22
	adds r1, r4, r2
	ldrb r6, [r1]
	adds r1, r2, 0x1
	adds r1, r4, r1
	ldrb r5, [r1]
	adds r1, r2, 0x2
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r2, 0x3
	adds r2, r4, r2
	ldrb r1, [r2]
	str r1, [sp]
	adds r1, r6, 0
	adds r2, r5, 0
	bl DrawTextWindow
	mov r1, r8
	ldr r3, [r1]
	adds r0, r3, 0x4
	ldr r1, _0804ADE8
	adds r4, r1
	ldr r1, [r4]
	adds r3, 0x7A
	movs r4, 0xC0
	lsls r4, 1
	adds r2, r4, 0
	ldrb r3, [r3]
	adds r2, r3
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	adds r3, r6, 0
	bl sub_8003460
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804ADE0: .4byte gUnknown_03004824
_0804ADE4: .4byte gTradeMessageWindowRects
_0804ADE8: .4byte gUnknown_0820C2F0
	thumb_func_end sub_804AA0C

	thumb_func_start sub_804AA88
sub_804AA88: @ 804ADEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r3, 0
	ldr r5, _0804AE34
	ldr r0, _0804AE38
	mov r8, r0
	movs r4, 0
	ldr r2, _0804AE3C
	mov r12, r2
	movs r7, 0x8E
	lsls r7, 4
	movs r6, 0xFF
_0804AE06:
	ldr r0, [r5]
	lsls r2, r3, 3
	adds r0, r2
	add r0, r8
	strb r4, [r0]
	ldr r1, [r5]
	adds r1, r2
	mov r2, r12
	adds r0, r1, r2
	strh r4, [r0]
	adds r1, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x3
	ble _0804AE06
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE34: .4byte gUnknown_03004824
_0804AE38: .4byte 0x000008dc
_0804AE3C: .4byte 0x000008de
	thumb_func_end sub_804AA88

	thumb_func_start sub_804AADC
sub_804AADC: @ 804AE40
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	movs r3, 0
	ldr r4, _0804AE7C
	mov r12, r4
	ldr r7, _0804AE80
_0804AE52:
	mov r1, r12
	ldr r0, [r1]
	lsls r1, r3, 3
	adds r2, r0, r1
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804AE88
	ldr r3, _0804AE84
	adds r0, r2, r3
	strh r5, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strb r6, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r1, _0804AE80
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0804AE8E
	.align 2, 0
_0804AE7C: .4byte gUnknown_03004824
_0804AE80: .4byte 0x000008dc
_0804AE84: .4byte 0x000008de
_0804AE88:
	adds r3, 0x1
	cmp r3, 0x3
	ble _0804AE52
_0804AE8E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804AADC

	thumb_func_start sub_804AB30
sub_804AB30: @ 804AE94
	push {r4,r5,lr}
	movs r4, 0
	ldr r3, _0804AEBC
_0804AE9A:
	ldr r0, [r3]
	lsls r1, r4, 3
	adds r2, r0, r1
	ldr r5, _0804AEC0
	adds r0, r2, r5
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _0804AF46
	ldr r0, _0804AEC4
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0804AEC8
	subs r0, 0x1
	strh r0, [r1]
	b _0804AF46
	.align 2, 0
_0804AEBC: .4byte gUnknown_03004824
_0804AEC0: .4byte 0x000008dc
_0804AEC4: .4byte 0x000008de
_0804AEC8:
	movs r1, 0x8E
	lsls r1, 4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0804AF36
	lsls r0, 2
	ldr r1, _0804AEE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AEE0: .4byte _0804AEE4
	.align 2, 0
_0804AEE4:
	.4byte _0804AEFC
	.4byte _0804AF18
	.4byte _0804AF20
	.4byte _0804AF28
	.4byte _0804AF28
	.4byte _0804AF30
_0804AEFC:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0804AF14
	ldr r1, [r1]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	b _0804AF36
	.align 2, 0
_0804AF14: .4byte gUnknown_03004824
_0804AF18:
	movs r0, 0
	bl sub_804AA0C
	b _0804AF36
_0804AF20:
	movs r0, 0x2
	bl sub_804AA0C
	b _0804AF36
_0804AF28:
	movs r0, 0x3
	bl sub_804AA0C
	b _0804AF36
_0804AF30:
	movs r0, 0x3
	bl sub_804AA0C
_0804AF36:
	ldr r0, _0804AF54
	ldr r1, [r0]
	adds r1, r5
	ldr r2, _0804AF58
	adds r1, r2
	movs r2, 0
	strb r2, [r1]
	adds r3, r0, 0
_0804AF46:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804AE9A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF54: .4byte gUnknown_03004824
_0804AF58: .4byte 0x000008dc
	thumb_func_end sub_804AB30

	thumb_func_start sub_804ABF8
sub_804ABF8: @ 804AF5C
	push {r4,lr}
	ldr r0, _0804AF78
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r1, [r1]
	subs r1, 0x8
	adds r4, r0, 0
	cmp r1, 0x8
	bhi _0804B014
	lsls r0, r1, 2
	ldr r1, _0804AF7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AF78: .4byte gUnknown_03004824
_0804AF7C: .4byte _0804AF80
	.align 2, 0
_0804AF80:
	.4byte _0804AFA4
	.4byte _0804B014
	.4byte _0804B014
	.4byte _0804B014
	.4byte _0804B014
	.4byte _0804AFC4
	.4byte _0804AFD8
	.4byte _0804AFEC
	.4byte _0804AFFE
_0804AFA4:
	ldr r0, [r4]
	adds r0, 0xB4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0804AFC0
	adds r0, r1
	bl LoadSpriteSheet
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x7E
	strh r0, [r2]
	b _0804B026
	.align 2, 0
_0804AFC0: .4byte gUnknown_0820C07C
_0804AFC4:
	ldr r0, _0804AFD0
	bl LoadSpritePalette
	ldr r0, _0804AFD4
	ldr r1, [r0]
	b _0804B026
	.align 2, 0
_0804AFD0: .4byte gSpritePalette_TradeScreenText
_0804AFD4: .4byte gUnknown_03004824
_0804AFD8:
	ldr r0, _0804AFE4
	bl LoadSpritePalette
	ldr r0, _0804AFE8
	ldr r1, [r0]
	b _0804B026
	.align 2, 0
_0804AFE4: .4byte gUnknown_0820C12C
_0804AFE8: .4byte gUnknown_03004824
_0804AFEC:
	ldr r0, _0804B00C
	bl LoadSpriteSheet
	ldr r0, _0804B010
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804AFFE:
	ldr r0, _0804B010
	ldr r0, [r0]
	adds r0, 0xB4
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0804B030
	.align 2, 0
_0804B00C: .4byte gUnknown_0820C124
_0804B010: .4byte gUnknown_03004824
_0804B014:
	ldr r0, [r4]
	adds r0, 0xB4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0804B038
	adds r0, r1
	bl LoadSpriteSheet
	ldr r1, [r4]
_0804B026:
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_0804B030:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804B038: .4byte gUnknown_0820C07C
	thumb_func_end sub_804ABF8

	thumb_func_start sub_804ACD8
sub_804ACD8: @ 804B03C
	push {r4,lr}
	adds r4, r0, 0
	lsls r3, r2, 24
	lsrs r3, 24
	ldr r0, _0804B054
	adds r2, r4, 0
	bl sub_804AFB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B054: .4byte gWindowConfig_81E725C
	thumb_func_end sub_804ACD8

	thumb_func_start sub_804ACF4
sub_804ACF4: @ 804B058
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	beq _0804B070
	cmp r0, 0x1
	beq _0804B104
	b _0804B190
_0804B070:
	movs r7, 0
	ldr r1, _0804B0B0
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804B080
	b _0804B190
_0804B080:
	adds r6, r1, 0
	movs r5, 0
	mov r9, r5
_0804B086:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804B0B4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804B0B8
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804B0E8
	.align 2, 0
_0804B0B0: .4byte gUnknown_03004824
_0804B0B4: .4byte gPlayerParty
_0804B0B8:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804B0D6
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804B0E8
_0804B0D6:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804B0E8:
	strb r1, [r0]
	ldr r0, _0804B100
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804B086
	b _0804B190
	.align 2, 0
_0804B100: .4byte gUnknown_03004824
_0804B104:
	movs r7, 0
	ldr r1, _0804B144
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804B190
	adds r6, r1, 0
	movs r5, 0x6
	movs r2, 0
	mov r9, r2
_0804B11A:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804B148
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804B14C
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804B17C
	.align 2, 0
_0804B144: .4byte gUnknown_03004824
_0804B148: .4byte gEnemyParty
_0804B14C:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804B16A
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804B17C
_0804B16A:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804B17C:
	strb r1, [r0]
	ldr r0, _0804B19C
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804B11A
_0804B190:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B19C: .4byte gUnknown_03004824
	thumb_func_end sub_804ACF4

	thumb_func_start sub_804AE3C
sub_804AE3C: @ 804B1A0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0804B1B0
	cmp r0, 0x1
	beq _0804B210
	b _0804B264
_0804B1B0:
	movs r6, 0
	ldr r1, _0804B208
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804B264
	adds r7, r1, 0
_0804B1C0:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804B20C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, 0x69
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804B1C0
	b _0804B264
	.align 2, 0
_0804B208: .4byte gUnknown_03004824
_0804B20C: .4byte gPlayerParty
_0804B210:
	movs r6, 0
	ldr r1, _0804B26C
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804B264
	adds r7, r1, 0
_0804B220:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804B270
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, 0x6F
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804B220
_0804B264:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B26C: .4byte gUnknown_03004824
_0804B270: .4byte gEnemyParty
	thumb_func_end sub_804AE3C

	thumb_func_start sub_804AF10
sub_804AF10: @ 804B274
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
_0804B27C:
	movs r4, 0
	ldr r2, _0804B2E0
	ldr r0, [r2]
	adds r0, 0x42
	adds r0, r5
	adds r1, r5, 0x1
	mov r8, r1
	ldrb r0, [r0]
	cmp r4, r0
	bge _0804B2CE
	adds r6, r2, 0
	lsls r0, r5, 1
	adds r0, r5
	lsls r7, r0, 1
_0804B298:
	ldr r2, [r6]
	adds r3, r4, r7
	adds r0, r2, 0
	adds r0, 0x34
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804B2E4
	adds r0, r1
	adds r2, 0x69
	adds r2, r3
	ldrb r2, [r2]
	movs r1, 0x4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_809D824
	adds r4, 0x1
	ldr r0, [r6]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r4, r0
	blt _0804B298
_0804B2CE:
	mov r5, r8
	cmp r5, 0x1
	ble _0804B27C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B2E0: .4byte gUnknown_03004824
_0804B2E4: .4byte gSprites
	thumb_func_end sub_804AF10

	thumb_func_start sub_804AF84
sub_804AF84: @ 804B2E8
	push {r4,lr}
	movs r2, 0
	ldr r4, _0804B314
	ldr r3, _0804B318
_0804B2F0:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804B306
	ldr r0, [r3]
	adds r0, 0xB5
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804B306
	strb r0, [r1]
_0804B306:
	adds r2, 0x1
	cmp r2, 0xA
	ble _0804B2F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B314: .4byte 0x02028844
_0804B318: .4byte gUnknown_03004824
	thumb_func_end sub_804AF84

	thumb_func_start sub_804AFB8
sub_804AFB8: @ 804B31C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	mov r10, r2
	lsls r3, 24
	lsrs r6, r3, 24
	adds r0, r6, 0x3
	lsrs r6, r0, 2
	ldr r7, _0804B3B8
	mov r0, sp
	movs r5, 0
	strh r5, [r0]
	lsls r4, r6, 6
	movs r0, 0x80
	lsls r0, 17
	orrs r4, r0
	mov r0, sp
	adds r1, r7, 0
	adds r2, r4, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r5, [r0]
	mov r2, r9
	ldrb r1, [r2, 0xD]
	lsls r1, 5
	adds r1, r7
	adds r2, r4, 0
	bl CpuSet
	mov r0, r9
	adds r1, r7, 0
	mov r2, r10
	bl sub_8004E3C
	movs r4, 0
	cmp r4, r6
	bcs _0804B3A6
_0804B374:
	lsls r0, r4, 7
	adds r0, r7, r0
	lsls r1, r4, 8
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	lsls r0, r4, 2
	mov r1, r9
	ldrb r1, [r1, 0xD]
	adds r0, r1
	lsls r0, 5
	adds r0, r7, r0
	lsls r1, r4, 3
	adds r1, 0x4
	lsls r1, 5
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0804B374
_0804B3A6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B3B8: .4byte gTileBuffer
	thumb_func_end sub_804AFB8

	thumb_func_start sub_804B058
sub_804B058: @ 804B3BC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0804B3D8
	movs r0, 0x17
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B3D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B058

	thumb_func_start sub_804B07C
sub_804B07C: @ 804B3E0
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	bne _0804B416
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _0804B3FC
	strh r1, [r2, 0x2E]
_0804B3FC:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldr r1, _0804B41C
	adds r0, r1
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	lsls r1, 4
	adds r1, 0x4
	movs r2, 0x2
	bl LoadPalette
_0804B416:
	pop {r0}
	bx r0
	.align 2, 0
_0804B41C: .4byte gTradeGlow2PaletteAnimTable
	thumb_func_end sub_804B07C

	thumb_func_start sub_804B0BC
sub_804B0BC: @ 804B420
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B43E
	adds r0, r2, 0
	bl DestroySprite
_0804B43E:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0BC

	thumb_func_start sub_804B0E0
sub_804B0E0: @ 804B444
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	subs r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B462
	adds r0, r2, 0
	bl DestroySprite
_0804B462:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0E0

	thumb_func_start sub_804B104
sub_804B104: @ 804B468
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _0804B484
	movs r0, 0xCC
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B484:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B104

	thumb_func_start sub_804B128
sub_804B128: @ 804B48C
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r0, _0804B518
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0x82
	lsls r0, 1
	add r0, r12
	ldrh r1, [r0]
	lsls r1, 8
	movs r0, 0x83
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	lsls r2, 8
	movs r0, 0x86
	lsls r0, 1
	add r0, r12
	movs r4, 0
	ldrsh r3, [r0, r4]
	movs r0, 0x87
	lsls r0, 1
	add r0, r12
	movs r5, 0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r4, 0x8C
	lsls r4, 1
	add r4, r12
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x8]
	movs r0, 0x8E
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	bl sub_8040F34
	ldr r1, _0804B51C
	add r0, sp, 0x10
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x4]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x6]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [sp, 0x18]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	str r0, [r1]
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B518: .4byte gUnknown_03004828
_0804B51C: .4byte 0x04000020
	thumb_func_end sub_804B128

	thumb_func_start sub_804B1BC
sub_804B1BC: @ 804B520
	push {lr}
	ldr r1, _0804B560
	ldr r0, _0804B564
	ldr r2, [r0]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 19
	ldrh r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0804B56C
	ldr r1, _0804B568
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	b _0804B570
	.align 2, 0
_0804B560: .4byte 0x04000016
_0804B564: .4byte gUnknown_03004828
_0804B568: .4byte 0x0400001a
_0804B56C:
	bl sub_804B128
_0804B570:
	pop {r0}
	bx r0
	thumb_func_end sub_804B1BC

	thumb_func_start sub_804B210
sub_804B210: @ 804B574
	push {lr}
	bl sub_804B1BC
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804B210

	thumb_func_start sub_804B228
sub_804B228: @ 804B58C
	push {r4,lr}
	ldr r4, _0804B5AC
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xB4
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	adds r1, 0xB2
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, 0xB3
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B5AC: .4byte gUnknown_03004828
	thumb_func_end sub_804B228

	thumb_func_start sub_804B24C
sub_804B24C: @ 804B5B0
	push {r4,r5,lr}
	ldr r1, _0804B5D4
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0xB2
	adds r3, r2, 0
	adds r3, 0xB3
	ldrb r0, [r0]
	adds r5, r1, 0
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804B5D8
	adds r1, r2, 0
	adds r1, 0xB4
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804B5DE
	.align 2, 0
_0804B5D4: .4byte gUnknown_03004828
_0804B5D8:
	adds r1, r2, 0
	adds r1, 0xB4
	movs r0, 0
_0804B5DE:
	strh r0, [r1]
	adds r4, r5, 0
	ldr r3, [r4]
	adds r2, r3, 0
	adds r2, 0xB4
	ldrh r0, [r2]
	cmp r0, 0xB4
	bls _0804B600
	movs r1, 0
	movs r0, 0
	strh r0, [r2]
	adds r0, r3, 0
	adds r0, 0xB3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB2
	strb r1, [r0]
_0804B600:
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0xB2
	ldrb r1, [r1]
	adds r0, 0xB3
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_804B24C

	thumb_func_start sub_804B2B0
sub_804B2B0: @ 804B614
	push {lr}
	ldr r0, _0804B624
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804B628
	movs r0, 0
	b _0804B630
	.align 2, 0
_0804B624: .4byte gReceivedRemoteLinkPlayers
_0804B628:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
_0804B630:
	pop {r1}
	bx r1
	thumb_func_end sub_804B2B0

	thumb_func_start sub_804B2D0
sub_804B2D0: @ 804B634
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	mov r10, r4
	cmp r7, 0
	bne _0804B660
	ldr r0, _0804B688
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0804B68C
	adds r1, r0
	mov r10, r1
	movs r4, 0x1
_0804B660:
	cmp r7, 0x1
	bne _0804B67E
	ldr r0, _0804B688
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804B690
	adds r1, r0
	mov r10, r1
	movs r4, 0x3
_0804B67E:
	cmp r5, 0
	beq _0804B694
	cmp r5, 0x1
	beq _0804B708
	b _0804B75E
	.align 2, 0
_0804B688: .4byte gUnknown_020297D8
_0804B68C: .4byte gPlayerParty
_0804B690: .4byte gEnemyParty
_0804B694:
	mov r0, r10
	movs r1, 0x41
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r10
	movs r1, 0
	bl GetMonData
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _0804B6F4
	adds r0, r1
	ldr r1, _0804B6F8
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _0804B6FC
	ldr r6, _0804B700
	lsls r7, 1
	mov r8, r7
	mov r4, r8
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r9
	str r4, [sp, 0x8]
	bl sub_800D334
	mov r0, r10
	bl sub_8040990
	bl LoadCompressedObjectPalette
	ldr r0, _0804B704
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	add r0, r8
	strh r5, [r0]
	b _0804B75E
	.align 2, 0
_0804B6F4: .4byte gMonFrontPicTable
_0804B6F8: .4byte gMonFrontPicCoords
_0804B6FC: .4byte 0x02000000
_0804B700: .4byte gUnknown_081FAF4C
_0804B704: .4byte gUnknown_03004828
_0804B708:
	mov r0, r10
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0804B770
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0x6
	bl CreateSprite
	ldr r4, _0804B774
	ldr r1, [r4]
	adds r1, 0xB8
	adds r1, r7
	strb r0, [r1]
	ldr r3, _0804B778
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _0804B77C
	str r1, [r0]
_0804B75E:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B770: .4byte gUnknown_02024E8C
_0804B774: .4byte gUnknown_03004828
_0804B778: .4byte gSprites
_0804B77C: .4byte SpriteCallbackDummy
	thumb_func_end sub_804B2D0

	thumb_func_start sub_804B41C
sub_804B41C: @ 804B780
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0804B7A0
	ldr r2, _0804B7A4
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B794
	b _0804BAD2
_0804B794:
	lsls r0, 2
	ldr r1, _0804B7A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B7A0: .4byte gMain
_0804B7A4: .4byte 0x0000043c
_0804B7A8: .4byte _0804B7AC
	.align 2, 0
_0804B7AC:
	.4byte _0804B7E0
	.4byte _0804B910
	.4byte _0804B938
	.4byte _0804B960
	.4byte _0804B9AC
	.4byte _0804B9DC
	.4byte _0804BA0C
	.4byte _0804BA16
	.4byte _0804BA30
	.4byte _0804BA48
	.4byte _0804BA80
	.4byte _0804BA8A
	.4byte _0804BAC0
_0804B7E0:
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetTasks
	bl CloseLink
	ldr r6, _0804B8D4
	ldr r5, _0804B8D8
	str r5, [r6]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B8DC
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B8E0
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r6]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r6]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B8E4
	ldr r4, _0804B8E8
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804B8EC
	ldr r0, _0804B8F0
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _0804B8F4
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804B8F8
	ldr r1, _0804B8FC
	adds r5, r1
	movs r2, 0x80
	lsls r2, 4
	adds r1, r5, 0
	bl CpuSet
	ldr r1, _0804B900
	ldr r0, _0804B904
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804B908
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804B90C
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xB6
	movs r2, 0
	strh r2, [r0]
	adds r0, 0xE
	strh r2, [r0]
	movs r4, 0x8F
	lsls r4, 1
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, [r6]
	movs r1, 0x82
	lsls r1, 1
	adds r0, r3, r1
	movs r1, 0x40
	strh r1, [r0]
	subs r4, 0x18
	adds r0, r3, r4
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x4
	adds r1, r3, r4
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r3, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	b _0804BAD2
	.align 2, 0
_0804B8D4: .4byte gUnknown_03004828
_0804B8D8: .4byte 0x0201f000
_0804B8DC: .4byte sub_804B210
_0804B8E0: .4byte gWindowConfig_81E6F84
_0804B8E4: .4byte gLinkType
_0804B8E8: .4byte 0x00001144
_0804B8EC: .4byte gMain
_0804B8F0: .4byte 0x0000043c
_0804B8F4: .4byte gUnknown_08D00000
_0804B8F8: .4byte gUnknown_08D00524
_0804B8FC: .4byte 0xfffe1000
_0804B900: .4byte 0x06002800
_0804B904: .4byte 0x040000d4
_0804B908: .4byte 0x80000280
_0804B90C: .4byte gUnknown_08D004E0
_0804B910:
	bl OpenLink
	ldr r1, _0804B92C
	ldr r2, _0804B930
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _0804B934
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804BAD2
	.align 2, 0
_0804B92C: .4byte gMain
_0804B930: .4byte 0x0000043c
_0804B934: .4byte gUnknown_03004828
_0804B938:
	ldr r0, _0804B958
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bhi _0804B94C
	b _0804BAD2
_0804B94C:
	movs r0, 0
	str r0, [r1]
	ldr r4, _0804B95C
	adds r1, r2, r4
	b _0804BAB0
	.align 2, 0
_0804B958: .4byte gUnknown_03004828
_0804B95C: .4byte 0x0000043c
_0804B960:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _0804B96C
	b _0804BAAA
_0804B96C:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _0804B980
	b _0804BAD2
_0804B980:
	ldr r0, _0804B9A0
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	bhi _0804B992
	b _0804BAD2
_0804B992:
	bl sub_8007F4C
	ldr r1, _0804B9A4
	ldr r0, _0804B9A8
	adds r1, r0
	b _0804BAB0
	.align 2, 0
_0804B9A0: .4byte gUnknown_03004828
_0804B9A4: .4byte gMain
_0804B9A8: .4byte 0x0000043c
_0804B9AC:
	bl sub_804B24C
	ldr r0, _0804B9D0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804B9BA
	b _0804BAD2
_0804B9BA:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804B9C8
	b _0804BAD2
_0804B9C8:
	ldr r1, _0804B9D4
	ldr r4, _0804B9D8
	adds r1, r4
	b _0804BAB0
	.align 2, 0
_0804B9D0: .4byte gReceivedRemoteLinkPlayers
_0804B9D4: .4byte gMain
_0804B9D8: .4byte 0x0000043c
_0804B9DC:
	ldr r2, _0804BA00
	ldr r0, [r2]
	adds r0, 0x9C
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x9D
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xBD
	strb r1, [r0]
	movs r0, 0
	bl sub_804B2D0
	ldr r1, _0804BA04
	ldr r0, _0804BA08
	adds r1, r0
	b _0804BAB0
	.align 2, 0
_0804BA00: .4byte gUnknown_03004828
_0804BA04: .4byte gMain
_0804BA08: .4byte 0x0000043c
_0804BA0C:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	b _0804BAAA
_0804BA16:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804BA28
	ldr r4, _0804BA2C
	adds r1, r4
	b _0804BAB0
	.align 2, 0
_0804BA28: .4byte gMain
_0804BA2C: .4byte 0x0000043c
_0804BA30:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804BA40
	ldr r0, _0804BA44
	adds r1, r0
	b _0804BAB0
	.align 2, 0
_0804BA40: .4byte gMain
_0804BA44: .4byte 0x0000043c
_0804BA48:
	bl sub_804C164
	ldr r0, _0804BA68
	bl LoadSpriteSheet
	ldr r0, _0804BA6C
	bl LoadSpritePalette
	ldr r1, _0804BA70
	ldr r2, _0804BA74
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804BA78
	ldr r4, _0804BA7C
	adds r1, r4
	b _0804BAB0
	.align 2, 0
_0804BA68: .4byte gUnknown_0821594C
_0804BA6C: .4byte gUnknown_08215954
_0804BA70: .4byte 0x0400000a
_0804BA74: .4byte 0x00000502
_0804BA78: .4byte gMain
_0804BA7C: .4byte 0x0000043c
_0804BA80:
	ldr r0, _0804BAB8
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804BA8A:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804BAAA:
	ldr r1, _0804BABC
	ldr r2, _0804BAB8
	adds r1, r2
_0804BAB0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804BAD2
	.align 2, 0
_0804BAB8: .4byte 0x0000043c
_0804BABC: .4byte gMain
_0804BAC0:
	ldr r0, _0804BAEC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804BAD2
	ldr r0, _0804BAF0
	bl SetMainCallback2
_0804BAD2:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BAEC: .4byte gPaletteFade
_0804BAF0: .4byte sub_804DB84
	thumb_func_end sub_804B41C

	thumb_func_start sub_804B790
sub_804B790: @ 804BAF4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r1, _0804BB18
	ldr r2, _0804BB1C
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804BB0C
	b _0804BD56
_0804BB0C:
	lsls r0, 2
	ldr r1, _0804BB20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BB18: .4byte gMain
_0804BB1C: .4byte 0x0000043c
_0804BB20: .4byte _0804BB24
	.align 2, 0
_0804BB24:
	.4byte _0804BB58
	.4byte _0804BD56
	.4byte _0804BD56
	.4byte _0804BD56
	.4byte _0804BD56
	.4byte _0804BC78
	.4byte _0804BC90
	.4byte _0804BCA8
	.4byte _0804BCB2
	.4byte _0804BCCC
	.4byte _0804BD04
	.4byte _0804BD0E
	.4byte _0804BD44
_0804BB58:
	ldr r1, _0804BC44
	ldr r0, _0804BC48
	ldrh r0, [r0]
	movs r6, 0
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _0804BC4C
	ldr r1, _0804BC50
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _0804BC54
	movs r1, 0x7
	add r2, sp, 0x4
	bl GetMonData
	adds r4, 0x1C
	adds r0, r4, 0
	add r1, sp, 0x4
	bl StringCopy
	movs r0, 0x80
	lsls r0, 19
	movs r3, 0
	mov r8, r3
	strh r6, [r0]
	bl ResetTasks
	ldr r5, _0804BC58
	ldr r0, _0804BC5C
	str r0, [r5]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804BC60
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804BC64
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804BC68
	ldr r2, _0804BC6C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r5]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r3
	mov r1, r8
	strb r1, [r0]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0xB6
	strh r6, [r0]
	adds r0, 0xE
	strh r6, [r0]
	subs r3, 0x1A
	adds r0, r2, r3
	movs r1, 0x40
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r2, r1
	strh r6, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	strh r6, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r3, 0x4
	adds r1, r2, r3
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r2, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r2, r1
	strh r6, [r0]
	adds r0, r2, 0
	adds r0, 0xC0
	str r6, [r0]
	ldr r0, _0804BC70
	ldr r2, _0804BC74
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804BD56
	.align 2, 0
_0804BC44: .4byte gUnknown_020297D8
_0804BC48: .4byte gSpecialVar_0x8005
_0804BC4C: .4byte 0x03002988
_0804BC50: .4byte gSaveBlock2
_0804BC54: .4byte gEnemyParty
_0804BC58: .4byte gUnknown_03004828
_0804BC5C: .4byte 0x0201f000
_0804BC60: .4byte sub_804B210
_0804BC64: .4byte gWindowConfig_81E717C
_0804BC68: .4byte gLinkType
_0804BC6C: .4byte 0x00001144
_0804BC70: .4byte gMain
_0804BC74: .4byte 0x0000043c
_0804BC78:
	movs r0, 0
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804BC88
	ldr r3, _0804BC8C
	adds r1, r3
	b _0804BD34
	.align 2, 0
_0804BC88: .4byte gMain
_0804BC8C: .4byte 0x0000043c
_0804BC90:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804BCA0
	ldr r0, _0804BCA4
	adds r1, r0
	b _0804BD34
	.align 2, 0
_0804BCA0: .4byte gMain
_0804BCA4: .4byte 0x0000043c
_0804BCA8:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	b _0804BD2E
_0804BCB2:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804BCC4
	ldr r3, _0804BCC8
	adds r1, r3
	b _0804BD34
	.align 2, 0
_0804BCC4: .4byte gMain
_0804BCC8: .4byte 0x0000043c
_0804BCCC:
	bl sub_804C164
	ldr r0, _0804BCEC
	bl LoadSpriteSheet
	ldr r0, _0804BCF0
	bl LoadSpritePalette
	ldr r1, _0804BCF4
	ldr r2, _0804BCF8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804BCFC
	ldr r3, _0804BD00
	adds r1, r3
	b _0804BD34
	.align 2, 0
_0804BCEC: .4byte gUnknown_0821594C
_0804BCF0: .4byte gUnknown_08215954
_0804BCF4: .4byte 0x0400000a
_0804BCF8: .4byte 0x00000502
_0804BCFC: .4byte gMain
_0804BD00: .4byte 0x0000043c
_0804BD04:
	ldr r0, _0804BD3C
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804BD0E:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804BD2E:
	ldr r1, _0804BD40
	ldr r2, _0804BD3C
	adds r1, r2
_0804BD34:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804BD56
	.align 2, 0
_0804BD3C: .4byte 0x0000043c
_0804BD40: .4byte gMain
_0804BD44:
	ldr r0, _0804BD74
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804BD56
	ldr r0, _0804BD78
	bl SetMainCallback2
_0804BD56:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD74: .4byte gPaletteFade
_0804BD78: .4byte sub_804BBCC
	thumb_func_end sub_804B790

	thumb_func_start sub_804BA18
sub_804BA18: @ 804BD7C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804BDC4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804BDBE
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8090D90
_0804BDBE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDC4: .4byte gPlayerParty
	thumb_func_end sub_804BA18

	thumb_func_start sub_804BA64
sub_804BA64: @ 804BDC8
	push {lr}
	bl GetMultiplayerId
	lsls r0, 24
	ldr r2, _0804BDF4
	movs r1, 0x80
	lsls r1, 17
	eors r1, r0
	lsrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2]
	movs r0, 0x80
	lsls r0, 8
	cmp r1, r0
	bne _0804BDF0
	bl sub_80690F0
_0804BDF0:
	pop {r0}
	bx r0
	.align 2, 0
_0804BDF4: .4byte gLinkPlayers
	thumb_func_end sub_804BA64

	thumb_func_start sub_804BA94
sub_804BA94: @ 804BDF8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x64
	mov r1, r9
	muls r1, r5
	ldr r0, _0804BEC4
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r1, r4, 0
	muls r1, r5
	ldr r0, _0804BEC8
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r6, 0xFF
	beq _0804BE4C
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	ldr r1, _0804BECC
	adds r0, r1
	bl sub_80A2B40
_0804BE4C:
	ldr r4, _0804BED0
	ldr r0, [r4]
	adds r0, 0x38
	adds r1, r7, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	ldr r1, [r4]
	adds r1, 0x38
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	movs r1, 0x46
	mov r0, sp
	strb r1, [r0]
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804BE8C
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_0804BE8C:
	mov r0, r8
	cmp r0, 0xFF
	beq _0804BEA2
	lsls r1, r0, 3
	add r1, r8
	lsls r1, 2
	ldr r0, _0804BED4
	adds r1, r0
	adds r0, r7, 0
	bl sub_80A2D88
_0804BEA2:
	mov r0, r9
	bl sub_804BA18
	ldr r0, _0804BED8
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804BEB4
	bl sub_804BA64
_0804BEB4:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEC4: .4byte gPlayerParty
_0804BEC8: .4byte gEnemyParty
_0804BECC: .4byte 0x02028280
_0804BED0: .4byte gUnknown_03004828
_0804BED4: .4byte gUnknown_02029700
_0804BED8: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_804BA94

	thumb_func_start sub_804BB78
sub_804BB78: @ 804BEDC
	push {r4,lr}
	ldr r4, _0804BEF0
	ldr r0, [r4]
	adds r0, 0xBD
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804BEF4
	cmp r0, 0x2
	beq _0804BF1A
	b _0804BF24
	.align 2, 0
_0804BEF0: .4byte gUnknown_03004828
_0804BEF4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804BF1A
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r1, [r4]
	adds r1, 0xBD
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804BF1A:
	ldr r0, _0804BF2C
	ldr r0, [r0]
	adds r0, 0xBD
	movs r1, 0
	strb r1, [r0]
_0804BF24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF2C: .4byte gUnknown_03004828
	thumb_func_end sub_804BB78

	thumb_func_start sub_804BBCC
sub_804BBCC: @ 804BF30
	push {lr}
	bl sub_804C29C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_804BBCC

	thumb_func_start sub_804BBE8
sub_804BBE8: @ 804BF4C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0804BF58
	b _0804C42E
_0804BF58:
	lsls r0, 2
	ldr r1, _0804BF64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BF64: .4byte _0804BF68
	.align 2, 0
_0804BF68:
	.4byte _0804BF88
	.4byte _0804C028
	.4byte _0804C0C0
	.4byte _0804C108
	.4byte _0804C1AC
	.4byte _0804C25C
	.4byte _0804C304
	.4byte _0804C3C4
_0804BF88:
	ldr r0, _0804C004
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804C008
	ldr r4, _0804C00C
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804C010
	ldr r6, _0804C014
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BFA6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BFA6
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C018
	ldr r2, _0804C01C
	ldr r0, _0804C010
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C014
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804C020
	ldr r2, [r0]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	movs r3, 0x8B
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0xB4
	strh r0, [r1]
	movs r1, 0x80
	lsls r1, 19
	movs r4, 0xBA
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804C024
	adds r0, r2, 0
	strh r0, [r1]
	b _0804C42E
	.align 2, 0
_0804C004: .4byte gUnknown_0820C9F8
_0804C008: .4byte gUnknown_0820CA98
_0804C00C: .4byte 0x06004000
_0804C010: .4byte 0x040000d4
_0804C014: .4byte 0x80000800
_0804C018: .4byte gUnknown_0820F798
_0804C01C: .4byte 0x06009000
_0804C020: .4byte gUnknown_03004828
_0804C024: .4byte 0x00005206
_0804C028:
	ldr r0, _0804C0A0
	ldr r2, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0xAE
	lsls r1, 1
	strh r1, [r0]
	ldr r0, _0804C0A4
	strh r1, [r0]
	ldr r1, _0804C0A8
	ldr r2, _0804C0AC
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804C0B0
	ldr r2, _0804C0B4
	movs r3, 0x80
	lsls r3, 5
	adds r1, 0xCA
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r4, [r1, 0x8]
	ldr r4, _0804C0B8
	movs r5, 0xC0
	lsls r5, 19
	movs r6, 0x98
	lsls r6, 5
	adds r7, r0, 0
_0804C074:
	str r4, [r1]
	str r5, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, r3
	adds r5, r3
	subs r6, r3
	cmp r6, r3
	bhi _0804C074
	str r4, [r1]
	str r5, [r1, 0x4]
	lsrs r0, r6, 1
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0804C0BC
	adds r0, r3, 0
	strh r0, [r1]
	b _0804C42E
	.align 2, 0
_0804C0A0: .4byte gUnknown_03004828
_0804C0A4: .4byte 0x04000016
_0804C0A8: .4byte 0x0400000a
_0804C0AC: .4byte 0x00008502
_0804C0B0: .4byte gUnknown_08210798
_0804C0B4: .4byte 0x06002800
_0804C0B8: .4byte gUnknown_0820CA98
_0804C0BC: .4byte 0x00001241
_0804C0C0:
	ldr r0, _0804C0F0
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804C0F4
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804C0F8
	ldr r2, _0804C0FC
	ldr r0, _0804C100
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C104
	b _0804C42A
	.align 2, 0
_0804C0F0: .4byte gUnknown_03004828
_0804C0F4: .4byte 0x00001241
_0804C0F8: .4byte gUnknown_08211798
_0804C0FC: .4byte 0x06002800
_0804C100: .4byte 0x040000d4
_0804C104: .4byte 0x80000400
_0804C108:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x92
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804C188
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r4, 0x2
	adds r1, r3, r4
	strh r0, [r1]
	adds r0, 0xCC
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x8
	adds r1, r3, r4
	ldr r0, _0804C18C
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804C190
	ldr r4, _0804C194
	movs r5, 0xD0
	lsls r5, 5
	ldr r2, _0804C198
	mov r12, r2
	ldr r1, _0804C19C
	ldr r6, _0804C1A0
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C15A:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C15A
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C1A4
	ldr r0, _0804C19C
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804C1A8
	b _0804C42A
	.align 2, 0
_0804C188: .4byte gUnknown_03004828
_0804C18C: .4byte 0x0000ffba
_0804C190: .4byte gUnknown_0820DD98
_0804C194: .4byte 0x06004000
_0804C198: .4byte gUnknown_08211F98
_0804C19C: .4byte 0x040000d4
_0804C1A0: .4byte 0x80000800
_0804C1A4: .4byte 0x06009000
_0804C1A8: .4byte 0x80000080
_0804C1AC:
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804C234
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804C238
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804C23C
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	movs r0, 0x20
	strh r0, [r1]
	adds r0, 0xFA
	adds r1, r3, r0
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804C240
	ldr r4, _0804C244
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804C248
	mov r12, r2
	ldr r1, _0804C24C
	ldr r6, _0804C250
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C208:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C208
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C254
	ldr r0, _0804C24C
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804C258
	b _0804C42A
	.align 2, 0
_0804C234: .4byte 0x00001441
_0804C238: .4byte 0x00001287
_0804C23C: .4byte gUnknown_03004828
_0804C240: .4byte gUnknown_08213738
_0804C244: .4byte 0x06004000
_0804C248: .4byte gUnknown_08215778
_0804C24C: .4byte 0x040000d4
_0804C250: .4byte 0x80000800
_0804C254: .4byte 0x06009000
_0804C258: .4byte 0x80000080
_0804C25C:
	ldr r0, _0804C2DC
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804C2E0
	ldr r4, _0804C2E4
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804C2E8
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804C2EC
	ldr r4, _0804C2F0
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _0804C2F4
	movs r1, 0x70
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	movs r0, 0xE0
	lsls r0, 7
	adds r2, r0, 0
	movs r1, 0xA0
	lsls r1, 2
_0804C2B0:
	ldrh r0, [r4]
	orrs r0, r2
	strh r0, [r4]
	adds r4, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _0804C2B0
	ldr r1, _0804C2F0
	ldr r2, _0804C2F8
	ldr r0, _0804C2FC
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C300
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0804C42E
	.align 2, 0
_0804C2DC: .4byte gUnknown_03004828
_0804C2E0: .4byte 0x0400000a
_0804C2E4: .4byte 0x00000502
_0804C2E8: .4byte gUnknown_08D00000
_0804C2EC: .4byte gUnknown_08D00524
_0804C2F0: .4byte 0x02000000
_0804C2F4: .4byte gUnknown_08D004E0
_0804C2F8: .4byte 0x06002800
_0804C2FC: .4byte 0x040000d4
_0804C300: .4byte 0x80000280
_0804C304:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804C39C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r3, _0804C3A0
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804C3A4
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	adds r0, 0xA4
	strh r0, [r1]
	adds r0, 0x1A
	adds r1, r3, r0
	movs r0, 0x80
	strh r0, [r1]
	subs r4, 0xC
	adds r1, r3, r4
	movs r0, 0x78
	strh r0, [r1]
	adds r0, 0x96
	adds r1, r3, r0
	movs r0, 0x50
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804C3A8
	ldr r4, _0804C3AC
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804C3B0
	mov r12, r2
	ldr r1, _0804C3B4
	ldr r6, _0804C3B8
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C36E:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C36E
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C3BC
	ldr r0, _0804C3B4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804C3C0
	b _0804C42A
	.align 2, 0
_0804C39C: .4byte 0x00001441
_0804C3A0: .4byte 0x00001287
_0804C3A4: .4byte gUnknown_03004828
_0804C3A8: .4byte gUnknown_08213738
_0804C3AC: .4byte 0x06004000
_0804C3B0: .4byte gUnknown_08215778
_0804C3B4: .4byte 0x040000d4
_0804C3B8: .4byte 0x80000800
_0804C3BC: .4byte 0x06009000
_0804C3C0: .4byte 0x80000080
_0804C3C4:
	ldr r0, _0804C434
	ldr r2, [r0]
	movs r4, 0x8A
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x8B
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804C438
	ldr r4, _0804C43C
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804C440
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804C444
	ldr r4, _0804C448
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804C44C
	ldr r6, _0804C450
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C400:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C400
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C454
	ldr r2, _0804C458
	ldr r0, _0804C44C
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C450
_0804C42A:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_0804C42E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C434: .4byte gUnknown_03004828
_0804C438: .4byte 0x0400000c
_0804C43C: .4byte 0x00005206
_0804C440: .4byte gUnknown_0820C9F8
_0804C444: .4byte gUnknown_0820CA98
_0804C448: .4byte 0x06004000
_0804C44C: .4byte 0x040000d4
_0804C450: .4byte 0x80000800
_0804C454: .4byte gUnknown_0820F798
_0804C458: .4byte 0x06009000
	thumb_func_end sub_804BBE8

	thumb_func_start sub_804C0F8
sub_804C0F8: @ 804C45C
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _0804C494
	ldr r0, _0804C48C
	ldr r2, [r0]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804C490
	cmp r1, r0
	bgt _0804C4BE
	adds r0, 0x5
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	b _0804C4B8
	.align 2, 0
_0804C48C: .4byte gUnknown_03004828
_0804C490: .4byte 0x00000109
_0804C494:
	ldr r0, _0804C4C4
	ldr r0, [r0]
	mov r12, r0
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _0804C4BE
	subs r0, r3, 0x1
	strh r0, [r2]
	movs r1, 0x8E
	lsls r1, 1
	add r1, r12
_0804C4B8:
	ldrh r0, [r1]
	adds r0, 0x40
	strh r0, [r1]
_0804C4BE:
	pop {r0}
	bx r0
	.align 2, 0
_0804C4C4: .4byte gUnknown_03004828
	thumb_func_end sub_804C0F8

	thumb_func_start sub_804C164
sub_804C164: @ 804C4C8
	push {lr}
	ldr r0, _0804C4F4
	bl LoadSpriteSheet
	ldr r0, _0804C4F8
	bl LoadSpriteSheet
	ldr r0, _0804C4FC
	bl LoadSpriteSheet
	ldr r0, _0804C500
	bl LoadSpriteSheet
	ldr r0, _0804C504
	bl LoadSpritePalette
	ldr r0, _0804C508
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0804C4F4: .4byte gUnknown_082159A4
_0804C4F8: .4byte gUnknown_082159F4
_0804C4FC: .4byte gUnknown_08215A28
_0804C500: .4byte gUnknown_08215A78
_0804C504: .4byte gUnknown_082159AC
_0804C508: .4byte gUnknown_082159B4
	thumb_func_end sub_804C164

	thumb_func_start sub_804C1A8
sub_804C1A8: @ 804C50C
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0804C580
	ldr r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804C5A0
	bl GetMultiplayerId
	lsls r0, 24
	ldr r3, _0804C584
	movs r2, 0x80
	lsls r2, 17
	eors r2, r0
	lsrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _0804C588
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r5, _0804C58C
	ldrb r0, [r5, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x64
	muls r0, r4
	ldr r1, _0804C590
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C594
	mov r1, sp
	bl StringCopy10
	ldrb r0, [r5]
	muls r0, r4
	ldr r1, _0804C598
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C59C
	mov r1, sp
	bl StringCopy10
	b _0804C5DC
	.align 2, 0
_0804C580: .4byte gUnknown_03004828
_0804C584: .4byte gStringVar1
_0804C588: .4byte 0x03002988
_0804C58C: .4byte gUnknown_020297D8
_0804C590: .4byte gEnemyParty
_0804C594: .4byte gStringVar3
_0804C598: .4byte gPlayerParty
_0804C59C: .4byte gStringVar2
_0804C5A0:
	ldr r0, _0804C5E4
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804C5E8
	adds r4, r0
	ldr r0, _0804C5EC
	adds r1, r4, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r0, _0804C5F0
	adds r1, r4, 0
	bl StringCopy10
	ldr r0, _0804C5F4
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804C5F8
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C5FC
	mov r1, sp
	bl StringCopy10
_0804C5DC:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5E4: .4byte gSpecialVar_0x8004
_0804C5E8: .4byte gIngameTrades
_0804C5EC: .4byte gStringVar1
_0804C5F0: .4byte gStringVar3
_0804C5F4: .4byte gSpecialVar_0x8005
_0804C5F8: .4byte gPlayerParty
_0804C5FC: .4byte gStringVar2
	thumb_func_end sub_804C1A8

	thumb_func_start sub_804C29C
sub_804C29C: @ 804C600
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r1, _0804C624
	ldr r0, [r1]
	adds r0, 0xC4
	ldrh r0, [r0]
	adds r6, r1, 0
	cmp r0, 0xC8
	bls _0804C61A
	bl _0804D8D4
_0804C61A:
	lsls r0, 2
	ldr r1, _0804C628
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C624: .4byte gUnknown_03004828
_0804C628: .4byte _0804C62C
	.align 2, 0
_0804C62C:
	.4byte _0804C950
	.4byte _0804C9D0
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804CA2C
	.4byte _0804CA68
	.4byte _0804CB00
	.4byte _0804D8D4
	.4byte _0804CB88
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804CBAC
	.4byte _0804CBCC
	.4byte _0804CBDE
	.4byte _0804CC00
	.4byte _0804CC58
	.4byte _0804CC90
	.4byte _0804CCDC
	.4byte _0804CD2C
	.4byte _0804CD80
	.4byte _0804CE18
	.4byte _0804CE3C
	.4byte _0804CE88
	.4byte _0804CED4
	.4byte _0804CF30
	.4byte _0804CF90
	.4byte _0804CFA4
	.4byte _0804CFB8
	.4byte _0804CFCC
	.4byte _0804D0F8
	.4byte _0804D1C8
	.4byte _0804D250
	.4byte _0804D2CC
	.4byte _0804D2DC
	.4byte _0804D304
	.4byte _0804D360
	.4byte _0804D38C
	.4byte _0804D3B8
	.4byte _0804D3CE
	.4byte _0804D438
	.4byte _0804D8D4
	.4byte _0804D460
	.4byte _0804D4A0
	.4byte _0804D4E6
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D508
	.4byte _0804D528
	.4byte _0804D536
	.4byte _0804D558
	.4byte _0804D60C
	.4byte _0804D648
	.4byte _0804D678
	.4byte _0804D728
	.4byte _0804D780
	.4byte _0804D7F0
	.4byte _0804D804
	.4byte _0804D80A
	.4byte _0804D830
	.4byte _0804D88C
	.4byte _0804D8B0
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804D8D4
	.4byte _0804CDB8
_0804C950:
	ldr r3, _0804C9C0
	ldr r0, [r6]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r4, [r6]
	adds r2, r4, 0
	adds r2, 0xB8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _0804C9C4
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _0804C9C8
	movs r3, 0x90
	lsls r3, 1
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	adds r1, r4, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, [r6]
	movs r7, 0x92
	lsls r7, 1
	adds r1, r7
	strh r0, [r1]
	ldr r0, _0804C9CC
	bl PlayBGM
	bl _0804D8D4
	.align 2, 0
_0804C9C0: .4byte gSprites
_0804C9C4: .4byte 0x0000ff4c
_0804C9C8: .4byte gMonFrontPicCoords
_0804C9CC: .4byte 0x00000179
_0804C9D0:
	ldr r4, [r6]
	movs r0, 0x8B
	lsls r0, 1
	adds r5, r4, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	ble _0804CA04
	ldr r2, _0804CA00
	adds r0, r4, 0
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x3
	strh r1, [r0, 0x24]
	ldrh r0, [r5]
	subs r0, 0x3
	strh r0, [r5]
	bl _0804D8D4
	.align 2, 0
_0804CA00: .4byte gSprites
_0804CA04:
	ldr r2, _0804CA28
	adds r0, r4, 0
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r5]
	adds r1, r4, 0
	adds r1, 0xC4
	movs r0, 0xA
	strh r0, [r1]
	bl _0804D8D4
	.align 2, 0
_0804CA28: .4byte gSprites
_0804CA2C:
	ldr r5, _0804CA5C
	ldr r1, _0804CA60
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r4, _0804CA64
	ldr r1, [r4]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r5, 0
	movs r3, 0x2
	bl sub_8003460
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xC4
	movs r3, 0
	movs r0, 0xB
	bl _0804D770
	.align 2, 0
_0804CA5C: .4byte gStringVar4
_0804CA60: .4byte gTradeText_WillBeSent
_0804CA64: .4byte gUnknown_03004828
_0804CA68:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x50
	beq _0804CA7C
	bl _0804D8D4
_0804CA7C:
	adds r0, r2, 0
	adds r0, 0xB8
	ldrb r0, [r0]
	ldr r2, _0804CAF0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _0804CAF4
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x20
	bl sub_8047580
	ldr r1, [r6]
	movs r2, 0x81
	lsls r2, 1
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r2, r0, 0
	adds r2, 0xC4
	ldrh r1, [r2]
	adds r1, 0x1
	strh r1, [r2]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804CAF8
	ldr r1, _0804CAFC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
	bl _0804D8D4
	.align 2, 0
_0804CAF0: .4byte gSprites
_0804CAF4: .4byte 0x000fffff
_0804CAF8: .4byte gStringVar4
_0804CAFC: .4byte gTradeText_ByeBye
_0804CB00:
	ldr r7, _0804CB74
	ldr r2, [r6]
	movs r5, 0x81
	lsls r5, 1
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r7, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r1, [r0]
	ldr r0, _0804CB78
	cmp r1, r0
	beq _0804CB24
	bl _0804D8D4
_0804CB24:
	adds r0, r2, 0x4
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804CB36
	bl _0804D8D4
_0804CB36:
	ldr r0, _0804CB7C
	movs r1, 0x78
	movs r2, 0x20
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	ldr r2, _0804CB80
	adds r1, r2
	strb r0, [r1]
	ldr r3, [r6]
	adds r2, r3, r2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0804CB84
	str r1, [r0]
	adds r3, r5
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl DestroySprite
	ldr r1, [r6]
	bl _0804D8A0
	.align 2, 0
_0804CB74: .4byte gSprites
_0804CB78: .4byte SpriteCallbackDummy
_0804CB7C: .4byte gSpriteTemplate_821595C
_0804CB80: .4byte 0x00000103
_0804CB84: .4byte sub_804D738
_0804CB88:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804CBA8
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x14
	strh r1, [r0]
	bl _0804D8D4
	.align 2, 0
_0804CBA8: .4byte gUnknown_03004828
_0804CBAC:
	ldr r0, _0804CBC8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CBBC
	bl _0804D8D4
_0804CBBC:
	movs r0, 0x4
	bl sub_804BBE8
	bl _0804D89C
	.align 2, 0
_0804CBC8: .4byte gPaletteFade
_0804CBCC:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl _0804D898
_0804CBDE:
	ldr r0, _0804CBFC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CBEE
	bl _0804D8D4
_0804CBEE:
	ldr r0, [r6]
	adds r0, 0xC4
	movs r1, 0x17
	strh r1, [r0]
	bl _0804D8D4
	.align 2, 0
_0804CBFC: .4byte gPaletteFade
_0804CC00:
	ldr r4, _0804CC1C
	ldr r0, [r4]
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r0, r3
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bls _0804CC20
	adds r0, r1, 0
	subs r0, 0x34
	strh r0, [r2]
	b _0804CC44
	.align 2, 0
_0804CC1C: .4byte gUnknown_03004828
_0804CC20:
	movs r0, 0x1
	bl sub_804BBE8
	ldr r3, [r4]
	movs r7, 0x8D
	lsls r7, 1
	adds r1, r3, r7
	movs r2, 0
	movs r0, 0x80
	strh r0, [r1]
	adds r1, r3, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xC0
	str r2, [r0]
_0804CC44:
	ldr r0, _0804CC54
	ldr r4, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r4, r1
	bl _0804D4D2
	.align 2, 0
_0804CC54: .4byte gUnknown_03004828
_0804CC58:
	ldr r1, [r6]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bhi _0804CC6A
	bl _0804D8D4
_0804CC6A:
	movs r0, 0x3
	bl sub_804BBE8
	bl sub_804B128
	ldr r0, _0804CC8C
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r1, [r6]
	bl _0804D8A0
	.align 2, 0
_0804CC8C: .4byte gSpriteTemplate_8215A80
_0804CC90:
	ldr r2, _0804CCD0
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _0804CCB0
	bl _0804D8D4
_0804CCB0:
	adds r0, r1, 0
	bl DestroySprite
	ldr r1, _0804CCD4
	movs r3, 0xC8
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r7, _0804CCD8
	adds r0, r7, 0
	strh r0, [r1]
	ldr r1, [r6]
	bl _0804D8A0
	.align 2, 0
_0804CCD0: .4byte gSprites
_0804CCD4: .4byte 0x04000050
_0804CCD8: .4byte 0x0000040c
_0804CCDC:
	ldr r2, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r1, [r0]
	subs r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x9E
	lsls r0, 17
	cmp r1, r0
	bne _0804CCFE
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804CCFE:
	ldr r0, [r6]
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	beq _0804CD12
	bl _0804D8D4
_0804CD12:
	ldr r0, _0804CD28
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBC
	strb r0, [r1]
	bl _0804D8D4
	.align 2, 0
_0804CD28: .4byte gSpriteTemplate_8215A30
_0804CD2C:
	ldr r0, _0804CD70
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	ldr r4, _0804CD74
	ldr r1, [r4]
	adds r1, 0xBA
	strb r0, [r1]
	ldr r0, _0804CD78
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CD7C
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _0804D8A0
	.align 2, 0
_0804CD70: .4byte gSpriteTemplate_82159BC
_0804CD74: .4byte gUnknown_03004828
_0804CD78: .4byte gSpriteTemplate_82159FC
_0804CD7C: .4byte gSprites
_0804CD80:
	ldr r2, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA6
	bne _0804CD9E
	adds r1, r2, 0
	adds r1, 0xC4
	movs r0, 0xC8
	strh r0, [r1]
_0804CD9E:
	movs r0, 0
	bl sub_804C0F8
	movs r1, 0x80
	lsls r1, 19
	ldr r7, _0804CDB4
	adds r0, r7, 0
	strh r0, [r1]
	bl _0804D8D4
	.align 2, 0
_0804CDB4: .4byte 0x00001641
_0804CDB8:
	ldr r4, _0804CE14
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	movs r0, 0
	bl sub_804C0F8
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _0804CE08
	bl _0804D8D4
_0804CE08:
	adds r1, r2, 0
	adds r1, 0xC4
	movs r0, 0x1D
	strh r0, [r1]
	bl _0804D8D4
	.align 2, 0
_0804CE14: .4byte gSprites
_0804CE18:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804CE38
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x1E
	strh r1, [r0]
	bl _0804D8D4
	.align 2, 0
_0804CE38: .4byte gUnknown_03004828
_0804CE3C:
	ldr r0, _0804CE80
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CE4C
	bl _0804D8D4
_0804CE4C:
	ldr r0, [r6]
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804CE84
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	movs r0, 0x2
	bl sub_804BBE8
	ldr r1, [r6]
	bl _0804D8A0
	.align 2, 0
_0804CE80: .4byte gPaletteFade
_0804CE84: .4byte gSprites
_0804CE88:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _0804CECC
	adds r0, r5, 0
	movs r1, 0x6F
	movs r2, 0xAA
	movs r3, 0
	bl CreateSprite
	ldr r4, _0804CED0
	ldr r1, [r4]
	adds r1, 0xBA
	strb r0, [r1]
	movs r2, 0xA
	negs r2, r2
	adds r0, r5, 0
	movs r1, 0x81
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r1, [r4]
	bl _0804D8A0
	.align 2, 0
_0804CECC: .4byte gSpriteTemplate_82159FC
_0804CED0: .4byte gUnknown_03004828
_0804CED4:
	ldr r0, _0804CF24
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804CEF2
	movs r0, 0x2E
	bl PlaySE
	ldr r0, _0804CF28
	ldr r1, [r0]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804CEF2:
	ldr r3, _0804CF2C
	ldr r0, _0804CF28
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	bl _0804D8D4
	.align 2, 0
_0804CF24: .4byte gPaletteFade
_0804CF28: .4byte gUnknown_03004828
_0804CF2C: .4byte gSprites
_0804CF30:
	ldr r5, _0804CF8C
	ldr r4, [r6]
	adds r2, r4, 0
	adds r2, 0xBA
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r6, r4, 0
	adds r6, 0xBB
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	movs r7, 0x26
	ldrsh r1, [r3, r7]
	movs r0, 0x5A
	negs r0, r0
	cmp r1, r0
	ble _0804CF76
	bl _0804D8D4
_0804CF76:
	movs r2, 0x1
	strh r2, [r3, 0x30]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x30]
	adds r1, r4, 0
	bl _0804D8A0
	.align 2, 0
_0804CF8C: .4byte gSprites
_0804CF90:
	ldr r2, _0804CFA0
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _0804D89C
	.align 2, 0
_0804CFA0: .4byte 0x0000ffff
_0804CFA4:
	ldr r2, _0804CFB4
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	bl _0804D89C
	.align 2, 0
_0804CFB4: .4byte 0x0000ffff
_0804CFB8:
	ldr r2, _0804CFC8
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _0804D89C
	.align 2, 0
_0804CFC8: .4byte 0x0000ffff
_0804CFCC:
	ldr r5, _0804D03C
	ldr r0, [r5]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _0804D048
	ldr r4, _0804D040
	ldr r2, [r5]
	adds r2, 0xB8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0804D044
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	b _0804D05E
	.align 2, 0
_0804D03C: .4byte gUnknown_03004828
_0804D040: .4byte gSprites
_0804D044: .4byte gSpriteAffineAnimTable_8215AC0
_0804D048:
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804D0EC
	adds r0, r1
	movs r1, 0
	bl StartSpriteAffineAnim
_0804D05E:
	ldr r5, _0804D0F0
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804D0EC
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3C
	strh r1, [r0, 0x20]
	adds r2, 0xB9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xB4
	strh r1, [r0, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xC0
	strh r1, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0804D0F4
	strh r1, [r0, 0x22]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _0804D8A0
	.align 2, 0
_0804D0EC: .4byte gSprites
_0804D0F0: .4byte gUnknown_03004828
_0804D0F4: .4byte 0x0000ffe0
_0804D0F8:
	ldr r4, _0804D1C0
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	movs r5, 0
	strh r1, [r0, 0x26]
	adds r2, 0xB9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x26]
	adds r0, 0xA3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0804D140
	movs r0, 0x2D
	bl PlaySE
_0804D140:
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r7, 0x26
	ldrsh r1, [r0, r7]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	blt _0804D15E
	b _0804D8D4
_0804D15E:
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r0, r2, 0
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _0804D1C4
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	b _0804D8D4
	.align 2, 0
_0804D1C0: .4byte gSprites
_0804D1C4: .4byte 0x0000ffff
_0804D1C8:
	ldr r4, _0804D24C
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xBA
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	ble _0804D20A
	b _0804D8D4
_0804D20A:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0xBA
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _0804D8D4
	.align 2, 0
_0804D24C: .4byte gSprites
_0804D250:
	ldr r0, _0804D2BC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D25E
	b _0804D8D4
_0804D25E:
	ldr r1, [r6]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	bl sub_804BBE8
	ldr r0, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3
	movs r1, 0xA6
	strh r1, [r0]
	ldr r0, _0804D2C0
	movs r4, 0x14
	negs r4, r4
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBA
	strb r0, [r1]
	ldr r0, _0804D2C4
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804D2C8
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	b _0804D8D4
	.align 2, 0
_0804D2BC: .4byte gPaletteFade
_0804D2C0: .4byte gSpriteTemplate_82159BC
_0804D2C4: .4byte gSpriteTemplate_82159FC
_0804D2C8: .4byte gSprites
_0804D2CC:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	b _0804D898
_0804D2DC:
	movs r1, 0x80
	lsls r1, 19
	ldr r7, _0804D2FC
	adds r0, r7, 0
	strh r0, [r1]
	movs r0, 0x1
	bl sub_804C0F8
	ldr r0, _0804D300
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D2FA
	b _0804D8D4
_0804D2FA:
	b _0804D89C
	.align 2, 0
_0804D2FC: .4byte 0x00001641
_0804D300: .4byte gPaletteFade
_0804D304:
	movs r0, 0x1
	bl sub_804C0F8
	ldr r2, _0804D358
	ldr r0, _0804D35C
	ldr r3, [r0]
	adds r4, r3, 0
	adds r4, 0xBA
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	adds r0, r3, 0
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r7, 0x22
	ldrsh r0, [r0, r7]
	adds r1, r0
	cmp r1, 0x40
	beq _0804D352
	b _0804D8D4
_0804D352:
	adds r1, r3, 0
	b _0804D8A0
	.align 2, 0
_0804D358: .4byte gSprites
_0804D35C: .4byte gUnknown_03004828
_0804D360:
	movs r0, 0x1
	bl sub_804C0F8
	ldr r0, _0804D388
	ldr r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r0, 0x2
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x9E
	lsls r3, 1
	cmp r0, r3
	bgt _0804D384
	b _0804D8D4
_0804D384:
	strh r3, [r2]
	b _0804D8A0
	.align 2, 0
_0804D388: .4byte gUnknown_03004828
_0804D38C:
	ldr r0, [r6]
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804D3B4
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _0804D764
	.align 2, 0
_0804D3B4: .4byte gSprites
_0804D3B8:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	beq _0804D3CA
	b _0804D8D4
_0804D3CA:
	adds r1, 0x4
	b _0804D8A2
_0804D3CE:
	ldr r1, [r6]
	movs r4, 0x88
	lsls r4, 1
	adds r2, r1, r4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xAE
	lsls r3, 1
	cmp r0, r3
	ble _0804D3F2
	strh r3, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804D3F2:
	ldr r0, [r6]
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _0804D414
	ldr r0, _0804D42C
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBC
	strb r0, [r1]
_0804D414:
	ldr r2, _0804D430
	ldr r0, [r6]
	adds r0, 0xBC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0804D434
	str r1, [r0]
	b _0804D8D4
	.align 2, 0
_0804D42C: .4byte gSpriteTemplate_8215A30
_0804D430: .4byte gSprites
_0804D434: .4byte sub_804B0E0
_0804D438:
	ldr r0, _0804D458
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r2, _0804D45C
	ldr r1, [r2]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xC4
	movs r1, 0x32
	strh r1, [r0]
	b _0804D8D4
	.align 2, 0
_0804D458: .4byte gSpriteTemplate_8215A80
_0804D45C: .4byte gUnknown_03004828
_0804D460:
	ldr r2, _0804D49C
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _0804D47E
	b _0804D8D4
_0804D47E:
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x6
	bl sub_804BBE8
	ldr r1, [r6]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x9F
	bl PlaySE
	b _0804D8D4
	.align 2, 0
_0804D49C: .4byte gSprites
_0804D4A0:
	ldr r1, [r6]
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r1, r3
	ldrh r3, [r2]
	ldr r0, _0804D4B8
	cmp r3, r0
	bhi _0804D4BC
	adds r0, r3, 0
	adds r0, 0x34
	strh r0, [r2]
	b _0804D4CA
	.align 2, 0
_0804D4B8: .4byte 0x000003ff
_0804D4BC:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804D4CA:
	ldr r4, [r6]
	movs r7, 0x8D
	lsls r7, 1
	adds r0, r4, r7
_0804D4D2:
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	movs r2, 0x8C
	lsls r2, 1
	adds r1, r4, r2
	strh r0, [r1]
	b _0804D8D4
_0804D4E6:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804D504
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x3C
	strh r1, [r0]
	b _0804D8D4
	.align 2, 0
_0804D504: .4byte gUnknown_03004828
_0804D508:
	ldr r0, _0804D524
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D516
	b _0804D8D4
_0804D516:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0x7
	bl sub_804BBE8
	b _0804D89C
	.align 2, 0
_0804D524: .4byte gPaletteFade
_0804D528:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _0804D898
_0804D536:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xA2
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804D554
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D550
	b _0804D8D4
_0804D550:
	ldr r1, [r6]
	b _0804D8A0
	.align 2, 0
_0804D554: .4byte gPaletteFade
_0804D558:
	ldr r0, _0804D5F4
	movs r2, 0x8
	negs r2, r2
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	ldr r6, _0804D5F8
	ldr r1, [r6]
	ldr r5, _0804D5FC
	adds r1, r5
	movs r7, 0
	mov r8, r7
	strb r0, [r1]
	ldr r4, _0804D600
	ldr r2, [r6]
	adds r2, r5
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x4A
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0804D604
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r2, _0804D608
	movs r1, 0x10
	bl BlendPalettes
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0xC0
	mov r0, r8
	str r0, [r1]
	b _0804D8D4
	.align 2, 0
_0804D5F4: .4byte gSpriteTemplate_821595C
_0804D5F8: .4byte gUnknown_03004828
_0804D5FC: .4byte 0x00000103
_0804D600: .4byte gSprites
_0804D604: .4byte sub_804D80C
_0804D608: .4byte 0x0000ffff
_0804D60C:
	ldr r2, _0804D63C
	ldr r0, [r6]
	ldr r1, _0804D640
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r1, _0804D644
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r6]
	b _0804D8A0
	.align 2, 0
_0804D63C: .4byte gSprites
_0804D640: .4byte 0x00000103
_0804D644: .4byte 0x0000ffff
_0804D648:
	ldr r2, _0804D66C
	ldr r3, [r6]
	ldr r7, _0804D670
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0804D674
	cmp r1, r0
	beq _0804D666
	b _0804D8D4
_0804D666:
	adds r1, r3, 0
	b _0804D8A0
	.align 2, 0
_0804D66C: .4byte gSprites
_0804D670: .4byte 0x00000103
_0804D674: .4byte SpriteCallbackDummy
_0804D678:
	ldr r4, _0804D718
	ldr r0, [r6]
	mov r8, r0
	mov r5, r8
	adds r5, 0xB9
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r2, _0804D71C
	movs r0, 0x91
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	adds r0, 0x3C
	strh r0, [r1, 0x22]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x24]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x26]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _0804D720
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x54
	bl CreatePokeballSprite
	ldr r0, [r6]
	ldr r5, _0804D724
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, [r6]
	b _0804D8A0
	.align 2, 0
_0804D718: .4byte gSprites
_0804D71C: .4byte gMonFrontPicCoords
_0804D720: .4byte 0x000fffff
_0804D724: .4byte 0x00000103
_0804D728:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804D778
	ldr r1, _0804D77C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
_0804D764:
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	movs r3, 0
_0804D770:
	strh r0, [r2]
	adds r1, 0xC0
	str r3, [r1]
	b _0804D8D4
	.align 2, 0
_0804D778: .4byte gStringVar4
_0804D77C: .4byte gTradeText_SentOverPoke
_0804D780:
	ldr r1, [r6]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x4
	bne _0804D794
	ldr r0, _0804D7E4
	bl PlayFanfare
_0804D794:
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xC0
	ldr r0, [r0]
	cmp r0, 0xF0
	beq _0804D7A2
	b _0804D8D4
_0804D7A2:
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r1]
	adds r0, r2, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804D7E8
	ldr r1, _0804D7EC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
	ldr r0, [r6]
	adds r0, 0xC0
	str r5, [r0]
	b _0804D8D4
	.align 2, 0
_0804D7E4: .4byte 0x00000173
_0804D7E8: .4byte gStringVar4
_0804D7EC: .4byte gTradeText_TakeGoodCare
_0804D7F0:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bne _0804D8D4
	adds r1, 0x4
	b _0804D8A2
_0804D804:
	bl sub_804E1DC
	b _0804D89C
_0804D80A:
	ldr r2, [r6]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804D81C
	movs r0, 0x1
	b _0804D8D6
_0804D81C:
	ldr r0, _0804D82C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804D8D4
	adds r1, r2, 0
	b _0804D8A0
	.align 2, 0
_0804D82C: .4byte gMain
_0804D830:
	ldr r0, _0804D874
	ldrb r0, [r0]
	movs r1, 0
	bl sub_804BA94
	ldr r1, _0804D878
	ldr r0, _0804D87C
	str r0, [r1]
	ldr r7, _0804D880
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0804D884
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0804D89C
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _0804D888
	ldr r1, [r1]
	adds r1, 0xB9
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _0804D89C
	.align 2, 0
_0804D874: .4byte gSpecialVar_0x8005
_0804D878: .4byte gUnknown_03005E94
_0804D87C: .4byte sub_804BBCC
_0804D880: .4byte gUnknown_020297D8
_0804D884: .4byte gPlayerParty
_0804D888: .4byte gUnknown_03004828
_0804D88C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_0804D898:
	bl BeginNormalPaletteFade
_0804D89C:
	ldr r0, _0804D8AC
	ldr r1, [r0]
_0804D8A0:
	adds r1, 0xC4
_0804D8A2:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0804D8D4
	.align 2, 0
_0804D8AC: .4byte gUnknown_03004828
_0804D8B0:
	ldr r0, _0804D8E4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804D8D4
	ldr r0, [r6]
	movs r7, 0x92
	lsls r7, 1
	adds r0, r7
	ldrh r0, [r0]
	bl PlayBGM
	ldr r0, _0804D8E8
	bl SetMainCallback2
	bl sub_804D8E4
_0804D8D4:
	movs r0, 0
_0804D8D6:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804D8E4: .4byte gPaletteFade
_0804D8E8: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_804C29C

	thumb_func_start sub_804D588
sub_804D588: @ 804D8EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0804D904
	ldr r2, _0804D908
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0804D90C
	cmp r0, 0x4
	beq _0804D91C
	b _0804D978
	.align 2, 0
_0804D904: .4byte gMain
_0804D908: .4byte 0x0000043c
_0804D90C:
	movs r0, 0x4
	strb r0, [r1]
	ldr r1, _0804D918
	movs r0, 0x1
	b _0804D976
	.align 2, 0
_0804D918: .4byte gUnknown_3001BB4
_0804D91C:
	ldr r0, _0804D958
	ldr r1, _0804D95C
	mov r8, r1
	str r1, [r0]
	ldr r7, _0804D960
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0804D964
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0804D96C
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _0804D968
	ldr r1, [r1]
	adds r1, 0xB9
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _0804D972
	.align 2, 0
_0804D958: .4byte gUnknown_03005E94
_0804D95C: .4byte sub_804DC88
_0804D960: .4byte gUnknown_020297D8
_0804D964: .4byte gPlayerParty
_0804D968: .4byte gUnknown_03004828
_0804D96C:
	mov r0, r8
	bl SetMainCallback2
_0804D972:
	ldr r1, _0804D99C
	movs r0, 0xFF
_0804D976:
	strb r0, [r1]
_0804D978:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _0804D986
	bl RunTasks
_0804D986:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D99C: .4byte gUnknown_020297D8
	thumb_func_end sub_804D588

	thumb_func_start sub_804D63C
sub_804D63C: @ 804D9A0
	push {r4-r6,lr}
	bl sub_804B2B0
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	adds r0, r5, 0
	ands r0, r6
	cmp r0, 0
	beq _0804D9DE
	ldr r4, _0804DA0C
	ldrh r1, [r4]
	ldr r0, _0804DA10
	cmp r1, r0
	bne _0804D9C8
	ldr r0, _0804DA14
	bl SetMainCallback2
_0804D9C8:
	ldrh r1, [r4]
	ldr r0, _0804DA18
	cmp r1, r0
	bne _0804D9D8
	ldr r0, _0804DA1C
	ldr r0, [r0]
	adds r0, 0x9C
	strb r6, [r0]
_0804D9D8:
	movs r0, 0
	bl ResetBlockReceivedFlag
_0804D9DE:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _0804DA06
	ldr r0, _0804DA0C
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0804DA18
	cmp r1, r0
	bne _0804DA00
	ldr r0, _0804DA1C
	ldr r0, [r0]
	adds r0, 0x9D
	movs r1, 0x1
	strb r1, [r0]
_0804DA00:
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_0804DA06:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DA0C: .4byte gBlockRecvBuffer
_0804DA10: .4byte 0x0000dcba
_0804DA14: .4byte sub_804D588
_0804DA18: .4byte 0x0000abcd
_0804DA1C: .4byte gUnknown_03004828
	thumb_func_end sub_804D63C

	thumb_func_start sub_804D6BC
sub_804D6BC: @ 804DA20
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r4, [r5, 0x22]
	adds r4, r0
	strh r4, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	ldrh r2, [r5, 0x38]
	adds r0, r2
	strh r0, [r5, 0x38]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r5, 0x20]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0x4C
	ble _0804DA6E
	movs r0, 0x4C
	strh r0, [r5, 0x22]
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	muls r0, r1
	negs r0, r0
	movs r1, 0x64
	bl __divsi3
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
_0804DA6E:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _0804DA7A
	movs r0, 0
	strh r0, [r5, 0x30]
_0804DA7A:
	ldrh r0, [r5, 0x36]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bne _0804DA92
	movs r0, 0x1
	strh r0, [r5, 0x3C]
	ldr r0, _0804DA98
	str r0, [r5, 0x1C]
_0804DA92:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804DA98: .4byte SpriteCallbackDummy
	thumb_func_end sub_804D6BC

	thumb_func_start sub_804D738
sub_804D738: @ 804DA9C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0804DB04
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x16
	bne _0804DAC4
	movs r0, 0x38
	bl PlaySE
_0804DAC4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bne _0804DAFA
	movs r0, 0x8C
	bl PlaySE
	ldr r0, _0804DB08
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0x1
	negs r1, r1
	ldr r2, _0804DB0C
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0804DAFA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DB04: .4byte gTradeBallVerticalVelocityTable
_0804DB08: .4byte sub_804D7AC
_0804DB0C: .4byte 0x0000ffff
	thumb_func_end sub_804D738

	thumb_func_start sub_804D7AC
sub_804D7AC: @ 804DB10
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	bne _0804DB24
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0804DB24:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0804DB62
	ldr r1, _0804DB68
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	bne _0804DB62
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _0804DB6C
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0xE
	strh r1, [r0]
_0804DB62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DB68: .4byte gTradeBallVerticalVelocityTable
_0804DB6C: .4byte gUnknown_03004828
	thumb_func_end sub_804D7AC

	thumb_func_start sub_804D80C
sub_804D80C: @ 804DB70
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0804DBA0
	ldrh r0, [r4, 0x22]
	adds r0, 0x4
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _0804DBF0
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x16
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl PlaySE
	b _0804DBF0
_0804DBA0:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x42
	bne _0804DBAE
	movs r0, 0x39
	bl PlaySE
_0804DBAE:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5C
	bne _0804DBBC
	movs r0, 0x3A
	bl PlaySE
_0804DBBC:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x6B
	bne _0804DBCA
	movs r0, 0x3B
	bl PlaySE
_0804DBCA:
	ldr r1, _0804DBF8
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6C
	bne _0804DBF0
	ldr r0, _0804DBFC
	str r0, [r4, 0x1C]
_0804DBF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DBF8: .4byte gTradeBallVerticalVelocityTable
_0804DBFC: .4byte SpriteCallbackDummy
	thumb_func_end sub_804D80C

	thumb_func_start sub_804D89C
sub_804D89C: @ 804DC00
	push {r4-r6,lr}
	ldr r0, _0804DC34
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804DC38
	adds r4, r0
	ldr r0, _0804DC3C
	ldrh r1, [r4, 0x38]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _0804DC40
	adds r1, r5
	bl StringCopy
	ldr r0, _0804DC44
	ldrh r1, [r4, 0xC]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldrh r0, [r4, 0x38]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804DC34: .4byte gSpecialVar_0x8004
_0804DC38: .4byte gIngameTrades
_0804DC3C: .4byte gStringVar1
_0804DC40: .4byte gSpeciesNames
_0804DC44: .4byte gStringVar2
	thumb_func_end sub_804D89C

	thumb_func_start sub_804D8E4
sub_804D8E4: @ 804DC48
	push {r4,lr}
	sub sp, 0x20
	ldr r0, _0804DC90
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804DC94
	adds r4, r0
	ldr r0, _0804DC98
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804DC9C
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804DCA0
	mov r1, sp
	bl StringCopy10
	ldr r0, _0804DCA4
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _0804DCA8
	adds r1, r2
	bl StringCopy
	add sp, 0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC90: .4byte gSpecialVar_0x8004
_0804DC94: .4byte gIngameTrades
_0804DC98: .4byte gSpecialVar_0x8005
_0804DC9C: .4byte gPlayerParty
_0804DCA0: .4byte gStringVar1
_0804DCA4: .4byte gStringVar2
_0804DCA8: .4byte gSpeciesNames
	thumb_func_end sub_804D8E4

	thumb_func_start sub_804D948
sub_804D948: @ 804DCAC
	push {r4-r7,lr}
	sub sp, 0x38
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	subs r2, r1
	lsls r2, 2
	ldr r1, _0804DE08
	adds r5, r2, r1
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804DE0C
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	add r4, sp, 0x34
	movs r0, 0xFE
	strb r0, [r4]
	ldr r6, _0804DE10
	ldrh r1, [r5, 0xC]
	movs r3, 0x1
	str r3, [sp]
	ldr r0, [r5, 0x24]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r0, [r5, 0x18]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r3, 0x20
	bl CreateMon
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r6, 0
	movs r1, 0x27
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r6, 0
	movs r1, 0x28
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r6, 0
	movs r1, 0x29
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r6, 0
	movs r1, 0x2A
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r6, 0
	movs r1, 0x2B
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x13
	adds r0, r6, 0
	movs r1, 0x2C
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x2B
	adds r0, r6, 0
	movs r1, 0x7
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x36
	adds r0, r6, 0
	movs r1, 0x31
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x14
	adds r0, r6, 0
	movs r1, 0x2E
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1D
	adds r0, r6, 0
	movs r1, 0x17
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1E
	adds r0, r6, 0
	movs r1, 0x18
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1C
	adds r0, r6, 0
	movs r1, 0x16
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1F
	adds r0, r6, 0
	movs r1, 0x21
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x20
	adds r0, r6, 0
	movs r1, 0x2F
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x37
	adds r0, r6, 0
	movs r1, 0x30
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x23
	adds r2, r4, 0
	bl SetMonData
	mov r4, sp
	adds r4, 0x35
	movs r0, 0
	strb r0, [r4]
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	beq _0804DE24
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0804DE18
	add r0, sp, 0x10
	adds r1, r5, 0
	bl sub_804DAD4
	ldr r0, _0804DE14
	add r1, sp, 0x10
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
	b _0804DE24
	.align 2, 0
_0804DE08: .4byte gIngameTrades
_0804DE0C: .4byte gPlayerParty
_0804DE10: .4byte gEnemyParty
_0804DE14: .4byte gUnknown_02029700
_0804DE18:
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
_0804DE24:
	ldr r0, _0804DE34
	bl CalculateMonStats
	add sp, 0x38
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE34: .4byte gEnemyParty
	thumb_func_end sub_804D948

	thumb_func_start sub_804DAD4
sub_804DAD4: @ 804DE38
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r2, _0804DE94
	adds r0, r6, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r1, r5, 0
	movs r3, 0x8
_0804DE52:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _0804DE52
	adds r4, r5, 0
	adds r4, 0x12
	adds r1, r6, 0
	adds r1, 0x2B
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0
	bl sub_814A518
	ldr r1, [r6, 0x18]
	lsrs r0, r1, 24
	strb r0, [r5, 0x1A]
	lsrs r0, r1, 16
	strb r0, [r5, 0x1B]
	lsrs r0, r1, 8
	strb r0, [r5, 0x1C]
	strb r1, [r5, 0x1D]
	ldrh r0, [r6, 0xC]
	strh r0, [r5, 0x1E]
	ldrh r0, [r6, 0x28]
	strh r0, [r5, 0x20]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE94: .4byte gIngameTradeMail
	thumb_func_end sub_804DAD4

	thumb_func_start sub_804DB2C
sub_804DB2C: @ 804DE98
	push {r4-r6,lr}
	ldr r6, _0804DEC4
	ldrh r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0804DEC8
	adds r0, r4
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804DECC
	ldrh r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	b _0804DECE
	.align 2, 0
_0804DEC4: .4byte gSpecialVar_0x8005
_0804DEC8: .4byte gPlayerParty
_0804DECC:
	movs r0, 0
_0804DECE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_804DB2C

	thumb_func_start sub_804DB68
sub_804DB68: @ 804DED4
	push {lr}
	ldr r0, _0804DEE8
	ldrb r0, [r0]
	ldr r1, _0804DEEC
	ldrb r1, [r1]
	bl sub_804D948
	pop {r0}
	bx r0
	.align 2, 0
_0804DEE8: .4byte gSpecialVar_0x8005
_0804DEEC: .4byte gSpecialVar_0x8004
	thumb_func_end sub_804DB68

	thumb_func_start sub_804DB84
sub_804DB84: @ 804DEF0
	push {r4-r6,lr}
	bl sub_804C29C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0804DF52
	ldr r5, _0804DF70
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804DF74
	adds r0, r4
	bl DestroySprite
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, _0804DF78
	ldrb r4, [r0]
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_804BA94
	ldr r0, [r5]
	adds r2, r0, 0
	adds r2, 0x9E
	ldr r1, _0804DF7C
	strh r1, [r2]
	adds r0, 0xBD
	strb r6, [r0]
	ldr r0, _0804DF80
	bl SetMainCallback2
_0804DF52:
	bl sub_804BB78
	bl sub_804D63C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DF70: .4byte gUnknown_03004828
_0804DF74: .4byte gSprites
_0804DF78: .4byte gUnknown_020297D8
_0804DF7C: .4byte 0x0000abcd
_0804DF80: .4byte sub_804DC18
	thumb_func_end sub_804DB84

	thumb_func_start sub_804DC18
sub_804DC18: @ 804DF84
	push {r4,lr}
	bl sub_804B2B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_804D63C
	cmp r4, 0
	bne _0804DFD0
	ldr r4, _0804DFE8
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x9C
	ldrh r1, [r0]
	ldr r0, _0804DFEC
	cmp r1, r0
	bne _0804DFD0
	adds r1, r2, 0
	adds r1, 0x9E
	ldr r0, _0804DFF0
	strh r0, [r1]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
	adds r0, 0x9C
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x9D
	strb r1, [r0]
_0804DFD0:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DFE8: .4byte gUnknown_03004828
_0804DFEC: .4byte 0x00000101
_0804DFF0: .4byte 0x0000dcba
	thumb_func_end sub_804DC18

	thumb_func_start sub_804DC88
sub_804DC88: @ 804DFF4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _0804E014
	ldr r2, _0804E018
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x65
	bls _0804E008
	b _0804E486
_0804E008:
	lsls r0, 2
	ldr r1, _0804E01C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E014: .4byte gMain
_0804E018: .4byte 0x0000043c
_0804E01C: .4byte _0804E020
	.align 2, 0
_0804E020:
	.4byte _0804E1B8
	.4byte _0804E208
	.4byte _0804E280
	.4byte _0804E486
	.4byte _0804E34C
	.4byte _0804E3E4
	.4byte _0804E40C
	.4byte _0804E428
	.4byte _0804E450
	.4byte _0804E478
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E374
	.4byte _0804E3A0
	.4byte _0804E3B8
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E2C0
	.4byte _0804E2E8
	.4byte _0804E308
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E486
	.4byte _0804E220
	.4byte _0804E260
_0804E1B8:
	ldr r5, _0804E1F4
	ldr r0, _0804E1F8
	str r0, [r5]
	ldr r1, _0804E1FC
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0x1
	strb r1, [r2]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804E200
	ldr r1, _0804E204
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r5]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	b _0804E2AA
	.align 2, 0
_0804E1F4: .4byte gUnknown_03004828
_0804E1F8: .4byte 0x0201f000
_0804E1FC: .4byte 0x0000043c
_0804E200: .4byte gStringVar4
_0804E204: .4byte gOtherText_LinkStandby2
_0804E208:
	bl sub_80084A4
	ldr r0, _0804E218
	ldr r2, _0804E21C
	adds r0, r2
	movs r2, 0
	movs r1, 0x64
	b _0804E35A
	.align 2, 0
_0804E218: .4byte gMain
_0804E21C: .4byte 0x0000043c
_0804E220:
	ldr r0, _0804E254
	ldr r0, [r0]
	adds r3, r0, 0
	adds r3, 0xC0
	ldr r0, [r3]
	adds r0, 0x1
	str r0, [r3]
	cmp r0, 0xB4
	bls _0804E23E
	ldr r1, _0804E258
	adds r0, r2, r1
	movs r2, 0
	movs r1, 0x65
	strb r1, [r0]
	str r2, [r3]
_0804E23E:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804E24A
	b _0804E486
_0804E24A:
	ldr r0, _0804E25C
	ldr r2, _0804E258
	adds r0, r2
	b _0804E272
	.align 2, 0
_0804E254: .4byte gUnknown_03004828
_0804E258: .4byte 0x0000043c
_0804E25C: .4byte gMain
_0804E260:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804E26C
	b _0804E486
_0804E26C:
	ldr r0, _0804E278
	ldr r1, _0804E27C
	adds r0, r1
_0804E272:
	movs r1, 0x2
	strb r1, [r0]
	b _0804E486
	.align 2, 0
_0804E278: .4byte gMain
_0804E27C: .4byte 0x0000043c
_0804E280:
	ldr r0, _0804E2B4
	adds r1, r2, r0
	movs r0, 0x32
	strb r0, [r1]
	ldr r4, _0804E2B8
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _0804E2BC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
_0804E2AA:
	movs r3, 0x2
	bl sub_8003460
	b _0804E486
	.align 2, 0
_0804E2B4: .4byte 0x0000043c
_0804E2B8: .4byte gUnknown_03004828
_0804E2BC: .4byte gSystemText_Saving
_0804E2C0:
	bl SetSecretBase2Field_9_AndHideBG
	movs r0, 0x15
	bl sav12_xor_increment
	bl sub_8125D80
	ldr r1, _0804E2E0
	ldr r2, _0804E2E4
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	b _0804E35C
	.align 2, 0
_0804E2E0: .4byte gMain
_0804E2E4: .4byte 0x0000043c
_0804E2E8:
	ldr r0, _0804E300
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	beq _0804E2FA
	b _0804E486
_0804E2FA:
	ldr r0, _0804E304
	adds r1, r2, r0
	b _0804E466
	.align 2, 0
_0804E300: .4byte gUnknown_03004828
_0804E304: .4byte 0x0000043c
_0804E308:
	bl sub_8125DA8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804E32C
	bl ClearSecretBase2Field_9_2
	ldr r0, _0804E324
	ldr r1, _0804E328
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _0804E486
	.align 2, 0
_0804E324: .4byte gMain
_0804E328: .4byte 0x0000043c
_0804E32C:
	ldr r0, _0804E340
	ldr r0, [r0]
	adds r0, 0xC0
	str r1, [r0]
	ldr r0, _0804E344
	ldr r2, _0804E348
	adds r0, r2
	movs r1, 0x33
	strb r1, [r0]
	b _0804E486
	.align 2, 0
_0804E340: .4byte gUnknown_03004828
_0804E344: .4byte gMain
_0804E348: .4byte 0x0000043c
_0804E34C:
	bl sub_8125DDC
	ldr r0, _0804E368
	ldr r1, _0804E36C
	adds r0, r1
	movs r2, 0
	movs r1, 0x28
_0804E35A:
	strb r1, [r0]
_0804E35C:
	ldr r0, _0804E370
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804E486
	.align 2, 0
_0804E368: .4byte gMain
_0804E36C: .4byte 0x0000043c
_0804E370: .4byte gUnknown_03004828
_0804E374:
	ldr r0, _0804E398
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x32
	bhi _0804E388
	b _0804E486
_0804E388:
	movs r0, 0
	str r0, [r1]
	ldr r0, _0804E39C
	adds r1, r2, r0
	movs r0, 0x29
	strb r0, [r1]
	b _0804E486
	.align 2, 0
_0804E398: .4byte gUnknown_03004828
_0804E39C: .4byte 0x0000043c
_0804E3A0:
	bl sub_80084A4
	ldr r0, _0804E3B0
	ldr r1, _0804E3B4
	adds r0, r1
	movs r1, 0x2A
	strb r1, [r0]
	b _0804E486
	.align 2, 0
_0804E3B0: .4byte gMain
_0804E3B4: .4byte 0x0000043c
_0804E3B8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804E486
	bl sub_8125E04
	ldr r1, _0804E3D8
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0804E3DC
	ldr r2, _0804E3E0
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804E486
	.align 2, 0
_0804E3D8: .4byte gUnknown_3001BB4
_0804E3DC: .4byte gMain
_0804E3E0: .4byte 0x0000043c
_0804E3E4:
	ldr r0, _0804E404
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bls _0804E486
	ldr r0, _0804E408
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80084A4
	b _0804E486
	.align 2, 0
_0804E404: .4byte gUnknown_03004828
_0804E408: .4byte 0x0000043c
_0804E40C:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804E486
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0804E460
_0804E428:
	ldr r0, _0804E444
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E486
	movs r0, 0x3
	bl FadeOutBGM
	ldr r1, _0804E448
	ldr r0, _0804E44C
	adds r1, r0
	b _0804E466
	.align 2, 0
_0804E444: .4byte gPaletteFade
_0804E448: .4byte gMain
_0804E44C: .4byte 0x0000043c
_0804E450:
	bl IsBGMStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0804E486
	bl sub_800832C
_0804E460:
	ldr r1, _0804E470
	ldr r2, _0804E474
	adds r1, r2
_0804E466:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804E486
	.align 2, 0
_0804E470: .4byte gMain
_0804E474: .4byte 0x0000043c
_0804E478:
	ldr r0, _0804E4A8
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804E486
	ldr r0, _0804E4AC
	bl SetMainCallback2
_0804E486:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _0804E494
	bl RunTasks
_0804E494:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E4A8: .4byte gReceivedRemoteLinkPlayers
_0804E4AC: .4byte sub_804E144
	thumb_func_end sub_804DC88

	thumb_func_start sub_804E144
sub_804E144: @ 804E4B0
	push {lr}
	ldr r0, _0804E4D8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E4C4
	ldr r0, _0804E4DC
	bl SetMainCallback2
_0804E4C4:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_0804E4D8: .4byte gPaletteFade
_0804E4DC: .4byte sub_8047CD8
	thumb_func_end sub_804E144

	thumb_func_start sub_804E174
sub_804E174: @ 804E4E0
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _0804E508
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
_0804E508: .4byte sub_804E1A0
	thumb_func_end sub_804E174

	thumb_func_start sub_804E1A0
sub_804E1A0: @ 804E50C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0804E538
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E530
	ldr r0, _0804E53C
	bl SetMainCallback2
	ldr r1, _0804E540
	ldr r0, _0804E544
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0804E530:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E538: .4byte gPaletteFade
_0804E53C: .4byte sub_804B790
_0804E540: .4byte gUnknown_0300485C
_0804E544: .4byte sub_8080990
	thumb_func_end sub_804E1A0

	thumb_func_start sub_804E1DC
sub_804E1DC: @ 804E548
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_0804E54E:
	ldr r0, _0804E58C
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804E590
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _0804E54E
	cmp r5, 0
	beq _0804E586
	ldr r0, _0804E594
	bl FlagSet
_0804E586:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E58C: .4byte gUnknown_020297D8
_0804E590: .4byte gEnemyParty
_0804E594: .4byte 0x0000083b
	thumb_func_end sub_804E1DC

	thumb_func_start sub_804E22C
sub_804E22C: @ 804E598
	push {r4,lr}
	ldr r0, _0804E5D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804E5DC
	ldr r4, _0804E5E0
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r1, _0804E5E4
	ldr r0, _0804E5E8
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804E5EC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804E5F0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0804E5F4
	ldr r2, _0804E5F8
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E5D8: .4byte gUnknown_08D00000
_0804E5DC: .4byte gUnknown_08D00524
_0804E5E0: .4byte 0x02000000
_0804E5E4: .4byte 0x06002800
_0804E5E8: .4byte 0x040000d4
_0804E5EC: .4byte 0x80000280
_0804E5F0: .4byte gUnknown_08D004E0
_0804E5F4: .4byte 0x0400000a
_0804E5F8: .4byte 0x00000502
	thumb_func_end sub_804E22C

	.align 2, 0 @ Don't pad with nop.
