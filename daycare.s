	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start pokemon_get_nick
pokemon_get_nick: @ 80415D4
	push {r4,lr}
	sub sp, 0x14
	adds r4, r1, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy10
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_nick

	thumb_func_start pokemon_get_nick_
pokemon_get_nick_: @ 80415F4
	push {r4,lr}
	sub sp, 0x14
	adds r4, r1, 0
	movs r1, 0x2
	mov r2, sp
	bl GetBoxMonData
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy10
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_nick_

	thumb_func_start daycare_count_pokemon
daycare_count_pokemon: @ 8041614
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_0804161C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r6, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08041634
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08041634:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _0804161C
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end daycare_count_pokemon

	thumb_func_start sub_8041324
sub_8041324: @ 8041648
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	movs r7, 0
	movs r5, 0
	mov r6, r10
	adds r6, 0x74
	movs r0, 0x1
	mov r8, r0
_08041662:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08041692
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0xC
	bl GetBoxMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _08041692
	lsls r0, r5, 1
	adds r0, r6, r0
	b _08041698
_08041692:
	lsls r0, r5, 1
	adds r0, r6, r0
	mov r1, r8
_08041698:
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08041662
	mov r0, r10
	str r7, [r0, 0x70]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8041324

	thumb_func_start daycare_empty_slot
daycare_empty_slot: @ 80416B8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080416BE:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r5, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _080416D6
	lsls r0, r4, 24
	asrs r0, 24
	b _080416E4
_080416D6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _080416BE
	movs r0, 0x1
	negs r0, r0
_080416E4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end daycare_empty_slot

	thumb_func_start sub_80413C8
sub_80413C8: @ 80416EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	mov r8, r1
	mov r0, r8
	bl daycare_empty_slot
	lsls r0, 24
	lsrs r4, r0, 24
	mov r9, r4
	adds r0, r7, 0
	bl sub_80A2B94
	lsls r0, 24
	cmp r0, 0
	beq _0804176E
	lsls r0, r4, 24
	asrs r0, 24
	lsls r4, r0, 3
	subs r4, r0
	lsls r4, 3
	adds r5, r4, 0
	adds r5, 0xA0
	add r5, r8
	adds r6, r5, 0
	adds r6, 0x24
	ldr r1, _080417B4
	adds r0, r6, 0
	bl StringCopy
	adds r0, r6, 0
	movs r1, 0xFC
	bl sub_814A518
	adds r6, 0x8
	adds r0, r7, 0
	adds r1, r6, 0
	bl pokemon_get_nick
	adds r0, r7, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	add r4, r8
	ldr r2, _080417B8
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r4, 0xA0
	ldr r0, _080417BC
	adds r1, r0
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	ldm r1!, {r0,r2,r3}
	stm r4!, {r0,r2,r3}
	adds r0, r7, 0
	bl sub_80A2DF8
_0804176E:
	mov r2, r9
	lsls r4, r2, 24
	asrs r4, 24
	lsls r5, r4, 2
	adds r4, r5, r4
	lsls r4, 4
	add r4, r8
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl pokemon_restore_pp
	movs r0, 0x88
	lsls r0, 1
	add r0, r8
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	adds r0, r7, 0
	bl ZeroMonData
	bl party_compaction
	bl CalculatePlayerPartyCount
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080417B4: .4byte gSaveBlock2
_080417B8: .4byte gSaveBlock1
_080417BC: .4byte 0x00002b4c
	thumb_func_end sub_80413C8

	thumb_func_start daycare_send
daycare_send: @ 80417C0
	push {lr}
	ldr r0, _080417D8
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080417DC
	adds r0, r1
	ldr r1, _080417E0
	bl sub_80413C8
	pop {r0}
	bx r0
	.align 2, 0
_080417D8: .4byte gUnknown_03005CE0
_080417DC: .4byte gPlayerParty
_080417E0: .4byte 0x020286d0
	thumb_func_end daycare_send

	thumb_func_start sub_80414C0
sub_80414C0: @ 80417E4
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r5, 0
	adds r4, 0x50
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _0804183A
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	adds r6, r0, 0
	cmp r6, 0
	bne _0804183A
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	bl ZeroBoxMonData
	adds r0, r5, 0
	adds r0, 0xA0
	adds r4, 0x88
	adds r1, r4, 0
	movs r2, 0x38
	bl memcpy
	movs r0, 0x88
	lsls r0, 1
	adds r2, r5, r0
	adds r0, 0x4
	adds r1, r5, r0
	ldr r0, [r1]
	str r0, [r2]
	str r6, [r1]
	adds r0, r4, 0
	bl sub_80417F4
_0804183A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80414C0

	thumb_func_start sub_804151C
sub_804151C: @ 8041840
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
	ldr r7, _0804185C
_08041848:
	adds r0, r4, 0
	bl TryIncrementMonLevel
	lsls r0, 24
	cmp r0, 0
	beq _08041884
	movs r6, 0x1
	adds r5, 0x1
	b _08041870
	.align 2, 0
_0804185C: .4byte 0x0000ffff
_08041860:
	movs r6, 0
	cmp r0, r7
	bne _08041870
	ldr r0, _08041890
	ldrh r1, [r0]
	adds r0, r4, 0
	bl DeleteFirstMoveAndGiveMoveToMon
_08041870:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08041860
	cmp r5, 0x63
	ble _08041848
_08041884:
	adds r0, r4, 0
	bl CalculateMonStats
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041890: .4byte word_2024E82
	thumb_func_end sub_804151C

	thumb_func_start sub_8041570
sub_8041570: @ 8041894
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x68
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r7, r4, 2
	adds r0, r7, r4
	lsls r0, 4
	adds r6, r5, r0
	ldr r1, _08041964
	adds r0, r6, 0
	bl pokemon_get_nick_
	adds r0, r6, 0
	movs r1, 0xB
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	adds r0, r6, 0
	mov r1, sp
	bl sub_803B4B4
	mov r0, sp
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _080418FC
	mov r0, sp
	movs r1, 0x19
	bl GetMonData
	movs r2, 0x88
	lsls r2, 1
	adds r1, r5, r2
	adds r1, r7
	ldr r1, [r1]
	adds r0, r1
	str r0, [sp, 0x64]
	add r2, sp, 0x64
	mov r0, sp
	movs r1, 0x19
	bl SetMonData
	mov r0, sp
	bl sub_804151C
_080418FC:
	ldr r0, _08041968
	movs r1, 0xFA
	lsls r1, 1
	adds r1, r0
	mov r8, r1
	mov r0, r8
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	lsls r0, r4, 3
	subs r0, r4
	lsls r1, r0, 3
	adds r0, r5, r1
	adds r0, 0xC0
	ldrh r0, [r0]
	cmp r0, 0
	beq _08041934
	adds r4, r1, 0
	adds r4, 0xA0
	adds r4, r5, r4
	mov r0, r8
	adds r1, r4, 0
	bl sub_80A2D88
	adds r0, r4, 0
	bl sub_80417F4
_08041934:
	bl party_compaction
	adds r0, r6, 0
	bl ZeroBoxMonData
	movs r2, 0x88
	lsls r2, 1
	adds r0, r5, r2
	adds r0, r7
	movs r1, 0
	str r1, [r0]
	adds r0, r5, 0
	bl sub_80414C0
	bl CalculatePlayerPartyCount
	mov r0, r9
	add sp, 0x68
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041964: .4byte gStringVar1
_08041968: .4byte gPlayerParty
	thumb_func_end sub_8041570

	thumb_func_start sub_8041648
sub_8041648: @ 804196C
	push {lr}
	ldr r0, _08041980
	ldr r1, _08041984
	ldrb r1, [r1]
	bl sub_8041570
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08041980: .4byte 0x020286d0
_08041984: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8041648

	thumb_func_start sub_8041664
sub_8041664: @ 8041988
	push {r4,r5,lr}
	sub sp, 0x54
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x19
	bl GetBoxMonData
	adds r0, r5
	str r0, [sp, 0x50]
	add r2, sp, 0x50
	mov r0, sp
	movs r1, 0x19
	bl SetBoxMonData
	mov r0, sp
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x54
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8041664

	thumb_func_start sub_80416A0
sub_80416A0: @ 80419C4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	lsls r0, r4, 2
	mov r8, r0
	add r4, r8
	lsls r4, 4
	adds r4, r5, r4
	adds r0, r4, 0
	bl GetLevelFromBoxMonExp
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x88
	lsls r0, 1
	adds r5, r0
	add r5, r8
	ldr r1, [r5]
	adds r0, r4, 0
	bl sub_8041664
	lsls r0, 24
	lsrs r0, 24
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80416A0

	thumb_func_start sub_80416E8
sub_80416E8: @ 8041A0C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_80416A0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r6, r0
	ldr r1, _08041A44
	adds r0, r6, 0
	bl pokemon_get_nick_
	ldr r0, _08041A48
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041A44: .4byte gStringVar1
_08041A48: .4byte gStringVar2
	thumb_func_end sub_80416E8

	thumb_func_start sub_8041728
sub_8041728: @ 8041A4C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_80416A0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r6, r0
	ldr r1, _08041A8C
	adds r0, r6, 0
	bl pokemon_get_nick_
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	adds r4, 0x64
	ldr r0, _08041A90
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041A8C: .4byte gStringVar1
_08041A90: .4byte gStringVar2
	thumb_func_end sub_8041728

	thumb_func_start sub_8041770
sub_8041770: @ 8041A94
	push {lr}
	ldr r0, _08041AA8
	ldr r1, _08041AAC
	ldrb r1, [r1]
	bl sub_8041728
	ldr r1, _08041AB0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08041AA8: .4byte 0x020286d0
_08041AAC: .4byte gSpecialVar_0x8004
_08041AB0: .4byte gSpecialVar_0x8005
	thumb_func_end sub_8041770

	thumb_func_start sub_8041790
sub_8041790: @ 8041AB4
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08041AD0
	ldr r1, _08041AD4
	adds r3, r2, r1
	ldr r1, [r3]
	adds r1, r0
	str r1, [r3]
	ldr r1, _08041AD8
	adds r2, r1
	ldr r1, [r2]
	adds r1, r0
	str r1, [r2]
	bx lr
	.align 2, 0
_08041AD0: .4byte gSaveBlock1
_08041AD4: .4byte 0x000030ac
_08041AD8: .4byte 0x000030b0
	thumb_func_end sub_8041790

	thumb_func_start sub_80417B8
sub_80417B8: @ 8041ADC
	push {r4,r5,lr}
	ldr r5, _08041AFC
	ldrh r1, [r5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	ldr r4, _08041B00
	adds r0, r4
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _08041B04
	movs r0, 0
	b _08041B10
	.align 2, 0
_08041AFC: .4byte gSpecialVar_0x8004
_08041B00: .4byte 0x020286d0
_08041B04:
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_80416E8
	lsls r0, 24
	lsrs r0, 24
_08041B10:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80417B8

	thumb_func_start sub_80417F4
sub_80417F4: @ 8041B18
	push {lr}
	movs r3, 0
	movs r2, 0x7
	adds r1, r0, 0
	adds r1, 0x2B
_08041B22:
	strb r3, [r1]
	subs r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _08041B22
	adds r2, r0, 0
	adds r2, 0x2C
	movs r3, 0
	adds r1, r0, 0
	adds r1, 0x36
_08041B36:
	strb r3, [r1]
	subs r1, 0x1
	cmp r1, r2
	bge _08041B36
	bl sub_80A2B40
	pop {r0}
	bx r0
	thumb_func_end sub_80417F4

	thumb_func_start unref_sub_8041824
unref_sub_8041824: @ 8041B48
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
_08041B4E:
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 4
	adds r0, r6, r0
	bl ZeroBoxMonData
	movs r1, 0x88
	lsls r1, 1
	adds r0, r6, r1
	adds r0, r4
	movs r4, 0
	str r4, [r0]
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 3
	adds r0, 0xA0
	adds r0, r6, r0
	bl sub_80417F4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _08041B4E
	movs r2, 0x8C
	lsls r2, 1
	adds r0, r6, r2
	movs r1, 0
	strh r4, [r0]
	adds r2, 0x2
	adds r0, r6, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8041824

	thumb_func_start sub_8041870
sub_8041870: @ 8041B94
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0
	mov r8, r0
	ldr r0, _08041BC0
	mov r12, r0
_08041BA6:
	movs r7, 0
	movs r6, 0x1
	movs r4, 0x80
	lsls r4, 9
	movs r5, 0x28
	mov r3, r12
	adds r3, 0x28
_08041BB4:
	movs r1, 0
	ldrh r0, [r3, 0x4]
	cmp r0, r2
	bne _08041BC4
	lsrs r2, r4, 16
	b _08041BF0
	.align 2, 0
_08041BC0: .4byte gEvolutionTable
_08041BC4:
	adds r1, 0x1
	cmp r1, 0x4
	bgt _08041BDA
	lsls r0, r1, 3
	adds r0, r5
	add r0, r12
	ldrh r0, [r0, 0x4]
	cmp r0, r2
	bne _08041BC4
	lsrs r2, r4, 16
	movs r7, 0x1
_08041BDA:
	cmp r7, 0
	bne _08041BF0
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x28
	adds r3, 0x28
	adds r6, 0x1
	ldr r0, _08041C10
	cmp r6, r0
	ble _08041BB4
_08041BF0:
	movs r0, 0xCE
	lsls r0, 1
	cmp r6, r0
	beq _08041C02
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x4
	ble _08041BA6
_08041C02:
	adds r0, r2, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041C10: .4byte 0x0000019b
	thumb_func_end sub_8041870

	thumb_func_start sub_80418F0
sub_80418F0: @ 8041C14
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08041C3C
	bl __umodsi3
	adds r0, 0x1
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	strh r0, [r4]
	movs r0, 0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041C3C: .4byte 0x0000fffe
	thumb_func_end sub_80418F0

	thumb_func_start sub_804191C
sub_804191C: @ 8041C40
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	movs r2, 0x8C
	lsls r2, 1
	adds r4, r2
	orrs r1, r0
	strh r1, [r4]
	movs r0, 0x86
	bl FlagSet
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804191C

	thumb_func_start sub_8041940
sub_8041940: @ 8041C64
	push {lr}
	ldr r0, _08041C70
	bl sub_80418F0
	pop {r0}
	bx r0
	.align 2, 0
_08041C70: .4byte 0x020286d0
	thumb_func_end sub_8041940

	thumb_func_start sub_8041950
sub_8041950: @ 8041C74
	push {lr}
	ldr r0, _08041C80
	bl sub_804191C
	pop {r0}
	bx r0
	.align 2, 0
_08041C80: .4byte 0x020286d0
	thumb_func_end sub_8041950

	thumb_func_start sub_8041960
sub_8041960: @ 8041C84
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	movs r2, 0
_08041C96:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x5
	ble _08041C96
	movs r3, 0
	movs r2, 0
_08041CAA:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08041CBC
	adds r0, r4, r3
	strb r1, [r0]
	adds r3, 0x1
_08041CBC:
	adds r2, 0x1
	cmp r2, 0x5
	ble _08041CAA
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8041960

	thumb_func_start sub_80419A8
sub_80419A8: @ 8041CCC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r9, r0
	mov r8, r1
	movs r5, 0
	add r1, sp, 0x4
	add r7, sp, 0xC
	adds r2, r1, 0
_08041CE2:
	adds r0, r2, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08041CE2
	movs r5, 0
	adds r6, r1, 0
_08041CF4:
	bl Random
	mov r1, sp
	adds r4, r1, r5
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	subs r1, r5
	bl __modsi3
	adds r0, r6, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl sub_8041960
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041CF4
	movs r5, 0
	movs r4, 0x1
_08041D24:
	bl Random
	adds r1, r7, r5
	lsls r0, 16
	lsrs r0, 16
	ands r0, r4
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041D24
	movs r5, 0
_08041D3E:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08041E26
	lsls r0, 2
	ldr r1, _08041D54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041D54: .4byte _08041D58
	.align 2, 0
_08041D58:
	.4byte _08041D70
	.4byte _08041D90
	.4byte _08041DAC
	.4byte _08041DC8
	.4byte _08041DE4
	.4byte _08041E06
_08041D70:
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x27
	bl GetBoxMonData
	add r2, sp, 0x10
	strb r0, [r2]
	mov r0, r9
	movs r1, 0x27
	bl SetMonData
	b _08041E26
_08041D90:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x28
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x28
	b _08041DFE
_08041DAC:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x29
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x29
	b _08041DFE
_08041DC8:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2A
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2A
	b _08041DFE
_08041DE4:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2B
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2B
_08041DFE:
	adds r2, r4, 0
	bl SetMonData
	b _08041E26
_08041E06:
	add r4, sp, 0x10
	adds r0, r7, r5
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	movs r1, 0x2C
	bl GetBoxMonData
	strb r0, [r4]
	mov r0, r9
	movs r1, 0x2C
	adds r2, r4, 0
	bl SetMonData
_08041E26:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08041D3E
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80419A8

	thumb_func_start pokemon_get_eggmoves
pokemon_get_eggmoves: @ 8041E40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r6, 0
	movs r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _08041E68
	ldrh r1, [r5]
	ldr r7, _08041E6C
	adds r0, r3, r7
	cmp r1, r0
	bne _08041E70
	movs r4, 0x1
	b _08041E92
	.align 2, 0
_08041E68: .4byte gEggMoves
_08041E6C: .4byte 0x00004e20
_08041E70:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08041EDC
	ldr r5, _08041EE0
	cmp r2, r0
	bhi _08041E92
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r7, _08041EE4
	adds r0, r3, r7
	cmp r1, r0
	bne _08041E70
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08041E92:
	movs r2, 0
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r1, _08041EE4
	cmp r0, r1
	bhi _08041ECE
	adds r7, r5, 0
	adds r3, r1, 0
_08041EA4:
	lsls r1, r2, 1
	add r1, r8
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bhi _08041ECE
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r3
	bls _08041EA4
_08041ECE:
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041EDC: .4byte 0x00000471
_08041EE0: .4byte gEggMoves
_08041EE4: .4byte 0x00004e20
	thumb_func_end pokemon_get_eggmoves

	thumb_func_start daycare_build_child_moveset
daycare_build_child_moveset: @ 8041EE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r7, r0, 0
	mov r10, r1
	mov r9, r2
	movs r0, 0
	str r0, [sp]
	movs r6, 0
	ldr r5, _08041FEC
	movs r2, 0
	ldr r4, _08041FF0
	ldr r3, _08041FF4
_08041F08:
	lsls r1, r6, 1
	adds r0, r1, r5
	strh r2, [r0]
	adds r0, r1, r4
	strh r2, [r0]
	adds r1, r3
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041F08
	movs r6, 0
	ldr r2, _08041FF8
	movs r1, 0
_08041F26:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _08041F26
	movs r6, 0
	ldr r2, _08041FFC
	movs r1, 0
_08041F3C:
	lsls r0, r6, 1
	adds r0, r2
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x31
	bls _08041F3C
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08041FFC
	bl sub_804051C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r6, 0
	ldr r1, _08041FF0
	mov r8, r1
_08041F6A:
	adds r5, r6, 0
	adds r5, 0xD
	mov r0, r10
	adds r1, r5, 0
	bl GetBoxMonData
	lsls r4, r6, 1
	mov r2, r8
	adds r1, r4, r2
	strh r0, [r1]
	mov r0, r9
	adds r1, r5, 0
	bl GetBoxMonData
	ldr r1, _08041FEC
	adds r4, r1
	strh r0, [r4]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08041F6A
	ldr r1, _08041FF8
	adds r0, r7, 0
	bl pokemon_get_eggmoves
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r6, 0
_08041FA6:
	ldr r0, _08041FF0
	lsls r1, r6, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	mov r9, r0
	cmp r1, 0
	beq _0804201C
	movs r5, 0
	cmp r5, r8
	bcs _0804200E
	adds r4, r2, 0
	ldr r2, _08042000
_08041FBE:
	ldr r0, _08041FF8
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08042004
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _0804200E
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _0804200E
	.align 2, 0
_08041FEC: .4byte gUnknown_03000500
_08041FF0: .4byte gUnknown_030004D8
_08041FF4: .4byte gUnknown_030004E0
_08041FF8: .4byte gUnknown_030004E8
_08041FFC: .4byte gUnknown_03000470
_08042000: .4byte 0x0000ffff
_08042004:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _08041FBE
_0804200E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _08042138
	mov r9, r3
	cmp r6, 0x3
	bls _08041FA6
_0804201C:
	movs r6, 0
_0804201E:
	lsls r0, r6, 1
	mov r2, r9
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	adds r6, 0x1
	mov r8, r6
	cmp r1, 0
	beq _08042080
	movs r5, 0
	ldr r0, _08042138
	adds r4, r2, r0
	ldr r6, _0804213C
	mov r9, r0
_0804203A:
	ldr r3, _08042140
	adds r0, r5, r3
	lsls r0, 16
	lsrs r0, 16
	bl ItemIdToBattleMoveId
	ldrh r1, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bne _08042076
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl CanMonLearnTMHM
	cmp r0, 0
	beq _08042076
	ldrh r1, [r4]
	adds r0, r7, 0
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r6
	bne _08042076
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
_08042076:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x39
	bls _0804203A
_08042080:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _0804201E
	movs r6, 0
	mov r2, r9
	ldrh r0, [r2]
	ldr r3, _08042144
	mov r10, r3
	cmp r0, 0
	beq _080420EA
	mov r4, r9
	ldr r0, _08042148
	mov r9, r0
	mov r12, r10
_080420A0:
	movs r5, 0
	lsls r2, r6, 1
	adds r6, 0x1
	mov r8, r6
	adds r3, r2, r4
_080420AA:
	lsls r0, r5, 1
	add r0, r9
	ldrh r2, [r3]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bne _080420CC
	cmp r1, 0
	beq _080420CC
	ldr r1, [sp]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 1
	add r1, r12
	strh r2, [r1]
_080420CC:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080420AA
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _080420EA
	lsls r0, r6, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _080420A0
_080420EA:
	movs r6, 0
	mov r2, r10
	ldrh r0, [r2]
	cmp r0, 0
	beq _08042174
_080420F4:
	movs r5, 0
	adds r3, r6, 0x1
	mov r8, r3
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcs _0804215C
	ldr r2, _0804213C
_08042102:
	ldr r1, _0804214C
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	beq _08042150
	lsls r0, r6, 1
	mov r3, r10
	adds r4, r0, r3
	ldrh r0, [r4]
	cmp r0, r1
	bne _08042150
	adds r1, r0, 0
	adds r0, r7, 0
	str r2, [sp, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp, 0x8]
	cmp r0, r2
	bne _0804215C
	ldrh r1, [r4]
	adds r0, r7, 0
	bl DeleteFirstMoveAndGiveMoveToMon
	b _0804215C
	.align 2, 0
_08042138: .4byte gUnknown_030004D8
_0804213C: .4byte 0x0000ffff
_08042140: .4byte 0x00000121
_08042144: .4byte gUnknown_030004E0
_08042148: .4byte gUnknown_03000500
_0804214C: .4byte gUnknown_03000470
_08042150:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [sp, 0x4]
	cmp r5, r0
	bcc _08042102
_0804215C:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bhi _08042174
	ldr r0, _08042184
	lsls r1, r6, 1
	adds r1, r0
	ldrh r1, [r1]
	mov r10, r0
	cmp r1, 0
	bne _080420F4
_08042174:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042184: .4byte gUnknown_030004E0
	thumb_func_end daycare_build_child_moveset

	thumb_func_start sub_8041E64
sub_8041E64: @ 8042188
	adds r3, r0, 0
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r3, r1
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r3, r1
	strb r2, [r0]
	bx lr
	thumb_func_end sub_8041E64

	thumb_func_start sub_8041E7C
sub_8041E7C: @ 80421A0
	push {lr}
	ldr r0, _080421AC
	bl sub_8041E64
	pop {r0}
	bx r0
	.align 2, 0
_080421AC: .4byte 0x020286d0
	thumb_func_end sub_8041E7C

	thumb_func_start incense_effects
incense_effects: @ 80421B0
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrh r1, [r4]
	movs r7, 0xB4
	lsls r7, 1
	cmp r1, r7
	beq _080421C8
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _0804220A
_080421C8:
	adds r0, r5, 0
	movs r1, 0xC
	bl GetBoxMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r0, 0x50
	movs r1, 0xC
	bl GetBoxMonData
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4]
	cmp r0, r7
	bne _080421F4
	cmp r6, 0xDD
	beq _080421F4
	cmp r2, 0xDD
	beq _080421F4
	movs r0, 0xCA
	strh r0, [r4]
_080421F4:
	ldrh r1, [r4]
	movs r0, 0xAF
	lsls r0, 1
	cmp r1, r0
	bne _0804220A
	cmp r6, 0xDC
	beq _0804220A
	cmp r2, 0xDC
	beq _0804220A
	movs r0, 0xB7
	strh r0, [r4]
_0804220A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end incense_effects

	thumb_func_start sub_8041EEC
sub_8041EEC: @ 8042210
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	movs r4, 0
	movs r7, 0x1
_08042220:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	mov r1, r8
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl GetBoxMonData
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x84
	bne _0804224A
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6]
	strb r4, [r6, 0x1]
	b _08042260
_0804224A:
	adds r0, r5, 0
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	bne _08042260
	strb r4, [r6]
	adds r0, r4, 0
	eors r0, r7
	strb r0, [r6, 0x1]
_08042260:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08042220
	ldrb r0, [r6]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	bl sub_8041870
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bne _08042292
	movs r0, 0x8C
	lsls r0, 1
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08042292
	movs r4, 0x20
_08042292:
	ldr r0, _080422E4
	cmp r4, r0
	bne _080422AC
	subs r0, 0x6B
	add r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080422AC
	movs r4, 0xC1
	lsls r4, 1
_080422AC:
	ldrb r0, [r6, 0x1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r0, 0x84
	bne _080422D6
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	add r0, r8
	bl GetBoxMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFE
	beq _080422D6
	ldrb r1, [r6, 0x1]
	ldrb r0, [r6]
	strb r0, [r6, 0x1]
	strb r1, [r6]
_080422D6:
	adds r0, r4, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080422E4: .4byte 0x00000183
	thumb_func_end sub_8041EEC

	thumb_func_start sub_8041FC4
sub_8041FC4: @ 80422E8
	push {r4-r6,lr}
	sub sp, 0x6C
	adds r5, r0, 0
	add r6, sp, 0x64
	adds r1, r6, 0
	bl sub_8041EEC
	add r4, sp, 0x68
	strh r0, [r4]
	adds r0, r4, 0
	adds r1, r5, 0
	bl incense_effects
	ldrh r1, [r4]
	mov r0, sp
	adds r2, r5, 0
	bl sub_80420FC
	mov r0, sp
	adds r1, r5, 0
	bl sub_80419A8
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 4
	adds r1, r5, r1
	ldrb r0, [r6]
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 4
	adds r2, r5, r2
	mov r0, sp
	bl daycare_build_child_moveset
	mov r2, sp
	adds r2, 0x6A
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl SetMonData
	ldr r0, _08042364
	movs r1, 0xFA
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	bl party_compaction
	bl CalculatePlayerPartyCount
	adds r0, r5, 0
	bl sub_8041E64
	add sp, 0x6C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042364: .4byte gPlayerParty
	thumb_func_end sub_8041FC4

	thumb_func_start sub_8042044
sub_8042044: @ 8042368
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r7, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r0, 0x12
	add r0, sp
	mov r8, r0
	strb r4, [r0]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	movs r0, 0x1
	mov r9, r0
	mov r0, r9
	strb r0, [r4]
	adds r0, r7, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl SetMonData
	ldr r2, _08042418
	adds r0, r7, 0
	movs r1, 0x2
	bl SetMonData
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _0804241C
	adds r2, r0
	adds r0, r7, 0
	movs r1, 0x20
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x24
	mov r2, r8
	bl SetMonData
	adds r0, r7, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl SetMonData
	cmp r6, 0
	beq _080423FA
	add r2, sp, 0x14
	movs r0, 0xFD
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x23
	bl SetMonData
_080423FA:
	mov r2, sp
	adds r2, 0x15
	mov r0, r9
	strb r0, [r2]
	adds r0, r7, 0
	movs r1, 0x2D
	bl SetMonData
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042418: .4byte gUnknown_08209AD4
_0804241C: .4byte 0x0820bbf9
	thumb_func_end sub_8042044

	thumb_func_start sub_80420FC
sub_80420FC: @ 8042420
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	bl Random
	movs r1, 0x8C
	lsls r1, 1
	adds r4, r1
	ldrh r1, [r4]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x1
	mov r8, r0
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x5
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x12
	add r1, sp
	mov r9, r1
	strb r4, [r1]
	movs r1, 0x4
	add r0, sp, 0x10
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x13
	mov r0, r8
	strb r0, [r4]
	adds r0, r6, 0
	movs r1, 0x26
	add r2, sp, 0x10
	bl SetMonData
	ldr r2, _080424BC
	adds r0, r6, 0
	movs r1, 0x2
	bl SetMonData
	lsls r2, r5, 3
	subs r2, r5
	lsls r2, 2
	ldr r0, _080424C0
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x20
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x24
	mov r2, r9
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl SetMonData
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080424BC: .4byte gUnknown_08209AD4
_080424C0: .4byte 0x0820bbf9
	thumb_func_end sub_80420FC

	thumb_func_start sp0B8_daycare
sp0B8_daycare: @ 80424C4
	push {lr}
	ldr r0, _080424D0
	bl sub_8041FC4
	pop {r0}
	bx r0
	.align 2, 0
_080424D0: .4byte 0x020286d0
	thumb_func_end sp0B8_daycare

	thumb_func_start sub_80421B0
sub_80421B0: @ 80424D4
	push {r4-r7,lr}
	sub sp, 0x8
	adds r7, r0, 0
	movs r2, 0
	movs r6, 0
	adds r5, r7, 0
_080424E0:
	lsls r4, r6, 2
	adds r0, r5, 0
	movs r1, 0x5
	str r2, [sp, 0x4]
	bl GetBoxMonData
	ldr r2, [sp, 0x4]
	cmp r0, 0
	beq _08042502
	movs r0, 0x88
	lsls r0, 1
	adds r1, r7, r0
	adds r1, r4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	adds r2, 0x1
_08042502:
	adds r5, 0x50
	adds r6, 0x1
	cmp r6, 0x1
	bls _080424E0
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _0804254A
	cmp r2, 0x2
	bne _0804254A
	subs r1, 0x4
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _0804254A
	adds r0, r7, 0
	bl daycare_relationship_score
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08042564
	bl __udivsi3
	cmp r4, r0
	bls _0804254A
	bl sub_8041940
_0804254A:
	movs r0, 0x8D
	lsls r0, 1
	adds r1, r7, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080425B4
	movs r6, 0
	b _080425AC
	.align 2, 0
_08042564: .4byte 0x0000ffff
_08042568:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08042594
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _080425AA
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	bne _0804259C
	ldr r0, _08042598
	strh r6, [r0]
	movs r0, 0x1
	b _080425B6
	.align 2, 0
_08042594: .4byte gPlayerParty
_08042598: .4byte gSpecialVar_0x8004
_0804259C:
	subs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_080425AA:
	adds r6, 0x1
_080425AC:
	ldr r0, _080425C0
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08042568
_080425B4:
	movs r0, 0
_080425B6:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080425C0: .4byte gPlayerPartyCount
	thumb_func_end sub_80421B0

	thumb_func_start sub_80422A0
sub_80422A0: @ 80425C4
	push {lr}
	ldr r0, _080425D4
	bl sub_80421B0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080425D4: .4byte 0x020286d0
	thumb_func_end sub_80422A0

	thumb_func_start sub_80422B4
sub_80422B4: @ 80425D8
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	thumb_func_end sub_80422B4

	thumb_func_start sub_80422C4
sub_80422C4: @ 80425E8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08042620
	ldr r1, _08042640
	adds r0, r6, 0
	bl pokemon_get_nick_
	adds r0, r6, 0
	movs r1, 0x3
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08042644
	adds r0, r6, 0
	movs r1, 0x7
	adds r2, r5, 0
	bl GetBoxMonData
	adds r0, r5, 0
	adds r1, r4, 0
	bl ConvertInternationalString
_08042620:
	adds r4, r6, 0
	adds r4, 0x50
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08042638
	ldr r1, _08042648
	adds r0, r4, 0
	bl pokemon_get_nick_
_08042638:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042640: .4byte gStringVar1
_08042644: .4byte gStringVar3
_08042648: .4byte gStringVar2
	thumb_func_end sub_80422C4

	thumb_func_start sub_8042328
sub_8042328: @ 804264C
	push {r4-r6,lr}
	ldr r6, _08042678
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0804267C
	adds r0, r4
	ldr r1, _08042680
	bl pokemon_get_nick_
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08042678: .4byte gUnknown_03005CE0
_0804267C: .4byte gPlayerParty
_08042680: .4byte gStringVar1
	thumb_func_end sub_8042328

	thumb_func_start sp0B5_daycare
sp0B5_daycare: @ 8042684
	push {lr}
	ldr r0, _08042690
	bl sub_80422C4
	pop {r0}
	bx r0
	.align 2, 0
_08042690: .4byte 0x020286d0
	thumb_func_end sp0B5_daycare

	thumb_func_start sp0B6_daycare
sp0B6_daycare: @ 8042694
	push {r4,lr}
	ldr r4, _080426A8
	adds r0, r4, 0
	bl sub_80422B4
	lsls r0, 24
	cmp r0, 0
	beq _080426AC
	movs r0, 0x1
	b _080426C4
	.align 2, 0
_080426A8: .4byte 0x020286d0
_080426AC:
	adds r0, r4, 0
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080426BE
	movs r0, 0
	b _080426C4
_080426BE:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080426C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sp0B6_daycare

	thumb_func_start sub_80423A8
sub_80423A8: @ 80426CC
	push {r4-r6,lr}
	adds r5, r1, 0
	movs r4, 0
	adds r1, r0, 0
_080426D4:
	movs r3, 0
	ldrh r0, [r1]
	adds r2, r5, 0
_080426DA:
	ldrh r6, [r2]
	cmp r0, r6
	bne _080426E4
	movs r0, 0x1
	b _080426F6
_080426E4:
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x1
	ble _080426DA
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x1
	ble _080426D4
	movs r0, 0
_080426F6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80423A8

	thumb_func_start daycare_relationship_score
daycare_relationship_score: @ 80426FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	movs r1, 0
	mov r8, r1
	mov r2, sp
	adds r2, 0x8
	str r2, [sp, 0x1C]
	add r1, sp, 0xC
	mov r10, r1
	adds r2, 0xC
	str r2, [sp, 0x20]
	mov r1, sp
	adds r1, 0x2
	ldr r2, _080427AC
	mov r9, r2
	ldr r5, [sp, 0x1C]
	adds r7, r1, 0
	mov r6, sp
	ldr r1, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r2, r10
	str r2, [sp, 0x28]
	adds r4, r0, 0
_08042732:
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBoxMonData
	ldr r1, [sp, 0x28]
	stm r1!, {r0}
	str r1, [sp, 0x28]
	adds r0, r4, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	ldrh r0, [r5]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x24]
	stm r2!, {r0}
	str r2, [sp, 0x24]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x14]
	strh r0, [r6]
	ldrh r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x15]
	strh r0, [r7]
	adds r5, 0x2
	adds r7, 0x4
	adds r6, 0x4
	adds r4, 0x50
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x1
	bls _08042732
	mov r0, sp
	ldrh r1, [r0]
	cmp r1, 0xF
	beq _080427A8
	ldrh r0, [r0, 0x4]
	cmp r0, 0xF
	beq _080427A8
	cmp r1, 0xD
	bne _080427B0
	cmp r0, 0xD
	bne _080427B4
_080427A8:
	movs r0, 0
	b _08042808
	.align 2, 0
_080427AC: .4byte gBaseStats
_080427B0:
	cmp r0, 0xD
	bne _080427C0
_080427B4:
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _08042802
	b _08042806
_080427C0:
	ldr r0, [sp, 0x14]
	ldr r2, [sp, 0x20]
	ldr r1, [r2, 0x4]
	cmp r0, r1
	beq _080427A8
	cmp r0, 0xFF
	beq _080427A8
	cmp r1, 0xFF
	beq _080427A8
	add r1, sp, 0x4
	mov r0, sp
	bl sub_80423A8
	lsls r0, 24
	cmp r0, 0
	beq _080427A8
	ldr r0, [sp, 0x1C]
	ldrh r1, [r0, 0x2]
	ldrh r0, [r0]
	cmp r0, r1
	bne _080427F8
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	beq _08042806
	movs r0, 0x46
	b _08042808
_080427F8:
	ldr r1, [sp, 0xC]
	mov r2, r10
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bne _08042806
_08042802:
	movs r0, 0x14
	b _08042808
_08042806:
	movs r0, 0x32
_08042808:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end daycare_relationship_score

	thumb_func_start daycare_relationship_score_from_savegame
daycare_relationship_score_from_savegame: @ 8042818
	push {lr}
	ldr r0, _08042828
	bl daycare_relationship_score
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08042828: .4byte 0x020286d0
	thumb_func_end daycare_relationship_score_from_savegame

	thumb_func_start sp0B9_daycare_relationship_comment
sp0B9_daycare_relationship_comment: @ 804282C
	push {lr}
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	movs r1, 0
	cmp r0, 0
	bne _08042840
	movs r1, 0x3
_08042840:
	cmp r0, 0x14
	bne _08042846
	movs r1, 0x2
_08042846:
	cmp r0, 0x32
	bne _0804284C
	movs r1, 0x1
_0804284C:
	cmp r2, 0x46
	bne _08042852
	movs r1, 0
_08042852:
	ldr r0, _08042864
	ldr r2, _08042868
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_08042864: .4byte gStringVar4
_08042868: .4byte gUnknown_08209AC4
	thumb_func_end sp0B9_daycare_relationship_comment

	thumb_func_start NameHasGenderSymbol
NameHasGenderSymbol: @ 804286C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r2, sp
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r2]
	movs r3, 0
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080428B0
_08042888:
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, 0xB5
	bne _08042896
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08042896:
	ldrb r0, [r1]
	cmp r0, 0xB6
	bne _080428A2
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	strb r0, [r2, 0x1]
_080428A2:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08042888
_080428B0:
	cmp r5, 0
	bne _080428C4
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	beq _080428C4
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080428D8
_080428C4:
	cmp r5, 0xFE
	bne _080428DC
	mov r0, sp
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080428DC
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _080428DC
_080428D8:
	movs r0, 0x1
	b _080428DE
_080428DC:
	movs r0, 0
_080428DE:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end NameHasGenderSymbol

	thumb_func_start AppendGenderSymbol
AppendGenderSymbol: @ 80428E8
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _08042908
	movs r1, 0
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08042924
	ldr r1, _08042904
	b _08042926
	.align 2, 0
_08042904: .4byte gOtherText_MaleSymbol3
_08042908:
	cmp r1, 0xFE
	bne _08042924
	adds r0, r4, 0
	movs r1, 0xFE
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _08042924
	ldr r1, _08042920
	b _08042926
	.align 2, 0
_08042920: .4byte gOtherText_FemaleSymbol3
_08042924:
	ldr r1, _08042934
_08042926:
	adds r0, r4, 0
	bl StringAppend
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08042934: .4byte gOtherText_GenderlessSymbol
	thumb_func_end AppendGenderSymbol

	thumb_func_start MonAppendGenderSymbol
MonAppendGenderSymbol: @ 8042938
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	bl GetBoxMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AppendGenderSymbol
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonAppendGenderSymbol

	thumb_func_start DaycareLevelMenuGetText
DaycareLevelMenuGetText: @ 8042954
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x28
	mov r8, r0
	adds r7, r1, 0
	movs r0, 0xFF
	strb r0, [r7]
	movs r6, 0
	add r0, sp, 0x14
	mov r9, r0
_0804296C:
	lsls r0, r6, 2
	adds r0, r6
	lsls r4, r0, 4
	add r4, r8
	lsls r0, 2
	mov r1, sp
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl pokemon_get_nick_
	adds r0, r5, 0
	adds r1, r4, 0
	bl MonAppendGenderSymbol
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _0804296C
	adds r0, r7, 0
	mov r1, sp
	bl StringCopy
	ldr r4, _080429CC
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	adds r0, r7, 0
	mov r1, r9
	bl StringAppend
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringAppend
	ldr r1, _080429D0
	adds r0, r7, 0
	bl StringAppend
	add sp, 0x28
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080429CC: .4byte gOtherText_NewLine2
_080429D0: .4byte gOtherText_CancelAndLv
	thumb_func_end DaycareLevelMenuGetText

	thumb_func_start DaycareLevelMenuGetLevelText
DaycareLevelMenuGetLevelText: @ 80429D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r5, 0
	movs r0, 0xFC
	mov r8, r0
	movs r7, 0x14
_080429EA:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 4
	adds r0, r6, r0
	movs r3, 0x88
	lsls r3, 1
	adds r1, r6, r3
	adds r1, r2
	ldr r1, [r1]
	bl sub_8041664
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x34
	strb r0, [r4]
	mov r0, r8
	strb r0, [r4, 0x1]
	strb r7, [r4, 0x2]
	movs r0, 0x6
	strb r0, [r4, 0x3]
	adds r0, r4, 0x4
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, r0, 0
	mov r3, r8
	strb r3, [r4]
	strb r7, [r4, 0x1]
	movs r0, 0
	strb r0, [r4, 0x2]
	adds r0, r4, 0x3
	ldr r1, _08042A4C
	bl StringCopy
	adds r4, r0, 0
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _080429EA
	movs r0, 0xFF
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042A4C: .4byte gOtherText_NewLine2
	thumb_func_end DaycareLevelMenuGetLevelText

	thumb_func_start DaycareLevelMenuProcessKeyInput
DaycareLevelMenuProcessKeyInput: @ 8042A50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08042A84
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08042A8C
	ldr r0, _08042A88
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08042B3A
	subs r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	negs r0, r0
	b _08042AAE
	.align 2, 0
_08042A84: .4byte gMain
_08042A88: .4byte gTasks
_08042A8C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08042AC0
	ldr r0, _08042ABC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	beq _08042B3A
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
_08042AAE:
	bl MoveMenuCursor
	movs r0, 0x5
	bl PlaySE
	b _08042B3A
	.align 2, 0
_08042ABC: .4byte gTasks
_08042AC0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08042B0C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r3, _08042B00
	ldr r2, _08042B04
	ldr r1, _08042B08
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	strh r0, [r2]
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
	b _08042B3A
	.align 2, 0
_08042B00: .4byte gUnknown_03005CE0
_08042B04: .4byte gScriptResult
_08042B08: .4byte gTasks
_08042B0C:
	movs r4, 0x2
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08042B3A
	bl sub_8072DEC
	ldr r0, _08042B40
	ldr r1, _08042B44
	strh r4, [r1]
	movs r1, 0x2
	strb r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl EnableBothScriptContexts
_08042B3A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042B40: .4byte gUnknown_03005CE0
_08042B44: .4byte gScriptResult
	thumb_func_end DaycareLevelMenuProcessKeyInput

	thumb_func_start ShowDaycareLevelMenu
ShowDaycareLevelMenu: @ 8042B48
	push {r4,lr}
	sub sp, 0x6C
	movs r0, 0xF
	movs r1, 0x6
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r4, _08042BA4
	adds r0, r4, 0
	add r1, sp, 0x8
	bl DaycareLevelMenuGetText
	add r0, sp, 0x8
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	adds r0, r4, 0
	add r1, sp, 0x8
	bl DaycareLevelMenuGetLevelText
	add r0, sp, 0x8
	movs r1, 0xCE
	movs r2, 0x38
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	movs r0, 0
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x7
	movs r3, 0x3
	bl InitMenu
	ldr r0, _08042BA8
	movs r1, 0x3
	bl CreateTask
	add sp, 0x6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042BA4: .4byte 0x020286d0
_08042BA8: .4byte DaycareLevelMenuProcessKeyInput
	thumb_func_end ShowDaycareLevelMenu

	thumb_func_start ChooseSendDaycareMon
ChooseSendDaycareMon: @ 8042BAC
	push {lr}
	movs r0, 0x6
	movs r1, 0
	bl OpenPartyMenu
	ldr r1, _08042BC0
	ldr r0, _08042BC4
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08042BC0: .4byte gMain
_08042BC4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end ChooseSendDaycareMon

	.align 2, 0 @ Don't pad with nop.
