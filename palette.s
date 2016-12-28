	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start LoadCompressedPalette
LoadCompressedPalette: @ 8073A14
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	ldr r6, _08073A4C @ =0x0202f39c
	adds r1, r6, 0
	bl sub_800D238
	lsls r4, 1
	ldr r1, _08073A50 @ =gPlttBufferUnfaded
	adds r1, r4, r1
	lsrs r5, 17
	adds r0, r6, 0
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _08073A54 @ =gPlttBufferFaded
	adds r4, r0
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073A4C: .4byte 0x0202f39c
_08073A50: .4byte gPlttBufferUnfaded
_08073A54: .4byte gPlttBufferFaded
	thumb_func_end LoadCompressedPalette

	thumb_func_start LoadPalette
LoadPalette: @ 8073A58
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsls r5, 16
	lsrs r4, 15
	ldr r1, _08073A88 @ =gPlttBufferUnfaded
	adds r1, r4, r1
	lsrs r5, 17
	adds r2, r5, 0
	bl CpuSet
	ldr r0, _08073A8C @ =gPlttBufferFaded
	adds r4, r0
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073A88: .4byte gPlttBufferUnfaded
_08073A8C: .4byte gPlttBufferFaded
	thumb_func_end LoadPalette

	thumb_func_start FillPalette
FillPalette: @ 8073A90
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 16
	lsls r5, 16
	mov r0, sp
	strh r6, [r0]
	lsrs r4, 15
	ldr r1, _08073AD8 @ =gPlttBufferUnfaded
	adds r1, r4, r1
	lsrs r5, 17
	movs r0, 0x80
	lsls r0, 17
	orrs r5, r0
	mov r0, sp
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r6, [r0]
	ldr r1, _08073ADC @ =gPlttBufferFaded
	adds r4, r1
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08073AD8: .4byte gPlttBufferUnfaded
_08073ADC: .4byte gPlttBufferFaded
	thumb_func_end FillPalette

	thumb_func_start TransferPlttBuffer
TransferPlttBuffer: @ 8073AE0
	push {r4,r5,lr}
	ldr r4, _08073B28 @ =gPaletteFade
	ldrb r1, [r4, 0x8]
	movs r5, 0x80
	adds r0, r5, 0
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08073B22
	ldr r1, _08073B2C @ =gPlttBufferFaded
	movs r2, 0xA0
	lsls r2, 19
	ldr r0, _08073B30 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08073B34 @ =0x80000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _08073B38 @ =0x0202f398
	str r3, [r0]
	ldrb r1, [r4, 0x9]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _08073B22
	ldrb r1, [r4, 0x7]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08073B22
	bl UpdateBlendRegisters
_08073B22:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073B28: .4byte gPaletteFade
_08073B2C: .4byte gPlttBufferFaded
_08073B30: .4byte 0x040000d4
_08073B34: .4byte 0x80000200
_08073B38: .4byte 0x0202f398
	thumb_func_end TransferPlttBuffer

	thumb_func_start UpdatePaletteFade
UpdatePaletteFade: @ 8073B3C
	push {lr}
	ldr r0, _08073B4C @ =0x0202f398
	ldr r0, [r0]
	cmp r0, 0
	beq _08073B50
	movs r0, 0xFF
	b _08073B88
	.align 2, 0
_08073B4C: .4byte 0x0202f398
_08073B50:
	ldr r0, _08073B64 @ =gPaletteFade
	ldrb r0, [r0, 0x9]
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	bne _08073B68
	bl UpdateNormalPaletteFade
	b _08073B76
	.align 2, 0
_08073B64: .4byte gPaletteFade
_08073B68:
	cmp r1, 0x1
	bne _08073B72
	bl UpdateFastPaletteFade
	b _08073B76
_08073B72:
	bl UpdateHardwarePaletteFade
_08073B76:
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _08073B8C @ =0x0202f398
	ldr r0, _08073B90 @ =gPaletteFade
	ldr r0, [r0]
	movs r1, 0
	orrs r0, r1
	str r0, [r2]
	adds r0, r3, 0
_08073B88:
	pop {r1}
	bx r1
	.align 2, 0
_08073B8C: .4byte 0x0202f398
_08073B90: .4byte gPaletteFade
	thumb_func_end UpdatePaletteFade

	thumb_func_start ResetPaletteFade
ResetPaletteFade: @ 8073B94
	push {r4,lr}
	movs r4, 0
_08073B98:
	adds r0, r4, 0
	bl ResetPaletteStruct
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08073B98
	bl ResetPaletteFadeControl
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ResetPaletteFade

	thumb_func_start ReadPlttIntoBuffers
ReadPlttIntoBuffers: @ 8073BB4
	push {r4-r7,lr}
	movs r0, 0xA0
	lsls r0, 19
	mov r12, r0
	movs r4, 0
	ldr r7, _08073BE8 @ =gPlttBufferUnfaded
	ldr r6, _08073BEC @ =gPlttBufferFaded
	ldr r5, _08073BF0 @ =0x000001ff
_08073BC4:
	lsls r1, r4, 1
	adds r3, r1, r7
	mov r0, r12
	adds r2, r1, r0
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r6
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bls _08073BC4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073BE8: .4byte gPlttBufferUnfaded
_08073BEC: .4byte gPlttBufferFaded
_08073BF0: .4byte 0x000001ff
	thumb_func_end ReadPlttIntoBuffers

	thumb_func_start BeginNormalPaletteFade
BeginNormalPaletteFade: @ 8073BF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldr r0, [sp, 0x18]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r12, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r5, _08073C24 @ =gPaletteFade
	ldrb r1, [r5, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08073C28
	movs r0, 0
	b _08073D20
	.align 2, 0
_08073C24: .4byte gPaletteFade
_08073C28:
	ldrb r0, [r5, 0xA]
	movs r3, 0x79
	negs r3, r3
	adds r2, r3, 0
	ands r2, r0
	movs r0, 0x10
	orrs r2, r0
	strb r2, [r5, 0xA]
	lsls r0, r6, 24
	asrs r1, r0, 24
	cmp r1, 0
	bge _08073C56
	lsls r0, r2, 25
	lsrs r0, 28
	negs r1, r1
	adds r0, r1
	movs r1, 0xF
	ands r0, r1
	lsls r0, 3
	ands r2, r3
	orrs r2, r0
	strb r2, [r5, 0xA]
	movs r6, 0
_08073C56:
	str r4, [r5]
	movs r4, 0x3F
	adds r1, r6, 0
	ands r1, r4
	ldrb r2, [r5, 0x4]
	movs r3, 0x40
	negs r3, r3
	adds r0, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x4]
	ands r6, r4
	ldrb r0, [r5, 0x8]
	ands r3, r0
	orrs r3, r6
	strb r3, [r5, 0x8]
	movs r0, 0x1F
	mov r1, r12
	ands r1, r0
	lsls r1, 6
	ldrh r2, [r5, 0x4]
	ldr r0, _08073CC4 @ =0xfffff83f
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	lsls r2, r7, 3
	ldrb r1, [r5, 0x5]
	movs r0, 0x7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	ldr r1, _08073CC8 @ =0x00007fff
	mov r0, r8
	ands r1, r0
	ldrh r2, [r5, 0x6]
	ldr r0, _08073CCC @ =0xffff8000
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x6]
	ldrb r0, [r5, 0x7]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r5, 0x7]
	ldrb r1, [r5, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x9]
	cmp r12, r7
	bcs _08073CD0
	movs r0, 0x41
	negs r0, r0
	ands r3, r0
	b _08073CD4
	.align 2, 0
_08073CC4: .4byte 0xfffff83f
_08073CC8: .4byte 0x00007fff
_08073CCC: .4byte 0xffff8000
_08073CD0:
	movs r0, 0x40
	orrs r3, r0
_08073CD4:
	strb r3, [r5, 0x8]
	bl UpdatePaletteFade
	ldr r4, _08073D2C @ =gPaletteFade
	ldrb r1, [r4, 0x8]
	lsrs r5, r1, 7
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x8]
	ldr r0, _08073D30 @ =gPlttBufferFaded
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08073D34 @ =0x04000100
	bl CpuSet
	ldr r1, _08073D38 @ =0x0202f398
	movs r0, 0
	str r0, [r1]
	ldrb r1, [r4, 0x9]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x2
	bne _08073D10
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08073D10
	bl UpdateBlendRegisters
_08073D10:
	ldr r2, _08073D2C @ =gPaletteFade
	lsls r3, r5, 7
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x8]
	movs r0, 0x1
_08073D20:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08073D2C: .4byte gPaletteFade
_08073D30: .4byte gPlttBufferFaded
_08073D34: .4byte 0x04000100
_08073D38: .4byte 0x0202f398
	thumb_func_end BeginNormalPaletteFade

	thumb_func_start unref_sub_8073D3C
unref_sub_8073D3C: @ 8073D3C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	mov r8, r0
	adds r4, r1, 0
	adds r6, r2, 0
	ldr r5, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 16
	lsrs r5, 16
	str r3, [sp, 0x4]
	bl ReadPlttIntoBuffers
	lsls r4, 24
	asrs r4, 24
	str r5, [sp]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r6, 0
	ldr r3, [sp, 0x4]
	bl BeginNormalPaletteFade
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8073D3C

	thumb_func_start unref_sub_8073D84
unref_sub_8073D84: @ 8073D84
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
_08073D8E:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 2
	ldr r1, _08073DDC @ =gPlttBufferFaded + 0x400
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	lsls r0, 31
	cmp r0, 0
	beq _08073DEC
	ldr r2, [r4]
	ldrb r0, [r2, 0x8]
	lsls r0, 31
	lsrs r0, 31
	cmp r0, r7
	bne _08073DEC
	ldrh r1, [r4, 0x6]
	lsls r1, 20
	lsrs r1, 25
	ldrb r0, [r2, 0xB]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	bne _08073DCA
	adds r0, r4, 0
	bl unused_sub_8074020
	ldrb r0, [r4, 0x4]
	lsls r0, 31
	cmp r0, 0
	beq _08073DEC
_08073DCA:
	ldrb r0, [r4, 0x8]
	cmp r0, 0
	bne _08073DE0
	adds r0, r4, 0
	adds r1, r6, 0
	bl unused_sub_8073DFC
	b _08073DE4
	.align 2, 0
_08073DDC: .4byte gPlttBufferFaded + 0x400
_08073DE0:
	subs r0, 0x1
	strb r0, [r4, 0x8]
_08073DE4:
	adds r0, r4, 0
	adds r1, r6, 0
	bl unused_sub_8073F60
_08073DEC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08073D8E
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8073D84

	thumb_func_start unused_sub_8073DFC
unused_sub_8073DFC: @ 80741BC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	mov r8, r1
	movs r6, 0
	ldrh r1, [r4, 0x6]
	lsls r1, 20
	lsrs r1, 25
	ldr r3, [r4]
	ldrb r0, [r3, 0x9]
	lsls r2, r0, 25
	lsrs r0, r2, 27
	adds r5, r1, 0
	muls r5, r0
	ldrb r1, [r3, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08074258
	lsrs r0, r2, 27
	cmp r6, r0
	bcs _080742A4
	ldr r0, _08074248 @ =gPlttBufferUnfaded
	mov r12, r0
	ldr r7, _0807424C @ =gPlttBufferFaded
_080741F0:
	ldr r0, [r4, 0x4]
	lsls r0, 11
	lsrs r0, 22
	lsls r0, 1
	add r0, r12
	ldr r1, [r3, 0x4]
	lsls r2, r5, 1
	adds r1, r2, r1
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r0, [r4, 0x4]
	lsls r0, 11
	lsrs r0, 22
	lsls r0, 1
	adds r0, r7
	ldr r1, [r4]
	ldr r1, [r1, 0x4]
	adds r2, r1
	ldrh r1, [r2]
	strh r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [r4, 0x4]
	lsls r1, r2, 11
	lsrs r1, 22
	adds r1, 0x1
	ldr r0, _08074250 @ =0x000003ff
	ands r1, r0
	lsls r1, 11
	ldr r0, _08074254 @ =0xffe007ff
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r3, [r4]
	ldrb r0, [r3, 0x9]
	lsls r0, 25
	lsrs r0, 27
	cmp r6, r0
	bcc _080741F0
	b _080742A4
	.align 2, 0
_08074248: .4byte gPlttBufferUnfaded
_0807424C: .4byte gPlttBufferFaded
_08074250: .4byte 0x000003ff
_08074254: .4byte 0xffe007ff
_08074258:
	lsrs r0, r2, 27
	cmp r6, r0
	bcs _080742A4
	ldr r3, _08074310 @ =gPlttBufferFaded
_08074260:
	ldr r1, [r4, 0x4]
	lsls r1, 11
	lsrs r1, 22
	lsls r1, 1
	adds r1, r3
	ldr r0, [r4]
	ldr r2, [r0, 0x4]
	lsls r0, r5, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [r4, 0x4]
	lsls r1, r2, 11
	lsrs r1, 22
	adds r1, 0x1
	ldr r0, _08074314 @ =0x000003ff
	ands r1, r0
	lsls r1, 11
	ldr r0, _08074318 @ =0xffe007ff
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	lsls r0, 25
	lsrs r0, 27
	cmp r6, r0
	bcc _08074260
_080742A4:
	ldrh r0, [r4, 0x4]
	lsls r0, 21
	lsrs r0, 23
	lsls r0, 11
	ldr r1, [r4, 0x4]
	ldr r2, _08074318 @ =0xffe007ff
	ands r1, r2
	orrs r1, r0
	str r1, [r4, 0x4]
	ldr r3, [r4]
	ldrb r0, [r3, 0xA]
	strb r0, [r4, 0x8]
	ldrh r2, [r4, 0x6]
	lsls r0, r2, 20
	lsrs r0, 25
	adds r0, 0x1
	movs r1, 0x7F
	ands r0, r1
	lsls r0, 5
	ldr r5, _0807431C @ =0xfffff01f
	adds r1, r5, 0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, 0x6]
	lsls r1, 20
	lsrs r1, 25
	ldrb r0, [r3, 0xB]
	lsls r0, 27
	lsrs r0, 27
	cmp r1, r0
	blt _080742F4
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _080742EC
	subs r0, 0x1
	strb r0, [r4, 0x9]
_080742EC:
	ldrh r1, [r4, 0x6]
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r4, 0x6]
_080742F4:
	ldrh r0, [r4, 0x4]
	lsls r0, 21
	lsrs r0, 27
	movs r1, 0x1
	lsls r1, r0
	mov r2, r8
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074310: .4byte gPlttBufferFaded
_08074314: .4byte 0x000003ff
_08074318: .4byte 0xffe007ff
_0807431C: .4byte 0xfffff01f
	thumb_func_end unused_sub_8073DFC

	thumb_func_start unused_sub_8073F60
unused_sub_8073F60: @ 8074320
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r3, _08074378 @ =gPaletteFade
	ldrb r1, [r3, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080743D4
	ldrh r0, [r4, 0x4]
	lsls r0, 21
	lsrs r6, r0, 23
	asrs r1, r6, 4
	movs r5, 0x1
	adds r0, r5, 0
	lsls r0, r1
	ldr r1, [r3]
	ands r0, r1
	cmp r0, 0
	beq _080743D4
	ldr r2, [r4]
	ldrb r1, [r2, 0x8]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0807437C
	ldrb r1, [r3, 0x4]
	lsls r1, 26
	ldrb r0, [r3, 0x8]
	lsls r0, 26
	cmp r1, r0
	beq _080743D4
	adds r0, r6, 0
	ldrb r1, [r2, 0x9]
	lsls r1, 25
	lsrs r1, 27
	ldrh r2, [r3, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r3, 0x6]
	lsls r3, 17
	lsrs r3, 17
	bl BlendPalette
	b _080743D4
	.align 2, 0
_08074378: .4byte gPaletteFade
_0807437C:
	ldrb r1, [r3, 0x4]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _080743D4
	ldrb r0, [r4, 0x8]
	ldrb r1, [r2, 0xA]
	cmp r0, r1
	beq _080743D4
	ldrh r0, [r4, 0x6]
	lsls r0, 20
	lsrs r0, 25
	ldrb r1, [r2, 0x9]
	lsls r1, 25
	lsrs r2, r1, 27
	adds r5, r0, 0
	muls r5, r2
	movs r3, 0
	adds r1, r2, 0
	cmp r3, r1
	bcs _080743D4
	ldr r6, _080743DC @ =gPlttBufferFaded
_080743A8:
	ldrh r1, [r4, 0x4]
	lsls r1, 21
	lsrs r1, 23
	adds r1, r3
	lsls r1, 1
	adds r1, r6
	ldr r2, [r4]
	adds r0, r5, r3
	ldr r2, [r2, 0x4]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, [r4]
	ldrb r0, [r0, 0x9]
	lsls r0, 25
	lsrs r0, 27
	cmp r3, r0
	bcc _080743A8
_080743D4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080743DC: .4byte gPlttBufferFaded
	thumb_func_end unused_sub_8073F60

	thumb_func_start unused_sub_8074020
unused_sub_8074020: @ 80743E0
	push {lr}
	adds r3, r0, 0
	ldrb r0, [r3, 0x9]
	cmp r0, 0
	bne _08074430
	ldr r2, [r3]
	ldrb r0, [r2, 0xB]
	lsrs r0, 5
	cmp r0, 0
	bne _08074420
	ldrh r1, [r3, 0x6]
	ldr r0, _08074418 @ =0xfffff01f
	ands r0, r1
	strh r0, [r3, 0x6]
	ldrb r0, [r2, 0xA]
	strb r0, [r3, 0x8]
	ldrb r0, [r2, 0xC]
	strb r0, [r3, 0x9]
	ldrh r0, [r3, 0x4]
	lsls r0, 21
	lsrs r0, 23
	lsls r0, 11
	ldr r1, [r3, 0x4]
	ldr r2, _0807441C @ =0xffe007ff
	ands r1, r2
	orrs r1, r0
	str r1, [r3, 0x4]
	b _08074434
	.align 2, 0
_08074418: .4byte 0xfffff01f
_0807441C: .4byte 0xffe007ff
_08074420:
	cmp r0, 0
	blt _08074434
	cmp r0, 0x2
	bgt _08074434
	ldrh r0, [r2]
	bl ResetPaletteStructByUid
	b _08074434
_08074430:
	subs r0, 0x1
	strb r0, [r3, 0x9]
_08074434:
	pop {r0}
	bx r0
	thumb_func_end unused_sub_8074020

	thumb_func_start ResetPaletteStructByUid
ResetPaletteStructByUid: @ 8074078
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetPaletteNumByUid
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0807408E
	bl ResetPaletteStruct
_0807408E:
	pop {r0}
	bx r0
	thumb_func_end ResetPaletteStructByUid

	thumb_func_start ResetPaletteStruct
ResetPaletteStruct: @ 8074094
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080740DC @ =gPlttBufferFaded + 0x400
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080740E0 @ =gDummyPaletteStructTemplate
	str r0, [r1]
	ldrb r2, [r1, 0x4]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x4]
	ldrh r2, [r1, 0x4]
	ldr r0, _080740E4 @ =0xfffff803
	ands r0, r2
	strh r0, [r1, 0x4]
	ldr r0, [r1, 0x4]
	ldr r2, _080740E8 @ =0xffe007ff
	ands r0, r2
	str r0, [r1, 0x4]
	ldrh r2, [r1, 0x6]
	ldr r0, _080740EC @ =0xfffff01f
	ands r0, r2
	strh r0, [r1, 0x6]
	ldrb r2, [r1, 0x4]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x4]
	movs r0, 0
	strb r0, [r1, 0x8]
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_080740DC: .4byte gPlttBufferFaded + 0x400
_080740E0: .4byte gDummyPaletteStructTemplate
_080740E4: .4byte 0xfffff803
_080740E8: .4byte 0xffe007ff
_080740EC: .4byte 0xfffff01f
	thumb_func_end ResetPaletteStruct

	thumb_func_start ResetPaletteFadeControl
ResetPaletteFadeControl: @ 80740F0
	ldr r2, _08074158 @ =gPaletteFade
	movs r0, 0
	str r0, [r2]
	subs r0, 0x40
	ldrb r1, [r2, 0x4]
	ands r0, r1
	strb r0, [r2, 0x4]
	ldrh r1, [r2, 0x4]
	ldr r0, _0807415C @ =0xfffff83f
	ands r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r2, 0x5]
	movs r0, 0x7
	ands r0, r1
	strb r0, [r2, 0x5]
	ldrh r1, [r2, 0x6]
	ldr r0, _08074160 @ =0xffff8000
	ands r0, r1
	strh r0, [r2, 0x6]
	ldrb r1, [r2, 0x7]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x7]
	movs r0, 0
	strb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r2, 0x9]
	ldrb r1, [r2, 0xA]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xA]
	ldr r0, [r2, 0x8]
	ldr r1, _08074164 @ =0xfffe0fff
	ands r0, r1
	str r0, [r2, 0x8]
	ldrb r0, [r2, 0xA]
	ands r3, r0
	movs r0, 0x79
	negs r0, r0
	ands r3, r0
	movs r0, 0x10
	orrs r3, r0
	strb r3, [r2, 0xA]
	bx lr
	.align 2, 0
_08074158: .4byte gPaletteFade
_0807415C: .4byte 0xfffff83f
_08074160: .4byte 0xffff8000
_08074164: .4byte 0xfffe0fff
	thumb_func_end ResetPaletteFadeControl

	thumb_func_start unref_sub_8074168
unref_sub_8074168: @ 8074168
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetPaletteNumByUid
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x10
	beq _0807418C
	ldr r1, _08074190 @ =gPlttBufferFaded + 0x400
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x4]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x4]
_0807418C:
	pop {r0}
	bx r0
	.align 2, 0
_08074190: .4byte gPlttBufferFaded + 0x400
	thumb_func_end unref_sub_8074168

	thumb_func_start unref_sub_8074194
unref_sub_8074194: @ 8074194
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl GetPaletteNumByUid
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x10
	beq _080741BA
	ldr r0, _080741C0 @ =gPlttBufferFaded + 0x400
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x4]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x4]
_080741BA:
	pop {r0}
	bx r0
	.align 2, 0
_080741C0: .4byte gPlttBufferFaded + 0x400
	thumb_func_end unref_sub_8074194

	thumb_func_start GetPaletteNumByUid
GetPaletteNumByUid: @ 8074584
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _080745A4 @ =gPlttBufferFaded + 0x400
_0807458E:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	ldrh r0, [r0]
	cmp r0, r2
	bne _080745A8
	adds r0, r1, 0
	b _080745B4
	.align 2, 0
_080745A4: .4byte gPlttBufferFaded + 0x400
_080745A8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0807458E
	movs r0, 0x10
_080745B4:
	pop {r1}
	bx r1
	thumb_func_end GetPaletteNumByUid

	thumb_func_start UpdateNormalPaletteFade
UpdateNormalPaletteFade: @ 80745B8
	push {r4-r7,lr}
	ldr r4, _080745CC @ =gPaletteFade
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080745D0
	movs r0, 0
	b _080746EC
	.align 2, 0
_080745CC: .4byte gPaletteFade
_080745D0:
	bl IsSoftwarePaletteFadeFinishing
	lsls r0, 24
	cmp r0, 0
	beq _080745DE
	ldrb r0, [r4, 0x7]
	b _080746EA
_080745DE:
	ldrb r1, [r4, 0xA]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08074612
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 26
	ldrb r0, [r4, 0x8]
	lsls r0, 26
	cmp r1, r0
	bcs _0807460A
	lsrs r0, r1, 26
	adds r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	movs r0, 0x2
	b _080746EC
_0807460A:
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	strb r0, [r4, 0x4]
_08074612:
	movs r5, 0
	ldr r2, _08074628 @ =gPaletteFade
	ldrb r1, [r2, 0xA]
	movs r0, 0x4
	ands r0, r1
	adds r7, r2, 0
	cmp r0, 0
	bne _0807462C
	ldrh r4, [r7]
	b _08074632
	.align 2, 0
_08074628: .4byte gPaletteFade
_0807462C:
	ldrh r4, [r7, 0x2]
	movs r5, 0x80
	lsls r5, 1
_08074632:
	cmp r4, 0
	beq _08074664
	ldr r7, _080746A0 @ =gPaletteFade
	adds r6, r7, 0
_0807463A:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08074656
	ldrh r2, [r6, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r6, 0x6]
	lsls r3, 17
	lsrs r3, 17
	adds r0, r5, 0
	movs r1, 0x10
	bl BlendPalette
_08074656:
	lsrs r4, 1
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0
	bne _0807463A
_08074664:
	ldrb r2, [r7, 0xA]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r4, 0x5
	negs r4, r4
	ands r4, r2
	orrs r4, r1
	strb r4, [r7, 0xA]
	movs r0, 0x4
	ands r0, r4
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080746E8
	ldrh r6, [r7, 0x4]
	lsls r2, r6, 21
	ldrb r0, [r7, 0x5]
	lsls r5, r0, 24
	lsrs r1, r2, 27
	lsrs r0, r5, 27
	cmp r1, r0
	bne _080746A4
	str r3, [r7]
	movs r0, 0x2
	orrs r4, r0
	strb r4, [r7, 0xA]
	b _080746E8
	.align 2, 0
_080746A0: .4byte gPaletteFade
_080746A4:
	ldrb r1, [r7, 0x8]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080746C0
	lsrs r3, r2, 27
	lsls r0, r4, 25
	lsrs r0, 28
	adds r3, r0, r3
	lsrs r0, r5, 27
	cmp r3, r0
	ble _080746D6
	adds r3, r0, 0
	b _080746D6
_080746C0:
	lsrs r3, r2, 27
	lsls r0, r4, 25
	lsrs r0, 28
	subs r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	asrs r0, 24
	lsrs r1, r5, 27
	cmp r0, r1
	bge _080746D6
	adds r3, r1, 0
_080746D6:
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 6
	ldr r1, _080746F4 @ =0xfffff83f
	ands r1, r6
	orrs r1, r0
	strh r1, [r7, 0x4]
_080746E8:
	ldrb r0, [r7, 0x7]
_080746EA:
	lsrs r0, 7
_080746EC:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080746F4: .4byte 0xfffff83f
	thumb_func_end UpdateNormalPaletteFade

	thumb_func_start InvertPlttBuffer
InvertPlttBuffer: @ 8074338
	push {r4-r7,lr}
	adds r1, r0, 0
	movs r3, 0
	cmp r1, 0
	beq _08074376
	ldr r7, _0807437C @ =gPlttBufferFaded
_08074344:
	movs r0, 0x1
	ands r0, r1
	lsrs r4, r1, 1
	adds r5, r3, 0
	adds r5, 0x10
	cmp r0, 0
	beq _0807436C
	movs r2, 0
	adds r6, r7, 0
_08074356:
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r0]
	mvns r1, r1
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08074356
_0807436C:
	adds r1, r4, 0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	cmp r1, 0
	bne _08074344
_08074376:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807437C: .4byte gPlttBufferFaded
	thumb_func_end InvertPlttBuffer

	thumb_func_start TintPlttBuffer
TintPlttBuffer: @ 8074380
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x4]
	movs r0, 0
	mov r9, r0
	cmp r4, 0
	beq _0807443C
	lsls r1, 24
	str r1, [sp, 0x8]
_080743AA:
	movs r0, 0x1
	ands r0, r4
	lsrs r4, 1
	str r4, [sp, 0xC]
	movs r1, 0x10
	add r1, r9
	mov r10, r1
	cmp r0, 0
	beq _0807442E
	movs r4, 0
	ldr r2, _0807444C @ =gPlttBufferFaded
	mov r8, r2
	ldr r1, [sp]
	lsls r0, r1, 24
	ldr r2, [sp, 0x4]
	lsls r1, r2, 24
	ldr r2, [sp, 0x8]
	asrs r2, 24
	mov r12, r2
	movs r5, 0x1F
	asrs r7, r0, 24
	asrs r6, r1, 24
_080743D6:
	mov r0, r9
	adds r2, r0, r4
	lsls r2, 1
	add r2, r8
	ldr r1, [r2]
	lsls r1, 27
	lsrs r1, 27
	add r1, r12
	ands r1, r5
	ldrb r3, [r2]
	movs r0, 0x20
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r2]
	lsls r1, 22
	lsrs r1, 27
	adds r1, r7
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 5
	ldrh r3, [r2]
	ldr r0, _08074450 @ =0xfffffc1f
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r2]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6
	ands r1, r5
	lsls r1, 2
	ldrb r3, [r2, 0x1]
	movs r0, 0x7D
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080743D6
_0807442E:
	ldr r4, [sp, 0xC]
	mov r1, r10
	lsls r0, r1, 16
	lsrs r0, 16
	mov r9, r0
	cmp r4, 0
	bne _080743AA
_0807443C:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807444C: .4byte gPlttBufferFaded
_08074450: .4byte 0xfffffc1f
	thumb_func_end TintPlttBuffer

	thumb_func_start UnfadePlttBuffer
UnfadePlttBuffer: @ 8074454
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r1, r0, 0
	movs r3, 0
	cmp r1, 0
	beq _0807449E
	ldr r0, _080744A8 @ =gPlttBufferFaded
	mov r8, r0
	ldr r0, _080744AC @ =gPlttBufferUnfaded
	mov r12, r0
_0807446A:
	movs r0, 0x1
	ands r0, r1
	lsrs r4, r1, 1
	adds r5, r3, 0
	adds r5, 0x10
	cmp r0, 0
	beq _08074494
	movs r2, 0
	mov r7, r8
	mov r6, r12
_0807447E:
	adds r0, r3, r2
	lsls r0, 1
	adds r1, r0, r7
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0807447E
_08074494:
	adds r1, r4, 0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	cmp r1, 0
	bne _0807446A
_0807449E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080744A8: .4byte gPlttBufferFaded
_080744AC: .4byte gPlttBufferUnfaded
	thumb_func_end UnfadePlttBuffer

	thumb_func_start BeginFastPaletteFade
BeginFastPaletteFade: @ 80744B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080744D0 @ =gPaletteFade
	ldrb r2, [r3, 0xA]
	movs r1, 0x79
	negs r1, r1
	ands r1, r2
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r3, 0xA]
	bl BeginFastPaletteFadeInternal
	pop {r0}
	bx r0
	.align 2, 0
_080744D0: .4byte gPaletteFade
	thumb_func_end BeginFastPaletteFade

	thumb_func_start BeginFastPaletteFadeInternal
BeginFastPaletteFadeInternal: @ 8074894
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r2, _08074908 @ =gPaletteFade
	ldrh r0, [r2, 0x4]
	movs r3, 0xF8
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2, 0x4]
	movs r1, 0x3F
	ands r1, r4
	ldrb r3, [r2, 0x8]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldrb r0, [r2, 0x7]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x7]
	ldrb r1, [r2, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	cmp r4, 0x2
	bne _080748E6
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807490C @ =gPlttBufferFaded
	ldr r2, _08074910 @ =0x01000200
	mov r0, sp
	bl CpuSet
_080748E6:
	cmp r4, 0
	bne _080748FC
	mov r0, sp
	adds r0, 0x2
	ldr r2, _08074914 @ =0x00007fff
	adds r1, r2, 0
	strh r1, [r0]
	ldr r1, _0807490C @ =gPlttBufferFaded
	ldr r2, _08074910 @ =0x01000200
	bl CpuSet
_080748FC:
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074908: .4byte gPaletteFade
_0807490C: .4byte gPlttBufferFaded
_08074910: .4byte 0x01000200
_08074914: .4byte 0x00007fff
	thumb_func_end BeginFastPaletteFadeInternal

	thumb_func_start UpdateFastPaletteFade
UpdateFastPaletteFade: @ 8074918
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, _08074934 @ =gPaletteFade
	ldrb r1, [r4, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08074938
	movs r0, 0
	b _08074C72
	.align 2, 0
_08074934: .4byte gPaletteFade
_08074938:
	bl IsSoftwarePaletteFadeFinishing
	lsls r0, 24
	cmp r0, 0
	beq _08074946
	ldrb r0, [r4, 0x7]
	b _08074C70
_08074946:
	ldrb r1, [r4, 0xA]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0807495C
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 2
	mov r10, r0
	b _08074964
_0807495C:
	movs r2, 0
	movs r1, 0x80
	lsls r1, 1
	mov r10, r1
_08074964:
	ldr r1, _0807497C @ =gPaletteFade
	ldrb r0, [r1, 0x8]
	lsls r0, 26
	lsrs r0, 26
	cmp r0, 0x1
	beq _08074A24
	cmp r0, 0x1
	bgt _08074980
	cmp r0, 0
	beq _0807498E
	b _08074B74
	.align 2, 0
_0807497C: .4byte gPaletteFade
_08074980:
	cmp r0, 0x2
	bne _08074986
	b _08074A88
_08074986:
	cmp r0, 0x3
	bne _0807498C
	b _08074B10
_0807498C:
	b _08074B74
_0807498E:
	adds r7, r2, 0
	cmp r7, r10
	bcc _08074996
	b _08074B74
_08074996:
	lsls r2, r7, 1
	ldr r0, _08074A1C @ =gPlttBufferUnfaded
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, 27
	lsls r0, r1, 22
	lsrs r0, 27
	mov r12, r0
	lsls r1, 17
	lsrs r1, 27
	mov r8, r1
	ldr r0, _08074A20 @ =gPlttBufferFaded
	adds r2, r0
	mov r9, r2
	ldr r1, [r2]
	lsls r2, r1, 27
	lsrs r2, 3
	movs r4, 0xFE
	lsls r4, 24
	adds r2, r4
	lsls r0, r1, 22
	lsrs r0, 27
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 17
	lsrs r1, 27
	subs r1, 0x2
	lsls r1, 24
	lsrs r4, r1, 24
	lsrs r6, r2, 24
	asrs r2, 24
	lsrs r3, 3
	asrs r0, r3, 24
	cmp r2, r0
	bge _080749E0
	lsrs r6, r3, 24
_080749E0:
	lsls r0, r5, 24
	asrs r0, 24
	mov r2, r12
	lsls r1, r2, 24
	cmp r0, r12
	bge _080749EE
	lsrs r5, r1, 24
_080749EE:
	lsls r0, r4, 24
	asrs r0, 24
	mov r3, r8
	lsls r1, r3, 24
	cmp r0, r8
	bge _080749FC
	lsrs r4, r1, 24
_080749FC:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	mov r4, r9
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08074996
	b _08074B74
	.align 2, 0
_08074A1C: .4byte gPlttBufferUnfaded
_08074A20: .4byte gPlttBufferFaded
_08074A24:
	adds r7, r2, 0
	cmp r7, r10
	bcc _08074A2C
	b _08074B74
_08074A2C:
	lsls r1, r7, 1
	ldr r0, _08074A84 @ =gPlttBufferFaded
	adds r2, r1, r0
	ldr r1, [r2]
	lsls r0, r1, 27
	lsrs r0, 3
	movs r3, 0x80
	lsls r3, 18
	adds r0, r3
	lsrs r6, r0, 24
	lsls r0, r1, 22
	lsrs r0, 27
	adds r5, r0, 0x2
	lsls r1, 17
	lsrs r1, 27
	adds r4, r1, 0x2
	cmp r6, 0x1F
	ble _08074A52
	movs r6, 0x1F
_08074A52:
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0x1F
	ble _08074A5C
	movs r5, 0x1F
_08074A5C:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x1F
	ble _08074A66
	movs r4, 0x1F
_08074A66:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	strh r1, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08074A2C
	b _08074B74
	.align 2, 0
_08074A84: .4byte gPlttBufferFaded
_08074A88:
	adds r7, r2, 0
	cmp r7, r10
	bcs _08074B74
_08074A8E:
	lsls r2, r7, 1
	ldr r0, _08074B08 @ =gPlttBufferUnfaded
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, 27
	lsls r0, r1, 22
	lsrs r0, 27
	mov r12, r0
	lsls r1, 17
	lsrs r1, 27
	mov r8, r1
	ldr r0, _08074B0C @ =gPlttBufferFaded
	adds r2, r0
	ldr r1, [r2]
	lsls r0, r1, 27
	lsrs r0, 3
	movs r4, 0x80
	lsls r4, 18
	adds r0, r4
	lsrs r6, r0, 24
	lsls r0, r1, 22
	lsrs r0, 27
	adds r5, r0, 0x2
	lsls r1, 17
	lsrs r1, 27
	adds r4, r1, 0x2
	lsrs r3, 3
	asrs r0, r3, 24
	cmp r6, r0
	ble _08074ACC
	lsrs r6, r3, 24
_08074ACC:
	lsls r0, r5, 24
	asrs r0, 24
	mov r3, r12
	lsls r1, r3, 24
	cmp r0, r12
	ble _08074ADA
	lsrs r5, r1, 24
_08074ADA:
	lsls r0, r4, 24
	asrs r0, 24
	mov r3, r8
	lsls r1, r3, 24
	cmp r0, r8
	ble _08074AE8
	lsrs r4, r1, 24
_08074AE8:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	strh r1, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08074A8E
	b _08074B74
	.align 2, 0
_08074B08: .4byte gPlttBufferUnfaded
_08074B0C: .4byte gPlttBufferFaded
_08074B10:
	adds r7, r2, 0
	cmp r7, r10
	bcs _08074B74
	ldr r4, _08074B9C @ =gPlttBufferFaded
	mov r8, r4
_08074B1A:
	lsls r0, r7, 1
	mov r1, r8
	adds r3, r0, r1
	ldr r1, [r3]
	lsls r2, r1, 27
	lsrs r2, 3
	movs r4, 0xFE
	lsls r4, 24
	adds r2, r4
	lsls r0, r1, 22
	lsrs r0, 27
	subs r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 17
	lsrs r1, 27
	subs r1, 0x2
	lsls r1, 24
	lsrs r4, r1, 24
	lsrs r6, r2, 24
	cmp r2, 0
	bge _08074B48
	movs r6, 0
_08074B48:
	lsls r0, r5, 24
	cmp r0, 0
	bge _08074B50
	movs r5, 0
_08074B50:
	lsls r0, r4, 24
	cmp r0, 0
	bge _08074B58
	movs r4, 0
_08074B58:
	lsls r1, r6, 24
	asrs r1, 24
	lsls r0, r5, 24
	asrs r0, 19
	orrs r1, r0
	lsls r0, r4, 24
	asrs r0, 14
	orrs r1, r0
	strh r1, [r3]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, r10
	bcc _08074B1A
_08074B74:
	ldr r0, _08074BA0 @ =gPaletteFade
	ldrb r2, [r0, 0xA]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r3, 0x5
	negs r3, r3
	ands r3, r2
	orrs r3, r1
	ldr r1, _08074BA0 @ =gPaletteFade
	strb r3, [r1, 0xA]
	movs r0, 0x4
	ands r0, r3
	cmp r0, 0
	beq _08074BA4
	ldrb r0, [r1, 0x7]
	b _08074C70
	.align 2, 0
_08074B9C: .4byte gPlttBufferFaded
_08074BA0: .4byte gPaletteFade
_08074BA4:
	ldr r2, _08074BC0 @ =gPaletteFade
	ldrh r4, [r2, 0x4]
	lsls r5, r4, 21
	lsrs r0, r5, 27
	lsls r2, r3, 25
	lsrs r1, r2, 28
	subs r0, r1
	cmp r0, 0
	bge _08074BC8
	ldr r0, _08074BC4 @ =0xfffff83f
	ands r0, r4
	ldr r3, _08074BC0 @ =gPaletteFade
	strh r0, [r3, 0x4]
	b _08074BDE
	.align 2, 0
_08074BC0: .4byte gPaletteFade
_08074BC4: .4byte 0xfffff83f
_08074BC8:
	lsrs r1, r5, 27
	lsrs r0, r2, 28
	subs r1, r0
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 6
	ldr r0, _08074C04 @ =0xfffff83f
	ands r0, r4
	orrs r0, r1
	ldr r4, _08074C08 @ =gPaletteFade
	strh r0, [r4, 0x4]
_08074BDE:
	ldr r1, _08074C08 @ =gPaletteFade
	ldrh r0, [r1, 0x4]
	movs r1, 0xF8
	lsls r1, 3
	ands r1, r0
	cmp r1, 0
	bne _08074C6C
	ldr r2, _08074C08 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	lsls r0, 26
	lsrs r0, 26
	cmp r0, 0x1
	beq _08074C30
	cmp r0, 0x1
	bgt _08074C0C
	cmp r0, 0
	beq _08074C16
	b _08074C58
	.align 2, 0
_08074C04: .4byte 0xfffff83f
_08074C08: .4byte gPaletteFade
_08074C0C:
	cmp r0, 0x2
	beq _08074C16
	cmp r0, 0x3
	beq _08074C4C
	b _08074C58
_08074C16:
	ldr r0, _08074C24 @ =gPlttBufferUnfaded
	ldr r1, _08074C28 @ =gPlttBufferFaded
	ldr r2, _08074C2C @ =0x04000100
	bl CpuSet
	b _08074C58
	.align 2, 0
_08074C24: .4byte gPlttBufferUnfaded
_08074C28: .4byte gPlttBufferFaded
_08074C2C: .4byte 0x04000100
_08074C30:
	movs r0, 0x1
	negs r0, r0
	str r0, [sp]
	ldr r1, _08074C44 @ =gPlttBufferFaded
	ldr r2, _08074C48 @ =0x05000100
	mov r0, sp
	bl CpuSet
	b _08074C58
	.align 2, 0
_08074C44: .4byte gPlttBufferFaded
_08074C48: .4byte 0x05000100
_08074C4C:
	str r1, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _08074C84 @ =gPlttBufferFaded
	ldr r2, _08074C88 @ =0x05000100
	bl CpuSet
_08074C58:
	ldr r2, _08074C8C @ =gPaletteFade
	ldrb r1, [r2, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldrb r0, [r2, 0xA]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0xA]
_08074C6C:
	ldr r3, _08074C8C @ =gPaletteFade
	ldrb r0, [r3, 0x7]
_08074C70:
	lsrs r0, 7
_08074C72:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074C84: .4byte gPlttBufferFaded
_08074C88: .4byte 0x05000100
_08074C8C: .4byte gPaletteFade
	thumb_func_end UpdateFastPaletteFade

	thumb_func_start BeginHardwarePaletteFade
BeginHardwarePaletteFade: @ 80748D0
	push {r4-r7,lr}
	ldr r5, [sp, 0x14]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r7, _08074958 @ =gPaletteFade
	str r0, [r7]
	movs r0, 0x3F
	ands r1, r0
	ldrb r4, [r7, 0x4]
	movs r6, 0x40
	negs r6, r6
	adds r0, r6, 0
	ands r0, r4
	orrs r0, r1
	strb r0, [r7, 0x4]
	ldrb r0, [r7, 0x8]
	ands r6, r0
	orrs r6, r1
	strb r6, [r7, 0x8]
	movs r0, 0x1F
	adds r1, r2, 0
	ands r1, r0
	lsls r1, 6
	ldrh r4, [r7, 0x4]
	ldr r0, _0807495C @ =0xfffff83f
	ands r0, r4
	orrs r0, r1
	strh r0, [r7, 0x4]
	lsls r4, r3, 3
	ldrb r1, [r7, 0x5]
	movs r0, 0x7
	ands r0, r1
	orrs r0, r4
	strb r0, [r7, 0x5]
	ldrb r0, [r7, 0x7]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r7, 0x7]
	ldrb r1, [r7, 0x9]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	movs r1, 0x1
	ands r5, r1
	lsls r5, 2
	subs r1, 0x6
	ands r0, r1
	orrs r0, r5
	subs r1, 0x4
	ands r0, r1
	strb r0, [r7, 0x9]
	cmp r2, r3
	bcs _08074960
	movs r0, 0x41
	negs r0, r0
	ands r6, r0
	b _08074964
	.align 2, 0
_08074958: .4byte gPaletteFade
_0807495C: .4byte 0xfffff83f
_08074960:
	movs r0, 0x40
	orrs r6, r0
_08074964:
	strb r6, [r7, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BeginHardwarePaletteFade

	thumb_func_start UpdateHardwarePaletteFade
UpdateHardwarePaletteFade: @ 8074D2C
	push {r4-r7,lr}
	ldr r2, _08074D40 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	bne _08074D44
	movs r0, 0
	b _08074E3C
	.align 2, 0
_08074D40: .4byte gPaletteFade
_08074D44:
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 26
	ldrb r3, [r4, 0x8]
	lsls r0, r3, 26
	cmp r1, r0
	bcs _08074D66
	lsrs r0, r1, 26
	adds r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	movs r0, 0x2
	b _08074E3C
_08074D66:
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	strb r0, [r4, 0x4]
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	bne _08074DC4
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 21
	lsrs r0, 27
	adds r0, 0x1
	movs r7, 0x1F
	ands r0, r7
	lsls r0, 6
	ldr r6, _08074DC0 @ =0xfffff83f
	adds r3, r6, 0
	ands r3, r1
	orrs r3, r0
	strh r3, [r4, 0x4]
	lsls r5, r3, 21
	ldrb r0, [r4, 0x5]
	lsrs r1, r5, 27
	lsrs r0, 3
	cmp r1, r0
	bls _08074E10
	ldrb r2, [r4, 0x9]
	lsls r1, r2, 28
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x9]
	lsrs r0, r5, 27
	subs r0, 0x1
	ands r0, r7
	lsls r0, 6
	ands r3, r6
	b _08074E0C
	.align 2, 0
_08074DC0: .4byte 0xfffff83f
_08074DC4:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 21
	lsrs r0, r1, 27
	subs r0, 0x1
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 6
	ldr r5, _08074E44 @ =0xfffff83f
	adds r3, r5, 0
	ands r3, r2
	orrs r3, r0
	strh r3, [r4, 0x4]
	lsrs r1, 27
	subs r1, 0x1
	ldrb r0, [r4, 0x5]
	lsrs r0, 3
	cmp r1, r0
	bge _08074E10
	ldrb r2, [r4, 0x9]
	lsls r1, r2, 28
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 3
	movs r0, 0x9
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x9]
	lsls r0, r3, 21
	lsrs r0, 27
	adds r0, 0x1
	ands r0, r6
	lsls r0, 6
	ands r3, r5
_08074E0C:
	orrs r3, r0
	strh r3, [r4, 0x4]
_08074E10:
	ldrb r1, [r4, 0x9]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08074E38
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08074E2E
	movs r0, 0
	str r0, [r4]
	ldrh r1, [r4, 0x4]
	ldr r0, _08074E44 @ =0xfffff83f
	ands r0, r1
	strh r0, [r4, 0x4]
_08074E2E:
	ldrb r1, [r4, 0x9]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x9]
_08074E38:
	ldrb r0, [r4, 0x7]
	lsrs r0, 7
_08074E3C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074E44: .4byte 0xfffff83f
	thumb_func_end UpdateHardwarePaletteFade

	thumb_func_start UpdateBlendRegisters
UpdateBlendRegisters: @ 8074E48
	push {lr}
	ldr r1, _08074E8C @ =REG_BLDCNT
	ldr r2, _08074E90 @ =gPaletteFade
	ldr r0, [r2]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r3, [r2, 0x4]
	lsls r0, r3, 21
	lsrs r0, 27
	strh r0, [r1]
	ldrb r1, [r2, 0x9]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08074E86
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	negs r1, r1
	ands r0, r1
	strb r0, [r2, 0x9]
	movs r0, 0
	str r0, [r2]
	ldr r0, _08074E94 @ =0xfffff83f
	ands r0, r3
	strh r0, [r2, 0x4]
	ldrb r1, [r2, 0x7]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x7]
_08074E86:
	pop {r0}
	bx r0
	.align 2, 0
_08074E8C: .4byte REG_BLDCNT
_08074E90: .4byte gPaletteFade
_08074E94: .4byte 0xfffff83f
	thumb_func_end UpdateBlendRegisters

	thumb_func_start IsSoftwarePaletteFadeFinishing
IsSoftwarePaletteFadeFinishing: @ 8074E98
	push {r4,lr}
	ldr r3, _08074ED0 @ =gPaletteFade
	ldrb r4, [r3, 0xA]
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _08074EF4
	ldr r2, [r3, 0x8]
	movs r0, 0xF8
	lsls r0, 9
	ands r0, r2
	movs r1, 0x80
	lsls r1, 7
	cmp r0, r1
	bne _08074ED8
	ldrb r1, [r3, 0x7]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r3, 0x7]
	movs r0, 0x3
	negs r0, r0
	ands r0, r4
	strb r0, [r3, 0xA]
	ldr r0, [r3, 0x8]
	ldr r1, _08074ED4 @ =0xfffe0fff
	ands r0, r1
	str r0, [r3, 0x8]
	b _08074EEC
	.align 2, 0
_08074ED0: .4byte gPaletteFade
_08074ED4: .4byte 0xfffe0fff
_08074ED8:
	lsls r0, r2, 15
	lsrs r0, 27
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 12
	ldr r1, _08074EF0 @ =0xfffe0fff
	ands r1, r2
	orrs r1, r0
	str r1, [r3, 0x8]
_08074EEC:
	movs r0, 0x1
	b _08074EF6
	.align 2, 0
_08074EF0: .4byte 0xfffe0fff
_08074EF4:
	movs r0, 0
_08074EF6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsSoftwarePaletteFadeFinishing

	thumb_func_start BlendPalettes
BlendPalettes: @ 8074B3C
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 16
	lsrs r6, r2, 16
	movs r5, 0
	cmp r4, 0
	beq _08074B70
_08074B4E:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _08074B62
	adds r0, r5, 0
	movs r1, 0x10
	adds r2, r7, 0
	adds r3, r6, 0
	bl BlendPalette
_08074B62:
	lsrs r4, 1
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0
	bne _08074B4E
_08074B70:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BlendPalettes

	thumb_func_start BlendPalettesUnfaded
BlendPalettesUnfaded: @ 8074B78
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _08074B9C @ =gPlttBufferUnfaded
	ldr r5, _08074BA0 @ =gPlttBufferFaded
	ldr r3, _08074BA4 @ =0x040000d4
	str r4, [r3]
	str r5, [r3, 0x4]
	ldr r4, _08074BA8 @ =0x84000100
	str r4, [r3, 0x8]
	ldr r3, [r3, 0x8]
	bl BlendPalettes
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074B9C: .4byte gPlttBufferUnfaded
_08074BA0: .4byte gPlttBufferFaded
_08074BA4: .4byte 0x040000d4
_08074BA8: .4byte 0x84000100
	thumb_func_end BlendPalettesUnfaded

	.align 2, 0 @ Don't pad with nop.
