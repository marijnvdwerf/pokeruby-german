	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8046400
sub_8046400: @ 8046724
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _08046774
	movs r0, 0x1
	strb r0, [r1]
	ldr r6, _08046778
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804677C
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08046780
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08046784
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	ldrb r0, [r6]
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08046774: .4byte gUnknown_02024E6D
_08046778: .4byte gUnknown_02024A60
_0804677C: .4byte 0x02017810
_08046780: .4byte sub_8046464
_08046784: .4byte gTasks
	thumb_func_end sub_8046400

	thumb_func_start sub_8046464
sub_8046464: @ 8046788
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	ldr r1, _080467BC
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080467C0
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	b _0804693A
	.align 2, 0
_080467BC: .4byte gTasks
_080467C0:
	ldrh r0, [r1, 0xC]
	mov r8, r0
	ldrb r5, [r1, 0xE]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080467EC
	ldr r1, _080467E4
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080467E8
	b _080467FA
	.align 2, 0
_080467E4: .4byte gUnknown_02024A6A
_080467E8: .4byte gEnemyParty
_080467EC:
	ldr r1, _08046868
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804686C
_080467FA:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80478DC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _08046870
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08046874
	mov r9, r2
	lsls r0, r7, 4
	adds r0, r7
	lsls r6, r0, 2
	adds r4, r6, r2
	movs r0, 0x80
	strh r0, [r4, 0x2E]
	movs r3, 0
	strh r3, [r4, 0x30]
	mov r0, r8
	strh r0, [r4, 0x3C]
	mov r2, r8
	cmp r2, 0xFE
	beq _08046880
	cmp r2, 0xFF
	bne _080468BC
	ldr r0, _08046878
	strb r5, [r0]
	movs r0, 0x18
	strh r0, [r4, 0x20]
	movs r0, 0x44
	strh r0, [r4, 0x22]
	mov r0, r9
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _0804687C
	str r1, [r0]
	b _080468CA
	.align 2, 0
_08046868: .4byte gUnknown_02024A6A
_0804686C: .4byte gPlayerParty
_08046870: .4byte gSpriteTemplate_820AAB4
_08046874: .4byte gSprites
_08046878: .4byte gUnknown_02024C08
_0804687C: .4byte sub_8047074
_08046880:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x22]
	ldr r0, _080468B4
	strb r5, [r0]
	movs r3, 0
	strh r3, [r4, 0x2E]
	mov r0, r9
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _080468B8
	str r1, [r0]
	b _080468CA
	.align 2, 0
_080468B4: .4byte gUnknown_02024C08
_080468B8: .4byte sub_8047254
_080468BC:
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _080468E8
	strb r0, [r1]
	movs r0, 0x1
	str r0, [sp]
_080468CA:
	ldr r0, _080468EC
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	adds r4, r1, r0
	ldr r5, _080468E8
	ldrb r0, [r5]
	strh r0, [r4, 0x3A]
	ldr r2, [sp]
	cmp r2, 0
	bne _080468F0
	mov r0, r10
	bl DestroyTask
	b _0804693A
	.align 2, 0
_080468E8: .4byte gUnknown_02024C08
_080468EC: .4byte gSprites
_080468F0:
	movs r0, 0x22
	strh r0, [r4, 0x2E]
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r4, 0x36]
	ldr r0, _0804694C
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	mov r3, r10
	strh r3, [r4, 0x6]
	ldr r1, _08046950
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r5]
	strh r1, [r0, 0x10]
	ldr r1, _08046954
	str r1, [r0]
	movs r0, 0x3D
	bl PlaySE
_0804693A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804694C: .4byte 0x0000ffd8
_08046950: .4byte gTasks
_08046954: .4byte TaskDummy
	thumb_func_end sub_8046464

	thumb_func_start objc_0804ABD4
objc_0804ABD4: @ 8046958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080469F8
	ldrb r6, [r7, 0x6]
	ldr r1, _08046A04
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x10]
	ldrb r0, [r0, 0xC]
	mov r8, r0
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r7, 0x20]
	ldrh r0, [r7, 0x26]
	ldrh r2, [r7, 0x22]
	adds r0, r2
	strh r0, [r7, 0x22]
	strh r1, [r7, 0x24]
	strh r1, [r7, 0x26]
	strh r1, [r7, 0x38]
	adds r0, r5, 0
	bl sub_8047978
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	ldrh r0, [r7, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	movs r0, 0
	adds r1, r5, 0
	movs r2, 0xE
	adds r3, r4, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x2E]
	strh r5, [r7, 0x3A]
	mov r0, r8
	strh r0, [r7, 0x3C]
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, _08046A08
	str r0, [r7, 0x1C]
_080469F8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046A04: .4byte gTasks
_08046A08: .4byte sub_80466E8
	thumb_func_end objc_0804ABD4

	thumb_func_start sub_80466E8
sub_80466E8: @ 8046A0C
	ldr r1, _08046A14
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08046A14: .4byte sub_80466F4
	thumb_func_end sub_80466E8

	thumb_func_start sub_80466F4
sub_80466F4: @ 8046A18
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x38]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r6, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08046A72
	strh r7, [r6, 0x38]
	ldr r0, _08046A78
	str r0, [r6, 0x1C]
	ldr r5, _08046A7C
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08046A80
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl AnimateSprite
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x30]
_08046A72:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046A78: .4byte sub_8046760
_08046A7C: .4byte gUnknown_02024BE0
_08046A80: .4byte gSprites
	thumb_func_end sub_80466F4

	thumb_func_start sub_8046760
sub_8046760: @ 8046A84
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _08046A9C
	movs r0, 0x3C
	bl PlaySE
_08046A9C:
	ldr r6, _08046AE8
	ldr r5, _08046AEC
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _08046AF4
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _08046AF0
	str r0, [r4, 0x1C]
	b _08046B14
	.align 2, 0
_08046AE8: .4byte gSprites
_08046AEC: .4byte gUnknown_02024BE0
_08046AF0: .4byte sub_80467F8
_08046AF4:
	ldrh r0, [r1, 0x30]
	adds r0, 0x60
	strh r0, [r1, 0x30]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	adds r0, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
_08046B14:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8046760

	thumb_func_start sub_80467F8
sub_80467F8: @ 8046B1C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08046B64
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _08046B64
	strh r1, [r4, 0x34]
	movs r0, 0x20
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _08046B6C
	str r0, [r4, 0x1C]
_08046B64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046B6C: .4byte sub_804684C
	thumb_func_end sub_80467F8

	thumb_func_start sub_804684C
sub_804684C: @ 8046B70
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _08046B86
	cmp r1, 0x1
	beq _08046BFA
	b _08046C26
_08046B86:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _08046C26
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _08046BD0
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _08046BC2
	movs r5, 0x1
_08046BC2:
	cmp r0, 0x2
	beq _08046BE2
	cmp r0, 0x2
	bgt _08046BD4
	cmp r0, 0x1
	beq _08046BDA
	b _08046BF2
	.align 2, 0
_08046BD0: .4byte 0x00000101
_08046BD4:
	cmp r0, 0x3
	beq _08046BEA
	b _08046BF2
_08046BDA:
	movs r0, 0x38
	bl PlaySE
	b _08046C26
_08046BE2:
	movs r0, 0x39
	bl PlaySE
	b _08046C26
_08046BEA:
	movs r0, 0x3A
	bl PlaySE
	b _08046C26
_08046BF2:
	movs r0, 0x3B
	bl PlaySE
	b _08046C26
_08046BFA:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _08046C26
	strh r5, [r4, 0x38]
	ldr r0, _08046C4C
	ands r0, r2
	strh r0, [r4, 0x34]
_08046C26:
	cmp r5, 0
	beq _08046C5E
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08046C54
	ldr r0, _08046C50
	str r0, [r4, 0x1C]
	b _08046C5E
	.align 2, 0
_08046C4C: .4byte 0xffffff00
_08046C50: .4byte sub_8046C78
_08046C54:
	ldr r0, _08046C64
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_08046C5E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046C64: .4byte sub_8046944
	thumb_func_end sub_804684C

	thumb_func_start sub_8046944
sub_8046944: @ 8046C68
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08046C9C
	movs r0, 0
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08046CA4
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySE
_08046C9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046CA4: .4byte sub_8046984
	thumb_func_end sub_8046944

	thumb_func_start sub_8046984
sub_8046984: @ 8046CA8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x4
	bhi _08046DA8
	lsls r0, r1, 2
	ldr r1, _08046CC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08046CC0: .4byte _08046CC4
	.align 2, 0
_08046CC4:
	.4byte _08046CD8
	.4byte _08046D0A
	.4byte _08046CD8
	.4byte _08046D5E
	.4byte _08046DA8
_08046CD8:
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x24]
	adds r1, r0, r2
	strh r1, [r4, 0x24]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bls _08046DEE
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	movs r0, 0
	strh r0, [r4, 0x38]
	b _08046DEE
_08046D0A:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _08046D50
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _08046D46
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _08046DEE
_08046D46:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _08046DEE
_08046D50:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _08046DEE
_08046D5E:
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r2, [r4, 0x34]
	adds r0, r2
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08046D80
	ldr r0, _08046D7C
	str r0, [r4, 0x1C]
	b _08046DEE
	.align 2, 0
_08046D7C: .4byte sub_8046C78
_08046D80:
	cmp r1, 0x4
	bne _08046D94
	cmp r0, 0x3
	bne _08046D94
	ldr r0, _08046D90
	str r0, [r4, 0x1C]
	b _08046D9A
	.align 2, 0
_08046D90: .4byte sub_8046E7C
_08046D94:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_08046D9A:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _08046DEE
_08046DA8:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08046DEE
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _08046DDC
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _08046DE0
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _08046DE8
	.align 2, 0
_08046DDC: .4byte 0xffffff00
_08046DE0:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08046DE8:
	movs r0, 0x17
	bl PlaySE
_08046DEE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8046984

	thumb_func_start sub_8046AD0
sub_8046AD0: @ 8046DF4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08046E20
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r6, [r0, 0xC]
	ldrb r3, [r0, 0xA]
	ldrh r5, [r0, 0x8]
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x20
	bhi _08046EAC
	lsls r0, 2
	ldr r1, _08046E24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08046E20: .4byte gTasks
_08046E24: .4byte _08046E28
	.align 2, 0
_08046E28:
	.4byte _08046EAC
	.4byte _08046ECA
	.4byte _08046ED6
	.4byte _08046F1A
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EF4
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046EAC
	.4byte _08046F2C
	.4byte _08046F44
	.4byte _08046F6C
_08046EAC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x18]
	movs r3, 0x18
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bgt _08046EC4
	adds r0, r2, 0x1
	strh r0, [r1, 0x18]
	b _08046F96
_08046EC4:
	adds r0, r6, 0x1
	strh r0, [r1, 0x26]
	b _08046F96
_08046ECA:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r5, 0
	bl PlayCry1
	b _08046F12
_08046ED6:
	bl StopCryAndClearCrySongs
	ldr r1, _08046EF0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x1C]
	movs r1, 0x14
	strh r1, [r0, 0x26]
	b _08046F96
	.align 2, 0
_08046EF0: .4byte gTasks
_08046EF4:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r6, 0x1C
	ldrsh r0, [r1, r6]
	cmp r0, 0
	bne _08046F7E
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r5, 0
	movs r2, 0x1
	bl PlayCry4
_08046F12:
	adds r0, r4, 0
	bl DestroyTask
	b _08046F96
_08046F1A:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x1C]
	movs r1, 0x1E
	strh r1, [r0, 0x26]
	b _08046F96
_08046F2C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r3, 0x1C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08046F7E
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
_08046F44:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	bne _08046F96
	bl StopCryAndClearCrySongs
	ldr r0, _08046F68
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x3
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08046F96
	.align 2, 0
_08046F68: .4byte gTasks
_08046F6C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0x1C]
	movs r6, 0x1C
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08046F84
_08046F7E:
	subs r0, r2, 0x1
	strh r0, [r1, 0x1C]
	b _08046F96
_08046F84:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl PlayCry4
	adds r0, r4, 0
	bl DestroyTask
_08046F96:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8046AD0

	thumb_func_start sub_8046C78
sub_8046C78: @ 8046F9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_8047978
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldrh r1, [r6, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r4, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x2E]
	ldr r0, _08047030
	str r0, [r6, 0x1C]
	ldr r0, _08047034
	ldr r1, _08047038
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0804700C
	b _08047140
_0804700C:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08047044
	ldr r1, _0804703C
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _08047040
	adds r0, r1, r0
	movs r3, 0x19
	mov r8, r3
	b _08047058
	.align 2, 0
_08047030: .4byte sub_8046E9C
_08047034: .4byte gMain
_08047038: .4byte 0x0000043d
_0804703C: .4byte gUnknown_02024A6A
_08047040: .4byte gEnemyParty
_08047044:
	ldr r1, _080470B4
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080470B8
	adds r0, r1, r0
	movs r1, 0xE7
	mov r8, r1
_08047058:
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _0804707E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _080470D2
_0804707E:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080470D2
	ldr r0, _080470BC
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080470D2
	ldr r0, _080470C0
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080470C8
	bl IsBGMPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080470D2
	ldr r0, _080470C4
	bl m4aMPlayStop
	b _080470D2
	.align 2, 0
_080470B4: .4byte gUnknown_02024A6A
_080470B8: .4byte gPlayerParty
_080470BC: .4byte 0x02017840
_080470C0: .4byte gUnknown_020239F8
_080470C4: .4byte gMPlay_BGM
_080470C8:
	ldr r0, _080470EC
	ldr r1, _080470F0
	movs r2, 0x80
	bl m4aMPlayVolumeControl
_080470D2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080470E8
	ldr r0, _080470F4
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080470F8
_080470E8:
	movs r4, 0
	b _0804711A
	.align 2, 0
_080470EC: .4byte gMPlay_BGM
_080470F0: .4byte 0x0000ffff
_080470F4: .4byte 0x02017840
_080470F8:
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08047114
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _08047118
_08047114:
	movs r4, 0x1
	b _0804711A
_08047118:
	movs r4, 0x2
_0804711A:
	ldr r0, _08047190
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08047194
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r7, [r1, 0x8]
	mov r3, r8
	lsls r0, r3, 24
	asrs r0, 24
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r2, [r1, 0x26]
_08047140:
	ldr r5, _08047198
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804719C
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r3, 0x3A
	ldrsh r0, [r6, r3]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl AnimateSprite
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047190: .4byte sub_8046AD0
_08047194: .4byte gTasks
_08047198: .4byte gUnknown_02024BE0
_0804719C: .4byte gSprites
	thumb_func_end sub_8046C78

	thumb_func_start sub_8046E7C
sub_8046E7C: @ 80471A0
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _080471BC
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_080471BC: .4byte sub_8046FBC
	thumb_func_end sub_8046E7C

	thumb_func_start sub_8046E9C
sub_8046E9C: @ 80471C0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r7, 0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _08047224
	ldr r0, _08047228
	adds r3, r4, r0
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08047202
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08047202:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _0804722C
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r7, 0x1
	b _08047248
	.align 2, 0
_08047224: .4byte gSprites
_08047228: .4byte gUnknown_02024BE0
_0804722C:
	ldr r2, _080472CC
	adds r0, r2, 0
	ldrh r2, [r1, 0x30]
	adds r0, r2
	strh r0, [r1, 0x30]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_08047248:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080472C4
	cmp r7, 0
	beq _080472C4
	ldr r2, _080472D0
	ldr r0, _080472D4
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r0, _080472D8
	strb r2, [r0]
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	ldr r4, _080472DC
	adds r1, r4
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
	movs r3, 0
	movs r5, 0x8
	adds r2, r4, 0
	movs r4, 0x3
_0804729C:
	ldrb r1, [r2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _080472A8
	adds r3, 0x1
_080472A8:
	adds r2, 0xC
	subs r4, 0x1
	cmp r4, 0
	bge _0804729C
	cmp r3, 0x4
	bne _080472C4
	movs r4, 0
_080472B6:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_804794C
	adds r4, 0x1
	cmp r4, 0xB
	ble _080472B6
_080472C4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080472CC: .4byte 0xfffffee0
_080472D0: .4byte gSprites
_080472D4: .4byte gUnknown_02024BE0
_080472D8: .4byte gUnknown_02024E6D
_080472DC: .4byte 0x02017810
	thumb_func_end sub_8046E9C

	thumb_func_start sub_8046FBC
sub_8046FBC: @ 80472E0
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _0804737A
	cmp r1, 0x5F
	bne _08047318
	ldr r0, _08047310
	movs r1, 0
	strb r1, [r0]
	bl m4aMPlayAllStop
	ldr r0, _08047314
	bl PlaySE
	b _0804737A
	.align 2, 0
_08047310: .4byte gUnknown_02024E6D
_08047314: .4byte 0x00000173
_08047318:
	ldr r0, _08047380
	cmp r1, r0
	bne _0804737A
	ldr r5, _08047384
	ldr r4, _08047388
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r6, 0
	bl DestroySpriteAndFreeResources
	ldr r0, _0804738C
	ldr r1, _08047390
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804737A
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 2
	ldr r0, _08047394
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0804737A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047380: .4byte 0x0000013b
_08047384: .4byte gSprites
_08047388: .4byte gUnknown_02024BE0
_0804738C: .4byte gMain
_08047390: .4byte 0x0000043d
_08047394: .4byte 0x02017810
	thumb_func_end sub_8046FBC

	thumb_func_start sub_8047074
sub_8047074: @ 8047398
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x19
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x18
	strh r0, [r4, 0x36]
	ldr r0, _080473E0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x6]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080473E4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080473E0: .4byte 0x0000ffe2
_080473E4: .4byte sub_80470C4
	thumb_func_end sub_8047074

	thumb_func_start sub_80470C4
sub_80470C4: @ 80473E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r0, [r5, 0x3C]
	movs r1, 0xFF
	mov r8, r1
	lsrs r0, 8
	subs r0, 0x23
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2C
	bhi _080474DC
	ldrh r1, [r5, 0x6]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	bne _0804744A
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x2
	negs r1, r1
	adds r4, r1, 0
	ands r0, r4
	orrs r6, r0
	strh r6, [r5, 0x30]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r1, 0x3
	bl __divsi3
	ands r0, r4
	orrs r7, r0
	strh r7, [r5, 0x32]
	adds r0, r5, 0
	movs r1, 0x4
	bl StartSpriteAffineAnim
_0804744A:
	ldrh r4, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078B5C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	ldrh r0, [r5, 0x3C]
	adds r0, r1
	strh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 24
	mov r2, r8
	ands r0, r2
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r5, 0x6]
	adds r0, r1
	strh r0, [r5, 0x6]
	lsls r0, 16
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	beq _0804749A
	strh r4, [r5, 0x2E]
	b _080474A2
_0804749A:
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, 0x1
	strh r0, [r5, 0x2E]
_080474A2:
	ldrh r0, [r5, 0x3C]
	lsrs r0, 8
	cmp r0, 0x4F
	ble _08047544
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	adds r6, r1, 0
	ands r6, r0
	ldrh r0, [r5, 0x32]
	adds r7, r1, 0
	ands r7, r0
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x2
	negs r1, r1
	adds r2, r1, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r5, 0x30]
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	ands r0, r2
	orrs r0, r7
	strh r0, [r5, 0x32]
	b _08047544
_080474DC:
	adds r0, r5, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _08047544
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldrb r0, [r5, 0x6]
	strh r0, [r5, 0x3A]
	strh r1, [r5, 0x2E]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08047538
	ldr r0, _08047530
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08047538
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08047538
	ldr r0, _08047534
	b _0804753A
	.align 2, 0
_08047530: .4byte 0x02017840
_08047534: .4byte sub_8047230
_08047538:
	ldr r0, _08047550
_0804753A:
	str r0, [r5, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
_08047544:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047550: .4byte sub_8046C78
	thumb_func_end sub_80470C4

	thumb_func_start sub_8047230
sub_8047230: @ 8047554
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _0804756E
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldr r0, _08047574
	str r0, [r2, 0x1C]
_0804756E:
	pop {r0}
	bx r0
	.align 2, 0
_08047574: .4byte sub_8046C78
	thumb_func_end sub_8047230

	thumb_func_start sub_8047254
sub_8047254: @ 8047578
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080475C8
	movs r0, 0
	strh r0, [r5, 0x2E]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080475C4
	ldr r0, _080475BC
	ldrb r1, [r0, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080475C4
	movs r0, 0x3A
	ldrsh r4, [r5, r0]
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080475C4
	ldr r0, _080475C0
	b _080475C6
	.align 2, 0
_080475BC: .4byte 0x02017840
_080475C0: .4byte sub_8047230
_080475C4:
	ldr r0, _080475D0
_080475C6:
	str r0, [r5, 0x1C]
_080475C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080475D0: .4byte sub_8046C78
	thumb_func_end sub_8047254

	thumb_func_start sub_80472B0
sub_80472B0: @ 80475D4
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	str r4, [sp]
	bl sub_814086C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80472B0

	thumb_func_start sub_80472D8
sub_80472D8: @ 80475FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80472D8

	thumb_func_start CreatePokeballSprite
CreatePokeballSprite: @ 8047614
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	mov r9, r2
	mov r10, r3
	ldr r6, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r0, [sp, 0x2C]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080476E0
	bl LoadCompressedObjectPic
	ldr r0, _080476E4
	bl LoadCompressedObjectPalette
	ldr r0, _080476E8
	mov r1, r9
	mov r2, r10
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080476EC
	mov r8, r3
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r1, r4, r3
	strh r5, [r1, 0x2E]
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	add r2, r8
	ldrh r0, [r2, 0x20]
	strh r0, [r1, 0x38]
	ldrh r0, [r2, 0x22]
	strh r0, [r1, 0x3A]
	mov r0, r9
	strh r0, [r2, 0x20]
	mov r3, r10
	strh r3, [r2, 0x22]
	strh r7, [r1, 0x30]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x32]
	mov r3, sp
	ldrh r3, [r3, 0x30]
	strh r3, [r1, 0x34]
	ldr r3, [sp, 0x30]
	lsrs r0, r3, 16
	strh r0, [r1, 0x36]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r6
	strb r0, [r1, 0x5]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _080476F0
	str r0, [r4]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080476E0: .4byte gUnknown_0820A92C
_080476E4: .4byte gUnknown_0820A98C
_080476E8: .4byte gSpriteTemplate_820AAB4
_080476EC: .4byte gSprites
_080476F0: .4byte sub_80473D0
	thumb_func_end CreatePokeballSprite

	thumb_func_start sub_80473D0
sub_80473D0: @ 80476F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r1, [r6, 0x30]
	movs r2, 0x30
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _080477A0
	ldrh r0, [r6, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r4, [r6, 0x34]
	ldrh r0, [r6, 0x36]
	lsls r0, 16
	orrs r4, r0
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804772E
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _08047730
_0804772E:
	movs r5, 0
_08047730:
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r6, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r5, 0
	bl sub_80472B0
	movs r0, 0x1
	mov r1, r8
	adds r2, r4, 0
	bl sub_80472D8
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x30]
	ldr r0, _08047798
	str r0, [r6, 0x1C]
	ldr r0, _0804779C
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r4, r0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r4, 0x30]
	strh r5, [r6, 0x3C]
	b _080477A4
	.align 2, 0
_08047798: .4byte sub_804748C
_0804779C: .4byte gSprites
_080477A0:
	subs r0, r1, 0x1
	strh r0, [r6, 0x30]
_080477A4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80473D0

	thumb_func_start sub_804748C
sub_804748C: @ 80477B0
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r0, 0
	mov r12, r0
	movs r6, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080477DA
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080477DA:
	ldr r0, _08047868
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r5, r1, r0
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080477FC
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r1, 0x1
	mov r12, r1
_080477FC:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r7, 0x20
	ldrsh r1, [r4, r7]
	subs r0, r1
	movs r1, 0x3C
	ldrsh r2, [r4, r1]
	muls r0, r2
	cmp r0, 0
	bge _08047812
	adds r0, 0x7F
_08047812:
	asrs r0, 7
	ldrh r7, [r4, 0x20]
	adds r0, r7
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r7, 0x22
	ldrsh r1, [r4, r7]
	subs r0, r1
	muls r0, r2
	cmp r0, 0
	bge _0804782E
	adds r0, 0x7F
_0804782E:
	asrs r0, 7
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r3, [r5, 0x20]
	strh r0, [r5, 0x22]
	ldrh r2, [r4, 0x3C]
	movs r7, 0x3C
	ldrsh r0, [r4, r7]
	cmp r0, 0x7F
	bgt _08047870
	ldr r1, _0804786C
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08047854
	adds r0, 0x7
_08047854:
	asrs r0, 3
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	adds r1, r2, 0x4
	strh r1, [r4, 0x3C]
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	b _0804787E
	.align 2, 0
_08047868: .4byte gSprites
_0804786C: .4byte gSineTable
_08047870:
	ldrh r0, [r4, 0x38]
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x3A]
	strh r0, [r5, 0x22]
	strh r6, [r5, 0x24]
	strh r6, [r5, 0x26]
	movs r6, 0x1
_0804787E:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0804789C
	mov r2, r12
	cmp r2, 0
	beq _0804789C
	cmp r6, 0
	beq _0804789C
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
_0804789C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804748C

	thumb_func_start sub_8047580
sub_8047580: @ 80478A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	adds r6, r2, 0
	mov r8, r3
	ldr r5, [sp, 0x20]
	ldr r4, [sp, 0x24]
	ldr r0, [sp, 0x28]
	mov r9, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _08047948
	bl LoadCompressedObjectPic
	ldr r0, _0804794C
	bl LoadCompressedObjectPalette
	ldr r0, _08047950
	adds r1, r6, 0
	mov r2, r8
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08047954
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r6
	mov r1, r10
	strh r1, [r2, 0x2E]
	mov r4, r9
	strh r4, [r2, 0x30]
	strh r7, [r2, 0x32]
	mov r1, sp
	ldrh r1, [r1, 0x2C]
	strh r1, [r2, 0x34]
	ldr r4, [sp, 0x2C]
	lsrs r1, r4, 16
	strh r1, [r2, 0x36]
	movs r1, 0x3
	ands r5, r1
	lsls r5, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r5
	strb r1, [r2, 0x5]
	adds r6, 0x1C
	adds r3, r6
	ldr r1, _08047958
	str r1, [r3]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047948: .4byte gUnknown_0820A92C
_0804794C: .4byte gUnknown_0820A98C
_08047950: .4byte gSpriteTemplate_820AAB4
_08047954: .4byte gSprites
_08047958: .4byte sub_8047638
	thumb_func_end sub_8047580

	thumb_func_start sub_8047638
sub_8047638: @ 804795C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080479F4
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r5, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	orrs r5, r0
	adds r0, r4, 0
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r0, 0
	beq _08047996
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	b _08047998
_08047996:
	movs r6, 0
_08047998:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r3, r6, 0
	bl sub_80472B0
	movs r0, 0x1
	mov r1, r8
	adds r2, r5, 0
	bl sub_80472D8
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x30]
	ldr r0, _080479EC
	str r0, [r4, 0x1C]
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	ldr r0, _080479F0
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	bl AnimateSprite
	strh r5, [r4, 0x30]
	b _080479F8
	.align 2, 0
_080479EC: .4byte sub_80476E0
_080479F0: .4byte gSprites
_080479F4:
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
_080479F8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8047638

	thumb_func_start sub_80476E0
sub_80476E0: @ 8047A04
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _08047A1C
	movs r0, 0x3C
	bl PlaySE
_08047A1C:
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08047A58
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _08047A60
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r5, 0x38]
	ldr r0, _08047A5C
	str r0, [r5, 0x1C]
	b _08047A70
	.align 2, 0
_08047A58: .4byte gSprites
_08047A5C: .4byte sub_8047754
_08047A60:
	ldrh r0, [r4, 0x30]
	adds r0, 0x60
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	asrs r0, 8
	strh r0, [r4, 0x26]
_08047A70:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80476E0

	thumb_func_start sub_8047754
sub_8047754: @ 8047A78
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08047A8C
	ldr r0, _08047A90
	str r0, [r2, 0x1C]
_08047A8C:
	pop {r0}
	bx r0
	.align 2, 0
_08047A90: .4byte SpriteCallbackDummy
	thumb_func_end sub_8047754

	thumb_func_start obj_delete_and_free_associated_resources_
obj_delete_and_free_associated_resources_: @ 8047A94
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end obj_delete_and_free_associated_resources_

	thumb_func_start sub_804777C
sub_804777C: @ 8047AA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08047B20
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08047B24
	adds r4, r0, r6
	movs r1, 0
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x73
	strh r0, [r4, 0x24]
	strh r1, [r4, 0x26]
	ldr r0, _08047B28
	str r0, [r4, 0x1C]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08047AEE
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_08047AEE:
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08047B18
	ldr r0, _08047B2C
	str r0, [r4, 0x1C]
_08047B18:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047B20: .4byte gUnknown_03004340
_08047B24: .4byte gSprites
_08047B28: .4byte sub_8047830
_08047B2C: .4byte sub_804780C
	thumb_func_end sub_804777C

	thumb_func_start sub_804780C
sub_804780C: @ 8047B30
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _08047B4A
	movs r0, 0
	strh r0, [r1, 0x30]
	ldr r0, _08047B50
	str r0, [r1, 0x1C]
_08047B4A:
	pop {r0}
	bx r0
	.align 2, 0
_08047B50: .4byte sub_8047830
	thumb_func_end sub_804780C

	thumb_func_start sub_8047830
sub_8047830: @ 8047B54
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	ldrh r1, [r2, 0x30]
	subs r0, r1
	strh r0, [r2, 0x26]
	ldr r0, [r2, 0x24]
	cmp r0, 0
	bne _08047B72
	ldr r0, _08047B78
	str r0, [r2, 0x1C]
_08047B72:
	pop {r0}
	bx r0
	.align 2, 0
_08047B78: .4byte SpriteCallbackDummy
	thumb_func_end sub_8047830

	thumb_func_start sub_8047858
sub_8047858: @ 8047B7C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08047BB4
	adds r0, r5, 0
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08047BB8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r2
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _08047BBC
	adds r4, r0
	ldrb r0, [r4]
	strh r0, [r3, 0x30]
	adds r2, 0x1C
	adds r1, r2
	str r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047BB4: .4byte oamc_804BEB4
_08047BB8: .4byte gSprites
_08047BBC: .4byte gUnknown_03004340
	thumb_func_end sub_8047858

	thumb_func_start oamc_804BEB4
oamc_804BEB4: @ 8047BC0
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08047BFC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r0, [r3, 0x2E]
	movs r2, 0
	strh r0, [r1, 0x26]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _08047BF8
	strh r2, [r1, 0x24]
	strh r2, [r1, 0x26]
	adds r0, r3, 0
	bl DestroySprite
_08047BF8:
	pop {r0}
	bx r0
	.align 2, 0
_08047BFC: .4byte gSprites
	thumb_func_end oamc_804BEB4

	thumb_func_start sub_80478DC
sub_80478DC: @ 8047C00
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08047C5C
	lsls r6, r4, 3
	adds r5, r6, r0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08047C60
	cmp r0, r1
	bne _08047C28
	adds r0, r5, 0
	bl LoadCompressedObjectPic
	ldr r0, _08047C64
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_08047C28:
	cmp r4, 0x6
	beq _08047C54
	cmp r4, 0x6
	blt _08047C38
	cmp r4, 0xB
	bgt _08047C38
	cmp r4, 0xA
	bge _08047C54
_08047C38:
	ldr r1, _08047C5C
	lsls r0, r4, 3
	adds r0, r1
	ldrh r0, [r0, 0x6]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _08047C68
	lsrs r1, 11
	ldr r2, _08047C6C
	adds r1, r2
	bl LZDecompressVram
_08047C54:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047C5C: .4byte gUnknown_0820A92C
_08047C60: .4byte 0xffff0000
_08047C64: .4byte gUnknown_0820A98C
_08047C68: .4byte gUnknown_08D030D0
_08047C6C: .4byte 0x06010100
	thumb_func_end sub_80478DC

	thumb_func_start sub_804794C
sub_804794C: @ 8047C70
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _08047C94
	lsrs r4, 21
	adds r0, r4, r0
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldr r0, _08047C98
	adds r4, r0
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047C94: .4byte gUnknown_0820A92C
_08047C98: .4byte gUnknown_0820A98C
	thumb_func_end sub_804794C

	thumb_func_start sub_8047978
sub_8047978: @ 8047C9C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08047CC8
	ldr r1, _08047CC0
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08047CC4
	b _08047CD6
	.align 2, 0
_08047CC0: .4byte gUnknown_02024A6A
_08047CC4: .4byte gEnemyParty
_08047CC8:
	ldr r1, _08047CE8
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08047CEC
_08047CD6:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08047CE8: .4byte gUnknown_02024A6A
_08047CEC: .4byte gPlayerParty
	thumb_func_end sub_8047978

	.align 2, 0 @ Don't pad with nop.
