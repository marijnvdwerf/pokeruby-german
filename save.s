	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ClearSaveData
ClearSaveData: @ 8125514
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08125534
_0812551A:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0812551A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08125534: .4byte EraseFlashSector
	thumb_func_end ClearSaveData

	thumb_func_start sub_81251B8
sub_81251B8: @ 8125538
	ldr r0, _08125548
	movs r1, 0
	str r1, [r0]
	ldr r0, _0812554C
	strh r1, [r0]
	ldr r0, _08125550
	str r1, [r0]
	bx lr
	.align 2, 0
_08125548: .4byte gUnknown_03005EAC
_0812554C: .4byte gUnknown_03005E9C
_08125550: .4byte gUnknown_03005EA8
	thumb_func_end sub_81251B8

	thumb_func_start sub_81251D4
sub_81251D4: @ 8125554
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r4, 0
	cmp r0, 0x1
	beq _08125588
	cmp r0, 0x1
	bgt _0812556E
	cmp r0, 0
	beq _08125574
	b _081255AC
_0812556E:
	cmp r0, 0x2
	beq _0812559C
	b _081255AC
_08125574:
	ldr r2, _08125584
	movs r1, 0x1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _081255AC
	.align 2, 0
_08125584: .4byte gUnknown_03005EA8
_08125588:
	ldr r2, _08125598
	adds r1, r0, 0
	lsls r1, r3
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	b _081255AC
	.align 2, 0
_08125598: .4byte gUnknown_03005EA8
_0812559C:
	ldr r0, _081255B4
	movs r1, 0x1
	lsls r1, r3
	ldr r0, [r0]
	ands r0, r1
	cmp r0, 0
	beq _081255AC
	movs r4, 0x1
_081255AC:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081255B4: .4byte gUnknown_03005EA8
	thumb_func_end sub_81251D4

	thumb_func_start save_write_to_flash
save_write_to_flash: @ 81255B8
	push {r4-r7,lr}
	adds r7, r1, 0
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _081255DC
	ldr r0, _081255E0
	str r0, [r1]
	ldr r0, _081255E4
	cmp r2, r0
	beq _081255E8
	adds r0, r2, 0
	adds r1, r7, 0
	bl sub_81252D8
	lsls r0, 24
	lsrs r5, r0, 24
	b _0812563A
	.align 2, 0
_081255DC: .4byte gUnknown_03005EB0
_081255E0: .4byte 0x02000000
_081255E4: .4byte 0x0000ffff
_081255E8:
	ldr r1, _08125644
	ldr r5, _08125648
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _0812564C
	ldr r6, _08125650
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
_0812560E:
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_81252D8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _0812560E
	ldr r0, _08125654
	ldr r0, [r0]
	cmp r0, 0
	beq _0812563A
	movs r5, 0xFF
	ldr r1, _08125648
	ldr r0, _08125644
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08125650
	ldr r0, _0812564C
	ldr r0, [r0]
	str r0, [r1]
_0812563A:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08125644: .4byte gUnknown_03005EA4
_08125648: .4byte gUnknown_03005E9C
_0812564C: .4byte gUnknown_03005EA0
_08125650: .4byte gUnknown_03005EAC
_08125654: .4byte gUnknown_03005EA8
	thumb_func_end save_write_to_flash

	thumb_func_start sub_81252D8
sub_81252D8: @ 8125658
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08125724
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _08125728
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
	ldr r2, _0812572C
	mov r12, r2
	mov r8, r12
	movs r2, 0
	ldr r1, _08125730
_081256AA:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3
	strb r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bls _081256AA
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _08125734
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, _08125738
	adds r2, r1, r3
	ldr r0, _0812573C
	str r0, [r2]
	ldr r6, _08125740
	adds r1, r6
	mov r7, r9
	ldr r0, [r7]
	str r0, [r1]
	movs r3, 0
	lsls r5, 24
	cmp r3, r4
	bcs _081256F8
	mov r2, r12
_081256E2:
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
	bcc _081256E2
_081256F8:
	mov r0, r10
	adds r1, r4, 0
	bl sub_8125C10
	ldr r1, _0812572C
	ldr r1, [r1]
	ldr r7, _08125744
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
_08125724: .4byte gUnknown_03005E9C
_08125728: .4byte gUnknown_03005EAC
_0812572C: .4byte gUnknown_03005EB0
_08125730: .4byte 0x00000fff
_08125734: .4byte 0x00000ff4
_08125738: .4byte 0x00000ff8
_0812573C: .4byte _08012024
_08125740: .4byte 0x00000ffc
_08125744: .4byte 0x00000ff6
	thumb_func_end sub_81252D8

	thumb_func_start sub_81253C8
sub_81253C8: @ 8125748
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _081257AC
	movs r3, 0
	movs r6, 0
	ldr r1, _081257B0
_0812575C:
	adds r0, r4, r3
	strb r6, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bls _0812575C
	ldr r0, _081257B4
	adds r1, r4, r0
	ldr r0, _081257B8
	str r0, [r1]
	movs r3, 0
	cmp r3, r2
	bcs _0812578A
_08125778:
	adds r1, r4, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _08125778
_0812578A:
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_8125C10
	ldr r2, _081257BC
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
_081257AC: .4byte 0x02000000
_081257B0: .4byte 0x00000fff
_081257B4: .4byte 0x00000ff8
_081257B8: .4byte _08012024
_081257BC: .4byte 0x00000ff4
	thumb_func_end sub_81253C8

	thumb_func_start sub_8125440
sub_8125440: @ 81257C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl ProgramFlashSectorAndVerify
	cmp r0, 0
	bne _081257DC
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_81251D4
	movs r0, 0x1
	b _081257E6
_081257DC:
	movs r0, 0
	adds r1, r4, 0
	bl sub_81251D4
	movs r0, 0xFF
_081257E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125440

	thumb_func_start sub_812546C
sub_812546C: @ 81257EC
	push {r4-r6,lr}
	ldr r1, _08125828
	ldr r0, _0812582C
	str r0, [r1]
	ldr r1, _08125830
	ldr r5, _08125834
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _08125838
	ldr r6, _0812583C
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
	ldr r1, _08125840
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08125844
	movs r0, 0
	str r0, [r1]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08125828: .4byte gUnknown_03005EB0
_0812582C: .4byte 0x02000000
_08125830: .4byte gUnknown_03005EA4
_08125834: .4byte gUnknown_03005E9C
_08125838: .4byte gUnknown_03005EA0
_0812583C: .4byte gUnknown_03005EAC
_08125840: .4byte gUnknown_03005EB4
_08125844: .4byte gUnknown_03005EA8
	thumb_func_end sub_812546C

	thumb_func_start sub_81254C8
sub_81254C8: @ 8125848
	ldr r1, _0812586C
	ldr r0, _08125870
	str r0, [r1]
	ldr r1, _08125874
	ldr r0, _08125878
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0812587C
	ldr r0, _08125880
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08125884
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08125888
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0812586C: .4byte gUnknown_03005EB0
_08125870: .4byte 0x02000000
_08125874: .4byte gUnknown_03005EA4
_08125878: .4byte gUnknown_03005E9C
_0812587C: .4byte gUnknown_03005EA0
_08125880: .4byte gUnknown_03005EAC
_08125884: .4byte gUnknown_03005EB4
_08125888: .4byte gUnknown_03005EA8
	thumb_func_end sub_81254C8

	thumb_func_start sub_812550C
sub_812550C: @ 812588C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _081258C8
	ldrh r2, [r4]
	subs r0, 0x1
	cmp r2, r0
	bge _081258E0
	movs r5, 0x1
	adds r0, r2, 0
	bl sub_81252D8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldr r0, _081258CC
	ldr r0, [r0]
	cmp r0, 0
	beq _081258E2
	movs r5, 0xFF
	ldr r1, _081258D0
	ldr r0, _081258D4
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _081258D8
	ldr r0, _081258DC
	ldr r0, [r0]
	str r0, [r1]
	b _081258E2
	.align 2, 0
_081258C8: .4byte gUnknown_03005EB4
_081258CC: .4byte gUnknown_03005EA8
_081258D0: .4byte gUnknown_03005E9C
_081258D4: .4byte gUnknown_03005EA4
_081258D8: .4byte gUnknown_03005EAC
_081258DC: .4byte gUnknown_03005EA0
_081258E0:
	movs r5, 0xFF
_081258E2:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_812550C

	thumb_func_start sub_812556C
sub_812556C: @ 81258EC
	push {r4,lr}
	lsls r0, 16
	movs r4, 0x1
	ldr r2, _08125920
	adds r0, r2
	lsrs r0, 16
	bl sub_81255B8
	ldr r0, _08125924
	ldr r0, [r0]
	cmp r0, 0
	beq _08125916
	movs r4, 0xFF
	ldr r1, _08125928
	ldr r0, _0812592C
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08125930
	ldr r0, _08125934
	ldr r0, [r0]
	str r0, [r1]
_08125916:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08125920: .4byte 0xffff0000
_08125924: .4byte gUnknown_03005EA8
_08125928: .4byte gUnknown_03005E9C
_0812592C: .4byte gUnknown_03005EA4
_08125930: .4byte gUnknown_03005EAC
_08125934: .4byte gUnknown_03005EA0
	thumb_func_end sub_812556C

	thumb_func_start sub_81255B8
sub_81255B8: @ 8125938
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08125A04
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, 0
	movs r1, 0xE
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _08125A08
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
	ldr r2, _08125A0C
	mov r12, r2
	mov r8, r12
	movs r2, 0
	ldr r1, _08125A10
_0812598A:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r4
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	bls _0812598A
	mov r0, r12
	ldr r1, [r0]
	ldr r2, _08125A14
	adds r0, r1, r2
	strh r6, [r0]
	ldr r6, _08125A18
	adds r2, r1, r6
	ldr r0, _08125A1C
	str r0, [r2]
	ldr r7, _08125A20
	adds r1, r7
	mov r2, r9
	ldr r0, [r2]
	str r0, [r1]
	movs r4, 0
	lsls r6, r5, 24
	mov r8, r6
	cmp r4, r3
	bcs _081259DA
	mov r2, r12
_081259C4:
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
	bcc _081259C4
_081259DA:
	mov r0, r10
	adds r1, r3, 0
	bl sub_8125C10
	ldr r1, _08125A0C
	ldr r1, [r1]
	ldr r2, _08125A24
	adds r1, r2
	strh r0, [r1]
	ldr r0, _08125A28
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	movs r6, 0x1
	movs r4, 0
	ldr r7, _08125A2C
	mov r9, r7
	ldr r7, _08125A30
	b _08125A3A
	.align 2, 0
_08125A04: .4byte gUnknown_03005E9C
_08125A08: .4byte gUnknown_03005EAC
_08125A0C: .4byte gUnknown_03005EB0
_08125A10: .4byte 0x00000fff
_08125A14: .4byte 0x00000ff4
_08125A18: .4byte 0x00000ff8
_08125A1C: .4byte _08012024
_08125A20: .4byte 0x00000ffc
_08125A24: .4byte 0x00000ff6
_08125A28: .4byte EraseFlashSector
_08125A2C: .4byte 0x00000ff7
_08125A30: .4byte ProgramFlashByte
_08125A34:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08125A3A:
	cmp r4, r9
	bhi _08125A58
	ldr r0, _08125A64
	ldr r0, [r0]
	adds r0, r4
	ldrb r2, [r0]
	ldr r3, [r7]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	beq _08125A34
	movs r6, 0xFF
_08125A58:
	cmp r6, 0xFF
	bne _08125A68
	mov r0, r8
	lsrs r1, r0, 24
	b _08125AC0
	.align 2, 0
_08125A64: .4byte gUnknown_03005EB0
_08125A68:
	movs r6, 0x1
	movs r4, 0
	ldr r1, _08125A74
	mov r9, r1
	ldr r7, _08125A78
	b _08125A82
	.align 2, 0
_08125A74: .4byte ProgramFlashByte
_08125A78: .4byte 0x00000ff9
_08125A7C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08125A82:
	cmp r4, 0x6
	bhi _08125AA4
	adds r1, r4, r7
	ldr r0, _08125AB8
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
	beq _08125A7C
	movs r6, 0xFF
_08125AA4:
	cmp r6, 0xFF
	beq _08125ABC
	mov r2, r8
	lsrs r1, r2, 24
	movs r0, 0x1
	bl sub_81251D4
	movs r0, 0x1
	b _08125AC8
	.align 2, 0
_08125AB8: .4byte gUnknown_03005EB0
_08125ABC:
	mov r6, r8
	lsrs r1, r6, 24
_08125AC0:
	movs r0, 0
	bl sub_81251D4
	movs r0, 0xFF
_08125AC8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81255B8

	thumb_func_start sub_8125758
sub_8125758: @ 8125AD8
	push {r4-r6,lr}
	lsls r0, 16
	ldr r6, _08125B34
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
	ldr r5, _08125B38
	ldr r1, [r5]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r3, _08125B3C
	ldr r1, _08125B40
	ldr r0, _08125B44
	ldr r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	bne _08125B48
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_81251D4
	movs r0, 0x1
	b _08125B60
	.align 2, 0
_08125B34: .4byte gUnknown_03005E9C
_08125B38: .4byte gUnknown_03005EAC
_08125B3C: .4byte ProgramFlashByte
_08125B40: .4byte 0x00000ff8
_08125B44: .4byte gUnknown_03005EB0
_08125B48:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_81251D4
	ldr r0, _08125B68
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _08125B6C
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0xFF
_08125B60:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08125B68: .4byte gUnknown_03005EA4
_08125B6C: .4byte gUnknown_03005EA0
	thumb_func_end sub_8125758

	thumb_func_start sub_81257F0
sub_81257F0: @ 8125B70
	push {r4-r6,lr}
	lsls r0, 16
	ldr r6, _08125BC4
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
	ldr r5, _08125BC8
	ldr r1, [r5]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08125BCC
	ldr r1, _08125BD0
	ldr r3, [r0]
	adds r0, r4, 0
	movs r2, 0x25
	bl _call_via_r3
	lsls r0, 16
	cmp r0, 0
	bne _08125BD4
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0x1
	bl sub_81251D4
	movs r0, 0x1
	b _08125BEC
	.align 2, 0
_08125BC4: .4byte gUnknown_03005E9C
_08125BC8: .4byte gUnknown_03005EAC
_08125BCC: .4byte ProgramFlashByte
_08125BD0: .4byte 0x00000ff8
_08125BD4:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_81251D4
	ldr r0, _08125BF4
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _08125BF8
	ldr r0, [r0]
	str r0, [r5]
	movs r0, 0xFF
_08125BEC:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08125BF4: .4byte gUnknown_03005EA4
_08125BF8: .4byte gUnknown_03005EA0
	thumb_func_end sub_81257F0

	thumb_func_start sub_812587C
sub_812587C: @ 8125BFC
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _08125C14
	ldr r0, _08125C18
	str r0, [r1]
	ldr r0, _08125C1C
	cmp r4, r0
	beq _08125C20
	movs r5, 0xFF
	b _08125C32
	.align 2, 0
_08125C14: .4byte gUnknown_03005EB0
_08125C18: .4byte 0x02000000
_08125C1C: .4byte 0x0000ffff
_08125C20:
	adds r0, r6, 0
	bl sub_8125974
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_81258BC
_08125C32:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_812587C

	thumb_func_start sub_81258BC
sub_81258BC: @ 8125C3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r0, _08125CD8
	ldr r1, [r0]
	movs r0, 0x1
	ands r1, r0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 17
	lsrs r7, r0, 16
	movs r5, 0
	ldr r6, _08125CDC
_08125C58:
	adds r0, r5, r7
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r6]
	bl sub_8125BF8
	ldr r0, [r6]
	ldr r1, _08125CE0
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	bne _08125C74
	ldr r0, _08125CE4
	strh r5, [r0]
_08125C74:
	ldr r0, [r6]
	lsls r1, 3
	mov r2, r8
	adds r4, r1, r2
	ldrh r1, [r4, 0x4]
	bl sub_8125C10
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, [r6]
	ldr r1, _08125CE8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08125CEC
	adds r5, 0x1
	cmp r1, r0
	bne _08125CC4
	ldr r1, _08125CF0
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _08125CC4
	movs r2, 0
	ldrh r0, [r4, 0x4]
	cmp r2, r0
	bcs _08125CC4
	adds r3, r4, 0
	ldr r4, _08125CDC
_08125CAC:
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
	bcc _08125CAC
_08125CC4:
	lsls r0, r5, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _08125C58
	movs r0, 0x1
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08125CD8: .4byte gUnknown_03005EAC
_08125CDC: .4byte gUnknown_03005EB0
_08125CE0: .4byte 0x00000ff4
_08125CE4: .4byte gUnknown_03005E9C
_08125CE8: .4byte 0x00000ff8
_08125CEC: .4byte _08012024
_08125CF0: .4byte 0x00000ff6
	thumb_func_end sub_81258BC

	thumb_func_start sub_8125974
sub_8125974: @ 8125CF4
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
	ldr r7, _08125D80
_08125D10:
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, [r7]
	bl sub_8125BF8
	ldr r2, [r7]
	ldr r1, _08125D84
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08125D88
	cmp r1, r0
	bne _08125D60
	movs r5, 0x1
	ldr r3, _08125D8C
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
	ldr r3, _08125D90
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08125D60
	ldr r2, _08125D94
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r3, 0x2
	adds r1, r3
	adds r0, r5, 0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_08125D60:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _08125D10
	cmp r5, 0
	beq _08125D9C
	ldr r0, _08125D98
	movs r1, 0xFF
	str r1, [sp]
	cmp r6, r0
	bne _08125DA0
	movs r2, 0x1
	str r2, [sp]
	b _08125DA0
	.align 2, 0
_08125D80: .4byte gUnknown_03005EB0
_08125D84: .4byte 0x00000ff8
_08125D88: .4byte _08012024
_08125D8C: .4byte 0x00000ff4
_08125D90: .4byte 0x00000ff6
_08125D94: .4byte 0x00000ffc
_08125D98: .4byte 0x00003fff
_08125D9C:
	movs r3, 0
	str r3, [sp]
_08125DA0:
	movs r6, 0
	movs r5, 0
	movs r4, 0
	ldr r7, _08125E18
_08125DA8:
	adds r0, r4, 0
	adds r0, 0xE
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r7]
	bl sub_8125BF8
	ldr r2, [r7]
	ldr r1, _08125E1C
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08125E20
	cmp r1, r0
	bne _08125DFC
	movs r5, 0x1
	ldr r3, _08125E24
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
	ldr r3, _08125E28
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _08125DFC
	ldr r2, _08125E2C
	adds r0, r1, r2
	ldr r0, [r0]
	mov r9, r0
	subs r3, 0x2
	adds r1, r3
	adds r0, r5, 0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_08125DFC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xD
	bls _08125DA8
	cmp r5, 0
	beq _08125E34
	ldr r0, _08125E30
	movs r1, 0xFF
	cmp r6, r0
	bne _08125E36
	movs r1, 0x1
	b _08125E36
	.align 2, 0
_08125E18: .4byte gUnknown_03005EB0
_08125E1C: .4byte 0x00000ff8
_08125E20: .4byte _08012024
_08125E24: .4byte 0x00000ff4
_08125E28: .4byte 0x00000ff6
_08125E2C: .4byte 0x00000ffc
_08125E30: .4byte 0x00003fff
_08125E34:
	movs r1, 0
_08125E36:
	ldr r0, [sp]
	cmp r0, 0x1
	bne _08125EA8
	cmp r1, 0x1
	bne _08125E98
	movs r0, 0x1
	negs r0, r0
	cmp r8, r0
	bne _08125E4E
	mov r1, r9
	cmp r1, 0
	beq _08125E58
_08125E4E:
	mov r2, r8
	cmp r2, 0
	bne _08125E7C
	cmp r9, r0
	bne _08125E7C
_08125E58:
	mov r1, r8
	adds r1, 0x1
	mov r0, r9
	adds r0, 0x1
	cmp r1, r0
	bcs _08125E70
	ldr r0, _08125E6C
	mov r3, r9
	b _08125E90
	.align 2, 0
_08125E6C: .4byte gUnknown_03005EAC
_08125E70:
	ldr r0, _08125E78
	mov r1, r8
	str r1, [r0]
	b _08125EC0
	.align 2, 0
_08125E78: .4byte gUnknown_03005EAC
_08125E7C:
	cmp r8, r9
	bcs _08125E8C
	ldr r0, _08125E88
	mov r2, r9
	str r2, [r0]
	b _08125EC0
	.align 2, 0
_08125E88: .4byte gUnknown_03005EAC
_08125E8C:
	ldr r0, _08125E94
	mov r3, r8
_08125E90:
	str r3, [r0]
	b _08125EC0
	.align 2, 0
_08125E94: .4byte gUnknown_03005EAC
_08125E98:
	ldr r0, _08125EA4
	mov r2, r8
	str r2, [r0]
	cmp r1, 0xFF
	beq _08125EB8
	b _08125EC0
	.align 2, 0
_08125EA4: .4byte gUnknown_03005EAC
_08125EA8:
	cmp r1, 0x1
	bne _08125EC4
	ldr r0, _08125EBC
	mov r3, r9
	str r3, [r0]
	ldr r0, [sp]
	cmp r0, 0xFF
	bne _08125EC0
_08125EB8:
	movs r0, 0xFF
	b _08125EF0
	.align 2, 0
_08125EBC: .4byte gUnknown_03005EAC
_08125EC0:
	movs r0, 0x1
	b _08125EF0
_08125EC4:
	ldr r2, [sp]
	cmp r2, 0
	bne _08125EE4
	cmp r1, 0
	bne _08125EE4
	ldr r0, _08125EDC
	str r1, [r0]
	ldr r0, _08125EE0
	strh r1, [r0]
	movs r0, 0
	b _08125EF0
	.align 2, 0
_08125EDC: .4byte gUnknown_03005EAC
_08125EE0: .4byte gUnknown_03005E9C
_08125EE4:
	ldr r0, _08125F00
	movs r1, 0
	str r1, [r0]
	ldr r0, _08125F04
	strh r1, [r0]
	movs r0, 0x2
_08125EF0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08125F00: .4byte gUnknown_03005EAC
_08125F04: .4byte gUnknown_03005E9C
	thumb_func_end sub_8125974

	thumb_func_start sub_8125B88
sub_8125B88: @ 8125F08
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	ldr r5, _08125F5C
	adds r1, r5, 0
	bl sub_8125BF8
	ldr r1, _08125F60
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _08125F64
	cmp r1, r0
	bne _08125F70
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8125C10
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08125F68
	adds r1, r5, r2
	ldrh r1, [r1]
	cmp r1, r0
	bne _08125F6C
	movs r2, 0
	cmp r2, r4
	bcs _08125F56
_08125F44:
	adds r1, r6, r2
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bcc _08125F44
_08125F56:
	movs r0, 0x1
	b _08125F72
	.align 2, 0
_08125F5C: .4byte 0x02000000
_08125F60: .4byte 0x00000ff8
_08125F64: .4byte _08012024
_08125F68: .4byte 0x00000ff4
_08125F6C:
	movs r0, 0x2
	b _08125F72
_08125F70:
	movs r0, 0
_08125F72:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8125B88

	thumb_func_start sub_8125BF8
sub_8125BF8: @ 8125F78
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
sub_8125C10: @ 8125F90
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	movs r2, 0
	movs r3, 0
	lsrs r1, 18
	cmp r2, r1
	bcs _08125FAE
_08125FA0:
	ldm r4!, {r0}
	adds r2, r0
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _08125FA0
_08125FAE:
	lsrs r0, r2, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125C10

	thumb_func_start sub_8125C3C
sub_8125C3C: @ 8125FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08126036
	lsls r0, 2
	ldr r1, _08125FD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08125FD0: .4byte _08125FD4
	.align 2, 0
_08125FD4:
	.4byte _08126036
	.4byte _08126058
	.4byte _08126078
	.4byte _08126002
	.4byte _0812608C
	.4byte _08125FEC
_08125FEC:
	movs r4, 0x1C
	ldr r5, _08126044
_08125FF0:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08125FF0
_08126002:
	movs r0, 0xA
	bl sub_8053108
	ldr r1, _08126048
	cmp r0, r1
	bhi _08126014
	movs r0, 0xA
	bl sav12_xor_increment
_08126014:
	movs r4, 0
	ldr r5, _0812604C
_08126018:
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
	bls _08126018
_08126036:
	bl SaveSerializedGame
	ldr r0, _08126050
	ldr r1, _08126054
	bl save_write_to_flash
	b _081260AE
	.align 2, 0
_08126044: .4byte EraseFlashSector
_08126048: .4byte 0x000003e6
_0812604C: .4byte gHallOfFameSaveSectionLocations
_08126050: .4byte 0x0000ffff
_08126054: .4byte gSaveSectionLocations
_08126058:
	bl SaveSerializedGame
	movs r4, 0
_0812605E:
	adds r0, r4, 0
	ldr r1, _08126074
	bl save_write_to_flash
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0812605E
	b _081260AE
	.align 2, 0
_08126074: .4byte gSaveSectionLocations
_08126078:
	bl SaveSerializedGame
	ldr r1, _08126088
	movs r0, 0
	bl save_write_to_flash
	b _081260AE
	.align 2, 0
_08126088: .4byte gSaveSectionLocations
_0812608C:
	movs r4, 0x1C
	ldr r5, _081260B8
_08126090:
	ldr r1, [r5]
	adds r0, r4, 0
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08126090
	bl SaveSerializedGame
	ldr r0, _081260BC
	ldr r1, _081260C0
	bl save_write_to_flash
_081260AE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081260B8: .4byte EraseFlashSector
_081260BC: .4byte 0x0000ffff
_081260C0: .4byte gSaveSectionLocations
	thumb_func_end sub_8125C3C

	thumb_func_start sub_8125D44
sub_8125D44: @ 81260C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081260D8
	ldr r0, [r0]
	cmp r0, 0x1
	beq _081260DC
	movs r0, 0xFF
	b _081260FA
	.align 2, 0
_081260D8: .4byte gUnknown_3004820
_081260DC:
	adds r0, r4, 0
	bl sub_8125C3C
	ldr r0, _081260F4
	ldr r0, [r0]
	cmp r0, 0
	beq _081260F8
	adds r0, r4, 0
	bl fullscreen_save_activate
	movs r0, 0xFF
	b _081260FA
	.align 2, 0
_081260F4: .4byte gUnknown_03005EA8
_081260F8:
	movs r0, 0x1
_081260FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125D44

	thumb_func_start sub_8125D80
sub_8125D80: @ 8126100
	push {lr}
	ldr r0, _08126118
	ldr r0, [r0]
	cmp r0, 0x1
	bne _08126120
	bl SaveSerializedGame
	ldr r0, _0812611C
	bl sub_812546C
	movs r0, 0
	b _08126122
	.align 2, 0
_08126118: .4byte gUnknown_3004820
_0812611C: .4byte gSaveSectionLocations
_08126120:
	movs r0, 0x1
_08126122:
	pop {r1}
	bx r1
	thumb_func_end sub_8125D80

	thumb_func_start sub_8125DA8
sub_8125DA8: @ 8126128
	push {r4,lr}
	ldr r1, _0812614C
	movs r0, 0xE
	bl sub_812550C
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08126150
	ldr r0, [r0]
	cmp r0, 0
	beq _08126144
	movs r0, 0
	bl fullscreen_save_activate
_08126144:
	cmp r4, 0xFF
	beq _08126154
	movs r0, 0
	b _08126156
	.align 2, 0
_0812614C: .4byte gSaveSectionLocations
_08126150: .4byte gUnknown_03005EA8
_08126154:
	movs r0, 0x1
_08126156:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125DA8

	thumb_func_start sub_8125DDC
sub_8125DDC: @ 812615C
	push {lr}
	ldr r1, _0812617C
	movs r0, 0xE
	bl sub_812556C
	ldr r0, _08126180
	ldr r0, [r0]
	cmp r0, 0
	beq _08126174
	movs r0, 0
	bl fullscreen_save_activate
_08126174:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0812617C: .4byte gSaveSectionLocations
_08126180: .4byte gUnknown_03005EA8
	thumb_func_end sub_8125DDC

	thumb_func_start sub_8125E04
sub_8125E04: @ 8126184
	push {lr}
	ldr r1, _081261A4
	movs r0, 0xE
	bl sub_8125758
	ldr r0, _081261A8
	ldr r0, [r0]
	cmp r0, 0
	beq _0812619C
	movs r0, 0
	bl fullscreen_save_activate
_0812619C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081261A4: .4byte gSaveSectionLocations
_081261A8: .4byte gUnknown_03005EA8
	thumb_func_end sub_8125E04

	thumb_func_start sub_8125E2C
sub_8125E2C: @ 81261AC
	push {r4,lr}
	ldr r0, _081261D8
	ldr r0, [r0]
	cmp r0, 0x1
	bne _081261E4
	bl SaveSerializedGame
	ldr r4, _081261DC
	adds r0, r4, 0
	bl sub_81254C8
	ldr r0, _081261E0
	ldrh r0, [r0]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl sub_812556C
	movs r0, 0
	b _081261E6
	.align 2, 0
_081261D8: .4byte gUnknown_3004820
_081261DC: .4byte gSaveSectionLocations
_081261E0: .4byte gUnknown_03005EB4
_081261E4:
	movs r0, 0x1
_081261E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8125E2C

	thumb_func_start sub_8125E6C
sub_8125E6C: @ 81261EC
	push {r4-r6,lr}
	movs r6, 0
	ldr r0, _08126218
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bhi _08126220
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0812621C
	adds r1, r4, 0
	bl sub_812556C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81257F0
	b _0812622A
	.align 2, 0
_08126218: .4byte gUnknown_03005EB4
_0812621C: .4byte gSaveSectionLocations
_08126220:
	ldr r1, _08126240
	adds r0, r5, 0
	bl sub_81257F0
	movs r6, 0x1
_0812622A:
	ldr r0, _08126244
	ldr r0, [r0]
	cmp r0, 0
	beq _08126238
	movs r0, 0x1
	bl fullscreen_save_activate
_08126238:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08126240: .4byte gSaveSectionLocations
_08126244: .4byte gUnknown_03005EA8
	thumb_func_end sub_8125E6C

	thumb_func_start sub_8125EC8
sub_8125EC8: @ 8126248
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08126260
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08126268
	ldr r1, _08126264
	movs r0, 0x4
	strh r0, [r1]
	movs r0, 0xFF
	b _081262C0
	.align 2, 0
_08126260: .4byte gUnknown_3004820
_08126264: .4byte gSaveFileStatus
_08126268:
	cmp r1, 0
	beq _08126270
	cmp r1, 0x3
	beq _0812629C
_08126270:
	ldr r0, _0812628C
	ldr r1, _08126290
	bl sub_812587C
	lsls r0, 24
	lsrs r4, r0, 24
	bl LoadSerializedGame
	ldr r0, _08126294
	strh r4, [r0]
	ldr r1, _08126298
	movs r0, 0
	str r0, [r1]
	b _081262BE
	.align 2, 0
_0812628C: .4byte 0x0000ffff
_08126290: .4byte gSaveSectionLocations
_08126294: .4byte gSaveFileStatus
_08126298: .4byte gUnknown_03005EBC
_0812629C:
	ldr r5, _081262C8
	ldr r1, [r5]
	ldrh r2, [r5, 0x4]
	movs r0, 0x1C
	bl sub_8125B88
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _081262BE
	ldr r1, [r5, 0x8]
	ldrh r2, [r5, 0xC]
	movs r0, 0x1D
	bl sub_8125B88
	lsls r0, 24
	lsrs r4, r0, 24
_081262BE:
	adds r0, r4, 0
_081262C0:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081262C8: .4byte gHallOfFameSaveSectionLocations
	thumb_func_end sub_8125EC8

	thumb_func_start unref_sub_8125F4C
unref_sub_8125F4C: @ 81262CC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	movs r1, 0
	ldr r6, _08126308
	movs r5, 0
	ldr r3, _0812630C
_081262DA:
	adds r0, r2, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _081262DA
	ldrb r0, [r6]
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	ldr r1, _08126310
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r0, _08126314
	cmp r1, r0
	bne _08126318
	movs r0, 0x1
	b _0812631A
	.align 2, 0
_08126308: .4byte gUnknown_08401E24
_0812630C: .4byte 0x00000fff
_08126310: .4byte 0x00000ff4
_08126314: .4byte _08012024
_08126318:
	movs r0, 0
_0812631A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125F4C

	thumb_func_start unref_sub_8125FA0
unref_sub_8125FA0: @ 8126320
	push {r4-r7,lr}
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _08126350
	ldr r6, _08126354
_08126332:
	adds r0, r4, r6
	ldrb r0, [r0]
	ldr r1, [r7]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08126332
	cmp r5, 0xFF
	bne _08126358
	movs r0, 0x3
	b _08126368
	.align 2, 0
_08126350: .4byte EraseFlashSector
_08126354: .4byte gUnknown_08401E24
_08126358:
	cmp r5, 0x3
	beq _08126366
	movs r0, 0
	bl sub_8125EC8
	movs r0, 0x1
	b _08126368
_08126366:
	movs r0, 0x2
_08126368:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125FA0

	thumb_func_start unref_sub_8125FF0
unref_sub_8125FF0: @ 8126370
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r4, _081263C8
	movs r2, 0
	ldr r7, _081263CC
	movs r5, 0
	ldr r1, _081263D0
_08126382:
	adds r0, r4, r2
	strb r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bls _08126382
	ldr r0, _081263D4
	adds r1, r4, r0
	ldr r0, _081263D8
	str r0, [r1]
	movs r2, 0
	cmp r2, r3
	bcs _081263B0
_0812639E:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bcc _0812639E
_081263B0:
	ldrb r0, [r7]
	movs r2, 0x80
	lsls r2, 5
	adds r1, r4, 0
	bl ProgramFlashSectorAndVerifyNBytes
	ldr r1, _081263DC
	str r0, [r1]
	cmp r0, 0
	bne _081263E0
	movs r0, 0x1
	b _081263E2
	.align 2, 0
_081263C8: .4byte 0x02000000
_081263CC: .4byte gUnknown_08401E24
_081263D0: .4byte 0x00000fff
_081263D4: .4byte 0x00000ff4
_081263D8: .4byte _08012024
_081263DC: .4byte gUnknown_02039284
_081263E0:
	movs r0, 0xFF
_081263E2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8125FF0

	thumb_func_start unref_sub_8126068
unref_sub_8126068: @ 81263E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl ProgramFlashSectorAndVerify
	cmp r0, 0
	bne _081263FA
	movs r0, 0x1
	b _081263FC
_081263FA:
	movs r0, 0xFF
_081263FC:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8126068

	thumb_func_start unref_sub_8126080
unref_sub_8126080: @ 8126400
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
