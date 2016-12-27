	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start walkrun_is_standing_still
walkrun_is_standing_still: @ 8065000
	push {lr}
	ldr r0, _08065010 @ =gPlayerAvatar
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	beq _08065014
	movs r0, 0x1
	b _08065016
	.align 2, 0
_08065010: .4byte gPlayerAvatar
_08065014:
	movs r0, 0
_08065016:
	pop {r1}
	bx r1
	thumb_func_end walkrun_is_standing_still

	thumb_func_start sub_8064CDC
sub_8064CDC: @ 806501C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08065036
	bl sub_80594C0
	adds r0, r4, 0
	bl DestroyTask
_08065036:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8064CDC

	thumb_func_start sub_8064CFC
sub_8064CFC: @ 806503C
	push {lr}
	ldr r0, _08065054 @ =sub_8064CDC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08065058
	bl sub_80597F4
	movs r0, 0x1
	b _0806505A
	.align 2, 0
_08065054: .4byte sub_8064CDC
_08065058:
	movs r0, 0
_0806505A:
	pop {r1}
	bx r1
	thumb_func_end sub_8064CFC

	thumb_func_start sub_8064D20
sub_8064D20: @ 8065060
	push {lr}
	bl player_bitmagic
	ldr r0, _08065074 @ =sub_8064CDC
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08065074: .4byte sub_8064CDC
	thumb_func_end sub_8064D20

	thumb_func_start sub_8064D38
sub_8064D38: @ 8065078
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080650E8 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080650A2
	bl walkrun_is_standing_still
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080650A2
	bl sub_80594C0
	strh r4, [r5, 0x8]
_080650A2:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080650CA
	ldr r2, _080650EC @ =gMapObjects
	ldr r0, _080650F0 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _080650CA
	adds r0, r1, 0
	bl sub_80643A4
	movs r0, 0x1
	strh r0, [r5, 0xA]
_080650CA:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080650E0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080650E0
	adds r0, r6, 0
	bl DestroyTask
_080650E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080650E8: .4byte gTasks
_080650EC: .4byte gMapObjects
_080650F0: .4byte gSelectedMapObject
	thumb_func_end sub_8064D38

	thumb_func_start sub_8064DB4
sub_8064DB4: @ 80650F4
	push {lr}
	ldr r0, _0806510C @ =sub_8064D38
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08065110
	bl sub_80597F4
	movs r0, 0x1
	b _08065112
	.align 2, 0
_0806510C: .4byte sub_8064D38
_08065110:
	movs r0, 0
_08065112:
	pop {r1}
	bx r1
	thumb_func_end sub_8064DB4

	thumb_func_start sub_8064DD8
sub_8064DD8: @ 8065118
	push {r4,r5,lr}
	ldr r4, _0806515C @ =gSelectedMapObject
	ldrb r0, [r4]
	bl sub_8064470
	ldr r0, _08065160 @ =sub_8064D38
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _08065164 @ =gMapObjects
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _08065156
	adds r0, r1, 0
	bl sub_80643A4
	ldr r0, _08065168 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xA]
_08065156:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806515C: .4byte gSelectedMapObject
_08065160: .4byte sub_8064D38
_08065164: .4byte gMapObjects
_08065168: .4byte gTasks
	thumb_func_end sub_8064DD8

	thumb_func_start sub_8064E2C
sub_8064E2C: @ 806516C
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
	ldr r1, _08065198 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	pop {r0}
	bx r0
	.align 2, 0
_08065198: .4byte gMapObjects
	thumb_func_end sub_8064E2C

	thumb_func_start unref_sub_8064E5C
unref_sub_8064E5C: @ 806519C
	push {r4,lr}
	ldr r4, _080651E4 @ =gMapObjects
	ldr r0, _080651E8 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _080651BA
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_080651BA:
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
_080651E4: .4byte gMapObjects
_080651E8: .4byte gSelectedMapObject
	thumb_func_end unref_sub_8064E5C

	thumb_func_start sub_8064EAC
sub_8064EAC: @ 80651EC
	push {lr}
	ldr r0, _08065208 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806520C @ =gMapObjects
	adds r0, r1
	ldr r1, _08065210 @ =gScriptFacing
	ldrb r1, [r1]
	bl FieldObjectFaceOppositeDirection
	pop {r0}
	bx r0
	.align 2, 0
_08065208: .4byte gSelectedMapObject
_0806520C: .4byte gMapObjects
_08065210: .4byte gScriptFacing
	thumb_func_end sub_8064EAC

	thumb_func_start sub_8064ED4
sub_8064ED4: @ 8065214
	push {lr}
	ldr r0, _0806522C @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08065230 @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimActive
	pop {r0}
	bx r0
	.align 2, 0
_0806522C: .4byte gSelectedMapObject
_08065230: .4byte gMapObjects
	thumb_func_end sub_8064ED4

	.align 2, 0 @ Don't pad with nop.
