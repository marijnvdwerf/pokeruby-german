	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetUpFieldMove_Cut
SetUpFieldMove_Cut: @ 80A2654
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0x52
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A2684
	ldr r1, _080A2674 @ =gUnknown_0300485C
	ldr r0, _080A2678 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080A267C @ =gUnknown_03005CE4
	ldr r0, _080A2680 @ =sub_80A2634
	b _080A26F8
	.align 2, 0
_080A2674: .4byte gUnknown_0300485C
_080A2678: .4byte sub_808AB90
_080A267C: .4byte gUnknown_03005CE4
_080A2680: .4byte sub_80A2634
_080A2684:
	ldr r4, _080A2700 @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl PlayerGetDestCoords
	movs r7, 0
	mov r8, r4
_080A2692:
	ldr r1, _080A2704 @ =0x0000ffff
	adds r0, r7, r1
	mov r2, r8
	ldrh r2, [r2, 0x2]
	adds r0, r2
	movs r6, 0
	lsls r0, 16
	asrs r5, r0, 16
_080A26A2:
	ldr r1, _080A2704 @ =0x0000ffff
	adds r0, r6, r1
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _080A2718
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8056E14
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080A26EE
	adds r0, r4, 0
	bl MetatileBehavior_IsAsh
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A2718
_080A26EE:
	ldr r1, _080A2708 @ =gUnknown_0300485C
	ldr r0, _080A270C @ =sub_808AB90
	str r0, [r1]
	ldr r1, _080A2710 @ =gUnknown_03005CE4
	ldr r0, _080A2714 @ =sub_80A25E8
_080A26F8:
	str r0, [r1]
	movs r0, 0x1
	b _080A272E
	.align 2, 0
_080A2700: .4byte gUnknown_0203923C
_080A2704: .4byte 0x0000ffff
_080A2708: .4byte gUnknown_0300485C
_080A270C: .4byte sub_808AB90
_080A2710: .4byte gUnknown_03005CE4
_080A2714: .4byte sub_80A25E8
_080A2718:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x2
	bls _080A26A2
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _080A2692
	movs r0, 0
_080A272E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Cut

	thumb_func_start sub_80A25E8
sub_80A25E8: @ 80A2738
	push {lr}
	movs r0, 0x1
	bl FieldEffectStart
	ldr r0, _080A274C @ =gUnknown_0202FF84
	ldr r1, _080A2750 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A274C: .4byte gUnknown_0202FF84
_080A2750: .4byte gUnknown_03005CE0
	thumb_func_end sub_80A25E8

	thumb_func_start FldEff_UseCutOnGrass
FldEff_UseCutOnGrass: @ 80A2754
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A277C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080A2780 @ =sub_80A2684
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x12
	bl sav12_xor_increment
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A277C: .4byte gTasks
_080A2780: .4byte sub_80A2684
	thumb_func_end FldEff_UseCutOnGrass

	thumb_func_start sub_80A2634
sub_80A2634: @ 80A2784
	push {lr}
	ldr r1, _080A2798 @ =gUnknown_0202FF84
	ldr r0, _080A279C @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _080A27A0 @ =UseCutScript
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080A2798: .4byte gUnknown_0202FF84
_080A279C: .4byte gUnknown_03005CE0
_080A27A0: .4byte UseCutScript
	thumb_func_end sub_80A2634

	thumb_func_start FldEff_UseCutOnTree
FldEff_UseCutOnTree: @ 80A27A4
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A27CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080A27D0 @ =sub_80A2B00
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x12
	bl sav12_xor_increment
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A27CC: .4byte gTasks
_080A27D0: .4byte sub_80A2B00
	thumb_func_end FldEff_UseCutOnTree

	thumb_func_start sub_80A2684
sub_80A2684: @ 80A27D4
	push {lr}
	movs r0, 0x1
	bl FieldEffectActiveListRemove
	movs r0, 0x3A
	bl FieldEffectStart
	pop {r0}
	bx r0
	thumb_func_end sub_80A2684

	thumb_func_start FldEff_CutGrass
FldEff_CutGrass: @ 80A27E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r7, 0
	movs r0, 0x80
	bl PlaySE
	ldr r4, _080A28E0 @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl PlayerGetDestCoords
	mov r8, r4
_080A2802:
	ldr r1, _080A28E4 @ =0x0000ffff
	adds r0, r7, r1
	mov r2, r8
	ldrh r2, [r2, 0x2]
	adds r0, r2
	movs r6, 0
	lsls r0, 16
	asrs r5, r0, 16
_080A2812:
	ldr r1, _080A28E4 @ =0x0000ffff
	adds r0, r6, r1
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	cmp r0, r1
	bne _080A285E
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_80578F8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A285E
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A27A8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805BCC0
_080A285E:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x2
	bls _080A2812
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _080A2802
	ldr r1, _080A28E0 @ =gUnknown_0203923C
	ldrh r0, [r1]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r1, 0x2]
	subs r1, 0x2
	lsls r1, 16
	asrs r1, 16
	bl sub_80A28F4
	bl DrawWholeMapView
	movs r7, 0
	ldr r4, _080A28E8 @ =gSprites
_080A2890:
	ldr r0, _080A28EC @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x2]
	lsls r1, 23
	lsrs r1, 7
	movs r2, 0x80
	lsls r2, 12
	adds r1, r2
	asrs r1, 16
	ldrb r2, [r0]
	adds r2, 0x14
	ldr r0, _080A28F0 @ =gSpriteTemplate_CutGrass
	movs r3, 0
	bl CreateSprite
	ldr r1, _080A28F4 @ =0x0201fff0
	adds r1, r7, r1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	lsls r1, r7, 5
	strh r1, [r0, 0x32]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080A2890
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A28E0: .4byte gUnknown_0203923C
_080A28E4: .4byte 0x0000ffff
_080A28E8: .4byte gSprites
_080A28EC: .4byte gPlayerAvatar
_080A28F0: .4byte gSpriteTemplate_CutGrass
_080A28F4: .4byte 0x0201fff0
	thumb_func_end FldEff_CutGrass

	thumb_func_start sub_80A27A8
sub_80A27A8: @ 80A28F8
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r6, r0, 16
	asrs r4, r0, 16
	lsrs r7, r1, 16
	asrs r5, r1, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _080A2930 @ =0x00000207
	cmp r1, r0
	bgt _080A2944
	subs r0, 0x1
	cmp r1, r0
	bge _080A29BC
	cmp r1, 0x25
	beq _080A29DE
	cmp r1, 0x25
	bgt _080A2934
	cmp r1, 0xD
	beq _080A2984
	cmp r1, 0x15
	beq _080A2984
	b _080A29E8
	.align 2, 0
_080A2930: .4byte 0x00000207
_080A2934:
	movs r0, 0xE3
	lsls r0, 1
	cmp r1, r0
	beq _080A2994
	adds r0, 0x1
	cmp r1, r0
	beq _080A299A
	b _080A29E8
_080A2944:
	ldr r0, _080A295C @ =0x00000212
	cmp r1, r0
	beq _080A29CC
	cmp r1, r0
	bgt _080A2960
	subs r0, 0xA
	cmp r1, r0
	beq _080A2984
	adds r0, 0x2
	cmp r1, r0
	beq _080A29CC
	b _080A29E8
	.align 2, 0
_080A295C: .4byte 0x00000212
_080A2960:
	ldr r0, _080A2974 @ =0x00000282
	cmp r1, r0
	beq _080A29AC
	cmp r1, r0
	bgt _080A2978
	subs r0, 0x1
	cmp r1, r0
	beq _080A29A4
	b _080A29E8
	.align 2, 0
_080A2974: .4byte 0x00000282
_080A2978:
	ldr r0, _080A2980 @ =0x00000283
	cmp r1, r0
	beq _080A29B4
	b _080A29E8
	.align 2, 0
_080A2980: .4byte 0x00000283
_080A2984:
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	movs r2, 0x1
	bl MapGridSetMetatileIdAt
	b _080A29E8
_080A2994:
	movs r2, 0xE7
	lsls r2, 1
	b _080A29BE
_080A299A:
	ldr r2, _080A29A0 @ =0x000001cf
	b _080A29BE
	.align 2, 0
_080A29A0: .4byte 0x000001cf
_080A29A4:
	ldr r2, _080A29A8 @ =0x00000279
	b _080A29BE
	.align 2, 0
_080A29A8: .4byte 0x00000279
_080A29AC:
	ldr r2, _080A29B0 @ =0x0000027a
	b _080A29BE
	.align 2, 0
_080A29B0: .4byte 0x0000027a
_080A29B4:
	ldr r2, _080A29B8 @ =0x0000027b
	b _080A29BE
	.align 2, 0
_080A29B8: .4byte 0x0000027b
_080A29BC:
	ldr r2, _080A29C8 @ =0x00000271
_080A29BE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _080A29E8
	.align 2, 0
_080A29C8: .4byte 0x00000271
_080A29CC:
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	movs r2, 0x86
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	b _080A29E8
_080A29DE:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0xE
	bl MapGridSetMetatileIdAt
_080A29E8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A27A8

	thumb_func_start sub_80A28A0
sub_80A28A0: @ 80A29F0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	cmp r1, 0x1
	bne _080A2A0C
	movs r0, 0x1
	b _080A2A3E
_080A2A0C:
	ldr r0, _080A2A18 @ =0x00000279
	cmp r1, r0
	bne _080A2A1C
	movs r0, 0x2
	b _080A2A3E
	.align 2, 0
_080A2A18: .4byte 0x00000279
_080A2A1C:
	ldr r0, _080A2A28 @ =0x0000027a
	cmp r1, r0
	bne _080A2A2C
	movs r0, 0x3
	b _080A2A3E
	.align 2, 0
_080A2A28: .4byte 0x0000027a
_080A2A2C:
	ldr r0, _080A2A38 @ =0x0000027b
	cmp r2, r0
	beq _080A2A3C
	movs r0, 0
	b _080A2A3E
	.align 2, 0
_080A2A38: .4byte 0x0000027b
_080A2A3C:
	movs r0, 0x4
_080A2A3E:
	pop {r1}
	bx r1
	thumb_func_end sub_80A28A0

	thumb_func_start sub_80A28F4
sub_80A28F4: @ 80A2A44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r1, 16
	movs r2, 0xC0
	lsls r2, 10
	adds r0, r1, r2
	lsrs r0, 16
	mov r9, r0
	movs r4, 0
	asrs r7, r1, 16
_080A2A64:
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	lsls r4, 16
	asrs r1, r4, 16
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r5, r0, 16
	adds r0, r5, 0
	adds r1, r7, 0
	bl MapGridGetMetatileIdAt
	mov r8, r4
	cmp r0, 0x15
	bne _080A2AE6
	adds r4, r7, 0x1
	lsls r1, r4, 16
	asrs r1, 16
	adds r0, r5, 0
	bl sub_80A28A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080A2ABA
	cmp r0, 0x2
	bgt _080A2AA2
	cmp r0, 0x1
	beq _080A2AAC
	b _080A2AE6
_080A2AA2:
	cmp r0, 0x3
	beq _080A2ACC
	cmp r0, 0x4
	beq _080A2ADC
	b _080A2AE6
_080A2AAC:
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x82
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	b _080A2AE6
_080A2ABA:
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2AC8 @ =0x00000281
	bl MapGridSetMetatileIdAt
	b _080A2AE6
	.align 2, 0
_080A2AC8: .4byte 0x00000281
_080A2ACC:
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2AD8 @ =0x00000282
	bl MapGridSetMetatileIdAt
	b _080A2AE6
	.align 2, 0
_080A2AD8: .4byte 0x00000282
_080A2ADC:
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2B80 @ =0x00000283
	bl MapGridSetMetatileIdAt
_080A2AE6:
	lsls r0, r6, 16
	asrs r5, r0, 16
	mov r2, r9
	lsls r0, r2, 16
	asrs r4, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	cmp r0, 0x1
	bne _080A2B60
	adds r4, 0x1
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x82
	lsls r1, 2
	cmp r0, r1
	bne _080A2B18
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl MapGridSetMetatileIdAt
_080A2B18:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _080A2B84 @ =0x00000281
	cmp r0, r1
	bne _080A2B30
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2B88 @ =0x00000279
	bl MapGridSetMetatileIdAt
_080A2B30:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _080A2B8C @ =0x00000282
	cmp r0, r1
	bne _080A2B48
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2B90 @ =0x0000027a
	bl MapGridSetMetatileIdAt
_080A2B48:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _080A2B80 @ =0x00000283
	cmp r0, r1
	bne _080A2B60
	adds r0, r5, 0
	adds r1, r4, 0
	ldr r2, _080A2B94 @ =0x0000027b
	bl MapGridSetMetatileIdAt
_080A2B60:
	movs r0, 0x80
	lsls r0, 9
	add r0, r8
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _080A2B70
	b _080A2A64
_080A2B70:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B80: .4byte 0x00000283
_080A2B84: .4byte 0x00000281
_080A2B88: .4byte 0x00000279
_080A2B8C: .4byte 0x00000282
_080A2B90: .4byte 0x0000027a
_080A2B94: .4byte 0x0000027b
	thumb_func_end sub_80A28F4

	thumb_func_start sub_80A2A48
sub_80A2A48: @ 80A2B98
	movs r2, 0
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x34]
	ldr r1, _080A2BA8 @ =objc_8097BBC
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080A2BA8: .4byte objc_8097BBC
	thumb_func_end sub_80A2A48

	thumb_func_start objc_8097BBC
objc_8097BBC: @ 80A2BAC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x2E]
	adds r1, 0x1
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 18
	adds r1, r0
	strh r1, [r4, 0x2E]
	adds r2, 0x1
	strh r2, [r4, 0x34]
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x1C
	beq _080A2BF8
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080A2BFC
_080A2BF8:
	ldr r0, _080A2C04 @ =sub_80A2AB8
	str r0, [r4, 0x1C]
_080A2BFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C04: .4byte sub_80A2AB8
	thumb_func_end objc_8097BBC

	thumb_func_start sub_80A2AB8
sub_80A2AB8: @ 80A2C08
	push {r4-r6,lr}
	movs r4, 0x1
_080A2C0C:
	ldr r6, _080A2C48 @ =0x0201fff0
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080A2C4C @ =gSprites
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080A2C0C
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x3A
	bl FieldEffectStop
	bl sub_8064E2C
	bl ScriptContext2_Disable
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C48: .4byte 0x0201fff0
_080A2C4C: .4byte gSprites
	thumb_func_end sub_80A2AB8

	thumb_func_start sub_80A2B00
sub_80A2B00: @ 80A2C50
	push {lr}
	movs r0, 0x80
	bl PlaySE
	movs r0, 0x2
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80A2B00

	.align 2, 0 @ Don't pad with nop.
