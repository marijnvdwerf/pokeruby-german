	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_812AECC
unref_sub_812AECC: @ 812B248
	push {lr}
	bl sub_812613C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _0812B266
	cmp r0, 0x1
	ble _0812B284
	cmp r1, 0x2
	beq _0812B270
	cmp r1, 0x3
	beq _0812B276
	b _0812B284
_0812B266:
	movs r0, 0x16
	bl PlaySE
	movs r0, 0x1
	b _0812B286
_0812B270:
	bl sub_812AF10
	b _0812B284
_0812B276:
	movs r0, 0x16
	bl PlaySE
	bl sub_812AF10
	movs r0, 0x1
	b _0812B286
_0812B284:
	movs r0, 0
_0812B286:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_812AECC

	thumb_func_start sub_812AF10
sub_812AF10: @ 812B28C
	push {lr}
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0812B2A8 @ =gStringVar4
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0812B2A8: .4byte gStringVar4
	thumb_func_end sub_812AF10

	thumb_func_start sub_812AF30
sub_812AF30: @ 812B2AC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0812B308 @ =gTasks
	lsls r6, r0, 2
	adds r6, r0
	lsls r6, 3
	adds r6, r1
	ldr r1, _0812B30C @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r6, 0x8]
	ldrh r0, [r1, 0x2]
	strh r0, [r6, 0xA]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3F
	bl sub_8076F98
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_807712C
	strh r4, [r6, 0xC]
	strh r5, [r6, 0xE]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r6, 0x10]
	movs r0, 0xA
	strh r0, [r6, 0x1C]
	ldr r0, _0812B310 @ =sub_812AF98
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B308: .4byte gTasks
_0812B30C: .4byte gUnknown_03004B00
_0812B310: .4byte sub_812AF98
	thumb_func_end sub_812AF30

	thumb_func_start sub_812AF98
sub_812AF98: @ 812B314
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812B344 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r5, [r4, 0xC]
	ldrb r6, [r4, 0x10]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	bne _0812B34C
	movs r0, 0x5
	strh r0, [r4, 0x1C]
	strh r1, [r4, 0x1E]
	ldr r0, _0812B348 @ =sub_812B004
	str r0, [r4]
	b _0812B37A
	.align 2, 0
_0812B344: .4byte gTasks
_0812B348: .4byte sub_812B004
_0812B34C:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _0812B366
	strh r1, [r4, 0x1C]
	ldrh r0, [r4, 0x8]
	lsls r1, r5, 24
	asrs r1, 24
	bl PlaySE12WithPanning
_0812B366:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	bl sub_8077104
	strh r0, [r4, 0xC]
_0812B37A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812AF98

	thumb_func_start sub_812B004
sub_812B004: @ 812B380
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812B3D0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _0812B3C8
	movs r0, 0
	strh r0, [r4, 0x1C]
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	ldrh r0, [r4, 0xA]
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0812B3C8
	adds r0, r5, 0
	bl move_anim_related_task_del
_0812B3C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B3D0: .4byte gTasks
	thumb_func_end sub_812B004

	thumb_func_start sub_812B058
sub_812B058: @ 812B3D4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0812B478 @ =gUnknown_03004B00
	ldrh r1, [r0]
	str r1, [sp]
	ldrb r5, [r0, 0x4]
	ldrb r6, [r0, 0x6]
	ldrb r3, [r0, 0x8]
	mov r10, r3
	ldrb r7, [r0, 0xA]
	ldrb r1, [r0, 0xC]
	mov r9, r1
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl sub_8076F98
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_807712C
	ldr r2, _0812B47C @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	mov r6, sp
	ldrh r6, [r6]
	strh r6, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r10
	strh r0, [r1, 0x10]
	strh r7, [r1, 0x12]
	mov r3, r9
	strh r3, [r1, 0x14]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	strh r3, [r1, 0x20]
	ldr r2, _0812B480 @ =sub_812B108
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812B478: .4byte gUnknown_03004B00
_0812B47C: .4byte gTasks
_0812B480: .4byte sub_812B108
	thumb_func_end sub_812B058

	thumb_func_start sub_812B108
sub_812B108: @ 812B484
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812B4C8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x20]
	adds r1, r0, 0x1
	strh r1, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0812B4CC
	movs r0, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x8]
	movs r1, 0x1E
	ldrsb r1, [r4, r1]
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _0812B4CC
	adds r0, r5, 0
	bl move_anim_related_task_del
	b _0812B4FE
	.align 2, 0
_0812B4C8: .4byte gTasks
_0812B4CC:
	ldr r1, _0812B504 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0812B4FE
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xE]
	ldrh r1, [r4, 0x1E]
	adds r0, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8077104
	strh r0, [r4, 0x1E]
_0812B4FE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B504: .4byte gTasks
	thumb_func_end sub_812B108

	thumb_func_start sub_812B18C
sub_812B18C: @ 812B508
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812B548
	ldr r0, _0812B538 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812B540
	ldr r0, _0812B53C @ =0x02019348
	ldrh r4, [r0]
	b _0812B5EE
	.align 2, 0
_0812B538: .4byte gUnknown_03004B00
_0812B53C: .4byte 0x02019348
_0812B540:
	adds r0, r5, 0
	bl move_anim_task_del
	b _0812B5EE
_0812B548:
	ldr r0, _0812B55C @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _0812B564
	ldr r0, _0812B560 @ =gUnknown_0202F7C8
	ldrb r4, [r0]
	b _0812B58A
	.align 2, 0
_0812B55C: .4byte gUnknown_03004B00
_0812B560: .4byte gUnknown_0202F7C8
_0812B564:
	cmp r1, 0x1
	bne _0812B574
	ldr r0, _0812B570 @ =gUnknown_0202F7C9
	ldrb r4, [r0]
	b _0812B58A
	.align 2, 0
_0812B570: .4byte gUnknown_0202F7C9
_0812B574:
	cmp r1, 0x2
	bne _0812B580
	ldr r0, _0812B57C @ =gUnknown_0202F7C8
	b _0812B582
	.align 2, 0
_0812B57C: .4byte gUnknown_0202F7C8
_0812B580:
	ldr r0, _0812B5AC @ =gUnknown_0202F7C9
_0812B582:
	ldrb r1, [r0]
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r1
_0812B58A:
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _0812B596
	cmp r0, 0x3
	bne _0812B5B0
_0812B596:
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _0812B5B0
	adds r0, r5, 0
	bl move_anim_task_del
	b _0812B62C
	.align 2, 0
_0812B5AC: .4byte gUnknown_0202F7C9
_0812B5B0:
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812B5D4
	ldr r1, _0812B5CC @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B5D0 @ =gEnemyParty
	b _0812B5E2
	.align 2, 0
_0812B5CC: .4byte gUnknown_02024A6A
_0812B5D0: .4byte gEnemyParty
_0812B5D4:
	ldr r1, _0812B60C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812B610 @ =gPlayerParty
_0812B5E2:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_0812B5EE:
	cmp r4, 0
	beq _0812B626
	ldr r0, _0812B614 @ =gUnknown_03004B00
	ldrh r2, [r0, 0x2]
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	bne _0812B618
	lsls r1, r6, 24
	asrs r1, 24
	adds r0, r4, 0
	bl PlayCry1
	b _0812B626
	.align 2, 0
_0812B60C: .4byte gUnknown_02024A6A
_0812B610: .4byte gPlayerParty
_0812B614: .4byte gUnknown_03004B00
_0812B618:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl PlayCry3
_0812B626:
	adds r0, r5, 0
	bl move_anim_task_del
_0812B62C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812B18C

	thumb_func_start sub_812B2B8
sub_812B2B8: @ 812B634
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812B658
	ldr r0, _0812B654 @ =0x02019348
	b _0812B662
	.align 2, 0
_0812B654: .4byte 0x02019348
_0812B658:
	ldr r1, _0812B680 @ =gUnknown_0202F7CA
	ldr r0, _0812B684 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
_0812B662:
	ldrh r0, [r0]
	cmp r0, 0
	beq _0812B672
	lsls r1, r4, 24
	asrs r1, 24
	movs r2, 0x4
	bl PlayCry3
_0812B672:
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B680: .4byte gUnknown_0202F7CA
_0812B684: .4byte gUnknown_0202F7C8
	thumb_func_end sub_812B2B8

	thumb_func_start sub_812B30C
sub_812B30C: @ 812B688
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B6B8 @ =gUnknown_03004B00
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE1WithPanning
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B6B8: .4byte gUnknown_03004B00
	thumb_func_end sub_812B30C

	thumb_func_start sub_812B340
sub_812B340: @ 812B6BC
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812B6EC @ =gUnknown_03004B00
	ldrh r5, [r0]
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlaySE2WithPanning
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B6EC: .4byte gUnknown_03004B00
	thumb_func_end sub_812B340

	thumb_func_start sub_812B374
sub_812B374: @ 812B6F0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0812B774 @ =gUnknown_03004B00
	ldrb r5, [r0, 0x2]
	ldrb r6, [r0, 0x4]
	ldrh r1, [r0, 0x6]
	mov r9, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	asrs r5, 24
	adds r0, r5, 0
	bl sub_8076F98
	adds r5, r0, 0
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_807712C
	ldr r2, _0812B778 @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0xE]
	mov r0, r9
	strh r0, [r1, 0x12]
	strh r2, [r1, 0x1C]
	strh r4, [r1, 0x1E]
	ldr r2, _0812B77C @ =sub_812B404
	str r2, [r1]
	mov r0, r8
	bl _call_via_r2
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812B774: .4byte gUnknown_03004B00
_0812B778: .4byte gTasks
_0812B77C: .4byte sub_812B404
	thumb_func_end sub_812B374

	thumb_func_start sub_812B404
sub_812B404: @ 812B780
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812B7D8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0812B7BA
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	adds r0, r2, r1
	strh r0, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	bl sub_8077104
	strh r0, [r4, 0x1E]
_0812B7BA:
	ldr r1, _0812B7DC @ =gUnknown_0202F7D2
	ldrh r0, [r4, 0x1E]
	strb r0, [r1]
	movs r3, 0x1E
	ldrsh r1, [r4, r3]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0812B7D2
	adds r0, r5, 0
	bl move_anim_task_del
_0812B7D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B7D8: .4byte gTasks
_0812B7DC: .4byte gUnknown_0202F7D2
	thumb_func_end sub_812B404

	thumb_func_start unref_sub_812B464
unref_sub_812B464: @ 812B7E0
	bx lr
	thumb_func_end unref_sub_812B464

	thumb_func_start sub_812B468
sub_812B468: @ 812B7E4
	ldr r1, _0812B7F4 @ =gUnknown_03004330
	ldr r0, _0812B7F8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812B7FC @ =sub_812B484
	str r1, [r0]
	bx lr
	.align 2, 0
_0812B7F4: .4byte gUnknown_03004330
_0812B7F8: .4byte gUnknown_02024A60
_0812B7FC: .4byte sub_812B484
	thumb_func_end sub_812B468

	thumb_func_start sub_812B484
sub_812B484: @ 812B800
	push {lr}
	ldr r2, _0812B834 @ =gUnknown_02024A64
	ldr r1, _0812B838 @ =gBitTable
	ldr r0, _0812B83C @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0812B84C
	ldr r0, _0812B840 @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0812B848
	ldr r0, _0812B844 @ =gUnknown_08402080
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0812B84C
	.align 2, 0
_0812B834: .4byte gUnknown_02024A64
_0812B838: .4byte gBitTable
_0812B83C: .4byte gUnknown_02024A60
_0812B840: .4byte gUnknown_02023A60
_0812B844: .4byte gUnknown_08402080
_0812B848:
	bl dp01_tbl6_exec_completed
_0812B84C:
	pop {r0}
	bx r0
	thumb_func_end sub_812B484

	thumb_func_start bx_battle_menu_t6_2
bx_battle_menu_t6_2: @ 812B850
	push {r4,r5,lr}
	ldr r0, _0812B884 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B8C2
	movs r0, 0x5
	bl PlaySE
	bl sub_814A7FC
	ldr r1, _0812B888 @ =gUnknown_02024E60
	ldr r0, _0812B88C @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0812B8A0
	cmp r0, 0x1
	bgt _0812B890
	cmp r0, 0
	beq _0812B89A
	b _0812B8BC
	.align 2, 0
_0812B884: .4byte gMain
_0812B888: .4byte gUnknown_02024E60
_0812B88C: .4byte gUnknown_02024A60
_0812B890:
	cmp r0, 0x2
	beq _0812B8A6
	cmp r0, 0x3
	beq _0812B8B2
	b _0812B8BC
_0812B89A:
	movs r0, 0x1
	movs r1, 0x5
	b _0812B8AA
_0812B8A0:
	movs r0, 0x1
	movs r1, 0x6
	b _0812B8AA
_0812B8A6:
	movs r0, 0x1
	movs r1, 0x7
_0812B8AA:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	b _0812B8BC
_0812B8B2:
	movs r0, 0x1
	movs r1, 0x8
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
_0812B8BC:
	bl dp01_tbl6_exec_completed
	b _0812B9CA
_0812B8C2:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812B900
	ldr r5, _0812B8F8 @ =gUnknown_02024E60
	ldr r4, _0812B8FC @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0812B9CA
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0812B96E
	.align 2, 0
_0812B8F8: .4byte gUnknown_02024E60
_0812B8FC: .4byte gUnknown_02024A60
_0812B900:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812B93C
	ldr r5, _0812B934 @ =gUnknown_02024E60
	ldr r4, _0812B938 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0812B9CA
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x1
	b _0812B96E
	.align 2, 0
_0812B934: .4byte gUnknown_02024E60
_0812B938: .4byte gUnknown_02024A60
_0812B93C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0812B988
	ldr r5, _0812B980 @ =gUnknown_02024E60
	ldr r4, _0812B984 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812B9CA
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
_0812B96E:
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	b _0812B9CA
	.align 2, 0
_0812B980: .4byte gUnknown_02024E60
_0812B984: .4byte gUnknown_02024A60
_0812B988:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0812B9CA
	ldr r5, _0812B9D0 @ =gUnknown_02024E60
	ldr r4, _0812B9D4 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0812B9CA
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl nullsub_8
	ldrb r1, [r4]
	adds r1, r5
	ldrb r0, [r1]
	movs r2, 0x2
	eors r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
_0812B9CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812B9D0: .4byte gUnknown_02024E60
_0812B9D4: .4byte gUnknown_02024A60
	thumb_func_end bx_battle_menu_t6_2

	thumb_func_start sub_812B65C
sub_812B65C: @ 812B9D8
	push {lr}
	ldr r2, _0812BA00 @ =gSprites
	ldr r1, _0812BA04 @ =gUnknown_02024BE0
	ldr r0, _0812BA08 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0812BA0C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0812B9FC
	bl dp01_tbl6_exec_completed
_0812B9FC:
	pop {r0}
	bx r0
	.align 2, 0
_0812BA00: .4byte gSprites
_0812BA04: .4byte gUnknown_02024BE0
_0812BA08: .4byte gUnknown_02024A60
_0812BA0C: .4byte SpriteCallbackDummy
	thumb_func_end sub_812B65C

	thumb_func_start sub_812B694
sub_812B694: @ 812BA10
	push {lr}
	ldr r0, _0812BA24 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0812BA1E
	bl dp01_tbl6_exec_completed
_0812BA1E:
	pop {r0}
	bx r0
	.align 2, 0
_0812BA24: .4byte gUnknown_03004210
	thumb_func_end sub_812B694

	thumb_func_start sub_812B6AC
sub_812B6AC: @ 812BA28
	push {lr}
	ldr r0, _0812BA58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812BA52
	ldr r2, _0812BA5C @ =gMain
	ldr r0, _0812BA60 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0812BA64 @ =gUnknown_030042D0
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0812BA52:
	pop {r0}
	bx r0
	.align 2, 0
_0812BA58: .4byte gPaletteFade
_0812BA5C: .4byte gMain
_0812BA60: .4byte 0x0000043d
_0812BA64: .4byte gUnknown_030042D0
	thumb_func_end sub_812B6AC

	thumb_func_start bx_wait_t6
bx_wait_t6: @ 812BA68
	push {lr}
	ldr r0, _0812BA94 @ =gUnknown_02024E6D
	ldrb r0, [r0]
	cmp r0, 0
	beq _0812BA8A
	ldr r0, _0812BA98 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812BA9C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0812BA8E
_0812BA8A:
	bl dp01_tbl6_exec_completed
_0812BA8E:
	pop {r0}
	bx r0
	.align 2, 0
_0812BA94: .4byte gUnknown_02024E6D
_0812BA98: .4byte gUnknown_02024A60
_0812BA9C: .4byte 0x02017810
	thumb_func_end bx_wait_t6

	thumb_func_start sub_812B724
sub_812B724: @ 812BAA0
	push {lr}
	ldr r0, _0812BAC4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812BAC0
	ldr r1, _0812BAC8 @ =gUnknown_03004330
	ldr r0, _0812BACC @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BAD0 @ =sub_812B758
	str r1, [r0]
	bl sub_810BADC
_0812BAC0:
	pop {r0}
	bx r0
	.align 2, 0
_0812BAC4: .4byte gPaletteFade
_0812BAC8: .4byte gUnknown_03004330
_0812BACC: .4byte gUnknown_02024A60
_0812BAD0: .4byte sub_812B758
	thumb_func_end sub_812B724

	thumb_func_start sub_812B758
sub_812B758: @ 812BAD4
	push {lr}
	ldr r0, _0812BB00 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _0812BB04 @ =sub_800F808
	cmp r1, r0
	bne _0812BAFA
	ldr r0, _0812BB08 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812BAFA
	ldr r0, _0812BB0C @ =gScriptItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl dp01_tbl6_exec_completed
_0812BAFA:
	pop {r0}
	bx r0
	.align 2, 0
_0812BB00: .4byte gMain
_0812BB04: .4byte sub_800F808
_0812BB08: .4byte gPaletteFade
_0812BB0C: .4byte gScriptItemId
	thumb_func_end sub_812B758

	thumb_func_start sub_812B794
sub_812B794: @ 812BB10
	push {lr}
	ldr r0, _0812BB34 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812BB38 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0812BB2E
	bl dp01_tbl6_exec_completed
_0812BB2E:
	pop {r0}
	bx r0
	.align 2, 0
_0812BB34: .4byte gUnknown_02024A60
_0812BB38: .4byte 0x02017810
	thumb_func_end sub_812B794

	thumb_func_start dp01_tbl6_exec_completed
dp01_tbl6_exec_completed: @ 812BB3C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0812BB7C @ =gUnknown_03004330
	ldr r4, _0812BB80 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BB84 @ =sub_812B484
	str r1, [r0]
	ldr r0, _0812BB88 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0812BB90
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _0812BB8C @ =gUnknown_02023A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0812BBA2
	.align 2, 0
_0812BB7C: .4byte gUnknown_03004330
_0812BB80: .4byte gUnknown_02024A60
_0812BB84: .4byte sub_812B484
_0812BB88: .4byte gUnknown_020239F8
_0812BB8C: .4byte gUnknown_02023A60
_0812BB90:
	ldr r2, _0812BBAC @ =gUnknown_02024A64
	ldr r1, _0812BBB0 @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0812BBA2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BBAC: .4byte gUnknown_02024A64
_0812BBB0: .4byte gBitTable
	thumb_func_end dp01_tbl6_exec_completed

	thumb_func_start unref_sub_812B838
unref_sub_812B838: @ 812BBB4
	push {lr}
	ldr r0, _0812BBD8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812BBDC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0812BBD2
	bl dp01_tbl6_exec_completed
_0812BBD2:
	pop {r0}
	bx r0
	.align 2, 0
_0812BBD8: .4byte gUnknown_02024A60
_0812BBDC: .4byte 0x02017810
	thumb_func_end unref_sub_812B838

	thumb_func_start sub_812B864
sub_812B864: @ 812BBE0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B864

	thumb_func_start sub_812B870
sub_812B870: @ 812BBEC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B870

	thumb_func_start sub_812B87C
sub_812B87C: @ 812BBF8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B87C

	thumb_func_start sub_812B888
sub_812B888: @ 812BC04
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B888

	thumb_func_start sub_812B894
sub_812B894: @ 812BC10
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B894

	thumb_func_start sub_812B8A0
sub_812B8A0: @ 812BC1C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B8A0

	thumb_func_start sub_812B8AC
sub_812B8AC: @ 812BC28
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B8AC

	thumb_func_start sub_812B8B8
sub_812B8B8: @ 812BC34
	push {r4-r6,lr}
	ldr r4, _0812BCE8 @ =gSaveBlock2
	ldrb r0, [r4, 0x8]
	ldr r5, _0812BCEC @ =gUnknown_02024A60
	ldrb r1, [r5]
	bl sub_8031AF4
	ldrb r6, [r4, 0x8]
	ldrb r0, [r5]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0812BCF0 @ =gUnknown_02024E8C
	ldr r2, _0812BCF4 @ =gTrainerBackPicCoords
	ldrb r1, [r4, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _0812BCF8 @ =gUnknown_02024BE0
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _0812BCFC @ =gSprites
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0812BD00 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0812BD04 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0812BD08 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BD0C @ =sub_812B65C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812BCE8: .4byte gSaveBlock2
_0812BCEC: .4byte gUnknown_02024A60
_0812BCF0: .4byte gUnknown_02024E8C
_0812BCF4: .4byte gTrainerBackPicCoords
_0812BCF8: .4byte gUnknown_02024BE0
_0812BCFC: .4byte gSprites
_0812BD00: .4byte 0x0000fffe
_0812BD04: .4byte sub_80313A0
_0812BD08: .4byte gUnknown_03004330
_0812BD0C: .4byte sub_812B65C
	thumb_func_end sub_812B8B8

	thumb_func_start sub_812B994
sub_812B994: @ 812BD10
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B994

	thumb_func_start sub_812B9A0
sub_812B9A0: @ 812BD1C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B9A0

	thumb_func_start sub_812B9AC
sub_812B9AC: @ 812BD28
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B9AC

	thumb_func_start sub_812B9B8
sub_812B9B8: @ 812BD34
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812B9B8

	thumb_func_start sub_812B9C4
sub_812B9C4: @ 812BD40
	push {r4,r5,lr}
	ldr r1, _0812BD7C @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _0812BD80 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0812BD84 @ =gUnknown_02024A60
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BD88 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BD8C @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BD7C: .4byte 0x02017840
_0812BD80: .4byte gUnknown_02024E6D
_0812BD84: .4byte gUnknown_02024A60
_0812BD88: .4byte gUnknown_03004330
_0812BD8C: .4byte bx_wait_t6
	thumb_func_end sub_812B9C4

	thumb_func_start sub_812BA14
sub_812BA14: @ 812BD90
	push {r4,r5,lr}
	ldr r1, _0812BDD4 @ =gUnknown_02023A60
	ldr r5, _0812BDD8 @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0812BDDC @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _0812BDE0 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _0812BDE4 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BDE8 @ =bx_wait_t6
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BDD4: .4byte gUnknown_02023A60
_0812BDD8: .4byte gUnknown_02024A60
_0812BDDC: .4byte 0x02017840
_0812BDE0: .4byte gUnknown_02024E6D
_0812BDE4: .4byte gUnknown_03004330
_0812BDE8: .4byte bx_wait_t6
	thumb_func_end sub_812BA14

	thumb_func_start sub_812BA70
sub_812BA70: @ 812BDEC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BA70

	thumb_func_start sub_812BA7C
sub_812BA7C: @ 812BDF8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BA7C

	thumb_func_start dp01t_10_6_message
dp01t_10_6_message: @ 812BE04
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0812BE48 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812BE4C @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _0812BE50 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _0812BE54 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _0812BE58 @ =gUnknown_03004210
	ldr r1, _0812BE5C @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0812BE60 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BE64 @ =sub_812B694
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812BE48: .4byte gUnknown_030042A4
_0812BE4C: .4byte gUnknown_030042A0
_0812BE50: .4byte gUnknown_02024A60
_0812BE54: .4byte gUnknown_02023A62
_0812BE58: .4byte gUnknown_03004210
_0812BE5C: .4byte gUnknown_020238CC
_0812BE60: .4byte gUnknown_03004330
_0812BE64: .4byte sub_812B694
	thumb_func_end dp01t_10_6_message

	thumb_func_start dp01t_11_6_message_for_player_only
dp01t_11_6_message_for_player_only: @ 812BE68
	push {lr}
	ldr r0, _0812BE80 @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812BE84
	bl dp01t_10_6_message
	b _0812BE88
	.align 2, 0
_0812BE80: .4byte gUnknown_02024A60
_0812BE84:
	bl dp01_tbl6_exec_completed
_0812BE88:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_6_message_for_player_only

	thumb_func_start sub_812BB10
sub_812BB10: @ 812BE8C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0812BF48 @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0812BF4C @ =gUnknown_030042A0
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _0812BF50 @ =gUnknown_03004210
	movs r5, 0
	strb r2, [r4, 0x6]
	movs r0, 0x1B
	str r0, [sp]
	movs r0, 0x12
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0xF
	bl FillWindowRect_DefaultPalette
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0x24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0x23
	bl FillWindowRect_DefaultPalette
	ldr r1, _0812BF54 @ =gUnknown_03004330
	ldr r0, _0812BF58 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BF5C @ =bx_battle_menu_t6_2
	str r1, [r0]
	ldr r1, _0812BF60 @ =gUnknown_08400D15
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _0812BF64 @ =0x0000ffff
	ldr r3, _0812BF68 @ =0x00002d9f
	str r5, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	movs r4, 0
_0812BF00:
	lsls r0, r4, 24
	lsrs r0, 24
	bl nullsub_8
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812BF00
	ldr r1, _0812BF6C @ =gUnknown_02024E60
	ldr r0, _0812BF58 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	ldr r0, _0812BF70 @ =gUnknown_08400CBB
	bl get_battle_strings_
	ldr r4, _0812BF50 @ =gUnknown_03004210
	ldr r1, _0812BF74 @ =gUnknown_020238CC
	movs r2, 0xDE
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x2
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812BF48: .4byte gUnknown_030042A4
_0812BF4C: .4byte gUnknown_030042A0
_0812BF50: .4byte gUnknown_03004210
_0812BF54: .4byte gUnknown_03004330
_0812BF58: .4byte gUnknown_02024A60
_0812BF5C: .4byte bx_battle_menu_t6_2
_0812BF60: .4byte gUnknown_08400D15
_0812BF64: .4byte 0x0000ffff
_0812BF68: .4byte 0x00002d9f
_0812BF6C: .4byte gUnknown_02024E60
_0812BF70: .4byte gUnknown_08400CBB
_0812BF74: .4byte gUnknown_020238CC
	thumb_func_end sub_812BB10

	thumb_func_start sub_812BBFC
sub_812BBFC: @ 812BF78
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BBFC

	thumb_func_start sub_812BC08
sub_812BC08: @ 812BF84
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC08

	thumb_func_start sub_812BC14
sub_812BC14: @ 812BF90
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0812BFC0 @ =gUnknown_03004330
	ldr r2, _0812BFC4 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812BFC8 @ =sub_812B724
	str r1, [r0]
	ldr r1, _0812BFCC @ =gUnknown_02024E6C
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812BFC0: .4byte gUnknown_03004330
_0812BFC4: .4byte gUnknown_02024A60
_0812BFC8: .4byte sub_812B724
_0812BFCC: .4byte gUnknown_02024E6C
	thumb_func_end sub_812BC14

	thumb_func_start sub_812BC54
sub_812BC54: @ 812BFD0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC54

	thumb_func_start sub_812BC60
sub_812BC60: @ 812BFDC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC60

	thumb_func_start sub_812BC6C
sub_812BC6C: @ 812BFE8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC6C

	thumb_func_start sub_812BC78
sub_812BC78: @ 812BFF4
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BC78

	thumb_func_start sub_812BC84
sub_812BC84: @ 812C000
	push {lr}
	ldr r0, _0812C02C @ =gUnknown_03004340
	ldr r1, _0812C030 @ =gUnknown_02024A60
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0812C034 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812C038 @ =gPlayerParty
	adds r1, r2
	movs r2, 0xB
	bl sub_8045A5C
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812C02C: .4byte gUnknown_03004340
_0812C030: .4byte gUnknown_02024A60
_0812C034: .4byte gUnknown_02024A6A
_0812C038: .4byte gPlayerParty
	thumb_func_end sub_812BC84

	thumb_func_start sub_812BCC0
sub_812BCC0: @ 812C03C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCC0

	thumb_func_start sub_812BCCC
sub_812BCCC: @ 812C048
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCCC

	thumb_func_start sub_812BCD8
sub_812BCD8: @ 812C054
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCD8

	thumb_func_start sub_812BCE4
sub_812BCE4: @ 812C060
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCE4

	thumb_func_start sub_812BCF0
sub_812BCF0: @ 812C06C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCF0

	thumb_func_start sub_812BCFC
sub_812BCFC: @ 812C078
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BCFC

	thumb_func_start sub_812BD08
sub_812BD08: @ 812C084
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD08

	thumb_func_start sub_812BD14
sub_812BD14: @ 812C090
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD14

	thumb_func_start sub_812BD20
sub_812BD20: @ 812C09C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD20

	thumb_func_start sub_812BD2C
sub_812BD2C: @ 812C0A8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD2C

	thumb_func_start sub_812BD38
sub_812BD38: @ 812C0B4
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD38

	thumb_func_start sub_812BD44
sub_812BD44: @ 812C0C0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD44

	thumb_func_start sub_812BD50
sub_812BD50: @ 812C0CC
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD50

	thumb_func_start sub_812BD5C
sub_812BD5C: @ 812C0D8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD5C

	thumb_func_start sub_812BD68
sub_812BD68: @ 812C0E4
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD68

	thumb_func_start sub_812BD74
sub_812BD74: @ 812C0F0
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BD74

	thumb_func_start sub_812BD80
sub_812BD80: @ 812C0FC
	push {r4,lr}
	ldr r4, _0812C138 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _0812C110
	movs r3, 0xC0
_0812C110:
	ldr r2, _0812C13C @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl dp01_tbl6_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C138: .4byte gUnknown_02024A60
_0812C13C: .4byte gUnknown_02023A60
	thumb_func_end sub_812BD80

	thumb_func_start sub_812BDC4
sub_812BDC4: @ 812C140
	push {lr}
	ldr r2, _0812C168 @ =gUnknown_02023A60
	ldr r0, _0812C16C @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812C168: .4byte gUnknown_02023A60
_0812C16C: .4byte gUnknown_02024A60
	thumb_func_end sub_812BDC4

	thumb_func_start sub_812BDF4
sub_812BDF4: @ 812C170
	push {lr}
	ldr r1, _0812C1A0 @ =gUnknown_02024A6A
	ldr r0, _0812C1A4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812C1A8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812C1A0: .4byte gUnknown_02024A6A
_0812C1A4: .4byte gUnknown_02024A60
_0812C1A8: .4byte gPlayerParty
	thumb_func_end sub_812BDF4

	thumb_func_start dp01t_2E_6_battle_intro
dp01t_2E_6_battle_intro: @ 812C1AC
	push {lr}
	ldr r1, _0812C1D4 @ =gUnknown_02023A60
	ldr r0, _0812C1D8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _0812C1DC @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812C1D4: .4byte gUnknown_02023A60
_0812C1D8: .4byte gUnknown_02024A60
_0812C1DC: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_6_battle_intro

	thumb_func_start sub_812BE64
sub_812BE64: @ 812C1E0
	push {r4,r5,lr}
	ldr r5, _0812C21C @ =gUnknown_03004340
	ldr r4, _0812C220 @ =gUnknown_02024A60
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0812C224 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0812C228 @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	bl dp01_tbl6_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812C21C: .4byte gUnknown_03004340
_0812C220: .4byte gUnknown_02024A60
_0812C224: .4byte gUnknown_02024A6A
_0812C228: .4byte gPlayerParty
	thumb_func_end sub_812BE64

	thumb_func_start sub_812BEB0
sub_812BEB0: @ 812C22C
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BEB0

	thumb_func_start sub_812BEBC
sub_812BEBC: @ 812C238
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BEBC

	thumb_func_start sub_812BEC8
sub_812BEC8: @ 812C244
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BEC8

	thumb_func_start sub_812BED4
sub_812BED4: @ 812C250
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BED4

	thumb_func_start sub_812BEE0
sub_812BEE0: @ 812C25C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _0812C294 @ =gUnknown_02023A60
	ldr r6, _0812C298 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _0812C29C
	bl dp01_tbl6_exec_completed
	b _0812C2A8
	.align 2, 0
_0812C294: .4byte gUnknown_02023A60
_0812C298: .4byte gUnknown_02024A60
_0812C29C:
	ldr r0, _0812C2B0 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812C2B4 @ =sub_812B794
	str r0, [r1]
_0812C2A8:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812C2B0: .4byte gUnknown_03004330
_0812C2B4: .4byte sub_812B794
	thumb_func_end sub_812BEE0

	thumb_func_start sub_812BF3C
sub_812BF3C: @ 812C2B8
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BF3C

	thumb_func_start sub_812BF48
sub_812BF48: @ 812C2C4
	push {lr}
	bl dp01_tbl6_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812BF48

	thumb_func_start sub_812BF54
sub_812BF54: @ 812C2D0
	push {r4,lr}
	ldr r2, _0812C314 @ =gUnknown_02024D26
	ldr r1, _0812C318 @ =gUnknown_02023A60
	ldr r4, _0812C31C @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl6_exec_completed
	ldr r0, _0812C320 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _0812C30C
	ldr r0, _0812C324 @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0812C328 @ =sub_812B6AC
	str r0, [r1]
_0812C30C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C314: .4byte gUnknown_02024D26
_0812C318: .4byte gUnknown_02023A60
_0812C31C: .4byte gUnknown_02024A60
_0812C320: .4byte gUnknown_020239F8
_0812C324: .4byte gUnknown_03004330
_0812C328: .4byte sub_812B6AC
	thumb_func_end sub_812BF54

	thumb_func_start nullsub_78
nullsub_78: @ 812C32C
	bx lr
	thumb_func_end nullsub_78

	thumb_func_start SetUpFieldMove_SweetScent
SetUpFieldMove_SweetScent: @ 812C330
	ldr r1, _0812C340 @ =gUnknown_0300485C
	ldr r0, _0812C344 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0812C348 @ =gUnknown_03005CE4
	ldr r0, _0812C34C @ =sub_812BFD4
	str r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0812C340: .4byte gUnknown_0300485C
_0812C344: .4byte sub_808AB90
_0812C348: .4byte gUnknown_03005CE4
_0812C34C: .4byte sub_812BFD4
	thumb_func_end SetUpFieldMove_SweetScent

	thumb_func_start sub_812BFD4
sub_812BFD4: @ 812C350
	push {lr}
	movs r0, 0x33
	bl FieldEffectStart
	ldr r0, _0812C364 @ =gUnknown_0202FF84
	ldr r1, _0812C368 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0812C364: .4byte gUnknown_0202FF84
_0812C368: .4byte gUnknown_03005CE0
	thumb_func_end sub_812BFD4

	thumb_func_start FldEff_SweetScent
FldEff_SweetScent: @ 812C36C
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C390 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0812C394 @ =sub_812C01C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0812C390: .4byte gTasks
_0812C394: .4byte sub_812C01C
	thumb_func_end FldEff_SweetScent

	thumb_func_start sub_812C01C
sub_812C01C: @ 812C398
	push {lr}
	sub sp, 0x4
	movs r0, 0xEC
	bl PlaySE
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C3F4 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x8
	bl BeginNormalPaletteFade
	ldr r0, _0812C3F8 @ =sub_812C084
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C3FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x33
	bl FieldEffectActiveListRemove
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0812C3F4: .4byte gSprites
_0812C3F8: .4byte sub_812C084
_0812C3FC: .4byte gTasks
	thumb_func_end sub_812C01C

	thumb_func_start sub_812C084
sub_812C084: @ 812C400
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0812C444 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0812C48C
	ldr r0, _0812C448 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0x40
	bne _0812C488
	strh r2, [r4, 0x8]
	bl SweetScentWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812C44C
	adds r0, r5, 0
	bl DestroyTask
	b _0812C48C
	.align 2, 0
_0812C444: .4byte gPaletteFade
_0812C448: .4byte gTasks
_0812C44C:
	ldr r0, _0812C480 @ =sub_812C118
	str r0, [r4]
	bl GetPlayerAvatarObjectId
	ldr r2, _0812C484 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	mvns r0, r0
	movs r1, 0x1F
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0x8
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0812C48C
	.align 2, 0
_0812C480: .4byte sub_812C118
_0812C484: .4byte gSprites
_0812C488:
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0812C48C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812C084

	thumb_func_start sub_812C118
sub_812C118: @ 812C494
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812C4B8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812C4B2
	ldr r0, _0812C4BC @ =SweetScentNothingHereScript
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
_0812C4B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C4B8: .4byte gPaletteFade
_0812C4BC: .4byte SweetScentNothingHereScript
	thumb_func_end sub_812C118

	thumb_func_start sub_812C144
sub_812C144: @ 812C4C0
	push {lr}
	adds r2, r0, 0
	ldr r1, _0812C4E4 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r3, [r2, 0x20]
	adds r0, r3
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	movs r3, 0x6
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0812C4E8
	ldrh r0, [r1, 0x4]
	b _0812C4EC
	.align 2, 0
_0812C4E4: .4byte gUnknown_03004B00
_0812C4E8:
	ldrh r0, [r1, 0x4]
	negs r0, r0
_0812C4EC:
	strh r0, [r2, 0x2E]
	ldrh r0, [r1, 0x8]
	strh r0, [r2, 0x30]
	ldr r0, _0812C4FC @ =sub_812C184
	str r0, [r2, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_0812C4FC: .4byte sub_812C184
	thumb_func_end sub_812C144

	thumb_func_start sub_812C184
sub_812C184: @ 812C500
	push {lr}
	adds r3, r0, 0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	ble _0812C540
	ldrh r1, [r3, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x2E]
	adds r1, r0
	strh r1, [r3, 0x32]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	b _0812C546
_0812C540:
	adds r0, r3, 0
	bl move_anim_8072740
_0812C546:
	pop {r0}
	bx r0
	thumb_func_end sub_812C184

	thumb_func_start sub_812C1D0
sub_812C1D0: @ 812C54C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0812C598 @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 8
	movs r0, 0x80
	lsls r0, 12
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 8
	movs r0, 0x80
	lsls r0, 12
	adds r1, r0
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8046234
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812C598: .4byte gUnknown_0202F7C9
	thumb_func_end sub_812C1D0

	thumb_func_start sub_812C220
sub_812C220: @ 812C59C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5A
	strh r0, [r4, 0x2E]
	ldr r0, _0812C5D4 @ =sub_80782D8
	str r0, [r4, 0x1C]
	movs r0, 0x7
	strh r0, [r4, 0x30]
	ldr r1, _0812C5D8 @ =sub_812C268
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _0812C5DC @ =0x04000050
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _0812C5E0 @ =0x04000052
	ldrh r1, [r4, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C5D4: .4byte sub_80782D8
_0812C5D8: .4byte sub_812C268
_0812C5DC: .4byte 0x04000050
_0812C5E0: .4byte 0x04000052
	thumb_func_end sub_812C220

	thumb_func_start sub_812C268
sub_812C268: @ 812C5E4
	push {lr}
	adds r3, r0, 0
	ldr r2, _0812C618 @ =0x04000052
	ldrh r1, [r3, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _0812C612
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812C61C @ =sub_812C2A4
	str r0, [r3, 0x1C]
_0812C612:
	pop {r0}
	bx r0
	.align 2, 0
_0812C618: .4byte 0x04000052
_0812C61C: .4byte sub_812C2A4
	thumb_func_end sub_812C268

	thumb_func_start sub_812C2A4
sub_812C2A4: @ 812C620
	push {lr}
	ldr r1, _0812C634 @ =0x04000050
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_0812C634: .4byte 0x04000050
	thumb_func_end sub_812C2A4

	thumb_func_start sub_812C2BC
sub_812C2BC: @ 812C638
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _0812C6C4 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
	ldrh r0, [r5, 0x20]
	subs r0, r7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r5, 0x22]
	subs r1, r6
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 23
	adds r0, r1
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812C696
	movs r1, 0x80
	lsls r1, 7
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0812C696:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _0812C6C8 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x32]
	strh r6, [r5, 0x36]
	ldr r0, _0812C6CC @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _0812C6D0 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C6C4: .4byte gUnknown_0202F7C9
_0812C6C8: .4byte gUnknown_03004B00
_0812C6CC: .4byte sub_8078B34
_0812C6D0: .4byte move_anim_8072740
	thumb_func_end sub_812C2BC

	thumb_func_start sub_812C358
sub_812C358: @ 812C6D4
	ldr r2, _0812C6F4 @ =0x04000050
	movs r3, 0xFD
	lsls r3, 6
	adds r1, r3, 0
	strh r1, [r2]
	adds r2, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r1, r3, 0
	strh r1, [r2]
	movs r1, 0x4
	strh r1, [r0, 0x2E]
	ldr r1, _0812C6F8 @ =sub_812C380
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0812C6F4: .4byte 0x04000050
_0812C6F8: .4byte sub_812C380
	thumb_func_end sub_812C358

	thumb_func_start sub_812C380
sub_812C380: @ 812C6FC
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0812C71C @ =0x04000052
	ldrh r1, [r4, 0x2E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812C720
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	b _0812C724
	.align 2, 0
_0812C71C: .4byte 0x04000052
_0812C720:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
_0812C724:
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	beq _0812C732
	cmp r0, 0x4
	bne _0812C73A
_0812C732:
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x30]
_0812C73A:
	ldrh r0, [r4, 0x32]
	adds r1, r0, 0x1
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x46
	ble _0812C778
	ldr r0, _0812C780 @ =0x04000050
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812C784 @ =sub_812C40C
	str r0, [r4, 0x1C]
_0812C778:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C780: .4byte 0x04000050
_0812C784: .4byte sub_812C40C
	thumb_func_end sub_812C380

	thumb_func_start sub_812C40C
sub_812C40C: @ 812C788
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0812C7C4
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812C7C4
	ldr r0, _0812C7C8 @ =sub_812C450
	str r0, [r3, 0x1C]
_0812C7C4:
	pop {r0}
	bx r0
	.align 2, 0
_0812C7C8: .4byte sub_812C450
	thumb_func_end sub_812C40C

	thumb_func_start sub_812C450
sub_812C450: @ 812C7CC
	push {lr}
	adds r2, r0, 0
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0x6
	bhi _0812C824
	lsls r0, 2
	ldr r1, _0812C7E4 @ =_0812C7E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812C7E4: .4byte _0812C7E8
	.align 2, 0
_0812C7E8:
	.4byte _0812C804
	.4byte _0812C804
	.4byte _0812C80E
	.4byte _0812C80E
	.4byte _0812C81C
	.4byte _0812C81C
	.4byte _0812C824
_0812C804:
	movs r1, 0
	movs r0, 0x1
	strh r0, [r2, 0x24]
	strh r1, [r2, 0x26]
	b _0812C82C
_0812C80E:
	ldr r0, _0812C818 @ =0x0000ffff
	strh r0, [r2, 0x24]
	movs r0, 0
	b _0812C82A
	.align 2, 0
_0812C818: .4byte 0x0000ffff
_0812C81C:
	movs r0, 0
	strh r0, [r2, 0x24]
	movs r0, 0x1
	b _0812C82A
_0812C824:
	movs r0, 0
	strh r0, [r2, 0x24]
	ldr r0, _0812C86C @ =0x0000ffff
_0812C82A:
	strh r0, [r2, 0x26]
_0812C82C:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0812C83E
	strh r3, [r2, 0x34]
_0812C83E:
	ldrh r0, [r2, 0x36]
	adds r1, r0, 0x1
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _0812C866
	movs r0, 0x10
	strh r0, [r2, 0x2E]
	strh r3, [r2, 0x30]
	ldr r1, _0812C870 @ =0x04000050
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x2E]
	strh r0, [r1]
	ldr r0, _0812C874 @ =sub_812C4FC
	str r0, [r2, 0x1C]
_0812C866:
	pop {r0}
	bx r0
	.align 2, 0
_0812C86C: .4byte 0x0000ffff
_0812C870: .4byte 0x04000050
_0812C874: .4byte sub_812C4FC
	thumb_func_end sub_812C450

	thumb_func_start sub_812C4FC
sub_812C4FC: @ 812C878
	push {r4,lr}
	adds r2, r0, 0
	ldr r4, _0812C8D4 @ =0x04000052
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x1
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812C8A2
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x2E]
	strh r1, [r2, 0x30]
_0812C8A2:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0812C8B6
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_0812C8B6:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _0812C8CC
	ldr r1, _0812C8D8 @ =0x04000050
	movs r0, 0
	strh r0, [r1]
	strh r0, [r4]
	adds r0, r2, 0
	bl move_anim_8072740
_0812C8CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812C8D4: .4byte 0x04000052
_0812C8D8: .4byte 0x04000050
	thumb_func_end sub_812C4FC

	thumb_func_start sub_812C560
sub_812C560: @ 812C8DC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C8F8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0812C8FC @ =sub_812C588
	str r0, [r1]
	ldr r1, _0812C900 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812C8F8: .4byte gTasks
_0812C8FC: .4byte sub_812C588
_0812C900: .4byte gUnknown_0202F7B2
	thumb_func_end sub_812C560

	thumb_func_start sub_812C588
sub_812C588: @ 812C904
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80789BC
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _0812C990 @ =gTasks
	lsls r5, r4, 2
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r7
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812C974
	ldr r0, _0812C994 @ =gPlttBufferFaded
	lsls r2, r6, 4
	adds r1, r2, 0
	adds r1, 0xB
	lsls r1, 1
	adds r1, r0
	ldrh r3, [r1]
	mov r8, r3
	movs r3, 0xA
	mov r9, r7
	adds r7, r5, 0
	mov r12, r0
	adds r5, r2, 0
	lsls r0, r6, 5
	add r0, r12
	adds r2, r0, 0
	adds r2, 0x14
_0812C952:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, 0x2
	subs r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bgt _0812C952
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r12
	movs r1, 0
	mov r2, r8
	strh r2, [r0]
	adds r0, r7, r4
	lsls r0, 3
	add r0, r9
	strh r1, [r0, 0x12]
_0812C974:
	ldr r0, _0812C998 @ =gUnknown_03004B00
	ldrh r1, [r0, 0xE]
	ldr r0, _0812C99C @ =0x0000ffff
	cmp r1, r0
	bne _0812C984
	adds r0, r4, 0
	bl DestroyTask
_0812C984:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812C990: .4byte gTasks
_0812C994: .4byte gPlttBufferFaded
_0812C998: .4byte gUnknown_03004B00
_0812C99C: .4byte 0x0000ffff
	thumb_func_end sub_812C588

	thumb_func_start sub_812C624
sub_812C624: @ 812C9A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812C9BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0812C9C0 @ =sub_812C64C
	str r0, [r1]
	ldr r1, _0812C9C4 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0812C9BC: .4byte gTasks
_0812C9C0: .4byte sub_812C64C
_0812C9C4: .4byte gUnknown_0202F7B2
	thumb_func_end sub_812C624

	thumb_func_start sub_812C64C
sub_812C64C: @ 812C9C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl sub_80789BC
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0812CA88 @ =gTasks
	mov r0, r8
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812CA6A
	ldr r0, _0812CA8C @ =gPlttBufferFaded
	lsls r2, r7, 4
	adds r1, r2, 0
	adds r1, 0xB
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	movs r4, 0xA
	mov r10, r3
	mov r9, r0
	adds r5, r2, 0
	ldr r2, _0812CA90 @ =gPlttBufferUnfaded
	mov r12, r2
	lsls r0, r7, 5
	add r0, r9
	adds r3, r0, 0
	adds r3, 0x14
_0812CA1C:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _0812CA1C
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	adds r1, r5, 0
	adds r1, 0xB
	lsls r1, 1
	add r1, r12
	ldrh r6, [r1]
	movs r4, 0xA
	lsls r0, r7, 5
	add r0, r12
	adds r2, r0, 0
	adds r2, 0x14
_0812CA46:
	ldrh r0, [r2]
	strh r0, [r1]
	subs r2, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _0812CA46
	adds r0, r5, 0x1
	lsls r0, 1
	add r0, r12
	movs r1, 0
	strh r6, [r0]
	mov r0, r10
	add r0, r8
	lsls r0, 3
	ldr r2, _0812CA88 @ =gTasks
	adds r0, r2
	strh r1, [r0, 0x12]
_0812CA6A:
	ldr r0, _0812CA94 @ =gUnknown_03004B00
	ldrh r1, [r0, 0xE]
	ldr r0, _0812CA98 @ =0x0000ffff
	cmp r1, r0
	bne _0812CA7A
	mov r0, r8
	bl DestroyTask
_0812CA7A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812CA88: .4byte gTasks
_0812CA8C: .4byte gPlttBufferFaded
_0812CA90: .4byte gPlttBufferUnfaded
_0812CA94: .4byte gUnknown_03004B00
_0812CA98: .4byte 0x0000ffff
	thumb_func_end sub_812C64C

	thumb_func_start sub_812C720
sub_812C720: @ 812CA9C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _0812CB00 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	mov r5, sp
	adds r5, 0x2
	movs r1, 0
	mov r2, sp
	adds r3, r5, 0
	bl sub_807A3FC
	ldr r0, _0812CB04 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812CAD0
	ldr r1, _0812CB08 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_0812CAD0:
	ldr r1, _0812CB08 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	mov r2, sp
	ldrh r0, [r1, 0x4]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	ldrh r5, [r5]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _0812CB0C @ =0x0000ffce
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _0812CB10 @ =sub_812C798
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812CB00: .4byte gUnknown_0202F7C9
_0812CB04: .4byte gUnknown_0202F7C8
_0812CB08: .4byte gUnknown_03004B00
_0812CB0C: .4byte 0x0000ffce
_0812CB10: .4byte sub_812C798
	thumb_func_end sub_812C720

	thumb_func_start sub_812C798
sub_812C798: @ 812CB14
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _0812CB36
	movs r1, 0
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldr r0, _0812CB3C @ =sub_80782D8
	str r0, [r4, 0x1C]
	ldr r1, _0812CB40 @ =sub_812C7C8
	adds r0, r4, 0
	bl oamt_set_x3A_32
_0812CB36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CB3C: .4byte sub_80782D8
_0812CB40: .4byte sub_812C7C8
	thumb_func_end sub_812C798

	thumb_func_start sub_812C7C8
sub_812C7C8: @ 812CB44
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812CB70
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_0812CB70:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _0812CB84
	adds r0, r3, 0
	bl move_anim_8072740
_0812CB84:
	pop {r0}
	bx r0
	thumb_func_end sub_812C7C8

	thumb_func_start sub_812C80C
sub_812C80C: @ 812CB88
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r5, _0812CBB8 @ =gUnknown_03004B00
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0812CBBC @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _0812CBC0 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812CBB8: .4byte gUnknown_03004B00
_0812CBBC: .4byte sub_8078600
_0812CBC0: .4byte move_anim_8072740
	thumb_func_end sub_812C80C

	thumb_func_start sub_812C848
sub_812C848: @ 812CBC4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CC24
	adds r0, r4, 0
	bl sub_8078650
	ldr r5, _0812CC00 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl sub_807867C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812CC18
	ldr r0, _0812CC04 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812CC08
	ldrh r0, [r5, 0x4]
	b _0812CC1E
	.align 2, 0
_0812CC00: .4byte gUnknown_03004B00
_0812CC04: .4byte gUnknown_0202F7C8
_0812CC08:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r2, 0x6
	ldrsh r0, [r5, r2]
	negs r0, r0
	b _0812CC22
_0812CC18:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	negs r0, r0
_0812CC1E:
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
_0812CC22:
	strh r0, [r4, 0x32]
_0812CC24:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r3, 0xFF
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	strh r1, [r4, 0x24]
	ands r0, r3
	movs r1, 0x5
	bl Sin
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xF0
	bls _0812CC7C
	adds r0, r4, 0
	bl move_anim_8072740
_0812CC7C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812C848

	thumb_func_start sub_812C908
sub_812C908: @ 812CC84
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812CC9A
	adds r0, r2, 0
	bl move_anim_8072740
_0812CC9A:
	pop {r0}
	bx r0
	thumb_func_end sub_812C908

	thumb_func_start sub_812C924
sub_812C924: @ 812CCA0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812CCBC @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812CCC4
	ldr r1, _0812CCC0 @ =gUnknown_03004B00
	movs r0, 0
	b _0812CCC8
	.align 2, 0
_0812CCBC: .4byte gUnknown_0202F7C9
_0812CCC0: .4byte gUnknown_03004B00
_0812CCC4:
	ldr r1, _0812CCD8 @ =gUnknown_03004B00
	movs r0, 0x1
_0812CCC8:
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CCD8: .4byte gUnknown_03004B00
	thumb_func_end sub_812C924

	thumb_func_start sub_812C960
sub_812C960: @ 812CCDC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0812CCF0 @ =gUnknown_0202F7B8
	ldr r0, [r0]
	cmp r0, 0
	ble _0812CCF8
	ldr r1, _0812CCF4 @ =gUnknown_03004B00
	movs r0, 0
	b _0812CCFC
	.align 2, 0
_0812CCF0: .4byte gUnknown_0202F7B8
_0812CCF4: .4byte gUnknown_03004B00
_0812CCF8:
	ldr r1, _0812CD08 @ =gUnknown_03004B00
	movs r0, 0x1
_0812CCFC:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0812CD08: .4byte gUnknown_03004B00
	thumb_func_end sub_812C960

	thumb_func_start sub_812C990
sub_812C990: @ 812CD0C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0812CD68 @ =0x0400004a
	ldr r2, _0812CD6C @ =0x00001f3f
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0812CD70 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812CD74 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r0, _0812CD78 @ =0x04000040
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812CD7C @ =sub_812CA04
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CD68: .4byte 0x0400004a
_0812CD6C: .4byte 0x00001f3f
_0812CD70: .4byte gUnknown_030042C4
_0812CD74: .4byte gUnknown_03004240
_0812CD78: .4byte 0x04000040
_0812CD7C: .4byte sub_812CA04
	thumb_func_end sub_812C990

	thumb_func_start sub_812CA04
sub_812CA04: @ 812CD80
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _0812CE40
	lsls r0, 2
	ldr r1, _0812CD98 @ =_0812CD9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812CD98: .4byte _0812CD9C
	.align 2, 0
_0812CD9C:
	.4byte _0812CDB4
	.4byte _0812CDD2
	.4byte _0812CDF2
	.4byte _0812CDD2
	.4byte _0812CE12
	.4byte _0812CE22
_0812CDB4:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812CE40
	b _0812CE1A
_0812CDD2:
	ldrh r0, [r4, 0x30]
	adds r0, 0x75
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _0812CE40
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0812CE1A
_0812CDF2:
	ldrh r0, [r4, 0x30]
	subs r0, 0x75
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x29
	bne _0812CE40
	movs r0, 0
	strh r0, [r4, 0x32]
	b _0812CE1A
_0812CE12:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_0812CE1A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0812CE40
_0812CE22:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812CE40
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812CE48 @ =sub_812CAD0
	str r0, [r4, 0x1C]
_0812CE40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CE48: .4byte sub_812CAD0
	thumb_func_end sub_812CA04

	thumb_func_start sub_812CAD0
sub_812CAD0: @ 812CE4C
	push {r4,lr}
	ldr r2, _0812CE70 @ =0x0400004a
	ldr r3, _0812CE74 @ =0x00003f3f
	adds r1, r3, 0
	strh r1, [r2]
	movs r3, 0x80
	lsls r3, 19
	ldrh r1, [r3]
	movs r4, 0x80
	lsls r4, 8
	adds r2, r4, 0
	eors r1, r2
	strh r1, [r3]
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812CE70: .4byte 0x0400004a
_0812CE74: .4byte 0x00003f3f
	thumb_func_end sub_812CAD0

	thumb_func_start sub_812CAFC
sub_812CAFC: @ 812CE78
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0812CEEC @ =gUnknown_03004B00
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CEA4
	ldr r4, _0812CEF0 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0812CEA4:
	ldrh r0, [r6]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r3, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x2]
	ldrh r4, [r5, 0x22]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r4, _0812CEF4 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _0812CEF8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812CF00
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldr r0, _0812CEFC @ =0x0000fff4
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _0812CF06
	.align 2, 0
_0812CEEC: .4byte gUnknown_03004B00
_0812CEF0: .4byte gUnknown_0202F7C8
_0812CEF4: .4byte 0x000003ff
_0812CEF8: .4byte 0xfffffc00
_0812CEFC: .4byte 0x0000fff4
_0812CF00:
	movs r0, 0xC
	strh r0, [r5, 0x24]
	ldr r0, _0812CF24 @ =0x0000fffe
_0812CF06:
	strh r0, [r5, 0x30]
	ldr r1, _0812CF28 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	beq _0812CF1A
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
_0812CF1A:
	ldr r0, _0812CF2C @ =sub_812CBB4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812CF24: .4byte 0x0000fffe
_0812CF28: .4byte gUnknown_03004B00
_0812CF2C: .4byte sub_812CBB4
	thumb_func_end sub_812CAFC

	thumb_func_start sub_812CBB4
sub_812CBB4: @ 812CF30
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CF6E
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _0812CF8E
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CF8E
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xDE
	bl PlaySE1WithPanning
	b _0812CF8E
_0812CF6E:
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x30]
	subs r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0812CF80
	negs r0, r0
_0812CF80:
	cmp r0, 0xC
	bne _0812CF8E
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	subs r0, r2, 0x1
	strh r0, [r4, 0x32]
_0812CF8E:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812CF9C
	adds r0, r4, 0
	bl move_anim_8072740
_0812CF9C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812CBB4

	thumb_func_start sub_812CC28
sub_812CC28: @ 812CFA4
	push {lr}
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0xFF
	strh r1, [r0, 0x34]
	bl sub_812CAFC
	pop {r0}
	bx r0
	thumb_func_end sub_812CC28

	thumb_func_start sub_812CC44
sub_812CC44: @ 812CFC0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812CFF6
	ldr r1, _0812D004 @ =0x04000048
	ldr r2, _0812D008 @ =0x00001f3f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0812D00C @ =gUnknown_03004200
	ldr r2, _0812D010 @ =0x000098f0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0812D014 @ =gUnknown_03004244
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _0812D018 @ =0x04000042
	ldr r0, _0812D01C @ =gUnknown_030042C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0812D020 @ =gUnknown_03004240
	ldrh r0, [r0]
	strh r0, [r1]
_0812CFF6:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D004: .4byte 0x04000048
_0812D008: .4byte 0x00001f3f
_0812D00C: .4byte gUnknown_03004200
_0812D010: .4byte 0x000098f0
_0812D014: .4byte gUnknown_03004244
_0812D018: .4byte 0x04000042
_0812D01C: .4byte gUnknown_030042C4
_0812D020: .4byte gUnknown_03004240
	thumb_func_end sub_812CC44

	thumb_func_start sub_812CCA8
sub_812CCA8: @ 812D024
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812D046
	ldr r1, _0812D054 @ =0x04000048
	ldr r2, _0812D058 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812D05C @ =gUnknown_03004200
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812D060 @ =gUnknown_03004244
	strh r1, [r0]
_0812D046:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D054: .4byte 0x04000048
_0812D058: .4byte 0x00003f3f
_0812D05C: .4byte gUnknown_03004200
_0812D060: .4byte gUnknown_03004244
	thumb_func_end sub_812CCA8

	thumb_func_start sub_812CCE8
sub_812CCE8: @ 812D064
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0812D078 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812D080
	ldr r4, _0812D07C @ =gUnknown_0202F7C8
	b _0812D082
	.align 2, 0
_0812D078: .4byte gUnknown_03004B00
_0812D07C: .4byte gUnknown_0202F7C8
_0812D080:
	ldr r4, _0812D0D4 @ =gUnknown_0202F7C9
_0812D082:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x2]
	adds r0, r6
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r2, _0812D0D8 @ =gUnknown_03004B00
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x26]
	movs r3, 0
	lsls r0, 16
	asrs r0, 16
	ldrh r4, [r2, 0x6]
	movs r6, 0x6
	ldrsh r1, [r2, r6]
	cmp r0, r1
	ble _0812D0BA
	movs r3, 0x1
_0812D0BA:
	strh r3, [r5, 0x2E]
	movs r0, 0
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _0812D0DC @ =sub_812CD64
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812D0D4: .4byte gUnknown_0202F7C9
_0812D0D8: .4byte gUnknown_03004B00
_0812D0DC: .4byte sub_812CD64
	thumb_func_end sub_812CCE8

	thumb_func_start sub_812CD64
sub_812CD64: @ 812D0E0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0x30]
	ldr r1, _0812D128 @ =gSineTable
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r1, r0, r3
	strh r1, [r2, 0x26]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0812D12C
	lsls r0, r1, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _0812D13E
	adds r0, r2, 0
	bl move_anim_8072740
	b _0812D13E
	.align 2, 0
_0812D128: .4byte gSineTable
_0812D12C:
	lsls r0, r1, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _0812D13E
	adds r0, r2, 0
	bl move_anim_8072740
_0812D13E:
	pop {r0}
	bx r0
	thumb_func_end sub_812CD64

	thumb_func_start sub_812CDC8
sub_812CDC8: @ 812D144
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0812D164 @ =gTasks
	adds r5, r1, r0
	ldr r0, _0812D168 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812D170
	ldr r4, _0812D16C @ =gUnknown_0202F7C8
	b _0812D172
	.align 2, 0
_0812D164: .4byte gTasks
_0812D168: .4byte gUnknown_03004B00
_0812D16C: .4byte gUnknown_0202F7C8
_0812D170:
	ldr r4, _0812D1B8 @ =gUnknown_0202F7C9
_0812D172:
	ldrb r0, [r4]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0
	adds r1, r0, 0
	adds r1, 0x24
	movs r2, 0
	strh r1, [r5, 0x8]
	strh r1, [r5, 0xA]
	subs r0, 0x21
	strh r0, [r5, 0xC]
	cmp r0, 0
	bge _0812D19C
	strh r2, [r5, 0xC]
_0812D19C:
	ldrh r0, [r5, 0x8]
	strh r0, [r5, 0xE]
	movs r0, 0x8
	strh r0, [r5, 0x10]
	ldr r1, _0812D1BC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x16]
	cmp r7, 0x1
	bne _0812D1C4
	ldr r0, _0812D1C0 @ =gUnknown_030042C0
	b _0812D1C6
	.align 2, 0
_0812D1B8: .4byte gUnknown_0202F7C9
_0812D1BC: .4byte gUnknown_03004B00
_0812D1C0: .4byte gUnknown_030042C0
_0812D1C4:
	ldr r0, _0812D1E4 @ =gUnknown_03004288
_0812D1C6:
	ldrh r2, [r0]
	strh r2, [r5, 0x18]
	adds r3, r2, 0
	adds r3, 0xF0
	strh r3, [r5, 0x1A]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x1C]
	movs r4, 0x4
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _0812D1E8
	strh r3, [r5, 0x1E]
	ldrh r3, [r5, 0x18]
	b _0812D1EC
	.align 2, 0
_0812D1E4: .4byte gUnknown_03004288
_0812D1E8:
	strh r2, [r5, 0x1E]
	ldrh r3, [r5, 0x1A]
_0812D1EC:
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r1, [r5, 0xC]
	lsls r2, r1, 16
	asrs r1, r2, 16
	movs r6, 0xE
	ldrsh r0, [r5, r6]
	cmp r1, r0
	bgt _0812D222
	ldr r4, _0812D22C @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r0, r4
	mov r12, r0
_0812D208:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	add r1, r12
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r6, 0xE
	ldrsh r0, [r5, r6]
	cmp r1, r0
	ble _0812D208
_0812D222:
	cmp r7, 0x1
	bne _0812D234
	ldr r0, _0812D230 @ =0x04000014
	b _0812D236
	.align 2, 0
_0812D22C: .4byte gUnknown_03004DE0
_0812D230: .4byte 0x04000014
_0812D234:
	ldr r0, _0812D260 @ =0x04000018
_0812D236:
	str r0, [sp]
	ldr r0, _0812D264 @ =0xa2600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _0812D268 @ =sub_812CEF0
	str r0, [r5]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812D260: .4byte 0x04000018
_0812D264: .4byte 0xa2600001
_0812D268: .4byte sub_812CEF0
	thumb_func_end sub_812CDC8

	thumb_func_start sub_812CEF0
sub_812CEF0: @ 812D26C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0812D2BC @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0812D294
	strh r2, [r4, 0x8]
_0812D294:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0812D2C0
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _0812D2C4
	strh r2, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0x26]
	b _0812D2C4
	.align 2, 0
_0812D2BC: .4byte gTasks
_0812D2C0:
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_0812D2C4:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812D2F0
	movs r0, 0
	strh r0, [r4, 0x14]
	movs r1, 0
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0812D2E2
	movs r1, 0x1
_0812D2E2:
	strh r1, [r4, 0x16]
	cmp r1, 0
	beq _0812D2EC
	ldrh r0, [r4, 0x18]
	b _0812D2EE
_0812D2EC:
	ldrh r0, [r4, 0x1A]
_0812D2EE:
	strh r0, [r4, 0x20]
_0812D2F0:
	ldrh r1, [r4, 0x8]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _0812D324
	ldr r5, _0812D37C @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_0812D306:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x20]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x20]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0812D306
_0812D324:
	ldrh r1, [r4, 0xA]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _0812D358
	ldr r5, _0812D37C @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_0812D33A:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1E]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1E]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0812D33A
_0812D358:
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0812D374
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812D36E
	ldr r1, _0812D380 @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_0812D36E:
	adds r0, r7, 0
	bl move_anim_task_del
_0812D374:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812D37C: .4byte gUnknown_03004DE0
_0812D380: .4byte gUnknown_03004DC0
	thumb_func_end sub_812CEF0

	thumb_func_start sub_812D008
sub_812D008: @ 812D384
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812D3D8 @ =gTasks
	adds r4, r0
	movs r5, 0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r6, _0812D3DC @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xE]
	movs r0, 0x20
	strh r0, [r4, 0x10]
	ldr r0, _0812D3E0 @ =0x0000ffec
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _0812D3E4 @ =sub_812D06C
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812D3D8: .4byte gTasks
_0812D3DC: .4byte gUnknown_0202F7C8
_0812D3E0: .4byte 0x0000ffec
_0812D3E4: .4byte sub_812D06C
	thumb_func_end sub_812D008

	thumb_func_start sub_812D06C
sub_812D06C: @ 812D3E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0812D414 @ =gTasks
	adds r6, r0, r1
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _0812D408
	b _0812D5C2
_0812D408:
	lsls r0, 2
	ldr r1, _0812D418 @ =_0812D41C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812D414: .4byte gTasks
_0812D418: .4byte _0812D41C
	.align 2, 0
_0812D41C:
	.4byte _0812D434
	.4byte _0812D4F4
	.4byte _0812D522
	.4byte _0812D536
	.4byte _0812D54C
	.4byte _0812D5B4
_0812D434:
	movs r0, 0xC
	ldrsh r2, [r6, r0]
	ldrh r1, [r6, 0xA]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812D44A
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	subs r0, r2, r0
	b _0812D450
_0812D44A:
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	adds r0, r2, r0
_0812D450:
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r2, [r6, 0x12]
	ldrh r0, [r6, 0xE]
	adds r2, r0
	ldr r0, _0812D4E4 @ =gBattleAnimSpriteTemplate_83D7220
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldrb r4, [r6, 0xA]
	movs r3, 0x6
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xBA
	bl PlaySE12WithPanning
	cmp r4, 0x40
	beq _0812D4B4
	ldr r5, _0812D4E8 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r3, r1, r5
	ldrh r0, [r6, 0xA]
	movs r2, 0x1
	ands r2, r0
	adds r3, 0x3F
	ldrb r4, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r4
	orrs r0, r2
	strb r0, [r3]
	adds r5, 0x1C
	adds r1, r5
	ldr r0, _0812D4EC @ =SpriteCallbackDummy
	str r0, [r1]
_0812D4B4:
	ldrh r1, [r6, 0xA]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0812D4CC
	ldrh r0, [r6, 0x10]
	subs r0, 0x6
	strh r0, [r6, 0x10]
	ldrh r0, [r6, 0x12]
	subs r0, 0x6
	strh r0, [r6, 0x12]
_0812D4CC:
	ldrh r1, [r6, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D4F0 @ =gUnknown_08402400
	adds r0, r6, 0
	bl sub_80798F4
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r6, 0x8]
	b _0812D5C2
	.align 2, 0
_0812D4E4: .4byte gBattleAnimSpriteTemplate_83D7220
_0812D4E8: .4byte gSprites
_0812D4EC: .4byte SpriteCallbackDummy
_0812D4F0: .4byte gUnknown_08402400
_0812D4F4:
	adds r0, r6, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0812D5C2
	movs r2, 0xA
	ldrsh r1, [r6, r2]
	cmp r1, 0x6
	bne _0812D514
	movs r0, 0x8
	strh r0, [r6, 0x14]
	movs r0, 0x3
	strh r0, [r6, 0x8]
	b _0812D5C2
_0812D514:
	cmp r1, 0x2
	bgt _0812D51A
	movs r0, 0xA
_0812D51A:
	strh r0, [r6, 0x14]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	b _0812D5C2
_0812D522:
	ldrh r0, [r6, 0x14]
	movs r2, 0x14
	ldrsh r1, [r6, r2]
	cmp r1, 0
	beq _0812D532
	subs r0, 0x1
	strh r0, [r6, 0x14]
	b _0812D5C2
_0812D532:
	strh r1, [r6, 0x8]
	b _0812D5C2
_0812D536:
	ldrh r1, [r6, 0x14]
	movs r2, 0x14
	ldrsh r0, [r6, r2]
	cmp r0, 0
	beq _0812D546
	subs r0, r1, 0x1
	strh r0, [r6, 0x14]
	b _0812D5C2
_0812D546:
	movs r0, 0x4
	strh r0, [r6, 0x8]
	b _0812D5C2
_0812D54C:
	movs r5, 0
	movs r7, 0
	ldr r3, _0812D5A8 @ =gSprites
	movs r0, 0x1C
	adds r0, r3
	mov r8, r0
_0812D558:
	lsls r0, r5, 4
	adds r0, r5
	lsls r4, r0, 2
	adds r0, r3, 0
	adds r0, 0x14
	adds r0, r4, r0
	ldr r1, [r0]
	ldr r0, _0812D5AC @ =gBattleAnimSpriteTemplate_83D7220
	cmp r1, r0
	bne _0812D594
	adds r0, r4, r3
	strh r2, [r0, 0x2E]
	movs r1, 0x6
	strh r1, [r0, 0x30]
	movs r1, 0x2
	str r2, [sp]
	str r3, [sp, 0x4]
	bl StartSpriteAnim
	mov r0, r8
	adds r1, r4, r0
	ldr r0, _0812D5B0 @ =sub_812D254
	str r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	cmp r7, 0x6
	beq _0812D59E
_0812D594:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3F
	bls _0812D558
_0812D59E:
	strh r7, [r6, 0x14]
	movs r0, 0x5
	strh r0, [r6, 0x8]
	b _0812D5C2
	.align 2, 0
_0812D5A8: .4byte gSprites
_0812D5AC: .4byte gBattleAnimSpriteTemplate_83D7220
_0812D5B0: .4byte sub_812D254
_0812D5B4:
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0812D5C2
	adds r0, r2, 0
	bl move_anim_task_del
_0812D5C2:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812D06C

	thumb_func_start sub_812D254
sub_812D254: @ 812D5D0
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812D604
	ldr r3, _0812D60C @ =gTasks
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_0812D604:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D60C: .4byte gTasks
	thumb_func_end sub_812D254

	thumb_func_start sub_812D294
sub_812D294: @ 812D610
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812D624
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
_0812D624:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _0812D656
	ldrh r0, [r5, 0x2E]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0812D648
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _0812D654
_0812D648:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_0812D654:
	strb r0, [r2]
_0812D656:
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1E
	ble _0812D66C
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812D66C:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x3D
	bne _0812D6B8
	ldr r1, _0812D6C0 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldrh r0, [r5, 0x24]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x24]
	strh r1, [r5, 0x26]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _0812D6C4 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _0812D6C8 @ =sub_8078B34
	str r0, [r5, 0x1C]
_0812D6B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D6C0: .4byte move_anim_8072740
_0812D6C4: .4byte gUnknown_0202F7C9
_0812D6C8: .4byte sub_8078B34
	thumb_func_end sub_812D294

	thumb_func_start sub_812D350
sub_812D350: @ 812D6CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812D6EC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812D6F0
	cmp r0, 0x1
	beq _0812D710
	b _0812D722
	.align 2, 0
_0812D6EC: .4byte gTasks
_0812D6F0:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812D70C @ =gUnknown_084024B0
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812D722
	.align 2, 0
_0812D70C: .4byte gUnknown_084024B0
_0812D710:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812D722
	adds r0, r5, 0
	bl move_anim_task_del
_0812D722:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D350

	thumb_func_start sub_812D3AC
sub_812D3AC: @ 812D728
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0812D788
	cmp r0, 0x1
	bgt _0812D748
	cmp r0, 0
	beq _0812D752
	b _0812D82A
_0812D748:
	cmp r0, 0x2
	beq _0812D7B8
	cmp r0, 0x3
	beq _0812D80C
	b _0812D82A
_0812D752:
	ldr r4, _0812D784 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r6, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x32]
	b _0812D800
	.align 2, 0
_0812D784: .4byte gUnknown_0202F7C8
_0812D788:
	ldrh r0, [r5, 0x30]
	adds r0, 0x60
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	subs r0, 0x1A
	strh r0, [r5, 0x32]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0812D7B8
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0812D7B8:
	ldrh r0, [r5, 0x30]
	adds r0, 0x60
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x30
	strh r0, [r5, 0x32]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _0812D82A
	movs r0, 0
	strh r0, [r5, 0x34]
	ldr r1, _0812D808 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, 0
	bl sub_8078F40
_0812D800:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _0812D82A
	.align 2, 0
_0812D808: .4byte gSprites
_0812D80C:
	ldrh r0, [r5, 0x26]
	subs r0, 0x6
	strh r0, [r5, 0x26]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _0812D82A
	adds r0, r5, 0
	bl move_anim_8072740
_0812D82A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812D3AC

	thumb_func_start sub_812D4B4
sub_812D4B4: @ 812D830
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812D848 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812D850
	ldr r0, _0812D84C @ =0x0000fff0
	b _0812D854
	.align 2, 0
_0812D848: .4byte gUnknown_0202F7C8
_0812D84C: .4byte 0x0000fff0
_0812D850:
	movs r0, 0x80
	lsls r0, 1
_0812D854:
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x22]
	ldr r0, _0812D864 @ =sub_812D4EC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D864: .4byte sub_812D4EC
	thumb_func_end sub_812D4B4

	thumb_func_start sub_812D4EC
sub_812D4EC: @ 812D868
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x48
	strh r0, [r4, 0x2E]
	ldr r0, _0812D888 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812D88C
	ldrh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	b _0812D894
	.align 2, 0
_0812D888: .4byte gUnknown_0202F7C8
_0812D88C:
	ldrh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
_0812D894:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x10
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r5, r0, r1
	strh r5, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _0812D8E0
	ldr r0, _0812D900 @ =gSpriteTemplate_8402500
	ldrh r1, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x22]
	adds r2, r5
	lsls r2, 16
	asrs r2, 16
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSpriteAndAnimate
_0812D8E0:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bls _0812D8FA
	adds r0, r4, 0
	bl move_anim_8072740
_0812D8FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812D900: .4byte gSpriteTemplate_8402500
	thumb_func_end sub_812D4EC

	thumb_func_start sub_812D588
sub_812D588: @ 812D904
	push {r4,lr}
	adds r4, r0, 0
	bl Random
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0812D91E
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x4
	b _0812D926
_0812D91E:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x5
_0812D926:
	ldr r3, _0812D958 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0812D95C @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	movs r1, 0x7
	ands r0, r1
	adds r1, r0, 0
	cmp r1, 0x3
	ble _0812D948
	negs r0, r1
	lsls r0, 24
	lsrs r0, 24
_0812D948:
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _0812D960 @ =sub_812D5E8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812D958: .4byte 0x000003ff
_0812D95C: .4byte 0xfffffc00
_0812D960: .4byte sub_812D5E8
	thumb_func_end sub_812D588

	thumb_func_start sub_812D5E8
sub_812D5E8: @ 812D964
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	bgt _0812D9A6
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0812D9DA
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	b _0812D9D8
_0812D9A6:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _0812D9BC
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812D9BC:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x3
	bne _0812D9D4
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812D9EC @ =0x0000ffff
	strh r0, [r3, 0x30]
_0812D9D4:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
_0812D9D8:
	strh r0, [r3, 0x30]
_0812D9DA:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x3C
	ble _0812D9E8
	adds r0, r3, 0
	bl DestroySprite
_0812D9E8:
	pop {r0}
	bx r0
	.align 2, 0
_0812D9EC: .4byte 0x0000ffff
	thumb_func_end sub_812D5E8

	thumb_func_start sub_812D674
sub_812D674: @ 812D9F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812DA28 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812DA30
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812DA2C @ =gUnknown_08402518
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812DA42
	.align 2, 0
_0812DA28: .4byte gTasks
_0812DA2C: .4byte gUnknown_08402518
_0812DA30:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812DA42
	adds r0, r5, 0
	bl move_anim_task_del
_0812DA42:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D674

	thumb_func_start sub_812D6CC
sub_812D6CC: @ 812DA48
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812DA80 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812DA88
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812DA84 @ =gUnknown_08402540
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812DA9A
	.align 2, 0
_0812DA80: .4byte gTasks
_0812DA84: .4byte gUnknown_08402540
_0812DA88:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812DA9A
	adds r0, r5, 0
	bl move_anim_task_del
_0812DA9A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D6CC

	thumb_func_start sub_812D724
sub_812D724: @ 812DAA0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0812DAB2
	cmp r0, 0x1
	beq _0812DADC
	b _0812DB04
_0812DAB2:
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	movs r0, 0x90
	lsls r0, 4
	strh r0, [r4, 0x30]
	ldr r0, _0812DAD8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0812DB04
	.align 2, 0
_0812DAD8: .4byte gUnknown_0202F7C8
_0812DADC:
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	subs r2, 0x60
	strh r2, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0812DB04
	adds r0, r4, 0
	bl move_anim_8072740
_0812DB04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812D724

	thumb_func_start sub_812D790
sub_812D790: @ 812DB0C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812DB44 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812DB4C
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812DB48 @ =gUnknown_08402590
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812DB5E
	.align 2, 0
_0812DB44: .4byte gTasks
_0812DB48: .4byte gUnknown_08402590
_0812DB4C:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812DB5E
	adds r0, r5, 0
	bl move_anim_task_del
_0812DB5E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812D790

	thumb_func_start sub_812D7E8
sub_812D7E8: @ 812DB64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0812DB94 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _0812DB8A
	b _0812DE76
_0812DB8A:
	lsls r0, 2
	ldr r1, _0812DB98 @ =_0812DB9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812DB94: .4byte gTasks
_0812DB98: .4byte _0812DB9C
	.align 2, 0
_0812DB9C:
	.4byte _0812DBB0
	.4byte _0812DC04
	.4byte _0812DC40
	.4byte _0812DDC4
	.4byte _0812DE00
_0812DBB0:
	ldr r1, _0812DBCC @ =0x0400004c
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0812DBD0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DBD8
	ldr r0, _0812DBD4 @ =0x0400000a
	b _0812DBDA
	.align 2, 0
_0812DBCC: .4byte 0x0400004c
_0812DBD0: .4byte gUnknown_0202F7C8
_0812DBD4: .4byte 0x0400000a
_0812DBD8:
	ldr r0, _0812DBF8 @ =0x0400000c
_0812DBDA:
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _0812DBFC @ =gTasks
	mov r6, r8
	lsls r1, r6, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812DC00 @ =gUnknown_03004B00
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	b _0812DDA6
	.align 2, 0
_0812DBF8: .4byte 0x0400000c
_0812DBFC: .4byte gTasks
_0812DC00: .4byte gUnknown_03004B00
_0812DC04:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _0812DC1E
	b _0812DE76
_0812DC1E:
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xA]
	ldr r1, _0812DC3C @ =0x0400004c
	lsls r0, r2, 4
	orrs r0, r2
	strh r0, [r1]
	cmp r2, 0xF
	beq _0812DC38
	b _0812DE76
_0812DC38:
	b _0812DDF4
	.align 2, 0
_0812DC3C: .4byte 0x0400004c
_0812DC40:
	ldr r5, _0812DC70 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	ldr r1, _0812DC74 @ =gUnknown_0202F7C9
	ldrb r1, [r1]
	mov r2, r8
	lsls r4, r2, 2
	adds r2, r4, r2
	lsls r2, 3
	adds r2, r3
	ldrb r2, [r2, 0x1C]
	bl sub_8031FC4
	ldrb r1, [r5]
	mov r0, sp
	bl sub_8078954
	bl sub_8076BE0
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	beq _0812DC78
	movs r1, 0
	b _0812DC82
	.align 2, 0
_0812DC70: .4byte gUnknown_0202F7C8
_0812DC74: .4byte gUnknown_0202F7C9
_0812DC78:
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r1, r0, 24
_0812DC82:
	ldr r0, _0812DD48 @ =gUnknown_081FAF4C
	lsls r1, 2
	adds r1, r0
	ldr r2, _0812DD4C @ =gUnknown_02024E84
	ldr r0, _0812DD50 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 11
	ldr r1, [r1]
	adds r1, r0
	ldr r2, [sp]
	ldr r0, _0812DD54 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0812DD58 @ =0x84000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812DD9C
	ldr r5, _0812DD5C @ =0x02019348
	ldrh r0, [r5]
	bl sub_80AEB1C
	adds r4, r0, 0
	ldrh r0, [r5, 0x2]
	bl sub_80AEB1C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0812DD1E
	ldr r6, [sp, 0x4]
	movs r5, 0
	movs r0, 0x7
	mov r12, r0
	movs r7, 0
_0812DCD2:
	movs r4, 0
	adds r3, r7, r6
	mov r1, r12
	lsls r0, r1, 1
	adds r2, r0, r6
_0812DCDC:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, 0x2
	subs r2, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812DCDC
	movs r2, 0x20
	add r12, r2
	adds r7, 0x40
	adds r5, 0x1
	cmp r5, 0x7
	ble _0812DCD2
	movs r5, 0
	movs r0, 0x80
	lsls r0, 3
	adds r3, r0, 0
_0812DD02:
	adds r2, r5, 0x1
	lsls r0, r5, 6
	adds r1, r0, r6
	movs r4, 0x7
_0812DD0A:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _0812DD0A
	adds r5, r2, 0
	cmp r5, 0x7
	ble _0812DD02
_0812DD1E:
	ldr r0, _0812DD5C @ =0x02019348
	ldrh r0, [r0, 0x2]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _0812DD6C
	ldr r3, _0812DD60 @ =gSprites
	ldr r4, _0812DD64 @ =gUnknown_02024BE0
	ldr r2, _0812DD50 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0812DD68 @ =gSpriteAffineAnimTable_81E7C18
	b _0812DD86
	.align 2, 0
_0812DD48: .4byte gUnknown_081FAF4C
_0812DD4C: .4byte gUnknown_02024E84
_0812DD50: .4byte gUnknown_0202F7C8
_0812DD54: .4byte 0x040000d4
_0812DD58: .4byte 0x84000200
_0812DD5C: .4byte 0x02019348
_0812DD60: .4byte gSprites
_0812DD64: .4byte gUnknown_02024BE0
_0812DD68: .4byte gSpriteAffineAnimTable_81E7C18
_0812DD6C:
	ldr r3, _0812DDB0 @ =gSprites
	ldr r4, _0812DDB4 @ =gUnknown_02024BE0
	ldr r2, _0812DDB8 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0812DDBC @ =gSpriteAffineAnimTable_81E7BEC
_0812DD86:
	str r1, [r0]
	ldrb r0, [r2]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_0812DD9C:
	ldr r0, _0812DDC0 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
_0812DDA6:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0812DE76
	.align 2, 0
_0812DDB0: .4byte gSprites
_0812DDB4: .4byte gUnknown_02024BE0
_0812DDB8: .4byte gUnknown_0202F7C8
_0812DDBC: .4byte gSpriteAffineAnimTable_81E7BEC
_0812DDC0: .4byte gTasks
_0812DDC4:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812DE76
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xA]
	ldr r1, _0812DDFC @ =0x0400004c
	lsls r0, r2, 4
	orrs r0, r2
	strh r0, [r1]
	cmp r2, 0
	bne _0812DE76
_0812DDF4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812DE76
	.align 2, 0
_0812DDFC: .4byte 0x0400004c
_0812DE00:
	ldr r1, _0812DE1C @ =0x0400004c
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0812DE20 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DE28
	ldr r2, _0812DE24 @ =0x0400000a
	b _0812DE2A
	.align 2, 0
_0812DE1C: .4byte 0x0400004c
_0812DE20: .4byte gUnknown_0202F7C8
_0812DE24: .4byte 0x0400000a
_0812DE28:
	ldr r2, _0812DE84 @ =0x0400000c
_0812DE2A:
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812DE70
	ldr r4, _0812DE88 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812DE70
	ldr r0, _0812DE8C @ =gTasks
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r6, 0x1C
	ldrsh r0, [r1, r6]
	cmp r0, 0
	bne _0812DE70
	ldrb r0, [r4]
	lsls r1, r0, 2
	ldr r2, _0812DE90 @ =0x02017800
	adds r1, r2
	ldrh r1, [r1, 0x2]
	bl sub_8032984
_0812DE70:
	mov r0, r8
	bl move_anim_task_del
_0812DE76:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812DE84: .4byte 0x0400000c
_0812DE88: .4byte gUnknown_0202F7C8
_0812DE8C: .4byte gTasks
_0812DE90: .4byte 0x02017800
	thumb_func_end sub_812D7E8

	thumb_func_start c3_80DFBE4
c3_80DFBE4: @ 812DE94
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0812DEC4 @ =gUnknown_03004B00
	ldr r3, _0812DEC8 @ =gSprites
	ldr r2, _0812DECC @ =gUnknown_02024BE0
	ldr r1, _0812DED0 @ =gUnknown_0202F7C8
	ldrb r1, [r1]
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x3E
	ldrb r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r4, 0xE]
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DEC4: .4byte gUnknown_03004B00
_0812DEC8: .4byte gSprites
_0812DECC: .4byte gUnknown_02024BE0
_0812DED0: .4byte gUnknown_0202F7C8
	thumb_func_end c3_80DFBE4

	thumb_func_start sub_812DB58
sub_812DB58: @ 812DED4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0812DEF8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	ldr r1, _0812DEFC @ =gUnknown_0202F7C9
	ldrb r1, [r1]
	movs r2, 0x1
	bl sub_8031FC4
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812DEF8: .4byte gUnknown_0202F7C8
_0812DEFC: .4byte gUnknown_0202F7C9
	thumb_func_end sub_812DB58

	thumb_func_start sub_812DB84
sub_812DB84: @ 812DF00
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _0812DF30 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _0812DF24
	b _0812E1FC
_0812DF24:
	lsls r0, 2
	ldr r1, _0812DF34 @ =_0812DF38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812DF30: .4byte gTasks
_0812DF34: .4byte _0812DF38
	.align 2, 0
_0812DF38:
	.4byte _0812DF4C
	.4byte _0812E078
	.4byte _0812E0C8
	.4byte _0812E132
	.4byte _0812E166
_0812DF4C:
	ldr r1, _0812DFEC @ =0x04000050
	ldr r4, _0812DFF0 @ =0x00003f42
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0812DFF4 @ =0x0400000a
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812DF8E
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_0812DF8E:
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _0812DFF8 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0812DFFC @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0812E000 @ =gUnknown_08D2AA98
	bl LZDecompressVram
	ldr r0, _0812E004 @ =gUnknown_08D2A9E0
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0812E008 @ =gUnknown_08D2AA80
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812E018
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
	ldr r1, _0812E00C @ =gUnknown_030042C0
	ldr r2, _0812E010 @ =0x0000ffc8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812E014 @ =gUnknown_030041B4
	strh r4, [r0]
	b _0812E04A
	.align 2, 0
_0812DFEC: .4byte 0x04000050
_0812DFF0: .4byte 0x00003f42
_0812DFF4: .4byte 0x0400000a
_0812DFF8: .4byte 0x040000d4
_0812DFFC: .4byte 0x85000400
_0812E000: .4byte gUnknown_08D2AA98
_0812E004: .4byte gUnknown_08D2A9E0
_0812E008: .4byte gUnknown_08D2AA80
_0812E00C: .4byte gUnknown_030042C0
_0812E010: .4byte 0x0000ffc8
_0812E014: .4byte gUnknown_030041B4
_0812E018:
	ldr r0, _0812E030 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812E03C
	ldr r1, _0812E034 @ =gUnknown_030042C0
	ldr r4, _0812E038 @ =0x0000ff79
	adds r0, r4, 0
	b _0812E042
	.align 2, 0
_0812E030: .4byte gUnknown_0202F7C8
_0812E034: .4byte gUnknown_030042C0
_0812E038: .4byte 0x0000ff79
_0812E03C:
	ldr r1, _0812E068 @ =gUnknown_030042C0
	ldr r2, _0812E06C @ =0x0000fff6
	adds r0, r2, 0
_0812E042:
	strh r0, [r1]
	ldr r1, _0812E070 @ =gUnknown_030041B4
	movs r0, 0
	strh r0, [r1]
_0812E04A:
	ldr r0, _0812E074 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812E068 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _0812E070 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	b _0812E14E
	.align 2, 0
_0812E068: .4byte gUnknown_030042C0
_0812E06C: .4byte 0x0000fff6
_0812E070: .4byte gUnknown_030041B4
_0812E074: .4byte gTasks
_0812E078:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x10]
	adds r1, r0, 0x1
	strh r1, [r3, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _0812E08E
	b _0812E1FC
_0812E08E:
	movs r0, 0
	strh r0, [r3, 0x10]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _0812E0A4
	movs r0, 0xC
	strh r0, [r3, 0xA]
_0812E0A4:
	ldr r2, _0812E0C4 @ =0x04000052
	ldrh r1, [r3, 0xA]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	cmp r0, 0xC
	beq _0812E0BC
	b _0812E1FC
_0812E0BC:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _0812E1FC
	.align 2, 0
_0812E0C4: .4byte 0x04000052
_0812E0C8:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0812E0E0
	movs r0, 0
	strh r0, [r3, 0xA]
_0812E0E0:
	ldr r2, _0812E120 @ =0x04000052
	ldrh r1, [r3, 0xA]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0812E0F8
	b _0812E1FC
_0812E0F8:
	ldr r2, _0812E124 @ =gUnknown_030042C0
	ldr r1, _0812E128 @ =gUnknown_084025C0
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r3, 0x1C]
	adds r0, r1
	strh r0, [r2]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812E12C
	strh r0, [r3, 0x8]
	b _0812E1FC
	.align 2, 0
_0812E120: .4byte 0x04000052
_0812E124: .4byte gUnknown_030042C0
_0812E128: .4byte gUnknown_084025C0
_0812E12C:
	movs r0, 0x3
	strh r0, [r3, 0x8]
	b _0812E1FC
_0812E132:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0812E1FC
	movs r0, 0
	strh r0, [r1, 0xE]
	movs r0, 0x1
_0812E14E:
	strh r0, [r1, 0x8]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xE4
	bl PlaySE12WithPanning
	b _0812E1FC
_0812E166:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0xC
	movs r6, 0
	ldr r1, _0812E20C @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _0812E210 @ =0x85000400
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_0812E188:
	str r6, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0812E188
	str r6, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r0, _0812E20C @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0812E214 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812E1D6
	ldr r2, _0812E218 @ =0x0400000a
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812E1D6:
	ldr r2, _0812E218 @ =0x0400000a
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812E21C @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r0, _0812E220 @ =gUnknown_030041B4
	strh r4, [r0]
	ldr r0, _0812E224 @ =0x04000050
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, r7, 0
	bl move_anim_task_del
_0812E1FC:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812E20C: .4byte 0x040000d4
_0812E210: .4byte 0x85000400
_0812E214: .4byte 0x85000200
_0812E218: .4byte 0x0400000a
_0812E21C: .4byte gUnknown_030042C0
_0812E220: .4byte gUnknown_030041B4
_0812E224: .4byte 0x04000050
	thumb_func_end sub_812DB84

	thumb_func_start sub_812DEAC
sub_812DEAC: @ 812E228
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	bl Random
	lsls r0, 16
	movs r1, 0xFC
	lsls r1, 14
	ands r1, r0
	lsrs r5, r1, 16
	adds r1, r5, 0
	cmp r1, 0x1F
	ble _0812E252
	movs r0, 0x20
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_0812E252:
	ldr r4, _0812E34C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5
	strh r0, [r7, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r7, 0x22]
	ldr r1, _0812E350 @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r7, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r7, 0x32]
	ldr r4, _0812E354 @ =gBattleAnimSpriteTemplate_84025EC
	movs r0, 0x20
	ldrsh r1, [r7, r0]
	movs r0, 0x22
	ldrsh r2, [r7, r0]
	adds r5, r7, 0
	adds r5, 0x43
	ldrb r3, [r5]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl CreateSprite
	mov r9, r0
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0x20
	ldrsh r1, [r7, r0]
	movs r0, 0x22
	ldrsh r2, [r7, r0]
	ldrb r3, [r5]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	bl CreateSprite
	mov r8, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r0, r9
	lsls r2, r0, 4
	add r2, r9
	lsls r2, 2
	ldr r1, _0812E358 @ =gSprites
	mov r10, r1
	adds r5, r2, r1
	adds r0, r5, 0
	movs r1, 0x1
	str r2, [sp]
	bl StartSpriteAnim
	mov r0, r8
	lsls r6, r0, 4
	add r6, r8
	lsls r6, 2
	mov r1, r10
	adds r4, r6, r1
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r1, _0812E350 @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x32]
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	ldr r0, _0812E35C @ =0x0000ffff
	strh r0, [r5, 0x3C]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r4, 0x3C]
	adds r5, 0x3E
	ldrb r0, [r5]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x1C
	add r10, r0
	ldr r2, [sp]
	add r2, r10
	ldr r0, _0812E360 @ =sub_812E0F8
	str r0, [r2]
	add r6, r10
	str r0, [r6]
	mov r1, r9
	strh r1, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	ldr r0, _0812E364 @ =sub_812DFEC
	str r0, [r7, 0x1C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812E34C: .4byte gUnknown_0202F7C8
_0812E350: .4byte gUnknown_03004B00
_0812E354: .4byte gBattleAnimSpriteTemplate_84025EC
_0812E358: .4byte gSprites
_0812E35C: .4byte 0x0000ffff
_0812E360: .4byte sub_812E0F8
_0812E364: .4byte sub_812DFEC
	thumb_func_end sub_812DEAC

	thumb_func_start sub_812DFEC
sub_812DFEC: @ 812E368
	push {lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x32]
	ldrh r0, [r3, 0x34]
	adds r2, r0
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r3, 0x26]
	subs r1, r0
	strh r1, [r3, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x34]
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _0812E3B6
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _0812E3B6
	ldr r2, _0812E410 @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, 0x36]
	adds r0, 0x1
	strh r0, [r3, 0x36]
_0812E3B6:
	movs r1, 0x36
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _0812E3EA
	movs r2, 0x26
	ldrsh r1, [r3, r2]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _0812E3EA
	ldr r2, _0812E410 @ =gSprites
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r3, 0x36]
	adds r0, 0x1
	strh r0, [r3, 0x36]
_0812E3EA:
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812E40C
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812E414 @ =sub_812E09C
	str r0, [r3, 0x1C]
_0812E40C:
	pop {r0}
	bx r0
	.align 2, 0
_0812E410: .4byte gSprites
_0812E414: .4byte sub_812E09C
	thumb_func_end sub_812DFEC

	thumb_func_start sub_812E09C
sub_812E09C: @ 812E418
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _0812E46C @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r3, r6
	ldr r2, [r0]
	ldr r0, _0812E470 @ =SpriteCallbackDummy
	cmp r2, r0
	bne _0812E464
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r2
	bne _0812E464
	adds r0, r3, r5
	bl DestroySprite
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl move_anim_8072740
_0812E464:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E46C: .4byte gSprites
_0812E470: .4byte SpriteCallbackDummy
	thumb_func_end sub_812E09C

	thumb_func_start sub_812E0F8
sub_812E0F8: @ 812E474
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0812E4C0
	ldrh r2, [r3, 0x32]
	ldrh r1, [r3, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r3, 0x26]
	subs r0, r1
	strh r0, [r3, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r3, 0x34]
	ldrh r0, [r3, 0x30]
	subs r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812E4C0
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r0, _0812E4C4 @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_0812E4C0:
	pop {r0}
	bx r0
	.align 2, 0
_0812E4C4: .4byte SpriteCallbackDummy
	thumb_func_end sub_812E0F8

	thumb_func_start sub_812E14C
sub_812E14C: @ 812E4C8
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0812E4F0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _0812E4E6
	b _0812E7F2
_0812E4E6:
	lsls r0, 2
	ldr r1, _0812E4F4 @ =_0812E4F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0812E4F0: .4byte gTasks
_0812E4F4: .4byte _0812E4F8
	.align 2, 0
_0812E4F8:
	.4byte _0812E510
	.4byte _0812E67C
	.4byte _0812E704
	.4byte _0812E738
	.4byte _0812E764
	.4byte _0812E79C
_0812E510:
	ldr r1, _0812E5AC @ =0x04000050
	ldr r3, _0812E5B0 @ =0x00003f42
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812E5B4 @ =0x00000d03
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _0812E5B8 @ =0x0400000a
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812E550
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_0812E550:
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _0812E5BC @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0812E5C0 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0812E5C4 @ =gUnknown_08D2AA98
	bl LZDecompressVram
	ldr r0, _0812E5C8 @ =gUnknown_08D2A9E0
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0812E5CC @ =gUnknown_08D2AA80
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812E5DC
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
	ldr r1, _0812E5D0 @ =gUnknown_030042C0
	ldr r3, _0812E5D4 @ =0x0000ffc8
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0812E5D8 @ =gUnknown_030041B4
	strh r4, [r0]
	b _0812E64E
	.align 2, 0
_0812E5AC: .4byte 0x04000050
_0812E5B0: .4byte 0x00003f42
_0812E5B4: .4byte 0x00000d03
_0812E5B8: .4byte 0x0400000a
_0812E5BC: .4byte 0x040000d4
_0812E5C0: .4byte 0x85000400
_0812E5C4: .4byte gUnknown_08D2AA98
_0812E5C8: .4byte gUnknown_08D2A9E0
_0812E5CC: .4byte gUnknown_08D2AA80
_0812E5D0: .4byte gUnknown_030042C0
_0812E5D4: .4byte 0x0000ffc8
_0812E5D8: .4byte gUnknown_030041B4
_0812E5DC:
	ldr r0, _0812E61C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E630
	ldr r1, _0812E620 @ =gUnknown_030042C0
	cmp r4, 0x1
	bne _0812E600
	ldr r2, _0812E624 @ =0x0000ff65
	adds r0, r2, 0
	strh r0, [r1]
_0812E600:
	cmp r4, 0x3
	bne _0812E60A
	ldr r3, _0812E628 @ =0x0000ff8d
	adds r0, r3, 0
	strh r0, [r1]
_0812E60A:
	cmp r4, 0
	bne _0812E612
	movs r0, 0xE
	strh r0, [r1]
_0812E612:
	cmp r4, 0x2
	bne _0812E648
	ldr r1, _0812E620 @ =gUnknown_030042C0
	ldr r2, _0812E62C @ =0x0000ffec
	b _0812E644
	.align 2, 0
_0812E61C: .4byte gUnknown_0202F7C9
_0812E620: .4byte gUnknown_030042C0
_0812E624: .4byte 0x0000ff65
_0812E628: .4byte 0x0000ff8d
_0812E62C: .4byte 0x0000ffec
_0812E630:
	cmp r4, 0x1
	bne _0812E63C
	ldr r1, _0812E668 @ =gUnknown_030042C0
	ldr r3, _0812E66C @ =0x0000ff79
	adds r0, r3, 0
	strh r0, [r1]
_0812E63C:
	cmp r4, 0
	bne _0812E648
	ldr r1, _0812E668 @ =gUnknown_030042C0
	ldr r2, _0812E670 @ =0x0000fff6
_0812E644:
	adds r0, r2, 0
	strh r0, [r1]
_0812E648:
	ldr r1, _0812E674 @ =gUnknown_030041B4
	movs r0, 0
	strh r0, [r1]
_0812E64E:
	ldr r0, _0812E678 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0812E668 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1, 0x1C]
	ldr r0, _0812E674 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1, 0x1E]
	b _0812E6FC
	.align 2, 0
_0812E668: .4byte gUnknown_030042C0
_0812E66C: .4byte 0x0000ff79
_0812E670: .4byte 0x0000fff6
_0812E674: .4byte gUnknown_030041B4
_0812E678: .4byte gTasks
_0812E67C:
	ldr r1, _0812E6B0 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0
	strh r0, [r5, 0xE]
	ldr r0, _0812E6B4 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E6C0
	ldr r2, _0812E6B8 @ =gUnknown_030042C0
	ldr r1, _0812E6BC @ =gUnknown_08402604
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r5, [r5, 0x1C]
	adds r0, r5
	b _0812E6D2
	.align 2, 0
_0812E6B0: .4byte gTasks
_0812E6B4: .4byte gUnknown_0202F7C9
_0812E6B8: .4byte gUnknown_030042C0
_0812E6BC: .4byte gUnknown_08402604
_0812E6C0:
	ldr r2, _0812E6F0 @ =gUnknown_030042C0
	ldr r1, _0812E6F4 @ =gUnknown_08402604
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, 0x1C]
	subs r0, r1
_0812E6D2:
	strh r0, [r2]
	ldr r0, _0812E6F8 @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0812E6FC
	strh r0, [r1, 0x8]
	b _0812E7F2
	.align 2, 0
_0812E6F0: .4byte gUnknown_030042C0
_0812E6F4: .4byte gUnknown_08402604
_0812E6F8: .4byte gTasks
_0812E6FC:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0812E7F2
_0812E704:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _0812E71E
	movs r0, 0x5
	strh r0, [r4, 0xA]
_0812E71E:
	ldr r2, _0812E734 @ =0x04000052
	ldrh r0, [r4, 0xA]
	lsls r0, 8
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bne _0812E7F2
	b _0812E758
	.align 2, 0
_0812E734: .4byte 0x04000052
_0812E738:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r1, [r4, 0xE]
	adds r1, 0x1
	strh r1, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	ldr r2, _0812E760 @ =gUnknown_08402608
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	adds r0, r2
	ldrb r0, [r0]
	cmp r1, r0
	ble _0812E7F2
_0812E758:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E7F2
	.align 2, 0
_0812E760: .4byte gUnknown_08402608
_0812E764:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	ble _0812E77E
	movs r0, 0xD
	strh r0, [r4, 0xA]
_0812E77E:
	ldr r2, _0812E798 @ =0x04000052
	ldrh r0, [r4, 0xA]
	lsls r0, 8
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	bne _0812E7F2
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E7F2
	.align 2, 0
_0812E798: .4byte 0x04000052
_0812E79C:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r1, _0812E7FC @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0812E800 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812E7CC
	ldr r2, _0812E804 @ =0x0400000a
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0812E7CC:
	ldr r2, _0812E804 @ =0x0400000a
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812E808 @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r0, _0812E80C @ =gUnknown_030041B4
	strh r4, [r0]
	ldr r0, _0812E810 @ =0x04000050
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, r6, 0
	bl move_anim_task_del
_0812E7F2:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812E7FC: .4byte 0x040000d4
_0812E800: .4byte 0x85000200
_0812E804: .4byte 0x0400000a
_0812E808: .4byte gUnknown_030042C0
_0812E80C: .4byte gUnknown_030041B4
_0812E810: .4byte 0x04000050
	thumb_func_end sub_812E14C

	thumb_func_start sub_812E498
sub_812E498: @ 812E814
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0812E84C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812E854
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0812E850 @ =gUnknown_08402610
	adds r0, r4, 0
	bl sub_80798F4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812E866
	.align 2, 0
_0812E84C: .4byte gTasks
_0812E850: .4byte gUnknown_08402610
_0812E854:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812E866
	adds r0, r5, 0
	bl move_anim_task_del
_0812E866:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812E498

	thumb_func_start sub_812E4F0
sub_812E4F0: @ 812E86C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _0812E88A
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0812E8DE
_0812E88A:
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	cmp r1, 0x14
	ble _0812E8DE
	ldrh r0, [r4, 0x30]
	adds r0, 0xA0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0x80
	strh r0, [r4, 0x32]
	ldr r0, _0812E8B8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812E8BC
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _0812E8C2
	.align 2, 0
_0812E8B8: .4byte gUnknown_0202F7C8
_0812E8BC:
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
_0812E8C2:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _0812E8DE
	adds r0, r4, 0
	bl move_anim_8072740
_0812E8DE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812E4F0

	thumb_func_start sub_812E568
sub_812E568: @ 812E8E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0812E908 @ =gTasks
	adds r4, r0, r1
	ldr r5, _0812E90C @ =gUnknown_03004B00
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812E910
	adds r0, r2, 0
	bl move_anim_task_del
	b _0812E9A4
	.align 2, 0
_0812E908: .4byte gTasks
_0812E90C: .4byte gUnknown_03004B00
_0812E910:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bge _0812E91C
	movs r0, 0
	strh r0, [r5, 0x4]
_0812E91C:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	ble _0812E928
	movs r0, 0x2
	strh r0, [r5, 0x4]
_0812E928:
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r1, 1
	movs r0, 0x8
	subs r0, r1
	strh r0, [r4, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	lsls r0, 7
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0x4]
	adds r0, 0x2
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812E974
	ldr r0, _0812E970 @ =gUnknown_0202F7C8
	b _0812E976
	.align 2, 0
_0812E970: .4byte gUnknown_0202F7C8
_0812E974:
	ldr r0, _0812E9AC @ =gUnknown_0202F7C9
_0812E976:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812E994
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x12]
_0812E994:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _0812E9B0 @ =sub_812E638
	str r0, [r4]
_0812E9A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812E9AC: .4byte gUnknown_0202F7C9
_0812E9B0: .4byte sub_812E638
	thumb_func_end sub_812E568

	thumb_func_start sub_812E638
sub_812E638: @ 812E9B4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0812E9D8 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r6, [r4, r0]
	cmp r6, 0x1
	beq _0812EA3C
	cmp r6, 0x1
	bgt _0812E9DC
	cmp r6, 0
	beq _0812E9E8
	b _0812EB14
	.align 2, 0
_0812E9D8: .4byte gTasks
_0812E9DC:
	cmp r6, 0x2
	beq _0812EA94
	cmp r6, 0x3
	bne _0812E9E6
	b _0812EB04
_0812E9E6:
	b _0812EB14
_0812E9E8:
	ldr r2, _0812EA38 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0812EB14
	strh r6, [r4, 0xA]
	b _0812EAFC
	.align 2, 0
_0812EA38: .4byte gSprites
_0812EA3C:
	ldr r2, _0812EA90 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0x12]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 1
	cmp r1, r0
	blt _0812EB14
	movs r0, 0
	strh r0, [r4, 0xA]
	b _0812EAFC
	.align 2, 0
_0812EA90: .4byte gSprites
_0812EA94:
	ldr r2, _0812EAF8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	movs r5, 0
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0812EB14
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0812EAFC
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0x8]
	b _0812EB14
	.align 2, 0
_0812EAF8: .4byte gSprites
_0812EAFC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0812EB14
_0812EB04:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_0812EB14:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812E638

	thumb_func_start sub_812E7A0
sub_812E7A0: @ 812EB1C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0812EB38 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0812EB40
	strh r0, [r4, 0x20]
	ldr r1, _0812EB3C @ =gUnknown_03004B00
	ldrh r0, [r1]
	b _0812EB4A
	.align 2, 0
_0812EB38: .4byte gUnknown_0202F7C8
_0812EB3C: .4byte gUnknown_03004B00
_0812EB40:
	movs r0, 0xF0
	strh r0, [r4, 0x20]
	ldr r1, _0812EB64 @ =gUnknown_03004B00
	ldrh r0, [r1]
	subs r0, 0x1E
_0812EB4A:
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrb r1, [r1, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0812EB68 @ =sub_812E7F0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EB64: .4byte gUnknown_03004B00
_0812EB68: .4byte sub_812E7F0
	thumb_func_end sub_812E7A0

	thumb_func_start sub_812E7F0
sub_812E7F0: @ 812EB6C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _0812EBAC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812EBB0
	ldrh r1, [r4, 0x20]
	adds r1, 0x5
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _0812EB9E
	adds r0, r4, 0
	bl move_anim_8072740
_0812EB9E:
	ldrh r1, [r4, 0x2E]
	movs r0, 0xFF
	ands r0, r1
	movs r1, 0x10
	bl Sin
	b _0812EBD4
	.align 2, 0
_0812EBAC: .4byte gUnknown_0202F7C8
_0812EBB0:
	ldrh r1, [r4, 0x20]
	subs r1, 0x5
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	cmp r1, 0
	bge _0812EBC8
	adds r0, r4, 0
	bl move_anim_8072740
_0812EBC8:
	ldrh r1, [r4, 0x2E]
	movs r0, 0xFF
	ands r0, r1
	movs r1, 0x10
	bl Cos
_0812EBD4:
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812E7F0

	thumb_func_start sub_812E860
sub_812E860: @ 812EBDC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812EC24 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x40
	strh r0, [r4, 0x22]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x24]
	ldr r0, _0812EC28 @ =gUnknown_03004B00
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	movs r1, 0
	bl sub_8078E70
	ldr r0, _0812EC2C @ =sub_812E8B4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812EC24: .4byte gTasks
_0812EC28: .4byte gUnknown_03004B00
_0812EC2C: .4byte sub_812E8B4
	thumb_func_end sub_812E860

	thumb_func_start sub_812E8B4
sub_812E8B4: @ 812EC30
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0812EC5C @ =gTasks
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	mov r8, r0
	cmp r0, 0x1
	beq _0812ECCC
	cmp r0, 0x1
	bgt _0812EC60
	cmp r0, 0
	beq _0812EC68
	b _0812ED46
	.align 2, 0
_0812EC5C: .4byte gTasks
_0812EC60:
	mov r2, r8
	cmp r2, 0x2
	beq _0812ED34
	b _0812ED46
_0812EC68:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r1, [r7, 0xC]
	adds r2, r0, r1
	strh r2, [r7, 0xC]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r3, [r7, 0x24]
	mov r8, r3
	movs r3, 0x24
	ldrsh r1, [r7, r3]
	cmp r0, r1
	blt _0812ED46
	mov r0, r8
	subs r5, r0, r2
	lsls r5, 16
	asrs r5, 16
	adds r6, r1, 0
	lsls r6, 1
	adds r0, r5, 0
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x1
	ands r4, r1
	cmp r4, 0
	bne _0812ECC0
	lsls r0, 16
	asrs r0, 16
	mov r2, r8
	subs r0, r2, r0
	b _0812ED1E
_0812ECC0:
	lsls r0, 16
	asrs r0, 16
	mov r3, r8
	subs r0, r3
	strh r0, [r7, 0xC]
	b _0812ED46
_0812ECCC:
	ldr r1, _0812ED24 @ =0xfffffe00
	adds r0, r1, 0
	ldrh r2, [r7, 0xC]
	adds r1, r0, r2
	strh r1, [r7, 0xC]
	movs r3, 0xC
	ldrsh r0, [r7, r3]
	movs r2, 0x24
	ldrsh r6, [r7, r2]
	cmn r0, r6
	bgt _0812ED46
	ldrh r3, [r7, 0x24]
	mov r9, r3
	mov r0, r9
	subs r4, r0, r1
	lsls r4, 16
	asrs r4, 16
	lsls r6, 1
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r2, r0, 16
	mov r1, r8
	ands r1, r5
	lsls r0, r1, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _0812ED28
	lsls r0, r2, 16
	asrs r0, 16
	mov r2, r9
	subs r0, r2
_0812ED1E:
	strh r0, [r7, 0xC]
	strh r1, [r7, 0x8]
	b _0812ED46
	.align 2, 0
_0812ED24: .4byte 0xfffffe00
_0812ED28:
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r9
	subs r0, r3, r0
	strh r0, [r7, 0xC]
	b _0812ED46
_0812ED34:
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	adds r0, r4, 0
	bl move_anim_task_del
	b _0812EDBC
_0812ED46:
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r7, 0xC]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldr r2, _0812EDB4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0xC
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bge _0812ED7A
	adds r0, 0x3F
_0812ED7A:
	asrs r0, 6
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r7, 0xA]
	adds r0, 0x1
	strh r0, [r7, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0812EDBC
	ldrh r1, [r7, 0x20]
	movs r3, 0x20
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _0812EDB8
	subs r0, r1, 0x1
	strh r0, [r7, 0x20]
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x22]
	subs r0, r1
	strh r0, [r7, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _0812EDBC
	movs r0, 0x10
	strh r0, [r7, 0x24]
	b _0812EDBC
	.align 2, 0
_0812EDB4: .4byte gSprites
_0812EDB8:
	movs r0, 0x2
	strh r0, [r7, 0x8]
_0812EDBC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812E8B4

	thumb_func_start sub_812EA4C
sub_812EA4C: @ 812EDC8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0812EE28
	ldr r6, _0812EE20 @ =gUnknown_03004B00
	movs r2, 0x4
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0812EDFC
	ldr r4, _0812EE24 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0812EDFC:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrh r1, [r6, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r1, r2
	strh r0, [r5, 0x22]
	movs r0, 0x80
	strh r0, [r5, 0x30]
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r5, 0x32]
	strh r1, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _0812EE86
	.align 2, 0
_0812EE20: .4byte gUnknown_03004B00
_0812EE24: .4byte gUnknown_0202F7C8
_0812EE28:
	ldrh r1, [r5, 0x30]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r5, 0x26]
	adds r0, r2
	strh r0, [r5, 0x26]
	movs r2, 0x36
	ldrsh r0, [r5, r2]
	adds r4, r1, 0
	cmp r0, 0
	bne _0812EE66
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmn r1, r0
	ble _0812EE66
	movs r0, 0x1
	strh r0, [r5, 0x36]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	negs r0, r0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 1
	strh r0, [r5, 0x32]
_0812EE66:
	adds r0, r4, 0
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x80
	strh r0, [r5, 0x32]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0812EE86
	adds r0, r5, 0
	bl move_anim_8072740
_0812EE86:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812EA4C

	thumb_func_start sub_812EB10
sub_812EB10: @ 812EE8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	ldr r1, _0812EEBC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _0812EF98
	ldr r0, _0812EEC0 @ =gUnknown_03004B00
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, 0
	bne _0812EEC8
	ldr r0, _0812EEC4 @ =gUnknown_0202F7C8
	b _0812EECA
	.align 2, 0
_0812EEBC: .4byte gTasks
_0812EEC0: .4byte gUnknown_03004B00
_0812EEC4: .4byte gUnknown_0202F7C8
_0812EEC8:
	ldr r0, _0812EF04 @ =gUnknown_0202F7C9
_0812EECA:
	ldrb r0, [r0]
	strh r0, [r2, 0x1E]
	mov r1, r8
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0812EF08 @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r6, r0, r1
	strh r5, [r6, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078E70
	mov r2, r8
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	beq _0812EF2C
	cmp r0, 0x1
	bgt _0812EF0C
	cmp r0, 0
	beq _0812EF14
	lsls r2, r5, 4
	b _0812EF74
	.align 2, 0
_0812EF04: .4byte gUnknown_0202F7C9
_0812EF08: .4byte gTasks
_0812EF0C:
	cmp r0, 0x2
	beq _0812EF36
	lsls r2, r5, 4
	b _0812EF74
_0812EF14:
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r5, 0
	movs r1, 0xE0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8079A64
	lsls r2, r5, 4
	b _0812EF74
_0812EF2C:
	movs r2, 0x98
	lsls r2, 1
	movs r3, 0xF0
	lsls r3, 4
	b _0812EF3E
_0812EF36:
	movs r2, 0x98
	lsls r2, 1
	movs r3, 0xF1
	lsls r3, 8
_0812EF3E:
	adds r0, r5, 0
	movs r1, 0xD0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8079A64
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0812EF64
	ldrb r0, [r6, 0x1E]
	bl battle_side_get_owner
	lsls r0, 24
	lsls r2, r5, 4
	cmp r0, 0
	bne _0812EF74
_0812EF64:
	ldr r0, _0812EF90 @ =gSprites
	lsls r2, r5, 4
	adds r1, r2, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x10
	strh r0, [r1, 0x26]
_0812EF74:
	ldr r1, _0812EF90 @ =gSprites
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x24]
	ldr r0, _0812EF94 @ =gTasks
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0812EFE4
	.align 2, 0
_0812EF90: .4byte gSprites
_0812EF94: .4byte gTasks
_0812EF98:
	ldrb r5, [r2, 0x1C]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0812EFBC
	strh r4, [r2, 0xC]
	ldr r0, _0812EFF0 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x24]
	negs r0, r0
	strh r0, [r1, 0x24]
_0812EFBC:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bne _0812EFE4
	adds r0, r5, 0
	bl sub_8078F40
	ldr r1, _0812EFF0 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x24]
	strh r4, [r0, 0x26]
	adds r0, r7, 0
	bl move_anim_task_del
_0812EFE4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812EFF0: .4byte gSprites
	thumb_func_end sub_812EB10

	thumb_func_start sub_812EC78
sub_812EC78: @ 812EFF4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xC
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, r0
	ldr r3, _0812F040 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _0812F044 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	bl Random
	ldr r5, _0812F048 @ =0x000001ff
	ands r5, r0
	bl Random
	movs r1, 0xFF
	ands r1, r0
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _0812F04C
	movs r2, 0xBC
	lsls r2, 3
	adds r0, r5, r2
	b _0812F054
	.align 2, 0
_0812F040: .4byte 0x000003ff
_0812F044: .4byte 0xfffffc00
_0812F048: .4byte 0x000001ff
_0812F04C:
	movs r3, 0xBC
	lsls r3, 3
	adds r0, r3, 0
	subs r0, r5
_0812F054:
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812F066
	movs r2, 0x90
	lsls r2, 3
	adds r0, r1, r2
	b _0812F06E
_0812F066:
	movs r3, 0x90
	lsls r3, 3
	adds r0, r3, 0
	subs r0, r1
_0812F06E:
	strh r0, [r4, 0x30]
	ldr r0, _0812F080 @ =gUnknown_03004B00
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _0812F088
	ldr r0, _0812F084 @ =0x0000fff8
	b _0812F08A
	.align 2, 0
_0812F080: .4byte gUnknown_03004B00
_0812F084: .4byte 0x0000fff8
_0812F088:
	movs r0, 0xF8
_0812F08A:
	strh r0, [r4, 0x20]
	movs r0, 0x68
	strh r0, [r4, 0x22]
	ldr r0, _0812F09C @ =sub_812ED24
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812F09C: .4byte sub_812ED24
	thumb_func_end sub_812EC78

	thumb_func_start sub_812ED24
sub_812ED24: @ 812F0A0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0812F0B8
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _0812F0C2
_0812F0B8:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_0812F0C2:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	adds r0, r3, 0
	subs r0, 0x16
	strh r0, [r4, 0x2E]
	adds r1, r2, 0
	subs r1, 0x30
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _0812F0E6
	movs r0, 0
	strh r0, [r4, 0x2E]
_0812F0E6:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0812F0FA
	adds r0, r4, 0
	bl move_anim_8072740
_0812F0FA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812ED24

	thumb_func_start sub_812ED84
sub_812ED84: @ 812F100
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0812F160 @ =0x0400004a
	ldr r2, _0812F164 @ =0x00001f3f
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0812F168 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0812F16C @ =gUnknown_03004240
	strh r1, [r0]
	ldr r0, _0812F170 @ =0x04000040
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r0, _0812F174 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0812F178 @ =sub_812EE00
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F160: .4byte 0x0400004a
_0812F164: .4byte 0x00001f3f
_0812F168: .4byte gUnknown_030042C4
_0812F16C: .4byte gUnknown_03004240
_0812F170: .4byte 0x04000040
_0812F174: .4byte gUnknown_03004B00
_0812F178: .4byte sub_812EE00
	thumb_func_end sub_812ED84

	thumb_func_start sub_812EE00
sub_812EE00: @ 812F17C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0812F1BA
	cmp r0, 0x1
	bgt _0812F192
	cmp r0, 0
	beq _0812F19C
	b _0812F210
_0812F192:
	cmp r0, 0x2
	beq _0812F1D0
	cmp r0, 0x3
	beq _0812F1F2
	b _0812F210
_0812F19C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812F210
	b _0812F1EA
_0812F1BA:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0812F210
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _0812F1EA
_0812F1D0:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0812F210
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0812F1EA:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	b _0812F210
_0812F1F2:
	ldr r1, _0812F218 @ =0x0400004a
	ldr r2, _0812F21C @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	bl move_anim_8072740
_0812F210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F218: .4byte 0x0400004a
_0812F21C: .4byte 0x00003f3f
	thumb_func_end sub_812EE00

	thumb_func_start sub_812EEA4
sub_812EEA4: @ 812F220
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0812F25C @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _0812F260 @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldr r1, _0812F264 @ =sub_812EEEC
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812F25C: .4byte gUnknown_0202F7C8
_0812F260: .4byte gUnknown_03004B00
_0812F264: .4byte sub_812EEEC
	thumb_func_end sub_812EEA4

	thumb_func_start sub_812EEEC
sub_812EEEC: @ 812F268
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x34]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	lsls r1, r0, 16
	cmp r0, 0x3F
	bls _0812F2A2
	asrs r0, r1, 16
	cmp r0, 0xC3
	ble _0812F2B4
_0812F2A2:
	ldr r0, _0812F2B0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	b _0812F2BE
	.align 2, 0
_0812F2B0: .4byte gUnknown_0202F7C8
_0812F2B4:
	ldr r0, _0812F300 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x1
_0812F2BE:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r3, 0x38
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _0812F304
	movs r1, 0x80
	lsls r1, 3
	adds r0, r1, 0
	ldrh r3, [r4, 0x32]
	adds r0, r3
	strh r0, [r4, 0x32]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r3, [r4, 0x34]
	adds r0, r3
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0812F334
	strh r2, [r4, 0x36]
	movs r0, 0x1
	strh r0, [r4, 0x38]
	b _0812F334
	.align 2, 0
_0812F300: .4byte gUnknown_0202F7C8
_0812F304:
	cmp r2, 0x1
	bne _0812F334
	ldr r1, _0812F33C @ =0xfffffc00
	adds r0, r1, 0
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldr r3, _0812F340 @ =0xffffff00
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0812F334
	adds r0, r4, 0
	bl move_anim_8072740
_0812F334:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812F33C: .4byte 0xfffffc00
_0812F340: .4byte 0xffffff00
	thumb_func_end sub_812EEEC

	thumb_func_start sub_812EFC8
sub_812EFC8: @ 812F344
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0812F380
	movs r0, 0x1
	str r0, [sp, 0x14]
	ldr r0, _0812F37C @ =0x02019348
	ldr r1, [r0, 0x10]
	mov r9, r1
	ldr r2, [r0, 0xC]
	mov r8, r2
	ldrh r6, [r0, 0x2]
	movs r3, 0x14
	b _0812F4B8
	.align 2, 0
_0812F37C: .4byte 0x02019348
_0812F380:
	ldr r0, _0812F3EC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812F428
	movs r0, 0
	str r0, [sp, 0x14]
	ldr r6, _0812F3F0 @ =gUnknown_02024A6A
	ldr r4, _0812F3F4 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _0812F3F8 @ =gPlayerParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	mov r9, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	movs r1, 0x1
	bl GetMonData
	mov r8, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _0812F3FC @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0812F420
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812F400
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	b _0812F40E
	.align 2, 0
_0812F3EC: .4byte gUnknown_0202F7C8
_0812F3F0: .4byte gUnknown_02024A6A
_0812F3F4: .4byte gUnknown_0202F7C9
_0812F3F8: .4byte gPlayerParty
_0812F3FC: .4byte 0x02017800
_0812F400:
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	ldr r1, _0812F41C @ =gEnemyParty
	adds r0, r1
_0812F40E:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	b _0812F422
	.align 2, 0
_0812F41C: .4byte gEnemyParty
_0812F420:
	ldrh r6, [r1, 0x2]
_0812F422:
	movs r1, 0x14
	mov r10, r1
	b _0812F4BA
_0812F428:
	movs r2, 0x1
	str r2, [sp, 0x14]
	ldr r6, _0812F488 @ =gUnknown_02024A6A
	ldr r4, _0812F48C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r7, _0812F490 @ =gEnemyParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	mov r9, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
	movs r1, 0x1
	bl GetMonData
	mov r8, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _0812F494 @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0812F4B4
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0812F49C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	ldr r1, _0812F498 @ =gPlayerParty
	adds r0, r1
	b _0812F4A8
	.align 2, 0
_0812F488: .4byte gUnknown_02024A6A
_0812F48C: .4byte gUnknown_0202F7C9
_0812F490: .4byte gEnemyParty
_0812F494: .4byte 0x02017800
_0812F498: .4byte gPlayerParty
_0812F49C:
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r7
_0812F4A8:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	b _0812F4B6
_0812F4B4:
	ldrh r6, [r1, 0x2]
_0812F4B6:
	ldr r3, _0812F594 @ =0x0000ffec
_0812F4B8:
	mov r10, r3
_0812F4BA:
	ldr r0, _0812F598 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0812F598 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r1
	lsls r4, 16
	asrs r4, 16
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	mov r3, r9
	str r3, [sp, 0x8]
	mov r0, r8
	str r0, [sp, 0xC]
	adds r0, r6, 0
	ldr r1, [sp, 0x14]
	movs r2, 0
	adds r3, r4, 0
	bl sub_8079F44
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0812F59C @ =gSprites
	lsls r5, r6, 4
	adds r5, r6
	lsls r5, 2
	adds r5, r0
	movs r0, 0x3
	ands r7, r0
	lsls r7, 2
	mov r8, r7
	ldrb r0, [r5, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r0
	mov r2, r8
	orrs r1, r2
	strb r1, [r5, 0x5]
	ldrb r2, [r5, 0x1]
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldr r0, _0812F5A0 @ =0x00007fff
	lsrs r1, 4
	lsls r1, 4
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	orrs r1, r2
	movs r2, 0x20
	bl FillPalette
	ldrb r0, [r5, 0x5]
	ands r4, r0
	mov r0, r8
	orrs r4, r0
	strb r4, [r5, 0x5]
	ldr r1, _0812F5A4 @ =0x04000050
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0812F5A8 @ =0x04000052
	ldr r0, _0812F5AC @ =gTasks
	ldr r2, [sp, 0x10]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r0, r2
	strh r0, [r3]
	strh r6, [r1, 0x8]
	ldr r0, _0812F5B0 @ =sub_812F238
	str r0, [r1]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812F594: .4byte 0x0000ffec
_0812F598: .4byte gUnknown_0202F7C8
_0812F59C: .4byte gSprites
_0812F5A0: .4byte 0x00007fff
_0812F5A4: .4byte 0x04000050
_0812F5A8: .4byte 0x04000052
_0812F5AC: .4byte gTasks
_0812F5B0: .4byte sub_812F238
	thumb_func_end sub_812EFC8

	thumb_func_start sub_812F238
sub_812F238: @ 812F5B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812F600 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812F5FC
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0xA]
	adds r1, 0x1
	strh r1, [r3, 0xA]
	ldr r2, _0812F604 @ =0x04000052
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0xA
	bne _0812F5FC
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x1C]
	strh r0, [r3, 0x1E]
	ldr r0, _0812F608 @ =sub_812F290
	str r0, [r3]
_0812F5FC:
	pop {r0}
	bx r0
	.align 2, 0
_0812F600: .4byte gTasks
_0812F604: .4byte 0x04000052
_0812F608: .4byte sub_812F290
	thumb_func_end sub_812F238

	thumb_func_start sub_812F290
sub_812F290: @ 812F60C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812F684 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r2, [r5, 0x8]
	ldrh r0, [r5, 0x1C]
	subs r0, 0x10
	movs r4, 0
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x80
	strh r0, [r5, 0x1E]
	ldr r1, _0812F688 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r6, r0, r1
	ldrb r2, [r6, 0x1]
	lsls r1, r2, 30
	lsrs r1, 30
	movs r0, 0x2
	orrs r1, r0
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	movs r0, 0x1E
	ldrsh r3, [r5, r0]
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8078FDC
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _0812F67A
	adds r0, r6, 0
	bl sub_8079098
	adds r0, r6, 0
	bl sub_807A0F4
	ldr r0, _0812F68C @ =sub_8078634
	str r0, [r5]
_0812F67A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812F684: .4byte gTasks
_0812F688: .4byte gSprites
_0812F68C: .4byte sub_8078634
	thumb_func_end sub_812F290

	thumb_func_start sub_812F314
sub_812F314: @ 812F690
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0812F6B0 @ =gTasks
	adds r4, r1, r0
	ldr r0, _0812F6B4 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812F6BC
	ldr r0, _0812F6B8 @ =gUnknown_0202F7C8
	b _0812F6BE
	.align 2, 0
_0812F6B0: .4byte gTasks
_0812F6B4: .4byte gUnknown_03004B00
_0812F6B8: .4byte gUnknown_0202F7C8
_0812F6BC:
	ldr r0, _0812F73C @ =gUnknown_0202F7C9
_0812F6BE:
	ldrb r5, [r0]
	movs r6, 0
	strh r6, [r4, 0x8]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x10
	strh r0, [r4, 0xE]
	strh r6, [r4, 0x10]
	strh r5, [r4, 0x12]
	movs r0, 0x20
	strh r0, [r4, 0x14]
	strh r6, [r4, 0x16]
	movs r0, 0x18
	strh r0, [r4, 0x18]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F6F0
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x18]
_0812F6F0:
	adds r0, r5, 0
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x22
	strh r0, [r4, 0x22]
	cmp r0, 0
	bge _0812F704
	strh r6, [r4, 0x22]
_0812F704:
	ldrh r0, [r4, 0x22]
	adds r0, 0x42
	strh r0, [r4, 0x24]
	ldr r0, _0812F740 @ =gUnknown_03004B00
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	adds r0, r5, 0
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F758
	ldr r0, _0812F744 @ =0x04000014
	str r0, [sp]
	ldr r1, _0812F748 @ =0x04000050
	ldr r2, _0812F74C @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812F750 @ =gUnknown_030042C0
	ldrh r5, [r0]
	ldr r0, _0812F754 @ =gUnknown_030041B4
	b _0812F76A
	.align 2, 0
_0812F73C: .4byte gUnknown_0202F7C9
_0812F740: .4byte gUnknown_03004B00
_0812F744: .4byte 0x04000014
_0812F748: .4byte 0x04000050
_0812F74C: .4byte 0x00003f42
_0812F750: .4byte gUnknown_030042C0
_0812F754: .4byte gUnknown_030041B4
_0812F758:
	ldr r0, _0812F7D0 @ =0x04000018
	str r0, [sp]
	ldr r1, _0812F7D4 @ =0x04000050
	ldr r2, _0812F7D8 @ =0x00003f44
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0812F7DC @ =gUnknown_03004288
	ldrh r5, [r0]
	ldr r0, _0812F7E0 @ =gUnknown_03004280
_0812F76A:
	ldrh r3, [r0]
	movs r7, 0
	movs r2, 0
	ldr r6, _0812F7E4 @ =gUnknown_03004DE0
	movs r0, 0xF0
	lsls r0, 3
	adds r0, r6
	mov r12, r0
_0812F77A:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r6
	strh r5, [r0]
	add r1, r12
	strh r5, [r1]
	adds r0, r2, 0x1
	lsls r0, 1
	adds r1, r0, r6
	strh r3, [r1]
	add r0, r12
	strh r3, [r0]
	lsls r0, r7, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	adds r2, 0x2
	lsls r2, 16
	lsrs r2, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0812F77A
	ldr r0, _0812F7E8 @ =0xa6600001
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _0812F7EC @ =sub_812F474
	str r0, [r4]
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812F7D0: .4byte 0x04000018
_0812F7D4: .4byte 0x04000050
_0812F7D8: .4byte 0x00003f44
_0812F7DC: .4byte gUnknown_03004288
_0812F7E0: .4byte gUnknown_03004280
_0812F7E4: .4byte gUnknown_03004DE0
_0812F7E8: .4byte 0xa6600001
_0812F7EC: .4byte sub_812F474
	thumb_func_end sub_812F314

	thumb_func_start sub_812F474
sub_812F474: @ 812F7F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0812F824 @ =gTasks
	adds r6, r0, r1
	ldrb r0, [r6, 0x12]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0812F830
	ldr r0, _0812F828 @ =gUnknown_030042C0
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _0812F82C @ =gUnknown_030041B4
	b _0812F838
	.align 2, 0
_0812F824: .4byte gTasks
_0812F828: .4byte gUnknown_030042C0
_0812F82C: .4byte gUnknown_030041B4
_0812F830:
	ldr r0, _0812F850 @ =gUnknown_03004288
	ldrh r0, [r0]
	str r0, [sp, 0x4]
	ldr r0, _0812F854 @ =gUnknown_03004280
_0812F838:
	ldrh r0, [r0]
	str r0, [sp, 0x8]
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _0812F846
	b _0812FA22
_0812F846:
	cmp r0, 0x1
	bgt _0812F858
	cmp r0, 0
	beq _0812F866
	b _0812FA8E
	.align 2, 0
_0812F850: .4byte gUnknown_03004288
_0812F854: .4byte gUnknown_03004280
_0812F858:
	cmp r0, 0x2
	bne _0812F85E
	b _0812FA40
_0812F85E:
	cmp r0, 0x3
	bne _0812F864
	b _0812FA88
_0812F864:
	b _0812FA8E
_0812F866:
	movs r2, 0x24
	ldrsh r0, [r6, r2]
	lsls r0, 17
	lsrs r5, r0, 16
	movs r3, 0
	str r3, [sp]
	mov r9, r3
	movs r4, 0
	ldrh r0, [r6, 0xA]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0xA]
	ldrh r7, [r6, 0xA]
	mov r8, r7
	movs r0, 0x14
	ldrsh r1, [r6, r0]
	movs r0, 0xFC
	lsls r0, 3
	bl __divsi3
	strh r0, [r6, 0x1A]
	movs r1, 0x16
	ldrsh r0, [r6, r1]
	lsls r0, 1
	movs r2, 0x1A
	ldrsh r1, [r6, r2]
	bl __divsi3
	negs r0, r0
	strh r0, [r6, 0x1C]
	ldrh r0, [r6, 0x16]
	strh r0, [r6, 0x1E]
	lsls r0, 16
	asrs r0, 21
	lsls r0, 16
	lsrs r7, r0, 16
	strh r7, [r6, 0x20]
	ldrh r2, [r6, 0x24]
	lsls r3, r2, 16
	mov r12, r3
	asrs r1, r3, 16
	movs r3, 0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	ble _0812F986
	ldr r0, _0812F9DC @ =gUnknown_03004DC0
	mov r10, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	str r0, [sp, 0x10]
	ldr r2, [sp, 0x8]
	lsls r0, r2, 16
	asrs r0, 16
	str r0, [sp, 0xC]
_0812F8D6:
	lsls r5, 16
	asrs r5, 16
	adds r2, r5, 0x1
	lsls r2, 1
	mov r3, r10
	ldrb r1, [r3, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	ldr r0, _0812F9E0 @ =gUnknown_03004DE0
	adds r2, r0
	lsls r4, 16
	asrs r4, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	subs r0, r4, r0
	ldr r3, [sp, 0xC]
	adds r0, r3, r0
	strh r0, [r2]
	lsls r3, r5, 1
	mov r0, r10
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r3, r0
	ldr r1, _0812F9E0 @ =gUnknown_03004DE0
	adds r3, r1
	lsls r1, r7, 16
	asrs r1, 16
	ldr r2, [sp, 0x10]
	adds r1, r2, r1
	mov r7, r8
	lsls r2, r7, 16
	asrs r2, 16
	lsls r0, r2, 1
	ldr r7, _0812F9E4 @ =gSineTable
	adds r0, r7
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	adds r1, r0
	strh r1, [r3]
	adds r2, 0xA
	mov r8, r2
	movs r0, 0xFF
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrh r0, [r6, 0x1C]
	ldrh r2, [r6, 0x1E]
	adds r0, r2
	strh r0, [r6, 0x1E]
	lsls r0, 16
	asrs r0, 21
	lsls r0, 16
	lsrs r7, r0, 16
	strh r7, [r6, 0x20]
	adds r4, 0x1
	lsls r4, 16
	lsrs r4, 16
	subs r5, 0x2
	lsls r5, 16
	lsrs r5, 16
	ldr r3, [sp]
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r1, [r6, 0x14]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	str r2, [sp]
	asrs r0, 21
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _0812F9E8 @ =0xffff0000
	add r0, r12
	lsrs r2, r0, 16
	lsls r3, r2, 16
	mov r12, r3
	asrs r1, r3, 16
	movs r3, 0x22
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bgt _0812F8D6
_0812F986:
	lsls r1, r2, 17
	cmp r1, 0
	blt _0812F9B2
	ldr r4, _0812F9E0 @ =gUnknown_03004DE0
	ldr r7, [sp, 0x4]
	lsls r0, r7, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_0812F99E:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	subs r2, 0x2
	lsls r1, r2, 16
	cmp r1, 0
	bge _0812F99E
_0812F9B2:
	ldrh r0, [r6, 0x14]
	adds r0, 0x1
	strh r0, [r6, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _0812FA18
	movs r0, 0x40
	strh r0, [r6, 0x14]
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812F9EC
	ldrh r0, [r6, 0xE]
	subs r0, 0x1
	strh r0, [r6, 0xE]
	b _0812F9F2
	.align 2, 0
_0812F9DC: .4byte gUnknown_03004DC0
_0812F9E0: .4byte gUnknown_03004DE0
_0812F9E4: .4byte gSineTable
_0812F9E8: .4byte 0xffff0000
_0812F9EC:
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
_0812F9F2:
	ldr r0, _0812FA14 @ =0x04000052
	ldrh r1, [r6, 0x10]
	lsls r1, 8
	ldrh r2, [r6, 0xE]
	orrs r1, r2
	strh r1, [r0]
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	cmp r1, 0
	bne _0812FA8E
	movs r3, 0x10
	ldrsh r0, [r6, r3]
	cmp r0, 0x10
	bne _0812FA8E
	strh r1, [r6, 0xC]
	strh r1, [r6, 0xE]
	b _0812FA7C
	.align 2, 0
_0812FA14: .4byte 0x04000052
_0812FA18:
	ldrh r0, [r6, 0x18]
	ldrh r7, [r6, 0x16]
	adds r0, r7
	strh r0, [r6, 0x16]
	b _0812FA8E
_0812FA22:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _0812FA8E
	ldr r1, _0812FA3C @ =gUnknown_03004DC0
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0
	strh r0, [r6, 0xC]
	b _0812FA7C
	.align 2, 0
_0812FA3C: .4byte gUnknown_03004DC0
_0812FA40:
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0812FA56
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	b _0812FA5C
_0812FA56:
	ldrh r0, [r6, 0x10]
	subs r0, 0x1
	strh r0, [r6, 0x10]
_0812FA5C:
	ldr r2, _0812FA84 @ =0x04000052
	ldrh r0, [r6, 0x10]
	lsls r0, 8
	ldrh r1, [r6, 0xE]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0x10
	bne _0812FA8E
	movs r2, 0x10
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _0812FA8E
	strh r0, [r6, 0xC]
	strh r0, [r6, 0xE]
_0812FA7C:
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _0812FA8E
	.align 2, 0
_0812FA84: .4byte 0x04000052
_0812FA88:
	adds r0, r4, 0
	bl move_anim_task_del
_0812FA8E:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812F474

	thumb_func_start sub_812F724
sub_812F724: @ 812FAA0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _0812FAD8 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _0812FADC @ =gUnknown_03004B00
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _0812FAE0 @ =gUnknown_08402750
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _0812FAE4 @ =sub_812F76C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812FAD8: .4byte gTasks
_0812FADC: .4byte gUnknown_03004B00
_0812FAE0: .4byte gUnknown_08402750
_0812FAE4: .4byte sub_812F76C
	thumb_func_end sub_812F724

	thumb_func_start sub_812F76C
sub_812F76C: @ 812FAE8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _0812FB40 @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x14
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _0812FB4C
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812FB5C
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _0812FB4C
	ldr r2, _0812FB44 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0812FB48 @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _0812FB5C
	.align 2, 0
_0812FB40: .4byte gTasks
_0812FB44: .4byte gSprites
_0812FB48: .4byte 0x0000ffff
_0812FB4C:
	ldr r2, _0812FB7C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_0812FB5C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _0812FB74
	adds r0, r4, 0
	bl move_anim_task_del
_0812FB74:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812FB7C: .4byte gSprites
	thumb_func_end sub_812F76C

	thumb_func_start sub_812F804
sub_812F804: @ 812FB80
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r2, 0
	adds r0, r3, 0
	ldr r4, [sp, 0x14]
	ldr r6, [sp, 0x18]
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r2, r8
	strh r1, [r2, 0x20]
	strh r5, [r2, 0x22]
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 4
	mov r3, r8
	strh r2, [r3, 0x36]
	lsls r5, 16
	asrs r5, 16
	lsls r2, r5, 4
	strh r2, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x3A]
	lsls r4, 16
	asrs r4, 16
	subs r4, r5
	lsls r4, 4
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_812F804

	thumb_func_start sub_812F86C
sub_812F86C: @ 812FBE8
	ldrh r1, [r0, 0x3A]
	ldrh r2, [r0, 0x36]
	adds r1, r2
	strh r1, [r0, 0x36]
	ldrh r2, [r0, 0x3C]
	ldrh r3, [r0, 0x38]
	adds r2, r3
	strh r2, [r0, 0x38]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r0, 0x20]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r0, 0x22]
	bx lr
	thumb_func_end sub_812F86C

	thumb_func_start sub_812F88C
sub_812F88C: @ 812FC08
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrh r6, [r4, 0x20]
	ldrh r5, [r4, 0x22]
	bl sub_8078650
	ldr r0, _0812FC50 @ =gUnknown_03004B00
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x22
	ldrsh r2, [r4, r0]
	lsls r6, 16
	asrs r6, 16
	lsls r5, 16
	asrs r5, 16
	str r5, [sp]
	movs r0, 0x40
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r3, r6, 0
	bl sub_812F804
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _0812FC54 @ =sub_812F8DC
	str r0, [r4, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812FC50: .4byte gUnknown_03004B00
_0812FC54: .4byte sub_812F8DC
	thumb_func_end sub_812F88C

	thumb_func_start sub_812F8DC
sub_812F8DC: @ 812FC58
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 3
	movs r0, 0xFF
	ands r4, r0
	adds r0, r5, 0
	bl sub_812F86C
	adds r0, r4, 0
	movs r1, 0x8
	bl Sin
	strh r0, [r5, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x3A
	ble _0812FCBE
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0812FCBE
	movs r0, 0
	strh r0, [r5, 0x30]
	ldrh r1, [r5, 0x32]
	adds r1, 0x1
	strh r1, [r5, 0x32]
	movs r0, 0x1
	ands r1, r0
	adds r3, r5, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x3
	ble _0812FCBE
	adds r0, r5, 0
	bl move_anim_8074EE0
_0812FCBE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812F8DC

	thumb_func_start sub_812F948
sub_812F948: @ 812FCC4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _0812FD1C @ =gUnknown_03004B00
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldrb r1, [r6]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldr r0, _0812FD20 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0812FCEA
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
_0812FCEA:
	ldr r4, _0812FD24 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldr r0, _0812FD28 @ =sub_80DA48C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812FD1C: .4byte gUnknown_03004B00
_0812FD20: .4byte gUnknown_0202F7C9
_0812FD24: .4byte gUnknown_0202F7C8
_0812FD28: .4byte sub_80DA48C
	thumb_func_end sub_812F948

	thumb_func_start sub_812F9B0
sub_812F9B0: @ 812FD2C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r2, _0812FD7C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _0812FDAE
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812FDAE
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _0812FD80
	ldrh r0, [r3, 0x10]
	strh r0, [r3, 0x1A]
	negs r0, r0
	strh r0, [r3, 0x10]
	b _0812FD82
	.align 2, 0
_0812FD7C: .4byte gTasks
_0812FD80:
	strh r7, [r3, 0x1A]
_0812FD82:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0812FD9E
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x1C]
	negs r0, r0
	strh r0, [r1, 0x12]
	b _0812FDA2
_0812FD9E:
	movs r0, 0
	strh r0, [r1, 0x1C]
_0812FDA2:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0xA]
_0812FDAE:
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldrh r6, [r4, 0x16]
	ldrh r7, [r4, 0x18]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	beq _0812FDEC
	ldr r3, _0812FDE8 @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsrs r2, r6, 8
	ldrh r0, [r4, 0x1A]
	subs r0, r2
	strh r0, [r1, 0x24]
	adds r2, r3, 0
	b _0812FE02
	.align 2, 0
_0812FDE8: .4byte gSprites
_0812FDEC:
	ldr r2, _0812FE30 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	lsrs r1, r6, 8
	ldrh r4, [r4, 0x1A]
	adds r1, r4
	strh r1, [r0, 0x24]
_0812FE02:
	mov r1, r12
	adds r0, r1, r5
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0812FE34
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r2, r7, 8
	ldrh r0, [r4, 0x1C]
	subs r0, r2
	b _0812FE46
	.align 2, 0
_0812FE30: .4byte gSprites
_0812FE34:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r0, r7, 8
	ldrh r4, [r4, 0x1C]
	adds r0, r4
_0812FE46:
	strh r0, [r1, 0x26]
	mov r2, r12
	adds r0, r2, r5
	lsls r0, 3
	add r0, r8
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bgt _0812FE66
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _0812FE70 @ =gUnknown_0202F7B2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0812FE66:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FE70: .4byte gUnknown_0202F7B2
	thumb_func_end sub_812F9B0

	thumb_func_start sub_812FAF8
sub_812FAF8: @ 812FE74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r2, _0812FEC8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _0812FEFA
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0812FEFA
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _0812FECC
	ldrh r0, [r3, 0x10]
	strh r0, [r3, 0x1A]
	negs r0, r0
	strh r0, [r3, 0x10]
	b _0812FECE
	.align 2, 0
_0812FEC8: .4byte gTasks
_0812FECC:
	strh r7, [r3, 0x1A]
_0812FECE:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0x1C
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0812FEEA
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x1C]
	negs r0, r0
	strh r0, [r1, 0x12]
	b _0812FEEE
_0812FEEA:
	movs r0, 0
	strh r0, [r1, 0x1C]
_0812FEEE:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0xA]
_0812FEFA:
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldrh r2, [r4, 0xC]
	ldr r1, _0812FF4C @ =0x00007fff
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x16]
	adds r0, r2
	lsls r5, r0, 16
	lsrs r0, r5, 16
	mov r9, r0
	ldrh r0, [r4, 0xE]
	ands r1, r0
	ldrh r2, [r4, 0x18]
	adds r1, r2
	lsls r1, 16
	lsrs r7, r1, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	mov r12, r3
	cmp r0, 0
	beq _0812FF54
	ldr r3, _0812FF50 @ =gSprites
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsrs r2, r5, 24
	ldrh r0, [r4, 0x1A]
	subs r0, r2
	strh r0, [r1, 0x24]
	adds r2, r3, 0
	b _0812FF6A
	.align 2, 0
_0812FF4C: .4byte 0x00007fff
_0812FF50: .4byte gSprites
_0812FF54:
	ldr r2, _0812FF98 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	lsrs r1, r5, 24
	ldrh r4, [r4, 0x1A]
	adds r1, r4
	strh r1, [r0, 0x24]
_0812FF6A:
	mov r1, r12
	adds r0, r1, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _0812FF9C
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r2, r7, 8
	ldrh r0, [r4, 0x1C]
	subs r0, r2
	b _0812FFAE
	.align 2, 0
_0812FF98: .4byte gSprites
_0812FF9C:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsrs r0, r7, 8
	ldrh r4, [r4, 0x1C]
	adds r0, r4
_0812FFAE:
	strh r0, [r1, 0x26]
	mov r2, r12
	adds r0, r2, r6
	lsls r0, 3
	mov r1, r8
	adds r2, r0, r1
	mov r0, r9
	strh r0, [r2, 0x16]
	strh r7, [r2, 0x18]
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bgt _0812FFD4
	movs r0, 0x1E
	strh r0, [r2, 0x8]
	movs r0, 0
	strh r0, [r2, 0x22]
	ldr r0, _0812FFE0 @ =sub_812F9B0
	str r0, [r2]
_0812FFD4:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812FFE0: .4byte sub_812F9B0
	thumb_func_end sub_812FAF8

	thumb_func_start sub_812FC68
sub_812FC68: @ 812FFE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08130044 @ =gTasks
	mov r8, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r1, r8
	adds r4, r0, r1
	ldr r1, _08130048 @ =gUnknown_02024BE0
	ldr r2, _0813004C @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x26]
	ldr r5, _08130050 @ =gUnknown_03004B00
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x22]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08130028
	ldrh r0, [r4, 0x14]
	ldr r3, _08130054 @ =0xffff8000
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r4, 0x14]
_08130028:
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08130058
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xE]
	mov r3, r8
	adds r4, r7, 0
	b _081300C8
	.align 2, 0
_08130044: .4byte gTasks
_08130048: .4byte gUnknown_02024BE0
_0813004C: .4byte gUnknown_0202F7C8
_08130050: .4byte gUnknown_03004B00
_08130054: .4byte 0xffff8000
_08130058:
	movs r7, 0x2
	ldrsh r0, [r5, r7]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _08130074
	ldrh r1, [r5, 0x2]
	ldr r0, _08130070 @ =0x00007fff
	ands r0, r1
	b _0813007C
	.align 2, 0
_08130070: .4byte 0x00007fff
_08130074:
	ldrh r0, [r5, 0x2]
	ldr r2, _081300A4 @ =0xffff8000
	adds r1, r2, 0
	orrs r0, r1
_0813007C:
	strh r0, [r4, 0xC]
	ldr r0, _081300A8 @ =gUnknown_03004B00
	movs r3, 0x4
	ldrsh r1, [r0, r3]
	movs r2, 0x80
	lsls r2, 8
	ands r1, r2
	adds r5, r0, 0
	cmp r1, 0
	beq _081300B4
	ldr r3, _081300AC @ =gTasks
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r0, _081300B0 @ =0x00007fff
	ands r0, r2
	b _081300C6
	.align 2, 0
_081300A4: .4byte 0xffff8000
_081300A8: .4byte gUnknown_03004B00
_081300AC: .4byte gTasks
_081300B0: .4byte 0x00007fff
_081300B4:
	ldr r3, _081300EC @ =gTasks
	lsls r4, r6, 2
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r3
	ldrh r2, [r5, 0x4]
	ldr r7, _081300F0 @ =0xffff8000
	adds r0, r7, 0
	orrs r0, r2
_081300C6:
	strh r0, [r1, 0xE]
_081300C8:
	adds r0, r4, r6
	lsls r0, 3
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x18]
	strh r1, [r0, 0x16]
	ldrh r1, [r5, 0x8]
	strh r1, [r0, 0x10]
	ldrh r1, [r5, 0xA]
	strh r1, [r0, 0x12]
	ldr r1, _081300F4 @ =sub_812FAF8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081300EC: .4byte gTasks
_081300F0: .4byte 0xffff8000
_081300F4: .4byte sub_812FAF8
	thumb_func_end sub_812FC68

	thumb_func_start sub_812FD7C
sub_812FD7C: @ 81300F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08130130 @ =gTasks
	adds r5, r0, r1
	ldr r4, _08130134 @ =gUnknown_03004B00
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08130118
	adds r0, r2, 0
	bl move_anim_task_del
_08130118:
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0xE]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813013C
	ldr r0, _08130138 @ =gUnknown_0202F7C8
	b _0813013E
	.align 2, 0
_08130130: .4byte gTasks
_08130134: .4byte gUnknown_03004B00
_08130138: .4byte gUnknown_0202F7C8
_0813013C:
	ldr r0, _0813018C @ =gUnknown_0202F7C9
_0813013E:
	ldrb r4, [r0]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	adds r0, r4, 0
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldr r0, _08130190 @ =gUnknown_03004B00
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r5, 0x26]
	ldr r2, _08130194 @ =gUnknown_084028AC
	adds r0, r5, 0
	bl sub_80798F4
	ldr r0, _08130198 @ =sub_812FE20
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813018C: .4byte gUnknown_0202F7C9
_08130190: .4byte gUnknown_03004B00
_08130194: .4byte gUnknown_084028AC
_08130198: .4byte sub_812FE20
	thumb_func_end sub_812FD7C

	thumb_func_start sub_812FE20
sub_812FE20: @ 813019C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081301BC @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081301C0
	cmp r0, 0x1
	beq _08130220
	b _0813022E
	.align 2, 0
_081301BC: .4byte gTasks
_081301C0:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _081301D6
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_812FEB8
_081301D6:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bne _081301E6
	adds r0, r5, 0
	movs r1, 0
	bl sub_812FEB8
_081301E6:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0813022E
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _08130208
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0813022E
_08130208:
	strh r1, [r4, 0xA]
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0813021C @ =gUnknown_084028AC
	adds r0, r4, 0
	bl sub_80798F4
	b _0813022E
	.align 2, 0
_0813021C: .4byte gUnknown_084028AC
_08130220:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0813022E
	adds r0, r5, 0
	bl move_anim_task_del
_0813022E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_812FE20

	thumb_func_start sub_812FEB8
sub_812FEB8: @ 8130234
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r2, _08130258 @ =gTasks
	adds r4, r0, r2
	cmp r1, 0
	bne _0813025C
	movs r1, 0x12
	movs r3, 0xEC
	b _08130260
	.align 2, 0
_08130258: .4byte gTasks
_0813025C:
	movs r1, 0x1E
	movs r3, 0x14
_08130260:
	mov r2, sp
	ldrh r0, [r4, 0x10]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x10]
	subs r0, r1
	subs r0, 0x4
	strh r0, [r2, 0x2]
	ldrh r0, [r4, 0x10]
	adds r0, r1
	strh r0, [r2, 0x4]
	ldrh r0, [r4, 0x10]
	adds r0, r1
	adds r0, 0x4
	strh r0, [r2, 0x6]
	add r2, sp, 0x8
	lsls r1, r3, 24
	asrs r1, 24
	ldrh r0, [r4, 0x12]
	adds r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x12]
	adds r0, r1
	adds r0, 0x6
	strh r0, [r2, 0x2]
	movs r5, 0
	mov r8, r2
	ldr r7, _08130304 @ =gSprites
_08130298:
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	ands r0, r5
	lsls r0, 1
	add r0, r8
	movs r3, 0
	ldrsh r2, [r0, r3]
	ldrb r3, [r4, 0x14]
	subs r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08130308 @ =gSpriteTemplate_84028CC
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _081302EC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r7
	movs r0, 0
	strh r0, [r1, 0x2E]
	movs r0, 0x2
	cmp r5, 0x1
	bhi _081302DA
	movs r2, 0x2
	negs r2, r2
	adds r0, r2, 0
_081302DA:
	strh r0, [r1, 0x30]
	ldr r0, _0813030C @ =0x0000ffff
	strh r0, [r1, 0x32]
	strh r6, [r1, 0x34]
	movs r0, 0x2
	strh r0, [r1, 0x36]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_081302EC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08130298
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08130304: .4byte gSprites
_08130308: .4byte gSpriteTemplate_84028CC
_0813030C: .4byte 0x0000ffff
	thumb_func_end sub_812FEB8

	thumb_func_start sub_812FF94
sub_812FF94: @ 8130310
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _08130356
	ldr r3, _0813035C @ =gTasks
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x34
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_08130356:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813035C: .4byte gTasks
	thumb_func_end sub_812FF94

	thumb_func_start sub_812FFE4
sub_812FFE4: @ 8130360
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081303A8 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r1, _081303AC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081303B0 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	adds r0, r1
	strh r0, [r4, 0xC]
	ldr r0, _081303B4 @ =sub_813003C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081303A8: .4byte gTasks
_081303AC: .4byte gUnknown_03004B00
_081303B0: .4byte gSprites
_081303B4: .4byte sub_813003C
	thumb_func_end sub_812FFE4

	thumb_func_start sub_813003C
sub_813003C: @ 81303B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08130400 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08130408
	ldrh r0, [r4, 0xC]
	ldr r2, _08130404 @ =gUnknown_084028E4
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r1, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x8
	bl BlendPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _081303F8
	movs r0, 0
	strh r0, [r4, 0x8]
_081303F8:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _0813041A
	.align 2, 0
_08130400: .4byte gTasks
_08130404: .4byte gUnknown_084028E4
_08130408:
	ldrh r0, [r4, 0xC]
	movs r1, 0x10
	movs r2, 0
	movs r3, 0
	bl BlendPalette
	adds r0, r5, 0
	bl move_anim_task_del
_0813041A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813003C

	thumb_func_start sub_81300A4
sub_81300A4: @ 8130420
	push {lr}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xD0
	lsls r2, 1
	ldr r1, _0813045C @ =gUnknown_0202F7C8
	ldrb r3, [r1]
	ldr r1, _08130460 @ =gUnknown_03004B00
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0x2
	str r1, [sp, 0x8]
	movs r1, 0x1E
	str r1, [sp, 0xC]
	ldr r1, _08130464 @ =gUnknown_08D2E014
	str r1, [sp, 0x10]
	ldr r1, _08130468 @ =gUnknown_08D2E170
	str r1, [sp, 0x14]
	ldr r1, _0813046C @ =gUnknown_08D2E150
	str r1, [sp, 0x18]
	movs r1, 0
	bl sub_80E3C4C
	add sp, 0x1C
	pop {r0}
	bx r0
	.align 2, 0
_0813045C: .4byte gUnknown_0202F7C8
_08130460: .4byte gUnknown_03004B00
_08130464: .4byte gUnknown_08D2E014
_08130468: .4byte gUnknown_08D2E170
_0813046C: .4byte gUnknown_08D2E150
	thumb_func_end sub_81300A4

	thumb_func_start sub_81300F4
sub_81300F4: @ 8130470
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _081304C8 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0813048C
	ldr r1, _081304CC @ =gUnknown_03004B00
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_0813048C:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _081304CC @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081304D4
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
	ldr r0, _081304D0 @ =0x0000fd80
	strh r0, [r5, 0x30]
	b _081304FC
	.align 2, 0
_081304C8: .4byte gUnknown_0202F7C8
_081304CC: .4byte gUnknown_03004B00
_081304D0: .4byte 0x0000fd80
_081304D4:
	cmp r0, 0x1
	bne _081304EE
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	b _081304FC
_081304EE:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0xA0
	lsls r0, 2
	strh r0, [r5, 0x2E]
_081304FC:
	ldr r0, _08130528 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0813051C
	ldrh r0, [r5, 0x2E]
	negs r0, r0
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_0813051C:
	ldr r0, _0813052C @ =sub_81301B4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130528: .4byte gUnknown_0202F7C8
_0813052C: .4byte sub_81301B4
	thumb_func_end sub_81300F4

	thumb_func_start sub_81301B4
sub_81301B4: @ 8130530
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x3A]
	adds r0, r1
	strh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x3C]
	adds r1, r3
	strh r1, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	ldrh r0, [r2, 0x38]
	adds r0, 0x1
	strh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bne _08130564
	adds r0, r2, 0
	bl move_anim_8072740
_08130564:
	pop {r0}
	bx r0
	thumb_func_end sub_81301B4

	thumb_func_start sub_81301EC
sub_81301EC: @ 8130568
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08130594 @ =gTasks
	adds r6, r1, r0
	bl sub_8076BE0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08130598
	movs r0, 0x8
	strh r0, [r6, 0x12]
	movs r0, 0x3
	strh r0, [r6, 0x14]
	movs r0, 0x1
	strh r0, [r6, 0x16]
	b _081305A2
	.align 2, 0
_08130594: .4byte gTasks
_08130598:
	movs r0, 0xC
	strh r0, [r6, 0x12]
	movs r0, 0x3
	strh r0, [r6, 0x14]
	strh r1, [r6, 0x16]
_081305A2:
	ldr r5, _081305D8 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _081305DC
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081305D0
	adds r0, 0x3
_081305D0:
	asrs r0, 2
	adds r0, r4, r0
	b _08130600
	.align 2, 0
_081305D8: .4byte gUnknown_0202F7C8
_081305DC:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081305FC
	adds r0, 0x3
_081305FC:
	asrs r0, 2
	subs r0, r4, r0
_08130600:
	strh r0, [r6, 0x1E]
	ldr r5, _08130654 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r4, r0, 0
	ldrb r0, [r5]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08130624
	adds r0, 0x3
_08130624:
	asrs r0, 2
	subs r0, r4, r0
	strh r0, [r6, 0x20]
	ldr r4, _08130658 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x24]
	ldr r0, _0813065C @ =sub_81302E4
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130654: .4byte gUnknown_0202F7C8
_08130658: .4byte gUnknown_0202F7C9
_0813065C: .4byte sub_81302E4
	thumb_func_end sub_81301EC

	thumb_func_start sub_81302E4
sub_81302E4: @ 8130660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08130688 @ =gTasks
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _0813068C
	cmp r1, 0x1
	bne _08130684
	b _08130784
_08130684:
	b _08130792
	.align 2, 0
_08130688: .4byte gTasks
_0813068C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08130792
	strh r1, [r5, 0xA]
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r4, 0x24
	ldrsh r3, [r5, r4]
	ldrb r4, [r5, 0x12]
	str r4, [sp]
	ldrb r4, [r5, 0xC]
	str r4, [sp, 0x4]
	add r4, sp, 0x10
	str r4, [sp, 0x8]
	adds r4, 0x2
	str r4, [sp, 0xC]
	bl sub_8130424
	movs r6, 0
	mov r8, r4
	ldr r4, _08130700 @ =gSprites
_081306C6:
	add r0, sp, 0x10
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _08130704 @ =gSpriteTemplate_840294C
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _0813075A
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0813071A
	cmp r6, 0
	bne _08130708
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	negs r0, r0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x24]
	b _08130742
	.align 2, 0
_08130700: .4byte gSprites
_08130704: .4byte gSpriteTemplate_840294C
_08130708:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x24]
	b _08130742
_0813071A:
	cmp r6, 0
	bne _08130730
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r5, 0x14]
	b _08130740
_08130730:
	lsls r2, r3, 4
	adds r1, r2, r3
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r5, 0x14]
	strh r0, [r1, 0x24]
	ldrh r0, [r5, 0x14]
	negs r0, r0
_08130740:
	strh r0, [r1, 0x26]
_08130742:
	ldr r1, _08130780 @ =gSprites
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r7, [r0, 0x30]
	movs r1, 0xA
	strh r1, [r0, 0x32]
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
_0813075A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bls _081306C6
	ldrh r2, [r5, 0xC]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	movs r4, 0x12
	ldrsh r0, [r5, r4]
	cmp r1, r0
	bne _08130778
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08130778:
	adds r0, r2, 0x1
	strh r0, [r5, 0xC]
	b _08130792
	.align 2, 0
_08130780: .4byte gSprites
_08130784:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08130792
	adds r0, r7, 0
	bl move_anim_task_del
_08130792:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81302E4

	thumb_func_start sub_8130424
sub_8130424: @ 81307A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	ldr r6, [sp, 0x34]
	mov r10, r6
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	adds r7, r2, 0
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x4]
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r8, r5
	cmp r5, 0
	bne _081307E8
	mov r2, r9
	strh r0, [r2]
	mov r6, r10
	strh r1, [r6]
	b _08130846
_081307E8:
	cmp r5, r6
	bcc _081307F6
	mov r0, r9
	strh r2, [r0]
	mov r1, r10
	strh r3, [r1]
	b _08130846
_081307F6:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r2, r12
	lsls r1, r2, 16
	asrs r1, 16
	lsls r5, r1, 8
	lsls r0, r7, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 8
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r5, r0
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, r1, 8
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 8
	adds r1, r6, 0
	bl __divsi3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	adds r4, r0
	asrs r5, 8
	mov r0, r9
	strh r5, [r0]
	asrs r4, 8
	mov r1, r10
	strh r4, [r1]
_08130846:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8130424

	thumb_func_start sub_81304DC
sub_81304DC: @ 8130858
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x24
	ble _0813088E
	ldr r3, _08130894 @ =gTasks
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_0813088E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130894: .4byte gTasks
	thumb_func_end sub_81304DC

	thumb_func_start sub_813051C
sub_813051C: @ 8130898
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _081308C4 @ =gUnknown_03004B00
	ldrh r0, [r1]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _081308C8 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _081308CC @ =sub_8078CC0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081308C4: .4byte gUnknown_03004B00
_081308C8: .4byte move_anim_8072740
_081308CC: .4byte sub_8078CC0
	thumb_func_end sub_813051C

	thumb_func_start sub_8130554
sub_8130554: @ 81308D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	ldr r1, _081309F0 @ =gTasks
	adds r7, r0, r1
	ldr r0, _081309F4 @ =gUnknown_0202F7C8
	mov r10, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x1E]
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x20]
	ldr r0, _081309F8 @ =gUnknown_0202F7C9
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
	adds r4, r0, 0
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08130942
	adds r0, 0x3
_08130942:
	asrs r0, 2
	adds r0, r4, r0
	strh r0, [r7, 0x24]
	ldr r4, _081309FC @ =gSpriteTemplate_84029AC
	movs r0, 0x1E
	ldrsh r5, [r7, r0]
	movs r1, 0x20
	ldrsh r6, [r7, r1]
	mov r1, r8
	ldrb r0, [r1]
	bl sub_8079E90
	adds r3, r0, 0
	subs r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x26]
	cmp r0, 0x40
	beq _08130A0C
	ldr r4, _08130A00 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r7, 0x22]
	strh r1, [r0, 0x32]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r7, 0x24]
	strh r1, [r0, 0x36]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08130A04 @ =0x0000ffe0
	strh r1, [r0, 0x38]
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80786EC
	mov r1, r10
	ldrb r0, [r1]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081309EA
	movs r0, 0x26
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
_081309EA:
	ldr r0, _08130A08 @ =sub_81306A4
	str r0, [r7]
	b _08130A12
	.align 2, 0
_081309F0: .4byte gTasks
_081309F4: .4byte gUnknown_0202F7C8
_081309F8: .4byte gUnknown_0202F7C9
_081309FC: .4byte gSpriteTemplate_84029AC
_08130A00: .4byte gSprites
_08130A04: .4byte 0x0000ffe0
_08130A08: .4byte sub_81306A4
_08130A0C:
	mov r0, r9
	bl move_anim_task_del
_08130A12:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8130554

	thumb_func_start sub_81306A4
sub_81306A4: @ 8130A20
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _08130A44 @ =gTasks
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _08130A88
	cmp r1, 0x1
	bgt _08130A48
	cmp r1, 0
	beq _08130A52
	b _08130B26
	.align 2, 0
_08130A44: .4byte gTasks
_08130A48:
	cmp r1, 0x2
	beq _08130AAC
	cmp r1, 0x3
	beq _08130B20
	b _08130B26
_08130A52:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08130B26
	strh r1, [r4, 0xA]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08130A84 @ =gSprites
	adds r0, r1
	bl sub_8078718
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08130B26
	b _08130B12
	.align 2, 0
_08130A84: .4byte gSprites
_08130A88:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08130AA8 @ =gSprites
	adds r0, r1
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _08130B26
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _08130B12
	.align 2, 0
_08130AA8: .4byte gSprites
_08130AAC:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08130B26
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldr r5, _08130B1C @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r0, 0x1
	ands r2, r0
	adds r1, 0x3E
	lsls r2, 2
	ldrb r3, [r1]
	subs r0, 0x6
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _08130B26
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_08130B12:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08130B26
	.align 2, 0
_08130B1C: .4byte gSprites
_08130B20:
	adds r0, r2, 0
	bl move_anim_task_del
_08130B26:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81306A4

	thumb_func_start sub_81307B0
sub_81307B0: @ 8130B2C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _08130B40 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0
	bne _08130B48
	ldr r0, _08130B44 @ =gUnknown_0202F7C8
	b _08130B4A
	.align 2, 0
_08130B40: .4byte gUnknown_03004B00
_08130B44: .4byte gUnknown_0202F7C8
_08130B48:
	ldr r0, _08130BB0 @ =gUnknown_0202F7C9
_08130B4A:
	ldrb r5, [r0]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _08130BB4 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _08130BB8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x3A]
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	movs r1, 0x1
	cmp r0, 0
	bne _08130B78
	movs r3, 0x1
	negs r3, r3
	adds r1, r3, 0
_08130B78:
	strh r1, [r4, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08130BBC
	ldrb r2, [r4, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	subs r0, 0x8
	b _08130BC6
	.align 2, 0
_08130BB0: .4byte gUnknown_0202F7C9
_08130BB4: .4byte 0x000003ff
_08130BB8: .4byte 0xfffffc00
_08130BBC:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	adds r0, 0x8
_08130BC6:
	strh r0, [r4, 0x20]
	ldr r0, _08130BD4 @ =sub_813085C
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08130BD4: .4byte sub_813085C
	thumb_func_end sub_81307B0

	thumb_func_start sub_813085C
sub_813085C: @ 8130BD8
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	cmp r1, 0x1
	beq _08130C20
	cmp r1, 0x1
	bgt _08130BEE
	cmp r1, 0
	beq _08130BF8
	b _08130C90
_08130BEE:
	cmp r1, 0x2
	beq _08130C30
	cmp r1, 0x3
	beq _08130C56
	b _08130C90
_08130BF8:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08130C90
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x3C]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _08130C90
	b _08130C4E
_08130C20:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _08130C90
	b _08130C4A
_08130C30:
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r1, 2
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _08130C90
_08130C4A:
	movs r0, 0
	strh r0, [r2, 0x30]
_08130C4E:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _08130C90
_08130C56:
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _08130C90
	ldrh r0, [r2, 0x3A]
	subs r0, 0x1
	strh r0, [r2, 0x3A]
	lsls r0, 16
	cmp r0, 0
	beq _08130C8A
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	b _08130C90
_08130C8A:
	adds r0, r2, 0
	bl move_anim_8072740
_08130C90:
	pop {r0}
	bx r0
	thumb_func_end sub_813085C

	thumb_func_start sub_8130918
sub_8130918: @ 8130C94
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _08130CAC @ =gUnknown_03004B00
	movs r3, 0
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _08130CB0
	adds r0, r1, 0
	bl move_anim_task_del
	b _08130CD8
	.align 2, 0
_08130CAC: .4byte gUnknown_03004B00
_08130CB0:
	ldr r0, _08130CE0 @ =gTasks
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x8]
	ldrb r0, [r2]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _08130CE4 @ =gUnknown_084029DC
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _08130CE8 @ =sub_8130970
	str r0, [r4]
_08130CD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08130CE0: .4byte gTasks
_08130CE4: .4byte gUnknown_084029DC
_08130CE8: .4byte sub_8130970
	thumb_func_end sub_8130918

	thumb_func_start sub_8130970
sub_8130970: @ 8130CEC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08130D2C @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08130D46
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08130D34
	ldr r2, _08130D30 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	b _08130D44
	.align 2, 0
_08130D2C: .4byte gTasks
_08130D30: .4byte gSprites
_08130D34:
	ldr r2, _08130D8C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08130D90 @ =0x0000fffe
_08130D44:
	strh r1, [r0, 0x24]
_08130D46:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08130DA2
	ldr r2, _08130D8C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	cmp r0, 0
	beq _08130D9C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08130D94 @ =gTasks
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08130D98 @ =gUnknown_084029DC
	bl sub_80798F4
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	b _08130DA2
	.align 2, 0
_08130D8C: .4byte gSprites
_08130D90: .4byte 0x0000fffe
_08130D94: .4byte gTasks
_08130D98: .4byte gUnknown_084029DC
_08130D9C:
	adds r0, r6, 0
	bl move_anim_task_del
_08130DA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8130970

	thumb_func_start sub_8130A2C
sub_8130A2C: @ 8130DA8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08130DBC @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130DC4
	ldr r4, _08130DC0 @ =gUnknown_0202F7C8
	b _08130DC6
	.align 2, 0
_08130DBC: .4byte gUnknown_03004B00
_08130DC0: .4byte gUnknown_0202F7C8
_08130DC4:
	ldr r4, _08130E04 @ =gUnknown_0202F7C9
_08130DC6:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r5, 0x22]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	cmp r0, 0x7
	bgt _08130DEA
	movs r0, 0x8
	strh r0, [r5, 0x22]
_08130DEA:
	movs r2, 0
	strh r2, [r5, 0x2E]
	ldr r1, _08130E08 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x30]
	strh r2, [r5, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x34]
	ldr r0, _08130E0C @ =sub_8130A94
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08130E04: .4byte gUnknown_0202F7C9
_08130E08: .4byte gUnknown_03004B00
_08130E0C: .4byte sub_8130A94
	thumb_func_end sub_8130A2C

	thumb_func_start sub_8130A94
sub_8130A94: @ 8130E10
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _08130E64
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x32]
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x32]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r1, 2
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _08130E64
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _08130E64
	adds r0, r3, 0
	bl move_anim_8072740
_08130E64:
	pop {r0}
	bx r0
	thumb_func_end sub_8130A94

	thumb_func_start sub_8130AEC
sub_8130AEC: @ 8130E68
	push {lr}
	adds r3, r0, 0
	ldr r0, _08130E94 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08130E98
	ldrb r2, [r3, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	movs r0, 0x64
	strh r0, [r3, 0x20]
	movs r0, 0x1
	b _08130E9E
	.align 2, 0
_08130E94: .4byte gUnknown_03004B00
_08130E98:
	movs r0, 0x8C
	strh r0, [r3, 0x20]
	ldr r0, _08130EAC @ =0x0000ffff
_08130E9E:
	strh r0, [r3, 0x3C]
	movs r0, 0x38
	strh r0, [r3, 0x22]
	ldr r0, _08130EB0 @ =sub_8130B38
	str r0, [r3, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08130EAC: .4byte 0x0000ffff
_08130EB0: .4byte sub_8130B38
	thumb_func_end sub_8130AEC

	thumb_func_start sub_8130B38
sub_8130B38: @ 8130EB4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bls _08130EC2
	b _08131094
_08130EC2:
	lsls r0, 2
	ldr r1, _08130ECC @ =_08130ED0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08130ECC: .4byte _08130ED0
	.align 2, 0
_08130ED0:
	.4byte _08130EF4
	.4byte _08130F26
	.4byte _08130F38
	.4byte _08130F78
	.4byte _08130F8A
	.4byte _08130FC8
	.4byte _0813102C
	.4byte _0813104C
	.4byte _08131072
_08130EF4:
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	lsls r0, 1
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r2, [r4, 0x30]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _08130F16
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
_08130F16:
	adds r0, r2, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	beq _08130F24
	b _08131094
_08130F24:
	b _08131066
_08130F26:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _08130F36
	b _08131094
_08130F36:
	b _08131066
_08130F38:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r3, 0x3C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _08130F74 @ =gSineTable
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xC
	beq _08130F70
	b _08131094
_08130F70:
	b _08131066
	.align 2, 0
_08130F74: .4byte gSineTable
_08130F78:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	beq _08130F88
	b _08131094
_08130F88:
	b _08131066
_08130F8A:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x22]
	subs r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _08130FC4 @ =gSineTable
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xC
	bne _08131094
	b _0813106A
	.align 2, 0
_08130FC4: .4byte gSineTable
_08130FC8:
	ldrh r2, [r4, 0x30]
	adds r2, 0x1
	strh r2, [r4, 0x30]
	movs r3, 0x3C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r3, _08131020 @ =gSineTable
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x3C]
	muls r0, r1
	strh r0, [r4, 0x24]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0xF
	bne _08131014
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _08131024 @ =0x000003ff
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _08131028 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
_08131014:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bne _08131094
	b _08131066
	.align 2, 0
_08131020: .4byte gSineTable
_08131024: .4byte 0x000003ff
_08131028: .4byte 0xfffffc00
_0813102C:
	movs r3, 0x3C
	ldrsh r0, [r4, r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _08131094
	b _08131066
_0813104C:
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 1
	ldrh r3, [r4, 0x20]
	adds r0, r3
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _08131094
_08131066:
	movs r0, 0
	strh r0, [r4, 0x30]
_0813106A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08131094
_08131072:
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x20]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08131094
	adds r0, r4, 0
	bl move_anim_8072740
_08131094:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8130B38

	thumb_func_start sub_8130D20
sub_8130D20: @ 813109C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _081310F8 @ =gTasks
	adds r6, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08131124
	bl battle_type_is_double
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1
	bne _08131108
	ldr r5, _081310FC @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _08131100
	strh r7, [r6, 0x24]
	b _08131128
	.align 2, 0
_081310F8: .4byte gTasks
_081310FC: .4byte gUnknown_0202F7C8
_08131100:
	ldr r0, _08131104 @ =0x0000ffff
	b _08131126
	.align 2, 0
_08131104: .4byte 0x0000ffff
_08131108:
	ldr r0, _0813111C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131124
	ldr r0, _08131120 @ =0x0000ffff
	b _08131126
	.align 2, 0
_0813111C: .4byte gUnknown_0202F7C8
_08131120: .4byte 0x0000ffff
_08131124:
	movs r0, 0x1
_08131126:
	strh r0, [r6, 0x24]
_08131128:
	ldr r0, _08131134 @ =sub_8130DBC
	str r0, [r6]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131134: .4byte sub_8130DBC
	thumb_func_end sub_8130D20

	thumb_func_start sub_8130DBC
sub_8130DBC: @ 8131138
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0813115C @ =gTasks
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x8
	bls _08131152
	b _081312CC
_08131152:
	lsls r0, 2
	ldr r1, _08131160 @ =_08131164
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813115C: .4byte gTasks
_08131160: .4byte _08131164
	.align 2, 0
_08131164:
	.4byte _08131188
	.4byte _0813119A
	.4byte _081311CC
	.4byte _081311FC
	.4byte _08131222
	.4byte _0813124C
	.4byte _0813125C
	.4byte _0813127C
	.4byte _081312B4
_08131188:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	beq _08131198
	b _081312CC
_08131198:
	b _081312A4
_0813119A:
	ldr r2, _081311C8 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	lsls r2, r0, 1
	adds r2, r0
	ldrh r0, [r1, 0x24]
	subs r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	beq _081311C6
	b _081312CC
_081311C6:
	b _081312A4
	.align 2, 0
_081311C8: .4byte gSprites
_081311CC:
	ldr r2, _081311F8 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x24
	ldrsh r2, [r3, r0]
	lsls r0, r2, 1
	adds r0, r2
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _081312CC
	b _081312A4
	.align 2, 0
_081311F8: .4byte gSprites
_081311FC:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _081312CC
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r2, 0xC
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bne _081312A8
	adds r0, r1, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0x1
	strh r0, [r3, 0x8]
	b _081312CC
_08131222:
	ldr r2, _08131248 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x24]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _081312CC
	b _081312A4
	.align 2, 0
_08131248: .4byte gSprites
_0813124C:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _081312CC
	b _081312A4
_0813125C:
	ldr r2, _08131278 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x24
	ldrsh r2, [r3, r0]
	lsls r2, 2
	ldrh r0, [r1, 0x24]
	subs r0, r2
	b _08131294
	.align 2, 0
_08131278: .4byte gSprites
_0813127C:
	ldr r2, _081312B0 @ =gSprites
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	lsls r0, 2
	ldrh r2, [r1, 0x24]
	adds r0, r2
_08131294:
	strh r0, [r1, 0x24]
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _081312CC
_081312A4:
	movs r0, 0
	strh r0, [r3, 0xA]
_081312A8:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _081312CC
	.align 2, 0
_081312B0: .4byte gSprites
_081312B4:
	ldr r2, _081312D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_task_del
_081312CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081312D4: .4byte gSprites
	thumb_func_end sub_8130DBC

	thumb_func_start sub_8130F5C
sub_8130F5C: @ 81312D8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081312F4 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _081312FC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _081312F8 @ =gUnknown_0202F7C8
	b _081312FE
	.align 2, 0
_081312F4: .4byte gUnknown_03004B00
_081312F8: .4byte gUnknown_0202F7C8
_081312FC:
	ldr r0, _08131354 @ =gUnknown_0202F7C9
_081312FE:
	ldrb r0, [r0]
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08131322
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
_08131322:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079ED4
	movs r2, 0x3
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0x1]
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldr r0, _08131358 @ =sub_8130FE0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131354: .4byte gUnknown_0202F7C9
_08131358: .4byte sub_8130FE0
	thumb_func_end sub_8130F5C

	thumb_func_start sub_8130FE0
sub_8130FE0: @ 813135C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _0813136A
	b _0813155A
_0813136A:
	lsls r0, 2
	ldr r1, _08131374 @ =_08131378
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131374: .4byte _08131378
	.align 2, 0
_08131378:
	.4byte _0813138C
	.4byte _0813148C
	.4byte _081314F4
	.4byte _08131508
	.4byte _08131554
_0813138C:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bhi _081313BC
	lsls r0, 2
	ldr r1, _081313A0 @ =_081313A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081313A0: .4byte _081313A4
	.align 2, 0
_081313A4:
	.4byte _081313C0
	.4byte _081313DC
	.4byte _081313FE
	.4byte _0813141A
	.4byte _081313C0
	.4byte _08131440
_081313BC:
	movs r0, 0
	strh r0, [r4, 0x3A]
_081313C0:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	b _08131434
_081313DC:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x4
	b _0813143A
_081313FE:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	b _08131434
_0813141A:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
_08131434:
	bl sub_807A100
	subs r0, 0x4
_0813143A:
	lsls r0, 16
	lsrs r1, r0, 16
	b _08131460
_08131440:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r1, r0, 24
_08131460:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	bne _0813146C
	movs r0, 0x18
	b _08131476
_0813146C:
	cmp r0, 0x5
	bne _08131474
	movs r0, 0x6
	b _08131476
_08131474:
	movs r0, 0xC
_08131476:
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	b _08131546
_0813148C:
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _0813155A
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	beq _081314C4
	cmp r0, 0x5
	beq _081314E4
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _081314DC
_081314C4:
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x38]
_081314DC:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	b _0813155A
_081314E4:
	movs r0, 0
	strh r0, [r4, 0x2E]
	movs r1, 0x10
	strh r1, [r4, 0x30]
	strh r0, [r4, 0x32]
	movs r0, 0x3
	strh r0, [r4, 0x38]
	b _0813155A
_081314F4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _0813155A
	movs r0, 0
	strh r0, [r4, 0x38]
	b _0813155A
_08131508:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0813151A
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	b _08131520
_0813151A:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
_08131520:
	ldr r2, _08131550 @ =0x04000052
	ldrh r0, [r4, 0x32]
	lsls r0, 8
	ldrh r1, [r4, 0x30]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _0813155A
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08131546:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _0813155A
	.align 2, 0
_08131550: .4byte 0x04000052
_08131554:
	adds r0, r4, 0
	bl move_anim_8072740
_0813155A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8130FE0

	thumb_func_start sub_81311E4
sub_81311E4: @ 8131560
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	muls r0, r1
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r5, r0, 0
	strh r5, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	muls r0, r1
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	adds r3, r0, 0
	strh r3, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081315BE
	ldr r0, _081315DC @ =gSpriteTemplate_8402500
	ldrh r1, [r4, 0x20]
	adds r1, r5
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x22]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x5
	bl CreateSprite
_081315BE:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081315D0
	adds r0, r4, 0
	bl move_anim_8072740
_081315D0:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081315DC: .4byte gSpriteTemplate_8402500
	thumb_func_end sub_81311E4

	thumb_func_start sub_8131264
sub_8131264: @ 81315E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0813161C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0813160C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08131624
_0813160C:
	ldr r2, _08131620 @ =gUnknown_03004B00
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	subs r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	subs r1, r0
	b _08131632
	.align 2, 0
_0813161C: .4byte gUnknown_0202F7C9
_08131620: .4byte gUnknown_03004B00
_08131624:
	ldr r2, _08131658 @ =gUnknown_03004B00
	ldrh r1, [r5, 0x20]
	ldrh r0, [r2]
	adds r0, r1, r0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	adds r1, r0
_08131632:
	strh r1, [r5, 0x32]
	adds r3, r2, 0
	ldrh r1, [r5, 0x22]
	ldrh r2, [r3, 0x2]
	adds r2, r1, r2
	strh r2, [r5, 0x30]
	ldrh r0, [r3, 0x6]
	adds r1, r0
	strh r1, [r5, 0x34]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x20]
	strh r2, [r5, 0x22]
	ldr r0, _0813165C @ =sub_81311E4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08131658: .4byte gUnknown_03004B00
_0813165C: .4byte sub_81311E4
	thumb_func_end sub_8131264

	thumb_func_start sub_81312E4
sub_81312E4: @ 8131660
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	ldr r0, _081316A4 @ =gTasks
	mov r9, r0
	lsls r7, r6, 2
	adds r0, r7, r6
	lsls r0, 3
	mov r8, r0
	mov r4, r8
	add r4, r9
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081316A8
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	b _081316F4
	.align 2, 0
_081316A4: .4byte gTasks
_081316A8:
	cmp r0, 0x1
	bne _08131700
	ldrh r0, [r4, 0xA]
	adds r0, 0x60
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0xD
	strh r0, [r4, 0xC]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	adds r0, r5, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _08131764
	movs r0, 0
	strh r0, [r4, 0xE]
	adds r0, r5, 0
	bl sub_8078F40
	ldr r1, _081316FC @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_081316F4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08131764
	.align 2, 0
_081316FC: .4byte gSprites
_08131700:
	ldr r4, _08131770 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl refresh_graphics_maybe
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08131742
	ldr r3, _08131774 @ =gSprites
	ldr r2, _08131778 @ =gUnknown_02024BE0
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0813177C @ =gSpriteAffineAnimTable_81E7C18
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_08131742:
	mov r4, r9
	adds r3, r7, 0
	ldr r5, _08131780 @ =sub_8131408
	movs r1, 0xF
	mov r2, r8
	adds r0, r4, r2
	adds r0, 0x26
	movs r2, 0
_08131752:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _08131752
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r4
	str r5, [r0]
_08131764:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131770: .4byte gUnknown_0202F7C8
_08131774: .4byte gSprites
_08131778: .4byte gUnknown_02024BE0
_0813177C: .4byte gSpriteAffineAnimTable_81E7C18
_08131780: .4byte sub_8131408
	thumb_func_end sub_81312E4

	thumb_func_start sub_8131408
sub_8131408: @ 8131784
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _081317B0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _081317E8
	cmp r5, 0x1
	bgt _081317B4
	cmp r5, 0
	beq _081317BE
	b _081318D6
	.align 2, 0
_081317B0: .4byte gTasks
_081317B4:
	cmp r5, 0x2
	beq _08131854
	cmp r5, 0x3
	beq _08131890
	b _081318D6
_081317BE:
	ldr r0, _081317E0 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldr r0, _081317E4 @ =0x0000ff38
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x24]
	adds r1, 0x3E
	ldrb r2, [r1]
	subs r0, 0xCD
	ands r0, r2
	strb r0, [r1]
	strh r5, [r4, 0x1C]
	b _08131882
	.align 2, 0
_081317E0: .4byte gSprites
_081317E4: .4byte 0x0000ff38
_081317E8:
	ldrh r1, [r4, 0x1C]
	adds r1, 0x70
	movs r5, 0
	strh r1, [r4, 0x1C]
	ldr r2, _0813184C @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r2
	lsls r1, 16
	asrs r1, 24
	ldrh r3, [r2, 0x26]
	adds r1, r3
	strh r1, [r2, 0x26]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	blt _08131818
	strh r5, [r2, 0x24]
_08131818:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _08131822
	strh r5, [r2, 0x26]
_08131822:
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _081318D6
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
	ldr r1, _08131850 @ =0xfffff800
	adds r0, r1, 0
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	b _08131882
	.align 2, 0
_0813184C: .4byte gSprites
_08131850: .4byte 0xfffff800
_08131854:
	ldrh r0, [r4, 0x1C]
	subs r0, 0x70
	strh r0, [r4, 0x1C]
	lsls r0, 16
	cmp r0, 0
	bge _08131864
	movs r0, 0
	strh r0, [r4, 0x1C]
_08131864:
	ldr r0, _0813188C @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r4, 0x1C]
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r1, 0x26]
	subs r0, r2
	strh r0, [r1, 0x26]
	movs r3, 0x1C
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _081318D6
_08131882:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _081318D6
	.align 2, 0
_0813188C: .4byte gSprites
_08131890:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x70
	strh r0, [r4, 0x1C]
	ldr r2, _081318DC @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1, 0x26]
	adds r0, r2
	strh r0, [r1, 0x26]
	lsls r0, 16
	cmp r0, 0
	ble _081318B4
	movs r0, 0
	strh r0, [r1, 0x26]
_081318B4:
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _081318D6
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
	adds r0, r6, 0
	bl move_anim_task_del
_081318D6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081318DC: .4byte gSprites
	thumb_func_end sub_8131408

	thumb_func_start sub_8131564
sub_8131564: @ 81318E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08131904 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0813190C
	ldrb r0, [r4]
	bl sub_8079E90
	subs r0, 0x2
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r4, _08131908 @ =0x0000ff70
	b _0813191C
	.align 2, 0
_08131904: .4byte gUnknown_0202F7C9
_08131908: .4byte 0x0000ff70
_0813190C:
	ldrb r0, [r4]
	bl sub_8079E90
	adds r0, 0x2
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r4, _08131938 @ =0x0000ffa0
_0813191C:
	ldr r0, _0813193C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x26]
	ldr r0, _08131940 @ =sub_81315C8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08131938: .4byte 0x0000ffa0
_0813193C: .4byte gUnknown_0202F7C9
_08131940: .4byte sub_81315C8
	thumb_func_end sub_8131564

	thumb_func_start sub_81315C8
sub_81315C8: @ 8131944
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _08131952
	b _08131A6E
_08131952:
	lsls r0, 2
	ldr r1, _0813195C @ =_08131960
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813195C: .4byte _08131960
	.align 2, 0
_08131960:
	.4byte _08131974
	.4byte _08131998
	.4byte _081319D8
	.4byte _08131A08
	.4byte _08131A34
_08131974:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _08131A6E
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCD
	bl PlaySE12WithPanning
	movs r0, 0
	strh r0, [r4, 0x26]
	b _08131A2C
_08131998:
	ldrh r1, [r4, 0x30]
	adds r1, 0x4
	movs r5, 0
	strh r1, [r4, 0x30]
	ldr r2, _081319D4 @ =gSineTable
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	negs r0, r0
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _08131A6E
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCD
	bl PlaySE12WithPanning
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x26]
	b _08131A2C
	.align 2, 0
_081319D4: .4byte gSineTable
_081319D8:
	ldrh r1, [r4, 0x30]
	adds r1, 0x6
	movs r3, 0
	strh r1, [r4, 0x30]
	ldr r2, _08131A04 @ =gSineTable
	movs r5, 0x30
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	negs r0, r0
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _08131A6E
	strh r3, [r4, 0x30]
	strh r3, [r4, 0x26]
	b _08131A2C
	.align 2, 0
_08131A04: .4byte gSineTable
_08131A08:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08131A6E
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC0
	bl PlaySE12WithPanning
	movs r0, 0
	strh r0, [r4, 0x30]
_08131A2C:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08131A6E
_08131A34:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08131A6E
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	movs r0, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	subs r0, 0x6
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _08131A6E
	adds r0, r4, 0
	bl move_anim_8072740
_08131A6E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81315C8

	thumb_func_start sub_81316F8
sub_81316F8: @ 8131A74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r10, r4
	bl sub_8076BE0
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08131ABA
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r7, r0, 16
	cmp r7, 0
	blt _08131ABA
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08131AC8
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08131AC4 @ =gSprites
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_08131ABA:
	adds r0, r4, 0
	bl move_anim_task_del
	b _08131B6A
	.align 2, 0
_08131AC4: .4byte gSprites
_08131AC8:
	ldr r1, _08131B78 @ =gSprites
	mov r9, r1
	lsls r1, r0, 4
	mov r8, r1
	add r8, r0
	mov r0, r8
	lsls r0, 2
	mov r8, r0
	mov r4, r8
	add r4, r9
	ldrh r0, [r4, 0x24]
	adds r0, 0x18
	strh r0, [r4, 0x24]
	lsls r6, r7, 4
	adds r6, r7
	lsls r6, 2
	mov r1, r9
	adds r2, r6, r1
	ldrh r0, [r2, 0x24]
	subs r0, 0x18
	strh r0, [r2, 0x24]
	strh r5, [r4, 0x2E]
	strh r5, [r2, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r2, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r2, 0x32]
	movs r0, 0x10
	strh r0, [r4, 0x34]
	ldr r0, _08131B7C @ =0x0000fff0
	strh r0, [r2, 0x34]
	strh r5, [r4, 0x36]
	movs r0, 0x80
	strh r0, [r2, 0x36]
	movs r0, 0x18
	strh r0, [r4, 0x38]
	strh r0, [r2, 0x38]
	mov r0, r10
	strh r0, [r4, 0x3A]
	strh r0, [r2, 0x3A]
	strh r5, [r4, 0x3C]
	strh r5, [r2, 0x3C]
	ldr r0, _08131B80 @ =gTasks
	mov r1, r10
	lsls r3, r1, 2
	add r3, r10
	lsls r3, 3
	adds r3, r0
	movs r0, 0x2
	strh r0, [r3, 0x8]
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	subs r0, 0x7
	ands r0, r1
	strb r0, [r5]
	adds r5, r2, 0
	adds r5, 0x3E
	ldrb r0, [r5]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5]
	ldrb r5, [r4, 0x1]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r5
	strb r0, [r4, 0x1]
	ldrb r0, [r2, 0x1]
	ands r1, r0
	strb r1, [r2, 0x1]
	movs r0, 0x1C
	add r9, r0
	add r8, r9
	ldr r0, _08131B84 @ =sub_8131838
	mov r1, r8
	str r0, [r1]
	add r6, r9
	str r0, [r6]
	ldr r0, _08131B88 @ =sub_8131810
	str r0, [r3]
_08131B6A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08131B78: .4byte gSprites
_08131B7C: .4byte 0x0000fff0
_08131B80: .4byte gTasks
_08131B84: .4byte sub_8131838
_08131B88: .4byte sub_8131810
	thumb_func_end sub_81316F8

	thumb_func_start sub_8131810
sub_8131810: @ 8131B8C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08131BB0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08131BAA
	adds r0, r2, 0
	bl move_anim_task_del
_08131BAA:
	pop {r0}
	bx r0
	.align 2, 0
_08131BB0: .4byte gTasks
	thumb_func_end sub_8131810

	thumb_func_start sub_8131838
sub_8131838: @ 8131BB4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08131BE4
	strh r5, [r4, 0x30]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08131BE4:
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08131C0C
	cmp r0, 0x1
	beq _08131C24
	b _08131C62
_08131C0C:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	bne _08131C62
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08131C62
_08131C24:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	ble _08131C62
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x38]
	subs r0, 0x2
	strh r0, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _08131C62
	ldr r3, _08131C68 @ =gTasks
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_08131C62:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08131C68: .4byte gTasks
	thumb_func_end sub_8131838

	thumb_func_start sub_81318F0
sub_81318F0: @ 8131C6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, _08131CB8 @ =gUnknown_03004B00
	movs r2, 0
	strh r2, [r3, 0xE]
	ldr r1, _08131CBC @ =gUnknown_0202F7BE
	ldrb r0, [r1]
	ldrb r1, [r1]
	adds r0, r1, 0
	subs r0, 0x3D
	lsls r0, 24
	lsrs r0, 24
	adds r2, r1, 0
	cmp r0, 0x1E
	bhi _08131C90
	movs r0, 0x1
	strh r0, [r3, 0xE]
_08131C90:
	adds r0, r2, 0
	subs r0, 0x5C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6C
	bhi _08131CA0
	movs r0, 0x2
	strh r0, [r3, 0xE]
_08131CA0:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xC8
	bls _08131CAC
	movs r0, 0x3
	strh r0, [r3, 0xE]
_08131CAC:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08131CB8: .4byte gUnknown_03004B00
_08131CBC: .4byte gUnknown_0202F7BE
	thumb_func_end sub_81318F0

	thumb_func_start sub_8131944
sub_8131944: @ 8131CC0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08131CF0 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _08131CE6
	b _0813221C
_08131CE6:
	lsls r0, 2
	ldr r1, _08131CF4 @ =_08131CF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08131CF0: .4byte gTasks
_08131CF4: .4byte _08131CF8
	.align 2, 0
_08131CF8:
	.4byte _08131D0C
	.4byte _08131DC0
	.4byte _08131F9C
	.4byte _081320BC
	.4byte _08132140
_08131D0C:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08131D58 @ =gTasks
	mov r2, r8
	lsls r4, r2, 2
	adds r0, r4, r2
	lsls r0, 3
	adds r6, r0, r1
	movs r3, 0x80
	lsls r3, 4
	adds r0, r3, 0
	ldrh r1, [r6, 0xA]
	adds r0, r1
	strh r0, [r6, 0xA]
	ldr r0, _08131D5C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131D64
	ldr r2, _08131D60 @ =gSprites
	lsls r3, r7, 4
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	b _08131D7E
	.align 2, 0
_08131D58: .4byte gTasks
_08131D5C: .4byte gUnknown_0202F7C8
_08131D60: .4byte gSprites
_08131D64:
	ldr r3, _08131DB8 @ =gSprites
	lsls r4, r7, 4
	adds r2, r4, r7
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_08131D7E:
	ldr r1, _08131DBC @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	ldrb r0, [r4, 0xA]
	strh r0, [r4, 0xA]
	adds r1, r3, r7
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _08131DAA
	b _0813221C
_08131DAA:
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0813221C
	.align 2, 0
_08131DB8: .4byte gSprites
_08131DBC: .4byte gTasks
_08131DC0:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08131DF0
	ldr r0, _08131DE8 @ =0x02019348
	ldr r2, [r0, 0x8]
	mov r10, r2
	ldr r3, [r0, 0xC]
	mov r9, r3
	ldrh r5, [r0]
	ldr r0, _08131DEC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	b _08131F0E
	.align 2, 0
_08131DE8: .4byte 0x02019348
_08131DEC: .4byte gUnknown_0202F7C8
_08131DF0:
	ldr r4, _08131E50 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08131E8C
	ldr r7, _08131E54 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131E58 @ =gPlayerParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _08131E5C @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08131E60
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _08131E62
	.align 2, 0
_08131E50: .4byte gUnknown_0202F7C8
_08131E54: .4byte gUnknown_02024A6A
_08131E58: .4byte gPlayerParty
_08131E5C: .4byte 0x02017800
_08131E60:
	ldrh r5, [r1, 0x2]
_08131E62:
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _08131E88 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0
	movs r6, 0x88
	lsls r6, 1
	b _08131F10
	.align 2, 0
_08131E88: .4byte gSprites
_08131E8C:
	ldr r7, _08131EE0 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08131EE4 @ =gEnemyParty
	adds r0, r5
	movs r1, 0
	bl GetMonData
	mov r10, r0
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x1
	bl GetMonData
	mov r9, r0
	ldrb r2, [r4]
	lsls r1, r2, 2
	ldr r0, _08131EE8 @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08131EEC
	lsls r0, r2, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	b _08131EEE
	.align 2, 0
_08131EE0: .4byte gUnknown_02024A6A
_08131EE4: .4byte gEnemyParty
_08131EE8: .4byte 0x02017800
_08131EEC:
	ldrh r5, [r1, 0x2]
_08131EEE:
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _08131F80 @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
_08131F0E:
	ldr r6, _08131F84 @ =0x0000ffe0
_08131F10:
	ldr r0, _08131F88 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r6, 16
	asrs r3, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	mov r4, r10
	str r4, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r7, 0
	movs r2, 0
	bl sub_8079F44
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08131F8C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _08131F90 @ =0x02017800
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	beq _08131F6E
	ldr r1, _08131F80 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r0, r1
	ldr r3, _08131F94 @ =0x00007fff
	movs r1, 0x10
	movs r2, 0x6
	bl BlendPalette
_08131F6E:
	ldr r0, _08131F98 @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x26]
	b _08132132
	.align 2, 0
_08131F80: .4byte gSprites
_08131F84: .4byte 0x0000ffe0
_08131F88: .4byte gUnknown_0202F7C9
_08131F8C: .4byte gUnknown_0202F7C8
_08131F90: .4byte 0x02017800
_08131F94: .4byte 0x00007fff
_08131F98: .4byte gTasks
_08131F9C:
	ldr r1, _08131FE8 @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r6, r0, r1
	ldrh r0, [r6, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r2, [r6, 0xA]
	adds r0, r2
	strh r0, [r6, 0xA]
	ldr r0, _08131FEC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08131FF4
	ldr r3, _08131FF0 @ =gSprites
	lsls r4, r5, 4
	adds r2, r4, r5
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r6, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
	b _0813200A
	.align 2, 0
_08131FE8: .4byte gTasks
_08131FEC: .4byte gUnknown_0202F7C8
_08131FF0: .4byte gSprites
_08131FF4:
	ldr r2, _08132058 @ =gSprites
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
_0813200A:
	ldr r1, _0813205C @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r6, r0, r1
	ldrb r0, [r6, 0xA]
	strh r0, [r6, 0xA]
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _0813208A
	ldr r0, _08132060 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08132068
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _08132064 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bge _0813208A
	b _0813207E
	.align 2, 0
_08132058: .4byte gSprites
_0813205C: .4byte gTasks
_08132060: .4byte gUnknown_0202F7C8
_08132064: .4byte gUnknown_0202F7C9
_08132068:
	lsls r4, r5, 16
	asrs r4, 16
	ldr r0, _081320AC @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	ble _0813208A
_0813207E:
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	ldr r1, _081320B0 @ =gUnknown_03004B00
	ldr r0, _081320B4 @ =0x0000ffff
	strh r0, [r1, 0xE]
_0813208A:
	lsls r0, r5, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r2
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bhi _0813209C
	b _0813221C
_0813209C:
	ldr r0, _081320B8 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0xA]
	b _08132132
	.align 2, 0
_081320AC: .4byte gUnknown_0202F7C9
_081320B0: .4byte gUnknown_03004B00
_081320B4: .4byte 0x0000ffff
_081320B8: .4byte gTasks
_081320BC:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08132108 @ =gTasks
	mov r3, r8
	lsls r4, r3, 2
	adds r0, r4, r3
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r5, _0813210C @ =gSprites
	adds r0, r5
	bl sub_807A0F4
	ldr r0, _08132110 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08132114
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1, 0x24]
	b _08132128
	.align 2, 0
_08132108: .4byte gTasks
_0813210C: .4byte gSprites
_08132110: .4byte gUnknown_0202F7C8
_08132114:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r5
	ldrh r2, [r0, 0x20]
	movs r4, 0x88
	lsls r4, 1
	adds r1, r4, 0
	subs r1, r2
	strh r1, [r0, 0x24]
_08132128:
	ldr r0, _0813213C @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
_08132132:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0813221C
	.align 2, 0
_0813213C: .4byte gTasks
_08132140:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _081321B4 @ =gTasks
	mov r0, r8
	lsls r4, r0, 2
	adds r0, r4, r0
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x80
	lsls r1, 4
	adds r0, r1, 0
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	ldr r0, _081321B8 @ =gUnknown_0202F7C8
	mov r10, r0
	ldrb r0, [r0]
	str r2, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	mov r9, r4
	ldr r2, [sp, 0x10]
	cmp r0, 0
	bne _081321C0
	ldr r1, _081321BC @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x24
	ldrsh r4, [r6, r2]
	movs r3, 0x20
	ldrsh r0, [r6, r3]
	adds r4, r0
	mov r1, r10
	ldrb r0, [r1]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	blt _081321F8
	movs r2, 0
	strh r2, [r6, 0x24]
	b _081321F8
	.align 2, 0
_081321B4: .4byte gTasks
_081321B8: .4byte gUnknown_0202F7C8
_081321BC: .4byte gSprites
_081321C0:
	ldr r1, _0813222C @ =gSprites
	lsls r5, r7, 4
	adds r0, r5, r7
	lsls r0, 2
	adds r6, r0, r1
	ldrh r1, [r2, 0xA]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	movs r3, 0x24
	ldrsh r4, [r6, r3]
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	adds r4, r0
	mov r2, r10
	ldrb r0, [r2]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r3, r5, 0
	cmp r4, r0
	bgt _081321F8
	movs r4, 0
	strh r4, [r6, 0x24]
_081321F8:
	ldr r1, _08132230 @ =gTasks
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	strh r1, [r0, 0xA]
	ldr r1, _0813222C @ =gSprites
	adds r0, r3, r7
	lsls r0, 2
	adds r0, r1
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0813221C
	mov r0, r8
	bl move_anim_task_del
_0813221C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813222C: .4byte gSprites
_08132230: .4byte gTasks
	thumb_func_end sub_8131944

	thumb_func_start sub_8131EB8
sub_8131EB8: @ 8132234
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08132246
	cmp r0, 0x1
	beq _081322EE
	b _08132370
_08132246:
	ldr r0, _081322CC @ =gUnknown_03004B00
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _081322E0
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7A
	bl PlaySE12WithPanning
	ldr r0, _081322D0 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	ldr r0, _081322D4 @ =0x0000ffe0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _081322D8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08132370
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08132370
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _081322DC @ =gSprites
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	b _08132370
	.align 2, 0
_081322CC: .4byte gUnknown_03004B00
_081322D0: .4byte gUnknown_0202F7C9
_081322D4: .4byte 0x0000ffe0
_081322D8: .4byte gUnknown_0202F7C8
_081322DC: .4byte gSprites
_081322E0:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08132370
_081322EE:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x30]
	adds r0, r2, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7F
	ble _08132322
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r2, 0
	subs r0, 0x7A
	strh r0, [r4, 0x30]
_08132322:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldr r0, _0813234C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08132350
	ldrh r2, [r4, 0x32]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	adds r1, r2, 0
	b _0813235C
	.align 2, 0
_0813234C: .4byte gUnknown_0202F7C8
_08132350:
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
_0813235C:
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	bne _08132370
	adds r0, r4, 0
	bl move_anim_8072740
_08132370:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8131EB8

	thumb_func_start sub_8131FFC
sub_8131FFC: @ 8132378
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _081323A0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0x4
	bls _08132394
	b _081324E6
_08132394:
	lsls r0, 2
	ldr r1, _081323A4 @ =_081323A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081323A0: .4byte gTasks
_081323A4: .4byte _081323A8
	.align 2, 0
_081323A8:
	.4byte _081323BC
	.4byte _0813240C
	.4byte _08132468
	.4byte _08132480
	.4byte _081324E6
_081323BC:
	ldr r0, _08132400 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08132404 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _08132408 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x6
	strh r0, [r1, 0x8]
	cmp r5, r2
	ble _081323F2
	negs r0, r0
	strh r0, [r1, 0x8]
_081323F2:
	strh r5, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08132504
	.align 2, 0
_08132400: .4byte gUnknown_0202F7C8
_08132404: .4byte gUnknown_0202F7C9
_08132408: .4byte gTasks
_0813240C:
	ldr r1, _08132448 @ =gUnknown_02024BE0
	ldr r0, _0813244C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _08132450 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08132454
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	b _081324DA
	.align 2, 0
_08132448: .4byte gUnknown_02024BE0
_0813244C: .4byte gUnknown_0202F7C8
_08132450: .4byte gSprites
_08132454:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08132504
	b _081324DE
_08132468:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x8]
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _08132504
_08132480:
	ldr r1, _081324C0 @ =gUnknown_02024BE0
	ldr r0, _081324C4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _081324C8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r1
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0x8]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _081324CC
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bgt _08132504
	b _081324DE
	.align 2, 0
_081324C0: .4byte gUnknown_02024BE0
_081324C4: .4byte gUnknown_0202F7C8
_081324C8: .4byte gSprites
_081324CC:
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x24
	ldrsh r1, [r1, r3]
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r2, r3]
_081324DA:
	cmp r0, r1
	blt _08132504
_081324DE:
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	b _08132504
_081324E6:
	ldr r1, _0813250C @ =gUnknown_02024BE0
	ldr r0, _08132510 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	ldr r1, _08132514 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_task_del
_08132504:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813250C: .4byte gUnknown_02024BE0
_08132510: .4byte gUnknown_0202F7C8
_08132514: .4byte gSprites
	thumb_func_end sub_8131FFC

	thumb_func_start sub_813219C
sub_813219C: @ 8132518
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08132580 @ =gTasks
	adds r4, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0xE]
	ldr r0, _08132584 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _0813254C
	movs r1, 0x1
_0813254C:
	strh r1, [r4, 0x10]
	ldr r2, _08132588 @ =gSprites
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x14]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x1A]
	strh r5, [r4, 0x1E]
	movs r0, 0x1
	strh r0, [r4, 0x1C]
	strh r5, [r4, 0x20]
	ldr r0, _0813258C @ =sub_8132214
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132580: .4byte gTasks
_08132584: .4byte gUnknown_0202F7C8
_08132588: .4byte gSprites
_0813258C: .4byte sub_8132214
	thumb_func_end sub_813219C

	thumb_func_start sub_8132214
sub_8132214: @ 8132590
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _081325B4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08132638
	cmp r0, 0x1
	bgt _081325B8
	cmp r0, 0
	beq _081325BE
	b _0813268E
	.align 2, 0
_081325B4: .4byte gTasks
_081325B8:
	cmp r0, 0x2
	beq _08132688
	b _0813268E
_081325BE:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r4, 0x1E]
	ldr r5, _08132630 @ =gSprites
	movs r6, 0xE
	ldrsh r0, [r4, r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r3, _08132634 @ =gSineTable
	movs r6, 0x1E
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x2
	ands r0, r2
	strh r0, [r4, 0x1A]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	ldrh r1, [r4, 0x10]
	muls r0, r1
	ldrh r1, [r4, 0x12]
	adds r0, r1
	strh r0, [r2, 0x20]
	movs r6, 0x1A
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _0813268E
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x20]
	b _08132678
	.align 2, 0
_08132630: .4byte gSprites
_08132634: .4byte gSineTable
_08132638:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x1E]
	ldr r3, _08132680 @ =gSprites
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _08132684 @ =gSineTable
	movs r5, 0x1E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r1, 0x24]
	movs r6, 0x1E
	ldrsh r2, [r4, r6]
	cmp r2, 0
	bne _0813268E
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_08132678:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0813268E
	.align 2, 0
_08132680: .4byte gSprites
_08132684: .4byte gSineTable
_08132688:
	adds r0, r2, 0
	bl move_anim_task_del
_0813268E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8132214

	thumb_func_start sub_8132318
sub_8132318: @ 8132694
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081326E8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081326DA
	adds r0, r4, 0
	bl move_anim_8072740
_081326DA:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081326E8: .4byte gUnknown_0202F7C9
	thumb_func_end sub_8132318

	thumb_func_start sub_8132370
sub_8132370: @ 81326EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08132724 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08132730
	ldr r2, _08132728 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0813272C @ =0x0000fff5
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _0813274A
	.align 2, 0
_08132724: .4byte gUnknown_0202F7C9
_08132728: .4byte gUnknown_03004B00
_0813272C: .4byte 0x0000fff5
_08132730:
	movs r0, 0xB
	strh r0, [r4, 0x2E]
	movs r0, 0xC0
	strh r0, [r4, 0x30]
	ldr r1, _08132754 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_0813274A:
	ldr r0, _08132758 @ =sub_8132318
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132754: .4byte gUnknown_03004B00
_08132758: .4byte sub_8132318
	thumb_func_end sub_8132370

	thumb_func_start sub_81323E0
sub_81323E0: @ 813275C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _081327A0 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _08132786
	movs r0, 0x10
	strh r0, [r5, 0x22]
_08132786:
	movs r0, 0
	strh r0, [r5, 0x3A]
	movs r1, 0x10
	strh r1, [r5, 0x3C]
	ldr r0, _081327A4 @ =sub_8132430
	str r0, [r5, 0x1C]
	ldr r0, _081327A8 @ =0x04000052
	lsls r1, 8
	strh r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081327A0: .4byte gUnknown_0202F7C8
_081327A4: .4byte sub_8132430
_081327A8: .4byte 0x04000052
	thumb_func_end sub_81323E0

	thumb_func_start sub_8132430
sub_8132430: @ 81327AC
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0x32
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _08132824
	cmp r1, 0x1
	bgt _081327C2
	cmp r1, 0
	beq _081327CC
	b _0813289E
_081327C2:
	cmp r1, 0x2
	beq _0813283A
	cmp r1, 0x3
	beq _08132898
	b _0813289E
_081327CC:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0813289E
	strh r1, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081327F6
	ldrh r2, [r3, 0x3A]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	cmp r0, 0xF
	bgt _08132804
	adds r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _08132804
_081327F6:
	ldrh r2, [r3, 0x3C]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _08132804
	subs r0, r2, 0x1
	strh r0, [r3, 0x3C]
_08132804:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	ldr r2, _08132820 @ =0x04000052
	ldrh r0, [r3, 0x3C]
	lsls r0, 8
	ldrh r1, [r3, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _0813289E
	b _0813288C
	.align 2, 0
_08132820: .4byte 0x04000052
_08132824:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0813289E
	strh r1, [r3, 0x2E]
	strh r1, [r3, 0x30]
	b _0813288C
_0813283A:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0813289E
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08132866
	ldrh r2, [r3, 0x3A]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _08132874
	subs r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _08132874
_08132866:
	ldrh r2, [r3, 0x3C]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	cmp r0, 0xF
	bgt _08132874
	adds r0, r2, 0x1
	strh r0, [r3, 0x3C]
_08132874:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	ldr r2, _08132894 @ =0x04000052
	ldrh r0, [r3, 0x3C]
	lsls r0, 8
	ldrh r1, [r3, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0x10
	bne _0813289E
_0813288C:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	b _0813289E
	.align 2, 0
_08132894: .4byte 0x04000052
_08132898:
	adds r0, r3, 0
	bl move_anim_8074EE0
_0813289E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8132430

	thumb_func_start sub_8132528
sub_8132528: @ 81328A4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _081328C0 @ =gUnknown_03004B00
	movs r0, 0
	strh r0, [r2, 0xE]
	ldr r0, _081328C4 @ =gUnknown_0202F7C0
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _081328C8
	movs r0, 0x1
	b _081328EA
	.align 2, 0
_081328C0: .4byte gUnknown_03004B00
_081328C4: .4byte gUnknown_0202F7C0
_081328C8:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _081328D4
	movs r0, 0x2
	b _081328EA
_081328D4:
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _081328E0
	movs r0, 0x3
	b _081328EA
_081328E0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081328EC
	movs r0, 0x4
_081328EA:
	strh r0, [r2, 0xE]
_081328EC:
	adds r0, r3, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	thumb_func_end sub_8132528

	thumb_func_start sub_813257C
sub_813257C: @ 81328F8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08132930 @ =gTasks
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _08132934 @ =gUnknown_03004B00
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x26]
	ldr r2, _08132938 @ =gUnknown_08402B28
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _0813293C @ =sub_81325C4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132930: .4byte gTasks
_08132934: .4byte gUnknown_03004B00
_08132938: .4byte gUnknown_08402B28
_0813293C: .4byte sub_81325C4
	thumb_func_end sub_813257C

	thumb_func_start sub_81325C4
sub_81325C4: @ 8132940
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r2, _08132998 @ =gTasks
	adds r3, r0, r2
	ldrh r0, [r3, 0x8]
	adds r1, r0, 0x1
	movs r5, 0
	strh r1, [r3, 0x8]
	subs r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x16
	bhi _081329A4
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _081329B4
	strh r5, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r5, 0x1
	ands r0, r5
	cmp r0, 0
	bne _081329A4
	ldr r2, _0813299C @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _081329A0 @ =0x0000ffff
	strh r1, [r0, 0x24]
	b _081329B4
	.align 2, 0
_08132998: .4byte gTasks
_0813299C: .4byte gSprites
_081329A0: .4byte 0x0000ffff
_081329A4:
	ldr r2, _081329D4 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
_081329B4:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r6
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _081329CC
	adds r0, r4, 0
	bl move_anim_task_del
_081329CC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081329D4: .4byte gSprites
	thumb_func_end sub_81325C4

	thumb_func_start sub_813265C
sub_813265C: @ 81329D8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_813265C

	thumb_func_start sub_8132670
sub_8132670: @ 81329EC
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _08132A14 @ =sub_813269C
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08132A14: .4byte sub_813269C
	thumb_func_end sub_8132670

	thumb_func_start sub_813269C
sub_813269C: @ 8132A18
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08132A44 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08132A3C
	ldr r0, _08132A48 @ =sub_81326D8
	bl SetMainCallback2
	ldr r1, _08132A4C @ =gUnknown_0300485C
	ldr r0, _08132A50 @ =sub_8080990
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_08132A3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132A44: .4byte gPaletteFade
_08132A48: .4byte sub_81326D8
_08132A4C: .4byte gUnknown_0300485C
_08132A50: .4byte sub_8080990
	thumb_func_end sub_813269C

	thumb_func_start sub_81326D8
sub_81326D8: @ 8132A54
	push {r4,r5,lr}
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r4, _08132AF4 @ =gUnknown_030007B0
	ldr r0, _08132AF8 @ =0x02017000
	str r0, [r4]
	bl sub_81332A0
	ldr r1, [r4]
	ldr r0, _08132AFC @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	ldr r2, _08132B00 @ =0x000002c5
	adds r1, r2
	movs r5, 0
	strb r0, [r1]
	bl sub_8133558
	ldr r0, _08132B04 @ =sub_813265C
	bl SetVBlankCallback
	ldr r4, _08132B08 @ =gWindowConfig_81E7240
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r4, _08132B0C @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r0, _08132B10 @ =0x04000012
	strh r5, [r0]
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	strh r5, [r0]
	ldr r0, _08132B14 @ =gUnknown_08402D80
	bl LoadSpriteSheet
	ldr r0, _08132B18 @ =gUnknown_08402D88
	bl LoadSpritePalette
	bl sub_8133358
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _08132B1C @ =sub_8132870
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132AF4: .4byte gUnknown_030007B0
_08132AF8: .4byte 0x02017000
_08132AFC: .4byte gSpecialVar_0x8004
_08132B00: .4byte 0x000002c5
_08132B04: .4byte sub_813265C
_08132B08: .4byte gWindowConfig_81E7240
_08132B0C: .4byte gWindowConfig_81E6CE4
_08132B10: .4byte 0x04000012
_08132B14: .4byte gUnknown_08402D80
_08132B18: .4byte gUnknown_08402D88
_08132B1C: .4byte sub_8132870
	thumb_func_end sub_81326D8

	thumb_func_start sub_81327A4
sub_81327A4: @ 8132B20
	push {r4,r5,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r4, _08132BC0 @ =gUnknown_030007B0
	ldr r0, _08132BC4 @ =0x02017000
	str r0, [r4]
	bl sub_8133558
	ldr r1, [r4]
	ldr r0, _08132BC8 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	ldr r2, _08132BCC @ =0x000002c6
	adds r1, r2
	movs r5, 0
	strb r0, [r1]
	ldr r0, _08132BD0 @ =sub_813265C
	bl SetVBlankCallback
	ldr r4, _08132BD4 @ =gWindowConfig_81E7240
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r4, _08132BD8 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08132BDC @ =0x04000012
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	strh r5, [r0]
	ldr r0, _08132BE0 @ =gUnknown_08402D80
	bl LoadSpriteSheet
	ldr r0, _08132BE4 @ =gUnknown_08402D88
	bl LoadSpritePalette
	bl sub_8133358
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _08132BE8 @ =sub_8132870
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08132BC0: .4byte gUnknown_030007B0
_08132BC4: .4byte 0x02017000
_08132BC8: .4byte gSpecialVar_0x8005
_08132BCC: .4byte 0x000002c6
_08132BD0: .4byte sub_813265C
_08132BD4: .4byte gWindowConfig_81E7240
_08132BD8: .4byte gWindowConfig_81E6CE4
_08132BDC: .4byte 0x04000012
_08132BE0: .4byte gUnknown_08402D80
_08132BE4: .4byte gUnknown_08402D88
_08132BE8: .4byte sub_8132870
	thumb_func_end sub_81327A4

	thumb_func_start sub_8132870
sub_8132870: @ 8132BEC
	push {r4,lr}
	bl sub_8132908
	ldr r4, _08132C5C @ =gUnknown_030007B0
	ldr r1, [r4]
	ldrb r0, [r1, 0x1D]
	cmp r0, 0
	beq _08132C12
	movs r0, 0
	strb r0, [r1, 0x1D]
	ldr r0, [r4]
	ldrb r1, [r0, 0x18]
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x58
	bl sub_814AD7C
_08132C12:
	ldr r1, [r4]
	ldrb r0, [r1, 0x1E]
	cmp r0, 0
	beq _08132C22
	movs r0, 0
	strb r0, [r1, 0x1E]
	bl sub_8133800
_08132C22:
	ldr r1, [r4]
	ldr r2, _08132C60 @ =0x000002c3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08132C44
	adds r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8133AEC
	ldr r0, [r4]
	ldr r1, _08132C60 @ =0x000002c3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_08132C44:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132C5C: .4byte gUnknown_030007B0
_08132C60: .4byte 0x000002c3
	thumb_func_end sub_8132870

	thumb_func_start sub_81328E8
sub_81328E8: @ 8132C64
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08132C80 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08132C80: .4byte gStringVar4
	thumb_func_end sub_81328E8

	thumb_func_start sub_8132908
sub_8132908: @ 8132C84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _08132CA8 @ =gUnknown_030007B0
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0x21
	bls _08132C9C
	b _08133352
_08132C9C:
	lsls r0, 2
	ldr r1, _08132CAC @ =_08132CB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08132CA8: .4byte gUnknown_030007B0
_08132CAC: .4byte _08132CB0
	.align 2, 0
_08132CB0:
	.4byte _08132D38
	.4byte _08132D88
	.4byte _08132DA0
	.4byte _08132DA8
	.4byte _08132DDC
	.4byte _08132DE2
	.4byte _08132E14
	.4byte _08133352
	.4byte _08132E26
	.4byte _08132E4C
	.4byte _08133352
	.4byte _08133352
	.4byte _08132EF0
	.4byte _08132F14
	.4byte _08133154
	.4byte _08133174
	.4byte _08132F6C
	.4byte _08132F84
	.4byte _08132FA8
	.4byte _081330BC
	.4byte _081330E4
	.4byte _08133134
	.4byte _08133142
	.4byte _08133352
	.4byte _08132FF0
	.4byte _08133008
	.4byte _0813302C
	.4byte _08133088
	.4byte _08133194
	.4byte _081331F8
	.4byte _081332D4
	.4byte _08133300
	.4byte _08133320
	.4byte _08133338
_08132D38:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r4, 0
	strb r0, [r1]
	bl sub_8132FEC
	movs r0, 0
	bl sub_8133030
	bl sub_8133800
	ldr r0, _08132D80 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, _08132D84 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	b _08133352
	.align 2, 0
_08132D80: .4byte gSprites
_08132D84: .4byte 0x000002c3
_08132D88:
	ldr r0, _08132D9C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08132D96
	b _08133352
_08132D96:
	ldr r1, [r7]
	movs r0, 0x4
	b _08133350
	.align 2, 0
_08132D9C: .4byte gPaletteFade
_08132DA0:
	ldr r1, [r7]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
_08132DA8:
	movs r0, 0
	bl sub_8133030
	bl sub_8133800
	ldr r2, _08132DD0 @ =gUnknown_030007B0
	ldr r0, [r2]
	ldr r1, _08132DD4 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _08132DD8 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	b _08133352
	.align 2, 0
_08132DD0: .4byte gUnknown_030007B0
_08132DD4: .4byte 0x000002c3
_08132DD8: .4byte gSprites
_08132DDC:
	bl sub_81330E8
	b _08132E18
_08132DE2:
	movs r0, 0
	bl sub_8133140
	bl sub_8133800
	ldr r2, _08132E08 @ =gUnknown_030007B0
	ldr r0, [r2]
	ldr r1, _08132E0C @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08132E10 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
	.align 2, 0
_08132E08: .4byte gUnknown_030007B0
_08132E0C: .4byte 0x000002c3
_08132E10: .4byte gSprites
_08132E14:
	bl sub_8133248
_08132E18:
	lsls r0, 24
	cmp r0, 0
	beq _08132E20
	b _08133352
_08132E20:
	bl sub_813362C
	b _08133352
_08132E26:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132E32
	b _08133352
_08132E32:
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08132E48 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
	.align 2, 0
_08132E48: .4byte gUnknown_030007B0
_08132E4C:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _08132EB6
	bl sub_8133CA4
	ldr r4, _08132E98 @ =gUnknown_030007B0
	ldr r2, [r4]
	ldr r1, _08132E9C @ =0x000002c5
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08132EA0 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r2, 0x1B]
	lsls r1, 1
	adds r2, 0x20
	adds r2, r1
	ldrh r1, [r2]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _08132EA4 @ =0xffff0000
	cmp r0, r1
	beq _08132EB0
	ldr r0, _08132EA8 @ =gOtherText_PokeLearnedMove
	bl sub_81328E8
	ldr r1, _08132EAC @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, [r4]
	movs r0, 0x1F
	b _08133350
	.align 2, 0
_08132E98: .4byte gUnknown_030007B0
_08132E9C: .4byte 0x000002c5
_08132EA0: .4byte gPlayerParty
_08132EA4: .4byte 0xffff0000
_08132EA8: .4byte gOtherText_PokeLearnedMove
_08132EAC: .4byte gSpecialVar_0x8004
_08132EB0:
	ldr r1, [r4]
	movs r0, 0x10
	b _08133350
_08132EB6:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08132EC4
	cmp r1, 0x1
	beq _08132EC4
	b _08133352
_08132EC4:
	bl sub_8133CA4
	ldr r3, _08132EEC @ =gUnknown_030007B0
	ldr r1, [r3]
	movs r2, 0xB1
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132EDC
	movs r0, 0x3
	strb r0, [r1]
_08132EDC:
	ldr r1, [r3]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08132EE8
	b _08133352
_08132EE8:
	movs r0, 0x5
	b _08133350
	.align 2, 0
_08132EEC: .4byte gUnknown_030007B0
_08132EF0:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132EFC
	b _08133352
_08132EFC:
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08132F10 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
	.align 2, 0
_08132F10: .4byte gUnknown_030007B0
_08132F14:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r4, r0, 24
	cmp r4, 0
	bne _08132F30
	bl sub_8133CA4
	ldr r0, _08132F2C @ =gSpecialVar_0x8004
	strh r4, [r0]
	b _0813334A
	.align 2, 0
_08132F2C: .4byte gSpecialVar_0x8004
_08132F30:
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08132F3E
	cmp r4, 0x1
	beq _08132F3E
	b _08133352
_08132F3E:
	bl sub_8133CA4
	ldr r3, _08132F68 @ =gUnknown_030007B0
	ldr r1, [r3]
	movs r2, 0xB1
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08132F56
	movs r0, 0x3
	strb r0, [r1]
_08132F56:
	ldr r1, [r3]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08132F62
	b _08133352
_08132F62:
	movs r0, 0x5
	b _08133350
	.align 2, 0
_08132F68: .4byte gUnknown_030007B0
_08132F6C:
	ldr r0, _08132F7C @ =gOtherText_DeleteOlderMove
	bl sub_81328E8
	ldr r0, _08132F80 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
	.align 2, 0
_08132F7C: .4byte gOtherText_DeleteOlderMove
_08132F80: .4byte gUnknown_030007B0
_08132F84:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08132F90
	b _08133352
_08132F90:
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08132FA4 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x12
	b _08133350
	.align 2, 0
_08132FA4: .4byte gUnknown_030007B0
_08132FA8:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _08132FD0
	bl sub_8133CA4
	ldr r0, _08132FC8 @ =gOtherText_WhichMoveToForget
	bl sub_81328E8
	ldr r0, _08132FCC @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x13
	b _08133350
	.align 2, 0
_08132FC8: .4byte gOtherText_WhichMoveToForget
_08132FCC: .4byte gUnknown_030007B0
_08132FD0:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08132FDE
	cmp r1, 0x1
	beq _08132FDE
	b _08133352
_08132FDE:
	bl sub_8133CA4
	ldr r0, _08132FEC @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x18
	b _08133350
	.align 2, 0
_08132FEC: .4byte gUnknown_030007B0
_08132FF0:
	ldr r0, _08133000 @ =gOtherText_StopLearningMove
	bl sub_81328E8
	ldr r0, _08133004 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
	.align 2, 0
_08133000: .4byte gOtherText_StopLearningMove
_08133004: .4byte gUnknown_030007B0
_08133008:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08133014
	b _08133352
_08133014:
	ldr r0, _08133028 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x1A
	strb r0, [r1]
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	b _08133352
	.align 2, 0
_08133028: .4byte gUnknown_030007B0
_0813302C:
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _08133048
	bl sub_8133CA4
	ldr r0, _08133044 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x1B
	b _08133350
	.align 2, 0
_08133044: .4byte gUnknown_030007B0
_08133048:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08133056
	cmp r1, 0x1
	beq _08133056
	b _08133352
_08133056:
	bl sub_8133CA4
	ldr r1, _08133084 @ =gUnknown_030007B0
	ldr r2, [r1]
	movs r3, 0xB1
	lsls r3, 2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813306E
	movs r0, 0x3
	strb r0, [r2]
_0813306E:
	ldr r2, [r1]
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813307C
	movs r0, 0x5
	strb r0, [r2]
_0813307C:
	ldr r1, [r1]
	movs r0, 0x10
	b _08133350
	.align 2, 0
_08133084: .4byte gUnknown_030007B0
_08133088:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08133094
	b _08133352
_08133094:
	ldr r3, _081330B8 @ =gUnknown_030007B0
	ldr r1, [r3]
	movs r2, 0xB1
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _081330A8
	movs r0, 0x3
	strb r0, [r1]
_081330A8:
	ldr r1, [r3]
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _081330B4
	b _08133352
_081330B4:
	movs r0, 0x5
	b _08133350
	.align 2, 0
_081330B8: .4byte gUnknown_030007B0
_081330BC:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _081330C8
	b _08133352
_081330C8:
	ldr r0, _081330E0 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0x14
	strb r0, [r1]
	subs r0, 0x15
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08133352
	.align 2, 0
_081330E0: .4byte gUnknown_030007B0
_081330E4:
	ldr r0, _08133120 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081330F2
	b _08133352
_081330F2:
	ldr r0, _08133124 @ =gPlayerParty
	ldr r5, [r7]
	ldr r2, _08133128 @ =0x000002c5
	adds r1, r5, r2
	ldrb r1, [r1]
	ldr r2, _0813312C @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08133130 @ =sub_81327A4
	ldrb r4, [r5, 0x1B]
	lsls r4, 1
	adds r5, 0x20
	adds r5, r4
	ldrh r4, [r5]
	str r4, [sp]
	bl sub_809D9F0
	ldr r1, [r7]
	movs r0, 0x1C
	b _08133350
	.align 2, 0
_08133120: .4byte gPaletteFade
_08133124: .4byte gPlayerParty
_08133128: .4byte 0x000002c5
_0813312C: .4byte gPlayerPartyCount
_08133130: .4byte sub_81327A4
_08133134:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08133140
	b _08133352
_08133140:
	b _0813334A
_08133142:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08133352
_08133154:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08133170 @ =gUnknown_030007B0
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	b _08133350
	.align 2, 0
_08133170: .4byte gUnknown_030007B0
_08133174:
	ldr r0, _0813318C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08133182
	b _08133352
_08133182:
	ldr r0, _08133190 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _08133352
	.align 2, 0
_0813318C: .4byte gPaletteFade
_08133190: .4byte c2_exit_to_overworld_2_switch
_08133194:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _081331F0 @ =gUnknown_030007B0
	ldr r1, [r5]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8132FEC
	bl sub_8133800
	ldr r0, [r5]
	movs r4, 0xB1
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _081331CA
	movs r0, 0x1
	bl sub_8133030
_081331CA:
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _081331E2
	ldr r0, _081331F4 @ =gSprites
	adds r0, 0x64
	movs r1, 0x48
	strh r1, [r0]
	movs r0, 0x1
	bl sub_8133140
_081331E2:
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8133AEC
	b _08133352
	.align 2, 0
_081331F0: .4byte gUnknown_030007B0
_081331F4: .4byte gSprites
_081331F8:
	ldr r0, _08133218 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08133206
	b _08133352
_08133206:
	ldr r1, [r7]
	ldr r0, _0813321C @ =0x000002c6
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0x4
	bne _08133220
	movs r0, 0x18
	b _08133350
	.align 2, 0
_08133218: .4byte gPaletteFade
_0813321C: .4byte 0x000002c6
_08133220:
	ldr r4, _081332B4 @ =0x000002c5
	adds r0, r1, r4
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _081332B8 @ =gPlayerParty
	adds r0, r5
	ldrb r1, [r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _081332BC @ =gStringVar3
	movs r1, 0xD
	mov r9, r1
	mov r1, r9
	muls r1, r0
	ldr r0, _081332C0 @ =gMoveNames
	mov r8, r0
	add r1, r8
	adds r0, r2, 0
	bl StringCopy
	ldr r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	muls r0, r6
	adds r0, r5
	ldr r2, _081332C4 @ =0x000002c6
	adds r1, r2
	ldrb r1, [r1]
	bl RemoveMonPPBonus
	ldr r3, [r7]
	adds r4, r3, r4
	ldrb r0, [r4]
	muls r0, r6
	adds r0, r5
	ldrb r2, [r3, 0x1B]
	lsls r2, 1
	adds r1, r3, 0
	adds r1, 0x20
	adds r1, r2
	ldrh r1, [r1]
	ldr r2, _081332C4 @ =0x000002c6
	adds r3, r2
	ldrb r2, [r3]
	bl SetMonMoveSlot
	ldr r0, _081332C8 @ =gStringVar2
	ldr r1, [r7]
	ldrb r2, [r1, 0x1B]
	lsls r2, 1
	adds r1, 0x20
	adds r1, r2
	ldrh r1, [r1]
	mov r2, r9
	muls r2, r1
	adds r1, r2, 0
	add r1, r8
	bl StringCopy
	ldr r0, _081332CC @ =gOtherText_ForgotMove123
	bl sub_81328E8
	ldr r1, [r7]
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _081332D0 @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	b _08133352
	.align 2, 0
_081332B4: .4byte 0x000002c5
_081332B8: .4byte gPlayerParty
_081332BC: .4byte gStringVar3
_081332C0: .4byte gMoveNames
_081332C4: .4byte 0x000002c6
_081332C8: .4byte gStringVar2
_081332CC: .4byte gOtherText_ForgotMove123
_081332D0: .4byte gSpecialVar_0x8004
_081332D4:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08133352
	ldr r0, _081332F4 @ =deuOtherText_ForgotAndLearned
	bl sub_81328E8
	ldr r0, _081332F8 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x1F
	strb r0, [r1]
	ldr r0, _081332FC @ =0x0000016f
	bl PlayFanfare
	b _08133352
	.align 2, 0
_081332F4: .4byte deuOtherText_ForgotAndLearned
_081332F8: .4byte gUnknown_030007B0
_081332FC: .4byte 0x0000016f
_08133300:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08133352
	ldr r0, _08133318 @ =0x0000016f
	bl PlayFanfare
	ldr r0, _0813331C @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x20
	b _08133350
	.align 2, 0
_08133318: .4byte 0x0000016f
_0813331C: .4byte gUnknown_030007B0
_08133320:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08133352
	ldr r0, _08133334 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0x21
	b _08133350
	.align 2, 0
_08133334: .4byte gUnknown_030007B0
_08133338:
	ldr r0, _08133360 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08133352
	movs r0, 0x5
	bl PlaySE
_0813334A:
	ldr r0, _08133364 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0xE
_08133350:
	strb r0, [r1]
_08133352:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133360: .4byte gMain
_08133364: .4byte gUnknown_030007B0
	thumb_func_end sub_8132908

	thumb_func_start sub_8132FEC
sub_8132FEC: @ 8133368
	push {r4-r6,lr}
	ldr r0, _081333A0 @ =gWindowConfig_81E7240
	bl BasicInitMenuWindow
	movs r5, 0
	ldr r4, _081333A4 @ =gUnknown_08402CF8
	adds r6, r4, 0
_08133376:
	lsls r3, r5, 2
	ldrb r0, [r4]
	adds r1, r6, 0x1
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r6, 0x2
	adds r3, r2
	ldrb r2, [r3]
	ldrb r3, [r4, 0x3]
	bl MenuDrawTextWindow
	adds r4, 0x4
	adds r5, 0x1
	cmp r5, 0x3
	bls _08133376
	ldr r0, _081333A8 @ =gWindowConfig_81E6CE4
	bl BasicInitMenuWindow
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081333A0: .4byte gWindowConfig_81E7240
_081333A4: .4byte gUnknown_08402CF8
_081333A8: .4byte gWindowConfig_81E6CE4
	thumb_func_end sub_8132FEC

	thumb_func_start sub_8133030
sub_8133030: @ 81333AC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08133450 @ =gSprites
	ldr r5, _08133454 @ =gUnknown_030007B0
	ldr r0, [r5]
	ldrb r0, [r0, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r2, 0
	ldr r6, _08133458 @ =gUnknown_08402D08
	movs r3, 0x4
_081333EC:
	ldr r0, [r5]
	adds r0, r2
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0xF
	ble _081333EC
	ldr r0, [r6]
	cmp r0, 0
	beq _08133430
	ldr r5, _0813345C @ =gTileBuffer
	adds r4, r6, 0
_08133412:
	ldr r1, [r4]
	adds r0, r5, 0
	movs r2, 0x40
	movs r3, 0x2
	bl sub_8072C74
	ldrb r1, [r4, 0x4]
	ldrb r2, [r4, 0x5]
	adds r0, r5, 0
	bl MenuPrint
	adds r4, 0x8
	ldr r0, [r4]
	cmp r0, 0
	bne _08133412
_08133430:
	cmp r7, 0
	bne _08133448
	ldr r0, _08133460 @ =gOtherText_TeachWhichMove
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0x78
	movs r3, 0xC0
	bl sub_8072AB0
_08133448:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133450: .4byte gSprites
_08133454: .4byte gUnknown_030007B0
_08133458: .4byte gUnknown_08402D08
_0813345C: .4byte gTileBuffer
_08133460: .4byte gOtherText_TeachWhichMove
	thumb_func_end sub_8133030

	thumb_func_start sub_81330E8
sub_81330E8: @ 8133464
	push {r4,lr}
	ldr r0, _081334B0 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _081334B4 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08133488
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _08133488
	adds r4, 0x1
_08133488:
	cmp r4, 0
	beq _081334A6
	movs r0, 0x5
	bl PlaySE
	ldr r2, _081334B8 @ =gUnknown_030007B0
	ldr r1, [r2]
	movs r0, 0x5
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_081334A6:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081334B0: .4byte gMain
_081334B4: .4byte gSaveBlock2
_081334B8: .4byte gUnknown_030007B0
	thumb_func_end sub_81330E8

	thumb_func_start sub_8133140
sub_8133140: @ 81334BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldr r4, _081335B0 @ =gSprites
	ldr r5, _081335B4 @ =gUnknown_030007B0
	ldr r0, [r5]
	ldrb r0, [r0, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	adds r1, r3, 0
	ands r1, r2
	strb r1, [r0]
	movs r6, 0
	ldr r7, _081335B8 @ =gUnknown_08402D08
_08133506:
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0, 0x7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0xF
	ble _08133506
	movs r6, 0
	ldr r0, [r7]
	cmp r0, 0
	beq _08133584
	mov r9, r7
	mov r10, r6
	movs r0, 0x24
	add r0, r9
	mov r8, r0
_08133536:
	mov r0, r9
	adds r0, 0x20
	add r0, r10
	ldr r1, [r0]
	ldr r0, _081335BC @ =gTileBuffer
	movs r2, 0x40
	movs r3, 0x2
	bl sub_8072C74
	mov r0, r8
	ldrb r5, [r0]
	ldrb r4, [r0, 0x1]
	ldr r0, _081335BC @ =gTileBuffer
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	cmp r6, 0
	beq _08133574
	adds r1, r4, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r5, 0x7
	lsls r2, 24
	lsrs r2, 24
	adds r3, r4, 0x3
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	bl MenuZeroFillWindowRect
_08133574:
	movs r0, 0x8
	add r10, r0
	add r8, r0
	adds r7, 0x8
	adds r6, 0x1
	ldr r0, [r7]
	cmp r0, 0
	bne _08133536
_08133584:
	ldr r0, [sp, 0x8]
	cmp r0, 0
	bne _0813359E
	ldr r0, _081335C0 @ =gOtherText_TeachWhichMove
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0x78
	movs r3, 0xC0
	bl sub_8072AB0
_0813359E:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081335B0: .4byte gSprites
_081335B4: .4byte gUnknown_030007B0
_081335B8: .4byte gUnknown_08402D08
_081335BC: .4byte gTileBuffer
_081335C0: .4byte gOtherText_TeachWhichMove
	thumb_func_end sub_8133140

	thumb_func_start sub_8133248
sub_8133248: @ 81335C4
	push {r4,lr}
	ldr r0, _08133610 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _08133614 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _081335E8
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _081335E8
	adds r4, 0x1
_081335E8:
	cmp r4, 0
	beq _08133606
	movs r0, 0x5
	bl PlaySE
	ldr r2, _08133618 @ =gUnknown_030007B0
	ldr r1, [r2]
	movs r3, 0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	strb r3, [r0]
_08133606:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133610: .4byte gMain
_08133614: .4byte gSaveBlock2
_08133618: .4byte gUnknown_030007B0
	thumb_func_end sub_8133248

	thumb_func_start sub_81332A0
sub_81332A0: @ 813361C
	push {r4,lr}
	ldr r2, _08133674 @ =gUnknown_030007B0
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x2]
	ldr r0, [r2]
	strb r1, [r0, 0x19]
	ldr r0, [r2]
	strb r1, [r0, 0x18]
	ldr r0, [r2]
	strb r1, [r0, 0x1C]
	ldr r0, [r2]
	strb r1, [r0, 0x1A]
	ldr r0, [r2]
	strb r1, [r0, 0x1B]
	ldr r0, [r2]
	strb r1, [r0, 0x1D]
	ldr r0, [r2]
	strb r1, [r0, 0x1E]
	ldr r0, [r2]
	ldr r3, _08133678 @ =0x000002c3
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x1
	adds r0, r3
	strb r1, [r0]
	movs r3, 0
	adds r4, r2, 0
	movs r2, 0
_0813365C:
	ldr r0, [r4]
	lsls r1, r3, 1
	adds r0, 0x20
	adds r0, r1
	strh r2, [r0]
	adds r3, 0x1
	cmp r3, 0x13
	ble _0813365C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08133674: .4byte gUnknown_030007B0
_08133678: .4byte 0x000002c3
	thumb_func_end sub_81332A0

	thumb_func_start sub_8133300
sub_8133300: @ 813367C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0xFF
	ands r1, r0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _081336A0
	cmp r0, 0x1
	ble _081336C6
	cmp r0, 0x2
	beq _081336B4
	b _081336C6
_081336A0:
	adds r0, r1, 0
	movs r1, 0x3
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x24]
	b _081336C6
_081336B4:
	adds r0, r1, 0
	movs r1, 0x1
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x26]
_081336C6:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133300

	thumb_func_start sub_8133358
sub_8133358: @ 81336D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r6, _081338B8 @ =gSpriteTemplate_8402D90
	adds r0, r6, 0
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r4, _081338BC @ =gUnknown_030007B0
	ldr r1, [r4]
	strb r0, [r1, 0x3]
	ldr r5, _081338C0 @ =gSprites
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	mov r8, r1
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081338C4 @ =0x0000ffff
	strh r1, [r0, 0x32]
	adds r0, r6, 0
	movs r1, 0x48
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x4]
	ldr r0, [r4]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldr r0, _081338C8 @ =gSpriteTemplate_8402DC0
	mov r9, r0
	movs r1, 0xA0
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x5]
	ldr r0, [r4]
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r6, 0x2
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x32]
	mov r0, r9
	movs r1, 0xA0
	movs r2, 0x3C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x6]
	ldr r2, [r4]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	movs r5, 0
	ldr r6, _081338CC @ =gSpriteTemplate_8402E08
_081337CA:
	adds r2, r5, 0
	cmp r5, 0
	bge _081337D2
	adds r2, r5, 0x3
_081337D2:
	asrs r2, 2
	lsls r1, r2, 2
	subs r1, r5, r1
	lsls r1, 19
	movs r0, 0xE0
	lsls r0, 13
	adds r1, r0
	asrs r1, 16
	lsls r2, 19
	movs r0, 0xD0
	lsls r0, 14
	adds r2, r0
	asrs r2, 16
	adds r0, r6, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r2, r5, 0x4
	adds r1, 0x3
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081338C0 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _081337CA
	movs r5, 0
	ldr r7, _081338CC @ =gSpriteTemplate_8402E08
	ldr r6, _081338BC @ =gUnknown_030007B0
_08133822:
	adds r2, r5, 0
	cmp r5, 0
	bge _0813382A
	adds r2, r5, 0x3
_0813382A:
	asrs r2, 2
	lsls r1, r2, 2
	subs r1, r5, r1
	lsls r1, 19
	movs r0, 0xE0
	lsls r0, 13
	adds r1, r0
	asrs r1, 16
	lsls r2, 19
	movs r0, 0xB8
	lsls r0, 15
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r2, r5, 0
	adds r2, 0xC
	adds r1, 0x3
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _081338C0 @ =gSprites
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _08133822
	movs r5, 0
	ldr r3, _081338BC @ =gUnknown_030007B0
	movs r2, 0x4
_0813387C:
	ldr r0, [r3]
	adds r0, 0x3
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x13
	ble _0813387C
	ldr r1, _081338C4 @ =0x0000ffff
	ldr r3, _081338D0 @ =0x00002d9f
	movs r0, 0x12
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081338B8: .4byte gSpriteTemplate_8402D90
_081338BC: .4byte gUnknown_030007B0
_081338C0: .4byte gSprites
_081338C4: .4byte 0x0000ffff
_081338C8: .4byte gSpriteTemplate_8402DC0
_081338CC: .4byte gSpriteTemplate_8402E08
_081338D0: .4byte 0x00002d9f
	thumb_func_end sub_8133358

	thumb_func_start sub_8133558
sub_8133558: @ 81338D4
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r5, _08133970 @ =gUnknown_030007B0
	ldr r1, [r5]
	ldr r2, _08133974 @ =0x000002c5
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08133978 @ =gPlayerParty
	adds r0, r2
	adds r1, 0x20
	bl sub_80403CC
	ldr r1, [r5]
	strb r0, [r1, 0x1A]
	movs r4, 0
	ldr r0, [r5]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	bge _08133926
	adds r6, r5, 0
	movs r5, 0x52
_08133902:
	lsls r2, r4, 1
	ldr r1, [r6]
	adds r0, r1, r5
	adds r1, 0x20
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0813397C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r5, 0x19
	adds r4, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	blt _08133902
_08133926:
	ldr r4, _08133970 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldr r1, _08133974 @ =0x000002c5
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08133978 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08133980 @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, [r4]
	ldrb r2, [r0, 0x1A]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 3
	adds r1, r2
	adds r1, 0x52
	adds r0, r1
	ldr r1, _08133984 @ =gUnknownText_Exit
	bl StringCopy
	ldr r1, [r4]
	ldrb r0, [r1, 0x1A]
	adds r0, 0x1
	strb r0, [r1, 0x1A]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08133970: .4byte gUnknown_030007B0
_08133974: .4byte 0x000002c5
_08133978: .4byte gPlayerParty
_0813397C: .4byte gMoveNames
_08133980: .4byte gStringVar1
_08133984: .4byte gUnknownText_Exit
	thumb_func_end sub_8133558

	thumb_func_start sub_813360C
sub_813360C: @ 8133988
	lsls r0, 24
	ldr r3, _081339A4 @ =gUnknown_030007B0
	ldr r2, [r3]
	ldrb r1, [r2, 0x18]
	strb r1, [r2, 0x1C]
	ldr r1, [r3]
	lsrs r0, 24
	ldrb r2, [r1, 0x18]
	adds r0, r2
	strb r0, [r1, 0x18]
	ldr r1, [r3]
	movs r0, 0x1
	strb r0, [r1, 0x1D]
	bx lr
	.align 2, 0
_081339A4: .4byte gUnknown_030007B0
	thumb_func_end sub_813360C

	thumb_func_start sub_813362C
sub_813362C: @ 81339A8
	push {r4,r5,lr}
	ldr r2, _081339EC @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08133A04
	ldr r4, _081339F0 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _081339C2
	b _08133B12
_081339C2:
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x1B]
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	ldr r1, _081339F4 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	beq _081339F8
	movs r0, 0x1
	negs r0, r0
	bl sub_813360C
	b _08133B12
	.align 2, 0
_081339EC: .4byte gMain
_081339F0: .4byte gUnknown_030007B0
_081339F4: .4byte 0x000002c3
_081339F8:
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	bne _08133A00
	b _08133B12
_08133A00:
	subs r0, 0x1
	b _08133A58
_08133A04:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08133A64
	ldr r4, _08133A44 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldrb r1, [r0, 0x1B]
	ldrb r0, [r0, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	blt _08133A1C
	b _08133B12
_08133A1C:
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x1B]
	adds r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	ldr r3, _08133A48 @ =0x000002c3
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0x2
	beq _08133A4C
	movs r0, 0x1
	bl sub_813360C
	b _08133B12
	.align 2, 0
_08133A44: .4byte gUnknown_030007B0
_08133A48: .4byte 0x000002c3
_08133A4C:
	ldrb r2, [r1, 0x19]
	ldrb r0, [r1, 0x1A]
	subs r0, 0x3
	cmp r2, r0
	beq _08133B12
	adds r0, r2, 0x1
_08133A58:
	strb r0, [r1, 0x19]
	ldr r1, [r4]
	ldrb r0, [r1, 0x1E]
	adds r0, 0x1
	strb r0, [r1, 0x1E]
	b _08133B12
_08133A64:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08133AE8
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08133AB4 @ =gUnknown_030007B0
	ldr r2, [r5]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	beq _08133AC4
	movs r0, 0x8
	strb r0, [r2]
	ldr r0, _08133AB8 @ =gStringVar2
	ldr r1, [r5]
	ldrb r3, [r1, 0x1B]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 3
	adds r2, r3
	adds r2, 0x52
	adds r1, r2
	bl StringCopy
	ldr r4, _08133ABC @ =gStringVar4
	ldr r1, _08133AC0 @ =gOtherText_TeachSpecificMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	b _08133B12
	.align 2, 0
_08133AB4: .4byte gUnknown_030007B0
_08133AB8: .4byte gStringVar2
_08133ABC: .4byte gStringVar4
_08133AC0: .4byte gOtherText_TeachSpecificMove
_08133AC4:
	ldr r4, _08133AE0 @ =gStringVar4
	ldr r1, _08133AE4 @ =gOtherText_GiveUpTeachingMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, [r5]
	movs r0, 0xC
	strb r0, [r1]
	b _08133B12
	.align 2, 0
_08133AE0: .4byte gStringVar4
_08133AE4: .4byte gOtherText_GiveUpTeachingMove
_08133AE8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08133B12
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08133B50 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0xC
	strb r0, [r1]
	ldr r4, _08133B54 @ =gStringVar4
	ldr r1, _08133B58 @ =gOtherText_GiveUpTeachingMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
_08133B12:
	ldr r0, _08133B50 @ =gUnknown_030007B0
	ldr r4, [r0]
	ldrb r0, [r4, 0x1A]
	cmp r0, 0x3
	bls _08133B74
	ldr r3, _08133B5C @ =gSprites
	adds r5, r3, 0
	adds r5, 0xC6
	ldrb r0, [r5]
	movs r1, 0x5
	negs r1, r1
	adds r2, r1, 0
	ands r2, r0
	strb r2, [r5]
	movs r0, 0x85
	lsls r0, 1
	adds r0, r3
	mov r12, r0
	ldrb r0, [r0]
	adds r3, r1, 0
	ands r3, r0
	mov r1, r12
	strb r3, [r1]
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	bne _08133B60
	movs r1, 0x4
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r5]
	b _08133B74
	.align 2, 0
_08133B50: .4byte gUnknown_030007B0
_08133B54: .4byte gStringVar4
_08133B58: .4byte gOtherText_GiveUpTeachingMove
_08133B5C: .4byte gSprites
_08133B60:
	ldrb r1, [r4, 0x19]
	ldrb r0, [r4, 0x1A]
	subs r0, 0x3
	cmp r1, r0
	bne _08133B74
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	mov r3, r12
	strb r0, [r3]
_08133B74:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813362C

	thumb_func_start sub_8133800
sub_8133800: @ 8133B7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08133BB0 @ =gUnknown_030007B0
	ldr r0, [r1]
	ldrb r6, [r0, 0x19]
	ldr r3, _08133BB4 @ =gTileBuffer
	mov r10, r1
	ldr r0, _08133BB8 @ =gBattleMoves
	mov r9, r0
	movs r1, 0x2
	mov r8, r1
_08133B98:
	mov r4, r10
	ldr r2, [r4]
	ldrb r0, [r2, 0x1A]
	cmp r6, r0
	bcc _08133BC0
	adds r0, r3, 0
	ldr r1, _08133BBC @ =gEmptyString_81E72B0
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C74
	b _08133C76
	.align 2, 0
_08133BB0: .4byte gUnknown_030007B0
_08133BB4: .4byte gTileBuffer
_08133BB8: .4byte gBattleMoves
_08133BBC: .4byte gEmptyString_81E72B0
_08133BC0:
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r6, r0
	bne _08133BDC
	adds r0, r3, 0
	ldr r1, _08133BD8 @ =gUnknownText_Exit
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C74
	b _08133C76
	.align 2, 0
_08133BD8: .4byte gUnknownText_Exit
_08133BDC:
	lsls r1, r6, 1
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r1
	ldrh r5, [r0]
	movs r4, 0xB1
	lsls r4, 2
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	beq _08133C20
	ldr r1, _08133C18 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 27
	ldr r1, _08133C1C @ =gUnknown_083CAF70
	adds r0, r1
	ldr r1, [r0]
	adds r0, r3, 0
	movs r2, 0x27
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
	lsls r4, r5, 1
	b _08133C3E
	.align 2, 0
_08133C18: .4byte gContestMoves
_08133C1C: .4byte gUnknown_083CAF70
_08133C20:
	lsls r4, r5, 1
	adds r0, r4, r5
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08133CB4 @ =gTypeNames
	adds r1, r0
	adds r0, r3, 0
	movs r2, 0x27
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
_08133C3E:
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r6
	adds r0, 0x52
	mov r2, r10
	ldr r1, [r2]
	adds r1, r0
	adds r0, r3, 0
	movs r2, 0x72
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
	movs r0, 0xCA
	strb r0, [r3]
	strb r0, [r3, 0x1]
	movs r0, 0xBA
	strb r0, [r3, 0x2]
	adds r3, 0x3
	adds r0, r4, r5
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x4]
	adds r0, r3, 0
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C14
_08133C76:
	adds r3, r0, 0
	movs r0, 0xFE
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0x1
	negs r4, r4
	add r8, r4
	mov r0, r8
	cmp r0, 0
	blt _08133C92
	b _08133B98
_08133C92:
	movs r0, 0xFF
	strb r0, [r3]
	ldr r0, _08133CB8 @ =gTileBuffer
	movs r1, 0xB
	movs r2, 0x1
	bl MenuPrint
	movs r0, 0
	bl sub_813360C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133CB4: .4byte gTypeNames
_08133CB8: .4byte gTileBuffer
	thumb_func_end sub_8133800

	thumb_func_start sub_8133940
sub_8133940: @ 8133CBC
	push {r4-r7,lr}
	sub sp, 0x34
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08133CE4 @ =gExpandedPlaceholder_Empty
	mov r0, sp
	bl StringCopy
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	cmp r0, 0x6
	bls _08133CD8
	b _08133E5E
_08133CD8:
	lsls r0, 2
	ldr r1, _08133CE8 @ =_08133CEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08133CE4: .4byte gExpandedPlaceholder_Empty
_08133CE8: .4byte _08133CEC
	.align 2, 0
_08133CEC:
	.4byte _08133E5E
	.4byte _08133D08
	.4byte _08133E5E
	.4byte _08133D20
	.4byte _08133E5E
	.4byte _08133D60
	.4byte _08133DE0
_08133D08:
	ldr r0, _08133D1C @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bls _08133D30
	ldrb r1, [r1, 0x1]
	b _08133D4A
	.align 2, 0
_08133D1C: .4byte gBattleMoves
_08133D20:
	ldr r0, _08133D40 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _08133D48
_08133D30:
	ldr r1, _08133D44 @ =gOtherText_ThreeDashes2
	mov r0, sp
	movs r2, 0x20
	movs r3, 0x2
	bl sub_8072C74
	b _08133D54
	.align 2, 0
_08133D40: .4byte gBattleMoves
_08133D44: .4byte gOtherText_ThreeDashes2
_08133D48:
	ldrb r1, [r1, 0x3]
_08133D4A:
	mov r0, sp
	movs r2, 0x20
	movs r3, 0x2
	bl sub_8072C14
_08133D54:
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	mov r0, sp
	bl MenuPrint
	b _08133E5E
_08133D60:
	ldrb r2, [r4]
	ldrb r1, [r4, 0x1]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldr r2, _08133DB0 @ =gContestEffects
	ldr r1, _08133DB4 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	bne _08133D90
	movs r5, 0
_08133D90:
	movs r4, 0
	ldr r7, _08133DB8 @ =gUnknown_030007B0
	ldr r6, _08133DBC @ =gSprites
_08133D96:
	cmp r4, r5
	bcs _08133DC0
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAnim
	b _08133DD4
	.align 2, 0
_08133DB0: .4byte gContestEffects
_08133DB4: .4byte gContestMoves
_08133DB8: .4byte gUnknown_030007B0
_08133DBC: .4byte gSprites
_08133DC0:
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
_08133DD4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133D96
	b _08133E5E
_08133DE0:
	ldrb r2, [r4]
	ldrb r1, [r4, 0x1]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldr r2, _08133E30 @ =gContestEffects
	ldr r1, _08133E34 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	bne _08133E10
	movs r5, 0
_08133E10:
	movs r4, 0
	ldr r7, _08133E38 @ =gUnknown_030007B0
	ldr r6, _08133E3C @ =gSprites
_08133E16:
	cmp r4, r5
	bcs _08133E40
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x3
	bl StartSpriteAnim
	b _08133E54
	.align 2, 0
_08133E30: .4byte gContestEffects
_08133E34: .4byte gContestMoves
_08133E38: .4byte gUnknown_030007B0
_08133E3C: .4byte gSprites
_08133E40:
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartSpriteAnim
_08133E54:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133E16
_08133E5E:
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8133940

	thumb_func_start sub_8133AEC
sub_8133AEC: @ 8133E68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08133F04 @ =gUnknown_030007B0
	ldr r2, [r6]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	bne _08133E84
	b _08133F80
_08133E84:
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r1
	ldrh r5, [r0]
	cmp r3, 0
	beq _08133F1C
	movs r4, 0
	lsls r0, r5, 3
	mov r8, r0
	ldr r7, _08133F08 @ =gSprites
	adds r3, r6, 0
	movs r6, 0x5
	negs r6, r6
_08133EA0:
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08133EA0
	movs r4, 0
_08133EC4:
	ldr r0, _08133F0C @ =gUnknown_08402E3D
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133F10 @ =gUnknown_08402E24
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08133EC4
	ldr r1, _08133F14 @ =gUnknown_083CADD4
	ldr r0, _08133F18 @ =gContestMoves
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0x90
	bl sub_8072AB0
	b _0813400E
	.align 2, 0
_08133F04: .4byte gUnknown_030007B0
_08133F08: .4byte gSprites
_08133F0C: .4byte gUnknown_08402E3D
_08133F10: .4byte gUnknown_08402E24
_08133F14: .4byte gUnknown_083CADD4
_08133F18: .4byte gContestMoves
_08133F1C:
	movs r4, 0
	subs r6, r5, 0x1
_08133F20:
	ldr r0, _08133F74 @ =gUnknown_08402E39
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133F78 @ =gUnknown_08402E24
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08133F20
	ldr r1, _08133F7C @ =gMoveDescriptions
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0x90
	bl sub_8072A18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0813400E
	lsls r1, r0, 25
	movs r0, 0x90
	lsls r0, 20
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xB
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuFillWindowRectWithBlankTile
	b _0813400E
	.align 2, 0
_08133F74: .4byte gUnknown_08402E39
_08133F78: .4byte gUnknown_08402E24
_08133F7C: .4byte gMoveDescriptions
_08133F80:
	cmp r3, 0
	beq _08133FD8
	ldr r4, _08133FD0 @ =gUnknown_08402E24
	ldrb r2, [r4, 0xF]
	ldrb r1, [r4, 0x10]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldrb r2, [r4, 0x12]
	ldrb r1, [r4, 0x13]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	movs r4, 0
	ldr r5, _08133FD4 @ =gSprites
	adds r3, r6, 0
	movs r2, 0x4
_08133FAE:
	ldr r0, [r3]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08133FAE
	b _08134002
	.align 2, 0
_08133FD0: .4byte gUnknown_08402E24
_08133FD4: .4byte gSprites
_08133FD8:
	ldr r4, _0813401C @ =gUnknown_08402E24
	ldrb r0, [r4, 0x3]
	ldrb r1, [r4, 0x4]
	adds r2, r0, 0x3
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	adds r2, r0, 0x3
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
_08134002:
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
_0813400E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813401C: .4byte gUnknown_08402E24
	thumb_func_end sub_8133AEC

	thumb_func_start sub_8133CA4
sub_8133CA4: @ 8134020
	push {lr}
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1B
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _08134044 @ =gUnknown_030007B0
	ldr r0, [r0]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8133AEC
	pop {r0}
	bx r0
	.align 2, 0
_08134044: .4byte gUnknown_030007B0
	thumb_func_end sub_8133CA4

	thumb_func_start SetUpFieldMove_SoftBoiled
SetUpFieldMove_SoftBoiled: @ 8134048
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08134090 @ =gUnknown_03005CE0
	mov r8, r0
	ldrb r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r4, _08134094 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r8
	ldrb r0, [r1]
	muls r0, r6
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bcs _08134098
	movs r0, 0
	b _0813409A
	.align 2, 0
_08134090: .4byte gUnknown_03005CE0
_08134094: .4byte gPlayerParty
_08134098:
	movs r0, 0x1
_0813409A:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_SoftBoiled

	thumb_func_start sub_8133D28
sub_8133D28: @ 81340A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081340C0 @ =0x02001000
	ldr r2, _081340C4 @ =sub_8133D50
	str r2, [r1, 0xC]
	ldr r2, _081340C8 @ =0x0001a272
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1]
	bl sub_808A004
	pop {r0}
	bx r0
	.align 2, 0
_081340C0: .4byte 0x02001000
_081340C4: .4byte sub_8133D50
_081340C8: .4byte 0x0001a272
	thumb_func_end sub_8133D28

	thumb_func_start sub_8133D50
sub_8133D50: @ 81340CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813411C @ =gSprites
	mov r9, r0
	ldr r1, _08134120 @ =0x02001000
	mov r10, r1
	ldrb r1, [r1, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r2, r10
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	cmp r0, 0x5
	bhi _08134112
	cmp r6, 0x5
	bls _08134124
_08134112:
	adds r0, r7, 0
	bl sub_806CD44
	b _081341CA
	.align 2, 0
_0813411C: .4byte gSprites
_08134120: .4byte 0x02001000
_08134124:
	movs r5, 0xD8
	lsls r5, 9
	add r5, r10
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	movs r1, 0x64
	muls r0, r1
	ldr r2, _08134160 @ =gPlayerParty
	adds r0, r2
	str r0, [r5]
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08134156
	cmp r8, r6
	beq _08134156
	ldr r0, [r5]
	movs r1, 0x3A
	bl GetMonData
	cmp r0, r4
	bne _08134164
_08134156:
	adds r0, r7, 0
	bl sub_8133EB8
	b _081341CA
	.align 2, 0
_08134160: .4byte gPlayerParty
_08134164:
	movs r0, 0x1
	bl PlaySE
	mov r0, r10
	ldrb r1, [r0, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x2E]
	movs r1, 0
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x5]
	movs r2, 0x64
	muls r0, r2
	ldr r2, _081341D8 @ =gPlayerParty
	adds r0, r2
	str r0, [r5]
	strh r1, [r5, 0x6]
	ldr r1, _081341DC @ =0xffff8000
	str r1, [r5, 0xC]
	ldr r1, _081341E0 @ =sub_8133EF8
	str r1, [r5, 0x10]
	movs r1, 0x3A
	bl GetMonData
	ldr r1, _081341E4 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r1
	strh r0, [r4, 0x1C]
	ldr r0, [r5]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x1E]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __divsi3
	strh r0, [r4, 0x20]
	bl sub_806D5A4
	ldr r0, _081341E8 @ =sub_806FA18
	str r0, [r4]
	ldrh r1, [r4, 0x1E]
	ldr r0, _081341EC @ =0x0001a282
	add r0, r10
	strh r1, [r0]
_081341CA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081341D8: .4byte gPlayerParty
_081341DC: .4byte 0xffff8000
_081341E0: .4byte sub_8133EF8
_081341E4: .4byte gTasks
_081341E8: .4byte sub_806FA18
_081341EC: .4byte 0x0001a282
	thumb_func_end sub_8133D50

	thumb_func_start sub_8133E74
sub_8133E74: @ 81341F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08134228 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08134220
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x3
	movs r1, 0
	bl sub_806D538
	ldr r0, _0813422C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08134230 @ =sub_806CB74
	str r0, [r1]
_08134220:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134228: .4byte gUnknown_0202E8F6
_0813422C: .4byte gTasks
_08134230: .4byte sub_806CB74
	thumb_func_end sub_8133E74

	thumb_func_start sub_8133EB8
sub_8133EB8: @ 8134234
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08134264 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	bl sub_806D5A4
	ldr r0, _08134268 @ =gOtherText_CantUseOnPoke
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0813426C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08134270 @ =sub_8133E74
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08134264: .4byte gUnknown_0202E8F4
_08134268: .4byte gOtherText_CantUseOnPoke
_0813426C: .4byte gTasks
_08134270: .4byte sub_8133E74
	thumb_func_end sub_8133EB8

	thumb_func_start sub_8133EF8
sub_8133EF8: @ 8134274
	push {r4,lr}
	bl sub_806CCE4
	ldr r4, _081342B8 @ =0x0201b000
	ldr r0, _081342BC @ =0x00000261
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _081342C0 @ =0xfffe6000
	adds r4, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081342C4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldrb r0, [r4]
	bl SwitchTaskToFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081342B8: .4byte 0x0201b000
_081342BC: .4byte 0x00000261
_081342C0: .4byte 0xfffe6000
_081342C4: .4byte gSprites
	thumb_func_end sub_8133EF8

	thumb_func_start sub_8133F4C
sub_8133F4C: @ 81342C8
	push {r4,r5,lr}
	lsls r0, 24
	movs r3, 0
	ldr r1, _081342F8 @ =gDecorationInventories
	lsrs r2, r0, 21
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _081342F2
	adds r5, r1, 0
	movs r4, 0
_081342DE:
	adds r0, r2, r5
	ldr r1, [r0]
	adds r1, r3
	strb r4, [r1]
	adds r1, r3, 0x1
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _081342DE
_081342F2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081342F8: .4byte gDecorationInventories
	thumb_func_end sub_8133F4C

	thumb_func_start sub_8133F80
sub_8133F80: @ 81342FC
	push {r4,lr}
	movs r4, 0
_08134300:
	adds r0, r4, 0
	bl sub_8133F4C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08134300
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133F80

	thumb_func_start sub_8133F9C
sub_8133F9C: @ 8134318
	push {r4,lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _08134344 @ =gDecorationInventories
	lsrs r0, 21
	adds r0, r1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	cmp r2, r1
	bge _08134354
	adds r4, r0, 0
	adds r3, r1, 0
_08134330:
	lsls r0, r2, 24
	asrs r1, r0, 24
	ldr r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08134348
	adds r0, r1, 0
	b _08134358
	.align 2, 0
_08134344: .4byte gDecorationInventories
_08134348:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, r3
	blt _08134330
_08134354:
	movs r0, 0x1
	negs r0, r0
_08134358:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8133F9C

	thumb_func_start sub_8133FE4
sub_8133FE4: @ 8134360
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813438C @ =gDecorations
	lsls r0, r3, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	movs r2, 0
	ldr r1, _08134390 @ =gDecorationInventories
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _0813439E
	ldr r4, [r0]
_0813437E:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, r3
	bne _08134394
	movs r0, 0x1
	b _081343A0
	.align 2, 0
_0813438C: .4byte gDecorations
_08134390: .4byte gDecorationInventories
_08134394:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _0813437E
_0813439E:
	movs r0, 0
_081343A0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8133FE4

	thumb_func_start IsThereStorageSpaceForDecoration
IsThereStorageSpaceForDecoration: @ 81343A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0
	beq _081343E8
	ldr r1, _081343E0 @ =gDecorations
	lsls r0, r4, 5
	adds r0, r1
	ldrb r5, [r0, 0x13]
	adds r0, r5, 0
	bl sub_8133F9C
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _081343E8
	ldr r0, _081343E4 @ =gDecorationInventories
	lsls r1, r5, 3
	adds r1, r0
	ldr r0, [r1]
	adds r0, r2
	strb r4, [r0]
	movs r0, 0x1
	b _081343EA
	.align 2, 0
_081343E0: .4byte gDecorations
_081343E4: .4byte gDecorationInventories
_081343E8:
	movs r0, 0
_081343EA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsThereStorageSpaceForDecoration

	thumb_func_start sub_8134074
sub_8134074: @ 81343F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0813441C
	ldr r1, _08134418 @ =gDecorations
	lsls r0, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	bl sub_8133F9C
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0813441C
	movs r0, 0x1
	b _0813441E
	.align 2, 0
_08134418: .4byte gDecorations
_0813441C:
	movs r0, 0
_0813441E:
	pop {r1}
	bx r1
	thumb_func_end sub_8134074

	thumb_func_start sub_81340A8
sub_81340A8: @ 8134424
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	cmp r5, 0
	bne _08134440
	b _0813446E
_08134432:
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl sub_8134104
	movs r0, 0x1
	b _08134470
_08134440:
	ldr r2, _08134478 @ =gDecorationInventories
	ldr r1, _0813447C @ =gDecorations
	lsls r0, r5, 5
	adds r0, r1
	ldrb r4, [r0, 0x13]
	lsls r0, r4, 3
	adds r0, r2
	ldrb r1, [r0, 0x4]
	cmp r3, r1
	bcs _0813446E
	adds r6, r4, 0
	adds r4, r0, 0
	adds r2, r1, 0
_0813445A:
	ldr r0, [r4]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, r5
	beq _08134432
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r2
	bcc _0813445A
_0813446E:
	movs r0, 0
_08134470:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08134478: .4byte gDecorationInventories
_0813447C: .4byte gDecorations
	thumb_func_end sub_81340A8

	thumb_func_start sub_8134104
sub_8134104: @ 8134480
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	movs r6, 0
	ldr r2, _0813450C @ =gDecorationInventories
	lsrs r1, r0, 21
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r6, r0
	bcs _081344FC
	adds r7, r1, 0
	mov r8, r0
	str r0, [sp]
_081344A2:
	adds r1, r6, 0x1
	lsls r0, r1, 24
	lsrs r3, r0, 24
	adds r2, r7, 0
	mov r12, r1
	cmp r3, r8
	bcs _081344F0
	ldr r1, _0813450C @ =gDecorationInventories
	mov r10, r1
	adds r0, r1, 0
	mov r9, r0
_081344B8:
	mov r1, r10
	adds r5, r2, r1
	ldr r1, [r5]
	adds r0, r1, r3
	ldrb r4, [r0]
	adds r2, r4, 0
	cmp r2, 0
	beq _081344DE
	adds r0, r1, r6
	ldrb r1, [r0]
	cmp r1, 0
	beq _081344D4
	cmp r1, r2
	bls _081344DE
_081344D4:
	ldrb r1, [r0]
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r3
	strb r1, [r0]
_081344DE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r7, 0
	mov r1, r9
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _081344B8
_081344F0:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r0, [sp]
	cmp r6, r0
	bcc _081344A2
_081344FC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813450C: .4byte gDecorationInventories
	thumb_func_end sub_8134104

	thumb_func_start sub_8134194
sub_8134194: @ 8134510
	push {r4,r5,lr}
	lsls r0, 24
	movs r4, 0
	movs r3, 0
	ldr r2, _0813454C @ =gDecorationInventories
	lsrs r1, r0, 21
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcs _08134544
	adds r5, r2, 0
_08134526:
	adds r2, r1, r5
	ldr r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _08134538
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08134538:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r2, [r2, 0x4]
	cmp r3, r2
	bcc _08134526
_08134544:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0813454C: .4byte gDecorationInventories
	thumb_func_end sub_8134194

	thumb_func_start sub_81341D4
sub_81341D4: @ 8134550
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_08134556:
	adds r0, r4, 0
	bl sub_8134194
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08134556
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81341D4

	thumb_func_start sub_81341F8
sub_81341F8: @ 8134574
	push {lr}
	ldr r0, _08134584 @ =0x02028878
	movs r1, 0
	movs r2, 0x1C
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08134584: .4byte 0x02028878
	thumb_func_end sub_81341F8

	thumb_func_start sub_813420C
sub_813420C: @ 8134588
	push {r4-r6,lr}
	movs r2, 0
	ldr r6, _081345B4 @ =gRoamerLocation
	ldr r4, _081345B8 @ =gUnknown_020392FC
	movs r3, 0
	adds r5, r4, 0x1
_08134594:
	lsls r1, r2, 1
	adds r0, r1, r4
	strb r3, [r0]
	adds r1, r5
	strb r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08134594
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081345B4: .4byte gRoamerLocation
_081345B8: .4byte gUnknown_020392FC
	thumb_func_end sub_813420C

	thumb_func_start sub_8134240
sub_8134240: @ 81345BC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r5, _08134678 @ =gEnemyParty
	movs r6, 0xCC
	lsls r6, 1
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x28
	movs r3, 0x20
	bl CreateMon
	ldr r4, _0813467C @ =0x02028878
	movs r0, 0
	mov r8, r0
	strh r6, [r4, 0x8]
	movs r0, 0x28
	strb r0, [r4, 0xC]
	mov r0, r8
	strb r0, [r4, 0xD]
	movs r0, 0x1
	strb r0, [r4, 0x13]
	adds r0, r5, 0
	movs r1, 0x42
	bl GetMonData
	str r0, [r4]
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	str r0, [r4, 0x4]
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x16
	bl GetMonData
	strb r0, [r4, 0xE]
	adds r0, r5, 0
	movs r1, 0x17
	bl GetMonData
	strb r0, [r4, 0xF]
	adds r0, r5, 0
	movs r1, 0x18
	bl GetMonData
	strb r0, [r4, 0x10]
	adds r0, r5, 0
	movs r1, 0x21
	bl GetMonData
	strb r0, [r4, 0x11]
	adds r0, r5, 0
	movs r1, 0x2F
	bl GetMonData
	strb r0, [r4, 0x12]
	ldr r4, _08134680 @ =gRoamerLocation
	mov r0, r8
	strb r0, [r4]
	bl Random
	ldr r5, _08134684 @ =gRoamerLocations
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r5
	ldrb r0, [r1]
	strb r0, [r4, 0x1]
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134678: .4byte gEnemyParty
_0813467C: .4byte 0x02028878
_08134680: .4byte gRoamerLocation
_08134684: .4byte gRoamerLocations
	thumb_func_end sub_8134240

	thumb_func_start sub_813430C
sub_813430C: @ 8134688
	push {lr}
	bl sub_81341F8
	bl sub_813420C
	bl sub_8134240
	pop {r0}
	bx r0
	thumb_func_end sub_813430C

	thumb_func_start mapnumbers_history_shift_sav1_0_2_4_out
mapnumbers_history_shift_sav1_0_2_4_out: @ 813469C
	ldr r0, _081346BC @ =gUnknown_020392FC
	ldrb r1, [r0, 0x2]
	strb r1, [r0, 0x4]
	ldrb r1, [r0, 0x3]
	strb r1, [r0, 0x5]
	ldrb r1, [r0]
	strb r1, [r0, 0x2]
	ldrb r1, [r0, 0x1]
	strb r1, [r0, 0x3]
	ldr r2, _081346C0 @ =gSaveBlock1
	ldrb r1, [r2, 0x4]
	strb r1, [r0]
	ldrb r1, [r2, 0x5]
	strb r1, [r0, 0x1]
	bx lr
	.align 2, 0
_081346BC: .4byte gUnknown_020392FC
_081346C0: .4byte gSaveBlock1
	thumb_func_end mapnumbers_history_shift_sav1_0_2_4_out

	thumb_func_start sub_8134348
sub_8134348: @ 81346C4
	push {r4,r5,lr}
	movs r1, 0
	ldr r0, _08134704 @ =0x02028878
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _081346FC
	ldr r0, _08134708 @ =gRoamerLocation
	strb r1, [r0]
	ldr r5, _0813470C @ =gRoamerLocations
	adds r4, r0, 0
_081346D8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r5
	ldrb r1, [r1]
	ldrb r0, [r4, 0x1]
	cmp r0, r1
	beq _081346D8
	strb r1, [r4, 0x1]
_081346FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134704: .4byte 0x02028878
_08134708: .4byte gRoamerLocation
_0813470C: .4byte gRoamerLocations
	thumb_func_end sub_8134348

	thumb_func_start sub_8134394
sub_8134394: @ 8134710
	push {r4-r7,lr}
	movs r4, 0
	bl Random
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	cmp r1, 0
	bne _0813472A
	bl sub_8134348
	b _08134792
_0813472A:
	ldr r0, _08134778 @ =0x02028878
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134792
	ldr r7, _0813477C @ =gRoamerLocation
	ldr r3, _08134780 @ =gRoamerLocations
_08134736:
	lsls r0, r4, 1
	adds r0, r4
	lsls r2, r0, 1
	adds r1, r2, r3
	ldrb r0, [r7, 0x1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08134788
	ldr r6, _08134780 @ =gRoamerLocations
	adds r5, r2, 0x1
	ldr r4, _08134784 @ =gUnknown_020392FC
_0813474C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, r5
	adds r0, r6
	ldrb r1, [r0]
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _08134770
	ldrb r0, [r4, 0x5]
	cmp r0, r1
	beq _0813474C
_08134770:
	cmp r1, 0xFF
	beq _0813474C
	strb r1, [r7, 0x1]
	b _08134792
	.align 2, 0
_08134778: .4byte 0x02028878
_0813477C: .4byte gRoamerLocation
_08134780: .4byte gRoamerLocations
_08134784: .4byte gUnknown_020392FC
_08134788:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08134736
_08134792:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8134394

	thumb_func_start sub_813441C
sub_813441C: @ 8134798
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _081347BC @ =0x02028878
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _081347C4
	ldr r0, _081347C0 @ =gRoamerLocation
	ldrb r3, [r0]
	cmp r2, r3
	bne _081347C4
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bne _081347C4
	movs r0, 0x1
	b _081347C6
	.align 2, 0
_081347BC: .4byte 0x02028878
_081347C0: .4byte gRoamerLocation
_081347C4:
	movs r0, 0
_081347C6:
	pop {r1}
	bx r1
	thumb_func_end sub_813441C

	thumb_func_start sub_8134450
sub_8134450: @ 81347CC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _08134840 @ =gEnemyParty
	ldr r5, _08134844 @ =0x02028878
	ldrh r1, [r5, 0x8]
	ldrb r2, [r5, 0xC]
	ldr r3, [r5]
	ldr r0, [r5, 0x4]
	str r0, [sp]
	adds r0, r4, 0
	bl CreateMonWithIVsPersonality
	adds r2, r5, 0
	adds r2, 0xD
	adds r0, r4, 0
	movs r1, 0x37
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xA
	adds r0, r4, 0
	movs r1, 0x39
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r4, 0
	movs r1, 0x16
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r4, 0
	movs r1, 0x17
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r4, 0
	movs r1, 0x18
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r4, 0
	movs r1, 0x21
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r4, 0
	movs r1, 0x2F
	bl SetMonData
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134840: .4byte gEnemyParty
_08134844: .4byte 0x02028878
	thumb_func_end sub_8134450

	thumb_func_start sub_81344CC
sub_81344CC: @ 8134848
	push {lr}
	ldr r1, _08134874 @ =gSaveBlock1
	ldrb r0, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	bl sub_813441C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08134878
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	bne _08134878
	bl sub_8134450
	movs r0, 0x1
	b _0813487A
	.align 2, 0
_08134874: .4byte gSaveBlock1
_08134878:
	movs r0, 0
_0813487A:
	pop {r1}
	bx r1
	thumb_func_end sub_81344CC

	thumb_func_start sub_8134504
sub_8134504: @ 8134880
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x39
	bl GetMonData
	ldr r4, _081348A4 @ =0x02028878
	strh r0, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x37
	bl GetMonData
	strb r0, [r4, 0xD]
	bl sub_8134348
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081348A4: .4byte 0x02028878
	thumb_func_end sub_8134504

	thumb_func_start sub_813452C
sub_813452C: @ 81348A8
	ldr r1, _081348B0 @ =0x02028878
	movs r0, 0
	strb r0, [r1, 0x13]
	bx lr
	.align 2, 0
_081348B0: .4byte 0x02028878
	thumb_func_end sub_813452C

	thumb_func_start GetRoamerLocation
GetRoamerLocation: @ 81348B4
	ldr r3, _081348C0 @ =gRoamerLocation
	ldrb r2, [r3]
	strb r2, [r0]
	ldrb r0, [r3, 0x1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_081348C0: .4byte gRoamerLocation
	thumb_func_end GetRoamerLocation

	thumb_func_start sub_8134548
sub_8134548: @ 81348C4
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_081348CA:
	ldr r0, _081348E4 @ =gSaveBlock2
	ldr r1, _081348E8 @ =0x00000556
	adds r0, r1
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _0813490C
	lsls r0, 2
	ldr r1, _081348EC @ =_081348F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081348E4: .4byte gSaveBlock2
_081348E8: .4byte 0x00000556
_081348EC: .4byte _081348F0
	.align 2, 0
_081348F0:
	.4byte _0813490C
	.4byte _08134924
	.4byte _08134944
	.4byte _08134954
	.4byte _08134934
	.4byte _0813493C
	.4byte _08134954
_0813490C:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_813461C
	cmp r4, 0
	bne _08134954
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x5
	bl VarSet
	b _08134954
_08134924:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_813461C
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x1
	b _0813494A
_08134934:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x2
	b _0813494A
_0813493C:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x3
	b _0813494A
_08134944:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x4
_0813494A:
	bl VarSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08134954:
	adds r5, 0x1
	cmp r5, 0x1
	ble _081348CA
	ldr r1, _0813498C @ =gSaveBlock2
	ldr r2, _08134990 @ =0x00000556
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0813496A
	cmp r0, 0x6
	bne _08134982
_0813496A:
	ldr r2, _08134994 @ =0x00000557
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08134978
	cmp r0, 0x6
	bne _08134982
_08134978:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0x5
	bl VarSet
_08134982:
	bl sub_8135C44
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813498C: .4byte gSaveBlock2
_08134990: .4byte 0x00000556
_08134994: .4byte 0x00000557
	thumb_func_end sub_8134548

	thumb_func_start sub_813461C
sub_813461C: @ 8134998
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081349C0 @ =gSaveBlock2
	ldr r2, _081349C4 @ =0x00000556
	adds r1, r3, r2
	adds r1, r0, r1
	movs r2, 0
	strb r2, [r1]
	lsls r0, 1
	movs r2, 0xAB
	lsls r2, 3
	adds r1, r3, r2
	adds r1, r0, r1
	movs r2, 0x1
	strh r2, [r1]
	ldr r1, _081349C8 @ =0x0000055c
	adds r3, r1
	adds r0, r3
	strh r2, [r0]
	bx lr
	.align 2, 0
_081349C0: .4byte gSaveBlock2
_081349C4: .4byte 0x00000556
_081349C8: .4byte 0x0000055c
	thumb_func_end sub_813461C

	thumb_func_start sub_8134650
sub_8134650: @ 81349CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	add r4, sp, 0x28
	movs r0, 0
	strb r0, [r4]
	bl sub_813601C
	ldr r0, _08134A00 @ =gScriptResult
	ldrh r0, [r0]
	adds r7, r4, 0
	cmp r0, 0
	bne _081349FC
	ldr r1, _08134A04 @ =gSaveBlock2
	ldr r2, _08134A08 @ =0x0000049a
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, r6
	beq _08134A0C
_081349FC:
	movs r0, 0
	b _08134A5E
	.align 2, 0
_08134A00: .4byte gScriptResult
_08134A04: .4byte gSaveBlock2
_08134A08: .4byte 0x0000049a
_08134A0C:
	movs r6, 0x32
	cmp r5, 0
	beq _08134A14
	movs r6, 0x64
_08134A14:
	movs r4, 0
	mov r8, r1
_08134A18:
	movs r0, 0x2C
	muls r0, r4
	mov r3, r8
	adds r1, r0, r3
	movs r2, 0x9B
	lsls r2, 3
	adds r0, r1, r2
	ldrb r2, [r0]
	cmp r2, r6
	bne _081349FC
	ldr r3, _08134A6C @ =0x000004cc
	adds r0, r1, r3
	ldrh r0, [r0]
	adds r3, 0x2
	adds r1, r3
	ldrh r1, [r1]
	str r2, [sp]
	add r2, sp, 0x10
	str r2, [sp, 0x4]
	add r2, sp, 0x1C
	str r2, [sp, 0x8]
	str r7, [sp, 0xC]
	movs r2, 0x1
	adds r3, r5, 0
	bl CheckMonBattleTowerBanlist
	adds r4, 0x1
	cmp r4, 0x2
	ble _08134A18
	movs r1, 0
	ldrb r0, [r7]
	cmp r0, 0x3
	bne _08134A5C
	movs r1, 0x1
_08134A5C:
	adds r0, r1, 0
_08134A5E:
	add sp, 0x2C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08134A6C: .4byte 0x000004cc
	thumb_func_end sub_8134650

	thumb_func_start sub_81346F4
sub_81346F4: @ 8134A70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	movs r0, 0
	mov r9, r0
	ldr r4, _08134AB4 @ =gSaveBlock2
	ldr r1, _08134AB8 @ =0x00000554
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r7, r0, 31
	adds r0, r7, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r7, 0
	mov r1, r8
	bl sub_8134650
	lsls r0, 24
	adds r1, r4, 0
	cmp r0, 0
	beq _08134AC0
	ldr r2, _08134ABC @ =0x00000564
	adds r1, r2
	movs r0, 0xC8
	strb r0, [r1]
	b _08134B5A
	.align 2, 0
_08134AB4: .4byte gSaveBlock2
_08134AB8: .4byte 0x00000554
_08134ABC: .4byte 0x00000564
_08134AC0:
	movs r5, 0
	movs r3, 0xA4
	mov r12, r3
	mov r10, sp
_08134AC8:
	mov r0, r12
	muls r0, r5
	movs r4, 0
	movs r1, 0
	movs r2, 0
	adds r6, r5, 0x1
	str r6, [sp, 0x14]
	ldr r6, _08134B30 @ =0x02024ff0
	adds r3, r0, r6
_08134ADA:
	ldm r3!, {r0}
	orrs r4, r0
	adds r1, r0
	adds r2, 0x1
	cmp r2, 0x27
	bls _08134ADA
	mov r3, r12
	muls r3, r5
	ldr r0, _08134B34 @ =gSaveBlock2
	adds r2, r3, r0
	movs r6, 0xA7
	lsls r6, 1
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r8
	bne _08134B20
	subs r6, 0x2
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r7
	bne _08134B20
	cmp r4, 0
	beq _08134B20
	ldr r2, _08134B38 @ =0x02025090
	adds r0, r3, r2
	ldr r0, [r0]
	cmp r0, r1
	bne _08134B20
	mov r3, r10
	adds r3, 0x4
	mov r10, r3
	subs r3, 0x4
	stm r3!, {r5}
	movs r6, 0x1
	add r9, r6
_08134B20:
	ldr r5, [sp, 0x14]
	cmp r5, 0x4
	ble _08134AC8
	mov r0, r9
	cmp r0, 0
	bne _08134B3C
	movs r0, 0
	b _08134B5C
	.align 2, 0
_08134B30: .4byte 0x02024ff0
_08134B34: .4byte gSaveBlock2
_08134B38: .4byte 0x02025090
_08134B3C:
	bl Random
	ldr r4, _08134B6C @ =gSaveBlock2
	lsls r0, 16
	lsrs r0, 16
	mov r1, r9
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	adds r0, 0x64
	ldr r1, _08134B70 @ =0x00000564
	adds r4, r1
	strb r0, [r4]
_08134B5A:
	movs r0, 0x1
_08134B5C:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08134B6C: .4byte gSaveBlock2
_08134B70: .4byte 0x00000564
	thumb_func_end sub_81346F4

	thumb_func_start sub_81347F8
sub_81347F8: @ 8134B74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r5, _08134BB4 @ =gSaveBlock2
	ldr r1, _08134BB8 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	bl sub_81346F4
	lsls r0, 24
	cmp r0, 0
	beq _08134BC4
	ldr r2, _08134BBC @ =0x00000564
	adds r4, r5, r2
	ldrb r0, [r4]
	bl sub_81349FC
	lsls r0, r6, 1
	movs r3, 0xAB
	lsls r3, 3
	adds r1, r5, r3
	adds r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	ldr r1, _08134BC0 @ =0x00000569
	adds r0, r1
	ldrb r1, [r4]
	b _08134D58
	.align 2, 0
_08134BB4: .4byte gSaveBlock2
_08134BB8: .4byte 0x00000554
_08134BBC: .4byte 0x00000564
_08134BC0: .4byte 0x00000569
_08134BC4:
	lsls r0, r6, 1
	ldr r2, _08134C54 @ =0x0000055c
	adds r1, r5, r2
	adds r1, r0, r1
	ldrh r1, [r1]
	adds r7, r0, 0
	cmp r1, 0x7
	bls _08134BD6
	b _08134CD8
_08134BD6:
	movs r3, 0xAB
	lsls r3, 3
	adds r0, r5, r3
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, 0x7
	bne _08134C60
	adds r6, r5, 0
	mov r9, r7
	adds r5, r1, 0
	ldr r0, _08134C58 @ =0x0000056a
	adds r0, r6
	mov r10, r0
	mov r8, r5
_08134BF2:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r2, r1, 2
	adds r2, r1
	ldr r1, _08134C54 @ =0x0000055c
	adds r4, r6, r1
	mov r3, r9
	adds r0, r3, r4
	ldrh r1, [r0]
	subs r1, 0x1
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x14
	lsrs r2, 7
	adds r2, r0
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldrh r0, [r5]
	subs r0, 0x1
	cmp r1, r0
	bge _08134C44
	mov r3, r10
	ldrb r0, [r3]
	cmp r0, r2
	beq _08134C44
	subs r0, r4, 0x4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r3, r0, 0x1
	adds r4, 0xE
_08134C36:
	adds r1, 0x1
	cmp r1, r3
	bge _08134C44
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _08134C36
_08134C44:
	mov r3, r8
	ldrh r0, [r3]
	subs r0, 0x1
	ldr r4, _08134C5C @ =gSaveBlock2
	cmp r1, r0
	bne _08134BF2
	b _08134D32
	.align 2, 0
_08134C54: .4byte 0x0000055c
_08134C58: .4byte 0x0000056a
_08134C5C: .4byte gSaveBlock2
_08134C60:
	adds r6, r5, 0
	mov r9, r7
	adds r5, r1, 0
	ldr r2, _08134CCC @ =0x0000056a
	adds r2, r6
	mov r10, r2
	mov r8, r5
_08134C6E:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r0, r1, 2
	adds r0, r1
	lsrs r2, r0, 6
	ldr r3, _08134CD0 @ =0x0000055c
	adds r4, r6, r3
	mov r1, r9
	adds r0, r1, r4
	ldrh r1, [r0]
	subs r1, 0x1
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldrh r0, [r5]
	subs r0, 0x1
	cmp r1, r0
	bge _08134CBE
	mov r3, r10
	ldrb r0, [r3]
	cmp r0, r2
	beq _08134CBE
	subs r0, r4, 0x4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r3, r0, 0x1
	adds r4, 0xE
_08134CB0:
	adds r1, 0x1
	cmp r1, r3
	bge _08134CBE
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _08134CB0
_08134CBE:
	mov r3, r8
	ldrh r0, [r3]
	subs r0, 0x1
	ldr r4, _08134CD4 @ =gSaveBlock2
	cmp r1, r0
	bne _08134C6E
	b _08134D32
	.align 2, 0
_08134CCC: .4byte 0x0000056a
_08134CD0: .4byte 0x0000055c
_08134CD4: .4byte gSaveBlock2
_08134CD8:
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r5, r2
	adds r6, r7, r0
	ldr r3, _08134D68 @ =0x0000056a
	adds r3, r5
	mov r8, r3
	adds r5, r6, 0
_08134CE8:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	asrs r0, 8
	adds r0, 0x46
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldrh r0, [r6]
	subs r0, 0x1
	cmp r1, r0
	bge _08134D28
	mov r3, r8
	ldrb r0, [r3]
	ldr r4, _08134D6C @ =gSaveBlock2
	cmp r0, r2
	beq _08134D28
	ldrh r0, [r5]
	subs r3, r0, 0x1
	ldr r0, _08134D68 @ =0x0000056a
	adds r4, r0
_08134D1A:
	adds r1, 0x1
	cmp r1, r3
	bge _08134D28
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r2
	bne _08134D1A
_08134D28:
	ldrh r0, [r6]
	subs r0, 0x1
	ldr r4, _08134D6C @ =gSaveBlock2
	cmp r1, r0
	bne _08134CE8
_08134D32:
	ldr r1, _08134D70 @ =0x00000564
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _08134D70 @ =0x00000564
	adds r5, r4, r2
	ldrb r0, [r5]
	bl sub_81349FC
	movs r3, 0xAB
	lsls r3, 3
	adds r0, r4, r3
	adds r1, r7, r0
	ldrh r0, [r1]
	cmp r0, 0x6
	bhi _08134D5A
	adds r0, r4, r0
	ldr r1, _08134D74 @ =0x00000569
	adds r0, r1
	ldrb r1, [r5]
_08134D58:
	strb r1, [r0]
_08134D5A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134D68: .4byte 0x0000056a
_08134D6C: .4byte gSaveBlock2
_08134D70: .4byte 0x00000564
_08134D74: .4byte 0x00000569
	thumb_func_end sub_81347F8

	thumb_func_start sub_81349FC
sub_81349FC: @ 8134D78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r2, 0
	cmp r2, 0x63
	bhi _08134D94
	ldr r1, _08134D90 @ =gBattleTowerTrainers
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	b _08134DB4
	.align 2, 0
_08134D90: .4byte gBattleTowerTrainers
_08134D94:
	cmp r1, 0xC7
	bhi _08134DB0
	ldr r2, _08134DA8 @ =gSaveBlock2
	subs r1, 0x64
	movs r0, 0xA4
	muls r0, r1
	adds r0, r2
	ldr r1, _08134DAC @ =0x0000014d
	b _08134DB4
	.align 2, 0
_08134DA8: .4byte gSaveBlock2
_08134DAC: .4byte 0x0000014d
_08134DB0:
	ldr r0, _08134DD8 @ =gSaveBlock2
	ldr r1, _08134DDC @ =0x00000499
_08134DB4:
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0
	ldr r3, _08134DE0 @ =gUnknown_08405E60
	ldrb r0, [r3]
	cmp r0, r1
	beq _08134DD0
_08134DC2:
	adds r2, 0x1
	cmp r2, 0x1D
	bhi _08134DD0
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _08134DC2
_08134DD0:
	cmp r2, 0x1E
	beq _08134DE8
	ldr r0, _08134DE4 @ =gUnknown_08405E92
	b _08134E06
	.align 2, 0
_08134DD8: .4byte gSaveBlock2
_08134DDC: .4byte 0x00000499
_08134DE0: .4byte gUnknown_08405E60
_08134DE4: .4byte gUnknown_08405E92
_08134DE8:
	movs r2, 0
	ldr r3, _08134E14 @ =gUnknown_08405E7E
	ldrb r0, [r3]
	cmp r0, r1
	beq _08134E00
_08134DF2:
	adds r2, 0x1
	cmp r2, 0x13
	bhi _08134E00
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _08134DF2
_08134E00:
	cmp r2, 0x14
	beq _08134E20
	ldr r0, _08134E18 @ =gUnknown_08405EB0
_08134E06:
	adds r0, r2, r0
	ldrb r1, [r0]
	ldr r0, _08134E1C @ =0x00004010
	bl VarSet
	b _08134E28
	.align 2, 0
_08134E14: .4byte gUnknown_08405E7E
_08134E18: .4byte gUnknown_08405EB0
_08134E1C: .4byte 0x00004010
_08134E20:
	ldr r0, _08134E2C @ =0x00004010
	movs r1, 0x7
	bl VarSet
_08134E28:
	pop {r0}
	bx r0
	.align 2, 0
_08134E2C: .4byte 0x00004010
	thumb_func_end sub_81349FC

	thumb_func_start sub_8134AB4
sub_8134AB4: @ 8134E30
	push {lr}
	movs r0, 0xC8
	bl sub_81349FC
	pop {r0}
	bx r0
	thumb_func_end sub_8134AB4

	thumb_func_start sub_8134AC0
sub_8134AC0: @ 8134E3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	movs r7, 0
	mov r8, r0
	movs r5, 0
	ldr r0, _08134EB8 @ =gSaveBlock2
	mov r12, r0
	mov r1, r8
	ldrb r1, [r1, 0xC]
	str r1, [sp, 0x18]
	movs r2, 0xAA
	lsls r2, 1
	add r2, r12
	mov r10, r2
	mov r9, r5
_08134E62:
	movs r6, 0
	movs r3, 0
	ldr r0, _08134EBC @ =0x02024ffc
	add r0, r9
	ldrb r0, [r0]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bne _08134E90
	movs r0, 0xA4
	muls r0, r5
	ldr r1, _08134EBC @ =0x02024ffc
	adds r2, r0, r1
	mov r4, r8
	adds r4, 0xC
_08134E7E:
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08134E90
	adds r1, r4, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08134E7E
_08134E90:
	cmp r3, 0x4
	bne _08134ED0
	movs r6, 0
	mov r2, r10
	ldrb r0, [r2]
	mov r3, r8
	ldrb r3, [r3, 0x8]
	cmp r0, r3
	bne _08134ED0
	adds r1, r0, 0
	movs r0, 0xA4
	muls r0, r5
	adds r0, 0x4
	ldr r3, _08134EC0 @ =0x02024ff4
	adds r2, r0, r3
_08134EAE:
	cmp r1, 0xFF
	bne _08134EC4
	movs r6, 0x7
	b _08134ED0
	.align 2, 0
_08134EB8: .4byte gSaveBlock2
_08134EBC: .4byte 0x02024ffc
_08134EC0: .4byte 0x02024ff4
_08134EC4:
	adds r6, 0x1
	cmp r6, 0x6
	bgt _08134ED0
	ldrb r0, [r2]
	cmp r0, r1
	beq _08134EAE
_08134ED0:
	cmp r6, 0x7
	beq _08134EE0
	movs r0, 0xA4
	add r10, r0
	add r9, r0
	adds r5, 0x1
	cmp r5, 0x4
	ble _08134E62
_08134EE0:
	cmp r5, 0x4
	bgt _08134EF2
	movs r0, 0xA4
	muls r0, r5
	add r0, r12
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	b _08134F1A
_08134EF2:
	movs r5, 0
	movs r1, 0xA7
	lsls r1, 1
	add r1, r12
	b _08134F04
_08134EFC:
	adds r1, 0xA4
	adds r5, 0x1
	cmp r5, 0x4
	bgt _08134F24
_08134F04:
	ldrh r0, [r1]
	cmp r0, 0
	bne _08134EFC
	cmp r5, 0x4
	bgt _08134F24
	movs r0, 0xA4
	muls r0, r5
	add r0, r12
	movs r2, 0xA6
	lsls r2, 1
	adds r0, r2
_08134F1A:
	mov r1, r8
	movs r2, 0xA4
	bl memcpy
	b _08134FDA
_08134F24:
	mov r2, sp
	movs r3, 0xA7
	lsls r3, 1
	mov r1, r12
	adds r0, r1, r3
	ldrh r0, [r0]
	movs r1, 0
	strh r0, [r2]
	add r0, sp, 0xC
	strh r1, [r0]
	adds r7, 0x1
	movs r5, 0x1
	add r2, sp, 0xC
	mov r9, r2
	mov r10, r3
_08134F42:
	movs r3, 0
	adds r0, r5, 0x1
	mov r12, r0
	cmp r3, r7
	bge _08134F86
	movs r1, 0xA4
	adds r0, r5, 0
	muls r0, r1
	ldr r2, _08134F78 @ =gSaveBlock2
	adds r0, r2
	mov r1, r10
	adds r4, r0, r1
	mov r6, sp
_08134F5C:
	lsls r0, r3, 1
	add r0, sp
	ldrh r2, [r4]
	adds r1, r2, 0
	ldrh r0, [r0]
	cmp r1, r0
	bcs _08134F7C
	movs r3, 0
	movs r7, 0x1
	strh r2, [r6]
	mov r2, r9
	strh r5, [r2]
	b _08134F86
	.align 2, 0
_08134F78: .4byte gSaveBlock2
_08134F7C:
	cmp r1, r0
	bhi _08134F86
	adds r3, 0x1
	cmp r3, r7
	blt _08134F5C
_08134F86:
	cmp r3, r7
	bne _08134FA6
	lsls r1, r7, 1
	mov r3, sp
	adds r2, r3, r1
	movs r3, 0xA4
	adds r0, r5, 0
	muls r0, r3
	ldr r3, _08134FEC @ =gSaveBlock2
	adds r0, r3
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r2]
	add r1, r9
	strh r5, [r1]
	adds r7, 0x1
_08134FA6:
	mov r5, r12
	cmp r5, 0x4
	ble _08134F42
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r7, 0
	bl __modsi3
	adds r5, r0, 0
	ldr r2, _08134FEC @ =gSaveBlock2
	lsls r0, r5, 1
	add r0, sp
	adds r0, 0xC
	ldrh r1, [r0]
	movs r0, 0xA4
	muls r0, r1
	adds r0, r2
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	mov r1, r8
	movs r2, 0xA4
	bl memcpy
_08134FDA:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134FEC: .4byte gSaveBlock2
	thumb_func_end sub_8134AC0

	thumb_func_start get_trainer_class_pic_index
get_trainer_class_pic_index: @ 8134FF0
	push {lr}
	ldr r3, _0813500C @ =gSaveBlock2
	ldr r0, _08135010 @ =0x00000564
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _0813501C
	ldr r1, _08135014 @ =gTrainerClassToPicIndex
	ldr r2, _08135018 @ =0x00000499
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	b _0813504E
	.align 2, 0
_0813500C: .4byte gSaveBlock2
_08135010: .4byte 0x00000564
_08135014: .4byte gTrainerClassToPicIndex
_08135018: .4byte 0x00000499
_0813501C:
	cmp r0, 0x63
	bls _0813503C
	ldr r2, _08135038 @ =gTrainerClassToPicIndex
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r3
	adds r1, 0xA9
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
	b _0813504E
	.align 2, 0
_08135038: .4byte gTrainerClassToPicIndex
_0813503C:
	ldr r3, _08135054 @ =gTrainerClassToPicIndex
	ldr r2, _08135058 @ =gBattleTowerTrainers
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r3
_0813504E:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_08135054: .4byte gTrainerClassToPicIndex
_08135058: .4byte gBattleTowerTrainers
	thumb_func_end get_trainer_class_pic_index

	thumb_func_start get_trainer_class_name_index
get_trainer_class_name_index: @ 813505C
	push {lr}
	ldr r3, _08135078 @ =gSaveBlock2
	ldr r0, _0813507C @ =0x00000564
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08135088
	ldr r1, _08135080 @ =gTrainerClassToNameIndex
	ldr r2, _08135084 @ =0x00000499
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1
	b _081350BC
	.align 2, 0
_08135078: .4byte gSaveBlock2
_0813507C: .4byte 0x00000564
_08135080: .4byte gTrainerClassToNameIndex
_08135084: .4byte 0x00000499
_08135088:
	cmp r0, 0x63
	bhi _081350A8
	ldr r3, _081350A0 @ =gTrainerClassToNameIndex
	ldr r2, _081350A4 @ =gBattleTowerTrainers
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r3
	b _081350BC
	.align 2, 0
_081350A0: .4byte gTrainerClassToNameIndex
_081350A4: .4byte gBattleTowerTrainers
_081350A8:
	ldr r2, _081350C4 @ =gTrainerClassToNameIndex
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r3
	adds r1, 0xA9
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
_081350BC:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_081350C4: .4byte gTrainerClassToNameIndex
	thumb_func_end get_trainer_class_name_index

	thumb_func_start get_trainer_name
get_trainer_name: @ 81350C8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, _081350F0 @ =gSaveBlock2
	ldr r0, _081350F4 @ =0x00000564
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _081350FC
	movs r3, 0
	ldr r5, _081350F8 @ =0x0000049c
	adds r2, r5
_081350DE:
	adds r0, r4, r3
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x6
	ble _081350DE
	b _08135144
	.align 2, 0
_081350F0: .4byte gSaveBlock2
_081350F4: .4byte 0x00000564
_081350F8: .4byte 0x0000049c
_081350FC:
	cmp r0, 0x63
	bhi _08135124
	movs r3, 0
	ldr r2, _08135120 @ =gBattleTowerTrainers
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, 0x1
	adds r2, r0, r2
_08135110:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x6
	ble _08135110
	b _08135144
	.align 2, 0
_08135120: .4byte gBattleTowerTrainers
_08135124:
	movs r3, 0
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r1, r0
	movs r5, 0xA8
	lsls r5, 1
	adds r0, r2, r5
	adds r2, r1, r0
_08135136:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x6
	ble _08135136
_08135144:
	adds r1, r4, r3
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end get_trainer_name

	thumb_func_start sub_8134DD4
sub_8134DD4: @ 8135150
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	movs r0, 0
	str r0, [sp, 0x18]
	movs r1, 0x3C
	str r1, [sp, 0x1C]
	add r4, sp, 0xC
	movs r0, 0xFF
	strb r0, [r4]
	bl ZeroEnemyPartyMons
	ldr r1, _08135180 @ =gSaveBlock2
	ldr r2, _08135184 @ =0x00000564
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x13
	bhi _08135188
	movs r3, 0x6
	str r3, [sp, 0x14]
	b _08135254
	.align 2, 0
_08135180: .4byte gSaveBlock2
_08135184: .4byte 0x00000564
_08135188:
	cmp r0, 0x1D
	bhi _08135196
	movs r0, 0x9
	str r0, [sp, 0x14]
	movs r1, 0x1E
	str r1, [sp, 0x18]
	b _08135254
_08135196:
	cmp r0, 0x27
	bhi _081351A4
	movs r2, 0xC
	str r2, [sp, 0x14]
	movs r3, 0x3C
	str r3, [sp, 0x18]
	b _08135254
_081351A4:
	cmp r0, 0x31
	bhi _081351B2
	movs r0, 0xF
	str r0, [sp, 0x14]
	movs r1, 0x5A
	str r1, [sp, 0x18]
	b _08135254
_081351B2:
	cmp r0, 0x3B
	bhi _081351C0
	movs r2, 0x12
	str r2, [sp, 0x14]
	movs r3, 0x78
	str r3, [sp, 0x18]
	b _08135254
_081351C0:
	cmp r0, 0x45
	bhi _081351CE
	movs r0, 0x15
	str r0, [sp, 0x14]
	movs r1, 0x96
	str r1, [sp, 0x18]
	b _08135254
_081351CE:
	cmp r0, 0x4F
	bhi _081351DC
	movs r2, 0x1F
	str r2, [sp, 0x14]
	movs r3, 0xB4
	str r3, [sp, 0x18]
	b _08135254
_081351DC:
	cmp r0, 0x63
	bhi _081351EE
	movs r0, 0x1F
	str r0, [sp, 0x14]
	movs r1, 0xC8
	str r1, [sp, 0x18]
	movs r2, 0x64
	str r2, [sp, 0x1C]
	b _08135254
_081351EE:
	cmp r0, 0xC8
	bne _08135218
	movs r6, 0
_081351F4:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _08135210 @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r6
	ldr r2, _08135214 @ =0x02025370
	adds r1, r2
	bl sub_803ADE8
	adds r6, 0x1
	cmp r6, 0x2
	ble _081351F4
	b _081353FE
	.align 2, 0
_08135210: .4byte gEnemyParty
_08135214: .4byte 0x02025370
_08135218:
	movs r6, 0
	adds r4, r1, 0
	ldr r3, _08135248 @ =0xffffc158
	adds r5, r4, r3
_08135220:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _0813524C @ =gEnemyParty
	adds r0, r1
	ldr r2, _08135250 @ =0x00000564
	adds r1, r4, r2
	ldrb r2, [r1]
	movs r1, 0xA4
	muls r1, r2
	adds r1, r5
	movs r2, 0x2C
	muls r2, r6
	adds r1, r2
	bl sub_803ADE8
	adds r6, 0x1
	cmp r6, 0x2
	ble _08135220
	b _081353FE
	.align 2, 0
_08135248: .4byte 0xffffc158
_0813524C: .4byte gEnemyParty
_08135250: .4byte 0x00000564
_08135254:
	ldr r2, _08135270 @ =gSaveBlock2
	ldr r3, _08135274 @ =0x00000554
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	adds r1, r2, 0
	cmp r0, 0
	beq _0813527C
	ldr r0, _08135278 @ =gBattleTowerLevel100Mons
	mov r10, r0
	movs r2, 0x64
	str r2, [sp, 0x10]
	b _08135284
	.align 2, 0
_08135270: .4byte gSaveBlock2
_08135274: .4byte 0x00000554
_08135278: .4byte gBattleTowerLevel100Mons
_0813527C:
	ldr r3, _081352D0 @ =gBattleTowerLevel50Mons
	mov r10, r3
	movs r0, 0x32
	str r0, [sp, 0x10]
_08135284:
	ldr r2, _081352D4 @ =gBattleTowerTrainers
	ldr r3, _081352D8 @ =0x00000564
	adds r0, r1, r3
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x9]
	str r0, [sp, 0x20]
	movs r6, 0
_0813529A:
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldr r2, [sp, 0x1C]
	adds r0, r1, 0
	muls r0, r2
	asrs r0, 8
	ldr r3, [sp, 0x18]
	adds r7, r0, r3
	ldr r0, [sp, 0x20]
	cmp r0, 0
	beq _081352C4
	lsls r0, r7, 4
	add r0, r10
	ldrb r0, [r0, 0x3]
	ldr r1, [sp, 0x20]
	ands r0, r1
	cmp r0, r1
	beq _081352C4
	b _081353F8
_081352C4:
	movs r5, 0
	lsls r0, r7, 4
	mov r2, r10
	adds r3, r0, r2
	movs r4, 0
	b _081352E0
	.align 2, 0
_081352D0: .4byte gBattleTowerLevel50Mons
_081352D4: .4byte gBattleTowerTrainers
_081352D8: .4byte 0x00000564
_081352DC:
	adds r4, 0x64
	adds r5, 0x1
_081352E0:
	cmp r5, r6
	bge _081352FA
	ldr r1, _08135410 @ =gEnemyParty
	adds r0, r4, r1
	movs r1, 0xB
	movs r2, 0
	str r3, [sp, 0x24]
	bl GetMonData
	ldr r3, [sp, 0x24]
	ldrh r2, [r3]
	cmp r0, r2
	bne _081352DC
_081352FA:
	cmp r5, r6
	bne _081353F8
	movs r5, 0
	cmp r5, r6
	bge _08135348
	ldr r3, _08135414 @ =gBattleTowerHeldItems
	mov r9, r3
	lsls r0, r7, 4
	add r0, r10
	mov r8, r0
	movs r3, 0
_08135310:
	ldr r0, _08135410 @ =gEnemyParty
	adds r4, r3, r0
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0
	str r3, [sp, 0x24]
	bl GetMonData
	ldr r3, [sp, 0x24]
	cmp r0, 0
	beq _08135340
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	mov r2, r8
	ldrb r1, [r2, 0x2]
	lsls r1, 1
	add r1, r9
	ldr r3, [sp, 0x24]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08135348
_08135340:
	adds r3, 0x64
	adds r5, 0x1
	cmp r5, r6
	blt _08135310
_08135348:
	cmp r5, r6
	bne _081353F8
	movs r5, 0
	cmp r5, r6
	bge _0813536A
	add r0, sp, 0x4
	ldrh r0, [r0]
	cmp r0, r7
	beq _0813536A
	add r1, sp, 0x4
_0813535C:
	adds r1, 0x2
	adds r5, 0x1
	cmp r5, r6
	bge _0813536A
	ldrh r0, [r1]
	cmp r0, r7
	bne _0813535C
_0813536A:
	cmp r5, r6
	bne _081353F8
	lsls r0, r6, 1
	add r0, sp
	adds r0, 0x4
	strh r7, [r0]
	movs r3, 0x64
	adds r0, r6, 0
	muls r0, r3
	ldr r1, _08135410 @ =gEnemyParty
	adds r0, r1
	lsls r4, r7, 4
	mov r3, r10
	adds r2, r4, r3
	ldrh r1, [r2]
	ldrb r2, [r2, 0xC]
	str r2, [sp]
	ldr r2, [sp, 0x10]
	ldr r3, [sp, 0x14]
	bl CreateMonWithEVSpread
	movs r5, 0
	adds r0, r6, 0x1
	mov r9, r0
	mov r8, r4
	movs r0, 0x64
	adds r7, r6, 0
	muls r7, r0
	mov r0, r10
	adds r0, 0x4
	adds r4, r0
	ldr r3, _08135410 @ =gEnemyParty
_081353AA:
	ldrh r1, [r4]
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r7, r3
	str r3, [sp, 0x24]
	bl SetMonMoveSlot
	ldrh r0, [r4]
	ldr r3, [sp, 0x24]
	cmp r0, 0xDA
	bne _081353C6
	movs r0, 0
	mov r1, sp
	strb r0, [r1, 0xC]
_081353C6:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _081353AA
	movs r2, 0x64
	adds r4, r6, 0
	muls r4, r2
	ldr r3, _08135410 @ =gEnemyParty
	adds r4, r3
	adds r0, r4, 0
	movs r1, 0x20
	add r2, sp, 0xC
	bl SetMonData
	mov r0, r8
	add r0, r10
	ldrb r2, [r0, 0x2]
	lsls r2, 1
	ldr r0, _08135414 @ =gBattleTowerHeldItems
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	mov r6, r9
_081353F8:
	cmp r6, 0x3
	beq _081353FE
	b _0813529A
_081353FE:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135410: .4byte gEnemyParty
_08135414: .4byte gBattleTowerHeldItems
	thumb_func_end sub_8134DD4

	thumb_func_start CalcBattleTowerBanlistSeenCount
CalcBattleTowerBanlistSeenCount: @ 8135418
	push {r4-r6,lr}
	movs r5, 0
	ldr r2, _08135454 @ =gBattleTowerBanlist
	ldrh r0, [r2]
	ldr r1, _08135458 @ =0x0000ffff
	cmp r0, r1
	beq _0813544A
	adds r6, r1, 0
	adds r4, r2, 0
_0813542A:
	ldrh r0, [r4]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08135442
	adds r5, 0x1
_08135442:
	adds r4, 0x2
	ldrh r0, [r4]
	cmp r0, r6
	bne _0813542A
_0813544A:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08135454: .4byte gBattleTowerBanlist
_08135458: .4byte 0x0000ffff
	thumb_func_end CalcBattleTowerBanlistSeenCount

	thumb_func_start AppendBattleTowerBannedSpeciesName
AppendBattleTowerBannedSpeciesName: @ 813545C
	push {r4-r6,lr}
	adds r5, r2, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r6, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08135562
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	subs r0, r4, 0x1
	cmp r0, 0xA
	bhi _0813552C
	lsls r0, 2
	ldr r1, _08135494 @ =_08135498
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135494: .4byte _08135498
	.align 2, 0
_08135498:
	.4byte _081354C4
	.4byte _081354F4
	.4byte _081354C4
	.4byte _0813552C
	.4byte _081354C4
	.4byte _0813552C
	.4byte _081354C4
	.4byte _0813552C
	.4byte _081354C4
	.4byte _0813552C
	.4byte _081354C4
_081354C4:
	cmp r5, r4
	bne _081354DC
	ldr r0, _081354D4 @ =gStringVar1
	ldr r1, _081354D8 @ =gUnknown_08400E23
	bl StringAppend
	b _08135554
	.align 2, 0
_081354D4: .4byte gStringVar1
_081354D8: .4byte gUnknown_08400E23
_081354DC:
	cmp r5, r4
	ble _08135554
	ldr r0, _081354EC @ =gStringVar1
	ldr r1, _081354F0 @ =gUnknown_08400E29
	bl StringAppend
	b _08135554
	.align 2, 0
_081354EC: .4byte gStringVar1
_081354F0: .4byte gUnknown_08400E29
_081354F4:
	cmp r4, r5
	bne _0813550C
	ldr r0, _08135504 @ =gStringVar1
	ldr r1, _08135508 @ =gUnknown_08400E23
	bl StringAppend
	b _08135514
	.align 2, 0
_08135504: .4byte gStringVar1
_08135508: .4byte gUnknown_08400E23
_0813550C:
	ldr r0, _08135520 @ =gStringVar1
	ldr r1, _08135524 @ =gUnknown_08400E29
	bl StringAppend
_08135514:
	ldr r0, _08135520 @ =gStringVar1
	ldr r1, _08135528 @ =gUnknown_08400E30
	bl StringAppend
	b _08135554
	.align 2, 0
_08135520: .4byte gStringVar1
_08135524: .4byte gUnknown_08400E29
_08135528: .4byte gUnknown_08400E30
_0813552C:
	cmp r4, r5
	bne _08135544
	ldr r0, _0813553C @ =gStringVar1
	ldr r1, _08135540 @ =gUnknown_08400E23
	bl StringAppend
	b _0813554C
	.align 2, 0
_0813553C: .4byte gStringVar1
_08135540: .4byte gUnknown_08400E23
_08135544:
	ldr r0, _0813556C @ =gStringVar1
	ldr r1, _08135570 @ =gUnknown_08400E29
	bl StringAppend
_0813554C:
	ldr r0, _0813556C @ =gStringVar1
	ldr r1, _08135574 @ =gUnknown_08400E2E
	bl StringAppend
_08135554:
	ldr r0, _0813556C @ =gStringVar1
	movs r1, 0xB
	muls r1, r6
	ldr r2, _08135578 @ =gSpeciesNames
	adds r1, r2
	bl StringAppend
_08135562:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0813556C: .4byte gStringVar1
_08135570: .4byte gUnknown_08400E29
_08135574: .4byte gUnknown_08400E2E
_08135578: .4byte gSpeciesNames
	thumb_func_end AppendBattleTowerBannedSpeciesName

	thumb_func_start CheckMonBattleTowerBanlist
CheckMonBattleTowerBanlist: @ 813557C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	mov r10, r4
	ldr r7, [sp, 0x2C]
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r2, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _0813564A
	cmp r4, 0
	beq _0813564A
	ldr r0, _08135658 @ =gBattleTowerBanlist
	ldrh r1, [r0]
	ldr r5, _0813565C @ =0x0000ffff
	adds r3, r0, 0
	cmp r1, r5
	beq _081355E0
	cmp r1, r4
	beq _081355D4
	adds r1, r3, 0
_081355C6:
	adds r1, 0x2
	adds r2, 0x1
	ldrh r0, [r1]
	cmp r0, r5
	beq _081355E0
	cmp r0, r4
	bne _081355C6
_081355D4:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	ldr r0, _0813565C @ =0x0000ffff
	cmp r1, r0
	bne _0813564A
_081355E0:
	mov r0, r12
	cmp r0, 0
	bne _081355EC
	mov r1, r8
	cmp r1, 0x32
	bhi _0813564A
_081355EC:
	movs r2, 0
	ldrb r3, [r7]
	cmp r2, r3
	bge _0813560C
	mov r1, r9
	ldrh r0, [r1]
	cmp r0, r4
	beq _0813560C
	adds r5, r3, 0
_081355FE:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _0813560C
	ldrh r0, [r1]
	cmp r0, r4
	bne _081355FE
_0813560C:
	cmp r2, r3
	bne _0813564A
	cmp r6, 0
	beq _08135636
	movs r2, 0
	cmp r2, r3
	bge _08135632
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, r6
	beq _08135632
	adds r5, r3, 0
_08135624:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, r5
	bge _08135632
	ldrh r0, [r1]
	cmp r0, r6
	bne _08135624
_08135632:
	cmp r2, r3
	bne _0813564A
_08135636:
	lsls r0, r3, 1
	add r0, r9
	strh r4, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	add r0, r10
	strh r6, [r0]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_0813564A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08135658: .4byte gBattleTowerBanlist
_0813565C: .4byte 0x0000ffff
	thumb_func_end CheckMonBattleTowerBanlist

	thumb_func_start CheckPartyBattleTowerBanlist
CheckPartyBattleTowerBanlist: @ 8135660
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	add r1, sp, 0x28
	movs r0, 0
	strb r0, [r1]
	movs r7, 0
	mov r9, r1
	add r0, sp, 0x1C
	mov r10, r0
_0813567A:
	movs r0, 0x64
	adds r5, r7, 0
	muls r5, r0
	ldr r0, _08135740 @ =gPlayerParty
	adds r5, r0
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	adds r0, r5, 0
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r5, _08135744 @ =gScriptResult
	ldrb r3, [r5]
	str r4, [sp]
	add r0, sp, 0x10
	str r0, [sp, 0x4]
	mov r1, r10
	str r1, [sp, 0x8]
	mov r0, r9
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	bl CheckMonBattleTowerBanlist
	adds r7, 0x1
	cmp r7, 0x5
	ble _0813567A
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _0813579C
	ldr r1, _08135748 @ =gStringVar1
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _0813574C @ =gSpecialVar_0x8004
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
	bl CalcBattleTowerBanlistSeenCount
	adds r6, r0, 0
	ldr r2, _08135750 @ =gBattleTowerBanlist
	ldrh r0, [r2]
	ldr r1, _08135754 @ =0x0000ffff
	cmp r0, r1
	beq _08135724
	mov r5, r9
	adds r7, r1, 0
	adds r4, r2, 0
_08135710:
	ldrh r0, [r4]
	ldrb r1, [r5]
	adds r2, r6, 0
	bl AppendBattleTowerBannedSpeciesName
	strb r0, [r5]
	adds r4, 0x2
	ldrh r0, [r4]
	cmp r0, r7
	bne _08135710
_08135724:
	mov r0, r9
	ldrb r1, [r0]
	cmp r1, 0
	bne _08135760
	ldr r4, _08135748 @ =gStringVar1
	ldr r1, _08135758 @ =gUnknown_08400E2C
	adds r0, r4, 0
	bl StringAppend
	ldr r1, _0813575C @ =gUnknown_08400E32
	adds r0, r4, 0
	bl StringAppend
	b _081357BA
	.align 2, 0
_08135740: .4byte gPlayerParty
_08135744: .4byte gScriptResult
_08135748: .4byte gStringVar1
_0813574C: .4byte gSpecialVar_0x8004
_08135750: .4byte gBattleTowerBanlist
_08135754: .4byte 0x0000ffff
_08135758: .4byte gUnknown_08400E2C
_0813575C: .4byte gUnknown_08400E32
_08135760:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813577C
	ldr r0, _08135774 @ =gStringVar1
	ldr r1, _08135778 @ =gUnknown_08400E2E
	bl StringAppend
	b _08135784
	.align 2, 0
_08135774: .4byte gStringVar1
_08135778: .4byte gUnknown_08400E2E
_0813577C:
	ldr r0, _08135790 @ =gStringVar1
	ldr r1, _08135794 @ =gUnknown_08400E2C
	bl StringAppend
_08135784:
	ldr r0, _08135790 @ =gStringVar1
	ldr r1, _08135798 @ =gUnknown_08400E36
	bl StringAppend
	b _081357BA
	.align 2, 0
_08135790: .4byte gStringVar1
_08135794: .4byte gUnknown_08400E2C
_08135798: .4byte gUnknown_08400E36
_0813579C:
	ldr r1, _081357CC @ =gSpecialVar_0x8004
	movs r0, 0
	strh r0, [r1]
	ldr r2, _081357D0 @ =gSaveBlock2
	ldrb r0, [r5]
	ldr r1, _081357D4 @ =0x00000554
	adds r2, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r3, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_081357BA:
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081357CC: .4byte gSpecialVar_0x8004
_081357D0: .4byte gSaveBlock2
_081357D4: .4byte 0x00000554
	thumb_func_end CheckPartyBattleTowerBanlist

	thumb_func_start sub_813545C
sub_813545C: @ 81357D8
	push {lr}
	adds r1, r0, 0
	ldr r0, _081357EC @ =gStringVar4
	movs r2, 0x2
	movs r3, 0x3
	bl de_sub_80EB8F8
	pop {r0}
	bx r0
	.align 2, 0
_081357EC: .4byte gStringVar4
	thumb_func_end sub_813545C

	thumb_func_start sub_8135474
sub_8135474: @ 81357F0
	push {lr}
	ldr r2, _0813580C @ =gSaveBlock2
	ldr r0, _08135810 @ =0x00000564
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _08135814
	movs r1, 0x95
	lsls r1, 3
	adds r0, r2, r1
	bl sub_813545C
	b _08135840
	.align 2, 0
_0813580C: .4byte gSaveBlock2
_08135810: .4byte 0x00000564
_08135814:
	cmp r0, 0x63
	bhi _08135830
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _0813582C @ =0x0840f5ac
	adds r0, r1
	bl sub_813545C
	b _08135840
	.align 2, 0
_0813582C: .4byte 0x0840f5ac
_08135830:
	ldrb r1, [r1]
	movs r0, 0xA4
	muls r0, r1
	ldr r3, _08135844 @ =0xffffc14c
	adds r1, r2, r3
	adds r0, r1
	bl sub_813545C
_08135840:
	pop {r0}
	bx r0
	.align 2, 0
_08135844: .4byte 0xffffc14c
	thumb_func_end sub_8135474

	thumb_func_start sub_81354CC
sub_81354CC: @ 8135848
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08135860 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08135864
	cmp r0, 0x1
	ble _0813589C
	cmp r0, 0x2
	beq _08135898
	b _0813589C
	.align 2, 0
_08135860: .4byte gSpecialVar_0x8004
_08135864:
	movs r5, 0
_08135866:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08135890 @ =0x0202596c
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08135894 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _08135866
	b _0813589C
	.align 2, 0
_08135890: .4byte 0x0202596c
_08135894: .4byte gPlayerParty
_08135898:
	bl sub_81360D0
_0813589C:
	ldr r0, _081358AC @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081358AC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_81354CC

	thumb_func_start sub_8135534
sub_8135534: @ 81358B0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081358D4
	ldr r0, _081358DC @ =gMain
	ldr r1, _081358E0 @ =sub_81354CC
	str r1, [r0, 0x8]
	ldr r0, _081358E4 @ =sub_800E7C4
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_081358D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081358DC: .4byte gMain
_081358E0: .4byte sub_81354CC
_081358E4: .4byte sub_800E7C4
	thumb_func_end sub_8135534

	thumb_func_start sub_813556C
sub_813556C: @ 81358E8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08135900 @ =gSpecialVar_0x8004
	ldrh r2, [r0]
	cmp r2, 0x1
	beq _08135928
	cmp r2, 0x1
	bgt _08135904
	cmp r2, 0
	beq _0813590A
	b _081359C4
	.align 2, 0
_08135900: .4byte gSpecialVar_0x8004
_08135904:
	cmp r2, 0x2
	beq _0813597C
	b _081359C4
_0813590A:
	ldr r1, _08135920 @ =gUnknown_020239F8
	movs r3, 0x84
	lsls r3, 1
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08135924 @ =gTrainerBattleOpponent
	strh r2, [r0]
	bl sub_8134DD4
	b _08135952
	.align 2, 0
_08135920: .4byte gUnknown_020239F8
_08135924: .4byte gTrainerBattleOpponent
_08135928:
	movs r5, 0
_0813592A:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08135970 @ =gPlayerParty
	adds r0, r4, r0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	ldr r0, _08135974 @ =0x0202596c
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
	cmp r5, 0x5
	ble _0813592A
_08135952:
	ldr r0, _08135978 @ =sub_8135534
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl GetBattleTowerBattleTransition
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AABC
	b _081359C4
	.align 2, 0
_08135970: .4byte gPlayerParty
_08135974: .4byte 0x0202596c
_08135978: .4byte sub_8135534
_0813597C:
	bl ZeroEnemyPartyMons
	movs r5, 0
_08135982:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081359CC @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r5
	ldr r2, _081359D0 @ =0x02025370
	adds r1, r2
	bl sub_803ADE8
	adds r5, 0x1
	cmp r5, 0x2
	ble _08135982
	ldr r1, _081359D4 @ =gUnknown_020239F8
	ldr r2, _081359D8 @ =0x00000808
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081359DC @ =gTrainerBattleOpponent
	movs r0, 0
	strh r0, [r1]
	ldr r0, _081359E0 @ =sub_8135534
	movs r1, 0x1
	bl CreateTask
	movs r0, 0
	bl current_map_music_set__default_for_battle
	bl GetBattleTowerBattleTransition
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AABC
_081359C4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081359CC: .4byte gEnemyParty
_081359D0: .4byte 0x02025370
_081359D4: .4byte gUnknown_020239F8
_081359D8: .4byte 0x00000808
_081359DC: .4byte gTrainerBattleOpponent
_081359E0: .4byte sub_8135534
	thumb_func_end sub_813556C

	thumb_func_start sub_8135668
sub_8135668: @ 81359E4
	push {r4,r5,lr}
	ldr r1, _08135A08 @ =gSaveBlock2
	ldr r2, _08135A0C @ =0x00000554
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _08135A10 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xE
	bls _081359FE
	b _08135C16
_081359FE:
	lsls r0, 2
	ldr r1, _08135A14 @ =_08135A18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135A08: .4byte gSaveBlock2
_08135A0C: .4byte 0x00000554
_08135A10: .4byte gSpecialVar_0x8004
_08135A14: .4byte _08135A18
	.align 2, 0
_08135A18:
	.4byte _08135A54
	.4byte _08135A7C
	.4byte _08135A98
	.4byte _08135AA2
	.4byte _08135ABC
	.4byte _08135AD0
	.4byte _08135AF0
	.4byte _08135B4C
	.4byte _08135B78
	.4byte _08135C16
	.4byte _08135B9C
	.4byte _08135BB0
	.4byte _08135BC8
	.4byte _08135BE8
	.4byte _08135C04
_08135A54:
	ldr r0, _08135A6C @ =0x02000000
	ldr r3, _08135A70 @ =0x00000556
	adds r1, r5, r3
	adds r1, r4, r1
	ldrb r2, [r1]
	ldr r3, _08135A74 @ =0x000160fb
	adds r0, r3
	strb r2, [r0]
	ldr r0, _08135A78 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	b _08135C14
	.align 2, 0
_08135A6C: .4byte 0x02000000
_08135A70: .4byte 0x00000556
_08135A74: .4byte 0x000160fb
_08135A78: .4byte gSpecialVar_0x8005
_08135A7C:
	ldr r0, _08135A90 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _08135A94 @ =0x00000554
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	b _08135B8C
	.align 2, 0
_08135A90: .4byte gSpecialVar_0x8005
_08135A94: .4byte 0x00000554
_08135A98:
	lsls r1, r4, 1
	movs r2, 0xAB
	lsls r2, 3
	adds r0, r5, r2
	b _08135AA8
_08135AA2:
	lsls r1, r4, 1
	ldr r3, _08135AB4 @ =0x0000055c
	adds r0, r5, r3
_08135AA8:
	adds r1, r0
	ldr r0, _08135AB8 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	strh r0, [r1]
	b _08135C16
	.align 2, 0
_08135AB4: .4byte 0x0000055c
_08135AB8: .4byte gSpecialVar_0x8005
_08135ABC:
	ldr r0, _08135AC8 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	ldr r2, _08135ACC @ =0x00000564
	adds r0, r5, r2
	strb r1, [r0]
	b _08135C16
	.align 2, 0
_08135AC8: .4byte gSpecialVar_0x8005
_08135ACC: .4byte 0x00000564
_08135AD0:
	movs r2, 0
	ldr r4, _08135AE8 @ =0x02025409
	ldr r3, _08135AEC @ =gUnknown_02039270
_08135AD6:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08135AD6
	b _08135C16
	.align 2, 0
_08135AE8: .4byte 0x02025409
_08135AEC: .4byte gUnknown_02039270
_08135AF0:
	ldr r3, _08135B3C @ =0x00000564
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, 0xC8
	bne _08135B04
	movs r1, 0x93
	lsls r1, 3
	adds r0, r5, r1
	bl sub_81360AC
_08135B04:
	movs r3, 0xAE
	lsls r3, 3
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08135B40 @ =0x0000270e
	cmp r1, r0
	bhi _08135B16
	adds r0, r1, 0x1
	strh r0, [r2]
_08135B16:
	lsls r4, 1
	movs r1, 0xAB
	lsls r1, 3
	adds r0, r5, r1
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	bl sub_8135A3C
	ldr r1, _08135B44 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	ldr r1, _08135B48 @ =gStringVar1
	adds r0, 0xA1
	strb r0, [r1]
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	b _08135C16
	.align 2, 0
_08135B3C: .4byte 0x00000564
_08135B40: .4byte 0x0000270e
_08135B44: .4byte gScriptResult
_08135B48: .4byte gStringVar1
_08135B4C:
	lsls r0, r4, 1
	ldr r2, _08135B6C @ =0x0000055c
	adds r1, r5, r2
	adds r4, r0, r1
	ldrh r1, [r4]
	ldr r0, _08135B70 @ =0x00000595
	cmp r1, r0
	bhi _08135B60
	adds r0, r1, 0x1
	strh r0, [r4]
_08135B60:
	bl sub_8135A3C
	ldr r1, _08135B74 @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	b _08135C16
	.align 2, 0
_08135B6C: .4byte 0x0000055c
_08135B70: .4byte 0x00000595
_08135B74: .4byte gScriptResult
_08135B78:
	ldr r0, _08135B94 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _08135B98 @ =0x00000554
	adds r3, r5, r1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
_08135B8C:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08135C16
	.align 2, 0
_08135B94: .4byte gSpecialVar_0x8005
_08135B98: .4byte 0x00000554
_08135B9C:
	ldr r2, _08135BAC @ =0x00000572
	adds r0, r5, r2
	ldrh r1, [r0]
	movs r0, 0x20
	bl sav12_xor_set
	b _08135C16
	.align 2, 0
_08135BAC: .4byte 0x00000572
_08135BB0:
	ldr r3, _08135BC4 @ =0x00000556
	adds r0, r5, r3
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _08135C16
	adds r0, r4, 0
	bl sub_813461C
	b _08135C16
	.align 2, 0
_08135BC4: .4byte 0x00000556
_08135BC8:
	ldr r1, _08135BDC @ =0x00000556
	adds r0, r5, r1
	adds r0, r4, r0
	ldr r1, _08135BE0 @ =0x02000000
	ldr r2, _08135BE4 @ =0x000160fb
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _08135C16
	.align 2, 0
_08135BDC: .4byte 0x00000556
_08135BE0: .4byte 0x02000000
_08135BE4: .4byte 0x000160fb
_08135BE8:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _08135BFC @ =gSaveBlock2
	lsls r2, r4, 1
	ldr r3, _08135C00 @ =0x00000574
	adds r1, r3
	adds r2, r1
	strh r0, [r2]
	b _08135C16
	.align 2, 0
_08135BFC: .4byte gSaveBlock2
_08135C00: .4byte 0x00000574
_08135C04:
	ldr r1, _08135C1C @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r2, 0xAF
	lsls r2, 3
	adds r1, r5, r2
_08135C14:
	strb r0, [r1]
_08135C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135C1C: .4byte 0x00000554
	thumb_func_end sub_8135668

	thumb_func_start sub_81358A4
sub_81358A4: @ 8135C20
	push {r4,lr}
	ldr r1, _08135C44 @ =gSaveBlock2
	ldr r2, _08135C48 @ =0x00000554
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r4, r0, 31
	ldr r0, _08135C4C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xE
	bls _08135C3A
	b _08135D86
_08135C3A:
	lsls r0, 2
	ldr r1, _08135C50 @ =_08135C54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08135C44: .4byte gSaveBlock2
_08135C48: .4byte 0x00000554
_08135C4C: .4byte gSpecialVar_0x8004
_08135C50: .4byte _08135C54
	.align 2, 0
_08135C54:
	.4byte _08135C90
	.4byte _08135CA4
	.4byte _08135CB8
	.4byte _08135CC8
	.4byte _08135CE0
	.4byte _08135D86
	.4byte _08135D86
	.4byte _08135D86
	.4byte _08135CF4
	.4byte _08135D0C
	.4byte _08135D1C
	.4byte _08135D30
	.4byte _08135D38
	.4byte _08135D58
	.4byte _08135D74
_08135C90:
	ldr r0, _08135C9C @ =gScriptResult
	ldr r2, _08135CA0 @ =0x00000556
	adds r1, r3, r2
	adds r1, r4, r1
	b _08135CE6
	.align 2, 0
_08135C9C: .4byte gScriptResult
_08135CA0: .4byte 0x00000556
_08135CA4:
	ldr r1, _08135CB0 @ =gScriptResult
	ldr r4, _08135CB4 @ =0x00000554
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 31
	b _08135CFE
	.align 2, 0
_08135CB0: .4byte gScriptResult
_08135CB4: .4byte 0x00000554
_08135CB8:
	ldr r2, _08135CC4 @ =gScriptResult
	lsls r0, r4, 1
	movs r4, 0xAB
	lsls r4, 3
	b _08135CCE
	.align 2, 0
_08135CC4: .4byte gScriptResult
_08135CC8:
	ldr r2, _08135CD8 @ =gScriptResult
	lsls r0, r4, 1
	ldr r4, _08135CDC @ =0x0000055c
_08135CCE:
	adds r1, r3, r4
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08135D86
	.align 2, 0
_08135CD8: .4byte gScriptResult
_08135CDC: .4byte 0x0000055c
_08135CE0:
	ldr r0, _08135CEC @ =gScriptResult
	ldr r2, _08135CF0 @ =0x00000564
	adds r1, r3, r2
_08135CE6:
	ldrb r1, [r1]
	strh r1, [r0]
	b _08135D86
	.align 2, 0
_08135CEC: .4byte gScriptResult
_08135CF0: .4byte 0x00000564
_08135CF4:
	ldr r1, _08135D04 @ =gScriptResult
	ldr r4, _08135D08 @ =0x00000554
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, 30
_08135CFE:
	lsrs r0, 31
	strh r0, [r1]
	b _08135D86
	.align 2, 0
_08135D04: .4byte gScriptResult
_08135D08: .4byte 0x00000554
_08135D0C:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _08135D18 @ =gScriptResult
	strh r0, [r1]
	b _08135D86
	.align 2, 0
_08135D18: .4byte gScriptResult
_08135D1C:
	ldr r1, _08135D2C @ =0x00000572
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, 0x20
	bl sav12_xor_set
	b _08135D86
	.align 2, 0
_08135D2C: .4byte 0x00000572
_08135D30:
	adds r0, r4, 0
	bl sub_813461C
	b _08135D86
_08135D38:
	ldr r2, _08135D4C @ =0x00000556
	adds r0, r3, r2
	adds r0, r4, r0
	ldr r1, _08135D50 @ =0x02000000
	ldr r3, _08135D54 @ =0x000160fb
	adds r1, r3
	ldrb r1, [r1]
	strb r1, [r0]
	b _08135D86
	.align 2, 0
_08135D4C: .4byte 0x00000556
_08135D50: .4byte 0x02000000
_08135D54: .4byte 0x000160fb
_08135D58:
	adds r0, r4, 0
	bl sub_8135D3C
	ldr r1, _08135D6C @ =gSaveBlock2
	lsls r2, r4, 1
	ldr r4, _08135D70 @ =0x00000574
	adds r1, r4
	adds r2, r1
	strh r0, [r2]
	b _08135D86
	.align 2, 0
_08135D6C: .4byte gSaveBlock2
_08135D70: .4byte 0x00000574
_08135D74:
	ldr r1, _08135D8C @ =0x00000554
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	movs r2, 0xAF
	lsls r2, 3
	adds r1, r3, r2
	strb r0, [r1]
_08135D86:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135D8C: .4byte 0x00000554
	thumb_func_end sub_81358A4

	thumb_func_start sub_8135A14
sub_8135A14: @ 8135D90
	push {r4,lr}
	movs r2, 0
	ldr r4, _08135DB0 @ =gUnknown_02039270
	ldr r3, _08135DB4 @ =0x02025409
_08135D98:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08135D98
	bl ReducePlayerPartyToThree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08135DB0: .4byte gUnknown_02039270
_08135DB4: .4byte 0x02025409
	thumb_func_end sub_8135A14

	thumb_func_start sub_8135A3C
sub_8135A3C: @ 8135DB8
	push {r4-r6,lr}
	ldr r6, _08135E00 @ =gSaveBlock2
	ldr r1, _08135E04 @ =0x00000554
	adds r0, r6, r1
	ldrb r4, [r0]
	lsls r4, 31
	lsrs r4, 31
	adds r0, r4, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	movs r3, 0xAC
	lsls r3, 3
	adds r2, r6, r3
	adds r4, r2
	ldrh r0, [r4]
	cmp r0, r5
	bcs _08135DE2
	strh r5, [r4]
_08135DE2:
	ldr r0, _08135E08 @ =0x00000562
	adds r1, r6, r0
	ldrh r0, [r2]
	ldrh r3, [r1]
	cmp r0, r3
	bls _08135E10
	adds r5, r0, 0
	movs r0, 0x20
	adds r1, r5, 0
	bl sav12_xor_set
	ldr r1, _08135E0C @ =0x0000270f
	cmp r5, r1
	bhi _08135E20
	b _08135E30
	.align 2, 0
_08135E00: .4byte gSaveBlock2
_08135E04: .4byte 0x00000554
_08135E08: .4byte 0x00000562
_08135E0C: .4byte 0x0000270f
_08135E10:
	ldrh r5, [r1]
	movs r0, 0x20
	adds r1, r5, 0
	bl sav12_xor_set
	ldr r1, _08135E28 @ =0x0000270f
	cmp r5, r1
	bls _08135E30
_08135E20:
	ldr r2, _08135E2C @ =0x00000572
	adds r0, r6, r2
	strh r1, [r0]
	b _08135E36
	.align 2, 0
_08135E28: .4byte 0x0000270f
_08135E2C: .4byte 0x00000572
_08135E30:
	ldr r3, _08135E3C @ =0x00000572
	adds r0, r6, r3
	strh r5, [r0]
_08135E36:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135E3C: .4byte 0x00000572
	thumb_func_end sub_8135A3C

	thumb_func_start sub_8135AC4
sub_8135AC4: @ 8135E40
	push {r4-r6,lr}
	ldr r5, _08135E6C @ =0x02024f4c
	adds r2, r5, 0
	subs r2, 0xA8
	ldr r1, _08135E70 @ =0x000004ac
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r6, r0, 31
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08135E78
	ldr r4, _08135E74 @ =gUnknown_08405E7E
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x14
	b _08135E8A
	.align 2, 0
_08135E6C: .4byte 0x02024f4c
_08135E70: .4byte 0x000004ac
_08135E74: .4byte gUnknown_08405E7E
_08135E78:
	ldr r4, _08135F00 @ =gUnknown_08405E60
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x1E
_08135E8A:
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r6, [r5]
	strb r0, [r5, 0x1]
	adds r0, r5, 0
	adds r0, 0xC
	ldr r4, _08135F04 @ =0x02024eae
	adds r1, r4, 0
	bl sub_8052D10
	adds r0, r5, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	adds r0, r6, 0
	bl sub_8135D3C
	strh r0, [r5, 0x2]
	ldr r0, _08135F08 @ =gSaveBlock1
	ldr r1, _08135F0C @ =0x00002b28
	adds r2, r0, r1
	adds r1, r5, 0
	adds r1, 0x10
	movs r4, 0x5
_08135EC0:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08135EC0
	movs r4, 0
	ldr r6, _08135F10 @ =0x02025409
_08135ED2:
	adds r0, r4, r6
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08135F14 @ =gUnknown_030042FC
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x1C
	adds r1, r5, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _08135ED2
	ldr r0, _08135F18 @ =0x02024f4c
	bl sub_8135CC4
	bl sub_8135A3C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08135F00: .4byte gUnknown_08405E60
_08135F04: .4byte 0x02024eae
_08135F08: .4byte gSaveBlock1
_08135F0C: .4byte 0x00002b28
_08135F10: .4byte 0x02025409
_08135F14: .4byte gUnknown_030042FC
_08135F18: .4byte 0x02024f4c
	thumb_func_end sub_8135AC4

	thumb_func_start sub_8135BA0
sub_8135BA0: @ 8135F1C
	push {r4,r5,lr}
	ldr r2, _08135F98 @ =gSaveBlock2
	ldr r1, _08135F9C @ =0x00000554
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r5, r0, 31
	ldr r0, _08135FA0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x3
	beq _08135F36
	cmp r0, 0
	bne _08135F54
_08135F36:
	lsls r1, r5, 1
	ldr r3, _08135FA4 @ =0x0000055c
	adds r0, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _08135F50
	subs r3, 0x4
	adds r0, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, 0x1
	bls _08135F54
_08135F50:
	bl sub_8135AC4
_08135F54:
	bl sub_8135CFC
	ldr r4, _08135F98 @ =gSaveBlock2
	ldr r0, _08135FA8 @ =gUnknown_02024D26
	ldrb r1, [r0]
	ldr r2, _08135FAC @ =0x00000555
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _08135FA0 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	cmp r1, 0x3
	beq _08135F74
	ldr r3, _08135FB0 @ =0x00000556
	adds r0, r4, r3
	adds r0, r5, r0
	strb r1, [r0]
_08135F74:
	movs r0, 0x80
	lsls r0, 7
	movs r1, 0
	bl VarSet
	ldr r0, _08135F9C @ =0x00000554
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	bl sub_8125D44
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08135F98: .4byte gSaveBlock2
_08135F9C: .4byte 0x00000554
_08135FA0: .4byte gSpecialVar_0x8004
_08135FA4: .4byte 0x0000055c
_08135FA8: .4byte gUnknown_02024D26
_08135FAC: .4byte 0x00000555
_08135FB0: .4byte 0x00000556
	thumb_func_end sub_8135BA0

	thumb_func_start sub_8135C38
sub_8135C38: @ 8135FB4
	push {lr}
	bl DoSoftReset
	pop {r0}
	bx r0
	thumb_func_end sub_8135C38

	thumb_func_start sub_8135C44
sub_8135C44: @ 8135FC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r3, 0
	movs r1, 0
	ldr r2, _08136038 @ =0x02024f4c
_08135FCC:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08135FCC
	ldr r5, _0813603C @ =gSaveBlock2
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _08135FEC
	adds r0, r5, 0
	adds r0, 0xA8
	bl sub_8135CE8
_08135FEC:
	movs r4, 0
	movs r7, 0xA4
	movs r0, 0xA6
	lsls r0, 1
	adds r6, r5, r0
	mov r8, r5
_08135FF8:
	adds r0, r4, 0
	muls r0, r7
	movs r3, 0
	movs r1, 0
	adds r5, r4, 0x1
	adds r2, r0, r6
_08136004:
	ldm r2!, {r0}
	adds r3, r0
	adds r1, 0x1
	cmp r1, 0x27
	bls _08136004
	adds r1, r4, 0
	muls r1, r7
	movs r0, 0xF6
	lsls r0, 1
	add r0, r8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, r3
	beq _08136026
	adds r0, r1, r6
	bl sub_8135CE8
_08136026:
	adds r4, r5, 0
	cmp r4, 0x4
	ble _08135FF8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136038: .4byte 0x02024f4c
_0813603C: .4byte gSaveBlock2
	thumb_func_end sub_8135C44

	thumb_func_start sub_8135CC4
sub_8135CC4: @ 8136040
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xA0
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_0813604E:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x27
	bls _0813604E
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8135CC4

	thumb_func_start sub_8135CE8
sub_8135CE8: @ 8136064
	push {lr}
	movs r1, 0
	movs r2, 0
_0813606A:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x28
	bls _0813606A
	pop {r0}
	bx r0
	thumb_func_end sub_8135CE8

	thumb_func_start sub_8135CFC
sub_8135CFC: @ 8136078
	push {r4,lr}
	ldr r4, _081360B0 @ =0x02025328
	adds r0, r4, 0
	bl get_trainer_name
	ldr r2, _081360B4 @ =gBattleMons
	adds r0, r2, 0
	adds r0, 0x58
	ldrh r1, [r0]
	subs r0, r4, 0x2
	strh r1, [r0]
	ldrh r1, [r2]
	subs r0, r4, 0x4
	strh r1, [r0]
	movs r3, 0
	adds r4, 0x8
	adds r2, 0x30
_0813609A:
	adds r0, r3, r4
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x9
	ble _0813609A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081360B0: .4byte 0x02025328
_081360B4: .4byte gBattleMons
	thumb_func_end sub_8135CFC

	thumb_func_start sub_8135D3C
sub_8135D3C: @ 81360B8
	push {lr}
	lsls r0, 24
	ldr r3, _081360F0 @ =gSaveBlock2
	lsrs r0, 23
	ldr r2, _081360F4 @ =0x0000055c
	adds r1, r3, r2
	adds r1, r0, r1
	ldrh r2, [r1]
	subs r2, 0x1
	lsls r1, r2, 3
	subs r1, r2
	movs r2, 0xAB
	lsls r2, 3
	adds r3, r2
	adds r0, r3
	ldr r2, _081360F8 @ =0x0000ffff
	adds r1, r2
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	lsrs r0, r1, 16
	ldr r1, _081360FC @ =0x0000270f
	cmp r0, r1
	bls _081360EA
	adds r0, r1, 0
_081360EA:
	pop {r1}
	bx r1
	.align 2, 0
_081360F0: .4byte gSaveBlock2
_081360F4: .4byte 0x0000055c
_081360F8: .4byte 0x0000ffff
_081360FC: .4byte 0x0000270f
	thumb_func_end sub_8135D3C

	thumb_func_start sub_8135D84
sub_8135D84: @ 8136100
	push {r4,r5,lr}
	ldr r5, _0813612C @ =gSaveBlock2
	ldr r1, _08136130 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	lsls r0, 1
	ldr r2, _08136134 @ =0x0000055c
	adds r1, r5, r2
	adds r0, r1
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x5
	ble _0813613C
	bl Random
	ldr r4, _08136138 @ =gUnknown_08405EE6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x9
	b _08136148
	.align 2, 0
_0813612C: .4byte gSaveBlock2
_08136130: .4byte 0x00000554
_08136134: .4byte 0x0000055c
_08136138: .4byte gUnknown_08405EE6
_0813613C:
	bl Random
	ldr r4, _08136164 @ =gUnknown_08405EDA
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
_08136148:
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 15
	adds r0, r4
	ldrh r1, [r0]
	movs r2, 0xAD
	lsls r2, 3
	adds r0, r5, r2
	strh r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136164: .4byte gUnknown_08405EDA
	thumb_func_end sub_8135D84

	thumb_func_start sub_8135DEC
sub_8135DEC: @ 8136168
	push {r4-r7,lr}
	ldr r5, _0813619C @ =gSaveBlock2
	ldr r1, _081361A0 @ =0x00000554
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r7, r0, 31
	movs r0, 0xAD
	lsls r0, 3
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _081361AC
	ldrh r0, [r6]
	ldr r1, _081361A4 @ =gStringVar1
	bl CopyItemName
	ldr r0, _081361A8 @ =gScriptResult
	strh r4, [r0]
	b _081361BC
	.align 2, 0
_0813619C: .4byte gSaveBlock2
_081361A0: .4byte 0x00000554
_081361A4: .4byte gStringVar1
_081361A8: .4byte gScriptResult
_081361AC:
	ldr r1, _081361C4 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r1, _081361C8 @ =0x00000556
	adds r0, r5, r1
	adds r0, r7, r0
	movs r1, 0x6
	strb r1, [r0]
_081361BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081361C4: .4byte gScriptResult
_081361C8: .4byte 0x00000556
	thumb_func_end sub_8135DEC

	thumb_func_start sub_8135E50
sub_8135E50: @ 81361CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _08136250 @ =gSaveBlock2
	ldr r1, _08136254 @ =0x00000554
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r0, 0
	movs r7, 0x44
	cmp r1, 0
	beq _081361E8
	movs r7, 0x45
_081361E8:
	ldr r4, _08136258 @ =gScriptResult
	movs r0, 0
	strh r0, [r4]
	adds r0, r1, 0
	bl sub_8135D3C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x37
	bls _08136236
	movs r5, 0
	ldr r0, _0813625C @ =0x00000565
	adds r0, r6
	mov r8, r0
	adds r6, r4, 0
_08136206:
	mov r1, r8
	adds r0, r5, r1
	ldrb r0, [r0]
	subs r0, 0x1
	movs r1, 0x64
	muls r1, r0
	ldr r0, _08136260 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl GetMonData
	cmp r0, 0
	bne _08136230
	movs r0, 0x1
	strh r0, [r6]
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SetMonData
_08136230:
	adds r5, 0x1
	cmp r5, 0x2
	ble _08136206
_08136236:
	ldr r0, _08136258 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	beq _08136244
	movs r0, 0x2A
	bl sav12_xor_increment
_08136244:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136250: .4byte gSaveBlock2
_08136254: .4byte 0x00000554
_08136258: .4byte gScriptResult
_0813625C: .4byte 0x00000565
_08136260: .4byte gPlayerParty
	thumb_func_end sub_8135E50

	thumb_func_start unref_sub_8135EE8
unref_sub_8135EE8: @ 8136264
	push {r4-r7,lr}
	ldr r7, _08136288 @ =0x0202533c
	ldr r0, _0813628C @ =0xfffffb68
	adds r2, r7, r0
	ldrb r0, [r2, 0x8]
	cmp r0, 0
	beq _08136294
	ldr r4, _08136290 @ =gUnknown_08405E7E
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x14
	b _081362A6
	.align 2, 0
_08136288: .4byte 0x0202533c
_0813628C: .4byte 0xfffffb68
_08136290: .4byte gUnknown_08405E7E
_08136294:
	ldr r4, _08136324 @ =gUnknown_08405E60
	ldrb r0, [r2, 0xA]
	ldrb r1, [r2, 0xB]
	adds r0, r1
	ldrb r1, [r2, 0xC]
	adds r0, r1
	ldrb r1, [r2, 0xD]
	adds r0, r1
	movs r1, 0x1E
_081362A6:
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	strb r0, [r7, 0x1]
	adds r0, r7, 0
	adds r0, 0xC
	ldr r4, _08136328 @ =0x02024eae
	adds r1, r4, 0
	bl sub_8052D10
	adds r0, r7, 0x4
	subs r4, 0xA
	adds r1, r4, 0
	bl StringCopy8
	movs r0, 0x1
	strh r0, [r7, 0x2]
	movs r5, 0x7
	movs r4, 0
	ldr r0, _0813632C @ =gSaveBlock1
	ldr r1, _08136330 @ =0x00002b28
	adds r6, r0, r1
	adds r3, r7, 0
	adds r3, 0x10
	adds r2, r7, 0
	adds r2, 0x28
	adds r1, r7, 0
	adds r1, 0x1C
_081362E0:
	ldrh r0, [r6]
	strh r0, [r3]
	strh r5, [r1]
	adds r0, r5, 0x6
	strh r0, [r2]
	adds r5, 0x1
	adds r6, 0x2
	adds r3, 0x2
	adds r2, 0x2
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x5
	ble _081362E0
	movs r4, 0
_081362FC:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08136334 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	muls r1, r4
	adds r1, 0x34
	adds r1, r7, r1
	bl sub_803AF78
	adds r4, 0x1
	cmp r4, 0x2
	ble _081362FC
	adds r0, r7, 0
	bl sub_8136088
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08136324: .4byte gUnknown_08405E60
_08136328: .4byte 0x02024eae
_0813632C: .4byte gSaveBlock1
_08136330: .4byte 0x00002b28
_08136334: .4byte gPlayerParty
	thumb_func_end unref_sub_8135EE8

	thumb_func_start sub_8135FBC
sub_8135FBC: @ 8136338
	ldr r1, _08136348 @ =gTrainerClassToPicIndex
	ldr r0, _0813634C @ =gSaveBlock2
	ldr r2, _08136350 @ =0x00000499
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08136348: .4byte gTrainerClassToPicIndex
_0813634C: .4byte gSaveBlock2
_08136350: .4byte 0x00000499
	thumb_func_end sub_8135FBC

	thumb_func_start sub_8135FD8
sub_8135FD8: @ 8136354
	ldr r1, _08136364 @ =gTrainerClassToNameIndex
	ldr r0, _08136368 @ =gSaveBlock2
	ldr r2, _0813636C @ =0x00000499
	adds r0, r2
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08136364: .4byte gTrainerClassToNameIndex
_08136368: .4byte gSaveBlock2
_0813636C: .4byte 0x00000499
	thumb_func_end sub_8135FD8

	thumb_func_start sub_8135FF4
sub_8135FF4: @ 8136370
	push {r4,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r4, _08136394 @ =0x02025340
_08136378:
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x6
	ble _08136378
	adds r1, r3, r2
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136394: .4byte 0x02025340
	thumb_func_end sub_8135FF4

	thumb_func_start sub_813601C
sub_813601C: @ 8136398
	push {r4,r5,lr}
	ldr r1, _081363C0 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r5, _081363C4 @ =0x0202533c
	movs r3, 0
	movs r2, 0
	adds r4, r1, 0
	adds r1, r5, 0
_081363AA:
	ldm r1!, {r0}
	orrs r3, r0
	adds r2, 0x1
	cmp r2, 0x2D
	bls _081363AA
	cmp r3, 0
	bne _081363C8
	movs r0, 0x1
	strh r0, [r4]
	b _081363F4
	.align 2, 0
_081363C0: .4byte gScriptResult
_081363C4: .4byte 0x0202533c
_081363C8:
	movs r3, 0
	movs r2, 0
	ldr r4, _081363FC @ =gSaveBlock2
	adds r1, r5, 0
_081363D0:
	ldm r1!, {r0}
	adds r3, r0
	adds r2, 0x1
	cmp r2, 0x2D
	bls _081363D0
	movs r1, 0xAA
	lsls r1, 3
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, r3
	beq _081363F4
	subs r1, 0xB8
	adds r0, r4, r1
	bl sub_81360AC
	ldr r1, _08136400 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_081363F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081363FC: .4byte gSaveBlock2
_08136400: .4byte gScriptResult
	thumb_func_end sub_813601C

	thumb_func_start sub_8136088
sub_8136088: @ 8136404
	push {r4,lr}
	adds r2, r0, 0
	adds r2, 0xB8
	movs r1, 0
	str r1, [r2]
	movs r3, 0
	adds r4, r0, 0
_08136412:
	ldr r0, [r2]
	ldm r4!, {r1}
	adds r0, r1
	str r0, [r2]
	adds r3, 0x1
	cmp r3, 0x2D
	bls _08136412
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136088

	thumb_func_start sub_81360AC
sub_81360AC: @ 8136428
	push {lr}
	movs r1, 0
	movs r2, 0
_0813642E:
	stm r0!, {r2}
	adds r1, 0x1
	cmp r1, 0x2E
	bls _0813642E
	pop {r0}
	bx r0
	thumb_func_end sub_81360AC

	thumb_func_start sub_81360C0
sub_81360C0: @ 813643C
	push {lr}
	ldr r0, _08136448 @ =0x0202534c
	bl sub_813545C
	pop {r0}
	bx r0
	.align 2, 0
_08136448: .4byte 0x0202534c
	thumb_func_end sub_81360C0

	thumb_func_start sub_81360D0
sub_81360D0: @ 813644C
	push {lr}
	ldr r0, _08136460 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08136468
	ldr r1, _08136464 @ =gStringVar4
	movs r0, 0xFF
	strb r0, [r1]
	b _0813647E
	.align 2, 0
_08136460: .4byte gUnknown_02024D26
_08136464: .4byte gStringVar4
_08136468:
	cmp r0, 0x1
	bne _08136478
	ldr r0, _08136474 @ =0x02025364
	bl sub_813545C
	b _0813647E
	.align 2, 0
_08136474: .4byte 0x02025364
_08136478:
	ldr r0, _08136484 @ =0x02025358
	bl sub_813545C
_0813647E:
	pop {r0}
	bx r0
	.align 2, 0
_08136484: .4byte 0x02025358
	thumb_func_end sub_81360D0

	thumb_func_start sub_813610C
sub_813610C: @ 8136488
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _081364A8 @ =0x020253fa
_0813648E:
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813649A
	bl sub_80BFD20
_0813649A:
	adds r4, 0x1
	cmp r4, 0x1
	ble _0813648E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081364A8: .4byte 0x020253fa
	thumb_func_end sub_813610C

	thumb_func_start de_sub_81364AC
de_sub_81364AC: @ 81364AC
	push {lr}
	ldr r2, _081364C0 @ =gSaveBlock2
	ldr r0, _081364C4 @ =0x00000564
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xC8
	bne _081364CC
	ldr r1, _081364C8 @ =0x00000499
	adds r0, r2, r1
	b _081364F2
	.align 2, 0
_081364C0: .4byte gSaveBlock2
_081364C4: .4byte 0x00000564
_081364C8: .4byte 0x00000499
_081364CC:
	cmp r0, 0x63
	bhi _081364E4
	ldr r2, _081364E0 @ =gBattleTowerTrainers
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	b _081364F2
	.align 2, 0
_081364E0: .4byte gBattleTowerTrainers
_081364E4:
	ldrb r0, [r1]
	subs r0, 0x64
	movs r1, 0xA4
	muls r0, r1
	adds r0, r2
	adds r1, 0xA9
	adds r0, r1
_081364F2:
	ldrb r0, [r0]
	pop {r1}
	bx r1
	thumb_func_end de_sub_81364AC

	thumb_func_start de_sub_81364F8
de_sub_81364F8: @ 81364F8
	ldr r0, _08136504 @ =gSaveBlock2
	ldr r1, _08136508 @ =0x00000499
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08136504: .4byte gSaveBlock2
_08136508: .4byte 0x00000499
	thumb_func_end de_sub_81364F8

	thumb_func_start sub_8136130
sub_8136130: @ 813650C
	push {r4,r5,lr}
	ldr r4, _08136538 @ =gUnknown_02039304
	ldr r2, _0813653C @ =gUnknown_083DFEC4
	ldr r3, [r2]
	ldr r5, _08136540 @ =0x0000d164
	adds r2, r3, r5
	str r2, [r4]
	str r0, [r2, 0x8]
	str r1, [r2, 0x4]
	ldr r0, _08136544 @ =0x0000d162
	adds r3, r0
	movs r0, 0x2
	strb r0, [r3]
	ldr r0, _08136548 @ =sub_8136294
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _0813654C @ =sub_8136244
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136538: .4byte gUnknown_02039304
_0813653C: .4byte gUnknown_083DFEC4
_08136540: .4byte 0x0000d164
_08136544: .4byte 0x0000d162
_08136548: .4byte sub_8136294
_0813654C: .4byte sub_8136244
	thumb_func_end sub_8136130

	thumb_func_start sub_8136174
sub_8136174: @ 8136550
	push {r4,r5,lr}
	ldr r5, _081365A0 @ =gUnknown_02039304
	ldr r1, [r5]
	ldr r0, _081365A4 @ =gUnknown_0203930C
	ldr r0, [r0]
	str r0, [r1, 0x8]
	ldr r0, _081365A8 @ =gUnknown_02039308
	ldr r0, [r0]
	str r0, [r1, 0x4]
	ldr r4, _081365AC @ =gUnknown_02039310
	ldrb r0, [r4]
	bl sub_81370E4
	strb r0, [r4]
	ldr r5, [r5]
	movs r1, 0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _0813657A
	movs r1, 0x1
_0813657A:
	adds r0, r5, 0
	adds r0, 0x56
	strb r1, [r0]
	ldr r0, _081365B0 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _081365B4 @ =0x0000d162
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _081365B8 @ =sub_8136294
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _081365BC @ =sub_81361E4
	bl SetMainCallback2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081365A0: .4byte gUnknown_02039304
_081365A4: .4byte gUnknown_0203930C
_081365A8: .4byte gUnknown_02039308
_081365AC: .4byte gUnknown_02039310
_081365B0: .4byte gUnknown_083DFEC4
_081365B4: .4byte 0x0000d162
_081365B8: .4byte sub_8136294
_081365BC: .4byte sub_81361E4
	thumb_func_end sub_8136174

	thumb_func_start sub_81361E4
sub_81361E4: @ 81365C0
	push {r4,lr}
	ldr r4, _081365FC @ =gUnknown_02039304
	ldr r0, [r4]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r4, [r4]
	ldr r1, [r4]
	ldr r0, _08136600 @ =sub_81365C8
	cmp r1, r0
	bne _081365F6
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, r4, 0
	adds r0, 0x50
	strb r1, [r0]
	ldr r0, _08136604 @ =sub_813622C
	bl SetMainCallback2
_081365F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081365FC: .4byte gUnknown_02039304
_08136600: .4byte sub_81365C8
_08136604: .4byte sub_813622C
	thumb_func_end sub_81361E4

	thumb_func_start sub_813622C
sub_813622C: @ 8136608
	push {lr}
	bl sub_81368A4
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_813622C

	thumb_func_start sub_8136244
sub_8136244: @ 8136620
	push {lr}
	ldr r0, _0813663C @ =gUnknown_02039304
	ldr r0, [r0]
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_0813663C: .4byte gUnknown_02039304
	thumb_func_end sub_8136244

	thumb_func_start sub_8136264
sub_8136264: @ 8136640
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	movs r0, 0x6
	bl sub_80F5CDC
	bl sub_8089668
	pop {r0}
	bx r0
	thumb_func_end sub_8136264

	thumb_func_start launch_c3_walk_stairs_and_run_once
launch_c3_walk_stairs_and_run_once: @ 813665C
	ldr r1, _0813666C @ =gUnknown_02039304
	ldr r1, [r1]
	str r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0813666C: .4byte gUnknown_02039304
	thumb_func_end launch_c3_walk_stairs_and_run_once

	thumb_func_start sub_8136294
sub_8136294: @ 8136670
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _08136690 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x16
	bls _08136684
	b _08136956
_08136684:
	lsls r0, 2
	ldr r1, _08136694 @ =_08136698
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08136690: .4byte gUnknown_02039304
_08136694: .4byte _08136698
	.align 2, 0
_08136698:
	.4byte _081366F4
	.4byte _08136730
	.4byte _0813673A
	.4byte _08136742
	.4byte _08136750
	.4byte _0813675C
	.4byte _08136768
	.4byte _08136794
	.4byte _081367A4
	.4byte _081367B8
	.4byte _081367CA
	.4byte _081367E0
	.4byte _08136824
	.4byte _08136840
	.4byte _08136864
	.4byte _08136870
	.4byte _08136876
	.4byte _081368B4
	.4byte _081368D8
	.4byte _081368E4
	.4byte _081368FC
	.4byte _08136914
	.4byte _08136948
_081366F4:
	bl is_c1_link_related_active
	ldr r1, _08136720 @ =gUnknown_083DFEC4
	ldr r1, [r1]
	ldr r2, _08136724 @ =0x00006dac
	adds r1, r2
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0813670C
	b _08136956
_0813670C:
	ldr r4, _08136728 @ =gUnknown_02039304
	ldr r0, [r4]
	adds r0, 0x55
	strb r1, [r0]
	ldr r0, _0813672C @ =sub_81365A0
	bl launch_c3_walk_stairs_and_run_once
	ldr r1, [r4]
	b _08136904
	.align 2, 0
_08136720: .4byte gUnknown_083DFEC4
_08136724: .4byte 0x00006dac
_08136728: .4byte gUnknown_02039304
_0813672C: .4byte sub_81365A0
_08136730:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08136900
_0813673A:
	movs r0, 0
	bl SetVBlankCallback
	b _08136900
_08136742:
	ldr r0, _0813674C @ =gWindowConfig_81E7080
	bl SetUpWindowConfig
	b _08136900
	.align 2, 0
_0813674C: .4byte gWindowConfig_81E7080
_08136750:
	ldr r0, _08136758 @ =gWindowConfig_81E7080
	bl MultistepInitMenuWindowBegin
	b _08136900
	.align 2, 0
_08136758: .4byte gWindowConfig_81E7080
_0813675C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _08136766
	b _08136956
_08136766:
	b _08136900
_08136768:
	ldr r0, _08136788 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r4, _0813678C @ =0x000076aa
	adds r0, r1, r4
	movs r2, 0
	strb r2, [r0]
	ldr r4, _08136790 @ =0x000087e0
	adds r0, r1, r4
	str r2, [r0]
	movs r0, 0xC3
	lsls r0, 2
	adds r1, r0
	movs r0, 0x20
	strh r0, [r1]
	ldr r1, [r3]
	b _08136904
	.align 2, 0
_08136788: .4byte gUnknown_083DFEC4
_0813678C: .4byte 0x000076aa
_08136790: .4byte 0x000087e0
_08136794:
	bl sub_80F2688
	ldr r0, _081367B4 @ =gUnknown_02039304
	ldr r1, [r0]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081367A4:
	bl sub_80F26BC
	lsls r0, 24
	cmp r0, 0
	beq _081367B0
	b _08136956
_081367B0:
	b _08136900
	.align 2, 0
_081367B4: .4byte gUnknown_02039304
_081367B8:
	movs r0, 0x1
	bl sub_80F2C80
	ldr r0, _081367DC @ =gUnknown_02039304
	ldr r1, [r0]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081367CA:
	movs r0, 0x1
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	beq _081367D8
	b _08136956
_081367D8:
	b _08136900
	.align 2, 0
_081367DC: .4byte gUnknown_02039304
_081367E0:
	ldr r1, _08136810 @ =gKeyRepeatStartDelay
	movs r0, 0x14
	strh r0, [r1]
	bl CalculatePlayerPartyCount
	ldr r1, _08136814 @ =gUnknown_083DFEC4
	ldr r4, [r1]
	ldr r2, _08136818 @ =0x00008828
	adds r1, r4, r2
	movs r5, 0
	strb r0, [r1]
	ldr r1, _0813681C @ =0x00009344
	adds r0, r4, r1
	strb r5, [r0]
	subs r2, 0xC0
	adds r0, r4, r2
	str r5, [r0]
	bl sub_80F4BD0
	ldr r0, _08136820 @ =0x0000d160
	adds r4, r0
	strh r5, [r4]
	b _08136900
	.align 2, 0
_08136810: .4byte gKeyRepeatStartDelay
_08136814: .4byte gUnknown_083DFEC4
_08136818: .4byte 0x00008828
_0813681C: .4byte 0x00009344
_08136820: .4byte 0x0000d160
_08136824:
	bl sub_80F1778
	lsls r0, 24
	cmp r0, 0
	beq _08136830
	b _08136956
_08136830:
	ldr r0, _0813683C @ =0x0400001a
	movs r1, 0x6
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	b _08136900
	.align 2, 0
_0813683C: .4byte 0x0400001a
_08136840:
	movs r0, 0
	bl sub_80F2E18
	ldr r0, _08136858 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _0813685C @ =0x00008768
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08136860 @ =0x0000ffd8
	strh r0, [r1, 0x26]
	b _08136900
	.align 2, 0
_08136858: .4byte gUnknown_083DFEC4
_0813685C: .4byte 0x00008768
_08136860: .4byte 0x0000ffd8
_08136864:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _08136956
	b _08136900
_08136870:
	bl sub_80F33A8
	b _08136900
_08136876:
	ldr r1, _081368A0 @ =0x0600f800
	movs r2, 0
	str r2, [sp]
	ldr r0, _081368A4 @ =0x040000d4
	mov r4, sp
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _081368A8 @ =0x85000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _081368AC @ =0x04000016
	strh r2, [r0]
	subs r0, 0x2
	strh r2, [r0]
	ldr r1, _081368B0 @ =0x0400000a
	movs r2, 0xF8
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [r3]
	b _08136904
	.align 2, 0
_081368A0: .4byte 0x0600f800
_081368A4: .4byte 0x040000d4
_081368A8: .4byte 0x85000200
_081368AC: .4byte 0x04000016
_081368B0: .4byte 0x0400000a
_081368B4:
	ldr r0, _081368CC @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r4, _081368D0 @ =0x00008ff0
	adds r0, r1, r4
	ldr r2, _081368D4 @ =0x00009004
	adds r1, r2
	bl sub_80F567C
	bl sub_80F5B38
	b _08136900
	.align 2, 0
_081368CC: .4byte gUnknown_083DFEC4
_081368D0: .4byte 0x00008ff0
_081368D4: .4byte 0x00009004
_081368D8:
	bl sub_80F5B50
	lsls r0, 24
	cmp r0, 0
	bne _08136956
	b _08136900
_081368E4:
	ldr r0, _081368F4 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r4, _081368F8 @ =0x00009004
	adds r0, r4
	bl sub_80F556C
	b _08136900
	.align 2, 0
_081368F4: .4byte gUnknown_083DFEC4
_081368F8: .4byte 0x00009004
_081368FC:
	bl sub_80F1934
_08136900:
	ldr r0, _08136910 @ =gUnknown_02039304
	ldr r1, [r0]
_08136904:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136956
	.align 2, 0
_08136910: .4byte gUnknown_02039304
_08136914:
	ldr r1, _08136960 @ =0x04000040
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x9B
	strh r0, [r1]
	ldr r0, _08136964 @ =0x04000044
	ldr r2, _08136968 @ =0x00003273
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _0813696C @ =0x04000048
	ldr r4, _08136970 @ =0x00003f3f
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1B
	strh r0, [r1]
	subs r1, 0x38
	movs r0, 0x28
	strh r0, [r1]
	subs r1, 0x12
	ldr r2, _08136974 @ =0x00007f40
	adds r0, r2, 0
	strh r0, [r1]
_08136948:
	ldr r0, [r3]
	adds r0, 0x55
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08136978 @ =sub_81365C8
	bl launch_c3_walk_stairs_and_run_once
_08136956:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136960: .4byte 0x04000040
_08136964: .4byte 0x04000044
_08136968: .4byte 0x00003273
_0813696C: .4byte 0x04000048
_08136970: .4byte 0x00003f3f
_08136974: .4byte 0x00007f40
_08136978: .4byte sub_81365C8
	thumb_func_end sub_8136294

	thumb_func_start sub_81365A0
sub_81365A0: @ 813697C
	push {r4,lr}
	ldr r1, _081369A0 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x55
	ldrb r0, [r0]
	cmp r0, 0
	bne _0813699A
	adds r4, r1, 0
_0813698C:
	bl sub_8136294
	ldr r0, [r4]
	adds r0, 0x55
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813698C
_0813699A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081369A0: .4byte gUnknown_02039304
	thumb_func_end sub_81365A0

	thumb_func_start sub_81365C8
sub_81365C8: @ 81369A4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _081369BC @ =gUnknown_02039304
	ldr r0, [r4]
	adds r0, 0x50
	ldrb r1, [r0]
	cmp r1, 0
	beq _081369C0
	cmp r1, 0x1
	beq _081369E8
	b _08136A02
	.align 2, 0
_081369BC: .4byte gUnknown_02039304
_081369C0:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081369E4 @ =sub_8136264
	bl SetVBlankCallback
	ldr r1, [r4]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136A02
	.align 2, 0
_081369E4: .4byte sub_8136264
_081369E8:
	ldr r0, _08136A0C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136A02
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _08136A10 @ =sub_8136638
	bl launch_c3_walk_stairs_and_run_once
_08136A02:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136A0C: .4byte gPaletteFade
_08136A10: .4byte sub_8136638
	thumb_func_end sub_81365C8

	thumb_func_start sub_8136638
sub_8136638: @ 8136A14
	push {r4,lr}
	ldr r0, _08136A30 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08136A24
	b _08136BD6
_08136A24:
	lsls r0, 2
	ldr r1, _08136A34 @ =_08136A38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08136A30: .4byte gUnknown_02039304
_08136A34: .4byte _08136A38
	.align 2, 0
_08136A38:
	.4byte _08136A58
	.4byte _08136B24
	.4byte _08136B30
	.4byte _08136B50
	.4byte _08136BD6
	.4byte _08136B5C
	.4byte _08136B74
	.4byte _08136BBC
_08136A58:
	ldr r2, _08136A80 @ =gMain
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08136A88
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_80F5060
	bl move_anim_execute
	ldr r0, _08136A84 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x1
	b _08136BD4
	.align 2, 0
_08136A80: .4byte gMain
_08136A84: .4byte gUnknown_02039304
_08136A88:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08136AB0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80F5060
	bl move_anim_execute
	ldr r0, _08136AAC @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x1
	b _08136BD4
	.align 2, 0
_08136AAC: .4byte gUnknown_02039304
_08136AB0:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08136AD0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08136ACC @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x3
	b _08136BD4
	.align 2, 0
_08136ACC: .4byte gUnknown_02039304
_08136AD0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08136ADA
	b _08136BD6
_08136ADA:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08136B04 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r2, _08136B08 @ =0x000087dc
	adds r1, r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _08136B0C @ =0x000087da
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	cmp r1, r0
	bne _08136B14
	ldr r0, _08136B10 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x3
	b _08136BD4
	.align 2, 0
_08136B04: .4byte gUnknown_083DFEC4
_08136B08: .4byte 0x000087dc
_08136B0C: .4byte 0x000087da
_08136B10: .4byte gUnknown_02039304
_08136B14:
	ldr r0, _08136B20 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x5
	b _08136BD4
	.align 2, 0
_08136B20: .4byte gUnknown_02039304
_08136B24:
	bl gpu_sync_bg_show
	lsls r0, 24
	cmp r0, 0
	bne _08136BD6
	b _08136B60
_08136B30:
	bl sub_8055870
	adds r4, r0, 0
	cmp r4, 0
	bne _08136BD6
	bl sub_80F1934
	bl sub_80F3D00
	ldr r0, _08136B4C @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	strb r4, [r0]
	b _08136BD6
	.align 2, 0
_08136B4C: .4byte gUnknown_02039304
_08136B50:
	ldr r0, _08136B58 @ =sub_8136B44
	bl launch_c3_walk_stairs_and_run_once
	b _08136BD6
	.align 2, 0
_08136B58: .4byte sub_8136B44
_08136B5C:
	bl sub_8136BB8
_08136B60:
	ldr r0, _08136B70 @ =gUnknown_02039304
	ldr r1, [r0]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136BD6
	.align 2, 0
_08136B70: .4byte gUnknown_02039304
_08136B74:
	bl sub_8136C40
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08136B94
	cmp r1, 0
	bgt _08136B8E
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08136BCC
	b _08136BD6
_08136B8E:
	cmp r1, 0x1
	bne _08136BD6
	b _08136BCC
_08136B94:
	bl sub_8137058
	lsls r0, 24
	cmp r0, 0
	beq _08136BB0
	bl sub_8136D60
	ldr r0, _08136BAC @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0x7
	b _08136BD4
	.align 2, 0
_08136BAC: .4byte gUnknown_02039304
_08136BB0:
	ldr r0, _08136BB8 @ =sub_8136808
	bl launch_c3_walk_stairs_and_run_once
	b _08136BD6
	.align 2, 0
_08136BB8: .4byte sub_8136808
_08136BBC:
	ldr r0, _08136BDC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136BD6
	bl sub_8136D8C
_08136BCC:
	ldr r0, _08136BE0 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	movs r1, 0
_08136BD4:
	strb r1, [r0]
_08136BD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136BDC: .4byte gMain
_08136BE0: .4byte gUnknown_02039304
	thumb_func_end sub_8136638

	thumb_func_start sub_8136808
sub_8136808: @ 8136BE4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08136BFC @ =gUnknown_02039304
	ldr r0, [r5]
	adds r0, 0x50
	ldrb r4, [r0]
	cmp r4, 0
	beq _08136C00
	cmp r4, 0x1
	beq _08136C50
	b _08136C68
	.align 2, 0
_08136BFC: .4byte gUnknown_02039304
_08136C00:
	ldr r0, _08136C3C @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136C40 @ =0x000087dc
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	ldr r1, _08136C44 @ =gUnknown_02039310
	strb r0, [r1]
	ldr r1, _08136C48 @ =gUnknown_02039308
	ldr r2, [r5]
	ldr r0, [r2, 0x4]
	str r0, [r1]
	ldr r1, _08136C4C @ =gUnknown_0203930C
	ldr r0, [r2, 0x8]
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r5]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136C68
	.align 2, 0
_08136C3C: .4byte gUnknown_083DFEC4
_08136C40: .4byte 0x000087dc
_08136C44: .4byte gUnknown_02039310
_08136C48: .4byte gUnknown_02039308
_08136C4C: .4byte gUnknown_0203930C
_08136C50:
	ldr r0, _08136C70 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136C68
	ldr r0, _08136C74 @ =gMain
	ldr r1, _08136C78 @ =sub_8136174
	str r1, [r0, 0x8]
	ldr r0, _08136C7C @ =sub_8147ADC
	bl SetMainCallback2
_08136C68:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08136C70: .4byte gPaletteFade
_08136C74: .4byte gMain
_08136C78: .4byte sub_8136174
_08136C7C: .4byte sub_8147ADC
	thumb_func_end sub_8136808

	thumb_func_start sub_81368A4
sub_81368A4: @ 8136C80
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08136CA0 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _08136C94
	b _08136D94
_08136C94:
	lsls r0, 2
	ldr r1, _08136CA4 @ =_08136CA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08136CA0: .4byte gUnknown_02039304
_08136CA4: .4byte _08136CA8
	.align 2, 0
_08136CA8:
	.4byte _08136CC4
	.4byte _08136CFE
	.4byte _08136D0A
	.4byte _08136D28
	.4byte _08136D36
	.4byte _08136D48
	.4byte _08136D74
_08136CC4:
	ldr r0, _08136CE8 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08136CEC @ =0x000087dc
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _08136CF0 @ =gUnknown_02039310
	ldrb r0, [r0]
	cmp r1, r0
	beq _08136CF4
	ldr r0, [r4]
	adds r0, 0x56
	ldrb r0, [r0]
	bl sub_80F5060
	ldr r1, [r4]
	b _08136D62
	.align 2, 0
_08136CE8: .4byte gUnknown_083DFEC4
_08136CEC: .4byte 0x000087dc
_08136CF0: .4byte gUnknown_02039310
_08136CF4:
	ldr r0, [r4]
	adds r0, 0x50
	movs r1, 0x3
	strb r1, [r0]
	b _08136D94
_08136CFE:
	bl gpu_sync_bg_show
	lsls r0, 24
	cmp r0, 0
	bne _08136D94
	b _08136D5E
_08136D0A:
	bl sub_8055870
	adds r4, r0, 0
	cmp r4, 0
	bne _08136D94
	bl sub_80F1934
	ldr r0, _08136D24 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x50
	strb r4, [r0]
	b _08136D94
	.align 2, 0
_08136D24: .4byte gUnknown_02039304
_08136D28:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	b _08136D5E
_08136D36:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _08136D44 @ =0x00007f40
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [r4]
	b _08136D62
	.align 2, 0
_08136D44: .4byte 0x00007f40
_08136D48:
	ldr r0, _08136D6C @ =sub_8136264
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08136D5E:
	ldr r0, _08136D70 @ =gUnknown_02039304
	ldr r1, [r0]
_08136D62:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136D94
	.align 2, 0
_08136D6C: .4byte sub_8136264
_08136D70: .4byte gUnknown_02039304
_08136D74:
	ldr r0, _08136D9C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136D94
	bl sub_80F3C94
	bl sub_80F3D00
	ldr r0, _08136DA0 @ =sub_81369CC
	bl launch_c3_walk_stairs_and_run_once
	ldr r0, _08136DA4 @ =sub_8136244
	bl SetMainCallback2
_08136D94:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08136D9C: .4byte gPaletteFade
_08136DA0: .4byte sub_81369CC
_08136DA4: .4byte sub_8136244
	thumb_func_end sub_81368A4

	thumb_func_start sub_81369CC
sub_81369CC: @ 8136DA8
	push {r4-r6,lr}
	ldr r1, _08136DC4 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x50
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _08136DBA
	b _08136F0E
_08136DBA:
	lsls r0, 2
	ldr r1, _08136DC8 @ =_08136DCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08136DC4: .4byte gUnknown_02039304
_08136DC8: .4byte _08136DCC
	.align 2, 0
_08136DCC:
	.4byte _08136DE4
	.4byte _08136E24
	.4byte _08136E38
	.4byte _08136E88
	.4byte _08136EC8
	.4byte _08136EEA
_08136DE4:
	ldr r3, [r4]
	ldr r2, _08136E14 @ =gPlayerParty
	str r2, [r3, 0xC]
	ldr r0, _08136E18 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r5, _08136E1C @ =0x000087dc
	adds r0, r1, r5
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08136E20 @ =0x0000893e
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r0, r2
	str r0, [r3, 0xC]
	bl move_anim_execute
	b _08136EDE
	.align 2, 0
_08136E14: .4byte gPlayerParty
_08136E18: .4byte gUnknown_083DFEC4
_08136E1C: .4byte 0x000087dc
_08136E20: .4byte 0x0000893e
_08136E24:
	ldr r0, _08136E34 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136F0E
	b _08136EDE
	.align 2, 0
_08136E34: .4byte gMain
_08136E38:
	bl sub_8136EF0
	ldr r6, _08136E74 @ =gUnknown_02039304
	ldr r0, [r6]
	adds r0, 0x5C
	ldr r1, _08136E78 @ =gUnknown_083DFEC4
	ldr r4, [r1]
	ldr r1, _08136E7C @ =0x00009040
	adds r5, r4, r1
	adds r1, r5, 0
	bl sub_80F567C
	ldr r1, _08136E80 @ =0x00008fe9
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08136E84 @ =0x00009004
	adds r0, r1
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F5550
	bl sub_8137138
	ldr r1, [r6]
	b _08136EE0
	.align 2, 0
_08136E74: .4byte gUnknown_02039304
_08136E78: .4byte gUnknown_083DFEC4
_08136E7C: .4byte 0x00009040
_08136E80: .4byte 0x00008fe9
_08136E84: .4byte 0x00009004
_08136E88:
	bl sub_80F555C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08136F0E
	ldr r0, _08136EBC @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r5, _08136EC0 @ =0x000087dc
	adds r0, r5
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F7224
	bl sub_80F3D00
	ldr r1, _08136EC4 @ =gUnknown_02039304
	ldr r0, [r1]
	adds r0, 0x52
	strb r4, [r0]
	ldr r1, [r1]
	b _08136EE0
	.align 2, 0
_08136EBC: .4byte gUnknown_083DFEC4
_08136EC0: .4byte 0x000087dc
_08136EC4: .4byte gUnknown_02039304
_08136EC8:
	ldr r1, [r4]
	adds r1, 0x52
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bls _08136F0E
	bl sub_8136C6C
_08136EDE:
	ldr r1, [r4]
_08136EE0:
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136F0E
_08136EEA:
	ldr r0, _08136F14 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08136F0E
	bl sub_8136D00
	lsls r0, 24
	cmp r0, 0
	bne _08136F0E
	ldr r0, _08136F18 @ =gScriptItemId
	ldrb r0, [r0]
	bl sub_810CA6C
	ldr r0, _08136F1C @ =sub_8136B44
	bl launch_c3_walk_stairs_and_run_once
_08136F0E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08136F14: .4byte gMain
_08136F18: .4byte gScriptItemId
_08136F1C: .4byte sub_8136B44
	thumb_func_end sub_81369CC

	thumb_func_start sub_8136B44
sub_8136B44: @ 8136F20
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08136F3C @ =gUnknown_02039304
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x50
	ldrb r1, [r2]
	cmp r1, 0x1
	beq _08136F5C
	cmp r1, 0x1
	bgt _08136F40
	cmp r1, 0
	beq _08136F4A
	b _08136F8A
	.align 2, 0
_08136F3C: .4byte gUnknown_02039304
_08136F40:
	cmp r1, 0x2
	beq _08136F74
	cmp r1, 0x3
	beq _08136F84
	b _08136F8A
_08136F4A:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08136F78
_08136F5C:
	ldr r0, _08136F70 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08136F8A
	movs r0, 0x2
	strb r0, [r2]
	b _08136F8A
	.align 2, 0
_08136F70: .4byte gPaletteFade
_08136F74:
	bl sub_80F5BDC
_08136F78:
	ldr r1, [r4]
	adds r1, 0x50
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08136F8A
_08136F84:
	ldr r0, [r0, 0x4]
	bl SetMainCallback2
_08136F8A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136B44

	thumb_func_start sub_8136BB8
sub_8136BB8: @ 8136F94
	push {r4,lr}
	ldr r0, _08137004 @ =gUnknown_083DFEC4
	ldr r0, [r0]
	ldr r1, _08137008 @ =0x000087dc
	adds r0, r1
	ldrb r0, [r0]
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0813700C @ =gPlayerParty
	adds r0, r1
	ldr r4, _08137010 @ =gUnknown_02039304
	ldr r2, [r4]
	adds r2, 0x10
	movs r1, 0x2
	bl GetMonData
	ldr r0, [r4]
	adds r0, 0x10
	bl StringGetEnd10
	ldr r0, [r4]
	adds r0, 0x10
	ldr r1, _08137014 @ =gOtherText_GetsAPokeBlock
	bl StringAppend
	ldr r0, _08137018 @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, [r4]
	adds r0, 0x10
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1
	bl DisplayYesNoMenu
	movs r0, 0
	bl MoveMenuCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08137004: .4byte gUnknown_083DFEC4
_08137008: .4byte 0x000087dc
_0813700C: .4byte gPlayerParty
_08137010: .4byte gUnknown_02039304
_08137014: .4byte gOtherText_GetsAPokeBlock
_08137018: .4byte gWindowConfig_81E709C
	thumb_func_end sub_8136BB8

	thumb_func_start sub_8136C40
sub_8136C40: @ 813701C
	push {r4,lr}
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r4, r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0813703C
	bl MenuZeroFillScreen
	ldr r0, _08137044 @ =gWindowConfig_81E7080
	bl BasicInitMenuWindow
_0813703C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08137044: .4byte gWindowConfig_81E7080
	thumb_func_end sub_8136C40

	thumb_func_start sub_8136C6C
sub_8136C6C: @ 8137048
	push {lr}
	ldr r0, _08137068 @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _0813706C @ =gUnknown_02039304
	ldr r0, [r3]
	adds r0, 0x53
	movs r1, 0
	b _08137078
	.align 2, 0
_08137068: .4byte gWindowConfig_81E709C
_0813706C: .4byte gUnknown_02039304
_08137070:
	ldr r0, [r3]
	adds r0, 0x53
	ldrb r1, [r0]
	adds r1, 0x1
_08137078:
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _081370B8
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08137070
	ldr r0, _081370B4 @ =gUnknown_02039304
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _081370B8
	adds r0, r2, 0
	adds r0, 0x10
	ldrb r1, [r1]
	adds r2, 0x61
	adds r2, r1
	ldrb r2, [r2]
	bl sub_8136DC0
	b _081370CA
	.align 2, 0
_081370B4: .4byte gUnknown_02039304
_081370B8:
	ldr r0, _081370D8 @ =gUnknown_02039304
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, 0x53
	ldrb r1, [r1]
	movs r2, 0
	bl sub_8136DC0
_081370CA:
	ldr r0, _081370D8 @ =gUnknown_02039304
	ldr r0, [r0]
	adds r0, 0x10
	bl sub_8136DA0
	pop {r0}
	bx r0
	.align 2, 0
_081370D8: .4byte gUnknown_02039304
	thumb_func_end sub_8136C6C

	thumb_func_start sub_8136D00
sub_8136D00: @ 81370DC
	push {r4,r5,lr}
	ldr r4, _0813710C @ =gUnknown_02039304
	adds r3, r4, 0
	movs r5, 0x5
_081370E4:
	ldr r0, [r3]
	adds r0, 0x53
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r2, [r3]
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r0, [r1]
	cmp r0, 0x4
	bhi _08137110
	adds r0, r2, 0
	adds r0, 0x61
	ldrb r1, [r1]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08137116
	b _081370E4
	.align 2, 0
_0813710C: .4byte gUnknown_02039304
_08137110:
	strb r5, [r1]
	movs r0, 0
	b _08137136
_08137116:
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x10
	adds r1, r2, 0
	adds r1, 0x53
	ldrb r1, [r1]
	adds r2, 0x61
	adds r2, r1
	ldrb r2, [r2]
	bl sub_8136DC0
	ldr r0, [r4]
	adds r0, 0x10
	bl sub_8136DA0
	movs r0, 0x1
_08137136:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8136D00

	thumb_func_start sub_8136D60
sub_8136D60: @ 813713C
	push {lr}
	ldr r0, _08137160 @ =gWindowConfig_81E709C
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08137164 @ =gOtherText_WontEat
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08137160: .4byte gWindowConfig_81E709C
_08137164: .4byte gOtherText_WontEat
	thumb_func_end sub_8136D60

	thumb_func_start sub_8136D8C
sub_8136D8C: @ 8137168
	push {lr}
	bl MenuZeroFillScreen
	ldr r0, _08137178 @ =gWindowConfig_81E7080
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_08137178: .4byte gWindowConfig_81E7080
	thumb_func_end sub_8136D8C

	thumb_func_start sub_8136DA0
sub_8136DA0: @ 813717C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8136DA0

	thumb_func_start sub_8136DC0
sub_8136DC0: @ 813719C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _081371D8
	cmp r2, 0
	ble _081371B4
	movs r0, 0
_081371B4:
	lsls r0, 16
	ldr r1, _081371D0 @ =gUnknown_08406134
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _081371D4 @ =gOtherText_WasEnhanced
	adds r0, r4, 0
	bl StringAppend
	b _081371E0
	.align 2, 0
_081371D0: .4byte gUnknown_08406134
_081371D4: .4byte gOtherText_WasEnhanced
_081371D8:
	ldr r1, _081371E8 @ =gOtherText_NothingChanged
	adds r0, r4, 0
	bl StringCopy
_081371E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081371E8: .4byte gOtherText_NothingChanged
	thumb_func_end sub_8136DC0

	thumb_func_start sub_8136E10
sub_8136E10: @ 81371EC
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0
	ldr r7, _08137218 @ =gUnknown_08406118
_081371F6:
	lsls r0, r4, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl GetMonData
	adds r1, r5, r4
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _081371F6
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137218: .4byte gUnknown_08406118
	thumb_func_end sub_8136E10

	thumb_func_start sub_8136E40
sub_8136E40: @ 813721C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	adds r0, r5, 0
	movs r1, 0x30
	bl GetMonData
	cmp r0, 0xFF
	beq _081372B8
	mov r0, r8
	adds r1, r5, 0
	bl sub_8136F74
	movs r4, 0
	mov r7, sp
_08137240:
	ldr r1, _081372C4 @ =gUnknown_08406118
	lsls r0, r4, 2
	adds r0, r1
	ldr r6, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r7]
	ldr r1, _081372C8 @ =gUnknown_02039304
	ldr r1, [r1]
	lsls r2, r4, 1
	adds r1, 0x66
	adds r1, r2
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _0813726E
	movs r1, 0
_0813726E:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08137278
	movs r1, 0xFF
_08137278:
	strb r1, [r7]
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _08137240
	adds r0, r5, 0
	movs r1, 0x30
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	ldrb r2, [r2, 0x6]
	adds r1, r0, r2
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _081372AA
	movs r1, 0xFF
_081372AA:
	mov r0, sp
	strb r1, [r0]
	adds r0, r5, 0
	movs r1, 0x30
	mov r2, sp
	bl SetMonData
_081372B8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081372C4: .4byte gUnknown_08406118
_081372C8: .4byte gUnknown_02039304
	thumb_func_end sub_8136E40

	thumb_func_start sub_8136EF0
sub_8136EF0: @ 81372CC
	push {r4,r5,lr}
	ldr r5, _0813733C @ =gPlayerParty
	ldr r0, _08137340 @ =gUnknown_083DFEC4
	ldr r1, [r0]
	ldr r2, _08137344 @ =0x000087dc
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 2
	adds r1, r0
	ldr r0, _08137348 @ =0x0000893e
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 27
	lsrs r0, 27
	movs r1, 0x64
	muls r0, r1
	adds r5, r0, r5
	ldr r4, _0813734C @ =gUnknown_02039304
	ldr r1, [r4]
	adds r1, 0x57
	adds r0, r5, 0
	bl sub_8136E10
	ldr r0, [r4]
	ldr r0, [r0, 0x8]
	adds r1, r5, 0
	bl sub_8136E40
	ldr r1, [r4]
	adds r1, 0x5C
	adds r0, r5, 0
	bl sub_8136E10
	movs r3, 0
_08137312:
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x61
	adds r2, r3
	adds r1, r0, 0
	adds r1, 0x5C
	adds r1, r3
	adds r0, 0x57
	adds r0, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r1, r0
	strb r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _08137312
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813733C: .4byte gPlayerParty
_08137340: .4byte gUnknown_083DFEC4
_08137344: .4byte 0x000087dc
_08137348: .4byte 0x0000893e
_0813734C: .4byte gUnknown_02039304
	thumb_func_end sub_8136EF0

	thumb_func_start sub_8136F74
sub_8136F74: @ 8137350
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r1
	ldr r1, _08137398 @ =gUnknown_02039304
	ldr r3, [r1]
	ldrb r1, [r0, 0x1]
	adds r2, r3, 0
	adds r2, 0x66
	strh r1, [r2]
	ldrb r2, [r0, 0x5]
	adds r1, r3, 0
	adds r1, 0x68
	strh r2, [r1]
	ldrb r1, [r0, 0x4]
	adds r2, r3, 0
	adds r2, 0x6A
	strh r1, [r2]
	ldrb r2, [r0, 0x3]
	adds r1, r3, 0
	adds r1, 0x6C
	strh r2, [r1]
	ldrb r1, [r0, 0x2]
	adds r0, r3, 0
	adds r0, 0x6E
	strh r1, [r0]
	ldr r0, _0813739C @ =gUnknown_02039312
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _081373A0
	movs r0, 0x1
	b _081373A6
	.align 2, 0
_08137398: .4byte gUnknown_02039304
_0813739C: .4byte gUnknown_02039312
_081373A0:
	cmp r0, 0
	bge _0813741C
	movs r0, 0xFF
_081373A6:
	movs r2, 0
	lsls r0, 24
	mov r9, r0
	ldr r0, _0813742C @ =gUnknown_02039304
	mov r8, r0
_081373B0:
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, 24
	asrs r6, r0, 24
	lsls r7, r6, 1
	adds r1, 0x66
	adds r1, r7
	movs r2, 0
	ldrsh r4, [r1, r2]
	adds r0, r4, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081373E8
	lsls r0, r5, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
_081373E8:
	ldr r0, _08137430 @ =gUnknown_0840612C
	adds r0, r6, r0
	ldrb r1, [r0]
	mov r0, r10
	bl sub_8040A54
	lsls r0, 24
	asrs r2, r0, 24
	cmp r0, r9
	bne _08137410
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x66
	adds r0, r7
	lsls r1, r5, 24
	asrs r1, 24
	muls r1, r2
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
_08137410:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x4
	ble _081373B0
_0813741C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813742C: .4byte gUnknown_02039304
_08137430: .4byte gUnknown_0840612C
	thumb_func_end sub_8136F74

	thumb_func_start sub_8137058
sub_8137058: @ 8137434
	push {lr}
	ldr r0, _08137468 @ =gPlayerParty
	ldr r1, _0813746C @ =gUnknown_083DFEC4
	ldr r2, [r1]
	ldr r3, _08137470 @ =0x000087dc
	adds r1, r2, r3
	movs r3, 0
	ldrsh r1, [r1, r3]
	lsls r1, 2
	adds r2, r1
	ldr r1, _08137474 @ =0x0000893e
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x64
	muls r1, r2
	adds r0, r1, r0
	movs r1, 0x30
	bl GetMonData
	cmp r0, 0xFF
	beq _08137478
	movs r0, 0
	b _0813747A
	.align 2, 0
_08137468: .4byte gPlayerParty
_0813746C: .4byte gUnknown_083DFEC4
_08137470: .4byte 0x000087dc
_08137474: .4byte 0x0000893e
_08137478:
	movs r0, 0x1
_0813747A:
	pop {r1}
	bx r1
	thumb_func_end sub_8137058

	thumb_func_start sub_81370A4
sub_81370A4: @ 8137480
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_08137488:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _081374A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _081374AE
	cmp r5, 0
	bne _081374A8
	adds r0, r4, 0
	b _081374BA
	.align 2, 0
_081374A4: .4byte gPlayerParty
_081374A8:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_081374AE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08137488
	movs r0, 0
_081374BA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81370A4

	thumb_func_start sub_81370E4
sub_81370E4: @ 81374C0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	movs r6, 0
	cmp r6, r5
	bcs _081374F0
_081374CE:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _081374FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _081374E6
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_081374E6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _081374CE
_081374F0:
	subs r0, r5, r6
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081374FC: .4byte gPlayerParty
	thumb_func_end sub_81370E4

	thumb_func_start sub_8137124
sub_8137124: @ 8137500
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_81370A4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8137124

	thumb_func_start sub_8137138
sub_8137138: @ 8137514
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0813759C @ =gSpriteSheet_ConditionUpDown
	bl LoadSpriteSheet
	ldr r0, _081375A0 @ =gSpritePalette_ConditionUpDown
	bl LoadSpritePalette
	ldr r2, _081375A4 @ =gUnknown_02039304
	ldr r0, [r2]
	adds r0, 0x54
	movs r1, 0
	strb r1, [r0]
	movs r4, 0
	adds r5, r2, 0
	ldr r6, _081375A8 @ =gUnknown_08406158
	adds r0, r6, 0x2
	mov r8, r0
	ldr r7, _081375AC @ =0x02020020
_0813753C:
	ldr r0, [r5]
	adds r0, 0x61
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08137588
	lsls r2, r4, 2
	adds r0, r2, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	add r2, r8
	movs r0, 0
	ldrsh r2, [r2, r0]
	ldr r0, _081375B0 @ =gSpriteTemplate_840618C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08137588
	ldr r0, [r5]
	adds r0, 0x61
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0813757E
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _081375B4 @ =sub_81371DC
	str r1, [r0]
_0813757E:
	ldr r1, [r5]
	adds r1, 0x54
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08137588:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0813753C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813759C: .4byte gSpriteSheet_ConditionUpDown
_081375A0: .4byte gSpritePalette_ConditionUpDown
_081375A4: .4byte gUnknown_02039304
_081375A8: .4byte gUnknown_08406158
_081375AC: .4byte 0x02020020
_081375B0: .4byte gSpriteTemplate_840618C
_081375B4: .4byte sub_81371DC
	thumb_func_end sub_8137138

	thumb_func_start sub_81371DC
sub_81371DC: @ 81375B8
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bgt _081375CA
	ldrh r0, [r1, 0x26]
	subs r0, 0x2
	b _081375D2
_081375CA:
	cmp r0, 0xB
	bgt _081375D4
	ldrh r0, [r1, 0x26]
	adds r0, 0x2
_081375D2:
	strh r0, [r1, 0x26]
_081375D4:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _081375F4
	adds r0, r1, 0
	bl DestroySprite
	ldr r0, _081375F8 @ =gUnknown_02039304
	ldr r1, [r0]
	adds r1, 0x54
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_081375F4:
	pop {r0}
	bx r0
	.align 2, 0
_081375F8: .4byte gUnknown_02039304
	thumb_func_end sub_81371DC

	thumb_func_start unref_sub_8137220
unref_sub_8137220: @ 81375FC
	bx lr
	thumb_func_end unref_sub_8137220

	thumb_func_start sub_8137224
sub_8137224: @ 8137600
	ldr r1, _0813762C @ =gUnknown_03004330
	ldr r0, _08137630 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08137634 @ =sub_813726C
	str r1, [r0]
	ldr r1, _08137638 @ =0x02000000
	ldr r2, _0813763C @ =0x000160a8
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08137640 @ =0x000160a9
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, 0x1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08137644 @ =0x000160ab
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_0813762C: .4byte gUnknown_03004330
_08137630: .4byte gUnknown_02024A60
_08137634: .4byte sub_813726C
_08137638: .4byte 0x02000000
_0813763C: .4byte 0x000160a8
_08137640: .4byte 0x000160a9
_08137644: .4byte 0x000160ab
	thumb_func_end sub_8137224

	thumb_func_start sub_813726C
sub_813726C: @ 8137648
	push {lr}
	ldr r2, _0813767C @ =gUnknown_02024A64
	ldr r1, _08137680 @ =gBitTable
	ldr r0, _08137684 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08137694
	ldr r0, _08137688 @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _08137690
	ldr r0, _0813768C @ =gUnknown_084061A4
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _08137694
	.align 2, 0
_0813767C: .4byte gUnknown_02024A64
_08137680: .4byte gBitTable
_08137684: .4byte gUnknown_02024A60
_08137688: .4byte gUnknown_02023A60
_0813768C: .4byte gUnknown_084061A4
_08137690:
	bl dp01_tbl5_exec_completed
_08137694:
	pop {r0}
	bx r0
	thumb_func_end sub_813726C

	thumb_func_start sub_81372BC
sub_81372BC: @ 8137698
	push {r4-r6,lr}
	ldr r1, _081376B4 @ =0x02000000
	ldr r2, _081376B8 @ =0x000160a8
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bls _081376AA
	b _081377EC
_081376AA:
	lsls r0, 2
	ldr r1, _081376BC @ =_081376C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081376B4: .4byte 0x02000000
_081376B8: .4byte 0x000160a8
_081376BC: .4byte _081376C0
	.align 2, 0
_081376C0:
	.4byte _081376D8
	.4byte _081376EA
	.4byte _08137720
	.4byte _08137744
	.4byte _08137788
	.4byte _081377C4
_081376D8:
	ldr r0, _08137718 @ =0x000160aa
	adds r1, r5, r0
	movs r0, 0x40
	strb r0, [r1]
	ldr r2, _0813771C @ =0x000160a8
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081376EA:
	ldr r0, _08137718 @ =0x000160aa
	adds r6, r5, r0
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081377EC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
	ldr r2, _0813771C @ =0x000160a8
	adds r1, r5, r2
	b _08137768
	.align 2, 0
_08137718: .4byte 0x000160aa
_0813771C: .4byte 0x000160a8
_08137720:
	ldr r2, _08137740 @ =0x000160aa
	adds r6, r5, r2
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081377EC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	movs r1, 0
	b _0813775A
	.align 2, 0
_08137740: .4byte 0x000160aa
_08137744:
	ldr r2, _0813777C @ =0x000160aa
	adds r6, r5, r2
	ldrb r0, [r6]
	subs r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081377EC
	movs r0, 0x1
	movs r1, 0x9
_0813775A:
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
	ldr r0, _08137780 @ =0x000160a8
	adds r1, r5, r0
_08137768:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08137784 @ =0x000160a9
	adds r0, r5, r1
	strb r4, [r0]
	movs r0, 0x40
	strb r0, [r6]
	b _081377EC
	.align 2, 0
_0813777C: .4byte 0x000160aa
_08137780: .4byte 0x000160a8
_08137784: .4byte 0x000160a9
_08137788:
	ldr r2, _081377BC @ =0x000160aa
	adds r4, r5, r2
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bne _081377EC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl nullsub_8
	movs r0, 0x1
	movs r1, 0
	bl sub_802E3E4
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _081377C0 @ =0x000160a8
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081377EC
	.align 2, 0
_081377BC: .4byte 0x000160aa
_081377C0: .4byte 0x000160a8
_081377C4:
	ldr r2, _081377F4 @ =0x000160aa
	adds r1, r5, r2
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _081377EC
	movs r0, 0x5
	bl PlaySE
	bl sub_814A7FC
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
_081377EC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081377F4: .4byte 0x000160aa
	thumb_func_end sub_81372BC

	thumb_func_start sub_813741C
sub_813741C: @ 81377F8
	push {lr}
	ldr r2, _08137820 @ =gSprites
	ldr r1, _08137824 @ =gUnknown_02024BE0
	ldr r0, _08137828 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0813782C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0813781C
	bl dp01_tbl5_exec_completed
_0813781C:
	pop {r0}
	bx r0
	.align 2, 0
_08137820: .4byte gSprites
_08137824: .4byte gUnknown_02024BE0
_08137828: .4byte gUnknown_02024A60
_0813782C: .4byte SpriteCallbackDummy
	thumb_func_end sub_813741C

	thumb_func_start sub_8137454
sub_8137454: @ 8137830
	push {lr}
	ldr r0, _08137844 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0813783E
	bl dp01_tbl5_exec_completed
_0813783E:
	pop {r0}
	bx r0
	.align 2, 0
_08137844: .4byte gUnknown_03004210
	thumb_func_end sub_8137454

	thumb_func_start sub_813746C
sub_813746C: @ 8137848
	push {lr}
	ldr r0, _08137878 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08137872
	ldr r2, _0813787C @ =gMain
	ldr r0, _08137880 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08137884 @ =gUnknown_030042D0
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_08137872:
	pop {r0}
	bx r0
	.align 2, 0
_08137878: .4byte gPaletteFade
_0813787C: .4byte gMain
_08137880: .4byte 0x0000043d
_08137884: .4byte gUnknown_030042D0
	thumb_func_end sub_813746C

	thumb_func_start bx_wait_t5
bx_wait_t5: @ 8137888
	push {lr}
	ldr r0, _0813789C @ =gUnknown_02024E6D
	ldrb r0, [r0]
	cmp r0, 0
	bne _08137896
	bl dp01_tbl5_exec_completed
_08137896:
	pop {r0}
	bx r0
	.align 2, 0
_0813789C: .4byte gUnknown_02024E6D
	thumb_func_end bx_wait_t5

	thumb_func_start sub_81374C4
sub_81374C4: @ 81378A0
	push {lr}
	ldr r0, _081378C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081378C4
	ldr r1, _081378CC @ =gUnknown_03004330
	ldr r0, _081378D0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081378D4 @ =sub_81374FC
	str r1, [r0]
	bl nullsub_14
	bl PrepareBagForWallyTutorial
_081378C4:
	pop {r0}
	bx r0
	.align 2, 0
_081378C8: .4byte gPaletteFade
_081378CC: .4byte gUnknown_03004330
_081378D0: .4byte gUnknown_02024A60
_081378D4: .4byte sub_81374FC
	thumb_func_end sub_81374C4

	thumb_func_start sub_81374FC
sub_81374FC: @ 81378D8
	push {lr}
	ldr r0, _08137904 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08137908 @ =sub_800F808
	cmp r1, r0
	bne _081378FE
	ldr r0, _0813790C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081378FE
	ldr r0, _08137910 @ =gScriptItemId
	ldrh r1, [r0]
	movs r0, 0x1
	bl dp01_build_cmdbuf_x23_aa_0
	bl dp01_tbl5_exec_completed
_081378FE:
	pop {r0}
	bx r0
	.align 2, 0
_08137904: .4byte gMain
_08137908: .4byte sub_800F808
_0813790C: .4byte gPaletteFade
_08137910: .4byte gScriptItemId
	thumb_func_end sub_81374FC

	thumb_func_start sub_8137538
sub_8137538: @ 8137914
	push {r4-r7,lr}
	ldr r5, _08137A68 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r4, _08137A6C @ =0x02017810
	adds r0, r4
	ldrb r1, [r0]
	movs r7, 0x88
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137944
	ldr r0, _08137A70 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137A74 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08137944:
	ldrb r0, [r5]
	movs r6, 0x2
	adds r2, r6, 0
	eors r2, r0
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _08137972
	ldr r0, _08137A70 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08137A74 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_08137972:
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	movs r3, 0x8
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08137A60
	adds r1, r6, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08137A60
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08137A02
	ldr r0, _08137A78 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08137A02
	ldr r1, _08137A7C @ =gUnknown_0300434C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137A80 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _08137A84 @ =gUnknown_03004340
	ldrb r0, [r5]
	adds r1, r6, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _08137A70 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137A74 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r5]
	eors r0, r6
	bl sub_804777C
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
_08137A02:
	ldr r1, _08137A7C @ =gUnknown_0300434C
	ldr r4, _08137A68 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137A80 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _08137A84 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _08137A70 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08137A74 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _08137A88 @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08137A8C @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08137A90 @ =sub_81376B8
	str r1, [r0]
_08137A60:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137A68: .4byte gUnknown_02024A60
_08137A6C: .4byte 0x02017810
_08137A70: .4byte gUnknown_02024A6A
_08137A74: .4byte gPlayerParty
_08137A78: .4byte gUnknown_020239F8
_08137A7C: .4byte gUnknown_0300434C
_08137A80: .4byte gSprites
_08137A84: .4byte gUnknown_03004340
_08137A88: .4byte 0x02017840
_08137A8C: .4byte gUnknown_03004330
_08137A90: .4byte sub_81376B8
	thumb_func_end sub_8137538

	thumb_func_start sub_81376B8
sub_81376B8: @ 8137A94
	push {r4-r7,lr}
	movs r4, 0
	ldr r2, _08137B68 @ =gSprites
	ldr r0, _08137B6C @ =gUnknown_03004340
	ldr r7, _08137B70 @ =gUnknown_02024A60
	ldrb r3, [r7]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137B74 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08137AB8
	movs r4, 0x1
_08137AB8:
	cmp r4, 0
	beq _08137B60
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r5, _08137B78 @ =0x02017810
	adds r2, r0, r5
	ldrb r1, [r2, 0x1]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08137B60
	movs r6, 0x2
	adds r1, r6, 0
	eors r1, r3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _08137B60
	ldrb r1, [r2]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x1]
	subs r4, 0x3
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	ldrb r0, [r7]
	adds r1, r6, 0
	eors r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldr r4, _08137B7C @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _08137B80 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r2, _08137B84 @ =gUnknown_02024A6A
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08137B88 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl5_exec_completed
_08137B60:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08137B68: .4byte gSprites
_08137B6C: .4byte gUnknown_03004340
_08137B70: .4byte gUnknown_02024A60
_08137B74: .4byte SpriteCallbackDummy
_08137B78: .4byte 0x02017810
_08137B7C: .4byte 0x000027f9
_08137B80: .4byte c3_0802FDF4
_08137B84: .4byte gUnknown_02024A6A
_08137B88: .4byte gPlayerParty
	thumb_func_end sub_81376B8

	thumb_func_start sub_81377B0
sub_81377B0: @ 8137B8C
	push {r4-r6,lr}
	ldr r5, _08137BCC @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r6, _08137BD0 @ =gUnknown_03004340
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08137BD4
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _08137BEE
	.align 2, 0
_08137BCC: .4byte gUnknown_02024A60
_08137BD0: .4byte gUnknown_03004340
_08137BD4:
	ldr r2, _08137BF4 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08137BF8 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl5_exec_completed
_08137BEE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137BF4: .4byte gUnknown_02024A6A
_08137BF8: .4byte gPlayerParty
	thumb_func_end sub_81377B0

	thumb_func_start bx_blink_t5
bx_blink_t5: @ 8137BFC
	push {r4,lr}
	ldr r1, _08137C38 @ =gUnknown_02024BE0
	ldr r0, _08137C3C @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _08137C40 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _08137C48
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08137C44 @ =gUnknown_02024E6D
	strb r3, [r0]
	bl dp01_tbl5_exec_completed
	b _08137C72
	.align 2, 0
_08137C38: .4byte gUnknown_02024BE0
_08137C3C: .4byte gUnknown_02024A60
_08137C40: .4byte gSprites
_08137C44: .4byte gUnknown_02024E6D
_08137C48:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08137C6C
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08137C6C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_08137C72:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t5

	thumb_func_start sub_813789C
sub_813789C: @ 8137C78
	push {r4-r6,lr}
	ldr r6, _08137CD0 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08137CD4 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08137CC8
	ldr r5, _08137CD8 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08137CDC @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _08137CE0 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl5_exec_completed
_08137CC8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08137CD0: .4byte gUnknown_02024A60
_08137CD4: .4byte 0x02017810
_08137CD8: .4byte gUnknown_02024BE0
_08137CDC: .4byte gSprites
_08137CE0: .4byte gUnknown_03004340
	thumb_func_end sub_813789C

	thumb_func_start sub_8137908
sub_8137908: @ 8137CE4
	push {lr}
	ldr r2, _08137D0C @ =gSprites
	ldr r1, _08137D10 @ =gUnknown_02024BE0
	ldr r0, _08137D14 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _08137D18 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _08137D08
	bl dp01_tbl5_exec_completed
_08137D08:
	pop {r0}
	bx r0
	.align 2, 0
_08137D0C: .4byte gSprites
_08137D10: .4byte gUnknown_02024BE0
_08137D14: .4byte gUnknown_02024A60
_08137D18: .4byte SpriteCallbackDummy
	thumb_func_end sub_8137908

	thumb_func_start sub_8137940
sub_8137940: @ 8137D1C
	push {lr}
	ldr r0, _08137D40 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137D44 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08137D3A
	bl dp01_tbl5_exec_completed
_08137D3A:
	pop {r0}
	bx r0
	.align 2, 0
_08137D40: .4byte gUnknown_02024A60
_08137D44: .4byte 0x02017810
	thumb_func_end sub_8137940

	thumb_func_start dp01_tbl5_exec_completed
dp01_tbl5_exec_completed: @ 8137D48
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08137D88 @ =gUnknown_03004330
	ldr r4, _08137D8C @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08137D90 @ =sub_813726C
	str r1, [r0]
	ldr r0, _08137D94 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08137D9C
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _08137D98 @ =gUnknown_02023A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _08137DAE
	.align 2, 0
_08137D88: .4byte gUnknown_03004330
_08137D8C: .4byte gUnknown_02024A60
_08137D90: .4byte sub_813726C
_08137D94: .4byte gUnknown_020239F8
_08137D98: .4byte gUnknown_02023A60
_08137D9C:
	ldr r2, _08137DB8 @ =gUnknown_02024A64
	ldr r1, _08137DBC @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_08137DAE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08137DB8: .4byte gUnknown_02024A64
_08137DBC: .4byte gBitTable
	thumb_func_end dp01_tbl5_exec_completed

	thumb_func_start unref_sub_81379E4
unref_sub_81379E4: @ 8137DC0
	push {lr}
	ldr r0, _08137DE4 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08137DE8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08137DDE
	bl dp01_tbl5_exec_completed
_08137DDE:
	pop {r0}
	bx r0
	.align 2, 0
_08137DE4: .4byte gUnknown_02024A60
_08137DE8: .4byte 0x02017810
	thumb_func_end unref_sub_81379E4

	thumb_func_start dp01t_00_5_getattr
dp01t_00_5_getattr: @ 8137DEC
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _08137E18 @ =gUnknown_02023A60
	ldr r0, _08137E1C @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08137E24
	ldr r0, _08137E20 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl sub_8137A84
	adds r6, r0, 0
	b _08137E46
	.align 2, 0
_08137E18: .4byte gUnknown_02023A60
_08137E1C: .4byte gUnknown_02024A60
_08137E20: .4byte gUnknown_02024A6A
_08137E24:
	ldrb r4, [r1]
	movs r5, 0
_08137E28:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08137E3E
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl sub_8137A84
	adds r6, r0
_08137E3E:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _08137E28
_08137E46:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl dp01_tbl5_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_5_getattr

	thumb_func_start sub_8137A84
sub_8137A84: @ 8137E60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _08137E94 @ =gUnknown_02023A60
	ldr r3, _08137E98 @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _08137E8A
	bl _081385F6
_08137E8A:
	lsls r0, 2
	ldr r1, _08137E9C @ =_08137EA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08137E94: .4byte gUnknown_02023A60
_08137E98: .4byte gUnknown_02024A60
_08137E9C: .4byte _08137EA0
	.align 2, 0
_08137EA0:
	.4byte _08137F90
	.4byte _081381B4
	.4byte _081381C4
	.4byte _081381D4
	.4byte _0813823C
	.4byte _0813823C
	.4byte _0813823C
	.4byte _0813823C
	.4byte _08138258
	.4byte _08138294
	.4byte _08138294
	.4byte _08138294
	.4byte _08138294
	.4byte _081385F6
	.4byte _081385F6
	.4byte _081385F6
	.4byte _081385F6
	.4byte _081382B0
	.4byte _081382C0
	.4byte _081382F0
	.4byte _08138300
	.4byte _08138310
	.4byte _08138320
	.4byte _08138330
	.4byte _08138340
	.4byte _08138350
	.4byte _08138360
	.4byte _08138370
	.4byte _08138380
	.4byte _08138390
	.4byte _081383A0
	.4byte _081383B0
	.4byte _08138400
	.4byte _08138410
	.4byte _08138420
	.4byte _08138430
	.4byte _08138440
	.4byte _08138450
	.4byte _08138460
	.4byte _08138470
	.4byte _08138480
	.4byte _081384B4
	.4byte _081384C4
	.4byte _081384D4
	.4byte _081384E4
	.4byte _081384F4
	.4byte _08138504
	.4byte _08138514
	.4byte _08138524
	.4byte _08138544
	.4byte _08138554
	.4byte _08138564
	.4byte _08138574
	.4byte _08138584
	.4byte _08138594
	.4byte _081385A4
	.4byte _081385B4
	.4byte _081385C4
	.4byte _081385D4
	.4byte _081385E4
_08137F90:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081381A4 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_08137FDC:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08137FDC
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081381A4 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _081381A8 @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _081381AC @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _081381B0 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_08138194:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _08138194
	b _081385F6
	.align 2, 0
_081381A4: .4byte gPlayerParty
_081381A8: .4byte 0xfffffc1f
_081381AC: .4byte 0xfff07fff
_081381B0: .4byte 0xfffffe0f
_081381B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381C0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _0813852E
	.align 2, 0
_081381C0: .4byte gPlayerParty
_081381C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081381D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	b _0813852E
	.align 2, 0
_081381D0: .4byte gPlayerParty
_081381D4:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08138238 @ =gPlayerParty
	adds r4, r1, r0
	mov r8, r9
_081381EA:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _081381EA
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138238 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_08138228:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _08138228
	b _081385F6
	.align 2, 0
_08138238: .4byte gPlayerParty
_0813823C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138254 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _0813852E
	.align 2, 0
_08138254: .4byte gPlayerParty
_08138258:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _08138290 @ =gPlayerParty
	mov r8, r2
_08138264:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _08138264
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138290 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _081385F6
	.align 2, 0
_08138290: .4byte gPlayerParty
_08138294:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081382AC @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _081385EE
	.align 2, 0
_081382AC: .4byte gPlayerParty
_081382B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081382BC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _081382CA
	.align 2, 0
_081382BC: .4byte gPlayerParty
_081382C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081382EC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x19
_081382CA:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _081385F6
	.align 2, 0
_081382EC: .4byte gPlayerParty
_081382F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081382FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _081385EE
	.align 2, 0
_081382FC: .4byte gPlayerParty
_08138300:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813830C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _081385EE
	.align 2, 0
_0813830C: .4byte gPlayerParty
_08138310:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813831C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _081385EE
	.align 2, 0
_0813831C: .4byte gPlayerParty
_08138320:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813832C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _081385EE
	.align 2, 0
_0813832C: .4byte gPlayerParty
_08138330:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813833C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _081385EE
	.align 2, 0
_0813833C: .4byte gPlayerParty
_08138340:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813834C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _081385EE
	.align 2, 0
_0813834C: .4byte gPlayerParty
_08138350:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813835C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _081385EE
	.align 2, 0
_0813835C: .4byte gPlayerParty
_08138360:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813836C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _081385EE
	.align 2, 0
_0813836C: .4byte gPlayerParty
_08138370:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813837C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _081385EE
	.align 2, 0
_0813837C: .4byte gPlayerParty
_08138380:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813838C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _081385EE
	.align 2, 0
_0813838C: .4byte gPlayerParty
_08138390:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813839C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _081385EE
	.align 2, 0
_0813839C: .4byte gPlayerParty
_081383A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081383AC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _081385EE
	.align 2, 0
_081383AC: .4byte gPlayerParty
_081383B0:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _081383FC @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _081385F6
	.align 2, 0
_081383FC: .4byte gPlayerParty
_08138400:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813840C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _081385EE
	.align 2, 0
_0813840C: .4byte gPlayerParty
_08138410:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813841C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _081385EE
	.align 2, 0
_0813841C: .4byte gPlayerParty
_08138420:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813842C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _081385EE
	.align 2, 0
_0813842C: .4byte gPlayerParty
_08138430:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813843C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _081385EE
	.align 2, 0
_0813843C: .4byte gPlayerParty
_08138440:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813844C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _081385EE
	.align 2, 0
_0813844C: .4byte gPlayerParty
_08138450:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813845C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _081385EE
	.align 2, 0
_0813845C: .4byte gPlayerParty
_08138460:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813846C @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _0813848A
	.align 2, 0
_0813846C: .4byte gPlayerParty
_08138470:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0813847C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _0813852E
	.align 2, 0
_0813847C: .4byte gPlayerParty
_08138480:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081384B0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
_0813848A:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _081385F6
	.align 2, 0
_081384B0: .4byte gPlayerParty
_081384B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081384C0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _081385EE
	.align 2, 0
_081384C0: .4byte gPlayerParty
_081384C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081384D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _0813852E
	.align 2, 0
_081384D0: .4byte gPlayerParty
_081384D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081384E0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _0813852E
	.align 2, 0
_081384E0: .4byte gPlayerParty
_081384E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081384F0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _0813852E
	.align 2, 0
_081384F0: .4byte gPlayerParty
_081384F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138500 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _0813852E
	.align 2, 0
_08138500: .4byte gPlayerParty
_08138504:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138510 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _0813852E
	.align 2, 0
_08138510: .4byte gPlayerParty
_08138514:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138520 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _0813852E
	.align 2, 0
_08138520: .4byte gPlayerParty
_08138524:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138540 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3F
_0813852E:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _081385F6
	.align 2, 0
_08138540: .4byte gPlayerParty
_08138544:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138550 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _081385EE
	.align 2, 0
_08138550: .4byte gPlayerParty
_08138554:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138560 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _081385EE
	.align 2, 0
_08138560: .4byte gPlayerParty
_08138564:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138570 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _081385EE
	.align 2, 0
_08138570: .4byte gPlayerParty
_08138574:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138580 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _081385EE
	.align 2, 0
_08138580: .4byte gPlayerParty
_08138584:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138590 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _081385EE
	.align 2, 0
_08138590: .4byte gPlayerParty
_08138594:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385A0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _081385EE
	.align 2, 0
_081385A0: .4byte gPlayerParty
_081385A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385B0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _081385EE
	.align 2, 0
_081385B0: .4byte gPlayerParty
_081385B4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385C0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _081385EE
	.align 2, 0
_081385C0: .4byte gPlayerParty
_081385C4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _081385EE
	.align 2, 0
_081385D0: .4byte gPlayerParty
_081385D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081385E0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _081385EE
	.align 2, 0
_081385E0: .4byte gPlayerParty
_081385E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138608 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x36
_081385EE:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_081385F6:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08138608: .4byte gPlayerParty
	thumb_func_end sub_8137A84

	thumb_func_start sub_8138230
sub_8138230: @ 813860C
	push {lr}
	bl sub_802ECF0
	pop {r0}
	bx r0
	thumb_func_end sub_8138230

	thumb_func_start sub_813823C
sub_813823C: @ 8138618
	push {r4,r5,lr}
	ldr r1, _0813863C @ =gUnknown_02023A60
	ldr r0, _08138640 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _08138648
	ldr r0, _08138644 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_8138294
	b _08138666
	.align 2, 0
_0813863C: .4byte gUnknown_02023A60
_08138640: .4byte gUnknown_02024A60
_08138644: .4byte gUnknown_02024A6A
_08138648:
	ldrb r4, [r1]
	movs r5, 0
_0813864C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0813865A
	adds r0, r5, 0
	bl sub_8138294
_0813865A:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0813864C
_08138666:
	bl dp01_tbl5_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813823C

	thumb_func_start sub_8138294
sub_8138294: @ 8138670
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081386A8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _081386AC @ =gUnknown_02023A63
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _0813869C
	bl _08139036
_0813869C:
	lsls r0, 2
	ldr r1, _081386B0 @ =_081386B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081386A8: .4byte gUnknown_02024A60
_081386AC: .4byte gUnknown_02023A63
_081386B0: .4byte _081386B4
	.align 2, 0
_081386B4:
	.4byte _081387A4
	.4byte _0813893C
	.4byte _0813895C
	.4byte _0813897C
	.4byte _081389D4
	.4byte _081389D4
	.4byte _081389D4
	.4byte _081389D4
	.4byte _081389FC
	.4byte _08138A60
	.4byte _08138A60
	.4byte _08138A60
	.4byte _08138A60
	.4byte _08139036
	.4byte _08139036
	.4byte _08139036
	.4byte _08139036
	.4byte _08138A90
	.4byte _08138AB0
	.4byte _08138AD0
	.4byte _08138AF0
	.4byte _08138B10
	.4byte _08138B30
	.4byte _08138B50
	.4byte _08138B70
	.4byte _08138B90
	.4byte _08138BB0
	.4byte _08138BD0
	.4byte _08138BF0
	.4byte _08138C10
	.4byte _08138C30
	.4byte _08138C50
	.4byte _08138CC0
	.4byte _08138CE0
	.4byte _08138D00
	.4byte _08138D20
	.4byte _08138D40
	.4byte _08138D60
	.4byte _08138D80
	.4byte _08138DA0
	.4byte _08138DC0
	.4byte _08138DE0
	.4byte _08138E00
	.4byte _08138E20
	.4byte _08138E40
	.4byte _08138E60
	.4byte _08138E80
	.4byte _08138EA0
	.4byte _08138EC0
	.4byte _08138EE0
	.4byte _08138F00
	.4byte _08138F20
	.4byte _08138F40
	.4byte _08138F60
	.4byte _08138F80
	.4byte _08138FA0
	.4byte _08138FC0
	.4byte _08138FE0
	.4byte _08139000
	.4byte _08139020
_081387A4:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138938 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0813880A:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0813880A
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138938 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _08139036
	.align 2, 0
_08138938: .4byte gPlayerParty
_0813893C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138954 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138958 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _08139036
	.align 2, 0
_08138954: .4byte gPlayerParty
_08138958: .4byte gUnknown_02024A60
_0813895C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138974 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138978 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _08139036
	.align 2, 0
_08138974: .4byte gPlayerParty
_08138978: .4byte gUnknown_02024A60
_0813897C:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081389D0 @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_08138996:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _08138996
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _08139036
	.align 2, 0
_081389D0: .4byte gPlayerParty
_081389D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _081389F0 @ =gPlayerParty
	adds r0, r1
	ldr r3, _081389F4 @ =gUnknown_02023A60
	ldr r1, _081389F8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _08138A78
	.align 2, 0
_081389F0: .4byte gPlayerParty
_081389F4: .4byte gUnknown_02023A60
_081389F8: .4byte gUnknown_02024A60
_081389FC:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138A58 @ =gPlayerParty
	adds r4, r0
	ldr r5, _08138A5C @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _08139036
	.align 2, 0
_08138A58: .4byte gPlayerParty
_08138A5C: .4byte gUnknown_02024A60
_08138A60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138A84 @ =gPlayerParty
	adds r0, r1
	ldr r3, _08138A88 @ =gUnknown_02023A60
	ldr r1, _08138A8C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_08138A78:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _08139036
	.align 2, 0
_08138A84: .4byte gPlayerParty
_08138A88: .4byte gUnknown_02023A60
_08138A8C: .4byte gUnknown_02024A60
_08138A90:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138AA8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AAC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _08139036
	.align 2, 0
_08138AA8: .4byte gPlayerParty
_08138AAC: .4byte gUnknown_02024A60
_08138AB0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138AC8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138ACC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _08139036
	.align 2, 0
_08138AC8: .4byte gPlayerParty
_08138ACC: .4byte gUnknown_02024A60
_08138AD0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138AE8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138AEC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _08139036
	.align 2, 0
_08138AE8: .4byte gPlayerParty
_08138AEC: .4byte gUnknown_02024A60
_08138AF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B08 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B0C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _08139036
	.align 2, 0
_08138B08: .4byte gPlayerParty
_08138B0C: .4byte gUnknown_02024A60
_08138B10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B28 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B2C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _08139036
	.align 2, 0
_08138B28: .4byte gPlayerParty
_08138B2C: .4byte gUnknown_02024A60
_08138B30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B48 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B4C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _08139036
	.align 2, 0
_08138B48: .4byte gPlayerParty
_08138B4C: .4byte gUnknown_02024A60
_08138B50:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B68 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B6C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _08139036
	.align 2, 0
_08138B68: .4byte gPlayerParty
_08138B6C: .4byte gUnknown_02024A60
_08138B70:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138B88 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138B8C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _08139036
	.align 2, 0
_08138B88: .4byte gPlayerParty
_08138B8C: .4byte gUnknown_02024A60
_08138B90:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BA8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BAC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _08139036
	.align 2, 0
_08138BA8: .4byte gPlayerParty
_08138BAC: .4byte gUnknown_02024A60
_08138BB0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BC8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BCC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _08139036
	.align 2, 0
_08138BC8: .4byte gPlayerParty
_08138BCC: .4byte gUnknown_02024A60
_08138BD0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138BE8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138BEC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _08139036
	.align 2, 0
_08138BE8: .4byte gPlayerParty
_08138BEC: .4byte gUnknown_02024A60
_08138BF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C08 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C0C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _08139036
	.align 2, 0
_08138C08: .4byte gPlayerParty
_08138C0C: .4byte gUnknown_02024A60
_08138C10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C28 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C2C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _08139036
	.align 2, 0
_08138C28: .4byte gPlayerParty
_08138C2C: .4byte gUnknown_02024A60
_08138C30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138C48 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138C4C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _08139036
	.align 2, 0
_08138C48: .4byte gPlayerParty
_08138C4C: .4byte gUnknown_02024A60
_08138C50:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _08138CB8 @ =gPlayerParty
	adds r4, r0
	ldr r5, _08138CBC @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _08138D70
	.align 2, 0
_08138CB8: .4byte gPlayerParty
_08138CBC: .4byte gUnknown_02024A60
_08138CC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138CD8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138CDC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _08139036
	.align 2, 0
_08138CD8: .4byte gPlayerParty
_08138CDC: .4byte gUnknown_02024A60
_08138CE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138CF8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138CFC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _08139036
	.align 2, 0
_08138CF8: .4byte gPlayerParty
_08138CFC: .4byte gUnknown_02024A60
_08138D00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138D18 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138D1C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _08139036
	.align 2, 0
_08138D18: .4byte gPlayerParty
_08138D1C: .4byte gUnknown_02024A60
_08138D20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138D38 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138D3C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _08139036
	.align 2, 0
_08138D38: .4byte gPlayerParty
_08138D3C: .4byte gUnknown_02024A60
_08138D40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138D58 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138D5C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _08139036
	.align 2, 0
_08138D58: .4byte gPlayerParty
_08138D5C: .4byte gUnknown_02024A60
_08138D60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138D78 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138D7C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_08138D70:
	movs r1, 0x2C
	bl SetMonData
	b _08139036
	.align 2, 0
_08138D78: .4byte gPlayerParty
_08138D7C: .4byte gUnknown_02024A60
_08138D80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138D98 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138D9C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _08139036
	.align 2, 0
_08138D98: .4byte gPlayerParty
_08138D9C: .4byte gUnknown_02024A60
_08138DA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138DB8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138DBC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _08139036
	.align 2, 0
_08138DB8: .4byte gPlayerParty
_08138DBC: .4byte gUnknown_02024A60
_08138DC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138DD8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138DDC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _08139036
	.align 2, 0
_08138DD8: .4byte gPlayerParty
_08138DDC: .4byte gUnknown_02024A60
_08138DE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138DF8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138DFC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _08139036
	.align 2, 0
_08138DF8: .4byte gPlayerParty
_08138DFC: .4byte gUnknown_02024A60
_08138E00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138E18 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138E1C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _08139036
	.align 2, 0
_08138E18: .4byte gPlayerParty
_08138E1C: .4byte gUnknown_02024A60
_08138E20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138E38 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138E3C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _08139036
	.align 2, 0
_08138E38: .4byte gPlayerParty
_08138E3C: .4byte gUnknown_02024A60
_08138E40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138E58 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138E5C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _08139036
	.align 2, 0
_08138E58: .4byte gPlayerParty
_08138E5C: .4byte gUnknown_02024A60
_08138E60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138E78 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138E7C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _08139036
	.align 2, 0
_08138E78: .4byte gPlayerParty
_08138E7C: .4byte gUnknown_02024A60
_08138E80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138E98 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138E9C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _08139036
	.align 2, 0
_08138E98: .4byte gPlayerParty
_08138E9C: .4byte gUnknown_02024A60
_08138EA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138EB8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138EBC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _08139036
	.align 2, 0
_08138EB8: .4byte gPlayerParty
_08138EBC: .4byte gUnknown_02024A60
_08138EC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138ED8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138EDC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _08139036
	.align 2, 0
_08138ED8: .4byte gPlayerParty
_08138EDC: .4byte gUnknown_02024A60
_08138EE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138EF8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138EFC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _08139036
	.align 2, 0
_08138EF8: .4byte gPlayerParty
_08138EFC: .4byte gUnknown_02024A60
_08138F00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138F18 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138F1C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _08139036
	.align 2, 0
_08138F18: .4byte gPlayerParty
_08138F1C: .4byte gUnknown_02024A60
_08138F20:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138F38 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138F3C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _08139036
	.align 2, 0
_08138F38: .4byte gPlayerParty
_08138F3C: .4byte gUnknown_02024A60
_08138F40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138F58 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138F5C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _08139036
	.align 2, 0
_08138F58: .4byte gPlayerParty
_08138F5C: .4byte gUnknown_02024A60
_08138F60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138F78 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138F7C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _08139036
	.align 2, 0
_08138F78: .4byte gPlayerParty
_08138F7C: .4byte gUnknown_02024A60
_08138F80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138F98 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138F9C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _08139036
	.align 2, 0
_08138F98: .4byte gPlayerParty
_08138F9C: .4byte gUnknown_02024A60
_08138FA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138FB8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138FBC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _08139036
	.align 2, 0
_08138FB8: .4byte gPlayerParty
_08138FBC: .4byte gUnknown_02024A60
_08138FC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138FD8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138FDC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _08139036
	.align 2, 0
_08138FD8: .4byte gPlayerParty
_08138FDC: .4byte gUnknown_02024A60
_08138FE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08138FF8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08138FFC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _08139036
	.align 2, 0
_08138FF8: .4byte gPlayerParty
_08138FFC: .4byte gUnknown_02024A60
_08139000:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08139018 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0813901C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _08139036
	.align 2, 0
_08139018: .4byte gPlayerParty
_0813901C: .4byte gUnknown_02024A60
_08139020:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _08139060 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08139064 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_08139036:
	ldr r2, _08139068 @ =gUnknown_02024A6A
	ldr r0, _08139064 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08139060 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139060: .4byte gPlayerParty
_08139064: .4byte gUnknown_02024A60
_08139068: .4byte gUnknown_02024A6A
	thumb_func_end sub_8138294

	thumb_func_start sub_8138C90
sub_8138C90: @ 813906C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138C90

	thumb_func_start sub_8138C9C
sub_8138C9C: @ 8139078
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138C9C

	thumb_func_start sub_8138CA8
sub_8138CA8: @ 8139084
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138CA8

	thumb_func_start sub_8138CB4
sub_8138CB4: @ 8139090
	push {r4-r6,lr}
	ldr r0, _081390BC @ =gUnknown_02023A60
	ldr r6, _081390C0 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _081390CC
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r0, _081390C4 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _081390C8 @ =sub_813789C
	str r0, [r1]
	b _08139102
	.align 2, 0
_081390BC: .4byte gUnknown_02023A60
_081390C0: .4byte gUnknown_02024A60
_081390C4: .4byte gUnknown_03004330
_081390C8: .4byte sub_813789C
_081390CC:
	ldr r5, _08139108 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0813910C @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _08139110 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl5_exec_completed
_08139102:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139108: .4byte gUnknown_02024BE0
_0813910C: .4byte gSprites
_08139110: .4byte gUnknown_03004340
	thumb_func_end sub_8138CB4

	thumb_func_start sub_8138D38
sub_8138D38: @ 8139114
	push {r4-r6,lr}
	ldr r4, _081391BC @ =gUnknown_02024A60
	ldrb r1, [r4]
	movs r0, 0x2
	bl sub_8031AF4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _081391C0 @ =gUnknown_02024E8C
	ldr r1, _081391C4 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x8]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _081391C8 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _081391CC @ =gSprites
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081391D0 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _081391D4 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _081391D8 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081391DC @ =sub_813741C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081391BC: .4byte gUnknown_02024A60
_081391C0: .4byte gUnknown_02024E8C
_081391C4: .4byte gTrainerBackPicCoords
_081391C8: .4byte gUnknown_02024BE0
_081391CC: .4byte gSprites
_081391D0: .4byte 0x0000fffe
_081391D4: .4byte sub_80313A0
_081391D8: .4byte gUnknown_03004330
_081391DC: .4byte sub_813741C
	thumb_func_end sub_8138D38

	thumb_func_start sub_8138E04
sub_8138E04: @ 81391E0
	push {r4-r6,lr}
	ldr r4, _08139288 @ =gUnknown_02024A60
	ldrb r1, [r4]
	movs r0, 0x2
	bl sub_8031AF4
	ldrb r0, [r4]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0813928C @ =gUnknown_02024E8C
	ldr r1, _08139290 @ =gTrainerBackPicCoords
	ldrb r1, [r1, 0x8]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _08139294 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r1, r6
	strb r0, [r1]
	ldr r5, _08139298 @ =gSprites
	ldrb r3, [r4]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0813929C @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, 0x1C
	adds r0, r5
	ldr r1, _081392A0 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _081392A4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081392A8 @ =sub_8137908
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139288: .4byte gUnknown_02024A60
_0813928C: .4byte gUnknown_02024E8C
_08139290: .4byte gTrainerBackPicCoords
_08139294: .4byte gUnknown_02024BE0
_08139298: .4byte gSprites
_0813929C: .4byte 0x0000ffa0
_081392A0: .4byte sub_80313A0
_081392A4: .4byte gUnknown_03004330
_081392A8: .4byte sub_8137908
	thumb_func_end sub_8138E04

	thumb_func_start sub_8138ED0
sub_8138ED0: @ 81392AC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138ED0

	thumb_func_start sub_8138EDC
sub_8138EDC: @ 81392B8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138EDC

	thumb_func_start sub_8138EE8
sub_8138EE8: @ 81392C4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138EE8

	thumb_func_start sub_8138EF4
sub_8138EF4: @ 81392D0
	push {r4,r5,lr}
	ldr r1, _0813930C @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _08139310 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _08139314 @ =gUnknown_02024A60
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _08139318 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0813931C @ =bx_wait_t5
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813930C: .4byte 0x02017840
_08139310: .4byte gUnknown_02024E6D
_08139314: .4byte gUnknown_02024A60
_08139318: .4byte gUnknown_03004330
_0813931C: .4byte bx_wait_t5
	thumb_func_end sub_8138EF4

	thumb_func_start sub_8138F44
sub_8138F44: @ 8139320
	push {r4,r5,lr}
	ldr r1, _08139364 @ =gUnknown_02023A60
	ldr r5, _08139368 @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0813936C @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _08139370 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x4
	bl move_anim_start_t4
	ldr r1, _08139374 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139378 @ =bx_wait_t5
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139364: .4byte gUnknown_02023A60
_08139368: .4byte gUnknown_02024A60
_0813936C: .4byte 0x02017840
_08139370: .4byte gUnknown_02024E6D
_08139374: .4byte gUnknown_03004330
_08139378: .4byte bx_wait_t5
	thumb_func_end sub_8138F44

	thumb_func_start sub_8138FA0
sub_8138FA0: @ 813937C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8138FA0

	thumb_func_start sub_8138FAC
sub_8138FAC: @ 8139388
	push {r4-r6,lr}
	ldr r0, _0813945C @ =gUnknown_02023A60
	mov r12, r0
	ldr r6, _08139460 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _08139464 @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _08139468 @ =gUnknown_0202F7BC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _0813946C @ =gUnknown_0202F7B8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _08139470 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08139474 @ =gUnknown_0202F7C0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _08139478 @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _0813947C @ =gUnknown_02024E70
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08139480
	bl dp01_tbl5_exec_completed
	b _0813949A
	.align 2, 0
_0813945C: .4byte gUnknown_02023A60
_08139460: .4byte gUnknown_02024A60
_08139464: .4byte gUnknown_0202F7C4
_08139468: .4byte gUnknown_0202F7BC
_0813946C: .4byte gUnknown_0202F7B8
_08139470: .4byte gUnknown_0202F7BE
_08139474: .4byte gUnknown_0202F7C0
_08139478: .4byte gUnknown_0202F7B4
_0813947C: .4byte gUnknown_02024E70
_08139480:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _081394A0 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _081394A4 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081394A8 @ =sub_81390D0
	str r1, [r0]
_0813949A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081394A0: .4byte 0x02017810
_081394A4: .4byte gUnknown_03004330
_081394A8: .4byte sub_81390D0
	thumb_func_end sub_8138FAC

	thumb_func_start sub_81390D0
sub_81390D0: @ 81394AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _081394E8 @ =gUnknown_02023A60
	ldr r5, _081394EC @ =gUnknown_02024A60
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r8, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r7, r2, 0x2
	adds r1, r7
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _081394F0 @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _0813952C
	cmp r2, 0x1
	bgt _081394F4
	cmp r2, 0
	beq _081394FE
	b _081395D8
	.align 2, 0
_081394E8: .4byte gUnknown_02023A60
_081394EC: .4byte gUnknown_02024A60
_081394F0: .4byte 0x02017810
_081394F4:
	cmp r2, 0x2
	beq _08139552
	cmp r2, 0x3
	beq _081395A0
	b _081395D8
_081394FE:
	lsls r0, r3, 2
	adds r1, r6, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0813951C
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0813951C:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _081395D8
_0813952C:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _081395D8
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl move_anim_start_t1
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _081395D8
_08139552:
	ldr r0, _08139598 @ =gUnknown_0202F7AC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0813959C @ =gUnknown_0202F7B1
	ldrb r0, [r0]
	cmp r0, 0
	bne _081395D8
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r1, r6, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08139586
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
_08139586:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x3
	strb r0, [r1, 0x4]
	b _081395D8
	.align 2, 0
_08139598: .4byte gUnknown_0202F7AC
_0813959C: .4byte gUnknown_0202F7B1
_081395A0:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081395D8
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r8
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r2, r7
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl5_exec_completed
_081395D8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81390D0

	thumb_func_start sub_8139208
sub_8139208: @ 81395E4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08139630 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08139634 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r5, _08139638 @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	ldr r1, _0813963C @ =gUnknown_02023A62
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x2
	bne _08139606
	bl sub_814A7FC
_08139606:
	ldrh r0, [r4]
	bl sub_8120AA8
	ldr r0, _08139640 @ =gUnknown_03004210
	ldr r1, _08139644 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08139648 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0813964C @ =sub_8137454
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139630: .4byte gUnknown_030042A4
_08139634: .4byte gUnknown_030042A0
_08139638: .4byte gUnknown_02024A60
_0813963C: .4byte gUnknown_02023A62
_08139640: .4byte gUnknown_03004210
_08139644: .4byte gUnknown_020238CC
_08139648: .4byte gUnknown_03004330
_0813964C: .4byte sub_8137454
	thumb_func_end sub_8139208

	thumb_func_start dp01t_11_5_message_for_player_only
dp01t_11_5_message_for_player_only: @ 8139650
	push {lr}
	ldr r0, _08139668 @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0813966C
	bl sub_8139208
	b _08139670
	.align 2, 0
_08139668: .4byte gUnknown_02024A60
_0813966C:
	bl dp01_tbl5_exec_completed
_08139670:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_5_message_for_player_only

	thumb_func_start sub_8139298
sub_8139298: @ 8139674
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _08139728 @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r1, _0813972C @ =gUnknown_030042A0
	movs r0, 0xA0
	strh r0, [r1]
	ldr r4, _08139730 @ =gUnknown_03004210
	movs r5, 0
	strb r2, [r4, 0x6]
	movs r0, 0x1B
	str r0, [sp]
	movs r0, 0x12
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0xF
	bl FillWindowRect_DefaultPalette
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0x24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	movs r3, 0x23
	bl FillWindowRect_DefaultPalette
	ldr r1, _08139734 @ =gUnknown_03004330
	ldr r0, _08139738 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0813973C @ =sub_81372BC
	str r1, [r0]
	ldr r1, _08139740 @ =gUnknown_08400CF3
	movs r2, 0xC8
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x12
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	ldr r1, _08139744 @ =0x0000ffff
	ldr r3, _08139748 @ =0x00002d9f
	str r5, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	movs r4, 0
_081396E8:
	lsls r0, r4, 24
	lsrs r0, 24
	bl nullsub_8
	adds r4, 0x1
	cmp r4, 0x3
	ble _081396E8
	movs r0, 0
	movs r1, 0
	bl sub_802E3E4
	ldr r0, _0813974C @ =gUnknown_08400CCC
	bl get_battle_strings_
	ldr r4, _08139730 @ =gUnknown_03004210
	ldr r1, _08139750 @ =gUnknown_020238CC
	movs r2, 0xDE
	lsls r2, 1
	movs r0, 0x23
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x2
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139728: .4byte gUnknown_030042A4
_0813972C: .4byte gUnknown_030042A0
_08139730: .4byte gUnknown_03004210
_08139734: .4byte gUnknown_03004330
_08139738: .4byte gUnknown_02024A60
_0813973C: .4byte sub_81372BC
_08139740: .4byte gUnknown_08400CF3
_08139744: .4byte 0x0000ffff
_08139748: .4byte 0x00002d9f
_0813974C: .4byte gUnknown_08400CCC
_08139750: .4byte gUnknown_020238CC
	thumb_func_end sub_8139298

	thumb_func_start sub_8139378
sub_8139378: @ 8139754
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139378

	thumb_func_start sub_8139384
sub_8139384: @ 8139760
	push {r4,r5,lr}
	ldr r5, _08139774 @ =0x02000000
	ldr r0, _08139778 @ =0x000160a9
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0813977C
	cmp r0, 0x1
	beq _0813978E
	b _081397BA
	.align 2, 0
_08139774: .4byte 0x02000000
_08139778: .4byte 0x000160a9
_0813977C:
	bl sub_80304A8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _081397C0 @ =0x000160ab
	adds r1, r5, r0
	movs r0, 0x50
	strb r0, [r1]
_0813978E:
	ldr r1, _081397C4 @ =0x02000000
	ldr r0, _081397C0 @ =0x000160ab
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _081397BA
	bl sub_814A7FC
	movs r0, 0x5
	bl PlaySE
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x1
	movs r1, 0xA
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl5_exec_completed
_081397BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081397C0: .4byte 0x000160ab
_081397C4: .4byte 0x02000000
	thumb_func_end sub_8139384

	thumb_func_start sub_81393EC
sub_81393EC: @ 81397C8
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _081397F8 @ =gUnknown_03004330
	ldr r2, _081397FC @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139800 @ =sub_81374C4
	str r1, [r0]
	ldr r1, _08139804 @ =gUnknown_02024E6C
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081397F8: .4byte gUnknown_03004330
_081397FC: .4byte gUnknown_02024A60
_08139800: .4byte sub_81374C4
_08139804: .4byte gUnknown_02024E6C
	thumb_func_end sub_81393EC

	thumb_func_start sub_813942C
sub_813942C: @ 8139808
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813942C

	thumb_func_start sub_8139438
sub_8139438: @ 8139814
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139438

	thumb_func_start sub_8139444
sub_8139444: @ 8139820
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _08139898 @ =gUnknown_02023A60
	ldr r0, _0813989C @ =gUnknown_02024A60
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _081398A0 @ =0x00007fff
	cmp r7, r0
	beq _081398B0
	ldr r6, _081398A4 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081398A8 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _081398AC @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _081398EA
	.align 2, 0
_08139898: .4byte gUnknown_02023A60
_0813989C: .4byte gUnknown_02024A60
_081398A0: .4byte 0x00007fff
_081398A4: .4byte gUnknown_02024A6A
_081398A8: .4byte gPlayerParty
_081398AC: .4byte gUnknown_03004340
_081398B0:
	ldr r1, _08139908 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813990C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _08139910 @ =gUnknown_03004340
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80440EC
_081398EA:
	ldr r1, _08139914 @ =gUnknown_03004330
	ldr r0, _08139918 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0813991C @ =sub_81377B0
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139908: .4byte gUnknown_02024A6A
_0813990C: .4byte gPlayerParty
_08139910: .4byte gUnknown_03004340
_08139914: .4byte gUnknown_03004330
_08139918: .4byte gUnknown_02024A60
_0813991C: .4byte sub_81377B0
	thumb_func_end sub_8139444

	thumb_func_start sub_8139544
sub_8139544: @ 8139920
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139544

	thumb_func_start sub_8139550
sub_8139550: @ 813992C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139550

	thumb_func_start sub_813955C
sub_813955C: @ 8139938
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813955C

	thumb_func_start sub_8139568
sub_8139568: @ 8139944
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139568

	thumb_func_start sub_8139574
sub_8139574: @ 8139950
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139574

	thumb_func_start sub_8139580
sub_8139580: @ 813995C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139580

	thumb_func_start sub_813958C
sub_813958C: @ 8139968
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_813958C

	thumb_func_start sub_8139598
sub_8139598: @ 8139974
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139598

	thumb_func_start sub_81395A4
sub_81395A4: @ 8139980
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395A4

	thumb_func_start sub_81395B0
sub_81395B0: @ 813998C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395B0

	thumb_func_start sub_81395BC
sub_81395BC: @ 8139998
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395BC

	thumb_func_start sub_81395C8
sub_81395C8: @ 81399A4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395C8

	thumb_func_start sub_81395D4
sub_81395D4: @ 81399B0
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395D4

	thumb_func_start sub_81395E0
sub_81395E0: @ 81399BC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395E0

	thumb_func_start sub_81395EC
sub_81395EC: @ 81399C8
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395EC

	thumb_func_start sub_81395F8
sub_81395F8: @ 81399D4
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81395F8

	thumb_func_start sub_8139604
sub_8139604: @ 81399E0
	push {r4,lr}
	ldr r3, _08139A08 @ =gSprites
	ldr r2, _08139A0C @ =gUnknown_02024BE0
	ldr r4, _08139A10 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08139A14
	bl dp01_tbl5_exec_completed
	b _08139A3E
	.align 2, 0
_08139A08: .4byte gSprites
_08139A0C: .4byte gUnknown_02024BE0
_08139A10: .4byte gUnknown_02024A60
_08139A14:
	ldr r1, _08139A44 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _08139A48 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139A4C @ =bx_blink_t5
	str r1, [r0]
_08139A3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139A44: .4byte gUnknown_02024E6D
_08139A48: .4byte gUnknown_03004330
_08139A4C: .4byte bx_blink_t5
	thumb_func_end sub_8139604

	thumb_func_start sub_8139674
sub_8139674: @ 8139A50
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139674

	thumb_func_start sub_8139680
sub_8139680: @ 8139A5C
	push {lr}
	ldr r2, _08139A84 @ =gUnknown_02023A60
	ldr r0, _08139A88 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139A84: .4byte gUnknown_02023A60
_08139A88: .4byte gUnknown_02024A60
	thumb_func_end sub_8139680

	thumb_func_start sub_81396B0
sub_81396B0: @ 8139A8C
	push {lr}
	ldr r2, _08139AB4 @ =gUnknown_02023A60
	ldr r0, _08139AB8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139AB4: .4byte gUnknown_02023A60
_08139AB8: .4byte gUnknown_02024A60
	thumb_func_end sub_81396B0

	thumb_func_start sub_81396E0
sub_81396E0: @ 8139ABC
	push {lr}
	ldr r1, _08139AEC @ =gUnknown_02024A6A
	ldr r0, _08139AF0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139AF4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl PlayCry1
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139AEC: .4byte gUnknown_02024A6A
_08139AF0: .4byte gUnknown_02024A60
_08139AF4: .4byte gPlayerParty
	thumb_func_end sub_81396E0

	thumb_func_start dp01t_2E_5_battle_intro
dp01t_2E_5_battle_intro: @ 8139AF8
	push {lr}
	ldr r1, _08139B20 @ =gUnknown_02023A60
	ldr r0, _08139B24 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08139B28 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08139B20: .4byte gUnknown_02023A60
_08139B24: .4byte gUnknown_02024A60
_08139B28: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_5_battle_intro

	thumb_func_start sub_8139750
sub_8139750: @ 8139B2C
	push {r4-r7,lr}
	ldr r6, _08139C5C @ =gUnknown_02024BE0
	ldr r7, _08139C60 @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08139C64 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139C68 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139C6C @ =sub_8078B34
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139C70 @ =sub_8030E38
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08139C74 @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _08139C78 @ =gTrainerBackPicPaletteTable
	ldr r0, [r0, 0x10]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _08139C7C @ =sub_8139A2C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08139C80 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _08139C84 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08139C40
	ldr r0, _08139C88 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08139C8C @ =sub_8044CA0
	str r1, [r0]
_08139C40:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08139C90 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139C94 @ =nullsub_91
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08139C5C: .4byte gUnknown_02024BE0
_08139C60: .4byte gUnknown_02024A60
_08139C64: .4byte gSprites
_08139C68: .4byte 0x0000ffd8
_08139C6C: .4byte sub_8078B34
_08139C70: .4byte sub_8030E38
_08139C74: .4byte 0x0000d6f8
_08139C78: .4byte gTrainerBackPicPaletteTable
_08139C7C: .4byte sub_8139A2C
_08139C80: .4byte gTasks
_08139C84: .4byte 0x02017810
_08139C88: .4byte gUnknown_02024E68
_08139C8C: .4byte sub_8044CA0
_08139C90: .4byte gUnknown_03004330
_08139C94: .4byte nullsub_91
	thumb_func_end sub_8139750

	thumb_func_start sub_81398BC
sub_81398BC: @ 8139C98
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, r6, 2
	ldr r1, _08139DDC @ =0x02017800
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	ldr r0, _08139DE0 @ =gUnknown_02024A6A
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _08139DE4 @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08139DE8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _08139DEC @ =sub_80312F0
	bl object_new_hidden_with_callback
	ldr r1, _08139DF0 @ =gUnknown_0300434C
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08139DF4 @ =gUnknown_02024E8C
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _08139DF8 @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _08139DFC @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08139E00 @ =gUnknown_02024E84
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08139E04 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139DDC: .4byte 0x02017800
_08139DE0: .4byte gUnknown_02024A6A
_08139DE4: .4byte gUnknown_02023A60
_08139DE8: .4byte gPlayerParty
_08139DEC: .4byte sub_80312F0
_08139DF0: .4byte gUnknown_0300434C
_08139DF4: .4byte gUnknown_02024E8C
_08139DF8: .4byte gUnknown_02024BE0
_08139DFC: .4byte gSprites
_08139E00: .4byte gUnknown_02024E84
_08139E04: .4byte SpriteCallbackDummy
	thumb_func_end sub_81398BC

	thumb_func_start sub_8139A2C
sub_8139A2C: @ 8139E08
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08139E28 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _08139E2C
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08139E62
	.align 2, 0
_08139E28: .4byte gTasks
_08139E2C:
	ldr r4, _08139E68 @ =gUnknown_02024A60
	ldrb r5, [r4]
	ldrh r0, [r1, 0x8]
	strb r0, [r4]
	ldr r0, _08139E6C @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08139E70 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_81398BC
	ldr r1, _08139E74 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08139E78 @ =sub_8137538
	str r1, [r0]
	strb r5, [r4]
	adds r0, r6, 0
	bl DestroyTask
_08139E62:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139E68: .4byte gUnknown_02024A60
_08139E6C: .4byte gUnknown_02023A60
_08139E70: .4byte gUnknown_02024A6A
_08139E74: .4byte gUnknown_03004330
_08139E78: .4byte sub_8137538
	thumb_func_end sub_8139A2C

	thumb_func_start sub_8139AA0
sub_8139AA0: @ 8139E7C
	push {r4,r5,lr}
	ldr r1, _08139EA4 @ =gUnknown_02023A60
	ldr r0, _08139EA8 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08139EAC
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08139EAC
	bl dp01_tbl5_exec_completed
	b _08139EE6
	.align 2, 0
_08139EA4: .4byte gUnknown_02023A60
_08139EA8: .4byte gUnknown_02024A60
_08139EAC:
	ldr r5, _08139EEC @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08139EF0 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r4, r0, 9
	ldr r3, _08139EF4 @ =gUnknown_02023A64
	adds r1, r4, r3
	subs r2, r3, 0x3
	adds r2, r4, r2
	ldrb r2, [r2]
	subs r3, 0x2
	adds r4, r3
	ldrb r3, [r4]
	bl sub_8044804
	ldr r2, _08139EF8 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	strb r0, [r1]
	bl dp01_tbl5_exec_completed
_08139EE6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08139EEC: .4byte gUnknown_02024A60
_08139EF0: .4byte 0x02017810
_08139EF4: .4byte gUnknown_02023A64
_08139EF8: .4byte gUnknown_02024E68
	thumb_func_end sub_8139AA0

	thumb_func_start sub_8139B20
sub_8139B20: @ 8139EFC
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B20

	thumb_func_start sub_8139B2C
sub_8139B2C: @ 8139F08
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B2C

	thumb_func_start sub_8139B38
sub_8139B38: @ 8139F14
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139B38

	thumb_func_start sub_8139B44
sub_8139B44: @ 8139F20
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r5, _08139F58 @ =gUnknown_02023A60
	ldr r6, _08139F5C @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _08139F60
	bl dp01_tbl5_exec_completed
	b _08139F6C
	.align 2, 0
_08139F58: .4byte gUnknown_02023A60
_08139F5C: .4byte gUnknown_02024A60
_08139F60:
	ldr r0, _08139F74 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139F78 @ =sub_8137940
	str r0, [r1]
_08139F6C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08139F74: .4byte gUnknown_03004330
_08139F78: .4byte sub_8137940
	thumb_func_end sub_8139B44

	thumb_func_start sub_8139BA0
sub_8139BA0: @ 8139F7C
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139BA0

	thumb_func_start sub_8139BAC
sub_8139BAC: @ 8139F88
	push {lr}
	bl dp01_tbl5_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8139BAC

	thumb_func_start sub_8139BB8
sub_8139BB8: @ 8139F94
	push {r4,lr}
	ldr r2, _08139FD8 @ =gUnknown_02024D26
	ldr r1, _08139FDC @ =gUnknown_02023A60
	ldr r4, _08139FE0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl5_exec_completed
	ldr r0, _08139FE4 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0x2
	bne _08139FD0
	ldr r0, _08139FE8 @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08139FEC @ =sub_813746C
	str r0, [r1]
_08139FD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08139FD8: .4byte gUnknown_02024D26
_08139FDC: .4byte gUnknown_02023A60
_08139FE0: .4byte gUnknown_02024A60
_08139FE4: .4byte gUnknown_020239F8
_08139FE8: .4byte gUnknown_03004330
_08139FEC: .4byte sub_813746C
	thumb_func_end sub_8139BB8

	thumb_func_start nullsub_80
nullsub_80: @ 8139FF0
	bx lr
	thumb_func_end nullsub_80

	.align 2, 0 @ Don't pad with nop.
