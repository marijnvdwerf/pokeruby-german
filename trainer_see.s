	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckTrainers
CheckTrainers: @ 8084410
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08084440
_08084416:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08084444
	ldrb r0, [r1, 0x7]
	cmp r0, 0x1
	beq _08084430
	cmp r0, 0x3
	bne _08084444
_08084430:
	adds r0, r4, 0
	bl CheckTrainer
	lsls r0, 24
	cmp r0, 0
	beq _08084444
	movs r0, 0x1
	b _08084450
	.align 2, 0
_08084440: .4byte gMapObjects
_08084444:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08084416
	movs r0, 0
_08084450:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CheckTrainers

	thumb_func_start CheckTrainer
CheckTrainer: @ 8084458
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r6, r0, 0
	bl GetTrainerFlagFromScriptPointer
	cmp r0, 0
	bne _08084488
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808448C
	adds r5, r0, r1
	adds r0, r5, 0
	bl TrainerCanApproachPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08084490
_08084488:
	movs r0, 0
	b _080844A6
	.align 2, 0
_0808448C: .4byte gMapObjects
_08084490:
	adds r0, r7, 0
	adds r1, r6, 0
	bl TrainerWantsBattle
	subs r1, r4, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_80842C8
	movs r0, 0x1
_080844A6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckTrainer

	thumb_func_start TrainerCanApproachPlayer
TrainerCanApproachPlayer: @ 80844AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldrb r0, [r7, 0x7]
	mov r8, r4
	cmp r0, 0x1
	bne _0808450C
	ldr r1, _08084504
	ldrb r0, [r7, 0x18]
	lsls r0, 28
	lsrs r0, 26
	subs r0, 0x4
	adds r0, r1
	ldrb r1, [r7, 0x1D]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r5, 0
	ldrsh r3, [r4, r5]
	ldr r4, [r0]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r7, 0x18]
	lsls r2, 28
	lsrs r2, 28
	adds r0, r7, 0
	adds r1, r6, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	lsrs r0, 24
	b _0808454C
	.align 2, 0
_08084504: .4byte gIsTrainerInRange
_08084508:
	adds r0, r6, 0
	b _0808454C
_0808450C:
	movs r5, 0
_0808450E:
	ldr r0, _08084558
	lsls r4, r5, 2
	adds r4, r0
	ldrb r1, [r7, 0x1D]
	mov r0, sp
	movs r6, 0
	ldrsh r2, [r0, r6]
	mov r0, r8
	movs r6, 0
	ldrsh r3, [r0, r6]
	ldr r4, [r4]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	cmp r0, 0
	bne _08084508
	adds r5, r4, 0
	cmp r5, 0x3
	bls _0808450E
	movs r0, 0
_0808454C:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084558: .4byte gIsTrainerInRange
	thumb_func_end TrainerCanApproachPlayer

	thumb_func_start IsTrainerInRangeSouth
IsTrainerInRangeSouth: @ 808455C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08084596
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	ble _08084596
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r2, r1
	bgt _08084596
	subs r0, r5, r3
	lsls r0, 24
	lsrs r0, 24
	b _08084598
_08084596:
	movs r0, 0
_08084598:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeSouth

	thumb_func_start IsTrainerInRangeNorth
IsTrainerInRangeNorth: @ 80845A0
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _080845DA
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	bge _080845DA
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r2, r1
	blt _080845DA
	subs r0, r3, r5
	lsls r0, 24
	lsrs r0, 24
	b _080845DC
_080845DA:
	movs r0, 0
_080845DC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeNorth

	thumb_func_start IsTrainerInRangeWest
IsTrainerInRangeWest: @ 80845E4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _0808461E
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0808461E
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r3, r1
	blt _0808461E
	subs r0, r2, r5
	lsls r0, 24
	lsrs r0, 24
	b _08084620
_0808461E:
	movs r0, 0
_08084620:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeWest

	thumb_func_start IsTrainerInRangeEast
IsTrainerInRangeEast: @ 8084628
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _08084662
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _08084662
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r3, r1
	bgt _08084662
	subs r0, r5, r2
	lsls r0, 24
	lsrs r0, 24
	b _08084664
_08084662:
	movs r0, 0
_08084664:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeEast

	thumb_func_start CheckPathBetweenTrainerAndPlayer
CheckPathBetweenTrainerAndPlayer: @ 808466C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r7, r2, 24
	cmp r1, 0
	beq _08084708
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r1, sp
	adds r1, 0x2
	strh r0, [r1]
	movs r4, 0
	mov r8, r1
	mov r5, r9
	subs r5, 0x1
	cmp r4, r5
	bgt _080846DA
_080846A0:
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl sub_8060024
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080846C6
	movs r0, 0x2
	negs r0, r0
	ands r1, r0
	cmp r1, 0
	bne _08084708
_080846C6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	mov r1, sp
	mov r2, r8
	bl MoveCoords
	cmp r4, r5
	ble _080846A0
_080846DA:
	ldrb r4, [r6, 0x19]
	lsls r5, r4, 28
	lsrs r5, 28
	lsrs r4, 4
	movs r0, 0
	strb r0, [r6, 0x19]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r4, 4
	orrs r5, r4
	strb r5, [r6, 0x19]
	cmp r1, 0x4
	beq _0808470C
_08084708:
	movs r0, 0
	b _0808470E
_0808470C:
	mov r0, r9
_0808470E:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPathBetweenTrainerAndPlayer

	thumb_func_start sub_80842C8
sub_80842C8: @ 808471C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r0, _08084748
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808474C
	adds r1, r0
	lsrs r0, r5, 16
	strh r0, [r1, 0xA]
	strh r5, [r1, 0xC]
	strh r4, [r1, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084748: .4byte RunTrainerSeeFuncList
_0808474C: .4byte gTasks
	thumb_func_end sub_80842C8

	thumb_func_start sub_80842FC
sub_80842FC: @ 8084750
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _08084788
	adds r0, r5, 0
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _0808478C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	adds r0, r4, 0
	bl _call_via_r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084788: .4byte RunTrainerSeeFuncList
_0808478C: .4byte gTasks
	thumb_func_end sub_80842FC

	thumb_func_start RunTrainerSeeFuncList
RunTrainerSeeFuncList: @ 8084790
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080847BC
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r5, r0, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	orrs r5, r0
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _080847C0
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	b _080847DC
	.align 2, 0
_080847BC: .4byte gTasks
_080847C0:
	ldr r7, _080847E4
_080847C2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r7
	ldr r3, [r0]
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080847C2
_080847DC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080847E4: .4byte gTrainerSeeFuncList
	thumb_func_end RunTrainerSeeFuncList

	thumb_func_start sub_8084394
sub_8084394: @ 80847E8
	movs r0, 0
	bx lr
	thumb_func_end sub_8084394

	thumb_func_start sub_8084398
sub_8084398: @ 80847EC
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _0808482C
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808482C: .4byte gUnknown_0202FF84
	thumb_func_end sub_8084398

	thumb_func_start sub_80843DC
sub_80843DC: @ 8084830
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	movs r0, 0
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _08084846
	movs r0, 0
	b _08084868
_08084846:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0x6]
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0808485C
	movs r0, 0x6
	strh r0, [r4, 0x8]
_0808485C:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x3F
	bne _08084866
	movs r0, 0x8
	strh r0, [r4, 0x8]
_08084866:
	movs r0, 0x1
_08084868:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80843DC

	thumb_func_start sub_808441C
sub_808441C: @ 8084870
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808488E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080848C2
_0808488E:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080848B4
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	b _080848C2
_080848B4:
	adds r0, r4, 0
	movs r1, 0x3E
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080848C2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_808441C

	thumb_func_start sub_8084478
sub_8084478: @ 80848CC
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r5, r2, 0
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080848EA
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084978
_080848EA:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl npc_set_running_behaviour_etc
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C774
	adds r0, r5, 0
	bl sub_805C754
	ldr r0, _08084980
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084984
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084942
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084978
_08084942:
	bl sub_80597E8
	ldr r0, _08084980
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084984
	adds r4, r0
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08084978:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08084980: .4byte gPlayerAvatar
_08084984: .4byte gMapObjects
	thumb_func_end sub_8084478

	thumb_func_start sub_8084534
sub_8084534: @ 8084988
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080849C4
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080849C8
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080849B4
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080849BA
_080849B4:
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
_080849BA:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080849C4: .4byte gPlayerAvatar
_080849C8: .4byte gMapObjects
	thumb_func_end sub_8084534

	thumb_func_start sub_8084578
sub_8084578: @ 80849CC
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080849EA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080849F8
_080849EA:
	adds r0, r4, 0
	movs r1, 0x59
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080849F8:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084578

	thumb_func_start sub_80845AC
sub_80845AC: @ 8084A00
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084A14
	movs r0, 0x3
	strh r0, [r4, 0x8]
_08084A14:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80845AC

	thumb_func_start sub_80845C8
sub_80845C8: @ 8084A1C
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084A3A
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084A48
_08084A3A:
	adds r0, r4, 0
	movs r1, 0x3E
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08084A48:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80845C8

	thumb_func_start sub_80845FC
sub_80845FC: @ 8084A50
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08084A96
	ldr r2, _08084AA0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldr r3, _08084AA4
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08084A96:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084AA0: .4byte gUnknown_0202FF84
_08084AA4: .4byte gSprites
	thumb_func_end sub_80845FC

	thumb_func_start sub_8084654
sub_8084654: @ 8084AA8
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r2, _08084B18
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x2B
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _08084B10
	ldrb r1, [r4, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08084B10:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084B18: .4byte gSprites
	thumb_func_end sub_8084654

	thumb_func_start sub_80846C8
sub_80846C8: @ 8084B1C
	push {r4,lr}
	adds r4, r1, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084B30
	movs r0, 0x3
	strh r0, [r4, 0x8]
_08084B30:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80846C8

	thumb_func_start sub_80846E4
sub_80846E4: @ 8084B38
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08084BCC
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0xA
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08084B6A
	ldr r0, [sp]
	bl FieldObjectClearAnim
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_08084B6A:
	ldr r1, _08084BD0
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [sp]
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _08084BD4
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084BD4
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C774
	adds r0, r5, 0
	bl DestroyTask
	b _08084BDE
	.align 2, 0
_08084BCC: .4byte gTasks
_08084BD0: .4byte gTrainerSeeFuncList2
_08084BD4:
	ldr r2, [sp]
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_08084BDE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80846E4

	thumb_func_start sub_8084794
sub_8084794: @ 8084BE8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08084C14
	movs r1, 0
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08084C18
	adds r0, r1
	adds r0, 0x2
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084C14: .4byte sub_80846E4
_08084C18: .4byte 0x03004b38
	thumb_func_end sub_8084794

	thumb_func_start sub_80847C8
sub_80847C8: @ 8084C1C
	push {lr}
	ldr r0, _08084C28
	bl sub_80842FC
	pop {r0}
	bx r0
	.align 2, 0
_08084C28: .4byte sub_80847D8
	thumb_func_end sub_80847C8

	thumb_func_start sub_80847D8
sub_80847D8: @ 8084C2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80847D8

	.align 2, 0 @ Don't pad with nop.
