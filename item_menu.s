	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A3118
sub_80A3118: @ 80A3268
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl sub_80A740C
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80A3118

	thumb_func_start sub_80A3134
sub_80A3134: @ 80A3284
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _080A32B8
	ldr r2, _080A32BC
	ldr r0, _080A32C0
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r3, _080A32C4
	str r3, [r0, 0x8]
	ldr r2, [r0, 0x8]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r2
	ldr r2, _080A32C8
	str r1, [r0]
	str r2, [r0, 0x4]
	str r3, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080A32B8: .4byte 0x020219cc
_080A32BC: .4byte 0x06002000
_080A32C0: .4byte 0x040000d4
_080A32C4: .4byte 0x80000400
_080A32C8: .4byte 0x06006000
	thumb_func_end sub_80A3134

	thumb_func_start sub_80A317C
sub_80A317C: @ 80A32CC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080A32E8
	ldr r1, _080A32EC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x10
	bls _080A32DE
	b _080A35F8
_080A32DE:
	lsls r0, 2
	ldr r1, _080A32F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A32E8: .4byte gMain
_080A32EC: .4byte 0x0000043c
_080A32F0: .4byte _080A32F4
	.align 2, 0
_080A32F4:
	.4byte _080A3338
	.4byte _080A3342
	.4byte _080A3358
	.4byte _080A335E
	.4byte _080A3378
	.4byte _080A339C
	.4byte _080A33A2
	.4byte _080A33C0
	.4byte _080A33CC
	.4byte _080A33E8
	.4byte _080A33F4
	.4byte _080A3478
	.4byte _080A34DC
	.4byte _080A3544
	.4byte _080A3554
	.4byte _080A35AC
	.4byte _080A35CC
_080A3338:
	bl sub_80F9438
	bl sub_80A34E8
	b _080A35B4
_080A3342:
	bl remove_some_task
	ldr r1, _080A3350
	ldr r0, _080A3354
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A3350: .4byte gMain
_080A3354: .4byte 0x0000043c
_080A3358:
	bl gpu_pal_allocator_reset__manage_upper_four
	b _080A35B4
_080A335E:
	bl sub_80F9020
	ldr r0, _080A3370
	ldr r1, _080A3374
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _080A35B4
	.align 2, 0
_080A3370: .4byte 0x02000000
_080A3374: .4byte 0x0001ffff
_080A3378:
	bl ResetPaletteFade
	ldr r2, _080A3390
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080A3394
	ldr r0, _080A3398
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A3390: .4byte gPaletteFade
_080A3394: .4byte gMain
_080A3398: .4byte 0x0000043c
_080A339C:
	bl ResetSpriteData
	b _080A35B4
_080A33A2:
	bl sub_80A3520
	lsls r0, 24
	cmp r0, 0
	bne _080A33AE
	b _080A35F8
_080A33AE:
	ldr r1, _080A33B8
	ldr r0, _080A33BC
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A33B8: .4byte gMain
_080A33BC: .4byte 0x0000043c
_080A33C0:
	ldr r0, _080A33C8
	bl SetUpWindowConfig
	b _080A35B4
	.align 2, 0
_080A33C8: .4byte gWindowConfig_81E6DFC
_080A33CC:
	ldr r0, _080A33DC
	bl MultistepInitMenuWindowBegin
	ldr r1, _080A33E0
	ldr r0, _080A33E4
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A33DC: .4byte gWindowConfig_81E6DFC
_080A33E0: .4byte gMain
_080A33E4: .4byte 0x0000043c
_080A33E8:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _080A33F2
	b _080A35F8
_080A33F2:
	b _080A35B4
_080A33F4:
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	movs r0, 0
	movs r1, 0xAC
	movs r2, 0xC
	bl CreateVerticalScrollIndicators
	movs r0, 0x1
	movs r1, 0xAC
	movs r2, 0x94
	bl CreateVerticalScrollIndicators
	movs r0, 0x2
	movs r1, 0x1C
	movs r2, 0x58
	bl CreateVerticalScrollIndicators
	movs r0, 0x3
	movs r1, 0x64
	movs r2, 0x58
	bl CreateVerticalScrollIndicators
	movs r0, 0
	movs r1, 0x2
	bl sub_80F9988
	movs r0, 0x1
	movs r1, 0x2
	bl sub_80F9988
	movs r0, 0x2
	movs r1, 0x2
	bl sub_80F9988
	movs r0, 0x3
	movs r1, 0x2
	bl sub_80F9988
	ldr r0, _080A346C
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A3462
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x3
	movs r1, 0x1
	bl sub_80F979C
_080A3462:
	ldr r1, _080A3470
	ldr r0, _080A3474
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A346C: .4byte gUnknown_03000701
_080A3470: .4byte gMain
_080A3474: .4byte 0x0000043c
_080A3478:
	ldr r1, _080A34C8
	movs r0, 0x10
	strb r0, [r1]
	ldr r4, _080A34CC
	ldr r5, _080A34D0
	ldrb r1, [r5]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A39B8
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80A3AC0
	bl sub_80A3D08
	ldr r4, _080A34D4
	ldr r0, [r4, 0x10]
	ldr r1, [r4, 0x14]
	bl sub_80A3C34
	ldr r0, [r4, 0x18]
	ldr r1, [r4, 0x1C]
	bl sub_80A3C34
	bl sub_80A3D40
	ldr r1, _080A34D8
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 3
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	bl sub_80A362C
	b _080A35B4
	.align 2, 0
_080A34C8: .4byte gUnknown_0203855A
_080A34CC: .4byte 0x020221cc
_080A34D0: .4byte gUnknown_02038559
_080A34D4: .4byte gBagPockets
_080A34D8: .4byte gUnknown_03005D24
_080A34DC:
	ldr r0, _080A3524
	movs r1, 0
	movs r2, 0x7
	bl sub_80A48E8
	ldr r1, _080A3528
	ldr r4, _080A352C
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A3530
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	bl ItemListMenu_InitDescription
	bl ItemListMenu_InitMenu
	ldr r1, _080A3534
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _080A3538
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080A353C
	ldr r0, _080A3540
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A3524: .4byte 0x0000ffff
_080A3528: .4byte gUnknown_03005D10
_080A352C: .4byte gUnknown_02038559
_080A3530: .4byte gUnknown_03005D24
_080A3534: .4byte gUnknown_0203855B
_080A3538: .4byte gUnknown_0203855C
_080A353C: .4byte gMain
_080A3540: .4byte 0x0000043c
_080A3544:
	bl CreateBagSprite
	movs r0, 0
	bl CreateBagPokeballSprite
	bl sub_80A3740
	b _080A35B4
_080A3554:
	ldr r3, _080A3594
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _080A3598
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _080A359C
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _080A35A0
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080A35A4
	ldr r0, _080A35A8
	adds r1, r0
	b _080A35BA
	.align 2, 0
_080A3594: .4byte 0x04000208
_080A3598: .4byte 0x04000200
_080A359C: .4byte 0x04000004
_080A35A0: .4byte gPaletteFade
_080A35A4: .4byte gMain
_080A35A8: .4byte 0x0000043c
_080A35AC:
	bl sub_8055870
	cmp r0, 0x1
	beq _080A35F8
_080A35B4:
	ldr r1, _080A35C4
	ldr r2, _080A35C8
	adds r1, r2
_080A35BA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080A35F8
	.align 2, 0
_080A35C4: .4byte gMain
_080A35C8: .4byte 0x0000043c
_080A35CC:
	ldr r0, _080A35F0
	bl SetVBlankCallback
	ldr r0, _080A35F4
	bl SetMainCallback2
	bl sub_80A751C
	bl sub_80A7630
	bl sub_80A770C
	bl sub_80A7828
	bl sub_80A78B8
	movs r0, 0x1
	b _080A35FA
	.align 2, 0
_080A35F0: .4byte sub_80A3134
_080A35F4: .4byte sub_80A3118
_080A35F8:
	movs r0, 0
_080A35FA:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A317C

	thumb_func_start sub_80A34B4
sub_80A34B4: @ 80A3604
	push {lr}
_080A3606:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A3622
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A3606
	movs r0, 0
	b _080A362E
_080A3622:
	ldr r1, _080A3634
	movs r0, 0
	strb r0, [r1]
	bl ResetTasks
	movs r0, 0x1
_080A362E:
	pop {r1}
	bx r1
	.align 2, 0
_080A3634: .4byte gUnknown_03000700
	thumb_func_end sub_80A34B4

	thumb_func_start sub_80A34E8
sub_80A34E8: @ 80A3638
	push {lr}
	bl sub_80F9368
	ldr r1, _080A3664
	ldr r2, _080A3668
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _080A366C
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A3664: .4byte 0x0400000c
_080A3668: .4byte 0x00000c06
_080A366C: .4byte 0x00000405
	thumb_func_end sub_80A34E8

	thumb_func_start sub_80A3520
sub_80A3520: @ 80A3670
	push {lr}
	ldr r0, _080A368C
	ldr r1, _080A3690
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080A3680
	b _080A3774
_080A3680:
	lsls r0, 2
	ldr r1, _080A3694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A368C: .4byte 0x02000000
_080A3690: .4byte 0x0001ffff
_080A3694: .4byte _080A3698
	.align 2, 0
_080A3698:
	.4byte _080A36AC
	.4byte _080A36C0
	.4byte _080A36D8
	.4byte _080A3710
	.4byte _080A3754
_080A36AC:
	ldr r0, _080A36B8
	ldr r1, _080A36BC
	bl LZDecompressVram
	b _080A373A
	.align 2, 0
_080A36B8: .4byte gBagScreen_Gfx
_080A36BC: .4byte 0x06004000
_080A36C0:
	ldr r0, _080A36D0
	ldr r1, _080A36D4
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	b _080A373A
	.align 2, 0
_080A36D0: .4byte gUnknown_08E77004
_080A36D4: .4byte 0x020221cc
_080A36D8:
	ldr r0, _080A36F4
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080A36E8
	ldr r0, _080A36F8
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _080A3700
_080A36E8:
	ldr r0, _080A36FC
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	b _080A373A
	.align 2, 0
_080A36F4: .4byte gSaveBlock2
_080A36F8: .4byte gUnknown_03000701
_080A36FC: .4byte gBagScreenMale_Pal
_080A3700:
	ldr r0, _080A370C
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	b _080A373A
	.align 2, 0
_080A370C: .4byte gBagScreenFemale_Pal
_080A3710:
	ldr r0, _080A3728
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _080A3720
	ldr r0, _080A372C
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _080A3734
_080A3720:
	ldr r0, _080A3730
	bl LoadCompressedObjectPic
	b _080A373A
	.align 2, 0
_080A3728: .4byte gSaveBlock2
_080A372C: .4byte gUnknown_03000701
_080A3730: .4byte gUnknown_083C1CC8
_080A3734:
	ldr r0, _080A3748
	bl LoadCompressedObjectPic
_080A373A:
	ldr r1, _080A374C
	ldr r0, _080A3750
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080A3774
	.align 2, 0
_080A3748: .4byte gUnknown_083C1CD0
_080A374C: .4byte 0x02000000
_080A3750: .4byte 0x0001ffff
_080A3754:
	ldr r0, _080A3768
	bl LoadCompressedObjectPalette
	ldr r0, _080A376C
	ldr r1, _080A3770
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _080A3776
	.align 2, 0
_080A3768: .4byte gUnknown_083C1CD8
_080A376C: .4byte 0x02000000
_080A3770: .4byte 0x0001ffff
_080A3774:
	movs r0, 0
_080A3776:
	pop {r1}
	bx r1
	thumb_func_end sub_80A3520

	thumb_func_start sub_80A362C
sub_80A362C: @ 80A377C
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _080A3798
	ldr r5, _080A379C
_080A3784:
	ldrb r0, [r6]
	cmp r0, 0x5
	bne _080A37A0
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _080A37A6
	.align 2, 0
_080A3798: .4byte gUnknown_03000701
_080A379C: .4byte gUnknown_03005D10
_080A37A0:
	lsls r1, r4, 2
	adds r0, r1, r5
	ldrb r3, [r0, 0x2]
_080A37A6:
	adds r1, r5
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _080A37BC
	ldrb r2, [r1, 0x3]
	adds r0, r2
	cmp r0, r3
	ble _080A37C4
	subs r0, r3, r2
	strb r0, [r1, 0x1]
	b _080A37C4
_080A37BC:
	ldrb r0, [r1]
	cmp r0, r3
	bls _080A37C4
	strb r3, [r1]
_080A37C4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A3784
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A362C

	thumb_func_start sub_80A3684
sub_80A3684: @ 80A37D4
	push {r4,lr}
	movs r2, 0
	ldr r4, _080A3800
	ldr r3, _080A3804
	movs r1, 0
_080A37DE:
	lsls r0, r2, 2
	adds r0, r3
	strb r1, [r0]
	strb r1, [r0, 0x1]
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _080A37DE
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3800: .4byte gUnknown_02038559
_080A3804: .4byte gUnknown_03005D10
	thumb_func_end sub_80A3684

	thumb_func_start sub_80A36B8
sub_80A36B8: @ 80A3808
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, [sp, 0x18]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r0, 24
	lsrs r0, 24
	lsrs r2, 24
	adds r0, r2, r0
	cmp r2, r0
	bgt _080A385A
	adds r7, r0, 0
_080A382E:
	mov r1, r8
	mov r3, r12
	adds r0, r1, r3
	adds r4, r2, 0x1
	cmp r1, r0
	bgt _080A3852
	lsls r3, r2, 5
	movs r5, 0
	adds r2, r0, 0
_080A3840:
	adds r0, r1, r3
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	ble _080A3840
_080A3852:
	lsls r0, r4, 16
	lsrs r2, r0, 16
	cmp r2, r7
	ble _080A382E
_080A385A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A36B8

	thumb_func_start sub_80A3714
sub_80A3714: @ 80A3864
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080A388C
_080A386A:
	lsls r1, r4, 3
	adds r1, r5
	ldr r0, [r1]
	ldrb r1, [r1, 0x4]
	bl ClearItemSlots
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080A386A
	bl sub_80A3684
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A388C: .4byte gBagPockets
	thumb_func_end sub_80A3714

	thumb_func_start sub_80A3740
sub_80A3740: @ 80A3890
	push {lr}
	sub sp, 0x4
	ldr r1, _080A38BC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A38BC: .4byte gUnknown_083C1704
	thumb_func_end sub_80A3740

	thumb_func_start sub_80A3770
sub_80A3770: @ 80A38C0
	push {lr}
	ldr r0, _080A38EC
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A3906
	ldr r3, _080A38F0
	ldr r2, _080A38F4
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldr r1, _080A38F8
	adds r0, r1
	str r0, [r3]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x3
	beq _080A3900
	ldr r1, _080A38FC
	movs r0, 0x4
	b _080A3904
	.align 2, 0
_080A38EC: .4byte gUnknown_03000701
_080A38F0: .4byte gUnknown_03000704
_080A38F4: .4byte gUnknown_02038559
_080A38F8: .4byte gUnknown_083C1690
_080A38FC: .4byte gUnknown_02038564
_080A3900:
	ldr r1, _080A390C
	movs r0, 0x6
_080A3904:
	strb r0, [r1]
_080A3906:
	pop {r0}
	bx r0
	.align 2, 0
_080A390C: .4byte gUnknown_02038564
	thumb_func_end sub_80A3770

	thumb_func_start sub_80A37C0
sub_80A37C0: @ 80A3910
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A3940
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080A3944
	str r0, [r1]
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	movs r0, 0x2
	bl sub_80F98DC
	movs r0, 0x3
	bl sub_80F98DC
	pop {r0}
	bx r0
	.align 2, 0
_080A3940: .4byte gTasks
_080A3944: .4byte sub_80A50C8
	thumb_func_end sub_80A37C0

	thumb_func_start sub_80A37F8
sub_80A37F8: @ 80A3948
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _080A39A4
	ldrb r5, [r6]
	cmp r5, 0xF
	bhi _080A39B8
	adds r0, r5, 0x1
	strb r0, [r6]
	ldr r4, _080A39A8
	ldrb r2, [r6]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0x4F
	bl sub_80A396C
	ldr r0, _080A39AC
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6]
	lsrs r2, 1
	ldr r3, _080A39B0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r3
	movs r3, 0x12
	ldrsb r3, [r0, r3]
	adds r0, r4, 0
	bl sub_80A39E4
	ldr r4, _080A39B4
	movs r0, 0x1
	strb r0, [r4]
	lsrs r1, r5, 1
	ldrb r2, [r6]
	lsrs r2, 1
	subs r2, 0x1
	adds r0, r7, 0
	bl sub_80A48E8
	movs r0, 0
	strb r0, [r4]
	b _080A3A82
	.align 2, 0
_080A39A4: .4byte gUnknown_0203855A
_080A39A8: .4byte 0x020221cc
_080A39AC: .4byte gUnknown_02038559
_080A39B0: .4byte gTasks
_080A39B4: .4byte gUnknown_02038558
_080A39B8:
	ldr r0, _080A39F0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A3A04
	ldr r1, _080A39F4
	ldr r0, _080A39F8
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A39FC
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldr r4, _080A3A00
	ldrb r1, [r4]
	bl ItemListMenu_ChangeDescription
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080A3A42
	.align 2, 0
_080A39F0: .4byte gLinkOpen
_080A39F4: .4byte gUnknown_03005D10
_080A39F8: .4byte gUnknown_02038559
_080A39FC: .4byte gUnknown_03005D24
_080A3A00: .4byte gUnknown_02038562
_080A3A04:
	ldr r1, _080A3A88
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _080A3A42
	ldr r5, _080A3A8C
	adds r4, r1, 0
_080A3A10:
	ldr r0, _080A3A90
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A3A94
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldrb r1, [r4]
	bl ItemListMenu_ChangeDescription
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _080A3A10
_080A3A42:
	ldr r0, _080A3A88
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080A3A82
	ldr r1, _080A3A98
	movs r0, 0x10
	strb r0, [r1]
	ldr r1, _080A3A9C
	ldr r0, _080A3A90
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _080A3AA0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A37C0
	adds r0, r7, 0
	bl DestroyTask
	bl ItemListMenu_InitMenu
	movs r0, 0x2
	movs r1, 0
	bl sub_80F979C
	movs r0, 0x3
	movs r1, 0
	bl sub_80F979C
_080A3A82:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3A88: .4byte gUnknown_02038562
_080A3A8C: .4byte gUnknown_03005D10
_080A3A90: .4byte gUnknown_02038559
_080A3A94: .4byte gUnknown_03005D24
_080A3A98: .4byte gUnknown_0203855A
_080A3A9C: .4byte gUnknown_0203855B
_080A3AA0: .4byte sub_80A4F68
	thumb_func_end sub_80A37F8

	thumb_func_start sub_80A3954
sub_80A3954: @ 80A3AA4
	push {lr}
	adds r1, r0, 0
	ldr r0, _080A3AB8
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_080A3AB8: .4byte gUnknown_08E77004
	thumb_func_end sub_80A3954

	thumb_func_start sub_80A396C
sub_80A396C: @ 80A3ABC
	push {r4-r7,lr}
	lsls r1, 24
	lsrs r5, r1, 24
	adds r4, r5, 0
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r1, r4, 0x2
	lsls r1, 6
	adds r1, 0x1C
	adds r2, r0, r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r7, r4
	bls _080A3B02
_080A3ADE:
	movs r1, 0
	adds r3, r5, 0x1
	adds r4, r2, 0
	adds r4, 0x40
_080A3AE6:
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xE
	bls _080A3AE6
	adds r2, r4, 0
	adds r1, r5, 0
	lsls r0, r3, 24
	lsrs r5, r0, 24
	cmp r7, r1
	bhi _080A3ADE
_080A3B02:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A396C

	thumb_func_start sub_80A39B8
sub_80A39B8: @ 80A3B08
	push {lr}
	sub sp, 0x10
	lsls r1, 25
	lsrs r1, 24
	ldr r3, _080A3B30
	movs r2, 0
	str r2, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x4
	movs r2, 0xA
	bl sub_809D104
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A3B30: .4byte gUnknown_08E96EC8
	thumb_func_end sub_80A39B8

	thumb_func_start sub_80A39E4
sub_80A39E4: @ 80A3B34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	adds r5, r6, 0
	lsls r2, r1, 1
	mov r9, r2
	lsls r3, 24
	asrs r3, 24
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080A3BAC
	adds r0, r1, 0x1
	lsls r7, r0, 1
	cmp r1, 0x5
	bne _080A3B68
	movs r7, 0x2
_080A3B68:
	ldr r0, _080A3BA8
	mov r10, r0
	movs r4, 0x8
	subs r4, r6
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp]
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x2
	mov r9, r0
	str r0, [sp, 0xC]
	mov r0, r8
	movs r1, 0x4
	movs r2, 0xA
	mov r3, r10
	bl sub_809D104
	adds r1, r6, 0x4
	movs r0, 0
	str r0, [sp]
	str r7, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	mov r0, r8
	movs r2, 0xA
	mov r3, r10
	bl sub_809D104
	b _080A3BFA
	.align 2, 0
_080A3BA8: .4byte gUnknown_08E96EC8
_080A3BAC:
	cmp r3, 0x1
	bne _080A3BFA
	subs r0, r4, 0x1
	lsls r0, 17
	lsrs r7, r0, 16
	cmp r4, 0x1
	bne _080A3BBC
	movs r7, 0xA
_080A3BBC:
	ldr r6, _080A3C0C
	str r5, [sp]
	str r7, [sp, 0x4]
	movs r0, 0x8
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r4, 0x2
	str r4, [sp, 0xC]
	mov r0, r8
	movs r1, 0x4
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_809D104
	movs r1, 0xC
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	mov r0, r8
	movs r2, 0xA
	adds r3, r6, 0
	bl sub_809D104
_080A3BFA:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3C0C: .4byte gUnknown_08E96EC8
	thumb_func_end sub_80A39E4

	thumb_func_start sub_80A3AC0
sub_80A3AC0: @ 80A3C10
	push {r4-r6,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r2, 0
	ldr r1, _080A3C34
	ldr r0, _080A3C38
	adds r6, r0, 0
	subs r0, 0x1
	adds r5, r0, 0
_080A3C24:
	cmp r2, r4
	bne _080A3C3C
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r1
	strh r6, [r0]
	b _080A3C44
	.align 2, 0
_080A3C34: .4byte 0x0000024a
_080A3C38: .4byte 0x0000107d
_080A3C3C:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r1
	strh r5, [r0]
_080A3C44:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _080A3C24
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3AC0

	thumb_func_start sub_80A3B04
sub_80A3B04: @ 80A3C54
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080A3CF4
	ldrb r0, [r4]
	lsls r1, 24
	asrs r6, r1, 24
	adds r0, r6, r0
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _080A3C70
	movs r0, 0
	strb r0, [r4]
_080A3C70:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bge _080A3C7C
	movs r0, 0x4
	strb r0, [r4]
_080A3C7C:
	bl sub_80A76A0
	bl sub_80A7590
	ldr r2, _080A3CF8
	ldr r1, _080A3CFC
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldrb r0, [r4]
	bl sub_80A3D24
	ldr r0, _080A3D00
	movs r4, 0
	strb r4, [r0]
	adds r0, r5, 0
	bl sub_80A3954
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x3
	bl sub_80A396C
	adds r0, r5, 0
	movs r1, 0
	bl sub_80A39B8
	ldr r1, _080A3D04
	movs r0, 0x6
	strb r0, [r1]
	ldr r0, _080A3D08
	strb r4, [r0]
	ldr r4, _080A3D0C
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080A3CE0
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
_080A3CE0:
	ldr r1, _080A3D10
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x12]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3CF4: .4byte gUnknown_02038559
_080A3CF8: .4byte gUnknown_03005D24
_080A3CFC: .4byte gBagPockets
_080A3D00: .4byte gUnknown_0203855A
_080A3D04: .4byte gUnknown_0203855B
_080A3D08: .4byte gUnknown_02038562
_080A3D0C: .4byte sub_80A37F8
_080A3D10: .4byte gTasks
	thumb_func_end sub_80A3B04

	thumb_func_start swap32
swap32: @ 80A3D14
	ldr r3, [r0]
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	bx lr
	thumb_func_end swap32

	thumb_func_start sub_80A3BD0
sub_80A3BD0: @ 80A3D20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r1, 0
	adds r6, r0, 0
	movs r3, 0
	b _080A3D6A
_080A3D30:
	adds r0, r3, 0x1
	lsls r1, r0, 16
	lsrs r4, r1, 16
	lsls r1, r2, 24
	lsrs r1, 24
	mov r8, r0
	cmp r4, r1
	bcs _080A3D64
	lsls r0, r3, 2
	adds r5, r0, r6
	adds r2, r1, 0
_080A3D46:
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	bne _080A3D5A
	lsls r1, r4, 2
	adds r1, r6
	adds r0, r5, 0
	str r2, [sp]
	bl swap32
	ldr r2, [sp]
_080A3D5A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bcc _080A3D46
_080A3D64:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
_080A3D6A:
	adds r2, r7, 0
	lsls r0, r2, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r3, r0
	blt _080A3D30
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3BD0

	thumb_func_start sub_80A3C34
sub_80A3C34: @ 80A3D84
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r1, 0
	adds r6, r0, 0
	adds r2, r7, 0
	lsls r0, r2, 24
	movs r3, 0
	cmp r0, 0
	beq _080A3DEC
_080A3D9A:
	adds r0, r3, 0x1
	lsls r1, r0, 16
	lsrs r4, r1, 16
	lsls r1, r2, 24
	lsrs r1, 24
	mov r8, r0
	cmp r4, r1
	bcs _080A3DDC
	lsls r0, r3, 2
	adds r5, r0, r6
	adds r2, r1, 0
_080A3DB0:
	ldrh r0, [r5, 0x2]
	cmp r0, 0
	beq _080A3DD2
	lsls r0, r4, 2
	adds r1, r0, r6
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080A3DD2
	ldrh r0, [r5]
	ldrh r3, [r1]
	cmp r0, r3
	bls _080A3DD2
	adds r0, r5, 0
	str r2, [sp]
	bl swap32
	ldr r2, [sp]
_080A3DD2:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bcc _080A3DB0
_080A3DDC:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
	adds r2, r7, 0
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r3, r0
	bcc _080A3D9A
_080A3DEC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3C34

	thumb_func_start sub_80A3CA8
sub_80A3CA8: @ 80A3DF8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A3E50
	lsls r0, r6, 2
	adds r3, r0, r1
	movs r0, 0
	strb r0, [r3, 0x2]
	movs r4, 0
	ldr r0, _080A3E54
	lsls r2, r6, 3
	adds r1, r2, r0
	mov r12, r0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _080A3E3C
	mov r7, r12
	adds r5, r3, 0
_080A3E1C:
	adds r3, r2, r7
	ldr r0, [r3]
	lsls r1, r4, 2
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080A3E30
	ldrb r0, [r5, 0x2]
	adds r0, 0x1
	strb r0, [r5, 0x2]
_080A3E30:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r3, [r3, 0x4]
	cmp r4, r3
	bcc _080A3E1C
_080A3E3C:
	lsls r0, r6, 3
	add r0, r12
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	bl sub_80A3BD0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3E50: .4byte gUnknown_03005D10
_080A3E54: .4byte gBagPockets
	thumb_func_end sub_80A3CA8

	thumb_func_start sub_80A3D08
sub_80A3D08: @ 80A3E58
	push {r4,lr}
	movs r4, 0
_080A3E5C:
	adds r0, r4, 0
	bl sub_80A3CA8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A3E5C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3D08

	thumb_func_start sub_80A3D24
sub_80A3D24: @ 80A3E74
	push {lr}
	lsls r0, 24
	ldr r1, _080A3E8C
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1, 0x2]
	cmp r0, 0x6
	bls _080A3E86
	movs r0, 0x7
_080A3E86:
	strb r0, [r1, 0x3]
	pop {r0}
	bx r0
	.align 2, 0
_080A3E8C: .4byte gUnknown_03005D10
	thumb_func_end sub_80A3D24

	thumb_func_start sub_80A3D40
sub_80A3D40: @ 80A3E90
	push {r4,lr}
	movs r4, 0
_080A3E94:
	adds r0, r4, 0
	bl sub_80A3D24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A3E94
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3D40

	thumb_func_start sub_80A3D5C
sub_80A3D5C: @ 80A3EAC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A3F44
	mov r9, r1
	ldr r2, _080A3F48
	mov r8, r2
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r1, 2
	add r1, r9
	ldrb r2, [r1, 0x1]
	ldrb r1, [r1]
	adds r2, r1
	ldr r7, _080A3F4C
	ldr r1, [r7]
	lsls r6, r2, 2
	adds r3, r6, r1
	ldr r2, _080A3F50
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r3, 0x2]
	ldrh r1, [r1, 0xA]
	subs r0, r1
	strh r0, [r3, 0x2]
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _080A3F30
	ldr r0, _080A3F54
	ldr r1, _080A3F58
	adds r5, r0, r1
	ldrh r0, [r5]
	ldrh r3, [r3]
	cmp r0, r3
	bne _080A3F04
	bl sub_80A40D0
	strh r4, [r5]
_080A3F04:
	ldr r0, [r7]
	adds r0, r6, r0
	strh r4, [r0]
	mov r2, r8
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	mov r3, r9
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	adds r0, r1, 0x7
	ldrb r3, [r2, 0x2]
	cmp r0, r3
	bne _080A3F28
	cmp r1, 0
	beq _080A3F28
	subs r0, r1, 0x1
	strb r0, [r2, 0x1]
_080A3F28:
	ldr r0, _080A3F48
	ldrb r0, [r0]
	bl sub_80A3CA8
_080A3F30:
	ldr r0, _080A3F48
	ldrb r0, [r0]
	bl sub_80A3D24
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3F44: .4byte gUnknown_03005D10
_080A3F48: .4byte gUnknown_02038559
_080A3F4C: .4byte gUnknown_03005D24
_080A3F50: .4byte gTasks
_080A3F54: .4byte gSaveBlock1
_080A3F58: .4byte 0x00000496
	thumb_func_end sub_80A3D5C

	thumb_func_start sub_80A3E0C
sub_80A3E0C: @ 80A3F5C
	push {lr}
	ldr r3, _080A3FB0
	ldr r2, _080A3FB4
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A3FB8
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080A3FA2
	strh r0, [r1]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	adds r0, r1, 0x7
	ldrb r3, [r2, 0x2]
	cmp r0, r3
	bne _080A3F9A
	cmp r1, 0
	beq _080A3F9A
	subs r0, r1, 0x1
	strb r0, [r2, 0x1]
_080A3F9A:
	ldr r0, _080A3FB4
	ldrb r0, [r0]
	bl sub_80A3CA8
_080A3FA2:
	ldr r0, _080A3FB4
	ldrb r0, [r0]
	bl sub_80A3D24
	pop {r0}
	bx r0
	.align 2, 0
_080A3FB0: .4byte gUnknown_03005D10
_080A3FB4: .4byte gUnknown_02038559
_080A3FB8: .4byte gUnknown_03005D24
	thumb_func_end sub_80A3E0C

	thumb_func_start nullsub_16
nullsub_16: @ 80A3FBC
	bx lr
	thumb_func_end nullsub_16

	thumb_func_start sub_80A3E70
sub_80A3E70: @ 80A3FC0
	lsls r0, 24
	lsls r1, 24
	ldr r2, _080A3FDC
	ldr r2, [r2]
	lsrs r0, 22
	adds r0, r2
	ldr r3, [r0]
	lsrs r1, 22
	adds r1, r2
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A3FDC: .4byte gUnknown_03005D24
	thumb_func_end sub_80A3E70

	thumb_func_start sub_80A3E90
sub_80A3E90: @ 80A3FE0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	bl nullsub_16
	ldr r0, _080A4038
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	ldrb r0, [r5, 0x1C]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080A403C
	ldr r1, _080A4040
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r2, 2
	adds r2, r3
	ldrb r1, [r2, 0x1]
	ldrb r2, [r2]
	adds r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_80A3E70
	movs r0, 0
	strh r0, [r5, 0x1C]
	bl sub_80A763C
	movs r0, 0
	bl sub_80A7528
	bl ItemListMenu_InitMenu
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4038: .4byte gTasks
_080A403C: .4byte gUnknown_03005D10
_080A4040: .4byte gUnknown_02038559
	thumb_func_end sub_80A3E90

	thumb_func_start sub_80A3EF4
sub_80A3EF4: @ 80A4044
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	bl nullsub_16
	ldr r0, _080A4094
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r2, _080A4098
	ldr r0, _080A409C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	mvns r0, r0
	ldrb r2, [r1, 0x1C]
	adds r0, r2
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0
	strh r0, [r1, 0x1C]
	cmp r2, 0x7
	bhi _080A4088
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
_080A4088:
	movs r0, 0
	bl sub_80A7528
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4094: .4byte gTasks
_080A4098: .4byte gUnknown_03005D10
_080A409C: .4byte gUnknown_02038559
	thumb_func_end sub_80A3EF4

	thumb_func_start sub_80A3F50
sub_80A3F50: @ 80A40A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A40E4
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r3, r1
	ldr r5, _080A40E8
	ldr r4, _080A40EC
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	ldrb r1, [r1]
	adds r2, r1
	adds r2, 0x1
	strh r2, [r3, 0x1C]
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1]
	adds r1, r2, 0
	bl sub_80A48E8
	movs r0, 0x1
	bl sub_80A7528
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A40E4: .4byte gTasks
_080A40E8: .4byte gUnknown_03005D10
_080A40EC: .4byte gUnknown_02038559
	thumb_func_end sub_80A3F50

	thumb_func_start sub_80A3FA0
sub_80A3FA0: @ 80A40F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	ldr r0, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r6, r4, 16
	lsrs r2, 24
	adds r0, r2, r0
	cmp r2, r0
	bge _080A414C
	mov r8, r5
	adds r4, r5, r3
	mov r12, r0
_080A411C:
	adds r0, r5, 0
	lsls r3, r2, 16
	cmp r8, r4
	bge _080A413E
	asrs r2, r3, 11
_080A4126:
	lsls r1, r0, 16
	asrs r1, 16
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r7
	strh r6, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r0, r1, 16
	asrs r1, 16
	cmp r1, r4
	blt _080A4126
_080A413E:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r12
	blt _080A411C
_080A414C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A3FA0

	thumb_func_start sub_80A4008
sub_80A4008: @ 80A4158
	push {r4,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x10]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_80A3FA0
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4008

	thumb_func_start sub_80A4030
sub_80A4030: @ 80A4180
	ldr r1, _080A41A8
	lsls r0, 7
	adds r1, r0, r1
	movs r0, 0x5A
	strh r0, [r1]
	movs r0, 0x5B
	strh r0, [r1, 0x2]
	movs r0, 0x5C
	strh r0, [r1, 0x4]
	adds r2, r1, 0
	adds r2, 0x40
	movs r0, 0x6A
	strh r0, [r2]
	adds r2, 0x2
	movs r0, 0x6B
	strh r0, [r2]
	adds r1, 0x44
	movs r0, 0x6C
	strh r0, [r1]
	bx lr
	.align 2, 0
_080A41A8: .4byte 0x02022280
	thumb_func_end sub_80A4030

	thumb_func_start sub_80A405C
sub_80A405C: @ 80A41AC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080A41F8
	movs r0, 0
	adds r4, r2, 0
	movs r1, 0x4F
_080A41BA:
	strh r1, [r2]
	strh r1, [r2, 0x2]
	strh r1, [r2, 0x4]
	adds r2, 0x40
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF
	bls _080A41BA
	lsls r0, r3, 7
	adds r2, r0, r4
	movs r0, 0x5A
	strh r0, [r2]
	movs r0, 0x5B
	strh r0, [r2, 0x2]
	movs r0, 0x5C
	strh r0, [r2, 0x4]
	adds r1, r2, 0
	adds r1, 0x40
	movs r0, 0x6A
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6B
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6C
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A41F8: .4byte 0x02022280
	thumb_func_end sub_80A405C

	thumb_func_start sub_80A40AC
sub_80A40AC: @ 80A41FC
	lsls r0, 24
	ldr r1, _080A421C
	lsrs r0, 17
	adds r1, r0, r1
	movs r2, 0x4F
	strh r2, [r1]
	strh r2, [r1, 0x2]
	strh r2, [r1, 0x4]
	adds r0, r1, 0
	adds r0, 0x40
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r1, 0x44
	strh r2, [r1]
	bx lr
	.align 2, 0
_080A421C: .4byte 0x02022280
	thumb_func_end sub_80A40AC

	thumb_func_start sub_80A40D0
sub_80A40D0: @ 80A4220
	push {r4-r7,lr}
	movs r4, 0
	ldr r2, _080A4264
	ldr r3, _080A4268
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	adds r7, r2, 0
	adds r6, r3, 0
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	beq _080A4286
	ldr r5, _080A426C
_080A423E:
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r3, r0, r7
	ldrb r2, [r3, 0x1]
	adds r1, r2, r4
	ldr r0, _080A4270
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080A4274
	adds r0, r4, 0
	bl sub_80A40AC
	b _080A4286
	.align 2, 0
_080A4264: .4byte gUnknown_03005D10
_080A4268: .4byte gUnknown_02038559
_080A426C: .4byte 0x02025bca
_080A4270: .4byte gUnknown_03005D24
_080A4274:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bhi _080A4286
	adds r0, r2, r4
	ldrb r3, [r3, 0x2]
	cmp r0, r3
	bne _080A423E
_080A4286:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A40D0

	thumb_func_start sub_80A413C
sub_80A413C: @ 80A428C
	push {lr}
	bl sub_80A40D0
	ldr r1, _080A42AC
	ldr r0, _080A42B0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80A405C
	pop {r0}
	bx r0
	.align 2, 0
_080A42AC: .4byte gUnknown_03005D10
_080A42B0: .4byte gUnknown_02038559
	thumb_func_end sub_80A413C

	thumb_func_start sub_80A4164
sub_80A4164: @ 80A42B4
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0xB9
	strb r4, [r0]
	adds r0, 0x1
	movs r4, 0xFC
	strb r4, [r0]
	movs r4, 0x14
	strb r4, [r0, 0x1]
	movs r4, 0x6
	strb r4, [r0, 0x2]
	adds r0, 0x3
	bl ConvertIntToDecimalStringN
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4164

	thumb_func_start sub_80A418C
sub_80A418C: @ 80A42DC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	mov r9, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x18]
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080A4320
	mov r8, r0
	adds r1, r4, 0
	mov r2, r9
	bl sub_80A4164
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4320: .4byte gStringVar1
	thumb_func_end sub_80A418C

	thumb_func_start sub_80A41D4
sub_80A41D4: @ 80A4324
	push {lr}
	bl sub_80A763C
	pop {r0}
	bx r0
	thumb_func_end sub_80A41D4

	thumb_func_start sub_80A41E0
sub_80A41E0: @ 80A4330
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r9, r2
	adds r5, r3, 0
	ldr r4, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xFC
	mov r8, r0
	strb r0, [r7]
	movs r6, 0x13
	strb r6, [r7, 0x1]
	movs r0, 0x8
	strb r0, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r1, r8
	strb r1, [r0]
	strb r6, [r0, 0x1]
	movs r1, 0x18
	strb r1, [r0, 0x2]
	adds r7, r0, 0x3
	adds r4, 0x1
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 1
	movs r2, 0x78
	subs r2, r0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	mov r1, r9
	movs r3, 0
	bl sub_8072C74
	movs r1, 0xB9
	strb r1, [r0]
	adds r7, r0, 0x1
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x78
	movs r3, 0x1
	bl sub_8072C14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A41E0

	thumb_func_start sub_80A425C
sub_80A425C: @ 80A43AC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080A43F4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r0, 0x1C
	ldrsh r1, [r1, r0]
	ldr r3, _080A43F8
	ldr r0, _080A43FC
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	subs r1, r0
	subs r1, 0x1
	cmp r1, r2
	bne _080A43EC
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	movs r0, 0x2
	strb r0, [r4, 0x2]
	adds r4, 0x3
_080A43EC:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A43F4: .4byte gTasks
_080A43F8: .4byte gUnknown_03005D10
_080A43FC: .4byte gUnknown_02038559
	thumb_func_end sub_80A425C

	thumb_func_start sub_80A42B0
sub_80A42B0: @ 80A4400
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r0, _080A4494
	mov r8, r0
	ldr r1, _080A4498
	ldr r0, _080A449C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	adds r1, r6
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bgt _080A44C0
	cmp r1, r0
	bne _080A44C4
	ldr r0, _080A44A0
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _080A44C0
	lsls r0, r6, 25
	movs r1, 0x80
	lsls r1, 18
	adds r0, r1
	lsrs r5, r0, 24
	ldr r4, _080A44A4
	ldr r1, _080A44A8
	adds r0, r4, 0
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	lsls r0, r5, 6
	ldr r1, _080A44AC
	adds r0, r1
	movs r2, 0x4F
	strh r2, [r0]
	strh r2, [r0, 0x2]
	adds r1, r0, 0
	adds r1, 0x40
	strh r2, [r1]
	adds r0, 0x42
	strh r2, [r0]
	cmp r6, 0x7
	beq _080A44C0
	cmp r7, 0x1
	bne _080A447E
	mov r1, r8
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _080A4482
_080A447E:
	cmp r7, 0x2
	bne _080A44B0
_080A4482:
	adds r1, r5, 0x2
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuFillWindowRectWithBlankTile
	b _080A44C0
	.align 2, 0
_080A4494: .4byte gUnknown_02038540
_080A4498: .4byte gUnknown_03005D10
_080A449C: .4byte gUnknown_02038559
_080A44A0: .4byte gUnknown_03000701
_080A44A4: .4byte gStringVar1
_080A44A8: .4byte gOtherText_CloseBag
_080A44AC: .4byte 0x020221e8
_080A44B0:
	adds r1, r5, 0x2
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1D
	movs r3, 0x11
	bl MenuFillWindowRectWithBlankTile
_080A44C0:
	movs r0, 0x1
	b _080A44C6
_080A44C4:
	movs r0, 0
_080A44C6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A42B0

	thumb_func_start sub_80A4380
sub_80A4380: @ 80A44D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r2, [sp]
	mov r10, r3
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080A44F0
	mov r8, r0
	b _080A456A
	.align 2, 0
_080A44F0: .4byte gUnknown_03005D24
_080A44F4:
	ldr r1, _080A4590
	ldr r0, _080A4594
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	adds r4, r7, r4
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r7, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	lsrs r5, 24
	ldr r6, _080A4598
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r6, 0
	adds r2, r7, 0
	bl sub_80A425C
	adds r6, r0, 0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 2
	adds r0, r4, r0
	ldrh r0, [r0]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r6, 0
	movs r2, 0x66
	movs r3, 0
	bl sub_8072C74
	adds r6, r0, 0
	movs r0, 0xB9
	strb r0, [r6]
	adds r6, 0x1
	mov r1, r8
	ldr r0, [r1]
	adds r4, r0
	ldrh r1, [r4, 0x2]
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A4598
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080A456A:
	ldr r0, [sp]
	cmp r7, r0
	bgt _080A4580
	adds r0, r7, 0
	mov r1, r10
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A44F4
_080A4580:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4590: .4byte gUnknown_03005D10
_080A4594: .4byte gUnknown_02038559
_080A4598: .4byte gStringVar1
	thumb_func_end sub_80A4380

	thumb_func_start sub_80A444C
sub_80A444C: @ 80A459C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	str r2, [sp]
	str r3, [sp, 0x4]
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _080A45BC
	mov r9, r0
	b _080A4670
	.align 2, 0
_080A45BC: .4byte 0x02025bca
_080A45C0:
	ldr r1, _080A4638
	ldr r0, _080A463C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	adds r4, r6, r4
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	lsrs r5, 24
	ldr r7, _080A4640
	mov r2, r10
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80A425C
	adds r7, r0, 0
	ldr r0, _080A4644
	mov r8, r0
	ldr r0, [r0]
	lsls r4, 2
	adds r0, r4, r0
	ldrh r0, [r0]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r7, 0
	movs r2, 0x63
	movs r3, 0
	bl sub_8072C74
	ldr r0, _080A4640
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	ldr r0, _080A4648
	ldrb r0, [r0]
	cmp r0, 0
	beq _080A464C
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r2, r9
	ldrh r2, [r2]
	cmp r0, r2
	bne _080A466A
	adds r0, r6, 0
	bl sub_80A4030
	b _080A466A
	.align 2, 0
_080A4638: .4byte gUnknown_03005D10
_080A463C: .4byte gUnknown_02038559
_080A4640: .4byte gStringVar1
_080A4644: .4byte gUnknown_03005D24
_080A4648: .4byte gUnknown_02038558
_080A464C:
	mov r1, r8
	ldr r0, [r1]
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r2, r9
	ldrh r2, [r2]
	cmp r0, r2
	bne _080A4664
	adds r0, r6, 0
	bl sub_80A405C
	b _080A466A
_080A4664:
	adds r0, r6, 0
	bl sub_80A40AC
_080A466A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080A4670:
	ldr r0, [sp]
	cmp r6, r0
	bgt _080A4686
	adds r0, r6, 0
	ldr r1, [sp, 0x4]
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A45C0
_080A4686:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A444C

	thumb_func_start sub_80A4548
sub_80A4548: @ 80A4698
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _080A46BC
	mov r9, r0
	b _080A4812
	.align 2, 0
_080A46BC: .4byte 0x020221cc
_080A46C0:
	ldr r1, _080A476C
	ldr r0, _080A4770
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	add r4, r8
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r0, r1, 25
	movs r3, 0x80
	lsls r3, 18
	adds r0, r3
	lsrs r0, 24
	str r0, [sp, 0x10]
	lsls r0, 5
	adds r0, 0xE
	adds r5, r0, 0
	ldr r6, _080A4774
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r6, 0
	mov r2, r8
	bl sub_80A425C
	adds r6, r0, 0
	ldr r3, _080A4778
	mov r10, r3
	ldr r0, [r3]
	lsls r7, r4, 2
	adds r3, r7, r0
	ldrh r1, [r3]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _080A4784
	lsls r0, r5, 1
	add r0, r9
	movs r1, 0x59
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	movs r2, 0x4F
	strh r2, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	add r0, r9
	movs r1, 0x69
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x21
	lsls r0, 1
	add r0, r9
	strh r2, [r0]
	ldrh r0, [r3]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	adds r2, r0, 0
	muls r2, r1
	ldr r0, _080A477C
	adds r2, r0
	mov r1, r10
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r3, _080A4780
	adds r1, r3, 0
	ldrh r3, [r0]
	adds r1, r3
	lsls r1, 16
	lsrs r1, 16
	ldrh r3, [r0, 0x2]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	bl sub_80A41E0
	b _080A47FE
	.align 2, 0
_080A476C: .4byte gUnknown_03005D10
_080A4770: .4byte gUnknown_02038559
_080A4774: .4byte gStringVar1
_080A4778: .4byte gUnknown_03005D24
_080A477C: .4byte gMoveNames
_080A4780: .4byte 0xfffffee0
_080A4784:
	lsls r0, r5, 1
	add r0, r9
	ldr r1, _080A483C
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	adds r1, 0x1
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	add r0, r9
	adds r1, 0xF
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x21
	lsls r0, 1
	add r0, r9
	adds r1, 0x1
	strh r1, [r0]
	movs r0, 0xFC
	strb r0, [r6]
	movs r4, 0x13
	strb r4, [r6, 0x1]
	movs r0, 0x11
	strb r0, [r6, 0x2]
	adds r6, 0x3
	mov r1, r10
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r3, _080A4840
	adds r1, r3
	adds r0, r6, 0
	bl ConvertIntToDecimalString
	adds r6, r0, 0
	movs r0, 0xFC
	strb r0, [r6]
	strb r4, [r6, 0x1]
	movs r0, 0x18
	strb r0, [r6, 0x2]
	adds r6, 0x3
	mov r1, r10
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080A4844
	adds r1, r0
	adds r0, r6, 0
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
_080A47FE:
	ldr r0, _080A4848
	movs r1, 0xE
	ldr r2, [sp, 0x10]
	bl MenuPrint
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080A4812:
	ldr r3, [sp, 0x8]
	cmp r8, r3
	bgt _080A482A
	mov r0, r8
	ldr r1, [sp, 0xC]
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A482A
	b _080A46C0
_080A482A:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A483C: .4byte 0x0000105d
_080A4840: .4byte 0xfffffeae
_080A4844: .4byte gMoveNames
_080A4848: .4byte gStringVar1
	thumb_func_end sub_80A4548

	thumb_func_start sub_80A46FC
sub_80A46FC: @ 80A484C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4]
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _080A4874
	mov r10, r0
	ldr r1, _080A4878
	mov r9, r1
	ldr r0, _080A487C
	mov r8, r0
	b _080A4904
	.align 2, 0
_080A4874: .4byte 0x020221cc
_080A4878: .4byte gStringVar2
_080A487C: .4byte gUnknown_03005D24
_080A4880:
	ldr r1, _080A492C
	ldr r0, _080A4930
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	adds r4, r6, r4
	lsls r4, 24
	lsrs r4, 24
	lsls r5, r6, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	lsrs r5, 24
	lsls r0, r5, 5
	adds r0, 0xE
	lsls r1, r0, 1
	add r1, r10
	movs r2, 0x59
	strh r2, [r1]
	adds r0, 0x20
	lsls r0, 1
	add r0, r10
	movs r1, 0x69
	strh r1, [r0]
	ldr r7, _080A4934
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	lsrs r0, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80A425C
	adds r7, r0, 0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 2
	adds r0, r4, r0
	ldrh r0, [r0]
	mov r1, r9
	bl CopyItemName
	mov r1, r8
	ldr r0, [r1]
	adds r4, r0
	ldrh r1, [r4]
	subs r1, 0x84
	lsls r1, 16
	lsrs r1, 16
	ldrh r3, [r4, 0x2]
	movs r0, 0x3
	str r0, [sp]
	adds r0, r7, 0
	mov r2, r9
	bl sub_80A41E0
	ldr r0, _080A4934
	movs r1, 0xE
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080A4904:
	ldr r0, [sp, 0x8]
	cmp r6, r0
	bgt _080A491A
	adds r0, r6, 0
	ldr r1, [sp, 0xC]
	bl sub_80A42B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A4880
_080A491A:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A492C: .4byte gUnknown_03005D10
_080A4930: .4byte gUnknown_02038559
_080A4934: .4byte gStringVar1
	thumb_func_end sub_80A46FC

	thumb_func_start sub_80A47E8
sub_80A47E8: @ 80A4938
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080A4958
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _080A49A2
	lsls r0, 2
	ldr r1, _080A495C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A4958: .4byte gUnknown_02038559
_080A495C: .4byte _080A4960
	.align 2, 0
_080A4960:
	.4byte _080A4974
	.4byte _080A4974
	.4byte _080A498C
	.4byte _080A4998
	.4byte _080A4980
_080A4974:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4380
	b _080A49A2
_080A4980:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A444C
	b _080A49A2
_080A498C:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A4548
	b _080A49A2
_080A4998:
	adds r0, r2, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80A46FC
_080A49A2:
	ldr r1, _080A49C0
	ldr r0, _080A49C4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080A49C8
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
	b _080A49D0
	.align 2, 0
_080A49C0: .4byte gUnknown_03005D10
_080A49C4: .4byte gUnknown_02038559
_080A49C8:
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_080A49D0:
	ldr r0, _080A49F4
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _080A4A00
	ldr r1, _080A49F8
	ldr r0, _080A49FC
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	adds r1, 0x8
	ldrb r0, [r0, 0x2]
	adds r0, 0x1
	cmp r1, r0
	blt _080A4A16
	b _080A4A28
	.align 2, 0
_080A49F4: .4byte gUnknown_03000701
_080A49F8: .4byte gUnknown_03005D10
_080A49FC: .4byte gUnknown_02038559
_080A4A00:
	ldr r2, _080A4A20
	ldr r0, _080A4A24
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	adds r0, 0x8
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	bge _080A4A28
_080A4A16:
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
	b _080A4A30
	.align 2, 0
_080A4A20: .4byte gUnknown_03005D10
_080A4A24: .4byte gUnknown_02038559
_080A4A28:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
_080A4A30:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A47E8

	thumb_func_start sub_80A48E8
sub_80A48E8: @ 80A4A38
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r3, 0
	bl sub_80A47E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A48E8

	thumb_func_start sub_80A48F8
sub_80A48F8: @ 80A4A48
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0x5
	movs r3, 0x2
	bl sub_80A47E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A48F8

	thumb_func_start ItemListMenu_InitDescription
ItemListMenu_InitDescription: @ 80A4A5C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _080A4AB0
	ldr r0, _080A4AB4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A4AC4
	ldr r0, _080A4AB8
	movs r4, 0x1
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072A18
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A4ABC
	ldr r0, _080A4AC0
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0x78
	movs r3, 0x68
	bl sub_8072A18
	adds r0, r5, r0
	b _080A4AD8
	.align 2, 0
_080A4AB0: .4byte gUnknown_03005D10
_080A4AB4: .4byte gUnknown_02038559
_080A4AB8: .4byte gOtherText_ReturnTo
_080A4ABC: .4byte gUnknown_0840E740
_080A4AC0: .4byte gUnknown_03000701
_080A4AC4:
	adds r0, r3, 0
	bl ItemId_GetDescription
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072A18
_080A4AD8:
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bhi _080A4AF4
	lsls r1, r5, 25
	movs r0, 0xD0
	lsls r0, 20
	adds r1, r0
	lsrs r1, 24
	movs r0, 0
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
_080A4AF4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ItemListMenu_InitDescription

	thumb_func_start ItemListMenu_ChangeDescription
ItemListMenu_ChangeDescription: @ 80A4AFC
	push {r4,r5,lr}
	sub sp, 0x64
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080A4B38
	ldr r0, _080A4B3C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A4B68
	cmp r4, 0
	bne _080A4B44
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080A4B40
	movs r1, 0x4
	movs r2, 0x68
	b _080A4B58
	.align 2, 0
_080A4B38: .4byte gUnknown_03005D10
_080A4B3C: .4byte gUnknown_02038559
_080A4B40: .4byte gOtherText_ReturnTo
_080A4B44:
	cmp r4, 0x1
	bne _080A4B9C
	ldr r1, _080A4B60
	ldr r0, _080A4B64
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x4
	movs r2, 0x78
_080A4B58:
	movs r3, 0
	bl MenuPrint_PixelCoords
	b _080A4B9C
	.align 2, 0
_080A4B60: .4byte gUnknown_0840E740
_080A4B64: .4byte gUnknown_03000701
_080A4B68:
	cmp r4, 0
	bne _080A4B78
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
_080A4B78:
	lsls r1, r5, 16
	asrs r1, 16
	mov r0, sp
	adds r2, r4, 0
	bl ItemId_CopyDescription
	cmp r0, 0
	beq _080A4B9C
	lsls r2, r4, 20
	movs r0, 0xD0
	lsls r0, 15
	adds r2, r0
	lsrs r2, 16
	mov r0, sp
	movs r1, 0x4
	movs r3, 0
	bl MenuPrint_PixelCoords
_080A4B9C:
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ItemListMenu_ChangeDescription

	thumb_func_start sub_80A4A54
sub_80A4A54: @ 80A4BA4
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r2, 0x1
	adds r2, r1, 0
	adds r1, r5, 0
_080A4BAE:
	ldrb r3, [r2]
	adds r0, r3, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A4BDA
	subs r4, 0x1
	cmp r4, 0
	bne _080A4BC8
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0x1
	b _080A4BE2
_080A4BC8:
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080A4BD4
	movs r0, 0
	b _080A4BE2
_080A4BD4:
	adds r1, r5, 0
	adds r2, 0x1
	b _080A4BAE
_080A4BDA:
	strb r3, [r1]
	adds r2, 0x1
	adds r1, 0x1
	b _080A4BAE
_080A4BE2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A4A54

	thumb_func_start sub_80A4A98
sub_80A4A98: @ 80A4BE8
	push {r4,r5,lr}
	sub sp, 0x64
	adds r5, r0, 0
	adds r4, r1, 0
	cmp r4, 0
	bne _080A4C00
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
_080A4C00:
	mov r0, sp
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80A4A54
	cmp r0, 0
	beq _080A4C22
	lsls r2, r4, 20
	movs r0, 0xD0
	lsls r0, 15
	adds r2, r0
	lsrs r2, 16
	mov r0, sp
	movs r1, 0x4
	movs r3, 0
	bl MenuPrint_PixelCoords
_080A4C22:
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4A98

	thumb_func_start sub_80A4ADC
sub_80A4ADC: @ 80A4C2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A4C5C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080A4C4A
	movs r0, 0
	bl sub_80A7528
_080A4C4A:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080A4C60
	movs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A4C5C: .4byte gTasks
_080A4C60: .4byte gUnknown_0203855C
	thumb_func_end sub_80A4ADC

	thumb_func_start sub_80A4B14
sub_80A4B14: @ 80A4C64
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080A4CA0
	ldr r1, _080A4CA4
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 2
	adds r1, r2
	lsrs r0, 24
	ldrb r2, [r1, 0x1]
	adds r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0
	bl MoveMenuCursor
	bl sub_80A73C0
	bl sub_80A763C
	adds r0, r4, 0
	bl sub_80A4ADC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4CA0: .4byte gUnknown_03005D10
_080A4CA4: .4byte gUnknown_02038559
	thumb_func_end sub_80A4B14

	thumb_func_start sub_80A4B58
sub_80A4B58: @ 80A4CA8
	push {r4,lr}
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	asrs r0, 24
	bl MoveMenuCursor
	ldr r2, _080A4CD8
	ldr r1, _080A4CDC
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 2
	adds r1, r2
	strb r0, [r1]
	bl sub_80A73C0
	adds r0, r4, 0
	bl sub_80A4ADC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4CD8: .4byte gUnknown_03005D10
_080A4CDC: .4byte gUnknown_02038559
	thumb_func_end sub_80A4B58

	thumb_func_start sub_80A4B90
sub_80A4B90: @ 80A4CE0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080A4D0C
	ldr r0, _080A4D04
	cmp r4, r0
	beq _080A4CFE
	adds r0, 0xD
	cmp r4, r0
	bne _080A4D0C
_080A4CFE:
	ldr r0, _080A4D08
	b _080A4D36
	.align 2, 0
_080A4D04: .4byte 0x00000103
_080A4D08: .4byte gOtherText_Walk
_080A4D0C:
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A4D34
	ldr r1, _080A4D2C
	ldr r0, _080A4D30
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	b _080A4D36
	.align 2, 0
_080A4D2C: .4byte gUnknown_083C1640
_080A4D30: .4byte gUnknown_03000704
_080A4D34:
	ldr r0, _080A4D3C
_080A4D36:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A4D3C: .4byte gOtherText_Check
	thumb_func_end sub_80A4B90

	thumb_func_start sub_80A4BF0
sub_80A4BF0: @ 80A4D40
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r7, _080A4D88
	ldrb r4, [r7]
	cmp r4, 0x4
	beq _080A4D50
	b _080A4E48
_080A4D50:
	movs r0, 0
	movs r1, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0xC
	bl sub_80A4008
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A4D90
	ldr r0, _080A4D8C
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A4D90
	movs r0, 0x1
	movs r1, 0
	bl sub_80A7834
	b _080A4DF0
	.align 2, 0
_080A4D88: .4byte gUnknown_02038564
_080A4D8C: .4byte gUnknown_03000701
_080A4D90:
	movs r6, 0
	ldr r0, _080A4DAC
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080A4DF0
	ldr r4, _080A4DB0
_080A4D9C:
	cmp r6, 0
	bne _080A4DB8
	ldr r0, _080A4DB4
	ldrh r0, [r0]
	bl sub_80A4B90
	adds r3, r0, 0
	b _080A4DC6
	.align 2, 0
_080A4DAC: .4byte gUnknown_02038564
_080A4DB0: .4byte gUnknown_083C1640
_080A4DB4: .4byte gScriptItemId
_080A4DB8:
	ldr r0, _080A4E14
	ldr r0, [r0]
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r4
	ldr r3, [r0]
_080A4DC6:
	lsrs r0, r6, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x1
	ands r2, r6
	lsls r2, 1
	adds r2, 0x8
	adds r0, r3, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080A4E18
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080A4D9C
_080A4DF0:
	ldr r0, _080A4E1C
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A4E24
	ldr r0, _080A4E18
	ldrb r3, [r0]
	ldr r0, _080A4E20
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x8
	bl InitMenu
	b _080A4E3A
	.align 2, 0
_080A4E14: .4byte gUnknown_03000704
_080A4E18: .4byte gUnknown_02038564
_080A4E1C: .4byte gUnknown_03000701
_080A4E20: .4byte gUnknown_03000700
_080A4E24:
	ldr r0, _080A4E44
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x8
	bl InitMenu
_080A4E3A:
	movs r0, 0x2F
	bl sub_8072DCC
	b _080A4EDA
	.align 2, 0
_080A4E44: .4byte gUnknown_02038564
_080A4E48:
	movs r0, 0
	movs r1, 0x5
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r0, 0x6
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x6
	movs r3, 0xC
	bl sub_80A4008
	movs r6, 0
	ldrb r7, [r7]
	cmp r6, r7
	bcs _080A4EBE
	ldr r7, _080A4EE8
_080A4E6E:
	ldr r0, _080A4EEC
	ldr r0, [r0]
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r7
	ldr r5, [r0]
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 1
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x3
	bl __umodsi3
	adds r2, r0, 0
	lsls r2, 25
	movs r0, 0xC0
	lsls r0, 19
	adds r2, r0
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080A4EF0
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080A4E6E
_080A4EBE:
	ldr r0, _080A4EF0
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x6
	bl InitMenu
	movs r0, 0x2F
	bl sub_8072DCC
_080A4EDA:
	movs r0, 0x2
	bl sub_80A7528
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4EE8: .4byte gUnknown_083C1640
_080A4EEC: .4byte gUnknown_03000704
_080A4EF0: .4byte gUnknown_02038564
	thumb_func_end sub_80A4BF0

	thumb_func_start sub_80A4DA4
sub_80A4DA4: @ 80A4EF4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_80A73FC
	movs r0, 0x6
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0xD
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0x5
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	bl sub_80A7590
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A4DA4

	thumb_func_start sub_80A4DD8
sub_80A4DD8: @ 80A4F28
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	adds r4, r1, 0
	adds r1, r2, 0
	adds r6, r3, 0
	ldr r5, [sp, 0x20]
	ldr r2, [sp, 0x24]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldr r3, _080A4FD4
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	movs r0, 0x1
	strh r0, [r2, 0xA]
	adds r0, r4, 0x2
	mov r9, r0
	strh r0, [r2, 0xC]
	adds r0, r1, 0x1
	mov r8, r0
	strh r0, [r2, 0xE]
	adds r2, r4, r6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, r5
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl MenuDrawTextWindow
	ldr r0, _080A4FD8
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	subs r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	subs r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	adds r1, r4, 0
	mov r2, r8
	adds r3, r6, 0
	bl sub_80A4008
	mov r2, r9
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	mov r0, r10
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	mov r3, r8
	bl sub_80A418C
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4FD4: .4byte gTasks
_080A4FD8: .4byte 0x020219cc
	thumb_func_end sub_80A4DD8

	thumb_func_start sub_80A4E8C
sub_80A4E8C: @ 80A4FDC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x2
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0x3
	movs r1, 0x1
	bl sub_80F979C
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r0, 0x2
	bl sub_80F996C
	movs r0, 0x3
	bl sub_80F996C
	ldr r5, _080A5054
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A3B04
	ldr r0, _080A5058
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_80A3AC0
	bl sub_80A3770
	bl sub_80A7C64
	adds r0, r6, 0
	bl CreateBagPokeballSprite
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A5054: .4byte 0x020221cc
_080A5058: .4byte gUnknown_02038559
	thumb_func_end sub_80A4E8C

	thumb_func_start sub_80A4F0C
sub_80A4F0C: @ 80A505C
	push {r4,lr}
	ldr r0, _080A5088
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080A50B0
	ldr r4, _080A508C
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x10
	beq _080A5080
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080A5090
_080A5080:
	movs r0, 0x1
	movs r1, 0x2
	b _080A50A8
	.align 2, 0
_080A5088: .4byte gUnknown_03000701
_080A508C: .4byte gMain
_080A5090:
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x20
	beq _080A50A2
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A50B0
_080A50A2:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x1
_080A50A8:
	bl sub_80A4E8C
	movs r0, 0x1
	b _080A50B2
_080A50B0:
	movs r0, 0
_080A50B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A4F0C

	thumb_func_start sub_80A4F68
sub_80A4F68: @ 80A50B8
	push {lr}
	bl sub_80A4F0C
	pop {r0}
	bx r0
	thumb_func_end sub_80A4F68

	thumb_func_start sub_80A4F74
sub_80A4F74: @ 80A50C4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	movs r5, 0
	ldr r0, _080A50FC
	ldrh r0, [r0, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A5138
	ldr r1, _080A5100
	ldr r0, _080A5104
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A5108
	movs r0, 0x1
	negs r0, r0
	adds r1, r4, 0
	bl sub_80A4B58
	b _080A5118
	.align 2, 0
_080A50FC: .4byte gMain
_080A5100: .4byte gUnknown_03005D10
_080A5104: .4byte gUnknown_02038559
_080A5108:
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _080A5118
	movs r0, 0x1
	negs r0, r0
	adds r1, r4, 0
	bl sub_80A4B14
_080A5118:
	ldr r0, _080A5130
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A51FE
	ldr r1, _080A5134
	ldrh r0, [r1, 0x32]
	cmp r0, 0x5
	bne _080A51FE
	movs r0, 0xB
	strh r0, [r1, 0x32]
	b _080A51FE
	.align 2, 0
_080A5130: .4byte gLinkOpen
_080A5134: .4byte gMain
_080A5138:
	cmp r1, 0x80
	bne _080A51D8
	ldr r0, _080A5170
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _080A517C
	ldr r1, _080A5174
	ldr r0, _080A5178
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bne _080A519E
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _080A51B8
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80A4B14
	b _080A51B8
	.align 2, 0
_080A5170: .4byte gUnknown_03000701
_080A5174: .4byte gUnknown_03005D10
_080A5178: .4byte gUnknown_02038559
_080A517C:
	ldr r1, _080A51A8
	ldr r0, _080A51AC
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r2, r0, r1
	ldrb r1, [r2, 0x1]
	ldrb r3, [r2]
	adds r1, r3
	ldrb r0, [r2, 0x2]
	subs r0, 0x1
	cmp r1, r0
	beq _080A51B8
	ldrb r2, [r2, 0x3]
	cmp r3, r2
	beq _080A51B0
_080A519E:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80A4B58
	b _080A51B8
	.align 2, 0
_080A51A8: .4byte gUnknown_03005D10
_080A51AC: .4byte gUnknown_02038559
_080A51B0:
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_80A4B14
_080A51B8:
	movs r5, 0x1
	ldr r0, _080A51D0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A5210
	ldr r1, _080A51D4
	ldrh r0, [r1, 0x32]
	cmp r0, 0x5
	bne _080A5210
	movs r0, 0xB
	strh r0, [r1, 0x32]
	b _080A5210
	.align 2, 0
_080A51D0: .4byte gLinkOpen
_080A51D4: .4byte gMain
_080A51D8:
	ldr r0, _080A5204
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A520C
	bl sub_80A4F0C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A520C
	bl sub_80A73F0
	ldr r0, _080A5208
	str r0, [r4]
_080A51FE:
	movs r5, 0x1
	b _080A5210
	.align 2, 0
_080A5204: .4byte gTasks
_080A5208: .4byte sub_80A4F68
_080A520C:
	bl sub_80A73C0
_080A5210:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A4F74

	thumb_func_start sub_80A50C8
sub_80A50C8: @ 80A5218
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A5298
	adds r5, r0, r1
	ldr r0, _080A529C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080A5236
	b _080A540C
_080A5236:
	adds r0, r4, 0
	bl sub_80A4F74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5246
	b _080A53BA
_080A5246:
	ldr r2, _080A52A0
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080A52E0
	ldr r3, _080A52A4
	ldrb r0, [r3]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080A52E0
	ldr r0, _080A52A8
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080A52E0
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A52B0
	ldr r1, _080A52AC
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A5288
	b _080A53BA
_080A5288:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A3F50
	b _080A53BA
	.align 2, 0
_080A5298: .4byte 0x03004b38
_080A529C: .4byte gPaletteFade
_080A52A0: .4byte gMain
_080A52A4: .4byte gUnknown_02038559
_080A52A8: .4byte gUnknown_03000701
_080A52AC: .4byte gUnknown_03005D10
_080A52B0:
	ldr r1, _080A52D4
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	beq _080A52D8
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A3E90
	b _080A53BA
	.align 2, 0
_080A52D4: .4byte gUnknown_03005D10
_080A52D8:
	adds r0, r4, 0
	bl sub_80A3EF4
	b _080A53BA
_080A52E0:
	ldrh r2, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080A53C2
	ldr r7, _080A5324
	ldr r6, _080A5328
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _080A5340
	movs r0, 0x14
	ldrsh r1, [r5, r0]
	cmp r1, 0
	bne _080A5338
	ldr r0, _080A532C
	strh r1, [r0]
	ldr r1, _080A5330
	ldr r0, _080A5334
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A53BA
	.align 2, 0
_080A5324: .4byte gUnknown_03005D10
_080A5328: .4byte gUnknown_02038559
_080A532C: .4byte gScriptItemId
_080A5330: .4byte gUnknown_083C16BC
_080A5334: .4byte gUnknown_03000701
_080A5338:
	adds r0, r4, 0
	bl sub_80A3EF4
	b _080A53BA
_080A5340:
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080A53B4
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080A53A0
	movs r1, 0
	ldrsb r1, [r6, r1]
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	adds r0, r1
	strb r0, [r2]
	ldr r3, _080A53A4
	ldrb r0, [r2]
	ldr r1, _080A53A8
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	ldr r1, _080A53AC
	ldr r0, _080A53B0
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	movs r0, 0
	bl sub_80F98A4
	movs r0, 0x1
	bl sub_80F98A4
	movs r0, 0x2
	bl sub_80F98A4
	movs r0, 0x3
	bl sub_80F98A4
	bl sub_80A797C
	b _080A53BA
	.align 2, 0
_080A53A0: .4byte gUnknown_02038560
_080A53A4: .4byte gScriptItemId
_080A53A8: .4byte gUnknown_03005D24
_080A53AC: .4byte gUnknown_083C16BC
_080A53B0: .4byte gUnknown_03000701
_080A53B4:
	adds r0, r4, 0
	bl sub_80A3E90
_080A53BA:
	adds r0, r4, 0
	bl sub_808B5B4
	b _080A540C
_080A53C2:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080A540C
	movs r0, 0x14
	ldrsh r1, [r5, r0]
	cmp r1, 0
	bne _080A5400
	ldr r2, _080A53F4
	ldrb r0, [r2]
	cmp r0, 0x5
	beq _080A5406
	ldr r0, _080A53F8
	strh r1, [r0]
	ldr r1, _080A53FC
	ldrb r0, [r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A5406
	.align 2, 0
_080A53F4: .4byte gUnknown_03000701
_080A53F8: .4byte gScriptItemId
_080A53FC: .4byte gUnknown_083C16BC
_080A5400:
	adds r0, r4, 0
	bl sub_80A3EF4
_080A5406:
	adds r0, r4, 0
	bl sub_808B5B4
_080A540C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A50C8

	thumb_func_start sub_80A52C4
sub_80A52C4: @ 80A5414
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	adds r4, r3, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A5444
	adds r1, r0
	ldr r0, _080A5448
	ldrh r0, [r0, 0x30]
	movs r2, 0xF0
	ands r2, r0
	cmp r2, 0x40
	bne _080A544C
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, r3
	beq _080A548E
	ldrh r0, [r1, 0x2]
	adds r0, 0x1
	b _080A5490
	.align 2, 0
_080A5444: .4byte 0x03004b38
_080A5448: .4byte gMain
_080A544C:
	cmp r2, 0x80
	bne _080A5462
	ldrh r2, [r1, 0x2]
	movs r4, 0x2
	ldrsh r0, [r1, r4]
	cmp r0, 0x1
	beq _080A545E
	subs r0, r2, 0x1
	b _080A5490
_080A545E:
	strh r3, [r1, 0x2]
	b _080A5492
_080A5462:
	cmp r2, 0x10
	bne _080A547A
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	adds r0, 0xA
	cmp r0, r3
	bge _080A5476
	ldrh r0, [r1, 0x2]
	adds r0, 0xA
	b _080A5490
_080A5476:
	strh r4, [r1, 0x2]
	b _080A5492
_080A547A:
	cmp r2, 0x20
	bne _080A5496
	ldrh r2, [r1, 0x2]
	movs r3, 0x2
	ldrsh r0, [r1, r3]
	cmp r0, 0xA
	ble _080A548E
	adds r0, r2, 0
	subs r0, 0xA
	b _080A5490
_080A548E:
	movs r0, 0x1
_080A5490:
	strh r0, [r1, 0x2]
_080A5492:
	movs r0, 0x1
	b _080A5498
_080A5496:
	movs r0, 0
_080A5498:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A52C4

	thumb_func_start sub_80A5350
sub_80A5350: @ 80A54A0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080A54EC
	adds r4, r1, r2
	ldr r1, _080A54F0
	ldrb r1, [r1]
	ldr r2, _080A54F4
	ldr r2, [r2]
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x2]
	bl sub_80A52C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5510
	ldr r0, _080A54F8
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A54FC
	ldrh r0, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0x1
	bl sub_80A418C
	b _080A550C
	.align 2, 0
_080A54EC: .4byte 0x03004b38
_080A54F0: .4byte gUnknown_02038560
_080A54F4: .4byte gUnknown_03005D24
_080A54F8: .4byte gUnknown_02038559
_080A54FC:
	ldrh r0, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x1
	bl sub_80A418C
_080A550C:
	movs r0, 0x1
	b _080A5512
_080A5510:
	movs r0, 0
_080A5512:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A5350

	thumb_func_start sub_80A53CC
sub_80A53CC: @ 80A551C
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A553A
	bl sub_80A3770
	ldr r0, _080A5540
	movs r1, 0
	bl CreateTask
	ldr r1, _080A5544
	strb r0, [r1]
_080A553A:
	pop {r0}
	bx r0
	.align 2, 0
_080A5540: .4byte sub_80A50C8
_080A5544: .4byte gUnknown_02038563
	thumb_func_end sub_80A53CC

	thumb_func_start sub_80A53F8
sub_80A53F8: @ 80A5548
	push {lr}
	ldr r0, _080A555C
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080A5560
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A555C: .4byte gUnknown_03000701
_080A5560: .4byte sub_80A53CC
	thumb_func_end sub_80A53F8

	thumb_func_start sub_80A5414
sub_80A5414: @ 80A5564
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	bl sub_80A78A0
	cmp r0, 0
	bne _080A5576
	b _080A56A2
_080A5576:
	ldr r2, _080A55B0
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A55BC
	ldr r4, _080A55B4
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5590
	b _080A56A2
_080A5590:
	ldrb r1, [r4]
	ldr r0, _080A55B8
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080A55A2
	b _080A56A2
_080A55A2:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A563E
	.align 2, 0
_080A55B0: .4byte gMain
_080A55B4: .4byte gUnknown_03000700
_080A55B8: .4byte gUnknown_03000704
_080A55BC:
	cmp r1, 0x80
	bne _080A55EC
	ldr r4, _080A55E4
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A56A2
	ldrb r1, [r4]
	ldr r0, _080A55E8
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x8
	beq _080A56A2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	b _080A563E
	.align 2, 0
_080A55E4: .4byte gUnknown_03000700
_080A55E8: .4byte gUnknown_03000704
_080A55EC:
	cmp r1, 0x20
	bne _080A561C
	ldr r4, _080A5614
	ldrb r0, [r4]
	cmp r0, 0x1
	bls _080A56A2
	adds r1, r0, 0
	ldr r0, _080A5618
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x2
	ldrb r0, [r1]
	cmp r0, 0x8
	beq _080A56A2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	negs r0, r0
	b _080A563E
	.align 2, 0
_080A5614: .4byte gUnknown_03000700
_080A5618: .4byte gUnknown_03000704
_080A561C:
	cmp r1, 0x10
	bne _080A5650
	ldr r4, _080A5648
	ldrb r0, [r4]
	cmp r0, 0x1
	bhi _080A56A2
	adds r1, r0, 0
	ldr r0, _080A564C
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0x2]
	cmp r0, 0x8
	beq _080A56A2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
_080A563E:
	bl MoveMenuCursor3
	strb r0, [r4]
	b _080A56A2
	.align 2, 0
_080A5648: .4byte gUnknown_03000700
_080A564C: .4byte gUnknown_03000704
_080A5650:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A56E0
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A56A2
	ldr r1, _080A56C0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r1, _080A56C4
	ldr r0, _080A56C8
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A56CC
	bl sub_80A4DA4
	ldr r1, _080A56D0
	ldr r0, _080A56D4
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
_080A56A2:
	cmp r5, 0
	bne _080A574A
	ldr r0, _080A56D8
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A5730
	ldr r0, _080A56DC
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A5724
	movs r0, 0xC
	bl sub_8072DDC
	b _080A574A
	.align 2, 0
_080A56C0: .4byte gTasks
_080A56C4: .4byte gUnknown_03005D10
_080A56C8: .4byte gUnknown_02038559
_080A56CC: .4byte 0x020219cc
_080A56D0: .4byte gUnknown_083C1640
_080A56D4: .4byte gUnknown_03000704
_080A56D8: .4byte gUnknown_03000701
_080A56DC: .4byte gUnknown_03000700
_080A56E0:
	ldr r1, _080A5710
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r0, _080A5714
	bl sub_80A4DA4
	ldr r1, _080A5718
	ldr r0, _080A571C
	ldrb r2, [r0]
	ldr r0, _080A5720
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
	b _080A56A2
	.align 2, 0
_080A5710: .4byte gTasks
_080A5714: .4byte 0x020219cc
_080A5718: .4byte gUnknown_083C1640
_080A571C: .4byte gUnknown_03000700
_080A5720: .4byte gUnknown_03000704
_080A5724:
	cmp r0, 0x1
	bls _080A5738
	movs r0, 0x30
	bl sub_8072DCC
	b _080A574A
_080A5730:
	ldr r0, _080A5740
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080A5744
_080A5738:
	movs r0, 0x2F
	bl sub_8072DCC
	b _080A574A
	.align 2, 0
_080A5740: .4byte gUnknown_03000700
_080A5744:
	movs r0, 0x30
	bl sub_8072DCC
_080A574A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5414

	thumb_func_start sub_80A5600
sub_80A5600: @ 80A5750
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r2, _080A578C
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A5798
	ldr r4, _080A5790
	ldrb r0, [r4]
	cmp r0, 0
	bne _080A576E
	b _080A5886
_080A576E:
	adds r1, r0, 0
	ldr r0, _080A5794
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x1
	ldrb r0, [r1]
	cmp r0, 0x8
	bne _080A5780
	b _080A5886
_080A5780:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A5822
	.align 2, 0
_080A578C: .4byte gMain
_080A5790: .4byte gUnknown_03000700
_080A5794: .4byte gUnknown_03000704
_080A5798:
	cmp r1, 0x80
	bne _080A57D0
	ldr r4, _080A57C4
	ldrb r1, [r4]
	ldr r0, _080A57C8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _080A5886
	cmp r1, 0x2
	beq _080A5886
	ldr r0, _080A57CC
	ldr r0, [r0]
	adds r0, r1, r0
	ldrb r0, [r0, 0x1]
	cmp r0, 0x8
	beq _080A5886
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	b _080A5822
	.align 2, 0
_080A57C4: .4byte gUnknown_03000700
_080A57C8: .4byte gUnknown_02038564
_080A57CC: .4byte gUnknown_03000704
_080A57D0:
	cmp r1, 0x20
	bne _080A5800
	ldr r4, _080A57F8
	ldrb r0, [r4]
	cmp r0, 0x2
	bls _080A5886
	adds r1, r0, 0
	ldr r0, _080A57FC
	ldr r0, [r0]
	adds r1, r0
	subs r1, 0x3
	ldrb r0, [r1]
	cmp r0, 0x8
	beq _080A5886
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x3
	negs r0, r0
	b _080A5822
	.align 2, 0
_080A57F8: .4byte gUnknown_03000700
_080A57FC: .4byte gUnknown_03000704
_080A5800:
	cmp r1, 0x10
	bne _080A5834
	ldr r4, _080A582C
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _080A5886
	adds r1, r0, 0
	ldr r0, _080A5830
	ldr r0, [r0]
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0x8
	beq _080A5886
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x3
_080A5822:
	bl MoveMenuCursor3
	strb r0, [r4]
	b _080A5886
	.align 2, 0
_080A582C: .4byte gUnknown_03000700
_080A5830: .4byte gUnknown_03000704
_080A5834:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A58B8
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5886
	ldr r1, _080A589C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r1, _080A58A0
	ldr r0, _080A58A4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A58A8
	bl sub_80A4DA4
	ldr r1, _080A58AC
	ldr r0, _080A58B0
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
_080A5886:
	cmp r5, 0
	bne _080A590E
	ldr r0, _080A58B4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A58FC
	movs r0, 0xC
	bl sub_8072DDC
	b _080A590E
	.align 2, 0
_080A589C: .4byte gTasks
_080A58A0: .4byte gUnknown_03005D10
_080A58A4: .4byte gUnknown_02038559
_080A58A8: .4byte 0x020219cc
_080A58AC: .4byte gUnknown_083C1640
_080A58B0: .4byte gUnknown_03000704
_080A58B4: .4byte gUnknown_03000700
_080A58B8:
	ldr r1, _080A58E8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
	ldr r0, _080A58EC
	bl sub_80A4DA4
	ldr r1, _080A58F0
	ldr r0, _080A58F4
	ldrb r2, [r0]
	ldr r0, _080A58F8
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r5, [r0]
	adds r0, r4, 0
	bl _call_via_r5
	b _080A5886
	.align 2, 0
_080A58E8: .4byte gTasks
_080A58EC: .4byte 0x020219cc
_080A58F0: .4byte gUnknown_083C1640
_080A58F4: .4byte gUnknown_03000700
_080A58F8: .4byte gUnknown_03000704
_080A58FC:
	cmp r0, 0x2
	bhi _080A5908
	movs r0, 0x2F
	bl sub_8072DCC
	b _080A590E
_080A5908:
	movs r0, 0x30
	bl sub_8072DCC
_080A590E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5600

	thumb_func_start sub_80A57C4
sub_80A57C4: @ 80A5914
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r5, _080A593C
	ldr r0, _080A5940
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 1
	ldr r4, _080A5944
	adds r1, r4
	str r1, [r5]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bne _080A594C
	ldr r1, _080A5948
	movs r0, 0x1
	strb r0, [r1]
	movs r5, 0x9
	b _080A597C
	.align 2, 0
_080A593C: .4byte gUnknown_03000704
_080A5940: .4byte gUnknown_02038559
_080A5944: .4byte gUnknown_083C16AE
_080A5948: .4byte gUnknown_02038564
_080A594C:
	ldr r0, _080A596C
	ldrh r0, [r0]
	bl sub_80F92F4
	lsls r0, 24
	cmp r0, 0
	bne _080A5974
	adds r0, r4, 0
	adds r0, 0x8
	str r0, [r5]
	ldr r1, _080A5970
	movs r0, 0x1
	strb r0, [r1]
	movs r5, 0x9
	b _080A597C
	.align 2, 0
_080A596C: .4byte gScriptItemId
_080A5970: .4byte gUnknown_02038564
_080A5974:
	ldr r1, _080A59D0
	movs r0, 0x2
	strb r0, [r1]
	movs r5, 0x7
_080A597C:
	adds r6, r1, 0
	ldr r0, _080A59D4
	adds r4, r5, 0x1
	ldrb r1, [r6]
	lsls r1, 25
	lsrs r1, 24
	str r1, [sp]
	movs r1, 0x7
	adds r2, r4, 0
	movs r3, 0x6
	bl sub_80A4008
	ldrb r3, [r6]
	lsls r3, 1
	adds r3, 0x1
	adds r3, r5, r3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x6
	adds r1, r5, 0
	movs r2, 0xD
	bl MenuDrawTextWindow
	movs r0, 0
	adds r1, r5, 0
	bl sub_80A7834
	ldrb r3, [r6]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x7
	adds r2, r4, 0
	bl InitMenu
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A59D0: .4byte gUnknown_02038564
_080A59D4: .4byte 0x020219cc
	thumb_func_end sub_80A57C4

	thumb_func_start sub_80A5888
sub_80A5888: @ 80A59D8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80A78A0
	cmp r0, 0
	beq _080A5AD8
	ldr r2, _080A5A08
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080A5A10
	ldr r4, _080A5A0C
	ldrb r0, [r4]
	cmp r0, 0
	beq _080A5AD8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A5A32
	.align 2, 0
_080A5A08: .4byte gMain
_080A5A0C: .4byte gUnknown_03000700
_080A5A10:
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080A5A44
	ldr r4, _080A5A3C
	ldrb r1, [r4]
	ldr r0, _080A5A40
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _080A5AD8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080A5A32:
	bl MoveMenuCursor
	strb r0, [r4]
	b _080A5AD8
	.align 2, 0
_080A5A3C: .4byte gUnknown_03000700
_080A5A40: .4byte gUnknown_02038564
_080A5A44:
	ldrh r1, [r2, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A5AB4
	ldr r1, _080A5A98
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x1C]
	ldr r1, _080A5A9C
	ldr r0, _080A5AA0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A5AA4
	bl sub_80A4DA4
	ldr r1, _080A5AA8
	ldr r0, _080A5AAC
	ldrb r2, [r0]
	ldr r0, _080A5AB0
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A5AD8
	.align 2, 0
_080A5A98: .4byte gTasks
_080A5A9C: .4byte gUnknown_03005D10
_080A5AA0: .4byte gUnknown_02038559
_080A5AA4: .4byte 0x020219cc
_080A5AA8: .4byte gUnknown_083C1640
_080A5AAC: .4byte gUnknown_03000700
_080A5AB0: .4byte gUnknown_03000704
_080A5AB4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5AD8
	ldr r1, _080A5AE0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r0, _080A5AE4
	bl sub_80A4DA4
	ldr r0, _080A5AE8
	ldr r1, [r0, 0x14]
	adds r0, r5, 0
	bl _call_via_r1
_080A5AD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5AE0: .4byte gTasks
_080A5AE4: .4byte 0x020219cc
_080A5AE8: .4byte gUnknown_083C1640
	thumb_func_end sub_80A5888

	thumb_func_start sub_80A599C
sub_80A599C: @ 80A5AEC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A5B14
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A5B18
	lsrs r2, r3, 16
	movs r4, 0
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	ldr r1, _080A5B1C
	strb r4, [r1]
	bl sub_80A5AE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5B14: .4byte gTasks
_080A5B18: .4byte sub_805469C
_080A5B1C: .4byte gUnknown_03005CE0
	thumb_func_end sub_80A599C

	thumb_func_start sub_80A59D0
sub_80A59D0: @ 80A5B20
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A5B8C
	movs r0, 0
	strb r0, [r1]
	ldr r7, _080A5B90
	ldrb r0, [r7]
	cmp r0, 0x5
	bne _080A5B38
	movs r0, 0x1
	strb r0, [r1]
_080A5B38:
	ldr r1, _080A5B94
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r6, r0, r1
	ldr r3, _080A5B98
	ldr r2, _080A5B9C
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r6, 0x1C]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5BA4
	ldrb r0, [r7]
	cmp r0, 0x5
	beq _080A5BA4
	bl sub_80A57C4
	ldr r0, _080A5BA0
	str r0, [r6]
	b _080A5BEC
	.align 2, 0
_080A5B8C: .4byte gUnknown_03000700
_080A5B90: .4byte gUnknown_03000701
_080A5B94: .4byte gTasks
_080A5B98: .4byte gUnknown_03005D10
_080A5B9C: .4byte gUnknown_02038559
_080A5BA0: .4byte sub_80A5888
_080A5BA4:
	ldr r0, _080A5BCC
	bl sub_80A4BF0
	ldr r0, _080A5BD0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A5BBE
	ldr r0, _080A5BD4
	ldrb r0, [r0]
	cmp r0, 0x5
	bne _080A5BE0
_080A5BBE:
	ldr r0, _080A5BD8
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A5BDC
	b _080A5BEA
	.align 2, 0
_080A5BCC: .4byte 0x020219cc
_080A5BD0: .4byte gUnknown_02038559
_080A5BD4: .4byte gUnknown_03000701
_080A5BD8: .4byte gTasks
_080A5BDC: .4byte sub_80A5414
_080A5BE0:
	ldr r0, _080A5BF4
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A5BF8
_080A5BEA:
	str r0, [r1]
_080A5BEC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5BF4: .4byte gTasks
_080A5BF8: .4byte sub_80A5600
	thumb_func_end sub_80A59D0

	thumb_func_start sub_80A5AAC
sub_80A5AAC: @ 80A5BFC
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
	ldr r1, _080A5C2C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5C30
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5C2C: .4byte gTasks
_080A5C30: .4byte sub_80A5B00
	thumb_func_end sub_80A5AAC

	thumb_func_start sub_80A5AE4
sub_80A5AE4: @ 80A5C34
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A5AAC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5AE4

	thumb_func_start sub_80A5B00
sub_80A5B00: @ 80A5C50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A5C88
	adds r2, r0, r1
	ldr r0, _080A5C8C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A5C82
	ldrh r0, [r2, 0x10]
	lsls r0, 16
	ldrh r1, [r2, 0x12]
	orrs r0, r1
	bl SetMainCallback2
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_080A5C82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5C88: .4byte 0x03004b38
_080A5C8C: .4byte gPaletteFade
	thumb_func_end sub_80A5B00

	thumb_func_start sub_80A5B40
sub_80A5B40: @ 80A5C90
	push {lr}
_080A5C92:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5CB8
	bl ResetTasks
	ldr r0, _080A5CB0
	movs r1, 0
	bl CreateTask
	ldr r1, _080A5CB4
	strb r0, [r1]
	b _080A5CC4
	.align 2, 0
_080A5CB0: .4byte sub_80A50C8
_080A5CB4: .4byte gUnknown_02038563
_080A5CB8:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5C92
_080A5CC4:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5B40

	thumb_func_start sub_80A5B78
sub_80A5B78: @ 80A5CC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _080A5D00
	ldrh r0, [r5]
	bl ItemId_GetFieldFunc
	cmp r0, 0
	beq _080A5D42
	movs r0, 0x5
	bl PlaySE
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _080A5D04
	ldrh r0, [r5]
	bl ItemId_GetType
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5D04
	adds r0, r4, 0
	bl sub_80A5BF8
	b _080A5D42
	.align 2, 0
_080A5D00: .4byte gScriptItemId
_080A5D04:
	ldr r1, _080A5D30
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r0, _080A5D34
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	beq _080A5D3C
	ldr r0, _080A5D38
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
	b _080A5D42
	.align 2, 0
_080A5D30: .4byte gTasks
_080A5D34: .4byte gUnknown_02038559
_080A5D38: .4byte gScriptItemId
_080A5D3C:
	adds r0, r4, 0
	bl sub_80C9C7C
_080A5D42:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5B78

	thumb_func_start sub_80A5BF8
sub_80A5BF8: @ 80A5D48
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A73FC
	bl sub_80A7590
	ldr r1, _080A5D6C
	ldr r2, _080A5D70
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D6C: .4byte gOtherText_NoPokemon
_080A5D70: .4byte sub_80A5C48
	thumb_func_end sub_80A5BF8

	thumb_func_start sub_80A5C24
sub_80A5C24: @ 80A5D74
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5C24

	thumb_func_start sub_80A5C48
sub_80A5C48: @ 80A5D98
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A5DE0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A5DE4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5DE8
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5DE0: .4byte 0x020219cc
_080A5DE4: .4byte gTasks
_080A5DE8: .4byte sub_80A5C24
	thumb_func_end sub_80A5C48

	thumb_func_start sub_80A5C9C
sub_80A5C9C: @ 80A5DEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8064E2C
	bl ScriptContext2_Disable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5C9C

	thumb_func_start sub_80A5CC4
sub_80A5CC4: @ 80A5E14
	push {lr}
	bl pal_fill_black
	ldr r0, _080A5E28
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080A5E28: .4byte Task_CallItemUseOnFieldCallback
	thumb_func_end sub_80A5CC4

	thumb_func_start Task_CallItemUseOnFieldCallback
Task_CallItemUseOnFieldCallback: @ 80A5E2C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5E48
	ldr r0, _080A5E50
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080A5E48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5E50: .4byte gUnknown_03005D00
	thumb_func_end Task_CallItemUseOnFieldCallback

	thumb_func_start sub_80A5D04
sub_80A5D04: @ 80A5E54
	push {lr}
_080A5E56:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5E78
	ldr r0, _080A5E70
	movs r1, 0
	bl CreateTask
	ldr r1, _080A5E74
	strb r0, [r1]
	b _080A5E84
	.align 2, 0
_080A5E70: .4byte sub_80A50C8
_080A5E74: .4byte gUnknown_02038563
_080A5E78:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A5E56
_080A5E84:
	pop {r0}
	bx r0
	thumb_func_end sub_80A5D04

	thumb_func_start sub_80A5D38
sub_80A5D38: @ 80A5E88
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A5EC0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldr r0, _080A5EC4
	bl sub_80A4DA4
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5EC0: .4byte gTasks
_080A5EC4: .4byte 0x020219cc
	thumb_func_end sub_80A5D38

	thumb_func_start sub_80A5D78
sub_80A5D78: @ 80A5EC8
	push {lr}
	sub sp, 0x4
	ldr r0, _080A5EEC
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0x8
	movs r3, 0x5
	bl sub_80A4008
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A5EEC: .4byte 0x020219cc
	thumb_func_end sub_80A5D78

	thumb_func_start sub_80A5DA0
sub_80A5DA0: @ 80A5EF0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _080A5F14
	bl CopyItemName
	cmp r4, 0x63
	bls _080A5F1C
	ldr r0, _080A5F18
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	b _080A5F28
	.align 2, 0
_080A5F14: .4byte gStringVar1
_080A5F18: .4byte gStringVar2
_080A5F1C:
	ldr r0, _080A5F40
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
_080A5F28:
	ldr r0, _080A5F44
	bl sub_80A4DA4
	movs r0, 0x5
	bl sub_80A7528
	bl sub_80A5D78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5F40: .4byte gStringVar2
_080A5F44: .4byte 0x020219cc
	thumb_func_end sub_80A5DA0

	thumb_func_start sub_80A5DF8
sub_80A5DF8: @ 80A5F48
	push {lr}
	ldr r0, _080A5F68
	bl sub_80A4DA4
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xB
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0x4
	bl sub_80A7528
	pop {r0}
	bx r0
	.align 2, 0
_080A5F68: .4byte 0x020219cc
	thumb_func_end sub_80A5DF8

	thumb_func_start sub_80A5E1C
sub_80A5E1C: @ 80A5F6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A5FA8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A5F86
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A5FA0
_080A5F86:
	ldr r0, _080A5FAC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x1C]
	adds r0, r4, 0
	bl sub_80A41D4
	adds r0, r4, 0
	bl sub_80A5D38
_080A5FA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FA8: .4byte gMain
_080A5FAC: .4byte gTasks
	thumb_func_end sub_80A5E1C

	thumb_func_start sub_80A5E60
sub_80A5E60: @ 80A5FB0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A5DF8
	adds r0, r4, 0
	bl sub_80A3D5C
	ldr r1, _080A5FD8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A5FDC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FD8: .4byte gTasks
_080A5FDC: .4byte sub_80A5E1C
	thumb_func_end sub_80A5E60

	thumb_func_start sub_80A5E90
sub_80A5E90: @ 80A5FE0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A5D38
	pop {r0}
	bx r0
	thumb_func_end sub_80A5E90

	thumb_func_start sub_80A5EA0
sub_80A5EA0: @ 80A5FF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_80A5350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A605C
	ldr r0, _080A6038
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A6048
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A603C
	ldrh r0, [r0]
	ldr r2, _080A6040
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0xA]
	bl sub_80A5DA0
	ldr r1, _080A6044
	adds r0, r4, 0
	bl sub_80F914C
	b _080A605C
	.align 2, 0
_080A6038: .4byte gMain
_080A603C: .4byte gScriptItemId
_080A6040: .4byte gTasks
_080A6044: .4byte gUnknown_083C16F4
_080A6048:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A605C
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl sub_80A5D38
_080A605C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5EA0

	thumb_func_start sub_80A5F14
sub_80A5F14: @ 80A6064
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080A60A8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A60AC
	str r1, [r0]
	movs r0, 0x3
	bl sub_80A7528
	ldr r0, _080A60B0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A60B4
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0x9
	movs r3, 0x7
	bl sub_80A4DD8
	b _080A60C8
	.align 2, 0
_080A60A8: .4byte gTasks
_080A60AC: .4byte sub_80A5EA0
_080A60B0: .4byte gUnknown_02038559
_080A60B4:
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x9
	movs r3, 0x6
	bl sub_80A4DD8
_080A60C8:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5F14

	thumb_func_start sub_80A5F80
sub_80A5F80: @ 80A60D0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5F80

	thumb_func_start sub_80A5FAC
sub_80A5FAC: @ 80A60FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A6120
	ldr r1, _080A6124
	adds r4, r0, r1
	ldr r5, _080A6128
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080A612C
	bl sub_80A40D0
	movs r0, 0
	b _080A6132
	.align 2, 0
_080A6120: .4byte gSaveBlock1
_080A6124: .4byte 0x00000496
_080A6128: .4byte gScriptItemId
_080A612C:
	bl sub_80A413C
	ldrh r0, [r5]
_080A6132:
	strh r0, [r4]
	movs r0, 0
	bl sub_80A7528
	adds r0, r6, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r6, 0
	bl sub_80A37C0
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A5FAC

	thumb_func_start sub_80A6000
sub_80A6000: @ 80A6150
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6000

	thumb_func_start sub_80A6024
sub_80A6024: @ 80A6174
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A61BC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A61B2
	ldr r0, _080A61C0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A61C4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A61C8
	str r1, [r0]
_080A61B2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A61BC: .4byte gMain
_080A61C0: .4byte 0x020219cc
_080A61C4: .4byte gTasks
_080A61C8: .4byte sub_80A6000
	thumb_func_end sub_80A6024

	thumb_func_start DisplayCannotBeHeldMessage
DisplayCannotBeHeldMessage: @ 80A61CC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A73FC
	ldr r0, _080A6204
	ldrh r0, [r0]
	ldr r1, _080A6208
	bl CopyItemName
	ldr r5, _080A620C
	ldr r1, _080A6210
	adds r0, r5, 0
	bl StringExpandPlaceholders
	bl sub_80A7590
	ldr r2, _080A6214
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6204: .4byte gScriptItemId
_080A6208: .4byte gStringVar1
_080A620C: .4byte gStringVar4
_080A6210: .4byte gOtherText_CantBeHeld
_080A6214: .4byte sub_80A6024
	thumb_func_end DisplayCannotBeHeldMessage

	thumb_func_start ItemMenu_Give
ItemMenu_Give: @ 80A6218
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	movs r0, 0x5
	bl PlaySE
	ldr r5, _080A624C
	ldrh r0, [r5]
	bl sub_80F931C
	lsls r0, 24
	cmp r0, 0
	bne _080A6258
	bl sub_80A73FC
	bl sub_80A7590
	ldr r1, _080A6250
	ldr r2, _080A6254
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A62BE
	.align 2, 0
_080A624C: .4byte gScriptItemId
_080A6250: .4byte gOtherText_CantWriteMail
_080A6254: .4byte sub_80A6024
_080A6258:
	ldrh r0, [r5]
	bl ItemId_GetImportance
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A62B8
	bl CalculatePlayerPartyCount
	lsls r0, 24
	cmp r0, 0
	bne _080A6278
	adds r0, r4, 0
	bl sub_80A5BF8
	b _080A62BE
_080A6278:
	ldr r1, _080A62A8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A62AC
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	ldr r1, _080A62B0
	str r1, [r0]
	ldr r1, _080A62B4
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080A62BE
	.align 2, 0
_080A62A8: .4byte gTasks
_080A62AC: .4byte sub_808B020
_080A62B0: .4byte sub_80A5B00
_080A62B4: .4byte gUnknown_02038561
_080A62B8:
	adds r0, r6, 0
	bl DisplayCannotBeHeldMessage
_080A62BE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ItemMenu_Give

	thumb_func_start sub_80A6178
sub_80A6178: @ 80A62C8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80A5AE4
	ldr r1, _080A62F0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A62F4
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A62F0: .4byte gTasks
_080A62F4: .4byte BerryTagScreen_814625C
	thumb_func_end sub_80A6178

	thumb_func_start sub_80A61A8
sub_80A61A8: @ 80A62F8
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6312
	ldr r0, _080A6318
	movs r1, 0
	bl CreateTask
	ldr r1, _080A631C
	strb r0, [r1]
_080A6312:
	pop {r0}
	bx r0
	.align 2, 0
_080A6318: .4byte sub_80A50C8
_080A631C: .4byte gUnknown_02038563
	thumb_func_end sub_80A61A8

	thumb_func_start sub_80A61D0
sub_80A61D0: @ 80A6320
	push {lr}
	ldr r0, _080A6334
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _080A6338
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6334: .4byte gUnknown_03000701
_080A6338: .4byte sub_80A61A8
	thumb_func_end sub_80A61D0

	thumb_func_start sub_80A61EC
sub_80A61EC: @ 80A633C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A635C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6360
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A635C: .4byte gTasks
_080A6360: .4byte sub_808A3F8
	thumb_func_end sub_80A61EC

	thumb_func_start sub_80A6214
sub_80A6214: @ 80A6364
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080A6394
	ldrb r0, [r0]
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080A6398
	ldrh r0, [r4]
	bl sub_80F931C
	lsls r0, 24
	cmp r0, 0
	bne _080A63A4
	bl sub_80A73FC
	bl sub_80A7590
	ldr r1, _080A639C
	ldr r2, _080A63A0
	adds r0, r5, 0
	b _080A63D0
	.align 2, 0
_080A6394: .4byte gUnknown_02038559
_080A6398: .4byte gScriptItemId
_080A639C: .4byte gOtherText_CantWriteMail
_080A63A0: .4byte sub_80A6024
_080A63A4:
	ldrh r0, [r4]
	bl sub_80F92F4
	lsls r0, 24
	cmp r0, 0
	bne _080A63E8
	bl sub_80A73FC
	ldrh r0, [r4]
	ldr r1, _080A63D8
	bl CopyItemName
	ldr r4, _080A63DC
	ldr r1, _080A63E0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80A7590
	ldr r2, _080A63E4
	adds r0, r5, 0
	adds r1, r4, 0
_080A63D0:
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A6422
	.align 2, 0
_080A63D8: .4byte gStringVar1
_080A63DC: .4byte gStringVar4
_080A63E0: .4byte gOtherText_CantBeHeldHere
_080A63E4: .4byte sub_80A6024
_080A63E8:
	cmp r6, 0x5
	beq _080A641C
	ldrh r0, [r4]
	bl ItemId_GetImportance
	lsls r0, 24
	cmp r0, 0
	bne _080A641C
	ldr r1, _080A6414
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r2, _080A6418
	lsrs r1, r2, 16
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	adds r0, r5, 0
	bl sub_80A5AAC
	b _080A6422
	.align 2, 0
_080A6414: .4byte gTasks
_080A6418: .4byte sub_808A3F8
_080A641C:
	adds r0, r5, 0
	bl DisplayCannotBeHeldMessage
_080A6422:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6214

	thumb_func_start sub_80A62D8
sub_80A62D8: @ 80A6428
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6442
	ldr r0, _080A6448
	movs r1, 0
	bl CreateTask
	ldr r1, _080A644C
	strb r0, [r1]
_080A6442:
	pop {r0}
	bx r0
	.align 2, 0
_080A6448: .4byte sub_80A50C8
_080A644C: .4byte gUnknown_02038563
	thumb_func_end sub_80A62D8

	thumb_func_start sub_80A6300
sub_80A6300: @ 80A6450
	push {lr}
	ldr r0, _080A6464
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, _080A6468
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6464: .4byte gUnknown_03000701
_080A6468: .4byte sub_80A62D8
	thumb_func_end sub_80A6300

	thumb_func_start sub_80A631C
sub_80A631C: @ 80A646C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6494
	ldr r1, _080A6498
	str r1, [r2]
	ldr r2, _080A649C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A64A0
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6494: .4byte gUnknown_0300485C
_080A6498: .4byte sub_80B3050
_080A649C: .4byte gTasks
_080A64A0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A631C

	thumb_func_start sub_80A6354
sub_80A6354: @ 80A64A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80A7590
	ldr r0, _080A6514
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r0
	ldr r4, _080A6518
	ldr r3, _080A651C
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r2, 0x1C]
	movs r0, 0
	ldrsb r0, [r3, r0]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r4, _080A6520
	ldrh r0, [r4]
	ldr r1, _080A6524
	bl CopyItemName
	ldrh r0, [r4]
	bl ItemId_GetPrice
	lsls r0, 16
	cmp r0, 0
	bne _080A6534
	ldr r4, _080A6528
	ldr r1, _080A652C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6530
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A654A
	.align 2, 0
_080A6514: .4byte gTasks
_080A6518: .4byte gUnknown_03005D10
_080A651C: .4byte gUnknown_02038559
_080A6520: .4byte gScriptItemId
_080A6524: .4byte gStringVar2
_080A6528: .4byte gStringVar4
_080A652C: .4byte gOtherText_CantBuyThat
_080A6530: .4byte sub_80A6444
_080A6534:
	ldr r4, _080A6550
	ldr r1, _080A6554
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6558
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
_080A654A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6550: .4byte gStringVar4
_080A6554: .4byte gOtherText_HowManyToSell
_080A6558: .4byte sub_80A648C
	thumb_func_end sub_80A6354

	thumb_func_start sub_80A640C
sub_80A640C: @ 80A655C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A6590
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6590: .4byte gTasks
	thumb_func_end sub_80A640C

	thumb_func_start sub_80A6444
sub_80A6444: @ 80A6594
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A65D0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A65D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A65D8
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A65D0: .4byte 0x020219cc
_080A65D4: .4byte gTasks
_080A65D8: .4byte sub_80A640C
	thumb_func_end sub_80A6444

	thumb_func_start sub_80A648C
sub_80A648C: @ 80A65DC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A6638
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r0, _080A663C
	str r0, [r4]
	ldr r0, _080A6640
	movs r5, 0x2
	str r5, [sp]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A4008
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuDrawTextWindow
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	movs r0, 0xB
	strh r0, [r4, 0xE]
	ldr r0, _080A6644
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _080A6648
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xB
	bl sub_80A418C
	b _080A6656
	.align 2, 0
_080A6638: .4byte gTasks
_080A663C: .4byte Task_BuyHowManyDialogueHandleInput
_080A6640: .4byte 0x020219cc
_080A6644: .4byte gUnknown_02038559
_080A6648:
	str r5, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xB
	bl sub_80A418C
_080A6656:
	ldr r0, _080A666C
	ldrh r0, [r0]
	movs r1, 0x1
	bl BuyMenuDisplayMessage
	bl sub_80A683C
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A666C: .4byte gScriptItemId
	thumb_func_end sub_80A648C

	thumb_func_start sub_80A6520
sub_80A6520: @ 80A6670
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A6694
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A668E
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl BuyMenuPrintItemQuantityAndPrice
_080A668E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6694: .4byte gMain
	thumb_func_end sub_80A6520

	thumb_func_start sub_80A6548
sub_80A6548: @ 80A6698
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80A48F8
	ldr r1, _080A66BC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A66C0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A66BC: .4byte gTasks
_080A66C0: .4byte sub_80A6520
	thumb_func_end sub_80A6548

	thumb_func_start sub_80A6574
sub_80A6574: @ 80A66C4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x5F
	bl PlaySE
	ldr r0, _080A66F0
	ldrh r0, [r0]
	ldr r1, _080A66F4
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	ldrb r1, [r4, 0xA]
	bl sub_80A6870
	ldr r0, _080A66F8
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A66F0: .4byte gScriptItemId
_080A66F4: .4byte gTasks
_080A66F8: .4byte sub_80A6548
	thumb_func_end sub_80A6574

	thumb_func_start sub_80A65AC
sub_80A65AC: @ 80A66FC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _080A6750
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x7
	movs r2, 0x6
	movs r3, 0x6
	bl sub_80A36B8
	ldr r0, _080A6754
	ldrh r0, [r0]
	ldr r1, _080A6758
	bl CopyItemName
	ldr r4, _080A675C
	ldr r1, _080A6760
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6764
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	adds r0, r5, 0
	bl sub_80A3D5C
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6750: .4byte 0x020219cc
_080A6754: .4byte gScriptItemId
_080A6758: .4byte gStringVar2
_080A675C: .4byte gStringVar4
_080A6760: .4byte gOtherText_SoldItem
_080A6764: .4byte sub_80A6574
	thumb_func_end sub_80A65AC

	thumb_func_start sub_80A6618
sub_80A6618: @ 80A6768
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _080A679C
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x7
	movs r2, 0x6
	movs r3, 0x6
	bl sub_80A36B8
	adds r0, r4, 0
	bl BuyMenuPrintItemQuantityAndPrice
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A679C: .4byte 0x020219cc
	thumb_func_end sub_80A6618

	thumb_func_start sub_80A6650
sub_80A6650: @ 80A67A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80A5D78
	ldr r1, _080A67BC
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A67BC: .4byte gUnknown_083C16FC
	thumb_func_end sub_80A6650

	thumb_func_start Task_BuyHowManyDialogueHandleInput
Task_BuyHowManyDialogueHandleInput: @ 80A67C0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	adds r0, r5, 0
	bl sub_80A5350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6804
	movs r0, 0x6
	movs r1, 0xB
	movs r2, 0xC
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _080A67FC
	ldrh r0, [r0]
	ldr r2, _080A6800
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0xA]
	bl BuyMenuDisplayMessage
	b _080A68A8
	.align 2, 0
_080A67FC: .4byte gScriptItemId
_080A6800: .4byte gTasks
_080A6804:
	ldr r0, _080A6874
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A6894
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080A6878
	movs r1, 0x3
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xD
	bl sub_80A36B8
	ldr r4, _080A687C
	ldr r0, _080A6880
	ldrh r0, [r0]
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	ldr r2, _080A6884
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	movs r2, 0xA
	ldrsh r1, [r1, r2]
	muls r1, r0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	ldr r4, _080A6888
	ldr r1, _080A688C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080A6890
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayCannotUseItemMessage
	b _080A68A8
	.align 2, 0
_080A6874: .4byte gMain
_080A6878: .4byte 0x020219cc
_080A687C: .4byte gStringVar1
_080A6880: .4byte gScriptItemId
_080A6884: .4byte gTasks
_080A6888: .4byte gStringVar4
_080A688C: .4byte gOtherText_CanPay
_080A6890: .4byte sub_80A6650
_080A6894:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A68A8
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl BuyMenuPrintItemQuantityAndPrice
_080A68A8:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_BuyHowManyDialogueHandleInput

	thumb_func_start sub_80A6760
sub_80A6760: @ 80A68B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A68E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A68E4: .4byte gTasks
	thumb_func_end sub_80A6760

	thumb_func_start BuyMenuPrintItemQuantityAndPrice
BuyMenuPrintItemQuantityAndPrice: @ 80A68E8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A6938
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl sub_80A36B8
	movs r0, 0
	movs r1, 0
	bl RemoveMoneyLabelObject
	movs r0, 0
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080A693C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A6940
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6938: .4byte 0x020219cc
_080A693C: .4byte gTasks
_080A6940: .4byte sub_80A6760
	thumb_func_end BuyMenuPrintItemQuantityAndPrice

	thumb_func_start BuyMenuDisplayMessage
BuyMenuDisplayMessage: @ 80A6944
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	muls r0, r5
	movs r1, 0x6
	movs r2, 0x6
	movs r3, 0xB
	bl sub_80B7A94
	ldr r6, _080A6988
	adds r0, r4, 0
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	adds r1, r0, 0
	muls r1, r5
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x6
	bl ConvertIntToDecimalStringN
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6988: .4byte gStringVar1
	thumb_func_end BuyMenuDisplayMessage

	thumb_func_start sub_80A683C
sub_80A683C: @ 80A698C
	push {lr}
	sub sp, 0x4
	ldr r0, _080A69B8
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80B7C14
	ldr r0, _080A69BC
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0xC
	bl sub_80A4008
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A69B8: .4byte gSaveBlock1
_080A69BC: .4byte 0x020219cc
	thumb_func_end sub_80A683C

	thumb_func_start sub_80A6870
sub_80A6870: @ 80A69C0
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080A69F0
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 17
	adds r1, r0, 0
	muls r1, r4
	adds r0, r5, 0
	bl sub_80B79B8
	ldr r0, [r5]
	movs r1, 0
	movs r2, 0
	bl sub_80B7BEC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A69F0: .4byte 0x02025bc4
	thumb_func_end sub_80A6870

	thumb_func_start sub_80A68A4
sub_80A68A4: @ 80A69F4
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6A0E
	ldr r0, _080A6A14
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6A18
	strb r0, [r1]
_080A6A0E:
	pop {r0}
	bx r0
	.align 2, 0
_080A6A14: .4byte sub_80A50C8
_080A6A18: .4byte gUnknown_02038563
	thumb_func_end sub_80A68A4

	thumb_func_start sub_80A68CC
sub_80A68CC: @ 80A6A1C
	push {lr}
	ldr r1, _080A6A34
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _080A6A38
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _080A6A3C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6A34: .4byte gUnknown_02038559
_080A6A38: .4byte gUnknown_03000701
_080A6A3C: .4byte sub_80A68A4
	thumb_func_end sub_80A68CC

	thumb_func_start sub_80A68F0
sub_80A68F0: @ 80A6A40
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6A60
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6A64
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6A60: .4byte gTasks
_080A6A64: .4byte sub_80546B8
	thumb_func_end sub_80A68F0

	thumb_func_start sub_80A6918
sub_80A6918: @ 80A6A68
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6A88
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6A8C
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AAC
	pop {r0}
	bx r0
	.align 2, 0
_080A6A88: .4byte gTasks
_080A6A8C: .4byte sub_80546B8
	thumb_func_end sub_80A6918

	thumb_func_start sub_80A6940
sub_80A6940: @ 80A6A90
	push {lr}
_080A6A92:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6AB8
	ldr r0, _080A6AB0
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6AB4
	strb r0, [r1]
	bl sub_80A699C
	b _080A6AC4
	.align 2, 0
_080A6AB0: .4byte sub_80A50C8
_080A6AB4: .4byte gUnknown_02038563
_080A6AB8:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6A92
_080A6AC4:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6940

	thumb_func_start sub_80A6978
sub_80A6978: @ 80A6AC8
	push {lr}
	ldr r1, _080A6AE0
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _080A6AE4
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, _080A6AE8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6AE0: .4byte gUnknown_02038559
_080A6AE4: .4byte gUnknown_03000701
_080A6AE8: .4byte sub_80A6940
	thumb_func_end sub_80A6978

	thumb_func_start sub_80A699C
sub_80A699C: @ 80A6AEC
	ldr r1, _080A6AFC
	ldr r0, _080A6B00
	str r0, [r1]
	ldr r1, _080A6B04
	movs r0, 0x4
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A6AFC: .4byte gUnknown_03000704
_080A6B00: .4byte gUnknown_083C16B8
_080A6B04: .4byte gUnknown_02038564
	thumb_func_end sub_80A699C

	thumb_func_start sub_80A69B8
sub_80A69B8: @ 80A6B08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6B28
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6B2C
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6B28: .4byte gTasks
_080A6B2C: .4byte sub_804E990
	thumb_func_end sub_80A69B8

	thumb_func_start sub_80A69E0
sub_80A69E0: @ 80A6B30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6B50
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6B54
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AAC
	pop {r0}
	bx r0
	.align 2, 0
_080A6B50: .4byte gTasks
_080A6B54: .4byte sub_804E990
	thumb_func_end sub_80A69E0

	thumb_func_start sub_80A6A08
sub_80A6A08: @ 80A6B58
	push {lr}
	bl sub_80A34B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6B72
	ldr r0, _080A6B78
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6B7C
	strb r0, [r1]
_080A6B72:
	pop {r0}
	bx r0
	.align 2, 0
_080A6B78: .4byte sub_80A50C8
_080A6B7C: .4byte gUnknown_02038563
	thumb_func_end sub_80A6A08

	thumb_func_start sub_80A6A30
sub_80A6A30: @ 80A6B80
	push {lr}
	ldr r0, _080A6B94
	movs r1, 0x6
	strb r1, [r0]
	ldr r0, _080A6B98
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6B94: .4byte gUnknown_03000701
_080A6B98: .4byte sub_80A6A08
	thumb_func_end sub_80A6A30

	thumb_func_start sub_80A6A4C
sub_80A6A4C: @ 80A6B9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6BC4
	ldr r1, _080A6BC8
	str r1, [r2]
	ldr r2, _080A6BCC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080A6BD0
	lsrs r2, r3, 16
	strh r2, [r1, 0x18]
	strh r3, [r1, 0x1A]
	bl sub_80A5AE4
	pop {r0}
	bx r0
	.align 2, 0
_080A6BC4: .4byte gUnknown_0300485C
_080A6BC8: .4byte sub_813A0F8
_080A6BCC: .4byte gTasks
_080A6BD0: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80A6A4C

	thumb_func_start sub_80A6A84
sub_80A6A84: @ 80A6BD4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r6, _080A6C38
	adds r0, r4, r6
	mov r8, r0
	ldr r0, _080A6C3C
	bl sub_80A4DA4
	ldr r0, _080A6C40
	ldrh r0, [r0]
	ldr r1, _080A6C44
	bl CopyItemName
	ldr r0, _080A6C48
	mov r2, r8
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xB
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0x7
	bl sub_80A7528
	adds r0, r5, 0
	bl sub_80A3D5C
	subs r6, 0x8
	adds r4, r6
	ldr r0, _080A6C4C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6C38: .4byte 0x03004b38
_080A6C3C: .4byte 0x020219cc
_080A6C40: .4byte gScriptItemId
_080A6C44: .4byte gStringVar1
_080A6C48: .4byte gStringVar2
_080A6C4C: .4byte sub_80A5E1C
	thumb_func_end sub_80A6A84

	thumb_func_start sub_80A6B00
sub_80A6B00: @ 80A6C50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A6CA4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A6C6A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6C9C
_080A6C6A:
	ldr r1, _080A6CA8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r1, _080A6CAC
	ldr r0, _080A6CB0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A5D38
_080A6C9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CA4: .4byte gMain
_080A6CA8: .4byte gTasks
_080A6CAC: .4byte gUnknown_03005D10
_080A6CB0: .4byte gUnknown_02038559
	thumb_func_end sub_80A6B00

	thumb_func_start sub_80A6B64
sub_80A6B64: @ 80A6CB4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r5, r0, 3
	ldr r6, _080A6CEC
	adds r7, r5, r6
	ldr r0, _080A6CF0
	mov r8, r0
	ldrh r0, [r0]
	bl ItemId_GetImportance
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080A6CF8
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080A6CF4
	str r1, [r0]
	movs r0, 0x9
	bl sub_80A7528
	b _080A6D22
	.align 2, 0
_080A6CEC: .4byte 0x03004b38
_080A6CF0: .4byte gScriptItemId
_080A6CF4: .4byte sub_80A6B00
_080A6CF8:
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r7, 0x2]
	bl AddPCItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6D12
	adds r0, r4, 0
	bl sub_80A6A84
	b _080A6D22
_080A6D12:
	adds r0, r6, 0
	subs r0, 0x8
	adds r0, r5, r0
	ldr r1, _080A6D2C
	str r1, [r0]
	movs r0, 0x8
	bl sub_80A7528
_080A6D22:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D2C: .4byte sub_80A6B00
	thumb_func_end sub_80A6B64

	thumb_func_start sub_80A6BE0
sub_80A6BE0: @ 80A6D30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_80A5350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A6DA8
	ldr r0, _080A6D68
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A6D70
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A6D6C
	bl sub_80A4DA4
	adds r0, r4, 0
	bl sub_80A6B64
	b _080A6DA8
	.align 2, 0
_080A6D68: .4byte gMain
_080A6D6C: .4byte 0x020219cc
_080A6D70:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A6DA8
	ldr r1, _080A6DB0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r1, _080A6DB4
	ldr r0, _080A6DB8
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl sub_80A5D38
_080A6DA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6DB0: .4byte gTasks
_080A6DB4: .4byte gUnknown_03005D10
_080A6DB8: .4byte gUnknown_02038559
	thumb_func_end sub_80A6BE0

	thumb_func_start sub_80A6C6C
sub_80A6C6C: @ 80A6DBC
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A6E34
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldr r2, _080A6E38
	ldr r6, _080A6E3C
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r5, 0x1C]
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	movs r0, 0x5
	bl PlaySE
	bl sub_80A7590
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x4
	beq _080A6E5A
	ldr r0, _080A6E40
	str r0, [r5]
	movs r0, 0x6
	bl sub_80A7528
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x3
	bne _080A6E44
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x6
	movs r2, 0x9
	movs r3, 0x7
	bl sub_80A4DD8
	b _080A6E64
	.align 2, 0
_080A6E34: .4byte gTasks
_080A6E38: .4byte gUnknown_03005D10
_080A6E3C: .4byte gUnknown_02038559
_080A6E40: .4byte sub_80A6BE0
_080A6E44:
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x2
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x9
	movs r3, 0x6
	bl sub_80A4DD8
	b _080A6E64
_080A6E5A:
	movs r0, 0x1
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	bl sub_80A6B64
_080A6E64:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A6C6C

	thumb_func_start sub_80A6D1C
sub_80A6D1C: @ 80A6E6C
	push {r4,r5,lr}
	bl HideMapNamePopUpWindow
	ldr r0, _080A6EC0
	ldr r1, _080A6EC4
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _080A6ED4
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080A6ED0
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80594C0
	bl sub_80597F4
	ldr r1, _080A6EC8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrh r0, [r4]
	bl ItemId_GetFieldFunc
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A6ECC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0xC]
	b _080A6EDA
	.align 2, 0
_080A6EC0: .4byte gSaveBlock1
_080A6EC4: .4byte 0x00000496
_080A6EC8: .4byte gScriptItemId
_080A6ECC: .4byte gTasks
_080A6ED0:
	movs r0, 0
	strh r0, [r4]
_080A6ED4:
	ldr r0, _080A6EE4
	bl ScriptContext1_SetupScript
_080A6EDA:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6EE4: .4byte Event_NoRegisteredItem
	thumb_func_end sub_80A6D1C

	thumb_func_start sub_80A6D98
sub_80A6D98: @ 80A6EE8
	push {lr}
_080A6EEA:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6F0C
	ldr r0, _080A6F04
	movs r1, 0
	bl CreateTask
	ldr r1, _080A6F08
	strb r0, [r1]
	b _080A6F18
	.align 2, 0
_080A6F04: .4byte sub_80A50C8
_080A6F08: .4byte gUnknown_02038563
_080A6F0C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A6EEA
_080A6F18:
	pop {r0}
	bx r0
	thumb_func_end sub_80A6D98

	thumb_func_start sub_80A6DCC
sub_80A6DCC: @ 80A6F1C
	push {lr}
	ldr r1, _080A6F34
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080A6F38
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080A6F3C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080A6F34: .4byte gUnknown_03000700
_080A6F38: .4byte gUnknown_03000701
_080A6F3C: .4byte sub_80A6D98
	thumb_func_end sub_80A6DCC

	thumb_func_start sub_80A6DF0
sub_80A6DF0: @ 80A6F40
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r4, _080A6F9C
	ldrb r0, [r4]
	subs r0, 0x1
	lsls r0, 25
	lsrs r6, r0, 24
	movs r1, 0x9
	subs r1, r6
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x7
	movs r2, 0xD
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r2, 0xA
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x8
	movs r3, 0x5
	bl sub_80A4008
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A6FA8
	ldr r1, _080A6FA0
	ldr r0, _080A6FA4
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0xA
	bl MenuPrint
	b _080A6FD0
	.align 2, 0
_080A6F9C: .4byte gUnknown_02038564
_080A6FA0: .4byte gUnknown_083C1640
_080A6FA4: .4byte gUnknown_03000704
_080A6FA8:
	ldr r5, _080A6FFC
	ldr r4, _080A7000
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0x8
	bl MenuPrint
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	movs r1, 0x8
	movs r2, 0xA
	bl MenuPrint
_080A6FD0:
	movs r2, 0xA
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080A7004
	ldrb r3, [r0]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x8
	bl InitMenu
	movs r0, 0x2
	bl sub_80A7528
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6FFC: .4byte gUnknown_083C1640
_080A7000: .4byte gUnknown_03000704
_080A7004: .4byte gUnknown_02038564
	thumb_func_end sub_80A6DF0

	thumb_func_start sub_80A6EB8
sub_80A6EB8: @ 80A7008
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r2, _080A7030
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080A7038
	ldr r4, _080A7034
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7110
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080A7052
	.align 2, 0
_080A7030: .4byte gMain
_080A7034: .4byte gUnknown_03000700
_080A7038:
	cmp r1, 0x80
	bne _080A7064
	ldr r4, _080A705C
	ldrb r0, [r4]
	adds r0, 0x1
	ldr r1, _080A7060
	ldrb r1, [r1]
	cmp r0, r1
	bge _080A7110
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080A7052:
	bl MoveMenuCursor
	strb r0, [r4]
	b _080A7110
	.align 2, 0
_080A705C: .4byte gUnknown_03000700
_080A7060: .4byte gUnknown_02038564
_080A7064:
	ldrh r1, [r2, 0x2E]
	movs r2, 0x1
	ands r2, r1
	cmp r2, 0
	beq _080A70D4
	ldr r1, _080A70B8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r1, _080A70BC
	ldr r0, _080A70C0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A70C4
	bl sub_80A4DA4
	ldr r1, _080A70C8
	ldr r0, _080A70CC
	ldrb r2, [r0]
	ldr r0, _080A70D0
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080A7110
	.align 2, 0
_080A70B8: .4byte gTasks
_080A70BC: .4byte gUnknown_03005D10
_080A70C0: .4byte gUnknown_02038559
_080A70C4: .4byte 0x020219cc
_080A70C8: .4byte gUnknown_083C1640
_080A70CC: .4byte gUnknown_03000700
_080A70D0: .4byte gUnknown_03000704
_080A70D4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080A7110
	ldr r1, _080A7118
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r1, _080A711C
	ldr r0, _080A7120
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	ldr r0, _080A7124
	bl sub_80A4DA4
	ldr r0, _080A7128
	ldr r1, [r0, 0x2C]
	adds r0, r5, 0
	bl _call_via_r1
_080A7110:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7118: .4byte gTasks
_080A711C: .4byte gUnknown_03005D10
_080A7120: .4byte gUnknown_02038559
_080A7124: .4byte 0x020219cc
_080A7128: .4byte gUnknown_083C1640
	thumb_func_end sub_80A6EB8

	thumb_func_start sub_80A6FDC
sub_80A6FDC: @ 80A712C
	push {lr}
	ldr r0, _080A7148
	ldrh r0, [r0]
	bl ItemId_GetBattleUsage
	lsls r0, 24
	cmp r0, 0
	beq _080A7158
	ldr r1, _080A714C
	ldr r0, _080A7150
	str r0, [r1]
	ldr r1, _080A7154
	movs r0, 0x2
	b _080A7162
	.align 2, 0
_080A7148: .4byte gScriptItemId
_080A714C: .4byte gUnknown_03000704
_080A7150: .4byte gUnknown_083C1708
_080A7154: .4byte gUnknown_02038564
_080A7158:
	ldr r1, _080A7168
	ldr r0, _080A716C
	str r0, [r1]
	ldr r1, _080A7170
	movs r0, 0x1
_080A7162:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A7168: .4byte gUnknown_03000704
_080A716C: .4byte gUnknown_083C170A
_080A7170: .4byte gUnknown_02038564
	thumb_func_end sub_80A6FDC

	thumb_func_start sub_80A7024
sub_80A7024: @ 80A7174
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080A71CC
	movs r0, 0
	strb r0, [r1]
	bl sub_80A6FDC
	ldr r0, _080A71D0
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldr r3, _080A71D4
	ldr r2, _080A71D8
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r4, 0x1C]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r0, _080A71DC
	bl sub_80A6DF0
	ldr r0, _080A71E0
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A71CC: .4byte gUnknown_03000700
_080A71D0: .4byte gTasks
_080A71D4: .4byte gUnknown_03005D10
_080A71D8: .4byte gUnknown_02038559
_080A71DC: .4byte 0x020219cc
_080A71E0: .4byte sub_80A6EB8
	thumb_func_end sub_80A7024

	thumb_func_start sub_80A7094
sub_80A7094: @ 80A71E4
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A721C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080A7220
	lsrs r0, r2, 16
	movs r3, 0
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080A7224
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080A721C: .4byte gTasks
_080A7220: .4byte sub_802E424
_080A7224: .4byte sub_80A5B00
	thumb_func_end sub_80A7094

	thumb_func_start sub_80A70D8
sub_80A70D8: @ 80A7228
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80A7094
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A70D8

	thumb_func_start ItemMenu_UseInBattle
ItemMenu_UseInBattle: @ 80A7244
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A7270
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	cmp r0, 0
	beq _080A726A
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	bl ItemId_GetBattleFunc
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
_080A726A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7270: .4byte gScriptItemId
	thumb_func_end ItemMenu_UseInBattle

	thumb_func_start sub_80A7124
sub_80A7124: @ 80A7274
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80A7528
	adds r0, r4, 0
	bl sub_80A41D4
	bl ItemListMenu_InitMenu
	adds r0, r4, 0
	bl sub_80A37C0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7124

	thumb_func_start sub_80A7150
sub_80A7150: @ 80A72A0
	push {r4,r5,lr}
	ldr r4, _080A72A8
	ldr r5, _080A72AC
	b _080A72BC
	.align 2, 0
_080A72A8: .4byte gUnknown_02038563
_080A72AC: .4byte gTasks
_080A72B0:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A72E0
_080A72BC:
	bl sub_80A317C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A72B0
	ldr r0, _080A72E8
	movs r1, 0
	bl CreateTask
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x26]
_080A72E0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A72E8: .4byte sub_80A7230
	thumb_func_end sub_80A7150

	thumb_func_start PrepareBagForWallyTutorial
PrepareBagForWallyTutorial: @ 80A72EC
	push {r4,r5,lr}
	ldr r0, _080A7364
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080A7368
	strb r1, [r0]
	movs r1, 0
	ldr r4, _080A736C
	ldr r5, _080A7370
	ldr r3, _080A7374
	movs r2, 0
_080A7302:
	lsls r0, r1, 2
	adds r0, r3
	strb r2, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080A7302
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	movs r1, 0x80
	lsls r1, 5
	adds r0, r4, r1
	adds r4, r5, 0
	adds r4, 0xA0
	adds r1, r4, 0
	movs r2, 0x40
	bl memcpy
	adds r0, r5, 0
	movs r1, 0x14
	bl ClearItemSlots
	adds r0, r4, 0
	movs r1, 0x10
	bl ClearItemSlots
	movs r0, 0xD
	movs r1, 0x1
	bl AddBagItem
	movs r0, 0x4
	movs r1, 0x1
	bl AddBagItem
	ldr r1, _080A7378
	movs r0, 0x7
	strb r0, [r1]
	ldr r0, _080A737C
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7364: .4byte gUnknown_03000700
_080A7368: .4byte gUnknown_02038559
_080A736C: .4byte 0x0201e000
_080A7370: .4byte 0x02025c94
_080A7374: .4byte gUnknown_03005D10
_080A7378: .4byte gUnknown_03000701
_080A737C: .4byte sub_80A7150
	thumb_func_end PrepareBagForWallyTutorial

	thumb_func_start sub_80A7230
sub_80A7230: @ 80A7380
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r0, _080A73AC
	mov r8, r0
	adds r7, r6, r0
	movs r0, 0x1E
	ldrsh r1, [r7, r0]
	cmp r1, 0xCC
	beq _080A73CA
	cmp r1, 0xCC
	bgt _080A73B0
	cmp r1, 0x66
	beq _080A73BA
	b _080A74A8
	.align 2, 0
_080A73AC: .4byte 0x03004b38
_080A73B0:
	movs r0, 0x99
	lsls r0, 1
	cmp r1, r0
	beq _080A7444
	b _080A74A8
_080A73BA:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0x2
	bl sub_80A4E8C
	b _080A74A8
_080A73CA:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x2
	bl sub_80F98A4
	movs r0, 0x3
	bl sub_80F98A4
	ldr r1, _080A7428
	movs r0, 0x4
	strh r0, [r1]
	ldr r1, _080A742C
	ldr r0, _080A7430
	str r0, [r1]
	ldr r1, _080A7434
	movs r0, 0x2
	strb r0, [r1]
	mov r0, r8
	adds r4, r0, r6
	ldr r3, _080A7438
	ldr r2, _080A743C
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	adds r1, 0x1
	strh r1, [r4, 0x14]
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80A48E8
	bl sub_80A73FC
	ldr r0, _080A7440
	bl sub_80A6DF0
	b _080A74A8
	.align 2, 0
_080A7428: .4byte gScriptItemId
_080A742C: .4byte gUnknown_03000704
_080A7430: .4byte gUnknown_083C1708
_080A7434: .4byte gUnknown_02038564
_080A7438: .4byte gUnknown_03005D10
_080A743C: .4byte gUnknown_02038559
_080A7440: .4byte 0x020219cc
_080A7444:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080A7494
	bl sub_80A4DA4
	ldr r4, _080A7498
	ldr r5, _080A749C
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x50
	bl memcpy
	adds r4, 0xA0
	movs r0, 0x80
	lsls r0, 5
	adds r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x40
	bl memcpy
	ldr r1, _080A74A0
	lsrs r0, r1, 16
	strh r0, [r7, 0x10]
	strh r1, [r7, 0x12]
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080A74A4
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080A74AE
	.align 2, 0
_080A7494: .4byte 0x020219cc
_080A7498: .4byte 0x02025c94
_080A749C: .4byte 0x0201e000
_080A74A0: .4byte sub_802E424
_080A74A4: .4byte sub_80A5B00
_080A74A8:
	ldrh r0, [r7, 0x1E]
	adds r0, 0x1
	strh r0, [r7, 0x1E]
_080A74AE:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7230

	thumb_func_start ItemListMenu_InitMenu
ItemListMenu_InitMenu: @ 80A74BC
	push {lr}
	sub sp, 0x8
	ldr r1, _080A7500
	ldr r0, _080A7504
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xE
	movs r2, 0x2
	bl InitMenu
	ldr r1, _080A7508
	ldr r3, _080A750C
	movs r0, 0xF
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	bl sub_80A73C0
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080A7500: .4byte gUnknown_03005D10
_080A7504: .4byte gUnknown_02038559
_080A7508: .4byte 0x0000ffff
_080A750C: .4byte 0x00002d9f
	thumb_func_end ItemListMenu_InitMenu

	thumb_func_start sub_80A73C0
sub_80A73C0: @ 80A7510
	push {lr}
	ldr r1, _080A7538
	ldr r0, _080A753C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 28
	movs r0, 0x80
	lsls r0, 21
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x70
	bl sub_814AD7C
	pop {r0}
	bx r0
	.align 2, 0
_080A7538: .4byte gUnknown_03005D10
_080A753C: .4byte gUnknown_02038559
	thumb_func_end sub_80A73C0

	thumb_func_start sub_80A73F0
sub_80A73F0: @ 80A7540
	push {lr}
	bl sub_814ADC8
	pop {r0}
	bx r0
	thumb_func_end sub_80A73F0

	thumb_func_start sub_80A73FC
sub_80A73FC: @ 80A754C
	push {lr}
	bl sub_8072DEC
	bl sub_814AD44
	pop {r0}
	bx r0
	thumb_func_end sub_80A73FC

	thumb_func_start sub_80A740C
sub_80A740C: @ 80A755C
	push {lr}
	bl sub_80A75E4
	bl sub_80A7768
	bl sub_80A7420
	pop {r0}
	bx r0
	thumb_func_end sub_80A740C

	thumb_func_start sub_80A7420
sub_80A7420: @ 80A7570
	push {r4,lr}
	ldr r4, _080A7588
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080A758C
	cmp r0, 0x3
	beq _080A7580
	b _080A7662
_080A7580:
	movs r0, 0x2
	strb r0, [r4]
	b _080A7662
	.align 2, 0
_080A7588: .4byte gUnknown_0203853C
_080A758C:
	ldrb r0, [r4, 0x2]
	cmp r0, 0x9
	bhi _080A764C
	lsls r0, 2
	ldr r1, _080A759C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A759C: .4byte _080A75A0
	.align 2, 0
_080A75A0:
	.4byte _080A75C8
	.4byte _080A75FC
	.4byte _080A7604
	.4byte _080A760C
	.4byte _080A7614
	.4byte _080A761C
	.4byte _080A7624
	.4byte _080A762C
	.4byte _080A7634
	.4byte _080A7644
_080A75C8:
	ldr r1, _080A75F0
	ldr r0, _080A75F4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _080A75F8
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	ldrb r1, [r4, 0x1]
	bl ItemListMenu_ChangeDescription
	b _080A764C
	.align 2, 0
_080A75F0: .4byte gUnknown_03005D10
_080A75F4: .4byte gUnknown_02038559
_080A75F8: .4byte gUnknown_03005D24
_080A75FC:
	ldr r0, _080A7600
	b _080A7636
	.align 2, 0
_080A7600: .4byte gOtherText_SwitchWhichItem
_080A7604:
	ldr r0, _080A7608
	b _080A7636
	.align 2, 0
_080A7608: .4byte gOtherText_WhatWillYouDo2
_080A760C:
	ldr r0, _080A7610
	b _080A7636
	.align 2, 0
_080A7610: .4byte gOtherText_HowManyToToss
_080A7614:
	ldr r0, _080A7618
	b _080A7636
	.align 2, 0
_080A7618: .4byte gOtherText_ThrewAwayItem
_080A761C:
	ldr r0, _080A7620
	b _080A7636
	.align 2, 0
_080A7620: .4byte gOtherText_OkayToThrowAwayPrompt
_080A7624:
	ldr r0, _080A7628
	b _080A7636
	.align 2, 0
_080A7628: .4byte gOtherText_HowManyToDeposit
_080A762C:
	ldr r0, _080A7630
	b _080A7636
	.align 2, 0
_080A7630: .4byte gOtherText_DepositedItems
_080A7634:
	ldr r0, _080A7640
_080A7636:
	ldrb r1, [r4, 0x1]
	bl sub_80A4A98
	b _080A764C
	.align 2, 0
_080A7640: .4byte gOtherText_NoRoomForItems
_080A7644:
	ldr r0, _080A7668
	ldrb r1, [r4, 0x1]
	bl sub_80A4A98
_080A764C:
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080A7662
	movs r0, 0
	strb r0, [r4]
	bl sub_80A7918
_080A7662:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7668: .4byte gOtherText_CantStoreSomeoneItem
	thumb_func_end sub_80A7420

	thumb_func_start sub_80A751C
sub_80A751C: @ 80A766C
	ldr r1, _080A7674
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7674: .4byte gUnknown_0203853C
	thumb_func_end sub_80A751C

	thumb_func_start sub_80A7528
sub_80A7528: @ 80A7678
	push {r4,lr}
	ldr r4, _080A7694
	movs r1, 0
	strb r1, [r4, 0x1]
	strb r0, [r4, 0x2]
	bl sub_80A78F4
	cmp r0, 0x1
	beq _080A76AE
	cmp r0, 0x1
	bgt _080A7698
	cmp r0, 0
	beq _080A769E
	b _080A76B6
	.align 2, 0
_080A7694: .4byte gUnknown_0203853C
_080A7698:
	cmp r0, 0x2
	beq _080A76B2
	b _080A76B6
_080A769E:
	movs r0, 0x2
	strb r0, [r4]
_080A76A2:
	bl sub_80A7420
	ldrb r0, [r4]
	cmp r0, 0
	bne _080A76A2
	b _080A76B6
_080A76AE:
	movs r0, 0x3
	b _080A76B4
_080A76B2:
	movs r0, 0x1
_080A76B4:
	strb r0, [r4]
_080A76B6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7528

	thumb_func_start sub_80A756C
sub_80A756C: @ 80A76BC
	push {r4,lr}
	ldr r4, _080A76DC
	ldrb r0, [r4]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A76D0
	bl sub_80A7918
_080A76D0:
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A76DC: .4byte gUnknown_0203853C
	thumb_func_end sub_80A756C

	thumb_func_start sub_80A7590
sub_80A7590: @ 80A76E0
	push {lr}
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	bl sub_80A756C
	pop {r0}
	bx r0
	thumb_func_end sub_80A7590

	thumb_func_start sub_80A75A8
sub_80A75A8: @ 80A76F8
	push {lr}
	ldr r1, _080A7710
	ldrb r0, [r1]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A770C
	movs r0, 0x1
	strb r0, [r1]
_080A770C:
	pop {r0}
	bx r0
	.align 2, 0
_080A7710: .4byte gUnknown_0203853C
	thumb_func_end sub_80A75A8

	thumb_func_start sub_80A75C4
sub_80A75C4: @ 80A7714
	push {lr}
	ldr r1, _080A7728
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A772C
	cmp r0, 0x1
	bne _080A7730
	movs r0, 0x3
	strb r0, [r1]
	b _080A7730
	.align 2, 0
_080A7728: .4byte gUnknown_0203853C
_080A772C:
	bl sub_80A7918
_080A7730:
	pop {r0}
	bx r0
	thumb_func_end sub_80A75C4

	thumb_func_start sub_80A75E4
sub_80A75E4: @ 80A7734
	push {r4,r5,lr}
	ldr r4, _080A7778
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7772
	bl sub_80A7988
	adds r5, r0, 0
	cmp r5, 0
	bne _080A7772
	ldr r0, _080A777C
	ldrb r0, [r0]
	ldrb r2, [r4, 0x1]
	adds r1, r2, 0
	movs r3, 0x1
	bl sub_80A47E8
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x2]
	movs r1, 0x7
	cmp r0, 0
	beq _080A7766
	movs r1, 0x5
_080A7766:
	ldrb r0, [r4, 0x1]
	cmp r1, r0
	bge _080A7772
	strb r5, [r4]
	bl sub_80A78E8
_080A7772:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7778: .4byte gUnknown_02038540
_080A777C: .4byte gUnknown_02038563
	thumb_func_end sub_80A75E4

	thumb_func_start sub_80A7630
sub_80A7630: @ 80A7780
	ldr r1, _080A7788
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7788: .4byte gUnknown_02038540
	thumb_func_end sub_80A7630

	thumb_func_start sub_80A763C
sub_80A763C: @ 80A778C
	push {r4,lr}
	ldr r4, _080A77A0
	bl sub_80A78C4
	adds r1, r0, 0
	cmp r1, 0
	beq _080A77A4
	cmp r1, 0x1
	beq _080A77B8
	b _080A77C0
	.align 2, 0
_080A77A0: .4byte gUnknown_02038540
_080A77A4:
	ldr r0, _080A77B4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0x7
	bl sub_80A48E8
	b _080A77C0
	.align 2, 0
_080A77B4: .4byte gUnknown_02038563
_080A77B8:
	movs r0, 0
	strb r1, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
_080A77C0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A763C

	thumb_func_start sub_80A7678
sub_80A7678: @ 80A77C8
	push {r4,lr}
	ldr r4, _080A77E0
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A77D6
	bl sub_80A78E8
_080A77D6:
	movs r0, 0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A77E0: .4byte gUnknown_02038540
	thumb_func_end sub_80A7678

	thumb_func_start sub_80A7694
sub_80A7694: @ 80A77E4
	ldr r1, _080A77EC
	movs r0, 0x1
	strb r0, [r1, 0x2]
	bx lr
	.align 2, 0
_080A77EC: .4byte gUnknown_02038540
	thumb_func_end sub_80A7694

	thumb_func_start sub_80A76A0
sub_80A76A0: @ 80A77F0
	push {lr}
	movs r0, 0xE
	movs r1, 0x2
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	bl sub_80A7678
	pop {r0}
	bx r0
	thumb_func_end sub_80A76A0

	thumb_func_start sub_80A76B8
sub_80A76B8: @ 80A7808
	push {lr}
	ldr r0, _080A781C
	movs r1, 0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A7816
	movs r1, 0x1
_080A7816:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A781C: .4byte gUnknown_02038540
	thumb_func_end sub_80A76B8

	thumb_func_start sub_80A76D0
sub_80A76D0: @ 80A7820
	push {lr}
	ldr r0, _080A7834
	movs r1, 0
	ldrb r0, [r0, 0x1]
	cmp r0, 0x5
	bls _080A782E
	movs r1, 0x1
_080A782E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A7834: .4byte gUnknown_02038540
	thumb_func_end sub_80A76D0

	thumb_func_start sub_80A76E8
sub_80A76E8: @ 80A7838
	push {r4,lr}
	ldr r4, _080A7858
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080A7852
	ldrb r0, [r4, 0x1]
	ldr r1, [r4, 0x4]
	ldr r2, [r4, 0x8]
	ldrh r3, [r4, 0x2]
	bl DisplayItemMessageOnField
	movs r0, 0
	strb r0, [r4]
_080A7852:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7858: .4byte gUnknown_02038544
	thumb_func_end sub_80A76E8

	thumb_func_start sub_80A770C
sub_80A770C: @ 80A785C
	ldr r1, _080A7864
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7864: .4byte gUnknown_02038544
	thumb_func_end sub_80A770C

	thumb_func_start DisplayCannotUseItemMessage
DisplayCannotUseItemMessage: @ 80A7868
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	ldr r4, _080A7888
	bl sub_80A7924
	cmp r0, 0
	beq _080A788C
	cmp r0, 0x2
	beq _080A789E
	b _080A78AC
	.align 2, 0
_080A7888: .4byte gUnknown_02038544
_080A788C:
	lsls r0, r5, 24
	lsrs r0, 24
	lsls r3, r6, 16
	lsrs r3, 16
	adds r1, r7, 0
	mov r2, r8
	bl DisplayItemMessageOnField
	b _080A78AC
_080A789E:
	movs r0, 0x1
	strb r0, [r4]
	strb r5, [r4, 0x1]
	str r7, [r4, 0x4]
	mov r0, r8
	str r0, [r4, 0x8]
	strh r6, [r4, 0x2]
_080A78AC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DisplayCannotUseItemMessage

	thumb_func_start sub_80A7768
sub_80A7768: @ 80A78B8
	push {r4,lr}
	ldr r4, _080A78F8
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _080A7964
	ldrb r1, [r4, 0x1]
	cmp r1, 0
	beq _080A795E
	ldrb r0, [r4, 0x2]
	cmp r0, 0x1
	beq _080A7904
	ldr r2, _080A78FC
	ldr r0, _080A7900
	ldr r0, [r0]
	adds r0, r1, r0
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0]
	subs r1, 0x1
	lsls r1, 1
	adds r1, 0x1
	ldrb r2, [r4, 0x3]
	adds r2, r1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x7
	bl MenuPrint
	b _080A794C
	.align 2, 0
_080A78F8: .4byte gUnknown_02038550
_080A78FC: .4byte gUnknown_083C1640
_080A7900: .4byte gUnknown_03000704
_080A7904:
	cmp r1, 0x1
	bne _080A7918
	ldr r0, _080A7914
	ldrh r0, [r0]
	bl sub_80A4B90
	adds r3, r0, 0
	b _080A792C
	.align 2, 0
_080A7914: .4byte gScriptItemId
_080A7918:
	ldr r2, _080A796C
	ldrb r0, [r4, 0x1]
	ldr r1, _080A7970
	ldr r1, [r1]
	adds r0, r1
	subs r0, 0x1
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r3, [r0]
_080A792C:
	ldrb r2, [r4, 0x1]
	subs r2, 0x1
	asrs r0, r2, 1
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	ands r2, r0
	lsls r2, 1
	adds r2, 0x8
	adds r0, r3, 0
	bl MenuPrint
_080A794C:
	ldr r1, _080A7974
	ldrb r0, [r4, 0x1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080A795E
	movs r0, 0
	strb r0, [r4]
	bl sub_80A7970
_080A795E:
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
	strb r0, [r4, 0x1]
_080A7964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A796C: .4byte gUnknown_083C1640
_080A7970: .4byte gUnknown_03000704
_080A7974: .4byte gUnknown_02038564
	thumb_func_end sub_80A7768

	thumb_func_start sub_80A7828
sub_80A7828: @ 80A7978
	ldr r1, _080A7980
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7980: .4byte gUnknown_02038550
	thumb_func_end sub_80A7828

	thumb_func_start sub_80A7834
sub_80A7834: @ 80A7984
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, _080A799C
	bl sub_80A7958
	cmp r0, 0x1
	beq _080A79A0
	cmp r0, 0x2
	beq _080A79A6
	b _080A79B2
	.align 2, 0
_080A799C: .4byte gUnknown_02038550
_080A79A0:
	movs r1, 0
	movs r0, 0x2
	b _080A79AA
_080A79A6:
	movs r1, 0
	movs r0, 0x1
_080A79AA:
	strb r0, [r4]
	strb r1, [r4, 0x1]
	strb r5, [r4, 0x2]
	strb r6, [r4, 0x3]
_080A79B2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7834

	thumb_func_start sub_80A7868
sub_80A7868: @ 80A79B8
	push {lr}
	ldr r1, _080A79CC
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _080A79C6
	movs r0, 0x1
	strb r0, [r1]
_080A79C6:
	pop {r0}
	bx r0
	.align 2, 0
_080A79CC: .4byte gUnknown_02038550
	thumb_func_end sub_80A7868

	thumb_func_start sub_80A7880
sub_80A7880: @ 80A79D0
	push {lr}
	ldr r1, _080A79E4
	ldrb r0, [r1]
	cmp r0, 0
	beq _080A79E8
	cmp r0, 0x1
	bne _080A79EC
	movs r0, 0x2
	strb r0, [r1]
	b _080A79EC
	.align 2, 0
_080A79E4: .4byte gUnknown_02038550
_080A79E8:
	bl sub_80A7970
_080A79EC:
	pop {r0}
	bx r0
	thumb_func_end sub_80A7880

	thumb_func_start sub_80A78A0
sub_80A78A0: @ 80A79F0
	push {lr}
	ldr r0, _080A7A04
	movs r1, 0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A79FE
	movs r1, 0x1
_080A79FE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A7A04: .4byte gUnknown_02038550
	thumb_func_end sub_80A78A0

	thumb_func_start sub_80A78B8
sub_80A78B8: @ 80A7A08
	ldr r1, _080A7A10
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7A10: .4byte gUnknown_02038554
	thumb_func_end sub_80A78B8

	thumb_func_start sub_80A78C4
sub_80A78C4: @ 80A7A14
	push {lr}
	ldr r0, _080A7A2C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7A30
	bl sub_80A7868
	bl sub_80A75A8
	movs r0, 0x1
	b _080A7A32
	.align 2, 0
_080A7A2C: .4byte gLinkOpen
_080A7A30:
	movs r0, 0
_080A7A32:
	pop {r1}
	bx r1
	thumb_func_end sub_80A78C4

	thumb_func_start sub_80A78E8
sub_80A78E8: @ 80A7A38
	push {lr}
	bl sub_80A7880
	pop {r0}
	bx r0
	thumb_func_end sub_80A78E8

	thumb_func_start sub_80A78F4
sub_80A78F4: @ 80A7A44
	push {lr}
	ldr r0, _080A7A5C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7A60
	bl sub_80A76B8
	movs r1, 0x2
	cmp r0, 0
	beq _080A7A62
	movs r1, 0x1
	b _080A7A62
	.align 2, 0
_080A7A5C: .4byte gLinkOpen
_080A7A60:
	movs r1, 0
_080A7A62:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80A78F4

	thumb_func_start sub_80A7918
sub_80A7918: @ 80A7A68
	push {lr}
	bl sub_80A76E8
	pop {r0}
	bx r0
	thumb_func_end sub_80A7918

	thumb_func_start sub_80A7924
sub_80A7924: @ 80A7A74
	push {lr}
	ldr r0, _080A7A98
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080A7A92
	bl sub_80A76B8
	cmp r0, 0
	bne _080A7A92
	bl sub_80A76D0
	cmp r0, 0
	beq _080A7A9C
	bl sub_80A7678
_080A7A92:
	movs r0, 0
	b _080A7AA2
	.align 2, 0
_080A7A98: .4byte gLinkOpen
_080A7A9C:
	bl sub_80A7694
	movs r0, 0x2
_080A7AA2:
	pop {r1}
	bx r1
	thumb_func_end sub_80A7924

	thumb_func_start sub_80A7958
sub_80A7958: @ 80A7AA8
	push {lr}
	bl sub_80A76B8
	cmp r0, 0
	beq _080A7ABA
	bl sub_80A75A8
	movs r0, 0x1
	b _080A7ABC
_080A7ABA:
	movs r0, 0x2
_080A7ABC:
	pop {r1}
	bx r1
	thumb_func_end sub_80A7958

	thumb_func_start sub_80A7970
sub_80A7970: @ 80A7AC0
	push {lr}
	bl sub_80A75C4
	pop {r0}
	bx r0
	thumb_func_end sub_80A7970

	thumb_func_start sub_80A797C
sub_80A797C: @ 80A7ACC
	ldr r1, _080A7AD4
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080A7AD4: .4byte gUnknown_02038554
	thumb_func_end sub_80A797C

	thumb_func_start sub_80A7988
sub_80A7988: @ 80A7AD8
	ldr r1, _080A7AE4
	ldrb r0, [r1]
	movs r2, 0
	strb r2, [r1]
	bx lr
	.align 2, 0
_080A7AE4: .4byte gUnknown_02038554
	thumb_func_end sub_80A7988

	thumb_func_start sub_80A7998
sub_80A7998: @ 80A7AE8
	adds r2, r0, 0
	adds r2, 0x2A
	movs r1, 0
	strb r1, [r2]
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	ldr r1, _080A7B00
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A7B00: .4byte sub_80A79B4
	thumb_func_end sub_80A7998

	thumb_func_start sub_80A79B4
sub_80A79B4: @ 80A7B04
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A7B34
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080A7B1C
	adds r0, r4, 0
	bl sub_80A79EC
_080A7B1C:
	ldr r0, _080A7B38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080A7B2E
	adds r0, r4, 0
	bl sub_80A7A94
_080A7B2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B34: .4byte gUnknown_0203855B
_080A7B38: .4byte gUnknown_0203855C
	thumb_func_end sub_80A79B4

	thumb_func_start sub_80A79EC
sub_80A79EC: @ 80A7B3C
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r0, 0x34
	ldrsh r4, [r2, r0]
	cmp r4, 0
	beq _080A7B4E
	cmp r4, 0x1
	beq _080A7BA4
	b _080A7BDA
_080A7B4E:
	ldr r5, _080A7B78
	ldrb r6, [r5]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x6
	beq _080A7B7C
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r6, [r0]
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
	strb r0, [r5]
	b _080A7BDA
	.align 2, 0
_080A7B78: .4byte gUnknown_0203855B
_080A7B7C:
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r4, [r0]
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x34]
	adds r0, r2, 0
	bl sub_80A7AE4
	b _080A7BDA
_080A7BA4:
	ldrh r4, [r2, 0x2E]
	movs r0, 0x2E
	ldrsh r3, [r2, r0]
	cmp r3, 0
	beq _080A7BCC
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080A7BC2
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
	subs r0, r4, 0x1
	strh r0, [r2, 0x2E]
_080A7BC2:
	adds r0, r1, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x30]
	b _080A7BDA
_080A7BCC:
	ldr r1, _080A7BE0
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r1]
	strh r3, [r2, 0x30]
	strh r3, [r2, 0x34]
_080A7BDA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7BE0: .4byte gUnknown_0203855B
	thumb_func_end sub_80A79EC

	thumb_func_start sub_80A7A94
sub_80A7A94: @ 80A7BE4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7BF6
	cmp r0, 0x1
	beq _080A7C18
	b _080A7C2C
_080A7BF6:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7C14
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080A7C2C
	.align 2, 0
_080A7C14: .4byte gSpriteAffineAnimTable_83C1CC4
_080A7C18:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080A7C2C
	adds r0, r4, 0
	bl sub_80A7AE4
_080A7C2C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7A94

	thumb_func_start sub_80A7AE4
sub_80A7AE4: @ 80A7C34
	push {lr}
	ldr r2, _080A7C5C
	movs r1, 0
	strb r1, [r2]
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x36]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	pop {r0}
	bx r0
	.align 2, 0
_080A7C5C: .4byte gUnknown_0203855C
	thumb_func_end sub_80A7AE4

	thumb_func_start CreateBagSprite
CreateBagSprite: @ 80A7C60
	push {lr}
	ldr r0, _080A7C74
	movs r1, 0x3A
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	pop {r0}
	bx r0
	.align 2, 0
_080A7C74: .4byte gSpriteTemplate_83C1CE0
	thumb_func_end CreateBagSprite

	thumb_func_start sub_80A7B28
sub_80A7B28: @ 80A7C78
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B6C
	ldr r0, _080A7C94
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C94: .4byte sub_80A7B6C
	thumb_func_end sub_80A7B28

	thumb_func_start sub_80A7B48
sub_80A7B48: @ 80A7C98
	ldrh r2, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	movs r3, 0x1
	ands r1, r3
	subs r2, r1
	adds r1, r0, 0
	adds r1, 0x28
	strb r2, [r1]
	ldrh r2, [r0, 0x3A]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	ands r1, r3
	subs r2, r1
	adds r0, 0x29
	strb r2, [r0]
	bx lr
	thumb_func_end sub_80A7B48

	thumb_func_start sub_80A7B6C
sub_80A7B6C: @ 80A7CBC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080A7D66
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7CD6
	cmp r0, 0x1
	beq _080A7D24
	b _080A7D66
_080A7CD6:
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r4, 0x1]
	cmp r2, 0x1
	bne _080A7CF0
	ldr r0, _080A7CEC
	b _080A7CF2
	.align 2, 0
_080A7CEC: .4byte gSpriteAffineAnimTable_83C1D20
_080A7CF0:
	ldr r0, _080A7D20
_080A7CF2:
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	adds r0, r4, 0
	bl sub_80A7B48
	b _080A7D66
	.align 2, 0
_080A7D20: .4byte 0x083cdb7c
_080A7D24:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B48
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _080A7D66
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x34]
	ldrh r1, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	ldrh r0, [r4, 0x3A]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7D6C
	str r0, [r4, 0x1C]
_080A7D66:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D6C: .4byte SpriteCallbackDummy
	thumb_func_end sub_80A7B6C

	thumb_func_start CreateBagPokeballSprite
CreateBagPokeballSprite: @ 80A7D70
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A7DA4
	bl LoadSpritePalette
	ldr r0, _080A7DA8
	movs r1, 0x10
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	ldr r1, _080A7DAC
	strb r0, [r1]
	ldr r2, _080A7DB0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7DA4: .4byte gUnknown_083C1D30
_080A7DA8: .4byte gSpriteTemplate_83C1D38
_080A7DAC: .4byte gUnknown_02038568
_080A7DB0: .4byte gSprites
	thumb_func_end CreateBagPokeballSprite

	thumb_func_start sub_80A7C64
sub_80A7C64: @ 80A7DB4
	push {r4,r5,lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	ldr r5, _080A7DE8
	ldr r4, _080A7DEC
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7DE8: .4byte gSprites
_080A7DEC: .4byte gUnknown_02038568
	thumb_func_end sub_80A7C64

	thumb_func_start sub_80A7CA0
sub_80A7CA0: @ 80A7DF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r2, 0x80
	lsls r2, 4
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	movs r7, 0
_080A7E0E:
	adds r4, 0x20
	movs r5, 0
	adds r1, r7, 0x1
	mov r8, r1
_080A7E16:
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x20
	bl memcpy
	adds r4, 0x20
	adds r6, 0x20
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080A7E16
	cmp r7, 0x5
	beq _080A7E34
	adds r4, 0x20
_080A7E34:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _080A7E0E
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7CA0

	thumb_func_start sub_80A7CF8
sub_80A7CF8: @ 80A7E48
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2A
	bne _080A7E94
	bl sub_80B4940
	cmp r0, 0x1
	bne _080A7E94
	ldr r4, _080A7E84
	ldr r1, _080A7E88
	adds r0, r4, 0
	bl sub_80A7CA0
	movs r0, 0x90
	lsls r0, 3
	adds r4, r0
	str r4, [sp]
	ldr r1, _080A7E8C
	ldr r0, [sp, 0x4]
	ands r0, r1
	ldr r1, _080A7E90
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	b _080A7EC2
	.align 2, 0
_080A7E84: .4byte 0x020288b0
_080A7E88: .4byte 0x02000000
_080A7E8C: .4byte 0xffff0000
_080A7E90: .4byte 0x00007544
_080A7E94:
	ldr r5, _080A7ECC
	lsls r4, 3
	adds r0, r5, 0x4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080A7ED0
	strh r0, [r1, 0x4]
	mov r0, sp
	bl LoadCompressedObjectPalette
	adds r4, r5
	ldr r0, [r4]
	ldr r4, _080A7ED4
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _080A7ED8
	adds r1, r4, r0
	adds r0, r4, 0
	bl sub_80A7CA0
_080A7EC2:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7ECC: .4byte gBerryGraphicsTable
_080A7ED0: .4byte 0x00007544
_080A7ED4: .4byte 0x02001000
_080A7ED8: .4byte 0xfffff000
	thumb_func_end sub_80A7CF8

	thumb_func_start sub_80A7D8C
sub_80A7D8C: @ 80A7EDC
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl sub_80A7CF8
	ldr r0, _080A7F10
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A7F10: .4byte gSpriteTemplate_83C1D74
	thumb_func_end sub_80A7D8C

	thumb_func_start sub_80A7DC4
sub_80A7DC4: @ 80A7F14
	ldr r1, _080A7F20
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080A7F20: .4byte gUnknown_030041B4
	thumb_func_end sub_80A7DC4

	thumb_func_start sub_80A7DD4
sub_80A7DD4: @ 80A7F24
	push {lr}
	ldr r0, _080A7F38
	bl FreeSpritePaletteByTag
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080A7F38: .4byte 0x00007544
	thumb_func_end sub_80A7DD4

	thumb_func_start sub_80A7DEC
sub_80A7DEC: @ 80A7F3C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080A7FA0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl sub_80A7CF8
	ldr r0, _080A7FA4
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	mov r0, r8
	cmp r0, 0x1
	bne _080A7F92
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A7FA8
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080A7F92:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A7FA0: .4byte 0x00007544
_080A7FA4: .4byte gSpriteTemplate_83C1E04
_080A7FA8: .4byte gSprites
	thumb_func_end sub_80A7DEC

	thumb_func_start sub_80A7E5C
sub_80A7E5C: @ 80A7FAC
	push {lr}
	adds r1, r0, 0
	ldr r0, _080A7FC8
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x63
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A7FC8: .4byte gSpriteTemplate_83C1F98
	thumb_func_end sub_80A7E5C

	.align 2, 0 @ Don't pad with nop.
