	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start InitFieldMessageBox
InitFieldMessageBox: @ 8064A74
	push {lr}
	ldr r1, _08064A90 @ =0x030005a8
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08064A94 @ =gMenuTextWindowContentTileOffset
	ldrh r0, [r0]
	bl SetMessageBoxBaseTileNum
	ldr r0, _08064A98 @ =gFieldMessageBoxWindow
	ldr r1, _08064A9C @ =gWindowConfig_81E6CE4
	bl InitWindowFromConfig
	pop {r0}
	bx r0
	.align 2, 0
_08064A90: .4byte 0x030005a8
_08064A94: .4byte gMenuTextWindowContentTileOffset
_08064A98: .4byte gFieldMessageBoxWindow
_08064A9C: .4byte gWindowConfig_81E6CE4
	thumb_func_end InitFieldMessageBox

	thumb_func_start Task_FieldMessageBox
Task_FieldMessageBox: @ 8064DE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08064E04 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08064E1C
	cmp r0, 0x1
	bgt _08064E08
	cmp r0, 0
	beq _08064E0E
	b _08064E68
	.align 2, 0
_08064E04: .4byte gTasks
_08064E08:
	cmp r0, 0x2
	beq _08064E30
	b _08064E68
_08064E0E:
	ldr r0, _08064E18 @ =gFieldMessageBoxWindow
	bl LoadMessageBoxTiles
	b _08064E22
	.align 2, 0
_08064E18: .4byte gFieldMessageBoxWindow
_08064E1C:
	ldr r0, _08064E2C @ =gFieldMessageBoxWindow
	bl DrawStandardMessageBox
_08064E22:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08064E68
	.align 2, 0
_08064E2C: .4byte gFieldMessageBoxWindow
_08064E30:
	ldr r0, _08064E40 @ =0x030005a8
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08064E44
	cmp r0, 0x3
	beq _08064E50
	b _08064E5C
	.align 2, 0
_08064E40: .4byte 0x030005a8
_08064E44:
	ldr r0, _08064E4C @ =gFieldMessageBoxWindow
	bl sub_80035AC
	b _08064E56
	.align 2, 0
_08064E4C: .4byte gFieldMessageBoxWindow
_08064E50:
	ldr r0, _08064E70 @ =gFieldMessageBoxWindow
	bl sub_8003778
_08064E56:
	lsls r0, 24
	cmp r0, 0
	beq _08064E68
_08064E5C:
	ldr r1, _08064E74 @ =0x030005a8
	movs r0, 0
	strb r0, [r1]
	adds r0, r5, 0
	bl DestroyTask
_08064E68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064E70: .4byte gFieldMessageBoxWindow
_08064E74: .4byte 0x030005a8
	thumb_func_end Task_FieldMessageBox

	thumb_func_start CreateFieldMessageBoxTask
CreateFieldMessageBoxTask: @ 8064E78
	push {lr}
	ldr r0, _08064E88 @ =Task_FieldMessageBox
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08064E88: .4byte Task_FieldMessageBox
	thumb_func_end CreateFieldMessageBoxTask

	thumb_func_start DestroyFieldMessageBoxTask
DestroyFieldMessageBoxTask: @ 8064E8C
	push {lr}
	ldr r0, _08064EA4 @ =Task_FieldMessageBox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08064EA0
	bl DestroyTask
_08064EA0:
	pop {r0}
	bx r0
	.align 2, 0
_08064EA4: .4byte Task_FieldMessageBox
	thumb_func_end DestroyFieldMessageBoxTask

	thumb_func_start ShowFieldMessage
ShowFieldMessage: @ 8064B68
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08064B84 @ =0x030005a8
	ldrb r0, [r4]
	cmp r0, 0
	bne _08064B88
	adds r0, r1, 0
	bl PrintFieldMessage
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0x1
	b _08064B8A
	.align 2, 0
_08064B84: .4byte 0x030005a8
_08064B88:
	movs r0, 0
_08064B8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ShowFieldMessage

	thumb_func_start ShowFieldAutoScrollMessage
ShowFieldAutoScrollMessage: @ 8064B90
	push {lr}
	adds r1, r0, 0
	ldr r2, _08064BAC @ =0x030005a8
	ldrb r0, [r2]
	cmp r0, 0
	bne _08064BB0
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r1, 0
	bl PrintFieldMessage
	movs r0, 0x1
	b _08064BB2
	.align 2, 0
_08064BAC: .4byte 0x030005a8
_08064BB0:
	movs r0, 0
_08064BB2:
	pop {r1}
	bx r1
	thumb_func_end ShowFieldAutoScrollMessage

	thumb_func_start unref_sub_8064BB8
unref_sub_8064BB8: @ 8064BB8
	push {lr}
	ldr r2, _08064BCC @ =0x030005a8
	movs r1, 0x3
	strb r1, [r2]
	bl PrintFieldMessage
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08064BCC: .4byte 0x030005a8
	thumb_func_end unref_sub_8064BB8

	thumb_func_start unref_sub_8064BD0
unref_sub_8064BD0: @ 8064BD0
	push {lr}
	ldr r1, _08064BE8 @ =0x030005a8
	ldrb r0, [r1]
	cmp r0, 0
	bne _08064BEC
	movs r0, 0x2
	strb r0, [r1]
	bl PrintFieldMessageFromStringVar4
	movs r0, 0x1
	b _08064BEE
	.align 2, 0
_08064BE8: .4byte 0x030005a8
_08064BEC:
	movs r0, 0
_08064BEE:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8064BD0

	thumb_func_start PrintFieldMessage
PrintFieldMessage: @ 8064F34
	push {r4,lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r4, _08064F60 @ =gStringVar4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08064F64 @ =gFieldMessageBoxWindow
	ldr r1, _08064F68 @ =gMenuTextTileOffset
	ldrh r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	bl CreateFieldMessageBoxTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064F60: .4byte gStringVar4
_08064F64: .4byte gFieldMessageBoxWindow
_08064F68: .4byte gMenuTextTileOffset
	thumb_func_end PrintFieldMessage

	thumb_func_start PrintFieldMessageFromStringVar4
PrintFieldMessageFromStringVar4: @ 8064F6C
	push {lr}
	sub sp, 0x4
	ldr r0, _08064F8C @ =gFieldMessageBoxWindow
	ldr r1, _08064F90 @ =gStringVar4
	ldr r2, _08064F94 @ =gMenuTextTileOffset
	ldrh r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	bl CreateFieldMessageBoxTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08064F8C: .4byte gFieldMessageBoxWindow
_08064F90: .4byte gStringVar4
_08064F94: .4byte gMenuTextTileOffset
	thumb_func_end PrintFieldMessageFromStringVar4

	thumb_func_start HideFieldMessageBox
HideFieldMessageBox: @ 8064C58
	push {lr}
	bl DestroyFieldMessageBoxTask
	ldr r0, _08064C70 @ =gFieldMessageBoxWindow
	bl ClearStandardMessageBox
	ldr r1, _08064C74 @ =0x030005a8
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08064C70: .4byte gFieldMessageBoxWindow
_08064C74: .4byte 0x030005a8
	thumb_func_end HideFieldMessageBox

	thumb_func_start GetFieldMessageBoxMode
GetFieldMessageBoxMode: @ 8064C78
	ldr r0, _08064C80 @ =0x030005a8
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08064C80: .4byte 0x030005a8
	thumb_func_end GetFieldMessageBoxMode

	thumb_func_start IsFieldMessageBoxHidden
IsFieldMessageBoxHidden: @ 8064C84
	push {lr}
	ldr r0, _08064C94 @ =0x030005a8
	ldrb r0, [r0]
	cmp r0, 0
	beq _08064C98
	movs r0, 0
	b _08064C9A
	.align 2, 0
_08064C94: .4byte 0x030005a8
_08064C98:
	movs r0, 0x1
_08064C9A:
	pop {r1}
	bx r1
	thumb_func_end IsFieldMessageBoxHidden

	thumb_func_start unref_sub_8064CA0
unref_sub_8064CA0: @ 8064CA0
	push {lr}
	bl DestroyFieldMessageBoxTask
	ldr r0, _08064CB8 @ =gFieldMessageBoxWindow
	bl DrawStandardMessageBox
	ldr r1, _08064CBC @ =0x030005a8
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08064CB8: .4byte gFieldMessageBoxWindow
_08064CBC: .4byte 0x030005a8
	thumb_func_end unref_sub_8064CA0

	.align 2, 0 @ Don't pad with nop.
