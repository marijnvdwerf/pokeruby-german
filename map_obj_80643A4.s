	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80643A4
sub_80643A4: @ 80643A4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5]
	movs r0, 0xA0
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0806442C
	ldrb r0, [r5, 0x1]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0x1]
	ldr r3, _08064428 @ =gSprites
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
	b _0806442E
	.align 2, 0
_08064428: .4byte gSprites
_0806442C:
	movs r0, 0x1
_0806442E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80643A4

	thumb_func_start player_bitmagic
player_bitmagic: @ 8064434
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08064468 @ =gMapObjects
_0806443A:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064458
	ldr r0, _0806446C @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _08064458
	adds r0, r1, 0
	bl sub_80643A4
_08064458:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0806443A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064468: .4byte gMapObjects
_0806446C: .4byte gPlayerAvatar
	thumb_func_end player_bitmagic

	thumb_func_start sub_8064470
sub_8064470: @ 8064470
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080644AC @ =gMapObjects
_0806447A:
	cmp r4, r5
	beq _0806449C
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0806449C
	ldr r0, _080644B0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _0806449C
	adds r0, r1, 0
	bl sub_80643A4
_0806449C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0806447A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080644AC: .4byte gMapObjects
_080644B0: .4byte gPlayerAvatar
	thumb_func_end sub_8064470

	thumb_func_start npc_sync_anim_pause_bits
npc_sync_anim_pause_bits: @ 80644B4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r2, [r5]
	ldr r1, _08064514 @ =0x00000101
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	bne _0806450C
	ldrb r1, [r5, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldr r4, _08064518 @ =gSprites
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
_0806450C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064514: .4byte 0x00000101
_08064518: .4byte gSprites
	thumb_func_end npc_sync_anim_pause_bits

	thumb_func_start sub_806451C
sub_806451C: @ 806451C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08064548 @ =gMapObjects
_08064522:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064538
	adds r0, r1, 0
	bl npc_sync_anim_pause_bits
_08064538:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08064522
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064548: .4byte gMapObjects
	thumb_func_end sub_806451C

	thumb_func_start little_step
little_step: @ 806454C
	lsls r1, 24
	ldr r2, _08064568 @ =gDirectionToVector
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
_08064568: .4byte gDirectionToVector
	thumb_func_end little_step

	thumb_func_start sub_806456C
sub_806456C: @ 806456C
	lsls r1, 24
	ldr r2, _0806458C @ =gDirectionToVector
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
_0806458C: .4byte gDirectionToVector
	thumb_func_end sub_806456C

	thumb_func_start sub_8064590
sub_8064590: @ 8064590
	lsls r1, 24
	ldr r2, _080645B4 @ =gDirectionToVector
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
_080645B4: .4byte gDirectionToVector
	thumb_func_end sub_8064590

	thumb_func_start sub_80645B8
sub_80645B8: @ 80645B8
	lsls r1, 24
	ldr r2, _080645D8 @ =gDirectionToVector
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
_080645D8: .4byte gDirectionToVector
	thumb_func_end sub_80645B8

	thumb_func_start sub_80645DC
sub_80645DC: @ 80645DC
	lsls r1, 24
	ldr r2, _080645FC @ =gDirectionToVector
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
_080645FC: .4byte gDirectionToVector
	thumb_func_end sub_80645DC

	thumb_func_start oamt_npc_ministep_reset
oamt_npc_ministep_reset: @ 8064600
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
obj_npc_ministep: @ 8064614
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0806466C @ =gUnknown_08376194
	movs r0, 0x36
	ldrsh r2, [r4, r0]
	lsls r0, r2, 1
	adds r0, r5
	movs r3, 0x38
	ldrsh r1, [r4, r3]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _08064674
	ldr r1, _08064670 @ =gUnknown_08376180
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
	blt _08064674
	movs r0, 0x1
	b _08064676
	.align 2, 0
_0806466C: .4byte gUnknown_08376194
_08064670: .4byte gUnknown_08376180
_08064674:
	movs r0, 0
_08064676:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end obj_npc_ministep

	thumb_func_start sub_806467C
sub_806467C: @ 806467C
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_806467C

	thumb_func_start sub_806468C
sub_806468C: @ 806468C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x36]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080646AC
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
_080646AC:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _080646BE
	movs r0, 0
	b _080646C0
_080646BE:
	movs r0, 0x1
_080646C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806468C

	thumb_func_start sub_80646C8
sub_80646C8: @ 80646C8
	lsls r1, 24
	ldr r2, _080646E0 @ =gUnknown_083761D0
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
_080646E0: .4byte gUnknown_083761D0
	thumb_func_end sub_80646C8

	thumb_func_start sub_80646E4
sub_80646E4: @ 80646E4
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
sub_8064704: @ 8064704
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _08064784 @ =gUnknown_083761DC
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _08064788 @ =gUnknown_083761E2
	adds r0, r5, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08064736
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
_08064736:
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
	bne _08064770
	movs r6, 0x1
_08064770:
	cmp r1, r2
	blt _0806477A
	movs r0, 0
	strh r0, [r4, 0x26]
	movs r6, 0xFF
_0806477A:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08064784: .4byte gUnknown_083761DC
_08064788: .4byte gUnknown_083761E2
	thumb_func_end sub_8064704

	thumb_func_start sub_806478C
sub_806478C: @ 806478C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	ldr r1, _08064818 @ =gUnknown_083761E6
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0806481C @ =gUnknown_083761EC
	adds r0, r4, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080647C8
	ldrh r1, [r5, 0x3A]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080647C8
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl little_step
_080647C8:
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
	bne _08064802
	movs r6, 0x1
_08064802:
	cmp r1, r2
	blt _0806480C
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r6, 0xFF
_0806480C:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08064818: .4byte gUnknown_083761E6
_0806481C: .4byte gUnknown_083761EC
	thumb_func_end sub_806478C

	thumb_func_start sub_8064820
sub_8064820: @ 8064820
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8064820

	thumb_func_start sub_8064824
sub_8064824: @ 8064824
	push {lr}
	ldrh r1, [r0, 0x34]
	subs r1, 0x1
	strh r1, [r0, 0x34]
	lsls r1, 16
	cmp r1, 0
	beq _08064836
	movs r0, 0
	b _08064838
_08064836:
	movs r0, 0x1
_08064838:
	pop {r1}
	bx r1
	thumb_func_end sub_8064824

	thumb_func_start obj_anim_image_set_and_seek
obj_anim_image_set_and_seek: @ 806483C
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
sub_8064864: @ 8064864
	push {lr}
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08064876
	movs r0, 0
	b _08064878
_08064876:
	movs r0, 0x1
_08064878:
	pop {r1}
	bx r1
	thumb_func_end sub_8064864

	thumb_func_start sub_806487C
sub_806487C: @ 806487C
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
	beq _080648E4
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r4, r12
	adds r4, 0x28
	movs r0, 0
	ldrsb r0, [r4, r0]
	ldr r2, _080648DC @ =gSpriteCoordOffsetX
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
	ldr r2, _080648E0 @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r3, 0
	b _08064912
	.align 2, 0
_080648DC: .4byte gSpriteCoordOffsetX
_080648E0: .4byte gSpriteCoordOffsetY
_080648E4:
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
_08064912:
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
	bgt _0806493E
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0806494A
_0806493E:
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_0806494A:
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _0806495E
	lsls r0, r2, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0806496A
_0806495E:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0806496A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806487C

	thumb_func_start sub_8064970
sub_8064970: @ 8064970
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
sub_8064990: @ 8064990
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r2, 0
	ldr r6, _080649DC @ =gSprites
_0806499E:
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
	beq _080649E4
	ldr r1, [r4, 0x1C]
	ldr r0, _080649E0 @ =sub_8064970
	cmp r1, r0
	bne _080649E4
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _080649E4
	adds r0, r3, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	b _080649EE
	.align 2, 0
_080649DC: .4byte gSprites
_080649E0: .4byte sub_8064970
_080649E4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _0806499E
_080649EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8064990

	thumb_func_start oe_exec_and_other_stuff
oe_exec_and_other_stuff: @ 80649F4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08064A18 @ =gUnknown_0202FF84
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
_08064A18: .4byte gUnknown_0202FF84
	thumb_func_end oe_exec_and_other_stuff

	thumb_func_start DoShadowFieldEffect
DoShadowFieldEffect: @ 8064A1C
	push {lr}
	adds r1, r0, 0
	ldrb r2, [r1, 0x2]
	lsls r0, r2, 25
	cmp r0, 0
	blt _08064A34
	movs r0, 0x40
	orrs r0, r2
	strb r0, [r1, 0x2]
	movs r0, 0x3
	bl oe_exec_and_other_stuff
_08064A34:
	pop {r0}
	bx r0
	thumb_func_end DoShadowFieldEffect

	thumb_func_start DoRippleFieldEffect
DoRippleFieldEffect: @ 8064A38
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r2, _08064A70 @ =gUnknown_0202FF84
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
_08064A70: .4byte gUnknown_0202FF84
	thumb_func_end DoRippleFieldEffect

	.align 2, 0 @ Don't pad with nop.
