	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8124918
sub_8124918: @ 8124C98
	push {lr}
	movs r1, 0
	strb r1, [r0]
	strh r1, [r0, 0x2]
	adds r0, 0x4
	movs r2, 0xC0
	bl memset
	pop {r0}
	bx r0
	thumb_func_end sub_8124918

	thumb_func_start sub_812492C
sub_812492C: @ 8124CAC
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0xF
	bhi _08124CC8
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r3, r0
	ldrb r7, [r5, 0x4]
	lsrs r0, r7, 7
	cmp r0, 0
	beq _08124CCC
_08124CC8:
	movs r0, 0xFF
	b _08124D2A
_08124CCC:
	ldrh r0, [r2]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrh r0, [r2, 0x2]
	strh r0, [r5, 0xA]
	ldrb r0, [r2, 0x4]
	strb r0, [r5, 0xC]
	ldrb r0, [r2, 0x5]
	strb r0, [r5, 0xD]
	ldrb r0, [r2, 0x6]
	strb r0, [r5, 0xE]
	ldrb r3, [r2, 0x7]
	lsls r0, r3, 27
	lsrs r0, 27
	ldrb r2, [r5, 0xF]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	movs r0, 0x60
	ands r0, r3
	movs r2, 0x61
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	lsls r3, 24
	asrs r3, 31
	lsls r3, 7
	movs r0, 0x7F
	ands r1, r0
	orrs r1, r3
	strb r1, [r5, 0xF]
	subs r0, 0xFF
	ands r0, r7
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r5, 0x4]
	strb r4, [r5, 0x6]
	strb r4, [r5, 0x5]
	lsls r1, 24
	cmp r1, 0
	bge _08124D24
	movs r0, 0xFF
	b _08124D26
_08124D24:
	movs r0, 0x1
_08124D26:
	strb r0, [r5, 0x7]
	adds r0, r6, 0
_08124D2A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_812492C

	thumb_func_start unref_sub_81249B0
unref_sub_81249B0: @ 8124D30
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r1, 0
	cmp r4, 0xF
	bhi _08124D5C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r1, r2, r0
	ldrb r0, [r1, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _08124D5C
	adds r0, r1, 0x4
	movs r1, 0
	movs r2, 0xC
	bl memset
	adds r0, r4, 0
	b _08124D5E
_08124D5C:
	movs r0, 0xFF
_08124D5E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81249B0

	thumb_func_start sub_81249E4
sub_81249E4: @ 8124D64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r5, r0, 0
	movs r0, 0
	mov r12, r0
	ldrb r1, [r5, 0x8]
	cmp r12, r1
	bcc _08124D7C
	b _08124F14
_08124D7C:
	movs r7, 0x1F
	ldr r0, _08124DAC @ =0xfffffc1f
	mov r10, r0
	movs r1, 0x7D
	negs r1, r1
	mov r9, r1
	movs r0, 0x1F
	mov r8, r0
_08124D8C:
	ldrh r0, [r5, 0x6]
	add r0, r12
	lsls r0, 1
	ldr r1, _08124DB0 @ =gPlttBufferFaded
	adds r3, r0, r1
	ldr r1, _08124DB4 @ =gPlttBufferUnfaded
	adds r6, r0, r1
	ldrb r0, [r5]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _08124DB8
	cmp r0, 0x2
	beq _08124E16
	b _08124F02
	.align 2, 0
_08124DAC: .4byte 0xfffffc1f
_08124DB0: .4byte gPlttBufferFaded
_08124DB4: .4byte gPlttBufferUnfaded
_08124DB8:
	ldr r0, [r3]
	lsls r2, r0, 27
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _08124DDA
	lsrs r0, r2, 27
	adds r0, r1
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124DDA:
	ldr r0, [r3]
	lsls r2, r0, 22
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bhi _08124DFE
	lsrs r0, r2, 27
	adds r0, r1
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124DFE:
	ldr r0, [r3]
	lsls r2, r0, 17
	lsrs r0, r2, 27
	movs r1, 0x3
	ldrsb r1, [r5, r1]
	adds r0, r1
	cmp r0, 0x1F
	bls _08124E10
	b _08124F02
_08124E10:
	lsrs r0, r2, 27
	adds r0, r1
	b _08124EF4
_08124E16:
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	cmp r0, 0
	bge _08124E88
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	blt _08124E46
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124E46:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	blt _08124E70
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124E70:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	blt _08124F02
	b _08124EF0
_08124E88:
	ldr r0, [r3]
	lsls r4, r0, 27
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	bgt _08124EB0
	lsrs r0, r4, 27
	adds r0, r2
	ands r0, r7
	ldrb r2, [r3]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08124EB0:
	ldr r0, [r3]
	lsls r4, r0, 22
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 22
	lsrs r0, 27
	cmp r1, r0
	bgt _08124EDA
	lsrs r0, r4, 27
	adds r0, r2
	mov r1, r8
	ands r0, r1
	lsls r0, 5
	ldrh r2, [r3]
	mov r1, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
_08124EDA:
	ldr r0, [r3]
	lsls r4, r0, 17
	lsrs r1, r4, 27
	movs r2, 0x3
	ldrsb r2, [r5, r2]
	adds r1, r2
	ldr r0, [r6]
	lsls r0, 17
	lsrs r0, 27
	cmp r1, r0
	bgt _08124F02
_08124EF0:
	lsrs r0, r4, 27
	adds r0, r2
_08124EF4:
	ands r0, r7
	lsls r0, 2
	ldrb r2, [r3, 0x1]
	mov r1, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
_08124F02:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	ldrb r0, [r5, 0x8]
	cmp r12, r0
	bcs _08124F14
	b _08124D8C
_08124F14:
	ldrb r1, [r5, 0x2]
	adds r0, r1, 0x1
	strb r0, [r5, 0x2]
	ldrb r0, [r5, 0xB]
	lsls r0, 27
	lsls r1, 24
	asrs r0, 3
	cmp r1, r0
	beq _08124F2A
	movs r0, 0
	b _08124F5E
_08124F2A:
	movs r0, 0
	strb r0, [r5, 0x2]
	movs r0, 0x3
	ldrsb r0, [r5, r0]
	negs r0, r0
	strb r0, [r5, 0x3]
	ldrb r2, [r5]
	movs r1, 0x7F
	movs r0, 0x7F
	ands r0, r2
	cmp r0, 0x1
	bne _08124F4A
	lsls r0, r2, 25
	lsrs r0, 25
	adds r0, 0x1
	b _08124F50
_08124F4A:
	lsls r0, r2, 25
	lsrs r0, 25
	subs r0, 0x1
_08124F50:
	ands r0, r1
	movs r1, 0x80
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	movs r0, 0x1
_08124F5E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81249E4

	thumb_func_start sub_8124BEC
sub_8124BEC: @ 8124F6C
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r2, 0
	ldrb r0, [r3]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x1
	beq _08124F82
	cmp r0, 0x2
	beq _08124FB0
	b _08124FEA
_08124F82:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _08124FA2
	ldr r4, _08124FAC @ =gPlttBufferFaded
_08124F8A:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r3, 0x4]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _08124F8A
_08124FA2:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	adds r1, 0x1
	b _08124FDC
	.align 2, 0
_08124FAC: .4byte gPlttBufferFaded
_08124FB0:
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcs _08124FD4
	ldr r5, _08124FF4 @ =gPlttBufferFaded
	ldr r4, _08124FF8 @ =gPlttBufferUnfaded
_08124FBA:
	ldrh r0, [r3, 0x6]
	adds r0, r2
	lsls r0, 1
	adds r1, r0, r5
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3, 0x8]
	cmp r2, r0
	bcc _08124FBA
_08124FD4:
	ldrb r2, [r3]
	lsls r1, r2, 25
	lsrs r1, 25
	subs r1, 0x1
_08124FDC:
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08124FEA:
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08124FF4: .4byte gPlttBufferFaded
_08124FF8: .4byte gPlttBufferUnfaded
	thumb_func_end sub_8124BEC

	thumb_func_start task_tutorial_controls_fadein
task_tutorial_controls_fadein: @ 8124FFC
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _08125060
_08125008:
	ldrh r0, [r4, 0x2]
	asrs r0, r5
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08125056
	lsls r1, r5, 1
	adds r0, r1, r5
	lsls r3, r0, 2
	adds r2, r4, r3
	ldrb r0, [r2, 0x5]
	subs r0, 0x1
	strb r0, [r2, 0x5]
	lsls r0, 24
	lsrs r0, 24
	adds r6, r1, 0
	cmp r0, 0xFF
	bne _08125056
	ldrh r0, [r2, 0x8]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08125044
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_81249E4
	b _0812504C
_08125044:
	adds r0, r3, 0x4
	adds r0, r4, r0
	bl sub_8124BEC
_0812504C:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r4, r0
	ldrb r1, [r0, 0xD]
	strb r1, [r0, 0x5]
_08125056:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08125008
_08125060:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end task_tutorial_controls_fadein

	thumb_func_start sub_8124CE8
sub_8124CE8: @ 8125068
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r4, 0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r5, 0x1
	movs r7, 0x80
	negs r7, r7
_0812507E:
	adds r0, r6, 0
	asrs r0, r4
	ands r0, r5
	cmp r0, 0
	beq _081250AC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r2, r3, r0
	ldrb r0, [r2, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _081250AC
	adds r0, r5, 0
	lsls r0, r4
	ldrh r1, [r3, 0x2]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrb r1, [r2, 0x4]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r5
	strb r0, [r2, 0x4]
_081250AC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0812507E
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124CE8

	thumb_func_start sub_8124D3C
sub_8124D3C: @ 81250BC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r5, 0
	movs r3, 0x1
_081250CA:
	ldrh r0, [r6, 0x2]
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _08125132
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	adds r4, r6, r0
	ldrb r0, [r4, 0x4]
	lsrs r0, 7
	cmp r0, 0
	beq _08125132
	adds r0, r7, 0
	asrs r0, r5
	ands r0, r3
	cmp r0, 0
	beq _08125132
	ldrh r1, [r4, 0xA]
	lsls r1, 1
	ldr r0, _08125128 @ =gPlttBufferFaded
	adds r0, r1, r0
	ldr r2, _0812512C @ =gPlttBufferUnfaded
	adds r1, r2
	ldrb r2, [r4, 0xC]
	lsls r2, 1
	str r3, [sp]
	bl memcpy
	ldrb r0, [r4, 0x4]
	movs r2, 0x80
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x4]
	movs r0, 0
	strb r0, [r4, 0x6]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0xF]
	lsls r0, 24
	ldr r3, [sp]
	cmp r0, 0
	bge _08125130
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	b _08125132
	.align 2, 0
_08125128: .4byte gPlttBufferFaded
_0812512C: .4byte gPlttBufferUnfaded
_08125130:
	strb r3, [r4, 0x7]
_08125132:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _081250CA
	ldr r0, _08125148 @ =0x0000ffff
	cmp r7, r0
	bne _0812514C
	movs r0, 0
	strb r0, [r6]
	b _08125150
	.align 2, 0
_08125148: .4byte 0x0000ffff
_0812514C:
	ldrh r0, [r6, 0x2]
	bics r0, r7
_08125150:
	strh r0, [r6, 0x2]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124D3C

	thumb_func_start sub_8124DDC
sub_8124DDC: @ 812515C
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r6, r3
	cmp r1, r4
	bcs _081251A6
_08125184:
	lsls r0, r1, 6
	adds r2, r6, r0
	movs r0, 0
	adds r3, r1, 0x1
	cmp r0, r5
	bcs _0812519E
_08125190:
	strh r7, [r2]
	adds r2, 0x2
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bcc _08125190
_0812519E:
	lsls r0, r3, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bcc _08125184
_081251A6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124DDC

	thumb_func_start sub_8124E2C
sub_8124E2C: @ 81251AC
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r6, r4, 24
	movs r4, 0
	lsrs r3, 19
	adds r3, r2
	lsls r3, 1
	adds r7, r3
	cmp r4, r6
	bcs _081251F6
_081251D0:
	lsls r0, r4, 6
	adds r2, r7, r0
	movs r3, 0
	adds r4, 0x1
	cmp r3, r5
	bcs _081251EE
_081251DC:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r5
	bcc _081251DC
_081251EE:
	lsls r0, r4, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _081251D0
_081251F6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124E2C

	.align 2, 0 @ Don't pad with nop.
