	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_807CEBC
sub_807CEBC: @ 807D2F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	asrs r0, r2, 24
	cmp r0, 0
	bgt _0807D312
	b _0807D47C
_0807D312:
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r5, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r4, r9
	bcc _0807D32A
	b _0807D5D6
_0807D32A:
	ldr r1, [sp]
	lsls r0, r1, 24
	asrs r0, 19
	str r0, [sp, 0x4]
_0807D332:
	ldr r0, _0807D364 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D370
	lsls r1, r5, 1
	ldr r0, _0807D368 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _0807D36C @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	b _0807D466
	.align 2, 0
_0807D364: .4byte gUnknown_030006DC
_0807D368: .4byte gPlttBufferUnfaded
_0807D36C: .4byte gPlttBufferFaded
_0807D370:
	cmp r0, 0x2
	beq _0807D384
	adds r1, r4, 0
	subs r1, 0x10
	ldr r2, _0807D388 @ =gUnknown_0202F7E8
	ldr r3, _0807D38C @ =0x000006d5
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807D394
_0807D384:
	ldr r0, _0807D390 @ =gUnknown_0202FC48
	b _0807D39A
	.align 2, 0
_0807D388: .4byte gUnknown_0202F7E8
_0807D38C: .4byte 0x000006d5
_0807D390: .4byte gUnknown_0202FC48
_0807D394:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r2, r3
_0807D39A:
	ldr r1, [sp, 0x4]
	adds r6, r1, r0
	cmp r4, 0x10
	beq _0807D3A6
	cmp r4, 0x1B
	bls _0807D416
_0807D3A6:
	movs r7, 0
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	ldr r3, _0807D3D0 @ =gPlttBufferFaded
	mov r10, r3
_0807D3B6:
	adds r2, r5, 0
	lsls r0, r5, 1
	ldr r4, _0807D3D4 @ =gPlttBufferUnfaded
	adds r1, r0, r4
	ldrh r0, [r1]
	ldr r3, _0807D3D8 @ =0x00002d9f
	cmp r0, r3
	bne _0807D3DC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	b _0807D40A
	.align 2, 0
_0807D3D0: .4byte gPlttBufferFaded
_0807D3D4: .4byte gPlttBufferUnfaded
_0807D3D8: .4byte 0x00002d9f
_0807D3DC:
	ldr r1, [r1]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r0, r1, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
_0807D40A:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D3B6
	b _0807D466
_0807D416:
	movs r7, 0
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	ldr r1, _0807D474 @ =gPlttBufferFaded
	mov r10, r1
_0807D426:
	adds r2, r5, 0
	lsls r0, r2, 1
	ldr r3, _0807D478 @ =gPlttBufferUnfaded
	adds r0, r3
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r0, r1, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D426
_0807D466:
	mov r4, r12
	lsls r0, r4, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcs _0807D472
	b _0807D332
_0807D472:
	b _0807D5D6
	.align 2, 0
_0807D474: .4byte gPlttBufferFaded
_0807D478: .4byte gPlttBufferUnfaded
_0807D47C:
	cmp r0, 0
	blt _0807D482
	b _0807D5C4
_0807D482:
	mvns r0, r0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r5, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r4, r3, 0
	cmp r4, r9
	bcc _0807D49C
	b _0807D5D6
_0807D49C:
	ldr r0, _0807D4CC @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D4D8
	lsls r1, r5, 1
	ldr r0, _0807D4D0 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _0807D4D4 @ =gPlttBufferFaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	b _0807D5A8
	.align 2, 0
_0807D4CC: .4byte gUnknown_030006DC
_0807D4D0: .4byte gPlttBufferUnfaded
_0807D4D4: .4byte gPlttBufferFaded
_0807D4D8:
	cmp r4, 0x10
	beq _0807D4E0
	cmp r4, 0x1B
	bls _0807D550
_0807D4E0:
	movs r7, 0
	mov r1, r9
	lsls r1, 16
	mov r8, r1
	adds r4, 0x1
	mov r12, r4
	ldr r2, _0807D540 @ =0x02000000
	mov r10, r2
	ldr r3, [sp]
	lsls r0, r3, 24
	asrs r6, r0, 11
_0807D4F6:
	lsls r1, r5, 1
	ldr r4, _0807D544 @ =gPlttBufferUnfaded
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r4, r0, 16
	ldr r2, _0807D548 @ =0x00002d9f
	cmp r0, r2
	beq _0807D52E
	ldr r3, _0807D54C @ =gPlttBufferFaded
	adds r3, r1, r3
	lsrs r0, r4, 17
	movs r1, 0xF
	ands r0, r1
	lsrs r1, r4, 18
	movs r2, 0xF0
	ands r1, r2
	orrs r0, r1
	lsrs r1, r4, 19
	movs r4, 0xF0
	lsls r4, 4
	adds r2, r4, 0
	ands r1, r2
	orrs r0, r1
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r3]
_0807D52E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D4F6
	b _0807D5A8
	.align 2, 0
_0807D540: .4byte 0x02000000
_0807D544: .4byte gPlttBufferUnfaded
_0807D548: .4byte 0x00002d9f
_0807D54C: .4byte gPlttBufferFaded
_0807D550:
	movs r7, 0
	ldr r1, [sp]
	lsls r0, r1, 24
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	ldr r3, _0807D5B8 @ =0x02000000
	mov r10, r3
	asrs r6, r0, 11
_0807D566:
	lsls r0, r5, 1
	ldr r1, _0807D5BC @ =gPlttBufferFaded
	adds r4, r0, r1
	ldr r2, _0807D5C0 @ =gPlttBufferUnfaded
	adds r0, r2
	ldrh r3, [r0]
	lsls r3, 16
	lsrs r0, r3, 17
	movs r1, 0xF
	ands r0, r1
	lsrs r1, r3, 18
	movs r2, 0xF0
	ands r1, r2
	orrs r0, r1
	lsrs r3, 19
	movs r2, 0xF0
	lsls r2, 4
	adds r1, r2, 0
	ands r3, r1
	orrs r0, r3
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D566
_0807D5A8:
	mov r3, r12
	lsls r0, r3, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcs _0807D5B4
	b _0807D49C
_0807D5B4:
	b _0807D5D6
	.align 2, 0
_0807D5B8: .4byte 0x02000000
_0807D5BC: .4byte gPlttBufferFaded
_0807D5C0: .4byte gPlttBufferUnfaded
_0807D5C4:
	lsls r1, r4, 5
	ldr r0, _0807D5E8 @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _0807D5EC @ =gPlttBufferFaded
	adds r1, r2
	mov r4, r9
	lsls r2, r4, 3
	bl CpuFastSet
_0807D5D6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D5E8: .4byte gPlttBufferUnfaded
_0807D5EC: .4byte gPlttBufferFaded
	thumb_func_end sub_807CEBC

	thumb_func_start sub_807D1BC
sub_807D1BC: @ 807D5F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r4, [sp, 0x34]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	mov r1, sp
	strh r4, [r1]
	ldr r1, [sp]
	lsls r3, r1, 27
	lsrs r3, 27
	str r3, [sp, 0x4]
	lsls r3, r1, 22
	lsrs r3, 27
	str r3, [sp, 0x8]
	lsls r1, 17
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r6, r0, 4
	mov r3, r10
	adds r1, r3, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r2, r1
	lsrs r2, 24
	adds r4, r0, 0
	cmp r4, r10
	bcs _0807D71C
	lsls r0, r2, 24
	asrs r0, 19
	str r0, [sp, 0x10]
_0807D648:
	ldr r0, _0807D678 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D67C
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	mov r2, r8
	bl BlendPalette
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	mov r3, r10
	lsls r3, 16
	mov r9, r3
	adds r4, 0x1
	mov r12, r4
	b _0807D712
	.align 2, 0
_0807D678: .4byte gUnknown_030006DC
_0807D67C:
	cmp r0, 0x1
	bne _0807D68C
	ldr r0, _0807D688 @ =gUnknown_0202F9E8
	ldr r1, [sp, 0x10]
	adds r5, r1, r0
	b _0807D692
	.align 2, 0
_0807D688: .4byte gUnknown_0202F9E8
_0807D68C:
	ldr r0, _0807D72C @ =gUnknown_0202FC48
	ldr r3, [sp, 0x10]
	adds r5, r3, r0
_0807D692:
	movs r7, 0
	mov r0, r10
	lsls r0, 16
	mov r9, r0
	adds r4, 0x1
	mov r12, r4
_0807D69E:
	adds r4, r6, 0
	lsls r0, r4, 1
	ldr r1, _0807D730 @ =gPlttBufferUnfaded
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r5, r1
	ldrb r1, [r1]
	ldr r6, [sp, 0x4]
	subs r0, r6, r3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r6, [sp, 0x8]
	subs r0, r6, r2
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r6, [sp, 0xC]
	subs r0, r6, r1
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r4, 1
	ldr r0, _0807D734 @ =gPlttBufferFaded
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D69E
_0807D712:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r0, r9
	bcc _0807D648
_0807D71C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D72C: .4byte gUnknown_0202FC48
_0807D730: .4byte gPlttBufferUnfaded
_0807D734: .4byte gPlttBufferFaded
	thumb_func_end sub_807D1BC

	thumb_func_start sub_807D304
sub_807D304: @ 807D738
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r1, 24
	lsrs r6, r1, 24
	mov r1, sp
	strh r2, [r1]
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	eors r0, r1
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r5, 0
	movs r4, 0
_0807D770:
	ldr r0, _0807D798 @ =gUnknown_030006DC
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D79C
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r5, 0
	movs r1, 0x10
	adds r2, r6, 0
	bl BlendPalette
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	mov r8, r4
	b _0807D832
	.align 2, 0
_0807D798: .4byte gUnknown_030006DC
_0807D79C:
	movs r0, 0
	mov r12, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	adds r4, 0x1
	mov r8, r4
	movs r7, 0x1E
	asrs r0, 11
	mov r9, r0
_0807D7AE:
	adds r4, r5, 0
	lsls r0, r4, 1
	ldr r5, _0807D84C @ =gPlttBufferUnfaded
	adds r0, r5
	ldr r0, [r0]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	lsls r0, 17
	lsrs r0, 27
	ands r0, r7
	lsls r0, 7
	ands r1, r7
	lsls r1, 3
	orrs r0, r1
	ands r2, r7
	lsls r0, 1
	orrs r0, r2
	add r0, r9
	ldr r1, _0807D850 @ =0x02000000
	adds r0, r1
	ldr r1, [r0]
	lsls r3, r1, 27
	lsrs r3, 27
	lsls r2, r1, 22
	lsrs r2, 27
	lsls r1, 17
	lsrs r1, 27
	ldr r5, [sp, 0x8]
	subs r0, r5, r3
	muls r0, r6
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r5, [sp, 0xC]
	subs r0, r5, r2
	muls r0, r6
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	mov r5, r10
	subs r0, r5, r1
	muls r0, r6
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	ldr r0, _0807D854 @ =gPlttBufferFaded
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0xF
	bls _0807D7AE
_0807D832:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807D770
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D84C: .4byte gPlttBufferUnfaded
_0807D850: .4byte 0x02000000
_0807D854: .4byte gPlttBufferFaded
	thumb_func_end sub_807D304

	thumb_func_start sub_807D424
sub_807D424: @ 807D858
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r3, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 16
	lsrs r3, 16
	mov r0, sp
	strh r3, [r0]
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	adds r2, r7, 0
	bl BlendPalette
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x4]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r4, 0x10
_0807D894:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D574
	lsls r0, 24
	cmp r0, 0
	beq _0807D944
	adds r0, r4, 0x1
	lsls r1, r0, 20
	lsrs r1, 16
	mov r12, r1
	lsls r1, r4, 20
	lsrs r6, r1, 16
	mov r9, r0
	cmp r6, r12
	bcs _0807D958
	movs r0, 0x1C
	mov r8, r0
_0807D8B8:
	lsls r5, r6, 1
	ldr r0, _0807D93C @ =gPlttBufferUnfaded
	adds r0, r5, r0
	ldr r2, [r0]
	lsls r4, r2, 27
	lsrs r4, 27
	lsls r3, r2, 22
	lsrs r3, 27
	lsls r2, 17
	lsrs r2, 27
	mov r0, r8
	subs r1, r0, r4
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1F
	subs r1, r3
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	subs r1, r0, r2
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x4]
	subs r0, r1, r4
	muls r0, r7
	asrs r0, 4
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [sp, 0x8]
	subs r0, r1, r3
	muls r0, r7
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	mov r1, r10
	subs r0, r1, r2
	muls r0, r7
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r0, _0807D940 @ =gPlttBufferFaded
	adds r5, r0
	lsrs r2, 14
	lsrs r3, 19
	orrs r2, r3
	orrs r2, r4
	strh r2, [r5]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r12
	bcc _0807D8B8
	b _0807D958
	.align 2, 0
_0807D93C: .4byte gPlttBufferUnfaded
_0807D940: .4byte gPlttBufferFaded
_0807D944:
	lsls r0, r4, 20
	lsrs r0, 16
	mov r1, sp
	ldrh r3, [r1]
	movs r1, 0x10
	adds r2, r7, 0
	bl BlendPalette
	adds r4, 0x1
	mov r9, r4
_0807D958:
	mov r1, r9
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807D894
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807D424

	thumb_func_start sub_807D540
sub_807D540: @ 807D974
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0807D99C @ =gUnknown_0202F7E8
	ldr r0, _0807D9A0 @ =0x000006fa
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0807D996
	ldr r4, _0807D9A4 @ =0x000006f4
	adds r0, r3, r4
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0807D996:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D99C: .4byte gUnknown_0202F7E8
_0807D9A0: .4byte 0x000006fa
_0807D9A4: .4byte 0x000006f4
	thumb_func_end sub_807D540

	thumb_func_start sub_807D574
sub_807D574: @ 807D9A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r2, _0807D9D0 @ =gUnknown_0202F7E8
	ldr r4, _0807D9D4 @ =0x000006fa
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0807D9E6
	ldr r5, _0807D9D8 @ =0x000006f4
	adds r4, r2, r5
	adds r2, r0, 0
_0807D9C2:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _0807D9DC
	movs r0, 0x1
	b _0807D9E8
	.align 2, 0
_0807D9D0: .4byte gUnknown_0202F7E8
_0807D9D4: .4byte 0x000006fa
_0807D9D8: .4byte 0x000006f4
_0807D9DC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _0807D9C2
_0807D9E6:
	movs r0, 0
_0807D9E8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807D574

	thumb_func_start sub_807D5BC
sub_807D5BC: @ 807D9F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0807DA1C @ =gUnknown_0202F7E8
	ldr r1, _0807DA20 @ =0x000006c6
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807DA16
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r5, r1
	strb r4, [r0]
_0807DA16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DA1C: .4byte gUnknown_0202F7E8
_0807DA20: .4byte 0x000006c6
	thumb_func_end sub_807D5BC

	thumb_func_start sub_807D5F0
sub_807D5F0: @ 807DA24
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r3, _0807DA6C @ =gUnknown_0202F7E8
	ldr r0, _0807DA70 @ =0x000006c6
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0807DA64
	movs r1, 0
	strb r1, [r2]
	movs r2, 0xD8
	lsls r2, 3
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r3, r2
	strb r5, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _0807DA74 @ =0x000006c2
	adds r0, r3, r1
	strb r6, [r0]
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_807D5BC
_0807DA64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DA6C: .4byte gUnknown_0202F7E8
_0807DA70: .4byte 0x000006c6
_0807DA74: .4byte 0x000006c2
	thumb_func_end sub_807D5F0

	thumb_func_start fade_screen
fade_screen: @ 807DA78
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x1
	beq _0807DAB0
	cmp r0, 0x1
	bgt _0807DA94
	cmp r0, 0
	beq _0807DA9E
	b _0807DB8C
_0807DA94:
	cmp r2, 0x2
	beq _0807DAA4
	cmp r2, 0x3
	beq _0807DAB4
	b _0807DB8C
_0807DA9E:
	movs r4, 0
	movs r1, 0
	b _0807DAB8
_0807DAA4:
	ldr r4, _0807DAAC @ =0x0000ffff
	movs r1, 0
	b _0807DAB8
	.align 2, 0
_0807DAAC: .4byte 0x0000ffff
_0807DAB0:
	movs r4, 0
	b _0807DAB6
_0807DAB4:
	ldr r4, _0807DAD8 @ =0x0000ffff
_0807DAB6:
	movs r1, 0x1
_0807DAB8:
	ldr r0, _0807DADC @ =gUnknown_0202F7E8
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	blt _0807DAE0
	cmp r0, 0x6
	ble _0807DAD2
	cmp r0, 0xD
	bgt _0807DAE0
	cmp r0, 0xB
	blt _0807DAE0
_0807DAD2:
	movs r2, 0x1
	b _0807DAE2
	.align 2, 0
_0807DAD8: .4byte 0x0000ffff
_0807DADC: .4byte gUnknown_0202F7E8
_0807DAE0:
	movs r2, 0
_0807DAE2:
	cmp r1, 0
	beq _0807DB24
	cmp r2, 0
	beq _0807DAF6
	ldr r0, _0807DB14 @ =gPlttBufferFaded
	ldr r1, _0807DB18 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
_0807DAF6:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807DB1C @ =gUnknown_0202F7E8
	ldr r3, _0807DB20 @ =0x000006c6
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	b _0807DB8C
	.align 2, 0
_0807DB14: .4byte gPlttBufferFaded
_0807DB18: .4byte gPlttBufferUnfaded
_0807DB1C: .4byte gUnknown_0202F7E8
_0807DB20: .4byte 0x000006c6
_0807DB24:
	ldr r1, _0807DB3C @ =gUnknown_0202F7E8
	ldr r3, _0807DB40 @ =0x000006c4
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, 0
	beq _0807DB48
	ldr r0, _0807DB44 @ =0x000006c7
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	b _0807DB5A
	.align 2, 0
_0807DB3C: .4byte gUnknown_0202F7E8
_0807DB40: .4byte 0x000006c4
_0807DB44: .4byte 0x000006c7
_0807DB48:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0807DB5A:
	ldr r4, _0807DB94 @ =gUnknown_0202F7E8
	ldr r1, _0807DB98 @ =0x000006c6
	adds r0, r4, r1
	movs r1, 0
	movs r5, 0x1
	strb r5, [r0]
	ldr r2, _0807DB9C @ =0x000006ca
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807DBA0 @ =0x000006cb
	adds r0, r4, r3
	strb r1, [r0]
	movs r1, 0xE6
	lsls r1, 3
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, 0x68
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_807DB64
	movs r3, 0xD9
	lsls r3, 3
	adds r4, r3
	strb r5, [r4]
_0807DB8C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB94: .4byte gUnknown_0202F7E8
_0807DB98: .4byte 0x000006c6
_0807DB9C: .4byte 0x000006ca
_0807DBA0: .4byte 0x000006cb
	thumb_func_end fade_screen

	thumb_func_start sub_807D770
sub_807D770: @ 807DBA4
	ldr r0, _0807DBB8 @ =gUnknown_0202F7E8
	ldr r1, _0807DBBC @ =0x000006c6
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_0807DBB8: .4byte gUnknown_0202F7E8
_0807DBBC: .4byte 0x000006c6
	thumb_func_end sub_807D770

	thumb_func_start sub_807D78C
sub_807D78C: @ 807DBC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	ldr r5, _0807DC00 @ =gUnknown_0202F7E8
	ldr r2, _0807DC04 @ =0x000006c6
	adds r0, r5, r2
	ldrb r0, [r0]
	adds r1, r5, 0
	cmp r0, 0x1
	beq _0807DC08
	cmp r0, 0x2
	beq _0807DC54
	adds r2, 0xA
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _0807DC8C
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x10
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807CEBC
	b _0807DC9C
	.align 2, 0
_0807DC00: .4byte gUnknown_0202F7E8
_0807DC04: .4byte 0x000006c6
_0807DC08:
	ldr r2, _0807DC48 @ =0x000006ca
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807DC9C
	adds r2, 0x6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807DC24
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D540
_0807DC24:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	movs r2, 0
	ldr r6, _0807DC4C @ =gPlttBufferFaded
	ldr r0, _0807DC50 @ =0x000006c4
	adds r3, r5, r0
_0807DC30:
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0807DC30
	b _0807DC9C
	.align 2, 0
_0807DC48: .4byte 0x000006ca
_0807DC4C: .4byte gPlttBufferFaded
_0807DC50: .4byte 0x000006c4
_0807DC54:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	lsls r1, r4, 1
	ldr r0, _0807DC80 @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _0807DC84 @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	ldr r0, _0807DC88 @ =gPaletteFade
	ldrh r2, [r0, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r0, 0x6]
	lsls r3, 17
	lsrs r3, 17
	adds r0, r4, 0
	movs r1, 0x10
	bl BlendPalette
	b _0807DC9C
	.align 2, 0
_0807DC80: .4byte gPlttBufferFaded
_0807DC84: .4byte gPlttBufferUnfaded
_0807DC88: .4byte gPaletteFade
_0807DC8C:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	ldr r3, _0807DCA4 @ =0x000073fc
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
_0807DC9C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DCA4: .4byte 0x000073fc
	thumb_func_end sub_807D78C

	thumb_func_start sub_807D874
sub_807D874: @ 807DCA8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807DCC4 @ =gUnknown_0202F7E8
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807CEBC
	pop {r0}
	bx r0
	.align 2, 0
_0807DCC4: .4byte gUnknown_0202F7E8
	thumb_func_end sub_807D874

	thumb_func_start unref_sub_807D894
unref_sub_807D894: @ 807DCC8
	push {lr}
	ldr r1, _0807DCDC @ =gUnknown_0202F7E8
	ldr r2, _0807DCE0 @ =0x000006c6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807DCE4
	movs r0, 0
	b _0807DCEA
	.align 2, 0
_0807DCDC: .4byte gUnknown_0202F7E8
_0807DCE0: .4byte 0x000006c6
_0807DCE4:
	ldr r2, _0807DCF0 @ =0x000006ca
	adds r0, r1, r2
	ldrb r0, [r0]
_0807DCEA:
	pop {r1}
	bx r1
	.align 2, 0
_0807DCF0: .4byte 0x000006ca
	thumb_func_end unref_sub_807D894

	thumb_func_start sub_807D8C0
sub_807D8C0: @ 807DCF4
	push {r4,lr}
	ldr r4, _0807DD1C @ =gUnknown_0202F7E8
	ldr r1, _0807DD20 @ =0x000006d4
	adds r4, r1
	ldrb r1, [r4]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	ldrb r0, [r4]
	bl sub_807D78C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DD1C: .4byte gUnknown_0202F7E8
_0807DD20: .4byte 0x000006d4
	thumb_func_end sub_807D8C0

	thumb_func_start sub_807D8F0
sub_807D8F0: @ 807DD24
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	mov r8, r1
	ldrb r4, [r7]
	cmp r4, 0x6
	bhi _0807DDCE
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0807DD80 @ =gUnknown_08396FA8
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r4, 13
	ldr r5, _0807DD84 @ =0x02000000
	adds r1, r6, r5
	bl LZ77UnCompWram
	subs r0, r4, 0x1
	cmp r4, 0
	bne _0807DD90
	ldr r0, _0807DD88 @ =0x00000421
	strh r0, [r5]
	movs r2, 0x1
	adds r4, r5, 0
	movs r3, 0
	ldr r5, _0807DD8C @ =0x00000fff
_0807DD5E:
	lsls r1, r2, 1
	adds r1, r3
	adds r1, r4
	subs r0, r2, 0x1
	lsls r0, 1
	adds r0, r3
	adds r0, r4
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bls _0807DD5E
	b _0807DDB8
	.align 2, 0
_0807DD80: .4byte gUnknown_08396FA8
_0807DD84: .4byte 0x02000000
_0807DD88: .4byte 0x00000421
_0807DD8C: .4byte 0x00000fff
_0807DD90:
	movs r2, 0
	adds r3, r5, 0
	adds r5, r6, 0
	lsls r4, r0, 13
	ldr r0, _0807DDD8 @ =0x00000fff
	mov r12, r0
_0807DD9C:
	lsls r0, r2, 1
	adds r1, r0, r5
	adds r1, r3
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r12
	bls _0807DD9C
_0807DDB8:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bne _0807DDCE
	movs r0, 0x20
	strb r0, [r7]
	mov r1, r8
	strb r0, [r1]
_0807DDCE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DDD8: .4byte 0x00000fff
	thumb_func_end sub_807D8F0

	thumb_func_start sub_807D9A8
sub_807D9A8: @ 807DDDC
	ldr r0, _0807DDF0 @ =gUnknown_0202F7E8
	ldr r2, _0807DDF4 @ =0x0000074d
	adds r1, r0, r2
	movs r2, 0x1
	strb r2, [r1]
	ldr r1, _0807DDF8 @ =0x0000074e
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807DDF0: .4byte gUnknown_0202F7E8
_0807DDF4: .4byte 0x0000074d
_0807DDF8: .4byte 0x0000074e
	thumb_func_end sub_807D9A8

	thumb_func_start sub_807D9C8
sub_807D9C8: @ 807DDFC
	push {r4,lr}
	ldr r1, _0807DE24 @ =gUnknown_0202F7E8
	ldr r0, _0807DE28 @ =0x0000074d
	adds r4, r1, r0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807DE30
	ldr r0, _0807DE2C @ =0x0000074e
	adds r1, r0
	adds r0, r4, 0
	bl sub_807D8F0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807DE30
	movs r0, 0x1
	b _0807DE32
	.align 2, 0
_0807DE24: .4byte gUnknown_0202F7E8
_0807DE28: .4byte 0x0000074d
_0807DE2C: .4byte 0x0000074e
_0807DE30:
	movs r0, 0
_0807DE32:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807D9C8

	thumb_func_start sub_807DA04
sub_807DA04: @ 807DE38
	push {lr}
	lsls r0, 24
	asrs r0, 24
	mvns r0, r0
	bl sub_807D5BC
	pop {r0}
	bx r0
	thumb_func_end sub_807DA04

	thumb_func_start sub_807DA14
sub_807DA14: @ 807DE48
	ldr r1, _0807DE70 @ =gUnknown_0202F7E8
	ldr r2, _0807DE74 @ =0x0000073c
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	movs r3, 0xE8
	lsls r3, 3
	adds r0, r1, r3
	strh r2, [r0]
	adds r3, 0x2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _0807DE78 @ =0x0000073e
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0807DE7C @ =gUnknown_0202FF58
	movs r0, 0x5
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807DE70: .4byte gUnknown_0202F7E8
_0807DE74: .4byte 0x0000073c
_0807DE78: .4byte 0x0000073e
_0807DE7C: .4byte gUnknown_0202FF58
	thumb_func_end sub_807DA14

	thumb_func_start sub_807DA4C
sub_807DA4C: @ 807DE80
	push {r4-r7,lr}
	ldr r5, _0807DE9C @ =gUnknown_0202F7E8
	ldr r0, _0807DEA0 @ =0x00000742
	adds r7, r5, r0
	movs r1, 0
	ldrsh r2, [r7, r1]
	cmp r2, 0x1
	beq _0807DEFC
	cmp r2, 0x1
	bgt _0807DEA4
	cmp r2, 0
	beq _0807DEAA
	b _0807DF88
	.align 2, 0
_0807DE9C: .4byte gUnknown_0202F7E8
_0807DEA0: .4byte 0x00000742
_0807DEA4:
	cmp r2, 0x2
	beq _0807DF50
	b _0807DF88
_0807DEAA:
	movs r3, 0xE8
	lsls r3, 3
	adds r6, r5, r3
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807DEF0 @ =gUnknown_0202FF58
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DF88
	strh r2, [r6]
	ldr r0, _0807DEF4 @ =0x0000073c
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807DA04
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	ble _0807DF88
	ldr r3, _0807DEF8 @ =0x0000073e
	adds r0, r5, r3
	strh r1, [r0]
	movs r0, 0x1
	strh r0, [r7]
	movs r0, 0x3C
	strh r0, [r6]
	b _0807DF88
	.align 2, 0
_0807DEF0: .4byte gUnknown_0202FF58
_0807DEF4: .4byte 0x0000073c
_0807DEF8: .4byte 0x0000073e
_0807DEFC:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x3
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0807DF44 @ =gSineTable
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r0, 0x1
	asrs r0, 6
	adds r0, 0x2
	ldr r2, _0807DF48 @ =0x0000073c
	adds r6, r5, r2
	adds r2, r0, 0
	strh r0, [r6]
	ldr r3, _0807DF4C @ =0x0000073e
	adds r4, r5, r3
	movs r3, 0
	ldrsh r1, [r4, r3]
	cmp r0, r1
	beq _0807DF3C
	lsls r0, r2, 24
	asrs r0, 24
	bl sub_807DA04
_0807DF3C:
	ldrh r0, [r6]
	strh r0, [r4]
	b _0807DF88
	.align 2, 0
_0807DF44: .4byte gSineTable
_0807DF48: .4byte 0x0000073c
_0807DF4C: .4byte 0x0000073e
_0807DF50:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807DF90 @ =gUnknown_0202FF58
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DF88
	strh r6, [r2]
	ldr r1, _0807DF94 @ =0x0000073c
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807DA04
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bne _0807DF88
	strh r6, [r7]
_0807DF88:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF90: .4byte gUnknown_0202FF58
_0807DF94: .4byte 0x0000073c
	thumb_func_end sub_807DA4C

	thumb_func_start sub_807DB64
sub_807DB64: @ 807DF98
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807DFCC @ =gUnknown_0202F7E8
	movs r4, 0xE6
	lsls r4, 3
	adds r2, r3, r4
	strh r0, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r1, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r0, [r2]
	ldr r2, _0807DFD0 @ =0x00000736
	adds r3, r2
	strh r1, [r3]
	ldr r2, _0807DFD4 @ =0x04000052
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFCC: .4byte gUnknown_0202F7E8
_0807DFD0: .4byte 0x00000736
_0807DFD4: .4byte 0x04000052
	thumb_func_end sub_807DB64

	thumb_func_start sub_807DBA4
sub_807DBA4: @ 807DFD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807E00C @ =gUnknown_0202F7E8
	ldr r5, _0807E010 @ =0x00000734
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _0807E014 @ =0x00000736
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0807E018 @ =0x0000073a
	adds r0, r3, r1
	strb r2, [r0]
	adds r4, 0x3
	adds r0, r3, r4
	strb r5, [r0]
	movs r0, 0xE7
	lsls r0, 3
	adds r3, r0
	strb r5, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E00C: .4byte gUnknown_0202F7E8
_0807E010: .4byte 0x00000734
_0807E014: .4byte 0x00000736
_0807E018: .4byte 0x0000073a
	thumb_func_end sub_807DBA4

	thumb_func_start sub_807DBE8
sub_807DBE8: @ 807E01C
	push {r4-r6,lr}
	ldr r0, _0807E074 @ =gUnknown_0202F7E8
	movs r1, 0xE6
	lsls r1, 3
	adds r3, r0, r1
	ldr r2, [r3]
	ldr r6, _0807E078 @ =0x00000734
	adds r5, r0, r6
	ldr r1, [r5]
	adds r4, r0, 0
	cmp r2, r1
	beq _0807E0E0
	ldr r0, _0807E07C @ =0x00000739
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r6, _0807E080 @ =0x0000073a
	adds r1, r4, r6
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807E0AC
	movs r0, 0
	strb r0, [r2]
	movs r0, 0xE7
	lsls r0, 3
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807E084
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r5]
	cmp r2, r0
	bcs _0807E0A4
	adds r0, r1, 0x1
	b _0807E0AA
	.align 2, 0
_0807E074: .4byte gUnknown_0202F7E8
_0807E078: .4byte 0x00000734
_0807E07C: .4byte 0x00000739
_0807E080: .4byte 0x0000073a
_0807E084:
	ldr r1, _0807E09C @ =0x00000732
	adds r3, r4, r1
	ldr r2, _0807E0A0 @ =0x00000736
	adds r0, r4, r2
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r0]
	cmp r2, r0
	bcs _0807E0A4
	adds r0, r1, 0x1
	b _0807E0AA
	.align 2, 0
_0807E09C: .4byte 0x00000732
_0807E0A0: .4byte 0x00000736
_0807E0A4:
	cmp r2, r0
	bls _0807E0AC
	subs r0, r1, 0x1
_0807E0AA:
	strh r0, [r3]
_0807E0AC:
	ldr r3, _0807E0D4 @ =0x04000052
	ldr r6, _0807E0D8 @ =0x00000732
	adds r0, r4, r6
	ldrh r0, [r0]
	lsls r0, 8
	movs r1, 0xE6
	lsls r1, 3
	adds r2, r4, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldr r1, [r2]
	ldr r2, _0807E0DC @ =0x00000734
	adds r0, r4, r2
	ldr r0, [r0]
	cmp r1, r0
	beq _0807E0E0
	movs r0, 0
	b _0807E0E2
	.align 2, 0
_0807E0D4: .4byte 0x04000052
_0807E0D8: .4byte 0x00000732
_0807E0DC: .4byte 0x00000734
_0807E0E0:
	movs r0, 0x1
_0807E0E2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807DBE8

	thumb_func_start unref_sub_807DCB4
unref_sub_807DCB4: @ 807E0E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0807E17A
	lsls r0, 2
	ldr r1, _0807E100 @ =_0807E104
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E100: .4byte _0807E104
	.align 2, 0
_0807E104:
	.4byte _0807E12C
	.4byte _0807E134
	.4byte _0807E13C
	.4byte _0807E144
	.4byte _0807E14C
	.4byte _0807E154
	.4byte _0807E15C
	.4byte _0807E164
	.4byte _0807E16C
	.4byte _0807E174
_0807E12C:
	movs r0, 0x1
	bl sub_808070C
	b _0807E17A
_0807E134:
	movs r0, 0x2
	bl sub_808070C
	b _0807E17A
_0807E13C:
	movs r0, 0x3
	bl sub_808070C
	b _0807E17A
_0807E144:
	movs r0, 0x4
	bl sub_808070C
	b _0807E17A
_0807E14C:
	movs r0, 0x5
	bl sub_808070C
	b _0807E17A
_0807E154:
	movs r0, 0x6
	bl sub_808070C
	b _0807E17A
_0807E15C:
	movs r0, 0x9
	bl sub_808070C
	b _0807E17A
_0807E164:
	movs r0, 0x7
	bl sub_808070C
	b _0807E17A
_0807E16C:
	movs r0, 0x8
	bl sub_808070C
	b _0807E17A
_0807E174:
	movs r0, 0xB
	bl sub_808070C
_0807E17A:
	pop {r0}
	bx r0
	thumb_func_end unref_sub_807DCB4

	thumb_func_start weather_get_current
weather_get_current: @ 807E180
	ldr r0, _0807E18C @ =gUnknown_0202F7E8
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807E18C: .4byte gUnknown_0202F7E8
	thumb_func_end weather_get_current

	thumb_func_start sub_807DD5C
sub_807DD5C: @ 807E190
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0807E1B0 @ =gUnknown_0202F7E8
	ldr r3, _0807E1B4 @ =0x000006c6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0807E1E2
	cmp r2, 0x53
	beq _0807E1C8
	cmp r2, 0x53
	bgt _0807E1B8
	cmp r2, 0x51
	beq _0807E1D4
	b _0807E1E2
	.align 2, 0
_0807E1B0: .4byte gUnknown_0202F7E8
_0807E1B4: .4byte 0x000006c6
_0807E1B8:
	cmp r2, 0x55
	bne _0807E1E2
	ldr r0, _0807E1C4 @ =0x000006dd
	adds r1, r0
	movs r0, 0
	b _0807E1DA
	.align 2, 0
_0807E1C4: .4byte 0x000006dd
_0807E1C8:
	ldr r3, _0807E1D0 @ =0x000006dd
	adds r1, r3
	movs r0, 0x1
	b _0807E1DA
	.align 2, 0
_0807E1D0: .4byte 0x000006dd
_0807E1D4:
	ldr r0, _0807E1E8 @ =0x000006dd
	adds r1, r0
	movs r0, 0x2
_0807E1DA:
	strb r0, [r1]
	adds r0, r2, 0
	bl PlaySE
_0807E1E2:
	pop {r0}
	bx r0
	.align 2, 0
_0807E1E8: .4byte 0x000006dd
	thumb_func_end sub_807DD5C

	thumb_func_start PlayRainSoundEffect
PlayRainSoundEffect: @ 807E1EC
	push {lr}
	bl IsSpecialSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0807E22A
	ldr r0, _0807E214 @ =gUnknown_0202F7E8
	ldr r1, _0807E218 @ =0x000006dd
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807E21C
	cmp r0, 0x1
	bgt _0807E224
	cmp r0, 0
	bne _0807E224
	movs r0, 0x56
	bl PlaySE
	b _0807E22A
	.align 2, 0
_0807E214: .4byte gUnknown_0202F7E8
_0807E218: .4byte 0x000006dd
_0807E21C:
	movs r0, 0x54
	bl PlaySE
	b _0807E22A
_0807E224:
	movs r0, 0x52
	bl PlaySE
_0807E22A:
	pop {r0}
	bx r0
	thumb_func_end PlayRainSoundEffect

	thumb_func_start sub_807DDFC
sub_807DDFC: @ 807E230
	ldr r0, _0807E23C @ =gUnknown_0202F7E8
	ldr r1, _0807E240 @ =0x000006d3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807E23C: .4byte gUnknown_0202F7E8
_0807E240: .4byte 0x000006d3
	thumb_func_end sub_807DDFC

	thumb_func_start sub_807DE10
sub_807DE10: @ 807E244
	ldr r0, _0807E250 @ =gUnknown_0202F7E8
	ldr r1, _0807E254 @ =0x000006c6
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807E250: .4byte gUnknown_0202F7E8
_0807E254: .4byte 0x000006c6
	thumb_func_end sub_807DE10

	thumb_func_start unref_sub_807DE24
unref_sub_807DE24: @ 807E258
	ldr r0, _0807E264 @ =gUnknown_0202F7E8
	ldr r1, _0807E268 @ =0x000006c6
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807E264: .4byte gUnknown_0202F7E8
_0807E268: .4byte 0x000006c6
	thumb_func_end unref_sub_807DE24

	thumb_func_start sub_807DE38
sub_807DE38: @ 807E26C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807E290 @ =gUnknown_083970C8
	ldr r5, _0807E294 @ =gUnknown_0202FF38
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuSet
	adds r4, r5
	movs r0, 0
	strb r0, [r4]
	ldr r0, _0807E298 @ =gUnknown_030006DC
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E290: .4byte gUnknown_083970C8
_0807E294: .4byte gUnknown_0202FF38
_0807E298: .4byte gUnknown_030006DC
	thumb_func_end sub_807DE38

	thumb_func_start sub_807DE68
sub_807DE68: @ 807E29C
	ldr r1, _0807E2A4 @ =gUnknown_030006DC
	ldr r0, _0807E2A8 @ =gUnknown_083970C8
	str r0, [r1]
	bx lr
	.align 2, 0
_0807E2A4: .4byte gUnknown_030006DC
_0807E2A8: .4byte gUnknown_083970C8
	thumb_func_end sub_807DE68

	thumb_func_start sub_807DE78
sub_807DE78: @ 807E2AC
	push {lr}
	ldr r0, _0807E2E4 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r2, _0807E2E8 @ =0x000006c1
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807E2EC @ =0x000006c2
	adds r3, r0, r1
	movs r1, 0x14
	strb r1, [r3]
	ldr r3, _0807E2F0 @ =0x000006d2
	adds r1, r0, r3
	strb r2, [r1]
	subs r3, 0x6
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _0807E2F4 @ =0x000006de
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E2E0
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807E2E0:
	pop {r0}
	bx r0
	.align 2, 0
_0807E2E4: .4byte gUnknown_08396FC4
_0807E2E8: .4byte 0x000006c1
_0807E2EC: .4byte 0x000006c2
_0807E2F0: .4byte 0x000006d2
_0807E2F4: .4byte 0x000006de
	thumb_func_end sub_807DE78

	thumb_func_start sub_807DEC4
sub_807DEC4: @ 807E2F8
	push {r4,lr}
	bl sub_807DE78
	ldr r0, _0807E320 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E324 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E318
	adds r4, r1, r2
_0807E30E:
	bl sub_807DEF4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E30E
_0807E318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E320: .4byte gUnknown_08396FC4
_0807E324: .4byte 0x000006d2
	thumb_func_end sub_807DEC4

	thumb_func_start sub_807DEF4
sub_807DEF4: @ 807E328
	push {r4,r5,lr}
	ldr r0, _0807E344 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807E348 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807E358
	cmp r0, 0x1
	bgt _0807E34C
	cmp r0, 0
	beq _0807E352
	b _0807E37C
	.align 2, 0
_0807E344: .4byte gUnknown_08396FC4
_0807E348: .4byte 0x000006cc
_0807E34C:
	cmp r0, 0x2
	beq _0807E364
	b _0807E37C
_0807E352:
	bl sub_807DFD4
	b _0807E376
_0807E358:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x1
	bl sub_807DBA4
	b _0807E376
_0807E364:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807E37C
	ldr r0, _0807E384 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807E376:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807E37C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E384: .4byte 0x000006d2
	thumb_func_end sub_807DEF4

	thumb_func_start sub_807DF54
sub_807DF54: @ 807E388
	push {r4,lr}
	ldr r0, _0807E3A0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E3A4 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _0807E3A8
	cmp r0, 0x1
	beq _0807E3B4
	movs r0, 0
	b _0807E3CA
	.align 2, 0
_0807E3A0: .4byte gUnknown_08396FC4
_0807E3A4: .4byte 0x000006ce
_0807E3A8:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807E3C2
_0807E3B4:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807E3C8
	bl sub_807E0A0
_0807E3C2:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807E3C8:
	movs r0, 0x1
_0807E3CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807DF54

	thumb_func_start sub_807DF9C
sub_807DF9C: @ 807E3D0
	ldr r0, _0807E3E8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807E3EC @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _0807E3F0 @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807E3E8: .4byte gUnknown_08396FC4
_0807E3EC: .4byte 0x000006c1
_0807E3F0: .4byte 0x000006c2
	thumb_func_end sub_807DF9C

	thumb_func_start sub_807DFC0
sub_807DFC0: @ 807E3F4
	push {lr}
	bl sub_807DF9C
	pop {r0}
	bx r0
	thumb_func_end sub_807DFC0

	thumb_func_start nullsub_55
nullsub_55: @ 807E400
	bx lr
	thumb_func_end nullsub_55

	thumb_func_start sub_807DFD0
sub_807DFD0: @ 807E404
	movs r0, 0
	bx lr
	thumb_func_end sub_807DFD0

	thumb_func_start sub_807DFD4
sub_807DFD4: @ 807E408
	push {r4,r5,lr}
	ldr r0, _0807E480 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E484 @ =0x000006de
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807E4C4
	ldr r0, _0807E488 @ =gUnknown_0839A9D4
	bl LoadSpriteSheet
	ldr r0, _0807E48C @ =gUnknown_08397108
	bl sub_807D8C0
	movs r5, 0
_0807E426:
	ldr r0, _0807E490 @ =gSpriteTemplate_839A9F0
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _0807E49C
	ldr r0, _0807E480 @ =gUnknown_08396FC4
	ldr r1, [r0]
	lsls r2, r5, 2
	movs r0, 0xFA
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	lsls r4, r3, 4
	adds r4, r3
	lsls r4, 2
	ldr r0, _0807E494 @ =gSprites
	adds r4, r0
	str r4, [r1]
	ldr r0, _0807E498 @ =gUnknown_0839A9C8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_80603CC
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807E4AE
	.align 2, 0
_0807E480: .4byte gUnknown_08396FC4
_0807E484: .4byte 0x000006de
_0807E488: .4byte gUnknown_0839A9D4
_0807E48C: .4byte gUnknown_08397108
_0807E490: .4byte gSpriteTemplate_839A9F0
_0807E494: .4byte gSprites
_0807E498: .4byte gUnknown_0839A9C8
_0807E49C:
	ldr r0, _0807E4CC @ =gUnknown_08396FC4
	ldr r1, [r0]
	lsls r0, r5, 2
	movs r2, 0xFA
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807E4AE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x2
	bls _0807E426
	ldr r0, _0807E4CC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E4D0 @ =0x000006de
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807E4C4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4CC: .4byte gUnknown_08396FC4
_0807E4D0: .4byte 0x000006de
	thumb_func_end sub_807DFD4

	thumb_func_start sub_807E0A0
sub_807E0A0: @ 807E4D4
	push {r4,r5,lr}
	ldr r0, _0807E520 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E524 @ =0x000006de
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E518
	movs r4, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r1, r0
_0807E4EC:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807E4FA
	bl DestroySprite
_0807E4FA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _0807E4EC
	movs r0, 0x90
	lsls r0, 5
	bl FreeSpriteTilesByTag
	ldr r0, _0807E520 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807E524 @ =0x000006de
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807E518:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E520: .4byte gUnknown_08396FC4
_0807E524: .4byte 0x000006de
	thumb_func_end sub_807E0A0

	thumb_func_start sub_807E0F4
sub_807E0F4: @ 807E528
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0
	beq _0807E540
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
_0807E540:
	pop {r0}
	bx r0
	thumb_func_end sub_807E0F4

	thumb_func_start sub_807E110
sub_807E110: @ 807E544
	ldr r0, _0807E568 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807E56C @ =0x000006cc
	adds r3, r1, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r3]
	ldr r3, _0807E570 @ =0x000006d2
	adds r0, r1, r3
	strb r2, [r0]
	subs r3, 0x11
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0807E574 @ =0x000006c2
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_0807E568: .4byte gUnknown_08396FC4
_0807E56C: .4byte 0x000006cc
_0807E570: .4byte 0x000006d2
_0807E574: .4byte 0x000006c2
	thumb_func_end sub_807E110

	thumb_func_start sub_807E144
sub_807E144: @ 807E578
	push {r4,lr}
	bl sub_807E110
	ldr r0, _0807E5A0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E5A4 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E598
	adds r4, r1, r2
_0807E58E:
	bl sub_807E174
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E58E
_0807E598:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5A0: .4byte gUnknown_08396FC4
_0807E5A4: .4byte 0x000006d2
	thumb_func_end sub_807E144

	thumb_func_start sub_807E174
sub_807E174: @ 807E5A8
	push {lr}
	ldr r1, _0807E5C4 @ =gUnknown_08396FC4
	ldr r0, [r1]
	ldr r2, _0807E5C8 @ =0x000006cc
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0807E684
	lsls r0, 2
	ldr r1, _0807E5CC @ =_0807E5D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E5C4: .4byte gUnknown_08396FC4
_0807E5C8: .4byte 0x000006cc
_0807E5CC: .4byte _0807E5D0
	.align 2, 0
_0807E5D0:
	.4byte _0807E5E4
	.4byte _0807E600
	.4byte _0807E618
	.4byte _0807E634
	.4byte _0807E64C
_0807E5E4:
	ldr r1, [r2]
	ldr r2, _0807E5F8 @ =0x000006c6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E688
	ldr r0, _0807E5FC @ =0x000006cc
	adds r1, r0
	b _0807E66C
	.align 2, 0
_0807E5F8: .4byte 0x000006c6
_0807E5FC: .4byte 0x000006cc
_0807E600:
	bl sub_807D9A8
	ldr r0, _0807E610 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E614 @ =0x000006cc
	adds r1, r2
	b _0807E66C
	.align 2, 0
_0807E610: .4byte gUnknown_08396FC4
_0807E614: .4byte 0x000006cc
_0807E618:
	bl sub_807D9C8
	lsls r0, 24
	cmp r0, 0
	bne _0807E688
	ldr r0, _0807E62C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807E630 @ =0x000006cc
	adds r1, r0
	b _0807E66C
	.align 2, 0
_0807E62C: .4byte gUnknown_08396FC4
_0807E630: .4byte 0x000006cc
_0807E634:
	bl sub_807DA14
	ldr r0, _0807E644 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E648 @ =0x000006cc
	adds r1, r2
	b _0807E66C
	.align 2, 0
_0807E644: .4byte gUnknown_08396FC4
_0807E648: .4byte 0x000006cc
_0807E64C:
	bl sub_807DA4C
	ldr r0, _0807E674 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807E678 @ =0x0000073c
	adds r0, r2, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bne _0807E688
	ldr r0, _0807E67C @ =0x000006d2
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807E680 @ =0x000006cc
	adds r1, r2, r0
_0807E66C:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807E688
	.align 2, 0
_0807E674: .4byte gUnknown_08396FC4
_0807E678: .4byte 0x0000073c
_0807E67C: .4byte 0x000006d2
_0807E680: .4byte 0x000006cc
_0807E684:
	bl sub_807DA4C
_0807E688:
	pop {r0}
	bx r0
	thumb_func_end sub_807E174

	thumb_func_start sub_807E258
sub_807E258: @ 807E68C
	movs r0, 0
	bx lr
	thumb_func_end sub_807E258

	thumb_func_start sub_807E25C
sub_807E25C: @ 807E690
	push {lr}
	ldr r0, _0807E6A0 @ =task50_0807B6D4
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E6A0: .4byte task50_0807B6D4
	thumb_func_end sub_807E25C

	thumb_func_start task50_0807B6D4
task50_0807B6D4: @ 807E6A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807E6C8 @ =gTasks
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0807E792
	lsls r0, 2
	ldr r1, _0807E6CC @ =_0807E6D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E6C8: .4byte gTasks
_0807E6CC: .4byte _0807E6D0
	.align 2, 0
_0807E6D0:
	.4byte _0807E6E4
	.4byte _0807E706
	.4byte _0807E734
	.4byte _0807E768
	.4byte _0807E788
_0807E6E4:
	movs r2, 0
	strh r2, [r3, 0xA]
	strh r2, [r3, 0xC]
	ldr r1, _0807E728 @ =0x04000048
	ldrh r0, [r1]
	strh r0, [r3, 0xE]
	ldr r4, _0807E72C @ =0x00003f3f
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x8
	movs r0, 0x9E
	strh r0, [r1]
	ldr r0, _0807E730 @ =0x04000054
	strh r2, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0807E706:
	ldrh r0, [r3, 0xA]
	adds r0, 0x3
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0807E718
	movs r0, 0x10
	strh r0, [r3, 0xA]
_0807E718:
	ldr r0, _0807E730 @ =0x04000054
	ldrh r1, [r3, 0xA]
	strh r1, [r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0xF
	ble _0807E792
	b _0807E778
	.align 2, 0
_0807E728: .4byte 0x04000048
_0807E72C: .4byte 0x00003f3f
_0807E730: .4byte 0x04000054
_0807E734:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0807E792
	strh r1, [r3, 0xC]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _0807E75A
	strh r1, [r3, 0xA]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0807E75A:
	ldr r1, _0807E764 @ =0x04000054
	ldrh r0, [r3, 0xA]
	strh r0, [r1]
	b _0807E792
	.align 2, 0
_0807E764: .4byte 0x04000054
_0807E768:
	ldr r0, _0807E780 @ =0x04000050
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _0807E784 @ =0x04000048
	ldrh r0, [r3, 0xE]
	strh r0, [r1]
_0807E778:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _0807E792
	.align 2, 0
_0807E780: .4byte 0x04000050
_0807E784: .4byte 0x04000048
_0807E788:
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0807E792:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807B6D4

	thumb_func_start sub_807E364
sub_807E364: @ 807E798
	push {r4,lr}
	ldr r0, _0807E7E8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E7EC @ =0x000006cc
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807E7F0 @ =0x000006d2
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, 0x4
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _0807E7F4 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x8
	strb r0, [r2]
	ldr r2, _0807E7F8 @ =0x000006dc
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, 0x3
	adds r2, r1, r4
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, _0807E7FC @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _0807E800 @ =0x000006c2
	adds r1, r2
	movs r0, 0x14
	strb r0, [r1]
	movs r0, 0x55
	bl sub_807DD5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E7E8: .4byte gUnknown_08396FC4
_0807E7EC: .4byte 0x000006cc
_0807E7F0: .4byte 0x000006d2
_0807E7F4: .4byte 0x000006db
_0807E7F8: .4byte 0x000006dc
_0807E7FC: .4byte 0x000006c1
_0807E800: .4byte 0x000006c2
	thumb_func_end sub_807E364

	thumb_func_start sub_807E3D0
sub_807E3D0: @ 807E804
	push {r4,lr}
	bl sub_807E364
	ldr r0, _0807E82C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807E830 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E824
	adds r4, r1, r2
_0807E81A:
	bl sub_807E400
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E81A
_0807E824:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E82C: .4byte gUnknown_08396FC4
_0807E830: .4byte 0x000006d2
	thumb_func_end sub_807E3D0

	thumb_func_start sub_807E400
sub_807E400: @ 807E834
	push {r4,r5,lr}
	ldr r0, _0807E850 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807E854 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807E864
	cmp r0, 0x1
	bgt _0807E858
	cmp r0, 0
	beq _0807E85E
	b _0807E888
	.align 2, 0
_0807E850: .4byte gUnknown_08396FC4
_0807E854: .4byte 0x000006cc
_0807E858:
	cmp r0, 0x2
	beq _0807E870
	b _0807E888
_0807E85E:
	bl sub_807E7A4
	b _0807E882
_0807E864:
	bl sub_807E7B4
	lsls r0, 24
	cmp r0, 0
	bne _0807E888
	b _0807E882
_0807E870:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	bne _0807E888
	ldr r0, _0807E890 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807E882:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807E888:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E890: .4byte 0x000006d2
	thumb_func_end sub_807E400

	thumb_func_start sub_807E460
sub_807E460: @ 807E894
	push {r4,r5,lr}
	ldr r0, _0807E8B0 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807E8B4 @ =0x000006ce
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _0807E8B8
	cmp r1, 0x1
	beq _0807E8EC
	movs r0, 0
	b _0807E91A
	.align 2, 0
_0807E8B0: .4byte gUnknown_08396FC4
_0807E8B4: .4byte 0x000006ce
_0807E8B8:
	ldr r5, _0807E8D8 @ =0x000006d1
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807E8CA
	cmp r0, 0x5
	beq _0807E8CA
	cmp r0, 0xD
	bne _0807E8E0
_0807E8CA:
	ldr r0, [r4]
	ldr r1, _0807E8DC @ =0x000006ce
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0]
	movs r0, 0
	b _0807E91A
	.align 2, 0
_0807E8D8: .4byte 0x000006d1
_0807E8DC: .4byte 0x000006ce
_0807E8E0:
	ldr r4, _0807E90C @ =0x000006d9
	adds r0, r2, r4
	strb r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807E8EC:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	bne _0807E918
	bl sub_807E974
	ldr r0, _0807E910 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r5, _0807E914 @ =0x000006ce
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807E91A
	.align 2, 0
_0807E90C: .4byte 0x000006d9
_0807E910: .4byte gUnknown_08396FC4
_0807E914: .4byte 0x000006ce
_0807E918:
	movs r0, 0x1
_0807E91A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807E460

	thumb_func_start sub_807E4EC
sub_807E4EC: @ 807E920
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0807E934
	ldr r0, _0807E9D8 @ =0x00000169
	strh r0, [r7, 0x30]
_0807E934:
	movs r2, 0x30
	ldrsh r1, [r7, r2]
	ldr r0, _0807E9DC @ =0x41c64e6d
	muls r0, r1
	ldr r3, _0807E9E0 @ =0x00003039
	adds r0, r3
	lsls r0, 1
	lsrs r0, 17
	movs r1, 0x96
	lsls r1, 2
	bl __umodsi3
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x30]
	ldr r1, _0807E9E4 @ =gUnknown_0839AAC4
	ldr r0, _0807E9E8 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r2, _0807E9EC @ =0x000006dc
	adds r5, r2
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldrh r6, [r0]
	movs r3, 0x30
	ldrsh r0, [r7, r3]
	movs r1, 0x1E
	bl __modsi3
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r0, r4, 3
	strh r0, [r7, 0x32]
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	lsls r4, 7
	strh r4, [r7, 0x32]
	asrs r0, 9
	strh r0, [r7, 0x34]
	ldr r2, _0807E9F0 @ =gUnknown_0839AABC
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	muls r1, r6
	subs r4, r1
	strh r4, [r7, 0x32]
	ldrb r1, [r5]
	lsls r1, 2
	adds r2, 0x2
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	muls r1, r6
	subs r0, r1
	strh r0, [r7, 0x34]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	mov r3, r8
	strh r3, [r7, 0x36]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	strh r6, [r7, 0x2E]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9D8: .4byte 0x00000169
_0807E9DC: .4byte 0x41c64e6d
_0807E9E0: .4byte 0x00003039
_0807E9E4: .4byte gUnknown_0839AAC4
_0807E9E8: .4byte gUnknown_08396FC4
_0807E9EC: .4byte 0x000006dc
_0807E9F0: .4byte gUnknown_0839AABC
	thumb_func_end sub_807E4EC

	thumb_func_start sub_807E5C0
sub_807E5C0: @ 807E9F4
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0807EAD0
	ldr r3, _0807EA68 @ =gUnknown_0839AABC
	ldr r4, _0807EA6C @ =gUnknown_08396FC4
	ldr r2, [r4]
	ldr r0, _0807EA70 @ =0x000006dc
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0]
	ldrh r0, [r5, 0x32]
	adds r1, r0
	strh r1, [r5, 0x32]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, 0x2
	adds r0, r3
	ldrh r0, [r0]
	ldrh r2, [r5, 0x34]
	adds r0, r2
	strh r0, [r5, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	lsls r0, 16
	asrs r2, r0, 20
	strh r2, [r5, 0x22]
	movs r3, 0x38
	ldrsh r0, [r5, r3]
	adds r3, r4, 0
	cmp r0, 0
	beq _0807EA74
	adds r0, r1, 0
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _0807EA74
	adds r1, r2, 0
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _0807EA74
	cmp r1, 0xB0
	bgt _0807EA74
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	b _0807EA7E
	.align 2, 0
_0807EA68: .4byte gUnknown_0839AABC
_0807EA6C: .4byte gUnknown_08396FC4
_0807EA70: .4byte 0x000006dc
_0807EA74:
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_0807EA7E:
	strb r1, [r0]
	adds r4, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807EAF0
	ldr r0, [r3]
	ldr r1, _0807EAC4 @ =0x000006dc
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0x1
	strh r0, [r5, 0x36]
	ldr r1, _0807EAC8 @ =gSpriteCoordOffsetX
	ldrh r0, [r5, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldr r1, _0807EACC @ =gSpriteCoordOffsetY
	ldrh r0, [r5, 0x22]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807EAF0
	.align 2, 0
_0807EAC4: .4byte 0x000006dc
_0807EAC8: .4byte gSpriteCoordOffsetX
_0807EACC: .4byte gSpriteCoordOffsetY
_0807EAD0:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807EAF0
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl sub_807E4EC
_0807EAF0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807E5C0

	thumb_func_start sub_807E6C4
sub_807E6C4: @ 807EAF8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807EB18
	adds r0, r4, 0
	bl sub_807E4EC
	ldr r0, _0807EB14 @ =sub_807E5C0
	str r0, [r4, 0x1C]
	b _0807EB1C
	.align 2, 0
_0807EB14: .4byte sub_807E5C0
_0807EB18:
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
_0807EB1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807E6C4

	thumb_func_start sub_807E6F0
sub_807E6F0: @ 807EB24
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r2, _0807EBA8 @ =gUnknown_0839AAC4
	ldr r0, _0807EBAC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807EBB0 @ =0x000006dc
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	adds r2, 0x2
	adds r0, r2
	ldrh r4, [r0]
	add r4, r8
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807EBB4 @ =0x0000ffff
	cmp r6, r0
	beq _0807EB82
	adds r5, r0, 0
_0807EB72:
	adds r0, r7, 0
	bl sub_807E4EC
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r5
	bne _0807EB72
_0807EB82:
	cmp r4, r8
	bcs _0807EBB8
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0807EBB4 @ =0x0000ffff
	cmp r4, r0
	beq _0807EBA4
	adds r5, r0, 0
_0807EB94:
	adds r0, r7, 0
	bl sub_807E5C0
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bne _0807EB94
_0807EBA4:
	movs r0, 0
	b _0807EBCC
	.align 2, 0
_0807EBA8: .4byte gUnknown_0839AAC4
_0807EBAC: .4byte gUnknown_08396FC4
_0807EBB0: .4byte 0x000006dc
_0807EBB4: .4byte 0x0000ffff
_0807EBB8:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r7, 0x2E]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_0807EBCC:
	strh r0, [r7, 0x3A]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807E6F0

	thumb_func_start sub_807E7A4
sub_807E7A4: @ 807EBD8
	push {lr}
	ldr r0, _0807EBE4 @ =gUnknown_0839AACC
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807EBE4: .4byte gUnknown_0839AACC
	thumb_func_end sub_807E7A4

	thumb_func_start sub_807E7B4
sub_807E7B4: @ 807EBE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0807EC94 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r0, _0807EC98 @ =0x000006da
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, 0x18
	bne _0807EC02
	b _0807ED08
_0807EC02:
	ldrb r7, [r2]
	ldr r0, _0807EC9C @ =gSpriteTemplate_839AAA4
	ldr r2, _0807ECA0 @ =gUnknown_0839AA08
	lsls r6, r7, 2
	adds r2, r6, r2
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0807ECB0
	ldr r3, _0807ECA4 @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strh r0, [r1, 0x38]
	lsls r2, r7, 3
	adds r0, r2, r7
	lsls r0, 4
	adds r0, r7
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807ECA8 @ =0x00000257
	mov r10, r6
	mov r9, r3
	mov r12, r4
	mov r8, r2
	cmp r0, r1
	ble _0807EC66
	adds r2, r1, 0
_0807EC4E:
	adds r0, r4, r5
	lsls r0, 2
	ldr r6, _0807ECA4 @ =gSprites
	adds r0, r6
	ldr r3, _0807ECAC @ =0xfffffda8
	ldrh r6, [r0, 0x30]
	adds r1, r3, r6
	strh r1, [r0, 0x30]
	lsls r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0807EC4E
_0807EC66:
	mov r0, r12
	adds r4, r0, r5
	lsls r4, 2
	add r4, r9
	adds r0, r4, 0
	bl sub_807E4EC
	mov r3, r8
	adds r1, r3, r7
	adds r0, r4, 0
	bl sub_807E6F0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807EC94 @ =gUnknown_08396FC4
	ldr r0, [r0]
	add r0, r10
	str r4, [r0]
	b _0807ECB6
	.align 2, 0
_0807EC94: .4byte gUnknown_08396FC4
_0807EC98: .4byte 0x000006da
_0807EC9C: .4byte gSpriteTemplate_839AAA4
_0807ECA0: .4byte gUnknown_0839AA08
_0807ECA4: .4byte gSprites
_0807ECA8: .4byte 0x00000257
_0807ECAC: .4byte 0xfffffda8
_0807ECB0:
	adds r1, r4, r6
	movs r0, 0
	str r0, [r1]
_0807ECB6:
	ldr r0, _0807ECEC @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r6, _0807ECF0 @ =0x000006da
	adds r1, r2, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bne _0807ED0C
	movs r3, 0
	adds r1, r2, 0
	ldr r5, _0807ECF4 @ =sub_807E5C0
	ldr r4, _0807ECF8 @ =sub_807E6C4
_0807ECD4:
	lsls r0, r3, 2
	adds r0, r1, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _0807ECFE
	movs r6, 0x3A
	ldrsh r0, [r2, r6]
	cmp r0, 0
	bne _0807ECFC
	str r5, [r2, 0x1C]
	b _0807ECFE
	.align 2, 0
_0807ECEC: .4byte gUnknown_08396FC4
_0807ECF0: .4byte 0x000006da
_0807ECF4: .4byte sub_807E5C0
_0807ECF8: .4byte sub_807E6C4
_0807ECFC:
	str r4, [r2, 0x1C]
_0807ECFE:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x17
	bls _0807ECD4
_0807ED08:
	movs r0, 0
	b _0807ED0E
_0807ED0C:
	movs r0, 0x1
_0807ED0E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807E7B4

	thumb_func_start sub_807E8E8
sub_807E8E8: @ 807ED1C
	push {r4-r7,lr}
	ldr r0, _0807ED38 @ =gUnknown_08396FC4
	ldr r3, [r0]
	movs r0, 0xDB
	lsls r0, 3
	adds r4, r3, r0
	ldr r1, _0807ED3C @ =0x000006d9
	adds r5, r3, r1
	ldrb r0, [r4]
	ldrb r7, [r5]
	cmp r0, r7
	bne _0807ED40
	movs r0, 0
	b _0807EDA2
	.align 2, 0
_0807ED38: .4byte gUnknown_08396FC4
_0807ED3C: .4byte 0x000006d9
_0807ED40:
	ldr r0, _0807ED78 @ =0x000006d6
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	ldr r7, _0807ED7C @ =0x000006db
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807EDA0
	strh r6, [r2]
	ldrb r0, [r4]
	adds r1, r0, 0
	ldrb r5, [r5]
	cmp r1, r5
	bcs _0807ED80
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, r1, 2
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x38]
	b _0807EDA0
	.align 2, 0
_0807ED78: .4byte 0x000006d6
_0807ED7C: .4byte 0x000006db
_0807ED80:
	subs r0, 0x1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r0, [r0]
	strh r6, [r0, 0x38]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0807EDA0:
	movs r0, 0x1
_0807EDA2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807E8E8

	thumb_func_start sub_807E974
sub_807E974: @ 807EDA8
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _0807EDF0 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r3, _0807EDF4 @ =0x000006da
	adds r1, r2, r3
	adds r7, r0, 0
	ldrb r1, [r1]
	cmp r4, r1
	bcs _0807EDDA
	adds r5, r2, 0
	adds r6, r5, r3
_0807EDC0:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807EDCE
	bl DestroySprite
_0807EDCE:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807EDC0
_0807EDDA:
	ldr r0, [r7]
	ldr r1, _0807EDF4 @ =0x000006da
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0807EDF8 @ =0x00001206
	bl FreeSpriteTilesByTag
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EDF0: .4byte gUnknown_08396FC4
_0807EDF4: .4byte 0x000006da
_0807EDF8: .4byte 0x00001206
	thumb_func_end sub_807E974

	thumb_func_start sub_807E9C8
sub_807E9C8: @ 807EDFC
	push {r4,lr}
	ldr r0, _0807EE38 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807EE3C @ =0x000006cc
	adds r0, r1, r2
	movs r2, 0
	movs r3, 0
	strh r3, [r0]
	ldr r4, _0807EE40 @ =0x000006d2
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _0807EE44 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r4, 0x10
	adds r2, r1, r4
	movs r0, 0x14
	strb r0, [r2]
	ldr r0, _0807EE48 @ =0x000006e5
	adds r2, r1, r0
	movs r0, 0x10
	strb r0, [r2]
	movs r2, 0xDC
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EE38: .4byte gUnknown_08396FC4
_0807EE3C: .4byte 0x000006cc
_0807EE40: .4byte 0x000006d2
_0807EE44: .4byte 0x000006c1
_0807EE48: .4byte 0x000006e5
	thumb_func_end sub_807E9C8

	thumb_func_start sub_807EA18
sub_807EA18: @ 807EE4C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl sub_807E9C8
	ldr r2, _0807EEAC @ =gUnknown_08396FC4
	ldr r1, [r2]
	ldr r3, _0807EEB0 @ =0x000006d2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EEA2
	mov r8, r2
	adds r7, r1, r3
_0807EE68:
	bl snowflakes_progress2
	movs r4, 0
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _0807EEB4 @ =0x000006e4
	adds r0, r3
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807EE9C
	ldr r0, _0807EEAC @ =gUnknown_08396FC4
	ldr r5, [r0]
	adds r6, r5, r3
_0807EE82:
	lsls r1, r4, 2
	adds r0, r5, 0
	adds r0, 0x60
	adds r0, r1
	ldr r0, [r0]
	bl sub_807ED48
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807EE82
_0807EE9C:
	ldrb r0, [r7]
	cmp r0, 0
	beq _0807EE68
_0807EEA2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EEAC: .4byte gUnknown_08396FC4
_0807EEB0: .4byte 0x000006d2
_0807EEB4: .4byte 0x000006e4
	thumb_func_end sub_807EA18

	thumb_func_start snowflakes_progress2
snowflakes_progress2: @ 807EEB8
	push {r4,r5,lr}
	ldr r0, _0807EEE8 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807EEEC @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	bne _0807EEE0
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EEE0
	ldr r0, _0807EEF0 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807EEE0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EEE8: .4byte gUnknown_08396FC4
_0807EEEC: .4byte 0x000006cc
_0807EEF0: .4byte 0x000006d2
	thumb_func_end snowflakes_progress2

	thumb_func_start sub_807EAC0
sub_807EAC0: @ 807EEF4
	push {r4,lr}
	ldr r0, _0807EF0C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807EF10 @ =0x000006ce
	adds r3, r2, r0
	ldrh r1, [r3]
	cmp r1, 0
	beq _0807EF14
	cmp r1, 0x1
	beq _0807EF26
	movs r0, 0
	b _0807EF52
	.align 2, 0
_0807EF0C: .4byte gUnknown_08396FC4
_0807EF10: .4byte 0x000006ce
_0807EF14:
	ldr r4, _0807EF44 @ =0x000006e5
	adds r0, r2, r4
	strb r1, [r0]
	subs r4, 0x5
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807EF26:
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EF50
	ldr r0, _0807EF48 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807EF4C @ =0x000006ce
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807EF52
	.align 2, 0
_0807EF44: .4byte 0x000006e5
_0807EF48: .4byte gUnknown_08396FC4
_0807EF4C: .4byte 0x000006ce
_0807EF50:
	movs r0, 0x1
_0807EF52:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807EAC0

	thumb_func_start snowflakes_progress
snowflakes_progress: @ 807EF58
	push {r4,lr}
	ldr r0, _0807EF74 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807EF78 @ =0x000006e4
	adds r3, r1, r0
	ldr r4, _0807EF7C @ =0x000006e5
	adds r2, r1, r4
	ldrb r0, [r3]
	ldrb r4, [r2]
	cmp r0, r4
	bne _0807EF80
	movs r0, 0
	b _0807EFC2
	.align 2, 0
_0807EF74: .4byte gUnknown_08396FC4
_0807EF78: .4byte 0x000006e4
_0807EF7C: .4byte 0x000006e5
_0807EF80:
	movs r0, 0xDC
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x24
	bls _0807EFAA
	movs r0, 0
	strh r0, [r1]
	ldrb r0, [r3]
	ldrb r2, [r2]
	cmp r0, r2
	bcs _0807EFA6
	bl snowflake_add
	b _0807EFAA
_0807EFA6:
	bl snowflake_remove
_0807EFAA:
	ldr r0, _0807EFC8 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r2, _0807EFCC @ =0x000006e4
	adds r1, r0, r2
	ldr r4, _0807EFD0 @ =0x000006e5
	adds r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0807EFC2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807EFC8: .4byte gUnknown_08396FC4
_0807EFCC: .4byte 0x000006e4
_0807EFD0: .4byte 0x000006e5
	thumb_func_end snowflakes_progress

	thumb_func_start snowflake_add
snowflake_add: @ 807EFD4
	push {r4-r6,lr}
	ldr r0, _0807F028 @ =gSpriteTemplate_839AB04
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807F038
	ldr r0, _0807F02C @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldr r0, _0807F030 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _0807F034 @ =0x000006e4
	adds r6, r5, r0
	ldrb r0, [r6]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_807EC40
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, 0x1
	strb r1, [r6]
	lsls r0, 24
	lsrs r0, 22
	adds r5, 0x60
	adds r5, r0
	str r4, [r5]
	movs r0, 0x1
	b _0807F03A
	.align 2, 0
_0807F028: .4byte gSpriteTemplate_839AB04
_0807F02C: .4byte gSprites
_0807F030: .4byte gUnknown_08396FC4
_0807F034: .4byte 0x000006e4
_0807F038:
	movs r0, 0
_0807F03A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end snowflake_add

	thumb_func_start snowflake_remove
snowflake_remove: @ 807F040
	push {lr}
	ldr r0, _0807F054 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F058 @ =0x000006e4
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0807F05C
	movs r0, 0
	b _0807F070
	.align 2, 0
_0807F054: .4byte gUnknown_08396FC4
_0807F058: .4byte 0x000006e4
_0807F05C:
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r1, 0x60
	adds r1, r0
	ldr r0, [r1]
	bl DestroySprite
	movs r0, 0x1
_0807F070:
	pop {r1}
	bx r1
	thumb_func_end snowflake_remove

	thumb_func_start sub_807EC40
sub_807EC40: @ 807F074
	push {r4-r7,lr}
	adds r5, r0, 0
	bl Random
	movs r1, 0x36
	ldrsh r2, [r5, r1]
	lsls r1, r2, 2
	adds r1, r2
	movs r2, 0x7
	ands r1, r2
	lsls r4, r1, 4
	subs r4, r1
	lsls r4, 1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _0807F118 @ =gSpriteCoordOffsetY
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r2, 0x3
	negs r2, r2
	adds r1, r2, 0
	subs r1, r0
	movs r7, 0
	strh r1, [r5, 0x22]
	ldr r1, _0807F11C @ =gSpriteCoordOffsetX
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	subs r4, r0
	strh r4, [r5, 0x20]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	lsls r0, 7
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r6, r0, 0
	movs r4, 0x3
	ands r4, r6
	lsls r0, r4, 2
	adds r0, r4
	adds r0, 0x40
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	bics r1, r6
	adds r0, r5, 0
	bl StartSpriteAnim
	strh r7, [r5, 0x34]
	movs r0, 0x1
	cmp r4, 0
	bne _0807F104
	movs r0, 0x2
_0807F104:
	strh r0, [r5, 0x32]
	movs r0, 0x1F
	ands r0, r6
	adds r0, 0xD2
	strh r0, [r5, 0x3A]
	strh r7, [r5, 0x38]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F118: .4byte gSpriteCoordOffsetY
_0807F11C: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_807EC40

	thumb_func_start sub_807ECEC
sub_807ECEC: @ 807F120
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807F16C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F170 @ =0x000006e2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x12
	bls _0807F166
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0807F174 @ =sub_807ED48
	str r0, [r3, 0x1C]
	ldr r1, _0807F178 @ =gSpriteCoordOffsetY
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFA
	subs r1, r0
	movs r2, 0
	strh r1, [r3, 0x22]
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	lsls r0, 7
	strh r0, [r3, 0x2E]
	strh r2, [r4]
_0807F166:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F16C: .4byte gUnknown_08396FC4
_0807F170: .4byte 0x000006e2
_0807F174: .4byte sub_807ED48
_0807F178: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807ECEC

	thumb_func_start sub_807ED48
sub_807ED48: @ 807F17C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	ldr r1, _0807F1F4 @ =gSineTable
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0807F1AE
	adds r0, 0x3F
_0807F1AE:
	asrs r0, 6
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x28
	movs r5, 0
	ldrsb r5, [r0, r5]
	ldrh r0, [r4, 0x20]
	adds r0, r5
	ldr r1, _0807F1F8 @ =gSpriteCoordOffsetX
	ldrh r1, [r1]
	adds r3, r1, r0
	ldr r2, _0807F1FC @ =0x000001ff
	adds r0, r2, 0
	ands r3, r0
	adds r2, r3, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0807F1E0
	ldr r3, _0807F200 @ =0xffffff00
	adds r0, r3, 0
	orrs r2, r0
	lsls r0, r2, 16
	lsrs r3, r0, 16
_0807F1E0:
	lsls r0, r3, 16
	asrs r0, 16
	movs r2, 0x3
	negs r2, r2
	cmp r0, r2
	bge _0807F204
	adds r1, r5
	movs r0, 0xF2
	subs r0, r1
	b _0807F20C
	.align 2, 0
_0807F1F4: .4byte gSineTable
_0807F1F8: .4byte gSpriteCoordOffsetX
_0807F1FC: .4byte 0x000001ff
_0807F200: .4byte 0xffffff00
_0807F204:
	cmp r0, 0xF2
	ble _0807F20E
	adds r0, r1, r5
	subs r0, r2, r0
_0807F20C:
	strh r0, [r4, 0x20]
_0807F20E:
	adds r0, r4, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	ldr r1, _0807F24C @ =gSpriteCoordOffsetY
	ldrh r1, [r1]
	adds r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0xA4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807F250
	adds r1, r3
	movs r0, 0xFA
	subs r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	b _0807F27C
	.align 2, 0
_0807F24C: .4byte gSpriteCoordOffsetY
_0807F250:
	adds r0, r2, 0
	subs r0, 0xF3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807F27C
	movs r1, 0
	movs r0, 0xA3
	strh r0, [r4, 0x22]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807F2B0 @ =sub_807ECEC
	str r0, [r4, 0x1C]
_0807F27C:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x3A
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0807F2A8
	adds r0, r4, 0
	bl sub_807EC40
	movs r0, 0xFA
	strh r0, [r4, 0x22]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807F2B0 @ =sub_807ECEC
	str r0, [r4, 0x1C]
_0807F2A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F2B0: .4byte sub_807ECEC
	thumb_func_end sub_807ED48

	thumb_func_start sub_807EE80
sub_807EE80: @ 807F2B4
	push {r4,r5,lr}
	ldr r0, _0807F30C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F310 @ =0x000006cc
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807F314 @ =0x000006d2
	adds r4, r1, r5
	strb r3, [r4]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807F318 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	ldr r2, _0807F31C @ =0x000006dc
	adds r0, r1, r2
	strb r3, [r0]
	adds r5, 0x3
	adds r2, r1, r5
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0807F320 @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r5, 0x17
	adds r2, r1, r5
	movs r0, 0x14
	strb r0, [r2]
	strb r3, [r4]
	ldr r0, _0807F324 @ =0x000006ed
	adds r1, r0
	strb r3, [r1]
	movs r0, 0x51
	bl sub_807DD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F30C: .4byte gUnknown_08396FC4
_0807F310: .4byte 0x000006cc
_0807F314: .4byte 0x000006d2
_0807F318: .4byte 0x000006db
_0807F31C: .4byte 0x000006dc
_0807F320: .4byte 0x000006c1
_0807F324: .4byte 0x000006ed
	thumb_func_end sub_807EE80

	thumb_func_start sub_807EEF4
sub_807EEF4: @ 807F328
	push {r4,lr}
	bl sub_807EE80
	ldr r0, _0807F350 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F354 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F348
	adds r4, r1, r2
_0807F33E:
	bl sub_807EFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F33E
_0807F348:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F350: .4byte gUnknown_08396FC4
_0807F354: .4byte 0x000006d2
	thumb_func_end sub_807EEF4

	thumb_func_start sub_807EF24
sub_807EF24: @ 807F358
	push {r4,r5,lr}
	ldr r0, _0807F3AC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F3B0 @ =0x000006cc
	adds r0, r1, r2
	movs r4, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807F3B4 @ =0x000006d2
	adds r3, r1, r5
	strb r4, [r3]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807F3B8 @ =0x000006db
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	adds r5, 0x6
	adds r2, r1, r5
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _0807F3BC @ =0x000006d9
	adds r2, r1, r0
	movs r0, 0x18
	strb r0, [r2]
	subs r5, 0x1B
	adds r2, r1, r5
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0807F3C0 @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	strb r4, [r3]
	movs r0, 0x53
	bl sub_807DD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F3AC: .4byte gUnknown_08396FC4
_0807F3B0: .4byte 0x000006cc
_0807F3B4: .4byte 0x000006d2
_0807F3B8: .4byte 0x000006db
_0807F3BC: .4byte 0x000006d9
_0807F3C0: .4byte 0x000006c2
	thumb_func_end sub_807EF24

	thumb_func_start sub_807EF90
sub_807EF90: @ 807F3C4
	push {r4,lr}
	bl sub_807EF24
	ldr r0, _0807F3EC @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F3F0 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F3E4
	adds r4, r1, r2
_0807F3DA:
	bl sub_807EFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F3DA
_0807F3E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F3EC: .4byte gUnknown_08396FC4
_0807F3F0: .4byte 0x000006d2
	thumb_func_end sub_807EF90

	thumb_func_start sub_807EFC0
sub_807EFC0: @ 807F3F4
	push {r4,r5,lr}
	bl sub_807F434
	ldr r0, _0807F414 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F418 @ =0x000006cc
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xE
	bls _0807F40A
	b _0807F76A
_0807F40A:
	lsls r0, 2
	ldr r1, _0807F41C @ =_0807F420
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807F414: .4byte gUnknown_08396FC4
_0807F418: .4byte 0x000006cc
_0807F41C: .4byte _0807F420
	.align 2, 0
_0807F420:
	.4byte _0807F45C
	.4byte _0807F478
	.4byte _0807F49C
	.4byte _0807F4CC
	.4byte _0807F4F0
	.4byte _0807F520
	.4byte _0807F550
	.4byte _0807F57C
	.4byte _0807F59A
	.4byte _0807F5F8
	.4byte _0807F67C
	.4byte _0807F6A4
	.4byte _0807F6D4
	.4byte _0807F718
	.4byte _0807F74C
_0807F45C:
	bl sub_807E7A4
	ldr r0, _0807F470 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F474 @ =0x000006cc
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F768
	.align 2, 0
_0807F470: .4byte gUnknown_08396FC4
_0807F474: .4byte 0x000006cc
_0807F478:
	bl sub_807E7B4
	lsls r0, 24
	cmp r0, 0
	beq _0807F484
	b _0807F76A
_0807F484:
	ldr r0, _0807F494 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r3, _0807F498 @ =0x000006cc
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F768
	.align 2, 0
_0807F494: .4byte gUnknown_08396FC4
_0807F498: .4byte 0x000006cc
_0807F49C:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	beq _0807F4A8
	b _0807F76A
_0807F4A8:
	ldr r0, _0807F4C0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F4C4 @ =0x000006d2
	adds r2, r1, r0
	movs r0, 0x1
	strb r0, [r2]
	ldr r2, _0807F4C8 @ =0x000006cc
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F768
	.align 2, 0
_0807F4C0: .4byte gUnknown_08396FC4
_0807F4C4: .4byte 0x000006d2
_0807F4C8: .4byte 0x000006cc
_0807F4CC:
	ldr r0, _0807F4E4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r3, _0807F4E8 @ =0x000006c6
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F4DC
	b _0807F76A
_0807F4DC:
	ldr r0, _0807F4EC @ =0x000006cc
	adds r1, r0
	movs r0, 0x6
	b _0807F768
	.align 2, 0
_0807F4E4: .4byte gUnknown_08396FC4
_0807F4E8: .4byte 0x000006c6
_0807F4EC: .4byte 0x000006cc
_0807F4F0:
	ldr r0, _0807F540 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r2, _0807F544 @ =0x000006ea
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r5, 0xB4
	lsls r5, 1
	adds r1, r5, 0
	bl __umodsi3
	adds r0, r5
	ldr r3, _0807F548 @ =0x000006e6
	adds r1, r4, r3
	strh r0, [r1]
	ldr r0, _0807F54C @ =0x000006cc
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F520:
	ldr r0, _0807F540 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r3, _0807F548 @ =0x000006e6
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0807F536
	b _0807F76A
_0807F536:
	ldr r0, _0807F54C @ =0x000006cc
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F768
	.align 2, 0
_0807F540: .4byte gUnknown_08396FC4
_0807F544: .4byte 0x000006ea
_0807F548: .4byte 0x000006e6
_0807F54C: .4byte 0x000006cc
_0807F550:
	ldr r0, _0807F570 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r1, _0807F574 @ =0x000006ea
	adds r0, r4, r1
	movs r5, 0x1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	ldr r2, _0807F578 @ =0x000006eb
	adds r1, r4, r2
	strb r0, [r1]
	b _0807F5D8
	.align 2, 0
_0807F570: .4byte gUnknown_08396FC4
_0807F574: .4byte 0x000006ea
_0807F578: .4byte 0x000006eb
_0807F57C:
	bl Random
	ldr r1, _0807F5E4 @ =gUnknown_08396FC4
	ldr r2, [r1]
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x1
	ldr r3, _0807F5E8 @ =0x000006ec
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807F5EC @ =0x000006cc
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F59A:
	movs r0, 0x13
	bl sub_807D5BC
	ldr r0, _0807F5E4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F5F0 @ =0x000006eb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F5BE
	ldr r3, _0807F5E8 @ =0x000006ec
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0807F5BE
	movs r0, 0x14
	bl sub_807F3F8
_0807F5BE:
	bl Random
	ldr r1, _0807F5E4 @ =gUnknown_08396FC4
	ldr r4, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	ldr r2, _0807F5F4 @ =0x000006e6
	adds r1, r4, r2
	strh r0, [r1]
_0807F5D8:
	ldr r3, _0807F5EC @ =0x000006cc
	adds r4, r3
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F76A
	.align 2, 0
_0807F5E4: .4byte gUnknown_08396FC4
_0807F5E8: .4byte 0x000006ec
_0807F5EC: .4byte 0x000006cc
_0807F5F0: .4byte 0x000006eb
_0807F5F4: .4byte 0x000006e6
_0807F5F8:
	ldr r0, _0807F644 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r0, _0807F648 @ =0x000006e6
	adds r5, r4, r0
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0807F60E
	b _0807F76A
_0807F60E:
	movs r0, 0x3
	bl sub_807D5BC
	ldr r2, _0807F64C @ =0x000006ea
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, _0807F650 @ =0x000006ec
	adds r1, r4, r3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _0807F658
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	strh r0, [r5]
	ldr r0, _0807F654 @ =0x000006cc
	adds r1, r4, r0
	movs r0, 0xA
	b _0807F768
	.align 2, 0
_0807F644: .4byte gUnknown_08396FC4
_0807F648: .4byte 0x000006e6
_0807F64C: .4byte 0x000006ea
_0807F650: .4byte 0x000006ec
_0807F654: .4byte 0x000006cc
_0807F658:
	ldr r1, _0807F668 @ =0x000006eb
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F670
	ldr r2, _0807F66C @ =0x000006cc
	adds r1, r4, r2
	b _0807F766
	.align 2, 0
_0807F668: .4byte 0x000006eb
_0807F66C: .4byte 0x000006cc
_0807F670:
	ldr r3, _0807F678 @ =0x000006cc
	adds r1, r4, r3
	movs r0, 0xB
	b _0807F768
	.align 2, 0
_0807F678: .4byte 0x000006cc
_0807F67C:
	ldr r0, _0807F698 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807F69C @ =0x000006e6
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F76A
	ldr r3, _0807F6A0 @ =0x000006cc
	adds r1, r2, r3
	movs r0, 0x8
	b _0807F768
	.align 2, 0
_0807F698: .4byte gUnknown_08396FC4
_0807F69C: .4byte 0x000006e6
_0807F6A0: .4byte 0x000006cc
_0807F6A4:
	bl Random
	ldr r1, _0807F6C8 @ =gUnknown_08396FC4
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	ldr r3, _0807F6CC @ =0x000006e6
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _0807F6D0 @ =0x000006cc
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _0807F76A
	.align 2, 0
_0807F6C8: .4byte gUnknown_08396FC4
_0807F6CC: .4byte 0x000006e6
_0807F6D0: .4byte 0x000006cc
_0807F6D4:
	ldr r0, _0807F70C @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r1, _0807F710 @ =0x000006e6
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0807F76A
	movs r0, 0x64
	bl sub_807F3F8
	movs r0, 0x13
	bl sub_807D5BC
	bl Random
	movs r1, 0xF
	ands r1, r0
	adds r1, 0x1E
	strh r1, [r4]
	ldr r2, _0807F714 @ =0x000006cc
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F768
	.align 2, 0
_0807F70C: .4byte gUnknown_08396FC4
_0807F710: .4byte 0x000006e6
_0807F714: .4byte 0x000006cc
_0807F718:
	ldr r0, _0807F740 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r3, _0807F744 @ =0x000006e6
	adds r1, r4, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F76A
	movs r0, 0x13
	movs r1, 0x3
	movs r2, 0x5
	bl sub_807D5F0
	ldr r0, _0807F748 @ =0x000006cc
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F768
	.align 2, 0
_0807F740: .4byte gUnknown_08396FC4
_0807F744: .4byte 0x000006e6
_0807F748: .4byte 0x000006cc
_0807F74C:
	ldr r0, _0807F770 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807F774 @ =0x000006c6
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807F76A
	ldr r3, _0807F778 @ =0x000006ea
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807F77C @ =0x000006cc
	adds r1, r2, r0
_0807F766:
	movs r0, 0x4
_0807F768:
	strh r0, [r1]
_0807F76A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F770: .4byte gUnknown_08396FC4
_0807F774: .4byte 0x000006c6
_0807F778: .4byte 0x000006ea
_0807F77C: .4byte 0x000006cc
	thumb_func_end sub_807EFC0

	thumb_func_start sub_807F34C
sub_807F34C: @ 807F780
	push {r4-r6,lr}
	ldr r0, _0807F79C @ =gUnknown_08396FC4
	ldr r6, [r0]
	ldr r0, _0807F7A0 @ =0x000006ce
	adds r5, r6, r0
	ldrh r1, [r5]
	cmp r1, 0x1
	beq _0807F7B6
	cmp r1, 0x1
	bgt _0807F7A4
	cmp r1, 0
	beq _0807F7AA
	b _0807F81C
	.align 2, 0
_0807F79C: .4byte gUnknown_08396FC4
_0807F7A0: .4byte 0x000006ce
_0807F7A4:
	cmp r1, 0x2
	beq _0807F800
	b _0807F81C
_0807F7AA:
	ldr r2, _0807F7F0 @ =0x000006ea
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F7B6:
	bl sub_807EFC0
	ldr r0, _0807F7F4 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r1, _0807F7F0 @ =0x000006ea
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807F824
	subs r1, 0x19
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807F81C
	cmp r0, 0x5
	beq _0807F81C
	cmp r0, 0xD
	beq _0807F81C
	ldr r0, _0807F7F8 @ =0x000006d9
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0807F7FC @ =0x000006ce
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807F824
	.align 2, 0
_0807F7F0: .4byte 0x000006ea
_0807F7F4: .4byte gUnknown_08396FC4
_0807F7F8: .4byte 0x000006d9
_0807F7FC: .4byte 0x000006ce
_0807F800:
	bl sub_807E8E8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807F824
	bl sub_807E974
	ldr r1, _0807F820 @ =0x000006ed
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F81C:
	movs r0, 0
	b _0807F826
	.align 2, 0
_0807F820: .4byte 0x000006ed
_0807F824:
	movs r0, 0x1
_0807F826:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807F34C

	thumb_func_start sub_807F3F8
sub_807F3F8: @ 807F82C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807F860 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r0, _0807F864 @ =0x000006ed
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _0807F85A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	movs r2, 0xDD
	lsls r2, 3
	adds r1, r4, r2
	strh r0, [r1]
	movs r0, 0x1
	strb r0, [r5]
_0807F85A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F860: .4byte gUnknown_08396FC4
_0807F864: .4byte 0x000006ed
	thumb_func_end sub_807F3F8

	thumb_func_start sub_807F434
sub_807F434: @ 807F868
	push {r4,lr}
	ldr r0, _0807F8A0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F8A4 @ =0x000006ed
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _0807F8C8
	movs r0, 0xDD
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0807F8C4
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _0807F8C8
	bl Random
	ands r4, r0
	cmp r4, 0
	beq _0807F8A8
	movs r0, 0x57
	bl PlaySE
	b _0807F8AE
	.align 2, 0
_0807F8A0: .4byte gUnknown_08396FC4
_0807F8A4: .4byte 0x000006ed
_0807F8A8:
	movs r0, 0x58
	bl PlaySE
_0807F8AE:
	ldr r0, _0807F8BC @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807F8C0 @ =0x000006ed
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0807F8C8
	.align 2, 0
_0807F8BC: .4byte gUnknown_08396FC4
_0807F8C0: .4byte 0x000006ed
_0807F8C4:
	subs r0, 0x1
	strh r0, [r1]
_0807F8C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807F434

	thumb_func_start sub_807F49C
sub_807F49C: @ 807F8D0
	push {lr}
	ldr r0, _0807F91C @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0807F920 @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807F924 @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, 0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _0807F928 @ =0x000006c2
	adds r1, r3, r2
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807F92C @ =0x000006fb
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _0807F918
	adds r2, 0x2E
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	subs r2, 0x4
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807F918:
	pop {r0}
	bx r0
	.align 2, 0
_0807F91C: .4byte gUnknown_08396FC4
_0807F920: .4byte 0x000006cc
_0807F924: .4byte 0x000006d2
_0807F928: .4byte 0x000006c2
_0807F92C: .4byte 0x000006fb
	thumb_func_end sub_807F49C

	thumb_func_start sub_807F4FC
sub_807F4FC: @ 807F930
	push {r4,lr}
	bl sub_807F49C
	ldr r0, _0807F958 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807F95C @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F950
	adds r4, r1, r2
_0807F946:
	bl sub_807F52C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F946
_0807F950:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F958: .4byte gUnknown_08396FC4
_0807F95C: .4byte 0x000006d2
	thumb_func_end sub_807F4FC

	thumb_func_start sub_807F52C
sub_807F52C: @ 807F960
	push {r4-r6,lr}
	ldr r0, _0807F9AC @ =gUnknown_08396FC4
	ldr r6, [r0]
	ldr r0, _0807F9B0 @ =gSpriteCoordOffsetX
	ldr r1, _0807F9B4 @ =0x000006f2
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r3, _0807F9B8 @ =0x000006ee
	adds r1, r6, r3
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F99A
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F99A:
	ldr r1, _0807F9BC @ =0x000006cc
	adds r5, r6, r1
	ldrh r4, [r5]
	cmp r4, 0
	beq _0807F9C0
	cmp r4, 0x1
	beq _0807FA00
	b _0807FA16
	.align 2, 0
_0807F9AC: .4byte gUnknown_08396FC4
_0807F9B0: .4byte gSpriteCoordOffsetX
_0807F9B4: .4byte 0x000006f2
_0807F9B8: .4byte 0x000006ee
_0807F9BC: .4byte 0x000006cc
_0807F9C0:
	bl sub_807F6E8
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807F9DC
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F9E6
_0807F9DC:
	movs r0, 0x4
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
_0807F9E6:
	ldr r0, _0807F9F8 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807F9FC @ =0x000006cc
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807FA16
	.align 2, 0
_0807F9F8: .4byte gUnknown_08396FC4
_0807F9FC: .4byte 0x000006cc
_0807FA00:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FA16
	ldr r1, _0807FA1C @ =0x000006d2
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807FA16:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA1C: .4byte 0x000006d2
	thumb_func_end sub_807F52C

	thumb_func_start sub_807F5EC
sub_807F5EC: @ 807FA20
	push {r4,lr}
	ldr r0, _0807FA70 @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _0807FA74 @ =gSpriteCoordOffsetX
	ldr r1, _0807FA78 @ =0x000006f2
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807FA7C @ =0x000006ee
	adds r1, r2, r4
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807FA5A
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807FA5A:
	ldr r1, _0807FA80 @ =0x000006ce
	adds r4, r2, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FA96
	cmp r0, 0x1
	bgt _0807FA84
	cmp r0, 0
	beq _0807FA8A
	b _0807FAAE
	.align 2, 0
_0807FA70: .4byte gUnknown_08396FC4
_0807FA74: .4byte gSpriteCoordOffsetX
_0807FA78: .4byte 0x000006f2
_0807FA7C: .4byte 0x000006ee
_0807FA80: .4byte 0x000006ce
_0807FA84:
	cmp r0, 0x2
	beq _0807FAA2
	b _0807FAAE
_0807FA8A:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x3
	bl sub_807DBA4
	b _0807FAA6
_0807FA96:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FAB2
	b _0807FAA6
_0807FAA2:
	bl sub_807F7A4
_0807FAA6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807FAB2
_0807FAAE:
	movs r0, 0
	b _0807FAB4
_0807FAB2:
	movs r0, 0x1
_0807FAB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F5EC

	thumb_func_start sub_807F688
sub_807F688: @ 807FABC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807FB08 @ =gSpriteCoordOffsetY
	ldrb r0, [r0]
	strh r0, [r3, 0x26]
	ldr r0, _0807FB0C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FB10 @ =0x000006ee
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FB14 @ =0x010f0000
	cmp r1, r0
	ble _0807FB00
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FB18 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FB00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB08: .4byte gSpriteCoordOffsetY
_0807FB0C: .4byte gUnknown_08396FC4
_0807FB10: .4byte 0x000006ee
_0807FB14: .4byte 0x010f0000
_0807FB18: .4byte 0x000001ff
	thumb_func_end sub_807F688

	thumb_func_start sub_807F6E8
sub_807F6E8: @ 807FB1C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0807FB90 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FB94 @ =0x000006fb
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FBC6
	ldr r0, _0807FB98 @ =gUnknown_0839ABA8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, 0
_0807FB40:
	ldr r0, _0807FB9C @ =gSpriteTemplate_839AB90
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FBA4
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FBA0 @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r2, _0807FB90 @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xA0
	adds r0, r1
	str r4, [r0]
	b _0807FBB2
	.align 2, 0
_0807FB90: .4byte gUnknown_08396FC4
_0807FB94: .4byte 0x000006fb
_0807FB98: .4byte gUnknown_0839ABA8
_0807FB9C: .4byte gSpriteTemplate_839AB90
_0807FBA0: .4byte gSprites
_0807FBA4:
	ldr r2, _0807FBD0 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xA0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FBB2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x13
	bls _0807FB40
	ldr r0, [r2]
	ldr r1, _0807FBD4 @ =0x000006fb
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FBC6:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBD0: .4byte gUnknown_08396FC4
_0807FBD4: .4byte 0x000006fb
	thumb_func_end sub_807F6E8

	thumb_func_start sub_807F7A4
sub_807F7A4: @ 807FBD8
	push {r4,r5,lr}
	ldr r0, _0807FC20 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FC24 @ =0x000006fb
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FC18
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xA0
_0807FBEE:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FBFC
	bl DestroySprite
_0807FBFC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FBEE
	ldr r0, _0807FC28 @ =0x00001201
	bl FreeSpriteTilesByTag
	ldr r0, _0807FC20 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FC24 @ =0x000006fb
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FC18:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC20: .4byte gUnknown_08396FC4
_0807FC24: .4byte 0x000006fb
_0807FC28: .4byte 0x00001201
	thumb_func_end sub_807F7A4

	thumb_func_start sub_807F7F8
sub_807F7F8: @ 807FC2C
	push {lr}
	ldr r0, _0807FC78 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _0807FC7C @ =0x000006cc
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r2, _0807FC80 @ =0x000006d2
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, 0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0807FC84 @ =0x000006c2
	adds r0, r1, r3
	movs r2, 0x14
	strb r2, [r0]
	adds r3, 0x3C
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0xE0
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0807FC74
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
	ldr r1, _0807FC88 @ =0x04000052
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
_0807FC74:
	pop {r0}
	bx r0
	.align 2, 0
_0807FC78: .4byte gUnknown_08396FC4
_0807FC7C: .4byte 0x000006cc
_0807FC80: .4byte 0x000006d2
_0807FC84: .4byte 0x000006c2
_0807FC88: .4byte 0x04000052
	thumb_func_end sub_807F7F8

	thumb_func_start sub_807F858
sub_807F858: @ 807FC8C
	push {r4,lr}
	bl sub_807F7F8
	ldr r0, _0807FCB4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0807FCB8 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FCAC
	adds r4, r1, r2
_0807FCA2:
	bl sub_807F888
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FCA2
_0807FCAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FCB4: .4byte gUnknown_08396FC4
_0807FCB8: .4byte 0x000006d2
	thumb_func_end sub_807F858

	thumb_func_start sub_807F888
sub_807F888: @ 807FCBC
	push {r4,r5,lr}
	ldr r2, _0807FD00 @ =gUnknown_08396FC4
	ldr r1, [r2]
	ldr r0, _0807FD04 @ =gSpriteCoordOffsetX
	ldrh r0, [r0]
	ldr r3, _0807FD08 @ =0x000001ff
	ands r3, r0
	ldr r0, _0807FD0C @ =0x000006fc
	adds r1, r0
	strh r3, [r1]
	cmp r3, 0xEF
	bls _0807FCE8
	adds r4, r1, 0
	adds r1, r3, 0
_0807FCD8:
	adds r3, r1, 0
	subs r3, 0xF0
	adds r1, r3, 0
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, 0xEF
	bhi _0807FCD8
	strh r3, [r4]
_0807FCE8:
	ldr r5, [r2]
	ldr r1, _0807FD10 @ =0x000006cc
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FD20
	cmp r0, 0x1
	bgt _0807FD14
	cmp r0, 0
	beq _0807FD1A
	b _0807FD5C
	.align 2, 0
_0807FD00: .4byte gUnknown_08396FC4
_0807FD04: .4byte gSpriteCoordOffsetX
_0807FD08: .4byte 0x000001ff
_0807FD0C: .4byte 0x000006fc
_0807FD10: .4byte 0x000006cc
_0807FD14:
	cmp r0, 0x2
	beq _0807FD3C
	b _0807FD5C
_0807FD1A:
	bl sub_807F99C
	b _0807FD4E
_0807FD20:
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FD30
	bl sub_807F9AC
_0807FD30:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0x1
	bl sub_807DBA4
	b _0807FD4E
_0807FD3C:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FD60
	ldr r0, _0807FD58 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FD4E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807FD60
	.align 2, 0
_0807FD58: .4byte 0x000006d2
_0807FD5C:
	bl sub_807DBE8
_0807FD60:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807F888

	thumb_func_start sub_807F934
sub_807F934: @ 807FD68
	push {r4,lr}
	ldr r0, _0807FD84 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FD88 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FD9E
	cmp r0, 0x1
	bgt _0807FD8C
	cmp r0, 0
	beq _0807FD92
	b _0807FDC0
	.align 2, 0
_0807FD84: .4byte gUnknown_08396FC4
_0807FD88: .4byte 0x000006ce
_0807FD8C:
	cmp r0, 0x2
	beq _0807FDB4
	b _0807FDC0
_0807FD92:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807FDAC
_0807FD9E:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FDC8
	bl sub_807FA54
_0807FDAC:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807FDC8
_0807FDB4:
	ldr r1, _0807FDC4 @ =0x04000052
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FDC0:
	movs r0, 0
	b _0807FDCA
	.align 2, 0
_0807FDC4: .4byte 0x04000052
_0807FDC8:
	movs r0, 0x1
_0807FDCA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F934

	thumb_func_start sub_807F99C
sub_807F99C: @ 807FDD0
	push {lr}
	ldr r0, _0807FDDC @ =gUnknown_0839ABB0
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807FDDC: .4byte gUnknown_0839ABB0
	thumb_func_end sub_807F99C

	thumb_func_start sub_807F9AC
sub_807F9AC: @ 807FDE0
	push {r4,r5,lr}
	ldr r0, _0807FE4C @ =gUnknown_08396FC4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FE7C
	movs r5, 0
_0807FDF4:
	ldr r0, _0807FE50 @ =gSpriteTemplate_839ABD0
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FE58
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FE54 @ =gSprites
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 6
	adds r0, 0x20
	strh r0, [r4, 0x2E]
	ldr r2, _0807FE4C @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xF0
	adds r0, r1
	str r4, [r0]
	b _0807FE66
	.align 2, 0
_0807FE4C: .4byte gUnknown_08396FC4
_0807FE50: .4byte gSpriteTemplate_839ABD0
_0807FE54: .4byte gSprites
_0807FE58:
	ldr r2, _0807FE84 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xF0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FE66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _0807FDF4
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FE7C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE84: .4byte gUnknown_08396FC4
	thumb_func_end sub_807F9AC

	thumb_func_start sub_807FA54
sub_807FA54: @ 807FE88
	push {r4,r5,lr}
	ldr r0, _0807FED4 @ =gUnknown_08396FC4
	ldr r1, [r0]
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FECC
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xF0
_0807FEA0:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FEAE
	bl DestroySprite
_0807FEAE:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FEA0
	ldr r0, _0807FED8 @ =0x00001202
	bl FreeSpriteTilesByTag
	ldr r0, _0807FED4 @ =gUnknown_08396FC4
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FECC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FED4: .4byte gUnknown_08396FC4
_0807FED8: .4byte 0x00001202
	thumb_func_end sub_807FA54

	thumb_func_start sub_807FAA8
sub_807FAA8: @ 807FEDC
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0807FEF8
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_0807FEF8:
	ldr r1, _0807FF44 @ =gSpriteCoordOffsetY
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r3, 0x22]
	ldr r0, _0807FF48 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _0807FF4C @ =0x000006fc
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FF50 @ =0x010f0000
	cmp r1, r0
	ble _0807FF3C
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x32
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FF54 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FF3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF44: .4byte gSpriteCoordOffsetY
_0807FF48: .4byte gUnknown_08396FC4
_0807FF4C: .4byte 0x000006fc
_0807FF50: .4byte 0x010f0000
_0807FF54: .4byte 0x000001ff
	thumb_func_end sub_807FAA8

	thumb_func_start sub_807FB24
sub_807FB24: @ 807FF58
	push {r4,lr}
	ldr r0, _0807FFC8 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r1, _0807FFCC @ =0x000006cc
	adds r0, r3, r1
	movs r1, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807FFD0 @ =0x000006d2
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, 0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0807FFD4 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	movs r1, 0xDE
	lsls r1, 3
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x31
	adds r1, r3, r4
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _0807FFD8 @ =0x00000724
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FFC2
	adds r4, 0x2A
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x6
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, 0x8
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x8
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FFC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FFC8: .4byte gUnknown_08396FC4
_0807FFCC: .4byte 0x000006cc
_0807FFD0: .4byte 0x000006d2
_0807FFD4: .4byte 0x000006c2
_0807FFD8: .4byte 0x00000724
	thumb_func_end sub_807FB24

	thumb_func_start sub_807FBA8
sub_807FBA8: @ 807FFDC
	push {r4,lr}
	bl sub_807FB24
	ldr r0, _08080004 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _08080008 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FFFC
	adds r4, r1, r2
_0807FFF2:
	bl sub_807FBD8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FFF2
_0807FFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080004: .4byte gUnknown_08396FC4
_08080008: .4byte 0x000006d2
	thumb_func_end sub_807FBA8

	thumb_func_start sub_807FBD8
sub_807FBD8: @ 808000C
	push {r4,r5,lr}
	bl sub_807FC9C
	ldr r0, _0808002C @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _08080030 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08080040
	cmp r0, 0x1
	bgt _08080034
	cmp r0, 0
	beq _0808003A
	b _08080064
	.align 2, 0
_0808002C: .4byte gUnknown_08396FC4
_08080030: .4byte 0x000006cc
_08080034:
	cmp r0, 0x2
	beq _0808004C
	b _08080064
_0808003A:
	bl sub_807FD30
	b _0808005E
_08080040:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x8
	bl sub_807DBA4
	b _0808005E
_0808004C:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _08080064
	ldr r0, _0808006C @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0808005E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_08080064:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808006C: .4byte 0x000006d2
	thumb_func_end sub_807FBD8

	thumb_func_start sub_807FC3C
sub_807FC3C: @ 8080070
	push {r4,lr}
	bl sub_807FC9C
	ldr r0, _08080090 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _08080094 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080800AA
	cmp r0, 0x1
	bgt _08080098
	cmp r0, 0
	beq _0808009E
	b _080800C2
	.align 2, 0
_08080090: .4byte gUnknown_08396FC4
_08080094: .4byte 0x000006ce
_08080098:
	cmp r0, 0x2
	beq _080800B6
	b _080800C2
_0808009E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _080800BA
_080800AA:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _080800C6
	b _080800BA
_080800B6:
	bl sub_807FDE8
_080800BA:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080800C6
_080800C2:
	movs r0, 0
	b _080800C8
_080800C6:
	movs r0, 0x1
_080800C8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FC3C

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 80800D0
	push {r4,r5,lr}
	ldr r0, _08080148 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _0808014C @ =0x0000071c
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r2]
	ldr r1, _08080150 @ =0x0000ffff
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _080800FC
	movs r0, 0xE4
	lsls r0, 3
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_080800FC:
	ldr r1, _08080154 @ =0x0000071e
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ands r0, r4
	cmp r0, 0x4
	bls _08080118
	ldr r0, _08080158 @ =0x00000722
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_08080118:
	ldr r0, _0808015C @ =gSpriteCoordOffsetX
	movs r2, 0xE4
	lsls r2, 3
	adds r1, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	ldr r1, _08080160 @ =gSpriteCoordOffsetY
	adds r2, 0xA
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080148: .4byte gUnknown_08396FC4
_0808014C: .4byte 0x0000071c
_08080150: .4byte 0x0000ffff
_08080154: .4byte 0x0000071e
_08080158: .4byte 0x00000722
_0808015C: .4byte gSpriteCoordOffsetX
_08080160: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807FC9C

	thumb_func_start sub_807FD30
sub_807FD30: @ 8080164
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _080801D0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _080801D4 @ =0x00000724
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808020A
	ldr r0, _080801D8 @ =gUnknown_0839ABE8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, 0
_08080188:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	adds r5, r0, 0
	lsls r2, r5, 22
	asrs r2, 16
	ldr r0, _080801DC @ =gSpriteTemplate_839AC04
	movs r1, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080801E4
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080801E0 @ =gSprites
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldr r2, _080801D0 @ =gUnknown_08396FC4
	ldr r0, [r2]
	lsls r1, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3
	adds r0, r1
	str r4, [r0]
	b _080801F6
	.align 2, 0
_080801D0: .4byte gUnknown_08396FC4
_080801D4: .4byte 0x00000724
_080801D8: .4byte gUnknown_0839ABE8
_080801DC: .4byte gSpriteTemplate_839AC04
_080801E0: .4byte gSprites
_080801E4:
	ldr r2, _08080214 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_080801F6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x13
	bls _08080188
	ldr r0, [r2]
	ldr r1, _08080218 @ =0x00000724
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0808020A:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080214: .4byte gUnknown_08396FC4
_08080218: .4byte 0x00000724
	thumb_func_end sub_807FD30

	thumb_func_start sub_807FDE8
sub_807FDE8: @ 808021C
	push {r4,r5,lr}
	ldr r0, _08080264 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _08080268 @ =0x00000724
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808025E
	movs r4, 0
	movs r0, 0xA0
	lsls r0, 1
	adds r5, r1, r0
_08080234:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _08080242
	bl DestroySprite
_08080242:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _08080234
	ldr r0, _0808026C @ =0x00001203
	bl FreeSpriteTilesByTag
	ldr r0, _08080264 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _08080268 @ =0x00000724
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0808025E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080264: .4byte gUnknown_08396FC4
_08080268: .4byte 0x00000724
_0808026C: .4byte 0x00001203
	thumb_func_end sub_807FDE8

	thumb_func_start sub_807FE3C
sub_807FE3C: @ 8080270
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080802C0 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _080802C4 @ =0x0000071a
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	movs r4, 0xE3
	lsls r4, 3
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _080802C8 @ =0x010f0000
	cmp r1, r0
	ble _080802B8
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _080802CC @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_080802B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080802C0: .4byte gUnknown_08396FC4
_080802C4: .4byte 0x0000071a
_080802C8: .4byte 0x010f0000
_080802CC: .4byte 0x000001ff
	thumb_func_end sub_807FE3C

	thumb_func_start sub_807FE9C
sub_807FE9C: @ 80802D0
	push {r4,lr}
	ldr r0, _08080334 @ =gUnknown_08396FC4
	ldr r3, [r0]
	ldr r0, _08080338 @ =0x000006cc
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0808033C @ =0x000006d2
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _08080340 @ =0x000006c1
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _08080344 @ =0x000006c2
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _08080348 @ =0x00000716
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0808032C
	adds r4, 0x43
	adds r1, r3, r4
	adds r4, 0x4
	adds r0, r3, r4
	str r2, [r0]
	str r2, [r1]
	ldr r0, _0808034C @ =0x00000712
	adds r1, r3, r0
	movs r0, 0x8
	strh r0, [r1]
	adds r4, 0xC
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1]
	cmp r2, 0x5F
	bls _08080324
	movs r0, 0x80
	subs r0, r2
	strh r0, [r1]
_08080324:
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0808032C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080334: .4byte gUnknown_08396FC4
_08080338: .4byte 0x000006cc
_0808033C: .4byte 0x000006d2
_08080340: .4byte 0x000006c1
_08080344: .4byte 0x000006c2
_08080348: .4byte 0x00000716
_0808034C: .4byte 0x00000712
	thumb_func_end sub_807FE9C

	thumb_func_start sub_807FF1C
sub_807FF1C: @ 8080350
	push {r4,lr}
	bl sub_807FE9C
	ldr r0, _08080378 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _0808037C @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080370
	adds r4, r1, r2
_08080366:
	bl sub_807FF4C
	ldrb r0, [r4]
	cmp r0, 0
	beq _08080366
_08080370:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080378: .4byte gUnknown_08396FC4
_0808037C: .4byte 0x000006d2
	thumb_func_end sub_807FF1C

	thumb_func_start sub_807FF4C
sub_807FF4C: @ 8080380
	push {r4,r5,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _080803B0 @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _080803B4 @ =0x00000712
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0x5F
	bls _0808039C
	movs r0, 0x20
	strh r0, [r1]
_0808039C:
	ldr r0, _080803B8 @ =0x000006cc
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080803CC
	cmp r0, 0x1
	bgt _080803BC
	cmp r0, 0
	beq _080803C2
	b _080803F0
	.align 2, 0
_080803B0: .4byte gUnknown_08396FC4
_080803B4: .4byte 0x00000712
_080803B8: .4byte 0x000006cc
_080803BC:
	cmp r0, 0x2
	beq _080803D8
	b _080803F0
_080803C2:
	bl sub_8080178
	bl sub_8080238
	b _080803EA
_080803CC:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	bl sub_807DBA4
	b _080803EA
_080803D8:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _080803F0
	ldr r0, _080803F8 @ =0x000006d2
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_080803EA:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080803F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080803F8: .4byte 0x000006d2
	thumb_func_end sub_807FF4C

	thumb_func_start sub_807FFC8
sub_807FFC8: @ 80803FC
	push {r4,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _08080420 @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _08080424 @ =0x000006ce
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0808043A
	cmp r0, 0x1
	bgt _08080428
	cmp r0, 0
	beq _0808042E
	b _08080452
	.align 2, 0
_08080420: .4byte gUnknown_08396FC4
_08080424: .4byte 0x000006ce
_08080428:
	cmp r0, 0x2
	beq _08080446
	b _08080452
_0808042E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
	b _0808044A
_0808043A:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _08080456
	b _0808044A
_08080446:
	bl sub_80800E4
_0808044A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08080456
_08080452:
	movs r0, 0
	b _08080458
_08080456:
	movs r0, 0x1
_08080458:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FFC8

	thumb_func_start sub_808002C
sub_808002C: @ 8080460
	push {lr}
	ldr r0, _0808048C @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _08080490 @ =0x00000714
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, 0x1
	strh r1, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _08080486
	ldr r1, _08080494 @ =0x00000712
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	strh r2, [r3]
_08080486:
	pop {r0}
	bx r0
	.align 2, 0
_0808048C: .4byte gUnknown_08396FC4
_08080490: .4byte 0x00000714
_08080494: .4byte 0x00000712
	thumb_func_end sub_808002C

	thumb_func_start sub_8080064
sub_8080064: @ 8080498
	push {r4-r6,lr}
	ldr r0, _080804FC @ =gUnknown_08396FC4
	ldr r2, [r0]
	ldr r0, _08080500 @ =0x00000704
	adds r4, r2, r0
	ldr r6, _08080504 @ =gSineTable
	ldr r1, _08080508 @ =0x00000712
	adds r5, r2, r1
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	lsls r1, 2
	ldr r0, [r4]
	subs r0, r1
	str r0, [r4]
	movs r0, 0xE1
	lsls r0, 3
	adds r3, r2, r0
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r5, 0
	ldrsh r1, [r0, r5]
	ldr r0, [r3]
	subs r0, r1
	str r0, [r3]
	ldr r1, _0808050C @ =gSpriteCoordOffsetX
	ldr r0, [r4]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _08080510 @ =0x0000070e
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _08080514 @ =gSpriteCoordOffsetY
	ldr r0, [r3]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r5, 0xE2
	lsls r5, 3
	adds r2, r5
	strh r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080804FC: .4byte gUnknown_08396FC4
_08080500: .4byte 0x00000704
_08080504: .4byte gSineTable
_08080508: .4byte 0x00000712
_0808050C: .4byte gSpriteCoordOffsetX
_08080510: .4byte 0x0000070e
_08080514: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8080064

	thumb_func_start sub_80800E4
sub_80800E4: @ 8080518
	push {r4,r5,lr}
	ldr r0, _0808059C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _080805A0 @ =0x00000716
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808055A
	movs r4, 0
	movs r0, 0xC8
	lsls r0, 1
	adds r5, r1, r0
_08080530:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808053E
	bl DestroySprite
_0808053E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _08080530
	ldr r0, _0808059C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _080805A0 @ =0x00000716
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080805A4 @ =0x00001204
	bl FreeSpriteTilesByTag
_0808055A:
	ldr r0, _0808059C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _080805A8 @ =0x00000717
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080594
	movs r4, 0
	movs r0, 0xF0
	lsls r0, 1
	adds r5, r1, r0
_08080570:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808057E
	bl DestroySprite
_0808057E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08080570
	ldr r0, _0808059C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _080805A8 @ =0x00000717
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_08080594:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808059C: .4byte gUnknown_08396FC4
_080805A0: .4byte 0x00000716
_080805A4: .4byte 0x00001204
_080805A8: .4byte 0x00000717
	thumb_func_end sub_80800E4

	thumb_func_start sub_8080178
sub_8080178: @ 80805AC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _0808061C @ =gUnknown_08396FC4
	ldr r0, [r0]
	ldr r1, _08080620 @ =0x00000716
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808065A
	ldr r0, _08080624 @ =gUnknown_0839AC54
	bl LoadSpriteSheet
	ldr r0, _08080628 @ =gUnknown_08397128
	bl sub_807D8C0
	movs r7, 0
_080805CC:
	adds r0, r7, 0
	movs r1, 0x5
	bl __udivsi3
	adds r6, r0, 0
	lsls r2, r6, 22
	asrs r2, 16
	ldr r0, _0808062C @ =gSpriteTemplate_839AC3C
	movs r1, 0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08080634
	ldr r2, _0808061C @ =gUnknown_08396FC4
	ldr r5, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r5, r3
	adds r5, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r0, _08080630 @ =gSprites
	adds r4, r0
	str r4, [r5]
	adds r0, r7, 0
	movs r1, 0x5
	str r2, [sp]
	bl __umodsi3
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r6, [r0, 0x30]
	ldr r2, [sp]
	b _08080646
	.align 2, 0
_0808061C: .4byte gUnknown_08396FC4
_08080620: .4byte 0x00000716
_08080624: .4byte gUnknown_0839AC54
_08080628: .4byte gUnknown_08397128
_0808062C: .4byte gSpriteTemplate_839AC3C
_08080630: .4byte gSprites
_08080634:
	ldr r2, _08080664 @ =gUnknown_08396FC4
	ldr r1, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_08080646:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x13
	bls _080805CC
	ldr r0, [r2]
	ldr r1, _08080668 @ =0x00000716
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0808065A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080664: .4byte gUnknown_08396FC4
_08080668: .4byte 0x00000716
	thumb_func_end sub_8080178

	thumb_func_start sub_8080238
sub_8080238: @ 808066C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08080714 @ =gUnknown_08396FC4
	ldr r0, [r4]
	ldr r1, _08080718 @ =0x00000717
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080758
	movs r7, 0
	mov r9, r4
	movs r2, 0
	mov r10, r2
_0808068C:
	lsls r0, r7, 1
	mov r8, r0
	adds r6, r0, r7
	lsls r5, r6, 4
	adds r1, r5, 0
	adds r1, 0x18
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0808071C @ =gSpriteTemplate_839AC3C
	movs r2, 0xD0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08080730
	mov r2, r9
	ldr r4, [r2]
	lsls r0, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r4, r2
	adds r4, r0
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r0, _08080720 @ =gSprites
	adds r2, r0
	str r2, [r4]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r1, [r4]
	adds r0, r6, r5
	strh r0, [r1, 0x30]
	ldr r1, [r4]
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	ldr r0, [r4]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r1, [r4]
	ldr r0, _08080724 @ =0x00006730
	strh r0, [r1, 0x36]
	ldr r1, [r4]
	ldr r0, _08080728 @ =gUnknown_0839AC5C
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	ldr r0, [r4]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	ldr r1, [r4]
	ldr r0, _0808072C @ =sub_8080398
	str r0, [r1, 0x1C]
	b _08080742
	.align 2, 0
_08080714: .4byte gUnknown_08396FC4
_08080718: .4byte 0x00000717
_0808071C: .4byte gSpriteTemplate_839AC3C
_08080720: .4byte gSprites
_08080724: .4byte 0x00006730
_08080728: .4byte gUnknown_0839AC5C
_0808072C: .4byte sub_8080398
_08080730:
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	mov r1, r10
	str r1, [r0]
_08080742:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, _08080768 @ =0x00000717
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _0808068C
_08080758:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080768: .4byte 0x00000717
	thumb_func_end sub_8080238

	thumb_func_start sub_8080338
sub_8080338: @ 808076C
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080807BC @ =gUnknown_08396FC4
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	ldr r4, _080807C0 @ =0x0000070e
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _080807C4 @ =0x010f0000
	cmp r1, r0
	ble _080807B4
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _080807C8 @ =0x000001ff
	ands r1, r0
	strh r1, [r3, 0x20]
_080807B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080807BC: .4byte gUnknown_08396FC4
_080807C0: .4byte 0x0000070e
_080807C4: .4byte 0x010f0000
_080807C8: .4byte 0x000001ff
	thumb_func_end sub_8080338

	thumb_func_start sub_8080398
sub_8080398: @ 80807CC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080807E6
	ldr r0, _080807EC @ =sub_80803BC
	str r0, [r2, 0x1C]
_080807E6:
	pop {r0}
	bx r0
	.align 2, 0
_080807EC: .4byte sub_80803BC
	thumb_func_end sub_8080398

	thumb_func_start sub_80803BC
sub_80803BC: @ 80807F0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x22]
	subs r0, 0x1
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	negs r1, r1
	cmp r0, r1
	bge _0808080E
	movs r0, 0xD0
	strh r0, [r5, 0x22]
	movs r0, 0x4
	strh r0, [r5, 0x2E]
_0808080E:
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldr r3, _08080860 @ =gSineTable
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r2, r4, 0
	muls r2, r0
	adds r1, 0x40
	lsls r1, 1
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	muls r0, r4
	lsrs r2, 8
	strh r2, [r5, 0x24]
	lsrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0808085A
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0808085A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080860: .4byte gSineTable
	thumb_func_end sub_80803BC

	thumb_func_start sub_8080430
sub_8080430: @ 8080864
	ldr r0, _08080884 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _08080888 @ =0x000006cc
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _0808088C @ =0x000006c1
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _08080890 @ =0x000006c2
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_08080884: .4byte gUnknown_08396FC4
_08080888: .4byte 0x000006cc
_0808088C: .4byte 0x000006c1
_08080890: .4byte 0x000006c2
	thumb_func_end sub_8080430

	thumb_func_start sub_8080460
sub_8080460: @ 8080894
	push {lr}
	bl sub_8080430
	pop {r0}
	bx r0
	thumb_func_end sub_8080460

	thumb_func_start nullsub_56
nullsub_56: @ 80808A0
	bx lr
	thumb_func_end nullsub_56

	thumb_func_start sub_8080470
sub_8080470: @ 80808A4
	movs r0, 0
	bx lr
	thumb_func_end sub_8080470

	thumb_func_start sub_8080474
sub_8080474: @ 80808A8
	push {r4,r5,lr}
	bl sub_807F49C
	ldr r0, _080808E8 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r1, _080808EC @ =0x0000072e
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _080808E0
	ldr r0, _080808F0 @ =gUnknown_0839AC70
	bl LoadSpriteSheet
	movs r2, 0xE5
	lsls r2, 3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _080808F4 @ =gUnknown_0839AC68
	ldrb r1, [r0]
	subs r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _080808F8 @ =0x0000072a
	adds r0, r4, r1
	strh r5, [r0]
	adds r2, 0x6
	adds r0, r4, r2
	strh r5, [r0]
_080808E0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080808E8: .4byte gUnknown_08396FC4
_080808EC: .4byte 0x0000072e
_080808F0: .4byte gUnknown_0839AC70
_080808F4: .4byte gUnknown_0839AC68
_080808F8: .4byte 0x0000072a
	thumb_func_end sub_8080474

	thumb_func_start sub_80804C8
sub_80804C8: @ 80808FC
	push {r4,lr}
	bl sub_8080474
	ldr r0, _08080924 @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r2, _08080928 @ =0x000006d2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808091C
	adds r4, r1, r2
_08080912:
	bl sub_80804F8
	ldrb r0, [r4]
	cmp r0, 0
	beq _08080912
_0808091C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080924: .4byte gUnknown_08396FC4
_08080928: .4byte 0x000006d2
	thumb_func_end sub_80804C8

	thumb_func_start sub_80804F8
sub_80804F8: @ 808092C
	push {r4-r7,lr}
	bl sub_807F52C
	ldr r0, _0808098C @ =gUnknown_08396FC4
	ldr r5, [r0]
	ldr r0, _08080990 @ =0x00000726
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4]
	ldr r1, _08080994 @ =0x0000ffff
	adds r7, r1, 0
	ldr r2, _08080998 @ =gUnknown_0839AC68
	movs r1, 0xE5
	lsls r1, 3
	adds r3, r5, r1
	ldrh r1, [r3]
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08080984
	strh r6, [r4]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ands r0, r7
	cmp r0, 0x7
	bls _0808096C
	strh r6, [r3]
_0808096C:
	ldr r0, _0808099C @ =0x0000072a
	adds r4, r5, r0
	ldrh r0, [r4]
	bl sub_8080588
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r7
	cmp r0, 0xC
	bls _08080984
	strh r6, [r4]
_08080984:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808098C: .4byte gUnknown_08396FC4
_08080990: .4byte 0x00000726
_08080994: .4byte 0x0000ffff
_08080998: .4byte gUnknown_0839AC68
_0808099C: .4byte 0x0000072a
	thumb_func_end sub_80804F8

	thumb_func_start sub_808056C
sub_808056C: @ 80809A0
	push {lr}
	bl sub_807F5EC
	lsls r0, 24
	cmp r0, 0
	beq _080809B0
	movs r0, 0x1
	b _080809B6
_080809B0:
	bl sub_8080610
	movs r0, 0
_080809B6:
	pop {r1}
	bx r1
	thumb_func_end sub_808056C

	thumb_func_start sub_8080588
sub_8080588: @ 80809BC
	push {r4,lr}
	lsls r0, 16
	ldr r1, _08080A2C @ =gUnknown_0839AC78
	lsrs r0, 14
	adds r3, r0, r1
	adds r1, 0x2
	adds r0, r1
	ldr r1, _08080A30 @ =gSpriteCoordOffsetY
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r0
	ldr r0, _08080A34 @ =gSpriteTemplate_839ACBC
	movs r4, 0
	ldrsh r1, [r3, r4]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08080A24
	ldr r0, _08080A38 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x32]
	ldr r0, _08080A3C @ =gUnknown_08396FC4
	ldr r1, [r0]
	ldr r0, _08080A40 @ =0x0000072c
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_08080A24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080A2C: .4byte gUnknown_0839AC78
_08080A30: .4byte gSpriteCoordOffsetY
_08080A34: .4byte gSpriteTemplate_839ACBC
_08080A38: .4byte gSprites
_08080A3C: .4byte gUnknown_08396FC4
_08080A40: .4byte 0x0000072c
	thumb_func_end sub_8080588

	thumb_func_start sub_8080610
sub_8080610: @ 8080A44
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08080A7C @ =gSprites
_08080A4A:
	lsls r0, r4, 4
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r5, 0
	adds r0, 0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _08080A80 @ =gSpriteTemplate_839ACBC
	cmp r1, r0
	bne _08080A64
	adds r0, r2, r5
	bl DestroySprite
_08080A64:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _08080A4A
	ldr r0, _08080A84 @ =0x00001205
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080A7C: .4byte gSprites
_08080A80: .4byte gSpriteTemplate_839ACBC
_08080A84: .4byte 0x00001205
	thumb_func_end sub_8080610

	thumb_func_start unc_0807DAB4
unc_0807DAB4: @ 8080A88
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r2, 0
	adds r0, 0x2
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080AC8
	strh r2, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08080ABA
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08080AC8
	movs r0, 0x1
	strh r0, [r1, 0x30]
	b _08080AC8
_08080ABA:
	ldrh r0, [r1, 0x24]
	subs r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	bgt _08080AC8
	strh r2, [r1, 0x30]
_08080AC8:
	ldrh r0, [r1, 0x22]
	subs r0, 0x3
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _08080AE2
	adds r0, r1, 0
	bl DestroySprite
_08080AE2:
	pop {r0}
	bx r0
	thumb_func_end unc_0807DAB4

	thumb_func_start SetSav1Weather
SetSav1Weather: @ 8080AE8
	push {r4,r5,lr}
	ldr r4, _08080B08 @ =gSaveBlock1
	adds r4, 0x2E
	ldrb r5, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl TranslateWeatherNum
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080B08: .4byte gSaveBlock1
	thumb_func_end SetSav1Weather

	thumb_func_start GetSav1Weather
GetSav1Weather: @ 8080B0C
	ldr r0, _08080B14 @ =gSaveBlock1
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08080B14: .4byte gSaveBlock1
	thumb_func_end GetSav1Weather

	thumb_func_start sub_80806E4
sub_80806E4: @ 8080B18
	push {r4,r5,lr}
	ldr r4, _08080B38 @ =gSaveBlock1
	adds r4, 0x2E
	ldrb r5, [r4]
	ldr r0, _08080B3C @ =gMapHeader
	ldrb r0, [r0, 0x16]
	bl TranslateWeatherNum
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl UpdateRainCounter
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080B38: .4byte gSaveBlock1
_08080B3C: .4byte gMapHeader
	thumb_func_end sub_80806E4

	thumb_func_start sub_808070C
sub_808070C: @ 8080B40
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end sub_808070C

	thumb_func_start sub_8080724
sub_8080724: @ 8080B58
	push {lr}
	bl SetSav1Weather
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080724

	thumb_func_start sub_808073C
sub_808073C: @ 8080B70
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl DoWeatherEffect
	pop {r0}
	bx r0
	thumb_func_end sub_808073C

	thumb_func_start sub_8080750
sub_8080750: @ 8080B84
	push {lr}
	bl GetSav1Weather
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080750

	thumb_func_start TranslateWeatherNum
TranslateWeatherNum: @ 8080B98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _08080C60
	lsls r0, 2
	ldr r1, _08080BAC @ =_08080BB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080BAC: .4byte _08080BB0
	.align 2, 0
_08080BB0:
	.4byte _08080C60
	.4byte _08080C08
	.4byte _08080C0C
	.4byte _08080C10
	.4byte _08080C14
	.4byte _08080C18
	.4byte _08080C1C
	.4byte _08080C20
	.4byte _08080C24
	.4byte _08080C28
	.4byte _08080C2C
	.4byte _08080C30
	.4byte _08080C34
	.4byte _08080C38
	.4byte _08080C3C
	.4byte _08080C60
	.4byte _08080C60
	.4byte _08080C60
	.4byte _08080C60
	.4byte _08080C60
	.4byte _08080C40
	.4byte _08080C48
_08080C08:
	movs r0, 0x1
	b _08080C62
_08080C0C:
	movs r0, 0x2
	b _08080C62
_08080C10:
	movs r0, 0x3
	b _08080C62
_08080C14:
	movs r0, 0x4
	b _08080C62
_08080C18:
	movs r0, 0x5
	b _08080C62
_08080C1C:
	movs r0, 0x6
	b _08080C62
_08080C20:
	movs r0, 0x7
	b _08080C62
_08080C24:
	movs r0, 0x8
	b _08080C62
_08080C28:
	movs r0, 0x9
	b _08080C62
_08080C2C:
	movs r0, 0xA
	b _08080C62
_08080C30:
	movs r0, 0xB
	b _08080C62
_08080C34:
	movs r0, 0xC
	b _08080C62
_08080C38:
	movs r0, 0xD
	b _08080C62
_08080C3C:
	movs r0, 0xE
	b _08080C62
_08080C40:
	ldr r1, _08080C44 @ =gUnknown_0839ACD4
	b _08080C4A
	.align 2, 0
_08080C44: .4byte gUnknown_0839ACD4
_08080C48:
	ldr r1, _08080C58 @ =gUnknown_0839ACD8
_08080C4A:
	ldr r0, _08080C5C @ =gSaveBlock1
	adds r0, 0x2F
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	b _08080C62
	.align 2, 0
_08080C58: .4byte gUnknown_0839ACD8
_08080C5C: .4byte gSaveBlock1
_08080C60:
	movs r0, 0
_08080C62:
	pop {r1}
	bx r1
	thumb_func_end TranslateWeatherNum

	thumb_func_start sub_8080834
sub_8080834: @ 8080C68
	lsls r0, 16
	ldr r2, _08080C84 @ =gSaveBlock1
	adds r2, 0x2F
	lsrs r0, 16
	ldrb r1, [r2]
	adds r0, r1
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	strb r1, [r2]
	bx lr
	.align 2, 0
_08080C84: .4byte gSaveBlock1
	thumb_func_end sub_8080834

	thumb_func_start UpdateRainCounter
UpdateRainCounter: @ 8080C88
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r0, 24
	cmp r0, r1
	beq _08080CA2
	cmp r2, 0x3
	beq _08080C9C
	cmp r2, 0x5
	bne _08080CA2
_08080C9C:
	movs r0, 0x28
	bl sav12_xor_increment
_08080CA2:
	pop {r0}
	bx r0
	thumb_func_end UpdateRainCounter

	.align 2, 0 @ Don't pad with nop.
