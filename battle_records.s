	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810FF78
sub_810FF78: @ 811036C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08110398 @ =0x01000008
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110398: .4byte 0x01000008
	thumb_func_end sub_810FF78

	thumb_func_start InitLinkBattleRecords_
InitLinkBattleRecords_: @ 811039C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x4
_081103A2:
	adds r0, r4, 0
	bl sub_810FF78
	adds r4, 0x10
	subs r5, 0x1
	cmp r5, 0
	bge _081103A2
	movs r0, 0x17
	movs r1, 0
	bl sav12_xor_set
	movs r0, 0x18
	movs r1, 0
	bl sav12_xor_set
	movs r0, 0x19
	movs r1, 0
	bl sav12_xor_set
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end InitLinkBattleRecords_

	thumb_func_start sub_810FFDC
sub_810FFDC: @ 81103D0
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	ldrh r1, [r1, 0xE]
	adds r0, r1
	bx lr
	thumb_func_end sub_810FFDC

	thumb_func_start sub_810FFEC
sub_810FFEC: @ 81103E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	movs r5, 0
	ldr r6, _08110418 @ =gStringVar1
	adds r4, r0, 0
_081103F2:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x7
	bl memcpy
	movs r0, 0xFF
	strb r0, [r6, 0x7]
	adds r0, r6, 0
	mov r1, r8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _0811041C
	ldrh r0, [r4, 0x8]
	cmp r0, r7
	bne _0811041C
	adds r0, r5, 0
	b _08110426
	.align 2, 0
_08110418: .4byte gStringVar1
_0811041C:
	adds r4, 0x10
	adds r5, 0x1
	cmp r5, 0x4
	ble _081103F2
	movs r0, 0x5
_08110426:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810FFEC

	thumb_func_start sub_811003C
sub_811003C: @ 8110430
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0x4
_0811043E:
	subs r2, r0, 0x1
	mov r9, r2
	cmp r2, 0
	blt _08110498
	lsls r0, 4
	mov r1, r8
	adds r6, r1, r0
	lsls r0, r2, 4
	adds r5, r0, r1
_08110450:
	adds r0, r6, 0
	str r2, [sp, 0x10]
	bl sub_810FFDC
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_810FFDC
	ldr r2, [sp, 0x10]
	cmp r4, r0
	ble _0811048A
	mov r1, sp
	adds r0, r6, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r6, 0
	adds r0, r5, 0
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r5, 0
	mov r0, sp
	ldm r0!, {r3,r4,r7}
	stm r1!, {r3,r4,r7}
	ldr r0, [r0]
	str r0, [r1]
_0811048A:
	subs r5, 0x10
	movs r0, 0x1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, 0
	bge _08110450
_08110498:
	adds r0, r2, 0
	cmp r0, 0
	bgt _0811043E
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811003C

	thumb_func_start sub_81100B8
sub_81100B8: @ 81104AC
	push {lr}
	adds r2, r0, 0
	cmp r1, 0x2
	beq _081104DC
	cmp r1, 0x2
	bgt _081104BE
	cmp r1, 0x1
	beq _081104C4
	b _08110506
_081104BE:
	cmp r1, 0x3
	beq _081104F4
	b _08110506
_081104C4:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081104D8 @ =0x0000270f
	cmp r0, r1
	bls _08110506
	strh r1, [r2, 0xA]
	b _08110506
	.align 2, 0
_081104D8: .4byte 0x0000270f
_081104DC:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _081104F0 @ =0x0000270f
	cmp r0, r1
	bls _08110506
	strh r1, [r2, 0xC]
	b _08110506
	.align 2, 0
_081104F0: .4byte 0x0000270f
_081104F4:
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811050C @ =0x0000270f
	cmp r0, r1
	bls _08110506
	strh r1, [r2, 0xE]
_08110506:
	pop {r0}
	bx r0
	.align 2, 0
_0811050C: .4byte 0x0000270f
	thumb_func_end sub_81100B8

	thumb_func_start sub_811011C
sub_811011C: @ 8110510
	push {r4,lr}
	cmp r0, 0x2
	beq _0811052A
	cmp r0, 0x2
	bgt _08110520
	cmp r0, 0x1
	beq _08110526
	b _08110542
_08110520:
	cmp r0, 0x3
	beq _0811052E
	b _08110542
_08110526:
	movs r4, 0x17
	b _08110530
_0811052A:
	movs r4, 0x18
	b _08110530
_0811052E:
	movs r4, 0x19
_08110530:
	adds r0, r4, 0
	bl sub_8053108
	ldr r1, _08110548 @ =0x0000270e
	cmp r0, r1
	bhi _08110542
	adds r0, r4, 0
	bl sav12_xor_increment
_08110542:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110548: .4byte 0x0000270e
	thumb_func_end sub_811011C

	thumb_func_start sub_8110158
sub_8110158: @ 811054C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	adds r7, r1, 0
	mov r10, r3
	ldr r0, [sp, 0x20]
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r10
	bl sub_811011C
	adds r0, r5, 0
	bl sub_811003C
	adds r0, r5, 0
	adds r1, r7, 0
	mov r2, r9
	bl sub_810FFEC
	adds r6, r0, 0
	cmp r6, 0x5
	bne _081105C0
	movs r6, 0x4
	adds r4, r5, 0
	adds r4, 0x40
	adds r0, r4, 0
	bl sub_810FF78
	mov r0, r8
	cmp r0, 0x1
	bne _081105AE
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x15
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	adds r0, 0x42
	adds r1, r7, 0
	movs r2, 0x5
	bl StringCopyN
	b _081105B8
_081105AE:
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCopyN
_081105B8:
	lsls r0, r6, 4
	adds r0, r5, r0
	mov r1, r9
	strh r1, [r0, 0x8]
_081105C0:
	lsls r0, r6, 4
	adds r0, r5, r0
	mov r1, r10
	bl sub_81100B8
	adds r0, r5, 0
	bl sub_811003C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8110158

	thumb_func_start InitLinkBattleRecords
InitLinkBattleRecords: @ 81105E0
	push {lr}
	ldr r0, _081105EC @ =0x020287ec
	bl InitLinkBattleRecords_
	pop {r0}
	bx r0
	.align 2, 0
_081105EC: .4byte 0x020287ec
	thumb_func_end InitLinkBattleRecords

	thumb_func_start sub_81101FC
sub_81101FC: @ 81105F0
	push {lr}
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	ldr r0, _08110614 @ =0x0202ffd4
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08110618 @ =0x0000270f
	cmp r0, r2
	bls _0811060E
	strh r2, [r1]
_0811060E:
	pop {r0}
	bx r0
	.align 2, 0
_08110614: .4byte 0x0202ffd4
_08110618: .4byte 0x0000270f
	thumb_func_end sub_81101FC

	thumb_func_start sub_8110228
sub_8110228: @ 811061C
	push {lr}
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	ldr r0, _08110640 @ =0x0202ffd6
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08110644 @ =0x0000270f
	cmp r0, r2
	bls _0811063A
	strh r2, [r1]
_0811063A:
	pop {r0}
	bx r0
	.align 2, 0
_08110640: .4byte 0x0202ffd6
_08110644: .4byte 0x0000270f
	thumb_func_end sub_8110228

	thumb_func_start sub_8110254
sub_8110254: @ 8110648
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811065C @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08110660
	cmp r0, 0x2
	beq _0811066E
	b _0811067C
	.align 2, 0
_0811065C: .4byte gUnknown_02024D26
_08110660:
	eors r0, r4
	bl sub_81101FC
	adds r0, r4, 0
	bl sub_8110228
	b _0811067C
_0811066E:
	movs r0, 0x1
	eors r0, r4
	bl sub_8110228
	adds r0, r4, 0
	bl sub_81101FC
_0811067C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8110254

	thumb_func_start sub_8110290
sub_8110290: @ 8110684
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8110254
	ldr r0, _081106C8 @ =0x020287ec
	lsls r2, r4, 3
	subs r2, r4
	lsls r2, 3
	ldr r3, _081106CC @ =0x0202fff0
	adds r1, r2, r3
	subs r3, 0x30
	adds r2, r3
	ldrh r2, [r2, 0xE]
	ldr r3, _081106D0 @ =gUnknown_02024D26
	ldrb r3, [r3]
	ldr r6, _081106D4 @ =gLinkPlayers
	ldr r5, _081106D8 @ =gLinkPlayerMapObjects
	lsls r4, 2
	adds r4, r5
	ldrb r5, [r4, 0x1]
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	adds r4, r6
	ldrb r4, [r4, 0x1A]
	str r4, [sp]
	bl sub_8110158
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081106C8: .4byte 0x020287ec
_081106CC: .4byte 0x0202fff0
_081106D0: .4byte gUnknown_02024D26
_081106D4: .4byte gLinkPlayers
_081106D8: .4byte gLinkPlayerMapObjects
	thumb_func_end sub_8110290

	thumb_func_start PrintLinkBattleWinsLossesDraws
PrintLinkBattleWinsLossesDraws: @ 81106DC
	push {r4,lr}
	ldr r4, _0811072C @ =gStringVar1
	movs r0, 0x17
	bl sub_8053108
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r4, _08110730 @ =gStringVar2
	movs r0, 0x18
	bl sub_8053108
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r4, _08110734 @ =gStringVar3
	movs r0, 0x19
	bl sub_8053108
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN_DigitWidth6
	ldr r0, _08110738 @ =gOtherText_WinRecord
	movs r1, 0x3
	movs r2, 0x3
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811072C: .4byte gStringVar1
_08110730: .4byte gStringVar2
_08110734: .4byte gStringVar3
_08110738: .4byte gOtherText_WinRecord
	thumb_func_end PrintLinkBattleWinsLossesDraws

	thumb_func_start PrintLinkBattleRecord
PrintLinkBattleRecord: @ 811073C
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldrh r0, [r7, 0xA]
	cmp r0, 0
	bne _081107B4
	ldr r0, [r7, 0xC]
	cmp r0, 0
	bne _081107B4
	mov r0, sp
	movs r2, 0xFC
	strb r2, [r0]
	mov r1, sp
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	mov r0, sp
	strb r2, [r0, 0x3]
	movs r0, 0x11
	strb r0, [r1, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x5]
	mov r4, sp
	adds r4, 0x6
	ldr r1, _081107AC @ =gOtherText_SevenDashes
	adds r0, r4, 0
	bl StringCopy
	mov r0, sp
	movs r1, 0x3
	adds r2, r6, 0
	bl MenuPrint
	ldr r1, _081107B0 @ =gOtherText_FourDashes
	adds r0, r4, 0
	bl StringCopy
	mov r0, sp
	movs r1, 0xB
	adds r2, r6, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0x11
	adds r2, r6, 0
	bl MenuPrint
	mov r0, sp
	movs r1, 0x17
	adds r2, r6, 0
	bl MenuPrint
	b _08110822
	.align 2, 0
_081107AC: .4byte gOtherText_SevenDashes
_081107B0: .4byte gOtherText_FourDashes
_081107B4:
	ldr r4, _0811082C @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x8
	bl StringFillWithTerminator
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x7
	bl StringCopyN
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r6, 0
	bl MenuPrint
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x6
	strb r0, [r4, 0x2]
	adds r5, r4, 0x3
	ldrh r1, [r7, 0xA]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl MenuPrint
	ldrh r1, [r7, 0xC]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0x11
	adds r2, r6, 0
	bl MenuPrint
	ldrh r1, [r7, 0xE]
	adds r0, r5, 0
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0x17
	adds r2, r6, 0
	bl MenuPrint
_08110822:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811082C: .4byte gStringVar1
	thumb_func_end PrintLinkBattleRecord

	thumb_func_start ShowLinkBattleRecords
ShowLinkBattleRecords: @ 8110830
	push {r4,lr}
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r0, _08110880 @ =gOtherText_BattleResults
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xF0
	bl sub_8072BD8
	ldr r0, _08110884 @ =0x020287ec
	bl PrintLinkBattleWinsLossesDraws
	ldr r0, _08110888 @ =gOtherText_WinLoseDraw
	movs r1, 0x58
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	movs r4, 0
_0811085E:
	lsls r0, r4, 4
	ldr r1, _08110884 @ =0x020287ec
	adds r0, r1
	adds r4, 0x1
	lsls r1, r4, 25
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	lsrs r1, 24
	bl PrintLinkBattleRecord
	cmp r4, 0x4
	ble _0811085E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110880: .4byte gOtherText_BattleResults
_08110884: .4byte 0x020287ec
_08110888: .4byte gOtherText_WinLoseDraw
	thumb_func_end ShowLinkBattleRecords

	thumb_func_start sub_8110494
sub_8110494: @ 811088C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081108AC @ =0x02024f4c
	ldr r2, _081108B0 @ =0x000004ae
	adds r1, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _081108D8
	lsls r0, 2
	ldr r1, _081108B4 @ =_081108B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081108AC: .4byte 0x02024f4c
_081108B0: .4byte 0x000004ae
_081108B4: .4byte _081108B8
	.align 2, 0
_081108B8:
	.4byte _081108D8
	.4byte _081108D8
	.4byte _081108D4
	.4byte _081108D4
	.4byte _081108D8
	.4byte _081108D8
	.4byte _081108D4
_081108D4:
	movs r0, 0x1
	b _081108DA
_081108D8:
	movs r0, 0
_081108DA:
	pop {r1}
	bx r1
	thumb_func_end sub_8110494

	thumb_func_start sub_81104E8
sub_81104E8: @ 81108E0
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 24
	adds r6, r3, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	ldr r0, _08110924 @ =0x0000270f
	cmp r4, r0
	bls _08110902
	adds r4, r0, 0
_08110902:
	ldr r0, _08110928 @ =gStringVar1
	adds r1, r4, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _0811092C @ =gOtherText_WinStreak
	adds r1, r5, 0x7
	lsls r1, 24
	lsrs r1, 24
	adds r2, r6, 0
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110924: .4byte 0x0000270f
_08110928: .4byte gStringVar1
_0811092C: .4byte gOtherText_WinStreak
	thumb_func_end sub_81104E8

	thumb_func_start sub_8110538
sub_8110538: @ 8110930
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0811095C @ =0x02024f4c
	lsrs r0, 23
	movs r2, 0x97
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08110960 @ =gOtherText_Record
	adds r2, r4, 0
	bl sub_81104E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811095C: .4byte 0x02024f4c
_08110960: .4byte gOtherText_Record
	thumb_func_end sub_8110538

	thumb_func_start sub_811056C
sub_811056C: @ 8110964
	push {lr}
	lsls r0, 24
	ldr r1, _08110980 @ =gSaveBlock2
	lsrs r0, 23
	ldr r2, _08110984 @ =0x00000574
	adds r1, r2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _08110988 @ =0x0000270f
	cmp r0, r1
	bls _0811097C
	adds r0, r1, 0
_0811097C:
	pop {r1}
	bx r1
	.align 2, 0
_08110980: .4byte gSaveBlock2
_08110984: .4byte 0x00000574
_08110988: .4byte 0x0000270f
	thumb_func_end sub_811056C

	thumb_func_start sub_8110594
sub_8110594: @ 811098C
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r4, 0
	bl sub_811056C
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl sub_8110494
	cmp r0, 0x1
	bne _081109C4
	ldr r0, _081109C0 @ =gOtherText_Current
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_81104E8
	b _081109D0
	.align 2, 0
_081109C0: .4byte gOtherText_Current
_081109C4:
	ldr r0, _081109D8 @ =gOtherText_Prev
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_81104E8
_081109D0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081109D8: .4byte gOtherText_Prev
	thumb_func_end sub_8110594

	thumb_func_start ShowBattleTowerRecords
ShowBattleTowerRecords: @ 81109DC
	push {r4,lr}
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1B
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _08110A50 @ =gOtherText_BattleTowerResults
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0xC8
	bl sub_8072BD8
	ldr r0, _08110A54 @ =gOtherText_Lv50
	movs r1, 0x5
	movs r2, 0x6
	bl MenuPrint
	ldr r0, _08110A58 @ =gOtherText_Lv100
	movs r1, 0x5
	movs r2, 0xC
	bl MenuPrint
	movs r4, 0x5
_08110A0C:
	lsls r1, r4, 24
	lsrs r1, 24
	movs r0, 0xAE
	movs r2, 0xA
	bl sub_8071F60
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x19
	bls _08110A0C
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x6
	bl sub_8110594
	movs r0, 0
	movs r1, 0xA
	movs r2, 0x8
	bl sub_8110538
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0xC
	bl sub_8110594
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0xE
	bl sub_8110538
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08110A50: .4byte gOtherText_BattleTowerResults
_08110A54: .4byte gOtherText_Lv50
_08110A58: .4byte gOtherText_Lv100
	thumb_func_end ShowBattleTowerRecords

	.align 2, 0 @ Don't pad with nop.
