	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start PlayTimeCounter_Reset
PlayTimeCounter_Reset: @ 8052C28
	ldr r1, _08052C40 @ =0x0300057c
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08052C44 @ =gSaveBlock2
	movs r2, 0
	movs r0, 0
	strh r0, [r1, 0xE]
	strb r2, [r1, 0x10]
	strb r2, [r1, 0x11]
	strb r2, [r1, 0x12]
	bx lr
	.align 2, 0
_08052C40: .4byte 0x0300057c
_08052C44: .4byte gSaveBlock2
	thumb_func_end PlayTimeCounter_Reset

	thumb_func_start PlayTimeCounter_Start
PlayTimeCounter_Start: @ 8052C48
	push {lr}
	ldr r1, _08052C64 @ =0x0300057c
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _08052C68 @ =gSaveBlock2
	ldrh r1, [r0, 0xE]
	ldr r0, _08052C6C @ =0x000003e7
	cmp r1, r0
	bls _08052C5E
	bl PlayTimeCounter_SetToMax
_08052C5E:
	pop {r0}
	bx r0
	.align 2, 0
_08052C64: .4byte 0x0300057c
_08052C68: .4byte gSaveBlock2
_08052C6C: .4byte 0x000003e7
	thumb_func_end PlayTimeCounter_Start

	thumb_func_start PlayTimeCounter_Stop
PlayTimeCounter_Stop: @ 8052C70
	ldr r1, _08052C78 @ =0x0300057c
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08052C78: .4byte 0x0300057c
	thumb_func_end PlayTimeCounter_Stop

	thumb_func_start PlayTimeCounter_Update
PlayTimeCounter_Update: @ 8052C7C
	push {lr}
	ldr r0, _08052CD0 @ =0x0300057c
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08052CCC
	ldr r1, _08052CD4 @ =gSaveBlock2
	ldrb r0, [r1, 0x12]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1, 0x12]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08052CCC
	strb r2, [r1, 0x12]
	ldrb r0, [r1, 0x11]
	adds r0, 0x1
	strb r0, [r1, 0x11]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08052CCC
	strb r2, [r1, 0x11]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _08052CCC
	strb r2, [r1, 0x10]
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	ldr r1, _08052CD8 @ =0x03e70000
	cmp r0, r1
	bls _08052CCC
	bl PlayTimeCounter_SetToMax
_08052CCC:
	pop {r0}
	bx r0
	.align 2, 0
_08052CD0: .4byte 0x0300057c
_08052CD4: .4byte gSaveBlock2
_08052CD8: .4byte 0x03e70000
	thumb_func_end PlayTimeCounter_Update

	thumb_func_start PlayTimeCounter_SetToMax
PlayTimeCounter_SetToMax: @ 8052CDC
	ldr r1, _08052CF4 @ =0x0300057c
	movs r0, 0x2
	strb r0, [r1]
	ldr r1, _08052CF8 @ =gSaveBlock2
	ldr r0, _08052CFC @ =0x000003e7
	strh r0, [r1, 0xE]
	movs r0, 0x3B
	strb r0, [r1, 0x10]
	strb r0, [r1, 0x11]
	strb r0, [r1, 0x12]
	bx lr
	.align 2, 0
_08052CF4: .4byte 0x0300057c
_08052CF8: .4byte gSaveBlock2
_08052CFC: .4byte 0x000003e7
	thumb_func_end PlayTimeCounter_SetToMax

	.align 2, 0 @ Don't pad with nop.
