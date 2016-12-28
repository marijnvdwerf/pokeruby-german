	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_803C348
sub_803C348: @ 803C348
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r6, 0
	cmp r0, 0x1
	beq _0803C39C
	cmp r0, 0x1
	bgt _0803C360
	cmp r0, 0
	beq _0803C366
	b _0803C41E
_0803C360:
	cmp r1, 0x2
	beq _0803C3E4
	b _0803C41E
_0803C366:
	movs r5, 0
	ldr r0, _0803C390 @ =gUnknown_02024A60
	ldrb r3, [r0]
	ldr r4, _0803C394 @ =gUnknown_02024C0C
	ldr r2, _0803C398 @ =gBitTable
_0803C370:
	cmp r5, r3
	beq _0803C384
	ldrb r0, [r4]
	ldr r1, [r2]
	ands r0, r1
	cmp r0, 0
	bne _0803C384
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803C384:
	adds r2, 0x4
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803C370
	b _0803C41E
	.align 2, 0
_0803C390: .4byte gUnknown_02024A60
_0803C394: .4byte gUnknown_02024C0C
_0803C398: .4byte gBitTable
_0803C39C:
	movs r5, 0
_0803C39E:
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _0803C3D8 @ =gUnknown_02024C07
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0803C3D0
	ldr r0, _0803C3DC @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0803C3E0 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803C3D0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803C3D0:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803C39E
	b _0803C41E
	.align 2, 0
_0803C3D8: .4byte gUnknown_02024C07
_0803C3DC: .4byte gUnknown_02024C0C
_0803C3E0: .4byte gBitTable
_0803C3E4:
	movs r5, 0
_0803C3E6:
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _0803C428 @ =gUnknown_02024C08
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0803C418
	ldr r0, _0803C42C @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0803C430 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803C418
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803C418:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803C3E6
_0803C41E:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C428: .4byte gUnknown_02024C08
_0803C42C: .4byte gUnknown_02024C0C
_0803C430: .4byte gBitTable
	thumb_func_end sub_803C348

	thumb_func_start sub_803C434
sub_803C434: @ 803C434
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	movs r1, 0x1
	movs r6, 0x1
	adds r4, r6, 0
	ands r4, r0
	eors r4, r1
	adds r5, r4, 0
	ldr r0, _0803C45C @ =gUnknown_020239F8
	ldrh r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0803C460
	adds r0, r4, 0
	b _0803C4AA
	.align 2, 0
_0803C45C: .4byte gUnknown_020239F8
_0803C460:
	movs r0, 0
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0803C484
	bl Random
	adds r1, r6, 0
	ands r1, r0
	cmp r1, 0
	bne _0803C480
	movs r0, 0x2
	eors r0, r4
	b _0803C4AA
_0803C480:
	adds r0, r4, 0
	b _0803C4AA
_0803C484:
	ldr r0, _0803C49C @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0803C4A0 @ =gBitTable
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803C4A4
	adds r0, r4, 0
	b _0803C4AA
	.align 2, 0
_0803C49C: .4byte gUnknown_02024C0C
_0803C4A0: .4byte gBitTable
_0803C4A4:
	movs r0, 0x2
	eors r5, r0
	adds r0, r5, 0
_0803C4AA:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_803C434

	thumb_func_start GetMonGender
GetMonGender: @ 803C4B8
	push {lr}
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetMonGender

	thumb_func_start GetBoxMonGender
GetBoxMonGender: @ 803C4C8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetBoxMonData
	adds r2, r0, 0
	ldr r1, _0803C518 @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _0803C51E
	cmp r0, 0
	blt _0803C500
	cmp r0, 0xFF
	bgt _0803C500
	cmp r0, 0xFE
	bge _0803C51E
_0803C500:
	ldr r1, _0803C518 @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0xFF
	ands r0, r2
	cmp r1, r0
	bhi _0803C51C
	movs r0, 0
	b _0803C51E
	.align 2, 0
_0803C518: .4byte gBaseStats
_0803C51C:
	movs r0, 0xFE
_0803C51E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonGender

	thumb_func_start GetGenderFromSpeciesAndPersonality
GetGenderFromSpeciesAndPersonality: @ 803C524
	push {lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0803C560 @ =gBaseStats
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _0803C566
	cmp r0, 0
	blt _0803C548
	cmp r0, 0xFF
	bgt _0803C548
	cmp r0, 0xFE
	bge _0803C566
_0803C548:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0xFF
	ands r0, r3
	cmp r1, r0
	bhi _0803C564
	movs r0, 0
	b _0803C566
	.align 2, 0
_0803C560: .4byte gBaseStats
_0803C564:
	movs r0, 0xFE
_0803C566:
	pop {r1}
	bx r1
	thumb_func_end GetGenderFromSpeciesAndPersonality

	thumb_func_start GetMonSpriteTemplate_803C56C
GetMonSpriteTemplate_803C56C: @ 803C56C
	push {r4-r6,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0803C594 @ =gUnknown_02024E8C
	ldr r4, _0803C598 @ =gSpriteTemplate_8208288
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 3
	adds r1, r3, 0
	adds r2, r4
	ldm r2!, {r4-r6}
	stm r1!, {r4-r6}
	ldm r2!, {r4-r6}
	stm r1!, {r4-r6}
	strh r0, [r3, 0x2]
	ldr r0, _0803C59C @ =gSpriteAnimTable_81E7C64
	str r0, [r3, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C594: .4byte gUnknown_02024E8C
_0803C598: .4byte gSpriteTemplate_8208288
_0803C59C: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end GetMonSpriteTemplate_803C56C

	thumb_func_start GetMonSpriteTemplate_803C5A0
GetMonSpriteTemplate_803C5A0: @ 803C5A0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r5, _0803C5D0 @ =gUnknown_02024E8C
	ldr r2, _0803C5D4 @ =gSpriteTemplate_8208288
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r1, r5, 0
	adds r0, r2
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	ldm r0!, {r2,r6,r7}
	stm r1!, {r2,r6,r7}
	strh r4, [r5, 0x2]
	cmp r3, 0
	beq _0803C5CA
	cmp r3, 0x2
	bne _0803C5DC
_0803C5CA:
	ldr r0, _0803C5D8 @ =gUnknown_081ECACC
	b _0803C5DE
	.align 2, 0
_0803C5D0: .4byte gUnknown_02024E8C
_0803C5D4: .4byte gSpriteTemplate_8208288
_0803C5D8: .4byte gUnknown_081ECACC
_0803C5DC:
	ldr r0, _0803C5EC @ =gUnknown_081EC2A4
_0803C5DE:
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r5, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C5EC: .4byte gUnknown_081EC2A4
	thumb_func_end GetMonSpriteTemplate_803C5A0

	thumb_func_start EncryptBoxMon
EncryptBoxMon: @ 803C5F0
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	adds r2, r3, 0
	adds r2, 0x20
_0803C5FA:
	ldr r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3, 0x4]
	eors r0, r1
	stm r2!, {r0}
	adds r4, 0x1
	cmp r4, 0xB
	bls _0803C5FA
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EncryptBoxMon

	thumb_func_start DecryptBoxMon
DecryptBoxMon: @ 803C614
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	adds r2, r3, 0
	adds r2, 0x20
_0803C61E:
	ldr r0, [r2]
	ldr r1, [r3, 0x4]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	stm r2!, {r0}
	adds r4, 0x1
	cmp r4, 0xB
	bls _0803C61E
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DecryptBoxMon

	thumb_func_start GetSubstruct
GetSubstruct: @ 803C638
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4C
	lsls r2, 24
	lsrs r4, r2, 24
	movs r5, 0
	adds r0, 0x20
	str r0, [sp, 0x4]
	str r0, [sp]
	str r0, [sp, 0xC]
	str r0, [sp, 0x8]
	str r0, [sp, 0x14]
	str r0, [sp, 0x10]
	str r0, [sp, 0x1C]
	str r0, [sp, 0x18]
	str r0, [sp, 0x24]
	str r0, [sp, 0x20]
	str r0, [sp, 0x2C]
	str r0, [sp, 0x28]
	mov r10, r0
	str r0, [sp, 0x30]
	mov r8, r10
	str r0, [sp, 0x34]
	mov r3, r8
	str r3, [sp, 0x38]
	adds r7, r3, 0
	str r7, [sp, 0x3C]
	adds r6, r7, 0
	str r6, [sp, 0x40]
	adds r2, r6, 0
	mov r9, r2
	adds r0, r1, 0
	movs r1, 0x18
	str r2, [sp, 0x44]
	str r3, [sp, 0x48]
	bl __umodsi3
	ldr r2, [sp, 0x44]
	ldr r3, [sp, 0x48]
	cmp r0, 0x17
	bls _0803C692
	b _0803CB4E
_0803C692:
	lsls r0, 2
	ldr r1, _0803C69C @ =_0803C874
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C69C: .4byte _0803C874
	.align 2, 0
_0803C6A0:
	.4byte _0803C700
	.4byte _0803C72E
	.4byte _0803C75C
	.4byte _0803C78A
	.4byte _0803C7B8
	.4byte _0803C7E6
	.4byte _0803C814
	.4byte _0803C842
	.4byte _0803C870
	.4byte _0803C89E
	.4byte _0803C8CC
	.4byte _0803C8FA
	.4byte _0803C928
	.4byte _0803C956
	.4byte _0803C984
	.4byte _0803C9B2
	.4byte _0803C9E0
	.4byte _0803CA0E
	.4byte _0803CA3C
	.4byte _0803CA6A
	.4byte _0803CA98
	.4byte _0803CAC6
	.4byte _0803CAF4
	.4byte _0803CB22
_0803C700:
	cmp r4, 0x1
	beq _0803C71C
	cmp r4, 0x1
	bgt _0803C70E
	cmp r4, 0
	beq _0803C718
	b _0803CB4E
_0803C70E:
	cmp r4, 0x2
	beq _0803C722
	cmp r4, 0x3
	beq _0803C728
	b _0803CB4E
_0803C718:
	ldr r5, [sp]
	b _0803CB4E
_0803C71C:
	ldr r5, [sp]
	adds r5, 0xC
	b _0803CB4E
_0803C722:
	ldr r5, [sp]
	adds r5, 0x18
	b _0803CB4E
_0803C728:
	ldr r5, [sp]
	adds r5, 0x24
	b _0803CB4E
_0803C72E:
	cmp r4, 0x1
	beq _0803C74A
	cmp r4, 0x1
	bgt _0803C73C
	cmp r4, 0
	beq _0803C746
	b _0803CB4E
_0803C73C:
	cmp r4, 0x2
	beq _0803C750
	cmp r4, 0x3
	beq _0803C756
	b _0803CB4E
_0803C746:
	ldr r5, [sp, 0x4]
	b _0803CB4E
_0803C74A:
	ldr r5, [sp, 0x4]
	adds r5, 0xC
	b _0803CB4E
_0803C750:
	ldr r5, [sp, 0x4]
	adds r5, 0x24
	b _0803CB4E
_0803C756:
	ldr r5, [sp, 0x4]
	adds r5, 0x18
	b _0803CB4E
_0803C75C:
	cmp r4, 0x1
	beq _0803C778
	cmp r4, 0x1
	bgt _0803C76A
	cmp r4, 0
	beq _0803C774
	b _0803CB4E
_0803C76A:
	cmp r4, 0x2
	beq _0803C77E
	cmp r4, 0x3
	beq _0803C784
	b _0803CB4E
_0803C774:
	ldr r5, [sp, 0x8]
	b _0803CB4E
_0803C778:
	ldr r5, [sp, 0x8]
	adds r5, 0x18
	b _0803CB4E
_0803C77E:
	ldr r5, [sp, 0x8]
	adds r5, 0xC
	b _0803CB4E
_0803C784:
	ldr r5, [sp, 0x8]
	adds r5, 0x24
	b _0803CB4E
_0803C78A:
	cmp r4, 0x1
	beq _0803C7A6
	cmp r4, 0x1
	bgt _0803C798
	cmp r4, 0
	beq _0803C7A2
	b _0803CB4E
_0803C798:
	cmp r4, 0x2
	beq _0803C7AC
	cmp r4, 0x3
	beq _0803C7B2
	b _0803CB4E
_0803C7A2:
	ldr r5, [sp, 0xC]
	b _0803CB4E
_0803C7A6:
	ldr r5, [sp, 0xC]
	adds r5, 0x24
	b _0803CB4E
_0803C7AC:
	ldr r5, [sp, 0xC]
	adds r5, 0xC
	b _0803CB4E
_0803C7B2:
	ldr r5, [sp, 0xC]
	adds r5, 0x18
	b _0803CB4E
_0803C7B8:
	cmp r4, 0x1
	beq _0803C7D4
	cmp r4, 0x1
	bgt _0803C7C6
	cmp r4, 0
	beq _0803C7D0
	b _0803CB4E
_0803C7C6:
	cmp r4, 0x2
	beq _0803C7DA
	cmp r4, 0x3
	beq _0803C7E0
	b _0803CB4E
_0803C7D0:
	ldr r5, [sp, 0x10]
	b _0803CB4E
_0803C7D4:
	ldr r5, [sp, 0x10]
	adds r5, 0x18
	b _0803CB4E
_0803C7DA:
	ldr r5, [sp, 0x10]
	adds r5, 0x24
	b _0803CB4E
_0803C7E0:
	ldr r5, [sp, 0x10]
	adds r5, 0xC
	b _0803CB4E
_0803C7E6:
	cmp r4, 0x1
	beq _0803C802
	cmp r4, 0x1
	bgt _0803C7F4
	cmp r4, 0
	beq _0803C7FE
	b _0803CB4E
_0803C7F4:
	cmp r4, 0x2
	beq _0803C808
	cmp r4, 0x3
	beq _0803C80E
	b _0803CB4E
_0803C7FE:
	ldr r5, [sp, 0x14]
	b _0803CB4E
_0803C802:
	ldr r5, [sp, 0x14]
	adds r5, 0x24
	b _0803CB4E
_0803C808:
	ldr r5, [sp, 0x14]
	adds r5, 0x18
	b _0803CB4E
_0803C80E:
	ldr r5, [sp, 0x14]
	adds r5, 0xC
	b _0803CB4E
_0803C814:
	cmp r4, 0x1
	beq _0803C832
	cmp r4, 0x1
	bgt _0803C822
	cmp r4, 0
	beq _0803C82C
	b _0803CB4E
_0803C822:
	cmp r4, 0x2
	beq _0803C836
	cmp r4, 0x3
	beq _0803C83C
	b _0803CB4E
_0803C82C:
	ldr r5, [sp, 0x18]
	adds r5, 0xC
	b _0803CB4E
_0803C832:
	ldr r5, [sp, 0x18]
	b _0803CB4E
_0803C836:
	ldr r5, [sp, 0x18]
	adds r5, 0x18
	b _0803CB4E
_0803C83C:
	ldr r5, [sp, 0x18]
	adds r5, 0x24
	b _0803CB4E
_0803C842:
	cmp r4, 0x1
	beq _0803C860
	cmp r4, 0x1
	bgt _0803C850
	cmp r4, 0
	beq _0803C85A
	b _0803CB4E
_0803C850:
	cmp r4, 0x2
	beq _0803C864
	cmp r4, 0x3
	beq _0803C86A
	b _0803CB4E
_0803C85A:
	ldr r5, [sp, 0x1C]
	adds r5, 0xC
	b _0803CB4E
_0803C860:
	ldr r5, [sp, 0x1C]
	b _0803CB4E
_0803C864:
	ldr r5, [sp, 0x1C]
	adds r5, 0x24
	b _0803CB4E
_0803C86A:
	ldr r5, [sp, 0x1C]
	adds r5, 0x18
	b _0803CB4E
_0803C870:
	cmp r4, 0x1
	beq _0803C88E
	cmp r4, 0x1
	bgt _0803C87E
	cmp r4, 0
	beq _0803C888
	b _0803CB4E
_0803C87E:
	cmp r4, 0x2
	beq _0803C892
	cmp r4, 0x3
	beq _0803C898
	b _0803CB4E
_0803C888:
	ldr r5, [sp, 0x20]
	adds r5, 0x18
	b _0803CB4E
_0803C88E:
	ldr r5, [sp, 0x20]
	b _0803CB4E
_0803C892:
	ldr r5, [sp, 0x20]
	adds r5, 0xC
	b _0803CB4E
_0803C898:
	ldr r5, [sp, 0x20]
	adds r5, 0x24
	b _0803CB4E
_0803C89E:
	cmp r4, 0x1
	beq _0803C8BC
	cmp r4, 0x1
	bgt _0803C8AC
	cmp r4, 0
	beq _0803C8B6
	b _0803CB4E
_0803C8AC:
	cmp r4, 0x2
	beq _0803C8C0
	cmp r4, 0x3
	beq _0803C8C6
	b _0803CB4E
_0803C8B6:
	ldr r5, [sp, 0x24]
	adds r5, 0x24
	b _0803CB4E
_0803C8BC:
	ldr r5, [sp, 0x24]
	b _0803CB4E
_0803C8C0:
	ldr r5, [sp, 0x24]
	adds r5, 0xC
	b _0803CB4E
_0803C8C6:
	ldr r5, [sp, 0x24]
	adds r5, 0x18
	b _0803CB4E
_0803C8CC:
	cmp r4, 0x1
	beq _0803C8EA
	cmp r4, 0x1
	bgt _0803C8DA
	cmp r4, 0
	beq _0803C8E4
	b _0803CB4E
_0803C8DA:
	cmp r4, 0x2
	beq _0803C8EE
	cmp r4, 0x3
	beq _0803C8F4
	b _0803CB4E
_0803C8E4:
	ldr r5, [sp, 0x28]
	adds r5, 0x18
	b _0803CB4E
_0803C8EA:
	ldr r5, [sp, 0x28]
	b _0803CB4E
_0803C8EE:
	ldr r5, [sp, 0x28]
	adds r5, 0x24
	b _0803CB4E
_0803C8F4:
	ldr r5, [sp, 0x28]
	adds r5, 0xC
	b _0803CB4E
_0803C8FA:
	cmp r4, 0x1
	beq _0803C918
	cmp r4, 0x1
	bgt _0803C908
	cmp r4, 0
	beq _0803C912
	b _0803CB4E
_0803C908:
	cmp r4, 0x2
	beq _0803C91C
	cmp r4, 0x3
	beq _0803C922
	b _0803CB4E
_0803C912:
	ldr r5, [sp, 0x2C]
	adds r5, 0x24
	b _0803CB4E
_0803C918:
	ldr r5, [sp, 0x2C]
	b _0803CB4E
_0803C91C:
	ldr r5, [sp, 0x2C]
	adds r5, 0x18
	b _0803CB4E
_0803C922:
	ldr r5, [sp, 0x2C]
	adds r5, 0xC
	b _0803CB4E
_0803C928:
	cmp r4, 0x1
	beq _0803C946
	cmp r4, 0x1
	bgt _0803C936
	cmp r4, 0
	beq _0803C940
	b _0803CB4E
_0803C936:
	cmp r4, 0x2
	beq _0803C94C
	cmp r4, 0x3
	beq _0803C950
	b _0803CB4E
_0803C940:
	ldr r5, [sp, 0x30]
	adds r5, 0xC
	b _0803CB4E
_0803C946:
	ldr r5, [sp, 0x30]
	adds r5, 0x18
	b _0803CB4E
_0803C94C:
	ldr r5, [sp, 0x30]
	b _0803CB4E
_0803C950:
	ldr r5, [sp, 0x30]
	adds r5, 0x24
	b _0803CB4E
_0803C956:
	cmp r4, 0x1
	beq _0803C974
	cmp r4, 0x1
	bgt _0803C964
	cmp r4, 0
	beq _0803C96E
	b _0803CB4E
_0803C964:
	cmp r4, 0x2
	beq _0803C97A
	cmp r4, 0x3
	beq _0803C97E
	b _0803CB4E
_0803C96E:
	mov r5, r10
	adds r5, 0xC
	b _0803CB4E
_0803C974:
	mov r5, r10
	adds r5, 0x24
	b _0803CB4E
_0803C97A:
	mov r5, r10
	b _0803CB4E
_0803C97E:
	mov r5, r10
	adds r5, 0x18
	b _0803CB4E
_0803C984:
	cmp r4, 0x1
	beq _0803C9A2
	cmp r4, 0x1
	bgt _0803C992
	cmp r4, 0
	beq _0803C99C
	b _0803CB4E
_0803C992:
	cmp r4, 0x2
	beq _0803C9A8
	cmp r4, 0x3
	beq _0803C9AC
	b _0803CB4E
_0803C99C:
	ldr r5, [sp, 0x34]
	adds r5, 0x18
	b _0803CB4E
_0803C9A2:
	ldr r5, [sp, 0x34]
	adds r5, 0xC
	b _0803CB4E
_0803C9A8:
	ldr r5, [sp, 0x34]
	b _0803CB4E
_0803C9AC:
	ldr r5, [sp, 0x34]
	adds r5, 0x24
	b _0803CB4E
_0803C9B2:
	cmp r4, 0x1
	beq _0803C9D0
	cmp r4, 0x1
	bgt _0803C9C0
	cmp r4, 0
	beq _0803C9CA
	b _0803CB4E
_0803C9C0:
	cmp r4, 0x2
	beq _0803C9D6
	cmp r4, 0x3
	beq _0803C9DA
	b _0803CB4E
_0803C9CA:
	mov r5, r8
	adds r5, 0x24
	b _0803CB4E
_0803C9D0:
	mov r5, r8
	adds r5, 0xC
	b _0803CB4E
_0803C9D6:
	mov r5, r8
	b _0803CB4E
_0803C9DA:
	mov r5, r8
	adds r5, 0x18
	b _0803CB4E
_0803C9E0:
	cmp r4, 0x1
	beq _0803C9FE
	cmp r4, 0x1
	bgt _0803C9EE
	cmp r4, 0
	beq _0803C9F8
	b _0803CB4E
_0803C9EE:
	cmp r4, 0x2
	beq _0803CA04
	cmp r4, 0x3
	beq _0803CA08
	b _0803CB4E
_0803C9F8:
	ldr r5, [sp, 0x38]
	adds r5, 0x18
	b _0803CB4E
_0803C9FE:
	ldr r5, [sp, 0x38]
	adds r5, 0x24
	b _0803CB4E
_0803CA04:
	ldr r5, [sp, 0x38]
	b _0803CB4E
_0803CA08:
	ldr r5, [sp, 0x38]
	adds r5, 0xC
	b _0803CB4E
_0803CA0E:
	cmp r4, 0x1
	beq _0803CA2C
	cmp r4, 0x1
	bgt _0803CA1C
	cmp r4, 0
	beq _0803CA26
	b _0803CB4E
_0803CA1C:
	cmp r4, 0x2
	beq _0803CA32
	cmp r4, 0x3
	beq _0803CA36
	b _0803CB4E
_0803CA26:
	adds r5, r3, 0
	adds r5, 0x24
	b _0803CB4E
_0803CA2C:
	adds r5, r3, 0
	adds r5, 0x18
	b _0803CB4E
_0803CA32:
	adds r5, r3, 0
	b _0803CB4E
_0803CA36:
	adds r5, r3, 0
	adds r5, 0xC
	b _0803CB4E
_0803CA3C:
	cmp r4, 0x1
	beq _0803CA5A
	cmp r4, 0x1
	bgt _0803CA4A
	cmp r4, 0
	beq _0803CA54
	b _0803CB4E
_0803CA4A:
	cmp r4, 0x2
	beq _0803CA60
	cmp r4, 0x3
	beq _0803CA66
	b _0803CB4E
_0803CA54:
	ldr r5, [sp, 0x3C]
	adds r5, 0xC
	b _0803CB4E
_0803CA5A:
	ldr r5, [sp, 0x3C]
	adds r5, 0x18
	b _0803CB4E
_0803CA60:
	ldr r5, [sp, 0x3C]
	adds r5, 0x24
	b _0803CB4E
_0803CA66:
	ldr r5, [sp, 0x3C]
	b _0803CB4E
_0803CA6A:
	cmp r4, 0x1
	beq _0803CA88
	cmp r4, 0x1
	bgt _0803CA78
	cmp r4, 0
	beq _0803CA82
	b _0803CB4E
_0803CA78:
	cmp r4, 0x2
	beq _0803CA8E
	cmp r4, 0x3
	beq _0803CA94
	b _0803CB4E
_0803CA82:
	adds r5, r7, 0
	adds r5, 0xC
	b _0803CB4E
_0803CA88:
	adds r5, r7, 0
	adds r5, 0x24
	b _0803CB4E
_0803CA8E:
	adds r5, r7, 0
	adds r5, 0x18
	b _0803CB4E
_0803CA94:
	adds r5, r7, 0
	b _0803CB4E
_0803CA98:
	cmp r4, 0x1
	beq _0803CAB6
	cmp r4, 0x1
	bgt _0803CAA6
	cmp r4, 0
	beq _0803CAB0
	b _0803CB4E
_0803CAA6:
	cmp r4, 0x2
	beq _0803CABC
	cmp r4, 0x3
	beq _0803CAC2
	b _0803CB4E
_0803CAB0:
	ldr r5, [sp, 0x40]
	adds r5, 0x18
	b _0803CB4E
_0803CAB6:
	ldr r5, [sp, 0x40]
	adds r5, 0xC
	b _0803CB4E
_0803CABC:
	ldr r5, [sp, 0x40]
	adds r5, 0x24
	b _0803CB4E
_0803CAC2:
	ldr r5, [sp, 0x40]
	b _0803CB4E
_0803CAC6:
	cmp r4, 0x1
	beq _0803CAE4
	cmp r4, 0x1
	bgt _0803CAD4
	cmp r4, 0
	beq _0803CADE
	b _0803CB4E
_0803CAD4:
	cmp r4, 0x2
	beq _0803CAEA
	cmp r4, 0x3
	beq _0803CAF0
	b _0803CB4E
_0803CADE:
	adds r5, r6, 0
	adds r5, 0x24
	b _0803CB4E
_0803CAE4:
	adds r5, r6, 0
	adds r5, 0xC
	b _0803CB4E
_0803CAEA:
	adds r5, r6, 0
	adds r5, 0x18
	b _0803CB4E
_0803CAF0:
	adds r5, r6, 0
	b _0803CB4E
_0803CAF4:
	cmp r4, 0x1
	beq _0803CB12
	cmp r4, 0x1
	bgt _0803CB02
	cmp r4, 0
	beq _0803CB0C
	b _0803CB4E
_0803CB02:
	cmp r4, 0x2
	beq _0803CB18
	cmp r4, 0x3
	beq _0803CB1E
	b _0803CB4E
_0803CB0C:
	mov r5, r9
	adds r5, 0x18
	b _0803CB4E
_0803CB12:
	mov r5, r9
	adds r5, 0x24
	b _0803CB4E
_0803CB18:
	mov r5, r9
	adds r5, 0xC
	b _0803CB4E
_0803CB1E:
	mov r5, r9
	b _0803CB4E
_0803CB22:
	cmp r4, 0x1
	beq _0803CB40
	cmp r4, 0x1
	bgt _0803CB30
	cmp r4, 0
	beq _0803CB3A
	b _0803CB4E
_0803CB30:
	cmp r4, 0x2
	beq _0803CB46
	cmp r4, 0x3
	beq _0803CB4C
	b _0803CB4E
_0803CB3A:
	adds r5, r2, 0
	adds r5, 0x24
	b _0803CB4E
_0803CB40:
	adds r5, r2, 0
	adds r5, 0x18
	b _0803CB4E
_0803CB46:
	adds r5, r2, 0
	adds r5, 0xC
	b _0803CB4E
_0803CB4C:
	adds r5, r2, 0
_0803CB4E:
	adds r0, r5, 0
	add sp, 0x4C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetSubstruct

	thumb_func_start GetMonData
GetMonData: @ 803CB60
	push {lr}
	adds r3, r0, 0
	adds r0, r1, 0
	subs r0, 0x37
	cmp r0, 0x9
	bhi _0803CBF0
	lsls r0, 2
	ldr r1, _0803CB78 @ =_0803CD50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803CB78: .4byte _0803CD50
	.align 2, 0
_0803CB7C:
	.4byte _0803CBA4
	.4byte _0803CBA8
	.4byte _0803CBB0
	.4byte _0803CBB8
	.4byte _0803CBC0
	.4byte _0803CBC8
	.4byte _0803CBD0
	.4byte _0803CBD8
	.4byte _0803CBE0
	.4byte _0803CBE8
_0803CBA4:
	ldr r0, [r3, 0x50]
	b _0803CBF6
_0803CBA8:
	adds r0, r3, 0
	adds r0, 0x54
	ldrb r0, [r0]
	b _0803CBF6
_0803CBB0:
	adds r0, r3, 0
	adds r0, 0x56
	ldrh r0, [r0]
	b _0803CBF6
_0803CBB8:
	adds r0, r3, 0
	adds r0, 0x58
	ldrh r0, [r0]
	b _0803CBF6
_0803CBC0:
	adds r0, r3, 0
	adds r0, 0x5A
	ldrh r0, [r0]
	b _0803CBF6
_0803CBC8:
	adds r0, r3, 0
	adds r0, 0x5C
	ldrh r0, [r0]
	b _0803CBF6
_0803CBD0:
	adds r0, r3, 0
	adds r0, 0x5E
	ldrh r0, [r0]
	b _0803CBF6
_0803CBD8:
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r0, [r0]
	b _0803CBF6
_0803CBE0:
	adds r0, r3, 0
	adds r0, 0x62
	ldrh r0, [r0]
	b _0803CBF6
_0803CBE8:
	adds r0, r3, 0
	adds r0, 0x55
	ldrb r0, [r0]
	b _0803CBF6
_0803CBF0:
	adds r0, r3, 0
	bl GetBoxMonData
_0803CBF6:
	pop {r1}
	bx r1
	thumb_func_end GetMonData

	thumb_func_start GetBoxMonData
GetBoxMonData: @ 803CBFC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	str r1, [sp]
	adds r7, r2, 0
	movs r4, 0
	mov r9, r4
	mov r10, r4
	movs r6, 0
	movs r5, 0
	cmp r1, 0xA
	ble _0803CC7A
	ldr r1, [r0]
	movs r2, 0
	bl GetSubstruct
	mov r9, r0
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x1
	bl GetSubstruct
	mov r10, r0
	mov r2, r8
	ldr r1, [r2]
	mov r0, r8
	movs r2, 0x2
	bl GetSubstruct
	adds r6, r0, 0
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x3
	bl GetSubstruct
	adds r5, r0, 0
	mov r0, r8
	bl DecryptBoxMon
	mov r0, r8
	bl CalculateBoxMonChecksum
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	ldrh r1, [r1, 0x1C]
	cmp r0, r1
	beq _0803CC7A
	mov r2, r8
	ldrb r0, [r2, 0x13]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x13]
	ldrb r0, [r5, 0x7]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x7]
_0803CC7A:
	ldr r0, [sp]
	cmp r0, 0x52
	bls _0803CC82
	b _0803D1DC
_0803CC82:
	lsls r0, 2
	ldr r1, _0803CC8C @ =_0803CE64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803CC8C: .4byte _0803CE64
	.align 2, 0
_0803CC90:
	.4byte _0803CDDC
	.4byte _0803CDE2
	.4byte _0803CDE8
	.4byte _0803CE5C
	.4byte _0803CE62
	.4byte _0803CE68
	.4byte _0803CE6E
	.4byte _0803CE74
	.4byte _0803CEA0
	.4byte _0803CEA6
	.4byte _0803CEAC
	.4byte _0803CEB2
	.4byte _0803CECA
	.4byte _0803CEE2
	.4byte _0803CEE2
	.4byte _0803CEE2
	.4byte _0803CEE2
	.4byte _0803CEEE
	.4byte _0803CEEE
	.4byte _0803CEEE
	.4byte _0803CEEE
	.4byte _0803CED6
	.4byte _0803CF10
	.4byte _0803CF14
	.4byte _0803CF18
	.4byte _0803CED0
	.4byte _0803CEF8
	.4byte _0803CEFC
	.4byte _0803CF00
	.4byte _0803CF04
	.4byte _0803CF08
	.4byte _0803CF0C
	.4byte _0803CEDC
	.4byte _0803CF1C
	.4byte _0803CF28
	.4byte _0803CF2C
	.4byte _0803CF30
	.4byte _0803CF38
	.4byte _0803CF40
	.4byte _0803CF4E
	.4byte _0803CF56
	.4byte _0803CF5E
	.4byte _0803CF66
	.4byte _0803CF6E
	.4byte _0803CF76
	.4byte _0803CF7E
	.4byte _0803CF82
	.4byte _0803CF20
	.4byte _0803CF24
	.4byte _0803CF48
	.4byte _0803CF88
	.4byte _0803CF90
	.4byte _0803CF98
	.4byte _0803CFA0
	.4byte _0803CFA8
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D1DC
	.4byte _0803D006
	.4byte _0803D02C
	.4byte _0803CFB0
	.4byte _0803CFB6
	.4byte _0803CFBA
	.4byte _0803CFBE
	.4byte _0803CFC2
	.4byte _0803CFCA
	.4byte _0803CFD2
	.4byte _0803CFDA
	.4byte _0803CFE2
	.4byte _0803CFE8
	.4byte _0803CFF0
	.4byte _0803CFF8
	.4byte _0803D000
	.4byte _0803D066
	.4byte _0803D0C0
	.4byte _0803D142
_0803CDDC:
	mov r1, r8
	ldr r4, [r1]
	b _0803D1DC
_0803CDE2:
	mov r2, r8
	ldr r4, [r2, 0x4]
	b _0803D1DC
_0803CDE8:
	mov r0, r8
	ldrb r1, [r0, 0x13]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803CE04
	ldr r1, _0803CE00 @ =gBadEggNickname
	adds r0, r7, 0
	bl StringCopy
	b _0803CE50
	.align 2, 0
_0803CE00: .4byte gBadEggNickname
_0803CE04:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803CE1C
	ldr r1, _0803CE18 @ =gEggNickname
	adds r0, r7, 0
	bl StringCopy
	b _0803CE50
	.align 2, 0
_0803CE18: .4byte gEggNickname
_0803CE1C:
	movs r4, 0
	mov r1, r8
	adds r1, 0x8
	mov r2, r8
	ldrb r0, [r2, 0x8]
	ldrb r3, [r2, 0x12]
	cmp r0, 0xFF
	beq _0803CE42
	adds r2, r1, 0
_0803CE2E:
	adds r1, r7, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r4, 0x1
	cmp r4, 0x9
	bhi _0803CE42
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _0803CE2E
_0803CE42:
	adds r1, r7, r4
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r7, 0
	adds r1, r3, 0
	bl ConvertInternationalString
_0803CE50:
	adds r0, r7, 0
	bl StringLength
	lsls r0, 16
	lsrs r4, r0, 16
	b _0803D1DC
_0803CE5C:
	mov r7, r8
	ldrb r4, [r7, 0x12]
	b _0803D1DC
_0803CE62:
	mov r1, r8
	ldrb r0, [r1, 0x13]
	b _0803CFEA
_0803CE68:
	mov r2, r8
	ldrb r0, [r2, 0x13]
	b _0803CFF2
_0803CE6E:
	mov r7, r8
	ldrb r0, [r7, 0x13]
	b _0803CFFA
_0803CE74:
	movs r4, 0
	mov r1, r8
	adds r1, 0x14
	mov r2, r8
	ldrb r0, [r2, 0x14]
	cmp r0, 0xFF
	beq _0803CE98
	adds r2, r1, 0
_0803CE84:
	adds r1, r7, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r4, 0x1
	cmp r4, 0x6
	bhi _0803CE98
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _0803CE84
_0803CE98:
	adds r1, r7, r4
	movs r0, 0xFF
	strb r0, [r1]
	b _0803D1DC
_0803CEA0:
	mov r7, r8
	ldrb r4, [r7, 0x1B]
	b _0803D1DC
_0803CEA6:
	mov r0, r8
	ldrh r4, [r0, 0x1C]
	b _0803D1DC
_0803CEAC:
	mov r1, r8
	ldrh r4, [r1, 0x1E]
	b _0803D1DC
_0803CEB2:
	mov r2, r8
	ldrb r1, [r2, 0x13]
	movs r0, 0x1
	ands r0, r1
	movs r4, 0xCE
	lsls r4, 1
	cmp r0, 0
	beq _0803CEC4
	b _0803D1DC
_0803CEC4:
	mov r7, r9
	ldrh r4, [r7]
	b _0803D1DC
_0803CECA:
	mov r0, r9
	ldrh r4, [r0, 0x2]
	b _0803D1DC
_0803CED0:
	mov r1, r9
	ldr r4, [r1, 0x4]
	b _0803D1DC
_0803CED6:
	mov r2, r9
	ldrb r4, [r2, 0x8]
	b _0803D1DC
_0803CEDC:
	mov r7, r9
	ldrb r4, [r7, 0x9]
	b _0803D1DC
_0803CEE2:
	ldr r0, [sp]
	subs r0, 0xD
	lsls r0, 1
	add r0, r10
	ldrh r4, [r0]
	b _0803D1DC
_0803CEEE:
	ldr r0, [sp]
	add r0, r10
	subs r0, 0x9
	ldrb r4, [r0]
	b _0803D1DC
_0803CEF8:
	ldrb r4, [r6]
	b _0803D1DC
_0803CEFC:
	ldrb r4, [r6, 0x1]
	b _0803D1DC
_0803CF00:
	ldrb r4, [r6, 0x2]
	b _0803D1DC
_0803CF04:
	ldrb r4, [r6, 0x3]
	b _0803D1DC
_0803CF08:
	ldrb r4, [r6, 0x4]
	b _0803D1DC
_0803CF0C:
	ldrb r4, [r6, 0x5]
	b _0803D1DC
_0803CF10:
	ldrb r4, [r6, 0x6]
	b _0803D1DC
_0803CF14:
	ldrb r4, [r6, 0x7]
	b _0803D1DC
_0803CF18:
	ldrb r4, [r6, 0x8]
	b _0803D1DC
_0803CF1C:
	ldrb r4, [r6, 0x9]
	b _0803D1DC
_0803CF20:
	ldrb r4, [r6, 0xA]
	b _0803D1DC
_0803CF24:
	ldrb r4, [r6, 0xB]
	b _0803D1DC
_0803CF28:
	ldrb r4, [r5]
	b _0803D1DC
_0803CF2C:
	ldrb r4, [r5, 0x1]
	b _0803D1DC
_0803CF30:
	ldrb r0, [r5, 0x2]
	lsls r0, 25
	lsrs r4, r0, 25
	b _0803D1DC
_0803CF38:
	ldrh r0, [r5, 0x2]
	lsls r0, 21
	lsrs r4, r0, 28
	b _0803D1DC
_0803CF40:
	ldrb r0, [r5, 0x3]
	lsls r0, 25
	lsrs r4, r0, 28
	b _0803D1DC
_0803CF48:
	ldrb r0, [r5, 0x3]
	lsrs r4, r0, 7
	b _0803D1DC
_0803CF4E:
	ldrb r0, [r5, 0x4]
	lsls r0, 27
	lsrs r4, r0, 27
	b _0803D1DC
_0803CF56:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r4, r0, 27
	b _0803D1DC
_0803CF5E:
	ldrb r0, [r5, 0x5]
	lsls r0, 25
	lsrs r4, r0, 27
	b _0803D1DC
_0803CF66:
	ldr r0, [r5, 0x4]
	lsls r0, 12
	lsrs r4, r0, 27
	b _0803D1DC
_0803CF6E:
	ldrh r0, [r5, 0x6]
	lsls r0, 23
	lsrs r4, r0, 27
	b _0803D1DC
_0803CF76:
	ldrb r0, [r5, 0x7]
	lsls r0, 26
	lsrs r4, r0, 27
	b _0803D1DC
_0803CF7E:
	ldrb r0, [r5, 0x7]
	b _0803CFDC
_0803CF82:
	ldrb r0, [r5, 0x7]
	lsrs r4, r0, 7
	b _0803D1DC
_0803CF88:
	ldrb r0, [r5, 0x8]
	lsls r0, 29
	lsrs r4, r0, 29
	b _0803D1DC
_0803CF90:
	ldrb r0, [r5, 0x8]
	lsls r0, 26
	lsrs r4, r0, 29
	b _0803D1DC
_0803CF98:
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r4, r0, 29
	b _0803D1DC
_0803CFA0:
	ldrb r0, [r5, 0x9]
	lsls r0, 28
	lsrs r4, r0, 29
	b _0803D1DC
_0803CFA8:
	ldrb r0, [r5, 0x9]
	lsls r0, 25
	lsrs r4, r0, 29
	b _0803D1DC
_0803CFB0:
	ldrb r0, [r5, 0x9]
	lsrs r4, r0, 7
	b _0803D1DC
_0803CFB6:
	ldrb r0, [r5, 0xA]
	b _0803CFEA
_0803CFBA:
	ldrb r0, [r5, 0xA]
	b _0803CFF2
_0803CFBE:
	ldrb r0, [r5, 0xA]
	b _0803CFFA
_0803CFC2:
	ldrb r0, [r5, 0xA]
	lsls r0, 28
	lsrs r4, r0, 31
	b _0803D1DC
_0803CFCA:
	ldrb r0, [r5, 0xA]
	lsls r0, 27
	lsrs r4, r0, 31
	b _0803D1DC
_0803CFD2:
	ldrb r0, [r5, 0xA]
	lsls r0, 26
	lsrs r4, r0, 31
	b _0803D1DC
_0803CFDA:
	ldrb r0, [r5, 0xA]
_0803CFDC:
	lsls r0, 25
	lsrs r4, r0, 31
	b _0803D1DC
_0803CFE2:
	ldrb r0, [r5, 0xA]
	lsrs r4, r0, 7
	b _0803D1DC
_0803CFE8:
	ldrb r0, [r5, 0xB]
_0803CFEA:
	lsls r0, 31
	lsrs r4, r0, 31
	b _0803D1DC
_0803CFF0:
	ldrb r0, [r5, 0xB]
_0803CFF2:
	lsls r0, 30
	lsrs r4, r0, 31
	b _0803D1DC
_0803CFF8:
	ldrb r0, [r5, 0xB]
_0803CFFA:
	lsls r0, 29
	lsrs r4, r0, 31
	b _0803D1DC
_0803D000:
	ldrb r0, [r5, 0xB]
	lsrs r4, r0, 3
	b _0803D1DC
_0803D006:
	mov r0, r9
	ldrh r4, [r0]
	cmp r4, 0
	bne _0803D010
	b _0803D1DC
_0803D010:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	blt _0803D026
	mov r2, r8
	ldrb r1, [r2, 0x13]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0803D026
	b _0803D1DC
_0803D026:
	movs r4, 0xCE
	lsls r4, 1
	b _0803D1DC
_0803D02C:
	ldrb r0, [r5, 0x4]
	lsls r0, 27
	lsrs r4, r0, 27
	ldrh r1, [r5, 0x4]
	movs r0, 0xF8
	lsls r0, 2
	ands r0, r1
	orrs r4, r0
	ldrb r0, [r5, 0x5]
	lsls r0, 25
	lsrs r0, 27
	lsls r0, 10
	orrs r4, r0
	ldr r0, [r5, 0x4]
	movs r1, 0xF8
	lsls r1, 12
	ands r0, r1
	orrs r4, r0
	ldrh r0, [r5, 0x6]
	lsls r0, 23
	lsrs r0, 27
	lsls r0, 20
	orrs r4, r0
	ldrb r0, [r5, 0x7]
	lsls r0, 26
	lsrs r0, 27
	lsls r0, 25
	orrs r4, r0
	b _0803D1DC
_0803D066:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	bne _0803D070
	b _0803D1DC
_0803D070:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _0803D07A
	b _0803D1DC
_0803D07A:
	ldrh r0, [r7]
	ldr r1, _0803D0B8 @ =0x00000163
	cmp r0, r1
	bne _0803D084
	b _0803D1DC
_0803D084:
	mov r2, r10
	ldrh r5, [r2]
	adds r6, r1, 0
	adds r2, r7, 0
	ldr r1, _0803D0BC @ =gBitTable
_0803D08E:
	ldrh r3, [r2]
	cmp r5, r3
	beq _0803D0A8
	mov r7, r10
	ldrh r0, [r7, 0x2]
	cmp r0, r3
	beq _0803D0A8
	ldrh r0, [r7, 0x4]
	cmp r0, r3
	beq _0803D0A8
	ldrh r0, [r7, 0x6]
	cmp r0, r3
	bne _0803D0AC
_0803D0A8:
	ldr r0, [r1]
	orrs r4, r0
_0803D0AC:
	adds r2, 0x2
	adds r1, 0x4
	ldrh r0, [r2]
	cmp r0, r6
	bne _0803D08E
	b _0803D1DC
	.align 2, 0
_0803D0B8: .4byte 0x00000163
_0803D0BC: .4byte gBitTable
_0803D0C0:
	movs r4, 0
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	bne _0803D0CC
	b _0803D1DC
_0803D0CC:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _0803D0D6
	b _0803D1DC
_0803D0D6:
	ldrb r0, [r5, 0x8]
	lsls r1, r0, 29
	lsrs r4, r1, 29
	lsls r0, 26
	lsrs r0, 29
	adds r4, r0
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r0, 29
	adds r4, r0
	ldrb r1, [r5, 0x9]
	lsls r0, r1, 28
	lsrs r0, 29
	adds r4, r0
	lsls r0, r1, 25
	lsrs r0, 29
	adds r4, r0
	lsrs r1, 7
	adds r4, r1
	ldrb r1, [r5, 0xA]
	lsls r0, r1, 31
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 29
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 28
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 27
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 26
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 25
	lsrs r0, 31
	adds r4, r0
	lsrs r1, 7
	adds r4, r1
	ldrb r1, [r5, 0xB]
	lsls r0, r1, 31
	lsrs r0, 31
	adds r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	adds r4, r0
	lsls r1, 29
	lsrs r1, 31
	adds r4, r1
	b _0803D1DC
_0803D142:
	movs r4, 0
	mov r2, r9
	ldrh r0, [r2]
	cmp r0, 0
	beq _0803D1DC
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	blt _0803D1DC
	ldrb r2, [r5, 0x9]
	lsrs r4, r2, 7
	ldrb r1, [r5, 0x8]
	lsls r0, r1, 29
	lsrs r0, 28
	orrs r4, r0
	lsls r1, 26
	lsrs r1, 29
	lsls r1, 4
	orrs r4, r1
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r0, 29
	lsls r0, 7
	orrs r4, r0
	lsls r0, r2, 28
	lsrs r0, 29
	lsls r0, 10
	orrs r4, r0
	lsls r2, 25
	lsrs r2, 29
	lsls r2, 13
	orrs r4, r2
	ldrb r1, [r5, 0xA]
	lsls r0, r1, 31
	lsrs r0, 31
	lsls r0, 16
	orrs r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	lsls r0, 17
	orrs r4, r0
	lsls r0, r1, 29
	lsrs r0, 31
	lsls r0, 18
	orrs r4, r0
	lsls r0, r1, 28
	lsrs r0, 31
	lsls r0, 19
	orrs r4, r0
	lsls r0, r1, 27
	lsrs r0, 31
	lsls r0, 20
	orrs r4, r0
	lsls r0, r1, 26
	lsrs r0, 31
	lsls r0, 21
	orrs r4, r0
	lsls r0, r1, 25
	lsrs r0, 31
	lsls r0, 22
	orrs r4, r0
	lsrs r1, 7
	lsls r1, 23
	orrs r4, r1
	ldrb r1, [r5, 0xB]
	lsls r0, r1, 31
	lsrs r0, 31
	lsls r0, 24
	orrs r4, r0
	lsls r0, r1, 30
	lsrs r0, 31
	lsls r0, 25
	orrs r4, r0
	lsls r1, 29
	lsrs r1, 31
	lsls r1, 26
	orrs r4, r1
_0803D1DC:
	ldr r7, [sp]
	cmp r7, 0xA
	ble _0803D1E8
	mov r0, r8
	bl EncryptBoxMon
_0803D1E8:
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonData

	thumb_func_start SetMonData
SetMonData: @ 803D1FC
	push {lr}
	adds r3, r0, 0
	adds r0, r1, 0
	subs r0, 0x37
	cmp r0, 0xA
	bhi _0803D2E0
	lsls r0, 2
	ldr r1, _0803D214 @ =_0803D3EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D214: .4byte _0803D3EC
	.align 2, 0
_0803D218:
	.4byte _0803D244
	.4byte _0803D25C
	.4byte _0803D266
	.4byte _0803D276
	.4byte _0803D286
	.4byte _0803D296
	.4byte _0803D2A6
	.4byte _0803D2B6
	.4byte _0803D2C6
	.4byte _0803D2D6
	.4byte _0803D2E6
_0803D244:
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3, 0x50]
	b _0803D2E6
_0803D25C:
	ldrb r1, [r2]
	adds r0, r3, 0
	adds r0, 0x54
	strb r1, [r0]
	b _0803D2E6
_0803D266:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x56
	strh r0, [r1]
	b _0803D2E6
_0803D276:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x58
	strh r0, [r1]
	b _0803D2E6
_0803D286:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5A
	strh r0, [r1]
	b _0803D2E6
_0803D296:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5C
	strh r0, [r1]
	b _0803D2E6
_0803D2A6:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	b _0803D2E6
_0803D2B6:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x60
	strh r0, [r1]
	b _0803D2E6
_0803D2C6:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x62
	strh r0, [r1]
	b _0803D2E6
_0803D2D6:
	ldrb r1, [r2]
	adds r0, r3, 0
	adds r0, 0x55
	strb r1, [r0]
	b _0803D2E6
_0803D2E0:
	adds r0, r3, 0
	bl SetBoxMonData
_0803D2E6:
	pop {r0}
	bx r0
	thumb_func_end SetMonData

	thumb_func_start SetBoxMonData
SetBoxMonData: @ 803D2EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	mov r10, r1
	adds r4, r2, 0
	movs r0, 0
	mov r8, r0
	mov r9, r0
	movs r6, 0
	movs r5, 0
	cmp r1, 0xA
	ble _0803D36C
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0
	bl GetSubstruct
	mov r8, r0
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0x1
	bl GetSubstruct
	mov r9, r0
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0x2
	bl GetSubstruct
	adds r6, r0, 0
	ldr r1, [r7]
	adds r0, r7, 0
	movs r2, 0x3
	bl GetSubstruct
	adds r5, r0, 0
	adds r0, r7, 0
	bl DecryptBoxMon
	adds r0, r7, 0
	bl CalculateBoxMonChecksum
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r7, 0x1C]
	cmp r0, r1
	beq _0803D36C
	ldrb r0, [r7, 0x13]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r7, 0x13]
	ldrb r0, [r5, 0x7]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x7]
	adds r0, r7, 0
	bl EncryptBoxMon
	b _0803D8F6
_0803D36C:
	mov r0, r10
	cmp r0, 0x4F
	bls _0803D374
	b _0803D8E2
_0803D374:
	lsls r0, 2
	ldr r1, _0803D380 @ =_0803D558
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D380: .4byte _0803D558
	.align 2, 0
_0803D384:
	.4byte _0803D4C4
	.4byte _0803D4DC
	.4byte _0803D4F4
	.4byte _0803D50A
	.4byte _0803D510
	.4byte _0803D520
	.4byte _0803D532
	.4byte _0803D544
	.4byte _0803D55A
	.4byte _0803D560
	.4byte _0803D56C
	.4byte _0803D578
	.4byte _0803D598
	.4byte _0803D5D0
	.4byte _0803D5D0
	.4byte _0803D5D0
	.4byte _0803D5D0
	.4byte _0803D5E4
	.4byte _0803D5E4
	.4byte _0803D5E4
	.4byte _0803D5E4
	.4byte _0803D5C0
	.4byte _0803D614
	.4byte _0803D61A
	.4byte _0803D620
	.4byte _0803D5A6
	.4byte _0803D5F0
	.4byte _0803D5F6
	.4byte _0803D5FC
	.4byte _0803D602
	.4byte _0803D608
	.4byte _0803D60E
	.4byte _0803D5C8
	.4byte _0803D626
	.4byte _0803D638
	.4byte _0803D63E
	.4byte _0803D644
	.4byte _0803D658
	.4byte _0803D670
	.4byte _0803D696
	.4byte _0803D6AA
	.4byte _0803D6C4
	.4byte _0803D6DA
	.4byte _0803D6F4
	.4byte _0803D70C
	.4byte _0803D720
	.4byte _0803D750
	.4byte _0803D62C
	.4byte _0803D632
	.4byte _0803D686
	.4byte _0803D760
	.4byte _0803D76E
	.4byte _0803D784
	.4byte _0803D79C
	.4byte _0803D7AC
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D8E2
	.4byte _0803D89A
	.4byte _0803D7C2
	.4byte _0803D7D2
	.4byte _0803D7E0
	.4byte _0803D7F0
	.4byte _0803D800
	.4byte _0803D810
	.4byte _0803D820
	.4byte _0803D830
	.4byte _0803D846
	.4byte _0803D856
	.4byte _0803D864
	.4byte _0803D874
	.4byte _0803D88A
_0803D4C4:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r4, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r7]
	b _0803D8E2
_0803D4DC:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r4, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r7, 0x4]
	b _0803D8E2
_0803D4F4:
	movs r2, 0
	adds r3, r7, 0
	adds r3, 0x8
_0803D4FA:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _0803D4FA
	b _0803D8E2
_0803D50A:
	ldrb r0, [r4]
	strb r0, [r7, 0x12]
	b _0803D8E2
_0803D510:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r7, 0x13]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	b _0803D73E
_0803D520:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r7, 0x13]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	b _0803D73E
_0803D532:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x13]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _0803D73E
_0803D544:
	movs r2, 0
	adds r3, r7, 0
	adds r3, 0x14
_0803D54A:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _0803D54A
	b _0803D8E2
_0803D55A:
	ldrb r0, [r4]
	strb r0, [r7, 0x1B]
	b _0803D8E2
_0803D560:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r7, 0x1C]
	b _0803D8E2
_0803D56C:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r7, 0x1E]
	b _0803D8E2
_0803D578:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	mov r0, r8
	strh r1, [r0]
	lsls r1, 16
	cmp r1, 0
	beq _0803D590
	ldrb r0, [r7, 0x13]
	movs r1, 0x2
	b _0803D73E
_0803D590:
	ldrb r1, [r7, 0x13]
	movs r0, 0x3
	negs r0, r0
	b _0803D74A
_0803D598:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x2]
	b _0803D8E2
_0803D5A6:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r4, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	adds r1, r0
	mov r0, r8
	str r1, [r0, 0x4]
	b _0803D8E2
_0803D5C0:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, 0x8]
	b _0803D8E2
_0803D5C8:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, 0x9]
	b _0803D8E2
_0803D5D0:
	mov r2, r10
	subs r2, 0xD
	lsls r2, 1
	add r2, r9
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r2]
	b _0803D8E2
_0803D5E4:
	mov r0, r9
	add r0, r10
	subs r0, 0x9
	ldrb r1, [r4]
	strb r1, [r0]
	b _0803D8E2
_0803D5F0:
	ldrb r0, [r4]
	strb r0, [r6]
	b _0803D8E2
_0803D5F6:
	ldrb r0, [r4]
	strb r0, [r6, 0x1]
	b _0803D8E2
_0803D5FC:
	ldrb r0, [r4]
	strb r0, [r6, 0x2]
	b _0803D8E2
_0803D602:
	ldrb r0, [r4]
	strb r0, [r6, 0x3]
	b _0803D8E2
_0803D608:
	ldrb r0, [r4]
	strb r0, [r6, 0x4]
	b _0803D8E2
_0803D60E:
	ldrb r0, [r4]
	strb r0, [r6, 0x5]
	b _0803D8E2
_0803D614:
	ldrb r0, [r4]
	strb r0, [r6, 0x6]
	b _0803D8E2
_0803D61A:
	ldrb r0, [r4]
	strb r0, [r6, 0x7]
	b _0803D8E2
_0803D620:
	ldrb r0, [r4]
	strb r0, [r6, 0x8]
	b _0803D8E2
_0803D626:
	ldrb r0, [r4]
	strb r0, [r6, 0x9]
	b _0803D8E2
_0803D62C:
	ldrb r0, [r4]
	strb r0, [r6, 0xA]
	b _0803D8E2
_0803D632:
	ldrb r0, [r4]
	strb r0, [r6, 0xB]
	b _0803D8E2
_0803D638:
	ldrb r0, [r4]
	strb r0, [r5]
	b _0803D8E2
_0803D63E:
	ldrb r0, [r4]
	strb r0, [r5, 0x1]
	b _0803D8E2
_0803D644:
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r1, r0
	ldrb r2, [r5, 0x2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x2]
	b _0803D8E2
_0803D658:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r1, r0
	lsls r1, 7
	ldrh r2, [r5, 0x2]
	ldr r0, _0803D66C @ =0xfffff87f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x2]
	b _0803D8E2
	.align 2, 0
_0803D66C: .4byte 0xfffff87f
_0803D670:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0x3]
	movs r0, 0x79
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	b _0803D8E2
_0803D686:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x3]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	b _0803D8E2
_0803D696:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	ldrb r2, [r5, 0x4]
	movs r0, 0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x4]
	b _0803D8E2
_0803D6AA:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r5, 0x4]
	ldr r0, _0803D6C0 @ =0xfffffc1f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	b _0803D8E2
	.align 2, 0
_0803D6C0: .4byte 0xfffffc1f
_0803D6C4:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _0803D8E2
_0803D6DA:
	ldrb r2, [r4]
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 15
	ldr r0, [r5, 0x4]
	ldr r1, _0803D6F0 @ =0xfff07fff
	ands r0, r1
	orrs r0, r2
	str r0, [r5, 0x4]
	b _0803D8E2
	.align 2, 0
_0803D6F0: .4byte 0xfff07fff
_0803D6F4:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 4
	ldrh r2, [r5, 0x6]
	ldr r0, _0803D708 @ =0xfffffe0f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x6]
	b _0803D8E2
	.align 2, 0
_0803D708: .4byte 0xfffffe0f
_0803D70C:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x7]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	b _0803D8E0
_0803D720:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r5, 0x7]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _0803D744
	ldrb r0, [r7, 0x13]
	movs r1, 0x4
_0803D73E:
	orrs r0, r1
	strb r0, [r7, 0x13]
	b _0803D8E2
_0803D744:
	ldrb r1, [r7, 0x13]
	movs r0, 0x5
	negs r0, r0
_0803D74A:
	ands r0, r1
	strb r0, [r7, 0x13]
	b _0803D8E2
_0803D750:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x7]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x7]
	b _0803D8E2
_0803D760:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	ldrb r2, [r5, 0x8]
	movs r0, 0x8
	negs r0, r0
	b _0803D77C
_0803D76E:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0x8]
	movs r0, 0x39
	negs r0, r0
_0803D77C:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x8]
	b _0803D8E2
_0803D784:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 6
	ldrh r2, [r5, 0x8]
	ldr r0, _0803D798 @ =0xfffffe3f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x8]
	b _0803D8E2
	.align 2, 0
_0803D798: .4byte 0xfffffe3f
_0803D79C:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x9]
	movs r0, 0xF
	negs r0, r0
	b _0803D7BA
_0803D7AC:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5, 0x9]
	movs r0, 0x71
	negs r0, r0
_0803D7BA:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x9]
	b _0803D8E2
_0803D7C2:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x9]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x9]
	b _0803D8E2
_0803D7D2:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	ldrb r2, [r5, 0xA]
	movs r0, 0x2
	negs r0, r0
	b _0803D83E
_0803D7E0:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0xA]
	movs r0, 0x3
	negs r0, r0
	b _0803D83E
_0803D7F0:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0xA]
	movs r0, 0x5
	negs r0, r0
	b _0803D83E
_0803D800:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0xA]
	movs r0, 0x9
	negs r0, r0
	b _0803D83E
_0803D810:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5, 0xA]
	movs r0, 0x11
	negs r0, r0
	b _0803D83E
_0803D820:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 5
	ldrb r2, [r5, 0xA]
	movs r0, 0x21
	negs r0, r0
	b _0803D83E
_0803D830:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r5, 0xA]
	movs r0, 0x41
	negs r0, r0
_0803D83E:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xA]
	b _0803D8E2
_0803D846:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0xA]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0xA]
	b _0803D8E2
_0803D856:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	ldrb r2, [r5, 0xB]
	movs r0, 0x2
	negs r0, r0
	b _0803D882
_0803D864:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0xB]
	movs r0, 0x3
	negs r0, r0
	b _0803D882
_0803D874:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0xB]
	movs r0, 0x5
	negs r0, r0
_0803D882:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xB]
	b _0803D8E2
_0803D88A:
	ldrb r0, [r4]
	lsls r0, 3
	ldrb r2, [r5, 0xB]
	movs r1, 0x7
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0xB]
	b _0803D8E2
_0803D89A:
	ldrb r1, [r4]
	movs r4, 0x1F
	adds r2, r1, 0
	ands r2, r4
	ldrb r3, [r5, 0x4]
	movs r0, 0x20
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, 0x4]
	lsrs r1, 5
	ands r1, r4
	lsls r1, 5
	ldrh r2, [r5, 0x4]
	ldr r0, _0803D904 @ =0xfffffc1f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldrb r1, [r5, 0x5]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x5]
	ldr r0, [r5, 0x4]
	ldr r1, _0803D908 @ =0xfff07fff
	ands r0, r1
	str r0, [r5, 0x4]
	ldrh r1, [r5, 0x6]
	ldr r0, _0803D90C @ =0xfffffe0f
	ands r0, r1
	strh r0, [r5, 0x6]
	ldrb r1, [r5, 0x7]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
_0803D8E0:
	strb r0, [r5, 0x7]
_0803D8E2:
	mov r0, r10
	cmp r0, 0xA
	ble _0803D8F6
	adds r0, r7, 0
	bl CalculateBoxMonChecksum
	strh r0, [r7, 0x1C]
	adds r0, r7, 0
	bl EncryptBoxMon
_0803D8F6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D904: .4byte 0xfffffc1f
_0803D908: .4byte 0xfff07fff
_0803D90C: .4byte 0xfffffe0f
	thumb_func_end SetBoxMonData

	thumb_func_start CopyMon
CopyMon: @ 803D910
	push {lr}
	bl memcpy
	pop {r0}
	bx r0
	thumb_func_end CopyMon

	thumb_func_start GiveMonToPlayer
GiveMonToPlayer: @ 803D91C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _0803D948 @ =gSaveBlock2
	movs r1, 0x7
	adds r2, r4, 0
	bl SetMonData
	adds r2, r4, 0
	adds r2, 0x8
	adds r0, r6, 0
	movs r1, 0x31
	bl SetMonData
	adds r4, 0xA
	adds r0, r6, 0
	movs r1, 0x1
	adds r2, r4, 0
	bl SetMonData
	movs r5, 0
	b _0803D94E
	.align 2, 0
_0803D948: .4byte gSaveBlock2
_0803D94C:
	adds r5, 0x1
_0803D94E:
	cmp r5, 0x5
	bgt _0803D988
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0803D980 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803D94C
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x64
	bl CopyMon
	ldr r1, _0803D984 @ =gPlayerPartyCount
	adds r0, r5, 0x1
	strb r0, [r1]
	movs r0, 0
	b _0803D992
	.align 2, 0
_0803D980: .4byte gPlayerParty
_0803D984: .4byte gPlayerPartyCount
_0803D988:
	adds r0, r6, 0
	bl SendMonToPC
	lsls r0, 24
	lsrs r0, 24
_0803D992:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GiveMonToPlayer

	thumb_func_start SendMonToPC
SendMonToPC: @ 803D998
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r9, r0
	ldr r0, _0803D9E8 @ =gPokemonStorage
	ldrb r5, [r0]
_0803D9A8:
	movs r7, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	mov r8, r0
	movs r6, 0
_0803D9B8:
	ldr r3, _0803D9EC @ =gUnknown_020300A4
	adds r0, r6, r3
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	str r3, [sp]
	bl GetBoxMonData
	ldr r3, [sp]
	cmp r0, 0
	bne _0803D9F0
	mov r0, r9
	bl sub_8040B1C
	adds r0, r4, 0
	mov r1, r9
	movs r2, 0x50
	bl CopyMon
	movs r0, 0x1
	b _0803DA0A
	.align 2, 0
_0803D9E8: .4byte gPokemonStorage
_0803D9EC: .4byte gUnknown_020300A4
_0803D9F0:
	adds r6, 0x50
	adds r7, 0x1
	cmp r7, 0x1D
	ble _0803D9B8
	adds r5, 0x1
	cmp r5, 0xE
	bne _0803DA00
	movs r5, 0
_0803DA00:
	subs r0, r3, 0x4
	ldrb r0, [r0]
	cmp r5, r0
	bne _0803D9A8
	movs r0, 0x2
_0803DA0A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end SendMonToPC

	thumb_func_start CalculatePlayerPartyCount
CalculatePlayerPartyCount: @ 803DA18
	push {r4,lr}
	ldr r0, _0803DA24 @ =gPlayerPartyCount
	movs r1, 0
	strb r1, [r0]
	b _0803DA30
	.align 2, 0
_0803DA24: .4byte gPlayerPartyCount
_0803DA28:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0
_0803DA30:
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0803DA4E
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803DA58 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DA28
_0803DA4E:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DA58: .4byte gPlayerParty
	thumb_func_end CalculatePlayerPartyCount

	thumb_func_start CalculateEnemyPartyCount
CalculateEnemyPartyCount: @ 803DA5C
	push {r4,lr}
	ldr r0, _0803DA68 @ =gEnemyPartyCount
	movs r1, 0
	strb r1, [r0]
	b _0803DA74
	.align 2, 0
_0803DA68: .4byte gEnemyPartyCount
_0803DA6C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0
_0803DA74:
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0803DA92
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803DA9C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DA6C
_0803DA92:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DA9C: .4byte gEnemyParty
	thumb_func_end CalculateEnemyPartyCount

	thumb_func_start sub_803DAA0
sub_803DAA0: @ 803DAA0
	push {r4-r6,lr}
	movs r6, 0
	bl CalculatePlayerPartyCount
	ldr r1, _0803DB0C @ =gPlayerPartyCount
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _0803DB04
	movs r5, 0
	ldrb r1, [r1]
	cmp r6, r1
	bge _0803DAFC
_0803DAB8:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0803DB10 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0803DAF2
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0803DAF2
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0803DAF2
	adds r6, 0x1
_0803DAF2:
	adds r5, 0x1
	ldr r0, _0803DB0C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803DAB8
_0803DAFC:
	movs r0, 0
	cmp r6, 0x1
	bgt _0803DB04
	movs r0, 0x2
_0803DB04:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803DB0C: .4byte gPlayerPartyCount
_0803DB10: .4byte gPlayerParty
	thumb_func_end sub_803DAA0

	thumb_func_start GetAbilityBySpecies
GetAbilityBySpecies: @ 803DB14
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	cmp r1, 0
	beq _0803DB38
	ldr r2, _0803DB30 @ =byte_2024C06
	ldr r1, _0803DB34 @ =gBaseStats
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x17]
	b _0803DB46
	.align 2, 0
_0803DB30: .4byte byte_2024C06
_0803DB34: .4byte gBaseStats
_0803DB38:
	ldr r2, _0803DB50 @ =byte_2024C06
	ldr r1, _0803DB54 @ =gBaseStats
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
_0803DB46:
	strb r0, [r2]
	ldrb r0, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_0803DB50: .4byte byte_2024C06
_0803DB54: .4byte gBaseStats
	thumb_func_end GetAbilityBySpecies

	thumb_func_start GetMonAbility
GetMonAbility: @ 803DB58
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x2E
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetAbilityBySpecies
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetMonAbility

	thumb_func_start CreateSecretBaseEnemyParty
CreateSecretBaseEnemyParty: @ 803DB8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r0, 0
	bl ZeroEnemyPartyMons
	ldr r5, _0803DC8C @ =0x02017000
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xA0
	bl memcpy
	movs r7, 0
_0803DBAC:
	lsls r0, r7, 1
	mov r9, r0
	ldr r2, _0803DC8C @ =0x02017000
	adds r2, 0x7C
	mov r10, r2
	mov r1, r9
	add r1, r10
	ldrh r0, [r1]
	adds r2, r7, 0x1
	str r2, [sp, 0x10]
	cmp r0, 0
	beq _0803DC64
	movs r0, 0x64
	adds r6, r7, 0
	muls r6, r0
	ldr r2, _0803DC90 @ =gEnemyParty
	mov r8, r2
	adds r5, r6, r2
	ldrh r1, [r1]
	ldr r0, _0803DC8C @ =0x02017000
	adds r0, 0x94
	adds r0, r7, r0
	ldrb r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	lsls r4, r7, 2
	ldr r0, _0803DC8C @ =0x02017000
	adds r0, 0x34
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x2
	str r0, [sp, 0x8]
	movs r0, 0
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r3, 0xF
	bl CreateMon
	ldr r2, _0803DC94 @ =0x02017088
	add r2, r9
	adds r0, r5, 0
	movs r1, 0xC
	bl SetMonData
	movs r5, 0
	mov r9, r4
	mov r3, r8
	mov r4, r10
	adds r4, 0x1E
_0803DC10:
	adds r1, r5, 0
	adds r1, 0x1A
	adds r0, r6, r3
	adds r2, r7, r4
	str r3, [sp, 0x14]
	bl SetMonData
	adds r5, 0x1
	ldr r3, [sp, 0x14]
	cmp r5, 0x5
	ble _0803DC10
	movs r5, 0
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0803DC90 @ =gEnemyParty
	adds r7, r1, r0
	mov r2, r9
	lsls r6, r2, 1
_0803DC36:
	adds r1, r5, 0
	adds r1, 0xD
	ldr r4, _0803DC98 @ =0x0201704c
	adds r4, r6, r4
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	adds r1, r5, 0
	adds r1, 0x11
	ldrh r0, [r4]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0803DC9C @ =0x08208100
	adds r2, r0
	adds r0, r7, 0
	bl SetMonData
	adds r6, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803DC36
_0803DC64:
	ldr r7, [sp, 0x10]
	cmp r7, 0x5
	ble _0803DBAC
	ldr r1, _0803DCA0 @ =gUnknown_020239F8
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _0803DCA4 @ =gTrainerBattleOpponent
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DC8C: .4byte 0x02017000
_0803DC90: .4byte gEnemyParty
_0803DC94: .4byte 0x02017088
_0803DC98: .4byte 0x0201704c
_0803DC9C: .4byte 0x08208100
_0803DCA0: .4byte gUnknown_020239F8
_0803DCA4: .4byte gTrainerBattleOpponent
	thumb_func_end CreateSecretBaseEnemyParty

	thumb_func_start GetSecretBaseTrainerPicIndex
GetSecretBaseTrainerPicIndex: @ 803DCA8
	push {r4,r5,lr}
	ldr r5, _0803DCD8 @ =gSecretBaseTrainerClasses
	ldr r4, _0803DCDC @ =0x02017000
	ldrb r0, [r4, 0x9]
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4, 0x1]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _0803DCE0 @ =gTrainerClassToPicIndex
	adds r0, r1
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803DCD8: .4byte gSecretBaseTrainerClasses
_0803DCDC: .4byte 0x02017000
_0803DCE0: .4byte gTrainerClassToPicIndex
	thumb_func_end GetSecretBaseTrainerPicIndex

	thumb_func_start GetSecretBaseTrainerNameIndex
GetSecretBaseTrainerNameIndex: @ 803DCE4
	push {r4,r5,lr}
	ldr r5, _0803DD14 @ =gSecretBaseTrainerClasses
	ldr r4, _0803DD18 @ =0x02017000
	ldrb r0, [r4, 0x9]
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4, 0x1]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	adds r0, r5
	ldrb r0, [r0]
	ldr r1, _0803DD1C @ =gTrainerClassToNameIndex
	adds r0, r1
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803DD14: .4byte gSecretBaseTrainerClasses
_0803DD18: .4byte 0x02017000
_0803DD1C: .4byte gTrainerClassToNameIndex
	thumb_func_end GetSecretBaseTrainerNameIndex

	thumb_func_start PlayerPartyAndPokemonStorageFull
PlayerPartyAndPokemonStorageFull: @ 803DD20
	push {r4,lr}
	movs r4, 0
_0803DD24:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0803DD3C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DD40
	movs r0, 0
	b _0803DD4E
	.align 2, 0
_0803DD3C: .4byte gPlayerParty
_0803DD40:
	adds r4, 0x1
	cmp r4, 0x5
	ble _0803DD24
	bl PokemonStorageFull
	lsls r0, 24
	lsrs r0, 24
_0803DD4E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end PlayerPartyAndPokemonStorageFull

	thumb_func_start PokemonStorageFull
PokemonStorageFull: @ 803DD54
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r7, 0
_0803DD5C:
	movs r5, 0
	adds r6, r7, 0
	movs r4, 0
_0803DD62:
	ldr r0, _0803DD7C @ =gUnknown_020300A4
	adds r0, r4, r0
	adds r0, r6, r0
	movs r1, 0xB
	movs r2, 0
	str r3, [sp]
	bl GetBoxMonData
	ldr r3, [sp]
	cmp r0, 0
	bne _0803DD80
	movs r0, 0
	b _0803DD96
	.align 2, 0
_0803DD7C: .4byte gUnknown_020300A4
_0803DD80:
	adds r4, 0x50
	adds r5, 0x1
	cmp r5, 0x1D
	ble _0803DD62
	movs r0, 0x96
	lsls r0, 4
	adds r7, r0
	adds r3, 0x1
	cmp r3, 0xD
	ble _0803DD5C
	movs r0, 0x1
_0803DD96:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end PokemonStorageFull

	thumb_func_start GetSpeciesName
GetSpeciesName: @ 803DDA0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r1, 0
	movs r0, 0xCE
	lsls r0, 1
	mov r12, r0
	ldr r7, _0803DDBC @ =gSpeciesNames
	movs r0, 0xB
	muls r0, r5
	adds r3, r0, r7
	adds r2, r6, 0
	b _0803DDC6
	.align 2, 0
_0803DDBC: .4byte gSpeciesNames
_0803DDC0:
	adds r3, 0x1
	adds r2, 0x1
	adds r1, 0x1
_0803DDC6:
	adds r4, r6, r1
	cmp r1, 0xA
	bgt _0803DDE0
	cmp r5, r12
	bls _0803DDD6
	adds r0, r1, r7
	ldrb r0, [r0]
	b _0803DDD8
_0803DDD6:
	ldrb r0, [r3]
_0803DDD8:
	strb r0, [r2]
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0803DDC0
_0803DDE0:
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end GetSpeciesName

	thumb_func_start CalculatePPWithBonus
CalculatePPWithBonus: @ 803DDEC
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _0803DE2C @ =gBattleMoves
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrb r4, [r3, 0x4]
	ldr r0, _0803DE30 @ =gUnknown_08208238
	adds r0, r2, r0
	ldrb r3, [r0]
	ands r3, r1
	lsls r2, 1
	asrs r3, r2
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	muls r0, r4
	movs r1, 0x64
	bl __divsi3
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DE2C: .4byte gBattleMoves
_0803DE30: .4byte gUnknown_08208238
	thumb_func_end CalculatePPWithBonus

	thumb_func_start RemoveMonPPBonus
RemoveMonPPBonus: @ 803DE34
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r1, _0803DE6C @ =gUnknown_0820823C
	adds r4, r1
	ldrb r1, [r4]
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0x15
	mov r2, sp
	bl SetMonData
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DE6C: .4byte gUnknown_0820823C
	thumb_func_end RemoveMonPPBonus

	thumb_func_start RemoveBattleMonPPBonus
RemoveBattleMonPPBonus: @ 803DE70
	lsls r1, 24
	lsrs r1, 24
	adds r0, 0x3B
	ldr r2, _0803DE84 @ =gUnknown_0820823C
	adds r1, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803DE84: .4byte gUnknown_0820823C
	thumb_func_end RemoveBattleMonPPBonus

	thumb_func_start CopyPlayerPartyMonToBattleData
CopyPlayerPartyMonToBattleData: @ 803DE88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0x64
	mov r5, r9
	muls r5, r0
	ldr r0, _0803E170 @ =gPlayerParty
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	ldr r1, _0803E174 @ =gBattleMons
	mov r8, r1
	movs r1, 0x58
	ldr r2, [sp, 0x14]
	adds r4, r2, 0
	muls r4, r1
	mov r3, r8
	adds r6, r4, r3
	strh r0, [r6]
	adds r0, r5, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	strh r0, [r6, 0x2E]
	movs r6, 0
	mov r0, r8
	adds r0, 0x24
	adds r7, r4, r0
_0803DEDA:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	movs r1, 0xC
	add r1, r8
	mov r10, r1
	adds r1, r4, r1
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	movs r2, 0
	bl GetMonData
	strb r0, [r7]
	adds r7, 0x1
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0803DEDA
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0803E170 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	movs r2, 0xC
	negs r2, r2
	add r2, r10
	mov r9, r2
	movs r1, 0x58
	ldr r3, [sp, 0x14]
	adds r5, r3, 0
	muls r5, r1
	adds r7, r5, r2
	adds r1, r7, 0
	adds r1, 0x3B
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	adds r1, r7, 0
	adds r1, 0x2B
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x38
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	movs r2, 0
	bl GetMonData
	movs r6, 0x1F
	ands r0, r6
	ldrb r2, [r7, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	movs r2, 0
	bl GetMonData
	movs r1, 0x1F
	mov r8, r1
	mov r2, r8
	ands r0, r2
	lsls r0, 5
	ldrh r2, [r7, 0x14]
	ldr r1, _0803E178 @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	movs r2, 0
	bl GetMonData
	ands r0, r6
	lsls r0, 2
	ldrb r2, [r7, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	movs r2, 0
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [r7, 0x14]
	ldr r2, _0803E17C @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [r7, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	movs r2, 0
	bl GetMonData
	mov r3, r8
	ands r0, r3
	lsls r0, 4
	ldrh r2, [r7, 0x16]
	ldr r1, _0803E180 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	movs r2, 0
	bl GetMonData
	ands r0, r6
	lsls r0, 1
	ldrb r2, [r7, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x17]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x3C
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x37
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x40
	adds r1, r5, r1
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	movs r2, 0
	bl GetMonData
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r7, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	movs r2, 0
	bl GetMonData
	lsls r0, 7
	ldrb r2, [r7, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, r10
	adds r1, 0x48
	adds r1, r5, r1
	str r0, [r1]
	ldr r2, _0803E184 @ =gBaseStats
	ldrh r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	adds r1, r7, 0
	adds r1, 0x21
	strb r0, [r1]
	ldrh r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	adds r1, r7, 0
	adds r1, 0x22
	strb r0, [r1]
	ldrh r0, [r7]
	ldrb r1, [r7, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	adds r1, r7, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, r10
	adds r0, 0x24
	adds r0, r5, r0
	mov r1, sp
	bl StringCopy10
	mov r2, r10
	adds r2, 0x30
	adds r2, r5, r2
	adds r0, r4, 0
	movs r1, 0x7
	bl GetMonData
	ldr r0, [sp, 0x14]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	ldr r1, _0803E188 @ =0x020160bc
	adds r0, r1
	ldrh r1, [r7, 0x28]
	strh r1, [r0]
	movs r2, 0x6
	mov r1, r9
	movs r6, 0x7
	add r5, r10
	adds r0, r5, 0
	adds r0, 0x13
_0803E13A:
	strb r2, [r0]
	subs r0, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0803E13A
	movs r2, 0
	movs r0, 0x58
	ldr r3, [sp, 0x14]
	muls r0, r3
	adds r1, 0x50
	adds r0, r1
	str r2, [r0]
	ldr r0, [sp, 0x14]
	bl sub_80157C4
	ldr r0, [sp, 0x14]
	movs r1, 0
	bl sub_8032AA8
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E170: .4byte gPlayerParty
_0803E174: .4byte gBattleMons
_0803E178: .4byte 0xfffffc1f
_0803E17C: .4byte 0xfff07fff
_0803E180: .4byte 0xfffffe0f
_0803E184: .4byte gBaseStats
_0803E188: .4byte 0x020160bc
	thumb_func_end CopyPlayerPartyMonToBattleData

	.align 2, 0 @ Don't pad with nop.
