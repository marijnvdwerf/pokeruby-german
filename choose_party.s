	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8121E10
sub_8121E10: @ 8122190
	push {lr}
	bl sub_8121E58
	ldr r0, _081221AC
	ldr r1, _081221B0
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x4
	bl OpenPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_081221AC: .4byte 0x0201b000
_081221B0: .4byte 0x00000263
	thumb_func_end sub_8121E10

	thumb_func_start sub_8121E34
sub_8121E34: @ 81221B4
	push {lr}
	bl sub_8121E58
	ldr r0, _081221D0
	ldr r1, _081221D4
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0x4
	movs r1, 0
	bl OpenPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_081221D0: .4byte 0x0201b000
_081221D4: .4byte 0x00000263
	thumb_func_end sub_8121E34

	thumb_func_start sub_8121E58
sub_8121E58: @ 81221D8
	push {lr}
	movs r1, 0
	ldr r3, _081221F4
	movs r2, 0
_081221E0:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _081221E0
	pop {r0}
	bx r0
	.align 2, 0
_081221F4: .4byte gUnknown_02039270
	thumb_func_end sub_8121E58

	thumb_func_start sub_8121E78
sub_8121E78: @ 81221F8
	push {r4-r6,lr}
	ldr r1, _08122218
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _0812220E
	b _081223A6
_0812220E:
	lsls r0, 2
	ldr r1, _0812221C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122218: .4byte 0x0201b000
_0812221C: .4byte _08122220
	.align 2, 0
_08122220:
	.4byte _08122240
	.4byte _08122280
	.4byte _08122294
	.4byte _081222A8
	.4byte _081222D4
	.4byte _081222E8
	.4byte _081222EE
	.4byte _08122378
_08122240:
	ldr r0, _08122268
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _0812226C
	ldrb r0, [r0]
	cmp r3, r0
	bge _08122274
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _08122270
	adds r2, r3
	bl sub_806D90C
	b _081223A0
	.align 2, 0
_08122268: .4byte 0x00000266
_0812226C: .4byte gPlayerPartyCount
_08122270: .4byte gPlayerParty
_08122274:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08122368
_08122280:
	bl sub_806DA98
	ldr r1, _08122290
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
	b _08122368
	.align 2, 0
_08122290: .4byte 0x0201b000
_08122294:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _08122368
_081222A8:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _081222D0
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081223A0
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08122368
	.align 2, 0
_081222D0: .4byte 0x00000266
_081222D4:
	bl sub_806E334
	ldr r1, _081222E4
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
	b _08122368
	.align 2, 0
_081222E4: .4byte 0x0201b000
_081222E8:
	bl sub_806E0C4
	b _08122360
_081222EE:
	movs r5, 0
	b _08122358
_081222F2:
	movs r4, 0
	adds r6, r5, 0x1
	b _081222FE
_081222F8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_081222FE:
	cmp r4, 0x2
	bhi _08122320
	ldr r0, _08122344
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, r6
	bne _081222F8
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 25
	movs r2, 0xE0
	lsls r2, 21
	adds r1, r2
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_806BC3C
_08122320:
	cmp r4, 0x3
	bne _08122354
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08122348
	adds r0, r1
	bl sub_8122030
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812234C
	adds r0, r5, 0
	movs r1, 0x70
	bl sub_806BC3C
	b _08122354
	.align 2, 0
_08122344: .4byte gUnknown_02039270
_08122348: .4byte gPlayerParty
_0812234C:
	adds r0, r5, 0
	movs r1, 0x7E
	bl sub_806BC3C
_08122354:
	lsls r0, r6, 24
	lsrs r5, r0, 24
_08122358:
	ldr r0, _08122370
	ldrb r0, [r0]
	cmp r5, r0
	bcc _081222F2
_08122360:
	ldr r1, _08122374
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
_08122368:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081223A6
	.align 2, 0
_08122370: .4byte gPlayerPartyCount
_08122374: .4byte 0x0201b000
_08122378:
	ldr r1, _0812239C
	adds r5, r4, r1
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081223A0
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _081223A8
	.align 2, 0
_0812239C: .4byte 0x00000266
_081223A0:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_081223A6:
	movs r0, 0
_081223A8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8121E78

	thumb_func_start sub_8122030
sub_8122030: @ 81223B0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _081223FC
	ldr r0, _081223D8
	ldr r1, _081223DC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _081223E0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _081223FC
	b _08122436
	.align 2, 0
_081223D8: .4byte 0x0201b000
_081223DC: .4byte 0x00000263
_081223E0:
	ldr r0, _08122400
	ldr r1, _08122404
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08122408
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x32
	bls _08122408
_081223FC:
	movs r0, 0
	b _08122438
	.align 2, 0
_08122400: .4byte gSaveBlock2
_08122404: .4byte 0x00000554
_08122408:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r1, _08122440
	movs r0, 0
	lsls r0, 1
	adds r2, r0, r1
	ldrh r0, [r2]
	ldr r1, _08122444
	cmp r0, r1
	beq _08122436
	adds r4, r1, 0
	adds r1, r2, 0
_08122428:
	ldrh r0, [r1]
	cmp r0, r3
	beq _081223FC
	adds r1, 0x2
	ldrh r0, [r1]
	cmp r0, r4
	bne _08122428
_08122436:
	movs r0, 0x1
_08122438:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08122440: .4byte gBattleTowerBanlist
_08122444: .4byte 0x0000ffff
	thumb_func_end sub_8122030

	thumb_func_start sub_81220C8
sub_81220C8: @ 8122448
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _0812246C
	ldr r2, _08122470
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08122522
	ldr r0, _08122474
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _08122480
	movs r0, 0x11
	b _08122524
	.align 2, 0
_0812246C: .4byte 0x0201b000
_08122470: .4byte 0x00000263
_08122474: .4byte gUnknown_02039270
_08122478:
	movs r0, 0x12
	b _08122524
_0812247C:
	movs r0, 0x13
	b _08122524
_08122480:
	movs r5, 0
_08122482:
	ldr r4, _08122534
	adds r4, r5, r4
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08122538
	adds r0, r2
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0812253C
	ldr r2, _08122540
	adds r6, r1, r2
	strh r0, [r6]
	ldrb r0, [r4]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08122538
	adds r0, r2
	movs r1, 0xC
	bl GetMonData
	ldr r1, _08122544
	strh r0, [r1]
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r10, r1
	cmp r5, 0x2
	bhi _08122518
	ldr r2, _08122548
	adds r2, r6
	mov r9, r2
	movs r0, 0x64
	mov r8, r0
	ldr r7, _08122538
_081224CA:
	ldr r0, _08122540
	add r0, r9
	movs r1, 0
	ldrsh r4, [r0, r1]
	ldr r0, _08122534
	adds r6, r5, r0
	ldrb r0, [r6]
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	adds r0, r7
	movs r1, 0xB
	bl GetMonData
	cmp r4, r0
	beq _08122478
	movs r1, 0xA0
	lsls r1, 2
	add r1, r9
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0812250E
	adds r4, r0, 0
	ldrb r0, [r6]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0xC
	bl GetMonData
	cmp r4, r0
	beq _0812247C
_0812250E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081224CA
_08122518:
	mov r2, r10
	lsls r0, r2, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08122482
_08122522:
	movs r0, 0xFF
_08122524:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08122534: .4byte gUnknown_02039270
_08122538: .4byte gUnknown_030042FC
_0812253C: .4byte 0x0201b000
_08122540: .4byte 0x00000282
_08122544: .4byte 0x0201b280
_08122548: .4byte 0xfffffd7e
	thumb_func_end sub_81220C8

	thumb_func_start sub_81221CC
sub_81221CC: @ 812254C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08122564
_08122556:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08122568
	movs r0, 0x1
	b _08122574
	.align 2, 0
_08122564: .4byte gUnknown_02039270
_08122568:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _08122556
	movs r0, 0
_08122574:
	pop {r1}
	bx r1
	thumb_func_end sub_81221CC

	thumb_func_start sub_81221F8
sub_81221F8: @ 8122578
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x5
	movs r1, 0x1
	bl sub_806D538
	ldr r5, _081225C8
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081225CC
	adds r0, r1
	bl sub_8122030
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122604
	ldrb r0, [r5]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	bl sub_81221CC
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bne _081225DC
	ldr r1, _081225D0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	ldr r1, _081225D4
	ldr r2, _081225D8
	movs r0, 0x1
	b _081225F0
	.align 2, 0
_081225C8: .4byte gUnknown_03005CE0
_081225CC: .4byte gPlayerParty
_081225D0: .4byte gTasks
_081225D4: .4byte gUnknown_084017D8
_081225D8: .4byte gUnknown_084017B0
_081225DC:
	ldr r1, _081225F8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x10]
	ldr r1, _081225FC
	ldr r2, _08122600
	movs r0, 0
_081225F0:
	movs r3, 0
	bl sub_806E750
	b _0812261E
	.align 2, 0
_081225F8: .4byte gTasks
_081225FC: .4byte gUnknown_084017D8
_08122600: .4byte gUnknown_084017B0
_08122604:
	ldr r1, _08122624
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x10]
	ldr r1, _08122628
	ldr r2, _0812262C
	movs r0, 0x2
	movs r3, 0
	bl sub_806E750
_0812261E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122624: .4byte gTasks
_08122628: .4byte gUnknown_084017D8
_0812262C: .4byte gUnknown_084017B0
	thumb_func_end sub_81221F8

	thumb_func_start sub_81222B0
sub_81222B0: @ 8122630
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812265C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _081226FC
	adds r0, r4, 0
	bl sub_806BE38
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08122660
	cmp r0, 0x2
	beq _081226D4
	b _081226FC
	.align 2, 0
_0812265C: .4byte gPaletteFade
_08122660:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _081226A0
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _081226B4
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081226A4
	adds r0, r1
	ldr r1, _081226A8
	bl GetMonNickname
	adds r0, r4, 0
	bl sub_81221F8
	ldr r1, _081226AC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081226B0
	str r1, [r0]
	b _081226C2
	.align 2, 0
_081226A0: .4byte gUnknown_03005CE0
_081226A4: .4byte gPlayerParty
_081226A8: .4byte gStringVar1
_081226AC: .4byte gTasks
_081226B0: .4byte sub_812238C
_081226B4:
	ldr r0, _081226CC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _081226D0
	str r0, [r1]
_081226C2:
	adds r0, r4, 0
	bl sub_808B5B4
	b _081226FC
	.align 2, 0
_081226CC: .4byte gTasks
_081226D0: .4byte sub_81224A8
_081226D4:
	movs r0, 0x5
	bl PlaySE
	bl sub_8121E58
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08122704
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122708
	str r1, [r0]
_081226FC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122704: .4byte gTasks
_08122708: .4byte sub_8122450
	thumb_func_end sub_81222B0

	thumb_func_start sub_812238C
sub_812238C: @ 812270C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, r7, 0
	ldr r0, _08122748
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _081227CA
	ldr r2, _0812274C
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08122750
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _081227CA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _081227CA
	.align 2, 0
_08122748: .4byte gPaletteFade
_0812274C: .4byte gMain
_08122750:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08122772
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _081227CA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _081227CA
_08122772:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081227BC
	movs r0, 0x5
	bl PlaySE
	ldr r1, _081227B0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0x10]
	ldr r5, _081227B4
	ldr r6, _081227B8
	bl GetMenuCursorPos
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r7, 0
	bl _call_via_r1
	b _081227CA
	.align 2, 0
_081227B0: .4byte gTasks
_081227B4: .4byte gUnknown_084017D8
_081227B8: .4byte gUnknown_084017B0
_081227BC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081227CA
	adds r0, r4, 0
	bl sub_8122838
_081227CA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812238C

	thumb_func_start sub_8122450
sub_8122450: @ 81227D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081227F8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081227F0
	ldr r0, _081227FC
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_081227F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081227F8: .4byte gPaletteFade
_081227FC: .4byte gMain
	thumb_func_end sub_8122450

	thumb_func_start sub_8122480
sub_8122480: @ 8122800
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08122824
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0812281A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08122820
_0812281A:
	adds r0, r2, 0
	bl sub_8122838
_08122820:
	pop {r0}
	bx r0
	.align 2, 0
_08122824: .4byte gMain
	thumb_func_end sub_8122480

	thumb_func_start sub_81224A8
sub_81224A8: @ 8122828
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_81220C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08122850
	movs r1, 0
	bl sub_806D538
	ldr r0, _0812284C
	lsls r1, r4, 2
	adds r1, r4
	b _08122898
	.align 2, 0
_0812284C: .4byte gTasks
_08122850:
	ldr r0, _08122878
	ldrb r0, [r0]
	cmp r0, 0
	beq _08122884
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0812287C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122880
	str r1, [r0]
	b _081228A0
	.align 2, 0
_08122878: .4byte gUnknown_02039270
_0812287C: .4byte gTasks
_08122880: .4byte sub_8122450
_08122884:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xE
	movs r1, 0
	bl sub_806D538
	ldr r0, _081228A8
	lsls r1, r5, 2
	adds r1, r5
_08122898:
	lsls r1, 3
	adds r1, r0
	ldr r0, _081228AC
	str r0, [r1]
_081228A0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081228A8: .4byte gTasks
_081228AC: .4byte sub_8122480
	thumb_func_end sub_81224A8

	thumb_func_start sub_8122530
sub_8122530: @ 81228B0
	push {r4,r5,lr}
	ldr r5, _081228F8
	ldr r4, _081228FC
_081228B6:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122910
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806C658
	ldrb r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122900
	adds r0, r1
	ldr r1, _08122904
	bl GetMonNickname
	ldr r1, _08122908
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r5]
	bl sub_81221F8
	ldr r0, _0812290C
	bl SetMainCallback2
	b _0812291C
	.align 2, 0
_081228F8: .4byte 0x0201b260
_081228FC: .4byte gUnknown_020384F0
_08122900: .4byte gPlayerParty
_08122904: .4byte gStringVar1
_08122908: .4byte gUnknown_03005CE0
_0812290C: .4byte sub_806AEDC
_08122910:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081228B6
_0812291C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8122530

	thumb_func_start sub_81225A4
sub_81225A4: @ 8122924
	push {lr}
	ldr r2, _08122948
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0812294C
	movs r0, 0x4
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _08122950
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08122948: .4byte gPaletteFade
_0812294C: .4byte sub_812238C
_08122950: .4byte sub_8122530
	thumb_func_end sub_81225A4

	thumb_func_start sub_81225D4
sub_81225D4: @ 8122954
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _081229BC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _081229B2
	ldr r2, _081229C0
	ldr r1, _081229C4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _081229C8
	ldr r1, _081229CC
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _081229D0
	ldr r1, _081229D4
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _081229D8
	str r5, [sp]
	adds r1, r4, 0
	bl sub_809D8BC
_081229B2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081229BC: .4byte gPaletteFade
_081229C0: .4byte gSprites
_081229C4: .4byte gTasks
_081229C8: .4byte 0x0201b000
_081229CC: .4byte 0x00000262
_081229D0: .4byte gPlayerParty
_081229D4: .4byte gPlayerPartyCount
_081229D8: .4byte sub_81225A4
	thumb_func_end sub_81225D4

	thumb_func_start sub_812265C
sub_812265C: @ 81229DC
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
	ldr r1, _08122A0C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122A10
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122A0C: .4byte gTasks
_08122A10: .4byte sub_81225D4
	thumb_func_end sub_812265C

	thumb_func_start sub_8122694
sub_8122694: @ 8122A14
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r3, _08122A54
	ldr r2, _08122A58
_08122A20:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _08122A5C
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 25
	movs r2, 0xE0
	lsls r2, 21
	adds r1, r2
	lsrs r1, 24
	bl sub_806BC3C
	cmp r4, 0x2
	bne _08122A4C
	adds r0, r5, 0
	bl sub_806C890
_08122A4C:
	adds r0, r5, 0
	bl sub_8122838
	b _08122A96
	.align 2, 0
_08122A54: .4byte gUnknown_02039270
_08122A58: .4byte gUnknown_03005CE0
_08122A5C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08122A20
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	bl sub_806D5A4
	ldr r0, _08122A9C
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08122AA0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122AA4
	str r1, [r0]
_08122A96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08122A9C: .4byte gOtherText_NoMoreThreePoke
_08122AA0: .4byte gTasks
_08122AA4: .4byte sub_8122728
	thumb_func_end sub_8122694

	thumb_func_start sub_8122728
sub_8122728: @ 8122AA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122AE8
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08122AE0
	ldr r0, _08122AEC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08122ACA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08122AE0
_08122ACA:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	adds r0, r4, 0
	bl sub_8122838
_08122AE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122AE8: .4byte gUnknown_0202E8F6
_08122AEC: .4byte gMain
	thumb_func_end sub_8122728

	thumb_func_start sub_8122770
sub_8122770: @ 8122AF0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _08122B18
	ldr r3, _08122B1C
_08122AFC:
	adds r2, r4, r3
	ldrb r1, [r2]
	ldrb r0, [r5]
	adds r0, 0x1
	cmp r1, r0
	bne _08122B34
	movs r1, 0
	strb r1, [r2]
	cmp r4, 0
	beq _08122B20
	cmp r4, 0x1
	beq _08122B2C
	b _08122B3E
	.align 2, 0
_08122B18: .4byte gUnknown_03005CE0
_08122B1C: .4byte gUnknown_02039270
_08122B20:
	ldrb r0, [r3, 0x1]
	strb r0, [r3]
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r4, [r3, 0x2]
	b _08122B3E
_08122B2C:
	ldrb r0, [r3, 0x2]
	strb r0, [r3, 0x1]
	strb r1, [r3, 0x2]
	b _08122B3E
_08122B34:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08122AFC
_08122B3E:
	ldrb r0, [r5]
	movs r1, 0x70
	bl sub_806BC3C
	ldr r4, _08122B78
	ldrb r0, [r4]
	cmp r0, 0
	beq _08122B5A
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1C
	bl sub_806BC3C
_08122B5A:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08122B6C
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2A
	bl sub_806BC3C
_08122B6C:
	adds r0, r6, 0
	bl sub_8122838
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122B78: .4byte gUnknown_02039270
	thumb_func_end sub_8122770

	thumb_func_start sub_81227FC
sub_81227FC: @ 8122B7C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _08122BB0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122BB4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122BB0: .4byte gTasks
_08122BB4: .4byte sub_81222B0
	thumb_func_end sub_81227FC

	thumb_func_start sub_8122838
sub_8122838: @ 8122BB8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_81227FC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8122838

	thumb_func_start sub_8122854
sub_8122854: @ 8122BD4
	push {r4,lr}
	ldr r1, _08122BF4
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _08122C60
	lsls r0, 2
	ldr r1, _08122BF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122BF4: .4byte 0x0201b000
_08122BF8: .4byte _08122BFC
	.align 2, 0
_08122BFC:
	.4byte _08122C10
	.4byte _08122C24
	.4byte _08122C2A
	.4byte _08122C3E
	.4byte _08122C58
_08122C10:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_81228E8
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _08122C4A
_08122C24:
	bl sub_806DA98
	b _08122C42
_08122C2A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_8122950
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _08122C4A
_08122C3E:
	bl sub_81229B8
_08122C42:
	ldr r1, _08122C54
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
_08122C4A:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08122C60
	.align 2, 0
_08122C54: .4byte 0x0201b000
_08122C58:
	bl sub_806B908
	movs r0, 0x1
	b _08122C62
_08122C60:
	movs r0, 0
_08122C62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8122854

	thumb_func_start sub_81228E8
sub_81228E8: @ 8122C68
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_08122C70:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08122CC8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122C92
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x3
	adds r3, r4, 0
	bl sub_806D880
_08122C92:
	ldr r0, _08122CCC
	lsls r1, r5, 5
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _08122CB6
	adds r4, r5, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x3
	bl sub_806D99C
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_806D50C
_08122CB6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08122C70
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122CC8: .4byte gPlayerParty
_08122CCC: .4byte gUnknown_02023A00
	thumb_func_end sub_81228E8

	thumb_func_start sub_8122950
sub_8122950: @ 8122CD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_08122CD8:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08122D30
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122D04
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806DCD4
_08122D04:
	ldr r0, _08122D34
	lsls r1, r5, 5
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, 0
	beq _08122D1E
	adds r1, r5, 0x3
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r2, 0x2]
	adds r0, r6, 0
	bl sub_806DCD4
_08122D1E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08122CD8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122D30: .4byte gPlayerParty
_08122D34: .4byte gUnknown_02023A00
	thumb_func_end sub_8122950

	thumb_func_start sub_81229B8
sub_81229B8: @ 8122D38
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x64
	ldr r6, _08122D80
_08122D40:
	adds r0, r5, 0
	muls r0, r7
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122DB6
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E4A4
	adds r0, r4, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08122D84
	cmp r0, 0x6
	beq _08122D84
	subs r2, r0, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E104
	b _08122D92
	.align 2, 0
_08122D80: .4byte gPlayerParty
_08122D84:
	adds r2, r5, 0
	muls r2, r7
	adds r2, r6
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E294
_08122D92:
	adds r4, r5, 0
	muls r4, r7
	adds r4, r6
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E3C0
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E050
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl sub_806E630
_08122DB6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08122D40
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81229B8

	thumb_func_start sub_8122A48
sub_8122A48: @ 8122DC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08122E20
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122E18
	ldr r0, _08122E24
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	movs r0, 0x1E
	strh r0, [r4, 0x8]
	ldr r5, _08122E28
	ldrh r1, [r5]
	adds r0, r6, 0
	movs r2, 0
	bl sub_806D4AC
	ldrh r1, [r5, 0x20]
	adds r0, r6, 0
	movs r2, 0x1
	bl sub_806D4AC
	adds r5, 0x40
	ldrh r1, [r5]
	adds r0, r6, 0
	movs r2, 0x2
	bl sub_806D4AC
	ldr r0, _08122E2C
	str r0, [r4]
	ldr r0, _08122E30
	ldr r1, _08122E34
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_08122E18:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122E20: .4byte gPaletteFade
_08122E24: .4byte gTasks
_08122E28: .4byte gUnknown_02023A00
_08122E2C: .4byte sub_8122AB8
_08122E30: .4byte 0x0201b000
_08122E34: .4byte 0x00000261
	thumb_func_end sub_8122A48

	thumb_func_start sub_8122AB8
sub_8122AB8: @ 8122E38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08122E7C
	ldrh r1, [r0, 0x20]
	adds r0, 0x40
	ldrh r2, [r0]
	adds r0, r4, 0
	bl sub_806D3B4
	ldr r1, _08122E80
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08122E74
	ldr r0, _08122E84
	str r0, [r1]
	ldr r0, _08122E88
	ldr r1, _08122E8C
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x78
	bl PlaySE
_08122E74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122E7C: .4byte gUnknown_02023A00
_08122E80: .4byte gTasks
_08122E84: .4byte sub_8122B10
_08122E88: .4byte 0x0201b000
_08122E8C: .4byte 0x00000261
	thumb_func_end sub_8122AB8

	thumb_func_start sub_8122B10
sub_8122B10: @ 8122E90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r8, r0
	ldr r1, _08122EDC
	mov r10, r1
	ldr r2, _08122EE0
	mov r9, r2
_08122EAE:
	mov r1, r8
	lsls r0, r1, 5
	mov r2, r10
	adds r6, r0, r2
	ldrh r1, [r6]
	adds r7, r0, 0
	cmp r1, 0
	beq _08122F5A
	mov r4, r8
	adds r4, 0x3
	lsls r0, r4, 24
	lsrs r5, r0, 24
	ldrh r2, [r6, 0x10]
	ldrh r3, [r6, 0x12]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E420
	ldrh r0, [r6, 0x10]
	cmp r0, 0
	bne _08122EE4
	movs r2, 0x7
	b _08122EF6
	.align 2, 0
_08122EDC: .4byte gUnknown_02023A00
_08122EE0: .4byte gStringVar1
_08122EE4:
	ldr r1, _08122F08
	adds r0, r7, r1
	ldr r0, [r0]
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08122F0C
_08122EF6:
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x3
	bl sub_806E104
	b _08122F16
	.align 2, 0
_08122F08: .4byte gUnknown_02023A14
_08122F0C:
	ldrb r2, [r6, 0xF]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_806E1F4
_08122F16:
	mov r2, r10
	adds r6, r7, r2
	ldrh r0, [r6]
	ldrb r1, [r6, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _08122F8C
	adds r5, r7, r2
	str r5, [sp]
	movs r2, 0x3
	adds r3, r4, 0
	bl sub_806E35C
	mov r0, r9
	adds r1, r5, 0
	bl StringCopy
	mov r0, r9
	bl StringGetEnd10
	mov r0, r9
	bl sub_814A568
	adds r0, r4, 0
	movs r1, 0x3
	mov r2, r9
	bl box_print
	ldrh r2, [r6, 0x10]
	ldrh r3, [r6, 0x12]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_806E574
_08122F5A:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x2
	bls _08122EAE
	ldr r1, _08122F90
	ldr r2, [sp, 0x4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122F94
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x8]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122F8C: .4byte gUnknown_02023A04
_08122F90: .4byte gTasks
_08122F94: .4byte sub_8122C18
	thumb_func_end sub_8122B10

	thumb_func_start sub_8122C18
sub_8122C18: @ 8122F98
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08122FD8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bne _08122FCE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08122FDC
	str r0, [r4]
_08122FCE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122FD8: .4byte gTasks
_08122FDC: .4byte sub_8122450
	thumb_func_end sub_8122C18

	thumb_func_start unref_sub_8122C60
unref_sub_8122C60: @ 8122FE0
	push {r4,r5,lr}
	ldr r1, _08123000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _08122FF6
	b _0812310A
_08122FF6:
	lsls r0, 2
	ldr r1, _08123004
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08123000: .4byte 0x0201b000
_08123004: .4byte _08123008
	.align 2, 0
_08123008:
	.4byte _08123028
	.4byte _08123068
	.4byte _0812306E
	.4byte _08123082
	.4byte _081230AC
	.4byte _081230B2
	.4byte _081230C4
	.4byte _081230DC
_08123028:
	ldr r0, _08123050
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _08123054
	ldrb r0, [r0]
	cmp r3, r0
	bge _0812305C
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _08123058
	adds r2, r3
	bl sub_806D90C
	b _08123104
	.align 2, 0
_08123050: .4byte 0x00000266
_08123054: .4byte gPlayerPartyCount
_08123058: .4byte gPlayerParty
_0812305C:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _081230D0
_08123068:
	bl sub_806DA98
	b _081230C8
_0812306E:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _081230D0
_08123082:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _081230A8
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08123104
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _081230D0
	.align 2, 0
_081230A8: .4byte 0x00000266
_081230AC:
	bl sub_806E334
	b _081230C8
_081230B2:
	bl sub_806E0C4
	ldr r1, _081230C0
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _081230D0
	.align 2, 0
_081230C0: .4byte 0x0201b000
_081230C4:
	bl sub_806BCE8
_081230C8:
	ldr r1, _081230D8
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_081230D0:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0812310A
	.align 2, 0
_081230D8: .4byte 0x0201b000
_081230DC:
	ldr r0, _08123100
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08123104
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _0812310C
	.align 2, 0
_08123100: .4byte 0x00000266
_08123104:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0812310A:
	movs r0, 0
_0812310C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8122C60

	thumb_func_start sub_8122D94
sub_8122D94: @ 8123114
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812314C
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123150
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	adds r2, r0, 0
	cmp r2, 0
	bne _08123160
	ldr r1, _08123154
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	ldr r1, _08123158
	ldr r2, _0812315C
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	b _0812317A
	.align 2, 0
_0812314C: .4byte gUnknown_03005CE0
_08123150: .4byte gPlayerParty
_08123154: .4byte gTasks
_08123158: .4byte gUnknown_08401810
_0812315C: .4byte gUnknown_084017F0
_08123160:
	ldr r1, _08123180
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x10]
	ldr r1, _08123184
	ldr r2, _08123188
	movs r0, 0x1
	movs r3, 0
	bl sub_806E750
_0812317A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123180: .4byte gTasks
_08123184: .4byte gUnknown_08401810
_08123188: .4byte gUnknown_084017F0
	thumb_func_end sub_8122D94

	thumb_func_start sub_8122E0C
sub_8122E0C: @ 812318C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081231B4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812321C
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _081231B8
	cmp r0, 0x2
	beq _08123204
	b _0812321C
	.align 2, 0
_081231B4: .4byte gPaletteFade
_081231B8:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _081231F0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081231F4
	adds r0, r1
	ldr r1, _081231F8
	bl GetMonNickname
	adds r0, r4, 0
	bl sub_8122D94
	ldr r1, _081231FC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123200
	str r1, [r0]
	b _0812321C
	.align 2, 0
_081231F0: .4byte gUnknown_03005CE0
_081231F4: .4byte gPlayerParty
_081231F8: .4byte gStringVar1
_081231FC: .4byte gTasks
_08123200: .4byte sub_8122EAC
_08123204:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08123224
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _08123228
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8123138
_0812321C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123224: .4byte gUnknown_03005CE0
_08123228: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8122E0C

	thumb_func_start sub_8122EAC
sub_8122EAC: @ 812322C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, r7, 0
	ldr r0, _08123268
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _081232EA
	ldr r2, _0812326C
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08123270
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _081232EA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _081232EA
	.align 2, 0
_08123268: .4byte gPaletteFade
_0812326C: .4byte gMain
_08123270:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08123292
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _081232EA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _081232EA
_08123292:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081232DC
	movs r0, 0x5
	bl PlaySE
	ldr r1, _081232D0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0x10]
	ldr r5, _081232D4
	ldr r6, _081232D8
	bl GetMenuCursorPos
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r7, 0
	bl _call_via_r1
	b _081232EA
	.align 2, 0
_081232D0: .4byte gTasks
_081232D4: .4byte gUnknown_08401810
_081232D8: .4byte gUnknown_084017F0
_081232DC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081232EA
	adds r0, r4, 0
	bl sub_81230F4
_081232EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8122EAC

	thumb_func_start sub_8122F70
sub_8122F70: @ 81232F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08123308
	ldr r1, _0812330C
	ldrb r1, [r1]
	strh r1, [r2]
	bl sub_8123138
	pop {r0}
	bx r0
	.align 2, 0
_08123308: .4byte gSpecialVar_0x8004
_0812330C: .4byte gUnknown_03005CE0
	thumb_func_end sub_8122F70

	thumb_func_start sub_8122F90
sub_8122F90: @ 8123310
	push {r4,r5,lr}
	ldr r5, _08123358
	ldr r4, _0812335C
_08123316:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08123370
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806BF74
	ldrb r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08123360
	adds r0, r1
	ldr r1, _08123364
	bl GetMonNickname
	ldr r1, _08123368
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r5]
	bl sub_8122D94
	ldr r0, _0812336C
	bl SetMainCallback2
	b _0812337C
	.align 2, 0
_08123358: .4byte 0x0201b260
_0812335C: .4byte gUnknown_020384F0
_08123360: .4byte gPlayerParty
_08123364: .4byte gStringVar1
_08123368: .4byte gUnknown_03005CE0
_0812336C: .4byte sub_806AEDC
_08123370:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08123316
_0812337C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8122F90

	thumb_func_start sub_8123004
sub_8123004: @ 8123384
	push {lr}
	ldr r2, _081233A8
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _081233AC
	movs r0, 0x6
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _081233B0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_081233A8: .4byte gPaletteFade
_081233AC: .4byte sub_8122EAC
_081233B0: .4byte sub_8122F90
	thumb_func_end sub_8123004

	thumb_func_start sub_8123034
sub_8123034: @ 81233B4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0812341C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08123412
	ldr r2, _08123420
	ldr r1, _08123424
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _08123428
	ldr r1, _0812342C
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08123430
	ldr r1, _08123434
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08123438
	str r5, [sp]
	adds r1, r4, 0
	bl sub_809D8BC
_08123412:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812341C: .4byte gPaletteFade
_08123420: .4byte gSprites
_08123424: .4byte gTasks
_08123428: .4byte 0x0201b000
_0812342C: .4byte 0x00000262
_08123430: .4byte gPlayerParty
_08123434: .4byte gPlayerPartyCount
_08123438: .4byte sub_8123004
	thumb_func_end sub_8123034

	thumb_func_start sub_81230BC
sub_81230BC: @ 812343C
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
	ldr r1, _0812346C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123470
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812346C: .4byte gTasks
_08123470: .4byte sub_8123034
	thumb_func_end sub_81230BC

	thumb_func_start sub_81230F4
sub_81230F4: @ 8123474
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	movs r0, 0xF
	movs r1, 0
	bl sub_806D538
	ldr r1, _081234B0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081234B4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081234B0: .4byte gTasks
_081234B4: .4byte sub_8122E0C
	thumb_func_end sub_81230F4

	thumb_func_start sub_8123138
sub_8123138: @ 81234B8
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
	ldr r1, _081234E8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081234EC
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081234E8: .4byte gTasks
_081234EC: .4byte sub_8123170
	thumb_func_end sub_8123138

	thumb_func_start sub_8123170
sub_8123170: @ 81234F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812351C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123514
	ldr r0, _08123520
	ldr r1, _08123524
	str r1, [r0]
	ldr r0, _08123528
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08123514:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812351C: .4byte gPaletteFade
_08123520: .4byte gUnknown_0300485C
_08123524: .4byte sub_81231AC
_08123528: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8123170

	thumb_func_start sub_81231AC
sub_81231AC: @ 812352C
	push {lr}
	bl pal_fill_black
	ldr r0, _08123540
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08123540: .4byte sub_81231C4
	thumb_func_end sub_81231AC

	thumb_func_start sub_81231C4
sub_81231C4: @ 8123544
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08123564
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_08123564:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81231C4

	.align 2, 0 @ Don't pad with nop.
