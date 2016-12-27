	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_8094928
unref_sub_8094928: @ 8094A78
	push {lr}
	ldr r1, _08094A88
	ldr r2, _08094A8C
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_08094A88: .4byte gPokemonStorage
_08094A8C: .4byte 0x000083d0
	thumb_func_end unref_sub_8094928

	thumb_func_start unref_sub_8094940
unref_sub_8094940: @ 8094A90
	push {lr}
	adds r1, r0, 0
	ldr r0, _08094AA0
	ldr r2, _08094AA4
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_08094AA0: .4byte gPokemonStorage
_08094AA4: .4byte 0x000083d0
	thumb_func_end unref_sub_8094940

	thumb_func_start sub_8094958
sub_8094958: @ 8094AA8
	push {r4,lr}
	ldr r4, _08094AC4
	bl sub_803FBBC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8094998
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094AC4: .4byte gUnknown_02038470
	thumb_func_end sub_8094958

	thumb_func_start sub_8094978
sub_8094978: @ 8094AC8
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r2, 1
	adds r0, r2
	ldr r3, _08094AE4
	adds r0, r3
	bl sub_8094A74
	pop {r0}
	bx r0
	.align 2, 0
_08094AE4: .4byte 0x0201606c
	thumb_func_end sub_8094978

	thumb_func_start sub_8094998
sub_8094998: @ 8094AE8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08094B1E
	cmp r4, 0
	beq _08094B10
	movs r0, 0x30
	strb r0, [r6]
	movs r0, 0x45
	strb r0, [r6, 0x1]
	movs r0, 0x12
	strb r0, [r6, 0x2]
	b _08094BB8
_08094B10:
	movs r0, 0x3
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x45
	strb r0, [r6, 0x2]
	b _08094BB8
_08094B1E:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08094B5C
	movs r5, 0x1
	movs r0, 0
	bl battle_get_side_with_given_state
	mov r2, sp
	ldr r1, _08094B58
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08094B42:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094B50
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08094B50:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094B42
	b _08094BA0
	.align 2, 0
_08094B58: .4byte gUnknown_02024A6A
_08094B5C:
	movs r5, 0x2
	movs r0, 0
	bl battle_get_side_with_given_state
	mov r1, sp
	ldr r4, _08094BC0
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1]
	movs r0, 0x2
	bl battle_get_side_with_given_state
	mov r1, sp
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08094B86:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094B9A
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08094B9A
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08094B9A:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094B86
_08094BA0:
	movs r4, 0
	mov r3, sp
_08094BA4:
	adds r0, r6, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08094BA4
_08094BB8:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094BC0: .4byte gUnknown_02024A6A
	thumb_func_end sub_8094998

	thumb_func_start sub_8094A74
sub_8094A74: @ 8094BC4
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r0, r2, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08094BEC
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	b _08094BF8
_08094BEC:
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
_08094BF8:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08094C2C
	cmp r7, 0
	beq _08094C1E
	movs r0, 0x30
	strb r0, [r5]
	movs r0, 0x45
	strb r0, [r5, 0x1]
	movs r0, 0x12
	strb r0, [r5, 0x2]
	b _08094CAE
_08094C1E:
	movs r0, 0x3
	strb r0, [r5]
	movs r0, 0x12
	strb r0, [r5, 0x1]
	movs r0, 0x45
	strb r0, [r5, 0x2]
	b _08094CAE
_08094C2C:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08094C64
	movs r3, 0x1
	mov r2, sp
	ldr r1, _08094C60
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08094C48:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094C56
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08094C56:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094C48
	b _08094C96
	.align 2, 0
_08094C60: .4byte gUnknown_02024A6A
_08094C64:
	movs r3, 0x2
	mov r1, sp
	ldr r2, _08094CB8
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	lsls r0, r6, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08094C7C:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094C90
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08094C90
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08094C90:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094C7C
_08094C96:
	movs r4, 0
	mov r3, sp
_08094C9A:
	adds r0, r5, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08094C9A
_08094CAE:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094CB8: .4byte gUnknown_02024A6A
	thumb_func_end sub_8094A74

	thumb_func_start sub_8094B6C
sub_8094B6C: @ 8094CBC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	bl sub_806B528
	lsls r0, 24
	cmp r0, 0
	beq _08094D66
	lsls r0, r4, 1
	adds r0, r4
	ldr r1, _08094D1C
	adds r4, r0, r1
	movs r2, 0
	add r6, sp
	mov r12, r6
	movs r6, 0xF
	mov r3, sp
_08094CEA:
	adds r1, r4, r2
	ldrb r0, [r1]
	lsrs r0, 4
	strb r0, [r3]
	adds r3, 0x1
	ldrb r1, [r1]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _08094CEA
	mov r0, r12
	ldrb r3, [r0]
	movs r2, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, r5
	bne _08094D20
	mov r0, sp
	ldrb r7, [r0]
	strb r3, [r0]
	b _08094D34
	.align 2, 0
_08094D1C: .4byte 0x0201606c
_08094D20:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _08094D34
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _08094D20
	adds r7, r0, 0
	strb r3, [r1]
_08094D34:
	cmp r2, 0x6
	beq _08094D66
	mov r0, r12
	strb r7, [r0]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x1]
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	strb r0, [r4, 0x1]
	mov r0, sp
	ldrb r0, [r0, 0x4]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x5]
	orrs r0, r1
	strb r0, [r4, 0x2]
_08094D66:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8094B6C

	thumb_func_start sub_8094C20
sub_8094C20: @ 8094D70
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	ands r1, r2
	lsrs r2, r0, 25
	cmp r1, 0
	beq _08094D90
	ldr r0, _08094D8C
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	b _08094D98
	.align 2, 0
_08094D8C: .4byte gUnknown_02038470
_08094D90:
	ldr r0, _08094DA0
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r1, r0, 4
_08094D98:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08094DA0: .4byte gUnknown_02038470
	thumb_func_end sub_8094C20

	thumb_func_start sub_8094C54
sub_8094C54: @ 8094DA4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r1, 0x1
	ands r1, r3
	lsrs r3, r0, 25
	cmp r1, 0
	beq _08094DCC
	ldr r0, _08094DC8
	adds r0, r3, r0
	ldrb r2, [r0]
	movs r1, 0xF0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	b _08094DDC
	.align 2, 0
_08094DC8: .4byte gUnknown_02038470
_08094DCC:
	ldr r2, _08094DE4
	adds r2, r3, r2
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	lsls r1, r4, 4
	orrs r0, r1
	strb r0, [r2]
_08094DDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094DE4: .4byte gUnknown_02038470
	thumb_func_end sub_8094C54

	thumb_func_start sub_8094C98
sub_8094C98: @ 8094DE8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	bl sub_8094C20
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8094C20
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8094C54
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8094C54
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8094C98

	thumb_func_start pokemon_order_func
pokemon_order_func: @ 8094E24
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	movs r2, 0
	ldr r5, _08094E4C
_08094E30:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsrs r0, r1, 4
	cmp r0, r4
	beq _08094E48
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xF
	ands r0, r1
	cmp r0, r4
	bne _08094E50
_08094E48:
	adds r0, r2, 0
	b _08094E62
	.align 2, 0
_08094E4C: .4byte gUnknown_02038470
_08094E50:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08094E30
	movs r0, 0
_08094E62:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end pokemon_order_func

	thumb_func_start pokemon_change_order
pokemon_change_order: @ 8094E68
	push {r4,r5,lr}
	ldr r0, _08094EA8
	ldr r1, _08094EAC
	movs r2, 0x96
	lsls r2, 2
	bl memcpy
	movs r4, 0
	movs r5, 0x64
_08094E7A:
	adds r0, r4, 0
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	ldr r1, _08094EAC
	adds r0, r1
	adds r1, r4, 0
	muls r1, r5
	ldr r2, _08094EA8
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08094E7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094EA8: .4byte 0x0201b000
_08094EAC: .4byte gPlayerParty
	thumb_func_end pokemon_change_order

	thumb_func_start sub_8094D60
sub_8094D60: @ 8094EB0
	push {r4,r5,lr}
	ldr r4, _08094EF8
	add sp, r4
	ldr r1, _08094EFC
	movs r2, 0x96
	lsls r2, 2
	mov r0, sp
	bl memcpy
	movs r4, 0
	movs r5, 0x64
_08094EC6:
	adds r0, r4, 0
	bl sub_8094C20
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	ldr r1, _08094EFC
	adds r0, r1
	adds r1, r4, 0
	muls r1, r5
	add r1, sp
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08094EC6
	movs r3, 0x96
	lsls r3, 2
	add sp, r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094EF8: .4byte 0xfffffda8
_08094EFC: .4byte gPlayerParty
	thumb_func_end sub_8094D60

	thumb_func_start unref_sub_8094DB0
unref_sub_8094DB0: @ 8094F00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	movs r7, 0x64
	ldr r0, _08094F58
	mov r8, r0
_08094F0E:
	adds r0, r6, 0
	bl sub_8094C20
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08094F5C
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08094F5C
	movs r0, 0
	bl sub_8094C20
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	adds r1, r6, 0
	bl sub_8094C98
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r5, 0
	bl sub_806E6F0
	b _08094F66
	.align 2, 0
_08094F58: .4byte gPlayerParty
_08094F5C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _08094F0E
_08094F66:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8094DB0

	thumb_func_start sub_8094E20
sub_8094E20: @ 8094F70
	push {lr}
	ldr r3, _08094F94
	ldrb r1, [r3, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r3, 0x8]
	ldr r1, _08094F98
	strb r0, [r1]
	bl nullsub_14
	bl pokemon_change_order
	movs r0, 0x1
	movs r1, 0xFF
	bl OpenPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_08094F94: .4byte gPaletteFade
_08094F98: .4byte gUnknown_02038473
	thumb_func_end sub_8094E20

	thumb_func_start sub_8094E4C
sub_8094E4C: @ 8094F9C
	push {lr}
	movs r0, 0x3
	bl sub_8094E20
	pop {r0}
	bx r0
	thumb_func_end sub_8094E4C

	thumb_func_start sub_8094E58
sub_8094E58: @ 8094FA8
	push {r4,r5,lr}
	ldr r1, _08094FC8
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	adds r4, r1, 0
	cmp r0, 0xA
	bls _08094FBE
	b _08095198
_08094FBE:
	lsls r0, 2
	ldr r1, _08094FCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08094FC8: .4byte 0x0201b000
_08094FCC: .4byte _08094FD0
	.align 2, 0
_08094FD0:
	.4byte _08094FFC
	.4byte _08095078
	.4byte _0809508C
	.4byte _0809509A
	.4byte _080950BC
	.4byte _080950D0
	.4byte _080950E4
	.4byte _080950F8
	.4byte _0809510C
	.4byte _08095120
	.4byte _08095150
_08094FFC:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809502C
	ldr r1, _08095024
	ldr r0, _08095028
	adds r4, r1, r0
	ldrh r2, [r4]
	movs r3, 0
	ldrsh r0, [r4, r3]
	cmp r0, 0x6
	bne _0809503C
	movs r0, 0
	strh r0, [r4]
	movs r3, 0x99
	lsls r3, 2
	adds r1, r3
	b _0809513C
	.align 2, 0
_08095024: .4byte 0x0201b000
_08095028: .4byte 0x00000266
_0809502C:
	ldr r1, _08095060
	ldr r0, _08095064
	adds r4, r1, r0
	ldrh r2, [r4]
	movs r3, 0
	ldrsh r0, [r4, r3]
	cmp r0, 0x5
	bgt _0809506C
_0809503C:
	movs r3, 0x98
	lsls r3, 2
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0
	ldrsh r3, [r4, r2]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _08095068
	adds r2, r3
	bl sub_806D90C
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08095198
	.align 2, 0
_08095060: .4byte 0x0201b000
_08095064: .4byte 0x00000266
_08095068: .4byte gPlayerParty
_0809506C:
	movs r0, 0
	strh r0, [r4]
	movs r3, 0x99
	lsls r3, 2
	adds r1, r3
	b _0809513C
_08095078:
	bl sub_806DA98
	ldr r1, _08095088
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0809513C
	.align 2, 0
_08095088: .4byte 0x0201b000
_0809508C:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	b _08095136
_0809509A:
	movs r3, 0x98
	lsls r3, 2
	adds r0, r4, r3
	ldrb r0, [r0]
	ldr r1, _080950B8
	adds r5, r4, r1
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08095132
	b _08095148
	.align 2, 0
_080950B8: .4byte 0x00000266
_080950BC:
	bl sub_806E334
	ldr r1, _080950CC
	movs r3, 0x99
	lsls r3, 2
	adds r1, r3
	b _0809513C
	.align 2, 0
_080950CC: .4byte 0x0201b000
_080950D0:
	bl sub_806E0C4
	ldr r1, _080950E0
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0809513C
	.align 2, 0
_080950E0: .4byte 0x0201b000
_080950E4:
	bl sub_806E53C
	ldr r1, _080950F4
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
	b _0809513C
	.align 2, 0
_080950F4: .4byte 0x0201b000
_080950F8:
	bl nullsub_13
	ldr r1, _08095108
	movs r3, 0x99
	lsls r3, 2
	adds r1, r3
	b _0809513C
	.align 2, 0
_08095108: .4byte 0x0201b000
_0809510C:
	bl sub_806E6C8
	ldr r1, _0809511C
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0809513C
	.align 2, 0
_0809511C: .4byte 0x0201b000
_08095120:
	ldr r1, _08095144
	adds r5, r4, r1
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08095148
_08095132:
	movs r0, 0
	strh r0, [r5]
_08095136:
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
_0809513C:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08095198
	.align 2, 0
_08095144: .4byte 0x00000266
_08095148:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _08095198
_08095150:
	ldr r0, _08095174
	ldrb r4, [r0]
	cmp r4, 0x3
	bne _0809518C
	ldr r0, _08095178
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bne _08095184
	ldr r0, _0809517C
	ldr r3, _08095180
	adds r0, r3
	movs r1, 0xFF
	strb r1, [r0]
	b _0809518C
	.align 2, 0
_08095174: .4byte gUnknown_02038473
_08095178: .4byte gScriptItemId
_0809517C: .4byte 0x0201b000
_08095180: .4byte 0x00000259
_08095184:
	ldr r0, _08095190
	ldr r1, _08095194
	adds r0, r1
	strb r4, [r0]
_0809518C:
	movs r0, 0x1
	b _0809519A
	.align 2, 0
_08095190: .4byte 0x0201b000
_08095194: .4byte 0x00000259
_08095198:
	movs r0, 0
_0809519A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8094E58

	thumb_func_start sub_8095050
sub_8095050: @ 80951A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080951DC
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	adds r5, r0, 0
	cmp r5, 0
	bne _08095218
	ldr r0, _080951E0
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _080951EC
	ldr r3, _080951E4
	ldr r2, _080951E8
	movs r0, 0x98
	lsls r0, 2
	adds r2, r0
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	b _0809522E
	.align 2, 0
_080951DC: .4byte gPlayerParty
_080951E0: .4byte gUnknown_02038473
_080951E4: .4byte gTasks
_080951E8: .4byte 0x0201b000
_080951EC:
	ldr r3, _08095210
	ldr r2, _08095214
	movs r0, 0x98
	lsls r0, 2
	adds r2, r0
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r5, [r0, 0x10]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r5, [r0, 0x12]
	b _0809523C
	.align 2, 0
_08095210: .4byte gTasks
_08095214: .4byte 0x0201b000
_08095218:
	ldr r3, _08095258
	ldr r2, _0809525C
	movs r0, 0x98
	lsls r0, 2
	adds r2, r0
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r4, 0x2
_0809522E:
	strh r4, [r0, 0x10]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r4, [r0, 0x12]
_0809523C:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x10]
	ldr r1, _08095260
	ldr r2, _08095264
	movs r3, 0
	bl sub_806E750
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095258: .4byte gTasks
_0809525C: .4byte 0x0201b000
_08095260: .4byte gUnknown_083B5FF4
_08095264: .4byte gUnknown_083B5FCC
	thumb_func_end sub_8095050

	thumb_func_start sub_8095118
sub_8095118: @ 8095268
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080952A0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809527C
	b _080953B8
_0809527C:
	ldr r0, _080952A4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _080952B4
	ldr r5, _080952A8
	ldrh r0, [r5]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	bne _080952B4
	ldr r0, _080952AC
	ldrh r1, [r5]
	ldr r2, _080952B0
	ldr r3, [r0]
	b _080952FA
	.align 2, 0
_080952A0: .4byte gPaletteFade
_080952A4: .4byte gUnknown_02038473
_080952A8: .4byte gScriptItemId
_080952AC: .4byte gUnknown_03004AE4
_080952B0: .4byte sub_80952E4
_080952B4:
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080952C8
	cmp r0, 0x2
	beq _08095364
	b _080953B8
_080952C8:
	ldr r0, _08095304
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08095318
	adds r0, r4, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08095308
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809536C
	bl sub_806D5A4
	ldr r3, _0809530C
	ldr r0, _08095310
	ldrh r1, [r0]
	ldr r2, _08095314
	ldr r3, [r3]
_080952FA:
	adds r0, r4, 0
	bl _call_via_r3
	b _080953B8
	.align 2, 0
_08095304: .4byte gUnknown_02038473
_08095308: .4byte gPlayerParty
_0809530C: .4byte gUnknown_03004AE4
_08095310: .4byte gScriptItemId
_08095314: .4byte sub_80952E4
_08095318:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08095354
	adds r0, r1
	ldr r1, _08095358
	bl GetMonNickname
	adds r0, r4, 0
	bl sub_806CA38
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8095050
	ldr r1, _0809535C
	ldr r2, _08095360
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	b _080953B8
	.align 2, 0
_08095354: .4byte gPlayerParty
_08095358: .4byte gStringVar1
_0809535C: .4byte sub_8095408
_08095360: .4byte sub_8095118
_08095364:
	ldr r5, _08095374
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _08095378
_0809536C:
	movs r0, 0x20
	bl PlaySE
	b _080953B8
	.align 2, 0
_08095374: .4byte gUnknown_02038473
_08095378:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r5]
	cmp r0, 0x3
	bne _080953A4
	ldr r1, _08095398
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0809539C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080953A0
	b _080953B6
	.align 2, 0
_08095398: .4byte gUnknown_0202E8F4
_0809539C: .4byte gTasks
_080953A0: .4byte sub_80952E4
_080953A4:
	ldr r1, _080953C0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080953C4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080953C8
_080953B6:
	str r1, [r0]
_080953B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080953C0: .4byte gUnknown_0202E8F4
_080953C4: .4byte gTasks
_080953C8: .4byte sub_809527C
	thumb_func_end sub_8095118

	thumb_func_start sub_809527C
sub_809527C: @ 80953CC
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
	ldr r1, _080953FC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08095400
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080953FC: .4byte gTasks
_08095400: .4byte sub_80952B4
	thumb_func_end sub_809527C

	thumb_func_start sub_80952B4
sub_80952B4: @ 8095404
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809542C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08095426
	bl sub_8094D60
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08095430
	bl SetMainCallback2
_08095426:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809542C: .4byte gPaletteFade
_08095430: .4byte sub_802E414
	thumb_func_end sub_80952B4

	thumb_func_start sub_80952E4
sub_80952E4: @ 8095434
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809544C
	ldrb r1, [r0]
	cmp r1, 0
	beq _08095450
	adds r0, r4, 0
	bl sub_809527C
	b _0809546E
	.align 2, 0
_0809544C: .4byte gUnknown_0202E8F4
_08095450:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08095478
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809547C
	str r1, [r0]
_0809546E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095478: .4byte gTasks
_0809547C: .4byte sub_8095330
	thumb_func_end sub_80952E4

	thumb_func_start sub_8095330
sub_8095330: @ 8095480
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080954A8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080954A0
	bl sub_8094D60
	adds r0, r4, 0
	bl DestroyTask
	bl sub_80A6DCC
_080954A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080954A8: .4byte gPaletteFade
	thumb_func_end sub_8095330

	thumb_func_start sub_809535C
sub_809535C: @ 80954AC
	push {lr}
	ldr r2, _080954D0
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _080954D4
	movs r0, 0x1
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _080954D8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080954D0: .4byte gPaletteFade
_080954D4: .4byte sub_8095118
_080954D8: .4byte sub_809538C
	thumb_func_end sub_809535C

	thumb_func_start sub_809538C
sub_809538C: @ 80954DC
	push {r4,r5,lr}
	ldr r4, _08095528
	ldr r5, _0809552C
_080954E2:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08095544
	ldrb r0, [r4]
	ldrb r1, [r5]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08095530
	adds r0, r1
	ldr r1, _08095534
	bl GetMonNickname
	ldrb r0, [r4]
	ldrb r1, [r5]
	bl sub_8095050
	ldrb r0, [r4]
	ldr r1, _08095538
	ldr r2, _0809553C
	bl SetTaskFuncWithFollowupFunc
	ldr r0, _08095540
	bl SetMainCallback2
	b _08095550
	.align 2, 0
_08095528: .4byte 0x0201b260
_0809552C: .4byte gUnknown_020384F0
_08095530: .4byte gPlayerParty
_08095534: .4byte gStringVar1
_08095538: .4byte sub_8095408
_0809553C: .4byte sub_8095118
_08095540: .4byte sub_806AEDC
_08095544:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080954E2
_08095550:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_809538C

	thumb_func_start sub_8095408
sub_8095408: @ 8095558
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, r7, 0
	ldr r0, _0809558C
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08095608
	ldr r2, _08095590
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08095594
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08095608
	.align 2, 0
_0809558C: .4byte gPaletteFade
_08095590: .4byte gMain
_08095594:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080955AA
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08095608
_080955AA:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080955F4
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080955E8
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0x10]
	ldr r5, _080955EC
	ldr r6, _080955F0
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
	b _08095608
	.align 2, 0
_080955E8: .4byte gTasks
_080955EC: .4byte gUnknown_083B5FF4
_080955F0: .4byte gUnknown_083B5FCC
_080955F4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08095608
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80958C4
_08095608:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8095408

	thumb_func_start sub_80954C0
sub_80954C0: @ 8095610
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08095628
	ldrb r0, [r0]
	cmp r0, 0
	bne _08095624
	adds r0, r1, 0
	bl sub_80958C4
_08095624:
	pop {r0}
	bx r0
	.align 2, 0
_08095628: .4byte gUnknown_0202E8F6
	thumb_func_end sub_80954C0

	thumb_func_start sub_80954DC
sub_80954DC: @ 809562C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0809567C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08095672
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08095680
	ldr r1, _08095684
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08095688
	ldr r1, _0809568C
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08095690
	movs r1, 0x4
	str r1, [sp]
	adds r1, r5, 0
	bl sub_809D8BC
_08095672:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809567C: .4byte gPaletteFade
_08095680: .4byte 0x0201b000
_08095684: .4byte 0x00000262
_08095688: .4byte gPlayerParty
_0809568C: .4byte gPlayerPartyCount
_08095690: .4byte sub_809535C
	thumb_func_end sub_80954DC

	thumb_func_start sub_8095544
sub_8095544: @ 8095694
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _080956CC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080956D0
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080956CC: .4byte gTasks
_080956D0: .4byte sub_80954DC
	thumb_func_end sub_8095544

	thumb_func_start sub_8095584
sub_8095584: @ 80956D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08095748
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x10]
	ldr r1, _0809574C
	bl sub_806E7D0
	adds r0, r6, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08095760
	cmp r5, 0x1
	beq _08095716
	cmp r5, 0x4
	beq _08095716
	cmp r5, 0x5
	bne _08095760
_08095716:
	bl sub_806D5A4
	ldr r4, _08095750
	bl sub_8040D08
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _08095754
	ldr r1, _08095758
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r1, _08095748
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809575C
	b _080959EA
	.align 2, 0
_08095748: .4byte gTasks
_0809574C: .4byte gUnknown_083B5FF4
_08095750: .4byte gStringVar1
_08095754: .4byte gStringVar4
_08095758: .4byte gOtherText_CantSwitchPokeWithYours
_0809575C: .4byte sub_80954C0
_08095760:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080957A4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080957BC
	bl sub_806D5A4
	ldr r1, _080957A8
	adds r0, r4, 0
	bl GetMonNickname
	ldr r4, _080957AC
	ldr r1, _080957B0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r1, _080957B4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080957B8
	b _080959EA
	.align 2, 0
_080957A4: .4byte gPlayerParty
_080957A8: .4byte gStringVar1
_080957AC: .4byte gStringVar4
_080957B0: .4byte gOtherText_NoEnergyLeft
_080957B4: .4byte gTasks
_080957B8: .4byte sub_80954C0
_080957BC:
	movs r4, 0
	ldr r0, _080957C8
	lsls r1, r6, 2
	mov r8, r1
	b _080957F8
	.align 2, 0
_080957C8: .4byte gUnknown_02024A68
_080957CC:
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080957F0
	adds r0, r5, 0
	bl sub_8094C20
	lsls r0, 24
	ldr r2, _0809583C
	lsls r1, r4, 1
	adds r1, r2
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	bne _080957F0
	b _08095958
_080957F0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08095840
_080957F8:
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080957CC
	movs r2, 0x64
	mov r9, r2
	mov r0, r9
	muls r0, r5
	ldr r1, _08095844
	mov r10, r1
	adds r7, r0, r1
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08095858
	bl sub_806D5A4
	ldr r4, _08095848
	ldr r1, _0809584C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r1, _08095850
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08095854
	b _080959EA
	.align 2, 0
_0809583C: .4byte gUnknown_02024A6A
_08095840: .4byte gUnknown_02024A68
_08095844: .4byte gPlayerParty
_08095848: .4byte gStringVar4
_0809584C: .4byte gOtherText_EGGCantBattle
_08095850: .4byte gTasks
_08095854: .4byte sub_80954C0
_08095858:
	adds r0, r5, 0
	bl sub_8094C20
	ldr r1, _0809589C
	ldr r2, _080958A0
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _080958B8
	bl sub_806D5A4
	ldr r1, _080958A4
	adds r0, r7, 0
	bl GetMonNickname
	ldr r4, _080958A8
	ldr r1, _080958AC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r1, _080958B0
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080958B4
	b _080959EA
	.align 2, 0
_0809589C: .4byte 0x02000000
_080958A0: .4byte 0x0001609d
_080958A4: .4byte gStringVar1
_080958A8: .4byte gStringVar4
_080958AC: .4byte gOtherText_AlreadySelected
_080958B0: .4byte gTasks
_080958B4: .4byte sub_80954C0
_080958B8:
	ldr r0, _080958E0
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _080958F0
	bl sub_806D5A4
	bl sub_8040B8C
	ldr r0, _080958E4
	movs r1, 0
	bl sub_806E834
	ldr r1, _080958E8
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080958EC
	b _080959EA
	.align 2, 0
_080958E0: .4byte gUnknown_02038473
_080958E4: .4byte gStringVar4
_080958E8: .4byte gTasks
_080958EC: .4byte sub_80954C0
_080958F0:
	cmp r0, 0x2
	bne _080959A4
	ldr r0, _0809593C
	ldrb r4, [r0]
	bl sub_806D5A4
	ldr r0, _08095940
	lsls r4, 1
	adds r4, r0
	ldrb r0, [r4]
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r10
	ldr r1, _08095944
	bl GetMonNickname
	ldr r4, _08095948
	ldr r1, _0809594C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r1, _08095950
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08095954
	b _080959EA
	.align 2, 0
_0809593C: .4byte gUnknown_02024E6C
_08095940: .4byte gUnknown_02024A6A
_08095944: .4byte gStringVar1
_08095948: .4byte gStringVar4
_0809594C: .4byte gOtherText_CantBeSwitched
_08095950: .4byte gTasks
_08095954: .4byte sub_80954C0
_08095958:
	bl sub_806D5A4
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0809598C
	adds r0, r1
	ldr r1, _08095990
	bl GetMonNickname
	ldr r4, _08095994
	ldr r1, _08095998
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r1, _0809599C
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080959A0
	b _080959EA
	.align 2, 0
_0809598C: .4byte gPlayerParty
_08095990: .4byte gStringVar1
_08095994: .4byte gStringVar4
_08095998: .4byte gOtherText_AlreadyBattle
_0809599C: .4byte gTasks
_080959A0: .4byte sub_80954C0
_080959A4:
	adds r0, r5, 0
	bl sub_8094C20
	ldr r1, _080959FC
	strb r0, [r1]
	ldr r1, _08095A00
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08095A04
	ldr r0, _08095A08
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8094C98
	mov r0, r9
	muls r0, r4
	add r0, r10
	adds r1, r7, 0
	bl sub_806E6F0
	ldr r1, _08095A0C
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08095A10
_080959EA:
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080959FC: .4byte gUnknown_0202E8F5
_08095A00: .4byte gUnknown_0202E8F4
_08095A04: .4byte gUnknown_02024A6A
_08095A08: .4byte gUnknown_02024E6C
_08095A0C: .4byte gTasks
_08095A10: .4byte sub_809527C
	thumb_func_end sub_8095584

	thumb_func_start sub_80958C4
sub_80958C4: @ 8095A14
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl sub_8072DEC
	ldr r0, _08095A4C
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x10]
	ldr r1, _08095A50
	bl sub_806E7D0
	ldrh r0, [r4, 0x12]
	strh r0, [r4, 0x10]
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095A4C: .4byte gTasks
_08095A50: .4byte gUnknown_083B5FF4
	thumb_func_end sub_80958C4

	thumb_func_start sub_8095904
sub_8095904: @ 8095A54
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp]
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x3C]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x4]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldr r0, [sp]
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r4, 0
	bne _08095AD8
	movs r5, 0
	cmp r5, r8
	bcs _08095B7E
_08095A8E:
	ldr r1, [sp]
	adds r0, r1, r5
	ldrb r2, [r0]
	ldr r0, _08095AD0
	ands r0, r2
	lsls r0, 6
	movs r1, 0xF
	ands r2, r1
	lsls r2, 5
	adds r0, r2
	ldr r1, _08095AD4
	adds r4, r0, r1
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x10
	bl CpuSet
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, r2
	ldr r3, [sp, 0x4]
	adds r1, r7, r3
	movs r2, 0x10
	bl CpuSet
	adds r7, 0x20
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _08095A8E
	b _08095B7E
	.align 2, 0
_08095AD0: .4byte 0x0000fff0
_08095AD4: .4byte gFont3LatinGlyphs
_08095AD8:
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x8]
	lsls r0, r1, 28
	lsrs r0, 24
	str r0, [sp, 0xC]
	mov r2, r8
	lsls r0, r2, 21
	movs r1, 0
	lsrs r0, 1
	str r0, [sp, 0x10]
_08095AEE:
	movs r5, 0
	ldr r3, [sp, 0x4]
	adds r3, r7, r3
	str r3, [sp, 0x14]
	adds r0, r1, 0x1
	str r0, [sp, 0x18]
	cmp r5, r8
	bcs _08095B62
	movs r2, 0xF
	mov r12, r2
	lsls r1, 9
	ldr r0, _08095B90
	adds r1, r0
	mov r10, r1
_08095B0A:
	ldr r3, [sp]
	adds r0, r3, r5
	ldrb r1, [r0]
	ldr r0, _08095B94
	ands r0, r1
	lsls r0, 6
	mov r2, r12
	ands r1, r2
	lsls r1, 5
	adds r0, r1
	mov r3, r10
	adds r4, r0, r3
	movs r6, 0
	adds r5, 0x1
_08095B26:
	ldrb r0, [r4]
	movs r3, 0xF0
	ands r3, r0
	mov r2, r12
	ands r2, r0
	cmp r3, 0
	bne _08095B36
	ldr r3, [sp, 0xC]
_08095B36:
	cmp r2, 0
	bne _08095B3C
	ldr r2, [sp, 0x8]
_08095B3C:
	mov r0, r9
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r1, [sp, 0x40]
	adds r0, r1, r0
	orrs r3, r2
	strb r3, [r0]
	adds r4, 0x1
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _08095B26
	lsls r0, r5, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _08095B0A
_08095B62:
	ldr r0, [sp, 0x40]
	adds r1, r7, 0
	ldr r3, [sp, 0x10]
	lsrs r2, r3, 16
	bl CpuSet
	ldr r7, [sp, 0x14]
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x18]
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _08095AEE
_08095B7E:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095B90: .4byte gFont3LatinGlyphs
_08095B94: .4byte 0x0000fff0
	thumb_func_end sub_8095904

	thumb_func_start unref_sub_8095A48
unref_sub_8095A48: @ 8095B98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	movs r6, 0
_08095BB0:
	movs r3, 0
	ldrb r0, [r4]
	adds r1, r0, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	beq _08095C1E
_08095BBC:
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	strb r2, [r0]
	adds r4, 0x1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bhi _08095BF8
	ldrb r0, [r4]
	adds r1, r0, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	bne _08095BBC
	cmp r3, 0
	beq _08095C1E
	movs r6, 0x1
	cmp r3, 0x3
	bhi _08095BF8
	movs r2, 0
_08095BE6:
	adds r0, r3, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	add r0, sp
	adds r0, 0x8
	strb r2, [r0]
	cmp r3, 0x3
	bls _08095BE6
_08095BF8:
	mov r1, sp
	adds r1, r3
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	str r7, [sp]
	ldr r0, [sp, 0x28]
	str r0, [sp, 0x4]
	add r0, sp, 0x8
	adds r1, r5, 0
	mov r2, r8
	movs r3, 0x80
	bl sub_8095904
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	cmp r6, 0
	beq _08095BB0
_08095C1E:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8095A48

	thumb_func_start sub_8095ADC
sub_8095ADC: @ 8095C2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	movs r5, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_08095C40:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _08095C70
	adds r0, r1
	adds r0, r6, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08095C5C
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08095C5C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _08095C40
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08095C70: .4byte gUnknown_020300A4
	thumb_func_end sub_8095ADC

	thumb_func_start sub_8095B24
sub_8095B24: @ 8095C74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r5, r0, 5
_08095C86:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _08095CA4
	adds r0, r1
	adds r0, r5, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _08095CA8
	lsls r0, r4, 16
	asrs r0, 16
	b _08095CB6
	.align 2, 0
_08095CA4: .4byte gUnknown_020300A4
_08095CA8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _08095C86
	movs r0, 0x1
	negs r0, r0
_08095CB6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8095B24

	thumb_func_start sub_8095B6C
sub_8095B6C: @ 8095CBC
	push {r4-r6,lr}
	movs r5, 0
	movs r6, 0
_08095CC2:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08095D00
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08095CEA
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08095CEA
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08095CEA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08095CC2
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08095D00: .4byte gPlayerParty
	thumb_func_end sub_8095B6C

	thumb_func_start sub_8095BB4
sub_8095BB4: @ 8095D04
	push {r4-r7,lr}
	lsls r0, 24
	movs r5, 0
	movs r6, 0
	lsrs r7, r0, 24
_08095D0E:
	cmp r5, r7
	beq _08095D46
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08095D5C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08095D46
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08095D46
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08095D46
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08095D46:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08095D0E
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08095D5C: .4byte gPlayerParty
	thumb_func_end sub_8095BB4

	thumb_func_start sub_8095C10
sub_8095C10: @ 8095D60
	push {lr}
	ldr r0, _08095D74
	ldrb r0, [r0]
	bl sub_8095BB4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08095D74: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8095C10

	thumb_func_start sub_8095C28
sub_8095C28: @ 8095D78
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_08095D7E:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08095DAC
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08095D96
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08095D96:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _08095D7E
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08095DAC: .4byte gPlayerParty
	thumb_func_end sub_8095C28

	thumb_func_start unref_sub_8095C60
unref_sub_8095C60: @ 8095DB0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r2, 16
	lsrs r4, 16
	bl StringCopy
	adds r1, r0, 0
	adds r5, r4
	cmp r1, r5
	bcs _08095DCE
	movs r0, 0
_08095DC6:
	strb r0, [r1]
	adds r1, 0x1
	cmp r1, r5
	bcc _08095DC6
_08095DCE:
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8095C60

	thumb_func_start sub_8095C8C
sub_8095C8C: @ 8095DDC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	adds r7, r3, 0
	ldr r5, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	ldr r0, [sp, 0x24]
	mov r9, r0
	ldr r0, [sp, 0x28]
	ldr r3, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	mov r0, r9
	lsls r0, 17
	mov r9, r0
	lsrs r2, 11
	adds r2, r1
	lsls r2, 1
	adds r6, r2
	adds r0, r4, 0
	muls r0, r3
	adds r0, r5
	lsls r0, 1
	adds r7, r0
	movs r4, 0
	cmp r4, r8
	bcs _08095E4C
	mov r0, r9
	lsrs r0, 1
	mov r9, r0
	lsls r5, r3, 1
_08095E32:
	adds r0, r7, 0
	adds r1, r6, 0
	mov r3, r9
	lsrs r2, r3, 16
	bl CpuSet
	adds r6, 0x40
	adds r7, r5
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _08095E32
_08095E4C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8095C8C

	thumb_func_start unref_sub_8095D08
unref_sub_8095D08: @ 8095E58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsrs r2, 11
	adds r2, r1
	lsls r2, 1
	adds r4, r2
	lsls r3, 17
	lsrs r0, r3, 16
	str r0, [sp, 0x4]
	movs r0, 0
	cmp r0, r10
	bcs _08095F02
	movs r6, 0x80
	lsls r6, 5
	mov r5, sp
	ldr r7, _08095EC4
	lsrs r3, 17
	mov r9, r3
	mov r1, r9
	movs r2, 0x81
	lsls r2, 24
	orrs r1, r2
	mov r9, r1
_08095E9E:
	adds r3, r4, 0
	ldr r2, [sp, 0x4]
	movs r1, 0x40
	adds r1, r4
	mov r8, r1
	adds r0, 0x1
	mov r12, r0
	cmp r2, r6
	bhi _08095EC8
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	str r2, [r7]
	str r4, [r7, 0x4]
	mov r0, r9
	str r0, [r7, 0x8]
	ldr r0, [r7, 0x8]
	b _08095EF6
	.align 2, 0
_08095EC4: .4byte 0x040000d4
_08095EC8:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _08095F14
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	ldr r0, _08095F18
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r6
	subs r2, r6
	cmp r2, r6
	bhi _08095EC8
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r2, 1
	movs r2, 0x81
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08095EF6:
	mov r4, r8
	mov r1, r12
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, r10
	bcc _08095E9E
_08095F02:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095F14: .4byte 0x040000d4
_08095F18: .4byte 0x81000800
	thumb_func_end unref_sub_8095D08

	thumb_func_start sub_8095DCC
sub_8095DCC: @ 8095F1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r0, r3, 24
	cmp r0, 0
	beq _08095F38
	cmp r0, 0x2
	bne _08095F3C
_08095F38:
	movs r2, 0x1
	b _08095F3E
_08095F3C:
	ldr r2, _08095F88
_08095F3E:
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08095F94
	lsls r0, r1, 24
	asrs r0, 24
	lsls r2, 16
	asrs r1, r2, 16
	adds r1, r0
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r6, r2, 0
	cmp r1, 0
	blt _08095FE0
	cmp r1, r7
	bgt _08095FE0
_08095F60:
	asrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	add r0, r8
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _08095F8C
	asrs r0, r6, 16
	adds r0, r4, r0
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _08095FE0
	cmp r2, r7
	ble _08095F60
	b _08095FE0
	.align 2, 0
_08095F88: .4byte 0x0000ffff
_08095F8C:
	adds r0, r4, 0
	b _08095FE4
_08095F90:
	adds r0, r5, 0
	b _08095FE4
_08095F94:
	lsls r0, r1, 24
	asrs r0, 24
	lsls r2, 16
	asrs r1, r2, 16
	adds r1, r0
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r6, r2, 0
	cmp r1, 0
	blt _08095FE0
	cmp r1, r7
	bgt _08095FE0
_08095FAC:
	asrs r5, r0, 16
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08095FD0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	beq _08095F90
_08095FD0:
	asrs r0, r6, 16
	adds r0, r5, r0
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _08095FE0
	cmp r2, r7
	ble _08095FAC
_08095FE0:
	movs r0, 0x1
	negs r0, r0
_08095FE4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8095DCC

	thumb_func_start sub_8095EA0
sub_8095EA0: @ 8095FF0
	push {lr}
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	pop {r0}
	bx r0
	thumb_func_end sub_8095EA0

	thumb_func_start sub_8095EB4
sub_8095EB4: @ 8096004
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08096028
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _0809601E
	b _08096244
_0809601E:
	lsls r0, 2
	ldr r1, _0809602C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096028: .4byte gTasks
_0809602C: .4byte _08096030
	.align 2, 0
_08096030:
	.4byte _08096044
	.4byte _0809606C
	.4byte _08096080
	.4byte _08096192
	.4byte _0809622C
_08096044:
	ldrb r0, [r4, 0xA]
	bl sub_8096168
	bl MenuDisplayMessageBox
	ldr r1, _08096068
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	b _08096078
	.align 2, 0
_08096068: .4byte gUnknown_083B600C
_0809606C:
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	bne _08096078
	b _08096244
_08096078:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08096244
_08096080:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08096118
	cmp r1, r0
	bgt _080960A2
	subs r0, 0x1
	cmp r1, r0
	beq _080960A8
	b _08096138
_080960A2:
	cmp r1, 0x3
	beq _08096118
	b _08096138
_080960A8:
	ldrh r3, [r4, 0xA]
	strh r3, [r4, 0xE]
	ldr r2, _08096110
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080960C6
	subs r0, r3, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bge _080960C6
	movs r0, 0x3
	strh r0, [r4, 0xE]
_080960C6:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080960E2
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080960E2
	movs r0, 0
	strh r0, [r4, 0xE]
_080960E2:
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080960F2
	b _08096244
_080960F2:
	strh r2, [r4, 0xA]
	bl sub_8095EA0
	ldr r0, _08096114
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	b _08096244
	.align 2, 0
_08096110: .4byte gMain
_08096114: .4byte gUnknown_083B600C
_08096118:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _08096244
_08096138:
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _08096158
	bl sub_8095C28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _08096158
	bl sub_8095EA0
	ldr r0, _08096154
	b _08096172
	.align 2, 0
_08096154: .4byte gPCText_PartyFull2
_08096158:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08096184
	bl sub_8095C28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08096184
	bl sub_8095EA0
	ldr r0, _08096180
_08096172:
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _08096244
	.align 2, 0
_08096180: .4byte gPCText_OnlyOne
_08096184:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _08096244
_08096192:
	ldr r0, _080961D8
	ldrh r1, [r0, 0x2E]
	movs r3, 0x3
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08096208
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _080961E0
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _080961BA
	strh r3, [r4, 0xA]
_080961BA:
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	bl sub_8095EA0
	ldr r1, _080961DC
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	b _08096212
	.align 2, 0
_080961D8: .4byte gMain
_080961DC: .4byte gUnknown_083B600C
_080961E0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08096244
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080961F8
	strh r2, [r4, 0xA]
_080961F8:
	movs r0, 0x1
	bl MoveMenuCursor
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
_08096208:
	bl sub_8095EA0
	ldr r1, _08096228
	movs r2, 0xA
	ldrsh r0, [r4, r2]
_08096212:
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _08096244
	.align 2, 0
_08096228: .4byte gUnknown_083B600C
_0809622C:
	ldr r0, _0809624C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08096244
	ldrb r0, [r4, 0xC]
	bl task_intro_29
	adds r0, r5, 0
	bl DestroyTask
_08096244:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809624C: .4byte gPaletteFade
	thumb_func_end sub_8095EB4

	thumb_func_start sub_8096100
sub_8096100: @ 8096250
	push {lr}
	ldr r0, _08096278
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809627C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08096278: .4byte sub_8095EB4
_0809627C: .4byte gTasks
	thumb_func_end sub_8096100

	thumb_func_start sub_8096130
sub_8096130: @ 8096280
	push {lr}
	ldr r0, _080962AC
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080962B0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	ldr r0, _080962B4
	ldrb r0, [r0]
	strh r0, [r1, 0xA]
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_080962AC: .4byte sub_8095EB4
_080962B0: .4byte gTasks
_080962B4: .4byte gUnknown_02038474
	thumb_func_end sub_8096130

	thumb_func_start sub_8096168
sub_8096168: @ 80962B8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _080962F4
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	str r4, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080962F4: .4byte gUnknown_083B600C
	thumb_func_end sub_8096168

	thumb_func_start sub_80961A8
sub_80961A8: @ 80962F8
	push {lr}
	ldr r1, _08096314
	ldr r0, _08096318
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	strb r0, [r1]
	ldr r1, _0809631C
	ldr r0, _08096320
	str r0, [r1]
	ldr r0, _08096324
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08096314: .4byte gUnknown_02038474
_08096318: .4byte gUnknown_083B6DB4
_0809631C: .4byte gUnknown_0300485C
_08096320: .4byte sub_8096130
_08096324: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80961A8

	thumb_func_start sub_80961D8
sub_80961D8: @ 8096328
	push {r4-r7,lr}
	ldr r1, _080963A8
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	adds r7, r1, 0x4
_08096334:
	movs r4, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_08096340:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r7
	adds r0, r6, r0
	bl ZeroBoxMonData
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _08096340
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _08096334
	movs r5, 0
_08096364:
	lsls r0, r5, 3
	adds r0, r5
	ldr r6, _080963AC
	adds r0, r6
	ldr r1, _080963B0
	bl StringCopy
	adds r4, r5, 0x1
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	lsls r4, 16
	lsrs r5, r4, 16
	cmp r5, 0xD
	bls _08096364
	movs r5, 0
	adds r3, r6, 0
	adds r3, 0x7E
	movs r2, 0x3
_0809638E:
	adds r0, r5, r3
	adds r1, r5, 0
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0809638E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080963A8: .4byte gPokemonStorage
_080963AC: .4byte gUnknown_020383E4
_080963B0: .4byte gPCText_BOX
	thumb_func_end sub_80961D8

	thumb_func_start sub_8096264
sub_8096264: @ 80963B4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x20
	mov r8, r0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08096444
	str r0, [sp, 0x18]
	ldr r1, _08096448
	add r5, sp, 0x18
	ldr r0, [r5, 0x4]
	ands r0, r1
	orrs r0, r6
	str r0, [r5, 0x4]
	mov r1, sp
	ldr r0, _0809644C
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r1, 0x4]
	strh r4, [r1, 0x6]
	ldr r0, _08096450
	str r0, [sp, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	strh r0, [r1, 0xC]
	adds r0, r4, 0x1
	strh r0, [r1, 0xE]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x8
	bl memset
	adds r0, r5, 0
	bl LoadSpritePalette
	mov r0, sp
	bl LoadSpriteSheets
	ldr r0, _08096454
	mov r1, r8
	str r1, [r0]
	movs r0, 0x90
	lsls r0, 2
	add r0, r8
	strh r4, [r0]
	ldr r0, _08096458
	add r0, r8
	strh r6, [r0]
	ldr r0, _0809645C
	add r8, r0
	mov r0, r9
	mov r1, r8
	strb r0, [r1]
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096444: .4byte gBoxSelectionPopupPalette
_08096448: .4byte 0xffff0000
_0809644C: .4byte gBoxSelectionPopupCenterTiles
_08096450: .4byte gBoxSelectionPopupSidesTiles
_08096454: .4byte gUnknown_02038478
_08096458: .4byte 0x00000242
_0809645C: .4byte 0x0000023e
	thumb_func_end sub_8096264

	thumb_func_start sub_8096310
sub_8096310: @ 8096460
	push {r4,r5,lr}
	ldr r4, _08096494
	ldr r0, [r4]
	ldr r1, _08096498
	adds r0, r1
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	movs r5, 0x90
	lsls r5, 2
	adds r0, r5
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, r5
	ldrh r0, [r0]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096494: .4byte gUnknown_02038478
_08096498: .4byte 0x00000242
	thumb_func_end sub_8096310

	thumb_func_start sub_809634C
sub_809634C: @ 809649C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80963D0
	pop {r0}
	bx r0
	thumb_func_end sub_809634C

	thumb_func_start sub_809635C
sub_809635C: @ 80964AC
	push {lr}
	bl sub_809658C
	pop {r0}
	bx r0
	thumb_func_end sub_809635C

	thumb_func_start sub_8096368
sub_8096368: @ 80964B8
	push {lr}
	ldr r0, _080964D0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080964D4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xC9
	b _0809651C
	.align 2, 0
_080964D0: .4byte gMain
_080964D4:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080964F4
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080964F0
	ldr r0, [r0]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	b _0809651C
	.align 2, 0
_080964F0: .4byte gUnknown_02038478
_080964F4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08096508
	movs r0, 0x5
	bl PlaySE
	bl sub_809662C
	b _0809651A
_08096508:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809651A
	movs r0, 0x5
	bl PlaySE
	bl sub_80965F8
_0809651A:
	movs r0, 0xC8
_0809651C:
	pop {r1}
	bx r1
	thumb_func_end sub_8096368

	thumb_func_start sub_80963D0
sub_80963D0: @ 8096520
	push {r4-r6,lr}
	sub sp, 0x3C
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0x34]
	str r1, [sp, 0x38]
	movs r1, 0xC0
	lsls r1, 24
	ldr r0, [sp, 0x34]
	orrs r0, r1
	str r0, [sp, 0x34]
	ldr r1, _080966B4
	add r4, sp, 0x34
	ldr r0, [r4, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r4, 0x4]
	add r1, sp, 0x1C
	movs r2, 0
	strh r2, [r1]
	mov r0, sp
	adds r0, 0x1E
	strh r2, [r0]
	str r4, [sp, 0x20]
	ldr r0, _080966B8
	str r0, [sp, 0x24]
	str r2, [sp, 0x28]
	ldr r0, _080966BC
	str r0, [sp, 0x2C]
	ldr r0, _080966C0
	str r0, [sp, 0x30]
	add r0, sp, 0x4
	movs r2, 0x18
	bl memcpy
	ldr r6, _080966C4
	ldr r0, [r6]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r1
	strb r5, [r0]
	add r2, sp, 0x4
	ldr r1, [r6]
	movs r5, 0x90
	lsls r5, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r3, _080966C8
	adds r1, r3
	ldrh r0, [r1]
	strh r0, [r2, 0x2]
	adds r0, r2, 0
	movs r1, 0xA0
	movs r2, 0x60
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080966CC
	adds r0, r1
	str r0, [r3]
	ldrb r2, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r4, 0x3]
	add r1, sp, 0x4
	adds r3, r5
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _080966D0
	str r0, [sp, 0xC]
	movs r4, 0
_080965D8:
	ldr r0, [r6]
	ldr r1, _080966D4
	adds r0, r1
	ldrb r3, [r0]
	add r0, sp, 0x4
	movs r1, 0x7C
	movs r2, 0x50
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, [r6]
	lsls r3, r4, 2
	adds r2, 0x4
	adds r2, r3
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080966CC
	adds r1, r0, r1
	str r1, [r2]
	movs r5, 0
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _08096612
	movs r0, 0xC4
	strh r0, [r1, 0x20]
	movs r5, 0x2
_08096612:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08096636
	ldr r1, [r6]
	adds r1, 0x4
	adds r1, r3
	ldr r2, [r1]
	movs r0, 0x70
	strh r0, [r2, 0x22]
	ldr r2, [r1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08096636:
	ldr r0, [r6]
	adds r0, 0x4
	adds r0, r3
	ldr r0, [r0]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080965D8
	movs r4, 0
	ldr r5, _080966C4
_08096654:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 19
	movs r3, 0xF8
	lsls r3, 15
	adds r0, r3
	lsrs r0, 16
	lsls r2, r4, 24
	lsrs r2, 24
	ldr r1, [r5]
	ldr r3, _080966D4
	adds r1, r3
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0x58
	movs r3, 0
	bl sub_809A9A0
	adds r2, r0, 0
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, 0x20
	adds r0, r1
	str r2, [r0]
	cmp r2, 0
	beq _0809669C
	movs r1, 0x1
	cmp r4, 0
	bne _08096694
	movs r3, 0x1
	negs r3, r3
	adds r1, r3, 0
_08096694:
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	ldr r0, _080966D8
	str r0, [r1, 0x1C]
_0809669C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08096654
	bl sub_809665C
	add sp, 0x3C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080966B4: .4byte 0xffff0fff
_080966B8: .4byte gDummySpriteAnimTable
_080966BC: .4byte gDummySpriteAffineAnimTable
_080966C0: .4byte SpriteCallbackDummy
_080966C4: .4byte gUnknown_02038478
_080966C8: .4byte 0x00000242
_080966CC: .4byte gSprites
_080966D0: .4byte gSpriteAnimTable_83B604C
_080966D4: .4byte 0x0000023e
_080966D8: .4byte sub_8096784
	thumb_func_end sub_80963D0

	thumb_func_start sub_809658C
sub_809658C: @ 80966DC
	push {r4-r6,lr}
	ldr r4, _08096744
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _080966F2
	bl DestroySprite
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_080966F2:
	movs r5, 0
	adds r6, r4, 0
_080966F6:
	ldr r0, [r6]
	lsls r4, r5, 2
	adds r0, 0x4
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _08096712
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0x4
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_08096712:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080966F6
	movs r5, 0
_0809671E:
	ldr r0, _08096744
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0x20
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _08096732
	bl DestroySprite
_08096732:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _0809671E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096744: .4byte gUnknown_02038478
	thumb_func_end sub_809658C

	thumb_func_start sub_80965F8
sub_80965F8: @ 8096748
	push {lr}
	ldr r2, _08096778
	ldr r1, [r2]
	movs r0, 0x8F
	lsls r0, 2
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bls _0809676E
	ldr r0, [r2]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0809676E:
	bl sub_809665C
	pop {r0}
	bx r0
	.align 2, 0
_08096778: .4byte gUnknown_02038478
	thumb_func_end sub_80965F8

	thumb_func_start sub_809662C
sub_809662C: @ 809677C
	push {lr}
	ldr r0, _08096794
	ldr r2, [r0]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096798
	subs r1, r0, 0x1
	b _0809679A
	.align 2, 0
_08096794: .4byte gUnknown_02038478
_08096798:
	movs r1, 0xD
_0809679A:
	movs r3, 0x8F
	lsls r3, 2
	adds r0, r2, r3
	strb r1, [r0]
	bl sub_809665C
	pop {r0}
	bx r0
	thumb_func_end sub_809662C

	thumb_func_start sub_809665C
sub_809665C: @ 80967AC
	push {r4-r7,lr}
	ldr r5, _08096804
	ldr r0, [r5]
	movs r4, 0x8F
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8095ADC
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08096808
	movs r6, 0xFC
	strb r6, [r2]
	movs r0, 0x4
	strb r0, [r2, 0x1]
	movs r0, 0xF
	strb r0, [r2, 0x2]
	movs r0, 0x1
	strb r0, [r2, 0x3]
	movs r0, 0xE
	strb r0, [r2, 0x4]
	adds r2, 0x5
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	ldr r0, _0809680C
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFE
	strb r0, [r2]
	strb r6, [r2, 0x1]
	movs r0, 0x11
	strb r0, [r2, 0x2]
	cmp r7, 0x9
	bhi _08096810
	movs r0, 0x28
	b _08096812
	.align 2, 0
_08096804: .4byte gUnknown_02038478
_08096808: .4byte gStringVar1
_0809680C: .4byte gUnknown_020383E4
_08096810:
	movs r0, 0x22
_08096812:
	strb r0, [r2, 0x3]
	adds r2, 0x4
	adds r0, r2, 0
	adds r1, r7, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	movs r0, 0xA4
	strb r0, [r2, 0x1]
	movs r0, 0xA1
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _08096840
	movs r1, 0
	movs r2, 0x1
	bl sub_80966F4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096840: .4byte gStringVar1
	thumb_func_end sub_809665C

	thumb_func_start sub_80966F4
sub_80966F4: @ 8096844
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080968B4
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bl GetSpriteTileStartByTag
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 11
	lsls r4, 8
	ldr r2, _080968B8
	adds r4, r2
	adds r6, r4
	lsls r5, 5
	adds r6, r5
	ldr r0, _080968BC
	ldr r5, [r0]
	mov r1, sp
	ldr r2, _080968C0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080968C4
	str r1, [r4]
	str r5, [r4, 0x4]
	ldr r0, _080968C8
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080968CC
	adds r1, r5, 0
	mov r2, r8
	bl sub_8004E3C
	str r5, [r4]
	str r6, [r4, 0x4]
	ldr r0, _080968D0
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080968B4: .4byte gUnknown_02038478
_080968B8: .4byte 0x06010000
_080968BC: .4byte gUnknown_083B6DB8
_080968C0: .4byte 0x00001111
_080968C4: .4byte 0x040000d4
_080968C8: .4byte 0x81000200
_080968CC: .4byte gWindowConfig_81E6D38
_080968D0: .4byte 0x80000200
	thumb_func_end sub_80966F4

	thumb_func_start sub_8096784
sub_8096784: @ 80968D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08096904
	strh r2, [r1, 0x30]
	ldrh r0, [r1, 0x2E]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _08096904
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x24]
_08096904:
	pop {r0}
	bx r0
	thumb_func_end sub_8096784

	thumb_func_start task_intro_29
task_intro_29: @ 8096908
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08096920
	strb r0, [r1]
	ldr r1, _08096924
	strb r0, [r1, 0x5]
	ldr r0, _08096928
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08096920: .4byte gUnknown_0203847D
_08096924: .4byte 0x02000000
_08096928: .4byte sub_8096884
	thumb_func_end task_intro_29

	thumb_func_start sub_80967DC
sub_80967DC: @ 809692C
	ldr r0, _08096950
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08096950: .4byte 0x04000010
	thumb_func_end sub_80967DC

	thumb_func_start sub_8096804
sub_8096804: @ 8096954
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r1, _0809698C
	movs r2, 0xA0
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08096990
	adds r1, r0, 0
	adds r1, 0x8
	movs r2, 0x8
	bl sub_809CFDC
	ldr r1, _08096994
	movs r0, 0x14
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809698C: .4byte gReservedSpriteTileCount
_08096990: .4byte 0x02000020
_08096994: .4byte gKeyRepeatStartDelay
	thumb_func_end sub_8096804

	thumb_func_start sub_8096848
sub_8096848: @ 8096998
	push {lr}
	bl sub_809B0D4
	ldr r2, _080969B8
	movs r1, 0
	ldr r0, _080969BC
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _080969AC
	movs r1, 0x1
_080969AC:
	strb r1, [r2]
	ldr r1, _080969C0
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080969B8: .4byte gUnknown_0203847C
_080969BC: .4byte 0x02000000
_080969C0: .4byte gUnknown_0203847E
	thumb_func_end sub_8096848

	thumb_func_start sub_8096874
sub_8096874: @ 80969C4
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	thumb_func_end sub_8096874

	thumb_func_start sub_8096884
sub_8096884: @ 80969D4
	push {lr}
	ldr r0, _080969F0
	ldr r1, _080969F4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _080969E4
	b _08096AD6
_080969E4:
	lsls r0, 2
	ldr r1, _080969F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080969F0: .4byte gMain
_080969F4: .4byte 0x0000043c
_080969F8: .4byte _080969FC
	.align 2, 0
_080969FC:
	.4byte _08096A24
	.4byte _08096A38
	.4byte _08096A44
	.4byte _08096A54
	.4byte _08096A5E
	.4byte _08096A68
	.4byte _08096A6E
	.4byte _08096A74
	.4byte _08096A7A
	.4byte _08096AB4
_08096A24:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl sub_8096804
	b _08096ACA
_08096A38:
	ldr r0, _08096A40
	bl SetUpWindowConfig
	b _08096ACA
	.align 2, 0
_08096A40: .4byte gWindowConfig_81E6D00
_08096A44:
	ldr r0, _08096A50
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _08096ACA
	.align 2, 0
_08096A50: .4byte gWindowConfig_81E6D00
_08096A54:
	bl sub_80967DC
	bl sub_8096848
	b _08096ACA
_08096A5E:
	bl sub_8098B48
	bl sub_809AA24
	b _08096ACA
_08096A68:
	bl sub_8097DE0
	b _08096ACA
_08096A6E:
	bl sub_8097E70
	b _08096ACA
_08096A74:
	bl sub_8098400
	b _08096ACA
_08096A7A:
	ldr r0, _08096AA0
	ldrb r0, [r0]
	bl sub_8099BF8
	ldr r2, _08096AA4
	ldr r1, _08096AA8
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	ldr r1, _08096AAC
	adds r2, r1
	ldr r1, _08096AB0
	strh r1, [r2]
	bl sub_80F727C
	bl sub_80F7404
	b _08096ACA
	.align 2, 0
_08096AA0: .4byte gPokemonStorage
_08096AA4: .4byte 0x02000000
_08096AA8: .4byte 0x000012bc
_08096AAC: .4byte 0x000012be
_08096AB0: .4byte 0x0000dacb
_08096AB4:
	bl sub_8096874
	ldr r0, _08096ADC
	bl sub_8096BE0
	ldr r0, _08096AE0
	bl SetMainCallback2
	ldr r0, _08096AE4
	bl SetVBlankCallback
_08096ACA:
	ldr r1, _08096AE8
	ldr r0, _08096AEC
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08096AD6:
	pop {r0}
	bx r0
	.align 2, 0
_08096ADC: .4byte sub_8096BF0
_08096AE0: .4byte sub_8096B38
_08096AE4: .4byte sub_8096AFC
_08096AE8: .4byte gMain
_08096AEC: .4byte 0x0000043c
	thumb_func_end sub_8096884

	thumb_func_start sub_80969A0
sub_80969A0: @ 8096AF0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08096B0C
	ldr r1, _08096B10
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xA
	bls _08096B02
	b _08096C34
_08096B02:
	lsls r0, 2
	ldr r1, _08096B14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096B0C: .4byte gMain
_08096B10: .4byte 0x0000043c
_08096B14: .4byte _08096B18
	.align 2, 0
_08096B18:
	.4byte _08096B44
	.4byte _08096B84
	.4byte _08096B90
	.4byte _08096BA0
	.4byte _08096BA6
	.4byte _08096BB0
	.4byte _08096BB6
	.4byte _08096BBC
	.4byte _08096BC2
	.4byte _08096BFC
	.4byte _08096C18
_08096B44:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08096B78
	ldr r0, _08096B7C
	ldrb r0, [r0]
	strb r0, [r1, 0x5]
	bl sub_8096804
	ldr r4, _08096B80
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08096B6A
	bl sub_809BBC0
_08096B6A:
	ldrb r0, [r4]
	cmp r0, 0
	bne _08096C28
	bl sub_809BD14
	b _08096C28
	.align 2, 0
_08096B78: .4byte 0x02000000
_08096B7C: .4byte gUnknown_0203847D
_08096B80: .4byte gUnknown_0203847F
_08096B84:
	ldr r0, _08096B8C
	bl SetUpWindowConfig
	b _08096C28
	.align 2, 0
_08096B8C: .4byte gWindowConfig_81E6D00
_08096B90:
	ldr r0, _08096B9C
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _08096C28
	.align 2, 0
_08096B9C: .4byte gWindowConfig_81E6D00
_08096BA0:
	bl sub_80967DC
	b _08096C28
_08096BA6:
	bl sub_8098B48
	bl sub_809AA98
	b _08096C28
_08096BB0:
	bl sub_8097DE0
	b _08096C28
_08096BB6:
	bl sub_8097E70
	b _08096C28
_08096BBC:
	bl sub_8098400
	b _08096C28
_08096BC2:
	ldr r0, _08096BE8
	ldrb r0, [r0]
	bl sub_8099BF8
	ldr r2, _08096BEC
	ldr r1, _08096BF0
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	ldr r1, _08096BF4
	adds r2, r1
	ldr r1, _08096BF8
	strh r1, [r2]
	bl sub_80F727C
	bl sub_80F7404
	b _08096C28
	.align 2, 0
_08096BE8: .4byte gPokemonStorage
_08096BEC: .4byte 0x02000000
_08096BF0: .4byte 0x000012bc
_08096BF4: .4byte 0x000012be
_08096BF8: .4byte 0x0000dacb
_08096BFC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08096C14
	bl SetVBlankCallback
	b _08096C28
	.align 2, 0
_08096C14: .4byte sub_8096AFC
_08096C18:
	bl sub_8096874
	ldr r0, _08096C3C
	bl sub_8096BE0
	ldr r0, _08096C40
	bl SetMainCallback2
_08096C28:
	ldr r1, _08096C44
	ldr r0, _08096C48
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08096C34:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096C3C: .4byte sub_8096C68
_08096C40: .4byte sub_8096B38
_08096C44: .4byte gMain
_08096C48: .4byte 0x0000043c
	thumb_func_end sub_80969A0

	thumb_func_start sub_8096AFC
sub_8096AFC: @ 8096C4C
	push {lr}
	ldr r2, _08096C7C
	ldr r1, _08096C80
	ldr r3, _08096C84
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, 0x4
	ldrh r0, [r1, 0xA]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x8]
	strh r0, [r2]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_809CFF0
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08096C7C: .4byte 0x04000018
_08096C80: .4byte 0x02000000
_08096C84: .4byte 0x000008b4
	thumb_func_end sub_8096AFC

	thumb_func_start sub_8096B38
sub_8096B38: @ 8096C88
	push {lr}
	ldr r0, _08096CA8
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_8097E44
	bl sub_8098734
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08096CA8: .4byte 0x02000000
	thumb_func_end sub_8096B38

	thumb_func_start sub_8096B5C
sub_8096B5C: @ 8096CAC
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _08096CC0
	ldrb r0, [r4, 0x6]
	cmp r0, 0
	beq _08096CC4
	cmp r0, 0x1
	beq _08096CFC
	b _08096D1C
	.align 2, 0
_08096CC0: .4byte 0x02000000
_08096CC4:
	ldr r1, _08096CE8
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r2, _08096CEC
	adds r1, r4, r2
	ldrb r1, [r1]
	ldr r3, _08096CF0
	adds r2, r4, r3
	ldrb r2, [r2]
	ldr r3, _08096CF4
	ldr r5, _08096CF8
	adds r4, r5
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_809D8BC
	b _08096D1C
	.align 2, 0
_08096CE8: .4byte 0x00002690
_08096CEC: .4byte 0x0000268d
_08096CF0: .4byte 0x0000268c
_08096CF4: .4byte sub_80969A0
_08096CF8: .4byte 0x0000268e
_08096CFC:
	ldr r0, _08096D24
	ldrb r2, [r0]
	lsls r1, r2, 3
	adds r1, r2
	ldr r2, _08096D28
	adds r0, r2
	adds r1, r0
	movs r0, 0
	str r0, [sp]
	ldr r0, _08096D2C
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DoNamingScreen
_08096D1C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096D24: .4byte gPokemonStorage
_08096D28: .4byte 0x00008344
_08096D2C: .4byte sub_80969A0
	thumb_func_end sub_8096B5C

	thumb_func_start sub_8096BE0
sub_8096BE0: @ 8096D30
	ldr r1, _08096D3C
	str r0, [r1]
	movs r0, 0
	strb r0, [r1, 0x4]
	bx lr
	.align 2, 0
_08096D3C: .4byte 0x02000000
	thumb_func_end sub_8096BE0

	thumb_func_start sub_8096BF0
sub_8096BF0: @ 8096D40
	push {r4,lr}
	ldr r4, _08096D54
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	beq _08096D66
	cmp r0, 0x1
	bgt _08096D58
	cmp r0, 0
	beq _08096D5E
	b _08096DAC
	.align 2, 0
_08096D54: .4byte 0x02000000
_08096D58:
	cmp r0, 0x2
	beq _08096D9C
	b _08096DAC
_08096D5E:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	b _08096D88
_08096D66:
	movs r0, 0x2
	bl PlaySE
	movs r1, 0
	movs r0, 0xE
	strh r0, [r4, 0xC]
	ldr r0, _08096D98
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80C5CD4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
_08096D88:
	movs r2, 0
	bl BlendPalettes
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08096DAC
	.align 2, 0
_08096D98: .4byte 0x0000dad0
_08096D9C:
	bl sub_80C5DCC
	lsls r0, 24
	cmp r0, 0
	beq _08096DAC
	ldr r0, _08096DB4
	bl sub_8096BE0
_08096DAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096DB4: .4byte sub_8096C84
	thumb_func_end sub_8096BF0

	thumb_func_start sub_8096C68
sub_8096C68: @ 8096DB8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08096DCA
	ldr r0, _08096DD0
	bl sub_8096BE0
_08096DCA:
	pop {r0}
	bx r0
	.align 2, 0
_08096DD0: .4byte sub_8096C84
	thumb_func_end sub_8096C68

	thumb_func_start sub_8096C84
sub_8096C84: @ 8096DD4
	push {r4,lr}
	ldr r0, _08096DEC
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	bls _08096DE0
	b _0809710A
_08096DE0:
	lsls r0, 2
	ldr r1, _08096DF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096DEC: .4byte 0x02000000
_08096DF0: .4byte _08096DF4
	.align 2, 0
_08096DF4:
	.4byte _08096E10
	.4byte _08097030
	.4byte _0809706C
	.4byte _080970B0
	.4byte _080970D0
	.4byte _080970DA
	.4byte _080970F4
_08096E10:
	bl sub_809CA40
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0xF
	bls _08096E20
	b _0809710A
_08096E20:
	lsls r0, 2
	ldr r1, _08096E2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096E2C: .4byte _08096E30
	.align 2, 0
_08096E30:
	.4byte _08096E70
	.4byte _0809710A
	.4byte _0809710A
	.4byte _08096EE4
	.4byte _08096E84
	.4byte _08096EAC
	.4byte _08096EFC
	.4byte _08096F10
	.4byte _08096F24
	.4byte _08096F4C
	.4byte _08096F80
	.4byte _08097008
	.4byte _08096FC0
	.4byte _08096FDC
	.4byte _0809701C
	.4byte _08096EF0
_08096E70:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08096E80
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0809710A
	.align 2, 0
_08096E80: .4byte 0x02000000
_08096E84:
	ldr r4, _08096E98
	ldrb r0, [r4, 0x5]
	cmp r0, 0x2
	beq _08096E9C
	movs r0, 0x10
	bl sub_8098898
	movs r0, 0x3
	strb r0, [r4, 0x4]
	b _0809710A
	.align 2, 0
_08096E98: .4byte 0x02000000
_08096E9C:
	bl sub_809B0D4
	ldr r0, _08096EA8
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096EA8: .4byte sub_8096FC8
_08096EAC:
	ldr r4, _08096ED8
	ldrb r0, [r4, 0x5]
	cmp r0, 0x2
	beq _08096EB6
	b _0809710A
_08096EB6:
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	beq _08096ED0
	ldr r1, _08096EDC
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	bne _08096F9C
_08096ED0:
	ldr r0, _08096EE0
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096ED8: .4byte 0x02000000
_08096EDC: .4byte 0x000011f2
_08096EE0: .4byte sub_8097004
_08096EE4:
	ldr r0, _08096EEC
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096EEC: .4byte sub_8097BA0
_08096EF0:
	ldr r0, _08096EF8
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096EF8: .4byte sub_8097CC0
_08096EFC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096F0C
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096F0C: .4byte sub_809789C
_08096F10:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096F20
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096F20: .4byte sub_8097078
_08096F24:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08096F40
	ldr r0, _08096F44
	ldrb r0, [r0]
	adds r0, 0x1
	ldr r2, _08096F48
	adds r1, r4, r2
	strh r0, [r1]
	cmp r0, 0xD
	ble _08096F68
	movs r0, 0
	b _08096F66
	.align 2, 0
_08096F40: .4byte 0x02000000
_08096F44: .4byte gPokemonStorage
_08096F48: .4byte 0x000008b2
_08096F4C:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08096F74
	ldr r0, _08096F78
	ldrb r0, [r0]
	subs r0, 0x1
	ldr r2, _08096F7C
	adds r1, r4, r2
	strh r0, [r1]
	cmp r0, 0
	bge _08096F68
	movs r0, 0xD
_08096F66:
	strh r0, [r1]
_08096F68:
	ldrb r0, [r1]
	bl sub_8099C70
	movs r0, 0x2
	strb r0, [r4, 0x4]
	b _0809710A
	.align 2, 0
_08096F74: .4byte 0x02000000
_08096F78: .4byte gPokemonStorage
_08096F7C: .4byte 0x000008b2
_08096F80:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _08096FE6
	ldr r4, _08096FA4
	ldr r1, _08096FA8
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08096FAC
_08096F9C:
	movs r0, 0x5
	strb r0, [r4, 0x4]
	b _0809710A
	.align 2, 0
_08096FA4: .4byte 0x02000000
_08096FA8: .4byte 0x000011f2
_08096FAC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096FBC
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096FBC: .4byte sub_809746C
_08096FC0:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _08096FE6
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096FD8
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08096FD8: .4byte sub_80972A8
_08096FDC:
	bl sub_809BEBC
	lsls r0, 24
	cmp r0, 0
	bne _08096FF4
_08096FE6:
	ldr r1, _08096FF0
	movs r0, 0x4
	strb r0, [r1, 0x4]
	b _0809710A
	.align 2, 0
_08096FF0: .4byte 0x02000000
_08096FF4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08097004
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08097004: .4byte c3_0808DC50
_08097008:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08097018
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_08097018: .4byte sub_8097390
_0809701C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0809702C
	bl sub_8096BE0
	b _0809710A
	.align 2, 0
_0809702C: .4byte sub_80972FC
_08097030:
	bl sub_809AC00
	lsls r0, 24
	cmp r0, 0
	bne _0809710A
	bl sub_809BF48
	lsls r0, 24
	cmp r0, 0
	beq _0809704A
	bl sub_80986E8
	b _0809704E
_0809704A:
	bl sub_8098710
_0809704E:
	ldr r4, _08097064
	ldr r2, _08097068
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809705E
	bl BoxSetMosaic
_0809705E:
	movs r0, 0
	strb r0, [r4, 0x4]
	b _0809710A
	.align 2, 0
_08097064: .4byte 0x02000000
_08097068: .4byte 0x000011f6
_0809706C:
	bl sub_8099D34
	lsls r0, 24
	cmp r0, 0
	bne _0809710A
	ldr r1, _080970A0
	ldr r0, _080970A4
	ldr r2, _080970A8
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, _080970AC
	ldrb r0, [r0]
	cmp r0, 0
	bne _080970C0
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	bne _080970C0
	bl sub_809B440
	bl BoxSetMosaic
	b _080970C0
	.align 2, 0
_080970A0: .4byte gPokemonStorage
_080970A4: .4byte 0x02000000
_080970A8: .4byte 0x000008b2
_080970AC: .4byte gUnknown_0203847C
_080970B0:
	ldr r0, _080970C8
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0809710A
	bl sub_8098A5C
_080970C0:
	ldr r1, _080970CC
	movs r0, 0
	strb r0, [r1, 0x4]
	b _0809710A
	.align 2, 0
_080970C8: .4byte gMain
_080970CC: .4byte 0x02000000
_080970D0:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xD
	b _080970E2
_080970DA:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x16
_080970E2:
	bl sub_8098898
	ldr r1, _080970F0
	movs r0, 0x6
	strb r0, [r1, 0x4]
	b _0809710A
	.align 2, 0
_080970F0: .4byte 0x02000000
_080970F4:
	ldr r0, _08097110
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0809710A
	bl sub_8098A5C
	ldr r0, _08097114
	bl sub_8096BE0
_0809710A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097110: .4byte gMain
_08097114: .4byte sub_8096C84
	thumb_func_end sub_8096C84

	thumb_func_start sub_8096FC8
sub_8096FC8: @ 8097118
	push {r4,lr}
	ldr r4, _08097128
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _0809712C
	cmp r0, 0x1
	beq _08097138
	b _08097148
	.align 2, 0
_08097128: .4byte 0x02000000
_0809712C:
	bl sub_809880C
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097148
_08097138:
	bl sub_8098830
	lsls r0, 24
	cmp r0, 0
	bne _08097148
	ldr r0, _08097150
	bl sub_8096BE0
_08097148:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097150: .4byte sub_8096C84
	thumb_func_end sub_8096FC8

	thumb_func_start sub_8097004
sub_8097004: @ 8097154
	push {r4,lr}
	ldr r4, _08097168
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	beq _0809717E
	cmp r0, 0x1
	bgt _0809716C
	cmp r0, 0
	beq _08097172
	b _080971BA
	.align 2, 0
_08097168: .4byte 0x02000000
_0809716C:
	cmp r0, 0x2
	beq _0809719C
	b _080971BA
_08097172:
	movs r0, 0x5
	bl PlaySE
	bl add_to_c3_somehow
	b _08097194
_0809717E:
	bl sub_80985CC
	lsls r0, 24
	cmp r0, 0
	bne _080971BA
	bl sub_809B0F4
	lsls r0, 24
	lsrs r0, 24
	bl sub_809B0C0
_08097194:
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080971BA
_0809719C:
	bl sub_809AC00
	lsls r0, 24
	cmp r0, 0
	bne _080971BA
	ldr r1, _080971C0
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080971B4
	bl BoxSetMosaic
_080971B4:
	ldr r0, _080971C4
	bl sub_8096BE0
_080971BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080971C0: .4byte 0x000011f6
_080971C4: .4byte sub_8096C84
	thumb_func_end sub_8097004

	thumb_func_start sub_8097078
sub_8097078: @ 80971C8
	push {r4,lr}
	ldr r0, _080971E0
	ldrb r0, [r0, 0x4]
	cmp r0, 0x5
	bls _080971D4
	b _080973EA
_080971D4:
	lsls r0, 2
	ldr r1, _080971E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080971E0: .4byte 0x02000000
_080971E4: .4byte _080971E8
	.align 2, 0
_080971E8:
	.4byte _08097200
	.4byte _08097218
	.4byte _080973A8
	.4byte _080973BC
	.4byte _080973B2
	.4byte _080973D4
_08097200:
	movs r0, 0x4
	bl sub_8098898
	bl sub_809CE84
	ldr r1, _08097214
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _080973EA
	.align 2, 0
_08097214: .4byte 0x02000000
_08097218:
	bl sub_809CF30
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bls _08097228
	b _080973EA
_08097228:
	lsls r0, 2
	ldr r1, _08097234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097234: .4byte _08097238
	.align 2, 0
_08097238:
	.4byte _08097260
	.4byte _08097260
	.4byte _080972E0
	.4byte _080972C8
	.4byte _08097270
	.4byte _080972A8
	.4byte _08097290
	.4byte _08097380
	.4byte _0809731C
	.4byte _08097394
_08097260:
	bl sub_8098A5C
	ldr r0, _0809726C
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_0809726C: .4byte sub_8096C84
_08097270:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _08097326
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _0809728C
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_0809728C: .4byte sub_80972A8
_08097290:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _080972A4
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_080972A4: .4byte sub_80972FC
_080972A8:
	bl sub_809BEBC
	lsls r0, 24
	cmp r0, 0
	beq _08097326
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _080972C4
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_080972C4: .4byte c3_0808DC50
_080972C8:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _080972DC
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_080972DC: .4byte sub_8097390
_080972E0:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _08097326
	ldr r4, _08097310
	ldr r1, _08097314
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	bne _08097360
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097318
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_08097310: .4byte 0x02000000
_08097314: .4byte 0x000011f2
_08097318: .4byte sub_809746C
_0809731C:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	beq _08097334
_08097326:
	ldr r1, _08097330
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _080973EA
	.align 2, 0
_08097330: .4byte 0x02000000
_08097334:
	ldr r4, _08097348
	ldr r1, _0809734C
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08097350
	movs r0, 0x4
	strb r0, [r4, 0x4]
	b _080973EA
	.align 2, 0
_08097348: .4byte 0x02000000
_0809734C: .4byte 0x000011f9
_08097350:
	ldr r1, _08097368
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0809736C
_08097360:
	movs r0, 0x3
	strb r0, [r4, 0x4]
	b _080973EA
	.align 2, 0
_08097368: .4byte 0x000011f2
_0809736C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0809737C
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_0809737C: .4byte sub_8097594
_08097380:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08097390
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_08097390: .4byte sub_8097788
_08097394:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080973A4
	bl sub_8096BE0
	b _080973EA
	.align 2, 0
_080973A4: .4byte sub_80977E4
_080973A8:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xD
	b _080973C4
_080973B2:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x11
	b _080973C4
_080973BC:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x16
_080973C4:
	bl sub_8098898
	ldr r1, _080973D0
	movs r0, 0x5
	strb r0, [r1, 0x4]
	b _080973EA
	.align 2, 0
_080973D0: .4byte 0x02000000
_080973D4:
	ldr r0, _080973F0
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _080973EA
	bl sub_8098A5C
	ldr r0, _080973F4
	bl sub_8096BE0
_080973EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080973F0: .4byte gMain
_080973F4: .4byte sub_8096C84
	thumb_func_end sub_8097078

	thumb_func_start sub_80972A8
sub_80972A8: @ 80973F8
	push {r4,lr}
	ldr r4, _08097408
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _0809740C
	cmp r0, 0x1
	beq _0809741A
	b _08097442
	.align 2, 0
_08097408: .4byte 0x02000000
_0809740C:
	movs r0, 0
	bl sub_809B100
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097442
_0809741A:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _08097442
	ldr r0, _08097434
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809743C
	ldr r0, _08097438
	bl sub_8096BE0
	b _08097442
	.align 2, 0
_08097434: .4byte gUnknown_0203847C
_08097438: .4byte sub_8097858
_0809743C:
	ldr r0, _08097448
	bl sub_8096BE0
_08097442:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097448: .4byte sub_8096C84
	thumb_func_end sub_80972A8

	thumb_func_start sub_80972FC
sub_80972FC: @ 809744C
	push {r4,lr}
	ldr r4, _0809745C
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _08097460
	cmp r0, 0x1
	beq _0809746E
	b _08097496
	.align 2, 0
_0809745C: .4byte 0x02000000
_08097460:
	movs r0, 0x1
	bl sub_809B100
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097496
_0809746E:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _08097496
	ldr r0, _08097488
	ldrb r0, [r0]
	cmp r0, 0
	beq _08097490
	ldr r0, _0809748C
	bl sub_8096BE0
	b _08097496
	.align 2, 0
_08097488: .4byte gUnknown_0203847C
_0809748C: .4byte sub_8097858
_08097490:
	ldr r0, _0809749C
	bl sub_8096BE0
_08097496:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809749C: .4byte sub_8096C84
	thumb_func_end sub_80972FC

	thumb_func_start c3_0808DC50
c3_0808DC50: @ 80974A0
	push {r4,lr}
	ldr r4, _080974B0
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080974B4
	cmp r0, 0x1
	beq _080974C2
	b _080974D6
	.align 2, 0
_080974B0: .4byte 0x02000000
_080974B4:
	movs r0, 0x2
	bl sub_809B100
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080974D6
_080974C2:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _080974D6
	bl BoxSetMosaic
	ldr r0, _080974DC
	bl sub_8096BE0
_080974D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974DC: .4byte sub_8096C84
	thumb_func_end c3_0808DC50

	thumb_func_start sub_8097390
sub_8097390: @ 80974E0
	push {lr}
	ldr r0, _080974F4
	ldrb r0, [r0, 0x4]
	cmp r0, 0x5
	bhi _080975B2
	lsls r0, 2
	ldr r1, _080974F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080974F4: .4byte 0x02000000
_080974F8: .4byte _080974FC
	.align 2, 0
_080974FC:
	.4byte _08097514
	.4byte _0809754C
	.4byte _0809756C
	.4byte _0809757C
	.4byte _0809758E
	.4byte _080975AC
_08097514:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _08097534
	movs r0, 0xE
	bl sub_8098898
	ldr r1, _08097530
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _080975B2
	.align 2, 0
_08097530: .4byte 0x02000000
_08097534:
	bl sub_809B0E0
	movs r0, 0
	bl sub_809B100
	ldr r1, _08097548
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _080975B2
	.align 2, 0
_08097548: .4byte 0x02000000
_0809754C:
	ldr r0, _08097564
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _080975B2
	bl sub_8098A5C
	ldr r0, _08097568
	bl sub_8096BE0
	b _080975B2
	.align 2, 0
_08097564: .4byte gMain
_08097568: .4byte sub_8096C84
_0809756C:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _080975B2
	bl sub_809880C
	b _0809759C
_0809757C:
	bl sub_8098830
	lsls r0, 24
	cmp r0, 0
	bne _080975B2
	movs r0, 0x1
	bl sub_809B100
	b _0809759C
_0809758E:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _080975B2
	bl sub_80987DC
_0809759C:
	ldr r1, _080975A8
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _080975B2
	.align 2, 0
_080975A8: .4byte 0x02000000
_080975AC:
	ldr r0, _080975B8
	bl sub_8096BE0
_080975B2:
	pop {r0}
	bx r0
	.align 2, 0
_080975B8: .4byte sub_8097004
	thumb_func_end sub_8097390

	thumb_func_start sub_809746C
sub_809746C: @ 80975BC
	push {r4,lr}
	ldr r0, _080975D4
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bls _080975C8
	b _080976D4
_080975C8:
	lsls r0, 2
	ldr r1, _080975D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080975D4: .4byte 0x02000000
_080975D8: .4byte _080975DC
	.align 2, 0
_080975DC:
	.4byte _080975F0
	.4byte _08097628
	.4byte _08097684
	.4byte _08097698
	.4byte _080976BC
_080975F0:
	movs r0, 0x6
	bl sub_8098898
	ldr r4, _08097618
	ldr r2, _0809761C
	adds r0, r4, 0
	movs r1, 0x7
	movs r3, 0x3
	bl sub_8096264
	ldr r0, _08097620
	ldrb r0, [r0]
	bl sub_809634C
	ldr r0, _08097624
	adds r4, r0
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080976D4
	.align 2, 0
_08097618: .4byte 0x02002370
_0809761C: .4byte 0x0000daca
_08097620: .4byte gUnknown_0203847E
_08097624: .4byte 0xffffdc90
_08097628:
	bl sub_8096368
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xC8
	beq _080976D4
	cmp r4, 0xC9
	bne _08097646
	bl sub_8098A5C
	bl sub_809635C
	bl sub_8096310
	b _080976AE
_08097646:
	adds r0, r4, 0
	bl sub_809B62C
	lsls r0, 24
	cmp r0, 0
	beq _08097668
	bl sub_8098A5C
	bl sub_809635C
	bl sub_8096310
	ldr r1, _08097664
	movs r0, 0x2
	b _08097672
	.align 2, 0
_08097664: .4byte 0x02000000
_08097668:
	movs r0, 0x8
	bl sub_8098898
	ldr r1, _0809767C
	movs r0, 0x4
_08097672:
	strb r0, [r1, 0x4]
	ldr r0, _08097680
	strb r4, [r0]
	b _080976D4
	.align 2, 0
_0809767C: .4byte 0x02000000
_08097680: .4byte gUnknown_0203847E
_08097684:
	bl party_compaction
	bl sub_8099310
	ldr r1, _08097694
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	b _080976D2
	.align 2, 0
_08097694: .4byte 0x02000000
_08097698:
	bl sub_8099374
	lsls r0, 24
	cmp r0, 0
	bne _080976D4
	bl sub_809B6BC
	bl BoxSetMosaic
	bl sub_80987DC
_080976AE:
	ldr r0, _080976B8
	bl sub_8096BE0
	b _080976D4
	.align 2, 0
_080976B8: .4byte sub_8096C84
_080976BC:
	ldr r0, _080976DC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080976D4
	movs r0, 0x6
	bl sub_8098898
	ldr r1, _080976E0
	movs r0, 0x1
_080976D2:
	strb r0, [r1, 0x4]
_080976D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080976DC: .4byte gMain
_080976E0: .4byte 0x02000000
	thumb_func_end sub_809746C

	thumb_func_start sub_8097594
sub_8097594: @ 80976E4
	push {r4,lr}
	ldr r0, _080976FC
	ldrb r0, [r0, 0x4]
	cmp r0, 0xD
	bls _080976F0
	b _080978CA
_080976F0:
	lsls r0, 2
	ldr r1, _08097700
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080976FC: .4byte 0x02000000
_08097700: .4byte _08097704
	.align 2, 0
_08097704:
	.4byte _0809773C
	.4byte _08097750
	.4byte _0809778A
	.4byte _080977BE
	.4byte _080977CA
	.4byte _080977E0
	.4byte _08097818
	.4byte _08097830
	.4byte _0809783C
	.4byte _08097840
	.4byte _08097854
	.4byte _08097870
	.4byte _08097882
	.4byte _080978B4
_0809773C:
	movs r0, 0x9
	bl sub_8098898
	movs r0, 0x1
	bl sub_8098A38
	ldr r1, _0809776C
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
_08097750:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0809777C
	cmp r1, 0
	bgt _08097770
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08097776
	b _080978CA
	.align 2, 0
_0809776C: .4byte 0x02000000
_08097770:
	cmp r1, 0x1
	beq _08097776
	b _080978CA
_08097776:
	bl sub_8098A5C
	b _08097830
_0809777C:
	bl sub_8098A5C
	bl sub_809B7D4
	bl sub_809B6DC
	b _08097894
_0809778A:
	bl sub_809B960
	bl sub_809B734
	lsls r0, 24
	cmp r0, 0
	beq _0809779A
	b _080978CA
_0809779A:
	ldr r4, _080977A0
	b _080977AA
	.align 2, 0
_080977A0: .4byte 0x02000000
_080977A4:
	cmp r0, 0
	bne _080977AA
	b _080978A8
_080977AA:
	bl sub_809B960
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _080977A4
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080978CA
_080977BE:
	bl sub_809B760
	bl sub_809801C
	movs r0, 0xA
	b _08097890
_080977CA:
	ldr r0, _080977DC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080977D8
	b _080978CA
_080977D8:
	movs r0, 0xB
	b _08097890
	.align 2, 0
_080977DC: .4byte gMain
_080977E0:
	ldr r0, _08097804
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080978CA
	bl sub_8098A5C
	ldr r0, _08097808
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809780C
	bl party_compaction
	bl sub_8099310
	b _08097894
	.align 2, 0
_08097804: .4byte gMain
_08097808: .4byte gUnknown_0203847C
_0809780C:
	ldr r1, _08097814
	movs r0, 0x7
	strb r0, [r1, 0x4]
	b _080978CA
	.align 2, 0
_08097814: .4byte 0x02000000
_08097818:
	bl sub_8099374
	lsls r0, 24
	cmp r0, 0
	bne _080978CA
	bl sub_809B440
	bl BoxSetMosaic
	bl sub_80987DC
	b _08097894
_08097830:
	ldr r0, _08097838
	bl sub_8096BE0
	b _080978CA
	.align 2, 0
_08097838: .4byte sub_8096C84
_0809783C:
	movs r0, 0xA
	b _08097890
_08097840:
	ldr r0, _08097850
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080978CA
	movs r0, 0x15
	b _08097890
	.align 2, 0
_08097850: .4byte gMain
_08097854:
	ldr r0, _0809786C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080978CA
	bl sub_8098A5C
	bl sub_8099958
	b _08097894
	.align 2, 0
_0809786C: .4byte gMain
_08097870:
	bl sub_8099990
	lsls r0, 24
	cmp r0, 0
	bne _080978CA
	bl sub_809B7AC
	movs r0, 0x13
	b _08097890
_08097882:
	ldr r0, _080978A0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080978CA
	movs r0, 0x14
_08097890:
	bl sub_8098898
_08097894:
	ldr r1, _080978A4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _080978CA
	.align 2, 0
_080978A0: .4byte gMain
_080978A4: .4byte 0x02000000
_080978A8:
	ldr r1, _080978B0
	movs r0, 0x8
	strb r0, [r1, 0x4]
	b _080978CA
	.align 2, 0
_080978B0: .4byte 0x02000000
_080978B4:
	ldr r0, _080978D0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080978CA
	bl sub_8098A5C
	ldr r0, _080978D4
	bl sub_8096BE0
_080978CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080978D0: .4byte gMain
_080978D4: .4byte sub_8096C84
	thumb_func_end sub_8097594

	thumb_func_start sub_8097788
sub_8097788: @ 80978D8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080978EC
	ldrb r4, [r5, 0x4]
	cmp r4, 0
	beq _080978F0
	cmp r4, 0x1
	beq _0809790C
	b _08097924
	.align 2, 0
_080978EC: .4byte 0x02000000
_080978F0:
	bl sub_809BC18
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097924
_0809790C:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08097924
	ldr r0, _0809792C
	strb r1, [r0]
	strb r1, [r5, 0x6]
	ldr r0, _08097930
	bl SetMainCallback2
_08097924:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809792C: .4byte gUnknown_0203847F
_08097930: .4byte sub_8096B5C
	thumb_func_end sub_8097788

	thumb_func_start sub_80977E4
sub_80977E4: @ 8097934
	push {r4,lr}
	ldr r4, _08097944
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _08097948
	cmp r0, 0x1
	beq _08097974
	b _0809799C
	.align 2, 0
_08097944: .4byte 0x02000000
_08097948:
	movs r0, 0xC
	bl sub_8098898
	ldr r0, _08097970
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r3, 0x96
	lsls r3, 5
	adds r0, r4, r3
	strb r1, [r0]
	ldrb r0, [r2]
	movs r1, 0xB0
	movs r2, 0x10
	bl sub_80F7418
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _0809799C
	.align 2, 0
_08097970: .4byte 0x000011f7
_08097974:
	bl sub_80F7500
	lsls r0, 24
	cmp r0, 0
	bne _0809799C
	bl sub_80F7470
	bl sub_8098A5C
	movs r1, 0x96
	lsls r1, 5
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_809BDD8
	bl sub_809801C
	ldr r0, _080979A4
	bl sub_8096BE0
_0809799C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080979A4: .4byte sub_8096C84
	thumb_func_end sub_80977E4

	thumb_func_start sub_8097858
sub_8097858: @ 80979A8
	push {r4,lr}
	ldr r4, _080979B8
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080979BC
	cmp r0, 0x1
	beq _080979CC
	b _080979E0
	.align 2, 0
_080979B8: .4byte 0x02000000
_080979BC:
	bl party_compaction
	bl sub_8099310
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080979E0
_080979CC:
	bl sub_8099374
	lsls r0, 24
	cmp r0, 0
	bne _080979E0
	bl sub_80987DC
	ldr r0, _080979E8
	bl sub_8096BE0
_080979E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080979E8: .4byte sub_8096C84
	thumb_func_end sub_8097858

	thumb_func_start sub_809789C
sub_809789C: @ 80979EC
	push {r4,lr}
	ldr r4, _080979FC
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _08097A00
	cmp r0, 0x1
	beq _08097A12
	b _08097AB8
	.align 2, 0
_080979FC: .4byte 0x02000000
_08097A00:
	movs r0, 0x1
	bl sub_8098898
	bl sub_809CE84
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097AB8
_08097A12:
	bl sub_809CF30
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bhi _08097AB8
	lsls r0, 2
	ldr r1, _08097A2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097A2C: .4byte _08097A30
	.align 2, 0
_08097A30:
	.4byte _08097A64
	.4byte _08097A64
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AB8
	.4byte _08097AA8
	.4byte _08097A90
	.4byte _08097A7C
_08097A64:
	movs r0, 0x1
	bl sub_809A860
	bl sub_8098A5C
	ldr r0, _08097A78
	bl sub_8096BE0
	b _08097AB8
	.align 2, 0
_08097A78: .4byte sub_8096C84
_08097A7C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08097A8C
	bl sub_8096BE0
	b _08097AB8
	.align 2, 0
_08097A8C: .4byte sub_8097B44
_08097A90:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097AA4
	bl sub_8096BE0
	b _08097AB8
	.align 2, 0
_08097AA4: .4byte sub_8097974
_08097AA8:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097AC0
	bl sub_8096BE0
_08097AB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097AC0: .4byte sub_8097A64
	thumb_func_end sub_809789C

	thumb_func_start sub_8097974
sub_8097974: @ 8097AC4
	push {r4,r5,lr}
	ldr r5, _08097AD8
	ldrb r0, [r5, 0x4]
	cmp r0, 0x1
	beq _08097AF2
	cmp r0, 0x1
	bgt _08097ADC
	cmp r0, 0
	beq _08097AE6
	b _08097BAA
	.align 2, 0
_08097AD8: .4byte 0x02000000
_08097ADC:
	cmp r0, 0x2
	beq _08097B4C
	cmp r0, 0x3
	beq _08097B94
	b _08097BAA
_08097AE6:
	bl sub_8098A80
	movs r0, 0x2
	bl sub_8098898
	b _08097B8C
_08097AF2:
	bl sub_809CF30
	ldr r1, _08097B1C
	adds r4, r5, r1
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08097B24
	movs r0, 0x1
	bl sub_809A860
	bl sub_8098A5C
	ldr r0, _08097B20
	bl sub_8096BE0
	b _08097BAA
	.align 2, 0
_08097B1C: .4byte 0x00000d5e
_08097B20: .4byte sub_8096C84
_08097B24:
	cmp r0, r1
	blt _08097BAA
	cmp r0, 0xF
	bgt _08097BAA
	cmp r0, 0xC
	blt _08097BAA
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	subs r0, 0xC
	strh r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8098AA8
	movs r0, 0x3
	bl sub_8098898
	b _08097B8C
_08097B4C:
	bl sub_809CF30
	movs r1, 0xD6
	lsls r1, 4
	adds r4, r5, r1
	strh r0, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08097BAA
	adds r0, 0x1
	cmp r1, r0
	bne _08097B74
	bl sub_8098A5C
	movs r0, 0
	strb r0, [r5, 0x4]
	b _08097BAA
_08097B74:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldrh r0, [r4]
	subs r0, 0x10
	strh r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8099DCC
_08097B8C:
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097BAA
_08097B94:
	bl sub_8099E08
	lsls r0, 24
	cmp r0, 0
	bne _08097BAA
	movs r0, 0x1
	bl sub_809A860
	ldr r0, _08097BB0
	bl sub_8096BE0
_08097BAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097BB0: .4byte sub_8096C84
	thumb_func_end sub_8097974

	thumb_func_start sub_8097A64
sub_8097A64: @ 8097BB4
	push {r4,r5,lr}
	ldr r5, _08097BC8
	ldrb r0, [r5, 0x4]
	cmp r0, 0x1
	beq _08097C00
	cmp r0, 0x1
	bgt _08097BCC
	cmp r0, 0
	beq _08097BD6
	b _08097C82
	.align 2, 0
_08097BC8: .4byte 0x02000000
_08097BCC:
	cmp r0, 0x2
	beq _08097C50
	cmp r0, 0x3
	beq _08097C68
	b _08097C82
_08097BD6:
	movs r0, 0x5
	bl sub_8098898
	ldr r1, _08097BF4
	adds r0, r5, r1
	ldr r2, _08097BF8
	movs r1, 0x7
	movs r3, 0x3
	bl sub_8096264
	ldr r0, _08097BFC
	ldrb r0, [r0]
	bl sub_809634C
	b _08097C5A
	.align 2, 0
_08097BF4: .4byte 0x00002370
_08097BF8: .4byte 0x0000daca
_08097BFC: .4byte gPokemonStorage
_08097C00:
	bl sub_8096368
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08097C44
	adds r4, r5, r2
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0xC8
	beq _08097C82
	bl sub_8098A5C
	bl sub_809635C
	bl sub_8096310
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0xC9
	beq _08097C34
	adds r1, r0, 0
	ldr r0, _08097C48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08097C5A
_08097C34:
	movs r0, 0x1
	bl sub_809A860
	ldr r0, _08097C4C
	bl sub_8096BE0
	b _08097C82
	.align 2, 0
_08097C44: .4byte 0x000008b2
_08097C48: .4byte gPokemonStorage
_08097C4C: .4byte sub_8096C84
_08097C50:
	ldr r1, _08097C64
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_8099C70
_08097C5A:
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097C82
	.align 2, 0
_08097C64: .4byte 0x000008b2
_08097C68:
	bl sub_8099D34
	lsls r0, 24
	cmp r0, 0
	bne _08097C82
	ldr r1, _08097C88
	ldr r2, _08097C8C
	adds r0, r5, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, _08097C90
	bl sub_8096BE0
_08097C82:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097C88: .4byte gPokemonStorage
_08097C8C: .4byte 0x000008b2
_08097C90: .4byte sub_8096C84
	thumb_func_end sub_8097A64

	thumb_func_start sub_8097B44
sub_8097B44: @ 8097C94
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08097CA8
	ldrb r4, [r5, 0x4]
	cmp r4, 0
	beq _08097CAC
	cmp r4, 0x1
	beq _08097CC8
	b _08097CDE
	.align 2, 0
_08097CA8: .4byte 0x02000000
_08097CAC:
	bl sub_809BB90
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097CDE
_08097CC8:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08097CDE
	ldr r0, _08097CE8
	strb r4, [r0]
	strb r4, [r5, 0x6]
	ldr r0, _08097CEC
	bl SetMainCallback2
_08097CDE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097CE8: .4byte gUnknown_0203847F
_08097CEC: .4byte sub_8096B5C
	thumb_func_end sub_8097B44

	thumb_func_start sub_8097BA0
sub_8097BA0: @ 8097CF0
	push {r4,lr}
	ldr r0, _08097D08
	ldrb r1, [r0, 0x4]
	adds r4, r0, 0
	cmp r1, 0x4
	bls _08097CFE
	b _08097E00
_08097CFE:
	lsls r0, r1, 2
	ldr r1, _08097D0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097D08: .4byte 0x02000000
_08097D0C: .4byte _08097D10
	.align 2, 0
_08097D10:
	.4byte _08097D24
	.4byte _08097D68
	.4byte _08097D7C
	.4byte _08097DC4
	.4byte _08097DE8
_08097D24:
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	beq _08097D48
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xF
	bl sub_8098898
	ldr r1, _08097D44
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08097E00
	.align 2, 0
_08097D44: .4byte 0x02000000
_08097D48:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_8098898
	movs r0, 0
	bl sub_8098A38
	ldr r1, _08097D64
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08097E00
	.align 2, 0
_08097D64: .4byte 0x02000000
_08097D68:
	ldr r0, _08097D78
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08097E00
	b _08097D9A
	.align 2, 0
_08097D78: .4byte gMain
_08097D7C:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08097DAC
	cmp r1, 0
	bgt _08097D96
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08097D9A
	b _08097E00
_08097D96:
	cmp r1, 0x1
	bne _08097E00
_08097D9A:
	bl sub_8098A5C
	ldr r0, _08097DA8
	bl sub_8096BE0
	b _08097E00
	.align 2, 0
_08097DA8: .4byte sub_8096C84
_08097DAC:
	movs r0, 0x3
	bl PlaySE
	bl sub_8098A5C
	ldr r1, _08097DC0
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08097E00
	.align 2, 0
_08097DC0: .4byte 0x02000000
_08097DC4:
	movs r1, 0
	movs r0, 0xE
	strh r0, [r4, 0xC]
	ldr r0, _08097DE4
	strh r0, [r4, 0xE]
	movs r0, 0x14
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80C5E38
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097E00
	.align 2, 0
_08097DE4: .4byte 0x0000dad0
_08097DE8:
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _08097E00
	bl CalculatePlayerPartyCount
	ldr r1, _08097E08
	strb r0, [r1]
	ldr r0, _08097E0C
	bl SetMainCallback2
_08097E00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097E08: .4byte gPlayerPartyCount
_08097E0C: .4byte sub_80961A8
	thumb_func_end sub_8097BA0

	thumb_func_start sub_8097CC0
sub_8097CC0: @ 8097E10
	push {r4,lr}
	ldr r0, _08097E28
	ldrb r1, [r0, 0x4]
	adds r4, r0, 0
	cmp r1, 0x4
	bls _08097E1E
	b _08097F20
_08097E1E:
	lsls r0, r1, 2
	ldr r1, _08097E2C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097E28: .4byte 0x02000000
_08097E2C: .4byte _08097E30
	.align 2, 0
_08097E30:
	.4byte _08097E44
	.4byte _08097E88
	.4byte _08097E9C
	.4byte _08097EE4
	.4byte _08097F08
_08097E44:
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	beq _08097E68
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xF
	bl sub_8098898
	ldr r1, _08097E64
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08097F20
	.align 2, 0
_08097E64: .4byte 0x02000000
_08097E68:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x12
	bl sub_8098898
	movs r0, 0
	bl sub_8098A38
	ldr r1, _08097E84
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08097F20
	.align 2, 0
_08097E84: .4byte 0x02000000
_08097E88:
	ldr r0, _08097E98
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08097F20
	b _08097EBC
	.align 2, 0
_08097E98: .4byte gMain
_08097E9C:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08097EBC
	cmp r1, 0
	bgt _08097EB6
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08097ECC
	b _08097F20
_08097EB6:
	cmp r1, 0x1
	beq _08097ECC
	b _08097F20
_08097EBC:
	bl sub_8098A5C
	ldr r0, _08097EC8
	bl sub_8096BE0
	b _08097F20
	.align 2, 0
_08097EC8: .4byte sub_8096C84
_08097ECC:
	movs r0, 0x3
	bl PlaySE
	bl sub_8098A5C
	ldr r1, _08097EE0
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08097F20
	.align 2, 0
_08097EE0: .4byte 0x02000000
_08097EE4:
	movs r1, 0
	movs r0, 0xE
	strh r0, [r4, 0xC]
	ldr r0, _08097F04
	strh r0, [r4, 0xE]
	movs r0, 0x14
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80C5E38
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097F20
	.align 2, 0
_08097F04: .4byte 0x0000dad0
_08097F08:
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _08097F20
	bl CalculatePlayerPartyCount
	ldr r1, _08097F28
	strb r0, [r1]
	ldr r0, _08097F2C
	bl SetMainCallback2
_08097F20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097F28: .4byte gPlayerPartyCount
_08097F2C: .4byte sub_80961A8
	thumb_func_end sub_8097CC0

	thumb_func_start sub_8097DE0
sub_8097DE0: @ 8097F30
	push {lr}
	ldr r1, _08097F6C
	movs r0, 0
	strb r0, [r1, 0x7]
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	ldr r1, _08097F70
	ldr r2, _08097F74
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08097F78
	ldr r2, _08097F7C
	ldr r0, _08097F80
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08097F84
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _08097F88
	ldr r1, _08097F8C
	bl LZ77UnCompVram
	ldr r0, _08097F90
	movs r1, 0xD0
	movs r2, 0x10
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08097F6C: .4byte 0x02000000
_08097F70: .4byte 0x0400000e
_08097F74: .4byte 0x00001e0f
_08097F78: .4byte gPokemonStorageScrollingBGTile
_08097F7C: .4byte 0x0600e000
_08097F80: .4byte 0x040000d4
_08097F84: .4byte 0x80000010
_08097F88: .4byte gPokemonStorageScrollingBGTilemap
_08097F8C: .4byte 0x0600f000
_08097F90: .4byte gPokemonStorageScrollingBGPalette
	thumb_func_end sub_8097DE0

	thumb_func_start sub_8097E44
sub_8097E44: @ 8097F94
	push {lr}
	ldr r1, _08097FBC
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08097FB6
	movs r0, 0
	strb r0, [r1, 0x7]
	ldrh r0, [r1, 0x8]
	subs r0, 0x1
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08097FB6:
	pop {r0}
	bx r0
	.align 2, 0
_08097FBC: .4byte 0x02000000
	thumb_func_end sub_8097E44

	thumb_func_start sub_8097E70
sub_8097E70: @ 8097FC0
	push {r4,lr}
	sub sp, 0x10
	ldr r0, _0809807C
	ldr r1, _08098080
	bl LZ77UnCompVram
	ldr r0, _08098084
	ldr r4, _08098088
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r0, _0809808C
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	movs r1, 0x14
	str r1, [sp, 0xC]
	movs r1, 0
	movs r2, 0
	adds r3, r4, 0
	bl sub_809D034
	ldr r0, _08098090
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08098094
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08098098
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0809809C
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080980A0
	adds r0, r4, 0
	movs r1, 0xF1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xF2
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0xF3
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x16
	movs r1, 0xF4
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x12
	movs r1, 0xF6
	movs r2, 0x4
	bl LoadPalette
	adds r4, 0x2
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _080980A4
	bl LoadSpritePalette
	bl sub_80980D4
	bl sub_8097F58
	bl sub_8097FB8
	bl sub_809801C
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809807C: .4byte gPSSMenuHeader_Gfx
_08098080: .4byte 0x06005000
_08098084: .4byte gPSSMenuHeader_Tilemap
_08098088: .4byte gUnknown_02039760
_0809808C: .4byte 0x06007800
_08098090: .4byte gPSSMenu1_Pal
_08098094: .4byte gPSSMenu2_Pal
_08098098: .4byte gUnknown_083B6D74
_0809809C: .4byte gUnknown_083B6D94
_080980A0: .4byte 0x081f3610
_080980A4: .4byte gWaveformSpritePalette
	thumb_func_end sub_8097E70

	thumb_func_start sub_8097F58
sub_8097F58: @ 80980A8
	push {r4,lr}
	ldr r1, _080980F4
	movs r0, 0xD
	movs r2, 0
	bl sub_80F7940
	ldr r4, _080980F8
	ldr r1, _080980FC
	adds r3, r4, r1
	str r0, [r3]
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	ldr r0, [r3]
	adds r0, 0x43
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r3]
	movs r0, 0x28
	strh r0, [r1, 0x20]
	ldr r1, [r3]
	movs r0, 0x95
	strh r0, [r1, 0x22]
	movs r0, 0xD
	bl GetSpriteTileStartByTag
	ldr r1, _08098100
	adds r4, r1
	lsls r0, 16
	lsrs r0, 11
	ldr r1, _08098104
	adds r0, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080980F4: .4byte 0x0000dace
_080980F8: .4byte 0x02000000
_080980FC: .4byte 0x000012ac
_08098100: .4byte 0x000012b8
_08098104: .4byte 0x06010000
	thumb_func_end sub_8097F58

	thumb_func_start sub_8097FB8
sub_8097FB8: @ 8098108
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0809815C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r4, 0
	ldr r5, _08098160
_08098120:
	lsls r1, r4, 6
	subs r1, r4
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	ldr r0, _08098164
	movs r2, 0x9
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r4, 2
	adds r2, r5
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08098168
	adds r1, r0
	str r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08098120
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809815C: .4byte gWaveformSpriteSheet
_08098160: .4byte 0x020012b0
_08098164: .4byte gSpriteTemplate_83B6EFC
_08098168: .4byte gSprites
	thumb_func_end sub_8097FB8

	thumb_func_start sub_809801C
sub_809801C: @ 809816C
	push {lr}
	ldr r1, _0809818C
	ldr r2, _08098190
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r2, 0x4
	adds r1, r2
	ldr r1, [r1]
	bl sub_80981F0
	bl sub_80982B4
	bl sub_8098350
	pop {r0}
	bx r0
	.align 2, 0
_0809818C: .4byte 0x02000000
_08098190: .4byte 0x000011f0
	thumb_func_end sub_809801C

	thumb_func_start BoxSetMosaic
BoxSetMosaic: @ 8098194
	push {lr}
	bl sub_809801C
	ldr r0, _080981D4
	movs r1, 0x9C
	lsls r1, 6
	adds r3, r0, r1
	ldr r2, [r3]
	cmp r2, 0
	beq _080981D0
	ldrb r0, [r2, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r1, [r3]
	movs r0, 0xA
	strh r0, [r1, 0x2E]
	ldr r1, [r3]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	ldr r1, [r3]
	ldr r0, _080981D8
	str r0, [r1, 0x1C]
	ldr r2, _080981DC
	ldr r0, [r3]
	ldrh r0, [r0, 0x2E]
	lsls r1, r0, 12
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
_080981D0:
	pop {r0}
	bx r0
	.align 2, 0
_080981D4: .4byte 0x02000000
_080981D8: .4byte sub_8098090
_080981DC: .4byte 0x0400004c
	thumb_func_end BoxSetMosaic

	thumb_func_start sub_8098090
sub_8098090: @ 80981E0
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	subs r0, r1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bge _080981F6
	movs r0, 0
	strh r0, [r3, 0x2E]
_080981F6:
	ldr r2, _0809821C
	ldrh r0, [r3, 0x2E]
	lsls r1, r0, 12
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08098218
	ldrb r0, [r3, 0x1]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	strb r1, [r3, 0x1]
	ldr r0, _08098220
	str r0, [r3, 0x1C]
_08098218:
	pop {r0}
	bx r0
	.align 2, 0
_0809821C: .4byte 0x0400004c
_08098220: .4byte SpriteCallbackDummy
	thumb_func_end sub_8098090

	thumb_func_start sub_80980D4
sub_80980D4: @ 8098224
	push {r4,r5,lr}
	sub sp, 0x28
	ldr r0, _080982A0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _080982A4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080982A8
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r1, 0
	add r5, sp, 0x18
	ldr r4, _080982AC
	movs r3, 0
	ldr r2, _080982B0
_08098252:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08098252
	movs r1, 0
	ldr r3, _080982B4
	movs r2, 0
_08098266:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08098266
	ldr r0, _080982B8
	movs r1, 0x9C
	lsls r1, 6
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	adds r0, r5, 0
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _08098314
	add r0, sp, 0x20
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08098314
	b _08098300
	.align 2, 0
_080982A0: .4byte gUnknown_083B6DCC
_080982A4: .4byte gUnknown_083B6DD4
_080982A8: .4byte gSpriteTemplate_83B6DDC
_080982AC: .4byte 0x02002784
_080982B0: .4byte 0x000007ff
_080982B4: .4byte 0x02002704
_080982B8: .4byte 0x02000000
_080982BC:
	ldr r2, _080982EC
	movs r0, 0x9C
	lsls r0, 6
	adds r3, r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080982F0
	adds r0, r1
	str r0, [r3]
	lsls r0, r4, 4
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldr r3, _080982F4
	adds r1, r2, r3
	strh r0, [r1]
	ldr r4, _080982F8
	adds r2, r4
	lsls r0, r5, 5
	ldr r1, _080982FC
	adds r0, r1
	str r0, [r2]
	b _08098314
	.align 2, 0
_080982EC: .4byte 0x02000000
_080982F0: .4byte gSprites
_080982F4: .4byte 0x000026fa
_080982F8: .4byte 0x000026fc
_080982FC: .4byte 0x06010000
_08098300:
	mov r0, sp
	movs r1, 0x28
	movs r2, 0x30
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080982BC
_08098314:
	ldr r0, _08098338
	movs r2, 0x9C
	lsls r2, 6
	adds r0, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _0809832E
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	ldr r0, _0809833C
	bl FreeSpritePaletteByTag
_0809832E:
	add sp, 0x28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098338: .4byte 0x02000000
_0809833C: .4byte 0x0000dac7
	thumb_func_end sub_80980D4

	thumb_func_start sub_80981F0
sub_80981F0: @ 8098340
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r6, _080983C4
	movs r0, 0x9C
	lsls r0, 6
	adds r0, r6
	mov r8, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080983F6
	cmp r4, 0
	beq _080983EC
	lsls r0, r4, 3
	ldr r1, _080983C8
	adds r0, r1
	ldr r2, _080983CC
	lsls r1, r4, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, _080983D0
	adds r3, r6, r2
	ldr r2, _080983D4
	adds r5, r6, r2
	str r5, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r2, 0x1
	bl sub_800D334
	ldr r1, _080983D8
	adds r0, r6, r1
	ldr r0, [r0]
	ldr r2, _080983DC
	adds r4, r6, r2
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r1, _080983E0
	adds r0, r6, r1
	ldr r1, [r0]
	ldr r2, _080983E4
	adds r0, r5, 0
	bl CpuSet
	ldr r2, _080983E8
	adds r0, r6, r2
	ldrh r1, [r0]
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	mov r0, r8
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _080983F6
	.align 2, 0
_080983C4: .4byte 0x02000000
_080983C8: .4byte gMonFrontPicTable
_080983CC: .4byte gMonFrontPicCoords
_080983D0: .4byte 0x00004784
_080983D4: .4byte 0x00002784
_080983D8: .4byte 0x000011e8
_080983DC: .4byte 0x00002704
_080983E0: .4byte 0x000026fc
_080983E4: .4byte 0x04000200
_080983E8: .4byte 0x000026fa
_080983EC:
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080983F6:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80981F0

	thumb_func_start sub_80982B4
sub_80982B4: @ 8098404
	push {r4,lr}
	ldr r4, _08098434
	ldr r1, _08098438
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08098444
	ldr r2, _0809843C
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r2, 0xC1
	adds r1, r4, r2
	ldr r1, [r1]
	bl sub_80F7A10
	ldr r1, _08098440
	adds r0, r4, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _08098452
	.align 2, 0
_08098434: .4byte 0x02000000
_08098438: .4byte 0x000011f0
_0809843C: .4byte 0x000011f7
_08098440: .4byte 0x000012ac
_08098444:
	ldr r2, _08098498
	adds r0, r4, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
_08098452:
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xB
	movs r2, 0x9
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	ldr r4, _0809849C
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x10
	bl MenuPrint
	adds r0, r4, 0
	subs r0, 0x6B
	movs r1, 0x1
	movs r2, 0xB
	bl MenuPrint
	adds r0, r4, 0
	subs r0, 0x46
	movs r1, 0
	movs r2, 0xD
	bl MenuPrint
	subs r4, 0x21
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098498: .4byte 0x000012ac
_0809849C: .4byte 0x0200127a
	thumb_func_end sub_80982B4

	thumb_func_start sub_8098350
sub_8098350: @ 80984A0
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r5, _080984F0
	ldr r1, _080984F4
	adds r0, r5, r1
	ldrh r2, [r0]
	cmp r2, 0
	beq _08098504
	ldr r0, _080984F8
	ldr r3, _080984FC
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x1
	movs r2, 0
	bl sub_809D034
	movs r4, 0
	ldr r0, _08098500
	adds r5, r0
_080984D2:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnimIfDifferent
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080984D2
	b _0809853C
	.align 2, 0
_080984F0: .4byte 0x02000000
_080984F4: .4byte 0x000011f0
_080984F8: .4byte 0x06007800
_080984FC: .4byte gUnknown_02039760
_08098500: .4byte 0x000012b0
_08098504:
	ldr r0, _08098544
	ldr r3, _08098548
	movs r1, 0xA
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x1
	movs r2, 0
	bl sub_809D034
	movs r4, 0
	ldr r1, _0809854C
	adds r5, r1
_08098524:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r1, r4, 25
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08098524
_0809853C:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098544: .4byte 0x06007800
_08098548: .4byte gUnknown_02039760
_0809854C: .4byte 0x000012b0
	thumb_func_end sub_8098350

	thumb_func_start sub_8098400
sub_8098400: @ 8098550
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r1, _080985CC
	ldr r2, _080985D0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080985D4
	ldr r1, _080985D8
	bl LZ77UnCompVram
	ldr r0, _080985DC
	ldr r5, _080985E0
	adds r1, r5, 0
	bl LZ77UnCompWram
	ldr r0, _080985E4
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080985E8
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080985EC
	add r1, sp, 0x10
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080985F0
	str r1, [r0]
	str r4, [r0, 0x4]
	ldr r1, _080985F4
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8098780
	ldr r0, _080985F8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080985FC
	movs r0, 0x1
	bl sub_8098690
	movs r0, 0x1
	bl sub_8099200
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x16
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0
	adds r3, r5, 0
	bl sub_809D034
	b _0809861C
	.align 2, 0
_080985CC: .4byte 0x0400000a
_080985D0: .4byte 0x00000f01
_080985D4: .4byte gPSSMenuMisc_Gfx
_080985D8: .4byte 0x06006800
_080985DC: .4byte gPSSMenuMisc_Tilemap
_080985E0: .4byte 0x020000a8
_080985E4: .4byte gPSSMenu3_Pal
_080985E8: .4byte gPSSMenu4_Pal
_080985EC: .4byte 0x06007800
_080985F0: .4byte 0x040000d4
_080985F4: .4byte 0x81000400
_080985F8: .4byte gUnknown_0203847C
_080985FC:
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0
	adds r3, r5, 0
	bl sub_809D034
	movs r0, 0x1
	bl sub_8098690
_0809861C:
	ldr r0, _08098630
	ldr r1, _08098634
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098630: .4byte 0x02000000
_08098634: .4byte 0x000008af
	thumb_func_end sub_8098400

	thumb_func_start sub_80984E8
sub_80984E8: @ 8098638
	push {lr}
	ldr r1, _08098660
	ldr r0, _08098664
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x14
	strh r0, [r2]
	ldr r0, _08098668
	adds r2, r1, r0
	movs r0, 0x2
	strh r0, [r2]
	ldr r0, _0809866C
	adds r1, r0
	strb r3, [r1]
	movs r0, 0
	bl sub_8099200
	pop {r0}
	bx r0
	.align 2, 0
_08098660: .4byte 0x02000000
_08098664: .4byte 0x000008a8
_08098668: .4byte 0x000008aa
_0809866C: .4byte 0x000008ad
	thumb_func_end sub_80984E8

	thumb_func_start sub_8098520
sub_8098520: @ 8098670
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r3, _080986C8
	ldr r0, _080986CC
	adds r5, r3, r0
	ldrb r0, [r5]
	cmp r0, 0x14
	beq _080986E2
	ldr r0, _080986D0
	adds r1, r3, r0
	ldrh r0, [r1]
	subs r0, 0x1
	movs r4, 0
	strh r0, [r1]
	ldr r0, _080986D4
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r0, _080986D8
	adds r3, 0xA8
	str r4, [sp]
	ldrh r1, [r1]
	str r1, [sp, 0x4]
	movs r1, 0xC
	str r1, [sp, 0x8]
	ldrh r1, [r2]
	str r1, [sp, 0xC]
	movs r1, 0xA
	movs r2, 0
	bl sub_809D034
	movs r0, 0x8
	bl sub_80994A8
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	beq _080986DC
	movs r0, 0x1
	b _080986E4
	.align 2, 0
_080986C8: .4byte 0x02000000
_080986CC: .4byte 0x000008ad
_080986D0: .4byte 0x000008a8
_080986D4: .4byte 0x000008aa
_080986D8: .4byte 0x06007800
_080986DC:
	ldr r1, _080986EC
	movs r0, 0x1
	strb r0, [r1]
_080986E2:
	movs r0, 0
_080986E4:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080986EC: .4byte gUnknown_0203847C
	thumb_func_end sub_8098520

	thumb_func_start add_to_c3_somehow
add_to_c3_somehow: @ 80986F0
	ldr r1, _0809870C
	ldr r0, _08098710
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08098714
	adds r2, r1, r0
	movs r0, 0x16
	strh r0, [r2]
	ldr r0, _08098718
	adds r1, r0
	strb r3, [r1]
	bx lr
	.align 2, 0
_0809870C: .4byte 0x02000000
_08098710: .4byte 0x000008a8
_08098714: .4byte 0x000008aa
_08098718: .4byte 0x000008ad
	thumb_func_end add_to_c3_somehow

	thumb_func_start sub_80985CC
sub_80985CC: @ 809871C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r3, _08098790
	ldr r0, _08098794
	adds r6, r3, r0
	ldrb r0, [r6]
	cmp r0, 0x14
	beq _080987CA
	ldr r2, _08098798
	adds r1, r3, r2
	ldrh r0, [r1]
	adds r0, 0x1
	movs r2, 0
	mov r9, r2
	strh r0, [r1]
	ldr r0, _0809879C
	adds r4, r3, r0
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldr r5, _080987A0
	adds r3, 0xA8
	mov r8, r3
	str r2, [sp]
	ldrh r0, [r1]
	str r0, [sp, 0x4]
	movs r7, 0xC
	str r7, [sp, 0x8]
	ldrh r0, [r4]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0xA
	bl sub_809D034
	ldrh r2, [r4]
	movs r4, 0x1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0xA
	movs r3, 0xC
	bl sub_809D16C
	movs r0, 0x8
	negs r0, r0
	bl sub_80994A8
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	beq _080987A4
	movs r0, 0x1
	b _080987CC
	.align 2, 0
_08098790: .4byte 0x02000000
_08098794: .4byte 0x000008ad
_08098798: .4byte 0x000008a8
_0809879C: .4byte 0x000008aa
_080987A0: .4byte 0x06007800
_080987A4:
	ldr r0, _080987DC
	movs r1, 0
	strb r1, [r0]
	bl sub_809954C
	bl party_compaction
	str r7, [sp]
	mov r2, r9
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	mov r3, r8
	bl sub_809D034
_080987CA:
	movs r0, 0
_080987CC:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080987DC: .4byte gUnknown_0203847C
	thumb_func_end sub_80985CC

	thumb_func_start sub_8098690
sub_8098690: @ 80987E0
	push {lr}
	sub sp, 0x10
	lsls r0, 24
	cmp r0, 0
	beq _08098810
	ldr r0, _08098808
	ldr r3, _0809880C
	movs r1, 0xC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x15
	movs r2, 0
	bl sub_809D034
	b _0809882A
	.align 2, 0
_08098808: .4byte 0x06007800
_0809880C: .4byte 0x020000a8
_08098810:
	ldr r0, _08098830
	ldr r3, _08098834
	movs r1, 0xC
	str r1, [sp]
	movs r2, 0x2
	str r2, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	movs r1, 0x15
	movs r2, 0
	bl sub_809D034
_0809882A:
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_08098830: .4byte 0x06007800
_08098834: .4byte 0x020000a8
	thumb_func_end sub_8098690

	thumb_func_start sub_80986E8
sub_80986E8: @ 8098838
	ldr r1, _08098854
	ldr r2, _08098858
	adds r0, r1, r2
	movs r3, 0x1
	strb r3, [r0]
	movs r0, 0x8B
	lsls r0, 4
	adds r2, r1, r0
	movs r0, 0x1E
	strb r0, [r2]
	ldr r2, _0809885C
	adds r1, r2
	strb r3, [r1]
	bx lr
	.align 2, 0
_08098854: .4byte 0x02000000
_08098858: .4byte 0x000008af
_0809885C: .4byte 0x000008b1
	thumb_func_end sub_80986E8

	thumb_func_start sub_8098710
sub_8098710: @ 8098860
	push {lr}
	ldr r0, _0809887C
	ldr r2, _08098880
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08098878
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl sub_8098690
_08098878:
	pop {r0}
	bx r0
	.align 2, 0
_0809887C: .4byte 0x02000000
_08098880: .4byte 0x000008af
	thumb_func_end sub_8098710

	thumb_func_start sub_8098734
sub_8098734: @ 8098884
	push {lr}
	ldr r2, _080988C4
	ldr r1, _080988C8
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080988C0
	movs r0, 0x8B
	lsls r0, 4
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bls _080988C0
	movs r0, 0
	strb r0, [r1]
	movs r3, 0
	ldr r0, _080988CC
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080988B8
	movs r3, 0x1
_080988B8:
	strb r3, [r1]
	ldrb r0, [r1]
	bl sub_8098690
_080988C0:
	pop {r0}
	bx r0
	.align 2, 0
_080988C4: .4byte 0x02000000
_080988C8: .4byte 0x000008af
_080988CC: .4byte 0x000008b1
	thumb_func_end sub_8098734

	thumb_func_start sub_8098780
sub_8098780: @ 80988D0
	push {r4-r6,lr}
	sub sp, 0x10
	movs r4, 0x1
	ldr r6, _08098924
	movs r5, 0x80
	lsls r5, 9
_080988DC:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08098928
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080988F0
	movs r0, 0x1
_080988F0:
	movs r1, 0x10
	cmp r0, 0
	beq _080988F8
	movs r1, 0xC
_080988F8:
	lsrs r2, r5, 16
	str r1, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0x7
	adds r3, r6, 0
	bl sub_809D104
	movs r0, 0xC0
	lsls r0, 10
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x5
	ble _080988DC
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098924: .4byte 0x020000a8
_08098928: .4byte gPlayerParty
	thumb_func_end sub_8098780

	thumb_func_start sub_80987DC
sub_80987DC: @ 809892C
	push {lr}
	sub sp, 0x10
	bl sub_8098780
	ldr r0, _08098954
	ldr r3, _08098958
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0xC
	str r1, [sp, 0x8]
	movs r1, 0x16
	str r1, [sp, 0xC]
	movs r1, 0xA
	movs r2, 0
	bl sub_809D034
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_08098954: .4byte 0x06007800
_08098958: .4byte 0x020000a8
	thumb_func_end sub_80987DC

	thumb_func_start sub_809880C
sub_809880C: @ 809895C
	push {lr}
	ldr r0, _08098978
	ldr r1, _0809897C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x6
	bl PlaySE
	bl sub_80984E8
	pop {r0}
	bx r0
	.align 2, 0
_08098978: .4byte 0x02000000
_0809897C: .4byte 0x000008ae
	thumb_func_end sub_809880C

	thumb_func_start sub_8098830
sub_8098830: @ 8098980
	push {r4,r5,lr}
	ldr r5, _08098998
	ldr r0, _0809899C
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _080989B6
	cmp r0, 0x1
	bgt _080989A0
	cmp r0, 0
	beq _080989A6
	b _080989E0
	.align 2, 0
_08098998: .4byte 0x02000000
_0809899C: .4byte 0x000008ae
_080989A0:
	cmp r0, 0x2
	beq _080989DC
	b _080989E0
_080989A6:
	bl sub_8098520
	lsls r0, 24
	cmp r0, 0
	bne _080989E0
	bl sub_809B068
	b _080989CE
_080989B6:
	bl sub_809AC00
	lsls r0, 24
	cmp r0, 0
	bne _080989E0
	ldr r1, _080989D8
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080989CE
	bl BoxSetMosaic
_080989CE:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080989E0
	.align 2, 0
_080989D8: .4byte 0x000011f6
_080989DC:
	movs r0, 0
	b _080989E2
_080989E0:
	movs r0, 0x1
_080989E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8098830

	thumb_func_start sub_8098898
sub_8098898: @ 80989E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0xA
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _08098A14
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	bls _08098A08
	b _08098B48
_08098A08:
	lsls r0, 2
	ldr r1, _08098A18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08098A14: .4byte gUnknown_083B6DF4
_08098A18: .4byte _08098A1C
	.align 2, 0
_08098A1C:
	.4byte _08098B48
	.4byte _08098A80
	.4byte _08098A38
	.4byte _08098AC8
	.4byte _08098AA4
	.4byte _08098A60
	.4byte _08098B0C
_08098A38:
	ldr r4, _08098A54
	ldr r1, _08098A58
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _08098A5C
	adds r4, r0
	adds r0, r2, 0
	adds r1, r4, 0
	b _08098B52
	.align 2, 0
_08098A54: .4byte 0x02002694
_08098A58: .4byte gUnknown_083B6DF4
_08098A5C: .4byte 0xffffeb66
_08098A60:
	ldr r4, _08098A78
	ldr r1, _08098A7C
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r2, r0, 0
	adds r4, 0x50
	adds r1, r4, 0
	b _08098B52
	.align 2, 0
_08098A78: .4byte 0x02002694
_08098A7C: .4byte gUnknown_083B6DF4
_08098A80:
	ldr r0, _08098A98
	ldr r2, _08098A9C
	adds r1, r0, r2
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _08098AA0
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	b _08098B52
	.align 2, 0
_08098A98: .4byte 0x02002694
_08098A9C: .4byte 0xffffeb66
_08098AA0: .4byte gUnknown_083B6DF4
_08098AA4:
	ldr r4, _08098AC0
	adds r1, r4, 0
	adds r1, 0x50
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _08098AC4
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl de_sub_8073174
	b _08098B56
	.align 2, 0
_08098AC0: .4byte 0x02002694
_08098AC4: .4byte gUnknown_083B6DF4
_08098AC8:
	ldr r1, _08098B00
	lsls r0, r5, 3
	adds r0, r1
	ldr r6, [r0]
	adds r0, r6, 0
	bl StringLength
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r4, r6, r4
	adds r4, 0x1
	ldr r5, _08098B04
	adds r0, r5, 0
	adds r1, r6, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _08098B08
	adds r5, r0
	adds r0, r2, 0
	adds r1, r5, 0
	bl StringCopy
	adds r2, r0, 0
	adds r1, r4, 0
	b _08098B52
	.align 2, 0
_08098B00: .4byte gUnknown_083B6DF4
_08098B04: .4byte 0x02002694
_08098B08: .4byte 0xffffeb66
_08098B0C:
	ldr r1, _08098B40
	lsls r0, r5, 3
	adds r0, r1
	ldr r6, [r0]
	adds r0, r6, 0
	bl StringLength
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r4, r6, r4
	subs r4, 0x1
	ldr r5, _08098B44
	adds r0, r5, 0
	adds r1, r6, 0
	bl StringCopy
	adds r2, r0, 0
	subs r0, r2, 0x1
	adds r5, 0x50
	adds r1, r5, 0
	bl StringCopy
	adds r2, r0, 0
	adds r1, r4, 0
	b _08098B52
	.align 2, 0
_08098B40: .4byte gUnknown_083B6DF4
_08098B44: .4byte 0x02002694
_08098B48:
	ldr r0, _08098B80
	ldr r2, _08098B84
	lsls r1, r5, 3
	adds r1, r2
	ldr r1, [r1]
_08098B52:
	bl StringCopy
_08098B56:
	adds r2, r0, 0
	ldr r0, _08098B88
	adds r3, r0, 0
	subs r3, 0x12
	cmp r2, r0
	bcs _08098B6C
	movs r1, 0
_08098B64:
	strb r1, [r2]
	adds r2, 0x1
	cmp r2, r0
	bcc _08098B64
_08098B6C:
	movs r0, 0xFF
	strb r0, [r2]
	adds r0, r3, 0
	movs r1, 0xB
	movs r2, 0x11
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098B80: .4byte 0x02002694
_08098B84: .4byte gUnknown_083B6DF4
_08098B88: .4byte 0x020026a6
	thumb_func_end sub_8098898

	thumb_func_start sub_8098A38
sub_8098A38: @ 8098B8C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0
	bl DisplayYesNoMenu
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl MoveMenuCursor
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8098A38

	thumb_func_start sub_8098A5C
sub_8098A5C: @ 8098BB0
	push {lr}
	bl sub_8072DEC
	movs r0, 0xA
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8098A5C

	thumb_func_start sub_8098A80
sub_8098A80: @ 8098BD4
	push {lr}
	bl sub_809CDCC
	movs r0, 0xC
	bl sub_809CDEC
	movs r0, 0xD
	bl sub_809CDEC
	movs r0, 0xE
	bl sub_809CDEC
	movs r0, 0xF
	bl sub_809CDEC
	bl sub_809CE84
	pop {r0}
	bx r0
	thumb_func_end sub_8098A80

	thumb_func_start sub_8098AA8
sub_8098AA8: @ 8098BFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_809CDCC
	cmp r4, 0x1
	beq _08098C3A
	cmp r4, 0x1
	bgt _08098C16
	cmp r4, 0
	beq _08098C20
	b _08098C86
_08098C16:
	cmp r5, 0x2
	beq _08098C54
	cmp r5, 0x3
	beq _08098C6E
	b _08098C86
_08098C20:
	movs r0, 0x10
	bl sub_809CDEC
	movs r0, 0x11
	bl sub_809CDEC
	movs r0, 0x12
	bl sub_809CDEC
	movs r0, 0x13
	bl sub_809CDEC
	b _08098C86
_08098C3A:
	movs r0, 0x14
	bl sub_809CDEC
	movs r0, 0x15
	bl sub_809CDEC
	movs r0, 0x16
	bl sub_809CDEC
	movs r0, 0x17
	bl sub_809CDEC
	b _08098C86
_08098C54:
	movs r0, 0x18
	bl sub_809CDEC
	movs r0, 0x19
	bl sub_809CDEC
	movs r0, 0x1A
	bl sub_809CDEC
	movs r0, 0x1B
	bl sub_809CDEC
	b _08098C86
_08098C6E:
	movs r0, 0x1C
	bl sub_809CDEC
	movs r0, 0x1D
	bl sub_809CDEC
	movs r0, 0x1E
	bl sub_809CDEC
	movs r0, 0x1F
	bl sub_809CDEC
_08098C86:
	bl sub_809CE84
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8098AA8

	thumb_func_start get_preferred_box
get_preferred_box: @ 8098C90
	ldr r0, _08098C98
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08098C98: .4byte gPokemonStorage
	thumb_func_end get_preferred_box

	thumb_func_start sub_8098B48
sub_8098B48: @ 8098C9C
	push {r4,r5,lr}
	bl sub_809D51C
	movs r2, 0
	ldr r1, _08098D2C
	ldr r0, [r1]
	ldr r4, _08098D30
	adds r3, r0, r4
	movs r4, 0
	adds r5, r1, 0
_08098CB0:
	lsls r0, r2, 1
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x27
	bls _08098CB0
	movs r2, 0
	ldr r0, _08098D2C
	ldr r0, [r0]
	movs r1, 0x89
	lsls r1, 5
	adds r3, r0, r1
	movs r1, 0
_08098CCE:
	lsls r0, r2, 1
	adds r0, r3, r0
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x27
	bls _08098CCE
	movs r2, 0
	ldr r0, _08098D2C
	ldr r0, [r0]
	ldr r4, _08098D34
	adds r3, r0, r4
	movs r1, 0
_08098CEA:
	lsls r0, r2, 2
	adds r0, r3, r0
	str r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _08098CEA
	movs r2, 0
	ldr r0, _08098D2C
	ldr r0, [r0]
	ldr r1, _08098D38
	adds r3, r0, r1
	movs r1, 0
_08098D06:
	lsls r0, r2, 2
	adds r0, r3, r0
	str r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bls _08098D06
	ldr r0, [r5]
	ldr r2, _08098D3C
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r4, _08098D40
	adds r0, r4
	strh r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098D2C: .4byte gUnknown_083B6DB4
_08098D30: .4byte 0x000010d0
_08098D34: .4byte 0x00001038
_08098D38: .4byte 0x00001050
_08098D3C: .4byte 0x00001034
_08098D40: .4byte 0x00000d5c
	thumb_func_end sub_8098B48

	thumb_func_start sub_8098BF0
sub_8098BF0: @ 8098D44
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _08098D8C
	ldr r5, [r0]
	ldr r0, _08098D90
	adds r4, r5, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x7
	str r1, [sp, 0x4]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl sub_8099AFC
	ldr r1, _08098D94
	adds r5, r1
	str r0, [r5]
	ldr r1, _08098D98
	str r1, [r0, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098D8C: .4byte gUnknown_083B6DB4
_08098D90: .4byte 0x000025b4
_08098D94: .4byte 0x00001034
_08098D98: .4byte sub_80999C4
	thumb_func_end sub_8098BF0

	thumb_func_start sub_8098C48
sub_8098C48: @ 8098D9C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _08098E20
	adds r6, r0, r1
	movs r0, 0
	mov r8, r0
	movs r7, 0
_08098DBE:
	movs r5, 0
	adds r1, r7, 0x1
	mov r9, r1
_08098DC4:
	adds r0, r6, 0
	movs r1, 0x41
	bl GetBoxMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08098E2C
	adds r0, r6, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r2, r5, 1
	adds r2, r5
	lsls r2, 19
	movs r3, 0xC8
	lsls r3, 15
	adds r2, r3
	asrs r2, 16
	lsls r3, r7, 1
	adds r3, r7
	lsls r3, 19
	movs r0, 0xB0
	lsls r0, 14
	adds r3, r0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x12
	subs r0, r5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	asrs r3, 16
	bl sub_8099AFC
	ldr r1, _08098E24
	ldr r1, [r1]
	mov r3, r8
	lsls r2, r3, 2
	ldr r3, _08098E28
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	b _08098E3C
	.align 2, 0
_08098E20: .4byte gUnknown_020300A4
_08098E24: .4byte gUnknown_083B6DB4
_08098E28: .4byte 0x00001050
_08098E2C:
	ldr r0, _08098E6C
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, 2
	ldr r3, _08098E70
	adds r0, r3
	adds r0, r1
	str r4, [r0]
_08098E3C:
	adds r6, 0x50
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08098DC4
	mov r1, r9
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _08098DBE
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098E6C: .4byte gUnknown_083B6DB4
_08098E70: .4byte 0x00001050
	thumb_func_end sub_8098C48

	thumb_func_start sub_8098D20
sub_8098D20: @ 8098E74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r2, r1, 4
	subs r2, r1
	lsls r2, 5
	lsls r0, r4, 2
	mov r9, r0
	adds r0, r4
	lsls r0, 4
	ldr r1, _08098F28
	adds r0, r1
	adds r7, r2, r0
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _08098F18
	adds r0, r4, 0
	movs r1, 0x6
	bl __umodsi3
	adds r6, r0, 0
	lsls r0, r6, 24
	lsrs r0, 24
	lsls r5, r0, 1
	adds r5, r0
	lsls r5, 19
	movs r1, 0xC8
	lsls r1, 15
	adds r5, r1
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 19
	movs r2, 0xB0
	lsls r2, 14
	adds r4, r2
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x12
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8099AFC
	ldr r1, _08098F2C
	ldr r1, [r1]
	ldr r2, _08098F30
	adds r1, r2
	add r1, r9
	str r0, [r1]
_08098F18:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098F28: .4byte gUnknown_020300A4
_08098F2C: .4byte gUnknown_083B6DB4
_08098F30: .4byte 0x00001050
	thumb_func_end sub_8098D20

	thumb_func_start sub_8098DE0
sub_8098DE0: @ 8098F34
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r2, 0
	ldr r0, _08098F6C
	ldr r0, [r0]
	ldr r1, _08098F70
	adds r3, r0, r1
	movs r6, 0x1
	ldr r5, _08098F74
_08098F48:
	lsls r0, r2, 2
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r0, 0
	beq _08098F5C
	strh r4, [r0, 0x32]
	ldr r0, [r1]
	strh r6, [r0, 0x36]
	ldr r0, [r1]
	str r5, [r0, 0x1C]
_08098F5C:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bls _08098F48
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098F6C: .4byte gUnknown_083B6DB4
_08098F70: .4byte 0x00001050
_08098F74: .4byte sub_8098E68
	thumb_func_end sub_8098DE0

	thumb_func_start sub_8098E24
sub_8098E24: @ 8098F78
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08098F94
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	b _08098FAA
_08098F94:
	ldr r0, _08098FB0
	ldr r1, [r0]
	ldr r3, _08098FB4
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrh r0, [r2, 0x34]
	strh r0, [r2, 0x20]
	ldr r0, _08098FB8
	str r0, [r2, 0x1C]
_08098FAA:
	pop {r0}
	bx r0
	.align 2, 0
_08098FB0: .4byte gUnknown_083B6DB4
_08098FB4: .4byte 0x00001178
_08098FB8: .4byte SpriteCallbackDummy
	thumb_func_end sub_8098E24

	thumb_func_start sub_8098E68
sub_8098E68: @ 8098FBC
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x36]
	movs r3, 0x36
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08098FD0
	subs r0, r1, 0x1
	strh r0, [r2, 0x36]
	b _08098FEC
_08098FD0:
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x38]
	subs r0, 0x45
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB6
	bls _08098FEC
	ldr r0, _08098FF0
	str r0, [r2, 0x1C]
_08098FEC:
	pop {r0}
	bx r0
	.align 2, 0
_08098FF0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8098E68

	thumb_func_start sub_8098EA0
sub_8098EA0: @ 8098FF4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r0, _0809902C
	ldr r0, [r0]
	ldr r1, _08099030
	adds r7, r0, r1
_08099004:
	lsls r0, r5, 2
	adds r4, r7, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _08099016
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_08099016:
	adds r0, r5, 0x6
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _08099004
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809902C: .4byte gUnknown_083B6DB4
_08099030: .4byte 0x00001050
	thumb_func_end sub_8098EA0

	thumb_func_start sub_8098EE0
sub_8098EE0: @ 8099034
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	lsls r2, 16
	movs r0, 0x2C
	str r0, [sp, 0x10]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 19
	movs r1, 0xC8
	lsls r1, 15
	adds r0, r1
	lsrs r0, 16
	mov r10, r0
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	lsrs r3, r2, 16
	str r3, [sp, 0xC]
	asrs r2, 16
	adds r1, r0, 0
	muls r1, r2
	mov r4, r10
	subs r1, r4, r1
	movs r0, 0x12
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	movs r0, 0
	str r0, [sp, 0x14]
	mov r9, r0
	ldr r0, _0809914C
	ldr r0, [r0]
	ldr r2, _08099150
	adds r2, r0
	mov r8, r2
	ldr r3, _08099154
	adds r3, r0, r3
	str r3, [sp, 0x20]
	lsls r1, 16
	str r1, [sp, 0x1C]
_08099096:
	mov r4, r8
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r7, r6, 2
	adds r1, r7, r6
	lsls r1, 4
	ldr r2, _08099158
	adds r4, r1, r2
	adds r0, r4
	movs r1, 0x41
	bl GetBoxMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _0809911C
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	adds r0, r4
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	ldr r2, [sp, 0x10]
	lsls r3, r2, 16
	asrs r3, 16
	movs r0, 0x2
	str r0, [sp]
	ldr r4, [sp, 0x18]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	ldr r4, [sp, 0x1C]
	asrs r2, r4, 16
	bl sub_8099AFC
	ldr r2, [sp, 0x20]
	adds r1, r2, r7
	str r0, [r1]
	cmp r0, 0
	beq _0809911C
	mov r3, sp
	ldrh r3, [r3, 0x8]
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	mov r4, sp
	ldrh r4, [r4, 0xC]
	strh r4, [r0, 0x32]
	ldr r0, [r1]
	mov r2, r10
	strh r2, [r0, 0x34]
	ldr r1, [r1]
	ldr r0, _0809915C
	str r0, [r1, 0x1C]
	ldr r0, [sp, 0x14]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
_0809911C:
	adds r0, r6, 0x6
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x10]
	adds r0, 0x18
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x4
	bls _08099096
	ldr r0, [sp, 0x14]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809914C: .4byte gUnknown_083B6DB4
_08099150: .4byte 0x0000117d
_08099154: .4byte 0x00001050
_08099158: .4byte gUnknown_020300A4
_0809915C: .4byte sub_8098E24
	thumb_func_end sub_8098EE0

	thumb_func_start sub_809900C
sub_809900C: @ 8099160
	push {r4-r6,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _080991AC
	ldr r5, [r4]
	ldr r3, _080991B0
	adds r2, r5, r3
	movs r3, 0
	strb r3, [r2]
	ldr r6, _080991B4
	adds r2, r5, r6
	strb r0, [r2]
	ldr r2, _080991B8
	adds r0, r5, r2
	strb r1, [r0]
	subs r6, 0xB
	adds r2, r5, r6
	movs r0, 0x20
	strh r0, [r2]
	lsls r1, 24
	asrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	negs r0, r0
	adds r6, 0x4
	adds r2, r5, r6
	strh r0, [r2]
	ldr r2, _080991BC
	adds r0, r5, r2
	strh r3, [r0]
	cmp r1, 0
	ble _080991C4
	ldr r3, _080991C0
	adds r1, r5, r3
	movs r0, 0
	b _080991CA
	.align 2, 0
_080991AC: .4byte gUnknown_083B6DB4
_080991B0: .4byte 0x0000117c
_080991B4: .4byte 0x0000117d
_080991B8: .4byte 0x0000117b
_080991BC: .4byte 0x00001178
_080991C0: .4byte 0x0000117a
_080991C4:
	ldr r6, _080991F4
	adds r1, r5, r6
	movs r0, 0x5
_080991CA:
	strb r0, [r1]
	ldr r2, [r4]
	ldr r1, _080991F4
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x64
	ldr r3, _080991F8
	adds r1, r2, r3
	strh r0, [r1]
	ldr r6, _080991FC
	adds r2, r6
	movs r1, 0
	ldrsh r0, [r2, r1]
	bl sub_8098DE0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080991F4: .4byte 0x0000117a
_080991F8: .4byte 0x00001174
_080991FC: .4byte 0x00001176
	thumb_func_end sub_809900C

	thumb_func_start sub_80990AC
sub_80990AC: @ 8099200
	push {r4-r6,lr}
	ldr r0, _08099228
	ldr r4, [r0]
	ldr r0, _0809922C
	adds r3, r4, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _08099214
	subs r0, 0x1
	strh r0, [r3]
_08099214:
	ldr r1, _08099230
	adds r6, r4, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0809928C
	cmp r0, 0x1
	bgt _08099234
	cmp r0, 0
	beq _0809923C
	b _08099344
	.align 2, 0
_08099228: .4byte gUnknown_083B6DB4
_0809922C: .4byte 0x00001172
_08099230: .4byte 0x0000117c
_08099234:
	cmp r0, 0x2
	bne _0809923A
	b _08099334
_0809923A:
	b _08099344
_0809923C:
	ldr r2, _08099280
	adds r5, r4, r2
	ldr r3, _08099284
	adds r0, r4, r3
	ldrh r0, [r0]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBA
	bhi _08099258
	b _0809934C
_08099258:
	adds r2, 0x6
	adds r0, r4, r2
	ldrb r0, [r0]
	bl sub_8098EA0
	ldr r3, _08099288
	adds r0, r4, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _0809934C
	.align 2, 0
_08099280: .4byte 0x00001174
_08099284: .4byte 0x00001176
_08099288: .4byte 0x0000117b
_0809928C:
	ldr r2, _080992E8
	adds r1, r4, r2
	ldr r5, _080992EC
	adds r2, r4, r5
	ldrh r0, [r2]
	ldrh r5, [r1]
	adds r0, r5
	strh r0, [r1]
	ldr r0, _080992F0
	adds r5, r4, r0
	ldrb r0, [r5]
	ldrh r1, [r3]
	movs r3, 0
	ldrsh r2, [r2, r3]
	bl sub_8098EE0
	ldr r2, _080992F4
	adds r1, r4, r2
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _080992F8
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r1, 0
	ble _080992CC
	ldrb r0, [r5]
	cmp r0, 0x5
	beq _080992D6
_080992CC:
	cmp r1, 0
	bge _08099304
	ldrb r0, [r5]
	cmp r0, 0
	bne _08099304
_080992D6:
	ldr r0, _080992FC
	ldr r1, [r0]
	ldr r2, _08099300
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0809934C
	.align 2, 0
_080992E8: .4byte 0x00001174
_080992EC: .4byte 0x00001176
_080992F0: .4byte 0x0000117a
_080992F4: .4byte 0x00001178
_080992F8: .4byte 0x0000117b
_080992FC: .4byte gUnknown_083B6DB4
_08099300: .4byte 0x0000117c
_08099304:
	ldr r0, _08099324
	ldr r1, [r0]
	ldr r5, _08099328
	adds r3, r1, r5
	ldr r2, _0809932C
	adds r0, r1, r2
	ldrb r0, [r0]
	ldrb r5, [r3]
	adds r0, r5
	movs r2, 0
	strb r0, [r3]
	ldr r0, _08099330
	adds r1, r0
	strb r2, [r1]
	b _0809934C
	.align 2, 0
_08099324: .4byte gUnknown_083B6DB4
_08099328: .4byte 0x0000117a
_0809932C: .4byte 0x0000117b
_08099330: .4byte 0x0000117c
_08099334:
	ldr r1, _08099348
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809934C
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_08099344:
	movs r0, 0
	b _0809934E
	.align 2, 0
_08099348: .4byte 0x00001178
_0809934C:
	movs r0, 0x1
_0809934E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80990AC

	thumb_func_start sub_8099200
sub_8099200: @ 8099354
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080993F4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0x68
	movs r3, 0x40
	bl sub_8099AFC
	ldr r1, _080993F8
	ldr r1, [r1]
	ldr r2, _080993FC
	adds r1, r2
	str r0, [r1]
	movs r7, 0x1
	movs r6, 0x1
_0809939A:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _080993F4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _08099400
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	subs r0, r6, 0x1
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 19
	movs r0, 0x80
	lsls r0, 13
	adds r3, r0
	asrs r3, 16
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0x98
	bl sub_8099AFC
	ldr r1, _080993F8
	ldr r1, [r1]
	lsls r2, r6, 2
	ldr r3, _080993FC
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	b _0809940E
	.align 2, 0
_080993F4: .4byte gPlayerParty
_080993F8: .4byte gUnknown_083B6DB4
_080993FC: .4byte 0x00001038
_08099400:
	ldr r0, _0809945C
	ldr r0, [r0]
	lsls r1, r6, 2
	ldr r2, _08099460
	adds r0, r2
	adds r0, r1
	str r5, [r0]
_0809940E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _0809939A
	mov r3, r8
	cmp r3, 0
	bne _0809944E
	movs r6, 0
	cmp r6, r7
	bcs _0809944E
	ldr r0, _0809945C
	ldr r0, [r0]
	ldr r1, _08099460
	adds r3, r0, r1
	movs r4, 0x4
_0809942E:
	lsls r1, r6, 2
	adds r1, r3, r1
	ldr r2, [r1]
	ldrh r0, [r2, 0x22]
	subs r0, 0xA0
	strh r0, [r2, 0x22]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _0809942E
_0809944E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809945C: .4byte gUnknown_083B6DB4
_08099460: .4byte 0x00001038
	thumb_func_end sub_8099200

	thumb_func_start sub_8099310
sub_8099310: @ 8099464
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080994BC
	ldr r2, [r0]
	ldr r0, _080994C0
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	movs r6, 0
	mov r8, r2
	ldr r7, _080994C0
	add r7, r8
_08099480:
	lsls r1, r5, 2
	ldr r0, _080994C4
	add r0, r8
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080994A8
	cmp r5, r6
	beq _080994A2
	adds r1, r6, 0
	bl sub_8099388
	movs r0, 0
	str r0, [r4]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_080994A2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080994A8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08099480
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080994BC: .4byte gUnknown_083B6DB4
_080994C0: .4byte 0x00001171
_080994C4: .4byte 0x00001038
	thumb_func_end sub_8099310

	thumb_func_start sub_8099374
sub_8099374: @ 80994C8
	ldr r0, _080994D4
	ldr r0, [r0]
	ldr r1, _080994D8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080994D4: .4byte gUnknown_083B6DB4
_080994D8: .4byte 0x00001171
	thumb_func_end sub_8099374

	thumb_func_start sub_8099388
sub_8099388: @ 80994DC
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	strh r1, [r2, 0x30]
	cmp r1, 0
	bne _080994F0
	movs r3, 0x68
	movs r4, 0x40
	b _08099502
_080994F0:
	movs r3, 0x98
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 19
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
_08099502:
	ldrh r0, [r2, 0x20]
	lsls r0, 3
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x22]
	lsls r0, 3
	strh r0, [r2, 0x34]
	lsls r1, r3, 3
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, 0
	bge _0809951C
	adds r0, 0x7
_0809951C:
	asrs r0, 3
	strh r0, [r2, 0x36]
	lsls r0, r4, 16
	asrs r0, 13
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	subs r0, r1
	cmp r0, 0
	bge _08099530
	adds r0, 0x7
_08099530:
	asrs r0, 3
	strh r0, [r2, 0x38]
	movs r0, 0x8
	strh r0, [r2, 0x3A]
	ldr r0, _08099544
	str r0, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099544: .4byte sub_80993F4
	thumb_func_end sub_8099388

	thumb_func_start sub_80993F4
sub_80993F4: @ 8099548
	push {r4,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08099578
	ldrh r0, [r3, 0x36]
	ldrh r4, [r3, 0x32]
	adds r0, r4
	strh r0, [r3, 0x32]
	ldrh r1, [r3, 0x38]
	ldrh r4, [r3, 0x34]
	adds r1, r4
	strh r1, [r3, 0x34]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r3, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r3, 0x22]
	subs r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _080995BC
_08099578:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08099588
	movs r0, 0x68
	strh r0, [r3, 0x20]
	movs r0, 0x40
	b _0809959A
_08099588:
	movs r0, 0x98
	strh r0, [r3, 0x20]
	movs r4, 0x30
	ldrsh r1, [r3, r4]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x10
_0809959A:
	strh r0, [r3, 0x22]
	ldr r0, _080995C4
	str r0, [r3, 0x1C]
	ldr r0, _080995C8
	ldr r2, [r0]
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r1, 2
	ldr r4, _080995CC
	adds r0, r2, r4
	adds r0, r1
	str r3, [r0]
	ldr r0, _080995D0
	adds r2, r0
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
_080995BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080995C4: .4byte SpriteCallbackDummy
_080995C8: .4byte gUnknown_083B6DB4
_080995CC: .4byte 0x00001038
_080995D0: .4byte 0x00001171
	thumb_func_end sub_80993F4

	thumb_func_start sub_8099480
sub_8099480: @ 80995D4
	push {r4,lr}
	ldr r0, _080995F4
	ldr r0, [r0]
	ldr r1, _080995F8
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080995EC
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_080995EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080995F4: .4byte gUnknown_083B6DB4
_080995F8: .4byte 0x00001034
	thumb_func_end sub_8099480

	thumb_func_start sub_80994A8
sub_80994A8: @ 80995FC
	push {r4-r6,lr}
	movs r3, 0
	ldr r1, _08099650
	ldr r1, [r1]
	ldr r2, _08099654
	adds r5, r1, r2
	lsls r0, 16
	asrs r4, r0, 16
	movs r6, 0x5
	negs r6, r6
_08099610:
	lsls r0, r3, 2
	adds r2, r5, r0
	ldr r1, [r2]
	cmp r1, 0
	beq _08099662
	ldrh r0, [r1, 0x22]
	adds r0, r4, r0
	strh r0, [r1, 0x22]
	ldr r2, [r2]
	ldrh r1, [r2, 0x26]
	ldrh r0, [r2, 0x22]
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	cmp r0, 0xC0
	bls _08099658
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08099662
	.align 2, 0
_08099650: .4byte gUnknown_083B6DB4
_08099654: .4byte 0x00001038
_08099658:
	adds r2, 0x3E
	ldrb r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2]
_08099662:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08099610
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80994A8

	thumb_func_start sub_8099520
sub_8099520: @ 8099674
	push {r4,lr}
	lsls r0, 24
	ldr r1, _08099698
	ldr r1, [r1]
	lsrs r0, 22
	ldr r2, _0809969C
	adds r1, r2
	adds r4, r1, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _08099692
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_08099692:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099698: .4byte gUnknown_083B6DB4
_0809969C: .4byte 0x00001038
	thumb_func_end sub_8099520

	thumb_func_start sub_809954C
sub_809954C: @ 80996A0
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _080996D0
	ldr r0, [r0]
	ldr r1, _080996D4
	adds r6, r0, r1
_080996AC:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080996BE
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_080996BE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _080996AC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080996D0: .4byte gUnknown_083B6DB4
_080996D4: .4byte 0x00001038
	thumb_func_end sub_809954C

	thumb_func_start sub_8099584
sub_8099584: @ 80996D8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	cmp r4, 0
	bne _08099708
	ldr r3, _08099700
	ldr r0, [r3]
	ldr r5, _08099704
	adds r2, r0, r5
	lsls r1, 2
	adds r5, 0x4
	adds r0, r5
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r4, [r0]
	b _08099724
	.align 2, 0
_08099700: .4byte gUnknown_083B6DB4
_08099704: .4byte 0x00001034
_08099708:
	cmp r4, 0x1
	bne _08099748
	ldr r3, _08099750
	ldr r0, [r3]
	ldr r1, _08099754
	adds r2, r0, r1
	lsls r1, r5, 2
	ldr r4, _08099758
	adds r0, r4
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	movs r1, 0
	str r1, [r0]
_08099724:
	ldr r2, [r3]
	ldr r5, _08099754
	adds r2, r5
	ldr r1, [r2]
	ldr r0, _0809975C
	str r0, [r1, 0x1C]
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	adds r0, 0x43
	movs r1, 0x7
	strb r1, [r0]
_08099748:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099750: .4byte gUnknown_083B6DB4
_08099754: .4byte 0x00001034
_08099758: .4byte 0x00001050
_0809975C: .4byte sub_80999C4
	thumb_func_end sub_8099584

	thumb_func_start sub_809960C
sub_809960C: @ 8099760
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r0, 0xE
	bne _080997A8
	ldr r4, _0809979C
	ldr r0, [r4]
	lsls r1, r6, 2
	ldr r2, _080997A0
	adds r3, r0, r2
	adds r3, r1
	ldr r1, _080997A4
	adds r0, r1
	ldr r2, [r0]
	str r2, [r3]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r3]
	adds r0, 0x43
	movs r1, 0xB
	strb r1, [r0]
	b _080997DE
	.align 2, 0
_0809979C: .4byte gUnknown_083B6DB4
_080997A0: .4byte 0x00001038
_080997A4: .4byte 0x00001034
_080997A8:
	ldr r5, _080997F4
	ldr r0, [r5]
	lsls r1, r6, 2
	ldr r2, _080997F8
	adds r3, r0, r2
	adds r3, r1
	ldr r1, _080997FC
	adds r0, r1
	ldr r2, [r0]
	str r2, [r3]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r4, [r3]
	adds r0, r6, 0
	movs r1, 0x6
	bl __umodsi3
	movs r1, 0x12
	subs r1, r0
	adds r4, 0x43
	strb r1, [r4]
	adds r4, r5, 0
_080997DE:
	ldr r1, [r4]
	ldr r2, _080997FC
	adds r1, r2
	ldr r2, [r1]
	ldr r0, _08099800
	str r0, [r2, 0x1C]
	movs r0, 0
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080997F4: .4byte gUnknown_083B6DB4
_080997F8: .4byte 0x00001050
_080997FC: .4byte 0x00001034
_08099800: .4byte SpriteCallbackDummy
	thumb_func_end sub_809960C

	thumb_func_start sub_80996B0
sub_80996B0: @ 8099804
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r0, 0xE
	bne _0809982C
	ldr r3, _08099820
	ldr r1, [r3]
	ldr r0, _08099824
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08099828
	b _08099838
	.align 2, 0
_08099820: .4byte gUnknown_083B6DB4
_08099824: .4byte 0x000010c8
_08099828: .4byte 0x00001038
_0809982C:
	ldr r3, _08099858
	ldr r1, [r3]
	ldr r0, _0809985C
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08099860
_08099838:
	adds r0, r4
	adds r1, r0
	str r1, [r2]
	ldr r1, [r3]
	ldr r2, _08099864
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _08099868
	str r0, [r2, 0x1C]
	ldr r4, _0809986C
	adds r1, r4
	movs r0, 0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099858: .4byte gUnknown_083B6DB4
_0809985C: .4byte 0x000010c8
_08099860: .4byte 0x00001050
_08099864: .4byte 0x00001034
_08099868: .4byte SpriteCallbackDummy
_0809986C: .4byte 0x00001170
	thumb_func_end sub_80996B0

	thumb_func_start sub_809971C
sub_809971C: @ 8099870
	push {r4-r7,lr}
	ldr r0, _08099884
	ldr r2, [r0]
	ldr r0, _08099888
	adds r7, r2, r0
	ldrb r0, [r7]
	cmp r0, 0x10
	bne _0809988C
	movs r0, 0
	b _08099954
	.align 2, 0
_08099884: .4byte gUnknown_083B6DB4
_08099888: .4byte 0x00001170
_0809988C:
	adds r0, 0x1
	strb r0, [r7]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080998B2
	ldr r1, _0809995C
	adds r0, r2, r1
	ldr r0, [r0]
	ldr r1, [r0]
	ldrh r0, [r1, 0x22]
	subs r0, 0x1
	strh r0, [r1, 0x22]
	ldr r4, _08099960
	adds r0, r2, r4
	ldr r1, [r0]
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
_080998B2:
	ldr r0, _0809995C
	adds r5, r2, r0
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r3, _08099964
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bge _080998CC
	adds r0, 0xF
_080998CC:
	asrs r0, 4
	strh r0, [r1, 0x24]
	ldr r0, _08099960
	adds r6, r2, r0
	ldr r1, [r6]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080998E6
	adds r0, 0xF
_080998E6:
	asrs r0, 4
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrb r0, [r7]
	cmp r0, 0x8
	bne _08099932
	ldr r4, [r6]
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	movs r2, 0xC
	ands r2, r0
	ldrb r3, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldr r2, [r6]
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, 0x43
	ldrb r0, [r0]
	adds r2, 0x43
	strb r0, [r2]
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r0, [r2, 0x5]
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r2, 0x5]
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0x7
	strb r1, [r0]
_08099932:
	ldrb r0, [r7]
	cmp r0, 0x10
	bne _08099952
	ldr r1, [r6]
	ldr r0, [r5]
	ldr r0, [r0]
	str r0, [r6]
	ldr r0, [r5]
	str r1, [r0]
	ldr r1, [r6]
	ldr r0, _08099968
	str r0, [r1, 0x1C]
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r0, _0809996C
	str r0, [r1, 0x1C]
_08099952:
	movs r0, 0x1
_08099954:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809995C: .4byte 0x000010c8
_08099960: .4byte 0x00001034
_08099964: .4byte gSineTable
_08099968: .4byte sub_80999C4
_0809996C: .4byte SpriteCallbackDummy
	thumb_func_end sub_809971C

	thumb_func_start sub_809981C
sub_809981C: @ 8099970
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r0, 0x1
	beq _080999AC
	cmp r0, 0x1
	bgt _0809998A
	cmp r0, 0
	beq _08099990
	b _08099A14
_0809998A:
	cmp r2, 0x2
	beq _080999D0
	b _08099A14
_08099990:
	ldr r3, _080999A0
	ldr r1, [r3]
	ldr r0, _080999A4
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _080999A8
	b _080999B8
	.align 2, 0
_080999A0: .4byte gUnknown_083B6DB4
_080999A4: .4byte 0x000010cc
_080999A8: .4byte 0x00001038
_080999AC:
	ldr r3, _080999C4
	ldr r1, [r3]
	ldr r0, _080999C8
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _080999CC
_080999B8:
	adds r0, r4
	adds r1, r0
	str r1, [r2]
	adds r0, r3, 0
	b _080999DE
	.align 2, 0
_080999C4: .4byte gUnknown_083B6DB4
_080999C8: .4byte 0x000010cc
_080999CC: .4byte 0x00001050
_080999D0:
	ldr r0, _08099A1C
	ldr r1, [r0]
	ldr r3, _08099A20
	adds r2, r1, r3
	ldr r4, _08099A24
	adds r1, r4
	str r1, [r2]
_080999DE:
	ldr r0, [r0]
	ldr r1, _08099A20
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _08099A14
	bl InitSpriteAffineAnim
	ldr r0, [r4]
	ldr r2, [r0]
	ldrb r1, [r2, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, _08099A28
	str r0, [r1, 0x10]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAffineAnim
_08099A14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099A1C: .4byte gUnknown_083B6DB4
_08099A20: .4byte 0x000010cc
_08099A24: .4byte 0x00001034
_08099A28: .4byte gUnknown_083B6F5C
	thumb_func_end sub_809981C

	thumb_func_start sub_80998D8
sub_80998D8: @ 8099A2C
	push {lr}
	ldr r0, _08099A50
	ldr r0, [r0]
	ldr r1, _08099A54
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r1, 0
	beq _08099A4C
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _08099A58
_08099A4C:
	movs r0, 0
	b _08099A6E
	.align 2, 0
_08099A50: .4byte gUnknown_083B6DB4
_08099A54: .4byte 0x000010cc
_08099A58:
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08099A6C
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r3]
_08099A6C:
	movs r0, 0x1
_08099A6E:
	pop {r1}
	bx r1
	thumb_func_end sub_80998D8

	thumb_func_start sub_8099920
sub_8099920: @ 8099A74
	push {r4,lr}
	ldr r0, _08099AA4
	ldr r0, [r0]
	ldr r1, _08099AA8
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _08099A9E
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_8099BE0
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_08099A9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099AA4: .4byte gUnknown_083B6DB4
_08099AA8: .4byte 0x000010cc
	thumb_func_end sub_8099920

	thumb_func_start sub_8099958
sub_8099958: @ 8099AAC
	push {lr}
	ldr r0, _08099ADC
	ldr r0, [r0]
	ldr r1, _08099AE0
	adds r3, r0, r1
	ldr r0, [r3]
	ldr r0, [r0]
	cmp r0, 0
	beq _08099AD6
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08099AD6:
	pop {r0}
	bx r0
	.align 2, 0
_08099ADC: .4byte gUnknown_083B6DB4
_08099AE0: .4byte 0x000010cc
	thumb_func_end sub_8099958

	thumb_func_start sub_8099990
sub_8099990: @ 8099AE4
	push {lr}
	ldr r0, _08099AF8
	ldr r0, [r0]
	ldr r1, _08099AFC
	adds r2, r0, r1
	ldr r0, [r2]
	cmp r0, 0
	bne _08099B00
	movs r0, 0
	b _08099B14
	.align 2, 0
_08099AF8: .4byte gUnknown_083B6DB4
_08099AFC: .4byte 0x000010cc
_08099B00:
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08099B12
	movs r0, 0
	str r0, [r2]
_08099B12:
	movs r0, 0x1
_08099B14:
	pop {r1}
	bx r1
	thumb_func_end sub_8099990

	thumb_func_start sub_80999C4
sub_80999C4: @ 8099B18
	ldr r1, _08099B38
	ldr r1, [r1]
	movs r2, 0x8E
	lsls r2, 5
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r2, [r1]
	ldrh r1, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r1, r2
	adds r1, 0x4
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08099B38: .4byte gUnknown_083B6DB4
	thumb_func_end sub_80999C4

	thumb_func_start sub_80999E8
sub_80999E8: @ 8099B3C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r4, 0
	ldr r1, _08099BAC
	ldr r0, [r1]
	movs r2, 0x89
	lsls r2, 5
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, r3
	beq _08099B74
	adds r6, r2, 0
	movs r5, 0x89
	lsls r5, 5
_08099B5C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x27
	bhi _08099B74
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r0, r5
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _08099B5C
_08099B74:
	cmp r4, 0x28
	bne _08099BB4
	movs r4, 0
	ldr r0, [r2]
	movs r5, 0x89
	lsls r5, 5
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08099BA2
	adds r6, r2, 0
_08099B8A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x27
	bhi _08099BA2
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r0, r5
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08099B8A
_08099BA2:
	cmp r4, 0x28
	bne _08099BB4
	ldr r0, _08099BB0
	b _08099BE8
	.align 2, 0
_08099BAC: .4byte gUnknown_083B6DB4
_08099BB0: .4byte 0x0000ffff
_08099BB4:
	ldr r1, [r2]
	lsls r2, r4, 1
	movs r5, 0x89
	lsls r5, 5
	adds r0, r1, r5
	adds r0, r2
	strh r3, [r0]
	ldr r0, _08099BF0
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r4, 20
	lsrs r4, 16
	ldr r1, _08099BF4
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r4, 5
	ldr r2, _08099BF8
	adds r1, r2
	ldr r2, _08099BFC
	bl CpuSet
	adds r0, r4, 0
_08099BE8:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08099BF0: .4byte 0x000010d0
_08099BF4: .4byte gMonIconTable
_08099BF8: .4byte 0x06010000
_08099BFC: .4byte 0x04000080
	thumb_func_end sub_80999E8

	thumb_func_start sub_8099AAC
sub_8099AAC: @ 8099C00
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r3, 0
	ldr r0, _08099C38
	ldr r0, [r0]
	movs r1, 0x89
	lsls r1, 5
	adds r5, r0, r1
	subs r1, 0x50
	adds r4, r0, r1
	ldr r0, _08099C3C
	adds r7, r0, 0
_08099C1A:
	lsls r1, r3, 1
	adds r2, r5, r1
	ldrh r0, [r2]
	cmp r0, r6
	bne _08099C40
	adds r1, r4, r1
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ands r0, r7
	cmp r0, 0
	bne _08099C4A
	strh r0, [r2]
	b _08099C4A
	.align 2, 0
_08099C38: .4byte gUnknown_083B6DB4
_08099C3C: .4byte 0x0000ffff
_08099C40:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x27
	bls _08099C1A
_08099C4A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8099AAC

	thumb_func_start sub_8099AFC
sub_8099AFC: @ 8099C50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x18]
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	mov r2, sp
	ldr r0, _08099D00
	ldm r0!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	adds r0, r6, 0
	bl mon_icon_convert_unown_species_id
	mov r10, r0
	mov r6, r10
	mov r2, sp
	ldr r1, _08099D04
	adds r1, r6, r1
	ldr r3, _08099D08
	adds r0, r3, 0
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2, 0x2]
	adds r0, r6, 0
	bl sub_80999E8
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	ldr r0, _08099D0C
	cmp r5, r0
	beq _08099D22
	ldr r7, [sp, 0x18]
	lsls r1, r7, 16
	asrs r1, 16
	mov r0, r8
	lsls r2, r0, 16
	asrs r2, 16
	mov r0, sp
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08099D1C
	ldr r1, _08099D10
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldr r2, _08099D14
	ands r2, r5
	ldrh r3, [r0, 0x4]
	ldr r1, _08099D18
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	movs r1, 0x3
	ands r4, r1
	lsls r3, r4, 2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, 0x5]
	mov r1, r10
	strh r1, [r0, 0x2E]
	b _08099D24
	.align 2, 0
_08099D00: .4byte gSpriteTemplate_83B6F14
_08099D04: .4byte gMonIconPaletteIndices
_08099D08: .4byte 0x0000dac0
_08099D0C: .4byte 0x0000ffff
_08099D10: .4byte gSprites
_08099D14: .4byte 0x000003ff
_08099D18: .4byte 0xfffffc00
_08099D1C:
	adds r0, r6, 0
	bl sub_8099AAC
_08099D22:
	movs r0, 0
_08099D24:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8099AFC

	thumb_func_start sub_8099BE0
sub_8099BE0: @ 8099D34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	bl sub_8099AAC
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8099BE0

	thumb_func_start sub_8099BF8
sub_8099BF8: @ 8099D4C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08099DA4
	ldr r0, [r0]
	ldr r1, _08099DA8
	adds r2, r0, r1
	movs r1, 0
	strb r1, [r2]
	ldr r2, _08099DAC
	adds r0, r2
	strh r1, [r0]
	str r1, [sp]
	ldr r1, _08099DB0
	mov r0, sp
	str r0, [r1]
	ldr r0, _08099DB4
	str r0, [r1, 0x4]
	ldr r0, _08099DB8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8099EB0
	adds r0, r4, 0
	bl sub_809A23C
	bl sub_809A6DC
	adds r0, r4, 0
	bl sub_8098C48
	ldr r1, _08099DBC
	ldr r2, _08099DC0
	adds r0, r2, 0
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099DA4: .4byte gUnknown_083B6DB4
_08099DA8: .4byte 0x000008ba
_08099DAC: .4byte 0x000008b4
_08099DB0: .4byte 0x040000d4
_08099DB4: .4byte 0x0600d000
_08099DB8: .4byte 0x85000400
_08099DBC: .4byte 0x0400000c
_08099DC0: .4byte 0x00005a0a
	thumb_func_end sub_8099BF8

	thumb_func_start sub_8099C70
sub_8099C70: @ 8099DC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	bl sub_8099D90
	lsls r0, 24
	asrs r4, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8099EB0
	ldr r0, _08099E64
	ldr r2, [r0]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 1
	ldr r3, _08099E68
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _08099E6C
	adds r1, r2, r0
	movs r0, 0x20
	strh r0, [r1]
	ldr r1, _08099E70
	adds r0, r2, r1
	strb r5, [r0]
	movs r1, 0
	cmp r4, 0
	bgt _08099E02
	movs r1, 0x5
_08099E02:
	ldr r3, _08099E74
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _08099E78
	adds r0, r2, r1
	strh r4, [r0]
	movs r1, 0x38
	cmp r4, 0
	ble _08099E1A
	movs r3, 0x84
	lsls r3, 1
	adds r1, r3, 0
_08099E1A:
	movs r3, 0x8C
	lsls r3, 4
	adds r0, r2, r3
	strh r1, [r0]
	movs r1, 0
	cmp r4, 0
	bgt _08099E2A
	movs r1, 0x5
_08099E2A:
	ldr r3, _08099E7C
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _08099E80
	adds r0, r2, r1
	strh r4, [r0]
	adds r3, 0x4
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08099E84
	adds r1, r2, r0
	movs r0, 0x2
	strh r0, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_809900C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_809A3D0
	adds r0, r4, 0
	bl sub_809A774
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099E64: .4byte gUnknown_083B6DB4
_08099E68: .4byte 0x000008b6
_08099E6C: .4byte 0x000008b8
_08099E70: .4byte 0x000008bb
_08099E74: .4byte 0x000008bc
_08099E78: .4byte 0x000008be
_08099E7C: .4byte 0x000008c2
_08099E80: .4byte 0x000008c4
_08099E84: .4byte 0x000008c8
	thumb_func_end sub_8099C70

	thumb_func_start sub_8099D34
sub_8099D34: @ 8099E88
	push {r4,lr}
	bl sub_80990AC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08099ECC
	ldr r1, [r0]
	ldr r0, _08099ED0
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _08099EDC
	ldr r4, _08099ED4
	adds r2, r1, r4
	adds r4, 0x2
	adds r0, r1, r4
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r1
	ldr r1, _08099ED8
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _08099EC8
	bl sub_809A598
	bl sub_809A810
_08099EC8:
	movs r0, 0x1
	b _08099EDE
	.align 2, 0
_08099ECC: .4byte gUnknown_083B6DB4
_08099ED0: .4byte 0x000008b8
_08099ED4: .4byte 0x000008b4
_08099ED8: .4byte 0x000001ff
_08099EDC:
	adds r0, r2, 0
_08099EDE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8099D34

	thumb_func_start sub_8099D90
sub_8099D90: @ 8099EE4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl get_preferred_box
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0
	cmp r1, r4
	beq _08099F0E
_08099EF8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xD
	bls _08099F04
	movs r1, 0
_08099F04:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r1, r4
	bne _08099EF8
_08099F0E:
	movs r0, 0x1
	negs r0, r0
	cmp r2, 0x6
	bhi _08099F18
	movs r0, 0x1
_08099F18:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8099D90

	thumb_func_start sub_8099DCC
sub_8099DCC: @ 8099F20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08099F4C
	ldr r2, _08099F50
	adds r1, r2
	adds r0, r1
	movs r1, 0
	strb r4, [r0]
	ldr r0, _08099F54
	ldr r0, [r0]
	ldr r2, _08099F58
	adds r0, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099F4C: .4byte gPokemonStorage
_08099F50: .4byte 0x000083c2
_08099F54: .4byte gUnknown_083B6DB4
_08099F58: .4byte 0x00001032
	thumb_func_end sub_8099DCC

	thumb_func_start sub_8099E08
sub_8099E08: @ 8099F5C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08099F78
	ldr r5, [r0]
	ldr r0, _08099F7C
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08099FA8
	cmp r0, 0x1
	bgt _08099F80
	cmp r0, 0
	beq _08099F8A
	b _08099FFA
	.align 2, 0
_08099F78: .4byte gUnknown_083B6DB4
_08099F7C: .4byte 0x00001032
_08099F80:
	cmp r0, 0x2
	beq _08099FE4
	cmp r0, 0x3
	beq _08099FF6
	b _08099FFA
_08099F8A:
	ldr r1, _08099FA0
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _08099FA4
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08099FEE
	.align 2, 0
_08099FA0: .4byte 0x00000d08
_08099FA4: .4byte 0x0000ffff
_08099FA8:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08099FFA
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8099EB0
	bl sub_809A654
	ldr r1, _08099FDC
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _08099FE0
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08099FEE
	.align 2, 0
_08099FDC: .4byte 0x00000d08
_08099FE0: .4byte 0x0000ffff
_08099FE4:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08099FFA
_08099FEE:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08099FFA
_08099FF6:
	movs r0, 0
	b _08099FFC
_08099FFA:
	movs r0, 0x1
_08099FFC:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8099E08

	thumb_func_start sub_8099EB0
sub_8099EB0: @ 809A004
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r1, 0
	beq _0809A02C
	ldr r0, _0809A08C
	ldr r0, [r0]
	movs r2, 0
	ldr r3, _0809A090
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _0809A024
	movs r2, 0x1
_0809A024:
	strb r2, [r1]
	ldr r0, _0809A094
	bl sub_809A14C
_0809A02C:
	ldr r0, _0809A098
	ldr r1, _0809A09C
	adds r0, r1
	adds r0, r4, r0
	ldrb r4, [r0]
	lsls r4, 4
	ldr r0, _0809A0A0
	adds r4, r0
	ldr r0, [r4, 0xC]
	ldr r1, _0809A08C
	ldr r5, [r1]
	ldr r2, _0809A090
	adds r6, r5, r2
	ldrb r2, [r6]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 20
	movs r3, 0x80
	lsls r3, 15
	adds r1, r3
	lsrs r1, 16
	movs r2, 0x60
	bl LoadPalette
	ldr r0, [r4, 0x8]
	ldr r1, _0809A0A4
	adds r5, r1
	adds r1, r5, 0
	bl LZ77UnCompWram
	ldr r0, _0809A094
	lsls r2, r7, 24
	asrs r2, 24
	ldrb r3, [r6]
	adds r1, r5, 0
	bl sub_8099F58
	ldr r0, [r4]
	ldrb r1, [r6]
	lsls r1, 13
	ldr r2, _0809A0A8
	adds r1, r2
	bl LZ77UnCompVram
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A08C: .4byte gUnknown_083B6DB4
_0809A090: .4byte 0x000008ba
_0809A094: .4byte 0x0600d000
_0809A098: .4byte gPokemonStorage
_0809A09C: .4byte 0x000083c2
_0809A0A0: .4byte gWallpaperTable
_0809A0A4: .4byte 0x00000d62
_0809A0A8: .4byte 0x06008000
	thumb_func_end sub_8099EB0

	thumb_func_start sub_8099F58
sub_8099F58: @ 809A0AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r9, r0
	adds r5, r1, 0
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, r3, 8
	str r0, [sp]
	lsls r0, r3, 1
	adds r0, r3
	adds r0, 0x4
	lsls r0, 28
	lsrs r0, 16
	str r0, [sp, 0x4]
	ldr r0, _0809A10C
	ldr r0, [r0]
	ldr r1, _0809A110
	adds r0, r1
	ldrh r1, [r0]
	lsrs r1, 3
	adds r1, 0xA
	lsrs r0, r2, 24
	mov r8, r0
	asrs r2, 24
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	movs r0, 0x3F
	ands r1, r0
	str r1, [sp, 0x8]
	adds r2, r1, 0
	cmp r2, 0xC
	bgt _0809A114
	movs r6, 0x14
	movs r3, 0
	lsls r0, r2, 1
	adds r0, 0x80
	mov r1, r9
	adds r4, r1, r0
	movs r7, 0
	b _0809A174
	.align 2, 0
_0809A10C: .4byte gUnknown_083B6DB4
_0809A110: .4byte 0x000008b4
_0809A114:
	cmp r2, 0x1F
	bgt _0809A13A
	movs r0, 0x20
	subs r0, r2
	lsls r0, 16
	movs r1, 0x14
	lsrs r6, r0, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r0, r2, 1
	adds r0, 0x80
	mov r2, r9
	adds r4, r2, r0
	movs r7, 0x88
	lsls r7, 4
	add r7, r9
	b _0809A174
_0809A13A:
	cmp r2, 0x2C
	bgt _0809A152
	movs r6, 0x14
	movs r3, 0
	lsls r0, r2, 1
	movs r1, 0x84
	lsls r1, 4
	adds r0, r1
	mov r2, r9
	adds r4, r2, r0
	movs r7, 0
	b _0809A174
_0809A152:
	movs r0, 0x40
	subs r0, r2
	lsls r0, 16
	movs r1, 0x14
	lsrs r6, r0, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r0, r2, 1
	movs r1, 0x84
	lsls r1, 4
	adds r0, r1
	mov r2, r9
	adds r4, r2, r0
	mov r7, r9
	adds r7, 0x80
_0809A174:
	movs r1, 0
	mov r0, r8
	lsls r0, 24
	str r0, [sp, 0x14]
	lsls r0, r6, 16
	asrs r0, 16
	mov r8, r0
	lsls r3, 16
	str r3, [sp, 0xC]
	asrs r2, r3, 16
	str r2, [sp, 0x10]
_0809A18A:
	movs r3, 0
	adds r0, r4, 0
	adds r0, 0x40
	str r0, [sp, 0x18]
	adds r2, r7, 0
	adds r2, 0x40
	str r2, [sp, 0x1C]
	adds r1, 0x1
	mov r10, r1
	cmp r3, r8
	bge _0809A1CE
	ldr r0, _0809A228
	mov r12, r0
	movs r6, 0xF0
	lsls r6, 8
_0809A1A8:
	ldrh r2, [r5]
	mov r0, r12
	ands r0, r2
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, r6, 0
	ands r1, r2
	ldr r2, [sp, 0x4]
	adds r1, r2, r1
	orrs r1, r0
	lsls r0, r3, 1
	adds r0, r4
	strh r1, [r0]
	adds r5, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r8
	blt _0809A1A8
_0809A1CE:
	movs r3, 0
	ldr r0, [sp, 0x10]
	cmp r3, r0
	bge _0809A208
	ldr r1, _0809A228
	mov r12, r1
	movs r6, 0xF0
	lsls r6, 8
	ldr r2, [sp, 0xC]
	asrs r4, r2, 16
_0809A1E2:
	ldrh r2, [r5]
	mov r0, r12
	ands r0, r2
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, r6, 0
	ands r1, r2
	ldr r2, [sp, 0x4]
	adds r1, r2, r1
	orrs r1, r0
	lsls r0, r3, 1
	adds r0, r7
	strh r1, [r0]
	adds r5, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _0809A1E2
_0809A208:
	ldr r4, [sp, 0x18]
	ldr r7, [sp, 0x1C]
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0x11
	bls _0809A18A
	ldr r0, [sp, 0x14]
	asrs r2, r0, 24
	cmp r2, 0
	beq _0809A28E
	cmp r2, 0
	ble _0809A22C
	ldr r1, [sp, 0x8]
	adds r1, 0x14
	b _0809A230
	.align 2, 0
_0809A228: .4byte 0x00000fff
_0809A22C:
	ldr r1, [sp, 0x8]
	subs r1, 0x4
_0809A230:
	movs r0, 0x3F
	ands r1, r0
	adds r4, r1, 0
	adds r0, r4, 0
	cmp r0, 0x1F
	bgt _0809A242
	lsls r0, 1
	adds r0, 0x80
	b _0809A24A
_0809A242:
	lsls r0, 1
	movs r2, 0x84
	lsls r2, 4
	adds r0, r2
_0809A24A:
	mov r1, r9
	adds r2, r1, r0
	movs r3, 0
	movs r6, 0
_0809A252:
	movs r1, 0
	adds r5, r3, 0x1
	lsls r3, r4, 16
_0809A258:
	strh r6, [r2]
	adds r2, 0x40
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x11
	bls _0809A258
	asrs r0, r3, 16
	adds r4, r0, 0x1
	movs r0, 0x3F
	ands r4, r0
	adds r0, r4, 0
	cmp r0, 0x1F
	bgt _0809A27A
	lsls r0, 1
	adds r0, 0x80
	b _0809A282
_0809A27A:
	lsls r0, 1
	movs r2, 0x84
	lsls r2, 4
	adds r0, r2
_0809A282:
	mov r1, r9
	adds r2, r1, r0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _0809A252
_0809A28E:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8099F58

	thumb_func_start sub_809A14C
sub_809A14C: @ 809A2A0
	push {r4-r6,lr}
	adds r2, r0, 0
	ldr r0, _0809A2C8
	ldr r0, [r0]
	ldr r1, _0809A2CC
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 3
	adds r3, r0, 0
	adds r3, 0x1E
	movs r0, 0x3F
	ands r3, r0
	adds r0, r3, 0
	cmp r0, 0x1F
	bgt _0809A2D0
	lsls r0, 1
	movs r6, 0x98
	lsls r6, 3
	adds r0, r6
	b _0809A2D8
	.align 2, 0
_0809A2C8: .4byte gUnknown_083B6DB4
_0809A2CC: .4byte 0x000008b4
_0809A2D0:
	lsls r0, 1
	movs r1, 0xC8
	lsls r1, 4
	adds r0, r1
_0809A2D8:
	adds r2, r0
	movs r0, 0
	movs r5, 0
	movs r4, 0x3F
_0809A2E0:
	strh r5, [r2]
	adds r2, 0x2
	adds r3, 0x1
	ands r3, r4
	adds r1, r3, 0
	cmp r1, 0
	bne _0809A2F2
	ldr r6, _0809A30C
	adds r2, r6
_0809A2F2:
	cmp r1, 0x20
	bne _0809A2FC
	movs r1, 0xF8
	lsls r1, 3
	adds r2, r1
_0809A2FC:
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2B
	bls _0809A2E0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A30C: .4byte 0xfffff7c0
	thumb_func_end sub_809A14C

	thumb_func_start sub_809A1BC
sub_809A1BC: @ 809A310
	push {r4-r6,lr}
	sub sp, 0x8
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _0809A37C
	ldr r5, [r0]
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, _0809A380
	str r1, [r4]
	str r5, [r4, 0x4]
	movs r6, 0x80
	lsls r6, 1
	ldr r0, _0809A384
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0809A388
	adds r1, r5, 0
	str r3, [sp, 0x4]
	bl sub_8004E3C
	str r5, [r4]
	ldr r3, [sp, 0x4]
	str r3, [r4, 0x4]
	ldr r1, _0809A38C
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r0, r5, r6
	str r0, [r4]
	adds r0, r3, 0
	adds r0, 0x80
	str r0, [r4, 0x4]
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r0, r5, 0
	adds r0, 0x80
	str r0, [r4]
	adds r6, r3, r6
	str r6, [r4, 0x4]
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	adds r5, r0
	str r5, [r4]
	adds r3, r0
	str r3, [r4, 0x4]
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A37C: .4byte gUnknown_083B6DB8
_0809A380: .4byte 0x040000d4
_0809A384: .4byte 0x81000100
_0809A388: .4byte gWindowConfig_81E6D38
_0809A38C: .4byte 0x80000040
	thumb_func_end sub_809A1BC

	thumb_func_start sub_809A23C
sub_809A23C: @ 809A390
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0809A4D8
	ldr r5, [r0]
	ldr r1, _0809A4DC
	adds r7, r5, r1
	str r7, [sp, 0x18]
	mov r2, sp
	adds r2, 0x18
	str r2, [sp, 0x20]
	ldr r0, _0809A4E0
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r3, _0809A4E4
	adds r0, r5, r3
	str r0, [sp]
	ldr r4, _0809A4E8
	strh r4, [r1, 0x4]
	str r0, [sp, 0x8]
	ldr r6, _0809A4EC
	strh r6, [r1, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x8
	bl memset
	ldr r0, _0809A4F0
	mov r9, r0
	ldr r0, _0809A4F4
	add r0, r9
	add r0, r8
	ldrb r1, [r0]
	ldr r2, _0809A4F8
	lsls r1, 2
	adds r0, r1, r2
	ldrh r3, [r0]
	ldr r6, _0809A4FC
	adds r0, r5, r6
	strh r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrh r1, [r1]
	ldr r2, _0809A500
	adds r0, r5, r2
	strh r1, [r0]
	mov r0, sp
	bl LoadSpritePalettes
	ldr r3, _0809A504
	adds r6, r5, r3
	movs r0, 0xFC
	lsls r0, 2
	str r0, [r6]
	adds r0, r4, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	movs r2, 0x87
	lsls r2, 1
	mov r10, r2
	add r1, r10
	ldr r3, _0809A508
	adds r2, r5, r3
	strh r1, [r2]
	movs r4, 0x80
	lsls r4, 9
	adds r1, r4, 0
	lsls r1, r0
	ldr r0, [r6]
	orrs r0, r1
	str r0, [r6]
	ldr r0, _0809A50C
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	add r1, r10
	ldr r2, _0809A510
	adds r5, r2
	strh r1, [r5]
	lsls r4, r0
	ldr r0, [r6]
	orrs r0, r4
	str r0, [r6]
	mov r3, r8
	lsls r4, r3, 3
	add r4, r8
	ldr r6, _0809A514
	add r9, r6
	add r4, r9
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_809A1BC
	ldr r0, [sp, 0x20]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	bl sub_809A6D0
	movs r4, 0
	lsls r0, 16
	asrs r6, r0, 16
_0809A47C:
	lsls r1, r4, 5
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0809A518
	movs r2, 0x1C
	movs r3, 0x17
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0809A4D8
	ldr r5, [r0]
	lsls r0, r4, 2
	movs r3, 0xCF
	lsls r3, 4
	adds r2, r5, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809A51C
	adds r0, r1
	str r0, [r2]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _0809A47C
	ldr r6, _0809A520
	adds r1, r5, r6
	movs r0, 0
	strb r0, [r1]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4D8: .4byte gUnknown_083B6DB4
_0809A4DC: .4byte 0x000008ca
_0809A4E0: .4byte 0x00030200
_0809A4E4: .4byte 0x00000ccc
_0809A4E8: .4byte 0x0000dac8
_0809A4EC: .4byte 0xffffdac9
_0809A4F0: .4byte gPokemonStorage
_0809A4F4: .4byte 0x000083c2
_0809A4F8: .4byte gUnknown_083BB0A8
_0809A4FC: .4byte 0x00000ce8
_0809A500: .4byte 0x00000cea
_0809A504: .4byte 0x00000d08
_0809A508: .4byte 0x00000cec
_0809A50C: .4byte 0x0000dac9
_0809A510: .4byte 0x00000cee
_0809A514: .4byte 0x00008344
_0809A518: .4byte gSpriteTemplate_83BB2B8
_0809A51C: .4byte gSprites
_0809A520: .4byte 0x00000cca
	thumb_func_end sub_809A23C

	thumb_func_start sub_809A3D0
sub_809A3D0: @ 809A524
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x28]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r3, _0809A590
	ldr r5, [r3]
	ldr r1, _0809A594
	adds r0, r5, r1
	str r0, [sp, 0x18]
	add r2, sp, 0x18
	ldr r4, _0809A598
	mov r9, r4
	movs r6, 0xC0
	lsls r6, 10
	mov r8, r6
	ldr r0, _0809A59C
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r0, _0809A5A0
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	movs r1, 0
	ldr r7, _0809A5A4
	adds r4, r5, r7
	ldrb r0, [r4]
	adds r6, r2, 0
	cmp r0, 0
	bne _0809A572
	movs r1, 0x1
_0809A572:
	strb r1, [r4]
	cmp r1, 0
	bne _0809A5AC
	ldr r0, [r6, 0x4]
	mov r1, r9
	ands r0, r1
	mov r4, r8
	orrs r0, r4
	str r0, [r6, 0x4]
	ldr r7, _0809A5A8
	adds r0, r5, r7
	ldrh r0, [r0]
	mov r8, r0
	b _0809A5CC
	.align 2, 0
_0809A590: .4byte gUnknown_083B6DB4
_0809A594: .4byte 0x000008ca
_0809A598: .4byte 0x0000ffff
_0809A59C: .4byte 0x00030200
_0809A5A0: .4byte gSpriteTemplate_83BB2B8
_0809A5A4: .4byte 0x00000cca
_0809A5A8: .4byte 0x00000cec
_0809A5AC:
	ldr r0, [r6, 0x4]
	mov r1, r9
	ands r0, r1
	movs r1, 0x80
	lsls r1, 11
	orrs r0, r1
	str r0, [r6, 0x4]
	ldr r4, _0809A6C4
	adds r0, r5, r4
	ldrh r0, [r0]
	mov r8, r0
	mov r1, sp
	movs r0, 0x4
	strh r0, [r1]
	ldr r0, _0809A6C8
	strh r0, [r1, 0x2]
_0809A5CC:
	ldr r0, [r3]
	ldr r7, _0809A6CC
	adds r0, r7
	ldr r1, [sp, 0x28]
	lsls r5, r1, 3
	adds r5, r1
	ldr r4, _0809A6D0
	adds r5, r4
	adds r1, r5, 0
	bl sub_809A1BC
	adds r0, r6, 0
	bl LoadSpriteSheet
	adds r4, 0x7E
	ldr r3, [sp, 0x28]
	adds r4, r3, r4
	ldrb r0, [r4]
	lsls r0, 2
	ldr r1, _0809A6D4
	adds r0, r1
	mov r1, r8
	movs r2, 0x4
	bl LoadPalette
	adds r0, r5, 0
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	bl sub_809A6D0
	lsls r0, 16
	mov r4, r10
	lsls r2, r4, 24
	asrs r2, 24
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 6
	lsrs r6, r0, 16
	str r6, [sp, 0x20]
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x24]
	movs r7, 0
	negs r2, r2
	mov r9, r2
	movs r0, 0x1
	mov r10, r0
_0809A632:
	lsls r1, r7, 5
	mov r8, r1
	ldr r3, [sp, 0x24]
	lsls r1, r3, 16
	asrs r1, 16
	add r1, r8
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x1C
	movs r3, 0x17
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809A6D8
	ldr r4, [r1]
	lsls r6, r7, 2
	ldr r1, _0809A6DC
	adds r2, r4, r1
	adds r2, r6
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0809A6E0
	adds r1, r0
	str r1, [r2]
	mov r3, r9
	lsls r5, r3, 1
	add r5, r9
	lsls r5, 1
	strh r5, [r1, 0x2E]
	ldr r1, [r2]
	ldr r3, [sp, 0x20]
	lsls r0, r3, 16
	asrs r0, 16
	add r0, r8
	strh r0, [r1, 0x30]
	ldr r0, [r2]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r0, [r2]
	ldr r1, _0809A6E4
	str r1, [r0, 0x1C]
	lsls r1, r7, 24
	lsrs r1, 24
	bl StartSpriteAnim
	movs r3, 0xCF
	lsls r3, 4
	adds r4, r3
	adds r4, r6
	ldr r0, [r4]
	strh r5, [r0, 0x2E]
	ldr r0, [r4]
	mov r6, r10
	strh r6, [r0, 0x30]
	ldr r1, [r4]
	ldr r0, _0809A6E8
	str r0, [r1, 0x1C]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1
	bls _0809A632
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A6C4: .4byte 0x00000cec
_0809A6C8: .4byte 0x0000dac9
_0809A6CC: .4byte 0x000008ca
_0809A6D0: .4byte gUnknown_020383E4
_0809A6D4: .4byte gUnknown_083BB0A8
_0809A6D8: .4byte gUnknown_083B6DB4
_0809A6DC: .4byte 0x00000cf8
_0809A6E0: .4byte gSprites
_0809A6E4: .4byte sub_809A5E8
_0809A6E8: .4byte sub_809A61C
	thumb_func_end sub_809A3D0

	thumb_func_start sub_809A598
sub_809A598: @ 809A6EC
	push {lr}
	ldr r0, _0809A704
	ldr r0, [r0]
	ldr r1, _0809A708
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809A70C
	movs r0, 0x4
	bl FreeSpriteTilesByTag
	b _0809A712
	.align 2, 0
_0809A704: .4byte gUnknown_083B6DB4
_0809A708: .4byte 0x00000cca
_0809A70C:
	movs r0, 0x3
	bl FreeSpriteTilesByTag
_0809A712:
	ldr r0, _0809A734
	ldr r0, [r0]
	movs r3, 0xCF
	lsls r3, 4
	adds r2, r0, r3
	adds r3, 0x8
	adds r1, r0, r3
	ldr r1, [r1]
	str r1, [r2]
	ldr r2, _0809A738
	adds r1, r0, r2
	adds r3, 0x4
	adds r0, r3
	ldr r0, [r0]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809A734: .4byte gUnknown_083B6DB4
_0809A738: .4byte 0x00000cf4
	thumb_func_end sub_809A598

	thumb_func_start sub_809A5E8
sub_809A5E8: @ 809A73C
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x32]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0809A750
	subs r0, r1, 0x1
	strh r0, [r2, 0x32]
	b _0809A768
_0809A750:
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _0809A768
	ldr r0, _0809A76C
	str r0, [r2, 0x1C]
_0809A768:
	pop {r0}
	bx r0
	.align 2, 0
_0809A76C: .4byte SpriteCallbackDummy
	thumb_func_end sub_809A5E8

	thumb_func_start sub_809A61C
sub_809A61C: @ 809A770
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0809A784
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
	b _0809A7A2
_0809A784:
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x32]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC0
	bls _0809A7A2
	adds r0, r2, 0
	bl DestroySprite
_0809A7A2:
	pop {r0}
	bx r0
	thumb_func_end sub_809A61C

	thumb_func_start sub_809A654
sub_809A654: @ 809A7A8
	push {lr}
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809A7E4
	ldr r2, _0809A7E8
	adds r1, r2
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0809A7EC
	ldr r2, [r0]
	ldr r3, _0809A7F0
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809A7FC
	lsls r0, r1, 2
	ldr r1, _0809A7F4
	adds r0, r1
	adds r3, 0x22
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, 1
	ldr r2, _0809A7F8
	adds r1, r2
	movs r2, 0x2
	bl CpuSet
	b _0809A814
	.align 2, 0
_0809A7E4: .4byte gPokemonStorage
_0809A7E8: .4byte 0x000083c2
_0809A7EC: .4byte gUnknown_083B6DB4
_0809A7F0: .4byte 0x00000cca
_0809A7F4: .4byte gUnknown_083BB0A8
_0809A7F8: .4byte gPlttBufferUnfaded
_0809A7FC:
	lsls r0, r1, 2
	ldr r1, _0809A818
	adds r0, r1
	ldr r3, _0809A81C
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, 1
	ldr r2, _0809A820
	adds r1, r2
	movs r2, 0x2
	bl CpuSet
_0809A814:
	pop {r0}
	bx r0
	.align 2, 0
_0809A818: .4byte gUnknown_083BB0A8
_0809A81C: .4byte 0x00000cee
_0809A820: .4byte gPlttBufferUnfaded
	thumb_func_end sub_809A654

	thumb_func_start sub_809A6D0
sub_809A6D0: @ 809A824
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	movs r0, 0xB0
	subs r0, r1
	bx lr
	thumb_func_end sub_809A6D0

	thumb_func_start sub_809A6DC
sub_809A6DC: @ 809A830
	push {r4,r5,lr}
	ldr r0, _0809A8B4
	bl LoadSpriteSheet
	ldr r0, _0809A8B8
	bl LoadSpritePalette
	movs r5, 0
_0809A840:
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 19
	movs r0, 0xB8
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	ldr r0, _0809A8BC
	movs r2, 0x1C
	movs r3, 0x15
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0809A892
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809A8C0
	adds r4, r0, r1
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0x1
	cmp r5, 0
	bne _0809A880
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
_0809A880:
	strh r0, [r4, 0x34]
	ldr r0, _0809A8C4
	ldr r0, [r0]
	lsls r1, r5, 2
	movs r2, 0xD0
	lsls r2, 4
	adds r0, r2
	adds r0, r1
	str r4, [r0]
_0809A892:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _0809A840
	bl sub_809BF2C
	lsls r0, 24
	cmp r0, 0
	beq _0809A8AC
	movs r0, 0x1
	bl sub_809A860
_0809A8AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A8B4: .4byte gUnknown_083BB288
_0809A8B8: .4byte gUnknown_083BB290
_0809A8BC: .4byte gSpriteTemplate_83BB2F0
_0809A8C0: .4byte gSprites
_0809A8C4: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809A6DC

	thumb_func_start sub_809A774
sub_809A774: @ 809A8C8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0
	ldr r7, _0809A918
	ldr r0, [r7]
	movs r1, 0xD0
	lsls r1, 4
	adds r3, r0, r1
	movs r5, 0
	movs r4, 0x2
_0809A8DE:
	lsls r1, r2, 2
	adds r1, r3, r1
	ldr r0, [r1]
	strh r5, [r0, 0x24]
	ldr r0, [r1]
	strh r4, [r0, 0x2E]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _0809A8DE
	lsls r0, r6, 24
	cmp r0, 0
	bge _0809A920
	ldr r1, [r7]
	movs r2, 0xD0
	lsls r2, 4
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, 0x1D
	strh r0, [r2, 0x30]
	ldr r0, _0809A91C
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x5
	strh r0, [r2, 0x30]
	ldr r0, [r3]
	movs r2, 0x48
	b _0809A93C
	.align 2, 0
_0809A918: .4byte gUnknown_083B6DB4
_0809A91C: .4byte 0x00000d04
_0809A920:
	ldr r1, [r7]
	movs r2, 0xD0
	lsls r2, 4
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, 0x5
	strh r0, [r2, 0x30]
	ldr r0, _0809A960
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x1D
	strh r0, [r2, 0x30]
	ldr r0, [r3]
	movs r2, 0xF8
_0809A93C:
	strh r2, [r0, 0x32]
	ldr r0, [r1]
	strh r2, [r0, 0x32]
	ldr r1, [r7]
	movs r2, 0xD0
	lsls r2, 4
	adds r0, r1, r2
	ldr r2, [r0]
	movs r0, 0
	strh r0, [r2, 0x3C]
	ldr r0, _0809A960
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A960: .4byte 0x00000d04
	thumb_func_end sub_809A774

	thumb_func_start sub_809A810
sub_809A810: @ 809A964
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _0809A9B0
	ldr r0, [r0]
	movs r1, 0xD0
	lsls r1, 4
	adds r4, r0, r1
	movs r5, 0
	movs r6, 0x5
	negs r6, r6
_0809A978:
	lsls r1, r3, 2
	adds r1, r4, r1
	ldr r2, [r1]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 3
	adds r0, 0x5C
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	strh r5, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _0809A978
	movs r0, 0x1
	bl sub_809A860
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9B0: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809A810

	thumb_func_start sub_809A860
sub_809A860: @ 809A9B4
	push {r4,r5,lr}
	lsls r0, 24
	cmp r0, 0
	beq _0809A9F0
	movs r2, 0
	ldr r0, _0809A9EC
	ldr r0, [r0]
	movs r1, 0xD0
	lsls r1, 4
	adds r4, r0, r1
	movs r3, 0
	movs r5, 0x1
_0809A9CC:
	lsls r1, r2, 2
	adds r1, r4, r1
	ldr r0, [r1]
	strh r5, [r0, 0x2E]
	ldr r0, [r1]
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	strh r3, [r0, 0x32]
	ldr r0, [r1]
	strh r3, [r0, 0x36]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _0809A9CC
	b _0809AA10
	.align 2, 0
_0809A9EC: .4byte gUnknown_083B6DB4
_0809A9F0:
	movs r2, 0
	ldr r0, _0809AA18
	ldr r0, [r0]
	movs r3, 0xD0
	lsls r3, 4
	adds r1, r0, r3
	movs r3, 0
_0809A9FE:
	lsls r0, r2, 2
	adds r0, r1, r0
	ldr r0, [r0]
	strh r3, [r0, 0x2E]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _0809A9FE
_0809AA10:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AA18: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809A860

	thumb_func_start sub_809A8C8
sub_809A8C8: @ 809AA1C
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bhi _0809AAE8
	lsls r0, 2
	ldr r1, _0809AA34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809AA34: .4byte _0809AA38
	.align 2, 0
_0809AA38:
	.4byte _0809AA4C
	.4byte _0809AA52
	.4byte _0809AA80
	.4byte _0809AA86
	.4byte _0809AAD8
_0809AA4C:
	movs r0, 0
	strh r0, [r2, 0x24]
	b _0809AAE8
_0809AA52:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0809AAE8
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x24]
	adds r0, r3
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0809AAE8
	strh r1, [r2, 0x32]
	strh r1, [r2, 0x24]
	b _0809AAE8
_0809AA80:
	movs r0, 0x3
	strh r0, [r2, 0x2E]
	b _0809AAE8
_0809AA86:
	ldr r0, _0809AAD0
	ldr r1, [r0]
	ldr r0, _0809AAD4
	adds r1, r0
	ldrh r0, [r2, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2, 0x20]
	subs r0, 0x49
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAE
	bls _0809AAAC
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_0809AAAC:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _0809AAE8
	ldrh r0, [r2, 0x32]
	strh r0, [r2, 0x20]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	b _0809AAE8
	.align 2, 0
_0809AAD0: .4byte gUnknown_083B6DB4
_0809AAD4: .4byte 0x000008b6
_0809AAD8:
	ldr r0, _0809AAEC
	ldr r0, [r0]
	ldr r1, _0809AAF0
	adds r0, r1
	ldrh r1, [r2, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x20]
_0809AAE8:
	pop {r0}
	bx r0
	.align 2, 0
_0809AAEC: .4byte gUnknown_083B6DB4
_0809AAF0: .4byte 0x000008b6
	thumb_func_end sub_809A8C8

	thumb_func_start sub_809A9A0
sub_809A9A0: @ 809AAF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809AB60
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0809AB6C
	movs r1, 0x1
	ands r1, r7
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _0809AB64
	adds r6, r4, r5
	adds r0, r6, 0
	bl StartSpriteAnim
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0809AB68
	str r0, [r4]
	adds r0, r6, 0
	b _0809AB6E
	.align 2, 0
_0809AB60: .4byte gSpriteTemplate_83BB2F0
_0809AB64: .4byte gSprites
_0809AB68: .4byte SpriteCallbackDummy
_0809AB6C:
	movs r0, 0
_0809AB6E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809A9A0

	thumb_func_start sub_809AA24
sub_809AA24: @ 809AB78
	push {lr}
	ldr r0, _0809AB8C
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	cmp r1, 0x1
	beq _0809AB94
	ldr r1, _0809AB90
	movs r0, 0
	strb r0, [r1]
	b _0809AB98
	.align 2, 0
_0809AB8C: .4byte gUnknown_083B6DB4
_0809AB90: .4byte gUnknown_020384E4
_0809AB94:
	ldr r0, _0809ABCC
	strb r1, [r0]
_0809AB98:
	ldr r0, _0809ABD0
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0809ABD4
	strb r1, [r0]
	ldr r0, _0809ABD8
	strb r1, [r0]
	ldr r0, _0809ABDC
	strb r1, [r0]
	ldr r0, _0809ABE0
	strb r1, [r0]
	bl sub_809B0D4
	bl sub_809CC04
	ldr r0, _0809ABE4
	ldr r0, [r0]
	ldr r1, _0809ABE8
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bl sub_809BF74
	pop {r0}
	bx r0
	.align 2, 0
_0809ABCC: .4byte gUnknown_020384E4
_0809ABD0: .4byte gUnknown_020384E5
_0809ABD4: .4byte gUnknown_020384E6
_0809ABD8: .4byte gUnknown_020384E7
_0809ABDC: .4byte gUnknown_020384E8
_0809ABE0: .4byte gUnknown_020384E9
_0809ABE4: .4byte gUnknown_083B6DB4
_0809ABE8: .4byte 0x000011e2
	thumb_func_end sub_809AA24

	thumb_func_start sub_809AA98
sub_809AA98: @ 809ABEC
	push {lr}
	bl sub_809CC04
	bl sub_809C028
	ldr r0, _0809AC14
	ldr r0, [r0]
	ldr r1, _0809AC18
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _0809AC1C
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809AC0E
	bl sub_8098BF0
_0809AC0E:
	pop {r0}
	bx r0
	.align 2, 0
_0809AC14: .4byte gUnknown_083B6DB4
_0809AC18: .4byte 0x000011e2
_0809AC1C: .4byte gUnknown_020384E6
	thumb_func_end sub_809AA98

	thumb_func_start sub_809AACC
sub_809AACC: @ 809AC20
	push {r4-r6,lr}
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x4
	bhi _0809ACD8
	lsls r0, 2
	ldr r1, _0809AC3C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809AC3C: .4byte _0809AC40
	.align 2, 0
_0809AC40:
	.4byte _0809AC54
	.4byte _0809AC82
	.4byte _0809ACAA
	.4byte _0809ACB2
	.4byte _0809ACD0
_0809AC54:
	adds r0, r5, 0
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x64
	strh r1, [r4]
	adds r0, r5, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x20
	strh r1, [r6]
	b _0809ACD8
_0809AC82:
	cmp r5, 0
	bne _0809AC8E
	movs r0, 0x68
	strh r0, [r4]
	movs r0, 0x34
	b _0809ACD6
_0809AC8E:
	cmp r5, 0x6
	bne _0809AC9A
	movs r0, 0x98
	strh r0, [r4]
	movs r0, 0x84
	b _0809ACD6
_0809AC9A:
	movs r0, 0x98
	strh r0, [r4]
	subs r1, r5, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x4
	b _0809ACD6
_0809ACAA:
	movs r0, 0xA2
	strh r0, [r4]
	movs r0, 0xC
	b _0809ACD6
_0809ACB2:
	ldr r0, _0809ACCC
	ldrb r0, [r0]
	movs r1, 0xE
	cmp r0, 0
	beq _0809ACBE
	movs r1, 0x8
_0809ACBE:
	strh r1, [r6]
	movs r0, 0x58
	muls r0, r5
	adds r0, 0x78
	strh r0, [r4]
	b _0809ACD8
	.align 2, 0
_0809ACCC: .4byte gUnknown_020384E6
_0809ACD0:
	movs r0, 0xA0
	strh r0, [r4]
	movs r0, 0x60
_0809ACD6:
	strh r0, [r6]
_0809ACD8:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_809AACC

	thumb_func_start sub_809AB8C
sub_809AB8C: @ 809ACE0
	push {lr}
	ldr r0, _0809AD08
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809AD14
	cmp r0, 0x1
	bne _0809AD4C
	ldr r0, _0809AD0C
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809AD10
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	b _0809AD3E
	.align 2, 0
_0809AD08: .4byte gUnknown_020384E4
_0809AD0C: .4byte gUnknown_020384E5
_0809AD10: .4byte gPlayerParty
_0809AD14:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809AD44
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809AD48
	adds r1, r2
	adds r0, r1
	movs r1, 0xB
	bl GetBoxMonData
_0809AD3E:
	lsls r0, 16
	lsrs r0, 16
	b _0809AD4E
	.align 2, 0
_0809AD44: .4byte gUnknown_020384E5
_0809AD48: .4byte gUnknown_020300A4
_0809AD4C:
	movs r0, 0
_0809AD4E:
	pop {r1}
	bx r1
	thumb_func_end sub_809AB8C

	thumb_func_start sub_809AC00
sub_809AC00: @ 809AD54
	push {r4-r6,lr}
	ldr r0, _0809AD68
	ldr r4, [r0]
	ldr r0, _0809AD6C
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0809AD70
	movs r0, 0
	b _0809AE80
	.align 2, 0
_0809AD68: .4byte gUnknown_083B6DB4
_0809AD6C: .4byte 0x000011dc
_0809AD70:
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0809AE60
	ldr r1, _0809AE48
	adds r3, r4, r1
	ldr r2, _0809AE4C
	adds r1, r4, r2
	ldr r0, [r3]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r3]
	ldr r6, _0809AE50
	adds r2, r4, r6
	ldr r0, _0809AE54
	adds r1, r4, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r2]
	movs r1, 0x8E
	lsls r1, 5
	adds r5, r4, r1
	ldr r1, [r5]
	ldr r0, [r3]
	asrs r0, 8
	strh r0, [r1, 0x20]
	ldr r1, [r5]
	ldr r0, [r2]
	asrs r0, 8
	strh r0, [r1, 0x22]
	ldr r1, [r5]
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x80
	lsls r3, 1
	cmp r0, r3
	ble _0809ADCC
	ldr r6, _0809AE58
	adds r0, r2, r6
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x40
	strh r0, [r1, 0x20]
_0809ADCC:
	ldr r1, [r5]
	ldrh r2, [r1, 0x20]
	movs r6, 0x20
	ldrsh r0, [r1, r6]
	cmp r0, 0x3F
	bgt _0809ADE4
	movs r0, 0x40
	subs r0, r2
	lsls r0, 16
	asrs r0, 16
	subs r0, r3, r0
	strh r0, [r1, 0x20]
_0809ADE4:
	ldr r1, [r5]
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0xB0
	ble _0809ADFC
	adds r0, r2, 0
	subs r0, 0xB0
	lsls r0, 16
	asrs r0, 16
	subs r0, 0x10
	strh r0, [r1, 0x22]
_0809ADFC:
	ldr r2, [r5]
	ldrh r3, [r2, 0x22]
	movs r6, 0x22
	ldrsh r0, [r2, r6]
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0809AE18
	subs r0, r1, r3
	movs r1, 0xB0
	lsls r0, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2, 0x22]
_0809AE18:
	ldr r0, _0809AE5C
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809AE7E
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0809AE7E
	ldr r2, [r5]
	adds r2, 0x3F
	ldrb r3, [r2]
	lsrs r1, r3, 1
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0809AE7E
	.align 2, 0
_0809AE48: .4byte 0x000011c8
_0809AE4C: .4byte 0x000011d0
_0809AE50: .4byte 0x000011cc
_0809AE54: .4byte 0x000011d4
_0809AE58: .4byte 0xffffff00
_0809AE5C: .4byte 0x000011e3
_0809AE60:
	movs r1, 0x8E
	lsls r1, 5
	adds r2, r4, r1
	ldr r1, [r2]
	ldr r3, _0809AE88
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	ldr r6, _0809AE8C
	adds r0, r4, r6
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	bl sub_809AFB8
_0809AE7E:
	movs r0, 0x1
_0809AE80:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809AE88: .4byte 0x000011d8
_0809AE8C: .4byte 0x000011da
	thumb_func_end sub_809AC00

	thumb_func_start sub_809AD3C
sub_809AD3C: @ 809AE90
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r6, sp
	adds r6, 0x2
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	adds r3, r6, 0
	bl sub_809AACC
	ldr r0, _0809AEDC
	ldr r1, [r0]
	movs r2, 0x8F
	lsls r2, 5
	adds r0, r1, r2
	strb r4, [r0]
	ldr r3, _0809AEE0
	adds r0, r1, r3
	strb r5, [r0]
	mov r0, sp
	ldrh r2, [r0]
	subs r3, 0x9
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r0, [r6]
	ldr r2, _0809AEE4
	adds r1, r2
	strh r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AEDC: .4byte gUnknown_083B6DB4
_0809AEE0: .4byte 0x000011e1
_0809AEE4: .4byte 0x000011da
	thumb_func_end sub_809AD3C

	thumb_func_start sub_809AD94
sub_809AD94: @ 809AEE8
	push {r4-r7,lr}
	ldr r0, _0809AF04
	ldr r2, [r0]
	ldr r3, _0809AF08
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	beq _0809AF10
	ldr r0, _0809AF0C
	adds r1, r2, r0
	movs r0, 0xC
	b _0809AF16
	.align 2, 0
_0809AF04: .4byte gUnknown_083B6DB4
_0809AF08: .4byte 0x000011de
_0809AF0C: .4byte 0x000011dc
_0809AF10:
	ldr r3, _0809AF58
	adds r1, r2, r3
	movs r0, 0x6
_0809AF16:
	strh r0, [r1]
	ldr r2, [r4]
	ldr r0, _0809AF5C
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809AF2E
	ldr r3, _0809AF58
	adds r0, r2, r3
	ldrh r0, [r0]
	lsrs r0, 1
	strb r0, [r1]
_0809AF2E:
	ldr r1, _0809AF60
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809AF68
	cmp r1, 0x1
	beq _0809AF84
	ldr r3, _0809AF64
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	b _0809AF9A
	.align 2, 0
_0809AF58: .4byte 0x000011dc
_0809AF5C: .4byte 0x000011e3
_0809AF60: .4byte 0x000011de
_0809AF64: .4byte 0x000011da
_0809AF68:
	ldr r3, _0809AF80
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	adds r0, 0xC0
	b _0809AF9A
	.align 2, 0
_0809AF80: .4byte 0x000011da
_0809AF84:
	ldr r3, _0809AFC8
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	subs r0, 0xC0
_0809AF9A:
	subs r7, r1, r0
	ldr r2, [r4]
	ldr r3, _0809AFCC
	adds r0, r2, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809AFD4
	cmp r1, 0x1
	beq _0809AFF0
	ldr r1, _0809AFD0
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	b _0809B006
	.align 2, 0
_0809AFC8: .4byte 0x000011da
_0809AFCC: .4byte 0x000011df
_0809AFD0: .4byte 0x000011d8
_0809AFD4:
	ldr r3, _0809AFEC
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r0, 0xC0
	b _0809B006
	.align 2, 0
_0809AFEC: .4byte 0x000011d8
_0809AFF0:
	ldr r3, _0809B054
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	subs r0, 0xC0
_0809B006:
	subs r0, r1, r0
	lsls r7, 8
	lsls r0, 8
	ldr r4, [r4]
	ldr r3, _0809B058
	adds r6, r4, r3
	ldr r1, _0809B05C
	adds r5, r4, r1
	ldrh r1, [r5]
	bl __divsi3
	str r0, [r6]
	ldr r2, _0809B060
	adds r6, r4, r2
	ldrh r1, [r5]
	adds r0, r7, 0
	bl __divsi3
	str r0, [r6]
	ldr r3, _0809B064
	adds r2, r4, r3
	movs r0, 0x8E
	lsls r0, 5
	adds r1, r4, r0
	ldr r0, [r1]
	movs r3, 0x20
	ldrsh r0, [r0, r3]
	lsls r0, 8
	str r0, [r2]
	ldr r0, _0809B068
	adds r4, r0
	ldr r0, [r1]
	movs r1, 0x22
	ldrsh r0, [r0, r1]
	lsls r0, 8
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B054: .4byte 0x000011d8
_0809B058: .4byte 0x000011d0
_0809B05C: .4byte 0x000011dc
_0809B060: .4byte 0x000011d4
_0809B064: .4byte 0x000011c8
_0809B068: .4byte 0x000011cc
	thumb_func_end sub_809AD94

	thumb_func_start sub_809AF18
sub_809AF18: @ 809B06C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_809AD3C
	bl sub_809AD94
	ldr r0, _0809B0F8
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809B09A
	ldr r0, _0809B0FC
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
_0809B09A:
	cmp r4, 0x1
	bne _0809B0C4
	ldr r0, _0809B100
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _0809B0C4
	ldr r0, _0809B0FC
	ldr r0, [r0]
	ldr r2, _0809B104
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _0809B108
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0809B0C4:
	cmp r4, 0
	beq _0809B0F2
	cmp r4, 0
	blt _0809B0F2
	cmp r4, 0x3
	bgt _0809B0F2
	ldr r0, _0809B0FC
	ldr r2, [r0]
	ldr r0, _0809B108
	adds r2, r0
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	ldr r2, [r2]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x5]
_0809B0F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B0F8: .4byte gUnknown_020384E6
_0809B0FC: .4byte gUnknown_083B6DB4
_0809B100: .4byte gUnknown_020384E4
_0809B104: .4byte 0x000011e2
_0809B108: .4byte 0x000011c4
	thumb_func_end sub_809AF18

	thumb_func_start sub_809AFB8
sub_809AFB8: @ 809B10C
	push {r4,r5,lr}
	ldr r5, _0809B154
	ldr r0, _0809B158
	ldr r4, [r0]
	movs r1, 0x8F
	lsls r1, 5
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _0809B15C
	ldr r2, _0809B160
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0809B164
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809B13E
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
_0809B13E:
	bl sub_809BF74
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x1
	beq _0809B174
	cmp r0, 0x1
	bgt _0809B168
	cmp r0, 0
	beq _0809B188
	b _0809B1B2
	.align 2, 0
_0809B154: .4byte gUnknown_020384E4
_0809B158: .4byte gUnknown_083B6DB4
_0809B15C: .4byte gUnknown_020384E5
_0809B160: .4byte 0x000011e1
_0809B164: .4byte gUnknown_020384E6
_0809B168:
	cmp r0, 0x2
	bne _0809B1B2
	movs r0, 0x1
	bl sub_809A860
	b _0809B1B2
_0809B174:
	ldr r2, _0809B184
	adds r0, r4, r2
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0xC
	strb r1, [r0]
	b _0809B1B2
	.align 2, 0
_0809B184: .4byte 0x000011c4
_0809B188:
	ldr r0, _0809B1B8
	adds r2, r4, r0
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	adds r0, 0x43
	movs r1, 0x14
	strb r1, [r0]
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0809B1B2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B1B8: .4byte 0x000011c4
	thumb_func_end sub_809AFB8

	thumb_func_start sub_809B068
sub_809B068: @ 809B1BC
	push {lr}
	ldr r0, _0809B1CC
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809B1D0
	movs r3, 0
	b _0809B1DE
	.align 2, 0
_0809B1CC: .4byte gUnknown_020384E6
_0809B1D0:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _0809B1DE
	movs r3, 0x5
_0809B1DE:
	ldr r0, _0809B20C
	ldr r2, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809B1FE
	ldr r0, _0809B210
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
_0809B1FE:
	movs r0, 0x1
	adds r1, r3, 0
	bl sub_809AF18
	pop {r0}
	bx r0
	.align 2, 0
_0809B20C: .4byte gUnknown_083B6DB4
_0809B210: .4byte 0x000011e3
	thumb_func_end sub_809B068

	thumb_func_start sub_809B0C0
sub_809B0C0: @ 809B214
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_809AF18
	pop {r0}
	bx r0
	thumb_func_end sub_809B0C0

	thumb_func_start sub_809B0D4
sub_809B0D4: @ 809B228
	ldr r1, _0809B230
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809B230: .4byte gUnknown_020384EA
	thumb_func_end sub_809B0D4

	thumb_func_start sub_809B0E0
sub_809B0E0: @ 809B234
	ldr r0, _0809B240
	ldr r1, _0809B244
	ldrb r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809B240: .4byte gUnknown_020384EA
_0809B244: .4byte gUnknown_020384E5
	thumb_func_end sub_809B0E0

	thumb_func_start sub_809B0F4
sub_809B0F4: @ 809B248
	ldr r0, _0809B250
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0809B250: .4byte gUnknown_020384EA
	thumb_func_end sub_809B0F4

	thumb_func_start sub_809B100
sub_809B100: @ 809B254
	lsls r0, 24
	ldr r1, _0809B274
	ldr r1, [r1]
	ldr r2, _0809B278
	adds r3, r1, r2
	ldr r2, _0809B27C
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0809B280
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809B274: .4byte gUnknown_083B6DB4
_0809B278: .4byte 0x000012a4
_0809B27C: .4byte gUnknown_083BBBC8
_0809B280: .4byte 0x000012a8
	thumb_func_end sub_809B100

	thumb_func_start sub_809B130
sub_809B130: @ 809B284
	push {lr}
	ldr r0, _0809B29C
	ldr r0, [r0]
	ldr r1, _0809B2A0
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0809B29C: .4byte gUnknown_083B6DB4
_0809B2A0: .4byte 0x000012a4
	thumb_func_end sub_809B130

	thumb_func_start sub_809B150
sub_809B150: @ 809B2A4
	push {r4,r5,lr}
	ldr r0, _0809B2C0
	ldr r5, [r0]
	ldr r0, _0809B2C4
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _0809B2F4
	cmp r0, 0x1
	bgt _0809B2C8
	cmp r0, 0
	beq _0809B2D2
	b _0809B322
	.align 2, 0
_0809B2C0: .4byte gUnknown_083B6DB4
_0809B2C4: .4byte 0x000012a8
_0809B2C8:
	cmp r0, 0x2
	beq _0809B312
	cmp r0, 0x3
	beq _0809B2DA
	b _0809B322
_0809B2D2:
	ldr r0, _0809B2E0
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B2E4
_0809B2DA:
	movs r0, 0
	b _0809B324
	.align 2, 0
_0809B2E0: .4byte gUnknown_020384E6
_0809B2E4:
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	b _0809B31C
_0809B2F4:
	bl sub_809B324
	lsls r0, 24
	cmp r0, 0
	bne _0809B322
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	bl sub_809B384
	b _0809B31C
_0809B312:
	bl sub_809B358
	lsls r0, 24
	cmp r0, 0
	bne _0809B322
_0809B31C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0809B322:
	movs r0, 0x1
_0809B324:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809B150

	thumb_func_start sub_809B1D8
sub_809B1D8: @ 809B32C
	push {r4,r5,lr}
	ldr r0, _0809B348
	ldr r4, [r0]
	ldr r0, _0809B34C
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _0809B374
	cmp r0, 0x1
	bgt _0809B350
	cmp r0, 0
	beq _0809B356
	b _0809B398
	.align 2, 0
_0809B348: .4byte gUnknown_083B6DB4
_0809B34C: .4byte 0x000012a8
_0809B350:
	cmp r0, 0x2
	beq _0809B394
	b _0809B398
_0809B356:
	bl sub_809B324
	lsls r0, 24
	cmp r0, 0
	bne _0809B398
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	bl sub_809B3E0
	b _0809B38C
_0809B374:
	bl sub_809B358
	lsls r0, 24
	cmp r0, 0
	bne _0809B398
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
_0809B38C:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0809B398
_0809B394:
	movs r0, 0
	b _0809B39A
_0809B398:
	movs r0, 0x1
_0809B39A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809B1D8

	thumb_func_start sub_809B24C
sub_809B24C: @ 809B3A0
	push {r4,r5,lr}
	ldr r0, _0809B3BC
	ldr r4, [r0]
	ldr r0, _0809B3C0
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _0809B434
	cmp r0, 0x1
	bgt _0809B3C4
	cmp r0, 0
	beq _0809B3CA
	b _0809B470
	.align 2, 0
_0809B3BC: .4byte gUnknown_083B6DB4
_0809B3C0: .4byte 0x000012a8
_0809B3C4:
	cmp r0, 0x2
	beq _0809B46C
	b _0809B470
_0809B3CA:
	ldr r0, _0809B3E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809B3EC
	cmp r0, 0x1
	bne _0809B46C
	ldr r2, _0809B3E8
	adds r1, r4, r2
	movs r0, 0xE
	b _0809B3F4
	.align 2, 0
_0809B3E4: .4byte gUnknown_020384E4
_0809B3E8: .4byte 0x000012a9
_0809B3EC:
	bl get_preferred_box
	ldr r2, _0809B424
	adds r1, r4, r2
_0809B3F4:
	strb r0, [r1]
	ldr r0, _0809B428
	ldr r4, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, _0809B424
	adds r0, r4, r2
	ldrb r0, [r0]
	ldr r1, _0809B42C
	ldrb r1, [r1]
	bl sub_80996B0
	ldr r0, _0809B430
	adds r4, r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0809B470
	.align 2, 0
_0809B424: .4byte 0x000012a9
_0809B428: .4byte gUnknown_083B6DB4
_0809B42C: .4byte gUnknown_020384E5
_0809B430: .4byte 0x000012a8
_0809B434:
	bl sub_809971C
	lsls r0, 24
	cmp r0, 0
	bne _0809B470
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	ldr r2, _0809B464
	adds r0, r4, r2
	ldrb r0, [r0]
	ldr r1, _0809B468
	ldrb r1, [r1]
	bl diegohint1
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0809B470
	.align 2, 0
_0809B464: .4byte 0x000012a9
_0809B468: .4byte gUnknown_020384E5
_0809B46C:
	movs r0, 0
	b _0809B472
_0809B470:
	movs r0, 0x1
_0809B472:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809B24C

	thumb_func_start sub_809B324
sub_809B324: @ 809B478
	push {lr}
	ldr r0, _0809B49C
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0809B492
	cmp r0, 0x8
	beq _0809B4A0
_0809B492:
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _0809B4A4
	.align 2, 0
_0809B49C: .4byte gUnknown_083B6DB4
_0809B4A0:
	movs r0, 0
	b _0809B4A6
_0809B4A4:
	movs r0, 0x1
_0809B4A6:
	pop {r1}
	bx r1
	thumb_func_end sub_809B324

	thumb_func_start sub_809B358
sub_809B358: @ 809B4AC
	push {lr}
	ldr r0, _0809B4CC
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0809B4D0
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	strh r0, [r1, 0x26]
	movs r0, 0x1
	b _0809B4D2
	.align 2, 0
_0809B4CC: .4byte gUnknown_083B6DB4
_0809B4D0:
	movs r0, 0
_0809B4D2:
	pop {r1}
	bx r1
	thumb_func_end sub_809B358

	thumb_func_start sub_809B384
sub_809B384: @ 809B4D8
	push {r4,lr}
	ldr r0, _0809B500
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809B508
	cmp r0, 0x1
	bne _0809B526
	ldr r4, _0809B504
	ldrb r1, [r4]
	movs r0, 0xE
	bl sub_809B44C
	ldrb r1, [r4]
	movs r0, 0
	bl sub_8099584
	b _0809B520
	.align 2, 0
_0809B500: .4byte gUnknown_020384E4
_0809B504: .4byte gUnknown_020384E5
_0809B508:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0809B52C
	ldrb r1, [r4]
	bl sub_809B44C
	ldrb r1, [r4]
	movs r0, 0x1
	bl sub_8099584
_0809B520:
	ldr r1, _0809B530
	movs r0, 0x1
	strb r0, [r1]
_0809B526:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B52C: .4byte gUnknown_020384E5
_0809B530: .4byte gUnknown_020384E6
	thumb_func_end sub_809B384

	thumb_func_start sub_809B3E0
sub_809B3E0: @ 809B534
	push {r4,r5,lr}
	ldr r0, _0809B55C
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809B564
	cmp r0, 0x1
	bne _0809B586
	ldr r4, _0809B560
	ldrb r1, [r4]
	movs r0, 0xE
	bl diegohint2
	ldrb r1, [r4]
	movs r0, 0xE
	bl sub_809960C
	b _0809B580
	.align 2, 0
_0809B55C: .4byte gUnknown_020384E4
_0809B560: .4byte gUnknown_020384E5
_0809B564:
	bl get_preferred_box
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0809B58C
	ldrb r1, [r5]
	adds r0, r4, 0
	bl diegohint2
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_809960C
_0809B580:
	ldr r1, _0809B590
	movs r0, 0
	strb r0, [r1]
_0809B586:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B58C: .4byte gUnknown_020384E5
_0809B590: .4byte gUnknown_020384E6
	thumb_func_end sub_809B3E0

	thumb_func_start sub_809B440
sub_809B440: @ 809B594
	push {lr}
	bl sub_809BF74
	pop {r0}
	bx r0
	thumb_func_end sub_809B440

	thumb_func_start sub_809B44C
sub_809B44C: @ 809B5A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0xE
	bne _0809B5DC
	ldr r0, _0809B5CC
	ldr r0, [r0]
	ldr r1, _0809B5D0
	adds r0, r1
	ldr r3, _0809B5D4
	ldr r1, _0809B5D8
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x64
	muls r1, r2
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	b _0809B5FE
	.align 2, 0
_0809B5CC: .4byte gUnknown_083B6DB4
_0809B5D0: .4byte 0x000025b4
_0809B5D4: .4byte gPlayerParty
_0809B5D8: .4byte gUnknown_020384E5
_0809B5DC:
	lsls r1, r4, 2
	adds r1, r4
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 4
	ldr r2, _0809B614
	adds r1, r2
	adds r0, r1
	ldr r1, _0809B618
	ldr r1, [r1]
	ldr r2, _0809B61C
	adds r1, r2
	bl sub_803B4B4
_0809B5FE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_809B548
	ldr r0, _0809B620
	strb r4, [r0]
	ldr r0, _0809B624
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B614: .4byte gUnknown_020300A4
_0809B618: .4byte gUnknown_083B6DB4
_0809B61C: .4byte 0x000025b4
_0809B620: .4byte gUnknown_020384E7
_0809B624: .4byte gUnknown_020384E8
	thumb_func_end sub_809B44C

	thumb_func_start diegohint2
diegohint2: @ 809B628
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r6, 0xE
	bne _0809B65C
	ldr r1, _0809B650
	movs r0, 0x64
	muls r0, r5
	adds r0, r1
	ldr r1, _0809B654
	ldr r1, [r1]
	ldr r2, _0809B658
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	b _0809B68A
	.align 2, 0
_0809B650: .4byte gPlayerParty
_0809B654: .4byte gUnknown_083B6DB4
_0809B658: .4byte 0x000025b4
_0809B65C:
	ldr r0, _0809B690
	ldr r4, [r0]
	ldr r0, _0809B694
	adds r4, r0
	adds r0, r4, 0
	bl pokemon_restore_pp
	ldr r3, _0809B698
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	lsls r2, r6, 2
	adds r2, r6
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 5
	adds r0, r1
	adds r0, r3
	adds r0, 0x4
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
_0809B68A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B690: .4byte gUnknown_083B6DB4
_0809B694: .4byte 0x000025b4
_0809B698: .4byte gPokemonStorage
	thumb_func_end diegohint2

	thumb_func_start sub_809B548
sub_809B548: @ 809B69C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r0, 0xE
	bne _0809B6BC
	movs r0, 0x64
	muls r0, r2
	ldr r1, _0809B6B8
	adds r0, r1
	bl ZeroMonData
	b _0809B6D6
	.align 2, 0
_0809B6B8: .4byte gPlayerParty
_0809B6BC:
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809B6DC
	adds r1, r2
	adds r0, r1
	bl ZeroBoxMonData
_0809B6D6:
	pop {r0}
	bx r0
	.align 2, 0
_0809B6DC: .4byte gUnknown_020300A4
	thumb_func_end sub_809B548

	thumb_func_start diegohint1
diegohint1: @ 809B6E0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r5, 0xE
	bne _0809B714
	ldr r0, _0809B708
	ldr r0, [r0]
	ldr r1, _0809B70C
	adds r0, r1
	ldr r2, _0809B710
	movs r1, 0x64
	muls r1, r6
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	b _0809B736
	.align 2, 0
_0809B708: .4byte gUnknown_083B6DB4
_0809B70C: .4byte 0x00002618
_0809B710: .4byte gPlayerParty
_0809B714:
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 4
	ldr r2, _0809B768
	adds r1, r2
	adds r0, r1
	ldr r1, _0809B76C
	ldr r1, [r1]
	ldr r2, _0809B770
	adds r1, r2
	bl sub_803B4B4
_0809B736:
	adds r0, r5, 0
	adds r1, r6, 0
	bl diegohint2
	ldr r0, _0809B76C
	ldr r1, [r0]
	ldr r0, _0809B774
	adds r4, r1, r0
	ldr r2, _0809B770
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_809C04C
	ldr r0, _0809B778
	strb r5, [r0]
	ldr r0, _0809B77C
	strb r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B768: .4byte gUnknown_020300A4
_0809B76C: .4byte gUnknown_083B6DB4
_0809B770: .4byte 0x00002618
_0809B774: .4byte 0x000025b4
_0809B778: .4byte gUnknown_020384E7
_0809B77C: .4byte gUnknown_020384E8
	thumb_func_end diegohint1

	thumb_func_start sub_809B62C
sub_809B62C: @ 809B780
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8095B24
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0809B79E
	movs r0, 0
	b _0809B800
_0809B79E:
	ldr r5, _0809B7BC
	ldrb r0, [r5]
	cmp r0, 0
	beq _0809B7C0
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r6, 0
	bl diegohint2
	bl sub_8099480
	movs r0, 0
	strb r0, [r5]
	b _0809B7DA
	.align 2, 0
_0809B7BC: .4byte gUnknown_020384E6
_0809B7C0:
	ldr r5, _0809B808
	ldrb r1, [r5]
	movs r0, 0xE
	bl sub_809B44C
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r6, 0
	bl diegohint2
	ldrb r0, [r5]
	bl sub_8099520
_0809B7DA:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0809B7EC
	lsrs r0, r4, 24
	bl sub_8098D20
_0809B7EC:
	ldr r0, _0809B80C
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x1
_0809B800:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809B808: .4byte gUnknown_020384E5
_0809B80C: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B62C

	thumb_func_start sub_809B6BC
sub_809B6BC: @ 809B810
	push {lr}
	ldr r0, _0809B82C
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	bl sub_809BF74
	pop {r0}
	bx r0
	.align 2, 0
_0809B82C: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B6BC

	thumb_func_start sub_809B6DC
sub_809B6DC: @ 809B830
	push {lr}
	ldr r0, _0809B840
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B844
	movs r2, 0x2
	b _0809B854
	.align 2, 0
_0809B840: .4byte gUnknown_020384E6
_0809B844:
	ldr r0, _0809B874
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0x1
	eors r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r2, r0, 31
_0809B854:
	ldr r0, _0809B878
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_809981C
	ldr r0, _0809B87C
	ldr r1, [r0]
	ldr r2, _0809B880
	adds r0, r1, r2
	ldr r2, _0809B884
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_0809B874: .4byte gUnknown_020384E4
_0809B878: .4byte gUnknown_020384E5
_0809B87C: .4byte gUnknown_083B6DB4
_0809B880: .4byte 0x000026e4
_0809B884: .4byte 0x000011fa
	thumb_func_end sub_809B6DC

	thumb_func_start sub_809B734
sub_809B734: @ 809B888
	push {lr}
	bl sub_80998D8
	lsls r0, 24
	cmp r0, 0
	beq _0809B898
	movs r0, 0x1
	b _0809B8AC
_0809B898:
	ldr r0, _0809B8B0
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
_0809B8AC:
	pop {r1}
	bx r1
	.align 2, 0
_0809B8B0: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B734

	thumb_func_start sub_809B760
sub_809B760: @ 809B8B4
	push {lr}
	bl sub_8099920
	ldr r1, _0809B8C8
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809B8CC
	movs r0, 0
	strb r0, [r1]
	b _0809B8F2
	.align 2, 0
_0809B8C8: .4byte gUnknown_020384E6
_0809B8CC:
	ldr r0, _0809B8DC
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809B8E0
	movs r2, 0xE
	b _0809B8E8
	.align 2, 0
_0809B8DC: .4byte gUnknown_020384E4
_0809B8E0:
	bl get_preferred_box
	lsls r0, 24
	lsrs r2, r0, 24
_0809B8E8:
	ldr r0, _0809B8FC
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_809B548
_0809B8F2:
	bl sub_809BF74
	pop {r0}
	bx r0
	.align 2, 0
_0809B8FC: .4byte gUnknown_020384E5
	thumb_func_end sub_809B760

	thumb_func_start sub_809B7AC
sub_809B7AC: @ 809B900
	push {lr}
	ldr r0, _0809B920
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B91C
	ldr r0, _0809B924
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
_0809B91C:
	pop {r0}
	bx r0
	.align 2, 0
_0809B920: .4byte gUnknown_020384E6
_0809B924: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B7AC

	thumb_func_start sub_809B7D4
sub_809B7D4: @ 809B928
	push {r4-r6,lr}
	ldr r0, _0809B958
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B970
	ldr r0, _0809B95C
	ldr r4, [r0]
	ldr r1, _0809B960
	adds r0, r4, r1
	ldr r2, _0809B964
	adds r1, r4, r2
	movs r2, 0x64
	bl memcpy
	ldr r0, _0809B968
	adds r1, r4, r0
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _0809B96C
	adds r4, r1
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4]
	b _0809B9FA
	.align 2, 0
_0809B958: .4byte gUnknown_020384E6
_0809B95C: .4byte gUnknown_083B6DB4
_0809B960: .4byte 0x00002618
_0809B964: .4byte 0x000025b4
_0809B968: .4byte 0x00002682
_0809B96C: .4byte 0x00002683
_0809B970:
	ldr r0, _0809B9A0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809B9B8
	ldr r0, _0809B9A4
	ldr r4, [r0]
	ldr r2, _0809B9A8
	adds r0, r4, r2
	ldr r3, _0809B9AC
	ldr r1, _0809B9B0
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x64
	muls r1, r2
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	ldr r0, _0809B9B4
	adds r4, r0
	movs r0, 0xE
	b _0809B9EA
	.align 2, 0
_0809B9A0: .4byte gUnknown_020384E4
_0809B9A4: .4byte gUnknown_083B6DB4
_0809B9A8: .4byte 0x00002618
_0809B9AC: .4byte gPlayerParty
_0809B9B0: .4byte gUnknown_020384E5
_0809B9B4: .4byte 0x00002682
_0809B9B8:
	ldr r5, _0809BA50
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809BA54
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r2, r5, 0x4
	adds r1, r2
	adds r0, r1
	ldr r1, _0809BA58
	ldr r4, [r1]
	ldr r2, _0809BA5C
	adds r1, r4, r2
	bl sub_803B4B4
	ldrb r0, [r5]
	ldr r1, _0809BA60
	adds r4, r1
_0809B9EA:
	strb r0, [r4]
	ldr r0, _0809BA58
	ldr r0, [r0]
	ldr r1, _0809BA54
	ldrb r1, [r1]
	ldr r2, _0809BA64
	adds r0, r2
	strb r1, [r0]
_0809B9FA:
	ldr r0, _0809BA58
	ldr r6, [r0]
	ldr r0, _0809BA68
	adds r4, r6, r0
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0809BA6C
	adds r5, r6, r1
	strb r0, [r5]
	ldr r0, _0809BA70
	adds r2, r6, r0
	movs r0, 0x39
	strh r0, [r2]
	ldr r0, _0809BA74
	adds r1, r6, r0
	ldr r0, _0809BA78
	strh r0, [r1]
	ldr r0, _0809BA7C
	adds r1, r6, r0
	ldr r0, _0809BA80
	strh r0, [r1]
	ldr r1, _0809BA5C
	adds r0, r6, r1
	movs r1, 0x50
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	movs r2, 0x1
	ands r1, r2
	strb r1, [r4]
	lsrs r0, 17
	movs r1, 0x1
	ands r0, r1
	strb r0, [r5]
	ldrh r0, [r4]
	cmp r0, 0
	beq _0809BA88
	ldr r2, _0809BA84
	adds r1, r6, r2
	movs r0, 0
	strb r0, [r1]
	b _0809BA94
	.align 2, 0
_0809BA50: .4byte gPokemonStorage
_0809BA54: .4byte gUnknown_020384E5
_0809BA58: .4byte gUnknown_083B6DB4
_0809BA5C: .4byte 0x00002618
_0809BA60: .4byte 0x00002682
_0809BA64: .4byte 0x00002683
_0809BA68: .4byte 0x0000267e
_0809BA6C: .4byte 0x0000267f
_0809BA70: .4byte 0x00002686
_0809BA74: .4byte 0x00002688
_0809BA78: .4byte 0x00000123
_0809BA7C: .4byte 0x0000268a
_0809BA80: .4byte 0x00000163
_0809BA84: .4byte 0x0000267d
_0809BA88:
	ldr r2, _0809BAA8
	adds r0, r6, r2
	strb r1, [r0]
	subs r2, 0x1
	adds r0, r6, r2
	strb r1, [r0]
_0809BA94:
	ldr r0, _0809BAAC
	ldr r0, [r0]
	ldr r1, _0809BAB0
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BAA8: .4byte 0x0000267d
_0809BAAC: .4byte gUnknown_083B6DB4
_0809BAB0: .4byte 0x00002684
	thumb_func_end sub_809B7D4

	thumb_func_start sub_809B960
sub_809B960: @ 809BAB4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0809BADC
	ldr r2, [r0]
	ldr r3, _0809BAE0
	adds r1, r2, r3
	ldrb r1, [r1]
	mov r12, r0
	cmp r1, 0
	beq _0809BAE8
	ldr r7, _0809BAE4
	adds r0, r2, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	b _0809BCB0
	.align 2, 0
_0809BADC: .4byte gUnknown_083B6DB4
_0809BAE0: .4byte 0x0000267d
_0809BAE4: .4byte 0x0000267c
_0809BAE8:
	ldr r1, _0809BAF8
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809BAFC
	cmp r0, 0x1
	beq _0809BBD8
	b _0809BCAC
	.align 2, 0
_0809BAF8: .4byte 0x00002684
_0809BAFC:
	movs r5, 0
	movs r6, 0
_0809BB00:
	mov r2, r12
	ldr r4, [r2]
	ldr r3, _0809BB7C
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xE
	bne _0809BB20
	ldr r7, _0809BB80
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r5
	beq _0809BB56
_0809BB20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0809BB84
	adds r0, r1
	ldr r1, _0809BB88
	adds r2, r4, r1
	movs r1, 0x50
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0809BB44
	ldr r2, _0809BB8C
	adds r0, r4, r2
	strb r6, [r0]
_0809BB44:
	movs r0, 0x2
	ands r3, r0
	ldr r7, _0809BB90
	mov r12, r7
	cmp r3, 0
	beq _0809BB56
	ldr r1, _0809BB94
	adds r0, r4, r1
	strb r6, [r0]
_0809BB56:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0809BB00
	mov r3, r12
	ldr r2, [r3]
	ldr r7, _0809BB8C
	adds r0, r2, r7
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809BBA0
	ldr r1, _0809BB98
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r3, _0809BB9C
	b _0809BCA8
	.align 2, 0
_0809BB7C: .4byte 0x00002682
_0809BB80: .4byte 0x00002683
_0809BB84: .4byte gPlayerParty
_0809BB88: .4byte 0x00002686
_0809BB8C: .4byte 0x0000267e
_0809BB90: .4byte gUnknown_083B6DB4
_0809BB94: .4byte 0x0000267f
_0809BB98: .4byte 0x0000267d
_0809BB9C: .4byte 0x0000267c
_0809BBA0:
	movs r7, 0x9A
	lsls r7, 6
	adds r0, r2, r7
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809BBBC
	adds r0, r2, r3
	strb r1, [r0]
	adds r7, 0x4
	adds r1, r2, r7
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0809BCAC
	.align 2, 0
_0809BBBC: .4byte 0x00002681
_0809BBC0:
	ldr r1, _0809BBD0
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r7, _0809BBD4
	adds r0, r2, r7
	strb r3, [r0]
	b _0809BC90
	.align 2, 0
_0809BBD0: .4byte 0x0000267d
_0809BBD4: .4byte 0x0000267c
_0809BBD8:
	movs r5, 0
	mov r9, r12
	adds r4, r2, 0
	movs r0, 0x9A
	lsls r0, 6
	adds r6, r4, r0
	ldr r1, _0809BCC0
	adds r1, r4
	mov r8, r1
	ldr r2, _0809BCC4
	mov r10, r2
_0809BBEE:
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r3, _0809BCC8
	adds r1, r4, r3
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809BCCC
	adds r1, r2
	adds r0, r1
	movs r1, 0x50
	ldr r7, _0809BCD0
	adds r2, r4, r7
	bl GetBoxMonData
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0809BC54
	ldr r1, _0809BCD4
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r2, [r6]
	mov r1, r10
	ands r1, r0
	mov r0, r10
	ands r0, r2
	cmp r1, r0
	beq _0809BC54
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0809BC46
	ldr r2, _0809BCD8
	adds r1, r4, r2
	movs r0, 0
	strb r0, [r1]
_0809BC46:
	movs r0, 0x2
	ands r3, r0
	cmp r3, 0
	beq _0809BC54
	movs r0, 0
	mov r3, r8
	strb r0, [r3]
_0809BC54:
	mov r7, r9
	ldr r2, [r7]
	ldr r0, _0809BCC8
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	ldr r7, _0809BCDC
	mov r12, r7
	cmp r0, 0x1D
	ble _0809BC86
	strb r3, [r1]
	movs r0, 0x9A
	lsls r0, 6
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xD
	bgt _0809BBC0
_0809BC86:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _0809BBEE
_0809BC90:
	mov r1, r12
	ldr r2, [r1]
	ldr r3, _0809BCD8
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809BCAC
	ldr r7, _0809BCE0
	adds r0, r2, r7
	movs r1, 0x1
	strb r1, [r0]
	subs r3, 0x2
_0809BCA8:
	adds r0, r2, r3
	strb r1, [r0]
_0809BCAC:
	movs r0, 0x1
	negs r0, r0
_0809BCB0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809BCC0: .4byte 0x0000267f
_0809BCC4: .4byte 0x0000ffff
_0809BCC8: .4byte 0x00002681
_0809BCCC: .4byte gUnknown_020300A4
_0809BCD0: .4byte 0x00002686
_0809BCD4: .4byte 0x00002682
_0809BCD8: .4byte 0x0000267e
_0809BCDC: .4byte gUnknown_083B6DB4
_0809BCE0: .4byte 0x0000267d
	thumb_func_end sub_809B960

	thumb_func_start sub_809BB90
sub_809BB90: @ 809BCE4
	push {lr}
	ldr r0, _0809BD04
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BCFE
	ldr r0, _0809BD08
	ldr r1, _0809BD0C
	ldr r1, [r1]
	ldr r2, _0809BD10
	adds r1, r2
	movs r2, 0x64
	bl memcpy
_0809BCFE:
	pop {r0}
	bx r0
	.align 2, 0
_0809BD04: .4byte gUnknown_020384E6
_0809BD08: .4byte gUnknown_02038480
_0809BD0C: .4byte gUnknown_083B6DB4
_0809BD10: .4byte 0x000025b4
	thumb_func_end sub_809BB90

	thumb_func_start sub_809BBC0
sub_809BBC0: @ 809BD14
	push {lr}
	ldr r0, _0809BD38
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BD5C
	ldr r0, _0809BD3C
	ldrb r0, [r0]
	cmp r0, 0xE
	bne _0809BD4C
	ldr r0, _0809BD40
	ldr r0, [r0]
	ldr r1, _0809BD44
	adds r0, r1
	ldr r1, _0809BD48
	movs r2, 0x64
	bl memcpy
	b _0809BD5C
	.align 2, 0
_0809BD38: .4byte gUnknown_020384E6
_0809BD3C: .4byte gUnknown_020384E7
_0809BD40: .4byte gUnknown_083B6DB4
_0809BD44: .4byte 0x000025b4
_0809BD48: .4byte gUnknown_02038480
_0809BD4C:
	ldr r0, _0809BD60
	ldr r0, [r0]
	ldr r1, _0809BD64
	adds r0, r1
	ldr r1, _0809BD68
	movs r2, 0x50
	bl memcpy
_0809BD5C:
	pop {r0}
	bx r0
	.align 2, 0
_0809BD60: .4byte gUnknown_083B6DB4
_0809BD64: .4byte 0x000025b4
_0809BD68: .4byte gUnknown_02038480
	thumb_func_end sub_809BBC0

	thumb_func_start sub_809BC18
sub_809BC18: @ 809BD6C
	push {r4,r5,lr}
	ldr r0, _0809BD9C
	ldrb r5, [r0]
	cmp r5, 0
	beq _0809BDB8
	bl sub_809BB90
	ldr r0, _0809BDA0
	ldr r2, [r0]
	ldr r0, _0809BDA4
	adds r1, r2, r0
	ldr r0, _0809BDA8
	str r0, [r1]
	ldr r1, _0809BDAC
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809BDB0
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0809BDB4
	adds r2, r0
	strb r1, [r2]
	b _0809BE46
	.align 2, 0
_0809BD9C: .4byte gUnknown_020384E6
_0809BDA0: .4byte gUnknown_083B6DB4
_0809BDA4: .4byte 0x00002690
_0809BDA8: .4byte gUnknown_02038480
_0809BDAC: .4byte 0x0000268d
_0809BDB0: .4byte 0x0000268c
_0809BDB4: .4byte 0x0000268e
_0809BDB8:
	ldr r0, _0809BDF0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809BE10
	ldr r0, _0809BDF4
	ldr r4, [r0]
	ldr r2, _0809BDF8
	adds r1, r4, r2
	ldr r0, _0809BDFC
	str r0, [r1]
	ldr r0, _0809BE00
	ldrb r1, [r0]
	ldr r3, _0809BE04
	adds r0, r4, r3
	strb r1, [r0]
	bl sub_8095C28
	subs r0, 0x1
	ldr r2, _0809BE08
	adds r1, r4, r2
	strb r0, [r1]
	ldr r3, _0809BE0C
	adds r4, r3
	strb r5, [r4]
	b _0809BE46
	.align 2, 0
_0809BDF0: .4byte gUnknown_020384E4
_0809BDF4: .4byte gUnknown_083B6DB4
_0809BDF8: .4byte 0x00002690
_0809BDFC: .4byte gPlayerParty
_0809BE00: .4byte gUnknown_020384E5
_0809BE04: .4byte 0x0000268d
_0809BE08: .4byte 0x0000268c
_0809BE0C: .4byte 0x0000268e
_0809BE10:
	ldr r0, _0809BE4C
	ldr r3, [r0]
	ldr r0, _0809BE50
	adds r4, r3, r0
	ldr r2, _0809BE54
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	adds r2, 0x4
	adds r0, r2
	str r0, [r4]
	ldr r0, _0809BE58
	ldrb r1, [r0]
	ldr r2, _0809BE5C
	adds r0, r3, r2
	strb r1, [r0]
	ldr r0, _0809BE60
	adds r1, r3, r0
	movs r0, 0x1D
	strb r0, [r1]
	ldr r1, _0809BE64
	adds r3, r1
	movs r0, 0x5
	strb r0, [r3]
_0809BE46:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE4C: .4byte gUnknown_083B6DB4
_0809BE50: .4byte 0x00002690
_0809BE54: .4byte gPokemonStorage
_0809BE58: .4byte gUnknown_020384E5
_0809BE5C: .4byte 0x0000268d
_0809BE60: .4byte 0x0000268c
_0809BE64: .4byte 0x0000268e
	thumb_func_end sub_809BC18

	thumb_func_start sub_809BD14
sub_809BD14: @ 809BE68
	push {lr}
	ldr r0, _0809BE78
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BE7C
	bl sub_809BBC0
	b _0809BE84
	.align 2, 0
_0809BE78: .4byte gUnknown_020384E6
_0809BE7C:
	ldr r0, _0809BE88
	ldr r1, _0809BE8C
	ldrb r1, [r1, 0x9]
	strb r1, [r0]
_0809BE84:
	pop {r0}
	bx r0
	.align 2, 0
_0809BE88: .4byte gUnknown_020384E5
_0809BE8C: .4byte 0x02018000
	thumb_func_end sub_809BD14

	thumb_func_start party_compaction
party_compaction: @ 809BE90
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r7, _0809BEDC
	movs r6, 0
	movs r5, 0
	movs r0, 0x64
	mov r9, r0
	ldr r1, _0809BEE0
	mov r8, r1
	subs r0, 0x65
	mov r10, r0
_0809BEAC:
	mov r0, r9
	muls r0, r6
	mov r1, r8
	adds r4, r0, r1
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	cmp r0, 0
	beq _0809BEE4
	cmp r6, r5
	beq _0809BED4
	mov r0, r9
	muls r0, r5
	add r0, r8
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
_0809BED4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	b _0809BEEE
	.align 2, 0
_0809BEDC: .4byte 0x0000ffff
_0809BEE0: .4byte gPlayerParty
_0809BEE4:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r10
	bne _0809BEEE
	adds r7, r6, 0
_0809BEEE:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _0809BEAC
	lsls r7, 16
	cmp r5, 0x5
	bhi _0809BF16
	movs r6, 0x64
	ldr r4, _0809BF28
_0809BF02:
	adds r0, r5, 0
	muls r0, r6
	adds r0, r4
	bl ZeroMonData
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0809BF02
_0809BF16:
	asrs r0, r7, 16
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809BF28: .4byte gPlayerParty
	thumb_func_end party_compaction

	thumb_func_start sub_809BDD8
sub_809BDD8: @ 809BF2C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r1, _0809BF58
	ldr r2, [r1]
	ldr r3, _0809BF5C
	adds r1, r2, r3
	strb r0, [r1]
	ldr r0, _0809BF60
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BF68
	ldr r1, _0809BF64
	adds r0, r2, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	b _0809BFBC
	.align 2, 0
_0809BF58: .4byte gUnknown_083B6DB4
_0809BF5C: .4byte 0x000011f7
_0809BF60: .4byte gUnknown_020384E6
_0809BF64: .4byte 0x000025b4
_0809BF68:
	ldr r4, _0809BFC4
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1
	bne _0809BF88
	ldr r0, _0809BFC8
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809BFCC
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
_0809BF88:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _0809BFBC
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809BFC8
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809BFD0
	adds r1, r2
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetBoxMonData
_0809BFBC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809BFC4: .4byte gUnknown_020384E4
_0809BFC8: .4byte gUnknown_020384E5
_0809BFCC: .4byte gPlayerParty
_0809BFD0: .4byte gUnknown_020300A4
	thumb_func_end sub_809BDD8

	thumb_func_start sub_809BE80
sub_809BE80: @ 809BFD4
	push {lr}
	ldr r0, _0809BFFC
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809C008
	ldr r0, _0809C000
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C008
	ldr r0, _0809C004
	ldrb r0, [r0]
	bl sub_8095BB4
	lsls r0, 24
	cmp r0, 0
	bne _0809C008
	movs r0, 0x1
	b _0809C00A
	.align 2, 0
_0809BFFC: .4byte gUnknown_020384E4
_0809C000: .4byte gUnknown_020384E6
_0809C004: .4byte gUnknown_020384E5
_0809C008:
	movs r0, 0
_0809C00A:
	pop {r1}
	bx r1
	thumb_func_end sub_809BE80

	thumb_func_start sub_809BEBC
sub_809BEBC: @ 809C010
	push {lr}
	ldr r0, _0809C054
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C06C
	ldr r0, _0809C058
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809C050
	ldr r0, _0809C05C
	ldrb r0, [r0]
	bl sub_8095BB4
	lsls r0, 24
	cmp r0, 0
	bne _0809C050
	ldr r0, _0809C060
	ldr r1, [r0]
	ldr r2, _0809C064
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C06C
	ldr r2, _0809C068
	adds r0, r1, r2
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0809C06C
_0809C050:
	movs r0, 0x1
	b _0809C06E
	.align 2, 0
_0809C054: .4byte gUnknown_020384E6
_0809C058: .4byte gUnknown_020384E4
_0809C05C: .4byte gUnknown_020384E5
_0809C060: .4byte gUnknown_083B6DB4
_0809C064: .4byte 0x000011f9
_0809C068: .4byte 0x000025b4
_0809C06C:
	movs r0, 0
_0809C06E:
	pop {r1}
	bx r1
	thumb_func_end sub_809BEBC

	thumb_func_start sub_809BF20
sub_809BF20: @ 809C074
	ldr r0, _0809C07C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0809C07C: .4byte gUnknown_020384E6
	thumb_func_end sub_809BF20

	thumb_func_start sub_809BF2C
sub_809BF2C: @ 809C080
	push {lr}
	movs r1, 0
	ldr r0, _0809C098
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _0809C092
	movs r1, 0x1
_0809C092:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_0809C098: .4byte gUnknown_020384E4
	thumb_func_end sub_809BF2C

	thumb_func_start sub_809BF48
sub_809BF48: @ 809C09C
	push {lr}
	movs r1, 0
	ldr r0, _0809C0C0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _0809C0BA
	ldr r0, _0809C0C4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809C0BA
	movs r1, 0x1
_0809C0BA:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_0809C0C0: .4byte gUnknown_020384E4
_0809C0C4: .4byte gUnknown_020384E5
	thumb_func_end sub_809BF48

	thumb_func_start sub_809BF74
sub_809BF74: @ 809C0C8
	push {r4,lr}
	ldr r0, _0809C0FC
	ldr r1, [r0]
	movs r2, 0
	ldr r3, _0809C100
	ldrb r0, [r3]
	cmp r0, 0
	bne _0809C0DA
	movs r2, 0x1
_0809C0DA:
	ldr r4, _0809C104
	adds r0, r1, r4
	strb r2, [r0]
	ldrb r0, [r3]
	cmp r0, 0
	bne _0809C16C
	ldr r0, _0809C108
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _0809C112
	cmp r0, 0x1
	bgt _0809C10C
	cmp r0, 0
	beq _0809C142
	b _0809C16C
	.align 2, 0
_0809C0FC: .4byte gUnknown_083B6DB4
_0809C100: .4byte gUnknown_020384E6
_0809C104: .4byte 0x000011f6
_0809C108: .4byte gUnknown_020384E4
_0809C10C:
	cmp r0, 0x3
	bgt _0809C16C
	b _0809C138
_0809C112:
	ldr r1, _0809C130
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0809C138
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809C134
	adds r0, r1
	movs r1, 0
	bl sub_809C04C
	b _0809C16C
	.align 2, 0
_0809C130: .4byte gUnknown_020384E5
_0809C134: .4byte gPlayerParty
_0809C138:
	movs r0, 0
	movs r1, 0x2
	bl sub_809C04C
	b _0809C16C
_0809C142:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809C174
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809C178
	adds r1, r2
	adds r0, r1
	movs r1, 0x1
	bl sub_809C04C
_0809C16C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C174: .4byte gUnknown_020384E5
_0809C178: .4byte gUnknown_020300A4
	thumb_func_end sub_809BF74

	thumb_func_start sub_809C028
sub_809C028: @ 809C17C
	push {lr}
	ldr r0, _0809C190
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C198
	ldr r0, _0809C194
	movs r1, 0
	bl sub_809C04C
	b _0809C19C
	.align 2, 0
_0809C190: .4byte gUnknown_020384E6
_0809C194: .4byte gUnknown_02038480
_0809C198:
	bl sub_809BF74
_0809C19C:
	pop {r0}
	bx r0
	thumb_func_end sub_809C028

	thumb_func_start sub_809C04C
sub_809C04C: @ 809C1A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809C250
	ldr r6, [r0]
	ldr r2, _0809C254
	adds r2, r6
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r2]
	cmp r1, 0
	bne _0809C274
	adds r0, r7, 0
	movs r1, 0x41
	bl GetMonData
	ldr r2, _0809C258
	adds r1, r6, r2
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0809C1E0
	b _0809C340
_0809C1E0:
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	ldr r2, _0809C25C
	adds r1, r6, r2
	strb r0, [r1]
	ldr r0, _0809C260
	adds r4, r6, r0
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r7, 0
	movs r1, 0x38
	bl GetMonData
	ldr r2, _0809C264
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetMonData
	ldr r2, _0809C268
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	ldr r2, _0809C26C
	adds r1, r6, r2
	str r0, [r1]
	adds r0, r7, 0
	bl pokemon_get_pal
	ldr r2, _0809C270
	adds r1, r6, r2
	str r0, [r1]
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0xC
	bl GetMonData
	b _0809C306
	.align 2, 0
_0809C250: .4byte gUnknown_083B6DB4
_0809C254: .4byte 0x000011f2
_0809C258: .4byte 0x000011f0
_0809C25C: .4byte 0x000011f9
_0809C260: .4byte 0x000011fa
_0809C264: .4byte 0x000011f8
_0809C268: .4byte 0x000011f7
_0809C26C: .4byte 0x000011ec
_0809C270: .4byte 0x000011e8
_0809C274:
	cmp r1, 0x1
	bne _0809C328
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonData
	ldr r2, _0809C30C
	adds r5, r6, r2
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0809C340
	adds r0, r7, 0
	movs r1, 0x1
	bl GetBoxMonData
	mov r9, r0
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetBoxMonData
	ldr r2, _0809C310
	adds r1, r6, r2
	strb r0, [r1]
	ldr r0, _0809C314
	adds r4, r6, r0
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetBoxMonData
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r7, 0
	bl GetLevelFromBoxMonExp
	ldr r2, _0809C318
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetBoxMonData
	ldr r2, _0809C31C
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r2, r0, 0
	ldr r0, _0809C320
	adds r4, r6, r0
	str r2, [r4]
	ldrh r0, [r5]
	mov r1, r9
	bl species_and_otid_get_pal
	ldr r2, _0809C324
	adds r1, r6, r2
	str r0, [r1]
	ldrh r0, [r5]
	ldr r1, [r4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0xC
	bl GetBoxMonData
_0809C306:
	mov r1, r8
	strh r0, [r1]
	b _0809C332
	.align 2, 0
_0809C30C: .4byte 0x000011f0
_0809C310: .4byte 0x000011f9
_0809C314: .4byte 0x000011fa
_0809C318: .4byte 0x000011f8
_0809C31C: .4byte 0x000011f7
_0809C320: .4byte 0x000011ec
_0809C324: .4byte 0x000011e8
_0809C328:
	ldr r2, _0809C374
	adds r0, r6, r2
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0]
_0809C332:
	ldr r0, _0809C378
	ldr r4, [r0]
	ldr r2, _0809C374
	adds r0, r4, r2
	ldrh r1, [r0]
	cmp r1, 0
	bne _0809C390
_0809C340:
	ldr r0, _0809C378
	ldr r1, [r0]
	ldr r0, _0809C37C
	adds r2, r1, r0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _0809C380
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r0, _0809C384
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r0, _0809C388
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r2, _0809C38C
	adds r1, r2
	strb r0, [r1]
	b _0809C592
	.align 2, 0
_0809C374: .4byte 0x000011f0
_0809C378: .4byte gUnknown_083B6DB4
_0809C37C: .4byte 0x000011fa
_0809C380: .4byte 0x0000120f
_0809C384: .4byte 0x00001234
_0809C388: .4byte 0x00001259
_0809C38C: .4byte 0x0000127a
_0809C390:
	ldr r2, _0809C3E0
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C3F8
	ldr r0, _0809C3E4
	adds r7, r4, r0
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x4
	strb r0, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r0, 0x1
	strb r0, [r7, 0x4]
	ldr r1, _0809C3E8
	adds r7, r4, r1
	adds r2, 0x1
	adds r1, r4, r2
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _0809C3EC
	adds r1, r4, r0
	movs r0, 0xFF
	strb r0, [r1]
	ldr r2, _0809C3F0
	adds r1, r4, r2
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1]
	ldr r0, _0809C3F4
	adds r1, r4, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1]
	b _0809C592
	.align 2, 0
_0809C3E0: .4byte 0x000011f9
_0809C3E4: .4byte 0x0000120f
_0809C3E8: .4byte 0x00001214
_0809C3EC: .4byte 0x00001234
_0809C3F0: .4byte 0x00001259
_0809C3F4: .4byte 0x0000127a
_0809C3F8:
	cmp r1, 0x20
	beq _0809C400
	cmp r1, 0x1D
	bne _0809C404
_0809C400:
	movs r1, 0xFF
	str r1, [sp]
_0809C404:
	ldr r0, _0809C4DC
	ldr r4, [r0]
	ldr r2, _0809C4E0
	adds r7, r4, r2
	movs r0, 0xFC
	mov r9, r0
	strb r0, [r7]
	movs r1, 0x4
	mov r8, r1
	strb r1, [r7, 0x1]
	movs r2, 0xF
	strb r2, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r6, 0x1
	strb r6, [r7, 0x4]
	ldr r1, _0809C4E4
	adds r7, r4, r1
	ldr r2, _0809C4E8
	adds r1, r4, r2
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _0809C4EC
	adds r7, r4, r0
	mov r1, r9
	strb r1, [r7]
	mov r2, r8
	strb r2, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r1, 0
	strb r1, [r7, 0x3]
	strb r6, [r7, 0x4]
	mov r2, r9
	strb r2, [r7, 0x5]
	movs r0, 0x13
	mov r10, r0
	strb r0, [r7, 0x6]
	movs r1, 0x7
	strb r1, [r7, 0x7]
	movs r0, 0xBA
	strb r0, [r7, 0x8]
	ldr r2, _0809C4F0
	adds r7, r4, r2
	ldr r1, _0809C4F4
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _0809C4F8
	adds r1, r0
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	mov r2, r9
	strb r2, [r7]
	mov r0, r10
	strb r0, [r7, 0x1]
	movs r0, 0x50
	strb r0, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	ldr r1, _0809C4FC
	adds r7, r4, r1
	strb r2, [r7]
	mov r2, r8
	strb r2, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r1, 0
	strb r1, [r7, 0x3]
	strb r6, [r7, 0x4]
	mov r2, r9
	strb r2, [r7, 0x5]
	mov r0, r10
	strb r0, [r7, 0x6]
	movs r6, 0x8
	strb r6, [r7, 0x7]
	ldr r1, _0809C500
	adds r7, r4, r1
	movs r0, 0x34
	strb r0, [r7]
	ldr r2, _0809C504
	adds r7, r4, r2
	ldr r0, _0809C508
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r7, 0
	movs r2, 0x22
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	mov r1, r9
	strb r1, [r7]
	movs r0, 0x11
	strb r0, [r7, 0x1]
	strb r6, [r7, 0x2]
	adds r7, 0x3
	ldr r2, [sp]
	cmp r2, 0
	beq _0809C50C
	cmp r2, 0xFE
	beq _0809C524
	b _0809C53E
	.align 2, 0
_0809C4DC: .4byte gUnknown_083B6DB4
_0809C4E0: .4byte 0x0000120f
_0809C4E4: .4byte 0x00001214
_0809C4E8: .4byte 0x000011fa
_0809C4EC: .4byte 0x00001234
_0809C4F0: .4byte 0x0000123d
_0809C4F4: .4byte 0x000011f0
_0809C4F8: .4byte gSpeciesNames
_0809C4FC: .4byte 0x00001259
_0809C500: .4byte 0x00001261
_0809C504: .4byte 0x00001262
_0809C508: .4byte 0x000011f8
_0809C50C:
	mov r0, r9
	strb r0, [r7]
	mov r1, r8
	strb r1, [r7, 0x1]
	strb r1, [r7, 0x2]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r7, 0x3]
	movs r0, 0x5
	strb r0, [r7, 0x4]
	movs r0, 0xB5
	b _0809C53A
_0809C524:
	mov r0, r9
	strb r0, [r7]
	mov r1, r8
	strb r1, [r7, 0x1]
	movs r0, 0x6
	strb r0, [r7, 0x2]
	movs r2, 0
	strb r2, [r7, 0x3]
	movs r0, 0x7
	strb r0, [r7, 0x4]
	movs r0, 0xB6
_0809C53A:
	strb r0, [r7, 0x5]
	adds r7, 0x6
_0809C53E:
	movs r5, 0xFF
	strb r5, [r7]
	ldr r0, _0809C5A4
	ldr r2, [r0]
	ldr r1, _0809C5A8
	adds r7, r2, r1
	ldr r0, _0809C5AC
	adds r3, r2, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _0809C590
	movs r4, 0xFC
	strb r4, [r7]
	movs r1, 0x4
	strb r1, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r0, 0x1
	strb r0, [r7, 0x4]
	ldr r0, _0809C5B0
	adds r7, r2, r0
	strb r4, [r7]
	movs r0, 0x6
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	ldr r1, _0809C5B4
	adds r7, r2, r1
	ldrh r0, [r3]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	strb r4, [r7]
	movs r0, 0x7
	strb r0, [r7, 0x1]
	adds r7, 0x2
_0809C590:
	strb r5, [r7]
_0809C592:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C5A4: .4byte gUnknown_083B6DB4
_0809C5A8: .4byte 0x0000127a
_0809C5AC: .4byte 0x000011f2
_0809C5B0: .4byte 0x0000127f
_0809C5B4: .4byte 0x00001282
	thumb_func_end sub_809C04C

	thumb_func_start sub_809C464
sub_809C464: @ 809C5B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0809C62C
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, _0809C630
	ldrb r4, [r2]
	ldr r0, _0809C634
	ldr r1, [r0]
	ldr r0, _0809C638
	adds r7, r1, r0
	movs r0, 0
	strb r0, [r7]
	ldr r3, _0809C63C
	adds r5, r1, r3
	strb r0, [r5]
	adds r3, 0x4
	adds r6, r1, r3
	strb r0, [r6]
	ldr r0, _0809C640
	mov r12, r0
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _0809C5F4
	b _0809C77E
_0809C5F4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809C644
	movs r1, 0x1
	mov r9, r1
	lsls r0, r4, 24
	movs r3, 0xC0
	lsls r3, 19
	adds r0, r3
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x1D
	bgt _0809C612
	b _0809C79C
_0809C612:
	movs r1, 0x3
	mov r8, r1
	subs r0, 0x1E
	lsls r0, 24
	asrs r0, 24
	bl __divsi3
	lsls r0, 24
	lsrs r4, r0, 24
	mov r3, r9
	strb r3, [r7]
	strb r3, [r6]
	b _0809C79C
	.align 2, 0
_0809C62C: .4byte gUnknown_020384E4
_0809C630: .4byte gUnknown_020384E5
_0809C634: .4byte gUnknown_083B6DB4
_0809C638: .4byte 0x000011de
_0809C63C: .4byte 0x000011df
_0809C640: .4byte gMain
_0809C644:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809C678
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 24
	cmp r0, 0
	beq _0809C668
	lsls r0, r4, 24
	movs r1, 0xFF
	lsls r1, 24
	b _0809C790
_0809C668:
	movs r0, 0xFF
	strb r0, [r5]
	lsls r0, r4, 24
	movs r3, 0xA0
	lsls r3, 19
	adds r0, r3
	lsrs r4, r0, 24
	b _0809C79C
_0809C678:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809C6A8
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, 0x1
	movs r1, 0x6
	bl __modsi3
	cmp r0, 0
	beq _0809C69C
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	b _0809C790
_0809C69C:
	mov r3, r9
	strb r3, [r5]
	lsls r0, r4, 24
	movs r1, 0xFB
	lsls r1, 24
	b _0809C790
_0809C6A8:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0809C6BE
	movs r0, 0x1
	mov r9, r0
	movs r1, 0x2
	mov r8, r1
	b _0809C79A
_0809C6BE:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C728
	bl sub_809CAB0
	lsls r0, 24
	cmp r0, 0
	beq _0809C728
	ldr r0, _0809C6DC
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C6E0
	movs r0, 0x8
	b _0809C7AC
	.align 2, 0
_0809C6DC: .4byte gUnknown_020384E9
_0809C6E0:
	movs r0, 0
	bl sub_809CE4C
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _0809C728
	lsls r0, 2
	ldr r1, _0809C6FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C6FC: .4byte _0809C700
	.align 2, 0
_0809C700:
	.4byte _0809C714
	.4byte _0809C718
	.4byte _0809C71C
	.4byte _0809C720
	.4byte _0809C724
_0809C714:
	movs r0, 0xB
	b _0809C7AC
_0809C718:
	movs r0, 0xC
	b _0809C7AC
_0809C71C:
	movs r0, 0xD
	b _0809C7AC
_0809C720:
	movs r0, 0xE
	b _0809C7AC
_0809C724:
	movs r0, 0xF
	b _0809C7AC
_0809C728:
	ldr r2, _0809C738
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C73C
	movs r0, 0x10
	b _0809C7AC
	.align 2, 0
_0809C738: .4byte gMain
_0809C73C:
	ldr r0, _0809C754
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809C766
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0809C758
	movs r0, 0xA
	b _0809C7AC
	.align 2, 0
_0809C754: .4byte gSaveBlock2
_0809C758:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _0809C766
	movs r0, 0x9
	b _0809C7AC
_0809C766:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C778
	bl sub_809CD88
	movs r0, 0
	b _0809C7AC
_0809C778:
	movs r3, 0
	mov r9, r3
	b _0809C7AA
_0809C77E:
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	ble _0809C796
	lsls r0, r4, 24
	movs r1, 0xFA
	lsls r1, 24
_0809C790:
	adds r0, r1
	lsrs r4, r0, 24
	b _0809C79C
_0809C796:
	movs r3, 0x2
	mov r8, r3
_0809C79A:
	movs r4, 0
_0809C79C:
	mov r0, r9
	cmp r0, 0
	beq _0809C7AA
	mov r0, r8
	adds r1, r4, 0
	bl sub_809AF18
_0809C7AA:
	mov r0, r9
_0809C7AC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C464

	thumb_func_start sub_809C664
sub_809C664: @ 809C7B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0809C82C
	ldrb r0, [r0]
	mov r10, r0
	ldr r7, _0809C830
	ldrb r4, [r7]
	ldr r2, _0809C834
	ldr r5, [r2]
	ldr r1, _0809C838
	adds r0, r5, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809C83C
	adds r0, r5, r3
	strb r1, [r0]
	adds r3, 0x5
	adds r0, r5, r3
	strb r1, [r0]
	mov r9, r1
	mov r8, r1
	ldr r1, _0809C840
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	adds r6, r7, 0
	mov r12, r2
	adds r2, r1, 0
	cmp r0, 0
	beq _0809C7FC
	b _0809C970
_0809C7FC:
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0809C844
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x6
	ble _0809C816
	movs r4, 0
_0809C816:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	bne _0809C824
	b _0809C990
_0809C824:
	movs r2, 0x1
	mov r8, r2
	b _0809C996
	.align 2, 0
_0809C82C: .4byte gUnknown_020384E4
_0809C830: .4byte gUnknown_020384E5
_0809C834: .4byte gUnknown_083B6DB4
_0809C838: .4byte 0x000011df
_0809C83C: .4byte 0x000011de
_0809C840: .4byte gMain
_0809C844:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0809C868
	ldrb r1, [r6]
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0
	beq _0809C868
	movs r3, 0x1
	mov r8, r3
	ldr r2, _0809C864
	adds r0, r5, r2
	strb r1, [r0]
	movs r4, 0
	b _0809C990
	.align 2, 0
_0809C864: .4byte 0x000011e2
_0809C868:
	ldrh r1, [r2, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809C89C
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0
	bne _0809C890
	movs r3, 0x1
	mov r8, r3
	mov r1, r12
	ldr r0, [r1]
	ldr r2, _0809C88C
	adds r0, r2
	ldrb r4, [r0]
	b _0809C990
	.align 2, 0
_0809C88C: .4byte 0x000011e2
_0809C890:
	movs r3, 0x6
	mov r8, r3
	movs r0, 0
	mov r10, r0
	movs r4, 0
	b _0809C990
_0809C89C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C924
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x6
	bne _0809C8C2
	mov r1, r12
	ldr r0, [r1]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809C8BC
	movs r0, 0x4
	b _0809C9A0
_0809C8BC:
	movs r2, 0x1
	mov r9, r2
	b _0809C924
_0809C8C2:
	bl sub_809CAB0
	lsls r0, 24
	cmp r0, 0
	beq _0809C924
	ldr r0, _0809C8D8
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C8DC
	movs r0, 0x8
	b _0809C9A0
	.align 2, 0
_0809C8D8: .4byte gUnknown_020384E9
_0809C8DC:
	movs r0, 0
	bl sub_809CE4C
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _0809C924
	lsls r0, 2
	ldr r1, _0809C8F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C8F8: .4byte _0809C8FC
	.align 2, 0
_0809C8FC:
	.4byte _0809C910
	.4byte _0809C914
	.4byte _0809C918
	.4byte _0809C91C
	.4byte _0809C920
_0809C910:
	movs r0, 0xB
	b _0809C9A0
_0809C914:
	movs r0, 0xC
	b _0809C9A0
_0809C918:
	movs r0, 0xD
	b _0809C9A0
_0809C91C:
	movs r0, 0xE
	b _0809C9A0
_0809C920:
	movs r0, 0xF
	b _0809C9A0
_0809C924:
	ldr r2, _0809C940
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C94C
	ldr r0, _0809C944
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809C948
	movs r0, 0x10
	b _0809C9A0
	.align 2, 0
_0809C940: .4byte gMain
_0809C944: .4byte gUnknown_083B6DB4
_0809C948:
	movs r3, 0x1
	mov r9, r3
_0809C94C:
	mov r0, r9
	cmp r0, 0
	beq _0809C95E
	movs r1, 0x6
	mov r8, r1
	movs r2, 0
	mov r10, r2
	movs r4, 0
	b _0809C990
_0809C95E:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C990
	bl sub_809CD88
	movs r0, 0
	b _0809C9A0
_0809C970:
	lsls r0, r4, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r0, r3
	lsrs r4, r0, 24
	cmp r0, 0
	bge _0809C980
	movs r4, 0x6
_0809C980:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r7, r1]
	cmp r0, r1
	beq _0809C990
	movs r0, 0x1
	mov r8, r0
_0809C990:
	mov r1, r8
	cmp r1, 0
	beq _0809C99E
_0809C996:
	mov r0, r10
	adds r1, r4, 0
	bl sub_809AF18
_0809C99E:
	mov r0, r8
_0809C9A0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C664

	thumb_func_start sub_809C85C
sub_809C85C: @ 809C9B0
	push {r4-r6,lr}
	ldr r0, _0809C9E8
	ldr r2, [r0]
	ldr r1, _0809C9EC
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809C9F0
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0809C9F4
	adds r2, r0
	strb r1, [r2]
	ldr r1, _0809C9F8
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	bne _0809CA6E
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0809C9FC
	movs r4, 0x1
	movs r0, 0
	movs r5, 0x2
	b _0809CA76
	.align 2, 0
_0809C9E8: .4byte gUnknown_083B6DB4
_0809C9EC: .4byte 0x000011df
_0809C9F0: .4byte 0x000011de
_0809C9F4: .4byte 0x000011e3
_0809C9F8: .4byte gMain
_0809C9FC:
	ldrh r2, [r1, 0x2C]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0809CA20
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0809CA32
	ldr r0, _0809CA24
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809CA36
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0809CA28
_0809CA20:
	movs r0, 0xA
	b _0809CA92
	.align 2, 0
_0809CA24: .4byte gSaveBlock2
_0809CA28:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0809CA36
_0809CA32:
	movs r0, 0x9
	b _0809CA92
_0809CA36:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809CA4E
	movs r0, 0
	bl sub_809A860
	bl sub_809CA8C
	movs r0, 0x7
	b _0809CA92
_0809CA4E:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809CA5A
	movs r0, 0x10
	b _0809CA92
_0809CA5A:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809CA6A
	bl sub_809CD88
	movs r0, 0
	b _0809CA92
_0809CA6A:
	movs r4, 0
	b _0809CA90
_0809CA6E:
	movs r4, 0x1
	movs r0, 0x3
	movs r5, 0
	strb r4, [r2]
_0809CA76:
	cmp r4, 0
	beq _0809CA90
	lsls r6, r0, 24
	cmp r0, 0x2
	beq _0809CA86
	movs r0, 0
	bl sub_809A860
_0809CA86:
	lsrs r0, r6, 24
	lsls r1, r5, 24
	lsrs r1, 24
	bl sub_809AF18
_0809CA90:
	adds r0, r4, 0
_0809CA92:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809C85C

	thumb_func_start sub_809C944
sub_809C944: @ 809CA98
	push {r4-r7,lr}
	ldr r0, _0809CADC
	ldrb r0, [r0]
	mov r12, r0
	ldr r7, _0809CAE0
	ldrb r3, [r7]
	ldr r0, _0809CAE4
	ldr r1, [r0]
	ldr r0, _0809CAE8
	adds r5, r1, r0
	movs r0, 0
	strb r0, [r5]
	ldr r2, _0809CAEC
	adds r4, r1, r2
	strb r0, [r4]
	adds r2, 0x5
	adds r1, r2
	strb r0, [r1]
	ldr r6, _0809CAF0
	ldrh r2, [r6, 0x30]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _0809CB68
	movs r0, 0x88
	ands r0, r2
	cmp r0, 0
	beq _0809CAF4
	movs r6, 0x1
	movs r0, 0x2
	mov r12, r0
	movs r3, 0
	b _0809CB7E
	.align 2, 0
_0809CADC: .4byte gUnknown_020384E4
_0809CAE0: .4byte gUnknown_020384E5
_0809CAE4: .4byte gUnknown_083B6DB4
_0809CAE8: .4byte 0x000011df
_0809CAEC: .4byte 0x000011de
_0809CAF0: .4byte gMain
_0809CAF4:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0809CB14
	movs r6, 0x1
	lsls r0, r3, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r3, r0, 24
	cmp r0, 0
	bge _0809CB80
	movs r0, 0xFF
	strb r0, [r5]
	movs r3, 0x1
	b _0809CB80
_0809CB14:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _0809CB34
	movs r6, 0x1
	lsls r0, r3, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x1
	ble _0809CB80
	strb r6, [r5]
	movs r3, 0
	b _0809CB80
_0809CB34:
	ldrh r1, [r6, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809CB48
	movs r0, 0x4
	cmp r3, 0
	bne _0809CB8E
	movs r0, 0x5
	b _0809CB8E
_0809CB48:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809CB54
	movs r0, 0x10
	b _0809CB8E
_0809CB54:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809CB64
	bl sub_809CD88
	movs r0, 0
	b _0809CB8E
_0809CB64:
	movs r6, 0
	b _0809CB8C
_0809CB68:
	movs r6, 0x1
	movs r0, 0
	mov r12, r0
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	ldrsb r0, [r7, r0]
	movs r3, 0x1D
	cmp r0, 0
	bne _0809CB7E
	movs r3, 0x18
_0809CB7E:
	strb r6, [r1]
_0809CB80:
	cmp r6, 0
	beq _0809CB8C
	mov r0, r12
	adds r1, r3, 0
	bl sub_809AF18
_0809CB8C:
	adds r0, r6, 0
_0809CB8E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C944

	thumb_func_start sub_809CA40
sub_809CA40: @ 809CB94
	push {r4,r5,lr}
	movs r3, 0
	ldr r0, _0809CBC0
	ldr r1, [r0]
	adds r4, r0, 0
	cmp r1, 0
	beq _0809CBD8
	ldr r5, _0809CBC4
_0809CBA4:
	lsls r0, r3, 3
	adds r2, r0, r4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0809CBC8
	ldr r0, [r2]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	b _0809CBDA
	.align 2, 0
_0809CBC0: .4byte gUnknown_083BBBD4
_0809CBC4: .4byte gUnknown_020384E4
_0809CBC8:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 3
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	bne _0809CBA4
_0809CBD8:
	movs r0, 0
_0809CBDA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809CA40

	thumb_func_start sub_809CA8C
sub_809CA8C: @ 809CBE0
	push {lr}
	bl sub_809CDCC
	movs r0, 0x9
	bl sub_809CDEC
	movs r0, 0xA
	bl sub_809CDEC
	movs r0, 0xB
	bl sub_809CDEC
	movs r0, 0
	bl sub_809CDEC
	pop {r0}
	bx r0
	thumb_func_end sub_809CA8C

	thumb_func_start sub_809CAB0
sub_809CAB0: @ 809CC04
	push {lr}
	bl sub_809CDCC
	bl sub_809AB8C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0809CC28
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	beq _0809CC32
	cmp r0, 0x1
	bgt _0809CC2C
	cmp r0, 0
	beq _0809CC3E
	b _0809CC78
	.align 2, 0
_0809CC28: .4byte gUnknown_083B6DB4
_0809CC2C:
	cmp r0, 0x2
	beq _0809CC4A
	b _0809CC78
_0809CC32:
	cmp r1, 0
	beq _0809CC78
	movs r0, 0x1
	bl sub_809CDEC
	b _0809CC7C
_0809CC3E:
	cmp r1, 0
	beq _0809CC78
	movs r0, 0x2
	bl sub_809CDEC
	b _0809CC7C
_0809CC4A:
	ldr r0, _0809CC60
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809CC6C
	cmp r1, 0
	beq _0809CC64
	movs r0, 0x4
	bl sub_809CDEC
	b _0809CC7C
	.align 2, 0
_0809CC60: .4byte gUnknown_020384E6
_0809CC64:
	movs r0, 0x5
	bl sub_809CDEC
	b _0809CC7C
_0809CC6C:
	cmp r1, 0
	beq _0809CC78
	movs r0, 0x3
	bl sub_809CDEC
	b _0809CC7C
_0809CC78:
	movs r0, 0
	b _0809CCC2
_0809CC7C:
	movs r0, 0x6
	bl sub_809CDEC
	ldr r0, _0809CCA0
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x2
	bne _0809CCAE
	ldr r0, _0809CCA4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _0809CCA8
	movs r0, 0x2
	bl sub_809CDEC
	b _0809CCAE
	.align 2, 0
_0809CCA0: .4byte gUnknown_083B6DB4
_0809CCA4: .4byte gUnknown_020384E4
_0809CCA8:
	movs r0, 0x1
	bl sub_809CDEC
_0809CCAE:
	movs r0, 0x8
	bl sub_809CDEC
	movs r0, 0x7
	bl sub_809CDEC
	movs r0, 0
	bl sub_809CDEC
	movs r0, 0x1
_0809CCC2:
	pop {r1}
	bx r1
	thumb_func_end sub_809CAB0

	thumb_func_start sub_809CB74
sub_809CB74: @ 809CCC8
	ldr r1, _0809CCE4
	ldr r1, [r1]
	movs r2, 0x8E
	lsls r2, 5
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r1, [r1]
	ldrh r1, [r1, 0x22]
	adds r1, 0x14
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0809CCE4: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809CB74

	thumb_func_start unref_sub_809CB94
unref_sub_809CB94: @ 809CCE8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0809CD10
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809CD1C
	ldr r2, _0809CD14
	ldr r0, _0809CD18
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x50
	bl memcpy
	b _0809CD4A
	.align 2, 0
_0809CD10: .4byte gUnknown_020384E4
_0809CD14: .4byte gPlayerParty
_0809CD18: .4byte gUnknown_020384E5
_0809CD1C:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0809CD50
	ldr r1, _0809CD54
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	lsls r2, r0, 2
	adds r2, r0
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	adds r1, r3
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x50
	bl memcpy
_0809CD4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD50: .4byte gPokemonStorage
_0809CD54: .4byte gUnknown_020384E5
	thumb_func_end unref_sub_809CB94

	thumb_func_start sub_809CC04
sub_809CC04: @ 809CD58
	push {r4-r7,lr}
	sub sp, 0x34
	mov r1, sp
	ldr r0, _0809CE04
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r4, sp, 0x18
	adds r1, r4, 0
	ldr r0, _0809CE08
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	ldr r0, _0809CE0C
	bl IndexOfSpritePaletteTag
	ldr r1, _0809CE10
	ldr r6, [r1]
	ldr r4, _0809CE14
	adds r7, r6, r4
	strb r0, [r7]
	ldr r0, _0809CE18
	bl IndexOfSpritePaletteTag
	ldr r5, _0809CE1C
	adds r1, r6, r5
	strb r0, [r1]
	ldr r0, _0809CE20
	ldrb r0, [r0]
	ldr r1, _0809CE24
	ldrb r1, [r1]
	add r4, sp, 0x30
	mov r5, sp
	adds r5, 0x32
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_809AACC
	ldr r0, _0809CE28
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0
	ldrsh r2, [r5, r3]
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0809CE38
	movs r5, 0x8E
	lsls r5, 5
	adds r4, r6, r5
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0809CE2C
	adds r1, r0
	str r1, [r4]
	ldr r0, _0809CE30
	ldrb r0, [r0]
	adds r0, r7, r0
	ldrb r2, [r0]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, _0809CE34
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809CE42
	ldr r0, [r4]
	movs r1, 0x3
	bl StartSpriteAnim
	b _0809CE42
	.align 2, 0
_0809CE04: .4byte gHandCursorSpriteSheets
_0809CE08: .4byte gHandCursorSpritePalettes
_0809CE0C: .4byte 0x0000dac6
_0809CE10: .4byte gUnknown_083B6DB4
_0809CE14: .4byte 0x000011e4
_0809CE18: .4byte 0x0000dad1
_0809CE1C: .4byte 0x000011e5
_0809CE20: .4byte gUnknown_020384E4
_0809CE24: .4byte gUnknown_020384E5
_0809CE28: .4byte gSpriteTemplate_83BBC70
_0809CE2C: .4byte gSprites
_0809CE30: .4byte gUnknown_020384E9
_0809CE34: .4byte gUnknown_020384E6
_0809CE38:
	movs r0, 0x8E
	lsls r0, 5
	adds r1, r6, r0
	movs r0, 0
	str r0, [r1]
_0809CE42:
	ldr r0, _0809CE54
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809CE58
	movs r3, 0xC
	movs r5, 0x1
	b _0809CE5C
	.align 2, 0
_0809CE54: .4byte gUnknown_020384E4
_0809CE58:
	movs r3, 0x14
	movs r5, 0x2
_0809CE5C:
	ldr r0, _0809CEAC
	movs r1, 0
	movs r2, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0809CEC0
	ldr r0, _0809CEB0
	ldr r0, [r0]
	ldr r1, _0809CEB4
	adds r4, r0, r1
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0809CEB8
	adds r1, r0
	str r1, [r4]
	lsls r3, r5, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, _0809CEBC
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809CECC
	ldr r0, [r4]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0809CECC
	.align 2, 0
_0809CEAC: .4byte gSpriteTemplate_83BBC88
_0809CEB0: .4byte gUnknown_083B6DB4
_0809CEB4: .4byte 0x000011c4
_0809CEB8: .4byte gSprites
_0809CEBC: .4byte gUnknown_020384E4
_0809CEC0:
	ldr r0, _0809CED4
	ldr r0, [r0]
	ldr r2, _0809CED8
	adds r0, r2
	movs r1, 0
	str r1, [r0]
_0809CECC:
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CED4: .4byte gUnknown_083B6DB4
_0809CED8: .4byte 0x000011c4
	thumb_func_end sub_809CC04

	thumb_func_start sub_809CD88
sub_809CD88: @ 809CEDC
	push {lr}
	ldr r2, _0809CF14
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0809CEEA
	movs r1, 0x1
_0809CEEA:
	strb r1, [r2]
	ldr r0, _0809CF18
	ldr r0, [r0]
	movs r3, 0x8E
	lsls r3, 5
	adds r1, r0, r3
	ldr r3, [r1]
	ldr r1, _0809CF1C
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r3, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	pop {r0}
	bx r0
	.align 2, 0
_0809CF14: .4byte gUnknown_020384E9
_0809CF18: .4byte gUnknown_083B6DB4
_0809CF1C: .4byte 0x000011e4
	thumb_func_end sub_809CD88

	thumb_func_start sub_809CDCC
sub_809CDCC: @ 809CF20
	ldr r0, _0809CF34
	ldr r0, [r0]
	ldr r2, _0809CF38
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0809CF3C
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0809CF34: .4byte gUnknown_083B6DB4
_0809CF38: .4byte 0x000011b8
_0809CF3C: .4byte 0x000011b9
	thumb_func_end sub_809CDCC

	thumb_func_start sub_809CDEC
sub_809CDEC: @ 809CF40
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0809CF90
	ldr r5, [r0]
	ldr r0, _0809CF94
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x6
	bhi _0809CF8A
	adds r1, r0, 0
	lsls r1, 3
	movs r2, 0x8C
	lsls r2, 5
	adds r1, r2
	adds r1, r5, r1
	ldr r2, _0809CF98
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	str r3, [r1, 0x4]
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r1, 3
	ldr r2, _0809CF9C
	adds r0, r5, r2
	ldrb r2, [r0]
	cmp r1, r2
	bls _0809CF84
	strb r1, [r0]
_0809CF84:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0809CF8A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF90: .4byte gUnknown_083B6DB4
_0809CF94: .4byte 0x000011b8
_0809CF98: .4byte gUnknown_083BBCA0
_0809CF9C: .4byte 0x000011b9
	thumb_func_end sub_809CDEC

	thumb_func_start sub_809CE4C
sub_809CE4C: @ 809CFA0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0809CFC4
	ldr r1, [r0]
	ldr r3, _0809CFC8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _0809CFD0
	lsls r0, r2, 3
	ldr r2, _0809CFCC
	adds r1, r2
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	b _0809CFD4
	.align 2, 0
_0809CFC4: .4byte gUnknown_083B6DB4
_0809CFC8: .4byte 0x000011b8
_0809CFCC: .4byte 0x00001184
_0809CFD0:
	movs r0, 0x1
	negs r0, r0
_0809CFD4:
	pop {r1}
	bx r1
	thumb_func_end sub_809CE4C

	thumb_func_start sub_809CE84
sub_809CE84: @ 809CFD8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _0809D074
	ldr r4, [r0]
	ldr r0, _0809D078
	adds r0, r4
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0xE
	subs r1, r0
	ldr r3, _0809D07C
	adds r6, r4, r3
	movs r0, 0
	mov r10, r0
	strh r1, [r6]
	ldr r1, _0809D080
	adds r1, r4
	mov r9, r1
	ldrb r1, [r1]
	movs r0, 0x1C
	subs r0, r1
	subs r3, 0x2
	adds r5, r4, r3
	strh r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuDrawTextWindow
	ldrb r0, [r5]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x8C
	lsls r3, 5
	adds r4, r3
	adds r3, r4, 0
	bl PrintMenuItems
	ldrb r1, [r5]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	mov r4, r8
	ldrb r3, [r4]
	mov r0, r10
	str r0, [sp]
	mov r4, r9
	ldrb r0, [r4]
	str r0, [sp, 0x4]
	movs r0, 0
	bl InitMenu
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D074: .4byte gUnknown_083B6DB4
_0809D078: .4byte 0x000011b8
_0809D07C: .4byte 0x000011bc
_0809D080: .4byte 0x000011b9
	thumb_func_end sub_809CE84

	thumb_func_start sub_809CF30
sub_809CF30: @ 809D084
	push {r4,r5,lr}
	movs r5, 0x2
	negs r5, r5
	ldr r4, _0809D0C0
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809D0DA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809D0A6
	movs r0, 0x5
	bl PlaySE
	adds r5, 0x1
_0809D0A6:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809D0C4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0809D0E2
	.align 2, 0
_0809D0C0: .4byte gMain
_0809D0C4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809D0E2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0809D0E2
_0809D0DA:
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
_0809D0E2:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0809D106
	bl sub_8072DEC
	ldr r0, _0809D124
	ldr r1, [r0]
	ldr r2, _0809D128
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_0809D106:
	cmp r5, 0
	blt _0809D118
	ldr r0, _0809D124
	ldr r0, [r0]
	lsls r1, r5, 3
	ldr r2, _0809D12C
	adds r0, r2
	adds r0, r1
	ldr r5, [r0]
_0809D118:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809D124: .4byte gUnknown_083B6DB4
_0809D128: .4byte 0x000011ba
_0809D12C: .4byte 0x00001184
	thumb_func_end sub_809CF30

	thumb_func_start sub_809CFDC
sub_809CFDC: @ 809D130
	ldr r3, _0809D140
	str r0, [r3]
	str r1, [r0]
	movs r1, 0
	strb r2, [r0, 0x5]
	strb r1, [r0, 0x4]
	bx lr
	.align 2, 0
_0809D140: .4byte gUnknown_020384EC
	thumb_func_end sub_809CFDC

	thumb_func_start sub_809CFF0
sub_809CFF0: @ 809D144
	push {r4,r5,lr}
	ldr r2, _0809D184
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0809D17E
	movs r4, 0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _0809D176
	adds r5, r2, 0
_0809D15A:
	ldr r0, [r5]
	lsls r1, r4, 4
	ldr r0, [r0]
	adds r0, r1
	ldr r1, [r0, 0xC]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcc _0809D15A
_0809D176:
	ldr r0, _0809D184
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
_0809D17E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D184: .4byte gUnknown_020384EC
	thumb_func_end sub_809CFF0

	thumb_func_start sub_809D034
sub_809D034: @ 809D188
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	mov r9, r3
	ldr r0, [sp, 0x20]
	ldr r3, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0809D1F8
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _0809D200
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 4
	ldr r2, [r2]
	adds r2, r0
	lsls r0, r4, 1
	strh r0, [r2, 0x8]
	lsls r0, r6, 6
	add r0, r8
	mov r4, r10
	lsls r1, r4, 1
	adds r0, r1
	str r0, [r2, 0x4]
	lsls r0, r3, 6
	add r0, r9
	mov r7, r12
	lsls r1, r7, 1
	adds r0, r1
	str r0, [r2]
	strh r5, [r2, 0xA]
	ldr r0, _0809D1FC
	str r0, [r2, 0xC]
	movs r0, 0x1
	b _0809D202
	.align 2, 0
_0809D1F8: .4byte gUnknown_020384EC
_0809D1FC: .4byte sub_809D0BC
_0809D200:
	movs r0, 0
_0809D202:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D034

	thumb_func_start sub_809D0BC
sub_809D0BC: @ 809D210
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r6, [r0]
	ldr r5, [r0, 0x4]
	ldrh r7, [r0, 0xA]
	ldrh r2, [r0, 0x8]
	movs r4, 0
	cmp r4, r7
	bcs _0809D246
	lsrs r2, 1
	mov r8, r2
	ldr r0, _0809D254
	mov r9, r0
_0809D22E:
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r9
	ands r2, r3
	bl CpuSet
	adds r5, 0x40
	adds r6, 0x40
	adds r4, 0x1
	cmp r4, r7
	bcc _0809D22E
_0809D246:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D254: .4byte 0x001fffff
	thumb_func_end sub_809D0BC

	thumb_func_start sub_809D104
sub_809D104: @ 809D258
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	mov r8, r6
	ldr r6, [sp, 0x24]
	lsls r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsls r4, 16
	mov r7, r8
	lsls r7, 16
	lsls r6, 16
	lsrs r6, 16
	lsrs r4, 10
	adds r3, r4
	lsrs r5, 15
	adds r5, r3, r5
	lsls r3, r2, 6
	adds r3, r0, r3
	lsrs r1, 15
	adds r4, r3, r1
	adds r2, r6
	lsls r2, 6
	adds r6, r0, r2
	lsrs r2, r7, 15
	cmp r4, r6
	bcs _0809D2B0
	lsrs r7, r2, 1
	ldr r0, _0809D2BC
	mov r8, r0
_0809D29C:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	ands r2, r7
	bl CpuSet
	adds r4, 0x40
	adds r5, 0x40
	cmp r4, r6
	bcc _0809D29C
_0809D2B0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2BC: .4byte 0x001fffff
	thumb_func_end sub_809D104

	thumb_func_start sub_809D16C
sub_809D16C: @ 809D2C0
	push {r4-r7,lr}
	mov r12, r0
	ldr r0, [sp, 0x14]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0809D308
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	adds r2, r0, 0
	ldrb r7, [r1, 0x5]
	cmp r2, r7
	bcs _0809D310
	adds r0, 0x1
	strb r0, [r1, 0x4]
	lsls r0, r2, 4
	ldr r1, [r1]
	adds r1, r0
	lsls r0, r3, 1
	strh r0, [r1, 0x8]
	lsls r0, r4, 5
	adds r0, r6
	lsls r0, 1
	add r0, r12
	str r0, [r1, 0x4]
	strh r5, [r1, 0xA]
	ldr r0, _0809D30C
	str r0, [r1, 0xC]
	movs r0, 0x1
	b _0809D312
	.align 2, 0
_0809D308: .4byte gUnknown_020384EC
_0809D30C: .4byte sub_809D1C4
_0809D310:
	movs r0, 0
_0809D312:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D16C

	thumb_func_start sub_809D1C4
sub_809D1C4: @ 809D318
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	movs r0, 0
	ldrh r1, [r6, 0xA]
	cmp r0, r1
	bcs _0809D3A6
	movs r7, 0x80
	lsls r7, 5
	mov r5, sp
	ldr r2, _0809D364
	mov r8, r2
	movs r1, 0x81
	lsls r1, 24
	mov r10, r1
_0809D33E:
	ldr r2, [r6, 0x4]
	ldrh r3, [r6, 0x8]
	mov r12, r2
	adds r0, 0x1
	mov r9, r0
	cmp r3, r7
	bhi _0809D368
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, r12
	str r1, [r0, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
	mov r1, r8
	b _0809D390
	.align 2, 0
_0809D364: .4byte 0x040000d4
_0809D368:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _0809D3B8
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0809D3BC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r7
	subs r3, r7
	cmp r3, r7
	bhi _0809D368
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
_0809D390:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	adds r0, 0x40
	str r0, [r6, 0x4]
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	ldrh r2, [r6, 0xA]
	cmp r0, r2
	bcc _0809D33E
_0809D3A6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D3B8: .4byte 0x040000d4
_0809D3BC: .4byte 0x81000800
	thumb_func_end sub_809D1C4

	thumb_func_start unref_sub_809D26C
unref_sub_809D26C: @ 809D3C0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	adds r6, r3, 0
	ldr r3, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, sp
	ldr r4, _0809D434
	str r4, [sp]
	ldr r5, _0809D438
	lsls r4, r0, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp, 0x4]
	ldr r4, _0809D43C
	str r4, [sp, 0x8]
	ldr r4, _0809D440
	str r4, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r1, _0809D444
	adds r0, r1
	ldr r4, _0809D448
	adds r1, r4, 0
	ldrb r0, [r0]
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x14]
	lsls r2, 16
	asrs r2, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r2, 0
	adds r2, r6, 0
	bl sub_809D710
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0809D44C
	adds r0, r1
	bl sub_809D638
	adds r0, r4, 0
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D434: .4byte gOamData_83BC5E8
_0809D438: .4byte gMonIconTable
_0809D43C: .4byte gSpriteAnimTable_83BC62C
_0809D440: .4byte gSpriteAffineAnimTable_83BC660
_0809D444: .4byte gMonIconPaletteIndices
_0809D448: .4byte 0x0000dac0
_0809D44C: .4byte gSprites
	thumb_func_end unref_sub_809D26C

	thumb_func_start sub_809D2FC
sub_809D2FC: @ 809D450
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x48]
	ldr r1, [sp, 0x4C]
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0809D4E0
	str r0, [sp, 0x18]
	adds r0, r4, 0
	bl sub_809D4F4
	str r0, [sp, 0x1C]
	ldr r0, _0809D4E4
	str r0, [sp, 0x20]
	ldr r0, _0809D4E8
	str r0, [sp, 0x24]
	str r5, [sp, 0x28]
	ldr r0, _0809D4EC
	adds r0, r4, r0
	ldr r1, _0809D4F0
	adds r5, r1, 0
	ldrb r0, [r0]
	adds r1, r5, r0
	add r0, sp, 0x2C
	strh r1, [r0]
	add r1, sp, 0x18
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _0809D4AE
	mov r0, sp
	strh r5, [r0, 0x14]
_0809D4AE:
	lsls r1, r7, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r0, sp
	mov r3, r8
	bl sub_809D710
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0809D4F4
	adds r0, r1
	bl sub_809D638
	adds r0, r4, 0
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809D4E0: .4byte gOamData_83BC5E8
_0809D4E4: .4byte gSpriteAnimTable_83BC62C
_0809D4E8: .4byte gSpriteAffineAnimTable_83BC660
_0809D4EC: .4byte gMonIconPaletteIndices
_0809D4F0: .4byte 0x0000dac0
_0809D4F4: .4byte gSprites
	thumb_func_end sub_809D2FC

	thumb_func_start sub_809D3A4
sub_809D3A4: @ 809D4F8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	adds r6, r3, 0
	ldr r3, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, sp
	ldr r4, _0809D56C
	str r4, [sp]
	ldr r5, _0809D570
	lsls r4, r0, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp, 0x4]
	ldr r4, _0809D574
	str r4, [sp, 0x8]
	ldr r4, _0809D578
	str r4, [sp, 0xC]
	str r1, [sp, 0x10]
	ldr r1, _0809D57C
	adds r0, r1
	ldr r4, _0809D580
	adds r1, r4, 0
	ldrb r0, [r0]
	adds r1, r0
	mov r0, r8
	strh r1, [r0, 0x14]
	lsls r2, 16
	asrs r2, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r2, 0
	adds r2, r6, 0
	bl sub_809D710
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0809D584
	adds r0, r1
	bl sub_809D638
	adds r0, r4, 0
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D56C: .4byte gOamData_83BC5E8
_0809D570: .4byte gMonIconTable
_0809D574: .4byte gSpriteAnimTable_83BC62C
_0809D578: .4byte gSpriteAffineAnimTable_83BC660
_0809D57C: .4byte gMonIconPaletteIndices
_0809D580: .4byte 0x0000dac0
_0809D584: .4byte gSprites
	thumb_func_end sub_809D3A4

	thumb_func_start mon_icon_convert_unown_species_id
mon_icon_convert_unown_species_id: @ 809D588
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xC9
	bne _0809D5B2
	adds r0, r1, 0
	bl sub_809D474
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0809D5A4
	movs r0, 0xC9
	b _0809D5AE
_0809D5A4:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0809D5AE:
	adds r1, r0, 0
	b _0809D5C0
_0809D5B2:
	movs r0, 0xCE
	lsls r0, 1
	adds r1, r2, 0
	cmp r1, r0
	bls _0809D5C0
	movs r1, 0x82
	lsls r1, 1
_0809D5C0:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end mon_icon_convert_unown_species_id

	thumb_func_start sub_809D474
sub_809D474: @ 809D5C8
	push {lr}
	adds r2, r0, 0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809D474

	thumb_func_start sub_809D4A8
sub_809D4A8: @ 809D5FC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	mov r1, sp
	bl sub_80A2D64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bne _0809D632
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809D622
	mov r1, sp
	adds r0, 0xC9
	b _0809D62A
_0809D622:
	mov r1, sp
	movs r2, 0xCE
	lsls r2, 1
	adds r0, r2
_0809D62A:
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	b _0809D63E
_0809D632:
	adds r0, r4, 0
	movs r1, 0
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	lsrs r0, 16
_0809D63E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809D4A8

	thumb_func_start sub_809D4F4
sub_809D4F4: @ 809D648
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl mon_icon_convert_unown_species_id
	lsls r0, 16
	ldr r1, _0809D660
	lsrs r0, 14
	adds r0, r1
	ldr r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0809D660: .4byte gMonIconTable
	thumb_func_end sub_809D4F4

	thumb_func_start sub_809D510
sub_809D510: @ 809D664
	push {lr}
	bl sub_809D7E8
	pop {r0}
	bx r0
	thumb_func_end sub_809D510

	thumb_func_start sub_809D51C
sub_809D51C: @ 809D670
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0809D690
_0809D676:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadSpritePalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0809D676
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D690: .4byte gMonIconPaletteTable
	thumb_func_end sub_809D51C

	thumb_func_start unref_sub_809D540
unref_sub_809D540: @ 809D694
	push {r4,lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _0809D6A6
	movs r1, 0x82
	lsls r1, 1
_0809D6A6:
	ldr r0, _0809D6CC
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _0809D6D0
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809D6C6
	adds r0, r4, 0
	bl LoadSpritePalette
_0809D6C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D6CC: .4byte gMonIconPaletteIndices
_0809D6D0: .4byte gMonIconPaletteTable
	thumb_func_end unref_sub_809D540

	thumb_func_start sub_809D580
sub_809D580: @ 809D6D4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0809D700
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0809D704
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809D6FA
	adds r0, r4, 0
	bl LoadSpritePalette
_0809D6FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D700: .4byte gMonIconPaletteIndices
_0809D704: .4byte gMonIconPaletteTable
	thumb_func_end sub_809D580

	thumb_func_start unref_sub_809D5B4
unref_sub_809D5B4: @ 809D708
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0809D728
_0809D70E:
	lsls r0, r4, 3
	adds r0, r5
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0809D70E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D728: .4byte gMonIconPaletteTable
	thumb_func_end unref_sub_809D5B4

	thumb_func_start unref_sub_809D5D8
unref_sub_809D5D8: @ 809D72C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bls _0809D73E
	movs r1, 0x82
	lsls r1, 1
_0809D73E:
	ldr r0, _0809D754
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r1, _0809D758
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0809D754: .4byte gMonIconPaletteIndices
_0809D758: .4byte gMonIconPaletteTable
	thumb_func_end unref_sub_809D5D8

	thumb_func_start sub_809D608
sub_809D608: @ 809D75C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0809D778
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0809D77C
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0809D778: .4byte gMonIconPaletteIndices
_0809D77C: .4byte gMonIconPaletteTable
	thumb_func_end sub_809D608

	thumb_func_start sub_809D62C
sub_809D62C: @ 809D780
	push {lr}
	bl sub_809D638
	pop {r0}
	bx r0
	thumb_func_end sub_809D62C

	thumb_func_start sub_809D638
sub_809D638: @ 809D78C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	movs r7, 0
	adds r6, r4, 0
	adds r6, 0x2C
	ldrb r2, [r6]
	movs r0, 0x3F
	mov r9, r0
	ands r0, r2
	cmp r0, 0
	bne _0809D840
	movs r1, 0x2A
	adds r1, r4
	mov r8, r1
	ldrb r1, [r1]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r5, r4, 0
	adds r5, 0x2B
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	ldrsh r3, [r0, r1]
	movs r0, 0x2
	negs r0, r0
	cmp r3, r0
	beq _0809D7D6
	adds r0, 0x1
	cmp r3, r0
	bne _0809D7DA
	b _0809D854
_0809D7D6:
	strb r7, [r5]
	b _0809D854
_0809D7DA:
	ldr r2, _0809D838
	ldrb r1, [r4, 0x3]
	lsrs r1, 6
	lsls r1, 1
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrh r2, [r1]
	adds r1, r2, 0
	muls r1, r3
	ldr r0, [r4, 0xC]
	adds r0, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r3, _0809D83C
	adds r1, r3
	bl RequestSpriteCopy
	mov r0, r8
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r5]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	mov r1, r9
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldrb r7, [r5]
	b _0809D854
	.align 2, 0
_0809D838: .4byte gSpriteImageSizes
_0809D83C: .4byte 0x06010000
_0809D840:
	lsls r0, r2, 26
	lsrs r0, 26
	subs r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6]
_0809D854:
	adds r0, r7, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D638

	thumb_func_start sub_809D710
sub_809D710: @ 809D864
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x38
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	str r0, [sp, 0x30]
	ldr r2, _0809D92C
	mov r0, r9
	ldr r6, [r0]
	ldrb r1, [r6, 0x3]
	lsrs r1, 6
	lsls r1, 1
	ldrb r0, [r6, 0x1]
	lsrs r0, 6
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrh r2, [r1]
	ldr r1, _0809D930
	add r3, sp, 0x30
	ldr r0, [r3, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [r3, 0x4]
	add r1, sp, 0x18
	ldr r0, _0809D934
	strh r0, [r1]
	mov r0, r9
	ldrh r2, [r0, 0x14]
	mov r0, sp
	adds r0, 0x1A
	strh r2, [r0]
	str r6, [sp, 0x1C]
	mov r2, r9
	ldr r0, [r2, 0x8]
	str r0, [sp, 0x20]
	str r3, [sp, 0x24]
	ldr r0, [r2, 0xC]
	str r0, [sp, 0x28]
	ldr r0, [r2, 0x10]
	str r0, [sp, 0x2C]
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	mov r3, r8
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0809D938
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r4, r3, r6
	adds r5, r4, 0
	adds r5, 0x2C
	ldrb r1, [r5]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r5]
	adds r4, 0x3F
	ldrb r2, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r4]
	adds r6, 0xC
	adds r3, r6
	mov r2, r9
	ldr r1, [r2, 0x4]
	str r1, [r3]
	add sp, 0x38
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D92C: .4byte gSpriteImageSizes
_0809D930: .4byte 0xffff0000
_0809D934: .4byte 0x0000ffff
_0809D938: .4byte gSprites
	thumb_func_end sub_809D710

	thumb_func_start sub_809D7E8
sub_809D7E8: @ 809D93C
	push {lr}
	sub sp, 0x8
	movs r1, 0
	str r1, [sp]
	ldr r3, _0809D970
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r2, 1
	ldrb r1, [r0, 0x1]
	lsrs r1, 6
	lsls r1, 3
	adds r2, r1
	adds r2, r3
	ldrh r3, [r2]
	ldr r2, _0809D974
	ldr r1, [sp, 0x4]
	ands r1, r2
	orrs r1, r3
	str r1, [sp, 0x4]
	mov r1, sp
	str r1, [r0, 0xC]
	bl DestroySprite
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809D970: .4byte gSpriteImageSizes
_0809D974: .4byte 0xffff0000
	thumb_func_end sub_809D7E8

	thumb_func_start sub_809D824
sub_809D824: @ 809D978
	mov r12, r0
	adds r0, 0x2A
	movs r3, 0
	strb r1, [r0]
	mov r2, r12
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r0, r12
	adds r0, 0x2B
	strb r3, [r0]
	bx lr
	thumb_func_end sub_809D824

	thumb_func_start sub_809D844
sub_809D844: @ 809D998
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_809D844

	thumb_func_start sub_809D85C
sub_809D85C: @ 809D9B0
	push {lr}
	ldr r1, _0809D9F4
	ldr r0, _0809D9F8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809D9FC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809DA00
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809DA04
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809DA08
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809DA0C
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0809D9F4: .4byte 0x04000014
_0809D9F8: .4byte gUnknown_030042C0
_0809D9FC: .4byte gUnknown_030041B4
_0809DA00: .4byte gUnknown_03004288
_0809DA04: .4byte gUnknown_03004280
_0809DA08: .4byte gUnknown_030041B0
_0809DA0C: .4byte gUnknown_030041B8
	thumb_func_end sub_809D85C

	thumb_func_start sub_809D8BC
sub_809D8BC: @ 809DA10
	push {r4-r7,lr}
	ldr r4, [sp, 0x14]
	lsls r4, 24
	lsrs r7, r4, 24
	ldr r6, _0809DA58
	ldrb r4, [r6, 0x8]
	movs r5, 0x80
	orrs r4, r5
	strb r4, [r6, 0x8]
	ldr r5, _0809DA5C
	str r0, [r5]
	movs r4, 0
	strb r7, [r5, 0x8]
	strb r1, [r5, 0x9]
	strb r2, [r5, 0xA]
	str r3, [r5, 0x4]
	adds r0, r5, 0
	adds r0, 0x74
	strb r4, [r0]
	adds r1, r5, 0
	adds r1, 0x79
	movs r0, 0x4
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x7C
	movs r1, 0
	strh r4, [r0]
	adds r0, 0x4
	strb r1, [r0]
	subs r0, 0x5
	strb r1, [r0]
	cmp r7, 0x4
	bls _0809DA60
	movs r0, 0x1
	strb r0, [r5, 0xE]
	b _0809DA62
	.align 2, 0
_0809DA58: .4byte gPaletteFade
_0809DA5C: .4byte 0x02018000
_0809DA60:
	strb r1, [r5, 0xE]
_0809DA62:
	cmp r7, 0x6
	bhi _0809DB2A
	lsls r0, r7, 2
	ldr r1, _0809DA70
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809DA70: .4byte _0809DA74
	.align 2, 0
_0809DA74:
	.4byte _0809DA90
	.4byte _0809DB10
	.4byte _0809DAE6
	.4byte _0809DB2A
	.4byte _0809DABA
	.4byte _0809DA90
	.4byte _0809DB10
_0809DA90:
	adds r0, r5, 0
	adds r0, 0x75
	movs r1, 0
	strb r1, [r0]
	adds r2, r5, 0
	adds r2, 0x76
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x77
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x7E
	movs r0, 0x1
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x7
	strb r0, [r1]
	b _0809DB2A
_0809DABA:
	adds r0, r5, 0
	adds r0, 0x75
	movs r1, 0
	strb r1, [r0]
	adds r2, r5, 0
	adds r2, 0x76
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x77
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r0, 0x6
	movs r1, 0x1
	strb r1, [r0]
	adds r2, 0x9
	movs r0, 0x7
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x7B
	b _0809DB28
_0809DAE6:
	adds r1, r5, 0
	adds r1, 0x75
	movs r3, 0
	movs r0, 0x2
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x76
	movs r2, 0x3
	strb r2, [r0]
	adds r0, 0x1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r0, 0x6
	strb r2, [r0]
	adds r0, 0x1
	strb r3, [r0]
	subs r0, 0x6
	strb r3, [r0]
	b _0809DB2A
_0809DB10:
	adds r1, r5, 0
	adds r1, 0x75
	movs r0, 0x2
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x3
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x77
	movs r1, 0x1
	strb r1, [r0]
	adds r0, 0x1
_0809DB28:
	strb r1, [r0]
_0809DB2A:
	adds r0, r5, 0
	adds r0, 0x75
	ldrb r0, [r0]
	strb r0, [r5, 0xB]
	ldr r0, _0809DB40
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DB40: .4byte sub_809DE44
	thumb_func_end sub_809D8BC

	thumb_func_start sub_809D9F0
sub_809D9F0: @ 809DB44
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, [sp, 0x10]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r5, 16
	lsrs r5, 16
	movs r4, 0x2
	str r4, [sp]
	bl sub_809D8BC
	ldr r0, _0809DB6C
	adds r0, 0x7C
	strh r5, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DB6C: .4byte 0x02018000
	thumb_func_end sub_809D9F0

	thumb_func_start sub_809DA1C
sub_809DA1C: @ 809DB70
	push {lr}
	ldr r0, _0809DB84
	ldrb r0, [r0, 0x8]
	cmp r0, 0x6
	bhi _0809DBCC
	lsls r0, 2
	ldr r1, _0809DB88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809DB84: .4byte 0x02018000
_0809DB88: .4byte _0809DB8C
	.align 2, 0
_0809DB8C:
	.4byte _0809DBA8
	.4byte _0809DBC0
	.4byte _0809DBB8
	.4byte _0809DBB8
	.4byte _0809DBB0
	.4byte _0809DBA8
	.4byte _0809DBC0
_0809DBA8:
	ldr r0, _0809DBAC
	b _0809DBC2
	.align 2, 0
_0809DBAC: .4byte sub_809E19C
_0809DBB0:
	ldr r0, _0809DBB4
	b _0809DBC2
	.align 2, 0
_0809DBB4: .4byte sub_809E19C
_0809DBB8:
	ldr r0, _0809DBBC
	b _0809DBC2
	.align 2, 0
_0809DBBC: .4byte sub_809EB40
_0809DBC0:
	ldr r0, _0809DBD0
_0809DBC2:
	movs r1, 0
	bl CreateTask
	ldr r1, _0809DBD4
	strb r0, [r1, 0xF]
_0809DBCC:
	pop {r0}
	bx r0
	.align 2, 0
_0809DBD0: .4byte sub_809E3FC
_0809DBD4: .4byte 0x02018000
	thumb_func_end sub_809DA1C

	thumb_func_start sub_809DA84
sub_809DA84: @ 809DBD8
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r1, _0809DBF8
	ldr r2, _0809DBFC
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x16
	bls _0809DBEC
	b _0809DF54
_0809DBEC:
	lsls r0, 2
	ldr r1, _0809DC00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809DBF8: .4byte gMain
_0809DBFC: .4byte 0x0000043c
_0809DC00: .4byte _0809DC04
	.align 2, 0
_0809DC04:
	.4byte _0809DC60
	.4byte _0809DC6C
	.4byte _0809DC80
	.4byte _0809DC86
	.4byte _0809DCD4
	.4byte _0809DCE8
	.4byte _0809DCF4
	.4byte _0809DD10
	.4byte _0809DD1C
	.4byte _0809DD30
	.4byte _0809DD80
	.4byte _0809DD9C
	.4byte _0809DDB0
	.4byte _0809DDE4
	.4byte _0809DE04
	.4byte _0809DE18
	.4byte _0809DE4C
	.4byte _0809DE56
	.4byte _0809DE84
	.4byte _0809DE90
	.4byte _0809DEBC
	.4byte _0809DEEC
	.4byte _0809DF34
_0809DC60:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	b _0809DF3C
_0809DC6C:
	bl remove_some_task
	ldr r1, _0809DC78
	ldr r2, _0809DC7C
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DC78: .4byte gMain
_0809DC7C: .4byte 0x0000043c
_0809DC80:
	bl FreeAllSpritePalettes
	b _0809DF3C
_0809DC86:
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	movs r5, 0
	ldr r1, _0809DCC8
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _0809DCCC
	movs r7, 0x85
	lsls r7, 24
_0809DC9C:
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0809DC9C
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0809DCD0
	add r1, r12
	b _0809DF42
	.align 2, 0
_0809DCC8: .4byte 0x040000d4
_0809DCCC: .4byte 0x85000400
_0809DCD0: .4byte 0x0000043c
_0809DCD4:
	bl sub_809DE64
	ldr r1, _0809DCE0
	ldr r2, _0809DCE4
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DCE0: .4byte gMain
_0809DCE4: .4byte 0x0000043c
_0809DCE8:
	ldr r0, _0809DCF0
	bl SetUpWindowConfig
	b _0809DF3C
	.align 2, 0
_0809DCF0: .4byte gWindowConfig_81E6E6C
_0809DCF4:
	ldr r0, _0809DD04
	bl MultistepInitMenuWindowBegin
	ldr r1, _0809DD08
	ldr r2, _0809DD0C
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DD04: .4byte gWindowConfig_81E6E6C
_0809DD08: .4byte gMain
_0809DD0C: .4byte 0x0000043c
_0809DD10:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0809DD1A
	b _0809DF8C
_0809DD1A:
	b _0809DF3C
_0809DD1C:
	bl sub_809DA1C
	ldr r1, _0809DD28
	ldr r2, _0809DD2C
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DD28: .4byte gMain
_0809DD2C: .4byte 0x0000043c
_0809DD30:
	ldr r1, _0809DD5C
	ldr r2, _0809DD60
	ldr r0, _0809DD64
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0809DD68
	str r1, [r0, 0x8]
	ldr r1, [r0, 0x8]
	ldr r1, _0809DD6C
	ldr r2, _0809DD70
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0809DD74
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0809DD78
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0809DD7C
	add r1, r12
	b _0809DF42
	.align 2, 0
_0809DD5C: .4byte gSummaryScreenTextTiles
_0809DD60: .4byte 0x0600d000
_0809DD64: .4byte 0x040000d4
_0809DD68: .4byte 0x800000a0
_0809DD6C: .4byte gSummaryScreenButtonTiles
_0809DD70: .4byte 0x0600d140
_0809DD74: .4byte 0x80000080
_0809DD78: .4byte 0x02018000
_0809DD7C: .4byte 0x0000043c
_0809DD80:
	bl sub_809DF00
	lsls r0, 24
	cmp r0, 0
	bne _0809DD8C
	b _0809DF8C
_0809DD8C:
	ldr r0, _0809DD98
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
	b _0809DF3C
	.align 2, 0
_0809DD98: .4byte 0x02018000
_0809DD9C:
	bl sub_80A18C4
	ldr r1, _0809DDA8
	ldr r2, _0809DDAC
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DDA8: .4byte gMain
_0809DDAC: .4byte 0x0000043c
_0809DDB0:
	ldr r4, _0809DDCC
	adds r0, r4, 0
	bl sub_809F678
	adds r0, r4, 0
	bl sub_80A1CD8
	lsls r0, 24
	cmp r0, 0
	bne _0809DDD0
	movs r0, 0
	bl sub_80A12D0
	b _0809DDD6
	.align 2, 0
_0809DDCC: .4byte 0x02018010
_0809DDD0:
	movs r0, 0xA
	bl sub_80A12D0
_0809DDD6:
	ldr r0, _0809DDE0
	bl sub_80A0EA4
	b _0809DF3C
	.align 2, 0
_0809DDE0: .4byte 0x02018010
_0809DDE4:
	bl sub_80A1950
	ldr r0, _0809DDF8
	bl sub_80A1D84
	ldr r1, _0809DDFC
	ldr r2, _0809DE00
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DDF8: .4byte 0x02018010
_0809DDFC: .4byte gMain
_0809DE00: .4byte 0x0000043c
_0809DE04:
	ldr r4, _0809DE14
	adds r0, r4, 0
	bl sub_80A1DE8
	adds r4, 0x64
	movs r0, 0
	strb r0, [r4]
	b _0809DF3C
	.align 2, 0
_0809DE14: .4byte 0x02018010
_0809DE18:
	ldr r4, _0809DE40
	adds r5, r4, 0
	adds r5, 0x64
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_809F6B4
	subs r4, 0x10
	strb r0, [r4, 0xC]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809DE34
	b _0809DF8C
_0809DE34:
	movs r0, 0
	strb r0, [r5]
	ldr r1, _0809DE44
	ldr r2, _0809DE48
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DE40: .4byte 0x02018010
_0809DE44: .4byte gMain
_0809DE48: .4byte 0x0000043c
_0809DE4C:
	bl sub_809E044
	bl sub_80A0EE8
	b _0809DF3C
_0809DE56:
	ldr r1, _0809DE74
	ldrb r0, [r1, 0xB]
	cmp r0, 0x1
	bhi _0809DE6C
	ldr r0, _0809DE78
	ldrb r1, [r1, 0xB]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0809DE6C:
	ldr r1, _0809DE7C
	ldr r2, _0809DE80
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DE74: .4byte 0x02018000
_0809DE78: .4byte gUnknown_083C1580
_0809DE7C: .4byte gMain
_0809DE80: .4byte 0x0000043c
_0809DE84:
	ldr r0, _0809DE8C
	bl sub_809FAC8
	b _0809DF3C
	.align 2, 0
_0809DE8C: .4byte 0x02018010
_0809DE90:
	ldr r2, _0809DEAC
	ldr r0, _0809DEB0
	ldrb r1, [r0, 0xB]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _0809DEB4
	ldr r2, _0809DEB8
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DEAC: .4byte gUnknown_083C1598
_0809DEB0: .4byte 0x02018000
_0809DEB4: .4byte gMain
_0809DEB8: .4byte 0x0000043c
_0809DEBC:
	ldr r0, _0809DED8
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	beq _0809DEE0
	ldr r1, _0809DEDC
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0809DF3C
	.align 2, 0
_0809DED8: .4byte 0x02018010
_0809DEDC: .4byte gUnknown_030041B0
_0809DEE0:
	ldr r0, _0809DEE8
	strh r1, [r0]
	b _0809DF3C
	.align 2, 0
_0809DEE8: .4byte gUnknown_030041B0
_0809DEEC:
	bl sub_809EBC4
	ldr r0, _0809DF0C
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809DF10
	movs r0, 0
	movs r1, 0
	bl sub_80A1488
	movs r0, 0
	movs r1, 0
	bl sub_80A1654
	b _0809DF20
	.align 2, 0
_0809DF0C: .4byte 0x02018000
_0809DF10:
	movs r0, 0xA
	movs r1, 0
	bl sub_80A1488
	movs r0, 0xA
	movs r1, 0
	bl sub_80A1654
_0809DF20:
	bl sub_80A0DD0
	ldr r1, _0809DF2C
	ldr r2, _0809DF30
	adds r1, r2
	b _0809DF42
	.align 2, 0
_0809DF2C: .4byte gMain
_0809DF30: .4byte 0x0000043c
_0809DF34:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809DF8C
_0809DF3C:
	ldr r1, _0809DF4C
	ldr r0, _0809DF50
	adds r1, r0
_0809DF42:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0809DF8C
	.align 2, 0
_0809DF4C: .4byte gMain
_0809DF50: .4byte 0x0000043c
_0809DF54:
	ldr r0, _0809DF80
	bl SetVBlankCallback
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r0, _0809DF84
	bl SetMainCallback2
	ldr r2, _0809DF88
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	b _0809DF8E
	.align 2, 0
_0809DF80: .4byte sub_809D85C
_0809DF84: .4byte sub_809D844
_0809DF88: .4byte gPaletteFade
_0809DF8C:
	movs r0, 0
_0809DF8E:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809DA84

	thumb_func_start sub_809DE44
sub_809DE44: @ 809DF98
	push {lr}
_0809DF9A:
	bl sub_809DA84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809DFB2
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809DF9A
_0809DFB2:
	pop {r0}
	bx r0
	thumb_func_end sub_809DE44

	thumb_func_start sub_809DE64
sub_809DE64: @ 809DFB8
	ldr r1, _0809E024
	ldr r2, _0809E028
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0809E02C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0809E030
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0809E034
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0809E038
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0809E03C
	strh r0, [r1]
	ldr r1, _0809E040
	strh r0, [r1]
	ldr r1, _0809E044
	strh r0, [r1]
	ldr r1, _0809E048
	strh r0, [r1]
	ldr r1, _0809E04C
	strh r0, [r1]
	ldr r1, _0809E050
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x32
	strh r0, [r1]
	subs r1, 0x50
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809E024: .4byte 0x04000008
_0809E028: .4byte 0x00001e08
_0809E02C: .4byte 0x00004801
_0809E030: .4byte 0x00004a02
_0809E034: .4byte 0x00005c03
_0809E038: .4byte gUnknown_030042C0
_0809E03C: .4byte gUnknown_030041B4
_0809E040: .4byte gUnknown_03004288
_0809E044: .4byte gUnknown_03004280
_0809E048: .4byte gUnknown_030041B0
_0809E04C: .4byte gUnknown_030041B8
_0809E050: .4byte 0x04000010
	thumb_func_end sub_809DE64

	thumb_func_start sub_809DF00
sub_809DF00: @ 809E054
	push {lr}
	ldr r0, _0809E06C
	adds r0, 0x74
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _0809E062
	b _0809E184
_0809E062:
	lsls r0, 2
	ldr r1, _0809E070
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E06C: .4byte 0x02018000
_0809E070: .4byte _0809E074
	.align 2, 0
_0809E074:
	.4byte _0809E0A8
	.4byte _0809E0B8
	.4byte _0809E0C8
	.4byte _0809E0DC
	.4byte _0809E0F0
	.4byte _0809E100
	.4byte _0809E118
	.4byte _0809E128
	.4byte _0809E134
	.4byte _0809E140
	.4byte _0809E14C
	.4byte _0809E158
	.4byte _0809E164
_0809E0A8:
	ldr r0, _0809E0B4
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _0809E184
	.align 2, 0
_0809E0B4: .4byte gStatusScreen_Gfx
_0809E0B8:
	ldr r0, _0809E0C0
	ldr r1, _0809E0C4
	b _0809E104
	.align 2, 0
_0809E0C0: .4byte gUnknown_08E73508
_0809E0C4: .4byte 0x0600e000
_0809E0C8:
	ldr r0, _0809E0D4
	ldr r1, _0809E0D8
	bl LZDecompressVram
	b _0809E184
	.align 2, 0
_0809E0D4: .4byte gUnknown_08E74E88
_0809E0D8: .4byte 0x0600e800
_0809E0DC:
	ldr r0, _0809E0E8
	ldr r1, _0809E0EC
	bl LZDecompressVram
	b _0809E184
	.align 2, 0
_0809E0E8: .4byte gStatusScreen_Tilemap
_0809E0EC: .4byte 0x06004800
_0809E0F0:
	ldr r0, _0809E0F8
	ldr r1, _0809E0FC
	b _0809E104
	.align 2, 0
_0809E0F8: .4byte gUnknown_08E73E88
_0809E0FC: .4byte 0x06005800
_0809E100:
	ldr r0, _0809E110
	ldr r1, _0809E114
_0809E104:
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	b _0809E184
	.align 2, 0
_0809E110: .4byte gUnknown_08E74688
_0809E114: .4byte 0x06006800
_0809E118:
	ldr r0, _0809E124
	movs r1, 0
	movs r2, 0xA0
	bl LoadCompressedPalette
	b _0809E184
	.align 2, 0
_0809E124: .4byte gStatusScreen_Pal
_0809E128:
	ldr r0, _0809E130
	bl LoadCompressedObjectPic
	b _0809E184
	.align 2, 0
_0809E130: .4byte gUnknown_083C11B8
_0809E134:
	ldr r0, _0809E13C
	bl LoadCompressedObjectPic
	b _0809E184
	.align 2, 0
_0809E13C: .4byte gUnknown_083C1270
_0809E140:
	ldr r0, _0809E148
	bl LoadCompressedObjectPic
	b _0809E184
	.align 2, 0
_0809E148: .4byte gUnknown_083C12F4
_0809E14C:
	ldr r0, _0809E154
	bl LoadCompressedObjectPalette
	b _0809E184
	.align 2, 0
_0809E154: .4byte gUnknown_083C12FC
_0809E158:
	ldr r0, _0809E160
	bl LoadCompressedObjectPalette
	b _0809E184
	.align 2, 0
_0809E160: .4byte gUnknown_083C1278
_0809E164:
	ldr r0, _0809E17C
	movs r1, 0xE8
	lsls r1, 1
	movs r2, 0x60
	bl LoadCompressedPalette
	ldr r0, _0809E180
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0809E190
	.align 2, 0
_0809E17C: .4byte gMoveTypes_Pal
_0809E180: .4byte 0x02018000
_0809E184:
	ldr r1, _0809E194
	adds r1, 0x74
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_0809E190:
	pop {r1}
	bx r1
	.align 2, 0
_0809E194: .4byte 0x02018000
	thumb_func_end sub_809DF00

	thumb_func_start sub_809E044
sub_809E044: @ 809E198
	push {r4,r5,lr}
	ldr r4, _0809E248
	adds r0, r4, 0
	movs r1, 0x81
	movs r2, 0x2
	bl LoadPalette
	adds r5, r4, 0x2
	adds r0, r5, 0
	movs r1, 0x88
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0x8F
	movs r2, 0x2
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0x89
	movs r2, 0x2
	bl LoadPalette
	subs r5, 0x12
	adds r0, r5, 0
	movs r1, 0xD1
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0x8
	movs r1, 0xD3
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD5
	movs r2, 0x4
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0xD7
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0x14
	movs r1, 0xD9
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0xC
	movs r1, 0xDB
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0x18
	movs r1, 0xDD
	movs r2, 0x2
	bl LoadPalette
	subs r5, 0x6
	adds r0, r5, 0
	movs r1, 0xDE
	movs r2, 0x2
	bl LoadPalette
	subs r4, 0x1A
	adds r0, r4, 0
	movs r1, 0xDF
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0809E24C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0xF9
	movs r2, 0x2
	bl LoadPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E248: .4byte 0x081f362a
_0809E24C: .4byte gFontDefaultPalette
	thumb_func_end sub_809E044

	thumb_func_start sub_809E0FC
sub_809E0FC: @ 809E250
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0809E288
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E28C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E288: .4byte gTasks
_0809E28C: .4byte sub_809E13C
	thumb_func_end sub_809E0FC

	thumb_func_start sub_809E13C
sub_809E13C: @ 809E290
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _0809E2D6
	ldr r0, _0809E2DC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0809E2D6
	ldr r1, _0809E2E0
	ldr r4, _0809E2E4
	ldrb r0, [r4, 0x9]
	strb r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl StopCryAndClearCrySongs
	ldr r0, _0809E2E8
	ldr r1, _0809E2EC
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r0, [r4, 0x4]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0809E2D6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E2DC: .4byte gPaletteFade
_0809E2E0: .4byte gUnknown_020384F0
_0809E2E4: .4byte 0x02018000
_0809E2E8: .4byte gMPlay_BGM
_0809E2EC: .4byte 0x0000ffff
	thumb_func_end sub_809E13C

	thumb_func_start sub_809E19C
sub_809E19C: @ 809E2F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809E31C
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0809E3AE
	ldr r5, _0809E320
	ldrh r1, [r5, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E324
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl sub_809F1B8
	b _0809E3AE
	.align 2, 0
_0809E31C: .4byte gPaletteFade
_0809E320: .4byte gMain
_0809E324:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E336
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809F1B8
	b _0809E3AE
_0809E336:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809E34A
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809E356
_0809E34A:
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl sub_809F134
	b _0809E3AE
_0809E356:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0809E36C
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0809E376
_0809E36C:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809F134
	b _0809E3AE
_0809E376:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E3A0
	ldr r5, _0809E39C
	ldrb r0, [r5, 0xB]
	cmp r0, 0x1
	bls _0809E38E
	adds r0, r4, 0
	bl sub_809EA50
_0809E38E:
	ldrb r0, [r5, 0xB]
	cmp r0, 0
	bne _0809E3AE
	adds r0, r4, 0
	bl sub_809E0FC
	b _0809E3AE
	.align 2, 0
_0809E39C: .4byte 0x02018000
_0809E3A0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E3AE
	adds r0, r4, 0
	bl sub_809E0FC
_0809E3AE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_809E19C

	thumb_func_start sub_809E260
sub_809E260: @ 809E3B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809E3F0
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E3CA
	b _0809E542
_0809E3CA:
	ldr r5, _0809E3F4
	ldrh r1, [r5, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E400
	ldr r1, _0809E3F8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	subs r1, 0x5
	ldr r2, _0809E3FC
	adds r0, r4, 0
	bl sub_809E8F0
	b _0809E542
	.align 2, 0
_0809E3F0: .4byte gPaletteFade
_0809E3F4: .4byte gMain
_0809E3F8: .4byte gTasks
_0809E3FC: .4byte 0x02018079
_0809E400:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E42C
	ldr r1, _0809E424
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	ldr r2, _0809E428
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809E542
	.align 2, 0
_0809E424: .4byte gTasks
_0809E428: .4byte 0x02018079
_0809E42C:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809E440
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809E478
_0809E440:
	ldr r1, _0809E474
	ldrb r0, [r1, 0xB]
	cmp r0, 0x3
	bne _0809E468
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809E45C
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809E468
_0809E45C:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809E468:
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl sub_809F134
	b _0809E542
	.align 2, 0
_0809E474: .4byte 0x02018000
_0809E478:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0809E48E
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0809E4D0
_0809E48E:
	ldr r1, _0809E4CC
	adds r2, r1, 0
	adds r2, 0x76
	ldrb r0, [r1, 0xB]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0809E542
	cmp r0, 0x2
	bne _0809E4C0
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809E4B4
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809E4C0
_0809E4B4:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809E4C0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809F134
	b _0809E542
	.align 2, 0
_0809E4CC: .4byte 0x02018000
_0809E4D0:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E528
	adds r0, r4, 0
	bl sub_809F7D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809E4F4
	ldr r0, _0809E510
	adds r5, r0, 0
	adds r5, 0x79
	ldrb r0, [r5]
	cmp r0, 0x4
	bne _0809E518
_0809E4F4:
	ldr r0, _0809E510
	adds r1, r0, 0
	adds r1, 0x79
	ldrb r1, [r1]
	adds r0, 0x7A
	strb r1, [r0]
	ldr r1, _0809E514
	ldrb r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_809E0FC
	b _0809E542
	.align 2, 0
_0809E510: .4byte 0x02018000
_0809E514: .4byte gSpecialVar_0x8005
_0809E518:
	movs r0, 0x20
	bl PlaySE
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_809F9D0
	b _0809E542
_0809E528:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E542
	ldr r0, _0809E548
	adds r0, 0x7A
	movs r1, 0x4
	strb r1, [r0]
	ldr r0, _0809E54C
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_809E0FC
_0809E542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E548: .4byte 0x02018000
_0809E54C: .4byte gSpecialVar_0x8005
	thumb_func_end sub_809E260

	thumb_func_start sub_809E3FC
sub_809E3FC: @ 809E550
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r0, _0809E58C
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0809E656
	ldr r0, _0809E590
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E59C
	ldr r1, _0809E594
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	subs r1, 0x5
	ldr r2, _0809E598
	adds r0, r5, 0
	bl sub_809E8F0
	b _0809E656
	.align 2, 0
_0809E58C: .4byte gPaletteFade
_0809E590: .4byte gMain
_0809E594: .4byte gTasks
_0809E598: .4byte 0x02018079
_0809E59C:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E5C8
	ldr r1, _0809E5C0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	ldr r2, _0809E5C4
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809E656
	.align 2, 0
_0809E5C0: .4byte gTasks
_0809E5C4: .4byte 0x02018079
_0809E5C8:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E642
	ldr r4, _0809E5FC
	adds r6, r4, 0
	adds r6, 0x79
	ldrb r0, [r6]
	cmp r0, 0x4
	beq _0809E634
	adds r0, r4, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809E634
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_809E508
	lsls r0, 24
	cmp r0, 0
	bne _0809E600
	movs r0, 0x20
	bl PlaySE
	b _0809E656
	.align 2, 0
_0809E5FC: .4byte 0x02018000
_0809E600:
	movs r0, 0x5
	bl PlaySE
	ldrb r1, [r6]
	adds r0, r4, 0
	adds r0, 0x7A
	strb r1, [r0]
	movs r0, 0x1
	bl sub_80A1B40
	movs r0, 0x13
	bl sub_80A1A30
	ldr r1, _0809E62C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E630
	str r1, [r0]
	b _0809E656
	.align 2, 0
_0809E62C: .4byte gTasks
_0809E630: .4byte sub_809E534
_0809E634:
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl sub_809EAC8
	b _0809E656
_0809E642:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E656
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl sub_809EAC8
_0809E656:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809E3FC

	thumb_func_start sub_809E508
sub_809E508: @ 809E65C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0x1
_0809E662:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_809F760
	lsls r0, 16
	cmp r0, 0
	beq _0809E674
	movs r0, 0x1
	b _0809E680
_0809E674:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0809E662
	movs r0, 0
_0809E680:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809E508

	thumb_func_start sub_809E534
sub_809E534: @ 809E688
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r3, 0
	ldr r0, _0809E6B8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E6C4
	ldr r1, _0809E6BC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x8]
	subs r1, 0x4
	ldr r2, _0809E6C0
	adds r0, r3, 0
	bl sub_809E8F0
	b _0809E714
	.align 2, 0
_0809E6B8: .4byte gMain
_0809E6BC: .4byte gTasks
_0809E6C0: .4byte 0x0201807a
_0809E6C4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809E6F0
	ldr r1, _0809E6E8
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x8]
	ldr r2, _0809E6EC
	adds r0, r3, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809E714
	.align 2, 0
_0809E6E8: .4byte gTasks
_0809E6EC: .4byte 0x0201807a
_0809E6F0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E702
	adds r0, r3, 0
	movs r1, 0x1
	bl sub_809E83C
	b _0809E714
_0809E702:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E714
	movs r1, 0x1
	negs r1, r1
	adds r0, r2, 0
	bl sub_809E83C
_0809E714:
	pop {r0}
	bx r0
	thumb_func_end sub_809E534

	thumb_func_start sub_809E5C4
sub_809E5C4: @ 809E718
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r1, _0809E824
	ldr r5, [r1]
	ldrb r2, [r1, 0x9]
	movs r0, 0x64
	muls r0, r2
	adds r5, r0
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	mov r8, r0
	adds r1, 0x7A
	ldrb r6, [r1]
	adds r0, 0xD
	str r0, [sp, 0x8]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r2, r6, 0
	adds r2, 0xD
	str r2, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r2, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	mov r3, r8
	adds r3, 0x11
	str r3, [sp, 0x10]
	adds r0, r5, 0
	adds r1, r3, 0
	bl GetMonData
	mov r7, sp
	adds r7, 0x5
	str r7, [sp, 0x18]
	strb r0, [r7]
	adds r0, r6, 0
	adds r0, 0x11
	str r0, [sp, 0x1C]
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	bl GetMonData
	add r1, sp, 0x4
	mov r10, r1
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x15
	bl GetMonData
	mov r4, sp
	adds r4, 0x6
	strb r0, [r4]
	ldr r1, _0809E828
	mov r2, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r4]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	mov r7, r8
	lsls r7, 1
	mov r8, r7
	asrs r2, r7
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r6, 1
	asrs r1, r6
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r4]
	ldrb r0, [r4]
	bics r0, r3
	strb r0, [r4]
	lsls r2, r6
	mov r0, r8
	lsls r1, r0
	adds r2, r1
	ldrb r0, [r4]
	orrs r0, r2
	strb r0, [r4]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x15
	adds r2, r4, 0
	bl SetMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E824: .4byte 0x02018000
_0809E828: .4byte gUnknown_08208238
	thumb_func_end sub_809E5C4

	thumb_func_start sub_809E6D8
sub_809E6D8: @ 809E82C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r2, _0809E93C
	ldr r5, [r2]
	ldrb r1, [r2, 0x9]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	adds r5, r0
	adds r0, r2, 0
	adds r0, 0x79
	ldrb r0, [r0]
	mov r8, r0
	adds r2, 0x7A
	ldrb r6, [r2]
	adds r0, 0xD
	str r0, [sp, 0x8]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl GetBoxMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r2, r6, 0
	adds r2, 0xD
	str r2, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r2, 0
	bl GetBoxMonData
	mov r1, sp
	strh r0, [r1]
	mov r3, r8
	adds r3, 0x11
	str r3, [sp, 0x10]
	adds r0, r5, 0
	adds r1, r3, 0
	bl GetBoxMonData
	mov r7, sp
	adds r7, 0x5
	str r7, [sp, 0x18]
	strb r0, [r7]
	adds r0, r6, 0
	adds r0, 0x11
	str r0, [sp, 0x1C]
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	bl GetBoxMonData
	add r1, sp, 0x4
	mov r10, r1
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x15
	bl GetBoxMonData
	mov r4, sp
	adds r4, 0x6
	strb r0, [r4]
	ldr r1, _0809E940
	mov r2, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r4]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	mov r7, r8
	lsls r7, 1
	mov r8, r7
	asrs r2, r7
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r6, 1
	asrs r1, r6
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r4]
	ldrb r0, [r4]
	bics r0, r3
	strb r0, [r4]
	lsls r2, r6
	mov r0, r8
	lsls r1, r0
	adds r2, r1
	ldrb r0, [r4]
	orrs r0, r2
	strb r0, [r4]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetBoxMonData
	adds r0, r5, 0
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetBoxMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetBoxMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetBoxMonData
	adds r0, r5, 0
	movs r1, 0x15
	adds r2, r4, 0
	bl SetBoxMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E93C: .4byte 0x02018000
_0809E940: .4byte gUnknown_08208238
	thumb_func_end sub_809E6D8

	thumb_func_start sub_809E7F0
sub_809E7F0: @ 809E944
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_809F5F8
	lsls r0, 24
	cmp r0, 0
	beq _0809E97C
	ldr r1, _0809E984
	adds r2, r1, 0
	adds r2, 0x74
	movs r0, 0
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, 0x79
	bl sub_80A0428
	ldr r1, _0809E988
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E98C
	str r1, [r0]
	adds r0, r4, 0
	bl sub_80A2078
_0809E97C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E984: .4byte 0x02018000
_0809E988: .4byte gTasks
_0809E98C: .4byte sub_809E3FC
	thumb_func_end sub_809E7F0

	thumb_func_start sub_809E83C
sub_809E83C: @ 809E990
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x13
	bl sub_80A1B1C
	movs r0, 0
	bl sub_80A1B40
	cmp r4, 0x1
	bne _0809EA14
	ldr r1, _0809E9D0
	adds r0, r1, 0
	adds r0, 0x79
	adds r2, r1, 0
	adds r2, 0x7A
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0809EA1E
	ldrb r0, [r1, 0xE]
	cmp r0, 0
	bne _0809E9D4
	bl sub_809E5C4
	b _0809E9D8
	.align 2, 0
_0809E9D0: .4byte 0x02018000
_0809E9D4:
	bl sub_809E6D8
_0809E9D8:
	ldr r4, _0809EA08
	adds r0, r4, 0
	adds r0, 0x7A
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x79
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_809F678
	adds r1, r4, 0
	adds r1, 0x74
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _0809EA0C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EA10
	str r1, [r0]
	b _0809EA32
	.align 2, 0
_0809EA08: .4byte 0x02018000
_0809EA0C: .4byte gTasks
_0809EA10: .4byte sub_809E7F0
_0809EA14:
	ldr r0, _0809EA38
	adds r1, r0, 0
	adds r1, 0x69
	bl sub_80A0428
_0809EA1E:
	ldr r0, _0809EA3C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809EA40
	str r0, [r1]
	adds r0, r5, 0
	bl sub_80A2078
_0809EA32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EA38: .4byte 0x02018010
_0809EA3C: .4byte gTasks
_0809EA40: .4byte sub_809E3FC
	thumb_func_end sub_809E83C

	thumb_func_start sub_809E8F0
sub_809E8F0: @ 809EA44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r1, 0
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x5
	bl PlaySE
	mov r1, r9
	ldrb r6, [r1]
	ldr r1, _0809EA98
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r2, 0
	lsls r4, 24
	asrs r4, 24
	mov r10, r4
	lsls r7, r0, 24
_0809EA84:
	lsls r0, r6, 24
	asrs r0, 24
	add r0, r10
	lsls r0, 24
	lsrs r6, r0, 24
	asrs r1, r0, 24
	cmp r0, r7
	ble _0809EA9C
	movs r6, 0
	b _0809EAA2
	.align 2, 0
_0809EA98: .4byte gTasks
_0809EA9C:
	cmp r1, 0
	bge _0809EAA2
	lsrs r6, r7, 24
_0809EAA2:
	lsls r4, r6, 24
	lsrs r1, r4, 24
	ldr r0, _0809EB64
	str r2, [sp, 0x4]
	bl sub_809F760
	lsls r0, 16
	adds r5, r4, 0
	ldr r2, [sp, 0x4]
	cmp r0, 0
	bne _0809EACE
	asrs r0, r5, 24
	cmp r0, 0x4
	beq _0809EACE
	lsls r0, r2, 24
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _0809EA84
_0809EACE:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x4
	bne _0809EAEA
	asrs r0, r5, 24
	cmp r0, 0x4
	beq _0809EAEA
	ldr r0, _0809EB68
	adds r0, 0x7C
	ldrh r0, [r0]
	mov r2, r8
	lsls r7, r2, 2
	cmp r0, 0
	beq _0809EB00
_0809EAEA:
	ldr r2, _0809EB6C
	mov r3, r8
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0x1
	bne _0809EB24
_0809EB00:
	lsrs r4, r5, 24
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80A1488
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80A1654
	ldr r1, _0809EB6C
	mov r3, r8
	adds r0, r7, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x22]
	movs r0, 0
	str r0, [sp]
_0809EB24:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x4
	beq _0809EB52
	asrs r0, r5, 24
	cmp r0, 0x4
	bne _0809EB52
	ldr r0, _0809EB68
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809EB52
	movs r4, 0x2
	negs r4, r4
	lsrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A1488
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A1654
_0809EB52:
	mov r2, r9
	strb r6, [r2]
	ldr r0, _0809EB70
	cmp r9, r0
	bne _0809EB74
	movs r0, 0
	bl sub_80A1C30
	b _0809EB7A
	.align 2, 0
_0809EB64: .4byte 0x02018010
_0809EB68: .4byte 0x02018000
_0809EB6C: .4byte gTasks
_0809EB70: .4byte 0x02018079
_0809EB74:
	movs r0, 0x1
	bl sub_80A1C30
_0809EB7A:
	ldr r3, [sp]
	cmp r3, 0
	beq _0809EB88
	ldr r0, _0809EBA0
	mov r1, r9
	bl sub_80A0428
_0809EB88:
	mov r0, r8
	bl sub_80A2078
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EBA0: .4byte 0x02018010
	thumb_func_end sub_809E8F0

	thumb_func_start sub_809EA50
sub_809EA50: @ 809EBA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0809EC10
	adds r1, r4, 0
	adds r1, 0x79
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0
	bl sub_80A1488
	movs r0, 0x2
	movs r1, 0
	bl sub_80A1654
	adds r0, r4, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809EBE0
	adds r1, r4, 0
	adds r1, 0x7F
	movs r0, 0x5
	strb r0, [r1]
	bl sub_80A0DD0
_0809EBE0:
	movs r0, 0
	bl sub_80A16CC
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_80A029C
	movs r0, 0x9
	bl sub_80A1A30
	ldr r1, _0809EC14
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EC18
	str r1, [r0]
	adds r0, r5, 0
	bl sub_80A2078
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC10: .4byte 0x02018000
_0809EC14: .4byte gTasks
_0809EC18: .4byte sub_809E3FC
	thumb_func_end sub_809EA50

	thumb_func_start sub_809EAC8
sub_809EAC8: @ 809EC1C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0809EC88
	adds r0, r6, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _0809EC42
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0
	bl sub_80A1488
	adds r0, r4, 0
	movs r1, 0
	bl sub_80A1654
_0809EC42:
	movs r0, 0x9
	bl sub_80A1B1C
	movs r0, 0x1
	bl sub_80A16CC
	movs r0, 0xF
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0xB
	movs r1, 0xF
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r1, r6, 0
	adds r1, 0x7F
	movs r0, 0x6
	strb r0, [r1]
	bl sub_80A0DD0
	ldr r1, _0809EC8C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EC90
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC88: .4byte 0x02018000
_0809EC8C: .4byte gTasks
_0809EC90: .4byte sub_809E19C
	thumb_func_end sub_809EAC8

	thumb_func_start sub_809EB40
sub_809EB40: @ 809EC94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0809ECC0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0809ECC8
	cmp r0, 0x5
	bne _0809ECF8
	movs r0, 0x9
	bl sub_80A1A30
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _0809ECC4
	str r0, [r4]
	b _0809ED08
	.align 2, 0
_0809ECC0: .4byte gTasks
_0809ECC4: .4byte sub_809E260
_0809ECC8:
	ldr r4, _0809ED10
	adds r6, r4, 0
	adds r6, 0x79
	strb r0, [r6]
	adds r0, r4, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809ECEA
	movs r0, 0xA
	movs r1, 0
	bl sub_80A1488
	ldrb r1, [r6]
	movs r0, 0xA
	bl sub_80A1654
_0809ECEA:
	movs r0, 0
	bl sub_80A16CC
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_80A029C
_0809ECF8:
	ldr r0, _0809ED14
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0809ED08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809ED10: .4byte 0x02018000
_0809ED14: .4byte gTasks
	thumb_func_end sub_809EB40

	thumb_func_start sub_809EBC4
sub_809EBC4: @ 809ED18
	push {r4,lr}
	ldr r4, _0809ED7C
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	beq _0809ED76
	bl sub_80A0EE8
	ldr r0, _0809ED80
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	strh r1, [r0]
	ldrb r0, [r4, 0xB]
	cmp r0, 0x1
	bne _0809ED48
	ldr r2, _0809ED84
	ldrh r1, [r2]
	ldr r0, _0809ED88
	ands r0, r1
	movs r3, 0x80
	lsls r3, 4
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809ED48:
	ldrb r3, [r4, 0xB]
	cmp r3, 0x2
	bne _0809ED60
	ldr r2, _0809ED84
	ldrh r1, [r2]
	ldr r0, _0809ED88
	ands r0, r1
	movs r4, 0xA0
	lsls r4, 4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809ED60:
	cmp r3, 0x3
	bne _0809ED76
	ldr r2, _0809ED84
	ldrh r1, [r2]
	ldr r0, _0809ED88
	ands r0, r1
	movs r3, 0xC0
	lsls r3, 4
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809ED76:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809ED7C: .4byte 0x02018000
_0809ED80: .4byte gUnknown_030042C0
_0809ED84: .4byte 0x0400000a
_0809ED88: .4byte 0x0000e0ff
	thumb_func_end sub_809EBC4

	thumb_func_start sub_809EC38
sub_809EC38: @ 809ED8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809EDB0
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _0809EDA6
	b _0809EFB8
_0809EDA6:
	lsls r0, 2
	ldr r1, _0809EDB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EDB0: .4byte 0x03004b38
_0809EDB4: .4byte _0809EDB8
	.align 2, 0
_0809EDB8:
	.4byte _0809EDD0
	.4byte _0809EE68
	.4byte _0809EEEC
	.4byte _0809EF66
	.4byte _0809EF70
	.4byte _0809EFA0
_0809EDD0:
	ldr r1, _0809EE0C
	adds r0, r1, 0
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809EE1C
	ldrb r3, [r1, 0xB]
	cmp r3, 0
	beq _0809EDEC
	ldr r1, _0809EE10
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
_0809EDEC:
	cmp r3, 0x1
	bne _0809EE02
	ldr r2, _0809EE14
	ldrh r1, [r2]
	ldr r0, _0809EE18
	ands r0, r1
	movs r4, 0x80
	lsls r4, 4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EE02:
	cmp r3, 0x2
	beq _0809EE08
	b _0809EF8E
_0809EE08:
	ldr r2, _0809EE14
	b _0809EE4A
	.align 2, 0
_0809EE0C: .4byte 0x02018000
_0809EE10: .4byte gUnknown_03004288
_0809EE14: .4byte 0x0400000c
_0809EE18: .4byte 0x0000e0ff
_0809EE1C:
	ldrb r3, [r1, 0xB]
	cmp r3, 0
	beq _0809EE2C
	ldr r1, _0809EE5C
	movs r4, 0x80
	lsls r4, 1
	adds r0, r4, 0
	strh r0, [r1]
_0809EE2C:
	cmp r3, 0x1
	bne _0809EE42
	ldr r2, _0809EE60
	ldrh r1, [r2]
	ldr r0, _0809EE64
	ands r0, r1
	movs r4, 0x80
	lsls r4, 4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EE42:
	cmp r3, 0x2
	beq _0809EE48
	b _0809EF8E
_0809EE48:
	ldr r2, _0809EE60
_0809EE4A:
	ldrh r1, [r2]
	ldr r0, _0809EE64
	ands r0, r1
	movs r3, 0xA0
	lsls r3, 4
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
	b _0809EF8E
	.align 2, 0
_0809EE5C: .4byte gUnknown_030042C0
_0809EE60: .4byte 0x0400000a
_0809EE64: .4byte 0x0000e0ff
_0809EE68:
	ldr r0, _0809EE9C
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809EEB0
	ldr r1, _0809EEA0
	ldrh r0, [r1]
	subs r0, 0x20
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0809EE82
	b _0809EFB8
_0809EE82:
	ldr r3, _0809EEA4
	ldrh r2, [r3]
	ldr r1, _0809EEA8
	adds r0, r1, 0
	ands r0, r2
	adds r0, 0x2
	strh r0, [r3]
	ldr r2, _0809EEAC
	ldrh r0, [r2]
	ands r1, r0
	adds r1, 0x1
	strh r1, [r2]
	b _0809EF8E
	.align 2, 0
_0809EE9C: .4byte 0x02018000
_0809EEA0: .4byte gUnknown_030042C0
_0809EEA4: .4byte 0x0400000a
_0809EEA8: .4byte 0x0000fffc
_0809EEAC: .4byte 0x0400000c
_0809EEB0:
	ldr r1, _0809EEDC
	ldrh r0, [r1]
	subs r0, 0x20
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0809EEC0
	b _0809EFB8
_0809EEC0:
	ldr r3, _0809EEE0
	ldrh r2, [r3]
	ldr r1, _0809EEE4
	adds r0, r1, 0
	ands r0, r2
	adds r0, 0x1
	strh r0, [r3]
	ldr r2, _0809EEE8
	ldrh r0, [r2]
	ands r1, r0
	adds r1, 0x2
	strh r1, [r2]
	b _0809EF8E
	.align 2, 0
_0809EEDC: .4byte gUnknown_03004288
_0809EEE0: .4byte 0x0400000a
_0809EEE4: .4byte 0x0000fffc
_0809EEE8: .4byte 0x0400000c
_0809EEEC:
	ldr r1, _0809EF28
	ldrb r3, [r1, 0xB]
	adds r0, r3, 0x1
	adds r2, r1, 0
	adds r2, 0x7E
	strb r0, [r2]
	ldrb r2, [r1, 0x8]
	subs r0, r2, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r5, r1, 0
	cmp r0, 0x1
	bhi _0809EF2C
	adds r1, 0x7F
	movs r0, 0
	strb r0, [r1]
	adds r4, r5, 0
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A029C
	adds r5, 0x79
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A0428
	ldrb r0, [r5]
	bl sub_80A00F4
	b _0809EF8E
	.align 2, 0
_0809EF28: .4byte 0x02018000
_0809EF2C:
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0809EF4E
	adds r0, r5, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809EF46
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0809EF4E
_0809EF46:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x6
	b _0809EF62
_0809EF4E:
	ldrb r0, [r5, 0xB]
	cmp r0, 0
	bne _0809EF5C
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x7
	b _0809EF62
_0809EF5C:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0
_0809EF62:
	strb r0, [r1]
	b _0809EF8E
_0809EF66:
	bl sub_80A0EE8
	bl sub_80A0DD0
	b _0809EF8E
_0809EF70:
	ldr r0, _0809EF98
	ldr r4, _0809EF9C
	ldrb r1, [r4, 0xB]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	adds r4, 0x80
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
_0809EF8E:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0809EFB8
	.align 2, 0
_0809EF98: .4byte gUnknown_083C1598
_0809EF9C: .4byte 0x02018000
_0809EFA0:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809EFB8
	ldr r1, _0809EFC0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EFC4
	ldr r1, [r1]
	str r1, [r0]
_0809EFB8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EFC0: .4byte gTasks
_0809EFC4: .4byte gUnknown_03005CF0
	thumb_func_end sub_809EC38

	thumb_func_start sub_809EE74
sub_809EE74: @ 809EFC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809EFEC
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x6
	bls _0809EFE2
	b _0809F214
_0809EFE2:
	lsls r0, 2
	ldr r1, _0809EFF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EFEC: .4byte 0x03004b38
_0809EFF0: .4byte _0809EFF4
	.align 2, 0
_0809EFF4:
	.4byte _0809F010
	.4byte _0809F034
	.4byte _0809F108
	.4byte _0809F148
	.4byte _0809F1C2
	.4byte _0809F1CC
	.4byte _0809F1FC
_0809F010:
	ldr r0, _0809F020
	adds r0, 0x80
	ldrb r1, [r0]
	cmp r1, 0
	bne _0809F028
	ldr r0, _0809F024
	strh r1, [r0]
	b _0809F1EA
	.align 2, 0
_0809F020: .4byte 0x02018000
_0809F024: .4byte gUnknown_03004288
_0809F028:
	ldr r1, _0809F030
	movs r0, 0
	strh r0, [r1]
	b _0809F1EA
	.align 2, 0
_0809F030: .4byte gUnknown_030042C0
_0809F034:
	ldr r1, _0809F084
	adds r0, r1, 0
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809F0A0
	ldrb r3, [r1, 0xB]
	cmp r3, 0x1
	bne _0809F056
	ldr r2, _0809F088
	ldrh r1, [r2]
	ldr r0, _0809F08C
	ands r0, r1
	ldr r4, _0809F090
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809F056:
	cmp r3, 0x2
	bne _0809F06A
	ldr r2, _0809F088
	ldrh r1, [r2]
	ldr r0, _0809F08C
	ands r0, r1
	ldr r4, _0809F094
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809F06A:
	cmp r3, 0x3
	bne _0809F07E
	ldr r2, _0809F088
	ldrh r1, [r2]
	ldr r0, _0809F08C
	ands r0, r1
	ldr r3, _0809F098
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809F07E:
	ldr r2, _0809F09C
	b _0809F0E0
	.align 2, 0
_0809F084: .4byte 0x02018000
_0809F088: .4byte 0x0400000c
_0809F08C: .4byte 0x0000e0fc
_0809F090: .4byte 0x00000801
_0809F094: .4byte 0x00000a01
_0809F098: .4byte 0x00000c01
_0809F09C: .4byte 0x0400000a
_0809F0A0:
	ldrb r3, [r1, 0xB]
	cmp r3, 0x1
	bne _0809F0B6
	ldr r2, _0809F0EC
	ldrh r1, [r2]
	ldr r0, _0809F0F0
	ands r0, r1
	ldr r4, _0809F0F4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809F0B6:
	cmp r3, 0x2
	bne _0809F0CA
	ldr r2, _0809F0EC
	ldrh r1, [r2]
	ldr r0, _0809F0F0
	ands r0, r1
	ldr r4, _0809F0F8
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809F0CA:
	cmp r3, 0x3
	bne _0809F0DE
	ldr r2, _0809F0EC
	ldrh r1, [r2]
	ldr r0, _0809F0F0
	ands r0, r1
	ldr r3, _0809F0FC
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809F0DE:
	ldr r2, _0809F100
_0809F0E0:
	ldrh r1, [r2]
	ldr r0, _0809F104
	ands r0, r1
	adds r0, 0x2
	strh r0, [r2]
	b _0809F1EA
	.align 2, 0
_0809F0EC: .4byte 0x0400000a
_0809F0F0: .4byte 0x0000e0fc
_0809F0F4: .4byte 0x00000801
_0809F0F8: .4byte 0x00000a01
_0809F0FC: .4byte 0x00000c01
_0809F100: .4byte 0x0400000c
_0809F104: .4byte 0x0000fffc
_0809F108:
	ldr r0, _0809F128
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809F130
	ldr r0, _0809F12C
	ldrh r1, [r0]
	adds r1, 0x20
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _0809F214
	b _0809F1EA
	.align 2, 0
_0809F128: .4byte 0x02018000
_0809F12C: .4byte gUnknown_03004288
_0809F130:
	ldr r0, _0809F144
	ldrh r1, [r0]
	adds r1, 0x20
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _0809F214
	b _0809F1EA
	.align 2, 0
_0809F144: .4byte gUnknown_030042C0
_0809F148:
	ldr r1, _0809F184
	ldrb r3, [r1, 0xB]
	adds r0, r3, 0x1
	adds r2, r1, 0
	adds r2, 0x7E
	strb r0, [r2]
	ldrb r2, [r1, 0x8]
	subs r0, r2, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r5, r1, 0
	cmp r0, 0x1
	bhi _0809F188
	adds r1, 0x7F
	movs r0, 0
	strb r0, [r1]
	adds r4, r5, 0
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A029C
	adds r5, 0x79
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A0428
	ldrb r0, [r5]
	bl sub_80A00F4
	b _0809F1EA
	.align 2, 0
_0809F184: .4byte 0x02018000
_0809F188:
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0809F1AA
	adds r0, r5, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809F1A2
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0809F1AA
_0809F1A2:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x6
	b _0809F1BE
_0809F1AA:
	ldrb r0, [r5, 0xB]
	cmp r0, 0
	bne _0809F1B8
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x7
	b _0809F1BE
_0809F1B8:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0
_0809F1BE:
	strb r0, [r1]
	b _0809F1EA
_0809F1C2:
	bl sub_80A0EE8
	bl sub_80A0DD0
	b _0809F1EA
_0809F1CC:
	ldr r0, _0809F1F4
	ldr r4, _0809F1F8
	ldrb r1, [r4, 0xB]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	adds r4, 0x80
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
_0809F1EA:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0809F214
	.align 2, 0
_0809F1F4: .4byte gUnknown_083C1598
_0809F1F8: .4byte 0x02018000
_0809F1FC:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809F214
	ldr r1, _0809F21C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809F220
	ldr r1, [r1]
	str r1, [r0]
_0809F214:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F21C: .4byte gTasks
_0809F220: .4byte gUnknown_03005CF0
	thumb_func_end sub_809EE74

	thumb_func_start sub_809F0D0
sub_809F0D0: @ 809F224
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0809F264
	ldrb r0, [r1, 0xB]
	adds r0, r4
	movs r5, 0
	strb r0, [r1, 0xB]
	ldr r2, _0809F268
	ldr r1, _0809F26C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	ldr r0, [r6]
	str r0, [r2]
	bl sub_809FBE4
	strh r5, [r6, 0x8]
	lsls r4, 24
	asrs r4, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _0809F274
	ldr r0, _0809F270
	str r0, [r6]
	b _0809F27E
	.align 2, 0
_0809F264: .4byte 0x02018000
_0809F268: .4byte gUnknown_03005CF0
_0809F26C: .4byte gTasks
_0809F270: .4byte sub_809EC38
_0809F274:
	ldr r1, _0809F284
	str r1, [r6]
	adds r0, r7, 0
	bl _call_via_r1
_0809F27E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F284: .4byte sub_809EE74
	thumb_func_end sub_809F0D0

	thumb_func_start sub_809F134
sub_809F134: @ 809F288
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _0809F300
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809F2FA
	lsls r0, r5, 24
	asrs r5, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _0809F2BC
	adds r0, r4, 0
	subs r0, 0x10
	adds r1, r4, 0
	adds r1, 0x65
	ldrb r0, [r0, 0xB]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0809F2FA
_0809F2BC:
	cmp r5, 0x1
	bne _0809F2D0
	adds r0, r4, 0
	subs r0, 0x10
	adds r1, r4, 0
	adds r1, 0x66
	ldrb r0, [r0, 0xB]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0809F2FA
_0809F2D0:
	ldr r0, _0809F304
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809F2FA
	ldr r0, _0809F308
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809F2FA
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_809F0D0
_0809F2FA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F300: .4byte 0x02018010
_0809F304: .4byte sub_80A1334
_0809F308: .4byte sub_80A1500
	thumb_func_end sub_809F134

	thumb_func_start sub_809F1B8
sub_809F1B8: @ 809F30C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _0809F338
	ldrb r1, [r0, 0xE]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _0809F356
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	beq _0809F33C
	lsls r1, r4, 24
	asrs r1, 24
	movs r4, 0x1
	eors r1, r4
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	b _0809F348
	.align 2, 0
_0809F338: .4byte 0x02018000
_0809F33C:
	lsls r0, r4, 24
	asrs r0, 24
	movs r4, 0x3
	cmp r0, 0x1
	bne _0809F348
	movs r4, 0x2
_0809F348:
	ldr r0, [r2]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	adds r3, r4, 0
	bl sub_8095DCC
	b _0809F380
_0809F356:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F378
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F378
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_809F3CC
	b _0809F380
_0809F378:
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_809F284
_0809F380:
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0809F3C4
	movs r0, 0x5
	bl PlaySE
	ldr r5, _0809F3CC
	adds r0, r5, 0
	bl sub_80A1CD8
	lsls r0, 24
	cmp r0, 0
	beq _0809F3AC
	movs r0, 0x2
	negs r0, r0
	bl sub_80A12D0
_0809F3AC:
	adds r0, r5, 0
	subs r0, 0x10
	strb r4, [r0, 0x9]
	ldr r1, _0809F3D0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0]
	str r1, [r5, 0x74]
	ldr r1, _0809F3D4
	str r1, [r0]
_0809F3C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F3CC: .4byte 0x02018010
_0809F3D0: .4byte gTasks
_0809F3D4: .4byte sub_809F43C
	thumb_func_end sub_809F1B8

	thumb_func_start sub_809F284
sub_809F284: @ 809F3D8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0809F414
	ldr r7, [r0]
	movs r6, 0
	ldrb r1, [r0, 0xB]
	adds r4, r0, 0
	cmp r1, 0
	bne _0809F418
	lsls r0, r3, 24
	asrs r2, r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r5, r0, 0
	cmp r2, r1
	bne _0809F400
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0809F438
_0809F400:
	asrs r0, r5, 24
	cmp r0, 0x1
	bne _0809F40E
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	cmp r0, r1
	bcs _0809F438
_0809F40E:
	ldrb r0, [r4, 0x9]
	adds r0, r3
	b _0809F458
	.align 2, 0
_0809F414: .4byte 0x02018000
_0809F418:
	lsls r5, r3, 24
_0809F41A:
	lsls r0, r6, 24
	asrs r0, 24
	asrs r1, r5, 24
	adds r0, r1
	lsls r0, 24
	ldr r4, _0809F440
	lsrs r6, r0, 24
	asrs r0, 24
	ldrb r2, [r4, 0x9]
	adds r1, r0, r2
	cmp r1, 0
	blt _0809F438
	ldrb r0, [r4, 0xA]
	cmp r1, r0
	ble _0809F444
_0809F438:
	movs r0, 0x1
	negs r0, r0
	b _0809F45C
	.align 2, 0
_0809F440: .4byte 0x02018000
_0809F444:
	movs r0, 0x64
	muls r0, r1
	adds r0, r7, r0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809F41A
	ldrb r0, [r4, 0x9]
	adds r0, r6
_0809F458:
	lsls r0, 24
	asrs r0, 24
_0809F45C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809F284

	thumb_func_start sub_809F310
sub_809F310: @ 809F464
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0809F490
	ldr r0, _0809F48C
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	bne _0809F486
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809F490
_0809F486:
	movs r0, 0x1
	b _0809F492
	.align 2, 0
_0809F48C: .4byte 0x02018000
_0809F490:
	movs r0, 0
_0809F492:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F310

	thumb_func_start sub_809F344
sub_809F344: @ 809F498
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0809F49E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0809F4D0
	ldr r0, _0809F4C8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809F4CC
	adds r0, r1
	bl sub_809F310
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F49E
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0809F4D4
	.align 2, 0
_0809F4C8: .4byte gUnknown_083C15A8
_0809F4CC: .4byte gPlayerParty
_0809F4D0:
	movs r0, 0x1
	negs r0, r0
_0809F4D4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809F344

	thumb_func_start sub_809F388
sub_809F388: @ 809F4DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0809F4E2:
	cmp r4, 0
	beq _0809F514
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809F50C
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809F510
	adds r0, r1
	bl sub_809F310
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F4E2
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0809F518
	.align 2, 0
_0809F50C: .4byte gUnknown_083C15A8
_0809F510: .4byte gPlayerParty
_0809F514:
	movs r0, 0x1
	negs r0, r0
_0809F518:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809F388

	thumb_func_start sub_809F3CC
sub_809F3CC: @ 809F520
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0
	movs r1, 0
	ldr r3, _0809F570
	ldr r4, _0809F574
	ldrb r0, [r3]
	ldrb r5, [r4, 0x9]
	cmp r0, r5
	beq _0809F550
	adds r5, r3, 0
	adds r3, r4, 0
_0809F53A:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bhi _0809F550
	adds r0, r1, r5
	ldrb r0, [r0]
	ldrb r4, [r3, 0x9]
	cmp r0, r4
	bne _0809F53A
	adds r2, r1, 0
_0809F550:
	lsls r0, r6, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0809F560
	cmp r2, 0
	beq _0809F568
_0809F560:
	cmp r1, 0x1
	bne _0809F578
	cmp r2, 0x5
	bne _0809F580
_0809F568:
	movs r0, 0x1
	negs r0, r0
	b _0809F58A
	.align 2, 0
_0809F570: .4byte gUnknown_083C15A8
_0809F574: .4byte 0x02018000
_0809F578:
	adds r0, r2, 0
	bl sub_809F388
	b _0809F586
_0809F580:
	adds r0, r2, 0
	bl sub_809F344
_0809F586:
	lsls r0, 24
	asrs r0, 24
_0809F58A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809F3CC

	thumb_func_start sub_809F43C
sub_809F43C: @ 809F590
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809F5B0
	ldr r1, _0809F5B4
	adds r5, r0, r1
	ldrb r2, [r5]
	adds r3, r0, 0
	cmp r2, 0x8
	bls _0809F5A6
	b _0809F720
_0809F5A6:
	lsls r0, r2, 2
	ldr r1, _0809F5B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809F5B0: .4byte gMain
_0809F5B4: .4byte 0x0000043c
_0809F5B8: .4byte _0809F5BC
	.align 2, 0
_0809F5BC:
	.4byte _0809F5E0
	.4byte _0809F5E6
	.4byte _0809F610
	.4byte _0809F62C
	.4byte _0809F648
	.4byte _0809F670
	.4byte _0809F6CC
	.4byte _0809F6D8
	.4byte _0809F6F4
_0809F5E0:
	bl StopCryAndClearCrySongs
	b _0809F706
_0809F5E6:
	ldr r0, _0809F600
	ldrb r1, [r0, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809F604
	adds r0, r1
	bl DestroySpriteAndFreeResources
	ldr r1, _0809F608
	ldr r0, _0809F60C
	adds r1, r0
	b _0809F70C
	.align 2, 0
_0809F600: .4byte 0x02018000
_0809F604: .4byte gSprites
_0809F608: .4byte gMain
_0809F60C: .4byte 0x0000043c
_0809F610:
	ldr r0, _0809F624
	ldrb r1, [r0, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809F628
	adds r0, r1
	bl DestroySpriteAndFreeResources
	b _0809F706
	.align 2, 0
_0809F624: .4byte 0x02018000
_0809F628: .4byte gSprites
_0809F62C:
	ldr r0, _0809F640
	adds r1, r0, 0
	adds r1, 0x74
	movs r2, 0
	strb r2, [r1]
	adds r0, 0x79
	strb r2, [r0]
	ldr r0, _0809F644
	adds r1, r3, r0
	b _0809F70C
	.align 2, 0
_0809F640: .4byte 0x02018000
_0809F644: .4byte 0x0000043c
_0809F648:
	ldr r4, _0809F66C
	adds r0, r4, 0
	bl sub_809F678
	adds r0, r4, 0
	bl sub_80A1CD8
	lsls r0, 24
	cmp r0, 0
	beq _0809F662
	movs r0, 0x2
	bl sub_80A12D0
_0809F662:
	adds r0, r4, 0
	bl sub_80A0EA4
	b _0809F706
	.align 2, 0
_0809F66C: .4byte 0x02018010
_0809F670:
	ldr r4, _0809F6AC
	adds r5, r4, 0
	adds r5, 0x64
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_809F6B4
	adds r1, r4, 0
	subs r1, 0x10
	strb r0, [r1, 0xC]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0809F73E
	movs r0, 0
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	beq _0809F6B4
	ldr r1, _0809F6B0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0809F6B8
	.align 2, 0
_0809F6AC: .4byte 0x02018010
_0809F6B0: .4byte gUnknown_030041B0
_0809F6B4:
	ldr r0, _0809F6C0
	strh r1, [r0]
_0809F6B8:
	ldr r1, _0809F6C4
	ldr r0, _0809F6C8
	adds r1, r0
	b _0809F70C
	.align 2, 0
_0809F6C0: .4byte gUnknown_030041B0
_0809F6C4: .4byte gMain
_0809F6C8: .4byte 0x0000043c
_0809F6CC:
	ldr r0, _0809F6D4
	bl sub_80A1DCC
	b _0809F706
	.align 2, 0
_0809F6D4: .4byte 0x02018010
_0809F6D8:
	ldr r0, _0809F6E8
	bl sub_80A1DE8
	ldr r1, _0809F6EC
	ldr r0, _0809F6F0
	adds r1, r0
	b _0809F70C
	.align 2, 0
_0809F6E8: .4byte 0x02018010
_0809F6EC: .4byte gMain
_0809F6F0: .4byte 0x0000043c
_0809F6F4:
	bl sub_809F5F8
	lsls r0, 24
	cmp r0, 0
	beq _0809F73E
	ldr r0, _0809F714
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
_0809F706:
	ldr r1, _0809F718
	ldr r2, _0809F71C
	adds r1, r2
_0809F70C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0809F73E
	.align 2, 0
_0809F714: .4byte 0x02018000
_0809F718: .4byte gMain
_0809F71C: .4byte 0x0000043c
_0809F720:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809F73E
	movs r0, 0
	strb r0, [r5]
	ldr r0, _0809F744
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809F748
	adds r0, 0x84
	ldr r0, [r0]
	str r0, [r1]
_0809F73E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F744: .4byte gTasks
_0809F748: .4byte 0x02018000
	thumb_func_end sub_809F43C

	thumb_func_start sub_809F5F8
sub_809F5F8: @ 809F74C
	push {r4,lr}
	ldr r2, _0809F770
	adds r4, r2, 0
	adds r4, 0x74
	ldrb r0, [r4]
	cmp r0, 0
	beq _0809F778
	ldr r0, _0809F774
	ldrb r1, [r2, 0xB]
	lsls r1, 2
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	movs r0, 0x1
	b _0809F788
	.align 2, 0
_0809F770: .4byte 0x02018000
_0809F774: .4byte gUnknown_083C1588
_0809F778:
	adds r0, r2, 0
	adds r0, 0x10
	bl sub_809FAC8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0
_0809F788:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F5F8

	thumb_func_start sub_809F63C
sub_809F63C: @ 809F790
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809FE80
	adds r0, r4, 0
	bl sub_809FC34
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809F63C

	thumb_func_start sub_809F650
sub_809F650: @ 809F7A4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80A00A4
	adds r0, r4, 0
	bl sub_809FF64
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809F650

	thumb_func_start sub_809F664
sub_809F664: @ 809F7B8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80A0390
	adds r0, r4, 0
	bl sub_80A015C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809F664

	thumb_func_start sub_809F678
sub_809F678: @ 809F7CC
	push {lr}
	adds r3, r0, 0
	ldr r1, _0809F7EC
	ldrb r0, [r1, 0xE]
	cmp r0, 0
	bne _0809F7F0
	ldr r2, [r1]
	ldrb r1, [r1, 0x9]
	movs r0, 0x64
	muls r1, r0
	adds r1, r2
	adds r0, r3, 0
	movs r2, 0x64
	bl memcpy
	b _0809F802
	.align 2, 0
_0809F7EC: .4byte 0x02018000
_0809F7F0:
	ldr r0, [r1]
	ldrb r2, [r1, 0x9]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r0, r1
	adds r1, r3, 0
	bl sub_803B4B4
_0809F802:
	pop {r0}
	bx r0
	thumb_func_end sub_809F678

	thumb_func_start sub_809F6B4
sub_809F6B4: @ 809F808
	push {r4-r7,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r7, r1, 0
	ldrb r0, [r7]
	cmp r0, 0
	beq _0809F826
	cmp r0, 0x1
	beq _0809F86C
	adds r0, r4, 0
	bl sub_80A1808
	lsls r0, 24
	lsrs r0, 24
	b _0809F8AA
_0809F826:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _0809F860
	adds r0, r1
	ldr r1, _0809F864
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0809F868
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	bl sub_800D334
	b _0809F8A2
	.align 2, 0
_0809F860: .4byte gMonFrontPicTable
_0809F864: .4byte gMonFrontPicCoords
_0809F868: .4byte gUnknown_081FAF4C
_0809F86C:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	ldrh r0, [r4, 0x4]
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
_0809F8A2:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	movs r0, 0xFF
_0809F8AA:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809F6B4

	thumb_func_start sub_809F760
sub_809F760: @ 809F8B4
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _0809F8D4
	cmp r1, 0x1
	bgt _0809F8CA
	cmp r1, 0
	beq _0809F8D0
	b _0809F8DC
_0809F8CA:
	cmp r2, 0x2
	beq _0809F8D8
	b _0809F8DC
_0809F8D0:
	movs r1, 0xD
	b _0809F8DE
_0809F8D4:
	movs r1, 0xE
	b _0809F8DE
_0809F8D8:
	movs r1, 0xF
	b _0809F8DE
_0809F8DC:
	movs r1, 0x10
_0809F8DE:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809F760

	thumb_func_start sub_809F798
sub_809F798: @ 809F8EC
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _0809F90C
	cmp r1, 0x1
	bgt _0809F902
	cmp r1, 0
	beq _0809F908
	b _0809F914
_0809F902:
	cmp r2, 0x2
	beq _0809F910
	b _0809F914
_0809F908:
	movs r1, 0x11
	b _0809F916
_0809F90C:
	movs r1, 0x12
	b _0809F916
_0809F910:
	movs r1, 0x13
	b _0809F916
_0809F914:
	movs r1, 0x14
_0809F916:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809F798

	thumb_func_start sub_809F7D0
sub_809F7D0: @ 809F924
	push {r4,lr}
	sub sp, 0x64
	mov r0, sp
	bl sub_809F678
	ldr r4, _0809F958
	adds r0, r4, 0
	adds r0, 0x79
	ldrb r1, [r0]
	mov r0, sp
	bl sub_809F760
	lsls r0, 16
	lsrs r0, 16
	bl sub_806F7B8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F95C
	ldrb r0, [r4, 0x8]
	cmp r0, 0x3
	beq _0809F95C
	movs r0, 0
	b _0809F95E
	.align 2, 0
_0809F958: .4byte 0x02018000
_0809F95C:
	movs r0, 0x1
_0809F95E:
	add sp, 0x64
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F7D0

	thumb_func_start sub_809F814
sub_809F814: @ 809F968
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r0, _0809F990
	mov r8, r0
	adds r4, r6, r0
	ldrh r1, [r4, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bgt _0809F994
	adds r0, r1, 0x1
	strh r0, [r4, 0x1C]
	b _0809FB14
	.align 2, 0
_0809F990: .4byte 0x03004b38
_0809F994:
	ldr r7, _0809F9C8
	ldrh r1, [r7, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809F9D4
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0809F9CC
	str r1, [r0]
	movs r0, 0x4
	strh r0, [r4]
	movs r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r2, _0809F9D0
	ldrh r0, [r4, 0x1E]
	adds r2, 0x79
	strb r0, [r2]
	movs r1, 0x1
	negs r1, r1
	adds r0, r5, 0
	bl sub_809E8F0
	b _0809FB14
	.align 2, 0
_0809F9C8: .4byte gMain
_0809F9CC: .4byte sub_809E260
_0809F9D0: .4byte 0x02018000
_0809F9D4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809FA08
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0809FA00
	str r1, [r0]
	movs r0, 0x4
	strh r0, [r4]
	movs r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r2, _0809FA04
	ldrh r0, [r4, 0x1E]
	adds r2, 0x79
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809FB14
	.align 2, 0
_0809FA00: .4byte sub_809E260
_0809FA04: .4byte 0x02018000
_0809FA08:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809FA1C
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809FA6C
_0809FA1C:
	ldr r1, _0809FA60
	ldrb r0, [r1, 0xB]
	cmp r0, 0x2
	beq _0809FB14
	cmp r0, 0x3
	bne _0809FA48
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809FA3C
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809FA48
_0809FA3C:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809FA48:
	ldr r1, _0809FA64
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809FA68
	str r1, [r0]
	movs r1, 0x1
	negs r1, r1
	adds r0, r5, 0
	b _0809FAC6
	.align 2, 0
_0809FA60: .4byte 0x02018000
_0809FA64: .4byte gTasks
_0809FA68: .4byte sub_809E260
_0809FA6C:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0809FA82
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0809FAE8
_0809FA82:
	ldr r1, _0809FADC
	adds r2, r1, 0
	adds r2, 0x76
	ldrb r0, [r1, 0xB]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0809FB14
	cmp r0, 0x2
	bne _0809FAB4
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809FAA8
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809FAB4
_0809FAA8:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809FAB4:
	ldr r1, _0809FAE0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809FAE4
	str r1, [r0]
	adds r0, r5, 0
	movs r1, 0x1
_0809FAC6:
	bl sub_809F134
	ldrb r1, [r4, 0x1E]
	movs r0, 0x1
	bl sub_80A1488
	ldrb r1, [r4, 0x1E]
	movs r0, 0x1
	bl sub_80A1654
	b _0809FB14
	.align 2, 0
_0809FADC: .4byte 0x02018000
_0809FAE0: .4byte gTasks
_0809FAE4: .4byte sub_809E260
_0809FAE8:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809FAFA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809FB14
_0809FAFA:
	ldrb r1, [r4, 0x1E]
	movs r0, 0x2
	bl sub_80A1488
	ldrb r1, [r4, 0x1E]
	movs r0, 0x2
	bl sub_80A1654
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0809FB20
	str r1, [r0]
_0809FB14:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB20: .4byte sub_809E260
	thumb_func_end sub_809F814

	thumb_func_start sub_809F9D0
sub_809F9D0: @ 809FB24
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _0809FB78
	adds r2, r4, r6
	movs r0, 0
	strh r0, [r2, 0x1C]
	strh r1, [r2, 0x1E]
	movs r5, 0x2
	negs r5, r5
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_80A1488
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_80A1654
	movs r0, 0xB
	movs r1, 0xF
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	ldr r0, _0809FB7C
	movs r1, 0xB
	movs r2, 0xF
	bl MenuPrint
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0809FB80
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB78: .4byte 0x03004b38
_0809FB7C: .4byte gOtherText_CantForgetHMs
_0809FB80: .4byte sub_809F814
	thumb_func_end sub_809F9D0

	thumb_func_start sub_809FA30
sub_809FA30: @ 809FB84
	ldr r0, _0809FB8C
	adds r0, 0x7A
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0809FB8C: .4byte 0x02018000
	thumb_func_end sub_809FA30

	thumb_func_start GetStringCenterAlignXOffsetWithLetterSpacing
GetStringCenterAlignXOffsetWithLetterSpacing: @ 809FB90
	push {r4,lr}
	lsls r0, 24
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsrs r2, 23
	lsrs r3, 18
	ldr r4, _0809FBC4
	adds r3, r4
	adds r2, r3
	lsrs r1, 12
	lsrs r0, 23
	movs r4, 0x80
	lsls r4, 2
	adds r3, r4, 0
	adds r0, r3
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x80
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x81
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FBC4: .4byte 0x0600f000
	thumb_func_end GetStringCenterAlignXOffsetWithLetterSpacing

	thumb_func_start GetStringCenterAlignXOffset
GetStringCenterAlignXOffset: @ 809FBC8
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xF
	adds r2, r4, 0
	bl GetStringCenterAlignXOffsetWithLetterSpacing
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetStringCenterAlignXOffset

	thumb_func_start sub_809FA94
sub_809FA94: @ 809FBE8
	push {lr}
	bl sub_8040CB4
	lsls r0, 24
	cmp r0, 0
	beq _0809FC08
	ldr r0, _0809FC04
	movs r1, 0x4
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x1
	b _0809FC14
	.align 2, 0
_0809FC04: .4byte gUnknown_083C157E
_0809FC08:
	ldr r0, _0809FC18
	movs r1, 0x4
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0
_0809FC14:
	pop {r1}
	bx r1
	.align 2, 0
_0809FC18: .4byte gUnknown_083C157C
	thumb_func_end sub_809FA94

	thumb_func_start sub_809FAC8
sub_809FAC8: @ 809FC1C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0809FC7C
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x3
	bl MenuZeroFillWindowRect
	movs r0, 0x3
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xB
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	ldr r4, _0809FC74
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetMonNickname
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0x3
	movs r3, 0x10
	bl sub_80A1FF8
	ldr r0, _0809FC78
	movs r1, 0x4
	movs r2, 0x2
	bl LoadPalette
	b _0809FD2A
	.align 2, 0
_0809FC74: .4byte gStringVar1
_0809FC78: .4byte gUnknown_083C157C
_0809FC7C:
	adds r0, r5, 0
	bl sub_809FA94
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToPokedexNum
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0809FCC0
	cmp r4, r0
	beq _0809FCEA
	cmp r6, 0
	bne _0809FCC4
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x2
	bl GetStringCenterAlignXOffset
	movs r0, 0x11
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0xD
	b _0809FCE0
	.align 2, 0
_0809FCC0: .4byte 0x0000ffff
_0809FCC4:
	movs r0, 0x2
	movs r1, 0x8
	movs r2, 0x1
	movs r3, 0x2
	bl GetStringCenterAlignXOffsetWithLetterSpacing
	movs r0, 0x11
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x8
_0809FCE0:
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80A1F98
	b _0809FCF6
_0809FCEA:
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x3
	bl MenuZeroFillWindowRect
_0809FCF6:
	ldr r1, _0809FD34
	adds r0, r1, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r1, r0, 0
	adds r0, r5, 0
	bl GetMonNickname
	adds r1, r0, 0
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x13
	strb r0, [r1, 0x1]
	movs r0, 0x3C
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0809FD34
	movs r1, 0x1
	movs r2, 0xC
	bl MenuPrint
	adds r0, r5, 0
	bl sub_80A0958
_0809FD2A:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD34: .4byte gStringVar1
	thumb_func_end sub_809FAC8

	thumb_func_start sub_809FBE4
sub_809FBE4: @ 809FD38
	push {r4,lr}
	movs r4, 0
_0809FD3C:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1B
	bls _0809FD3C
	movs r0, 0xB
	movs r1, 0x4
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809FBE4

	thumb_func_start sub_809FC0C
sub_809FC0C: @ 809FD60
	push {lr}
	ldr r0, _0809FD84
	movs r1, 0xB
	movs r2, 0x6
	bl MenuPrint
	movs r0, 0
	movs r1, 0x16
	movs r2, 0x4
	bl GetStringCenterAlignXOffset
	movs r0, 0x2
	movs r1, 0x17
	movs r2, 0x4
	bl GetStringCenterAlignXOffset
	pop {r0}
	bx r0
	.align 2, 0
_0809FD84: .4byte gOtherText_Type2
	thumb_func_end sub_809FC0C

	thumb_func_start sub_809FC34
sub_809FC34: @ 809FD88
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r4, 0
_0809FD90:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0809FD90
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0809FE70
	ldr r5, _0809FE24
	adds r0, r5, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r5, r0, 0
	ldr r1, _0809FE28
	bl StringCopy
	adds r5, r0, 0
	ldr r4, _0809FE2C
	adds r1, r4, 0
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x4E
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r0, _0809FE24
	movs r1, 0xB
	movs r2, 0x4
	bl MenuPrint
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0xC1
	movs r3, 0x20
	bl sub_80A1EF8
	movs r0, 0x9
	movs r1, 0x78
	movs r2, 0x30
	movs r3, 0
	bl sub_80A198C
	adds r0, r6, 0
	movs r1, 0x20
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x5
	bhi _0809FE34
	ldr r0, _0809FE30
	b _0809FE46
	.align 2, 0
_0809FE24: .4byte gStringVar1
_0809FE28: .4byte gOtherText_OriginalTrainer
_0809FE2C: .4byte gOtherText_FiveQuestionsAndSlash
_0809FE30: .4byte gOtherText_EggAbout
_0809FE34:
	cmp r0, 0xA
	bhi _0809FE40
	ldr r0, _0809FE3C
	b _0809FE46
	.align 2, 0
_0809FE3C: .4byte gOtherText_EggSoon
_0809FE40:
	cmp r1, 0x28
	bhi _0809FE54
	ldr r0, _0809FE50
_0809FE46:
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
	b _0809FE5E
	.align 2, 0
_0809FE50: .4byte gOtherText_EggSomeTime
_0809FE54:
	ldr r0, _0809FE6C
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
_0809FE5E:
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0xE
	bl sub_80A0708
	b _0809FFA0
	.align 2, 0
_0809FE6C: .4byte gOtherText_EggLongTime
_0809FE70:
	ldr r4, _0809FEB8
	adds r0, r6, 0
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	adds r0, r6, 0
	movs r1, 0x3
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r5, _0809FEBC
	adds r0, r5, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r5, r0, 0
	ldr r1, _0809FEC0
	bl StringCopy
	adds r5, r0, 0
	adds r0, r6, 0
	movs r1, 0x31
	bl GetMonData
	cmp r0, 0
	bne _0809FEC4
	adds r0, r5, 0
	movs r1, 0x9
	b _0809FEC8
	.align 2, 0
_0809FEB8: .4byte gStringVar2
_0809FEBC: .4byte gStringVar1
_0809FEC0: .4byte gOtherText_OriginalTrainer
_0809FEC4:
	adds r0, r5, 0
	movs r1, 0xA
_0809FEC8:
	bl sub_80A1E58
	adds r5, r0, 0
	ldr r1, _0809FFA8
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x4E
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r0, _0809FFAC
	movs r1, 0xB
	movs r2, 0x4
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	ldr r1, _0809FFB0
	ands r1, r0
	movs r0, 0xC1
	str r0, [sp]
	movs r0, 0x20
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0xD
	movs r2, 0x5
	movs r3, 0x2
	bl sub_80A1F98
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _0809FFB4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r5, r1, r2
	ldrb r4, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x30
	movs r3, 0
	bl sub_80A198C
	ldrb r0, [r5, 0x7]
	cmp r4, r0
	beq _0809FF4C
	ldrb r0, [r5, 0x7]
	movs r1, 0xA0
	movs r2, 0x30
	movs r3, 0x1
	bl sub_80A198C
_0809FF4C:
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x2E
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetAbilityBySpecies
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xD
	muls r0, r4
	ldr r1, _0809FFB8
	adds r0, r1
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x9
	bl sub_80A1FF8
	ldr r0, _0809FFBC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0xB
	movs r2, 0xB
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0xE
	bl sub_80A0798
_0809FFA0:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FFA8: .4byte gStringVar2
_0809FFAC: .4byte gStringVar1
_0809FFB0: .4byte 0x0000ffff
_0809FFB4: .4byte gBaseStats
_0809FFB8: .4byte gAbilityNames
_0809FFBC: .4byte gAbilityDescriptions
	thumb_func_end sub_809FC34

	thumb_func_start sub_809FE6C
sub_809FE6C: @ 809FFC0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809FC0C
	adds r0, r4, 0
	bl sub_809FC34
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809FE6C

	thumb_func_start sub_809FE80
sub_809FE80: @ 809FFD4
	push {lr}
	movs r0, 0xE
	movs r1, 0x4
	movs r2, 0x12
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0x19
	movs r1, 0x4
	movs r2, 0x1E
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0xB
	movs r1, 0xE
	movs r2, 0x1C
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_809FE80

	thumb_func_start sub_809FEB8
sub_809FEB8: @ 80A000C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080A0094
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0xE
	bl sub_80A1FF8
	ldr r0, _080A0098
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x10
	bl sub_80A1FF8
	ldr r0, _080A009C
	movs r1, 0x15
	movs r2, 0x10
	bl MenuPrint
	ldr r0, _080A00A0
	movs r4, 0x2A
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x7
	bl sub_80A1F48
	ldr r0, _080A00A4
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x9
	bl sub_80A1F48
	ldr r0, _080A00A8
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0xB
	bl sub_80A1F48
	ldr r0, _080A00AC
	movs r4, 0x24
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0x16
	movs r3, 0x7
	bl sub_80A1F48
	ldr r0, _080A00B0
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0x16
	movs r3, 0x9
	bl sub_80A1F48
	ldr r0, _080A00B4
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0x16
	movs r3, 0xB
	bl sub_80A1F48
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0094: .4byte gOtherText_ExpPoints
_080A0098: .4byte gOtherText_NextLv
_080A009C: .4byte gOtherText_Terminator18
_080A00A0: .4byte gOtherText_HP
_080A00A4: .4byte gOtherText_Attack
_080A00A8: .4byte gOtherText_Defense
_080A00AC: .4byte gOtherText_SpAtk
_080A00B0: .4byte gOtherText_SpDef
_080A00B4: .4byte gOtherText_Speed
	thumb_func_end sub_809FEB8

	thumb_func_start sub_809FF64
sub_809FF64: @ 80A00B8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080A00BE:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _080A00BE
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	movs r2, 0x4
	bl sub_80A0BF4
	adds r0, r5, 0
	bl sub_80A0B88
	ldr r4, _080A01E0
	adds r0, r5, 0
	movs r1, 0x19
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1D
	movs r2, 0xE
	bl MenuPrint_RightAligned
	adds r0, r5, 0
	movs r1, 0x17
	movs r2, 0x10
	bl sub_80A0C80
	adds r0, r5, 0
	movs r1, 0x3B
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x32
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3C
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0xB
	movs r3, 0x32
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3E
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1B
	movs r2, 0x7
	movs r3, 0x12
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3F
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1B
	movs r2, 0x9
	movs r3, 0x12
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3D
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1B
	movs r2, 0xB
	movs r3, 0x12
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C14
	adds r4, r0, 0
	movs r0, 0xBA
	strb r0, [r4]
	adds r4, 0x1
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x30
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A01E0
	movs r1, 0x7E
	movs r2, 0x38
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A01E0: .4byte gStringVar1
	thumb_func_end sub_809FF64

	thumb_func_start sub_80A0090
sub_80A0090: @ 80A01E4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809FEB8
	adds r0, r4, 0
	bl sub_809FF64
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0090

	thumb_func_start sub_80A00A4
sub_80A00A4: @ 80A01F8
	push {lr}
	movs r0, 0xB
	movs r1, 0x4
	movs r2, 0x13
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0x10
	movs r1, 0x7
	movs r2, 0x15
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	movs r0, 0x11
	movs r1, 0x9
	movs r2, 0x15
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1B
	movs r1, 0x7
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x16
	movs r1, 0xE
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	movs r0, 0x17
	movs r1, 0x10
	movs r2, 0x1C
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80A00A4

	thumb_func_start sub_80A00F4
sub_80A00F4: @ 80A0248
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _080A0280
	adds r0, r2, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A025E
	cmp r1, 0x4
	beq _080A02A4
_080A025E:
	ldrb r0, [r2, 0xB]
	cmp r0, 0x2
	bne _080A028C
	ldr r0, _080A0284
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0xF
	bl sub_80A1FF8
	ldr r0, _080A0288
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x11
	bl sub_80A1FF8
	b _080A02A4
	.align 2, 0
_080A0280: .4byte 0x02018000
_080A0284: .4byte gOtherText_Power2
_080A0288: .4byte gOtherText_Accuracy2
_080A028C:
	ldr r0, _080A02A8
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0xF
	bl sub_80A1FF8
	ldr r0, _080A02AC
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x11
	bl sub_80A1FF8
_080A02A4:
	pop {r0}
	bx r0
	.align 2, 0
_080A02A8: .4byte gOtherText_Appeal2
_080A02AC: .4byte gOtherText_Jam2
	thumb_func_end sub_80A00F4

	thumb_func_start sub_80A015C
sub_80A015C: @ 80A02B0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	movs r7, 0
_080A02BC:
	mov r0, r8
	adds r1, r7, 0
	bl sub_809F760
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r8
	adds r1, r7, 0
	bl sub_809F798
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r6, 0
	bne _080A030C
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_80A1918
	lsls r4, r7, 25
	movs r0, 0x80
	lsls r0, 19
	adds r4, r0
	lsrs r4, 24
	ldr r0, _080A0304
	movs r1, 0xD
	movs r2, 0xF
	adds r3, r4, 0
	bl sub_80A1FF8
	ldr r0, _080A0308
	movs r1, 0x1A
	adds r2, r4, 0
	bl MenuPrint
	b _080A03CA
	.align 2, 0
_080A0304: .4byte gOtherText_OneDash
_080A0308: .4byte gOtherText_TwoDashes
_080A030C:
	ldr r0, _080A0334
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A033C
	ldr r1, _080A0338
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r4, r7, 1
	adds r2, r4, 0x4
	lsls r2, 27
	lsrs r2, 24
	movs r1, 0x57
	adds r3, r7, 0
	bl sub_80A198C
	b _080A0360
	.align 2, 0
_080A0334: .4byte 0x02018000
_080A0338: .4byte gBattleMoves
_080A033C:
	ldr r1, _080A03E4
	lsls r0, r6, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 5
	movs r1, 0x90
	lsls r1, 21
	adds r0, r1
	lsrs r0, 24
	lsls r4, r7, 1
	adds r2, r4, 0x4
	lsls r2, 27
	lsrs r2, 24
	movs r1, 0x57
	adds r3, r7, 0
	bl sub_80A198C
_080A0360:
	movs r0, 0xD
	muls r0, r6
	ldr r1, _080A03E8
	adds r0, r1
	adds r5, r4, 0x4
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0xD
	movs r2, 0xF
	adds r3, r5, 0
	bl sub_80A1FF8
	movs r0, 0x1
	movs r1, 0x18
	adds r2, r5, 0
	bl GetStringCenterAlignXOffset
	mov r0, r8
	movs r1, 0x15
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r7, 0
	bl CalculatePPWithBonus
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A03EC
	adds r0, r1, 0
	mov r1, r9
	movs r2, 0xE
	movs r3, 0x1
	bl sub_8072C14
	adds r1, r0, 0
	movs r0, 0xBA
	strb r0, [r1]
	adds r1, 0x1
	adds r0, r1, 0
	adds r1, r4, 0
	movs r2, 0x20
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A03EC
	movs r1, 0x19
	adds r2, r5, 0
	bl MenuPrint
_080A03CA:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bhi _080A03D6
	b _080A02BC
_080A03D6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A03E4: .4byte gContestMoves
_080A03E8: .4byte gMoveNames
_080A03EC: .4byte gStringVar1
	thumb_func_end sub_80A015C

	thumb_func_start sub_80A029C
sub_80A029C: @ 80A03F0
	push {r4,r5,lr}
	ldr r1, _080A040C
	adds r4, r1, 0
	adds r4, 0x7C
	ldrh r0, [r4]
	cmp r0, 0
	bne _080A0414
	ldr r0, _080A0410
	movs r1, 0xD
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80A1FF8
	b _080A04D2
	.align 2, 0
_080A040C: .4byte 0x02018000
_080A0410: .4byte gOtherText_CancelNoTerminator
_080A0414:
	ldrh r5, [r4]
	ldrb r0, [r1, 0xB]
	cmp r0, 0x2
	bne _080A0438
	ldr r1, _080A0434
	lsls r4, r5, 1
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	movs r1, 0x57
	movs r2, 0x60
	movs r3, 0x4
	bl sub_80A198C
	b _080A0458
	.align 2, 0
_080A0434: .4byte gBattleMoves
_080A0438:
	ldr r1, _080A0474
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 5
	movs r1, 0x90
	lsls r1, 21
	adds r0, r1
	lsrs r0, 24
	movs r1, 0x57
	movs r2, 0x60
	movs r3, 0x4
	bl sub_80A198C
	lsls r4, r5, 1
_080A0458:
	ldr r0, _080A0478
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A0480
	movs r0, 0xD
	muls r0, r5
	ldr r1, _080A047C
	adds r0, r1
	movs r1, 0xA
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80A1FF8
	b _080A0492
	.align 2, 0
_080A0474: .4byte gContestMoves
_080A0478: .4byte 0x02018000
_080A047C: .4byte gMoveNames
_080A0480:
	movs r0, 0xD
	muls r0, r5
	ldr r1, _080A04D8
	adds r0, r1
	movs r1, 0x9
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80A1FF8
_080A0492:
	movs r0, 0x1
	movs r1, 0x18
	movs r2, 0xC
	bl GetStringCenterAlignXOffset
	ldr r2, _080A04DC
	ldr r1, _080A04E0
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x4]
	adds r0, r2, 0
	adds r1, r4, 0
	movs r2, 0xE
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r4, 0
	movs r2, 0x20
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A04DC
	movs r1, 0x19
	movs r2, 0xC
	bl MenuPrint
_080A04D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A04D8: .4byte gMoveNames
_080A04DC: .4byte gStringVar1
_080A04E0: .4byte gBattleMoves
	thumb_func_end sub_80A029C

	thumb_func_start sub_80A0390
sub_80A0390: @ 80A04E4
	push {r4,lr}
	movs r4, 0
_080A04E8:
	lsls r3, r4, 1
	adds r1, r3, 0x4
	lsls r1, 24
	lsrs r1, 24
	adds r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xF
	movs r2, 0x1C
	bl MenuZeroFillWindowRect
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080A04E8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0390

	thumb_func_start sub_80A03BC
sub_80A03BC: @ 80A0510
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x4
	beq _080A0524
	bl sub_809F760
	lsls r0, 16
	lsrs r1, r0, 16
	b _080A0534
_080A0524:
	ldr r0, _080A053C
	adds r2, r0, 0
	adds r2, 0x7C
	ldrh r0, [r2]
	ldr r1, _080A0540
	cmp r0, 0
	beq _080A0534
	adds r1, r0, 0
_080A0534:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A053C: .4byte 0x02018000
_080A0540: .4byte 0x0000ffff
	thumb_func_end sub_80A03BC

	thumb_func_start sub_80A03F0
sub_80A03F0: @ 80A0544
	push {lr}
	ldrb r1, [r1]
	bl sub_80A03BC
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080A0568
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A0570
	adds r0, r1, 0
	bl sub_80A04CC
	ldr r0, _080A056C
	bl sub_80A057C
	b _080A0576
	.align 2, 0
_080A0568: .4byte 0x02018000
_080A056C: .4byte 0x0000ffff
_080A0570:
	adds r0, r1, 0
	bl sub_80A057C
_080A0576:
	pop {r0}
	bx r0
	thumb_func_end sub_80A03F0

	thumb_func_start sub_80A0428
sub_80A0428: @ 80A057C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r1, [r6]
	bl sub_80A03BC
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xB
	movs r1, 0xF
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	ldr r0, _080A05A8
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A05AC
	adds r0, r4, 0
	bl sub_80A046C
	b _080A05B2
	.align 2, 0
_080A05A8: .4byte 0x02018000
_080A05AC:
	adds r0, r4, 0
	bl sub_80A0498
_080A05B2:
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80A03F0
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0428

	thumb_func_start sub_80A046C
sub_80A046C: @ 80A05C0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080A05E4
	cmp r1, r0
	beq _080A05DE
	ldr r0, _080A05E8
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0xB
	movs r2, 0xF
	bl MenuPrint
_080A05DE:
	pop {r0}
	bx r0
	.align 2, 0
_080A05E4: .4byte 0x0000ffff
_080A05E8: .4byte gMoveDescriptions
	thumb_func_end sub_80A046C

	thumb_func_start sub_80A0498
sub_80A0498: @ 80A05EC
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080A0614
	cmp r3, r0
	beq _080A0610
	ldr r2, _080A0618
	ldr r1, _080A061C
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0xB
	movs r2, 0xF
	bl MenuPrint
_080A0610:
	pop {r0}
	bx r0
	.align 2, 0
_080A0614: .4byte 0x0000ffff
_080A0618: .4byte gUnknown_083CADD4
_080A061C: .4byte gContestMoves
	thumb_func_end sub_80A0498

	thumb_func_start sub_80A04CC
sub_80A04CC: @ 80A0620
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080A0658
	cmp r4, r0
	beq _080A06C6
	ldr r2, _080A065C
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x1]
	adds r5, r1, 0
	cmp r0, 0x1
	bhi _080A0668
	ldr r0, _080A0660
	ldr r1, _080A0664
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C74
	ldr r0, _080A0660
	movs r1, 0x7
	movs r2, 0xF
	bl MenuPrint
	b _080A067E
	.align 2, 0
_080A0658: .4byte 0x0000ffff
_080A065C: .4byte gBattleMoves
_080A0660: .4byte gStringVar1
_080A0664: .4byte gOtherText_ThreeDashes2
_080A0668:
	ldr r0, _080A06A4
	ldrb r1, [r2, 0x1]
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A06A4
	movs r1, 0x7
	movs r2, 0xF
	bl MenuPrint
_080A067E:
	ldr r0, _080A06A8
	adds r1, r5, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _080A06B0
	ldr r0, _080A06A4
	ldr r1, _080A06AC
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C74
	ldr r0, _080A06A4
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
	b _080A06C6
	.align 2, 0
_080A06A4: .4byte gStringVar1
_080A06A8: .4byte gBattleMoves
_080A06AC: .4byte gOtherText_ThreeDashes2
_080A06B0:
	ldr r0, _080A06CC
	ldrb r1, [r1, 0x3]
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A06CC
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
_080A06C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A06CC: .4byte gStringVar1
	thumb_func_end sub_80A04CC

	thumb_func_start sub_80A057C
sub_80A057C: @ 80A06D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080A079C
	mov r8, r0
	ldr r0, _080A07A0
	cmp r5, r0
	beq _080A078E
	ldr r1, _080A07A4
	ldr r2, _080A07A8
	lsls r3, r5, 3
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	mov r10, r2
	mov r9, r3
	cmp r4, 0xFF
	beq _080A070C
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
_080A070C:
	movs r2, 0
	movs r7, 0x3
	movs r6, 0xF3
	lsls r6, 2
_080A0714:
	ldr r3, _080A07AC
	cmp r4, 0xFF
	beq _080A0720
	cmp r2, r4
	bcs _080A0720
	adds r3, 0x1
_080A0720:
	lsrs r0, r2, 2
	lsls r0, 5
	adds r1, r2, 0
	ands r1, r7
	adds r1, r0
	lsls r1, 1
	add r1, r8
	adds r1, r6
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080A0714
	ldr r0, _080A07A0
	cmp r5, r0
	beq _080A078E
	mov r0, r9
	add r0, r10
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _080A07A4
	adds r0, r1
	ldrb r4, [r0, 0x2]
	cmp r4, 0xFF
	beq _080A0760
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
_080A0760:
	movs r2, 0
	movs r6, 0x3
	ldr r5, _080A07B0
_080A0766:
	ldr r3, _080A07B4
	cmp r4, 0xFF
	beq _080A0772
	cmp r2, r4
	bcs _080A0772
	subs r3, 0x1
_080A0772:
	lsrs r0, r2, 2
	lsls r0, 5
	adds r1, r2, 0
	ands r1, r6
	adds r1, r0
	lsls r1, 1
	add r1, r8
	adds r1, r5
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080A0766
_080A078E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A079C: .4byte 0x06006800
_080A07A0: .4byte 0x0000ffff
_080A07A4: .4byte gContestEffects
_080A07A8: .4byte gContestMoves
_080A07AC: .4byte 0x00001039
_080A07B0: .4byte 0x0000044c
_080A07B4: .4byte 0x0000103d
	thumb_func_end sub_80A057C

	thumb_func_start sub_80A0664
sub_80A0664: @ 80A07B8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080A07F4
	ldr r1, [r0]
	ldr r0, _080A07F8
	cmp r1, r0
	bne _080A0804
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A07FC
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldrh r5, [r0]
	ldr r4, _080A0800
	adds r2, 0x8
	adds r1, r2
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	bl StripExtCtrlCodes
	b _080A0816
	.align 2, 0
_080A07F4: .4byte 0x02018000
_080A07F8: .4byte gEnemyParty
_080A07FC: .4byte gLinkPlayers
_080A0800: .4byte gStringVar1
_080A0804:
	bl sub_80BFB94
	adds r5, r0, 0
	ldr r0, _080A0844
	ands r5, r0
	ldr r0, _080A0848
	ldr r1, _080A084C
	bl StringCopy
_080A0816:
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	ldr r1, _080A0844
	ands r1, r0
	cmp r5, r1
	bne _080A083E
	ldr r4, _080A0850
	adds r0, r6, 0
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _080A0848
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _080A0854
_080A083E:
	movs r0, 0
	b _080A0856
	.align 2, 0
_080A0844: .4byte 0x0000ffff
_080A0848: .4byte gStringVar1
_080A084C: .4byte gSaveBlock2
_080A0850: .4byte gStringVar2
_080A0854:
	movs r0, 0x1
_080A0856:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80A0664

	thumb_func_start sub_80A0708
sub_80A0708: @ 80A085C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r9, r5
	lsls r2, 24
	lsrs r6, r2, 24
	mov r8, r6
	movs r1, 0x25
	bl GetMonData
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bls _080A0890
	ldr r0, _080A088C
	b _080A08C2
	.align 2, 0
_080A088C: .4byte gOtherText_EggObtainedInTrade
_080A0890:
	adds r0, r4, 0
	movs r1, 0x23
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xFF
	bne _080A08A8
	ldr r0, _080A08A4
	b _080A08C2
	.align 2, 0
_080A08A4: .4byte gOtherText_EggNicePlace
_080A08A8:
	adds r0, r4, 0
	bl sub_80A0664
	lsls r0, 24
	cmp r0, 0
	bne _080A08BC
	ldr r0, _080A08B8
	b _080A08C2
	.align 2, 0
_080A08B8: .4byte gOtherText_EggObtainedInTrade
_080A08BC:
	cmp r7, 0xFD
	bne _080A08D0
	ldr r0, _080A08CC
_080A08C2:
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	b _080A08DA
	.align 2, 0
_080A08CC: .4byte gOtherText_EggHotSprings
_080A08D0:
	ldr r0, _080A08E8
	mov r1, r9
	mov r2, r8
	bl MenuPrint
_080A08DA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A08E8: .4byte gOtherText_EggDayCare
	thumb_func_end sub_80A0708

	thumb_func_start sub_80A0798
sub_80A0798: @ 80A08EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r5, _080A0988
	bl GetNature
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A098C
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	ldr r0, _080A0990
	lsls r4, 2
	adds r4, r0
	ldr r1, [r4]
	adds r0, r5, 0
	movs r2, 0xE
	bl sub_80A1E9C
	adds r5, r0, 0
	ldr r1, _080A0994
	bl StringCopy
	adds r5, r0, 0
	adds r0, r7, 0
	bl sub_80A0664
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A09E8
	adds r0, r7, 0
	movs r1, 0x23
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0x24
	bl GetMonData
	cmp r0, 0
	bne _080A09A0
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_80A203C
	adds r5, r0, 0
	movs r0, 0xFE
	strb r0, [r5]
	adds r5, 0x1
	ldr r4, _080A0998
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80FC02C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE
	bl sub_80A1E9C
	adds r5, r0, 0
	ldr r1, _080A099C
	bl StringCopy
	b _080A0A84
	.align 2, 0
_080A0988: .4byte gStringVar4
_080A098C: .4byte gOtherText_Nature
_080A0990: .4byte gNatureNames
_080A0994: .4byte gOtherText_Terminator4
_080A0998: .4byte gStringVar1
_080A099C: .4byte gOtherText_Egg2
_080A09A0:
	cmp r6, 0x57
	bhi _080A0A38
	adds r0, r7, 0
	movs r1, 0x24
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_80A203C
	adds r5, r0, 0
	movs r0, 0xFE
	strb r0, [r5]
	adds r5, 0x1
	ldr r4, _080A09E0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80FC02C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE
	bl sub_80A1E9C
	adds r5, r0, 0
	ldr r1, _080A09E4
	bl StringCopy
	b _080A0A84
	.align 2, 0
_080A09E0: .4byte gStringVar1
_080A09E4: .4byte gOtherText_Met
_080A09E8:
	adds r0, r7, 0
	movs r1, 0x25
	bl GetMonData
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bhi _080A0A38
	adds r0, r7, 0
	movs r1, 0x23
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xFF
	bne _080A0A34
	adds r0, r7, 0
	movs r1, 0x24
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_80A203C
	adds r5, r0, 0
	movs r0, 0xFE
	strb r0, [r5]
	adds r5, 0x1
	ldr r1, _080A0A30
	b _080A0A40
	.align 2, 0
_080A0A30: .4byte gOtherText_FatefulEncounter
_080A0A34:
	cmp r6, 0x57
	bls _080A0A4C
_080A0A38:
	movs r0, 0xFE
	strb r0, [r5]
	adds r5, 0x1
	ldr r1, _080A0A48
_080A0A40:
	adds r0, r5, 0
	bl StringCopy
	b _080A0A84
	.align 2, 0
_080A0A48: .4byte gOtherText_ObtainedInTrade
_080A0A4C:
	adds r0, r7, 0
	movs r1, 0x24
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_80A203C
	adds r5, r0, 0
	movs r0, 0xFE
	strb r0, [r5]
	adds r5, 0x1
	ldr r4, _080A0A9C
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80FC02C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE
	bl sub_80A1E9C
	adds r5, r0, 0
	ldr r1, _080A0AA0
	bl StringCopy
_080A0A84:
	ldr r0, _080A0AA4
	mov r1, r9
	mov r2, r8
	bl MenuPrint
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A9C: .4byte gStringVar1
_080A0AA0: .4byte gOtherText_Met2
_080A0AA4: .4byte gStringVar4
	thumb_func_end sub_80A0798

	thumb_func_start sub_80A0958
sub_80A0958: @ 80A0AA8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r8, r0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r2, _080A0B74
	adds r0, r2, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	movs r6, 0xFC
	strb r6, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	movs r0, 0x7
	strb r0, [r2, 0x2]
	movs r0, 0xBA
	strb r0, [r2, 0x3]
	adds r2, 0x4
	movs r0, 0xB
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _080A0B78
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r6, [r2]
	movs r0, 0x13
	mov r10, r0
	strb r0, [r2, 0x1]
	movs r0, 0x50
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	mov r9, r0
	strb r0, [r2, 0x3]
	ldr r5, _080A0B74
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	bl MenuPrint
	movs r0, 0x3
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	movs r0, 0x34
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r4, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	strb r6, [r2]
	mov r0, r10
	strb r0, [r2, 0x1]
	movs r0, 0x20
	strb r0, [r2, 0x2]
	mov r0, r9
	strb r0, [r2, 0x3]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x10
	bl MenuPrint
	mov r0, r8
	movs r1, 0x7
	movs r2, 0x10
	bl sub_80A0A2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0B74: .4byte gStringVar1
_080A0B78: .4byte gSpeciesNames
	thumb_func_end sub_80A0958

	thumb_func_start sub_80A0A2C
sub_80A0A2C: @ 80A0B7C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x20
	beq _080A0BD4
	cmp r0, 0x1D
	beq _080A0BD4
	adds r0, r6, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080A0BBE
	cmp r0, 0xFE
	beq _080A0BC8
	adds r3, r4, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuZeroFillWindowRect
	b _080A0BD4
_080A0BBE:
	ldr r0, _080A0BC4
	movs r1, 0xB
	b _080A0BCC
	.align 2, 0
_080A0BC4: .4byte gOtherText_MaleSymbol2
_080A0BC8:
	ldr r0, _080A0BDC
	movs r1, 0xC
_080A0BCC:
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_80A1FF8
_080A0BD4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0BDC: .4byte gOtherText_FemaleSymbolAndLv
	thumb_func_end sub_80A0A2C

	thumb_func_start sub_80A0A90
sub_80A0A90: @ 80A0BE0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x32
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x33
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x34
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x35
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x36
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x43
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x44
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x45
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x46
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x47
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x48
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x49
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4A
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4B
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4C
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4D
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4E
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A0A90

	thumb_func_start sub_80A0B88
sub_80A0B88: @ 80A0CD8
	push {r4,r5,lr}
	bl sub_80A0A90
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A0CF8
	ldr r0, _080A0CF0
	ldr r1, _080A0CF4
	bl StringCopy
	b _080A0D28
	.align 2, 0
_080A0CF0: .4byte gStringVar1
_080A0CF4: .4byte gOtherText_None
_080A0CF8:
	ldr r4, _080A0D38
	ldr r1, _080A0D3C
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r0, 24
	subs r4, 0x2
	adds r0, r4
	movs r1, 0xFC
	strb r1, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x6
	strb r1, [r0, 0x2]
	adds r0, 0x3
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
_080A0D28:
	ldr r0, _080A0D40
	movs r1, 0x15
	movs r2, 0x4
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0D38: .4byte gStringVar1
_080A0D3C: .4byte gOtherText_Ribbons00
_080A0D40: .4byte gUnknown_083C15AE
	thumb_func_end sub_80A0B88

	thumb_func_start sub_80A0BF4
sub_80A0BF4: @ 80A0D44
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r5, 0xAF
	bne _080A0D98
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A0D98
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A0D98
	ldr r0, _080A0D90
	ldrb r0, [r0, 0x9]
	cmp r0, 0x1
	beq _080A0D7E
	cmp r0, 0x4
	beq _080A0D7E
	cmp r0, 0x5
	bne _080A0D98
_080A0D7E:
	ldr r4, _080A0D94
	adds r0, r5, 0
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	b _080A0DB8
	.align 2, 0
_080A0D90: .4byte 0x02018000
_080A0D94: .4byte gStringVar1
_080A0D98:
	cmp r5, 0
	bne _080A0DB0
	ldr r0, _080A0DA8
	ldr r1, _080A0DAC
	bl StringCopy
	b _080A0DB8
	.align 2, 0
_080A0DA8: .4byte gStringVar1
_080A0DAC: .4byte gOtherText_None
_080A0DB0:
	ldr r1, _080A0DC8
	adds r0, r5, 0
	bl CopyItemName
_080A0DB8:
	ldr r0, _080A0DCC
	adds r1, r7, 0
	adds r2, r6, 0
	bl MenuPrint
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0DC8: .4byte gStringVar1
_080A0DCC: .4byte gUnknown_083C15B4
	thumb_func_end sub_80A0BF4

	thumb_func_start sub_80A0C80
sub_80A0C80: @ 80A0DD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	movs r0, 0
	mov r9, r0
	movs r6, 0
	movs r7, 0
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x63
	bhi _080A0E64
	ldr r3, _080A0E9C
	adds r1, r5, 0x1
	lsls r1, 2
	ldr r2, _080A0EA0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r2, r0
	adds r1, r2
	adds r1, r3
	ldr r1, [r1]
	mov r0, r8
	subs r0, r1, r0
	mov r9, r0
	lsls r0, r5, 2
	adds r0, r2
	adds r0, r3
	ldr r0, [r0]
	subs r1, r0
	mov r2, r8
	subs r4, r2, r0
	lsls r0, r4, 6
	bl __udivsi3
	adds r6, r0, 0
	movs r7, 0
	adds r0, r7, 0
	orrs r0, r6
	cmp r0, 0
	bne _080A0E64
	cmp r4, 0
	beq _080A0E64
	movs r6, 0x1
	movs r7, 0
_080A0E64:
	ldr r4, _080A0EA4
	adds r0, r4, 0
	mov r1, r9
	bl ConvertIntToDecimalString
	mov r1, r10
	adds r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp]
	bl MenuPrint_RightAligned
	ldr r0, _080A0EA8
	mov r9, r0
	movs r2, 0
	mov r12, r2
	ldr r0, _080A0EAC
	mov r8, r0
_080A0E8A:
	cmp r7, 0
	bgt _080A0E96
	cmp r7, 0
	bne _080A0EB4
	cmp r6, 0x7
	bls _080A0EB4
_080A0E96:
	ldr r1, _080A0EB0
	b _080A0EE6
	.align 2, 0
_080A0E9C: .4byte gExperienceTables
_080A0EA0: .4byte gBaseStats
_080A0EA4: .4byte gStringVar1
_080A0EA8: .4byte 0x06004caa
_080A0EAC: .4byte 0x00002062
_080A0EB0: .4byte 0x0000206a
_080A0EB4:
	adds r5, r7, 0
	adds r4, r6, 0
	cmp r7, 0
	bge _080A0EC4
	movs r4, 0x7
	movs r5, 0
	adds r4, r6
	adcs r5, r7
_080A0EC4:
	lsls r3, r5, 29
	lsrs r2, r4, 3
	adds r0, r3, 0
	orrs r0, r2
	asrs r1, r5, 3
	lsrs r5, r0, 29
	lsls r4, r1, 3
	adds r3, r5, 0
	orrs r3, r4
	lsls r2, r0, 3
	adds r1, r7, 0
	adds r0, r6, 0
	subs r0, r2
	sbcs r1, r3
	add r0, r8
	lsls r0, 16
	lsrs r1, r0, 16
_080A0EE6:
	mov r2, r12
	lsls r0, r2, 1
	add r0, r9
	strh r1, [r0]
	movs r0, 0x8
	negs r0, r0
	asrs r1, r0, 31
	adds r6, r0
	adcs r7, r1
	cmp r7, 0
	bge _080A0F00
	movs r6, 0
	movs r7, 0
_080A0F00:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x7
	bls _080A0E8A
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0C80

	thumb_func_start sub_80A0DD0
sub_80A0DD0: @ 80A0F20
	push {r4,r5,lr}
	ldr r2, _080A0F8C
	movs r5, 0xFC
	strb r5, [r2]
	movs r0, 0x12
	strb r0, [r2, 0x1]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	adds r2, 0x3
	adds r0, r2, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	ldr r1, _080A0F90
	ldr r4, _080A0F94
	adds r0, r4, 0
	adds r0, 0x7E
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r5, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x58
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080A0F8C
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	adds r4, 0x7F
	ldrb r0, [r4]
	cmp r0, 0
	beq _080A0F98
	movs r0, 0x5
	movs r1, 0x17
	movs r2, 0
	bl GetStringCenterAlignXOffset
	movs r0, 0x6
	movs r1, 0x18
	movs r2, 0
	bl GetStringCenterAlignXOffset
	b _080A0FA4
	.align 2, 0
_080A0F8C: .4byte gStringVar1
_080A0F90: .4byte gUnknown_083C1068
_080A0F94: .4byte 0x02018000
_080A0F98:
	movs r0, 0x17
	movs r1, 0
	movs r2, 0x18
	movs r3, 0x1
	bl MenuZeroFillWindowRect
_080A0FA4:
	ldr r2, _080A0FE8
	adds r0, r2, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	ldr r1, _080A0FEC
	ldr r0, _080A0FF0
	adds r0, 0x7F
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x28
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080A0FE8
	movs r1, 0x19
	movs r2, 0
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0FE8: .4byte gStringVar1
_080A0FEC: .4byte gUnknown_083C1068
_080A0FF0: .4byte 0x02018000
	thumb_func_end sub_80A0DD0

	thumb_func_start sub_80A0EA4
sub_80A0EA4: @ 80A0FF4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080A101C
	ldr r6, _080A1020
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _080A1024
	adds r0, r4, 0
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	cmp r0, 0
	beq _080A1024
	movs r0, 0x2C
	b _080A1028
	.align 2, 0
_080A101C: .4byte 0x0600e444
_080A1020: .4byte 0x0600ec44
_080A1024:
	ldr r1, _080A1034
	adds r0, r1, 0
_080A1028:
	strh r0, [r5]
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1034: .4byte 0x0000081a
	thumb_func_end sub_80A0EA4

	thumb_func_start sub_80A0EE8
sub_80A0EE8: @ 80A1038
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r3, 0
	ldr r6, _080A1074
	adds r5, r6, 0
	ldr r1, _080A1078
	mov r8, r1
	ldr r2, _080A107C
	mov r10, r2
_080A1052:
	adds r0, r5, 0
	adds r0, 0x75
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080A1080
	lsls r1, r3, 1
	lsls r0, r3, 2
	add r0, sp
	mov r4, r8
	strh r4, [r0]
	adds r1, 0x1
	lsls r1, 1
	mov r7, sp
	adds r0, r7, r1
	strh r4, [r0]
	b _080A1132
	.align 2, 0
_080A1074: .4byte 0x02018000
_080A1078: .4byte 0x00004040
_080A107C: .4byte 0x0000404a
_080A1080:
	movs r0, 0x76
	adds r0, r6
	mov r12, r0
	ldrb r1, [r0]
	cmp r3, r1
	bls _080A10A2
	lsls r1, r3, 1
	lsls r0, r3, 2
	add r0, sp
	mov r2, r10
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 1
	mov r4, sp
	adds r0, r4, r1
	strh r2, [r0]
	b _080A1132
_080A10A2:
	ldrb r4, [r5, 0xB]
	cmp r3, r4
	bcs _080A10BE
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r7, sp
	adds r2, r7, r0
	ldr r0, _080A10D8
	strh r0, [r2]
	adds r1, 0x1
	lsls r1, 1
	add r1, sp
	adds r0, 0x1
	strh r0, [r1]
_080A10BE:
	cmp r3, r4
	bne _080A10F6
	mov r0, r12
	ldrb r0, [r0]
	cmp r3, r0
	beq _080A10E0
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r4, sp
	adds r2, r4, r0
	ldr r0, _080A10DC
	b _080A10EA
	.align 2, 0
_080A10D8: .4byte 0x00004046
_080A10DC: .4byte 0x00004041
_080A10E0:
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r7, sp
	adds r2, r7, r0
	ldr r0, _080A1114
_080A10EA:
	strh r0, [r2]
	adds r1, 0x1
	lsls r1, 1
	add r1, sp
	adds r0, 0x1
	strh r0, [r1]
_080A10F6:
	ldrb r0, [r5, 0xB]
	cmp r3, r0
	bls _080A1132
	adds r0, r6, 0
	adds r0, 0x76
	ldrb r0, [r0]
	cmp r3, r0
	beq _080A111C
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r4, sp
	adds r2, r4, r0
	ldr r0, _080A1118
	b _080A1126
	.align 2, 0
_080A1114: .4byte 0x0000404b
_080A1118: .4byte 0x00004043
_080A111C:
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r7, sp
	adds r2, r7, r0
	ldr r0, _080A1184
_080A1126:
	strh r0, [r2]
	adds r1, 0x1
	lsls r1, 1
	add r1, sp
	adds r0, 0x1
	strh r0, [r1]
_080A1132:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080A1052
	ldr r1, _080A1188
	ldr r0, _080A118C
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080A1190
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r3, 0
_080A114E:
	lsls r0, r3, 1
	mov r4, sp
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x10
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _080A114E
	ldr r1, _080A1194
	ldr r0, _080A118C
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080A1190
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1184: .4byte 0x00004048
_080A1188: .4byte 0x0600e016
_080A118C: .4byte 0x040000d4
_080A1190: .4byte 0x80000008
_080A1194: .4byte 0x0600e056
	thumb_func_end sub_80A0EE8

	thumb_func_start sub_80A1048
sub_80A1048: @ 80A1198
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080A11F0
	adds r6, r0, r1
	ldrh r0, [r6]
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r6, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080A11BE
	b _080A1374
_080A11BE:
	movs r5, 0x2
	ldrsh r2, [r6, r5]
	ldr r0, _080A11F4
	subs r0, r2
	lsls r0, 1
	ldr r1, _080A11F8
	adds r4, r0, r1
	ldr r5, _080A11FC
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 5
	adds r7, r1, 0
	cmp r2, r0
	bhi _080A1204
	ldr r0, _080A1200
	str r4, [r0]
	str r5, [r0, 0x4]
	lsrs r1, r2, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A1230
	.align 2, 0
_080A11F0: .4byte 0x03004b38
_080A11F4: .4byte 0x0000024a
_080A11F8: .4byte gUnknown_08E73508
_080A11FC: .4byte 0x0600e480
_080A1200: .4byte 0x040000d4
_080A1204:
	ldr r3, _080A125C
	str r4, [r3]
	str r5, [r3, 0x4]
	ldr r0, _080A1260
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r4, r0
	adds r5, r0
	ldr r1, _080A1264
	adds r2, r1
	cmp r2, r0
	bhi _080A1204
	str r4, [r3]
	str r5, [r3, 0x4]
	lsrs r0, r2, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
_080A1230:
	movs r5, 0x2
	ldrsh r0, [r6, r5]
	ldr r1, _080A1268
	subs r1, r0
	lsls r1, 1
	adds r3, r1, r7
	ldr r4, _080A126C
	lsls r1, r0, 1
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bhi _080A1270
	ldr r0, _080A125C
	str r3, [r0]
	str r4, [r0, 0x4]
	lsrs r1, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A129C
	.align 2, 0
_080A125C: .4byte 0x040000d4
_080A1260: .4byte 0x80000800
_080A1264: .4byte 0xfffff000
_080A1268: .4byte 0x0000026a
_080A126C: .4byte 0x0600e4c0
_080A1270:
	ldr r2, _080A12C8
	str r3, [r2]
	str r4, [r2, 0x4]
	ldr r0, _080A12CC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r3, r0
	adds r4, r0
	ldr r5, _080A12D0
	adds r1, r5
	cmp r1, r0
	bhi _080A1270
	str r3, [r2]
	str r4, [r2, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
_080A129C:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	ldr r1, _080A12D4
	subs r1, r0
	lsls r1, 1
	adds r3, r1, r7
	ldr r4, _080A12D8
	lsls r1, r0, 1
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bhi _080A12DC
	ldr r0, _080A12C8
	str r3, [r0]
	str r4, [r0, 0x4]
	lsrs r1, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A1308
	.align 2, 0
_080A12C8: .4byte 0x040000d4
_080A12CC: .4byte 0x80000800
_080A12D0: .4byte 0xfffff000
_080A12D4: .4byte 0x0000024a
_080A12D8: .4byte 0x0600ec80
_080A12DC:
	ldr r2, _080A1334
	str r3, [r2]
	str r4, [r2, 0x4]
	ldr r0, _080A1338
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r3, r0
	adds r4, r0
	ldr r5, _080A133C
	adds r1, r5
	cmp r1, r0
	bhi _080A12DC
	str r3, [r2]
	str r4, [r2, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
_080A1308:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	ldr r1, _080A1340
	subs r1, r0
	lsls r1, 1
	adds r3, r1, r7
	ldr r4, _080A1344
	lsls r1, r0, 1
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bhi _080A1348
	ldr r0, _080A1334
	str r3, [r0]
	str r4, [r0, 0x4]
	lsrs r1, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A1374
	.align 2, 0
_080A1334: .4byte 0x040000d4
_080A1338: .4byte 0x80000800
_080A133C: .4byte 0xfffff000
_080A1340: .4byte 0x0000026a
_080A1344: .4byte 0x0600ecc0
_080A1348:
	ldr r2, _080A1400
	str r3, [r2]
	str r4, [r2, 0x4]
	ldr r0, _080A1404
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r3, r0
	adds r4, r0
	ldr r5, _080A1408
	adds r1, r5
	cmp r1, r0
	bhi _080A1348
	str r3, [r2]
	str r4, [r2, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
_080A1374:
	ldrb r4, [r6, 0x2]
	ldrh r7, [r6, 0x2]
	ldrh r0, [r6]
	mov r12, r0
	cmp r4, 0x9
	bhi _080A13C2
	adds r3, r6, 0x4
	ldr r2, _080A1400
	ldr r5, _080A140C
_080A1386:
	lsls r1, r4, 1
	ldr r6, _080A1410
	adds r0, r1, r6
	str r3, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r6, 0x40
	adds r0, r1, r6
	str r3, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r6, _080A1414
	adds r0, r1, r6
	str r3, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080A1418
	adds r1, r0
	str r3, [r2]
	str r1, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080A1386
_080A13C2:
	mov r1, r12
	lsls r0, r1, 16
	cmp r0, 0
	beq _080A13D6
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0
	ble _080A13D6
	cmp r0, 0x9
	ble _080A13F4
_080A13D6:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080A13EA
	ldr r0, _080A141C
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80A1FF8
_080A13EA:
	bl sub_80A1D18
	mov r0, r8
	bl DestroyTask
_080A13F4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1400: .4byte 0x040000d4
_080A1404: .4byte 0x80000800
_080A1408: .4byte 0xfffff000
_080A140C: .4byte 0x80000001
_080A1410: .4byte 0x0600e480
_080A1414: .4byte 0x0600ec80
_080A1418: .4byte 0x0600ecc0
_080A141C: .4byte gOtherText_Status
	thumb_func_end sub_80A1048

	thumb_func_start sub_80A12D0
sub_80A12D0: @ 80A1420
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x12
	movs r2, 0x5
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x1D
	bl sub_80A18E4
	ldr r0, _080A1460
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080A1464
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	cmp r4, 0
	bge _080A1468
	movs r0, 0xA
	b _080A146A
	.align 2, 0
_080A1460: .4byte sub_80A1048
_080A1464: .4byte gTasks
_080A1468:
	movs r0, 0
_080A146A:
	strh r0, [r1, 0xA]
	ldr r0, _080A1480
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xC]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1480: .4byte gTasks
	thumb_func_end sub_80A12D0

	thumb_func_start sub_80A1334
sub_80A1334: @ 80A1484
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _080A1534
	adds r7, r0, r1
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	adds r0, r1
	strh r0, [r7, 0x2]
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0
	cmp r1, 0
	blt _080A14BA
	movs r0, 0xA
	cmp r1, 0xA
	bgt _080A14BA
	ldrh r0, [r7, 0x2]
_080A14BA:
	lsls r0, 16
	asrs r2, r0, 16
	mov r9, r0
	cmp r2, 0
	ble _080A14F6
	movs r0, 0xA
	subs r0, r2
	lsls r0, 1
	ldr r1, _080A1538
	adds r4, r0, r1
	movs r5, 0
	adds r6, r2, 0
	ldr r0, _080A153C
	mov r8, r0
_080A14D6:
	adds r0, r5, 0
	adds r0, 0xD
	lsls r0, 6
	ldr r1, _080A1540
	adds r0, r1
	adds r1, r4, 0
	mov r2, r8
	ands r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A14D6
_080A14F6:
	mov r1, r9
	asrs r2, r1, 16
	cmp r2, 0x9
	bgt _080A1544
	ldr r4, _080A1538
	movs r5, 0
	mov r8, sp
	movs r0, 0xA
	subs r6, r0, r2
	ldr r0, _080A153C
	ands r6, r0
	movs r0, 0x80
	lsls r0, 17
	mov r9, r0
_080A1512:
	ldrh r0, [r7, 0x4]
	mov r1, r8
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, 0
	mov r2, r9
	orrs r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A1512
	b _080A1550
	.align 2, 0
_080A1534: .4byte 0x03004b38
_080A1538: .4byte 0x06005b40
_080A153C: .4byte 0x001fffff
_080A1540: .4byte gUnknown_08E73E88
_080A1544:
	movs r0, 0
	movs r1, 0x13
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A1550:
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080A1560
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bge _080A159A
_080A1560:
	ldr r4, _080A15D0
	ldrb r0, [r4, 0xB]
	cmp r0, 0x2
	bne _080A1594
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A0958
	adds r0, r4, 0
	bl sub_80A1CD8
	lsls r0, 24
	cmp r0, 0
	beq _080A1594
	ldr r0, _080A15D4
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80A1FF8
_080A1594:
	mov r0, r10
	bl DestroyTask
_080A159A:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0x9
	ble _080A15C0
	ldr r4, _080A15D0
	ldrb r0, [r4, 0xB]
	cmp r0, 0x2
	bne _080A15B0
	ldrb r0, [r7, 0x6]
	bl sub_80A00F4
_080A15B0:
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r7, 0x6
	bl sub_80A0428
	mov r0, r10
	bl DestroyTask
_080A15C0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A15D0: .4byte 0x02018000
_080A15D4: .4byte gOtherText_Status
	thumb_func_end sub_80A1334

	thumb_func_start sub_80A1488
sub_80A1488: @ 80A15D8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080A162C
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A15F6
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A15F6:
	ldr r5, _080A1630
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	bne _080A1612
	adds r0, r5, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
_080A1612:
	ldr r1, _080A1634
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	lsls r0, r6, 24
	asrs r0, 24
	strh r0, [r3, 0x8]
	cmp r0, 0
	bge _080A1638
	movs r0, 0xA
	b _080A163A
	.align 2, 0
_080A162C: .4byte 0x02018000
_080A1630: .4byte sub_80A1334
_080A1634: .4byte gTasks
_080A1638:
	movs r0, 0
_080A163A:
	strh r0, [r3, 0xA]
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	strh r7, [r0, 0xE]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1488

	thumb_func_start sub_80A1500
sub_80A1500: @ 80A1650
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _080A1700
	adds r7, r0, r1
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	adds r0, r1
	strh r0, [r7, 0x2]
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0
	cmp r1, 0
	blt _080A1686
	movs r0, 0xA
	cmp r1, 0xA
	bgt _080A1686
	ldrh r0, [r7, 0x2]
_080A1686:
	lsls r0, 16
	asrs r2, r0, 16
	mov r9, r0
	cmp r2, 0
	ble _080A16C2
	movs r0, 0xA
	subs r0, r2
	lsls r0, 1
	ldr r1, _080A1704
	adds r4, r0, r1
	movs r5, 0
	adds r6, r2, 0
	ldr r0, _080A1708
	mov r8, r0
_080A16A2:
	adds r0, r5, 0
	adds r0, 0xD
	lsls r0, 6
	ldr r1, _080A170C
	adds r0, r1
	adds r1, r4, 0
	mov r2, r8
	ands r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A16A2
_080A16C2:
	mov r1, r9
	asrs r2, r1, 16
	cmp r2, 0x9
	bgt _080A1710
	ldr r4, _080A1704
	movs r5, 0
	mov r8, sp
	movs r0, 0xA
	subs r6, r0, r2
	ldr r0, _080A1708
	ands r6, r0
	movs r0, 0x80
	lsls r0, 17
	mov r9, r0
_080A16DE:
	ldrh r0, [r7, 0x4]
	mov r1, r8
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, 0
	mov r2, r9
	orrs r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A16DE
	b _080A171C
	.align 2, 0
_080A1700: .4byte 0x03004b38
_080A1704: .4byte 0x06006b40
_080A1708: .4byte 0x001fffff
_080A170C: .4byte gUnknown_08E74688
_080A1710:
	movs r0, 0
	movs r1, 0x13
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A171C:
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080A172C
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bge _080A1766
_080A172C:
	ldr r4, _080A179C
	ldrb r0, [r4, 0xB]
	cmp r0, 0x3
	bne _080A1760
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A0958
	adds r0, r4, 0
	bl sub_80A1CD8
	lsls r0, 24
	cmp r0, 0
	beq _080A1760
	ldr r0, _080A17A0
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80A1FF8
_080A1760:
	mov r0, r10
	bl DestroyTask
_080A1766:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0x9
	ble _080A178C
	ldr r4, _080A179C
	ldrb r0, [r4, 0xB]
	cmp r0, 0x3
	bne _080A177C
	ldrb r0, [r7, 0x6]
	bl sub_80A00F4
_080A177C:
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r7, 0x6
	bl sub_80A0428
	mov r0, r10
	bl DestroyTask
_080A178C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A179C: .4byte 0x02018000
_080A17A0: .4byte gOtherText_Status
	thumb_func_end sub_80A1500

	thumb_func_start sub_80A1654
sub_80A1654: @ 80A17A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080A17F8
	ldrb r0, [r0, 0xB]
	cmp r0, 0x3
	bne _080A17C2
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A17C2:
	ldr r5, _080A17FC
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	bne _080A17DE
	adds r0, r5, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
_080A17DE:
	ldr r1, _080A1800
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	lsls r0, r6, 24
	asrs r0, 24
	strh r0, [r3, 0x8]
	cmp r0, 0
	bge _080A1804
	movs r0, 0xA
	b _080A1806
	.align 2, 0
_080A17F8: .4byte 0x02018000
_080A17FC: .4byte sub_80A1500
_080A1800: .4byte gTasks
_080A1804:
	movs r0, 0
_080A1806:
	strh r0, [r3, 0xA]
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	strh r7, [r0, 0xE]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1654

	thumb_func_start sub_80A16CC
sub_80A16CC: @ 80A181C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080A1874
	mov r12, r0
	mov r1, r9
	cmp r1, 0
	bne _080A187C
	movs r5, 0
	ldr r7, _080A1878
	movs r0, 0x80
	lsls r0, 5
	adds r6, r0, 0
	movs r1, 0x40
	adds r1, r7
	mov r8, r1
_080A1844:
	lsls r2, r5, 1
	mov r0, r12
	adds r3, r2, r0
	adds r4, r2, r7
	ldrh r1, [r4]
	adds r0, r6, r1
	strh r0, [r3]
	adds r1, r3, 0
	adds r1, 0x40
	ldrh r4, [r4]
	adds r0, r6, r4
	strh r0, [r1]
	adds r3, 0x80
	add r2, r8
	ldrh r2, [r2]
	adds r0, r6, r2
	strh r0, [r3]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A1844
	b _080A18B8
	.align 2, 0
_080A1874: .4byte 0x06006ad4
_080A1878: .4byte gUnknown_08E94510
_080A187C:
	movs r5, 0
	ldr r6, _080A1900
	movs r7, 0x80
	lsls r7, 5
	adds r4, r7, 0
	movs r0, 0x40
	adds r0, r6
	mov r8, r0
_080A188C:
	lsls r1, r5, 1
	mov r7, r12
	adds r2, r1, r7
	adds r0, r1, r6
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
	adds r3, r2, 0
	adds r3, 0x40
	add r1, r8
	ldrh r7, [r1]
	adds r0, r4, r7
	strh r0, [r3]
	adds r2, 0x80
	ldrh r1, [r1]
	adds r0, r4, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A188C
_080A18B8:
	ldr r0, _080A1904
	mov r12, r0
	mov r1, r9
	cmp r1, 0
	bne _080A190C
	movs r5, 0
	ldr r7, _080A1908
	movs r0, 0xC0
	lsls r0, 6
	adds r6, r0, 0
	movs r1, 0x40
	adds r1, r7
	mov r8, r1
_080A18D2:
	lsls r2, r5, 1
	mov r0, r12
	adds r3, r2, r0
	adds r4, r2, r7
	ldrh r1, [r4]
	adds r0, r6, r1
	strh r0, [r3]
	adds r1, r3, 0
	adds r1, 0x40
	ldrh r4, [r4]
	adds r0, r6, r4
	strh r0, [r1]
	adds r3, 0x80
	add r2, r8
	ldrh r2, [r2]
	adds r0, r6, r2
	strh r0, [r3]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A18D2
	b _080A1948
	.align 2, 0
_080A1900: .4byte gUnknown_08E94550
_080A1904: .4byte 0x06005ad4
_080A1908: .4byte gUnknown_08E94510
_080A190C:
	movs r5, 0
	ldr r6, _080A1954
	movs r7, 0xC0
	lsls r7, 6
	adds r4, r7, 0
	movs r0, 0x40
	adds r0, r6
	mov r8, r0
_080A191C:
	lsls r1, r5, 1
	mov r7, r12
	adds r2, r1, r7
	adds r0, r1, r6
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
	adds r3, r2, 0
	adds r3, 0x40
	add r1, r8
	ldrh r7, [r1]
	adds r0, r4, r7
	strh r0, [r3]
	adds r2, 0x80
	ldrh r1, [r1]
	adds r0, r4, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A191C
_080A1948:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1954: .4byte gUnknown_08E94550
	thumb_func_end sub_80A16CC

	thumb_func_start sub_80A1808
sub_80A1808: @ 80A1958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r1, 0x41
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080A19B0
	movs r1, 0x28
	movs r2, 0x40
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, r0, 4
	add r4, r8
	lsls r4, 2
	ldr r5, _080A19B4
	adds r7, r4, r5
	adds r0, r7, 0
	bl FreeSpriteOamMatrix
	strh r6, [r7, 0x2E]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080A19B8
	str r0, [r4]
	adds r0, r6, 0
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _080A19BC
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _080A19CA
	.align 2, 0
_080A19B0: .4byte gUnknown_02024E8C
_080A19B4: .4byte gSprites
_080A19B8: .4byte sub_80A1888
_080A19BC:
	adds r2, r7, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080A19CA:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1808

	thumb_func_start sub_80A1888
sub_80A1888: @ 80A19D8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A1A08
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A1A00
	ldr r0, _080A1A0C
	str r0, [r4, 0x1C]
	ldr r0, _080A1A10
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080A1A00
	ldrh r0, [r4, 0x2E]
	movs r1, 0
	bl PlayCry1
_080A1A00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A08: .4byte gPaletteFade
_080A1A0C: .4byte SpriteCallbackDummy
_080A1A10: .4byte 0x02018010
	thumb_func_end sub_80A1888

	thumb_func_start sub_80A18C4
sub_80A18C4: @ 80A1A14
	push {lr}
	movs r1, 0
	ldr r3, _080A1A30
	movs r2, 0xFF
_080A1A1C:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1D
	bls _080A1A1C
	pop {r0}
	bx r0
	.align 2, 0
_080A1A30: .4byte 0x0201a000
	thumb_func_end sub_80A18C4

	thumb_func_start sub_80A18E4
sub_80A18E4: @ 80A1A34
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A1A60
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080A1A58
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A1A64
	adds r0, r1
	bl DestroySprite
	movs r0, 0xFF
	strb r0, [r4]
_080A1A58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A60: .4byte 0x0201a000
_080A1A64: .4byte gSprites
	thumb_func_end sub_80A18E4

	thumb_func_start sub_80A1918
sub_80A1918: @ 80A1A68
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080A1A98
	ldr r2, _080A1A9C
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080A1A98: .4byte gSprites
_080A1A9C: .4byte 0x0201a000
	thumb_func_end sub_80A1918

	thumb_func_start sub_80A1950
sub_80A1950: @ 80A1AA0
	push {r4,r5,lr}
	movs r5, 0
_080A1AA4:
	ldr r0, _080A1AD4
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080A1ABC
	ldr r0, _080A1AD8
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl CreateSprite
	strb r0, [r4]
_080A1ABC:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080A1AA4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1AD4: .4byte 0x0201a000
_080A1AD8: .4byte gSpriteTemplate_83C11C0
	thumb_func_end sub_80A1950

	thumb_func_start sub_80A198C
sub_80A198C: @ 80A1ADC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r10, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r1, _080A1B74
	mov r8, r1
	add r8, r10
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A1B78
	mov r9, r1
	add r0, r9
	adds r1, r4, 0
	bl StartSpriteAnim
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _080A1B7C
	adds r4, r0
	ldrb r2, [r4]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r5, 0x10
	strh r5, [r0, 0x20]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r6, 0x8
	strh r6, [r0, 0x22]
	mov r0, r10
	movs r1, 0
	bl sub_80A1918
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B74: .4byte 0x0201a000
_080A1B78: .4byte gSprites
_080A1B7C: .4byte gUnknown_083C11D8
	thumb_func_end sub_80A198C

	thumb_func_start sub_80A1A30
sub_80A1A30: @ 80A1B80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	mov r9, r0
	ldr r1, _080A1BE8
	ldrb r0, [r1, 0xB]
	cmp r0, 0x1
	bls _080A1C5A
	cmp r4, 0x9
	bne _080A1BA2
	movs r3, 0x1
	mov r9, r3
_080A1BA2:
	movs r5, 0
	movs r0, 0x80
	lsls r0, 6
	adds r0, r1
	mov r8, r0
	ldr r6, _080A1BEC
	mov r10, r5
_080A1BB0:
	lsls r1, r5, 20
	movs r3, 0xB0
	lsls r3, 15
	adds r1, r3
	asrs r1, 16
	ldr r0, _080A1BF0
	movs r2, 0x28
	mov r3, r9
	bl CreateSprite
	adds r1, r4, r5
	mov r3, r8
	adds r2, r1, r3
	strb r0, [r2]
	adds r7, r1, 0
	cmp r5, 0
	bne _080A1BF4
	adds r0, r4, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x4
	bl StartSpriteAnim
	b _080A1C20
	.align 2, 0
_080A1BE8: .4byte 0x02018000
_080A1BEC: .4byte gSprites
_080A1BF0: .4byte gSpriteTemplate_83C1280
_080A1BF4:
	cmp r5, 0x9
	bne _080A1C10
	adds r0, r4, 0
	adds r0, 0x9
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	bl StartSpriteAnim
	b _080A1C20
_080A1C10:
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x6
	bl StartSpriteAnim
_080A1C20:
	mov r0, r8
	adds r2, r7, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080A1C68
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r4, [r0, 0x2E]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r10
	strh r1, [r0, 0x30]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _080A1BB0
_080A1C5A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C68: .4byte sub_80A1BC0
	thumb_func_end sub_80A1A30

	thumb_func_start sub_80A1B1C
sub_80A1B1C: @ 80A1C6C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_080A1C74:
	adds r0, r5, r4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A18E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080A1C74
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1B1C

	thumb_func_start sub_80A1B40
sub_80A1B40: @ 80A1C90
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 24
	ldr r0, _080A1D04
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _080A1D08
	adds r0, r2
	lsrs r7, r1, 24
	movs r2, 0x80
	lsls r2, 19
	adds r1, r2
	lsrs r1, 24
	bl StartSpriteAnim
	movs r4, 0
	adds r0, r7, 0x6
	lsls r0, 24
	mov r8, r0
_080A1CC4:
	ldr r6, _080A1D0C
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080A1D08
	adds r0, r5
	mov r2, r8
	lsrs r1, r2, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080A1CC4
	ldrb r1, [r6, 0x8]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r1, r7, 0x5
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D04: .4byte 0x0201a009
_080A1D08: .4byte gSprites
_080A1D0C: .4byte 0x0201a00a
	thumb_func_end sub_80A1B40

	thumb_func_start sub_80A1BC0
sub_80A1BC0: @ 80A1D10
	push {lr}
	adds r2, r0, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _080A1D48
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x30]
	cmp r0, 0x18
	ble _080A1D3C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	b _080A1D56
_080A1D3C:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	b _080A1D54
_080A1D48:
	movs r0, 0
	strh r0, [r2, 0x30]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	subs r0, 0x5
_080A1D54:
	ands r0, r1
_080A1D56:
	strb r0, [r3]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x9
	bne _080A1D6C
	ldr r0, _080A1D68
	adds r0, 0x79
	b _080A1D70
	.align 2, 0
_080A1D68: .4byte 0x02018000
_080A1D6C:
	ldr r0, _080A1D7C
	adds r0, 0x7A
_080A1D70:
	ldrb r0, [r0]
	lsls r0, 4
	strh r0, [r2, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_080A1D7C: .4byte 0x02018000
	thumb_func_end sub_80A1BC0

	thumb_func_start sub_80A1C30
sub_80A1C30: @ 80A1D80
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 25
	lsrs r3, r0, 24
	adds r4, r3, 0
	adds r0, r3, 0
	adds r0, 0xA
	cmp r3, r0
	bge _080A1DD2
	ldr r5, _080A1DD8
	movs r7, 0x5
	negs r7, r7
	ldr r6, _080A1DDC
_080A1DA0:
	adds r2, r3, r6
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, 0
	adds r0, 0xA
	cmp r3, r0
	blt _080A1DA0
_080A1DD2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1DD8: .4byte gSprites
_080A1DDC: .4byte 0x0201a009
	thumb_func_end sub_80A1C30

	thumb_func_start pokemon_ailments_get_primary
pokemon_ailments_get_primary: @ 80A1DE0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	beq _080A1DF0
	movs r0, 0x1
	b _080A1E22
_080A1DF0:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080A1DFC
	movs r0, 0x2
	b _080A1E22
_080A1DFC:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080A1E08
	movs r0, 0x3
	b _080A1E22
_080A1E08:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080A1E14
	movs r0, 0x4
	b _080A1E22
_080A1E14:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080A1E20
	movs r0, 0
	b _080A1E22
_080A1E20:
	movs r0, 0x5
_080A1E22:
	pop {r1}
	bx r1
	thumb_func_end pokemon_ailments_get_primary

	thumb_func_start sub_80A1CD8
sub_80A1CD8: @ 80A1E28
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080A1E3A
	movs r0, 0x7
	b _080A1E62
_080A1E3A:
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080A1E62
	adds r0, r4, 0
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _080A1E60
	movs r0, 0
	b _080A1E62
_080A1E60:
	movs r0, 0x6
_080A1E62:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1CD8

	thumb_func_start sub_80A1D18
sub_80A1D18: @ 80A1E68
	push {r4,r5,lr}
	sub sp, 0x64
	mov r0, sp
	bl sub_809F678
	mov r0, sp
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080A1EA8
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A1EA0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080A1EB0
	ldr r0, _080A1EA4
	movs r1, 0x40
	movs r2, 0x98
	movs r3, 0
	bl CreateSprite
	strb r0, [r4]
	b _080A1EB0
	.align 2, 0
_080A1EA0: .4byte 0x0201a01d
_080A1EA4: .4byte gSpriteTemplate_83C1304
_080A1EA8:
	movs r0, 0x1D
	bl sub_80A18E4
	b _080A1EC4
_080A1EB0:
	ldr r0, _080A1ECC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A1ED0
	adds r0, r1
	adds r1, r5, 0
	bl StartSpriteAnim
_080A1EC4:
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1ECC: .4byte 0x0201a01d
_080A1ED0: .4byte gSprites
	thumb_func_end sub_80A1D18

	thumb_func_start sub_80A1D84
sub_80A1D84: @ 80A1ED4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080A1F10
	ldr r2, _080A1F14
	adds r0, r1, 0
	bl sub_80F7920
	adds r4, r0, 0
	ldr r6, _080A1F18
	str r4, [r6]
	cmp r4, 0
	beq _080A1F0A
	adds r0, r5, 0
	movs r1, 0x8
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, [r6]
	movs r0, 0x3C
	strh r0, [r1, 0x20]
	movs r0, 0x1A
	strh r0, [r1, 0x22]
_080A1F0A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F10: .4byte 0x00007533
_080A1F14: .4byte gSummaryScreenMonMarkingsPalette
_080A1F18: .4byte gUnknown_020384F4
	thumb_func_end sub_80A1D84

	thumb_func_start sub_80A1DCC
sub_80A1DCC: @ 80A1F1C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A1F34
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0
	bl sub_80A1D84
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F34: .4byte gUnknown_020384F4
	thumb_func_end sub_80A1DCC

	thumb_func_start sub_80A1DE8
sub_80A1DE8: @ 80A1F38
	push {r4,lr}
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80478DC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A1F98
	adds r0, r1
	movs r1, 0x6
	movs r2, 0x88
	movs r3, 0
	bl CreateSprite
	ldr r2, _080A1F9C
	strb r0, [r2, 0xD]
	ldr r3, _080A1FA0
	ldrb r1, [r2, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080A1FA4
	str r1, [r0]
	ldrb r1, [r2, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F98: .4byte gSpriteTemplate_820AAB4
_080A1F9C: .4byte 0x02018000
_080A1FA0: .4byte gSprites
_080A1FA4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80A1DE8

	thumb_func_start sub_80A1E58
sub_80A1E58: @ 80A1FA8
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	beq _080A1FE2
	ldr r3, _080A1FBC
	ldrb r0, [r3]
	adds r4, r2, 0x5
	b _080A1FC4
	.align 2, 0
_080A1FBC: .4byte gUnknown_083C15BC
_080A1FC0:
	adds r3, 0x4
	ldrb r0, [r3]
_080A1FC4:
	cmp r0, 0xFF
	beq _080A1FCC
	cmp r0, r1
	bne _080A1FC0
_080A1FCC:
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x4
	strb r0, [r2, 0x1]
	ldrb r0, [r3, 0x1]
	strb r0, [r2, 0x2]
	ldrb r0, [r3, 0x2]
	strb r0, [r2, 0x3]
	ldrb r0, [r3, 0x3]
	strb r0, [r2, 0x4]
	adds r2, r4, 0
_080A1FE2:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1E58

	thumb_func_start sub_80A1E9C
sub_80A1E9C: @ 80A1FEC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	mov r1, sp
	adds r1, 0x1
	mov r2, sp
	adds r2, 0x2
	mov r0, sp
	bl sub_8072CD4
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80A1E58
	adds r6, r0, 0
	adds r1, r5, 0
	bl StringCopy
	adds r6, r0, 0
	cmp r4, 0xFF
	beq _080A203C
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x4
	strb r0, [r6, 0x1]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r6, 0x2]
	mov r0, sp
	ldrb r0, [r0, 0x1]
	strb r0, [r6, 0x3]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	strb r0, [r6, 0x4]
	movs r0, 0xFF
	strb r0, [r6, 0x5]
	adds r6, 0x5
_080A203C:
	adds r0, r6, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1E9C

	thumb_func_start sub_80A1EF8
sub_80A1EF8: @ 80A2048
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080A2094
	mov r8, r0
	mov r1, r9
	adds r2, r4, 0
	str r3, [sp]
	bl sub_80A1E9C
	ldr r3, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint_PixelCoords
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2094: .4byte gStringVar4
	thumb_func_end sub_80A1EF8

	thumb_func_start sub_80A1F48
sub_80A1F48: @ 80A2098
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _080A20E4
	mov r8, r0
	mov r1, r9
	adds r2, r4, 0
	str r3, [sp]
	bl sub_80A1E9C
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	ldr r3, [sp]
	bl sub_8072BD8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A20E4: .4byte gStringVar4
	thumb_func_end sub_80A1F48

	thumb_func_start sub_80A1F98
sub_80A1F98: @ 80A20E8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	mov r8, r1
	adds r4, r2, 0
	adds r2, r3, 0
	ldr r5, [sp, 0x24]
	ldr r6, [sp, 0x28]
	ldr r7, [sp, 0x2C]
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080A2144
	mov r9, r0
	mov r1, r10
	adds r3, r4, 0
	bl ConvertIntToDecimalStringN
	str r7, [sp]
	mov r0, r9
	mov r1, r8
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_80A1EF8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2144: .4byte gStringVar1
	thumb_func_end sub_80A1F98

	thumb_func_start sub_80A1FF8
sub_80A1FF8: @ 80A2148
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080A2188
	mov r8, r0
	mov r1, r9
	adds r2, r4, 0
	bl sub_80A1E9C
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
_080A2188: .4byte gStringVar4
	thumb_func_end sub_80A1FF8

	thumb_func_start sub_80A203C
sub_80A203C: @ 80A218C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x34
	strb r0, [r4]
	adds r4, 0x1
	cmp r1, 0
	bne _080A21A2
	movs r1, 0x5
_080A21A2:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0xE
	bl sub_80A1E9C
	adds r4, r0, 0
	ldr r1, _080A21C4
	bl StringCopy
	adds r4, r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A21C4: .4byte gOtherText_Comma
	thumb_func_end sub_80A203C

	thumb_func_start sub_80A2078
sub_80A2078: @ 80A21C8
	push {lr}
	ldr r3, _080A21EC
	ldr r2, _080A21F0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, [r1]
	str r2, [r3]
	ldr r2, _080A21F4
	str r2, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080A21EC: .4byte gUnknown_03005CF0
_080A21F0: .4byte gTasks
_080A21F4: .4byte sub_80A20A8
	thumb_func_end sub_80A2078

	thumb_func_start sub_80A20A8
sub_80A20A8: @ 80A21F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _080A2216
	ldr r1, _080A221C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A2220
	ldr r1, [r1]
	str r1, [r0]
_080A2216:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A221C: .4byte gTasks
_080A2220: .4byte gUnknown_03005CF0
	thumb_func_end sub_80A20A8

	thumb_func_start exec_movement
exec_movement: @ 80A2224
	push {r4,lr}
	sub sp, 0x4
	adds r4, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _080A2246
	movs r0, 0x1
	b _080A226E
_080A2246:
	ldr r0, _080A2278
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _080A2258
	movs r0, 0x32
	bl sub_80A2198
_080A2258:
	bl sub_80A21E0
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	ldrb r1, [r1]
	adds r2, r4, 0
	bl sub_80A21F4
	lsls r0, 24
	lsrs r0, 24
_080A226E:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A2278: .4byte sub_80A244C
	thumb_func_end exec_movement

	thumb_func_start sub_80A212C
sub_80A212C: @ 80A227C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080A22BE
	bl sub_80A21E0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80A2260
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _080A22BE
	adds r0, r4, 0
	bl sub_80A2370
	lsls r0, 24
	lsrs r0, 24
	b _080A22C0
_080A22BE:
	movs r0, 0x1
_080A22C0:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A212C

	thumb_func_start sub_80A2178
sub_80A2178: @ 80A22C8
	push {r4,lr}
	bl sub_80A21E0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _080A22E2
	adds r0, r4, 0
	bl sub_80A2408
	adds r0, r4, 0
	bl DestroyTask
_080A22E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2178

	thumb_func_start sub_80A2198
sub_80A2198: @ 80A22E8
	push {r4,r5,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080A2324
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	lsls r1, r0, 2
	adds r1, r0
	lsls r3, r1, 3
	ldr r5, _080A2328
	ldr r0, _080A232C
	adds r4, r0, 0
_080A2308:
	lsls r0, r2, 1
	adds r0, r3
	adds r0, r5
	ldrh r1, [r0]
	orrs r1, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080A2308
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2324: .4byte sub_80A244C
_080A2328: .4byte 0x03004b38
_080A232C: .4byte 0x0000ffff
	thumb_func_end sub_80A2198

	thumb_func_start sub_80A21E0
sub_80A21E0: @ 80A2330
	push {lr}
	ldr r0, _080A2340
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A2340: .4byte sub_80A244C
	thumb_func_end sub_80A21E0

	thumb_func_start sub_80A21F4
sub_80A21F4: @ 80A2344
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r8, r6
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80A2260
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x10
	beq _080A2380
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2370
	lsls r0, 24
	cmp r0, 0
	beq _080A23A0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	b _080A2396
_080A2380:
	adds r0, r7, 0
	movs r1, 0xFF
	bl sub_80A2260
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x10
	beq _080A23A0
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, r8
_080A2396:
	mov r3, r9
	bl sub_80A23C8
	movs r0, 0
	b _080A23A2
_080A23A0:
	movs r0, 0x1
_080A23A2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A21F4

	thumb_func_start sub_80A2260
sub_80A2260: @ 80A23B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A23D4
	adds r1, r0
	adds r1, 0x2
	movs r2, 0
_080A23C8:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080A23D8
	adds r0, r2, 0
	b _080A23E6
	.align 2, 0
_080A23D4: .4byte 0x03004b38
_080A23D8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, 0x1
	cmp r2, 0xF
	bls _080A23C8
	movs r0, 0x10
_080A23E6:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2260

	thumb_func_start sub_80A229C
sub_80A229C: @ 80A23EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A241C
	adds r1, r0
	adds r1, 0x2
	str r1, [r2]
	movs r0, 0
	cmp r0, r3
	bcs _080A2418
_080A240A:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r1, 0x1
	cmp r0, r3
	bcc _080A240A
	str r1, [r2]
_080A2418:
	pop {r0}
	bx r0
	.align 2, 0
_080A241C: .4byte 0x03004b38
	thumb_func_end sub_80A229C

	thumb_func_start sub_80A22D0
sub_80A22D0: @ 80A2420
	push {r4,lr}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	mov r2, sp
	bl sub_80A229C
	ldr r0, [sp]
	strb r4, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A22D0

	thumb_func_start sub_80A22F4
sub_80A22F4: @ 80A2444
	push {r4,lr}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r2, sp
	bl sub_80A229C
	ldr r0, [sp]
	ldrb r0, [r0]
	strb r0, [r4]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A22F4

	thumb_func_start sub_80A2318
sub_80A2318: @ 80A2468
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r2, _080A2490
	lsrs r1, 22
	adds r1, r2
	ldr r2, [r1]
	mvns r2, r2
	lsls r2, 16
	lsrs r2, 16
	ldr r3, _080A2494
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldrh r0, [r1, 0x8]
	ands r2, r0
	strh r2, [r1, 0x8]
	bx lr
	.align 2, 0
_080A2490: .4byte gBitTable
_080A2494: .4byte gTasks
	thumb_func_end sub_80A2318

	thumb_func_start sub_80A2348
sub_80A2348: @ 80A2498
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080A24B8
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldr r0, _080A24BC
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, 0x8]
	orrs r0, r1
	strh r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080A24B8: .4byte gTasks
_080A24BC: .4byte gBitTable
	thumb_func_end sub_80A2348

	thumb_func_start sub_80A2370
sub_80A2370: @ 80A24C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _080A24E8
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldr r0, _080A24EC
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	ldrh r1, [r2, 0x8]
	ands r0, r1
	cmp r0, 0
	bne _080A24F0
	movs r0, 0
	b _080A24F2
	.align 2, 0
_080A24E8: .4byte gTasks
_080A24EC: .4byte gBitTable
_080A24F0:
	movs r0, 0x1
_080A24F2:
	pop {r1}
	bx r1
	thumb_func_end sub_80A2370

	thumb_func_start npc_obj_offscreen_culling_and_flag_update
npc_obj_offscreen_culling_and_flag_update: @ 80A24F8
	lsls r0, 24
	ldr r2, _080A2504
	lsrs r0, 22
	adds r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080A2504: .4byte gUnknown_020384F8
	thumb_func_end npc_obj_offscreen_culling_and_flag_update

	thumb_func_start sub_80A23B8
sub_80A23B8: @ 80A2508
	lsls r0, 24
	ldr r1, _080A2514
	lsrs r0, 22
	adds r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A2514: .4byte gUnknown_020384F8
	thumb_func_end sub_80A23B8

	thumb_func_start sub_80A23C8
sub_80A23C8: @ 80A2518
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2318
	adds r0, r4, 0
	mov r1, r8
	bl npc_obj_offscreen_culling_and_flag_update
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80A22D0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A23C8

	thumb_func_start sub_80A2408
sub_80A2408: @ 80A2558
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080A2594
	adds r1, r0
	adds r4, r1, 0x2
	movs r5, 0
_080A256C:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080A2582
	adds r1, r0, 0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A2598
	adds r0, r1
	bl npc_sync_anim_pause_bits
_080A2582:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x1
	cmp r5, 0xF
	bls _080A256C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2594: .4byte 0x03004b38
_080A2598: .4byte gMapObjects
	thumb_func_end sub_80A2408

	thumb_func_start sub_80A244C
sub_80A244C: @ 80A259C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	mov r6, sp
_080A25A8:
	adds r0, r7, 0
	adds r1, r5, 0
	mov r2, sp
	bl sub_80A22F4
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _080A25CC
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80A23B8
	adds r3, r0, 0
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80A2490
_080A25CC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080A25A8
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A244C

	thumb_func_start sub_80A2490
sub_80A2490: @ 80A25E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r3, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	mov r8, r6
	lsls r2, 24
	lsrs r2, 24
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r1, _080A2630
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080A2618
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080A264A
_080A2618:
	ldrb r1, [r5]
	cmp r1, 0xFE
	bne _080A2634
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80A2348
	adds r0, r4, 0
	bl sub_80643A4
	b _080A264A
	.align 2, 0
_080A2630: .4byte gMapObjects
_080A2634:
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	lsls r0, 24
	cmp r0, 0
	bne _080A264A
	adds r5, 0x1
	mov r0, r8
	adds r1, r5, 0
	bl npc_obj_offscreen_culling_and_flag_update
_080A264A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A2490

	.align 2, 0 @ Don't pad with nop.
