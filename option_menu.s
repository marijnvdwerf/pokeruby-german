	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CB2_InitOptionMenu
CB2_InitOptionMenu: @ 808BA90
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r0, _0808BAB0
	ldr r1, _0808BAB4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _0808BAE4
	lsls r0, 2
	ldr r1, _0808BAB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808BAB0: .4byte gMain
_0808BAB4: .4byte 0x0000043c
_0808BAB8: .4byte _0808BABC
	.align 2, 0
_0808BABC:
	.4byte _0808BAE4
	.4byte _0808BBAC
	.4byte _0808BBBE
	.4byte _0808BBD8
	.4byte _0808BBE4
	.4byte _0808BC00
	.4byte _0808BC24
	.4byte _0808BC44
	.4byte _0808BCC8
	.4byte _0808BE00
_0808BAE4:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x10
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r2, sp, 0x8
	mov r8, r2
	add r2, sp, 0x4
	movs r6, 0
	ldr r1, _0808BB9C
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0808BBA0
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0808BB34:
	strh r6, [r2]
	add r0, sp, 0x4
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0808BB34
	strh r6, [r2]
	add r2, sp, 0x4
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x8]
	ldr r2, _0808BB9C
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _0808BBA4
	ldr r2, _0808BBA8
	adds r1, r2
	b _0808BDB6
	.align 2, 0
_0808BB9C: .4byte 0x040000d4
_0808BBA0: .4byte 0x81000800
_0808BBA4: .4byte gMain
_0808BBA8: .4byte 0x0000043c
_0808BBAC:
	bl ResetPaletteFade
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	b _0808BDB0
_0808BBBE:
	ldr r0, _0808BBCC
	bl SetUpWindowConfig
	ldr r1, _0808BBD0
	ldr r2, _0808BBD4
	adds r1, r2
	b _0808BDB6
	.align 2, 0
_0808BBCC: .4byte gWindowConfig_81E71B4
_0808BBD0: .4byte gMain
_0808BBD4: .4byte 0x0000043c
_0808BBD8:
	ldr r0, _0808BBE0
	bl MultistepInitMenuWindowBegin
	b _0808BDB0
	.align 2, 0
_0808BBE0: .4byte gWindowConfig_81E71B4
_0808BBE4:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0808BBEE
	b _0808BE06
_0808BBEE:
	ldr r1, _0808BBF8
	ldr r2, _0808BBFC
	adds r1, r2
	b _0808BDB6
	.align 2, 0
_0808BBF8: .4byte gMain
_0808BBFC: .4byte 0x0000043c
_0808BC00:
	ldr r0, _0808BC18
	movs r1, 0x80
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0808BC1C
	ldr r1, _0808BC20
	movs r2, 0x20
	bl CpuSet
	b _0808BDB0
	.align 2, 0
_0808BC18: .4byte gUnknown_0839F5FC
_0808BC1C: .4byte gUnknown_0839F63C
_0808BC20: .4byte 0x0600bee0
_0808BC24:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0808BC3C
	ldr r2, _0808BC40
	adds r1, r2
	b _0808BDB6
	.align 2, 0
_0808BC3C: .4byte gMain
_0808BC40: .4byte 0x0000043c
_0808BC44:
	ldr r0, _0808BCA4
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	ldr r1, _0808BCA8
	ldr r2, _0808BCAC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xE1
	strh r0, [r1]
	ldr r0, _0808BCB0
	strh r4, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	ldr r3, _0808BCB4
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0808BCB8
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0808BCBC
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808BCC0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0808BCC4
	adds r0, r2, 0
	strh r0, [r1]
	b _0808BDB0
	.align 2, 0
_0808BCA4: .4byte 0x04000040
_0808BCA8: .4byte 0x04000048
_0808BCAC: .4byte 0x00001111
_0808BCB0: .4byte 0x04000052
_0808BCB4: .4byte 0x04000208
_0808BCB8: .4byte 0x04000200
_0808BCBC: .4byte 0x04000004
_0808BCC0: .4byte _0808BA7C
_0808BCC4: .4byte 0x00007140
_0808BCC8:
	ldr r0, _0808BDC0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808BDC4
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r1, _0808BDC8
	ldrb r0, [r1, 0x14]
	lsls r0, 29
	lsrs r0, 29
	strh r0, [r4, 0xA]
	ldrb r0, [r1, 0x15]
	lsls r0, 29
	lsrs r0, 31
	strh r0, [r4, 0xC]
	ldrb r0, [r1, 0x15]
	lsls r0, 30
	lsrs r0, 31
	strh r0, [r4, 0xE]
	ldrb r0, [r1, 0x15]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r4, 0x10]
	ldrb r0, [r1, 0x13]
	strh r0, [r4, 0x12]
	ldrb r0, [r1, 0x14]
	lsrs r0, 3
	strh r0, [r4, 0x14]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x1B
	movs r3, 0x3
	bl MenuDrawTextWindow
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0808BDCC
	movs r1, 0x4
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _0808BDD0
	movs r1, 0x4
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _0808BDD4
	movs r1, 0x4
	movs r2, 0x7
	bl MenuPrint
	ldr r0, _0808BDD8
	movs r1, 0x4
	movs r2, 0x9
	bl MenuPrint
	ldr r0, _0808BDDC
	movs r1, 0x4
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _0808BDE0
	movs r1, 0x4
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0808BDE4
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _0808BDE8
	movs r1, 0x4
	movs r2, 0x11
	bl MenuPrint
	ldrb r0, [r4, 0xA]
	bl TextSpeed_DrawChoices
	ldrb r0, [r4, 0xC]
	bl BattleScene_DrawChoices
	ldrb r0, [r4, 0xE]
	bl BattleStyle_DrawChoices
	ldrb r0, [r4, 0x10]
	bl Sound_DrawChoices
	ldrb r0, [r4, 0x12]
	bl ButtonMode_DrawChoices
	ldrb r0, [r4, 0x14]
	bl FrameType_DrawChoices
	ldr r1, _0808BDEC
	ldr r2, _0808BDF0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _0808BDF4
	adds r0, r2, 0
	strh r0, [r1]
	ldrb r0, [r4, 0x8]
	bl HighlightOptionMenuItem
_0808BDB0:
	ldr r1, _0808BDF8
	ldr r0, _0808BDFC
	adds r1, r0
_0808BDB6:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808BE06
	.align 2, 0
_0808BDC0: .4byte Task_OptionMenuFadeIn
_0808BDC4: .4byte gTasks
_0808BDC8: .4byte gSaveBlock2
_0808BDCC: .4byte gSystemText_OptionMenu
_0808BDD0: .4byte gSystemText_TextSpeed
_0808BDD4: .4byte gSystemText_BattleScene
_0808BDD8: .4byte gSystemText_BattleStyle
_0808BDDC: .4byte gSystemText_Sound
_0808BDE0: .4byte gSystemText_ButtonMode
_0808BDE4: .4byte gSystemText_Frame
_0808BDE8: .4byte gSystemText_Cancel
_0808BDEC: .4byte 0x04000040
_0808BDF0: .4byte 0x000011df
_0808BDF4: .4byte 0x0000011f
_0808BDF8: .4byte gMain
_0808BDFC: .4byte 0x0000043c
_0808BE00:
	ldr r0, _0808BE14
	bl SetMainCallback2
_0808BE06:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BE14: .4byte _0808BA64
	thumb_func_end CB2_InitOptionMenu

	thumb_func_start Task_OptionMenuFadeIn
Task_OptionMenuFadeIn: @ 808BE18
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808BE3C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808BE38
	ldr r0, _0808BE40
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808BE44
	str r0, [r1]
_0808BE38:
	pop {r0}
	bx r0
	.align 2, 0
_0808BE3C: .4byte gPaletteFade
_0808BE40: .4byte gTasks
_0808BE44: .4byte Task_OptionMenuProcessInput
	thumb_func_end Task_OptionMenuFadeIn

	thumb_func_start Task_OptionMenuProcessInput
Task_OptionMenuProcessInput: @ 808BE48
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808BE70
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808BE78
	ldr r0, _0808BE74
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	beq _0808BE6E
	b _0808BFCE
_0808BE6E:
	b _0808BE8A
	.align 2, 0
_0808BE70: .4byte gMain
_0808BE74: .4byte gTasks
_0808BE78:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808BE98
	ldr r0, _0808BE90
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
_0808BE8A:
	ldr r0, _0808BE94
	str r0, [r1]
	b _0808BFCE
	.align 2, 0
_0808BE90: .4byte gTasks
_0808BE94: .4byte Task_OptionMenuSave
_0808BE98:
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _0808BEC8
	ldr r1, _0808BEC0
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r5, [r3, 0x8]
	movs r6, 0x8
	ldrsh r0, [r3, r6]
	adds r7, r1, 0
	cmp r0, 0
	ble _0808BEC4
	subs r0, r5, 0x1
	b _0808BEE8
	.align 2, 0
_0808BEC0: .4byte gTasks
_0808BEC4:
	movs r0, 0x6
	b _0808BEE8
_0808BEC8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0808BF00
	ldr r1, _0808BEEC
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r5, [r3, 0x8]
	movs r7, 0x8
	ldrsh r0, [r3, r7]
	adds r7, r1, 0
	cmp r0, 0x5
	bgt _0808BEF0
	adds r0, r5, 0x1
_0808BEE8:
	strh r0, [r3, 0x8]
	b _0808BEF2
	.align 2, 0
_0808BEEC: .4byte gTasks
_0808BEF0:
	strh r6, [r3, 0x8]
_0808BEF2:
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r7
	ldrb r0, [r0, 0x8]
	bl HighlightOptionMenuItem
	b _0808BFCE
_0808BF00:
	ldr r0, _0808BF20
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r7, r0, 0
	cmp r1, 0x5
	bhi _0808BFCE
	lsls r0, r1, 2
	ldr r1, _0808BF24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808BF20: .4byte gTasks
_0808BF24: .4byte _0808BF28
	.align 2, 0
_0808BF28:
	.4byte _0808BF40
	.4byte _0808BF58
	.4byte _0808BF70
	.4byte _0808BF88
	.4byte _0808BFA0
	.4byte _0808BFB8
_0808BF40:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0xA]
	bl TextSpeed_ProcessInput
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	bl TextSpeed_DrawChoices
	b _0808BFCE
_0808BF58:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0xC]
	bl BattleScene_ProcessInput
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	bl BattleScene_DrawChoices
	b _0808BFCE
_0808BF70:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0xE]
	bl BattleStyle_ProcessInput
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xE]
	bl BattleStyle_DrawChoices
	b _0808BFCE
_0808BF88:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0x10]
	bl Sound_ProcessInput
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x10]
	bl Sound_DrawChoices
	b _0808BFCE
_0808BFA0:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0x12]
	bl ButtonMode_ProcessInput
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	bl ButtonMode_DrawChoices
	b _0808BFCE
_0808BFB8:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0x14]
	bl FrameType_ProcessInput
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	bl FrameType_DrawChoices
_0808BFCE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Task_OptionMenuProcessInput

	thumb_func_start Task_OptionMenuSave
Task_OptionMenuSave: @ 808BFD4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0808C058
	ldr r1, _0808C05C
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x7
	ldrb r0, [r4, 0xA]
	ands r0, r1
	ldrb r1, [r5, 0x14]
	movs r3, 0x8
	negs r3, r3
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x14]
	movs r6, 0x1
	ldrb r0, [r4, 0xC]
	ands r0, r6
	lsls r0, 2
	ldrb r1, [r5, 0x15]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x15]
	ldrb r1, [r4, 0xE]
	ands r1, r6
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldrb r1, [r4, 0x10]
	ands r1, r6
	movs r2, 0x2
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldrh r0, [r4, 0x12]
	movs r2, 0
	strb r0, [r5, 0x13]
	ldrb r0, [r4, 0x14]
	lsls r0, 3
	movs r1, 0x7
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x14]
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808C060
	str r0, [r4]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C058: .4byte gSaveBlock2
_0808C05C: .4byte gTasks
_0808C060: .4byte Task_OptionMenuFadeOut
	thumb_func_end Task_OptionMenuSave

	thumb_func_start Task_OptionMenuFadeOut
Task_OptionMenuFadeOut: @ 808C064
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808C088
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808C084
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _0808C08C
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0808C084:
	pop {r0}
	bx r0
	.align 2, 0
_0808C088: .4byte gPaletteFade
_0808C08C: .4byte gMain
	thumb_func_end Task_OptionMenuFadeOut

	thumb_func_start HighlightOptionMenuItem
HighlightOptionMenuItem: @ 808C090
	lsls r0, 24
	ldr r2, _0808C0AC
	ldr r3, _0808C0B0
	adds r1, r3, 0
	strh r1, [r2]
	adds r2, 0x4
	lsrs r0, 20
	adds r1, r0, 0
	adds r1, 0x28
	lsls r1, 8
	adds r0, 0x38
	adds r1, r0
	strh r1, [r2]
	bx lr
	.align 2, 0
_0808C0AC: .4byte 0x04000042
_0808C0B0: .4byte 0x000018d7
	thumb_func_end HighlightOptionMenuItem

	thumb_func_start DrawOptionMenuChoice
DrawOptionMenuChoice: @ 808C0B4
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _0808C0EA
_0808C0D0:
	mov r7, sp
	adds r0, r7, r2
	strb r1, [r0]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _0808C0EA
	cmp r2, 0xE
	bls _0808C0D0
_0808C0EA:
	mov r0, sp
	strb r3, [r0, 0x2]
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawOptionMenuChoice

	thumb_func_start TextSpeed_ProcessInput
TextSpeed_ProcessInput: @ 808C108
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0808C128
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808C12E
	cmp r3, 0x1
	bhi _0808C12C
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808C12E
	.align 2, 0
_0808C128: .4byte gMain
_0808C12C:
	movs r3, 0
_0808C12E:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808C146
	cmp r3, 0
	beq _0808C144
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808C146
_0808C144:
	movs r3, 0x2
_0808C146:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end TextSpeed_ProcessInput

	thumb_func_start TextSpeed_DrawChoices
TextSpeed_DrawChoices: @ 808C14C
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808C194
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x28
	bl DrawOptionMenuChoice
	ldr r0, _0808C198
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xA1
	movs r2, 0x28
	bl DrawOptionMenuChoice
	ldr r0, _0808C19C
	mov r1, sp
	ldrb r3, [r1, 0x2]
	movs r1, 0xCA
	movs r2, 0x28
	bl DrawOptionMenuChoice
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808C194: .4byte gSystemText_Slow
_0808C198: .4byte gSystemText_Mid
_0808C19C: .4byte gSystemText_Fast
	thumb_func_end TextSpeed_DrawChoices

	thumb_func_start BattleScene_ProcessInput
BattleScene_ProcessInput: @ 808C1A0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808C1BC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0808C1B6
	movs r0, 0x1
	eors r2, r0
_0808C1B6:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808C1BC: .4byte gMain
	thumb_func_end BattleScene_ProcessInput

	thumb_func_start BattleScene_DrawChoices
BattleScene_DrawChoices: @ 808C1C0
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808C1F8
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x38
	bl DrawOptionMenuChoice
	ldr r0, _0808C1FC
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xBE
	movs r2, 0x38
	bl DrawOptionMenuChoice
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808C1F8: .4byte gSystemText_On
_0808C1FC: .4byte gSystemText_Off
	thumb_func_end BattleScene_DrawChoices

	thumb_func_start BattleStyle_ProcessInput
BattleStyle_ProcessInput: @ 808C200
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808C21C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0808C216
	movs r0, 0x1
	eors r2, r0
_0808C216:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808C21C: .4byte gMain
	thumb_func_end BattleStyle_ProcessInput

	thumb_func_start BattleStyle_DrawChoices
BattleStyle_DrawChoices: @ 808C220
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808C258
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x48
	bl DrawOptionMenuChoice
	ldr r0, _0808C25C
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xB2
	movs r2, 0x48
	bl DrawOptionMenuChoice
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808C258: .4byte gSystemText_Shift
_0808C25C: .4byte gSystemText_Set
	thumb_func_end BattleStyle_DrawChoices

	thumb_func_start Sound_ProcessInput
Sound_ProcessInput: @ 808C260
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808C284
	ldrh r1, [r0, 0x2E]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0808C27C
	movs r0, 0x1
	eors r4, r0
	adds r0, r4, 0
	bl SetPokemonCryStereo
_0808C27C:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808C284: .4byte gMain
	thumb_func_end Sound_ProcessInput

	thumb_func_start Sound_DrawChoices
Sound_DrawChoices: @ 808C288
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808C2C0
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x58
	bl DrawOptionMenuChoice
	ldr r0, _0808C2C4
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xAC
	movs r2, 0x58
	bl DrawOptionMenuChoice
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808C2C0: .4byte gSystemText_Mono
_0808C2C4: .4byte gSystemText_Stereo
	thumb_func_end Sound_DrawChoices

	thumb_func_start FrameType_ProcessInput
FrameType_ProcessInput: @ 808C2C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808C2E8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808C2F4
	cmp r4, 0x12
	bhi _0808C2EC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	b _0808C2EE
	.align 2, 0
_0808C2E8: .4byte gMain
_0808C2EC:
	movs r4, 0
_0808C2EE:
	adds r0, r4, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
_0808C2F4:
	ldr r0, _0808C30C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808C318
	cmp r4, 0
	beq _0808C310
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	b _0808C312
	.align 2, 0
_0808C30C: .4byte gMain
_0808C310:
	movs r4, 0x13
_0808C312:
	adds r0, r4, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
_0808C318:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FrameType_ProcessInput

	thumb_func_start FrameType_DrawChoices
FrameType_DrawChoices: @ 808C320
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r5, r0, 24
	ldr r1, _0808C368
	mov r0, sp
	bl StringCopy
	ldr r1, _0808C36C
	mov r0, sp
	bl StringAppend
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r1, r0, 0
	lsls r0, r1, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0808C370
	adds r0, r1, 0
	adds r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	b _0808C380
	.align 2, 0
_0808C368: .4byte gSystemText_Type
_0808C36C: .4byte gSystemText_Terminator
_0808C370:
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	strb r6, [r4]
_0808C380:
	adds r4, 0x1
	movs r0, 0xFF
	strb r0, [r4]
	mov r0, sp
	movs r1, 0xF
	movs r2, 0xF
	bl MenuPrint
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FrameType_DrawChoices

	thumb_func_start ButtonMode_ProcessInput
ButtonMode_ProcessInput: @ 808C398
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0808C3B8
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808C3BE
	cmp r3, 0x1
	bhi _0808C3BC
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808C3BE
	.align 2, 0
_0808C3B8: .4byte gMain
_0808C3BC:
	movs r3, 0
_0808C3BE:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808C3D6
	cmp r3, 0
	beq _0808C3D4
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808C3D6
_0808C3D4:
	movs r3, 0x2
_0808C3D6:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end ButtonMode_ProcessInput

	thumb_func_start ButtonMode_DrawChoices
ButtonMode_DrawChoices: @ 808C3DC
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808C424
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x68
	bl DrawOptionMenuChoice
	ldr r0, _0808C428
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xA6
	movs r2, 0x68
	bl DrawOptionMenuChoice
	ldr r0, _0808C42C
	mov r1, sp
	ldrb r3, [r1, 0x2]
	movs r1, 0xBC
	movs r2, 0x68
	bl DrawOptionMenuChoice
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808C424: .4byte gSystemText_Normal
_0808C428: .4byte gSystemText_LR
_0808C42C: .4byte gSystemText_LA
	thumb_func_end ButtonMode_DrawChoices

	.align 2, 0 @ Don't pad with nop.
