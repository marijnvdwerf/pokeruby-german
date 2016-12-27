	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetTruckCameraBobbingY
GetTruckCameraBobbingY: @ 80C7478
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x78
	bl __modsi3
	cmp r0, 0
	bne _080C748C
	movs r0, 0x1
	negs r0, r0
	b _080C749E
_080C748C:
	adds r0, r4, 0
	movs r1, 0xA
	bl __modsi3
	cmp r0, 0x4
	ble _080C749C
	movs r0, 0
	b _080C749E
_080C749C:
	movs r0, 0x1
_080C749E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetTruckCameraBobbingY

	thumb_func_start GetTruckBoxMovement
GetTruckBoxMovement: @ 80C74A4
	push {lr}
	adds r0, 0x78
	movs r1, 0xB4
	bl __modsi3
	cmp r0, 0
	beq _080C74B6
	movs r0, 0
	b _080C74BA
_080C74B6:
	movs r0, 0x1
	negs r0, r0
_080C74BA:
	pop {r1}
	bx r1
	thumb_func_end GetTruckBoxMovement

	thumb_func_start Task_Truck1
Task_Truck1: @ 80C74C0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C7560
	adds r5, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	adds r0, 0x1E
	bl GetTruckBoxMovement
	ldr r4, _080C7564
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 18
	movs r3, 0xC0
	lsls r3, 10
	orrs r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl GetTruckBoxMovement
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	lsls r0, 17
	ldr r3, _080C7568
	adds r0, r3
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	movs r1, 0
	ldrsh r0, [r5, r1]
	bl GetTruckBoxMovement
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	movs r3, 0x3
	negs r3, r3
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	ldr r1, _080C756C
	cmp r0, r1
	bne _080C7542
	strh r4, [r5]
_080C7542:
	movs r3, 0
	ldrsh r0, [r5, r3]
	bl GetTruckCameraBobbingY
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl SetCameraPanning
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7560: .4byte 0x03004b38
_080C7564: .4byte gSaveBlock1
_080C7568: .4byte 0xfffd0000
_080C756C: .4byte 0x75300000
	thumb_func_end Task_Truck1

	thumb_func_start Task_Truck2
Task_Truck2: @ 80C7570
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r3, r0, 3
	ldr r4, _080C75B0
	adds r7, r3, r4
	ldrh r1, [r7]
	adds r1, 0x1
	strh r1, [r7]
	ldrh r0, [r7, 0x4]
	adds r0, 0x1
	strh r0, [r7, 0x4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	ble _080C75A0
	movs r0, 0
	strh r0, [r7]
	ldrh r0, [r7, 0x2]
	adds r0, 0x1
	strh r0, [r7, 0x2]
_080C75A0:
	ldrh r0, [r7, 0x2]
	cmp r0, 0x13
	bne _080C75B4
	adds r0, r2, 0
	bl DestroyTask
	b _080C7666
	.align 2, 0
_080C75B0: .4byte 0x03004b38
_080C75B4:
	ldr r2, _080C7670
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _080C75D0
	adds r0, r4, 0
	subs r0, 0x8
	adds r0, r3, r0
	ldr r1, _080C7674
	str r1, [r0]
_080C75D0:
	movs r4, 0x2
	ldrsh r0, [r7, r4]
	adds r0, r2
	movs r5, 0
	ldrsb r5, [r0, r5]
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckCameraBobbingY
	adds r1, r0, 0
	lsls r5, 16
	asrs r5, 16
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl SetCameraPanning
	movs r4, 0x4
	ldrsh r0, [r7, r4]
	adds r0, 0x1E
	bl GetTruckBoxMovement
	ldr r6, _080C7678
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r3, 0x3
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	movs r4, 0xC0
	lsls r4, 10
	orrs r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckBoxMovement
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	negs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 17
	ldr r4, _080C767C
	adds r0, r4
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x2
	bl sub_805BD90
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	bl GetTruckBoxMovement
	ldrb r1, [r6, 0x5]
	ldrb r2, [r6, 0x4]
	movs r4, 0x3
	negs r4, r4
	adds r3, r4, 0
	subs r3, r5
	lsls r3, 16
	asrs r3, 16
	lsls r0, 18
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	bl sub_805BD90
_080C7666:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7670: .4byte gTruckCamera_HorizontalTable
_080C7674: .4byte Task_Truck3
_080C7678: .4byte gSaveBlock1
_080C767C: .4byte 0xfffd0000
	thumb_func_end Task_Truck2

	thumb_func_start Task_Truck3
Task_Truck3: @ 80C7680
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080C76C0
	adds r2, r0, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080C76B0
	movs r0, 0
	strh r0, [r2]
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	strh r0, [r2, 0x2]
_080C76B0:
	ldrh r0, [r2, 0x2]
	cmp r0, 0x13
	bne _080C76C4
	adds r0, r3, 0
	bl DestroyTask
	b _080C7712
	.align 2, 0
_080C76C0: .4byte 0x03004b38
_080C76C4:
	ldr r1, _080C7720
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	adds r0, r1
	movs r1, 0
	mov r8, r1
	movs r6, 0
	ldrsb r6, [r0, r6]
	adds r0, r6, 0
	bl SetCameraPanning
	ldr r5, _080C7724
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	movs r3, 0x3
	subs r3, r6
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	bl sub_805BD90
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	negs r3, r6
	mov r4, r8
	subs r4, 0x3
	str r4, [sp]
	movs r0, 0x2
	bl sub_805BD90
	ldrb r1, [r5, 0x5]
	ldrb r2, [r5, 0x4]
	subs r4, r6
	mov r3, r8
	str r3, [sp]
	movs r0, 0x3
	adds r3, r4, 0
	bl sub_805BD90
_080C7712:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7720: .4byte gTruckCamera_HorizontalTable
_080C7724: .4byte gSaveBlock1
	thumb_func_end Task_Truck3

	thumb_func_start Task_HandleTruckSequence
Task_HandleTruckSequence: @ 80C7728
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C774C
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080C7742
	b _080C7894
_080C7742:
	lsls r0, 2
	ldr r1, _080C7750
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C774C: .4byte 0x03004b38
_080C7750: .4byte _080C7754
	.align 2, 0
_080C7754:
	.4byte _080C776C
	.4byte _080C77A4
	.4byte _080C77C0
	.4byte _080C780C
	.4byte _080C7830
	.4byte _080C784E
_080C776C:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	beq _080C777C
	b _080C7894
_080C777C:
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r4, 0x2]
	ldr r0, _080C77A0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x4]
	movs r0, 0x1
	strh r0, [r4]
	movs r0, 0x31
	bl PlaySE
	b _080C7894
	.align 2, 0
_080C77A0: .4byte Task_Truck1
_080C77A4:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x96
	bne _080C7894
	bl pal_fill_black
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r4]
	b _080C7894
_080C77C0:
	ldrh r0, [r4, 0x2]
	adds r3, r0, 0x1
	strh r3, [r4, 0x2]
	ldr r0, _080C7804
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080C7894
	lsls r1, r3, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _080C7894
	strh r2, [r4, 0x2]
	ldrb r0, [r4, 0x4]
	bl DestroyTask
	ldr r0, _080C7808
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x6]
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x32
	bl PlaySE
	b _080C7894
	.align 2, 0
_080C7804: .4byte gPaletteFade
_080C7808: .4byte Task_Truck2
_080C780C:
	ldr r2, _080C782C
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	cmp r5, 0
	bne _080C7894
	bl InstallCameraPanAheadCallback
	strh r5, [r4, 0x2]
	movs r0, 0x4
	strh r0, [r4]
	b _080C7894
	.align 2, 0
_080C782C: .4byte gTasks
_080C7830:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	bne _080C7894
	movs r0, 0x33
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2]
	movs r0, 0x5
	strh r0, [r4]
	b _080C7894
_080C784E:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bne _080C7894
	movs r2, 0x82
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x84
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	movs r2, 0x86
	lsls r2, 2
	movs r0, 0xB
	movs r1, 0xA
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x34
	bl PlaySE
	adds r0, r5, 0
	bl DestroyTask
	bl ScriptContext2_Disable
_080C7894:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_HandleTruckSequence

	thumb_func_start ExecuteTruckSequence
ExecuteTruckSequence: @ 80C789C
	push {lr}
	sub sp, 0x4
	ldr r2, _080C78E4
	movs r0, 0xB
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _080C78E8
	movs r0, 0xB
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _080C78EC
	movs r0, 0xB
	movs r1, 0xA
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	bl ScriptContext2_Enable
	movs r0, 0
	str r0, [sp]
	ldr r1, _080C78F0
	ldr r2, _080C78F4
	mov r0, sp
	bl CpuFastSet
	ldr r0, _080C78F8
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080C78E4: .4byte 0x0000020d
_080C78E8: .4byte 0x00000215
_080C78EC: .4byte 0x0000021d
_080C78F0: .4byte gPlttBufferFaded
_080C78F4: .4byte 0x01000100
_080C78F8: .4byte Task_HandleTruckSequence
	thumb_func_end ExecuteTruckSequence

	thumb_func_start EndTruckSequence
EndTruckSequence: @ 80C78FC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080C7948
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080C7940
	ldr r4, _080C794C
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r0, 0x3
	str r0, [sp]
	movs r0, 0x1
	movs r3, 0x3
	bl sub_805BD90
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r5, 0x3
	negs r5, r5
	str r5, [sp]
	movs r0, 0x2
	movs r3, 0
	bl sub_805BD90
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	str r6, [sp]
	movs r0, 0x3
	adds r3, r5, 0
	bl sub_805BD90
_080C7940:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7948: .4byte Task_HandleTruckSequence
_080C794C: .4byte gSaveBlock1
	thumb_func_end EndTruckSequence

	.align 2, 0 @ Don't pad with nop.
