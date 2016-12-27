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
	ldr r2, _08146404
	ldr r0, _08146408
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r0, _0814640C
	strh r1, [r0]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08146404: .4byte 0x04000012
_08146408: .4byte gUnknown_030041B4
_0814640C: .4byte 0x04000016
	thumb_func_end sub_814602C

	thumb_func_start sub_8146058
sub_8146058: @ 8146410
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0814642C
	ldr r1, _08146430
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _08146422
	b _08146608
_08146422:
	lsls r0, 2
	ldr r1, _08146434
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
	ldr r1, _08146480
	movs r0, 0
	strh r0, [r1]
	b _081465C4
	.align 2, 0
_08146480: .4byte 0x04000050
_08146484:
	bl ResetPaletteFade
	ldr r2, _0814649C
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _081464A0
	ldr r0, _081464A4
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
	ldr r0, _081464BC
	bl SetUpWindowConfig
	ldr r1, _081464C0
	ldr r0, _081464C4
	adds r1, r0
	b _081465CA
	.align 2, 0
_081464BC: .4byte gWindowConfig_81E6E18
_081464C0: .4byte gMain
_081464C4: .4byte 0x0000043c
_081464C8:
	ldr r0, _081464D0
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
	ldr r0, _081464EC
	ldr r1, _081464F0
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
	ldr r0, _0814650C
	ldr r1, _08146510
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _081465C4
	.align 2, 0
_0814650C: .4byte 0x02000000
_08146510: .4byte 0x0001ffff
_08146514:
	bl sub_81464E4
	ldr r1, _08146520
	ldr r0, _08146524
	adds r1, r0
	b _081465CA
	.align 2, 0
_08146520: .4byte gMain
_08146524: .4byte 0x0000043c
_08146528:
	ldr r0, _08146540
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _08146544
	strb r0, [r1]
	b _081465C4
	.align 2, 0
_08146540: .4byte gScriptItemId
_08146544: .4byte gUnknown_0203932C
_08146548:
	ldr r0, _08146560
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	ldr r1, _08146564
	ldr r0, _08146568
	adds r1, r0
	b _081465CA
	.align 2, 0
_08146560: .4byte gScriptItemId
_08146564: .4byte gMain
_08146568: .4byte 0x0000043c
_0814656C:
	ldr r3, _081465A4
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _081465A8
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081465AC
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081465B0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081465B4
	ldr r0, _081465B8
	adds r1, r0
	b _081465CA
	.align 2, 0
_081465A4: .4byte 0x04000208
_081465A8: .4byte 0x04000200
_081465AC: .4byte 0x04000004
_081465B0: .4byte sub_814602C
_081465B4: .4byte gMain
_081465B8: .4byte 0x0000043c
_081465BC:
	bl sub_8055870
	cmp r0, 0x1
	beq _08146608
_081465C4:
	ldr r1, _081465D4
	ldr r2, _081465D8
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
	ldr r2, _08146600
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08146604
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
BerryTagScreen_814625C: @ 8146614
	push {lr}
_08146616:
	bl sub_8146058
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08146630
	ldr r0, _0814662C
	movs r1, 0
	bl CreateTask
	b _0814663C
	.align 2, 0
_0814662C: .4byte sub_8146480
_08146630:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08146616
_0814663C:
	pop {r0}
	bx r0
	thumb_func_end BerryTagScreen_814625C

	thumb_func_start sub_8146288
sub_8146288: @ 8146640
	ldr r1, _08146660
	ldr r2, _08146664
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r2, 0xFE
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08146668
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0814666C
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08146660: .4byte 0x0400000a
_08146664: .4byte 0x00000502
_08146668: .4byte 0x00000703
_0814666C: .4byte gUnknown_030041B4
	thumb_func_end sub_8146288

	thumb_func_start sub_81462B8
sub_81462B8: @ 8146670
	push {r4-r7,lr}
	ldr r1, _0814668C
	ldr r2, _08146690
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x6
	bls _08146682
	b _081467BC
_08146682:
	lsls r0, 2
	ldr r1, _08146694
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
	ldr r0, _081466C0
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _08146782
	.align 2, 0
_081466C0: .4byte gBerryCheck_Gfx
_081466C4:
	ldr r0, _081466D4
	ldr r1, _081466D8
	bl LZDecompressVram
	ldr r1, _081466DC
	ldr r2, _081466E0
	adds r1, r2
	b _08146788
	.align 2, 0
_081466D4: .4byte gUnknown_08E788E4
_081466D8: .4byte 0x06002800
_081466DC: .4byte 0x02000000
_081466E0: .4byte 0x0001ffff
_081466E4:
	ldr r0, _081466F0
	ldr r1, _081466F4
	bl LZDecompressVram
	b _08146782
	.align 2, 0
_081466F0: .4byte gUnknown_08E78A84
_081466F4: .4byte 0x06003000
_081466F8:
	movs r1, 0
	ldr r7, _08146714
	adds r2, r7, 0
	ldr r6, _08146718
	ldr r5, _0814671C
	ldr r4, _08146720
	ldr r3, _08146724
_08146706:
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08146728
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	b _0814672E
	.align 2, 0
_08146714: .4byte 0x020221cc
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
	ldr r1, _0814674C
	ldr r0, _08146750
	str r7, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08146754
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _08146758
	add r1, r12
	b _08146788
	.align 2, 0
_0814674C: .4byte 0x06003800
_08146750: .4byte 0x040000d4
_08146754: .4byte 0x80000400
_08146758: .4byte 0x0001ffff
_0814675C:
	ldr r0, _08146770
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	ldr r1, _08146774
	ldr r2, _08146778
	adds r1, r2
	b _08146788
	.align 2, 0
_08146770: .4byte gBerryCheck_Pal
_08146774: .4byte 0x02000000
_08146778: .4byte 0x0001ffff
_0814677C:
	ldr r0, _08146790
	bl LoadCompressedObjectPic
_08146782:
	ldr r1, _08146794
	ldr r0, _08146798
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
	ldr r0, _081467B0
	bl LoadCompressedObjectPalette
	ldr r0, _081467B4
	ldr r1, _081467B8
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
	ldr r0, _081467F0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081467EA
	ldr r0, _081467F4
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
	ldr r1, _08146830
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08146834
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
	ldr r0, _08146894
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814688E
	ldr r5, _08146898
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
	ldr r4, _08146944
	ldrb r0, [r4]
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r5, r0, 0
	ldr r6, _08146948
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
	ldr r1, _0814694C
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
	ldr r0, _08146950
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
	ldr r4, _08146954
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
	ldr r0, _08146958
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
	ldr r0, _0814698C
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
_08146966:
	ldr r0, _08146990
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _08146998
	ldr r0, _08146994
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
	ldr r0, _081469AC
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
	ldr r5, _08146A48
	ldr r0, _08146A4C
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
	ldr r1, _08146A48
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
_081469F2:
	ldrb r0, [r4, 0x16]
	cmp r0, 0
	beq _08146A06
	movs r0, 0x58
	bl sub_80A7E5C
	ldr r1, _08146A48
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2]
_08146A06:
	ldrb r0, [r4, 0x17]
	cmp r0, 0
	beq _08146A1A
	movs r0, 0x80
	bl sub_80A7E5C
	ldr r1, _08146A48
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x4]
_08146A1A:
	ldrb r0, [r4, 0x18]
	cmp r0, 0
	beq _08146A2E
	movs r0, 0xA8
	bl sub_80A7E5C
	ldr r1, _08146A48
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x6]
_08146A2E:
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	beq _08146A42
	movs r0, 0xD0
	bl sub_80A7E5C
	ldr r1, _08146A48
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
sub_81466A0: @ 8146A50
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x1
	negs r7, r7
	ldr r6, _08146A8C
_08146A5A:
	lsls r0, r5, 1
	adds r4, r0, r6
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r7
	beq _08146A7A
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08146A90
	adds r0, r1
	bl DestroySprite
	ldr r0, _08146A94
	strh r0, [r4]
_08146A7A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _08146A5A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08146A8C: .4byte gUnknown_0203932E
_08146A90: .4byte gSprites
_08146A94: .4byte 0x0000ffff
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
	ldr r1, _08146AF8
	adds r6, r0, r1
	ldr r4, _08146AFC
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
_08146AF8: .4byte 0x03004b38
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
	ldr r0, _08146B30
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08146B34
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
sub_8146798: @ 8146B48
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08146BB0
	adds r0, r1
	ldr r2, _08146BB4
	ldrh r1, [r0]
	ldrh r5, [r2]
	adds r3, r1, r5
	movs r1, 0xFF
	ands r3, r1
	strh r3, [r2]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _08146B72
	cmp r3, 0x90
	beq _08146B7A
_08146B72:
	cmp r0, 0
	bge _08146B90
	cmp r3, 0x70
	bne _08146B90
_08146B7A:
	ldr r0, _08146BB8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	bl sub_8146810
	bl sub_81468BC
_08146B90:
	ldr r0, _08146BB4
	ldrh r2, [r0]
	cmp r2, 0
	bne _08146BAA
	ldr r0, _08146BB8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldr r0, _08146BBC
	str r0, [r1]
_08146BAA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146BB0: .4byte 0x03004b38
_08146BB4: .4byte gUnknown_030041B4
_08146BB8: .4byte gTasks
_08146BBC: .4byte sub_8146480
	thumb_func_end sub_8146798

	thumb_func_start sub_8146810
sub_8146810: @ 8146BC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r0, r3, 24
	asrs r1, r0, 24
	cmp r1, 0
	ble _08146BF8
	ldr r0, _08146BF0
	adds r4, r0, 0
	adds r4, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0x7
	ble _08146BF4
	adds r0, r3, 0
	adds r0, 0xF9
	adds r0, r2, r0
	ldrb r1, [r4, 0x1]
	adds r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x7
	b _08146C1E
	.align 2, 0
_08146BF0: .4byte gUnknown_03005D10
_08146BF4:
	adds r0, r2, r3
	b _08146C1E
_08146BF8:
	ldr r0, _08146C18
	adds r5, r0, 0
	adds r5, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0
	bge _08146C1C
	adds r0, r2, r3
	ldrb r1, [r5, 0x1]
	adds r0, r1
	movs r1, 0
	strb r0, [r5, 0x1]
	strb r1, [r6, 0xC]
	b _08146C20
	.align 2, 0
_08146C18: .4byte gUnknown_03005D10
_08146C1C:
	adds r0, r2, r4
_08146C1E:
	strb r0, [r6, 0xC]
_08146C20:
	ldr r2, _08146C5C
	movs r0, 0x3
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _08146C60
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, _08146C64
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08146C68
	adds r0, r1
	bl DestroySprite
	bl sub_81466A0
	bl sub_80A7DD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08146C5C: .4byte gScriptItemId
_08146C60: .4byte gUnknown_03005D24
_08146C64: .4byte gUnknown_0203932C
_08146C68: .4byte gSprites
	thumb_func_end sub_8146810

	thumb_func_start sub_81468BC
sub_81468BC: @ 8146C6C
	push {r4,lr}
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_81464E4
	ldr r4, _08146CA8
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _08146CAC
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
_08146CA8: .4byte gScriptItemId
_08146CAC: .4byte gUnknown_0203932C
	thumb_func_end sub_81468BC

	.align 2, 0 @ Don't pad with nop.
