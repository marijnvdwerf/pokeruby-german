	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ExecuteTableBasedItemEffect_
ExecuteTableBasedItemEffect_: @ 803E360
	push {r4,lr}
	sub sp, 0x4
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl sub_803E1B0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ExecuteTableBasedItemEffect_

	thumb_func_start sub_803E1B0
sub_803E1B0: @ 803E384
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	mov r8, r0
	ldr r0, [sp, 0x5C]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	movs r0, 0x1
	str r0, [sp, 0x1C]
	movs r1, 0x6
	str r1, [sp, 0x24]
	movs r2, 0
	str r2, [sp, 0x2C]
	movs r3, 0x4
	str r3, [sp, 0x34]
	mov r0, r8
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803E414
	ldr r0, _0803E3F0 @ =gMain
	ldr r4, _0803E3F4 @ =0x0000043d
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E400
	ldr r2, _0803E3F8 @ =gEnigmaBerries
	ldr r0, _0803E3FC @ =gUnknown_02024E6C
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	b _0803E41C
	.align 2, 0
_0803E3F0: .4byte gMain
_0803E3F4: .4byte 0x0000043d
_0803E3F8: .4byte gEnigmaBerries
_0803E3FC: .4byte gUnknown_02024E6C
_0803E400:
	ldr r0, _0803E40C @ =gSaveBlock1
	ldr r5, _0803E410 @ =0x00003688
	adds r0, r5
	ldrb r0, [r0]
	b _0803E41C
	.align 2, 0
_0803E40C: .4byte gSaveBlock1
_0803E410: .4byte 0x00003688
_0803E414:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_0803E41C:
	str r0, [sp, 0x30]
	ldr r1, _0803E478 @ =gUnknown_02024C0B
	ldr r0, _0803E47C @ =gUnknown_02024E6C
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r0, _0803E480 @ =gMain
	ldr r1, _0803E484 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0803E4BC
	ldr r0, _0803E488 @ =gUnknown_02024A60
	strb r2, [r0]
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	str r1, [sp, 0x18]
	ldr r0, _0803E48C @ =gUnknown_02024A68
	ldr r4, [sp, 0x8]
	subs r4, 0xD
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803E4C8
	ldr r2, _0803E490 @ =gUnknown_02024A6A
	lsls r0, r1, 1
	adds r0, r2
	ldrh r3, [r0]
	ldr r5, [sp, 0xC]
	lsls r0, r5, 16
	lsrs r1, r0, 16
	adds r5, r0, 0
	cmp r3, r1
	bne _0803E494
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x34]
	b _0803E4C8
	.align 2, 0
_0803E478: .4byte gUnknown_02024C0B
_0803E47C: .4byte gUnknown_02024E6C
_0803E480: .4byte gMain
_0803E484: .4byte 0x0000043d
_0803E488: .4byte gUnknown_02024A60
_0803E48C: .4byte gUnknown_02024A68
_0803E490: .4byte gUnknown_02024A6A
_0803E494:
	ldr r1, [sp, 0x18]
	adds r1, 0x2
	str r1, [sp, 0x18]
	ldr r0, _0803E4B8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803E4C8
	lsls r0, r1, 1
	adds r0, r2
	ldrh r1, [r0]
	lsrs r0, r5, 16
	cmp r1, r0
	bne _0803E494
	ldr r2, [sp, 0x18]
	lsls r0, r2, 24
	lsrs r0, 24
	str r0, [sp, 0x34]
	b _0803E4C8
	.align 2, 0
_0803E4B8: .4byte gUnknown_02024A68
_0803E4BC:
	ldr r0, _0803E4E4 @ =gUnknown_02024A60
	strb r1, [r0]
	movs r3, 0x4
	str r3, [sp, 0x34]
	ldr r4, [sp, 0x8]
	subs r4, 0xD
_0803E4C8:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0xA5
	bhi _0803E540
	ldr r1, _0803E4E8 @ =gItemEffectTable
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0803E4EC
	ldr r4, [sp, 0x8]
	cmp r4, 0xAF
	beq _0803E4F2
	b _0803E540
	.align 2, 0
_0803E4E4: .4byte gUnknown_02024A60
_0803E4E8: .4byte gItemEffectTable
_0803E4EC:
	ldr r5, [sp, 0x8]
	cmp r5, 0xAF
	bne _0803E546
_0803E4F2:
	ldr r0, _0803E514 @ =gMain
	ldr r1, _0803E518 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E524
	ldr r0, _0803E51C @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803E520 @ =gUnknown_02024DF8
	adds r0, r1
	b _0803E546
	.align 2, 0
_0803E514: .4byte gMain
_0803E518: .4byte 0x0000043d
_0803E51C: .4byte gUnknown_02024A60
_0803E520: .4byte gUnknown_02024DF8
_0803E524:
	ldr r2, _0803E52C @ =0x02028daa
	str r2, [sp, 0x20]
	b _0803E548
	.align 2, 0
_0803E52C: .4byte 0x02028daa
_0803E530:
	mov r0, r8
	movs r2, 0
	ldr r3, [sp, 0xC]
	bl BeginEvolutionScene
	movs r0, 0
	bl _0803F330
_0803E540:
	movs r0, 0x1
	bl _0803F330
_0803E546:
	str r0, [sp, 0x20]
_0803E548:
	movs r3, 0
	str r3, [sp, 0x18]
_0803E54C:
	ldr r4, [sp, 0x18]
	cmp r4, 0x5
	bls _0803E556
	bl _0803F320
_0803E556:
	lsls r0, r4, 2
	ldr r1, _0803E560 @ =_0803E564
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E560: .4byte _0803E564
	.align 2, 0
_0803E564:
	.4byte _0803E57C
	.4byte _0803E648
	.4byte _0803E6DC
	.4byte _0803E770
	.4byte _0803E950
	.4byte _0803EFF2
_0803E57C:
	ldr r5, [sp, 0x20]
	ldr r0, [sp, 0x18]
	adds r2, r5, r0
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _0803E5C4
	ldr r0, _0803E634 @ =gMain
	ldr r1, _0803E638 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E5C4
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803E5C4
	ldr r1, _0803E63C @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0xF0
	lsls r0, 12
	ands r0, r1
	cmp r0, 0
	beq _0803E5C4
	ldr r0, _0803E640 @ =0xfff0ffff
	ands r1, r0
	str r1, [r2]
	movs r3, 0
	str r3, [sp, 0x1C]
_0803E5C4:
	ldrb r1, [r6]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0803E5F2
	ldr r1, _0803E63C @ =gBattleMons
	ldr r0, _0803E644 @ =gUnknown_02024A60
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r3, 0x80
	lsls r3, 13
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	bne _0803E5F2
	orrs r1, r3
	str r1, [r2]
	movs r4, 0
	str r4, [sp, 0x1C]
_0803E5F2:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0803E600
	bl _0803F320
_0803E600:
	ldr r6, _0803E63C @ =gBattleMons
	ldr r5, _0803E644 @ =gUnknown_02024A60
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x19]
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0803E61A
	bl _0803F320
_0803E61A:
	adds r0, r2, r3
	strb r0, [r1, 0x19]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x19
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	bgt _0803E62E
	b _0803E922
_0803E62E:
	movs r0, 0xC
	strb r0, [r1, 0x19]
	b _0803E922
	.align 2, 0
_0803E634: .4byte gMain
_0803E638: .4byte 0x0000043d
_0803E63C: .4byte gBattleMons
_0803E640: .4byte 0xfff0ffff
_0803E644: .4byte gUnknown_02024A60
_0803E648:
	ldr r0, [sp, 0x20]
	ldr r1, [sp, 0x18]
	adds r2, r0, r1
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	lsls r3, r0, 24
	adds r6, r2, 0
	cmp r3, 0
	beq _0803E68E
	ldr r7, _0803E6D4 @ =gBattleMons
	ldr r5, _0803E6D8 @ =gUnknown_02024A60
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r7
	ldrb r2, [r1, 0x1A]
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0803E68E
	lsrs r0, r3, 28
	adds r0, r2, r0
	strb r0, [r1, 0x1A]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r7
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E68A
	movs r0, 0xC
	strb r0, [r1, 0x1A]
_0803E68A:
	movs r2, 0
	str r2, [sp, 0x1C]
_0803E68E:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0803E69C
	bl _0803F320
_0803E69C:
	ldr r6, _0803E6D4 @ =gBattleMons
	ldr r5, _0803E6D8 @ =gUnknown_02024A60
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x1B]
	movs r0, 0x1B
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0803E6B6
	bl _0803F320
_0803E6B6:
	adds r0, r2, r3
	strb r0, [r1, 0x1B]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x1B
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E6CC
	movs r0, 0xC
	strb r0, [r1, 0x1B]
_0803E6CC:
	movs r3, 0
	str r3, [sp, 0x1C]
	bl _0803F320
	.align 2, 0
_0803E6D4: .4byte gBattleMons
_0803E6D8: .4byte gUnknown_02024A60
_0803E6DC:
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x18]
	adds r2, r4, r5
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	lsls r3, r0, 24
	adds r6, r2, 0
	cmp r3, 0
	beq _0803E722
	ldr r7, _0803E768 @ =gBattleMons
	ldr r5, _0803E76C @ =gUnknown_02024A60
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r7
	ldrb r2, [r1, 0x1E]
	movs r0, 0x1E
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	bgt _0803E722
	lsrs r0, r3, 28
	adds r0, r2, r0
	strb r0, [r1, 0x1E]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r7
	movs r0, 0x1E
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E71E
	movs r0, 0xC
	strb r0, [r1, 0x1E]
_0803E71E:
	movs r0, 0
	str r0, [sp, 0x1C]
_0803E722:
	ldrb r0, [r6]
	movs r3, 0xF
	ands r3, r0
	cmp r3, 0
	bne _0803E730
	bl _0803F320
_0803E730:
	ldr r6, _0803E768 @ =gBattleMons
	ldr r5, _0803E76C @ =gUnknown_02024A60
	ldrb r0, [r5]
	movs r4, 0x58
	muls r0, r4
	adds r1, r0, r6
	ldrb r2, [r1, 0x1C]
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0xB
	ble _0803E74A
	bl _0803F320
_0803E74A:
	adds r0, r2, r3
	strb r0, [r1, 0x1C]
	ldrb r0, [r5]
	muls r0, r4
	adds r1, r0, r6
	movs r0, 0x1C
	ldrsb r0, [r1, r0]
	cmp r0, 0xC
	ble _0803E760
	movs r0, 0xC
	strb r0, [r1, 0x1C]
_0803E760:
	movs r1, 0
	str r1, [sp, 0x1C]
	bl _0803F320
	.align 2, 0
_0803E768: .4byte gBattleMons
_0803E76C: .4byte gUnknown_02024A60
_0803E770:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x18]
	adds r2, r3, r4
	ldrb r1, [r2]
	movs r0, 0x80
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _0803E7B8
	ldr r5, _0803E92C @ =gUnknown_02024C80
	ldr r4, _0803E930 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r0, [r1, 0x2]
	cmp r0, 0
	bne _0803E7B8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x5
	strb r0, [r1, 0x2]
	movs r5, 0
	str r5, [sp, 0x1C]
_0803E7B8:
	ldrb r1, [r6]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0803E81A
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	cmp r0, 0x64
	beq _0803E81A
	ldr r5, _0803E934 @ =gExperienceTables
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, 0x1
	lsls r4, 2
	ldr r2, _0803E938 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r1
	adds r4, r0
	adds r4, r5
	ldr r0, [r4]
	str r0, [sp]
	mov r0, r8
	movs r1, 0x19
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	movs r0, 0
	str r0, [sp, 0x1C]
_0803E81A:
	ldrb r1, [r6]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0803E856
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x7
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E856
	ldr r1, [sp, 0x34]
	cmp r1, 0x4
	beq _0803E852
	ldr r1, _0803E93C @ =gBattleMons
	movs r0, 0x58
	ldr r3, [sp, 0x34]
	adds r2, r3, 0
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _0803E940 @ =0xf7ffffff
	ands r0, r1
	str r0, [r2]
_0803E852:
	movs r4, 0
	str r4, [sp, 0x1C]
_0803E856:
	ldrb r1, [r6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803E876
	ldr r2, _0803E944 @ =0x00000f88
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E876
	movs r5, 0
	str r5, [sp, 0x1C]
_0803E876:
	ldrb r1, [r6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803E896
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x10
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E896
	movs r0, 0
	str r0, [sp, 0x1C]
_0803E896:
	ldrb r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803E8B6
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x20
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E8B6
	movs r1, 0
	str r1, [sp, 0x1C]
_0803E8B6:
	ldrb r1, [r6]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803E8D6
	mov r0, r8
	ldr r1, [sp, 0xC]
	movs r2, 0x40
	ldr r3, [sp, 0x34]
	bl HealStatusConditions
	lsls r0, 24
	cmp r0, 0
	bne _0803E8D6
	movs r2, 0
	str r2, [sp, 0x1C]
_0803E8D6:
	ldrb r1, [r6]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0803E8E4
	bl _0803F320
_0803E8E4:
	ldr r0, _0803E948 @ =gMain
	ldr r3, _0803E94C @ =0x0000043d
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0803E8F8
	bl _0803F320
_0803E8F8:
	ldr r4, [sp, 0x34]
	cmp r4, 0x4
	bne _0803E902
	bl _0803F320
_0803E902:
	ldr r1, _0803E93C @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, 0x50
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0803E91A
	bl _0803F320
_0803E91A:
	movs r0, 0x8
	negs r0, r0
	ands r1, r0
	str r1, [r2]
_0803E922:
	movs r5, 0
	str r5, [sp, 0x1C]
	bl _0803F320
	.align 2, 0
_0803E92C: .4byte gUnknown_02024C80
_0803E930: .4byte gUnknown_02024A60
_0803E934: .4byte gExperienceTables
_0803E938: .4byte gBaseStats
_0803E93C: .4byte gBattleMons
_0803E940: .4byte 0xf7ffffff
_0803E944: .4byte 0x00000f88
_0803E948: .4byte gMain
_0803E94C: .4byte 0x0000043d
_0803E950:
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x18]
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r10, r0
	movs r0, 0x20
	mov r3, r10
	ands r0, r3
	cmp r0, 0
	beq _0803EA28
	movs r0, 0xDF
	ands r3, r0
	mov r10, r3
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _0803EA54 @ =gUnknown_08208238
	ldr r4, [sp, 0x10]
	adds r1, r4, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r4, 1
	lsrs r0, r1
	str r0, [sp]
	adds r5, r4, 0
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x28]
	ldr r0, [sp]
	cmp r0, 0x2
	bhi _0803EA28
	ldr r0, [sp, 0x28]
	cmp r0, 0x4
	bls _0803EA28
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _0803EA58 @ =gUnknown_08208240
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x15
	mov r2, sp
	bl SetMonData
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x28]
	subs r0, r3
	str r0, [sp]
	ldr r4, [sp, 0x10]
	adds r4, 0x11
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	movs r4, 0
	str r4, [sp, 0x1C]
_0803EA28:
	movs r5, 0
	str r5, [sp, 0x28]
	mov r0, r10
	cmp r0, 0
	bne _0803EA36
	bl _0803F320
_0803EA36:
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	bne _0803EA42
	b _0803EFDE
_0803EA42:
	ldr r2, [sp, 0x28]
	cmp r2, 0x7
	bls _0803EA4A
	b _0803EFDE
_0803EA4A:
	lsls r0, r2, 2
	ldr r1, _0803EA5C @ =_0803EA60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EA54: .4byte gUnknown_08208238
_0803EA58: .4byte gUnknown_08208240
_0803EA5C: .4byte _0803EA60
	.align 2, 0
_0803EA60:
	.4byte _0803EA80
	.4byte _0803EA80
	.4byte _0803EB08
	.4byte _0803ED30
	.4byte _0803EFDE
	.4byte _0803EFDE
	.4byte _0803EFDE
	.4byte _0803EFC8
_0803EA80:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0803EAC0 @ =0x000001fd
	cmp r5, r0
	bls _0803EA92
	b _0803E540
_0803EA92:
	ldr r0, _0803EAC4 @ =gUnknown_082082F2
	ldr r3, [sp, 0x28]
	adds r0, r3, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	cmp r1, 0x63
	bls _0803EAAC
	b _0803EFDE
_0803EAAC:
	ldr r4, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x64
	bls _0803EAC8
	adds r0, 0x64
	subs r4, r0, r1
	b _0803EACA
	.align 2, 0
_0803EAC0: .4byte 0x000001fd
_0803EAC4: .4byte gUnknown_082082F2
_0803EAC8:
	adds r4, r0, 0
_0803EACA:
	adds r1, r5, r4
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	bls _0803EAD8
	adds r0, r4, r0
	subs r4, r0, r1
_0803EAD8:
	ldr r0, [sp]
	adds r0, r4
	str r0, [sp]
	ldr r0, _0803EB04 @ =gUnknown_082082F2
	ldr r3, [sp, 0x28]
	adds r0, r3, r0
	ldrb r1, [r0]
	mov r0, r8
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	movs r4, 0
	str r4, [sp, 0x1C]
	b _0803EFDE
	.align 2, 0
_0803EB04: .4byte gUnknown_082082F2
_0803EB08:
	movs r0, 0x10
	mov r5, r10
	ands r0, r5
	cmp r0, 0
	beq _0803EBC8
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0803EB28
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	b _0803EE72
_0803EB28:
	ldr r0, _0803EB70 @ =gMain
	ldr r1, _0803EB74 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r4, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EBDE
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803EB88
	ldr r2, _0803EB78 @ =gUnknown_02024C0C
	ldr r1, _0803EB7C @ =gBitTable
	ldr r3, [sp, 0x34]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r1, _0803EB80 @ =gUnknown_02024A6A
	lsls r0, r3, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [sp, 0x34]
	bl CopyPlayerPartyMonToBattleData
	ldr r0, _0803EB84 @ =gUnknown_02024A60
	ldrb r0, [r0]
	b _0803EBA0
	.align 2, 0
_0803EB70: .4byte gMain
_0803EB74: .4byte 0x0000043d
_0803EB78: .4byte gUnknown_02024C0C
_0803EB7C: .4byte gBitTable
_0803EB80: .4byte gUnknown_02024A6A
_0803EB84: .4byte gUnknown_02024A60
_0803EB88:
	ldr r3, _0803EBB8 @ =gUnknown_02024C0C
	ldr r1, _0803EBBC @ =gBitTable
	ldr r2, _0803EBC0 @ =gUnknown_02024A60
	ldrb r0, [r2]
	eors r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldrb r0, [r3]
	bics r0, r1
	strb r0, [r3]
	ldrb r0, [r2]
_0803EBA0:
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803EBDE
	ldr r1, _0803EBC4 @ =gUnknown_030042E0
	ldrb r0, [r1, 0x4]
	cmp r0, 0xFE
	bhi _0803EBDE
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0803EBDE
	.align 2, 0
_0803EBB8: .4byte gUnknown_02024C0C
_0803EBBC: .4byte gBitTable
_0803EBC0: .4byte gUnknown_02024A60
_0803EBC4: .4byte gUnknown_030042E0
_0803EBC8:
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803EBDE
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	b _0803EE72
_0803EBDE:
	ldr r1, [sp, 0x24]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r4, [sp, 0x20]
	adds r1, r4, r1
	ldrb r1, [r1]
	str r1, [sp]
	adds r0, r1, 0
	cmp r0, 0xFE
	beq _0803EC20
	cmp r0, 0xFE
	bhi _0803EC00
	cmp r0, 0xFD
	beq _0803EC36
	b _0803EC40
_0803EC00:
	cmp r1, 0xFF
	bne _0803EC40
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	subs r4, r0
	str r4, [sp]
	b _0803EC40
_0803EC20:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	lsrs r0, 1
	str r0, [sp]
	cmp r0, 0
	bne _0803EC40
	movs r0, 0x1
	b _0803EC3E
_0803EC36:
	ldr r0, _0803ECF8 @ =0x02000000
	ldr r5, _0803ECFC @ =0x000160fa
	adds r0, r5
	ldrb r0, [r0]
_0803EC3E:
	str r0, [sp]
_0803EC40:
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	beq _0803ED20
	ldr r0, [sp, 0x14]
	cmp r0, 0
	bne _0803ED14
	mov r0, r8
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	cmp r1, r0
	bls _0803EC8C
	mov r0, r8
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	str r0, [sp]
_0803EC8C:
	mov r0, r8
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	ldr r0, _0803ED00 @ =gMain
	ldr r1, _0803ED04 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803ED1C
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803ED1C
	ldr r1, _0803ED08 @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldr r1, [sp]
	strh r1, [r0, 0x28]
	movs r0, 0x10
	mov r3, r10
	ands r0, r3
	cmp r0, 0
	bne _0803ED1C
	ldr r4, _0803ED0C @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803ED1C
	ldr r1, _0803ED10 @ =gUnknown_030042E0
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFE
	bhi _0803ECDC
	adds r0, 0x1
	strb r0, [r1, 0x3]
_0803ECDC:
	ldrb r5, [r4]
	add r0, sp, 0x34
	ldrb r0, [r0]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x00_a_b_0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	strb r5, [r4]
	b _0803ED1C
	.align 2, 0
_0803ECF8: .4byte 0x02000000
_0803ECFC: .4byte 0x000160fa
_0803ED00: .4byte gMain
_0803ED04: .4byte 0x0000043d
_0803ED08: .4byte gBattleMons
_0803ED0C: .4byte gUnknown_02024A60
_0803ED10: .4byte gUnknown_030042E0
_0803ED14:
	ldr r1, _0803ED2C @ =gUnknown_02024BEC
	ldr r0, [sp]
	negs r0, r0
	str r0, [r1]
_0803ED1C:
	movs r1, 0
	str r1, [sp, 0x1C]
_0803ED20:
	movs r0, 0xEF
	mov r2, r10
	ands r2, r0
	mov r10, r2
	b _0803EFDE
	.align 2, 0
_0803ED2C: .4byte gUnknown_02024BEC
_0803ED30:
	movs r7, 0x2
	mov r0, r10
	ands r0, r7
	cmp r0, 0
	beq _0803ED3C
	b _0803EE8C
_0803ED3C:
	movs r5, 0
	ldr r3, [sp, 0x24]
	adds r3, 0x1
	str r3, [sp, 0x38]
_0803ED44:
	movs r4, 0x11
	adds r4, r5
	mov r9, r4
	mov r0, r8
	mov r1, r9
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	adds r7, r5, 0
	adds r7, 0xD
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r5, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	beq _0803EE66
	ldr r2, [sp, 0x20]
	ldr r3, [sp, 0x24]
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	bls _0803EDFC
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	adds r2, r6, 0
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_0803EDFC:
	mov r0, r8
	mov r1, r9
	mov r2, sp
	bl SetMonData
	ldr r0, _0803EE78 @ =gMain
	ldr r4, _0803EE7C @ =0x0000043d
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803EE62
	ldr r0, [sp, 0x34]
	cmp r0, 0x4
	beq _0803EE62
	ldr r4, _0803EE80 @ =gBattleMons
	movs r0, 0x58
	ldr r1, [sp, 0x34]
	adds r3, r1, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 14
	ands r1, r0
	cmp r1, 0
	bne _0803EE62
	ldr r1, _0803EE84 @ =gUnknown_02024CA8
	ldr r2, [sp, 0x34]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0803EE88 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803EE62
	adds r0, r5, r3
	adds r1, r4, 0
	adds r1, 0x24
	adds r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_0803EE62:
	movs r3, 0
	str r3, [sp, 0x1C]
_0803EE66:
	adds r5, 0x1
	cmp r5, 0x3
	bgt _0803EE6E
	b _0803ED44
_0803EE6E:
	ldr r4, [sp, 0x38]
	lsls r0, r4, 24
_0803EE72:
	lsrs r0, 24
	str r0, [sp, 0x24]
	b _0803EFDE
	.align 2, 0
_0803EE78: .4byte gMain
_0803EE7C: .4byte 0x0000043d
_0803EE80: .4byte gBattleMons
_0803EE84: .4byte gUnknown_02024CA8
_0803EE88: .4byte gBitTable
_0803EE8C:
	ldr r6, [sp, 0x10]
	adds r6, 0x11
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r5, [sp, 0x10]
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp]
	cmp r2, r0
	bne _0803EED4
	b _0803EFDE
_0803EED4:
	ldr r1, [sp, 0x24]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
	ldr r0, [sp, 0x20]
	adds r1, r0, r1
	ldrb r0, [r1]
	adds r0, r2, r0
	str r0, [sp]
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r1, r0
	bls _0803EF48
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_0803EF48:
	mov r0, r8
	adds r1, r6, 0
	mov r2, sp
	bl SetMonData
	ldr r0, _0803EFB4 @ =gMain
	ldr r1, _0803EFB8 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _0803EFAC
	ldr r2, [sp, 0x34]
	cmp r2, 0x4
	beq _0803EFAC
	ldr r4, _0803EFBC @ =gBattleMons
	movs r0, 0x58
	adds r3, r2, 0
	muls r3, r0
	adds r0, r4, 0
	adds r0, 0x50
	adds r0, r3, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _0803EFAC
	ldr r1, _0803EFC0 @ =gUnknown_02024CA8
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _0803EFC4 @ =gBitTable
	ldr r5, [sp, 0x10]
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803EFAC
	adds r0, r5, r3
	adds r1, r4, 0
	adds r1, 0x24
	adds r0, r1
	ldr r1, [sp]
	strb r1, [r0]
_0803EFAC:
	movs r0, 0
	str r0, [sp, 0x1C]
	b _0803EFDE
	.align 2, 0
_0803EFB4: .4byte gMain
_0803EFB8: .4byte 0x0000043d
_0803EFBC: .4byte gBattleMons
_0803EFC0: .4byte gUnknown_02024CA8
_0803EFC4: .4byte gBitTable
_0803EFC8:
	mov r0, r8
	movs r1, 0x2
	ldr r2, [sp, 0x8]
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803EFDE
	bl _0803E530
_0803EFDE:
	ldr r1, [sp, 0x28]
	adds r1, 0x1
	str r1, [sp, 0x28]
	mov r2, r10
	lsrs r2, 1
	mov r10, r2
	cmp r2, 0
	beq _0803EFF0
	b _0803EA36
_0803EFF0:
	b _0803F320
_0803EFF2:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x18]
	adds r0, r3, r4
	ldrb r0, [r0]
	mov r10, r0
	movs r5, 0
	str r5, [sp, 0x28]
	cmp r0, 0
	bne _0803F006
	b _0803F320
_0803F006:
	movs r0, 0x1
	mov r1, r10
	ands r0, r1
	cmp r0, 0
	bne _0803F012
	b _0803F30E
_0803F012:
	ldr r2, [sp, 0x28]
	cmp r2, 0x7
	bls _0803F01A
	b _0803F30E
_0803F01A:
	lsls r0, r2, 2
	ldr r1, _0803F024 @ =_0803F028
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F024: .4byte _0803F028
	.align 2, 0
_0803F028:
	.4byte _0803F048
	.4byte _0803F048
	.4byte _0803F048
	.4byte _0803F048
	.4byte _0803F0CC
	.4byte _0803F1A0
	.4byte _0803F1FA
	.4byte _0803F250
_0803F048:
	mov r0, r8
	bl GetMonEVCount
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0803F090 @ =0x000001fd
	cmp r5, r0
	bls _0803F05C
	bl _0803E540
_0803F05C:
	ldr r0, _0803F094 @ =gUnknown_082082F2
	ldr r4, [sp, 0x28]
	adds r4, 0x2
	adds r0, r4, r0
	ldrb r1, [r0]
	mov r0, r8
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	adds r2, r4, 0
	cmp r1, 0x63
	bls _0803F07A
	b _0803F30E
_0803F07A:
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x64
	bls _0803F098
	adds r0, 0x64
	subs r4, r0, r1
	b _0803F09A
	.align 2, 0
_0803F090: .4byte 0x000001fd
_0803F094: .4byte gUnknown_082082F2
_0803F098:
	adds r4, r0, 0
_0803F09A:
	adds r1, r5, r4
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	bls _0803F0A8
	adds r0, r4, r0
	subs r4, r0, r1
_0803F0A8:
	ldr r0, [sp]
	adds r0, r4
	str r0, [sp]
	ldr r0, _0803F0C8 @ =gUnknown_082082F2
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, r8
	mov r2, sp
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	movs r5, 0
	str r5, [sp, 0x1C]
	b _0803F304
	.align 2, 0
_0803F0C8: .4byte gUnknown_082082F2
_0803F0CC:
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	ldr r1, _0803F194 @ =gUnknown_08208238
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	ldrb r1, [r1]
	ands r0, r1
	lsls r1, r2, 1
	lsrs r0, r1
	str r0, [sp]
	cmp r0, 0x2
	bls _0803F0EC
	b _0803F30E
_0803F0EC:
	adds r5, r2, 0
	adds r5, 0xD
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r1, _0803F198 @ =gUnknown_0820823C
	ldr r3, [sp, 0x10]
	adds r1, r3, r1
	ldrb r2, [r1]
	ands r2, r0
	str r2, [sp]
	ldr r0, _0803F19C @ =gUnknown_08208240
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r2, r0
	str r2, [sp]
	mov r0, r8
	movs r1, 0x15
	mov r2, sp
	bl SetMonData
	mov r0, r8
	adds r1, r5, 0
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [sp, 0x10]
	bl CalculatePPWithBonus
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4
	str r0, [sp]
	ldr r4, [sp, 0x10]
	adds r4, 0x11
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	bl GetMonData
	ldr r1, [sp]
	adds r0, r1
	str r0, [sp]
	mov r0, r8
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	movs r4, 0
	str r4, [sp, 0x1C]
	b _0803F30E
	.align 2, 0
_0803F194: .4byte gUnknown_08208238
_0803F198: .4byte gUnknown_0820823C
_0803F19C: .4byte gUnknown_08208240
_0803F1A0:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _0803F1B0
	b _0803F304
_0803F1B0:
	ldr r5, [sp, 0x1C]
	cmp r5, 0
	beq _0803F1B8
	b _0803F304
_0803F1B8:
	ldr r0, [sp, 0x2C]
	cmp r0, 0
	beq _0803F1C0
	b _0803F304
_0803F1C0:
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	str r5, [sp, 0x4]
	ldr r3, [sp, 0x2C]
	lsls r4, r3, 24
	asrs r1, r4, 24
	cmp r1, 0
	ble _0803F2A4
	ldr r0, [sp, 0x30]
	cmp r0, 0x1B
	bne _0803F2A4
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, r5, r0
	str r0, [sp, 0x4]
	adds r2, r4, 0
	b _0803F2B0
_0803F1FA:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0x63
	bls _0803F304
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bhi _0803F304
	ldr r2, [sp, 0x1C]
	cmp r2, 0
	bne _0803F304
	ldr r3, [sp, 0x2C]
	cmp r3, 0
	bne _0803F304
	ldr r4, [sp, 0x20]
	ldr r5, [sp, 0x24]
	adds r0, r4, r5
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	str r4, [sp, 0x4]
	ldr r0, [sp, 0x2C]
	lsls r5, r0, 24
	asrs r1, r5, 24
	cmp r1, 0
	ble _0803F24A
	ldr r2, [sp, 0x30]
	cmp r2, 0x1B
	beq _0803F292
_0803F24A:
	ldr r3, [sp, 0x2C]
	lsls r2, r3, 24
	b _0803F2A8
_0803F250:
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	cmp r0, 0xC7
	bls _0803F304
	ldr r4, [sp, 0x1C]
	cmp r4, 0
	bne _0803F304
	ldr r5, [sp, 0x2C]
	cmp r5, 0
	bne _0803F304
	ldr r1, [sp, 0x20]
	ldr r2, [sp, 0x24]
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, 0x2C]
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	str r4, [sp, 0x4]
	ldr r3, [sp, 0x2C]
	lsls r5, r3, 24
	asrs r1, r5, 24
	cmp r1, 0
	ble _0803F2A4
	ldr r0, [sp, 0x30]
	cmp r0, 0x1B
	bne _0803F2A4
_0803F292:
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, r4, r0
	str r0, [sp, 0x4]
	adds r2, r5, 0
	b _0803F2B0
_0803F2A4:
	ldr r1, [sp, 0x2C]
	lsls r2, r1, 24
_0803F2A8:
	asrs r1, r2, 24
	ldr r0, [sp, 0x4]
	adds r0, r1
	str r0, [sp, 0x4]
_0803F2B0:
	cmp r2, 0
	ble _0803F2E6
	mov r0, r8
	movs r1, 0x26
	movs r2, 0
	bl GetMonData
	cmp r0, 0xB
	bne _0803F2C8
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_0803F2C8:
	mov r0, r8
	movs r1, 0x23
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _0803F2E6
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
_0803F2E6:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	bge _0803F2F0
	movs r0, 0
	str r0, [sp, 0x4]
_0803F2F0:
	ldr r0, [sp, 0x4]
	cmp r0, 0xFF
	ble _0803F2FA
	movs r0, 0xFF
	str r0, [sp, 0x4]
_0803F2FA:
	add r2, sp, 0x4
	mov r0, r8
	movs r1, 0x20
	bl SetMonData
_0803F304:
	ldr r0, [sp, 0x24]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x24]
_0803F30E:
	ldr r2, [sp, 0x28]
	adds r2, 0x1
	str r2, [sp, 0x28]
	mov r3, r10
	lsrs r3, 1
	mov r10, r3
	cmp r3, 0
	beq _0803F320
	b _0803F006
_0803F320:
	ldr r4, [sp, 0x18]
	adds r4, 0x1
	str r4, [sp, 0x18]
	cmp r4, 0x5
	bgt _0803F32E
	bl _0803E54C
_0803F32E:
	ldr r0, [sp, 0x1C]
_0803F330:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803E1B0

	thumb_func_start HealStatusConditions
HealStatusConditions: @ 803F340
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r2, 0
	lsls r3, 24
	lsrs r6, r3, 24
	movs r1, 0x37
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	str r1, [sp]
	ands r0, r4
	cmp r0, 0
	beq _0803F3A4
	mvns r4, r4
	ands r1, r4
	str r1, [sp]
	adds r0, r5, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	ldr r0, _0803F398 @ =gMain
	ldr r1, _0803F39C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803F392
	cmp r6, 0x4
	beq _0803F392
	ldr r0, _0803F3A0 @ =gBattleMons
	movs r1, 0x58
	muls r1, r6
	adds r0, 0x4C
	adds r1, r0
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
_0803F392:
	movs r0, 0
	b _0803F3A6
	.align 2, 0
_0803F398: .4byte gMain
_0803F39C: .4byte 0x0000043d
_0803F3A0: .4byte gBattleMons
_0803F3A4:
	movs r0, 0x1
_0803F3A6:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end HealStatusConditions

	thumb_func_start sub_803F1DC
sub_803F1DC: @ 803F3B0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r7, 0x6
	ldr r1, _0803F3D8 @ =gItemEffectTable
	adds r0, r3, 0
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0803F3DC
	cmp r3, 0xAF
	beq _0803F3E0
_0803F3D4:
	movs r0, 0
	b _0803F4F0
	.align 2, 0
_0803F3D8: .4byte gItemEffectTable
_0803F3DC:
	cmp r3, 0xAF
	bne _0803F3EE
_0803F3E0:
	ldr r0, _0803F400 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803F404 @ =gUnknown_02024DF8
	adds r0, r1
_0803F3EE:
	mov r12, r0
	movs r2, 0
_0803F3F2:
	cmp r2, 0x4
	beq _0803F412
	cmp r2, 0x4
	ble _0803F408
	cmp r2, 0x5
	beq _0803F49C
	b _0803F4E6
	.align 2, 0
_0803F400: .4byte gUnknown_02024A60
_0803F404: .4byte gUnknown_02024DF8
_0803F408:
	cmp r2, 0
	blt _0803F4E6
	cmp r2, r4
	bne _0803F4E6
	b _0803F3D4
_0803F412:
	mov r0, r12
	ldrb r3, [r0, 0x4]
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0803F422
	movs r0, 0xDF
	ands r3, r0
_0803F422:
	movs r6, 0
	cmp r3, 0
	beq _0803F4E6
_0803F428:
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0803F488
	cmp r6, 0x7
	bhi _0803F488
	lsls r0, r6, 2
	ldr r1, _0803F440 @ =_0803F444
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F440: .4byte _0803F444
	.align 2, 0
_0803F444:
	.4byte _0803F470
	.4byte _0803F470
	.4byte _0803F464
	.4byte _0803F470
	.4byte _0803F488
	.4byte _0803F488
	.4byte _0803F488
	.4byte _0803F484
_0803F464:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0803F470
	movs r0, 0xEF
	ands r3, r0
_0803F470:
	cmp r2, r4
	bne _0803F47C
	adds r0, r3, 0
	ands r0, r5
	cmp r0, 0
	bne _0803F4EE
_0803F47C:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _0803F488
_0803F484:
	cmp r2, r4
	beq _0803F3D4
_0803F488:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsrs r3, 1
	cmp r2, r4
	bne _0803F496
	lsrs r5, 1
_0803F496:
	cmp r3, 0
	bne _0803F428
	b _0803F4E6
_0803F49C:
	mov r0, r12
	ldrb r3, [r0, 0x5]
	movs r6, 0
_0803F4A2:
	cmp r3, 0
	beq _0803F4E6
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0803F4D6
	cmp r6, 0
	blt _0803F4D6
	cmp r6, 0x6
	ble _0803F4BC
	cmp r6, 0x7
	beq _0803F4D0
	b _0803F4D6
_0803F4BC:
	cmp r2, r4
	bne _0803F4C8
	adds r0, r3, 0
	ands r0, r5
	cmp r0, 0
	bne _0803F4EE
_0803F4C8:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _0803F4D6
_0803F4D0:
	cmp r2, r4
	bne _0803F4D6
	b _0803F3D4
_0803F4D6:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsrs r3, 1
	cmp r2, r4
	bne _0803F4A2
	lsrs r5, 1
	b _0803F4A2
_0803F4E6:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _0803F4EE
	b _0803F3F2
_0803F4EE:
	adds r0, r7, 0
_0803F4F0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_803F1DC

	thumb_func_start sub_803F324
sub_803F324: @ 803F4F8
	push {lr}
	ldr r2, _0803F52C @ =gUnknown_02024C08
	ldr r1, _0803F530 @ =gUnknown_02024E6C
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r3, _0803F534 @ =gUnknown_030041C0
	ldr r2, _0803F538 @ =gUnknown_08400F58
	ldr r1, _0803F53C @ =gUnknown_082082F8
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, [r0]
	adds r0, r3, 0
	bl StringCopy
	ldr r0, _0803F540 @ =gUnknown_03004290
	ldr r1, _0803F544 @ =gUnknown_083FFDB3
	bl StringCopy
	ldr r0, _0803F548 @ =gUnknown_083FFDD3
	bl get_battle_strings_
	pop {r0}
	bx r0
	.align 2, 0
_0803F52C: .4byte gUnknown_02024C08
_0803F530: .4byte gUnknown_02024E6C
_0803F534: .4byte gUnknown_030041C0
_0803F538: .4byte gUnknown_08400F58
_0803F53C: .4byte gUnknown_082082F8
_0803F540: .4byte gUnknown_03004290
_0803F544: .4byte gUnknown_083FFDB3
_0803F548: .4byte gUnknown_083FFDD3
	thumb_func_end sub_803F324

	thumb_func_start sub_803F378
sub_803F378: @ 803F54C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803F594
	ldr r0, _0803F57C @ =gMain
	ldr r1, _0803F580 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803F58C
	ldr r2, _0803F584 @ =gUnknown_02024E6C
	ldrb r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _0803F588 @ =gUnknown_02024DF8
	adds r7, r0, r1
	b _0803F5A0
	.align 2, 0
_0803F57C: .4byte gMain
_0803F580: .4byte 0x0000043d
_0803F584: .4byte gUnknown_02024E6C
_0803F588: .4byte gUnknown_02024DF8
_0803F58C:
	ldr r7, _0803F590 @ =0x02028daa
	b _0803F59E
	.align 2, 0
_0803F590: .4byte 0x02028daa
_0803F594:
	ldr r1, _0803F5D8 @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r7, [r0]
_0803F59E:
	ldr r2, _0803F5DC @ =gUnknown_02024E6C
_0803F5A0:
	ldr r1, _0803F5E0 @ =gUnknown_02024C0B
	ldrb r0, [r2]
	strb r0, [r1]
	movs r5, 0
	ldr r0, _0803F5E4 @ =gUnknown_02024C07
	mov r8, r0
	movs r6, 0
_0803F5AE:
	adds r4, r7, r5
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _0803F5C0
	adds r0, r6, 0
	bl sub_803F324
_0803F5C0:
	ldrb r1, [r4]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _0803F5F6
	cmp r5, 0
	beq _0803F5E8
	adds r0, r6, 0x1
	bl sub_803F324
	b _0803F5F6
	.align 2, 0
_0803F5D8: .4byte gItemEffectTable
_0803F5DC: .4byte gUnknown_02024E6C
_0803F5E0: .4byte gUnknown_02024C0B
_0803F5E4: .4byte gUnknown_02024C07
_0803F5E8:
	ldr r0, _0803F624 @ =gUnknown_02024E6C
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0803F628 @ =gUnknown_083FEE92
	bl get_battle_strings_
_0803F5F6:
	adds r6, 0x2
	adds r5, 0x1
	cmp r5, 0x2
	ble _0803F5AE
	ldrb r1, [r7, 0x3]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0803F616
	ldr r1, _0803F62C @ =gUnknown_02024C07
	ldr r0, _0803F624 @ =gUnknown_02024E6C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0803F630 @ =gUnknown_083FEE5D
	bl get_battle_strings_
_0803F616:
	ldr r0, _0803F634 @ =gUnknown_020238CC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F624: .4byte gUnknown_02024E6C
_0803F628: .4byte gUnknown_083FEE92
_0803F62C: .4byte gUnknown_02024C07
_0803F630: .4byte gUnknown_083FEE5D
_0803F634: .4byte gUnknown_020238CC
	thumb_func_end sub_803F378

	thumb_func_start GetNature
GetNature: @ 803F638
	push {lr}
	movs r1, 0
	movs r2, 0
	bl GetMonData
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNature

	thumb_func_start GetNatureFromPersonality
GetNatureFromPersonality: @ 803F650
	push {lr}
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNatureFromPersonality

	thumb_func_start GetEvolutionTargetSpecies
GetEvolutionTargetSpecies: @ 803F660
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	movs r0, 0
	mov r10, r0
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	mov r0, r8
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x17
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsrs r4, 16
	str r4, [sp, 0x10]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0xAF
	bne _0803F6D4
	ldr r0, _0803F6CC @ =gSaveBlock1
	ldr r1, _0803F6D0 @ =0x00003688
	adds r0, r1
	ldrb r0, [r0]
	b _0803F6DC
	.align 2, 0
_0803F6CC: .4byte gSaveBlock1
_0803F6D0: .4byte 0x00003688
_0803F6D4:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_0803F6DC:
	cmp r0, 0x26
	bne _0803F6E8
	cmp r5, 0x3
	beq _0803F6E8
	movs r0, 0
	b _0803F978
_0803F6E8:
	cmp r5, 0x1
	bne _0803F6EE
	b _0803F908
_0803F6EE:
	cmp r5, 0x1
	bgt _0803F6F8
	cmp r5, 0
	beq _0803F70C
	b _0803F976
_0803F6F8:
	cmp r5, 0x3
	ble _0803F6FE
	b _0803F976
_0803F6FE:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r3, _0803F708 @ =gEvolutionTable
	lsls r6, r7, 2
	b _0803F956
	.align 2, 0
_0803F708: .4byte gEvolutionTable
_0803F70C:
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r8
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r6, r7, 2
_0803F732:
	ldr r1, _0803F758 @ =gEvolutionTable
	ldr r0, [sp, 0x4]
	lsls r2, r0, 3
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r2, r0
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	adds r3, r1, 0
	adds r4, r2, 0
	cmp r0, 0xE
	bls _0803F74E
	b _0803F8FA
_0803F74E:
	lsls r0, 2
	ldr r1, _0803F75C @ =_0803F760
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F758: .4byte gEvolutionTable
_0803F75C: .4byte _0803F760
	.align 2, 0
_0803F760:
	.4byte _0803F79C
	.4byte _0803F7AE
	.4byte _0803F7D0
	.4byte _0803F800
	.4byte _0803F8FA
	.4byte _0803F8FA
	.4byte _0803F8FA
	.4byte _0803F810
	.4byte _0803F83A
	.4byte _0803F864
	.4byte _0803F892
	.4byte _0803F8B2
	.4byte _0803F8D6
	.4byte _0803F8FA
	.4byte _0803F8E6
_0803F79C:
	ldr r1, [sp, 0x8]
	cmp r1, 0xDB
	bhi _0803F7A4
	b _0803F8FA
_0803F7A4:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r0, r3
	b _0803F7F0
_0803F7AE:
	bl RtcCalcLocalTime
	ldr r0, _0803F7CC @ =gLocalTime
	ldrb r0, [r0, 0x2]
	subs r0, 0xC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _0803F7C2
	b _0803F8FA
_0803F7C2:
	ldr r2, [sp, 0x8]
	cmp r2, 0xDB
	bhi _0803F7CA
	b _0803F8FA
_0803F7CA:
	b _0803F7E6
	.align 2, 0
_0803F7CC: .4byte gLocalTime
_0803F7D0:
	bl RtcCalcLocalTime
	ldr r0, _0803F7F8 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	cmp r0, 0xB
	bls _0803F7DE
	b _0803F8FA
_0803F7DE:
	ldr r0, [sp, 0x8]
	cmp r0, 0xDB
	bhi _0803F7E6
	b _0803F8FA
_0803F7E6:
	ldr r1, _0803F7FC @ =gEvolutionTable
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r0, r1
_0803F7F0:
	ldrh r0, [r0, 0x4]
	mov r10, r0
	b _0803F8FA
	.align 2, 0
_0803F7F8: .4byte gLocalTime
_0803F7FC: .4byte gEvolutionTable
_0803F800:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	b _0803F8F6
_0803F810:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bls _0803F8FA
	b _0803F88C
_0803F83A:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bne _0803F8FA
	b _0803F88C
_0803F864:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r5, r0, r3
	ldrh r0, [r5, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	mov r0, r8
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	mov r0, r8
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bcs _0803F8FA
_0803F88C:
	ldrh r5, [r5, 0x4]
	mov r10, r5
	b _0803F8FA
_0803F892:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r4, r0, r3
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	ldr r0, [sp, 0x10]
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _0803F8FA
	b _0803F8D0
_0803F8B2:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r4, r0, r3
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	ldr r0, [sp, 0x10]
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _0803F8FA
_0803F8D0:
	ldrh r4, [r4, 0x4]
	mov r10, r4
	b _0803F8FA
_0803F8D6:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	bhi _0803F8FA
	b _0803F8F6
_0803F8E6:
	adds r0, r6, r7
	lsls r0, 3
	adds r0, r4, r0
	adds r1, r0, r3
	ldrh r0, [r1, 0x2]
	ldr r2, [sp, 0xC]
	cmp r0, r2
	bhi _0803F8FA
_0803F8F6:
	ldrh r1, [r1, 0x4]
	mov r10, r1
_0803F8FA:
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	str r0, [sp, 0x4]
	cmp r0, 0x4
	bgt _0803F906
	b _0803F732
_0803F906:
	b _0803F976
_0803F908:
	lsls r6, r7, 2
	ldr r1, _0803F94C @ =gEvolutionTable
	adds r0, r6, r7
	lsls r0, 3
	adds r4, r0, r1
	mov r5, sp
	movs r1, 0x4
	str r1, [sp, 0x4]
_0803F918:
	ldrh r0, [r4]
	cmp r0, 0x5
	beq _0803F938
	cmp r0, 0x6
	bne _0803F93C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5]
	cmp r0, r1
	bne _0803F93C
	movs r0, 0
	strh r0, [r5]
	mov r0, r8
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
_0803F938:
	ldrh r2, [r4, 0x4]
	mov r10, r2
_0803F93C:
	adds r4, 0x8
	ldr r0, [sp, 0x4]
	subs r0, 0x1
	str r0, [sp, 0x4]
	cmp r0, 0
	bge _0803F918
	b _0803F976
	.align 2, 0
_0803F94C: .4byte gEvolutionTable
_0803F950:
	ldrh r1, [r1, 0x4]
	mov r10, r1
	b _0803F976
_0803F956:
	adds r0, r6, r7
	ldr r1, [sp, 0x4]
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, 0x7
	bne _0803F96C
	ldrh r0, [r1, 0x2]
	cmp r0, r9
	beq _0803F950
_0803F96C:
	ldr r2, [sp, 0x4]
	adds r2, 0x1
	str r2, [sp, 0x4]
	cmp r2, 0x4
	ble _0803F956
_0803F976:
	mov r0, r10
_0803F978:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetEvolutionTargetSpecies

	thumb_func_start HoennPokedexNumToSpecies
HoennPokedexNumToSpecies: @ 803F988
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0803F9CC
	movs r1, 0
	ldr r3, _0803F9C4 @ =gSpeciesToHoennPokedexNum
	ldrh r0, [r3]
	cmp r0, r2
	beq _0803F9B4
	movs r4, 0xCD
	lsls r4, 1
_0803F9A0:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0803F9B4
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0803F9A0
_0803F9B4:
	ldr r0, _0803F9C8 @ =0x0000019b
	cmp r1, r0
	beq _0803F9CC
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0803F9CE
	.align 2, 0
_0803F9C4: .4byte gSpeciesToHoennPokedexNum
_0803F9C8: .4byte 0x0000019b
_0803F9CC:
	movs r0, 0
_0803F9CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end HoennPokedexNumToSpecies

	thumb_func_start NationalPokedexNumToSpecies
NationalPokedexNumToSpecies: @ 803F9D4
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0803FA18
	movs r1, 0
	ldr r3, _0803FA10 @ =gSpeciesToNationalPokedexNum
	ldrh r0, [r3]
	cmp r0, r2
	beq _0803FA00
	movs r4, 0xCD
	lsls r4, 1
_0803F9EC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0803FA00
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0803F9EC
_0803FA00:
	ldr r0, _0803FA14 @ =0x0000019b
	cmp r1, r0
	beq _0803FA18
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0803FA1A
	.align 2, 0
_0803FA10: .4byte gSpeciesToNationalPokedexNum
_0803FA14: .4byte 0x0000019b
_0803FA18:
	movs r0, 0
_0803FA1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalPokedexNumToSpecies

	thumb_func_start NationalToHoennOrder
NationalToHoennOrder: @ 803FA20
	push {r4,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _0803FA64
	movs r1, 0
	ldr r3, _0803FA5C @ =gHoennToNationalOrder
	ldrh r0, [r3]
	cmp r0, r2
	beq _0803FA4C
	movs r4, 0xCD
	lsls r4, 1
_0803FA38:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bhi _0803FA4C
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0803FA38
_0803FA4C:
	ldr r0, _0803FA60 @ =0x0000019b
	cmp r1, r0
	beq _0803FA64
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	b _0803FA66
	.align 2, 0
_0803FA5C: .4byte gHoennToNationalOrder
_0803FA60: .4byte 0x0000019b
_0803FA64:
	movs r0, 0
_0803FA66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end NationalToHoennOrder

	thumb_func_start SpeciesToNationalPokedexNum
SpeciesToNationalPokedexNum: @ 803FA6C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803FA88
	ldr r0, _0803FA84 @ =gSpeciesToNationalPokedexNum
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803FA8A
	.align 2, 0
_0803FA84: .4byte gSpeciesToNationalPokedexNum
_0803FA88:
	movs r0, 0
_0803FA8A:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToNationalPokedexNum

	thumb_func_start SpeciesToHoennPokedexNum
SpeciesToHoennPokedexNum: @ 803FA90
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803FAAC
	ldr r0, _0803FAA8 @ =gSpeciesToHoennPokedexNum
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803FAAE
	.align 2, 0
_0803FAA8: .4byte gSpeciesToHoennPokedexNum
_0803FAAC:
	movs r0, 0
_0803FAAE:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToHoennPokedexNum

	thumb_func_start HoennToNationalOrder
HoennToNationalOrder: @ 803FAB4
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0803FAD0
	ldr r0, _0803FACC @ =gHoennToNationalOrder
	subs r1, 0x1
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803FAD2
	.align 2, 0
_0803FACC: .4byte gHoennToNationalOrder
_0803FAD0:
	movs r0, 0
_0803FAD2:
	pop {r1}
	bx r1
	thumb_func_end HoennToNationalOrder

	thumb_func_start SpeciesToCryId
SpeciesToCryId: @ 803FAD8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0xFA
	bls _0803FB06
	ldr r0, _0803FAF8 @ =0x00000113
	cmp r1, r0
	bls _0803FB04
	ldr r0, _0803FAFC @ =gSpeciesIdToCryId
	ldr r2, _0803FB00 @ =0xfffffeec
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	b _0803FB06
	.align 2, 0
_0803FAF8: .4byte 0x00000113
_0803FAFC: .4byte gSpeciesIdToCryId
_0803FB00: .4byte 0xfffffeec
_0803FB04:
	movs r0, 0xC8
_0803FB06:
	pop {r1}
	bx r1
	thumb_func_end SpeciesToCryId

	thumb_func_start unref_sub_803F938
unref_sub_803F938: @ 803FB0C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r1, 0
	mov r10, r2
	lsls r0, 16
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _0803FC16
	ldr r1, _0803FBD8 @ =gUnknown_081FAF4C
	ldr r0, [r1]
	cmp r10, r0
	beq _0803FC16
	ldr r0, [r1, 0x8]
	cmp r10, r0
	beq _0803FC16
	movs r6, 0
_0803FB36:
	lsls r3, r6, 3
	adds r3, r6
	lsls r3, 2
	ldr r0, _0803FBDC @ =gSpindaSpotGraphics
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, 0xF8
	movs r2, 0xF
	adds r0, r5, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	ldrb r1, [r4, 0x1]
	adds r1, 0xF8
	movs r0, 0xF0
	ands r0, r5
	lsrs r0, 4
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	lsrs r5, 8
	str r5, [sp, 0x4]
	adds r6, 0x1
	str r6, [sp]
	mov r9, r3
_0803FB6E:
	lsls r0, r2, 1
	add r0, r9
	ldr r3, _0803FBE0 @ =0x08209b56
	adds r0, r3
	ldrh r3, [r0]
	mov r4, r12
	adds r0, r4, 0
	adds r0, 0x10
	adds r7, r1, 0x1
	adds r2, 0x1
	mov r8, r2
	cmp r4, r0
	bge _0803FC04
	lsrs r0, r1, 3
	lsls r6, r0, 8
	movs r0, 0x7
	ands r1, r0
	lsls r5, r1, 2
_0803FB92:
	adds r0, r4, 0
	cmp r4, 0
	bge _0803FB9A
	adds r0, r4, 0x7
_0803FB9A:
	asrs r0, 3
	lsls r2, r0, 5
	add r2, r10
	lsls r0, 3
	subs r0, r4, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	adds r2, r6
	adds r2, r5
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FBF8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FBE4
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	bhi _0803FBF8
	adds r0, r1, 0
	adds r0, 0x40
	b _0803FBF6
	.align 2, 0
_0803FBD8: .4byte gUnknown_081FAF4C
_0803FBDC: .4byte gSpindaSpotGraphics
_0803FBE0: .4byte 0x08209b56
_0803FBE4:
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0803FBF8
	adds r0, r1, 0x4
_0803FBF6:
	strb r0, [r2]
_0803FBF8:
	asrs r3, 1
	adds r4, 0x1
	mov r0, r12
	adds r0, 0x10
	cmp r4, r0
	blt _0803FB92
_0803FC04:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	mov r2, r8
	cmp r2, 0xF
	ble _0803FB6E
	ldr r5, [sp, 0x4]
	ldr r6, [sp]
	cmp r6, 0x3
	ble _0803FB36
_0803FC16:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_803F938

	thumb_func_start DrawSpindaSpots
DrawSpindaSpots: @ 803FC28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r1, 0
	str r2, [sp]
	lsls r0, 16
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x9A
	lsls r1, 17
	cmp r0, r1
	bne _0803FD2A
	cmp r3, 0
	beq _0803FD2A
	movs r6, 0
_0803FC4C:
	lsls r3, r6, 3
	adds r3, r6
	lsls r3, 2
	ldr r0, _0803FCF0 @ =gSpindaSpotGraphics
	adds r4, r3, r0
	ldrb r1, [r4]
	adds r1, 0xF8
	movs r2, 0xF
	adds r0, r5, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	ldrb r1, [r4, 0x1]
	adds r1, 0xF8
	movs r0, 0xF0
	ands r0, r5
	lsrs r0, 4
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	lsrs r5, 8
	str r5, [sp, 0x4]
	adds r6, 0x1
	mov r10, r6
	mov r9, r3
_0803FC84:
	lsls r0, r2, 1
	add r0, r9
	ldr r3, _0803FCF4 @ =0x08209b56
	adds r0, r3
	ldrh r3, [r0]
	mov r4, r12
	adds r0, r4, 0
	adds r0, 0x10
	adds r7, r1, 0x1
	adds r2, 0x1
	mov r8, r2
	cmp r4, r0
	bge _0803FD18
	lsrs r0, r1, 3
	lsls r6, r0, 8
	movs r0, 0x7
	ands r1, r0
	lsls r5, r1, 2
_0803FCA8:
	adds r0, r4, 0
	cmp r4, 0
	bge _0803FCB0
	adds r0, r4, 0x7
_0803FCB0:
	asrs r0, 3
	lsls r2, r0, 5
	ldr r1, [sp]
	adds r2, r1, r2
	lsls r0, 3
	subs r0, r4, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	adds r2, r6
	adds r2, r5
	movs r1, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FD0C
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0803FCF8
	ldrb r1, [r2]
	movs r0, 0xF0
	ands r0, r1
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	bhi _0803FD0C
	adds r0, r1, 0
	adds r0, 0x40
	b _0803FD0A
	.align 2, 0
_0803FCF0: .4byte gSpindaSpotGraphics
_0803FCF4: .4byte 0x08209b56
_0803FCF8:
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0803FD0C
	adds r0, r1, 0x4
_0803FD0A:
	strb r0, [r2]
_0803FD0C:
	asrs r3, 1
	adds r4, 0x1
	mov r0, r12
	adds r0, 0x10
	cmp r4, r0
	blt _0803FCA8
_0803FD18:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	mov r2, r8
	cmp r2, 0xF
	ble _0803FC84
	ldr r5, [sp, 0x4]
	mov r6, r10
	cmp r6, 0x3
	ble _0803FC4C
_0803FD2A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawSpindaSpots

	thumb_func_start sub_803FB68
sub_803FB68: @ 803FD3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _0803FDA8 @ =gStringVar1
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x2
	mov r2, r9
	bl GetMonData
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, sp
	bl GetMonData
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _0803FD98
	movs r6, 0xB
	adds r0, r7, 0
	muls r0, r6
	ldr r4, _0803FDAC @ =gSpeciesNames
	adds r0, r4
	mov r1, r9
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _0803FD98
	mov r2, r8
	muls r2, r6
	adds r2, r4
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
_0803FD98:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FDA8: .4byte gStringVar1
_0803FDAC: .4byte gSpeciesNames
	thumb_func_end sub_803FB68

	thumb_func_start sub_803FBBC
sub_803FBBC: @ 803FDB0
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _0803FDD8 @ =gLinkPlayers
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x18]
	cmp r0, 0x2
	bgt _0803FDDC
	cmp r0, 0x1
	bge _0803FDE4
	cmp r0, 0
	beq _0803FDE0
	b _0803FDE6
	.align 2, 0
_0803FDD8: .4byte gLinkPlayers
_0803FDDC:
	cmp r0, 0x3
	bne _0803FDE6
_0803FDE0:
	movs r5, 0
	b _0803FDE6
_0803FDE4:
	movs r5, 0x1
_0803FDE6:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_803FBBC

	thumb_func_start sub_803FBFC
sub_803FBFC: @ 803FDF0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	ldr r2, _0803FE14 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x18]
	cmp r0, 0x2
	bgt _0803FE18
	cmp r0, 0x1
	bge _0803FE20
	cmp r0, 0
	beq _0803FE1C
	b _0803FE22
	.align 2, 0
_0803FE14: .4byte gLinkPlayers
_0803FE18:
	cmp r0, 0x3
	bne _0803FE22
_0803FE1C:
	movs r3, 0
	b _0803FE22
_0803FE20:
	movs r3, 0x1
_0803FE22:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_803FBFC

	thumb_func_start sub_803FC34
sub_803FC34: @ 803FE28
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r1, _0803FE34 @ =gLinkPlayers
	b _0803FE40
	.align 2, 0
_0803FE34: .4byte gLinkPlayers
_0803FE38:
	adds r1, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	bgt _0803FE46
_0803FE40:
	ldrh r0, [r1, 0x18]
	cmp r0, r3
	bne _0803FE38
_0803FE46:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_803FC34

	thumb_func_start sub_803FC58
sub_803FC58: @ 803FE4C
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _0803FE64 @ =gTrainers
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0x2]
	movs r0, 0x7F
	ands r0, r1
	bx lr
	.align 2, 0
_0803FE64: .4byte gTrainers
	thumb_func_end sub_803FC58

	thumb_func_start nature_stat_mod
nature_stat_mod: @ 803FE68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0xFF
	lsls r0, 24
	adds r2, r0
	lsrs r2, 24
	cmp r2, 0x4
	bls _0803FE86
	adds r0, r3, 0
	b _0803FEC2
_0803FE86:
	ldr r0, _0803FEA8 @ =gNatureStatTable
	lsls r1, r4, 2
	adds r1, r4
	subs r1, 0x1
	adds r1, r5, r1
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0803FEAC
	cmp r1, 0x1
	bne _0803FEC0
	movs r0, 0x6E
	b _0803FEAE
	.align 2, 0
_0803FEA8: .4byte gNatureStatTable
_0803FEAC:
	movs r0, 0x5A
_0803FEAE:
	muls r0, r3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	b _0803FEC2
_0803FEC0:
	adds r0, r3, 0
_0803FEC2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end nature_stat_mod

	thumb_func_start AdjustFriendship
AdjustFriendship: @ 803FEC8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803FF28
	ldr r0, _0803FF08 @ =gMain
	ldr r1, _0803FF0C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803FF14
	ldr r0, _0803FF10 @ =gEnigmaBerries
	ldrb r4, [r0, 0x7]
	b _0803FF30
	.align 2, 0
_0803FF08: .4byte gMain
_0803FF0C: .4byte 0x0000043d
_0803FF10: .4byte gEnigmaBerries
_0803FF14:
	ldr r0, _0803FF20 @ =gSaveBlock1
	ldr r1, _0803FF24 @ =0x00003688
	adds r0, r1
	ldrb r4, [r0]
	b _0803FF30
	.align 2, 0
_0803FF20: .4byte gSaveBlock1
_0803FF24: .4byte 0x00003688
_0803FF28:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r4, r0, 24
_0803FF30:
	cmp r6, 0
	bne _0803FF36
	b _0804004A
_0803FF36:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	bne _0803FF40
	b _0804004A
_0803FF40:
	movs r6, 0
	adds r0, r7, 0
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x63
	ble _0803FF5E
	movs r6, 0x1
_0803FF5E:
	cmp r0, 0xC7
	ble _0803FF68
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803FF68:
	cmp r5, 0x5
	bne _0803FF78
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _0804004A
_0803FF78:
	cmp r5, 0x3
	bne _0803FFA8
	ldr r0, _08040054 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0804004A
	ldr r2, _08040058 @ =gTrainers
	ldr r0, _0804005C @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1]
	adds r0, r1, 0
	subs r0, 0x18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0803FFA8
	cmp r1, 0x20
	bne _0804004A
_0803FFA8:
	ldr r1, _08040060 @ =gUnknown_082082FE
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r1, 0
	ble _0803FFCE
	cmp r4, 0x1B
	bne _0803FFCE
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
_0803FFCE:
	lsls r2, 24
	asrs r2, 24
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, r2
	mov r1, sp
	strh r0, [r1]
	cmp r2, 0
	ble _08040020
	adds r0, r7, 0
	movs r1, 0x26
	movs r2, 0
	bl GetMonData
	cmp r0, 0xB
	bne _0803FFFC
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x1
	mov r1, sp
	strh r0, [r1]
_0803FFFC:
	adds r0, r7, 0
	movs r1, 0x23
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08040020
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x1
	mov r1, sp
	strh r0, [r1]
_08040020:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08040030
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
_08040030:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	ble _08040040
	movs r1, 0xFF
	mov r0, sp
	strh r1, [r0]
_08040040:
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_0804004A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040054: .4byte gUnknown_020239F8
_08040058: .4byte gTrainers
_0804005C: .4byte gTrainerBattleOpponent
_08040060: .4byte gUnknown_082082FE
	thumb_func_end AdjustFriendship

	thumb_func_start MonGainEVs
MonGainEVs: @ 8040064
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	movs r7, 0
	movs r6, 0
_08040078:
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	movs r2, 0
	bl GetMonData
	mov r2, sp
	adds r1, r2, r6
	strb r0, [r1]
	ldrb r0, [r1]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	adds r6, 0x1
	cmp r6, 0x5
	ble _08040078
	movs r6, 0
	b _080401FA
_0804009C:
	mov r0, r8
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	movs r2, 0x1
	cmp r0, 0
	beq _080400AE
	movs r2, 0x2
_080400AE:
	cmp r6, 0x5
	bhi _08040150
	lsls r0, r6, 2
	ldr r1, _080400BC @ =_080400C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080400BC: .4byte _080400C0
	.align 2, 0
_080400C0:
	.4byte _080400D8
	.4byte _080400EC
	.4byte _08040100
	.4byte _08040114
	.4byte _08040128
	.4byte _0804013C
_080400D8:
	ldr r0, _080400E8 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 30
	b _0804014A
	.align 2, 0
_080400E8: .4byte gBaseStats
_080400EC:
	ldr r0, _080400FC @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _08040148
	.align 2, 0
_080400FC: .4byte gBaseStats
_08040100:
	ldr r0, _08040110 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 26
	b _0804014A
	.align 2, 0
_08040110: .4byte gBaseStats
_08040114:
	ldr r0, _08040124 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsrs r0, 6
	b _0804014C
	.align 2, 0
_08040124: .4byte gBaseStats
_08040128:
	ldr r0, _08040138 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 30
	b _0804014A
	.align 2, 0
_08040138: .4byte gBaseStats
_0804013C:
	ldr r0, _08040178 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
_08040148:
	lsls r0, 28
_0804014A:
	lsrs r0, 30
_0804014C:
	adds r4, r0, 0
	muls r4, r2
_08040150:
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0804019C
	ldr r0, _0804017C @ =gMain
	ldr r1, _08040180 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08040188
	ldr r0, _08040184 @ =gEnigmaBerries
	ldrb r0, [r0, 0x7]
	b _080401A4
	.align 2, 0
_08040178: .4byte gBaseStats
_0804017C: .4byte gMain
_08040180: .4byte 0x0000043d
_08040184: .4byte gEnigmaBerries
_08040188:
	ldr r0, _08040194 @ =gSaveBlock1
	ldr r2, _08040198 @ =0x00003688
	adds r0, r2
	ldrb r0, [r0]
	b _080401A4
	.align 2, 0
_08040194: .4byte gSaveBlock1
_08040198: .4byte 0x00003688
_0804019C:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_080401A4:
	cmp r0, 0x18
	bne _080401AC
	lsls r0, r4, 17
	lsrs r4, r0, 16
_080401AC:
	lsls r0, r4, 16
	asrs r2, r0, 16
	adds r1, r7, r2
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	ble _080401C4
	adds r0, r2, r0
	adds r1, r7, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080401C4:
	mov r0, sp
	adds r2, r0, r6
	ldrb r3, [r2]
	lsls r0, r4, 16
	asrs r1, r0, 16
	adds r0, r3, r1
	cmp r0, 0xFF
	ble _080401E0
	adds r0, r1, 0
	adds r0, 0xFF
	adds r1, r3, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080401E0:
	adds r0, r3, r4
	strb r0, [r2]
	adds r0, r7, r4
	lsls r0, 16
	lsrs r7, r0, 16
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	bl SetMonData
	adds r6, 0x1
	cmp r6, 0x5
	bgt _08040202
_080401FA:
	ldr r0, _08040210 @ =0x000001fd
	cmp r7, r0
	bhi _08040202
	b _0804009C
_08040202:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040210: .4byte 0x000001fd
	thumb_func_end MonGainEVs

	thumb_func_start GetMonEVCount
GetMonEVCount: @ 8040214
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_0804021C:
	adds r1, r4, 0
	adds r1, 0x1A
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	cmp r4, 0x5
	ble _0804021C
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonEVCount

	thumb_func_start RandomlyGivePartyPokerus
RandomlyGivePartyPokerus: @ 804023C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl Random
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x80
	lsls r0, 7
	cmp r5, r0
	beq _08040262
	movs r0, 0x80
	lsls r0, 8
	cmp r5, r0
	beq _08040262
	movs r0, 0xC0
	lsls r0, 8
	cmp r5, r0
	bne _080402F8
_08040262:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x64
	muls r0, r5
	adds r4, r6, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08040262
	adds r0, r4, 0
	movs r1, 0x2D
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _08040262
	ldr r1, _08040300 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r6, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	cmp r0, 0
	bne _080402F8
	mov r4, sp
_080402AC:
	bl Random
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4]
	cmp r0, 0
	beq _080402AC
	movs r0, 0xF0
	mov r1, sp
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _080402CE
	movs r0, 0x7
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
_080402CE:
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 4
	orrs r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	movs r1, 0xF3
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0x64
	muls r0, r5
	adds r0, r6, r0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_080402F8:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040300: .4byte gBitTable
	thumb_func_end RandomlyGivePartyPokerus

	thumb_func_start CheckPartyPokerus
CheckPartyPokerus: @ 8040304
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _0804034C
_08040318:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08040340
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _08040340
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_08040340:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _08040318
	b _08040360
_0804034C:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	beq _08040360
	movs r5, 0x1
_08040360:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyPokerus

	thumb_func_start CheckPartyHasHadPokerus
CheckPartyHasHadPokerus: @ 804036C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _080403B0
_08040380:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080403A4
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	ldr r3, [sp]
	cmp r0, 0
	beq _080403A4
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080403A4:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _08040380
	b _080403C0
_080403B0:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _080403C0
	movs r5, 0x1
_080403C0:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyHasHadPokerus

	thumb_func_start UpdatePartyPokerusTime
UpdatePartyPokerusTime: @ 80403CC
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
	mov r6, sp
_080403D8:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08040418 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _08040430
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r6]
	movs r1, 0xF
	adds r2, r0, 0
	ands r1, r2
	cmp r1, 0
	beq _08040430
	cmp r1, r7
	bcc _08040412
	cmp r7, 0x4
	bls _0804041C
_08040412:
	movs r0, 0xF0
	ands r0, r2
	b _0804041E
	.align 2, 0
_08040418: .4byte gPlayerParty
_0804041C:
	subs r0, r2, r7
_0804041E:
	strb r0, [r6]
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08040440 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_08040430:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080403D8
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040440: .4byte gPlayerParty
	thumb_func_end UpdatePartyPokerusTime

	thumb_func_start PartySpreadPokerus
PartySpreadPokerus: @ 8040444
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080404EA
	movs r5, 0
_08040460:
	movs r0, 0x64
	adds r6, r5, 0
	muls r6, r0
	adds r4, r7, r6
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _080404E4
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	mov r0, sp
	strb r1, [r0]
	cmp r1, 0
	beq _080404E4
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080404E4
	cmp r5, 0
	beq _080404BA
	adds r0, r6, 0
	subs r0, 0x64
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0
	bne _080404BA
	adds r0, r4, 0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_080404BA:
	cmp r5, 0x5
	beq _080404E4
	movs r0, 0x64
	muls r0, r5
	adds r0, 0x64
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0
	bne _080404E4
	adds r0, r4, 0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
_080404E4:
	adds r5, 0x1
	cmp r5, 0x5
	ble _08040460
_080404EA:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PartySpreadPokerus

	thumb_func_start TryIncrementMonLevel
TryIncrementMonLevel: @ 80404F4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r0, 0x1
	mov r1, sp
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	ldr r5, _0804054C @ =gExperienceTables
	mov r1, sp
	ldrb r2, [r1]
	lsls r2, 2
	ldr r3, _08040550 @ =gBaseStats
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r3
	adds r2, r1
	adds r2, r5
	ldr r1, [r2]
	cmp r0, r1
	bhi _08040554
	movs r0, 0
	b _08040560
	.align 2, 0
_0804054C: .4byte gExperienceTables
_08040550: .4byte gBaseStats
_08040554:
	adds r0, r6, 0
	movs r1, 0x38
	mov r2, sp
	bl SetMonData
	movs r0, 0x1
_08040560:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end TryIncrementMonLevel

	thumb_func_start CanMonLearnTMHM
CanMonLearnTMHM: @ 8040568
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	adds r3, r1, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _0804058A
	movs r0, 0
	b _080405B6
_0804058A:
	cmp r4, 0x1F
	bls _080405A8
	adds r0, r4, 0
	subs r0, 0x20
	movs r2, 0x1
	lsls r2, r0
	ldr r0, _080405A4 @ =gTMHMLearnsets
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _080405B6
	.align 2, 0
_080405A4: .4byte gTMHMLearnsets
_080405A8:
	movs r1, 0x1
	lsls r1, r5
	ldr r2, _080405BC @ =gTMHMLearnsets
	lsls r0, r3, 3
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
_080405B6:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080405BC: .4byte gTMHMLearnsets
	thumb_func_end CanMonLearnTMHM

	thumb_func_start sub_80403CC
sub_80403CC: @ 80405C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r6, r0, 0
	str r1, [sp, 0x8]
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	movs r5, 0
	mov r4, sp
_080405F6:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _080405F6
	movs r5, 0
	ldr r6, _08040704 @ =gLevelUpLearnsets
	lsls r1, r7, 2
	adds r2, r1, r6
	ldr r3, [r2]
	ldrh r0, [r3]
	ldr r4, _08040708 @ =0x0000ffff
	str r1, [sp, 0x14]
	cmp r0, r4
	beq _080406F0
	mov r9, r2
	str r3, [sp, 0x10]
_08040624:
	lsls r2, r5, 1
	ldr r1, [sp, 0x10]
	adds r0, r2, r1
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0xC]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _080406DA
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _0804070C @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _08040674
	ldr r0, [sp, 0x14]
	ldr r1, _08040704 @ =gLevelUpLearnsets
	adds r6, r0, r1
	ldr r2, _0804070C @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_0804065C:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08040674
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _0804065C
_08040674:
	cmp r4, 0x4
	bne _080406DA
	movs r4, 0
	cmp r4, r10
	bge _080406B8
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x8]
	ldrh r2, [r0]
	ldr r0, _0804070C @ =0x000001ff
	ands r0, r1
	cmp r2, r0
	beq _080406B8
	ldr r1, [sp, 0x14]
	ldr r2, _08040704 @ =gLevelUpLearnsets
	adds r6, r1, r2
	ldr r0, _0804070C @ =0x000001ff
	mov r8, r0
	ldr r3, [sp, 0x8]
	adds r5, r7, 0
_080406A0:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _080406B8
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _080406A0
_080406B8:
	cmp r4, r10
	bne _080406DA
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r1, [sp, 0x8]
	adds r2, r1
	mov r4, r9
	ldr r0, [r4]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _0804070C @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_080406DA:
	mov r5, r12
	cmp r5, 0x13
	bgt _080406F0
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _08040708 @ =0x0000ffff
	cmp r0, r2
	bne _08040624
_080406F0:
	mov r0, r10
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040704: .4byte gLevelUpLearnsets
_08040708: .4byte 0x0000ffff
_0804070C: .4byte 0x000001ff
	thumb_func_end sub_80403CC

	thumb_func_start sub_804051C
sub_804051C: @ 8040710
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 16
	movs r5, 0
	movs r4, 0
	ldr r1, _0804075C @ =gLevelUpLearnsets
	lsrs r0, 14
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	ldr r1, _08040760 @ =0x0000ffff
	cmp r0, r1
	beq _08040754
	ldr r0, _08040764 @ =0x000001ff
	mov r12, r0
	adds r7, r1, 0
	adds r3, r2, 0
_08040732:
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	strh r0, [r1]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x13
	bgt _08040754
	ldrh r0, [r3]
	cmp r0, r7
	bne _08040732
_08040754:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804075C: .4byte gLevelUpLearnsets
_08040760: .4byte 0x0000ffff
_08040764: .4byte 0x000001ff
	thumb_func_end sub_804051C

	thumb_func_start sub_8040574
sub_8040574: @ 8040768
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	adds r6, r0, 0
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x30]
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _080407A4
	movs r0, 0
	b _080408AE
_080407A4:
	movs r5, 0
	lsls r4, 2
	str r4, [sp, 0x38]
	mov r4, sp
_080407AC:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _080407AC
	movs r5, 0
	ldr r3, _080408C0 @ =gLevelUpLearnsets
	ldr r2, [sp, 0x38]
	adds r1, r2, r3
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, _080408C4 @ =0x0000ffff
	cmp r0, r2
	beq _080408AC
	mov r9, r1
	mov r4, sp
	adds r4, 0x8
	str r4, [sp, 0x34]
_080407DC:
	mov r1, r9
	ldr r0, [r1]
	lsls r2, r5, 1
	adds r0, r2, r0
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0x30]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _08040896
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _080408C8 @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _0804082E
	ldr r0, [sp, 0x38]
	ldr r1, _080408C0 @ =gLevelUpLearnsets
	adds r6, r0, r1
	ldr r2, _080408C8 @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08040816:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0804082E
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040816
_0804082E:
	cmp r4, 0x4
	bne _08040896
	movs r4, 0
	cmp r4, r10
	bge _08040874
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x34]
	ldrh r2, [r0]
	ldr r0, _080408C8 @ =0x000001ff
	ands r0, r1
	add r1, sp, 0x8
	cmp r2, r0
	beq _08040874
	ldr r2, [sp, 0x38]
	ldr r0, _080408C0 @ =gLevelUpLearnsets
	adds r6, r2, r0
	ldr r2, _080408C8 @ =0x000001ff
	mov r8, r2
	adds r3, r1, 0
	adds r5, r7, 0
_0804085C:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08040874
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _0804085C
_08040874:
	cmp r4, r10
	bne _08040896
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r4, [sp, 0x34]
	adds r2, r4, r2
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _080408C8 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_08040896:
	mov r5, r12
	cmp r5, 0x13
	bgt _080408AC
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r4, _080408C4 @ =0x0000ffff
	cmp r0, r4
	bne _080407DC
_080408AC:
	mov r0, r10
_080408AE:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080408C0: .4byte gLevelUpLearnsets
_080408C4: .4byte 0x0000ffff
_080408C8: .4byte 0x000001ff
	thumb_func_end sub_8040574

	thumb_func_start SpeciesToPokedexNum
SpeciesToPokedexNum: @ 80408CC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl IsNationalPokedex
	cmp r0, 0
	beq _080408E6
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	b _080408FE
_080408E6:
	adds r0, r4, 0
	bl SpeciesToHoennPokedexNum
	adds r4, r0, 0
	cmp r4, 0xCA
	bls _080408FC
	ldr r0, _080408F8 @ =0x0000ffff
	b _080408FE
	.align 2, 0
_080408F8: .4byte 0x0000ffff
_080408FC:
	adds r0, r4, 0
_080408FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SpeciesToPokedexNum

	thumb_func_start sub_8040710
sub_8040710: @ 8040904
	push {lr}
	ldr r1, _08040918 @ =gUnknown_02024E84
	movs r2, 0
	adds r0, r1, 0x3
_0804090C:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _0804090C
	pop {r0}
	bx r0
	.align 2, 0
_08040918: .4byte gUnknown_02024E84
	thumb_func_end sub_8040710

	thumb_func_start sub_8040728
sub_8040728: @ 804091C
	push {lr}
	ldr r0, _08040930 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _08040938
	ldr r0, _08040934 @ =0x000001cf
	b _08040AA6
	.align 2, 0
_08040930: .4byte gUnknown_020239F8
_08040934: .4byte 0x000001cf
_08040938:
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	beq _08040948
	movs r0, 0xE7
	lsls r0, 1
	b _08040AA6
_08040948:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08040952
	b _08040A9C
_08040952:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0804095C
	b _08040AA4
_0804095C:
	ldr r3, _08040980 @ =gTrainers
	ldr r2, _08040984 @ =gTrainerBattleOpponent
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	cmp r0, 0x31
	bls _08040974
	b _08040A9C
_08040974:
	lsls r0, 2
	ldr r1, _08040988 @ =_0804098C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040980: .4byte gTrainers
_08040984: .4byte gTrainerBattleOpponent
_08040988: .4byte _0804098C
	.align 2, 0
_0804098C:
	.4byte _08040A54
	.4byte _08040A5A
	.4byte _08040A5A
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A94
	.4byte _08040A60
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A66
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A70
	.4byte _08040A9C
	.4byte _08040A9C
	.4byte _08040A54
	.4byte _08040A5A
	.4byte _08040A5A
_08040A54:
	movs r0, 0xE9
	lsls r0, 1
	b _08040AA6
_08040A5A:
	movs r0, 0xE5
	lsls r0, 1
	b _08040AA6
_08040A60:
	movs r0, 0xE6
	lsls r0, 1
	b _08040AA6
_08040A66:
	ldr r0, _08040A6C @ =0x000001cd
	b _08040AA6
	.align 2, 0
_08040A6C: .4byte 0x000001cd
_08040A70:
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08040A8C @ =0x081fd47c
	adds r0, r1
	ldr r1, _08040A90 @ =gUnknown_08400E42
	bl StringCompare
	cmp r0, 0
	beq _08040A9C
	movs r0, 0xE8
	lsls r0, 1
	b _08040AA6
	.align 2, 0
_08040A8C: .4byte 0x081fd47c
_08040A90: .4byte gUnknown_08400E42
_08040A94:
	ldr r0, _08040A98 @ =0x000001d1
	b _08040AA6
	.align 2, 0
_08040A98: .4byte 0x000001d1
_08040A9C:
	ldr r0, _08040AA0 @ =0x000001cb
	b _08040AA6
	.align 2, 0
_08040AA0: .4byte 0x000001cb
_08040AA4:
	ldr r0, _08040AAC @ =0x000001c9
_08040AA6:
	pop {r1}
	bx r1
	.align 2, 0
_08040AAC: .4byte 0x000001c9
	thumb_func_end sub_8040728

	thumb_func_start sub_80408BC
sub_80408BC: @ 8040AB0
	push {lr}
	bl ResetMapMusic
	bl m4aMPlayAllStop
	bl sub_8040728
	lsls r0, 16
	lsrs r0, 16
	bl PlayBGM
	pop {r0}
	bx r0
	thumb_func_end sub_80408BC

	thumb_func_start current_map_music_set__default_for_battle
current_map_music_set__default_for_battle: @ 8040ACC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl ResetMapMusic
	bl m4aMPlayAllStop
	cmp r4, 0
	beq _08040AE6
	adds r0, r4, 0
	bl PlayNewMapMusic
	b _08040AF2
_08040AE6:
	bl sub_8040728
	lsls r0, 16
	lsrs r0, 16
	bl PlayNewMapMusic
_08040AF2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end current_map_music_set__default_for_battle

	thumb_func_start pokemon_get_pal
pokemon_get_pal: @ 8040AF8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl species_and_otid_get_pal
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_pal

	thumb_func_start species_and_otid_get_pal
species_and_otid_get_pal: @ 8040B30
	push {r4,r5,lr}
	adds r3, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08040B4C
	ldr r0, _08040B48 @ =gMonPaletteTable
	ldr r0, [r0]
	b _08040B78
	.align 2, 0
_08040B48: .4byte gMonPaletteTable
_08040B4C:
	lsrs r0, r1, 16
	ldr r2, _08040B68 @ =0x0000ffff
	ands r1, r2
	eors r0, r1
	lsrs r1, r3, 16
	eors r0, r1
	ands r3, r2
	eors r0, r3
	cmp r0, 0x7
	bls _08040B70
	ldr r0, _08040B6C @ =gMonPaletteTable
	lsls r1, r4, 3
	b _08040B74
	.align 2, 0
_08040B68: .4byte 0x0000ffff
_08040B6C: .4byte gMonPaletteTable
_08040B70:
	ldr r0, _08040B80 @ =gMonShinyPaletteTable
	lsls r1, r5, 3
_08040B74:
	adds r1, r0
	ldr r0, [r1]
_08040B78:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08040B80: .4byte gMonShinyPaletteTable
	thumb_func_end species_and_otid_get_pal

	thumb_func_start sub_8040990
sub_8040990: @ 8040B84
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80409C8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8040990

	thumb_func_start sub_80409C8
sub_80409C8: @ 8040BBC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsrs r0, r1, 16
	ldr r3, _08040BDC @ =0x0000ffff
	ands r1, r3
	eors r0, r1
	lsrs r1, r2, 16
	eors r0, r1
	ands r2, r3
	eors r0, r2
	cmp r0, 0x7
	bls _08040BE4
	lsls r0, r4, 3
	ldr r1, _08040BE0 @ =gMonPaletteTable
	b _08040BE8
	.align 2, 0
_08040BDC: .4byte 0x0000ffff
_08040BE0: .4byte gMonPaletteTable
_08040BE4:
	lsls r0, r4, 3
	ldr r1, _08040BF0 @ =gMonShinyPaletteTable
_08040BE8:
	adds r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040BF0: .4byte gMonShinyPaletteTable
	thumb_func_end sub_80409C8

	thumb_func_start sub_8040A00
sub_8040A00: @ 8040BF4
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _08040C18 @ =gUnknown_0820831A
	ldrh r0, [r2]
	ldr r1, _08040C1C @ =0x0000ffff
	cmp r0, r1
	beq _08040C26
	adds r4, r1, 0
	adds r1, r2, 0
_08040C08:
	ldrh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	cmp r0, r3
	bne _08040C20
	movs r0, 0x1
	b _08040C28
	.align 2, 0
_08040C18: .4byte gUnknown_0820831A
_08040C1C: .4byte 0x0000ffff
_08040C20:
	ldrh r0, [r1]
	cmp r0, r4
	bne _08040C08
_08040C26:
	movs r0, 0
_08040C28:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8040A00

	thumb_func_start sub_8040A3C
sub_8040A3C: @ 8040C30
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040C44 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x19]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08040C44: .4byte gBaseStats
	thumb_func_end sub_8040A3C

	thumb_func_start sub_8040A54
sub_8040A54: @ 8040C48
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08040C6C @ =gUnknown_083F7E28
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040C6C: .4byte gUnknown_083F7E28
	thumb_func_end sub_8040A54

	thumb_func_start sub_8040A7C
sub_8040A7C: @ 8040C70
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08040C94 @ =gUnknown_083F7E28
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040C94: .4byte gUnknown_083F7E28
	thumb_func_end sub_8040A7C

	thumb_func_start sub_8040AA4
sub_8040AA4: @ 8040C98
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, sp
	bl sub_8040AD0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8040AA4

	thumb_func_start sub_8040AD0
sub_8040AD0: @ 8040CC4
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r3, _08040D04 @ =gSaveBlock2
	ldrb r2, [r3, 0xA]
	ldrb r1, [r3, 0xB]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r3, 0xC]
	lsls r1, 16
	orrs r2, r1
	ldrb r1, [r3, 0xD]
	lsls r1, 24
	orrs r2, r1
	cmp r0, r2
	bne _08040D08
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08040D00
	adds r2, r5, 0
_08040CEC:
	adds r1, r4, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08040D08
	adds r2, 0x1
	adds r4, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _08040CEC
_08040D00:
	movs r0, 0
	b _08040D0A
	.align 2, 0
_08040D04: .4byte gSaveBlock2
_08040D08:
	movs r0, 0x1
_08040D0A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040AD0

	thumb_func_start sub_8040B1C
sub_8040B1C: @ 8040D10
	push {lr}
	bl pokemon_restore_pp
	pop {r0}
	bx r0
	thumb_func_end sub_8040B1C

	thumb_func_start pokemon_restore_pp
pokemon_restore_pp: @ 8040D1C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r6, 0
_08040D24:
	adds r4, r6, 0
	adds r4, 0xD
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	beq _08040D70
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	mov r2, sp
	bl SetBoxMonData
_08040D70:
	adds r6, 0x1
	cmp r6, 0x3
	ble _08040D24
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end pokemon_restore_pp

	thumb_func_start sub_8040B8C
sub_8040B8C: @ 8040D80
	push {r4,r5,lr}
	ldr r1, _08040DC0 @ =byte_2024C06
	ldr r2, _08040DC4 @ =0x02000000
	ldr r3, _08040DC8 @ =0x000160c0
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r5, _08040DCC @ =gUnknown_030041C0
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x4
	strb r0, [r5, 0x1]
	ldr r0, _08040DD0 @ =0x00016054
	adds r4, r2, r0
	ldrb r0, [r4]
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x4]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08040DD8
	ldr r1, _08040DD4 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _08040DE2
	.align 2, 0
_08040DC0: .4byte byte_2024C06
_08040DC4: .4byte 0x02000000
_08040DC8: .4byte 0x000160c0
_08040DCC: .4byte gUnknown_030041C0
_08040DD0: .4byte 0x00016054
_08040DD4: .4byte gUnknown_02024A6A
_08040DD8:
	ldr r0, _08040E18 @ =gUnknown_02024A6A
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_08040DE2:
	strb r0, [r5, 0x3]
	ldr r4, _08040E1C @ =gUnknown_03004290
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	ldr r1, _08040E20 @ =gUnknown_02024E6C
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	ldr r2, _08040E18 @ =gUnknown_02024A6A
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, 0x3]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldr r0, _08040E24 @ =gUnknown_083FFCCA
	ldr r1, _08040E28 @ =gStringVar4
	bl sub_8120FFC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040E18: .4byte gUnknown_02024A6A
_08040E1C: .4byte gUnknown_03004290
_08040E20: .4byte gUnknown_02024E6C
_08040E24: .4byte gUnknown_083FFCCA
_08040E28: .4byte gStringVar4
	thumb_func_end sub_8040B8C

	thumb_func_start sub_8040C38
sub_8040C38: @ 8040E2C
	push {r4,r5,lr}
	ldr r0, _08040E84 @ =gUnknown_020239F8
	ldrh r1, [r0]
	ldr r0, _08040E88 @ =0x00002008
	ands r0, r1
	cmp r0, 0
	bne _08040EA0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _08040E8C @ =gEnemyParty
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040E90 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r3, r1, 2
	adds r1, r3, r2
	ldrh r0, [r1, 0xC]
	ldrh r1, [r1, 0xE]
	cmp r0, r1
	beq _08040E76
	cmp r5, 0x2C
	bls _08040EA0
	cmp r5, 0x5E
	bhi _08040E94
_08040E76:
	adds r2, 0xC
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	b _08040EA0
	.align 2, 0
_08040E84: .4byte gUnknown_020239F8
_08040E88: .4byte 0x00002008
_08040E8C: .4byte gEnemyParty
_08040E90: .4byte gBaseStats
_08040E94:
	adds r2, 0xE
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
_08040EA0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8040C38

	thumb_func_start sub_8040CB4
sub_8040CB4: @ 8040EA8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_8040CE0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040CB4

	thumb_func_start sub_8040CE0
sub_8040CE0: @ 8040ED4
	push {r4,lr}
	movs r4, 0
	lsrs r2, r0, 16
	ldr r3, _08040EF8 @ =0x0000ffff
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, 16
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, 0x7
	bhi _08040EEE
	movs r4, 0x1
_08040EEE:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040EF8: .4byte 0x0000ffff
	thumb_func_end sub_8040CE0

	thumb_func_start sub_8040D08
sub_8040D08: @ 8040EFC
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08040F2C @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x18]
	movs r0, 0x2
	eors r0, r1
	bl sub_803FC34
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040F2C: .4byte gLinkPlayers
	thumb_func_end sub_8040D08

	thumb_func_start sub_8040D3C
sub_8040D3C: @ 8040F30
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	cmp r1, 0x20
	beq _08040F48
	cmp r1, 0x1D
	bne _08040F72
_08040F48:
	cmp r2, 0x5
	bne _08040F5C
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08040F58 @ =gSpeciesNames
	adds r1, r0
	b _08040F64
	.align 2, 0
_08040F58: .4byte gSpeciesNames
_08040F5C:
	ldr r1, _08040F7C @ =gUnknown_08208337
	cmp r0, 0x20
	bne _08040F64
	subs r1, 0xB
_08040F64:
	adds r0, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	movs r3, 0
	cmp r0, 0
	bne _08040F72
	movs r3, 0x1
_08040F72:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040F7C: .4byte gUnknown_08208337
	thumb_func_end sub_8040D3C

	thumb_func_start sub_8040D8C
sub_8040D8C: @ 8040F80
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x5
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _08040F96
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _08040F96
	movs r2, 0x1
_08040F96:
	adds r0, r3, 0
	bl sub_8040D3C
	pop {r1}
	bx r1
	thumb_func_end sub_8040D8C

	thumb_func_start unref_sub_8040DAC
unref_sub_8040DAC: @ 8040FA0
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_8040D3C
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8040DAC

	.align 2, 0 @ Don't pad with nop.
