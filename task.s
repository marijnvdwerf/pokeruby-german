	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ResetTasks
ResetTasks: @ 807AA28
	push {r4-r7,lr}
	movs r4, 0
	ldr r6, _0807AA7C @ =gTasks
	adds r7, r6, 0
	adds r7, 0x8
_0807AA32:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
	movs r1, 0
	strb r1, [r2, 0x4]
	ldr r1, _0807AA80 @ =TaskDummy
	str r1, [r2]
	strb r4, [r2, 0x5]
	adds r4, 0x1
	strb r4, [r2, 0x6]
	movs r1, 0x1
	negs r1, r1
	adds r5, r1, 0
	movs r1, 0xFF
	strb r1, [r2, 0x7]
	adds r0, r7
	movs r1, 0
	movs r2, 0x20
	bl memset
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0xF
	bls _0807AA32
	ldr r0, _0807AA7C @ =gTasks
	movs r1, 0xFE
	strb r1, [r0, 0x5]
	ldr r1, _0807AA84 @ =0x0000025e
	adds r0, r1
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AA7C: .4byte gTasks
_0807AA80: .4byte TaskDummy
_0807AA84: .4byte 0x0000025e
	thumb_func_end ResetTasks

	thumb_func_start CreateTask
CreateTask: @ 807AA88
	push {r4-r7,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r6, 0
	ldr r7, _0807AAC4 @ =gTasks
_0807AA94:
	lsls r0, r6, 2
	adds r0, r6
	lsls r5, r0, 3
	adds r4, r5, r7
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _0807AAC8
	str r2, [r4]
	strb r1, [r4, 0x7]
	adds r0, r6, 0
	bl InsertTask
	adds r0, r7, 0
	adds r0, 0x8
	adds r0, r5, r0
	movs r1, 0
	movs r2, 0x20
	bl memset
	movs r0, 0x1
	strb r0, [r4, 0x4]
	adds r0, r6, 0
	b _0807AAD4
	.align 2, 0
_0807AAC4: .4byte gTasks
_0807AAC8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _0807AA94
	movs r0, 0
_0807AAD4:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateTask

	thumb_func_start InsertTask
InsertTask: @ 807AE9C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	bl FindFirstActiveTask
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	bne _0807AECC
	ldr r1, _0807AEC8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xFE
	strb r1, [r0, 0x5]
	movs r1, 0xFF
	strb r1, [r0, 0x6]
	b _0807AF28
	.align 2, 0
_0807AEC8: .4byte gTasks
_0807AECC:
	ldr r6, _0807AF08 @ =gTasks
	lsls r0, r4, 2
	mov r12, r0
	mov r8, r6
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
_0807AEDA:
	lsls r0, r1, 2
	adds r0, r1
	lsls r5, r0, 3
	mov r7, r8
	adds r3, r5, r7
	ldrb r0, [r2, 0x7]
	ldrb r7, [r3, 0x7]
	cmp r0, r7
	bcs _0807AF0C
	ldrb r0, [r3, 0x5]
	strb r0, [r2, 0x5]
	strb r1, [r2, 0x6]
	ldrb r0, [r3, 0x5]
	cmp r0, 0xFE
	beq _0807AF04
	adds r1, r0, 0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r8
	strb r4, [r0, 0x6]
_0807AF04:
	strb r4, [r3, 0x5]
	b _0807AF28
	.align 2, 0
_0807AF08: .4byte gTasks
_0807AF0C:
	ldrb r0, [r3, 0x6]
	cmp r0, 0xFF
	beq _0807AF16
	adds r1, r0, 0
	b _0807AEDA
_0807AF16:
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r6
	strb r1, [r0, 0x5]
	adds r2, r5, r6
	ldrb r1, [r2, 0x6]
	strb r1, [r0, 0x6]
	strb r4, [r2, 0x6]
_0807AF28:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end InsertTask

	thumb_func_start DestroyTask
DestroyTask: @ 807AB74
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0807ABA8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r4
	ldrb r0, [r2, 0x4]
	cmp r0, 0
	beq _0807ABDE
	movs r0, 0
	strb r0, [r2, 0x4]
	ldrb r3, [r2, 0x5]
	cmp r3, 0xFE
	bne _0807ABAC
	ldrb r0, [r2, 0x6]
	cmp r0, 0xFF
	beq _0807ABDE
	adds r1, r0, 0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	strb r3, [r0, 0x5]
	b _0807ABDE
	.align 2, 0
_0807ABA8: .4byte gTasks
_0807ABAC:
	ldrb r3, [r2, 0x6]
	adds r0, r3, 0
	cmp r0, 0xFF
	bne _0807ABC4
	ldrb r0, [r2, 0x5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0xFF
	strb r0, [r1, 0x6]
	b _0807ABDE
_0807ABC4:
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	strb r3, [r0, 0x6]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldrb r1, [r2, 0x5]
	strb r1, [r0, 0x5]
_0807ABDE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroyTask

	thumb_func_start RunTasks
RunTasks: @ 807ABE4
	push {r4,r5,lr}
	bl FindFirstActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0807AC08
	ldr r5, _0807AC10 @ =gTasks
_0807ABF4:
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r5
	ldr r1, [r4]
	bl _call_via_r1
	ldrb r0, [r4, 0x6]
	cmp r0, 0xFF
	bne _0807ABF4
_0807AC08:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AC10: .4byte gTasks
	thumb_func_end RunTasks

	thumb_func_start FindFirstActiveTask
FindFirstActiveTask: @ 807AFD4
	push {lr}
	movs r2, 0
	ldr r0, _0807B00C @ =gTasks
	ldrb r1, [r0, 0x4]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _0807AFE8
	ldrb r0, [r3, 0x5]
	cmp r0, 0xFE
	beq _0807B006
_0807AFE8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _0807B006
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r3
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _0807AFE8
	ldrb r0, [r1, 0x5]
	cmp r0, 0xFE
	bne _0807AFE8
_0807B006:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0807B00C: .4byte gTasks
	thumb_func_end FindFirstActiveTask

	thumb_func_start TaskDummy
TaskDummy: @ 807AC50
	bx lr
	thumb_func_end TaskDummy

	thumb_func_start SetTaskFuncWithFollowupFunc
SetTaskFuncWithFollowupFunc: @ 807AC54
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0807AC84 @ =gTasks
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r0, r3, 0
	adds r0, 0x1C
	adds r4, r5, 0
	adds r4, 0x8
	adds r0, r4
	strh r2, [r0]
	adds r0, r3, 0
	adds r0, 0x1E
	adds r0, r4
	lsrs r2, 16
	strh r2, [r0]
	adds r3, r5
	str r1, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AC84: .4byte gTasks
	thumb_func_end SetTaskFuncWithFollowupFunc

	thumb_func_start SwitchTaskToFollowupFunc
SwitchTaskToFollowupFunc: @ 807AC88
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0807ACB8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r3
	adds r0, r1, 0
	adds r0, 0x1C
	adds r3, 0x8
	adds r0, r3
	ldrh r2, [r0]
	adds r1, 0x1E
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	lsls r0, 16
	orrs r2, r0
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ACB8: .4byte gTasks
	thumb_func_end SwitchTaskToFollowupFunc

	thumb_func_start FuncIsActiveTask
FuncIsActiveTask: @ 807ACBC
	push {r4,lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r4, _0807ACDC @ =gTasks
_0807ACC4:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r4
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _0807ACE0
	ldr r0, [r1]
	cmp r0, r3
	bne _0807ACE0
	movs r0, 0x1
	b _0807ACEC
	.align 2, 0
_0807ACDC: .4byte gTasks
_0807ACE0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0807ACC4
	movs r0, 0
_0807ACEC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FuncIsActiveTask

	thumb_func_start FindTaskIdByFunc
FindTaskIdByFunc: @ 807ACF4
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r1, _0807AD10 @ =gTasks
_0807ACFC:
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	bne _0807AD14
	ldr r0, [r1]
	cmp r0, r3
	bne _0807AD14
	lsls r0, r2, 24
	lsrs r0, 24
	b _0807AD1E
	.align 2, 0
_0807AD10: .4byte gTasks
_0807AD14:
	adds r1, 0x28
	adds r2, 0x1
	cmp r2, 0xF
	ble _0807ACFC
	movs r0, 0xFF
_0807AD1E:
	pop {r1}
	bx r1
	thumb_func_end FindTaskIdByFunc

	thumb_func_start GetTaskCount
GetTaskCount: @ 807AD24
	push {lr}
	movs r2, 0
	movs r1, 0
	ldr r3, _0807AD50 @ =gTasks
_0807AD2C:
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _0807AD40
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0807AD40:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0807AD2C
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0807AD50: .4byte gTasks
	thumb_func_end GetTaskCount

	.align 2, 0 @ Don't pad with nop.
