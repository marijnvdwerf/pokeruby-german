	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80643A4
sub_80643A4: @ 80646E4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5]
	movs r0, 0xA0
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0806476C
	ldrb r0, [r5, 0x1]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0x1]
	ldr r3, _08064768 @ =gSprites
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 7
	ldrb r2, [r5, 0x2]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x2]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	lsrs r1, 7
	ands r1, r4
	ldrb r2, [r5, 0x3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
	b _0806476E
	.align 2, 0
_08064768: .4byte gSprites
_0806476C:
	movs r0, 0x1
_0806476E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80643A4

	thumb_func_start player_bitmagic
player_bitmagic: @ 8064774
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080647A8 @ =gMapObjects
_0806477A:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064798
	ldr r0, _080647AC @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _08064798
	adds r0, r1, 0
	bl sub_80643A4
_08064798:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0806477A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080647A8: .4byte gMapObjects
_080647AC: .4byte gPlayerAvatar
	thumb_func_end player_bitmagic

	thumb_func_start sub_8064470
sub_8064470: @ 80647B0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080647EC @ =gMapObjects
_080647BA:
	cmp r4, r5
	beq _080647DC
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _080647DC
	ldr r0, _080647F0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _080647DC
	adds r0, r1, 0
	bl sub_80643A4
_080647DC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080647BA
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080647EC: .4byte gMapObjects
_080647F0: .4byte gPlayerAvatar
	thumb_func_end sub_8064470

	thumb_func_start npc_sync_anim_pause_bits
npc_sync_anim_pause_bits: @ 80647F4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r2, [r5]
	ldr r1, _08064854 @ =0x00000101
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	bne _0806484C
	ldrb r1, [r5, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldr r4, _08064858 @ =gSprites
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r5, 0x2]
	adds r1, 0x2C
	lsrs r2, 7
	lsls r2, 6
	ldrb r3, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrb r1, [r5, 0x3]
	lsls r1, 31
	lsrs r1, 31
	adds r2, 0x2C
	lsls r1, 7
	ldrb r3, [r2]
	movs r0, 0x7F
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0806484C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064854: .4byte 0x00000101
_08064858: .4byte gSprites
	thumb_func_end npc_sync_anim_pause_bits

	thumb_func_start sub_806451C
sub_806451C: @ 806485C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08064888 @ =gMapObjects
_08064862:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064878
	adds r0, r1, 0
	bl npc_sync_anim_pause_bits
_08064878:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08064862
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064888: .4byte gMapObjects
	thumb_func_end sub_806451C

	thumb_func_start little_step
little_step: @ 806488C
	lsls r1, 24
	ldr r2, _080648A8 @ =gDirectionToVector
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080648A8: .4byte gDirectionToVector
	thumb_func_end little_step

	thumb_func_start sub_806456C
sub_806456C: @ 80648AC
	lsls r1, 24
	ldr r2, _080648CC @ =gDirectionToVector
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 1
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 1
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080648CC: .4byte gDirectionToVector
	thumb_func_end sub_806456C

	thumb_func_start sub_8064590
sub_8064590: @ 80648D0
	lsls r1, 24
	ldr r2, _080648F4 @ =gDirectionToVector
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r3, r2, 1
	adds r2, r3
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r2, r1, 1
	adds r1, r2
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080648F4: .4byte gDirectionToVector
	thumb_func_end sub_8064590

	thumb_func_start sub_80645B8
sub_80645B8: @ 80648F8
	lsls r1, 24
	ldr r2, _08064918 @ =gDirectionToVector
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 2
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 2
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08064918: .4byte gDirectionToVector
	thumb_func_end sub_80645B8

	thumb_func_start sub_80645DC
sub_80645DC: @ 806491C
	lsls r1, 24
	ldr r2, _0806493C @ =gDirectionToVector
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 3
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 3
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0806493C: .4byte gDirectionToVector
	thumb_func_end sub_80645DC

	thumb_func_start oamt_npc_ministep_reset
oamt_npc_ministep_reset: @ 8064940
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r3, [r0, 0x38]
	bx lr
	thumb_func_end oamt_npc_ministep_reset

	thumb_func_start obj_npc_ministep
obj_npc_ministep: @ 8064954
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080649AC @ =gUnknown_08376194
	movs r0, 0x36
	ldrsh r2, [r4, r0]
	lsls r0, r2, 1
	adds r0, r5
	movs r3, 0x38
	ldrsh r1, [r4, r3]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080649B4
	ldr r1, _080649B0 @ =gUnknown_08376180
	lsls r0, r2, 2
	adds r0, r1
	movs r1, 0x38
	ldrsh r2, [r4, r1]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r5
	lsls r0, 16
	asrs r0, 16
	movs r3, 0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	blt _080649B4
	movs r0, 0x1
	b _080649B6
	.align 2, 0
_080649AC: .4byte gUnknown_08376194
_080649B0: .4byte gUnknown_08376180
_080649B4:
	movs r0, 0
_080649B6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end obj_npc_ministep

	thumb_func_start sub_806467C
sub_806467C: @ 80649BC
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_806467C

	thumb_func_start sub_806468C
sub_806468C: @ 80649CC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x36]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080649EC
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
_080649EC:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _080649FE
	movs r0, 0
	b _08064A00
_080649FE:
	movs r0, 0x1
_08064A00:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806468C

	thumb_func_start sub_80646C8
sub_80646C8: @ 8064A08
	lsls r1, 24
	ldr r2, _08064A20 @ =gUnknown_083761D0
	lsrs r1, 22
	adds r1, r2
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r1]
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_08064A20: .4byte gUnknown_083761D0
	thumb_func_end sub_80646C8

	thumb_func_start sub_80646E4
sub_80646E4: @ 8064A24
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r3, [r0, 0x38]
	strh r4, [r0, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80646E4

	thumb_func_start sub_8064704
sub_8064704: @ 8064A44
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _08064AC4 @ =gUnknown_083761DC
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _08064AC8 @ =gUnknown_083761E2
	adds r0, r5, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08064A76
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
_08064A76:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	adds r1, r5, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r4, 0x38]
	lsls r1, 24
	lsrs r1, 24
	bl sub_80646C8
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x3A]
	adds r1, 0x1
	strh r1, [r4, 0x3A]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, 16
	asrs r2, r0, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 17
	cmp r1, r0
	bne _08064AB0
	movs r6, 0x1
_08064AB0:
	cmp r1, r2
	blt _08064ABA
	movs r0, 0
	strh r0, [r4, 0x26]
	movs r6, 0xFF
_08064ABA:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08064AC4: .4byte gUnknown_083761DC
_08064AC8: .4byte gUnknown_083761E2
	thumb_func_end sub_8064704

	thumb_func_start sub_806478C
sub_806478C: @ 8064ACC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	ldr r1, _08064B58 @ =gUnknown_083761E6
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _08064B5C @ =gUnknown_083761EC
	adds r0, r4, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08064B08
	ldrh r1, [r5, 0x3A]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08064B08
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl little_step
_08064B08:
	movs r2, 0x3A
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r5, 0x38]
	lsls r1, 24
	lsrs r1, 24
	bl sub_80646C8
	strh r0, [r5, 0x26]
	ldrh r1, [r5, 0x3A]
	adds r1, 0x1
	strh r1, [r5, 0x3A]
	movs r2, 0x36
	ldrsh r0, [r5, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, 16
	asrs r2, r0, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 17
	cmp r1, r0
	bne _08064B42
	movs r6, 0x1
_08064B42:
	cmp r1, r2
	blt _08064B4C
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r6, 0xFF
_08064B4C:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08064B58: .4byte gUnknown_083761E6
_08064B5C: .4byte gUnknown_083761EC
	thumb_func_end sub_806478C

	thumb_func_start sub_8064820
sub_8064820: @ 8064B60
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8064820

	thumb_func_start sub_8064824
sub_8064824: @ 8064B64
	push {lr}
	ldrh r1, [r0, 0x34]
	subs r1, 0x1
	strh r1, [r0, 0x34]
	lsls r1, 16
	cmp r1, 0
	beq _08064B76
	movs r0, 0
	b _08064B78
_08064B76:
	movs r0, 0x1
_08064B78:
	pop {r1}
	bx r1
	thumb_func_end sub_8064824

	thumb_func_start obj_anim_image_set_and_seek
obj_anim_image_set_and_seek: @ 8064B7C
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	adds r3, r0, 0
	adds r3, 0x2A
	strb r1, [r3]
	adds r4, r0, 0
	adds r4, 0x2C
	ldrb r3, [r4]
	movs r1, 0x41
	negs r1, r1
	ands r1, r3
	strb r1, [r4]
	adds r1, r2, 0
	bl SeekSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end obj_anim_image_set_and_seek

	thumb_func_start sub_8064864
sub_8064864: @ 8064BA4
	push {lr}
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08064BB6
	movs r0, 0
	b _08064BB8
_08064BB6:
	movs r0, 0x1
_08064BB8:
	pop {r1}
	bx r1
	thumb_func_end sub_8064864

	thumb_func_start sub_806487C
sub_806487C: @ 8064BBC
	push {r4-r6,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	mov r3, r12
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08064C24
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r4, r12
	adds r4, 0x28
	movs r0, 0
	ldrsb r0, [r4, r0]
	ldr r2, _08064C1C @ =gSpriteCoordOffsetX
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r12
	ldrh r1, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	subs r3, 0x15
	movs r0, 0
	ldrsb r0, [r3, r0]
	ldr r2, _08064C20 @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r3, 0
	b _08064C52
	.align 2, 0
_08064C1C: .4byte gSpriteCoordOffsetX
_08064C20: .4byte gSpriteCoordOffsetY
_08064C24:
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r3, r12
	adds r3, 0x28
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r12
	ldrh r1, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	mov r2, r12
	adds r2, 0x29
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r3, 0
_08064C52:
	ldrb r0, [r4]
	lsls r0, 24
	asrs r0, 25
	subs r0, r6, r0
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r0, [r2]
	lsls r0, 24
	asrs r0, 25
	subs r0, r5, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _08064C7E
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08064C8A
_08064C7E:
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_08064C8A:
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _08064C9E
	lsls r0, r2, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08064CAA
_08064C9E:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08064CAA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806487C

	thumb_func_start sub_8064970
sub_8064970: @ 8064CB0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8064970

	thumb_func_start sub_8064990
sub_8064990: @ 8064CD0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r2, 0
	ldr r6, _08064D1C @ =gSprites
_08064CDE:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r6
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08064D24
	ldr r1, [r4, 0x1C]
	ldr r0, _08064D20 @ =sub_8064970
	cmp r1, r0
	bne _08064D24
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _08064D24
	adds r0, r3, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	b _08064D2E
	.align 2, 0
_08064D1C: .4byte gSprites
_08064D20: .4byte sub_8064970
_08064D24:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08064CDE
_08064D2E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8064990

	thumb_func_start oe_exec_and_other_stuff
oe_exec_and_other_stuff: @ 8064D34
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08064D58 @ =gUnknown_0202FF84
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	adds r0, r4, 0
	bl FieldEffectStart
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064D58: .4byte gUnknown_0202FF84
	thumb_func_end oe_exec_and_other_stuff

	thumb_func_start DoShadowFieldEffect
DoShadowFieldEffect: @ 8064D5C
	push {lr}
	adds r1, r0, 0
	ldrb r2, [r1, 0x2]
	lsls r0, r2, 25
	cmp r0, 0
	blt _08064D74
	movs r0, 0x40
	orrs r0, r2
	strb r0, [r1, 0x2]
	movs r0, 0x3
	bl oe_exec_and_other_stuff
_08064D74:
	pop {r0}
	bx r0
	thumb_func_end DoShadowFieldEffect

	thumb_func_start DoRippleFieldEffect
DoRippleFieldEffect: @ 8064D78
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r2, _08064DB0 @ =gUnknown_0202FF84
	movs r3, 0x20
	ldrsh r1, [r4, r3]
	str r1, [r2]
	movs r3, 0x22
	ldrsh r1, [r4, r3]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	adds r1, r0
	subs r1, 0x2
	str r1, [r2, 0x4]
	movs r0, 0x97
	str r0, [r2, 0x8]
	movs r0, 0x3
	str r0, [r2, 0xC]
	movs r0, 0x5
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064DB0: .4byte gUnknown_0202FF84
	thumb_func_end DoRippleFieldEffect

	.align 2, 0 @ Don't pad with nop.
