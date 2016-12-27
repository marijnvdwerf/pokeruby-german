	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E60D8
sub_80E60D8: @ 80E6414
	push {r4-r7,lr}
	movs r4, 0x3
	ldr r0, _080E6430
	ldrh r1, [r0]
	adds r7, r0, 0
	cmp r1, 0xD
	bls _080E6424
	b _080E65C0
_080E6424:
	lsls r0, r1, 2
	ldr r1, _080E6434
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6430: .4byte gSpecialVar_0x8004
_080E6434: .4byte _080E6438
	.align 2, 0
_080E6438:
	.4byte _080E6470
	.4byte _080E6478
	.4byte _080E6480
	.4byte _080E6488
	.4byte _080E6490
	.4byte _080E64D8
	.4byte _080E64A8
	.4byte _080E64F8
	.4byte _080E651C
	.4byte _080E6538
	.4byte _080E653C
	.4byte _080E6550
	.4byte _080E6578
	.4byte _080E659C
_080E6470:
	ldr r1, _080E6474
	b _080E6588
	.align 2, 0
_080E6474: .4byte 0x02028250
_080E6478:
	ldr r1, _080E647C
	b _080E65B2
	.align 2, 0
_080E647C: .4byte 0x0202825c
_080E6480:
	ldr r1, _080E6484
	b _080E6588
	.align 2, 0
_080E6484: .4byte 0x02028268
_080E6488:
	ldr r1, _080E648C
	b _080E65B2
	.align 2, 0
_080E648C: .4byte 0x02028274
_080E6490:
	ldr r0, _080E64A0
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E64A4
	adds r1, r0, r1
	b _080E6588
	.align 2, 0
_080E64A0: .4byte gSpecialVar_0x8005
_080E64A4: .4byte 0x02028280
_080E64A8:
	ldr r0, _080E64D0
	movs r2, 0
	ldr r1, _080E64D4
	mov r12, r1
	adds r3, r0, 0
	adds r3, 0xE
	adds r5, r0, 0x2
	adds r6, r3, 0
_080E64B8:
	lsls r0, r2, 1
	adds r1, r3, r0
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080E64B8
	adds r1, r6, 0
	b _080E65B6
	.align 2, 0
_080E64D0: .4byte 0x020284c8
_080E64D4: .4byte sub_80546B8
_080E64D8:
	ldr r0, _080E64EC
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E64F0
	adds r1, r0, r1
	ldr r0, _080E64F4
	ldrb r4, [r0]
	b _080E65B2
	.align 2, 0
_080E64EC: .4byte gSpecialVar_0x8005
_080E64F0: .4byte 0x02027e70
_080E64F4: .4byte gSpecialVar_0x8006
_080E64F8:
	ldr r0, _080E6510
	ldrh r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080E6514
	adds r1, r0
	ldr r0, _080E6518
	ldrh r0, [r0]
	lsls r0, 1
	adds r1, r0
	b _080E6586
	.align 2, 0
_080E6510: .4byte gSpecialVar_0x8005
_080E6514: .4byte 0x02027e88
_080E6518: .4byte gSpecialVar_0x8006
_080E651C:
	ldr r0, _080E6530
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E6534
	adds r1, r0, r1
	movs r4, 0
	b _080E65B2
	.align 2, 0
_080E6530: .4byte gSpecialVar_0x8005
_080E6534: .4byte 0x02027e6e
_080E6538:
	movs r1, 0
	b _080E6588
_080E653C:
	ldr r1, _080E6548
	ldr r2, _080E654C
	adds r0, r2, 0
	strh r0, [r1]
	b _080E6586
	.align 2, 0
_080E6548: .4byte 0x0202824a
_080E654C: .4byte 0x0000ffff
_080E6550:
	ldr r0, _080E656C
	ldrh r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080E6570
	adds r1, r0
	ldr r0, _080E6574
	ldrh r0, [r0]
	lsls r0, 1
	adds r1, r0
	movs r4, 0
	b _080E65B2
	.align 2, 0
_080E656C: .4byte gSpecialVar_0x8005
_080E6570: .4byte 0x02027e70
_080E6574: .4byte gSpecialVar_0x8006
_080E6578:
	ldr r0, _080E6590
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E6594
	adds r1, r0, r1
_080E6586:
	movs r4, 0x1
_080E6588:
	ldr r0, _080E6598
	mov r12, r0
	b _080E65B6
	.align 2, 0
_080E6590: .4byte gSpecialVar_0x8005
_080E6594: .4byte 0x02027e84
_080E6598: .4byte sub_80546B8
_080E659C:
	ldr r1, _080E65C8
	ldr r0, _080E65CC
	adds r2, r1, r0
	ldr r0, _080E65D0
	strh r0, [r2]
	ldr r0, _080E65D4
	adds r1, r0
	movs r0, 0x1
	negs r0, r0
	strh r0, [r1]
	adds r1, r2, 0
_080E65B2:
	ldr r2, _080E65D8
	mov r12, r2
_080E65B6:
	ldrb r0, [r7]
	mov r2, r12
	adds r3, r4, 0
	bl sub_80E62A0
_080E65C0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E65C8: .4byte 0x02001000
_080E65CC: .4byte 0x00009fa8
_080E65D0: .4byte 0x0000ffff
_080E65D4: .4byte 0x00009faa
_080E65D8: .4byte sub_80546B8
	thumb_func_end sub_80E60D8

	thumb_func_start sub_80E62A0
sub_80E62A0: @ 80E65DC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080E6618
	str r2, [r4]
	str r1, [r4, 0x4]
	strb r0, [r4, 0x8]
	strb r3, [r4, 0xB]
	cmp r0, 0x9
	bne _080E660C
	ldr r0, _080E661C
	adds r2, r4, r0
	str r2, [r4, 0x4]
	ldr r0, _080E6620
	ldr r3, _080E6624
	adds r1, r0, r3
	ldrh r1, [r1]
	strh r1, [r2]
	ldr r1, _080E6628
	adds r0, r1
	ldrh r1, [r0]
	ldr r2, _080E662C
	adds r0, r4, r2
	strh r1, [r0]
_080E660C:
	ldr r0, _080E6630
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6618: .4byte 0x02001000
_080E661C: .4byte 0x00009fa8
_080E6620: .4byte gSaveBlock1
_080E6624: .4byte 0x00002dd8
_080E6628: .4byte 0x00002dda
_080E662C: .4byte 0x00009faa
_080E6630: .4byte sub_80E62F8
	thumb_func_end sub_80E62A0

	thumb_func_start sub_80E62F8
sub_80E62F8: @ 80E6634
	push {lr}
	sub sp, 0x4
	ldr r0, _080E6650
	ldr r1, _080E6654
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bhi _080E6680
	lsls r0, 2
	ldr r1, _080E6658
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6650: .4byte gMain
_080E6654: .4byte 0x0000043c
_080E6658: .4byte _080E665C
	.align 2, 0
_080E665C:
	.4byte _080E6680
	.4byte _080E66BC
	.4byte _080E66C8
	.4byte _080E66E4
	.4byte _080E66EA
	.4byte _080E66F0
	.4byte _080E66FA
	.4byte _080E6714
	.4byte _080E6726
_080E6680:
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetSpriteData
	bl dp12_8087EA4
	bl remove_some_task
	bl sub_80EAD08
	ldr r2, _080E66B8
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	b _080E673E
	.align 2, 0
_080E66B8: .4byte gUnknown_083DB698
_080E66BC:
	ldr r0, _080E66C4
	bl SetUpWindowConfig
	b _080E673E
	.align 2, 0
_080E66C4: .4byte gWindowConfig_81E6DA8
_080E66C8:
	ldr r0, _080E66DC
	bl InitMenuWindow
	ldr r0, _080E66E0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _080E673E
	.align 2, 0
_080E66DC: .4byte gWindowConfig_81E6D54
_080E66E0: .4byte gWindowConfig_81E6DA8
_080E66E4:
	bl sub_80E6424
	b _080E673E
_080E66EA:
	bl sub_80E8DD8
	b _080E673E
_080E66F0:
	bl sub_80E8218
	bl sub_80E8CEC
	b _080E673E
_080E66FA:
	bl sub_80E69F8
	ldr r0, _080E670C
	bl sub_80E682C
	ldr r0, _080E6710
	bl SetVBlankCallback
	b _080E673E
	.align 2, 0
_080E670C: .4byte sub_80E6AA8
_080E6710: .4byte sub_80E6A6C
_080E6714:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _080E673E
_080E6726:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E6750
	bl SetMainCallback2
	ldr r0, _080E6754
	bl FlagSet
_080E673E:
	ldr r1, _080E6758
	ldr r0, _080E675C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080E6750: .4byte sub_80E6A88
_080E6754: .4byte 0x00000805
_080E6758: .4byte gMain
_080E675C: .4byte 0x0000043c
	thumb_func_end sub_80E62F8

	thumb_func_start sub_80E6424
sub_80E6424: @ 80E6760
	push {lr}
	ldr r2, _080E6780
	ldr r0, _080E6784
	ldrb r1, [r2, 0x8]
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2, 0x9]
	ldrb r0, [r2, 0x9]
	adds r3, r2, 0
	cmp r0, 0x5
	bhi _080E684E
	lsls r0, 2
	ldr r1, _080E6788
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6780: .4byte 0x02001000
_080E6784: .4byte gUnknown_083DB6A4
_080E6788: .4byte _080E678C
	.align 2, 0
_080E678C:
	.4byte _080E67DC
	.4byte _080E67F4
	.4byte _080E6816
	.4byte _080E6832
	.4byte _080E67A4
	.4byte _080E67BC
_080E67A4:
	movs r2, 0x4
	strb r2, [r3, 0xA]
	adds r0, r3, 0
	adds r0, 0x83
	movs r1, 0x2
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r1, r3, 0
	adds r1, 0x88
	movs r0, 0x5
	b _080E680C
_080E67BC:
	movs r1, 0x4
	strb r1, [r3, 0xA]
	adds r2, r3, 0
	adds r2, 0x83
	movs r0, 0x1
	strb r0, [r2]
	adds r0, r3, 0
	adds r0, 0x84
	strb r1, [r0]
	adds r1, r3, 0
	adds r1, 0x88
	movs r0, 0x10
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	b _080E684C
_080E67DC:
	movs r0, 0x6
	strb r0, [r3, 0xA]
	adds r1, r3, 0
	adds r1, 0x83
	movs r0, 0x2
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x84
	movs r2, 0x3
	strb r2, [r0]
	adds r1, 0x5
	b _080E680A
_080E67F4:
	movs r2, 0
	movs r0, 0x9
	strb r0, [r3, 0xA]
	adds r1, r3, 0
	adds r1, 0x83
	movs r0, 0x2
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x5
	strb r0, [r1]
	adds r1, 0x4
_080E680A:
	movs r0, 0x4
_080E680C:
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0x8A
	strh r2, [r0]
	b _080E684E
_080E6816:
	movs r1, 0x1
	strb r1, [r3, 0xA]
	adds r0, r3, 0
	adds r0, 0x83
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r1, r3, 0
	adds r1, 0x88
	movs r0, 0x10
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x4
	b _080E684C
_080E6832:
	movs r0, 0x2
	strb r0, [r3, 0xA]
	adds r1, r3, 0
	adds r1, 0x83
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x1
	strb r0, [r1]
	adds r1, 0x4
	movs r0, 0x5
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x3
_080E684C:
	strh r0, [r1]
_080E684E:
	adds r1, r3, 0
	adds r1, 0x86
	movs r0, 0
	strb r0, [r1]
	subs r1, 0x1
	strb r0, [r1]
	adds r1, 0x2
	strb r0, [r1]
	subs r1, 0x61
	strb r0, [r1]
	movs r2, 0xDD
	lsls r2, 1
	adds r1, r3, r2
	strh r0, [r1]
	movs r0, 0xDF
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0x2
	strb r0, [r1]
	bl sub_80E6554
	bl sub_80EAECC
	bl sub_80EB040
	bl sub_80E7E50
	bl sub_80E6630
	bl sub_80E6690
	pop {r0}
	bx r0
	thumb_func_end sub_80E6424

	thumb_func_start sub_80E6554
sub_80E6554: @ 80E6890
	push {r4-r7,lr}
	sub sp, 0x4
	movs r4, 0
	movs r7, 0
	ldr r0, _080E68A0
	mov r12, r0
	b _080E68AA
	.align 2, 0
_080E68A0: .4byte 0x02001000
_080E68A4:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
_080E68AA:
	movs r5, 0
	lsls r3, r7, 1
	mov r6, r12
	adds r6, 0x2A
	adds r2, r3, r6
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	strb r1, [r2]
	cmp r4, 0x11
	beq _080E68E2
_080E68C2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bhi _080E68DE
	adds r2, r5, r3
	adds r2, r6
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	strb r1, [r2]
	cmp r4, 0x11
	bne _080E68C2
_080E68DE:
	cmp r4, 0x11
	bne _080E68A4
_080E68E2:
	movs r0, 0x11
	mov r1, r12
	strh r0, [r1, 0x28]
	cmp r4, 0x15
	bhi _080E694E
	mov r6, r12
	adds r2, r6, 0
	adds r2, 0x78
_080E68F2:
	lsls r0, r4, 24
	lsrs r0, 24
	str r2, [sp]
	bl sub_80EAD7C
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, [sp]
	cmp r1, 0
	beq _080E6938
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E6918
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
_080E6918:
	lsls r0, r7, 1
	adds r0, r5, r0
	adds r1, r6, 0
	adds r1, 0x2A
	adds r0, r1
	strb r4, [r0]
	adds r0, r4, 0
	subs r0, 0x11
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	ldrh r0, [r6, 0x28]
	adds r0, 0x1
	strh r0, [r6, 0x28]
	mov r12, r6
	b _080E6944
_080E6938:
	adds r0, r4, 0
	subs r0, 0x11
	adds r0, r2
	strb r1, [r0]
	ldr r0, _080E6968
	mov r12, r0
_080E6944:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x15
	bls _080E68F2
_080E694E:
	mov r1, r12
	ldrh r0, [r1, 0x28]
	adds r0, 0x1
	asrs r0, 1
	movs r1, 0xDB
	lsls r1, 1
	add r1, r12
	strb r0, [r1]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E6968: .4byte 0x02001000
	thumb_func_end sub_80E6554

	thumb_func_start sub_80E6630
sub_80E6630: @ 80E696C
	push {r4-r7,lr}
	movs r1, 0
	ldr r0, _080E69A0
	mov r12, r0
_080E6974:
	lsls r0, r1, 4
	mov r2, r12
	adds r5, r0, r2
	movs r3, 0
	ldrb r0, [r5]
	adds r7, r1, 0x1
	cmp r0, 0xFF
	beq _080E69BC
	lsls r0, r1, 3
	subs r0, r1
	lsls r4, r0, 1
	ldr r6, _080E69A4
_080E698C:
	adds r0, r5, r3
	ldrb r1, [r0]
	adds r2, r1, 0
	cmp r2, 0
	beq _080E69A8
	adds r0, r3, r4
	adds r0, r6
	adds r1, 0x46
	strb r1, [r0]
	b _080E69AE
	.align 2, 0
_080E69A0: .4byte gUnknown_083DB6B2
_080E69A4: .4byte 0x02001040
_080E69A8:
	adds r0, r3, r4
	adds r0, r6
	strb r2, [r0]
_080E69AE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080E698C
_080E69BC:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080E6974
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E6630

	thumb_func_start sub_80E6690
sub_80E6690: @ 80E69CC
	push {r4-r6,lr}
	sub sp, 0x10
	mov r0, sp
	ldr r1, _080E6A1C
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	ldr r1, [r1]
	str r1, [r0]
	movs r5, 0
	ldr r6, _080E6A20
_080E69E0:
	ldr r0, _080E6A24
	ldrb r0, [r0, 0x8]
	lsls r0, 1
	adds r0, r5, r0
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E6A28
	adds r4, r0, r1
	lsls r0, r5, 3
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r4]
	bl StringCopy
	adds r3, r0, 0
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	beq _080E6A2C
	lsls r0, r5, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r4, 0x4]
	bl StringCopy
	b _080E6A46
	.align 2, 0
_080E6A1C: .4byte gUnknown_083DB7DC
_080E6A20: .4byte gUnknown_083DB7C0
_080E6A24: .4byte 0x02001000
_080E6A28: .4byte gUnknown_083DB6F4
_080E6A2C:
	strb r0, [r3]
	adds r3, 0x1
	ldr r1, [r4, 0x4]
	adds r0, r3, 0
	bl StringCopy
	lsls r0, r5, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r0]
	movs r0, 0xFF
	strb r0, [r1]
_080E6A46:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E69E0
	movs r5, 0
	ldr r3, _080E6A94
	ldr r0, _080E6A98
	adds r2, r3, r0
	movs r1, 0
_080E6A5A:
	adds r0, r5, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x23
	bls _080E6A5A
	ldr r1, _080E6A98
	adds r0, r3, r1
	adds r0, r5, r0
	movs r4, 0x1
	negs r4, r4
	adds r2, r4, 0
	movs r1, 0xFF
	strb r1, [r0]
	ldr r0, _080E6A9C
	adds r3, r0
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x11
	strb r0, [r3, 0x1]
	movs r0, 0xE0
	strb r0, [r3, 0x2]
	strb r2, [r3, 0x3]
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6A94: .4byte 0x02001000
_080E6A98: .4byte 0x0000a0d0
_080E6A9C: .4byte 0x0000a29a
	thumb_func_end sub_80E6690

	thumb_func_start sub_80E6764
sub_80E6764: @ 80E6AA0
	push {r4-r6,lr}
	movs r3, 0
	ldr r4, _080E6B48
	ldr r2, _080E6B4C
_080E6AA8:
	lsls r0, r3, 1
	adds r1, r0, r4
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080E6AA8
	movs r3, 0
	ldr r4, _080E6B50
	ldr r2, _080E6B54
_080E6AC2:
	lsls r0, r3, 1
	adds r1, r0, r4
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080E6AC2
	movs r3, 0
	ldr r5, _080E6B58
	ldr r0, _080E6B5C
	adds r4, r0, 0
	adds r6, r5, 0
	adds r6, 0xC
_080E6AE2:
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r2]
	orrs r0, r4
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080E6AE2
	movs r3, 0
	ldr r6, _080E6B60
	ldr r0, _080E6B5C
	adds r5, r0, 0
_080E6B06:
	movs r2, 0
	lsls r0, r3, 3
	adds r0, r3
	lsls r4, r0, 2
_080E6B0E:
	lsls r0, r2, 1
	adds r0, r4
	adds r0, r6
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x8
	bls _080E6B0E
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bls _080E6B06
	movs r3, 0
	ldr r2, _080E6B64
	movs r1, 0
_080E6B34:
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3F
	bls _080E6B34
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6B48: .4byte 0x02028250
_080E6B4C: .4byte gUnknown_083DB7EC
_080E6B50: .4byte 0x0202825c
_080E6B54: .4byte gUnknown_083DB7F4
_080E6B58: .4byte 0x02028268
_080E6B5C: .4byte 0x0000ffff
_080E6B60: .4byte 0x02028280
_080E6B64: .4byte 0x020284c0
	thumb_func_end sub_80E6764

	thumb_func_start sub_80E682C
sub_80E682C: @ 80E6B68
	ldr r1, _080E6B74
	str r0, [r1, 0x20]
	movs r0, 0
	strh r0, [r1, 0x24]
	bx lr
	.align 2, 0
_080E6B74: .4byte 0x02001000
	thumb_func_end sub_80E682C

	thumb_func_start sub_80E683C
sub_80E683C: @ 80E6B78
	push {r4,r5,lr}
	ldr r1, _080E6BCC
	adds r0, r1, 0
	adds r0, 0x26
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0
	bne _080E6BD4
	movs r1, 0
	movs r0, 0xDB
	lsls r0, 1
	adds r3, r2, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bge _080E6BB2
	movs r0, 0xD5
	lsls r0, 1
	adds r5, r2, r0
	movs r4, 0x2
_080E6BA0:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	blt _080E6BA0
_080E6BB2:
	adds r0, r2, r1
	ldr r1, _080E6BD0
	adds r3, r0, r1
	ldrh r0, [r2, 0x28]
	movs r1, 0x1
	ands r0, r1
	strb r0, [r3]
	cmp r0, 0
	bne _080E6BF4
	movs r0, 0x2
	strb r0, [r3]
	b _080E6BF4
	.align 2, 0
_080E6BCC: .4byte 0x02001000
_080E6BD0: .4byte 0x000001a9
_080E6BD4:
	movs r3, 0xD5
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0x7
	strb r0, [r1]
	ldr r1, _080E6C1C
	adds r3, r2, r1
	movs r1, 0x6
	strb r1, [r3]
	movs r3, 0xD6
	lsls r3, 1
	adds r1, r2, r3
	strb r0, [r1]
	adds r3, 0x1
	adds r1, r2, r3
	strb r0, [r1]
_080E6BF4:
	movs r0, 0xD4
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r3, _080E6C20
	adds r1, r2, r3
	strb r0, [r1]
	adds r3, 0xC
	adds r1, r2, r3
	strb r0, [r1]
	adds r3, 0x2
	adds r1, r2, r3
	strb r0, [r1]
	bl sub_80E9A4C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6C1C: .4byte 0x000001ab
_080E6C20: .4byte 0x000001a9
	thumb_func_end sub_80E683C

	thumb_func_start sub_80E68E8
sub_80E68E8: @ 80E6C24
	push {r4-r6,lr}
	bl sub_80EB0B0
	ldr r3, _080E6C88
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E6C98
	movs r1, 0xDC
	lsls r1, 1
	adds r0, r3, r1
	ldrb r6, [r0]
	lsls r0, r6, 1
	ldr r2, _080E6C8C
	adds r1, r3, r2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x1
	asrs r0, 1
	ldr r1, _080E6C90
	adds r2, r3, r1
	strb r0, [r2]
	movs r1, 0
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r5, r3, 0
	cmp r1, r0
	bge _080E6C76
	ldr r3, _080E6C94
	adds r4, r5, r3
	movs r3, 0x2
_080E6C64:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	blt _080E6C64
_080E6C76:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080E6C94
	adds r0, r5, r2
	adds r2, r1, r0
	lsls r0, r6, 1
	ldr r3, _080E6C8C
	b _080E6CE8
	.align 2, 0
_080E6C88: .4byte 0x02001000
_080E6C8C: .4byte 0x000044a2
_080E6C90: .4byte 0x00009d54
_080E6C94: .4byte 0x00009cd2
_080E6C98:
	movs r1, 0xDC
	lsls r1, 1
	adds r0, r3, r1
	ldrb r6, [r0]
	lsls r0, r6, 1
	ldr r2, _080E6D1C
	adds r1, r3, r2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x1
	asrs r0, 1
	ldr r1, _080E6D20
	adds r2, r3, r1
	strb r0, [r2]
	movs r1, 0
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r5, r3, 0
	cmp r1, r0
	bge _080E6CD8
	ldr r3, _080E6D24
	adds r4, r5, r3
	movs r3, 0x2
_080E6CC6:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	blt _080E6CC6
_080E6CD8:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080E6D24
	adds r0, r5, r2
	adds r2, r1, r0
	lsls r0, r6, 1
	ldr r3, _080E6D1C
_080E6CE8:
	adds r1, r5, r3
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x1
	ands r0, r1
	strb r0, [r2]
	cmp r0, 0
	bne _080E6CFC
	movs r0, 0x2
	strb r0, [r2]
_080E6CFC:
	ldr r1, _080E6D28
	adds r0, r5, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080E6D2C
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _080E6D30
	adds r0, r5, r3
	strb r1, [r0]
	bl sub_80E9A4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E6D1C: .4byte 0x0000446c
_080E6D20: .4byte 0x00009d54
_080E6D24: .4byte 0x00009cd2
_080E6D28: .4byte 0x00009cd0
_080E6D2C: .4byte 0x00009cd1
_080E6D30: .4byte 0x00009d55
	thumb_func_end sub_80E68E8

	thumb_func_start sub_80E69F8
sub_80E69F8: @ 80E6D34
	push {r4,lr}
	ldr r0, _080E6D4C
	ldrb r1, [r0, 0x8]
	adds r4, r0, 0
	cmp r1, 0xD
	bhi _080E6D8C
	lsls r0, r1, 2
	ldr r1, _080E6D50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E6D4C: .4byte 0x02001000
_080E6D50: .4byte _080E6D54
	.align 2, 0
_080E6D54:
	.4byte _080E6D8C
	.4byte _080E6D8C
	.4byte _080E6D8C
	.4byte _080E6D8C
	.4byte _080E6D8C
	.4byte _080E6D94
	.4byte _080E6D8C
	.4byte _080E6D94
	.4byte _080E6D94
	.4byte _080E6D8C
	.4byte _080E6D94
	.4byte _080E6D94
	.4byte _080E6D94
	.4byte _080E6D8C
_080E6D8C:
	ldrb r0, [r4, 0x8]
	bl sub_80E9368
	b _080E6DA2
_080E6D94:
	ldrb r0, [r4, 0x8]
	bl sub_80E9368
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	bl sub_80E8BF4
_080E6DA2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E69F8

	thumb_func_start sub_80E6A6C
sub_80E6A6C: @ 80E6DA8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_80EAC5C
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	thumb_func_end sub_80E6A6C

	thumb_func_start sub_80E6A88
sub_80E6A88: @ 80E6DC4
	push {lr}
	ldr r0, _080E6DE0
	ldr r0, [r0, 0x20]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl sub_80EAD08
	pop {r0}
	bx r0
	.align 2, 0
_080E6DE0: .4byte 0x02001000
	thumb_func_end sub_80E6A88

	thumb_func_start sub_80E6AA8
sub_80E6AA8: @ 80E6DE4
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080E6DF6
	ldr r0, _080E6DFC
	bl sub_80E682C
_080E6DF6:
	pop {r0}
	bx r0
	.align 2, 0
_080E6DFC: .4byte sub_80E6AC4
	thumb_func_end sub_80E6AA8

	thumb_func_start sub_80E6AC4
sub_80E6AC4: @ 80E6E00
	push {lr}
	bl sub_80E88F0
	movs r0, 0
	bl sub_80E8398
	movs r0, 0
	bl sub_80E91D4
	ldr r0, _080E6E1C
	bl sub_80E682C
	pop {r0}
	bx r0
	.align 2, 0
_080E6E1C: .4byte sub_80E6AE4
	thumb_func_end sub_80E6AC4

	thumb_func_start sub_80E6AE4
sub_80E6AE4: @ 80E6E20
	push {r4,r5,lr}
	bl sub_80E75D8
	ldr r4, _080E6E80
	adds r1, r4, 0
	adds r1, 0x87
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _080E6E3A
	movs r0, 0x5
	bl PlaySE
_080E6E3A:
	ldr r2, _080E6E84
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	adds r5, r2, 0
	cmp r0, 0
	beq _080E6EE0
	movs r0, 0x5
	bl PlaySE
	adds r1, r4, 0
	adds r1, 0x86
	adds r0, r4, 0
	adds r0, 0x84
	ldrb r2, [r1]
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E6EB4
	adds r0, r4, 0
	adds r0, 0x85
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _080E6E9C
	cmp r0, 0x1
	bgt _080E6E88
	cmp r0, 0
	beq _080E6E8E
	b _080E6EE0
	.align 2, 0
_080E6E80: .4byte 0x02001000
_080E6E84: .4byte gMain
_080E6E88:
	cmp r0, 0x2
	beq _080E6EA8
	b _080E6EE0
_080E6E8E:
	ldr r0, _080E6E98
	bl sub_80E682C
	b _080E6EF0
	.align 2, 0
_080E6E98: .4byte sub_80E6BC0
_080E6E9C:
	ldr r0, _080E6EA4
	bl sub_80E682C
	b _080E6EF0
	.align 2, 0
_080E6EA4: .4byte sub_80E6C84
_080E6EA8:
	ldr r0, _080E6EB0
	bl sub_80E682C
	b _080E6EF0
	.align 2, 0
_080E6EB0: .4byte sub_80E6D7C
_080E6EB4:
	adds r0, r4, 0
	adds r0, 0x83
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x85
	adds r3, r0, 0
	muls r3, r2
	adds r0, r3, 0
	ldrb r1, [r1]
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x27
	strb r0, [r1]
	bl sub_80E7574
	ldr r0, _080E6EDC
	bl sub_80E682C
	b _080E6EF0
	.align 2, 0
_080E6EDC: .4byte sub_80E6F68
_080E6EE0:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E6EF0
	ldr r0, _080E6EF8
	bl sub_80E682C
_080E6EF0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6EF8: .4byte sub_80E6C84
	thumb_func_end sub_80E6AE4

	thumb_func_start sub_80E6BC0
sub_80E6BC0: @ 80E6EFC
	push {r4,lr}
	ldr r4, _080E6F10
	ldrh r0, [r4, 0x24]
	cmp r0, 0x1
	beq _080E6F4E
	cmp r0, 0x1
	bgt _080E6F14
	cmp r0, 0
	beq _080E6F1E
	b _080E6FB2
	.align 2, 0
_080E6F10: .4byte 0x02001000
_080E6F14:
	cmp r0, 0x2
	beq _080E6F90
	cmp r0, 0x64
	beq _080E6FA0
	b _080E6FB2
_080E6F1E:
	movs r0, 0x2
	bl sub_80E8398
	ldrb r0, [r4, 0x8]
	cmp r0, 0x6
	bne _080E6F36
	movs r0, 0x6
	bl sub_80E91D4
	movs r0, 0x64
	strh r0, [r4, 0x24]
	b _080E6FB2
_080E6F36:
	movs r0, 0x2
	bl sub_80E91D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	movs r0, 0x1
	bl MoveMenuCursor
	b _080E6F7A
_080E6F4E:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E6F6E
	cmp r1, 0
	bgt _080E6F68
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E6F82
	b _080E6FB2
_080E6F68:
	cmp r1, 0x1
	beq _080E6F82
	b _080E6FB2
_080E6F6E:
	bl sub_80E7D6C
	bl sub_80E98C4
	bl sub_80E95A4
_080E6F7A:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E6FB2
_080E6F82:
	ldr r1, _080E6F8C
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E6FB2
	.align 2, 0
_080E6F8C: .4byte 0x02001000
_080E6F90:
	bl sub_80E81FC
	ldr r0, _080E6F9C
	bl sub_80E682C
	b _080E6FB2
	.align 2, 0
_080E6F9C: .4byte sub_80E6AC4
_080E6FA0:
	ldr r0, _080E6FB8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080E6FB2
	ldr r0, _080E6FBC
	bl sub_80E682C
_080E6FB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6FB8: .4byte gMain
_080E6FBC: .4byte sub_80E6AC4
	thumb_func_end sub_80E6BC0

	thumb_func_start sub_80E6C84
sub_80E6C84: @ 80E6FC0
	push {r4,lr}
	ldr r4, _080E6FD4
	ldrh r0, [r4, 0x24]
	cmp r0, 0x1
	beq _080E7030
	cmp r0, 0x1
	bgt _080E6FD8
	cmp r0, 0
	beq _080E6FE2
	b _080E70AE
	.align 2, 0
_080E6FD4: .4byte 0x02001000
_080E6FD8:
	cmp r0, 0x2
	beq _080E7060
	cmp r0, 0xFF
	beq _080E70A0
	b _080E70AE
_080E6FE2:
	movs r0, 0x2
	bl sub_80E8398
	movs r0, 0x3
	bl sub_80E91D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0
	bl DisplayYesNoMenu
	movs r0, 0x1
	bl MoveMenuCursor
	ldrb r0, [r4, 0x8]
	cmp r0, 0x9
	beq _080E7024
	cmp r0, 0x4
	beq _080E7024
	cmp r0, 0x7
	beq _080E7024
	cmp r0, 0x8
	beq _080E7024
	cmp r0, 0xA
	beq _080E7024
	cmp r0, 0xB
	beq _080E7024
	cmp r0, 0xC
	beq _080E7024
	cmp r0, 0x5
	beq _080E7024
	cmp r0, 0xD
	bne _080E7058
_080E7024:
	ldr r1, _080E702C
	movs r0, 0x2
	strh r0, [r1, 0x24]
	b _080E70AE
	.align 2, 0
_080E702C: .4byte 0x02001000
_080E7030:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E7042
	cmp r1, 0
	ble _080E7070
	b _080E707A
_080E7042:
	movs r0, 0x4
	bl sub_80E91D4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0
	bl DisplayYesNoMenu
	movs r0, 0x1
	bl MoveMenuCursor
_080E7058:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E70AE
_080E7060:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080E7080
	cmp r1, 0
	bgt _080E707A
_080E7070:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080E7094
	b _080E70AE
_080E707A:
	cmp r1, 0x1
	beq _080E7094
	b _080E70AE
_080E7080:
	ldr r0, _080E708C
	strh r1, [r0]
	ldr r0, _080E7090
	bl sub_80E682C
	b _080E70AE
	.align 2, 0
_080E708C: .4byte gScriptResult
_080E7090: .4byte sub_80E752C
_080E7094:
	ldr r1, _080E709C
	movs r0, 0xFF
	strh r0, [r1, 0x24]
	b _080E70AE
	.align 2, 0
_080E709C: .4byte 0x02001000
_080E70A0:
	bl sub_8072DEC
	bl sub_80E81FC
	ldr r0, _080E70B4
	bl sub_80E682C
_080E70AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E70B4: .4byte sub_80E6AC4
	thumb_func_end sub_80E6C84

	thumb_func_start sub_80E6D7C
sub_80E6D7C: @ 80E70B8
	push {r4-r7,lr}
	ldr r5, _080E70D4
	ldrh r0, [r5, 0x24]
	cmp r0, 0xA
	bne _080E70C4
	b _080E7242
_080E70C4:
	cmp r0, 0xA
	bgt _080E70D8
	cmp r0, 0
	beq _080E70F2
	cmp r0, 0x1
	beq _080E7178
	b _080E729A
	.align 2, 0
_080E70D4: .4byte 0x02001000
_080E70D8:
	cmp r0, 0x65
	bne _080E70DE
	b _080E726C
_080E70DE:
	cmp r0, 0x65
	bgt _080E70EA
	cmp r0, 0x64
	bne _080E70E8
	b _080E7260
_080E70E8:
	b _080E729A
_080E70EA:
	cmp r0, 0x66
	bne _080E70F0
	b _080E728C
_080E70F0:
	b _080E729A
_080E70F2:
	movs r0, 0x2
	bl sub_80E8398
	bl sub_80E8054
	lsls r0, 24
	cmp r0, 0
	beq _080E7106
	movs r0, 0x5
	b _080E712A
_080E7106:
	ldrb r0, [r5, 0x8]
	cmp r0, 0x9
	bne _080E7138
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	bne _080E711A
	movs r0, 0x8
	b _080E712A
_080E711A:
	ldrh r0, [r5, 0xC]
	ldr r1, _080E7134
	cmp r0, r1
	beq _080E7128
	ldrh r0, [r5, 0xE]
	cmp r0, r1
	bne _080E7138
_080E7128:
	movs r0, 0x9
_080E712A:
	bl sub_80E91D4
	movs r0, 0xA
	strh r0, [r5, 0x24]
	b _080E729A
	.align 2, 0
_080E7134: .4byte 0x0000ffff
_080E7138:
	ldr r0, _080E7154
	ldrb r0, [r0, 0x8]
	cmp r0, 0x4
	bne _080E715C
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	bne _080E715C
	ldr r0, _080E7158
	bl sub_80E682C
	b _080E729A
	.align 2, 0
_080E7154: .4byte 0x02001000
_080E7158: .4byte sub_80E6C84
_080E715C:
	movs r0, 0x1
	bl sub_80E91D4
	bl sub_80E9744
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0
	bl DisplayYesNoMenu
	movs r0, 0
	bl MoveMenuCursor
	b _080E7278
_080E7178:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r6, r0, 24
	cmp r6, 0
	beq _080E7198
	cmp r6, 0
	bgt _080E7192
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	beq _080E7218
	b _080E729A
_080E7192:
	cmp r6, 0x1
	beq _080E7218
	b _080E729A
_080E7198:
	ldr r7, _080E7204
	bl sub_80E7FA8
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	lsrs r0, 31
	strh r0, [r7]
	bl sub_80E7D9C
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _080E71BE
	ldr r4, _080E7208
	bl sub_80E8094
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080E71BE:
	ldrb r0, [r5, 0x8]
	cmp r0, 0x9
	bne _080E71D8
	bl sub_80E81C0
	ldr r4, _080E7208
	ldr r1, _080E720C
	adds r0, r5, r1
	bl sub_80FA364
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080E71D8:
	ldrb r0, [r5, 0x8]
	cmp r0, 0xD
	bne _080E71FA
	ldrh r0, [r5, 0xC]
	ldr r1, _080E7210
	cmp r0, r1
	beq _080E71EC
	ldrh r0, [r5, 0xE]
	cmp r0, r1
	bne _080E71EE
_080E71EC:
	strh r6, [r7]
_080E71EE:
	ldr r4, _080E7208
	bl sub_80E810C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080E71FA:
	ldr r0, _080E7214
	bl sub_80E682C
	b _080E729A
	.align 2, 0
_080E7204: .4byte gScriptResult
_080E7208: .4byte gSpecialVar_0x8004
_080E720C: .4byte 0x00009fa8
_080E7210: .4byte 0x0000ffff
_080E7214: .4byte sub_80E752C
_080E7218:
	bl sub_8072DEC
	bl sub_80E81FC
	ldr r4, _080E7238
	ldrb r0, [r4, 0x8]
	cmp r0, 0x6
	bne _080E723C
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	beq _080E723C
	movs r0, 0x64
	strh r0, [r4, 0x24]
	b _080E729A
	.align 2, 0
_080E7238: .4byte 0x02001000
_080E723C:
	bl sub_80E95A4
	b _080E724E
_080E7242:
	ldr r0, _080E7258
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080E729A
_080E724E:
	ldr r0, _080E725C
	bl sub_80E682C
	b _080E729A
	.align 2, 0
_080E7258: .4byte gMain
_080E725C: .4byte sub_80E6AC4
_080E7260:
	movs r0, 0x7
	bl sub_80E91D4
	ldrh r0, [r5, 0x24]
	adds r0, 0x1
	strh r0, [r5, 0x24]
_080E726C:
	ldr r0, _080E7284
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E729A
_080E7278:
	ldr r1, _080E7288
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E729A
	.align 2, 0
_080E7284: .4byte gMain
_080E7288: .4byte 0x02001000
_080E728C:
	bl sub_80E7E50
	bl sub_80E95A4
	ldr r0, _080E72A0
	bl sub_80E682C
_080E729A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E72A0: .4byte sub_80E6AC4
	thumb_func_end sub_80E6D7C

	thumb_func_start sub_80E6F68
sub_80E6F68: @ 80E72A4
	push {r4,lr}
	ldr r4, _080E72B4
	ldrh r0, [r4, 0x24]
	cmp r0, 0
	beq _080E72B8
	cmp r0, 0x1
	beq _080E72D8
	b _080E72F8
	.align 2, 0
_080E72B4: .4byte 0x02001000
_080E72B8:
	movs r0, 0x1
	bl sub_80E8398
	movs r0, 0xA
	bl sub_80E91D4
	bl sub_80E683C
	bl sub_80E9974
	bl sub_80E9E98
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E72F8
_080E72D8:
	bl sub_80E9EA8
	lsls r0, 24
	cmp r0, 0
	beq _080E72F8
	movs r0, 0x1
	bl sub_80E8D8C
	bl sub_80E8420
	movs r0, 0
	bl sub_80E8958
	ldr r0, _080E7300
	bl sub_80E682C
_080E72F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7300: .4byte sub_80E6FC8
	thumb_func_end sub_80E6F68

	thumb_func_start sub_80E6FC8
sub_80E6FC8: @ 80E7304
	push {r4,lr}
	bl sub_80E77C8
	adds r1, r0, 0
	ldr r4, _080E733C
	adds r0, r4, 0
	adds r0, 0x96
	strb r1, [r0]
	movs r2, 0xE0
	lsls r2, 1
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7348
	movs r0, 0x5
	bl PlaySE
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, _080E7340
	str r1, [r0]
	ldr r0, _080E7344
	bl sub_80E682C
	b _080E7446
	.align 2, 0
_080E733C: .4byte 0x02001000
_080E7340: .4byte sub_80E6FC8
_080E7344: .4byte sub_80E7458
_080E7348:
	lsls r0, r1, 24
	cmp r0, 0
	beq _080E7354
	movs r0, 0x5
	bl PlaySE
_080E7354:
	ldr r0, _080E7390
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E7424
	ldr r2, _080E7394
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E73CC
	movs r0, 0x5
	bl PlaySE
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	beq _080E73AC
	cmp r0, 0x2
	bgt _080E7398
	cmp r0, 0x1
	beq _080E739E
	b _080E7446
	.align 2, 0
_080E7390: .4byte gMain
_080E7394: .4byte 0x000001b7
_080E7398:
	cmp r0, 0x3
	beq _080E742C
	b _080E7446
_080E739E:
	ldr r0, _080E73A8
	bl sub_80E682C
	b _080E7446
	.align 2, 0
_080E73A8: .4byte sub_80E718C
_080E73AC:
	ldrb r0, [r4, 0x8]
	cmp r0, 0x6
	beq _080E7446
	adds r0, r4, 0
	adds r0, 0x27
	ldrb r0, [r0]
	ldr r1, _080E73C8
	bl sub_80E7F00
	bl sub_80E7574
	bl sub_80E95A4
	b _080E7446
	.align 2, 0
_080E73C8: .4byte 0x0000ffff
_080E73CC:
	adds r0, r4, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E7406
	ldr r2, _080E7418
	adds r0, r4, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r2, r0
	adds r0, r4, 0
	adds r0, 0x40
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 1
	ldr r2, _080E741C
	adds r1, r4, r2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080E7446
_080E7406:
	movs r0, 0x5
	bl PlaySE
	bl sub_80E7AD4
	ldr r0, _080E7420
	bl sub_80E682C
	b _080E7446
	.align 2, 0
_080E7418: .4byte 0x000001a9
_080E741C: .4byte 0x0000446c
_080E7420: .4byte sub_80E7218
_080E7424:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E7438
_080E742C:
	ldr r0, _080E7434
	bl sub_80E682C
	b _080E7446
	.align 2, 0
_080E7434: .4byte sub_80E7114
_080E7438:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E7446
	ldr r0, _080E744C
	bl sub_80E682C
_080E7446:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E744C: .4byte sub_80E718C
	thumb_func_end sub_80E6FC8

	thumb_func_start sub_80E7114
sub_80E7114: @ 80E7450
	push {lr}
	ldr r0, _080E7468
	ldrh r1, [r0, 0x24]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _080E74BE
	lsls r0, r1, 2
	ldr r1, _080E746C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E7468: .4byte 0x02001000
_080E746C: .4byte _080E7470
	.align 2, 0
_080E7470:
	.4byte _080E7484
	.4byte _080E7498
	.4byte _080E7498
	.4byte _080E74A0
	.4byte _080E74B8
_080E7484:
	bl sub_80E8504
	bl sub_80E9E98
	bl sub_80E88F0
	movs r0, 0
	bl sub_80E8D8C
	b _080E74AA
_080E7498:
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	b _080E74BE
_080E74A0:
	bl sub_80E9F50
	lsls r0, 24
	cmp r0, 0
	beq _080E74BE
_080E74AA:
	ldr r1, _080E74B4
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E74BE
	.align 2, 0
_080E74B4: .4byte 0x02001000
_080E74B8:
	ldr r0, _080E74C4
	bl sub_80E682C
_080E74BE:
	pop {r0}
	bx r0
	.align 2, 0
_080E74C4: .4byte sub_80E6AC4
	thumb_func_end sub_80E7114

	thumb_func_start sub_80E718C
sub_80E718C: @ 80E74C8
	push {r4,lr}
	ldr r0, _080E74E0
	ldrh r1, [r0, 0x24]
	adds r4, r0, 0
	cmp r1, 0x1
	beq _080E7502
	cmp r1, 0x1
	bgt _080E74E4
	cmp r1, 0
	beq _080E74EA
	b _080E7528
	.align 2, 0
_080E74E0: .4byte 0x02001000
_080E74E4:
	cmp r1, 0x8
	beq _080E7530
	b _080E7528
_080E74EA:
	bl sub_80E8504
	bl sub_80E9E98
	bl sub_80E88F0
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	bl sub_80E8D54
	b _080E754A
_080E7502:
	bl sub_80E9FD4
	lsls r0, 24
	cmp r0, 0
	beq _080E754A
	movs r2, 0
	adds r1, r4, 0
	adds r1, 0x26
	ldrb r0, [r1]
	cmp r0, 0
	bne _080E751A
	movs r2, 0x1
_080E751A:
	strb r2, [r1]
	bl sub_80E683C
	bl sub_80E9974
	bl sub_80E9E98
_080E7528:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E754A
_080E7530:
	bl sub_80EA014
	lsls r0, 24
	cmp r0, 0
	beq _080E754A
	bl sub_80E8420
	movs r0, 0
	bl sub_80E8958
	ldr r0, _080E7550
	bl sub_80E682C
_080E754A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E7550: .4byte sub_80E6FC8
	thumb_func_end sub_80E718C

	thumb_func_start sub_80E7218
sub_80E7218: @ 80E7554
	push {r4,lr}
	ldr r4, _080E756C
	ldrh r0, [r4, 0x24]
	adds r1, r4, 0
	cmp r0, 0x9
	beq _080E759C
	cmp r0, 0x9
	bgt _080E7570
	cmp r0, 0x8
	beq _080E7580
	b _080E7578
	.align 2, 0
_080E756C: .4byte 0x02001000
_080E7570:
	cmp r0, 0xA
	beq _080E75B2
	cmp r0, 0xB
	beq _080E75C4
_080E7578:
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E75C4
_080E7580:
	movs r0, 0
	bl sub_80E8D8C
	bl sub_80E8504
	bl sub_80E9AD4
	bl sub_80E68E8
	bl sub_80E88F0
	bl sub_80E9E98
	b _080E75AA
_080E759C:
	bl sub_80EA050
	lsls r0, 24
	cmp r0, 0
	beq _080E75C4
	bl sub_80E9C94
_080E75AA:
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E75C4
_080E75B2:
	movs r0, 0x1
	bl sub_80E87CC
	movs r0, 0x1
	bl sub_80E8958
	ldr r0, _080E75CC
	bl sub_80E682C
_080E75C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E75CC: .4byte sub_80E7294
	thumb_func_end sub_80E7218

	thumb_func_start sub_80E7294
sub_80E7294: @ 80E75D0
	push {r4,lr}
	bl sub_80E7B40
	adds r1, r0, 0
	ldr r4, _080E7608
	ldr r2, _080E760C
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, 0x7
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7618
	movs r0, 0x5
	bl PlaySE
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, _080E7610
	str r1, [r0]
	ldr r0, _080E7614
	bl sub_80E682C
	b _080E7656
	.align 2, 0
_080E7608: .4byte 0x02001000
_080E760C: .4byte 0x000001b9
_080E7610: .4byte sub_80E7294
_080E7614: .4byte sub_80E7458
_080E7618:
	lsls r0, r1, 24
	cmp r0, 0
	beq _080E7624
	movs r0, 0x5
	bl PlaySE
_080E7624:
	ldr r0, _080E7640
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E7648
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080E7644
	bl sub_80E682C
	b _080E7656
	.align 2, 0
_080E7640: .4byte gMain
_080E7644: .4byte sub_80E7324
_080E7648:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E7656
	ldr r0, _080E765C
	bl sub_80E682C
_080E7656:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E765C: .4byte sub_80E73D0
	thumb_func_end sub_80E7294

	thumb_func_start sub_80E7324
sub_80E7324: @ 80E7660
	push {lr}
	ldr r0, _080E7678
	ldrh r1, [r0, 0x24]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _080E7702
	lsls r0, r1, 2
	ldr r1, _080E767C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E7678: .4byte 0x02001000
_080E767C: .4byte _080E7680
	.align 2, 0
_080E7680:
	.4byte _080E7694
	.4byte _080E76B8
	.4byte _080E76C0
	.4byte _080E76C6
	.4byte _080E76E0
_080E7694:
	bl sub_80E7DD0
	lsls r0, 24
	cmp r0, 0
	bne _080E76AC
	ldr r0, _080E76A8
	bl sub_80E682C
	b _080E7702
	.align 2, 0
_080E76A8: .4byte sub_80E7294
_080E76AC:
	bl sub_80E88F0
	movs r0, 0
	bl sub_80E87CC
	b _080E76D0
_080E76B8:
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	b _080E7702
_080E76C0:
	bl sub_80E9E98
	b _080E76D0
_080E76C6:
	bl sub_80EA184
	lsls r0, 24
	cmp r0, 0
	beq _080E7702
_080E76D0:
	ldr r1, _080E76DC
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E7702
	.align 2, 0
_080E76DC: .4byte 0x02001000
_080E76E0:
	ldrb r0, [r2, 0x8]
	cmp r0, 0x6
	bne _080E76FC
	bl sub_80E7FA8
	lsls r0, 24
	cmp r0, 0
	beq _080E76FC
	ldr r0, _080E76F8
	bl sub_80E682C
	b _080E7702
	.align 2, 0
_080E76F8: .4byte sub_80E6D7C
_080E76FC:
	ldr r0, _080E7708
	bl sub_80E682C
_080E7702:
	pop {r0}
	bx r0
	.align 2, 0
_080E7708: .4byte sub_80E6AC4
	thumb_func_end sub_80E7324

	thumb_func_start sub_80E73D0
sub_80E73D0: @ 80E770C
	push {lr}
	ldr r0, _080E7720
	ldrh r0, [r0, 0x24]
	cmp r0, 0x4
	bhi _080E778A
	lsls r0, 2
	ldr r1, _080E7724
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E7720: .4byte 0x02001000
_080E7724: .4byte _080E7728
	.align 2, 0
_080E7728:
	.4byte _080E773C
	.4byte _080E7748
	.4byte _080E7752
	.4byte _080E7768
	.4byte _080E7780
_080E773C:
	movs r0, 0
	bl sub_80E87CC
	bl sub_80E88F0
	b _080E7772
_080E7748:
	bl sub_80E9AD4
	bl sub_80E9E98
	b _080E7772
_080E7752:
	bl sub_80EA0E4
	lsls r0, 24
	cmp r0, 0
	beq _080E778A
	movs r0, 0x1
	bl sub_80E8D8C
	bl sub_80E9A14
	b _080E7772
_080E7768:
	bl sub_80E8420
	movs r0, 0
	bl sub_80E8958
_080E7772:
	ldr r1, _080E777C
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	b _080E778A
	.align 2, 0
_080E777C: .4byte 0x02001000
_080E7780:
	bl sub_80E9974
	ldr r0, _080E7790
	bl sub_80E682C
_080E778A:
	pop {r0}
	bx r0
	.align 2, 0
_080E7790: .4byte sub_80E6FC8
	thumb_func_end sub_80E73D0

	thumb_func_start sub_80E7458
sub_80E7458: @ 80E7794
	push {r4,r5,lr}
	ldr r4, _080E77A4
	ldrh r5, [r4, 0x24]
	cmp r5, 0
	beq _080E77A8
	cmp r5, 0x1
	beq _080E77E0
	b _080E7854
	.align 2, 0
_080E77A4: .4byte 0x02001000
_080E77A8:
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r0, _080E77BC
	cmp r1, r0
	bne _080E77C0
	bl sub_80E9D7C
	b _080E77C4
	.align 2, 0
_080E77BC: .4byte sub_80E6FC8
_080E77C0:
	bl sub_80E9D00
_080E77C4:
	ldr r4, _080E77DC
	movs r2, 0xDF
	lsls r2, 1
	adds r0, r4, r2
	ldrb r0, [r0]
	bl sub_80E9E08
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E7854
	.align 2, 0
_080E77DC: .4byte 0x02001000
_080E77E0:
	bl sub_80E9E54
	lsls r0, 24
	cmp r0, 0
	beq _080E7854
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r0, _080E7818
	cmp r1, r0
	bne _080E7820
	bl sub_80E9D7C
	ldr r2, _080E781C
	adds r1, r4, r2
	adds r2, 0xB
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	bl sub_80E7A98
	adds r0, r4, 0
	adds r0, 0x96
	b _080E783A
	.align 2, 0
_080E7818: .4byte sub_80E6FC8
_080E781C: .4byte 0x000001b5
_080E7820:
	ldr r0, _080E785C
	adds r1, r4, r0
	movs r2, 0xE0
	lsls r2, 1
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	bl sub_80E7D30
	ldr r1, _080E7860
	adds r0, r4, r1
_080E783A:
	strb r5, [r0]
	ldr r1, _080E7864
	movs r0, 0xDF
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0x2
	strb r0, [r2]
	movs r2, 0xE2
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	bl sub_80E682C
_080E7854:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E785C: .4byte 0x00009d55
_080E7860: .4byte 0x000001b9
_080E7864: .4byte 0x02001000
	thumb_func_end sub_80E7458

	thumb_func_start sub_80E752C
sub_80E752C: @ 80E7868
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080E787C
	ldrh r1, [r4, 0x24]
	cmp r1, 0
	beq _080E7880
	cmp r1, 0x1
	beq _080E7898
	b _080E78A8
	.align 2, 0
_080E787C: .4byte 0x02001000
_080E7880:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x24]
	adds r0, 0x1
	strh r0, [r4, 0x24]
	b _080E78A8
_080E7898:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080E78A8
	ldr r0, [r4]
	bl SetMainCallback2
_080E78A8:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E752C

	thumb_func_start sub_80E7574
sub_80E7574: @ 80E78B0
	push {r4,r5,lr}
	ldr r4, _080E78F4
	ldrb r5, [r4, 0x8]
	cmp r5, 0x1
	bne _080E78F8
	adds r0, r4, 0
	adds r0, 0x86
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r4, 0
	adds r1, 0x7E
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080E78F8
	adds r0, r4, 0
	adds r0, 0x27
	ldrb r0, [r0]
	lsls r0, 1
	subs r1, 0x72
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7
	beq _080E78F8
	adds r0, r4, 0
	adds r0, 0x7D
	strb r5, [r0]
	adds r1, r4, 0
	b _080E7902
	.align 2, 0
_080E78F4: .4byte 0x02001000
_080E78F8:
	ldr r1, _080E7910
	adds r2, r1, 0
	adds r2, 0x7D
	movs r0, 0
	strb r0, [r2]
_080E7902:
	adds r1, 0x7D
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E7910: .4byte 0x02001000
	thumb_func_end sub_80E7574

	thumb_func_start sub_80E75D8
sub_80E75D8: @ 80E7914
	push {r4-r6,lr}
	movs r4, 0
	ldr r2, _080E7938
	ldrh r1, [r2, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080E7940
	ldr r1, _080E793C
	adds r0, r1, 0
	adds r0, 0x84
	ldrb r0, [r0]
	adds r2, r1, 0
	adds r2, 0x86
	strb r0, [r2]
	adds r1, 0x85
	movs r0, 0x2
	b _080E79CA
	.align 2, 0
_080E7938: .4byte gMain
_080E793C: .4byte 0x02001000
_080E7940:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080E796C
	ldr r2, _080E7968
	adds r1, r2, 0
	adds r1, 0x86
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080E7998
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r0, [r0]
	strb r0, [r1]
	b _080E7998
	.align 2, 0
_080E7968: .4byte 0x02001000
_080E796C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E7994
	ldr r0, _080E79C0
	adds r3, r0, 0
	adds r3, 0x86
	ldrb r1, [r3]
	adds r1, 0x1
	strb r1, [r3]
	adds r0, 0x84
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	ble _080E7992
	strb r4, [r3]
_080E7992:
	movs r4, 0x1
_080E7994:
	cmp r4, 0
	beq _080E7A26
_080E7998:
	ldr r2, _080E79C0
	ldrb r3, [r2, 0x9]
	cmp r3, 0x2
	bne _080E79CE
	adds r1, r2, 0
	adds r1, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E79C4
	adds r0, r2, 0
	adds r0, 0x85
	strb r3, [r0]
	b _080E7AF8
	.align 2, 0
_080E79C0: .4byte 0x02001000
_080E79C4:
	adds r1, r2, 0
	adds r1, 0x85
	movs r0, 0
_080E79CA:
	strb r0, [r1]
	b _080E7AF8
_080E79CE:
	movs r0, 0x85
	adds r0, r2
	mov r12, r0
	adds r4, r2, 0
	adds r4, 0x83
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrb r3, [r4]
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _080E79EC
	subs r0, r3, 0x1
	mov r1, r12
	strb r0, [r1]
_080E79EC:
	adds r1, r2, 0
	adds r1, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r3, [r1]
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	beq _080E7AF8
	ldrb r0, [r4]
	adds r4, r0, 0
	muls r4, r3
	adds r0, r4, 0
	mov r5, r12
	ldrb r5, [r5]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r2, 0xA]
	cmp r0, r1
	bcc _080E7AF8
	subs r0, r1
	mov r6, r12
	strb r0, [r6]
	b _080E7AF8
_080E7A26:
	ldrh r2, [r2, 0x30]
	movs r0, 0x20
	ands r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080E7A80
	ldr r2, _080E7A64
	adds r3, r2, 0
	adds r3, 0x85
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bge _080E7AF8
	adds r1, r2, 0
	adds r1, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r4, [r1]
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E7A68
	movs r0, 0x2
	b _080E7AF6
	.align 2, 0
_080E7A64: .4byte 0x02001000
_080E7A68:
	adds r0, r2, 0
	adds r0, 0x83
	ldrb r0, [r0]
	subs r1, r0, 0x1
	strb r1, [r3]
	adds r5, r4, 0
	muls r5, r0
	adds r0, r5, 0
	adds r1, r0
	lsls r1, 24
	lsrs r0, r1, 24
	b _080E7AEE
_080E7A80:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080E7AFC
	ldr r2, _080E7AB8
	adds r5, r2, 0
	adds r5, 0x86
	adds r0, r2, 0
	adds r0, 0x84
	movs r1, 0
	ldrsb r1, [r5, r1]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080E7ABC
	adds r1, r2, 0
	adds r1, 0x85
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	ble _080E7AF8
	strb r4, [r1]
	b _080E7AF8
	.align 2, 0
_080E7AB8: .4byte 0x02001000
_080E7ABC:
	adds r3, r2, 0
	adds r3, 0x85
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r6, 0x83
	adds r6, r2
	mov r12, r6
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	blt _080E7ADA
	strb r4, [r3]
_080E7ADA:
	ldrb r1, [r5]
	mov r4, r12
	ldrb r0, [r4]
	adds r5, r0, 0
	muls r5, r1
	adds r0, r5, 0
	ldrb r6, [r3]
	adds r0, r6
	lsls r0, 24
	lsrs r0, 24
_080E7AEE:
	ldrb r1, [r2, 0xA]
	cmp r0, r1
	bcc _080E7AF8
	subs r0, r1
_080E7AF6:
	strb r0, [r3]
_080E7AF8:
	movs r0, 0x1
	b _080E7AFE
_080E7AFC:
	movs r0, 0
_080E7AFE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E75D8

	thumb_func_start sub_80E77C8
sub_80E77C8: @ 80E7B04
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	ldr r1, _080E7B48
	ldr r2, _080E7B4C
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r3, r1, 0
	cmp r0, 0
	beq _080E7B7A
	ldr r1, _080E7B50
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _080E7B54
	movs r4, 0xD4
	lsls r4, 1
	adds r1, r3, r4
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	ble _080E7B42
	b _080E7C84
_080E7B42:
	movs r0, 0x3
	strb r0, [r1]
	b _080E7C84
	.align 2, 0
_080E7B48: .4byte 0x02001000
_080E7B4C: .4byte 0x000001b7
_080E7B50: .4byte gMain
_080E7B54:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	bne _080E7B5E
	b _080E7C8C
_080E7B5E:
	movs r5, 0xD4
	lsls r5, 1
	adds r1, r3, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bgt _080E7B74
	b _080E7C84
_080E7B74:
	movs r0, 0x1
	strb r0, [r1]
	b _080E7C84
_080E7B7A:
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080E7BD6
	movs r4, 0
	ldr r1, _080E7BAC
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _080E7BB0
	movs r6, 0xD4
	lsls r6, 1
	adds r1, r3, r6
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080E7C80
	movs r0, 0x3
	strb r0, [r1]
	b _080E7C80
	.align 2, 0
_080E7BAC: .4byte gMain
_080E7BB0:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080E7BD0
	movs r0, 0xD4
	lsls r0, 1
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _080E7BCE
	strb r7, [r1]
_080E7BCE:
	movs r4, 0x1
_080E7BD0:
	cmp r4, 0
	beq _080E7C8C
	b _080E7C80
_080E7BD6:
	movs r4, 0
	movs r1, 0xE0
	lsls r1, 1
	adds r5, r3, r1
	strb r7, [r5]
	ldr r1, _080E7C1C
	ldrh r2, [r1, 0x30]
	movs r0, 0x40
	ands r0, r2
	adds r6, r1, 0
	cmp r0, 0
	beq _080E7C24
	movs r2, 0xD4
	lsls r2, 1
	adds r1, r3, r2
	ldrb r2, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _080E7C00
	b _080E7DC4
_080E7C00:
	subs r0, r2, 0x1
	strb r0, [r1]
	ldr r4, _080E7C20
	adds r1, r3, r4
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	cmp r0, r1
	bge _080E7C6E
	movs r0, 0xFF
	strb r0, [r5]
	b _080E7C6E
	.align 2, 0
_080E7C1C: .4byte gMain
_080E7C20: .4byte 0x000001b5
_080E7C24:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080E7C6A
	movs r0, 0xD4
	lsls r0, 1
	adds r2, r3, r0
	movs r1, 0
	ldrsb r1, [r2, r1]
	movs r4, 0xDB
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, 0x1
	cmp r1, r0
	blt _080E7C4A
	b _080E7DC4
_080E7C4A:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r1, 0
	ldrsb r1, [r2, r1]
	ldr r2, _080E7C88
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x3
	cmp r1, r0
	ble _080E7C68
	movs r0, 0x1
	strb r0, [r5]
_080E7C68:
	movs r4, 0x1
_080E7C6A:
	cmp r4, 0
	beq _080E7C8C
_080E7C6E:
	movs r4, 0xE0
	lsls r4, 1
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7C80
	b _080E7DC4
_080E7C80:
	bl sub_80E7A98
_080E7C84:
	movs r0, 0x1
	b _080E7DC6
	.align 2, 0
_080E7C88: .4byte 0x000001b5
_080E7C8C:
	ldrh r1, [r6, 0x30]
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _080E7CCE
	ldr r5, _080E7CB0
	adds r2, r3, r5
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	beq _080E7CB4
	subs r0, r1, 0x1
	strb r0, [r2]
	b _080E7D22
	.align 2, 0
_080E7CB0: .4byte 0x000001a9
_080E7CB4:
	movs r6, 0xD4
	lsls r6, 1
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	movs r4, 0xD5
	lsls r4, 1
	adds r1, r3, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	b _080E7D22
_080E7CCE:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E7D1E
	ldr r5, _080E7D10
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080E7D08
	ldr r0, _080E7D14
	adds r4, r3, r0
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r3, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0xD5
	lsls r2, 1
	adds r0, r3, r2
	adds r1, r0
	ldrb r5, [r4]
	movs r2, 0
	ldrsb r2, [r4, r2]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _080E7D18
_080E7D08:
	ldr r4, _080E7D14
	adds r0, r3, r4
	strb r6, [r0]
	b _080E7D1C
	.align 2, 0
_080E7D10: .4byte 0x000001b7
_080E7D14: .4byte 0x000001a9
_080E7D18:
	adds r0, r5, 0x1
	strb r0, [r4]
_080E7D1C:
	movs r7, 0x1
_080E7D1E:
	cmp r7, 0
	beq _080E7DC4
_080E7D22:
	adds r2, r3, 0
	ldr r5, _080E7D84
	adds r7, r2, r5
	ldrb r6, [r7]
	mov r9, r6
	movs r1, 0
	ldr r0, _080E7D88
	adds r0, r2
	mov r12, r0
	subs r5, 0xF
	adds r4, r2, r5
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r6, 0xD5
	lsls r6, 1
	adds r6, r2
	mov r8, r6
	add r0, r8
	mov r6, r12
	movs r5, 0
	ldrsb r5, [r6, r5]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r5, r0
	bne _080E7D58
	movs r1, 0x1
_080E7D58:
	strb r1, [r7]
	cmp r1, 0
	beq _080E7D94
	ldr r0, _080E7D8C
	adds r1, r2, r0
	ldrb r0, [r4]
	ldrb r1, [r1]
	subs r0, r1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	beq _080E7D72
	b _080E7C84
_080E7D72:
	movs r0, 0x1
	strb r0, [r4]
	ldr r1, _080E7D90
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r2, r12
	strb r0, [r2]
	b _080E7C84
	.align 2, 0
_080E7D84: .4byte 0x000001b7
_080E7D88: .4byte 0x000001a9
_080E7D8C: .4byte 0x000001b5
_080E7D90: .4byte 0x000001ab
_080E7D94:
	mov r6, r9
	cmp r6, 0
	bne _080E7D9C
	b _080E7C84
_080E7D9C:
	ldr r1, _080E7DC0
	adds r0, r3, r1
	ldrb r0, [r0]
	ldrb r2, [r4]
	adds r0, r2
	strb r0, [r4]
	cmp r5, 0
	bne _080E7DAE
	b _080E7C84
_080E7DAE:
	movs r0, 0
	ldrsb r0, [r4, r0]
	add r0, r8
	ldrb r0, [r0]
	subs r0, 0x1
	mov r4, r12
	strb r0, [r4]
	b _080E7C84
	.align 2, 0
_080E7DC0: .4byte 0x000001b5
_080E7DC4:
	movs r0, 0
_080E7DC6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80E77C8

	thumb_func_start sub_80E7A98
sub_80E7A98: @ 80E7DD4
	push {lr}
	ldr r1, _080E7E08
	ldr r0, _080E7E0C
	adds r3, r1, r0
	movs r2, 0xD4
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r2, 0x2
	adds r1, r2
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r3, r1]
	ldrb r2, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	blt _080E7E02
	subs r0, r2, 0x1
	strb r0, [r3]
_080E7E02:
	pop {r0}
	bx r0
	.align 2, 0
_080E7E08: .4byte 0x02001000
_080E7E0C: .4byte 0x000001a9
	thumb_func_end sub_80E7A98

	thumb_func_start sub_80E7AD4
sub_80E7AD4: @ 80E7E10
	push {lr}
	ldr r3, _080E7E44
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E7E4C
	ldr r1, _080E7E48
	adds r0, r3, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0xD4
	lsls r2, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x2A
	adds r1, r0
	ldrb r1, [r1]
	adds r2, 0x10
	b _080E7E70
	.align 2, 0
_080E7E44: .4byte 0x02001000
_080E7E48: .4byte 0x000001a9
_080E7E4C:
	ldr r1, _080E7E78
	adds r0, r3, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r1, 0x1
	adds r0, r3, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r2, r0
	adds r0, r3, 0
	adds r0, 0x40
	adds r2, r0
	ldrb r1, [r2]
	movs r2, 0xDC
	lsls r2, 1
_080E7E70:
	adds r0, r3, r2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E7E78: .4byte 0x000001a9
	thumb_func_end sub_80E7AD4

	thumb_func_start sub_80E7B40
sub_80E7B40: @ 80E7E7C
	push {r4-r7,lr}
	movs r5, 0
	ldr r2, _080E7EC8
	movs r0, 0xE0
	lsls r0, 1
	adds r6, r2, r0
	strb r5, [r6]
	ldr r1, _080E7ECC
	ldrh r4, [r1, 0x30]
	movs r0, 0x40
	ands r0, r4
	adds r3, r2, 0
	adds r7, r1, 0
	cmp r0, 0
	beq _080E7ED8
	ldr r2, _080E7ED0
	adds r1, r3, r2
	ldrb r2, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _080E7EAA
	b _080E8056
_080E7EAA:
	subs r0, r2, 0x1
	strb r0, [r1]
	ldr r4, _080E7ED4
	adds r1, r3, r4
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	cmp r0, r1
	bge _080E7F2E
	movs r0, 0xFF
	strb r0, [r6]
	b _080E8056
	.align 2, 0
_080E7EC8: .4byte 0x02001000
_080E7ECC: .4byte gMain
_080E7ED0: .4byte 0x00009cd0
_080E7ED4: .4byte 0x00009d55
_080E7ED8:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _080E7F2A
	ldr r0, _080E7F1C
	adds r2, r3, r0
	movs r1, 0
	ldrsb r1, [r2, r1]
	ldr r4, _080E7F20
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, 0x1
	cmp r1, r0
	blt _080E7EFA
	b _080E8056
_080E7EFA:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r1, 0
	ldrsb r1, [r2, r1]
	ldr r2, _080E7F24
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x4
	cmp r1, r0
	blt _080E7F28
	movs r0, 0x1
	strb r0, [r6]
	b _080E8056
	.align 2, 0
_080E7F1C: .4byte 0x00009cd0
_080E7F20: .4byte 0x00009d54
_080E7F24: .4byte 0x00009d55
_080E7F28:
	movs r5, 0x1
_080E7F2A:
	cmp r5, 0
	beq _080E7F36
_080E7F2E:
	bl sub_80E7D30
_080E7F32:
	movs r0, 0x1
	b _080E8058
_080E7F36:
	ldrh r1, [r7, 0x30]
	movs r0, 0x20
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080E7F74
	ldr r4, _080E7F6C
	adds r2, r3, r4
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	cmp r0, 0
	bge _080E7F32
	ldr r6, _080E7F70
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, 0x1
	adds r1, r3, r4
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r2]
	b _080E7F32
	.align 2, 0
_080E7F6C: .4byte 0x00009cd1
_080E7F70: .4byte 0x00009cd0
_080E7F74:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080E7FAC
	ldr r6, _080E7FA4
	adds r4, r3, r6
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r2, _080E7FA8
	adds r1, r3, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	adds r6, 0x1
	adds r1, r3, r6
	adds r2, r1
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _080E7F32
	strb r5, [r4]
	b _080E7F32
	.align 2, 0
_080E7FA4: .4byte 0x00009cd1
_080E7FA8: .4byte 0x00009cd0
_080E7FAC:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080E8000
	ldr r1, _080E7FF8
	adds r0, r3, r1
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080E7FDE
	negs r0, r1
	movs r4, 0xE0
	lsls r4, 1
	adds r2, r3, r4
	strb r0, [r2]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x4
	negs r1, r1
	cmp r0, r1
	bge _080E7FDE
	strb r1, [r2]
_080E7FDE:
	ldr r6, _080E7FFC
	adds r1, r3, r6
	movs r2, 0xE0
	lsls r2, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	ldrb r4, [r1]
	adds r0, r4
	strb r0, [r1]
	movs r6, 0xDF
	lsls r6, 1
	adds r1, r3, r6
	b _080E8052
	.align 2, 0
_080E7FF8: .4byte 0x00009d55
_080E7FFC: .4byte 0x00009cd0
_080E8000:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E8056
	ldr r0, _080E8060
	adds r4, r3, r0
	movs r1, 0
	ldrsb r1, [r4, r1]
	ldr r6, _080E8064
	adds r2, r3, r6
	movs r0, 0
	ldrsb r0, [r2, r0]
	subs r0, 0x4
	cmp r1, r0
	bge _080E803A
	ldrb r1, [r4]
	adds r1, 0x4
	ldrb r0, [r2]
	subs r0, r1
	movs r2, 0xE0
	lsls r2, 1
	adds r1, r3, r2
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _080E803A
	movs r0, 0x4
	strb r0, [r1]
_080E803A:
	ldr r4, _080E8068
	adds r1, r3, r4
	movs r6, 0xE0
	lsls r6, 1
	adds r0, r3, r6
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r2
	strb r0, [r1]
	movs r4, 0xDF
	lsls r4, 1
	adds r1, r3, r4
_080E8052:
	movs r0, 0x4
	strb r0, [r1]
_080E8056:
	movs r0, 0
_080E8058:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E8060: .4byte 0x00009d55
_080E8064: .4byte 0x00009d54
_080E8068: .4byte 0x00009cd0
	thumb_func_end sub_80E7B40

	thumb_func_start sub_80E7D30
sub_80E7D30: @ 80E806C
	push {r4,lr}
	ldr r0, _080E809C
	ldr r1, _080E80A0
	adds r4, r0, r1
	ldr r2, _080E80A4
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r2, 0x2
	adds r0, r2
	adds r1, r0
	movs r2, 0
	ldrsb r2, [r4, r2]
	ldrb r3, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blt _080E8096
	subs r0, r3, 0x1
	strb r0, [r4]
_080E8096:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E809C: .4byte 0x02001000
_080E80A0: .4byte 0x00009cd1
_080E80A4: .4byte 0x00009cd0
	thumb_func_end sub_80E7D30

	thumb_func_start sub_80E7D6C
sub_80E7D6C: @ 80E80A8
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _080E80D0
	ldrb r1, [r0, 0xA]
	cmp r4, r1
	bcs _080E80CA
	adds r5, r0, 0
_080E80B6:
	adds r0, r4, 0
	ldr r1, _080E80D4
	bl sub_80E7F00
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r5, 0xA]
	cmp r4, r0
	bcc _080E80B6
_080E80CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E80D0: .4byte 0x02001000
_080E80D4: .4byte 0x0000ffff
	thumb_func_end sub_80E7D6C

	thumb_func_start sub_80E7D9C
sub_80E7D9C: @ 80E80D8
	push {r4,r5,lr}
	movs r2, 0
	ldr r0, _080E8108
	ldrb r1, [r0, 0xA]
	cmp r2, r1
	bcs _080E8102
	adds r3, r0, 0
	ldr r4, [r3, 0x4]
	adds r5, r3, 0
	adds r5, 0xC
_080E80EC:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r3, 0xA]
	cmp r2, r0
	bcc _080E80EC
_080E8102:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8108: .4byte 0x02001000
	thumb_func_end sub_80E7D9C

	thumb_func_start sub_80E7DD0
sub_80E7DD0: @ 80E810C
	push {r4,lr}
	ldr r2, _080E8164
	ldr r1, _080E8168
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 1
	ldr r3, _080E816C
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 2
	adds r1, r0
	adds r3, 0x86
	adds r0, r2, r3
	adds r1, r0
	ldrh r4, [r1]
	adds r0, r2, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8170
	adds r0, r2, 0
	adds r0, 0x86
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r2, 0
	adds r1, 0x7E
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _080E8170
	adds r0, r4, 0
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7
	bne _080E8170
	movs r0, 0
	b _080E8182
	.align 2, 0
_080E8164: .4byte 0x02001000
_080E8168: .4byte 0x00009cd1
_080E816C: .4byte 0x00009cd0
_080E8170:
	ldr r0, _080E8188
	adds r0, 0x27
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80E7F00
	bl sub_80E95A4
	movs r0, 0x1
_080E8182:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E8188: .4byte 0x02001000
	thumb_func_end sub_80E7DD0

	thumb_func_start sub_80E7E50
sub_80E7E50: @ 80E818C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r5, 0
	movs r2, 0
	ldr r1, _080E822C
	adds r3, r1, 0
	adds r3, 0x84
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bge _080E821A
	mov r8, r1
	adds r0, r1, 0
	str r0, [sp]
_080E81B0:
	mov r0, r8
	adds r0, 0x7E
	adds r0, r2, r0
	movs r1, 0
	strb r1, [r0]
	movs r3, 0
	ldr r6, _080E8230
	movs r0, 0
	ldrsb r0, [r6, r0]
	adds r1, r2, 0x1
	str r1, [sp, 0x4]
	cmp r3, r0
	bge _080E820A
	ldr r6, [sp]
	mov r12, r6
	movs r0, 0
	mov r10, r0
	ldr r1, _080E8230
	mov r9, r1
	ldr r7, _080E8234
	lsls r4, r2, 1
_080E81DA:
	lsls r1, r5, 1
	adds r2, r1, r7
	mov r6, r12
	ldr r0, [r6, 0x4]
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, r4
	mov r1, r12
	adds r1, 0x8C
	adds r0, r1
	mov r1, r10
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	mov r6, r9
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r3, r0
	blt _080E81DA
_080E820A:
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	lsrs r2, r0, 16
	ldr r6, _080E8238
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r2, r0
	blt _080E81B0
_080E821A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E822C: .4byte 0x02001000
_080E8230: .4byte 0x02001083
_080E8234: .4byte 0x0200100c
_080E8238: .4byte 0x02001084
	thumb_func_end sub_80E7E50

	thumb_func_start sub_80E7F00
sub_80E7F00: @ 80E823C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r7, _080E82A4
	adds r0, r7, 0
	adds r0, 0x83
	movs r4, 0
	ldrsb r4, [r0, r4]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r6, 0
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r0, r6, 1
	adds r1, r7, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80EB2D4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r9
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r4, 0x7
	bne _080E82A8
	cmp r3, 0x7
	beq _080E82B8
	adds r1, r7, 0
	adds r1, 0x7E
	adds r1, r5, r1
	ldrb r0, [r1]
	subs r0, 0x1
	b _080E82B6
	.align 2, 0
_080E82A4: .4byte 0x02001000
_080E82A8:
	cmp r3, 0x7
	bne _080E82B8
	adds r1, r7, 0
	adds r1, 0x7E
	adds r1, r5, r1
	ldrb r0, [r1]
	adds r0, 0x1
_080E82B6:
	strb r0, [r1]
_080E82B8:
	movs r3, 0
	ldr r2, _080E82E0
	lsls r0, r5, 1
	add r0, r8
	adds r1, r2, 0
	adds r1, 0x8C
	adds r0, r1
	strb r3, [r0]
	lsls r0, r6, 1
	adds r2, 0xC
	adds r0, r2
	mov r1, r9
	strh r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E82E0: .4byte 0x02001000
	thumb_func_end sub_80E7F00

	thumb_func_start sub_80E7FA8
sub_80E7FA8: @ 80E82E4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r0, 0
	mov r8, r0
	movs r5, 0
	ldr r0, _080E837C
	ldrb r1, [r0, 0xA]
	cmp r8, r1
	bcs _080E836A
	ldr r3, _080E8380
	adds r6, r0, r3
	ldr r1, _080E8384
	adds r1, r0
	mov r9, r1
_080E8304:
	ldr r3, _080E8388
	adds r7, r6, r3
	ldr r0, [r7, 0x4]
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0
	bl sub_80EB218
	ldr r1, _080E838C
	adds r0, r6, r1
	adds r0, r4
	ldrh r1, [r0]
	mov r0, r9
	movs r2, 0
	bl sub_80EB218
	adds r1, r6, 0
	mov r2, r9
	ldrb r0, [r1]
	adds r4, r5, 0x1
	ldrb r3, [r2]
	cmp r0, r3
	bne _080E8354
	adds r3, r7, 0
	cmp r0, 0xFF
	beq _080E834C
_080E833C:
	adds r1, 0x1
	adds r2, 0x1
	ldrb r0, [r1]
	ldrb r5, [r2]
	cmp r0, r5
	bne _080E8354
	cmp r0, 0xFF
	bne _080E833C
_080E834C:
	ldrb r0, [r1]
	ldrb r2, [r2]
	cmp r0, r2
	beq _080E8360
_080E8354:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r3, _080E837C
_080E8360:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	ldrb r3, [r3, 0xA]
	cmp r5, r3
	bcc _080E8304
_080E836A:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E837C: .4byte 0x02001000
_080E8380: .4byte 0x0000a140
_080E8384: .4byte 0x0000a16d
_080E8388: .4byte 0xffff5ec0
_080E838C: .4byte 0xffff5ecc
	thumb_func_end sub_80E7FA8

	thumb_func_start sub_80E8054
sub_80E8054: @ 80E8390
	push {r4,lr}
	movs r1, 0
	ldr r2, _080E83B4
	ldrb r0, [r2, 0xA]
	cmp r1, r0
	bcs _080E83C6
	adds r4, r2, 0
	adds r4, 0xC
	ldr r3, _080E83B8
	adds r2, r0, 0
_080E83A4:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	beq _080E83BC
	movs r0, 0
	b _080E83C8
	.align 2, 0
_080E83B4: .4byte 0x02001000
_080E83B8: .4byte 0x0000ffff
_080E83BC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _080E83A4
_080E83C6:
	movs r0, 0x1
_080E83C8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80E8054

	thumb_func_start sub_80E8094
sub_80E8094: @ 80E83D0
	push {r4-r7,lr}
	movs r5, 0
	ldr r6, _080E8400
	adds r7, r6, 0
	adds r7, 0x2D
_080E83DA:
	lsls r4, r5, 1
	ldr r1, _080E8404
	adds r0, r6, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0
	bl sub_80EB218
	ldr r0, _080E8408
	adds r4, r0
	ldrh r1, [r4]
	adds r0, r7, 0
	movs r2, 0
	bl sub_80EB218
	adds r3, r6, 0
	adds r4, r7, 0
	b _080E8414
	.align 2, 0
_080E8400: .4byte 0x0200b140
_080E8404: .4byte 0xffff5ecc
_080E8408: .4byte gMysteryEventPhrase
_080E840C:
	adds r4, 0x1
	adds r3, 0x1
	cmp r2, r1
	bne _080E8430
_080E8414:
	ldrb r2, [r3]
	adds r0, r2, 0
	cmp r0, 0xFF
	beq _080E842A
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080E840C
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080E8430
_080E842A:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080E8434
_080E8430:
	movs r0, 0
	b _080E8440
_080E8434:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080E83DA
	movs r0, 0x1
_080E8440:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80E8094

	thumb_func_start sub_80E810C
sub_80E810C: @ 80E8448
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r6, _080E84D4
	ldr r0, _080E84D8
	adds r0, r6
	mov r9, r0
	movs r1, 0
	mov r8, r1
	adds r7, r6, 0
	adds r7, 0x80
	ldr r2, _080E84DC
	mov r10, r2
_080E8468:
	mov r0, r9
	ldrh r1, [r0, 0xC]
	adds r0, r6, 0
	movs r2, 0
	bl sub_80EB218
	mov r1, r8
	strb r1, [r0]
	adds r0, 0x1
	mov r2, r9
	ldrh r1, [r2, 0xE]
	movs r2, 0
	bl sub_80EB218
	lsls r4, r5, 2
	mov r1, r10
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r0, r7, 0
	movs r2, 0
	bl sub_80EB218
	mov r2, r8
	strb r2, [r0]
	adds r0, 0x1
	ldr r1, _080E84E0
	adds r4, r1
	ldrh r1, [r4]
	movs r2, 0
	bl sub_80EB218
	adds r0, r6, 0
	adds r3, r7, 0
	adds r4, r5, 0x1
_080E84AC:
	ldrb r2, [r0]
	cmp r2, 0xFF
	beq _080E84C6
	ldrb r1, [r3]
	cmp r1, 0xFF
	beq _080E84C0
	adds r3, 0x1
	adds r0, 0x1
	cmp r2, r1
	beq _080E84AC
_080E84C0:
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080E84E4
_080E84C6:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080E84E4
	lsls r0, r4, 24
	lsrs r0, 24
	b _080E84EE
	.align 2, 0
_080E84D4: .4byte 0x0200b19a
_080E84D8: .4byte 0xffff5e66
_080E84DC: .4byte gBerryMasterWifePhrases
_080E84E0: .4byte 0x083e7686
_080E84E4:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _080E8468
	movs r0, 0
_080E84EE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80E810C

	thumb_func_start sub_80E81C0
sub_80E81C0: @ 80E84FC
	push {r4,lr}
	ldr r0, _080E8528
	ldr r4, _080E852C
	ldr r2, _080E8530
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r2, 0
	bl sub_80EB218
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	ldr r1, _080E8534
	adds r4, r1
	ldrh r1, [r4]
	movs r2, 0
	bl sub_80EB218
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8528: .4byte gStringVar2
_080E852C: .4byte 0x02001000
_080E8530: .4byte 0x00009fa8
_080E8534: .4byte 0x00009faa
	thumb_func_end sub_80E81C0

	thumb_func_start sub_80E81FC
sub_80E81FC: @ 80E8538
	push {lr}
	movs r0, 0x5
	bl PlaySE
	bl sub_80E95A4
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80E81FC

	thumb_func_start sub_80E8218
sub_80E8218: @ 80E8554
	push {r4,r5,lr}
	sub sp, 0x40
	mov r1, sp
	ldr r0, _080E859C
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r4,r5}
	stm r1!, {r2,r4,r5}
	ldr r0, [r0]
	str r0, [r1]
	add r4, sp, 0x28
	adds r1, r4, 0
	ldr r0, _080E85A0
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	bl sub_80E8268
	bl sub_80E8818
	bl sub_80E8A7C
	add sp, 0x40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E859C: .4byte gSpriteSheets_Interview
_080E85A0: .4byte gSpritePalettes_Interview
	thumb_func_end sub_80E8218

	thumb_func_start sub_80E8268
sub_80E8268: @ 80E85A4
	push {lr}
	ldr r0, _080E85EC
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E85F0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080E85F4
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x8A
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x8
	movs r2, 0
	strh r0, [r1, 0x22]
	adds r0, r3, 0
	adds r0, 0x88
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x20]
	strh r2, [r1, 0x2E]
	strh r2, [r1, 0x30]
	adds r0, r3, 0
	adds r0, 0x98
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E85EC: .4byte gSpriteTemplate_83DBBFC
_080E85F0: .4byte gSprites
_080E85F4: .4byte gUnknown_083DB694
	thumb_func_end sub_80E8268

	thumb_func_start sub_80E82BC
sub_80E82BC: @ 80E85F8
	push {r4-r7,lr}
	adds r3, r0, 0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E86C8
	ldr r0, _080E8670
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x87
	ldrb r1, [r1]
	mov r12, r0
	cmp r1, 0
	beq _080E86A8
	adds r0, r2, 0
	adds r0, 0x86
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r2, 0
	adds r0, 0x85
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r4, r0, 16
	movs r7, 0
	movs r1, 0
	cmp r7, r4
	bcs _080E8652
	lsls r6, r5, 1
	adds r2, 0x8C
_080E863C:
	adds r0, r1, r6
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bcc _080E863C
_080E8652:
	mov r0, r12
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x84
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r5, r0
	bne _080E8674
	movs r0, 0x60
	strh r0, [r3, 0x22]
	lsls r0, r4, 3
	subs r0, r4
	adds r0, 0x3
	b _080E8692
	.align 2, 0
_080E8670: .4byte gUnknown_083DB694
_080E8674:
	adds r1, r2, 0
	adds r1, 0x8A
	lsls r0, r5, 1
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 3
	adds r0, 0x8
	strh r0, [r3, 0x22]
	adds r0, r2, 0
	adds r0, 0x88
	ldrh r0, [r0]
	adds r0, r7
	movs r1, 0xB
	muls r1, r4
	adds r0, r1
_080E8692:
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r3, 0x20]
	movs r1, 0
	ldr r0, _080E86A4
	strh r0, [r3, 0x24]
	strh r1, [r3, 0x2E]
	b _080E86C8
	.align 2, 0
_080E86A4: .4byte 0x0000fffa
_080E86A8:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E86C8
	strh r1, [r3, 0x2E]
	ldrh r0, [r3, 0x24]
	adds r0, 0x1
	strh r0, [r3, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080E86C8
	ldr r0, _080E86D0
	strh r0, [r3, 0x24]
_080E86C8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E86D0: .4byte 0x0000fffa
	thumb_func_end sub_80E82BC

	thumb_func_start sub_80E8398
sub_80E8398: @ 80E86D4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1
	beq _080E8710
	cmp r3, 0x1
	bgt _080E86E8
	cmp r3, 0
	beq _080E86EE
	b _080E8752
_080E86E8:
	cmp r3, 0x2
	beq _080E8734
	b _080E8752
_080E86EE:
	ldr r0, _080E870C
	ldr r0, [r0]
	adds r0, 0x98
	ldr r1, [r0]
	strh r3, [r1, 0x30]
	ldr r1, [r0]
	strh r3, [r1, 0x24]
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _080E8750
	.align 2, 0
_080E870C: .4byte gUnknown_083DB694
_080E8710:
	ldr r0, _080E8730
	ldr r1, [r0]
	adds r1, 0x98
	ldr r0, [r1]
	movs r2, 0
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	strh r2, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _080E8750
	.align 2, 0
_080E8730: .4byte gUnknown_083DB694
_080E8734:
	ldr r0, _080E8758
	ldr r1, [r0]
	adds r1, 0x98
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x1
	strh r0, [r2, 0x30]
	ldr r0, [r1]
	strh r3, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
_080E8750:
	strb r0, [r1]
_080E8752:
	pop {r0}
	bx r0
	.align 2, 0
_080E8758: .4byte gUnknown_083DB694
	thumb_func_end sub_80E8398

	thumb_func_start sub_80E8420
sub_80E8420: @ 80E875C
	push {r4-r7,lr}
	sub sp, 0x18
	mov r1, sp
	ldr r0, _080E881C
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E8820
	ldr r7, [r1]
	adds r5, r7, 0
	adds r5, 0x9C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r4, _080E8824
	adds r1, r4
	str r1, [r5]
	ldr r0, _080E8828
	str r0, [sp, 0x8]
	ldr r0, _080E882C
	str r0, [sp, 0x14]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r6, r7, 0
	adds r6, 0xA0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r6]
	ldr r0, _080E8830
	str r0, [sp, 0x8]
	ldr r0, _080E8834
	str r0, [sp, 0x14]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r2, r7, 0
	adds r2, 0xA4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	str r1, [r2]
	ldr r0, [r5]
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r0, [r6]
	strh r1, [r0, 0x2E]
	ldr r0, [r2]
	strh r1, [r0, 0x2E]
	movs r0, 0x1
	bl IndexOfSpritePaletteTag
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 20
	ldr r2, _080E8838
	adds r0, r2
	strh r0, [r1, 0x34]
	bl sub_80E8534
	adds r1, r7, 0
	adds r1, 0x96
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080E883C
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E881C: .4byte gSpriteTemplate_83DBCAC
_080E8820: .4byte gUnknown_083DB694
_080E8824: .4byte gSprites
_080E8828: .4byte gSpriteAnimTable_83DBC8C
_080E882C: .4byte sub_80E872C
_080E8830: .4byte gSpriteAnimTable_83DBC9C
_080E8834: .4byte sub_80E8760
_080E8838: .4byte 0x00000101
_080E883C: .4byte 0x04000050
	thumb_func_end sub_80E8420

	thumb_func_start sub_80E8504
sub_80E8504: @ 80E8840
	push {r4,lr}
	ldr r0, _080E886C
	ldr r4, [r0]
	adds r0, r4, 0
	adds r0, 0x9C
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0
	adds r0, 0xA0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0
	adds r0, 0xA4
	ldr r0, [r0]
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E886C: .4byte gUnknown_083DB694
	thumb_func_end sub_80E8504

	thumb_func_start sub_80E8534
sub_80E8534: @ 80E8870
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _080E8890
	ldr r3, [r1]
	ldr r2, _080E8894
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, r1, 0
	cmp r0, 0
	beq _080E889C
	ldr r1, _080E8898
	movs r0, 0x1
	b _080E88D4
	.align 2, 0
_080E8890: .4byte gUnknown_083DB694
_080E8894: .4byte 0x000001b7
_080E8898: .4byte gUnknown_020388AC
_080E889C:
	adds r0, r3, 0
	adds r0, 0x26
	ldrb r2, [r0]
	cmp r2, 0
	bne _080E88B4
	ldr r0, _080E88B0
	strb r2, [r0]
	adds r7, r0, 0
	b _080E88D8
	.align 2, 0
_080E88B0: .4byte gUnknown_020388AC
_080E88B4:
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, 0xC0
	lsls r0, 3
	cmp r1, r0
	bne _080E88D0
	ldr r1, _080E88CC
	movs r0, 0x2
	b _080E88D4
	.align 2, 0
_080E88CC: .4byte gUnknown_020388AC
_080E88D0:
	ldr r1, _080E8930
	movs r0, 0x3
_080E88D4:
	strb r0, [r1]
	adds r7, r1, 0
_080E88D8:
	ldr r2, [r4]
	adds r4, r2, 0
	adds r4, 0x9C
	ldr r1, [r4]
	ldrb r0, [r7]
	movs r3, 0
	mov r8, r3
	strh r0, [r1, 0x32]
	adds r5, r2, 0
	adds r5, 0xA0
	ldr r1, [r5]
	ldrb r0, [r7]
	strh r0, [r1, 0x32]
	adds r6, r2, 0
	adds r6, 0xA4
	ldr r1, [r6]
	ldrb r0, [r7]
	strh r0, [r1, 0x32]
	ldr r0, [r4]
	ldrb r1, [r7]
	bl StartSpriteAnim
	ldr r0, [r5]
	ldrb r1, [r7]
	bl StartSpriteAnim
	ldr r0, [r6]
	ldrb r1, [r7]
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0x8
	strh r1, [r0, 0x38]
	ldr r0, [r4]
	strh r1, [r0, 0x3A]
	ldr r0, [r4]
	mov r1, r8
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8930: .4byte gUnknown_020388AC
	thumb_func_end sub_80E8534

	thumb_func_start sub_80E85F8
sub_80E85F8: @ 80E8934
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E8960
	ldr r1, _080E895C
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	adds r0, 0x8
	strh r0, [r5, 0x38]
	b _080E8976
	.align 2, 0
_080E895C: .4byte gSineTable
_080E8960:
	ldr r1, _080E89C4
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 21
	movs r0, 0x8
	subs r0, r1
	strh r0, [r5, 0x3A]
_080E8976:
	ldrh r0, [r5, 0x30]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldr r2, _080E89C8
	ldrh r0, [r5, 0x3A]
	lsls r0, 8
	ldrh r1, [r5, 0x38]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080E89CC
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0x96
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8A56
	bl sub_80E8534
	adds r1, r6, 0
	adds r1, 0x9C
	ldr r0, [r1]
	movs r2, 0x8
	strh r2, [r0, 0x38]
	ldr r0, [r1]
	strh r2, [r0, 0x3A]
	ldr r1, [r1]
	movs r0, 0
	strh r0, [r1, 0x30]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080E8A00
	cmp r0, 0x1
	bgt _080E89D0
	cmp r0, 0
	beq _080E89DA
	b _080E8A56
	.align 2, 0
_080E89C4: .4byte gSineTable
_080E89C8: .4byte 0x04000052
_080E89CC: .4byte gUnknown_083DB694
_080E89D0:
	cmp r0, 0x2
	beq _080E8A12
	cmp r0, 0x3
	beq _080E8A1A
	b _080E8A56
_080E89DA:
	ldr r2, _080E89FC
	adds r0, r6, r2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, 0x20
	strh r0, [r5, 0x20]
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r2, 0xC
	b _080E8A46
	.align 2, 0
_080E89FC: .4byte 0x000001a9
_080E8A00:
	movs r0, 0xD6
	strh r0, [r5, 0x20]
	movs r1, 0xD4
	lsls r1, 1
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	b _080E8A50
_080E8A12:
	movs r0, 0x97
	strh r0, [r5, 0x20]
	movs r0, 0x60
	b _080E8A54
_080E8A1A:
	ldr r4, _080E8A5C
	ldr r2, _080E8A60
	adds r0, r6, r2
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xD4
	lsls r0, 1
	adds r3, r6, r0
	movs r2, 0
	ldrsb r2, [r3, r2]
	lsls r0, r2, 3
	subs r0, r2
	adds r1, r0
	adds r1, r4
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 3
	adds r0, 0x1F
	strh r0, [r5, 0x20]
	movs r0, 0
	ldrsb r0, [r3, r0]
	ldr r2, _080E8A64
_080E8A46:
	adds r1, r6, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
_080E8A50:
	lsls r0, 4
	adds r0, 0x60
_080E8A54:
	strh r0, [r5, 0x22]
_080E8A56:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8A5C: .4byte gUnknown_083DBCC4
_080E8A60: .4byte 0x000001a9
_080E8A64: .4byte 0x000001b5
	thumb_func_end sub_80E85F8

	thumb_func_start sub_80E872C
sub_80E872C: @ 80E8A68
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E8A98
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x96
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8A92
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080E8A92
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x20
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x22]
_080E8A92:
	pop {r0}
	bx r0
	.align 2, 0
_080E8A98: .4byte gUnknown_083DB694
	thumb_func_end sub_80E872C

	thumb_func_start sub_80E8760
sub_80E8760: @ 80E8A9C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E8AC0
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x96
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8AEE
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	beq _080E8AD4
	cmp r0, 0x1
	bgt _080E8AC4
	cmp r0, 0
	beq _080E8ACA
	b _080E8AEE
	.align 2, 0
_080E8AC0: .4byte gUnknown_083DB694
_080E8AC4:
	cmp r0, 0x2
	beq _080E8ADE
	b _080E8AEE
_080E8ACA:
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x40
	b _080E8AE6
_080E8AD4:
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x1C
	b _080E8AE6
_080E8ADE:
	adds r1, 0x9C
	ldr r0, [r1]
	ldrh r0, [r0, 0x20]
	adds r0, 0x15
_080E8AE6:
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x22]
_080E8AEE:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8760

	thumb_func_start sub_80E87A4
sub_80E87A4: @ 80E8AF4
	push {r4,lr}
	lsls r0, 24
	ldr r1, _080E8B18
	ldr r1, [r1]
	adds r2, r1, 0
	adds r2, 0xA8
	ldr r3, [r2]
	movs r4, 0
	cmp r0, 0
	bne _080E8B0A
	movs r4, 0x1
_080E8B0A:
	movs r1, 0
	strh r4, [r3, 0x30]
	ldr r0, [r2]
	strh r1, [r0, 0x24]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8B18: .4byte gUnknown_083DB694
	thumb_func_end sub_80E87A4

	thumb_func_start sub_80E87CC
sub_80E87CC: @ 80E8B1C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080E8B60
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0xA8
	ldr r0, [r0]
	movs r3, 0
	cmp r4, 0
	bne _080E8B36
	movs r3, 0x1
_080E8B36:
	adds r2, r0, 0
	adds r2, 0x3E
	lsls r3, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	adds r0, r4, 0
	bl sub_80E87A4
	cmp r4, 0
	beq _080E8B5A
	ldr r0, _080E8B64
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_080E8B5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8B60: .4byte gUnknown_083DB694
_080E8B64: .4byte 0x000001b9
	thumb_func_end sub_80E87CC

	thumb_func_start sub_80E8818
sub_80E8818: @ 80E8B68
	push {lr}
	ldr r0, _080E8BA0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E8BA4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	ldr r0, _080E8BA8
	ldr r0, [r0]
	adds r0, 0xA8
	str r1, [r0]
	ldr r0, _080E8BAC
	str r0, [r1, 0x1C]
	movs r0, 0
	bl sub_80E87CC
	pop {r0}
	bx r0
	.align 2, 0
_080E8BA0: .4byte gSpriteTemplate_83DBBFC
_080E8BA4: .4byte gSprites
_080E8BA8: .4byte gUnknown_083DB694
_080E8BAC: .4byte sub_80E8860
	thumb_func_end sub_80E8818

	thumb_func_start sub_80E8860
sub_80E8860: @ 80E8BB0
	push {r4,r5,lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r4, [r2, r0]
	cmp r4, 0
	bne _080E8C34
	ldr r0, _080E8C00
	ldr r3, [r0]
	ldr r1, _080E8C04
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	beq _080E8C14
	ldr r5, _080E8C08
	adds r0, r3, r5
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x58
	muls r0, r1
	adds r0, 0x2C
	strh r0, [r2, 0x20]
	ldr r1, _080E8C0C
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r5, 0x84
	adds r1, r3, r5
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
	lsls r0, 4
	adds r0, 0x60
	strh r0, [r2, 0x22]
	ldr r0, _080E8C10
	strh r0, [r2, 0x24]
	strh r4, [r2, 0x2E]
	b _080E8C34
	.align 2, 0
_080E8C00: .4byte gUnknown_083DB694
_080E8C04: .4byte 0x000001b9
_080E8C08: .4byte 0x00009cd1
_080E8C0C: .4byte 0x00009cd0
_080E8C10: .4byte 0x0000fffa
_080E8C14:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E8C34
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080E8C34
	ldr r0, _080E8C3C
	strh r0, [r2, 0x24]
_080E8C34:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E8C3C: .4byte 0x0000fffa
	thumb_func_end sub_80E8860

	thumb_func_start sub_80E88F0
sub_80E88F0: @ 80E8C40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	ldr r0, _080E8CA0
	mov r8, r0
	ldr r0, [r0]
	movs r6, 0x4
	movs r5, 0
	movs r1, 0xB4
	adds r1, r0
	mov r12, r1
	adds r7, r0, 0
	adds r7, 0xAC
_080E8C5C:
	lsls r2, r4, 2
	adds r3, r7, r2
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r3]
	strh r5, [r0, 0x30]
	add r2, r12
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r2]
	strh r5, [r0, 0x30]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E8C5C
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _080E8CA4
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8CA0: .4byte gUnknown_083DB694
_080E8CA4: .4byte 0x00009f9c
	thumb_func_end sub_80E88F0

	thumb_func_start sub_80E8958
sub_80E8958: @ 80E8CA8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _080E8D04
	movs r0, 0x64
	mov r9, r0
	ldr r0, _080E8CE8
	ldr r2, [r0]
	ldr r3, _080E8CEC
	adds r1, r2, r3
	ldr r3, _080E8CF0
	adds r0, r2, r3
	str r0, [r1]
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E8CF8
	movs r1, 0xDB
	lsls r1, 1
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x4
	ldr r3, _080E8CF4
	adds r1, r2, r3
	strb r0, [r1]
	b _080E8D50
	.align 2, 0
_080E8CE8: .4byte gUnknown_083DB694
_080E8CEC: .4byte 0x00009f98
_080E8CF0: .4byte 0x000001b5
_080E8CF4: .4byte 0x00009f9d
_080E8CF8:
	ldr r1, _080E8D00
	adds r0, r2, r1
	strb r7, [r0]
	b _080E8D50
	.align 2, 0
_080E8D00: .4byte 0x00009f9d
_080E8D04:
	movs r3, 0x78
	mov r9, r3
	ldr r0, _080E8DB4
	ldr r2, [r0]
	ldr r0, _080E8DB8
	adds r1, r2, r0
	ldr r3, _080E8DBC
	adds r0, r2, r3
	str r0, [r1]
	ldr r1, _080E8DC0
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x4
	ldr r3, _080E8DC4
	adds r1, r2, r3
	strb r0, [r1]
	movs r4, 0
	adds r5, r2, 0
	adds r5, 0xB4
	movs r0, 0x5
	negs r0, r0
	mov r12, r0
	movs r6, 0x1
_080E8D32:
	lsls r3, r4, 2
	adds r3, r5, r3
	ldr r1, [r3]
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r3]
	strh r6, [r0, 0x30]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E8D32
_080E8D50:
	ldr r0, _080E8DB4
	ldr r2, [r0]
	ldr r3, _080E8DC4
	adds r1, r2, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _080E8D64
	movs r0, 0
	strb r0, [r1]
_080E8D64:
	movs r4, 0
	adds r6, r2, 0
	adds r6, 0xAC
	movs r0, 0x5
	negs r0, r0
	mov r8, r0
_080E8D70:
	lsls r2, r4, 2
	adds r2, r6, r2
	ldr r0, [r2]
	mov r1, r9
	strh r1, [r0, 0x20]
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	mov r3, r8
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r2]
	movs r5, 0x1
	strh r5, [r0, 0x30]
	ldr r0, [r2]
	adds r1, r7, 0
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E8D70
	ldr r0, _080E8DB4
	ldr r0, [r0]
	ldr r1, _080E8DC8
	adds r0, r1
	strb r5, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8DB4: .4byte gUnknown_083DB694
_080E8DB8: .4byte 0x00009f98
_080E8DBC: .4byte 0x00009d55
_080E8DC0: .4byte 0x00009d54
_080E8DC4: .4byte 0x00009f9d
_080E8DC8: .4byte 0x00009f9c
	thumb_func_end sub_80E8958

	thumb_func_start sub_80E8A7C
sub_80E8A7C: @ 80E8DCC
	push {r4-r7,lr}
	sub sp, 0x18
	mov r1, sp
	ldr r0, _080E8EB8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r5, 0
_080E8DDE:
	lsls r2, r5, 3
	adds r2, r5
	lsls r2, 19
	movs r0, 0xA8
	lsls r0, 15
	adds r2, r0
	asrs r2, 16
	mov r0, sp
	movs r1, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080E8EBC
	ldr r2, [r0]
	lsls r0, r5, 2
	adds r2, 0xAC
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E8EC0
	adds r0, r1
	str r0, [r2]
	strh r5, [r0, 0x2E]
	ldr r3, [r2]
	adds r3, 0x3F
	movs r0, 0x1
	adds r2, r5, 0
	ands r2, r0
	lsls r2, 1
	ldrb r0, [r3]
	movs r4, 0x3
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E8DDE
	mov r0, sp
	movs r1, 0x3
	strh r1, [r0]
	ldr r0, _080E8EC4
	str r0, [sp, 0x8]
	movs r5, 0
	movs r7, 0x3F
	movs r6, 0x40
_080E8E46:
	lsls r4, r5, 2
	adds r1, r4, r5
	lsls r1, 19
	movs r0, 0x8E
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	mov r0, sp
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080E8EBC
	ldr r2, [r0]
	adds r2, 0xB4
	adds r2, r4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E8EC0
	adds r0, r1
	str r0, [r2]
	strh r5, [r0, 0x2E]
	ldr r3, [r2]
	ldrb r1, [r3, 0x1]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strb r0, [r3, 0x1]
	ldr r3, [r2]
	ldrb r1, [r3, 0x3]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r6
	strb r0, [r3, 0x3]
	ldr r0, [r2]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080E8E46
	movs r0, 0
	bl sub_80E8958
	bl sub_80E88F0
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8EB8: .4byte gSpriteTemplate_83DBD18
_080E8EBC: .4byte gUnknown_083DB694
_080E8EC0: .4byte gSprites
_080E8EC4: .4byte gUnknown_083DBD10
	thumb_func_end sub_80E8A7C

	thumb_func_start sub_80E8B78
sub_80E8B78: @ 80E8EC8
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080E8F00
	ldr r1, [r0]
	ldr r2, _080E8F04
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E8F38
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080E8F38
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _080E8F0C
	movs r4, 0
	ldr r2, _080E8F08
	adds r0, r1, r2
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _080E8F26
	b _080E8F24
	.align 2, 0
_080E8F00: .4byte gUnknown_083DB694
_080E8F04: .4byte 0x00009f9c
_080E8F08: .4byte 0x00009f98
_080E8F0C:
	movs r4, 0
	ldr r2, _080E8F40
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, 0x5
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _080E8F26
_080E8F24:
	movs r4, 0x1
_080E8F26:
	adds r2, r3, 0
	adds r2, 0x3E
	lsls r3, r4, 2
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080E8F38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E8F40: .4byte 0x00009f98
	thumb_func_end sub_80E8B78

	thumb_func_start sub_80E8BF4
sub_80E8BF4: @ 80E8F44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r0, _080E8F78
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	ldr r0, _080E8F7C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	cmp r2, 0x2
	beq _080E8F70
	cmp r2, 0x5
	beq _080E8F80
_080E8F70:
	movs r4, 0x40
	movs r5, 0x28
	b _080E8F84
	.align 2, 0
_080E8F78: .4byte gUnknown_083DBD30
_080E8F7C: .4byte gUnknown_083DBD38
_080E8F80:
	movs r4, 0x24
	movs r5, 0x30
_080E8F84:
	cmp r3, 0
	beq _080E8F8C
	cmp r3, 0x1
	beq _080E8F90
_080E8F8C:
	movs r0, 0x43
	b _080E8F92
_080E8F90:
	movs r0, 0x44
_080E8F92:
	mov r8, r0
	add r0, sp, 0x4
	bl LoadCompressedObjectPic
	add r0, sp, 0xC
	bl LoadSpritePalette
	ldr r0, _080E902C
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl CreateSprite
	ldr r0, _080E9030
	ldrb r0, [r0, 0x8]
	movs r1, 0x69
	cmp r0, 0
	bne _080E8FB8
	movs r1, 0x64
_080E8FB8:
	ldr r7, _080E9034
	adds r2, r4, 0
	subs r2, 0xC
	movs r6, 0
	str r6, [sp]
	adds r0, r1, 0
	adds r1, r7, 0
	adds r3, r5, 0
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080E8FEE
	ldr r1, _080E9038
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x3
	bl StartSpriteAnim
_080E8FEE:
	adds r2, r4, 0
	adds r2, 0xC
	str r6, [sp]
	mov r0, r8
	adds r1, r7, 0
	adds r3, r5, 0
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080E9020
	ldr r1, _080E9038
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x2
	bl StartSpriteAnim
_080E9020:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E902C: .4byte gSpriteTemplate_83DBD48
_080E9030: .4byte gSaveBlock2
_080E9034: .4byte SpriteCallbackDummy
_080E9038: .4byte gSprites
	thumb_func_end sub_80E8BF4

	thumb_func_start sub_80E8CEC
sub_80E8CEC: @ 80E903C
	push {lr}
	ldr r0, _080E9074
	bl LoadCompressedObjectPic
	ldr r0, _080E9078
	bl LoadSpritePalette
	ldr r0, _080E907C
	movs r1, 0xE0
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080E908C
	ldr r0, _080E9080
	ldr r2, [r0]
	ldr r0, _080E9084
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E9088
	adds r0, r1
	str r0, [r2]
	b _080E9098
	.align 2, 0
_080E9074: .4byte gUnknown_083DBD60
_080E9078: .4byte gUnknown_083DBD68
_080E907C: .4byte gSpriteTemplate_83DBDE4
_080E9080: .4byte gUnknown_083DB694
_080E9084: .4byte 0x00009fa0
_080E9088: .4byte gSprites
_080E908C:
	ldr r0, _080E909C
	ldr r0, [r0]
	ldr r1, _080E90A0
	adds r0, r1
	movs r1, 0
	str r1, [r0]
_080E9098:
	pop {r0}
	bx r0
	.align 2, 0
_080E909C: .4byte gUnknown_083DB694
_080E90A0: .4byte 0x00009fa0
	thumb_func_end sub_80E8CEC

	thumb_func_start sub_80E8D54
sub_80E8D54: @ 80E90A4
	push {lr}
	ldr r0, _080E90C8
	ldr r2, [r0]
	ldr r1, _080E90CC
	adds r0, r2, r1
	ldr r1, [r0]
	cmp r1, 0
	beq _080E90D8
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E90D0
	adds r0, r1, 0
	movs r1, 0x1
	bl StartSpriteAnim
	b _080E90D8
	.align 2, 0
_080E90C8: .4byte gUnknown_083DB694
_080E90CC: .4byte 0x00009fa0
_080E90D0:
	adds r0, r1, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080E90D8:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8D54

	thumb_func_start sub_80E8D8C
sub_80E8D8C: @ 80E90DC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080E9108
	ldr r2, [r0]
	ldr r1, _080E910C
	adds r0, r2, r1
	ldr r1, [r0]
	cmp r1, 0
	beq _080E9122
	cmp r3, 0
	beq _080E911A
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E9110
	adds r0, r1, 0
	movs r1, 0x3
	bl StartSpriteAnim
	b _080E9122
	.align 2, 0
_080E9108: .4byte gUnknown_083DB694
_080E910C: .4byte 0x00009fa0
_080E9110:
	adds r0, r1, 0
	movs r1, 0x4
	bl StartSpriteAnim
	b _080E9122
_080E911A:
	adds r0, r1, 0
	movs r1, 0x5
	bl StartSpriteAnim
_080E9122:
	pop {r0}
	bx r0
	thumb_func_end sub_80E8D8C

	thumb_func_start sub_80E8DD8
sub_80E8DD8: @ 80E9128
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	ldr r0, _080E927C
	movs r6, 0
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	adds r0, 0x4
	strh r6, [r0]
	subs r0, 0x2
	strh r6, [r0]
	adds r0, 0x4
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
	ldr r1, _080E9280
	movs r2, 0x8B
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E9284
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E9288
	ldr r1, _080E928C
	ldr r1, [r1]
	mov r8, r1
	movs r4, 0xE4
	lsls r4, 1
	add r4, r8
	movs r5, 0xA0
	lsls r5, 2
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _080E9290
	movs r1, 0xD9
	lsls r1, 3
	add r1, r8
	bl LZ77UnCompWram
	ldr r0, _080E9294
	ldr r1, _080E9298
	bl LZ77UnCompVram
	ldr r1, _080E929C
	adds r0, r4, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _080E92A0
	movs r1, 0x40
	movs r2, 0x40
	bl LoadPalette
	ldr r1, _080E92A4
	ldr r2, _080E92A8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E92AC
	movs r5, 0x80
	lsls r5, 4
	mov r0, sp
	strh r6, [r0]
	ldr r4, _080E92B0
	str r0, [r4]
	str r1, [r4, 0x4]
	lsrs r0, r5, 1
	movs r2, 0x81
	lsls r2, 24
	orrs r0, r2
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080E92B4
	ldr r2, _080E92B8
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _080E92BC
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080E92C0
	bl LZ77UnCompVram
	ldr r0, _080E92C4
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080E92C8
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080E92CC
	ldr r2, _080E92D0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E92D4
	movs r0, 0
	mov r9, r0
	str r0, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r4]
	str r1, [r4, 0x4]
	lsrs r5, 2
	movs r0, 0x85
	lsls r0, 24
	orrs r5, r0
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080E92D8
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080E92DC
	adds r1, r0, 0
	adds r1, 0x7E
	ldr r3, _080E92E0
	strh r3, [r1]
	subs r1, 0x1C
	ldr r2, _080E92E4
	strh r2, [r1]
	adds r0, 0x70
	ldr r1, _080E92E8
	strh r1, [r0]
	ldr r0, _080E92EC
	adds r4, r0, 0
	adds r4, 0x7E
	strh r3, [r4]
	adds r3, r0, 0
	adds r3, 0x62
	strh r2, [r3]
	adds r0, 0x70
	strh r1, [r0]
	movs r1, 0xBC
	add r8, r1
	mov r2, r8
	strb r6, [r2]
	bl sub_80E8FA4
	bl sub_80E948C
	movs r0, 0xA
	bl sub_80E9198
	movs r0, 0
	bl sub_80E91D4
	bl sub_80E95A4
	ldr r0, _080E92F0
	mov r1, r9
	strh r1, [r0]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E927C: .4byte 0x04000010
_080E9280: .4byte 0x04000008
_080E9284: .4byte 0x00000d09
_080E9288: .4byte gUnknown_08E945D0
_080E928C: .4byte gUnknown_083DB694
_080E9290: .4byte gUnknown_08E953D0
_080E9294: .4byte gMenuWordGroupFrame_Gfx
_080E9298: .4byte 0x06008000
_080E929C: .4byte 0x06006800
_080E92A0: .4byte gMenuWordGroupFrame1_Pal
_080E92A4: .4byte 0x0400000c
_080E92A8: .4byte 0x00000e02
_080E92AC: .4byte 0x06007000
_080E92B0: .4byte 0x040000d4
_080E92B4: .4byte gUnknown_08E9AB00
_080E92B8: .4byte 0x06006000
_080E92BC: .4byte 0x80000020
_080E92C0: .4byte gUnknown_08E9AB60
_080E92C4: .4byte gUnknown_08E9AB40
_080E92C8: .4byte gUnknown_083DBDFC
_080E92CC: .4byte 0x0400000e
_080E92D0: .4byte 0x00000f0f
_080E92D4: .4byte 0x06007800
_080E92D8: .4byte gUnknown_083DBE40
_080E92DC: .4byte gPlttBufferUnfaded
_080E92E0: .4byte 0x00007fff
_080E92E4: .4byte 0x00006f5b
_080E92E8: .4byte 0x0000739c
_080E92EC: .4byte gPlttBufferFaded
_080E92F0: .4byte 0x04000050
	thumb_func_end sub_80E8DD8

	thumb_func_start sub_80E8FA4
sub_80E8FA4: @ 80E92F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	movs r0, 0
	mov r9, r0
	mov r1, sp
	adds r1, 0x18
	str r1, [sp, 0x24]
	add r2, sp, 0xC
	mov r12, r2
_080E930E:
	mov r3, r9
	lsls r1, r3, 1
	ldr r4, _080E9444
	adds r0, r1, r4
	ldrh r2, [r0]
	movs r0, 0x1F
	ands r0, r2
	lsls r0, 8
	str r0, [sp]
	ldr r5, _080E9448
	adds r1, r5
	ldrh r1, [r1]
	movs r0, 0x1F
	ands r0, r1
	lsls r0, 8
	str r0, [sp, 0xC]
	lsls r2, 16
	lsrs r0, r2, 21
	movs r3, 0x1F
	ands r0, r3
	lsls r0, 8
	str r0, [sp, 0x4]
	lsls r1, 16
	lsrs r0, r1, 21
	ands r0, r3
	lsls r0, 8
	mov r4, r12
	str r0, [r4, 0x4]
	lsrs r2, 26
	ands r2, r3
	lsls r2, 8
	str r2, [sp, 0x8]
	lsrs r1, 26
	ands r1, r3
	lsls r1, 8
	str r1, [r4, 0x8]
	movs r3, 0
	mov r5, r9
	lsls r5, 3
	mov r10, r5
	mov r0, r9
	adds r0, 0x1
	str r0, [sp, 0x28]
	ldr r4, [sp, 0x24]
_080E9366:
	lsls r0, r3, 2
	adds r2, r4, r0
	mov r5, r12
	adds r1, r5, r0
	add r0, sp
	ldr r1, [r1]
	ldr r0, [r0]
	subs r0, r1, r0
	cmp r0, 0
	bge _080E937C
	adds r0, 0x7
_080E937C:
	asrs r0, 3
	str r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _080E9366
	movs r4, 0
	ldr r0, _080E944C
	ldr r1, [r0]
	mov r0, r10
	add r0, r9
	lsls r0, 1
	mov r8, r0
	movs r5, 0x1F
	ldr r6, [sp, 0x24]
	ldr r0, _080E9450
	adds r7, r1, r0
_080E93A0:
	lsls r2, r4, 1
	add r2, r8
	adds r2, r7, r2
	ldr r1, [sp, 0x8]
	asrs r1, 8
	ands r1, r5
	lsls r1, 10
	ldr r0, [sp, 0x4]
	asrs r0, 8
	ands r0, r5
	lsls r0, 5
	orrs r1, r0
	ldr r0, [sp]
	asrs r0, 8
	ands r0, r5
	orrs r1, r0
	strh r1, [r2]
	movs r3, 0
	adds r4, 0x1
_080E93C6:
	lsls r0, r3, 2
	mov r1, sp
	adds r2, r1, r0
	adds r0, r6, r0
	ldr r1, [r2]
	ldr r0, [r0]
	adds r1, r0
	str r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _080E93C6
	lsls r0, r4, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080E93A0
	ldr r2, _080E944C
	ldr r3, [r2]
	mov r0, r10
	add r0, r9
	adds r0, r4
	lsls r0, 1
	ldr r4, _080E9450
	adds r2, r3, r4
	adds r2, r0
	mov r5, r12
	ldr r1, [r5, 0x8]
	asrs r1, 8
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 10
	ldr r0, [r5, 0x4]
	asrs r0, 8
	movs r4, 0x1F
	ands r0, r4
	lsls r0, 5
	orrs r1, r0
	ldr r0, [sp, 0xC]
	asrs r0, 8
	ands r0, r4
	orrs r1, r0
	strh r1, [r2]
	ldr r5, [sp, 0x28]
	lsls r0, r5, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x2
	bhi _080E942A
	b _080E930E
_080E942A:
	ldr r0, _080E9454
	adds r1, r3, r0
	movs r0, 0
	strb r0, [r1]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9444: .4byte 0x08e8f136
_080E9448: .4byte 0x08e8f13c
_080E944C: .4byte gUnknown_083DB694
_080E9450: .4byte 0x00009f60
_080E9454: .4byte 0x00009f5e
	thumb_func_end sub_80E8FA4

	thumb_func_start sub_80E9108
sub_80E9108: @ 80E9458
	push {r4-r7,lr}
	lsls r0, 24
	ldr r1, _080E94B4
	ldr r2, [r1]
	ldr r3, _080E94B8
	adds r1, r2, r3
	lsrs r0, 24
	ldrb r3, [r1]
	adds r0, r3
	strb r0, [r1]
	movs r4, 0
	ldr r0, _080E94BC
	mov r12, r0
	adds r6, r1, 0
	ldr r3, _080E94C0
	adds r5, r2, r3
	ldr r7, _080E94C4
_080E947A:
	adds r2, r4, 0
	adds r2, 0x51
	lsls r2, 1
	mov r0, r12
	adds r3, r2, r0
	ldrb r0, [r6]
	lsls r0, 1
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 1
	adds r0, r1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r3]
	adds r2, r7
	ldrb r0, [r6]
	lsls r0, 1
	adds r0, r1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _080E947A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E94B4: .4byte gUnknown_083DB694
_080E94B8: .4byte 0x00009f5e
_080E94BC: .4byte gPlttBufferUnfaded
_080E94C0: .4byte 0x00009f60
_080E94C4: .4byte gPlttBufferFaded
	thumb_func_end sub_80E9108

	thumb_func_start sub_80E9178
sub_80E9178: @ 80E94C8
	push {lr}
	ldr r0, _080E94E0
	ldr r0, [r0]
	ldr r1, _080E94E4
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0
	bl sub_80E9108
	pop {r0}
	bx r0
	.align 2, 0
_080E94E0: .4byte gUnknown_083DB694
_080E94E4: .4byte 0x00009f5e
	thumb_func_end sub_80E9178

	thumb_func_start sub_80E9198
sub_80E9198: @ 80E94E8
	ldr r1, _080E94F0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080E94F0: .4byte gUnknown_03000740
	thumb_func_end sub_80E9198

	thumb_func_start sub_80E91A4
sub_80E91A4: @ 80E94F4
	ldr r0, _080E94FC
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080E94FC: .4byte gUnknown_03000740
	thumb_func_end sub_80E91A4

	thumb_func_start sub_80E91B0
sub_80E91B0: @ 80E9500
	push {lr}
	sub sp, 0x8
	lsls r2, 24
	lsls r1, 27
	lsrs r1, 24
	lsrs r2, 21
	lsls r3, 27
	lsrs r3, 24
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	movs r3, 0xB0
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_80E91B0

	thumb_func_start sub_80E91D4
sub_80E91D4: @ 80E9524
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080E954C
	bl BasicInitMenuWindow
	cmp r4, 0xA
	bne _080E9550
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0xA
	bl sub_80E9198
	b _080E96AC
	.align 2, 0
_080E954C: .4byte gWindowConfig_81E6DA8
_080E9550:
	bl sub_80E91A4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bne _080E9568
	movs r0, 0x3
	movs r1, 0xE
	movs r2, 0x1A
	movs r3, 0x13
	bl MenuDrawTextWindow
_080E9568:
	adds r0, r4, 0
	bl sub_80E9198
	cmp r4, 0x9
	bls _080E9574
	b _080E96AC
_080E9574:
	lsls r0, r4, 2
	ldr r1, _080E9580
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9580: .4byte _080E9584
	.align 2, 0
_080E9584:
	.4byte _080E95AC
	.4byte _080E95D4
	.4byte _080E95FC
	.4byte _080E9614
	.4byte _080E9640
	.4byte _080E9658
	.4byte _080E9660
	.4byte _080E9668
	.4byte _080E968C
	.4byte _080E96A0
_080E95AC:
	ldr r0, _080E95C8
	ldr r4, [r0]
	ldr r1, _080E95CC
	adds r0, r4, r1
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E95D0
	adds r4, r0
	adds r0, r4, 0
	b _080E9676
	.align 2, 0
_080E95C8: .4byte gUnknown_083DB694
_080E95CC: .4byte 0x00009fac
_080E95D0: .4byte 0x00009ff5
_080E95D4:
	ldr r0, _080E95F0
	ldr r4, [r0]
	ldr r1, _080E95F4
	adds r0, r4, r1
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E95F8
	adds r4, r0
	adds r0, r4, 0
	b _080E9676
	.align 2, 0
_080E95F0: .4byte gUnknown_083DB694
_080E95F4: .4byte 0x0000a03e
_080E95F8: .4byte 0x0000a087
_080E95FC:
	ldr r0, _080E960C
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E9610
	b _080E9676
	.align 2, 0
_080E960C: .4byte gOtherText_TextDeletedConfirmPage1
_080E9610: .4byte gOtherText_TextDeletedConfirmPage2
_080E9614:
	ldr r0, _080E9628
	ldr r0, [r0]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x4
	beq _080E9630
	cmp r0, 0x9
	bne _080E9638
	ldr r0, _080E962C
	b _080E968E
	.align 2, 0
_080E9628: .4byte gUnknown_083DB694
_080E962C: .4byte gOtherText_QuitGivingInfo
_080E9630:
	ldr r0, _080E9634
	b _080E968E
	.align 2, 0
_080E9634: .4byte gOtherText_StopGivingMail
_080E9638:
	ldr r0, _080E963C
	b _080E968E
	.align 2, 0
_080E963C: .4byte gOtherText_QuitEditing
_080E9640:
	ldr r0, _080E9650
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E9654
	b _080E9676
	.align 2, 0
_080E9650: .4byte gOtherText_EditedTextNoSavePage1
_080E9654: .4byte gOtherText_EditedTextNoSavePage2
_080E9658:
	ldr r0, _080E965C
	b _080E968E
	.align 2, 0
_080E965C: .4byte gOtherText_EnterAPhraseOrWord
_080E9660:
	ldr r0, _080E9664
	b _080E968E
	.align 2, 0
_080E9664: .4byte gOtherText_TextNoDelete
_080E9668:
	ldr r0, _080E9684
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x2
	bl sub_80E91B0
	ldr r0, _080E9688
_080E9676:
	movs r1, 0x4
	movs r2, 0x11
	movs r3, 0x2
	bl sub_80E91B0
	b _080E96AC
	.align 2, 0
_080E9684: .4byte gOtherText_OnlyOnePhrase
_080E9688: .4byte gOtherText_OriginalSongRestored
_080E968C:
	ldr r0, _080E969C
_080E968E:
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x4
	bl sub_80E91B0
	b _080E96AC
	.align 2, 0
_080E969C: .4byte gOtherText_TrendyAlready
_080E96A0:
	ldr r0, _080E96B4
	movs r1, 0x4
	movs r2, 0xF
	movs r3, 0x4
	bl sub_80E91B0
_080E96AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E96B4: .4byte gOtherText_CombineTwoPhrases
	thumb_func_end sub_80E91D4

	thumb_func_start sub_80E9368
sub_80E9368: @ 80E96B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _080E9748
	lsls r0, 2
	ldr r1, _080E96CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E96CC: .4byte _080E96D0
	.align 2, 0
_080E96D0:
	.4byte _080E9708
	.4byte _080E9710
	.4byte _080E9718
	.4byte _080E9720
	.4byte _080E9748
	.4byte _080E9738
	.4byte _080E9728
	.4byte _080E9738
	.4byte _080E9738
	.4byte _080E9730
	.4byte _080E9738
	.4byte _080E9738
	.4byte _080E9738
	.4byte _080E9740
_080E9708:
	ldr r4, _080E970C
	b _080E974A
	.align 2, 0
_080E970C: .4byte gOtherText_Profile
_080E9710:
	ldr r4, _080E9714
	b _080E974A
	.align 2, 0
_080E9714: .4byte gOtherText_AtBattleStart
_080E9718:
	ldr r4, _080E971C
	b _080E974A
	.align 2, 0
_080E971C: .4byte gOtherText_UponWinningBattle
_080E9720:
	ldr r4, _080E9724
	b _080E974A
	.align 2, 0
_080E9724: .4byte gOtherText_UponLosingBattle
_080E9728:
	ldr r4, _080E972C
	b _080E974A
	.align 2, 0
_080E972C: .4byte gOtherText_TheBardsSong
_080E9730:
	ldr r4, _080E9734
	b _080E974A
	.align 2, 0
_080E9734: .4byte gOtherText_WhatsHipHappening
_080E9738:
	ldr r4, _080E973C
	b _080E974A
	.align 2, 0
_080E973C: .4byte gOtherText_Interview
_080E9740:
	ldr r4, _080E9744
	b _080E974A
	.align 2, 0
_080E9744: .4byte gOtherText_GoodSaying
_080E9748:
	movs r4, 0
_080E974A:
	ldr r0, _080E978C
	bl BasicInitMenuWindow
	ldr r0, _080E9790
	ldr r2, [r0]
	ldr r0, _080E9794
	adds r5, r2, r0
	movs r3, 0xFC
	strb r3, [r5]
	adds r0, 0x1
	adds r1, r2, r0
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, _080E9798
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	cmp r4, 0
	beq _080E97A0
	ldr r1, _080E979C
	adds r0, r2, r1
	adds r1, r4, 0
	movs r2, 0xF0
	movs r3, 0x2
	bl sub_8072C74
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	b _080E97C6
	.align 2, 0
_080E978C: .4byte gWindowConfig_81E6D8C
_080E9790: .4byte gUnknown_083DB694
_080E9794: .4byte 0x0000a2ba
_080E9798: .4byte 0x0000a2bc
_080E979C: .4byte 0x0000a2bd
_080E97A0:
	ldr r0, _080E97D4
	adds r1, r2, r0
	strb r3, [r1]
	movs r0, 0x11
	strb r0, [r1, 0x1]
	movs r0, 0x10
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x1C
	movs r2, 0
	bl MenuPrint
_080E97C6:
	ldr r0, _080E97D8
	bl BasicInitMenuWindow
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E97D4: .4byte 0x0000a2bd
_080E97D8: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E9368

	thumb_func_start sub_80E948C
sub_80E948C: @ 80E97DC
	push {lr}
	sub sp, 0x10
	ldr r0, _080E97F8
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bls _080E97EC
	b _080E98E4
_080E97EC:
	lsls r0, 2
	ldr r1, _080E97FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E97F8: .4byte gUnknown_083DB694
_080E97FC: .4byte _080E9800
	.align 2, 0
_080E9800:
	.4byte _080E9858
	.4byte _080E9880
	.4byte _080E98A4
	.4byte _080E98C8
	.4byte _080E9818
	.4byte _080E9838
_080E9818:
	ldr r0, _080E9830
	ldr r3, _080E9834
	movs r1, 0
	str r1, [sp]
	movs r1, 0x1A
	str r1, [sp, 0x4]
	movs r1, 0x18
	str r1, [sp, 0x8]
	movs r1, 0x6
	str r1, [sp, 0xC]
	movs r1, 0x3
	b _080E98B8
	.align 2, 0
_080E9830: .4byte 0x06006800
_080E9834: .4byte gUnknown_08E94AD0
_080E9838:
	ldr r0, _080E9850
	ldr r3, _080E9854
	movs r1, 0
	str r1, [sp]
	movs r1, 0x12
	str r1, [sp, 0x4]
	movs r1, 0xD
	str r1, [sp, 0x8]
	movs r1, 0x8
	str r1, [sp, 0xC]
	movs r1, 0xE
	b _080E986E
	.align 2, 0
_080E9850: .4byte 0x06006800
_080E9854: .4byte gUnknown_08E94AD0
_080E9858:
	ldr r0, _080E9878
	ldr r3, _080E987C
	movs r1, 0
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0x1A
	str r1, [sp, 0x8]
	movs r1, 0x8
	str r1, [sp, 0xC]
	movs r1, 0x2
_080E986E:
	movs r2, 0x2
	bl sub_809D104
	b _080E98E4
	.align 2, 0
_080E9878: .4byte 0x06006800
_080E987C: .4byte gUnknown_08E94AD0
_080E9880:
	ldr r0, _080E989C
	ldr r3, _080E98A0
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x1A
	str r1, [sp, 0x8]
	movs r1, 0xA
	str r1, [sp, 0xC]
	movs r1, 0x2
	movs r2, 0
	bl sub_809D104
	b _080E98E4
	.align 2, 0
_080E989C: .4byte 0x06006800
_080E98A0: .4byte gUnknown_08E94AD0
_080E98A4:
	ldr r0, _080E98C0
	ldr r3, _080E98C4
	movs r2, 0xD
	str r2, [sp]
	movs r1, 0x12
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	movs r1, 0xE
_080E98B8:
	movs r2, 0x3
	bl sub_809D104
	b _080E98E4
	.align 2, 0
_080E98C0: .4byte 0x06006800
_080E98C4: .4byte gUnknown_08E94AD0
_080E98C8:
	ldr r0, _080E98EC
	ldr r3, _080E98F0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x20
	str r1, [sp, 0x4]
	movs r1, 0x18
	str r1, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	movs r1, 0x3
	movs r2, 0x2
	bl sub_809D104
_080E98E4:
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080E98EC: .4byte 0x06006800
_080E98F0: .4byte gUnknown_08E94AD0
	thumb_func_end sub_80E948C

	thumb_func_start sub_80E95A4
sub_80E95A4: @ 80E98F4
	push {lr}
	ldr r0, _080E9910
	bl BasicInitMenuWindow
	ldr r0, _080E9914
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bhi _080E9962
	lsls r0, 2
	ldr r1, _080E9918
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9910: .4byte gWindowConfig_81E6D8C
_080E9914: .4byte gUnknown_083DB694
_080E9918: .4byte _080E991C
	.align 2, 0
_080E991C:
	.4byte _080E9942
	.4byte _080E9946
	.4byte _080E9950
	.4byte _080E995A
	.4byte _080E9934
	.4byte _080E993E
_080E9934:
	movs r0, 0x4
	movs r1, 0x6
	bl sub_80E9620
	b _080E9962
_080E993E:
	movs r0, 0x2
	b _080E9952
_080E9942:
	movs r0, 0x3
	b _080E9948
_080E9946:
	movs r0, 0
_080E9948:
	movs r1, 0x5
	bl sub_80E9620
	b _080E9962
_080E9950:
	movs r0, 0x4
_080E9952:
	movs r1, 0x11
	bl sub_80E9620
	b _080E9962
_080E995A:
	movs r0, 0x3
	movs r1, 0x6
	bl sub_80E9620
_080E9962:
	ldr r0, _080E996C
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_080E996C: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E95A4

	thumb_func_start sub_80E9620
sub_80E9620: @ 80E9970
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x14]
	movs r1, 0
	mov r10, r1
	lsrs r7, r0, 16
	mov r9, r1
	ldr r0, _080E9994
	ldr r0, [r0]
	b _080E9A6A
	.align 2, 0
_080E9994: .4byte gUnknown_083DB694
_080E9998:
	ldr r6, [sp, 0x14]
	movs r2, 0
	mov r8, r2
	adds r0, r7, 0x2
	str r0, [sp, 0x1C]
	mov r1, r9
	adds r1, 0x1
	str r1, [sp, 0x18]
	b _080E9A34
_080E99AA:
	mov r2, r10
	lsls r0, r2, 1
	adds r1, r5, 0
	adds r1, 0xC
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _080E99E0
	cmp r0, r2
	bne _080E99EC
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r0, _080E99E4
	adds r1, r6, 0
	adds r2, r7, 0
	ldr r3, _080E99E8
	bl sub_8095C8C
	adds r0, r6, 0
	adds r0, 0xB
	b _080E9A1C
	.align 2, 0
_080E99E0: .4byte 0x0000ffff
_080E99E4: .4byte 0x06007000
_080E99E8: .4byte gUnknown_083DBE1C
_080E99EC:
	ldr r0, _080E9A88
	adds r4, r5, r0
	ldrh r1, [r1]
	adds r0, r4, 0
	movs r2, 0xB
	bl sub_80EB218
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl MenuPrint
	mov r1, r9
	lsls r0, r1, 1
	add r0, r8
	adds r1, r5, 0
	adds r1, 0x8C
	adds r1, r0
	adds r0, r6, 0
	adds r0, 0xB
	ldrb r1, [r1]
	adds r0, r1
_080E9A1C:
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_080E9A34:
	ldr r0, _080E9A8C
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0x83
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r8, r0
	bge _080E9A5A
	ldrb r2, [r5, 0xA]
	cmp r10, r2
	bcc _080E99AA
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	ldr r0, _080E9A90
	bl MenuPrint
_080E9A5A:
	ldr r1, [sp, 0x1C]
	lsls r0, r1, 16
	lsrs r7, r0, 16
	ldr r2, [sp, 0x18]
	lsls r0, r2, 16
	lsrs r0, 16
	mov r9, r0
	adds r0, r5, 0
_080E9A6A:
	adds r0, 0x84
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r9, r0
	blt _080E9998
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9A88: .4byte 0x0000a140
_080E9A8C: .4byte gUnknown_083DB694
_080E9A90: .4byte gUnknown_083DBEA8
	thumb_func_end sub_80E9620

	thumb_func_start sub_80E9744
sub_80E9744: @ 80E9A94
	push {lr}
	ldr r0, _080E9AB0
	bl BasicInitMenuWindow
	ldr r0, _080E9AB4
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bhi _080E9B02
	lsls r0, 2
	ldr r1, _080E9AB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9AB0: .4byte gWindowConfig_81E6D8C
_080E9AB4: .4byte gUnknown_083DB694
_080E9AB8: .4byte _080E9ABC
	.align 2, 0
_080E9ABC:
	.4byte _080E9AE2
	.4byte _080E9AE6
	.4byte _080E9AF0
	.4byte _080E9AFA
	.4byte _080E9AD4
	.4byte _080E9ADE
_080E9AD4:
	movs r0, 0x4
	movs r1, 0x6
	bl sub_80E97C0
	b _080E9B02
_080E9ADE:
	movs r0, 0x2
	b _080E9AF2
_080E9AE2:
	movs r0, 0x3
	b _080E9AE8
_080E9AE6:
	movs r0, 0
_080E9AE8:
	movs r1, 0x5
	bl sub_80E97C0
	b _080E9B02
_080E9AF0:
	movs r0, 0x4
_080E9AF2:
	movs r1, 0x11
	bl sub_80E97C0
	b _080E9B02
_080E9AFA:
	movs r0, 0x3
	movs r1, 0x6
	bl sub_80E97C0
_080E9B02:
	ldr r0, _080E9B0C
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_080E9B0C: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E9744

	thumb_func_start sub_80E97C0
sub_80E97C0: @ 80E9B10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r7, 0
	movs r3, 0
	ldr r1, _080E9C08
	ldr r0, [r1]
	adds r0, 0x84
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r3, r0
	bge _080E9BF6
_080E9B3A:
	ldr r1, [r1]
	ldr r0, _080E9C0C
	adds r2, r1, r0
	movs r6, 0
	adds r0, r1, 0
	adds r0, 0x83
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r4, [sp]
	lsls r4, 24
	mov r8, r4
	lsls r4, r5, 24
	mov r9, r4
	adds r5, 0x2
	mov r10, r5
	adds r3, 0x1
	str r3, [sp, 0x4]
	cmp r6, r0
	bge _080E9BAE
	ldrb r1, [r1, 0xA]
	cmp r7, r1
	bcs _080E9BAE
	ldr r0, _080E9C08
	ldr r4, [r0]
	ldr r5, _080E9C10
_080E9B6E:
	lsls r0, r7, 1
	adds r1, r4, 0
	adds r1, 0xC
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r5
	beq _080E9B8E
	adds r1, r0, 0
	adds r0, r2, 0
	movs r2, 0
	bl sub_80EB218
	adds r2, r0, 0
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
_080E9B8E:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r0, 0x83
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r6, r0
	bge _080E9BAE
	ldrb r0, [r4, 0xA]
	cmp r7, r0
	bcc _080E9B6E
_080E9BAE:
	ldr r1, _080E9C08
	ldr r4, [r1]
	adds r0, r4, 0
	adds r0, 0x83
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xB
	muls r1, r0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	lsls r1, 3
	strb r1, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r2, _080E9C0C
	adds r0, r4, r2
	mov r3, r8
	lsrs r1, r3, 24
	mov r3, r9
	lsrs r2, r3, 24
	bl MenuPrint
	mov r1, r10
	lsls r0, r1, 16
	lsrs r5, r0, 16
	ldr r2, [sp, 0x4]
	lsls r0, r2, 24
	lsrs r3, r0, 24
	ldr r1, _080E9C08
	adds r4, 0x84
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r3, r0
	blt _080E9B3A
_080E9BF6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9C08: .4byte gUnknown_083DB694
_080E9C0C: .4byte 0x0000a19a
_080E9C10: .4byte 0x0000ffff
	thumb_func_end sub_80E97C0

	thumb_func_start sub_80E98C4
sub_80E98C4: @ 80E9C14
	push {lr}
	ldr r0, _080E9C30
	bl BasicInitMenuWindow
	ldr r0, _080E9C34
	ldr r0, [r0]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x5
	bhi _080E9C86
	lsls r0, 2
	ldr r1, _080E9C38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9C30: .4byte gWindowConfig_81E6D8C
_080E9C34: .4byte gUnknown_083DB694
_080E9C38: .4byte _080E9C3C
	.align 2, 0
_080E9C3C:
	.4byte _080E9C5A
	.4byte _080E9C60
	.4byte _080E9C66
	.4byte _080E9C6A
	.4byte _080E9C54
	.4byte _080E9C5A
_080E9C54:
	movs r1, 0x4
	movs r3, 0x2
	b _080E9C6E
_080E9C5A:
	movs r1, 0x3
	movs r3, 0x2
	b _080E9C6E
_080E9C60:
	movs r1, 0x1
	movs r3, 0x3
	b _080E9C6E
_080E9C66:
	movs r1, 0x4
	b _080E9C6C
_080E9C6A:
	movs r1, 0x3
_080E9C6C:
	movs r3, 0x1
_080E9C6E:
	lsls r3, 1
	adds r3, r1, r3
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x2
	movs r2, 0x1B
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080E9C8C
	bl BasicInitMenuWindow
_080E9C86:
	pop {r0}
	bx r0
	.align 2, 0
_080E9C8C: .4byte gWindowConfig_81E6DA8
	thumb_func_end sub_80E98C4

	thumb_func_start sub_80E9940
sub_80E9940: @ 80E9C90
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	movs r4, 0x7
	ands r4, r5
	lsls r3, r4, 1
	adds r1, r3, 0
	adds r3, 0x1
	movs r0, 0x2
	movs r2, 0x1F
	bl MenuFillWindowRectWithBlankTile
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_80E9A7C
	lsls r4, 1
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_80E9A60
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E9940

	thumb_func_start sub_80E9974
sub_80E9974: @ 80E9CC4
	push {r4-r6,lr}
	ldr r0, _080E9D14
	bl BasicInitMenuWindow
	ldr r0, _080E9D18
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E9D24
	ldr r1, _080E9D1C
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r1, r0, 16
	lsrs r4, r1, 16
	adds r0, 0x4
	cmp r4, r0
	bge _080E9D52
	adds r5, r2, 0
	ldr r2, _080E9D1C
	adds r6, r5, r2
_080E9CF4:
	lsls r1, r4, 24
	lsrs r1, 24
	ldr r2, _080E9D20
	adds r0, r5, r2
	bl sub_80E9940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	ldrsb r0, [r6, r0]
	adds r0, 0x4
	cmp r4, r0
	blt _080E9CF4
	b _080E9D52
	.align 2, 0
_080E9D14: .4byte gWindowConfig_81E6D54
_080E9D18: .4byte gUnknown_083DB694
_080E9D1C: .4byte 0x000001b5
_080E9D20: .4byte 0x0000a0f5
_080E9D24:
	bl sub_80E9AD4
	ldr r4, _080E9D58
	ldr r0, [r4]
	movs r1, 0x2
	movs r2, 0
	bl sub_80E9A60
	ldr r0, [r4, 0x4]
	movs r1, 0x2
	movs r2, 0x2
	bl sub_80E9A60
	ldr r0, [r4, 0x8]
	movs r1, 0x2
	movs r2, 0x4
	bl sub_80E9A60
	ldr r0, [r4, 0xC]
	movs r1, 0x2
	movs r2, 0x6
	bl sub_80E9A60
_080E9D52:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9D58: .4byte gUnknown_083DBEAC
	thumb_func_end sub_80E9974

	thumb_func_start sub_80E9A14
sub_80E9A14: @ 80E9D5C
	push {lr}
	bl sub_80E9A4C
	ldr r0, _080E9D8C
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x26
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E9D88
	movs r0, 0xDD
	lsls r0, 1
	adds r2, r1, r0
	ldr r3, _080E9D90
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 4
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
_080E9D88:
	pop {r0}
	bx r0
	.align 2, 0
_080E9D8C: .4byte gUnknown_083DB694
_080E9D90: .4byte 0x000001b5
	thumb_func_end sub_80E9A14

	thumb_func_start sub_80E9A4C
sub_80E9A4C: @ 80E9D94
	ldr r0, _080E9DA4
	ldr r0, [r0]
	movs r2, 0xDD
	lsls r2, 1
	adds r1, r0, r2
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080E9DA4: .4byte gUnknown_083DB694
	thumb_func_end sub_80E9A4C

	thumb_func_start sub_80E9A60
sub_80E9A60: @ 80E9DA8
	push {lr}
	lsls r2, 16
	movs r3, 0xF0
	lsls r3, 12
	ands r3, r2
	lsls r1, 24
	lsrs r1, 24
	lsrs r3, 16
	adds r2, r3, 0
	bl MenuPrint
	pop {r0}
	bx r0
	thumb_func_end sub_80E9A60

	thumb_func_start sub_80E9A7C
sub_80E9A7C: @ 80E9DC4
	push {r4-r7,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r0, r7, 17
	lsrs r5, r0, 16
	movs r4, 0
	ldr r0, _080E9E18
	ldr r6, [r0]
_080E9DD6:
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x12
	strb r0, [r2, 0x1]
	movs r0, 0x58
	muls r0, r4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	lsls r1, r7, 1
	adds r1, r4, r1
	adds r0, r6, 0
	adds r0, 0x2A
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0xB
	bl sub_80EAD64
	adds r2, r0, 0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r6, 0x28]
	cmp r5, r0
	bcs _080E9E12
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080E9DD6
_080E9E12:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9E18: .4byte gUnknown_083DB694
	thumb_func_end sub_80E9A7C

	thumb_func_start sub_80E9AD4
sub_80E9AD4: @ 80E9E1C
	push {r4,lr}
	ldr r0, _080E9E3C
	bl BasicInitMenuWindow
	movs r4, 0
_080E9E26:
	adds r0, r4, 0
	bl sub_80E9C74
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080E9E26
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9E3C: .4byte gWindowConfig_81E6D54
	thumb_func_end sub_80E9AD4

	thumb_func_start sub_80E9AF8
sub_80E9AF8: @ 80E9E40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r7, 0
	bl sub_80E9C74
	ldr r4, _080E9EC4
	ldr r5, [r4]
	ldr r0, _080E9EC8
	adds r0, r5
	mov r8, r0
	movs r0, 0xFC
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x11
	strb r0, [r1, 0x1]
	movs r0, 0x10
	strb r0, [r1, 0x2]
	ldr r2, _080E9ECC
	adds r2, r5
	mov r8, r2
	adds r0, r5, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E9F3C
	movs r6, 0
	ldr r3, _080E9ED0
	adds r0, r5, r3
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r6, r0
	blt _080E9E92
	b _080E9F9A
_080E9E92:
	lsls r0, r7, 2
	mov r9, r0
	ldr r1, _080E9ED4
	adds r1, r5, r1
	str r1, [sp]
	lsls r2, r7, 17
	mov r10, r2
_080E9EA0:
	lsls r4, r6, 1
	mov r3, r9
	adds r0, r4, r3
	ldr r1, [sp]
	adds r0, r1, r0
	ldrh r0, [r0]
	bl sub_80EB2D4
	lsls r0, 16
	lsrs r0, 16
	adds r5, r4, 0
	cmp r0, 0x7
	bne _080E9EDC
	ldr r0, _080E9ED8
	bl BasicInitMenuWindow
	b _080E9EE2
	.align 2, 0
_080E9EC4: .4byte gUnknown_083DB694
_080E9EC8: .4byte 0x0000a140
_080E9ECC: .4byte 0x0000a143
_080E9ED0: .4byte 0x00009cd2
_080E9ED4: .4byte 0x00009d56
_080E9ED8: .4byte gWindowConfig_81E6D70
_080E9EDC:
	ldr r0, _080E9F28
	bl BasicInitMenuWindow
_080E9EE2:
	ldr r2, _080E9F2C
	ldr r4, [r2]
	mov r3, r9
	adds r1, r5, r3
	ldr r2, _080E9F30
	adds r0, r4, r2
	adds r0, r1
	ldrh r1, [r0]
	mov r0, r8
	movs r2, 0x9
	bl sub_80EB218
	ldr r3, _080E9F34
	adds r0, r4, r3
	movs r1, 0xB
	muls r1, r6
	adds r1, 0x4
	lsls r1, 16
	lsrs r1, 16
	mov r3, r10
	lsrs r2, r3, 16
	bl sub_80E9A60
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080E9F38
	adds r4, r0
	adds r4, r7
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r6, r0
	blt _080E9EA0
	b _080E9F9A
	.align 2, 0
_080E9F28: .4byte gWindowConfig_81E6D54
_080E9F2C: .4byte gUnknown_083DB694
_080E9F30: .4byte 0x00009d56
_080E9F34: .4byte 0x0000a140
_080E9F38: .4byte 0x00009cd2
_080E9F3C:
	ldr r0, _080E9FAC
	bl BasicInitMenuWindow
	movs r6, 0
	ldr r1, _080E9FB0
	adds r0, r5, r1
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r6, r0
	bge _080E9F9A
	adds r4, r5, 0
	adds r0, r4, r1
	adds r0, r7
	mov r9, r0
	lsls r5, r7, 17
_080E9F5E:
	lsls r1, r6, 1
	lsls r0, r7, 2
	adds r1, r0
	ldr r2, _080E9FB4
	adds r0, r4, r2
	adds r0, r1
	ldrh r1, [r0]
	mov r0, r8
	movs r2, 0x9
	bl sub_80EB218
	movs r0, 0xB
	adds r1, r6, 0
	muls r1, r0
	adds r1, 0x4
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _080E9FB8
	adds r0, r4, r3
	lsrs r2, r5, 16
	bl sub_80E9A60
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r9
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r6, r0
	blt _080E9F5E
_080E9F9A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9FAC: .4byte gWindowConfig_81E6D54
_080E9FB0: .4byte 0x00009cd2
_080E9FB4: .4byte 0x00009d56
_080E9FB8: .4byte 0x0000a140
	thumb_func_end sub_80E9AF8

	thumb_func_start sub_80E9C74
sub_80E9C74: @ 80E9FBC
	push {lr}
	lsls r0, 16
	movs r1, 0xE0
	lsls r1, 11
	ands r1, r0
	lsrs r1, 16
	lsls r3, r1, 1
	adds r1, r3, 0
	adds r3, 0x1
	movs r0, 0
	movs r2, 0x1D
	bl MenuFillWindowRectWithBlankTile
	pop {r0}
	bx r0
	thumb_func_end sub_80E9C74

	thumb_func_start sub_80E9C94
sub_80E9C94: @ 80E9FDC
	push {r4-r6,lr}
	ldr r0, _080E9FF4
	ldr r0, [r0]
	ldr r2, _080E9FF8
	adds r1, r0, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x3
	bgt _080E9FFC
	lsls r0, 16
	lsrs r0, 16
	b _080E9FFE
	.align 2, 0
_080E9FF4: .4byte gUnknown_083DB694
_080E9FF8: .4byte 0x00009d54
_080E9FFC:
	movs r0, 0x4
_080E9FFE:
	adds r5, r0, 0
	movs r4, 0
	cmp r4, r5
	bcs _080EA03C
	ldr r0, _080EA028
	ldr r0, [r0]
	ldr r1, _080EA02C
	adds r6, r0, r1
_080EA00E:
	movs r0, 0
	ldrsb r0, [r6, r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r0, 16
	bl sub_80E9AF8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080EA00E
	b _080EA03C
	.align 2, 0
_080EA028: .4byte gUnknown_083DB694
_080EA02C: .4byte 0x00009d55
_080EA030:
	adds r0, r4, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_80E9C74
_080EA03C:
	cmp r4, 0x3
	bls _080EA030
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E9C94

	thumb_func_start sub_80E9D00
sub_80E9D00: @ 80EA048
	push {r4-r6,lr}
	ldr r0, _080EA070
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	ble _080EA078
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080EA074
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x4
	b _080EA08E
	.align 2, 0
_080EA070: .4byte gUnknown_083DB694
_080EA074: .4byte 0x00009d55
_080EA078:
	movs r0, 0
	ldrsb r0, [r1, r0]
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080EA0BC
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, r4
_080EA08E:
	lsls r0, 16
	lsrs r5, r0, 16
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080EA0C0
	cmp r4, r0
	beq _080EA0B6
	adds r6, r0, 0
_080EA0A0:
	adds r0, r5, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r5, r1, 16
	bl sub_80E9AF8
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r6
	bne _080EA0A0
_080EA0B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA0BC: .4byte 0x00009d55
_080EA0C0: .4byte 0x0000ffff
	thumb_func_end sub_80E9D00

	thumb_func_start sub_80E9D7C
sub_80E9D7C: @ 80EA0C4
	push {r4-r7,lr}
	ldr r0, _080EA0F4
	bl BasicInitMenuWindow
	ldr r0, _080EA0F8
	ldr r2, [r0]
	movs r0, 0xE0
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bge _080EA100
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080EA0FC
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r0, r6
	b _080EA114
	.align 2, 0
_080EA0F4: .4byte gWindowConfig_81E6D54
_080EA0F8: .4byte gUnknown_083DB694
_080EA0FC: .4byte 0x000001b5
_080EA100:
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080EA144
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x4
_080EA114:
	lsls r0, 16
	lsrs r4, r0, 16
	movs r5, 0
	cmp r5, r6
	bcs _080EA13E
	ldr r0, _080EA148
	ldr r7, [r0]
_080EA122:
	lsls r1, r4, 24
	lsrs r1, 24
	ldr r2, _080EA14C
	adds r0, r7, r2
	bl sub_80E9940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r6
	bcc _080EA122
_080EA13E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA144: .4byte 0x000001b5
_080EA148: .4byte gUnknown_083DB694
_080EA14C: .4byte 0x0000a0f5
	thumb_func_end sub_80E9D7C

	thumb_func_start sub_80E9E08
sub_80E9E08: @ 80EA150
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EA194
	ldr r3, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r1, r3, r0
	movs r5, 0xE0
	lsls r5, 1
	adds r2, r3, r5
	movs r0, 0
	ldrsb r0, [r2, r0]
	lsls r0, 4
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0x7F
	ands r0, r1
	subs r5, 0x4
	adds r1, r3, r5
	strh r0, [r1]
	adds r1, r4, 0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bge _080EA186
	negs r1, r4
_080EA186:
	ldr r2, _080EA198
	adds r0, r3, r2
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EA194: .4byte gUnknown_083DB694
_080EA198: .4byte 0x000001bf
	thumb_func_end sub_80E9E08

	thumb_func_start sub_80E9E54
sub_80E9E54: @ 80EA19C
	push {r4,lr}
	ldr r0, _080EA1D4
	ldr r2, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r3, r2, r0
	ldr r1, _080EA1D8
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r4, [r3]
	adds r0, r4
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r3]
	movs r3, 0
	movs r4, 0xDE
	lsls r4, 1
	adds r1, r2, r4
	ldrh r1, [r1]
	cmp r0, r1
	bne _080EA1CC
	movs r3, 0x1
_080EA1CC:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EA1D4: .4byte gUnknown_083DB694
_080EA1D8: .4byte 0x000001bf
	thumb_func_end sub_80E9E54

	thumb_func_start nullsub_23
nullsub_23: @ 80EA1DC
	bx lr
	thumb_func_end nullsub_23

	thumb_func_start sub_80E9E98
sub_80E9E98: @ 80EA1E0
	ldr r0, _080EA1EC
	ldr r0, [r0]
	adds r0, 0xBE
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080EA1EC: .4byte gUnknown_083DB694
	thumb_func_end sub_80E9E98

	thumb_func_start sub_80E9EA8
sub_80E9EA8: @ 80EA1F0
	push {lr}
	ldr r1, _080EA20C
	ldr r0, [r1]
	adds r0, 0xBE
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x5
	bhi _080EA290
	lsls r0, 2
	ldr r1, _080EA210
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA20C: .4byte gUnknown_083DB694
_080EA210: .4byte _080EA214
	.align 2, 0
_080EA214:
	.4byte _080EA22C
	.4byte _080EA23C
	.4byte _080EA254
	.4byte _080EA26C
	.4byte _080EA280
	.4byte _080EA28C
_080EA22C:
	bl sub_80EA24C
	ldr r0, _080EA250
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EA23C:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA290
	bl sub_80EA4A4
	ldr r0, _080EA250
	ldr r1, [r0]
	b _080EA282
	.align 2, 0
_080EA250: .4byte gUnknown_083DB694
_080EA254:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA290
	bl sub_80EA704
	ldr r0, _080EA268
	ldr r1, [r0]
	b _080EA282
	.align 2, 0
_080EA268: .4byte gUnknown_083DB694
_080EA26C:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA290
	ldr r0, _080EA27C
	ldr r1, [r0]
	b _080EA282
	.align 2, 0
_080EA27C: .4byte gUnknown_083DB694
_080EA280:
	ldr r1, [r2]
_080EA282:
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA290
_080EA28C:
	movs r0, 0x1
	b _080EA292
_080EA290:
	movs r0, 0
_080EA292:
	pop {r1}
	bx r1
	thumb_func_end sub_80E9EA8

	thumb_func_start sub_80E9F50
sub_80E9F50: @ 80EA298
	push {lr}
	ldr r0, _080EA2B0
	ldr r0, [r0]
	adds r0, 0xBE
	ldrh r0, [r0]
	cmp r0, 0x6
	bhi _080EA314
	lsls r0, 2
	ldr r1, _080EA2B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA2B0: .4byte gUnknown_083DB694
_080EA2B4: .4byte _080EA2B8
	.align 2, 0
_080EA2B8:
	.4byte _080EA2D4
	.4byte _080EA2F4
	.4byte _080EA2DE
	.4byte _080EA2F4
	.4byte _080EA2E4
	.4byte _080EA2F4
	.4byte _080EA310
_080EA2D4:
	bl nullsub_23
	bl sub_80EA764
	b _080EA2E8
_080EA2DE:
	bl sub_80EA5A0
	b _080EA2E8
_080EA2E4:
	bl sub_80EA348
_080EA2E8:
	ldr r0, _080EA30C
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EA2F4:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA314
	ldr r0, _080EA30C
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA314
	.align 2, 0
_080EA30C: .4byte gUnknown_083DB694
_080EA310:
	movs r0, 0x1
	b _080EA316
_080EA314:
	movs r0, 0
_080EA316:
	pop {r1}
	bx r1
	thumb_func_end sub_80E9F50

	thumb_func_start sub_80E9FD4
sub_80E9FD4: @ 80EA31C
	push {r4,lr}
	ldr r0, _080EA334
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0xBE
	ldrh r0, [r4]
	cmp r0, 0
	beq _080EA338
	cmp r0, 0x1
	beq _080EA346
	b _080EA354
	.align 2, 0
_080EA334: .4byte gUnknown_083DB694
_080EA338:
	bl nullsub_23
	bl sub_80EA5A0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080EA346:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA354
	movs r0, 0x1
	b _080EA356
_080EA354:
	movs r0, 0
_080EA356:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80E9FD4

	thumb_func_start sub_80EA014
sub_80EA014: @ 80EA35C
	push {r4,lr}
	ldr r0, _080EA374
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0xBE
	ldrh r0, [r4]
	cmp r0, 0
	beq _080EA378
	cmp r0, 0x1
	beq _080EA382
	b _080EA390
	.align 2, 0
_080EA374: .4byte gUnknown_083DB694
_080EA378:
	bl sub_80EA4A4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080EA382:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA390
	movs r0, 0x1
	b _080EA392
_080EA390:
	movs r0, 0
_080EA392:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA014

	thumb_func_start sub_80EA050
sub_80EA050: @ 80EA398
	push {lr}
	ldr r0, _080EA3B0
	ldr r0, [r0]
	adds r0, 0xBE
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080EA424
	lsls r0, 2
	ldr r1, _080EA3B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA3B0: .4byte gUnknown_083DB694
_080EA3B4: .4byte _080EA3B8
	.align 2, 0
_080EA3B8:
	.4byte _080EA3CC
	.4byte _080EA3D6
	.4byte _080EA3E6
	.4byte _080EA3FC
	.4byte _080EA420
_080EA3CC:
	bl nullsub_23
	bl sub_80EA764
	b _080EA40C
_080EA3D6:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA424
	bl sub_80EA7F4
	b _080EA40C
_080EA3E6:
	movs r0, 0x1
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA424
	bl sub_80EA8BC
	b _080EA40C
_080EA3FC:
	movs r0, 0x1
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA424
_080EA40C:
	ldr r0, _080EA41C
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA424
	.align 2, 0
_080EA41C: .4byte gUnknown_083DB694
_080EA420:
	movs r0, 0x1
	b _080EA426
_080EA424:
	movs r0, 0
_080EA426:
	pop {r1}
	bx r1
	thumb_func_end sub_80EA050

	thumb_func_start sub_80EA0E4
sub_80EA0E4: @ 80EA42C
	push {lr}
	ldr r0, _080EA444
	ldr r0, [r0]
	adds r0, 0xBE
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080EA4C4
	lsls r0, 2
	ldr r1, _080EA448
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA444: .4byte gUnknown_083DB694
_080EA448: .4byte _080EA44C
	.align 2, 0
_080EA44C:
	.4byte _080EA460
	.4byte _080EA470
	.4byte _080EA48C
	.4byte _080EA4A4
	.4byte _080EA4C0
_080EA460:
	bl sub_80EA948
	ldr r0, _080EA488
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EA470:
	movs r0, 0x1
	negs r0, r0
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA4C4
	bl sub_80EAA44
	b _080EA4AE
	.align 2, 0
_080EA488: .4byte gUnknown_083DB694
_080EA48C:
	movs r0, 0x1
	negs r0, r0
	bl sub_80E9108
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA4C4
	bl sub_80EA704
	b _080EA4AE
_080EA4A4:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA4C4
_080EA4AE:
	ldr r0, _080EA4BC
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA4C4
	.align 2, 0
_080EA4BC: .4byte gUnknown_083DB694
_080EA4C0:
	movs r0, 0x1
	b _080EA4C6
_080EA4C4:
	movs r0, 0
_080EA4C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80EA0E4

	thumb_func_start sub_80EA184
sub_80EA184: @ 80EA4CC
	push {r4,lr}
	ldr r0, _080EA4E8
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0xBE
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080EA4FC
	cmp r0, 0x1
	bgt _080EA4EC
	cmp r0, 0
	beq _080EA4F2
	b _080EA520
	.align 2, 0
_080EA4E8: .4byte gUnknown_083DB694
_080EA4EC:
	cmp r0, 0x2
	beq _080EA518
	b _080EA520
_080EA4F2:
	bl sub_80EAAD4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080EA4FC:
	bl sub_80EA1E0
	lsls r0, 24
	cmp r0, 0
	beq _080EA520
	ldr r0, _080EA514
	ldr r1, [r0]
	adds r1, 0xBE
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EA520
	.align 2, 0
_080EA514: .4byte gUnknown_083DB694
_080EA518:
	bl sub_80E9178
	movs r0, 0x1
	b _080EA522
_080EA520:
	movs r0, 0
_080EA522:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA184

	thumb_func_start sub_80EA1E0
sub_80EA1E0: @ 80EA528
	push {r4-r6,lr}
	ldr r0, _080EA588
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xC4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080EA58C
	movs r4, 0
	adds r0, r1, 0
	adds r0, 0xC2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _080EA570
	adds r5, r1, 0
	adds r6, r0, 0
_080EA548:
	lsls r0, r4, 4
	adds r0, 0xC8
	adds r0, r5, r0
	bl sub_80EAC0C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r5, r0
	bl sub_80EAC48
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r2, [r6]
	cmp r4, r2
	bcc _080EA548
_080EA570:
	ldr r0, _080EA588
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xBC
	movs r0, 0x1
	strb r0, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _080EA58E
	.align 2, 0
_080EA588: .4byte gUnknown_083DB694
_080EA58C:
	movs r0, 0x1
_080EA58E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA1E0

	thumb_func_start sub_80EA24C
sub_80EA24C: @ 80EA594
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA688
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	ldr r1, _080EA68C
	mov r8, r1
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xD
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	mov r9, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0xC
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0
	mov r3, r8
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r6, 0x10
	str r6, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xD
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0x9
	mov r3, r8
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA688: .4byte gUnknown_083DB694
_080EA68C: .4byte 0x0000fffe
	thumb_func_end sub_80EA24C

	thumb_func_start sub_80EA348
sub_80EA348: @ 80EA690
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA7E4
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r5, 0xF
	str r5, [sp]
	movs r1, 0x2
	mov r9, r1
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r6, r7, r1
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r1, _080EA7E8
	mov r8, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0x2
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r5, 0x10
	str r5, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x9
	movs r3, 0x2
	bl sub_80EAC30
	movs r1, 0x84
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0x1
	bl sub_80EABD4
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x50
	adds r6, r7, r1
	str r6, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0xE
	mov r3, r8
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xC2
	movs r1, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA7E4: .4byte gUnknown_083DB694
_080EA7E8: .4byte 0x0000fffe
	thumb_func_end sub_80EA348

	thumb_func_start sub_80EA4A4
sub_80EA4A4: @ 80EA7EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA8E0
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r1, _080EA8E4
	mov r8, r1
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0x10
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r6, 0x1
	str r6, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xC2
	movs r1, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA8E0: .4byte gUnknown_083DB694
_080EA8E4: .4byte 0x0000ffff
	thumb_func_end sub_80EA4A4

	thumb_func_start sub_80EA5A0
sub_80EA5A0: @ 80EA8E8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EAA44
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r1, 0x1
	mov r8, r1
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r2, 0xA
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0x14
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r6, _080EAA48
	str r6, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x84
	lsls r1, 1
	adds r0, r7, r1
	movs r1, 0xA
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	mov r1, r8
	str r1, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x50
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0x14
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x14
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x6
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x4
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAA44: .4byte gUnknown_083DB694
_080EAA48: .4byte 0x0000ffff
	thumb_func_end sub_80EA5A0

	thumb_func_start sub_80EA704
sub_80EA704: @ 80EAA4C
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EAAA4
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r1, 0x14
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r5, 0x1
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xC
	movs r3, 0x19
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	ldr r3, _080EAAA8
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x5
	movs r2, 0xA
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xC2
	strh r5, [r0]
	adds r1, r6, 0
	adds r1, 0xC4
	movs r0, 0x5
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAAA4: .4byte gUnknown_083DB694
_080EAAA8: .4byte 0x0000ffff
	thumb_func_end sub_80EA704

	thumb_func_start sub_80EA764
sub_80EA764: @ 80EAAAC
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _080EAB34
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r5, _080EAB38
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xC
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1E
	movs r2, 0xC
	movs r3, 0x1F
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0xC
	adds r3, r5, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAB34: .4byte gUnknown_083DB694
_080EAB38: .4byte 0x0000ffff
	thumb_func_end sub_80EA764

	thumb_func_start sub_80EA7F4
sub_80EA7F4: @ 80EAB3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r0, _080EABFC
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r5, 0x1
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x14
	movs r2, 0xA
	movs r3, 0x19
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	ldr r3, _080EAC00
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r2, r7
	mov r8, r2
	str r2, [sp, 0x4]
	movs r1, 0x19
	movs r2, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0x4
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x3
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	strh r0, [r1]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EABFC: .4byte gUnknown_083DB694
_080EAC00: .4byte 0x0000ffff
	thumb_func_end sub_80EA7F4

	thumb_func_start sub_80EA8BC
sub_80EA8BC: @ 80EAC04
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EAC8C
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x3
	movs r2, 0xA
	movs r3, 0x4
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x2
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r1, r6, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAC8C: .4byte gUnknown_083DB694
	thumb_func_end sub_80EA8BC

	thumb_func_start sub_80EA948
sub_80EA948: @ 80EAC90
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EAD84
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r5, _080EAD88
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x2
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x80
	adds r1, r7
	mov r9, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x3
	movs r2, 0xA
	movs r3, 0x5
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r1, r7
	mov r8, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1A
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0x1A
	movs r2, 0xA
	adds r3, r5, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x19
	movs r2, 0xA
	movs r3, 0x1A
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAD84: .4byte gUnknown_083DB694
_080EAD88: .4byte 0x0000ffff
	thumb_func_end sub_80EA948

	thumb_func_start sub_80EAA44
sub_80EAA44: @ 80EAD8C
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EAE14
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r1, _080EAE18
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x17
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r6, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAE14: .4byte gUnknown_083DB694
_080EAE18: .4byte 0x0000ffff
	thumb_func_end sub_80EAA44

	thumb_func_start sub_80EAAD4
sub_80EAAD4: @ 80EAE1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EAF14
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r1, 0xF
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r5, 0x1
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r1, r7
	mov r8, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	movs r1, 0x14
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r6, _080EAF18
	str r6, [sp, 0x10]
	movs r1, 0
	movs r2, 0xF
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0xA
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x68
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0x14
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x14
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x5
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAF14: .4byte gUnknown_083DB694
_080EAF18: .4byte 0x0000ffff
	thumb_func_end sub_80EAAD4

	thumb_func_start sub_80EABD4
sub_80EABD4: @ 80EAF1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	ldr r7, [sp, 0x2C]
	mov r8, r7
	strh r1, [r0]
	strh r3, [r0, 0x2]
	strh r2, [r0, 0x4]
	strh r5, [r0, 0x6]
	strh r6, [r0, 0x8]
	strh r4, [r0, 0xA]
	mov r1, r9
	strh r1, [r0, 0xC]
	mov r4, r8
	strh r4, [r0, 0xE]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EABD4

	thumb_func_start sub_80EAC0C
sub_80EAC0C: @ 80EAF54
	ldrh r1, [r0, 0x8]
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
	ldrh r1, [r0, 0xA]
	ldrh r2, [r0, 0x2]
	adds r1, r2
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0xC]
	ldrh r2, [r0, 0x4]
	adds r1, r2
	strh r1, [r0, 0x4]
	ldrh r1, [r0, 0xE]
	ldrh r2, [r0, 0x6]
	adds r1, r2
	strh r1, [r0, 0x6]
	bx lr
	thumb_func_end sub_80EAC0C

	thumb_func_start sub_80EAC30
sub_80EAC30: @ 80EAF78
	push {r4,r5,lr}
	ldr r4, [sp, 0xC]
	ldr r5, [sp, 0x10]
	strh r1, [r0]
	strh r2, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r4, [r0, 0x6]
	str r5, [r0, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EAC30

	thumb_func_start sub_80EAC48
sub_80EAC48: @ 80EAF90
	ldrh r1, [r0, 0x4]
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
	ldrh r1, [r0, 0x6]
	ldrh r2, [r0, 0x2]
	adds r1, r2
	strh r1, [r0, 0x2]
	bx lr
	thumb_func_end sub_80EAC48

	thumb_func_start sub_80EAC5C
sub_80EAC5C: @ 80EAFA4
	push {r4-r6,lr}
	ldr r0, _080EAFFC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xBC
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EAFF4
	movs r4, 0
	adds r0, r1, 0
	adds r0, 0xC2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _080EAFEA
	adds r5, r1, 0
	adds r6, r0, 0
_080EAFC4:
	lsls r1, r4, 4
	adds r1, 0xC8
	adds r1, r5, r1
	lsls r2, r4, 1
	adds r2, r4
	lsls r2, 2
	movs r0, 0xA4
	lsls r0, 1
	adds r2, r0
	adds r2, r5, r2
	ldr r0, _080EB000
	bl sub_80EACBC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r2, [r6]
	cmp r4, r2
	bcc _080EAFC4
_080EAFEA:
	ldr r0, _080EAFFC
	ldr r0, [r0]
	adds r0, 0xBC
	movs r1, 0
	strb r1, [r0]
_080EAFF4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAFFC: .4byte gUnknown_083DB694
_080EB000: .4byte 0x06006800
	thumb_func_end sub_80EAC5C

	thumb_func_start sub_80EACBC
sub_80EACBC: @ 80EB004
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	adds r3, r1, 0
	adds r4, r2, 0
	ldrh r2, [r3, 0x2]
	ldrh r0, [r3]
	subs r2, r0
	ldrh r0, [r3, 0x6]
	ldrh r1, [r3, 0x4]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r6, r2, 16
	cmp r6, 0
	ble _080EB046
	lsls r5, r0, 16
	cmp r5, 0
	ble _080EB046
	ldrh r1, [r3]
	ldrh r2, [r3, 0x4]
	ldr r3, [r4, 0x8]
	ldrh r0, [r4]
	str r0, [sp]
	ldrh r0, [r4, 0x2]
	str r0, [sp, 0x4]
	lsrs r0, r6, 16
	str r0, [sp, 0x8]
	lsrs r0, r5, 16
	str r0, [sp, 0xC]
	adds r0, r7, 0
	bl sub_809D104
_080EB046:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EACBC

	thumb_func_start sub_80EAD08
sub_80EAD08: @ 80EB050
	push {r4,r5,lr}
	ldr r0, _080EB0A0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080EB0A4
	adds r4, r0, r1
	adds r4, 0xB0
	ldr r0, _080EB0A8
	ldr r1, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r2, r0, 0
	subs r2, 0x58
	movs r0, 0xFF
	ands r2, r0
	movs r3, 0
	movs r5, 0xFF
_080EB07A:
	ldrh r0, [r1]
	adds r0, r3
	cmp r0, 0x80
	bne _080EB08A
	negs r0, r3
	adds r2, r0, 0
	subs r2, 0x58
	ands r2, r5
_080EB08A:
	strh r2, [r4]
	adds r4, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3F
	bls _080EB07A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EB0A0: .4byte gUnknown_03004DC0
_080EB0A4: .4byte gUnknown_03004DE0
_080EB0A8: .4byte gUnknown_083DB694
	thumb_func_end sub_80EAD08

	thumb_func_start sub_80EAD64
sub_80EAD64: @ 80EB0AC
	push {lr}
	lsls r1, 24
	ldr r2, _080EB0C0
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r1}
	bx r1
	.align 2, 0
_080EB0C0: .4byte gEasyChatGroupNames
	thumb_func_end sub_80EAD64

	thumb_func_start sub_80EAD7C
sub_80EAD7C: @ 80EB0C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x14
	beq _080EB0EA
	cmp r0, 0x14
	bgt _080EB0E4
	cmp r0, 0x11
	blt _080EB102
	ldr r0, _080EB0E0
	bl FlagGet
	b _080EB0FC
	.align 2, 0
_080EB0E0: .4byte 0x00000804
_080EB0E4:
	cmp r1, 0x15
	beq _080EB0F8
	b _080EB102
_080EB0EA:
	ldr r0, _080EB0F4
	bl FlagGet
	b _080EB0FC
	.align 2, 0
_080EB0F4: .4byte 0x00000806
_080EB0F8:
	bl sub_80EB9C8
_080EB0FC:
	lsls r0, 24
	lsrs r0, 24
	b _080EB104
_080EB102:
	movs r0, 0x1
_080EB104:
	pop {r1}
	bx r1
	thumb_func_end sub_80EAD7C

	thumb_func_start sub_80EADC0
sub_80EADC0: @ 80EB108
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r2, 0x15
	bhi _080EB1CA
	lsls r0, r2, 2
	ldr r1, _080EB120
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EB120: .4byte _080EB124
	.align 2, 0
_080EB124:
	.4byte _080EB198
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1CA
	.4byte _080EB1AA
	.4byte _080EB1AA
	.4byte _080EB1AA
	.4byte _080EB17C
	.4byte _080EB1C0
_080EB17C:
	ldr r0, _080EB194
	ldr r0, [r0]
	adds r0, r2
	adds r0, 0x67
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EB1B8
	lsls r0, r3, 24
	lsrs r0, 24
	bl sub_80EB868
	b _080EB1C4
	.align 2, 0
_080EB194: .4byte gUnknown_083DB694
_080EB198:
	adds r0, r3, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	b _080EB1C4
_080EB1AA:
	ldr r0, _080EB1BC
	ldr r0, [r0]
	adds r0, r2
	adds r0, 0x67
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EB1CA
_080EB1B8:
	movs r0, 0
	b _080EB1CC
	.align 2, 0
_080EB1BC: .4byte gUnknown_083DB694
_080EB1C0:
	bl sub_80EB9C8
_080EB1C4:
	lsls r0, 24
	lsrs r0, 24
	b _080EB1CC
_080EB1CA:
	movs r0, 0x1
_080EB1CC:
	pop {r1}
	bx r1
	thumb_func_end sub_80EADC0

	thumb_func_start sub_80EAE88
sub_80EAE88: @ 80EB1D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080EB1EE
	cmp r4, 0x14
	beq _080EB1FA
	adds r0, r4, 0
	bl sub_80EAD7C
	lsls r0, 24
	cmp r0, 0
	bne _080EB204
	movs r0, 0
	b _080EB20A
_080EB1EE:
	movs r0, 0
	bl GetHoennPokedexCount
	lsls r0, 16
	lsrs r0, 16
	b _080EB20A
_080EB1FA:
	bl sub_80EB8C0
	lsls r0, 24
	lsrs r0, 24
	b _080EB20A
_080EB204:
	ldr r0, _080EB210
	adds r0, r4, r0
	ldrb r0, [r0]
_080EB20A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EB210: .4byte gEasyChatGroupSizes
	thumb_func_end sub_80EAE88

	thumb_func_start sub_80EAECC
sub_80EAECC: @ 80EB214
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r7, 0
	ldr r1, _080EB250
	ldr r0, [r1]
	ldr r3, _080EB254
	adds r3, r0, r3
	str r3, [sp, 0x4]
_080EB22C:
	ldr r1, _080EB258
	lsls r2, r7, 1
	adds r0, r2, r1
	ldrh r4, [r0]
	adds r3, r7, 0x1
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, [sp, 0x4]
	adds r1, r0, r2
	movs r0, 0
	strh r0, [r1]
	mov r9, r0
	adds r6, r4, 0
	mov r10, r2
	str r3, [sp, 0x8]
	b _080EB354
	.align 2, 0
_080EB250: .4byte gUnknown_083DB694
_080EB254: .4byte 0x0000446c
_080EB258: .4byte gEasyChatWordsByLetter
_080EB25C:
	ldr r2, _080EB2F4
	adds r0, r6, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r4, r1, 0
	ldr r0, _080EB2F8
	cmp r1, r0
	bls _080EB310
	movs r0, 0xFF
	ands r1, r0
	movs r3, 0
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080EB2FC
	cmp r5, r0
	beq _080EB354
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 3
	subs r0, r7
	lsls r0, 2
	mov r8, r0
_080EB292:
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 1
	ldr r0, _080EB2F4
	adds r1, r0
	ldrh r4, [r1]
	lsrs r0, r4, 9
	ldr r1, _080EB300
	adds r2, r1, 0
	adds r1, r4, 0
	ands r1, r2
	str r3, [sp, 0xC]
	bl sub_80EADC0
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _080EB2E6
	cmp r3, 0
	bne _080EB2E6
	ldr r3, _080EB304
	ldr r2, [r3]
	mov r1, r9
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 1
	add r1, r8
	ldr r3, _080EB308
	adds r0, r2, r3
	adds r0, r1
	strh r4, [r0]
	ldr r0, _080EB30C
	adds r2, r0
	add r2, r10
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	movs r3, 0x1
_080EB2E6:
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080EB2FC
	cmp r5, r1
	bne _080EB292
	b _080EB354
	.align 2, 0
_080EB2F4: .4byte gEasyChatWordsAlphabetized
_080EB2F8: .4byte 0x0000feff
_080EB2FC: .4byte 0x0000ffff
_080EB300: .4byte 0x000001ff
_080EB304: .4byte gUnknown_083DB694
_080EB308: .4byte 0x00000b78
_080EB30C: .4byte 0x0000446c
_080EB310:
	lsrs r0, r4, 9
	ldr r3, _080EB378
	adds r2, r3, 0
	adds r1, r4, 0
	ands r1, r2
	bl sub_80EADC0
	lsls r0, 24
	cmp r0, 0
	beq _080EB354
	ldr r0, _080EB37C
	ldr r2, [r0]
	mov r1, r9
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 1
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 3
	subs r0, r7
	lsls r0, 2
	adds r1, r0
	ldr r3, _080EB380
	adds r0, r2, r3
	adds r0, r1
	strh r4, [r0]
	ldr r0, _080EB384
	adds r2, r0
	add r2, r10
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_080EB354:
	ldr r1, [sp]
	cmp r6, r1
	bcs _080EB35C
	b _080EB25C
_080EB35C:
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	lsrs r7, r0, 16
	cmp r7, 0x1A
	bhi _080EB368
	b _080EB22C
_080EB368:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB378: .4byte 0x000001ff
_080EB37C: .4byte gUnknown_083DB694
_080EB380: .4byte 0x00000b78
_080EB384: .4byte 0x0000446c
	thumb_func_end sub_80EAECC

	thumb_func_start sub_80EB040
sub_80EB040: @ 80EB388
	push {r4-r6,lr}
	movs r3, 0
_080EB38C:
	adds r6, r3, 0x1
	cmp r3, 0
	beq _080EB3DC
	cmp r3, 0x15
	beq _080EB3DC
	cmp r3, 0x12
	beq _080EB3DC
	cmp r3, 0x13
	beq _080EB3DC
	ldr r0, _080EB3EC
	lsls r1, r3, 2
	adds r1, r0
	ldr r2, [r1]
	movs r4, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _080EB3DC
	ldr r0, _080EB3F0
	ldr r0, [r0]
	ldr r1, _080EB3F4
	adds r5, r0, r1
_080EB3B6:
	lsls r0, r4, 2
	lsls r1, r3, 10
	adds r0, r1
	adds r0, r5, r0
	str r2, [r0]
	ldrb r0, [r2]
	adds r1, r4, 0x1
	cmp r0, 0xFF
	beq _080EB3D0
_080EB3C8:
	adds r2, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080EB3C8
_080EB3D0:
	adds r2, 0x1
	lsls r0, r1, 16
	lsrs r4, r0, 16
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080EB3B6
_080EB3DC:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, 0x15
	bls _080EB38C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB3EC: .4byte gEasyChatGroupWords
_080EB3F0: .4byte gUnknown_083DB694
_080EB3F4: .4byte 0x000044d0
	thumb_func_end sub_80EB040

	thumb_func_start sub_80EB0B0
sub_80EB0B0: @ 80EB3F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r3, _080EB4CC
	ldr r4, [r3]
	adds r0, r4, 0
	adds r0, 0x26
	ldrb r5, [r0]
	cmp r5, 0
	bne _080EB4E4
	movs r0, 0xDC
	lsls r0, 1
	adds r2, r4, r0
	ldrb r6, [r2]
	lsls r1, r6, 1
	ldr r7, _080EB4D0
	adds r0, r4, r7
	adds r0, r1
	strh r5, [r0]
	movs r7, 0
	movs r0, 0
	mov r9, r0
	ldr r1, _080EB4D4
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp]
	movs r1, 0
	mov r8, r1
	ldr r1, _080EB4D8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080EB446
	b _080EB546
_080EB446:
	movs r2, 0xDC
	lsls r2, 1
	adds r2, r4, r2
	str r2, [sp, 0x4]
	lsls r5, r6, 24
	mov r10, r5
_080EB452:
	mov r1, r8
	lsls r0, r1, 1
	ldr r2, [sp]
	adds r5, r0, r2
	ldrh r1, [r5]
	mov r2, r10
	lsrs r0, r2, 24
	bl sub_80EADC0
	lsls r0, 24
	cmp r0, 0
	beq _080EB4B2
	ldr r0, _080EB4CC
	ldr r3, [r0]
	lsls r1, r7, 1
	mov r2, r9
	lsls r0, r2, 2
	adds r1, r0
	ldr r0, _080EB4DC
	adds r4, r3, r0
	adds r4, r1
	movs r0, 0x7F
	ands r0, r6
	lsls r0, 9
	ldrh r1, [r5]
	ldr r5, _080EB4E0
	adds r2, r5, 0
	ands r1, r2
	orrs r0, r1
	strh r0, [r4]
	lsls r0, r6, 1
	ldr r1, _080EB4D0
	adds r3, r1
	adds r3, r0
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1
	bls _080EB4B2
	movs r7, 0
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
_080EB4B2:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, _080EB4D8
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080EB452
	b _080EB546
	.align 2, 0
_080EB4CC: .4byte gUnknown_083DB694
_080EB4D0: .4byte 0x000044a2
_080EB4D4: .4byte gEasyChatGroupOrders
_080EB4D8: .4byte gEasyChatGroupSizes
_080EB4DC: .4byte 0x00009d56
_080EB4E0: .4byte 0x000001ff
_080EB4E4:
	movs r5, 0xDC
	lsls r5, 1
	adds r0, r4, r5
	ldrb r2, [r0]
	movs r3, 0
	movs r6, 0
	movs r5, 0
	lsls r1, r2, 1
	ldr r7, _080EB558
	adds r0, r4, r7
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r5, r0
	bcs _080EB546
	ldr r7, _080EB55C
	adds r7, r4
	mov r8, r7
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 3
	subs r0, r2
	lsls r7, r0, 2
	ldr r0, _080EB560
	adds r2, r4, r0
	adds r4, r1, 0
_080EB516:
	lsls r1, r3, 1
	lsls r0, r6, 2
	adds r1, r0
	add r1, r8
	lsls r0, r5, 1
	adds r0, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _080EB53A
	movs r3, 0
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080EB53A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r1, [r4]
	cmp r5, r1
	bcc _080EB516
_080EB546:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB558: .4byte 0x0000446c
_080EB55C: .4byte 0x00009d56
_080EB560: .4byte 0x00000b78
	thumb_func_end sub_80EB0B0

	thumb_func_start sub_80EB218
sub_80EB218: @ 80EB564
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r6, r1, 16
	lsrs r4, r6, 16
	adds r7, r4, 0
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB58C
	ldr r1, _080EB588
	b _080EB5EE
	.align 2, 0
_080EB588: .4byte gOtherText_ThreeQuestions
_080EB58C:
	ldr r0, _080EB59C
	cmp r4, r0
	bne _080EB5A0
	adds r1, r5, 0
	movs r0, 0xFF
	strb r0, [r1]
	b _080EB5F6
	.align 2, 0
_080EB59C: .4byte 0x0000ffff
_080EB5A0:
	lsrs r2, r6, 25
	ldr r1, _080EB5B4
	ands r1, r7
	cmp r2, 0x13
	bgt _080EB5B8
	cmp r2, 0x12
	bge _080EB5CC
	cmp r2, 0
	beq _080EB5BC
	b _080EB5DC
	.align 2, 0
_080EB5B4: .4byte 0x000001ff
_080EB5B8:
	cmp r2, 0x15
	bne _080EB5DC
_080EB5BC:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080EB5C8
	adds r1, r0
	b _080EB5EE
	.align 2, 0
_080EB5C8: .4byte gSpeciesNames
_080EB5CC:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080EB5D8
	adds r1, r0
	b _080EB5EE
	.align 2, 0
_080EB5D8: .4byte gMoveNames
_080EB5DC:
	ldr r0, _080EB618
	ldr r0, [r0]
	lsls r1, 2
	lsls r2, 10
	adds r1, r2
	ldr r2, _080EB61C
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
_080EB5EE:
	adds r0, r5, 0
	bl StringCopy
	adds r1, r0, 0
_080EB5F6:
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x13
	strb r0, [r1, 0x1]
	mov r2, r8
	lsls r0, r2, 3
	strb r0, [r1, 0x2]
	adds r1, 0x3
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EB618: .4byte gUnknown_083DB694
_080EB61C: .4byte 0x000044d0
	thumb_func_end sub_80EB218

	thumb_func_start sub_80EB2D4
sub_80EB2D4: @ 80EB620
	push {r4-r6,lr}
	lsls r5, r0, 16
	lsrs r4, r5, 16
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB644
	ldr r0, _080EB640
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	b _080EB6C0
	.align 2, 0
_080EB640: .4byte gOtherText_ThreeQuestions
_080EB644:
	ldr r0, _080EB650
	cmp r4, r0
	bne _080EB654
	movs r0, 0
	b _080EB6C0
	.align 2, 0
_080EB650: .4byte 0x0000ffff
_080EB654:
	lsrs r2, r5, 25
	ldr r1, _080EB668
	ands r1, r6
	cmp r2, 0x13
	bgt _080EB66C
	cmp r2, 0x12
	bge _080EB680
	cmp r2, 0
	beq _080EB670
	b _080EB690
	.align 2, 0
_080EB668: .4byte 0x000001ff
_080EB66C:
	cmp r2, 0x15
	bne _080EB690
_080EB670:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080EB67C
	adds r1, r0
	b _080EB6A2
	.align 2, 0
_080EB67C: .4byte gSpeciesNames
_080EB680:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080EB68C
	adds r1, r0
	b _080EB6A2
	.align 2, 0
_080EB68C: .4byte gMoveNames
_080EB690:
	ldr r0, _080EB6A8
	ldr r0, [r0]
	lsls r1, 2
	lsls r2, 10
	adds r1, r2
	ldr r2, _080EB6AC
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
_080EB6A2:
	movs r2, 0
	b _080EB6B8
	.align 2, 0
_080EB6A8: .4byte gUnknown_083DB694
_080EB6AC: .4byte 0x000044d0
_080EB6B0:
	adds r1, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080EB6B8:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080EB6B0
	adds r0, r2, 0
_080EB6C0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB2D4

	thumb_func_start sub_80EB37C
sub_80EB37C: @ 80EB6C8
	push {r4,r5,lr}
	lsls r1, r0, 16
	lsrs r3, r1, 16
	ldr r0, _080EB6EC
	cmp r3, r0
	beq _080EB736
	lsrs r2, r1, 25
	ldr r5, _080EB6F0
	ands r5, r3
	cmp r2, 0x15
	bhi _080EB740
	cmp r2, 0x13
	bgt _080EB6F4
	cmp r2, 0x12
	bge _080EB6F8
	cmp r2, 0
	beq _080EB6F8
	b _080EB72C
	.align 2, 0
_080EB6EC: .4byte 0x0000ffff
_080EB6F0: .4byte 0x000001ff
_080EB6F4:
	cmp r2, 0x15
	bne _080EB72C
_080EB6F8:
	ldr r0, _080EB724
	lsls r1, r2, 2
	adds r1, r0
	ldr r4, [r1]
	movs r3, 0
	ldr r0, _080EB728
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080EB740
	adds r1, r0, 0
_080EB70E:
	lsls r0, r3, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r5, r0
	beq _080EB736
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _080EB70E
	b _080EB740
	.align 2, 0
_080EB724: .4byte gEasyChatGroupWords
_080EB728: .4byte gEasyChatGroupSizes
_080EB72C:
	ldr r0, _080EB73C
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080EB740
_080EB736:
	movs r0, 0
	b _080EB742
	.align 2, 0
_080EB73C: .4byte gEasyChatGroupSizes
_080EB740:
	movs r0, 0x1
_080EB742:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB37C

	thumb_func_start sub_80EB3FC
sub_80EB3FC: @ 80EB748
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	movs r7, 0
	cmp r3, 0x13
	bgt _080EB75E
	cmp r3, 0x12
	bge _080EB762
	cmp r3, 0
	beq _080EB762
	b _080EB7A4
_080EB75E:
	cmp r3, 0x15
	bne _080EB7A4
_080EB762:
	ldr r1, _080EB784
	lsls r0, r3, 2
	adds r0, r1
	ldr r4, [r0]
	movs r2, 0
	ldr r0, _080EB788
	adds r1, r3, r0
	adds r6, r0, 0
	ldrb r1, [r1]
	cmp r2, r1
	bge _080EB7A6
	ldrh r0, [r4]
	cmp r5, r0
	bne _080EB78C
	movs r7, 0
	b _080EB7A6
	.align 2, 0
_080EB784: .4byte gEasyChatGroupWords
_080EB788: .4byte gEasyChatGroupSizes
_080EB78C:
	adds r2, 0x1
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r2, r0
	bge _080EB7A6
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r5, r0
	bne _080EB78C
	adds r7, r2, 0
	b _080EB7A6
_080EB7A4:
	adds r7, r5, 0
_080EB7A6:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB3FC

	thumb_func_start ConvertEasyChatWordsToString
ConvertEasyChatWordsToString: @ 80EB7B0
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r6, r1, 16
	lsrs r4, r6, 16
	adds r7, r4, 0
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB7D4
	ldr r1, _080EB7D0
	adds r0, r5, 0
	bl StringCopy
	b _080EB85A
	.align 2, 0
_080EB7D0: .4byte gOtherText_ThreeQuestions
_080EB7D4:
	ldr r0, _080EB7F0
	cmp r4, r0
	beq _080EB854
	lsrs r1, r6, 25
	ldr r2, _080EB7F4
	ands r2, r7
	cmp r1, 0x13
	bgt _080EB7F8
	cmp r1, 0x12
	bge _080EB80C
	cmp r1, 0
	beq _080EB7FC
	b _080EB81C
	.align 2, 0
_080EB7F0: .4byte 0x0000ffff
_080EB7F4: .4byte 0x000001ff
_080EB7F8:
	cmp r1, 0x15
	bne _080EB81C
_080EB7FC:
	movs r0, 0xB
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _080EB808
	adds r1, r0
	b _080EB84C
	.align 2, 0
_080EB808: .4byte gSpeciesNames
_080EB80C:
	movs r0, 0xD
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _080EB818
	adds r1, r0
	b _080EB84C
	.align 2, 0
_080EB818: .4byte gMoveNames
_080EB81C:
	ldr r0, _080EB860
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	subs r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080EB864
	cmp r2, r0
	beq _080EB84C
	adds r3, r0, 0
_080EB832:
	ldrb r0, [r1]
	adds r1, 0x1
	subs r2, 0x1
	cmp r0, 0xFF
	beq _080EB844
_080EB83C:
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0xFF
	bne _080EB83C
_080EB844:
	lsls r0, r2, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bne _080EB832
_080EB84C:
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
_080EB854:
	movs r0, 0xFF
	strb r0, [r5]
	adds r0, r5, 0
_080EB85A:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EB860: .4byte gEasyChatGroupWords
_080EB864: .4byte 0x0000ffff
	thumb_func_end ConvertEasyChatWordsToString

	thumb_func_start sub_80EB544
sub_80EB544: @ 80EB868
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	ldr r0, _080EB8F0
	adds r2, r0
	lsrs r7, r2, 16
	movs r0, 0
	cmp r0, r9
	bcs _080EB8D8
_080EB88A:
	movs r6, 0
	adds r0, 0x1
	mov r8, r0
	cmp r6, r7
	bcs _080EB8BC
	ldr r2, _080EB8F4
_080EB896:
	ldrh r1, [r5]
	adds r0, r4, 0
	str r2, [sp]
	bl ConvertEasyChatWordsToString
	adds r4, r0, 0
	ldrh r0, [r5]
	ldr r2, [sp]
	cmp r0, r2
	beq _080EB8B0
	movs r0, 0
	strb r0, [r4]
	adds r4, 0x1
_080EB8B0:
	adds r5, 0x2
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _080EB896
_080EB8BC:
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r4, 0
	bl ConvertEasyChatWordsToString
	adds r4, r0, 0
	movs r0, 0xFE
	strb r0, [r4]
	adds r4, 0x1
	mov r1, r8
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, r9
	bcc _080EB88A
_080EB8D8:
	subs r4, 0x1
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EB8F0: .4byte 0xffff0000
_080EB8F4: .4byte 0x0000ffff
	thumb_func_end sub_80EB544

	thumb_func_start de_sub_80EB8F8
de_sub_80EB8F8: @ 80EB8F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsls r3, 16
	lsrs r3, 16
	mov r10, r3
	ldr r0, _080EB964
	adds r2, r0
	lsrs r2, 16
	mov r8, r2
	movs r7, 0
	cmp r7, r10
	bcs _080EB97C
_080EB91E:
	movs r6, 0
	adds r1, r7, 0x1
	mov r9, r1
	cmp r6, r8
	bcs _080EB950
	ldr r2, _080EB968
_080EB92A:
	ldrh r1, [r5]
	adds r0, r4, 0
	str r2, [sp]
	bl ConvertEasyChatWordsToString
	adds r4, r0, 0
	ldrh r0, [r5]
	ldr r2, [sp]
	cmp r0, r2
	beq _080EB944
	movs r0, 0
	strb r0, [r4]
	adds r4, 0x1
_080EB944:
	adds r5, 0x2
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r8
	bcc _080EB92A
_080EB950:
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r4, 0
	bl ConvertEasyChatWordsToString
	adds r4, r0, 0
	cmp r7, 0
	bne _080EB96C
	movs r0, 0xFE
	b _080EB96E
	.align 2, 0
_080EB964: .4byte 0xffff0000
_080EB968: .4byte 0x0000ffff
_080EB96C:
	movs r0, 0xFA
_080EB96E:
	strb r0, [r4]
	adds r4, 0x1
	mov r1, r9
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _080EB91E
_080EB97C:
	subs r4, 0x1
	movs r0, 0xFF
	strb r0, [r4]
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end de_sub_80EB8F8

	thumb_func_start unref_sub_80EB5E0
unref_sub_80EB5E0: @ 80EB994
	push {lr}
	lsls r1, r0, 16
	lsrs r3, r1, 16
	ldr r0, _080EB9A4
	cmp r3, r0
	bne _080EB9A8
	movs r0, 0
	b _080EBA30
	.align 2, 0
_080EB9A4: .4byte 0x0000ffff
_080EB9A8:
	lsrs r1, 25
	ldr r2, _080EB9BC
	ands r2, r3
	cmp r1, 0x13
	bgt _080EB9C0
	cmp r1, 0x12
	bge _080EB9D4
	cmp r1, 0
	beq _080EB9C4
	b _080EB9E4
	.align 2, 0
_080EB9BC: .4byte 0x000001ff
_080EB9C0:
	cmp r1, 0x15
	bne _080EB9E4
_080EB9C4:
	movs r0, 0xB
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _080EB9D0
	adds r1, r0
	b _080EBA14
	.align 2, 0
_080EB9D0: .4byte gSpeciesNames
_080EB9D4:
	movs r0, 0xD
	adds r1, r2, 0
	muls r1, r0
	ldr r0, _080EB9E0
	adds r1, r0
	b _080EBA14
	.align 2, 0
_080EB9E0: .4byte gMoveNames
_080EB9E4:
	ldr r0, _080EBA18
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	subs r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080EBA1C
	cmp r2, r0
	beq _080EBA14
	adds r3, r0, 0
_080EB9FA:
	ldrb r0, [r1]
	adds r1, 0x1
	subs r2, 0x1
	cmp r0, 0xFF
	beq _080EBA0C
_080EBA04:
	ldrb r0, [r1]
	adds r1, 0x1
	cmp r0, 0xFF
	bne _080EBA04
_080EBA0C:
	lsls r0, r2, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bne _080EB9FA
_080EBA14:
	movs r2, 0
	b _080EBA28
	.align 2, 0
_080EBA18: .4byte gEasyChatGroupWords
_080EBA1C: .4byte 0x0000ffff
_080EBA20:
	adds r1, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080EBA28:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080EBA20
	adds r0, r2, 0
_080EBA30:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80EB5E0

	thumb_func_start sub_80EB680
sub_80EB680: @ 80EBA34
	movs r0, 0
	bx lr
	thumb_func_end sub_80EB680

	thumb_func_start unref_sub_80EB684
unref_sub_80EB684: @ 80EBA38
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	cmp r0, 0x7
	beq _080EBA68
	cmp r0, 0x7
	bgt _080EBA52
	cmp r0, 0x5
	beq _080EBA58
	b _080EBAA2
_080EBA52:
	cmp r2, 0x8
	beq _080EBA78
	b _080EBAA2
_080EBA58:
	movs r2, 0x6
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EBA64
	b _080EBA82
	.align 2, 0
_080EBA64: .4byte 0x02027e70
_080EBA68:
	movs r2, 0x2
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EBA74
	b _080EBA82
	.align 2, 0
_080EBA74: .4byte 0x02027e88
_080EBA78:
	movs r2, 0x1
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080EBAA8
_080EBA82:
	adds r1, r0, r1
	subs r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080EBAAC
	cmp r2, r0
	beq _080EBAA2
	adds r4, r0, 0
	adds r3, r0, 0
_080EBA94:
	strh r4, [r1]
	adds r1, 0x2
	subs r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bne _080EBA94
_080EBAA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBAA8: .4byte 0x02027e6e
_080EBAAC: .4byte 0x0000ffff
	thumb_func_end unref_sub_80EB684

	thumb_func_start sub_80EB6FC
sub_80EB6FC: @ 80EBAB0
	push {lr}
	adds r2, r0, 0
	lsls r1, 16
	ldr r0, _080EBAD8
	adds r1, r0
	lsrs r0, r1, 16
	ldr r1, _080EBADC
	cmp r0, r1
	beq _080EBAD2
	adds r3, r1, 0
_080EBAC4:
	strh r3, [r2]
	adds r2, 0x2
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r1
	bne _080EBAC4
_080EBAD2:
	pop {r0}
	bx r0
	.align 2, 0
_080EBAD8: .4byte 0xffff0000
_080EBADC: .4byte 0x0000ffff
	thumb_func_end sub_80EB6FC

	thumb_func_start sub_80EB72C
sub_80EB72C: @ 80EBAE0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080EBB2C
	adds r1, r4, r1
	ldrb r1, [r1]
	bl __modsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r4, 0
	beq _080EBB0C
	cmp r4, 0x15
	beq _080EBB0C
	cmp r4, 0x12
	beq _080EBB0C
	cmp r4, 0x13
	bne _080EBB1A
_080EBB0C:
	ldr r1, _080EBB30
	lsls r0, r4, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r2, [r0]
_080EBB1A:
	movs r0, 0x7F
	ands r0, r4
	lsls r0, 9
	ldr r1, _080EBB34
	ands r2, r1
	orrs r0, r2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EBB2C: .4byte gEasyChatGroupSizes
_080EBB30: .4byte gEasyChatGroupWords
_080EBB34: .4byte 0x000001ff
	thumb_func_end sub_80EB72C

	thumb_func_start sub_80EB784
sub_80EB784: @ 80EBB38
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80EAD7C
	lsls r0, 24
	cmp r0, 0
	bne _080EBB54
	ldr r0, _080EBB50
	b _080EBB72
	.align 2, 0
_080EBB50: .4byte 0x0000ffff
_080EBB54:
	cmp r4, 0
	beq _080EBB62
	cmp r4, 0x14
	bne _080EBB68
	bl sub_80EB960
	b _080EBB6E
_080EBB62:
	bl sub_80EB9D8
	b _080EBB6E
_080EBB68:
	adds r0, r4, 0
	bl sub_80EB72C
_080EBB6E:
	lsls r0, 16
	lsrs r0, 16
_080EBB72:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB784

	thumb_func_start sub_80EB7C4
sub_80EB7C4: @ 80EBB78
	push {r4,r5,lr}
	ldr r0, _080EBB8C
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080EBBA4
	cmp r0, 0x1
	bgt _080EBB90
	cmp r0, 0
	beq _080EBB9A
	b _080EBBE2
	.align 2, 0
_080EBB8C: .4byte gSpecialVar_0x8004
_080EBB90:
	cmp r0, 0x2
	beq _080EBBC4
	cmp r0, 0x3
	beq _080EBBCC
	b _080EBBE2
_080EBB9A:
	ldr r5, _080EBBA0
	movs r2, 0x2
	b _080EBBD0
	.align 2, 0
_080EBBA0: .4byte 0x02028250
_080EBBA4:
	ldr r5, _080EBBC0
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x14
	bl sub_80EB680
	lsls r0, 24
	cmp r0, 0
	beq _080EBBCE
	movs r2, 0x2
	movs r3, 0x3
	b _080EBBD2
	.align 2, 0
_080EBBC0: .4byte 0x0202825c
_080EBBC4:
	ldr r5, _080EBBC8
	b _080EBBCE
	.align 2, 0
_080EBBC8: .4byte 0x02028268
_080EBBCC:
	ldr r5, _080EBBE8
_080EBBCE:
	movs r2, 0x3
_080EBBD0:
	movs r3, 0x2
_080EBBD2:
	ldr r4, _080EBBEC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80EB544
	adds r0, r4, 0
	bl ShowFieldAutoScrollMessage
_080EBBE2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EBBE8: .4byte 0x02028274
_080EBBEC: .4byte gStringVar4
	thumb_func_end sub_80EB7C4

	thumb_func_start sub_80EB83C
sub_80EB83C: @ 80EBBF0
	push {lr}
	bl Random
	movs r1, 0x1
	ands r1, r0
	movs r0, 0xC
	cmp r1, 0
	beq _080EBC02
	movs r0, 0xD
_080EBC02:
	bl sub_80EB784
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _080EBC18
	bl ConvertEasyChatWordsToString
	pop {r0}
	bx r0
	.align 2, 0
_080EBC18: .4byte gStringVar2
	thumb_func_end sub_80EB83C

	thumb_func_start sub_80EB868
sub_80EB868: @ 80EBC1C
	lsls r0, 24
	lsrs r2, r0, 27
	movs r1, 0xE0
	lsls r1, 19
	ands r1, r0
	lsrs r1, 24
	ldr r0, _080EBC3C
	ldr r3, _080EBC40
	adds r0, r3
	adds r2, r0
	ldrb r0, [r2]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_080EBC3C: .4byte gSaveBlock1
_080EBC40: .4byte 0x00002d8c
	thumb_func_end sub_80EB868

	thumb_func_start sub_80EB890
sub_80EB890: @ 80EBC44
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x20
	bhi _080EBC66
	lsrs r2, r0, 27
	movs r1, 0x7
	ands r1, r3
	ldr r0, _080EBC6C
	ldr r3, _080EBC70
	adds r0, r3
	adds r2, r0
	movs r0, 0x1
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
_080EBC66:
	pop {r0}
	bx r0
	.align 2, 0
_080EBC6C: .4byte gSaveBlock1
_080EBC70: .4byte 0x00002d8c
	thumb_func_end sub_80EB890

	thumb_func_start sub_80EB8C0
sub_80EB8C0: @ 80EBC74
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_080EBC7A:
	adds r0, r4, 0
	bl sub_80EB868
	lsls r0, 24
	cmp r0, 0
	beq _080EBC8C
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080EBC8C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x20
	bls _080EBC7A
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB8C0

	thumb_func_start sub_80EB8EC
sub_80EB8EC: @ 80EBCA0
	push {r4-r6,lr}
	bl sub_80EB8C0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x21
	bne _080EBCCC
	b _080EBD06
_080EBCB0:
	adds r0, r5, 0
	bl sub_80EB890
	ldr r0, _080EBCC8
	ands r4, r0
	movs r1, 0xA0
	lsls r1, 6
	adds r0, r1, 0
	orrs r4, r0
	adds r0, r4, 0
	b _080EBD08
	.align 2, 0
_080EBCC8: .4byte 0x000001ff
_080EBCCC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x21
	subs r1, r4
	bl __modsi3
	lsls r0, 16
	lsrs r6, r0, 16
	movs r4, 0
_080EBCE2:
	lsls r0, r4, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80EB868
	lsls r0, 24
	cmp r0, 0
	bne _080EBCFC
	cmp r6, 0
	beq _080EBCB0
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080EBCFC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x20
	bls _080EBCE2
_080EBD06:
	ldr r0, _080EBD10
_080EBD08:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080EBD10: .4byte 0x0000ffff
	thumb_func_end sub_80EB8EC

	thumb_func_start sub_80EB960
sub_80EB960: @ 80EBD14
	push {r4,r5,lr}
	bl sub_80EB8C0
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080EBD38
	b _080EBD6E
_080EBD24:
	ldr r0, _080EBD34
	ands r4, r0
	movs r1, 0xA0
	lsls r1, 6
	adds r0, r1, 0
	orrs r4, r0
	adds r0, r4, 0
	b _080EBD70
	.align 2, 0
_080EBD34: .4byte 0x000001ff
_080EBD38:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0
_080EBD4C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80EB868
	lsls r0, 24
	cmp r0, 0
	beq _080EBD64
	cmp r5, 0
	beq _080EBD24
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080EBD64:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x20
	bls _080EBD4C
_080EBD6E:
	ldr r0, _080EBD78
_080EBD70:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EBD78: .4byte 0x0000ffff
	thumb_func_end sub_80EB960

	thumb_func_start sub_80EB9C8
sub_80EB9C8: @ 80EBD7C
	push {lr}
	bl IsNationalPokedex
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80EB9C8

	thumb_func_start sub_80EB9D8
sub_80EB9D8: @ 80EBD8C
	push {r4-r7,lr}
	movs r0, 0
	bl sub_80EAE88
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _080EBDAC
	b _080EBDFA
_080EBD9E:
	ldrh r1, [r5]
	ldr r0, _080EBDA8
	ands r0, r1
	b _080EBDFC
	.align 2, 0
_080EBDA8: .4byte 0x000001ff
_080EBDAC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080EBE04
	ldr r5, [r0]
	movs r6, 0
	ldr r0, _080EBE08
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080EBDFA
	adds r7, r0, 0
_080EBDCE:
	ldrh r0, [r5]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _080EBDEE
	cmp r4, 0
	beq _080EBD9E
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080EBDEE:
	adds r5, 0x2
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _080EBDCE
_080EBDFA:
	ldr r0, _080EBE0C
_080EBDFC:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EBE04: .4byte gEasyChatGroupWords
_080EBE08: .4byte gEasyChatGroupSizes
_080EBE0C: .4byte 0x0000ffff
	thumb_func_end sub_80EB9D8

	.align 2, 0 @ Don't pad with nop.
