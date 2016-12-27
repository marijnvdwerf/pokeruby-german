	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_806936C
sub_806936C: @ 80696AC
	push {lr}
	movs r0, 0x1
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806936C

	thumb_func_start sub_8069378
sub_8069378: @ 80696B8
	push {lr}
	movs r0, 0x2
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069378

	thumb_func_start sub_8069384
sub_8069384: @ 80696C4
	push {lr}
	movs r0, 0x3
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069384

	thumb_func_start sub_8069390
sub_8069390: @ 80696D0
	push {lr}
	movs r0, 0x4
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069390

	thumb_func_start sub_806939C
sub_806939C: @ 80696DC
	push {lr}
	movs r0, 0x5
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806939C

	thumb_func_start sub_80693A8
sub_80693A8: @ 80696E8
	push {lr}
	movs r0, 0x6
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693A8

	thumb_func_start sub_80693B4
sub_80693B4: @ 80696F4
	push {lr}
	movs r0, 0x9
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693B4

	thumb_func_start sub_80693C0
sub_80693C0: @ 8069700
	push {lr}
	movs r0, 0x7
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693C0

	thumb_func_start sub_80693CC
sub_80693CC: @ 806970C
	push {lr}
	movs r0, 0x8
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693CC

	thumb_func_start sub_80693D8
sub_80693D8: @ 8069718
	push {lr}
	movs r0, 0xB
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693D8

	thumb_func_start sub_80693E4
sub_80693E4: @ 8069724
	push {lr}
	movs r0, 0xC
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693E4

	thumb_func_start sub_80693F0
sub_80693F0: @ 8069730
	push {lr}
	movs r0, 0x14
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693F0

	thumb_func_start sub_80693FC
sub_80693FC: @ 806973C
	push {lr}
	movs r0, 0x15
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693FC

	thumb_func_start sub_8069408
sub_8069408: @ 8069748
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _08069768 @ =gUnknown_083762FC
_08069752:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806976C
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _08069776
	.align 2, 0
_08069768: .4byte gUnknown_083762FC
_0806976C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _08069752
_08069776:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8069408

	thumb_func_start task_per_step_callback_manager
task_per_step_callback_manager: @ 806977C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080697A0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, _080697A4 @ =gUnknown_08376364
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080697A0: .4byte gTasks
_080697A4: .4byte gUnknown_08376364
	thumb_func_end task_per_step_callback_manager

	thumb_func_start sub_8069468
sub_8069468: @ 80697A8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080697BA
	cmp r0, 0x1
	beq _080697D8
	b _080697EC
_080697BA:
	ldr r0, _080697D4 @ =gMain
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _080697EC
	bl DoTimeBasedEvents
	ldrh r0, [r4]
	adds r0, 0x1
	b _080697EA
	.align 2, 0
_080697D4: .4byte gMain
_080697D8:
	ldr r0, _080697F4 @ =gMain
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _080697EC
	ldrh r0, [r4]
	subs r0, 0x1
_080697EA:
	strh r0, [r4]
_080697EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080697F4: .4byte gMain
	thumb_func_end sub_8069468

	thumb_func_start sub_80694B8
sub_80694B8: @ 80697F8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069828 @ =0x03004b38
	adds r4, r1, r0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _08069820
	adds r0, r4, 0
	bl sub_8069468
	adds r0, r4, 0x2
	adds r1, r4, 0x4
	bl sub_80540D0
_08069820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069828: .4byte 0x03004b38
	thumb_func_end sub_80694B8

	thumb_func_start overworld_ensure_per_step_coros_running
overworld_ensure_per_step_coros_running: @ 806982C
	push {r4,r5,lr}
	ldr r5, _08069888 @ =task_per_step_callback_manager
	adds r0, r5, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08069856
	adds r0, r5, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806988C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08069856:
	ldr r4, _08069890 @ =sub_806A1E8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806986C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0806986C:
	ldr r4, _08069894 @ =sub_80694B8
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08069882
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08069882:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069888: .4byte task_per_step_callback_manager
_0806988C: .4byte gTasks
_08069890: .4byte sub_806A1E8
_08069894: .4byte sub_80694B8
	thumb_func_end overworld_ensure_per_step_coros_running

	thumb_func_start activate_per_step_callback
activate_per_step_callback: @ 8069898
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080698D0 @ =task_per_step_callback_manager
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080698DA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080698D4 @ =0x03004b38
	adds r1, r0, r1
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1E
_080698BC:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _080698BC
	cmp r4, 0x7
	bls _080698D8
	movs r0, 0
	strh r0, [r1]
	b _080698DA
	.align 2, 0
_080698D0: .4byte task_per_step_callback_manager
_080698D4: .4byte 0x03004b38
_080698D8:
	strh r4, [r1]
_080698DA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end activate_per_step_callback

	thumb_func_start wild_encounter_reset_coro_args
wild_encounter_reset_coro_args: @ 80698E0
	push {lr}
	ldr r0, _08069910 @ =task_per_step_callback_manager
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08069914 @ =sub_80694B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806990A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08069918 @ =0x03004b38
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	strh r1, [r0, 0x4]
_0806990A:
	pop {r0}
	bx r0
	.align 2, 0
_08069910: .4byte task_per_step_callback_manager
_08069914: .4byte sub_80694B8
_08069918: .4byte 0x03004b38
	thumb_func_end wild_encounter_reset_coro_args

	thumb_func_start nullsub_51
nullsub_51: @ 806991C
	bx lr
	thumb_func_end nullsub_51

	thumb_func_start sub_80695E0
sub_80695E0: @ 8069920
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069938
	adds r0, r5, 0
	b _08069970
_08069938:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _0806994A
	adds r0, r5, 0
	adds r0, 0x8
	b _08069970
_0806994A:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806995C
	adds r0, r5, 0
	adds r0, 0x10
	b _08069970
_0806995C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	bne _0806996C
	movs r0, 0
	b _08069970
_0806996C:
	adds r0, r5, 0
	adds r0, 0x18
_08069970:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80695E0

	thumb_func_start sub_8069638
sub_8069638: @ 8069978
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r3
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r7, r2, 16
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80695E0
	adds r4, r0, 0
	adds r5, r4, 0
	cmp r4, 0
	beq _080699F6
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	ldrh r2, [r4, 0x2]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _080699CE
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_080699CE:
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	ldrh r2, [r5, 0x6]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _080699F6
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_080699F6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069638

	thumb_func_start sub_80696C0
sub_80696C0: @ 8069A00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069A20 @ =gUnknown_08376384
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A20: .4byte gUnknown_08376384
	thumb_func_end sub_80696C0

	thumb_func_start sub_80696E4
sub_80696E4: @ 8069A24
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069A44 @ =gUnknown_083763A4
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A44: .4byte gUnknown_083763A4
	thumb_func_end sub_80696E4

	thumb_func_start sub_8069708
sub_8069708: @ 8069A48
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069A68 @ =gUnknown_083763C4
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A68: .4byte gUnknown_083763C4
	thumb_func_end sub_8069708

	thumb_func_start sub_806972C
sub_806972C: @ 8069A6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r10, r8
	lsls r1, 16
	lsrs r7, r1, 16
	mov r9, r7
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r5, r3, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069AB0
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r5
	ble _08069AF6
_08069AAC:
	movs r0, 0
	b _08069AF8
_08069AB0:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069AC8
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r5
	bge _08069AF6
	b _08069AAC
_08069AC8:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _08069AE0
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	ble _08069AF6
	b _08069AAC
_08069AE0:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _08069AF6
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	blt _08069AAC
_08069AF6:
	movs r0, 0x1
_08069AF8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806972C

	thumb_func_start sub_80697C8
sub_80697C8: @ 8069B08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	mov r10, r8
	lsls r3, 16
	lsrs r7, r3, 16
	mov r9, r7
	lsls r0, 16
	asrs r6, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069B4C
	lsls r0, r7, 16
	asrs r0, 16
	cmp r5, r0
	bge _08069B92
_08069B48:
	movs r0, 0
	b _08069B94
_08069B4C:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069B64
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r5, r0
	ble _08069B92
	b _08069B48
_08069B64:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _08069B7C
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bge _08069B92
	b _08069B48
_08069B7C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _08069B92
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bgt _08069B48
_08069B92:
	movs r0, 0x1
_08069B94:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80697C8

	thumb_func_start sub_8069864
sub_8069864: @ 8069BA4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069BD8 @ =0x03004b38
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r6, r5, 0
	cmp r0, 0x1
	beq _08069BFE
	cmp r0, 0x1
	bgt _08069BDC
	cmp r0, 0
	beq _08069BE2
	b _08069D0E
	.align 2, 0
_08069BD8: .4byte 0x03004b38
_08069BDC:
	cmp r0, 0x2
	beq _08069CCC
	b _08069D0E
_08069BE2:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r2, 0x1
	bl sub_80696E4
	b _08069D0A
_08069BFE:
	mov r0, sp
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08069C18
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r7, 0x6
	ldrsh r0, [r4, r7]
	cmp r1, r0
	beq _08069D0E
_08069C18:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_806972C
	cmp r0, 0
	beq _08069C60
	movs r7, 0x4
	ldrsh r0, [r4, r7]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	movs r5, 0x6
	ldrsh r1, [r4, r5]
	movs r2, 0
	bl sub_8069708
	ldrh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x6]
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	b _08069C6A
_08069C60:
	movs r7, 0x1
	negs r7, r7
	adds r0, r7, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
_08069C6A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r5, r6, 0
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r7, 0x6
	ldrsh r3, [r4, r7]
	bl sub_80697C8
	cmp r0, 0
	beq _08069C9E
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_08069C9E:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r6]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _08069D0E
	movs r0, 0x46
	bl PlaySE
	b _08069D0E
_08069CCC:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08069D0E
	mov r0, sp
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696E4
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _08069D0A
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	cmp r0, r1
	beq _08069D0A
	movs r7, 0x8
	ldrsh r0, [r4, r7]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_8069708
_08069D0A:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_08069D0E:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069864

	thumb_func_start sub_80699D8
sub_80699D8: @ 8069D18
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069D72
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069D54 @ =0x0000024e
	cmp r1, r0
	beq _08069D58
	adds r0, 0x8
	cmp r1, r0
	beq _08069D68
	b _08069D72
	.align 2, 0
_08069D54: .4byte 0x0000024e
_08069D58:
	ldr r2, _08069D64 @ =0x0000024f
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069D72
	.align 2, 0
_08069D64: .4byte 0x0000024f
_08069D68:
	ldr r2, _08069D78 @ =0x00000257
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069D72:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D78: .4byte 0x00000257
	thumb_func_end sub_80699D8

	thumb_func_start sub_8069A3C
sub_8069A3C: @ 8069D7C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069DD6
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069DB8 @ =0x0000024f
	cmp r1, r0
	beq _08069DBC
	adds r0, 0x8
	cmp r1, r0
	beq _08069DCC
	b _08069DD6
	.align 2, 0
_08069DB8: .4byte 0x0000024f
_08069DBC:
	ldr r2, _08069DC8 @ =0x0000024e
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069DD6
	.align 2, 0
_08069DC8: .4byte 0x0000024e
_08069DCC:
	ldr r2, _08069DDC @ =0x00000256
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069DD6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069DDC: .4byte 0x00000256
	thumb_func_end sub_8069A3C

	thumb_func_start sub_8069AA0
sub_8069AA0: @ 8069DE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069E1C @ =0x03004b38
	adds r6, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	ldrsh r5, [r6, r0]
	mov r9, r4
	cmp r5, 0x1
	beq _08069E74
	cmp r5, 0x1
	bgt _08069E20
	cmp r5, 0
	beq _08069E28
	b _08069FE6
	.align 2, 0
_08069E1C: .4byte 0x03004b38
_08069E20:
	cmp r5, 0x2
	bne _08069E26
	b _08069F54
_08069E26:
	b _08069FE6
_08069E28:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r1, r9
	ldrh r0, [r1]
	strh r0, [r6, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r1, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	bne _08069E52
	b _08069FE2
_08069E52:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
	b _08069FE2
_08069E74:
	ldrh r0, [r6, 0x6]
	mov r8, r0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	ldrh r2, [r6, 0x4]
	mov r10, r2
	movs r3, 0x4
	ldrsh r7, [r6, r3]
	cmp r0, r7
	bne _08069E9C
	mov r0, r9
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r1, r0
	bne _08069E9C
	b _08069FE6
_08069E9C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	lsls r4, r0, 16
	asrs r1, r4, 16
	adds r0, r7, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r7, r0, 24
	bl PlayerGetZCoord
	movs r1, 0
	ands r5, r0
	lsls r0, r5, 24
	adds r5, r4, 0
	cmp r0, 0
	bne _08069EE4
	movs r1, 0x1
_08069EE4:
	cmp r1, 0
	beq _08069EF8
	ldr r1, [sp, 0x4]
	cmp r1, 0x1
	beq _08069EF2
	cmp r7, 0x1
	bne _08069EF8
_08069EF2:
	movs r0, 0x47
	bl PlaySE
_08069EF8:
	cmp r7, 0
	beq _08069F34
	mov r2, r10
	lsls r4, r2, 16
	asrs r4, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8069A3C
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
_08069F34:
	mov r0, r10
	strh r0, [r6, 0x8]
	mov r1, r8
	strh r1, [r6, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r2, r9
	ldrh r0, [r2]
	strh r0, [r6, 0x6]
	cmp r7, 0
	beq _08069FE6
	movs r0, 0x10
	strh r0, [r6, 0xC]
	movs r0, 0x2
	strh r0, [r6, 0x2]
_08069F54:
	ldrh r0, [r6, 0xC]
	subs r0, 0x1
	strh r0, [r6, 0xC]
	ldrh r3, [r6, 0x8]
	mov r10, r3
	ldrh r0, [r6, 0xA]
	mov r8, r0
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	movs r1, 0x7
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bhi _08069FDA
	lsls r0, 2
	ldr r1, _08069F80 @ =_08069F84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069F80: .4byte _08069F84
	.align 2, 0
_08069F84:
	.4byte _08069FA4
	.4byte _08069FDA
	.4byte _08069FDA
	.4byte _08069FDA
	.4byte _08069FB6
	.4byte _08069FDA
	.4byte _08069FDA
	.4byte _08069FDA
_08069FA4:
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r8
	lsls r1, r3, 16
	asrs r1, 16
	bl CurrentMapDrawMetatileAt
	b _08069FDA
_08069FB6:
	mov r0, r10
	lsls r5, r0, 16
	asrs r5, 16
	mov r1, r8
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80699D8
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069A3C
_08069FDA:
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _08069FE6
_08069FE2:
	movs r0, 0x1
	strh r0, [r6, 0x2]
_08069FE6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069AA0

	thumb_func_start sub_8069CB8
sub_8069CB8: @ 8069FF8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r0, 16
	ldr r2, _0806A028 @ =0xfffd0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xA
	bhi _0806A034
	lsls r0, r1, 16
	asrs r1, r0, 16
	ldr r2, _0806A02C @ =0xfffa0000
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xD
	bhi _0806A034
	ldr r0, _0806A030 @ =gUnknown_083763E4
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0806A034
	movs r0, 0x1
	b _0806A036
	.align 2, 0
_0806A028: .4byte 0xfffd0000
_0806A02C: .4byte 0xfffa0000
_0806A030: .4byte gUnknown_083763E4
_0806A034:
	movs r0, 0
_0806A036:
	pop {r1}
	bx r1
	thumb_func_end sub_8069CB8

	thumb_func_start sub_8069CFC
sub_8069CFC: @ 806A03C
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _0806A06A
	ldr r1, _0806A070 @ =gUnknown_083763E4
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl GetVarPointer
	subs r2, r5, 0x3
	movs r1, 0x1
	lsls r1, r2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0806A06A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A070: .4byte gUnknown_083763E4
	thumb_func_end sub_8069CFC

	thumb_func_start sub_8069D34
sub_8069D34: @ 806A074
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _0806A0A6
	ldr r1, _0806A0AC @ =gUnknown_083763E4
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl VarGet
	lsls r0, 16
	subs r2, r5, 0x3
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r2
	ands r1, r0
	cmp r1, 0
	bne _0806A0B0
_0806A0A6:
	movs r0, 0
	b _0806A0B2
	.align 2, 0
_0806A0AC: .4byte gUnknown_083763E4
_0806A0B0:
	movs r0, 0x1
_0806A0B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D34

	thumb_func_start sub_8069D78
sub_8069D78: @ 806A0B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0806A10C @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0]
	mov r9, r1
	ldr r7, [r0, 0x4]
	movs r5, 0
	cmp r5, r9
	bge _0806A100
_0806A0D0:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _0806A0FA
	lsls r6, r5, 16
_0806A0DC:
	lsls r1, r4, 16
	asrs r1, 16
	asrs r0, r6, 16
	bl sub_8069D34
	cmp r0, 0x1
	bne _0806A0F4
	adds r1, r4, 0x7
	adds r0, r5, 0x7
	ldr r2, _0806A110 @ =0x0000020e
	bl MapGridSetMetatileIdAt
_0806A0F4:
	adds r4, 0x1
	cmp r4, r7
	blt _0806A0DC
_0806A0FA:
	mov r5, r8
	cmp r5, r9
	blt _0806A0D0
_0806A100:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A10C: .4byte gMapHeader
_0806A110: .4byte 0x0000020e
	thumb_func_end sub_8069D78

	thumb_func_start sub_8069DD4
sub_8069DD4: @ 806A114
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A138 @ =0x03004b38
	adds r5, r1, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0806A160
	cmp r0, 0x1
	bgt _0806A13C
	cmp r0, 0
	beq _0806A148
	b _0806A296
	.align 2, 0
_0806A138: .4byte 0x03004b38
_0806A13C:
	cmp r0, 0x2
	beq _0806A1F6
	cmp r0, 0x3
	bne _0806A146
	b _0806A250
_0806A146:
	b _0806A296
_0806A148:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	b _0806A292
_0806A160:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A18A
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A18A
	b _0806A296
_0806A18A:
	strh r2, [r5, 0x4]
	ldrh r0, [r7]
	strh r0, [r5, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0806A1CC @ =0x00004022
	bl GetVarPointer
	adds r6, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8057540
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806A1D0
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x2
	b _0806A1E8
	.align 2, 0
_0806A1CC: .4byte 0x00004022
_0806A1D0:
	adds r0, r4, 0
	bl sub_8057554
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806A296
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x3
_0806A1E8:
	strh r0, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	ldrh r0, [r7]
	strh r0, [r5, 0xA]
	b _0806A296
_0806A1F6:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _0806A25A
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x2A
	bl PlaySE
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A24C @ =0x0000020e
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8069CFC
	b _0806A292
	.align 2, 0
_0806A24C: .4byte 0x0000020e
_0806A250:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806A260
_0806A25A:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _0806A296
_0806A260:
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x29
	bl PlaySE
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A2A0 @ =0x00000206
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
_0806A292:
	movs r0, 0x1
	strh r0, [r5, 0x2]
_0806A296:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2A0: .4byte 0x00000206
	thumb_func_end sub_8069DD4

	thumb_func_start sub_8069F64
sub_8069F64: @ 806A2A4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A328 @ =0x03004b38
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A2DE
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A36A
_0806A2DE:
	strh r2, [r5, 0x2]
	ldrh r0, [r4]
	strh r0, [r5, 0x4]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsAsh
	lsls r0, 24
	cmp r0, 0
	beq _0806A36A
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _0806A32C @ =0x0000020a
	cmp r0, r1
	bne _0806A334
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A330 @ =0x00000212
	movs r3, 0x4
	bl ash
	b _0806A346
	.align 2, 0
_0806A328: .4byte 0x03004b38
_0806A32C: .4byte 0x0000020a
_0806A330: .4byte 0x00000212
_0806A334:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A374 @ =0x00000206
	movs r3, 0x4
	bl ash
_0806A346:
	movs r0, 0x87
	lsls r0, 1
	movs r1, 0x1
	bl CheckBagHasItem
	lsls r0, 24
	cmp r0, 0
	beq _0806A36A
	ldr r0, _0806A378 @ =0x00004048
	bl GetVarPointer
	adds r2, r0, 0
	ldrh r1, [r2]
	ldr r0, _0806A37C @ =0x0000270e
	cmp r1, r0
	bhi _0806A36A
	adds r0, r1, 0x1
	strh r0, [r2]
_0806A36A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A374: .4byte 0x00000206
_0806A378: .4byte 0x00004048
_0806A37C: .4byte 0x0000270e
	thumb_func_end sub_8069F64

	thumb_func_start sub_806A040
sub_806A040: @ 806A380
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0806A3B4 @ =0x0000022f
	ldr r2, _0806A3B8 @ =0x00000237
	cmp r0, r1
	bne _0806A39C
	subs r2, 0x31
_0806A39C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3B4: .4byte 0x0000022f
_0806A3B8: .4byte 0x00000237
	thumb_func_end sub_806A040

	thumb_func_start sub_806A07C
sub_806A07C: @ 806A3BC
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A4A4 @ =0x03004b38
	adds r5, r1, r0
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
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r1, [r5, 0x8]
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	adds r7, r4, 0
	cmp r0, 0
	beq _0806A40E
	subs r0, r1, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _0806A40E
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A40E:
	ldrh r1, [r5, 0xE]
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806A42E
	subs r0, r1, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0806A42E
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A42E:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	beq _0806A446
	ldr r0, _0806A4A8 @ =0x00004022
	movs r1, 0
	bl VarSet
_0806A446:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A462
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A4C2
_0806A462:
	strh r2, [r5, 0x4]
	adds r4, r7, 0
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	adds r0, r6, 0
	bl sub_805782C
	lsls r0, 24
	cmp r0, 0
	beq _0806A4C2
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806A48A
	ldr r0, _0806A4A8 @ =0x00004022
	movs r1, 0
	bl VarSet
_0806A48A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806A4AC
	movs r0, 0x3
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0xA]
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	b _0806A4C2
	.align 2, 0
_0806A4A4: .4byte 0x03004b38
_0806A4A8: .4byte 0x00004022
_0806A4AC:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0806A4C2
	movs r0, 0x3
	strh r0, [r5, 0xE]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x10]
	ldrh r0, [r7]
	strh r0, [r5, 0x12]
_0806A4C2:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A07C

	thumb_func_start sub_806A18C
sub_806A18C: @ 806A4CC
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _0806A4E8
	movs r2, 0xE8
	b _0806A4FC
_0806A4E8:
	ldr r1, _0806A524 @ =gUnknown_08376418
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0806A4F4
	adds r0, 0x7
_0806A4F4:
	asrs r0, 3
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
_0806A4FC:
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE8
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A524: .4byte gUnknown_08376418
	thumb_func_end sub_806A18C

	thumb_func_start sub_806A1E8
sub_806A1E8: @ 806A528
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A570 @ =0x03004b38
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	ldr r0, _0806A574 @ =gSaveBlock1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	orrs r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	mov r8, r5
	cmp r1, 0
	beq _0806A578
	cmp r1, 0x1
	beq _0806A5A4
	b _0806A5F8
	.align 2, 0
_0806A570: .4byte 0x03004b38
_0806A574: .4byte gSaveBlock1
_0806A578:
	strh r7, [r4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	movs r0, 0x1
	strh r0, [r4, 0x2]
	strh r1, [r4, 0x8]
	strh r1, [r4, 0xE]
	strh r1, [r4, 0x14]
	strh r1, [r4, 0x1A]
	b _0806A5F8
_0806A592:
	movs r0, 0x20
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1, 0x4]
	b _0806A5F8
_0806A5A4:
	mov r0, sp
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0806A5C0
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r3, 0
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A5F8
_0806A5C0:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsMuddySlope
	lsls r0, 24
	cmp r0, 0
	beq _0806A5F8
	movs r6, 0x4
	adds r1, r4, 0
	adds r1, 0x8
_0806A5E8:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0806A592
	adds r1, 0x6
	adds r6, 0x3
	cmp r6, 0xD
	ble _0806A5E8
_0806A5F8:
	ldr r2, _0806A614 @ =gUnknown_0202E844
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806A618
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r7, r0
	beq _0806A618
	strh r7, [r4]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r2, 0x8]
	b _0806A61C
	.align 2, 0
_0806A614: .4byte gUnknown_0202E844
_0806A618:
	movs r0, 0
	movs r1, 0
_0806A61C:
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	lsls r0, r1, 16
	asrs r7, r0, 16
	adds r5, r4, 0
	adds r5, 0x8
	adds r4, r5, 0
	movs r6, 0x9
_0806A62E:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0806A652
	ldrh r0, [r4, 0x2]
	mov r3, r8
	subs r0, r3
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	subs r0, r7
	strh r0, [r4, 0x4]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	adds r0, r5, 0
	bl sub_806A18C
_0806A652:
	adds r4, 0x6
	adds r5, 0x6
	subs r6, 0x3
	cmp r6, 0
	bge _0806A62E
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A1E8

	thumb_func_start sub_806A328
sub_806A328: @ 806A668
	push {lr}
	ldr r0, _0806A690 @ =0x00000835
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r2, _0806A694 @ =gSaveBlock2
	adds r2, 0xA0
	ldr r3, _0806A698 @ =gLocalTime
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806A69C @ =0x00004040
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806A690: .4byte 0x00000835
_0806A694: .4byte gSaveBlock2
_0806A698: .4byte gLocalTime
_0806A69C: .4byte 0x00004040
	thumb_func_end sub_806A328

	thumb_func_start DoTimeBasedEvents
DoTimeBasedEvents: @ 806A6A0
	push {r4,lr}
	ldr r0, _0806A6C8 @ =0x00000835
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806A6C0
	bl RtcCalcLocalTime
	ldr r4, _0806A6CC @ =gLocalTime
	adds r0, r4, 0
	bl sub_806A390
	adds r0, r4, 0
	bl sub_806A3F4
_0806A6C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A6C8: .4byte 0x00000835
_0806A6CC: .4byte gLocalTime
	thumb_func_end DoTimeBasedEvents

	thumb_func_start sub_806A390
sub_806A390: @ 806A6D0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _0806A730 @ =0x00004040
	bl GetVarPointer
	adds r6, r0, 0
	ldrh r0, [r6]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0806A72A
	cmp r0, r1
	bgt _0806A72A
	ldrh r4, [r5]
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	bl sub_80690B4
	adds r0, r4, 0
	bl sub_80FA220
	adds r0, r4, 0
	bl sub_80BE8C4
	adds r0, r4, 0
	bl sub_8080834
	adds r0, r4, 0
	bl UpdatePartyPokerusTime
	adds r0, r4, 0
	bl sub_810D2F4
	adds r0, r4, 0
	bl UpdateBirchState
	adds r0, r4, 0
	bl sub_810F618
	adds r0, r4, 0
	bl sub_8145AA4
	ldrh r0, [r5]
	strh r0, [r6]
_0806A72A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A730: .4byte 0x00004040
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3F4
sub_806A3F4: @ 806A734
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	ldr r6, _0806A788 @ =0x02024f44
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	movs r2, 0x2
	ldrsb r2, [r4, r2]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, 0
	beq _0806A77E
	cmp r0, 0
	blt _0806A77E
	bl BerryTreeTimeUpdate
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
_0806A77E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A788: .4byte 0x02024f44
	thumb_func_end sub_806A3F4

	thumb_func_start sub_806A44C
sub_806A44C: @ 806A78C
	push {lr}
	bl sub_806A328
	ldr r0, _0806A79C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806A79C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_806A44C

	thumb_func_start sub_806A460
sub_806A460: @ 806A7A0
	push {lr}
	ldr r0, _0806A7B4 @ =Cb2_StartWallClock
	bl SetMainCallback2
	ldr r1, _0806A7B8 @ =gMain
	ldr r0, _0806A7BC @ =sub_806A44C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0806A7B4: .4byte Cb2_StartWallClock
_0806A7B8: .4byte gMain
_0806A7BC: .4byte sub_806A44C
	thumb_func_end sub_806A460

	.align 2, 0 @ Don't pad with nop.
