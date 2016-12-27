	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FA17C
sub_80FA17C: @ 80FA52C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r6, 0
	ldr r7, _080FA564 @ =gSaveBlock1
	ldr r0, _080FA568 @ =0x00002dd4
	adds r0, r7
	mov r9, r0
	movs r1, 0x1
	mov r8, r1
_080FA542:
	movs r0, 0xA
	bl sub_80EB72C
	lsls r4, r6, 3
	adds r5, r4, r7
	ldr r2, _080FA56C @ =0x00002dd8
	adds r1, r5, r2
	strh r0, [r1]
	bl Random
	mov r1, r8
	ands r1, r0
	cmp r1, 0
	beq _080FA570
	movs r0, 0xC
	b _080FA572
	.align 2, 0
_080FA564: .4byte gSaveBlock1
_080FA568: .4byte 0x00002dd4
_080FA56C: .4byte 0x00002dd8
_080FA570:
	movs r0, 0xD
_080FA572:
	bl sub_80EB72C
	ldr r2, _080FA5C4 @ =0x00002dda
	adds r1, r5, r2
	strh r0, [r1]
	bl Random
	adds r3, r4, r7
	mov r2, r8
	ands r2, r0
	ldr r5, _080FA5C8 @ =0x00002dd5
	adds r3, r5
	lsls r2, 6
	ldrb r0, [r3]
	movs r5, 0x41
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	mov r1, r9
	adds r0, r4, r1
	bl sub_80FA740
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _080FA542
	ldr r0, _080FA5CC @ =0x02028508
	movs r1, 0x5
	movs r2, 0
	bl sub_80FA46C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA5C4: .4byte 0x00002dda
_080FA5C8: .4byte 0x00002dd5
_080FA5CC: .4byte 0x02028508
	thumb_func_end sub_80FA17C

	thumb_func_start sub_80FA220
sub_80FA220: @ 80FA5D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080FA5E6
	b _080FA6FE
_080FA5E6:
	lsls r0, r1, 2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	mov r10, r0
	movs r1, 0x7F
	mov r9, r1
	movs r2, 0x80
	negs r2, r2
	mov r8, r2
_080FA5FA:
	ldr r2, [sp]
	mov r4, r10
	lsls r0, r4, 3
	ldr r1, _080FA63C @ =0x02028508
	adds r5, r0, r1
	ldrb r6, [r5, 0x1]
	movs r0, 0x40
	ands r0, r6
	cmp r0, 0
	bne _080FA650
	ldrb r4, [r5]
	lsls r3, r4, 25
	lsrs r1, r3, 25
	lsls r0, r2, 16
	lsrs r0, 16
	cmp r1, r0
	bcc _080FA640
	adds r0, r1, 0
	subs r0, r2
	mov r2, r9
	ands r0, r2
	mov r1, r8
	ands r1, r4
	orrs r1, r0
	strb r1, [r5]
	movs r0, 0x7F
	ands r1, r0
	cmp r1, 0
	bne _080FA6E6
	movs r0, 0x40
	orrs r0, r6
	b _080FA6E4
	.align 2, 0
_080FA63C: .4byte 0x02028508
_080FA640:
	lsrs r0, r3, 25
	subs r2, r0
	mov r0, r8
	ands r0, r4
	strb r0, [r5]
	movs r0, 0x40
	orrs r0, r6
	strb r0, [r5, 0x1]
_080FA650:
	ldrb r7, [r5]
	lsls r0, r7, 25
	lsrs r0, 25
	adds r4, r0, r2
	ldrh r0, [r5]
	lsls r6, r0, 18
	lsls r0, r4, 16
	lsrs r0, 16
	lsrs r1, r6, 25
	cmp r0, r1
	bls _080FA6C0
	adds r0, r4, 0
	bl __umodsi3
	adds r3, r0, 0
	lsrs r1, r6, 25
	adds r0, r4, 0
	str r3, [sp, 0x4]
	bl __udivsi3
	adds r4, r0, 0
	movs r0, 0x1
	eors r4, r0
	ands r4, r0
	lsls r2, r4, 6
	ldrb r0, [r5, 0x1]
	movs r4, 0x41
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x1]
	movs r1, 0x40
	ands r0, r1
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _080FA6AA
	adds r1, r3, 0
	mov r0, r9
	ands r1, r0
	mov r0, r8
	ands r0, r7
	orrs r0, r1
	strb r0, [r5]
	b _080FA6E6
_080FA6AA:
	ldrh r0, [r5]
	lsls r0, 18
	lsrs r0, 25
	subs r0, r3
	mov r1, r9
	ands r0, r1
	mov r1, r8
	ands r1, r7
	orrs r1, r0
	strb r1, [r5]
	b _080FA6E6
_080FA6C0:
	mov r2, r9
	ands r4, r2
	mov r0, r8
	ands r0, r7
	orrs r0, r4
	strb r0, [r5]
	lsls r0, 25
	ldrh r1, [r5]
	lsls r1, 18
	lsrs r0, 25
	lsrs r1, 25
	cmp r0, r1
	bne _080FA6E6
	ldrb r0, [r5, 0x1]
	movs r4, 0x41
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
_080FA6E4:
	strb r0, [r5, 0x1]
_080FA6E6:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	cmp r0, 0x4
	bls _080FA5FA
	ldr r0, _080FA710 @ =0x02028508
	movs r1, 0x5
	movs r2, 0
	bl sub_80FA46C
_080FA6FE:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA710: .4byte 0x02028508
	thumb_func_end sub_80FA220

	thumb_func_start sub_80FA364
sub_80FA364: @ 80FA714
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0
	str r0, [sp]
	str r1, [sp, 0x4]
	adds r0, r4, 0
	bl SB1ContainsWords
	lsls r0, 24
	cmp r0, 0
	bne _080FA812
	ldr r5, _080FA764 @ =0x00000833
	adds r0, r5, 0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080FA778
	adds r0, r5, 0
	bl FlagSet
	ldr r0, _080FA768 @ =0x00000834
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080FA778
	ldr r1, _080FA76C @ =gSaveBlock1
	ldrh r2, [r4]
	ldr r3, _080FA770 @ =0x00002dd8
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r0, [r4, 0x2]
	ldr r2, _080FA774 @ =0x00002dda
	adds r1, r2
	strh r0, [r1]
	movs r0, 0x1
	b _080FA814
	.align 2, 0
_080FA764: .4byte 0x00000833
_080FA768: .4byte 0x00000834
_080FA76C: .4byte gSaveBlock1
_080FA770: .4byte 0x00002dd8
_080FA774: .4byte 0x00002dda
_080FA778:
	ldrh r1, [r4, 0x2]
	lsls r1, 16
	ldrh r0, [r4]
	orrs r0, r1
	str r0, [sp, 0x4]
	movs r1, 0x80
	lsls r1, 7
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	mov r0, sp
	bl sub_80FA740
	movs r6, 0
_080FA794:
	lsls r4, r6, 3
	ldr r5, _080FA7F4 @ =0x02028508
	adds r1, r4, r5
	mov r0, sp
	movs r2, 0
	bl sub_80FA670
	lsls r0, 24
	adds r7, r4, 0
	cmp r0, 0
	beq _080FA800
	movs r3, 0x4
	ldr r0, _080FA7F8 @ =0xffffd22c
	adds r0, r5
	mov r12, r0
	cmp r3, r6
	bls _080FA7D8
	mov r5, r12
	ldr r4, _080FA7FC @ =0x00002dd4
_080FA7BA:
	lsls r2, r3, 3
	adds r2, r5
	adds r2, r4
	subs r3, 0x1
	lsls r0, r3, 3
	adds r0, r5
	adds r0, r4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsls r3, 16
	lsrs r3, 16
	cmp r3, r6
	bhi _080FA7BA
_080FA7D8:
	mov r3, r12
	adds r2, r7, r3
	ldr r0, _080FA7FC @ =0x00002dd4
	adds r2, r0
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0
	cmp r6, 0
	bne _080FA814
	movs r0, 0x1
	b _080FA814
	.align 2, 0
_080FA7F4: .4byte 0x02028508
_080FA7F8: .4byte 0xffffd22c
_080FA7FC: .4byte 0x00002dd4
_080FA800:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _080FA794
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	str r0, [r5, 0x20]
	str r1, [r5, 0x24]
_080FA812:
	movs r0, 0
_080FA814:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA364

	thumb_func_start sub_80FA46C
sub_80FA46C: @ 80FA81C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r2, 0
	cmp r2, r7
	bcs _080FA884
_080FA838:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r5, r0, 16
	mov r8, r1
	cmp r5, r7
	bcs _080FA87A
	lsls r0, r2, 3
	mov r1, r9
	adds r6, r1, r0
_080FA84A:
	lsls r0, r5, 3
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, r10
	bl sub_80FA670
	lsls r0, 24
	cmp r0, 0
	beq _080FA870
	ldr r2, [r4]
	ldr r3, [r4, 0x4]
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r2, [r6]
	str r3, [r6, 0x4]
_080FA870:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r7
	bcc _080FA84A
_080FA87A:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r2, r0, 16
	cmp r2, r7
	bcc _080FA838
_080FA884:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FA46C

	thumb_func_start sub_80FA4E4
sub_80FA4E4: @ 80FA894
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r4, 0
	cmp r4, r8
	bcs _080FA8D0
_080FA8B0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080FA904 @ =0x02007800
	adds r0, r1
	adds r1, r4, 0
	muls r1, r5
	adds r1, r6, r1
	movs r2, 0x28
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _080FA8B0
_080FA8D0:
	ldr r5, _080FA904 @ =0x02007800
	movs r0, 0x80
	lsls r0, 1
	adds r3, r5, r0
	movs r7, 0
	movs r4, 0
	cmp r4, r8
	bcs _080FA938
_080FA8E0:
	movs r6, 0
_080FA8E2:
	adds r0, r5, 0
	adds r1, r7, 0
	str r3, [sp]
	bl sub_80FA828
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp]
	cmp r0, 0
	bge _080FA908
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	stm r3!, {r0,r1}
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	b _080FA922
	.align 2, 0
_080FA904: .4byte 0x02007800
_080FA908:
	lsls r1, r0, 3
	ldr r0, _080FA964 @ =0x02007900
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r1, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bcs _080FA922
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
_080FA922:
	adds r5, 0x8
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _080FA8E2
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _080FA8E0
_080FA938:
	ldr r4, _080FA964 @ =0x02007900
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x2
	bl sub_80FA46C
	adds r5, r4, 0
	ldr r3, _080FA968 @ =0x02028508
	movs r4, 0
_080FA94A:
	ldm r5!, {r0,r1}
	stm r3!, {r0,r1}
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080FA94A
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA964: .4byte 0x02007900
_080FA968: .4byte 0x02028508
	thumb_func_end sub_80FA4E4

	thumb_func_start sub_80FA5BC
sub_80FA5BC: @ 80FA96C
	push {lr}
	ldr r0, _080FA988 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r1, 3
	ldr r0, _080FA98C @ =0x02028508
	adds r1, r0
	ldr r0, _080FA990 @ =gStringVar1
	adds r1, 0x4
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80EB544
	pop {r0}
	bx r0
	.align 2, 0
_080FA988: .4byte gSpecialVar_0x8004
_080FA98C: .4byte 0x02028508
_080FA990: .4byte gStringVar1
	thumb_func_end sub_80FA5BC

	thumb_func_start sub_80FA5E4
sub_80FA5E4: @ 80FA994
	push {r4,lr}
	movs r4, 0
	ldr r3, _080FA9E0 @ =gSaveBlock1
	ldr r1, _080FA9E4 @ =0x00002dd4
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, 25
	lsrs r1, 25
	ldr r2, _080FA9E8 @ =0x00002ddc
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 25
	subs r1, r0
	cmp r1, 0x1
	bgt _080FA9D6
	ldr r1, _080FA9EC @ =0x00002dd5
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FA9D6
	ldr r1, _080FA9F0 @ =0x00002ddd
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	lsrs r4, r0, 31
_080FA9D6:
	ldr r0, _080FA9F4 @ =gScriptResult
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA9E0: .4byte gSaveBlock1
_080FA9E4: .4byte 0x00002dd4
_080FA9E8: .4byte 0x00002ddc
_080FA9EC: .4byte 0x00002dd5
_080FA9F0: .4byte 0x00002ddd
_080FA9F4: .4byte gScriptResult
	thumb_func_end sub_80FA5E4

	thumb_func_start sub_80FA648
sub_80FA648: @ 80FA9F8
	ldr r2, _080FAA14 @ =gScriptResult
	ldr r0, _080FAA18 @ =gSaveBlock1
	ldr r3, _080FAA1C @ =0x00002dd8
	adds r1, r0, r3
	adds r3, 0x2
	adds r0, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080FAA14: .4byte gScriptResult
_080FAA18: .4byte gSaveBlock1
_080FAA1C: .4byte 0x00002dd8
	thumb_func_end sub_80FA648

	thumb_func_start sub_80FA670
sub_80FA670: @ 80FAA20
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r2, 0
	cmp r2, 0x1
	beq _080FAA66
	cmp r2, 0x1
	bgt _080FAA3A
	cmp r2, 0
	beq _080FAA40
	b _080FAAE2
_080FAA3A:
	cmp r0, 0x2
	beq _080FAA92
	b _080FAAE2
_080FAA40:
	ldrb r0, [r3]
	lsls r1, r0, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bhi _080FAADE
	cmp r1, r0
	bcc _080FAA8E
	ldrh r0, [r3]
	lsls r3, r0, 18
	ldrh r0, [r5]
	lsls r2, r0, 18
	lsrs r1, r3, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bhi _080FAADE
	lsrs r1, r3, 25
	lsrs r0, r2, 25
	b _080FAA8A
_080FAA66:
	ldrh r0, [r3]
	lsls r4, r0, 18
	ldrh r0, [r5]
	lsls r2, r0, 18
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bhi _080FAADE
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bcc _080FAA8E
	ldrb r0, [r3]
	lsls r1, r0, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bhi _080FAADE
_080FAA8A:
	cmp r1, r0
	bcs _080FAAE2
_080FAA8E:
	movs r0, 0
	b _080FAAEA
_080FAA92:
	ldrb r0, [r3]
	lsls r1, r0, 25
	ldrb r0, [r5]
	lsls r0, 25
	cmp r1, r0
	bhi _080FAADE
	cmp r1, r0
	bcc _080FAA8E
	ldrh r0, [r3]
	lsls r4, r0, 18
	ldrh r0, [r5]
	lsls r2, r0, 18
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bhi _080FAADE
	lsrs r1, r4, 25
	lsrs r0, r2, 25
	cmp r1, r0
	bcc _080FAA8E
	ldrh r1, [r3, 0x2]
	ldrh r0, [r5, 0x2]
	cmp r1, r0
	bhi _080FAADE
	cmp r1, r0
	bcc _080FAA8E
	ldrh r1, [r3, 0x4]
	ldrh r0, [r5, 0x4]
	cmp r1, r0
	bhi _080FAADE
	cmp r1, r0
	bcc _080FAA8E
	ldrh r1, [r3, 0x6]
	ldrh r0, [r5, 0x6]
	cmp r1, r0
	bhi _080FAADE
	cmp r1, r0
	bcc _080FAA8E
_080FAADE:
	movs r0, 0x1
	b _080FAAEA
_080FAAE2:
	bl Random
	movs r1, 0x1
	ands r0, r1
_080FAAEA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA670

	thumb_func_start sub_80FA740
sub_80FA740: @ 80FAAF0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x62
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x32
	bls _080FAB32
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x62
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x50
	bls _080FAB32
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x62
	bl __umodsi3
	lsls r0, 16
	lsrs r4, r0, 16
_080FAB32:
	adds r1, r4, 0
	adds r1, 0x1E
	movs r0, 0x7F
	ands r1, r0
	lsls r1, 7
	ldrh r2, [r5]
	ldr r0, _080FAB74 @ =0xffffc07f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0x1
	bl __modsi3
	adds r0, 0x1E
	movs r1, 0x7F
	ands r0, r1
	ldrb r2, [r5]
	movs r1, 0x80
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	bl Random
	strh r0, [r5, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FAB74: .4byte 0xffffc07f
	thumb_func_end sub_80FA740

	thumb_func_start SB1ContainsWords
SB1ContainsWords: @ 80FAB78
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_080FAB7E:
	lsls r1, r4, 3
	ldr r0, _080FAB94 @ =0x0202850c
	adds r1, r0
	adds r0, r5, 0
	bl IsEasyChatPairEqual
	lsls r0, 24
	cmp r0, 0
	beq _080FAB98
	movs r0, 0x1
	b _080FABA4
	.align 2, 0
_080FAB94: .4byte 0x0202850c
_080FAB98:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080FAB7E
	movs r0, 0
_080FABA4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end SB1ContainsWords

	thumb_func_start IsEasyChatPairEqual
IsEasyChatPairEqual: @ 80FABAC
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	movs r4, 0
_080FABB4:
	ldrh r1, [r3]
	ldrh r0, [r2]
	adds r2, 0x2
	adds r3, 0x2
	cmp r1, r0
	beq _080FABC4
	movs r0, 0
	b _080FABD0
_080FABC4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080FABB4
	movs r0, 0x1
_080FABD0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsEasyChatPairEqual

	thumb_func_start sub_80FA828
sub_80FA828: @ 80FABD8
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r6, _080FABFC @ =0x02007900
	movs r4, 0
	cmp r4, r5
	bge _080FAC12
_080FABE8:
	adds r1, r6, 0x4
	adds r0, r7, 0x4
	bl IsEasyChatPairEqual
	lsls r0, 24
	cmp r0, 0
	beq _080FAC00
	lsls r0, r4, 16
	asrs r0, 16
	b _080FAC16
	.align 2, 0
_080FABFC: .4byte 0x02007900
_080FAC00:
	adds r6, 0x8
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, r5
	blt _080FABE8
_080FAC12:
	movs r0, 0x1
	negs r0, r0
_080FAC16:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FA828

	.align 2, 0 @ Don't pad with nop.
