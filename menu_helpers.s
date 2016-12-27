	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F9020
sub_80F9020: @ 80F93D0
	push {r4,r5,lr}
	ldr r4, _080F9404
	movs r5, 0x80
	lsls r5, 4
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	adds r0, r4, r5
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r0, 0x80
	lsls r0, 5
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9404: .4byte 0x020219cc
	thumb_func_end sub_80F9020

	thumb_func_start sav2_get_text_speed
sav2_get_text_speed: @ 80F9408
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	bl MenuDisplayMessageBox
	cmp r4, 0
	beq _080F942C
	ldr r0, _080F943C
	movs r1, 0x4
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r1, 0x2
	movs r2, 0xF
	movs r3, 0x1A
	bl sub_80A3FA0
_080F942C:
	adds r0, r5, 0
	bl sub_8072044
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F943C: .4byte 0x020219cc
	thumb_func_end sav2_get_text_speed

	thumb_func_start sub_80F9090
sub_80F9090: @ 80F9440
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F945C
	ldr r0, _080F9464
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080F945C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9464: .4byte gUnknown_0300074C
	thumb_func_end sub_80F9090

	thumb_func_start DisplayItemMessageOnField
DisplayItemMessageOnField: @ 80F9468
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	adds r1, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r1, 16
	bl sav2_get_text_speed
	ldr r0, _080F9498
	str r5, [r0]
	ldr r1, _080F949C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080F94A0
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9498: .4byte gUnknown_0300074C
_080F949C: .4byte gTasks
_080F94A0: .4byte sub_80F9090
	thumb_func_end DisplayItemMessageOnField

	thumb_func_start Task_CallYesOrNoCallback
Task_CallYesOrNoCallback: @ 80F94A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080F94CA
	cmp r1, 0
	bgt _080F94C4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080F94E0
	b _080F94F0
_080F94C4:
	cmp r1, 0x1
	beq _080F94E0
	b _080F94F0
_080F94CA:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080F94DC
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080F94F0
	.align 2, 0
_080F94DC: .4byte gUnknown_020388C4
_080F94E0:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080F94F8
	ldr r1, [r0, 0x4]
	adds r0, r4, 0
	bl _call_via_r1
_080F94F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F94F8: .4byte gUnknown_020388C4
	thumb_func_end Task_CallYesOrNoCallback

	thumb_func_start sub_80F914C
sub_80F914C: @ 80F94FC
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080F951C
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r3]
	str r2, [r3, 0x4]
	ldr r2, _080F9520
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080F9524
	str r0, [r1]
	bx lr
	.align 2, 0
_080F951C: .4byte gUnknown_020388C4
_080F9520: .4byte gTasks
_080F9524: .4byte Task_CallYesOrNoCallback
	thumb_func_end sub_80F914C

	thumb_func_start brm_trade_1
brm_trade_1: @ 80F9528
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	ldr r1, _080F9570
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	cmp r4, 0xFF
	beq _080F957C
	mov r0, sp
	strb r4, [r0, 0x2]
	ldr r4, _080F9574
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringAppend
	mov r1, sp
	ldr r0, _080F9578
	ldr r0, [r0]
	ldrb r0, [r0, 0x6]
	strb r0, [r1, 0x2]
	adds r0, r4, 0
	bl StringAppend
	b _080F9584
	.align 2, 0
_080F9570: .4byte gUnknown_083E5A18
_080F9574: .4byte gStringVar4
_080F9578: .4byte gMenuWindowPtr
_080F957C:
	ldr r0, _080F9598
	adds r1, r5, 0
	bl StringCopy
_080F9584:
	ldr r0, _080F9598
	adds r1, r7, 0
	adds r2, r6, 0
	bl MenuPrint
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F9598: .4byte gStringVar4
	thumb_func_end brm_trade_1

	thumb_func_start unref_sub_80F91EC
unref_sub_80F91EC: @ 80F959C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	adds r4, r2, 0
	adds r2, r3, 0
	ldr r0, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r6, _080F95E4
	adds r0, r6, 0
	mov r1, r12
	adds r3, r4, 0
	bl ConvertIntToDecimalStringN
	mov r0, r8
	cmp r0, 0xFF
	beq _080F95E8
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	adds r3, r5, 0
	bl brm_trade_1
	b _080F95F2
	.align 2, 0
_080F95E4: .4byte gStringVar1
_080F95E8:
	adds r0, r6, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl MenuPrint
_080F95F2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80F91EC

	thumb_func_start unref_sub_80F924C
unref_sub_80F924C: @ 80F95FC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F9630
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl brm_trade_1
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F9630: .4byte gUnknown_083E5A1C
	thumb_func_end unref_sub_80F924C

	thumb_func_start sub_80F9284
sub_80F9284: @ 80F9634
	push {lr}
	ldr r0, _080F9650
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080F9666
	ldr r0, _080F9654
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080F9658
	movs r0, 0x1
	b _080F9668
	.align 2, 0
_080F9650: .4byte gSaveBlock2
_080F9654: .4byte gMain
_080F9658:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080F9666
	movs r0, 0x2
	b _080F9668
_080F9666:
	movs r0, 0
_080F9668:
	pop {r1}
	bx r1
	thumb_func_end sub_80F9284

	thumb_func_start sub_80F92BC
sub_80F92BC: @ 80F966C
	push {lr}
	ldr r0, _080F9688
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _080F969E
	ldr r0, _080F968C
	ldrh r1, [r0, 0x30]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080F9690
	movs r0, 0x1
	b _080F96A0
	.align 2, 0
_080F9688: .4byte gSaveBlock2
_080F968C: .4byte gMain
_080F9690:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080F969E
	movs r0, 0x2
	b _080F96A0
_080F969E:
	movs r0, 0
_080F96A0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F92BC

	thumb_func_start sub_80F92F4
sub_80F92F4: @ 80F96A4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _080F96C4
	ldr r0, _080F96BC
	ldrh r1, [r0, 0x4]
	ldr r0, _080F96C0
	cmp r1, r0
	bne _080F96C4
	movs r0, 0
	b _080F96C6
	.align 2, 0
_080F96BC: .4byte gSaveBlock1
_080F96C0: .4byte 0x00001919
_080F96C4:
	movs r0, 0x1
_080F96C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80F92F4

	thumb_func_start sub_80F931C
sub_80F931C: @ 80F96CC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080F96EC
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F96EC
	movs r0, 0
	b _080F96EE
_080F96EC:
	movs r0, 0x1
_080F96EE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F931C

	thumb_func_start sub_80F9344
sub_80F9344: @ 80F96F4
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	beq _080F9706
	ldr r0, _080F970C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F9710
_080F9706:
	movs r0, 0x1
	b _080F9712
	.align 2, 0
_080F970C: .4byte gReceivedRemoteLinkPlayers
_080F9710:
	movs r0, 0
_080F9712:
	pop {r1}
	bx r1
	thumb_func_end sub_80F9344

	thumb_func_start sub_80F9368
sub_80F9368: @ 80F9718
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x14
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	mov r2, sp
	movs r6, 0
	ldr r1, _080F97E0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080F97E4
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080F9776:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _080F9776
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _080F97E0
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
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F97E0: .4byte 0x040000d4
_080F97E4: .4byte 0x81000800
	thumb_func_end sub_80F9368

	thumb_func_start sub_80F9438
sub_80F9438: @ 80F97E8
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r0}
	bx r0
	thumb_func_end sub_80F9438

	thumb_func_start sub_80F944C
sub_80F944C: @ 80F97FC
	push {r4,lr}
	movs r2, 0
	ldr r4, _080F9828
	movs r3, 0xFF
_080F9804:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080F9804
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	ldr r0, _080F982C
	bl LoadSpritePalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9828: .4byte gUnknown_020388C0
_080F982C: .4byte gUnknown_083E5968
	thumb_func_end sub_80F944C

	thumb_func_start sub_80F9480
sub_80F9480: @ 80F9830
	push {r4,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	cmp r2, r1
	bcs _080F984E
	movs r4, 0xFF
_080F9840:
	adds r0, r3, r2
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _080F9840
_080F984E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F9480

	thumb_func_start sub_80F94A4
sub_80F94A4: @ 80F9854
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r3, 16
	lsrs r2, r3, 16
	cmp r4, 0x5
	bhi _080F9898
	ldrb r0, [r5]
	cmp r0, 0xFF
	bne _080F9880
	ldr r0, _080F98A0
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5]
_080F9880:
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F98A4
	adds r0, r1
	adds r1, r4, 0
	bl StartSpriteAnim
_080F9898:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F98A0: .4byte gSpriteTemplate_83E5A00
_080F98A4: .4byte gSprites
	thumb_func_end sub_80F94A4

	thumb_func_start sub_80F94F8
sub_80F94F8: @ 80F98A8
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F98C6
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F98CC
	adds r0, r1
	bl DestroySprite
	movs r0, 0xFF
	strb r0, [r4]
_080F98C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F98CC: .4byte gSprites
	thumb_func_end sub_80F94F8

	thumb_func_start sub_80F9520
sub_80F9520: @ 80F98D0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080F98D6:
	adds r0, r5, r4
	bl sub_80F94F8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080F98D6
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F9520

	thumb_func_start CreateVerticalScrollIndicators
CreateVerticalScrollIndicators: @ 80F98EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r4, 0x3
	bls _080F9900
	b _080F9B40
_080F9900:
	cmp r4, 0x1
	beq _080F99A6
	cmp r4, 0x1
	bgt _080F9914
	cmp r4, 0
	beq _080F9928
	ldr r5, _080F9910
	b _080F9B2A
	.align 2, 0
_080F9910: .4byte gUnknown_020388C0
_080F9914:
	cmp r4, 0x2
	bne _080F991A
	b _080F9A2C
_080F991A:
	cmp r4, 0x3
	bne _080F9920
	b _080F9AA8
_080F9920:
	ldr r5, _080F9924
	b _080F9B2A
	.align 2, 0
_080F9924: .4byte gUnknown_020388C0
_080F9928:
	ldr r0, _080F9988
	ldrb r1, [r0]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080F9934
	b _080F9B2A
_080F9934:
	ldr r0, _080F998C
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5]
	ldr r3, _080F9990
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080F9994
	strh r1, [r0, 0x32]
	ldrb r0, [r5, 0x1]
	cmp r0, 0xFF
	beq _080F9998
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x1]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x26]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x1]
	b _080F9A00
	.align 2, 0
_080F9988: .4byte gUnknown_020388C0
_080F998C: .4byte gSpriteTemplate_83E59D0
_080F9990: .4byte gSprites
_080F9994: .4byte 0x0000ffff
_080F9998:
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r4, [r0, 0x34]
	b _080F9B2A
_080F99A6:
	ldr r0, _080F9A10
	ldrb r1, [r0, 0x1]
	adds r5, r0, 0
	cmp r1, 0xFF
	beq _080F99B2
	b _080F9B2A
_080F99B2:
	ldr r0, _080F9A14
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0x1]
	ldr r3, _080F9A18
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r4, [r0, 0x32]
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080F9A1C
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x26]
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5]
_080F9A00:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x34]
	strh r0, [r1, 0x34]
	b _080F9B2A
	.align 2, 0
_080F9A10: .4byte gUnknown_020388C0
_080F9A14: .4byte gSpriteTemplate_83E59D0
_080F9A18: .4byte gSprites
_080F9A1C:
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strh r0, [r1, 0x34]
	b _080F9B2A
_080F9A2C:
	ldr r0, _080F9A94
	ldrb r1, [r0, 0x2]
	adds r5, r0, 0
	cmp r1, 0xFF
	bne _080F9B2A
	ldr r0, _080F9A98
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0x2]
	ldr r3, _080F9A9C
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080F9AA0
	strh r1, [r0, 0x2E]
	ldrb r0, [r5, 0x3]
	cmp r0, 0xFF
	beq _080F9AA4
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x30]
	b _080F9B28
	.align 2, 0
_080F9A94: .4byte gUnknown_020388C0
_080F9A98: .4byte gSpriteTemplate_83E59E8
_080F9A9C: .4byte gSprites
_080F9AA0: .4byte 0x0000ffff
_080F9AA4:
	ldrb r0, [r5, 0x2]
	b _080F9B1E
_080F9AA8:
	ldr r0, _080F9B10
	ldrb r1, [r0, 0x3]
	adds r5, r0, 0
	cmp r1, 0xFF
	bne _080F9B2A
	ldr r0, _080F9B14
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	strb r0, [r5, 0x3]
	ldr r3, _080F9B18
	ldrb r1, [r5, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	beq _080F9B1C
	ldrb r0, [r5, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x2]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrb r0, [r5, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r5, 0x2]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x30]
	b _080F9B28
	.align 2, 0
_080F9B10: .4byte gUnknown_020388C0
_080F9B14: .4byte gSpriteTemplate_83E59E8
_080F9B18: .4byte gSprites
_080F9B1C:
	ldrb r0, [r5, 0x3]
_080F9B1E:
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
_080F9B28:
	strh r0, [r1, 0x30]
_080F9B2A:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F9B48
	adds r0, r1
	movs r1, 0x1
	ands r1, r4
	bl StartSpriteAnim
_080F9B40:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F9B48: .4byte gSprites
	thumb_func_end CreateVerticalScrollIndicators

	thumb_func_start sub_80F979C
sub_80F979C: @ 80F9B4C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	cmp r2, 0x3
	bhi _080F9B84
	ldr r0, _080F9B88
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F9B84
	ldr r2, _080F9B8C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	movs r0, 0x1
	adds r2, r3, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
_080F9B84:
	pop {r0}
	bx r0
	.align 2, 0
_080F9B88: .4byte gUnknown_020388C0
_080F9B8C: .4byte gSprites
	thumb_func_end sub_80F979C

	thumb_func_start DestroyVerticalScrollIndicator
DestroyVerticalScrollIndicator: @ 80F9B90
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080F9BB8
	ldr r0, _080F9BC0
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F9BB8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F9BC4
	adds r0, r1
	bl DestroySprite
	movs r0, 0xFF
	strb r0, [r4]
_080F9BB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9BC0: .4byte gUnknown_020388C0
_080F9BC4: .4byte gSprites
	thumb_func_end DestroyVerticalScrollIndicator

	thumb_func_start LoadScrollIndicatorPalette
LoadScrollIndicatorPalette: @ 80F9BC8
	push {lr}
	ldr r0, _080F9BD4
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_080F9BD4: .4byte gUnknown_083E5968
	thumb_func_end LoadScrollIndicatorPalette

	thumb_func_start BuyMenuFreeMemory
BuyMenuFreeMemory: @ 80F9BD8
	push {lr}
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end BuyMenuFreeMemory

	thumb_func_start sub_80F9834
sub_80F9834: @ 80F9BE4
	push {lr}
	adds r2, r0, 0
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080F9BF8
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
_080F9BF8:
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080F9C08
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
_080F9C08:
	ldrh r1, [r2, 0x30]
	adds r1, 0x1
	movs r3, 0
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x2
	ble _080F9C20
	strh r3, [r2, 0x30]
_080F9C20:
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0x2
	ble _080F9C2A
	strh r3, [r2, 0x34]
_080F9C2A:
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	cmp r1, 0x8
	beq _080F9C3A
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	bne _080F9C3C
_080F9C3A:
	strh r3, [r2, 0x24]
_080F9C3C:
	movs r0, 0x26
	ldrsh r1, [r2, r0]
	cmp r1, 0x8
	beq _080F9C4C
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	bne _080F9C50
_080F9C4C:
	movs r0, 0
	strh r0, [r2, 0x26]
_080F9C50:
	pop {r0}
	bx r0
	thumb_func_end sub_80F9834

	thumb_func_start sub_80F98A4
sub_80F98A4: @ 80F9C54
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F9C80
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080F9C7A
	cmp r1, 0x3
	bhi _080F9C7A
	ldr r2, _080F9C84
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080F9C88
	str r1, [r0]
_080F9C7A:
	pop {r0}
	bx r0
	.align 2, 0
_080F9C80: .4byte gUnknown_020388C0
_080F9C84: .4byte gSprites
_080F9C88: .4byte SpriteCallbackDummy
	thumb_func_end sub_80F98A4

	thumb_func_start sub_80F98DC
sub_80F98DC: @ 80F9C8C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F9CB8
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _080F9CB2
	cmp r1, 0x3
	bhi _080F9CB2
	ldr r2, _080F9CBC
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080F9CC0
	str r1, [r0]
_080F9CB2:
	pop {r0}
	bx r0
	.align 2, 0
_080F9CB8: .4byte gUnknown_020388C0
_080F9CBC: .4byte gSprites
_080F9CC0: .4byte sub_80F9834
	thumb_func_end sub_80F98DC

	thumb_func_start sub_80F9914
sub_80F9914: @ 80F9CC4
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F9D14
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080F9D0C
	cmp r1, 0x3
	bhi _080F9D0C
	ldr r3, _080F9D18
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x26]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x34]
_080F9D0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9D14: .4byte gUnknown_020388C0
_080F9D18: .4byte gSprites
	thumb_func_end sub_80F9914

	thumb_func_start sub_80F996C
sub_80F996C: @ 80F9D1C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80F98A4
	adds r0, r4, 0
	bl sub_80F9914
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F996C

	thumb_func_start sub_80F9988
sub_80F9988: @ 80F9D38
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r0, _080F9D74
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F9D6E
	cmp r2, 0x3
	bhi _080F9D6E
	ldr r2, _080F9D78
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r3, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_080F9D6E:
	pop {r0}
	bx r0
	.align 2, 0
_080F9D74: .4byte gUnknown_020388C0
_080F9D78: .4byte gSprites
	thumb_func_end sub_80F9988

	.align 2, 0 @ Don't pad with nop.
