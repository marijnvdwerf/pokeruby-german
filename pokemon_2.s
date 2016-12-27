	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_803C348
sub_803C348: @ 803C51C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r6, 0
	cmp r0, 0x1
	beq _0803C570
	cmp r0, 0x1
	bgt _0803C534
	cmp r0, 0
	beq _0803C53A
	b _0803C5F2
_0803C534:
	cmp r1, 0x2
	beq _0803C5B8
	b _0803C5F2
_0803C53A:
	movs r5, 0
	ldr r0, _0803C564 @ =gUnknown_02024A60
	ldrb r3, [r0]
	ldr r4, _0803C568 @ =gUnknown_02024C0C
	ldr r2, _0803C56C @ =gBitTable
_0803C544:
	cmp r5, r3
	beq _0803C558
	ldrb r0, [r4]
	ldr r1, [r2]
	ands r0, r1
	cmp r0, 0
	bne _0803C558
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803C558:
	adds r2, 0x4
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803C544
	b _0803C5F2
	.align 2, 0
_0803C564: .4byte gUnknown_02024A60
_0803C568: .4byte gUnknown_02024C0C
_0803C56C: .4byte gBitTable
_0803C570:
	movs r5, 0
_0803C572:
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _0803C5AC @ =gUnknown_02024C07
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0803C5A4
	ldr r0, _0803C5B0 @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0803C5B4 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803C5A4
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803C5A4:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803C572
	b _0803C5F2
	.align 2, 0
_0803C5AC: .4byte gUnknown_02024C07
_0803C5B0: .4byte gUnknown_02024C0C
_0803C5B4: .4byte gBitTable
_0803C5B8:
	movs r5, 0
_0803C5BA:
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _0803C5FC @ =gUnknown_02024C08
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0803C5EC
	ldr r0, _0803C600 @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0803C604 @ =gBitTable
	lsls r0, r5, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803C5EC
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0803C5EC:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803C5BA
_0803C5F2:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C5FC: .4byte gUnknown_02024C08
_0803C600: .4byte gUnknown_02024C0C
_0803C604: .4byte gBitTable
	thumb_func_end sub_803C348

	thumb_func_start sub_803C434
sub_803C434: @ 803C608
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
	ldr r0, _0803C630 @ =gUnknown_020239F8
	ldrh r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _0803C634
	adds r0, r4, 0
	b _0803C67E
	.align 2, 0
_0803C630: .4byte gUnknown_020239F8
_0803C634:
	movs r0, 0
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0803C658
	bl Random
	adds r1, r6, 0
	ands r1, r0
	cmp r1, 0
	bne _0803C654
	movs r0, 0x2
	eors r0, r4
	b _0803C67E
_0803C654:
	adds r0, r4, 0
	b _0803C67E
_0803C658:
	ldr r0, _0803C670 @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _0803C674 @ =gBitTable
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0803C678
	adds r0, r4, 0
	b _0803C67E
	.align 2, 0
_0803C670: .4byte gUnknown_02024C0C
_0803C674: .4byte gBitTable
_0803C678:
	movs r0, 0x2
	eors r5, r0
	adds r0, r5, 0
_0803C67E:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_803C434

	thumb_func_start GetMonGender
GetMonGender: @ 803C68C
	push {lr}
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetMonGender

	thumb_func_start GetBoxMonGender
GetBoxMonGender: @ 803C69C
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
	ldr r1, _0803C6EC @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _0803C6F2
	cmp r0, 0
	blt _0803C6D4
	cmp r0, 0xFF
	bgt _0803C6D4
	cmp r0, 0xFE
	bge _0803C6F2
_0803C6D4:
	ldr r1, _0803C6EC @ =gBaseStats
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0xFF
	ands r0, r2
	cmp r1, r0
	bhi _0803C6F0
	movs r0, 0
	b _0803C6F2
	.align 2, 0
_0803C6EC: .4byte gBaseStats
_0803C6F0:
	movs r0, 0xFE
_0803C6F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetBoxMonGender

	thumb_func_start GetGenderFromSpeciesAndPersonality
GetGenderFromSpeciesAndPersonality: @ 803C6F8
	push {lr}
	adds r3, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0803C734 @ =gBaseStats
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x10]
	cmp r0, 0
	beq _0803C73A
	cmp r0, 0
	blt _0803C71C
	cmp r0, 0xFF
	bgt _0803C71C
	cmp r0, 0xFE
	bge _0803C73A
_0803C71C:
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0xFF
	ands r0, r3
	cmp r1, r0
	bhi _0803C738
	movs r0, 0
	b _0803C73A
	.align 2, 0
_0803C734: .4byte gBaseStats
_0803C738:
	movs r0, 0xFE
_0803C73A:
	pop {r1}
	bx r1
	thumb_func_end GetGenderFromSpeciesAndPersonality

	thumb_func_start GetMonSpriteTemplate_803C56C
GetMonSpriteTemplate_803C56C: @ 803C740
	push {r4-r6,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0803C768 @ =gUnknown_02024E8C
	ldr r4, _0803C76C @ =gSpriteTemplate_8208288
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
	ldr r0, _0803C770 @ =gSpriteAnimTable_81E7C64
	str r0, [r3, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C768: .4byte gUnknown_02024E8C
_0803C76C: .4byte gSpriteTemplate_8208288
_0803C770: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end GetMonSpriteTemplate_803C56C

	thumb_func_start GetMonSpriteTemplate_803C5A0
GetMonSpriteTemplate_803C5A0: @ 803C774
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r5, _0803C7A4 @ =gUnknown_02024E8C
	ldr r2, _0803C7A8 @ =gSpriteTemplate_8208288
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
	beq _0803C79E
	cmp r3, 0x2
	bne _0803C7B0
_0803C79E:
	ldr r0, _0803C7AC @ =gUnknown_081ECACC
	b _0803C7B2
	.align 2, 0
_0803C7A4: .4byte gUnknown_02024E8C
_0803C7A8: .4byte gSpriteTemplate_8208288
_0803C7AC: .4byte gUnknown_081ECACC
_0803C7B0:
	ldr r0, _0803C7C0 @ =gUnknown_081EC2A4
_0803C7B2:
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	str r0, [r5, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C7C0: .4byte gUnknown_081EC2A4
	thumb_func_end GetMonSpriteTemplate_803C5A0

	thumb_func_start EncryptBoxMon
EncryptBoxMon: @ 803C7C4
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	adds r2, r3, 0
	adds r2, 0x20
_0803C7CE:
	ldr r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3, 0x4]
	eors r0, r1
	stm r2!, {r0}
	adds r4, 0x1
	cmp r4, 0xB
	bls _0803C7CE
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end EncryptBoxMon

	thumb_func_start DecryptBoxMon
DecryptBoxMon: @ 803C7E8
	push {r4,lr}
	adds r3, r0, 0
	movs r4, 0
	adds r2, r3, 0
	adds r2, 0x20
_0803C7F2:
	ldr r0, [r2]
	ldr r1, [r3, 0x4]
	eors r0, r1
	str r0, [r2]
	ldr r1, [r3]
	eors r0, r1
	stm r2!, {r0}
	adds r4, 0x1
	cmp r4, 0xB
	bls _0803C7F2
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DecryptBoxMon

	thumb_func_start GetSubstruct
GetSubstruct: @ 803C80C
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
	bls _0803C866
	b _0803CD22
_0803C866:
	lsls r0, 2
	ldr r1, _0803C870 @ =_0803C874
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C870: .4byte _0803C874
	.align 2, 0
_0803C874:
	.4byte _0803C8D4
	.4byte _0803C902
	.4byte _0803C930
	.4byte _0803C95E
	.4byte _0803C98C
	.4byte _0803C9BA
	.4byte _0803C9E8
	.4byte _0803CA16
	.4byte _0803CA44
	.4byte _0803CA72
	.4byte _0803CAA0
	.4byte _0803CACE
	.4byte _0803CAFC
	.4byte _0803CB2A
	.4byte _0803CB58
	.4byte _0803CB86
	.4byte _0803CBB4
	.4byte _0803CBE2
	.4byte _0803CC10
	.4byte _0803CC3E
	.4byte _0803CC6C
	.4byte _0803CC9A
	.4byte _0803CCC8
	.4byte _0803CCF6
_0803C8D4:
	cmp r4, 0x1
	beq _0803C8F0
	cmp r4, 0x1
	bgt _0803C8E2
	cmp r4, 0
	beq _0803C8EC
	b _0803CD22
_0803C8E2:
	cmp r4, 0x2
	beq _0803C8F6
	cmp r4, 0x3
	beq _0803C8FC
	b _0803CD22
_0803C8EC:
	ldr r5, [sp]
	b _0803CD22
_0803C8F0:
	ldr r5, [sp]
	adds r5, 0xC
	b _0803CD22
_0803C8F6:
	ldr r5, [sp]
	adds r5, 0x18
	b _0803CD22
_0803C8FC:
	ldr r5, [sp]
	adds r5, 0x24
	b _0803CD22
_0803C902:
	cmp r4, 0x1
	beq _0803C91E
	cmp r4, 0x1
	bgt _0803C910
	cmp r4, 0
	beq _0803C91A
	b _0803CD22
_0803C910:
	cmp r4, 0x2
	beq _0803C924
	cmp r4, 0x3
	beq _0803C92A
	b _0803CD22
_0803C91A:
	ldr r5, [sp, 0x4]
	b _0803CD22
_0803C91E:
	ldr r5, [sp, 0x4]
	adds r5, 0xC
	b _0803CD22
_0803C924:
	ldr r5, [sp, 0x4]
	adds r5, 0x24
	b _0803CD22
_0803C92A:
	ldr r5, [sp, 0x4]
	adds r5, 0x18
	b _0803CD22
_0803C930:
	cmp r4, 0x1
	beq _0803C94C
	cmp r4, 0x1
	bgt _0803C93E
	cmp r4, 0
	beq _0803C948
	b _0803CD22
_0803C93E:
	cmp r4, 0x2
	beq _0803C952
	cmp r4, 0x3
	beq _0803C958
	b _0803CD22
_0803C948:
	ldr r5, [sp, 0x8]
	b _0803CD22
_0803C94C:
	ldr r5, [sp, 0x8]
	adds r5, 0x18
	b _0803CD22
_0803C952:
	ldr r5, [sp, 0x8]
	adds r5, 0xC
	b _0803CD22
_0803C958:
	ldr r5, [sp, 0x8]
	adds r5, 0x24
	b _0803CD22
_0803C95E:
	cmp r4, 0x1
	beq _0803C97A
	cmp r4, 0x1
	bgt _0803C96C
	cmp r4, 0
	beq _0803C976
	b _0803CD22
_0803C96C:
	cmp r4, 0x2
	beq _0803C980
	cmp r4, 0x3
	beq _0803C986
	b _0803CD22
_0803C976:
	ldr r5, [sp, 0xC]
	b _0803CD22
_0803C97A:
	ldr r5, [sp, 0xC]
	adds r5, 0x24
	b _0803CD22
_0803C980:
	ldr r5, [sp, 0xC]
	adds r5, 0xC
	b _0803CD22
_0803C986:
	ldr r5, [sp, 0xC]
	adds r5, 0x18
	b _0803CD22
_0803C98C:
	cmp r4, 0x1
	beq _0803C9A8
	cmp r4, 0x1
	bgt _0803C99A
	cmp r4, 0
	beq _0803C9A4
	b _0803CD22
_0803C99A:
	cmp r4, 0x2
	beq _0803C9AE
	cmp r4, 0x3
	beq _0803C9B4
	b _0803CD22
_0803C9A4:
	ldr r5, [sp, 0x10]
	b _0803CD22
_0803C9A8:
	ldr r5, [sp, 0x10]
	adds r5, 0x18
	b _0803CD22
_0803C9AE:
	ldr r5, [sp, 0x10]
	adds r5, 0x24
	b _0803CD22
_0803C9B4:
	ldr r5, [sp, 0x10]
	adds r5, 0xC
	b _0803CD22
_0803C9BA:
	cmp r4, 0x1
	beq _0803C9D6
	cmp r4, 0x1
	bgt _0803C9C8
	cmp r4, 0
	beq _0803C9D2
	b _0803CD22
_0803C9C8:
	cmp r4, 0x2
	beq _0803C9DC
	cmp r4, 0x3
	beq _0803C9E2
	b _0803CD22
_0803C9D2:
	ldr r5, [sp, 0x14]
	b _0803CD22
_0803C9D6:
	ldr r5, [sp, 0x14]
	adds r5, 0x24
	b _0803CD22
_0803C9DC:
	ldr r5, [sp, 0x14]
	adds r5, 0x18
	b _0803CD22
_0803C9E2:
	ldr r5, [sp, 0x14]
	adds r5, 0xC
	b _0803CD22
_0803C9E8:
	cmp r4, 0x1
	beq _0803CA06
	cmp r4, 0x1
	bgt _0803C9F6
	cmp r4, 0
	beq _0803CA00
	b _0803CD22
_0803C9F6:
	cmp r4, 0x2
	beq _0803CA0A
	cmp r4, 0x3
	beq _0803CA10
	b _0803CD22
_0803CA00:
	ldr r5, [sp, 0x18]
	adds r5, 0xC
	b _0803CD22
_0803CA06:
	ldr r5, [sp, 0x18]
	b _0803CD22
_0803CA0A:
	ldr r5, [sp, 0x18]
	adds r5, 0x18
	b _0803CD22
_0803CA10:
	ldr r5, [sp, 0x18]
	adds r5, 0x24
	b _0803CD22
_0803CA16:
	cmp r4, 0x1
	beq _0803CA34
	cmp r4, 0x1
	bgt _0803CA24
	cmp r4, 0
	beq _0803CA2E
	b _0803CD22
_0803CA24:
	cmp r4, 0x2
	beq _0803CA38
	cmp r4, 0x3
	beq _0803CA3E
	b _0803CD22
_0803CA2E:
	ldr r5, [sp, 0x1C]
	adds r5, 0xC
	b _0803CD22
_0803CA34:
	ldr r5, [sp, 0x1C]
	b _0803CD22
_0803CA38:
	ldr r5, [sp, 0x1C]
	adds r5, 0x24
	b _0803CD22
_0803CA3E:
	ldr r5, [sp, 0x1C]
	adds r5, 0x18
	b _0803CD22
_0803CA44:
	cmp r4, 0x1
	beq _0803CA62
	cmp r4, 0x1
	bgt _0803CA52
	cmp r4, 0
	beq _0803CA5C
	b _0803CD22
_0803CA52:
	cmp r4, 0x2
	beq _0803CA66
	cmp r4, 0x3
	beq _0803CA6C
	b _0803CD22
_0803CA5C:
	ldr r5, [sp, 0x20]
	adds r5, 0x18
	b _0803CD22
_0803CA62:
	ldr r5, [sp, 0x20]
	b _0803CD22
_0803CA66:
	ldr r5, [sp, 0x20]
	adds r5, 0xC
	b _0803CD22
_0803CA6C:
	ldr r5, [sp, 0x20]
	adds r5, 0x24
	b _0803CD22
_0803CA72:
	cmp r4, 0x1
	beq _0803CA90
	cmp r4, 0x1
	bgt _0803CA80
	cmp r4, 0
	beq _0803CA8A
	b _0803CD22
_0803CA80:
	cmp r4, 0x2
	beq _0803CA94
	cmp r4, 0x3
	beq _0803CA9A
	b _0803CD22
_0803CA8A:
	ldr r5, [sp, 0x24]
	adds r5, 0x24
	b _0803CD22
_0803CA90:
	ldr r5, [sp, 0x24]
	b _0803CD22
_0803CA94:
	ldr r5, [sp, 0x24]
	adds r5, 0xC
	b _0803CD22
_0803CA9A:
	ldr r5, [sp, 0x24]
	adds r5, 0x18
	b _0803CD22
_0803CAA0:
	cmp r4, 0x1
	beq _0803CABE
	cmp r4, 0x1
	bgt _0803CAAE
	cmp r4, 0
	beq _0803CAB8
	b _0803CD22
_0803CAAE:
	cmp r4, 0x2
	beq _0803CAC2
	cmp r4, 0x3
	beq _0803CAC8
	b _0803CD22
_0803CAB8:
	ldr r5, [sp, 0x28]
	adds r5, 0x18
	b _0803CD22
_0803CABE:
	ldr r5, [sp, 0x28]
	b _0803CD22
_0803CAC2:
	ldr r5, [sp, 0x28]
	adds r5, 0x24
	b _0803CD22
_0803CAC8:
	ldr r5, [sp, 0x28]
	adds r5, 0xC
	b _0803CD22
_0803CACE:
	cmp r4, 0x1
	beq _0803CAEC
	cmp r4, 0x1
	bgt _0803CADC
	cmp r4, 0
	beq _0803CAE6
	b _0803CD22
_0803CADC:
	cmp r4, 0x2
	beq _0803CAF0
	cmp r4, 0x3
	beq _0803CAF6
	b _0803CD22
_0803CAE6:
	ldr r5, [sp, 0x2C]
	adds r5, 0x24
	b _0803CD22
_0803CAEC:
	ldr r5, [sp, 0x2C]
	b _0803CD22
_0803CAF0:
	ldr r5, [sp, 0x2C]
	adds r5, 0x18
	b _0803CD22
_0803CAF6:
	ldr r5, [sp, 0x2C]
	adds r5, 0xC
	b _0803CD22
_0803CAFC:
	cmp r4, 0x1
	beq _0803CB1A
	cmp r4, 0x1
	bgt _0803CB0A
	cmp r4, 0
	beq _0803CB14
	b _0803CD22
_0803CB0A:
	cmp r4, 0x2
	beq _0803CB20
	cmp r4, 0x3
	beq _0803CB24
	b _0803CD22
_0803CB14:
	ldr r5, [sp, 0x30]
	adds r5, 0xC
	b _0803CD22
_0803CB1A:
	ldr r5, [sp, 0x30]
	adds r5, 0x18
	b _0803CD22
_0803CB20:
	ldr r5, [sp, 0x30]
	b _0803CD22
_0803CB24:
	ldr r5, [sp, 0x30]
	adds r5, 0x24
	b _0803CD22
_0803CB2A:
	cmp r4, 0x1
	beq _0803CB48
	cmp r4, 0x1
	bgt _0803CB38
	cmp r4, 0
	beq _0803CB42
	b _0803CD22
_0803CB38:
	cmp r4, 0x2
	beq _0803CB4E
	cmp r4, 0x3
	beq _0803CB52
	b _0803CD22
_0803CB42:
	mov r5, r10
	adds r5, 0xC
	b _0803CD22
_0803CB48:
	mov r5, r10
	adds r5, 0x24
	b _0803CD22
_0803CB4E:
	mov r5, r10
	b _0803CD22
_0803CB52:
	mov r5, r10
	adds r5, 0x18
	b _0803CD22
_0803CB58:
	cmp r4, 0x1
	beq _0803CB76
	cmp r4, 0x1
	bgt _0803CB66
	cmp r4, 0
	beq _0803CB70
	b _0803CD22
_0803CB66:
	cmp r4, 0x2
	beq _0803CB7C
	cmp r4, 0x3
	beq _0803CB80
	b _0803CD22
_0803CB70:
	ldr r5, [sp, 0x34]
	adds r5, 0x18
	b _0803CD22
_0803CB76:
	ldr r5, [sp, 0x34]
	adds r5, 0xC
	b _0803CD22
_0803CB7C:
	ldr r5, [sp, 0x34]
	b _0803CD22
_0803CB80:
	ldr r5, [sp, 0x34]
	adds r5, 0x24
	b _0803CD22
_0803CB86:
	cmp r4, 0x1
	beq _0803CBA4
	cmp r4, 0x1
	bgt _0803CB94
	cmp r4, 0
	beq _0803CB9E
	b _0803CD22
_0803CB94:
	cmp r4, 0x2
	beq _0803CBAA
	cmp r4, 0x3
	beq _0803CBAE
	b _0803CD22
_0803CB9E:
	mov r5, r8
	adds r5, 0x24
	b _0803CD22
_0803CBA4:
	mov r5, r8
	adds r5, 0xC
	b _0803CD22
_0803CBAA:
	mov r5, r8
	b _0803CD22
_0803CBAE:
	mov r5, r8
	adds r5, 0x18
	b _0803CD22
_0803CBB4:
	cmp r4, 0x1
	beq _0803CBD2
	cmp r4, 0x1
	bgt _0803CBC2
	cmp r4, 0
	beq _0803CBCC
	b _0803CD22
_0803CBC2:
	cmp r4, 0x2
	beq _0803CBD8
	cmp r4, 0x3
	beq _0803CBDC
	b _0803CD22
_0803CBCC:
	ldr r5, [sp, 0x38]
	adds r5, 0x18
	b _0803CD22
_0803CBD2:
	ldr r5, [sp, 0x38]
	adds r5, 0x24
	b _0803CD22
_0803CBD8:
	ldr r5, [sp, 0x38]
	b _0803CD22
_0803CBDC:
	ldr r5, [sp, 0x38]
	adds r5, 0xC
	b _0803CD22
_0803CBE2:
	cmp r4, 0x1
	beq _0803CC00
	cmp r4, 0x1
	bgt _0803CBF0
	cmp r4, 0
	beq _0803CBFA
	b _0803CD22
_0803CBF0:
	cmp r4, 0x2
	beq _0803CC06
	cmp r4, 0x3
	beq _0803CC0A
	b _0803CD22
_0803CBFA:
	adds r5, r3, 0
	adds r5, 0x24
	b _0803CD22
_0803CC00:
	adds r5, r3, 0
	adds r5, 0x18
	b _0803CD22
_0803CC06:
	adds r5, r3, 0
	b _0803CD22
_0803CC0A:
	adds r5, r3, 0
	adds r5, 0xC
	b _0803CD22
_0803CC10:
	cmp r4, 0x1
	beq _0803CC2E
	cmp r4, 0x1
	bgt _0803CC1E
	cmp r4, 0
	beq _0803CC28
	b _0803CD22
_0803CC1E:
	cmp r4, 0x2
	beq _0803CC34
	cmp r4, 0x3
	beq _0803CC3A
	b _0803CD22
_0803CC28:
	ldr r5, [sp, 0x3C]
	adds r5, 0xC
	b _0803CD22
_0803CC2E:
	ldr r5, [sp, 0x3C]
	adds r5, 0x18
	b _0803CD22
_0803CC34:
	ldr r5, [sp, 0x3C]
	adds r5, 0x24
	b _0803CD22
_0803CC3A:
	ldr r5, [sp, 0x3C]
	b _0803CD22
_0803CC3E:
	cmp r4, 0x1
	beq _0803CC5C
	cmp r4, 0x1
	bgt _0803CC4C
	cmp r4, 0
	beq _0803CC56
	b _0803CD22
_0803CC4C:
	cmp r4, 0x2
	beq _0803CC62
	cmp r4, 0x3
	beq _0803CC68
	b _0803CD22
_0803CC56:
	adds r5, r7, 0
	adds r5, 0xC
	b _0803CD22
_0803CC5C:
	adds r5, r7, 0
	adds r5, 0x24
	b _0803CD22
_0803CC62:
	adds r5, r7, 0
	adds r5, 0x18
	b _0803CD22
_0803CC68:
	adds r5, r7, 0
	b _0803CD22
_0803CC6C:
	cmp r4, 0x1
	beq _0803CC8A
	cmp r4, 0x1
	bgt _0803CC7A
	cmp r4, 0
	beq _0803CC84
	b _0803CD22
_0803CC7A:
	cmp r4, 0x2
	beq _0803CC90
	cmp r4, 0x3
	beq _0803CC96
	b _0803CD22
_0803CC84:
	ldr r5, [sp, 0x40]
	adds r5, 0x18
	b _0803CD22
_0803CC8A:
	ldr r5, [sp, 0x40]
	adds r5, 0xC
	b _0803CD22
_0803CC90:
	ldr r5, [sp, 0x40]
	adds r5, 0x24
	b _0803CD22
_0803CC96:
	ldr r5, [sp, 0x40]
	b _0803CD22
_0803CC9A:
	cmp r4, 0x1
	beq _0803CCB8
	cmp r4, 0x1
	bgt _0803CCA8
	cmp r4, 0
	beq _0803CCB2
	b _0803CD22
_0803CCA8:
	cmp r4, 0x2
	beq _0803CCBE
	cmp r4, 0x3
	beq _0803CCC4
	b _0803CD22
_0803CCB2:
	adds r5, r6, 0
	adds r5, 0x24
	b _0803CD22
_0803CCB8:
	adds r5, r6, 0
	adds r5, 0xC
	b _0803CD22
_0803CCBE:
	adds r5, r6, 0
	adds r5, 0x18
	b _0803CD22
_0803CCC4:
	adds r5, r6, 0
	b _0803CD22
_0803CCC8:
	cmp r4, 0x1
	beq _0803CCE6
	cmp r4, 0x1
	bgt _0803CCD6
	cmp r4, 0
	beq _0803CCE0
	b _0803CD22
_0803CCD6:
	cmp r4, 0x2
	beq _0803CCEC
	cmp r4, 0x3
	beq _0803CCF2
	b _0803CD22
_0803CCE0:
	mov r5, r9
	adds r5, 0x18
	b _0803CD22
_0803CCE6:
	mov r5, r9
	adds r5, 0x24
	b _0803CD22
_0803CCEC:
	mov r5, r9
	adds r5, 0xC
	b _0803CD22
_0803CCF2:
	mov r5, r9
	b _0803CD22
_0803CCF6:
	cmp r4, 0x1
	beq _0803CD14
	cmp r4, 0x1
	bgt _0803CD04
	cmp r4, 0
	beq _0803CD0E
	b _0803CD22
_0803CD04:
	cmp r4, 0x2
	beq _0803CD1A
	cmp r4, 0x3
	beq _0803CD20
	b _0803CD22
_0803CD0E:
	adds r5, r2, 0
	adds r5, 0x24
	b _0803CD22
_0803CD14:
	adds r5, r2, 0
	adds r5, 0x18
	b _0803CD22
_0803CD1A:
	adds r5, r2, 0
	adds r5, 0xC
	b _0803CD22
_0803CD20:
	adds r5, r2, 0
_0803CD22:
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
GetMonData: @ 803CD34
	push {lr}
	adds r3, r0, 0
	adds r0, r1, 0
	subs r0, 0x37
	cmp r0, 0x9
	bhi _0803CDC4
	lsls r0, 2
	ldr r1, _0803CD4C @ =_0803CD50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803CD4C: .4byte _0803CD50
	.align 2, 0
_0803CD50:
	.4byte _0803CD78
	.4byte _0803CD7C
	.4byte _0803CD84
	.4byte _0803CD8C
	.4byte _0803CD94
	.4byte _0803CD9C
	.4byte _0803CDA4
	.4byte _0803CDAC
	.4byte _0803CDB4
	.4byte _0803CDBC
_0803CD78:
	ldr r0, [r3, 0x50]
	b _0803CDCA
_0803CD7C:
	adds r0, r3, 0
	adds r0, 0x54
	ldrb r0, [r0]
	b _0803CDCA
_0803CD84:
	adds r0, r3, 0
	adds r0, 0x56
	ldrh r0, [r0]
	b _0803CDCA
_0803CD8C:
	adds r0, r3, 0
	adds r0, 0x58
	ldrh r0, [r0]
	b _0803CDCA
_0803CD94:
	adds r0, r3, 0
	adds r0, 0x5A
	ldrh r0, [r0]
	b _0803CDCA
_0803CD9C:
	adds r0, r3, 0
	adds r0, 0x5C
	ldrh r0, [r0]
	b _0803CDCA
_0803CDA4:
	adds r0, r3, 0
	adds r0, 0x5E
	ldrh r0, [r0]
	b _0803CDCA
_0803CDAC:
	adds r0, r3, 0
	adds r0, 0x60
	ldrh r0, [r0]
	b _0803CDCA
_0803CDB4:
	adds r0, r3, 0
	adds r0, 0x62
	ldrh r0, [r0]
	b _0803CDCA
_0803CDBC:
	adds r0, r3, 0
	adds r0, 0x55
	ldrb r0, [r0]
	b _0803CDCA
_0803CDC4:
	adds r0, r3, 0
	bl GetBoxMonData
_0803CDCA:
	pop {r1}
	bx r1
	thumb_func_end GetMonData

	thumb_func_start GetBoxMonData
GetBoxMonData: @ 803CDD0
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
	ble _0803CE4E
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
	beq _0803CE4E
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
_0803CE4E:
	ldr r0, [sp]
	cmp r0, 0x52
	bls _0803CE56
	b _0803D3B0
_0803CE56:
	lsls r0, 2
	ldr r1, _0803CE60 @ =_0803CE64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803CE60: .4byte _0803CE64
	.align 2, 0
_0803CE64:
	.4byte _0803CFB0
	.4byte _0803CFB6
	.4byte _0803CFBC
	.4byte _0803D030
	.4byte _0803D036
	.4byte _0803D03C
	.4byte _0803D042
	.4byte _0803D048
	.4byte _0803D074
	.4byte _0803D07A
	.4byte _0803D080
	.4byte _0803D086
	.4byte _0803D09E
	.4byte _0803D0B6
	.4byte _0803D0B6
	.4byte _0803D0B6
	.4byte _0803D0B6
	.4byte _0803D0C2
	.4byte _0803D0C2
	.4byte _0803D0C2
	.4byte _0803D0C2
	.4byte _0803D0AA
	.4byte _0803D0E4
	.4byte _0803D0E8
	.4byte _0803D0EC
	.4byte _0803D0A4
	.4byte _0803D0CC
	.4byte _0803D0D0
	.4byte _0803D0D4
	.4byte _0803D0D8
	.4byte _0803D0DC
	.4byte _0803D0E0
	.4byte _0803D0B0
	.4byte _0803D0F0
	.4byte _0803D0FC
	.4byte _0803D100
	.4byte _0803D104
	.4byte _0803D10C
	.4byte _0803D114
	.4byte _0803D122
	.4byte _0803D12A
	.4byte _0803D132
	.4byte _0803D13A
	.4byte _0803D142
	.4byte _0803D14A
	.4byte _0803D152
	.4byte _0803D156
	.4byte _0803D0F4
	.4byte _0803D0F8
	.4byte _0803D11C
	.4byte _0803D15C
	.4byte _0803D164
	.4byte _0803D16C
	.4byte _0803D174
	.4byte _0803D17C
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D3B0
	.4byte _0803D1DA
	.4byte _0803D200
	.4byte _0803D184
	.4byte _0803D18A
	.4byte _0803D18E
	.4byte _0803D192
	.4byte _0803D196
	.4byte _0803D19E
	.4byte _0803D1A6
	.4byte _0803D1AE
	.4byte _0803D1B6
	.4byte _0803D1BC
	.4byte _0803D1C4
	.4byte _0803D1CC
	.4byte _0803D1D4
	.4byte _0803D23A
	.4byte _0803D294
	.4byte _0803D316
_0803CFB0:
	mov r1, r8
	ldr r4, [r1]
	b _0803D3B0
_0803CFB6:
	mov r2, r8
	ldr r4, [r2, 0x4]
	b _0803D3B0
_0803CFBC:
	mov r0, r8
	ldrb r1, [r0, 0x13]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803CFD8
	ldr r1, _0803CFD4 @ =gBadEggNickname
	adds r0, r7, 0
	bl StringCopy
	b _0803D024
	.align 2, 0
_0803CFD4: .4byte gBadEggNickname
_0803CFD8:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803CFF0
	ldr r1, _0803CFEC @ =gEggNickname
	adds r0, r7, 0
	bl StringCopy
	b _0803D024
	.align 2, 0
_0803CFEC: .4byte gEggNickname
_0803CFF0:
	movs r4, 0
	mov r1, r8
	adds r1, 0x8
	mov r2, r8
	ldrb r0, [r2, 0x8]
	ldrb r3, [r2, 0x12]
	cmp r0, 0xFF
	beq _0803D016
	adds r2, r1, 0
_0803D002:
	adds r1, r7, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r4, 0x1
	cmp r4, 0x9
	bhi _0803D016
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _0803D002
_0803D016:
	adds r1, r7, r4
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r7, 0
	adds r1, r3, 0
	bl ConvertInternationalString
_0803D024:
	adds r0, r7, 0
	bl StringLength
	lsls r0, 16
	lsrs r4, r0, 16
	b _0803D3B0
_0803D030:
	mov r7, r8
	ldrb r4, [r7, 0x12]
	b _0803D3B0
_0803D036:
	mov r1, r8
	ldrb r0, [r1, 0x13]
	b _0803D1BE
_0803D03C:
	mov r2, r8
	ldrb r0, [r2, 0x13]
	b _0803D1C6
_0803D042:
	mov r7, r8
	ldrb r0, [r7, 0x13]
	b _0803D1CE
_0803D048:
	movs r4, 0
	mov r1, r8
	adds r1, 0x14
	mov r2, r8
	ldrb r0, [r2, 0x14]
	cmp r0, 0xFF
	beq _0803D06C
	adds r2, r1, 0
_0803D058:
	adds r1, r7, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r4, 0x1
	cmp r4, 0x6
	bhi _0803D06C
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _0803D058
_0803D06C:
	adds r1, r7, r4
	movs r0, 0xFF
	strb r0, [r1]
	b _0803D3B0
_0803D074:
	mov r7, r8
	ldrb r4, [r7, 0x1B]
	b _0803D3B0
_0803D07A:
	mov r0, r8
	ldrh r4, [r0, 0x1C]
	b _0803D3B0
_0803D080:
	mov r1, r8
	ldrh r4, [r1, 0x1E]
	b _0803D3B0
_0803D086:
	mov r2, r8
	ldrb r1, [r2, 0x13]
	movs r0, 0x1
	ands r0, r1
	movs r4, 0xCE
	lsls r4, 1
	cmp r0, 0
	beq _0803D098
	b _0803D3B0
_0803D098:
	mov r7, r9
	ldrh r4, [r7]
	b _0803D3B0
_0803D09E:
	mov r0, r9
	ldrh r4, [r0, 0x2]
	b _0803D3B0
_0803D0A4:
	mov r1, r9
	ldr r4, [r1, 0x4]
	b _0803D3B0
_0803D0AA:
	mov r2, r9
	ldrb r4, [r2, 0x8]
	b _0803D3B0
_0803D0B0:
	mov r7, r9
	ldrb r4, [r7, 0x9]
	b _0803D3B0
_0803D0B6:
	ldr r0, [sp]
	subs r0, 0xD
	lsls r0, 1
	add r0, r10
	ldrh r4, [r0]
	b _0803D3B0
_0803D0C2:
	ldr r0, [sp]
	add r0, r10
	subs r0, 0x9
	ldrb r4, [r0]
	b _0803D3B0
_0803D0CC:
	ldrb r4, [r6]
	b _0803D3B0
_0803D0D0:
	ldrb r4, [r6, 0x1]
	b _0803D3B0
_0803D0D4:
	ldrb r4, [r6, 0x2]
	b _0803D3B0
_0803D0D8:
	ldrb r4, [r6, 0x3]
	b _0803D3B0
_0803D0DC:
	ldrb r4, [r6, 0x4]
	b _0803D3B0
_0803D0E0:
	ldrb r4, [r6, 0x5]
	b _0803D3B0
_0803D0E4:
	ldrb r4, [r6, 0x6]
	b _0803D3B0
_0803D0E8:
	ldrb r4, [r6, 0x7]
	b _0803D3B0
_0803D0EC:
	ldrb r4, [r6, 0x8]
	b _0803D3B0
_0803D0F0:
	ldrb r4, [r6, 0x9]
	b _0803D3B0
_0803D0F4:
	ldrb r4, [r6, 0xA]
	b _0803D3B0
_0803D0F8:
	ldrb r4, [r6, 0xB]
	b _0803D3B0
_0803D0FC:
	ldrb r4, [r5]
	b _0803D3B0
_0803D100:
	ldrb r4, [r5, 0x1]
	b _0803D3B0
_0803D104:
	ldrb r0, [r5, 0x2]
	lsls r0, 25
	lsrs r4, r0, 25
	b _0803D3B0
_0803D10C:
	ldrh r0, [r5, 0x2]
	lsls r0, 21
	lsrs r4, r0, 28
	b _0803D3B0
_0803D114:
	ldrb r0, [r5, 0x3]
	lsls r0, 25
	lsrs r4, r0, 28
	b _0803D3B0
_0803D11C:
	ldrb r0, [r5, 0x3]
	lsrs r4, r0, 7
	b _0803D3B0
_0803D122:
	ldrb r0, [r5, 0x4]
	lsls r0, 27
	lsrs r4, r0, 27
	b _0803D3B0
_0803D12A:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r4, r0, 27
	b _0803D3B0
_0803D132:
	ldrb r0, [r5, 0x5]
	lsls r0, 25
	lsrs r4, r0, 27
	b _0803D3B0
_0803D13A:
	ldr r0, [r5, 0x4]
	lsls r0, 12
	lsrs r4, r0, 27
	b _0803D3B0
_0803D142:
	ldrh r0, [r5, 0x6]
	lsls r0, 23
	lsrs r4, r0, 27
	b _0803D3B0
_0803D14A:
	ldrb r0, [r5, 0x7]
	lsls r0, 26
	lsrs r4, r0, 27
	b _0803D3B0
_0803D152:
	ldrb r0, [r5, 0x7]
	b _0803D1B0
_0803D156:
	ldrb r0, [r5, 0x7]
	lsrs r4, r0, 7
	b _0803D3B0
_0803D15C:
	ldrb r0, [r5, 0x8]
	lsls r0, 29
	lsrs r4, r0, 29
	b _0803D3B0
_0803D164:
	ldrb r0, [r5, 0x8]
	lsls r0, 26
	lsrs r4, r0, 29
	b _0803D3B0
_0803D16C:
	ldrh r0, [r5, 0x8]
	lsls r0, 23
	lsrs r4, r0, 29
	b _0803D3B0
_0803D174:
	ldrb r0, [r5, 0x9]
	lsls r0, 28
	lsrs r4, r0, 29
	b _0803D3B0
_0803D17C:
	ldrb r0, [r5, 0x9]
	lsls r0, 25
	lsrs r4, r0, 29
	b _0803D3B0
_0803D184:
	ldrb r0, [r5, 0x9]
	lsrs r4, r0, 7
	b _0803D3B0
_0803D18A:
	ldrb r0, [r5, 0xA]
	b _0803D1BE
_0803D18E:
	ldrb r0, [r5, 0xA]
	b _0803D1C6
_0803D192:
	ldrb r0, [r5, 0xA]
	b _0803D1CE
_0803D196:
	ldrb r0, [r5, 0xA]
	lsls r0, 28
	lsrs r4, r0, 31
	b _0803D3B0
_0803D19E:
	ldrb r0, [r5, 0xA]
	lsls r0, 27
	lsrs r4, r0, 31
	b _0803D3B0
_0803D1A6:
	ldrb r0, [r5, 0xA]
	lsls r0, 26
	lsrs r4, r0, 31
	b _0803D3B0
_0803D1AE:
	ldrb r0, [r5, 0xA]
_0803D1B0:
	lsls r0, 25
	lsrs r4, r0, 31
	b _0803D3B0
_0803D1B6:
	ldrb r0, [r5, 0xA]
	lsrs r4, r0, 7
	b _0803D3B0
_0803D1BC:
	ldrb r0, [r5, 0xB]
_0803D1BE:
	lsls r0, 31
	lsrs r4, r0, 31
	b _0803D3B0
_0803D1C4:
	ldrb r0, [r5, 0xB]
_0803D1C6:
	lsls r0, 30
	lsrs r4, r0, 31
	b _0803D3B0
_0803D1CC:
	ldrb r0, [r5, 0xB]
_0803D1CE:
	lsls r0, 29
	lsrs r4, r0, 31
	b _0803D3B0
_0803D1D4:
	ldrb r0, [r5, 0xB]
	lsrs r4, r0, 3
	b _0803D3B0
_0803D1DA:
	mov r0, r9
	ldrh r4, [r0]
	cmp r4, 0
	bne _0803D1E4
	b _0803D3B0
_0803D1E4:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	blt _0803D1FA
	mov r2, r8
	ldrb r1, [r2, 0x13]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0803D1FA
	b _0803D3B0
_0803D1FA:
	movs r4, 0xCE
	lsls r4, 1
	b _0803D3B0
_0803D200:
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
	b _0803D3B0
_0803D23A:
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	bne _0803D244
	b _0803D3B0
_0803D244:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _0803D24E
	b _0803D3B0
_0803D24E:
	ldrh r0, [r7]
	ldr r1, _0803D28C @ =0x00000163
	cmp r0, r1
	bne _0803D258
	b _0803D3B0
_0803D258:
	mov r2, r10
	ldrh r5, [r2]
	adds r6, r1, 0
	adds r2, r7, 0
	ldr r1, _0803D290 @ =gBitTable
_0803D262:
	ldrh r3, [r2]
	cmp r5, r3
	beq _0803D27C
	mov r7, r10
	ldrh r0, [r7, 0x2]
	cmp r0, r3
	beq _0803D27C
	ldrh r0, [r7, 0x4]
	cmp r0, r3
	beq _0803D27C
	ldrh r0, [r7, 0x6]
	cmp r0, r3
	bne _0803D280
_0803D27C:
	ldr r0, [r1]
	orrs r4, r0
_0803D280:
	adds r2, 0x2
	adds r1, 0x4
	ldrh r0, [r2]
	cmp r0, r6
	bne _0803D262
	b _0803D3B0
	.align 2, 0
_0803D28C: .4byte 0x00000163
_0803D290: .4byte gBitTable
_0803D294:
	movs r4, 0
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, 0
	bne _0803D2A0
	b _0803D3B0
_0803D2A0:
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	bge _0803D2AA
	b _0803D3B0
_0803D2AA:
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
	b _0803D3B0
_0803D316:
	movs r4, 0
	mov r2, r9
	ldrh r0, [r2]
	cmp r0, 0
	beq _0803D3B0
	ldrb r0, [r5, 0x7]
	lsls r0, 25
	cmp r0, 0
	blt _0803D3B0
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
_0803D3B0:
	ldr r7, [sp]
	cmp r7, 0xA
	ble _0803D3BC
	mov r0, r8
	bl EncryptBoxMon
_0803D3BC:
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
SetMonData: @ 803D3D0
	push {lr}
	adds r3, r0, 0
	adds r0, r1, 0
	subs r0, 0x37
	cmp r0, 0xA
	bhi _0803D4B4
	lsls r0, 2
	ldr r1, _0803D3E8 @ =_0803D3EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D3E8: .4byte _0803D3EC
	.align 2, 0
_0803D3EC:
	.4byte _0803D418
	.4byte _0803D430
	.4byte _0803D43A
	.4byte _0803D44A
	.4byte _0803D45A
	.4byte _0803D46A
	.4byte _0803D47A
	.4byte _0803D48A
	.4byte _0803D49A
	.4byte _0803D4AA
	.4byte _0803D4BA
_0803D418:
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
	b _0803D4BA
_0803D430:
	ldrb r1, [r2]
	adds r0, r3, 0
	adds r0, 0x54
	strb r1, [r0]
	b _0803D4BA
_0803D43A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x56
	strh r0, [r1]
	b _0803D4BA
_0803D44A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x58
	strh r0, [r1]
	b _0803D4BA
_0803D45A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5A
	strh r0, [r1]
	b _0803D4BA
_0803D46A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5C
	strh r0, [r1]
	b _0803D4BA
_0803D47A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x5E
	strh r0, [r1]
	b _0803D4BA
_0803D48A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x60
	strh r0, [r1]
	b _0803D4BA
_0803D49A:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	adds r1, r3, 0
	adds r1, 0x62
	strh r0, [r1]
	b _0803D4BA
_0803D4AA:
	ldrb r1, [r2]
	adds r0, r3, 0
	adds r0, 0x55
	strb r1, [r0]
	b _0803D4BA
_0803D4B4:
	adds r0, r3, 0
	bl SetBoxMonData
_0803D4BA:
	pop {r0}
	bx r0
	thumb_func_end SetMonData

	thumb_func_start SetBoxMonData
SetBoxMonData: @ 803D4C0
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
	ble _0803D540
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
	beq _0803D540
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
	b _0803DACA
_0803D540:
	mov r0, r10
	cmp r0, 0x4F
	bls _0803D548
	b _0803DAB6
_0803D548:
	lsls r0, 2
	ldr r1, _0803D554 @ =_0803D558
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D554: .4byte _0803D558
	.align 2, 0
_0803D558:
	.4byte _0803D698
	.4byte _0803D6B0
	.4byte _0803D6C8
	.4byte _0803D6DE
	.4byte _0803D6E4
	.4byte _0803D6F4
	.4byte _0803D706
	.4byte _0803D718
	.4byte _0803D72E
	.4byte _0803D734
	.4byte _0803D740
	.4byte _0803D74C
	.4byte _0803D76C
	.4byte _0803D7A4
	.4byte _0803D7A4
	.4byte _0803D7A4
	.4byte _0803D7A4
	.4byte _0803D7B8
	.4byte _0803D7B8
	.4byte _0803D7B8
	.4byte _0803D7B8
	.4byte _0803D794
	.4byte _0803D7E8
	.4byte _0803D7EE
	.4byte _0803D7F4
	.4byte _0803D77A
	.4byte _0803D7C4
	.4byte _0803D7CA
	.4byte _0803D7D0
	.4byte _0803D7D6
	.4byte _0803D7DC
	.4byte _0803D7E2
	.4byte _0803D79C
	.4byte _0803D7FA
	.4byte _0803D80C
	.4byte _0803D812
	.4byte _0803D818
	.4byte _0803D82C
	.4byte _0803D844
	.4byte _0803D86A
	.4byte _0803D87E
	.4byte _0803D898
	.4byte _0803D8AE
	.4byte _0803D8C8
	.4byte _0803D8E0
	.4byte _0803D8F4
	.4byte _0803D924
	.4byte _0803D800
	.4byte _0803D806
	.4byte _0803D85A
	.4byte _0803D934
	.4byte _0803D942
	.4byte _0803D958
	.4byte _0803D970
	.4byte _0803D980
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DAB6
	.4byte _0803DA6E
	.4byte _0803D996
	.4byte _0803D9A6
	.4byte _0803D9B4
	.4byte _0803D9C4
	.4byte _0803D9D4
	.4byte _0803D9E4
	.4byte _0803D9F4
	.4byte _0803DA04
	.4byte _0803DA1A
	.4byte _0803DA2A
	.4byte _0803DA38
	.4byte _0803DA48
	.4byte _0803DA5E
_0803D698:
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
	b _0803DAB6
_0803D6B0:
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
	b _0803DAB6
_0803D6C8:
	movs r2, 0
	adds r3, r7, 0
	adds r3, 0x8
_0803D6CE:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _0803D6CE
	b _0803DAB6
_0803D6DE:
	ldrb r0, [r4]
	strb r0, [r7, 0x12]
	b _0803DAB6
_0803D6E4:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r7, 0x13]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	b _0803D912
_0803D6F4:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r7, 0x13]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	b _0803D912
_0803D706:
	ldrb r0, [r4]
	movs r1, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x13]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _0803D912
_0803D718:
	movs r2, 0
	adds r3, r7, 0
	adds r3, 0x14
_0803D71E:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _0803D71E
	b _0803DAB6
_0803D72E:
	ldrb r0, [r4]
	strb r0, [r7, 0x1B]
	b _0803DAB6
_0803D734:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r7, 0x1C]
	b _0803DAB6
_0803D740:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r7, 0x1E]
	b _0803DAB6
_0803D74C:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	mov r0, r8
	strh r1, [r0]
	lsls r1, 16
	cmp r1, 0
	beq _0803D764
	ldrb r0, [r7, 0x13]
	movs r1, 0x2
	b _0803D912
_0803D764:
	ldrb r1, [r7, 0x13]
	movs r0, 0x3
	negs r0, r0
	b _0803D91E
_0803D76C:
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x2]
	b _0803DAB6
_0803D77A:
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
	b _0803DAB6
_0803D794:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, 0x8]
	b _0803DAB6
_0803D79C:
	ldrb r0, [r4]
	mov r1, r8
	strb r0, [r1, 0x9]
	b _0803DAB6
_0803D7A4:
	mov r2, r10
	subs r2, 0xD
	lsls r2, 1
	add r2, r9
	ldrb r1, [r4]
	ldrb r0, [r4, 0x1]
	lsls r0, 8
	adds r1, r0
	strh r1, [r2]
	b _0803DAB6
_0803D7B8:
	mov r0, r9
	add r0, r10
	subs r0, 0x9
	ldrb r1, [r4]
	strb r1, [r0]
	b _0803DAB6
_0803D7C4:
	ldrb r0, [r4]
	strb r0, [r6]
	b _0803DAB6
_0803D7CA:
	ldrb r0, [r4]
	strb r0, [r6, 0x1]
	b _0803DAB6
_0803D7D0:
	ldrb r0, [r4]
	strb r0, [r6, 0x2]
	b _0803DAB6
_0803D7D6:
	ldrb r0, [r4]
	strb r0, [r6, 0x3]
	b _0803DAB6
_0803D7DC:
	ldrb r0, [r4]
	strb r0, [r6, 0x4]
	b _0803DAB6
_0803D7E2:
	ldrb r0, [r4]
	strb r0, [r6, 0x5]
	b _0803DAB6
_0803D7E8:
	ldrb r0, [r4]
	strb r0, [r6, 0x6]
	b _0803DAB6
_0803D7EE:
	ldrb r0, [r4]
	strb r0, [r6, 0x7]
	b _0803DAB6
_0803D7F4:
	ldrb r0, [r4]
	strb r0, [r6, 0x8]
	b _0803DAB6
_0803D7FA:
	ldrb r0, [r4]
	strb r0, [r6, 0x9]
	b _0803DAB6
_0803D800:
	ldrb r0, [r4]
	strb r0, [r6, 0xA]
	b _0803DAB6
_0803D806:
	ldrb r0, [r4]
	strb r0, [r6, 0xB]
	b _0803DAB6
_0803D80C:
	ldrb r0, [r4]
	strb r0, [r5]
	b _0803DAB6
_0803D812:
	ldrb r0, [r4]
	strb r0, [r5, 0x1]
	b _0803DAB6
_0803D818:
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r1, r0
	ldrb r2, [r5, 0x2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x2]
	b _0803DAB6
_0803D82C:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r1, r0
	lsls r1, 7
	ldrh r2, [r5, 0x2]
	ldr r0, _0803D840 @ =0xfffff87f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x2]
	b _0803DAB6
	.align 2, 0
_0803D840: .4byte 0xfffff87f
_0803D844:
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
	b _0803DAB6
_0803D85A:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x3]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	b _0803DAB6
_0803D86A:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	ldrb r2, [r5, 0x4]
	movs r0, 0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x4]
	b _0803DAB6
_0803D87E:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r5, 0x4]
	ldr r0, _0803D894 @ =0xfffffc1f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	b _0803DAB6
	.align 2, 0
_0803D894: .4byte 0xfffffc1f
_0803D898:
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
	b _0803DAB6
_0803D8AE:
	ldrb r2, [r4]
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 15
	ldr r0, [r5, 0x4]
	ldr r1, _0803D8C4 @ =0xfff07fff
	ands r0, r1
	orrs r0, r2
	str r0, [r5, 0x4]
	b _0803DAB6
	.align 2, 0
_0803D8C4: .4byte 0xfff07fff
_0803D8C8:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 4
	ldrh r2, [r5, 0x6]
	ldr r0, _0803D8DC @ =0xfffffe0f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x6]
	b _0803DAB6
	.align 2, 0
_0803D8DC: .4byte 0xfffffe0f
_0803D8E0:
	ldrb r1, [r4]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x7]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	b _0803DAB4
_0803D8F4:
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
	bge _0803D918
	ldrb r0, [r7, 0x13]
	movs r1, 0x4
_0803D912:
	orrs r0, r1
	strb r0, [r7, 0x13]
	b _0803DAB6
_0803D918:
	ldrb r1, [r7, 0x13]
	movs r0, 0x5
	negs r0, r0
_0803D91E:
	ands r0, r1
	strb r0, [r7, 0x13]
	b _0803DAB6
_0803D924:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x7]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x7]
	b _0803DAB6
_0803D934:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	ldrb r2, [r5, 0x8]
	movs r0, 0x8
	negs r0, r0
	b _0803D950
_0803D942:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0x8]
	movs r0, 0x39
	negs r0, r0
_0803D950:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x8]
	b _0803DAB6
_0803D958:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 6
	ldrh r2, [r5, 0x8]
	ldr r0, _0803D96C @ =0xfffffe3f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x8]
	b _0803DAB6
	.align 2, 0
_0803D96C: .4byte 0xfffffe3f
_0803D970:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x9]
	movs r0, 0xF
	negs r0, r0
	b _0803D98E
_0803D980:
	ldrb r1, [r4]
	movs r0, 0x7
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5, 0x9]
	movs r0, 0x71
	negs r0, r0
_0803D98E:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x9]
	b _0803DAB6
_0803D996:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0x9]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x9]
	b _0803DAB6
_0803D9A6:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	ldrb r2, [r5, 0xA]
	movs r0, 0x2
	negs r0, r0
	b _0803DA12
_0803D9B4:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0xA]
	movs r0, 0x3
	negs r0, r0
	b _0803DA12
_0803D9C4:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0xA]
	movs r0, 0x5
	negs r0, r0
	b _0803DA12
_0803D9D4:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	ldrb r2, [r5, 0xA]
	movs r0, 0x9
	negs r0, r0
	b _0803DA12
_0803D9E4:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5, 0xA]
	movs r0, 0x11
	negs r0, r0
	b _0803DA12
_0803D9F4:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 5
	ldrb r2, [r5, 0xA]
	movs r0, 0x21
	negs r0, r0
	b _0803DA12
_0803DA04:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 6
	ldrb r2, [r5, 0xA]
	movs r0, 0x41
	negs r0, r0
_0803DA12:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xA]
	b _0803DAB6
_0803DA1A:
	ldrb r0, [r4]
	lsls r0, 7
	ldrb r2, [r5, 0xA]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0xA]
	b _0803DAB6
_0803DA2A:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	ldrb r2, [r5, 0xB]
	movs r0, 0x2
	negs r0, r0
	b _0803DA56
_0803DA38:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0xB]
	movs r0, 0x3
	negs r0, r0
	b _0803DA56
_0803DA48:
	ldrb r1, [r4]
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0xB]
	movs r0, 0x5
	negs r0, r0
_0803DA56:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xB]
	b _0803DAB6
_0803DA5E:
	ldrb r0, [r4]
	lsls r0, 3
	ldrb r2, [r5, 0xB]
	movs r1, 0x7
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0xB]
	b _0803DAB6
_0803DA6E:
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
	ldr r0, _0803DAD8 @ =0xfffffc1f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldrb r1, [r5, 0x5]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x5]
	ldr r0, [r5, 0x4]
	ldr r1, _0803DADC @ =0xfff07fff
	ands r0, r1
	str r0, [r5, 0x4]
	ldrh r1, [r5, 0x6]
	ldr r0, _0803DAE0 @ =0xfffffe0f
	ands r0, r1
	strh r0, [r5, 0x6]
	ldrb r1, [r5, 0x7]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
_0803DAB4:
	strb r0, [r5, 0x7]
_0803DAB6:
	mov r0, r10
	cmp r0, 0xA
	ble _0803DACA
	adds r0, r7, 0
	bl CalculateBoxMonChecksum
	strh r0, [r7, 0x1C]
	adds r0, r7, 0
	bl EncryptBoxMon
_0803DACA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DAD8: .4byte 0xfffffc1f
_0803DADC: .4byte 0xfff07fff
_0803DAE0: .4byte 0xfffffe0f
	thumb_func_end SetBoxMonData

	thumb_func_start CopyMon
CopyMon: @ 803DAE4
	push {lr}
	bl memcpy
	pop {r0}
	bx r0
	thumb_func_end CopyMon

	thumb_func_start GiveMonToPlayer
GiveMonToPlayer: @ 803DAF0
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _0803DB1C @ =gSaveBlock2
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
	b _0803DB22
	.align 2, 0
_0803DB1C: .4byte gSaveBlock2
_0803DB20:
	adds r5, 0x1
_0803DB22:
	cmp r5, 0x5
	bgt _0803DB5C
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0803DB54 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DB20
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x64
	bl CopyMon
	ldr r1, _0803DB58 @ =gPlayerPartyCount
	adds r0, r5, 0x1
	strb r0, [r1]
	movs r0, 0
	b _0803DB66
	.align 2, 0
_0803DB54: .4byte gPlayerParty
_0803DB58: .4byte gPlayerPartyCount
_0803DB5C:
	adds r0, r6, 0
	bl SendMonToPC
	lsls r0, 24
	lsrs r0, 24
_0803DB66:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GiveMonToPlayer

	thumb_func_start SendMonToPC
SendMonToPC: @ 803DB6C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r9, r0
	ldr r0, _0803DBBC @ =gPokemonStorage
	ldrb r5, [r0]
_0803DB7C:
	movs r7, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	mov r8, r0
	movs r6, 0
_0803DB8C:
	ldr r3, _0803DBC0 @ =gUnknown_020300A4
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
	bne _0803DBC4
	mov r0, r9
	bl sub_8040B1C
	adds r0, r4, 0
	mov r1, r9
	movs r2, 0x50
	bl CopyMon
	movs r0, 0x1
	b _0803DBDE
	.align 2, 0
_0803DBBC: .4byte gPokemonStorage
_0803DBC0: .4byte gUnknown_020300A4
_0803DBC4:
	adds r6, 0x50
	adds r7, 0x1
	cmp r7, 0x1D
	ble _0803DB8C
	adds r5, 0x1
	cmp r5, 0xE
	bne _0803DBD4
	movs r5, 0
_0803DBD4:
	subs r0, r3, 0x4
	ldrb r0, [r0]
	cmp r5, r0
	bne _0803DB7C
	movs r0, 0x2
_0803DBDE:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end SendMonToPC

	thumb_func_start CalculatePlayerPartyCount
CalculatePlayerPartyCount: @ 803DBEC
	push {r4,lr}
	ldr r0, _0803DBF8 @ =gPlayerPartyCount
	movs r1, 0
	strb r1, [r0]
	b _0803DC04
	.align 2, 0
_0803DBF8: .4byte gPlayerPartyCount
_0803DBFC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0
_0803DC04:
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0803DC22
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803DC2C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DBFC
_0803DC22:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DC2C: .4byte gPlayerParty
	thumb_func_end CalculatePlayerPartyCount

	thumb_func_start CalculateEnemyPartyCount
CalculateEnemyPartyCount: @ 803DC30
	push {r4,lr}
	ldr r0, _0803DC3C @ =gEnemyPartyCount
	movs r1, 0
	strb r1, [r0]
	b _0803DC48
	.align 2, 0
_0803DC3C: .4byte gEnemyPartyCount
_0803DC40:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r0, r4, 0
_0803DC48:
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0803DC66
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0803DC70 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DC40
_0803DC66:
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DC70: .4byte gEnemyParty
	thumb_func_end CalculateEnemyPartyCount

	thumb_func_start sub_803DAA0
sub_803DAA0: @ 803DC74
	push {r4-r6,lr}
	movs r6, 0
	bl CalculatePlayerPartyCount
	ldr r1, _0803DCE0 @ =gPlayerPartyCount
	ldrb r0, [r1]
	cmp r0, 0x1
	beq _0803DCD8
	movs r5, 0
	ldrb r1, [r1]
	cmp r6, r1
	bge _0803DCD0
_0803DC8C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0803DCE4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0803DCC6
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0803DCC6
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0803DCC6
	adds r6, 0x1
_0803DCC6:
	adds r5, 0x1
	ldr r0, _0803DCE0 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r5, r0
	blt _0803DC8C
_0803DCD0:
	movs r0, 0
	cmp r6, 0x1
	bgt _0803DCD8
	movs r0, 0x2
_0803DCD8:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803DCE0: .4byte gPlayerPartyCount
_0803DCE4: .4byte gPlayerParty
	thumb_func_end sub_803DAA0

	thumb_func_start GetAbilityBySpecies
GetAbilityBySpecies: @ 803DCE8
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	cmp r1, 0
	beq _0803DD0C
	ldr r2, _0803DD04 @ =byte_2024C06
	ldr r1, _0803DD08 @ =gBaseStats
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x17]
	b _0803DD1A
	.align 2, 0
_0803DD04: .4byte byte_2024C06
_0803DD08: .4byte gBaseStats
_0803DD0C:
	ldr r2, _0803DD24 @ =byte_2024C06
	ldr r1, _0803DD28 @ =gBaseStats
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x16]
_0803DD1A:
	strb r0, [r2]
	ldrb r0, [r2]
	pop {r1}
	bx r1
	.align 2, 0
_0803DD24: .4byte byte_2024C06
_0803DD28: .4byte gBaseStats
	thumb_func_end GetAbilityBySpecies

	thumb_func_start GetMonAbility
GetMonAbility: @ 803DD2C
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
CreateSecretBaseEnemyParty: @ 803DD60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r0, 0
	bl ZeroEnemyPartyMons
	ldr r5, _0803DE60 @ =0x02017000
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xA0
	bl memcpy
	movs r7, 0
_0803DD80:
	lsls r0, r7, 1
	mov r9, r0
	ldr r2, _0803DE60 @ =0x02017000
	adds r2, 0x7C
	mov r10, r2
	mov r1, r9
	add r1, r10
	ldrh r0, [r1]
	adds r2, r7, 0x1
	str r2, [sp, 0x10]
	cmp r0, 0
	beq _0803DE38
	movs r0, 0x64
	adds r6, r7, 0
	muls r6, r0
	ldr r2, _0803DE64 @ =gEnemyParty
	mov r8, r2
	adds r5, r6, r2
	ldrh r1, [r1]
	ldr r0, _0803DE60 @ =0x02017000
	adds r0, 0x94
	adds r0, r7, r0
	ldrb r2, [r0]
	movs r0, 0x1
	str r0, [sp]
	lsls r4, r7, 2
	ldr r0, _0803DE60 @ =0x02017000
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
	ldr r2, _0803DE68 @ =0x02017088
	add r2, r9
	adds r0, r5, 0
	movs r1, 0xC
	bl SetMonData
	movs r5, 0
	mov r9, r4
	mov r3, r8
	mov r4, r10
	adds r4, 0x1E
_0803DDE4:
	adds r1, r5, 0
	adds r1, 0x1A
	adds r0, r6, r3
	adds r2, r7, r4
	str r3, [sp, 0x14]
	bl SetMonData
	adds r5, 0x1
	ldr r3, [sp, 0x14]
	cmp r5, 0x5
	ble _0803DDE4
	movs r5, 0
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0803DE64 @ =gEnemyParty
	adds r7, r1, r0
	mov r2, r9
	lsls r6, r2, 1
_0803DE0A:
	adds r1, r5, 0
	adds r1, 0xD
	ldr r4, _0803DE6C @ =0x0201704c
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
	ldr r0, _0803DE70 @ =0x08208100
	adds r2, r0
	adds r0, r7, 0
	bl SetMonData
	adds r6, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803DE0A
_0803DE38:
	ldr r7, [sp, 0x10]
	cmp r7, 0x5
	ble _0803DD80
	ldr r1, _0803DE74 @ =gUnknown_020239F8
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _0803DE78 @ =gTrainerBattleOpponent
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
_0803DE60: .4byte 0x02017000
_0803DE64: .4byte gEnemyParty
_0803DE68: .4byte 0x02017088
_0803DE6C: .4byte 0x0201704c
_0803DE70: .4byte 0x08208100
_0803DE74: .4byte gUnknown_020239F8
_0803DE78: .4byte gTrainerBattleOpponent
	thumb_func_end CreateSecretBaseEnemyParty

	thumb_func_start GetSecretBaseTrainerPicIndex
GetSecretBaseTrainerPicIndex: @ 803DE7C
	push {r4,r5,lr}
	ldr r5, _0803DEAC @ =gSecretBaseTrainerClasses
	ldr r4, _0803DEB0 @ =0x02017000
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
	ldr r1, _0803DEB4 @ =gTrainerClassToPicIndex
	adds r0, r1
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803DEAC: .4byte gSecretBaseTrainerClasses
_0803DEB0: .4byte 0x02017000
_0803DEB4: .4byte gTrainerClassToPicIndex
	thumb_func_end GetSecretBaseTrainerPicIndex

	thumb_func_start GetSecretBaseTrainerNameIndex
GetSecretBaseTrainerNameIndex: @ 803DEB8
	push {r4,r5,lr}
	ldr r5, _0803DEE8 @ =gSecretBaseTrainerClasses
	ldr r4, _0803DEEC @ =0x02017000
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
	ldr r1, _0803DEF0 @ =gTrainerClassToNameIndex
	adds r0, r1
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803DEE8: .4byte gSecretBaseTrainerClasses
_0803DEEC: .4byte 0x02017000
_0803DEF0: .4byte gTrainerClassToNameIndex
	thumb_func_end GetSecretBaseTrainerNameIndex

	thumb_func_start PlayerPartyAndPokemonStorageFull
PlayerPartyAndPokemonStorageFull: @ 803DEF4
	push {r4,lr}
	movs r4, 0
_0803DEF8:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0803DF10 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0803DF14
	movs r0, 0
	b _0803DF22
	.align 2, 0
_0803DF10: .4byte gPlayerParty
_0803DF14:
	adds r4, 0x1
	cmp r4, 0x5
	ble _0803DEF8
	bl PokemonStorageFull
	lsls r0, 24
	lsrs r0, 24
_0803DF22:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end PlayerPartyAndPokemonStorageFull

	thumb_func_start PokemonStorageFull
PokemonStorageFull: @ 803DF28
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r7, 0
_0803DF30:
	movs r5, 0
	adds r6, r7, 0
	movs r4, 0
_0803DF36:
	ldr r0, _0803DF50 @ =gUnknown_020300A4
	adds r0, r4, r0
	adds r0, r6, r0
	movs r1, 0xB
	movs r2, 0
	str r3, [sp]
	bl GetBoxMonData
	ldr r3, [sp]
	cmp r0, 0
	bne _0803DF54
	movs r0, 0
	b _0803DF6A
	.align 2, 0
_0803DF50: .4byte gUnknown_020300A4
_0803DF54:
	adds r4, 0x50
	adds r5, 0x1
	cmp r5, 0x1D
	ble _0803DF36
	movs r0, 0x96
	lsls r0, 4
	adds r7, r0
	adds r3, 0x1
	cmp r3, 0xD
	ble _0803DF30
	movs r0, 0x1
_0803DF6A:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end PokemonStorageFull

	thumb_func_start GetSpeciesName
GetSpeciesName: @ 803DF74
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r1, 0
	movs r0, 0xCE
	lsls r0, 1
	mov r12, r0
	ldr r7, _0803DF90 @ =gSpeciesNames
	movs r0, 0xB
	muls r0, r5
	adds r3, r0, r7
	adds r2, r6, 0
	b _0803DF9A
	.align 2, 0
_0803DF90: .4byte gSpeciesNames
_0803DF94:
	adds r3, 0x1
	adds r2, 0x1
	adds r1, 0x1
_0803DF9A:
	adds r4, r6, r1
	cmp r1, 0xA
	bgt _0803DFB4
	cmp r5, r12
	bls _0803DFAA
	adds r0, r1, r7
	ldrb r0, [r0]
	b _0803DFAC
_0803DFAA:
	ldrb r0, [r3]
_0803DFAC:
	strb r0, [r2]
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _0803DF94
_0803DFB4:
	movs r0, 0xFF
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end GetSpeciesName

	thumb_func_start CalculatePPWithBonus
CalculatePPWithBonus: @ 803DFC0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _0803E000 @ =gBattleMoves
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrb r4, [r3, 0x4]
	ldr r0, _0803E004 @ =gUnknown_08208238
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
_0803E000: .4byte gBattleMoves
_0803E004: .4byte gUnknown_08208238
	thumb_func_end CalculatePPWithBonus

	thumb_func_start RemoveMonPPBonus
RemoveMonPPBonus: @ 803E008
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
	ldr r1, _0803E040 @ =gUnknown_0820823C
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
_0803E040: .4byte gUnknown_0820823C
	thumb_func_end RemoveMonPPBonus

	thumb_func_start RemoveBattleMonPPBonus
RemoveBattleMonPPBonus: @ 803E044
	lsls r1, 24
	lsrs r1, 24
	adds r0, 0x3B
	ldr r2, _0803E058 @ =gUnknown_0820823C
	adds r1, r2
	ldrb r2, [r0]
	ldrb r1, [r1]
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803E058: .4byte gUnknown_0820823C
	thumb_func_end RemoveBattleMonPPBonus

	thumb_func_start CopyPlayerPartyMonToBattleData
CopyPlayerPartyMonToBattleData: @ 803E05C
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
	ldr r0, _0803E344 @ =gPlayerParty
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	ldr r1, _0803E348 @ =gBattleMons
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
_0803E0AE:
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
	ble _0803E0AE
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0803E344 @ =gPlayerParty
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
	ldr r1, _0803E34C @ =0xfffffc1f
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
	ldr r2, _0803E350 @ =0xfff07fff
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
	ldr r1, _0803E354 @ =0xfffffe0f
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
	ldr r2, _0803E358 @ =gBaseStats
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
	ldr r1, _0803E35C @ =0x020160bc
	adds r0, r1
	ldrh r1, [r7, 0x28]
	strh r1, [r0]
	movs r2, 0x6
	mov r1, r9
	movs r6, 0x7
	add r5, r10
	adds r0, r5, 0
	adds r0, 0x13
_0803E30E:
	strb r2, [r0]
	subs r0, 0x1
	subs r6, 0x1
	cmp r6, 0
	bge _0803E30E
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
_0803E344: .4byte gPlayerParty
_0803E348: .4byte gBattleMons
_0803E34C: .4byte 0xfffffc1f
_0803E350: .4byte 0xfff07fff
_0803E354: .4byte 0xfffffe0f
_0803E358: .4byte gBaseStats
_0803E35C: .4byte 0x020160bc
	thumb_func_end CopyPlayerPartyMonToBattleData

	.align 2, 0 @ Don't pad with nop.
