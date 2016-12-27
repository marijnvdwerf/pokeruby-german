	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start PlayTimeCounter_Reset
PlayTimeCounter_Reset: @ 8052F68
	ldr r1, _08052F80
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08052F84
	movs r2, 0
	movs r0, 0
	strh r0, [r1, 0xE]
	strb r2, [r1, 0x10]
	strb r2, [r1, 0x11]
	strb r2, [r1, 0x12]
	bx lr
	.align 2, 0
_08052F80: .4byte 0x0300057c
_08052F84: .4byte gSaveBlock2
	thumb_func_end PlayTimeCounter_Reset

	thumb_func_start PlayTimeCounter_Start
PlayTimeCounter_Start: @ 8052F88
	push {lr}
	ldr r1, _08052FA4
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08052FA8
	ldrh r1, [r0, 0xE]
	ldr r0, _08052FAC
	cmp r1, r0
	bls _08052F9E
	bl PlayTimeCounter_SetToMax
_08052F9E:
	pop {r0}
	bx r0
	.align 2, 0
_08052FA4: .4byte 0x0300057c
_08052FA8: .4byte gSaveBlock2
_08052FAC: .4byte 0x000003e7
	thumb_func_end PlayTimeCounter_Start

	thumb_func_start PlayTimeCounter_Stop
PlayTimeCounter_Stop: @ 8052FB0
	ldr r1, _08052FB8
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08052FB8: .4byte 0x0300057c
	thumb_func_end PlayTimeCounter_Stop

	thumb_func_start PlayTimeCounter_Update
PlayTimeCounter_Update: @ 8052FBC
	push {lr}
	ldr r0, _08053010
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0805300C
	ldr r1, _08053014
	ldrb r0, [r1, 0x12]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1, 0x12]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _0805300C
	strb r2, [r1, 0x12]
	ldrb r0, [r1, 0x11]
	adds r0, 0x1
	strb r0, [r1, 0x11]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _0805300C
	strb r2, [r1, 0x11]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _0805300C
	strb r2, [r1, 0x10]
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	ldr r1, _08053018
	cmp r0, r1
	bls _0805300C
	bl PlayTimeCounter_SetToMax
_0805300C:
	pop {r0}
	bx r0
	.align 2, 0
_08053010: .4byte 0x0300057c
_08053014: .4byte gSaveBlock2
_08053018: .4byte 0x03e70000
	thumb_func_end PlayTimeCounter_Update

	thumb_func_start PlayTimeCounter_SetToMax
PlayTimeCounter_SetToMax: @ 805301C
	ldr r1, _08053034
	movs r0, 0x2
	strb r0, [r1]
	ldr r1, _08053038
	ldr r0, _0805303C
	strh r0, [r1, 0xE]
	movs r0, 0x3B
	strb r0, [r1, 0x10]
	strb r0, [r1, 0x11]
	strb r0, [r1, 0x12]
	bx lr
	.align 2, 0
_08053034: .4byte 0x0300057c
_08053038: .4byte gSaveBlock2
_0805303C: .4byte 0x000003e7
	thumb_func_end PlayTimeCounter_SetToMax

	.align 2, 0 @ Don't pad with nop.
