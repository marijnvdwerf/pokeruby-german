	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81150FC
sub_81150FC: @ 81154F4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08115518
	adds r1, r0, 0
	adds r1, 0xB8
	ldrb r0, [r1]
	cmp r0, 0
	beq _08115514
	adds r0, r1, 0
	bl task_tutorial_controls_fadein
_08115514:
	pop {r0}
	bx r0
	.align 2, 0
_08115518: .4byte 0x02019000
	thumb_func_end sub_81150FC

	thumb_func_start sub_8115124
sub_8115124: @ 811551C
	push {r4,lr}
	sub sp, 0x4
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8117434
	ldr r2, _08115580
	ldr r3, _08115584
	ldrh r1, [r3, 0x26]
	movs r4, 0x80
	lsls r4, 2
	adds r0, r4, 0
	subs r0, r1
	strh r0, [r2]
	ldrb r0, [r3, 0x1]
	cmp r0, 0
	beq _0811554C
	ldr r1, _08115588
	ldrh r0, [r3, 0x34]
	strh r0, [r1]
_0811554C:
	movs r1, 0x2A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08115568
	ldr r1, _0811558C
	ldr r0, _08115590
	str r0, [r1]
	ldr r0, _08115594
	str r0, [r1, 0x4]
	ldr r0, _08115598
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	strh r0, [r3, 0x2A]
_08115568:
	movs r2, 0x28
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	beq _0811559C
	cmp r0, 0x1
	ble _08115612
	cmp r0, 0x2
	beq _081155CC
	cmp r0, 0xFF
	beq _081155F0
	b _08115612
	.align 2, 0
_08115580: .4byte 0x04000014
_08115584: .4byte 0x02019000
_08115588: .4byte 0x04000052
_0811558C: .4byte 0x040000d4
_08115590: .4byte 0x02021b8c
_08115594: .4byte 0x060021c0
_08115598: .4byte 0x800001a0
_0811559C:
	ldr r1, _081155BC
	movs r4, 0xF8
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xCC
	ldr r0, _081155C0
	str r0, [r1]
	ldr r0, _081155C4
	str r0, [r1, 0x4]
	ldr r0, _081155C8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0x2
	b _08115610
	.align 2, 0
_081155BC: .4byte 0x04000008
_081155C0: .4byte 0x0202238c
_081155C4: .4byte 0x0600f9c0
_081155C8: .4byte 0x800001a0
_081155CC:
	ldr r1, _081155E0
	ldr r0, _081155E4
	str r0, [r1]
	ldr r0, _081155E8
	str r0, [r1, 0x4]
	ldr r0, _081155EC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _08115612
	.align 2, 0
_081155E0: .4byte 0x040000d4
_081155E4: .4byte 0x0202238c
_081155E8: .4byte 0x0600f9c0
_081155EC: .4byte 0x800001a0
_081155F0:
	ldr r1, _0811561C
	ldr r2, _08115620
	adds r0, r2, 0
	strh r0, [r1]
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08115624
	mov r4, sp
	str r4, [r1]
	ldr r0, _08115628
	str r0, [r1, 0x4]
	ldr r0, _0811562C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
_08115610:
	strh r0, [r3, 0x28]
_08115612:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811561C: .4byte 0x04000008
_08115620: .4byte 0x00001f08
_08115624: .4byte 0x040000d4
_08115628: .4byte 0x0600f9c0
_0811562C: .4byte 0x810001a0
	thumb_func_end sub_8115124

	thumb_func_start sub_8115238
sub_8115238: @ 8115630
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _081156B8
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r5, _081156BC
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r5, 0
	movs r1, 0
	bl memset
	ldr r0, _081156C0
	ldrh r2, [r0]
	movs r0, 0x1
	ands r0, r2
	ldrb r1, [r5, 0x4]
	movs r3, 0x4
	negs r3, r3
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x4]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0811566E
	movs r0, 0x80
	orrs r3, r0
	strb r3, [r5, 0x4]
_0811566E:
	ldr r3, _081156C4
	ldrb r2, [r5, 0x4]
	lsls r1, r2, 30
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x3]
	adds r4, r5, 0
	adds r4, 0x22
	strb r0, [r4]
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x4]
	adds r3, r5, 0
	adds r3, 0x23
	strb r0, [r3]
	ldr r0, _081156C8
	lsrs r1, 30
	lsls r2, 24
	lsrs r2, 31
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	ldrb r2, [r1]
	strb r2, [r5, 0x19]
	ldrb r1, [r5, 0x1A]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x1A]
	cmp r2, 0x1
	bne _081156D4
	ldr r4, _081156CC
	ldr r3, _081156D0
	mov r0, sp
	ldrh r2, [r0]
	b _081156DC
	.align 2, 0
_081156B8: .4byte gUnknown_083F8EC4
_081156BC: .4byte 0x02019000
_081156C0: .4byte gSpecialVar_0x8004
_081156C4: .4byte gUnknown_083F8DF4
_081156C8: .4byte gUnknown_083F8DF0
_081156CC: .4byte gPlttBufferUnfaded
_081156D0: .4byte gPlttBufferFaded
_081156D4:
	ldr r4, _08115740
	ldr r3, _08115744
	mov r0, sp
	ldrh r2, [r0, 0x2]
_081156DC:
	adds r0, r3, 0
	adds r0, 0xA2
	strh r2, [r0]
	ldr r1, _08115748
	adds r0, r1, 0
	ands r0, r2
	strh r0, [r3]
	ands r0, r1
	adds r2, r4, 0
	adds r2, 0xA2
	strh r0, [r2]
	ands r0, r1
	strh r0, [r4]
	ldr r0, _0811574C
	bl sub_8124918
	movs r4, 0
	ldr r5, _08115750
_08115700:
	lsls r2, r4, 3
	adds r2, r5
	ldr r0, _0811574C
	adds r1, r4, 0
	bl sub_812492C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xC
	bls _08115700
	movs r4, 0
	ldr r5, _08115754
_0811571A:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08115758
	adds r0, r1
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	beq _0811575C
	adds r0, 0x2
	cmp r1, r0
	bne _08115764
	ldrb r0, [r5, 0x2]
	movs r1, 0x1
	b _08115760
	.align 2, 0
_08115740: .4byte gPlttBufferUnfaded
_08115744: .4byte gPlttBufferFaded
_08115748: .4byte 0x0000ffff
_0811574C: .4byte 0x020190b8
_08115750: .4byte gUnknown_083F8E34
_08115754: .4byte 0x02019000
_08115758: .4byte gPlayerParty
_0811575C:
	ldrb r0, [r5, 0x2]
	movs r1, 0x2
_08115760:
	orrs r0, r1
	strb r0, [r5, 0x2]
_08115764:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0811571A
	bl RtcCalcLocalTime
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8115238

	thumb_func_start sub_8115384
sub_8115384: @ 811577C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0811579C
	ldr r2, _081157A0
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x7
	bls _08115790
	b _081159F6
_08115790:
	lsls r0, 2
	ldr r1, _081157A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811579C: .4byte gMain
_081157A0: .4byte 0x0000043c
_081157A4: .4byte _081157A8
	.align 2, 0
_081157A8:
	.4byte _081157C8
	.4byte _0811583C
	.4byte _08115858
	.4byte _0811588C
	.4byte _081158C4
	.4byte _081158F4
	.4byte _08115964
	.4byte _08115984
_081157C8:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	bl sub_80F9438
	bl sub_80F9368
	ldr r1, _08115818
	ldr r3, _0811581C
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08115820
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x46
	movs r3, 0x90
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08115824
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08115828
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0811582C
	ldr r1, _08115830
	bl LZ77UnCompVram
	ldr r1, _08115834
	ldr r3, _08115838
	adds r1, r3
	b _08115972
	.align 2, 0
_08115818: .4byte 0x0400000c
_0811581C: .4byte 0x00004686
_08115820: .4byte 0x00004401
_08115824: .4byte 0x0000060a
_08115828: .4byte gUnknown_08E8096C
_0811582C: .4byte gUnknown_08E81098
_08115830: .4byte 0x06004000
_08115834: .4byte gMain
_08115838: .4byte 0x0000043c
_0811583C:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	ldr r1, _08115850
	ldr r0, _08115854
	adds r1, r0
	b _08115972
	.align 2, 0
_08115850: .4byte gMain
_08115854: .4byte 0x0000043c
_08115858:
	ldr r0, _08115878
	bl SetUpWindowConfig
	ldr r0, _0811587C
	bl InitMenuWindow
	ldr r0, _08115880
	movs r2, 0xE0
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	ldr r1, _08115884
	ldr r2, _08115888
	adds r1, r2
	b _08115972
	.align 2, 0
_08115878: .4byte gWindowConfig_81E6C3C
_0811587C: .4byte gWindowConfig_81E6CE4
_08115880: .4byte gUnknown_083F86BC
_08115884: .4byte gMain
_08115888: .4byte 0x0000043c
_0811588C:
	bl sub_8115238
	bl sub_80F9020
	ldr r0, _081158AC
	ldr r1, _081158B0
	bl LZ77UnCompWram
	ldr r0, _081158B4
	ldr r1, _081158B8
	bl LZ77UnCompVram
	ldr r1, _081158BC
	ldr r3, _081158C0
	adds r1, r3
	b _08115972
	.align 2, 0
_081158AC: .4byte gUnknown_083F88BC
_081158B0: .4byte 0x02018800
_081158B4: .4byte gUnknown_083F8A60
_081158B8: .4byte 0x06003000
_081158BC: .4byte gMain
_081158C0: .4byte 0x0000043c
_081158C4:
	movs r0, 0
	bl sub_8117838
	bl sub_811857C
	bl sub_81184D8
	bl sub_8117F2C
	bl sub_8117900
	bl sub_8117BBC
	bl sub_8117DF4
	ldr r1, _081158EC
	ldr r0, _081158F0
	adds r1, r0
	b _08115972
	.align 2, 0
_081158EC: .4byte gMain
_081158F0: .4byte 0x0000043c
_081158F4:
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _08115948
	ldr r1, _0811594C
	adds r0, r1
	ldrh r0, [r0]
	bl sub_81180F4
	movs r0, 0x6
	bl sub_81182F8
	movs r0, 0
	bl sub_811829C
	movs r0, 0
	bl sub_8117158
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08115950
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08115954
	movs r2, 0x3C
	negs r2, r2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08115958
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0811595C
	ldr r3, _08115960
	adds r1, r3
	b _08115972
	.align 2, 0
_08115948: .4byte gSaveBlock1
_0811594C: .4byte 0x00000494
_08115950: .4byte gUnknown_081C4157
_08115954: .4byte gSpriteCoordOffsetX
_08115958: .4byte gSpriteCoordOffsetY
_0811595C: .4byte gMain
_08115960: .4byte 0x0000043c
_08115964:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0811597C
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08115980
	adds r1, r2, r0
_08115972:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081159F6
	.align 2, 0
_0811597C: .4byte 0x00001741
_08115980: .4byte 0x0000043c
_08115984:
	ldr r3, _08115A00
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08115A04
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08115A08
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08115A0C
	bl SetVBlankCallback
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r0, _08115A10
	movs r1, 0
	bl CreateTask
	ldr r4, _08115A14
	adds r1, r4, 0
	adds r1, 0xA4
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08115A18
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x14]
	ldr r0, _08115A1C
	ldr r2, _08115A20
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	ldr r0, _08115A24
	movs r1, 0x1
	bl CreateTask
	adds r4, 0xA5
	strb r0, [r4]
	ldr r0, _08115A28
	bl SetMainCallback2
_081159F6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115A00: .4byte 0x04000208
_08115A04: .4byte 0x04000200
_08115A08: .4byte 0x04000004
_08115A0C: .4byte sub_8115124
_08115A10: .4byte sub_81156BC
_08115A14: .4byte 0x02019000
_08115A18: .4byte gTasks
_08115A1C: .4byte gSaveBlock1
_08115A20: .4byte 0x00000494
_08115A24: .4byte sub_8115634
_08115A28: .4byte sub_81150FC
	thumb_func_end sub_8115384

	thumb_func_start sub_8115634
sub_8115634: @ 8115A2C
	push {r4-r6,lr}
	ldr r0, _08115AB0
	adds r3, r0, 0
	adds r3, 0x21
	ldrb r1, [r3]
	adds r2, r1, 0x1
	strb r2, [r3]
	adds r2, r0, 0
	adds r2, 0x23
	lsls r1, 24
	lsrs r1, 24
	adds r6, r0, 0
	ldrb r2, [r2]
	cmp r1, r2
	bne _08115A6C
	movs r0, 0
	strb r0, [r3]
	adds r2, r6, 0
	adds r2, 0x22
	ldrb r1, [r2]
	ldrh r0, [r6, 0x24]
	subs r0, r1
	strh r0, [r6, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _08115A6C
	ldrb r1, [r2]
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r6, 0x24]
_08115A6C:
	adds r4, r6, 0
	ldrh r0, [r4, 0x24]
	bl Sin2
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x24]
	bl Cos2
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0
	bge _08115A8C
	adds r0, 0xF
_08115A8C:
	lsls r0, 12
	lsrs r5, r0, 16
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0
	bge _08115A9A
	adds r0, 0xF
_08115A9A:
	asrs r0, 4
	strh r0, [r6, 0x32]
	strh r0, [r6, 0x2C]
	strh r5, [r6, 0x2E]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115AB0: .4byte 0x02019000
	thumb_func_end sub_8115634

	thumb_func_start sub_81156BC
sub_81156BC: @ 8115AB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08115B0E
	ldr r2, _08115B14
	ldrh r0, [r2]
	movs r5, 0x90
	lsls r5, 6
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08115B18
	ldr r2, _08115B1C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08115B20
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x14]
	adds r0, r4, 0
	bl sub_8116CAC
	bl sub_8116CF8
	bl sub_81185E8
	movs r0, 0
	bl sub_8117158
	movs r0, 0x6
	bl sub_81182F8
	ldr r1, _08115B24
	ldr r2, _08115B28
	adds r0, r4, 0
	movs r3, 0x3
	bl sub_8116C34
_08115B0E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115B14: .4byte 0x04000050
_08115B18: .4byte 0x04000052
_08115B1C: .4byte 0x00000808
_08115B20: .4byte gTasks
_08115B24: .4byte sub_81159BC
_08115B28: .4byte 0x0000ffff
	thumb_func_end sub_81156BC

	thumb_func_start sub_8115734
sub_8115734: @ 8115B2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08115B68
	bl sub_814AAF8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08115B6C
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08115B70
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115B68: .4byte 0x00002d9e
_08115B6C: .4byte gUnknown_081C41E3
_08115B70: .4byte gUnknown_083F8EBC
	thumb_func_end sub_8115734

	thumb_func_start sub_811577C
sub_811577C: @ 8115B74
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r1, _08115B9C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08115BA0
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115B9C: .4byte gTasks
_08115BA0: .4byte sub_81159BC
	thumb_func_end sub_811577C

	thumb_func_start sub_81157AC
sub_81157AC: @ 8115BA4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08115BC4
	adds r0, 0xA5
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0
	bl sub_8116AB0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08115BC4: .4byte 0x02019000
	thumb_func_end sub_81157AC

	thumb_func_start sub_81157D0
sub_81157D0: @ 8115BC8
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bhi _08115CC0
	lsls r0, r4, 2
	ldr r1, _08115BE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08115BE0: .4byte _08115BE4
	.align 2, 0
_08115BE4:
	.4byte _08115C24
	.4byte _08115C40
	.4byte _08115C40
	.4byte _08115C40
	.4byte _08115C40
	.4byte _08115C7C
	.4byte _08115CC0
	.4byte _08115CC0
	.4byte _08115CC0
	.4byte _08115CC0
	.4byte _08115C7C
	.4byte _08115CC0
	.4byte _08115CC0
	.4byte _08115CC0
	.4byte _08115CC0
	.4byte _08115C7C
_08115C24:
	ldr r0, _08115C3C
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	b _08115D10
	.align 2, 0
_08115C3C: .4byte 0x020221cc
_08115C40:
	lsls r0, r4, 1
	adds r0, r4
	adds r0, 0xE
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _08115C74
	movs r0, 0x10
	str r0, [sp]
	movs r4, 0xD
	str r4, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115C78
	movs r0, 0x3
	str r0, [sp]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	adds r2, r7, 0
	movs r3, 0x7
	bl sub_8124E2C
	b _08115D10
	.align 2, 0
_08115C74: .4byte 0x020221cc
_08115C78: .4byte 0x02018a32
_08115C7C:
	subs r0, r4, 0x1
	movs r1, 0x5
	bl __divsi3
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0xA
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r5, _08115CB8
	movs r4, 0x10
	str r4, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115CBC
	str r4, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0xE
	adds r3, r6, 0
	bl sub_8124E2C
	b _08115D10
	.align 2, 0
_08115CB8: .4byte 0x020221cc
_08115CBC: .4byte 0x02018a80
_08115CC0:
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0xE
	lsls r1, 24
	lsrs r7, r1, 24
	subs r0, r4, 0x1
	movs r1, 0x5
	bl __divsi3
	lsls r1, r0, 1
	adds r1, r0
	adds r1, 0x7
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r4, _08115D18
	movs r0, 0x10
	str r0, [sp]
	movs r0, 0xD
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124DDC
	ldr r1, _08115D1C
	movs r0, 0x3
	str r0, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	adds r2, r7, 0
	adds r3, r6, 0
	bl sub_8124E2C
_08115D10:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115D18: .4byte 0x020221cc
_08115D1C: .4byte 0x02018a20
	thumb_func_end sub_81157D0

	thumb_func_start sub_8115928
sub_8115928: @ 8115D20
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _08115D44
	ldr r1, _08115D40
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x10]
	bl sub_811829C
	b _08115D58
	.align 2, 0
_08115D40: .4byte gTasks
_08115D44:
	ldr r0, _08115D6C
	ldrb r1, [r0, 0x1A]
	lsls r1, 28
	lsrs r1, 28
	adds r0, 0x1B
	adds r1, r0
	ldrb r0, [r1]
	bl sub_811829C
	lsls r4, r5, 2
_08115D58:
	ldr r0, _08115D70
	adds r1, r4, r5
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x10]
	bl sub_81157D0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08115D6C: .4byte 0x02019000
_08115D70: .4byte gTasks
	thumb_func_end sub_8115928

	thumb_func_start sub_811597C
sub_811597C: @ 8115D74
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08115DA8
	movs r6, 0
	movs r1, 0x1
	strh r1, [r5, 0x28]
	ldr r1, _08115DAC
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x10]
	bl sub_81157D0
	adds r1, r5, 0
	adds r1, 0x23
	movs r0, 0x2
	strb r0, [r1]
	adds r5, 0x21
	strb r6, [r5]
	ldr r0, _08115DB0
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08115DA8: .4byte 0x02019000
_08115DAC: .4byte gTasks
_08115DB0: .4byte sub_8115E14
	thumb_func_end sub_811597C

	thumb_func_start sub_81159BC
sub_81159BC: @ 8115DB4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _08115E08
	ldr r1, [r3, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08115E14
	movs r2, 0xB
	ldr r5, _08115E0C
	adds r0, r5, 0
	adds r0, 0xE4
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _08115E10
	mov r12, r0
	lsls r7, r6, 2
	cmp r1, 0
	beq _08115E52
	adds r4, r3, 0
	adds r3, r5, 0
	adds r3, 0x8
_08115DE2:
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	asrs r1, r0, 16
	cmp r1, 0xD
	bgt _08115E52
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08115DE2
	b _08115E52
	.align 2, 0
_08115E08: .4byte 0x02019000
_08115E0C: .4byte gUnknown_083F8C00
_08115E10: .4byte gTasks
_08115E14:
	movs r2, 0x6
	ldr r5, _08115E80
	adds r0, r5, 0
	adds r0, 0x80
	ldr r0, [r0]
	ands r1, r0
	ldr r0, _08115E84
	mov r12, r0
	lsls r7, r6, 2
	cmp r1, 0
	beq _08115E52
	adds r4, r3, 0
	adds r3, r5, 0
	adds r3, 0x8
_08115E30:
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	asrs r1, r0, 16
	cmp r1, 0x9
	bgt _08115E52
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08115E30
_08115E52:
	adds r4, r7, r6
	lsls r4, 3
	add r4, r12
	movs r5, 0
	strh r2, [r4, 0x10]
	adds r0, r6, 0
	bl sub_8116CAC
	ldrb r0, [r4, 0x10]
	bl sub_8117158
	ldrb r0, [r4, 0x10]
	bl sub_811829C
	ldrb r0, [r4, 0x10]
	bl sub_8116EF8
	strh r5, [r4, 0xA]
	ldr r0, _08115E88
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08115E80: .4byte gUnknown_083F8C00
_08115E84: .4byte gTasks
_08115E88: .4byte sub_811597C
	thumb_func_end sub_81159BC

	thumb_func_start sub_8115A94
sub_8115A94: @ 8115E8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r6, 0
	movs r7, 0
	ldr r1, _08115ED4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrb r0, [r4]
	mov r8, r0
	cmp r5, 0
	blt _08115F00
	cmp r5, 0x1
	bgt _08115ED8
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __modsi3
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0xF0
	lsls r2, 20
	adds r1, r0, r2
	lsrs r7, r1, 24
	cmp r0, 0
	bne _08115F00
	movs r6, 0x5
	b _08115F00
	.align 2, 0
_08115ED4: .4byte gUnknown_083F8ECA
_08115ED8:
	cmp r5, 0x3
	bgt _08115F00
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r2, 0x80
	lsls r2, 19
	adds r0, r1, r2
	lsrs r7, r0, 24
	cmp r1, 0
	bne _08115F00
	movs r6, 0x1
_08115F00:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r4]
	lsls r1, r6, 24
	asrs r3, r1, 24
	lsls r0, 16
	asrs r0, 16
	lsls r2, r7, 24
	cmp r0, r3
	bge _08115F22
	asrs r0, r2, 24
	strh r0, [r4]
_08115F22:
	movs r0, 0
	ldrsh r1, [r4, r0]
	asrs r0, r2, 24
	cmp r1, r0
	ble _08115F2E
	strh r3, [r4]
_08115F2E:
	mov r1, r8
	lsls r0, r1, 24
	movs r2, 0
	ldrsh r1, [r4, r2]
	asrs r0, 24
	cmp r1, r0
	bne _08115F40
	movs r0, 0
	b _08115F42
_08115F40:
	movs r0, 0x1
_08115F42:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8115A94

	thumb_func_start sub_8115B58
sub_8115B58: @ 8115F50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	movs r5, 0
	ldr r4, _08116128
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08115F8C
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0811612C
	adds r0, r1
	adds r0, 0x8
	movs r1, 0
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115F8C
	b _08116118
_08115F8C:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08115FB2
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0811612C
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x1
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115FB2
	b _08116118
_08115FB2:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08115FD8
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0811612C
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x2
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115FD8
	b _08116118
_08115FD8:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08115FFE
	movs r5, 0x1
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _0811612C
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x3
	bl sub_8115A94
	lsls r0, 24
	cmp r0, 0
	bne _08115FFE
	b _08116118
_08115FFE:
	cmp r5, 0
	bne _08116004
	b _08116118
_08116004:
	ldr r0, _08116130
	lsls r6, r7, 2
	adds r4, r6, r7
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x10]
	bl sub_8117158
	adds r0, r7, 0
	movs r1, 0
	bl sub_8115928
	mov r1, r8
	strh r1, [r4, 0xA]
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08116134
	ldr r1, _08116138
	adds r0, r5, 0
	bl sub_8124D3C
	adds r3, r5, 0
	adds r3, 0xB8
	ldrb r2, [r3]
	movs r1, 0x7F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	subs r3, 0xC
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	adds r2, r5, 0
	adds r2, 0xA0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldrb r0, [r4, 0x10]
	bl sub_8116EF8
	movs r4, 0
	mov r12, r6
	ldr r6, _0811613C
	movs r2, 0x7C
	negs r2, r2
	adds r2, r5
	mov r10, r2
	movs r0, 0x8
	adds r0, r6
	mov r8, r0
	ldr r1, _08116140
	mov r9, r1
	ldr r2, _08116144
	adds r5, r2, 0
_08116074:
	adds r0, r4, 0
	adds r0, 0x29
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r6
	adds r2, r3, 0
	adds r2, 0x40
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ands r1, r5
	ldrh r2, [r3, 0x4]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08116074
	ldr r0, _08116130
	mov r2, r12
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0x10]
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bhi _08116118
	ldr r2, _08116148
	movs r0, 0x10
	ldrsh r1, [r1, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r2, _0811614C
	ldr r1, [r2, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08116118
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r2, 0
	add r0, r8
	adds r0, 0x65
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811613C
	adds r3, r0, r1
	adds r2, r3, 0
	adds r2, 0x40
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0, 0x4]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _08116144
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08116140
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
_08116118:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116128: .4byte gMain
_0811612C: .4byte 0x03004b38
_08116130: .4byte gTasks
_08116134: .4byte 0x020190b8
_08116138: .4byte 0x0000ffff
_0811613C: .4byte gSprites
_08116140: .4byte 0xfffffc00
_08116144: .4byte 0x000003ff
_08116148: .4byte gUnknown_083F8C00
_0811614C: .4byte 0x02019000
	thumb_func_end sub_8115B58

	thumb_func_start sub_8115D58
sub_8115D58: @ 8116150
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08116168
	movs r0, 0xFF
	strh r0, [r1, 0x28]
	ldrb r0, [r1, 0x19]
	cmp r0, 0x1
	bne _0811616C
	adds r2, r1, 0
	adds r2, 0x23
	b _08116172
	.align 2, 0
_08116168: .4byte 0x02019000
_0811616C:
	adds r2, r1, 0
	adds r2, 0x23
	movs r0, 0
_08116172:
	strb r0, [r2]
	adds r1, 0x21
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08116190
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x20
	strh r1, [r0, 0xA]
	ldr r1, _08116194
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08116190: .4byte gTasks
_08116194: .4byte sub_8115ECC
	thumb_func_end sub_8115D58

	thumb_func_start sub_8115DA0
sub_8115DA0: @ 8116198
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08116200
	ldrb r2, [r4, 0x1A]
	lsls r2, 28
	lsrs r2, 28
	adds r5, r4, 0
	adds r5, 0x1B
	adds r2, r5
	ldr r3, _08116204
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r3
	ldrh r0, [r6, 0x10]
	strb r0, [r2]
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8117380
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xC]
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r0, r5
	ldrb r0, [r0]
	bl sub_811829C
	ldrb r1, [r4, 0x19]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	strh r0, [r6, 0x22]
	lsls r0, 16
	cmp r0, 0
	bge _081161EE
	movs r0, 0
	strh r0, [r6, 0x22]
_081161EE:
	ldrh r0, [r6, 0x22]
	bl sub_81180F4
	ldr r0, _08116208
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116200: .4byte 0x02019000
_08116204: .4byte gTasks
_08116208: .4byte sub_8115D58
	thumb_func_end sub_8115DA0

	thumb_func_start sub_8115E14
sub_8115E14: @ 811620C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8115B58
	ldr r1, _08116234
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	beq _08116242
	cmp r0, 0x1E
	bgt _08116238
	cmp r0, 0
	beq _0811623E
	b _08116256
	.align 2, 0
_08116234: .4byte gTasks
_08116238:
	cmp r0, 0x3B
	beq _08116250
	b _08116256
_0811623E:
	ldrb r0, [r4, 0x10]
	b _08116244
_08116242:
	movs r0, 0
_08116244:
	bl sub_81157D0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _08116266
_08116250:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _08116266
_08116256:
	ldr r0, _081162A0
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08116266:
	ldr r0, _081162A4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081162BA
	ldr r3, _081162A8
	ldr r2, _081162AC
	ldr r1, _081162A0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, 0x8
	adds r0, r2
	ldr r1, [r3, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _081162B0
	movs r0, 0x16
	bl PlaySE
	b _081162BA
	.align 2, 0
_081162A0: .4byte gTasks
_081162A4: .4byte gMain
_081162A8: .4byte 0x02019000
_081162AC: .4byte gUnknown_083F8C00
_081162B0:
	movs r0, 0x5F
	bl m4aSongNumStart
	ldr r0, _081162C0
	str r0, [r4]
_081162BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081162C0: .4byte sub_8115DA0
	thumb_func_end sub_8115E14

	thumb_func_start sub_8115ECC
sub_8115ECC: @ 81162C4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08116318
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _0811632C
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _081162F0
	ldr r1, _0811631C
	ldrh r0, [r1]
	adds r0, 0x2
	strh r0, [r1]
_081162F0:
	ldr r1, _08116320
	ldrh r0, [r1, 0x26]
	adds r0, 0x4
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x68
	bne _08116344
	ldr r2, _08116324
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08116328
	str r1, [r0]
	b _08116344
	.align 2, 0
_08116318: .4byte gTasks
_0811631C: .4byte gSpriteCoordOffsetX
_08116320: .4byte 0x02019000
_08116324: .4byte gSprites
_08116328: .4byte SpriteCallbackDummy
_0811632C:
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117AA8
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117C60
	ldr r0, _0811634C
	str r0, [r4]
	movs r0, 0
	strh r0, [r4, 0xA]
_08116344:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811634C: .4byte sub_8116100
	thumb_func_end sub_8115ECC

	thumb_func_start sub_8115F58
sub_8115F58: @ 8116350
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _0811636C
	ldrb r2, [r0, 0x2]
	adds r4, r0, 0
	cmp r2, 0x2
	bgt _08116370
	cmp r2, 0x1
	bge _08116376
	b _08116440
	.align 2, 0
_0811636C: .4byte 0x02019000
_08116370:
	cmp r2, 0x3
	beq _081163D8
	b _08116440
_08116376:
	ldr r0, _081163A0
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _081163A8
	cmp r3, 0xB
	bls _08116390
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116456
_08116390:
	ldr r0, _081163A4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081164EC
	.align 2, 0
_081163A0: .4byte gLocalTime
_081163A4: .4byte gUnknown_083F8DF4
_081163A8:
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081163C4
	ldr r0, _081163C0
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081164EC
	.align 2, 0
_081163C0: .4byte gUnknown_083F8DF4
_081163C4:
	ldr r0, _081163D4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081164EC
	.align 2, 0
_081163D4: .4byte gUnknown_083F8DF4
_081163D8:
	ldr r0, _08116404
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bhi _0811640C
	cmp r3, 0x5
	bls _081163F2
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116456
_081163F2:
	ldr r0, _08116408
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081164EC
	.align 2, 0
_08116404: .4byte gLocalTime
_08116408: .4byte gUnknown_083F8DF4
_0811640C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811642C
	cmp r3, 0x6
	bls _0811642C
	ldr r0, _08116428
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 2
	b _081164EC
	.align 2, 0
_08116428: .4byte gUnknown_083F8DF4
_0811642C:
	ldr r0, _0811643C
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081164EC
	.align 2, 0
_0811643C: .4byte gUnknown_083F8DF4
_08116440:
	ldr r0, _0811645C
	ldrb r0, [r0, 0x2]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _08116474
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08116460
_08116456:
	movs r0, 0x1
	b _081164EC
	.align 2, 0
_0811645C: .4byte gLocalTime
_08116460:
	ldr r0, _08116470
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081164EC
	.align 2, 0
_08116470: .4byte gUnknown_083F8DF4
_08116474:
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081164A8
	cmp r3, 0xC
	bls _08116494
	ldr r0, _08116490
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	lsrs r0, 1
	b _081164EC
	.align 2, 0
_08116490: .4byte gUnknown_083F8DF4
_08116494:
	ldr r0, _081164A4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081164EC
	.align 2, 0
_081164A4: .4byte gUnknown_083F8DF4
_081164A8:
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _081164DC
	cmp r3, 0xC
	bls _081164C8
	ldr r0, _081164C4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x2]
	b _081164EC
	.align 2, 0
_081164C4: .4byte gUnknown_083F8DF4
_081164C8:
	ldr r0, _081164D8
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _081164EC
	.align 2, 0
_081164D8: .4byte gUnknown_083F8DF4
_081164DC:
	ldr r0, _081164F4
	ldrb r1, [r4, 0x4]
	lsls r1, 30
	lsrs r1, 25
	adds r1, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 25
	lsrs r0, 24
_081164EC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081164F4: .4byte gUnknown_083F8DF4
	thumb_func_end sub_8115F58

	thumb_func_start sub_8116100
sub_8116100: @ 81164F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r1, _08116580
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r7, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, _08116584
	ldr r1, _08116588
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrh r2, [r0, 0x14]
	adds r1, r3, 0
	adds r1, 0x7C
	strb r2, [r1]
	adds r1, 0x3
	strb r4, [r1]
	subs r1, 0x1
	strb r4, [r1]
	subs r1, 0x1
	strb r4, [r1]
	ldrh r0, [r0, 0x18]
	adds r1, r7, 0
	bl sub_8115F58
	adds r4, r0, 0
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r7, 0
	bl __modsi3
	lsrs r4, 25
	subs r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0811658C
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	movs r5, 0x1
	cmp r0, 0xC
	bgt _08116578
	movs r5, 0
_08116578:
	cmp r6, 0x4F
	bhi _08116590
	lsls r0, r5, 25
	b _0811659A
	.align 2, 0
_08116580: .4byte gUnknown_083F8ECE
_08116584: .4byte 0x02019000
_08116588: .4byte gTasks
_0811658C: .4byte gLocalTime
_08116590:
	lsls r1, r5, 24
	asrs r1, 24
	movs r0, 0x1
	subs r0, r1
	lsls r0, 25
_0811659A:
	lsrs r5, r0, 24
	ldr r6, _081166D0
	ldrb r0, [r6, 0x4]
	lsls r0, 30
	mov r10, r0
	lsrs r0, 25
	ldr r1, _081166D4
	adds r0, r1
	lsls r4, 24
	asrs r4, 24
	ldrh r0, [r0, 0x1A]
	adds r4, r0
	adds r0, r6, 0
	adds r0, 0x80
	strh r4, [r0]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081165CC
	ldr r1, _081166D8
	bl __addsf3
_081165CC:
	ldr r1, _081166DC
	bl __divsf3
	bl __fixunssfsi
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	adds r0, 0x82
	mov r2, r8
	strh r2, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	movs r0, 0x1
	ands r0, r7
	lsls r1, r5, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08116612
	ldr r1, _081166D8
	bl __addsf3
_08116612:
	ldr r2, _081166E0
	str r0, [r2]
	adds r7, r6, 0
	adds r7, 0x8C
	mov r1, r10
	lsrs r0, r1, 25
	ldr r2, _081166D4
	adds r0, r2
	movs r1, 0x18
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	adds r5, r0, 0
	cmp r4, 0
	bge _0811663A
	ldr r1, _081166D8
	bl __addsf3
	adds r5, r0, 0
_0811663A:
	str r5, [r7]
	adds r7, r6, 0
	adds r7, 0x90
	ldr r1, _081166E4
	adds r0, r5, 0
	bl __mulsf3
	adds r1, r5, 0
	bl __subsf3
	adds r5, r0, 0
	mov r2, r8
	lsls r0, r2, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _0811666A
	ldr r1, _081166D8
	bl __addsf3
	adds r2, r0, 0
_0811666A:
	adds r0, r5, 0
	adds r1, r2, 0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x94
	ldr r0, _081166E8
	str r0, [r1]
	adds r1, 0x8
	ldr r0, _081166EC
	str r0, [r1]
	adds r5, r6, 0
	adds r5, 0x98
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _0811669A
	ldr r1, _081166D8
	bl __addsf3
	adds r2, r0, 0
_0811669A:
	ldr r0, _081166F0
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r5]
	adds r1, r6, 0
	adds r1, 0xA0
	ldr r0, _081166F4
	str r0, [r1]
	ldr r1, _081166F8
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, _081166FC
	str r1, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081166D0: .4byte 0x02019000
_081166D4: .4byte gUnknown_083F8DF4
_081166D8: .4byte 0x47800000
_081166DC: .4byte 0x40a00000
_081166E0: .4byte 0x02019088
_081166E4: .4byte 0x3f000000
_081166E8: .4byte 0x42880000
_081166EC: .4byte 0x00000000
_081166F0: .4byte 0x41000000
_081166F4: .4byte 0x42100000
_081166F8: .4byte gTasks
_081166FC: .4byte sub_8116308
	thumb_func_end sub_8116100

	thumb_func_start sub_8116308
sub_8116308: @ 8116700
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08116760
	ldrb r1, [r3, 0x3]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r3, 0x3]
	adds r2, r3, 0
	adds r2, 0x7C
	adds r1, r3, 0
	adds r1, 0x3C
	ldrb r2, [r2]
	adds r1, r2
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _08116764
	adds r1, r2
	str r1, [r3, 0x38]
	ldr r2, _08116768
	str r2, [r1, 0x1C]
	ldr r1, _0811676C
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r1, [r4, 0x14]
	adds r1, 0x1
	strh r1, [r4, 0x14]
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	movs r0, 0x6
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_81182F8
	movs r0, 0x5C
	bl m4aSongNumStart
	ldr r0, _08116770
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116760: .4byte 0x02019000
_08116764: .4byte gSprites
_08116768: .4byte sub_81191F4
_0811676C: .4byte gTasks
_08116770: .4byte sub_811637C
	thumb_func_end sub_8116308

	thumb_func_start sub_811637C
sub_811637C: @ 8116774
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _081167A8
	adds r0, r4, 0
	adds r0, 0x7D
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811685C
	ldrb r1, [r4, 0x3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _081167AC
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811685C
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x3]
	b _0811685C
	.align 2, 0
_081167A8: .4byte 0x02019000
_081167AC:
	ldr r2, _08116820
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _081167F8
	adds r0, r4, 0
	adds r0, 0x7E
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_8116D54
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x1A]
	lsls r1, 28
	lsrs r1, 28
	adds r2, r4, 0
	adds r2, 0x1B
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8116E5C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x12]
	cmp r0, 0x1
	bne _081167F8
	adds r0, r4, 0
	adds r0, 0xB8
	movs r1, 0x80
	lsls r1, 5
	bl sub_8124CE8
_081167F8:
	ldr r0, _08116820
	adds r1, r7, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	bgt _08116828
	ldr r0, _08116824
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08116818
	movs r0, 0x3C
	strh r0, [r4, 0xA]
_08116818:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _0811685C
	.align 2, 0
_08116820: .4byte gTasks
_08116824: .4byte gMain
_08116828:
	ldr r1, _08116864
	ldrb r0, [r1, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r1, 0x1B
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8117158
	ldrh r1, [r4, 0x20]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117AA8
	ldrb r1, [r4, 0x14]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117C60
	movs r0, 0x20
	strh r0, [r4, 0xA]
	ldr r0, _08116868
	str r0, [r4]
_0811685C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116864: .4byte 0x02019000
_08116868: .4byte sub_8116474
	thumb_func_end sub_811637C

	thumb_func_start sub_8116474
sub_8116474: @ 811686C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081168C0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _081168D4
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08116898
	ldr r1, _081168C4
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
_08116898:
	ldr r1, _081168C8
	ldrh r0, [r1, 0x26]
	subs r0, 0x4
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x68
	bne _081168FC
	ldr r2, _081168CC
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _081168D0
	str r1, [r0]
	b _081168FC
	.align 2, 0
_081168C0: .4byte gTasks
_081168C4: .4byte gSpriteCoordOffsetX
_081168C8: .4byte 0x02019000
_081168CC: .4byte gSprites
_081168D0: .4byte sub_81184CC
_081168D4:
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8117D68
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _081168EA
	movs r0, 0x79
	b _081168EC
_081168EA:
	movs r0, 0x3D
_081168EC:
	strh r0, [r4, 0xA]
	ldr r0, _08116904
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08116908
	str r0, [r1]
_081168FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116904: .4byte gTasks
_08116908: .4byte sub_8116514
	thumb_func_end sub_8116474

	thumb_func_start sub_8116514
sub_8116514: @ 811690C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0811695C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	subs r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0811697C
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	adds r0, r1, 0
	cmp r1, 0
	bge _08116936
	adds r0, 0xF
_08116936:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _08116960
	cmp r0, 0x8
	bne _08116988
	movs r0, 0
	movs r1, 0xFF
	bl sub_8117AA8
	movs r0, 0
	movs r1, 0xFF
	bl sub_8117C60
	b _08116988
	.align 2, 0
_0811695C: .4byte gTasks
_08116960:
	ldrh r1, [r4, 0x20]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117AA8
	ldrb r1, [r4, 0x14]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_8117C60
	b _08116988
_0811697C:
	ldr r1, _08116990
	adds r0, r2, 0
	movs r2, 0x1E
	movs r3, 0
	bl sub_8116C34
_08116988:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116990: .4byte sub_8116638
	thumb_func_end sub_8116514

	thumb_func_start sub_811659C
sub_811659C: @ 8116994
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081169EC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081169F8
	cmp r0, 0
	blt _081169F8
	cmp r0, 0x2
	bgt _081169F8
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08116A1C
	movs r0, 0x1D
	bl sub_8053108
	ldrh r1, [r4, 0x1E]
	adds r1, 0x1
	strh r1, [r4, 0x1E]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bcs _081169DC
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	movs r0, 0x1D
	bl sav12_xor_set
_081169DC:
	ldr r1, _081169F0
	ldr r2, _081169F4
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116A1C
	.align 2, 0
_081169EC: .4byte gTasks
_081169F0: .4byte sub_811677C
_081169F4: .4byte 0x0000ffff
_081169F8:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08116A1C
	ldr r1, _08116A24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x1E]
	ldr r1, _08116A28
	ldr r2, _08116A2C
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
_08116A1C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116A24: .4byte gTasks
_08116A28: .4byte sub_81167F4
_08116A2C: .4byte 0x0000ffff
	thumb_func_end sub_811659C

	thumb_func_start sub_8116638
sub_8116638: @ 8116A30
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08116A70
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	cmp r1, 0
	beq _08116AA0
	cmp r1, 0
	blt _08116AA0
	cmp r1, 0x2
	bgt _08116AA0
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0xC
	bne _08116A7C
	ldr r0, _08116A74
	bl PlayFanfare
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116A78
	b _08116A92
	.align 2, 0
_08116A70: .4byte gTasks
_08116A74: .4byte 0x00000185
_08116A78: .4byte gUnknown_081C41A5
_08116A7C:
	movs r0, 0xC3
	lsls r0, 1
	bl PlayFanfare
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116A9C
_08116A92:
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	b _08116ABC
	.align 2, 0
_08116A9C: .4byte gUnknown_081C4199
_08116AA0:
	movs r0, 0x20
	bl m4aSongNumStart
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116AD4
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
_08116ABC:
	ldr r1, _08116AD8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xA]
	ldr r1, _08116ADC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08116AD4: .4byte gUnknown_081C41AE
_08116AD8: .4byte gTasks
_08116ADC: .4byte sub_811659C
	thumb_func_end sub_8116638

	thumb_func_start sub_81166E8
sub_81166E8: @ 8116AE0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08116B04
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x16
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _08116B08
	cmp r5, 0x3
	beq _08116B38
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	b _08116B40
	.align 2, 0
_08116B04: .4byte gTasks
_08116B08:
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x15
	bl m4aSongNumStart
	ldrh r0, [r4, 0x22]
	bl sub_81180F4
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	ldr r0, _08116B28
	cmp r1, r0
	ble _08116B2C
	strh r5, [r4, 0xA]
	b _08116B42
	.align 2, 0
_08116B28: .4byte 0x0000270e
_08116B2C:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	b _08116B40
_08116B38:
	movs r0, 0x15
	bl m4aSongNumStop
	movs r0, 0
_08116B40:
	strh r0, [r4, 0x16]
_08116B42:
	ldr r0, _08116B68
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08116B60
	ldr r1, _08116B6C
	ldr r2, _08116B70
	adds r0, r6, 0
	movs r3, 0x3
	bl sub_8116C34
_08116B60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116B68: .4byte gTasks
_08116B6C: .4byte sub_81167F4
_08116B70: .4byte 0x0000ffff
	thumb_func_end sub_81166E8

	thumb_func_start sub_811677C
sub_811677C: @ 8116B74
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08116BD4
	ldr r6, _08116BD8
	ldrb r2, [r6, 0x19]
	ldr r1, _08116BDC
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	adds r1, r2, 0
	muls r1, r0
	adds r0, r3, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r5, _08116BE0
	ldr r1, _08116BE4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldrb r1, [r6, 0x19]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0
	strh r0, [r4, 0xA]
	strh r1, [r4, 0x16]
	ldr r0, _08116BE8
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116BD4: .4byte gStringVar1
_08116BD8: .4byte 0x02019000
_08116BDC: .4byte gTasks
_08116BE0: .4byte gStringVar4
_08116BE4: .4byte gUnknown_081C41BD
_08116BE8: .4byte sub_81166E8
	thumb_func_end sub_811677C

	thumb_func_start sub_81167F4
sub_81167F4: @ 8116BEC
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08116C60
	ldr r1, _08116C64
	adds r0, r4, 0
	bl sub_8124D3C
	adds r3, r4, 0
	adds r3, 0xB8
	ldrb r2, [r3]
	movs r1, 0x7F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	subs r3, 0xC
	ldrb r2, [r3]
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	adds r2, r4, 0
	adds r2, 0xA0
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldr r6, _08116C68
	ldr r2, _08116C6C
	ldr r0, _08116C70
	lsls r3, r5, 2
	adds r3, r5
	lsls r3, 3
	adds r3, r0
	movs r0, 0x20
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r0
	subs r4, 0x75
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08116C74
	str r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08116C60: .4byte 0x020190b8
_08116C64: .4byte 0x0000ffff
_08116C68: .4byte gSprites
_08116C6C: .4byte gUnknown_083F8C00
_08116C70: .4byte gTasks
_08116C74: .4byte sub_8116880
	thumb_func_end sub_81167F4

	thumb_func_start sub_8116880
sub_8116880: @ 8116C78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _08116D4C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r5, [r0, 0x10]
	ldr r4, _08116D50
	ldrb r0, [r4, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r4, 0
	adds r1, 0x1B
	adds r0, r1
	strb r2, [r0]
	movs r0, 0
	bl sub_8117158
	ldr r3, _08116D54
	adds r0, r4, 0
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r7, r3, 0
	movs r0, 0x3C
	adds r0, r4
	mov r10, r0
	movs r1, 0x8
	adds r1, r7
	mov r8, r1
	ldr r0, _08116D58
	mov r9, r0
	ldr r1, _08116D5C
	mov r12, r1
_08116CDC:
	adds r0, r5, 0
	adds r0, 0x29
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r7
	adds r2, r3, 0
	adds r2, 0x40
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	mov r0, r12
	ands r1, r0
	ldrh r2, [r3, 0x4]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08116CDC
	ldr r0, _08116D4C
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r2, r1, r0
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	ldrb r4, [r4, 0x19]
	cmp r0, r4
	blt _08116DB4
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, 0x6
	bne _08116D68
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116D60
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08116D64
	b _08116D8A
	.align 2, 0
_08116D4C: .4byte gTasks
_08116D50: .4byte 0x02019000
_08116D54: .4byte gSprites
_08116D58: .4byte 0xfffffc00
_08116D5C: .4byte 0x000003ff
_08116D60: .4byte gUnknown_081C41F1
_08116D64: .4byte dp01t_12_3_battle_menu
_08116D68:
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	ldr r0, _08116D98
	cmp r1, r0
	bne _08116DA8
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116D9C
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08116DA0
_08116D8A:
	ldr r2, _08116DA4
	adds r0, r6, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116DD6
	.align 2, 0
_08116D98: .4byte 0x0000270f
_08116D9C: .4byte gUnknown_081C4231
_08116DA0: .4byte sub_8115734
_08116DA4: .4byte 0x0000ffff
_08116DA8:
	ldr r0, _08116DB0
	str r0, [r2]
	b _08116DD6
	.align 2, 0
_08116DB0: .4byte sub_8115734
_08116DB4:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116DE4
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08116DE8
	adds r0, r6, 0
	movs r2, 0x3C
	movs r3, 0x3
	bl sub_8116C34
_08116DD6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116DE4: .4byte gUnknown_081C41D2
_08116DE8: .4byte sub_81157AC
	thumb_func_end sub_8116880

	thumb_func_start dp01t_12_3_battle_menu
dp01t_12_3_battle_menu: @ 8116DEC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r1, _08116E7C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x14]
	adds r0, r5, 0
	bl sub_8116CAC
	bl sub_8116CF8
	bl sub_81185E8
	movs r0, 0
	bl sub_8117158
	movs r0, 0x6
	bl sub_81182F8
	ldr r7, _08116E80
	ldr r3, _08116E84
	movs r6, 0x5
	negs r6, r6
_08116E22:
	adds r0, r4, 0x7
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _08116E22
	ldr r1, _08116E7C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	ldr r0, _08116E88
	cmp r1, r0
	bne _08116E98
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08116E8C
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08116E90
	ldr r2, _08116E94
	adds r0, r5, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08116E9C
	.align 2, 0
_08116E7C: .4byte gTasks
_08116E80: .4byte gSprites
_08116E84: .4byte 0x0201903c
_08116E88: .4byte 0x0000270f
_08116E8C: .4byte gUnknown_081C4231
_08116E90: .4byte sub_8115734
_08116E94: .4byte 0x0000ffff
_08116E98:
	ldr r0, _08116EA4
	str r0, [r2]
_08116E9C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08116EA4: .4byte sub_8115734
	thumb_func_end dp01t_12_3_battle_menu

	thumb_func_start sub_8116AB0
sub_8116AB0: @ 8116EA8
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08116EE8
	ldr r1, _08116EEC
	adds r0, r4, 0
	bl sub_8124D3C
	adds r0, r4, 0
	bl sub_8124918
	ldr r1, _08116EF0
	ldr r2, _08116EF4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x22]
	ldr r2, _08116EF8
	adds r1, r2
	strh r0, [r1]
	subs r4, 0xB8
	lsls r0, 16
	lsrs r0, 16
	ldrb r4, [r4, 0x19]
	cmp r0, r4
	bcs _08116F00
	ldr r1, _08116EFC
	movs r0, 0x1
	b _08116F04
	.align 2, 0
_08116EE8: .4byte 0x020190b8
_08116EEC: .4byte 0x0000ffff
_08116EF0: .4byte gSaveBlock1
_08116EF4: .4byte gTasks
_08116EF8: .4byte 0x00000494
_08116EFC: .4byte gSpecialVar_0x8004
_08116F00:
	ldr r1, _08116F2C
	movs r0, 0
_08116F04:
	strh r0, [r1]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldr r1, _08116F30
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08116F34
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116F2C: .4byte gSpecialVar_0x8004
_08116F30: .4byte gTasks
_08116F34: .4byte sub_8116B40
	thumb_func_end sub_8116AB0

	thumb_func_start sub_8116B40
sub_8116B40: @ 8116F38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08116F96
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08116F9C
	movs r2, 0xBE
	lsls r2, 1
	movs r1, 0
	bl memset
	ldr r1, _08116FA0
	ldr r0, _08116FA4
	strh r4, [r0]
	strh r4, [r1]
	bl sub_80F9368
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl sub_80F9020
	ldr r0, _08116FA8
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _08116FAC
	ldr r0, _08116FB0
	str r0, [r1]
	ldr r0, _08116FB4
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08116F96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08116F9C: .4byte 0x02019000
_08116FA0: .4byte gSpriteCoordOffsetX
_08116FA4: .4byte gSpriteCoordOffsetY
_08116FA8: .4byte 0x04000050
_08116FAC: .4byte gUnknown_0300485C
_08116FB0: .4byte sub_8080990
_08116FB4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8116B40

	thumb_func_start sub_8116BC0
sub_8116BC0: @ 8116FB8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0811701C
	adds r7, r0, 0
	adds r7, 0xA8
	ldrh r1, [r7]
	adds r6, r0, 0
	cmp r1, 0
	beq _08116FDC
	ldr r0, _08117020
	adds r2, r6, 0
	adds r2, 0xAA
	ldrh r1, [r0, 0x2E]
	ldrh r0, [r2]
	ands r0, r1
	cmp r0, 0
	beq _08117006
_08116FDC:
	ldr r1, _08117024
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	adds r5, r6, 0
	adds r5, 0xAC
	ldr r1, [r5]
	str r1, [r0]
	adds r4, r6, 0
	adds r4, 0xAA
	ldrh r0, [r4]
	cmp r0, 0
	beq _08116FFE
	movs r0, 0x5
	bl PlaySE
_08116FFE:
	movs r0, 0
	str r0, [r5]
	strh r0, [r4]
	strh r0, [r7]
_08117006:
	adds r2, r6, 0
	adds r2, 0xA8
	ldrh r1, [r2]
	ldr r0, _08117028
	cmp r1, r0
	beq _08117016
	subs r0, r1, 0x1
	strh r0, [r2]
_08117016:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811701C: .4byte 0x02019000
_08117020: .4byte gMain
_08117024: .4byte gTasks
_08117028: .4byte 0x0000ffff
	thumb_func_end sub_8116BC0

	thumb_func_start sub_8116C34
sub_8116C34: @ 811702C
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0811707C
	mov r12, r0
	mov r2, r12
	adds r2, 0xB4
	ldr r1, _08117080
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	mov r2, r12
	adds r7, r1, 0
	cmp r5, 0
	bne _0811705C
	adds r5, r0, 0
_0811705C:
	adds r0, r2, 0
	adds r0, 0xAC
	str r5, [r0]
	subs r0, 0x4
	strh r4, [r0]
	ldr r0, _08117084
	cmp r4, r0
	bne _08117088
	cmp r3, 0
	bne _08117088
	adds r1, r2, 0
	adds r1, 0xAA
	ldrh r0, [r1]
	orrs r4, r0
	strh r4, [r1]
	b _0811708E
	.align 2, 0
_0811707C: .4byte 0x02019000
_08117080: .4byte gTasks
_08117084: .4byte 0x0000ffff
_08117088:
	adds r0, r2, 0
	adds r0, 0xAA
	strh r3, [r0]
_0811708E:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r7
	ldr r1, _081170A0
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081170A0: .4byte sub_8116BC0
	thumb_func_end sub_8116C34

	thumb_func_start sub_8116CAC
sub_8116CAC: @ 81170A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r0, _081170E8
	strb r2, [r0]
	movs r1, 0
	strb r1, [r0, 0x3]
	adds r3, r0, 0
	ldr r6, _081170EC
	adds r4, r3, 0
	adds r4, 0x1B
_081170BC:
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _081170BC
	ldrb r1, [r3, 0x1A]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r3, 0x1A]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0
	strh r1, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081170E8: .4byte 0x02019000
_081170EC: .4byte gTasks
	thumb_func_end sub_8116CAC

	thumb_func_start sub_8116CF8
sub_8116CF8: @ 81170F0
	push {lr}
	ldr r1, _08117140
	movs r0, 0
	str r0, [r1, 0x8]
	movs r2, 0
	adds r1, 0xC
	movs r3, 0
_081170FE:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _081170FE
	movs r2, 0
	ldr r3, _08117144
	movs r1, 0
_08117112:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08117112
	movs r2, 0
	ldr r3, _08117148
	movs r1, 0
_08117126:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08117126
	movs r0, 0x1
	movs r1, 0xFF
	bl sub_8117C60
	pop {r0}
	bx r0
	.align 2, 0
_08117140: .4byte 0x02019000
_08117144: .4byte 0x02019012
_08117148: .4byte 0x02019016
	thumb_func_end sub_8116CF8

	thumb_func_start sub_8116D54
sub_8116D54: @ 811714C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	mov r1, sp
	ldr r0, _08117180
	ldm r0!, {r2,r4,r6}
	stm r1!, {r2,r4,r6}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, 0x10
	adds r1, r2, 0
	ldr r0, _08117184
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	mov r9, r2
	cmp r5, 0xB
	bls _08117188
	movs r0, 0
	b _08117230
	.align 2, 0
_08117180: .4byte gUnknown_083F8ED8
_08117184: .4byte gUnknown_083F8EE8
_08117188:
	ldr r6, _08117240
	ldr r1, _08117244
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r7, 0x14
	ldrsh r2, [r0, r7]
	adds r2, r6, r2
	ldr r4, _08117248
	lsls r5, 3
	adds r3, r5, r4
	ldrb r1, [r3, 0x2]
	strb r1, [r2, 0xB]
	ldrb r1, [r3, 0x2]
	strh r1, [r0, 0x20]
	adds r0, r4, 0x4
	adds r0, r5, r0
	ldr r1, [r6, 0x8]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6, 0x8]
	movs r3, 0
	mov r8, r4
	mov r12, r5
	adds r5, r0, 0
	adds r4, r6, 0
	adds r4, 0x12
_081171C0:
	lsls r0, r3, 2
	mov r1, sp
	adds r2, r1, r0
	ldr r0, [r2]
	ands r0, r5
	cmp r0, 0
	beq _081171D6
	adds r1, r3, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081171D6:
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _081171E6
	ldr r0, [r6, 0x8]
	ldr r1, [r2]
	orrs r0, r1
	str r0, [r6, 0x8]
_081171E6:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _081171C0
	movs r2, 0
	ldr r0, _0811724C
	add r0, r12
	ldr r7, [r0]
	ldr r4, _08117250
	mov r5, r9
_081171FC:
	lsls r0, r2, 2
	adds r3, r5, r0
	ldr r0, [r3]
	ands r0, r7
	cmp r0, 0
	beq _08117210
	adds r1, r2, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08117210:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _08117220
	ldr r0, [r6, 0x8]
	ldr r1, [r3]
	orrs r0, r1
	str r0, [r6, 0x8]
_08117220:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _081171FC
	mov r0, r12
	add r0, r8
	ldrb r0, [r0, 0x2]
_08117230:
	add sp, 0x1C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08117240: .4byte 0x02019000
_08117244: .4byte gTasks
_08117248: .4byte gUnknown_083F8D90
_0811724C: .4byte gUnknown_083F8D94
_08117250: .4byte 0x02019016
	thumb_func_end sub_8116D54

	thumb_func_start sub_8116E5C
sub_8116E5C: @ 8117254
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsrs r3, r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x12
	bhi _081172E8
	cmp r2, 0xF
	bhi _081172E4
	lsls r0, r2, 2
	ldr r1, _08117278
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08117278: .4byte _0811727C
	.align 2, 0
_0811727C:
	.4byte _081172BC
	.4byte _081172C0
	.4byte _081172C0
	.4byte _081172C0
	.4byte _081172C0
	.4byte _081172D4
	.4byte _081172E4
	.4byte _081172E4
	.4byte _081172E4
	.4byte _081172E4
	.4byte _081172D4
	.4byte _081172E4
	.4byte _081172E4
	.4byte _081172E4
	.4byte _081172E4
	.4byte _081172D4
_081172BC:
	movs r0, 0x3
	b _081172EA
_081172C0:
	adds r0, r2, 0x5
	cmp r3, r0
	beq _081172E0
	adds r0, 0x5
	cmp r3, r0
	beq _081172E0
	adds r0, 0x5
	cmp r3, r0
	bne _081172E8
	b _081172E0
_081172D4:
	adds r0, r2, 0x1
	cmp r3, r0
	blt _081172E8
	adds r0, r2, 0x4
	cmp r3, r0
	bgt _081172E8
_081172E0:
	movs r0, 0x1
	b _081172EA
_081172E4:
	cmp r3, r2
	beq _081172E0
_081172E8:
	movs r0, 0
_081172EA:
	pop {r1}
	bx r1
	thumb_func_end sub_8116E5C

	thumb_func_start sub_8116EF8
sub_8116EF8: @ 81172F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	str r0, [sp, 0x18]
	cmp r6, 0xA
	beq _08117316
	cmp r6, 0xA
	bgt _08117312
	cmp r6, 0x5
	beq _08117316
	b _08117374
_08117312:
	cmp r6, 0xF
	bne _08117374
_08117316:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0x5
	ldr r7, _08117368
	cmp r4, r0
	bge _08117356
	adds r1, r7, 0
	subs r1, 0xB8
	ldr r3, _0811736C
	ldr r5, [r1, 0x8]
	adds r6, r3, 0
	adds r6, 0x8
	adds r2, r0, 0
_08117332:
	lsls r0, r4, 2
	adds r0, r4
	lsls r1, r0, 2
	adds r0, r1, r6
	ldr r0, [r0]
	ands r0, r5
	cmp r0, 0
	bne _0811734C
	adds r0, r1, r3
	ldrh r0, [r0, 0x10]
	ldr r1, [sp, 0x18]
	orrs r1, r0
	str r1, [sp, 0x18]
_0811734C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r2
	blt _08117332
_08117356:
	ldr r0, _08117370
	ldr r2, [sp, 0x18]
	ands r2, r0
	str r2, [sp, 0x18]
	adds r0, r7, 0
	adds r1, r2, 0
	bl sub_8124CE8
	b _08117534
	.align 2, 0
_08117368: .4byte 0x020190b8
_0811736C: .4byte gUnknown_083F8C00
_08117370: .4byte 0x0000dfff
_08117374:
	mov r0, sp
	ldr r1, _081173C0
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	mov r10, r3
	cmp r0, 0x3
	bhi _08117392
	movs r4, 0x3
	mov r10, r4
_08117392:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _081173C4
	adds r0, r1
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _081173F0
	cmp r0, 0x2
	bgt _081173CC
	cmp r0, 0x1
	beq _081173DC
	ldr r4, _081173C8
	b _08117432
	.align 2, 0
_081173C0: .4byte gUnknown_083F8E9C
_081173C4: .4byte 0xffff0000
_081173C8: .4byte 0x02019000
_081173CC:
	cmp r0, 0x3
	beq _08117404
	cmp r0, 0x4
	beq _08117418
	ldr r4, _081173D8
	b _08117432
	.align 2, 0
_081173D8: .4byte 0x02019000
_081173DC:
	ldr r3, _081173E8
	ldr r2, _081173EC
	adds r0, r2, 0
	adds r0, 0x43
	b _08117420
	.align 2, 0
_081173E8: .4byte gSprites
_081173EC: .4byte 0x02019000
_081173F0:
	ldr r3, _081173FC
	ldr r2, _08117400
	adds r0, r2, 0
	adds r0, 0x44
	b _08117420
	.align 2, 0
_081173FC: .4byte gSprites
_08117400: .4byte 0x02019000
_08117404:
	ldr r3, _08117410
	ldr r2, _08117414
	adds r0, r2, 0
	adds r0, 0x45
	b _08117420
	.align 2, 0
_08117410: .4byte gSprites
_08117414: .4byte 0x02019000
_08117418:
	ldr r3, _08117480
	ldr r2, _08117484
	adds r0, r2, 0
	adds r0, 0x46
_08117420:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	lsls r7, r0, 4
	adds r4, r2, 0
_08117432:
	mov r2, r10
	cmp r2, 0x1
	bne _0811748C
	ldr r1, _08117488
	lsls r2, r6, 2
	adds r0, r2, r6
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r1, [r4, 0x8]
	ldr r0, [r0]
	ands r1, r0
	str r2, [sp, 0x1C]
	cmp r1, 0
	bne _08117534
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	lsls r1, 3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, 0x2]
	adds r1, r7, r1
	strh r1, [r2, 0x2]
	adds r1, r4, 0
	adds r1, 0xB8
	lsls r0, 3
	subs r0, 0x8
	adds r2, r3, r0
	adds r0, r1, 0
	movs r1, 0xD
	bl sub_812492C
	b _0811751A
	.align 2, 0
_08117480: .4byte gSprites
_08117484: .4byte 0x02019000
_08117488: .4byte gUnknown_083F8C00
_0811748C:
	movs r4, 0
	lsls r0, r6, 2
	str r0, [sp, 0x1C]
	ldr r1, _08117544
	mov r8, r1
	ldr r2, _08117548
	mov r9, r2
_0811749A:
	lsls r0, r4, 2
	adds r0, r4
	adds r0, r6, r0
	adds r0, 0x5
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r5, r0, 2
	mov r0, r9
	adds r0, 0x8
	adds r0, r5, r0
	mov r3, r8
	ldr r1, [r3, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08117506
	adds r0, r2, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x1
	lsls r1, 3
	mov r3, sp
	adds r2, r3, r1
	ldrh r1, [r2, 0x2]
	adds r1, r7, r1
	strh r1, [r2, 0x2]
	adds r1, r4, 0
	adds r1, 0xD
	lsls r1, 24
	lsrs r1, 24
	lsls r0, 3
	subs r0, 0x8
	adds r2, r3, r0
	mov r0, r8
	adds r0, 0xB8
	bl sub_812492C
	mov r0, r10
	cmp r0, 0x3
	bne _081174FC
	mov r1, r9
	adds r0, r5, r1
	ldrh r0, [r0, 0x10]
	str r0, [sp, 0x18]
_081174FC:
	mov r0, r10
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
_08117506:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0811749A
	mov r2, r10
	cmp r2, 0x2
	beq _0811751A
	movs r3, 0
	str r3, [sp, 0x18]
_0811751A:
	ldr r0, _0811754C
	ldr r2, _08117548
	ldr r4, [sp, 0x1C]
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x10]
	ldr r2, [sp, 0x18]
	orrs r2, r1
	str r2, [sp, 0x18]
	adds r1, r2, 0
	bl sub_8124CE8
_08117534:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117544: .4byte 0x02019000
_08117548: .4byte gUnknown_083F8C00
_0811754C: .4byte 0x020190b8
	thumb_func_end sub_8116EF8

	thumb_func_start sub_8117158
sub_8117158: @ 8117550
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08117594
	movs r0, 0x1
	strh r0, [r4, 0x2A]
	movs r0, 0
	movs r1, 0
	bl sub_8117AA8
	ldr r0, _08117598
	ldr r1, _0811759C
	adds r4, r1
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0xD
	str r1, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0xE
	movs r3, 0x7
	bl sub_8124E2C
	cmp r5, 0xF
	bhi _08117648
	lsls r0, r5, 2
	ldr r1, _081175A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08117594: .4byte 0x02019000
_08117598: .4byte 0x020219cc
_0811759C: .4byte 0xfffff800
_081175A0: .4byte _081175A4
	.align 2, 0
_081175A4:
	.4byte _08117758
	.4byte _081175E4
	.4byte _081175E4
	.4byte _081175E4
	.4byte _081175E4
	.4byte _08117618
	.4byte _08117648
	.4byte _08117648
	.4byte _08117648
	.4byte _08117648
	.4byte _08117618
	.4byte _08117648
	.4byte _08117648
	.4byte _08117648
	.4byte _08117648
	.4byte _08117618
_081175E4:
	movs r0, 0x4
	str r0, [sp, 0x18]
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0x3
	bhi _08117650
	add r4, sp, 0x10
	adds r3, r1, 0
_081175FA:
	ldrb r2, [r3]
	adds r2, r4
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r5, r0
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	ldrb r0, [r3]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _081175FA
	b _08117650
_08117618:
	movs r0, 0x5
	str r0, [sp, 0x18]
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08117650
	add r3, sp, 0x10
	adds r2, r1, 0
_0811762E:
	ldrb r1, [r2]
	adds r1, r3
	ldrb r0, [r2]
	adds r0, r5, r0
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _0811762E
	b _08117650
_08117648:
	movs r0, 0x1
	str r0, [sp, 0x18]
	add r0, sp, 0x10
	strb r5, [r0]
_08117650:
	add r1, sp, 0x8
	movs r0, 0
	strb r0, [r1]
	adds r0, r1, 0
	ldrb r0, [r0]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcs _08117758
	mov r0, sp
	adds r0, 0xE
	str r0, [sp, 0x1C]
	add r1, sp, 0x10
	mov r9, r1
	add r0, sp, 0x8
	mov r12, r0
	mov r1, sp
	adds r1, 0xA
	str r1, [sp, 0x20]
_08117674:
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117768
	adds r0, r1
	ldrb r0, [r0, 0x6]
	ldr r1, [sp, 0x1C]
	strb r0, [r1]
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117768
	adds r0, r1
	ldrb r0, [r0, 0x3]
	ldr r1, [sp, 0x20]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x9
	movs r0, 0
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _08117748
	add r5, sp, 0xC
	ldr r7, [sp, 0x20]
	ldr r0, _0811776C
	mov r8, r0
	ldr r6, [sp, 0x1C]
	ldr r1, _08117770
	mov r10, r1
_081176C0:
	mov r1, r12
	ldrb r0, [r1]
	add r0, r9
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	ldr r0, _08117768
	adds r1, r0
	adds r3, r4, 0
	ldrb r0, [r4]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	lsls r0, 5
	strh r0, [r5]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	adds r2, 0x1
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	mov r1, r10
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r7]
	ldrh r2, [r5]
	adds r2, r0
	adds r2, 0x2
	lsls r2, 1
	add r2, r8
	ldrb r0, [r6]
	ldrb r1, [r4]
	adds r1, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldr r1, _08117774
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r0, [r3]
	cmp r0, 0x2
	bls _081176C0
_08117748:
	mov r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r1]
	ldr r1, [sp, 0x18]
	cmp r0, r1
	bcc _08117674
_08117758:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117768: .4byte gUnknown_083F8C00
_0811776C: .4byte 0x020219cc
_08117770: .4byte 0x020189a0
_08117774: .4byte 0x020189a4
	thumb_func_end sub_8117158

	thumb_func_start sub_8117380
sub_8117380: @ 8117778
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _081177B0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x13
	bls _08117790
	movs r4, 0
_08117790:
	ldr r3, _081177B4
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	beq _081177E4
	cmp r0, 0x4
	bgt _081177B8
	cmp r0, 0x3
	beq _081177BE
	b _08117820
	.align 2, 0
_081177B0: .4byte gUnknown_083F8EF4
_081177B4: .4byte gUnknown_083F8C00
_081177B8:
	cmp r0, 0xC
	beq _08117804
	b _08117820
_081177BE:
	adds r0, r4, 0
	movs r1, 0x5
	bl __udivsi3
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081177E0
	adds r0, 0x16
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bhi _08117820
	ldrb r0, [r1]
	adds r0, 0x1
	b _081177FA
	.align 2, 0
_081177E0: .4byte 0x02019000
_081177E4:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08117800
	adds r0, 0x12
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08117820
	ldrb r0, [r1]
	adds r0, 0x2
_081177FA:
	add r0, sp
	ldrb r0, [r0]
	b _08117822
	.align 2, 0
_08117800: .4byte 0x02019000
_08117804:
	ldr r1, _0811781C
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08117820
	mov r0, sp
	ldrb r0, [r0, 0x4]
	b _08117822
	.align 2, 0
_0811781C: .4byte 0x02019000
_08117820:
	movs r0, 0
_08117822:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8117380

	thumb_func_start sub_8117434
sub_8117434: @ 811782C
	push {r4-r6,lr}
	ldr r1, _081178A4
	ldr r4, _081178A8
	ldrh r0, [r4, 0x2C]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x2E]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x30]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x32]
	strh r0, [r1]
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	ldr r0, _081178AC
	movs r3, 0
	ldrsh r1, [r0, r3]
	adds r1, 0x50
	adds r0, r2, 0
	muls r0, r1
	movs r2, 0xE8
	lsls r2, 7
	subs r2, r0
	movs r6, 0x2C
	ldrsh r5, [r4, r6]
	ldr r0, _081178B0
	movs r6, 0
	ldrsh r3, [r0, r6]
	adds r3, 0x74
	adds r0, r5, 0
	muls r0, r3
	subs r2, r0
	movs r5, 0x32
	ldrsh r0, [r4, r5]
	muls r0, r1
	movs r1, 0xA8
	lsls r1, 7
	subs r1, r0
	movs r6, 0x30
	ldrsh r0, [r4, r6]
	muls r0, r3
	subs r1, r0
	ldr r0, _081178B4
	strh r2, [r0]
	adds r0, 0x2
	ldr r3, _081178B8
	ands r2, r3
	asrs r2, 16
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	ands r1, r3
	asrs r1, 16
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081178A4: .4byte 0x04000020
_081178A8: .4byte 0x02019000
_081178AC: .4byte gSpriteCoordOffsetY
_081178B0: .4byte gSpriteCoordOffsetX
_081178B4: .4byte 0x04000028
_081178B8: .4byte 0x0fff0000
	thumb_func_end sub_8117434

	thumb_func_start sub_81174C4
sub_81174C4: @ 81178BC
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	muls r0, r1
	adds r1, r0, 0
	cmp r0, 0
	bge _081178D0
	adds r1, 0xFF
_081178D0:
	lsls r0, r1, 8
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81174C4

	thumb_func_start sub_81174E0
sub_81174E0: @ 81178D8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 9
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81174E0

	thumb_func_start sub_81174F8
sub_81174F8: @ 81178F0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _08117918
	bl sub_814AAF8
	ldr r1, _0811791C
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117918: .4byte 0x00002d9e
_0811791C: .4byte gUnknown_083F8EB4
	thumb_func_end sub_81174F8

	thumb_func_start sub_8117528
sub_8117528: @ 8117920
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0811794C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08117944
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _08117950
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08117944:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811794C: .4byte gPaletteFade
_08117950: .4byte sub_8115384
	thumb_func_end sub_8117528

	thumb_func_start sub_811755C
sub_811755C: @ 8117954
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	bl MenuZeroFillScreen
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _081179AC
	ldrb r1, [r2, 0x8]
	lsls r1, 26
	lsrs r1, 26
	ldrb r3, [r2, 0x4]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x4]
	bl UpdatePaletteFade
	ldr r1, _081179B0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081179B4
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081179AC: .4byte gPaletteFade
_081179B0: .4byte gTasks
_081179B4: .4byte sub_8117528
	thumb_func_end sub_811755C

	thumb_func_start sub_81175C0
sub_81175C0: @ 81179B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl MenuZeroFillScreen
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81175C0

	thumb_func_start sub_81175DC
sub_81175DC: @ 81179D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _08117A1C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r2, r1, 0x1
	strh r2, [r0, 0x8]
	ldr r0, _08117A20
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08117A00
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _08117A14
_08117A00:
	ldr r1, _08117A24
	movs r0, 0x1
	strh r0, [r1]
	bl MenuZeroFillScreen
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_08117A14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08117A1C: .4byte gTasks
_08117A20: .4byte gMain
_08117A24: .4byte gSpecialVar_0x8004
	thumb_func_end sub_81175DC

	thumb_func_start sub_8117630
sub_8117630: @ 8117A28
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _08117A84
	ldr r0, _08117A88
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	lsrs r1, 7
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r1, [r0]
	ldr r0, _08117A8C
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r5, _08117A90
	ldr r1, _08117A94
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08117A98
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08117A9C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117A84: .4byte gUnknown_083F8DF0
_08117A88: .4byte gSpecialVar_0x8004
_08117A8C: .4byte gStringVar1
_08117A90: .4byte gStringVar4
_08117A94: .4byte gUnknown_081C40DF
_08117A98: .4byte gTasks
_08117A9C: .4byte sub_81174F8
	thumb_func_end sub_8117630

	thumb_func_start Task_Roulette_0
Task_Roulette_0: @ 8117AA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08117B50
	mov r10, r0
	ldr r1, _08117B54
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	movs r0, 0x22
	ldrsh r1, [r6, r0]
	mov r0, r10
	movs r2, 0x1
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r5, _08117B58
	ldr r1, _08117B5C
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0
	movs r2, 0x9
	movs r3, 0x3
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x9
	movs r2, 0x1
	bl MenuPrint_RightAligned
	ldr r2, _08117B60
	ldr r1, _08117B64
	mov r8, r1
	ldrh r1, [r1]
	movs r0, 0x1
	mov r9, r0
	ands r0, r1
	lsrs r1, 7
	lsls r1, 1
	adds r0, r1
	adds r0, r2
	ldrb r4, [r0]
	mov r0, r10
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r1, 0x22
	ldrsh r0, [r6, r1]
	cmp r0, r4
	blt _08117BB4
	mov r0, r8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08117B74
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	beq _08117B74
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08117B68
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08117B6C
	ldr r2, _08117B70
	adds r0, r7, 0
	movs r3, 0x3
	bl sub_8116C34
	b _08117BDC
	.align 2, 0
_08117B50: .4byte gStringVar1
_08117B54: .4byte gTasks
_08117B58: .4byte gStringVar4
_08117B5C: .4byte gOtherText_Coins
_08117B60: .4byte gUnknown_083F8DF0
_08117B64: .4byte gSpecialVar_0x8004
_08117B68: .4byte gUnknown_081C4139
_08117B6C: .4byte sub_8117630
_08117B70: .4byte 0x0000ffff
_08117B74:
	ldr r4, _08117BA4
	ldr r1, _08117BA8
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08117BAC
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08117BB0
	str r1, [r0]
	b _08117BDC
	.align 2, 0
_08117BA4: .4byte gStringVar4
_08117BA8: .4byte gUnknown_081C40DF
_08117BAC: .4byte gTasks
_08117BB0: .4byte sub_81174F8
_08117BB4:
	ldr r1, _08117BEC
	adds r0, r5, 0
	bl StringExpandPlaceholders
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _08117BF0
	str r0, [r6]
	movs r0, 0
	strh r0, [r6, 0x22]
	strh r0, [r6, 0x8]
_08117BDC:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117BEC: .4byte gUnknown_081C411C
_08117BF0: .4byte sub_81175DC
	thumb_func_end Task_Roulette_0

	thumb_func_start PlayRoulette
PlayRoulette: @ 8117BF4
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08117C20
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08117C24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08117C28
	ldr r2, _08117C2C
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	pop {r0}
	bx r0
	.align 2, 0
_08117C20: .4byte Task_Roulette_0
_08117C24: .4byte gTasks
_08117C28: .4byte gSaveBlock1
_08117C2C: .4byte 0x00000494
	thumb_func_end PlayRoulette

	thumb_func_start sub_8117838
sub_8117838: @ 8117C30
	push {r4,lr}
	lsls r0, 24
	cmp r0, 0
	bne _08117C7C
	bl FreeAllSpritePalettes
	ldr r0, _08117C68
	bl LoadSpritePalettes
	ldr r0, _08117C6C
	ldr r4, _08117C70
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r0, _08117C74
	movs r2, 0xE0
	lsls r2, 4
	adds r1, r4, r2
	bl LZ77UnCompWram
	ldr r0, _08117C78
	movs r1, 0x80
	lsls r1, 5
	adds r4, r1
	adds r1, r4, 0
	bl LZ77UnCompWram
	b _08117C80
	.align 2, 0
_08117C68: .4byte gUnknown_083F9E30
_08117C6C: .4byte gUnknown_083F92A8
_08117C70: .4byte 0x02017000
_08117C74: .4byte gUnknown_083F90FC
_08117C78: .4byte gUnknown_083F9D3C
_08117C7C:
	bl FreeAllSpritePalettes
_08117C80:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8117838

	thumb_func_start sub_8117890
sub_8117890: @ 8117C88
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [r0, 0x4]
	ldrb r3, [r1]
	movs r1, 0x74
	movs r2, 0x50
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r0, _08117CEC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r6]
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r1]
	ldrh r2, [r6]
	adds r0, r2, 0
	adds r0, 0x1E
	strh r0, [r6]
	lsls r0, 16
	ldr r1, _08117CF0
	cmp r0, r1
	bls _08117CE4
	ldr r1, _08117CF4
	adds r0, r2, r1
	strh r0, [r6]
_08117CE4:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08117CEC: .4byte gSprites
_08117CF0: .4byte 0x01670000
_08117CF4: .4byte 0xfffffeb6
	thumb_func_end sub_8117890

	thumb_func_start sub_8117900
sub_8117900: @ 8117CF8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _08117E48
	ldr r0, [r4]
	ldr r5, _08117E4C
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	mov r6, sp
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r4, _08117E50
	ldr r0, [r4]
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x4]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x6]
	mov r0, sp
	bl LoadSpriteSheet
	movs r7, 0
	ldr r0, _08117E54
	adds r0, r5
	mov r9, r0
	ldr r0, _08117E58
	mov r8, r0
_08117D48:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 27
	lsrs r4, r0, 24
	movs r6, 0
	lsls r5, r7, 2
_08117D54:
	lsls r1, r6, 1
	adds r1, r6
	lsls r1, 3
	ldr r0, _08117E5C
	adds r0, r1, r0
	adds r1, 0x94
	adds r2, r4, 0
	adds r2, 0x5C
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r6, 0
	adds r1, 0x1D
	adds r1, r5, r1
	add r1, r9
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x47
	bls _08117D98
	movs r4, 0
_08117D98:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _08117D54
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08117D48
	movs r7, 0
	ldr r5, _08117E60
	ldr r4, _08117E58
_08117DB2:
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 3
	ldr r0, _08117E64
	adds r0, r1, r0
	adds r1, 0x94
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x46
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r7, 0
	adds r1, 0x29
	adds r1, r5
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _08117DB2
	movs r7, 0
	ldr r5, _08117E60
	ldr r4, _08117E58
_08117DF8:
	lsls r2, r7, 1
	adds r2, r7
	lsls r2, 3
	ldr r0, _08117E68
	adds r0, r2, r0
	adds r2, 0x5C
	lsls r2, 16
	asrs r2, 16
	movs r1, 0x7E
	movs r3, 0x1E
	bl CreateSprite
	adds r1, r7, 0
	adds r1, 0x2D
	adds r1, r5
	strb r0, [r1]
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08117DF8
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117E48: .4byte gUnknown_083F9F54
_08117E4C: .4byte 0x02000000
_08117E50: .4byte gUnknown_083F9F5C
_08117E54: .4byte 0x0001903c
_08117E58: .4byte gSprites
_08117E5C: .4byte gSpriteTemplate_83FA07C
_08117E60: .4byte 0x0201903c
_08117E64: .4byte gSpriteTemplate_83F9FD4
_08117E68: .4byte gSpriteTemplate_83FA034
	thumb_func_end sub_8117900

	thumb_func_start unref_sub_8117A74
unref_sub_8117A74: @ 8117E6C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08117E98
_08117E72:
	adds r0, r4, 0
	adds r0, 0x1D
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08117E9C
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _08117E72
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08117E98: .4byte 0x0201903c
_08117E9C: .4byte gSprites
	thumb_func_end unref_sub_8117A74

	thumb_func_start sub_8117AA8
sub_8117AA8: @ 8117EA0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	cmp r0, 0
	beq _08117EF0
	cmp r0, 0x1
	bne _08117FA0
	movs r3, 0
	ldr r5, _08117EE8
	ldr r4, _08117EEC
	movs r2, 0x4
_08117EC2:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x12
	bls _08117EC2
	b _08117FA0
	.align 2, 0
_08117EE8: .4byte gSprites
_08117EEC: .4byte 0x0201903c
_08117EF0:
	movs r3, 0
	ldr r0, _08117F40
	mov r12, r0
	ldr r7, _08117F44
	movs r1, 0x4
	add r1, r12
	mov r9, r1
	ldr r5, _08117F48
	adds r4, r7, 0
	adds r4, 0x3C
	movs r6, 0x5
	negs r6, r6
_08117F08:
	lsls r2, r3, 3
	mov r1, r9
	adds r0, r2, r1
	ldr r1, [r7, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08117F4C
	mov r1, r12
	adds r0, r2, r1
	ldrb r0, [r0, 0x2]
	cmp r0, r8
	beq _08117F4C
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08117F66
	.align 2, 0
_08117F40: .4byte gUnknown_083F8D90
_08117F44: .4byte 0x02019000
_08117F48: .4byte gSprites
_08117F4C:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
_08117F66:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xB
	bls _08117F08
	cmp r3, 0x12
	bhi _08117FA0
	ldr r6, _08117FAC
	ldr r4, _08117FB0
	movs r5, 0x5
	negs r5, r5
_08117F7C:
	adds r0, r3, 0
	adds r0, 0x1D
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x12
	bls _08117F7C
_08117FA0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08117FAC: .4byte gSprites
_08117FB0: .4byte 0x0201903c
	thumb_func_end sub_8117AA8

	thumb_func_start sub_8117BBC
sub_8117BBC: @ 8117FB4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r0, _08118048
	mov r8, r0
	ldr r4, _0811804C
	movs r6, 0x4
_08117FC4:
	ldr r0, _08118050
	movs r1, 0x74
	movs r2, 0x14
	movs r3, 0xA
	bl CreateSprite
	adds r3, r5, 0
	adds r3, 0x31
	add r3, r8
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08118054
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r6
	strb r1, [r0, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x8
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08117FC4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118048: .4byte 0x0201903c
_0811804C: .4byte gSprites
_08118050: .4byte gSpriteTemplate_83FA40C
_08118054: .4byte sub_81184CC
	thumb_func_end sub_8117BBC

	thumb_func_start sub_8117C60
sub_8117C60: @ 8118058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r5, 0
	cmp r0, 0
	beq _081180A4
	ldr r4, _0811809C
	ldr r3, _081180A0
	movs r2, 0x4
_08118076:
	adds r0, r5, 0
	adds r0, 0x31
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08118076
	b _08118150
	.align 2, 0
_0811809C: .4byte gSprites
_081180A0: .4byte 0x0201903c
_081180A4:
	ldr r0, _081180E4
	mov r12, r0
	ldr r6, _081180E8
	movs r0, 0x3C
	add r0, r12
	mov r8, r0
	ldr r7, _081180EC
	movs r0, 0x5
	negs r0, r0
	mov r10, r0
_081180B8:
	mov r0, r12
	adds r0, 0xC
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0
	beq _081180C8
	cmp r5, r9
	bne _081180F0
_081180C8:
	adds r0, r5, 0
	adds r0, 0x31
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _08118146
	.align 2, 0
_081180E4: .4byte 0x02019000
_081180E8: .4byte gSprites
_081180EC: .4byte gUnknown_083F8C00
_081180F0:
	adds r3, r5, 0
	adds r3, 0x31
	add r3, r8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r10
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x3]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r2, 0x20]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x3
	strh r0, [r2, 0x22]
_08118146:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _081180B8
_08118150:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8117C60

	thumb_func_start sub_8117D68
sub_8117D68: @ 8118160
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08118190
	ldr r2, _08118188
	ldr r0, _0811818C
	adds r0, 0x6C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _081181DA
	.align 2, 0
_08118188: .4byte gSprites
_0811818C: .4byte 0x02019000
_08118190:
	ldr r4, _081181E0
	ldr r3, _081181E4
	adds r3, 0x6C
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
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r0, _081181E8
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrb r0, [r2, 0x3]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r1, 0x20]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r2, 0x4]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r1, 0x22]
_081181DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081181E0: .4byte gSprites
_081181E4: .4byte 0x02019000
_081181E8: .4byte gUnknown_083F8C00
	thumb_func_end sub_8117D68

	thumb_func_start sub_8117DF4
sub_8117DF4: @ 81181EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r4, _0811827C
	ldr r0, [r4]
	ldr r5, _08118280
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldrh r2, [r4, 0x6]
	lsls r2, 16
	ldrh r1, [r4, 0x4]
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpriteSheet
	movs r1, 0xF
	mov r0, sp
	strh r1, [r0]
	movs r0, 0
	ldr r1, _08118284
	adds r1, r5
	mov r8, r1
	ldr r7, _08118288
_08118222:
	movs r4, 0
	adds r6, r0, 0x1
	lsls r5, r0, 2
_08118228:
	adds r1, r5, r4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _0811828C
	adds r0, r1
	movs r1, 0x28
	mov r2, sp
	bl sub_8117890
	adds r1, r4, 0x7
	adds r1, r5, r1
	add r1, r8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08118228
	lsls r0, r6, 24
	lsrs r0, 24
	cmp r0, 0x2
	bls _08118222
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811827C: .4byte gUnknown_083F9EE8
_08118280: .4byte 0x02000000
_08118284: .4byte 0x0001903c
_08118288: .4byte gSprites
_0811828C: .4byte gSpriteTemplate_83FA0DC
	thumb_func_end sub_8117DF4

	thumb_func_start sub_8117E98
sub_8117E98: @ 8118290
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08118314
	ldrh r1, [r6, 0x2E]
	ldrh r0, [r0, 0x24]
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	asrs r1, 16
	ldr r0, _08118318
	cmp r1, r0
	ble _081182B0
	ldr r2, _0811831C
	adds r0, r1, r2
	lsls r0, 16
	lsrs r4, r0, 16
_081182B0:
	adds r0, r4, 0
	bl Sin2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl Cos2
	lsls r2, r5, 16
	asrs r2, 16
	movs r3, 0x30
	ldrsh r1, [r6, r3]
	muls r1, r2
	asrs r1, 12
	strh r1, [r6, 0x24]
	lsls r0, 16
	asrs r4, r0, 16
	negs r1, r4
	movs r3, 0x30
	ldrsh r0, [r6, r3]
	muls r0, r1
	asrs r0, 12
	strh r0, [r6, 0x26]
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
	cmp r2, 0
	bge _081182EA
	adds r2, 0xF
_081182EA:
	lsls r0, r2, 12
	lsrs r5, r0, 16
	ldr r1, _08118320
	lsls r0, r3, 3
	adds r1, r0, r1
	adds r0, r4, 0
	cmp r0, 0
	bge _081182FC
	adds r0, 0xF
_081182FC:
	asrs r0, 4
	strh r0, [r1, 0x6]
	strh r0, [r1]
	strh r5, [r1, 0x2]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r1, 0x4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08118314: .4byte 0x02019000
_08118318: .4byte 0x00000167
_0811831C: .4byte 0xfffffe98
_08118320: .4byte gOamMatrices
	thumb_func_end sub_8117E98

	thumb_func_start sub_8117F2C
sub_8117F2C: @ 8118324
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r5, 0
	ldr r7, _081184C0
	mov r6, sp
_08118332:
	ldr r0, _081184C4
	lsls r4, r5, 3
	adds r4, r0
	ldr r0, [r4]
	adds r1, r7, 0
	bl LZ77UnCompWram
	str r7, [sp]
	ldrh r2, [r4, 0x4]
	ldr r0, _081184C8
	ldr r1, [r6, 0x4]
	ands r1, r0
	orrs r1, r2
	str r1, [r6, 0x4]
	ldrh r2, [r4, 0x6]
	lsls r2, 16
	ldr r0, _081184CC
	ands r0, r1
	orrs r0, r2
	str r0, [r6, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _08118332
	ldr r0, _081184D0
	movs r1, 0xD0
	movs r2, 0x10
	movs r3, 0x4
	bl CreateSprite
	ldr r4, _081184D4
	adds r1, r4, 0
	adds r1, 0x50
	strb r0, [r1]
	ldr r3, _081184D8
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	movs r5, 0
	adds r4, 0x3C
	adds r7, r3, 0
_0811839A:
	lsls r1, r5, 19
	movs r0, 0xC4
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	ldr r0, _081184DC
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	adds r3, r5, 0
	adds r3, 0x15
	adds r3, r4
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r6, 0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0811839A
	ldr r0, _081184E0
	movs r1, 0x78
	movs r2, 0x44
	movs r3, 0x4
	bl CreateSprite
	ldr r3, _081184D4
	adds r1, r3, 0
	adds r1, 0x55
	strb r0, [r1]
	ldr r2, _081184D8
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	movs r5, 0
	adds r3, 0x3C
	mov r8, r3
	adds r4, r2, 0
_08118418:
	lsls r1, r5, 20
	movs r0, 0xC0
	lsls r0, 16
	adds r1, r0
	asrs r1, 16
	ldr r0, _081184E4
	movs r2, 0x24
	movs r3, 0x4
	bl CreateSprite
	adds r2, r5, 0
	adds r2, 0x1A
	add r2, r8
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r7, 0x4
	orrs r1, r7
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r6, 0x40
	orrs r1, r6
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08118418
	ldr r0, _081184E8
	movs r1, 0x98
	movs r2, 0x60
	movs r3, 0x9
	bl CreateSprite
	ldr r3, _081184D4
	adds r3, 0x6C
	strb r0, [r3]
	ldr r4, _081184D8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r7
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	orrs r1, r6
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081184C0: .4byte 0x02000000
_081184C4: .4byte gUnknown_083FA21C
_081184C8: .4byte 0xffff0000
_081184CC: .4byte 0x0000ffff
_081184D0: .4byte gSpriteTemplate_83FA2B0
_081184D4: .4byte 0x02019000
_081184D8: .4byte gSprites
_081184DC: .4byte gSpriteTemplate_83FA2C8
_081184E0: .4byte gSpriteTemplate_83FA2E0
_081184E4: .4byte gSpriteTemplate_83FA2F8
_081184E8: .4byte gSpriteTemplate_83FA310
	thumb_func_end sub_8117F2C

	thumb_func_start sub_81180F4
sub_81180F4: @ 81184EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0xFA
	lsls r0, 2
	mov r8, r0
	movs r4, 0
	movs r6, 0
	ldr r1, _081185CC
	mov r9, r1
	ldr r0, _081185D0
	mov r10, r0
_0811850C:
	adds r0, r7, 0
	mov r1, r8
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r3, r6, 0
	adds r3, 0x15
	mov r0, r9
	adds r0, 0x3C
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081185D0
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r3, 0
	cmp r5, 0
	bne _08118546
	cmp r4, 0
	bne _08118546
	cmp r6, 0x3
	bne _0811859A
_08118546:
	mov r3, r9
	adds r3, 0x3C
	adds r3, r0, r3
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r4, 0x5
	negs r4, r4
	adds r2, r4, 0
	ands r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r10
	adds r3, r0, r1
	adds r4, r3, 0
	adds r4, 0x40
	ldr r1, _081185D4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r2, [r0]
	ldrh r4, [r4]
	adds r2, r4
	ldr r4, _081185D8
	adds r0, r4, 0
	ands r2, r0
	ldrh r0, [r3, 0x4]
	ldr r4, _081185DC
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, 0x4]
	movs r4, 0x1
_0811859A:
	adds r0, r7, 0
	mov r1, r8
	bl __umodsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r8
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _0811850C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081185CC: .4byte 0x02019000
_081185D0: .4byte gSprites
_081185D4: .4byte 0x0202000c
_081185D8: .4byte 0x000003ff
_081185DC: .4byte 0xfffffc00
	thumb_func_end sub_81180F4

	thumb_func_start sub_81181E8
sub_81181E8: @ 81185E0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08118618
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x13
	bls _081185F8
	movs r4, 0
_081185F8:
	ldr r3, _0811861C
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r2, r3
	ldrb r0, [r0, 0x1]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	beq _0811864C
	cmp r0, 0x4
	bgt _08118620
	cmp r0, 0x3
	beq _08118626
	b _08118688
	.align 2, 0
_08118618: .4byte gUnknown_083FA608
_0811861C: .4byte gUnknown_083F8C00
_08118620:
	cmp r0, 0xC
	beq _0811866C
	b _08118688
_08118626:
	adds r0, r4, 0
	movs r1, 0x5
	bl __udivsi3
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08118648
	adds r0, 0x16
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bhi _08118688
	ldrb r0, [r1]
	adds r0, 0x1
	b _08118662
	.align 2, 0
_08118648: .4byte 0x02019000
_0811864C:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08118668
	adds r0, 0x12
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08118688
	ldrb r0, [r1]
	adds r0, 0x2
_08118662:
	add r0, sp
	ldrb r0, [r0]
	b _0811868A
	.align 2, 0
_08118668: .4byte 0x02019000
_0811866C:
	ldr r1, _08118684
	adds r0, r3, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08118688
	mov r0, sp
	ldrb r0, [r0, 0x4]
	b _0811868A
	.align 2, 0
_08118684: .4byte 0x02019000
_08118688:
	movs r0, 0
_0811868A:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81181E8

	thumb_func_start sub_811829C
sub_811829C: @ 8118694
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081186E0
	adds r1, 0x55
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _081186E4
	adds r4, r1, r2
	bl sub_81181E8
	adds r3, r4, 0
	adds r3, 0x2B
	strb r0, [r3]
	adds r2, r4, 0
	adds r2, 0x40
	ldr r1, [r4, 0x8]
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081186E8
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _081186EC
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081186E0: .4byte 0x02019000
_081186E4: .4byte gSprites
_081186E8: .4byte 0x000003ff
_081186EC: .4byte 0xfffffc00
	thumb_func_end sub_811829C

	thumb_func_start sub_81182F8
sub_81182F8: @ 81186F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r5, 0
	ldr r0, _08118718
	ldrb r1, [r0, 0x19]
	adds r3, r0, 0
	cmp r1, 0x1
	bne _08118708
	movs r5, 0x2
_08118708:
	cmp r2, 0x6
	bls _0811870E
	b _0811885C
_0811870E:
	lsls r0, r2, 2
	ldr r1, _0811871C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08118718: .4byte 0x02019000
_0811871C: .4byte _08118720
	.align 2, 0
_08118720:
	.4byte _0811885C
	.4byte _08118818
	.4byte _081187F0
	.4byte _081187E4
	.4byte _081187BC
	.4byte _081187B0
	.4byte _0811873C
_0811873C:
	movs r4, 0
	ldr r5, _081187A0
	ldr r0, _081187A4
	mov r8, r0
	movs r2, 0x5
	negs r2, r2
	mov r12, r2
	adds r6, r5, 0
	adds r6, 0x8
	ldr r7, _081187A8
_08118750:
	adds r3, r4, 0
	adds r3, 0x1A
	add r3, r8
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	mov r0, r12
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	adds r2, r3, 0
	adds r2, 0x40
	adds r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081187AC
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08118750
	b _081188AA
	.align 2, 0
_081187A0: .4byte gSprites
_081187A4: .4byte 0x0201903c
_081187A8: .4byte 0xfffffc00
_081187AC: .4byte 0x000003ff
_081187B0:
	ldr r2, _081187B8
	adds r0, r3, 0
	adds r0, 0x58
	b _0811881E
	.align 2, 0
_081187B8: .4byte gSprites
_081187BC:
	ldr r2, _081187E0
	adds r0, r3, 0
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x8]
	b _0811883A
	.align 2, 0
_081187E0: .4byte gSprites
_081187E4:
	ldr r2, _081187EC
	adds r0, r3, 0
	adds r0, 0x57
	b _0811881E
	.align 2, 0
_081187EC: .4byte gSprites
_081187F0:
	ldr r2, _08118814
	adds r0, r3, 0
	adds r0, 0x57
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x8]
	b _0811883A
	.align 2, 0
_08118814: .4byte gSprites
_08118818:
	ldr r2, _08118850
	adds r0, r3, 0
	adds r0, 0x56
_0811881E:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r2
	adds r4, r3, 0
	adds r4, 0x40
	adds r2, 0x8
	adds r0, r2
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrh r1, [r0, 0x4]
_0811883A:
	ldrh r4, [r4]
	adds r1, r4
	ldr r2, _08118854
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08118858
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _081188AA
	.align 2, 0
_08118850: .4byte gSprites
_08118854: .4byte 0x000003ff
_08118858: .4byte 0xfffffc00
_0811885C:
	movs r4, 0
	lsls r6, r5, 2
	ldr r5, _081188B4
	ldr r0, _081188B8
	mov r8, r0
	adds r7, r5, 0
	adds r7, 0x8
	ldr r2, _081188BC
	mov r12, r2
_0811886E:
	adds r0, r4, 0
	adds r0, 0x1A
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	adds r2, r3, 0
	adds r2, 0x40
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, r6, r0
	ldrh r1, [r0, 0x8]
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _081188C0
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0811886E
_081188AA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081188B4: .4byte gSprites
_081188B8: .4byte 0x0201903c
_081188BC: .4byte 0xfffffc00
_081188C0: .4byte 0x000003ff
	thumb_func_end sub_81182F8

	thumb_func_start sub_81184CC
sub_81184CC: @ 81188C4
	ldr r1, _081188CC
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x24]
	bx lr
	.align 2, 0
_081188CC: .4byte 0x02019000
	thumb_func_end sub_81184CC

	thumb_func_start sub_81184D8
sub_81184D8: @ 81188D0
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _0811893C
	ldr r0, [r4]
	ldr r5, _08118940
	adds r1, r5, 0
	bl LZ77UnCompWram
	str r5, [sp]
	ldrh r1, [r4, 0x6]
	lsls r1, 16
	ldrh r0, [r4, 0x4]
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _08118944
	movs r1, 0x74
	movs r2, 0x50
	movs r3, 0x51
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08118948
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0xC8
	lsls r0, 9
	adds r5, r0
	ldrh r0, [r5, 0x24]
	movs r2, 0
	strh r0, [r1, 0x2E]
	strh r2, [r1, 0x30]
	adds r3, r1, 0
	adds r3, 0x2C
	ldrb r0, [r3]
	movs r2, 0x40
	orrs r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811893C: .4byte gUnknown_083FA42C
_08118940: .4byte 0x02000000
_08118944: .4byte gSpriteTemplate_83FA434
_08118948: .4byte gSprites
	thumb_func_end sub_81184D8

	thumb_func_start sub_8118554
sub_8118554: @ 811894C
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _0811896C
	lsls r0, 3
	adds r0, r1
	ldr r2, _08118970
	ldrh r1, [r2, 0x2C]
	strh r1, [r0, 0x6]
	ldrh r1, [r2, 0x2C]
	strh r1, [r0]
	ldrh r1, [r2, 0x2E]
	strh r1, [r0, 0x2]
	ldrh r1, [r2, 0x30]
	strh r1, [r0, 0x4]
	bx lr
	.align 2, 0
_0811896C: .4byte gOamMatrices
_08118970: .4byte 0x02019000
	thumb_func_end sub_8118554

	thumb_func_start sub_811857C
sub_811857C: @ 8118974
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _081189D4
	ldr r5, _081189D8
_0811897C:
	movs r3, 0x39
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _081189DC
	movs r1, 0x74
	movs r2, 0x50
	bl CreateSprite
	adds r3, r4, r6
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081189C2
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
_081189C2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0811897C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081189D4: .4byte 0x0201903c
_081189D8: .4byte gSprites
_081189DC: .4byte gSpriteTemplate_83FA40C
	thumb_func_end sub_811857C

	thumb_func_start sub_81185E8
sub_81185E8: @ 81189E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08118A58
	adds r0, 0x3C
	ldrb r5, [r0]
	movs r6, 0
	ldr r7, _08118A5C
	movs r0, 0x1C
	adds r0, r7
	mov r10, r0
	movs r1, 0x2E
	adds r1, r7
	mov r9, r1
	mov r8, r6
_08118A02:
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r0, r4, r7
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	mov r1, r10
	adds r2, r4, r1
	ldr r1, _08118A60
	str r1, [r2]
	movs r1, 0
	bl StartSpriteAnim
	movs r1, 0
	adds r2, r5, 0x1
	adds r3, r6, 0x1
_08118A2A:
	lsls r0, r1, 1
	adds r0, r4
	add r0, r9
	mov r5, r8
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _08118A2A
	lsls r0, r2, 24
	lsrs r5, r0, 24
	lsls r0, r3, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _08118A02
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118A58: .4byte 0x02019000
_08118A5C: .4byte gSprites
_08118A60: .4byte SpriteCallbackDummy
	thumb_func_end sub_81185E8

	thumb_func_start sub_811866C
sub_811866C: @ 8118A64
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _08118A94
	ldrh r4, [r0, 0x24]
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldrh r2, [r3, 0x34]
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	cmp r1, r0
	ble _08118AA0
	movs r1, 0xB4
	lsls r1, 1
	adds r0, r2, r1
	subs r2, r0, r4
	strh r2, [r3, 0x3A]
	lsls r1, r2, 16
	ldr r0, _08118A98
	cmp r1, r0
	ble _08118AA4
	ldr r5, _08118A9C
	adds r0, r2, r5
	b _08118AA2
	.align 2, 0
_08118A94: .4byte 0x02019000
_08118A98: .4byte 0x01670000
_08118A9C: .4byte 0xfffffe98
_08118AA0:
	subs r0, r2, r4
_08118AA2:
	strh r0, [r3, 0x3A]
_08118AA4:
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_811866C

	thumb_func_start sub_81186B8
sub_81186B8: @ 8118AB0
	push {r4,lr}
	bl sub_811866C
	ldr r4, _08118AD8
	lsls r0, 16
	asrs r0, 16
	bl __floatsisf
	ldr r1, _08118ADC
	bl __divsf3
	bl __fixunssfsi
	adds r4, 0x7E
	strb r0, [r4]
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08118AD8: .4byte 0x02019000
_08118ADC: .4byte 0x41f00000
	thumb_func_end sub_81186B8

	thumb_func_start sub_81186E8
sub_81186E8: @ 8118AE0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811866C
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1E
	bl __modsi3
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0xE
	bne _08118B00
	movs r0, 0
	strh r0, [r4, 0x32]
	b _08118B16
_08118B00:
	cmp r1, 0xD
	bgt _08118B08
	movs r0, 0xE
	b _08118B0A
_08118B08:
	movs r0, 0x2B
_08118B0A:
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
_08118B16:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81186E8

	thumb_func_start sub_8118724
sub_8118724: @ 8118B1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r5, _08118B68
	adds r4, r5, 0
	adds r4, 0x8C
	adds r1, r5, 0
	adds r1, 0x90
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, 0
	str r1, [r4]
	movs r0, 0x88
	adds r0, r5
	mov r8, r0
	ldr r0, [r0]
	bl __addsf3
	adds r4, r0, 0
	mov r1, r8
	str r4, [r1]
	ldr r7, _08118B6C
	adds r1, r7, 0
	bl __gesf2
	cmp r0, 0
	blt _08118B70
	adds r0, r4, 0
	adds r1, r7, 0
	bl __subsf3
	mov r2, r8
	str r0, [r2]
	b _08118B88
	.align 2, 0
_08118B68: .4byte 0x02019000
_08118B6C: .4byte 0x43b40000
_08118B70:
	ldr r1, _08118C1C
	adds r0, r4, 0
	bl __ltsf2
	cmp r0, 0
	bge _08118B88
	adds r0, r4, 0
	adds r1, r7, 0
	bl __addsf3
	mov r1, r8
	str r0, [r1]
_08118B88:
	adds r0, r5, 0
	adds r0, 0x88
	ldr r0, [r0]
	bl __fixsfsi
	strh r0, [r6, 0x34]
	adds r4, r5, 0
	adds r4, 0x98
	adds r1, r5, 0
	adds r1, 0x9C
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	adds r1, r0, 0
	str r1, [r4]
	subs r4, 0x4
	ldr r0, [r4]
	bl __addsf3
	str r0, [r4]
	bl __fixsfsi
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x34]
	bl Sin2
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r6, 0x34]
	bl Cos2
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	muls r1, r4
	asrs r1, 12
	strh r1, [r6, 0x24]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	movs r2, 0x36
	ldrsh r1, [r6, r2]
	muls r0, r1
	asrs r0, 12
	strh r0, [r6, 0x26]
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08118C10
	ldr r0, _08118C20
	ldr r4, _08118C24
	ldrh r2, [r6, 0x24]
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _08118C28
	ldrh r2, [r6, 0x24]
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	bl m4aMPlayPanpotControl
_08118C10:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118C1C: .4byte 0x00000000
_08118C20: .4byte gMPlay_SE1
_08118C24: .4byte 0x0000ffff
_08118C28: .4byte gMPlay_SE2
	thumb_func_end sub_8118724

	thumb_func_start sub_8118834
sub_8118834: @ 8118C2C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _08118C84
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r1, 0x24]
	adds r2, r0, r1
	strh r2, [r5, 0x34]
	lsls r1, r2, 16
	ldr r0, _08118C88
	cmp r1, r0
	ble _08118C48
	ldr r1, _08118C8C
	adds r0, r2, r1
	strh r0, [r5, 0x34]
_08118C48:
	ldrh r0, [r5, 0x34]
	bl Sin2
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrh r0, [r5, 0x34]
	bl Cos2
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	muls r1, r4
	asrs r1, 12
	strh r1, [r5, 0x24]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	muls r0, r1
	ldr r1, _08118C90
	asrs r0, 12
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118C84: .4byte 0x02019000
_08118C88: .4byte 0x01670000
_08118C8C: .4byte 0xfffffe98
_08118C90: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8118834

	thumb_func_start sub_811889C
sub_811889C: @ 8118C94
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8118724
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r0, 0x84
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xD4
	bls _08118CBA
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08118CC6
_08118CBA:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_08118CC6:
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x1D
	ble _08118D86
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08118D00
	ldr r6, _08118CF8
	adds r4, r6, 0
	adds r4, 0x94
	adds r0, r6, 0
	adds r0, 0xA0
	ldr r0, [r0]
	ldr r1, _08118CFC
	bl __subsf3
	adds r1, r0, 0
	ldr r0, [r4]
	bl __lesf2
	cmp r0, 0
	bgt _08118D86
	b _08118D1E
	.align 2, 0
_08118CF8: .4byte 0x02019000
_08118CFC: .4byte 0x40000000
_08118D00:
	ldr r6, _08118D8C
	adds r4, r6, 0
	adds r4, 0x94
	adds r0, r6, 0
	adds r0, 0xA0
	ldr r0, [r0]
	ldr r1, _08118D90
	bl __subsf3
	adds r1, r0, 0
	ldr r0, [r4]
	bl __gesf2
	cmp r0, 0
	blt _08118D86
_08118D1E:
	adds r1, r6, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _08118D94
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	adds r2, r6, 0
	adds r2, 0x9C
	adds r1, r6, 0
	adds r1, 0x98
	ldr r0, _08118D98
	str r0, [r1]
	str r0, [r2]
	subs r1, 0xC
	ldr r0, _08118D9C
	str r0, [r1]
_08118D86:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08118D8C: .4byte 0x02019000
_08118D90: .4byte 0x40000000
_08118D94: .4byte sub_8118834
_08118D98: .4byte 0x00000000
_08118D9C: .4byte 0xbf800000
	thumb_func_end sub_811889C

	thumb_func_start sub_81189A8
sub_81189A8: @ 8118DA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	bl sub_8118724
	movs r1, 0x34
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _08118DBE
	cmp r0, 0xB4
	beq _08118E24
	b _08118F04
_08118DBE:
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _08118DC8
	b _08118F04
_08118DC8:
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov r8, r0
	ldr r0, _08118E1C
	mov r9, r0
	ldr r1, _08118E20
	mov r10, r1
	ldrb r4, [r1, 0x4]
	lsls r4, 30
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x1]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __mulsf3
	adds r6, r0, 0
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r6, 0
	bl __addsf3
	adds r5, r0, 0
	lsrs r4, 25
	add r4, r9
	ldrh r0, [r4, 0xC]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __divsf3
	b _08118E82
	.align 2, 0
_08118E1C: .4byte gUnknown_083F8DF4
_08118E20: .4byte 0x02019000
_08118E24:
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _08118F04
	movs r1, 0x3C
	ldrsh r0, [r7, r1]
	bl __floatsisf
	mov r8, r0
	ldr r0, _08118F14
	mov r9, r0
	ldr r1, _08118F18
	mov r10, r1
	ldrb r4, [r1, 0x4]
	lsls r4, 30
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x1]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __mulsf3
	adds r6, r0, 0
	lsrs r0, r4, 25
	add r0, r9
	ldrb r0, [r0, 0x2]
	subs r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r6, 0
	bl __addsf3
	adds r5, r0, 0
	lsrs r4, 25
	add r4, r9
	ldrh r0, [r4, 0xC]
	bl __floatsisf
	adds r1, r0, 0
	mov r0, r8
	bl __divsf3
	bl __negsf2
_08118E82:
	adds r2, r0, 0
	mov r6, r10
	adds r1, r6, 0
	adds r1, 0xA0
	adds r0, r6, 0
	adds r0, 0x94
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0
	adds r0, 0x98
	str r2, [r0]
	movs r0, 0x9C
	adds r0, r6
	mov r8, r0
	adds r0, r2, 0
	adds r1, r2, 0
	bl __addsf3
	adds r1, r5, 0
	bl __divsf3
	adds r4, r0, 0
	adds r0, r5, 0
	adds r1, r5, 0
	bl __mulsf3
	adds r1, r0, 0
	ldr r0, _08118F1C
	bl __divsf3
	adds r1, r0, 0
	adds r0, r4, 0
	bl __addsf3
	bl __negsf2
	mov r1, r8
	str r0, [r1]
	adds r1, r6, 0
	adds r1, 0x8C
	ldr r0, _08118F20
	str r0, [r1]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r7, 0
	adds r0, 0x2A
	movs r2, 0
	strb r2, [r0]
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	ldr r0, _08118F24
	str r0, [r7, 0x1C]
	strh r2, [r7, 0x32]
_08118F04:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08118F14: .4byte gUnknown_083F8DF4
_08118F18: .4byte 0x02019000
_08118F1C: .4byte 0x40000000
_08118F20: .4byte 0x00000000
_08118F24: .4byte sub_811889C
	thumb_func_end sub_81189A8

	thumb_func_start sub_8118B30
sub_8118B30: @ 8118F28
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, 0
	ldr r1, _08118FC4
	bl __mulsf3
	adds r1, r4, 0
	bl __mulsf3
	bl __fixsfsi
	adds r1, r0, 0
	subs r1, 0x2D
	strh r1, [r5, 0x26]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _08118FBE
	lsls r0, r1, 16
	cmp r0, 0
	blt _08118FBE
	ldr r4, _08118FC8
	adds r1, r4, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _08118FCC
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	ldrb r0, [r4, 0x3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
_08118FBE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08118FC4: .4byte 0x3d4ccccd
_08118FC8: .4byte 0x02019000
_08118FCC: .4byte sub_8118834
	thumb_func_end sub_8118B30

	thumb_func_start sub_8118BD8
sub_8118BD8: @ 8118FD0
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bgt _08119014
	ldrh r4, [r3, 0x26]
	subs r0, r4, 0x1
	strh r0, [r3, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2D
	bne _0811909A
	ldr r2, _0811900C
	ldr r0, _08119010
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0811909A
	strh r4, [r3, 0x26]
	b _0811909A
	.align 2, 0
_0811900C: .4byte gSprites
_08119010: .4byte 0x02019000
_08119014:
	lsls r0, r1, 16
	asrs r0, 16
	movs r2, 0x3C
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bge _08119060
	ldr r2, _08119050
	ldr r0, _08119054
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bne _0811909A
	adds r0, r1, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119058
	ldrh r0, [r3, 0x26]
	adds r0, 0x1
	strh r0, [r3, 0x26]
	b _0811909A
	.align 2, 0
_08119050: .4byte gSprites
_08119054: .4byte 0x02019000
_08119058:
	ldrh r0, [r3, 0x26]
	subs r0, 0x1
	strh r0, [r3, 0x26]
	b _0811909A
_08119060:
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x3F
	adds r0, r3
	mov r12, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	strh r2, [r3, 0x32]
	ldr r0, _081190A0
	str r0, [r3, 0x1C]
	movs r0, 0x3D
	bl m4aSongNumStart
_0811909A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081190A0: .4byte sub_8118B30
	thumb_func_end sub_8118BD8

	thumb_func_start sub_8118CAC
sub_8118CAC: @ 81190A4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8118724
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	cmp r1, 0x5A
	beq _081190BE
	movs r0, 0x87
	lsls r0, 1
	cmp r1, r0
	beq _081190C8
	b _081190D8
_081190BE:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _081190D8
	b _081190D0
_081190C8:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081190D8
_081190D0:
	ldr r0, _081190E0
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x32]
_081190D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081190E0: .4byte sub_8118BD8
	thumb_func_end sub_8118CAC

	thumb_func_start sub_8118CEC
sub_8118CEC: @ 81190E4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8118724
	ldr r0, _08119108
	ldrb r0, [r0, 0x3]
	lsls r0, 27
	lsrs r0, 27
	cmp r0, 0
	beq _081190FC
	cmp r0, 0x1
	beq _08119110
_081190FC:
	adds r0, r4, 0
	bl sub_8119224
	ldr r0, _0811910C
	b _08119118
	.align 2, 0
_08119108: .4byte 0x02019000
_0811910C: .4byte sub_81189A8
_08119110:
	adds r0, r4, 0
	bl sub_81193D4
	ldr r0, _08119120
_08119118:
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119120: .4byte sub_8118CAC
	thumb_func_end sub_8118CEC

	thumb_func_start sub_8118D2C
sub_8118D2C: @ 8119124
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8118724
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _08119148
	ldr r4, _081191B0
	adds r4, 0x98
	ldr r0, [r4]
	ldr r1, _081191B4
	bl __mulsf3
	str r0, [r4]
_08119148:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _081191D4
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _081191BC
	ldr r1, _081191B0
	adds r2, r1, 0
	adds r2, 0x7D
	movs r0, 0xFF
	strb r0, [r2]
	ldrb r2, [r1, 0x3]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x3]
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r5, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r5, 0x3A]
	ldr r0, _081191B8
	str r0, [r5, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	b _081191D4
	.align 2, 0
_081191B0: .4byte 0x02019000
_081191B4: .4byte 0xbf800000
_081191B8: .4byte sub_8118834
_081191BC:
	adds r0, r5, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x38
	bl m4aSongNumStart
	adds r0, r5, 0
	bl sub_811952C
_081191D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8118D2C

	thumb_func_start sub_8118DE4
sub_8118DE4: @ 81191DC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	bl sub_8118724
	movs r0, 0
	strh r0, [r7, 0x32]
	adds r0, r7, 0
	bl sub_81186B8
	ldr r1, _08119268
	ldr r6, _0811926C
	movs r0, 0x7E
	adds r0, r6
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r6, 0x8]
	ands r0, r1
	cmp r0, 0
	bne _08119274
	adds r1, r6, 0
	adds r1, 0x7D
	movs r0, 0xFF
	strb r0, [r1]
	ldrb r1, [r6, 0x3]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r6, 0x3]
	adds r0, r7, 0
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r1, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r7, 0
	bl StartSpriteAnim
	adds r0, r7, 0
	bl sub_81186B8
	movs r0, 0x1E
	strh r0, [r7, 0x36]
	adds r0, r7, 0
	bl sub_811866C
	movs r1, 0x3A
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0xF
	strh r1, [r7, 0x3A]
	ldr r0, _08119270
	str r0, [r7, 0x1C]
	movs r0, 0x47
	bl m4aSongNumStartOrChange
	b _0811936C
	.align 2, 0
_08119268: .4byte gUnknown_083F8D90
_0811926C: .4byte 0x02019000
_08119270: .4byte sub_8118834
_08119274:
	movs r0, 0x38
	bl m4aSongNumStart
	bl Random
	movs r2, 0x1
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, 0
	beq _081192B8
	adds r1, r6, 0
	adds r1, 0x8C
	ldr r0, _081192B0
	str r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0xC
	bl __modsi3
	lsls r1, r0, 24
	lsrs r2, r1, 24
	adds r1, r6, 0
	adds r1, 0x7F
	strb r0, [r1]
	ldr r5, _081192B4
	b _081192EC
	.align 2, 0
_081192B0: .4byte 0x00000000
_081192B4: .4byte gUnknown_083F8DF4
_081192B8:
	adds r4, r6, 0
	adds r4, 0x8C
	ldr r5, _08119314
	ldrb r0, [r6, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	adds r0, r1, 0
	bl __addsf3
	str r0, [r4]
	mov r0, r8
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r0, 0xB
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r6, 0
	adds r0, 0x7F
	strb r4, [r0]
_081192EC:
	ldr r0, _08119318
	lsls r1, r2, 3
	adds r0, 0x4
	adds r1, r0
	ldr r2, _0811931C
	ldr r1, [r1]
	ldr r0, [r2, 0x8]
	ands r1, r0
	cmp r1, 0
	beq _08119320
	movs r0, 0x1
	strh r0, [r7, 0x2E]
	ldrb r0, [r2, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x2]
	strh r0, [r7, 0x32]
	b _0811935C
	.align 2, 0
_08119314: .4byte gUnknown_083F8DF4
_08119318: .4byte gUnknown_083F8D90
_0811931C: .4byte 0x02019000
_08119320:
	strh r1, [r7, 0x2E]
	ldrb r1, [r2, 0x4]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08119338
	lsls r0, r1, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x1]
	strh r0, [r7, 0x32]
	b _0811935C
_08119338:
	lsls r0, r1, 30
	lsrs r0, 25
	adds r0, r5
	ldrb r0, [r0, 0x2]
	strh r0, [r7, 0x32]
	mov r1, r9
	cmp r1, 0
	beq _08119354
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08119350
	b _0811935A
	.align 2, 0
_08119350: .4byte 0x3f000000
_08119354:
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _08119378
_0811935A:
	str r0, [r1]
_0811935C:
	adds r1, r2, 0
	adds r1, 0x98
	ldr r0, _0811937C
	str r0, [r1]
	ldr r0, _08119380
	str r0, [r7, 0x1C]
	movs r0, 0x5
	strh r0, [r7, 0x30]
_0811936C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119378: .4byte 0xbfc00000
_0811937C: .4byte 0x3dae147b
_08119380: .4byte sub_8118D2C
	thumb_func_end sub_8118DE4

	thumb_func_start sub_8118F8C
sub_8118F8C: @ 8119384
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	bl sub_8118724
	ldr r5, _08119410
	movs r0, 0x8C
	adds r0, r5
	mov r8, r0
	ldr r0, [r0]
	ldr r1, _08119414
	bl __gtsf2
	cmp r0, 0
	bgt _08119466
	adds r0, r6, 0
	bl sub_81186B8
	adds r0, r6, 0
	bl sub_81186E8
	lsls r0, 16
	cmp r0, 0
	bne _08119428
	adds r1, r5, 0
	adds r1, 0x90
	ldr r0, _08119418
	str r0, [r1]
	ldr r1, _0811941C
	mov r9, r1
	ldrb r0, [r5, 0x4]
	lsls r7, r0, 30
	lsrs r0, r7, 25
	add r0, r9
	movs r4, 0x3
	ldrsb r4, [r0, r4]
	adds r0, r4, 0
	bl __floatsisf
	adds r5, r0, 0
	cmp r4, 0
	bge _081193E4
	ldr r1, _08119420
	bl __addsf3
	adds r5, r0, 0
_081193E4:
	lsrs r0, r7, 25
	add r0, r9
	ldrb r0, [r0, 0x4]
	adds r0, 0x1
	bl __floatsisf
	adds r1, r0, 0
	adds r0, r5, 0
	bl __divsf3
	adds r1, r0, 0
	mov r2, r8
	ldr r0, [r2]
	bl __subsf3
	mov r1, r8
	str r0, [r1]
	movs r0, 0x4
	strh r0, [r6, 0x30]
	ldr r0, _08119424
	str r0, [r6, 0x1C]
	b _08119466
	.align 2, 0
_08119410: .4byte 0x02019000
_08119414: .4byte 0x3f000000
_08119418: .4byte 0x00000000
_0811941C: .4byte gUnknown_083F8DF4
_08119420: .4byte 0x43800000
_08119424: .4byte sub_8118DE4
_08119428:
	adds r6, r5, 0
	adds r6, 0x90
	ldr r0, [r6]
	ldr r4, _08119474
	adds r1, r4, 0
	bl __nesf2
	cmp r0, 0
	beq _08119466
	mov r2, r8
	ldr r0, [r2]
	adds r1, r4, 0
	bl __ltsf2
	cmp r0, 0
	bge _08119466
	str r4, [r6]
	mov r0, r8
	str r4, [r0]
	adds r4, r5, 0
	adds r4, 0x98
	ldr r0, [r4]
	bl __extendsfdf2
	ldr r2, _08119478
	ldr r3, _0811947C
	bl __divdf3
	bl __truncdfsf2
	str r0, [r4]
_08119466:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119474: .4byte 0x00000000
_08119478: .4byte 0x3ff33333
_0811947C: .4byte 0x33333333
	thumb_func_end sub_8118F8C

	thumb_func_start sub_8119088
sub_8119088: @ 8119480
	push {r4-r7,lr}
	adds r6, r0, 0
	bl sub_8118724
	ldr r5, _08119518
	adds r0, r5, 0
	adds r0, 0x94
	ldr r0, [r0]
	ldr r1, _0811951C
	bl __gtsf2
	cmp r0, 0
	bgt _08119512
	adds r7, r5, 0
	adds r7, 0x98
	adds r0, r5, 0
	adds r0, 0x86
	movs r1, 0
	ldrsh r4, [r0, r1]
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081194BA
	ldr r1, _08119520
	bl __addsf3
	adds r2, r0, 0
_081194BA:
	ldr r0, _08119524
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r7, r5, 0
	adds r7, 0x90
	adds r5, 0x8C
	adds r0, r4, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r4, 0
	bge _081194E2
	ldr r1, _08119520
	bl __addsf3
	adds r2, r0, 0
_081194E2:
	ldr r0, [r5]
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x3
	strh r0, [r6, 0x30]
	ldr r0, _08119528
	str r0, [r6, 0x1C]
_08119512:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119518: .4byte 0x02019000
_0811951C: .4byte 0x42200000
_08119520: .4byte 0x47800000
_08119524: .4byte 0x40800000
_08119528: .4byte sub_8118F8C
	thumb_func_end sub_8119088

	thumb_func_start sub_8119134
sub_8119134: @ 811952C
	push {r4-r7,lr}
	adds r6, r0, 0
	bl sub_8118724
	ldr r4, _081195D4
	adds r0, r4, 0
	adds r0, 0x94
	ldr r0, [r0]
	ldr r1, _081195D8
	bl __gtsf2
	cmp r0, 0
	bgt _081195CC
	movs r0, 0x5D
	bl m4aSongNumStartOrChange
	adds r7, r4, 0
	adds r7, 0x98
	adds r0, r4, 0
	adds r0, 0x84
	movs r1, 0
	ldrsh r5, [r0, r1]
	adds r0, r5, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r5, 0
	bge _0811956C
	ldr r1, _081195DC
	bl __addsf3
	adds r2, r0, 0
_0811956C:
	ldr r0, _081195E0
	adds r1, r2, 0
	bl __divsf3
	bl __negsf2
	str r0, [r7]
	adds r7, r4, 0
	adds r7, 0x90
	adds r0, r4, 0
	adds r0, 0x8C
	ldr r1, [r0]
	ldr r0, _081195E4
	bl __subsf3
	adds r4, r0, 0
	adds r0, r5, 0
	bl __floatsisf
	adds r2, r0, 0
	cmp r5, 0
	bge _081195A0
	ldr r1, _081195DC
	bl __addsf3
	adds r2, r0, 0
_081195A0:
	adds r0, r4, 0
	adds r1, r2, 0
	bl __divsf3
	str r0, [r7]
	adds r1, r6, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r6, 0x30]
	ldr r0, _081195E8
	str r0, [r6, 0x1C]
_081195CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081195D4: .4byte 0x02019000
_081195D8: .4byte 0x42700000
_081195DC: .4byte 0x47800000
_081195E0: .4byte 0x41a00000
_081195E4: .4byte 0x3f800000
_081195E8: .4byte sub_8119088
	thumb_func_end sub_8119134

	thumb_func_start sub_81191F4
sub_81191F4: @ 81195EC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r0, 0x1
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	adds r0, r4, 0
	bl sub_8118724
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08119618
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119618: .4byte sub_8119134
	thumb_func_end sub_81191F4

	thumb_func_start sub_8119224
sub_8119224: @ 811961C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r0, 0
	ldr r1, _081197B0
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r5, _081197B4
	ldr r0, _081197B8
	movs r2, 0xC
	negs r2, r2
	movs r1, 0x24
	movs r3, 0x32
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x73
	strb r0, [r1]
	ldr r4, _081197BC
	movs r0, 0x2E
	ldrsh r2, [r7, r0]
	lsls r2, 2
	mov r1, sp
	adds r0, r1, r2
	movs r3, 0
	ldrsh r1, [r0, r3]
	mov r0, sp
	adds r0, 0x2
	adds r0, r2
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r0, r4, 0
	movs r3, 0x3B
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x74
	strb r0, [r1]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x24
	movs r2, 0x8C
	movs r3, 0x33
	bl CreateSprite
	adds r1, r5, 0
	adds r1, 0x75
	strb r0, [r1]
	ldr r3, _081197C0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r6, 0
	adds r4, r3, 0
	mov r12, r5
	ldr r0, _081197C4
	mov r8, r0
	mov r10, r12
_081196B6:
	mov r1, r12
	adds r3, r1, r6
	adds r3, 0x73
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r12
	adds r1, 0x73
	ldrb r1, [r1]
	strh r1, [r0, 0x36]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r5, r12
	adds r5, 0x74
	ldrb r1, [r5]
	strh r1, [r0, 0x38]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r12
	adds r1, 0x75
	ldrb r1, [r1]
	strh r1, [r0, 0x3A]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	mov r1, r9
	strh r1, [r0, 0x32]
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	movs r0, 0x3C
	ldrsh r3, [r7, r0]
	mov r0, r12
	ldrb r1, [r0, 0x4]
	lsls r1, 30
	lsrs r0, r1, 25
	add r0, r8
	ldrb r0, [r0, 0x1]
	muls r3, r0
	lsrs r1, 25
	add r1, r8
	ldrb r0, [r1, 0x2]
	ldr r1, _081197C8
	adds r0, r1
	adds r3, r0
	strh r3, [r2, 0x34]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _081197C0
	cmp r6, 0x2
	bls _081196B6
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	mov r3, r10
	str r7, [r3, 0x38]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081197B0: .4byte gUnknown_083FA60E
_081197B4: .4byte 0x02019000
_081197B8: .4byte gSpriteTemplate_83FA50C
_081197BC: .4byte gSpriteTemplate_83FA5C0
_081197C0: .4byte gSprites
_081197C4: .4byte gUnknown_083F8DF4
_081197C8: .4byte 0x0000ffff
	thumb_func_end sub_8119224

	thumb_func_start sub_81193D4
sub_81193D4: @ 81197CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r7, r0, 0
	movs r0, 0
	mov r8, r0
	ldr r1, _0811990C
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _08119910
	movs r1, 0x2E
	ldrsh r2, [r7, r1]
	lsls r2, 2
	mov r3, sp
	adds r1, r3, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	mov r4, sp
	adds r4, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r3, 0x32
	bl CreateSprite
	ldr r6, _08119914
	adds r1, r6, 0
	adds r1, 0x73
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08119918
	adds r0, r5
	ldrh r1, [r7, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, _0811991C
	movs r1, 0x2E
	ldrsh r2, [r7, r1]
	lsls r2, 2
	mov r3, sp
	adds r1, r3, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	adds r4, r2
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0x33
	bl CreateSprite
	adds r4, r6, 0
	adds r4, 0x74
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	mov r0, r9
	lsls r2, r0, 16
	asrs r2, 16
	ldr r3, _08119920
	ldrb r1, [r6, 0x4]
	lsls r1, 30
	lsrs r0, r1, 25
	adds r0, r3
	ldrb r0, [r0, 0x1]
	muls r2, r0
	lsrs r1, 25
	adds r1, r3
	ldrh r0, [r1, 0x10]
	adds r0, 0x2D
	adds r2, r0
	strh r2, [r7, 0x3C]
	adds r3, r6, 0
_0811989A:
	mov r1, r8
	adds r2, r6, r1
	adds r2, 0x73
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r1, r6, 0
	adds r1, 0x73
	ldrb r1, [r1]
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x38]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x3A]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x32]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r7, 0x3C]
	subs r0, 0x2D
	strh r0, [r1, 0x34]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _0811989A
	str r7, [r3, 0x38]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811990C: .4byte gUnknown_083FA616
_08119910: .4byte gSpriteTemplate_83FA524
_08119914: .4byte 0x02019000
_08119918: .4byte gSprites
_0811991C: .4byte gSpriteTemplate_83FA5F0
_08119920: .4byte gUnknown_083F8DF4
	thumb_func_end sub_81193D4

	thumb_func_start sub_811952C
sub_811952C: @ 8119924
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r8, r0
	movs r0, 0
	mov r10, r0
	movs r1, 0x5
	mov r9, r1
	movs r2, 0
	str r2, [sp, 0xC]
	mov r0, sp
	movs r1, 0
	movs r2, 0xA
	bl memset
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	ldr r7, _08119A08
	adds r0, r7, 0
	adds r0, 0x7D
	movs r6, 0x1
	strb r6, [r0]
	ldrb r4, [r7, 0x3]
	movs r0, 0x20
	orrs r4, r0
	movs r0, 0x41
	negs r0, r0
	ands r4, r0
	strb r4, [r7, 0x3]
	adds r1, r7, 0
	adds r1, 0x7E
	movs r0, 0xFF
	strb r0, [r1]
	adds r5, r7, 0
	adds r5, 0x88
	mov r3, r8
	movs r1, 0x34
	ldrsh r0, [r3, r1]
	bl __floatsisf
	str r0, [r5]
	adds r1, r7, 0
	adds r1, 0x98
	ldr r0, _08119A0C
	str r0, [r1]
	adds r3, r7, 0
	adds r3, 0x8C
	ldr r2, _08119A10
	ldrb r0, [r7, 0x4]
	lsls r0, 30
	lsrs r1, r0, 25
	adds r2, 0x1C
	adds r1, r2
	ldr r1, [r1]
	str r1, [r3]
	lsrs r0, 30
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 1
	adds r1, 0x21
	lsls r4, 27
	lsrs r4, 27
	subs r6, r4
	lsls r0, r6, 4
	subs r0, r6
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r5, r10
	mov r3, r8
	movs r0, 0x34
	ldrsh r2, [r3, r0]
_081199C0:
	cmp r1, r2
	bge _081199CC
	adds r0, r1, 0
	adds r0, 0x5A
	cmp r2, r0
	ble _08119A30
_081199CC:
	cmp r5, 0x3
	beq _08119A14
	adds r0, r1, 0
	adds r0, 0x5A
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _081199C0
_081199E2:
	ldr r0, _08119A08
	ldrb r1, [r0, 0x3]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	beq _08119A5C
	mov r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08119A50
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
	b _08119A68
	.align 2, 0
_08119A08: .4byte 0x02019000
_08119A0C: .4byte 0x00000000
_08119A10: .4byte gUnknown_083F8DF4
_08119A14:
	movs r0, 0x1
	mov r3, r8
	strh r0, [r3, 0x2E]
	ldr r2, _08119A2C
	ldrb r1, [r2, 0x3]
	subs r0, 0x21
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x3]
	b _081199E2
	.align 2, 0
_08119A2C: .4byte 0x02019000
_08119A30:
	lsrs r0, r5, 1
	mov r1, r8
	strh r0, [r1, 0x2E]
	ldr r3, _08119A4C
	movs r1, 0x1
	ands r1, r5
	ldrb r2, [r3, 0x3]
	movs r0, 0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	b _081199E2
	.align 2, 0
_08119A4C: .4byte 0x02019000
_08119A50:
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	bl PlayCry1
	b _08119A68
_08119A5C:
	movs r0, 0x99
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
_08119A68:
	movs r5, 0x2
	ldr r4, _08119A98
	adds r0, r4, 0
	adds r0, 0x7F
	ldrb r0, [r0]
	adds r0, 0x2
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r1, [r4, 0x3]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0x1
	bne _08119A9C
	ldrb r1, [r4, 0x4]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0x1
	bne _08119A9C
	mov r0, r9
	adds r0, 0x6
	b _08119AA0
	.align 2, 0
_08119A98: .4byte 0x02019000
_08119A9C:
	mov r2, r9
	adds r0, r2, r5
_08119AA0:
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r5, r9
	bcs _08119B06
	ldr r6, _08119B2C
	ldr r7, _08119B30
_08119AAE:
	lsls r0, r3, 3
	ldr r1, _08119B34
	adds r0, r1
	ldr r1, [r6, 0x8]
	ldr r2, [r0]
	ands r1, r2
	cmp r1, 0
	bne _08119AF0
	mov r0, r10
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	add r0, sp
	strb r5, [r0]
	ldr r0, [sp, 0xC]
	cmp r0, 0
	bne _08119AF0
	ldrb r0, [r6, 0x1A]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, _08119B38
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08119AF0
	str r5, [sp, 0xC]
_08119AF0:
	adds r0, r3, 0x1
	movs r1, 0xC
	bl __modsi3
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r9
	bcc _08119AAE
_08119B06:
	ldrb r0, [r4, 0x3]
	lsls r0, 27
	lsrs r0, 27
	adds r0, 0x1
	ldrb r1, [r4, 0x2]
	ands r0, r1
	cmp r0, 0
	beq _08119B4E
	ldr r2, [sp, 0xC]
	cmp r2, 0
	beq _08119B3C
	movs r0, 0xFF
	ldr r3, [sp, 0x10]
	ands r0, r3
	cmp r0, 0xBF
	bhi _08119B3C
	mov r0, r8
	strh r2, [r0, 0x3C]
	b _08119B5E
	.align 2, 0
_08119B2C: .4byte 0x02019000
_08119B30: .4byte gUnknown_083F8C0C
_08119B34: .4byte gUnknown_083F8D94
_08119B38: .4byte 0x0201901b
_08119B3C:
	ldr r0, [sp, 0x10]
	mov r1, r10
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
	mov r1, r8
	strh r0, [r1, 0x3C]
	b _08119B5E
_08119B4E:
	ldr r0, [sp, 0x10]
	mov r1, r10
	bl __modsi3
	add r0, sp
	ldrb r0, [r0]
	mov r2, r8
	strh r0, [r2, 0x3C]
_08119B5E:
	ldr r3, _08119B74
	mov r0, r8
	str r3, [r0, 0x1C]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08119B74: .4byte sub_8118CEC
	thumb_func_end sub_811952C

	thumb_func_start sub_8119780
sub_8119780: @ 8119B78
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x1
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08119BC2
	ldrh r0, [r2, 0x20]
	subs r0, 0x2
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08119BC2
	ldr r4, _08119BC8
	ldrb r1, [r4, 0x3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08119BB2
	movs r0, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
_08119BB2:
	adds r0, r2, 0
	bl DestroySprite
	movs r0, 0
	strb r0, [r4, 0x1]
	ldr r0, _08119BCC
	ldrh r0, [r0]
	strh r0, [r4, 0x34]
_08119BC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119BC8: .4byte 0x02019000
_08119BCC: .4byte gUnknown_083FA61E
	thumb_func_end sub_8119780

	thumb_func_start sub_81197D8
sub_81197D8: @ 8119BD0
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	ldr r1, _08119C4C
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldrh r0, [r4, 0x30]
	adds r2, r0, 0x1
	strh r2, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _08119C54
	movs r0, 0x1
	ands r2, r0
	cmp r2, 0
	beq _08119C2E
	ldr r3, _08119C50
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	lsls r2, 1
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r2, r0
	mov r1, sp
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r3, 0x3C
	ldrsh r2, [r4, r3]
	adds r1, r2, 0x1
	adds r0, r1, 0
	cmp r1, 0
	bge _08119C26
	adds r0, r2, 0x4
_08119C26:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	strh r0, [r4, 0x3C]
_08119C2E:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08119C7C
	.align 2, 0
_08119C4C: .4byte gUnknown_083FA632
_08119C50: .4byte gSpriteCoordOffsetY
_08119C54:
	ldr r1, _08119C84
	movs r0, 0
	strh r0, [r1]
	ldr r2, _08119C88
	ldr r0, _08119C8C
	adds r0, 0x73
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	bl DestroySprite
_08119C7C:
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119C84: .4byte gSpriteCoordOffsetY
_08119C88: .4byte gSprites
_08119C8C: .4byte 0x02019000
	thumb_func_end sub_81197D8

	thumb_func_start sub_8119898
sub_8119898: @ 8119C90
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	bl __floatsisf
	adds r4, r0, 0
	ldr r1, _08119D40
	bl __mulsf3
	adds r1, r4, 0
	bl __mulsf3
	bl __fixsfsi
	strh r0, [r5, 0x26]
	ldr r3, _08119D44
	ldr r2, _08119D48
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x34]
	ldrb r0, [r3, 0x1]
	cmp r0, 0x12
	bhi _08119CD6
	adds r0, 0x1
	strb r0, [r3, 0x1]
_08119CD6:
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x3C
	ble _08119D38
	movs r0, 0
	strh r0, [r5, 0x30]
	ldr r3, _08119D4C
	str r3, [r5, 0x1C]
	ldr r2, _08119D50
	movs r0, 0x3A
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	adds r4, 0x1C
	adds r0, r4
	str r3, [r0]
	movs r0, 0x3A
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _08119D54
	strh r1, [r0, 0x30]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08119D58
	str r1, [r0]
	movs r0, 0xD6
	bl m4aSongNumStart
_08119D38:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119D40: .4byte 0x3d1fbe77
_08119D44: .4byte 0x02019000
_08119D48: .4byte gUnknown_083FA61E
_08119D4C: .4byte sub_8119780
_08119D50: .4byte gSprites
_08119D54: .4byte 0x0000fffe
_08119D58: .4byte sub_81197D8
	thumb_func_end sub_8119898

	thumb_func_start sub_8119964
sub_8119964: @ 8119D5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08119DDC
	ldr r3, _08119D88
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119D90
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119D8C
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x8]
	b _08119DA2
	.align 2, 0
_08119D88: .4byte 0x02019000
_08119D8C: .4byte gUnknown_083F8DF4
_08119D90:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119DD0
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x8]
	adds r0, 0xB4
_08119DA2:
	cmp r2, r0
	bne _08119E70
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r0, 0x2B
	bl m4aSongNumStart
	ldr r1, _08119DD4
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r0, _08119DD8
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	b _08119E70
	.align 2, 0
_08119DD0: .4byte gUnknown_083F8DF4
_08119DD4: .4byte 0x02019000
_08119DD8: .4byte gUnknown_083FA61E
_08119DDC:
	ldr r3, _08119E18
	ldr r2, _08119E1C
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x34]
	ldrb r0, [r3, 0x1]
	cmp r0, 0x12
	bhi _08119DFC
	adds r0, 0x1
	strb r0, [r3, 0x1]
_08119DFC:
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08119E24
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119E20
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0xA]
	b _08119E36
	.align 2, 0
_08119E18: .4byte 0x02019000
_08119E1C: .4byte gUnknown_083FA61E
_08119E20: .4byte gUnknown_083F8DF4
_08119E24:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _08119E78
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0xA]
	adds r0, 0xB4
_08119E36:
	cmp r2, r0
	bne _08119E70
	ldr r2, _08119E7C
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08119E80
	str r1, [r0]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08119E84
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x3C]
_08119E70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119E78: .4byte gUnknown_083F8DF4
_08119E7C: .4byte gSprites
_08119E80: .4byte sub_8119898
_08119E84: .4byte SpriteCallbackDummy
	thumb_func_end sub_8119964

	thumb_func_start sub_8119A90
sub_8119A90: @ 8119E88
	adds r0, 0x3E
	ldrb r3, [r0]
	lsls r1, r3, 29
	lsrs r1, 31
	movs r2, 0x1
	eors r2, r1
	lsls r2, 2
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end sub_8119A90

	thumb_func_start sub_8119AAC
sub_8119AAC: @ 8119EA4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _08119EBC
	subs r0, r2, 0x1
	strh r0, [r4, 0x22]
	b _08119F0A
_08119EBC:
	ldr r0, _08119F10
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x5E
	bl m4aSongNumStop
	adds r0, r4, 0
	bl DestroySprite
	ldr r5, _08119F14
	ldr r4, _08119F18
	adds r4, 0x74
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_08119F0A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08119F10: .4byte SpriteCallbackDummy
_08119F14: .4byte gSprites
_08119F18: .4byte 0x02019000
	thumb_func_end sub_8119AAC

	thumb_func_start sub_8119B24
sub_8119B24: @ 8119F1C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	blt _08119F46
	subs r1, 0x1
	strh r1, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	lsls r1, 16
	cmp r1, 0
	bne _08119FB0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119FB0
	b _08119F6C
_08119F46:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	blt _08119F7C
	subs r0, r1, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _08119FB0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08119F74
_08119F6C:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _08119FB0
_08119F74:
	ldrh r0, [r4, 0x26]
	subs r0, 0x1
	strh r0, [r4, 0x26]
	b _08119FB0
_08119F7C:
	movs r0, 0x2B
	bl m4aSongNumStart
	ldr r0, _08119FB8
	ldr r0, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _08119FBC
	str r0, [r4, 0x1C]
	ldr r2, _08119FC0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2C
	ldrb r2, [r0]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r0]
_08119FB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08119FB8: .4byte 0x02019000
_08119FBC: .4byte sub_8119AAC
_08119FC0: .4byte gSprites
	thumb_func_end sub_8119B24

	thumb_func_start sub_8119BCC
sub_8119BCC: @ 8119FC4
	push {r4,r5,lr}
	sub sp, 0x14
	adds r4, r0, 0
	ldr r1, _0811A03C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	add r5, sp, 0x4
	ldr r1, _0811A040
	adds r0, r5, 0
	movs r2, 0x10
	bl memcpy
	ldrh r0, [r4, 0x30]
	subs r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0811A054
	ldr r0, _0811A044
	ldr r0, [r0, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0811A0EE
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r4, 0x74
	subs r4, r0
	lsrs r0, r4, 31
	adds r4, r0
	asrs r4, 1
	negs r4, r4
	ldr r0, _0811A048
	ldr r5, _0811A04C
	lsls r4, 24
	asrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _0811A050
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	b _0811A0EE
	.align 2, 0
_0811A03C: .4byte gUnknown_083FA64A
_0811A040: .4byte gUnknown_083FA64C
_0811A044: .4byte 0x02019000
_0811A048: .4byte gMPlay_SE1
_0811A04C: .4byte 0x0000ffff
_0811A050: .4byte gMPlay_SE2
_0811A054:
	lsls r0, r1, 16
	cmp r0, 0
	blt _0811A0A4
	ldr r0, _0811A0A0
	ldr r0, [r0, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	add r0, sp
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	subs r0, r1, r0
	lsls r0, 1
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r0, r2
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r1, r0
	lsls r1, 1
	mov r0, sp
	adds r0, 0x5
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	b _0811A0EE
	.align 2, 0
_0811A0A0: .4byte 0x02019000
_0811A0A4:
	movs r0, 0x5E
	bl m4aSongNumStartOrChange
	ldr r0, _0811A0C4
	ldr r0, [r0, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _0811A0C8
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	bl PlayCry1
	b _0811A0D4
	.align 2, 0
_0811A0C4: .4byte 0x02019000
_0811A0C8:
	movs r0, 0x98
	lsls r0, 1
	movs r1, 0x3F
	negs r1, r1
	bl PlayCry1
_0811A0D4:
	ldr r0, _0811A0F8
	ldr r0, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0x2D
	strh r0, [r4, 0x30]
	ldr r0, _0811A0FC
	str r0, [r4, 0x1C]
_0811A0EE:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A0F8: .4byte 0x02019000
_0811A0FC: .4byte sub_8119B24
	thumb_func_end sub_8119BCC

	thumb_func_start sub_8119D08
sub_8119D08: @ 811A100
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0811A15C
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldrh r0, [r4, 0x30]
	subs r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	blt _0811A168
	ldr r0, _0811A160
	ldr r0, [r0, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldr r1, _0811A164
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0811A16C
	.align 2, 0
_0811A15C: .4byte gUnknown_083FA64A
_0811A160: .4byte 0x02019000
_0811A164: .4byte gSprites
_0811A168:
	ldr r0, _0811A174
	str r0, [r4, 0x1C]
_0811A16C:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A174: .4byte sub_8119A90
	thumb_func_end sub_8119D08

	thumb_func_start sub_8119D80
sub_8119D80: @ 811A178
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, _0811A1B0
	ldr r1, [r3, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0811A1BC
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _0811A1B4
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x12]
	adds r0, 0x5A
	cmp r2, r0
	bne _0811A21E
	ldr r2, _0811A1B8
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x34
	b _0811A1E6
	.align 2, 0
_0811A1B0: .4byte 0x02019000
_0811A1B4: .4byte gUnknown_083F8DF4
_0811A1B8: .4byte gSprites
_0811A1BC:
	movs r0, 0x34
	ldrsh r2, [r1, r0]
	ldr r1, _0811A224
	ldrb r0, [r3, 0x4]
	lsls r0, 30
	lsrs r0, 25
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0x87
	lsls r1, 1
	adds r0, r1
	cmp r2, r0
	bne _0811A21E
	ldr r2, _0811A228
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r3, 0x2E
_0811A1E6:
	strh r3, [r0, 0x30]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0811A22C
	str r1, [r0]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0811A230
	str r1, [r0]
	movs r0, 0x2B
	bl m4aSongNumStart
_0811A21E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A224: .4byte gUnknown_083F8DF4
_0811A228: .4byte gSprites
_0811A22C: .4byte sub_8119D08
_0811A230: .4byte sub_8119BCC
	thumb_func_end sub_8119D80

	.align 2, 0 @ Don't pad with nop.
