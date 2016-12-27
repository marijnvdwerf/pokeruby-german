	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_806AEDC
sub_806AEDC: @ 806B21C
	push {r4-r6,lr}
	sub sp, 0x4
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0806B26C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	ldr r1, _0806B270
	adds r5, r0, r1
	movs r6, 0
_0806B238:
	ldrb r0, [r5]
	lsls r0, 3
	ldrb r1, [r5, 0x1]
	lsls r1, 3
	ldr r2, [r5, 0x4]
	lsls r3, r6, 5
	movs r4, 0x80
	lsls r4, 2
	orrs r3, r4
	str r3, [sp]
	movs r3, 0
	bl sub_800142C
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _0806B238
	bl RunTasks
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B26C: .4byte gUnknown_0202E8FA
_0806B270: .4byte gUnknown_08376BB4
	thumb_func_end sub_806AEDC

	thumb_func_start sub_806AF34
sub_806AF34: @ 806B274
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_806B548
	pop {r0}
	bx r0
	thumb_func_end sub_806AF34

	thumb_func_start sub_806AF4C
sub_806AF4C: @ 806B28C
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	cmp r1, 0xFF
	beq _0806B2A4
	ldr r0, _0806B2C4
	strh r1, [r0]
_0806B2A4:
	ldr r0, _0806B2C8
	movs r5, 0x96
	lsls r5, 2
	adds r1, r0, r5
	strb r2, [r1]
	movs r2, 0x97
	lsls r2, 2
	adds r1, r0, r2
	str r4, [r1]
	adds r5, 0x1
	adds r0, r5
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B2C4: .4byte gUnknown_020239F8
_0806B2C8: .4byte 0x0201b000
	thumb_func_end sub_806AF4C

	thumb_func_start sub_806AF8C
sub_806AF8C: @ 806B2CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806AF4C
	ldr r0, _0806B2E8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806B2E8: .4byte sub_806B460
	thumb_func_end sub_806AF8C

	thumb_func_start OpenPartyMenu
OpenPartyMenu: @ 806B2EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806B30C
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r2
	ldr r2, [r3]
	ldrb r3, [r3, 0x8]
	bl sub_806AF8C
	pop {r0}
	bx r0
	.align 2, 0
_0806B30C: .4byte gUnknown_08376C74
	thumb_func_end OpenPartyMenu

	thumb_func_start sub_806AFD0
sub_806AFD0: @ 806B310
	push {r4,r5,lr}
	ldr r1, _0806B330
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x9
	bls _0806B326
	b _0806B45A
_0806B326:
	lsls r0, 2
	ldr r1, _0806B334
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B330: .4byte 0x0201b000
_0806B334: .4byte _0806B338
	.align 2, 0
_0806B338:
	.4byte _0806B360
	.4byte _0806B3A0
	.4byte _0806B3A6
	.4byte _0806B3BA
	.4byte _0806B3E4
	.4byte _0806B3EA
	.4byte _0806B3FC
	.4byte _0806B402
	.4byte _0806B414
	.4byte _0806B42C
_0806B360:
	ldr r0, _0806B388
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _0806B38C
	ldrb r0, [r0]
	cmp r3, r0
	bge _0806B394
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _0806B390
	adds r2, r3
	bl sub_806D90C
	b _0806B454
	.align 2, 0
_0806B388: .4byte 0x00000266
_0806B38C: .4byte gPlayerPartyCount
_0806B390: .4byte gPlayerParty
_0806B394:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B420
_0806B3A0:
	bl sub_806DA98
	b _0806B418
_0806B3A6:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _0806B420
_0806B3BA:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0806B3E0
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B454
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B420
	.align 2, 0
_0806B3E0: .4byte 0x00000266
_0806B3E4:
	bl sub_806E334
	b _0806B418
_0806B3EA:
	bl sub_806E0C4
	ldr r1, _0806B3F8
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B420
	.align 2, 0
_0806B3F8: .4byte 0x0201b000
_0806B3FC:
	bl sub_806E53C
	b _0806B418
_0806B402:
	bl nullsub_13
	ldr r1, _0806B410
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B420
	.align 2, 0
_0806B410: .4byte 0x0201b000
_0806B414:
	bl sub_806E6C8
_0806B418:
	ldr r1, _0806B428
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_0806B420:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0806B45A
	.align 2, 0
_0806B428: .4byte 0x0201b000
_0806B42C:
	ldr r0, _0806B450
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B454
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _0806B45C
	.align 2, 0
_0806B450: .4byte 0x00000266
_0806B454:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0806B45A:
	movs r0, 0
_0806B45C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806AFD0

	thumb_func_start sub_806B124
sub_806B124: @ 806B464
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r0, _0806B484
	ldr r1, _0806B488
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x11
	bls _0806B47A
	b _0806B790
_0806B47A:
	lsls r0, 2
	ldr r1, _0806B48C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B484: .4byte gMain
_0806B488: .4byte 0x0000043c
_0806B48C: .4byte _0806B490
	.align 2, 0
_0806B490:
	.4byte _0806B4D8
	.4byte _0806B580
	.4byte _0806B586
	.4byte _0806B5BC
	.4byte _0806B5C2
	.4byte _0806B5EC
	.4byte _0806B5F2
	.4byte _0806B610
	.4byte _0806B62C
	.4byte _0806B658
	.4byte _0806B684
	.4byte _0806B6BC
	.4byte _0806B6C2
	.4byte _0806B700
	.4byte _0806B70C
	.4byte _0806B724
	.4byte _0806B74C
	.4byte _0806B780
_0806B4D8:
	movs r0, 0
	bl SetVBlankCallback
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r2, sp, 0x8
	mov r8, r2
	add r2, sp, 0x4
	movs r6, 0
	ldr r1, _0806B56C
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806B570
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806B4FC:
	strh r6, [r2]
	add r0, sp, 0x4
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0806B4FC
	strh r6, [r2]
	add r2, sp, 0x4
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r3, r12
	orrs r0, r3
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x8]
	ldr r2, _0806B56C
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r2, _0806B574
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0806B578
	ldr r2, _0806B57C
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B56C: .4byte 0x040000d4
_0806B570: .4byte 0x81000800
_0806B574: .4byte gPaletteFade
_0806B578: .4byte gMain
_0806B57C: .4byte 0x0000043c
_0806B580:
	bl remove_some_task
	b _0806B766
_0806B586:
	bl sub_806B4A8
	ldr r1, _0806B5AC
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0806B5B0
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0x9A
	lsls r0, 2
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0806B5B4
	ldr r2, _0806B5B8
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B5AC: .4byte 0x0201b000
_0806B5B0: .4byte 0x00000266
_0806B5B4: .4byte gMain
_0806B5B8: .4byte 0x0000043c
_0806B5BC:
	bl ResetSpriteData
	b _0806B766
_0806B5C2:
	ldr r0, _0806B5E0
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0806B5D8
	cmp r0, 0x5
	beq _0806B5D8
	bl ResetTasks
_0806B5D8:
	ldr r1, _0806B5E4
	ldr r2, _0806B5E8
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B5E0: .4byte 0x0201b000
_0806B5E4: .4byte gMain
_0806B5E8: .4byte 0x0000043c
_0806B5EC:
	bl FreeAllSpritePalettes
	b _0806B766
_0806B5F2:
	ldr r4, _0806B60C
	movs r1, 0x97
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	movs r2, 0x98
	lsls r2, 2
	adds r1, r4, r2
	strb r0, [r1]
	b _0806B766
	.align 2, 0
_0806B60C: .4byte 0x0201b000
_0806B610:
	ldr r0, _0806B620
	bl SetUpWindowConfig
	ldr r1, _0806B624
	ldr r0, _0806B628
	adds r1, r0
	b _0806B76C
	.align 2, 0
_0806B620: .4byte gWindowConfig_81E6C90
_0806B624: .4byte gMain
_0806B628: .4byte 0x0000043c
_0806B62C:
	ldr r4, _0806B648
	ldr r1, _0806B64C
	adds r0, r4, 0
	bl InitWindowFromConfig
	adds r0, r4, 0
	movs r1, 0x1
	bl MultistepInitWindowTileData
	ldr r1, _0806B650
	ldr r2, _0806B654
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B648: .4byte gUnknown_03004210
_0806B64C: .4byte gWindowConfig_81E6C90
_0806B650: .4byte gMain
_0806B654: .4byte 0x0000043c
_0806B658:
	bl MultistepLoadFont
	cmp r0, 0
	bne _0806B662
	b _0806B790
_0806B662:
	ldr r0, _0806B678
	movs r3, 0x99
	lsls r3, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _0806B67C
	ldr r0, _0806B680
	adds r1, r0
	b _0806B76C
	.align 2, 0
_0806B678: .4byte 0x0201b000
_0806B67C: .4byte gMain
_0806B680: .4byte 0x0000043c
_0806B684:
	ldr r0, _0806B6A8
	movs r1, 0x99
	lsls r1, 2
	adds r4, r0, r1
	ldrb r0, [r4]
	bl sub_806D718
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B6B4
	movs r0, 0
	strh r0, [r4]
	ldr r1, _0806B6AC
	ldr r2, _0806B6B0
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B6A8: .4byte 0x0201b000
_0806B6AC: .4byte gMain
_0806B6B0: .4byte 0x0000043c
_0806B6B4:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0806B790
_0806B6BC:
	bl sub_809D51C
	b _0806B766
_0806B6C2:
	ldr r2, _0806B6F0
	ldr r0, _0806B6F4
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B790
	ldr r1, _0806B6F8
	ldr r2, _0806B6FC
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B6F0: .4byte gUnknown_08376C74
_0806B6F4: .4byte 0x0201b000
_0806B6F8: .4byte gMain
_0806B6FC: .4byte 0x0000043c
_0806B700:
	ldr r0, _0806B708
	bl MultistepInitMenuWindowBegin
	b _0806B766
	.align 2, 0
_0806B708: .4byte gWindowConfig_81E6CC8
_0806B70C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _0806B790
	ldr r1, _0806B71C
	ldr r0, _0806B720
	adds r1, r0
	b _0806B76C
	.align 2, 0
_0806B71C: .4byte gMain
_0806B720: .4byte 0x0000043c
_0806B724:
	ldr r0, _0806B73C
	ldr r1, _0806B740
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r1, _0806B744
	ldr r2, _0806B748
	adds r1, r2
	b _0806B76C
	.align 2, 0
_0806B73C: .4byte 0x0201b000
_0806B740: .4byte 0x00000259
_0806B744: .4byte gMain
_0806B748: .4byte 0x0000043c
_0806B74C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0806B774
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
_0806B766:
	ldr r1, _0806B778
	ldr r3, _0806B77C
	adds r1, r3
_0806B76C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0806B790
	.align 2, 0
_0806B774: .4byte gPaletteFade
_0806B778: .4byte gMain
_0806B77C: .4byte 0x0000043c
_0806B780:
	ldr r0, _0806B78C
	bl SetVBlankCallback
	movs r0, 0x1
	b _0806B792
	.align 2, 0
_0806B78C: .4byte sub_806AF34
_0806B790:
	movs r0, 0
_0806B792:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806B124

	thumb_func_start sub_806B460
sub_806B460: @ 806B7A0
	push {lr}
	b _0806B7B0
_0806B7A4:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806B7DC
_0806B7B0:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B7A4
	ldr r1, _0806B7E0
	movs r2, 0x96
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _0806B7D6
	adds r2, 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806BF74
_0806B7D6:
	ldr r0, _0806B7E4
	bl SetMainCallback2
_0806B7DC:
	pop {r0}
	bx r0
	.align 2, 0
_0806B7E0: .4byte 0x0201b000
_0806B7E4: .4byte sub_806AEDC
	thumb_func_end sub_806B460

	thumb_func_start sub_806B4A8
sub_806B4A8: @ 806B7E8
	push {lr}
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r2, _0806B84C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B850
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B854
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B858
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806B85C
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x40
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _0806B860
	strh r1, [r2]
	ldr r1, _0806B864
	adds r0, r1, 0
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0806B84C: .4byte 0x00001e05
_0806B850: .4byte 0x00000703
_0806B854: .4byte 0x00000f08
_0806B858: .4byte 0x00000602
_0806B85C: .4byte 0x04000050
_0806B860: .4byte 0x0400001e
_0806B864: .4byte 0x0000ffff
	thumb_func_end sub_806B4A8

	thumb_func_start sub_806B528
sub_806B528: @ 806B868
	push {lr}
	ldr r0, _0806B87C
	ldrh r1, [r0]
	movs r0, 0x4B
	ands r0, r1
	cmp r0, 0x4B
	beq _0806B880
	movs r0, 0
	b _0806B882
	.align 2, 0
_0806B87C: .4byte gUnknown_020239F8
_0806B880:
	movs r0, 0x1
_0806B882:
	pop {r1}
	bx r1
	thumb_func_end sub_806B528

	thumb_func_start sub_806B548
sub_806B548: @ 806B888
	push {r4,lr}
	ldr r0, _0806B8B4
	ldr r1, _0806B8B8
	adds r4, r0, r1
	ldrb r3, [r4]
	cmp r3, 0
	beq _0806B8AE
	ldr r1, _0806B8BC
	ldr r2, _0806B8C0
	ldr r0, _0806B8C4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0806B8C8
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	cmp r3, 0x2
	bne _0806B8AE
	movs r0, 0
	strb r0, [r4]
_0806B8AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B8B4: .4byte 0x0201b000
_0806B8B8: .4byte 0x00000261
_0806B8BC: .4byte 0x020221cc
_0806B8C0: .4byte 0x06003000
_0806B8C4: .4byte 0x040000d4
_0806B8C8: .4byte 0x80000400
	thumb_func_end sub_806B548

	thumb_func_start sub_806B58C
sub_806B58C: @ 806B8CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0806B8E8
	ldr r0, _0806B8E4
	strb r2, [r0]
	b _0806B908
	.align 2, 0
_0806B8E4: .4byte gUnknown_0202E8FA
_0806B8E8:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B900
	ldr r1, _0806B8FC
	movs r0, 0x2
	b _0806B904
	.align 2, 0
_0806B8FC: .4byte gUnknown_0202E8FA
_0806B900:
	ldr r1, _0806B924
	movs r0, 0x1
_0806B904:
	strb r0, [r1]
	adds r0, r1, 0
_0806B908:
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0806B928
	adds r4, r1, r0
	cmp r5, 0x8
	bls _0806B91A
	b _0806BC40
_0806B91A:
	lsls r0, r5, 2
	ldr r1, _0806B92C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B924: .4byte gUnknown_0202E8FA
_0806B928: .4byte gUnknown_083769A8
_0806B92C: .4byte _0806B930
	.align 2, 0
_0806B930:
	.4byte _0806B954
	.4byte _0806B968
	.4byte _0806B978
	.4byte _0806B9D4
	.4byte _0806BA5A
	.4byte _0806BAE2
	.4byte _0806BB72
	.4byte _0806BC06
	.4byte _0806BC28
_0806B954:
	ldr r0, _0806B964
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	b _0806BC40
	.align 2, 0
_0806B964: .4byte 0x020221cc
_0806B968:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0
	movs r1, 0
	b _0806BBE8
_0806B978:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B9A6
	ldr r0, _0806B99C
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806B9A0
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806BBE8
	.align 2, 0
_0806B99C: .4byte gPlayerPartyCount
_0806B9A0:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	b _0806BBFC
_0806B9A6:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B9C4
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	movs r2, 0x4
	b _0806BBEA
_0806B9C4:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806BBE8
_0806B9D4:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806BA02
	ldr r0, _0806B9F8
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B9FC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806BBE8
	.align 2, 0
_0806B9F8: .4byte gPlayerPartyCount
_0806B9FC:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806BBFC
_0806BA02:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806BA36
	ldr r0, _0806BA2C
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BA30
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806BBE8
	.align 2, 0
_0806BA2C: .4byte 0x03004438
_0806BA30:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806BBFC
_0806BA36:
	ldr r0, _0806BA50
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806BA54
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806BBE8
	.align 2, 0
_0806BA50: .4byte gPlayerPartyCount
_0806BA54:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806BBFC
_0806BA5A:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806BA8A
	ldr r0, _0806BA80
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806BA84
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806BBE8
	.align 2, 0
_0806BA80: .4byte gPlayerPartyCount
_0806BA84:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806BBFC
_0806BA8A:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806BABE
	ldr r0, _0806BAB4
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BAB8
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806BBE8
	.align 2, 0
_0806BAB4: .4byte 0x0300449c
_0806BAB8:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806BBFC
_0806BABE:
	ldr r0, _0806BAD8
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806BADC
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806BBE8
	.align 2, 0
_0806BAD8: .4byte gPlayerPartyCount
_0806BADC:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806BBFC
_0806BAE2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806BB12
	ldr r0, _0806BB08
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806BB0C
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806BBE8
	.align 2, 0
_0806BB08: .4byte gPlayerPartyCount
_0806BB0C:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806BBFC
_0806BB12:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806BB4A
	ldr r0, _0806BB40
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BB44
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	movs r2, 0x4
	b _0806BBEA
	.align 2, 0
_0806BB40: .4byte 0x03004500
_0806BB44:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806BBC4
_0806BB4A:
	ldr r0, _0806BB68
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806BB6C
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806BBE8
	.align 2, 0
_0806BB68: .4byte gPlayerPartyCount
_0806BB6C:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806BBFC
_0806BB72:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806BB8C
	ldr r0, _0806BB88
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0806BBD6
	b _0806BBF8
	.align 2, 0
_0806BB88: .4byte gPlayerPartyCount
_0806BB8C:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806BBCE
	ldr r0, _0806BBBC
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BBC0
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
	movs r2, 0x4
	b _0806BBEA
	.align 2, 0
_0806BBBC: .4byte 0x03004564
_0806BBC0:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806BBC4:
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
	b _0806BC40
_0806BBCE:
	ldr r0, _0806BBF4
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0806BBF8
_0806BBD6:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
_0806BBE8:
	movs r2, 0x3
_0806BBEA:
	movs r3, 0
	bl sub_806BF24
	b _0806BC40
	.align 2, 0
_0806BBF4: .4byte gPlayerPartyCount
_0806BBF8:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806BBFC:
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
	b _0806BC40
_0806BC06:
	ldr r0, _0806BC24
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0806BC1A
	movs r0, 0x1
	bl sub_806BB9C
_0806BC1A:
	movs r0, 0x1
	bl sub_806BBEC
	b _0806BC40
	.align 2, 0
_0806BC24: .4byte 0x0201b000
_0806BC28:
	ldr r0, _0806BC38
	ldr r1, _0806BC3C
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x1
	b _0806BC42
	.align 2, 0
_0806BC38: .4byte 0x0201b000
_0806BC3C: .4byte 0x00000261
_0806BC40:
	movs r0, 0
_0806BC42:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806B58C

	thumb_func_start sub_806B908
sub_806B908: @ 806BC48
	push {r4,r5,lr}
	ldr r0, _0806BC88
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	ldr r1, _0806BC8C
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _0806BC90
	adds r4, r0, 0
	adds r4, 0x24
	ldr r5, _0806BC94
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BC98
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806BCA4
	.align 2, 0
_0806BC88: .4byte 0x020221cc
_0806BC8C: .4byte gUnknown_0202E8FA
_0806BC90: .4byte gUnknown_083769A8
_0806BC94: .4byte 0x030043d4
_0806BC98:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806BCA4:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806BCC0
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806BCCC
_0806BCC0:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806BCCC:
	ldr r0, _0806BCDC
	ldr r1, _0806BCE0
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCDC: .4byte 0x0201b000
_0806BCE0: .4byte 0x00000261
	thumb_func_end sub_806B908

	thumb_func_start sub_806B9A4
sub_806B9A4: @ 806BCE4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r1, 21
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r1, 0
	lsls r0, 16
	mov r8, r0
	asrs r0, 16
	mov r10, r0
	ldr r4, _0806BD6C
	mov r9, r4
_0806BD0A:
	movs r3, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BD52
	mov r4, r8
	asrs r2, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BD70
	mov r12, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	movs r0, 0xB
	adds r4, r1, 0
	muls r4, r0
_0806BD2C:
	adds r0, r2, r3
	cmp r0, 0
	blt _0806BD42
	adds r0, r6, r0
	lsls r0, 1
	add r0, r12
	adds r1, r4, r3
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BD42:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bhi _0806BD52
	adds r0, r2, r3
	cmp r0, 0x1F
	ble _0806BD2C
_0806BD52:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806BD0A
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD6C: .4byte gUnknown_083769D8
_0806BD70: .4byte 0x020221cc
	thumb_func_end sub_806B9A4

	thumb_func_start sub_806BA34
sub_806BA34: @ 806BD74
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BD88:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BDBC
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BDD0
	movs r5, 0
_0806BD9E:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BDAC
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BDAC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bhi _0806BDBC
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BD9E
_0806BDBC:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806BD88
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BDD0: .4byte 0x020221cc
	thumb_func_end sub_806BA34

	thumb_func_start sub_806BA94
sub_806BA94: @ 806BDD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	ldr r1, _0806BE70
	mov r9, r1
	cmp r2, 0
	bne _0806BDFC
	ldr r1, _0806BE74
	mov r9, r1
_0806BDFC:
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r1, 0
	lsls r4, 16
	mov r12, r4
	asrs r4, 16
	mov r10, r4
_0806BE0C:
	movs r2, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BE56
	mov r4, r12
	asrs r3, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BE78
	mov r8, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	subs r4, r0, r1
_0806BE30:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BE46
	adds r0, r6, r0
	lsls r0, 1
	add r0, r8
	adds r1, r4, r2
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BE46:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BE56
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BE30
_0806BE56:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BE0C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BE70: .4byte gUnknown_08376A5E
_0806BE74: .4byte gUnknown_08376A25
_0806BE78: .4byte 0x020221cc
	thumb_func_end sub_806BA94

	thumb_func_start sub_806BB3C
sub_806BB3C: @ 806BE7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BE90:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BEC4
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BED8
	movs r5, 0
_0806BEA6:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BEB4
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BEB4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BEC4
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BEA6
_0806BEC4:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BE90
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BED8: .4byte 0x020221cc
	thumb_func_end sub_806BB3C

	thumb_func_start sub_806BB9C
sub_806BB9C: @ 806BEDC
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BF24
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BF28
	movs r2, 0
	lsls r4, 12
_0806BEF6:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BEF6
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF24: .4byte gUnknown_08376CD4
_0806BF28: .4byte 0x06003c30
	thumb_func_end sub_806BB9C

	thumb_func_start sub_806BBEC
sub_806BBEC: @ 806BF2C
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BF74
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BF78
	movs r2, 0
	lsls r4, 12
_0806BF46:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BF46
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF74: .4byte gUnknown_08376CEC
_0806BF78: .4byte 0x06003cb0
	thumb_func_end sub_806BBEC

	thumb_func_start sub_806BC3C
sub_806BC3C: @ 806BF7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806BFF0
	bl battle_type_is_double
	lsls r4, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldr r7, [r4]
	movs r6, 0
	adds r0, r5, 0
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 19
	ldr r5, _0806BFF4
	movs r0, 0x86
	lsls r0, 1
	adds r3, r0, 0
_0806BFBC:
	adds r1, r6, r4
	lsls r2, r6, 1
	adds r2, r7
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x20
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r3, r1
	strh r0, [r2]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x6
	bls _0806BFBC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BFF0: .4byte gUnknown_08376918
_0806BFF4: .4byte gUnknown_08E9A300
	thumb_func_end sub_806BC3C

	thumb_func_start unref_sub_806BCB8
unref_sub_806BCB8: @ 806BFF8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806C024
	ldrb r1, [r0]
	cmp r4, r1
	bcs _0806C01E
	adds r6, r0, 0
_0806C00A:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806BC3C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0806C00A
_0806C01E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C024: .4byte gPlayerPartyCount
	thumb_func_end unref_sub_806BCB8

	thumb_func_start sub_806BCE8
sub_806BCE8: @ 806C028
	push {r4,r5,lr}
	movs r5, 0
	b _0806C086
_0806C02E:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0806C060
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806C078
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806C064
	cmp r0, 0xFE
	beq _0806C06E
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
	b _0806C080
	.align 2, 0
_0806C060: .4byte gPlayerParty
_0806C064:
	adds r0, r5, 0
	movs r1, 0x54
	bl sub_806BC3C
	b _0806C080
_0806C06E:
	adds r0, r5, 0
	movs r1, 0x62
	bl sub_806BC3C
	b _0806C080
_0806C078:
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
_0806C080:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0806C086:
	ldr r0, _0806C094
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0806C02E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C094: .4byte gPlayerPartyCount
	thumb_func_end sub_806BCE8

	thumb_func_start sub_806BD58
sub_806BD58: @ 806C098
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806C0BC
	bl object_new_hidden_with_callback
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806CA18
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806C0BC: .4byte SpriteCallbackDummy
	thumb_func_end sub_806BD58

	thumb_func_start sub_806BD80
sub_806BD80: @ 806C0C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806C0DC
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806C0F2
	cmp r0, 0x20
	bgt _0806C0E0
	cmp r0, 0x10
	beq _0806C0F6
	b _0806C0F8
	.align 2, 0
_0806C0DC: .4byte gMain
_0806C0E0:
	cmp r0, 0x40
	beq _0806C0EA
	cmp r0, 0x80
	beq _0806C0EE
	b _0806C0F8
_0806C0EA:
	movs r4, 0xFF
	b _0806C0F8
_0806C0EE:
	movs r4, 0x1
	b _0806C0F8
_0806C0F2:
	movs r4, 0xFE
	b _0806C0F8
_0806C0F6:
	movs r4, 0x2
_0806C0F8:
	lsls r0, r4, 24
	cmp r0, 0
	bne _0806C11C
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C110
	cmp r0, 0x2
	beq _0806C114
	b _0806C116
_0806C110:
	movs r4, 0xFF
	b _0806C116
_0806C114:
	movs r4, 0x1
_0806C116:
	lsls r0, r4, 24
	cmp r0, 0
	beq _0806C130
_0806C11C:
	asrs r1, r0, 24
	adds r0, r5, 0
	bl sub_806BF74
	ldr r0, _0806C12C
	ldrh r0, [r0, 0x30]
	b _0806C16C
	.align 2, 0
_0806C12C: .4byte gMain
_0806C130:
	ldr r0, _0806C15C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806C164
	ldr r4, _0806C160
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806C164
	movs r0, 0x2
	b _0806C16C
	.align 2, 0
_0806C15C: .4byte gMain
_0806C160: .4byte gSprites
_0806C164:
	ldr r0, _0806C174
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806C16C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806C174: .4byte gMain
	thumb_func_end sub_806BD80

	thumb_func_start sub_806BE38
sub_806BE38: @ 806C178
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806C194
	ldrh r1, [r0, 0x30]
	adds r6, r0, 0
	cmp r1, 0x20
	beq _0806C1AA
	cmp r1, 0x20
	bgt _0806C198
	cmp r1, 0x10
	beq _0806C1AE
	b _0806C1B0
	.align 2, 0
_0806C194: .4byte gMain
_0806C198:
	cmp r1, 0x40
	beq _0806C1A2
	cmp r1, 0x80
	beq _0806C1A6
	b _0806C1B0
_0806C1A2:
	movs r4, 0xFF
	b _0806C1CE
_0806C1A6:
	movs r4, 0x1
	b _0806C1CE
_0806C1AA:
	movs r4, 0xFE
	b _0806C1CE
_0806C1AE:
	movs r4, 0x2
_0806C1B0:
	cmp r4, 0
	bne _0806C1CE
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C1C6
	cmp r0, 0x2
	beq _0806C1CA
	b _0806C1CC
_0806C1C6:
	movs r4, 0xFF
	b _0806C1CC
_0806C1CA:
	movs r4, 0x1
_0806C1CC:
	ldr r6, _0806C1E4
_0806C1CE:
	ldrh r2, [r6, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0806C1E8
	adds r0, r5, 0
	bl sub_806C890
	movs r0, 0x8
	b _0806C230
	.align 2, 0
_0806C1E4: .4byte gMain
_0806C1E8:
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0806C1FA
	adds r0, r5, 0
	bl sub_806C658
	ldrh r0, [r6, 0x30]
	b _0806C230
_0806C1FA:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0806C228
	ldr r4, _0806C224
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806C228
	movs r0, 0x2
	b _0806C230
	.align 2, 0
_0806C224: .4byte gSprites
_0806C228:
	ldr r0, _0806C238
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806C230:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806C238: .4byte gMain
	thumb_func_end sub_806BE38

	thumb_func_start task_pc_turn_off
task_pc_turn_off: @ 806C23C
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	beq _0806C254
	ldrb r1, [r2, 0x1]
	movs r2, 0
	bl sub_806BA94
	b _0806C25E
_0806C254:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	adds r2, r3, 0
	bl sub_806B9A4
_0806C25E:
	pop {r0}
	bx r0
	thumb_func_end task_pc_turn_off

	thumb_func_start sub_806BF24
sub_806BF24: @ 806C264
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0806C2B0
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C296
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0806C296
	movs r4, 0x5
_0806C296:
	cmp r6, 0x1
	bne _0806C2A0
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_0806C2A0:
	adds r0, r7, 0
	adds r1, r4, 0
	bl task_pc_turn_off
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C2B0: .4byte gPlayerParty
	thumb_func_end sub_806BF24

	thumb_func_start sub_806BF74
sub_806BF74: @ 806C2B4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806C404
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0
	bl sub_806DA44
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806C2F6
	b _0806C418
_0806C2F6:
	cmp r5, 0
	beq _0806C302
	cmp r5, 0x2
	beq _0806C302
	cmp r5, 0x3
	bne _0806C312
_0806C302:
	lsls r0, r5, 1
	ldr r1, _0806C408
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806C312:
	cmp r5, 0x1
	beq _0806C31E
	cmp r5, 0x4
	beq _0806C31E
	cmp r5, 0x5
	bne _0806C32E
_0806C31E:
	lsls r0, r5, 1
	ldr r1, _0806C408
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_806BF24
_0806C32E:
	cmp r5, 0x7
	bne _0806C338
	movs r0, 0x1
	bl sub_806BBEC
_0806C338:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C490
	ldr r2, _0806C404
	lsls r1, r6, 4
	adds r0, r1, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0
	beq _0806C360
	cmp r0, 0x2
	beq _0806C360
	cmp r0, 0x3
	bne _0806C382
_0806C360:
	ldr r0, _0806C404
	mov r4, r8
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 1
	ldr r2, _0806C408
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806C382:
	ldr r1, _0806C404
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 2
	adds r0, r1
	movs r4, 0x2E
	ldrsh r0, [r0, r4]
	cmp r0, 0x1
	beq _0806C39C
	cmp r0, 0x4
	beq _0806C39C
	cmp r0, 0x5
	bne _0806C3BE
_0806C39C:
	ldr r0, _0806C404
	mov r7, r8
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806C408
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x4
	movs r3, 0x1
	bl sub_806BF24
_0806C3BE:
	ldr r7, _0806C404
	mov r4, r8
	adds r0, r4, r6
	lsls r0, 2
	adds r4, r0, r7
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _0806C3D6
	movs r0, 0x2
	bl sub_806BBEC
_0806C3D6:
	ldr r0, _0806C40C
	ldr r2, _0806C410
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, _0806C414
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x40
	ldrb r0, [r0]
	strh r0, [r4, 0x20]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x41
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	adds r0, r7, 0
	b _0806C4E4
	.align 2, 0
_0806C404: .4byte gSprites
_0806C408: .4byte gUnknown_083769C0
_0806C40C: .4byte 0x0201b000
_0806C410: .4byte 0x00000261
_0806C414: .4byte gUnknown_083768B8
_0806C418:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r5, 0x5
	bhi _0806C444
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	lsls r1, r5, 1
	adds r0, r1
	ldr r1, _0806C440
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C44A
	.align 2, 0
_0806C440: .4byte gUnknown_083769A8
_0806C444:
	movs r0, 0x1
	bl sub_806BBEC
_0806C44A:
	cmp r7, 0
	bne _0806C45C
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C1E4
	b _0806C468
_0806C45C:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C310
_0806C468:
	ldr r1, _0806C4A0
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r1, r0, r1
	ldrh r3, [r1, 0x2E]
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	mov r8, r2
	cmp r0, 0x5
	bgt _0806C4A8
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	movs r2, 0x2E
	ldrsh r1, [r1, r2]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806C4A4
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C4AE
	.align 2, 0
_0806C4A0: .4byte gSprites
_0806C4A4: .4byte gUnknown_083769A8
_0806C4A8:
	movs r0, 0x2
	bl sub_806BBEC
_0806C4AE:
	ldr r0, _0806C514
	ldr r4, _0806C518
	adds r0, r4
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0806C51C
	mov r0, r8
	adds r1, r0, r6
	lsls r1, 2
	adds r1, r4
	ldr r3, _0806C520
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 2
	lsls r2, r7, 5
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0]
	strh r0, [r1, 0x20]
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 2
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x22]
	adds r0, r4, 0
_0806C4E4:
	mov r1, r8
	adds r4, r1, r6
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	movs r2, 0x1
	bl sub_806DA44
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r5, r0
	beq _0806C508
	movs r0, 0x5
	bl PlaySE
_0806C508:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C514: .4byte 0x0201b000
_0806C518: .4byte 0x00000261
_0806C51C: .4byte gSprites
_0806C520: .4byte gUnknown_083768B8
	thumb_func_end sub_806BF74

	thumb_func_start sub_806C1E4
sub_806C1E4: @ 806C524
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C540
	b _0806C646
_0806C540:
	lsls r0, 2
	ldr r1, _0806C54C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C54C: .4byte _0806C550
	.align 2, 0
_0806C550:
	.4byte _0806C62C
	.4byte _0806C578
	.4byte _0806C564
	.4byte _0806C59C
	.4byte _0806C5FC
_0806C564:
	ldr r0, _0806C574
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C646
	.align 2, 0
_0806C574: .4byte gSprites
_0806C578:
	cmp r3, 0
	beq _0806C5A6
	cmp r3, 0x7
	bne _0806C5D8
	ldr r2, _0806C594
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C598
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C5EA
	.align 2, 0
_0806C594: .4byte gSprites
_0806C598: .4byte gPlayerPartyCount
_0806C59C:
	ldr r0, _0806C5B8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	bne _0806C5C0
_0806C5A6:
	ldr r2, _0806C5BC
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C5EC
	.align 2, 0
_0806C5B8: .4byte gPlayerPartyCount
_0806C5BC: .4byte gSprites
_0806C5C0:
	cmp r3, 0x7
	bne _0806C5D8
	ldr r2, _0806C5D4
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C5EC
	.align 2, 0
_0806C5D4: .4byte gSprites
_0806C5D8:
	ldr r2, _0806C5F8
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C5EA:
	strh r0, [r1, 0x2E]
_0806C5EC:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C646
	.align 2, 0
_0806C5F8: .4byte gSprites
_0806C5FC:
	ldr r0, _0806C624
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806C646
	cmp r3, 0
	bne _0806C646
	ldr r0, _0806C628
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C61E
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C61E:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C646
	.align 2, 0
_0806C624: .4byte gPlayerPartyCount
_0806C628: .4byte gSprites
_0806C62C:
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0806C646
	ldr r0, _0806C64C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C646:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C64C: .4byte gSprites
	thumb_func_end sub_806C1E4

	thumb_func_start sub_806C310
sub_806C310: @ 806C650
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C66C
	b _0806C7C6
_0806C66C:
	lsls r0, 2
	ldr r1, _0806C678
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C678: .4byte _0806C67C
	.align 2, 0
_0806C67C:
	.4byte _0806C78E
	.4byte _0806C6CC
	.4byte _0806C690
	.4byte _0806C6A4
	.4byte _0806C728
_0806C690:
	ldr r0, _0806C6A0
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C7C6
	.align 2, 0
_0806C6A0: .4byte gSprites
_0806C6A4:
	cmp r3, 0x7
	bne _0806C6BC
	ldr r2, _0806C6B8
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C718
	.align 2, 0
_0806C6B8: .4byte gSprites
_0806C6BC:
	ldr r0, _0806C6C8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	beq _0806C6D0
	b _0806C704
	.align 2, 0
_0806C6C8: .4byte gPlayerPartyCount
_0806C6CC:
	cmp r3, 0
	bne _0806C6E4
_0806C6D0:
	ldr r2, _0806C6E0
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C718
	.align 2, 0
_0806C6E0: .4byte gSprites
_0806C6E4:
	cmp r3, 0x7
	bne _0806C704
	ldr r2, _0806C6FC
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C700
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C716
	.align 2, 0
_0806C6FC: .4byte gSprites
_0806C700: .4byte gPlayerPartyCount
_0806C704:
	ldr r2, _0806C724
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C716:
	strh r0, [r1, 0x2E]
_0806C718:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C7C6
	.align 2, 0
_0806C724: .4byte gSprites
_0806C728:
	cmp r3, 0
	bne _0806C758
	ldr r0, _0806C750
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806C7C6
	ldr r0, _0806C754
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C77A
	movs r0, 0x2
	strh r0, [r1, 0x2E]
	b _0806C7C6
	.align 2, 0
_0806C750: .4byte gPlayerPartyCount
_0806C754: .4byte gSprites
_0806C758:
	cmp r3, 0x1
	bne _0806C7C6
	ldr r0, _0806C780
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806C7C6
	ldr r0, _0806C784
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C788
_0806C77A:
	strh r2, [r1, 0x2E]
	b _0806C7C6
	.align 2, 0
_0806C780: .4byte gPlayerPartyCount
_0806C784: .4byte gSprites
_0806C788:
	movs r0, 0x4
	strh r0, [r1, 0x2E]
	b _0806C7C6
_0806C78E:
	subs r0, r3, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C7AC
	ldr r0, _0806C7A8
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C7C2
	.align 2, 0
_0806C7A8: .4byte gSprites
_0806C7AC:
	subs r0, r3, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C7C6
	ldr r0, _0806C7CC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C7C2:
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C7C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C7CC: .4byte gSprites
	thumb_func_end sub_806C310

	thumb_func_start sub_806C490
sub_806C490: @ 806C7D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C7EA
	b _0806C98E
_0806C7EA:
	lsls r0, 2
	ldr r1, _0806C7F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C7F4: .4byte _0806C7F8
	.align 2, 0
_0806C7F8:
	.4byte _0806C958
	.4byte _0806C864
	.4byte _0806C80C
	.4byte _0806C820
	.4byte _0806C8BC
_0806C80C:
	ldr r0, _0806C81C
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C98E
	.align 2, 0
_0806C81C: .4byte gSprites
_0806C820:
	cmp r4, 0x7
	bne _0806C83C
	ldr r2, _0806C838
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	adds r1, r2, 0
	adds r6, r3, 0
	b _0806C8A6
	.align 2, 0
_0806C838: .4byte gSprites
_0806C83C:
	lsls r6, r5, 4
	b _0806C858
_0806C840:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C860
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0806C868
_0806C858:
	cmp r4, 0x5
	bne _0806C840
	b _0806C898
	.align 2, 0
_0806C860: .4byte gPlayerParty
_0806C864:
	lsls r6, r5, 4
	b _0806C894
_0806C868:
	ldr r1, _0806C874
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x2E]
	b _0806C8A6
	.align 2, 0
_0806C874: .4byte gSprites
_0806C878:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C894
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C8B4
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0806C868
_0806C894:
	cmp r4, 0
	bne _0806C878
_0806C898:
	ldr r0, _0806C8B8
	adds r1, r6, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x7
	strh r2, [r1, 0x2E]
	adds r1, r0, 0
_0806C8A6:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C98E
	.align 2, 0
_0806C8B4: .4byte gPlayerParty
_0806C8B8: .4byte gSprites
_0806C8BC:
	cmp r4, 0
	bne _0806C908
	ldr r0, _0806C8EC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C922
	ldr r5, _0806C8F0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C8F4
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	b _0806C98E
	.align 2, 0
_0806C8EC: .4byte gSprites
_0806C8F0: .4byte 0x03004438
_0806C8F4:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C98E
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	b _0806C98E
_0806C908:
	cmp r4, 0x1
	bne _0806C98E
	ldr r0, _0806C928
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C92C
_0806C922:
	strh r1, [r4, 0x2E]
	b _0806C98E
	.align 2, 0
_0806C928: .4byte gSprites
_0806C92C:
	ldr r5, _0806C940
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C944
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	b _0806C98E
	.align 2, 0
_0806C940: .4byte 0x03004500
_0806C944:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806C98E
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	b _0806C98E
_0806C958:
	subs r0, r4, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C974
	ldr r0, _0806C970
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C98A
	.align 2, 0
_0806C970: .4byte gSprites
_0806C974:
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C98E
	ldr r0, _0806C994
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C98A:
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
_0806C98E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C994: .4byte gSprites
	thumb_func_end sub_806C490

	thumb_func_start sub_806C658
sub_806C658: @ 806C998
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C9E0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl sub_806DA44
	cmp r6, 0x5
	bhi _0806C9E8
	lsls r0, r6, 1
	ldr r1, _0806C9E4
	adds r0, r1
	adds r1, r6, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C9FA
	.align 2, 0
_0806C9E0: .4byte gSprites
_0806C9E4: .4byte gUnknown_083769A8
_0806C9E8:
	cmp r6, 0x6
	bne _0806C9F4
	movs r0, 0x1
	bl sub_806BB9C
	b _0806C9FA
_0806C9F4:
	movs r0, 0x1
	bl sub_806BBEC
_0806C9FA:
	lsls r1, r4, 24
	movs r2, 0x80
	lsls r2, 18
	adds r0, r1, r2
	asrs r0, 24
	lsls r4, r5, 4
	adds r7, r1, 0
	cmp r0, 0x4
	bls _0806CA0E
	b _0806CB2A
_0806CA0E:
	lsls r0, 2
	ldr r1, _0806CA18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806CA18: .4byte _0806CA1C
	.align 2, 0
_0806CA1C:
	.4byte _0806CB10
	.4byte _0806CA48
	.4byte _0806CA30
	.4byte _0806CA80
	.4byte _0806CAE0
_0806CA30:
	ldr r1, _0806CA44
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	adds r4, r2, 0
	b _0806CB2A
	.align 2, 0
_0806CA44: .4byte gSprites
_0806CA48:
	cmp r6, 0
	bne _0806CA60
	ldr r2, _0806CA5C
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806CACE
	.align 2, 0
_0806CA5C: .4byte gSprites
_0806CA60:
	cmp r6, 0x6
	bne _0806CABC
	ldr r2, _0806CA78
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806CA7C
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806CACC
	.align 2, 0
_0806CA78: .4byte gSprites
_0806CA7C: .4byte gPlayerPartyCount
_0806CA80:
	ldr r0, _0806CA9C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	bne _0806CAA4
	ldr r2, _0806CAA0
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	b _0806CACE
	.align 2, 0
_0806CA9C: .4byte gPlayerPartyCount
_0806CAA0: .4byte gSprites
_0806CAA4:
	cmp r6, 0x7
	bne _0806CABC
	ldr r2, _0806CAB8
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806CACE
	.align 2, 0
_0806CAB8: .4byte gSprites
_0806CABC:
	ldr r2, _0806CADC
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	asrs r0, r7, 24
	ldrh r4, [r1, 0x2E]
	adds r0, r4
_0806CACC:
	strh r0, [r1, 0x2E]
_0806CACE:
	adds r4, r3, 0
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806CB2A
	.align 2, 0
_0806CADC: .4byte gSprites
_0806CAE0:
	ldr r0, _0806CB08
	ldrb r0, [r0]
	lsls r4, r5, 4
	cmp r0, 0x1
	bls _0806CB2A
	cmp r6, 0
	bne _0806CB2A
	ldr r0, _0806CB0C
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806CB02
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806CB02:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806CB2A
	.align 2, 0
_0806CB08: .4byte gPlayerPartyCount
_0806CB0C: .4byte gSprites
_0806CB10:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r5, 4
	cmp r0, 0x4
	bhi _0806CB2A
	ldr r0, _0806CB6C
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r6, [r1, 0x30]
_0806CB2A:
	ldr r1, _0806CB6C
	adds r0, r4, r5
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, _0806CB70
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x20]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2, 0x22]
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	bgt _0806CB78
	lsls r0, 1
	ldr r1, _0806CB74
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806CB8A
	.align 2, 0
_0806CB6C: .4byte gSprites
_0806CB70: .4byte gUnknown_083768B8
_0806CB74: .4byte gUnknown_083769A8
_0806CB78:
	cmp r0, 0x6
	bne _0806CB84
	movs r0, 0x2
	bl sub_806BB9C
	b _0806CB8A
_0806CB84:
	movs r0, 0x2
	bl sub_806BBEC
_0806CB8A:
	ldr r0, _0806CBC4
	ldr r2, _0806CBC8
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _0806CBCC
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	movs r2, 0x1
	bl sub_806DA44
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r6, r0
	beq _0806CBB8
	movs r0, 0x5
	bl PlaySE
_0806CBB8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CBC4: .4byte 0x0201b000
_0806CBC8: .4byte 0x00000261
_0806CBCC: .4byte gSprites
	thumb_func_end sub_806C658

	thumb_func_start sub_806C890
sub_806C890: @ 806CBD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806CC14
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806CC54
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_806DA44
	cmp r4, 0x5
	bhi _0806CC1C
	lsls r0, r4, 1
	ldr r1, _0806CC18
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806CC22
	.align 2, 0
_0806CC14: .4byte gSprites
_0806CC18: .4byte gUnknown_083769A8
_0806CC1C:
	movs r0, 0x1
	bl sub_806BBEC
_0806CC22:
	ldr r1, _0806CC5C
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldr r2, _0806CC60
	ldrb r1, [r2, 0x18]
	strh r1, [r0, 0x20]
	ldrb r1, [r2, 0x19]
	strh r1, [r0, 0x22]
	movs r0, 0x2
	bl sub_806BB9C
	ldr r0, _0806CC64
	ldr r1, _0806CC68
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x5
	bl PlaySE
_0806CC54:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC5C: .4byte gSprites
_0806CC60: .4byte gUnknown_083768B8
_0806CC64: .4byte 0x0201b000
_0806CC68: .4byte 0x00000261
	thumb_func_end sub_806C890

	thumb_func_start sub_806C92C
sub_806C92C: @ 806CC6C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806CCA0
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r1, 0x30]
	lsls r0, 24
	lsrs r4, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806CCAA
	cmp r6, 0
	bne _0806CCA4
	cmp r4, 0
	bne _0806CCBC
	movs r4, 0x1
	b _0806CCBC
	.align 2, 0
_0806CCA0: .4byte gSprites
_0806CCA4:
	cmp r4, 0
	beq _0806CCBC
	b _0806CCBA
_0806CCAA:
	cmp r6, 0x1
	bhi _0806CCB6
	cmp r4, 0x1
	bhi _0806CCBC
	movs r4, 0x2
	b _0806CCBC
_0806CCB6:
	cmp r4, 0x1
	bls _0806CCBC
_0806CCBA:
	movs r4, 0
_0806CCBC:
	ldr r1, _0806CCD0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCD0: .4byte gSprites
	thumb_func_end sub_806C92C

	thumb_func_start sub_806C994
sub_806C994: @ 806CCD4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CD00
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r4, [r1, 0x2E]
	bl sub_806C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD00: .4byte gSprites
	thumb_func_end sub_806C994

	thumb_func_start sub_806C9C4
sub_806C9C4: @ 806CD04
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806CD3C
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r1, 0x20]
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r2, 0x22]
	ldrh r0, [r1, 0x2E]
	strh r0, [r2, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD3C: .4byte gSprites
	thumb_func_end sub_806C9C4

	thumb_func_start sub_806CA00
sub_806CA00: @ 806CD40
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CD54
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xE]
	lsrs r0, 8
	bx lr
	.align 2, 0
_0806CD54: .4byte gTasks
	thumb_func_end sub_806CA00

	thumb_func_start sub_806CA18
sub_806CA18: @ 806CD58
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _0806CD74
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r0, [r2, 0xE]
	lsrs r1, 16
	orrs r0, r1
	strh r0, [r2, 0xE]
	bx lr
	.align 2, 0
_0806CD74: .4byte gTasks
	thumb_func_end sub_806CA18

	thumb_func_start sub_806CA38
sub_806CA38: @ 806CD78
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CD9C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806CD9C: .4byte gSprites
	thumb_func_end sub_806CA38

	thumb_func_start sub_806CA60
sub_806CA60: @ 806CDA0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806CE18
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CE1C
	str r1, [r0]
	ldr r5, _0806CE20
	strb r4, [r5]
	ldr r0, _0806CE24
	movs r1, 0
	bl CreateTask
	ldr r0, _0806CE28
	bl object_new_hidden_with_callback
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x1]
	adds r0, r4, 0
	bl sub_806C9C4
	adds r0, r4, 0
	bl sub_806CA00
	strb r0, [r5, 0x2]
	ldr r1, _0806CE2C
	adds r0, r5, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r2, _0806CE30
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806CE34
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
	ldr r0, _0806CE38
	adds r5, r0
	movs r0, 0x2
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CE18: .4byte gTasks
_0806CE1C: .4byte TaskDummy
_0806CE20: .4byte 0x02001000
_0806CE24: .4byte sub_806CB74
_0806CE28: .4byte SpriteCallbackDummy
_0806CE2C: .4byte 0x0001a272
_0806CE30: .4byte gSprites
_0806CE34: .4byte gUnknown_083769A8
_0806CE38: .4byte 0x0001a261
	thumb_func_end sub_806CA60

	thumb_func_start sub_806CAFC
sub_806CAFC: @ 806CE3C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0806CE88
	ldrb r3, [r4, 0x1]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _0806CE8C
	adds r5, r2, r3
	ldrb r2, [r4, 0x2]
	lsls r4, r2, 4
	adds r4, r2
	lsls r4, 2
	adds r4, r3
	lsls r1, 24
	asrs r1, 24
	bl sub_806BF74
	ldrh r2, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _0806CE94
	adds r0, r1, 0
	lsls r0, 1
	ldr r1, _0806CE90
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0x1
	bl sub_806BF24
	b _0806CEAA
	.align 2, 0
_0806CE88: .4byte 0x02001000
_0806CE8C: .4byte gSprites
_0806CE90: .4byte gUnknown_083769A8
_0806CE94:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	lsls r0, 1
	ldr r1, _0806CEB0
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
_0806CEAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEB0: .4byte gUnknown_083769A8
	thumb_func_end sub_806CAFC

	thumb_func_start sub_806CB74
sub_806CB74: @ 806CEB4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806CECC
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806CEFC
	cmp r0, 0x20
	bgt _0806CED0
	cmp r0, 0x10
	beq _0806CF10
	b _0806CF1A
	.align 2, 0
_0806CECC: .4byte gMain
_0806CED0:
	cmp r0, 0x40
	beq _0806CEDA
	cmp r0, 0x80
	beq _0806CEEC
	b _0806CF1A
_0806CEDA:
	ldr r0, _0806CEE8
	ldrb r0, [r0]
	movs r1, 0x1
	negs r1, r1
	bl sub_806CAFC
	b _0806CF1A
	.align 2, 0
_0806CEE8: .4byte 0x02001000
_0806CEEC:
	ldr r0, _0806CEF8
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_806CAFC
	b _0806CF1A
	.align 2, 0
_0806CEF8: .4byte 0x02001000
_0806CEFC:
	ldr r0, _0806CF0C
	ldrb r0, [r0]
	movs r1, 0x2
	negs r1, r1
	bl sub_806CAFC
	b _0806CF1A
	.align 2, 0
_0806CF0C: .4byte 0x02001000
_0806CF10:
	ldr r0, _0806CF44
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_806CAFC
_0806CF1A:
	ldr r0, _0806CF48
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806CF50
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806CF4C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CF44
	ldr r1, [r1, 0xC]
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _0806CF64
	.align 2, 0
_0806CF44: .4byte 0x02001000
_0806CF48: .4byte gMain
_0806CF4C: .4byte gTasks
_0806CF50:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0806CF64
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CD44
_0806CF64:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CB74

	thumb_func_start sub_806CC2C
sub_806CC2C: @ 806CF6C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0806CFA8
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806CFAC
	adds r0, r1
	bl DestroySprite
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0806CFB0
	adds r1, r5, r0
	movs r0, 0x2
	strb r0, [r1]
	ldrb r0, [r5]
	bl SwitchTaskToFollowupFunc
	adds r0, r4, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CFA8: .4byte 0x02001000
_0806CFAC: .4byte gSprites
_0806CFB0: .4byte 0x0001a261
	thumb_func_end sub_806CC2C

	thumb_func_start sub_806CC74
sub_806CC74: @ 806CFB4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806D018
	mov r8, r0
	ldr r6, _0806D01C
	ldrb r0, [r6, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r5, _0806D020
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D018: .4byte gSprites
_0806D01C: .4byte 0x02001000
_0806D020: .4byte gUnknown_083769A8
	thumb_func_end sub_806CC74

	thumb_func_start sub_806CCE4
sub_806CCE4: @ 806D024
	push {r4,r5,lr}
	ldr r3, _0806D078
	ldr r2, _0806D07C
	ldrb r1, [r2, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r4, 0x5
	bhi _0806D05E
	lsls r0, r4, 1
	ldr r1, _0806D080
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806D05E:
	cmp r5, 0x5
	bhi _0806D072
	lsls r0, r5, 1
	ldr r1, _0806D080
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806D072:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D078: .4byte gSprites
_0806D07C: .4byte 0x02001000
_0806D080: .4byte gUnknown_083769A8
	thumb_func_end sub_806CCE4

	thumb_func_start sub_806CD44
sub_806CD44: @ 806D084
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CCE4
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CD44

	thumb_func_start sub_806CD5C
sub_806CD5C: @ 806D09C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _0806D0E8
	ldr r6, _0806D0EC
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r9, r5
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	cmp r5, r4
	beq _0806D0DE
	cmp r5, 0x7
	beq _0806D0DE
	cmp r4, 0x7
	bne _0806D0F0
_0806D0DE:
	mov r0, r8
	bl sub_806CD44
	b _0806D212
	.align 2, 0
_0806D0E8: .4byte gSprites
_0806D0EC: .4byte 0x02001000
_0806D0F0:
	adds r0, r5, 0
	bl sub_806D5B8
	adds r0, r4, 0
	bl sub_806D5B8
	cmp r5, r4
	bls _0806D106
	strb r4, [r6, 0x5]
	strb r5, [r6, 0x6]
	b _0806D10C
_0806D106:
	mov r0, r9
	strb r0, [r6, 0x5]
	strb r7, [r6, 0x6]
_0806D10C:
	ldr r4, _0806D15C
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806DDA0
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	bl sub_806DDA0
	strb r0, [r4, 0x4]
	ldrb r3, [r4, 0x5]
	cmp r3, 0
	bne _0806D174
	ldr r2, _0806D160
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806D164
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806D168
	strh r1, [r0, 0x32]
	strh r3, [r4, 0x8]
	movs r0, 0xB
	strh r0, [r4, 0xA]
	ldr r1, _0806D16C
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806D170
	b _0806D1A6
	.align 2, 0
_0806D15C: .4byte 0x02001000
_0806D160: .4byte gSprites
_0806D164: .4byte 0x0000fff8
_0806D168: .4byte 0x0000ff58
_0806D16C: .4byte gTasks
_0806D170: .4byte sub_806D014
_0806D174:
	ldr r2, _0806D220
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	movs r0, 0xB
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r1, _0806D224
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806D228
_0806D1A6:
	str r1, [r0]
	ldr r0, _0806D22C
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r6, r2, 0
	ldr r4, _0806D230
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r0, r5
	ldr r2, _0806D234
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r5
	adds r0, r6
	ldr r1, [r5]
	bl _call_via_r1
_0806D212:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D220: .4byte gSprites
_0806D224: .4byte gTasks
_0806D228: .4byte sub_806D118
_0806D22C: .4byte 0x0001a261
_0806D230: .4byte 0x02001000
_0806D234: .4byte sub_806D37C
	thumb_func_end sub_806CD5C

	thumb_func_start sub_806CEF8
sub_806CEF8: @ 806D238
	ldrh r3, [r0]
	ldrh r2, [r1]
	strh r2, [r0]
	strh r3, [r1]
	bx lr
	thumb_func_end sub_806CEF8

	thumb_func_start sub_806CF04
sub_806CF04: @ 806D244
	push {r4,r5,lr}
	ldr r4, _0806D2D4
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0806D2D8
	adds r0, r5
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x2
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x4
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0
	adds r3, 0xE
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	subs r5, 0x4
	adds r0, r5
	ldr r2, _0806D2DC
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D2D4: .4byte 0x02001000
_0806D2D8: .4byte 0x02020024
_0806D2DC: .4byte sub_806D37C
	thumb_func_end sub_806CF04

	thumb_func_start sub_806CFA0
sub_806CFA0: @ 806D2E0
	push {r4-r6,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806D31C
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl sub_806BA34
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806D320
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806D32A
	.align 2, 0
_0806D31C: .4byte 0x02001000
_0806D320:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806D32A:
	strh r0, [r5, 0xA]
	ldr r4, _0806D350
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	movs r2, 0xA
	bl sub_806B9A4
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D350: .4byte 0x02001000
	thumb_func_end sub_806CFA0

	thumb_func_start sub_806D014
sub_806D014: @ 806D354
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806CFA0
	ldr r2, _0806D390
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	movs r0, 0xD
	negs r0, r0
	cmp r1, r0
	bge _0806D38A
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x20
	ble _0806D38A
	bl sub_806CF04
	ldr r0, _0806D394
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D398
	str r0, [r1]
_0806D38A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D390: .4byte 0x02001000
_0806D394: .4byte gTasks
_0806D398: .4byte sub_806D05C
	thumb_func_end sub_806D014

	thumb_func_start sub_806D05C
sub_806D05C: @ 806D39C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806CFA0
	ldr r0, _0806D3CC
	ldr r1, [r0, 0x8]
	movs r0, 0xB0
	lsls r0, 12
	cmp r1, r0
	bne _0806D3C4
	ldr r0, _0806D3D0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D3D4
	str r0, [r1]
_0806D3C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D3CC: .4byte 0x02001000
_0806D3D0: .4byte gTasks
_0806D3D4: .4byte sub_806D198
	thumb_func_end sub_806D05C

	thumb_func_start sub_806D098
sub_806D098: @ 806D3D8
	push {r4-r7,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806D420
	ldrb r1, [r5, 0x5]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	adds r1, r7, 0
	bl sub_806BB3C
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806D424
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806D42E
	.align 2, 0
_0806D420: .4byte 0x02001000
_0806D424:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806D42E:
	strh r0, [r5, 0xA]
	ldr r4, _0806D454
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D454: .4byte 0x02001000
	thumb_func_end sub_806D098

	thumb_func_start sub_806D118
sub_806D118: @ 806D458
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806D098
	ldr r1, _0806D490
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D48A
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D48A
	bl sub_806CF04
	ldr r0, _0806D494
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D498
	str r0, [r1]
_0806D48A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D490: .4byte 0x02001000
_0806D494: .4byte gTasks
_0806D498: .4byte sub_806D15C
	thumb_func_end sub_806D118

	thumb_func_start sub_806D15C
sub_806D15C: @ 806D49C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806D098
	ldr r0, _0806D4C8
	ldr r1, [r0, 0x8]
	ldr r0, _0806D4CC
	cmp r1, r0
	bne _0806D4C2
	ldr r0, _0806D4D0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D4D4
	str r0, [r1]
_0806D4C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4C8: .4byte 0x02001000
_0806D4CC: .4byte 0x000b000b
_0806D4D0: .4byte gTasks
_0806D4D4: .4byte sub_806D198
	thumb_func_end sub_806D15C

	thumb_func_start sub_806D198
sub_806D198: @ 806D4D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r4, _0806D6A4
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl sub_806DE50
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	ldrb r2, [r4, 0x3]
	bl sub_806DE50
	bl battle_type_is_double
	ldr r5, _0806D6A8
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldr r6, _0806D6AC
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	movs r1, 0
	mov r8, r1
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r5
	mov r9, r1
	add r0, r9
	ldr r7, _0806D6B0
	str r7, [r0]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	str r7, [r0]
	ldrb r0, [r4]
	ldrb r2, [r4, 0x2]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _0806D6B4
	str r0, [r1]
	ldrb r0, [r4, 0x5]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0806D6B8
	adds r0, r5
	ldrb r1, [r4, 0x6]
	muls r1, r6
	adds r1, r5
	bl sub_806E6F0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	bl sub_806E6C8
	mov r0, r10
	bl sub_806CC74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6A4: .4byte 0x02001000
_0806D6A8: .4byte gSprites
_0806D6AC: .4byte gUnknown_08376678
_0806D6B0: .4byte sub_806DA38
_0806D6B4: .4byte sub_806DA0C
_0806D6B8: .4byte gPlayerParty
	thumb_func_end sub_806D198

	thumb_func_start sub_806D37C
sub_806D37C: @ 806D6BC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806D6E8
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	negs r0, r0
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x32]
	ldr r0, _0806D6E4
	str r0, [r4, 0x1C]
	b _0806D6EE
	.align 2, 0
_0806D6E4: .4byte sub_806DA38
_0806D6E8:
	ldrh r0, [r4, 0x2E]
	adds r0, r2, r0
	strh r0, [r4, 0x24]
_0806D6EE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806D37C

	thumb_func_start sub_806D3B4
sub_806D3B4: @ 806D6F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r6, _0806D778
	ldr r1, _0806D77C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	bl sub_806BA34
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	bl sub_806BB3C
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	bl sub_806BB3C
	ldrh r1, [r5, 0x8]
	subs r1, 0x1
	strh r1, [r5, 0x8]
	ldrb r0, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	cmp r4, 0
	beq _0806D780
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D794
	.align 2, 0
_0806D778: .4byte gUnknown_083769C0
_0806D77C: .4byte gTasks
_0806D780:
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D794:
	mov r0, r8
	cmp r0, 0
	beq _0806D7C0
	ldr r1, _0806D7BC
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D7DE
	.align 2, 0
_0806D7BC: .4byte gTasks
_0806D7C0:
	ldr r1, _0806D7E8
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D7DE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D7E8: .4byte gTasks
	thumb_func_end sub_806D3B4

	thumb_func_start sub_806D4AC
sub_806D4AC: @ 806D7EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _0806D836
	adds r1, r2, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806D83C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	ldr r0, _0806D840
	strh r0, [r4, 0x2E]
	ldr r3, _0806D844
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r3
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	lsls r0, 3
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r2, 0x1C
	adds r1, r2
	ldr r0, _0806D848
	str r0, [r1]
_0806D836:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D83C: .4byte gSprites
_0806D840: .4byte 0x0000fff8
_0806D844: .4byte gTasks
_0806D848: .4byte sub_806D37C
	thumb_func_end sub_806D4AC

	thumb_func_start sub_806D50C
sub_806D50C: @ 806D84C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	ldr r2, _0806D874
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0xF0
	strh r0, [r1, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0806D874: .4byte gSprites
	thumb_func_end sub_806D50C

	thumb_func_start sub_806D538
sub_806D538: @ 806D878
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	cmp r4, 0xFF
	beq _0806D8DA
	cmp r1, 0x1
	beq _0806D8A8
	cmp r1, 0x1
	bgt _0806D896
	cmp r1, 0
	beq _0806D8A0
	b _0806D8CA
_0806D896:
	cmp r0, 0x2
	beq _0806D8B0
	cmp r0, 0x3
	beq _0806D8BE
	b _0806D8CA
_0806D8A0:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x17
	b _0806D8B6
_0806D8A8:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x13
	b _0806D8B6
_0806D8B0:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x16
_0806D8B6:
	movs r3, 0x13
	bl MenuDrawTextWindow
	b _0806D8CA
_0806D8BE:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x12
	movs r3, 0x13
	bl MenuDrawTextWindow
_0806D8CA:
	ldr r0, _0806D8E0
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
_0806D8DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D8E0: .4byte gUnknown_08376624
	thumb_func_end sub_806D538

	thumb_func_start sub_806D5A4
sub_806D5A4: @ 806D8E4
	push {lr}
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_806D5A4

	thumb_func_start sub_806D5B8
sub_806D5B8: @ 806D8F8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D998
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D99C
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D9A0
	adds r5, r0
	ldr r2, _0806D9A4
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D998: .4byte gUnknown_08376948
_0806D99C: .4byte gUnknown_03004210
_0806D9A0: .4byte 0x06014000
_0806D9A4: .4byte 0x01000100
	thumb_func_end sub_806D5B8

	thumb_func_start sub_806D668
sub_806D668: @ 806D9A8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806DA48
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806DA4C
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806DA50
	adds r5, r0
	ldr r2, _0806DA54
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA48: .4byte gUnknown_08376978
_0806DA4C: .4byte gUnknown_03004210
_0806DA50: .4byte 0x06014300
_0806DA54: .4byte 0x01000040
	thumb_func_end sub_806D668

	thumb_func_start sub_806D718
sub_806D718: @ 806DA58
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806DB04
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	cmp r4, 0x1
	bhi _0806DA76
	ldr r0, _0806DB08
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
_0806DA76:
	cmp r4, 0x2
	beq _0806DA7E
	cmp r4, 0
	bne _0806DA86
_0806DA7E:
	ldr r0, _0806DB0C
	ldr r1, _0806DB10
	bl LZDecompressVram
_0806DA86:
	cmp r4, 0x3
	beq _0806DA8E
	cmp r4, 0
	bne _0806DA9A
_0806DA8E:
	ldr r0, _0806DB14
	movs r2, 0xB0
	lsls r2, 1
	movs r1, 0
	bl LoadCompressedPalette
_0806DA9A:
	cmp r4, 0x4
	beq _0806DAA2
	cmp r4, 0
	bne _0806DAB6
_0806DAA2:
	mov r0, sp
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0806DB18
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
_0806DAB6:
	cmp r4, 0x5
	beq _0806DABE
	cmp r4, 0
	bne _0806DAC6
_0806DABE:
	ldr r0, _0806DB1C
	ldr r1, _0806DB20
	bl LZDecompressVram
_0806DAC6:
	cmp r4, 0x6
	beq _0806DACE
	cmp r4, 0
	bne _0806DAD6
_0806DACE:
	ldr r0, _0806DB24
	ldr r1, _0806DB28
	bl LZDecompressVram
_0806DAD6:
	cmp r4, 0x7
	beq _0806DADE
	cmp r4, 0
	bne _0806DAE6
_0806DADE:
	ldr r0, _0806DB2C
	ldr r1, _0806DB30
	bl LZDecompressVram
_0806DAE6:
	cmp r4, 0x8
	beq _0806DAEE
	cmp r4, 0
	bne _0806DAFA
_0806DAEE:
	ldr r0, _0806DB34
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r5, 0x1
_0806DAFA:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806DB04: .4byte 0x00007fff
_0806DB08: .4byte gPartyMenuMisc_Gfx
_0806DB0C: .4byte gPartyMenuMisc_Tilemap
_0806DB10: .4byte 0x06003800
_0806DB14: .4byte gPartyMenuMisc_Pal
_0806DB18: .4byte gFontDefaultPalette
_0806DB1C: .4byte gPartyMenuHpBar_Gfx
_0806DB20: .4byte 0x06006000
_0806DB24: .4byte gPartyMenuOrderText_Gfx
_0806DB28: .4byte 0x06006180
_0806DB2C: .4byte gStatusGfx_Icons
_0806DB30: .4byte 0x06007180
_0806DB34: .4byte gStatusPal_Icons
	thumb_func_end sub_806D718

	.align 2, 0 @ Don't pad with nop.
