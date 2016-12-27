	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8120AA8
sub_8120AA8: @ 8120E9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	ldr r5, _08120F64
	ldr r4, _08120F68
	ldrb r1, [r4]
	lsls r1, 9
	ldr r0, _08120F6C
	adds r1, r0
	str r1, [r5]
	ldr r2, _08120F70
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	ldr r2, _08120F74
	ldrb r0, [r1, 0x6]
	strb r0, [r2]
	ldr r3, _08120F78
	ldrb r0, [r1, 0x7]
	mov r8, r0
	ldr r2, _08120F7C
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldrb r0, [r1, 0x8]
	mov r8, r0
	ldr r2, _08120F80
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldrb r0, [r1, 0x9]
	mov r8, r0
	ldr r2, _08120F84
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	ldr r2, _08120F88
	ldrb r0, [r1, 0xA]
	strb r0, [r2]
	ldrb r1, [r1, 0xB]
	ldr r2, _08120F8C
	adds r0, r3, r2
	strb r1, [r0]
	movs r2, 0
	mov r9, r3
	ldr r3, _08120F90
	mov r10, r3
	ldr r3, _08120F94
_08120F04:
	adds r0, r2, r3
	ldr r1, [r5]
	adds r1, 0xC
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08120F04
	movs r2, 0
	ldr r0, _08120F90
	mov r8, r0
	ldr r3, _08120F64
	ldr r1, _08120F98
	mov r12, r1
	ldr r5, _08120F9C
_08120F24:
	mov r0, r8
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x10
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	mov r0, r12
	adds r1, r2, r0
	ldr r0, [r3]
	adds r0, 0x20
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r5
	ldr r0, [r3]
	adds r0, 0x30
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, 0xF
	ble _08120F24
	cmp r7, 0x5
	bls _08120F58
	b _0812136C
_08120F58:
	lsls r0, r7, 2
	ldr r1, _08120FA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08120F64: .4byte gUnknown_02039270
_08120F68: .4byte gUnknown_02024A60
_08120F6C: .4byte gUnknown_02023A64
_08120F70: .4byte gUnknown_02024C04
_08120F74: .4byte byte_2024C06
_08120F78: .4byte 0x02000000
_08120F7C: .4byte 0x00016003
_08120F80: .4byte 0x0001605e
_08120F84: .4byte 0x000160c1
_08120F88: .4byte gUnknown_02024C0B
_08120F8C: .4byte 0x000160a0
_08120F90: .4byte gUnknown_030041C0
_08120F94: .4byte gUnknown_0203926C
_08120F98: .4byte gUnknown_03004290
_08120F9C: .4byte gUnknown_030042B0
_08120FA0: .4byte _08120FA4
	.align 2, 0
_08120FA4:
	.4byte _08120FBC
	.4byte _0812103C
	.4byte _081210D8
	.4byte _08121170
	.4byte _08121204
	.4byte _0812126C
_08120FBC:
	ldr r0, _08120FE0
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08120FFC
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08120FEC
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08120FE4
	cmp r0, 0
	bne _08120FDC
	b _08121396
_08120FDC:
	ldr r6, _08120FE8
	b _08121396
	.align 2, 0
_08120FE0: .4byte gUnknown_020239F8
_08120FE4: .4byte gUnknown_084005C7
_08120FE8: .4byte gUnknown_084005DB
_08120FEC:
	ldr r6, _08120FF4
	ldr r0, _08120FF8
	b _0812138E
	.align 2, 0
_08120FF4: .4byte gUnknown_084005AA
_08120FF8: .4byte 0x0000ffff
_08120FFC:
	movs r0, 0x80
	lsls r0, 6
	ands r0, r1
	cmp r0, 0
	beq _08121010
	ldr r6, _0812100C
	b _08121396
	.align 2, 0
_0812100C: .4byte gUnknown_08400568
_08121010:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08121020
	ldr r6, _0812101C
	b _08121396
	.align 2, 0
_0812101C: .4byte gUnknown_08400590
_08121020:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	ldr r6, _08121034
	cmp r0, 0
	bne _0812102E
	b _08121396
_0812102E:
	ldr r6, _08121038
	b _08121396
	.align 2, 0
_08121034: .4byte gUnknown_08400555
_08121038: .4byte gUnknown_0840057B
_0812103C:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121078
	ldr r0, _08121064
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08121070
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08121068
	cmp r0, 0
	bne _08121060
	b _08121396
_08121060:
	ldr r6, _0812106C
	b _08121396
	.align 2, 0
_08121064: .4byte gUnknown_020239F8
_08121068: .4byte gUnknown_084006A4
_0812106C: .4byte gUnknown_084006F1
_08121070:
	ldr r6, _08121074
	b _08121396
	.align 2, 0
_08121074: .4byte gUnknown_0840069C
_08121078:
	ldr r0, _08121090
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081210B8
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08121098
	ldr r6, _08121094
	b _08121396
	.align 2, 0
_08121090: .4byte gUnknown_020239F8
_08121094: .4byte gUnknown_0840065C
_08121098:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _081210AC
	cmp r0, 0
	beq _081210A4
	b _08121396
_081210A4:
	ldr r6, _081210B0
	ldr r0, _081210B4
	b _0812138E
	.align 2, 0
_081210AC: .4byte gUnknown_08400645
_081210B0: .4byte gUnknown_08400608
_081210B4: .4byte 0x0000ffff
_081210B8:
	movs r0, 0x2
	ands r0, r1
	ldr r6, _081210CC
	cmp r0, 0
	beq _081210C4
	b _08121396
_081210C4:
	ldr r6, _081210D0
	ldr r0, _081210D4
	b _0812138E
	.align 2, 0
_081210CC: .4byte gUnknown_08400635
_081210D0: .4byte gUnknown_084005F5
_081210D4: .4byte 0x0000ffff
_081210D8:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121130
	ldr r0, _081210F4
	ldr r1, _081210F8
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _08121100
	ldr r6, _081210FC
	b _08121396
	.align 2, 0
_081210F4: .4byte 0x02000000
_081210F8: .4byte 0x000160c1
_081210FC: .4byte gUnknown_08400709
_08121100:
	cmp r2, 0x1
	beq _08121110
	ldr r0, _08121114
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812111C
_08121110:
	ldr r6, _08121118
	b _08121396
	.align 2, 0
_08121114: .4byte gUnknown_020239F8
_08121118: .4byte gUnknown_08400727
_0812111C:
	ldr r6, _08121128
	cmp r2, 0x2
	beq _08121124
	b _08121396
_08121124:
	ldr r6, _0812112C
	b _08121396
	.align 2, 0
_08121128: .4byte gUnknown_08400749
_0812112C: .4byte gUnknown_08400736
_08121130:
	ldr r0, _08121150
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 4
	cmp r1, r0
	bne _08121160
	ldr r0, _08121154
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	ldr r6, _08121158
	cmp r0, 0
	bne _0812114C
	b _08121396
_0812114C:
	ldr r6, _0812115C
	b _08121396
	.align 2, 0
_08121150: .4byte gTrainerBattleOpponent
_08121154: .4byte gUnknown_020239F8
_08121158: .4byte gUnknown_08400771
_0812115C: .4byte gUnknown_08400781
_08121160:
	ldr r6, _08121168
	ldr r0, _0812116C
	b _0812138E
	.align 2, 0
_08121168: .4byte gUnknown_0840075E
_0812116C: .4byte 0x0000ffff
_08121170:
	ldr r0, _0812119C
	add r0, r9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _081211CC
	ldr r0, _081211A0
	add r0, r9
	ldrb r3, [r0]
	cmp r3, 0
	beq _08121196
	ldr r0, _081211A4
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081211AC
_08121196:
	ldr r6, _081211A8
	b _08121396
	.align 2, 0
_0812119C: .4byte 0x00016003
_081211A0: .4byte 0x000160c1
_081211A4: .4byte gUnknown_020239F8
_081211A8: .4byte gUnknown_084006B3
_081211AC:
	cmp r3, 0x1
	bne _081211B8
	ldr r6, _081211B4
	b _08121396
	.align 2, 0
_081211B4: .4byte gUnknown_084006BB
_081211B8:
	ldr r6, _081211C4
	cmp r3, 0x2
	beq _081211C0
	b _08121396
_081211C0:
	ldr r6, _081211C8
	b _08121396
	.align 2, 0
_081211C4: .4byte gUnknown_084006D5
_081211C8: .4byte gUnknown_084006C6
_081211CC:
	ldr r0, _081211E8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081211F4
	movs r0, 0x40
	ands r0, r1
	ldr r6, _081211EC
	cmp r0, 0
	bne _081211E4
	b _08121396
_081211E4:
	ldr r6, _081211F0
	b _08121396
	.align 2, 0
_081211E8: .4byte gUnknown_020239F8
_081211EC: .4byte gUnknown_0840067C
_081211F0: .4byte gUnknown_0840068C
_081211F4:
	ldr r6, _081211FC
	ldr r0, _08121200
	b _0812138E
	.align 2, 0
_081211FC: .4byte gUnknown_08400622
_08121200: .4byte 0x0000ffff
_08121204:
	mov r0, r10
	bl sub_8121D1C
	ldr r0, _08121230
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _08121244
	ldr r0, _08121234
	ldr r2, _08121238
	ldr r1, _0812123C
	ldr r3, _08121240
	adds r1, r3
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	b _08121254
	.align 2, 0
_08121230: .4byte gUnknown_02039270
_08121234: .4byte gUnknown_03004290
_08121238: .4byte gUnknown_08401674
_0812123C: .4byte 0x02000000
_08121240: .4byte 0x000160a0
_08121244:
	ldr r0, _08121260
	ldrh r2, [r2]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08121264
	adds r1, r2
	bl StringCopy
_08121254:
	ldr r0, _08121260
	bl sub_8121D74
	ldr r6, _08121268
	b _08121396
	.align 2, 0
_08121260: .4byte gUnknown_03004290
_08121264: .4byte gMoveNames
_08121268: .4byte gUnknown_084007BD
_0812126C:
	ldr r5, _081212AC
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081212D4
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08121298
	ldrb r1, [r5]
	cmp r1, 0x3
	beq _08121298
	movs r0, 0x3
	eors r0, r1
	strb r0, [r5]
_08121298:
	ldr r0, _081212AC
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _081212B4
	ldr r6, _081212B0
	b _08121396
	.align 2, 0
_081212AC: .4byte gUnknown_030041C0
_081212B0: .4byte gUnknown_083FFEFC
_081212B4:
	ldr r0, _081212C8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	ldr r6, _081212CC
	cmp r0, 0
	beq _08121396
	ldr r6, _081212D0
	b _08121396
	.align 2, 0
_081212C8: .4byte gUnknown_020239F8
_081212CC: .4byte gUnknown_083FFFEA
_081212D0: .4byte gUnknown_083FFFF7
_081212D4:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081212EE
	ldrb r1, [r5]
	cmp r1, 0x3
	beq _081212EE
	movs r0, 0x3
	eors r0, r1
	strb r0, [r5]
_081212EE:
	ldr r0, _0812130C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08121334
	ldr r0, _08121310
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08121324
	cmp r0, 0x2
	bgt _08121314
	cmp r0, 0x1
	beq _0812131A
	b _08121396
	.align 2, 0
_0812130C: .4byte gUnknown_020239F8
_08121310: .4byte gUnknown_030041C0
_08121314:
	cmp r0, 0x3
	beq _0812132C
	b _08121396
_0812131A:
	ldr r6, _08121320
	b _08121396
	.align 2, 0
_08121320: .4byte gUnknown_083FFF6A
_08121324:
	ldr r6, _08121328
	b _08121396
	.align 2, 0
_08121328: .4byte gUnknown_083FFF99
_0812132C:
	ldr r6, _08121330
	b _08121396
	.align 2, 0
_08121330: .4byte gUnknown_083FFFCB
_08121334:
	ldr r0, _08121348
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0812135C
	cmp r0, 0x2
	bgt _0812134C
	cmp r0, 0x1
	beq _08121352
	b _08121396
	.align 2, 0
_08121348: .4byte gUnknown_030041C0
_0812134C:
	cmp r0, 0x3
	beq _08121364
	b _08121396
_08121352:
	ldr r6, _08121358
	b _08121396
	.align 2, 0
_08121358: .4byte gUnknown_083FFF56
_0812135C:
	ldr r6, _08121360
	b _08121396
	.align 2, 0
_08121360: .4byte gUnknown_083FFF81
_08121364:
	ldr r6, _08121368
	b _08121396
	.align 2, 0
_08121368: .4byte gUnknown_083FFFB3
_0812136C:
	movs r0, 0xB5
	lsls r0, 1
	cmp r7, r0
	bls _08121380
	ldr r1, _0812137C
	movs r0, 0xFF
	strb r0, [r1]
	b _0812139C
	.align 2, 0
_0812137C: .4byte gUnknown_020238CC
_08121380:
	ldr r1, _081213AC
	adds r0, r7, 0
	subs r0, 0xC
	lsls r0, 2
	adds r0, r1
	ldr r6, [r0]
	adds r0, r7, 0
_0812138E:
	adds r1, r6, 0
	bl de_sub_804110C
	adds r6, r0, 0
_08121396:
	adds r0, r6, 0
	bl get_battle_strings_
_0812139C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081213AC: .4byte gUnknown_08400F8C
	thumb_func_end sub_8120AA8

	thumb_func_start get_battle_strings_
get_battle_strings_: @ 81213B0
	push {lr}
	ldr r1, _081213BC
	bl sub_8120FFC
	pop {r1}
	bx r1
	.align 2, 0
_081213BC: .4byte gUnknown_020238CC
	thumb_func_end get_battle_strings_

	thumb_func_start sub_8120F98
sub_8120F98: @ 81213C0
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _081213D8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	mov r2, sp
	movs r3, 0
	b _081213E8
	.align 2, 0
_081213D8: .4byte gUnknown_084017A8
_081213DC:
	strb r1, [r2]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x7
	bhi _081213F0
_081213E8:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081213DC
_081213F0:
	ldr r5, [sp]
	ldr r4, [sp, 0x4]
	movs r3, 0
	ldr r2, _0812140C
_081213F8:
	ldr r1, [r2]
	ldr r0, [r1]
	cmp r5, r0
	bne _08121410
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bne _08121410
	ldr r0, [r2, 0x4]
	b _0812141A
	.align 2, 0
_0812140C: .4byte gUnknown_081FA6D4
_08121410:
	adds r2, 0x8
	adds r3, 0x1
	cmp r3, 0x6
	bls _081213F8
	movs r0, 0
_0812141A:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8120F98

	thumb_func_start sub_8120FFC
sub_8120FFC: @ 8121424
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	mov r9, r0
	mov r8, r1
	movs r6, 0
	movs r4, 0
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	ldrb r1, [r0]
	bl _08121DA4
_08121446:
	cmp r1, 0xFD
	beq _0812144E
	bl _08121D94
_0812144E:
	movs r1, 0x1
	add r9, r1
	mov r2, r9
	ldrb r0, [r2]
	cmp r0, 0x2A
	bls _0812145E
	bl _08121D46
_0812145E:
	lsls r0, 2
	ldr r1, _08121468
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121468: .4byte _0812146C
	.align 2, 0
_0812146C:
	.4byte _08121518
	.4byte _08121546
	.4byte _08121582
	.4byte _08121598
	.4byte _081215B8
	.4byte _081215D0
	.4byte _081215F0
	.4byte _08121610
	.4byte _0812163C
	.4byte _08121660
	.4byte _0812168C
	.4byte _08121710
	.4byte _0812177C
	.4byte _081217E0
	.4byte _08121844
	.4byte _081218A8
	.4byte _0812190C
	.4byte _08121978
	.4byte _081219A0
	.4byte _081219E0
	.4byte _08121A6C
	.4byte _08121A74
	.4byte _08121A84
	.4byte _08121A94
	.4byte _08121AAC
	.4byte _08121ACC
	.4byte _08121B1E
	.4byte _08121B90
	.4byte _08121BA0
	.4byte _08121BB4
	.4byte _08121BC8
	.4byte _08121BEC
	.4byte _08121C10
	.4byte _08121C18
	.4byte _08121C20
	.4byte _08121CBC
	.4byte _08121D04
	.4byte _08121D0C
	.4byte _08121CDC
	.4byte _08121CE4
	.4byte _08121D2C
	.4byte _08121D34
	.4byte _0812155C
_08121518:
	ldr r5, _08121528
	ldrb r0, [r5]
	cmp r0, 0xFD
	bne _08121530
	ldr r4, _0812152C
	adds r0, r5, 0
	b _08121568
	.align 2, 0
_08121528: .4byte gUnknown_030041C0
_0812152C: .4byte gStringVar1
_08121530:
	adds r0, r5, 0
	bl sub_8120F98
	adds r4, r0, 0
	cmp r4, 0
	beq _08121540
	bl _08121D46
_08121540:
	adds r4, r5, 0
	bl _08121D46
_08121546:
	ldr r1, _08121554
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _0812157C
	ldr r4, _08121558
	b _08121566
	.align 2, 0
_08121554: .4byte gUnknown_03004290
_08121558: .4byte gStringVar2
_0812155C:
	ldr r1, _08121574
	ldrb r0, [r1]
	cmp r0, 0xFD
	bne _0812157C
	ldr r4, _08121578
_08121566:
	adds r0, r1, 0
_08121568:
	adds r1, r4, 0
	bl _08121DCC
	bl _08121D46
	.align 2, 0
_08121574: .4byte gUnknown_030042B0
_08121578: .4byte gStringVar3
_0812157C:
	adds r4, r1, 0
	bl _08121D46
_08121582:
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08121594
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_08121594: .4byte gUnknown_02024A6A
_08121598:
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _081215B0
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081215B4
	b _08121CA0
	.align 2, 0
_081215B0: .4byte gUnknown_02024A6A
_081215B4: .4byte gEnemyParty
_081215B8:
	movs r0, 0x2
	bl battle_get_side_with_given_state
	ldr r1, _081215CC
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_081215CC: .4byte gUnknown_02024A6A
_081215D0:
	movs r0, 0x3
	bl battle_get_side_with_given_state
	ldr r1, _081215E8
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081215EC
	b _08121CA0
	.align 2, 0
_081215E8: .4byte gUnknown_02024A6A
_081215EC: .4byte gEnemyParty
_081215F0:
	ldr r2, _08121608
	ldr r1, _0812160C
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_08121608: .4byte gUnknown_02024A6A
_0812160C: .4byte gLinkPlayers
_08121610:
	ldr r2, _08121630
	ldr r1, _08121634
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121638
	b _08121CA0
	.align 2, 0
_08121630: .4byte gUnknown_02024A6A
_08121634: .4byte gLinkPlayers
_08121638: .4byte gEnemyParty
_0812163C:
	ldr r2, _08121658
	ldr r1, _0812165C
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_08121658: .4byte gUnknown_02024A6A
_0812165C: .4byte gLinkPlayers
_08121660:
	ldr r2, _08121680
	ldr r1, _08121684
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
	eors r0, r1
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121688
	b _08121CA0
	.align 2, 0
_08121680: .4byte gUnknown_02024A6A
_08121684: .4byte gLinkPlayers
_08121688: .4byte gEnemyParty
_0812168C:
	ldr r4, _081216D0
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _081216F0
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _081216D4
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081216D8
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _081216E6
	.align 2, 0
_081216D0: .4byte gUnknown_02024C07
_081216D4: .4byte gUnknown_02024A6A
_081216D8: .4byte gEnemyParty
_081216DC:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_081216E6:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081216DC
	b _08121C76
_081216F0:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _0812170C
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_0812170C: .4byte gUnknown_02024A6A
_08121710:
	ldr r4, _0812173C
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121744
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08121740
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_0812173C: .4byte gUnknown_02024C07
_08121740: .4byte gUnknown_02024A6A
_08121744:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08121774
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x4
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121778
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	b _08121CAA
	.align 2, 0
_08121774: .4byte gUnknown_02024A6A
_08121778: .4byte gEnemyParty
_0812177C:
	ldr r4, _081217B0
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _081217D0
	ldr r1, _081217B4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081217B8
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _081217C6
	.align 2, 0
_081217B0: .4byte gUnknown_02024C07
_081217B4: .4byte gUnknown_02024A6A
_081217B8: .4byte gEnemyParty
_081217BC:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_081217C6:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081217BC
	b _08121C76
_081217D0:
	ldr r1, _081217DC
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_081217DC: .4byte gUnknown_02024A6A
_081217E0:
	ldr r4, _08121814
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121834
	ldr r1, _08121818
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812181C
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _0812182A
	.align 2, 0
_08121814: .4byte gUnknown_02024C08
_08121818: .4byte gUnknown_02024A6A
_0812181C: .4byte gEnemyParty
_08121820:
	mov r2, r8
	adds r0, r2, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_0812182A:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121820
	b _08121C76
_08121834:
	ldr r1, _08121840
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_08121840: .4byte gUnknown_02024A6A
_08121844:
	ldr r4, _08121878
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121898
	ldr r1, _0812187C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121880
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _0812188E
	.align 2, 0
_08121878: .4byte gUnknown_02024C0A
_0812187C: .4byte gUnknown_02024A6A
_08121880: .4byte gEnemyParty
_08121884:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_0812188E:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121884
	b _08121C76
_08121898:
	ldr r1, _081218A4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_081218A4: .4byte gUnknown_02024A6A
_081218A8:
	ldr r4, _081218DC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _081218FC
	ldr r1, _081218E0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081218E4
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _081218F2
	.align 2, 0
_081218DC: .4byte gUnknown_02024A60
_081218E0: .4byte gUnknown_02024A6A
_081218E4: .4byte gEnemyParty
_081218E8:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_081218F2:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _081218E8
	b _08121C76
_081218FC:
	ldr r1, _08121908
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_08121908: .4byte gUnknown_02024A6A
_0812190C:
	ldr r0, _08121944
	ldr r1, _08121948
	adds r4, r0, r1
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121968
	ldr r1, _0812194C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121950
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _0812195E
	.align 2, 0
_08121944: .4byte 0x02000000
_08121948: .4byte 0x00016003
_0812194C: .4byte gUnknown_02024A6A
_08121950: .4byte gEnemyParty
_08121954:
	mov r2, r8
	adds r0, r2, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_0812195E:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121954
	b _08121C76
_08121968:
	ldr r1, _08121974
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08121C9A
	.align 2, 0
_08121974: .4byte gUnknown_02024A6A
_08121978:
	ldr r0, _08121990
	ldr r2, [r0]
	ldrh r1, [r2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _0812199C
	ldr r0, _08121994
	ldr r3, _08121998
	adds r0, r3
	b _081219B4
	.align 2, 0
_08121990: .4byte gUnknown_02039270
_08121994: .4byte 0x02000000
_08121998: .4byte 0x000160a0
_0812199C:
	ldrh r1, [r2]
	b _081219D2
_081219A0:
	ldr r0, _081219C0
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _081219D0
	ldr r0, _081219C4
	ldr r5, _081219C8
	adds r0, r5
_081219B4:
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _081219CC
	adds r4, r0, r1
	b _08121D46
	.align 2, 0
_081219C0: .4byte gUnknown_02039270
_081219C4: .4byte 0x02000000
_081219C8: .4byte 0x000160a0
_081219CC: .4byte gUnknown_08401674
_081219D0:
	ldrh r1, [r2, 0x2]
_081219D2:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _081219DC
	adds r4, r1, r0
	b _08121D46
	.align 2, 0
_081219DC: .4byte gMoveNames
_081219E0:
	ldr r0, _08121A2C
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08121A58
	ldr r1, _08121A30
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _08121A54
	ldr r2, _08121A34
	ldr r0, _08121A38
	ldr r1, _08121A3C
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08121A40
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _08121A4C
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _08121A44
	adds r1, r0
	mov r0, sp
	bl StringCopy
	ldr r1, _08121A48
	mov r0, sp
	bl de_sub_8073174
	mov r4, sp
	b _08121D46
	.align 2, 0
_08121A2C: .4byte gUnknown_020239F8
_08121A30: .4byte gUnknown_02024C04
_08121A34: .4byte gLinkPlayers
_08121A38: .4byte 0x02000000
_08121A3C: .4byte 0x000160cb
_08121A40: .4byte gUnknown_02024C0B
_08121A44: .4byte gEnigmaBerries
_08121A48: .4byte gUnknown_08400A85
_08121A4C:
	ldr r4, _08121A50
	b _08121D46
	.align 2, 0
_08121A50: .4byte gUnknown_08400A78
_08121A54:
	ldrh r0, [r1]
	b _08121A5C
_08121A58:
	ldr r0, _08121A68
	ldrh r0, [r0]
_08121A5C:
	mov r1, sp
	bl CopyItemName
	mov r4, sp
	b _08121D46
	.align 2, 0
_08121A68: .4byte gUnknown_02024C04
_08121A6C:
	ldr r0, _08121A70
	b _08121AB4
	.align 2, 0
_08121A70: .4byte byte_2024C06
_08121A74:
	ldr r1, _08121A7C
	ldr r0, _08121A80
	b _08121AB0
	.align 2, 0
_08121A7C: .4byte gUnknown_0203926C
_08121A80: .4byte gUnknown_02024C07
_08121A84:
	ldr r1, _08121A8C
	ldr r0, _08121A90
	b _08121AB0
	.align 2, 0
_08121A8C: .4byte gUnknown_0203926C
_08121A90: .4byte gUnknown_02024C08
_08121A94:
	ldr r1, _08121AA0
	ldr r0, _08121AA4
	ldr r2, _08121AA8
	adds r0, r2
	b _08121AB0
	.align 2, 0
_08121AA0: .4byte gUnknown_0203926C
_08121AA4: .4byte 0x02000000
_08121AA8: .4byte 0x00016003
_08121AAC:
	ldr r1, _08121AC0
	ldr r0, _08121AC4
_08121AB0:
	ldrb r0, [r0]
	adds r0, r1
_08121AB4:
	ldrb r1, [r0]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121AC8
	adds r4, r1, r0
	b _08121D46
	.align 2, 0
_08121AC0: .4byte gUnknown_0203926C
_08121AC4: .4byte gUnknown_02024C0A
_08121AC8: .4byte gAbilityNames
_08121ACC:
	ldr r3, _08121AE0
	ldrh r1, [r3]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08121AE4
	adds r0, r1, 0
	movs r1, 0
	b _08121B16
	.align 2, 0
_08121AE0: .4byte gTrainerBattleOpponent
_08121AE4:
	ldr r0, _08121AFC
	ldrh r1, [r0]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08121B00
	adds r0, r2, 0
	movs r1, 0
	b _08121B16
	.align 2, 0
_08121AFC: .4byte gUnknown_020239F8
_08121B00:
	movs r2, 0x80
	lsls r2, 4
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08121B12
	adds r0, r2, 0
	movs r1, 0
	b _08121B16
_08121B12:
	ldrh r1, [r3]
	movs r0, 0
_08121B16:
	bl de_sub_8041024
	adds r4, r0, 0
	b _08121D46
_08121B1E:
	ldr r2, _08121B44
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08121B4C
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	ldr r1, _08121B48
	mov r0, sp
	movs r2, 0x7
	bl memcpy
	mov r4, sp
	b _08121D46
	.align 2, 0
_08121B44: .4byte gTrainerBattleOpponent
_08121B48: .4byte 0x02017002
_08121B4C:
	ldr r0, _08121B64
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08121B68
	mov r0, sp
	bl get_trainer_name
	mov r4, sp
	b _08121D46
	.align 2, 0
_08121B64: .4byte gUnknown_020239F8
_08121B68:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08121B7C
	mov r0, sp
	bl sub_8135FF4
	mov r4, sp
	b _08121D46
_08121B7C:
	ldrh r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08121B8C
	adds r4, r1, r0
	b _08121D46
	.align 2, 0
_08121B8C: .4byte 0x081fd47c
_08121B90:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _08121B9C
	adds r4, r0, r1
	b _08121D46
	.align 2, 0
_08121B9C: .4byte 0x03002988
_08121BA0:
	ldr r4, _08121BB0
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x2
	b _08121BD6
	.align 2, 0
_08121BB0: .4byte gLinkPlayers
_08121BB4:
	ldr r4, _08121BC4
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x1
	b _08121BD6
	.align 2, 0
_08121BC4: .4byte gLinkPlayers
_08121BC8:
	ldr r4, _08121BE8
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x18]
	movs r0, 0x3
_08121BD6:
	eors r0, r1
	bl sub_803FC34
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, 0x8
	adds r4, r1, r4
	b _08121D46
	.align 2, 0
_08121BE8: .4byte gLinkPlayers
_08121BEC:
	ldr r0, _08121C04
	ldr r3, _08121C08
	adds r0, r3
	ldrb r0, [r0]
	bl sub_803FC34
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _08121C0C
	adds r4, r1, r0
	b _08121D46
	.align 2, 0
_08121C04: .4byte 0x02000000
_08121C08: .4byte 0x00016003
_08121C0C: .4byte 0x03002988
_08121C10:
	ldr r4, _08121C14
	b _08121D46
	.align 2, 0
_08121C14: .4byte gSaveBlock2
_08121C18:
	bl sub_8082830
	adds r4, r0, 0
	b _08121D46
_08121C20:
	ldr r4, _08121C54
	ldr r5, _08121C58
	adds r0, r4, r5
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08121C94
	ldr r1, _08121C5C
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121C60
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _08121C6E
	.align 2, 0
_08121C54: .4byte 0x02000000
_08121C58: .4byte 0x00016003
_08121C5C: .4byte 0x0001605e
_08121C60: .4byte gEnemyParty
_08121C64:
	mov r2, r8
	adds r0, r2, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
_08121C6E:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121C64
_08121C76:
	ldr r0, _08121C88
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	ldr r4, _08121C8C
	cmp r0, 0
	beq _08121D46
	ldr r4, _08121C90
	b _08121D46
	.align 2, 0
_08121C88: .4byte gUnknown_020239F8
_08121C8C: .4byte gUnknown_08400791
_08121C90: .4byte gUnknown_08400797
_08121C94:
	ldr r3, _08121CB4
	adds r0, r4, r3
	ldrb r1, [r0]
_08121C9A:
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121CB8
_08121CA0:
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
_08121CAA:
	mov r0, sp
	bl StringGetEnd10
	mov r4, sp
	b _08121D46
	.align 2, 0
_08121CB4: .4byte 0x0001605e
_08121CB8: .4byte gPlayerParty
_08121CBC:
	ldr r0, _08121CD0
	bl FlagGet
	lsls r0, 24
	ldr r4, _08121CD4
	cmp r0, 0
	beq _08121D46
	ldr r4, _08121CD8
	b _08121D46
	.align 2, 0
_08121CD0: .4byte 0x0000084b
_08121CD4: .4byte gUnknown_084009ED
_08121CD8: .4byte gUnknown_084009F7
_08121CDC:
	ldr r0, _08121CE0
	b _08121CE6
	.align 2, 0
_08121CE0: .4byte gUnknown_02024C07
_08121CE4:
	ldr r0, _08121CF8
_08121CE6:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08121CFC
	cmp r0, 0
	bne _08121D46
	ldr r4, _08121D00
	b _08121D46
	.align 2, 0
_08121CF8: .4byte gUnknown_02024C08
_08121CFC: .4byte gUnknown_084007A7
_08121D00: .4byte gUnknown_084007AC
_08121D04:
	ldr r0, _08121D08
	b _08121D0E
	.align 2, 0
_08121D08: .4byte gUnknown_02024C07
_08121D0C:
	ldr r0, _08121D20
_08121D0E:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08121D24
	cmp r0, 0
	bne _08121D46
	ldr r4, _08121D28
	b _08121D46
	.align 2, 0
_08121D20: .4byte gUnknown_02024C08
_08121D24: .4byte gUnknown_0840079C
_08121D28: .4byte gUnknown_084007A1
_08121D2C:
	ldr r0, _08121D30
	b _08121D36
	.align 2, 0
_08121D30: .4byte gUnknown_02024C07
_08121D34:
	ldr r0, _08121D88
_08121D36:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08121D8C
	cmp r0, 0
	bne _08121D46
	ldr r4, _08121D90
_08121D46:
	ldrb r1, [r4]
	adds r0, r1, 0
	mov r5, r9
	ldrb r2, [r5]
	mov r3, r9
	adds r3, 0x1
	cmp r0, 0xFF
	beq _08121D68
_08121D56:
	mov r5, r8
	adds r0, r5, r6
	strb r1, [r0]
	adds r6, 0x1
	adds r4, 0x1
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _08121D56
_08121D68:
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x21
	bne _08121DA0
	mov r0, r8
	adds r1, r0, r6
	movs r0, 0xFC
	strb r0, [r1]
	adds r6, 0x1
	mov r2, r8
	adds r1, r2, r6
	movs r0, 0x9
	strb r0, [r1]
	adds r6, 0x1
	b _08121DA0
	.align 2, 0
_08121D88: .4byte gUnknown_02024C08
_08121D8C: .4byte gUnknown_084007B2
_08121D90: .4byte gUnknown_084007B7
_08121D94:
	mov r3, r8
	adds r0, r3, r6
	strb r1, [r0]
	adds r6, 0x1
	mov r3, r9
	adds r3, 0x1
_08121DA0:
	mov r9, r3
	ldrb r1, [r3]
_08121DA4:
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _08121DAE
	bl _08121446
_08121DAE:
	mov r5, r8
	adds r1, r5, r6
	mov r2, r9
	ldrb r0, [r2]
	strb r0, [r1]
	adds r6, 0x1
	adds r0, r6, 0
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
_08121DCC:
	push {r4-r7,lr}
	mov r7, r8
	thumb_func_end sub_8120FFC

	thumb_func_start sub_8121A68
sub_8121A68: @ 8121DD0
	push {r7}
	sub sp, 0xC
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0x1
	movs r0, 0
	mov r8, r0
	movs r0, 0xFF
	strb r0, [r6]
	ldrb r0, [r7, 0x1]
	cmp r0, 0xFF
	bne _08121DEA
	b _0812208E
_08121DEA:
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0xA
	bls _08121DF6
	b _08122084
_08121DF6:
	lsls r0, r1, 2
	ldr r1, _08121E00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08121E00: .4byte _08121E04
	.align 2, 0
_08121E04:
	.4byte _08121E30
	.4byte _08121E58
	.4byte _08121EB0
	.4byte _08121EC8
	.4byte _08121ED8
	.4byte _08121F58
	.4byte _08121F6C
	.4byte _08121F7E
	.4byte _08121FC4
	.4byte _08121FD8
	.4byte _08121FF4
_08121E30:
	adds r0, r5, r7
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	cmp r2, 0xD1
	beq _08121E42
	cmp r2, 0xD3
	bne _08121E44
_08121E42:
	adds r5, 0x3
_08121E44:
	ldr r0, _08121E54
	adds r1, r2, 0
	subs r1, 0xC
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	b _08122062
	.align 2, 0
_08121E54: .4byte gUnknown_08400F8C
_08121E58:
	adds r1, r2, 0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x2
	beq _08121E74
	cmp r0, 0x2
	bgt _08121E6A
	cmp r0, 0x1
	beq _08121E70
	b _08121E9A
_08121E6A:
	cmp r0, 0x4
	beq _08121E80
	b _08121E9A
_08121E70:
	ldrb r1, [r1, 0x3]
	b _08121E98
_08121E74:
	ldrb r0, [r1, 0x3]
	mov r8, r0
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	mov r1, r8
	b _08121E96
_08121E80:
	ldrb r0, [r2, 0x3]
	mov r8, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 8
	mov r1, r8
	orrs r1, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x6]
	lsls r0, 24
_08121E96:
	orrs r1, r0
_08121E98:
	mov r8, r1
_08121E9A:
	adds r4, r5, r7
	ldrb r3, [r4, 0x2]
	adds r0, r6, 0
	mov r1, r8
	movs r2, 0
	bl ConvertIntToDecimalStringN
	adds r0, r5, 0x3
	ldrb r4, [r4, 0x1]
	adds r5, r0, r4
	b _08122084
_08121EB0:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121EC4
	adds r1, r0
	b _08122062
	.align 2, 0
_08121EC4: .4byte gMoveNames
_08121EC8:
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08121ED4
	b _08121FE2
	.align 2, 0
_08121ED4: .4byte gTypeNames
_08121ED8:
	adds r4, r5, r7
	ldrb r0, [r4, 0x1]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121F0C
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121F08
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	b _08122082
	.align 2, 0
_08121F08: .4byte gPlayerParty
_08121F0C:
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121F3C
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r0, _08121F40
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08121F48
	ldr r1, _08121F44
	b _08122062
	.align 2, 0
_08121F3C: .4byte gEnemyParty
_08121F40: .4byte gUnknown_020239F8
_08121F44: .4byte gUnknown_08400797
_08121F48:
	ldr r1, _08121F54
	adds r0, r6, 0
	bl StringAppend
	b _08122082
	.align 2, 0
_08121F54: .4byte gUnknown_08400791
_08121F58:
	ldr r1, _08121F68
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _08121FE4
	.align 2, 0
_08121F68: .4byte gUnknown_08400F58
_08121F6C:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r1, r0
	adds r0, r6, 0
	bl GetSpeciesName
	b _08122082
_08121F7E:
	adds r4, r5, r7
	ldrb r0, [r4, 0x1]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08121FA4
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121FA0
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
	b _08121FB6
	.align 2, 0
_08121FA0: .4byte gPlayerParty
_08121FA4:
	ldrb r1, [r4, 0x2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08121FC0
	adds r0, r1
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
_08121FB6:
	adds r0, r6, 0
	bl StringGetEnd10
	b _08122082
	.align 2, 0
_08121FC0: .4byte gEnemyParty
_08121FC4:
	ldr r1, _08121FD4
	adds r0, r5, r7
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	b _08121FE4
	.align 2, 0
_08121FD4: .4byte gUnknown_08400F78
_08121FD8:
	adds r0, r5, r7
	ldrb r1, [r0, 0x1]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _08121FF0
_08121FE2:
	adds r1, r0
_08121FE4:
	adds r0, r6, 0
	bl StringAppend
	adds r5, 0x2
	b _08122084
	.align 2, 0
_08121FF0: .4byte gAbilityNames
_08121FF4:
	adds r0, r5, r7
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08122044
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812207A
	cmp r2, 0xAF
	bne _08122070
	ldr r2, _08122048
	ldr r0, _0812204C
	ldr r1, _08122050
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08122054
	ldrb r2, [r1]
	ldrh r0, [r0, 0x18]
	cmp r0, r2
	bne _08122060
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _08122058
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _0812205C
	adds r0, r6, 0
	bl de_sub_8073174
	b _08122082
	.align 2, 0
_08122044: .4byte gUnknown_020239F8
_08122048: .4byte gLinkPlayers
_0812204C: .4byte 0x02000000
_08122050: .4byte 0x000160cb
_08122054: .4byte gUnknown_02024C0B
_08122058: .4byte gEnigmaBerries
_0812205C: .4byte gUnknown_08400A85
_08122060:
	ldr r1, _0812206C
_08122062:
	adds r0, r6, 0
	bl StringAppend
	b _08122082
	.align 2, 0
_0812206C: .4byte gUnknown_08400A78
_08122070:
	adds r0, r2, 0
	adds r1, r6, 0
	bl CopyItemName
	b _08122082
_0812207A:
	adds r0, r2, 0
	adds r1, r6, 0
	bl CopyItemName
_08122082:
	adds r5, 0x3
_08122084:
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0812208E
	b _08121DEA
_0812208E:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8121A68

	thumb_func_start sub_8121D1C
sub_8121D1C: @ 812209C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _081220D0
	ldr r3, _081220D4
_081220A6:
	cmp r2, 0x4
	beq _081220BC
	ldrh r1, [r3]
	cmp r1, 0
	bne _081220B2
	adds r2, 0x1
_081220B2:
	ldr r0, [r5]
	adds r3, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _081220A6
_081220BC:
	cmp r2, 0
	blt _081220E8
	cmp r2, 0x2
	bgt _081220DC
	ldr r1, _081220D8
	adds r0, r4, 0
	bl StringCopy
	b _081220E8
	.align 2, 0
_081220D0: .4byte gUnknown_02039270
_081220D4: .4byte gUnknown_084016BC
_081220D8: .4byte gUnknown_08400E5E
_081220DC:
	cmp r2, 0x4
	bgt _081220E8
	ldr r1, _081220F0
	adds r0, r4, 0
	bl StringCopy
_081220E8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081220F0: .4byte gUnknown_08400E62
	thumb_func_end sub_8121D1C

	thumb_func_start sub_8121D74
sub_8121D74: @ 81220F4
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r4, 0
	b _081220FE
_081220FC:
	adds r3, 0x1
_081220FE:
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _081220FC
	ldr r1, _08122134
	ldr r5, _08122138
	movs r0, 0
	lsls r0, 1
	adds r2, r0, r1
_0812210E:
	cmp r4, 0x4
	beq _08122128
	ldrh r1, [r2]
	cmp r1, 0
	bne _0812211A
	adds r4, 0x1
_0812211A:
	ldr r0, [r5]
	adds r2, 0x2
	ldrh r0, [r0]
	cmp r1, r0
	bne _0812210E
	cmp r4, 0x4
	bhi _08122184
_08122128:
	lsls r0, r4, 2
	ldr r1, _0812213C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122134: .4byte gUnknown_084016BC
_08122138: .4byte gUnknown_02039270
_0812213C: .4byte _08122140
	.align 2, 0
_08122140:
	.4byte _08122154
	.4byte _0812215C
	.4byte _08122164
	.4byte _0812216C
	.4byte _0812217C
_08122154:
	ldr r1, _08122158
	b _0812216E
	.align 2, 0
_08122158: .4byte gUnknown_084007C8
_0812215C:
	ldr r1, _08122160
	b _0812216E
	.align 2, 0
_08122160: .4byte gUnknown_084007CA
_08122164:
	ldr r1, _08122168
	b _0812216E
	.align 2, 0
_08122168: .4byte gUnknown_084007CC
_0812216C:
	ldr r1, _08122178
_0812216E:
	adds r0, r3, 0
	bl StringCopy
	b _08122184
	.align 2, 0
_08122178: .4byte gUnknown_084007CE
_0812217C:
	ldr r1, _0812218C
	adds r0, r3, 0
	bl StringCopy
_08122184:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812218C: .4byte gUnknown_084007D0
	thumb_func_end sub_8121D74

	.align 2, 0 @ Don't pad with nop.
