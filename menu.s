	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8071C20
sub_8071C20: @ 8071F3C
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
AppendToList: @ 8071F58
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bx lr
	thumb_func_end AppendToList

	thumb_func_start InitMenuWindow
InitMenuWindow: @ 8071F68
	push {lr}
	movs r1, 0x1
	bl InitMenuWindowInternal
	pop {r0}
	bx r0
	thumb_func_end InitMenuWindow

	thumb_func_start MultistepInitMenuWindowBegin
MultistepInitMenuWindowBegin: @ 8071F74
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
	ldr r2, _08071FA0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _08071FA4
	strh r1, [r0]
	ldr r1, _08071FA8
	ldr r0, _08071FAC
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
MultistepInitMenuWindowContinue: @ 8071FB0
	push {r4,lr}
	ldr r0, _08071FC8
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0x4
	bhi _0807205C
	lsls r0, r1, 2
	ldr r1, _08071FCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071FC8: .4byte gMenuMultistepInitState
_08071FCC: .4byte _08071FD0
	.align 2, 0
_08071FD0:
	.4byte _08071FE4
	.4byte _08071FEC
	.4byte _0807200C
	.4byte _08072016
	.4byte _08072038
_08071FE4:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _0807205C
_08071FEC:
	ldr r4, _08072000
	ldr r0, _08072004
	ldr r0, [r0]
	ldr r1, _08072008
	ldrh r1, [r1]
	bl MultistepInitWindowTileData
	strh r0, [r4]
	b _08072022
	.align 2, 0
_08072000: .4byte gMenuTextWindowTileOffset
_08072004: .4byte gMenuWindowPtr
_08072008: .4byte gMenuTextTileOffset
_0807200C:
	bl MultistepLoadFont
	cmp r0, 0
	beq _0807205C
	b _08072022
_08072016:
	ldr r0, _0807202C
	ldrh r0, [r0]
	bl SetTextWindowBaseTileNum
	ldr r1, _08072030
	strh r0, [r1]
_08072022:
	ldr r1, _08072034
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0807205C
	.align 2, 0
_0807202C: .4byte gMenuTextWindowTileOffset
_08072030: .4byte gMenuTextWindowContentTileOffset
_08072034: .4byte gMenuMultistepInitState
_08072038:
	ldr r0, _08072050
	ldr r0, [r0]
	bl LoadTextWindowGraphics
	ldr r0, _08072054
	ldrh r0, [r0]
	bl SetMessageBoxBaseTileNum
	ldr r1, _08072058
	strh r0, [r1]
	movs r0, 0x1
	b _0807205E
	.align 2, 0
_08072050: .4byte gMenuWindowPtr
_08072054: .4byte gMenuTextWindowContentTileOffset
_08072058: .4byte gMenuMessageBoxContentTileOffset
_0807205C:
	movs r0, 0
_0807205E:
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
	ldr r5, _080720A8
	ldr r0, _080720AC
	str r0, [r5]
	adds r1, r2, 0
	bl InitWindowFromConfig
	ldr r1, _080720B0
	strh r4, [r1]
	ldr r0, [r5]
	ldrh r1, [r1]
	bl InitWindowTileData
	ldr r1, _080720B4
	strh r0, [r1]
	ldrh r0, [r1]
	bl SetTextWindowBaseTileNum
	ldr r4, _080720B8
	strh r0, [r4]
	ldr r0, [r5]
	bl LoadTextWindowGraphics
	ldrh r0, [r4]
	bl SetMessageBoxBaseTileNum
	ldr r1, _080720BC
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
unref_sub_8071DA4: @ 80720C0
	push {r4,r5,lr}
	adds r2, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r5, _08072104
	ldr r0, _08072108
	str r0, [r5]
	adds r1, r2, 0
	bl InitWindowFromConfig
	ldr r0, _0807210C
	strh r4, [r0]
	ldrh r0, [r0]
	bl SetTextWindowBaseTileNum
	ldr r4, _08072110
	strh r0, [r4]
	ldr r0, [r5]
	bl LoadTextWindowGraphics
	ldrh r0, [r4]
	bl SetMessageBoxBaseTileNum
	ldr r1, _08072114
	strh r0, [r1]
	ldr r0, [r5]
	ldrh r1, [r1]
	bl InitWindowTileData
	ldr r1, _08072118
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072104: .4byte gMenuWindowPtr
_08072108: .4byte gMenuWindow
_0807210C: .4byte gMenuTextWindowTileOffset
_08072110: .4byte gMenuTextWindowContentTileOffset
_08072114: .4byte gMenuTextTileOffset
_08072118: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end unref_sub_8071DA4

	thumb_func_start MenuLoadTextWindowGraphics_OverrideFrameType
MenuLoadTextWindowGraphics_OverrideFrameType: @ 807211C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08072130
	ldr r0, [r0]
	bl LoadTextWindowGraphics_OverrideFrameType
	pop {r0}
	bx r0
	.align 2, 0
_08072130: .4byte gMenuWindowPtr
	thumb_func_end MenuLoadTextWindowGraphics_OverrideFrameType

	thumb_func_start MenuLoadTextWindowGraphics
MenuLoadTextWindowGraphics: @ 8072134
	push {lr}
	ldr r0, _08072144
	ldr r0, [r0]
	bl LoadTextWindowGraphics
	pop {r0}
	bx r0
	.align 2, 0
_08072144: .4byte gMenuWindowPtr
	thumb_func_end MenuLoadTextWindowGraphics

	thumb_func_start BasicInitMenuWindow
BasicInitMenuWindow: @ 8072148
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08072164
	ldr r0, [r4]
	bl InitWindowFromConfig
	ldr r1, [r4]
	ldr r0, _08072168
	ldrh r0, [r0]
	strh r0, [r1, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072164: .4byte gMenuWindowPtr
_08072168: .4byte gMenuTextTileOffset
	thumb_func_end BasicInitMenuWindow

	thumb_func_start MenuPrint
MenuPrint: @ 807216C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r3, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08072198
	ldr r0, [r0]
	ldr r1, _0807219C
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
_08072198: .4byte gMenuWindowPtr
_0807219C: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrint

	thumb_func_start MenuZeroFillWindowRect
MenuZeroFillWindowRect: @ 80721A0
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
	ldr r0, _080721D4
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
_080721D4: .4byte gMenuWindowPtr
	thumb_func_end MenuZeroFillWindowRect

	thumb_func_start MenuFillWindowRectWithBlankTile
MenuFillWindowRectWithBlankTile: @ 80721D8
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
	ldr r0, _0807220C
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
_0807220C: .4byte gMenuWindowPtr
	thumb_func_end MenuFillWindowRectWithBlankTile

	thumb_func_start MenuZeroFillScreen
MenuZeroFillScreen: @ 8072210
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
MenuDrawTextWindow: @ 8072224
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
	ldr r0, _08072258
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
_08072258: .4byte gMenuWindowPtr
	thumb_func_end MenuDrawTextWindow

	thumb_func_start sub_8071F40
sub_8071F40: @ 807225C
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
sub_8071F60: @ 807227C
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
	ldr r0, _080722AC
	ldr r0, [r0]
	ldr r1, _080722B0
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
_080722AC: .4byte gMenuWindowPtr
_080722B0: .4byte gMenuTextTileOffset
	thumb_func_end sub_8071F60

	thumb_func_start unref_sub_8071F98
unref_sub_8071F98: @ 80722B4
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080722D4
	ldr r0, [r0]
	adds r1, r3, 0
	bl GetWindowTilemapEntry
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080722D4: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8071F98

	thumb_func_start unref_sub_8071FBC
unref_sub_8071FBC: @ 80722D8
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
	ldr r0, _08072314
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
_08072314: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8071FBC

	thumb_func_start MenuDisplayMessageBox
MenuDisplayMessageBox: @ 8072318
	push {lr}
	ldr r0, _08072328
	ldr r0, [r0]
	bl DisplayMessageBox
	pop {r0}
	bx r0
	.align 2, 0
_08072328: .4byte gMenuWindowPtr
	thumb_func_end MenuDisplayMessageBox

	thumb_func_start MenuPrintMessage
MenuPrintMessage: @ 807232C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r3, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08072358
	ldr r0, [r0]
	ldr r1, _0807235C
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
_08072358: .4byte gMenuWindowPtr
_0807235C: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrintMessage

	thumb_func_start sub_8072044
sub_8072044: @ 8072360
	push {lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r0, _08072380
	ldr r0, [r0]
	ldr r2, _08072384
	ldrh r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08072380: .4byte gMenuWindowPtr
_08072384: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072044

	thumb_func_start MenuSetText
MenuSetText: @ 8072388
	push {lr}
	adds r1, r0, 0
	ldr r0, _08072398
	ldr r0, [r0]
	bl sub_8002E90
	pop {r0}
	bx r0
	.align 2, 0
_08072398: .4byte gMenuWindowPtr
	thumb_func_end MenuSetText

	thumb_func_start MenuUpdateWindowText
MenuUpdateWindowText: @ 807239C
	push {lr}
	ldr r0, _080723B0
	ldr r0, [r0]
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080723B0: .4byte gMenuWindowPtr
	thumb_func_end MenuUpdateWindowText

	thumb_func_start unref_sub_8072098
unref_sub_8072098: @ 80723B4
	push {lr}
	ldr r0, _080723C8
	ldr r0, [r0]
	bl sub_8003418
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080723C8: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8072098

	thumb_func_start sub_80720B0
sub_80720B0: @ 80723CC
	push {lr}
	ldr r0, _080723DC
	ldr r0, [r0]
	bl ClearWindowTextLines
	pop {r0}
	bx r0
	.align 2, 0
_080723DC: .4byte gMenuWindowPtr
	thumb_func_end sub_80720B0

	thumb_func_start MoveMenuCursor
MoveMenuCursor: @ 80723E0
	push {r4,lr}
	ldr r1, _080723FC
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	lsls r0, 24
	asrs r3, r0, 24
	adds r2, r3
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	adds r4, r1, 0
	cmp r2, r0
	bge _08072400
	ldrb r0, [r4, 0x4]
	b _08072410
	.align 2, 0
_080723FC: .4byte 0x030006b0
_08072400:
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _0807240C
	ldrb r0, [r4, 0x3]
	b _08072410
_0807240C:
	ldrb r0, [r4, 0x2]
	adds r0, r3, r0
_08072410:
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
MoveMenuCursorNoWrap: @ 8072430
	push {r4,lr}
	ldr r1, _0807244C
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	lsls r0, 24
	asrs r3, r0, 24
	adds r2, r3
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	adds r4, r1, 0
	cmp r2, r0
	bge _08072450
	ldrb r0, [r4, 0x3]
	b _08072460
	.align 2, 0
_0807244C: .4byte 0x030006b0
_08072450:
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r2, r0
	ble _0807245C
	ldrb r0, [r4, 0x4]
	b _08072460
_0807245C:
	ldrb r0, [r4, 0x2]
	adds r0, r3, r0
_08072460:
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
GetMenuCursorPos: @ 8072480
	ldr r0, _08072488
	ldrb r0, [r0, 0x2]
	bx lr
	.align 2, 0
_08072488: .4byte 0x030006b0
	thumb_func_end GetMenuCursorPos

	thumb_func_start ProcessMenuInput
ProcessMenuInput: @ 807248C
	push {r4,lr}
	ldr r0, _080724B4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080724BC
	movs r0, 0x5
	bl PlaySE
	ldr r4, _080724B8
	ldrb r0, [r4, 0x7]
	cmp r0, 0
	beq _080724AC
	bl sub_8072DEC
_080724AC:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _08072508
	.align 2, 0
_080724B4: .4byte gMain
_080724B8: .4byte 0x030006b0
_080724BC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080724DC
	ldr r0, _080724D8
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _080724D0
	bl sub_8072DEC
_080724D0:
	movs r0, 0x1
	negs r0, r0
	b _08072508
	.align 2, 0
_080724D8: .4byte 0x030006b0
_080724DC:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080724F0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08072500
_080724F0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08072504
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08072500:
	bl MoveMenuCursor
_08072504:
	movs r0, 0x2
	negs r0, r0
_08072508:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInput

	thumb_func_start ProcessMenuInputNoWrap
ProcessMenuInputNoWrap: @ 8072510
	push {r4-r6,lr}
	ldr r4, _0807253C
	ldrb r5, [r4, 0x2]
	adds r6, r5, 0
	ldr r0, _08072540
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08072544
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0x7]
	cmp r0, 0
	beq _08072534
	bl sub_8072DEC
_08072534:
	movs r0, 0x2
	ldrsb r0, [r4, r0]
	b _080725A4
	.align 2, 0
_0807253C: .4byte 0x030006b0
_08072540: .4byte gMain
_08072544:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0807255C
	ldrb r0, [r4, 0x7]
	cmp r0, 0
	beq _08072556
	bl sub_8072DEC
_08072556:
	movs r0, 0x1
	negs r0, r0
	b _080725A4
_0807255C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0807257C
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _080725A0
	movs r0, 0x5
	bl PlaySE
	b _080725A0
_0807257C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807259A
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _080725A0
	movs r0, 0x5
	bl PlaySE
	b _080725A0
_0807259A:
	movs r0, 0
	bl MoveMenuCursorNoWrap
_080725A0:
	movs r0, 0x2
	negs r0, r0
_080725A4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInputNoWrap

	thumb_func_start MoveMenuCursor3
MoveMenuCursor3: @ 80725AC
	push {r4-r7,lr}
	ldr r2, _080725D4
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
	bge _080725D8
	ldrb r0, [r6, 0x4]
	b _080725E4
	.align 2, 0
_080725D4: .4byte 0x030006b0
_080725D8:
	cmp r1, r4
	ble _080725E0
	ldrb r0, [r6, 0x3]
	b _080725E4
_080725E0:
	ldrb r0, [r6, 0x2]
	adds r0, r3, r0
_080725E4:
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
MoveMenuCursor4: @ 8072624
	push {r4-r7,lr}
	ldr r6, _0807264C
	movs r1, 0x2
	ldrsb r1, [r6, r1]
	lsls r0, 24
	asrs r4, r0, 24
	adds r1, r4
	movs r0, 0x4
	ldrsb r0, [r6, r0]
	cmp r1, r0
	bgt _08072650
	bl sub_80723D4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08072654
	ldrb r0, [r6, 0x2]
	b _080726E4
	.align 2, 0
_0807264C: .4byte 0x030006b0
_08072650:
	ldrb r0, [r6, 0x2]
	b _080726E4
_08072654:
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
	bne _080726AA
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
	b _080726E0
_080726AA:
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
_080726E0:
	ldr r0, _080726EC
	ldrb r0, [r0, 0x2]
_080726E4:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080726EC: .4byte 0x030006b0
	thumb_func_end MoveMenuCursor4

	thumb_func_start sub_80723D4
sub_80723D4: @ 80726F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _0807278C
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _08072710
	ldr r1, _08072790
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
	ldr r0, _08072790
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
	ldr r6, _08072790
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
	ldr r1, _08072790
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
	ldr r7, _0807280C
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
	ldr r0, _080728F0
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
	ldr r2, _080728F0
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
	ldr r3, _080728F4
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
	ldr r7, _08072A60
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
	ldr r7, _08072A60
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
	ldr r3, _08072A64
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
	ldr r1, _08072A64
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
sub_807274C: @ 8072A68
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
sub_80727CC: @ 8072AE8
	push {lr}
	ldr r0, _08072B14
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08072B1C
	ldr r0, _08072B18
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _08072B02
	bl sub_8072DEC
_08072B02:
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	asrs r0, 24
	b _08072BA4
	.align 2, 0
_08072B14: .4byte gMain
_08072B18: .4byte 0x030006b0
_08072B1C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08072B3C
	ldr r0, _08072B38
	ldrb r0, [r0, 0x7]
	cmp r0, 0
	beq _08072B30
	bl sub_8072DEC
_08072B30:
	movs r0, 0x1
	negs r0, r0
	b _08072BA4
	.align 2, 0
_08072B38: .4byte 0x030006b0
_08072B3C:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08072B5C
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08072B58
	ldrb r0, [r0, 0x5]
	negs r0, r0
	lsls r0, 24
	asrs r0, 24
	b _08072B9C
	.align 2, 0
_08072B58: .4byte 0x030006b0
_08072B5C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08072B78
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08072B74
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	b _08072B9C
	.align 2, 0
_08072B74: .4byte 0x030006b0
_08072B78:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08072B8C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08072B9C
_08072B8C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08072BA0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08072B9C:
	bl MoveMenuCursor4
_08072BA0:
	movs r0, 0x2
	negs r0, r0
_08072BA4:
	pop {r1}
	bx r1
	thumb_func_end sub_80727CC

	thumb_func_start sub_807288C
sub_807288C: @ 8072BA8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08072BB8
	adds r1, 0x8
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08072BB8: .4byte 0x030006b0
	thumb_func_end sub_807288C

	thumb_func_start PrintMenuItems
PrintMenuItems: @ 8072BBC
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
	bcs _08072BF4
_08072BD6:
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
	bcc _08072BD6
_08072BF4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PrintMenuItems

	thumb_func_start PrintMenuItemsReordered
PrintMenuItemsReordered: @ 8072C00
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
	bcs _08072C3E
_08072C1A:
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
	bcc _08072C1A
_08072C3E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PrintMenuItemsReordered

	thumb_func_start InitYesNoMenu
InitYesNoMenu: @ 8072C48
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
	ldr r3, _08072C8C
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
_08072C8C: .4byte gUnknown_08376D74
	thumb_func_end InitYesNoMenu

	thumb_func_start DisplayYesNoMenu
DisplayYesNoMenu: @ 8072C90
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
	ldr r1, _08072CE0
	movs r0, 0
	mov r2, r8
	cmp r2, 0
	beq _08072CD4
	movs r0, 0xFF
_08072CD4:
	strb r0, [r1, 0x7]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072CE0: .4byte 0x030006b0
	thumb_func_end DisplayYesNoMenu

	thumb_func_start ProcessMenuInputNoWrap_
ProcessMenuInputNoWrap_: @ 8072CE4
	push {lr}
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end ProcessMenuInputNoWrap_

	thumb_func_start MenuPrint_PixelCoords
MenuPrint_PixelCoords: @ 8072CF4
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
	ldr r0, _08072D2C
	ldr r0, [r0]
	ldr r1, _08072D30
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
_08072D2C: .4byte gMenuWindowPtr
_08072D30: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrint_PixelCoords

	thumb_func_start sub_8072A18
sub_8072A18: @ 8072D34
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
	ldr r0, _08072D70
	ldr r0, [r0]
	ldr r4, _08072D74
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
_08072D70: .4byte gMenuWindowPtr
_08072D74: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072A18

	thumb_func_start unref_sub_8072A5C
unref_sub_8072A5C: @ 8072D78
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
	ldr r0, _08072DC4
	ldr r0, [r0]
	ldr r1, _08072DC8
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
_08072DC4: .4byte gMenuWindowPtr
_08072DC8: .4byte gMenuTextTileOffset
	thumb_func_end unref_sub_8072A5C

	thumb_func_start sub_8072AB0
sub_8072AB0: @ 8072DCC
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
	ldr r0, _08072E14
	ldr r0, [r0]
	ldr r1, _08072E18
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
	bne _08072E1C
	adds r1, r6, 0x7
	asrs r1, 3
	subs r1, 0x1
	b _08072E28
	.align 2, 0
_08072E14: .4byte gMenuWindowPtr
_08072E18: .4byte gMenuTextTileOffset
_08072E1C:
	adds r3, r6, r3
	subs r1, r3, 0x1
	cmp r1, 0
	bge _08072E26
	adds r1, r3, 0x6
_08072E26:
	asrs r1, 3
_08072E28:
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
	bcs _08072E5A
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
_08072E5A:
	add sp, 0x10
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8072AB0

	thumb_func_start MenuPrint_RightAligned
MenuPrint_RightAligned: @ 8072E64
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r3, r1, 0
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08072E90
	ldr r0, [r0]
	ldr r1, _08072E94
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
_08072E90: .4byte gMenuWindowPtr
_08072E94: .4byte gMenuTextTileOffset
	thumb_func_end MenuPrint_RightAligned

	thumb_func_start sub_8072B80
sub_8072B80: @ 8072E98
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
	ldr r4, _08072EE8
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
	ldr r1, _08072EEC
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
_08072EE8: .4byte gMenuWindowPtr
_08072EEC: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072B80

	thumb_func_start sub_8072BD8
sub_8072BD8: @ 8072EF0
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
	ldr r0, _08072F24
	ldr r0, [r0]
	ldr r1, _08072F28
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
_08072F24: .4byte gMenuWindowPtr
_08072F28: .4byte gMenuTextTileOffset
	thumb_func_end sub_8072BD8

	thumb_func_start sub_8072C14
sub_8072C14: @ 8072F2C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072F58
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
_08072F58: .4byte gMenuWindowPtr
	thumb_func_end sub_8072C14

	thumb_func_start sub_8072C44
sub_8072C44: @ 8072F5C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072F88
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
_08072F88: .4byte gMenuWindowPtr
	thumb_func_end sub_8072C44

	thumb_func_start sub_8072C74
sub_8072C74: @ 8072F8C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08072FB8
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
_08072FB8: .4byte gMenuWindowPtr
	thumb_func_end sub_8072C74

	thumb_func_start sub_8072CA4
sub_8072CA4: @ 8072FBC
	push {lr}
	adds r1, r0, 0
	ldr r0, _08072FD0
	ldr r0, [r0]
	bl GetStringWidth
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08072FD0: .4byte gMenuWindowPtr
	thumb_func_end sub_8072CA4

	thumb_func_start sub_8072CBC
sub_8072CBC: @ 8072FD4
	push {lr}
	ldr r0, _08072FE8
	ldr r0, [r0]
	bl sub_8004E24
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08072FE8: .4byte gMenuWindowPtr
	thumb_func_end sub_8072CBC

	thumb_func_start sub_8072CD4
sub_8072CD4: @ 8072FEC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08073008
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8004E28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073008: .4byte gMenuWindowPtr
	thumb_func_end sub_8072CD4

	thumb_func_start MenuUpdateWindowText_OverrideLineLength
MenuUpdateWindowText_OverrideLineLength: @ 807300C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08073020
	ldr r0, [r0]
	bl sub_80037C8
	pop {r1}
	bx r1
	.align 2, 0
_08073020: .4byte gMenuWindowPtr
	thumb_func_end MenuUpdateWindowText_OverrideLineLength

	thumb_func_start unref_sub_8072D0C
unref_sub_8072D0C: @ 8073024
	ldr r0, _0807302C
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0807302C: .4byte gMenuWindowPtr
	thumb_func_end unref_sub_8072D0C

	thumb_func_start sub_8072D18
sub_8072D18: @ 8073030
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08073050
	ldr r3, _08073054
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
InitMenu: @ 8073058
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
	beq _08073084
	bl sub_8072D18
_08073084:
	ldr r1, _080730BC
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
	blt _080730A4
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _080730A6
_080730A4:
	movs r4, 0
_080730A6:
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
_080730BC: .4byte 0x030006b0
	thumb_func_end InitMenu

	thumb_func_start RedrawMenuCursor
RedrawMenuCursor: @ 80730C0
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
unref_sub_8072DC0: @ 80730D8
	push {lr}
	bl sub_814A904
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8072DC0

	thumb_func_start sub_8072DCC
sub_8072DCC: @ 80730E4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_814A958
	pop {r0}
	bx r0
	thumb_func_end sub_8072DCC

	thumb_func_start sub_8072DDC
sub_8072DDC: @ 80730F4
	push {lr}
	lsls r0, 27
	lsrs r0, 24
	bl sub_8072DCC
	pop {r0}
	bx r0
	thumb_func_end sub_8072DDC

	thumb_func_start sub_8072DEC
sub_8072DEC: @ 8073104
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
	ldr r4, _08073134
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
	ldr r4, _080731B4
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