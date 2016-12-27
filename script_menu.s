	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80B5054
sub_80B5054: @ 80B51A4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _080B51E8
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B51F4
	ldr r1, _080B51EC
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B51F0
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80B5138
	movs r0, 0x1
	b _080B51F6
	.align 2, 0
_080B51E8: .4byte sub_80B52B4
_080B51EC: .4byte gScriptResult
_080B51F0: .4byte gMultichoiceLists
_080B51F4:
	movs r0, 0
_080B51F6:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B5054

	thumb_func_start sub_80B50B0
sub_80B50B0: @ 80B5200
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B5250
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B525C
	ldr r1, _080B5254
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B5258
	lsls r0, r5, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r0, r8
	adds r1, r7, 0
	bl sub_80B5138
	movs r0, 0x1
	b _080B525E
	.align 2, 0
_080B5250: .4byte sub_80B52B4
_080B5254: .4byte gScriptResult
_080B5258: .4byte gMultichoiceLists
_080B525C:
	movs r0, 0
_080B525E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B50B0

	thumb_func_start GetStringWidthInTilesForScriptMenu
GetStringWidthInTilesForScriptMenu: @ 80B526C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080B5284
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r0, r1, 3
	pop {r1}
	bx r1
	.align 2, 0
_080B5284: .4byte gWindowConfig_81E6CE4
	thumb_func_end GetStringWidthInTilesForScriptMenu

	thumb_func_start sub_80B5138
sub_80B5138: @ 80B5288
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r3
	ldr r3, [sp, 0x34]
	ldr r4, [sp, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x10]
	mov r1, r10
	ldr r0, [r1]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0x1
	cmp r4, r8
	bcs _080B52E8
_080B52CA:
	lsls r0, r4, 3
	add r0, r10
	ldr r0, [r0]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	bcs _080B52DE
	adds r5, r0, 0
_080B52DE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _080B52CA
_080B52E8:
	lsls r0, r5, 24
	lsrs r7, r0, 24
	mov r1, r9
	adds r0, r7, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1D
	bls _080B5308
	mov r0, r9
	adds r0, 0x1D
	subs r0, r7
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0x1D
_080B5308:
	mov r1, r8
	lsls r0, r1, 1
	adds r0, 0x1
	ldr r1, [sp, 0x8]
	lsls r4, r1, 24
	asrs r4, 24
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	adds r2, r7, 0
	adds r3, r4, 0
	bl MenuDrawTextWindow
	mov r6, r9
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	ldr r5, [sp, 0x8]
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r10
	bl PrintMenuItems
	ldr r0, [sp, 0x10]
	str r0, [sp]
	mov r1, r9
	subs r0, r7, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	adds r1, r6, 0
	adds r2, r5, 0
	mov r3, r8
	bl InitMenu
	ldr r0, [sp, 0xC]
	str r0, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	mov r0, r9
	ldr r1, [sp, 0x8]
	adds r2, r7, 0
	adds r3, r4, 0
	bl sub_80B5230
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5138

	thumb_func_start sub_80B5230
sub_80B5230: @ 80B5380
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x1C]
	mov r8, r0
	ldr r0, [sp, 0x20]
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080B53E8
	movs r1, 0x50
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B53EC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	ldr r3, [sp]
	strh r3, [r1, 0xE]
	mov r0, r8
	strh r0, [r1, 0x10]
	mov r0, r9
	cmp r0, 0x3
	bls _080B53F0
	movs r0, 0x1
	b _080B53F2
	.align 2, 0
_080B53E8: .4byte sub_80B52B4
_080B53EC: .4byte gTasks
_080B53F0:
	movs r0, 0
_080B53F2:
	strh r0, [r1, 0x12]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5230

	thumb_func_start sub_80B52B4
sub_80B52B4: @ 80B5404
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B5430
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B549E
	ldr r2, _080B5434
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r0, r2
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0
	bne _080B5438
	bl ProcessMenuInputNoWrap
	b _080B543C
	.align 2, 0
_080B5430: .4byte gPaletteFade
_080B5434: .4byte gTasks
_080B5438:
	bl ProcessMenuInput
_080B543C:
	lsls r0, 24
	lsrs r0, 24
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080B549E
	adds r0, 0x1
	cmp r1, r0
	bne _080B5478
	ldr r0, _080B5470
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B549E
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5474
	movs r0, 0x7F
	strh r0, [r1]
	b _080B547C
	.align 2, 0
_080B5470: .4byte gTasks
_080B5474: .4byte gScriptResult
_080B5478:
	ldr r0, _080B54A4
	strh r1, [r0]
_080B547C:
	bl sub_8072DEC
	ldr r0, _080B54A8
	adds r3, r5, r4
	lsls r3, 3
	adds r3, r0
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0xA]
	ldrb r2, [r3, 0xC]
	ldrb r3, [r3, 0xE]
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B549E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B54A4: .4byte gScriptResult
_080B54A8: .4byte gTasks
	thumb_func_end sub_80B52B4

	thumb_func_start Multichoice
Multichoice: @ 80B54AC
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _080B54EC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B54F8
	ldr r1, _080B54F0
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B54F4
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r5, [sp]
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80B53B4
	movs r0, 0x1
	b _080B54FA
	.align 2, 0
_080B54EC: .4byte sub_80B52B4
_080B54F0: .4byte gScriptResult
_080B54F4: .4byte gMultichoiceLists
_080B54F8:
	movs r0, 0
_080B54FA:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end Multichoice

	thumb_func_start sub_80B53B4
sub_80B53B4: @ 80B5504
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r3, 0
	ldr r3, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	ldr r0, [r7]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r4, r0, 16
	movs r5, 0x1
	cmp r5, r6
	bcs _080B5558
_080B553A:
	lsls r0, r5, 3
	adds r0, r7
	ldr r0, [r0]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bcs _080B554E
	adds r4, r0, 0
_080B554E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _080B553A
_080B5558:
	lsls r4, 24
	lsrs r4, 24
	add r4, r8
	adds r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r6, 1
	adds r0, 0x1
	mov r1, r9
	lsls r5, r1, 24
	asrs r5, 24
	adds r5, r0
	lsls r5, 24
	lsrs r5, 24
	mov r0, r8
	adds r2, r6, 0
	adds r3, r7, 0
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	mov r1, r8
	subs r0, r4, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r2, r9
	adds r3, r6, 0
	bl InitMenu
	mov r0, r10
	str r0, [sp]
	str r6, [sp, 0x4]
	mov r0, r8
	mov r1, r9
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_80B5230
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B53B4

	thumb_func_start yes_no_box
yes_no_box: @ 80B55BC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r6, _080B5604
	adds r0, r6, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B5610
	ldr r1, _080B5608
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl DisplayYesNoMenu
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B560C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r4, [r1, 0xA]
	movs r0, 0x1
	b _080B5612
	.align 2, 0
_080B5604: .4byte task_yes_no_maybe
_080B5608: .4byte gScriptResult
_080B560C: .4byte gTasks
_080B5610:
	movs r0, 0
_080B5612:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end yes_no_box

	thumb_func_start unref_sub_80B54C8
unref_sub_80B54C8: @ 80B5618
	push {lr}
	ldr r0, _080B5628
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _080B562C
	movs r0, 0x1
	b _080B562E
	.align 2, 0
_080B5628: .4byte gScriptResult
_080B562C:
	movs r0, 0
_080B562E:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80B54C8

	thumb_func_start task_yes_no_maybe
task_yes_no_maybe: @ 80B5634
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080B5654
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x4
	bgt _080B5658
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080B56BA
	.align 2, 0
_080B5654: .4byte gTasks
_080B5658:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080B567C
	cmp r1, r0
	bgt _080B5674
	subs r0, 0x1
	cmp r1, r0
	beq _080B56BA
	b _080B5692
_080B5674:
	cmp r1, 0
	beq _080B568C
	cmp r1, 0x1
	bne _080B5692
_080B567C:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5688
	movs r0, 0
	b _080B5690
	.align 2, 0
_080B5688: .4byte gScriptResult
_080B568C:
	ldr r1, _080B56C0
	movs r0, 0x1
_080B5690:
	strh r0, [r1]
_080B5692:
	ldr r0, _080B56C4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	ldrb r1, [r1, 0xA]
	adds r2, r0, 0x6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x5
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B56BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B56C0: .4byte gScriptResult
_080B56C4: .4byte gTasks
	thumb_func_end task_yes_no_maybe

	thumb_func_start sub_80B5578
sub_80B5578: @ 80B56C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 24
	lsrs r5, r4, 24
	movs r7, 0
	ldr r0, _080B5708
	mov r10, r0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B570C
	movs r0, 0
	b _080B57C0
	.align 2, 0
_080B5708: .4byte sub_80B5684
_080B570C:
	ldr r1, _080B5770
	movs r0, 0xFF
	strh r0, [r1]
	ldr r0, _080B5774
	lsls r4, r6, 3
	adds r0, r4, r0
	ldrb r6, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	movs r3, 0
	bl sub_807274C
	mov r0, r10
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, r6, 24
	lsrs r1, r0, 24
	lsrs r0, 25
	cmp r0, r5
	bcc _080B574E
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _080B5756
_080B574E:
	cmp r5, 0x1
	beq _080B5756
	cmp r1, r5
	bne _080B5778
_080B5756:
	ldr r0, _080B5774
	adds r0, r4, r0
	ldrb r0, [r0, 0x4]
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x1
	mov r2, r8
	lsls r1, r2, 24
	b _080B578A
	.align 2, 0
_080B5770: .4byte gScriptResult
_080B5774: .4byte gMultichoiceLists
_080B5778:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x3
	mov r3, r8
	lsls r1, r3, 24
_080B578A:
	asrs r1, 24
	adds r1, r0
	lsls r1, 24
	lsrs r7, r1, 24
	adds r0, r5, 0
	bl sub_807288C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B57D0
	mov r3, r10
	lsls r1, r3, 2
	add r1, r10
	lsls r1, 3
	adds r1, r2
	mov r2, r9
	strh r2, [r1, 0x8]
	mov r3, r8
	strh r3, [r1, 0xA]
	add r0, r9
	adds r0, 0x2
	strh r0, [r1, 0xC]
	strh r7, [r1, 0xE]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	strh r0, [r1, 0x10]
	movs r0, 0x1
_080B57C0:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B57D0: .4byte gTasks
	thumb_func_end sub_80B5578

	thumb_func_start sub_80B5684
sub_80B5684: @ 80B57D4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80727CC
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080B5844
	adds r0, 0x1
	cmp r1, r0
	bne _080B581C
	ldr r2, _080B5814
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0x10
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0
	bne _080B5844
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5818
	movs r0, 0x7F
	strh r0, [r1]
	b _080B5822
	.align 2, 0
_080B5814: .4byte gTasks
_080B5818: .4byte gScriptResult
_080B581C:
	ldr r0, _080B584C
	strh r1, [r0]
	lsls r4, r5, 2
_080B5822:
	bl sub_8072DEC
	ldr r0, _080B5850
	adds r3, r4, r5
	lsls r3, 3
	adds r3, r0
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0xA]
	ldrb r2, [r3, 0xC]
	ldrb r3, [r3, 0xE]
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B5844:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B584C: .4byte gScriptResult
_080B5850: .4byte gTasks
	thumb_func_end sub_80B5684

	thumb_func_start sp109_CreatePCMenu
sp109_CreatePCMenu: @ 80B5854
	push {lr}
	ldr r0, _080B5874
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B587C
	ldr r1, _080B5878
	movs r0, 0xFF
	strh r0, [r1]
	bl CreatePCMenu
	movs r0, 0x1
	b _080B587E
	.align 2, 0
_080B5874: .4byte sub_80B52B4
_080B5878: .4byte gScriptResult
_080B587C:
	movs r0, 0
_080B587E:
	pop {r1}
	bx r1
	thumb_func_end sp109_CreatePCMenu

	thumb_func_start CreatePCMenu
CreatePCMenu: @ 80B5884
	push {r4-r7,lr}
	sub sp, 0x18
	ldr r0, _080B5898
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B58A0
	ldr r0, _080B589C
	b _080B58A2
	.align 2, 0
_080B5898: .4byte 0x0000084b
_080B589C: .4byte gPCText_LanettesPC
_080B58A0:
	ldr r0, _080B5938
_080B58A2:
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r4, 0x1
	ldr r0, _080B593C
	bl GetStringWidthInTilesForScriptMenu
	lsls r1, r4, 2
	add r1, sp
	adds r1, 0x8
	lsls r0, 16
	lsrs r0, 16
	str r0, [r1]
	ldr r0, _080B5940
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	movs r4, 0x3
	ldr r0, _080B5944
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B58E8
	ldr r0, _080B5948
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
	movs r4, 0x4
_080B58E8:
	movs r5, 0
	cmp r5, r4
	bge _080B5904
	add r2, sp, 0x8
	adds r1, r4, 0
_080B58F2:
	ldr r0, [r2]
	cmp r5, r0
	bge _080B58FC
	lsls r0, 24
	lsrs r5, r0, 24
_080B58FC:
	adds r2, 0x4
	subs r1, 0x1
	cmp r1, 0
	bne _080B58F2
_080B5904:
	ldr r0, _080B5944
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B594C
	movs r7, 0x4
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r0, _080B5948
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _080B5940
	movs r1, 0x1
	movs r2, 0x7
	bl MenuPrint
	b _080B5968
	.align 2, 0
_080B5938: .4byte gPCText_SomeonesPC
_080B593C: .4byte gPCText_PlayersPC
_080B5940: .4byte gPCText_LogOff
_080B5944: .4byte 0x00000804
_080B5948: .4byte gPCText_HallOfFame
_080B594C:
	movs r7, 0x3
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _080B5984
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
_080B5968:
	adds r6, r4, 0
	ldr r0, _080B5988
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B5990
	ldr r0, _080B598C
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	b _080B599A
	.align 2, 0
_080B5984: .4byte gPCText_LogOff
_080B5988: .4byte 0x0000084b
_080B598C: .4byte gPCText_LanettesPC
_080B5990:
	ldr r0, _080B59D8
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
_080B599A:
	ldr r0, _080B59DC
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	movs r4, 0
	str r4, [sp]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	adds r3, r7, 0
	bl InitMenu
	lsls r2, r6, 24
	lsrs r2, 24
	lsls r3, r7, 1
	adds r3, 0x1
	str r4, [sp]
	str r7, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	bl sub_80B5230
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B59D8: .4byte gPCText_SomeonesPC
_080B59DC: .4byte gPCText_PlayersPC
	thumb_func_end CreatePCMenu

	thumb_func_start sub_80B5838
sub_80B5838: @ 80B59E0
	push {lr}
	bl MenuDisplayMessageBox
	ldr r0, _080B59F4
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_080B59F4: .4byte gUnknown_081A0A01
	thumb_func_end sub_80B5838

	thumb_func_start task_picbox
task_picbox: @ 80B59F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5A1C
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B5A66
	cmp r0, 0x1
	bgt _080B5A20
	cmp r0, 0
	beq _080B5A3C
	b _080B5A66
	.align 2, 0
_080B5A1C: .4byte gTasks
_080B5A20:
	cmp r0, 0x2
	beq _080B5A2A
	cmp r0, 0x3
	beq _080B5A48
	b _080B5A66
_080B5A2A:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B5A44
	adds r0, r1
	bl FreeResourcesAndDestroySprite
_080B5A3C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B5A66
	.align 2, 0
_080B5A44: .4byte gSprites
_080B5A48:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080B5A66:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_picbox

	thumb_func_start sub_80B58C4
sub_80B58C4: @ 80B5A6C
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _080B5B04
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080B5B14
	adds r2, r6, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B5B08
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r7, [r4, 0xA]
	lsls r1, r6, 19
	movs r0, 0xA0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r2, r5, 19
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateMonSprite_PicBox
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	strh r6, [r4, 0xE]
	strh r5, [r4, 0x10]
	ldr r3, _080B5B0C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080B5B10
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _080B5B16
	.align 2, 0
_080B5B04: .4byte task_picbox
_080B5B08: .4byte gTasks
_080B5B0C: .4byte gSprites
_080B5B10: .4byte SpriteCallbackDummy
_080B5B14:
	movs r0, 0
_080B5B16:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B58C4

	thumb_func_start picbox_close
picbox_close: @ 80B5B1C
	push {lr}
	ldr r0, _080B5B40
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080B5B4C
	ldr r0, _080B5B44
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _080B5B48
	b _080B5B4E
	.align 2, 0
_080B5B40: .4byte task_picbox
_080B5B44: .4byte gTasks
_080B5B48: .4byte sub_80B59AC
_080B5B4C:
	movs r0, 0
_080B5B4E:
	pop {r1}
	bx r1
	thumb_func_end picbox_close

	thumb_func_start sub_80B59AC
sub_80B59AC: @ 80B5B54
	push {lr}
	ldr r0, _080B5B68
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B5B6C
	movs r0, 0
	b _080B5B6E
	.align 2, 0
_080B5B68: .4byte task_picbox
_080B5B6C:
	movs r0, 0x1
_080B5B6E:
	pop {r1}
	bx r1
	thumb_func_end sub_80B59AC

	.align 2, 0 @ Don't pad with nop.
