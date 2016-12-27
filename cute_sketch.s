	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FC7A0
sub_80FC7A0: @ 80FCB50
	push {lr}
	ldr r2, _080FCB98 @ =gUnknown_03005DEC
	ldr r1, [r0, 0x4]
	str r1, [r2]
	ldr r2, _080FCB9C @ =gUnknown_03005E00
	ldrb r1, [r0, 0x1F]
	strb r1, [r2]
	ldr r2, _080FCBA0 @ =gUnknown_03005DE8
	ldrb r1, [r0, 0x19]
	strb r1, [r2]
	ldr r2, _080FCBA4 @ =gUnknown_03005DFC
	ldrb r1, [r0, 0x1A]
	strb r1, [r2]
	ldr r2, _080FCBA8 @ =gUnknown_03005DF8
	ldrb r1, [r0, 0x1B]
	strb r1, [r2]
	ldr r2, _080FCBAC @ =gUnknown_03005DF0
	ldrb r1, [r0, 0x1C]
	strb r1, [r2]
	ldr r2, _080FCBB0 @ =gUnknown_03005E04
	ldrb r1, [r0, 0x1D]
	strb r1, [r2]
	ldr r2, _080FCBB4 @ =gUnknown_03005DF4
	ldrb r1, [r0, 0x1E]
	strb r1, [r2]
	ldrb r0, [r0]
	subs r0, 0x2
	cmp r0, 0x22
	bls _080FCB8C
	b _080FCCD8
_080FCB8C:
	lsls r0, 2
	ldr r1, _080FCBB8 @ =_080FCBBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FCB98: .4byte gUnknown_03005DEC
_080FCB9C: .4byte gUnknown_03005E00
_080FCBA0: .4byte gUnknown_03005DE8
_080FCBA4: .4byte gUnknown_03005DFC
_080FCBA8: .4byte gUnknown_03005DF8
_080FCBAC: .4byte gUnknown_03005DF0
_080FCBB0: .4byte gUnknown_03005E04
_080FCBB4: .4byte gUnknown_03005DF4
_080FCBB8: .4byte _080FCBBC
	.align 2, 0
_080FCBBC:
	.4byte _080FCC48
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCA8
	.4byte _080FCCD8
	.4byte _080FCC4E
	.4byte _080FCC54
	.4byte _080FCC68
	.4byte _080FCC7A
	.4byte _080FCCD8
	.4byte _080FCC90
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCC96
	.4byte _080FCC74
	.4byte _080FCC9C
	.4byte _080FCCA2
	.4byte _080FCCD8
	.4byte _080FCCD8
	.4byte _080FCCB4
_080FCC48:
	bl sub_80FCAA4
	b _080FCCD8
_080FCC4E:
	bl sub_80FCB5C
	b _080FCCD8
_080FCC54:
	bl sub_80FCD54
	ldr r0, _080FCC64 @ =gUnknown_03005E00
	ldrb r0, [r0]
	bl sub_80FCC18
	b _080FCCD8
	.align 2, 0
_080FCC64: .4byte gUnknown_03005E00
_080FCC68:
	bl sub_80FCD54
	bl sub_80FCEA4
	bl sub_80FCCBC
_080FCC74:
	bl sub_80FCEA4
	b _080FCCD8
_080FCC7A:
	bl sub_80FCD54
	bl sub_80FD06C
	bl sub_80FD06C
	bl sub_80FD114
	bl sub_80FCCBC
	b _080FCCD8
_080FCC90:
	bl sub_80FCF3C
	b _080FCCD8
_080FCC96:
	bl sub_80FCD54
	b _080FCCD8
_080FCC9C:
	bl sub_80FD06C
	b _080FCCD8
_080FCCA2:
	bl sub_80FD114
	b _080FCCD8
_080FCCA8:
	bl sub_80FCAC4
	movs r0, 0x3
	bl sub_80FC92C
	b _080FCCD8
_080FCCB4:
	bl sub_80FCD54
	bl sub_80FD06C
	bl sub_80FD114
	bl sub_80FCCBC
	bl sub_80FCB5C
	bl sub_80FCB5C
	movs r0, 0x2
	bl sub_80FC92C
	movs r0, 0x4
	bl sub_80FC9E4
_080FCCD8:
	pop {r0}
	bx r0
	thumb_func_end sub_80FC7A0

	thumb_func_start sub_80FC92C
sub_80FC92C: @ 80FCCDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r2, 0
	ldr r0, _080FCD7C @ =gUnknown_03005DF0
	mov r8, r0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCD6E
	ldr r1, _080FCD80 @ =gUnknown_03005DF8
	mov r12, r1
	ldr r3, _080FCD84 @ =gUnknown_03005E04
	mov r10, r3
	ldr r0, _080FCD88 @ =gUnknown_03005DE8
	mov r9, r0
_080FCD02:
	ldr r1, _080FCD8C @ =gUnknown_03005DFC
	ldrb r0, [r1]
	adds r0, r2
	mov r3, r10
	ldrb r1, [r3]
	muls r0, r1
	lsls r0, 1
	ldr r3, _080FCD90 @ =gUnknown_03005DEC
	ldr r1, [r3]
	adds r1, r0
	mov r3, r9
	ldrb r0, [r3]
	lsls r0, 1
	adds r3, r1, r0
	movs r4, 0
	adds r5, r2, 0x1
	mov r0, r12
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080FCD62
	movs r6, 0x80
	lsls r6, 8
_080FCD2E:
	ldrh r1, [r3]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _080FCD52
	movs r0, 0x1F
	ands r0, r1
	adds r0, r7
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _080FCD48
	movs r2, 0x1F
_080FCD48:
	lsls r0, r2, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
_080FCD52:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r3, 0x2
	mov r1, r12
	ldrb r1, [r1]
	cmp r4, r1
	bcc _080FCD2E
_080FCD62:
	lsls r0, r5, 24
	lsrs r2, r0, 24
	mov r3, r8
	ldrb r3, [r3]
	cmp r2, r3
	bcc _080FCD02
_080FCD6E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCD7C: .4byte gUnknown_03005DF0
_080FCD80: .4byte gUnknown_03005DF8
_080FCD84: .4byte gUnknown_03005E04
_080FCD88: .4byte gUnknown_03005DE8
_080FCD8C: .4byte gUnknown_03005DFC
_080FCD90: .4byte gUnknown_03005DEC
	thumb_func_end sub_80FC92C

	thumb_func_start sub_80FC9E4
sub_80FC9E4: @ 80FCD94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080FCE3C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCE2C
	ldr r1, _080FCE40 @ =gUnknown_03005DF8
	mov r10, r1
_080FCDB2:
	ldr r3, _080FCE44 @ =gUnknown_03005DFC
	ldrb r0, [r3]
	adds r0, r2
	ldr r3, _080FCE48 @ =gUnknown_03005E04
	ldrb r1, [r3]
	muls r0, r1
	lsls r0, 1
	ldr r3, _080FCE4C @ =gUnknown_03005DEC
	ldr r1, [r3]
	adds r1, r0
	ldr r3, _080FCE50 @ =gUnknown_03005DE8
	ldrb r0, [r3]
	lsls r0, 1
	adds r3, r1, r0
	movs r5, 0
	adds r7, r2, 0x1
	mov r0, r10
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FCE20
	movs r1, 0x80
	lsls r1, 8
	mov r9, r1
	movs r0, 0x1F
	mov r12, r0
	mov r1, r8
	subs r6, r0, r1
_080FCDE8:
	ldrh r1, [r3]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080FCE10
	movs r4, 0x1F
	mov r2, r12
	ands r2, r1
	cmp r2, r6
	ble _080FCE06
	mov r1, r8
	lsrs r0, r1, 1
	subs r0, r4, r0
	lsls r0, 24
	lsrs r2, r0, 24
_080FCE06:
	lsls r0, r2, 10
	lsls r1, r2, 5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r3]
_080FCE10:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, 0x2
	mov r0, r10
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FCDE8
_080FCE20:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r1, _080FCE3C @ =gUnknown_03005DF0
	ldrb r1, [r1]
	cmp r2, r1
	bcc _080FCDB2
_080FCE2C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE3C: .4byte gUnknown_03005DF0
_080FCE40: .4byte gUnknown_03005DF8
_080FCE44: .4byte gUnknown_03005DFC
_080FCE48: .4byte gUnknown_03005E04
_080FCE4C: .4byte gUnknown_03005DEC
_080FCE50: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FC9E4

	thumb_func_start sub_80FCAA4
sub_80FCAA4: @ 80FCE54
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080FCE70 @ =0x00000c7f
_080FCE5A:
	lsls r0, r4, 16
	lsrs r0, 16
	bl sub_80FD1C8
	adds r4, 0x1
	cmp r4, r5
	bls _080FCE5A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE70: .4byte 0x00000c7f
	thumb_func_end sub_80FCAA4

	thumb_func_start sub_80FCAC4
sub_80FCAC4: @ 80FCE74
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FCEF4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCEE6
	ldr r0, _080FCEF8 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FCEFC @ =gUnknown_03005DF8
_080FCE8C:
	ldr r0, _080FCF00 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FCF04 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FCF08 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FCEDA
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FCEB8:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FCECC
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80FD39C
	strh r0, [r4]
	ldr r3, [sp]
_080FCECC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FCEB8
_080FCEDA:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FCEF4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCE8C
_080FCEE6:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCEF4: .4byte gUnknown_03005DF0
_080FCEF8: .4byte gUnknown_03005DEC
_080FCEFC: .4byte gUnknown_03005DF8
_080FCF00: .4byte gUnknown_03005DFC
_080FCF04: .4byte gUnknown_03005E04
_080FCF08: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCAC4

	thumb_func_start sub_80FCB5C
sub_80FCB5C: @ 80FCF0C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r2, 0
	ldr r0, _080FCFB0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCFA2
	ldr r0, _080FCFB4 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FCFB8 @ =gUnknown_03005E04
_080FCF24:
	ldr r0, _080FCFBC @ =gUnknown_03005DFC
	ldrb r1, [r0]
	ldrb r0, [r3]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FCFC0 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	adds r0, r2
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	ldrb r0, [r3]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FCFC4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r7, r2, 0x1
	cmp r5, r0
	bge _080FCF96
	ldr r6, _080FCFB8 @ =gUnknown_03005E04
_080FCF5A:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FCF80
	ldrb r2, [r6]
	lsls r2, 1
	adds r2, r4, r2
	mov r0, sp
	adds r1, r4, 0
	str r3, [sp, 0x4]
	bl sub_80FD68C
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r3, [sp, 0x4]
_080FCF80:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FCFC4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080FCF5A
_080FCF96:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FCFB0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCF24
_080FCFA2:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCFB0: .4byte gUnknown_03005DF8
_080FCFB4: .4byte gUnknown_03005DEC
_080FCFB8: .4byte gUnknown_03005E04
_080FCFBC: .4byte gUnknown_03005DFC
_080FCFC0: .4byte gUnknown_03005DE8
_080FCFC4: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FCB5C

	thumb_func_start sub_80FCC18
sub_80FCC18: @ 80FCFC8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080FD054 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD044
	ldr r0, _080FD058 @ =gUnknown_03005DEC
	mov r9, r0
	ldr r3, _080FD05C @ =gUnknown_03005DF8
_080FCFE8:
	ldr r0, _080FD060 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FD064 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r9
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FD068 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FD038
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FD014:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FD02A
	adds r0, r4, 0
	mov r1, r8
	str r3, [sp]
	bl sub_80FD3D0
	strh r0, [r4]
	ldr r3, [sp]
_080FD02A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FD014
_080FD038:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD054 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCFE8
_080FD044:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD054: .4byte gUnknown_03005DF0
_080FD058: .4byte gUnknown_03005DEC
_080FD05C: .4byte gUnknown_03005DF8
_080FD060: .4byte gUnknown_03005DFC
_080FD064: .4byte gUnknown_03005E04
_080FD068: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCC18

	thumb_func_start sub_80FCCBC
sub_80FCCBC: @ 80FD06C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FD0EC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD0DE
	ldr r0, _080FD0F0 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FD0F4 @ =gUnknown_03005DF8
_080FD084:
	ldr r0, _080FD0F8 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FD0FC @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FD100 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FD0D2
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FD0B0:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FD0C4
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80FD4DC
	strh r0, [r4]
	ldr r3, [sp]
_080FD0C4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FD0B0
_080FD0D2:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD0EC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FD084
_080FD0DE:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD0EC: .4byte gUnknown_03005DF0
_080FD0F0: .4byte gUnknown_03005DEC
_080FD0F4: .4byte gUnknown_03005DF8
_080FD0F8: .4byte gUnknown_03005DFC
_080FD0FC: .4byte gUnknown_03005E04
_080FD100: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCCBC

	thumb_func_start sub_80FCD54
sub_80FCD54: @ 80FD104
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	ldr r0, _080FD23C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r7, r0
	bcs _080FD190
	ldr r0, _080FD240 @ =gUnknown_03005DEC
	mov r8, r0
_080FD11A:
	ldr r0, _080FD244 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r7
	ldr r0, _080FD248 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r2, r8
	ldr r1, [r2]
	adds r1, r0
	ldr r0, _080FD24C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r5, r1, r0
	adds r4, r5, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80FD50C
	strh r0, [r5]
	movs r6, 0x1
	adds r5, r4, 0
	ldr r0, _080FD250 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	adds r7, 0x1
	cmp r6, r0
	bge _080FD17A
_080FD152:
	adds r4, r5, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80FD50C
	strh r0, [r5]
	subs r1, r5, 0x2
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r5, r4, 0
	ldr r0, _080FD250 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	blt _080FD152
_080FD17A:
	subs r1, r5, 0x2
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	lsls r0, r7, 24
	lsrs r7, r0, 24
	ldr r0, _080FD23C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080FD11A
_080FD190:
	movs r6, 0
	ldr r0, _080FD250 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080FD230
	ldr r3, _080FD240 @ =gUnknown_03005DEC
	mov r9, r3
	ldr r0, _080FD248 @ =gUnknown_03005E04
	mov r8, r0
_080FD1A2:
	ldr r0, _080FD244 @ =gUnknown_03005DFC
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	muls r0, r1
	lsls r0, 1
	mov r3, r9
	ldr r2, [r3]
	adds r2, r0
	ldr r0, _080FD24C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	adds r0, r6
	lsls r0, 1
	adds r5, r2, r0
	lsls r1, 1
	adds r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	movs r7, 0x1
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	adds r5, r0
	ldr r0, _080FD23C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, 0x1
	cmp r7, r0
	bge _080FD214
	ldr r4, _080FD248 @ =gUnknown_03005E04
_080FD1E2:
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	ldrb r1, [r4]
	lsls r1, 1
	subs r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	lsls r0, 1
	adds r5, r0
	ldr r0, _080FD23C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r7, r0
	blt _080FD1E2
_080FD214:
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 1
	subs r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	lsls r0, r6, 24
	lsrs r6, r0, 24
	ldr r0, _080FD250 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080FD1A2
_080FD230:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD23C: .4byte gUnknown_03005DF0
_080FD240: .4byte gUnknown_03005DEC
_080FD244: .4byte gUnknown_03005DFC
_080FD248: .4byte gUnknown_03005E04
_080FD24C: .4byte gUnknown_03005DE8
_080FD250: .4byte gUnknown_03005DF8
	thumb_func_end sub_80FCD54

	thumb_func_start sub_80FCEA4
sub_80FCEA4: @ 80FD254
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FD2D4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD2C6
	ldr r0, _080FD2D8 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FD2DC @ =gUnknown_03005DF8
_080FD26C:
	ldr r0, _080FD2E0 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FD2E4 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FD2E8 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FD2BA
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FD298:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FD2AC
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80FD53C
	strh r0, [r4]
	ldr r3, [sp]
_080FD2AC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FD298
_080FD2BA:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD2D4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FD26C
_080FD2C6:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD2D4: .4byte gUnknown_03005DF0
_080FD2D8: .4byte gUnknown_03005DEC
_080FD2DC: .4byte gUnknown_03005DF8
_080FD2E0: .4byte gUnknown_03005DFC
_080FD2E4: .4byte gUnknown_03005E04
_080FD2E8: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCEA4

	thumb_func_start sub_80FCF3C
sub_80FCF3C: @ 80FD2EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080FD418 @ =gUnknown_03005DEC
	ldr r4, [r0]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	adds r5, r0, 0
_080FD304:
	movs r7, 0
_080FD306:
	ldrh r0, [r4]
	ands r0, r5
	cmp r0, 0
	bne _080FD316
	adds r0, r4, 0
	bl sub_80FD53C
	strh r0, [r4]
_080FD316:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, 0x2
	cmp r7, 0x3F
	bls _080FD306
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _080FD304
	movs r7, 0
	ldr r1, _080FD418 @ =gUnknown_03005DEC
	mov r10, r1
	mov r3, sp
	movs r2, 0x80
	lsls r2, 8
	mov r9, r2
_080FD33A:
	lsls r0, r7, 1
	mov r2, r10
	ldr r1, [r2]
	adds r4, r1, r0
	ldrh r1, [r4]
	strh r1, [r3]
	mov r1, r9
	strh r1, [r4]
	movs r6, 0x1
	adds r4, 0x80
	adds r5, r0, 0
_080FD350:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	ands r0, r2
	cmp r0, 0
	bne _080FD370
	adds r2, r4, 0
	adds r2, 0x80
	mov r0, sp
	adds r1, r4, 0
	str r3, [sp, 0x4]
	bl sub_80FD7AC
	strh r0, [r4]
	ldr r3, [sp, 0x4]
	strh r0, [r3]
_080FD370:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, 0x80
	cmp r6, 0x3E
	bls _080FD350
	mov r0, r9
	strh r0, [r4]
	mov r1, r10
	ldr r0, [r1]
	adds r4, r0, r5
	ldrh r0, [r4]
	strh r0, [r3]
	mov r2, r9
	strh r2, [r4]
	movs r6, 0x1
	adds r4, 0x80
	movs r0, 0x80
	lsls r0, 8
	mov r8, r0
_080FD398:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	adds r5, r4, 0
	adds r5, 0x80
	cmp r0, 0
	bne _080FD3B8
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	str r3, [sp, 0x4]
	bl sub_80FD7AC
	strh r0, [r4]
	ldr r3, [sp, 0x4]
	strh r0, [r3]
_080FD3B8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r5, 0
	cmp r6, 0x3E
	bls _080FD398
	mov r2, r9
	strh r2, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3F
	bls _080FD33A
	ldr r0, _080FD418 @ =gUnknown_03005DEC
	ldr r4, [r0]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	mov r8, r0
_080FD3DE:
	movs r7, 0
	adds r5, r6, 0x1
_080FD3E2:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080FD3F4
	adds r0, r4, 0
	bl sub_80FD53C
	strh r0, [r4]
_080FD3F4:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, 0x2
	cmp r7, 0x3F
	bls _080FD3E2
	lsls r0, r5, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _080FD3DE
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD418: .4byte gUnknown_03005DEC
	thumb_func_end sub_80FCF3C

	thumb_func_start sub_80FD06C
sub_80FD06C: @ 80FD41C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FD4AC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD49E
	ldr r0, _080FD4B0 @ =gUnknown_03005DEC
	mov r8, r0
_080FD432:
	ldr r0, _080FD4B4 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FD4B8 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FD4BC @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	adds r4, 0x2
	ldr r0, _080FD4C0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, r2, 0x1
	cmp r5, r0
	bge _080FD492
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FD46A:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FD480
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FD568
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
_080FD480:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FD4C0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080FD46A
_080FD492:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD4AC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FD432
_080FD49E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD4AC: .4byte gUnknown_03005DF0
_080FD4B0: .4byte gUnknown_03005DEC
_080FD4B4: .4byte gUnknown_03005DFC
_080FD4B8: .4byte gUnknown_03005E04
_080FD4BC: .4byte gUnknown_03005DE8
_080FD4C0: .4byte gUnknown_03005DF8
	thumb_func_end sub_80FD06C

	thumb_func_start sub_80FD114
sub_80FD114: @ 80FD4C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r2, 0
	ldr r0, _080FD560 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD552
	ldr r0, _080FD564 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r7, _080FD568 @ =gUnknown_03005E04
_080FD4DC:
	ldr r0, _080FD56C @ =gUnknown_03005DFC
	ldrb r1, [r0]
	ldrb r0, [r7]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FD570 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	adds r0, r2
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	ldrb r0, [r7]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FD574 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, r2, 0x1
	cmp r5, r0
	bge _080FD546
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FD516:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	bne _080FD530
	mov r0, sp
	adds r1, r4, 0
	str r2, [sp, 0x4]
	bl sub_80FD568
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r2, [sp, 0x4]
_080FD530:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r7]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FD574 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080FD516
_080FD546:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD560 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FD4DC
_080FD552:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD560: .4byte gUnknown_03005DF8
_080FD564: .4byte gUnknown_03005DEC
_080FD568: .4byte gUnknown_03005E04
_080FD56C: .4byte gUnknown_03005DFC
_080FD570: .4byte gUnknown_03005DE8
_080FD574: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FD114

	thumb_func_start sub_80FD1C8
sub_80FD1C8: @ 80FD578
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r2, sp
	ldr r3, _080FD5E4 @ =gUnknown_083E7A50
	lsls r1, r0, 1
	add r1, r10
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	mov r5, sp
	adds r0, r3, 0x2
	adds r1, r0
	ldrb r4, [r1]
	lsls r2, r4, 24
	lsrs r1, r2, 27
	movs r0, 0x7
	ands r1, r0
	strh r1, [r5, 0x2]
	lsrs r2, 25
	mov r9, r2
	movs r0, 0x3
	ands r2, r0
	mov r9, r2
	movs r5, 0x1
	ands r5, r4
	movs r4, 0x1
	mov r8, r4
	cmp r8, r1
	bcs _080FD62A
	mov r3, sp
_080FD5CA:
	cmp r5, 0
	bne _080FD5E8
	mov r0, r8
	lsls r2, r0, 2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	mov r4, r8
	subs r0, r4
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	add r0, r8
	b _080FD5FA
	.align 2, 0
_080FD5E4: .4byte gUnknown_083E7A50
_080FD5E8:
	mov r0, r8
	lsls r2, r0, 2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
_080FD5FA:
	strb r0, [r1, 0x1]
	add r2, sp
	ldrb r0, [r2]
	cmp r0, 0x3F
	bhi _080FD60A
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3F
	bls _080FD612
_080FD60A:
	mov r0, r8
	subs r0, 0x1
	strh r0, [r3, 0x2]
	b _080FD62A
_080FD612:
	ldrh r0, [r3, 0x2]
	mov r1, r8
	subs r0, r1
	strh r0, [r2, 0x2]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r0, [r3, 0x2]
	cmp r8, r0
	bcc _080FD5CA
_080FD62A:
	movs r2, 0
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r8, r0
	bcc _080FD638
	b _080FD73A
_080FD638:
	movs r3, 0x1F
_080FD63A:
	ldr r1, _080FD698 @ =gUnknown_03005DEC
	mov r4, r8
	lsls r0, r4, 2
	mov r2, sp
	adds r6, r2, r0
	ldrb r0, [r6, 0x1]
	lsls r0, 7
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r6]
	lsls r0, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080FD726
	movs r7, 0x1F
	ands r7, r1
	lsls r0, r1, 16
	lsrs r5, r0, 21
	ands r5, r3
	lsrs r4, r0, 26
	ands r4, r3
	mov r0, r9
	cmp r0, 0
	blt _080FD71C
	cmp r0, 0x1
	ble _080FD69C
	cmp r0, 0x3
	bgt _080FD71C
	ldrh r0, [r6, 0x2]
	adds r1, r7, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r1, r5, r0
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r7, 0x1F
	bls _080FD710
	movs r7, 0x1F
	b _080FD710
	.align 2, 0
_080FD698: .4byte gUnknown_03005DEC
_080FD69C:
	mov r1, r10
	lsls r0, r1, 1
	add r0, r10
	ldr r1, _080FD6D0 @ =gUnknown_083E7A50
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsrs r0, 3
	movs r1, 0x7
	ands r0, r1
	movs r1, 0x3
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	cmp r0, 0x1
	beq _080FD6EC
	cmp r0, 0x1
	bgt _080FD6D4
	cmp r0, 0
	beq _080FD6DA
	b _080FD71C
	.align 2, 0
_080FD6D0: .4byte gUnknown_083E7A50
_080FD6D4:
	cmp r0, 0x2
	beq _080FD6FE
	b _080FD71C
_080FD6DA:
	ldrh r0, [r6, 0x2]
	cmp r7, r0
	bcc _080FD6E8
	subs r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	b _080FD71C
_080FD6E8:
	movs r7, 0
	b _080FD71C
_080FD6EC:
	ldrh r0, [r6, 0x2]
	cmp r5, r0
	bcc _080FD6FA
	subs r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	b _080FD71C
_080FD6FA:
	movs r5, 0
	b _080FD71C
_080FD6FE:
	ldrh r0, [r6, 0x2]
	cmp r4, r0
	bcc _080FD70C
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _080FD71C
_080FD70C:
	movs r4, 0
	b _080FD71C
_080FD710:
	cmp r5, 0x1F
	bls _080FD716
	movs r5, 0x1F
_080FD716:
	cmp r4, 0x1F
	bls _080FD71C
	movs r4, 0x1F
_080FD71C:
	lsls r0, r4, 10
	lsls r1, r5, 5
	orrs r0, r1
	orrs r7, r0
	strh r7, [r2]
_080FD726:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r8, r0
	bcs _080FD73A
	b _080FD63A
_080FD73A:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD1C8

	thumb_func_start sub_80FD39C
sub_80FD39C: @ 80FD74C
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 10
	lsls r2, r1, 5
	orrs r0, r2
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FD39C

	thumb_func_start sub_80FD3D0
sub_80FD3D0: @ 80FD780
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrh r0, [r0]
	movs r2, 0x1F
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r2
	lsrs r0, 26
	ands r0, r2
	cmp r1, 0x10
	bhi _080FD7B0
	cmp r3, 0x10
	bhi _080FD7B0
	cmp r0, 0x10
	bhi _080FD7B0
	adds r0, r4, 0
	bl sub_80FD40C
	lsls r0, 16
	lsrs r0, 16
	b _080FD7B2
_080FD7B0:
	ldr r0, _080FD7B8 @ =0x00007fff
_080FD7B2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FD7B8: .4byte 0x00007fff
	thumb_func_end sub_80FD3D0

	thumb_func_start sub_80FD40C
sub_80FD40C: @ 80FD7BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	mov r8, r0
	movs r6, 0
	movs r7, 0
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080FD874
	lsls r0, 2
	ldr r1, _080FD800 @ =_080FD804
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FD800: .4byte _080FD804
	.align 2, 0
_080FD804:
	.4byte _080FD81C
	.4byte _080FD82C
	.4byte _080FD83C
	.4byte _080FD84A
	.4byte _080FD858
	.4byte _080FD866
_080FD81C:
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r6, 0
	movs r1, 0
	mov r8, r1
	b _080FD874
_080FD82C:
	movs r7, 0
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r6, r8
	b _080FD874
_080FD83C:
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	mov r8, r7
	b _080FD874
_080FD84A:
	movs r7, 0
	movs r6, 0
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	b _080FD872
_080FD858:
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	mov r8, r6
	b _080FD874
_080FD866:
	movs r7, 0
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0
_080FD872:
	mov r8, r0
_080FD874:
	lsls r0, r7, 10
	lsls r1, r6, 5
	orrs r0, r1
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 16
	lsrs r0, 16
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD40C

	thumb_func_start sub_80FD4DC
sub_80FD4DC: @ 80FD88C
	push {lr}
	ldrh r0, [r0]
	movs r2, 0x1F
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r2
	lsrs r0, 26
	ands r0, r2
	cmp r1, 0x10
	bhi _080FD8B0
	cmp r3, 0x10
	bhi _080FD8B0
	cmp r0, 0x10
	bhi _080FD8B0
	movs r0, 0
	b _080FD8B2
_080FD8B0:
	ldr r0, _080FD8B8 @ =0x00007fff
_080FD8B2:
	pop {r1}
	bx r1
	.align 2, 0
_080FD8B8: .4byte 0x00007fff
	thumb_func_end sub_80FD4DC

	thumb_func_start sub_80FD50C
sub_80FD50C: @ 80FD8BC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r3, [r4]
	cmp r3, 0
	beq _080FD8E4
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _080FD8D6
	adds r0, r2, 0
	b _080FD8E6
_080FD8D6:
	ldrh r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FD8E4
	ldrh r0, [r4]
	b _080FD8E6
_080FD8E4:
	movs r0, 0
_080FD8E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD50C

	thumb_func_start sub_80FD53C
sub_80FD53C: @ 80FD8EC
	push {r4,lr}
	ldrh r1, [r0]
	movs r0, 0x1F
	movs r3, 0x1F
	ands r3, r1
	lsls r1, 16
	lsrs r2, r1, 21
	lsrs r1, 26
	subs r3, r0, r3
	adds r4, r0, 0
	bics r4, r2
	adds r2, r4, 0
	bics r0, r1
	lsls r0, 10
	lsls r2, 5
	orrs r0, r2
	orrs r0, r3
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD53C

	thumb_func_start sub_80FD568
sub_80FD568: @ 80FD918
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r1, 0
	ldrh r4, [r0]
	ldrh r5, [r7]
	lsls r6, r4, 16
	lsls r0, r5, 16
	mov r12, r0
	cmp r4, r5
	beq _080FD98A
	mov r2, sp
	movs r3, 0x1F
	movs r1, 0x1F
	adds r0, r1, 0
	ands r0, r4
	strh r0, [r2]
	lsrs r0, r6, 21
	ands r0, r3
	strh r0, [r2, 0x2]
	lsrs r0, r6, 26
	ands r0, r3
	strh r0, [r2, 0x4]
	mov r0, sp
	ands r1, r5
	strh r1, [r0, 0x6]
	mov r1, sp
	mov r2, r12
	lsrs r0, r2, 21
	ands r0, r3
	strh r0, [r1, 0x8]
	lsrs r0, r2, 26
	ands r0, r3
	strh r0, [r1, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0x19
	bls _080FD972
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r0, 0x19
	bls _080FD972
	mov r0, sp
	ldrh r0, [r0, 0x4]
	cmp r0, 0x19
	bhi _080FD98A
_080FD972:
	mov r0, sp
	ldrh r0, [r0, 0x6]
	cmp r0, 0x19
	bls _080FD98E
	mov r0, sp
	ldrh r0, [r0, 0x8]
	cmp r0, 0x19
	bls _080FD98E
	mov r0, sp
	ldrh r0, [r0, 0xA]
	cmp r0, 0x19
	bls _080FD98E
_080FD98A:
	ldrh r0, [r7]
	b _080FDA34
_080FD98E:
	movs r4, 0
	add r6, sp, 0xC
	mov r7, sp
	adds r7, 0x6
	adds r5, r6, 0
_080FD998:
	lsls r2, r4, 1
	mov r1, sp
	adds r0, r1, r2
	adds r1, r7, r2
	ldrh r3, [r0]
	ldrh r0, [r1]
	cmp r3, r0
	bls _080FD9AE
	adds r1, r5, r2
	subs r0, r3, r0
	b _080FD9B2
_080FD9AE:
	adds r1, r5, r2
	subs r0, r3
_080FD9B2:
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080FD998
	adds r1, r6, 0
	ldrh r0, [r1, 0x2]
	ldrh r3, [r1]
	cmp r3, r0
	bcc _080FD9D8
	ldrh r2, [r1, 0x4]
	cmp r3, r2
	bcc _080FD9D2
	adds r2, r3, 0
	b _080FD9EC
_080FD9D2:
	cmp r0, r2
	bcs _080FD9DE
	b _080FD9E6
_080FD9D8:
	ldrh r2, [r1, 0x4]
	cmp r0, r2
	bcc _080FD9E2
_080FD9DE:
	ldrh r2, [r1, 0x2]
	b _080FD9EC
_080FD9E2:
	cmp r2, r3
	bcc _080FD9EA
_080FD9E6:
	ldrh r2, [r1, 0x4]
	b _080FD9EC
_080FD9EA:
	ldrh r2, [r6]
_080FD9EC:
	mov r0, sp
	ldrh r1, [r0, 0x6]
	lsrs r0, r2, 1
	movs r6, 0x1F
	subs r6, r0
	adds r0, r1, 0
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, sp
	ldrh r0, [r0, 0x8]
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	ldrh r0, [r0, 0xA]
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	lsls r4, 5
	orrs r0, r4
	orrs r5, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
_080FDA34:
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD568

	thumb_func_start sub_80FD68C
sub_80FD68C: @ 80FDA3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	mov r10, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, r10
	ldrh r0, [r0]
	cmp r1, r0
	bne _080FDA64
	ldrh r0, [r2]
	cmp r0, r1
	bne _080FDA64
	mov r1, r10
	ldrh r0, [r1]
	b _080FDB4C
_080FDA64:
	mov r2, r10
	ldrh r0, [r2]
	movs r1, 0x1F
	mov r9, r1
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	lsls r0, 16
	lsrs r2, r0, 21
	mov r1, r9
	ands r1, r2
	mov r8, r1
	lsrs r0, 26
	mov r2, r9
	ands r2, r0
	str r2, [sp, 0x4]
	ldrh r2, [r3]
	adds r0, r4, 0
	ands r0, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r3, r9
	ands r1, r3
	adds r0, r1
	lsrs r2, 26
	ands r2, r3
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, 0x4]
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, 16
	lsrs r0, r1, 21
	mov r2, r9
	ands r0, r2
	adds r4, r0
	lsrs r1, 26
	ands r1, r2
	adds r4, r1
	adds r0, r4, 0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r7, r6
	bne _080FDAE6
	cmp r1, r6
	bne _080FDAE6
	mov r3, r10
	ldrh r0, [r3]
	b _080FDB4C
_080FDAE6:
	cmp r7, r6
	bls _080FDAEE
	subs r0, r7, r6
	b _080FDAF0
_080FDAEE:
	subs r0, r6, r7
_080FDAF0:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, r6
	bls _080FDAFC
	subs r0, r1, r6
	b _080FDAFE
_080FDAFC:
	subs r0, r6, r1
_080FDAFE:
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	bcc _080FDB08
	adds r0, r2, 0
_080FDB08:
	lsrs r0, 1
	movs r4, 0x1F
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	adds r0, r1, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	mov r2, r8
	lsls r1, r2, 5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r0, 16
_080FDB4C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD68C

	thumb_func_start sub_80FD7AC
sub_80FD7AC: @ 80FDB5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	mov r10, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, r10
	ldrh r0, [r0]
	cmp r1, r0
	bne _080FDB84
	ldrh r0, [r2]
	cmp r0, r1
	bne _080FDB84
	mov r1, r10
	ldrh r0, [r1]
	b _080FDC6A
_080FDB84:
	mov r2, r10
	ldrh r0, [r2]
	movs r1, 0x1F
	mov r9, r1
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	lsls r0, 16
	lsrs r2, r0, 21
	mov r1, r9
	ands r1, r2
	mov r8, r1
	lsrs r0, 26
	mov r2, r9
	ands r2, r0
	str r2, [sp, 0x4]
	ldrh r2, [r3]
	adds r0, r4, 0
	ands r0, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r3, r9
	ands r1, r3
	adds r0, r1
	lsrs r2, 26
	ands r2, r3
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, 0x4]
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, 16
	lsrs r0, r1, 21
	mov r2, r9
	ands r0, r2
	adds r4, r0
	lsrs r1, 26
	ands r1, r2
	adds r4, r1
	adds r0, r4, 0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r7, r6
	bne _080FDC06
	cmp r1, r6
	bne _080FDC06
	mov r3, r10
	ldrh r0, [r3]
	b _080FDC6A
_080FDC06:
	cmp r7, r6
	bls _080FDC0E
	subs r0, r7, r6
	b _080FDC10
_080FDC0E:
	subs r0, r6, r7
_080FDC10:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, r6
	bls _080FDC1C
	subs r0, r1, r6
	b _080FDC1E
_080FDC1C:
	subs r0, r6, r1
_080FDC1E:
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	bcc _080FDC28
	adds r0, r2, 0
_080FDC28:
	movs r4, 0x1F
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	adds r0, r1, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	mov r2, r8
	lsls r1, r2, 5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r0, 16
_080FDC6A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD7AC

	thumb_func_start sub_80FD8CC
sub_80FD8CC: @ 80FDC7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldrb r1, [r0, 0x1D]
	lsrs r5, r1, 3
	ldrb r1, [r0, 0x1E]
	lsrs r1, 3
	str r1, [sp, 0x8]
	ldr r1, [r0, 0x4]
	str r1, [sp]
	ldr r2, [r0, 0x10]
	str r2, [sp, 0x4]
	ldrh r0, [r0, 0x16]
	cmp r0, 0x2
	bne _080FDD2C
	movs r1, 0
	ldr r0, [sp, 0x8]
	cmp r1, r0
	bcc _080FDCAA
	b _080FDDB8
_080FDCAA:
	movs r0, 0
	adds r2, r1, 0x1
	mov r10, r2
	cmp r0, r5
	bcs _080FDD1E
	adds r2, r1, 0
	muls r2, r5
	mov r9, r2
	lsls r1, 3
	mov r8, r1
_080FDCBE:
	movs r4, 0
	lsls r6, r0, 4
	adds r7, r0, 0x1
	add r0, r9
	lsls r0, 6
	ldr r1, [sp, 0x4]
	adds r1, r0
	mov r12, r1
_080FDCCE:
	lsls r0, r4, 3
	mov r2, r12
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 3
	muls r0, r5
	lsls r0, 1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r0, [r2, 0x2]
	lsls r0, 8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, 0x6]
	lsls r0, 8
	ldrh r1, [r2, 0x4]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	ldrh r1, [r2, 0x8]
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r2, 0xE]
	lsls r0, 8
	ldrh r1, [r2, 0xC]
	orrs r0, r1
	strh r0, [r3, 0x6]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080FDCCE
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080FDCBE
_080FDD1E:
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bcc _080FDCAA
	b _080FDDB8
_080FDD2C:
	movs r1, 0
	ldr r0, [sp, 0x8]
	cmp r1, r0
	bcs _080FDDB8
_080FDD34:
	movs r0, 0
	adds r2, r1, 0x1
	mov r10, r2
	cmp r0, r5
	bcs _080FDDAC
	adds r2, r1, 0
	muls r2, r5
	mov r9, r2
	lsls r1, 3
	mov r8, r1
_080FDD48:
	movs r4, 0
	lsls r6, r0, 4
	adds r7, r0, 0x1
	add r0, r9
	lsls r0, 5
	ldr r1, [sp, 0x4]
	adds r1, r0
	mov r12, r1
_080FDD58:
	lsls r0, r4, 2
	mov r2, r12
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 3
	muls r0, r5
	lsls r0, 1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r1, [r2, 0x2]
	lsls r1, 4
	ldrh r0, [r2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2, 0x6]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r2, 0xA]
	lsls r1, 4
	ldrh r0, [r2, 0x8]
	orrs r1, r0
	ldrh r0, [r2, 0xC]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2, 0xE]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3, 0x2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080FDD58
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080FDD48
_080FDDAC:
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bcc _080FDD34
_080FDDB8:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD8CC

	thumb_func_start sub_80FDA18
sub_80FDA18: @ 80FDDC8
	push {lr}
	ldr r2, _080FDE18 @ =gUnknown_03005E0C
	ldrb r1, [r0, 0x18]
	lsls r1, 4
	strh r1, [r2]
	ldr r3, _080FDE1C @ =gUnknown_03005E08
	ldrh r2, [r2]
	lsls r2, 1
	ldr r1, [r0, 0x8]
	adds r1, r2
	str r1, [r3]
	ldr r2, _080FDE20 @ =gUnknown_03005DEC
	ldr r1, [r0, 0x4]
	str r1, [r2]
	ldr r2, _080FDE24 @ =gUnknown_03005DE8
	ldrb r1, [r0, 0x19]
	strb r1, [r2]
	ldr r2, _080FDE28 @ =gUnknown_03005DFC
	ldrb r1, [r0, 0x1A]
	strb r1, [r2]
	ldr r2, _080FDE2C @ =gUnknown_03005DF8
	ldrb r1, [r0, 0x1B]
	strb r1, [r2]
	ldr r2, _080FDE30 @ =gUnknown_03005DF0
	ldrb r1, [r0, 0x1C]
	strb r1, [r2]
	ldr r2, _080FDE34 @ =gUnknown_03005E04
	ldrb r1, [r0, 0x1D]
	strb r1, [r2]
	ldr r2, _080FDE38 @ =gUnknown_03005DF4
	ldrb r1, [r0, 0x1E]
	strb r1, [r2]
	ldrh r0, [r0, 0x14]
	cmp r0, 0x5
	bhi _080FDE8E
	lsls r0, 2
	ldr r1, _080FDE3C @ =_080FDE40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FDE18: .4byte gUnknown_03005E0C
_080FDE1C: .4byte gUnknown_03005E08
_080FDE20: .4byte gUnknown_03005DEC
_080FDE24: .4byte gUnknown_03005DE8
_080FDE28: .4byte gUnknown_03005DFC
_080FDE2C: .4byte gUnknown_03005DF8
_080FDE30: .4byte gUnknown_03005DF0
_080FDE34: .4byte gUnknown_03005E04
_080FDE38: .4byte gUnknown_03005DF4
_080FDE3C: .4byte _080FDE40
	.align 2, 0
_080FDE40:
	.4byte _080FDE58
	.4byte _080FDE60
	.4byte _080FDE68
	.4byte _080FDE72
	.4byte _080FDE7C
	.4byte _080FDE86
_080FDE58:
	movs r0, 0
	bl sub_80FDC18
	b _080FDE8E
_080FDE60:
	movs r0, 0x1
	bl sub_80FDC18
	b _080FDE8E
_080FDE68:
	bl sub_80FDAE4
	bl sub_80FDF88
	b _080FDE8E
_080FDE72:
	bl sub_80FDBE4
	bl sub_80FDED8
	b _080FDE8E
_080FDE7C:
	bl sub_80FDBA8
	bl sub_80FDE28
	b _080FDE8E
_080FDE86:
	bl sub_80FDB8C
	bl sub_80FDD70
_080FDE8E:
	pop {r0}
	bx r0
	thumb_func_end sub_80FDA18

	thumb_func_start sub_80FDAE4
sub_80FDAE4: @ 80FDE94
	ldr r2, _080FDEFC @ =gUnknown_03005E08
	ldr r1, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r2]
	ldr r2, _080FDF00 @ =0x000018c6
	adds r1, r2, 0
	strh r1, [r0, 0x2]
	ldr r2, _080FDF04 @ =0x000077bd
	adds r1, r2, 0
	strh r1, [r0, 0x4]
	ldr r2, _080FDF08 @ =0x00002d6b
	adds r1, r2, 0
	strh r1, [r0, 0x6]
	ldr r2, _080FDF0C @ =0x000018dd
	adds r1, r2, 0
	strh r1, [r0, 0x8]
	ldr r2, _080FDF10 @ =0x00001ba6
	adds r1, r2, 0
	strh r1, [r0, 0xA]
	ldr r2, _080FDF14 @ =0x000074c6
	adds r1, r2, 0
	strh r1, [r0, 0xC]
	ldr r2, _080FDF18 @ =0x00001bbd
	adds r1, r2, 0
	strh r1, [r0, 0xE]
	ldr r2, _080FDF1C @ =0x000074dd
	adds r1, r2, 0
	strh r1, [r0, 0x10]
	ldr r2, _080FDF20 @ =0x000077a6
	adds r1, r2, 0
	strh r1, [r0, 0x12]
	ldr r2, _080FDF24 @ =0x0000197d
	adds r1, r2, 0
	strh r1, [r0, 0x14]
	ldr r2, _080FDF28 @ =0x00001bab
	adds r1, r2, 0
	strh r1, [r0, 0x16]
	ldr r2, _080FDF2C @ =0x00007566
	adds r1, r2, 0
	strh r1, [r0, 0x18]
	ldr r2, _080FDF30 @ =0x00002cdd
	adds r1, r2, 0
	strh r1, [r0, 0x1A]
	ldr r2, _080FDF34 @ =0x00002fa6
	adds r1, r2, 0
	strh r1, [r0, 0x1C]
	ldr r2, _080FDF38 @ =0x000074cb
	adds r1, r2, 0
	strh r1, [r0, 0x1E]
	bx lr
	.align 2, 0
_080FDEFC: .4byte gUnknown_03005E08
_080FDF00: .4byte 0x000018c6
_080FDF04: .4byte 0x000077bd
_080FDF08: .4byte 0x00002d6b
_080FDF0C: .4byte 0x000018dd
_080FDF10: .4byte 0x00001ba6
_080FDF14: .4byte 0x000074c6
_080FDF18: .4byte 0x00001bbd
_080FDF1C: .4byte 0x000074dd
_080FDF20: .4byte 0x000077a6
_080FDF24: .4byte 0x0000197d
_080FDF28: .4byte 0x00001bab
_080FDF2C: .4byte 0x00007566
_080FDF30: .4byte 0x00002cdd
_080FDF34: .4byte 0x00002fa6
_080FDF38: .4byte 0x000074cb
	thumb_func_end sub_80FDAE4

	thumb_func_start sub_80FDB8C
sub_80FDB8C: @ 80FDF3C
	ldr r2, _080FDF50 @ =gUnknown_03005E08
	ldr r0, [r2]
	movs r1, 0
	strh r1, [r0]
	ldr r2, [r2]
	strh r1, [r2, 0x2]
	ldr r1, _080FDF54 @ =0x00007fff
	adds r0, r1, 0
	strh r0, [r2, 0x4]
	bx lr
	.align 2, 0
_080FDF50: .4byte gUnknown_03005E08
_080FDF54: .4byte 0x00007fff
	thumb_func_end sub_80FDB8C

	thumb_func_start sub_80FDBA8
sub_80FDBA8: @ 80FDF58
	push {r4,r5,lr}
	ldr r1, _080FDF90 @ =gUnknown_03005E08
	ldr r0, [r1]
	movs r2, 0
	strh r2, [r0]
	ldr r0, [r1]
	strh r2, [r0, 0x2]
	movs r4, 0
	adds r5, r1, 0
_080FDF6A:
	ldr r0, [r5]
	lsls r2, r4, 1
	adds r2, r0
	adds r0, r4, 0x2
	lsls r3, r0, 1
	lsls r1, r0, 11
	lsls r0, 6
	orrs r1, r0
	orrs r1, r3
	strh r1, [r2, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xD
	bls _080FDF6A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FDF90: .4byte gUnknown_03005E08
	thumb_func_end sub_80FDBA8

	thumb_func_start sub_80FDBE4
sub_80FDBE4: @ 80FDF94
	push {r4,lr}
	ldr r2, _080FDFC4 @ =gUnknown_03005E08
	ldr r1, [r2]
	movs r0, 0
	strh r0, [r1]
	movs r3, 0
	adds r4, r2, 0
_080FDFA2:
	ldr r0, [r4]
	lsls r2, r3, 1
	adds r2, r0
	lsls r0, r3, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r3
	strh r0, [r2, 0x2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _080FDFA2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDFC4: .4byte gUnknown_03005E08
	thumb_func_end sub_80FDBE4

	thumb_func_start sub_80FDC18
sub_80FDC18: @ 80FDFC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	movs r1, 0xDF
	mov r9, r1
	cmp r0, 0
	bne _080FDFE0
	movs r2, 0xFF
	mov r9, r2
_080FDFE0:
	movs r6, 0
	ldr r3, _080FE064 @ =gUnknown_03005E08
	mov r12, r3
	mov r0, r9
	lsls r4, r0, 1
	ldr r5, _080FE068 @ =gUnknown_03005DF0
	cmp r6, r9
	bcs _080FE004
	movs r2, 0
_080FDFF2:
	ldr r0, [r3]
	lsls r1, r6, 1
	adds r1, r0
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r9
	bcc _080FDFF2
_080FE004:
	mov r1, r12
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, _080FE06C @ =0x00003def
	adds r1, r2, 0
	strh r1, [r0]
	movs r3, 0
	ldrb r5, [r5]
	cmp r3, r5
	bcs _080FE108
_080FE018:
	ldr r2, _080FE070 @ =gUnknown_03005DEC
	ldr r0, _080FE074 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r3
	ldr r0, _080FE078 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	ldr r1, [r2]
	adds r1, r0
	ldr r0, _080FE07C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r6, 0
	ldr r0, _080FE080 @ =gUnknown_03005DF8
	adds r2, r0, 0
	adds r3, 0x1
	mov r10, r3
	ldrb r3, [r2]
	cmp r6, r3
	bcs _080FE0FA
	ldr r0, _080FE084 @ =gUnknown_03005E0C
	mov r8, r0
_080FE048:
	ldrh r0, [r4]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE088
	mov r1, r8
	ldrh r0, [r1]
	strh r0, [r4]
	adds r6, 0x1
	adds r7, r4, 0x2
	b _080FE0EE
	.align 2, 0
_080FE064: .4byte gUnknown_03005E08
_080FE068: .4byte gUnknown_03005DF0
_080FE06C: .4byte 0x00003def
_080FE070: .4byte gUnknown_03005DEC
_080FE074: .4byte gUnknown_03005DFC
_080FE078: .4byte gUnknown_03005E04
_080FE07C: .4byte gUnknown_03005DE8
_080FE080: .4byte gUnknown_03005DF8
_080FE084: .4byte gUnknown_03005E0C
_080FE088:
	adds r0, r4, 0
	bl sub_80FE038
	lsls r0, 16
	lsrs r5, r0, 16
	movs r3, 0x1
	adds r6, 0x1
	adds r7, r4, 0x2
	cmp r3, r9
	bcs _080FE0E4
	ldr r0, _080FE0B4 @ =gUnknown_03005E08
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	mov r12, r0
	cmp r1, 0
	bne _080FE0B8
	strh r5, [r2, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	adds r0, 0x1
	b _080FE0E2
	.align 2, 0
_080FE0B4: .4byte gUnknown_03005E08
_080FE0B8:
	mov r2, r12
	ldr r1, [r2]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _080FE0DC
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r9
	bcs _080FE0E4
	lsls r0, r3, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	bne _080FE0B8
	strh r5, [r1]
_080FE0DC:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r3
_080FE0E2:
	strh r0, [r4]
_080FE0E4:
	ldr r2, _080FE118 @ =gUnknown_03005DF8
	cmp r3, r9
	bne _080FE0EE
	mov r3, r9
	strh r3, [r4]
_080FE0EE:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r4, r7, 0
	ldrb r0, [r2]
	cmp r6, r0
	bcc _080FE048
_080FE0FA:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r3, r0, 24
	ldr r0, _080FE11C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r3, r0
	bcc _080FE018
_080FE108:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE118: .4byte gUnknown_03005DF8
_080FE11C: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDC18

	thumb_func_start sub_80FDD70
sub_80FDD70: @ 80FE120
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r2, 0
	ldr r0, _080FE174 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FE1C4
	ldr r0, _080FE178 @ =gUnknown_03005DEC
	mov r8, r0
_080FE134:
	ldr r0, _080FE17C @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FE180 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FE184 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r6, 0
	ldr r0, _080FE188 @ =gUnknown_03005DF8
	adds r3, r0, 0
	adds r7, r2, 0x1
	ldrb r0, [r3]
	cmp r6, r0
	bcs _080FE1B8
	ldr r5, _080FE18C @ =gUnknown_03005E0C
_080FE160:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE190
	ldrh r0, [r5]
	strh r0, [r4]
	b _080FE1AA
	.align 2, 0
_080FE174: .4byte gUnknown_03005DF0
_080FE178: .4byte gUnknown_03005DEC
_080FE17C: .4byte gUnknown_03005DFC
_080FE180: .4byte gUnknown_03005E04
_080FE184: .4byte gUnknown_03005DE8
_080FE188: .4byte gUnknown_03005DF8
_080FE18C: .4byte gUnknown_03005E0C
_080FE190:
	adds r0, r4, 0
	bl sub_80FD4DC
	lsls r0, 16
	cmp r0, 0
	bne _080FE1A2
	ldrh r0, [r5]
	adds r0, 0x1
	b _080FE1A6
_080FE1A2:
	ldrh r0, [r5]
	adds r0, 0x2
_080FE1A6:
	strh r0, [r4]
	ldr r3, _080FE1D0 @ =gUnknown_03005DF8
_080FE1AA:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r6, r0
	bcc _080FE160
_080FE1B8:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FE1D4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FE134
_080FE1C4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE1D0: .4byte gUnknown_03005DF8
_080FE1D4: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDD70

	thumb_func_start sub_80FDE28
sub_80FDE28: @ 80FE1D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FE22C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FE274
	ldr r0, _080FE230 @ =gUnknown_03005DEC
	mov r8, r0
_080FE1EE:
	ldr r0, _080FE234 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FE238 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FE23C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080FE240 @ =gUnknown_03005DF8
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FE268
	ldr r6, _080FE244 @ =gUnknown_03005E0C
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FE21E:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080FE248
	ldrh r0, [r6]
	strh r0, [r4]
	b _080FE258
	.align 2, 0
_080FE22C: .4byte gUnknown_03005DF0
_080FE230: .4byte gUnknown_03005DEC
_080FE234: .4byte gUnknown_03005DFC
_080FE238: .4byte gUnknown_03005E04
_080FE23C: .4byte gUnknown_03005DE8
_080FE240: .4byte gUnknown_03005DF8
_080FE244: .4byte gUnknown_03005E0C
_080FE248:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80FE17C
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080FE258:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FE280 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FE21E
_080FE268:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FE284 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FE1EE
_080FE274:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE280: .4byte gUnknown_03005DF8
_080FE284: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDE28

	thumb_func_start sub_80FDED8
sub_80FDED8: @ 80FE288
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FE2DC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FE324
	ldr r0, _080FE2E0 @ =gUnknown_03005DEC
	mov r8, r0
_080FE29E:
	ldr r0, _080FE2E4 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FE2E8 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FE2EC @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080FE2F0 @ =gUnknown_03005DF8
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FE318
	ldr r6, _080FE2F4 @ =gUnknown_03005E0C
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FE2CE:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080FE2F8
	ldrh r0, [r6]
	strh r0, [r4]
	b _080FE308
	.align 2, 0
_080FE2DC: .4byte gUnknown_03005DF0
_080FE2E0: .4byte gUnknown_03005DEC
_080FE2E4: .4byte gUnknown_03005DFC
_080FE2E8: .4byte gUnknown_03005E04
_080FE2EC: .4byte gUnknown_03005DE8
_080FE2F0: .4byte gUnknown_03005DF8
_080FE2F4: .4byte gUnknown_03005E0C
_080FE2F8:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80FE1B0
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080FE308:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FE330 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FE2CE
_080FE318:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FE334 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FE29E
_080FE324:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE330: .4byte gUnknown_03005DF8
_080FE334: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDED8

	thumb_func_start sub_80FDF88
sub_80FDF88: @ 80FE338
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FE38C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FE3D4
	ldr r0, _080FE390 @ =gUnknown_03005DEC
	mov r8, r0
_080FE34E:
	ldr r0, _080FE394 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FE398 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FE39C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080FE3A0 @ =gUnknown_03005DF8
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FE3C8
	ldr r6, _080FE3A4 @ =gUnknown_03005E0C
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FE37E:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080FE3A8
	ldrh r0, [r6]
	strh r0, [r4]
	b _080FE3B8
	.align 2, 0
_080FE38C: .4byte gUnknown_03005DF0
_080FE390: .4byte gUnknown_03005DEC
_080FE394: .4byte gUnknown_03005DFC
_080FE398: .4byte gUnknown_03005E04
_080FE39C: .4byte gUnknown_03005DE8
_080FE3A0: .4byte gUnknown_03005DF8
_080FE3A4: .4byte gUnknown_03005E0C
_080FE3A8:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80FE0AC
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080FE3B8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FE3E0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FE37E
_080FE3C8:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FE3E4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FE34E
_080FE3D4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE3E0: .4byte gUnknown_03005DF8
_080FE3E4: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDF88

	thumb_func_start sub_80FE038
sub_80FE038: @ 80FE3E8
	push {r4,lr}
	ldrh r0, [r0]
	movs r1, 0x1F
	movs r4, 0x1F
	ands r4, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r1
	lsrs r2, r0, 26
	ands r2, r1
	movs r1, 0x3
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE40C
	movs r0, 0x1C
	ands r0, r4
	adds r4, r0, 0x4
_080FE40C:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE41A
	movs r0, 0x1C
	ands r0, r3
	adds r3, r0, 0x4
_080FE41A:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE428
	movs r0, 0x1C
	ands r0, r2
	adds r2, r0, 0x4
_080FE428:
	cmp r4, 0x5
	bhi _080FE42E
	movs r4, 0x6
_080FE42E:
	cmp r4, 0x1E
	bls _080FE434
	movs r4, 0x1E
_080FE434:
	cmp r3, 0x5
	bhi _080FE43A
	movs r3, 0x6
_080FE43A:
	cmp r3, 0x1E
	bls _080FE440
	movs r3, 0x1E
_080FE440:
	cmp r2, 0x5
	bhi _080FE446
	movs r2, 0x6
_080FE446:
	cmp r2, 0x1E
	bls _080FE44C
	movs r2, 0x1E
_080FE44C:
	lsls r0, r2, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FE038

	thumb_func_start sub_80FE0AC
sub_80FE0AC: @ 80FE45C
	push {lr}
	ldrh r0, [r0]
	movs r1, 0x1F
	movs r3, 0x1F
	ands r3, r0
	lsls r0, 16
	lsrs r2, r0, 21
	ands r2, r1
	lsrs r0, 26
	ands r0, r1
	cmp r3, 0xB
	bhi _080FE480
	cmp r2, 0xA
	bhi _080FE480
	cmp r0, 0xA
	bhi _080FE480
	movs r0, 0x1
	b _080FE526
_080FE480:
	cmp r3, 0x13
	bls _080FE4A4
	cmp r2, 0x13
	bls _080FE48C
	cmp r0, 0x13
	bhi _080FE4B0
_080FE48C:
	cmp r3, 0x13
	bls _080FE4A4
	cmp r2, 0x13
	bls _080FE49A
	cmp r0, 0xE
	bhi _080FE4B0
	b _080FE4E8
_080FE49A:
	cmp r0, 0x13
	bls _080FE4A4
	cmp r2, 0xE
	bhi _080FE4B0
	b _080FE4C4
_080FE4A4:
	cmp r2, 0x13
	bls _080FE4B4
	cmp r0, 0x13
	bls _080FE4B4
	cmp r3, 0xE
	bls _080FE50C
_080FE4B0:
	movs r0, 0x2
	b _080FE526
_080FE4B4:
	cmp r3, 0x13
	bls _080FE4D8
	cmp r2, 0xB
	bls _080FE4CC
	cmp r0, 0xB
	bls _080FE4C8
	cmp r2, r0
	bcs _080FE4E8
_080FE4C4:
	movs r0, 0x8
	b _080FE526
_080FE4C8:
	movs r0, 0xA
	b _080FE526
_080FE4CC:
	cmp r0, 0xB
	bls _080FE4D4
	movs r0, 0xD
	b _080FE526
_080FE4D4:
	movs r0, 0x4
	b _080FE526
_080FE4D8:
	cmp r2, 0x13
	bls _080FE4FC
	cmp r3, 0xB
	bls _080FE4F0
	cmp r0, 0xB
	bls _080FE4EC
	cmp r3, r0
	bcc _080FE50C
_080FE4E8:
	movs r0, 0x7
	b _080FE526
_080FE4EC:
	movs r0, 0xB
	b _080FE526
_080FE4F0:
	cmp r0, 0xB
	bls _080FE4F8
	movs r0, 0xE
	b _080FE526
_080FE4F8:
	movs r0, 0x5
	b _080FE526
_080FE4FC:
	cmp r0, 0x13
	bls _080FE524
	cmp r3, 0xB
	bls _080FE510
	cmp r2, 0xB
	bls _080FE518
	cmp r3, r2
	bcs _080FE4C4
_080FE50C:
	movs r0, 0x9
	b _080FE526
_080FE510:
	cmp r2, 0xB
	bls _080FE518
	movs r0, 0xC
	b _080FE526
_080FE518:
	cmp r0, 0xB
	bls _080FE520
	movs r0, 0xF
	b _080FE526
_080FE520:
	movs r0, 0x6
	b _080FE526
_080FE524:
	movs r0, 0x3
_080FE526:
	pop {r1}
	bx r1
	thumb_func_end sub_80FE0AC

	thumb_func_start sub_80FE17C
sub_80FE17C: @ 80FE52C
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x1E
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080FE558
	lsrs r0, 17
	b _080FE55A
_080FE558:
	movs r0, 0x1
_080FE55A:
	pop {r1}
	bx r1
	thumb_func_end sub_80FE17C

	thumb_func_start sub_80FE1B0
sub_80FE1B0: @ 80FE560
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FE1B0

	.align 2, 0 @ Don't pad with nop.
