	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start de_sub_8040FE0
de_sub_8040FE0: @ 8040FE0
	push {lr}
	lsls r0, 24
	ldr r0, _08040FF0
	movs r1, 0xA9
	lsls r1, 1
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_08040FF0: .4byte gTrainerClassNames
	thumb_func_end de_sub_8040FE0

	thumb_func_start de_sub_8040FF4
de_sub_8040FF4: @ 8040FF4
	push {lr}
	lsls r0, 24
	ldr r0, _08041004
	ldr r1, _08041008
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_08041004: .4byte gTrainerClassNames
_08041008: .4byte 0x00000256
	thumb_func_end de_sub_8040FF4

	thumb_func_start de_sub_804100C
de_sub_804100C: @ 804100C
	push {lr}
	lsls r0, 24
	ldr r0, _0804101C
	ldr r1, _08041020
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0804101C: .4byte gTrainerClassNames
_08041020: .4byte 0x00000145
	thumb_func_end de_sub_804100C

	thumb_func_start de_sub_8041024
de_sub_8041024: @ 8041024
	push {r4-r6,lr}
	adds r2, r0, 0
	adds r6, r1, 0
	movs r0, 0x80
	lsls r0, 3
	cmp r2, r0
	beq _0804104A
	cmp r2, r0
	bgt _08041040
	movs r0, 0x80
	lsls r0, 1
	cmp r2, r0
	beq _08041064
	b _0804109C
_08041040:
	movs r0, 0x80
	lsls r0, 4
	cmp r2, r0
	beq _08041086
	b _0804109C
_0804104A:
	bl GetSecretBaseTrainerNameIndex
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08041060
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r2, r0, 31
	cmp r5, 0x1A
	beq _080410B8
	b _080410F8
	.align 2, 0
_08041060: .4byte 0x02017000
_08041064:
	bl de_sub_81364AC
	lsls r0, 24
	lsrs r4, r0, 24
	bl get_trainer_class_name_index
_08041070:
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r4, 0x1E
	beq _08041094
	adds r0, r4, 0
	subs r0, 0x3D
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _080410CC
	b _080410F8
_08041086:
	bl de_sub_81364F8
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8135FD8
	b _08041070
_08041094:
	movs r0, 0x1
	bl de_sub_8040FE0
	b _08041102
_0804109C:
	ldr r1, _080410C0
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 3
	adds r0, r1
	ldrb r5, [r0, 0x1]
	lsls r0, r6, 16
	lsrs r0, 16
	bl sub_803FC58
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r5, 0x1A
	bne _080410C4
_080410B8:
	adds r0, r2, 0
	bl de_sub_8040FE0
	b _08041102
	.align 2, 0
_080410C0: .4byte gTrainers
_080410C4:
	cmp r5, 0x2E
	bne _080410D4
	cmp r2, 0x1
	bne _080410D4
_080410CC:
	movs r0, 0x1
	bl de_sub_8040FF4
	b _08041102
_080410D4:
	cmp r5, 0x19
	bne _080410F8
	ldr r0, _080410F4
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x18]
	movs r2, 0
	cmp r0, 0x1
	bne _080410EA
	movs r2, 0x1
_080410EA:
	adds r0, r2, 0
	bl de_sub_804100C
	b _08041102
	.align 2, 0
_080410F4: .4byte gTrainers
_080410F8:
	movs r0, 0xD
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08041108
	adds r0, r1, r0
_08041102:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08041108: .4byte gTrainerClassNames
	thumb_func_end de_sub_8041024

	thumb_func_start de_sub_804110C
de_sub_804110C: @ 804110C
	adds r0, r1, 0
	bx lr
	thumb_func_end de_sub_804110C

	thumb_func_start Sin
Sin: @ 8041110
	lsls r1, 16
	asrs r1, 16
	ldr r2, _08041128
	lsls r0, 16
	asrs r0, 15
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	lsls r0, 8
	asrs r0, 16
	bx lr
	.align 2, 0
_08041128: .4byte gSineTable
	thumb_func_end Sin

	thumb_func_start Cos
Cos: @ 804112C
	lsls r1, 16
	asrs r1, 16
	ldr r2, _08041148
	lsls r0, 16
	asrs r0, 15
	adds r0, 0x80
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	lsls r0, 8
	asrs r0, 16
	bx lr
	.align 2, 0
_08041148: .4byte gSineTable
	thumb_func_end Cos

	thumb_func_start Sin2
Sin2: @ 804114C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
	movs r1, 0xB4
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0xB4
	bl __udivsi3
	movs r1, 0x1
	ands r0, r1
	ldr r1, _08041180
	lsls r4, 1
	adds r4, r1
	ldrh r1, [r4]
	cmp r0, 0
	bne _08041184
	lsls r0, r1, 16
	b _08041188
	.align 2, 0
_08041180: .4byte gSineDegreeTable
_08041184:
	lsls r0, r1, 16
	negs r0, r0
_08041188:
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end Sin2

	thumb_func_start Cos2
Cos2: @ 8041190
	push {lr}
	lsls r0, 16
	movs r1, 0xB4
	lsls r1, 15
	adds r0, r1
	lsrs r0, 16
	bl Sin2
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end Cos2

	.align 2, 0 @ Don't pad with nop.
