	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SpriteCB_ResetRtcCusor0
SpriteCB_ResetRtcCusor0: @ 806A7C0
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A7F0 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A8D6
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A8D6
	lsls r0, 2
	ldr r1, _0806A7F4 @ =_0806A7F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A7F0: .4byte gTasks
_0806A7F4: .4byte _0806A7F8
	.align 2, 0
_0806A7F8:
	.4byte _0806A810
	.4byte _0806A834
	.4byte _0806A858
	.4byte _0806A87C
	.4byte _0806A8A6
	.4byte _0806A8D0
_0806A810:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A89E
_0806A834:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A89E
_0806A858:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A89E
_0806A87C:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A89E:
	strh r0, [r3, 0x20]
	movs r0, 0x44
	strh r0, [r3, 0x22]
	b _0806A8D6
_0806A8A6:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x42
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x9B
	strh r0, [r3, 0x20]
	movs r0, 0x50
	strh r0, [r3, 0x22]
	b _0806A8D6
_0806A8D0:
	adds r0, r3, 0
	bl DestroySprite
_0806A8D6:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_ResetRtcCusor0

	thumb_func_start SpriteCB_ResetRtcCusor1
SpriteCB_ResetRtcCusor1: @ 806A8DC
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A90C @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A9D6
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A9D6
	lsls r0, 2
	ldr r1, _0806A910 @ =_0806A914
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A90C: .4byte gTasks
_0806A910: .4byte _0806A914
	.align 2, 0
_0806A914:
	.4byte _0806A92C
	.4byte _0806A950
	.4byte _0806A974
	.4byte _0806A998
	.4byte _0806A9C2
	.4byte _0806A9D0
_0806A92C:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A9BA
_0806A950:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A9BA
_0806A974:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A9BA
_0806A998:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A9BA:
	strh r0, [r3, 0x20]
	movs r0, 0x5C
	strh r0, [r3, 0x22]
	b _0806A9D6
_0806A9C2:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806A9D6
_0806A9D0:
	adds r0, r3, 0
	bl DestroySprite
_0806A9D6:
	pop {r0}
	bx r0
	thumb_func_end SpriteCB_ResetRtcCusor1

	thumb_func_start ResetRtcScreen_CreateCursor
ResetRtcScreen_CreateCursor: @ 806A9DC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806AA4C @ =gUnknown_083764BC
	bl LoadSpritePalette
	ldr r0, _0806AA50 @ =gSpriteTemplate_83764E8
	mov r8, r0
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, _0806AA54 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r6, 0
	adds r4, 0x1C
	adds r2, r0, r4
	ldr r1, _0806AA58 @ =SpriteCB_ResetRtcCusor0
	str r1, [r2]
	adds r0, r6
	strh r5, [r0, 0x2E]
	ldr r1, _0806AA5C @ =0x0000ffff
	strh r1, [r0, 0x30]
	mov r0, r8
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r4
	ldr r1, _0806AA60 @ =SpriteCB_ResetRtcCusor1
	str r1, [r4]
	adds r0, r6
	strh r5, [r0, 0x2E]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AA4C: .4byte gUnknown_083764BC
_0806AA50: .4byte gSpriteTemplate_83764E8
_0806AA54: .4byte gSprites
_0806AA58: .4byte SpriteCB_ResetRtcCusor0
_0806AA5C: .4byte 0x0000ffff
_0806AA60: .4byte SpriteCB_ResetRtcCusor1
	thumb_func_end ResetRtcScreen_CreateCursor

	thumb_func_start ResetRtcScreen_FreeCursorPalette
ResetRtcScreen_FreeCursorPalette: @ 806AA64
	push {lr}
	ldr r0, _0806AA74 @ =gUnknown_083764BC
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0806AA74: .4byte gUnknown_083764BC
	thumb_func_end ResetRtcScreen_FreeCursorPalette

	thumb_func_start ResetRtcScreen_HideChooseTimeWindow
ResetRtcScreen_HideChooseTimeWindow: @ 806AA78
	push {lr}
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end ResetRtcScreen_HideChooseTimeWindow

	thumb_func_start ResetRtcScreen_PrintTime
ResetRtcScreen_PrintTime: @ 806AA8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	adds r0, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x24]
	ldr r2, [sp, 0x28]
	mov r9, r2
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r7, _0806AB7C @ =gStringVar4
	ldr r1, _0806AB80 @ =0x00002710
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x18
	bl __umodsi3
	mov r8, r0
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r6, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	movs r1, 0x3C
	bl __umodsi3
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _0806AB84 @ =gStringVar1
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r1, _0806AB88 @ =gOtherText_Day
	bl StringCopy
	adds r7, r0, 0
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r4, _0806AB8C @ =gUnknown_08376500
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0806AB7C @ =gStringVar4
	mov r1, r10
	ldr r2, [sp]
	bl MenuPrint
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB7C: .4byte gStringVar4
_0806AB80: .4byte 0x00002710
_0806AB84: .4byte gStringVar1
_0806AB88: .4byte gOtherText_Day
_0806AB8C: .4byte gUnknown_08376500
	thumb_func_end ResetRtcScreen_PrintTime

	thumb_func_start ResetRtcScreen_ShowChooseTimeWindow
ResetRtcScreen_ShowChooseTimeWindow: @ 806AB90
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldr r0, _0806ABE8 @ =gOtherText_OK
	movs r1, 0x14
	movs r2, 0x9
	bl MenuPrint
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	adds r2, r6, 0
	mov r3, r8
	bl ResetRtcScreen_PrintTime
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806ABE8: .4byte gOtherText_OK
	thumb_func_end ResetRtcScreen_ShowChooseTimeWindow

	thumb_func_start ResetRtcScreen_MoveTimeUpDown
ResetRtcScreen_MoveTimeUpDown: @ 806ABEC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r3, 16
	lsrs r3, 16
	adds r1, r3, 0
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0806AC06
	ldrh r0, [r4]
	subs r0, 0x1
	b _0806AC20
_0806AC06:
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	beq _0806AC14
	ldrh r0, [r4]
	adds r0, 0x1
	b _0806AC3E
_0806AC14:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0806AC2E
	ldrh r0, [r4]
	subs r0, 0xA
_0806AC20:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bge _0806AC4A
	strh r2, [r4]
	b _0806AC4A
_0806AC2E:
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	bne _0806AC3A
	movs r0, 0
	b _0806AC4C
_0806AC3A:
	ldrh r0, [r4]
	adds r0, 0xA
_0806AC3E:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _0806AC4A
	strh r5, [r4]
_0806AC4A:
	movs r0, 0x1
_0806AC4C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ResetRtcScreen_MoveTimeUpDown

	thumb_func_start Task_ResetRtc_3
Task_ResetRtc_3: @ 806AC54
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806AC68 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_0806AC68: .4byte gTasks
	thumb_func_end Task_ResetRtc_3

	thumb_func_start Task_ResetRtc_2
Task_ResetRtc_2: @ 806AC6C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ResetRtcScreen_HideChooseTimeWindow
	bl ResetRtcScreen_FreeCursorPalette
	ldr r1, _0806AC90 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806AC94 @ =Task_ResetRtc_3
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC90: .4byte gTasks
_0806AC94: .4byte Task_ResetRtc_3
	thumb_func_end Task_ResetRtc_2

	thumb_func_start Task_ResetRtc_1
Task_ResetRtc_1: @ 806AC98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0806ACDC @ =0x03004b38
	mov r8, r0
	adds r5, r7, r0
	ldrb r4, [r5, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806ACE0 @ =gUnknown_08376414
	adds r2, r0, r1
	ldr r1, _0806ACE4 @ =gMain
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	mov r12, r1
	cmp r0, 0
	beq _0806ACEC
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0806ACE8 @ =Task_ResetRtc_2
	str r1, [r0]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	b _0806AD0C
	.align 2, 0
_0806ACDC: .4byte 0x03004b38
_0806ACE0: .4byte gUnknown_08376414
_0806ACE4: .4byte gMain
_0806ACE8: .4byte Task_ResetRtc_2
_0806ACEC:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0806ACFA
	ldrb r0, [r2, 0x7]
	cmp r0, 0
	bne _0806AD0C
_0806ACFA:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806AD16
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _0806AD16
_0806AD0C:
	strh r0, [r5, 0x4]
	movs r0, 0x5
	bl PlaySE
	b _0806AD98
_0806AD16:
	cmp r4, 0x5
	bne _0806AD64
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0806AD98
	ldr r1, _0806AD58 @ =gLocalTime
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
	ldrh r0, [r5, 0x8]
	strb r0, [r1, 0x2]
	ldrh r0, [r5, 0xA]
	strb r0, [r1, 0x3]
	ldrh r0, [r5, 0xC]
	strb r0, [r1, 0x4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806AD5C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806AD60 @ =Task_ResetRtc_2
	str r1, [r0]
	strh r4, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x4]
	b _0806AD98
	.align 2, 0
_0806AD58: .4byte gLocalTime
_0806AD5C: .4byte gTasks
_0806AD60: .4byte Task_ResetRtc_2
_0806AD64:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r1, [r2, 0x2]
	ldrh r2, [r2, 0x4]
	mov r3, r12
	ldrh r4, [r3, 0x30]
	movs r3, 0xC0
	ands r3, r4
	bl ResetRtcScreen_MoveTimeUpDown
	cmp r0, 0
	beq _0806AD98
	movs r0, 0x5
	bl PlaySE
	ldrh r2, [r5, 0x6]
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5, 0xA]
	str r0, [sp]
	ldrb r0, [r5, 0xC]
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	bl ResetRtcScreen_PrintTime
_0806AD98:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_ResetRtc_1

	thumb_func_start Task_ResetRtc_0
Task_ResetRtc_0: @ 806ADA4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, r5, 2
	adds r6, r5
	lsls r6, 3
	ldr r0, _0806AE0C @ =0x03004b38
	mov r8, r0
	adds r4, r6, r0
	movs r0, 0
	strh r0, [r4]
	ldr r3, _0806AE10 @ =gLocalTime
	ldrh r0, [r3]
	strh r0, [r4, 0x6]
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	strh r1, [r4, 0x8]
	movs r2, 0x3
	ldrsb r2, [r3, r2]
	strh r2, [r4, 0xA]
	ldrb r3, [r3, 0x4]
	lsls r3, 24
	asrs r3, 24
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0x6]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl ResetRtcScreen_ShowChooseTimeWindow
	adds r0, r5, 0
	bl ResetRtcScreen_CreateCursor
	movs r0, 0x2
	strh r0, [r4, 0x4]
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r6, r8
	ldr r0, _0806AE14 @ =Task_ResetRtc_1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AE0C: .4byte 0x03004b38
_0806AE10: .4byte gLocalTime
_0806AE14: .4byte Task_ResetRtc_1
	thumb_func_end Task_ResetRtc_0

	thumb_func_start CB2_InitResetRtcScreen
CB2_InitResetRtcScreen: @ 806AE18
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0806AED4 @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0806AED8 @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806AEDC @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806AE56:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0806AE56
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	bl remove_some_task
	bl dp12_8087EA4
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r4, _0806AEE0 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806AEE4 @ =VBlankCB_ResetRtcScreen
	bl SetVBlankCallback
	ldr r0, _0806AEE8 @ =CB2_ResetRtcScreen
	bl SetMainCallback2
	ldr r0, _0806AEEC @ =Task_ResetRtcScreen
	movs r1, 0x50
	bl CreateTask
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AED4: .4byte 0x040000d4
_0806AED8: .4byte 0x81000200
_0806AEDC: .4byte 0x81000800
_0806AEE0: .4byte gWindowConfig_81E6CE4
_0806AEE4: .4byte VBlankCB_ResetRtcScreen
_0806AEE8: .4byte CB2_ResetRtcScreen
_0806AEEC: .4byte Task_ResetRtcScreen
	thumb_func_end CB2_InitResetRtcScreen

	thumb_func_start CB2_ResetRtcScreen
CB2_ResetRtcScreen: @ 806AEF0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_ResetRtcScreen

	thumb_func_start VBlankCB_ResetRtcScreen
VBlankCB_ResetRtcScreen: @ 806AF08
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_ResetRtcScreen

	thumb_func_start ResetRtcScreen_ShowMessage
ResetRtcScreen_ShowMessage: @ 806AF1C
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ResetRtcScreen_ShowMessage

	thumb_func_start Task_ShowResetRtcPrompt
Task_ShowResetRtcPrompt: @ 806AF34
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0806AF54 @ =0x03004b38
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806AF58
	cmp r0, 0x1
	beq _0806AFC0
	b _0806B004
	.align 2, 0
_0806AF54: .4byte 0x03004b38
_0806AF58:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xA
	bl MenuDrawTextWindow
	ldr r0, _0806AFD8 @ =gSystemText_PresentTime
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _0806AFDC @ =gLocalTime
	ldrh r2, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	str r1, [sp]
	ldrb r0, [r0, 0x4]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x3
	bl ResetRtcScreen_PrintTime
	ldr r0, _0806AFE0 @ =gSystemText_PreviousTime
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r1, _0806AFE4 @ =gSaveBlock2
	adds r0, r1, 0
	adds r0, 0xA0
	ldrh r2, [r0]
	adds r0, 0x2
	ldrb r3, [r0]
	adds r0, 0x1
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0xA4
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x7
	bl ResetRtcScreen_PrintTime
	ldr r0, _0806AFE8 @ =gSystemText_ResetRTCPrompt
	bl ResetRtcScreen_ShowMessage
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0806AFC0:
	ldr r0, _0806AFEC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806AFF0
	adds r0, r5, 0
	bl DestroyTask
	bl DoSoftReset
	b _0806B004
	.align 2, 0
_0806AFD8: .4byte gSystemText_PresentTime
_0806AFDC: .4byte gLocalTime
_0806AFE0: .4byte gSystemText_PreviousTime
_0806AFE4: .4byte gSaveBlock2
_0806AFE8: .4byte gSystemText_ResetRTCPrompt
_0806AFEC: .4byte gMain
_0806AFF0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806B004
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl DestroyTask
_0806B004:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end Task_ShowResetRtcPrompt

	thumb_func_start Task_ResetRtcScreen
Task_ResetRtcScreen: @ 806B00C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0806B034 @ =0x03004b38
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _0806B028
	b _0806B204
_0806B028:
	lsls r0, 2
	ldr r1, _0806B038 @ =_0806B03C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B034: .4byte 0x03004b38
_0806B038: .4byte _0806B03C
	.align 2, 0
_0806B03C:
	.4byte _0806B058
	.4byte _0806B074
	.4byte _0806B0C0
	.4byte _0806B118
	.4byte _0806B19C
	.4byte _0806B1CC
	.4byte _0806B1EE
_0806B058:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806B070 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strh r0, [r5]
	b _0806B204
	.align 2, 0
_0806B070: .4byte 0x0000ffff
_0806B074:
	ldr r0, _0806B09C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806B082
	b _0806B204
_0806B082:
	ldr r0, _0806B0A0 @ =gSaveFileStatus
	ldrh r0, [r0]
	cmp r0, 0
	beq _0806B08E
	cmp r0, 0x2
	bne _0806B0A8
_0806B08E:
	ldr r0, _0806B0A4 @ =gSystemText_NoSaveFileNoTime
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x5
	strh r0, [r5]
	b _0806B204
	.align 2, 0
_0806B09C: .4byte gPaletteFade
_0806B0A0: .4byte gSaveFileStatus
_0806B0A4: .4byte gSystemText_NoSaveFileNoTime
_0806B0A8:
	bl RtcCalcLocalTime
	ldr r0, _0806B0BC @ =Task_ShowResetRtcPrompt
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	b _0806B13C
	.align 2, 0
_0806B0BC: .4byte Task_ShowResetRtcPrompt
_0806B0C0:
	ldr r2, _0806B104 @ =gTasks
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _0806B0D6
	b _0806B204
_0806B0D6:
	bl MenuZeroFillScreen
	ldr r0, _0806B108 @ =gSystemText_PleaseResetTime
	bl ResetRtcScreen_ShowMessage
	ldr r2, _0806B10C @ =gLocalTime
	ldr r0, _0806B110 @ =gSaveBlock2
	adds r0, 0xA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806B114 @ =Task_ResetRtc_0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	movs r0, 0x3
	strh r0, [r5]
	b _0806B204
	.align 2, 0
_0806B104: .4byte gTasks
_0806B108: .4byte gSystemText_PleaseResetTime
_0806B10C: .4byte gLocalTime
_0806B110: .4byte gSaveBlock2
_0806B114: .4byte Task_ResetRtc_0
_0806B118:
	ldr r2, _0806B144 @ =gTasks
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0806B204
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806B148
	ldrb r0, [r5, 0x2]
	bl DestroyTask
_0806B13C:
	movs r0, 0x2
	strh r0, [r5]
	b _0806B204
	.align 2, 0
_0806B144: .4byte gTasks
_0806B148:
	ldrb r0, [r5, 0x2]
	bl DestroyTask
	bl RtcReset
	ldr r4, _0806B18C @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	movs r2, 0x3
	ldrsb r2, [r4, r2]
	movs r3, 0x4
	ldrsb r3, [r4, r3]
	bl RtcCalcLocalTimeOffset
	ldr r2, _0806B190 @ =gSaveBlock2
	adds r2, 0xA0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806B194 @ =0x00004040
	ldrh r1, [r4]
	bl VarSet
	bl sub_80691A0
	ldr r0, _0806B198 @ =gSystemText_ClockResetDataSave
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x4
	strh r0, [r5]
	b _0806B204
	.align 2, 0
_0806B18C: .4byte gLocalTime
_0806B190: .4byte gSaveBlock2
_0806B194: .4byte 0x00004040
_0806B198: .4byte gSystemText_ClockResetDataSave
_0806B19C:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B1BC
	ldr r0, _0806B1B8 @ =gSystemText_SaveCompleted
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x49
	bl PlaySE
	b _0806B1C8
	.align 2, 0
_0806B1B8: .4byte gSystemText_SaveCompleted
_0806B1BC:
	ldr r0, _0806B20C @ =gSystemText_SaveFailed
	bl ResetRtcScreen_ShowMessage
	movs r0, 0x16
	bl PlaySE
_0806B1C8:
	movs r0, 0x5
	strh r0, [r5]
_0806B1CC:
	ldr r0, _0806B210 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806B204
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806B214 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x6
	strh r0, [r5]
_0806B1EE:
	ldr r0, _0806B218 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806B204
	adds r0, r4, 0
	bl DestroyTask
	bl DoSoftReset
_0806B204:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B20C: .4byte gSystemText_SaveFailed
_0806B210: .4byte gMain
_0806B214: .4byte 0x0000ffff
_0806B218: .4byte gPaletteFade
	thumb_func_end Task_ResetRtcScreen

	.align 2, 0 @ Don't pad with nop.
