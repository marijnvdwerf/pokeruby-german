	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8071C20
sub_8071C20: @ 8071C20
	push {lr}
	movs r0, 0x5
	bl PlaySE
	bl MenuZeroFillScreen
	bl sub_8064E2C
	bl ScriptContext2_Disable
	bl sub_8072DEC
	pop {r0}
	bx r0
	thumb_func_end sub_8071C20

	thumb_func_start AppendToList
AppendToList: @ 8071C3C
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bx lr
	thumb_func_end AppendToList

	thumb_func_start InitMenuWindow
InitMenuWindow: @ 8071C4C
	push {lr}
	movs r1, 0x1
	bl InitMenuWindowInternal
	pop {r0}
	bx r0
	thumb_func_end InitMenuWindow

	thumb_func_start MultistepInitMenuWindowBegin
MultistepInitMenuWindowBegin: @ 8071C58
	push {lr}
	movs r1, 0x1
	bl MultistepInitMenuWindowInternal
	pop {r0}
	bx r0
	thumb_func_end MultistepInitMenuWindowBegin

	thumb_func_start MultistepInitMenuWindowInternal
MultistepInitMenuWindowInternal: @ 8071F80
	push {lr}
	adds r3, r0, 0
	ldr r2, _08071FA0 @ =gMenuMultistepInitState
	movs r0, 0
	strb r0, [r2]
	ldr r0, _08071FA4 @ =gMenuTextTileOffset
	strh r1, [r0]
	ldr r1, _08071FA8 @ =gMenuWindowPtr
	ldr r0, _08071FAC @ =gMenuWindow
	str r0, [r1]
	adds r1, r3, 0
	bl InitWindowFromConfig
	pop {r0}
	bx r0
	.align 2, 0
_08071FA0: .4byte gMenuMultistepInitState
_08071FA4: .4byte gMenuTextTileOffset
_08071FA8: .4byte gMenuWindowPtr
_08071FAC: .4byte gMenuWindow
	thumb_func_end MultistepInitMenuWindowInternal

	thumb_func_start MultistepInitMenuWindowContinue
MultistepInitMenuWindowContinue: @ 8071C94
	push {r4,lr}
	ldr r0, _08071CAC @ =gMenuMultistepInitState
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _08071D40
	lsls r0, r1, 2
	ldr r1, _08071CB0 @ =_08071FD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071CAC: .4byte gMenuMultistepInitState
_08071CB0: .4byte _08071FD0
	.align 2, 0
_08071CB4:
	.4byte _08071CC8
	.4byte _08071CD0
	.4byte _08071CF0
	.4byte _08071CFA
	.4byte _08071D1C
_08071CC8:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _08071D40
_08071CD0:
	ldr r4, _08071CE4 @ =gMenuTextWindowTileOffset
	ldr r0, _08071CE8 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08071CEC @ =gMenuTextTileOffset
	ldrh r1, [r1]
	bl MultistepInitWindowTileData
	strh r0, [r4]
	b _08071D06
	.align 2, 0
_08071CE4: .4byte gMenuTextWindowTileOffset
_08071CE8: .4byte gMenuWindowPtr
_08071CEC: .4byte gMenuTextTileOffset
_08071CF0:
	bl MultistepLoadFont
	cmp r0, 0
	beq _08071D40
	b _08071D06
_08071CFA:
	ldr r0, _08071D10 @ =gMenuTextWindowTileOffset
	ldrh r0, [r0]
	bl SetTextWindowBaseTileNum
	ldr r1, _08071D14 @ =gMenuTextWindowContentTileOffset
	strh r0, [r1]
_08071D06:
	ldr r1, _08071D18 @ =gMenuMultistepInitState
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08071D40
	.align 2, 0
_08071D10: .4byte gMenuTextWindowTileOffset
_08071D14: .4byte gMenuTextWindowContentTileOffset
_08071D18: .4byte gMenuMultistepInitState
_08071D1C:
	ldr r0, _08071D34 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl LoadTextWindowGraphics
	ldr r0, _08071D38 @ =gMenuTextWindowContentTileOffset
	ldrh r0, [r0]
	bl SetMessageBoxBaseTileNum
	ldr r1, _08071D3C @ =gMenuMessageBoxContentTileOffset
	strh r0, [r1]
	movs r0, 0x1
	b _08071D42
	.align 2, 0
_08071D34: .4byte gMenuWindowPtr
_08071D38: .4byte gMenuTextWindowContentTileOffset
_08071D3C: .4byte gMenuMessageBoxContentTileOffset
_08071D40:
	movs r0, 0
_08071D42:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MultistepInitMenuWindowContinue

	thumb_func_start InitMenuWindowInternal
InitMenuWindowInternal: @ 8072064
	push {r4,r5,lr}
	adds r2, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r5, _080720A8 @ =gMenuWindowPtr
	ldr r0, _080720AC @ =gMenuWindow
	str r0, [r5]
	adds r1, r2, 0
	bl InitWindowFromConfig
	ldr r1, _080720B0 @ =gMenuTextTileOffset
	strh r4, [r1]
	ldr r0, [r5]
	ldrh r1, [r1]
	bl InitWindowTileData
	ldr r1, _080720B4 @ =gMenuTextWindowTileOffset
	strh r0, [r1]
	ldrh r0, [r1]
	bl SetTextWindowBaseTileNum
	ldr r4, _080720B8 @ =gMenuTextWindowContentTileOffset
	strh r0, [r4]
	ldr r0, [r5]
	bl LoadTextWindowGraphics
	ldrh r0, [r4]
	bl SetMessageBoxBaseTileNum
	ldr r1, _080720BC @ =gMenuMessageBoxContentTileOffset
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080720A8: .4byte gMenuWindowPtr
_080720AC: .4byte gMenuWindow
_080720B0: .4byte gMenuTextTileOffset
_080720B4: .4byte gMenuTextWindowTileOffset
_080720B8: .4byte gMenuTextWindowContentTileOffset
_080720BC: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end InitMenuWindowInternal

	thumb_func_start unref_sub_8071DA4
unref_sub_8071DA4: @ 8071DA4
	push {r4,r5,lr}
	adds r2, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r5, _08071DE8 @ =gMenuWindowPtr
	ldr r0, _08071DEC @ =gMenuWindow
	str r0, [r5]
	adds r1, r2, 0
	bl InitWindowFromConfig
	ldr r0, _08071DF0 @ =gMenuTextWindowTileOffset
	strh r4, [r0]
	ldrh r0, [r0]
	bl SetTextWindowBaseTileNum
	ldr r4, _08071DF4 @ =gMenuTextWindowContentTileOffset
	strh r0, [r4]
	ldr r0, [r5]
	bl LoadTextWindowGraphics
	ldrh r0, [r4]
	bl SetMessageBoxBaseTileNum
	ldr r1, _08071DF8 @ =gMenuTextTileOffset
	strh r0, [r1]
	ldr r0, [r5]
	ldrh r1, [r1]
	bl InitWindowTileData
	ldr r1, _08071DFC @ =gMenuMessageBoxContentTileOffset
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071DE8: .4byte gMenuWindowPtr
_08071DEC: .4byte gMenuWindow
_08071DF0: .4byte gMenuTextWindowTileOffset
_08071DF4: .4byte gMenuTextWindowContentTileOffset
_08071DF8: .4byte gMenuTextTileOffset
_08071DFC: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end unref_sub_8071DA4

	thumb_func_start MenuLoadTextWindowGraphics_OverrideFrameType
MenuLoadTextWindowGraphics_OverrideFrameType: @ 8071E00
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08071E14 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl LoadTextWindowGraphics_OverrideFrameType
	pop {r0}
	bx r0
	.align 2, 0
_08071E14: .4byte gMenuWindowPtr
	thumb_func_end MenuLoadTextWindowGraphics_OverrideFrameType

	thumb_func_start MenuLoadTextWindowGraphics
MenuLoadTextWindowGraphics: @ 8071E18
	push {lr}
	ldr r0, _08071E28 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl LoadTextWindowGraphics
	pop {r0}
	bx r0
	.align 2, 0
_08071E28: .4byte gMenuWindowPtr
	thumb_func_end MenuLoadTextWindowGraphics

	thumb_func_start BasicInitMenuWindow
BasicInitMenuWindow: @ 8071E2C
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08071E48 @ =gMenuWindowPtr
	ldr r0, [r4]
	bl InitWindowFromConfig
	ldr r1, [r4]
	ldr r0, _08071E4C @ =gMenuTextTileOffset
	ldrh r0, [r0]
	strh r0, [r1, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071E48: .4byte gMenuWindowPtr
_08071E4C: .4byte gMenuTextTileOffset
	thumb_func_end BasicInitMenuWindow

	thumb_func_start MenuPrint
MenuPrint: @ 8071E50
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r3, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08071E7C @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08071E80 @ =gMenuTextTileOffset
	ldrh r4, [r1]
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8003460
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071E7C: .4byte gMenuWindowPtr
_08071E80: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrint

	thumb_func_start MenuZeroFillWindowRect
MenuZeroFillWindowRect: @ 8071E84
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08071EB8 @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl ZeroFillWindowRect
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071EB8: .4byte gMenuWindowPtr
	thumb_func_end MenuZeroFillWindowRect

	thumb_func_start MenuFillWindowRectWithBlankTile
MenuFillWindowRectWithBlankTile: @ 8071EBC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08071EF0 @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl FillWindowRectWithBlankTile
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071EF0: .4byte gMenuWindowPtr
	thumb_func_end MenuFillWindowRectWithBlankTile

	thumb_func_start MenuZeroFillScreen
MenuZeroFillScreen: @ 8071EF4
	push {lr}
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end MenuZeroFillScreen

	thumb_func_start MenuDrawTextWindow
MenuDrawTextWindow: @ 8071F08
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08071F3C @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl DrawTextWindow
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071F3C: .4byte gMenuWindowPtr
	thumb_func_end MenuDrawTextWindow

	thumb_func_start sub_8071F40
sub_8071F40: @ 8071F40
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8071F40

	thumb_func_start sub_8071F60
sub_8071F60: @ 8071F60
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r3, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08071F90 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08071F94 @ =gMenuTextTileOffset
	ldrh r5, [r1]
	str r2, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8003490
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071F90: .4byte gMenuWindowPtr
_08071F94: .4byte gMenuTextTileOffset
	thumb_func_end sub_8071F60

	thumb_func_start unref_sub_8071F98
unref_sub_8071F98: @ 8071F98
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08071FB8 @ =gMenuWindowPtr
	ldr r0, [r0]
	adds r1, r3, 0
	bl GetWindowTilemapEntry
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08071FB8: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8071F98

	thumb_func_start unref_sub_8071FBC
unref_sub_8071FBC: @ 8071FBC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08071FF8 @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl DrawWindowRect
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071FF8: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8071FBC

	thumb_func_start MenuDisplayMessageBox
MenuDisplayMessageBox: @ 8071FFC
	push {lr}
	ldr r0, _0807200C @ =gMenuWindowPtr
	ldr r0, [r0]
	bl DisplayMessageBox
	pop {r0}
	bx r0
	.align 2, 0
_0807200C: .4byte gMenuWindowPtr
	thumb_func_end MenuDisplayMessageBox

	thumb_func_start MenuPrintMessage
MenuPrintMessage: @ 8072010
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r3, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0807203C @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08072040 @ =gMenuTextTileOffset
	ldrh r4, [r1]
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8002EB0
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807203C: .4byte gMenuWindowPtr
_08072040: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrintMessage

	thumb_func_start sub_8072044
sub_8072044: @ 8072044
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08072064 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r2, _08072068 @ =gMenuTextTileOffset
	ldrh r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08072064: .4byte gMenuWindowPtr
_08072068: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072044

	thumb_func_start MenuSetText
MenuSetText: @ 807206C
	push {lr}
	adds r1, r0, 0
	ldr r0, _0807207C @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_8002E90
	pop {r0}
	bx r0
	.align 2, 0
_0807207C: .4byte gMenuWindowPtr
	thumb_func_end MenuSetText

	thumb_func_start MenuUpdateWindowText
MenuUpdateWindowText: @ 8072080
	push {lr}
	ldr r0, _08072094 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08072094: .4byte gMenuWindowPtr
	thumb_func_end MenuUpdateWindowText

	thumb_func_start unref_sub_8072098
unref_sub_8072098: @ 8072098
	push {lr}
	ldr r0, _080720AC @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_8003418
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080720AC: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8072098

	thumb_func_start sub_80720B0
sub_80720B0: @ 80720B0
	push {lr}
	ldr r0, _080720C0 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl ClearWindowTextLines
	pop {r0}
	bx r0
	.align 2, 0
_080720C0: .4byte gMenuWindowPtr
	thumb_func_end sub_80720B0

	thumb_func_start MoveMenuCursor
MoveMenuCursor: @ 80720C4
	push {r4,lr}
	ldr r1, _080720E0 @ =0x030006b0
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	lsls r0, 24
	asrs r3, r0, 24
	adds r2, r3
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	adds r4, r1, 0
	cmp r2, r0
	bge _080720E4
	ldrb r0, [r4, 0x4]
	b _080720F4
	.align 2, 0
_080720E0: .4byte 0x030006b0
_080720E4:
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _080720F0
	ldrb r0, [r4, 0x3]
	b _080720F4
_080720F0:
	ldrb r0, [r4, 0x2]
	adds r0, r3, r0
_080720F4:
	strb r0, [r4, 0x2]
	ldrb r0, [r4]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	lsls r1, 1
	ldrb r2, [r4, 0x1]
	adds r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl RedrawMenuCursor
	ldrb r0, [r4, 0x2]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MoveMenuCursor

	thumb_func_start MoveMenuCursorNoWrap
MoveMenuCursorNoWrap: @ 8072114
	push {r4,lr}
	ldr r1, _08072130 @ =0x030006b0
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	lsls r0, 24
	asrs r3, r0, 24
	adds r2, r3
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	adds r4, r1, 0
	cmp r2, r0
	bge _08072134
	ldrb r0, [r4, 0x3]
	b _08072144
	.align 2, 0
_08072130: .4byte 0x030006b0
_08072134:
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _08072140
	ldrb r0, [r4, 0x4]
	b _08072144
_08072140:
	ldrb r0, [r4, 0x2]
	adds r0, r3, r0
_08072144:
	strb r0, [r4, 0x2]
	ldrb r0, [r4]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	lsls r1, 1
	ldrb r2, [r4, 0x1]
	adds r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl RedrawMenuCursor
	ldrb r0, [r4, 0x2]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MoveMenuCursorNoWrap

	thumb_func_start GetMenuCursorPos
GetMenuCursorPos: @ 8072164
	ldr r0, _0807216C @ =0x030006b0
	ldrb r0, [r0, 0x2]
	bx lr
	.align 2, 0
_0807216C: .4byte 0x030006b0
	thumb_func_end GetMenuCursorPos

	thumb_func_start ProcessMenuInput
ProcessMenuInput: @ 8072170
	push {r4,lr}
	ldr r0, _08072198 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080721A0
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0807219C @ =0x030006b0
	ldrb r0, [r4, 0x7]
	cmp r0, 0
	beq _08072190
	bl sub_8072DEC
_08072190:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _080721EC
	.align 2, 0
_08072198: .4byte gMain
_0807219C: .4byte 0x030006b0
_080721A0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080721C0
	ldr r0, _080721BC @ =0x030006b0
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _080721B4
	bl sub_8072DEC
_080721B4:
	movs r0, 0x1
	negs r0, r0
	b _080721EC
	.align 2, 0
_080721BC: .4byte 0x030006b0
_080721C0:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080721D4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080721E4
_080721D4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080721E8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080721E4:
	bl MoveMenuCursor
_080721E8:
	movs r0, 0x2
	negs r0, r0
_080721EC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInput

	thumb_func_start ProcessMenuInputNoWrap
ProcessMenuInputNoWrap: @ 80721F4
	push {r4-r6,lr}
	ldr r4, _08072220 @ =0x030006b0
	ldrb r5, [r4, 0x2]
	adds r6, r5, 0
	ldr r0, _08072224 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08072228
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x7]
	cmp r0, 0
	beq _08072218
	bl sub_8072DEC
_08072218:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _08072288
	.align 2, 0
_08072220: .4byte 0x030006b0
_08072224: .4byte gMain
_08072228:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08072240
	ldrb r0, [r4, 0x7]
	cmp r0, 0
	beq _0807223A
	bl sub_8072DEC
_0807223A:
	movs r0, 0x1
	negs r0, r0
	b _08072288
_08072240:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08072260
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08072284
	movs r0, 0x5
	bl PlaySE
	b _08072284
_08072260:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807227E
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08072284
	movs r0, 0x5
	bl PlaySE
	b _08072284
_0807227E:
	movs r0, 0
	bl MoveMenuCursorNoWrap
_08072284:
	movs r0, 0x2
	negs r0, r0
_08072288:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInputNoWrap

	thumb_func_start MoveMenuCursor3
MoveMenuCursor3: @ 8072290
	push {r4-r7,lr}
	ldr r2, _080722B8 @ =0x030006b0
	movs r4, 0x4
	ldrsb r4, [r2, r4]
	adds r1, r4, 0x1
	asrs r1, 1
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0x2
	ldrsb r1, [r2, r1]
	lsls r0, 24
	asrs r3, r0, 24
	adds r1, r3
	movs r0, 0x3
	ldrsb r0, [r2, r0]
	adds r6, r2, 0
	cmp r1, r0
	bge _080722BC
	ldrb r0, [r6, 0x4]
	b _080722C8
	.align 2, 0
_080722B8: .4byte 0x030006b0
_080722BC:
	cmp r1, r4
	ble _080722C4
	ldrb r0, [r6, 0x3]
	b _080722C8
_080722C4:
	ldrb r0, [r6, 0x2]
	adds r0, r3, r0
_080722C8:
	strb r0, [r6, 0x2]
	movs r5, 0x2
	ldrsb r5, [r6, r5]
	adds r0, r5, 0
	adds r1, r7, 0
	bl __divsi3
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 1
	ldrb r0, [r6]
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r7, 0
	bl __modsi3
	adds r1, r0, 0
	lsls r1, 1
	ldrb r0, [r6, 0x1]
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RedrawMenuCursor
	ldrb r0, [r6, 0x2]
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MoveMenuCursor3

	thumb_func_start MoveMenuCursor4
MoveMenuCursor4: @ 8072308
	push {r4-r7,lr}
	ldr r6, _08072330 @ =0x030006b0
	movs r1, 0x2
	ldrsb r1, [r6, r1]
	lsls r0, 24
	asrs r4, r0, 24
	adds r1, r4
	movs r0, 0x4
	ldrsb r0, [r6, r0]
	cmp r1, r0
	bgt _08072334
	bl sub_80723D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08072338
	ldrb r0, [r6, 0x2]
	b _080723C8
	.align 2, 0
_08072330: .4byte 0x030006b0
_08072334:
	ldrb r0, [r6, 0x2]
	b _080723C8
_08072338:
	ldrb r0, [r6, 0x2]
	adds r0, r4, r0
	strb r0, [r6, 0x2]
	movs r0, 0x4
	ldrsb r0, [r6, r0]
	adds r0, 0x1
	ldrb r7, [r6, 0x5]
	adds r1, r7, 0
	bl __divsi3
	cmp r0, 0
	bne _0807238E
	movs r5, 0x2
	ldrsb r5, [r6, r5]
	adds r0, r5, 0
	adds r1, r7, 0
	bl __modsi3
	adds r1, r6, 0
	adds r1, 0x8
	adds r0, r1
	ldrb r4, [r0]
	ldrb r0, [r6]
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r7, 0
	bl __divsi3
	ldrb r1, [r6, 0x6]
	bl __modsi3
	adds r1, r0, 0
	lsls r1, 1
	ldrb r6, [r6, 0x1]
	adds r1, r6
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RedrawMenuCursor
	b _080723C4
_0807238E:
	movs r5, 0x2
	ldrsb r5, [r6, r5]
	adds r0, r5, 0
	adds r1, r7, 0
	bl __modsi3
	adds r1, r6, 0
	adds r1, 0x8
	adds r0, r1
	ldrb r4, [r0]
	ldrb r0, [r6]
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r7, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 1
	ldrb r6, [r6, 0x1]
	adds r1, r6
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RedrawMenuCursor
_080723C4:
	ldr r0, _080723D0 @ =0x030006b0
	ldrb r0, [r0, 0x2]
_080723C8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080723D0: .4byte 0x030006b0
	thumb_func_end MoveMenuCursor4

	thumb_func_start sub_80723D4
sub_80723D4: @ 80726F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _0807278C @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _08072710
	ldr r1, _08072790 @ =0x030006b0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	blt _08072788
_08072710:
	mov r0, r8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08072730
	ldr r0, _08072790 @ =0x030006b0
	movs r2, 0x2
	ldrsb r2, [r0, r2]
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, 0x5]
	subs r0, 0x1
	subs r1, r0
	cmp r2, r1
	bge _08072788
_08072730:
	mov r0, r8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08072768
	ldr r6, _08072790 @ =0x030006b0
	movs r4, 0x2
	ldrsb r4, [r6, r4]
	ldrb r5, [r6, 0x5]
	adds r0, r4, 0
	adds r1, r5, 0
	bl __modsi3
	adds r7, r0, 0
	subs r4, r7
	adds r0, r4, 0
	adds r1, r5, 0
	bl __modsi3
	cmp r0, 0x1
	beq _08072788
	movs r0, 0x2
	ldrsb r0, [r6, r0]
	cmp r0, 0
	beq _08072788
	cmp r7, 0
	beq _08072788
_08072768:
	mov r0, r8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08072794
	ldr r1, _08072790 @ =0x030006b0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	ldrb r4, [r1, 0x5]
	adds r1, r4, 0
	bl __modsi3
	subs r4, 0x1
	cmp r0, r4
	bne _08072794
_08072788:
	movs r0, 0x1
	b _08072796
	.align 2, 0
_0807278C: .4byte gMain
_08072790: .4byte 0x030006b0
_08072794:
	movs r0, 0
_08072796:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80723D4

	thumb_func_start sub_8072484
sub_8072484: @ 80727A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r6, r0, 0
	mov r8, r1
	adds r5, r2, 0
	ldr r1, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _0807280C @ =0x030006b0
	strb r1, [r7, 0x5]
	adds r0, r5, 0
	bl __udivsi3
	strb r0, [r7, 0x6]
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	adds r1, r6, 0
	mov r2, r8
	adds r3, r5, 0
	bl InitMenu
	movs r0, 0
	ldr r1, [sp, 0x2C]
	cmp r1, 0
	beq _080727FA
	movs r0, 0xFF
_080727FA:
	strb r0, [r7, 0x7]
	mov r0, r9
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807280C: .4byte 0x030006b0
	thumb_func_end sub_8072484

	thumb_func_start sub_80724F4
sub_80724F4: @ 8072810
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r8, r3
	ldr r3, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	movs r4, 0
	ldr r0, _080728F0 @ =0x030006b0
	mov r9, r0
	mov r1, r9
	adds r1, 0x8
	movs r2, 0
_08072840:
	adds r0, r4, r1
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _08072840
	movs r7, 0
	movs r4, 0
	lsrs r2, r6, 1
	mov r10, r2
	ldr r0, [sp, 0x4]
	lsls r0, 24
	str r0, [sp, 0x8]
	cmp r7, r6
	bcs _08072882
_08072860:
	lsls r0, r4, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r0, r1, 3
	cmp r0, r7
	bls _08072878
	adds r7, r0, 0
_08072878:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08072860
_08072882:
	movs r4, 0x1
	ldr r2, _080728F0 @ =0x030006b0
	mov r9, r2
	cmp r4, r5
	bhi _0807289E
	mov r1, r9
	adds r1, 0x8
_08072890:
	adds r0, r4, r1
	strb r7, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bls _08072890
_0807289E:
	movs r4, 0x1
	cmp r4, r5
	bhi _080728C0
	ldr r3, _080728F4 @ =0x030006b8
_080728A6:
	adds r2, r4, r3
	ldrb r1, [r2]
	subs r0, r4, 0x1
	adds r0, r3
	adds r1, 0x1
	ldrb r0, [r0]
	adds r1, r0
	strb r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bls _080728A6
_080728C0:
	mov r1, r9
	adds r1, 0x8
	adds r1, r5, r1
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	cmp r10, r5
	bcc _080728D8
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _080728E0
_080728D8:
	cmp r5, 0x1
	beq _080728E0
	cmp r5, r6
	bne _080728F8
_080728E0:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x1
	b _08072906
	.align 2, 0
_080728F0: .4byte 0x030006b0
_080728F4: .4byte 0x030006b8
_080728F8:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x3
_08072906:
	ldr r2, [sp, 0x8]
	asrs r1, r2, 24
	adds r1, r0
	lsls r1, 24
	lsrs r3, r1, 24
	mov r0, r9
	adds r0, 0x8
	adds r0, r5, r0
	ldrb r2, [r0]
	adds r2, 0x1
	ldr r0, [sp]
	adds r2, r0, r2
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x4]
	bl MenuDrawTextWindow
	adds r0, r7, 0
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80724F4

	thumb_func_start sub_8072620
sub_8072620: @ 807293C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r10, r3
	ldr r3, [sp, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r6, r3, 24
	movs r4, 0
	ldr r7, _08072A60 @ =0x030006b0
	adds r1, r7, 0
	adds r1, 0x8
	movs r2, 0
_0807296C:
	adds r0, r4, r1
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _0807296C
	movs r5, 0
	movs r4, 0
	cmp r4, r8
	bcs _080729A4
_08072982:
	lsls r0, r4, 3
	add r0, r10
	ldr r0, [r0]
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r0, r1, 3
	cmp r0, r5
	bls _0807299A
	adds r5, r0, 0
_0807299A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _08072982
_080729A4:
	movs r4, 0x1
	ldr r7, _08072A60 @ =0x030006b0
	cmp r4, r6
	bhi _080729BE
	adds r1, r7, 0
	adds r1, 0x8
_080729B0:
	adds r0, r4, r1
	strb r5, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bls _080729B0
_080729BE:
	movs r4, 0x1
	cmp r4, r6
	bhi _080729E0
	ldr r3, _08072A64 @ =0x030006b8
_080729C6:
	adds r2, r4, r3
	ldrb r1, [r2]
	subs r0, r4, 0x1
	adds r0, r3
	adds r1, 0x1
	ldrb r0, [r0]
	adds r1, r0
	strb r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bls _080729C6
_080729E0:
	adds r1, r7, 0
	adds r1, 0x8
	adds r1, r6, r1
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	movs r4, 0
	cmp r4, r6
	bcs _08072A4E
_080729F2:
	movs r7, 0
	movs r5, 0
	adds r0, r4, 0x1
	mov r9, r0
	cmp r4, r8
	bge _08072A44
	adds r0, r4, 0
	adds r1, r6, 0
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08072A64 @ =0x030006b8
	adds r0, r1
	str r0, [sp, 0xC]
_08072A10:
	adds r0, r4, r5
	lsls r0, 3
	add r0, r10
	ldr r0, [r0]
	ldr r2, [sp, 0xC]
	ldrb r1, [r2]
	ldr r3, [sp]
	adds r1, r3, r1
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r7, 1
	ldr r3, [sp, 0x4]
	adds r2, r3, r2
	lsls r2, 24
	lsrs r2, 24
	bl MenuPrint
	adds r0, r5, r6
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, r5
	cmp r0, r8
	blt _08072A10
_08072A44:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _080729F2
_08072A4E:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072A60: .4byte 0x030006b0
_08072A64: .4byte 0x030006b8
	thumb_func_end sub_8072620

	thumb_func_start sub_807274C
sub_807274C: @ 807274C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	mov r8, r2
	mov r9, r3
	ldr r7, [sp, 0x28]
	ldr r6, [sp, 0x2C]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, r8
	adds r3, r7, 0
	bl sub_80724F4
	lsls r0, 24
	lsrs r0, 24
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r6, [sp]
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x30]
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r9
	bl sub_8072484
	str r6, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, r8
	adds r3, r7, 0
	bl sub_8072620
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807274C

	thumb_func_start sub_80727CC
sub_80727CC: @ 80727CC
	push {lr}
	ldr r0, _080727F8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08072800
	ldr r0, _080727FC @ =0x030006b0
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _080727E6
	bl sub_8072DEC
_080727E6:
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	asrs r0, 24
	b _08072888
	.align 2, 0
_080727F8: .4byte gMain
_080727FC: .4byte 0x030006b0
_08072800:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08072820
	ldr r0, _0807281C @ =0x030006b0
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _08072814
	bl sub_8072DEC
_08072814:
	movs r0, 0x1
	negs r0, r0
	b _08072888
	.align 2, 0
_0807281C: .4byte 0x030006b0
_08072820:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08072840
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0807283C @ =0x030006b0
	ldrb r0, [r0, 0x5]
	negs r0, r0
	lsls r0, 24
	asrs r0, 24
	b _08072880
	.align 2, 0
_0807283C: .4byte 0x030006b0
_08072840:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807285C
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08072858 @ =0x030006b0
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	b _08072880
	.align 2, 0
_08072858: .4byte 0x030006b0
_0807285C:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08072870
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08072880
_08072870:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08072884
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08072880:
	bl MoveMenuCursor4
_08072884:
	movs r0, 0x2
	negs r0, r0
_08072888:
	pop {r1}
	bx r1
	thumb_func_end sub_80727CC

	thumb_func_start sub_807288C
sub_807288C: @ 807288C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807289C @ =0x030006b0
	adds r1, 0x8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807289C: .4byte 0x030006b0
	thumb_func_end sub_807288C

	thumb_func_start PrintMenuItems
PrintMenuItems: @ 80728A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r3
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	cmp r4, r5
	bcs _080728D8
_080728BA:
	lsls r0, r4, 3
	add r0, r8
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, r6, r2
	lsls r2, 24
	lsrs r2, 24
	adds r1, r7, 0
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080728BA
_080728D8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PrintMenuItems

	thumb_func_start PrintMenuItemsReordered
PrintMenuItemsReordered: @ 80728E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r3
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	cmp r4, r5
	bcs _08072922
_080728FE:
	ldr r1, [sp, 0x18]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, r6, r2
	lsls r2, 24
	lsrs r2, 24
	adds r1, r7, 0
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _080728FE
_08072922:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PrintMenuItemsReordered

	thumb_func_start InitYesNoMenu
InitYesNoMenu: @ 807292C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsls r5, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x80
	lsls r0, 17
	adds r4, r0
	lsrs r4, 24
	adds r5, r0
	lsrs r5, 24
	ldr r3, _08072970 @ =gUnknown_08376D74
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl InitMenu
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072970: .4byte gUnknown_08376D74
	thumb_func_end InitYesNoMenu

	thumb_func_start DisplayYesNoMenu
DisplayYesNoMenu: @ 8072974
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r3, r1, 0
	mov r8, r2
	lsls r4, 24
	lsls r3, 24
	lsrs r6, r4, 24
	movs r0, 0xC0
	lsls r0, 19
	adds r4, r0
	lsrs r4, 24
	lsrs r5, r3, 24
	movs r2, 0xA0
	lsls r2, 19
	adds r3, r2
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x5
	bl InitYesNoMenu
	ldr r1, _080729C4 @ =0x030006b0
	movs r0, 0
	mov r2, r8
	cmp r2, 0
	beq _080729B8
	movs r0, 0xFF
_080729B8:
	strb r0, [r1, 0x7]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080729C4: .4byte 0x030006b0
	thumb_func_end DisplayYesNoMenu

	thumb_func_start ProcessMenuInputNoWrap_
ProcessMenuInputNoWrap_: @ 80729C8
	push {lr}
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInputNoWrap_

	thumb_func_start MenuPrint_PixelCoords
MenuPrint_PixelCoords: @ 80729D8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072A10 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08072A14 @ =gMenuTextTileOffset
	ldrh r5, [r1]
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8004D04
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08072A10: .4byte gMenuWindowPtr
_08072A14: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrint_PixelCoords

	thumb_func_start sub_8072A18
sub_8072A18: @ 8072A18
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r5, [sp, 0x20]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072A54 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r4, _08072A58 @ =gMenuTextTileOffset
	ldrh r4, [r4]
	str r1, [sp]
	str r2, [sp, 0x4]
	str r3, [sp, 0x8]
	str r5, [sp, 0xC]
	movs r1, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_8004FD0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08072A54: .4byte gMenuWindowPtr
_08072A58: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072A18

	thumb_func_start unref_sub_8072A5C
unref_sub_8072A5C: @ 8072A5C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x10
	mov r8, r0
	mov r9, r1
	ldr r4, [sp, 0x28]
	ldr r6, [sp, 0x2C]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08072AA8 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08072AAC @ =gMenuTextTileOffset
	ldrh r5, [r1]
	str r2, [sp]
	str r3, [sp, 0x4]
	str r4, [sp, 0x8]
	str r6, [sp, 0xC]
	mov r1, r8
	mov r2, r9
	adds r3, r5, 0
	bl sub_8004FD0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08072AA8: .4byte gMenuWindowPtr
_08072AAC: .4byte gMenuTextTileOffset
	thumb_func_end unref_sub_8072A5C

	thumb_func_start sub_8072AB0
sub_8072AB0: @ 8072AB0
	push {r4-r7,lr}
	sub sp, 0x10
	mov r12, r0
	ldr r0, [sp, 0x24]
	ldr r4, [sp, 0x28]
	str r4, [sp, 0xC]
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08072AF8 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08072AFC @ =gMenuTextTileOffset
	ldrh r3, [r1]
	str r5, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r1, 0
	mov r2, r12
	bl sub_8004FD0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r3, 0x7
	ands r3, r5
	cmp r3, 0
	bne _08072B00
	adds r1, r6, 0x7
	asrs r1, 3
	subs r1, 0x1
	b _08072B0C
	.align 2, 0
_08072AF8: .4byte gMenuWindowPtr
_08072AFC: .4byte gMenuTextTileOffset
_08072B00:
	adds r3, r6, r3
	subs r1, r3, 0x1
	cmp r1, 0
	bge _08072B0A
	adds r1, r3, 0x6
_08072B0A:
	asrs r1, 3
_08072B0C:
	lsls r1, 24
	lsrs r1, 24
	adds r6, r1, 0
	lsrs r5, 3
	adds r1, r7, 0x7
	asrs r1, 3
	lsls r1, 24
	lsrs r7, r1, 24
	lsrs r4, 3
	cmp r2, r7
	bcs _08072B3E
	lsls r1, r2, 1
	adds r1, r4, r1
	lsls r1, 24
	lsrs r1, 24
	adds r2, r5, r6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r7, r4
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	bl MenuFillWindowRectWithBlankTile
_08072B3E:
	add sp, 0x10
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8072AB0

	thumb_func_start MenuPrint_RightAligned
MenuPrint_RightAligned: @ 8072B4C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r3, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08072B78 @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08072B7C @ =gMenuTextTileOffset
	ldrh r4, [r1]
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8004D38
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072B78: .4byte gMenuWindowPtr
_08072B7C: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrint_RightAligned

	thumb_func_start sub_8072B80
sub_8072B80: @ 8072B80
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x44
	mov r8, r0
	adds r6, r1, 0
	adds r5, r2, 0
	adds r1, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08072BD0 @ =gMenuWindowPtr
	ldr r0, [r4]
	bl GetStringWidth
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, [r4]
	movs r1, 0x1
	str r1, [sp]
	add r1, sp, 0x4
	mov r2, r8
	bl AlignString
	ldr r0, [r4]
	ldr r1, _08072BD4 @ =gMenuTextTileOffset
	ldrh r2, [r1]
	str r5, [sp]
	add r1, sp, 0x4
	adds r3, r6, 0
	bl sub_8003460
	add sp, 0x44
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072BD0: .4byte gMenuWindowPtr
_08072BD4: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072B80

	thumb_func_start sub_8072BD8
sub_8072BD8: @ 8072BD8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _08072C0C @ =gMenuWindowPtr
	ldr r0, [r0]
	ldr r1, _08072C10 @ =gMenuTextTileOffset
	ldrh r5, [r1]
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8004DB0
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072C0C: .4byte gMenuWindowPtr
_08072C10: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072BD8

	thumb_func_start sub_8072C14
sub_8072C14: @ 8072C14
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072C40 @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl AlignInt1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08072C40: .4byte gMenuWindowPtr
	thumb_func_end sub_8072C14

	thumb_func_start sub_8072C44
sub_8072C44: @ 8072C44
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072C70 @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl AlignInt2
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08072C70: .4byte gMenuWindowPtr
	thumb_func_end sub_8072C44

	thumb_func_start sub_8072C74
sub_8072C74: @ 8072C74
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072CA0 @ =gMenuWindowPtr
	ldr r0, [r0]
	str r3, [sp]
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl AlignString
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08072CA0: .4byte gMenuWindowPtr
	thumb_func_end sub_8072C74

	thumb_func_start sub_8072CA4
sub_8072CA4: @ 8072CA4
	push {lr}
	adds r1, r0, 0
	ldr r0, _08072CB8 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl GetStringWidth
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08072CB8: .4byte gMenuWindowPtr
	thumb_func_end sub_8072CA4

	thumb_func_start sub_8072CBC
sub_8072CBC: @ 8072CBC
	push {lr}
	ldr r0, _08072CD0 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_8004E24
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08072CD0: .4byte gMenuWindowPtr
	thumb_func_end sub_8072CBC

	thumb_func_start sub_8072CD4
sub_8072CD4: @ 8072CD4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08072CF0 @ =gMenuWindowPtr
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8004E28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072CF0: .4byte gMenuWindowPtr
	thumb_func_end sub_8072CD4

	thumb_func_start MenuUpdateWindowText_OverrideLineLength
MenuUpdateWindowText_OverrideLineLength: @ 8072CF4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08072D08 @ =gMenuWindowPtr
	ldr r0, [r0]
	bl sub_80037C8
	pop {r1}
	bx r1
	.align 2, 0
_08072D08: .4byte gMenuWindowPtr
	thumb_func_end MenuUpdateWindowText_OverrideLineLength

	thumb_func_start unref_sub_8072D0C
unref_sub_8072D0C: @ 8072D0C
	ldr r0, _08072D14 @ =gMenuWindowPtr
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08072D14: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8072D0C

	thumb_func_start sub_8072D18
sub_8072D18: @ 8073030
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073050 @ =0x0000ffff
	ldr r3, _08073054 @ =0x00002d9f
	lsls r1, 27
	lsrs r1, 24
	str r1, [sp]
	adds r1, r2, 0
	movs r2, 0xC
	bl sub_814A5C0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08073050: .4byte 0x0000ffff
_08073054: .4byte 0x00002d9f
	thumb_func_end sub_8072D18

	thumb_func_start InitMenu
InitMenu: @ 8072D40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r1, r5, 24
	cmp r1, 0
	beq _08072D6C
	bl sub_8072D18
_08072D6C:
	ldr r1, _08072DA4 @ =0x030006b0
	subs r0, r7, 0x1
	movs r2, 0
	strb r0, [r1]
	mov r0, r8
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x3]
	subs r0, r6, 0x1
	strb r0, [r1, 0x4]
	strb r2, [r1, 0x7]
	cmp r4, 0
	blt _08072D8C
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _08072D8E
_08072D8C:
	movs r4, 0
_08072D8E:
	strb r4, [r1, 0x2]
	movs r0, 0
	bl MoveMenuCursor
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08072DA4: .4byte 0x030006b0
	thumb_func_end InitMenu

	thumb_func_start RedrawMenuCursor
RedrawMenuCursor: @ 8072DA8
	push {lr}
	lsls r0, 27
	movs r2, 0x80
	lsls r2, 20
	adds r0, r2
	lsrs r0, 24
	lsls r1, 27
	lsrs r1, 24
	bl sub_814A880
	pop {r0}
	bx r0
	thumb_func_end RedrawMenuCursor

	thumb_func_start unref_sub_8072DC0
unref_sub_8072DC0: @ 8072DC0
	push {lr}
	bl sub_814A904
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8072DC0

	thumb_func_start sub_8072DCC
sub_8072DCC: @ 8072DCC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_814A958
	pop {r0}
	bx r0
	thumb_func_end sub_8072DCC

	thumb_func_start sub_8072DDC
sub_8072DDC: @ 8072DDC
	push {lr}
	lsls r0, 27
	lsrs r0, 24
	bl sub_8072DCC
	pop {r0}
	bx r0
	thumb_func_end sub_8072DDC

	thumb_func_start sub_8072DEC
sub_8072DEC: @ 8072DEC
	push {lr}
	bl sub_814A7FC
	pop {r0}
	bx r0
	thumb_func_end sub_8072DEC

	thumb_func_start de_sub_8073110
de_sub_8073110: @ 8073110
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	adds r5, r6, 0
	ldr r4, _08073134 @ =gStringVar1
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	bl de_sub_8006CA8
	adds r4, 0x1
	adds r4, r0, r4
	adds r1, r4, 0
	movs r7, 0xFF
	b _0807313E
	.align 2, 0
_08073134: .4byte gStringVar1
_08073138:
	strb r2, [r1]
	adds r5, 0x1
	adds r1, 0x1
_0807313E:
	ldrb r2, [r5]
	adds r0, r2, 0
	cmp r0, 0xFF
	beq _08073168
	cmp r0, 0xFD
	bne _08073138
	strb r7, [r1]
	adds r5, 0x2
	adds r0, r4, 0
	mov r1, r8
	bl StringAppend
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringAppend
	strb r7, [r6]
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringAppend
_08073168:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end de_sub_8073110

	thumb_func_start de_sub_8073174
de_sub_8073174: @ 8073174
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, 0
	ldr r4, _080731B4 @ =gStringVar2
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	bl de_sub_8006CA8
	adds r5, r0, 0
	adds r4, 0x1
	adds r5, r4
	adds r0, r5, 0
	adds r1, r6, 0
	bl StringCopy
	adds r0, r5, 0
	mov r1, r8
	bl de_sub_8073110
	mov r0, r8
	adds r1, r5, 0
	bl StringCopy
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080731B4: .4byte gStringVar2
	thumb_func_end de_sub_8073174

	.align 2, 0 @ Don't pad with nop.
