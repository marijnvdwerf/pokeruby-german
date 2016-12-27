	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8119E3C
sub_8119E3C: @ 811A234
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r0, 0
	mov r9, r0
	ldr r6, _0811A258 @ =gUnknown_03005E98
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _0811A2D8
	cmp r0, 0x1
	bgt _0811A25C
	cmp r0, 0
	beq _0811A262
	b _0811A36C
	.align 2, 0
_0811A258: .4byte gUnknown_03005E98
_0811A25C:
	cmp r0, 0x2
	beq _0811A358
	b _0811A36C
_0811A262:
	ldr r4, _0811A2C4 @ =0x0201c000
	ldrh r0, [r5]
	movs r1, 0
	strh r0, [r4, 0x14]
	ldrb r0, [r5, 0x5]
	strb r0, [r4, 0x16]
	strb r1, [r4, 0x1A]
	strb r1, [r4, 0x1B]
	strb r1, [r4, 0x10]
	movs r0, 0x1C
	strb r0, [r4, 0x12]
	strb r1, [r4, 0x11]
	ldrb r1, [r5, 0x4]
	lsls r1, 19
	negs r1, r1
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0x1
	bl sub_811A350
	movs r0, 0
	mov r12, r6
	ldr r1, _0811A2C8 @ =0x040000d4
	ldr r7, _0811A2CC @ =gUnknown_083FB718
	ldr r2, _0811A2D0 @ =0xfffe4000
	adds r6, r4, r2
	ldr r5, _0811A2D4 @ =0x80000010
_0811A298:
	movs r3, 0
	adds r4, r0, 0x1
	lsls r2, r0, 5
_0811A29E:
	str r7, [r1]
	adds r0, r2, r3
	lsls r0, 5
	adds r0, r6
	str r0, [r1, 0x4]
	str r5, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _0811A29E
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _0811A298
	mov r1, r12
	b _0811A348
	.align 2, 0
_0811A2C4: .4byte 0x0201c000
_0811A2C8: .4byte 0x040000d4
_0811A2CC: .4byte gUnknown_083FB718
_0811A2D0: .4byte 0xfffe4000
_0811A2D4: .4byte 0x80000010
_0811A2D8:
	ldrb r0, [r5, 0x2]
	lsls r0, 27
	lsrs r7, r0, 16
	ldrb r1, [r5, 0x3]
	lsls r1, 12
	ldrh r0, [r5]
	lsls r0, 18
	lsrs r0, 23
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0
	ldr r2, _0811A350 @ =0x0201c000
	mov r8, r2
	movs r1, 0xC0
	lsls r1, 19
	mov r12, r1
_0811A2FA:
	movs r3, 0
	adds r4, r0, 0x1
	lsls r5, r0, 6
_0811A300:
	lsls r1, r3, 1
	adds r1, r5
	adds r1, r7
	add r1, r12
	adds r2, r6, 0
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	strh r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _0811A300
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _0811A2FA
	mov r2, r8
	ldrb r0, [r2, 0x16]
	movs r4, 0
	cmp r0, 0
	beq _0811A346
	mov r5, r8
_0811A330:
	adds r0, r4, 0
	movs r1, 0
	bl sub_811A1C8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	cmp r4, r0
	blt _0811A330
_0811A346:
	ldr r1, _0811A354 @ =gUnknown_03005E98
_0811A348:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811A36C
	.align 2, 0
_0811A350: .4byte 0x0201c000
_0811A354: .4byte gUnknown_03005E98
_0811A358:
	bl sub_811A324
	ldr r0, _0811A37C @ =gUnknown_083FB6F8
	ldrb r1, [r5, 0x3]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
	mov r9, r0
_0811A36C:
	mov r0, r9
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811A37C: .4byte gUnknown_083FB6F8
	thumb_func_end sub_8119E3C

	thumb_func_start sub_8119F88
sub_8119F88: @ 811A380
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_811A324
	adds r0, r4, 0
	bl sub_811A15C
	ldr r1, _0811A3BC @ =0x0201c000
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _0811A39E
	subs r0, 0x1
	strb r0, [r1, 0x1B]
_0811A39E:
	ldrb r0, [r1, 0x1A]
	cmp r0, 0
	beq _0811A3C0
	subs r0, 0x1
	strb r0, [r1, 0x1A]
	lsls r0, 24
	cmp r0, 0
	bne _0811A3C0
	ldrh r0, [r1, 0x18]
	bl sub_811A0A0
	bl sub_811A124
	b _0811A43C
	.align 2, 0
_0811A3BC: .4byte 0x0201c000
_0811A3C0:
	ldr r5, _0811A3D0 @ =0x0201c000
	ldrb r0, [r5, 0x10]
	cmp r0, 0
	bne _0811A3D4
	bl sub_811A124
	b _0811A43C
	.align 2, 0
_0811A3D0: .4byte 0x0201c000
_0811A3D4:
	cmp r0, 0x1
	bne _0811A3DE
	bl sub_811A0C0
	b _0811A3FE
_0811A3DE:
	cmp r0, 0x8
	bls _0811A3FE
	bl IsCryPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0811A3F6
	bl sub_811A124
	strb r4, [r5, 0x10]
	b _0811A43C
_0811A3F6:
	bl sub_811A0C0
	movs r0, 0x1
	strb r0, [r5, 0x10]
_0811A3FE:
	ldr r5, _0811A444 @ =0x0201c000
	ldrb r4, [r5, 0x10]
	subs r4, 0x1
	lsls r4, 25
	lsrs r4, 24
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	ldrb r1, [r5, 0x11]
	adds r0, r1
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, r5
	ldrb r1, [r1]
	bl sub_811A1C8
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	ldrb r1, [r5, 0x11]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r4, 0x1
	adds r4, r5
	ldrb r1, [r4]
	bl sub_811A1C8
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
_0811A43C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A444: .4byte 0x0201c000
	thumb_func_end sub_8119F88

	thumb_func_start sub_811A050
sub_811A050: @ 811A448
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, r5, 0
	ldr r0, _0811A484 @ =gMPlay_BGM
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bge _0811A492
	ldr r4, _0811A488 @ =0x0201c000
	ldrb r0, [r4, 0x1A]
	cmp r0, 0
	bne _0811A492
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _0811A492
	movs r0, 0x4
	strb r0, [r4, 0x1B]
	bl IsCryPlaying
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811A48C
	bl StopCry
	strh r5, [r4, 0x18]
	movs r0, 0x2
	strb r0, [r4, 0x1A]
	b _0811A492
	.align 2, 0
_0811A484: .4byte gMPlay_BGM
_0811A488: .4byte 0x0201c000
_0811A48C:
	adds r0, r6, 0
	bl sub_811A0A0
_0811A492:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811A050

	thumb_func_start sub_811A0A0
sub_811A0A0: @ 811A498
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, _0811A4B4 @ =0x0201c000
	movs r0, 0x1
	strb r0, [r1, 0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0811A4B4: .4byte 0x0201c000
	thumb_func_end sub_811A0A0

	thumb_func_start sub_811A0C0
sub_811A0C0: @ 811A4B8
	push {r4,lr}
	ldr r3, _0811A4C8 @ =gPcmDmaCounter
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r0, 0x1
	bgt _0811A4D0
	ldr r0, _0811A4CC @ =0x03006330
	b _0811A4E8
	.align 2, 0
_0811A4C8: .4byte gPcmDmaCounter
_0811A4CC: .4byte 0x03006330
_0811A4D0:
	ldr r2, _0811A514 @ =gSoundInfo
	ldrb r1, [r2, 0xB]
	movs r0, 0
	ldrsb r0, [r3, r0]
	subs r0, 0x1
	subs r1, r0
	ldr r0, [r2, 0x10]
	muls r0, r1
	movs r1, 0xD4
	lsls r1, 2
	adds r2, r1
	adds r0, r2
_0811A4E8:
	movs r1, 0xC6
	lsls r1, 3
	adds r3, r0, r1
	movs r2, 0
	ldr r4, _0811A518 @ =0x0201c000
_0811A4F2:
	adds r1, r2, r4
	lsls r0, r2, 1
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0811A4F2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A514: .4byte gSoundInfo
_0811A518: .4byte 0x0201c000
	thumb_func_end sub_811A0C0

	thumb_func_start sub_811A124
sub_811A124: @ 811A51C
	push {r4,lr}
	ldr r4, _0811A550 @ =0x0201c000
	ldrb r0, [r4, 0x16]
	lsls r0, 3
	ldrb r1, [r4, 0x11]
	adds r0, r1
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_811A1C8
	ldrb r0, [r4, 0x16]
	lsls r0, 3
	ldrb r4, [r4, 0x11]
	adds r0, r4
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_811A1C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A550: .4byte 0x0201c000
	thumb_func_end sub_811A124

	thumb_func_start sub_811A15C
sub_811A15C: @ 811A554
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0811A5AC @ =0x0201c000
	ldrb r1, [r4, 0x11]
	movs r2, 0
	bl sub_811A350
	ldrb r0, [r4, 0x11]
	adds r0, 0x2
	strb r0, [r4, 0x11]
	ldrb r0, [r4, 0x11]
	lsrs r0, 3
	ldrb r2, [r4, 0x16]
	adds r1, r0, r2
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _0811A5B0 @ =0x040000d4
	ldr r6, _0811A5B4 @ =gUnknown_083FB718
	ldr r0, _0811A5B8 @ =0xfffe4000
	adds r5, r4, r0
	ldr r4, _0811A5BC @ =0x80000010
_0811A58C:
	str r6, [r2]
	lsls r0, r1, 5
	adds r0, r3
	lsls r0, 5
	adds r0, r5
	str r0, [r2, 0x4]
	str r4, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0811A58C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811A5AC: .4byte 0x0201c000
_0811A5B0: .4byte 0x040000d4
_0811A5B4: .4byte gUnknown_083FB718
_0811A5B8: .4byte 0xfffe4000
_0811A5BC: .4byte 0x80000010
	thumb_func_end sub_811A15C

	thumb_func_start sub_811A1C8
sub_811A1C8: @ 811A5C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r5, r0, 24
	lsrs r4, r5, 24
	lsls r1, 24
	movs r0, 0xFE
	lsls r0, 23
	adds r1, r0
	lsrs r1, 16
	adds r0, r1, 0
	bl __floatsidf
	ldr r3, _0811A678 @ =0x00000000
	ldr r2, _0811A674 @ =0x40920000
	bl __divdf3
	bl __fixunsdfsi
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x37
	bls _0811A5F6
	movs r6, 0x37
_0811A5F6:
	str r6, [sp]
	movs r7, 0x1
	ands r7, r4
	ldr r0, _0811A67C @ =0x0201c000
	mov r10, r0
	lsrs r5, 27
	mov r8, r5
	ldr r0, _0811A680 @ =gUnknown_083FB738
	mov r1, r10
	ldrb r1, [r1, 0x12]
	cmp r6, r1
	bls _0811A690
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r2, 0x7
	ands r2, r4
_0811A618:
	lsls r1, r6, 1
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 4
	adds r1, r0
	ldr r3, _0811A684 @ =gUnknown_083FB274
	adds r1, r3
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A688 @ =0x02000000
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r3, r9
	ands r4, r3
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	str r2, [sp, 0x8]
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	lsls r1, r7, 4
	adds r0, r1
	ldr r1, _0811A68C @ =gUnknown_083FB73A
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x8]
	ldr r3, _0811A67C @ =0x0201c000
	ldrb r3, [r3, 0x12]
	cmp r6, r3
	bhi _0811A618
	b _0811A6F2
	.align 2, 0
_0811A674: .4byte 0x40920000
_0811A678: .4byte 0x00000000
_0811A67C: .4byte 0x0201c000
_0811A680: .4byte gUnknown_083FB738
_0811A684: .4byte gUnknown_083FB274
_0811A688: .4byte 0x02000000
_0811A68C: .4byte gUnknown_083FB73A
_0811A690:
	lsls r1, r7, 4
	str r1, [sp, 0x4]
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r7, 0x7
	ands r7, r4
_0811A69E:
	lsls r1, r6, 1
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 4
	adds r1, r0
	ldr r2, _0811A70C @ =gUnknown_083FB274
	adds r1, r2
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A710 @ =0x02000000
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r2, r9
	ands r4, r2
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	ldr r3, [sp, 0x4]
	adds r0, r3
	ldr r1, _0811A714 @ =gUnknown_083FB73A
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _0811A718 @ =0x0201c000
	ldrb r2, [r2, 0x12]
	cmp r6, r2
	bcc _0811A69E
_0811A6F2:
	mov r3, sp
	ldrb r0, [r3]
	mov r3, r10
	strb r0, [r3, 0x12]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A70C: .4byte gUnknown_083FB274
_0811A710: .4byte 0x02000000
_0811A714: .4byte gUnknown_083FB73A
_0811A718: .4byte 0x0201c000
	thumb_func_end sub_811A1C8

	thumb_func_start sub_811A324
sub_811A324: @ 811A71C
	ldr r2, _0811A73C @ =0x040000d4
	ldr r0, _0811A740 @ =0x02000000
	str r0, [r2]
	movs r1, 0xE0
	lsls r1, 9
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _0811A744 @ =0x80000e00
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_0811A73C: .4byte 0x040000d4
_0811A740: .4byte 0x02000000
_0811A744: .4byte 0x80000e00
	thumb_func_end sub_811A324

	thumb_func_start sub_811A350
sub_811A350: @ 811A748
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0x1
	beq _0811A784
	cmp r0, 0x1
	bgt _0811A766
	cmp r0, 0
	beq _0811A770
	b _0811A7BC
_0811A766:
	cmp r3, 0x2
	beq _0811A798
	cmp r3, 0x3
	beq _0811A7AC
	b _0811A7BC
_0811A770:
	cmp r2, 0
	beq _0811A77C
	ldr r0, _0811A778 @ =0x04000012
	b _0811A7BA
	.align 2, 0
_0811A778: .4byte 0x04000012
_0811A77C:
	ldr r0, _0811A780 @ =0x04000010
	b _0811A7BA
	.align 2, 0
_0811A780: .4byte 0x04000010
_0811A784:
	cmp r2, 0
	beq _0811A790
	ldr r0, _0811A78C @ =0x04000016
	b _0811A7BA
	.align 2, 0
_0811A78C: .4byte 0x04000016
_0811A790:
	ldr r0, _0811A794 @ =0x04000014
	b _0811A7BA
	.align 2, 0
_0811A794: .4byte 0x04000014
_0811A798:
	cmp r2, 0
	beq _0811A7A4
	ldr r0, _0811A7A0 @ =0x0400001a
	b _0811A7BA
	.align 2, 0
_0811A7A0: .4byte 0x0400001a
_0811A7A4:
	ldr r0, _0811A7A8 @ =0x04000018
	b _0811A7BA
	.align 2, 0
_0811A7A8: .4byte 0x04000018
_0811A7AC:
	cmp r2, 0
	beq _0811A7B8
	ldr r0, _0811A7B4 @ =0x0400001e
	b _0811A7BA
	.align 2, 0
_0811A7B4: .4byte 0x0400001e
_0811A7B8:
	ldr r0, _0811A7C0 @ =0x0400001c
_0811A7BA:
	strh r1, [r0]
_0811A7BC:
	pop {r0}
	bx r0
	.align 2, 0
_0811A7C0: .4byte 0x0400001c
	thumb_func_end sub_811A350

	thumb_func_start ShowPokedexCryScreen
ShowPokedexCryScreen: @ 811A7C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	str r0, [sp]
	ldr r0, _0811A7EC @ =gUnknown_03005E98
	ldrb r1, [r0]
	mov r10, r0
	cmp r1, 0x1
	beq _0811A824
	cmp r1, 0x1
	bgt _0811A7F0
	cmp r1, 0
	beq _0811A7F6
	b _0811A8CA
	.align 2, 0
_0811A7EC: .4byte gUnknown_03005E98
_0811A7F0:
	cmp r1, 0x2
	beq _0811A888
	b _0811A8CA
_0811A7F6:
	ldr r0, _0811A81C @ =gUnknown_083FAF3C
	ldrh r1, [r4]
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	bl LZ77UnCompVram
	ldr r0, _0811A820 @ =gUnknown_083FAF1C
	ldrb r1, [r4, 0x3]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	mov r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811A8CA
	.align 2, 0
_0811A81C: .4byte gUnknown_083FAF3C
_0811A820: .4byte gUnknown_083FAF1C
_0811A824:
	ldrb r0, [r4, 0x2]
	lsls r0, 11
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	mov r8, r0
	ldrh r0, [r4]
	lsls r0, 18
	lsrs r0, 23
	mov r12, r0
	movs r5, 0
	ldr r2, _0811A884 @ =gUnknown_083FAE7C
	mov r9, r2
_0811A83E:
	movs r3, 0
	adds r7, r5, 0x1
	lsls r6, r5, 5
_0811A844:
	ldrb r0, [r4, 0x5]
	adds r0, r5, r0
	ldrb r2, [r4, 0x4]
	adds r2, r3, r2
	lsls r2, 1
	lsls r0, 6
	adds r2, r0
	add r2, r8
	adds r1, r6, r3
	lsls r1, 1
	add r1, r9
	ldrb r0, [r4, 0x3]
	lsls r0, 12
	ldrh r1, [r1]
	orrs r0, r1
	add r0, r12
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x9
	bls _0811A844
	lsls r0, r7, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0811A83E
	mov r3, r10
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _0811A8CA
	.align 2, 0
_0811A884: .4byte gUnknown_083FAE7C
_0811A888:
	ldr r0, _0811A8DC @ =gCryMeterNeedleSpriteSheets
	bl LoadSpriteSheets
	ldr r0, _0811A8E0 @ =gCryMeterNeedleSpritePalettes
	bl LoadSpritePalettes
	ldr r0, _0811A8E4 @ =gSpriteTemplate_83FB774
	ldrb r1, [r4, 0x4]
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 14
	adds r1, r2
	asrs r1, 16
	ldrb r2, [r4, 0x5]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 14
	adds r2, r3
	asrs r2, 16
	movs r3, 0x1
	bl CreateSprite
	ldr r1, _0811A8E8 @ =0x0201c800
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x4]
	movs r0, 0x20
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0x1
	str r0, [sp]
_0811A8CA:
	ldr r0, [sp]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811A8DC: .4byte gCryMeterNeedleSpriteSheets
_0811A8E0: .4byte gCryMeterNeedleSpritePalettes
_0811A8E4: .4byte gSpriteTemplate_83FB774
_0811A8E8: .4byte 0x0201c800
	thumb_func_end ShowPokedexCryScreen

	thumb_func_start DestroyCryMeterNeedleSprite
DestroyCryMeterNeedleSprite: @ 811A8EC
	push {r4,r5,lr}
	ldr r5, _0811A920 @ =gSprites
	ldr r4, _0811A924 @ =0x0201c800
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A920: .4byte gSprites
_0811A924: .4byte 0x0201c800
	thumb_func_end DestroyCryMeterNeedleSprite

	thumb_func_start sub_811A534
sub_811A534: @ 811A928
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r3, _0811A96C @ =gSprites
	ldr r5, _0811A970 @ =0x0201c800
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x6]
	ldr r0, _0811A974 @ =0xfffff800
	adds r1, r5, r0
	ldrb r0, [r1, 0x10]
	cmp r0, 0x2
	beq _0811A99E
	cmp r0, 0x2
	bgt _0811A978
	cmp r0, 0
	beq _0811A97E
	b _0811A9E8
	.align 2, 0
_0811A96C: .4byte gSprites
_0811A970: .4byte 0x0201c800
_0811A974: .4byte 0xfffff800
_0811A978:
	cmp r0, 0x6
	beq _0811A9D6
	b _0811A9E8
_0811A97E:
	movs r0, 0x20
	strb r0, [r5, 0x1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	ble _0811A998
	ldrb r0, [r5, 0x2]
	add r4, sp, 0xC
	cmp r0, 0x1
	beq _0811A9EA
	subs r0, 0x1
	strb r0, [r5, 0x2]
	b _0811A9EA
_0811A998:
	movs r0, 0x5
	strb r0, [r5, 0x2]
	b _0811A9E8
_0811A99E:
	movs r3, 0
	movs r2, 0
	add r4, sp, 0xC
	adds r5, r1, 0
_0811A9A6:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r1, r0
	bge _0811A9B4
	adds r3, r0, 0
_0811A9B4:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0811A9A6
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0xD0
	muls r0, r1
	cmp r0, 0
	bge _0811A9CC
	adds r0, 0xFF
_0811A9CC:
	lsls r0, 16
	asrs r0, 24
	bl sub_811A6D8
	b _0811A9EA
_0811A9D6:
	ldr r1, _0811AA14 @ =0xfffff80a
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0xD0
	muls r0, r1
	lsls r0, 16
	asrs r0, 24
	bl sub_811A6D8
_0811A9E8:
	add r4, sp, 0xC
_0811A9EA:
	ldr r0, _0811AA18 @ =0x0201c800
	ldrb r3, [r0]
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrb r6, [r0, 0x1]
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	adds r5, r0, 0
	cmp r2, r1
	beq _0811AA30
	cmp r2, r1
	bge _0811AA1C
	ldrb r0, [r5, 0x2]
	adds r0, r3, r0
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r1
	ble _0811AA30
	b _0811AA2A
	.align 2, 0
_0811AA14: .4byte 0xfffff80a
_0811AA18: .4byte 0x0201c800
_0811AA1C:
	ldrb r0, [r5, 0x2]
	subs r0, r3, r0
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r1
	bge _0811AA30
_0811AA2A:
	strb r6, [r5]
	movs r0, 0
	strb r0, [r5, 0x1]
_0811AA30:
	ldr r2, _0811AAC0 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r2
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	ldr r1, _0811AAC4 @ =0x0000ffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 17
	orrs r0, r1
	str r0, [sp, 0x4]
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r1, 24
	lsrs r1, 16
	ldr r0, [sp, 0x8]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x8]
	add r0, sp, 0x4
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	add r0, sp, 0xC
	ldrh r1, [r0]
	ldrh r2, [r4, 0x2]
	ldrh r3, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	str r0, [sp]
	movs r0, 0
	bl SetOamMatrix
	ldr r2, _0811AAC8 @ =gSineTable
	movs r0, 0
	ldrsb r0, [r5, r0]
	adds r0, 0x7F
	movs r1, 0xFF
	ands r0, r1
	lsls r1, r0, 1
	adds r1, r2
	adds r0, 0x40
	lsls r0, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	cmp r0, 0
	bge _0811AA9E
	adds r0, 0xFF
_0811AA9E:
	asrs r0, 8
	strh r0, [r7, 0x24]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	cmp r0, 0
	bge _0811AAB2
	adds r0, 0xFF
_0811AAB2:
	asrs r0, 8
	strh r0, [r7, 0x26]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811AAC0: .4byte 0xffff0000
_0811AAC4: .4byte 0x0000ffff
_0811AAC8: .4byte gSineTable
	thumb_func_end sub_811A534

	thumb_func_start sub_811A6D8
sub_811A6D8: @ 811AACC
	push {lr}
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x20
	subs r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0x21
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _0811AAE8
	movs r2, 0xE0
_0811AAE8:
	ldr r1, _0811AAF4 @ =0x0201c800
	strb r2, [r1, 0x1]
	movs r0, 0x5
	strb r0, [r1, 0x2]
	pop {r0}
	bx r0
	.align 2, 0
_0811AAF4: .4byte 0x0201c800
	thumb_func_end sub_811A6D8

	.align 2, 0 @ Don't pad with nop.
