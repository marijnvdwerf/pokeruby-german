	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start MovePlayerOnBike
MovePlayerOnBike: @ 80E53E4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080E5408 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E540C
	adds r0, r3, 0
	adds r1, r4, 0
	bl MovePlayerOnMachBike
	b _080E5414
	.align 2, 0
_080E5408: .4byte gPlayerAvatar
_080E540C:
	adds r0, r3, 0
	adds r1, r4, 0
	bl MovePlayerOnAcroBike
_080E5414:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end MovePlayerOnBike

	thumb_func_start MovePlayerOnMachBike
MovePlayerOnMachBike: @ 80E541C
	push {r4,lr}
	sub sp, 0x4
	mov r1, sp
	strb r0, [r1]
	ldr r4, _080E5448 @ =gUnknown_083DB594
	mov r0, sp
	bl CheckMovementInputMachBike
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	mov r1, sp
	ldrb r1, [r1]
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5448: .4byte gUnknown_083DB594
	thumb_func_end MovePlayerOnMachBike

	thumb_func_start CheckMovementInputMachBike
CheckMovementInputMachBike: @ 80E544C
	push {r4,lr}
	adds r4, r0, 0
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	ldrb r1, [r4]
	cmp r1, 0
	bne _080E5474
	strb r0, [r4]
	ldr r2, _080E5470 @ =gPlayerAvatar
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	bne _080E5488
	strb r1, [r2, 0x2]
	movs r0, 0
	b _080E549C
	.align 2, 0
_080E5470: .4byte gPlayerAvatar
_080E5474:
	ldr r2, _080E5490 @ =gPlayerAvatar
	cmp r1, r3
	beq _080E5498
	ldrb r0, [r2, 0x2]
	cmp r0, 0x2
	beq _080E5498
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	beq _080E5494
	strb r3, [r4]
_080E5488:
	movs r0, 0x2
	strb r0, [r2, 0x2]
	movs r0, 0x3
	b _080E549C
	.align 2, 0
_080E5490: .4byte gPlayerAvatar
_080E5494:
	movs r0, 0x1
	b _080E549A
_080E5498:
	movs r0, 0x2
_080E549A:
	strb r0, [r2, 0x2]
_080E549C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputMachBike

	thumb_func_start sub_80E5168
sub_80E5168: @ 80E54A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl PlayerFaceDirection
	bl sub_80E6024
	pop {r0}
	bx r0
	thumb_func_end sub_80E5168

	thumb_func_start sub_80E517C
sub_80E517C: @ 80E54B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E54E8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E54EC @ =gMapObjects
	adds r4, r0, r1
	ldrb r1, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	beq _080E54F0
	adds r0, r5, 0
	bl PlayerTurnInPlace
	bl sub_80E6024
	b _080E54FA
	.align 2, 0
_080E54E8: .4byte gPlayerAvatar
_080E54EC: .4byte gMapObjects
_080E54F0:
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_80E5168
_080E54FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E517C

	thumb_func_start sub_80E51C4
sub_80E51C4: @ 80E5500
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r6, _080E5534 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5538 @ =gMapObjects
	adds r4, r0, r1
	ldrb r1, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5546
	ldrb r0, [r6, 0xB]
	cmp r0, 0
	beq _080E553C
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80E5270
	b _080E55A2
	.align 2, 0
_080E5534: .4byte gPlayerAvatar
_080E5538: .4byte gMapObjects
_080E553C:
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80E5168
	b _080E55A2
_080E5546:
	adds r0, r5, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r4, r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E557E
	cmp r4, 0x6
	bne _080E5568
	adds r0, r5, 0
	bl PlayerJumpLedge
	b _080E55A2
_080E5568:
	bl sub_80E6024
	subs r0, r4, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E55A2
	adds r0, r5, 0
	bl PlayerOnBikeCollide
	b _080E55A2
_080E557E:
	ldr r1, _080E55A8 @ =gUnknown_083DB5A4
	ldrb r0, [r6, 0xA]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl _call_via_r1
	ldrb r2, [r6, 0xA]
	lsls r0, r2, 24
	lsrs r1, r0, 24
	lsrs r0, 25
	adds r0, r2, r0
	strb r0, [r6, 0xB]
	cmp r1, 0x1
	bhi _080E55A2
	adds r0, r2, 0x1
	strb r0, [r6, 0xA]
_080E55A2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E55A8: .4byte gUnknown_083DB5A4
	thumb_func_end sub_80E51C4

	thumb_func_start sub_80E5270
sub_80E5270: @ 80E55AC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r6, _080E55E4 @ =gPlayerAvatar
	ldrb r0, [r6, 0xB]
	cmp r0, 0
	beq _080E55C2
	subs r0, 0x1
	strb r0, [r6, 0xB]
	strb r0, [r6, 0xA]
_080E55C2:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E55FE
	cmp r5, 0x6
	bne _080E55E8
	adds r0, r4, 0
	bl PlayerJumpLedge
	b _080E560E
	.align 2, 0
_080E55E4: .4byte gPlayerAvatar
_080E55E8:
	bl sub_80E6024
	subs r0, r5, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E560E
	adds r0, r4, 0
	bl PlayerOnBikeCollide
	b _080E560E
_080E55FE:
	ldr r0, _080E5614 @ =gUnknown_083DB5A4
	ldrb r1, [r6, 0xA]
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r7, 0
	bl _call_via_r1
_080E560E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5614: .4byte gUnknown_083DB5A4
	thumb_func_end sub_80E5270

	thumb_func_start MovePlayerOnAcroBike
MovePlayerOnAcroBike: @ 80E5618
	push {r4,lr}
	sub sp, 0x4
	mov r3, sp
	strb r0, [r3]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080E564C @ =gUnknown_083DB5B0
	mov r0, sp
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	mov r1, sp
	ldrb r1, [r1]
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E564C: .4byte gUnknown_083DB5B0
	thumb_func_end MovePlayerOnAcroBike

	thumb_func_start CheckMovementInputAcroBike
CheckMovementInputAcroBike: @ 80E5650
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080E5674 @ =gUnknown_083DB5E4
	ldr r3, _080E5678 @ =gPlayerAvatar
	ldrb r3, [r3, 0x8]
	lsls r3, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E5674: .4byte gUnknown_083DB5E4
_080E5678: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBike

	thumb_func_start CheckMovementInputAcroBikeNormal
CheckMovementInputAcroBikeNormal: @ 80E567C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080E56B0 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r2, 0xA]
	ldrb r1, [r4]
	cmp r1, 0
	bne _080E56BC
	movs r0, 0x2
	ands r0, r6
	cmp r0, 0
	beq _080E56B4
	strb r3, [r4]
	strb r1, [r2, 0x2]
	movs r0, 0x2
	strb r0, [r2, 0x8]
	movs r0, 0x3
	b _080E5710
	.align 2, 0
_080E56B0: .4byte gPlayerAvatar
_080E56B4:
	strb r3, [r4]
	strb r1, [r2, 0x2]
	movs r0, 0
	b _080E5710
_080E56BC:
	cmp r1, r3
	bne _080E56E2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080E56DA
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	bne _080E56DA
	adds r0, 0x1
	strb r0, [r2, 0xB]
	movs r0, 0x4
	strb r0, [r2, 0x8]
	movs r0, 0xB
	b _080E5710
_080E56DA:
	ldrb r0, [r4]
	ldr r2, _080E5708 @ =gPlayerAvatar
	cmp r0, r3
	beq _080E570C
_080E56E2:
	ldr r0, _080E5708 @ =gPlayerAvatar
	ldrb r1, [r0, 0x2]
	adds r2, r0, 0
	cmp r1, 0x2
	beq _080E570C
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	ldrb r0, [r4]
	strb r0, [r2, 0x9]
	strb r1, [r2, 0x2]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	b _080E5710
	.align 2, 0
_080E5708: .4byte gPlayerAvatar
_080E570C:
	movs r0, 0x2
	strb r0, [r2, 0x2]
_080E5710:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputAcroBikeNormal

	thumb_func_start CheckMovementInputAcroBikeChangingDirection
CheckMovementInputAcroBikeChangingDirection: @ 80E5718
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080E5740 @ =gPlayerAvatar
	ldrb r0, [r4, 0x9]
	strb r0, [r5]
	ldrb r0, [r4, 0xA]
	adds r0, 0x1
	strb r0, [r4, 0xA]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _080E5744
	movs r0, 0x1
	strb r0, [r4, 0x2]
	movs r0, 0
	strb r0, [r4, 0x8]
	bl sub_80E6024
	movs r0, 0x1
	b _080E578A
	.align 2, 0
_080E5740: .4byte gPlayerAvatar
_080E5744:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_80E5C2C
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080E5786
	bl sub_80E6024
	movs r0, 0x1
	strb r0, [r4, 0xB]
	adds r0, r6, 0
	bl GetOppositeDirection
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080E577A
	movs r0, 0x6
	strb r0, [r4, 0x8]
	movs r0, 0x9
	b _080E578A
_080E577A:
	movs r0, 0x2
	strb r0, [r4, 0x2]
	movs r0, 0x5
	strb r0, [r4, 0x8]
	movs r0, 0x8
	b _080E578A
_080E5786:
	strb r6, [r5]
	movs r0, 0
_080E578A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputAcroBikeChangingDirection

	thumb_func_start CheckMovementInputAcroBikeStandingWheelie
CheckMovementInputAcroBikeStandingWheelie: @ 80E5790
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r4, r2, 16
	lsrs r4, 16
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080E57DC @ =gPlayerAvatar
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E57E0 @ =gMapObjects
	adds r1, r0, r1
	movs r0, 0
	strb r0, [r5, 0x2]
	movs r0, 0x2
	ands r4, r0
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0
	bne _080E57E4
	strb r4, [r5, 0xA]
	ldrb r0, [r1, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080E57EA
	strb r6, [r7]
	strb r0, [r5, 0x8]
	bl sub_80E6024
	movs r0, 0x4
	b _080E5828
	.align 2, 0
_080E57DC: .4byte gPlayerAvatar
_080E57E0: .4byte gMapObjects
_080E57E4:
	ldrb r0, [r5, 0xA]
	adds r0, 0x1
	strb r0, [r5, 0xA]
_080E57EA:
	ldr r1, _080E5800 @ =gPlayerAvatar
	ldrb r0, [r1, 0xA]
	cmp r0, 0x27
	bls _080E5804
	strb r6, [r7]
	movs r0, 0x3
	strb r0, [r1, 0x8]
	bl sub_80E6024
	movs r0, 0x6
	b _080E5828
	.align 2, 0
_080E5800: .4byte gPlayerAvatar
_080E5804:
	ldrb r0, [r7]
	cmp r0, r6
	bne _080E581A
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0x4
	strb r0, [r1, 0x8]
	bl sub_80E6024
	movs r0, 0xA
	b _080E5828
_080E581A:
	cmp r0, 0
	beq _080E5824
	movs r0, 0x1
	strb r0, [r1, 0x2]
	b _080E5826
_080E5824:
	strb r6, [r7]
_080E5826:
	movs r0, 0x5
_080E5828:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckMovementInputAcroBikeStandingWheelie

	thumb_func_start CheckMovementInputAcroBikeBunnyHop
CheckMovementInputAcroBikeBunnyHop: @ 80E5830
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r4, _080E5890 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5894 @ =gMapObjects
	adds r7, r0, r1
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080E58A2
	bl sub_80E6024
	ldrb r0, [r7, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080E5898
	movs r0, 0x2
	strb r0, [r4, 0x8]
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	b _080E58C6
	.align 2, 0
_080E5890: .4byte gPlayerAvatar
_080E5894: .4byte gMapObjects
_080E5898:
	strb r5, [r6]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x8]
	movs r0, 0x4
	b _080E58C6
_080E58A2:
	ldrb r0, [r6]
	cmp r0, 0
	bne _080E58AC
	strb r5, [r6]
	b _080E58B8
_080E58AC:
	cmp r0, r2
	beq _080E58BE
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080E58BE
	movs r0, 0x1
_080E58B8:
	strb r0, [r4, 0x2]
	movs r0, 0x6
	b _080E58C6
_080E58BE:
	ldr r1, _080E58D4 @ =gPlayerAvatar
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0x7
_080E58C6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E58D4: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBikeBunnyHop

	thumb_func_start CheckMovementInputAcroBikeMovingWheelie
CheckMovementInputAcroBikeMovingWheelie: @ 80E58D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r4, _080E5934 @ =gPlayerAvatar
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5938 @ =gMapObjects
	adds r7, r0, r1
	movs r0, 0x2
	mov r9, r0
	movs r0, 0x2
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080E5970
	bl sub_80E6024
	ldrb r0, [r7, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080E595C
	strb r1, [r4, 0x8]
	ldrb r0, [r6]
	cmp r0, 0
	bne _080E593C
	strb r5, [r6]
	b _080E5946
	.align 2, 0
_080E5934: .4byte gPlayerAvatar
_080E5938: .4byte gMapObjects
_080E593C:
	cmp r0, r5
	beq _080E594C
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080E594C
_080E5946:
	strb r1, [r4, 0x2]
	movs r0, 0x4
	b _080E59A0
_080E594C:
	ldr r1, _080E5958 @ =gPlayerAvatar
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xC
	b _080E59A0
	.align 2, 0
_080E5958: .4byte gPlayerAvatar
_080E595C:
	mov r0, r9
	strb r0, [r4, 0x8]
	adds r0, r6, 0
	mov r1, r10
	mov r2, r8
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	b _080E59A0
_080E5970:
	ldrb r0, [r6]
	cmp r0, 0
	bne _080E5986
	strb r5, [r6]
	mov r1, r9
	strb r1, [r4, 0x8]
	strb r0, [r4, 0x2]
	bl sub_80E6024
	movs r0, 0x5
	b _080E59A0
_080E5986:
	cmp r2, r0
	beq _080E5998
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _080E5998
	movs r0, 0
	strb r0, [r4, 0x2]
	movs r0, 0x5
	b _080E59A0
_080E5998:
	ldr r1, _080E59B0 @ =gPlayerAvatar
	movs r0, 0x2
	strb r0, [r1, 0x2]
	movs r0, 0xA
_080E59A0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E59B0: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBikeMovingWheelie

	thumb_func_start CheckMovementInputAcroBikeUnknownMode5
CheckMovementInputAcroBikeUnknownMode5: @ 80E59B4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _080E5A08 @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5A0C @ =gMapObjects
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r0, 0x18]
	lsls r1, 28
	lsrs r1, 28
	bl FieldObjectSetDirection
	movs r0, 0
	strb r0, [r6, 0x8]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E5A08: .4byte gPlayerAvatar
_080E5A0C: .4byte gMapObjects
	thumb_func_end CheckMovementInputAcroBikeUnknownMode5

	thumb_func_start CheckMovementInputAcroBikeUnknownMode6
CheckMovementInputAcroBikeUnknownMode6: @ 80E5A10
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080E5A30 @ =gPlayerAvatar
	movs r3, 0
	strb r3, [r4, 0x8]
	bl CheckMovementInputAcroBike
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E5A30: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputAcroBikeUnknownMode6

	thumb_func_start sub_80E56F8
sub_80E56F8: @ 80E5A34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	thumb_func_end sub_80E56F8

	thumb_func_start sub_80E5708
sub_80E5708: @ 80E5A44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5A78 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5A7C @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5A6A
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E5A6A:
	adds r0, r4, 0
	bl PlayerFaceDirection
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5A78: .4byte gPlayerAvatar
_080E5A7C: .4byte gMapObjects
	thumb_func_end sub_80E5708

	thumb_func_start sub_80E5744
sub_80E5744: @ 80E5A80
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r0, _080E5AB0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5AB4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5AB8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_80E56F8
	b _080E5AF2
	.align 2, 0
_080E5AB0: .4byte gPlayerAvatar
_080E5AB4: .4byte gMapObjects
_080E5AB8:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5AEC
	cmp r1, 0x6
	bne _080E5ADA
	adds r0, r4, 0
	bl PlayerJumpLedge
	b _080E5AF2
_080E5ADA:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E5AF2
	adds r0, r4, 0
	bl PlayerOnBikeCollide
	b _080E5AF2
_080E5AEC:
	adds r0, r6, 0
	bl npc_use_some_d2s
_080E5AF2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5744

	thumb_func_start sub_80E57BC
sub_80E57BC: @ 80E5AF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5B2C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5B30 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5B1E
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E5B1E:
	adds r0, r4, 0
	bl sub_805951C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5B2C: .4byte gPlayerAvatar
_080E5B30: .4byte gMapObjects
	thumb_func_end sub_80E57BC

	thumb_func_start sub_80E57F8
sub_80E57F8: @ 80E5B34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5B68 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5B6C @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5B5A
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E5B5A:
	adds r0, r4, 0
	bl sub_8059534
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5B68: .4byte gPlayerAvatar
_080E5B6C: .4byte gMapObjects
	thumb_func_end sub_80E57F8

	thumb_func_start sub_80E5834
sub_80E5834: @ 80E5B70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5BA4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5BA8 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5B96
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E5B96:
	adds r0, r4, 0
	bl sub_8059504
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5BA4: .4byte gPlayerAvatar
_080E5BA8: .4byte gMapObjects
	thumb_func_end sub_80E5834

	thumb_func_start sub_80E5870
sub_80E5870: @ 80E5BAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5BE0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5BE4 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5BD2
	ldrb r0, [r5, 0x18]
	lsrs r4, r0, 4
_080E5BD2:
	adds r0, r4, 0
	bl sub_805954C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5BE0: .4byte gPlayerAvatar
_080E5BE4: .4byte gMapObjects
	thumb_func_end sub_80E5870

	thumb_func_start sub_80E58AC
sub_80E58AC: @ 80E5BE8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E5C14 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5C18 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5C1C
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_80E5870
	b _080E5C56
	.align 2, 0
_080E5C14: .4byte gPlayerAvatar
_080E5C18: .4byte gMapObjects
_080E5C1C:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E5C50
	cmp r1, 0x9
	beq _080E5C50
	cmp r1, 0x6
	bne _080E5C3A
	adds r0, r4, 0
	bl sub_8059594
	b _080E5C56
_080E5C3A:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E5C56
	cmp r1, 0xB
	bhi _080E5C50
	adds r0, r4, 0
	bl sub_80E5870
	b _080E5C56
_080E5C50:
	adds r0, r4, 0
	bl sub_8059570
_080E5C56:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E58AC

	thumb_func_start sub_80E5920
sub_80E5920: @ 80E5C5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	beq _080E5C90
	cmp r0, 0x7
	beq _080E5CBC
	cmp r0, 0x9
	bls _080E5C88
	adds r0, r1, 0
	adds r1, r5, 0
	bl sub_80E5EC0
	lsls r0, 24
	cmp r0, 0
	bne _080E5C90
_080E5C88:
	adds r0, r5, 0
	bl sub_80E5708
	b _080E5CBC
_080E5C90:
	ldr r0, _080E5CC4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080E5CC8 @ =gMapObjects
	adds r4, r0
	movs r0, 0x22
	bl PlaySE
	ldrb r0, [r4, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_80608A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
_080E5CBC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E5CC4: .4byte gPlayerAvatar
_080E5CC8: .4byte gMapObjects
	thumb_func_end sub_80E5920

	thumb_func_start sub_80E5990
sub_80E5990: @ 80E5CCC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80595B8
	pop {r0}
	bx r0
	thumb_func_end sub_80E5990

	thumb_func_start sub_80E59A0
sub_80E59A0: @ 80E5CDC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r7, _080E5D0C @ =gPlayerAvatar
	ldrb r1, [r7, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5D10 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5D14
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_8059504
	b _080E5D64
	.align 2, 0
_080E5D0C: .4byte gPlayerAvatar
_080E5D10: .4byte gMapObjects
_080E5D14:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5D5A
	cmp r1, 0x6
	bne _080E5D36
	adds r0, r4, 0
	bl sub_8059594
	b _080E5D64
_080E5D36:
	cmp r1, 0x9
	beq _080E5D4A
	cmp r1, 0x4
	bhi _080E5D64
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E5D52
_080E5D4A:
	adds r0, r4, 0
	bl sub_8059504
	b _080E5D64
_080E5D52:
	adds r0, r4, 0
	bl sub_80595DC
	b _080E5D64
_080E5D5A:
	adds r0, r6, 0
	bl sub_8059618
	movs r0, 0x2
	strb r0, [r7, 0x2]
_080E5D64:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E59A0

	thumb_func_start sub_80E5A30
sub_80E5A30: @ 80E5D6C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r7, _080E5D9C @ =gPlayerAvatar
	ldrb r1, [r7, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5DA0 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5DA4
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_805951C
	b _080E5DF4
	.align 2, 0
_080E5D9C: .4byte gPlayerAvatar
_080E5DA0: .4byte gMapObjects
_080E5DA4:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5DEA
	cmp r1, 0x6
	bne _080E5DC6
	adds r0, r4, 0
	bl sub_8059594
	b _080E5DF4
_080E5DC6:
	cmp r1, 0x9
	beq _080E5DDA
	cmp r1, 0x4
	bhi _080E5DF4
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E5DE2
_080E5DDA:
	adds r0, r4, 0
	bl sub_8059504
	b _080E5DF4
_080E5DE2:
	adds r0, r4, 0
	bl sub_80595DC
	b _080E5DF4
_080E5DEA:
	adds r0, r6, 0
	bl sub_8059600
	movs r0, 0x2
	strb r0, [r7, 0x2]
_080E5DF4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5A30

	thumb_func_start sub_80E5AC0
sub_80E5AC0: @ 80E5DFC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r0, _080E5E2C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080E5E30 @ =gMapObjects
	adds r5, r0, r1
	ldrb r1, [r5, 0x1E]
	adds r0, r4, 0
	bl sub_80E5E70
	lsls r0, 24
	cmp r0, 0
	bne _080E5E34
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	bl sub_8059534
	b _080E5E6E
	.align 2, 0
_080E5E2C: .4byte gPlayerAvatar
_080E5E30: .4byte gMapObjects
_080E5E34:
	adds r0, r4, 0
	bl sub_80E5D34
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xA
	bhi _080E5E68
	cmp r1, 0x6
	bne _080E5E56
	adds r0, r4, 0
	bl PlayerJumpLedge
	b _080E5E6E
_080E5E56:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080E5E6E
	adds r0, r4, 0
	bl sub_8059534
	b _080E5E6E
_080E5E68:
	adds r0, r6, 0
	bl sub_8059630
_080E5E6E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5AC0

	thumb_func_start sub_80E5B38
sub_80E5B38: @ 80E5E74
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r2, r1, 16
	ldr r0, _080E5E98 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E5E92
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_80E5B60
_080E5E92:
	pop {r0}
	bx r0
	.align 2, 0
_080E5E98: .4byte gPlayerAvatar
	thumb_func_end sub_80E5B38

	thumb_func_start sub_80E5B60
sub_80E5B60: @ 80E5E9C
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r5, 0
	bl sub_80E5CF4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r4, _080E5EC4 @ =gPlayerAvatar
	ldr r0, [r4, 0xC]
	movs r1, 0xF
	ands r0, r1
	cmp r2, r0
	bne _080E5EC8
	ldrb r0, [r4, 0x14]
	cmp r0, 0xFE
	bhi _080E5ED2
	adds r0, 0x1
	strb r0, [r4, 0x14]
	b _080E5ED2
	.align 2, 0
_080E5EC4: .4byte gPlayerAvatar
_080E5EC8:
	adds r0, r2, 0
	bl sub_80E5C7C
	movs r0, 0
	strb r0, [r4, 0xB]
_080E5ED2:
	movs r0, 0xF
	adds r2, r5, 0
	ands r2, r0
	ldr r4, _080E5EF0 @ =gPlayerAvatar
	ldr r0, [r4, 0x10]
	movs r1, 0xF
	ands r0, r1
	cmp r2, r0
	bne _080E5EF4
	ldrb r0, [r4, 0x1C]
	cmp r0, 0xFE
	bhi _080E5EFE
	adds r0, 0x1
	strb r0, [r4, 0x1C]
	b _080E5EFE
	.align 2, 0
_080E5EF0: .4byte gPlayerAvatar
_080E5EF4:
	adds r0, r2, 0
	bl sub_80E5CB8
	movs r0, 0
	strb r0, [r4, 0xB]
_080E5EFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E5B60

	thumb_func_start sub_80E5BC8
sub_80E5BC8: @ 80E5F04
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	movs r2, 0
	ldrb r0, [r3]
	cmp r0, 0
	beq _080E5F2E
	ldr r5, _080E5F48 @ =gUnknown_0202E86C
_080E5F14:
	adds r0, r2, r5
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bhi _080E5F44
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E5F14
_080E5F2E:
	movs r2, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _080E5F5E
	ldr r3, _080E5F4C @ =gUnknown_0202E874
_080E5F38:
	adds r0, r2, r3
	adds r1, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080E5F50
_080E5F44:
	movs r0, 0
	b _080E5F60
	.align 2, 0
_080E5F48: .4byte gUnknown_0202E86C
_080E5F4C: .4byte gUnknown_0202E874
_080E5F50:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080E5F38
_080E5F5E:
	movs r0, 0x1
_080E5F60:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5BC8

	thumb_func_start sub_80E5C2C
sub_80E5C2C: @ 80E5F68
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
_080E5F6E:
	ldr r0, _080E5FA0 @ =gUnknown_083DB608
	adds r4, r5, r0
	ldr r0, _080E5FA4 @ =gPlayerAvatar
	ldr r1, [r0, 0xC]
	ldr r2, [r0, 0x10]
	ldr r0, [r4, 0x8]
	ands r1, r0
	ldr r0, [r4, 0xC]
	ands r2, r0
	ldr r0, [r4]
	cmp r1, r0
	bne _080E5FA8
	ldr r0, [r4, 0x4]
	cmp r2, r0
	bne _080E5FA8
	ldr r0, [r4, 0x10]
	ldr r1, [r4, 0x14]
	bl sub_80E5BC8
	lsls r0, 24
	cmp r0, 0
	beq _080E5FA8
	ldrb r0, [r4, 0x18]
	b _080E5FB2
	.align 2, 0
_080E5FA0: .4byte gUnknown_083DB608
_080E5FA4: .4byte gPlayerAvatar
_080E5FA8:
	adds r5, 0x1C
	adds r6, 0x1
	cmp r6, 0x3
	bls _080E5F6E
	movs r0, 0
_080E5FB2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5C2C

	thumb_func_start sub_80E5C7C
sub_80E5C7C: @ 80E5FB8
	push {r4,lr}
	lsls r0, 24
	ldr r3, _080E5FF0 @ =gPlayerAvatar
	ldr r2, [r3, 0xC]
	lsls r2, 4
	movs r1, 0xF0
	lsls r1, 20
	ands r1, r0
	lsrs r1, 24
	orrs r2, r1
	str r2, [r3, 0xC]
	movs r1, 0x7
	adds r4, r3, 0
	adds r3, 0x14
_080E5FD4:
	adds r2, r1, r3
	subs r1, 0x1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080E5FD4
	movs r0, 0x1
	strb r0, [r4, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5FF0: .4byte gPlayerAvatar
	thumb_func_end sub_80E5C7C

	thumb_func_start sub_80E5CB8
sub_80E5CB8: @ 80E5FF4
	push {r4,lr}
	lsls r0, 24
	ldr r3, _080E602C @ =gPlayerAvatar
	ldr r2, [r3, 0x10]
	lsls r2, 4
	movs r1, 0xF0
	lsls r1, 20
	ands r1, r0
	lsrs r1, 24
	orrs r2, r1
	str r2, [r3, 0x10]
	movs r1, 0x7
	adds r4, r3, 0
	adds r3, 0x1C
_080E6010:
	adds r2, r1, r3
	subs r1, 0x1
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	bne _080E6010
	movs r0, 0x1
	strb r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E602C: .4byte gPlayerAvatar
	thumb_func_end sub_80E5CB8

	thumb_func_start sub_80E5CF4
sub_80E5CF4: @ 80E6030
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080E6044
	movs r0, 0x2
	b _080E606A
_080E6044:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080E6050
	movs r0, 0x1
	b _080E606A
_080E6050:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080E605C
	movs r0, 0x3
	b _080E606A
_080E605C:
	movs r0, 0x10
	ands r2, r0
	cmp r2, 0
	bne _080E6068
	movs r0, 0
	b _080E606A
_080E6068:
	movs r0, 0x4
_080E606A:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5CF4

	thumb_func_start sub_80E5D34
sub_80E5D34: @ 80E6070
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080E60D4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080E60D8 @ =gMapObjects
	adds r4, r0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	bl MoveCoords
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	add r1, sp, 0x4
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, 0
	adds r3, r6, 0
	bl sub_80E5DA0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E60D4: .4byte gPlayerAvatar
_080E60D8: .4byte gMapObjects
	thumb_func_end sub_80E5D34

	thumb_func_start sub_80E5DA0
sub_80E5DA0: @ 80E60DC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r5, r4, 0
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	str r5, [sp]
	bl CheckForFieldObjectCollision
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _080E611C
	cmp r4, 0
	bne _080E6118
	adds r0, r5, 0
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	beq _080E6114
	movs r4, 0x2
_080E6114:
	cmp r4, 0
	beq _080E611C
_080E6118:
	bl sub_80E5E4C
_080E611C:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5DA0

	thumb_func_start sub_80E5DEC
sub_80E5DEC: @ 80E6128
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	bne _080E6140
	ldr r0, _080E6144 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	bne _080E6148
_080E6140:
	movs r0, 0x1
	b _080E614A
	.align 2, 0
_080E6144: .4byte gMapHeader
_080E6148:
	movs r0, 0
_080E614A:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5DEC

	thumb_func_start IsRunningDisallowedByMetatile
IsRunningDisallowedByMetatile: @ 80E6150
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsRunningDisallowed
	lsls r0, 24
	cmp r0, 0
	bne _080E617A
	adds r0, r4, 0
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	beq _080E617E
	bl PlayerGetZCoord
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080E617E
_080E617A:
	movs r0, 0x1
	b _080E6180
_080E617E:
	movs r0, 0
_080E6180:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsRunningDisallowedByMetatile

	thumb_func_start sub_80E5E4C
sub_80E5E4C: @ 80E6188
	push {lr}
	ldr r0, _080E61A4 @ =gUnknown_02039250
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E619E
	ldr r1, _080E61A8 @ =gUnknown_02039251
	ldrb r0, [r1]
	cmp r0, 0x63
	bhi _080E619E
	adds r0, 0x1
	strb r0, [r1]
_080E619E:
	pop {r0}
	bx r0
	.align 2, 0
_080E61A4: .4byte gUnknown_02039250
_080E61A8: .4byte gUnknown_02039251
	thumb_func_end sub_80E5E4C

	thumb_func_start sub_80E5E70
sub_80E5E70: @ 80E61AC
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0xFD
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080E61D6
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, 24
	cmp r0, 0
	bne _080E61EE
	adds r0, r4, 0
	bl MetatileBehavior_IsVerticalRail
	b _080E61E8
_080E61D6:
	adds r0, r5, 0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, 24
	cmp r0, 0
	bne _080E61EE
	adds r0, r5, 0
	bl MetatileBehavior_IsHorizontalRail
_080E61E8:
	lsls r0, 24
	cmp r0, 0
	beq _080E61F2
_080E61EE:
	movs r0, 0
	b _080E61F4
_080E61F2:
	movs r0, 0x1
_080E61F4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5E70

	thumb_func_start sub_80E5EC0
sub_80E5EC0: @ 80E61FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r1, r3
	lsrs r1, 24
	cmp r1, 0x1
	bhi _080E621C
	cmp r0, 0xA
	beq _080E6224
	cmp r0, 0xC
	bne _080E6228
	b _080E6224
_080E621C:
	cmp r2, 0xB
	beq _080E6224
	cmp r2, 0xD
	bne _080E6228
_080E6224:
	movs r0, 0
	b _080E622A
_080E6228:
	movs r0, 0x1
_080E622A:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5EC0

	thumb_func_start sub_80E5EF4
sub_80E5EF4: @ 80E6230
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080E626C @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	bne _080E6270
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	bne _080E6270
	movs r0, 0
	b _080E6272
	.align 2, 0
_080E626C: .4byte gPlayerAvatar
_080E6270:
	movs r0, 0x1
_080E6272:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5EF4

	thumb_func_start player_should_look_direction_be_enforced_upon_movement
player_should_look_direction_be_enforced_upon_movement: @ 80E627C
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080E62B0
	ldr r2, _080E62A8 @ =gMapObjects
	ldr r0, _080E62AC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E62B0
	movs r0, 0
	b _080E62B2
	.align 2, 0
_080E62A8: .4byte gMapObjects
_080E62AC: .4byte gPlayerAvatar
_080E62B0:
	movs r0, 0x1
_080E62B2:
	pop {r1}
	bx r1
	thumb_func_end player_should_look_direction_be_enforced_upon_movement

	thumb_func_start GetOnOffBike
GetOnOffBike: @ 80E62B8
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080E62E0 @ =gUnknown_0202E854
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080E62E4 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _080E62E8
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	bl sav1_reset_battle_music_maybe
	bl sub_8053E90
	b _080E62FC
	.align 2, 0
_080E62E0: .4byte gUnknown_0202E854
_080E62E4: .4byte gPlayerAvatar
_080E62E8:
	adds r0, r2, 0
	bl SetPlayerAvatarTransitionFlags
	ldr r4, _080E6304 @ =0x00000193
	adds r0, r4, 0
	bl sav1_set_battle_music_maybe
	adds r0, r4, 0
	bl sub_8053FB0
_080E62FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E6304: .4byte 0x00000193
	thumb_func_end GetOnOffBike

	thumb_func_start sub_80E5FCC
sub_80E5FCC: @ 80E6308
	push {lr}
	ldr r2, _080E6344 @ =gPlayerAvatar
	movs r3, 0
	strb r3, [r2, 0x8]
	strb r3, [r2, 0x9]
	strb r3, [r2, 0xA]
	strb r3, [r2, 0xB]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	movs r1, 0
	adds r2, 0x14
_080E631E:
	adds r0, r1, r2
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080E631E
	movs r1, 0
	ldr r3, _080E6348 @ =gUnknown_0202E874
	movs r2, 0
_080E6332:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080E6332
	pop {r0}
	bx r0
	.align 2, 0
_080E6344: .4byte gPlayerAvatar
_080E6348: .4byte gUnknown_0202E874
	thumb_func_end sub_80E5FCC

	thumb_func_start sub_80E6010
sub_80E6010: @ 80E634C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E635C @ =gPlayerAvatar
	strb r0, [r2, 0xA]
	lsrs r1, r0, 1
	adds r0, r1
	strb r0, [r2, 0xB]
	bx lr
	.align 2, 0
_080E635C: .4byte gPlayerAvatar
	thumb_func_end sub_80E6010

	thumb_func_start sub_80E6024
sub_80E6024: @ 80E6360
	ldr r1, _080E636C @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0xA]
	strb r0, [r1, 0xB]
	bx lr
	.align 2, 0
_080E636C: .4byte gPlayerAvatar
	thumb_func_end sub_80E6024

	thumb_func_start sub_80E6034
sub_80E6034: @ 80E6370
	push {lr}
	sub sp, 0x8
	ldr r1, _080E6398 @ =gUnknown_083DB600
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r2, _080E639C @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E63A0
	ldrb r0, [r2, 0xA]
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	b _080E63BA
	.align 2, 0
_080E6398: .4byte gUnknown_083DB600
_080E639C: .4byte gPlayerAvatar
_080E63A0:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E63AC
	movs r0, 0x3
	b _080E63BA
_080E63AC:
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _080E63B8
	movs r0, 0x1
	b _080E63BA
_080E63B8:
	movs r0, 0x2
_080E63BA:
	add sp, 0x8
	pop {r1}
	bx r1
	thumb_func_end sub_80E6034

	thumb_func_start sub_80E6084
sub_80E6084: @ 80E63C0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080E6410 @ =gPlayerAvatar
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E6408
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E6408
	movs r0, 0x2
	strb r0, [r5, 0x8]
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059C94
_080E6408:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E6410: .4byte gPlayerAvatar
	thumb_func_end sub_80E6084

	.align 2, 0 @ Don't pad with nop.
