	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A7E7C
sub_80A7E7C: @ 80A7FCC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A7FEC @ =gUnknown_03004B00
	ldrb r0, [r4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080A7FF0
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A802C
	.align 2, 0
_080A7FEC: .4byte gUnknown_03004B00
_080A7FF0:
	ldr r1, _080A8034 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x26]
	ldr r1, _080A8038 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x8]
	ldrh r1, [r4, 0x6]
	strh r1, [r0, 0xA]
	ldrh r1, [r4, 0x8]
	strh r1, [r0, 0xC]
	ldrh r1, [r4, 0x8]
	strh r1, [r0, 0xE]
	ldrh r1, [r4, 0x2]
	strh r1, [r0, 0x10]
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x12]
	ldr r1, _080A803C @ =sub_80A7EF0
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080A802C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8034: .4byte gSprites
_080A8038: .4byte gTasks
_080A803C: .4byte sub_80A7EF0
	thumb_func_end sub_80A7E7C

	thumb_func_start sub_80A7EF0
sub_80A7EF0: @ 80A8040
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080A807C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xE]
	movs r2, 0xE
	ldrsh r5, [r3, r2]
	adds r7, r1, 0
	cmp r5, 0
	bne _080A80E6
	ldr r2, _080A8080 @ =gSprites
	movs r6, 0x8
	ldrsh r1, [r3, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r6, 0x24
	ldrsh r0, [r1, r6]
	adds r6, r2, 0
	cmp r0, 0
	bne _080A8084
	ldrh r0, [r3, 0x10]
	strh r0, [r1, 0x24]
	b _080A8086
	.align 2, 0
_080A807C: .4byte gTasks
_080A8080: .4byte gSprites
_080A8084:
	strh r5, [r1, 0x24]
_080A8086:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r7
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r6
	movs r5, 0x26
	ldrsh r0, [r1, r5]
	cmp r0, 0
	bne _080A80A6
	ldrh r0, [r3, 0x12]
	b _080A80A8
_080A80A6:
	movs r0, 0
_080A80A8:
	strh r0, [r1, 0x26]
	adds r0, r2, r4
	lsls r0, 3
	adds r2, r0, r7
	ldrh r0, [r2, 0xC]
	strh r0, [r2, 0xE]
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080A80EA
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r3, [r0, 0x24]
	movs r5, 0x8
	ldrsh r1, [r2, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r3, [r0, 0x26]
	adds r0, r4, 0
	bl move_anim_task_del
	b _080A80EA
_080A80E6:
	subs r0, 0x1
	strh r0, [r3, 0xE]
_080A80EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7EF0

	thumb_func_start sub_80A7FA0
sub_80A7FA0: @ 80A80F0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _080A8118 @ =gUnknown_03004B00
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x3
	bgt _080A811C
	lsls r0, 24
	lsrs r0, 24
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _080A8172
	b _080A8176
	.align 2, 0
_080A8118: .4byte gUnknown_03004B00
_080A811C:
	cmp r1, 0x8
	beq _080A8168
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	beq _080A813C
	cmp r0, 0x5
	bgt _080A8132
	cmp r0, 0x4
	beq _080A8138
	b _080A8144
_080A8132:
	cmp r0, 0x6
	beq _080A8140
	b _080A8144
_080A8138:
	movs r0, 0
	b _080A8146
_080A813C:
	movs r0, 0x2
	b _080A8146
_080A8140:
	movs r0, 0x1
	b _080A8146
_080A8144:
	movs r0, 0x3
_080A8146:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080A815C
	movs r6, 0x1
_080A815C:
	ldr r0, _080A8164 @ =gUnknown_02024BE0
	adds r0, r4, r0
	b _080A8170
	.align 2, 0
_080A8164: .4byte gUnknown_02024BE0
_080A8168:
	ldr r1, _080A8180 @ =gUnknown_02024BE0
	ldr r0, _080A8184 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
_080A8170:
	ldrb r3, [r0]
_080A8172:
	cmp r6, 0
	beq _080A8188
_080A8176:
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A81C6
	.align 2, 0
_080A8180: .4byte gUnknown_02024BE0
_080A8184: .4byte gUnknown_0202F7C8
_080A8188:
	ldr r1, _080A81CC @ =gSprites
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldr r2, _080A81D0 @ =gUnknown_03004B00
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x26]
	ldr r1, _080A81D4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x8]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0xE]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x10]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x12]
	ldr r1, _080A81D8 @ =sub_80A808C
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080A81C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A81CC: .4byte gSprites
_080A81D0: .4byte gUnknown_03004B00
_080A81D4: .4byte gTasks
_080A81D8: .4byte sub_80A808C
	thumb_func_end sub_80A7FA0

	thumb_func_start sub_80A808C
sub_80A808C: @ 80A81DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A8220 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _080A8294
	ldr r2, _080A8224 @ =gSprites
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrh r5, [r3, 0x10]
	movs r7, 0x10
	ldrsh r0, [r3, r7]
	adds r7, r2, 0
	cmp r1, r0
	bne _080A8228
	negs r0, r5
	strh r0, [r4, 0x24]
	b _080A822A
	.align 2, 0
_080A8220: .4byte gTasks
_080A8224: .4byte gSprites
_080A8228:
	strh r5, [r4, 0x24]
_080A822A:
	lsls r3, r6, 2
	adds r1, r3, r6
	lsls r1, 3
	add r1, r12
	movs r0, 0x8
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r7
	movs r0, 0x26
	ldrsh r2, [r4, r0]
	mov r8, r2
	ldrh r5, [r1, 0x12]
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r8, r0
	bne _080A8254
	negs r0, r5
	strh r0, [r4, 0x26]
	b _080A8256
_080A8254:
	strh r5, [r4, 0x26]
_080A8256:
	adds r0, r3, r6
	lsls r0, 3
	mov r4, r12
	adds r3, r0, r4
	ldrh r0, [r3, 0xC]
	strh r0, [r3, 0xE]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _080A8298
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x24]
	movs r4, 0x8
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
	b _080A8298
_080A8294:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_080A8298:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A808C

	thumb_func_start sub_80A8154
sub_80A8154: @ 80A82A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A82C4 @ =gUnknown_03004B00
	ldrb r0, [r4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _080A82C8
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A8316
	.align 2, 0
_080A82C4: .4byte gUnknown_03004B00
_080A82C8:
	ldr r0, _080A831C @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x2]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	movs r2, 0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x4]
	ldrh r6, [r1, 0x26]
	adds r0, r6
	strh r0, [r1, 0x26]
	ldr r0, _080A8320 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	strh r3, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r1, 0xC]
	strh r2, [r1, 0xE]
	ldrh r0, [r4, 0x8]
	strh r0, [r1, 0x10]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	lsls r0, 1
	strh r0, [r1, 0x12]
	movs r6, 0x4
	ldrsh r0, [r4, r6]
	lsls r0, 1
	strh r0, [r1, 0x14]
	ldr r2, _080A8324 @ =sub_80A81D8
	str r2, [r1]
	adds r0, r5, 0
	bl _call_via_r2
_080A8316:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A831C: .4byte gSprites
_080A8320: .4byte gTasks
_080A8324: .4byte sub_80A81D8
	thumb_func_end sub_80A8154

	thumb_func_start sub_80A81D8
sub_80A81D8: @ 80A8328
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A8380 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	adds r6, r1, 0
	cmp r0, 0
	beq _080A8346
	b _080A8458
_080A8346:
	ldrh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080A8388
	ldr r2, _080A8384 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r3, [r0, 0x24]
	adds r1, r3
	strh r1, [r0, 0x24]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x14]
	ldrh r3, [r0, 0x26]
	adds r1, r3
	strh r1, [r0, 0x26]
	adds r3, r2, 0
	b _080A83B2
	.align 2, 0
_080A8380: .4byte gTasks
_080A8384: .4byte gSprites
_080A8388:
	ldr r3, _080A8414 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0x12]
	subs r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	ldrh r2, [r4, 0x14]
	subs r1, r2
	strh r1, [r0, 0x26]
_080A83B2:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r0, [r4, 0x10]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0xC
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080A845C
	movs r0, 0x1
	ands r2, r0
	cmp r2, 0
	beq _080A8418
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	ldrh r6, [r1, 0x24]
	adds r0, r6
	strh r0, [r1, 0x24]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _080A8450
	.align 2, 0
_080A8414: .4byte gSprites
_080A8418:
	movs r6, 0x8
	ldrsh r0, [r4, r6]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r2, 0x26]
	subs r0, r1
	strh r0, [r2, 0x26]
_080A8450:
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A845C
_080A8458:
	subs r0, r2, 0x1
	strh r0, [r4, 0xE]
_080A845C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A81D8

	thumb_func_start sub_80A8314
sub_80A8314: @ 80A8464
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080A84B4 @ =gUnknown_03004B00
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A84B8 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r5, 0x2]
	strh r2, [r1, 0x24]
	ldr r2, _080A84BC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r1, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r1, 0x10]
	ldr r2, _080A84C0 @ =sub_80A8374
	str r2, [r1]
	adds r0, r4, 0
	bl _call_via_r2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A84B4: .4byte gUnknown_03004B00
_080A84B8: .4byte gSprites
_080A84BC: .4byte gTasks
_080A84C0: .4byte sub_80A8374
	thumb_func_end sub_80A8314

	thumb_func_start sub_80A8374
sub_80A8374: @ 80A84C4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080A8550 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r2
	ldrb r5, [r3, 0x8]
	ldrh r4, [r3, 0xA]
	ldrh r1, [r3, 0x18]
	adds r0, r1, 0x1
	strh r0, [r3, 0x18]
	movs r7, 0xC
	ldrsh r0, [r3, r7]
	lsls r1, 16
	asrs r1, 16
	mov r12, r2
	ldr r7, _080A8554 @ =gSprites
	cmp r0, r1
	bne _080A8516
	movs r0, 0
	strh r0, [r3, 0x18]
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r1, r0, r7
	ldrh r3, [r1, 0x24]
	movs r0, 0x24
	ldrsh r2, [r1, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r2, r0
	bne _080A850E
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
_080A850E:
	lsls r0, r4, 16
	asrs r0, 16
	adds r0, r3
	strh r0, [r1, 0x24]
_080A8516:
	lsls r2, r6, 2
	adds r2, r6
	lsls r2, 3
	add r2, r12
	strh r4, [r2, 0xA]
	ldrh r1, [r2, 0xE]
	ldrh r0, [r2, 0x1A]
	adds r1, r0
	strh r1, [r2, 0x1A]
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r7
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x26]
	ldrh r0, [r2, 0x10]
	subs r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _080A8548
	adds r0, r6, 0
	bl move_anim_task_del
_080A8548:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8550: .4byte gTasks
_080A8554: .4byte gSprites
	thumb_func_end sub_80A8374

	thumb_func_start sub_80A8408
sub_80A8408: @ 80A8558
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	ldr r4, _080A85CC @ =gUnknown_03004B00
	ldrb r0, [r4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r7, r0, 24
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	ble _080A857C
	movs r0, 0x5
	strh r0, [r4, 0x8]
_080A857C:
	movs r1, 0
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	adds r3, r4, 0
	ldr r2, _080A85D0 @ =gTasks
	mov r12, r2
	lsls r4, r5, 2
	ldr r2, _080A85D4 @ =sub_80A8488
	mov r8, r2
	cmp r1, r0
	bge _080A85A2
	adds r2, r0, 0
_080A8594:
	lsls r0, r6, 25
	lsrs r6, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	blt _080A8594
_080A85A2:
	adds r0, r4, r5
	lsls r0, 3
	add r0, r12
	strh r7, [r0, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0xE]
	strh r6, [r0, 0x10]
	mov r1, r8
	str r1, [r0]
	adds r0, r5, 0
	bl _call_via_r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A85CC: .4byte gUnknown_03004B00
_080A85D0: .4byte gTasks
_080A85D4: .4byte sub_80A8488
	thumb_func_end sub_80A8408

	thumb_func_start sub_80A8488
sub_80A8488: @ 80A85D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080A8648 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrb r4, [r5, 0x8]
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r2, _080A864C @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r4, r1, r2
	strh r0, [r4, 0x24]
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r5, 0xC]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x10]
	ldrh r1, [r5, 0x12]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x12]
	cmp r0, 0
	bne _080A8630
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
_080A8630:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080A8642
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
_080A8642:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8648: .4byte gTasks
_080A864C: .4byte gSprites
	thumb_func_end sub_80A8488

	thumb_func_start sub_80A8500
sub_80A8500: @ 80A8650
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A8678 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A866C
	ldr r1, _080A867C @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A866C:
	adds r0, r4, 0
	bl sub_80A8408
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8678: .4byte gUnknown_0202F7C8
_080A867C: .4byte gUnknown_03004B00
	thumb_func_end sub_80A8500

	thumb_func_start sub_80A8530
sub_80A8530: @ 80A8680
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A86A8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A86B0
	ldr r1, _080A86AC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	b _080A86B4
	.align 2, 0
_080A86A8: .4byte gUnknown_0202F7C8
_080A86AC: .4byte gUnknown_03004B00
_080A86B0:
	ldr r1, _080A86E0 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
_080A86B4:
	strh r0, [r4, 0x30]
	ldrh r2, [r1]
	movs r0, 0
	strh r2, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldr r1, _080A86E4 @ =gUnknown_02024BE0
	ldr r0, _080A86E8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r1, _080A86EC @ =sub_80A85A4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080A86F0 @ =sub_8078458
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A86E0: .4byte gUnknown_03004B00
_080A86E4: .4byte gUnknown_02024BE0
_080A86E8: .4byte gUnknown_0202F7C8
_080A86EC: .4byte sub_80A85A4
_080A86F0: .4byte sub_8078458
	thumb_func_end sub_80A8530

	thumb_func_start sub_80A85A4
sub_80A85A4: @ 80A86F4
	push {lr}
	ldrh r1, [r0, 0x36]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x30]
	negs r1, r1
	strh r1, [r0, 0x30]
	ldr r1, _080A8710 @ =sub_8078458
	str r1, [r0, 0x1C]
	ldr r1, _080A8714 @ =move_anim_8072740
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080A8710: .4byte sub_8078458
_080A8714: .4byte move_anim_8072740
	thumb_func_end sub_80A85A4

	thumb_func_start sub_80A85C8
sub_80A85C8: @ 80A8718
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r5, _080A8758 @ =gUnknown_03004B00
	ldrb r0, [r5, 0x4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r5]
	movs r1, 0
	strh r2, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldrh r1, [r5, 0x2]
	strh r1, [r4, 0x32]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r1, _080A875C @ =sub_80A8614
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080A8760 @ =sub_8078458
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8758: .4byte gUnknown_03004B00
_080A875C: .4byte sub_80A8614
_080A8760: .4byte sub_8078458
	thumb_func_end sub_80A85C8

	thumb_func_start sub_80A8614
sub_80A8614: @ 80A8764
	push {lr}
	ldrh r1, [r0, 0x36]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x32]
	negs r1, r1
	strh r1, [r0, 0x32]
	ldr r1, _080A8780 @ =sub_8078458
	str r1, [r0, 0x1C]
	ldr r1, _080A8784 @ =move_anim_8072740
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080A8780: .4byte sub_8078458
_080A8784: .4byte move_anim_8072740
	thumb_func_end sub_80A8614

	thumb_func_start sub_80A8638
sub_80A8638: @ 80A8788
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _080A87A0 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A87AC
	ldr r1, _080A87A4 @ =gUnknown_02024BE0
	ldr r0, _080A87A8 @ =gUnknown_0202F7C8
	b _080A87B0
	.align 2, 0
_080A87A0: .4byte gUnknown_03004B00
_080A87A4: .4byte gUnknown_02024BE0
_080A87A8: .4byte gUnknown_0202F7C8
_080A87AC:
	ldr r1, _080A8810 @ =gUnknown_02024BE0
	ldr r0, _080A8814 @ =gUnknown_0202F7C9
_080A87B0:
	ldrb r0, [r0]
	adds r0, r1
	ldrb r7, [r0]
	ldr r5, _080A8818 @ =gUnknown_03004B00
	ldrh r0, [r5, 0x4]
	movs r3, 0
	strh r0, [r6, 0x2E]
	ldr r0, _080A881C @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r6, 0x30]
	ldrh r0, [r4, 0x20]
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x22]
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	str r3, [sp]
	bl sub_8078A5C
	ldr r3, [sp]
	strh r3, [r6, 0x34]
	strh r3, [r6, 0x36]
	ldrh r0, [r4, 0x24]
	strh r0, [r6, 0x38]
	ldrh r0, [r4, 0x26]
	strh r0, [r6, 0x3A]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080A8820
	strh r3, [r6, 0x32]
	b _080A8826
	.align 2, 0
_080A8810: .4byte gUnknown_02024BE0
_080A8814: .4byte gUnknown_0202F7C9
_080A8818: .4byte gUnknown_03004B00
_080A881C: .4byte gSprites
_080A8820:
	cmp r0, 0x2
	bne _080A8826
	strh r3, [r6, 0x30]
_080A8826:
	ldr r0, _080A883C @ =gUnknown_03004B00
	ldrh r1, [r0, 0x2]
	lsls r0, r7, 8
	orrs r0, r1
	strh r0, [r6, 0x3C]
	ldr r0, _080A8840 @ =sub_80A86F4
	str r0, [r6, 0x1C]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A883C: .4byte gUnknown_03004B00
_080A8840: .4byte sub_80A86F4
	thumb_func_end sub_80A8638

	thumb_func_start sub_80A86F4
sub_80A86F4: @ 80A8844
	push {r4-r6,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3C]
	lsls r1, r0, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	lsls r0, 16
	asrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080A8880 @ =gSprites
	adds r3, r1, r0
	ldrh r0, [r2, 0x2E]
	movs r6, 0x2E
	ldrsh r1, [r2, r6]
	cmp r1, 0
	bne _080A8884
	cmp r4, 0x1
	bhi _080A886E
	strh r1, [r3, 0x24]
_080A886E:
	cmp r5, 0x2
	beq _080A8876
	cmp r5, 0
	bne _080A8878
_080A8876:
	strh r1, [r3, 0x26]
_080A8878:
	adds r0, r2, 0
	bl move_anim_8072740
	b _080A88AE
	.align 2, 0
_080A8880: .4byte gSprites
_080A8884:
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	adds r1, r0
	strh r1, [r2, 0x34]
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r0, r4
	strh r0, [r2, 0x36]
	lsls r1, 16
	asrs r1, 24
	ldrh r6, [r2, 0x38]
	adds r1, r6
	strh r1, [r3, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r2, 0x3A]
	adds r0, r2
	strh r0, [r3, 0x26]
_080A88AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A86F4

	thumb_func_start sub_80A8764
sub_80A8764: @ 80A88B4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080A88C8 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A88D0
	ldr r0, _080A88CC @ =gUnknown_0202F7C8
	b _080A88D2
	.align 2, 0
_080A88C8: .4byte gUnknown_03004B00
_080A88CC: .4byte gUnknown_0202F7C8
_080A88D0:
	ldr r0, _080A8950 @ =gUnknown_0202F7C9
_080A88D2:
	ldrb r2, [r0]
	ldr r0, _080A8954 @ =gUnknown_02024BE0
	adds r0, r2, r0
	ldrb r6, [r0]
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A88FC
	ldr r1, _080A8958 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080A88FC
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A88FC:
	ldr r2, _080A8958 @ =gUnknown_03004B00
	ldrh r0, [r2, 0x8]
	movs r4, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080A895C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x2]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x22]
	strh r0, [r5, 0x34]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078A5C
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	strh r6, [r5, 0x38]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080A8960 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080A8964 @ =sub_80784A8
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8950: .4byte gUnknown_0202F7C9
_080A8954: .4byte gUnknown_02024BE0
_080A8958: .4byte gUnknown_03004B00
_080A895C: .4byte gSprites
_080A8960: .4byte move_anim_8072740
_080A8964: .4byte sub_80784A8
	thumb_func_end sub_80A8764

	thumb_func_start sub_80A8818
sub_80A8818: @ 80A8968
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A8988 @ =gUnknown_03004B00
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080A8990
	ldr r0, _080A898C @ =gUnknown_0202F7C8
	b _080A8992
	.align 2, 0
_080A8988: .4byte gUnknown_03004B00
_080A898C: .4byte gUnknown_0202F7C8
_080A8990:
	ldr r0, _080A8A10 @ =gUnknown_0202F7C9
_080A8992:
	ldrb r1, [r0]
	ldr r0, _080A8A14 @ =gUnknown_02024BE0
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r1, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A89BC
	ldr r1, _080A8A18 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080A89BC
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080A89BC:
	ldr r5, _080A8A18 @ =gUnknown_03004B00
	ldrh r0, [r5, 0x8]
	strh r0, [r6, 0x2E]
	ldr r0, _080A8A1C @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r6, 0x30]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r6, 0x34]
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl sub_8078A5C
	ldrh r0, [r4, 0x24]
	lsls r0, 8
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x26]
	lsls r0, 8
	strh r0, [r6, 0x36]
	strh r7, [r6, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r6, 0x3A]
	lsls r0, 16
	cmp r0, 0
	bne _080A8A24
	ldr r1, _080A8A20 @ =move_anim_8072740
	adds r0, r6, 0
	bl oamt_set_x3A_32
	b _080A8A2C
	.align 2, 0
_080A8A10: .4byte gUnknown_0202F7C9
_080A8A14: .4byte gUnknown_02024BE0
_080A8A18: .4byte gUnknown_03004B00
_080A8A1C: .4byte gSprites
_080A8A20: .4byte move_anim_8072740
_080A8A24:
	ldr r1, _080A8A38 @ =sub_80A88F0
	adds r0, r6, 0
	bl oamt_set_x3A_32
_080A8A2C:
	ldr r0, _080A8A3C @ =sub_80784A8
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A38: .4byte sub_80A88F0
_080A8A3C: .4byte sub_80784A8
	thumb_func_end sub_80A8818

	thumb_func_start sub_80A88F0
sub_80A88F0: @ 80A8A40
	push {r4,lr}
	ldr r4, _080A8A6C @ =gSprites
	movs r1, 0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	movs r3, 0
	strh r3, [r1, 0x24]
	movs r1, 0x38
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r3, [r1, 0x26]
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A6C: .4byte gSprites
	thumb_func_end sub_80A88F0

	thumb_func_start sub_80A8920
sub_80A8920: @ 80A8A70
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080A8AF4 @ =gUnknown_03004B00
	movs r0, 0x6
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080A8AF8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8AA2
	ldrh r0, [r5, 0x2]
	negs r0, r0
	strh r0, [r5, 0x2]
	ldrh r0, [r5, 0xA]
	negs r0, r0
	strh r0, [r5, 0xA]
_080A8AA2:
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	ldr r1, _080A8AFC @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	strh r7, [r4, 0x16]
	ldr r0, _080A8B00 @ =sub_80A89B4
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8AF4: .4byte gUnknown_03004B00
_080A8AF8: .4byte gUnknown_0202F7C8
_080A8AFC: .4byte gTasks
_080A8B00: .4byte sub_80A89B4
	thumb_func_end sub_80A8920

	thumb_func_start sub_80A89B4
sub_80A89B4: @ 80A8B04
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A8B5C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	ldrh r2, [r5, 0x1E]
	adds r0, r2
	strh r0, [r5, 0x1E]
	ldr r2, _080A8B60 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r2
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x1C]
	lsrs r0, 8
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x16]
	ldrh r1, [r5, 0x1C]
	adds r0, r1
	strh r0, [r5, 0x1C]
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080A8B54
	ldr r0, _080A8B64 @ =sub_80A8A18
	str r0, [r5]
_080A8B54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8B5C: .4byte gTasks
_080A8B60: .4byte gSprites
_080A8B64: .4byte sub_80A8A18
	thumb_func_end sub_80A89B4

	thumb_func_start sub_80A8A18
sub_80A8A18: @ 80A8B68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080A8B8C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080A8B90
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	b _080A8BC4
	.align 2, 0
_080A8B8C: .4byte gTasks
_080A8B90:
	ldrb r0, [r4, 0x8]
	ldrh r2, [r4, 0x12]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldr r3, _080A8BCC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	lsls r2, 16
	asrs r2, 24
	ldrh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 24
	adds r2, r0
	strh r2, [r1, 0x24]
	ldrh r0, [r4, 0x14]
	subs r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080A8BC4
	adds r0, r5, 0
	bl move_anim_task_del
_080A8BC4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8BCC: .4byte gSprites
	thumb_func_end sub_80A8A18

	thumb_func_start sub_80A8A80
sub_80A8A80: @ 80A8BD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A8BF4 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _080A8BFE
	cmp r0, 0x2
	bgt _080A8BF8
	cmp r0, 0
	blt _080A8C30
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	b _080A8C38
	.align 2, 0
_080A8BF4: .4byte gUnknown_03004B00
_080A8BF8:
	cmp r0, 0x3
	beq _080A8C08
	b _080A8C30
_080A8BFE:
	ldr r5, _080A8C04 @ =gUnknown_0202F7C8
	b _080A8C0A
	.align 2, 0
_080A8C04: .4byte gUnknown_0202F7C8
_080A8C08:
	ldr r5, _080A8C28 @ =gUnknown_0202F7C9
_080A8C0A:
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080A8C30
	ldr r1, _080A8C2C @ =gUnknown_02024BE0
	ldrb r0, [r5]
	eors r0, r4
	adds r0, r1
	ldrb r2, [r0]
	b _080A8C38
	.align 2, 0
_080A8C28: .4byte gUnknown_0202F7C9
_080A8C2C: .4byte gUnknown_02024BE0
_080A8C30:
	adds r0, r6, 0
	bl move_anim_task_del
	b _080A8C78
_080A8C38:
	ldr r1, _080A8C58 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r5, r0, r1
	strh r2, [r5, 0x8]
	ldr r0, _080A8C5C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8C64
	ldr r0, _080A8C60 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x2]
	b _080A8C6A
	.align 2, 0
_080A8C58: .4byte gTasks
_080A8C5C: .4byte gUnknown_0202F7C9
_080A8C60: .4byte gUnknown_03004B00
_080A8C64:
	ldr r0, _080A8C80 @ =gUnknown_03004B00
	ldrh r0, [r0, 0x2]
	negs r0, r0
_080A8C6A:
	strh r0, [r5, 0xA]
	ldr r0, _080A8C84 @ =gTasks
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A8C88 @ =sub_80A8B3C
	str r0, [r1]
_080A8C78:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8C80: .4byte gUnknown_03004B00
_080A8C84: .4byte gTasks
_080A8C88: .4byte sub_80A8B3C
	thumb_func_end sub_80A8A80

	thumb_func_start sub_80A8B3C
sub_80A8B3C: @ 80A8C8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A8CD0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r2, [r1, 0x8]
	ldr r3, _080A8CD4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r1, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _080A8CCA
	adds r0, r4, 0
	bl move_anim_task_del
_080A8CCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8CD0: .4byte gTasks
_080A8CD4: .4byte gSprites
	thumb_func_end sub_80A8B3C

	thumb_func_start sub_80A8B88
sub_80A8B88: @ 80A8CD8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080A8D28 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A8CF4
	ldr r1, _080A8D2C @ =gUnknown_03004B00
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080A8CF4:
	ldr r4, _080A8D2C @ =gUnknown_03004B00
	ldrb r0, [r4, 0x8]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A8D30 @ =gTasks
	lsls r3, r5, 2
	adds r1, r3, r5
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r4]
	strh r1, [r2, 0x8]
	ldrh r1, [r4, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r4, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r4, 0x6]
	strh r1, [r2, 0xE]
	strh r0, [r2, 0x10]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A8D34
	ldrb r0, [r6]
	b _080A8D38
	.align 2, 0
_080A8D28: .4byte gUnknown_0202F7C8
_080A8D2C: .4byte gUnknown_03004B00
_080A8D30: .4byte gTasks
_080A8D34:
	ldr r0, _080A8D50 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
_080A8D38:
	strh r0, [r2, 0x12]
	ldr r1, _080A8D54 @ =gTasks
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x20]
	ldr r1, _080A8D58 @ =sub_80A8C0C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D50: .4byte gUnknown_0202F7C9
_080A8D54: .4byte gTasks
_080A8D58: .4byte sub_80A8C0C
	thumb_func_end sub_80A8B88

	thumb_func_start sub_80A8C0C
sub_80A8C0C: @ 80A8D5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A8DAC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrb r7, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	lsls r1, r0, 16
	strh r0, [r4, 0x1C]
	lsrs r1, 24
	mov r8, r1
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	lsrs r5, r0, 16
	mov r9, r5
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A8DB4
	ldr r0, _080A8DB0 @ =gSprites
	lsls r2, r7, 4
	adds r1, r2, r7
	lsls r1, 2
	adds r1, r0
	strh r5, [r1, 0x24]
	mov r9, r0
	adds r4, r2, 0
	b _080A8DFA
	.align 2, 0
_080A8DAC: .4byte gTasks
_080A8DB0: .4byte gSprites
_080A8DB4:
	ldrb r0, [r4, 0x12]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080A8DDC
	ldr r1, _080A8DD8 @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	lsls r0, r5, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _080A8DF8
	b _080A8DF6
	.align 2, 0
_080A8DD8: .4byte gSprites
_080A8DDC:
	ldr r1, _080A8E7C @ =gSprites
	lsls r2, r7, 4
	adds r0, r2, r7
	lsls r0, 2
	adds r3, r0, r1
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r9, r1
	adds r4, r2, 0
	cmp r0, 0
	bge _080A8DF6
	negs r0, r0
_080A8DF6:
	negs r0, r0
_080A8DF8:
	strh r0, [r3, 0x26]
_080A8DFA:
	mov r5, r8
	cmp r5, 0x7F
	bls _080A8E1C
	ldr r1, _080A8E80 @ =gTasks
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _080A8E1C
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080A8E3E
_080A8E1C:
	mov r2, r8
	cmp r2, 0x7E
	bhi _080A8E70
	ldr r1, _080A8E80 @ =gTasks
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0x1E
	ldrsh r0, [r3, r5]
	adds r5, r1, 0
	cmp r0, 0x1
	bne _080A8E70
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080A8E70
_080A8E3E:
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x1E]
	movs r2, 0x1
	eors r0, r2
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	eors r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080A8E70
	adds r0, r4, r7
	lsls r0, 2
	add r0, r9
	strh r3, [r0, 0x24]
	strh r3, [r0, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
_080A8E70:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8E7C: .4byte gSprites
_080A8E80: .4byte gTasks
	thumb_func_end sub_80A8C0C

	thumb_func_start sub_80A8D34
sub_80A8D34: @ 80A8E84
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080A8ED0 @ =gUnknown_03004B00
	ldrb r0, [r6, 0x6]
	bl obj_id_for_side_relative_to_move
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r6, 0x8]
	adds r0, r5, 0
	bl sub_8078E70
	ldr r1, _080A8ED4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r6]
	strh r1, [r0, 0x8]
	ldrh r1, [r6, 0x2]
	strh r1, [r0, 0xA]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xC]
	ldrh r1, [r6, 0x4]
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1C]
	strh r1, [r0, 0x1E]
	ldr r1, _080A8ED8 @ =sub_80A8D8C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A8ED0: .4byte gUnknown_03004B00
_080A8ED4: .4byte gTasks
_080A8ED8: .4byte sub_80A8D8C
	thumb_func_end sub_80A8D34

	thumb_func_start sub_80A8D8C
sub_80A8D8C: @ 80A8EDC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080A8F3C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0xA]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrb r0, [r4, 0x10]
	adds r6, r0, 0
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	adds r0, r6, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080A8F4C
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	ble _080A8F40
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r1, [r4, 0xE]
	b _080A8F4C
	.align 2, 0
_080A8F3C: .4byte gTasks
_080A8F40:
	adds r0, r6, 0
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_080A8F4C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8D8C

	thumb_func_start sub_80A8E04
sub_80A8E04: @ 80A8F54
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _080A8F90 @ =gUnknown_03004B00
	ldrb r0, [r4, 0x4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_8078E70
	ldr r1, _080A8F94 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2, 0xA]
	ldrh r0, [r4]
	strh r0, [r2, 0xC]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	beq _080A8F98
	strh r1, [r2, 0xE]
	b _080A8FA4
	.align 2, 0
_080A8F90: .4byte gUnknown_03004B00
_080A8F94: .4byte gTasks
_080A8F98:
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	adds r3, r0, 0
	muls r3, r1
	adds r0, r3, 0
	strh r0, [r2, 0xE]
_080A8FA4:
	ldr r1, _080A8FD0 @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r6, _080A8FD4 @ =gUnknown_03004B00
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x10]
	mov r0, r8
	strh r0, [r5, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x14]
	bl sub_8076BE0
	lsls r0, 24
	mov r8, r4
	cmp r0, 0
	beq _080A8FD8
	movs r0, 0x1
	strh r0, [r5, 0x16]
	b _080A8FFC
	.align 2, 0
_080A8FD0: .4byte gTasks
_080A8FD4: .4byte gUnknown_03004B00
_080A8FD8:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080A8FE8
	ldr r0, _080A8FE4 @ =gUnknown_0202F7C8
	b _080A8FEA
	.align 2, 0
_080A8FE4: .4byte gUnknown_0202F7C8
_080A8FE8:
	ldr r0, _080A9040 @ =gUnknown_0202F7C9
_080A8FEA:
	ldrb r0, [r0]
	bl battle_side_get_owner
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080A8FFA
	movs r1, 0x1
_080A8FFA:
	strh r1, [r5, 0x16]
_080A8FFC:
	ldr r0, _080A9044 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r4, r1, r0
	movs r3, 0x16
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080A9028
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080A9028
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0xE]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
_080A9028:
	ldr r0, _080A9044 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _080A9048 @ =sub_80A8FD8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9040: .4byte gUnknown_0202F7C9
_080A9044: .4byte gTasks
_080A9048: .4byte sub_80A8FD8
	thumb_func_end sub_80A8E04

	thumb_func_start sub_80A8EFC
sub_80A8EFC: @ 80A904C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A9088 @ =gUnknown_03004B00
	ldrb r0, [r4, 0x4]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0
	bl sub_8078E70
	ldr r1, _080A908C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldrh r1, [r4]
	strh r1, [r0, 0xC]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080A9094
	ldr r0, _080A9090 @ =gUnknown_0202F7C8
	b _080A9096
	.align 2, 0
_080A9088: .4byte gUnknown_03004B00
_080A908C: .4byte gTasks
_080A9090: .4byte gUnknown_0202F7C8
_080A9094:
	ldr r0, _080A90C4 @ =gUnknown_0202F7C9
_080A9096:
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080A90A8
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_080A90A8:
	ldr r0, _080A90C8 @ =gUnknown_03004B00
	movs r2, 0x6
	ldrsh r1, [r0, r2]
	adds r6, r0, 0
	cmp r1, 0x1
	beq _080A90D0
	ldr r2, _080A90CC @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0xE]
	b _080A90EA
	.align 2, 0
_080A90C4: .4byte gUnknown_0202F7C9
_080A90C8: .4byte gUnknown_03004B00
_080A90CC: .4byte gTasks
_080A90D0:
	ldr r3, _080A9120 @ =gTasks
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r3
	ldrh r2, [r6]
	ldrh r1, [r6, 0x2]
	adds r7, r2, 0
	muls r7, r1
	adds r1, r7, 0
	strh r1, [r0, 0xE]
	adds r2, r3, 0
	adds r3, r4, 0
_080A90EA:
	adds r1, r3, r5
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r6, 0x2]
	strh r0, [r1, 0x10]
	mov r0, r8
	strh r0, [r1, 0x12]
	ldrh r0, [r6, 0x6]
	strh r0, [r1, 0x14]
	movs r0, 0x1
	strh r0, [r1, 0x16]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0xE]
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	negs r0, r0
	strh r0, [r1, 0x10]
	ldr r0, _080A9124 @ =sub_80A8FD8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9120: .4byte gTasks
_080A9124: .4byte sub_80A8FD8
	thumb_func_end sub_80A8EFC

	thumb_func_start sub_80A8FD8
sub_80A8FD8: @ 80A9128
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080A9180 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrb r0, [r4, 0x12]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0xE]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080A915C
	ldrb r0, [r4, 0x12]
	bl sub_8078F9C
_080A915C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080A91A2
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080A9184
	cmp r0, 0x1
	ble _080A918A
	cmp r0, 0x2
	beq _080A9192
	b _080A918A
	.align 2, 0
_080A9180: .4byte gTasks
_080A9184:
	ldrb r0, [r4, 0x12]
	bl sub_8078F40
_080A918A:
	adds r0, r5, 0
	bl move_anim_task_del
	b _080A91A2
_080A9192:
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080A91A2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A8FD8

	thumb_func_start sub_80A9058
sub_80A9058: @ 80A91A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080A91D4 @ =gUnknown_03004B00
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, 0
	bne _080A91E0
	ldr r4, _080A91D8 @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _080A91DC @ =gUnknown_0202F7BC
	ldrh r0, [r0]
	movs r1, 0xC
	bl __udivsi3
	b _080A91F4
	.align 2, 0
_080A91D4: .4byte gUnknown_03004B00
_080A91D8: .4byte gTasks
_080A91DC: .4byte gUnknown_0202F7BC
_080A91E0:
	ldr r4, _080A927C @ =gTasks
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r6, r0, r4
	ldr r0, _080A9280 @ =gUnknown_0202F7B8
	ldr r0, [r0]
	movs r1, 0xC
	bl __divsi3
_080A91F4:
	strh r0, [r6, 0x26]
	lsls r0, 16
	adds r1, r4, 0
	cmp r0, 0
	bgt _080A9202
	movs r0, 0x1
	strh r0, [r6, 0x26]
_080A9202:
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	cmp r0, 0x10
	ble _080A920E
	movs r0, 0x10
	strh r0, [r6, 0x26]
_080A920E:
	adds r4, r5, r7
	lsls r4, 3
	adds r4, r1
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	movs r5, 0
	strh r1, [r4, 0x24]
	ldrh r2, [r4, 0x26]
	movs r0, 0x1
	ands r0, r2
	adds r1, r0
	strh r1, [r4, 0x22]
	strh r5, [r4, 0x20]
	mov r1, r8
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x1E]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r2, _080A9284 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x18]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x1A]
	strh r5, [r4, 0x8]
	mov r1, r8
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080A9288 @ =sub_80A913C
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A927C: .4byte gTasks
_080A9280: .4byte gUnknown_0202F7B8
_080A9284: .4byte gSprites
_080A9288: .4byte sub_80A913C
	thumb_func_end sub_80A9058

	thumb_func_start sub_80A913C
sub_80A913C: @ 80A928C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080A92E0 @ =gTasks
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _080A936A
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0x20]
	adds r1, r0, 0x1
	movs r0, 0x1
	ands r1, r0
	strh r1, [r3, 0x20]
	movs r2, 0x1C
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080A92FE
	cmp r1, 0
	beq _080A92E8
	ldr r2, _080A92E4 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x18]
	adds r1, r2
	b _080A92FC
	.align 2, 0
_080A92E0: .4byte gTasks
_080A92E4: .4byte gSprites
_080A92E8:
	ldr r2, _080A9324 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x18]
	ldrh r2, [r3, 0x24]
	subs r1, r2
_080A92FC:
	strh r1, [r0, 0x24]
_080A92FE:
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080A9338
	movs r2, 0x20
	ldrsh r4, [r3, r2]
	cmp r4, 0
	beq _080A9328
	ldr r2, _080A9324 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x26]
	strh r1, [r0, 0x26]
	b _080A9338
	.align 2, 0
_080A9324: .4byte gSprites
_080A9328:
	ldr r2, _080A9370 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
_080A9338:
	ldrh r0, [r3, 0xC]
	subs r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	bne _080A936A
	ldr r2, _080A9370 @ =gSprites
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x24]
	movs r0, 0x16
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x26]
	adds r0, r5, 0
	bl move_anim_task_del
_080A936A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9370: .4byte gSprites
	thumb_func_end sub_80A913C

	.align 2, 0 @ Don't pad with nop.
