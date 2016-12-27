	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_800B858
sub_800B858: @ 800BA2C
	push {lr}
	ldr r0, _0800BA50 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800BA4A
	bl OpenLink
	ldr r0, _0800BA54 @ =sub_8083C50
	movs r1, 0
	bl CreateTask
	bl sub_800BF28
_0800BA4A:
	pop {r0}
	bx r0
	.align 2, 0
_0800BA50: .4byte gUnknown_020239F8
_0800BA54: .4byte sub_8083C50
	thumb_func_end sub_800B858

	thumb_func_start sub_800B884
sub_800B884: @ 800BA58
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _0800BAF4 @ =gUnknown_030042D4
	ldr r1, _0800BAF8 @ =nullsub_41
	str r1, [r0]
	movs r0, 0
	str r0, [sp, 0x10]
	movs r1, 0
	ldr r7, _0800BAFC @ =gUnknown_03004330
	ldr r6, _0800BB00 @ =gUnknown_02024E60
	movs r2, 0
	ldr r5, _0800BB04 @ =gUnknown_02024E64
	ldr r4, _0800BB08 @ =nullsub_91
	ldr r3, _0800BB0C @ =gUnknown_02024A72
_0800BA74:
	lsls r0, r1, 2
	adds r0, r7
	str r4, [r0]
	adds r1, r3
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, [sp, 0x10]
	adds r0, r6
	strb r2, [r0]
	ldr r0, [sp, 0x10]
	adds r0, r5
	strb r2, [r0]
	ldr r0, [sp, 0x10]
	adds r0, 0x1
	str r0, [sp, 0x10]
	adds r1, r0, 0
	cmp r1, 0x3
	ble _0800BA74
	bl sub_800B858
	ldr r0, _0800BB10 @ =gUnknown_02024A64
	movs r5, 0
	str r5, [r0]
	bl sub_8075624
	bl sub_8040710
	bl sub_81070D4
	ldr r0, _0800BB14 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0800BAE2
	bl ZeroEnemyPartyMons
	ldr r4, _0800BB18 @ =gEnemyParty
	movs r1, 0x8F
	lsls r1, 1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	str r5, [sp, 0xC]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x20
	bl CreateMon
	str r5, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_0800BAE2:
	ldr r0, _0800BB1C @ =gUnknown_020239FC
	str r5, [r0]
	ldr r0, _0800BB20 @ =gUnknown_02024C78
	strb r5, [r0]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAF4: .4byte gUnknown_030042D4
_0800BAF8: .4byte nullsub_41
_0800BAFC: .4byte gUnknown_03004330
_0800BB00: .4byte gUnknown_02024E60
_0800BB04: .4byte gUnknown_02024E64
_0800BB08: .4byte nullsub_91
_0800BB0C: .4byte gUnknown_02024A72
_0800BB10: .4byte gUnknown_02024A64
_0800BB14: .4byte gUnknown_020239F8
_0800BB18: .4byte gEnemyParty
_0800BB1C: .4byte gUnknown_020239FC
_0800BB20: .4byte gUnknown_02024C78
	thumb_func_end sub_800B884

	thumb_func_start sub_800B950
sub_800B950: @ 800BB24
	push {r4,r5,lr}
	ldr r0, _0800BB38 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800BB3C
	bl sub_800BA78
	b _0800BB40
	.align 2, 0
_0800BB38: .4byte gUnknown_020239F8
_0800BB3C:
	bl sub_800B9A8
_0800BB40:
	bl sub_800BD54
	ldr r0, _0800BB74 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0800BB6E
	movs r4, 0
	ldr r0, _0800BB78 @ =gUnknown_02024A68
	ldrb r1, [r0]
	cmp r4, r1
	bge _0800BB6E
	adds r5, r0, 0
_0800BB5C:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8094978
	adds r4, 0x1
	ldrb r0, [r5]
	cmp r4, r0
	blt _0800BB5C
_0800BB6E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB74: .4byte gUnknown_020239F8
_0800BB78: .4byte gUnknown_02024A68
	thumb_func_end sub_800B950

	thumb_func_start sub_800B9A8
sub_800B9A8: @ 800BB7C
	push {r4,lr}
	ldr r0, _0800BBA0 @ =gUnknown_020239F8
	ldrh r2, [r0]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0800BBFC
	ldr r1, _0800BBA4 @ =gUnknown_030042D4
	ldr r0, _0800BBA8 @ =sub_8010800
	str r0, [r1]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0800BBB4
	ldr r1, _0800BBAC @ =gUnknown_03004330
	ldr r0, _0800BBB0 @ =sub_812B468
	b _0800BBD0
	.align 2, 0
_0800BBA0: .4byte gUnknown_020239F8
_0800BBA4: .4byte gUnknown_030042D4
_0800BBA8: .4byte sub_8010800
_0800BBAC: .4byte gUnknown_03004330
_0800BBB0: .4byte sub_812B468
_0800BBB4:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0800BBCC
	ldr r1, _0800BBC4 @ =gUnknown_03004330
	ldr r0, _0800BBC8 @ =sub_8137224
	b _0800BBD0
	.align 2, 0
_0800BBC4: .4byte gUnknown_03004330
_0800BBC8: .4byte sub_8137224
_0800BBCC:
	ldr r1, _0800BBE8 @ =gUnknown_03004330
	ldr r0, _0800BBEC @ =sub_802BF74
_0800BBD0:
	str r0, [r1]
	adds r2, r1, 0
	ldr r1, _0800BBF0 @ =gUnknown_02024A72
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0800BBF4 @ =sub_8032AE0
	str r0, [r2, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r1, _0800BBF8 @ =gUnknown_02024A68
	movs r0, 0x2
	b _0800BC26
	.align 2, 0
_0800BBE8: .4byte gUnknown_03004330
_0800BBEC: .4byte sub_802BF74
_0800BBF0: .4byte gUnknown_02024A72
_0800BBF4: .4byte sub_8032AE0
_0800BBF8: .4byte gUnknown_02024A68
_0800BBFC:
	ldr r1, _0800BC30 @ =gUnknown_030042D4
	ldr r0, _0800BC34 @ =sub_8010800
	str r0, [r1]
	ldr r2, _0800BC38 @ =gUnknown_03004330
	ldr r4, _0800BC3C @ =sub_802BF74
	str r4, [r2]
	ldr r1, _0800BC40 @ =gUnknown_02024A72
	movs r0, 0
	strb r0, [r1]
	ldr r3, _0800BC44 @ =sub_8032AE0
	str r3, [r2, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	str r4, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	str r3, [r2, 0xC]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r1, _0800BC48 @ =gUnknown_02024A68
	movs r0, 0x4
_0800BC26:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BC30: .4byte gUnknown_030042D4
_0800BC34: .4byte sub_8010800
_0800BC38: .4byte gUnknown_03004330
_0800BC3C: .4byte sub_802BF74
_0800BC40: .4byte gUnknown_02024A72
_0800BC44: .4byte sub_8032AE0
_0800BC48: .4byte gUnknown_02024A68
	thumb_func_end sub_800B9A8

	thumb_func_start sub_800BA78
sub_800BA78: @ 800BC4C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r6, _0800BC8C @ =gUnknown_020239F8
	ldrh r1, [r6]
	movs r5, 0x1
	movs r4, 0x1
	ands r4, r1
	cmp r4, 0
	bne _0800BCD8
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0800BCAC
	ldr r1, _0800BC90 @ =gUnknown_030042D4
	ldr r0, _0800BC94 @ =sub_8010800
	str r0, [r1]
	ldr r2, _0800BC98 @ =gUnknown_03004330
	ldr r0, _0800BC9C @ =sub_802BF74
	str r0, [r2]
	ldr r1, _0800BCA0 @ =gUnknown_02024A72
	strb r4, [r1]
	ldr r0, _0800BCA4 @ =sub_8037510
	str r0, [r2, 0x4]
	strb r5, [r1, 0x1]
	ldr r1, _0800BCA8 @ =gUnknown_02024A68
	movs r0, 0x2
	b _0800BF12
	.align 2, 0
_0800BC8C: .4byte gUnknown_020239F8
_0800BC90: .4byte gUnknown_030042D4
_0800BC94: .4byte sub_8010800
_0800BC98: .4byte gUnknown_03004330
_0800BC9C: .4byte sub_802BF74
_0800BCA0: .4byte gUnknown_02024A72
_0800BCA4: .4byte sub_8037510
_0800BCA8: .4byte gUnknown_02024A68
_0800BCAC:
	ldr r2, _0800BCC4 @ =gUnknown_03004330
	ldr r0, _0800BCC8 @ =sub_802BF74
	str r0, [r2, 0x4]
	ldr r1, _0800BCCC @ =gUnknown_02024A72
	strb r3, [r1, 0x1]
	ldr r0, _0800BCD0 @ =sub_8037510
	str r0, [r2]
	strb r5, [r1]
	ldr r1, _0800BCD4 @ =gUnknown_02024A68
	movs r0, 0x2
	b _0800BF12
	.align 2, 0
_0800BCC4: .4byte gUnknown_03004330
_0800BCC8: .4byte sub_802BF74
_0800BCCC: .4byte gUnknown_02024A72
_0800BCD0: .4byte sub_8037510
_0800BCD4: .4byte gUnknown_02024A68
_0800BCD8:
	movs r0, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _0800BD64
	movs r6, 0x4
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0800BD2C
	ldr r1, _0800BD14 @ =gUnknown_030042D4
	ldr r0, _0800BD18 @ =sub_8010800
	str r0, [r1]
	ldr r2, _0800BD1C @ =gUnknown_03004330
	ldr r4, _0800BD20 @ =sub_802BF74
	str r4, [r2]
	ldr r1, _0800BD24 @ =gUnknown_02024A72
	movs r0, 0
	strb r0, [r1]
	ldr r3, _0800BD28 @ =sub_8037510
	str r3, [r2, 0x4]
	strb r5, [r1, 0x1]
	str r4, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	str r3, [r2, 0xC]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	b _0800BD48
	.align 2, 0
_0800BD14: .4byte gUnknown_030042D4
_0800BD18: .4byte sub_8010800
_0800BD1C: .4byte gUnknown_03004330
_0800BD20: .4byte sub_802BF74
_0800BD24: .4byte gUnknown_02024A72
_0800BD28: .4byte sub_8037510
_0800BD2C:
	ldr r2, _0800BD50 @ =gUnknown_03004330
	ldr r0, _0800BD54 @ =sub_802BF74
	str r0, [r2, 0x4]
	ldr r1, _0800BD58 @ =gUnknown_02024A72
	strb r3, [r1, 0x1]
	ldr r3, _0800BD5C @ =sub_8037510
	str r3, [r2]
	strb r5, [r1]
	str r0, [r2, 0xC]
	movs r0, 0x2
	strb r0, [r1, 0x3]
	str r3, [r2, 0x8]
	movs r0, 0x3
	strb r0, [r1, 0x2]
_0800BD48:
	ldr r0, _0800BD60 @ =gUnknown_02024A68
	strb r6, [r0]
	b _0800BF14
	.align 2, 0
_0800BD50: .4byte gUnknown_03004330
_0800BD54: .4byte sub_802BF74
_0800BD58: .4byte gUnknown_02024A72
_0800BD5C: .4byte sub_8037510
_0800BD60: .4byte gUnknown_02024A68
_0800BD64:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0800BD7C
	ldr r1, _0800BDA4 @ =gUnknown_030042D4
	ldr r0, _0800BDA8 @ =sub_8010800
	str r0, [r1]
_0800BD7C:
	movs r0, 0
	mov r10, r0
	ldr r1, _0800BDAC @ =gLinkPlayers
	mov r12, r1
	ldr r7, _0800BDB0 @ =gUnknown_02024A72
	mov r8, r0
	ldr r6, _0800BDB4 @ =gUnknown_02024A6A
	movs r4, 0
	movs r2, 0x3
	mov r9, r2
_0800BD90:
	mov r1, r12
	adds r0, r4, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _0800BDB8
	cmp r0, 0x1
	bge _0800BDD0
	cmp r0, 0
	beq _0800BDBC
	b _0800BDDA
	.align 2, 0
_0800BDA4: .4byte gUnknown_030042D4
_0800BDA8: .4byte sub_8010800
_0800BDAC: .4byte gLinkPlayers
_0800BDB0: .4byte gUnknown_02024A72
_0800BDB4: .4byte gUnknown_02024A6A
_0800BDB8:
	cmp r0, 0x3
	bne _0800BDDA
_0800BDBC:
	ldr r0, _0800BDCC @ =gLinkPlayers
	adds r0, r4, r0
	ldrb r0, [r0, 0x18]
	movs r1, 0
	bl sub_8094978
	b _0800BDDA
	.align 2, 0
_0800BDCC: .4byte gLinkPlayers
_0800BDD0:
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8094978
_0800BDDA:
	cmp r10, r5
	bne _0800BE2A
	ldr r0, _0800BE00 @ =gLinkPlayers
	adds r3, r4, r0
	ldrh r1, [r3, 0x18]
	lsls r1, 2
	ldr r2, _0800BE04 @ =gUnknown_03004330
	adds r1, r2
	ldr r2, _0800BE08 @ =sub_802BF74
	str r2, [r1]
	ldrh r1, [r3, 0x18]
	mov r12, r0
	cmp r1, 0x2
	bgt _0800BE0C
	cmp r1, 0x1
	bge _0800BE20
	cmp r1, 0
	beq _0800BE10
	b _0800BF00
	.align 2, 0
_0800BE00: .4byte gLinkPlayers
_0800BE04: .4byte gUnknown_03004330
_0800BE08: .4byte sub_802BF74
_0800BE0C:
	cmp r1, 0x3
	bne _0800BF00
_0800BE10:
	mov r1, r12
	adds r0, r4, r1
	ldrh r1, [r0, 0x18]
	adds r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, 0x18]
	b _0800BEE6
_0800BE20:
	adds r1, r7
	movs r0, 0x2
	strb r0, [r1]
	ldrh r0, [r3, 0x18]
	b _0800BEF8
_0800BE2A:
	ldr r2, _0800BE50 @ =gLinkPlayers
	adds r0, r4, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	bne _0800BE54
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r12
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800BE66
	b _0800BEAC
	.align 2, 0
_0800BE50: .4byte gLinkPlayers
_0800BE54:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r12
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800BEAC
_0800BE66:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	lsls r0, 2
	ldr r1, _0800BE88 @ =gUnknown_03004330
	adds r0, r1
	ldr r1, _0800BE8C @ =sub_811DA78
	str r1, [r0]
	ldrh r1, [r2, 0x18]
	cmp r1, 0x2
	bgt _0800BE90
	cmp r1, 0x1
	bge _0800BEA4
	cmp r1, 0
	beq _0800BE94
	b _0800BF00
	.align 2, 0
_0800BE88: .4byte gUnknown_03004330
_0800BE8C: .4byte sub_811DA78
_0800BE90:
	cmp r1, 0x3
	bne _0800BF00
_0800BE94:
	mov r2, r12
	adds r0, r4, r2
	ldrh r1, [r0, 0x18]
	adds r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, 0x18]
	b _0800BEE6
_0800BEA4:
	adds r1, r7
	movs r0, 0x2
	strb r0, [r1]
	b _0800BEF6
_0800BEAC:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	lsls r0, 2
	ldr r1, _0800BECC @ =gUnknown_03004330
	adds r0, r1
	ldr r1, _0800BED0 @ =sub_8037510
	str r1, [r0]
	ldrh r0, [r2, 0x18]
	cmp r0, 0x2
	bgt _0800BED4
	cmp r0, 0x1
	bge _0800BEF0
	cmp r0, 0
	beq _0800BED8
	b _0800BF00
	.align 2, 0
_0800BECC: .4byte gUnknown_03004330
_0800BED0: .4byte sub_8037510
_0800BED4:
	cmp r0, 0x3
	bne _0800BF00
_0800BED8:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	adds r0, r7
	movs r1, 0x1
	strb r1, [r0]
	ldrh r0, [r2, 0x18]
_0800BEE6:
	lsls r0, 1
	adds r0, r6
	mov r1, r8
	strh r1, [r0]
	b _0800BF00
_0800BEF0:
	adds r0, r7
	mov r1, r9
	strb r1, [r0]
_0800BEF6:
	ldrh r0, [r2, 0x18]
_0800BEF8:
	lsls r0, 1
	adds r0, r6
	mov r2, r9
	strh r2, [r0]
_0800BF00:
	adds r4, 0x1C
	movs r0, 0x1
	add r10, r0
	mov r1, r10
	cmp r1, 0x3
	bgt _0800BF0E
	b _0800BD90
_0800BF0E:
	ldr r1, _0800BF24 @ =gUnknown_02024A68
	movs r0, 0x4
_0800BF12:
	strb r0, [r1]
_0800BF14:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF24: .4byte gUnknown_02024A68
	thumb_func_end sub_800BA78

	thumb_func_start sub_800BD54
sub_800BD54: @ 800BF28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800BF48 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800BF40
	b _0800C05C
_0800BF40:
	movs r0, 0
	mov r8, r0
	b _0800C052
	.align 2, 0
_0800BF48: .4byte gUnknown_020239F8
_0800BF4C:
	movs r5, 0
	movs r0, 0x1
	add r0, r8
	mov r10, r0
	ldr r0, _0800BF78 @ =gUnknown_02024A72
	add r0, r8
	mov r9, r0
	mov r0, r8
	lsls r6, r0, 1
	movs r7, 0
_0800BF60:
	mov r0, r8
	cmp r0, 0x1
	bgt _0800BFC8
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800BF80
	ldr r0, _0800BF7C @ =gPlayerParty
	b _0800BF82
	.align 2, 0
_0800BF78: .4byte gUnknown_02024A72
_0800BF7C: .4byte gPlayerParty
_0800BF80:
	ldr r0, _0800BFC0 @ =gEnemyParty
_0800BF82:
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0800C048
	ldr r0, _0800BFC4 @ =gUnknown_02024A6A
	adds r0, r6, r0
	strh r5, [r0]
	b _0800C050
	.align 2, 0
_0800BFC0: .4byte gEnemyParty
_0800BFC4: .4byte gUnknown_02024A6A
_0800BFC8:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800BFF0
	ldr r0, _0800BFEC @ =gPlayerParty
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0xB
	b _0800C004
	.align 2, 0
_0800BFEC: .4byte gPlayerParty
_0800BFF0:
	ldr r0, _0800C040 @ =gEnemyParty
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0x41
_0800C004:
	bl GetMonData
	cmp r0, 0
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0800C048
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0800C048
	ldr r1, _0800C044 @ =gUnknown_02024A6A
	mov r0, r8
	subs r0, 0x2
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _0800C048
	adds r0, r6, r1
	strh r5, [r0]
	b _0800C050
	.align 2, 0
_0800C040: .4byte gEnemyParty
_0800C044: .4byte gUnknown_02024A6A
_0800C048:
	adds r7, 0x64
	adds r5, 0x1
	cmp r5, 0x5
	ble _0800BF60
_0800C050:
	mov r8, r10
_0800C052:
	ldr r0, _0800C06C @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r8, r0
	bge _0800C05C
	b _0800BF4C
_0800C05C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C06C: .4byte gUnknown_02024A68
	thumb_func_end sub_800BD54

	thumb_func_start dp01_prepare_buffer
dp01_prepare_buffer: @ 800C070
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _0800C098 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800C09C
	adds r0, r3, 0
	adds r1, r2, 0
	adds r2, r4, 0
	bl dp01_prepare_buffer_wireless_probably
	b _0800C0EE
	.align 2, 0
_0800C098: .4byte gUnknown_020239F8
_0800C09C:
	cmp r5, 0
	beq _0800C0A6
	cmp r5, 0x1
	beq _0800C0D0
	b _0800C0EE
_0800C0A6:
	movs r3, 0
	cmp r3, r2
	bge _0800C0EE
	ldr r6, _0800C0C8 @ =gUnknown_02023A60
	ldr r5, _0800C0CC @ =gUnknown_02024A60
_0800C0B0:
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3, r0
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	blt _0800C0B0
	b _0800C0EE
	.align 2, 0
_0800C0C8: .4byte gUnknown_02023A60
_0800C0CC: .4byte gUnknown_02024A60
_0800C0D0:
	movs r3, 0
	cmp r3, r2
	bge _0800C0EE
	ldr r6, _0800C0F4 @ =gUnknown_02024260
	ldr r5, _0800C0F8 @ =gUnknown_02024A60
_0800C0DA:
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3, r0
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	blt _0800C0DA
_0800C0EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C0F4: .4byte gUnknown_02024260
_0800C0F8: .4byte gUnknown_02024A60
	thumb_func_end dp01_prepare_buffer

	thumb_func_start sub_800BF28
sub_800BF28: @ 800C0FC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0800C1A4 @ =sub_800C1A8
	movs r1, 0
	bl CreateTask
	ldr r2, _0800C1A8 @ =gUnknown_020238C4
	strb r0, [r2]
	ldr r5, _0800C1AC @ =gTasks
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r6, 0
	movs r4, 0
	strh r4, [r0, 0x1E]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x26]
	ldr r0, _0800C1B0 @ =sub_800C47C
	movs r1, 0
	bl CreateTask
	ldr r2, _0800C1B4 @ =gUnknown_020238C5
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x26]
	ldr r0, _0800C1B8 @ =gUnknown_020238C6
	strb r6, [r0]
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0800C1BC @ =0x02014000
	ldr r2, _0800C1C0 @ =0x01001000
	bl CpuSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C1A4: .4byte sub_800C1A8
_0800C1A8: .4byte gUnknown_020238C4
_0800C1AC: .4byte gTasks
_0800C1B0: .4byte sub_800C47C
_0800C1B4: .4byte gUnknown_020238C5
_0800C1B8: .4byte gUnknown_020238C6
_0800C1BC: .4byte 0x02014000
_0800C1C0: .4byte 0x01001000
	thumb_func_end sub_800BF28

	thumb_func_start dp01_prepare_buffer_wireless_probably
dp01_prepare_buffer_wireless_probably: @ 800C1C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r1, 0x3
	mov r0, r8
	bics r0, r1
	adds r0, 0x4
	mov r9, r0
	ldr r2, _0800C33C @ =gTasks
	ldr r3, _0800C340 @ =gUnknown_020238C4
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r4, r0, r2
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	add r0, r9
	adds r0, 0x9
	movs r1, 0x80
	lsls r1, 5
	adds r5, r2, 0
	cmp r0, r1
	ble _0800C216
	ldrh r0, [r4, 0x24]
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r2, [r0, 0x24]
_0800C216:
	ldr r4, _0800C344 @ =0x02000000
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	movs r7, 0xA0
	lsls r7, 9
	adds r0, r7
	adds r0, r4
	strb r6, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	ldr r2, _0800C348 @ =0x00014001
	adds r0, r2
	adds r0, r4
	ldr r1, _0800C34C @ =gUnknown_02024A60
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r0, [r0, r7]
	ldr r1, _0800C350 @ =0x00014002
	adds r0, r1
	adds r0, r4
	ldr r1, _0800C354 @ =gUnknown_02024C07
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	ldr r7, _0800C358 @ =0x00014003
	adds r0, r7
	adds r0, r4
	ldr r1, _0800C35C @ =gUnknown_02024C08
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	ldr r2, _0800C360 @ =0x00014004
	adds r0, r2
	adds r0, r4
	mov r7, r9
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r7, _0800C364 @ =0x00014005
	adds r1, r7
	adds r1, r4
	movs r0, 0xFF
	lsls r0, 8
	mov r2, r9
	ands r0, r2
	asrs r0, 8
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r0, [r0, r7]
	ldr r1, _0800C368 @ =0x00014006
	adds r0, r1
	adds r0, r4
	ldr r1, _0800C36C @ =gUnknown_02024C0C
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	ldr r7, _0800C370 @ =0x00014007
	adds r0, r7
	adds r0, r4
	ldr r1, _0800C374 @ =gUnknown_02024C0A
	ldrb r1, [r1]
	strb r1, [r0]
	movs r2, 0
	cmp r2, r8
	bge _0800C31A
	mov r12, r4
	adds r6, r3, 0
	ldr r4, _0800C378 @ =0x00014008
_0800C2F6:
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0800C33C @ =gTasks
	adds r0, r1
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	adds r0, r2, r4
	adds r1, r0
	add r1, r12
	mov r7, r10
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, r8
	blt _0800C2F6
_0800C31A:
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x24]
	add r0, r9
	adds r0, 0x8
	strh r0, [r1, 0x24]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C33C: .4byte gTasks
_0800C340: .4byte gUnknown_020238C4
_0800C344: .4byte 0x02000000
_0800C348: .4byte 0x00014001
_0800C34C: .4byte gUnknown_02024A60
_0800C350: .4byte 0x00014002
_0800C354: .4byte gUnknown_02024C07
_0800C358: .4byte 0x00014003
_0800C35C: .4byte gUnknown_02024C08
_0800C360: .4byte 0x00014004
_0800C364: .4byte 0x00014005
_0800C368: .4byte 0x00014006
_0800C36C: .4byte gUnknown_02024C0C
_0800C370: .4byte 0x00014007
_0800C374: .4byte gUnknown_02024C0A
_0800C378: .4byte 0x00014008
	thumb_func_end dp01_prepare_buffer_wireless_probably

	thumb_func_start sub_800C1A8
sub_800C1A8: @ 800C37C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0800C3A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x1E
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0x5
	bls _0800C398
	b _0800C528
_0800C398:
	lsls r0, 2
	ldr r1, _0800C3A8 @ =_0800C3AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C3A4: .4byte gTasks
_0800C3A8: .4byte _0800C3AC
	.align 2, 0
_0800C3AC:
	.4byte _0800C3C4
	.4byte _0800C3D8
	.4byte _0800C3F4
	.4byte _0800C430
	.4byte _0800C4BA
	.4byte _0800C50C
_0800C3C4:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	movs r1, 0x64
	strh r1, [r0, 0x1C]
	ldrh r1, [r0, 0x1E]
	adds r1, 0x1
	strh r1, [r0, 0x1E]
	b _0800C528
_0800C3D8:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r7
	ldrh r0, [r1, 0x1C]
	subs r0, 0x1
	strh r0, [r1, 0x1C]
	lsls r0, 16
	cmp r0, 0
	beq _0800C3EE
	b _0800C528
_0800C3EE:
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800C526
_0800C3F4:
	bl GetLinkPlayerCount_2
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	beq _0800C41C
	bl sub_8007F4C
	ldr r0, _0800C418 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800C526
	.align 2, 0
_0800C418: .4byte gTasks
_0800C41C:
	ldr r0, _0800C42C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800C526
	.align 2, 0
_0800C42C: .4byte gTasks
_0800C430:
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r7
	movs r5, 0x26
	ldrsh r3, [r2, r5]
	movs r0, 0x24
	ldrsh r6, [r2, r0]
	mov r12, r6
	cmp r3, r12
	beq _0800C528
	ldrh r0, [r2, 0x22]
	movs r6, 0x22
	ldrsh r5, [r2, r6]
	cmp r5, 0
	bne _0800C4B4
	cmp r3, r12
	ble _0800C460
	movs r6, 0x20
	ldrsh r0, [r2, r6]
	cmp r3, r0
	bne _0800C460
	strh r5, [r2, 0x20]
	strh r5, [r2, 0x26]
_0800C460:
	ldr r5, _0800C4A8 @ =0x02000000
	adds r4, r1, r4
	lsls r4, 3
	adds r4, r7
	movs r0, 0x26
	ldrsh r2, [r4, r0]
	ldr r1, _0800C4AC @ =0x00014004
	adds r0, r2, r1
	adds r0, r5
	ldrb r1, [r0]
	ldr r6, _0800C4B0 @ =0x00014005
	adds r2, r6
	adds r2, r5
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	adds r1, 0x8
	lsls r1, 16
	lsrs r6, r1, 16
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	movs r2, 0xA0
	lsls r2, 9
	adds r5, r2
	adds r1, r5
	adds r2, r6, 0
	bl SendBlock
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	b _0800C528
	.align 2, 0
_0800C4A8: .4byte 0x02000000
_0800C4AC: .4byte 0x00014004
_0800C4B0: .4byte 0x00014005
_0800C4B4:
	subs r0, 0x1
	strh r0, [r2, 0x22]
	b _0800C528
_0800C4BA:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0800C528
	ldr r2, _0800C4FC @ =0x02000000
	ldr r0, _0800C500 @ =gTasks
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r0
	movs r4, 0x26
	ldrsh r1, [r3, r4]
	ldr r5, _0800C504 @ =0x00014004
	adds r0, r1, r5
	adds r0, r2
	ldrb r0, [r0]
	ldr r6, _0800C508 @ =0x00014005
	adds r1, r6
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	movs r2, 0x1
	strh r2, [r3, 0x22]
	orrs r0, r1
	ldrh r1, [r3, 0x26]
	adds r0, r1
	adds r0, 0x8
	strh r0, [r3, 0x26]
	movs r0, 0x3
	strh r0, [r3, 0x1E]
	b _0800C528
	.align 2, 0
_0800C4FC: .4byte 0x02000000
_0800C500: .4byte gTasks
_0800C504: .4byte 0x00014004
_0800C508: .4byte 0x00014005
_0800C50C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r7
	ldrh r0, [r1, 0x22]
	subs r0, 0x1
	strh r0, [r1, 0x22]
	lsls r0, 16
	cmp r0, 0
	bne _0800C528
	movs r0, 0x1
	strh r0, [r1, 0x22]
	movs r0, 0x3
_0800C526:
	strh r0, [r1, 0x1E]
_0800C528:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800C1A8

	thumb_func_start sub_800C35C
sub_800C35C: @ 800C530
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800C560 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800C62C
	ldr r0, _0800C564 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800C62C
	ldr r0, _0800C568 @ =gLinkPlayers
	ldr r1, [r0, 0x14]
	ldr r0, _0800C56C @ =0x00002211
	cmp r1, r0
	bne _0800C62C
	movs r4, 0
	ldr r0, _0800C570 @ =gBlockRecvBuffer
	mov r10, r0
	b _0800C620
	.align 2, 0
_0800C560: .4byte gReceivedRemoteLinkPlayers
_0800C564: .4byte gUnknown_020239F8
_0800C568: .4byte gLinkPlayers
_0800C56C: .4byte 0x00002211
_0800C570: .4byte gBlockRecvBuffer
_0800C574:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800C63C @ =gBitTable
	lsls r1, r4, 2
	adds r1, r2
	ldr r1, [r1]
	ands r0, r1
	adds r1, r4, 0x1
	mov r9, r1
	cmp r0, 0
	beq _0800C61A
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	lsls r0, r4, 8
	mov r2, r10
	adds r3, r0, r2
	ldr r1, _0800C640 @ =0x03002b94
	adds r0, r1
	ldrh r6, [r0]
	ldr r7, _0800C644 @ =gTasks
	ldr r2, _0800C648 @ =gUnknown_020238C5
	mov r12, r2
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, r0, r7
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r0
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	ble _0800C5D6
	ldrh r0, [r2, 0x24]
	strh r0, [r2, 0x20]
	mov r2, r12
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r7
	movs r1, 0
	strh r1, [r0, 0x24]
_0800C5D6:
	mov r2, r12
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r7
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r0, _0800C64C @ =0x02015000
	adds r5, r1, r0
	adds r4, r3, 0
	movs r2, 0
	adds r3, r6, 0
	adds r3, 0x8
	mov r8, r7
	mov r7, r12
	cmp r2, r3
	bge _0800C608
_0800C5FA:
	adds r0, r5, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r3
	blt _0800C5FA
_0800C608:
	ldrb r0, [r7]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x24]
	adds r0, r6, r0
	adds r0, 0x8
	strh r0, [r1, 0x24]
_0800C61A:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r4, r0, 24
_0800C620:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0800C574
_0800C62C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C63C: .4byte gBitTable
_0800C640: .4byte 0x03002b94
_0800C644: .4byte gTasks
_0800C648: .4byte gUnknown_020238C5
_0800C64C: .4byte 0x02015000
	thumb_func_end sub_800C35C

	thumb_func_start sub_800C47C
sub_800C47C: @ 800C650
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0800C6D0 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0x26
	ldrsh r2, [r3, r0]
	movs r4, 0x24
	ldrsh r0, [r3, r4]
	adds r4, r1, 0
	cmp r2, r0
	bne _0800C678
	b _0800C7CE
_0800C678:
	cmp r2, r0
	ble _0800C68A
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r2, r0
	bne _0800C68A
	movs r0, 0
	strh r0, [r3, 0x20]
	strh r0, [r3, 0x26]
_0800C68A:
	ldr r5, _0800C6D4 @ =0x02000000
	mov r2, r8
	lsls r1, r2, 2
	adds r0, r1, r2
	lsls r0, 3
	adds r6, r0, r4
	movs r4, 0x26
	ldrsh r3, [r6, r4]
	ldr r2, _0800C6D8 @ =0x00015001
	adds r0, r3, r2
	adds r0, r5
	ldrb r4, [r0]
	adds r2, 0x3
	adds r0, r3, r2
	adds r0, r5
	ldrb r7, [r0]
	adds r2, 0x1
	adds r0, r3, r2
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 8
	orrs r7, r0
	subs r2, 0x5
	adds r0, r3, r2
	adds r0, r5
	ldrb r0, [r0]
	mov r9, r1
	cmp r0, 0x1
	beq _0800C784
	cmp r0, 0x1
	bgt _0800C6DC
	cmp r0, 0
	beq _0800C6E2
	b _0800C7BC
	.align 2, 0
_0800C6D0: .4byte gTasks
_0800C6D4: .4byte 0x02000000
_0800C6D8: .4byte 0x00015001
_0800C6DC:
	cmp r0, 0x2
	beq _0800C7A0
	b _0800C7BC
_0800C6E2:
	ldr r2, _0800C75C @ =gUnknown_02024A64
	ldr r1, _0800C760 @ =gBitTable
	lsls r0, r4, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0800C7CE
	lsls r0, r4, 9
	ldr r1, _0800C764 @ =gUnknown_02023A60
	adds r0, r1
	ldr r2, _0800C768 @ =0x00015008
	adds r1, r5, r2
	adds r1, r3, r1
	adds r2, r7, 0
	bl memcpy
	adds r0, r4, 0
	bl sub_80155A4
	ldr r0, _0800C76C @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0800C7BC
	ldr r1, _0800C770 @ =gUnknown_02024C07
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	ldr r2, _0800C774 @ =0x00015002
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800C778 @ =gUnknown_02024C08
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	adds r2, 0x1
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800C77C @ =gUnknown_02024C0C
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	adds r2, 0x3
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800C780 @ =gUnknown_02024C0A
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	adds r2, 0x1
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	b _0800C7BC
	.align 2, 0
_0800C75C: .4byte gUnknown_02024A64
_0800C760: .4byte gBitTable
_0800C764: .4byte gUnknown_02023A60
_0800C768: .4byte 0x00015008
_0800C76C: .4byte gUnknown_020239F8
_0800C770: .4byte gUnknown_02024C07
_0800C774: .4byte 0x00015002
_0800C778: .4byte gUnknown_02024C08
_0800C77C: .4byte gUnknown_02024C0C
_0800C780: .4byte gUnknown_02024C0A
_0800C784:
	lsls r0, r4, 9
	ldr r1, _0800C798 @ =gUnknown_02024260
	adds r0, r1
	ldr r4, _0800C79C @ =0x00015008
	adds r1, r5, r4
	adds r1, r3, r1
	adds r2, r7, 0
	bl memcpy
	b _0800C7BC
	.align 2, 0
_0800C798: .4byte gUnknown_02024260
_0800C79C: .4byte 0x00015008
_0800C7A0:
	ldr r1, _0800C7DC @ =0x00015008
	adds r0, r3, r1
	adds r0, r5
	ldrb r2, [r0]
	ldr r3, _0800C7E0 @ =gUnknown_02024A64
	ldr r1, _0800C7E4 @ =gBitTable
	lsls r0, r4, 2
	adds r0, r1
	lsls r2, 2
	ldr r1, [r0]
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
_0800C7BC:
	ldr r0, _0800C7E8 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, r7, r0
	adds r0, 0x8
	strh r0, [r1, 0x26]
_0800C7CE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C7DC: .4byte 0x00015008
_0800C7E0: .4byte gUnknown_02024A64
_0800C7E4: .4byte gBitTable
_0800C7E8: .4byte gTasks
	thumb_func_end sub_800C47C

	thumb_func_start dp01_build_cmdbuf_x00_a_b_0
dp01_build_cmdbuf_x00_a_b_0: @ 800C7EC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C80C @ =gUnknown_03004040
	movs r3, 0
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C80C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x00_a_b_0

	thumb_func_start dp01_build_cmdbuf_x01_a_b_0
dp01_build_cmdbuf_x01_a_b_0: @ 800C810
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C834 @ =gUnknown_03004040
	movs r4, 0
	movs r3, 0x1
	strb r3, [r1]
	strb r5, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r4, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800C834: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x01_a_b_0

	thumb_func_start dp01_build_cmdbuf_x02_a_b_varargs
dp01_build_cmdbuf_x02_a_b_varargs: @ 800C838
	push {r4-r6,lr}
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _0800C874 @ =gUnknown_03004040
	movs r3, 0x2
	strb r3, [r0]
	strb r1, [r0, 0x1]
	strb r2, [r0, 0x2]
	adds r1, r0, 0
	cmp r5, 0
	beq _0800C866
	adds r3, r1, 0x3
	adds r2, r5, 0
_0800C858:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, 0x1
	adds r3, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800C858
_0800C866:
	adds r2, r5, 0x3
	adds r0, r6, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C874: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x02_a_b_varargs

	thumb_func_start unref_sub_800C6A4
unref_sub_800C6A4: @ 800C878
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r0, _0800C8B4 @ =gUnknown_03004040
	movs r2, 0x3
	strb r2, [r0]
	strb r1, [r0, 0x1]
	strb r4, [r0, 0x2]
	adds r5, r0, 0
	cmp r4, 0
	beq _0800C8A4
	adds r1, r5, 0x3
	adds r2, r4, 0
_0800C896:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800C896
_0800C8A4:
	adds r2, r4, 0x3
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C8B4: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800C6A4

	thumb_func_start dp01_build_cmdbuf_x04_4_4_4
dp01_build_cmdbuf_x04_4_4_4: @ 800C8B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C8D4 @ =gUnknown_03004040
	movs r2, 0x4
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C8D4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x04_4_4_4

	thumb_func_start sub_800C704
sub_800C704: @ 800C8D8
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C8F8 @ =gUnknown_03004040
	movs r3, 0x5
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C8F8: .4byte gUnknown_03004040
	thumb_func_end sub_800C704

	thumb_func_start dp01_build_cmdbuf_x06_a
dp01_build_cmdbuf_x06_a: @ 800C8FC
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C918 @ =gUnknown_03004040
	movs r2, 0x6
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C918: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x06_a

	thumb_func_start dp01_build_cmdbuf_x07_7_7_7
dp01_build_cmdbuf_x07_7_7_7: @ 800C91C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C938 @ =gUnknown_03004040
	movs r2, 0x7
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C938: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x07_7_7_7

	thumb_func_start dp01_build_cmdbuf_x08_8_8_8
dp01_build_cmdbuf_x08_8_8_8: @ 800C93C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C958 @ =gUnknown_03004040
	movs r2, 0x8
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C958: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x08_8_8_8

	thumb_func_start dp01_build_cmdbuf_x09_9_9_9
dp01_build_cmdbuf_x09_9_9_9: @ 800C95C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C978 @ =gUnknown_03004040
	movs r2, 0x9
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C978: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x09_9_9_9

	thumb_func_start dp01_build_cmdbuf_x0A_A_A_A
dp01_build_cmdbuf_x0A_A_A_A: @ 800C97C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C998 @ =gUnknown_03004040
	movs r2, 0xA
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C998: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0A_A_A_A

	thumb_func_start dp01_build_cmdbuf_x0B_B_B_B
dp01_build_cmdbuf_x0B_B_B_B: @ 800C99C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C9B8 @ =gUnknown_03004040
	movs r2, 0xB
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C9B8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0B_B_B_B

	thumb_func_start dp01_build_cmdbuf_x0C_C_C_C
dp01_build_cmdbuf_x0C_C_C_C: @ 800C9BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C9D8 @ =gUnknown_03004040
	movs r2, 0xC
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C9D8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0C_C_C_C

	thumb_func_start dp01_build_cmdbuf_x0D_a
dp01_build_cmdbuf_x0D_a: @ 800C9DC
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C9F8 @ =gUnknown_03004040
	movs r2, 0xD
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C9F8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0D_a

	thumb_func_start unref_sub_800C828
unref_sub_800C828: @ 800C9FC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0800CA40 @ =gUnknown_03004040
	movs r0, 0xE
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsls r0, r4, 1
	adds r0, r4
	adds r5, r1, 0
	cmp r0, 0
	beq _0800CA2A
	adds r1, r5, 0x2
	adds r3, r0, 0
_0800CA1C:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800CA1C
_0800CA2A:
	lsls r2, r4, 1
	adds r2, r4
	adds r2, 0x2
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA40: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800C828

	thumb_func_start dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes
dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes: @ 800CA44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r7, _0800CAD8 @ =gUnknown_03004040
	movs r0, 0
	mov r12, r0
	movs r0, 0xF
	strb r0, [r7]
	strb r1, [r7, 0x1]
	lsrs r1, 8
	strb r1, [r7, 0x2]
	strb r2, [r7, 0x3]
	strb r3, [r7, 0x4]
	movs r6, 0xFF
	lsls r6, 8
	lsrs r3, 8
	strb r3, [r7, 0x5]
	strb r4, [r7, 0x6]
	adds r0, r4, 0
	ands r0, r6
	asrs r0, 8
	strb r0, [r7, 0x7]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r4
	asrs r0, 16
	strb r0, [r7, 0x8]
	lsrs r4, 24
	strb r4, [r7, 0x9]
	strb r5, [r7, 0xA]
	ldr r0, _0800CADC @ =gUnknown_02024C0E
	ldrb r0, [r0]
	strb r0, [r7, 0xB]
	mov r0, r12
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0800CAE4
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0800CAE4
	ldr r0, _0800CAE0 @ =word_2024DB8
	ldrh r0, [r0]
	strb r0, [r7, 0xC]
	ands r6, r0
	lsrs r0, r6, 8
	strb r0, [r7, 0xD]
	adds r4, r7, 0
	b _0800CAEE
	.align 2, 0
_0800CAD8: .4byte gUnknown_03004040
_0800CADC: .4byte gUnknown_02024C0E
_0800CAE0: .4byte word_2024DB8
_0800CAE4:
	ldr r0, _0800CB18 @ =gUnknown_03004040
	movs r1, 0
	strb r1, [r0, 0xC]
	strb r1, [r0, 0xD]
	adds r4, r0, 0
_0800CAEE:
	movs r0, 0
	strb r0, [r4, 0xE]
	strb r0, [r4, 0xF]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [sp, 0x24]
	movs r2, 0x1C
	bl memcpy
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0x2C
	bl dp01_prepare_buffer
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB18: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes

	thumb_func_start dp01_build_cmdbuf_x10_TODO
dp01_build_cmdbuf_x10_TODO: @ 800CB1C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0800CC00 @ =gUnknown_03004040
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0800CC04 @ =gUnknown_02024D26
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	lsrs r1, 8
	strb r1, [r2, 0x3]
	adds r0, r2, 0x4
	mov r12, r0
	ldr r4, _0800CC08 @ =gUnknown_02024BE6
	ldrh r0, [r4]
	strh r0, [r2, 0x4]
	ldr r0, _0800CC0C @ =gUnknown_02024BE8
	ldrh r0, [r0]
	mov r1, r12
	strh r0, [r1, 0x2]
	ldr r0, _0800CC10 @ =gUnknown_02024C04
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _0800CC14 @ =byte_2024C06
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldr r1, _0800CC18 @ =0x02000000
	ldr r3, _0800CC1C @ =0x00016003
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r7, r12
	strb r0, [r7, 0x7]
	adds r3, 0x5B
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r7, 0x8]
	ldr r7, _0800CC20 @ =0x000160c1
	adds r1, r7
	ldrb r0, [r1]
	mov r1, r12
	strb r0, [r1, 0x9]
	ldr r0, _0800CC24 @ =gUnknown_02024C0B
	ldrb r0, [r0]
	strb r0, [r1, 0xA]
	ldr r3, _0800CC28 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x2]
	mov r3, r12
	strb r0, [r3, 0xB]
	movs r3, 0
	mov r9, r2
	ldr r7, _0800CC2C @ =gUnknown_030042B0
	mov r8, r7
	adds r2, 0x10
	ldr r0, _0800CC30 @ =gBattleMons
	adds r4, r0, 0
	adds r4, 0x20
_0800CBA6:
	adds r1, r2, r3
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x58
	adds r3, 0x1
	cmp r3, 0x3
	ble _0800CBA6
	movs r3, 0
	mov r5, r12
	adds r5, 0x10
	mov r4, r12
	adds r4, 0x20
	ldr r6, _0800CC34 @ =gUnknown_03004290
	mov r2, r12
	adds r2, 0x30
_0800CBC4:
	adds r1, r5, r3
	ldr r7, _0800CC38 @ =gUnknown_030041C0
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	mov r7, r8
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0xF
	ble _0800CBC4
	mov r0, r10
	mov r1, r9
	movs r2, 0x44
	bl dp01_prepare_buffer
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC00: .4byte gUnknown_03004040
_0800CC04: .4byte gUnknown_02024D26
_0800CC08: .4byte gUnknown_02024BE6
_0800CC0C: .4byte gUnknown_02024BE8
_0800CC10: .4byte gUnknown_02024C04
_0800CC14: .4byte byte_2024C06
_0800CC18: .4byte 0x02000000
_0800CC1C: .4byte 0x00016003
_0800CC20: .4byte 0x000160c1
_0800CC24: .4byte gUnknown_02024C0B
_0800CC28: .4byte gBattleMoves
_0800CC2C: .4byte gUnknown_030042B0
_0800CC30: .4byte gBattleMons
_0800CC34: .4byte gUnknown_03004290
_0800CC38: .4byte gUnknown_030041C0
	thumb_func_end dp01_build_cmdbuf_x10_TODO

	thumb_func_start dp01_build_cmdbuf_x11_TODO
dp01_build_cmdbuf_x11_TODO: @ 800CC3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0800CCFC @ =gUnknown_03004040
	movs r0, 0x11
	strb r0, [r2]
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	lsrs r1, 8
	strb r1, [r2, 0x3]
	adds r0, r2, 0x4
	mov r12, r0
	ldr r0, _0800CD00 @ =gUnknown_02024BE6
	ldrh r0, [r0]
	strh r0, [r2, 0x4]
	ldr r0, _0800CD04 @ =gUnknown_02024BE8
	ldrh r0, [r0]
	mov r1, r12
	strh r0, [r1, 0x2]
	ldr r0, _0800CD08 @ =gUnknown_02024C04
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _0800CD0C @ =byte_2024C06
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldr r0, _0800CD10 @ =0x02000000
	ldr r3, _0800CD14 @ =0x00016003
	adds r1, r0, r3
	ldrb r1, [r1]
	mov r7, r12
	strb r1, [r7, 0x7]
	ldr r1, _0800CD18 @ =0x0001605e
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r7, 0x8]
	movs r3, 0
	mov r9, r2
	ldr r7, _0800CD1C @ =gUnknown_030042B0
	mov r8, r7
	mov r4, r9
	adds r4, 0x10
	ldr r0, _0800CD20 @ =gBattleMons
	adds r2, r0, 0
	adds r2, 0x20
_0800CCA2:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x58
	adds r3, 0x1
	cmp r3, 0x3
	ble _0800CCA2
	movs r3, 0
	mov r5, r12
	adds r5, 0x10
	mov r4, r12
	adds r4, 0x20
	ldr r6, _0800CD24 @ =gUnknown_03004290
	mov r2, r12
	adds r2, 0x30
_0800CCC0:
	adds r1, r5, r3
	ldr r7, _0800CD28 @ =gUnknown_030041C0
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	mov r7, r8
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0xF
	ble _0800CCC0
	mov r0, r10
	mov r1, r9
	movs r2, 0x44
	bl dp01_prepare_buffer
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CCFC: .4byte gUnknown_03004040
_0800CD00: .4byte gUnknown_02024BE6
_0800CD04: .4byte gUnknown_02024BE8
_0800CD08: .4byte gUnknown_02024C04
_0800CD0C: .4byte byte_2024C06
_0800CD10: .4byte 0x02000000
_0800CD14: .4byte 0x00016003
_0800CD18: .4byte 0x0001605e
_0800CD1C: .4byte gUnknown_030042B0
_0800CD20: .4byte gBattleMons
_0800CD24: .4byte gUnknown_03004290
_0800CD28: .4byte gUnknown_030041C0
	thumb_func_end dp01_build_cmdbuf_x11_TODO

	thumb_func_start dp01_build_cmdbuf_x12_a_bb
dp01_build_cmdbuf_x12_a_bb: @ 800CD2C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800CD54 @ =gUnknown_03004040
	movs r3, 0x12
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CD54: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x12_a_bb

	thumb_func_start unref_sub_800CB84
unref_sub_800CB84: @ 800CD58
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CD74 @ =gUnknown_03004040
	movs r2, 0x13
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CD74: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CB84

	thumb_func_start sub_800CBA4
sub_800CBA4: @ 800CD78
	push {r4-r6,lr}
	adds r5, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _0800CDB0 @ =gUnknown_03004040
	movs r4, 0
	movs r0, 0x14
	strb r0, [r3]
	strb r1, [r3, 0x1]
	strb r2, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0
	adds r1, r3, 0
	adds r4, r1, 0x4
_0800CD94:
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r4]
	adds r4, 0x1
	adds r2, 0x1
	cmp r2, 0x13
	bls _0800CD94
	adds r0, r6, 0
	movs r2, 0x18
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CDB0: .4byte gUnknown_03004040
	thumb_func_end sub_800CBA4

	thumb_func_start sub_800CBE0
sub_800CBE0: @ 800CDB4
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800CDE4 @ =gUnknown_03004040
	movs r0, 0x15
	strb r0, [r1]
	movs r2, 0
	adds r3, r1, 0x1
_0800CDC6:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800CDC6
	adds r0, r5, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CDE4: .4byte gUnknown_03004040
	thumb_func_end sub_800CBE0

	thumb_func_start dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f: @ 800CDE8
	push {r4-r6,lr}
	ldr r6, [sp, 0x10]
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0800CE20 @ =gUnknown_03004040
	movs r0, 0x16
	strb r0, [r4]
	strb r1, [r4, 0x1]
	strb r2, [r4, 0x2]
	strb r3, [r4, 0x3]
	movs r2, 0
	adds r1, r4, 0
	adds r3, r1, 0x4
_0800CE02:
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800CE02
	adds r0, r5, 0
	movs r2, 0x8
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CE20: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f

	thumb_func_start dp01_build_cmdbuf_x17_17_17_17
dp01_build_cmdbuf_x17_17_17_17: @ 800CE24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CE40 @ =gUnknown_03004040
	movs r2, 0x17
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CE40: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x17_17_17_17

	thumb_func_start dp01_build_cmdbuf_x18_0_aa_health_bar_update
dp01_build_cmdbuf_x18_0_aa_health_bar_update: @ 800CE44
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800CE78 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x18
	strb r2, [r3]
	strb r4, [r3, 0x1]
	strb r1, [r3, 0x2]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0xFF
	lsls r2, 8
	ands r1, r2
	asrs r1, 8
	strb r1, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CE78: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x18_0_aa_health_bar_update

	thumb_func_start dp01_build_cmdbuf_x19_a_bb
dp01_build_cmdbuf_x19_a_bb: @ 800CE7C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800CEAC @ =gUnknown_03004040
	movs r3, 0x19
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0xFF
	lsls r3, 8
	ands r2, r3
	asrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CEAC: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x19_a_bb

	thumb_func_start dp01_build_cmdbuf_x1A_aaaa_bbbb
dp01_build_cmdbuf_x1A_aaaa_bbbb: @ 800CEB0
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CF00 @ =gUnknown_03004040
	movs r3, 0x1A
	strb r3, [r1]
	strb r4, [r1, 0x1]
	movs r6, 0xFF
	lsls r6, 8
	adds r3, r4, 0
	ands r3, r6
	lsrs r3, 8
	strb r3, [r1, 0x2]
	movs r5, 0xFF
	lsls r5, 16
	adds r3, r4, 0
	ands r3, r5
	lsrs r3, 16
	strb r3, [r1, 0x3]
	lsrs r4, 24
	strb r4, [r1, 0x4]
	strb r2, [r1, 0x5]
	adds r3, r2, 0
	ands r3, r6
	lsrs r3, 8
	strb r3, [r1, 0x6]
	adds r3, r2, 0
	ands r3, r5
	lsrs r3, 16
	strb r3, [r1, 0x7]
	lsrs r2, 24
	strb r2, [r1, 0x8]
	movs r2, 0x9
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF00: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1A_aaaa_bbbb

	thumb_func_start dp01_build_cmdbuf_x1B_aaaa_b
dp01_build_cmdbuf_x1B_aaaa_b: @ 800CF04
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CF3C @ =gUnknown_03004040
	movs r3, 0x1B
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r3, 0xFF
	lsls r3, 8
	ands r3, r2
	lsrs r3, 8
	strb r3, [r1, 0x3]
	movs r3, 0xFF
	lsls r3, 16
	ands r3, r2
	lsrs r3, 16
	strb r3, [r1, 0x4]
	lsrs r2, 24
	strb r2, [r1, 0x5]
	movs r2, 0x6
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF3C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1B_aaaa_b

	thumb_func_start dp01_build_cmdbuf_x1C_a
dp01_build_cmdbuf_x1C_a: @ 800CF40
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CF5C @ =gUnknown_03004040
	movs r2, 0x1C
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CF5C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1C_a

	thumb_func_start dp01_build_cmdbuf_x1D_1D_numargs_varargs
dp01_build_cmdbuf_x1D_1D_numargs_varargs: @ 800CF60
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800CFA4 @ =gUnknown_03004040
	movs r0, 0x1D
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800CF90
	adds r1, r5, 0x4
	adds r3, r4, 0
_0800CF82:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800CF82
_0800CF90:
	adds r2, r4, 0x4
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CFA4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1D_1D_numargs_varargs

	thumb_func_start unref_sub_800CDD4
unref_sub_800CDD4: @ 800CFA8
	push {r4-r6,lr}
	adds r4, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 16
	lsrs r5, r2, 16
	ldr r2, _0800D00C @ =gUnknown_03004040
	movs r0, 0x1E
	strb r0, [r2]
	strb r1, [r2, 0x1]
	movs r3, 0xFF
	lsls r3, 8
	adds r0, r1, 0
	ands r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r2, 0x3]
	lsrs r1, 24
	strb r1, [r2, 0x4]
	strb r5, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x6]
	adds r1, r2, 0
	cmp r5, 0
	beq _0800CFF8
	adds r3, r1, 0x7
	adds r2, r5, 0
_0800CFEA:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, 0x1
	adds r3, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800CFEA
_0800CFF8:
	adds r2, r5, 0x7
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D00C: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CDD4

	thumb_func_start unref_sub_800CE3C
unref_sub_800CE3C: @ 800D010
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800D054 @ =gUnknown_03004040
	movs r0, 0x1F
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsrs r0, r4, 8
	strb r0, [r1, 0x2]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800D03E
	adds r1, r5, 0x3
	adds r3, r4, 0
_0800D030:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800D030
_0800D03E:
	adds r2, r4, 0x3
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D054: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CE3C

	thumb_func_start unref_sub_800CE84
unref_sub_800CE84: @ 800D058
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800D09C @ =gUnknown_03004040
	movs r0, 0x20
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsrs r0, r4, 8
	strb r0, [r1, 0x2]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800D086
	adds r1, r5, 0x3
	adds r3, r4, 0
_0800D078:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800D078
_0800D086:
	adds r2, r4, 0x3
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D09C: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CE84

	thumb_func_start dp01_build_cmdbuf_x21_a_bb
dp01_build_cmdbuf_x21_a_bb: @ 800D0A0
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800D0C8 @ =gUnknown_03004040
	movs r3, 0x21
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D0C8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x21_a_bb

	thumb_func_start dp01_build_cmdbuf_x22_a_three_bytes
dp01_build_cmdbuf_x22_a_three_bytes: @ 800D0CC
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0800D100 @ =gUnknown_03004040
	movs r0, 0x22
	strb r0, [r2]
	strb r1, [r2, 0x1]
	movs r3, 0
	adds r1, r2, 0x2
_0800D0E0:
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _0800D0E0
	adds r0, r5, 0
	adds r1, r2, 0
	movs r2, 0x5
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D100: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x22_a_three_bytes

	thumb_func_start dp01_build_cmdbuf_x23_aa_0
dp01_build_cmdbuf_x23_aa_0: @ 800D104
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800D12C @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x23
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D12C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x23_aa_0

	thumb_func_start dp01_build_cmdbuf_x24_aa_0
dp01_build_cmdbuf_x24_aa_0: @ 800D130
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800D158 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x24
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D158: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x24_aa_0

	thumb_func_start dp01_build_cmdbuf_x25_25_25_25
dp01_build_cmdbuf_x25_25_25_25: @ 800D15C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D178 @ =gUnknown_03004040
	movs r2, 0x25
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D178: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x25_25_25_25

	thumb_func_start dp01_build_cmdbuf_x26_a
dp01_build_cmdbuf_x26_a: @ 800D17C
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D198 @ =gUnknown_03004040
	movs r2, 0x26
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D198: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x26_a

	thumb_func_start dp01_build_cmdbuf_x27_27_27_27
dp01_build_cmdbuf_x27_27_27_27: @ 800D19C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D1B8 @ =gUnknown_03004040
	movs r2, 0x27
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D1B8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x27_27_27_27

	thumb_func_start dp01_build_cmdbuf_x28_28_28_28
dp01_build_cmdbuf_x28_28_28_28: @ 800D1BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D1D8 @ =gUnknown_03004040
	movs r2, 0x28
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D1D8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x28_28_28_28

	thumb_func_start dp01_build_cmdbuf_x29_29_29_29
dp01_build_cmdbuf_x29_29_29_29: @ 800D1DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D1F8 @ =gUnknown_03004040
	movs r2, 0x29
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D1F8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x29_29_29_29

	thumb_func_start dp01_build_cmdbuf_x2A_2A_2A_2A
dp01_build_cmdbuf_x2A_2A_2A_2A: @ 800D1FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D218 @ =gUnknown_03004040
	movs r2, 0x2A
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D218: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2A_2A_2A_2A

	thumb_func_start dp01_build_cmdbuf_x2B_aa_0
dp01_build_cmdbuf_x2B_aa_0: @ 800D21C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800D244 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x2B
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D244: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2B_aa_0

	thumb_func_start sub_800D074
sub_800D074: @ 800D248
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800D270 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x2C
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D270: .4byte gUnknown_03004040
	thumb_func_end sub_800D074

	thumb_func_start dp01_build_cmdbuf_x2D_2D_2D_2D
dp01_build_cmdbuf_x2D_2D_2D_2D: @ 800D274
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D290 @ =gUnknown_03004040
	movs r2, 0x2D
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D290: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2D_2D_2D_2D

	thumb_func_start dp01_build_cmdbuf_x2E_a
dp01_build_cmdbuf_x2E_a: @ 800D294
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D2B0 @ =gUnknown_03004040
	movs r2, 0x2E
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D2B0: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2E_a

	thumb_func_start dp01_build_cmdbuf_x2F_2F_2F_2F
dp01_build_cmdbuf_x2F_2F_2F_2F: @ 800D2B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D2D0 @ =gUnknown_03004040
	movs r2, 0x2F
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D2D0: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2F_2F_2F_2F

	thumb_func_start dp01_build_cmdbuf_x30_TODO
dp01_build_cmdbuf_x30_TODO: @ 800D2D4
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0800D318 @ =gUnknown_03004040
	movs r3, 0x30
	strb r3, [r1]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x80
	ands r0, r2
	lsls r0, 24
	lsrs r0, 31
	strb r0, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0
	adds r3, r1, 0x4
_0800D2FC:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2F
	ble _0800D2FC
	adds r0, r5, 0
	movs r2, 0x34
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D318: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x30_TODO

	thumb_func_start dp01_build_cmdbuf_x31_31_31_31
dp01_build_cmdbuf_x31_31_31_31: @ 800D31C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D338 @ =gUnknown_03004040
	movs r2, 0x31
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D338: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x31_31_31_31

	thumb_func_start dp01_build_cmdbuf_x32_32_32_32
dp01_build_cmdbuf_x32_32_32_32: @ 800D33C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D358 @ =gUnknown_03004040
	movs r2, 0x32
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D358: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x32_32_32_32

	thumb_func_start dp01_build_cmdbuf_x33_a_33_33
dp01_build_cmdbuf_x33_a_33_33: @ 800D35C
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D37C @ =gUnknown_03004040
	movs r2, 0x33
	strb r2, [r1]
	strb r3, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D37C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x33_a_33_33

	thumb_func_start dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
dp01_build_cmdbuf_x34_a_bb_aka_battle_anim: @ 800D380
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800D3A8 @ =gUnknown_03004040
	movs r3, 0x34
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D3A8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x34_a_bb_aka_battle_anim

	thumb_func_start sub_800D1D8
sub_800D1D8: @ 800D3AC
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D3C8 @ =gUnknown_03004040
	movs r2, 0x35
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D3C8: .4byte gUnknown_03004040
	thumb_func_end sub_800D1D8

	thumb_func_start dp01_build_cmdbuf_x38_a
dp01_build_cmdbuf_x38_a: @ 800D3CC
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D3E8 @ =gUnknown_03004040
	movs r2, 0x36
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D3E8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x38_a

	thumb_func_start dp01_build_cmdbuf_x37_a
dp01_build_cmdbuf_x37_a: @ 800D3EC
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D408 @ =gUnknown_03004040
	movs r2, 0x37
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D408: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x37_a

	.align 2, 0 @ Don't pad with nop.
