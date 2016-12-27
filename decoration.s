	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FE1DC
sub_80FE1DC: @ 80FE58C
	push {lr}
	sub sp, 0x8
	bl sub_80FE2B4
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _080FE5C8
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	ldr r0, _080FE5CC
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080FE5C8: .4byte gUnknown_083EC604
_080FE5CC: .4byte gUnknown_020388D4
	thumb_func_end sub_80FE1DC

	thumb_func_start sub_80FE220
sub_80FE220: @ 80FE5D0
	push {lr}
	ldr r1, _080FE5E8
	movs r0, 0
	strb r0, [r1]
	bl ScriptContext2_Enable
	bl sub_80FE1DC
	bl sub_80FE394
	pop {r0}
	bx r0
	.align 2, 0
_080FE5E8: .4byte gUnknown_020388D4
	thumb_func_end sub_80FE220

	thumb_func_start DecorationPC
DecorationPC: @ 80FE5EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80FE220
	ldr r1, _080FE60C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FE610
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE60C: .4byte gTasks
_080FE610: .4byte Task_DecorationPCProcessMenuInput
	thumb_func_end DecorationPC

	thumb_func_start Task_SecretBasePC_Decoration
Task_SecretBasePC_Decoration: @ 80FE614
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DecorationPC
	ldr r1, _080FE634
	ldr r0, _080FE638
	str r0, [r1]
	adds r0, 0x10
	str r0, [r1, 0x4]
	movs r2, 0
	movs r0, 0x10
	strb r0, [r1, 0x8]
	strb r2, [r1, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_080FE634: .4byte 0x0201f000
_080FE638: .4byte 0x0202714e
	thumb_func_end Task_SecretBasePC_Decoration

	thumb_func_start DoPlayerPCDecoration
DoPlayerPCDecoration: @ 80FE63C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DecorationPC
	ldr r1, _080FE65C
	ldr r0, _080FE660
	str r0, [r1]
	adds r0, 0xC
	str r0, [r1, 0x4]
	movs r0, 0xC
	strb r0, [r1, 0x8]
	movs r0, 0x1
	strb r0, [r1, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_080FE65C: .4byte 0x0201f000
_080FE660: .4byte 0x02027dbc
	thumb_func_end DoPlayerPCDecoration

	thumb_func_start sub_80FE2B4
sub_80FE2B4: @ 80FE664
	push {lr}
	sub sp, 0x8
	ldr r1, _080FE698
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r0, sp, 0x4
	movs r1, 0xDF
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080FE698: .4byte gUnknown_083EC654
	thumb_func_end sub_80FE2B4

	thumb_func_start Task_DecorationPCProcessMenuInput
Task_DecorationPCProcessMenuInput: @ 80FE69C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, r6, 0
	ldr r0, _080FE718
	ldrb r1, [r0, 0x7]
	movs r5, 0x80
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _080FE73C
	ldr r4, _080FE71C
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FE6D4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r1, _080FE720
	strb r0, [r1]
	bl sub_80FE394
_080FE6D4:
	ldrh r1, [r4, 0x2E]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE6F2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _080FE720
	strb r0, [r1]
	bl sub_80FE394
_080FE6F2:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FE728
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080FE724
	ldr r0, _080FE720
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl _call_via_r1
	b _080FE73C
	.align 2, 0
_080FE718: .4byte gPaletteFade
_080FE71C: .4byte gMain
_080FE720: .4byte gUnknown_020388D4
_080FE724: .4byte gUnknown_083EC604
_080FE728:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080FE73C
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl gpu_pal_decompress_alloc_tag_and_upload
_080FE73C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_DecorationPCProcessMenuInput

	thumb_func_start sub_80FE394
sub_80FE394: @ 80FE744
	push {lr}
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	ldr r1, _080FE76C
	ldr r0, _080FE770
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_080FE76C: .4byte gUnknown_083EC624
_080FE770: .4byte gUnknown_020388D4
	thumb_func_end sub_80FE394

	thumb_func_start gpu_pal_decompress_alloc_tag_and_upload
gpu_pal_decompress_alloc_tag_and_upload: @ 80FE774
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	ldr r0, _080FE7B4
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	bne _080FE7BC
	ldr r0, _080FE7B8
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	b _080FE7C2
	.align 2, 0
_080FE7B4: .4byte 0x0201f000
_080FE7B8: .4byte gUnknown_0815F399
_080FE7BC:
	adds r0, r4, 0
	bl ReshowPlayerPC
_080FE7C2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end gpu_pal_decompress_alloc_tag_and_upload

	thumb_func_start sub_80FE418
sub_80FE418: @ 80FE7C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FE5AC
	pop {r0}
	bx r0
	thumb_func_end sub_80FE418

	thumb_func_start sub_80FE428
sub_80FE428: @ 80FE7D8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080FE814
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	bl sub_80FE394
	ldr r1, _080FE818
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FE81C
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE814: .4byte gUnknown_020388D4
_080FE818: .4byte gTasks
_080FE81C: .4byte Task_DecorationPCProcessMenuInput
	thumb_func_end sub_80FE428

	thumb_func_start sub_80FE470
sub_80FE470: @ 80FE820
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	mov r8, r1
	mov r9, r2
	adds r5, r3, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r5, 24
	lsrs r5, 24
	bl sub_8072CBC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r7, _080FE8CC
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x5
	mov r10, r0
	strb r0, [r7, 0x1]
	strb r5, [r7, 0x2]
	adds r7, 0x3
	ldr r1, _080FE8D0
	lsls r0, r4, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	adds r0, r4, 0
	bl sub_8134194
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	movs r2, 0x56
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	movs r0, 0xBA
	strb r0, [r7]
	adds r7, 0x1
	ldr r0, _080FE8D4
	lsls r4, 3
	adds r4, r0
	ldrb r1, [r4, 0x4]
	adds r0, r7, 0
	movs r2, 0x68
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	movs r0, 0xFC
	strb r0, [r7]
	mov r0, r10
	strb r0, [r7, 0x1]
	strb r6, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	ldr r0, _080FE8CC
	mov r1, r8
	mov r2, r9
	bl MenuPrint
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE8CC: .4byte gStringVar4
_080FE8D0: .4byte gUnknown_083EC5E4
_080FE8D4: .4byte gDecorationInventories
	thumb_func_end sub_80FE470

	thumb_func_start sub_80FE528
sub_80FE528: @ 80FE8D8
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r5, 0
	ldr r1, _080FE924
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
_080FE8F8:
	ldr r0, _080FE928
	ldrb r0, [r0, 0x9]
	cmp r0, 0x1
	bne _080FE92C
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080FE92C
	cmp r5, 0x6
	beq _080FE92C
	cmp r5, 0x7
	beq _080FE92C
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r3, 0xD
	bl sub_80FE470
	b _080FE93E
	.align 2, 0
_080FE924: .4byte gTasks
_080FE928: .4byte 0x0201f000
_080FE92C:
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	movs r1, 0x1
	movs r3, 0xFF
	bl sub_80FE470
_080FE93E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080FE8F8
	ldr r0, _080FE958
	movs r1, 0x1
	movs r2, 0x11
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FE958: .4byte gUnknownText_Exit
	thumb_func_end sub_80FE528

	thumb_func_start sub_80FE5AC
sub_80FE5AC: @ 80FE95C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_80FE528
	ldr r0, _080FE9A8
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x9
	bl InitMenu
	ldr r1, _080FE9AC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FE9B0
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FE9A8: .4byte gUnknown_020388F6
_080FE9AC: .4byte gTasks
_080FE9B0: .4byte sub_80FE604
	thumb_func_end sub_80FE5AC

	thumb_func_start sub_80FE604
sub_80FE604: @ 80FE9B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _080FE9E8
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE9CC
	b _080FEAD0
_080FE9CC:
	ldr r2, _080FE9EC
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080FE9F0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _080FEAD0
	.align 2, 0
_080FE9E8: .4byte gPaletteFade
_080FE9EC: .4byte gMain
_080FE9F0:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FEA06
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _080FEAD0
_080FEA06:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FEABC
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	ldr r4, _080FEA70
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	beq _080FEAB4
	ldrb r0, [r4]
	bl sub_8134194
	ldr r1, _080FEA74
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _080FEA8C
	ldrb r0, [r4]
	bl sub_8134104
	ldr r2, _080FEA78
	ldr r1, _080FEA7C
	ldrb r0, [r4]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r5, 0
	bl sub_80FEF50
	bl sub_80F944C
	ldr r0, _080FEA80
	movs r1, 0x8
	bl sub_80F9480
	bl LoadScrollIndicatorPalette
	ldr r1, _080FEA84
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FEA88
	str r1, [r0]
	b _080FEAD0
	.align 2, 0
_080FEA70: .4byte gUnknown_020388F6
_080FEA74: .4byte gUnknown_020388D5
_080FEA78: .4byte gUnknown_020388D0
_080FEA7C: .4byte gDecorationInventories
_080FEA80: .4byte gUnknown_020388F7
_080FEA84: .4byte gTasks
_080FEA88: .4byte sub_80FE868
_080FEA8C:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080FEAAC
	ldr r2, _080FEAB0
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _080FEAD0
	.align 2, 0
_080FEAAC: .4byte gSecretBaseText_NoDecors
_080FEAB0: .4byte sub_80FE418
_080FEAB4:
	adds r0, r5, 0
	bl sub_80FE728
	b _080FEAD0
_080FEABC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080FEAD0
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80FE728
_080FEAD0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80FE604

	thumb_func_start sub_80FE728
sub_80FE728: @ 80FEAD8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080FEAF8
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1E
	ldrsh r0, [r0, r1]
	cmp r0, 0x3
	beq _080FEAFC
	adds r0, r2, 0
	bl sub_80FE758
	b _080FEB02
	.align 2, 0
_080FEAF8: .4byte gTasks
_080FEAFC:
	adds r0, r2, 0
	bl sub_8109DAC
_080FEB02:
	pop {r0}
	bx r0
	thumb_func_end sub_80FE728

	thumb_func_start sub_80FE758
sub_80FE758: @ 80FEB08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080FEB44
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	beq _080FEB4C
	bl sub_80FE1DC
	bl MenuDisplayMessageBox
	bl sub_80FE394
	ldr r0, _080FEB48
	str r0, [r5]
	b _080FEB52
	.align 2, 0
_080FEB44: .4byte gTasks
_080FEB48: .4byte Task_DecorationPCProcessMenuInput
_080FEB4C:
	adds r0, r4, 0
	bl sub_80B3068
_080FEB52:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80FE758

	thumb_func_start sub_80FE7A8
sub_80FE7A8: @ 80FEB58
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080FEB7C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r3, 0
	movs r2, 0x3
	strh r2, [r1, 0x1E]
	ldr r1, _080FEB80
	strb r3, [r1]
	bl sub_80FE5AC
	pop {r0}
	bx r0
	.align 2, 0
_080FEB7C: .4byte gTasks
_080FEB80: .4byte gUnknown_020388F6
	thumb_func_end sub_80FE7A8

	thumb_func_start sub_80FE7D4
sub_80FE7D4: @ 80FEB84
	push {lr}
	lsls r1, 24
	ldr r2, _080FEB98
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080FEB98: .4byte gUnknown_083EC5E4
	thumb_func_end sub_80FE7D4

	thumb_func_start sub_80FE7EC
sub_80FE7EC: @ 80FEB9C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_80FEC94
	ldr r0, _080FEC14
	ldrb r0, [r0]
	bl sub_80FECB8
	ldr r4, _080FEC18
	ldrb r1, [r4]
	ldr r5, _080FEC1C
	ldrb r0, [r5]
	adds r1, r0
	ldr r0, _080FEC20
	ldrb r0, [r0]
	cmp r1, r0
	beq _080FEBE2
	movs r0, 0xF
	movs r1, 0xC
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
_080FEBE2:
	ldrb r0, [r5]
	ldrb r1, [r4]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FECE0
	ldr r0, _080FEC24
	ldrb r3, [r0]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FEC14: .4byte gUnknown_020388F6
_080FEC18: .4byte gUnknown_020388F2
_080FEC1C: .4byte gUnknown_020388F4
_080FEC20: .4byte gUnknown_020388D5
_080FEC24: .4byte gUnknown_020388F3
	thumb_func_end sub_80FE7EC

	thumb_func_start sub_80FE868
sub_80FE868: @ 80FEC28
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80FE7EC
	ldr r1, _080FEC4C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FEC50
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEC4C: .4byte gTasks
_080FEC50: .4byte sub_80FE948
	thumb_func_end sub_80FE868

	thumb_func_start sub_80FE894
sub_80FE894: @ 80FEC54
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0
	mov r10, r0
	ldr r6, _080FECE0
	ldrb r1, [r6]
	ldr r4, _080FECE4
	ldrb r0, [r4]
	adds r1, r0
	ldr r2, _080FECE8
	mov r9, r2
	ldrb r0, [r2]
	cmp r1, r0
	bne _080FEC88
	movs r1, 0x1
	mov r10, r1
_080FEC88:
	movs r0, 0x5
	bl PlaySE
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0
	beq _080FEC9C
	bl MoveMenuCursor
	strb r0, [r6]
_080FEC9C:
	cmp r7, 0
	beq _080FECAE
	ldrb r0, [r4]
	adds r0, r7
	strb r0, [r4]
	mov r0, r8
	movs r1, 0x1
	bl sub_80FEABC
_080FECAE:
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r0, r1
	mov r2, r9
	ldrb r2, [r2]
	cmp r0, r2
	beq _080FECEC
	mov r0, r10
	cmp r0, 0
	beq _080FECCE
	movs r0, 0xF
	movs r1, 0xC
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
_080FECCE:
	ldrb r0, [r4]
	ldrb r6, [r6]
	adds r0, r6
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FECE0
	b _080FECF8
	.align 2, 0
_080FECE0: .4byte gUnknown_020388F2
_080FECE4: .4byte gUnknown_020388F4
_080FECE8: .4byte gUnknown_020388D5
_080FECEC:
	movs r0, 0xF
	movs r1, 0xC
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080FECF8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FE894

	thumb_func_start sub_80FE948
sub_80FE948: @ 80FED08
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080FED40
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080FED1C
	b _080FEE6C
_080FED1C:
	ldr r0, _080FED44
	ldrh r1, [r0, 0x30]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0x40
	bne _080FED60
	ldr r0, _080FED48
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FED4C
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	movs r2, 0
	bl sub_80FE894
	b _080FED60
	.align 2, 0
_080FED40: .4byte gPaletteFade
_080FED44: .4byte gMain
_080FED48: .4byte gUnknown_020388F2
_080FED4C:
	ldr r0, _080FED84
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FED60
	movs r2, 0x1
	negs r2, r2
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FE894
_080FED60:
	ldr r0, _080FED88
	ldrh r1, [r0, 0x30]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0x80
	bne _080FEDAE
	ldr r2, _080FED8C
	ldr r1, _080FED90
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080FED94
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_80FE894
	b _080FEDAE
	.align 2, 0
_080FED84: .4byte gUnknown_020388F4
_080FED88: .4byte gMain
_080FED8C: .4byte gUnknown_020388F2
_080FED90: .4byte gUnknown_020388F3
_080FED94:
	ldr r0, _080FEDF8
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	ldr r1, _080FEDFC
	ldrb r1, [r1]
	cmp r0, r1
	beq _080FEDAE
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_80FE894
_080FEDAE:
	ldr r0, _080FEE00
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080FEE3C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080FEE04
	ldr r1, _080FEE08
	ldr r0, _080FEDF8
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r0, r1
	strb r0, [r2]
	ldr r1, _080FEDFC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _080FEE14
	ldr r1, _080FEE0C
	ldr r2, _080FEE10
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r2, 0x1E
	ldrsh r0, [r0, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	b _080FEE28
	.align 2, 0
_080FEDF8: .4byte gUnknown_020388F4
_080FEDFC: .4byte gUnknown_020388D5
_080FEE00: .4byte gMain
_080FEE04: .4byte gUnknown_020388F5
_080FEE08: .4byte gUnknown_020388F2
_080FEE0C: .4byte gUnknown_083EC634
_080FEE10: .4byte gTasks
_080FEE14:
	ldr r2, _080FEE34
	ldr r1, _080FEE38
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1E
	ldrsh r0, [r0, r1]
	lsls r0, 3
	adds r0, r2
_080FEE28:
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080FEE6C
	.align 2, 0
_080FEE34: .4byte gUnknown_083EC634
_080FEE38: .4byte gTasks
_080FEE3C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080FEE6C
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080FEE74
	ldr r2, _080FEE78
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	movs r2, 0x1E
	ldrsh r0, [r0, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_080FEE6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FEE74: .4byte gUnknown_083EC634
_080FEE78: .4byte gTasks
	thumb_func_end sub_80FE948

	thumb_func_start sub_80FEABC
sub_80FEABC: @ 80FEE7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080FEF18
	ldrb r0, [r4]
	cmp r0, 0
	bne _080FEE9E
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	ldrb r0, [r4]
	cmp r0, 0
	beq _080FEEA8
_080FEE9E:
	movs r0, 0
	movs r1, 0x3C
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_080FEEA8:
	ldr r5, _080FEF18
	ldrb r0, [r5]
	adds r0, 0x7
	ldr r4, _080FEF1C
	ldrb r1, [r4]
	cmp r0, r1
	bne _080FEEBC
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_080FEEBC:
	ldrb r0, [r5]
	adds r0, 0x7
	ldrb r4, [r4]
	cmp r0, r4
	bge _080FEED0
	movs r0, 0x1
	movs r1, 0x3C
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
_080FEED0:
	ldrb r4, [r5]
	adds r0, r4, 0
	adds r0, 0x8
	cmp r4, r0
	blt _080FEEDC
	b _080FF03E
_080FEEDC:
	adds r7, r5, 0
_080FEEDE:
	ldrb r1, [r7]
	subs r1, r4, r1
	lsls r0, r1, 25
	movs r2, 0x80
	lsls r2, 18
	adds r0, r2
	lsrs r6, r0, 24
	ldr r0, _080FEF20
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FEEFC
	adds r0, r1, 0
	bl sub_80F94F8
_080FEEFC:
	ldr r0, _080FEF1C
	ldrb r0, [r0]
	cmp r4, r0
	bne _080FEF28
	lsls r2, r6, 3
	movs r0, 0x1
	str r0, [sp]
	ldr r0, _080FEF24
	movs r1, 0x8
	movs r3, 0x68
	bl sub_8072A18
	b _080FF03E
	.align 2, 0
_080FEF18: .4byte gUnknown_020388F4
_080FEF1C: .4byte gUnknown_020388D5
_080FEF20: .4byte gUnknown_020388F7
_080FEF24: .4byte gUnknownText_Exit
_080FEF28:
	ldr r0, _080FEF80
	ldr r1, [r0]
	adds r2, r1, r4
	ldrb r1, [r2]
	mov r12, r0
	adds r5, r4, 0x1
	cmp r1, 0
	bne _080FEF3A
	b _080FF030
_080FEF3A:
	ldr r0, _080FEF84
	ldrb r5, [r0, 0x9]
	cmp r5, 0x1
	bne _080FEF9C
	ldr r0, _080FEF88
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080FEF9C
	cmp r0, 0x7
	beq _080FEF9C
	ldr r0, _080FEF8C
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r3, 0x1E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080FEF9C
	ldrb r1, [r2]
	lsls r1, 5
	ldr r0, _080FEF90
	adds r1, r0
	ldr r0, _080FEF94
	bl StringCopy
	lsls r2, r6, 3
	str r5, [sp]
	ldr r0, _080FEF98
	movs r1, 0x8
	movs r3, 0x68
	bl sub_8072A18
	b _080FEFB8
	.align 2, 0
_080FEF80: .4byte gUnknown_020388D0
_080FEF84: .4byte 0x0201f000
_080FEF88: .4byte gUnknown_020388F6
_080FEF8C: .4byte gTasks
_080FEF90: .4byte 0x083f7bf1
_080FEF94: .4byte gStringVar1
_080FEF98: .4byte gUnknown_083EC65A
_080FEF9C:
	mov r1, r12
	ldr r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 5
	ldr r1, _080FEFC0
	adds r0, r1
	lsls r2, r6, 3
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x8
	movs r3, 0x68
	bl sub_8072A18
_080FEFB8:
	movs r1, 0
	adds r5, r4, 0x1
	b _080FEFCA
	.align 2, 0
_080FEFC0: .4byte 0x083f7bf1
_080FEFC4:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
_080FEFCA:
	cmp r1, 0xF
	bhi _080FEFF4
	ldr r0, _080FEFF8
	adds r0, r1, r0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, r4
	bne _080FEFC4
	ldrb r3, [r7]
	subs r3, r4, r3
	ldr r1, _080FEFFC
	adds r1, r3, r1
	lsls r3, 20
	movs r2, 0xC0
	lsls r2, 13
	adds r3, r2
	asrs r3, 16
	movs r0, 0x4
	movs r2, 0x6C
	bl sub_80F94A4
_080FEFF4:
	movs r1, 0
	b _080FF006
	.align 2, 0
_080FEFF8: .4byte gUnknown_020388D6
_080FEFFC: .4byte gUnknown_020388F7
_080FF000:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
_080FF006:
	cmp r1, 0xB
	bhi _080FF030
	ldr r0, _080FF04C
	adds r0, r1, r0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, r4
	bne _080FF000
	ldrb r3, [r7]
	subs r3, r4, r3
	ldr r1, _080FF050
	adds r1, r3, r1
	lsls r3, 20
	movs r0, 0xC0
	lsls r0, 13
	adds r3, r0
	asrs r3, 16
	movs r0, 0x5
	movs r2, 0x6C
	bl sub_80F94A4
_080FF030:
	lsls r0, r5, 16
	lsrs r4, r0, 16
	ldrb r0, [r7]
	adds r0, 0x8
	cmp r4, r0
	bge _080FF03E
	b _080FEEDE
_080FF03E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FF04C: .4byte gUnknown_020388E6
_080FF050: .4byte gUnknown_020388F7
	thumb_func_end sub_80FEABC

	thumb_func_start sub_80FEC94
sub_80FEC94: @ 80FF054
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FEABC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FEC94

	thumb_func_start sub_80FECB8
sub_80FECB8: @ 80FF078
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xF
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x3
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x1
	movs r3, 0xFF
	bl sub_80FE470
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FECB8

	thumb_func_start sub_80FECE0
sub_80FECE0: @ 80FF0A0
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080FF0D8
	ldrb r0, [r0]
	cmp r2, r0
	beq _080FF0E4
	ldr r1, _080FF0DC
	ldr r0, _080FF0E0
	ldr r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 5
	adds r1, 0x18
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x30
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x80
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
	movs r0, 0x1
	b _080FF0E6
	.align 2, 0
_080FF0D8: .4byte gUnknown_020388D5
_080FF0DC: .4byte gDecorations
_080FF0E0: .4byte gUnknown_020388D0
_080FF0E4:
	movs r0, 0
_080FF0E6:
	add sp, 0x8
	pop {r1}
	bx r1
	thumb_func_end sub_80FECE0

	thumb_func_start sub_80FED1C
sub_80FED1C: @ 80FF0EC
	push {lr}
	movs r0, 0xF
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x3
	bl MenuZeroFillWindowRect
	movs r0, 0xF
	movs r1, 0xC
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80FED1C

	thumb_func_start sub_80FED3C
sub_80FED3C: @ 80FF10C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl LoadScrollIndicatorPalette
	ldr r1, _080FF12C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FF130
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF12C: .4byte gTasks
_080FF130: .4byte sub_80FE868
	thumb_func_end sub_80FED3C

	thumb_func_start sub_80FED64
sub_80FED64: @ 80FF134
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _080FF14C
_080FF13E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080FF150
	movs r0, 0x1
	b _080FF15C
	.align 2, 0
_080FF14C: .4byte gUnknown_020388D6
_080FF150:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080FF13E
	movs r0, 0
_080FF15C:
	pop {r1}
	bx r1
	thumb_func_end sub_80FED64

	thumb_func_start sub_80FED90
sub_80FED90: @ 80FF160
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r3, 0
	ldr r4, _080FF200
	movs r1, 0
	ldr r2, _080FF204
_080FF174:
	adds r0, r3, r4
	strb r1, [r0]
	cmp r3, 0xB
	bhi _080FF180
	adds r0, r3, r2
	strb r1, [r0]
_080FF180:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bls _080FF174
	movs r3, 0
	ldr r0, _080FF208
	mov r10, r0
	ldr r1, _080FF20C
	mov r9, r1
	ldr r2, _080FF210
	mov r8, r2
_080FF198:
	mov r1, r10
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FF22A
	movs r1, 0
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 3
	add r0, r9
	ldrb r0, [r0, 0x4]
	cmp r1, r0
	bcs _080FF22A
	ldr r0, _080FF208
	adds r0, r3
	mov r12, r0
	ldr r7, _080FF200
_080FF1BA:
	ldr r0, _080FF214
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	adds r4, r1, 0x1
	mov r1, r12
	ldrb r1, [r1]
	cmp r0, r1
	bne _080FF218
	movs r1, 0
	cmp r1, r6
	bcs _080FF1EE
	ldrb r0, [r7]
	cmp r0, r4
	beq _080FF1EE
	ldr r5, _080FF200
	adds r2, r4, 0
_080FF1DC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r6
	bcs _080FF1EE
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r2
	bne _080FF1DC
_080FF1EE:
	cmp r1, r6
	bne _080FF218
	adds r0, r6, r7
	strb r4, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	b _080FF22A
	.align 2, 0
_080FF200: .4byte gUnknown_020388D6
_080FF204: .4byte gUnknown_020388E6
_080FF208: .4byte 0x0202714e
_080FF20C: .4byte gDecorationInventories
_080FF210: .4byte gUnknown_020388F6
_080FF214: .4byte gUnknown_020388D0
_080FF218:
	lsls r0, r4, 16
	lsrs r1, r0, 16
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 3
	add r0, r9
	ldrb r0, [r0, 0x4]
	cmp r1, r0
	bcc _080FF1BA
_080FF22A:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bls _080FF198
	movs r6, 0
	movs r3, 0
	ldr r0, _080FF2B4
	mov r8, r0
_080FF23C:
	ldr r0, _080FF2B8
	ldr r1, _080FF2BC
	adds r0, r1
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r7, r3, 0x1
	cmp r0, 0
	beq _080FF2DE
	movs r1, 0
	ldr r0, _080FF2C0
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r8
	ldrb r0, [r0, 0x4]
	cmp r1, r0
	bcs _080FF2DE
	adds r5, r2, 0
_080FF25E:
	ldr r0, _080FF2C4
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	adds r4, r1, 0x1
	ldrb r2, [r5]
	cmp r0, r2
	bne _080FF2CC
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80FED64
	lsls r0, 24
	cmp r0, 0
	bne _080FF2CC
	movs r1, 0
	cmp r1, r6
	bcs _080FF2A0
	ldr r2, _080FF2C8
	ldrb r0, [r2]
	cmp r0, r4
	beq _080FF2A0
	adds r3, r2, 0
	adds r2, r4, 0
_080FF28E:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r6
	bcs _080FF2A0
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080FF28E
_080FF2A0:
	cmp r1, r6
	bne _080FF2CC
	ldr r0, _080FF2C8
	adds r0, r6, r0
	strb r4, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	b _080FF2DE
	.align 2, 0
_080FF2B4: .4byte gDecorationInventories
_080FF2B8: .4byte gSaveBlock1
_080FF2BC: .4byte 0x00002688
_080FF2C0: .4byte gUnknown_020388F6
_080FF2C4: .4byte gUnknown_020388D0
_080FF2C8: .4byte gUnknown_020388E6
_080FF2CC:
	lsls r0, r4, 16
	lsrs r1, r0, 16
	ldr r0, _080FF2F4
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r8
	ldrb r0, [r0, 0x4]
	cmp r1, r0
	bcc _080FF25E
_080FF2DE:
	lsls r0, r7, 16
	lsrs r3, r0, 16
	cmp r3, 0xB
	bls _080FF23C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FF2F4: .4byte gUnknown_020388F6
	thumb_func_end sub_80FED90

	thumb_func_start sub_80FEF28
sub_80FEF28: @ 80FF2F8
	push {lr}
	ldr r0, _080FF308
	ldrb r1, [r0]
	cmp r1, 0x7
	bhi _080FF310
	ldr r0, _080FF30C
	strb r1, [r0]
	b _080FF316
	.align 2, 0
_080FF308: .4byte gUnknown_020388D5
_080FF30C: .4byte gUnknown_020388F3
_080FF310:
	ldr r1, _080FF31C
	movs r0, 0x7
	strb r0, [r1]
_080FF316:
	pop {r0}
	bx r0
	.align 2, 0
_080FF31C: .4byte gUnknown_020388F3
	thumb_func_end sub_80FEF28

	thumb_func_start sub_80FEF50
sub_80FEF50: @ 80FF320
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FED90
	bl sub_80FEF28
	ldr r0, _080FF33C
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FF340
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080FF33C: .4byte gUnknown_020388F2
_080FF340: .4byte gUnknown_020388F4
	thumb_func_end sub_80FEF50

	thumb_func_start sub_80FEF74
sub_80FEF74: @ 80FF344
	push {lr}
	ldr r0, _080FF370
	movs r1, 0x8
	bl sub_80F9520
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	.align 2, 0
_080FF370: .4byte gUnknown_020388F7
	thumb_func_end sub_80FEF74

	thumb_func_start sub_80FEFA4
sub_80FEFA4: @ 80FF374
	push {r4,lr}
	movs r2, 0
	ldr r0, _080FF3A0
	ldrb r0, [r0]
	ldr r1, _080FF3A4
	ldrb r1, [r1]
	adds r0, r1
	adds r1, r0, 0x1
	ldr r4, _080FF3A8
	ldr r3, _080FF3AC
_080FF388:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r1
	beq _080FF39C
	cmp r2, 0xB
	bhi _080FF3B0
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080FF3B0
_080FF39C:
	movs r0, 0
	b _080FF3BC
	.align 2, 0
_080FF3A0: .4byte gUnknown_020388F4
_080FF3A4: .4byte gUnknown_020388F2
_080FF3A8: .4byte gUnknown_020388D6
_080FF3AC: .4byte gUnknown_020388E6
_080FF3B0:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _080FF388
	movs r0, 0x1
_080FF3BC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FEFA4

	thumb_func_start sub_80FEFF4
sub_80FEFF4: @ 80FF3C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080FF3F8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080FF3DE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080FF3F0
_080FF3DE:
	bl LoadScrollIndicatorPalette
	ldr r0, _080FF3FC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080FF400
	str r0, [r1]
_080FF3F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF3F8: .4byte gMain
_080FF3FC: .4byte gTasks
_080FF400: .4byte sub_80FE868
	thumb_func_end sub_80FEFF4

	thumb_func_start sub_80FF034
sub_80FF034: @ 80FF404
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_80FE5AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FF034

	thumb_func_start sub_80FF058
sub_80FF058: @ 80FF428
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080FF45C
	movs r1, 0x8
	bl sub_80F9520
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	bl BuyMenuFreeMemory
	ldr r1, _080FF460
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080FF464
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF45C: .4byte gUnknown_020388F7
_080FF460: .4byte gTasks
_080FF464: .4byte sub_80FF034
	thumb_func_end sub_80FF058

	thumb_func_start sub_80FF098
sub_80FF098: @ 80FF468
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080FF4A4
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r3, _080FF4A8
	ldrb r2, [r3]
	adds r0, r2, 0x7
	ldrb r1, [r1]
	cmp r0, r1
	ble _080FF48A
	cmp r2, 0
	beq _080FF48A
	subs r0, r2, 0x1
	strb r0, [r3]
_080FF48A:
	ldr r0, _080FF4AC
	ldrb r0, [r0]
	bl sub_8134104
	adds r0, r4, 0
	bl sub_80FED90
	bl sub_80FEF28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF4A4: .4byte gUnknown_020388D5
_080FF4A8: .4byte gUnknown_020388F4
_080FF4AC: .4byte gUnknown_020388F6
	thumb_func_end sub_80FF098

	thumb_func_start sub_80FF0E0
sub_80FF0E0: @ 80FF4B0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080FF4DC
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r4, r2, r3
	ldr r1, _080FF4E0
	ldrh r0, [r1]
	strh r0, [r4, 0xE]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x10]
	adds r3, 0x8
	adds r2, r3
	adds r1, r2, 0x2
	adds r0, r2, 0
	bl PlayerGetDestCoords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF4DC: .4byte gTasks
_080FF4E0: .4byte gSaveBlock1
	thumb_func_end sub_80FF0E0

	thumb_func_start sub_80FF114
sub_80FF114: @ 80FF4E4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl DrawWholeMapView
	ldr r1, _080FF528
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	ldr r3, _080FF52C
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r3
	movs r3, 0xE
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, 0x10]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
	bl warp_in
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FF528: .4byte gSaveBlock1
_080FF52C: .4byte gTasks
	thumb_func_end sub_80FF114

	thumb_func_start sub_80FF160
sub_80FF160: @ 80FF530
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _080FF558
	ldr r1, _080FF550
	ldr r2, _080FF554
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _080FF572
	.align 2, 0
_080FF550: .4byte gSecretBaseText_NoDecors
_080FF554: .4byte sub_80FE428
_080FF558:
	ldr r1, _080FF578
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0
	strh r1, [r0, 0x1E]
	ldr r0, _080FF57C
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_080FF572:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FF578: .4byte gTasks
_080FF57C: .4byte gUnknown_020388F6
	thumb_func_end sub_80FF160

	thumb_func_start sub_80FF1B0
sub_80FF1B0: @ 80FF580
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080FF5A0
	cmp r2, 0x22
	beq _080FF5A8
	cmp r2, 0x26
	bne _080FF5B2
	ldr r0, _080FF5A4
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 16
	b _080FF5B2
	.align 2, 0
_080FF5A0: .4byte 0x0000ffff
_080FF5A4: .4byte gUnknown_083EC97C
_080FF5A8:
	ldr r0, _080FF5B8
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, 28
	lsrs r0, 16
_080FF5B2:
	pop {r1}
	bx r1
	.align 2, 0
_080FF5B8: .4byte gUnknown_083EC984
	thumb_func_end sub_80FF1B0

	thumb_func_start sub_80FF1EC
sub_80FF1EC: @ 80FF5BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	ldr r4, [sp, 0x54]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x8]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp, 0x10]
	movs r2, 0
	lsls r0, r3, 16
	cmp r2, r3
	bcc _080FF5F2
	b _080FF754
_080FF5F2:
	ldr r1, [sp, 0x8]
	str r1, [sp, 0x28]
	str r0, [sp, 0x2C]
_080FF5F8:
	ldr r3, [sp, 0x4]
	ldr r4, [sp, 0xC]
	subs r1, r3, r4
	lsls r0, r2, 16
	asrs r0, 16
	adds r0, 0x1
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x14]
	movs r0, 0
	mov r10, r0
	adds r1, r2, 0x1
	str r1, [sp, 0x30]
	ldr r3, [sp, 0x28]
	cmp r10, r3
	bcc _080FF61C
	b _080FF744
_080FF61C:
	ldr r4, [sp, 0x10]
	lsls r4, 5
	str r4, [sp, 0x18]
	ldr r0, _080FF684
	adds r0, r4, r0
	str r0, [sp, 0x1C]
	ldr r0, _080FF688
	adds r0, r4, r0
	str r0, [sp, 0x24]
	ldr r3, [sp, 0x8]
	adds r1, r2, 0
	muls r1, r3
	str r1, [sp, 0x20]
_080FF636:
	ldr r0, [sp]
	add r0, r10
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, [sp, 0x20]
	add r1, r10
	ldr r4, [sp, 0x1C]
	ldr r0, [r4]
	lsls r1, 1
	adds r1, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	lsls r4, r0, 16
	lsls r0, r4, 8
	lsrs r0, 24
	bl sub_8057288
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080FF67C
	ldr r3, [sp, 0x24]
	ldrb r0, [r3, 0x11]
	cmp r0, 0x1
	beq _080FF68C
	lsrs r0, r4, 28
	cmp r0, 0
	beq _080FF68C
_080FF67C:
	movs r4, 0xC0
	lsls r4, 4
	mov r8, r4
	b _080FF690
	.align 2, 0
_080FF684: .4byte 0x083f7c0c
_080FF688: .4byte gDecorations
_080FF68C:
	movs r0, 0
	mov r8, r0
_080FF690:
	ldr r1, [sp, 0x24]
	ldrb r0, [r1, 0x11]
	lsls r7, r5, 16
	ldr r2, [sp, 0x14]
	lsls r2, 16
	mov r9, r2
	cmp r0, 0x3
	beq _080FF6BA
	asrs r0, r7, 16
	asrs r1, r2, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_80572B0
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1
	cmp r0, 0x1
	beq _080FF6BC
_080FF6BA:
	movs r6, 0
_080FF6BC:
	ldr r3, [sp, 0x18]
	ldr r4, _080FF704
	adds r0, r3, r4
	ldrb r0, [r0]
	ldr r4, [sp, 0x20]
	add r4, r10
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_80FF1B0
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080FF708
	cmp r5, r0
	beq _080FF70C
	asrs r0, r7, 16
	mov r2, r9
	asrs r1, r2, 16
	ldr r3, [sp, 0x1C]
	ldr r2, [r3]
	lsls r3, r4, 1
	adds r3, r2
	movs r4, 0x80
	lsls r4, 2
	adds r2, r4, 0
	orrs r6, r2
	ldrh r3, [r3]
	adds r2, r6, r3
	mov r3, r8
	orrs r3, r2
	orrs r3, r5
	lsls r2, r3, 16
	lsrs r2, 16
	bl MapGridSetMetatileEntryAt
	b _080FF732
	.align 2, 0
_080FF704: .4byte gDecorations
_080FF708: .4byte 0x0000ffff
_080FF70C:
	asrs r0, r7, 16
	mov r2, r9
	asrs r1, r2, 16
	ldr r3, [sp, 0x1C]
	ldr r2, [r3]
	lsls r3, r4, 1
	adds r3, r2
	movs r4, 0x80
	lsls r4, 2
	adds r2, r4, 0
	orrs r6, r2
	ldrh r3, [r3]
	adds r2, r6, r3
	mov r3, r8
	orrs r3, r2
	lsls r2, r3, 16
	lsrs r2, 16
	bl MapGridSetMetatileIdAt
_080FF732:
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	ldr r4, [sp, 0x28]
	cmp r10, r4
	bcs _080FF744
	b _080FF636
_080FF744:
	ldr r1, [sp, 0x30]
	lsls r0, r1, 16
	lsrs r2, r0, 16
	ldr r3, [sp, 0x2C]
	lsrs r0, r3, 16
	cmp r2, r0
	bcs _080FF754
	b _080FF5F8
_080FF754:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FF1EC

	thumb_func_start sub_80FF394
sub_80FF394: @ 80FF764
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _080FF78C
	lsls r0, r2, 5
	adds r0, r1
	ldrb r0, [r0, 0x12]
	cmp r0, 0x9
	bhi _080FF83C
	lsls r0, 2
	ldr r1, _080FF790
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FF78C: .4byte gDecorations
_080FF790: .4byte _080FF794
	.align 2, 0
_080FF794:
	.4byte _080FF7BC
	.4byte _080FF7C6
	.4byte _080FF7D0
	.4byte _080FF7E0
	.4byte _080FF7EA
	.4byte _080FF7F4
	.4byte _080FF804
	.4byte _080FF80E
	.4byte _080FF81E
	.4byte _080FF82E
_080FF7BC:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x1
	b _080FF7D8
_080FF7C6:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x2
	b _080FF7D8
_080FF7D0:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x3
_080FF7D8:
	movs r3, 0x1
	bl sub_80FF1EC
	b _080FF83C
_080FF7E0:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x4
	b _080FF7FC
_080FF7EA:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x2
	b _080FF7FC
_080FF7F4:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x1
_080FF7FC:
	movs r3, 0x2
	bl sub_80FF1EC
	b _080FF83C
_080FF804:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x1
	b _080FF826
_080FF80E:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x4
	bl sub_80FF1EC
	b _080FF83C
_080FF81E:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x3
_080FF826:
	movs r3, 0x3
	bl sub_80FF1EC
	b _080FF83C
_080FF82E:
	str r2, [sp]
	adds r0, r3, 0
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80FF1EC
_080FF83C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FF394

	thumb_func_start sub_80FF474
sub_80FF474: @ 80FF844
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r6, 0
	ldr r0, _080FF91C
	mov r8, r0
	ldr r1, _080FF920
	mov r9, r1
	ldr r2, _080FF924
	mov r10, r2
	ldr r7, _080FF928
_080FF860:
	adds r5, r6, 0
	adds r5, 0xAE
	adds r4, r5, 0
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FF940
	adds r0, r4, 0
	bl FlagReset
	movs r2, 0
	mov r4, r8
	ldr r0, [r4, 0x4]
	ldrb r6, [r0]
	cmp r2, r6
	bcs _080FF8B0
	ldr r0, [r0, 0x4]
	ldrh r0, [r0, 0x14]
	cmp r0, r5
	beq _080FF8B0
	ldr r0, _080FF91C
	ldr r3, [r0, 0x4]
	ldrb r6, [r3]
	adds r4, r5, 0
_080FF896:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcs _080FF8B0
	ldr r0, [r3, 0x4]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	cmp r0, r4
	bne _080FF896
_080FF8B0:
	mov r1, r8
	ldr r0, [r1, 0x4]
	ldr r1, [r0, 0x4]
	lsls r4, r2, 1
	adds r4, r2
	lsls r4, 3
	adds r1, r4, r1
	ldr r2, _080FF92C
	adds r0, r2, 0
	ldrb r1, [r1, 0x1]
	adds r0, r1
	ldr r1, _080FF930
	ldr r1, [r1]
	ldr r1, [r1, 0x1C]
	ldrh r1, [r1]
	bl VarSet
	mov r5, r8
	ldr r0, [r5, 0x4]
	ldr r0, [r0, 0x4]
	adds r4, r0
	ldrb r0, [r4]
	mov r6, r9
	strh r0, [r6]
	ldr r1, _080FF934
	ldrh r1, [r1]
	mov r2, r10
	strh r1, [r2]
	ldr r1, _080FF938
	ldrh r1, [r1]
	ldr r4, _080FF93C
	strh r1, [r4]
	ldrb r1, [r7, 0x5]
	ldrb r2, [r7, 0x4]
	bl show_sprite
	ldrb r0, [r6]
	ldrb r1, [r7, 0x5]
	ldrb r2, [r7, 0x4]
	mov r5, r10
	movs r6, 0
	ldrsh r3, [r5, r6]
	movs r5, 0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_805C0F8
	mov r6, r9
	ldrb r0, [r6]
	ldrb r1, [r7, 0x5]
	ldrb r2, [r7, 0x4]
	bl sub_805C78C
	b _080FF94A
	.align 2, 0
_080FF91C: .4byte gMapHeader
_080FF920: .4byte gSpecialVar_0x8005
_080FF924: .4byte gSpecialVar_0x8006
_080FF928: .4byte gSaveBlock1
_080FF92C: .4byte 0x00003f20
_080FF930: .4byte gUnknown_02038900
_080FF934: .4byte gUnknown_020391A4
_080FF938: .4byte gUnknown_020391A6
_080FF93C: .4byte gSpecialVar_0x8007
_080FF940:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xD
	bls _080FF860
_080FF94A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FF474

	thumb_func_start sub_80FF58C
sub_80FF58C: @ 80FF95C
	push {lr}
	movs r1, 0
	ldr r0, _080FF978
	ldrb r2, [r0, 0x8]
	cmp r1, r2
	bcs _080FF986
	ldr r3, [r0]
_080FF96A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FF97C
	movs r0, 0x1
	b _080FF988
	.align 2, 0
_080FF978: .4byte 0x0201f000
_080FF97C:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _080FF96A
_080FF986:
	movs r0, 0
_080FF988:
	pop {r1}
	bx r1
	thumb_func_end sub_80FF58C

	thumb_func_start sub_80FF5BC
sub_80FF5BC: @ 80FF98C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080FF9B4
	ldrb r0, [r0, 0x9]
	cmp r0, 0x1
	bne _080FF9C0
	ldr r0, _080FF9B8
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080FF9C0
	cmp r0, 0x7
	beq _080FF9C0
	bl sub_80FEF74
	bl sub_80FED1C
	ldr r1, _080FF9BC
	b _080FFA3E
	.align 2, 0
_080FF9B4: .4byte 0x0201f000
_080FF9B8: .4byte gUnknown_020388F6
_080FF9BC: .4byte gSecretBaseText_DecorCantPlace
_080FF9C0:
	bl sub_80FEFA4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FFA58
	bl sub_80FF58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FF9FC
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _080FF9F4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _080FF9F8
	str r1, [r0]
	b _080FFA6C
	.align 2, 0
_080FF9F4: .4byte gTasks
_080FF9F8: .4byte sub_80FF6AC
_080FF9FC:
	bl sub_80FEF74
	bl sub_80FED1C
	ldr r0, _080FFA24
	ldr r4, _080FFA28
	ldrb r1, [r4, 0x8]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	bne _080FFA34
	ldr r0, _080FFA2C
	ldr r1, _080FFA30
	bl StringExpandPlaceholders
	b _080FFA3C
	.align 2, 0
_080FFA24: .4byte gStringVar1
_080FFA28: .4byte 0x0201f000
_080FFA2C: .4byte gStringVar4
_080FFA30: .4byte gSecretBaseText_NoMoreDecor
_080FFA34:
	ldr r0, _080FFA4C
	ldr r1, _080FFA50
	bl StringExpandPlaceholders
_080FFA3C:
	ldr r1, _080FFA4C
_080FFA3E:
	ldr r2, _080FFA54
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _080FFA6C
	.align 2, 0
_080FFA4C: .4byte gStringVar4
_080FFA50: .4byte gSecretBaseText_NoMoreDecor2
_080FFA54: .4byte sub_80FEFF4
_080FFA58:
	bl sub_80FEF74
	bl sub_80FED1C
	ldr r1, _080FFA74
	ldr r2, _080FFA78
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080FFA6C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FFA74: .4byte gSecretBaseText_InUseAlready
_080FFA78: .4byte sub_80FEFF4
	thumb_func_end sub_80FF5BC

	thumb_func_start sub_80FF6AC
sub_80FF6AC: @ 80FFA7C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080FFAA0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0xC
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	beq _080FFAE4
	cmp r0, 0x1
	bgt _080FFAA4
	cmp r0, 0
	beq _080FFAAA
	b _080FFB4A
	.align 2, 0
_080FFAA0: .4byte gTasks
_080FFAA4:
	cmp r0, 0x2
	beq _080FFB34
	b _080FFB4A
_080FFAAA:
	ldr r0, _080FFADC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080FFB4A
	adds r0, r6, 0
	bl sub_80FF0E0
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	ldr r0, _080FFAE0
	movs r1, 0x8
	bl sub_80F9520
	bl BuyMenuFreeMemory
	movs r0, 0x1
	strh r0, [r7, 0xC]
	b _080FFB4A
	.align 2, 0
_080FFADC: .4byte gPaletteFade
_080FFAE0: .4byte gUnknown_020388F7
_080FFAE4:
	ldr r4, _080FFB24
	ldrb r0, [r4, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4, 0x8]
	ldr r5, _080FFB28
	ldr r0, _080FFB2C
	ldrb r1, [r0]
	ldr r0, _080FFB30
	ldr r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r5, 0
	bl AddDecorationIconObjectFromFieldObject
	adds r0, r6, 0
	bl sub_80FF960
	adds r0, r6, 0
	adds r1, r5, 0
	bl SetUpPlacingDecorationPlayerAvatar
	bl pal_fill_black
	ldrb r1, [r4, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x8]
	movs r0, 0x2
	strh r0, [r7, 0xC]
	b _080FFB4A
	.align 2, 0
_080FFB24: .4byte gPaletteFade
_080FFB28: .4byte gUnknown_02038900
_080FFB2C: .4byte gUnknown_020388F5
_080FFB30: .4byte gUnknown_020388D0
_080FFB34:
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FFB4A
	movs r0, 0
	strh r0, [r7, 0x20]
	adds r0, r6, 0
	bl sub_810065C
_080FFB4A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FF6AC

	thumb_func_start AddDecorationIconObjectFromFieldObject
AddDecorationIconObjectFromFieldObject: @ 80FFB50
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl sub_80FEF74
	bl sub_80FED1C
	adds r0, r5, 0
	bl sub_81006D0
	lsls r4, 5
	ldr r0, _080FFBE0
	adds r4, r0
	str r4, [r5]
	ldrb r0, [r4, 0x11]
	cmp r0, 0x4
	beq _080FFC04
	adds r0, r5, 0
	bl sub_81008BC
	ldr r0, [r5]
	ldrb r0, [r0, 0x12]
	bl sub_8100930
	adds r0, r5, 0
	bl sub_8100874
	ldr r1, _080FFBE4
	adds r0, r5, r1
	ldr r1, _080FFBE8
	ldr r1, [r1]
	ldr r2, [r1, 0x14]
	ldr r1, [r5]
	ldr r1, [r1, 0x1C]
	ldrh r1, [r1]
	ldr r2, [r2, 0xC]
	lsls r1, 4
	adds r1, r2
	ldrh r1, [r1, 0xE]
	lsrs r1, 12
	bl sub_810070C
	ldr r0, _080FFBEC
	bl LoadSpritePalette
	ldr r3, _080FFBF0
	ldr r2, _080FFBF4
	ldr r4, _080FFBF8
	ldr r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strb r0, [r3]
	ldr r0, _080FFBFC
	ldr r3, _080FFC00
	ldr r1, [r5]
	ldrb r2, [r1, 0x12]
	lsls r2, 2
	adds r2, r3
	ldrb r1, [r2, 0x2]
	ldrb r2, [r2, 0x3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [r4, 0x4]
	b _080FFC4E
	.align 2, 0
_080FFBE0: .4byte gDecorations
_080FFBE4: .4byte 0x00000884
_080FFBE8: .4byte gMapHeader
_080FFBEC: .4byte gUnknown_083EC954
_080FFBF0: .4byte gUnknown_020391A8
_080FFBF4: .4byte gSprites
_080FFBF8: .4byte gUnknown_03004880
_080FFBFC: .4byte gSpriteTemplate_83EC93C
_080FFC00: .4byte gUnknown_083EC900
_080FFC04:
	ldr r2, _080FFC58
	ldr r6, _080FFC5C
	ldr r5, _080FFC60
	ldr r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r0, [r0, 0x2E]
	strb r0, [r2]
	ldr r0, [r4, 0x1C]
	ldrh r0, [r0]
	ldr r1, _080FFC64
	ldr r2, _080FFC68
	ldrb r3, [r4, 0x12]
	lsls r3, 2
	adds r3, r2
	ldrb r2, [r3, 0x2]
	ldrb r3, [r3, 0x3]
	movs r4, 0x1
	str r4, [sp]
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	str r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
_080FFC4E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FFC58: .4byte gUnknown_020391A8
_080FFC5C: .4byte gSprites
_080FFC60: .4byte gUnknown_03004880
_080FFC64: .4byte sub_81009A8
_080FFC68: .4byte gUnknown_083EC900
	thumb_func_end AddDecorationIconObjectFromFieldObject

	thumb_func_start SetUpPlacingDecorationPlayerAvatar
SetUpPlacingDecorationPlayerAvatar: @ 80FFC6C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080FFCC0
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r2, [r2, 0x12]
	ldr r3, _080FFCC4
	ldr r0, [r1]
	ldrb r4, [r0, 0x12]
	lsls r1, r4, 2
	adds r1, r3
	lsls r0, r2, 4
	ldrb r1, [r1, 0x2]
	adds r0, r1
	subs r2, 0x1
	lsls r2, 3
	subs r0, r2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r4, 0x2
	beq _080FFCA6
	cmp r4, 0x8
	beq _080FFCA6
	cmp r4, 0x9
	bne _080FFCAE
_080FFCA6:
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
_080FFCAE:
	ldr r0, _080FFCC8
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080FFCD0
	ldr r1, _080FFCCC
	str r0, [sp]
	movs r0, 0xC1
	b _080FFCD8
	.align 2, 0
_080FFCC0: .4byte gTasks
_080FFCC4: .4byte gUnknown_083EC900
_080FFCC8: .4byte gSaveBlock2
_080FFCCC: .4byte SpriteCallbackDummy
_080FFCD0:
	ldr r1, _080FFD1C
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC2
_080FFCD8:
	movs r3, 0x48
	bl AddPseudoFieldObject
	ldr r1, _080FFD20
	strb r0, [r1]
	ldr r3, _080FFD24
	ldr r0, _080FFD20
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r4, _080FFD28
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	bl DestroySprite
	ldr r0, _080FFD2C
	ldr r0, [r0, 0x4]
	strb r0, [r4]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FFD1C: .4byte SpriteCallbackDummy
_080FFD20: .4byte gUnknown_020391A9
_080FFD24: .4byte gSprites
_080FFD28: .4byte gUnknown_020391A8
_080FFD2C: .4byte gUnknown_03004880
	thumb_func_end SetUpPlacingDecorationPlayerAvatar

	thumb_func_start sub_80FF960
sub_80FF960: @ 80FFD30
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080FFD5C
	ldr r0, _080FFD60
	ldrb r1, [r0]
	ldr r0, _080FFD64
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 5
	adds r0, r2
	ldrb r0, [r0, 0x12]
	cmp r0, 0x9
	bls _080FFD50
	b _080FFE76
_080FFD50:
	lsls r0, 2
	ldr r1, _080FFD68
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FFD5C: .4byte gDecorations
_080FFD60: .4byte gUnknown_020388F5
_080FFD64: .4byte gUnknown_020388D0
_080FFD68: .4byte _080FFD6C
	.align 2, 0
_080FFD6C:
	.4byte _080FFD94
	.4byte _080FFDA8
	.4byte _080FFDC0
	.4byte _080FFDD8
	.4byte _080FFDEC
	.4byte _080FFE00
	.4byte _080FFE14
	.4byte _080FFE34
	.4byte _080FFE4C
	.4byte _080FFE64
_080FFD94:
	ldr r0, _080FFDA4
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _080FFE58
	.align 2, 0
_080FFDA4: .4byte gTasks
_080FFDA8:
	ldr r1, _080FFDBC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x12]
	movs r1, 0x1
	b _080FFE74
	.align 2, 0
_080FFDBC: .4byte gTasks
_080FFDC0:
	ldr r1, _080FFDD4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x12]
	movs r1, 0x1
	b _080FFE74
	.align 2, 0
_080FFDD4: .4byte gTasks
_080FFDD8:
	ldr r1, _080FFDE8
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	b _080FFE70
	.align 2, 0
_080FFDE8: .4byte gTasks
_080FFDEC:
	ldr r0, _080FFDFC
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	movs r0, 0x2
	b _080FFE58
	.align 2, 0
_080FFDFC: .4byte gTasks
_080FFE00:
	ldr r1, _080FFE10
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	b _080FFE70
	.align 2, 0
_080FFE10: .4byte gTasks
_080FFE14:
	ldr r0, _080FFE30
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x12]
	movs r0, 0x3
	strh r0, [r1, 0x14]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	b _080FFE76
	.align 2, 0
_080FFE30: .4byte gTasks
_080FFE34:
	ldr r1, _080FFE48
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x12]
	movs r1, 0x4
	b _080FFE74
	.align 2, 0
_080FFE48: .4byte gTasks
_080FFE4C:
	ldr r0, _080FFE60
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	movs r0, 0x3
_080FFE58:
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	b _080FFE76
	.align 2, 0
_080FFE60: .4byte gTasks
_080FFE64:
	ldr r1, _080FFE7C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
_080FFE70:
	strh r1, [r0, 0x12]
	movs r1, 0x2
_080FFE74:
	strh r1, [r0, 0x14]
_080FFE76:
	pop {r0}
	bx r0
	.align 2, 0
_080FFE7C: .4byte gTasks
	thumb_func_end sub_80FF960

	thumb_func_start sub_80FFAB0
sub_80FFAB0: @ 80FFE80
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080FFEC8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r3, _080FFECC
	ldr r0, _080FFED0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0x1
	strh r2, [r0, 0x3C]
	ldr r0, _080FFED4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x3C]
	bl sub_810045C
	adds r0, r4, 0
	bl sub_8100038
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FFEC8: .4byte gTasks
_080FFECC: .4byte gSprites
_080FFED0: .4byte gUnknown_020391A8
_080FFED4: .4byte gUnknown_020391A9
	thumb_func_end sub_80FFAB0

	thumb_func_start sub_80FFB08
sub_80FFB08: @ 80FFED8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080FFF24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	ldr r3, _080FFF28
	ldr r0, _080FFF2C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0x1
	strh r2, [r0, 0x3C]
	ldr r0, _080FFF30
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x3C]
	bl sub_810045C
	ldr r1, _080FFF34
	ldr r2, _080FFF38
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FFF24: .4byte gTasks
_080FFF28: .4byte gSprites
_080FFF2C: .4byte gUnknown_020391A8
_080FFF30: .4byte gUnknown_020391A9
_080FFF34: .4byte gSecretBaseText_CancelDecorating
_080FFF38: .4byte sub_8100248
	thumb_func_end sub_80FFB08

	thumb_func_start sub_80FFB6C
sub_80FFB6C: @ 80FFF3C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_8057274
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FFF56
	cmp r4, 0
	beq _080FFF5A
_080FFF56:
	movs r0, 0
	b _080FFF5C
_080FFF5A:
	movs r0, 0x1
_080FFF5C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFB6C

	thumb_func_start sub_80FFB94
sub_80FFB94: @ 80FFF64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r1, 16
	asrs r1, 16
	ldr r3, _080FFFA0
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	adds r0, 0x7
	cmp r1, r0
	bne _080FFFA4
	lsls r1, r4, 16
	asrs r1, 16
	movs r3, 0x10
	ldrsh r0, [r2, r3]
	adds r0, 0x7
	cmp r1, r0
	bne _080FFFA4
	cmp r5, 0
	beq _080FFFA4
	movs r0, 0
	b _080FFFA6
	.align 2, 0
_080FFFA0: .4byte gTasks
_080FFFA4:
	movs r0, 0x1
_080FFFA6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFB94

	thumb_func_start sub_80FFBDC
sub_80FFBDC: @ 80FFFAC
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057274
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080FFFEC
	ldrb r0, [r5]
	cmp r0, 0x21
	bne _080FFFDA
	adds r0, r4, 0
	bl sub_8057300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080FFFE8
_080FFFDA:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_805729C
	lsls r0, 24
	cmp r0, 0
	beq _080FFFEC
_080FFFE8:
	movs r0, 0x1
	b _080FFFEE
_080FFFEC:
	movs r0, 0
_080FFFEE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFBDC

	thumb_func_start sub_80FFC24
sub_80FFC24: @ 80FFFF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r1, [sp]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r1, _08100030
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	ldrb r2, [r0, 0x14]
	str r2, [sp, 0x4]
	ldrb r0, [r0, 0x12]
	str r0, [sp, 0x8]
	ldr r3, [sp]
	ldrb r0, [r3, 0x11]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _08100026
	b _081003F4
_08100026:
	lsls r0, 2
	ldr r1, _08100034
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08100030: .4byte gTasks
_08100034: .4byte _08100038
	.align 2, 0
_08100038:
	.4byte _0810004C
	.4byte _0810004C
	.4byte _08100138
	.4byte _081002EC
	.4byte _08100370
_0810004C:
	movs r6, 0
	ldr r0, [sp, 0x4]
	cmp r6, r0
	bcc _08100056
	b _081003F4
_08100056:
	mov r1, r10
	lsls r1, 2
	str r1, [sp, 0x1C]
_0810005C:
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	ldr r3, _08100134
	adds r0, r3
	ldrh r0, [r0, 0xA]
	subs r0, r6
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r7, 0
	adds r6, 0x1
	str r6, [sp, 0x14]
	ldr r0, [sp, 0x8]
	cmp r7, r0
	bcs _08100126
	mov r1, r9
	lsls r1, 16
	str r1, [sp, 0xC]
	asrs r1, 16
	mov r9, r1
_08100088:
	ldr r0, [sp, 0x1C]
	add r0, r10
	lsls r0, 3
	ldr r2, _08100134
	adds r0, r2
	ldrh r0, [r0, 0x8]
	adds r0, r7
	lsls r0, 16
	mov r8, r0
	asrs r6, r0, 16
	adds r0, r6, 0
	mov r1, r9
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, [sp, 0x4]
	ldr r1, [sp, 0x14]
	subs r0, r3, r1
	ldr r2, [sp, 0x8]
	adds r1, r0, 0
	muls r1, r2
	adds r1, r7
	ldr r3, [sp]
	ldr r0, [r3, 0x1C]
	lsls r1, 1
	adds r1, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	movs r3, 0xF0
	lsls r3, 8
	adds r1, r3, 0
	adds r5, r1, 0
	ands r5, r0
	adds r0, r4, 0
	ldr r1, [sp]
	bl sub_80FFBDC
	lsls r0, 24
	cmp r0, 0
	bne _081000EA
	b _081003C4
_081000EA:
	mov r0, r10
	adds r1, r6, 0
	mov r2, r9
	adds r3, r5, 0
	bl sub_80FFB94
	lsls r0, 24
	cmp r0, 0
	bne _081000FE
	b _081003C4
_081000FE:
	mov r1, r8
	lsrs r0, r1, 16
	ldr r2, [sp, 0xC]
	lsrs r1, r2, 16
	movs r2, 0
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0810011A
	cmp r4, 0x10
	beq _0810011A
	b _081003C4
_0810011A:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcc _08100088
_08100126:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x4]
	cmp r6, r2
	bcc _0810005C
	b _081003F4
	.align 2, 0
_08100134: .4byte gTasks
_08100138:
	movs r6, 0
	mov r3, r10
	lsls r3, 2
	str r3, [sp, 0x1C]
	ldr r0, [sp, 0x4]
	subs r0, 0x1
	str r0, [sp, 0x18]
	cmp r6, r0
	bge _08100224
	adds r0, r3, 0
	add r0, r10
	lsls r0, 3
	str r0, [sp, 0x10]
_08100152:
	ldr r1, [sp, 0x10]
	adds r0, r1, r2
	ldrh r0, [r0, 0xA]
	subs r0, r6
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r7, 0
	adds r6, 0x1
	str r6, [sp, 0x14]
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcs _08100218
	lsls r0, 16
	str r0, [sp, 0x20]
_08100170:
	ldr r1, [sp, 0x10]
	adds r0, r1, r2
	ldrh r0, [r0, 0x8]
	adds r0, r7
	lsls r0, 16
	mov r8, r0
	asrs r6, r0, 16
	mov r2, r9
	lsls r1, r2, 16
	adds r0, r6, 0
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, [sp, 0x4]
	ldr r1, [sp, 0x14]
	subs r0, r3, r1
	ldr r2, [sp, 0x8]
	adds r1, r0, 0
	muls r1, r2
	adds r1, r7
	ldr r3, [sp]
	ldr r0, [r3, 0x1C]
	lsls r1, 1
	adds r1, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	movs r3, 0xF0
	lsls r3, 8
	adds r1, r3, 0
	adds r5, r1, 0
	ands r5, r0
	adds r0, r4, 0
	bl sub_805729C
	lsls r0, 24
	cmp r0, 0
	bne _081001DC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80FFB6C
	lsls r0, 24
	cmp r0, 0
	bne _081001DC
	b _081003C4
_081001DC:
	mov r0, r10
	adds r1, r6, 0
	ldr r3, [sp, 0x20]
	asrs r2, r3, 16
	adds r3, r5, 0
	bl sub_80FFB94
	lsls r0, 24
	cmp r0, 0
	bne _081001F2
	b _081003C4
_081001F2:
	mov r1, r8
	lsrs r0, r1, 16
	ldr r2, [sp, 0x20]
	lsrs r1, r2, 16
	movs r2, 0
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0810020A
	b _081003C4
_0810020A:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _081002E8
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcc _08100170
_08100218:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r3, [sp, 0x18]
	cmp r6, r3
	blt _08100152
_08100224:
	ldr r0, [sp, 0x1C]
	add r0, r10
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0xA]
	ldr r1, [sp, 0x4]
	subs r0, r1
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r7, 0
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcc _08100244
	b _081003F4
_08100244:
	lsls r0, 16
	str r0, [sp, 0x20]
_08100248:
	ldr r0, [sp, 0x1C]
	add r0, r10
	lsls r0, 3
	ldr r1, _081002E8
	adds r0, r1
	ldrh r0, [r0, 0x8]
	adds r0, r7
	lsls r0, 16
	mov r8, r0
	asrs r6, r0, 16
	mov r2, r9
	lsls r1, r2, 16
	adds r0, r6, 0
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, [sp]
	ldr r0, [r3, 0x1C]
	lsls r1, r7, 1
	adds r1, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	movs r3, 0xF0
	lsls r3, 8
	adds r1, r3, 0
	adds r5, r1, 0
	ands r5, r0
	adds r0, r4, 0
	bl sub_805729C
	lsls r0, 24
	cmp r0, 0
	bne _081002AA
	adds r0, r4, 0
	bl sub_80572B0
	lsls r0, 24
	cmp r0, 0
	bne _081002AA
	b _081003C4
_081002AA:
	mov r0, r10
	adds r1, r6, 0
	ldr r3, [sp, 0x20]
	asrs r2, r3, 16
	adds r3, r5, 0
	bl sub_80FFB94
	lsls r0, 24
	cmp r0, 0
	bne _081002C0
	b _081003C4
_081002C0:
	mov r1, r8
	lsrs r0, r1, 16
	ldr r2, [sp, 0x20]
	lsrs r1, r2, 16
	movs r2, 0
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _081002DA
	cmp r4, 0x10
	bne _081003C4
_081002DA:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcc _08100248
	b _081003F4
	.align 2, 0
_081002E8: .4byte gTasks
_081002EC:
	movs r6, 0
	ldr r0, [sp, 0x4]
	cmp r6, r0
	bcc _081002F6
	b _081003F4
_081002F6:
	mov r1, r10
	lsls r0, r1, 2
	add r0, r10
	lsls r1, r0, 3
	ldr r2, _0810036C
	adds r0, r1, r2
	ldrh r0, [r0, 0xA]
	subs r0, r6
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r7, 0
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcs _0810035C
	adds r0, r2, 0
	adds r1, r0
	mov r8, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r5, r0, 16
_08100320:
	mov r2, r8
	ldrh r0, [r2, 0x8]
	adds r0, r7
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_80572B0
	lsls r0, 24
	cmp r0, 0
	beq _081003C4
	adds r0, r4, 0
	adds r1, r5, 0x1
	bl MapGridGetMetatileIdAt
	movs r1, 0xA3
	lsls r1, 2
	cmp r0, r1
	beq _081003C4
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcc _08100320
_0810035C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x4]
	cmp r6, r0
	bcc _081002F6
	b _081003F4
	.align 2, 0
_0810036C: .4byte gTasks
_08100370:
	mov r3, r10
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0xA]
	mov r9, r0
	movs r7, 0
	str r1, [sp, 0x1C]
	ldr r0, [sp, 0x8]
	cmp r7, r0
	bcs _081003F4
	adds r6, r2, 0
	mov r1, r9
	lsls r1, 16
	str r1, [sp, 0x20]
_08100390:
	ldr r0, [sp, 0x1C]
	add r0, r10
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x8]
	adds r0, r7
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	mov r2, r9
	lsls r1, r2, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, [sp]
	ldrb r0, [r3, 0x12]
	cmp r0, 0x5
	bne _081003C8
_081003B8:
	adds r0, r4, 0
	bl sub_80572EC
	lsls r0, 24
	cmp r0, 0
	bne _081003D4
_081003C4:
	movs r0, 0
	b _081003F6
_081003C8:
	adds r0, r4, 0
	bl sub_80572D8
	lsls r0, 24
	cmp r0, 0
	beq _081003B8
_081003D4:
	adds r0, r5, 0
	ldr r2, [sp, 0x20]
	lsrs r1, r2, 16
	movs r2, 0
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bne _081003C4
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, [sp, 0x8]
	cmp r7, r3
	bcc _08100390
_081003F4:
	movs r0, 0x1
_081003F6:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FFC24

	thumb_func_start sub_8100038
sub_8100038: @ 8100408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810043C
	ldrb r1, [r0]
	ldr r0, _08100440
	ldr r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 5
	ldr r0, _08100444
	adds r1, r0
	adds r0, r4, 0
	bl sub_80FFC24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08100450
	ldr r1, _08100448
	ldr r2, _0810044C
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08100462
	.align 2, 0
_0810043C: .4byte gUnknown_020388F5
_08100440: .4byte gUnknown_020388D0
_08100444: .4byte gDecorations
_08100448: .4byte gSecretBaseText_PlaceItHere
_0810044C: .4byte sub_81000A0
_08100450:
	movs r0, 0x20
	bl PlaySE
	ldr r1, _08100468
	ldr r2, _0810046C
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08100462:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100468: .4byte gSecretBaseText_CantBePlacedHere
_0810046C: .4byte sub_81006A8
	thumb_func_end sub_8100038

	thumb_func_start sub_81000A0
sub_81000A0: @ 8100470
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08100490
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100490: .4byte gUnknown_083EC95C
	thumb_func_end sub_81000A0

	thumb_func_start sub_81000C4
sub_81000C4: @ 8100494
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_8100174
	ldr r2, _081004DC
	ldr r0, _081004E0
	ldrb r1, [r0]
	ldr r0, _081004E4
	ldr r0, [r0]
	adds r0, r1
	ldrb r3, [r0]
	lsls r0, r3, 5
	adds r0, r2
	ldrb r0, [r0, 0x11]
	cmp r0, 0x4
	beq _081004EC
	ldr r0, _081004E8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	ldrh r1, [r1, 0xA]
	adds r2, r3, 0
	bl sub_80FF394
	b _0810050C
	.align 2, 0
_081004DC: .4byte gDecorations
_081004E0: .4byte gUnknown_020388F5
_081004E4: .4byte gUnknown_020388D0
_081004E8: .4byte gTasks
_081004EC:
	ldr r2, _0810052C
	ldr r0, _08100530
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	subs r0, 0x7
	strh r0, [r2]
	ldr r2, _08100534
	ldrh r0, [r1, 0xA]
	subs r0, 0x7
	strh r0, [r2]
	ldr r0, _08100538
	bl ScriptContext1_SetupScript
_0810050C:
	ldr r2, _0810053C
	ldr r0, _08100540
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x2
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	bl sub_810028C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810052C: .4byte gUnknown_020391A4
_08100530: .4byte gTasks
_08100534: .4byte gUnknown_020391A6
_08100538: .4byte gUnknown_081A2F7B
_0810053C: .4byte gSprites
_08100540: .4byte gUnknown_020391A8
	thumb_func_end sub_81000C4

	thumb_func_start sub_8100174
sub_8100174: @ 8100544
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r3, 0
	ldr r0, _08100580
	ldrb r1, [r0, 0x8]
	adds r5, r0, 0
	cmp r3, r1
	bcs _0810056A
	ldr r4, [r5]
_08100558:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, 0
	beq _08100588
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _08100558
_0810056A:
	ldrb r0, [r5, 0x9]
	cmp r0, 0
	bne _081005D4
	movs r3, 0
	ldr r0, _08100584
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0
	bne _081005C0
	b _081005E0
	.align 2, 0
_08100580: .4byte 0x0201f000
_08100584: .4byte gUnknown_020388D6
_08100588:
	ldr r0, _081005B4
	ldrb r1, [r0]
	ldr r0, _081005B8
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, [r5, 0x4]
	adds r2, r3
	ldr r0, _081005BC
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	subs r0, 0x7
	lsls r0, 4
	ldrb r1, [r1, 0xA]
	subs r1, 0x7
	adds r0, r1
	strb r0, [r2]
	b _0810056A
	.align 2, 0
_081005B4: .4byte gUnknown_020388F5
_081005B8: .4byte gUnknown_020388D0
_081005BC: .4byte gTasks
_081005C0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xF
	bhi _0810060E
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _081005C0
	b _08100606
_081005D4:
	movs r3, 0
	ldr r0, _081005EC
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0
	bne _081005F4
_081005E0:
	ldr r0, _081005F0
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r2]
	b _0810060E
	.align 2, 0
_081005EC: .4byte gUnknown_020388E6
_081005F0: .4byte gUnknown_020388F5
_081005F4:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0xB
	bhi _0810060E
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _081005F4
_08100606:
	ldr r0, _08100614
	ldrb r0, [r0]
	adds r0, 0x1
	strb r0, [r1]
_0810060E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100614: .4byte gUnknown_020388F5
	thumb_func_end sub_8100174

	thumb_func_start sub_8100248
sub_8100248: @ 8100618
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08100638
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100638: .4byte gUnknown_083EC964
	thumb_func_end sub_8100248

	thumb_func_start sub_810026C
sub_810026C: @ 810063C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_810028C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810026C

	thumb_func_start sub_810028C
sub_810028C: @ 810065C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08100684
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _08100688
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100684: .4byte gTasks
_08100688: .4byte c1_overworld_prev_quest
	thumb_func_end sub_810028C

	thumb_func_start c1_overworld_prev_quest
c1_overworld_prev_quest: @ 810068C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _081006AC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081006B0
	cmp r0, 0x1
	beq _081006D0
	b _081006EC
	.align 2, 0
_081006AC: .4byte gTasks
_081006B0:
	bl ScriptContext2_Enable
	ldr r0, _081006CC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081006EC
	adds r0, r4, 0
	bl sub_80FF114
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _081006EC
	.align 2, 0
_081006CC: .4byte gPaletteFade
_081006D0:
	bl sub_81016F4
	ldr r0, _081006F4
	bl FreeSpritePaletteByTag
	ldr r1, _081006F8
	ldr r0, _081006FC
	str r0, [r1]
	ldr r0, _08100700
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_081006EC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081006F4: .4byte 0x00000bb8
_081006F8: .4byte gUnknown_0300485C
_081006FC: .4byte sub_8100364
_08100700: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end c1_overworld_prev_quest

	thumb_func_start sub_8100334
sub_8100334: @ 8100704
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08100724
	ldr r0, _0810072C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08100730
	str r0, [r1]
_08100724:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810072C: .4byte gTasks
_08100730: .4byte sub_80FE948
	thumb_func_end sub_8100334

	thumb_func_start sub_8100364
sub_8100364: @ 8100734
	push {lr}
	bl ScriptContext2_Enable
	bl LoadScrollIndicatorPalette
	bl pal_fill_black
	ldr r0, _08100758
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FE7EC
	pop {r0}
	bx r0
	.align 2, 0
_08100758: .4byte sub_8100334
	thumb_func_end sub_8100364

	thumb_func_start sub_810038C
sub_810038C: @ 810075C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810078C
	adds r2, r1, r0
	ldr r0, _08100790
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08100794
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	subs r0, r1
	subs r0, 0x6
	cmp r0, 0
	bge _08100794
	ldrh r0, [r2, 0x2]
	adds r0, 0x1
	b _081007AE
	.align 2, 0
_0810078C: .4byte 0x03004b38
_08100790: .4byte gUnknown_020391AA
_08100794:
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _081007B8
	movs r0, 0x2
	ldrsh r1, [r2, r0]
	subs r1, 0x7
	ldr r0, _081007B4
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	cmp r1, r0
	blt _081007B8
	ldrh r0, [r2, 0x2]
	subs r0, 0x1
_081007AE:
	strh r0, [r2, 0x2]
	movs r0, 0
	b _081007FA
	.align 2, 0
_081007B4: .4byte gMapHeader
_081007B8:
	ldrb r0, [r3]
	cmp r0, 0x3
	bne _081007CE
	movs r1, 0
	ldrsh r0, [r2, r1]
	subs r0, 0x7
	cmp r0, 0
	bge _081007CE
	ldrh r0, [r2]
	adds r0, 0x1
	b _081007EE
_081007CE:
	ldrb r0, [r3]
	cmp r0, 0x4
	bne _081007F8
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	adds r1, r0
	subs r1, 0x8
	ldr r0, _081007F4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r1, r0
	blt _081007F8
	ldrh r0, [r2]
	subs r0, 0x1
_081007EE:
	strh r0, [r2]
	movs r0, 0
	b _081007FA
	.align 2, 0
_081007F4: .4byte gMapHeader
_081007F8:
	movs r0, 0x1
_081007FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810038C

	thumb_func_start sub_8100430
sub_8100430: @ 8100800
	push {lr}
	ldr r0, _08100820
	ldrh r0, [r0, 0x2C]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	beq _08100824
	cmp r1, 0x80
	beq _08100824
	cmp r1, 0x20
	beq _08100824
	cmp r1, 0x10
	beq _08100824
	movs r0, 0
	b _08100826
	.align 2, 0
_08100820: .4byte gMain
_08100824:
	movs r0, 0x1
_08100826:
	pop {r1}
	bx r1
	thumb_func_end sub_8100430

	thumb_func_start sub_810045C
sub_810045C: @ 810082C
	push {r4,lr}
	ldr r1, _08100858
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0810085C
	ldr r3, _08100860
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0
	strh r2, [r0, 0x32]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100858: .4byte gUnknown_020391AA
_0810085C: .4byte gSprites
_08100860: .4byte gUnknown_020391A8
	thumb_func_end sub_810045C

	thumb_func_start sub_8100494
sub_8100494: @ 8100864
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _081008A0
	ldr r3, _081008A4
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x36
	ldrsh r6, [r0, r1]
	cmp r6, 0
	beq _08100882
	b _081009AE
_08100882:
	ldr r1, _081008A8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x1C
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _081008B0
	ldr r0, _081008AC
	movs r3, 0x20
	ldrsh r1, [r2, r3]
	lsls r1, 3
	b _081008BE
	.align 2, 0
_081008A0: .4byte gSprites
_081008A4: .4byte gUnknown_020391A8
_081008A8: .4byte gTasks
_081008AC: .4byte gUnknown_083EC96C
_081008B0:
	cmp r0, 0x2
	bne _081008D0
	ldr r0, _081008CC
	movs r3, 0x20
	ldrsh r1, [r2, r3]
	lsls r1, 3
	adds r0, 0x4
_081008BE:
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
	b _08100A0C
	.align 2, 0
_081008CC: .4byte gUnknown_083EC96C
_081008D0:
	ldr r7, _08100A14
	ldrh r1, [r7, 0x2C]
	movs r0, 0xF0
	mov r12, r0
	ands r0, r1
	cmp r0, 0x40
	bne _08100904
	ldr r1, _08100A18
	movs r0, 0x1
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x32]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08100A1C
	strh r1, [r0, 0x34]
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	strh r0, [r2, 0xA]
_08100904:
	ldrh r1, [r7, 0x2C]
	mov r0, r12
	ands r0, r1
	cmp r0, 0x80
	bne _08100934
	ldr r1, _08100A18
	movs r0, 0x2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x32]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x34]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
_08100934:
	ldrh r1, [r7, 0x2C]
	mov r0, r12
	ands r0, r1
	cmp r0, 0x20
	bne _08100964
	ldr r1, _08100A18
	movs r0, 0x3
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08100A1C
	strh r1, [r0, 0x32]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x34]
	ldrh r0, [r2, 0x8]
	subs r0, 0x1
	strh r0, [r2, 0x8]
_08100964:
	ldrh r1, [r7, 0x2C]
	mov r0, r12
	ands r0, r1
	cmp r0, 0x10
	bne _08100994
	ldr r1, _08100A18
	movs r0, 0x4
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x32]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x34]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08100994:
	bl sub_8100430
	lsls r0, 24
	cmp r0, 0
	beq _081009AA
	adds r0, r4, 0
	bl sub_810038C
	lsls r0, 24
	cmp r0, 0
	bne _081009AE
_081009AA:
	bl sub_810045C
_081009AE:
	ldr r0, _08100A18
	ldrb r0, [r0]
	cmp r0, 0
	beq _081009DC
	ldr r3, _08100A20
	ldr r2, _08100A24
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x36]
	adds r1, 0x1
	strh r1, [r0, 0x36]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x36]
	movs r0, 0x7
	ands r0, r2
	strh r0, [r1, 0x36]
_081009DC:
	ldr r0, _08100A28
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r2, r1, r0
	movs r1, 0x1C
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08100A0C
	ldr r4, _08100A14
	ldrh r1, [r4, 0x2E]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _081009FE
	strh r3, [r2, 0x1C]
_081009FE:
	ldrh r1, [r4, 0x2E]
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08100A0C
	strh r3, [r2, 0x1C]
_08100A0C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08100A14: .4byte gMain
_08100A18: .4byte gUnknown_020391AA
_08100A1C: .4byte 0x0000fffe
_08100A20: .4byte gSprites
_08100A24: .4byte gUnknown_020391A8
_08100A28: .4byte gTasks
	thumb_func_end sub_8100494

	thumb_func_start sub_810065C
sub_810065C: @ 8100A2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _08100A68
	ldr r0, _08100A6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0
	strh r2, [r0, 0x3C]
	ldr r1, _08100A70
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1C]
	ldr r1, _08100A74
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100A68: .4byte gSprites
_08100A6C: .4byte gUnknown_020391A8
_08100A70: .4byte gTasks
_08100A74: .4byte sub_8100494
	thumb_func_end sub_810065C

	thumb_func_start sub_81006A8
sub_81006A8: @ 8100A78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08100A9C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08100A92
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08100A98
_08100A92:
	adds r0, r2, 0
	bl sub_810065C
_08100A98:
	pop {r0}
	bx r0
	.align 2, 0
_08100A9C: .4byte gMain
	thumb_func_end sub_81006A8

	thumb_func_start sub_81006D0
sub_81006D0: @ 8100AA0
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r1, 0
	adds r2, r3, 0
	adds r2, 0x84
	movs r5, 0
	ldr r4, _08100AD8
_08100AAE:
	adds r0, r2, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	bls _08100AAE
	movs r1, 0
	adds r2, r3, 0x4
	movs r3, 0
_08100AC2:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3F
	bls _08100AC2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100AD8: .4byte 0x000007ff
	thumb_func_end sub_81006D0

	thumb_func_start sub_810070C
sub_810070C: @ 8100ADC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 16
	movs r2, 0
	ldr r0, _08100B0C
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	lsrs r4, r1, 12
	ldr r3, [r0, 0x8]
_08100AEE:
	lsls r1, r2, 1
	adds r1, r5
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _08100AEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100B0C: .4byte gMapHeader
	thumb_func_end sub_810070C

	thumb_func_start sub_8100740
sub_8100740: @ 8100B10
	push {r4-r7,lr}
	sub sp, 0x20
	adds r7, r0, 0
	lsls r1, 16
	lsrs r2, r1, 16
	lsrs r3, r1, 26
	cmp r2, 0
	beq _08100B24
	ldr r0, _08100B54
	ands r2, r0
_08100B24:
	movs r5, 0
	ldr r0, _08100B58
	ldr r6, [r0]
	lsls r4, r2, 5
_08100B2C:
	mov r0, sp
	adds r2, r0, r5
	ldr r0, [r6, 0x10]
	ldr r0, [r0, 0x4]
	adds r1, r4, r5
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1F
	bls _08100B2C
	cmp r3, 0x1
	beq _08100B7E
	cmp r3, 0x1
	bgt _08100B5C
	cmp r3, 0
	beq _08100B66
	b _08100C3A
	.align 2, 0
_08100B54: .4byte 0x000003ff
_08100B58: .4byte gMapHeader
_08100B5C:
	cmp r3, 0x2
	beq _08100BDE
	cmp r3, 0x3
	beq _08100C16
	b _08100C3A
_08100B66:
	movs r5, 0
_08100B68:
	adds r1, r7, r5
	mov r2, sp
	adds r0, r2, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1F
	bls _08100B68
	b _08100C3A
_08100B7E:
	movs r5, 0
	movs r6, 0xF
_08100B82:
	lsls r4, r5, 2
	adds r4, r7
	adds r5, 0x1
	lsls r3, r5, 2
	subs r0, r3, 0x1
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, 4
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 4
	adds r1, r0
	strb r1, [r4]
	subs r0, r3, 0x2
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, 4
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 4
	adds r1, r0
	strb r1, [r4, 0x1]
	subs r0, r3, 0x3
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, 4
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 4
	adds r1, r0
	strb r1, [r4, 0x2]
	subs r3, 0x4
	mov r1, sp
	adds r0, r1, r3
	ldrb r2, [r0]
	lsrs r1, r2, 4
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 4
	adds r1, r0
	strb r1, [r4, 0x3]
	lsls r5, 16
	lsrs r5, 16
	cmp r5, 0x7
	bls _08100B82
	b _08100C3A
_08100BDE:
	movs r5, 0
	movs r3, 0x7
_08100BE2:
	lsls r2, r5, 2
	adds r2, r7
	subs r1, r3, r5
	lsls r1, 2
	mov r4, sp
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r1, 0x1
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	adds r0, r1, 0x2
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r2, 0x2]
	adds r1, 0x3
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _08100BE2
	b _08100C3A
_08100C16:
	movs r5, 0
	movs r4, 0x1F
	movs r6, 0xF
_08100C1C:
	adds r3, r7, r5
	subs r0, r4, r5
	add r0, sp
	ldrb r2, [r0]
	lsrs r1, r2, 4
	adds r0, r6, 0
	ands r0, r2
	lsls r0, 4
	adds r1, r0
	strb r1, [r3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1F
	bls _08100C1C
_08100C3A:
	add sp, 0x20
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8100740

	thumb_func_start sub_8100874
sub_8100874: @ 8100C44
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_08100C4A:
	lsls r0, r4, 5
	adds r0, 0x84
	adds r0, r5, r0
	lsls r2, r4, 1
	adds r1, r5, 0x4
	adds r1, r2
	ldrh r1, [r1]
	bl sub_8100740
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _08100C4A
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8100874

	thumb_func_start sub_810089C
sub_810089C: @ 8100C6C
	lsls r0, 16
	ldr r1, _08100C84
	ldr r1, [r1]
	ldr r1, [r1, 0x14]
	ldr r1, [r1, 0xC]
	lsrs r0, 15
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08100C88
	ands r0, r1
	bx lr
	.align 2, 0
_08100C84: .4byte gMapHeader
_08100C88: .4byte 0x00000fff
	thumb_func_end sub_810089C

	thumb_func_start sub_81008BC
sub_81008BC: @ 8100C8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, 0x12]
	movs r6, 0
	ldr r1, _08100CFC
	lsls r5, r0, 4
	adds r0, r5, r1
	ldrb r0, [r0, 0xC]
	cmp r6, r0
	bcs _08100CF0
	adds r7, r1, 0
_08100CA8:
	mov r4, r8
	ldm r4!, {r1}
	adds r0, r7, 0x4
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r6
	ldrb r0, [r0]
	ldr r1, [r1, 0x1C]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	adds r1, r7, 0
	adds r1, 0x8
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r6
	lsls r0, 3
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl sub_810089C
	adds r2, r5, r7
	ldr r1, [r2]
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 1
	adds r4, r1
	strh r0, [r4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r2, 0xC]
	cmp r6, r2
	bcc _08100CA8
_08100CF0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08100CFC: .4byte gUnknown_083EC860
	thumb_func_end sub_81008BC

	thumb_func_start sub_8100930
sub_8100930: @ 8100D00
	push {r4,r5,lr}
	lsls r0, 24
	ldr r3, _08100D68
	movs r1, 0
	strb r1, [r3]
	ldrb r2, [r3, 0x1]
	subs r1, 0x4
	ands r1, r2
	movs r4, 0xD
	negs r4, r4
	ands r1, r4
	movs r2, 0x11
	negs r2, r2
	ands r1, r2
	subs r2, 0x10
	ands r1, r2
	strb r1, [r3, 0x1]
	ldr r1, _08100D6C
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0]
	movs r5, 0x3F
	lsls r1, 6
	strb r1, [r3, 0x1]
	ldrh r2, [r3, 0x2]
	ldr r1, _08100D70
	ands r1, r2
	strh r1, [r3, 0x2]
	ldrb r2, [r3, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	strb r1, [r3, 0x3]
	ldrb r0, [r0, 0x1]
	lsls r0, 6
	ands r5, r1
	orrs r5, r0
	strb r5, [r3, 0x3]
	ldrh r1, [r3, 0x4]
	ldr r0, _08100D74
	ands r0, r1
	strh r0, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	ands r4, r0
	movs r0, 0x4
	orrs r4, r0
	movs r0, 0xF
	ands r4, r0
	strb r4, [r3, 0x5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08100D68: .4byte gUnknown_020391AC
_08100D6C: .4byte gUnknown_083EC900
_08100D70: .4byte 0xfffffe00
_08100D74: .4byte 0xfffffc00
	thumb_func_end sub_8100930

	thumb_func_start sub_81009A8
sub_81009A8: @ 8100D78
	movs r1, 0
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	strh r1, [r0, 0x3A]
	strh r1, [r0, 0x3C]
	ldr r1, _08100D8C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08100D8C: .4byte sub_81009C0
	thumb_func_end sub_81009A8

	thumb_func_start sub_81009C0
sub_81009C0: @ 8100D90
	push {lr}
	adds r2, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08100DCA
	movs r1, 0x3A
	ldrsh r0, [r2, r1]
	cmp r0, 0xE
	bgt _08100DB2
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	b _08100DBC
_08100DB2:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
_08100DBC:
	strb r0, [r3]
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x3A]
	b _08100DD6
_08100DCA:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08100DD6:
	pop {r0}
	bx r0
	thumb_func_end sub_81009C0

	thumb_func_start sub_8100A0C
sub_8100A0C: @ 8100DDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8100D38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08100E14
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08100E0C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _08100E10
	str r1, [r0]
	b _08100E20
	.align 2, 0
_08100E0C: .4byte gTasks
_08100E10: .4byte sub_8100E70
_08100E14:
	ldr r1, _08100E28
	ldr r2, _08100E2C
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08100E20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08100E28: .4byte gSecretBaseText_NoDecorInUse
_08100E2C: .4byte sub_80FE428
	thumb_func_end sub_8100A0C

	thumb_func_start sub_8100A60
sub_8100A60: @ 8100E30
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08100E48
	ldr r1, [r3]
	adds r1, r0
	movs r2, 0
	strb r2, [r1]
	ldr r1, [r3, 0x4]
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_08100E48: .4byte 0x0201f000
	thumb_func_end sub_8100A60

	thumb_func_start sub_8100A7C
sub_8100A7C: @ 8100E4C
	push {r4-r6,lr}
	ldr r6, _08100E6C
	movs r0, 0
	strh r0, [r6]
	ldr r2, _08100E70
	strh r0, [r2]
	ldr r4, _08100E74
	ldr r1, _08100E78
	ldrh r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08100E88
	movs r0, 0x1
	strh r0, [r2]
	b _08100EDA
	.align 2, 0
_08100E6C: .4byte gSpecialVar_0x8005
_08100E70: .4byte gScriptResult
_08100E74: .4byte gSpecialVar_0x8004
_08100E78: .4byte gUnknown_02039234
_08100E7C:
	ldr r1, _08100E84
	ldrb r0, [r2]
	strh r0, [r1]
	b _08100EDA
	.align 2, 0
_08100E84: .4byte gSpecialVar_0x8006
_08100E88:
	ldr r3, _08100EE0
	ldr r2, _08100EE4
	ldr r1, _08100EE8
	ldrh r0, [r4]
	lsls r0, 3
	adds r4, r0, r1
	ldrb r1, [r4]
	ldr r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 5
	adds r0, r3
	ldrb r0, [r0, 0x11]
	cmp r0, 0x4
	bne _08100EDA
	ldrh r0, [r4, 0x4]
	strh r0, [r6]
	ldrb r0, [r4]
	bl sub_8100A60
	movs r1, 0
	ldr r0, _08100EEC
	ldr r0, [r0, 0x4]
	ldrb r2, [r0]
	cmp r1, r2
	bcs _08100EDA
	ldr r5, [r0, 0x4]
	ldrh r4, [r6]
	adds r3, r2, 0
_08100EC2:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, r0, r5
	ldrh r0, [r2, 0x14]
	cmp r0, r4
	beq _08100E7C
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bcc _08100EC2
_08100EDA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08100EE0: .4byte gDecorations
_08100EE4: .4byte 0x0201f000
_08100EE8: .4byte gUnknown_020391B4
_08100EEC: .4byte gMapHeader
	thumb_func_end sub_8100A7C

	thumb_func_start sub_8100B20
sub_8100B20: @ 8100EF0
	push {r4-r6,lr}
	movs r2, 0
	ldr r0, _08100F1C
	ldr r0, [r0, 0x4]
	ldrb r1, [r0]
	cmp r2, r1
	bcs _08100F34
	adds r3, r0, 0
	ldr r5, [r3, 0x4]
	ldr r0, _08100F20
	ldrh r4, [r0]
	ldr r6, _08100F24
_08100F08:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r5
	ldrh r0, [r1, 0x14]
	cmp r0, r4
	bne _08100F28
	ldrb r0, [r1]
	strh r0, [r6]
	b _08100F34
	.align 2, 0
_08100F1C: .4byte gMapHeader
_08100F20: .4byte gSpecialVar_0x8004
_08100F24: .4byte gSpecialVar_0x8005
_08100F28:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r3]
	cmp r2, r0
	bcc _08100F08
_08100F34:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8100B20

	thumb_func_start sub_8100B6C
sub_8100B6C: @ 8100F3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r7, 0
	b _08101034
_08100F4C:
	lsls r3, r7, 3
	ldr r0, _08100FB0
	adds r4, r3, r0
	ldrb r1, [r4]
	ldr r2, _08100FB4
	ldr r0, [r2]
	adds r0, r1
	ldrb r6, [r0]
	lsls r0, r6, 5
	ldr r5, _08100FB8
	adds r0, r5
	ldrb r2, [r0, 0x11]
	ldr r5, _08100FB4
	ldr r0, [r5, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, 4
	mov r9, r1
	movs r5, 0xF
	mov r10, r5
	mov r1, r10
	ands r1, r0
	mov r10, r1
	adds r5, r3, 0
	adds r3, r7, 0x1
	str r3, [sp]
	cmp r2, 0x4
	beq _0810102E
	cmp r6, 0x29
	bne _08100FA0
	mov r0, r9
	adds r0, 0x7
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0xA3
	lsls r1, 2
	cmp r0, r1
	bne _08100FA0
	ldrb r0, [r4, 0x2]
	adds r0, 0x1
	strb r0, [r4, 0x2]
_08100FA0:
	movs r6, 0
	ldr r1, _08100FB0
	adds r2, r5, 0
	adds r0, r5, r1
	adds r3, r7, 0x1
	str r3, [sp]
	b _0810101E
	.align 2, 0
_08100FB0: .4byte gUnknown_020391B4
_08100FB4: .4byte 0x0201f000
_08100FB8: .4byte gDecorations
_08100FBC:
	movs r4, 0
	adds r0, r2, r1
	adds r7, r6, 0x1
	str r7, [sp, 0x4]
	ldrb r0, [r0, 0x1]
	cmp r4, r0
	bcs _08101012
	ldr r0, _0810104C
	adds r0, r5
	mov r8, r0
	subs r1, r6, 0x7
	str r1, [sp, 0x8]
_08100FD4:
	adds r0, r4, 0x7
	add r0, r9
	ldr r1, _08101050
	ldr r3, [r1]
	mov r7, r10
	subs r2, r7, r6
	ldr r1, [r3]
	muls r2, r1
	mov r7, r9
	adds r1, r7, r4
	adds r1, r2
	ldr r2, [r3, 0xC]
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	movs r3, 0xC0
	lsls r3, 6
	adds r2, r3, 0
	orrs r2, r1
	mov r7, r10
	ldr r3, [sp, 0x8]
	subs r1, r7, r3
	bl MapGridSetMetatileEntryAt
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	mov r7, r8
	ldrb r7, [r7, 0x1]
	cmp r4, r7
	bcc _08100FD4
_08101012:
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r1, _0810104C
	adds r2, r5, 0
	adds r0, r5, r1
_0810101E:
	ldrb r0, [r0, 0x2]
	cmp r6, r0
	bcc _08100FBC
	ldr r2, _0810104C
	adds r0, r5, r2
	ldrb r0, [r0]
	bl sub_8100A60
_0810102E:
	ldr r3, [sp]
	lsls r0, r3, 24
	lsrs r7, r0, 24
_08101034:
	ldr r0, _08101054
	ldrb r0, [r0]
	cmp r7, r0
	bcc _08100F4C
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810104C: .4byte gUnknown_020391B4
_08101050: .4byte gMapHeader
_08101054: .4byte gUnknown_02039234
	thumb_func_end sub_8100B6C

	thumb_func_start sub_8100C88
sub_8100C88: @ 8101058
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0810107C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08101094
	cmp r0, 0x1
	bgt _08101080
	cmp r0, 0
	beq _0810108A
	b _081010F4
	.align 2, 0
_0810107C: .4byte gTasks
_08101080:
	cmp r0, 0x2
	beq _081010C4
	cmp r0, 0x3
	beq _081010D8
	b _081010F4
_0810108A:
	bl sub_8100B6C
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _081010F4
_08101094:
	ldr r0, _081010BC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081010F4
	bl DrawWholeMapView
	ldr r0, _081010C0
	bl ScriptContext1_SetupScript
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x2
	strh r0, [r5, 0xC]
	b _081010F4
	.align 2, 0
_081010BC: .4byte gPaletteFade
_081010C0: .4byte gUnknown_081A2F8A
_081010C4:
	bl ScriptContext2_Enable
	adds r0, r4, 0
	bl sub_80FED90
	bl pal_fill_black
	movs r0, 0x3
	strh r0, [r5, 0xC]
	b _081010F4
_081010D8:
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081010F4
	ldr r0, _081010FC
	strh r0, [r5, 0x22]
	ldr r1, _08101100
	ldr r2, _08101104
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_081010F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081010FC: .4byte 0x0000ffff
_08101100: .4byte gSecretBaseText_DecorReturned
_08101104: .4byte sub_81010F0
	thumb_func_end sub_8100C88

	thumb_func_start sub_8100D38
sub_8100D38: @ 8101108
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _08101138
	adds r4, r0, 0
	ldrb r0, [r4, 0x8]
	cmp r2, r0
	bcs _0810114C
	adds r5, r4, 0
	ldr r1, _0810113C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r1
_08101126:
	ldr r0, [r5]
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08101140
	strh r2, [r1, 0x22]
	movs r0, 0x1
	b _0810114E
	.align 2, 0
_08101138: .4byte 0x0201f000
_0810113C: .4byte gTasks
_08101140:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r0, [r4, 0x8]
	cmp r2, r0
	bcc _08101126
_0810114C:
	movs r0, 0
_0810114E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8100D38

	thumb_func_start SetUpPuttingAwayDecorationPlayerAvatar
SetUpPuttingAwayDecorationPlayerAvatar: @ 8101154
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	bl player_get_direction_lower_nybble
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r3, _081011A8
	ldr r2, _081011AC
	ldr r4, _081011B0
	ldr r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strb r0, [r3]
	bl sub_81016C8
	ldr r0, _081011B4
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [r4, 0x4]
	ldr r0, _081011B8
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _081011C0
	ldr r1, _081011BC
	str r0, [sp]
	movs r0, 0xC1
	b _081011C8
	.align 2, 0
_081011A8: .4byte gUnknown_020391A8
_081011AC: .4byte gSprites
_081011B0: .4byte gUnknown_03004880
_081011B4: .4byte gSpriteTemplate_83ECA88
_081011B8: .4byte gSaveBlock2
_081011BC: .4byte SpriteCallbackDummy
_081011C0:
	ldr r1, _0810122C
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC2
_081011C8:
	movs r2, 0x88
	movs r3, 0x48
	bl AddPseudoFieldObject
	ldr r1, _08101230
	strb r0, [r1]
	ldr r6, _08101234
	ldr r0, _08101230
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x4
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r5, _08101238
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r0, _0810123C
	ldr r0, [r0, 0x4]
	strb r0, [r5]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	ands r4, r1
	mov r1, r8
	orrs r4, r1
	strb r4, [r0, 0x5]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810122C: .4byte SpriteCallbackDummy
_08101230: .4byte gUnknown_020391A9
_08101234: .4byte gSprites
_08101238: .4byte gUnknown_020391A8
_0810123C: .4byte gUnknown_03004880
	thumb_func_end SetUpPuttingAwayDecorationPlayerAvatar

	thumb_func_start sub_8100E70
sub_8100E70: @ 8101240
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08101264
	adds r4, r0, r1
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08101294
	cmp r0, 0x1
	bgt _08101268
	cmp r0, 0
	beq _0810126E
	b _081012B6
	.align 2, 0
_08101264: .4byte 0x03004b38
_08101268:
	cmp r0, 0x2
	beq _081012A2
	b _081012B6
_0810126E:
	ldr r0, _08101290
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081012B6
	adds r0, r5, 0
	bl sub_80FF0E0
	movs r0, 0x1
	strh r0, [r4, 0x4]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xA]
	bl sub_8072DEC
	b _081012B6
	.align 2, 0
_08101290: .4byte gPaletteFade
_08101294:
	bl SetUpPuttingAwayDecorationPlayerAvatar
	bl pal_fill_black
	movs r0, 0x2
	strh r0, [r4, 0x4]
	b _081012B6
_081012A2:
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081012B6
	strh r0, [r4, 0x18]
	adds r0, r5, 0
	bl sub_8100EEC
_081012B6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8100E70

	thumb_func_start sub_8100EEC
sub_8100EEC: @ 81012BC
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r4, _08101340
	ldr r3, _08101344
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0
	strh r6, [r0, 0x3C]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08101348
	str r1, [r0]
	ldr r2, _0810134C
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x88
	strh r1, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x48
	strh r1, [r0, 0x22]
	ldr r1, _08101350
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x1C]
	ldr r1, _08101354
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101340: .4byte gSprites
_08101344: .4byte gUnknown_020391A8
_08101348: .4byte sub_8101698
_0810134C: .4byte gUnknown_020391A9
_08101350: .4byte gTasks
_08101354: .4byte sub_8100494
	thumb_func_end sub_8100EEC

	thumb_func_start sub_8100F88
sub_8100F88: @ 8101358
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08101380
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	bl sub_810045C
	adds r0, r4, 0
	bl sub_8101024
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101380: .4byte gTasks
	thumb_func_end sub_8100F88

	thumb_func_start sub_8100FB4
sub_8100FB4: @ 8101384
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _081013DC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	bl sub_810045C
	ldr r3, _081013E0
	ldr r5, _081013E4
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _081013E8
	str r1, [r0]
	ldr r1, _081013EC
	ldr r2, _081013F0
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081013DC: .4byte gTasks
_081013E0: .4byte gSprites
_081013E4: .4byte gUnknown_020391A8
_081013E8: .4byte SpriteCallbackDummy
_081013EC: .4byte gSecretBaseText_StopPuttingAwayDecor
_081013F0: .4byte sub_810156C
	thumb_func_end sub_8100FB4

	thumb_func_start sub_8101024
sub_8101024: @ 81013F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8101460
	ldr r0, _08101410
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810141C
	ldr r1, _08101414
	ldr r2, _08101418
	b _08101480
	.align 2, 0
_08101410: .4byte gUnknown_02039234
_08101414: .4byte gSecretBaseText_ReturnDecor
_08101418: .4byte sub_8101518
_0810141C:
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	ldr r0, _0810148C
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057238
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08101452
	adds r0, r4, 0
	bl sub_805738C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081014A4
_08101452:
	ldr r3, _08101490
	ldr r4, _08101494
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _08101498
	str r1, [r0]
	ldr r1, _0810149C
	ldr r2, _081014A0
_08101480:
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _081014B0
	.align 2, 0
_0810148C: .4byte 0x03004b38
_08101490: .4byte gSprites
_08101494: .4byte gUnknown_020391A8
_08101498: .4byte SpriteCallbackDummy
_0810149C: .4byte gSecretBaseText_StopPuttingAwayDecor
_081014A0: .4byte sub_810156C
_081014A4:
	ldr r1, _081014B8
	ldr r2, _081014BC
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_081014B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081014B8: .4byte gSecretBaseText_NoDecor
_081014BC: .4byte sub_81010F0
	thumb_func_end sub_8101024

	thumb_func_start sub_81010F0
sub_81010F0: @ 81014C0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081014E4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081014DA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081014E0
_081014DA:
	adds r0, r2, 0
	bl sub_8100EEC
_081014E0:
	pop {r0}
	bx r0
	.align 2, 0
_081014E4: .4byte gMain
	thumb_func_end sub_81010F0

	thumb_func_start sub_8101118
sub_8101118: @ 81014E8
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	ldr r1, _08101500
	lsrs r0, 19
	adds r0, r1
	ldrb r1, [r0, 0x12]
	cmp r1, 0
	bne _08101504
	movs r0, 0x1
	strb r0, [r2, 0x1]
	b _08101562
	.align 2, 0
_08101500: .4byte gDecorations
_08101504:
	cmp r1, 0x1
	bne _08101510
	movs r0, 0x2
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	b _08101564
_08101510:
	cmp r1, 0x2
	bne _0810151C
	movs r0, 0x3
	strb r0, [r2, 0x1]
	movs r0, 0x1
	b _08101562
_0810151C:
	cmp r1, 0x3
	bne _08101524
	movs r0, 0x4
	b _0810155E
_08101524:
	cmp r1, 0x4
	bne _0810152E
	movs r0, 0x2
	strb r0, [r2, 0x1]
	b _08101562
_0810152E:
	cmp r1, 0x5
	bne _08101536
	movs r0, 0x1
	b _0810155E
_08101536:
	cmp r1, 0x6
	bne _08101542
	movs r0, 0x1
	strb r0, [r2, 0x1]
	movs r0, 0x3
	b _08101562
_08101542:
	cmp r1, 0x7
	bne _0810154E
	movs r0, 0x2
	strb r0, [r2, 0x1]
	movs r0, 0x4
	b _08101562
_0810154E:
	cmp r1, 0x8
	bne _08101558
	movs r0, 0x3
	strb r0, [r2, 0x1]
	b _08101562
_08101558:
	cmp r1, 0x9
	bne _08101564
	movs r0, 0x3
_0810155E:
	strb r0, [r2, 0x1]
	movs r0, 0x2
_08101562:
	strb r0, [r2, 0x2]
_08101564:
	pop {r0}
	bx r0
	thumb_func_end sub_8101118

	thumb_func_start sub_8101198
sub_8101198: @ 8101568
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	ldr r5, _081015C0
	ldr r6, _081015C4
	ldrb r3, [r6]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	adds r2, 0x3E
	ldrb r3, [r2]
	movs r4, 0x4
	orrs r3, r4
	strb r3, [r2]
	ldrb r3, [r6]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r3, r5, 0
	adds r3, 0x1C
	adds r2, r3
	ldr r3, _081015C8
	str r3, [r2]
	ldr r4, _081015CC
	ldrb r3, [r4]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	lsrs r0, 20
	adds r0, 0x88
	strh r0, [r2, 0x20]
	ldrb r2, [r4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	lsrs r1, 20
	adds r1, 0x48
	strh r1, [r0, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081015C0: .4byte gSprites
_081015C4: .4byte gUnknown_020391A8
_081015C8: .4byte SpriteCallbackDummy
_081015CC: .4byte gUnknown_020391A9
	thumb_func_end sub_8101198

	thumb_func_start sub_8101200
sub_8101200: @ 81015D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0810165C
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r0, [r2, 0x8]
	subs r0, 0x7
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r2, 0xA]
	subs r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _08101660
	ldr r0, [r2, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r4, r0, 4
	movs r5, 0xF
	ands r5, r0
	ldr r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _0810162A
	adds r0, r4, 0x7
	adds r1, r5, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0xA3
	lsls r1, 2
	cmp r0, r1
	bne _0810162A
	ldrb r0, [r6, 0x2]
	subs r0, 0x1
	strb r0, [r6, 0x2]
_0810162A:
	cmp r7, r4
	bcc _08101664
	ldrb r1, [r6, 0x1]
	adds r0, r4, r1
	cmp r7, r0
	bge _08101664
	ldrb r0, [r6, 0x2]
	subs r0, r5, r0
	cmp r8, r0
	ble _08101664
	cmp r8, r5
	bhi _08101664
	subs r0, r7, r4
	adds r0, 0x1
	subs r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	mov r2, r8
	subs r1, r5, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_8101198
	movs r0, 0x1
	b _08101666
	.align 2, 0
_0810165C: .4byte gTasks
_08101660: .4byte 0x0201f000
_08101664:
	movs r0, 0
_08101666:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8101200

	thumb_func_start sub_81012A0
sub_81012A0: @ 8101670
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _081016DC
	ldr r3, _081016E0
	ldr r0, _081016E4
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r3
	ldrb r1, [r0]
	ldr r0, [r2, 0x4]
	adds r0, r1
	ldrb r0, [r0]
	lsrs r7, r0, 4
	movs r6, 0xF
	ands r6, r0
	movs r5, 0
	ldr r0, _081016E8
	mov r8, r0
	mov r9, r3
_0810169A:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldr r2, _081016EC
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, r7
	bne _081016F8
	ldr r2, _081016F0
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, r6
	bne _081016F8
	ldr r0, _081016F4
	adds r4, r1, r0
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081016F8
	ldr r0, _081016E4
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r9
	ldrh r1, [r4]
	strh r1, [r0, 0x4]
	b _08101702
	.align 2, 0
_081016DC: .4byte 0x0201f000
_081016E0: .4byte gUnknown_020391B4
_081016E4: .4byte gUnknown_02039234
_081016E8: .4byte gSaveBlock1
_081016EC: .4byte 0x00000c24
_081016F0: .4byte 0x00000c26
_081016F4: .4byte 0x00000c34
_081016F8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3F
	bls _0810169A
_08101702:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81012A0

	thumb_func_start sub_8101340
sub_8101340: @ 8101710
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	b _08101772
_0810171A:
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810176C
	ldr r0, _08101760
	ldrb r2, [r1]
	lsls r1, r2, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	bne _0810176C
	ldr r5, _08101764
	adds r0, r2, 0
	adds r1, r5, 0
	bl sub_8101118
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r7, 0
	adds r2, r5, 0
	bl sub_8101200
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _0810176C
	strb r6, [r5]
	bl sub_81012A0
	ldr r0, _08101768
	strb r4, [r0]
	movs r0, 0x1
	b _0810177C
	.align 2, 0
_08101760: .4byte gDecorations
_08101764: .4byte gUnknown_020391B4
_08101768: .4byte gUnknown_02039234
_0810176C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08101772:
	ldr r0, _08101784
	ldrb r1, [r0, 0x8]
	cmp r6, r1
	bcc _0810171A
	movs r0, 0
_0810177C:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08101784: .4byte 0x0201f000
	thumb_func_end sub_8101340

	thumb_func_start sub_81013B8
sub_81013B8: @ 8101788
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r4, 0
	ldr r7, _08101820
	ldrb r0, [r7, 0x8]
	cmp r4, r0
	bcs _0810180E
	adds r6, r7, 0
	ldr r5, _08101824
_081017BA:
	ldr r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	ldr r0, [r6, 0x4]
	adds r0, r4
	ldrb r0, [r0]
	lsrs r3, r0, 4
	movs r2, 0xF
	ands r2, r0
	cmp r1, 0
	beq _08101802
	ldr r0, _08101828
	lsls r1, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	bne _08101802
	ldr r0, [sp]
	cmp r0, r3
	bhi _08101802
	cmp r10, r2
	bhi _08101802
	cmp r9, r3
	bcc _08101802
	cmp r8, r2
	bcc _08101802
	ldr r0, _0810182C
	ldrb r1, [r5]
	lsls r1, 3
	adds r1, r0
	strb r4, [r1]
	bl sub_81012A0
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_08101802:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r7, 0x8]
	cmp r4, r0
	bcc _081017BA
_0810180E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101820: .4byte 0x0201f000
_08101824: .4byte gUnknown_02039234
_08101828: .4byte gDecorations
_0810182C: .4byte gUnknown_020391B4
	thumb_func_end sub_81013B8

	thumb_func_start sub_8101460
sub_8101460: @ 8101830
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _08101888
	movs r0, 0
	strb r0, [r4]
	adds r0, r6, 0
	bl sub_8101340
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081018D4
	movs r5, 0
	ldr r0, _0810188C
	ldrb r1, [r0, 0x8]
	cmp r5, r1
	bcs _081018A2
	adds r7, r4, 0
_08101856:
	ldr r0, [r0]
	adds r0, r5
	ldrb r1, [r0]
	cmp r1, 0
	beq _08101894
	ldr r4, _08101890
	adds r0, r1, 0
	adds r1, r4, 0
	bl sub_8101118
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8101200
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101894
	strb r5, [r4]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _081018A2
	.align 2, 0
_08101888: .4byte gUnknown_02039234
_0810188C: .4byte 0x0201f000
_08101890: .4byte gUnknown_020391B4
_08101894:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081018DC
	ldrb r1, [r0, 0x8]
	cmp r5, r1
	bcc _08101856
_081018A2:
	ldr r0, _081018E0
	ldrb r0, [r0]
	cmp r0, 0
	beq _081018D4
	ldr r0, _081018DC
	ldr r2, _081018E4
	ldrb r1, [r2]
	ldr r0, [r0, 0x4]
	adds r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, 4
	movs r3, 0xF
	ands r3, r1
	ldrb r1, [r2, 0x2]
	subs r1, r3, r1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r2, 0x1]
	adds r2, r0
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	bl sub_81013B8
_081018D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081018DC: .4byte 0x0201f000
_081018E0: .4byte gUnknown_02039234
_081018E4: .4byte gUnknown_020391B4
	thumb_func_end sub_8101460

	thumb_func_start sub_8101518
sub_8101518: @ 81018E8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08101908
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101908: .4byte gUnknown_083EC9CC
	thumb_func_end sub_8101518

	thumb_func_start sub_810153C
sub_810153C: @ 810190C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08101934
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _08101938
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101934: .4byte gTasks
_08101938: .4byte sub_8100C88
	thumb_func_end sub_810153C

	thumb_func_start sub_810156C
sub_810156C: @ 810193C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810195C
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810195C: .4byte gUnknown_083EC9D4
	thumb_func_end sub_810156C

	thumb_func_start sub_8101590
sub_8101590: @ 8101960
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_81015B0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101590

	thumb_func_start sub_81015B0
sub_81015B0: @ 8101980
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _081019A8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	ldr r1, _081019AC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081019A8: .4byte gTasks
_081019AC: .4byte sub_81015E0
	thumb_func_end sub_81015B0

	thumb_func_start sub_81015E0
sub_81015E0: @ 81019B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _081019D0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081019D4
	cmp r0, 0x1
	beq _081019F0
	b _08101A06
	.align 2, 0
_081019D0: .4byte gTasks
_081019D4:
	ldr r0, _081019EC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08101A06
	adds r0, r4, 0
	bl sub_80FF114
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _08101A06
	.align 2, 0
_081019EC: .4byte gPaletteFade
_081019F0:
	bl sub_81016F4
	ldr r0, _08101A0C
	ldr r1, _08101A10
	str r1, [r0]
	ldr r0, _08101A14
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08101A06:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101A0C: .4byte gUnknown_0300485C
_08101A10: .4byte sub_8101678
_08101A14: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_81015E0

	thumb_func_start sub_8101648
sub_8101648: @ 8101A18
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101A38
	ldr r0, _08101A40
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08101A44
	str r0, [r1]
_08101A38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101A40: .4byte gTasks
_08101A44: .4byte Task_DecorationPCProcessMenuInput
	thumb_func_end sub_8101648

	thumb_func_start sub_8101678
sub_8101678: @ 8101A48
	push {lr}
	bl pal_fill_black
	bl MenuDisplayMessageBox
	bl sub_80FE220
	ldr r0, _08101A64
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08101A64: .4byte sub_8101648
	thumb_func_end sub_8101678

	thumb_func_start sub_8101698
sub_8101698: @ 8101A68
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0xF
	ble _08101A88
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08101A94
_08101A88:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08101A94:
	pop {r0}
	bx r0
	thumb_func_end sub_8101698

	thumb_func_start sub_81016C8
sub_81016C8: @ 8101A98
	push {lr}
	ldr r0, _08101AAC
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08101AB4
	ldr r0, _08101AB0
	bl LoadSpritePalette
	b _08101ABA
	.align 2, 0
_08101AAC: .4byte gSaveBlock2
_08101AB0: .4byte gUnknown_083ECA5C
_08101AB4:
	ldr r0, _08101AC0
	bl LoadSpritePalette
_08101ABA:
	pop {r0}
	bx r0
	.align 2, 0
_08101AC0: .4byte gUnknown_083ECA64
	thumb_func_end sub_81016C8

	thumb_func_start sub_81016F4
sub_81016F4: @ 8101AC4
	push {lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end sub_81016F4

	thumb_func_start sub_8101700
sub_8101700: @ 8101AD0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _08101AF8
	ldr r1, _08101AF0
	ldr r2, _08101AF4
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101B12
	.align 2, 0
_08101AF0: .4byte gSecretBaseText_NoDecors
_08101AF4: .4byte sub_80FE428
_08101AF8:
	ldr r1, _08101B18
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x1E]
	ldr r0, _08101B1C
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_08101B12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101B18: .4byte gTasks
_08101B1C: .4byte gUnknown_020388F6
	thumb_func_end sub_8101700

	thumb_func_start unref_sub_8101750
unref_sub_8101750: @ 8101B20
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_81341D4
	lsls r0, 24
	cmp r0, 0
	bne _08101B48
	ldr r1, _08101B40
	ldr r2, _08101B44
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101B62
	.align 2, 0
_08101B40: .4byte gSecretBaseText_NoDecors
_08101B44: .4byte sub_80FE428
_08101B48:
	ldr r1, _08101B68
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x2
	strh r1, [r0, 0x1E]
	ldr r0, _08101B6C
	strb r2, [r0]
	adds r0, r4, 0
	bl sub_80FE5AC
_08101B62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101B68: .4byte gTasks
_08101B6C: .4byte gUnknown_020388F6
	thumb_func_end unref_sub_8101750

	thumb_func_start sub_81017A0
sub_81017A0: @ 8101B70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80FEF74
	bl sub_80FED1C
	bl sub_80FEFA4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08101BD8
	ldr r0, _08101BBC
	ldr r1, _08101BC0
	ldrb r2, [r1]
	ldr r1, _08101BC4
	ldr r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 5
	ldr r2, _08101BC8
	adds r1, r2
	bl StringCopy
	ldr r4, _08101BCC
	ldr r1, _08101BD0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _08101BD4
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _08101BE4
	.align 2, 0
_08101BBC: .4byte gStringVar1
_08101BC0: .4byte gUnknown_020388F5
_08101BC4: .4byte gUnknown_020388D0
_08101BC8: .4byte 0x083f7bf1
_08101BCC: .4byte gStringVar4
_08101BD0: .4byte gSecretBaseText_WillBeDiscarded
_08101BD4: .4byte sub_8101824
_08101BD8:
	ldr r1, _08101BEC
	ldr r2, _08101BF0
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_08101BE4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101BEC: .4byte gSecretBaseText_DecorInUse
_08101BF0: .4byte sub_80FEFF4
	thumb_func_end sub_81017A0

	thumb_func_start sub_8101824
sub_8101824: @ 8101BF4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08101C14
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101C14: .4byte gUnknown_083ECAA0
	thumb_func_end sub_8101824

	thumb_func_start sub_8101848
sub_8101848: @ 8101C18
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xE
	bl MenuZeroFillWindowRect
	ldr r6, _08101C60
	ldrb r1, [r6]
	ldr r5, _08101C64
	ldr r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8109A30
	ldrb r1, [r6]
	ldr r0, [r5]
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	adds r0, r4, 0
	bl sub_80FF098
	ldr r1, _08101C68
	ldr r2, _08101C6C
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08101C60: .4byte gUnknown_020388F5
_08101C64: .4byte gUnknown_020388D0
_08101C68: .4byte gSecretBaseText_DecorThrownAway
_08101C6C: .4byte sub_80FEFF4
	thumb_func_end sub_8101848

	.align 2, 0 @ Don't pad with nop.
