	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start walkrun_is_standing_still
walkrun_is_standing_still: @ 8064CC0
	push {lr}
	ldr r0, _08064CD0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	beq _08064CD4
	movs r0, 0x1
	b _08064CD6
	.align 2, 0
_08064CD0: .4byte gPlayerAvatar
_08064CD4:
	movs r0, 0
_08064CD6:
	pop {r1}
	bx r1
	thumb_func_end walkrun_is_standing_still

	thumb_func_start sub_8064CDC
sub_8064CDC: @ 8064CDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08064CF6
	bl sub_80594C0
	adds r0, r4, 0
	bl DestroyTask
_08064CF6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8064CDC

	thumb_func_start sub_8064CFC
sub_8064CFC: @ 8064CFC
	push {lr}
	ldr r0, _08064D14 @ =sub_8064CDC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08064D18
	bl sub_80597F4
	movs r0, 0x1
	b _08064D1A
	.align 2, 0
_08064D14: .4byte sub_8064CDC
_08064D18:
	movs r0, 0
_08064D1A:
	pop {r1}
	bx r1
	thumb_func_end sub_8064CFC

	thumb_func_start sub_8064D20
sub_8064D20: @ 8064D20
	push {lr}
	bl player_bitmagic
	ldr r0, _08064D34 @ =sub_8064CDC
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08064D34: .4byte sub_8064CDC
	thumb_func_end sub_8064D20

	thumb_func_start sub_8064D38
sub_8064D38: @ 8064D38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08064DA8 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08064D62
	bl walkrun_is_standing_still
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08064D62
	bl sub_80594C0
	strh r4, [r5, 0x8]
_08064D62:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08064D8A
	ldr r2, _08064DAC @ =gMapObjects
	ldr r0, _08064DB0 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _08064D8A
	adds r0, r1, 0
	bl sub_80643A4
	movs r0, 0x1
	strh r0, [r5, 0xA]
_08064D8A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08064DA0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08064DA0
	adds r0, r6, 0
	bl DestroyTask
_08064DA0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064DA8: .4byte gTasks
_08064DAC: .4byte gMapObjects
_08064DB0: .4byte gSelectedMapObject
	thumb_func_end sub_8064D38

	thumb_func_start sub_8064DB4
sub_8064DB4: @ 8064DB4
	push {lr}
	ldr r0, _08064DCC @ =sub_8064D38
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08064DD0
	bl sub_80597F4
	movs r0, 0x1
	b _08064DD2
	.align 2, 0
_08064DCC: .4byte sub_8064D38
_08064DD0:
	movs r0, 0
_08064DD2:
	pop {r1}
	bx r1
	thumb_func_end sub_8064DB4

	thumb_func_start sub_8064DD8
sub_8064DD8: @ 8064DD8
	push {r4,r5,lr}
	ldr r4, _08064E1C @ =gSelectedMapObject
	ldrb r0, [r4]
	bl sub_8064470
	ldr r0, _08064E20 @ =sub_8064D38
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _08064E24 @ =gMapObjects
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _08064E16
	adds r0, r1, 0
	bl sub_80643A4
	ldr r0, _08064E28 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xA]
_08064E16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064E1C: .4byte gSelectedMapObject
_08064E20: .4byte sub_8064D38
_08064E24: .4byte gMapObjects
_08064E28: .4byte gTasks
	thumb_func_end sub_8064DD8

	thumb_func_start sub_8064E2C
sub_8064E2C: @ 8064E2C
	push {lr}
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08064E58 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	pop {r0}
	bx r0
	.align 2, 0
_08064E58: .4byte gMapObjects
	thumb_func_end sub_8064E2C

	thumb_func_start unref_sub_8064E5C
unref_sub_8064E5C: @ 8064E5C
	push {r4,lr}
	ldr r4, _08064EA4 @ =gMapObjects
	ldr r0, _08064EA8 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064E7A
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_08064E7A:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064EA4: .4byte gMapObjects
_08064EA8: .4byte gSelectedMapObject
	thumb_func_end unref_sub_8064E5C

	thumb_func_start sub_8064EAC
sub_8064EAC: @ 8064EAC
	push {lr}
	ldr r0, _08064EC8 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08064ECC @ =gMapObjects
	adds r0, r1
	ldr r1, _08064ED0 @ =gScriptFacing
	ldrb r1, [r1]
	bl FieldObjectFaceOppositeDirection
	pop {r0}
	bx r0
	.align 2, 0
_08064EC8: .4byte gSelectedMapObject
_08064ECC: .4byte gMapObjects
_08064ED0: .4byte gScriptFacing
	thumb_func_end sub_8064EAC

	thumb_func_start sub_8064ED4
sub_8064ED4: @ 8064ED4
	push {lr}
	ldr r0, _08064EEC @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08064EF0 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimActive
	pop {r0}
	bx r0
	.align 2, 0
_08064EEC: .4byte gSelectedMapObject
_08064EF0: .4byte gMapObjects
	thumb_func_end sub_8064ED4

	.align 2, 0 @ Don't pad with nop.
