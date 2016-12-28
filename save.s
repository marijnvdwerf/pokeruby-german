	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ClearSaveData
ClearSaveData: @ 8125194
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _081251B4 @ =EraseFlashSector
_0812519A:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0812519A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081251B4: .4byte EraseFlashSector
	thumb_func_end ClearSaveData

	thumb_func_start sub_81251B8
sub_81251B8: @ 81251B8
	ldr r0, _081251C8 @ =gUnknown_03005EAC
	movs r1, 0
	str r1, [r0]
	ldr r0, _081251CC @ =gUnknown_03005E9C
	strh r1, [r0]
	ldr r0, _081251D0 @ =gUnknown_03005EA8
	str r1, [r0]
	bx lr
	.align 2, 0
_081251C8: .4byte gUnknown_03005EAC
_081251CC: .4byte gUnknown_03005E9C
_081251D0: .4byte gUnknown_03005EA8
	thumb_func_end sub_81251B8

	thumb_func_start sub_81251D4
sub_81251D4: @ 81251D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r4, 0
	cmp r0, 0x1
	beq _08125208
	cmp r0, 0x1
	bgt _081251EE
	cmp r0, 0
	beq _081251F4
	b _0812522C
_081251EE:
	cmp r0, 0x2
	beq _0812521C
	b _0812522C
_081251F4:
	ldr r2, _08125204 @ =gUnknown_03005EA8
	movs r1, 0x1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _0812522C
	.align 2, 0
_08125204: .4byte gUnknown_03005EA8
_08125208:
	ldr r2, _08125218 @ =gUnknown_03005EA8
	adds r1, r0, 0
	lsls r1, r3
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	b _0812522C
	.align 2, 0
_08125218: .4byte gUnknown_03005EA8
_0812521C:
	ldr r0, _08125234 @ =gUnknown_03005EA8
	movs r1, 0x1
	lsls r1, r3
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _0812522C
	movs r4, 0x1
_0812522C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08125234: .4byte gUnknown_03005EA8
	thumb_func_end sub_81251D4

	thumb_func_start save_write_to_flash
save_write_to_flash: @ 8125238
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0812525C @ =gUnknown_03005EB0
	ldr r0, _08125260 @ =0x02000000
	str r0, [r1]
	ldr r0, _08125264 @ =0x0000ffff
	cmp r2, r0
	beq _08125268
	adds r0, r2, 0
	adds r1, r7, 0
	bl sub_81252D8
	lsls r0, 24
	lsrs r5, r0, 24
	b _081252BA
	.align 2, 0
_0812525C: .4byte gUnknown_03005EB0
_08125260: .4byte 0x02000000
_08125264: .4byte 0x0000ffff
_08125268:
	ldr r1, _081252C4 @ =gUnknown_03005EA4
	ldr r5, _081252C8 @ =gUnknown_03005E9C
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _081252CC @ =gUnknown_03005EA0
	ldr r6, _081252D0 @ =gUnknown_03005EAC
	ldr r4, [r6]
	str r4, [r1]
	adds r0, 0x1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, 0xE
	bl __umodsi3
	strh r0, [r5]
	adds r4, 0x1
	str r4, [r6]
	movs r5, 0x1
	movs r4, 0
_0812528E:
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_81252D8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _0812528E
	ldr r0, _081252D4 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _081252BA
	movs r5, 0xFF
	ldr r1, _081252C8 @ =gUnknown_03005E9C
	ldr r0, _081252C4 @ =gUnknown_03005EA4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081252D0 @ =gUnknown_03005EAC
	ldr r0, _081252CC @ =gUnknown_03005EA0
	ldr r0, [r0]
	str r0, [r1]
_081252BA:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081252C4: .4byte gUnknown_03005EA4
_081252C8: .4byte gUnknown_03005E9C
_081252CC: .4byte gUnknown_03005EA0
_081252D0: .4byte gUnknown_03005EAC
_081252D4: .4byte gUnknown_03005EA8
	thumb_func_end save_write_to_flash

	thumb_func_start sub_81252D8
sub_81252D8: @ 81252D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _081253A4 @ =gUnknown_03005E9C
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _081253A8 @ =gUnknown_03005EAC
	ldr r1, [r2]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r6, 3
	adds r0, r4
	ldr r1, [r0]
	mov r10, r1
	ldrh r4, [r0, 0x4]
	movs r3, 0
	mov r9, r2
	ldr r2, _081253AC @ =gUnknown_03005EB0
	mov r12, r2
	mov r8, r12
	movs r2, 0
	ldr r1, _081253B0 @ =0x00000fff
_0812532A:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3
	strb r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bls _0812532A
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _081253B4 @ =0x00000ff4
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, _081253B8 @ =0x00000ff8
	adds r2, r1, r3
	ldr r0, _081253BC @ =_08012024
	str r0, [r2]
	ldr r6, _081253C0 @ =0x00000ffc
	adds r1, r6
	mov r7, r9
	ldr r0, [r7]
	str r0, [r1]
	movs r3, 0
	lsls r5, 24
	cmp r3, r4
	bcs _08125378
	mov r2, r12
_08125362:
	ldr r1, [r2]
	adds r1, r3
	mov r6, r10
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _08125362
_08125378:
	mov r0, r10
	adds r1, r4, 0
	bl sub_8125C10
	ldr r1, _081253AC @ =gUnknown_03005EB0
	ldr r1, [r1]
	ldr r7, _081253C4 @ =0x00000ff6
	adds r2, r1, r7
	strh r0, [r2]
	lsrs r0, r5, 24
	bl sub_8125440
	lsls r0, 24
	lsrs r0, 24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081253A4: .4byte gUnknown_03005E9C
_081253A8: .4byte gUnknown_03005EAC
_081253AC: .4byte gUnknown_03005EB0
_081253B0: .4byte 0x00000fff
_081253B4: .4byte 0x00000ff4
_081253B8: .4byte 0x00000ff8
_081253BC: .4byte _08012024
_081253C0: .4byte 0x00000ffc
_081253C4: .4byte 0x00000ff6
	thumb_func_end sub_81252D8

	thumb_func_start sub_81253C8
sub_81253C8: @ 81253C8
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _0812542C @ =0x02000000
	movs r3, 0
	movs r6, 0
	ldr r1, _08125430 @ =0x00000fff
_081253DC:
	adds r0, r4, r3
	strb r6, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bls _081253DC
	ldr r0, _08125434 @ =0x00000ff8
	adds r1, r4, r0
	ldr r0, _08125438 @ =_08012024
	str r0, [r1]
	movs r3, 0
	cmp r3, r2
	bcs _0812540A
_081253F8:
	adds r1, r4, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _081253F8
_0812540A:
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_8125C10
	ldr r2, _0812543C @ =0x00000ff4
	adds r1, r4, r2
	strh r0, [r1]
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_8125440
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812542C: .4byte 0x02000000
_08125430: .4byte 0x00000fff
_08125434: .4byte 0x00000ff8
_08125438: .4byte _08012024
_0812543C: .4byte 0x00000ff4
	thumb_func_end sub_81253C8

	thumb_func_start sub_8125440
sub_8125440: @ 8125440
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl ProgramFlashSectorAndVerify
	cmp r0, 0
	bne _0812545C
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_81251D4
	movs r0, 0x1
	b _08125466
_0812545C:
	movs r0, 0
	adds r1, r4, 0
	bl sub_81251D4
	movs r0, 0xFF
_08125466:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125440

	thumb_func_start sub_812546C
sub_812546C: @ 812546C
	push {r4-r6,lr}
	ldr r1, _081254A8 @ =gUnknown_03005EB0
	ldr r0, _081254AC @ =0x02000000
	str r0, [r1]
	ldr r1, _081254B0 @ =gUnknown_03005EA4
	ldr r5, _081254B4 @ =gUnknown_03005E9C
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _081254B8 @ =gUnknown_03005EA0
	ldr r6, _081254BC @ =gUnknown_03005EAC
	ldr r4, [r6]
	str r4, [r1]
	adds r0, 0x1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, 0xE
	bl __umodsi3
	strh r0, [r5]
	adds r4, 0x1
	str r4, [r6]
	ldr r1, _081254C0 @ =gUnknown_03005EB4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _081254C4 @ =gUnknown_03005EA8
	movs r0, 0
	str r0, [r1]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081254A8: .4byte gUnknown_03005EB0
_081254AC: .4byte 0x02000000
_081254B0: .4byte gUnknown_03005EA4
_081254B4: .4byte gUnknown_03005E9C
_081254B8: .4byte gUnknown_03005EA0
_081254BC: .4byte gUnknown_03005EAC
_081254C0: .4byte gUnknown_03005EB4
_081254C4: .4byte gUnknown_03005EA8
	thumb_func_end sub_812546C

	thumb_func_start sub_81254C8
sub_81254C8: @ 81254C8
	ldr r1, _081254EC @ =gUnknown_03005EB0
	ldr r0, _081254F0 @ =0x02000000
	str r0, [r1]
	ldr r1, _081254F4 @ =gUnknown_03005EA4
	ldr r0, _081254F8 @ =gUnknown_03005E9C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081254FC @ =gUnknown_03005EA0
	ldr r0, _08125500 @ =gUnknown_03005EAC
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08125504 @ =gUnknown_03005EB4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08125508 @ =gUnknown_03005EA8
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_081254EC: .4byte gUnknown_03005EB0
_081254F0: .4byte 0x02000000
_081254F4: .4byte gUnknown_03005EA4
_081254F8: .4byte gUnknown_03005E9C
_081254FC: .4byte gUnknown_03005EA0
_08125500: .4byte gUnknown_03005EAC
_08125504: .4byte gUnknown_03005EB4
_08125508: .4byte gUnknown_03005EA8
	thumb_func_end sub_81254C8

	thumb_func_start sub_812550C
sub_812550C: @ 812550C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08125548 @ =gUnknown_03005EB4
	ldrh r2, [r4]
	subs r0, 0x1
	cmp r2, r0
	bge _08125560
	movs r5, 0x1
	adds r0, r2, 0
	bl sub_81252D8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r0, _0812554C @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125562
	movs r5, 0xFF
	ldr r1, _08125550 @ =gUnknown_03005E9C
	ldr r0, _08125554 @ =gUnknown_03005EA4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08125558 @ =gUnknown_03005EAC
	ldr r0, _0812555C @ =gUnknown_03005EA0
	ldr r0, [r0]
	str r0, [r1]
	b _08125562
	.align 2, 0
_08125548: .4byte gUnknown_03005EB4
_0812554C: .4byte gUnknown_03005EA8
_08125550: .4byte gUnknown_03005E9C
_08125554: .4byte gUnknown_03005EA4
_08125558: .4byte gUnknown_03005EAC
_0812555C: .4byte gUnknown_03005EA0
_08125560:
	movs r5, 0xFF
_08125562:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_812550C

	thumb_func_start sub_812556C
sub_812556C: @ 812556C
	push {r4,lr}
	lsls r0, 16
	movs r4, 0x1
	ldr r2, _081255A0 @ =0xffff0000
	adds r0, r2
	lsrs r0, 16
	bl sub_81255B8
	ldr r0, _081255A4 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125596
	movs r4, 0xFF
	ldr r1, _081255A8 @ =gUnknown_03005E9C
	ldr r0, _081255AC @ =gUnknown_03005EA4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081255B0 @ =gUnknown_03005EAC
	ldr r0, _081255B4 @ =gUnknown_03005EA0
	ldr r0, [r0]
	str r0, [r1]
_08125596:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081255A0: .4byte 0xffff0000
_081255A4: .4byte gUnknown_03005EA8
_081255A8: .4byte gUnknown_03005E9C
_081255AC: .4byte gUnknown_03005EA4
_081255B0: .4byte gUnknown_03005EAC
_081255B4: .4byte gUnknown_03005EA0
	thumb_func_end sub_812556C

	thumb_func_start sub_81255B8
sub_81255B8: @ 81255B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08125684 @ =gUnknown_03005E9C
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _08125688 @ =gUnknown_03005EAC
	ldr r1, [r2]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r6, 3
	adds r0, r4
	ldr r1, [r0]
	mov r10, r1
	ldrh r3, [r0, 0x4]
	movs r4, 0
	mov r9, r2
	ldr r2, _0812568C @ =gUnknown_03005EB0
	mov r12, r2
	mov r8, r12
	movs r2, 0
	ldr r1, _08125690 @ =0x00000fff
_0812560A:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r4
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	bls _0812560A
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _08125694 @ =0x00000ff4
	adds r0, r1, r2
	strh r6, [r0]
	ldr r6, _08125698 @ =0x00000ff8
	adds r2, r1, r6
	ldr r0, _0812569C @ =_08012024
	str r0, [r2]
	ldr r7, _081256A0 @ =0x00000ffc
	adds r1, r7
	mov r2, r9
	ldr r0, [r2]
	str r0, [r1]
	movs r4, 0
	lsls r6, r5, 24
	mov r8, r6
	cmp r4, r3
	bcs _0812565A
	mov r2, r12
_08125644:
	ldr r1, [r2]
	adds r1, r4
	mov r7, r10
	adds r0, r7, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r3
	bcc _08125644
_0812565A:
	mov r0, r10
	adds r1, r3, 0
	bl sub_8125C10
	ldr r1, _0812568C @ =gUnknown_03005EB0
	ldr r1, [r1]
	ldr r2, _081256A4 @ =0x00000ff6
	adds r1, r2
	strh r0, [r1]
	ldr r0, _081256A8 @ =EraseFlashSector
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	movs r6, 0x1
	movs r4, 0
	ldr r7, _081256AC @ =0x00000ff7
	mov r9, r7
	ldr r7, _081256B0 @ =ProgramFlashByte
	b _081256BA
	.align 2, 0
_08125684: .4byte gUnknown_03005E9C
_08125688: .4byte gUnknown_03005EAC
_0812568C: .4byte gUnknown_03005EB0
_08125690: .4byte 0x00000fff
_08125694: .4byte 0x00000ff4
_08125698: .4byte 0x00000ff8
_0812569C: .4byte _08012024
_081256A0: .4byte 0x00000ffc
_081256A4: .4byte 0x00000ff6
_081256A8: .4byte EraseFlashSector
_081256AC: .4byte 0x00000ff7
_081256B0: .4byte ProgramFlashByte
_081256B4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_081256BA:
	cmp r4, r9
	bhi _081256D8
	ldr r0, _081256E4 @ =gUnknown_03005EB0
	ldr r0, [r0]
	adds r0, r4
	ldrb r2, [r0]
	ldr r3, [r7]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	beq _081256B4
	movs r6, 0xFF
_081256D8:
	cmp r6, 0xFF
	bne _081256E8
	mov r0, r8
	lsrs r1, r0, 24
	b _08125740
	.align 2, 0
_081256E4: .4byte gUnknown_03005EB0
_081256E8:
	movs r6, 0x1
	movs r4, 0
	ldr r1, _081256F4 @ =ProgramFlashByte
	mov r9, r1
	ldr r7, _081256F8 @ =0x00000ff9
	b _08125702
	.align 2, 0
_081256F4: .4byte ProgramFlashByte
_081256F8: .4byte 0x00000ff9
_081256FC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08125702:
	cmp r4, 0x6
	bhi _08125724
	adds r1, r4, r7
	ldr r0, _08125738 @ =gUnknown_03005EB0
	ldr r0, [r0]
	adds r0, r4, r0
	adds r0, r7
	ldrb r2, [r0]
	mov r0, r9
	ldr r3, [r0]
	adds r0, r5, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	beq _081256FC
	movs r6, 0xFF
_08125724:
	cmp r6, 0xFF
	beq _0812573C
	mov r2, r8
	lsrs r1, r2, 24
	movs r0, 0x1
	bl sub_81251D4
	movs r0, 0x1
	b _08125748
	.align 2, 0
_08125738: .4byte gUnknown_03005EB0
_0812573C:
	mov r6, r8
	lsrs r1, r6, 24
_08125740:
	movs r0, 0
	bl sub_81251D4
	movs r0, 0xFF
_08125748:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81255B8

	thumb_func_start sub_8125758
sub_8125758: @ 8125758
	push {r4-r6,lr}
	lsls r0, 16
	ldr r6, _081257B4 @ =gUnknown_03005E9C
	lsrs r0, 16
	ldrh r1, [r6]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _081257B8 @ =gUnknown_03005EAC
	ldr r1, [r5]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, _081257BC @ =ProgramFlashByte
	ldr r1, _081257C0 @ =0x00000ff8
	ldr r0, _081257C4 @ =gUnknown_03005EB0
	ldr r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	bne _081257C8
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_81251D4
	movs r0, 0x1
	b _081257E0
	.align 2, 0
_081257B4: .4byte gUnknown_03005E9C
_081257B8: .4byte gUnknown_03005EAC
_081257BC: .4byte ProgramFlashByte
_081257C0: .4byte 0x00000ff8
_081257C4: .4byte gUnknown_03005EB0
_081257C8:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_81251D4
	ldr r0, _081257E8 @ =gUnknown_03005EA4
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _081257EC @ =gUnknown_03005EA0
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0xFF
_081257E0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081257E8: .4byte gUnknown_03005EA4
_081257EC: .4byte gUnknown_03005EA0
	thumb_func_end sub_8125758

	thumb_func_start sub_81257F0
sub_81257F0: @ 81257F0
	push {r4-r6,lr}
	lsls r0, 16
	ldr r6, _08125844 @ =gUnknown_03005E9C
	lsrs r0, 16
	ldrh r1, [r6]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _08125848 @ =gUnknown_03005EAC
	ldr r1, [r5]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0812584C @ =ProgramFlashByte
	ldr r1, _08125850 @ =0x00000ff8
	ldr r3, [r0]
	adds r0, r4, 0
	movs r2, 0x25
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	bne _08125854
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_81251D4
	movs r0, 0x1
	b _0812586C
	.align 2, 0
_08125844: .4byte gUnknown_03005E9C
_08125848: .4byte gUnknown_03005EAC
_0812584C: .4byte ProgramFlashByte
_08125850: .4byte 0x00000ff8
_08125854:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_81251D4
	ldr r0, _08125874 @ =gUnknown_03005EA4
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _08125878 @ =gUnknown_03005EA0
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0xFF
_0812586C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08125874: .4byte gUnknown_03005EA4
_08125878: .4byte gUnknown_03005EA0
	thumb_func_end sub_81257F0

	thumb_func_start sub_812587C
sub_812587C: @ 812587C
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _08125894 @ =gUnknown_03005EB0
	ldr r0, _08125898 @ =0x02000000
	str r0, [r1]
	ldr r0, _0812589C @ =0x0000ffff
	cmp r4, r0
	beq _081258A0
	movs r5, 0xFF
	b _081258B2
	.align 2, 0
_08125894: .4byte gUnknown_03005EB0
_08125898: .4byte 0x02000000
_0812589C: .4byte 0x0000ffff
_081258A0:
	adds r0, r6, 0
	bl sub_8125974
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_81258BC
_081258B2:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_812587C

	thumb_func_start sub_81258BC
sub_81258BC: @ 81258BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r0, _08125958 @ =gUnknown_03005EAC
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 17
	lsrs r7, r0, 16
	movs r5, 0
	ldr r6, _0812595C @ =gUnknown_03005EB0
_081258D8:
	adds r0, r5, r7
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r6]
	bl sub_8125BF8
	ldr r0, [r6]
	ldr r1, _08125960 @ =0x00000ff4
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	bne _081258F4
	ldr r0, _08125964 @ =gUnknown_03005E9C
	strh r5, [r0]
_081258F4:
	ldr r0, [r6]
	lsls r1, 3
	mov r2, r8
	adds r4, r1, r2
	ldrh r1, [r4, 0x4]
	bl sub_8125C10
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, [r6]
	ldr r1, _08125968 @ =0x00000ff8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _0812596C @ =_08012024
	adds r5, 0x1
	cmp r1, r0
	bne _08125944
	ldr r1, _08125970 @ =0x00000ff6
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _08125944
	movs r2, 0
	ldrh r0, [r4, 0x4]
	cmp r2, r0
	bcs _08125944
	adds r3, r4, 0
	ldr r4, _0812595C @ =gUnknown_03005EB0
_0812592C:
	ldr r1, [r3]
	adds r1, r2
	ldr r0, [r4]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r1, [r3, 0x4]
	cmp r2, r1
	bcc _0812592C
_08125944:
	lsls r0, r5, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _081258D8
	movs r0, 0x1
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08125958: .4byte gUnknown_03005EAC
_0812595C: .4byte gUnknown_03005EB0
_08125960: .4byte 0x00000ff4
_08125964: .4byte gUnknown_03005E9C
_08125968: .4byte 0x00000ff8
_0812596C: .4byte _08012024
_08125970: .4byte 0x00000ff6
	thumb_func_end sub_81258BC

	thumb_func_start sub_8125974
sub_8125974: @ 8125974
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	movs r0, 0
	mov r8, r0
	mov r9, r0
	movs r6, 0
	movs r5, 0
	movs r4, 0
	ldr r7, _08125A00 @ =gUnknown_03005EB0
_08125990:
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, [r7]
	bl sub_8125BF8
	ldr r2, [r7]
	ldr r1, _08125A04 @ =0x00000ff8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08125A08 @ =_08012024
	cmp r1, r0
	bne _081259E0
	movs r5, 0x1
	ldr r3, _08125A0C @ =0x00000ff4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, 3
	add r0, r10
	ldrh r1, [r0, 0x4]
	adds r0, r2, 0
	bl sub_8125C10
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, [r7]
	ldr r3, _08125A10 @ =0x00000ff6
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _081259E0
	ldr r2, _08125A14 @ =0x00000ffc
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r3, 0x2
	adds r1, r3
	adds r0, r5, 0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_081259E0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _08125990
	cmp r5, 0
	beq _08125A1C
	ldr r0, _08125A18 @ =0x00003fff
	movs r1, 0xFF
	str r1, [sp]
	cmp r6, r0
	bne _08125A20
	movs r2, 0x1
	str r2, [sp]
	b _08125A20
	.align 2, 0
_08125A00: .4byte gUnknown_03005EB0
_08125A04: .4byte 0x00000ff8
_08125A08: .4byte _08012024
_08125A0C: .4byte 0x00000ff4
_08125A10: .4byte 0x00000ff6
_08125A14: .4byte 0x00000ffc
_08125A18: .4byte 0x00003fff
_08125A1C:
	movs r3, 0
	str r3, [sp]
_08125A20:
	movs r6, 0
	movs r5, 0
	movs r4, 0
	ldr r7, _08125A98 @ =gUnknown_03005EB0
_08125A28:
	adds r0, r4, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r7]
	bl sub_8125BF8
	ldr r2, [r7]
	ldr r1, _08125A9C @ =0x00000ff8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08125AA0 @ =_08012024
	cmp r1, r0
	bne _08125A7C
	movs r5, 0x1
	ldr r3, _08125AA4 @ =0x00000ff4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, 3
	add r0, r10
	ldrh r1, [r0, 0x4]
	adds r0, r2, 0
	bl sub_8125C10
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, [r7]
	ldr r3, _08125AA8 @ =0x00000ff6
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08125A7C
	ldr r2, _08125AAC @ =0x00000ffc
	adds r0, r1, r2
	ldr r0, [r0]
	mov r9, r0
	subs r3, 0x2
	adds r1, r3
	adds r0, r5, 0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_08125A7C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _08125A28
	cmp r5, 0
	beq _08125AB4
	ldr r0, _08125AB0 @ =0x00003fff
	movs r1, 0xFF
	cmp r6, r0
	bne _08125AB6
	movs r1, 0x1
	b _08125AB6
	.align 2, 0
_08125A98: .4byte gUnknown_03005EB0
_08125A9C: .4byte 0x00000ff8
_08125AA0: .4byte _08012024
_08125AA4: .4byte 0x00000ff4
_08125AA8: .4byte 0x00000ff6
_08125AAC: .4byte 0x00000ffc
_08125AB0: .4byte 0x00003fff
_08125AB4:
	movs r1, 0
_08125AB6:
	ldr r0, [sp]
	cmp r0, 0x1
	bne _08125B28
	cmp r1, 0x1
	bne _08125B18
	movs r0, 0x1
	negs r0, r0
	cmp r8, r0
	bne _08125ACE
	mov r1, r9
	cmp r1, 0
	beq _08125AD8
_08125ACE:
	mov r2, r8
	cmp r2, 0
	bne _08125AFC
	cmp r9, r0
	bne _08125AFC
_08125AD8:
	mov r1, r8
	adds r1, 0x1
	mov r0, r9
	adds r0, 0x1
	cmp r1, r0
	bcs _08125AF0
	ldr r0, _08125AEC @ =gUnknown_03005EAC
	mov r3, r9
	b _08125B10
	.align 2, 0
_08125AEC: .4byte gUnknown_03005EAC
_08125AF0:
	ldr r0, _08125AF8 @ =gUnknown_03005EAC
	mov r1, r8
	str r1, [r0]
	b _08125B40
	.align 2, 0
_08125AF8: .4byte gUnknown_03005EAC
_08125AFC:
	cmp r8, r9
	bcs _08125B0C
	ldr r0, _08125B08 @ =gUnknown_03005EAC
	mov r2, r9
	str r2, [r0]
	b _08125B40
	.align 2, 0
_08125B08: .4byte gUnknown_03005EAC
_08125B0C:
	ldr r0, _08125B14 @ =gUnknown_03005EAC
	mov r3, r8
_08125B10:
	str r3, [r0]
	b _08125B40
	.align 2, 0
_08125B14: .4byte gUnknown_03005EAC
_08125B18:
	ldr r0, _08125B24 @ =gUnknown_03005EAC
	mov r2, r8
	str r2, [r0]
	cmp r1, 0xFF
	beq _08125B38
	b _08125B40
	.align 2, 0
_08125B24: .4byte gUnknown_03005EAC
_08125B28:
	cmp r1, 0x1
	bne _08125B44
	ldr r0, _08125B3C @ =gUnknown_03005EAC
	mov r3, r9
	str r3, [r0]
	ldr r0, [sp]
	cmp r0, 0xFF
	bne _08125B40
_08125B38:
	movs r0, 0xFF
	b _08125B70
	.align 2, 0
_08125B3C: .4byte gUnknown_03005EAC
_08125B40:
	movs r0, 0x1
	b _08125B70
_08125B44:
	ldr r2, [sp]
	cmp r2, 0
	bne _08125B64
	cmp r1, 0
	bne _08125B64
	ldr r0, _08125B5C @ =gUnknown_03005EAC
	str r1, [r0]
	ldr r0, _08125B60 @ =gUnknown_03005E9C
	strh r1, [r0]
	movs r0, 0
	b _08125B70
	.align 2, 0
_08125B5C: .4byte gUnknown_03005EAC
_08125B60: .4byte gUnknown_03005E9C
_08125B64:
	ldr r0, _08125B80 @ =gUnknown_03005EAC
	movs r1, 0
	str r1, [r0]
	ldr r0, _08125B84 @ =gUnknown_03005E9C
	strh r1, [r0]
	movs r0, 0x2
_08125B70:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08125B80: .4byte gUnknown_03005EAC
_08125B84: .4byte gUnknown_03005E9C
	thumb_func_end sub_8125974

	thumb_func_start sub_8125B88
sub_8125B88: @ 8125B88
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	ldr r5, _08125BDC @ =0x02000000
	adds r1, r5, 0
	bl sub_8125BF8
	ldr r1, _08125BE0 @ =0x00000ff8
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _08125BE4 @ =_08012024
	cmp r1, r0
	bne _08125BF0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8125C10
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08125BE8 @ =0x00000ff4
	adds r1, r5, r2
	ldrh r1, [r1]
	cmp r1, r0
	bne _08125BEC
	movs r2, 0
	cmp r2, r4
	bcs _08125BD6
_08125BC4:
	adds r1, r6, r2
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bcc _08125BC4
_08125BD6:
	movs r0, 0x1
	b _08125BF2
	.align 2, 0
_08125BDC: .4byte 0x02000000
_08125BE0: .4byte 0x00000ff8
_08125BE4: .4byte _08012024
_08125BE8: .4byte 0x00000ff4
_08125BEC:
	movs r0, 0x2
	b _08125BF2
_08125BF0:
	movs r0, 0
_08125BF2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8125B88

	thumb_func_start sub_8125BF8
sub_8125BF8: @ 8125BF8
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	bl ReadFlash
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8125BF8

	thumb_func_start sub_8125C10
sub_8125C10: @ 8125C10
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r2, 0
	movs r3, 0
	lsrs r1, 18
	cmp r2, r1
	bcs _08125C2E
_08125C20:
	ldm r4!, {r0}
	adds r2, r0
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _08125C20
_08125C2E:
	lsrs r0, r2, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125C10

	thumb_func_start sub_8125C3C
sub_8125C3C: @ 8125C3C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08125CB6
	lsls r0, 2
	ldr r1, _08125C50 @ =_08125C54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08125C50: .4byte _08125C54
	.align 2, 0
_08125C54:
	.4byte _08125CB6
	.4byte _08125CD8
	.4byte _08125CF8
	.4byte _08125C82
	.4byte _08125D0C
	.4byte _08125C6C
_08125C6C:
	movs r4, 0x1C
	ldr r5, _08125CC4 @ =EraseFlashSector
_08125C70:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08125C70
_08125C82:
	movs r0, 0xA
	bl sub_8053108
	ldr r1, _08125CC8 @ =0x000003e6
	cmp r0, r1
	bhi _08125C94
	movs r0, 0xA
	bl sav12_xor_increment
_08125C94:
	movs r4, 0
	ldr r5, _08125CCC @ =gHallOfFameSaveSectionLocations
_08125C98:
	adds r0, r4, 0
	adds r0, 0x1C
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r4, 3
	adds r2, r5
	ldr r1, [r2]
	ldrh r2, [r2, 0x4]
	bl sub_81253C8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08125C98
_08125CB6:
	bl SaveSerializedGame
	ldr r0, _08125CD0 @ =0x0000ffff
	ldr r1, _08125CD4 @ =gSaveSectionLocations
	bl save_write_to_flash
	b _08125D2E
	.align 2, 0
_08125CC4: .4byte EraseFlashSector
_08125CC8: .4byte 0x000003e6
_08125CCC: .4byte gHallOfFameSaveSectionLocations
_08125CD0: .4byte 0x0000ffff
_08125CD4: .4byte gSaveSectionLocations
_08125CD8:
	bl SaveSerializedGame
	movs r4, 0
_08125CDE:
	adds r0, r4, 0
	ldr r1, _08125CF4 @ =gSaveSectionLocations
	bl save_write_to_flash
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08125CDE
	b _08125D2E
	.align 2, 0
_08125CF4: .4byte gSaveSectionLocations
_08125CF8:
	bl SaveSerializedGame
	ldr r1, _08125D08 @ =gSaveSectionLocations
	movs r0, 0
	bl save_write_to_flash
	b _08125D2E
	.align 2, 0
_08125D08: .4byte gSaveSectionLocations
_08125D0C:
	movs r4, 0x1C
	ldr r5, _08125D38 @ =EraseFlashSector
_08125D10:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08125D10
	bl SaveSerializedGame
	ldr r0, _08125D3C @ =0x0000ffff
	ldr r1, _08125D40 @ =gSaveSectionLocations
	bl save_write_to_flash
_08125D2E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08125D38: .4byte EraseFlashSector
_08125D3C: .4byte 0x0000ffff
_08125D40: .4byte gSaveSectionLocations
	thumb_func_end sub_8125C3C

	thumb_func_start sub_8125D44
sub_8125D44: @ 8125D44
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08125D58 @ =gUnknown_3004820
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08125D5C
	movs r0, 0xFF
	b _08125D7A
	.align 2, 0
_08125D58: .4byte gUnknown_3004820
_08125D5C:
	adds r0, r4, 0
	bl sub_8125C3C
	ldr r0, _08125D74 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125D78
	adds r0, r4, 0
	bl fullscreen_save_activate
	movs r0, 0xFF
	b _08125D7A
	.align 2, 0
_08125D74: .4byte gUnknown_03005EA8
_08125D78:
	movs r0, 0x1
_08125D7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125D44

	thumb_func_start sub_8125D80
sub_8125D80: @ 8125D80
	push {lr}
	ldr r0, _08125D98 @ =gUnknown_3004820
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08125DA0
	bl SaveSerializedGame
	ldr r0, _08125D9C @ =gSaveSectionLocations
	bl sub_812546C
	movs r0, 0
	b _08125DA2
	.align 2, 0
_08125D98: .4byte gUnknown_3004820
_08125D9C: .4byte gSaveSectionLocations
_08125DA0:
	movs r0, 0x1
_08125DA2:
	pop {r1}
	bx r1
	thumb_func_end sub_8125D80

	thumb_func_start sub_8125DA8
sub_8125DA8: @ 8125DA8
	push {r4,lr}
	ldr r1, _08125DCC @ =gSaveSectionLocations
	movs r0, 0xE
	bl sub_812550C
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08125DD0 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125DC4
	movs r0, 0
	bl fullscreen_save_activate
_08125DC4:
	cmp r4, 0xFF
	beq _08125DD4
	movs r0, 0
	b _08125DD6
	.align 2, 0
_08125DCC: .4byte gSaveSectionLocations
_08125DD0: .4byte gUnknown_03005EA8
_08125DD4:
	movs r0, 0x1
_08125DD6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125DA8

	thumb_func_start sub_8125DDC
sub_8125DDC: @ 8125DDC
	push {lr}
	ldr r1, _08125DFC @ =gSaveSectionLocations
	movs r0, 0xE
	bl sub_812556C
	ldr r0, _08125E00 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125DF4
	movs r0, 0
	bl fullscreen_save_activate
_08125DF4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08125DFC: .4byte gSaveSectionLocations
_08125E00: .4byte gUnknown_03005EA8
	thumb_func_end sub_8125DDC

	thumb_func_start sub_8125E04
sub_8125E04: @ 8125E04
	push {lr}
	ldr r1, _08125E24 @ =gSaveSectionLocations
	movs r0, 0xE
	bl sub_8125758
	ldr r0, _08125E28 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125E1C
	movs r0, 0
	bl fullscreen_save_activate
_08125E1C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08125E24: .4byte gSaveSectionLocations
_08125E28: .4byte gUnknown_03005EA8
	thumb_func_end sub_8125E04

	thumb_func_start sub_8125E2C
sub_8125E2C: @ 8125E2C
	push {r4,lr}
	ldr r0, _08125E58 @ =gUnknown_3004820
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08125E64
	bl SaveSerializedGame
	ldr r4, _08125E5C @ =gSaveSectionLocations
	adds r0, r4, 0
	bl sub_81254C8
	ldr r0, _08125E60 @ =gUnknown_03005EB4
	ldrh r0, [r0]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_812556C
	movs r0, 0
	b _08125E66
	.align 2, 0
_08125E58: .4byte gUnknown_3004820
_08125E5C: .4byte gSaveSectionLocations
_08125E60: .4byte gUnknown_03005EB4
_08125E64:
	movs r0, 0x1
_08125E66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125E2C

	thumb_func_start sub_8125E6C
sub_8125E6C: @ 8125E6C
	push {r4-r6,lr}
	movs r6, 0
	ldr r0, _08125E98 @ =gUnknown_03005EB4
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bhi _08125EA0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08125E9C @ =gSaveSectionLocations
	adds r1, r4, 0
	bl sub_812556C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81257F0
	b _08125EAA
	.align 2, 0
_08125E98: .4byte gUnknown_03005EB4
_08125E9C: .4byte gSaveSectionLocations
_08125EA0:
	ldr r1, _08125EC0 @ =gSaveSectionLocations
	adds r0, r5, 0
	bl sub_81257F0
	movs r6, 0x1
_08125EAA:
	ldr r0, _08125EC4 @ =gUnknown_03005EA8
	ldr r0, [r0]
	cmp r0, 0
	beq _08125EB8
	movs r0, 0x1
	bl fullscreen_save_activate
_08125EB8:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08125EC0: .4byte gSaveSectionLocations
_08125EC4: .4byte gUnknown_03005EA8
	thumb_func_end sub_8125E6C

	thumb_func_start sub_8125EC8
sub_8125EC8: @ 8125EC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08125EE0 @ =gUnknown_3004820
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08125EE8
	ldr r1, _08125EE4 @ =gSaveFileStatus
	movs r0, 0x4
	strh r0, [r1]
	movs r0, 0xFF
	b _08125F40
	.align 2, 0
_08125EE0: .4byte gUnknown_3004820
_08125EE4: .4byte gSaveFileStatus
_08125EE8:
	cmp r1, 0
	beq _08125EF0
	cmp r1, 0x3
	beq _08125F1C
_08125EF0:
	ldr r0, _08125F0C @ =0x0000ffff
	ldr r1, _08125F10 @ =gSaveSectionLocations
	bl sub_812587C
	lsls r0, 24
	lsrs r4, r0, 24
	bl LoadSerializedGame
	ldr r0, _08125F14 @ =gSaveFileStatus
	strh r4, [r0]
	ldr r1, _08125F18 @ =gUnknown_03005EBC
	movs r0, 0
	str r0, [r1]
	b _08125F3E
	.align 2, 0
_08125F0C: .4byte 0x0000ffff
_08125F10: .4byte gSaveSectionLocations
_08125F14: .4byte gSaveFileStatus
_08125F18: .4byte gUnknown_03005EBC
_08125F1C:
	ldr r5, _08125F48 @ =gHallOfFameSaveSectionLocations
	ldr r1, [r5]
	ldrh r2, [r5, 0x4]
	movs r0, 0x1C
	bl sub_8125B88
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08125F3E
	ldr r1, [r5, 0x8]
	ldrh r2, [r5, 0xC]
	movs r0, 0x1D
	bl sub_8125B88
	lsls r0, 24
	lsrs r4, r0, 24
_08125F3E:
	adds r0, r4, 0
_08125F40:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08125F48: .4byte gHallOfFameSaveSectionLocations
	thumb_func_end sub_8125EC8

	thumb_func_start unref_sub_8125F4C
unref_sub_8125F4C: @ 8125F4C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	movs r1, 0
	ldr r6, _08125F88 @ =gUnknown_08401E24
	movs r5, 0
	ldr r3, _08125F8C @ =0x00000fff
_08125F5A:
	adds r0, r2, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08125F5A
	ldrb r0, [r6]
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	ldr r1, _08125F90 @ =0x00000ff4
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r0, _08125F94 @ =_08012024
	cmp r1, r0
	bne _08125F98
	movs r0, 0x1
	b _08125F9A
	.align 2, 0
_08125F88: .4byte gUnknown_08401E24
_08125F8C: .4byte 0x00000fff
_08125F90: .4byte 0x00000ff4
_08125F94: .4byte _08012024
_08125F98:
	movs r0, 0
_08125F9A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125F4C

	thumb_func_start unref_sub_8125FA0
unref_sub_8125FA0: @ 8125FA0
	push {r4-r7,lr}
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _08125FD0 @ =EraseFlashSector
	ldr r6, _08125FD4 @ =gUnknown_08401E24
_08125FB2:
	adds r0, r4, r6
	ldrb r0, [r0]
	ldr r1, [r7]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08125FB2
	cmp r5, 0xFF
	bne _08125FD8
	movs r0, 0x3
	b _08125FE8
	.align 2, 0
_08125FD0: .4byte EraseFlashSector
_08125FD4: .4byte gUnknown_08401E24
_08125FD8:
	cmp r5, 0x3
	beq _08125FE6
	movs r0, 0
	bl sub_8125EC8
	movs r0, 0x1
	b _08125FE8
_08125FE6:
	movs r0, 0x2
_08125FE8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125FA0

	thumb_func_start unref_sub_8125FF0
unref_sub_8125FF0: @ 8125FF0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r4, _08126048 @ =0x02000000
	movs r2, 0
	ldr r7, _0812604C @ =gUnknown_08401E24
	movs r5, 0
	ldr r1, _08126050 @ =0x00000fff
_08126002:
	adds r0, r4, r2
	strb r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bls _08126002
	ldr r0, _08126054 @ =0x00000ff4
	adds r1, r4, r0
	ldr r0, _08126058 @ =_08012024
	str r0, [r1]
	movs r2, 0
	cmp r2, r3
	bcs _08126030
_0812601E:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bcc _0812601E
_08126030:
	ldrb r0, [r7]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r4, 0
	bl ProgramFlashSectorAndVerifyNBytes
	ldr r1, _0812605C @ =gUnknown_02039284
	str r0, [r1]
	cmp r0, 0
	bne _08126060
	movs r0, 0x1
	b _08126062
	.align 2, 0
_08126048: .4byte 0x02000000
_0812604C: .4byte gUnknown_08401E24
_08126050: .4byte 0x00000fff
_08126054: .4byte 0x00000ff4
_08126058: .4byte _08012024
_0812605C: .4byte gUnknown_02039284
_08126060:
	movs r0, 0xFF
_08126062:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125FF0

	thumb_func_start unref_sub_8126068
unref_sub_8126068: @ 8126068
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl ProgramFlashSectorAndVerify
	cmp r0, 0
	bne _0812607A
	movs r0, 0x1
	b _0812607C
_0812607A:
	movs r0, 0xFF
_0812607C:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8126068

	thumb_func_start unref_sub_8126080
unref_sub_8126080: @ 8126080
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	bl ReadFlash
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8126080

	.align 2, 0 @ Don't pad with nop.
