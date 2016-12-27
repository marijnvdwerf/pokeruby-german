	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8093110
sub_8093110: @ 8093260
	push {lr}
	bl sub_80932AC
	ldr r0, _08093278
	bl SetMainCallback2
	ldr r0, _0809327C
	adds r0, 0x9C
	movs r1, 0x5
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08093278: .4byte sub_8093174
_0809327C: .4byte 0x02000000
	thumb_func_end sub_8093110

	thumb_func_start sub_8093130
sub_8093130: @ 8093280
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80932E4
	ldr r0, _080932B4
	bl SetMainCallback2
	ldr r2, _080932B8
	ldr r3, _080932BC
	ldr r0, _080932C0
	lsls r4, 2
	adds r4, r0
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x1A]
	adds r2, 0x9C
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080932B4: .4byte sub_8093174
_080932B8: .4byte 0x02000000
_080932BC: .4byte gLinkPlayers
_080932C0: .4byte gLinkPlayerMapObjects
	thumb_func_end sub_8093130

	thumb_func_start sub_8093174
sub_8093174: @ 80932C4
	push {lr}
	ldr r0, _080932DC
	ldr r1, _080932E0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bhi _08093382
	lsls r0, 2
	ldr r1, _080932E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080932DC: .4byte gMain
_080932E0: .4byte 0x0000043c
_080932E4: .4byte _080932E8
	.align 2, 0
_080932E8:
	.4byte _0809330C
	.4byte _08093316
	.4byte _0809331C
	.4byte _08093322
	.4byte _0809332C
	.4byte _0809333C
	.4byte _08093350
	.4byte _08093356
	.4byte _08093370
_0809330C:
	bl sub_8093534
	bl sub_8093688
	b _0809335A
_08093316:
	bl sub_8093598
	b _0809335A
_0809331C:
	bl sub_80935EC
	b _0809335A
_08093322:
	bl sub_8093610
	bl sub_80937A4
	b _0809335A
_0809332C:
	bl sub_80937BC
	ldr r1, _08093348
	ldr r0, _0809334C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0809333C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _08093382
	b _0809335A
	.align 2, 0
_08093348: .4byte gMain
_0809334C: .4byte 0x0000043c
_08093350:
	bl sub_80937F0
	b _0809335A
_08093356:
	bl sub_80937D8
_0809335A:
	ldr r1, _08093368
	ldr r0, _0809336C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08093382
	.align 2, 0
_08093368: .4byte gMain
_0809336C: .4byte 0x0000043c
_08093370:
	bl nullsub_15
	bl sub_8093800
	bl sub_8093550
	ldr r0, _08093388
	bl SetMainCallback2
_08093382:
	pop {r0}
	bx r0
	.align 2, 0
_08093388: .4byte sub_809323C
	thumb_func_end sub_8093174

	thumb_func_start sub_809323C
sub_809323C: @ 809338C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_809323C

	thumb_func_start sub_8093254
sub_8093254: @ 80933A4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r2, _080933EC
	ldrb r0, [r2, 0x6]
	adds r0, 0x1
	strb r0, [r2, 0x6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _080933CE
	movs r0, 0
	strb r0, [r2, 0x6]
	ldrb r0, [r2, 0x5]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2, 0x5]
_080933CE:
	ldrb r0, [r2, 0x4]
	cmp r0, 0
	beq _080933E8
	ldr r1, _080933F0
	ldr r0, _080933F4
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _080933F8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080933E8:
	pop {r0}
	bx r0
	.align 2, 0
_080933EC: .4byte 0x02000000
_080933F0: .4byte 0x040000d4
_080933F4: .4byte gUnknown_03004DE0
_080933F8: .4byte 0x800000a0
	thumb_func_end sub_8093254

	thumb_func_start sub_80932AC
sub_80932AC: @ 80933FC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0809342C
	movs r1, 0xFF
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08093430
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	adds r0, 0xC
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809342C: .4byte nullsub_60
_08093430: .4byte gTasks
	thumb_func_end sub_80932AC

	thumb_func_start sub_80932E4
sub_80932E4: @ 8093434
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809346C
	movs r1, 0xFF
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08093470
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	strh r4, [r0, 0xA]
	adds r0, 0xC
	adds r1, r5, 0
	bl StoreWordInTwoHalfwords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809346C: .4byte nullsub_60
_08093470: .4byte gTasks
	thumb_func_end sub_80932E4

	thumb_func_start sub_8093324
sub_8093324: @ 8093474
	push {r4,r5,lr}
	ldr r0, _080934BC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080934C0
	adds r4, r1, r0
	ldr r5, _080934C4
	ldrh r0, [r4, 0x8]
	strb r0, [r5, 0x1]
	adds r0, r4, 0
	adds r0, 0xC
	adds r1, r5, 0
	adds r1, 0x60
	bl LoadWordFromTwoHalfwords
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _080934CC
	ldr r2, _080934C8
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	adds r0, r5, 0
	adds r0, 0x64
	movs r2, 0x38
	bl memcpy
	b _080934D4
	.align 2, 0
_080934BC: .4byte nullsub_60
_080934C0: .4byte gTasks
_080934C4: .4byte 0x02000000
_080934C8: .4byte gTrainerCards
_080934CC:
	adds r0, r5, 0
	adds r0, 0x64
	bl sub_8093390
_080934D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8093324

	thumb_func_start nullsub_60
nullsub_60: @ 80934DC
	bx lr
	thumb_func_end nullsub_60

	thumb_func_start sub_8093390
sub_8093390: @ 80934E0
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _080935F4
	ldrb r0, [r6, 0x8]
	strb r0, [r5]
	ldrh r0, [r6, 0xE]
	strh r0, [r5, 0x10]
	ldrb r0, [r6, 0x10]
	strh r0, [r5, 0x12]
	movs r0, 0x1
	bl sub_8053108
	adds r4, r0, 0
	movs r0, 0xA
	bl sub_8053108
	cmp r0, 0
	bne _08093506
	movs r4, 0
_08093506:
	lsrs r0, r4, 16
	strh r0, [r5, 0x6]
	lsrs r0, r4, 8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x8]
	ands r4, r1
	strh r4, [r5, 0xA]
	ldr r0, _080935F8
	bl FlagGet
	strb r0, [r5, 0x2]
	bl sub_8090FC0
	strb r0, [r5, 0x3]
	bl GetPokedexSeenCount
	strh r0, [r5, 0xC]
	ldrb r1, [r6, 0xB]
	lsls r1, 8
	ldrb r0, [r6, 0xA]
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r7, _080935FC
	movs r0, 0x17
	adds r1, r7, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x14]
	movs r0, 0x18
	adds r1, r7, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x16]
	ldr r1, _08093600
	movs r0, 0x23
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x1C]
	ldr r4, _08093604
	movs r0, 0x22
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x1E]
	movs r0, 0x15
	adds r1, r4, 0
	bl sav12_xor_get_clamped_above
	strh r0, [r5, 0x20]
	movs r1, 0xAE
	lsls r1, 3
	adds r0, r6, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x18]
	ldr r2, _08093608
	adds r1, r6, r2
	ldrh r1, [r1]
	strh r1, [r5, 0x1A]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bls _08093586
	strh r7, [r5, 0x18]
_08093586:
	ldrh r0, [r5, 0x1A]
	cmp r0, r7
	bls _0809358E
	strh r7, [r5, 0x1A]
_0809358E:
	movs r4, 0
	bl sub_80C4D50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0809359E
	movs r4, 0x1
_0809359E:
	strb r4, [r5, 0x4]
	ldr r0, _0809360C
	movs r2, 0x92
	lsls r2, 3
	adds r1, r0, r2
	ldr r1, [r1]
	str r1, [r5, 0x24]
	movs r2, 0
	adds r6, r5, 0
	adds r6, 0x30
	adds r3, r5, 0
	adds r3, 0x28
	ldr r1, _08093610
	adds r4, r0, r1
_080935BA:
	lsls r0, r2, 1
	adds r1, r3, r0
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080935BA
	movs r2, 0
	adds r3, r6, 0
	ldr r4, _080935F4
_080935D4:
	adds r1, r3, r2
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080935D4
	adds r0, r5, 0
	bl sub_80934F4
	strb r0, [r5, 0x1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080935F4: .4byte gSaveBlock2
_080935F8: .4byte 0x00000801
_080935FC: .4byte 0x0000270f
_08093600: .4byte 0x000003e7
_08093604: .4byte 0x0000ffff
_08093608: .4byte 0x00000572
_0809360C: .4byte gSaveBlock1
_08093610: .4byte 0x00002b1c
	thumb_func_end sub_8093390

	thumb_func_start sub_80934C4
sub_80934C4: @ 8093614
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08093628
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_08093628: .4byte gTrainerCards
	thumb_func_end sub_80934C4

	thumb_func_start sav12_xor_get_clamped_above
sav12_xor_get_clamped_above: @ 809362C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8053108
	cmp r0, r4
	bls _0809363E
	adds r0, r4, 0
_0809363E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sav12_xor_get_clamped_above

	thumb_func_start sub_80934F4
sub_80934F4: @ 8093644
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	bne _08093656
	ldr r0, [r1, 0x8]
	cmp r0, 0
	beq _08093658
_08093656:
	movs r2, 0x1
_08093658:
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08093664
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08093664:
	ldrh r0, [r1, 0x1A]
	cmp r0, 0x31
	bls _08093670
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08093670:
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0809367C
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0809367C:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80934F4

	thumb_func_start sub_8093534
sub_8093534: @ 8093684
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end sub_8093534

	thumb_func_start sub_8093550
sub_8093550: @ 80936A0
	push {r4,lr}
	ldr r0, _080936D8
	bl SetVBlankCallback
	ldr r3, _080936DC
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _080936E0
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _080936E4
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080936D8: .4byte sub_8093254
_080936DC: .4byte 0x04000208
_080936E0: .4byte 0x04000200
_080936E4: .4byte 0x04000004
	thumb_func_end sub_8093550

	thumb_func_start sub_8093598
sub_8093598: @ 80936E8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	ldr r1, _08093734
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08093738
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08093706:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08093706
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093734: .4byte 0x040000d4
_08093738: .4byte 0x81000800
	thumb_func_end sub_8093598

	thumb_func_start sub_80935EC
sub_80935EC: @ 809373C
	sub sp, 0x4
	movs r2, 0xE0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08093758
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0809375C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08093758: .4byte 0x040000d4
_0809375C: .4byte 0x81000200
	thumb_func_end sub_80935EC

	thumb_func_start sub_8093610
sub_8093610: @ 8093760
	push {r4,r5,lr}
	ldr r5, _080937B4
	movs r1, 0
	strh r1, [r5]
	ldr r2, _080937B8
	strh r1, [r2]
	ldr r3, _080937BC
	strh r1, [r3]
	ldr r4, _080937C0
	strh r1, [r4]
	ldr r0, _080937C4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080937C8
	adds r0, r1, 0
	strh r0, [r5]
	ldr r1, _080937CC
	adds r0, r1, 0
	strh r0, [r2]
	ldr r1, _080937D0
	adds r0, r1, 0
	strh r0, [r3]
	ldr r1, _080937D4
	adds r0, r1, 0
	strh r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080937B4: .4byte 0x04000008
_080937B8: .4byte 0x0400000a
_080937BC: .4byte 0x0400000c
_080937C0: .4byte 0x0400000e
_080937C4: .4byte 0x04000010
_080937C8: .4byte 0x00001e08
_080937CC: .4byte 0x00000801
_080937D0: .4byte 0x00000902
_080937D4: .4byte 0x00000a03
	thumb_func_end sub_8093610

	thumb_func_start sub_8093688
sub_8093688: @ 80937D8
	push {r4-r6,lr}
	bl sub_8093324
	ldr r2, _08093820
	movs r1, 0
	strb r1, [r2]
	strb r1, [r2, 0x3]
	strb r1, [r2, 0x4]
	adds r0, r2, 0
	adds r0, 0x65
	ldrb r0, [r0]
	strb r0, [r2, 0x2]
	strb r1, [r2, 0x5]
	strb r1, [r2, 0x6]
	movs r4, 0
	adds r6, r2, 0
	adds r6, 0x20
	adds r5, r2, 0
	adds r5, 0x8C
_080937FE:
	lsls r0, r4, 4
	adds r0, r6
	lsls r1, r4, 1
	adds r1, r5, r1
	ldrh r1, [r1]
	bl ConvertEasyChatWordsToString
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080937FE
	bl sub_80936D4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093820: .4byte 0x02000000
	thumb_func_end sub_8093688

	thumb_func_start sub_80936D4
sub_80936D4: @ 8093824
	push {r4-r6,lr}
	ldr r4, _080938E8
	movs r0, 0
	strb r0, [r4, 0x7]
	strb r0, [r4, 0x8]
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0xB]
	strb r0, [r4, 0xC]
	strb r0, [r4, 0xD]
	adds r0, r4, 0
	adds r0, 0xE
	movs r1, 0
	movs r2, 0x8
	bl memset
	adds r0, r4, 0
	adds r0, 0x66
	ldrb r0, [r0]
	cmp r0, 0
	beq _08093854
	ldrb r0, [r4, 0x7]
	adds r0, 0x1
	strb r0, [r4, 0x7]
_08093854:
	adds r0, r4, 0
	adds r0, 0x6A
	ldrh r0, [r0]
	cmp r0, 0
	bne _08093864
	ldr r0, [r4, 0x6C]
	cmp r0, 0
	beq _0809386A
_08093864:
	ldrb r0, [r4, 0x8]
	adds r0, 0x1
	strb r0, [r4, 0x8]
_0809386A:
	ldr r1, _080938E8
	ldr r0, [r1, 0x78]
	cmp r0, 0
	beq _08093878
	ldrb r0, [r1, 0x9]
	adds r0, 0x1
	strb r0, [r1, 0x9]
_08093878:
	ldr r0, [r1, 0x7C]
	cmp r0, 0
	beq _08093884
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_08093884:
	adds r0, r1, 0
	adds r0, 0x80
	ldrh r0, [r0]
	cmp r0, 0
	beq _08093894
	ldrb r0, [r1, 0xB]
	adds r0, 0x1
	strb r0, [r1, 0xB]
_08093894:
	adds r0, r1, 0
	adds r0, 0x82
	ldrh r0, [r0]
	cmp r0, 0
	beq _080938A4
	ldrb r0, [r1, 0xC]
	adds r0, 0x1
	strb r0, [r1, 0xC]
_080938A4:
	adds r0, r1, 0
	adds r0, 0x84
	ldrh r0, [r0]
	cmp r0, 0
	beq _080938B4
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
_080938B4:
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080938E2
	movs r5, 0
	ldr r4, _080938EC
	adds r6, r1, 0
	adds r6, 0xE
_080938C2:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080938D8
	adds r1, r5, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080938D8:
	adds r4, 0x1
	adds r5, 0x1
	ldr r0, _080938F0
	cmp r4, r0
	bls _080938C2
_080938E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080938E8: .4byte 0x02000000
_080938EC: .4byte 0x00000807
_080938F0: .4byte 0x0000080e
	thumb_func_end sub_80936D4

	thumb_func_start sub_80937A4
sub_80937A4: @ 80938F4
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80937A4

	thumb_func_start sub_80937BC
sub_80937BC: @ 809390C
	push {r4,lr}
	ldr r4, _08093924
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl MultistepInitMenuWindowBegin
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093924: .4byte WindowConfig_TrainerCard_Back_Values
	thumb_func_end sub_80937BC

	thumb_func_start sub_80937D8
sub_80937D8: @ 8093928
	push {lr}
	bl sub_8093E04
	bl sub_8093E28
	bl sub_8093F64
	bl sub_8093DAC
	pop {r0}
	bx r0
	thumb_func_end sub_80937D8

	thumb_func_start sub_80937F0
sub_80937F0: @ 8093940
	push {lr}
	bl sub_8093EF8
	pop {r0}
	bx r0
	thumb_func_end sub_80937F0

	thumb_func_start nullsub_15
nullsub_15: @ 809394C
	bx lr
	thumb_func_end nullsub_15

	thumb_func_start sub_8093800
sub_8093800: @ 8093950
	push {lr}
	bl sub_809380C
	pop {r0}
	bx r0
	thumb_func_end sub_8093800

	thumb_func_start sub_809380C
sub_809380C: @ 809395C
	push {r4,lr}
	ldr r4, _08093978
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093978: .4byte sub_809382C
	thumb_func_end sub_809380C

	thumb_func_start sub_809382C
sub_809382C: @ 809397C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _080939A8
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r6, _080939AC
	ldr r5, _080939B0
_0809398E:
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0809398E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080939A8: .4byte gUnknown_083B5EBC
_080939AC: .4byte 0x02000000
_080939B0: .4byte gTasks
	thumb_func_end sub_809382C

	thumb_func_start sub_8093864
sub_8093864: @ 80939B4
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _080939F0
	ldr r2, _080939F4
	ldrb r1, [r2, 0x11]
	movs r0, 0x1
	ands r0, r1
	movs r5, 0
	strb r0, [r4, 0x5]
	ldrb r0, [r2, 0x12]
	strb r0, [r4, 0x6]
	bl sub_80939A4
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080939F0: .4byte 0x02000000
_080939F4: .4byte gSaveBlock2
	thumb_func_end sub_8093864

	thumb_func_start sub_80938A8
sub_80938A8: @ 80939F8
	push {lr}
	ldr r0, _08093A14
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08093A0E
	ldr r1, _08093A18
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08093A0E:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093A14: .4byte gPaletteFade
_08093A18: .4byte 0x02000000
	thumb_func_end sub_80938A8

	thumb_func_start sub_80938CC
sub_80938CC: @ 8093A1C
	push {lr}
	ldr r0, _08093A34
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08093A3C
	ldr r1, _08093A38
	movs r0, 0x5
	strb r0, [r1]
	movs r0, 0x1
	b _08093A64
	.align 2, 0
_08093A34: .4byte gMain
_08093A38: .4byte 0x02000000
_08093A3C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08093A62
	ldr r2, _08093A50
	ldrb r1, [r2, 0x3]
	cmp r1, 0
	beq _08093A54
	movs r0, 0x5
	b _08093A5C
	.align 2, 0
_08093A50: .4byte 0x02000000
_08093A54:
	movs r0, 0x1
	eors r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3
_08093A5C:
	strb r0, [r2]
	movs r0, 0x1
	b _08093A64
_08093A62:
	movs r0, 0
_08093A64:
	pop {r1}
	bx r1
	thumb_func_end sub_80938CC

	thumb_func_start sub_8093918
sub_8093918: @ 8093A68
	push {lr}
	bl sub_8093A28
	movs r0, 0x36
	bl PlaySE
	ldr r1, _08093A84
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093A84: .4byte 0x02000000
	thumb_func_end sub_8093918

	thumb_func_start sub_8093938
sub_8093938: @ 8093A88
	push {lr}
	bl sub_8093A48
	lsls r0, 24
	cmp r0, 0
	beq _08093A9A
	ldr r1, _08093AA0
	movs r0, 0x2
	strb r0, [r1]
_08093A9A:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093AA0: .4byte 0x02000000
	thumb_func_end sub_8093938

	thumb_func_start sub_8093954
sub_8093954: @ 8093AA4
	push {lr}
	sub sp, 0x4
	bl sub_80939C0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08093ACC
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_08093ACC: .4byte 0x02000000
	thumb_func_end sub_8093954

	thumb_func_start sub_8093980
sub_8093980: @ 8093AD0
	push {lr}
	ldr r0, _08093AEC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08093AE6
	ldr r0, _08093AF0
	ldr r0, [r0, 0x60]
	bl SetMainCallback2
_08093AE6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093AEC: .4byte gPaletteFade
_08093AF0: .4byte 0x02000000
	thumb_func_end sub_8093980

	thumb_func_start sub_80939A4
sub_80939A4: @ 8093AF4
	push {lr}
	ldr r0, _08093B08
	movs r1, 0
	bl CreateTask
	ldr r0, _08093B0C
	bl BasicInitMenuWindow
	pop {r0}
	bx r0
	.align 2, 0
_08093B08: .4byte sub_80939DC
_08093B0C: .4byte WindowConfig_TrainerCard_Back_Values
	thumb_func_end sub_80939A4

	thumb_func_start sub_80939C0
sub_80939C0: @ 8093B10
	push {lr}
	ldr r0, _08093B28
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08093B24
	bl DestroyTask
_08093B24:
	pop {r0}
	bx r0
	.align 2, 0
_08093B28: .4byte sub_80939DC
	thumb_func_end sub_80939C0

	thumb_func_start sub_80939DC
sub_80939DC: @ 8093B2C
	push {lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08093B70
	adds r2, r1, r0
	ldr r0, _08093B74
	ldrb r1, [r0, 0x5]
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r1, r0
	beq _08093B54
	strh r1, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x8]
_08093B54:
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	mov r0, sp
	bl TrainerCard_Front_PrintPlayTime
	mov r0, sp
	movs r1, 0xA
	movs r2, 0xC
	bl MenuPrint
	add sp, 0x20
	pop {r0}
	bx r0
	.align 2, 0
_08093B70: .4byte gTasks
_08093B74: .4byte 0x02000000
	thumb_func_end sub_80939DC

	thumb_func_start sub_8093A28
sub_8093A28: @ 8093B78
	push {r4,lr}
	ldr r4, _08093B94
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093B94: .4byte sub_8093A68
	thumb_func_end sub_8093A28

	thumb_func_start sub_8093A48
sub_8093A48: @ 8093B98
	push {lr}
	ldr r0, _08093BAC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08093BB0
	movs r0, 0
	b _08093BB2
	.align 2, 0
_08093BAC: .4byte sub_8093A68
_08093BB0:
	movs r0, 0x1
_08093BB2:
	pop {r1}
	bx r1
	thumb_func_end sub_8093A48

	thumb_func_start sub_8093A68
sub_8093A68: @ 8093BB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08093BE8
	ldr r2, _08093BEC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08093BCA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08093BCA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093BE8: .4byte gUnknown_083B5ED8
_08093BEC: .4byte gTasks
	thumb_func_end sub_8093A68

	thumb_func_start sub_8093AA0
sub_8093AA0: @ 8093BF0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08093C30
	movs r1, 0
	strb r1, [r0, 0x4]
	bl dp12_8087EA4
	movs r1, 0
	ldr r0, _08093C34
	ldr r2, _08093C38
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
_08093C0A:
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	bls _08093C0A
	ldr r0, _08093C3C
	bl SetHBlankCallback
	ldr r1, _08093C30
	movs r0, 0x1
	strb r0, [r1, 0x4]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093C30: .4byte 0x02000000
_08093C34: .4byte gUnknown_03004DE0
_08093C38: .4byte 0x0000fffc
_08093C3C: .4byte sub_8093D7C
	thumb_func_end sub_8093AA0

	thumb_func_start sub_8093AF0
sub_8093AF0: @ 8093C40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	ldr r1, _08093D4C
	movs r0, 0
	strb r0, [r1, 0x4]
	mov r2, r8
	ldrh r0, [r2, 0xA]
	adds r0, 0x3
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	ble _08093C68
	movs r0, 0x4F
	strh r0, [r2, 0xA]
_08093C68:
	mov r4, r8
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r0, 0xA0
	subs r0, r7
	mov r9, r0
	subs r4, r0, r7
	negs r0, r7
	lsls r6, r0, 16
	movs r0, 0xA0
	lsls r0, 16
	adds r1, r4, 0
	bl __udivsi3
	adds r5, r0, 0
	ldr r1, _08093D50
	adds r5, r1
	adds r0, r5, 0
	muls r0, r4
	adds r0, r6
	mov r10, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl __udivsi3
	str r0, [sp]
	lsls r5, 1
	movs r3, 0
	cmp r3, r7
	bcs _08093CC4
	ldr r2, _08093D54
	mov r12, r2
	ldr r0, _08093D58
	adds r4, r0, 0
_08093CAC:
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r0, 1
	add r1, r12
	subs r2, r4, r0
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, r7
	bcc _08093CAC
_08093CC4:
	lsls r2, r3, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r4, r10
	lsrs r7, r4, 16
	cmp r2, r0
	bge _08093CFE
	ldr r0, _08093D54
	mov r9, r0
	ldr r4, _08093D58
	mov r12, r4
	adds r4, r1, 0
_08093CDE:
	lsrs r1, r6, 16
	adds r6, r5
	ldr r0, [sp]
	subs r5, r0
	asrs r2, 16
	lsls r0, r2, 1
	add r0, r9
	add r1, r12
	strh r1, [r0]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _08093CDE
_08093CFE:
	adds r1, r7, 0
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x9F
	bgt _08093D24
	ldr r4, _08093D54
	ldr r0, _08093D58
	adds r2, r1, r0
_08093D0E:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r4
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x9F
	ble _08093D0E
_08093D24:
	movs r0, 0x1
	ldr r1, _08093D4C
	strb r0, [r1, 0x4]
	mov r2, r8
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	cmp r0, 0x4A
	ble _08093D3A
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08093D3A:
	movs r0, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093D4C: .4byte 0x02000000
_08093D50: .4byte 0xffff0000
_08093D54: .4byte gUnknown_03004DE0
_08093D58: .4byte 0x0000fffc
	thumb_func_end sub_8093AF0

	thumb_func_start sub_8093C0C
sub_8093C0C: @ 8093D5C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80939C0
	bl sub_8093DAC
	ldr r0, _08093D84
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	bne _08093D74
	bl sub_80939A4
_08093D74:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08093D84: .4byte 0x02000000
	thumb_func_end sub_8093C0C

	thumb_func_start sub_8093C38
sub_8093C38: @ 8093D88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	ldr r1, _08093E90
	movs r2, 0
	strb r2, [r1, 0x4]
	ldrh r0, [r0, 0xA]
	subs r0, 0x3
	mov r3, r8
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08093DAC
	strh r2, [r3, 0xA]
_08093DAC:
	mov r4, r8
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r0, 0xA0
	subs r0, r7
	mov r9, r0
	subs r4, r0, r7
	negs r0, r7
	lsls r6, r0, 16
	movs r0, 0xA0
	lsls r0, 16
	adds r1, r4, 0
	bl __udivsi3
	adds r5, r0, 0
	ldr r1, _08093E94
	adds r5, r1
	adds r0, r5, 0
	muls r0, r4
	adds r0, r6
	mov r10, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl __udivsi3
	str r0, [sp]
	lsrs r5, 1
	movs r3, 0
	cmp r3, r7
	bcs _08093E08
	ldr r2, _08093E98
	mov r12, r2
	ldr r0, _08093E9C
	adds r4, r0, 0
_08093DF0:
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, r0, 1
	add r1, r12
	subs r2, r4, r0
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, r7
	bcc _08093DF0
_08093E08:
	lsls r2, r3, 16
	mov r1, r9
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r4, r10
	lsrs r7, r4, 16
	cmp r2, r0
	bge _08093E42
	ldr r0, _08093E98
	mov r9, r0
	ldr r3, _08093E9C
	mov r12, r3
	adds r4, r1, 0
_08093E22:
	lsrs r1, r6, 16
	adds r6, r5
	ldr r0, [sp]
	adds r5, r0
	asrs r2, 16
	lsls r0, r2, 1
	add r0, r9
	add r1, r12
	strh r1, [r0]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _08093E22
_08093E42:
	adds r1, r7, 0
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x9F
	bgt _08093E68
	ldr r4, _08093E98
	ldr r0, _08093E9C
	adds r2, r1, r0
_08093E52:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r4
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x9F
	ble _08093E52
_08093E68:
	movs r0, 0x1
	ldr r1, _08093E90
	strb r0, [r1, 0x4]
	mov r2, r8
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bgt _08093E7E
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08093E7E:
	movs r0, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093E90: .4byte 0x02000000
_08093E94: .4byte 0xffff0000
_08093E98: .4byte gUnknown_03004DE0
_08093E9C: .4byte 0x0000fffc
	thumb_func_end sub_8093C38

	thumb_func_start sub_8093D50
sub_8093D50: @ 8093EA0
	push {lr}
	ldr r1, _08093EC4
	movs r0, 0
	strb r0, [r1, 0x4]
	bl SetHBlankCallback
	bl sub_8093E04
	ldr r0, _08093EC8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08093EC4: .4byte 0x02000000
_08093EC8: .4byte sub_8093A68
	thumb_func_end sub_8093D50

	thumb_func_start sub_8093D7C
sub_8093D7C: @ 8093ECC
	ldr r1, _08093EF0
	ldr r0, _08093EF4
	ldrh r2, [r0]
	movs r0, 0xFF
	ands r0, r2
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _08093EF8
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_08093EF0: .4byte gUnknown_03004DE0
_08093EF4: .4byte 0x04000006
_08093EF8: .4byte 0x04000012
	thumb_func_end sub_8093D7C

	thumb_func_start sub_8093DAC
sub_8093DAC: @ 8093EFC
	push {lr}
	ldr r0, _08093F0C
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _08093F10
	bl sub_8093DEC
	b _08093F14
	.align 2, 0
_08093F0C: .4byte 0x02000000
_08093F10:
	bl sub_8093DC8
_08093F14:
	pop {r0}
	bx r0
	thumb_func_end sub_8093DAC

	thumb_func_start sub_8093DC8
sub_8093DC8: @ 8093F18
	push {lr}
	bl MenuZeroFillScreen
	bl sub_80940E4
	bl sub_8093F14
	bl sub_8093F80
	bl sub_8093FD0
	bl sub_8094038
	bl sub_8094140
	pop {r0}
	bx r0
	thumb_func_end sub_8093DC8

	thumb_func_start sub_8093DEC
sub_8093DEC: @ 8093F3C
	push {lr}
	bl MenuZeroFillScreen
	bl sub_80940E4
	bl sub_8093F48
	bl sub_8094188
	pop {r0}
	bx r0
	thumb_func_end sub_8093DEC

	thumb_func_start sub_8093E04
sub_8093E04: @ 8093F54
	ldr r0, _08093F70
	ldr r2, _08093F74
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	movs r2, 0
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08093F70: .4byte 0x04000012
_08093F74: .4byte 0x0000fffc
	thumb_func_end sub_8093E04

	thumb_func_start sub_8093E28
sub_8093E28: @ 8093F78
	push {r4-r7,lr}
	bl sub_8093EA0
	ldr r0, _08093FD4
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r3, _08093FD8
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0xA4
	lsls r5, 5
	ldr r1, _08093FDC
	ldr r6, _08093FE0
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08093F9E:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _08093F9E
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08093FE4
	ldr r2, _08093FE8
	ldr r0, _08093FDC
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08093FEC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093FD4: .4byte gUnknown_083B5F6C
_08093FD8: .4byte gMenuTrainerCard_Gfx
_08093FDC: .4byte 0x040000d4
_08093FE0: .4byte 0x80000800
_08093FE4: .4byte gBadgesTiles
_08093FE8: .4byte 0x06001480
_08093FEC: .4byte 0x80000200
	thumb_func_end sub_8093E28

	thumb_func_start sub_8093EA0
sub_8093EA0: @ 8093FF0
	push {r4,lr}
	ldr r1, _08094034
	ldr r4, _08094038
	ldrb r0, [r4, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _0809403C
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08094040
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x64
	ldrb r0, [r4]
	cmp r0, 0
	beq _0809402C
	ldr r0, _08094044
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
_0809402C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094034: .4byte gUnknown_083B5EF8
_08094038: .4byte 0x02000000
_0809403C: .4byte gBadgesPalette
_08094040: .4byte gUnknown_083B5F4C
_08094044: .4byte gUnknown_083B5F0C
	thumb_func_end sub_8093EA0

	thumb_func_start sub_8093EF8
sub_8093EF8: @ 8094048
	push {lr}
	ldr r0, _0809405C
	adds r0, 0x64
	ldrb r0, [r0]
	ldr r2, _08094060
	movs r1, 0x50
	bl LoadTrainerGfx_TrainerCard
	pop {r0}
	bx r0
	.align 2, 0
_0809405C: .4byte 0x02000000
_08094060: .4byte 0x06001880
	thumb_func_end sub_8093EF8

	thumb_func_start sub_8093F14
sub_8093F14: @ 8094064
	push {lr}
	sub sp, 0x8
	ldr r0, _0809408C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _08094090
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, _08094094
	movs r2, 0xA0
	lsls r2, 1
	bl CpuFastSet
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809408C: .4byte gUnknown_083B5EEC
_08094090: .4byte 0x02000000
_08094094: .4byte 0x06004800
	thumb_func_end sub_8093F14

	thumb_func_start sub_8093F48
sub_8093F48: @ 8094098
	push {lr}
	ldr r0, _080940AC
	ldr r1, _080940B0
	movs r2, 0xA0
	lsls r2, 1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080940AC: .4byte gUnknown_08E8CFC0
_080940B0: .4byte 0x06004800
	thumb_func_end sub_8093F48

	thumb_func_start sub_8093F64
sub_8093F64: @ 80940B4
	push {lr}
	ldr r0, _080940C8
	ldr r1, _080940CC
	movs r2, 0xA0
	lsls r2, 1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080940C8: .4byte gUnknown_08E8D9C0
_080940CC: .4byte 0x06005000
	thumb_func_end sub_8093F64

	thumb_func_start sub_8093F80
sub_8093F80: @ 80940D0
	push {r4-r7,lr}
	movs r5, 0xC4
	ldr r7, _0809411C
	movs r1, 0x5
	movs r0, 0xA0
	lsls r0, 7
	adds r6, r0, 0
_080940DE:
	movs r0, 0x13
	lsls r3, r1, 16
	asrs r4, r3, 11
_080940E4:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	adds r1, r7
	adds r0, r5, 0
	orrs r0, r6
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1A
	ble _080940E4
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080940DE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809411C: .4byte 0x06004000
	thumb_func_end sub_8093F80

	thumb_func_start sub_8093FD0
sub_8093FD0: @ 8094120
	push {r4-r6,lr}
	ldr r4, _0809417C
	movs r2, 0xF
	ldr r0, _08094180
	ldrb r0, [r0, 0x2]
	adds r0, 0xF
	cmp r2, r0
	bge _08094152
	movs r6, 0xC0
	lsls r6, 1
	ldr r1, _08094184
	adds r5, r1, 0
	adds r3, r0, 0
_0809413A:
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r4
	adds r0, r6
	strh r5, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r2, r1, 16
	asrs r1, 16
	cmp r1, r3
	blt _0809413A
_08094152:
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x12
	bgt _08094174
	movs r3, 0xC0
	lsls r3, 1
	movs r2, 0
_08094160:
	asrs r0, r1, 16
	lsls r1, r0, 1
	adds r1, r4
	adds r1, r3
	strh r2, [r1]
	adds r0, 0x1
	lsls r1, r0, 16
	asrs r0, r1, 16
	cmp r0, 0x12
	ble _08094160
_08094174:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809417C: .4byte 0x06004000
_08094180: .4byte 0x02000000
_08094184: .4byte 0x0000408f
	thumb_func_end sub_8093FD0

	thumb_func_start sub_8094038
sub_8094038: @ 8094188
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r1, _08094220
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _08094212
	ldr r0, _08094224
	mov r9, r0
	movs r0, 0
	movs r2, 0x4
	adds r1, 0xE
	mov r8, r1
	ldr r7, _08094228
	movs r1, 0xC0
	lsls r1, 6
	adds r6, r1, 0
	adds r1, r7, 0x6
	mov r12, r1
_080941B0:
	lsls r0, 16
	asrs r4, r0, 16
	mov r1, r8
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r5, r2, 16
	cmp r0, 0
	beq _080941FE
	asrs r1, r5, 15
	add r1, r9
	movs r2, 0xF0
	lsls r2, 2
	adds r3, r1, r2
	lsls r2, r4, 3
	adds r0, r2, r7
	ldrh r0, [r0]
	orrs r0, r6
	strh r0, [r3]
	ldr r0, _0809422C
	adds r3, r1, r0
	adds r0, r7, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	orrs r0, r6
	strh r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	adds r3, r1, r0
	adds r0, r7, 0x4
	adds r0, r2, r0
	ldrh r0, [r0]
	orrs r0, r6
	strh r0, [r3]
	ldr r0, _08094230
	adds r1, r0
	add r2, r12
	ldrh r0, [r2]
	orrs r0, r6
	strh r0, [r1]
_080941FE:
	adds r1, r4, 0x1
	lsls r1, 16
	movs r2, 0xC0
	lsls r2, 10
	adds r0, r5, r2
	lsrs r2, r0, 16
	lsrs r0, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	ble _080941B0
_08094212:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094220: .4byte 0x02000000
_08094224: .4byte 0x06004000
_08094228: .4byte gUnknown_083B5F8C
_0809422C: .4byte 0x000003c2
_08094230: .4byte 0x00000402
	thumb_func_end sub_8094038

	thumb_func_start sub_80940E4
sub_80940E4: @ 8094234
	push {r4,lr}
	movs r2, 0
	ldr r1, _08094258
	movs r4, 0
	ldr r3, _0809425C
_0809423E:
	strh r4, [r1]
	lsls r0, r2, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	adds r1, 0x2
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r3
	ble _0809423E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094258: .4byte 0x06004000
_0809425C: .4byte 0x000003ff
	thumb_func_end sub_80940E4

	thumb_func_start sub_8094110
sub_8094110: @ 8094260
	push {r4-r6,lr}
	ldr r6, _0809428C
	movs r2, 0x3
	movs r5, 0xA0
	lsls r5, 2
	movs r3, 0x1
	movs r4, 0xB0
	lsls r4, 2
_08094270:
	lsls r0, r2, 1
	adds r0, r6
	adds r1, r0, r5
	strh r3, [r1]
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x10
	bls _08094270
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809428C: .4byte 0x06004800
	thumb_func_end sub_8094110

	thumb_func_start sub_8094140
sub_8094140: @ 8094290
	push {r4,r5,lr}
	ldr r0, _080942CC
	bl BasicInitMenuWindow
	ldr r4, _080942D0
	ldr r5, _080942D4
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringCopy
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl ConvertInternationalString
	adds r0, r4, 0
	movs r1, 0x7
	movs r2, 0x5
	bl MenuPrint
	bl TrainerCard_Front_PrintTrainerID
	bl TrainerCard_Front_PrintMoney
	bl TrainerCard_Front_PrintPokedexCount
	bl sub_809429C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080942CC: .4byte WindowConfig_TrainerCard_Back_Values
_080942D0: .4byte gStringVar1
_080942D4: .4byte 0x02000094
	thumb_func_end sub_8094140

	thumb_func_start sub_8094188
sub_8094188: @ 80942D8
	push {lr}
	ldr r0, _08094320
	bl BasicInitMenuWindow
	bl TrainerCard_Back_PrintName
	bl TrainerCard_Back_PrintHallOfFameTime_Label
	bl TrainerCard_Back_PrintLinkBattlesLabel
	bl TrainerCard_Back_PrintBattleTower_Label
	bl TrainerCard_Back_PrintLinkContests_Label
	bl TrainerCard_Back_PrintLinkPokeblocks_Label
	bl TrainerCard_Back_PrintPokemonTrades_Label
	ldr r0, _08094324
	bl BasicInitMenuWindow
	bl TrainerCard_Back_PrintHallOfFameTime
	bl TrainerCard_Back_PrintLinkBattles
	bl TrainerCard_Back_PrintBattleTower
	bl TrainerCard_Back_PrintLinkContests
	bl TrainerCard_Back_PrintLinkPokeblocks
	bl TrainerCard_Back_PrintPokemonTrades
	pop {r0}
	bx r0
	.align 2, 0
_08094320: .4byte WindowConfig_TrainerCard_Back_Values
_08094324: .4byte WindowConfig_TrainerCard_Back_Labels
	thumb_func_end sub_8094188

	thumb_func_start TrainerCard_Front_PrintTrainerID
TrainerCard_Front_PrintTrainerID: @ 8094328
	push {lr}
	sub sp, 0x8
	ldr r0, _0809434C
	adds r0, 0x72
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x14
	movs r2, 0x2
	bl MenuPrint
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0809434C: .4byte 0x02000000
	thumb_func_end TrainerCard_Front_PrintTrainerID

	thumb_func_start TrainerCard_Front_PrintMoney
TrainerCard_Front_PrintMoney: @ 8094350
	push {lr}
	ldr r0, _08094364
	adds r0, 0x88
	ldr r0, [r0]
	movs r1, 0x10
	movs r2, 0x8
	bl sub_80B7AEC
	pop {r0}
	bx r0
	.align 2, 0
_08094364: .4byte 0x02000000
	thumb_func_end TrainerCard_Front_PrintMoney

	thumb_func_start TrainerCard_Front_PrintPokedexCount
TrainerCard_Front_PrintPokedexCount: @ 8094368
	push {lr}
	sub sp, 0x10
	ldr r1, _0809437C
	ldrb r0, [r1, 0x7]
	cmp r0, 0
	bne _08094380
	bl sub_8094110
	b _0809439A
	.align 2, 0
_0809437C: .4byte 0x02000000
_08094380:
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x10
	movs r2, 0xA
	bl MenuPrint_RightAligned
_0809439A:
	add sp, 0x10
	pop {r0}
	bx r0
	thumb_func_end TrainerCard_Front_PrintPokedexCount

	thumb_func_start TrainerCard_Front_PrintPlayTime
TrainerCard_Front_PrintPlayTime: @ 80943A0
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r0, _080943E4
	ldrh r4, [r0, 0xE]
	ldrb r2, [r0, 0x10]
	ldr r1, _080943E8
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	beq _080943C2
	adds r0, r1, 0
	adds r0, 0x74
	ldrh r4, [r0]
	adds r0, 0x2
	ldrh r2, [r0]
_080943C2:
	lsls r3, 16
	asrs r3, 16
	mov r0, sp
	adds r1, r4, 0
	bl FormatPlayTime
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x30
	movs r3, 0x1
	bl sub_8072C74
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080943E4: .4byte gSaveBlock2
_080943E8: .4byte 0x02000000
	thumb_func_end TrainerCard_Front_PrintPlayTime

	thumb_func_start sub_809429C
sub_809429C: @ 80943EC
	push {r4-r6,lr}
	ldr r6, _08094440
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _0809443A
	ldr r0, _08094444
	adds r1, r6, 0
	adds r1, 0x20
	bl StringCopy
	movs r5, 0
	strb r5, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	adds r1, 0x30
	bl StringCopy
	ldr r4, _08094444
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xE
	bl MenuPrint
	adds r1, r6, 0
	adds r1, 0x40
	adds r0, r4, 0
	bl StringCopy
	strb r5, [r0]
	adds r0, 0x1
	adds r1, r6, 0
	adds r1, 0x50
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x10
	bl MenuPrint
_0809443A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094440: .4byte 0x02000000
_08094444: .4byte gStringVar1
	thumb_func_end sub_809429C

	thumb_func_start TrainerCard_Back_PrintName
TrainerCard_Back_PrintName: @ 8094448
	push {r4,r5,lr}
	ldr r4, _08094478
	ldr r5, _0809447C
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringCopy
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r1, _08094480
	adds r0, r4, 0
	bl de_sub_8073174
	adds r0, r4, 0
	movs r1, 0x1C
	movs r2, 0x2
	bl MenuPrint_RightAligned
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094478: .4byte gStringVar1
_0809447C: .4byte 0x02000094
_08094480: .4byte gOtherText_TrainersTrainerCard
	thumb_func_end TrainerCard_Back_PrintName

	thumb_func_start TrainerCard_Back_PrintHallOfFameTime_Label
TrainerCard_Back_PrintHallOfFameTime_Label: @ 8094484
	push {lr}
	ldr r0, _0809449C
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	beq _08094498
	ldr r0, _080944A0
	movs r1, 0x3
	movs r2, 0x5
	bl MenuPrint
_08094498:
	pop {r0}
	bx r0
	.align 2, 0
_0809449C: .4byte 0x02000000
_080944A0: .4byte gOtherText_FirstHOF
	thumb_func_end TrainerCard_Back_PrintHallOfFameTime_Label

	thumb_func_start TrainerCard_Back_PrintHallOfFameTime
TrainerCard_Back_PrintHallOfFameTime: @ 80944A4
	push {r4,r5,lr}
	ldr r5, _08094508
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	beq _08094500
	ldr r2, _0809450C
	adds r0, r5, 0
	adds r0, 0x6A
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	ldr r4, _08094510
	adds r1, r4, 0
	bl StringCopy
	adds r2, r0, 0
	adds r0, r5, 0
	adds r0, 0x6C
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r2, r0, 0
	adds r0, r5, 0
	adds r0, 0x6E
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0809450C
	movs r1, 0x1C
	movs r2, 0x5
	bl MenuPrint_RightAligned
_08094500:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094508: .4byte 0x02000000
_0809450C: .4byte gStringVar1
_08094510: .4byte gUnknown_083B5EF4
	thumb_func_end TrainerCard_Back_PrintHallOfFameTime

	thumb_func_start TrainerCard_Back_PrintLinkBattlesLabel
TrainerCard_Back_PrintLinkBattlesLabel: @ 8094514
	push {lr}
	ldr r0, _0809452C
	ldrb r0, [r0, 0x9]
	cmp r0, 0
	beq _08094528
	ldr r0, _08094530
	movs r1, 0x3
	movs r2, 0x7
	bl MenuPrint
_08094528:
	pop {r0}
	bx r0
	.align 2, 0
_0809452C: .4byte 0x02000000
_08094530: .4byte gOtherText_LinkCableBattles
	thumb_func_end TrainerCard_Back_PrintLinkBattlesLabel

	thumb_func_start TrainerCard_Back_PrintLinkBattles
TrainerCard_Back_PrintLinkBattles: @ 8094534
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _08094574
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0809456C
	adds r0, r4, 0
	adds r0, 0x78
	ldrh r1, [r0]
	mov r0, sp
	bl ConvertIntToDecimalString
	mov r0, sp
	movs r1, 0x16
	movs r2, 0x7
	bl MenuPrint_RightAligned
	adds r0, r4, 0
	adds r0, 0x7A
	ldrh r1, [r0]
	mov r0, sp
	bl ConvertIntToDecimalString
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0x7
	bl MenuPrint_RightAligned
_0809456C:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094574: .4byte 0x02000000
	thumb_func_end TrainerCard_Back_PrintLinkBattles

	thumb_func_start TrainerCard_Back_PrintBattleTower_Label
TrainerCard_Back_PrintBattleTower_Label: @ 8094578
	push {lr}
	ldr r0, _08094590
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _0809458C
	ldr r0, _08094594
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
_0809458C:
	pop {r0}
	bx r0
	.align 2, 0
_08094590: .4byte 0x02000000
_08094594: .4byte gOtherText_BattleTowerWinRecord
	thumb_func_end TrainerCard_Back_PrintBattleTower_Label

	thumb_func_start TrainerCard_Back_PrintBattleTower
TrainerCard_Back_PrintBattleTower: @ 8094598
	push {r4,lr}
	sub sp, 0x10
	ldr r4, _080945E4
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _080945DC
	adds r0, r4, 0
	adds r0, 0x7C
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	mov r0, sp
	movs r1, 0x70
	movs r2, 0x78
	movs r3, 0
	bl MenuPrint_PixelCoords
	adds r0, r4, 0
	adds r0, 0x7E
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	mov r0, sp
	movs r1, 0x95
	movs r2, 0x78
	movs r3, 0
	bl MenuPrint_PixelCoords
_080945DC:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080945E4: .4byte 0x02000000
	thumb_func_end TrainerCard_Back_PrintBattleTower

	thumb_func_start TrainerCard_Back_PrintLinkContests_Label
TrainerCard_Back_PrintLinkContests_Label: @ 80945E8
	push {lr}
	ldr r0, _08094600
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	beq _080945FC
	ldr r0, _08094604
	movs r1, 0x3
	movs r2, 0xD
	bl MenuPrint
_080945FC:
	pop {r0}
	bx r0
	.align 2, 0
_08094600: .4byte 0x02000000
_08094604: .4byte gOtherText_ContestRecord
	thumb_func_end TrainerCard_Back_PrintLinkContests_Label

	thumb_func_start TrainerCard_Back_PrintLinkContests
TrainerCard_Back_PrintLinkContests: @ 8094608
	push {lr}
	sub sp, 0x8
	ldr r1, _08094634
	ldrb r0, [r1, 0xB]
	cmp r0, 0
	beq _0809462E
	adds r0, r1, 0
	adds r0, 0x80
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0xD
	bl MenuPrint_RightAligned
_0809462E:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08094634: .4byte 0x02000000
	thumb_func_end TrainerCard_Back_PrintLinkContests

	thumb_func_start TrainerCard_Back_PrintLinkPokeblocks_Label
TrainerCard_Back_PrintLinkPokeblocks_Label: @ 8094638
	push {lr}
	ldr r0, _08094650
	ldrb r0, [r0, 0xC]
	cmp r0, 0
	beq _0809464C
	ldr r0, _08094654
	movs r1, 0x3
	movs r2, 0xB
	bl MenuPrint
_0809464C:
	pop {r0}
	bx r0
	.align 2, 0
_08094650: .4byte 0x02000000
_08094654: .4byte gOtherText_MixingRecord
	thumb_func_end TrainerCard_Back_PrintLinkPokeblocks_Label

	thumb_func_start TrainerCard_Back_PrintLinkPokeblocks
TrainerCard_Back_PrintLinkPokeblocks: @ 8094658
	push {lr}
	sub sp, 0x8
	ldr r1, _08094684
	ldrb r0, [r1, 0xC]
	cmp r0, 0
	beq _0809467E
	adds r0, r1, 0
	adds r0, 0x82
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0xB
	bl MenuPrint_RightAligned
_0809467E:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08094684: .4byte 0x02000000
	thumb_func_end TrainerCard_Back_PrintLinkPokeblocks

	thumb_func_start TrainerCard_Back_PrintPokemonTrades_Label
TrainerCard_Back_PrintPokemonTrades_Label: @ 8094688
	push {lr}
	ldr r0, _080946A0
	ldrb r0, [r0, 0xD]
	cmp r0, 0
	beq _0809469C
	ldr r0, _080946A4
	movs r1, 0x3
	movs r2, 0x9
	bl MenuPrint
_0809469C:
	pop {r0}
	bx r0
	.align 2, 0
_080946A0: .4byte 0x02000000
_080946A4: .4byte gOtherText_TradeRecord
	thumb_func_end TrainerCard_Back_PrintPokemonTrades_Label

	thumb_func_start TrainerCard_Back_PrintPokemonTrades
TrainerCard_Back_PrintPokemonTrades: @ 80946A8
	push {lr}
	sub sp, 0x8
	ldr r1, _080946D4
	ldrb r0, [r1, 0xD]
	cmp r0, 0
	beq _080946CE
	adds r0, r1, 0
	adds r0, 0x84
	ldrh r1, [r0]
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x1C
	movs r2, 0x9
	bl MenuPrint_RightAligned
_080946CE:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080946D4: .4byte 0x02000000
	thumb_func_end TrainerCard_Back_PrintPokemonTrades

	thumb_func_start unref_sub_8094588
unref_sub_8094588: @ 80946D8
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r2, r1, 16
	ldr r4, _08094704
	ldr r0, _08094708
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _080946EE
	ldr r4, _0809470C
_080946EE:
	lsls r1, r3, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094704: .4byte gOtherText_Boy
_08094708: .4byte gSaveBlock2
_0809470C: .4byte gOtherText_Girl
	thumb_func_end unref_sub_8094588

	.align 2, 0 @ Don't pad with nop.
