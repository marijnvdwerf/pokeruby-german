	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F890C
sub_80F890C: @ 80F890C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r2, _080F8958 @ =0x02000000
	adds r1, r2, 0
	adds r1, 0xFF
	movs r0, 0x5
	strb r0, [r1]
	adds r0, 0xFB
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x82
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, _080F895C @ =ConvertEasyChatWordsToString
	str r0, [r1]
	movs r0, 0x84
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, _080F8960 @ =sub_80EB544
	str r0, [r1]
	ldrh r1, [r4, 0x20]
	adds r0, r1, 0
	subs r0, 0x79
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB
	bhi _080F8964
	subs r1, 0x79
	adds r0, r2, 0
	adds r0, 0xFA
	strb r1, [r0]
	b _080F896E
	.align 2, 0
_080F8958: .4byte 0x02000000
_080F895C: .4byte ConvertEasyChatWordsToString
_080F8960: .4byte sub_80EB544
_080F8964:
	adds r1, r2, 0
	adds r1, 0xFA
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
_080F896E:
	ldr r1, _080F8994 @ =0x02000000
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8980
	cmp r0, 0x1
	beq _080F899C
_080F8980:
	movs r0, 0x86
	lsls r0, 1
	adds r2, r1, r0
	adds r0, r1, 0
	adds r0, 0xFA
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _080F8998 @ =gUnknown_083E5730
	b _080F89AC
	.align 2, 0
_080F8994: .4byte 0x02000000
_080F8998: .4byte gUnknown_083E5730
_080F899C:
	movs r0, 0x86
	lsls r0, 1
	adds r2, r1, r0
	adds r0, r1, 0
	adds r0, 0xFA
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _080F89DC @ =gUnknown_083E57A4
_080F89AC:
	adds r0, r1
	str r0, [r2]
	ldrh r0, [r4, 0x1E]
	mov r1, sp
	bl sub_80A2D64
	lsls r0, 16
	ldr r1, _080F89E0 @ =0xffff0000
	adds r0, r1
	movs r1, 0xCD
	lsls r1, 17
	cmp r0, r1
	bhi _080F89F8
	ldr r0, _080F89E4 @ =0x02000000
	adds r1, r0, 0
	adds r1, 0xFA
	ldrb r2, [r1]
	adds r1, r0, 0
	cmp r2, 0x6
	beq _080F89E8
	cmp r2, 0x9
	beq _080F89F0
	b _080F89FA
	.align 2, 0
_080F89DC: .4byte gUnknown_083E57A4
_080F89E0: .4byte 0xffff0000
_080F89E4: .4byte 0x02000000
_080F89E8:
	adds r2, r1, 0
	adds r2, 0xFB
	movs r0, 0x1
	b _080F8A00
_080F89F0:
	adds r2, r1, 0
	adds r2, 0xFB
	movs r0, 0x2
	b _080F8A00
_080F89F8:
	ldr r1, _080F8A20 @ =0x02000000
_080F89FA:
	adds r2, r1, 0
	adds r2, 0xFB
	movs r0, 0
_080F8A00:
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xF4
	str r4, [r0]
	subs r0, 0x8
	str r6, [r0]
	adds r0, 0xC
	strb r5, [r0]
	ldr r0, _080F8A24 @ =sub_80F8D50
	bl SetMainCallback2
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8A20: .4byte 0x02000000
_080F8A24: .4byte sub_80F8D50
	thumb_func_end sub_80F890C

	thumb_func_start sub_80F8A28
sub_80F8A28: @ 80F8DD8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080F8DF4 @ =gMain
	ldr r1, _080F8DF8 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _080F8DEA
	b _080F90EC
_080F8DEA:
	lsls r0, 2
	ldr r1, _080F8DFC @ =_080F8E00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8DF4: .4byte gMain
_080F8DF8: .4byte 0x0000043c
_080F8DFC: .4byte _080F8E00
	.align 2, 0
_080F8E00:
	.4byte _080F8E4C
	.4byte _080F8E60
	.4byte _080F8E78
	.4byte _080F8E7E
	.4byte _080F8E84
	.4byte _080F8E8A
	.4byte _080F8EC0
	.4byte _080F8ECC
	.4byte _080F8ED8
	.4byte _080F8EE4
	.4byte _080F8EEA
	.4byte _080F8F04
	.4byte _080F8F28
	.4byte _080F8F50
	.4byte _080F8FC4
	.4byte _080F8FDC
	.4byte _080F9008
	.4byte _080F906C
	.4byte _080F9076
_080F8E4C:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	b _080F90E0
_080F8E60:
	add r1, sp, 0x4
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _080F8E74 @ =0x01000200
	add r0, sp, 0x4
	bl CpuSet
	b _080F90E0
	.align 2, 0
_080F8E74: .4byte 0x01000200
_080F8E78:
	bl ResetPaletteFade
	b _080F90E0
_080F8E7E:
	bl ResetTasks
	b _080F90E0
_080F8E84:
	bl ResetSpriteData
	b _080F90E0
_080F8E8A:
	bl FreeAllSpritePalettes
	ldr r0, _080F8EBC @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x32
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _080F90E0
	.align 2, 0
_080F8EBC: .4byte REG_BG0HOFS
_080F8EC0:
	ldr r0, _080F8EC8 @ =gWindowConfig_81E6DFC
	bl SetUpWindowConfig
	b _080F90E0
	.align 2, 0
_080F8EC8: .4byte gWindowConfig_81E6DFC
_080F8ECC:
	ldr r0, _080F8ED4 @ =gWindowConfig_81E6DFC
	bl MultistepInitMenuWindowBegin
	b _080F90E0
	.align 2, 0
_080F8ED4: .4byte gWindowConfig_81E6DFC
_080F8ED8:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F8EE2
	b _080F90E0
_080F8EE2:
	b _080F90EC
_080F8EE4:
	bl MenuZeroFillScreen
	b _080F90E0
_080F8EEA:
	mov r0, sp
	adds r0, 0x6
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _080F8EFC @ =0x06004800
	ldr r2, _080F8F00 @ =0x01000400
	bl CpuSet
	b _080F90E0
	.align 2, 0
_080F8EFC: .4byte 0x06004800
_080F8F00: .4byte 0x01000400
_080F8F04:
	ldr r2, _080F8F20 @ =gMailGraphicsTable
	ldr r0, _080F8F24 @ =0x02000000
	adds r0, 0xFA
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _080F90E0
	.align 2, 0
_080F8F20: .4byte gMailGraphicsTable
_080F8F24: .4byte 0x02000000
_080F8F28:
	ldr r2, _080F8F44 @ =gMailGraphicsTable
	ldr r0, _080F8F48 @ =0x02000000
	adds r0, 0xFA
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, _080F8F4C @ =0x06004000
	bl LZ77UnCompVram
	b _080F90E0
	.align 2, 0
_080F8F44: .4byte gMailGraphicsTable
_080F8F48: .4byte 0x02000000
_080F8F4C: .4byte 0x06004000
_080F8F50:
	ldr r5, _080F8FB0 @ =gMailGraphicsTable
	ldr r4, _080F8FB4 @ =0x02000000
	adds r4, 0xFA
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r3, _080F8FB8 @ =gPlttBufferUnfaded
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x10]
	movs r2, 0xF1
	lsls r2, 1
	adds r1, r3, r2
	strh r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x12]
	adds r2, 0xE
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080F8FBC @ =gUnknown_083E562C
	ldr r2, _080F8FC0 @ =gSaveBlock2
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3, 0x14]
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3, 0x16]
	b _080F90E0
	.align 2, 0
_080F8FB0: .4byte gMailGraphicsTable
_080F8FB4: .4byte 0x02000000
_080F8FB8: .4byte gPlttBufferUnfaded
_080F8FBC: .4byte gUnknown_083E562C
_080F8FC0: .4byte gSaveBlock2
_080F8FC4:
	ldr r0, _080F8FD8 @ =0x02000000
	adds r0, 0xF8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8FD0
	b _080F90E0
_080F8FD0:
	bl sub_80F8DA0
	b _080F90E0
	.align 2, 0
_080F8FD8: .4byte 0x02000000
_080F8FDC:
	ldr r0, _080F8FFC @ =0x02000000
	adds r0, 0xF8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F8FEA
	bl sub_80F8E80
_080F8FEA:
	ldr r0, _080F9000 @ =sub_80F8F18
	bl SetVBlankCallback
	ldr r2, _080F9004 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	b _080F90E0
	.align 2, 0
_080F8FFC: .4byte 0x02000000
_080F9000: .4byte sub_80F8F18
_080F9004: .4byte gPaletteFade
_080F9008:
	ldr r5, _080F902C @ =0x02000000
	adds r0, r5, 0
	adds r0, 0xF4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1E]
	bl sub_809D4A8
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, 0
	adds r0, 0xFB
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080F9030
	cmp r0, 0x2
	beq _080F9048
	b _080F90E0
	.align 2, 0
_080F902C: .4byte 0x02000000
_080F9030:
	adds r0, r4, 0
	bl sub_809D580
	ldr r1, _080F9044 @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x60
	b _080F9058
	.align 2, 0
_080F9044: .4byte SpriteCallbackDummy
_080F9048:
	adds r0, r4, 0
	bl sub_809D580
	ldr r1, _080F9068 @ =SpriteCallbackDummy
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x28
_080F9058:
	movs r3, 0x80
	bl sub_809D3A4
	adds r1, r5, 0
	adds r1, 0xFC
	strb r0, [r1]
	b _080F90E0
	.align 2, 0
_080F9068: .4byte SpriteCallbackDummy
_080F906C:
	bl sub_8055870
	cmp r0, 0x1
	bne _080F90E0
	b _080F90EC
_080F9076:
	ldr r1, _080F90C4 @ =REG_BG0CNT
	ldr r2, _080F90C8 @ =0x00009f08
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F90CC @ =0x00000801
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F90D0 @ =0x00000902
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	movs r0, 0
	strh r0, [r1]
	subs r1, 0x50
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _080F90D4 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _080F90D8 @ =0x02000000
	adds r0, 0xF0
	ldr r1, _080F90DC @ =sub_80F8F58
	str r1, [r0]
	movs r0, 0x1
	b _080F90EE
	.align 2, 0
_080F90C4: .4byte REG_BG0CNT
_080F90C8: .4byte 0x00009f08
_080F90CC: .4byte 0x00000801
_080F90D0: .4byte 0x00000902
_080F90D4: .4byte gPaletteFade
_080F90D8: .4byte 0x02000000
_080F90DC: .4byte sub_80F8F58
_080F90E0:
	ldr r1, _080F90F8 @ =gMain
	ldr r0, _080F90FC @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F90EC:
	movs r0, 0
_080F90EE:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F90F8: .4byte gMain
_080F90FC: .4byte 0x0000043c
	thumb_func_end sub_80F8A28

	thumb_func_start sub_80F8D50
sub_80F8D50: @ 80F8D50
	push {lr}
_080F8D52:
	bl sub_80F8A28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8D6C
	ldr r0, _080F8D68 @ =sub_80F8F2C
	bl SetMainCallback2
	b _080F8D78
	.align 2, 0
_080F8D68: .4byte sub_80F8F2C
_080F8D6C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F8D52
_080F8D78:
	pop {r0}
	bx r0
	thumb_func_end sub_80F8D50

	thumb_func_start sub_80F8D7C
sub_80F8D7C: @ 80F8D7C
	push {r4,lr}
	adds r4, r0, 0
	bl StringCopy
	adds r0, r4, 0
	bl sub_814A568
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	adds r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8D7C

	thumb_func_start sub_80F8DA0
sub_80F8DA0: @ 80F9150
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r5, 0
	ldr r2, _080F91EC @ =0x02000000
	movs r0, 0x86
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080F91B4
	mov r8, r2
	adds r7, r1, 0
_080F916E:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	subs r0, r5
	add r0, r8
	mov r1, r8
	adds r1, 0xF4
	lsls r2, r6, 1
	ldr r1, [r1]
	adds r1, r2
	ldr r2, [r7]
	ldr r2, [r2, 0x4]
	lsls r4, r5, 2
	adds r2, r4, r2
	ldr r2, [r2]
	lsls r2, 28
	lsrs r2, 30
	movs r3, 0x1
	bl sub_80EB544
	ldr r1, [r7]
	ldr r0, [r1, 0x4]
	adds r4, r0
	ldr r0, [r4]
	lsls r0, 28
	lsrs r0, 30
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r1, [r1]
	cmp r5, r1
	bcc _080F916E
_080F91B4:
	ldr r2, _080F91F0 @ =0x020000d8
	adds r4, r2, 0
	subs r4, 0xD8
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F91F8
	ldr r1, [r2, 0x1C]
	adds r1, 0x12
	adds r0, r2, 0
	bl sub_80F8D7C
	adds r2, r0, 0
	ldr r1, _080F91F4 @ =gOtherText_From
	bl StringCopy
	ldr r0, _080F91F0 @ =0x020000d8
	bl StringLength
	movs r2, 0x86
	lsls r2, 1
	adds r1, r4, r2
	ldr r1, [r1]
	ldrb r1, [r1, 0x2]
	subs r1, r0
	b _080F921A
	.align 2, 0
_080F91EC: .4byte 0x02000000
_080F91F0: .4byte 0x020000d8
_080F91F4: .4byte gOtherText_From
_080F91F8:
	ldr r1, _080F922C @ =gOtherText_From
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	adds r0, r4, 0
	adds r0, 0xF4
	ldr r1, [r0]
	adds r1, 0x12
	adds r0, r2, 0
	bl sub_80F8D7C
	movs r1, 0x86
	lsls r1, 1
	adds r0, r4, r1
	ldr r0, [r0]
	ldrb r1, [r0, 0x2]
_080F921A:
	adds r0, r4, 0
	adds r0, 0xF9
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F922C: .4byte gOtherText_From
	thumb_func_end sub_80F8DA0

	thumb_func_start sub_80F8E80
sub_80F8E80: @ 80F9230
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	movs r4, 0
	ldr r1, _080F92C0 @ =0x02000000
	movs r0, 0x86
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080F92A6
	mov r8, r1
	adds r7, r2, 0
_080F924E:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	subs r0, r4
	mov r1, r8
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _080F9298
	cmp r0, 0
	beq _080F9298
	ldr r2, [r7]
	ldr r1, [r2, 0x4]
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r3, r0, 24
	lsrs r3, 28
	lsls r0, 30
	lsrs r0, 30
	adds r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r2, 0x3]
	lsrs r1, r2, 4
	adds r1, r3
	lsls r2, 28
	lsrs r2, 28
	adds r2, r6, r2
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r6, r0, 24
_080F9298:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r7]
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080F924E
_080F92A6:
	ldr r0, _080F92C4 @ =0x020000d8
	adds r1, r0, 0
	adds r1, 0x21
	ldrb r1, [r1]
	ldr r2, [r0, 0x34]
	ldrb r2, [r2, 0x1]
	bl MenuPrint
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F92C0: .4byte 0x02000000
_080F92C4: .4byte 0x020000d8
	thumb_func_end sub_80F8E80

	thumb_func_start sub_80F8F18
sub_80F8F18: @ 80F92C8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80F8F18

	thumb_func_start sub_80F8F2C
sub_80F8F2C: @ 80F92DC
	push {r4,lr}
	ldr r4, _080F9304 @ =0x02000000
	adds r0, r4, 0
	adds r0, 0xFB
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F92F2
	bl AnimateSprites
	bl BuildOamBuffer
_080F92F2:
	adds r0, r4, 0
	adds r0, 0xF0
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9304: .4byte 0x02000000
	thumb_func_end sub_80F8F2C

	thumb_func_start sub_80F8F58
sub_80F8F58: @ 80F9308
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080F931C
	ldr r0, _080F9320 @ =0x02000000
	adds r0, 0xF0
	ldr r1, _080F9324 @ =sub_80F8F78
	str r1, [r0]
_080F931C:
	pop {r0}
	bx r0
	.align 2, 0
_080F9320: .4byte 0x02000000
_080F9324: .4byte sub_80F8F78
	thumb_func_end sub_80F8F58

	thumb_func_start sub_80F8F78
sub_80F8F78: @ 80F9328
	push {lr}
	sub sp, 0x4
	ldr r0, _080F9358 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080F9350
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080F935C @ =0x02000000
	adds r0, 0xF0
	ldr r1, _080F9360 @ =sub_80F8FB4
	str r1, [r0]
_080F9350:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9358: .4byte gMain
_080F935C: .4byte 0x02000000
_080F9360: .4byte sub_80F8FB4
	thumb_func_end sub_80F8F78

	thumb_func_start sub_80F8FB4
sub_80F8FB4: @ 80F9364
	push {r4,lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080F93C2
	ldr r4, _080F93C8 @ =0x02000000
	adds r0, r4, 0
	adds r0, 0xEC
	ldr r0, [r0]
	bl SetMainCallback2
	adds r0, r4, 0
	adds r0, 0xFB
	ldrb r0, [r0]
	cmp r0, 0x2
	bgt _080F93B2
	cmp r0, 0x1
	blt _080F93B2
	adds r0, r4, 0
	adds r0, 0xF4
	ldr r0, [r0]
	ldrh r0, [r0, 0x1E]
	bl sub_809D4A8
	lsls r0, 16
	lsrs r0, 16
	bl sub_809D608
	adds r0, r4, 0
	adds r0, 0xFC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F93CC @ =gSprites
	adds r0, r1
	bl sub_809D510
_080F93B2:
	ldr r0, _080F93C8 @ =0x02000000
	movs r2, 0x88
	lsls r2, 1
	movs r1, 0
	bl memset
	bl ResetPaletteFade
_080F93C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F93C8: .4byte 0x02000000
_080F93CC: .4byte gSprites
	thumb_func_end sub_80F8FB4

	.align 2, 0 @ Don't pad with nop.
