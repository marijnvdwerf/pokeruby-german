	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8146014
sub_8146014: @ 81463CC
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8146014

	thumb_func_start sub_814602C
sub_814602C: @ 81463E4
	push {lr}
	ldr r2, _08146404 @ =REG_BG0VOFS
	ldr r0, _08146408 @ =gUnknown_030041B4
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r0, _0814640C @ =REG_BG1VOFS
	strh r1, [r0]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08146404: .4byte REG_BG0VOFS
_08146408: .4byte gUnknown_030041B4
_0814640C: .4byte REG_BG1VOFS
	thumb_func_end sub_814602C

	thumb_func_start sub_8146058
sub_8146058: @ 8146410
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0814642C @ =gMain
	ldr r1, _08146430 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _08146422
	b _08146608
_08146422:
	lsls r0, 2
	ldr r1, _08146434 @ =_08146438
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814642C: .4byte gMain
_08146430: .4byte 0x0000043c
_08146434: .4byte _08146438
	.align 2, 0
_08146438:
	.4byte _0814646C
	.4byte _08146484
	.4byte _081464A8
	.4byte _081464AE
	.4byte _081464C8
	.4byte _081464D4
	.4byte _081464F4
	.4byte _08146514
	.4byte _08146528
	.4byte _08146548
	.4byte _0814656C
	.4byte _081465BC
	.4byte _081465DC
_0814646C:
	bl sub_80F9438
	bl sub_80F9368
	bl sub_8146288
	ldr r1, _08146480 @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	b _081465C4
	.align 2, 0
_08146480: .4byte REG_BLDCNT
_08146484:
	bl ResetPaletteFade
	ldr r2, _0814649C @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _081464A0 @ =gMain
	ldr r0, _081464A4 @ =0x0000043c
	adds r1, r0
	b _081465CA
	.align 2, 0
_0814649C: .4byte gPaletteFade
_081464A0: .4byte gMain
_081464A4: .4byte 0x0000043c
_081464A8:
	bl ResetSpriteData
	b _081465C4
_081464AE:
	ldr r0, _081464BC @ =gWindowConfig_81E6E18
	bl SetUpWindowConfig
	ldr r1, _081464C0 @ =gMain
	ldr r0, _081464C4 @ =0x0000043c
	adds r1, r0
	b _081465CA
	.align 2, 0
_081464BC: .4byte gWindowConfig_81E6E18
_081464C0: .4byte gMain
_081464C4: .4byte 0x0000043c
_081464C8:
	ldr r0, _081464D0 @ =gWindowConfig_81E6E18
	bl MultistepInitMenuWindowBegin
	b _081465C4
	.align 2, 0
_081464D0: .4byte gWindowConfig_81E6E18
_081464D4:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _081464DE
	b _08146608
_081464DE:
	ldr r0, _081464EC @ =0x02000000
	ldr r1, _081464F0 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _081465C4
	.align 2, 0
_081464EC: .4byte 0x02000000
_081464F0: .4byte 0x0001ffff
_081464F4:
	bl sub_81462B8
	lsls r0, 24
	cmp r0, 0
	bne _08146500
	b _08146608
_08146500:
	ldr r0, _0814650C @ =0x02000000
	ldr r1, _08146510 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _081465C4
	.align 2, 0
_0814650C: .4byte 0x02000000
_08146510: .4byte 0x0001ffff
_08146514:
	bl sub_81464E4
	ldr r1, _08146520 @ =gMain
	ldr r0, _08146524 @ =0x0000043c
	adds r1, r0
	b _081465CA
	.align 2, 0
_08146520: .4byte gMain
_08146524: .4byte 0x0000043c
_08146528:
	ldr r0, _08146540 @ =gScriptItemId
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _08146544 @ =gUnknown_0203932C
	strb r0, [r1]
	b _081465C4
	.align 2, 0
_08146540: .4byte gScriptItemId
_08146544: .4byte gUnknown_0203932C
_08146548:
	ldr r0, _08146560 @ =gScriptItemId
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	ldr r1, _08146564 @ =gMain
	ldr r0, _08146568 @ =0x0000043c
	adds r1, r0
	b _081465CA
	.align 2, 0
_08146560: .4byte gScriptItemId
_08146564: .4byte gMain
_08146568: .4byte 0x0000043c
_0814656C:
	ldr r3, _081465A4 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _081465A8 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081465AC @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081465B0 @ =sub_814602C
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081465B4 @ =gMain
	ldr r0, _081465B8 @ =0x0000043c
	adds r1, r0
	b _081465CA
	.align 2, 0
_081465A4: .4byte 0x04000208
_081465A8: .4byte 0x04000200
_081465AC: .4byte REG_DISPSTAT
_081465B0: .4byte sub_814602C
_081465B4: .4byte gMain
_081465B8: .4byte 0x0000043c
_081465BC:
	bl sub_8055870
	cmp r0, 0x1
	beq _08146608
_081465C4:
	ldr r1, _081465D4 @ =gMain
	ldr r2, _081465D8 @ =0x0000043c
	adds r1, r2
_081465CA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146608
	.align 2, 0
_081465D4: .4byte gMain
_081465D8: .4byte 0x0000043c
_081465DC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08146600 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08146604 @ =sub_8146014
	bl SetMainCallback2
	movs r0, 0x1
	b _0814660A
	.align 2, 0
_08146600: .4byte gPaletteFade
_08146604: .4byte sub_8146014
_08146608:
	movs r0, 0
_0814660A:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8146058

	thumb_func_start BerryTagScreen_814625C
BerryTagScreen_814625C: @ 814625C
	push {lr}
_0814625E:
	bl sub_8146058
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08146278
	ldr r0, _08146274 @ =sub_8146480
	movs r1, 0
	bl CreateTask
	b _08146284
	.align 2, 0
_08146274: .4byte sub_8146480
_08146278:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0814625E
_08146284:
	pop {r0}
	bx r0
	thumb_func_end BerryTagScreen_814625C

	thumb_func_start sub_8146288
sub_8146288: @ 8146640
	ldr r1, _08146660 @ =REG_BG1CNT
	ldr r2, _08146664 @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r2, 0xFE
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08146668 @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0814666C @ =gUnknown_030041B4
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08146660: .4byte REG_BG1CNT
_08146664: .4byte 0x00000502
_08146668: .4byte 0x00000703
_0814666C: .4byte gUnknown_030041B4
	thumb_func_end sub_8146288

	thumb_func_start sub_81462B8
sub_81462B8: @ 8146670
	push {r4-r7,lr}
	ldr r1, _0814668C @ =0x02000000
	ldr r2, _08146690 @ =0x0001ffff
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x6
	bls _08146682
	b _081467BC
_08146682:
	lsls r0, 2
	ldr r1, _08146694 @ =_08146698
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814668C: .4byte 0x02000000
_08146690: .4byte 0x0001ffff
_08146694: .4byte _08146698
	.align 2, 0
_08146698:
	.4byte _081466B4
	.4byte _081466C4
	.4byte _081466E4
	.4byte _081466F8
	.4byte _0814675C
	.4byte _0814677C
	.4byte _0814679C
_081466B4:
	ldr r0, _081466C0 @ =gBerryCheck_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _08146782
	.align 2, 0
_081466C0: .4byte gBerryCheck_Gfx
_081466C4:
	ldr r0, _081466D4 @ =gUnknown_08E788E4
	ldr r1, _081466D8 @ =0x06002800
	bl LZDecompressVram
	ldr r1, _081466DC @ =0x02000000
	ldr r2, _081466E0 @ =0x0001ffff
	adds r1, r2
	b _08146788
	.align 2, 0
_081466D4: .4byte gUnknown_08E788E4
_081466D8: .4byte 0x06002800
_081466DC: .4byte 0x02000000
_081466E0: .4byte 0x0001ffff
_081466E4:
	ldr r0, _081466F0 @ =gUnknown_08E78A84
	ldr r1, _081466F4 @ =0x06003000
	bl LZDecompressVram
	b _08146782
	.align 2, 0
_081466F0: .4byte gUnknown_08E78A84
_081466F4: .4byte 0x06003000
_081466F8:
	movs r1, 0
	ldr r7, _08146714 @ =gBGTilemapBuffers + 0x1000
	adds r2, r7, 0
	ldr r6, _08146718 @ =0x00004042
	ldr r5, _0814671C @ =gSaveBlock2
	ldr r4, _08146720 @ =0x00005042
	ldr r3, _08146724 @ =0x000003ff
_08146706:
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08146728
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	b _0814672E
	.align 2, 0
_08146714: .4byte gBGTilemapBuffers + 0x1000
_08146718: .4byte 0x00004042
_0814671C: .4byte gSaveBlock2
_08146720: .4byte 0x00005042
_08146724: .4byte 0x000003ff
_08146728:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
_0814672E:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08146706
	ldr r1, _0814674C @ =0x06003800
	ldr r0, _08146750 @ =0x040000d4
	str r7, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08146754 @ =0x80000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _08146758 @ =0x0001ffff
	add r1, r12
	b _08146788
	.align 2, 0
_0814674C: .4byte 0x06003800
_08146750: .4byte 0x040000d4
_08146754: .4byte 0x80000400
_08146758: .4byte 0x0001ffff
_0814675C:
	ldr r0, _08146770 @ =gBerryCheck_Pal
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	ldr r1, _08146774 @ =0x02000000
	ldr r2, _08146778 @ =0x0001ffff
	adds r1, r2
	b _08146788
	.align 2, 0
_08146770: .4byte gBerryCheck_Pal
_08146774: .4byte 0x02000000
_08146778: .4byte 0x0001ffff
_0814677C:
	ldr r0, _08146790 @ =gUnknown_083C1F74
	bl LoadCompressedObjectPic
_08146782:
	ldr r1, _08146794 @ =0x02000000
	ldr r0, _08146798 @ =0x0001ffff
	adds r1, r0
_08146788:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081467BC
	.align 2, 0
_08146790: .4byte gUnknown_083C1F74
_08146794: .4byte 0x02000000
_08146798: .4byte 0x0001ffff
_0814679C:
	ldr r0, _081467B0 @ =gUnknown_083C1F7C
	bl LoadCompressedObjectPalette
	ldr r0, _081467B4 @ =0x02000000
	ldr r1, _081467B8 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _081467BE
	.align 2, 0
_081467B0: .4byte gUnknown_083C1F7C
_081467B4: .4byte 0x02000000
_081467B8: .4byte 0x0001ffff
_081467BC:
	movs r0, 0
_081467BE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81462B8

	thumb_func_start sub_814640C
sub_814640C: @ 81467C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _081467F0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081467EA
	ldr r0, _081467F4 @ =sub_80A5B40
	bl SetMainCallback2
	bl sub_80A7DD4
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_081467EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081467F0: .4byte gPaletteFade
_081467F4: .4byte sub_80A5B40
	thumb_func_end sub_814640C

	thumb_func_start sub_8146440
sub_8146440: @ 81467F8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08146830 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08146834 @ =sub_814640C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146830: .4byte gTasks
_08146834: .4byte sub_814640C
	thumb_func_end sub_8146440

	thumb_func_start sub_8146480
sub_8146480: @ 8146838
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r0, _08146894 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814688E
	ldr r5, _08146898 @ =gMain
	ldrh r1, [r5, 0x30]
	movs r6, 0xF0
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x40
	bne _08146864
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl sub_81466E8
_08146864:
	ldrh r1, [r5, 0x30]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x80
	bne _08146876
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81466E8
_08146876:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08146888
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0814688E
_08146888:
	adds r0, r7, 0
	bl sub_8146440
_0814688E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08146894: .4byte gPaletteFade
_08146898: .4byte gMain
	thumb_func_end sub_8146480

	thumb_func_start sub_81464E4
sub_81464E4: @ 814689C
	push {r4-r6,lr}
	sub sp, 0x10
	ldr r4, _08146944 @ =gScriptItemId
	ldrb r0, [r4]
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r5, r0, 0
	ldr r6, _08146948 @ =gStringVar1
	ldrh r1, [r4]
	subs r1, 0x84
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	movs r1, 0xC
	movs r2, 0x4
	bl MenuPrint
	mov r0, sp
	adds r1, r5, 0
	bl StringCopy
	ldr r1, _0814694C @ =gOtherText_Berry2
	mov r0, sp
	bl StringAppend
	mov r0, sp
	movs r1, 0xE
	movs r2, 0x4
	bl MenuPrint
	ldr r0, [r5, 0xC]
	movs r1, 0x4
	movs r2, 0xE
	bl MenuPrint
	ldr r0, [r5, 0x10]
	movs r1, 0x4
	movs r2, 0x10
	bl MenuPrint
	ldr r0, _08146950 @ =gOtherText_Size
	movs r1, 0xB
	movs r2, 0x7
	bl MenuPrint
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _0814695C
	movs r1, 0xA
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r4, _08146954 @ =gStringVar2
	ldrh r0, [r5, 0x8]
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _08146958 @ =gContestStatsText_Unknown1
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	b _08146966
	.align 2, 0
_08146944: .4byte gScriptItemId
_08146948: .4byte gStringVar1
_0814694C: .4byte gOtherText_Berry2
_08146950: .4byte gOtherText_Size
_08146954: .4byte gStringVar2
_08146958: .4byte gContestStatsText_Unknown1
_0814695C:
	ldr r0, _0814698C @ =gOtherText_ThreeQuestions2
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
_08146966:
	ldr r0, _08146990 @ =gOtherText_Firm
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _08146998
	ldr r0, _08146994 @ =gUnknown_0841192C
	ldrb r1, [r5, 0x7]
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
	b _081469A2
	.align 2, 0
_0814698C: .4byte gOtherText_ThreeQuestions2
_08146990: .4byte gOtherText_Firm
_08146994: .4byte gUnknown_0841192C
_08146998:
	ldr r0, _081469AC @ =gOtherText_ThreeQuestions2
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
_081469A2:
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081469AC: .4byte gOtherText_ThreeQuestions2
	thumb_func_end sub_81464E4

	thumb_func_start sub_8146600
sub_8146600: @ 81469B0
	push {r4,r5,lr}
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	bl GetBerryInfo
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _08146A48 @ =gUnknown_0203932E
	ldr r0, _08146A4C @ =0x0000ffff
	adds r3, r0, 0
_081469CA:
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _081469CA
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _081469F2
	movs r0, 0x30
	bl sub_80A7E5C
	ldr r1, _08146A48 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
_081469F2:
	ldrb r0, [r4, 0x16]
	cmp r0, 0
	beq _08146A06
	movs r0, 0x58
	bl sub_80A7E5C
	ldr r1, _08146A48 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2]
_08146A06:
	ldrb r0, [r4, 0x17]
	cmp r0, 0
	beq _08146A1A
	movs r0, 0x80
	bl sub_80A7E5C
	ldr r1, _08146A48 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x4]
_08146A1A:
	ldrb r0, [r4, 0x18]
	cmp r0, 0
	beq _08146A2E
	movs r0, 0xA8
	bl sub_80A7E5C
	ldr r1, _08146A48 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x6]
_08146A2E:
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	beq _08146A42
	movs r0, 0xD0
	bl sub_80A7E5C
	ldr r1, _08146A48 @ =gUnknown_0203932E
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
_08146A42:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146A48: .4byte gUnknown_0203932E
_08146A4C: .4byte 0x0000ffff
	thumb_func_end sub_8146600

	thumb_func_start sub_81466A0
sub_81466A0: @ 81466A0
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x1
	negs r7, r7
	ldr r6, _081466DC @ =gUnknown_0203932E
_081466AA:
	lsls r0, r5, 1
	adds r4, r0, r6
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r7
	beq _081466CA
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081466E0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r0, _081466E4 @ =0x0000ffff
	strh r0, [r4]
_081466CA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _081466AA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081466DC: .4byte gUnknown_0203932E
_081466E0: .4byte gSprites
_081466E4: .4byte 0x0000ffff
	thumb_func_end sub_81466A0

	thumb_func_start sub_81466E8
sub_81466E8: @ 8146A98
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08146AF8 @ =gTasks + 0x8
	adds r6, r0, r1
	ldr r4, _08146AFC @ =gUnknown_03005D10
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	ldrb r1, [r0, 0x1]
	ldrb r0, [r4, 0xC]
	adds r1, r0
	cmp r1, 0
	bne _08146AC8
	lsls r0, r2, 24
	cmp r0, 0
	blt _08146B3C
_08146AC8:
	adds r0, r1, 0x1
	lsls r5, r2, 24
	mov r1, r8
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	bne _08146AD8
	cmp r5, 0
	bgt _08146B3C
_08146AD8:
	movs r0, 0x5
	bl PlaySE
	mov r2, r8
	ldrb r3, [r2, 0x1]
	ldrb r4, [r4, 0xC]
	mov r12, r4
	adds r0, r3, r4
	asrs r2, r5, 24
	adds r1, r0, r2
	cmp r1, 0
	bge _08146B00
	negs r0, r0
	strh r0, [r6, 0x2]
	b _08146B16
	.align 2, 0
_08146AF8: .4byte gTasks + 0x8
_08146AFC: .4byte gUnknown_03005D10
_08146B00:
	mov r4, r8
	ldrb r0, [r4, 0x2]
	cmp r1, r0
	blt _08146B14
	subs r0, r3
	mov r1, r12
	subs r0, r1
	subs r0, 0x1
	strh r0, [r6, 0x2]
	b _08146B16
_08146B14:
	strh r2, [r6, 0x2]
_08146B16:
	ldr r0, _08146B30 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08146B34 @ =sub_8146798
	str r0, [r1]
	cmp r5, 0
	bge _08146B38
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	b _08146B3A
	.align 2, 0
_08146B30: .4byte gTasks
_08146B34: .4byte sub_8146798
_08146B38:
	movs r0, 0x10
_08146B3A:
	strh r0, [r6]
_08146B3C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81466E8

	thumb_func_start sub_8146798
sub_8146798: @ 8146798
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08146800 @ =gTasks + 0x8
	adds r0, r1
	ldr r2, _08146804 @ =gUnknown_030041B4
	ldrh r1, [r0]
	ldrh r5, [r2]
	adds r3, r1, r5
	movs r1, 0xFF
	ands r3, r1
	strh r3, [r2]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _081467C2
	cmp r3, 0x90
	beq _081467CA
_081467C2:
	cmp r0, 0
	bge _081467E0
	cmp r3, 0x70
	bne _081467E0
_081467CA:
	ldr r0, _08146808 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	bl sub_8146810
	bl sub_81468BC
_081467E0:
	ldr r0, _08146804 @ =gUnknown_030041B4
	ldrh r2, [r0]
	cmp r2, 0
	bne _081467FA
	ldr r0, _08146808 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldr r0, _0814680C @ =sub_8146480
	str r0, [r1]
_081467FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146800: .4byte gTasks + 0x8
_08146804: .4byte gUnknown_030041B4
_08146808: .4byte gTasks
_0814680C: .4byte sub_8146480
	thumb_func_end sub_8146798

	thumb_func_start sub_8146810
sub_8146810: @ 8146810
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r0, r3, 24
	asrs r1, r0, 24
	cmp r1, 0
	ble _08146848
	ldr r0, _08146840 @ =gUnknown_03005D10
	adds r4, r0, 0
	adds r4, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0x7
	ble _08146844
	adds r0, r3, 0
	adds r0, 0xF9
	adds r0, r2, r0
	ldrb r1, [r4, 0x1]
	adds r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x7
	b _0814686E
	.align 2, 0
_08146840: .4byte gUnknown_03005D10
_08146844:
	adds r0, r2, r3
	b _0814686E
_08146848:
	ldr r0, _08146868 @ =gUnknown_03005D10
	adds r5, r0, 0
	adds r5, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0
	bge _0814686C
	adds r0, r2, r3
	ldrb r1, [r5, 0x1]
	adds r0, r1
	movs r1, 0
	strb r0, [r5, 0x1]
	strb r1, [r6, 0xC]
	b _08146870
	.align 2, 0
_08146868: .4byte gUnknown_03005D10
_0814686C:
	adds r0, r2, r4
_0814686E:
	strb r0, [r6, 0xC]
_08146870:
	ldr r2, _081468AC @ =gScriptItemId
	movs r0, 0x3
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _081468B0 @ =gUnknown_03005D24
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, _081468B4 @ =gUnknown_0203932C
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081468B8 @ =gSprites
	adds r0, r1
	bl DestroySprite
	bl sub_81466A0
	bl sub_80A7DD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081468AC: .4byte gScriptItemId
_081468B0: .4byte gUnknown_03005D24
_081468B4: .4byte gUnknown_0203932C
_081468B8: .4byte gSprites
	thumb_func_end sub_8146810

	thumb_func_start sub_81468BC
sub_81468BC: @ 81468BC
	push {r4,lr}
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_81464E4
	ldr r4, _081468F8 @ =gScriptItemId
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _081468FC @ =gUnknown_0203932C
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081468F8: .4byte gScriptItemId
_081468FC: .4byte gUnknown_0203932C
	thumb_func_end sub_81468BC

	.align 2, 0 @ Don't pad with nop.
