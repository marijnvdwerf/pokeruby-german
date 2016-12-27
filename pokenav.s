	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EBA5C
sub_80EBA5C: @ 80EBE10
	push {lr}
	ldr r0, _080EBE28
	ldr r2, _080EBE2C
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0xE
	bhi _080EBE70
	lsls r0, 2
	ldr r1, _080EBE30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EBE28: .4byte gMain
_080EBE2C: .4byte 0x0000043c
_080EBE30: .4byte _080EBE34
	.align 2, 0
_080EBE34:
	.4byte _080EBE74
	.4byte _080EBEBC
	.4byte _080EBEC4
	.4byte _080EBECA
	.4byte _080EBED0
	.4byte _080EBED6
	.4byte _080EBEDC
	.4byte _080EBEE2
	.4byte _080EBEF2
	.4byte _080EBF00
	.4byte _080EBF10
	.4byte _080EBF20
	.4byte _080EBF30
	.4byte _080EBF44
	.4byte _080EBF54
_080EBE70:
	movs r0, 0
	strb r0, [r1]
_080EBE74:
	bl is_c1_link_related_active
	ldr r3, _080EBEA4
	ldr r2, _080EBEA8
	adds r1, r3, r2
	strb r0, [r1]
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080EBF74
	ldr r1, _080EBEAC
	adds r0, r3, r1
	strb r2, [r0]
	ldr r1, _080EBEB0
	ldr r2, _080EBEB4
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _080EBEB8
	bl SetMainCallback2
	b _080EBF74
	.align 2, 0
_080EBEA4: .4byte 0x02000000
_080EBEA8: .4byte 0x00006dac
_080EBEAC: .4byte 0x00006dab
_080EBEB0: .4byte gMain
_080EBEB4: .4byte 0x0000043c
_080EBEB8: .4byte sub_80EBBE8
_080EBEBC:
	movs r0, 0
	bl SetVBlankCallback
	b _080EBF74
_080EBEC4:
	bl ResetPaletteFade
	b _080EBF74
_080EBECA:
	bl ResetSpriteData
	b _080EBF74
_080EBED0:
	bl FreeAllSpritePalettes
	b _080EBF74
_080EBED6:
	bl ResetTasks
	b _080EBF74
_080EBEDC:
	bl remove_some_task
	b _080EBF74
_080EBEE2:
	bl sub_80F1A90
	ldr r1, _080EBEF8
	ldr r0, _080EBEFC
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080EBEF2:
	bl sub_80F1AC4
	b _080EBF34
	.align 2, 0
_080EBEF8: .4byte gMain
_080EBEFC: .4byte 0x0000043c
_080EBF00:
	bl sub_80F2688
	ldr r1, _080EBF18
	ldr r2, _080EBF1C
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080EBF10:
	bl sub_80F26BC
	b _080EBF34
	.align 2, 0
_080EBF18: .4byte gMain
_080EBF1C: .4byte 0x0000043c
_080EBF20:
	bl sub_80F36F0
	ldr r1, _080EBF3C
	ldr r0, _080EBF40
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080EBF30:
	bl sub_80F3724
_080EBF34:
	lsls r0, 24
	cmp r0, 0
	bne _080EBF80
	b _080EBF74
	.align 2, 0
_080EBF3C: .4byte gMain
_080EBF40: .4byte 0x0000043c
_080EBF44:
	bl sub_80EBC10
	ldr r0, _080EBF50
	bl sub_80EBDBC
	b _080EBF74
	.align 2, 0
_080EBF50: .4byte sub_80EBDD8
_080EBF54:
	ldr r0, _080EBF84
	ldr r1, _080EBF88
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	movs r0, 0x6E
	bl PlaySE
	ldr r0, _080EBF8C
	bl SetMainCallback2
	ldr r0, _080EBF90
	bl SetVBlankCallback
	bl sub_80F1A74
_080EBF74:
	ldr r1, _080EBF94
	ldr r2, _080EBF98
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080EBF80:
	pop {r0}
	bx r0
	.align 2, 0
_080EBF84: .4byte 0x02000000
_080EBF88: .4byte 0x00006dab
_080EBF8C: .4byte sub_80EBD90
_080EBF90: .4byte sub_80EBD18
_080EBF94: .4byte gMain
_080EBF98: .4byte 0x0000043c
	thumb_func_end sub_80EBA5C

	thumb_func_start sub_80EBBE8
sub_80EBBE8: @ 80EBF9C
	push {r4,lr}
	ldr r0, _080EBFBC
	ldr r2, _080EBFC0
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080EBFB6
	adds r4, r1, 0
_080EBFAC:
	bl sub_80EBA5C
	ldrb r0, [r4]
	cmp r0, 0
	beq _080EBFAC
_080EBFB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBFBC: .4byte 0x02000000
_080EBFC0: .4byte 0x00006dab
	thumb_func_end sub_80EBBE8

	thumb_func_start sub_80EBC10
sub_80EBC10: @ 80EBFC4
	push {r4-r7,lr}
	ldr r1, _080EC030
	movs r0, 0x14
	strh r0, [r1]
	bl CalculatePlayerPartyCount
	ldr r2, _080EC034
	ldr r1, _080EC038
	adds r3, r2, r1
	movs r1, 0
	strb r0, [r3]
	ldr r3, _080EC03C
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _080EC040
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _080EC044
	adds r0, r2, r3
	str r1, [r0]
	ldr r3, _080EC048
	adds r0, r2, r3
	str r1, [r0]
	movs r3, 0
	ldr r0, _080EC04C
	adds r7, r2, r0
	mov r12, r2
	movs r6, 0
	ldr r5, _080EC050
	movs r4, 0x9B
_080EC000:
	adds r0, r3, r7
	strb r6, [r0]
	lsls r1, r3, 2
	adds r1, r2
	adds r0, r1, r5
	strh r4, [r0]
	ldr r0, _080EC054
	adds r1, r0
	movs r0, 0x5B
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _080EC000
	ldr r1, _080EC058
	add r1, r12
	movs r0, 0
	strb r0, [r1]
	bl sub_80EBCA8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EC030: .4byte gKeyRepeatStartDelay
_080EC034: .4byte 0x02000000
_080EC038: .4byte 0x00008828
_080EC03C: .4byte 0x00006ddc
_080EC040: .4byte 0x00009344
_080EC044: .4byte 0x00008768
_080EC048: .4byte 0x0000ced0
_080EC04C: .4byte 0x00008fff
_080EC050: .4byte 0x00009040
_080EC054: .4byte 0x00009042
_080EC058: .4byte 0x00006e95
	thumb_func_end sub_80EBC10

	thumb_func_start sub_80EBCA8
sub_80EBCA8: @ 80EC05C
	push {r4,lr}
	ldr r4, _080EC090
	ldr r0, _080EC094
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080EC098
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _080EC09C
	adds r1, r4, r0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _080EC0A0
	bl FlagGet
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080EC0A8
	ldr r0, _080EC0A4
	adds r1, r4, r0
	movs r0, 0x4
	strb r0, [r1]
	b _080EC0AE
	.align 2, 0
_080EC090: .4byte 0x02000000
_080EC094: .4byte 0x00006db2
_080EC098: .4byte 0x00006db3
_080EC09C: .4byte 0x00006db4
_080EC0A0: .4byte 0x0000083b
_080EC0A4: .4byte 0x00006db5
_080EC0A8:
	ldr r1, _080EC0C0
	adds r0, r4, r1
	strb r2, [r0]
_080EC0AE:
	ldr r0, _080EC0C4
	ldr r1, _080EC0C8
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC0C0: .4byte 0x00006db5
_080EC0C4: .4byte 0x02000000
_080EC0C8: .4byte 0x00006db6
	thumb_func_end sub_80EBCA8

	thumb_func_start sub_80EBD18
sub_80EBD18: @ 80EC0CC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_80F1FF0
	pop {r0}
	bx r0
	thumb_func_end sub_80EBD18

	thumb_func_start sub_80EBD30
sub_80EBD30: @ 80EC0E4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_80FB260
	bl sub_80EFE7C
	pop {r0}
	bx r0
	thumb_func_end sub_80EBD30

	thumb_func_start sub_80EBD4C
sub_80EBD4C: @ 80EC100
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_80F5BF0
	bl sub_8089668
	pop {r0}
	bx r0
	thumb_func_end sub_80EBD4C

	thumb_func_start sub_80EBD68
sub_80EBD68: @ 80EC11C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_80F6F64
	pop {r0}
	bx r0
	thumb_func_end sub_80EBD68

	thumb_func_start sub_80EBD80
sub_80EBD80: @ 80EC134
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	pop {r0}
	bx r0
	thumb_func_end sub_80EBD80

	thumb_func_start sub_80EBD90
sub_80EBD90: @ 80EC144
	push {lr}
	ldr r0, _080EC16C
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	bl sub_80F19FC
	pop {r0}
	bx r0
	.align 2, 0
_080EC16C: .4byte 0x02000000
	thumb_func_end sub_80EBD90

	thumb_func_start sub_80EBDBC
sub_80EBDBC: @ 80EC170
	ldr r2, _080EC188
	movs r3, 0xC0
	lsls r3, 2
	adds r1, r2, r3
	str r0, [r1]
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080EC188: .4byte 0x02000000
	thumb_func_end sub_80EBDBC

	thumb_func_start sub_80EBDD8
sub_80EBDD8: @ 80EC18C
	push {lr}
	sub sp, 0x4
	ldr r1, _080EC1AC
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x11
	bls _080EC1A2
	b _080EC3B4
_080EC1A2:
	lsls r0, 2
	ldr r1, _080EC1B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC1AC: .4byte 0x02000000
_080EC1B0: .4byte _080EC1B4
	.align 2, 0
_080EC1B4:
	.4byte _080EC1FC
	.4byte _080EC234
	.4byte _080EC246
	.4byte _080EC260
	.4byte _080EC274
	.4byte _080EC286
	.4byte _080EC2A4
	.4byte _080EC2B8
	.4byte _080EC2CC
	.4byte _080EC2E0
	.4byte _080EC2FC
	.4byte _080EC308
	.4byte _080EC328
	.4byte _080EC33C
	.4byte _080EC354
	.4byte _080EC368
	.4byte _080EC384
	.4byte _080EC39C
_080EC1FC:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080EC228
	ldr r3, _080EC22C
	adds r0, r1, r3
	ldrb r2, [r0]
	subs r3, 0x2F
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080EC230
	adds r2, r1, r0
	movs r0, 0x5
	strb r0, [r2]
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EC390
	.align 2, 0
_080EC228: .4byte 0x02000000
_080EC22C: .4byte 0x00006ddc
_080EC230: .4byte 0x00006dae
_080EC234:
	bl sub_80F3FF0
	ldr r1, _080EC25C
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC246:
	bl sub_80F4024
	lsls r0, 24
	cmp r0, 0
	beq _080EC252
	b _080EC3B4
_080EC252:
	ldr r1, _080EC25C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC390
	.align 2, 0
_080EC25C: .4byte 0x02000000
_080EC260:
	bl sub_80F2598
	ldr r1, _080EC270
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EC390
	.align 2, 0
_080EC270: .4byte 0x02000000
_080EC274:
	bl sub_80EEE20
	ldr r1, _080EC2A0
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC286:
	bl sub_80EEE54
	lsls r0, 24
	cmp r0, 0
	beq _080EC292
	b _080EC3B4
_080EC292:
	bl sub_80EEE08
	ldr r1, _080EC2A0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC390
	.align 2, 0
_080EC2A0: .4byte 0x02000000
_080EC2A4:
	movs r0, 0
	bl sub_80EF248
	ldr r1, _080EC2C8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC2B8:
	movs r0, 0
	bl sub_80EF284
	lsls r0, 24
	cmp r0, 0
	beq _080EC2C6
	b _080EC3B4
_080EC2C6:
	b _080EC388
	.align 2, 0
_080EC2C8: .4byte 0x02000000
_080EC2CC:
	movs r0, 0
	bl sub_80F1B8C
	ldr r1, _080EC2F8
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC2E0:
	movs r0, 0
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	bne _080EC3B4
	ldr r1, _080EC2F8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EC390
	.align 2, 0
_080EC2F8: .4byte 0x02000000
_080EC2FC:
	ldr r0, _080EC304
	bl SetVBlankCallback
	b _080EC388
	.align 2, 0
_080EC304: .4byte sub_80EBD18
_080EC308:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _080EC324
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC390
	.align 2, 0
_080EC324: .4byte 0x02000000
_080EC328:
	movs r0, 0
	bl sub_80EED2C
	ldr r1, _080EC338
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EC390
	.align 2, 0
_080EC338: .4byte 0x02000000
_080EC33C:
	ldr r0, _080EC350
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EC3B4
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r2, r3
	b _080EC390
	.align 2, 0
_080EC350: .4byte gPaletteFade
_080EC354:
	movs r0, 0
	bl sub_80F2C80
	ldr r1, _080EC380
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC368:
	movs r0, 0
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080EC3B4
	ldr r1, _080EC380
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EC390
	.align 2, 0
_080EC380: .4byte 0x02000000
_080EC384:
	bl sub_80F1DF0
_080EC388:
	ldr r1, _080EC398
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
_080EC390:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EC3B4
	.align 2, 0
_080EC398: .4byte 0x02000000
_080EC39C:
	bl sub_80F1E50
	lsls r0, 24
	cmp r0, 0
	bne _080EC3B4
	movs r0, 0
	movs r1, 0
	bl sub_80EF428
	ldr r0, _080EC3BC
	bl sub_80EBDBC
_080EC3B4:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080EC3BC: .4byte sub_80EC268
	thumb_func_end sub_80EBDD8

	thumb_func_start sub_80EC00C
sub_80EC00C: @ 80EC3C0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080EC3E0
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0xD
	bls _080EC3D6
	b _080EC5AE
_080EC3D6:
	lsls r0, 2
	ldr r1, _080EC3E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC3E0: .4byte 0x02000000
_080EC3E4: .4byte _080EC3E8
	.align 2, 0
_080EC3E8:
	.4byte _080EC420
	.4byte _080EC474
	.4byte _080EC488
	.4byte _080EC4A4
	.4byte _080EC4B8
	.4byte _080EC4D4
	.4byte _080EC4DE
	.4byte _080EC508
	.4byte _080EC51C
	.4byte _080EC534
	.4byte _080EC548
	.4byte _080EC55C
	.4byte _080EC578
	.4byte _080EC590
_080EC420:
	bl sub_80EEF78
	lsls r0, 24
	cmp r0, 0
	beq _080EC42C
	b _080EC5AE
_080EC42C:
	ldr r0, _080EC460
	bl SetVBlankCallback
	bl sub_80EED1C
	ldr r4, _080EC464
	ldr r1, _080EC468
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _080EC46C
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _080EC470
	adds r1, r4, r0
	movs r0, 0x5
	strb r0, [r1]
	bl sub_80EEE08
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r1
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080EC5AE
	.align 2, 0
_080EC460: .4byte sub_80EBD80
_080EC464: .4byte 0x02000000
_080EC468: .4byte 0x00006ddc
_080EC46C: .4byte 0x00006dad
_080EC470: .4byte 0x00006dae
_080EC474:
	movs r0, 0
	bl sub_80EF248
	ldr r1, _080EC4A0
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC488:
	movs r0, 0
	bl sub_80EF284
	lsls r0, 24
	cmp r0, 0
	beq _080EC496
	b _080EC5AE
_080EC496:
	ldr r1, _080EC4A0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC584
	.align 2, 0
_080EC4A0: .4byte 0x02000000
_080EC4A4:
	movs r0, 0
	bl sub_80F1B8C
	ldr r1, _080EC4D0
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC4B8:
	movs r0, 0
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	beq _080EC4C6
	b _080EC5AE
_080EC4C6:
	ldr r1, _080EC4D0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC584
	.align 2, 0
_080EC4D0: .4byte 0x02000000
_080EC4D4:
	bl sub_8055870
	cmp r0, 0
	bne _080EC5AE
	b _080EC57C
_080EC4DE:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080EC504
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EC584
	.align 2, 0
_080EC504: .4byte sub_80EBD18
_080EC508:
	movs r0, 0
	bl sub_80EED2C
	ldr r1, _080EC518
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC584
	.align 2, 0
_080EC518: .4byte 0x02000000
_080EC51C:
	ldr r0, _080EC530
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EC5AE
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EC584
	.align 2, 0
_080EC530: .4byte gPaletteFade
_080EC534:
	bl sub_80F2598
	ldr r1, _080EC544
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC584
	.align 2, 0
_080EC544: .4byte 0x02000000
_080EC548:
	movs r0, 0
	bl sub_80F2C80
	ldr r1, _080EC574
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC55C:
	movs r0, 0
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080EC5AE
	ldr r1, _080EC574
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EC584
	.align 2, 0
_080EC574: .4byte 0x02000000
_080EC578:
	bl sub_80F1DF0
_080EC57C:
	ldr r1, _080EC58C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
_080EC584:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EC5AE
	.align 2, 0
_080EC58C: .4byte 0x02000000
_080EC590:
	bl sub_80F1E50
	lsls r0, 24
	cmp r0, 0
	bne _080EC5AE
	ldr r0, _080EC5B8
	ldr r1, _080EC5BC
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0
	bl sub_80EF428
	ldr r0, _080EC5C0
	bl sub_80EBDBC
_080EC5AE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC5B8: .4byte 0x02000000
_080EC5BC: .4byte 0x00006dad
_080EC5C0: .4byte sub_80EC268
	thumb_func_end sub_80EC00C

	thumb_func_start sub_80EC210
sub_80EC210: @ 80EC5C4
	push {r4,r5,lr}
	ldr r5, _080EC5DC
	movs r0, 0xC1
	lsls r0, 2
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	beq _080EC5E0
	cmp r0, 0x1
	beq _080EC600
	b _080EC610
	.align 2, 0
_080EC5DC: .4byte 0x02000000
_080EC5E0:
	movs r0, 0x1
	bl sub_80F2D04
	ldr r1, _080EC5FC
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	bl sub_80EE9C0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080EC610
	.align 2, 0
_080EC5FC: .4byte 0x00006ddc
_080EC600:
	bl sub_80EEA0C
	lsls r0, 24
	cmp r0, 0
	bne _080EC610
	ldr r0, _080EC618
	bl sub_80EBDBC
_080EC610:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EC618: .4byte sub_80EC268
	thumb_func_end sub_80EC210

	thumb_func_start sub_80EC268
sub_80EC268: @ 80EC61C
	push {r4-r6,lr}
	ldr r4, _080EC644
	movs r0, 0xC1
	lsls r0, 2
	adds r6, r4, r0
	ldrh r0, [r6]
	cmp r0, 0x3
	bne _080EC62E
	b _080EC772
_080EC62E:
	cmp r0, 0x3
	bgt _080EC648
	cmp r0, 0x1
	bne _080EC638
	b _080EC756
_080EC638:
	cmp r0, 0x1
	ble _080EC63E
	b _080EC768
_080EC63E:
	cmp r0, 0
	beq _080EC662
	b _080EC846
	.align 2, 0
_080EC644: .4byte 0x02000000
_080EC648:
	cmp r0, 0x6
	bne _080EC64E
	b _080EC7C8
_080EC64E:
	cmp r0, 0x6
	bgt _080EC65A
	cmp r0, 0x4
	bne _080EC658
	b _080EC790
_080EC658:
	b _080EC846
_080EC65A:
	cmp r0, 0xFF
	bne _080EC660
	b _080EC800
_080EC660:
	b _080EC846
_080EC662:
	bl sub_80EEC10
	lsls r0, 24
	cmp r0, 0
	beq _080EC688
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080EC684
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, 0
	bl sub_80EF428
	bl sub_80EED9C
	b _080EC846
	.align 2, 0
_080EC684: .4byte 0x00006dad
_080EC688:
	ldr r0, _080EC6C4
	ldrh r1, [r0, 0x2E]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080EC748
	ldr r2, _080EC6C8
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r2, 0x2F
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	subs r2, 0x2A
	adds r1, r4, r2
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bls _080EC6B8
	b _080EC846
_080EC6B8:
	lsls r0, 2
	ldr r1, _080EC6CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC6C4: .4byte gMain
_080EC6C8: .4byte 0x00006dad
_080EC6CC: .4byte _080EC6D0
	.align 2, 0
_080EC6D0:
	.4byte _080EC6E4
	.4byte _080EC6F8
	.4byte _080EC734
	.4byte _080EC720
	.4byte _080EC70C
_080EC6E4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EC6F4
	bl sub_80EBDBC
	b _080EC846
	.align 2, 0
_080EC6F4: .4byte sub_80EC4A0
_080EC6F8:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EC708
	bl sub_80EBDBC
	b _080EC846
	.align 2, 0
_080EC708: .4byte sub_80EC81C
_080EC70C:
	ldr r0, _080EC71C
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0]
	b _080EC846
	.align 2, 0
_080EC71C: .4byte 0x02000000
_080EC720:
	ldr r0, _080EC730
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0]
	b _080EC846
	.align 2, 0
_080EC730: .4byte 0x02000000
_080EC734:
	ldr r0, _080EC744
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x6
	strh r1, [r0]
	b _080EC846
	.align 2, 0
_080EC744: .4byte 0x02000000
_080EC748:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080EC752
	b _080EC846
_080EC752:
	strh r2, [r6]
	b _080EC846
_080EC756:
	bl sub_80F208C
	ldr r0, _080EC764
	bl sub_80EBDBC
	b _080EC846
	.align 2, 0
_080EC764: .4byte sub_80EE96C
_080EC768:
	bl sub_80F6208
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
_080EC772:
	bl sub_80F6250
	lsls r0, 24
	cmp r0, 0
	bne _080EC846
	ldr r1, _080EC78C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EC846
	.align 2, 0
_080EC78C: .4byte 0x02000000
_080EC790:
	bl sub_8055870
	cmp r0, 0
	bne _080EC846
	ldr r1, _080EC7B4
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _080EC7BC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EC7B8
	bl sub_80EBDBC
	b _080EC846
	.align 2, 0
_080EC7B4: .4byte 0x00008fe8
_080EC7B8: .4byte sub_80EDB88
_080EC7BC:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0
	movs r1, 0x5
	b _080EC7F6
_080EC7C8:
	bl sub_80F6C20
	ldr r2, _080EC7E4
	adds r0, r4, r2
	ldrh r0, [r0]
	cmp r0, 0
	beq _080EC7EC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EC7E8
	bl sub_80EBDBC
	b _080EC846
	.align 2, 0
_080EC7E4: .4byte 0x0000d158
_080EC7E8: .4byte sub_80EE3D8
_080EC7EC:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0
	movs r1, 0x6
_080EC7F6:
	bl sub_80EF428
	movs r0, 0xFF
	strh r0, [r6]
	b _080EC846
_080EC800:
	bl sub_80EEC10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080EC82C
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080EC828
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, 0
	bl sub_80EF428
	movs r0, 0
	strh r0, [r6]
	bl sub_80EED9C
	b _080EC846
	.align 2, 0
_080EC828: .4byte 0x00006dad
_080EC82C:
	ldr r0, _080EC84C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _080EC846
	ldr r2, _080EC850
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r0, 0
	bl sub_80EF428
	strh r5, [r6]
_080EC846:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EC84C: .4byte gMain
_080EC850: .4byte 0x00006dad
	thumb_func_end sub_80EC268

	thumb_func_start sub_80EC4A0
sub_80EC4A0: @ 80EC854
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080EC874
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0xE
	bls _080EC86A
	b _080ECA1E
_080EC86A:
	lsls r0, 2
	ldr r1, _080EC878
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EC874: .4byte 0x02000000
_080EC878: .4byte _080EC87C
	.align 2, 0
_080EC87C:
	.4byte _080EC8B8
	.4byte _080EC8C4
	.4byte _080EC8F8
	.4byte _080EC92C
	.4byte _080EC948
	.4byte _080EC95C
	.4byte _080EC962
	.4byte _080EC974
	.4byte _080EC984
	.4byte _080EC998
	.4byte _080EC9AC
	.4byte _080EC9C8
	.4byte _080EC9D2
	.4byte _080EC9F2
	.4byte _080ECA0C
_080EC8B8:
	bl sub_80F1E84
	movs r0, 0
	bl sub_80F2D04
	b _080EC9F8
_080EC8C4:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080EC8D0
	b _080ECA1E
_080EC8D0:
	ldr r0, _080EC8F0
	ldrb r1, [r0, 0x15]
	movs r0, 0x8
	ands r0, r1
	movs r1, 0x8
	cmp r0, 0
	beq _080EC8E0
	movs r1, 0x7
_080EC8E0:
	adds r0, r1, 0
	bl sub_80EEFBC
	ldr r1, _080EC8F4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ECA00
	.align 2, 0
_080EC8F0: .4byte gSaveBlock2
_080EC8F4: .4byte 0x02000000
_080EC8F8:
	bl sub_80EEF34
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080EC906
	b _080ECA1E
_080EC906:
	ldr r4, _080EC928
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ECA00
	.align 2, 0
_080EC928: .4byte 0x02000000
_080EC92C:
	ldr r0, _080EC944
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ECA1E
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	b _080EC9F8
	.align 2, 0
_080EC944: .4byte gPaletteFade
_080EC948:
	bl sub_80F2620
	ldr r1, _080EC958
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ECA00
	.align 2, 0
_080EC958: .4byte 0x02000000
_080EC95C:
	bl sub_80EF814
	b _080EC9F8
_080EC962:
	bl sub_80EF840
	ldr r1, _080EC980
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC974:
	bl sub_80EF874
	lsls r0, 24
	cmp r0, 0
	bne _080ECA1E
	b _080EC9F8
	.align 2, 0
_080EC980: .4byte 0x02000000
_080EC984:
	movs r0, 0x4
	bl sub_80F2C80
	ldr r1, _080EC9A8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EC998:
	movs r0, 0x4
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080ECA1E
	b _080EC9F8
	.align 2, 0
_080EC9A8: .4byte 0x02000000
_080EC9AC:
	bl sub_80F2DD8
	ldr r0, _080EC9C0
	bl SetVBlankCallback
	ldr r1, _080EC9C4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ECA00
	.align 2, 0
_080EC9C0: .4byte sub_80EBD30
_080EC9C4: .4byte 0x02000000
_080EC9C8:
	bl sub_8055870
	cmp r0, 0
	bne _080ECA1E
	b _080EC9F8
_080EC9D2:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ECA00
_080EC9F2:
	movs r0, 0x1
	bl sub_80EED2C
_080EC9F8:
	ldr r1, _080ECA08
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080ECA00:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ECA1E
	.align 2, 0
_080ECA08: .4byte 0x02000000
_080ECA0C:
	ldr r0, _080ECA28
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ECA1E
	ldr r0, _080ECA2C
	bl sub_80EBDBC
_080ECA1E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECA28: .4byte gPaletteFade
_080ECA2C: .4byte sub_80EC67C
	thumb_func_end sub_80EC4A0

	thumb_func_start sub_80EC67C
sub_80EC67C: @ 80ECA30
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _080ECA50
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x5
	bls _080ECA46
	b _080ECBB4
_080ECA46:
	lsls r0, 2
	ldr r1, _080ECA54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ECA50: .4byte 0x02000000
_080ECA54: .4byte _080ECA58
	.align 2, 0
_080ECA58:
	.4byte _080ECA70
	.4byte _080ECACC
	.4byte _080ECAFA
	.4byte _080ECB30
	.4byte _080ECB54
	.4byte _080ECB78
_080ECA70:
	bl sub_80FAB60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080ECA96
	cmp r0, 0x3
	bgt _080ECA86
	cmp r0, 0x1
	beq _080ECA90
	b _080ECBB4
_080ECA86:
	cmp r0, 0x4
	beq _080ECA9C
	cmp r0, 0x5
	beq _080ECAB4
	b _080ECBB4
_080ECA90:
	bl sub_80EED9C
	b _080ECBB4
_080ECA96:
	bl sub_80EF9F8
	b _080ECBB4
_080ECA9C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080ECAB0
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0]
	b _080ECBB4
	.align 2, 0
_080ECAB0: .4byte 0x02000000
_080ECAB4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080ECAC8
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r2
	movs r1, 0x4
	strh r1, [r0]
	b _080ECBB4
	.align 2, 0
_080ECAC8: .4byte 0x02000000
_080ECACC:
	ldr r1, _080ECAE4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080ECAE8
	bl sub_80FAEC4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ECB70
	.align 2, 0
_080ECAE4: .4byte 0x00006e90
_080ECAE8:
	movs r0, 0x1
	bl sub_80EFBDC
	lsls r0, 24
	cmp r0, 0
	bne _080ECBB4
	bl sub_80FAEC4
	b _080ECB6A
_080ECAFA:
	bl sub_80FAFC0
	lsls r0, 24
	cmp r0, 0
	bne _080ECBB4
	ldr r5, _080ECB20
	ldr r1, _080ECB24
	adds r0, r5, r1
	ldrb r4, [r0]
	cmp r4, 0
	bne _080ECB28
	bl sub_80EFBB0
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r5, r2
	strh r4, [r0]
	b _080ECBB4
	.align 2, 0
_080ECB20: .4byte 0x02000000
_080ECB24: .4byte 0x00006e90
_080ECB28:
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r5, r0
	b _080ECB70
_080ECB30:
	movs r0, 0
	bl sub_80EFBDC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080ECBB4
	bl sub_80EFBB0
	ldr r0, _080ECB50
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	strh r4, [r0]
	b _080ECBB4
	.align 2, 0
_080ECB50: .4byte 0x02000000
_080ECB54:
	movs r2, 0xC2
	lsls r2, 2
	adds r0, r4, r2
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080ECB6A:
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
_080ECB70:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ECBB4
_080ECB78:
	ldr r0, _080ECBBC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ECBB4
	bl sub_80F2DF4
	movs r0, 0x4
	bl sub_80F2D04
	ldr r3, _080ECBC0
	movs r2, 0
	ldr r0, _080ECBC4
	ldr r1, _080ECBC8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080ECBA0
	movs r2, 0x1
_080ECBA0:
	lsls r2, 3
	ldrb r1, [r3, 0x15]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x15]
	ldr r0, _080ECBCC
	bl sub_80EBDBC
_080ECBB4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ECBBC: .4byte gPaletteFade
_080ECBC0: .4byte gSaveBlock2
_080ECBC4: .4byte 0x02000000
_080ECBC8: .4byte 0x00006e90
_080ECBCC: .4byte sub_80EC00C
	thumb_func_end sub_80EC67C

	thumb_func_start sub_80EC81C
sub_80EC81C: @ 80ECBD0
	push {r4,lr}
	ldr r0, _080ECBE8
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _080ECBEC
	cmp r0, 0x1
	beq _080ECC04
	b _080ECC14
	.align 2, 0
_080ECBE8: .4byte 0x02000000
_080ECBEC:
	movs r0, 0
	bl sub_80F2D04
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_80EE9C0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080ECC14
_080ECC04:
	bl sub_80EEA0C
	lsls r0, 24
	cmp r0, 0
	bne _080ECC14
	ldr r0, _080ECC1C
	bl sub_80EBDBC
_080ECC14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECC1C: .4byte sub_80EC86C
	thumb_func_end sub_80EC81C

	thumb_func_start sub_80EC86C
sub_80EC86C: @ 80ECC20
	push {r4-r6,lr}
	ldr r4, _080ECC38
	movs r0, 0xC1
	lsls r0, 2
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, 0
	beq _080ECC3C
	cmp r0, 0x1
	beq _080ECCF8
	b _080ECD08
	.align 2, 0
_080ECC38: .4byte 0x02000000
_080ECC3C:
	bl sub_80EEC90
	lsls r0, 24
	cmp r0, 0
	beq _080ECC64
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080ECC60
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, 0x1
	bl sub_80EF428
	bl sub_80EED9C
	b _080ECD08
	.align 2, 0
_080ECC60: .4byte 0x00006dad
_080ECC64:
	ldr r0, _080ECC98
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ECCCC
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080ECC9C
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r2, 0x43
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _080ECCB4
	cmp r0, 0x1
	bgt _080ECCA0
	cmp r0, 0
	beq _080ECCA6
	b _080ECD08
	.align 2, 0
_080ECC98: .4byte gMain
_080ECC9C: .4byte 0x00006dad
_080ECCA0:
	cmp r0, 0x2
	beq _080ECCC0
	b _080ECD08
_080ECCA6:
	ldr r0, _080ECCB0
	bl sub_80EBDBC
	b _080ECD08
	.align 2, 0
_080ECCB0: .4byte sub_80ED620
_080ECCB4:
	ldr r0, _080ECCBC
	bl sub_80EBDBC
	b _080ECD08
	.align 2, 0
_080ECCBC: .4byte sub_80EC960
_080ECCC0:
	ldr r0, _080ECCC8
	bl sub_80EBDBC
	b _080ECD08
	.align 2, 0
_080ECCC8: .4byte sub_80EC210
_080ECCCC:
	movs r6, 0x2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080ECD08
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080ECCF0
	adds r0, r4, r1
	strb r6, [r0]
	ldr r2, _080ECCF4
	adds r0, r4, r2
	strb r6, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080ECD08
	.align 2, 0
_080ECCF0: .4byte 0x00006df0
_080ECCF4: .4byte 0x00006dad
_080ECCF8:
	bl sub_80F1E6C
	lsls r0, 24
	cmp r0, 0
	bne _080ECD08
	ldr r0, _080ECD10
	bl sub_80EBDBC
_080ECD08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ECD10: .4byte sub_80EC210
	thumb_func_end sub_80EC86C

	thumb_func_start sub_80EC960
sub_80EC960: @ 80ECD14
	push {r4,lr}
	ldr r0, _080ECD2C
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _080ECD30
	cmp r0, 0x1
	beq _080ECD42
	b _080ECD52
	.align 2, 0
_080ECD2C: .4byte 0x02000000
_080ECD30:
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x5
	bl sub_80EE9C0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080ECD52
_080ECD42:
	bl sub_80EEA0C
	lsls r0, 24
	cmp r0, 0
	bne _080ECD52
	ldr r0, _080ECD58
	bl sub_80EBDBC
_080ECD52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECD58: .4byte sub_80ECC08
	thumb_func_end sub_80EC960

	thumb_func_start sub_80EC9A8
sub_80EC9A8: @ 80ECD5C
	push {r4,r5,lr}
	ldr r5, _080ECD74
	movs r0, 0xC1
	lsls r0, 2
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	beq _080ECD78
	cmp r0, 0x1
	beq _080ECD98
	b _080ECDB4
	.align 2, 0
_080ECD74: .4byte 0x02000000
_080ECD78:
	movs r0, 0x5
	bl sub_80F2D04
	ldr r1, _080ECD94
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0x1
	movs r2, 0xC
	bl sub_80EE9C0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080ECDB4
	.align 2, 0
_080ECD94: .4byte 0x00006df0
_080ECD98:
	bl sub_80EEA0C
	lsls r0, 24
	cmp r0, 0
	bne _080ECDB4
	ldr r0, _080ECDBC
	bl sub_80EBDBC
	ldr r1, _080ECDC0
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0x1
	bl sub_80EF428
_080ECDB4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ECDBC: .4byte sub_80EC86C
_080ECDC0: .4byte 0x00006dad
	thumb_func_end sub_80EC9A8

	thumb_func_start sub_80ECA10
sub_80ECA10: @ 80ECDC4
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080ECDE4
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0xD
	bls _080ECDDA
	b _080ECFA6
_080ECDDA:
	lsls r0, 2
	ldr r1, _080ECDE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ECDE4: .4byte 0x02000000
_080ECDE8: .4byte _080ECDEC
	.align 2, 0
_080ECDEC:
	.4byte _080ECE24
	.4byte _080ECE78
	.4byte _080ECE8C
	.4byte _080ECEA8
	.4byte _080ECEBC
	.4byte _080ECED8
	.4byte _080ECEE2
	.4byte _080ECF0C
	.4byte _080ECF20
	.4byte _080ECF26
	.4byte _080ECF40
	.4byte _080ECF54
	.4byte _080ECF70
	.4byte _080ECF88
_080ECE24:
	bl sub_80EEF78
	lsls r0, 24
	cmp r0, 0
	beq _080ECE30
	b _080ECFA6
_080ECE30:
	ldr r0, _080ECE64
	bl SetVBlankCallback
	bl sub_80EED1C
	ldr r4, _080ECE68
	ldr r1, _080ECE6C
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _080ECE70
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _080ECE74
	adds r1, r4, r0
	movs r0, 0x3
	strb r0, [r1]
	bl sub_80EEE08
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r1
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080ECFA6
	.align 2, 0
_080ECE64: .4byte sub_80EBD80
_080ECE68: .4byte 0x02000000
_080ECE6C: .4byte 0x00006df0
_080ECE70: .4byte 0x00006dad
_080ECE74: .4byte 0x00006dae
_080ECE78:
	movs r0, 0x1
	bl sub_80EF248
	ldr r1, _080ECEA4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ECE8C:
	movs r0, 0x1
	bl sub_80EF284
	lsls r0, 24
	cmp r0, 0
	beq _080ECE9A
	b _080ECFA6
_080ECE9A:
	ldr r1, _080ECEA4
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ECF7C
	.align 2, 0
_080ECEA4: .4byte 0x02000000
_080ECEA8:
	movs r0, 0x1
	bl sub_80F1B8C
	ldr r1, _080ECED4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ECEBC:
	movs r0, 0x1
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	bne _080ECFA6
	ldr r1, _080ECED4
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ECF7C
	.align 2, 0
_080ECED4: .4byte 0x02000000
_080ECED8:
	bl sub_8055870
	cmp r0, 0
	bne _080ECFA6
	b _080ECF74
_080ECEE2:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080ECF08
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ECF7C
	.align 2, 0
_080ECF08: .4byte sub_80EBD18
_080ECF0C:
	movs r0, 0
	bl sub_80EED2C
	ldr r1, _080ECF1C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ECF7C
	.align 2, 0
_080ECF1C: .4byte 0x02000000
_080ECF20:
	bl sub_80F2598
	b _080ECF74
_080ECF26:
	ldr r0, _080ECF3C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ECFA6
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080ECF7C
	.align 2, 0
_080ECF3C: .4byte gPaletteFade
_080ECF40:
	movs r0, 0x1
	bl sub_80F2C80
	ldr r1, _080ECF6C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ECF54:
	movs r0, 0x1
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080ECFA6
	ldr r1, _080ECF6C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ECF7C
	.align 2, 0
_080ECF6C: .4byte 0x02000000
_080ECF70:
	bl sub_80F1DF0
_080ECF74:
	ldr r1, _080ECF84
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
_080ECF7C:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ECFA6
	.align 2, 0
_080ECF84: .4byte 0x02000000
_080ECF88:
	bl sub_80F1E50
	lsls r0, 24
	cmp r0, 0
	bne _080ECFA6
	ldr r0, _080ECFB0
	ldr r1, _080ECFB4
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	bl sub_80EF428
	ldr r0, _080ECFB8
	bl sub_80EBDBC
_080ECFA6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ECFB0: .4byte 0x02000000
_080ECFB4: .4byte 0x00006dad
_080ECFB8: .4byte sub_80EC86C
	thumb_func_end sub_80ECA10

	thumb_func_start sub_80ECC08
sub_80ECC08: @ 80ECFBC
	push {r4,r5,lr}
	ldr r4, _080ECFD4
	movs r0, 0xC1
	lsls r0, 2
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, 0
	beq _080ECFD8
	cmp r0, 0x1
	bne _080ECFD2
	b _080ED118
_080ECFD2:
	b _080ED128
	.align 2, 0
_080ECFD4: .4byte 0x02000000
_080ECFD8:
	bl sub_80EEC90
	lsls r0, 24
	cmp r0, 0
	beq _080ED000
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080ECFFC
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, 0x2
	bl sub_80EF428
	bl sub_80EED9C
	b _080ED128
	.align 2, 0
_080ECFFC: .4byte 0x00006dad
_080ED000:
	ldr r0, _080ED02C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080ED00E
	b _080ED0F4
_080ED00E:
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080ED030
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	bhi _080ED0C0
	lsls r0, 2
	ldr r1, _080ED034
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED02C: .4byte gMain
_080ED030: .4byte 0x00006dad
_080ED034: .4byte _080ED038
	.align 2, 0
_080ED038:
	.4byte _080ED050
	.4byte _080ED064
	.4byte _080ED078
	.4byte _080ED08C
	.4byte _080ED0A0
	.4byte _080ED0B4
_080ED050:
	ldr r0, _080ED05C
	ldr r3, _080ED060
	adds r0, r3
	movs r1, 0x16
	strb r1, [r0]
	b _080ED0C0
	.align 2, 0
_080ED05C: .4byte 0x02000000
_080ED060: .4byte 0x000087d8
_080ED064:
	ldr r0, _080ED070
	ldr r1, _080ED074
	adds r0, r1
	movs r1, 0x17
	strb r1, [r0]
	b _080ED0C0
	.align 2, 0
_080ED070: .4byte 0x02000000
_080ED074: .4byte 0x000087d8
_080ED078:
	ldr r0, _080ED084
	ldr r2, _080ED088
	adds r0, r2
	movs r1, 0x18
	strb r1, [r0]
	b _080ED0C0
	.align 2, 0
_080ED084: .4byte 0x02000000
_080ED088: .4byte 0x000087d8
_080ED08C:
	ldr r0, _080ED098
	ldr r3, _080ED09C
	adds r0, r3
	movs r1, 0x21
	strb r1, [r0]
	b _080ED0C0
	.align 2, 0
_080ED098: .4byte 0x02000000
_080ED09C: .4byte 0x000087d8
_080ED0A0:
	ldr r0, _080ED0AC
	ldr r1, _080ED0B0
	adds r0, r1
	movs r1, 0x2F
	strb r1, [r0]
	b _080ED0C0
	.align 2, 0
_080ED0AC: .4byte 0x02000000
_080ED0B0: .4byte 0x000087d8
_080ED0B4:
	ldr r0, _080ED0BC
	bl sub_80EBDBC
	b _080ED128
	.align 2, 0
_080ED0BC: .4byte sub_80EC9A8
_080ED0C0:
	ldr r1, _080ED0E0
	ldr r2, _080ED0E4
	adds r0, r1, r2
	ldrb r2, [r0]
	ldr r3, _080ED0E8
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080ED0EC
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080ED0F0
	bl sub_80EBDBC
	b _080ED128
	.align 2, 0
_080ED0E0: .4byte 0x02000000
_080ED0E4: .4byte 0x00006dad
_080ED0E8: .4byte 0x00006dfc
_080ED0EC: .4byte 0x000076aa
_080ED0F0: .4byte sub_80ED01C
_080ED0F4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080ED128
	movs r0, 0x5
	bl PlaySE
	ldr r2, _080ED114
	adds r1, r4, r2
	movs r0, 0x5
	strb r0, [r1]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080ED128
	.align 2, 0
_080ED114: .4byte 0x00006dad
_080ED118:
	bl sub_80F1E6C
	lsls r0, 24
	cmp r0, 0
	bne _080ED128
	ldr r0, _080ED130
	bl sub_80EBDBC
_080ED128:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ED130: .4byte sub_80EC9A8
	thumb_func_end sub_80ECC08

	thumb_func_start sub_80ECD80
sub_80ECD80: @ 80ED134
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080ED154
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x14
	bls _080ED14A
	b _080ED3BA
_080ED14A:
	lsls r0, 2
	ldr r1, _080ED158
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED154: .4byte 0x02000000
_080ED158: .4byte _080ED15C
	.align 2, 0
_080ED15C:
	.4byte _080ED1B0
	.4byte _080ED1CE
	.4byte _080ED1E8
	.4byte _080ED200
	.4byte _080ED218
	.4byte _080ED22C
	.4byte _080ED234
	.4byte _080ED260
	.4byte _080ED274
	.4byte _080ED288
	.4byte _080ED29C
	.4byte _080ED2B8
	.4byte _080ED2C4
	.4byte _080ED2F0
	.4byte _080ED2F8
	.4byte _080ED30C
	.4byte _080ED324
	.4byte _080ED338
	.4byte _080ED364
	.4byte _080ED378
	.4byte _080ED39C
_080ED1B0:
	movs r3, 0xC2
	lsls r3, 2
	adds r0, r4, r3
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080ED390
_080ED1CE:
	ldr r0, _080ED1E4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080ED1DC
	b _080ED3BA
_080ED1DC:
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED390
	.align 2, 0
_080ED1E4: .4byte gPaletteFade
_080ED1E8:
	bl sub_80EEF78
	lsls r0, 24
	cmp r0, 0
	beq _080ED1F4
	b _080ED3BA
_080ED1F4:
	ldr r0, _080ED1FC
	bl SetVBlankCallback
	b _080ED388
	.align 2, 0
_080ED1FC: .4byte sub_80EBD80
_080ED200:
	bl sub_80EED1C
	bl sub_80F3130
	ldr r1, _080ED214
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ED390
	.align 2, 0
_080ED214: .4byte 0x02000000
_080ED218:
	movs r0, 0x1
	bl sub_80F2D6C
	ldr r1, _080ED228
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ED390
	.align 2, 0
_080ED228: .4byte 0x02000000
_080ED22C:
	movs r0, 0x5
	bl sub_80F2D6C
	b _080ED388
_080ED234:
	ldr r1, _080ED254
	adds r0, r4, r1
	ldrb r1, [r0]
	ldr r2, _080ED258
	adds r0, r4, r2
	strb r1, [r0]
	ldr r3, _080ED25C
	adds r1, r4, r3
	movs r0, 0x6
	strb r0, [r1]
	bl sub_80EEE08
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080ED390
	.align 2, 0
_080ED254: .4byte 0x00006dfc
_080ED258: .4byte 0x00006dad
_080ED25C: .4byte 0x00006dae
_080ED260:
	movs r0, 0x2
	bl sub_80EF248
	ldr r1, _080ED284
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED274:
	movs r0, 0x2
	bl sub_80EF284
	lsls r0, 24
	cmp r0, 0
	beq _080ED282
	b _080ED3BA
_080ED282:
	b _080ED388
	.align 2, 0
_080ED284: .4byte 0x02000000
_080ED288:
	movs r0, 0x2
	bl sub_80F1B8C
	ldr r1, _080ED2B4
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED29C:
	movs r0, 0x2
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	beq _080ED2AA
	b _080ED3BA
_080ED2AA:
	ldr r1, _080ED2B4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ED390
	.align 2, 0
_080ED2B4: .4byte 0x02000000
_080ED2B8:
	bl sub_8055870
	cmp r0, 0
	beq _080ED2C2
	b _080ED3BA
_080ED2C2:
	b _080ED388
_080ED2C4:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080ED2EC
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED390
	.align 2, 0
_080ED2EC: .4byte sub_80EBD18
_080ED2F0:
	movs r0, 0
	bl sub_80EED2C
	b _080ED388
_080ED2F8:
	bl sub_80F2598
	ldr r1, _080ED308
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ED390
	.align 2, 0
_080ED308: .4byte 0x02000000
_080ED30C:
	ldr r0, _080ED320
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ED3BA
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED390
	.align 2, 0
_080ED320: .4byte gPaletteFade
_080ED324:
	movs r0, 0x1
	bl sub_80F2C80
	ldr r1, _080ED35C
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED338:
	movs r0, 0x1
	bl sub_80F2CBC
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080ED3BA
	ldr r0, _080ED35C
	ldr r3, _080ED360
	adds r1, r0, r3
	strh r2, [r1]
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	b _080ED3BA
	.align 2, 0
_080ED35C: .4byte 0x02000000
_080ED360: .4byte 0x00000306
_080ED364:
	movs r0, 0x5
	bl sub_80F2C80
	ldr r1, _080ED398
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED378:
	movs r0, 0x5
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080ED3BA
	bl sub_80F1DF0
_080ED388:
	ldr r1, _080ED398
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
_080ED390:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ED3BA
	.align 2, 0
_080ED398: .4byte 0x02000000
_080ED39C:
	bl sub_80F1E50
	lsls r0, 24
	cmp r0, 0
	bne _080ED3BA
	ldr r0, _080ED3C4
	ldr r1, _080ED3C8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	bl sub_80EF428
	ldr r0, _080ED3CC
	bl sub_80EBDBC
_080ED3BA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ED3C4: .4byte 0x02000000
_080ED3C8: .4byte 0x00006dad
_080ED3CC: .4byte sub_80ECC08
	thumb_func_end sub_80ECD80

	thumb_func_start sub_80ED01C
sub_80ED01C: @ 80ED3D0
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080ED3F0
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x13
	bls _080ED3E6
	b _080ED6BC
_080ED3E6:
	lsls r0, 2
	ldr r1, _080ED3F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED3F0: .4byte 0x02000000
_080ED3F4: .4byte _080ED3F8
	.align 2, 0
_080ED3F8:
	.4byte _080ED448
	.4byte _080ED468
	.4byte _080ED488
	.4byte _080ED4BC
	.4byte _080ED4EC
	.4byte _080ED500
	.4byte _080ED512
	.4byte _080ED540
	.4byte _080ED560
	.4byte _080ED578
	.4byte _080ED58C
	.4byte _080ED5A8
	.4byte _080ED5BC
	.4byte _080ED5D4
	.4byte _080ED600
	.4byte _080ED614
	.4byte _080ED640
	.4byte _080ED654
	.4byte _080ED680
	.4byte _080ED69E
_080ED448:
	bl sub_80F1E84
	movs r0, 0x1
	bl sub_80F2D04
	movs r0, 0x5
	bl sub_80F2D04
	ldr r1, _080ED464
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	b _080ED630
	.align 2, 0
_080ED464: .4byte 0x02000000
_080ED468:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080ED474
	b _080ED6BC
_080ED474:
	movs r0, 0
	bl sub_80EEFBC
	ldr r1, _080ED484
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ED630
	.align 2, 0
_080ED484: .4byte 0x02000000
_080ED488:
	bl sub_80EEF34
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080ED496
	b _080ED6BC
_080ED496:
	ldr r4, _080ED4B8
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED630
	.align 2, 0
_080ED4B8: .4byte 0x02000000
_080ED4BC:
	ldr r0, _080ED4E4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080ED4CA
	b _080ED6BC
_080ED4CA:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80EF814
	ldr r1, _080ED4E8
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	b _080ED630
	.align 2, 0
_080ED4E4: .4byte gPaletteFade
_080ED4E8: .4byte 0x02000000
_080ED4EC:
	bl sub_80F2620
	ldr r1, _080ED4FC
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ED630
	.align 2, 0
_080ED4FC: .4byte 0x02000000
_080ED500:
	bl sub_80F4D44
	ldr r1, _080ED52C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED512:
	bl sub_80F4D88
	lsls r0, 24
	cmp r0, 0
	bne _080ED530
	ldr r1, _080ED52C
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x2
	strh r0, [r1]
	b _080ED6BC
	.align 2, 0
_080ED52C: .4byte 0x02000000
_080ED530:
	ldr r1, _080ED53C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ED630
	.align 2, 0
_080ED53C: .4byte 0x02000000
_080ED540:
	bl sub_8055870
	cmp r0, 0
	beq _080ED54A
	b _080ED6BC
_080ED54A:
	ldr r1, _080ED55C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	b _080ED6BC
	.align 2, 0
_080ED55C: .4byte 0x02000000
_080ED560:
	bl sub_8055870
	cmp r0, 0
	beq _080ED56A
	b _080ED6BC
_080ED56A:
	ldr r1, _080ED574
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	b _080ED630
	.align 2, 0
_080ED574: .4byte 0x02000000
_080ED578:
	movs r0, 0
	bl sub_80F0264
	ldr r1, _080ED5A4
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED58C:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	beq _080ED598
	b _080ED6BC
_080ED598:
	ldr r1, _080ED5A4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ED630
	.align 2, 0
_080ED5A4: .4byte 0x02000000
_080ED5A8:
	movs r0, 0
	bl sub_80F3008
	ldr r1, _080ED5B8
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	b _080ED630
	.align 2, 0
_080ED5B8: .4byte 0x02000000
_080ED5BC:
	bl sub_8055870
	cmp r0, 0
	beq _080ED5C6
	b _080ED6BC
_080ED5C6:
	ldr r1, _080ED5D0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080ED630
	.align 2, 0
_080ED5D0: .4byte 0x02000000
_080ED5D4:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080ED5FC
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED630
	.align 2, 0
_080ED5FC: .4byte sub_80EBD18
_080ED600:
	movs r0, 0x4
	bl sub_80EED2C
	ldr r1, _080ED610
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r3
	b _080ED630
	.align 2, 0
_080ED610: .4byte 0x02000000
_080ED614:
	ldr r0, _080ED638
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080ED6BC
	ldr r2, _080ED63C
	adds r0, r4, r2
	strh r1, [r0]
	movs r3, 0xC1
	lsls r3, 2
	adds r1, r4, r3
_080ED630:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ED6BC
	.align 2, 0
_080ED638: .4byte gPaletteFade
_080ED63C: .4byte 0x00000306
_080ED640:
	movs r0, 0x1
	bl sub_80F2C80
	ldr r1, _080ED678
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED654:
	movs r0, 0x1
	bl sub_80F2CBC
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080ED6BC
	ldr r0, _080ED678
	ldr r3, _080ED67C
	adds r1, r0, r3
	strh r2, [r1]
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	b _080ED6BC
	.align 2, 0
_080ED678: .4byte 0x02000000
_080ED67C: .4byte 0x00000306
_080ED680:
	ldr r4, _080ED6C4
	ldr r2, _080ED6C8
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F2C80
	movs r3, 0xC1
	lsls r3, 2
	adds r4, r3
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080ED69E:
	ldr r0, _080ED6C4
	ldr r1, _080ED6C8
	adds r0, r1
	ldrb r0, [r0]
	adds r0, 0x7
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080ED6BC
	ldr r0, _080ED6CC
	bl sub_80EBDBC
_080ED6BC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ED6C4: .4byte 0x02000000
_080ED6C8: .4byte 0x00006dfc
_080ED6CC: .4byte sub_80ED31C
	thumb_func_end sub_80ED01C

	thumb_func_start sub_80ED31C
sub_80ED31C: @ 80ED6D0
	push {r4,lr}
	ldr r0, _080ED6EC
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080ED75C
	cmp r0, 0x1
	bgt _080ED6F0
	cmp r0, 0
	beq _080ED6F6
	b _080ED77E
	.align 2, 0
_080ED6EC: .4byte 0x02000000
_080ED6F0:
	cmp r0, 0x2
	beq _080ED774
	b _080ED77E
_080ED6F6:
	bl sub_80F5DD4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080ED728
	cmp r0, 0x2
	beq _080ED734
	ldr r0, _080ED720
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080ED740
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080ED724
	bl sub_80EBDBC
	b _080ED77E
	.align 2, 0
_080ED720: .4byte gMain
_080ED724: .4byte sub_80ED4D8
_080ED728:
	movs r0, 0x5
	bl PlaySE
	bl ShowMapNamePopUpWindow
	b _080ED77E
_080ED734:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	adds r0, 0x1
	b _080ED77C
_080ED740:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080ED77E
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080ED758
	bl sub_80EBDBC
	b _080ED77E
	.align 2, 0
_080ED758: .4byte sub_80ECD80
_080ED75C:
	bl sub_80F0718
	lsls r0, 24
	cmp r0, 0
	bne _080ED77E
	bl ShowMapNamePopUpWindow
	bl sub_80F3264
	ldrh r0, [r4]
	adds r0, 0x1
	b _080ED77C
_080ED774:
	bl sub_8055870
	cmp r0, 0
	bne _080ED77E
_080ED77C:
	strh r0, [r4]
_080ED77E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80ED31C

	thumb_func_start sub_80ED3D0
sub_80ED3D0: @ 80ED784
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080ED7A0
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x8
	bhi _080ED87A
	lsls r0, 2
	ldr r1, _080ED7A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED7A0: .4byte 0x02000000
_080ED7A4: .4byte _080ED7A8
	.align 2, 0
_080ED7A8:
	.4byte _080ED7CC
	.4byte _080ED7D4
	.4byte _080ED7DE
	.4byte _080ED7E6
	.4byte _080ED7FA
	.4byte _080ED80C
	.4byte _080ED816
	.4byte _080ED84C
	.4byte _080ED868
_080ED7CC:
	movs r0, 0
	bl SetVBlankCallback
	b _080ED852
_080ED7D4:
	bl sub_80EED0C
	bl sub_80F6134
	b _080ED852
_080ED7DE:
	movs r0, 0
	bl sub_80EEFBC
	b _080ED852
_080ED7E6:
	movs r0, 0
	bl sub_80F0264
	ldr r1, _080ED808
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED7FA:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	bne _080ED87A
	b _080ED852
	.align 2, 0
_080ED808: .4byte 0x02000000
_080ED80C:
	bl sub_8055870
	cmp r0, 0
	bne _080ED87A
	b _080ED852
_080ED816:
	movs r0, 0
	bl sub_80F3008
	ldr r4, _080ED844
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080ED848
	bl SetVBlankCallback
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080ED85A
	.align 2, 0
_080ED844: .4byte 0x02000000
_080ED848: .4byte sub_80EBD18
_080ED84C:
	movs r0, 0x4
	bl sub_80EED2C
_080ED852:
	ldr r1, _080ED864
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080ED85A:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ED87A
	.align 2, 0
_080ED864: .4byte 0x02000000
_080ED868:
	ldr r0, _080ED884
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ED87A
	ldr r0, _080ED888
	bl sub_80EBDBC
_080ED87A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ED884: .4byte gPaletteFade
_080ED888: .4byte sub_80ED31C
	thumb_func_end sub_80ED3D0

	thumb_func_start sub_80ED4D8
sub_80ED4D8: @ 80ED88C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080ED8AC
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x8
	bls _080ED8A2
	b _080ED9C2
_080ED8A2:
	lsls r0, 2
	ldr r1, _080ED8B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED8AC: .4byte 0x02000000
_080ED8B0: .4byte _080ED8B4
	.align 2, 0
_080ED8B4:
	.4byte _080ED8D8
	.4byte _080ED8F6
	.4byte _080ED918
	.4byte _080ED930
	.4byte _080ED936
	.4byte _080ED948
	.4byte _080ED958
	.4byte _080ED994
	.4byte _080ED9B0
_080ED8D8:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED9A2
_080ED8F6:
	ldr r0, _080ED914
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ED9C2
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80F3130
	b _080ED99A
	.align 2, 0
_080ED914: .4byte gPaletteFade
_080ED918:
	bl sub_8055870
	cmp r0, 0
	bne _080ED9C2
	ldr r1, _080ED92C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080ED9A2
	.align 2, 0
_080ED92C: .4byte 0x02000000
_080ED930:
	bl sub_80F4CF0
	b _080ED99A
_080ED936:
	bl sub_80EFF34
	ldr r1, _080ED954
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080ED948:
	bl sub_80EFF68
	lsls r0, 24
	cmp r0, 0
	bne _080ED9C2
	b _080ED99A
	.align 2, 0
_080ED954: .4byte 0x02000000
_080ED958:
	bl sub_80F35B4
	movs r0, 0x2
	bl sub_80EEFBC
	ldr r4, _080ED98C
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080ED990
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080ED9A2
	.align 2, 0
_080ED98C: .4byte 0x02000000
_080ED990: .4byte sub_80EBD4C
_080ED994:
	movs r0, 0x2
	bl sub_80EED2C
_080ED99A:
	ldr r1, _080ED9AC
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080ED9A2:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080ED9C2
	.align 2, 0
_080ED9AC: .4byte 0x02000000
_080ED9B0:
	ldr r0, _080ED9CC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080ED9C2
	ldr r0, _080ED9D0
	bl sub_80EBDBC
_080ED9C2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ED9CC: .4byte gPaletteFade
_080ED9D0: .4byte sub_80ED858
	thumb_func_end sub_80ED4D8

	thumb_func_start sub_80ED620
sub_80ED620: @ 80ED9D4
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080ED9F4
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x10
	bls _080ED9EA
	b _080EDBFA
_080ED9EA:
	lsls r0, 2
	ldr r1, _080ED9F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ED9F4: .4byte 0x02000000
_080ED9F8: .4byte _080ED9FC
	.align 2, 0
_080ED9FC:
	.4byte _080EDA40
	.4byte _080EDA58
	.4byte _080EDA6C
	.4byte _080EDAA0
	.4byte _080EDAE4
	.4byte _080EDAEA
	.4byte _080EDB04
	.4byte _080EDB16
	.4byte _080EDB20
	.4byte _080EDB38
	.4byte _080EDB3E
	.4byte _080EDB74
	.4byte _080EDB88
	.4byte _080EDBA0
	.4byte _080EDBB4
	.4byte _080EDBD4
	.4byte _080EDBE8
_080EDA40:
	bl sub_80F1E84
	movs r0, 0x1
	bl sub_80F2D04
	ldr r1, _080EDA54
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EDBC8
	.align 2, 0
_080EDA54: .4byte 0x02000000
_080EDA58:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080EDA64
	b _080EDBFA
_080EDA64:
	movs r0, 0x1
	bl sub_80EEFBC
	b _080EDBC0
_080EDA6C:
	bl sub_80EEF34
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080EDA7A
	b _080EDBFA
_080EDA7A:
	ldr r4, _080EDA9C
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EDBC8
	.align 2, 0
_080EDA9C: .4byte 0x02000000
_080EDAA0:
	ldr r0, _080EDAD8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080EDAB2
	b _080EDBFA
_080EDAB2:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80EF814
	ldr r0, _080EDADC
	ldr r2, _080EDAE0
	adds r1, r0, r2
	strb r4, [r1]
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	b _080EDBFA
	.align 2, 0
_080EDAD8: .4byte gPaletteFade
_080EDADC: .4byte 0x02000000
_080EDAE0: .4byte 0x000076aa
_080EDAE4:
	bl sub_80F2620
	b _080EDBC0
_080EDAEA:
	ldr r0, _080EDB00
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	bl sub_80F4BD0
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EDBC8
	.align 2, 0
_080EDB00: .4byte 0x0000d162
_080EDB04:
	bl sub_80EFF34
	ldr r1, _080EDB1C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EDB16:
	bl sub_80EFF68
	b _080EDBBA
	.align 2, 0
_080EDB1C: .4byte 0x02000000
_080EDB20:
	bl sub_8055870
	cmp r0, 0
	bne _080EDBFA
	ldr r1, _080EDB34
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EDBC8
	.align 2, 0
_080EDB34: .4byte 0x02000000
_080EDB38:
	bl sub_8055870
	b _080EDBBC
_080EDB3E:
	bl sub_80F33A8
	ldr r4, _080EDB6C
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080EDB70
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EDBC8
	.align 2, 0
_080EDB6C: .4byte 0x02000000
_080EDB70: .4byte sub_80EBD4C
_080EDB74:
	movs r0, 0x2
	bl sub_80EED2C
	ldr r1, _080EDB84
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EDBC8
	.align 2, 0
_080EDB84: .4byte 0x02000000
_080EDB88:
	ldr r0, _080EDB9C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EDBFA
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EDBC8
	.align 2, 0
_080EDB9C: .4byte gPaletteFade
_080EDBA0:
	movs r0, 0x1
	bl sub_80F2C80
	ldr r1, _080EDBD0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EDBB4:
	movs r0, 0x1
	bl sub_80F2CBC
_080EDBBA:
	lsls r0, 24
_080EDBBC:
	cmp r0, 0
	bne _080EDBFA
_080EDBC0:
	ldr r1, _080EDBD0
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
_080EDBC8:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EDBFA
	.align 2, 0
_080EDBD0: .4byte 0x02000000
_080EDBD4:
	movs r0, 0x6
	bl sub_80F2C80
	ldr r1, _080EDC04
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EDBE8:
	movs r0, 0x6
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080EDBFA
	ldr r0, _080EDC08
	bl sub_80EBDBC
_080EDBFA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EDC04: .4byte 0x02000000
_080EDC08: .4byte sub_80ED858
	thumb_func_end sub_80ED620

	thumb_func_start sub_80ED858
sub_80ED858: @ 80EDC0C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _080EDC2C
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xB
	bls _080EDC22
	b _080EDF2E
_080EDC22:
	lsls r0, 2
	ldr r1, _080EDC30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EDC2C: .4byte 0x02000000
_080EDC30: .4byte _080EDC34
	.align 2, 0
_080EDC34:
	.4byte _080EDC64
	.4byte _080EDC80
	.4byte _080EDCA0
	.4byte _080EDCB8
	.4byte _080EDCCE
	.4byte _080EDE1C
	.4byte _080EDE40
	.4byte _080EDE58
	.4byte _080EDE74
	.4byte _080EDE9C
	.4byte _080EDF2E
	.4byte _080EDEDC
_080EDC64:
	bl sub_80F4F78
	bl sub_80F5B38
	ldr r0, _080EDC7C
	movs r4, 0xC1
	lsls r4, 2
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDC7C: .4byte 0x02000000
_080EDC80:
	bl sub_80F5B50
	lsls r0, 24
	cmp r0, 0
	beq _080EDC8C
	b _080EDF2E
_080EDC8C:
	ldr r0, _080EDC9C
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDC9C: .4byte 0x02000000
_080EDCA0:
	movs r0, 0x1
	bl sub_80F0174
	ldr r0, _080EDCB4
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDCB4: .4byte 0x02000000
_080EDCB8:
	bl sub_80F4FB4
	lsls r0, 24
	cmp r0, 0
	beq _080EDCC4
	b _080EDF2E
_080EDCC4:
	bl sub_80F3C94
	bl sub_80F3D00
	b _080EDE88
_080EDCCE:
	ldr r2, _080EDD14
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _080EDD24
	ldr r1, _080EDD18
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EDD24
	ldr r2, _080EDD1C
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EDCFC
	ldr r4, _080EDD20
	adds r0, r5, r4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080EDD24
_080EDCFC:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_80F5060
	bl move_anim_execute
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r5, r2
	b _080EDD6C
	.align 2, 0
_080EDD14: .4byte gMain
_080EDD18: .4byte 0x000087cb
_080EDD1C: .4byte 0x000076aa
_080EDD20: .4byte 0x000087dc
_080EDD24:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EDD80
	ldr r4, _080EDD74
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EDD80
	ldr r1, _080EDD78
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EDD56
	ldr r2, _080EDD7C
	adds r0, r5, r2
	subs r4, 0x57
	adds r1, r5, r4
	movs r4, 0
	ldrsh r2, [r0, r4]
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r2, r0
	bge _080EDD80
_080EDD56:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80F5060
	bl move_anim_execute
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r5, r0
_080EDD6C:
	movs r0, 0x5
	strh r0, [r1]
	b _080EDF2E
	.align 2, 0
_080EDD74: .4byte 0x000087cb
_080EDD78: .4byte 0x000076aa
_080EDD7C: .4byte 0x000087dc
_080EDD80:
	ldrh r2, [r3, 0x2E]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080EDDAC
	movs r0, 0x5
	bl PlaySE
	bl sub_80F4FDC
	bl move_anim_execute
	ldr r0, _080EDDA8
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x9
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDDA8: .4byte 0x02000000
_080EDDAC:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080EDDB6
	b _080EDF2E
_080EDDB6:
	adds r4, r5, 0
	ldr r2, _080EDDEC
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EDDF8
	ldr r1, _080EDDF0
	adds r0, r4, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r2, _080EDDF4
	adds r0, r4, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	cmp r1, r0
	beq _080EDDDA
	b _080EDF2E
_080EDDDA:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	movs r0, 0x9
	strh r0, [r1]
	b _080EDF2E
	.align 2, 0
_080EDDEC: .4byte 0x000076aa
_080EDDF0: .4byte 0x000087dc
_080EDDF4: .4byte 0x000087da
_080EDDF8:
	ldr r1, _080EDE18
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EDE04
	b _080EDF2E
_080EDE04:
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r5, r2
	movs r0, 0x7
	strh r0, [r1]
	b _080EDF2E
	.align 2, 0
_080EDE18: .4byte 0x00006dac
_080EDE1C:
	bl gpu_sync_bg_show
	lsls r0, 24
	cmp r0, 0
	beq _080EDE28
	b _080EDF2E
_080EDE28:
	bl sub_80F3D00
	ldr r0, _080EDE3C
	movs r4, 0xC1
	lsls r4, 2
	adds r0, r4
	movs r1, 0x6
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDE3C: .4byte 0x02000000
_080EDE40:
	bl sub_8055870
	cmp r0, 0
	bne _080EDF2E
	ldr r0, _080EDE54
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	b _080EDE90
	.align 2, 0
_080EDE54: .4byte 0x02000000
_080EDE58:
	movs r0, 0x3
	bl sub_80EEFBC
	bl sub_80F3668
	ldr r0, _080EDE70
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r2
	movs r1, 0x8
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDE70: .4byte 0x02000000
_080EDE74:
	bl sub_80F7500
	lsls r0, 24
	cmp r0, 0
	bne _080EDF2E
	movs r0, 0x2
	bl sub_80EEFBC
	bl sub_80F3698
_080EDE88:
	ldr r0, _080EDE98
	movs r4, 0xC1
	lsls r4, 2
	adds r0, r4
_080EDE90:
	movs r1, 0x4
	strh r1, [r0]
	b _080EDF2E
	.align 2, 0
_080EDE98: .4byte 0x02000000
_080EDE9C:
	bl sub_80F5038
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080EDF2E
	movs r0, 0
	bl sub_80F0174
	bl sub_80F2F48
	ldr r5, _080EDED8
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r4, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r5, r2
	movs r0, 0xB
	strh r0, [r1]
	b _080EDF2E
	.align 2, 0
_080EDED8: .4byte 0x02000000
_080EDEDC:
	ldr r0, _080EDF14
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EDF2E
	bl sub_80F3CE8
	bl sub_80F5BDC
	ldr r0, _080EDF18
	ldr r4, _080EDF1C
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EDF24
	bl sub_80F357C
	movs r0, 0x1
	bl sub_80F2D6C
	movs r0, 0x6
	bl sub_80F2D6C
	ldr r0, _080EDF20
	bl sub_80EBDBC
	b _080EDF2E
	.align 2, 0
_080EDF14: .4byte gPaletteFade
_080EDF18: .4byte 0x02000000
_080EDF1C: .4byte 0x000076aa
_080EDF20: .4byte sub_80ECA10
_080EDF24:
	bl sub_80F3614
	ldr r0, _080EDF38
	bl sub_80EBDBC
_080EDF2E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EDF38: .4byte sub_80ED3D0
	thumb_func_end sub_80ED858

	thumb_func_start sub_80EDB88
sub_80EDB88: @ 80EDF3C
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080EDF5C
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x11
	bls _080EDF52
	b _080EE15E
_080EDF52:
	lsls r0, 2
	ldr r1, _080EDF60
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EDF5C: .4byte 0x02000000
_080EDF60: .4byte _080EDF64
	.align 2, 0
_080EDF64:
	.4byte _080EDFAC
	.4byte _080EDFB8
	.4byte _080EDFD8
	.4byte _080EE00C
	.4byte _080EE030
	.4byte _080EE044
	.4byte _080EE056
	.4byte _080EE074
	.4byte _080EE090
	.4byte _080EE09A
	.4byte _080EE0AE
	.4byte _080EE0C0
	.4byte _080EE0D4
	.4byte _080EE0E8
	.4byte _080EE0FC
	.4byte _080EE106
	.4byte _080EE130
	.4byte _080EE14C
_080EDFAC:
	bl sub_80F1E84
	movs r0, 0
	bl sub_80F2D04
	b _080EE136
_080EDFB8:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080EDFC4
	b _080EE15E
_080EDFC4:
	movs r0, 0x4
	bl sub_80EEFBC
	ldr r1, _080EDFD4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE13E
	.align 2, 0
_080EDFD4: .4byte 0x02000000
_080EDFD8:
	bl sub_80EEF34
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080EDFE6
	b _080EE15E
_080EDFE6:
	ldr r4, _080EE008
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EE13E
	.align 2, 0
_080EE008: .4byte 0x02000000
_080EE00C:
	ldr r0, _080EE02C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EE01A
	b _080EE15E
_080EE01A:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80EF814
	b _080EE136
	.align 2, 0
_080EE02C: .4byte gPaletteFade
_080EE030:
	bl sub_80F2620
	ldr r1, _080EE040
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE13E
	.align 2, 0
_080EE040: .4byte 0x02000000
_080EE044:
	bl sub_80F638C
	ldr r1, _080EE070
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE056:
	bl sub_80F63D0
	lsls r0, 24
	cmp r0, 0
	bne _080EE136
	ldr r1, _080EE070
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x2
	strh r0, [r1]
	b _080EE15E
	.align 2, 0
_080EE070: .4byte 0x02000000
_080EE074:
	bl sub_8055870
	cmp r0, 0
	bne _080EE15E
	ldr r1, _080EE08C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	b _080EE15E
	.align 2, 0
_080EE08C: .4byte 0x02000000
_080EE090:
	bl sub_8055870
	cmp r0, 0
	bne _080EE15E
	b _080EE136
_080EE09A:
	movs r0, 0x1
	bl sub_80F0264
	ldr r1, _080EE0BC
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE0AE:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	bne _080EE15E
	b _080EE136
	.align 2, 0
_080EE0BC: .4byte 0x02000000
_080EE0C0:
	movs r0, 0x2
	bl sub_80F2C80
	ldr r1, _080EE0E4
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE0D4:
	movs r0, 0x2
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080EE15E
	b _080EE136
	.align 2, 0
_080EE0E4: .4byte 0x02000000
_080EE0E8:
	movs r0, 0x1
	bl sub_80F3008
	ldr r1, _080EE0F8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE13E
	.align 2, 0
_080EE0F8: .4byte 0x02000000
_080EE0FC:
	bl sub_8055870
	cmp r0, 0
	bne _080EE15E
	b _080EE136
_080EE106:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080EE12C
	bl SetVBlankCallback
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EE13E
	.align 2, 0
_080EE12C: .4byte sub_80EBD18
_080EE130:
	movs r0, 0x4
	bl sub_80EED2C
_080EE136:
	ldr r1, _080EE148
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080EE13E:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EE15E
	.align 2, 0
_080EE148: .4byte 0x02000000
_080EE14C:
	ldr r0, _080EE168
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE15E
	ldr r0, _080EE16C
	bl sub_80EBDBC
_080EE15E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE168: .4byte gPaletteFade
_080EE16C: .4byte sub_80EDDBC
	thumb_func_end sub_80EDB88

	thumb_func_start sub_80EDDBC
sub_80EDDBC: @ 80EE170
	push {r4,lr}
	ldr r0, _080EE18C
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080EE1FC
	cmp r0, 0x1
	bgt _080EE190
	cmp r0, 0
	beq _080EE196
	b _080EE21E
	.align 2, 0
_080EE18C: .4byte 0x02000000
_080EE190:
	cmp r0, 0x2
	beq _080EE214
	b _080EE21E
_080EE196:
	bl sub_80F5DD4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080EE1C8
	cmp r0, 0x2
	beq _080EE1D4
	ldr r0, _080EE1C0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EE1E0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EE1C4
	bl sub_80EBDBC
	b _080EE21E
	.align 2, 0
_080EE1C0: .4byte gMain
_080EE1C4: .4byte sub_80EDEE4
_080EE1C8:
	movs r0, 0x5
	bl PlaySE
	bl ShowMapNamePopUpWindow
	b _080EE21E
_080EE1D4:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	adds r0, 0x1
	b _080EE21C
_080EE1E0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080EE21E
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EE1F8
	bl sub_80EBDBC
	b _080EE21E
	.align 2, 0
_080EE1F8: .4byte sub_80EDE70
_080EE1FC:
	bl sub_80F0718
	lsls r0, 24
	cmp r0, 0
	bne _080EE21E
	bl ShowMapNamePopUpWindow
	bl sub_80F3264
	ldrh r0, [r4]
	adds r0, 0x1
	b _080EE21C
_080EE214:
	bl sub_8055870
	cmp r0, 0
	bne _080EE21E
_080EE21C:
	strh r0, [r4]
_080EE21E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EDDBC

	thumb_func_start sub_80EDE70
sub_80EDE70: @ 80EE224
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080EE240
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r0, r1
	ldrh r2, [r4]
	cmp r2, 0x1
	beq _080EE262
	cmp r2, 0x1
	bgt _080EE244
	cmp r2, 0
	beq _080EE24A
	b _080EE28A
	.align 2, 0
_080EE240: .4byte 0x02000000
_080EE244:
	cmp r2, 0x2
	beq _080EE284
	b _080EE28A
_080EE24A:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080EE278
_080EE262:
	ldr r0, _080EE280
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE28A
	bl sub_80F3130
	movs r0, 0x2
	bl sub_80F2D6C
_080EE278:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080EE28A
	.align 2, 0
_080EE280: .4byte gPaletteFade
_080EE284:
	ldr r0, _080EE294
	bl sub_80EBDBC
_080EE28A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE294: .4byte sub_80EC00C
	thumb_func_end sub_80EDE70

	thumb_func_start sub_80EDEE4
sub_80EDEE4: @ 80EE298
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080EE2B8
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0xA
	bls _080EE2AE
	b _080EE414
_080EE2AE:
	lsls r0, 2
	ldr r1, _080EE2BC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EE2B8: .4byte 0x02000000
_080EE2BC: .4byte _080EE2C0
	.align 2, 0
_080EE2C0:
	.4byte _080EE2EC
	.4byte _080EE304
	.4byte _080EE334
	.4byte _080EE34C
	.4byte _080EE364
	.4byte _080EE37C
	.4byte _080EE394
	.4byte _080EE3AC
	.4byte _080EE3D0
	.4byte _080EE3E4
	.4byte _080EE404
_080EE2EC:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080EE3F0
_080EE304:
	ldr r0, _080EE32C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EE312
	b _080EE414
_080EE312:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80F3130
	ldr r1, _080EE330
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EE3F6
	.align 2, 0
_080EE32C: .4byte gPaletteFade
_080EE330: .4byte 0x02000000
_080EE334:
	bl sub_80F66E0
	bl sub_80EEE08
	ldr r1, _080EE348
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE3F6
	.align 2, 0
_080EE348: .4byte 0x02000000
_080EE34C:
	bl sub_80F1080
	lsls r0, 24
	cmp r0, 0
	bne _080EE414
	ldr r1, _080EE360
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EE3F6
	.align 2, 0
_080EE360: .4byte 0x02000000
_080EE364:
	movs r0, 0x5
	bl sub_80EEFBC
	bl sub_80F38B8
	ldr r1, _080EE390
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE37C:
	bl sub_80F38EC
	lsls r0, 24
	cmp r0, 0
	bne _080EE414
	ldr r1, _080EE390
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EE3F6
	.align 2, 0
_080EE390: .4byte 0x02000000
_080EE394:
	bl sub_8055870
	cmp r0, 0
	bne _080EE414
	ldr r1, _080EE3A8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE3F6
	.align 2, 0
_080EE3A8: .4byte 0x02000000
_080EE3AC:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080EE3CC
	bl SetVBlankCallback
	b _080EE3F0
	.align 2, 0
_080EE3CC: .4byte sub_80EBD18
_080EE3D0:
	movs r0, 0x3
	bl sub_80EED2C
	ldr r1, _080EE3E0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EE3F6
	.align 2, 0
_080EE3E0: .4byte 0x02000000
_080EE3E4:
	ldr r0, _080EE400
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE414
_080EE3F0:
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
_080EE3F6:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EE414
	.align 2, 0
_080EE400: .4byte gPaletteFade
_080EE404:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _080EE414
	ldr r0, _080EE41C
	bl sub_80EBDBC
_080EE414:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE41C: .4byte sub_80EE06C
	thumb_func_end sub_80EDEE4

	thumb_func_start sub_80EE06C
sub_80EE06C: @ 80EE420
	push {r4,r5,lr}
	ldr r1, _080EE440
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x8
	bls _080EE434
	b _080EE63C
_080EE434:
	lsls r0, 2
	ldr r1, _080EE444
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EE440: .4byte 0x02000000
_080EE444: .4byte _080EE448
	.align 2, 0
_080EE448:
	.4byte _080EE46C
	.4byte _080EE480
	.4byte _080EE534
	.4byte _080EE550
	.4byte _080EE56C
	.4byte _080EE584
	.4byte _080EE5AC
	.4byte _080EE604
	.4byte _080EE620
_080EE46C:
	bl sub_80F15A8
	ldr r1, _080EE47C
	movs r5, 0xC1
	lsls r5, 2
	adds r1, r5
	b _080EE578
	.align 2, 0
_080EE47C: .4byte 0x02000000
_080EE480:
	ldr r2, _080EE4B0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _080EE4B8
	ldr r1, _080EE4B4
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080EE4B8
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl sub_80F6A4C
	movs r5, 0xC1
	lsls r5, 2
	adds r1, r4, r5
	b _080EE578
	.align 2, 0
_080EE4B0: .4byte gMain
_080EE4B4: .4byte 0x000087dc
_080EE4B8:
	ldrh r1, [r3, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EE4F4
	ldr r1, _080EE4EC
	adds r0, r4, r1
	ldr r2, _080EE4F0
	adds r1, r4, r2
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r2, r0
	bge _080EE4F4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_80F6A4C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080EE578
	.align 2, 0
_080EE4EC: .4byte 0x000087dc
_080EE4F0: .4byte 0x00008774
_080EE4F4:
	ldrh r2, [r3, 0x2E]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080EE518
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xB
	bl sub_80EEFBC
	ldr r0, _080EE514
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	b _080EE616
	.align 2, 0
_080EE514: .4byte 0x02000000
_080EE518:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	bne _080EE522
	b _080EE63C
_080EE522:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EE530
	bl sub_80EBDBC
	b _080EE63C
	.align 2, 0
_080EE530: .4byte sub_80EE294
_080EE534:
	bl sub_80F6AF0
	lsls r0, 24
	cmp r0, 0
	beq _080EE540
	b _080EE63C
_080EE540:
	ldr r1, _080EE54C
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE578
	.align 2, 0
_080EE54C: .4byte 0x02000000
_080EE550:
	bl sub_8055870
	adds r1, r0, 0
	cmp r1, 0
	bne _080EE63C
	ldr r0, _080EE568
	movs r5, 0xC1
	lsls r5, 2
	adds r0, r5
	strh r1, [r0]
	b _080EE63C
	.align 2, 0
_080EE568: .4byte 0x02000000
_080EE56C:
	bl sub_80F3B00
	ldr r1, _080EE580
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080EE578:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EE63C
	.align 2, 0
_080EE580: .4byte 0x02000000
_080EE584:
	bl sub_80F3B58
	lsls r0, 24
	cmp r0, 0
	bne _080EE63C
	bl sub_80F1494
	ldr r1, _080EE5A8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl sub_80EED9C
	b _080EE63C
	.align 2, 0
_080EE5A8: .4byte 0x02000000
_080EE5AC:
	bl sub_80F68E8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080EE5D8
	cmp r0, 0x1
	bne _080EE5D8
	movs r0, 0x5
	bl PlaySE
	bl sub_80F3B94
	ldr r0, _080EE5D4
	movs r5, 0xC1
	lsls r5, 2
	adds r0, r5
	movs r1, 0x7
	strh r1, [r0]
	b _080EE63C
	.align 2, 0
_080EE5D4: .4byte 0x02000000
_080EE5D8:
	ldr r0, _080EE5FC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080EE63C
	movs r0, 0x5
	bl PlaySE
	bl sub_80F3B94
	ldr r0, _080EE600
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0]
	b _080EE63C
	.align 2, 0
_080EE5FC: .4byte gMain
_080EE600: .4byte 0x02000000
_080EE604:
	bl sub_80F3BD4
	lsls r0, 24
	cmp r0, 0
	bne _080EE63C
	ldr r0, _080EE61C
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r2
_080EE616:
	movs r1, 0x4
	strh r1, [r0]
	b _080EE63C
	.align 2, 0
_080EE61C: .4byte 0x02000000
_080EE620:
	bl sub_80F3BD4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080EE63C
	movs r0, 0x5
	bl sub_80EEFBC
	ldr r0, _080EE644
	movs r5, 0xC1
	lsls r5, 2
	adds r0, r5
	strh r4, [r0]
_080EE63C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE644: .4byte 0x02000000
	thumb_func_end sub_80EE06C

	thumb_func_start sub_80EE294
sub_80EE294: @ 80EE648
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _080EE668
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x8
	bls _080EE65E
	b _080EE77A
_080EE65E:
	lsls r0, 2
	ldr r1, _080EE66C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EE668: .4byte 0x02000000
_080EE66C: .4byte _080EE670
	.align 2, 0
_080EE670:
	.4byte _080EE694
	.4byte _080EE6B2
	.4byte _080EE6D8
	.4byte _080EE6F0
	.4byte _080EE700
	.4byte _080EE724
	.4byte _080EE72E
	.4byte _080EE74E
	.4byte _080EE768
_080EE694:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EE75C
_080EE6B2:
	ldr r0, _080EE6D4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE77A
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80F3C2C
	bl sub_80EEE08
	b _080EE754
	.align 2, 0
_080EE6D4: .4byte gPaletteFade
_080EE6D8:
	bl sub_80F6134
	movs r0, 0x1
	bl sub_80F0264
	ldr r1, _080EE6FC
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE6F0:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	bne _080EE77A
	b _080EE754
	.align 2, 0
_080EE6FC: .4byte 0x02000000
_080EE700:
	movs r0, 0x4
	bl sub_80EEFBC
	movs r0, 0x1
	bl sub_80F3008
	ldr r0, _080EE71C
	bl SetVBlankCallback
	ldr r1, _080EE720
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EE75C
	.align 2, 0
_080EE71C: .4byte sub_80EBD18
_080EE720: .4byte 0x02000000
_080EE724:
	bl sub_8055870
	cmp r0, 0
	bne _080EE77A
	b _080EE754
_080EE72E:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r4, r2
	b _080EE75C
_080EE74E:
	movs r0, 0x4
	bl sub_80EED2C
_080EE754:
	ldr r1, _080EE764
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080EE75C:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EE77A
	.align 2, 0
_080EE764: .4byte 0x02000000
_080EE768:
	ldr r0, _080EE784
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE77A
	ldr r0, _080EE788
	bl sub_80EBDBC
_080EE77A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE784: .4byte gPaletteFade
_080EE788: .4byte sub_80EDDBC
	thumb_func_end sub_80EE294

	thumb_func_start sub_80EE3D8
sub_80EE3D8: @ 80EE78C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080EE7AC
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xD
	bls _080EE7A0
	b _080EE92E
_080EE7A0:
	lsls r0, 2
	ldr r1, _080EE7B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EE7AC: .4byte 0x02000000
_080EE7B0: .4byte _080EE7B4
	.align 2, 0
_080EE7B4:
	.4byte _080EE7EC
	.4byte _080EE7F8
	.4byte _080EE80C
	.4byte _080EE840
	.4byte _080EE864
	.4byte _080EE86A
	.4byte _080EE87E
	.4byte _080EE890
	.4byte _080EE8A4
	.4byte _080EE8B8
	.4byte _080EE8C0
	.4byte _080EE8CA
	.4byte _080EE900
	.4byte _080EE91C
_080EE7EC:
	bl sub_80F1E84
	movs r0, 0
	bl sub_80F2D04
	b _080EE906
_080EE7F8:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080EE804
	b _080EE92E
_080EE804:
	movs r0, 0x9
	bl sub_80EEFBC
	b _080EE906
_080EE80C:
	bl sub_80EEF34
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080EE81A
	b _080EE92E
_080EE81A:
	ldr r4, _080EE83C
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080EE90E
	.align 2, 0
_080EE83C: .4byte 0x02000000
_080EE840:
	ldr r0, _080EE860
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE92E
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80EED0C
	bl sub_80EF814
	bl sub_80EEE08
	b _080EE906
	.align 2, 0
_080EE860: .4byte gPaletteFade
_080EE864:
	bl sub_80F2620
	b _080EE906
_080EE86A:
	movs r0, 0x2
	bl sub_80F0264
	ldr r1, _080EE88C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE87E:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	bne _080EE92E
	b _080EE906
	.align 2, 0
_080EE88C: .4byte 0x02000000
_080EE890:
	movs r0, 0x3
	bl sub_80F2C80
	ldr r1, _080EE8B4
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EE8A4:
	movs r0, 0x3
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080EE92E
	b _080EE906
	.align 2, 0
_080EE8B4: .4byte 0x02000000
_080EE8B8:
	movs r0, 0x2
	bl sub_80F3008
	b _080EE906
_080EE8C0:
	bl sub_8055870
	cmp r0, 0
	bne _080EE92E
	b _080EE906
_080EE8CA:
	bl sub_80F6F10
	ldr r4, _080EE8F8
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080EE8FC
	bl SetVBlankCallback
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
	b _080EE90E
	.align 2, 0
_080EE8F8: .4byte 0x02000000
_080EE8FC: .4byte sub_80EBD68
_080EE900:
	movs r0, 0x5
	bl sub_80EED2C
_080EE906:
	ldr r1, _080EE918
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
_080EE90E:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EE92E
	.align 2, 0
_080EE918: .4byte 0x02000000
_080EE91C:
	ldr r0, _080EE938
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EE92E
	ldr r0, _080EE93C
	bl sub_80EBDBC
_080EE92E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE938: .4byte gPaletteFade
_080EE93C: .4byte sub_80EE58C
	thumb_func_end sub_80EE3D8

	thumb_func_start sub_80EE58C
sub_80EE58C: @ 80EE940
	push {r4,r5,lr}
	ldr r5, _080EE95C
	movs r0, 0xC1
	lsls r0, 2
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080EE9D8
	cmp r0, 0x1
	bgt _080EE960
	cmp r0, 0
	beq _080EE966
	b _080EEA06
	.align 2, 0
_080EE95C: .4byte 0x02000000
_080EE960:
	cmp r0, 0x2
	beq _080EE9FC
	b _080EEA06
_080EE966:
	bl sub_80F5DD4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080EE998
	cmp r0, 0x2
	beq _080EE9B0
	ldr r0, _080EE990
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080EE9BC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EE994
	bl sub_80EBDBC
	b _080EEA06
	.align 2, 0
_080EE990: .4byte gMain
_080EE994: .4byte sub_80EE658
_080EE998:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080EE9AC
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_80F0FFC
	b _080EEA06
	.align 2, 0
_080EE9AC: .4byte 0x0000876e
_080EE9B0:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	adds r0, 0x1
	b _080EEA04
_080EE9BC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080EEA06
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080EE9D4
	bl sub_80EBDBC
	b _080EEA06
	.align 2, 0
_080EE9D4: .4byte sub_80EE8F4
_080EE9D8:
	bl sub_80F0718
	lsls r0, 24
	cmp r0, 0
	bne _080EEA06
	ldr r1, _080EE9F8
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_80F0FFC
	bl sub_80F3264
	ldrh r0, [r4]
	adds r0, 0x1
	b _080EEA04
	.align 2, 0
_080EE9F8: .4byte 0x0000876e
_080EE9FC:
	bl sub_8055870
	cmp r0, 0
	bne _080EEA06
_080EEA04:
	strh r0, [r4]
_080EEA06:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EE58C

	thumb_func_start sub_80EE658
sub_80EE658: @ 80EEA0C
	push {r4,r5,lr}
	ldr r1, _080EEA2C
	movs r2, 0xC1
	lsls r2, 2
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x11
	bls _080EEA20
	b _080EEC9C
_080EEA20:
	lsls r0, 2
	ldr r1, _080EEA30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EEA2C: .4byte 0x02000000
_080EEA30: .4byte _080EEA34
	.align 2, 0
_080EEA34:
	.4byte _080EEA7C
	.4byte _080EEA8E
	.4byte _080EEAA8
	.4byte _080EEABC
	.4byte _080EEAD0
	.4byte _080EEAE4
	.4byte _080EEB0C
	.4byte _080EEB1E
	.4byte _080EEB34
	.4byte _080EEBD4
	.4byte _080EEBF4
	.4byte _080EEC08
	.4byte _080EEC1C
	.4byte _080EEC22
	.4byte _080EEC34
	.4byte _080EEC4C
	.4byte _080EEC68
	.4byte _080EEC88
_080EEA7C:
	movs r0, 0x1
	bl sub_80F3294
	movs r0, 0xA
	bl sub_80EEFBC
	bl sub_80F0B24
	b _080EEC72
_080EEA8E:
	bl sub_80F0B44
	lsls r0, 24
	cmp r0, 0
	beq _080EEA9A
	b _080EEC9C
_080EEA9A:
	ldr r1, _080EEAA4
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EEC7A
	.align 2, 0
_080EEAA4: .4byte 0x02000000
_080EEAA8:
	bl sub_80F0F64
	ldr r1, _080EEAB8
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EEC7A
	.align 2, 0
_080EEAB8: .4byte 0x02000000
_080EEABC:
	bl sub_80F0FEC
	lsls r0, 24
	cmp r0, 0
	beq _080EEAC8
	b _080EEC9C
_080EEAC8:
	movs r0, 0x1
	bl sub_80F6FB8
	b _080EEC72
_080EEAD0:
	bl sub_80F6DB8
	ldr r1, _080EEAE0
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EEC7A
	.align 2, 0
_080EEAE0: .4byte 0x02000000
_080EEAE4:
	ldr r4, _080EEB04
	adds r0, r4, 0
	subs r0, 0x1A
	ldrh r1, [r0]
	adds r0, r4, 0
	bl sub_80F700C
	adds r0, r4, 0
	bl sub_80F42C4
	ldr r1, _080EEB08
	adds r4, r1
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080EEC9C
	.align 2, 0
_080EEB04: .4byte 0x02008788
_080EEB08: .4byte 0xffff7b7c
_080EEB0C:
	bl sub_80F0CD8
	ldr r1, _080EEB30
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EEB1E:
	bl sub_80F6E9C
	lsls r0, 24
	cmp r0, 0
	beq _080EEB2A
	b _080EEC9C
_080EEB2A:
	bl sub_80F0D5C
	b _080EEC6C
	.align 2, 0
_080EEB30: .4byte 0x02000000
_080EEB34:
	ldr r2, _080EEB64
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _080EEB6C
	ldr r1, _080EEB68
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080EEB6C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl sub_80F708C
	movs r5, 0xC1
	lsls r5, 2
	adds r1, r4, r5
	b _080EEB9C
	.align 2, 0
_080EEB64: .4byte gMain
_080EEB68: .4byte 0x000087dc
_080EEB6C:
	ldrh r1, [r3, 0x2C]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EEBAC
	ldr r1, _080EEBA4
	adds r0, r4, r1
	ldr r2, _080EEBA8
	adds r1, r4, r2
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r2, r0
	bge _080EEBAC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_80F708C
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r4, r0
_080EEB9C:
	movs r0, 0x10
	strh r0, [r1]
	b _080EEC9C
	.align 2, 0
_080EEBA4: .4byte 0x000087dc
_080EEBA8: .4byte 0x00008774
_080EEBAC:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080EEC9C
	movs r0, 0x5
	bl PlaySE
	bl sub_80F4394
	bl sub_80F0EC0
	ldr r1, _080EEBD0
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EEC7A
	.align 2, 0
_080EEBD0: .4byte 0x02000000
_080EEBD4:
	bl sub_80F6ED4
	lsls r0, 24
	cmp r0, 0
	bne _080EEC9C
	bl sub_80F0EF4
	lsls r0, 24
	cmp r0, 0
	bne _080EEC9C
	movs r0, 0
	bl sub_80F6FB8
	bl sub_80F2FB0
	b _080EEC72
_080EEBF4:
	bl sub_80F6134
	ldr r1, _080EEC04
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EEC7A
	.align 2, 0
_080EEC04: .4byte 0x02000000
_080EEC08:
	bl sub_80F0FA0
	ldr r1, _080EEC18
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EEC7A
	.align 2, 0
_080EEC18: .4byte 0x02000000
_080EEC1C:
	bl sub_80F0FEC
	b _080EEC6C
_080EEC22:
	bl sub_80F0C28
	ldr r1, _080EEC30
	movs r0, 0xC1
	lsls r0, 2
	adds r1, r0
	b _080EEC7A
	.align 2, 0
_080EEC30: .4byte 0x02000000
_080EEC34:
	bl sub_80F0C48
	lsls r0, 24
	cmp r0, 0
	bne _080EEC9C
	ldr r1, _080EEC48
	movs r2, 0xC1
	lsls r2, 2
	adds r1, r2
	b _080EEC7A
	.align 2, 0
_080EEC48: .4byte 0x02000000
_080EEC4C:
	movs r0, 0x9
	bl sub_80EEFBC
	movs r0, 0
	bl sub_80F3294
	ldr r0, _080EEC64
	bl sub_80EBDBC
	bl sub_80EED9C
	b _080EEC9C
	.align 2, 0
_080EEC64: .4byte sub_80EE58C
_080EEC68:
	bl sub_80F70FC
_080EEC6C:
	lsls r0, 24
	cmp r0, 0
	bne _080EEC9C
_080EEC72:
	ldr r1, _080EEC84
	movs r5, 0xC1
	lsls r5, 2
	adds r1, r5
_080EEC7A:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080EEC9C
	.align 2, 0
_080EEC84: .4byte 0x02000000
_080EEC88:
	bl sub_8055870
	cmp r0, 0
	bne _080EEC9C
	ldr r0, _080EECA4
	movs r1, 0xC1
	lsls r1, 2
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0]
_080EEC9C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EECA4: .4byte 0x02000000
	thumb_func_end sub_80EE658

	thumb_func_start sub_80EE8F4
sub_80EE8F4: @ 80EECA8
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080EECC4
	movs r1, 0xC1
	lsls r1, 2
	adds r4, r0, r1
	ldrh r2, [r4]
	cmp r2, 0x1
	beq _080EECE6
	cmp r2, 0x1
	bgt _080EECC8
	cmp r2, 0
	beq _080EECCE
	b _080EED12
	.align 2, 0
_080EECC4: .4byte 0x02000000
_080EECC8:
	cmp r2, 0x2
	beq _080EED0C
	b _080EED12
_080EECCE:
	movs r1, 0xC2
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080EED00
_080EECE6:
	ldr r0, _080EED08
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EED12
	bl sub_80F3130
	movs r0, 0x2
	bl sub_80F2D6C
	bl sub_80F6FFC
_080EED00:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080EED12
	.align 2, 0
_080EED08: .4byte gPaletteFade
_080EED0C:
	ldr r0, _080EED1C
	bl sub_80EBDBC
_080EED12:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EED1C: .4byte sub_80EC00C
	thumb_func_end sub_80EE8F4

	thumb_func_start sub_80EE96C
sub_80EE96C: @ 80EED20
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080EED50
	movs r1, 0xC1
	lsls r1, 2
	adds r5, r0, r1
	ldrh r4, [r5]
	cmp r4, 0
	bne _080EED54
	movs r0, 0x6F
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080EED68
	.align 2, 0
_080EED50: .4byte 0x02000000
_080EED54:
	ldr r0, _080EED70
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080EED68
	bl sub_80F5BDC
	bl sub_805469C
_080EED68:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EED70: .4byte gPaletteFade
	thumb_func_end sub_80EE96C

	thumb_func_start sub_80EE9C0
sub_80EE9C0: @ 80EED74
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	bl sub_80F1E84
	ldr r1, _080EEDB0
	ldr r2, _080EEDB4
	adds r0, r1, r2
	movs r2, 0
	strb r4, [r0]
	ldr r3, _080EEDB8
	adds r0, r1, r3
	strb r5, [r0]
	adds r3, 0x1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080EEDBC
	adds r1, r0
	strb r6, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EEDB0: .4byte 0x02000000
_080EEDB4: .4byte 0x00006e14
_080EEDB8: .4byte 0x00006e15
_080EEDBC: .4byte 0x00006e17
	thumb_func_end sub_80EE9C0

	thumb_func_start sub_80EEA0C
sub_80EEA0C: @ 80EEDC0
	push {r4,lr}
	ldr r1, _080EEDDC
	ldr r2, _080EEDE0
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x8
	bls _080EEDD2
	b _080EEFAE
_080EEDD2:
	lsls r0, 2
	ldr r1, _080EEDE4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EEDDC: .4byte 0x02000000
_080EEDE0: .4byte 0x00006e16
_080EEDE4: .4byte _080EEDE8
	.align 2, 0
_080EEDE8:
	.4byte _080EEE0C
	.4byte _080EEE4C
	.4byte _080EEE62
	.4byte _080EEE88
	.4byte _080EEEF2
	.4byte _080EEF1C
	.4byte _080EEF3C
	.4byte _080EEF60
	.4byte _080EEF98
_080EEE0C:
	bl sub_80F1F10
	lsls r0, 24
	cmp r0, 0
	beq _080EEE18
	b _080EEFBC
_080EEE18:
	ldr r1, _080EEE30
	ldr r4, _080EEE34
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0xC
	beq _080EEE3C
	ldr r0, _080EEE38
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	b _080EEFBC
	.align 2, 0
_080EEE30: .4byte 0x02000000
_080EEE34: .4byte 0x00006e17
_080EEE38: .4byte 0x00006e16
_080EEE3C:
	ldr r2, _080EEE48
	adds r1, r2
	movs r0, 0x3
	strb r0, [r1]
	b _080EEFBC
	.align 2, 0
_080EEE48: .4byte 0x00006e16
_080EEE4C:
	ldr r4, _080EEE7C
	ldr r1, _080EEE80
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F2C80
	ldr r2, _080EEE84
	adds r4, r2
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080EEE62:
	ldr r4, _080EEE7C
	ldr r1, _080EEE80
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	beq _080EEE76
	b _080EEFBC
_080EEE76:
	ldr r2, _080EEE84
	adds r1, r4, r2
	b _080EEF2A
	.align 2, 0
_080EEE7C: .4byte 0x02000000
_080EEE80: .4byte 0x00006e17
_080EEE84: .4byte 0x00006e16
_080EEE88:
	adds r2, r3, 0
	ldr r4, _080EEEAC
	adds r0, r2, r4
	ldrb r1, [r0]
	subs r4, 0x68
	adds r0, r2, r4
	strb r1, [r0]
	ldr r1, _080EEEB0
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _080EEEC8
	cmp r0, 0x1
	bgt _080EEEB4
	cmp r0, 0
	beq _080EEEBA
	b _080EEEDC
	.align 2, 0
_080EEEAC: .4byte 0x00006e15
_080EEEB0: .4byte 0x00006e14
_080EEEB4:
	cmp r0, 0x2
	beq _080EEED4
	b _080EEEDC
_080EEEBA:
	ldr r4, _080EEEC4
	adds r1, r2, r4
	movs r0, 0x5
	b _080EEEDA
	.align 2, 0
_080EEEC4: .4byte 0x00006dae
_080EEEC8:
	ldr r0, _080EEED0
	adds r1, r2, r0
	movs r0, 0x3
	b _080EEEDA
	.align 2, 0
_080EEED0: .4byte 0x00006dae
_080EEED4:
	ldr r2, _080EEF0C
	adds r1, r3, r2
	movs r0, 0x6
_080EEEDA:
	strb r0, [r1]
_080EEEDC:
	ldr r4, _080EEF10
	ldr r1, _080EEF14
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F1B8C
	ldr r2, _080EEF18
	adds r4, r2
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080EEEF2:
	ldr r4, _080EEF10
	ldr r1, _080EEF14
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	bne _080EEFBC
	ldr r2, _080EEF18
	adds r1, r4, r2
	b _080EEF2A
	.align 2, 0
_080EEF0C: .4byte 0x00006dae
_080EEF10: .4byte 0x02000000
_080EEF14: .4byte 0x00006e14
_080EEF18: .4byte 0x00006e16
_080EEF1C:
	bl sub_8055870
	cmp r0, 0
	bne _080EEFBC
	ldr r1, _080EEF34
	ldr r4, _080EEF38
	adds r1, r4
_080EEF2A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080EEFBC
	.align 2, 0
_080EEF34: .4byte 0x02000000
_080EEF38: .4byte 0x00006e16
_080EEF3C:
	bl sub_80F1DF0
	ldr r4, _080EEF54
	ldr r1, _080EEF58
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80EF490
	ldr r2, _080EEF5C
	adds r4, r2
	b _080EEF80
	.align 2, 0
_080EEF54: .4byte 0x02000000
_080EEF58: .4byte 0x00006e14
_080EEF5C: .4byte 0x00006e16
_080EEF60:
	bl sub_80F1E50
	lsls r0, 24
	cmp r0, 0
	bne _080EEFBC
	ldr r4, _080EEF88
	ldr r1, _080EEF8C
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080EEF90
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80EF428
	ldr r0, _080EEF94
	adds r4, r0
_080EEF80:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080EEFBC
	.align 2, 0
_080EEF88: .4byte 0x02000000
_080EEF8C: .4byte 0x00006e14
_080EEF90: .4byte 0x00006dad
_080EEF94: .4byte 0x00006e16
_080EEF98:
	bl sub_80EF4F8
	lsls r0, 24
	cmp r0, 0
	bne _080EEFBC
	ldr r1, _080EEFB4
	ldr r2, _080EEFB8
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080EEFAE:
	movs r0, 0
	b _080EEFBE
	.align 2, 0
_080EEFB4: .4byte 0x02000000
_080EEFB8: .4byte 0x00006e16
_080EEFBC:
	movs r0, 0x1
_080EEFBE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EEA0C

	thumb_func_start sub_80EEC10
sub_80EEC10: @ 80EEFC4
	push {r4,lr}
	ldr r0, _080EEFFC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080EF004
	ldr r1, _080EF000
	adds r3, r1, 0x1
	adds r2, r1, 0x5
_080EEFD8:
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080EEFEA
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r1]
_080EEFEA:
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EEFD8
	movs r0, 0x1
	b _080EF03E
	.align 2, 0
_080EEFFC: .4byte gMain
_080EF000: .4byte 0x02006dad
_080EF004:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EF03C
	ldr r1, _080EF038
	movs r4, 0
	movs r2, 0x1
	ldrsb r2, [r1, r2]
	adds r3, r1, 0x5
_080EF016:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r2
	blt _080EF026
	strb r4, [r1]
_080EF026:
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EF016
	movs r0, 0x1
	b _080EF03E
	.align 2, 0
_080EF038: .4byte 0x02006dad
_080EF03C:
	movs r0, 0
_080EF03E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EEC10

	thumb_func_start sub_80EEC90
sub_80EEC90: @ 80EF044
	push {r4,lr}
	ldr r0, _080EF074
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080EF084
	ldr r2, _080EF078
	ldr r0, _080EF07C
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080EF0AC
	ldr r3, _080EF080
	adds r0, r2, r3
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r1]
	b _080EF0AC
	.align 2, 0
_080EF074: .4byte gMain
_080EF078: .4byte 0x02000000
_080EF07C: .4byte 0x00006dad
_080EF080: .4byte 0x00006dae
_080EF084:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080EF0B8
	ldr r0, _080EF0B0
	ldr r4, _080EF0B4
	adds r2, r0, r4
	ldrb r1, [r2]
	adds r1, 0x1
	strb r1, [r2]
	adds r4, 0x1
	adds r0, r4
	lsls r1, 24
	asrs r1, 24
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	blt _080EF0AC
	strb r3, [r2]
_080EF0AC:
	movs r0, 0x1
	b _080EF0BA
	.align 2, 0
_080EF0B0: .4byte 0x02000000
_080EF0B4: .4byte 0x00006dad
_080EF0B8:
	movs r0, 0
_080EF0BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EEC90

	thumb_func_start sub_80EED0C
sub_80EED0C: @ 80EF0C0
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	thumb_func_end sub_80EED0C

	thumb_func_start sub_80EED1C
sub_80EED1C: @ 80EF0D0
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x92
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	thumb_func_end sub_80EED1C

	thumb_func_start sub_80EED2C
sub_80EED2C: @ 80EF0E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080EF14C
	lsls r0, 2
	ldr r1, _080EF0F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF0F4: .4byte _080EF0F8
	.align 2, 0
_080EF0F8:
	.4byte _080EF110
	.4byte _080EF11A
	.4byte _080EF132
	.4byte _080EF128
	.4byte _080EF128
	.4byte _080EF140
_080EF110:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	b _080EF148
_080EF11A:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080EF124
	b _080EF148
	.align 2, 0
_080EF124: .4byte 0x00001741
_080EF128:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	b _080EF148
_080EF132:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080EF13C
	b _080EF148
	.align 2, 0
_080EF13C: .4byte 0x00007b40
_080EF140:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFD
	lsls r2, 6
_080EF148:
	adds r0, r2, 0
	strh r0, [r1]
_080EF14C:
	pop {r0}
	bx r0
	thumb_func_end sub_80EED2C

	thumb_func_start sub_80EED9C
sub_80EED9C: @ 80EF150
	push {lr}
	ldr r2, _080EF16C
	ldr r0, _080EF170
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	ldr r1, _080EF174
	str r1, [r0]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080EF16C: .4byte gUnknown_03000744
_080EF170: .4byte 0x02000000
_080EF174: .4byte sub_80EEDC4
	thumb_func_end sub_80EED9C

	thumb_func_start sub_80EEDC4
sub_80EEDC4: @ 80EF178
	push {lr}
	bl sub_8055870
	cmp r0, 0x1
	beq _080EF190
	ldr r0, _080EF194
	movs r1, 0xC0
	lsls r1, 2
	adds r0, r1
	ldr r1, _080EF198
	ldr r1, [r1]
	str r1, [r0]
_080EF190:
	pop {r0}
	bx r0
	.align 2, 0
_080EF194: .4byte 0x02000000
_080EF198: .4byte gUnknown_03000744
	thumb_func_end sub_80EEDC4

	thumb_func_start sub_80EEDE8
sub_80EEDE8: @ 80EF19C
	ldr r0, _080EF1B8
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080EF1B8: .4byte 0x04000010
	thumb_func_end sub_80EEDE8

	thumb_func_start sub_80EEE08
sub_80EEE08: @ 80EF1BC
	ldr r0, _080EF1CC
	ldr r0, [r0]
	ldr r1, _080EF1D0
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080EF1CC: .4byte gUnknown_083DFEC4
_080EF1D0: .4byte 0x0000d160
	thumb_func_end sub_80EEE08

	thumb_func_start sub_80EEE20
sub_80EEE20: @ 80EF1D4
	push {lr}
	ldr r0, _080EF1FC
	ldr r0, [r0]
	ldr r1, _080EF200
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EF204
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EF1F6
_080EF1EC:
	bl sub_80EEE54
	lsls r0, 24
	cmp r0, 0
	bne _080EF1EC
_080EF1F6:
	pop {r0}
	bx r0
	.align 2, 0
_080EF1FC: .4byte gUnknown_083DFEC4
_080EF200: .4byte 0x0000d160
_080EF204: .4byte 0x00006dac
	thumb_func_end sub_80EEE20

	thumb_func_start sub_80EEE54
sub_80EEE54: @ 80EF208
	push {lr}
	ldr r1, _080EF224
	ldr r0, [r1]
	ldr r2, _080EF228
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _080EF2B6
	lsls r0, 2
	ldr r1, _080EF22C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF224: .4byte gUnknown_083DFEC4
_080EF228: .4byte 0x0000d160
_080EF22C: .4byte _080EF230
	.align 2, 0
_080EF230:
	.4byte _080EF244
	.4byte _080EF258
	.4byte _080EF26C
	.4byte _080EF27C
	.4byte _080EF290
_080EF244:
	ldr r0, _080EF250
	ldr r1, _080EF254
	bl LZ77UnCompVram
	b _080EF2CC
	.align 2, 0
_080EF250: .4byte gPokenavHoennMapMisc_Gfx
_080EF254: .4byte 0x0600c000
_080EF258:
	ldr r0, _080EF264
	ldr r1, _080EF268
	bl LZ77UnCompVram
	b _080EF2CC
	.align 2, 0
_080EF264: .4byte gUnknown_08E99FB0
_080EF268: .4byte 0x0600d800
_080EF26C:
	ldr r0, _080EF278
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	b _080EF2CC
	.align 2, 0
_080EF278: .4byte gPokenavHoennMap1_Pal
_080EF27C:
	movs r0, 0
	bl sub_80EF58C
	movs r0, 0x1
	bl sub_80EF58C
	movs r0, 0x2
	bl sub_80EF58C
	b _080EF2CC
_080EF290:
	ldr r2, [r2]
	movs r3, 0xC3
	lsls r3, 2
	adds r0, r2, r3
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080EF2BC
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080EF2C0
	ldr r3, _080EF2C4
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080EF2C8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_080EF2B6:
	movs r0, 0
	b _080EF2DC
	.align 2, 0
_080EF2BC: .4byte 0x04000014
_080EF2C0: .4byte 0x0400000a
_080EF2C4: .4byte 0x00001b0c
_080EF2C8: .4byte 0x0000d160
_080EF2CC:
	ldr r0, _080EF2E0
	ldr r1, [r0]
	ldr r2, _080EF2E4
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080EF2DC:
	pop {r1}
	bx r1
	.align 2, 0
_080EF2E0: .4byte gUnknown_083DFEC4
_080EF2E4: .4byte 0x0000d160
	thumb_func_end sub_80EEE54

	thumb_func_start sub_80EEF34
sub_80EEF34: @ 80EF2E8
	push {r4,lr}
	movs r3, 0x1
	ldr r0, _080EF304
	ldr r0, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0x20
	bne _080EF308
	movs r0, 0
	b _080EF322
	.align 2, 0
_080EF304: .4byte gUnknown_083DFEC4
_080EF308:
	adds r0, r1, 0x2
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	ble _080EF31A
	movs r0, 0x20
	strh r0, [r2]
	movs r3, 0
_080EF31A:
	ldr r1, _080EF328
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r3, 0
_080EF322:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EF328: .4byte 0x04000016
	thumb_func_end sub_80EEF34

	thumb_func_start sub_80EEF78
sub_80EEF78: @ 80EF32C
	push {r4,lr}
	movs r3, 0x1
	ldr r0, _080EF348
	ldr r0, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0
	bne _080EF34C
	movs r0, 0
	b _080EF364
	.align 2, 0
_080EF348: .4byte gUnknown_083DFEC4
_080EF34C:
	subs r0, r1, 0x2
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bgt _080EF35C
	movs r0, 0
	strh r0, [r2]
	movs r3, 0
_080EF35C:
	ldr r1, _080EF36C
	ldrh r0, [r2]
	strh r0, [r1]
	adds r0, r3, 0
_080EF364:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EF36C: .4byte 0x04000016
	thumb_func_end sub_80EEF78

	thumb_func_start sub_80EEFBC
sub_80EEFBC: @ 80EF370
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EF3A8
	ldr r3, _080EF3AC
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x11
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0
	movs r2, 0x16
	bl sub_809D104
	cmp r4, 0xB
	bls _080EF39C
	b _080EF5E8
_080EF39C:
	lsls r0, r4, 2
	ldr r1, _080EF3B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF3A8: .4byte 0x0600d800
_080EF3AC: .4byte gUnknown_08E9A100
_080EF3B0: .4byte _080EF3B4
	.align 2, 0
_080EF3B4:
	.4byte _080EF3E4
	.4byte _080EF5E8
	.4byte _080EF440
	.4byte _080EF4B4
	.4byte _080EF4F0
	.4byte _080EF588
	.4byte _080EF5E8
	.4byte _080EF52C
	.4byte _080EF544
	.4byte _080EF588
	.4byte _080EF5CC
	.4byte _080EF420
_080EF3E4:
	ldr r6, _080EF418
	ldr r0, _080EF41C
	mov r8, r0
	movs r0, 0x11
	str r0, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	movs r5, 0x2
	str r5, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	str r4, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r5, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0xA
	b _080EF5B8
	.align 2, 0
_080EF418: .4byte 0x0600d800
_080EF41C: .4byte gUnknown_08E9A100
_080EF420:
	ldr r0, _080EF438
	ldr r3, _080EF43C
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0x7
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x8
	b _080EF4A2
	.align 2, 0
_080EF438: .4byte 0x0600d800
_080EF43C: .4byte gUnknown_08E9A100
_080EF440:
	ldr r0, _080EF47C
	ldr r0, [r0]
	ldr r1, _080EF480
	adds r0, r1
	ldrb r7, [r0]
	cmp r7, 0
	bne _080EF48C
	ldr r5, _080EF484
	ldr r6, _080EF488
	movs r0, 0xA
	str r0, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	str r7, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0xA
	b _080EF576
	.align 2, 0
_080EF47C: .4byte gUnknown_083DFEC4
_080EF480: .4byte 0x00006dac
_080EF484: .4byte 0x0600d800
_080EF488: .4byte gUnknown_08E9A100
_080EF48C:
	ldr r0, _080EF4AC
	ldr r3, _080EF4B0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0x7
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0xA
_080EF4A2:
	movs r2, 0x16
	bl sub_809D104
	b _080EF5E8
	.align 2, 0
_080EF4AC: .4byte 0x0600d800
_080EF4B0: .4byte gUnknown_08E9A100
_080EF4B4:
	ldr r6, _080EF4E8
	ldr r0, _080EF4EC
	mov r8, r0
	movs r5, 0
	str r5, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	movs r4, 0x2
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	str r5, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0xA
	b _080EF5B8
	.align 2, 0
_080EF4E8: .4byte 0x0600d800
_080EF4EC: .4byte gUnknown_08E9A100
_080EF4F0:
	ldr r5, _080EF524
	ldr r6, _080EF528
	movs r0, 0x14
	str r0, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	movs r0, 0
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0xA
	b _080EF576
	.align 2, 0
_080EF524: .4byte 0x0600d800
_080EF528: .4byte gUnknown_08E9A100
_080EF52C:
	ldr r5, _080EF53C
	ldr r6, _080EF540
	movs r1, 0xA
	str r1, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	str r1, [sp, 0x8]
	b _080EF554
	.align 2, 0
_080EF53C: .4byte 0x0600d800
_080EF540: .4byte gUnknown_08E9A100
_080EF544:
	ldr r5, _080EF580
	ldr r6, _080EF584
	movs r0, 0x14
	str r0, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
_080EF554:
	movs r4, 0x2
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	movs r0, 0
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x7
_080EF576:
	movs r2, 0x16
	adds r3, r6, 0
	bl sub_809D104
	b _080EF5E8
	.align 2, 0
_080EF580: .4byte 0x0600d800
_080EF584: .4byte gUnknown_08E9A100
_080EF588:
	ldr r6, _080EF5C4
	ldr r1, _080EF5C8
	mov r8, r1
	movs r5, 0
	str r5, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r0, 0xA
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	str r5, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0x8
_080EF5B8:
	movs r2, 0x16
	mov r3, r8
	bl sub_809D104
	b _080EF5E8
	.align 2, 0
_080EF5C4: .4byte 0x0600d800
_080EF5C8: .4byte gUnknown_08E9A100
_080EF5CC:
	ldr r0, _080EF5F4
	ldr r3, _080EF5F8
	movs r1, 0
	str r1, [sp]
	movs r1, 0x6
	str r1, [sp, 0x4]
	movs r1, 0x7
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x8
	movs r2, 0x16
	bl sub_809D104
_080EF5E8:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF5F4: .4byte 0x0600d800
_080EF5F8: .4byte gUnknown_08E9A100
	thumb_func_end sub_80EEFBC

	thumb_func_start sub_80EF248
sub_80EF248: @ 80EF5FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080EF62C
	ldr r0, [r0]
	ldr r1, _080EF630
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EF634
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EF624
_080EF618:
	adds r0, r4, 0
	bl sub_80EF284
	lsls r0, 24
	cmp r0, 0
	bne _080EF618
_080EF624:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF62C: .4byte gUnknown_083DFEC4
_080EF630: .4byte 0x0000d160
_080EF634: .4byte 0x00006dac
	thumb_func_end sub_80EF248

	thumb_func_start sub_80EF284
sub_80EF284: @ 80EF638
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080EF65C
	ldr r0, [r1]
	ldr r3, _080EF660
	adds r0, r3
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080EF650
	b _080EF7AA
_080EF650:
	lsls r0, 2
	ldr r1, _080EF664
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EF65C: .4byte gUnknown_083DFEC4
_080EF660: .4byte 0x0000d160
_080EF664: .4byte _080EF668
	.align 2, 0
_080EF668:
	.4byte _080EF698
	.4byte _080EF69E
	.4byte _080EF6AC
	.4byte _080EF6B8
	.4byte _080EF6C4
	.4byte _080EF6E4
	.4byte _080EF6F8
	.4byte _080EF71C
	.4byte _080EF730
	.4byte _080EF744
	.4byte _080EF758
	.4byte _080EF780
_080EF698:
	bl sub_80EEDE8
	b _080EF7C0
_080EF69E:
	ldr r0, _080EF6A8
	bl SetUpWindowConfig
	b _080EF7C0
	.align 2, 0
_080EF6A8: .4byte gWindowConfig_81E7224
_080EF6AC:
	ldr r0, _080EF6B4
	bl MultistepInitMenuWindowBegin
	b _080EF7C0
	.align 2, 0
_080EF6B4: .4byte gWindowConfig_81E7224
_080EF6B8:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080EF6C2
	b _080EF7C0
_080EF6C2:
	b _080EF7CE
_080EF6C4:
	ldr r1, _080EF6D4
	ldr r2, _080EF6D8
	ldr r0, _080EF6DC
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080EF6E0
	b _080EF704
	.align 2, 0
_080EF6D4: .4byte gUnknown_083DFEEC
_080EF6D8: .4byte 0x06005000
_080EF6DC: .4byte 0x040000d4
_080EF6E0: .4byte 0x80000050
_080EF6E4:
	ldr r0, _080EF6F0
	ldr r1, _080EF6F4
	bl LZ77UnCompVram
	b _080EF7C0
	.align 2, 0
_080EF6F0: .4byte gUnknown_083DFF8C
_080EF6F4: .4byte 0x0600f800
_080EF6F8:
	ldr r1, _080EF70C
	ldr r2, _080EF710
	ldr r0, _080EF714
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080EF718
_080EF704:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080EF7C0
	.align 2, 0
_080EF70C: .4byte gUnknown_083E005C
_080EF710: .4byte 0x06008000
_080EF714: .4byte 0x040000d4
_080EF718: .4byte 0x80000010
_080EF71C:
	ldr r0, _080EF728
	ldr r1, _080EF72C
	bl LZ77UnCompVram
	b _080EF7C0
	.align 2, 0
_080EF728: .4byte gUnknown_083E007C
_080EF72C: .4byte 0x0600e000
_080EF730:
	ldr r0, _080EF73C
	ldr r1, _080EF740
	bl LZ77UnCompVram
	b _080EF7C0
	.align 2, 0
_080EF73C: .4byte gPokenavOutlineTilemap
_080EF740: .4byte 0x0600e800
_080EF744:
	ldr r0, _080EF750
	ldr r1, _080EF754
	bl LZ77UnCompVram
	b _080EF7C0
	.align 2, 0
_080EF750: .4byte gPokenavOutlineTiles
_080EF754: .4byte 0x06008020
_080EF758:
	adds r0, r2, 0
	bl sub_80EF54C
	ldr r0, _080EF778
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080EF77C
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	bl sub_80EF7D4
	b _080EF7C0
	.align 2, 0
_080EF778: .4byte gUnknown_083DFECC
_080EF77C: .4byte gPokenavOutlinePalette
_080EF780:
	ldr r1, _080EF7B0
	ldr r2, _080EF7B4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080EF7B8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x42
	movs r0, 0
	strh r0, [r1]
	ldr r1, [r3]
	ldr r3, _080EF7BC
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EF7AA:
	movs r0, 0
	b _080EF7D0
	.align 2, 0
_080EF7B0: .4byte 0x04000008
_080EF7B4: .4byte 0x00001f01
_080EF7B8: .4byte 0x00001d0a
_080EF7BC: .4byte 0x0000d160
_080EF7C0:
	ldr r0, _080EF7D4
	ldr r1, [r0]
	ldr r0, _080EF7D8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EF7CE:
	movs r0, 0x1
_080EF7D0:
	pop {r1}
	bx r1
	.align 2, 0
_080EF7D4: .4byte gUnknown_083DFEC4
_080EF7D8: .4byte 0x0000d160
	thumb_func_end sub_80EF284

	thumb_func_start sub_80EF428
sub_80EF428: @ 80EF7DC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r1, 0
	cmp r0, 0x1
	beq _080EF808
	cmp r0, 0x1
	bgt _080EF7F8
	cmp r0, 0
	beq _080EF7FE
	b _080EF818
_080EF7F8:
	cmp r3, 0x2
	beq _080EF810
	b _080EF818
_080EF7FE:
	ldr r1, _080EF804
	b _080EF812
	.align 2, 0
_080EF804: .4byte gUnknown_083E31B0
_080EF808:
	ldr r1, _080EF80C
	b _080EF812
	.align 2, 0
_080EF80C: .4byte gUnknown_083E31CC
_080EF810:
	ldr r1, _080EF83C
_080EF812:
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, [r0]
_080EF818:
	ldr r0, _080EF840
	ldr r4, [r0]
	movs r0, 0x80
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r2, 0xC0
	movs r3, 0x2
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0x11
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF83C: .4byte gUnknown_083E31D8
_080EF840: .4byte gUnknown_083DFEC8
	thumb_func_end sub_80EF428

	thumb_func_start sub_80EF490
sub_80EF490: @ 80EF844
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _080EF850
	movs r2, 0x1
_080EF850:
	ldr r0, _080EF878
	ldr r3, [r0]
	lsls r1, r2, 4
	subs r1, r2
	lsls r2, r1, 1
	ldr r4, _080EF87C
	adds r0, r3, r4
	strh r2, [r0]
	ldr r2, _080EF880
	adds r0, r3, r2
	ldrh r2, [r0]
	lsls r1, 17
	lsrs r0, r1, 16
	cmp r2, r0
	bcs _080EF884
	adds r4, 0x2
	adds r1, r3, r4
	movs r0, 0x2
	b _080EF89E
	.align 2, 0
_080EF878: .4byte gUnknown_083DFEC4
_080EF87C: .4byte 0x0000ce4e
_080EF880: .4byte 0x0000ce4c
_080EF884:
	cmp r2, r0
	bls _080EF898
	ldr r0, _080EF890
	adds r1, r3, r0
	ldr r0, _080EF894
	b _080EF89E
	.align 2, 0
_080EF890: .4byte 0x0000ce50
_080EF894: .4byte 0x0000fffe
_080EF898:
	ldr r2, _080EF8A8
	adds r1, r3, r2
	movs r0, 0
_080EF89E:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EF8A8: .4byte 0x0000ce50
	thumb_func_end sub_80EF490

	thumb_func_start sub_80EF4F8
sub_80EF4F8: @ 80EF8AC
	push {r4,lr}
	ldr r0, _080EF8E4
	ldr r1, [r0]
	ldr r0, _080EF8E8
	adds r2, r1, r0
	ldr r3, _080EF8EC
	adds r0, r1, r3
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r3, r0
	beq _080EF8F8
	ldr r4, _080EF8F0
	adds r0, r1, r4
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	ldr r3, _080EF8F4
	adds r0, r1, r3
	ldrh r1, [r2]
	lsls r1, 1
	adds r0, r1
	movs r1, 0x31
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0x1
	b _080EF8FA
	.align 2, 0
_080EF8E4: .4byte gUnknown_083DFEC4
_080EF8E8: .4byte 0x0000ce4c
_080EF8EC: .4byte 0x0000ce4e
_080EF8F0: .4byte 0x0000ce50
_080EF8F4: .4byte 0x0000ce52
_080EF8F8:
	movs r0, 0
_080EF8FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80EF4F8

	thumb_func_start sub_80EF54C
sub_80EF54C: @ 80EF900
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _080EF90C
	movs r2, 0x1
_080EF90C:
	ldr r0, _080EF934
	ldr r0, [r0]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 1
	ldr r3, _080EF938
	adds r2, r0, r3
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r1, 1
	ldr r2, _080EF93C
	adds r1, r2
	adds r0, r1
	movs r1, 0x31
	movs r2, 0x4
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080EF934: .4byte gUnknown_083DFEC4
_080EF938: .4byte 0x0000ce4c
_080EF93C: .4byte 0x0000ce52
	thumb_func_end sub_80EF54C

	thumb_func_start sub_80EF58C
sub_80EF58C: @ 80EF940
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080EF984
	cmp r0, 0x1
	bgt _080EF958
	cmp r0, 0
	beq _080EF95E
	b _080EF9C4
_080EF958:
	cmp r1, 0x2
	beq _080EF9AC
	b _080EF9C4
_080EF95E:
	movs r1, 0
	ldr r0, _080EF97C
	ldr r0, [r0]
	ldr r3, _080EF980
	adds r2, r0, r3
	movs r3, 0
_080EF96A:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3D
	bls _080EF96A
	b _080EF9C4
	.align 2, 0
_080EF97C: .4byte gUnknown_083DFEC4
_080EF980: .4byte 0x0000ce52
_080EF984:
	ldr r0, _080EF9A0
	ldr r0, [r0]
	ldr r1, _080EF9A4
	adds r2, r0, r1
	ldr r1, _080EF9A8
	adds r0, r1, 0x2
	adds r1, 0x6
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0x2
	bl sub_80EF624
	b _080EF9C4
	.align 2, 0
_080EF9A0: .4byte gUnknown_083DFEC4
_080EF9A4: .4byte 0x0000ce52
_080EF9A8: .4byte gUnknown_083E003C
_080EF9AC:
	ldr r0, _080EF9CC
	ldr r0, [r0]
	ldr r3, _080EF9D0
	adds r2, r0, r3
	ldr r1, _080EF9D4
	adds r0, r1, 0x6
	adds r1, 0xE
	str r2, [sp]
	movs r2, 0x10
	movs r3, 0x2
	bl sub_80EF624
_080EF9C4:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080EF9CC: .4byte gUnknown_083DFEC4
_080EF9D0: .4byte 0x0000ce8e
_080EF9D4: .4byte gUnknown_083E003C
	thumb_func_end sub_80EF58C

	thumb_func_start sub_80EF624
sub_80EF624: @ 80EF9D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r4, [sp, 0x58]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x8]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	movs r0, 0
	str r0, [sp, 0x10]
	lsls r0, r3, 16
	ldr r1, [sp, 0x10]
	cmp r1, r3
	bcs _080EFAE2
	subs r2, 0x1
	str r2, [sp, 0x20]
	str r0, [sp, 0x2C]
_080EFA08:
	ldr r2, [sp]
	ldrh r1, [r2]
	movs r0, 0x1F
	ands r0, r1
	lsls r7, r0, 8
	lsls r1, 16
	lsrs r0, r1, 21
	movs r2, 0x1F
	ands r0, r2
	lsls r6, r0, 8
	lsrs r1, 26
	ands r1, r2
	lsls r5, r1, 8
	ldr r0, [sp, 0x4]
	ldrh r1, [r0]
	movs r0, 0x1F
	ands r0, r1
	lsls r0, 8
	str r0, [sp, 0x14]
	lsls r1, 16
	lsrs r0, r1, 21
	ands r0, r2
	lsls r0, 8
	str r0, [sp, 0x18]
	lsrs r1, 26
	ands r1, r2
	lsls r1, 8
	str r1, [sp, 0x1C]
	ldr r1, [sp, 0x14]
	subs r0, r1, r7
	ldr r1, [sp, 0x8]
	bl __divsi3
	mov r10, r0
	ldr r2, [sp, 0x18]
	subs r0, r2, r6
	ldr r1, [sp, 0x8]
	bl __divsi3
	mov r9, r0
	ldr r1, [sp, 0x1C]
	subs r0, r1, r5
	ldr r1, [sp, 0x8]
	bl __divsi3
	mov r8, r0
	adds r3, r4, 0
	movs r4, 0
	ldr r2, [sp]
	adds r2, 0x2
	str r2, [sp, 0x30]
	ldr r0, [sp, 0x4]
	adds r0, 0x2
	str r0, [sp, 0x34]
	adds r1, r3, 0x2
	str r1, [sp, 0x24]
	ldr r2, [sp, 0x10]
	adds r2, 0x1
	str r2, [sp, 0x28]
	ldr r0, [sp, 0x20]
	cmp r4, r0
	bge _080EFAB4
	ldr r1, [sp, 0xC]
	lsls r1, 1
	mov r12, r1
_080EFA8A:
	lsls r0, r7, 8
	lsrs r2, r0, 16
	lsls r0, r6, 8
	lsrs r1, r0, 16
	lsls r0, r5, 8
	lsrs r0, 16
	lsls r0, 10
	lsls r1, 5
	orrs r0, r1
	orrs r2, r0
	strh r2, [r3]
	add r3, r12
	add r7, r10
	add r6, r9
	add r5, r8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r2, [sp, 0x20]
	cmp r4, r2
	blt _080EFA8A
_080EFAB4:
	ldr r4, [sp, 0x14]
	lsrs r2, r4, 8
	ldr r1, [sp, 0x1C]
	lsls r0, r1, 2
	ldr r4, [sp, 0x18]
	lsrs r1, r4, 3
	orrs r0, r1
	orrs r2, r0
	strh r2, [r3]
	ldr r0, [sp, 0x30]
	str r0, [sp]
	ldr r1, [sp, 0x34]
	str r1, [sp, 0x4]
	ldr r4, [sp, 0x24]
	ldr r2, [sp, 0x28]
	lsls r0, r2, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x2C]
	lsrs r0, r1, 16
	ldr r2, [sp, 0x10]
	cmp r2, r0
	bcc _080EFA08
_080EFAE2:
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EF624

	thumb_func_start sub_80EF740
sub_80EF740: @ 80EFAF4
	push {lr}
	ldr r0, _080EFB24
	ldr r3, [r0]
	ldr r0, _080EFB28
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2]
	cmp r0, 0
	beq _080EFB16
	ldr r2, _080EFB2C
	adds r1, r3, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EFB16:
	ldr r0, _080EFB30
	ldr r2, _080EFB2C
	adds r1, r3, r2
	ldrh r1, [r1]
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080EFB24: .4byte gUnknown_083DFEC4
_080EFB28: .4byte 0x00006da0
_080EFB2C: .4byte 0x00006da2
_080EFB30: .4byte 0x0400001c
	thumb_func_end sub_80EF740

	thumb_func_start sub_80EF780
sub_80EF780: @ 80EFB34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080EFB64
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080EFB5E
	ldr r0, _080EFB68
	ldr r3, [r0]
	ldr r0, _080EFB6C
	adds r2, r3, r0
	ldrh r0, [r2]
	movs r1, 0x7
	ands r1, r0
	cmp r1, 0
	beq _080EFB70
_080EFB5E:
	bl sub_80EF740
	b _080EFB7C
	.align 2, 0
_080EFB64: .4byte gTasks
_080EFB68: .4byte gUnknown_083DFEC4
_080EFB6C: .4byte 0x00006da2
_080EFB70:
	strh r1, [r2]
	ldr r2, _080EFB80
	adds r0, r3, r2
	strh r1, [r0]
	ldr r0, _080EFB84
	strh r1, [r0]
_080EFB7C:
	pop {r0}
	bx r0
	.align 2, 0
_080EFB80: .4byte 0x00006da0
_080EFB84: .4byte 0x0400001c
	thumb_func_end sub_80EF780

	thumb_func_start sub_80EF7D4
sub_80EF7D4: @ 80EFB88
	push {r4,lr}
	ldr r0, _080EFBB4
	ldr r4, [r0]
	ldr r1, _080EFBB8
	adds r0, r4, r1
	movs r1, 0
	strh r1, [r0]
	ldr r2, _080EFBBC
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _080EFBC0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080EFBC4
	adds r4, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EFBB4: .4byte gUnknown_083DFEC4
_080EFBB8: .4byte 0x00006da2
_080EFBBC: .4byte 0x00006da0
_080EFBC0: .4byte sub_80EF780
_080EFBC4: .4byte 0x00006da4
	thumb_func_end sub_80EF7D4

	thumb_func_start sub_80EF814
sub_80EF814: @ 80EFBC8
	push {lr}
	ldr r0, _080EFBE8
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _080EFBE4
	ldr r0, _080EFBEC
	ldr r0, [r0]
	ldr r1, _080EFBF0
	adds r0, r1
	ldrb r0, [r0]
	bl DestroyTask
_080EFBE4:
	pop {r0}
	bx r0
	.align 2, 0
_080EFBE8: .4byte sub_80EF780
_080EFBEC: .4byte gUnknown_083DFEC4
_080EFBF0: .4byte 0x00006da4
	thumb_func_end sub_80EF814

	thumb_func_start sub_80EF840
sub_80EF840: @ 80EFBF4
	push {lr}
	ldr r0, _080EFC1C
	ldr r0, [r0]
	ldr r1, _080EFC20
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080EFC24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EFC16
_080EFC0C:
	bl sub_80EF874
	lsls r0, 24
	cmp r0, 0
	bne _080EFC0C
_080EFC16:
	pop {r0}
	bx r0
	.align 2, 0
_080EFC1C: .4byte gUnknown_083DFEC4
_080EFC20: .4byte 0x0000d160
_080EFC24: .4byte 0x00006dac
	thumb_func_end sub_80EF840

	thumb_func_start sub_80EF874
sub_80EF874: @ 80EFC28
	push {lr}
	ldr r0, _080EFC44
	ldr r0, [r0]
	ldr r1, _080EFC48
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xB
	bls _080EFC3A
	b _080EFD8C
_080EFC3A:
	lsls r0, 2
	ldr r1, _080EFC4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EFC44: .4byte gUnknown_083DFEC4
_080EFC48: .4byte 0x0000d160
_080EFC4C: .4byte _080EFC50
	.align 2, 0
_080EFC50:
	.4byte _080EFC80
	.4byte _080EFC86
	.4byte _080EFC94
	.4byte _080EFCA0
	.4byte _080EFCAA
	.4byte _080EFCB0
	.4byte _080EFCD4
	.4byte _080EFCE0
	.4byte _080EFCF4
	.4byte _080EFD08
	.4byte _080EFD14
	.4byte _080EFD26
_080EFC80:
	bl sub_80EEDE8
	b _080EFD90
_080EFC86:
	ldr r0, _080EFC90
	bl SetUpWindowConfig
	b _080EFD90
	.align 2, 0
_080EFC90: .4byte gWindowConfig_81E7224
_080EFC94:
	ldr r0, _080EFC9C
	bl MultistepInitMenuWindowBegin
	b _080EFD90
	.align 2, 0
_080EFC9C: .4byte gWindowConfig_81E7224
_080EFCA0:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _080EFD90
	b _080EFD9E
_080EFCAA:
	bl MenuZeroFillScreen
	b _080EFD90
_080EFCB0:
	ldr r0, _080EFCC8
	ldr r0, [r0]
	ldr r2, _080EFCCC
	adds r0, r2
	ldr r1, _080EFCD0
	ldrb r1, [r1, 0x15]
	lsrs r1, 3
	movs r2, 0x1
	ands r1, r2
	bl sub_80FA904
	b _080EFD90
	.align 2, 0
_080EFCC8: .4byte gUnknown_083DFEC4
_080EFCCC: .4byte 0x00006e18
_080EFCD0: .4byte gSaveBlock2
_080EFCD4:
	bl sub_80FA940
	lsls r0, 24
	cmp r0, 0
	beq _080EFD90
	b _080EFD9E
_080EFCE0:
	ldr r0, _080EFCEC
	ldr r1, _080EFCF0
	bl LZ77UnCompVram
	b _080EFD90
	.align 2, 0
_080EFCEC: .4byte gPokenavHoennMapSquares_Gfx
_080EFCF0: .4byte 0x06005000
_080EFCF4:
	ldr r0, _080EFD04
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	bl sub_80EFC3C
	b _080EFD90
	.align 2, 0
_080EFD04: .4byte gPokenavHoennMapSquares_Pal
_080EFD08:
	bl sub_80EFC64
	lsls r0, 24
	cmp r0, 0
	beq _080EFD90
	b _080EFD9E
_080EFD14:
	movs r0, 0xD
	movs r1, 0x3
	movs r2, 0x1D
	movs r3, 0x11
	bl MenuDrawTextWindow
	bl sub_80EF9F8
	b _080EFD90
_080EFD26:
	ldr r0, _080EFD44
	ldr r1, [r0]
	ldr r2, _080EFD48
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EFD54
	ldr r2, _080EFD4C
	adds r0, r1, r2
	movs r1, 0xA0
	strh r1, [r0]
	ldr r0, _080EFD50
	strh r1, [r0]
	b _080EFD64
	.align 2, 0
_080EFD44: .4byte gUnknown_083DFEC4
_080EFD48: .4byte 0x00006e90
_080EFD4C: .4byte 0x00007698
_080EFD50: .4byte 0x04000012
_080EFD54:
	ldr r0, _080EFD7C
	adds r1, r0
	movs r2, 0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r0, _080EFD80
	strh r2, [r0]
_080EFD64:
	ldr r2, _080EFD84
	ldrh r0, [r2]
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080EFD88
	movs r0, 0
	strh r0, [r1]
	b _080EFD90
	.align 2, 0
_080EFD7C: .4byte 0x00007698
_080EFD80: .4byte 0x04000012
_080EFD84: .4byte 0x04000008
_080EFD88: .4byte 0x04000050
_080EFD8C:
	movs r0, 0
	b _080EFDA0
_080EFD90:
	ldr r0, _080EFDA4
	ldr r1, [r0]
	ldr r2, _080EFDA8
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080EFD9E:
	movs r0, 0x1
_080EFDA0:
	pop {r1}
	bx r1
	.align 2, 0
_080EFDA4: .4byte gUnknown_083DFEC4
_080EFDA8: .4byte 0x0000d160
	thumb_func_end sub_80EF874

	thumb_func_start sub_80EF9F8
sub_80EF9F8: @ 80EFDAC
	push {r4-r6,lr}
	sub sp, 0x14
	movs r5, 0x4
	ldr r0, _080EFDCC
	ldr r0, [r0]
	ldr r1, _080EFDD0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080EFDC2
	b _080EFF1E
_080EFDC2:
	lsls r0, 2
	ldr r1, _080EFDD4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EFDCC: .4byte gUnknown_083DFEC4
_080EFDD0: .4byte 0x00006e2e
_080EFDD4: .4byte _080EFDD8
	.align 2, 0
_080EFDD8:
	.4byte _080EFF1E
	.4byte _080EFDEC
	.4byte _080EFE74
	.4byte _080EFF00
	.4byte _080EFDEC
_080EFDEC:
	ldr r0, _080EFE18
	ldr r0, [r0]
	ldr r2, _080EFE1C
	adds r0, r2
	lsls r2, r5, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080EFE20
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080EFE24
	bl sub_80F1A80
	b _080EFF36
	.align 2, 0
_080EFE18: .4byte gUnknown_083DFEC4
_080EFE1C: .4byte 0x00006e18
_080EFE20: .4byte gLinkOpen
_080EFE24:
	movs r4, 0
	b _080EFE46
_080EFE28:
	lsls r2, r5, 19
	lsrs r2, 16
	movs r0, 0x1
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080EFE46:
	cmp r4, 0x3
	bhi _080EFF1E
	ldr r0, _080EFE6C
	ldr r1, [r0]
	ldr r2, _080EFE70
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrb r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl GetLandmarkName
	adds r1, r0, 0
	cmp r1, 0
	bne _080EFE28
	b _080EFF1E
	.align 2, 0
_080EFE6C: .4byte gUnknown_083DFEC4
_080EFE70: .4byte 0x00006e2c
_080EFE74:
	ldr r0, _080EFEEC
	ldr r4, [r0]
	ldr r1, _080EFEF0
	adds r0, r4, r1
	lsls r2, r5, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r2, _080EFEF4
	adds r0, r4, r2
	ldrh r1, [r0]
	adds r2, 0x3
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	lsls r1, 3
	adds r0, r1
	ldr r1, _080EFEF8
	adds r4, r1
	adds r6, r4, r0
	ldr r0, [r6]
	cmp r0, 0
	beq _080EFF1E
	lsls r4, r5, 24
	lsrs r4, 24
	movs r0, 0xE
	adds r1, r4, 0
	movs r2, 0xF
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
	movs r0, 0x1A
	adds r1, r4, 0
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080EFEFC
	ldr r3, [r6]
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	str r1, [sp, 0xC]
	str r1, [sp, 0x10]
	movs r1, 0x10
	movs r2, 0x6
	bl sub_8095C8C
	adds r0, r5, 0
	adds r0, 0xB
	b _080EFF1A
	.align 2, 0
_080EFEEC: .4byte gUnknown_083DFEC4
_080EFEF0: .4byte 0x00006e18
_080EFEF4: .4byte 0x00006e2c
_080EFEF8: .4byte 0x0000cdcc
_080EFEFC: .4byte 0x0600f800
_080EFF00:
	ldr r0, _080EFF4C
	ldr r0, [r0]
	ldr r2, _080EFF50
	adds r0, r2
	lsls r2, r5, 19
	lsrs r2, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	adds r0, r5, 0x2
_080EFF1A:
	lsls r0, 16
	lsrs r5, r0, 16
_080EFF1E:
	movs r0, 0
	cmp r0, 0
	bne _080EFF36
	cmp r5, 0xF
	bhi _080EFF36
	lsls r1, r5, 24
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
_080EFF36:
	ldr r0, _080EFF4C
	ldr r0, [r0]
	ldr r1, _080EFF54
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080EFF58
	bl sub_80EFD74
	b _080EFF5C
	.align 2, 0
_080EFF4C: .4byte gUnknown_083DFEC4
_080EFF50: .4byte 0x00006e18
_080EFF54: .4byte 0x00006e2e
_080EFF58:
	bl sub_80EFDA0
_080EFF5C:
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80EF9F8

	thumb_func_start sub_80EFBB0
sub_80EFBB0: @ 80EFF64
	push {lr}
	ldr r0, _080EFF7C
	ldr r0, [r0]
	ldr r1, _080EFF80
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EFF84
	movs r0, 0x8
	bl sub_80EEFBC
	b _080EFF8A
	.align 2, 0
_080EFF7C: .4byte gUnknown_083DFEC4
_080EFF80: .4byte 0x00006e90
_080EFF84:
	movs r0, 0x7
	bl sub_80EEFBC
_080EFF8A:
	pop {r0}
	bx r0
	thumb_func_end sub_80EFBB0

	thumb_func_start sub_80EFBDC
sub_80EFBDC: @ 80EFF90
	push {r4,lr}
	lsls r0, 24
	movs r4, 0x1
	ldr r2, _080EFFB0
	ldr r1, [r2]
	ldr r3, _080EFFB4
	adds r1, r3
	ldrh r3, [r1]
	cmp r0, 0
	beq _080EFFBC
	cmp r3, 0xA8
	bls _080EFFB8
	adds r0, r3, 0
	subs r0, 0x8
	b _080EFFC4
	.align 2, 0
_080EFFB0: .4byte gUnknown_083DFEC4
_080EFFB4: .4byte 0x00007698
_080EFFB8:
	movs r3, 0xA0
	b _080EFFCE
_080EFFBC:
	cmp r3, 0xF7
	bhi _080EFFCA
	adds r0, r3, 0
	adds r0, 0x8
_080EFFC4:
	lsls r0, 16
	lsrs r3, r0, 16
	b _080EFFD0
_080EFFCA:
	movs r3, 0x80
	lsls r3, 1
_080EFFCE:
	movs r4, 0
_080EFFD0:
	ldr r0, [r2]
	ldr r1, _080EFFE8
	adds r0, r1
	strh r3, [r0]
	ldr r1, _080EFFEC
	movs r0, 0xFF
	ands r3, r0
	strh r3, [r1]
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EFFE8: .4byte 0x00007698
_080EFFEC: .4byte 0x04000012
	thumb_func_end sub_80EFBDC

	thumb_func_start sub_80EFC3C
sub_80EFC3C: @ 80EFFF0
	push {lr}
	ldr r0, _080F000C
	ldr r0, [r0]
	ldr r2, _080F0010
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _080F0014
	adds r0, r1
	strb r2, [r0]
	bl sub_80EFD3C
	pop {r0}
	bx r0
	.align 2, 0
_080F000C: .4byte gUnknown_083DFEC4
_080F0010: .4byte 0x0000bc9a
_080F0014: .4byte 0x0000bc9b
	thumb_func_end sub_80EFC3C

	thumb_func_start sub_80EFC64
sub_80EFC64: @ 80F0018
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	ldr r4, _080F0084
	ldr r2, [r4]
	ldr r0, _080F0088
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0xF
	bhi _080F00E0
	ldrb r1, [r1]
	mov r8, r1
	ldr r1, _080F008C
	adds r0, r2, r1
	ldrb r7, [r0]
	movs r2, 0
	ldr r0, _080F0090
	mov r9, r0
	adds r3, r4, 0
_080F0042:
	lsls r0, r2, 2
	mov r4, r8
	lsls r1, r4, 3
	adds r6, r0, r1
	mov r1, r9
	adds r0, r6, r1
	ldr r1, [r0]
	cmp r1, 0
	beq _080F009C
	movs r0, 0xC8
	adds r5, r7, 0
	muls r5, r0
	ldr r4, _080F0094
	adds r5, r4
	ldr r4, [r3]
	adds r5, r4, r5
	adds r0, r1, 0
	adds r1, r5, 0
	str r2, [sp]
	str r3, [sp, 0x4]
	bl LZ77UnCompVram
	ldr r0, _080F0098
	adds r4, r0
	adds r4, r6
	str r5, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r2, [sp]
	ldr r3, [sp, 0x4]
	b _080F00A6
	.align 2, 0
_080F0084: .4byte gUnknown_083DFEC4
_080F0088: .4byte 0x0000bc9a
_080F008C: .4byte 0x0000bc9b
_080F0090: .4byte gPokenavCityMaps
_080F0094: .4byte 0x0000bc9c
_080F0098: .4byte 0x0000cdcc
_080F009C:
	ldr r0, [r3]
	ldr r4, _080F00D0
	adds r0, r4
	adds r0, r6
	str r1, [r0]
_080F00A6:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _080F0042
	ldr r0, _080F00D4
	ldr r2, [r0]
	ldr r0, _080F00D8
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _080F00E0
	ldr r1, _080F00DC
	adds r0, r2, r1
	strb r7, [r0]
	movs r0, 0x1
	b _080F00E2
	.align 2, 0
_080F00D0: .4byte 0x0000cdcc
_080F00D4: .4byte gUnknown_083DFEC4
_080F00D8: .4byte 0x0000bc9a
_080F00DC: .4byte 0x0000bc9b
_080F00E0:
	movs r0, 0
_080F00E2:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80EFC64

	thumb_func_start sub_80EFD3C
sub_80EFD3C: @ 80F00F0
	ldr r0, _080F0114
	ldr r1, [r0]
	ldr r2, _080F0118
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r0, _080F011C
	adds r3, r1, r0
	movs r0, 0x2F
	strb r0, [r3]
	ldr r3, _080F0120
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080F0124
	adds r1, r0
	strh r2, [r1]
	bx lr
	.align 2, 0
_080F0114: .4byte gUnknown_083DFEC4
_080F0118: .4byte 0x0000769e
_080F011C: .4byte 0x0000769c
_080F0120: .4byte 0x0000769d
_080F0124: .4byte 0x0000769a
	thumb_func_end sub_80EFD3C

	thumb_func_start sub_80EFD74
sub_80EFD74: @ 80F0128
	push {lr}
	ldr r0, _080F0148
	ldr r2, [r0]
	ldr r0, _080F014C
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080F0150
	adds r2, r0
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _080F0144
	movs r0, 0x2
	strb r0, [r2]
_080F0144:
	pop {r0}
	bx r0
	.align 2, 0
_080F0148: .4byte gUnknown_083DFEC4
_080F014C: .4byte 0x0000769e
_080F0150: .4byte 0x0000769d
	thumb_func_end sub_80EFD74

	thumb_func_start sub_80EFDA0
sub_80EFDA0: @ 80F0154
	push {r4,lr}
	sub sp, 0x14
	ldr r0, _080F0188
	ldr r3, _080F018C
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r2, 0xF
	str r2, [sp, 0x8]
	movs r1, 0x1
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0xE
	movs r2, 0x10
	bl sub_8095C8C
	ldr r0, _080F0190
	ldr r0, [r0]
	ldr r1, _080F0194
	adds r0, r1
	strb r4, [r0]
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0188: .4byte 0x0600f800
_080F018C: .4byte gUnknown_08E9AC2C
_080F0190: .4byte gUnknown_083DFEC4
_080F0194: .4byte 0x0000769e
	thumb_func_end sub_80EFDA0

	thumb_func_start sub_80EFDE4
sub_80EFDE4: @ 80F0198
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080F021C
	ldr r1, [r0]
	ldr r2, _080F0220
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r0, 0x3C
	subs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080F01BA
	movs r4, 0xF
_080F01BA:
	ldr r3, _080F0224
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F020C
	ldr r0, _080F0228
	mov r8, r0
	ldr r3, _080F022C
	mov r9, r3
	str r2, [sp]
	movs r5, 0
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r7, 0x1
	str r7, [sp, 0xC]
	movs r6, 0x3C
	str r6, [sp, 0x10]
	movs r1, 0xE
	movs r2, 0x10
	bl sub_8095C8C
	cmp r4, 0xE
	bhi _080F020C
	adds r1, r4, 0
	adds r1, 0xE
	lsls r1, 16
	lsrs r1, 16
	str r5, [sp]
	str r5, [sp, 0x4]
	movs r0, 0xF
	subs r0, r4
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	str r7, [sp, 0xC]
	str r6, [sp, 0x10]
	mov r0, r8
	movs r2, 0x10
	mov r3, r9
	bl sub_8095C8C
_080F020C:
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F021C: .4byte gUnknown_083DFEC4
_080F0220: .4byte 0x0000769c
_080F0224: .4byte 0x0000769e
_080F0228: .4byte 0x0600f800
_080F022C: .4byte gUnknown_08E9ABB4
	thumb_func_end sub_80EFDE4

	thumb_func_start sub_80EFE7C
sub_80EFE7C: @ 80F0230
	push {r4,lr}
	ldr r0, _080F024C
	ldr r2, [r0]
	ldr r0, _080F0250
	adds r4, r2, r0
	ldrb r1, [r4]
	cmp r1, 0x1
	beq _080F02BC
	cmp r1, 0x1
	bgt _080F0254
	cmp r1, 0
	beq _080F025A
	b _080F02E2
	.align 2, 0
_080F024C: .4byte gUnknown_083DFEC4
_080F0250: .4byte 0x0000769d
_080F0254:
	cmp r1, 0x2
	beq _080F02D8
	b _080F02E2
_080F025A:
	ldr r0, _080F0288
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bls _080F026E
	strb r1, [r4]
_080F026E:
	ldr r1, _080F028C
	adds r0, r2, r1
	ldrb r0, [r0]
	bl sub_80EFDE4
	ldrb r0, [r4]
	cmp r0, 0xF
	beq _080F0298
	cmp r0, 0xF
	bgt _080F0290
	cmp r0, 0
	beq _080F0298
	b _080F02E2
	.align 2, 0
_080F0288: .4byte 0x0000769c
_080F028C: .4byte 0x0000769e
_080F0290:
	cmp r0, 0x1E
	beq _080F0298
	cmp r0, 0x2D
	bne _080F02E2
_080F0298:
	ldr r0, _080F02B0
	ldr r1, [r0]
	ldr r0, _080F02B4
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _080F02B8
	adds r1, r0
	strh r3, [r1]
	b _080F02E2
	.align 2, 0
_080F02B0: .4byte gUnknown_083DFEC4
_080F02B4: .4byte 0x0000769d
_080F02B8: .4byte 0x0000769a
_080F02BC:
	ldr r0, _080F02D4
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x78
	bls _080F02E2
	movs r0, 0
	strh r0, [r1]
	b _080F02E0
	.align 2, 0
_080F02D4: .4byte 0x0000769a
_080F02D8:
	movs r0, 0x1
	bl sub_80EFDE4
	movs r0, 0x1
_080F02E0:
	strb r0, [r4]
_080F02E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80EFE7C

	thumb_func_start sub_80EFF34
sub_80EFF34: @ 80F02E8
	push {lr}
	ldr r0, _080F0310
	ldr r0, [r0]
	ldr r1, _080F0314
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F0318
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F030A
_080F0300:
	bl sub_80EFF68
	lsls r0, 24
	cmp r0, 0
	bne _080F0300
_080F030A:
	pop {r0}
	bx r0
	.align 2, 0
_080F0310: .4byte gUnknown_083DFEC4
_080F0314: .4byte 0x0000d160
_080F0318: .4byte 0x00006dac
	thumb_func_end sub_80EFF34

	thumb_func_start sub_80EFF68
sub_80EFF68: @ 80F031C
	push {r4,lr}
	sub sp, 0x14
	ldr r0, _080F033C
	ldr r0, [r0]
	ldr r1, _080F0340
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xD
	bls _080F0330
	b _080F0504
_080F0330:
	lsls r0, 2
	ldr r1, _080F0344
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F033C: .4byte gUnknown_083DFEC4
_080F0340: .4byte 0x0000d160
_080F0344: .4byte _080F0348
	.align 2, 0
_080F0348:
	.4byte _080F0380
	.4byte _080F039C
	.4byte _080F03A8
	.4byte _080F03B4
	.4byte _080F03C0
	.4byte _080F03C6
	.4byte _080F03CC
	.4byte _080F03DC
	.4byte _080F03F0
	.4byte _080F0410
	.4byte _080F044C
	.4byte _080F0460
	.4byte _080F04AC
	.4byte _080F04CC
_080F0380:
	bl sub_80EEDE8
	ldr r0, _080F0394
	ldr r0, [r0]
	ldr r2, _080F0398
	adds r0, r2
	movs r1, 0xB
	strb r1, [r0]
	b _080F0508
	.align 2, 0
_080F0394: .4byte gUnknown_083DFEC4
_080F0398: .4byte 0x0000d162
_080F039C:
	ldr r0, _080F03A4
	bl SetUpWindowConfig
	b _080F0508
	.align 2, 0
_080F03A4: .4byte gWindowConfig_81E7080
_080F03A8:
	ldr r0, _080F03B0
	bl MultistepInitMenuWindowBegin
	b _080F0508
	.align 2, 0
_080F03B0: .4byte gWindowConfig_81E7080
_080F03B4:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F03BE
	b _080F0508
_080F03BE:
	b _080F0516
_080F03C0:
	bl MenuZeroFillScreen
	b _080F0508
_080F03C6:
	bl sub_80F1614
	b _080F0508
_080F03CC:
	movs r0, 0
	bl sub_80F162C
	lsls r0, 24
	cmp r0, 0
	bne _080F03DA
	b _080F0508
_080F03DA:
	b _080F0516
_080F03DC:
	ldr r0, _080F03E8
	ldr r1, _080F03EC
	bl LZ77UnCompVram
	b _080F0508
	.align 2, 0
_080F03E8: .4byte gPokenavConditionView_Gfx
_080F03EC: .4byte 0x06005000
_080F03F0:
	ldr r0, _080F0404
	ldr r1, _080F0408
	bl LZ77UnCompVram
	ldr r0, _080F040C
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	b _080F0508
	.align 2, 0
_080F0404: .4byte gUnknown_08E9AC4C
_080F0408: .4byte 0x0600f000
_080F040C: .4byte gPokenavConditionMenu2_Pal
_080F0410:
	ldr r0, _080F043C
	ldr r0, [r0]
	ldr r1, _080F0440
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F0508
	ldr r0, _080F0444
	ldr r3, _080F0448
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x9
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0
	movs r2, 0x5
	bl sub_8095C8C
	b _080F0508
	.align 2, 0
_080F043C: .4byte gUnknown_083DFEC4
_080F0440: .4byte 0x000076aa
_080F0444: .4byte 0x0600f000
_080F0448: .4byte gUnknown_083E01AC
_080F044C:
	ldr r0, _080F0458
	ldr r1, _080F045C
	bl LZ77UnCompVram
	b _080F0508
	.align 2, 0
_080F0458: .4byte gUnknown_08E9FEB4
_080F045C: .4byte 0x0600b800
_080F0460:
	ldr r0, _080F04A0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F04A4
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080F04A8
	adds r0, r4, 0
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0xE
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0x1C
	adds r0, r4, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	bl sub_80F01A4
	b _080F0508
	.align 2, 0
_080F04A0: .4byte gUnknown_083E0254
_080F04A4: .4byte gUnknownPalette_81E6692
_080F04A8: .4byte 0x08e8a0c2
_080F04AC:
	ldr r0, _080F04C4
	ldr r0, [r0]
	ldr r2, _080F04C8
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	b _080F0508
	.align 2, 0
_080F04C4: .4byte gUnknown_083DFEC4
_080F04C8: .4byte 0x00008fe9
_080F04CC:
	ldr r1, _080F04F0
	ldr r2, _080F04F4
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _080F04F8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	ldr r2, _080F04FC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F0500
	adds r0, r2, 0
	strh r0, [r1]
	b _080F0508
	.align 2, 0
_080F04F0: .4byte 0x0400000e
_080F04F4: .4byte 0x00001e03
_080F04F8: .4byte 0x00001702
_080F04FC: .4byte 0x00000844
_080F0500: .4byte 0x0000040b
_080F0504:
	movs r0, 0
	b _080F0518
_080F0508:
	ldr r0, _080F0520
	ldr r1, [r0]
	ldr r0, _080F0524
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F0516:
	movs r0, 0x1
_080F0518:
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F0520: .4byte gUnknown_083DFEC4
_080F0524: .4byte 0x0000d160
	thumb_func_end sub_80EFF68

	thumb_func_start sub_80F0174
sub_80F0174: @ 80F0528
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _080F0542
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	b _080F054E
_080F0542:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F0554
	ands r0, r1
	strh r0, [r2]
_080F054E:
	pop {r0}
	bx r0
	.align 2, 0
_080F0554: .4byte 0x0000fbff
	thumb_func_end sub_80F0174

	thumb_func_start sub_80F01A4
sub_80F01A4: @ 80F0558
	ldr r1, _080F0580
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x9B
	strh r0, [r1]
	ldr r0, _080F0584
	ldr r2, _080F0588
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080F058C
	ldr r2, _080F0590
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1B
	strh r0, [r1]
	bx lr
	.align 2, 0
_080F0580: .4byte 0x04000040
_080F0584: .4byte 0x04000044
_080F0588: .4byte 0x00003879
_080F058C: .4byte 0x04000048
_080F0590: .4byte 0x00003f3f
	thumb_func_end sub_80F01A4

	thumb_func_start sub_80F01E0
sub_80F01E0: @ 80F0594
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080F05FC
	lsls r0, r4, 6
	ldr r2, _080F0600
	adds r0, r2
	ldr r5, [r1]
	adds r0, r5, r0
	movs r1, 0xD
	movs r2, 0x1
	bl MenuPrint
	ldr r1, _080F0604
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F05F6
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r2, _080F0608
	adds r0, r2
	adds r0, r5, r0
	movs r1, 0xD
	movs r2, 0x3
	bl MenuPrint
	ldr r0, _080F060C
	adds r4, r5, r0
	ldr r1, _080F0610
	adds r0, r5, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 2
	adds r0, r5, r0
	ldr r1, _080F0614
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 18
	lsrs r1, 23
	adds r0, r4, 0
	bl sub_80F443C
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x6
	bl MenuPrint
_080F05F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F05FC: .4byte gUnknown_083DFEC4
_080F0600: .4byte 0x00008829
_080F0604: .4byte 0x000076aa
_080F0608: .4byte 0x000088e9
_080F060C: .4byte 0x00008788
_080F0610: .4byte 0x000087dc
_080F0614: .4byte 0x0000893e
	thumb_func_end sub_80F01E0

	thumb_func_start sub_80F0264
sub_80F0264: @ 80F0618
	push {lr}
	ldr r1, _080F0644
	ldr r2, [r1]
	ldr r1, _080F0648
	adds r3, r2, r1
	movs r1, 0
	strh r1, [r3]
	ldr r3, _080F064C
	adds r1, r2, r3
	strb r0, [r1]
	ldr r0, _080F0650
	adds r2, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _080F0640
_080F0636:
	bl sub_80F02A0
	lsls r0, 24
	cmp r0, 0
	bne _080F0636
_080F0640:
	pop {r0}
	bx r0
	.align 2, 0
_080F0644: .4byte gUnknown_083DFEC4
_080F0648: .4byte 0x00000306
_080F064C: .4byte 0x000087ca
_080F0650: .4byte 0x00006dac
	thumb_func_end sub_80F0264

	thumb_func_start sub_80F02A0
sub_80F02A0: @ 80F0654
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	ldr r1, _080F0678
	ldr r0, [r1]
	ldr r2, _080F067C
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xE
	bls _080F066E
	b _080F09AE
_080F066E:
	lsls r0, 2
	ldr r1, _080F0680
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F0678: .4byte gUnknown_083DFEC4
_080F067C: .4byte 0x00000306
_080F0680: .4byte _080F0684
	.align 2, 0
_080F0684:
	.4byte _080F06C0
	.4byte _080F06F8
	.4byte _080F0704
	.4byte _080F0710
	.4byte _080F071C
	.4byte _080F0722
	.4byte _080F0734
	.4byte _080F0748
	.4byte _080F0870
	.4byte _080F08F0
	.4byte _080F0904
	.4byte _080F0928
	.4byte _080F092E
	.4byte _080F093A
	.4byte _080F0970
_080F06C0:
	bl sub_80EEDE8
	ldr r0, _080F06E8
	ldr r1, [r0]
	movs r2, 0
	ldr r3, _080F06EC
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F06D6
	movs r2, 0x1
_080F06D6:
	ldr r3, _080F06F0
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080F06F4
	adds r1, r0
	movs r0, 0xB
	strb r0, [r1]
	b _080F09CC
	.align 2, 0
_080F06E8: .4byte gUnknown_083DFEC4
_080F06EC: .4byte 0x000087ca
_080F06F0: .4byte 0x000087c8
_080F06F4: .4byte 0x0000d162
_080F06F8:
	ldr r0, _080F0700
	bl SetUpWindowConfig
	b _080F09CC
	.align 2, 0
_080F0700: .4byte gWindowConfig_81E70D4
_080F0704:
	ldr r0, _080F070C
	bl MultistepInitMenuWindowBegin
	b _080F09CC
	.align 2, 0
_080F070C: .4byte gWindowConfig_81E70D4
_080F0710:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F071A
	b _080F09CC
_080F071A:
	b _080F09DA
_080F071C:
	bl MenuZeroFillScreen
	b _080F09CC
_080F0722:
	ldr r0, _080F072C
	ldr r1, _080F0730
	bl LZ77UnCompVram
	b _080F09CC
	.align 2, 0
_080F072C: .4byte gUnknown_08E9FC64
_080F0730: .4byte 0x0600e800
_080F0734:
	ldr r0, _080F0740
	ldr r1, _080F0744
	bl LZ77UnCompVram
	b _080F09CC
	.align 2, 0
_080F0740: .4byte gPokenavConditionSearch2_Gfx
_080F0744: .4byte 0x06008000
_080F0748:
	ldr r6, _080F07B0
	adds r0, r6, 0
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F07B4
	movs r1, 0x40
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F07B8
	ldr r0, [r0]
	ldr r1, _080F07BC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F07CC
	ldr r4, _080F07C0
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080F07C4
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldr r0, _080F07C8
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0x2
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r6, 0
	adds r0, 0x10
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0xA
	adds r0, r4, 0
	movs r1, 0xBF
	b _080F085C
	.align 2, 0
_080F07B0: .4byte gUnknown_083E02B4
_080F07B4: .4byte gUnknown_083E0334
_080F07B8: .4byte gUnknown_083DFEC4
_080F07BC: .4byte 0x000087ca
_080F07C0: .4byte gPokenavConditionSearch2_Pal
_080F07C4: .4byte gPlttBufferUnfaded
_080F07C8: .4byte gUnknownPalette_81E6692
_080F07CC:
	cmp r0, 0x1
	bne _080F0818
	ldr r4, _080F080C
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080F0810
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldr r0, _080F0814
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0x2
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r6, 0
	adds r0, 0x10
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0xA
	adds r0, r4, 0
	movs r1, 0xBF
	b _080F085C
	.align 2, 0
_080F080C: .4byte gUnknown_083E0274
_080F0810: .4byte gPlttBufferUnfaded
_080F0814: .4byte gUnknownPalette_81E6692
_080F0818:
	ldr r4, _080F0864
	adds r0, r4, 0
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _080F0868
	adds r5, r4, 0
	adds r5, 0xA
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldr r0, _080F086C
	movs r1, 0x50
	movs r2, 0x20
	bl LoadPalette
	adds r0, r6, 0x2
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r6, 0
	adds r0, 0x10
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0x5F
_080F085C:
	movs r2, 0x2
	bl LoadPalette
	b _080F09CC
	.align 2, 0
_080F0864: .4byte gUnknown_08E9F9E8
_080F0868: .4byte gPlttBufferUnfaded
_080F086C: .4byte gUnknown_083E0314
_080F0870:
	ldr r0, _080F089C
	ldr r0, [r0]
	ldr r2, _080F08A0
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080F08AC
	ldr r0, _080F08A4
	ldr r3, _080F08A8
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x9
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0
	movs r2, 0x5
	bl sub_8095C8C
	b _080F09CC
	.align 2, 0
_080F089C: .4byte gUnknown_083DFEC4
_080F08A0: .4byte 0x000087ca
_080F08A4: .4byte 0x0600e800
_080F08A8: .4byte gUnknown_08E9FD1C
_080F08AC:
	ldr r3, _080F08E4
	mov r8, r3
	ldr r3, _080F08E8
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	movs r5, 0xC
	str r5, [sp, 0x8]
	movs r6, 0xA
	str r6, [sp, 0xC]
	str r5, [sp, 0x10]
	mov r0, r8
	movs r1, 0
	movs r2, 0x4
	bl sub_8095C8C
	ldr r3, _080F08EC
	str r4, [sp]
	str r4, [sp, 0x4]
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	str r5, [sp, 0x10]
	mov r0, r8
	movs r1, 0
	movs r2, 0x8
	bl sub_8095C8C
	b _080F09CC
	.align 2, 0
_080F08E4: .4byte 0x0600e800
_080F08E8: .4byte gUnknown_08E9FE54
_080F08EC: .4byte gUnknown_08E9FD64
_080F08F0:
	ldr r0, _080F08FC
	ldr r1, _080F0900
	bl LZ77UnCompVram
	b _080F09CC
	.align 2, 0
_080F08FC: .4byte gUnknown_083E0354
_080F0900: .4byte 0x06005000
_080F0904:
	ldr r2, _080F091C
	add r1, sp, 0x14
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080F0920
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080F0924
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080F09CC
	.align 2, 0
_080F091C: .4byte 0x0600f800
_080F0920: .4byte 0x040000d4
_080F0924: .4byte 0x81000400
_080F0928:
	bl sub_80F0900
	b _080F09CC
_080F092E:
	bl sub_80F0944
	lsls r0, 24
	cmp r0, 0
	beq _080F09CC
	b _080F09DA
_080F093A:
	ldr r0, _080F0950
	ldr r4, [r0]
	ldr r1, _080F0954
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080F0958
	bl ShowMapNamePopUpWindow
	b _080F09CC
	.align 2, 0
_080F0950: .4byte gUnknown_083DFEC4
_080F0954: .4byte 0x000087ca
_080F0958:
	movs r0, 0
	bl sub_80F081C
	ldr r2, _080F096C
	adds r0, r4, r2
	ldrb r0, [r0]
	bl sub_80F0FFC
	b _080F09CC
	.align 2, 0
_080F096C: .4byte 0x0000876e
_080F0970:
	ldr r1, _080F09B4
	ldr r3, _080F09B8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0xF9
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x6
	adds r3, 0xFE
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x16
	movs r0, 0xF8
	strh r0, [r1]
	ldr r1, [r2]
	ldr r0, _080F09BC
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0xF8
	strh r0, [r2]
	ldr r2, _080F09C0
	adds r0, r1, r2
	strh r3, [r0]
	ldr r0, _080F09C4
	strh r3, [r0]
	ldr r3, _080F09C8
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F09AE:
	movs r0, 0
	b _080F09DC
	.align 2, 0
_080F09B4: .4byte 0x0400000c
_080F09B8: .4byte 0x00001d0a
_080F09BC: .4byte 0x00008776
_080F09C0: .4byte 0x00008778
_080F09C4: .4byte 0x04000050
_080F09C8: .4byte 0x0000d160
_080F09CC:
	ldr r0, _080F09E8
	ldr r1, [r0]
	ldr r0, _080F09EC
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F09DA:
	movs r0, 0x1
_080F09DC:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F09E8: .4byte gUnknown_083DFEC4
_080F09EC: .4byte 0x00000306
	thumb_func_end sub_80F02A0

	thumb_func_start sub_80F063C
sub_80F063C: @ 80F09F0
	push {r4-r7,lr}
	lsls r0, 16
	ldr r3, _080F0A18
	ldr r2, [r3]
	lsrs r5, r0, 16
	asrs r4, r0, 16
	lsls r1, r4, 4
	ldr r6, _080F0A1C
	adds r0, r2, r6
	strh r1, [r0]
	adds r7, r3, 0
	cmp r4, 0x1
	beq _080F0A12
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _080F0A20
_080F0A12:
	movs r1, 0x4
	b _080F0A22
	.align 2, 0
_080F0A18: .4byte gUnknown_083DFEC4
_080F0A1C: .4byte 0x0000877c
_080F0A20:
	movs r1, 0x8
_080F0A22:
	ldr r3, _080F0A74
	adds r0, r2, r3
	strh r1, [r0]
	lsls r0, r5, 16
	asrs r3, r0, 16
	cmp r3, 0
	bge _080F0A80
	ldr r4, [r7]
	ldr r6, _080F0A74
	adds r1, r4, r6
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
	subs r6, 0x2
	adds r1, r4, r6
	lsls r0, r3, 1
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _080F0A78
	adds r0, r4, r1
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080F0A6C
	ldr r2, _080F0A7C
	adds r1, r4, r2
	adds r0, 0x1
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
_080F0A6C:
	negs r0, r3
	lsls r0, 16
	lsrs r5, r0, 16
	b _080F0A9A
	.align 2, 0
_080F0A74: .4byte 0x0000877a
_080F0A78: .4byte 0x00008770
_080F0A7C: .4byte 0x00008774
_080F0A80:
	ldr r1, [r7]
	ldr r3, _080F0AC0
	adds r0, r1, r3
	ldrh r0, [r0]
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F0AC4
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080F0A9A:
	ldr r0, [r7]
	ldr r1, _080F0AC8
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _080F0AAE
	movs r2, 0
_080F0AAE:
	movs r1, 0x1F
	adds r0, r2, 0
	ands r1, r6
	adds r2, r5, 0
	bl sub_80F0954
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0AC0: .4byte 0x00008778
_080F0AC4: .4byte 0x00008772
_080F0AC8: .4byte 0x00008774
	thumb_func_end sub_80F063C

	thumb_func_start sub_80F0718
sub_80F0718: @ 80F0ACC
	push {r4,r5,lr}
	bl sub_80F098C
	lsls r0, 24
	cmp r0, 0
	bne _080F0B44
	ldr r0, _080F0AF0
	ldr r4, [r0]
	ldr r0, _080F0AF4
	adds r3, r4, r0
	ldrh r2, [r3]
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080F0AF8
	movs r0, 0
	b _080F0B46
	.align 2, 0
_080F0AF0: .4byte gUnknown_083DFEC4
_080F0AF4: .4byte 0x0000877c
_080F0AF8:
	ldr r0, _080F0B34
	adds r1, r4, r0
	ldrh r0, [r1]
	subs r0, r2, r0
	strh r0, [r3]
	ldr r0, _080F0B38
	adds r2, r4, r0
	ldrh r0, [r1]
	ldrh r1, [r2]
	adds r0, r1
	movs r5, 0xFF
	ands r0, r5
	strh r0, [r2]
	ldr r1, _080F0B3C
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080F0B44
	movs r1, 0
	ldrsh r0, [r2, r1]
	adds r0, 0x8
	ands r0, r5
	asrs r1, r0, 3
	ldr r2, _080F0B40
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0
	b _080F0B46
	.align 2, 0
_080F0B34: .4byte 0x0000877a
_080F0B38: .4byte 0x00008776
_080F0B3C: .4byte 0x0400001e
_080F0B40: .4byte 0x00008778
_080F0B44:
	movs r0, 0x1
_080F0B46:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F0718

	thumb_func_start ShowMapNamePopUpWindow
ShowMapNamePopUpWindow: @ 80F0B4C
	push {lr}
	ldr r0, _080F0B64
	ldr r2, [r0]
	ldr r1, _080F0B68
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F0B6C
	cmp r0, 0x1
	beq _080F0B94
	b _080F0BBE
	.align 2, 0
_080F0B64: .4byte gUnknown_083DFEC4
_080F0B68: .4byte 0x000087ca
_080F0B6C:
	ldr r3, _080F0B8C
	adds r0, r2, r3
	subs r3, 0x1A
	adds r1, r2, r3
	movs r3, 0
	ldrsh r1, [r1, r3]
	lsls r1, 2
	adds r1, r2, r1
	ldr r2, _080F0B90
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 18
	lsrs r1, 23
	bl sub_80F443C
	b _080F0BA8
	.align 2, 0
_080F0B8C: .4byte 0x00008788
_080F0B90: .4byte 0x0000893e
_080F0B94:
	ldr r3, _080F0BC4
	adds r0, r2, r3
	subs r3, 0x1A
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	bl sub_80F445C
_080F0BA8:
	ldr r0, _080F0BC8
	bl BasicInitMenuWindow
	ldr r0, _080F0BCC
	ldr r0, [r0]
	ldr r1, _080F0BC4
	adds r0, r1
	movs r1, 0x1
	movs r2, 0x6
	bl MenuPrint
_080F0BBE:
	pop {r0}
	bx r0
	.align 2, 0
_080F0BC4: .4byte 0x00008788
_080F0BC8: .4byte gWindowConfig_81E710C
_080F0BCC: .4byte gUnknown_083DFEC4
	thumb_func_end ShowMapNamePopUpWindow

	thumb_func_start sub_80F081C
sub_80F081C: @ 80F0BD0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F0BEC
	bl BasicInitMenuWindow
	cmp r5, 0x4
	bhi _080F0C7A
	lsls r0, r5, 2
	ldr r1, _080F0BF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F0BEC: .4byte gWindowConfig_81E710C
_080F0BF0: .4byte _080F0BF4
	.align 2, 0
_080F0BF4:
	.4byte _080F0C08
	.4byte _080F0C08
	.4byte _080F0C16
	.4byte _080F0C40
	.4byte _080F0C4E
_080F0C08:
	ldr r0, _080F0C80
	movs r1, 0xA
	movs r2, 0x9
	bl MenuPrint_RightAligned
	cmp r5, 0
	bne _080F0C7A
_080F0C16:
	ldr r0, _080F0C84
	ldr r0, [r0]
	ldr r1, _080F0C88
	adds r4, r0, r1
	ldr r2, _080F0C8C
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r1, 0x1
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0xB
	bl MenuPrint_RightAligned
	cmp r5, 0
	bne _080F0C7A
_080F0C40:
	ldr r0, _080F0C90
	movs r1, 0xA
	movs r2, 0xD
	bl MenuPrint_RightAligned
	cmp r5, 0
	bne _080F0C7A
_080F0C4E:
	movs r0, 0x9
	bl sub_8053108
	adds r1, r0, 0
	ldr r0, _080F0C94
	cmp r1, r0
	bls _080F0C5E
	adds r1, r0, 0
_080F0C5E:
	ldr r0, _080F0C84
	ldr r4, [r0]
	ldr r0, _080F0C88
	adds r4, r0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0xF
	bl MenuPrint_RightAligned
_080F0C7A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0C80: .4byte gOtherText_NumberRegistered
_080F0C84: .4byte gUnknown_083DFEC4
_080F0C88: .4byte 0x00008788
_080F0C8C: .4byte 0x00008774
_080F0C90: .4byte gOtherText_NumberBattles
_080F0C94: .4byte 0x0001869f
	thumb_func_end sub_80F081C

	thumb_func_start sub_80F08E4
sub_80F08E4: @ 80F0C98
	push {lr}
	ldr r0, _080F0CB0
	bl BasicInitMenuWindow
	movs r0, 0
	movs r1, 0x9
	movs r2, 0xB
	movs r3, 0x10
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	.align 2, 0
_080F0CB0: .4byte gWindowConfig_81E710C
	thumb_func_end sub_80F08E4

	thumb_func_start sub_80F0900
sub_80F0900: @ 80F0CB4
	push {r4,r5,lr}
	ldr r0, _080F0CF0
	ldr r0, [r0]
	ldr r2, _080F0CF4
	adds r1, r0, r2
	subs r2, 0x2
	adds r5, r0, r2
	ldrh r0, [r1]
	ldrh r1, [r5]
	subs r0, r1
	adds r0, 0x1
	lsls r4, r0, 16
	asrs r0, r4, 16
	cmp r0, 0x7
	bgt _080F0CDE
	movs r0, 0xC
	movs r1, 0x1
	movs r2, 0x1F
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_080F0CDE:
	ldrh r0, [r5]
	lsrs r2, r4, 16
	movs r1, 0
	bl sub_80F0954
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0CF0: .4byte gUnknown_083DFEC4
_080F0CF4: .4byte 0x00008772
	thumb_func_end sub_80F0900

	thumb_func_start sub_80F0944
sub_80F0944: @ 80F0CF8
	push {lr}
	bl sub_80F098C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F0944

	thumb_func_start sub_80F0954
sub_80F0954: @ 80F0D08
	push {r4,r5,lr}
	ldr r3, _080F0D30
	ldr r3, [r3]
	ldr r5, _080F0D34
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _080F0D38
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _080F0D3C
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x6
	adds r3, r4
	strh r5, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0D30: .4byte gUnknown_083DFEC4
_080F0D34: .4byte 0x0000877e
_080F0D38: .4byte 0x00008780
_080F0D3C: .4byte 0x00008784
	thumb_func_end sub_80F0954

	thumb_func_start sub_80F098C
sub_80F098C: @ 80F0D40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080F0D58
	ldr r6, [r0]
	ldr r0, _080F0D5C
	adds r7, r6, r0
	ldrh r0, [r7]
	cmp r0, 0
	bne _080F0D60
_080F0D54:
	movs r0, 0
	b _080F0DB6
	.align 2, 0
_080F0D58: .4byte gUnknown_083DFEC4
_080F0D5C: .4byte 0x00008784
_080F0D60:
	movs r1, 0
	mov r8, r1
	ldr r1, _080F0DC0
	ldr r2, _080F0DC4
	adds r0, r6, r2
	ldrb r2, [r0]
	lsls r2, 2
	adds r2, r1
	ldr r0, _080F0DC8
	adds r4, r6, r0
	ldrh r0, [r4]
	ldr r1, _080F0DCC
	adds r5, r6, r1
	ldrh r1, [r5]
	ldr r2, [r2]
	bl _call_via_r2
	ldrh r0, [r7]
	subs r0, 0x1
	strh r0, [r7]
	ldr r2, _080F0DD0
	adds r1, r2, 0
	lsls r0, 16
	cmp r0, 0
	beq _080F0D54
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r1
	ldr r2, _080F0DD4
	adds r1, r6, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	ble _080F0DAA
	mov r0, r8
	strh r0, [r4]
_080F0DAA:
	ldrh r0, [r5]
	adds r0, 0x2
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r5]
	movs r0, 0x1
_080F0DB6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F0DC0: .4byte gUnknown_083E3270
_080F0DC4: .4byte 0x000087ca
_080F0DC8: .4byte 0x0000877e
_080F0DCC: .4byte 0x00008780
_080F0DD0: .4byte 0x0000ffff
_080F0DD4: .4byte 0x00008774
	thumb_func_end sub_80F098C

	thumb_func_start sub_80F0A24
sub_80F0A24: @ 80F0DD8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _080F0E18
	ldr r4, [r0]
	ldr r1, _080F0E1C
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r2, 0x1
	cmp r0, 0
	bne _080F0DF4
	movs r2, 0x2
_080F0DF4:
	ldr r0, _080F0E20
	adds r4, r0
	adds r0, r4, 0
	adds r1, r3, 0
	bl sub_80F4428
	ldr r0, _080F0E24
	bl BasicInitMenuWindow
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r4, 0
	movs r1, 0xD
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0E18: .4byte gUnknown_083DFEC4
_080F0E1C: .4byte 0x000087c8
_080F0E20: .4byte 0x00008788
_080F0E24: .4byte gWindowConfig_81E70D4
	thumb_func_end sub_80F0A24

	thumb_func_start sub_80F0A74
sub_80F0A74: @ 80F0E28
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	ldr r0, _080F0E90
	ldr r5, [r0]
	ldr r0, _080F0E94
	adds r4, r5, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80F700C
	movs r0, 0x1F
	ands r7, r0
	ldr r0, _080F0E98
	bl BasicInitMenuWindow
	lsls r2, r7, 3
	adds r0, r4, 0
	movs r1, 0x61
	movs r3, 0
	bl MenuPrint_PixelCoords
	ldr r1, _080F0E9C
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r6, r0
	bcs _080F0EAC
	lsls r0, r6, 3
	adds r0, r5, r0
	ldr r1, _080F0EA0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F0EAC
	ldr r0, _080F0EA4
	ldr r3, _080F0EA8
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x1D
	adds r2, r7, 0
	bl sub_8095C8C
	b _080F0EC8
	.align 2, 0
_080F0E90: .4byte gUnknown_083DFEC4
_080F0E94: .4byte 0x00008788
_080F0E98: .4byte gWindowConfig_81E70D4
_080F0E9C: .4byte 0x0000d158
_080F0EA0: .4byte 0x0000ceed
_080F0EA4: .4byte 0x0600f000
_080F0EA8: .4byte gUnknown_083E039C
_080F0EAC:
	ldr r0, _080F0ED0
	ldr r3, _080F0ED4
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0x1D
	adds r2, r7, 0
	bl sub_8095C8C
_080F0EC8:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0ED0: .4byte 0x0600f000
_080F0ED4: .4byte gUnknown_083E03A0
	thumb_func_end sub_80F0A74

	thumb_func_start sub_80F0B24
sub_80F0B24: @ 80F0ED8
	ldr r0, _080F0EEC
	ldr r0, [r0]
	ldr r2, _080F0EF0
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _080F0EF4
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080F0EEC: .4byte gUnknown_083DFEC4
_080F0EF0: .4byte 0x0000d15c
_080F0EF4: .4byte 0x00000306
	thumb_func_end sub_80F0B24

	thumb_func_start sub_80F0B44
sub_80F0B44: @ 80F0EF8
	push {r4-r6,lr}
	ldr r0, _080F0F0C
	ldr r5, [r0]
	ldr r0, _080F0F10
	adds r6, r5, r0
	ldrh r0, [r6]
	cmp r0, 0x8
	bls _080F0F14
	movs r0, 0
	b _080F0FD6
	.align 2, 0
_080F0F0C: .4byte gUnknown_083DFEC4
_080F0F10: .4byte 0x0000d15c
_080F0F14:
	ldr r0, _080F0F70
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080F0FD4
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r6]
	cmp r0, 0x7
	bhi _080F0F80
	ldr r0, _080F0F74
	adds r1, r5, r0
	ldrh r2, [r6]
	lsls r0, r2, 1
	ldrh r1, [r1]
	adds r4, r0, r1
	movs r0, 0x1F
	ands r4, r0
	ldr r1, _080F0F78
	adds r0, r5, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _080F0F5E
	ldr r0, _080F0F7C
	bl BasicInitMenuWindow
	adds r1, r4, 0
	adds r3, r1, 0x1
	movs r0, 0xC
	movs r2, 0x1F
	bl MenuZeroFillWindowRect
_080F0F5E:
	ldrh r0, [r6]
	cmp r0, 0
	bne _080F0F68
	bl sub_80F08E4
_080F0F68:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _080F0FD4
	.align 2, 0
_080F0F70: .4byte 0x00000306
_080F0F74: .4byte 0x00008778
_080F0F78: .4byte 0x0000876c
_080F0F7C: .4byte gWindowConfig_81E70D4
_080F0F80:
	ldr r0, _080F0FC4
	bl BasicInitMenuWindow
	ldr r1, _080F0FC8
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
	movs r0, 0x1F
	ands r4, r0
	movs r5, 0
_080F0F96:
	adds r3, r4, 0x1
	movs r0, 0xC
	adds r1, r4, 0
	movs r2, 0x1F
	bl MenuZeroFillWindowRect
	adds r4, 0x2
	movs r0, 0x1F
	ands r4, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _080F0F96
	ldr r0, _080F0FCC
	ldr r1, [r0]
	ldr r0, _080F0FD0
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _080F0FD6
	.align 2, 0
_080F0FC4: .4byte gWindowConfig_81E70D4
_080F0FC8: .4byte 0x00008778
_080F0FCC: .4byte gUnknown_083DFEC4
_080F0FD0: .4byte 0x0000d15c
_080F0FD4:
	movs r0, 0x1
_080F0FD6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F0B44

	thumb_func_start sub_80F0C28
sub_80F0C28: @ 80F0FDC
	ldr r0, _080F0FF0
	ldr r0, [r0]
	ldr r2, _080F0FF4
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _080F0FF8
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080F0FF0: .4byte gUnknown_083DFEC4
_080F0FF4: .4byte 0x0000d15c
_080F0FF8: .4byte 0x00000306
	thumb_func_end sub_80F0C28

	thumb_func_start sub_80F0C48
sub_80F0C48: @ 80F0FFC
	push {r4-r6,lr}
	ldr r0, _080F1010
	ldr r4, [r0]
	ldr r0, _080F1014
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, 0x7
	bls _080F1018
	movs r0, 0
	b _080F1086
	.align 2, 0
_080F1010: .4byte gUnknown_083DFEC4
_080F1014: .4byte 0x0000d15c
_080F1018:
	ldr r2, _080F1070
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r2, _080F1074
	adds r6, r2, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080F1084
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080F1078
	bl BasicInitMenuWindow
	ldr r0, _080F107C
	adds r1, r4, r0
	ldrh r0, [r5]
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080F1080
	adds r2, r4, r1
	ldrh r1, [r5]
	lsls r1, 1
	ldrh r2, [r2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_80F0A74
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	ands r0, r6
	cmp r0, 0x7
	bls _080F1084
	movs r0, 0
	bl sub_80F081C
	movs r0, 0
	b _080F1086
	.align 2, 0
_080F1070: .4byte 0x00000306
_080F1074: .4byte 0x0000ffff
_080F1078: .4byte gWindowConfig_81E70D4
_080F107C: .4byte 0x00008770
_080F1080: .4byte 0x00008778
_080F1084:
	movs r0, 0x1
_080F1086:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F0C48

	thumb_func_start sub_80F0CD8
sub_80F0CD8: @ 80F108C
	push {r4,r5,lr}
	ldr r4, _080F10F4
	ldr r1, [r4]
	ldr r2, _080F10F8
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	ldr r3, _080F10FC
	adds r0, r1, r3
	strh r2, [r0]
	ldr r2, _080F1100
	adds r0, r1, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	lsls r0, 3
	adds r0, r1, r0
	ldr r2, _080F1104
	adds r0, r2
	ldrb r0, [r0]
	ldr r3, _080F1108
	adds r1, r3
	ldr r2, _080F110C
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r2, r0, 0
	movs r1, 0
	adds r5, r4, 0
	adds r4, r3, 0
_080F10C8:
	ldrb r0, [r2]
	adds r3, r1, 0x1
	cmp r0, 0xFF
	beq _080F10D8
_080F10D0:
	adds r2, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080F10D0
_080F10D8:
	ldr r0, [r5]
	lsls r1, r3, 2
	adds r0, r4
	adds r0, r1
	adds r2, 0x1
	str r2, [r0]
	lsls r0, r3, 16
	lsrs r1, r0, 16
	cmp r1, 0x2
	bls _080F10C8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F10F4: .4byte gUnknown_083DFEC4
_080F10F8: .4byte 0x00000306
_080F10FC: .4byte 0x0000d15c
_080F1100: .4byte 0x0000876e
_080F1104: .4byte 0x0000ceec
_080F1108: .4byte 0x0000d110
_080F110C: .4byte gTrainerEyeDescriptions
	thumb_func_end sub_80F0CD8

	thumb_func_start sub_80F0D5C
sub_80F0D5C: @ 80F1110
	push {r4,r5,lr}
	ldr r0, _080F1124
	ldr r4, [r0]
	ldr r0, _080F1128
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, 0x7
	bne _080F112C
_080F1120:
	movs r0, 0
	b _080F1264
	.align 2, 0
_080F1124: .4byte gUnknown_083DFEC4
_080F1128: .4byte 0x0000d15c
_080F112C:
	ldr r0, _080F116C
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080F1140
	b _080F1262
_080F1140:
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080F1170
	bl BasicInitMenuWindow
	ldr r0, _080F1174
	adds r1, r4, r0
	ldrh r3, [r5]
	lsls r0, r3, 1
	adds r0, 0x2
	ldrh r1, [r1]
	adds r5, r0, r1
	movs r0, 0x1F
	ands r5, r0
	cmp r3, 0x6
	bhi _080F1120
	lsls r0, r3, 2
	ldr r1, _080F1178
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F116C: .4byte 0x00000306
_080F1170: .4byte gWindowConfig_81E70D4
_080F1174: .4byte 0x00008778
_080F1178: .4byte _080F117C
	.align 2, 0
_080F117C:
	.4byte _080F1198
	.4byte _080F11A4
	.4byte _080F11BC
	.4byte _080F11C8
	.4byte _080F11E0
	.4byte _080F11EC
	.4byte _080F1220
_080F1198:
	ldr r0, _080F11A0
	lsls r2, r5, 3
	b _080F1208
	.align 2, 0
_080F11A0: .4byte gOtherText_Strategy
_080F11A4:
	ldr r0, _080F11B0
	ldr r0, [r0]
	ldr r1, _080F11B4
	adds r4, r0, r1
	ldr r1, _080F11B8
	b _080F11F6
	.align 2, 0
_080F11B0: .4byte gUnknown_083DFEC4
_080F11B4: .4byte 0x00008788
_080F11B8: .4byte 0x0000d110
_080F11BC:
	ldr r0, _080F11C4
	lsls r2, r5, 3
	b _080F1208
	.align 2, 0
_080F11C4: .4byte gOtherText_TrainersPokemon
_080F11C8:
	ldr r0, _080F11D4
	ldr r0, [r0]
	ldr r1, _080F11D8
	adds r4, r0, r1
	ldr r1, _080F11DC
	b _080F11F6
	.align 2, 0
_080F11D4: .4byte gUnknown_083DFEC4
_080F11D8: .4byte 0x00008788
_080F11DC: .4byte 0x0000d114
_080F11E0:
	ldr r0, _080F11E8
	lsls r2, r5, 3
	b _080F1208
	.align 2, 0
_080F11E8: .4byte gOtherText_SelfIntroduction
_080F11EC:
	ldr r0, _080F1214
	ldr r0, [r0]
	ldr r1, _080F1218
	adds r4, r0, r1
	ldr r1, _080F121C
_080F11F6:
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	movs r2, 0x88
	movs r3, 0
	bl sub_8072C74
	lsls r2, r5, 3
	adds r0, r4, 0
_080F1208:
	movs r1, 0x61
	movs r3, 0
	bl MenuPrint_PixelCoords
	b _080F1254
	.align 2, 0
_080F1214: .4byte gUnknown_083DFEC4
_080F1218: .4byte 0x00008788
_080F121C: .4byte 0x0000d118
_080F1220:
	ldr r0, _080F1248
	ldr r0, [r0]
	ldr r1, _080F124C
	adds r4, r0, r1
	ldr r1, _080F1250
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	movs r2, 0x88
	movs r3, 0
	bl sub_8072C74
	lsls r2, r5, 3
	adds r0, r4, 0
	movs r1, 0x61
	movs r3, 0
	bl MenuPrint_PixelCoords
	b _080F1120
	.align 2, 0
_080F1248: .4byte gUnknown_083DFEC4
_080F124C: .4byte 0x00008788
_080F1250: .4byte 0x0000d11c
_080F1254:
	ldr r0, _080F126C
	ldr r1, [r0]
	ldr r0, _080F1270
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F1262:
	movs r0, 0x1
_080F1264:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F126C: .4byte gUnknown_083DFEC4
_080F1270: .4byte 0x0000d15c
	thumb_func_end sub_80F0D5C

	thumb_func_start sub_80F0EC0
sub_80F0EC0: @ 80F1274
	push {lr}
	ldr r0, _080F1298
	ldr r0, [r0]
	ldr r2, _080F129C
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r3, _080F12A0
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _080F12A4
	adds r0, r1
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	pop {r0}
	bx r0
	.align 2, 0
_080F1298: .4byte gUnknown_083DFEC4
_080F129C: .4byte 0x00000306
_080F12A0: .4byte 0x0000d15c
_080F12A4: .4byte 0x00008788
	thumb_func_end sub_80F0EC0

	thumb_func_start sub_80F0EF4
sub_80F0EF4: @ 80F12A8
	push {r4,r5,lr}
	ldr r0, _080F12BC
	ldr r2, [r0]
	ldr r0, _080F12C0
	adds r5, r2, r0
	ldrh r0, [r5]
	cmp r0, 0x6
	bls _080F12C4
	movs r0, 0
	b _080F1306
	.align 2, 0
_080F12BC: .4byte gUnknown_083DFEC4
_080F12C0: .4byte 0x0000d15c
_080F12C4:
	ldr r0, _080F130C
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080F1304
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080F1310
	adds r0, r2, r1
	ldrh r4, [r5]
	lsls r4, 1
	adds r4, 0x2
	ldrh r0, [r0]
	adds r4, r0
	movs r0, 0x1F
	ands r4, r0
	ldr r0, _080F1314
	bl BasicInitMenuWindow
	adds r3, r4, 0x1
	movs r0, 0xC
	adds r1, r4, 0
	movs r2, 0x1F
	bl MenuZeroFillWindowRect
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F1304:
	movs r0, 0x1
_080F1306:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F130C: .4byte 0x00000306
_080F1310: .4byte 0x00008778
_080F1314: .4byte gWindowConfig_81E70D4
	thumb_func_end sub_80F0EF4

	thumb_func_start sub_80F0F64
sub_80F0F64: @ 80F1318
	push {r4,lr}
	ldr r0, _080F1344
	ldr r3, [r0]
	ldr r1, _080F1348
	adds r0, r3, r1
	movs r4, 0
	ldrsh r2, [r0, r4]
	lsls r1, r2, 4
	ldr r4, _080F134C
	adds r0, r3, r4
	strh r1, [r0]
	movs r1, 0x8
	cmp r2, 0x1
	bne _080F1336
	movs r1, 0x4
_080F1336:
	ldr r2, _080F1350
	adds r0, r3, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1344: .4byte gUnknown_083DFEC4
_080F1348: .4byte 0x0000876c
_080F134C: .4byte 0x0000877c
_080F1350: .4byte 0x0000877a
	thumb_func_end sub_80F0F64

	thumb_func_start sub_80F0FA0
sub_80F0FA0: @ 80F1354
	push {r4,lr}
	ldr r0, _080F1390
	ldr r3, [r0]
	ldr r1, _080F1394
	adds r0, r3, r1
	movs r4, 0
	ldrsh r0, [r0, r4]
	negs r0, r0
	lsls r0, 16
	asrs r0, 16
	lsls r2, r0, 4
	ldr r4, _080F1398
	adds r1, r3, r4
	strh r2, [r1]
	movs r1, 0x1
	negs r1, r1
	movs r4, 0x8
	negs r4, r4
	adds r2, r4, 0
	cmp r0, r1
	bne _080F1384
	movs r0, 0x4
	negs r0, r0
	adds r2, r0, 0
_080F1384:
	ldr r1, _080F139C
	adds r0, r3, r1
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1390: .4byte gUnknown_083DFEC4
_080F1394: .4byte 0x0000876c
_080F1398: .4byte 0x0000877c
_080F139C: .4byte 0x0000877a
	thumb_func_end sub_80F0FA0

	thumb_func_start sub_80F0FEC
sub_80F0FEC: @ 80F13A0
	push {lr}
	bl sub_80F0718
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F0FEC

	thumb_func_start sub_80F0FFC
sub_80F0FFC: @ 80F13B0
	push {r4,r5,lr}
	lsls r0, 24
	ldr r1, _080F13FC
	ldr r4, [r1]
	ldr r1, _080F1400
	adds r5, r4, r1
	lsrs r0, 21
	adds r0, r4, r0
	ldr r1, _080F1404
	adds r0, r1
	ldrh r1, [r0]
	adds r0, r5, 0
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080F1408
	bl BasicInitMenuWindow
	adds r0, r5, 0
	bl sub_80F19DC
	ldr r0, _080F140C
	adds r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x58
	movs r3, 0x2
	bl sub_8072C74
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x5
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F13FC: .4byte gUnknown_083DFEC4
_080F1400: .4byte 0x00008788
_080F1404: .4byte 0x0000ceea
_080F1408: .4byte gWindowConfig_81E710C
_080F140C: .4byte 0x0000d138
	thumb_func_end sub_80F0FFC

	thumb_func_start sub_80F105C
sub_80F105C: @ 80F1410
	push {lr}
	ldr r0, _080F142C
	ldr r1, [r0]
	ldr r2, _080F1430
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, 0xA
	adds r1, r2
	ldrh r1, [r1]
	bl sub_80F0A74
	pop {r0}
	bx r0
	.align 2, 0
_080F142C: .4byte gUnknown_083DFEC4
_080F1430: .4byte 0x0000876e
	thumb_func_end sub_80F105C

	thumb_func_start sub_80F1080
sub_80F1080: @ 80F1434
	push {r4,lr}
	ldr r1, _080F1454
	ldr r0, [r1]
	ldr r2, _080F1458
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xE
	bls _080F1448
	b _080F15B8
_080F1448:
	lsls r0, 2
	ldr r1, _080F145C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1454: .4byte gUnknown_083DFEC4
_080F1458: .4byte 0x0000d160
_080F145C: .4byte _080F1460
	.align 2, 0
_080F1460:
	.4byte _080F149C
	.4byte _080F14B8
	.4byte _080F14C4
	.4byte _080F14D0
	.4byte _080F14DC
	.4byte _080F14E2
	.4byte _080F14E8
	.4byte _080F14F6
	.4byte _080F1514
	.4byte _080F151A
	.4byte _080F1520
	.4byte _080F1534
	.4byte _080F1548
	.4byte _080F1590
	.4byte _080F1596
_080F149C:
	bl sub_80EEDE8
	ldr r0, _080F14B0
	ldr r0, [r0]
	ldr r3, _080F14B4
	adds r0, r3
	movs r1, 0xB
	strb r1, [r0]
	b _080F15CC
	.align 2, 0
_080F14B0: .4byte gUnknown_083DFEC4
_080F14B4: .4byte 0x0000d162
_080F14B8:
	ldr r0, _080F14C0
	bl SetUpWindowConfig
	b _080F15CC
	.align 2, 0
_080F14C0: .4byte gWindowConfig_81E70B8
_080F14C4:
	ldr r0, _080F14CC
	bl MultistepInitMenuWindowBegin
	b _080F15CC
	.align 2, 0
_080F14CC: .4byte gWindowConfig_81E70B8
_080F14D0:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	beq _080F14DA
	b _080F15CC
_080F14DA:
	b _080F15DA
_080F14DC:
	bl MenuZeroFillScreen
	b _080F15CC
_080F14E2:
	bl sub_80F1614
	b _080F15CC
_080F14E8:
	movs r0, 0x1
	bl sub_80F162C
	lsls r0, 24
	cmp r0, 0
	beq _080F15CC
	b _080F15DA
_080F14F6:
	ldr r0, _080F1508
	ldr r1, _080F150C
	ldr r1, [r1]
	ldr r2, _080F1510
	adds r1, r2
	bl LZ77UnCompWram
	b _080F15CC
	.align 2, 0
_080F1508: .4byte gUnknown_08E9FBA0
_080F150C: .4byte gUnknown_083DFEC4
_080F1510: .4byte 0x0000934c
_080F1514:
	bl sub_80F1238
	b _080F15CC
_080F151A:
	bl sub_80F13FC
	b _080F15CC
_080F1520:
	ldr r0, _080F152C
	ldr r1, _080F1530
	bl LZ77UnCompVram
	b _080F15CC
	.align 2, 0
_080F152C: .4byte gPokenavRibbonView_Gfx
_080F1530: .4byte 0x06008000
_080F1534:
	ldr r0, _080F1540
	ldr r1, _080F1544
	bl LZ77UnCompVram
	b _080F15CC
	.align 2, 0
_080F1540: .4byte gUnknown_083E040C
_080F1544: .4byte 0x06008200
_080F1548:
	ldr r0, _080F1580
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080F1584
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F1588
	movs r1, 0x30
	movs r2, 0xA0
	bl LoadPalette
	ldr r0, _080F158C
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	adds r4, 0x1E
	adds r0, r4, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	b _080F15CC
	.align 2, 0
_080F1580: .4byte gPokenavRibbonView_Pal
_080F1584: .4byte gUnknown_083E03A8
_080F1588: .4byte gUnknown_083E3C60
_080F158C: .4byte gUnknownPalette_81E6692
_080F1590:
	bl sub_80F1438
	b _080F15CC
_080F1596:
	ldr r1, _080F15BC
	ldr r3, _080F15C0
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080F15C4
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x42
	movs r0, 0
	strh r0, [r1]
	ldr r1, [r2]
	ldr r0, _080F15C8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F15B8:
	movs r0, 0
	b _080F15DC
	.align 2, 0
_080F15BC: .4byte 0x0400000c
_080F15C0: .4byte 0x00001e02
_080F15C4: .4byte 0x0000170b
_080F15C8: .4byte 0x0000d160
_080F15CC:
	ldr r0, _080F15E4
	ldr r1, [r0]
	ldr r2, _080F15E8
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F15DA:
	movs r0, 0x1
_080F15DC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F15E4: .4byte gUnknown_083DFEC4
_080F15E8: .4byte 0x0000d160
	thumb_func_end sub_80F1080

	thumb_func_start sub_80F1238
sub_80F1238: @ 80F15EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r6, 0x8B
	ldr r0, _080F16CC
	ldr r2, [r0]
	ldr r1, _080F16D0
	adds r0, r2, r1
	ldr r3, _080F16D4
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r7, 0
	mov r5, sp
	adds r4, r2, 0
_080F1618:
	movs r1, 0x80
	lsls r1, 6
	adds r0, r1, 0
	strh r0, [r5]
	lsls r1, r7, 5
	adds r1, r6, r1
	lsls r1, 1
	ldr r2, _080F16D8
	adds r1, r2
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _080F16DC
	bl CpuSet
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x7
	bls _080F1618
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	movs r7, 0
	mov r9, r0
	cmp r0, 0
	beq _080F16F6
	ldr r0, _080F16CC
	ldr r0, [r0]
	mov r8, r0
	ldr r1, _080F16E0
	mov r10, r1
	ldr r5, _080F16D8
	add r5, r8
_080F1658:
	ldr r0, _080F16E4
	add r0, r8
	adds r0, r7
	ldrb r1, [r0]
	lsls r1, 2
	mov r0, r10
	adds r0, 0x2
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r2, 0x3
	lsls r2, 24
	add r1, r10
	ldrh r0, [r1]
	lsls r0, 25
	movs r3, 0x80
	lsls r3, 21
	adds r0, r3
	lsrs r4, r0, 24
	lsls r1, r6, 1
	adds r1, r5, r1
	lsrs r2, 12
	adds r0, r2, 0
	orrs r0, r4
	strh r0, [r1]
	adds r1, r6, 0x1
	lsls r1, 1
	adds r1, r5, r1
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	adds r3, r2, 0
	orrs r3, r0
	adds r0, r3, 0
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r5, r0
	adds r1, r4, 0x1
	orrs r2, r1
	strh r2, [r0]
	adds r0, r6, 0
	adds r0, 0x21
	lsls r0, 1
	adds r0, r5, r0
	orrs r3, r1
	strh r3, [r0]
	adds r4, r7, 0x1
	adds r0, r4, 0
	movs r1, 0x9
	bl __modsi3
	cmp r0, 0
	bne _080F16E8
	adds r0, r6, 0
	adds r0, 0x30
	b _080F16EA
	.align 2, 0
_080F16CC: .4byte gUnknown_083DFEC4
_080F16D0: .4byte 0x0000bc8e
_080F16D4: .4byte 0x0000bc8f
_080F16D8: .4byte 0x0000934c
_080F16DC: .4byte 0x01000012
_080F16E0: .4byte gUnknown_083E4698
_080F16E4: .4byte 0x0000bc4c
_080F16E8:
	adds r0, r6, 0x2
_080F16EA:
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r4, 16
	lsrs r7, r0, 16
	cmp r0, r9
	bcc _080F1658
_080F16F6:
	ldr r6, _080F179C
	movs r7, 0
	ldr r1, _080F17A0
	ldr r0, [r1]
	ldr r2, _080F17A4
	adds r1, r0, r2
	ldrb r3, [r1]
	cmp r7, r3
	bcs _080F178C
	subs r2, 0x43
	adds r2, r0
	mov r10, r2
	ldr r3, _080F17A8
	mov r8, r3
	ldr r2, _080F17AC
	adds r5, r0, r2
	mov r9, r1
_080F1718:
	ldr r3, [sp, 0x4]
	adds r0, r3, r7
	add r0, r10
	ldrb r1, [r0]
	lsls r1, 2
	mov r0, r8
	adds r0, 0x2
	adds r0, r1, r0
	ldrb r2, [r0]
	adds r2, 0x3
	lsls r2, 24
	add r1, r8
	ldrh r0, [r1]
	lsls r0, 25
	movs r1, 0x80
	lsls r1, 21
	adds r0, r1
	lsrs r4, r0, 24
	lsls r1, r6, 1
	adds r1, r5, r1
	lsrs r2, 12
	adds r0, r2, 0
	orrs r0, r4
	strh r0, [r1]
	adds r1, r6, 0x1
	lsls r1, 1
	adds r1, r5, r1
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	adds r3, r2, 0
	orrs r3, r0
	adds r0, r3, 0
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r5, r0
	adds r1, r4, 0x1
	orrs r2, r1
	strh r2, [r0]
	adds r0, r6, 0
	adds r0, 0x21
	lsls r0, 1
	adds r0, r5, r0
	orrs r3, r1
	strh r3, [r0]
	adds r0, r6, 0x2
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	mov r0, r9
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080F1718
_080F178C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F179C: .4byte 0x0000014b
_080F17A0: .4byte gUnknown_083DFEC4
_080F17A4: .4byte 0x0000bc8f
_080F17A8: .4byte gUnknown_083E4698
_080F17AC: .4byte 0x0000934c
	thumb_func_end sub_80F1238

	thumb_func_start sub_80F13FC
sub_80F13FC: @ 80F17B0
	ldr r0, _080F17D0
	ldr r0, [r0]
	ldr r1, _080F17D4
	adds r0, r1
	ldr r2, _080F17D8
	ldr r1, _080F17DC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080F17E0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _080F17E4
	ldr r0, _080F17E8
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080F17D0: .4byte gUnknown_083DFEC4
_080F17D4: .4byte 0x0000934c
_080F17D8: .4byte 0x0600b800
_080F17DC: .4byte 0x040000d4
_080F17E0: .4byte 0x84000140
_080F17E4: .4byte gPlttBufferUnfaded
_080F17E8: .4byte 0x08e9ff54
	thumb_func_end sub_80F13FC

	thumb_func_start sub_80F1438
sub_80F1438: @ 80F17EC
	push {r4,r5,lr}
	ldr r0, _080F1824
	ldr r4, [r0]
	ldr r1, _080F1828
	adds r0, r4, r1
	movs r1, 0xD
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _080F182C
	adds r5, r4, r0
	ldr r1, _080F1830
	adds r4, r1
	ldrh r1, [r4]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80F445C
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1824: .4byte gUnknown_083DFEC4
_080F1828: .4byte 0x00008829
_080F182C: .4byte 0x00008788
_080F1830: .4byte 0x0000876e
	thumb_func_end sub_80F1438

	thumb_func_start sub_80F1480
sub_80F1480: @ 80F1834
	push {lr}
	movs r0, 0xC
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x10
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80F1480

	thumb_func_start sub_80F1494
sub_80F1494: @ 80F1848
	push {r4-r7,lr}
	ldr r0, _080F1888
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 4
	adds r6, r0, r1
	ldr r2, _080F188C
	adds r7, r0, r2
	ldr r0, _080F1890
	ldr r3, [r0]
	ldr r4, _080F1894
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _080F18A4
	ldr r5, _080F1898
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r4, 0x1
	adds r2, r3, r4
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	strh r0, [r5]
	ldr r1, _080F189C
	adds r0, r3, r1
	ldrh r2, [r5]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r4, _080F18A0
	b _080F18E2
	.align 2, 0
_080F1888: .4byte gUnknown_083DFEC8
_080F188C: .4byte 0x00000a98
_080F1890: .4byte gUnknown_083DFEC4
_080F1894: .4byte 0x0000bc91
_080F1898: .4byte gUnknown_020388B4
_080F189C: .4byte 0x0000bc4c
_080F18A0: .4byte gRibbonDescriptions
_080F18A4:
	ldr r5, _080F190C
	ldr r4, _080F1910
	adds r0, r3, r4
	ldrb r0, [r0]
	ldr r2, _080F1914
	adds r1, r3, r2
	ldrb r1, [r1]
	subs r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	adds r4, 0x2
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r1, r0
	subs r2, 0x43
	adds r0, r3, r2
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r0, _080F1918
	ldrh r1, [r5]
	adds r0, r1
	ldr r4, _080F191C
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r5]
	cmp r0, 0
	beq _080F1924
	subs r0, 0x1
	strh r0, [r5]
	ldr r4, _080F1920
_080F18E2:
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
	ldrh r0, [r5]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
	b _080F193E
	.align 2, 0
_080F190C: .4byte gUnknown_020388B4
_080F1910: .4byte 0x0000bc8e
_080F1914: .4byte 0x0000bc8f
_080F1918: .4byte gSaveBlock1
_080F191C: .4byte 0x000030f7
_080F1920: .4byte gGiftRibbonDescriptions
_080F1924:
	ldr r4, _080F1958
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x80
	movs r3, 0
	bl sub_8072C74
_080F193E:
	adds r0, r6, 0
	movs r1, 0xC
	movs r2, 0xD
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0xF
	bl MenuPrint
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1958: .4byte gEmptyString_81E72B0
	thumb_func_end sub_80F1494

	thumb_func_start sub_80F15A8
sub_80F15A8: @ 80F195C
	push {r4,r5,lr}
	movs r0, 0xC
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x10
	bl MenuZeroFillWindowRect
	ldr r0, _080F19B4
	ldr r4, [r0]
	ldr r0, _080F19B8
	adds r5, r4, r0
	ldr r1, _080F19BC
	adds r0, r5, 0
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
	ldr r1, _080F19C0
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r0, 2
	adds r4, r0
	ldr r0, _080F19C4
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0xC
	movs r2, 0xD
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F19B4: .4byte gUnknown_083DFEC4
_080F19B8: .4byte 0x00008788
_080F19BC: .4byte gOtherText_Ribbons
_080F19C0: .4byte 0x000087dc
_080F19C4: .4byte 0x0000893c
	thumb_func_end sub_80F15A8

	thumb_func_start sub_80F1614
sub_80F1614: @ 80F19C8
	ldr r0, _080F19D8
	ldr r0, [r0]
	ldr r1, _080F19DC
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F19D8: .4byte gUnknown_083DFEC4
_080F19DC: .4byte 0x00008764
	thumb_func_end sub_80F1614

	thumb_func_start sub_80F162C
sub_80F162C: @ 80F19E0
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F1A00
	ldr r0, [r0]
	ldr r2, _080F1A04
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F1A12
	cmp r0, 0x1
	bgt _080F1A08
	cmp r0, 0
	beq _080F1AA4
	b _080F1A84
	.align 2, 0
_080F1A00: .4byte gUnknown_083DFEC4
_080F1A04: .4byte 0x00008764
_080F1A08:
	cmp r0, 0x2
	beq _080F1A24
	cmp r0, 0x3
	beq _080F1A48
	b _080F1A84
_080F1A12:
	ldr r0, _080F1A1C
	ldr r1, _080F1A20
	bl LZ77UnCompVram
	b _080F1AA4
	.align 2, 0
_080F1A1C: .4byte gUnknown_08E9FF58
_080F1A20: .4byte 0x0600e800
_080F1A24:
	ldr r1, _080F1A38
	ldr r2, _080F1A3C
	ldr r0, _080F1A40
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080F1A44
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080F1AA4
	.align 2, 0
_080F1A38: .4byte gPokenavRibbonPokeView_Gfx
_080F1A3C: .4byte 0x0600e000
_080F1A40: .4byte 0x040000d4
_080F1A44: .4byte 0x80000070
_080F1A48:
	cmp r1, 0
	bne _080F1A5C
	ldr r0, _080F1A58
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	b _080F1A66
	.align 2, 0
_080F1A58: .4byte gUnknown_083E0124
_080F1A5C:
	ldr r0, _080F1A88
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
_080F1A66:
	ldr r0, _080F1A8C
	ldr r1, [r0]
	ldr r3, _080F1A90
	adds r2, r1, r3
	ldr r0, _080F1A94
	strh r0, [r2]
	ldr r2, _080F1A98
	ldr r3, _080F1A9C
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _080F1AA0
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F1A84:
	movs r0, 0
	b _080F1AB4
	.align 2, 0
_080F1A88: .4byte gUnknown_083E0144
_080F1A8C: .4byte gUnknown_083DFEC4
_080F1A90: .4byte 0x00008766
_080F1A94: .4byte 0x0000ffb0
_080F1A98: .4byte 0x04000008
_080F1A9C: .4byte 0x00001d0d
_080F1AA0: .4byte 0x00008764
_080F1AA4:
	ldr r0, _080F1AB8
	ldr r1, [r0]
	ldr r2, _080F1ABC
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F1AB4:
	pop {r1}
	bx r1
	.align 2, 0
_080F1AB8: .4byte gUnknown_083DFEC4
_080F1ABC: .4byte 0x00008764
	thumb_func_end sub_80F162C

	thumb_func_start sub_80F170C
sub_80F170C: @ 80F1AC0
	push {lr}
	ldr r0, _080F1AE8
	ldr r0, [r0]
	ldr r2, _080F1AEC
	adds r1, r0, r2
	ldrh r0, [r1]
	adds r0, 0x10
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	ble _080F1ADA
	movs r0, 0
	strh r0, [r1]
_080F1ADA:
	movs r0, 0
	ldrsh r1, [r1, r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r1}
	bx r1
	.align 2, 0
_080F1AE8: .4byte gUnknown_083DFEC4
_080F1AEC: .4byte 0x00008766
	thumb_func_end sub_80F170C

	thumb_func_start sub_80F173C
sub_80F173C: @ 80F1AF0
	push {lr}
	ldr r0, _080F1B20
	ldr r0, [r0]
	ldr r2, _080F1B24
	adds r1, r0, r2
	ldrh r0, [r1]
	subs r0, 0x10
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x50
	negs r2, r2
	cmp r0, r2
	bge _080F1B10
	ldr r0, _080F1B28
	strh r0, [r1]
_080F1B10:
	movs r0, 0
	ldrsh r1, [r1, r0]
	eors r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	pop {r1}
	bx r1
	.align 2, 0
_080F1B20: .4byte gUnknown_083DFEC4
_080F1B24: .4byte 0x00008766
_080F1B28: .4byte 0x0000ffb0
	thumb_func_end sub_80F173C

	thumb_func_start sub_80F1778
sub_80F1778: @ 80F1B2C
	push {r4,lr}
	sub sp, 0x14
	ldr r0, _080F1B4C
	ldr r0, [r0]
	ldr r1, _080F1B50
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x9
	bls _080F1B40
	b _080F1CC4
_080F1B40:
	lsls r0, 2
	ldr r1, _080F1B54
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1B4C: .4byte gUnknown_083DFEC4
_080F1B50: .4byte 0x0000d160
_080F1B54: .4byte _080F1B58
	.align 2, 0
_080F1B58:
	.4byte _080F1B80
	.4byte _080F1B9C
	.4byte _080F1BA2
	.4byte _080F1BB2
	.4byte _080F1BC4
	.4byte _080F1BE4
	.4byte _080F1C0C
	.4byte _080F1C20
	.4byte _080F1C6C
	.4byte _080F1C8C
_080F1B80:
	bl sub_80EEDE8
	ldr r0, _080F1B94
	ldr r0, [r0]
	ldr r2, _080F1B98
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	b _080F1CC8
	.align 2, 0
_080F1B94: .4byte gUnknown_083DFEC4
_080F1B98: .4byte 0x0000d162
_080F1B9C:
	bl sub_80F1614
	b _080F1CC8
_080F1BA2:
	movs r0, 0
	bl sub_80F162C
	lsls r0, 24
	cmp r0, 0
	bne _080F1BB0
	b _080F1CC8
_080F1BB0:
	b _080F1CD6
_080F1BB2:
	ldr r0, _080F1BBC
	ldr r1, _080F1BC0
	bl LZ77UnCompVram
	b _080F1CC8
	.align 2, 0
_080F1BBC: .4byte gPokenavConditionView_Gfx
_080F1BC0: .4byte 0x06005000
_080F1BC4:
	ldr r0, _080F1BD8
	ldr r1, _080F1BDC
	bl LZ77UnCompVram
	ldr r0, _080F1BE0
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	b _080F1CC8
	.align 2, 0
_080F1BD8: .4byte gUnknown_08E9AC4C
_080F1BDC: .4byte 0x0600f000
_080F1BE0: .4byte gPokenavConditionMenu2_Pal
_080F1BE4:
	ldr r0, _080F1C04
	ldr r3, _080F1C08
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r2, 0xC
	str r2, [sp, 0x8]
	movs r1, 0x4
	str r1, [sp, 0xC]
	str r2, [sp, 0x10]
	movs r1, 0
	movs r2, 0xD
	bl sub_8095C8C
	b _080F1CC8
	.align 2, 0
_080F1C04: .4byte 0x0600f000
_080F1C08: .4byte gUnknown_083E01F4
_080F1C0C:
	ldr r0, _080F1C18
	ldr r1, _080F1C1C
	bl LZ77UnCompVram
	b _080F1CC8
	.align 2, 0
_080F1C18: .4byte gUnknown_08E9FEB4
_080F1C1C: .4byte 0x0600b800
_080F1C20:
	ldr r0, _080F1C60
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080F1C64
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _080F1C68
	adds r0, r4, 0
	movs r1, 0xB1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0xE
	movs r1, 0xB5
	movs r2, 0x2
	bl LoadPalette
	adds r4, 0x1C
	adds r0, r4, 0
	movs r1, 0xBF
	movs r2, 0x2
	bl LoadPalette
	bl sub_80F01A4
	b _080F1CC8
	.align 2, 0
_080F1C60: .4byte gUnknown_083E0254
_080F1C64: .4byte gUnknownPalette_81E6692
_080F1C68: .4byte 0x08e8a0c2
_080F1C6C:
	ldr r0, _080F1C84
	ldr r0, [r0]
	ldr r1, _080F1C88
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	b _080F1CC8
	.align 2, 0
_080F1C84: .4byte gUnknown_083DFEC4
_080F1C88: .4byte 0x00008fe9
_080F1C8C:
	ldr r1, _080F1CB0
	ldr r2, _080F1CB4
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _080F1CB8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	ldr r2, _080F1CBC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F1CC0
	adds r0, r2, 0
	strh r0, [r1]
	b _080F1CC8
	.align 2, 0
_080F1CB0: .4byte 0x0400000e
_080F1CB4: .4byte 0x00001e03
_080F1CB8: .4byte 0x00001702
_080F1CBC: .4byte 0x00000844
_080F1CC0: .4byte 0x0000040b
_080F1CC4:
	movs r0, 0
	b _080F1CD8
_080F1CC8:
	ldr r0, _080F1CE0
	ldr r1, [r0]
	ldr r0, _080F1CE4
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F1CD6:
	movs r0, 0x1
_080F1CD8:
	add sp, 0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F1CE0: .4byte gUnknown_083DFEC4
_080F1CE4: .4byte 0x0000d160
	thumb_func_end sub_80F1778

	thumb_func_start sub_80F1934
sub_80F1934: @ 80F1CE8
	push {r4,r5,lr}
	ldr r0, _080F1D44
	ldr r1, [r0]
	ldr r0, _080F1D48
	adds r5, r1, r0
	ldr r3, _080F1D4C
	adds r2, r1, r3
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r1, r0
	ldr r0, _080F1D50
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _080F1D60
	ldrb r0, [r2]
	bl sub_8137124
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080F1D54
	adds r0, r1
	bl GetNature
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080F1D58
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	ldr r0, _080F1D5C
	lsls r4, 2
	adds r4, r0
	ldr r1, [r4]
	adds r0, r5, 0
	movs r2, 0x57
	movs r3, 0
	bl sub_8072C74
	b _080F1D6C
	.align 2, 0
_080F1D44: .4byte gUnknown_083DFEC4
_080F1D48: .4byte 0x00008788
_080F1D4C: .4byte 0x000087dc
_080F1D50: .4byte 0x0000893f
_080F1D54: .4byte gPlayerParty
_080F1D58: .4byte gOtherText_Nature2
_080F1D5C: .4byte gNatureNames
_080F1D60:
	ldr r1, _080F1D84
	adds r0, r5, 0
	movs r2, 0x57
	movs r3, 0
	bl sub_8072C74
_080F1D6C:
	ldr r0, _080F1D88
	ldr r0, [r0]
	ldr r1, _080F1D8C
	adds r0, r1
	movs r1, 0x1
	movs r2, 0x70
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1D84: .4byte gEmptyString_81E72B0
_080F1D88: .4byte gUnknown_083DFEC4
_080F1D8C: .4byte 0x00008788
	thumb_func_end sub_80F1934

	thumb_func_start sub_80F19DC
sub_80F19DC: @ 80F1D90
	push {lr}
	adds r1, r0, 0
	b _080F1D98
_080F1D96:
	adds r1, 0x1
_080F1D98:
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _080F1DAC
	cmp r0, 0xFC
	bne _080F1D96
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080F1D96
	movs r0, 0xFF
	strb r0, [r1]
_080F1DAC:
	pop {r0}
	bx r0
	thumb_func_end sub_80F19DC

	thumb_func_start sub_80F19FC
sub_80F19FC: @ 80F1DB0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080F1E1C
	ldrb r4, [r5]
	cmp r4, 0x1
	bne _080F1E14
	ldr r0, _080F1E20
	ldr r1, [r0]
	ldr r2, _080F1E24
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x3
	adds r1, r2
	ldrb r1, [r1]
	ldrb r2, [r5, 0x1]
	bl GetLandmarkName
	cmp r0, 0
	beq _080F1DFA
	ldrb r2, [r5, 0x1]
	lsls r2, 20
	movs r1, 0xC0
	lsls r1, 14
	adds r2, r1
	lsrs r2, 16
	str r4, [sp]
	movs r1, 0x70
	movs r3, 0x78
	bl sub_8072A18
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080F1E14
_080F1DFA:
	ldrb r1, [r5, 0x1]
	lsls r1, 25
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	lsrs r1, 24
	movs r0, 0xE
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuFillWindowRectWithBlankTile
	movs r0, 0
	strb r0, [r5]
_080F1E14:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F1E1C: .4byte gUnknown_020388B0
_080F1E20: .4byte gUnknown_083DFEC4
_080F1E24: .4byte 0x00006e2c
	thumb_func_end sub_80F19FC

	thumb_func_start sub_80F1A74
sub_80F1A74: @ 80F1E28
	ldr r1, _080F1E30
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080F1E30: .4byte gUnknown_020388B0
	thumb_func_end sub_80F1A74

	thumb_func_start sub_80F1A80
sub_80F1A80: @ 80F1E34
	ldr r0, _080F1E40
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F1E40: .4byte gUnknown_020388B0
	thumb_func_end sub_80F1A80

	thumb_func_start sub_80F1A90
sub_80F1A90: @ 80F1E44
	push {lr}
	ldr r0, _080F1E6C
	ldr r0, [r0]
	ldr r1, _080F1E70
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F1E74
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F1E66
_080F1E5C:
	bl sub_80F1AC4
	lsls r0, 24
	cmp r0, 0
	bne _080F1E5C
_080F1E66:
	pop {r0}
	bx r0
	.align 2, 0
_080F1E6C: .4byte gUnknown_083DFEC4
_080F1E70: .4byte 0x00000306
_080F1E74: .4byte 0x00006dac
	thumb_func_end sub_80F1A90

	thumb_func_start sub_80F1AC4
sub_80F1AC4: @ 80F1E78
	push {r4,r5,lr}
	ldr r0, _080F1E94
	ldr r1, [r0]
	ldr r2, _080F1E98
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F1EE8
	cmp r0, 0x1
	bgt _080F1E9C
	cmp r0, 0
	beq _080F1EA6
	b _080F1F20
	.align 2, 0
_080F1E94: .4byte gUnknown_083DFEC4
_080F1E98: .4byte 0x00000306
_080F1E9C:
	cmp r0, 0x2
	beq _080F1EF4
	cmp r0, 0x3
	beq _080F1F08
	b _080F1F20
_080F1EA6:
	movs r0, 0
	movs r2, 0xC8
	lsls r2, 2
	adds r4, r1, r2
	movs r5, 0
_080F1EB0:
	movs r2, 0
	adds r1, r0, 0x1
	lsls r3, r0, 4
_080F1EB6:
	lsls r0, r2, 2
	adds r0, r3
	adds r0, r4, r0
	str r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080F1EB6
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _080F1EB0
	ldr r0, _080F1EE0
	ldr r0, [r0]
	ldr r1, _080F1EE4
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _080F1F20
	.align 2, 0
_080F1EE0: .4byte gUnknown_083DFEC4
_080F1EE4: .4byte 0x00000311
_080F1EE8:
	ldr r0, _080F1EF0
	movs r2, 0xE2
	lsls r2, 2
	b _080F1EF8
	.align 2, 0
_080F1EF0: .4byte gPokenavMenuOptions_Gfx
_080F1EF4:
	ldr r0, _080F1F00
	ldr r2, _080F1F04
_080F1EF8:
	adds r1, r2
	bl LZ77UnCompWram
	b _080F1F20
	.align 2, 0
_080F1F00: .4byte gPokenavConditionMenu_Gfx
_080F1F04: .4byte 0x00001788
_080F1F08:
	ldr r0, _080F1F18
	ldr r2, _080F1F1C
	adds r1, r2
	bl LZ77UnCompWram
	movs r0, 0
	b _080F1F30
	.align 2, 0
_080F1F18: .4byte gPokenavConditionSearch_Gfx
_080F1F1C: .4byte 0x00002388
_080F1F20:
	ldr r0, _080F1F38
	ldr r1, [r0]
	ldr r0, _080F1F3C
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F1F30:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F1F38: .4byte gUnknown_083DFEC4
_080F1F3C: .4byte 0x00000306
	thumb_func_end sub_80F1AC4

	thumb_func_start sub_80F1B8C
sub_80F1B8C: @ 80F1F40
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F1F70
	ldr r0, [r0]
	ldr r1, _080F1F74
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F1F78
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F1F68
_080F1F5C:
	adds r0, r4, 0
	bl sub_80F1BC8
	lsls r0, 24
	cmp r0, 0
	bne _080F1F5C
_080F1F68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F1F70: .4byte gUnknown_083DFEC4
_080F1F74: .4byte 0x00000306
_080F1F78: .4byte 0x00006dac
	thumb_func_end sub_80F1B8C

	thumb_func_start sub_80F1BC8
sub_80F1BC8: @ 80F1F7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080F1FA8
	ldr r2, [r1]
	ldr r3, _080F1FAC
	adds r0, r2, r3
	ldrh r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x1
	beq _080F1FBE
	cmp r0, 0x1
	bgt _080F1FB0
	cmp r0, 0
	beq _080F1FB6
	b _080F2178
	.align 2, 0
_080F1FA8: .4byte gUnknown_083DFEC4
_080F1FAC: .4byte 0x00000306
_080F1FB0:
	cmp r0, 0x2
	beq _080F1FC6
	b _080F2178
_080F1FB6:
	mov r0, r9
	bl sub_80F2458
	b _080F217C
_080F1FBE:
	mov r0, r9
	bl sub_80F2514
	b _080F217C
_080F1FC6:
	mov r4, r9
	cmp r4, 0x1
	beq _080F1FF4
	cmp r4, 0x1
	bgt _080F1FD6
	cmp r4, 0
	beq _080F1FDE
	b _080F2178
_080F1FD6:
	mov r5, r9
	cmp r5, 0x2
	beq _080F2008
	b _080F2178
_080F1FDE:
	movs r0, 0x2A
	str r0, [sp, 0x4]
	movs r1, 0x14
	str r1, [sp, 0x8]
	ldr r4, _080F1FF0
	adds r1, r2, r4
	movs r0, 0x5
	b _080F2016
	.align 2, 0
_080F1FF0: .4byte 0x0000030e
_080F1FF4:
	movs r5, 0x38
	str r5, [sp, 0x4]
	movs r0, 0x14
	str r0, [sp, 0x8]
	ldr r4, _080F2004
	adds r1, r2, r4
	movs r0, 0x3
	b _080F2016
	.align 2, 0
_080F2004: .4byte 0x0000030e
_080F2008:
	movs r5, 0x28
	str r5, [sp, 0x4]
	movs r0, 0x10
	str r0, [sp, 0x8]
	ldr r4, _080F2090
	adds r1, r2, r4
	movs r0, 0x6
_080F2016:
	strb r0, [r1]
	movs r5, 0
	str r5, [sp]
	mov r8, r5
	adds r1, r3, 0
	ldr r0, [r1]
	ldr r2, _080F2090
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r8, r0
	blt _080F2032
	b _080F217C
_080F2032:
	ldr r4, [sp, 0x8]
	mov r3, r8
	muls r3, r4
	ldr r5, [sp, 0x4]
	adds r0, r5, r3
	subs r0, 0x8
	lsls r0, 16
	lsrs r0, 16
	ldr r4, [r1]
	mov r2, r8
	lsls r1, r2, 1
	movs r5, 0xC5
	lsls r5, 2
	adds r2, r4, r5
	adds r2, r1
	lsls r1, r0, 8
	adds r0, 0x11
	orrs r1, r0
	strh r1, [r2]
	mov r0, r9
	cmp r0, 0
	bne _080F20A6
	ldr r1, _080F2094
	adds r0, r4, r1
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F209C
	movs r5, 0
	ldr r0, _080F2098
	ldr r0, [r0]
	lsls r2, 4
	movs r3, 0xC8
	lsls r3, 2
	adds r1, r0, r3
	movs r3, 0
_080F207C:
	lsls r0, r5, 2
	adds r0, r2
	adds r0, r1, r0
	str r3, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F207C
	b _080F2146
	.align 2, 0
_080F2090: .4byte 0x0000030e
_080F2094: .4byte 0x00006db2
_080F2098: .4byte gUnknown_083DFEC4
_080F209C:
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 18
	lsrs r0, 16
	str r0, [sp]
_080F20A6:
	movs r5, 0
	ldr r4, [sp, 0x4]
	adds r0, r4, r3
	lsls r0, 16
	mov r10, r0
_080F20B0:
	lsls r6, r5, 5
	movs r0, 0x80
	lsls r0, 1
	adds r7, r6, r0
	lsls r1, r7, 16
	asrs r1, 16
	ldr r0, _080F2168
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F2178
	ldr r0, _080F216C
	ldr r2, [r0]
	lsls r1, r5, 2
	mov r4, r8
	lsls r0, r4, 4
	adds r1, r0
	movs r0, 0xC8
	lsls r0, 2
	adds r2, r0
	adds r4, r2, r1
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r1, _080F2170
	adds r0, r1
	str r0, [r4]
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldr r0, [r4]
	strh r5, [r0, 0x30]
	ldr r1, [r4]
	adds r0, r6, 0
	adds r0, 0x98
	strh r0, [r1, 0x32]
	ldr r0, [r4]
	strh r7, [r0, 0x34]
	ldr r0, [r4]
	ldr r1, [sp]
	adds r2, r1, 0x1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp]
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	mov r2, r9
	cmp r2, 0x2
	beq _080F2122
	cmp r2, 0
	bne _080F213C
_080F2122:
	mov r3, r8
	cmp r3, 0x2
	bls _080F213C
	movs r0, 0x1
	bl IndexOfSpritePaletteTag
	ldr r3, [r4]
	lsls r0, 4
	ldrb r2, [r3, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x5]
_080F213C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F20B0
_080F2146:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, _080F216C
	ldr r0, [r1]
	ldr r4, _080F2174
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r8, r0
	bge _080F2164
	b _080F2032
_080F2164:
	b _080F217C
	.align 2, 0
_080F2168: .4byte gSpriteTemplate_83E4454
_080F216C: .4byte gUnknown_083DFEC4
_080F2170: .4byte gSprites
_080F2174: .4byte 0x0000030e
_080F2178:
	movs r0, 0
	b _080F218C
_080F217C:
	ldr r0, _080F219C
	ldr r1, [r0]
	ldr r5, _080F21A0
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F218C:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F219C: .4byte gUnknown_083DFEC4
_080F21A0: .4byte 0x00000306
	thumb_func_end sub_80F1BC8

	thumb_func_start sub_80F1DF0
sub_80F1DF0: @ 80F21A4
	push {r4-r6,lr}
	movs r2, 0
	ldr r0, _080F21F8
	ldr r3, [r0]
	ldr r0, _080F21FC
	adds r1, r3, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bge _080F21EC
	movs r0, 0xC8
	lsls r0, 2
	adds r4, r3, r0
	adds r6, r1, 0
	ldr r5, _080F2200
_080F21C2:
	movs r1, 0
	adds r3, r2, 0x1
	lsls r2, 4
_080F21C8:
	lsls r0, r1, 2
	adds r0, r2
	adds r0, r4, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F21D6
	str r5, [r0, 0x1C]
_080F21D6:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F21C8
	lsls r0, r3, 16
	lsrs r2, r0, 16
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r2, r0
	blt _080F21C2
_080F21EC:
	movs r0, 0x6
	bl PlaySE
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F21F8: .4byte gUnknown_083DFEC4
_080F21FC: .4byte 0x0000030e
_080F2200: .4byte sub_80F2218
	thumb_func_end sub_80F1DF0

	thumb_func_start sub_80F1E50
sub_80F1E50: @ 80F2204
	push {lr}
	bl sub_80F22F8
	lsls r0, 24
	cmp r0, 0
	bne _080F2214
	movs r0, 0x1
	b _080F221A
_080F2214:
	bl sub_80F2108
	movs r0, 0
_080F221A:
	pop {r1}
	bx r1
	thumb_func_end sub_80F1E50

	thumb_func_start sub_80F1E6C
sub_80F1E6C: @ 80F2220
	push {lr}
	bl sub_80F22F8
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080F2230
	movs r1, 0x1
_080F2230:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80F1E6C

	thumb_func_start sub_80F1E84
sub_80F1E84: @ 80F2238
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _080F22B0
	ldr r4, [r5]
	ldr r1, _080F22B4
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	bl sub_80F2148
	movs r2, 0
	ldr r3, _080F22B8
	adds r1, r4, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bge _080F22A6
	ldr r0, _080F22BC
	adds r7, r4, r0
	adds r6, r1, 0
	mov r8, r5
	ldr r1, _080F22C0
	mov r12, r1
_080F2268:
	movs r0, 0
	ldrsb r0, [r7, r0]
	adds r5, r2, 0x1
	cmp r2, r0
	beq _080F229A
	movs r1, 0
	mov r3, r8
	ldr r0, [r3]
	lsls r3, r2, 4
	movs r4, 0xC8
	lsls r4, 2
	adds r2, r0, r4
	mov r4, r12
_080F2282:
	lsls r0, r1, 2
	adds r0, r3
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F2290
	str r4, [r0, 0x1C]
_080F2290:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F2282
_080F229A:
	lsls r0, r5, 16
	lsrs r2, r0, 16
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r2, r0
	blt _080F2268
_080F22A6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F22B0: .4byte gUnknown_083DFEC4
_080F22B4: .4byte 0x0000030f
_080F22B8: .4byte 0x0000030e
_080F22BC: .4byte 0x00006dad
_080F22C0: .4byte sub_80F2240
	thumb_func_end sub_80F1E84

	thumb_func_start sub_80F1F10
sub_80F1F10: @ 80F22C4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080F22E0
	ldr r4, [r0]
	ldr r1, _080F22E4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F22E8
	cmp r0, 0x1
	beq _080F2374
	b _080F2398
	.align 2, 0
_080F22E0: .4byte gUnknown_083DFEC4
_080F22E4: .4byte 0x0000030f
_080F22E8:
	bl sub_80F2360
	lsls r0, 24
	cmp r0, 0
	beq _080F2398
	movs r6, 0
	adds r7, r4, 0
	movs r0, 0xC8
	lsls r0, 2
	adds r0, r7
	mov r8, r0
_080F22FE:
	lsls r5, r6, 2
	ldr r1, _080F2360
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 4
	adds r0, r5, r0
	add r0, r8
	ldr r4, [r0]
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080F2364
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	subs r5, 0x6
	strh r5, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	lsls r0, 3
	strh r0, [r4, 0x38]
	ldr r0, _080F2368
	str r0, [r4, 0x1C]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _080F22FE
	bl sub_80F2170
	ldr r0, _080F236C
	ldr r1, [r0]
	ldr r0, _080F2370
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F2398
	.align 2, 0
_080F2360: .4byte 0x00006dad
_080F2364: .4byte gUnknown_083E4450
_080F2368: .4byte sub_80F2240
_080F236C: .4byte gUnknown_083DFEC4
_080F2370: .4byte 0x0000030f
_080F2374:
	bl sub_80F23C8
	lsls r0, 24
	cmp r0, 0
	beq _080F2398
	bl sub_80F21F8
	movs r0, 0
	bl FreeSpriteTilesByTag
	movs r0, 0
	bl FreeSpritePaletteByTag
	movs r0, 0x1
	bl FreeSpritePaletteByTag
	movs r0, 0
	b _080F239A
_080F2398:
	movs r0, 0x1
_080F239A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F1F10

	thumb_func_start sub_80F1FF0
sub_80F1FF0: @ 80F23A4
	push {r4,lr}
	ldr r0, _080F23F0
	ldr r4, [r0]
	ldr r1, _080F23F4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080F240C
	ldr r2, _080F23F8
	ldr r3, _080F23FC
	adds r0, r4, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r1, 1
	movs r3, 0xC5
	lsls r3, 2
	adds r0, r4, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r3, _080F2400
	ldr r1, _080F2404
	ldr r0, _080F2408
	adds r2, r4, r0
	ldrh r0, [r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 21
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, 0x3
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r2]
	b _080F242C
	.align 2, 0
_080F23F0: .4byte gUnknown_083DFEC4
_080F23F4: .4byte 0x00000311
_080F23F8: .4byte 0x04000044
_080F23FC: .4byte 0x00006dad
_080F2400: .4byte 0x04000054
_080F2404: .4byte gSineTable
_080F2408: .4byte 0x00000312
_080F240C:
	cmp r0, 0x2
	bne _080F242C
	ldr r2, _080F2434
	ldr r1, _080F2438
	ldr r0, _080F243C
	adds r3, r4, r0
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3]
	cmp r0, 0xE
	bhi _080F242C
	adds r0, 0x1
	strh r0, [r3]
_080F242C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2434: .4byte 0x04000052
_080F2438: .4byte gUnknown_083E42F8
_080F243C: .4byte 0x00000312
	thumb_func_end sub_80F1FF0

	thumb_func_start sub_80F208C
sub_80F208C: @ 80F2440
	push {lr}
	bl sub_80F2148
	pop {r0}
	bx r0
	thumb_func_end sub_80F208C

	thumb_func_start sub_80F2098
sub_80F2098: @ 80F244C
	ldr r1, _080F2490
	ldr r2, _080F2494
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080F2498
	ldr r0, _080F249C
	ldr r1, [r0]
	ldr r3, _080F24A0
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	movs r3, 0xC5
	lsls r3, 2
	adds r1, r3
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r1, _080F24A4
	movs r0, 0x3F
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1F
	strh r0, [r1]
	subs r2, 0x44
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080F2490: .4byte 0x04000040
_080F2494: .4byte 0x000077f0
_080F2498: .4byte 0x04000044
_080F249C: .4byte gUnknown_083DFEC4
_080F24A0: .4byte 0x00006dad
_080F24A4: .4byte 0x04000048
	thumb_func_end sub_80F2098

	thumb_func_start sub_80F20F4
sub_80F20F4: @ 80F24A8
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F24B8
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080F24B8: .4byte 0x0000dfff
	thumb_func_end sub_80F20F4

	thumb_func_start sub_80F2108
sub_80F2108: @ 80F24BC
	push {lr}
	ldr r0, _080F24E8
	ldr r3, [r0]
	ldr r0, _080F24EC
	adds r1, r3, r0
	ldrb r2, [r1]
	cmp r2, 0
	bne _080F24E4
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080F24F0
	adds r0, r3, r1
	strh r2, [r0]
	ldr r1, _080F24F4
	movs r0, 0x90
	strh r0, [r1]
	ldr r0, _080F24F8
	strh r2, [r0]
	bl sub_80F2098
_080F24E4:
	pop {r0}
	bx r0
	.align 2, 0
_080F24E8: .4byte gUnknown_083DFEC4
_080F24EC: .4byte 0x00000311
_080F24F0: .4byte 0x00000312
_080F24F4: .4byte 0x04000050
_080F24F8: .4byte 0x04000054
	thumb_func_end sub_80F2108

	thumb_func_start sub_80F2148
sub_80F2148: @ 80F24FC
	push {lr}
	ldr r0, _080F2518
	ldr r0, [r0]
	ldr r1, _080F251C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080F2520
	strh r1, [r0]
	bl sub_80F20F4
	pop {r0}
	bx r0
	.align 2, 0
_080F2518: .4byte gUnknown_083DFEC4
_080F251C: .4byte 0x00000311
_080F2520: .4byte 0x04000050
	thumb_func_end sub_80F2148

	thumb_func_start sub_80F2170
sub_80F2170: @ 80F2524
	push {r4-r7,lr}
	ldr r7, _080F2598
	ldr r4, [r7]
	ldr r1, _080F259C
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F2590
	bl sub_80F20F4
	movs r3, 0
	ldr r2, _080F25A0
	adds r5, r4, r2
	movs r0, 0xC8
	lsls r0, 2
	adds r4, r0
	movs r1, 0xD
	negs r1, r1
	mov r12, r1
	movs r6, 0x4
_080F254C:
	lsls r1, r3, 2
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 4
	adds r1, r0
	adds r1, r4, r1
	ldr r2, [r1]
	ldrb r1, [r2, 0x1]
	mov r0, r12
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, 0x1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080F254C
	ldr r1, [r7]
	ldr r0, _080F259C
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2]
	ldr r2, _080F25A4
	adds r1, r2
	strh r3, [r1]
	ldr r1, _080F25A8
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
_080F2590:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2598: .4byte gUnknown_083DFEC4
_080F259C: .4byte 0x00000311
_080F25A0: .4byte 0x00006dad
_080F25A4: .4byte 0x00000312
_080F25A8: .4byte 0x04000050
	thumb_func_end sub_80F2170

	thumb_func_start sub_80F21F8
sub_80F21F8: @ 80F25AC
	ldr r0, _080F25C0
	ldr r0, [r0]
	ldr r1, _080F25C4
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080F25C8
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F25C0: .4byte gUnknown_083DFEC4
_080F25C4: .4byte 0x00000311
_080F25C8: .4byte 0x04000050
	thumb_func_end sub_80F21F8

	thumb_func_start sub_80F2218
sub_80F2218: @ 80F25CC
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	subs r0, 0x8
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x32]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bgt _080F25EA
	strh r3, [r2, 0x20]
	ldr r0, _080F25F0
	str r0, [r2, 0x1C]
_080F25EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F25F0: .4byte sub_80F22B0
	thumb_func_end sub_80F2218

	thumb_func_start sub_80F2240
sub_80F2240: @ 80F25F4
	push {r4,lr}
	adds r2, r0, 0
	ldr r0, _080F263C
	ldr r0, [r0]
	ldr r1, _080F2640
	adds r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080F2644
	ldrh r3, [r2, 0x38]
	movs r4, 0x38
	ldrsh r0, [r2, r4]
	cmp r0, 0
	beq _080F2624
	ldrh r0, [r2, 0x36]
	ldrh r4, [r2, 0x20]
	adds r1, r0, r4
	strh r1, [r2, 0x20]
	subs r0, r3, r0
	strh r0, [r2, 0x38]
_080F2624:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F265C
	adds r0, r2, 0
	bl sub_80F240C
	b _080F265C
	.align 2, 0
_080F263C: .4byte gUnknown_083DFEC4
_080F2640: .4byte 0x00006dad
_080F2644:
	ldrh r0, [r2, 0x20]
	adds r0, 0x8
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080F265C
	adds r0, r2, 0
	bl sub_80F240C
_080F265C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F2240

	thumb_func_start sub_80F22B0
sub_80F22B0: @ 80F2664
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F2690
	ldr r0, [r0]
	ldr r1, _080F2694
	adds r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080F2698
	ldrh r3, [r2, 0x24]
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	ble _080F26A6
	subs r0, r3, 0x4
	b _080F26A4
	.align 2, 0
_080F2690: .4byte gUnknown_083DFEC4
_080F2694: .4byte 0x00006dad
_080F2698:
	ldrh r1, [r2, 0x24]
	movs r3, 0x24
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bge _080F26A6
	adds r0, r1, 0x4
_080F26A4:
	strh r0, [r2, 0x24]
_080F26A6:
	pop {r0}
	bx r0
	thumb_func_end sub_80F22B0

	thumb_func_start sub_80F22F8
sub_80F22F8: @ 80F26AC
	push {r4-r7,lr}
	movs r3, 0
	ldr r0, _080F26F0
	ldr r1, [r0]
	ldr r2, _080F26F4
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r3, r0
	bge _080F270C
	movs r7, 0xC8
	lsls r7, 2
	adds r4, r1, r7
	movs r5, 0x10
	negs r5, r5
	adds r6, r0, 0
_080F26CE:
	movs r1, 0
	lsls r2, r3, 4
_080F26D2:
	lsls r0, r1, 2
	adds r0, r2
	adds r0, r4, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F270C
	movs r7, 0x24
	ldrsh r0, [r0, r7]
	cmp r0, 0
	beq _080F26F8
	cmp r0, r5
	beq _080F26F8
	movs r0, 0
	b _080F270E
	.align 2, 0
_080F26F0: .4byte gUnknown_083DFEC4
_080F26F4: .4byte 0x00006dae
_080F26F8:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F26D2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r6
	blt _080F26CE
_080F270C:
	movs r0, 0x1
_080F270E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F22F8

	thumb_func_start sub_80F2360
sub_80F2360: @ 80F2714
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _080F2754
	ldr r2, [r0]
	ldr r1, _080F2758
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r4, r1
	bge _080F2774
	ldr r3, _080F275C
	adds r0, r2, r3
	movs r6, 0
	ldrsb r6, [r0, r6]
	adds r5, r1, 0
_080F2732:
	cmp r4, r6
	beq _080F276A
	movs r1, 0
	ldr r0, _080F2754
	ldr r0, [r0]
	lsls r3, r4, 4
	movs r7, 0xC8
	lsls r7, 2
	adds r2, r0, r7
_080F2744:
	lsls r0, r1, 2
	adds r0, r3
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F2760
	movs r0, 0
	b _080F2776
	.align 2, 0
_080F2754: .4byte gUnknown_083DFEC4
_080F2758: .4byte 0x0000030e
_080F275C: .4byte 0x00006dad
_080F2760:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080F2744
_080F276A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	blt _080F2732
_080F2774:
	movs r0, 0x1
_080F2776:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F2360

	thumb_func_start sub_80F23C8
sub_80F23C8: @ 80F277C
	push {lr}
	movs r2, 0
	ldr r0, _080F27A8
	ldr r1, [r0]
	ldr r3, _080F27AC
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r3, r0, 4
	movs r0, 0xC8
	lsls r0, 2
	adds r1, r0
_080F2796:
	lsls r0, r2, 2
	adds r0, r3
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F27B0
	movs r0, 0
	b _080F27BC
	.align 2, 0
_080F27A8: .4byte gUnknown_083DFEC4
_080F27AC: .4byte 0x00006dad
_080F27B0:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080F2796
	movs r0, 0x1
_080F27BC:
	pop {r1}
	bx r1
	thumb_func_end sub_80F23C8

	thumb_func_start sub_80F240C
sub_80F240C: @ 80F27C0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080F2808
	ldr r2, [r0]
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r1, 2
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	lsls r0, 4
	adds r1, r0
	movs r0, 0xC8
	lsls r0, 2
	adds r2, r0
	adds r2, r1
	movs r0, 0
	str r0, [r2]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F27FA
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_080F27FA:
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2808: .4byte gUnknown_083DFEC4
	thumb_func_end sub_80F240C

	thumb_func_start sub_80F2458
sub_80F2458: @ 80F280C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	beq _080F2854
	cmp r4, 0x1
	bgt _080F2820
	cmp r4, 0
	beq _080F2826
	b _080F28B6
_080F2820:
	cmp r4, 0x2
	beq _080F2884
	b _080F28B6
_080F2826:
	ldr r2, _080F284C
	ldr r3, [r2]
	movs r0, 0xE0
	lsls r0, 2
	adds r1, r3, r0
	movs r5, 0xE2
	lsls r5, 2
	adds r0, r3, r5
	str r0, [r1]
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r3, r0
	movs r0, 0xA0
	lsls r0, 5
	strh r0, [r1]
	ldr r1, _080F2850
	adds r0, r3, r1
	strh r4, [r0]
	b _080F28AA
	.align 2, 0
_080F284C: .4byte gUnknown_083DFEC4
_080F2850: .4byte 0x00000386
_080F2854:
	ldr r4, _080F2878
	ldr r1, [r4]
	movs r3, 0xE0
	lsls r3, 2
	adds r2, r1, r3
	ldr r5, _080F287C
	adds r0, r1, r5
	str r0, [r2]
	movs r0, 0xE1
	lsls r0, 2
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0xC0
	lsls r0, 4
	strh r0, [r2]
	ldr r5, _080F2880
	adds r1, r5
	b _080F28A6
	.align 2, 0
_080F2878: .4byte gUnknown_083DFEC4
_080F287C: .4byte 0x00001788
_080F2880: .4byte 0x00000386
_080F2884:
	ldr r4, _080F28BC
	ldr r1, [r4]
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r1, r0
	ldr r3, _080F28C0
	adds r0, r1, r3
	str r0, [r2]
	movs r5, 0xE1
	lsls r5, 2
	adds r2, r1, r5
	movs r3, 0
	movs r0, 0xC0
	lsls r0, 5
	strh r0, [r2]
	ldr r0, _080F28C4
	adds r1, r0
_080F28A6:
	strh r3, [r1]
	adds r2, r4, 0
_080F28AA:
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 2
	adds r0, r1
	bl LoadSpriteSheet
_080F28B6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F28BC: .4byte gUnknown_083DFEC4
_080F28C0: .4byte 0x00002388
_080F28C4: .4byte 0x00000386
	thumb_func_end sub_80F2458

	thumb_func_start sub_80F2514
sub_80F2514: @ 80F28C8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080F290C
	cmp r0, 0x1
	bgt _080F28E0
	cmp r0, 0
	beq _080F28E6
	b _080F293A
_080F28E0:
	cmp r1, 0x2
	beq _080F291C
	b _080F293A
_080F28E6:
	ldr r0, _080F2900
	str r0, [sp]
	ldr r1, _080F2904
	mov r4, sp
	ldr r0, [sp, 0x4]
	ands r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	ldr r0, _080F2908
	b _080F292E
	.align 2, 0
_080F2900: .4byte gPokenavMenuOptions1_Pal
_080F2904: .4byte 0xffff0000
_080F2908: .4byte gPokenavMenuOptions2_Pal
_080F290C:
	ldr r0, _080F2918
	str r0, [sp]
	mov r1, sp
	movs r0, 0
	strh r0, [r1, 0x4]
	b _080F2934
	.align 2, 0
_080F2918: .4byte gPokenavConditionMenu_Pal
_080F291C:
	ldr r0, _080F2944
	str r0, [sp]
	mov r4, sp
	movs r0, 0
	strh r0, [r4, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	ldr r0, _080F2948
_080F292E:
	str r0, [sp]
	movs r0, 0x1
	strh r0, [r4, 0x4]
_080F2934:
	mov r0, sp
	bl LoadSpritePalette
_080F293A:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2944: .4byte gPokenavCondition6_Pal
_080F2948: .4byte gPokenavCondition7_Pal
	thumb_func_end sub_80F2514

	thumb_func_start sub_80F2598
sub_80F2598: @ 80F294C
	push {r4,lr}
	ldr r0, _080F29A4
	ldr r0, [r0]
	ldr r1, _080F29A8
	adds r4, r0, r1
	movs r0, 0
	str r0, [r4]
	ldr r1, _080F29AC
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082C0C
	cmp r0, 0x1
	bne _080F29CC
	ldr r0, _080F29B0
	bl LoadSpriteSheet
	ldr r0, _080F29B4
	bl LoadSpritePalette
	ldr r0, _080F29B8
	movs r1, 0xC
	movs r2, 0x60
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F29C0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F29BC
	adds r0, r1
	str r0, [r4]
	b _080F29CC
	.align 2, 0
_080F29A4: .4byte gUnknown_083DFEC4
_080F29A8: .4byte 0x00006d9c
_080F29AC: .4byte gSaveBlock1
_080F29B0: .4byte gSpriteSheet_PokenavBlueLight
_080F29B4: .4byte gSpritePalette_PokenavBlueLight
_080F29B8: .4byte gSpriteTemplate_83E4484
_080F29BC: .4byte gSprites
_080F29C0:
	movs r0, 0x19
	bl FreeSpriteTilesByTag
	movs r0, 0x11
	bl FreeSpritePaletteByTag
_080F29CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F2598

	thumb_func_start sub_80F2620
sub_80F2620: @ 80F29D4
	push {r4,lr}
	ldr r0, _080F2A00
	ldr r0, [r0]
	ldr r1, _080F2A04
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F29F8
	bl DestroySprite
	movs r0, 0x19
	bl FreeSpriteTilesByTag
	movs r0, 0x11
	bl FreeSpritePaletteByTag
	movs r0, 0
	str r0, [r4]
_080F29F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2A00: .4byte gUnknown_083DFEC4
_080F2A04: .4byte 0x00006d9c
	thumb_func_end sub_80F2620

	thumb_func_start sub_80F2654
sub_80F2654: @ 80F2A08
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080F2A36
	movs r0, 0
	strh r0, [r3, 0x2E]
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080F2A36:
	pop {r0}
	bx r0
	thumb_func_end sub_80F2654

	thumb_func_start sub_80F2688
sub_80F2688: @ 80F2A3C
	push {lr}
	ldr r0, _080F2A64
	ldr r0, [r0]
	ldr r1, _080F2A68
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F2A6C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F2A5E
_080F2A54:
	bl sub_80F26BC
	lsls r0, 24
	cmp r0, 0
	bne _080F2A54
_080F2A5E:
	pop {r0}
	bx r0
	.align 2, 0
_080F2A64: .4byte gUnknown_083DFEC4
_080F2A68: .4byte 0x00000306
_080F2A6C: .4byte 0x00006dac
	thumb_func_end sub_80F2688

	thumb_func_start sub_80F26BC
sub_80F26BC: @ 80F2A70
	push {lr}
	ldr r0, _080F2A8C
	ldr r0, [r0]
	ldr r1, _080F2A90
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x7
	bls _080F2A82
	b _080F2B70
_080F2A82:
	lsls r0, 2
	ldr r1, _080F2A94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2A8C: .4byte gUnknown_083DFEC4
_080F2A90: .4byte 0x00000306
_080F2A94: .4byte _080F2A98
	.align 2, 0
_080F2A98:
	.4byte _080F2AB8
	.4byte _080F2AD0
	.4byte _080F2AE8
	.4byte _080F2B00
	.4byte _080F2B18
	.4byte _080F2B30
	.4byte _080F2B48
	.4byte _080F2B64
_080F2AB8:
	ldr r0, _080F2AC4
	ldr r1, _080F2AC8
	ldr r1, [r1]
	ldr r2, _080F2ACC
	b _080F2B50
	.align 2, 0
_080F2AC4: .4byte gPokenavMainMenu_Gfx
_080F2AC8: .4byte gUnknown_083DFEC4
_080F2ACC: .4byte 0x00003b98
_080F2AD0:
	ldr r0, _080F2ADC
	ldr r1, _080F2AE0
	ldr r1, [r1]
	ldr r2, _080F2AE4
	b _080F2B50
	.align 2, 0
_080F2ADC: .4byte gPokenavConditionMenuHeader_Gfx
_080F2AE0: .4byte gUnknown_083DFEC4
_080F2AE4: .4byte 0x00004198
_080F2AE8:
	ldr r0, _080F2AF4
	ldr r1, _080F2AF8
	ldr r1, [r1]
	ldr r2, _080F2AFC
	b _080F2B50
	.align 2, 0
_080F2AF4: .4byte gPokenavRibbonsHeader_Gfx
_080F2AF8: .4byte gUnknown_083DFEC4
_080F2AFC: .4byte 0x00004d98
_080F2B00:
	ldr r0, _080F2B0C
	ldr r1, _080F2B10
	ldr r1, [r1]
	ldr r2, _080F2B14
	b _080F2B50
	.align 2, 0
_080F2B0C: .4byte gPokenavHoennMapHeader_Gfx
_080F2B10: .4byte gUnknown_083DFEC4
_080F2B14: .4byte 0x00005398
_080F2B18:
	ldr r0, _080F2B24
	ldr r1, _080F2B28
	ldr r1, [r1]
	ldr r2, _080F2B2C
	b _080F2B50
	.align 2, 0
_080F2B24: .4byte gPokenavConditionMenuOptions_Gfx
_080F2B28: .4byte gUnknown_083DFEC4
_080F2B2C: .4byte 0x00005f98
_080F2B30:
	ldr r0, _080F2B3C
	ldr r1, _080F2B40
	ldr r1, [r1]
	ldr r2, _080F2B44
	b _080F2B50
	.align 2, 0
_080F2B3C: .4byte gPokenavConditionMenuOptions2_Gfx
_080F2B40: .4byte gUnknown_083DFEC4
_080F2B44: .4byte 0x00006798
_080F2B48:
	ldr r0, _080F2B58
	ldr r1, _080F2B5C
	ldr r1, [r1]
	ldr r2, _080F2B60
_080F2B50:
	adds r1, r2
	bl LZ77UnCompWram
	b _080F2B74
	.align 2, 0
_080F2B58: .4byte gPokenavTrainersEyesHeader_Gfx
_080F2B5C: .4byte gUnknown_083DFEC4
_080F2B60: .4byte 0x00004798
_080F2B64:
	ldr r0, _080F2B6C
	bl LoadSpritePalettes
	b _080F2B74
	.align 2, 0
_080F2B6C: .4byte gUnknown_083E449C
_080F2B70:
	movs r0, 0
	b _080F2B84
_080F2B74:
	ldr r0, _080F2B88
	ldr r1, [r0]
	ldr r0, _080F2B8C
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F2B84:
	pop {r1}
	bx r1
	.align 2, 0
_080F2B88: .4byte gUnknown_083DFEC4
_080F2B8C: .4byte 0x00000306
	thumb_func_end sub_80F26BC

	thumb_func_start sub_80F27DC
sub_80F27DC: @ 80F2B90
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _080F2B9E
	b _080F2D54
_080F2B9E:
	lsls r0, 2
	ldr r1, _080F2BA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2BA8: .4byte _080F2BAC
	.align 2, 0
_080F2BAC:
	.4byte _080F2BDC
	.4byte _080F2C0C
	.4byte _080F2C6C
	.4byte _080F2C3C
	.4byte _080F2C9C
	.4byte _080F2CCC
	.4byte _080F2CDC
	.4byte _080F2D2C
	.4byte _080F2CEC
	.4byte _080F2CFC
	.4byte _080F2D1C
	.4byte _080F2D0C
_080F2BDC:
	ldr r0, _080F2BFC
	ldr r0, [r0]
	ldr r1, _080F2C00
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2C04
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F2C08
	ands r0, r1
	adds r1, 0x1
	b _080F2D4A
	.align 2, 0
_080F2BFC: .4byte gUnknown_083DFEC4
_080F2C00: .4byte 0x00003b98
_080F2C04: .4byte 0xffff0000
_080F2C08: .4byte 0x0000ffff
_080F2C0C:
	ldr r0, _080F2C2C
	ldr r0, [r0]
	ldr r1, _080F2C30
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2C34
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F2C38
	ands r0, r1
	adds r1, 0x1
	b _080F2D4A
	.align 2, 0
_080F2C2C: .4byte gUnknown_083DFEC4
_080F2C30: .4byte 0x00004198
_080F2C34: .4byte 0xffff0000
_080F2C38: .4byte 0x0000ffff
_080F2C3C:
	ldr r0, _080F2C5C
	ldr r0, [r0]
	ldr r1, _080F2C60
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2C64
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F2C68
	ands r0, r1
	adds r1, 0x1
	b _080F2D4A
	.align 2, 0
_080F2C5C: .4byte gUnknown_083DFEC4
_080F2C60: .4byte 0x00004798
_080F2C64: .4byte 0xffff0000
_080F2C68: .4byte 0x0000ffff
_080F2C6C:
	ldr r0, _080F2C8C
	ldr r0, [r0]
	ldr r1, _080F2C90
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2C94
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 3
	orrs r0, r1
	ldr r1, _080F2C98
	ands r0, r1
	adds r1, 0x1
	b _080F2D4A
	.align 2, 0
_080F2C8C: .4byte gUnknown_083DFEC4
_080F2C90: .4byte 0x00004d98
_080F2C94: .4byte 0xffff0000
_080F2C98: .4byte 0x0000ffff
_080F2C9C:
	ldr r0, _080F2CBC
	ldr r0, [r0]
	ldr r1, _080F2CC0
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2CC4
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 4
	orrs r0, r1
	ldr r1, _080F2CC8
	ands r0, r1
	adds r1, 0x1
	b _080F2D4A
	.align 2, 0
_080F2CBC: .4byte gUnknown_083DFEC4
_080F2CC0: .4byte 0x00005398
_080F2CC4: .4byte 0xffff0000
_080F2CC8: .4byte 0x0000ffff
_080F2CCC:
	ldr r0, _080F2CD4
	ldr r0, [r0]
	ldr r1, _080F2CD8
	b _080F2D32
	.align 2, 0
_080F2CD4: .4byte gUnknown_083DFEC4
_080F2CD8: .4byte 0x00005f98
_080F2CDC:
	ldr r0, _080F2CE4
	ldr r0, [r0]
	ldr r1, _080F2CE8
	b _080F2D32
	.align 2, 0
_080F2CE4: .4byte gUnknown_083DFEC4
_080F2CE8: .4byte 0x00006198
_080F2CEC:
	ldr r0, _080F2CF4
	ldr r0, [r0]
	ldr r1, _080F2CF8
	b _080F2D32
	.align 2, 0
_080F2CF4: .4byte gUnknown_083DFEC4
_080F2CF8: .4byte 0x00006398
_080F2CFC:
	ldr r0, _080F2D04
	ldr r0, [r0]
	ldr r1, _080F2D08
	b _080F2D32
	.align 2, 0
_080F2D04: .4byte gUnknown_083DFEC4
_080F2D08: .4byte 0x00006598
_080F2D0C:
	ldr r0, _080F2D14
	ldr r0, [r0]
	ldr r1, _080F2D18
	b _080F2D32
	.align 2, 0
_080F2D14: .4byte gUnknown_083DFEC4
_080F2D18: .4byte 0x00006998
_080F2D1C:
	ldr r0, _080F2D24
	ldr r0, [r0]
	ldr r1, _080F2D28
	b _080F2D32
	.align 2, 0
_080F2D24: .4byte gUnknown_083DFEC4
_080F2D28: .4byte 0x00006798
_080F2D2C:
	ldr r0, _080F2D5C
	ldr r0, [r0]
	ldr r1, _080F2D60
_080F2D32:
	adds r0, r1
	str r0, [sp]
	ldr r1, _080F2D64
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	ldr r1, _080F2D68
	ands r0, r1
	movs r1, 0x80
	lsls r1, 10
_080F2D4A:
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
_080F2D54:
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080F2D5C: .4byte gUnknown_083DFEC4
_080F2D60: .4byte 0x00006b98
_080F2D64: .4byte 0xffff0000
_080F2D68: .4byte 0x0000ffff
	thumb_func_end sub_80F27DC

	thumb_func_start sub_80F29B8
sub_80F29B8: @ 80F2D6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	cmp r7, 0xB
	bls _080F2D86
	b _080F2F5A
_080F2D86:
	lsls r0, r7, 2
	ldr r1, _080F2D90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2D90: .4byte _080F2D94
	.align 2, 0
_080F2D94:
	.4byte _080F2DC4
	.4byte _080F2DC4
	.4byte _080F2DC4
	.4byte _080F2DC4
	.4byte _080F2E0C
	.4byte _080F2E48
	.4byte _080F2E48
	.4byte _080F2E4C
	.4byte _080F2E48
	.4byte _080F2E48
	.4byte _080F2E4C
	.4byte _080F2E4C
_080F2DC4:
	ldr r3, _080F2DF8
	ldr r0, _080F2DFC
	ldr r2, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r0, r2, r1
	ldrh r1, [r0]
	movs r0, 0x31
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x8
	str r4, [sp]
	movs r1, 0x20
	str r1, [sp, 0x4]
	movs r1, 0x40
	ldr r4, _080F2E00
	adds r4, r2
	mov r9, r4
	ldr r2, _080F2E04
	mov r8, r2
	cmp r7, 0x3
	beq _080F2E7C
	ldr r4, _080F2E08
	mov r8, r4
	b _080F2E7C
	.align 2, 0
_080F2DF8: .4byte 0x0000ffa0
_080F2DFC: .4byte gUnknown_083DFEC4
_080F2E00: .4byte 0x00003b88
_080F2E04: .4byte gSpriteTemplate_83E44F8
_080F2E08: .4byte gSpriteTemplate_83E44E0
_080F2E0C:
	movs r3, 0x88
	lsls r3, 1
	ldr r0, _080F2E38
	ldr r2, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r0, r2, r1
	ldrh r1, [r0]
	movs r0, 0x31
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080F2E3C
	str r4, [sp]
	movs r1, 0x98
	str r1, [sp, 0x4]
	movs r1, 0x40
	ldr r4, _080F2E40
	mov r8, r4
	ldr r4, _080F2E44
	b _080F2E78
	.align 2, 0
_080F2E38: .4byte gUnknown_083DFEC4
_080F2E3C: .4byte 0x0000fff8
_080F2E40: .4byte gSpriteTemplate_83E44E0
_080F2E44: .4byte 0x00003b88
_080F2E48:
	ldr r0, _080F2EF4
	mov r8, r0
_080F2E4C:
	mov r1, r8
	cmp r1, 0
	bne _080F2E56
	ldr r2, _080F2EF8
	mov r8, r2
_080F2E56:
	ldr r3, _080F2EFC
	ldr r0, _080F2F00
	ldr r2, [r0]
	movs r4, 0xC3
	lsls r4, 2
	adds r0, r2, r4
	ldrh r1, [r0]
	movs r0, 0x44
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x8
	str r1, [sp]
	movs r4, 0x10
	str r4, [sp, 0x4]
	movs r1, 0x20
	ldr r4, _080F2F04
_080F2E78:
	adds r4, r2
	mov r9, r4
_080F2E7C:
	movs r6, 0
	lsls r1, 16
	str r1, [sp, 0x10]
	lsls r3, 16
	str r3, [sp, 0x8]
	lsls r0, 16
	str r0, [sp, 0xC]
	ldr r0, _080F2F08
	mov r10, r0
_080F2E8E:
	ldr r1, [sp, 0x10]
	asrs r0, r1, 16
	adds r5, r6, 0
	muls r5, r0
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	adds r1, r5
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	ldr r3, [sp, 0xC]
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _080F2F50
	lsls r0, r4, 4
	adds r1, r0, r4
	lsls r1, 2
	mov r2, r10
	adds r3, r1, r2
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r3, 0x2E]
	ldr r2, [sp, 0x4]
	adds r1, r2, r5
	strh r1, [r3, 0x30]
	strh r6, [r3, 0x32]
	strh r7, [r3, 0x34]
	adds r5, r0, 0
	cmp r7, 0x4
	bne _080F2F10
	cmp r6, 0x1
	bne _080F2F10
	ldr r0, _080F2F00
	ldr r0, [r0]
	ldr r1, _080F2F0C
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	cmp r0, 0
	bne _080F2EEA
	movs r1, 0x1
_080F2EEA:
	adds r0, r3, 0
	bl StartSpriteAnim
	b _080F2F1E
	.align 2, 0
_080F2EF4: .4byte gSpriteTemplate_83E4530
_080F2EF8: .4byte gSpriteTemplate_83E4548
_080F2EFC: .4byte 0x0000ffa0
_080F2F00: .4byte gUnknown_083DFEC4
_080F2F04: .4byte 0x00003b90
_080F2F08: .4byte gSprites
_080F2F0C: .4byte 0x00006e90
_080F2F10:
	adds r0, r5, r4
	lsls r0, 2
	add r0, r10
	lsls r1, r6, 24
	lsrs r1, 24
	bl StartSpriteAnim
_080F2F1E:
	ldr r2, _080F2F6C
	mov r12, r2
	cmp r7, 0x3
	bhi _080F2F44
	cmp r6, 0x1
	bne _080F2F44
	adds r2, r5, r4
	lsls r2, 2
	add r2, r10
	ldrb r3, [r2, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r3
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2, 0x3]
_080F2F44:
	lsls r1, r6, 2
	add r1, r9
	adds r0, r5, r4
	lsls r0, 2
	add r0, r12
	str r0, [r1]
_080F2F50:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1
	bls _080F2E8E
_080F2F5A:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2F6C: .4byte gSprites
	thumb_func_end sub_80F29B8

	thumb_func_start sub_80F2BBC
sub_80F2BBC: @ 80F2F70
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	ldrh r1, [r2, 0x2E]
	adds r3, r0, r1
	strh r3, [r2, 0x20]
	lsls r0, 16
	asrs r4, r0, 16
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r4, r1
	bgt _080F2F94
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	bge _080F2F9C
	cmp r4, r1
	blt _080F2FBC
_080F2F94:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	bgt _080F2FBC
_080F2F9C:
	ldrh r0, [r2, 0x30]
	strh r0, [r2, 0x20]
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bne _080F2FB8
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080F2FB8
	ldr r0, _080F2FB4
	b _080F2FBA
	.align 2, 0
_080F2FB4: .4byte sub_80F2C58
_080F2FB8:
	ldr r0, _080F2FC4
_080F2FBA:
	str r0, [r2, 0x1C]
_080F2FBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F2FC4: .4byte SpriteCallbackDummy
	thumb_func_end sub_80F2BBC

	thumb_func_start sub_80F2C14
sub_80F2C14: @ 80F2FC8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	ldrh r1, [r4, 0x2E]
	subs r0, r1
	strh r0, [r4, 0x20]
	adds r0, 0x20
	lsls r0, 16
	movs r1, 0x98
	lsls r1, 17
	cmp r0, r1
	bls _080F3004
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080F2FFE
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _080F2FF8
	movs r0, 0x1
	bl FreeSpriteTilesByTag
	b _080F2FFE
_080F2FF8:
	movs r0, 0x2
	bl FreeSpriteTilesByTag
_080F2FFE:
	adds r0, r4, 0
	bl DestroySprite
_080F3004:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F2C14

	thumb_func_start sub_80F2C58
sub_80F2C58: @ 80F300C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F302C
	ldr r0, [r0]
	ldr r1, _080F3030
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x2
	cmp r0, 0
	bne _080F3022
	movs r1, 0x1
_080F3022:
	adds r0, r2, 0
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080F302C: .4byte gUnknown_083DFEC4
_080F3030: .4byte 0x00006e90
	thumb_func_end sub_80F2C58

	thumb_func_start sub_80F2C80
sub_80F2C80: @ 80F3034
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080F3064
	ldr r0, [r0]
	ldr r1, _080F3068
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F306C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F305C
_080F3050:
	adds r0, r4, 0
	bl sub_80F2CBC
	lsls r0, 24
	cmp r0, 0
	bne _080F3050
_080F305C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3064: .4byte gUnknown_083DFEC4
_080F3068: .4byte 0x00000306
_080F306C: .4byte 0x00006dac
	thumb_func_end sub_80F2C80

	thumb_func_start sub_80F2CBC
sub_80F2CBC: @ 80F3070
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080F308C
	ldr r0, [r0]
	ldr r2, _080F3090
	adds r4, r0, r2
	ldrh r0, [r4]
	cmp r0, 0
	beq _080F3094
	cmp r0, 0x1
	beq _080F30A4
	b _080F30B0
	.align 2, 0
_080F308C: .4byte gUnknown_083DFEC4
_080F3090: .4byte 0x00000306
_080F3094:
	adds r0, r1, 0
	bl sub_80F27DC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	movs r0, 0x1
	b _080F30B2
_080F30A4:
	adds r0, r1, 0
	bl sub_80F29B8
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080F30B0:
	movs r0, 0
_080F30B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F2CBC

	thumb_func_start sub_80F2D04
sub_80F2D04: @ 80F30B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F30F0
	movs r1, 0
	ldr r0, _080F30E4
	ldr r0, [r0]
	ldr r3, _080F30E8
	adds r2, r0, r3
	ldr r3, _080F30EC
_080F30CE:
	lsls r0, r1, 2
	adds r0, r2, r0
	ldr r0, [r0]
	str r3, [r0, 0x1C]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _080F30CE
	b _080F310E
	.align 2, 0
_080F30E4: .4byte gUnknown_083DFEC4
_080F30E8: .4byte 0x00003b88
_080F30EC: .4byte sub_80F2C14
_080F30F0:
	movs r1, 0
	ldr r0, _080F3114
	ldr r0, [r0]
	ldr r3, _080F3118
	adds r2, r0, r3
	ldr r3, _080F311C
_080F30FC:
	lsls r0, r1, 2
	adds r0, r2, r0
	ldr r0, [r0]
	str r3, [r0, 0x1C]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _080F30FC
_080F310E:
	pop {r0}
	bx r0
	.align 2, 0
_080F3114: .4byte gUnknown_083DFEC4
_080F3118: .4byte 0x00003b90
_080F311C: .4byte sub_80F2C14
	thumb_func_end sub_80F2D04

	thumb_func_start sub_80F2D6C
sub_80F2D6C: @ 80F3120
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F3158
	movs r0, 0x1
	bl FreeSpriteTilesByTag
	movs r4, 0
	ldr r0, _080F3150
	ldr r0, [r0]
	ldr r1, _080F3154
	adds r5, r0, r1
_080F313A:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F313A
	b _080F317C
	.align 2, 0
_080F3150: .4byte gUnknown_083DFEC4
_080F3154: .4byte 0x00003b88
_080F3158:
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	movs r4, 0
	ldr r0, _080F3184
	ldr r0, [r0]
	ldr r1, _080F3188
	adds r5, r0, r1
_080F3168:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F3168
_080F317C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3184: .4byte gUnknown_083DFEC4
_080F3188: .4byte 0x00003b90
	thumb_func_end sub_80F2D6C

	thumb_func_start sub_80F2DD8
sub_80F2DD8: @ 80F318C
	push {lr}
	movs r0, 0x7
	movs r1, 0x7
	bl sub_80FBB3C
	movs r0, 0x8
	movs r1, 0x8
	bl sub_80FBCF0
	bl sub_80FBF94
	pop {r0}
	bx r0
	thumb_func_end sub_80F2DD8

	thumb_func_start sub_80F2DF4
sub_80F2DF4: @ 80F31A8
	push {lr}
	bl sub_80FAB10
	pop {r0}
	bx r0
	thumb_func_end sub_80F2DF4

	thumb_func_start sub_80F2E00
sub_80F2E00: @ 80F31B4
	ldr r1, _080F31C4
	ldr r1, [r1]
	ldr r2, _080F31C8
	adds r1, r2
	ldrh r1, [r1]
	adds r1, 0x26
	strh r1, [r0, 0x20]
	bx lr
	.align 2, 0
_080F31C4: .4byte gUnknown_083DFEC4
_080F31C8: .4byte 0x00008766
	thumb_func_end sub_80F2E00

	thumb_func_start sub_80F2E18
sub_80F2E18: @ 80F31CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080F325C
	ldr r4, [r0]
	ldr r0, _080F3260
	adds r7, r4, r0
	ldr r1, [r7]
	mov r8, r1
	cmp r1, 0
	bne _080F32B0
	ldr r0, _080F3264
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _080F3268
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldr r0, _080F326C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	lsls r0, r3, 13
	ldr r1, _080F3270
	adds r0, r1
	adds r0, r4, r0
	str r0, [sp, 0x20]
	lsls r0, r3, 7
	adds r0, r4, r0
	str r0, [sp, 0x18]
	add r0, sp, 0x18
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F3274
	adds r5, r4, r2
	strh r0, [r5]
	add r0, sp, 0x20
	bl LoadSpriteSheet
	ldr r1, _080F3278
	adds r6, r4, r1
	strh r0, [r6]
	mov r0, sp
	movs r1, 0x26
	movs r2, 0x68
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F327C
	movs r0, 0x6
	bl FreeSpriteTilesByTag
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	mov r2, r8
	str r2, [r7]
	b _080F32DA
	.align 2, 0
_080F325C: .4byte gUnknown_083DFEC4
_080F3260: .4byte 0x00008768
_080F3264: .4byte gUnknown_083E4568
_080F3268: .4byte gSpriteTemplate_83E4570
_080F326C: .4byte gUnknown_083E4588
_080F3270: .4byte 0x0000d1e4
_080F3274: .4byte 0x0000d1dc
_080F3278: .4byte 0x0000d1de
_080F327C:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F32A4
	adds r0, r1
	str r0, [r7]
	ldr r0, _080F32A8
	adds r1, r4, r0
	ldrh r0, [r6]
	lsls r0, 5
	ldr r2, _080F32AC
	adds r0, r2
	str r0, [r1]
	ldrh r0, [r5]
	lsls r0, 4
	movs r6, 0x80
	lsls r6, 1
	adds r0, r6
	strh r0, [r5]
	b _080F32DA
	.align 2, 0
_080F32A4: .4byte gSprites
_080F32A8: .4byte 0x0000d1e0
_080F32AC: .4byte 0x06010000
_080F32B0:
	lsls r0, r3, 13
	ldr r1, _080F32E8
	adds r0, r1
	adds r0, r4, r0
	ldr r2, _080F32EC
	adds r1, r4, r2
	ldr r2, [r1]
	ldr r1, _080F32F0
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080F32F4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	lsls r0, r3, 7
	adds r0, r4, r0
	ldr r5, _080F32F8
	adds r1, r4, r5
	ldrh r1, [r1]
	movs r2, 0x20
	bl LoadPalette
_080F32DA:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F32E8: .4byte 0x0000d1e4
_080F32EC: .4byte 0x0000d1e0
_080F32F0: .4byte 0x040000d4
_080F32F4: .4byte 0x80000400
_080F32F8: .4byte 0x0000d1dc
	thumb_func_end sub_80F2E18

	thumb_func_start sub_80F2F48
sub_80F2F48: @ 80F32FC
	push {r4,lr}
	ldr r0, _080F3328
	ldr r0, [r0]
	ldr r1, _080F332C
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3320
	bl DestroySprite
	movs r0, 0x6
	bl FreeSpriteTilesByTag
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	movs r0, 0
	str r0, [r4]
_080F3320:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3328: .4byte gUnknown_083DFEC4
_080F332C: .4byte 0x00008768
	thumb_func_end sub_80F2F48

	thumb_func_start sub_80F2F7C
sub_80F2F7C: @ 80F3330
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80F2E18
	ldr r0, _080F3354
	ldr r0, [r0]
	ldr r1, _080F3358
	adds r2, r0, r1
	ldr r1, _080F335C
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	ldr r0, _080F3360
	str r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080F3354: .4byte gUnknown_083DFEC4
_080F3358: .4byte 0x0000ced0
_080F335C: .4byte 0x00008768
_080F3360: .4byte sub_80F2FEC
	thumb_func_end sub_80F2F7C

	thumb_func_start sub_80F2FB0
sub_80F2FB0: @ 80F3364
	push {r4,r5,lr}
	ldr r0, _080F3394
	ldr r5, [r0]
	ldr r0, _080F3398
	adds r4, r5, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F338E
	bl DestroySprite
	movs r0, 0x6
	bl FreeSpriteTilesByTag
	movs r0, 0x6
	bl FreeSpritePaletteByTag
	movs r1, 0
	str r1, [r4]
	ldr r2, _080F339C
	adds r0, r5, r2
	str r1, [r0]
_080F338E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F3394: .4byte gUnknown_083DFEC4
_080F3398: .4byte 0x0000ced0
_080F339C: .4byte 0x00008768
	thumb_func_end sub_80F2FB0

	thumb_func_start sub_80F2FEC
sub_80F2FEC: @ 80F33A0
	ldr r1, _080F33B4
	ldr r1, [r1]
	ldr r2, _080F33B8
	adds r1, r2
	ldrh r1, [r1]
	adds r1, 0x28
	strh r1, [r0, 0x20]
	movs r1, 0x68
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080F33B4: .4byte gUnknown_083DFEC4
_080F33B8: .4byte 0x0000d15a
	thumb_func_end sub_80F2FEC

	thumb_func_start sub_80F3008
sub_80F3008: @ 80F33BC
	push {r4,r5,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r2, r0, 24
	mov r1, sp
	ldr r0, _080F3414
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldr r0, _080F3418
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	cmp r2, 0x2
	bgt _080F33E6
	cmp r2, 0x1
	blt _080F33E6
	ldr r0, _080F341C
	str r0, [sp, 0x18]
_080F33E6:
	mov r0, sp
	bl LoadSpriteSheets
	add r0, sp, 0x18
	bl LoadSpritePalette
	ldr r0, _080F3420
	movs r1, 0x5F
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F342C
	ldr r0, _080F3424
	ldr r0, [r0]
	ldr r1, _080F3428
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _080F34D4
	.align 2, 0
_080F3414: .4byte gUnknown_083E4590
_080F3418: .4byte gUnknown_083E45A8
_080F341C: .4byte gUnknown_08E9F988
_080F3420: .4byte gSpriteTemplate_83E45B8
_080F3424: .4byte gUnknown_083DFEC4
_080F3428: .4byte 0x000087cc
_080F342C:
	ldr r0, _080F34A8
	ldr r2, [r0]
	ldr r3, _080F34AC
	adds r2, r3
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F34B0
	adds r0, r1
	str r0, [r2]
	movs r4, 0
	movs r5, 0
_080F3444:
	lsls r2, r4, 7
	adds r2, 0x8
	lsls r2, 16
	asrs r2, 16
	ldr r0, _080F34B4
	movs r1, 0xA8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F34BC
	ldr r0, _080F34A8
	ldr r2, [r0]
	lsls r0, r4, 2
	ldr r3, _080F34B8
	adds r2, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F34B0
	adds r3, r0, r1
	str r3, [r2]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r3, 0x2E]
	strh r5, [r3, 0x30]
	movs r0, 0x1
	cmp r4, 0
	bne _080F3492
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
_080F3492:
	strh r0, [r3, 0x32]
	strh r4, [r3, 0x34]
	movs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r1, r4, 24
	lsrs r1, 24
	adds r0, r3, 0
	bl StartSpriteAnim
	b _080F34CA
	.align 2, 0
_080F34A8: .4byte gUnknown_083DFEC4
_080F34AC: .4byte 0x000087cc
_080F34B0: .4byte gSprites
_080F34B4: .4byte gSpriteTemplate_83E45F0
_080F34B8: .4byte 0x000087d0
_080F34BC:
	ldr r0, _080F34DC
	ldr r0, [r0]
	lsls r1, r4, 2
	ldr r2, _080F34E0
	adds r0, r2
	adds r0, r1
	str r5, [r0]
_080F34CA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F3444
_080F34D4:
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F34DC: .4byte gUnknown_083DFEC4
_080F34E0: .4byte 0x000087d0
	thumb_func_end sub_80F3008

	thumb_func_start sub_80F3130
sub_80F3130: @ 80F34E4
	push {r4-r6,lr}
	ldr r0, _080F3538
	ldr r6, [r0]
	ldr r0, _080F353C
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3508
	bl DestroySprite
	movs r0, 0x9
	bl FreeSpriteTilesByTag
	movs r0, 0x9
	bl FreeSpritePaletteByTag
	movs r0, 0
	str r0, [r4]
_080F3508:
	movs r5, 0
	ldr r0, _080F3540
	adds r6, r0
_080F350E:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F3520
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
_080F3520:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080F350E
	movs r0, 0xA
	bl FreeSpriteTilesByTag
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F3538: .4byte gUnknown_083DFEC4
_080F353C: .4byte 0x000087cc
_080F3540: .4byte 0x000087d0
	thumb_func_end sub_80F3130

	thumb_func_start sub_80F3190
sub_80F3190: @ 80F3544
	ldr r1, _080F3558
	ldr r1, [r1]
	ldr r2, _080F355C
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r1, 4
	adds r1, 0x10
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080F3558: .4byte gUnknown_083DFEC4
_080F355C: .4byte 0x0000876c
	thumb_func_end sub_80F3190

	thumb_func_start sub_80F31AC
sub_80F31AC: @ 80F3560
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _080F359C
	ldr r1, [r0]
	ldr r2, _080F35A0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F3610
	movs r4, 0x36
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _080F35DA
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	cmp r0, 0
	bne _080F35A8
	movs r2, 0
	ldr r4, _080F35A4
	adds r0, r1, r4
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0
	bne _080F3592
	movs r2, 0x1
_080F3592:
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r2, 2
	b _080F35C8
	.align 2, 0
_080F359C: .4byte gUnknown_083DFEC4
_080F35A0: .4byte 0x000087c9
_080F35A4: .4byte 0x00008770
_080F35A8:
	movs r4, 0
	ldr r2, _080F3604
	adds r0, r1, r2
	ldr r5, _080F3608
	adds r1, r5
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r2, r0
	bne _080F35C0
	movs r4, 0x1
_080F35C0:
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	lsls r2, r4, 2
_080F35C8:
	ldrb r1, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	strh r0, [r3, 0x36]
_080F35DA:
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080F3610
	strh r1, [r3, 0x2E]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080F360C
	ldrh r0, [r3, 0x32]
	ldrh r2, [r3, 0x26]
	adds r0, r2
	strh r0, [r3, 0x26]
	b _080F3610
	.align 2, 0
_080F3604: .4byte 0x00008772
_080F3608: .4byte 0x00008774
_080F360C:
	strh r1, [r3, 0x30]
	strh r1, [r3, 0x26]
_080F3610:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F31AC

	thumb_func_start sub_80F3264
sub_80F3264: @ 80F3618
	push {lr}
	movs r1, 0
	ldr r0, _080F3640
	ldr r0, [r0]
	ldr r3, _080F3644
	adds r2, r0, r3
	movs r3, 0x1
_080F3626:
	lsls r0, r1, 2
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F3632
	strh r3, [r0, 0x36]
_080F3632:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _080F3626
	pop {r0}
	bx r0
	.align 2, 0
_080F3640: .4byte gUnknown_083DFEC4
_080F3644: .4byte 0x000087d0
	thumb_func_end sub_80F3264

	thumb_func_start sub_80F3294
sub_80F3294: @ 80F3648
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080F36A8
	ldr r4, [r0]
	ldr r1, _080F36AC
	adds r0, r4, r1
	ldr r2, [r0]
	adds r2, 0x3E
	movs r0, 0x1
	adds r1, r6, 0
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _080F36B0
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F36CE
	cmp r6, 0x1
	bne _080F36BC
	ldr r1, _080F36B4
	adds r0, r4, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	ldr r2, _080F36B8
	adds r0, r4, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r5, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	b _080F36CE
	.align 2, 0
_080F36A8: .4byte gUnknown_083DFEC4
_080F36AC: .4byte 0x000087cc
_080F36B0: .4byte 0x000087c9
_080F36B4: .4byte 0x000087d0
_080F36B8: .4byte 0x000087d4
_080F36BC:
	ldr r1, _080F36D4
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x1
	strh r1, [r0, 0x36]
	ldr r2, _080F36D8
	adds r0, r4, r2
	ldr r0, [r0]
	strh r1, [r0, 0x36]
_080F36CE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F36D4: .4byte 0x000087d0
_080F36D8: .4byte 0x000087d4
	thumb_func_end sub_80F3294

	thumb_func_start sub_80F3328
sub_80F3328: @ 80F36DC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F3700
	ldr r0, [r0]
	ldr r1, _080F3704
	adds r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _080F3708
	adds r0, r2, 0
	movs r1, 0
	bl StartSpriteAnim
	b _080F3710
	.align 2, 0
_080F3700: .4byte gUnknown_083DFEC4
_080F3704: .4byte 0x000087dc
_080F3708:
	adds r0, r2, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080F3710:
	pop {r0}
	bx r0
	thumb_func_end sub_80F3328

	thumb_func_start sub_80F3360
sub_80F3360: @ 80F3714
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080F3738
	ldr r0, [r0]
	ldr r2, _080F373C
	adds r1, r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	ldr r2, _080F3740
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	cmp r1, r0
	bne _080F3744
	movs r0, 0x4
	b _080F3746
	.align 2, 0
_080F3738: .4byte gUnknown_083DFEC4
_080F373C: .4byte 0x000087dc
_080F3740: .4byte 0x000087da
_080F3744:
	movs r0, 0x5
_080F3746:
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F3360

	thumb_func_start sub_80F33A8
sub_80F33A8: @ 80F375C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x50
	mov r1, sp
	ldr r0, _080F37F4
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r3,r4}
	stm r1!, {r3,r4}
	add r4, sp, 0x20
	adds r1, r4, 0
	ldr r0, _080F37F8
	ldm r0!, {r2,r5,r6}
	stm r1!, {r2,r5,r6}
	ldm r0!, {r3,r5,r6}
	stm r1!, {r3,r5,r6}
	add r5, sp, 0x38
	adds r1, r5, 0
	ldr r0, _080F37FC
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	movs r6, 0
	ldr r2, _080F3800
	ldr r1, [r2]
	ldr r3, _080F3804
	adds r0, r1, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	subs r0, 0x1
	adds r7, r5, 0
	cmp r6, r0
	bge _080F382E
	adds r5, r2, 0
	adds r0, r3, 0
	adds r0, r1
	mov r8, r0
_080F37BA:
	lsls r4, r6, 2
	adds r2, r4, r6
	lsls r2, 18
	movs r1, 0x80
	lsls r1, 12
	adds r2, r1
	asrs r2, 16
	adds r0, r7, 0
	movs r1, 0xE2
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F3810
	ldr r0, [r5]
	ldr r2, _080F3808
	adds r0, r2
	adds r0, r4
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r2, _080F380C
	adds r1, r2
	str r1, [r0]
	strh r6, [r1, 0x2E]
	b _080F381C
	.align 2, 0
_080F37F4: .4byte gUnknown_083E4628
_080F37F8: .4byte gUnknown_083E4648
_080F37FC: .4byte gSpriteTemplate_83E4660
_080F3800: .4byte gUnknown_083DFEC4
_080F3804: .4byte 0x000087da
_080F3808: .4byte 0x000087e4
_080F380C: .4byte gSprites
_080F3810:
	ldr r0, [r5]
	ldr r3, _080F387C
	adds r0, r3
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_080F381C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r4, r8
	movs r1, 0
	ldrsh r0, [r4, r1]
	subs r0, 0x1
	cmp r6, r0
	blt _080F37BA
_080F382E:
	movs r0, 0x4
	strh r0, [r7]
	ldr r0, _080F3880
	str r0, [r7, 0x14]
	cmp r6, 0x5
	bhi _080F38A2
	ldr r5, _080F3884
_080F383C:
	lsls r4, r6, 2
	adds r2, r4, r6
	lsls r2, 18
	movs r3, 0x80
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	adds r0, r7, 0
	movs r1, 0xE6
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F388C
	ldr r2, [r5]
	ldr r0, _080F387C
	adds r2, r0
	adds r2, r4
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r0, _080F3888
	adds r1, r0
	str r1, [r2]
	ldrb r2, [r1, 0x3]
	movs r0, 0x3F
	ands r0, r2
	strb r0, [r1, 0x3]
	b _080F3898
	.align 2, 0
_080F387C: .4byte 0x000087e4
_080F3880: .4byte SpriteCallbackDummy
_080F3884: .4byte gUnknown_083DFEC4
_080F3888: .4byte gSprites
_080F388C:
	ldr r0, [r5]
	ldr r1, _080F38FC
	adds r0, r1
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_080F3898:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080F383C
_080F38A2:
	movs r0, 0x5
	strh r0, [r7]
	ldr r0, _080F3900
	str r0, [r7, 0x14]
	lsls r5, r6, 2
	adds r2, r5, r6
	lsls r2, 18
	movs r3, 0x80
	lsls r3, 12
	adds r2, r3
	asrs r2, 16
	adds r0, r7, 0
	movs r1, 0xDE
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F390C
	ldr r0, _080F3904
	ldr r4, [r0]
	ldr r6, _080F38FC
	adds r4, r6
	adds r4, r5
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	ldr r0, _080F3908
	adds r1, r0
	str r1, [r4]
	ldrb r3, [r1, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x40
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldr r1, [r4]
	ldrb r0, [r1, 0x3]
	ands r2, r0
	movs r0, 0x80
	orrs r2, r0
	strb r2, [r1, 0x3]
	b _080F391A
	.align 2, 0
_080F38FC: .4byte 0x000087e4
_080F3900: .4byte sub_80F3360
_080F3904: .4byte gUnknown_083DFEC4
_080F3908: .4byte gSprites
_080F390C:
	ldr r0, _080F3928
	ldr r0, [r0]
	ldr r1, _080F392C
	adds r0, r1
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_080F391A:
	add sp, 0x50
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F3928: .4byte gUnknown_083DFEC4
_080F392C: .4byte 0x000087e4
	thumb_func_end sub_80F33A8

	thumb_func_start sub_80F357C
sub_80F357C: @ 80F3930
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _080F3960
	ldr r0, [r0]
	ldr r1, _080F3964
	adds r6, r0, r1
_080F393C:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F394E
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
_080F394E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080F393C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F3960: .4byte gUnknown_083DFEC4
_080F3964: .4byte 0x000087e4
	thumb_func_end sub_80F357C

	thumb_func_start sub_80F35B4
sub_80F35B4: @ 80F3968
	push {r4,lr}
	ldr r0, _080F39B0
	ldr r4, [r0]
	ldr r1, _080F39B4
	adds r0, r4, r1
	movs r1, 0x1C
	strh r1, [r0]
	ldr r1, _080F39B8
	adds r2, r4, r1
	movs r1, 0x13
	strh r1, [r2]
	bl sub_80F727C
	bl sub_80F7404
	ldr r2, _080F39BC
	movs r0, 0x1B
	movs r1, 0x15
	bl sub_80F7920
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0xC0
	strh r1, [r0, 0x20]
	movs r1, 0x20
	strh r1, [r0, 0x22]
	ldr r1, _080F39C0
	str r1, [r0, 0x1C]
	ldr r1, _080F39C4
	adds r4, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F39B0: .4byte gUnknown_083DFEC4
_080F39B4: .4byte 0x000076b0
_080F39B8: .4byte 0x000076b2
_080F39BC: .4byte gUnknown_083E4678
_080F39C0: .4byte sub_80F363C
_080F39C4: .4byte 0x000076ac
	thumb_func_end sub_80F35B4

	thumb_func_start sub_80F3614
sub_80F3614: @ 80F39C8
	push {lr}
	ldr r0, _080F39E8
	ldr r0, [r0]
	ldr r1, _080F39EC
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	movs r0, 0x1B
	bl FreeSpriteTilesByTag
	movs r0, 0x15
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080F39E8: .4byte gUnknown_083DFEC4
_080F39EC: .4byte 0x000076ac
	thumb_func_end sub_80F3614

	thumb_func_start sub_80F363C
sub_80F363C: @ 80F39F0
	push {lr}
	ldr r1, _080F3A10
	ldr r1, [r1]
	ldr r3, _080F3A14
	adds r2, r1, r3
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	ldr r3, _080F3A18
	adds r1, r3
	adds r1, r2
	ldrb r1, [r1]
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080F3A10: .4byte gUnknown_083DFEC4
_080F3A14: .4byte 0x00008fe9
_080F3A18: .4byte 0x00008934
	thumb_func_end sub_80F363C

	thumb_func_start sub_80F3668
sub_80F3668: @ 80F3A1C
	push {lr}
	ldr r0, _080F3A40
	ldr r0, [r0]
	ldr r2, _080F3A44
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldr r2, _080F3A48
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0xB0
	movs r2, 0x20
	bl sub_80F7418
	pop {r0}
	bx r0
	.align 2, 0
_080F3A40: .4byte gUnknown_083DFEC4
_080F3A44: .4byte 0x00008fe9
_080F3A48: .4byte 0x00008934
	thumb_func_end sub_80F3668

	thumb_func_start sub_80F3698
sub_80F3698: @ 80F3A4C
	push {r4,lr}
	ldr r0, _080F3A90
	ldr r3, [r0]
	ldr r1, _080F3A94
	adds r0, r3, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r1, 2
	ldr r4, _080F3A98
	adds r1, r4
	adds r1, r3, r1
	ldr r2, _080F3A9C
	adds r0, r3, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	subs r4, 0x8
	adds r0, r3, r4
	adds r0, r2
	ldr r2, _080F3AA0
	adds r3, r2
	ldrb r2, [r3]
	strb r2, [r0]
	ldrb r0, [r1, 0x1]
	ldr r1, [r1]
	lsls r1, 11
	lsrs r1, 27
	ldrb r2, [r3]
	bl sub_80F4548
	bl sub_80F7470
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3A90: .4byte gUnknown_083DFEC4
_080F3A94: .4byte 0x000087dc
_080F3A98: .4byte 0x0000893c
_080F3A9C: .4byte 0x00008fe9
_080F3AA0: .4byte 0x000076b4
	thumb_func_end sub_80F3698

	thumb_func_start sub_80F36F0
sub_80F36F0: @ 80F3AA4
	push {lr}
	ldr r0, _080F3ACC
	ldr r0, [r0]
	ldr r1, _080F3AD0
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F3AD4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F3AC6
_080F3ABC:
	bl sub_80F3724
	lsls r0, 24
	cmp r0, 0
	bne _080F3ABC
_080F3AC6:
	pop {r0}
	bx r0
	.align 2, 0
_080F3ACC: .4byte gUnknown_083DFEC4
_080F3AD0: .4byte 0x00000306
_080F3AD4: .4byte 0x00006dac
	thumb_func_end sub_80F36F0

	thumb_func_start sub_80F3724
sub_80F3724: @ 80F3AD8
	push {r4,lr}
	ldr r0, _080F3AF4
	ldr r1, [r0]
	ldr r0, _080F3AF8
	adds r4, r1, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _080F3B18
	cmp r0, 0x1
	bgt _080F3AFC
	cmp r0, 0
	beq _080F3B02
	b _080F3B2E
	.align 2, 0
_080F3AF4: .4byte gUnknown_083DFEC4
_080F3AF8: .4byte 0x00000306
_080F3AFC:
	cmp r0, 0x2
	beq _080F3B22
	b _080F3B2E
_080F3B02:
	ldr r0, _080F3B10
	ldr r2, _080F3B14
	adds r1, r2
	bl LZ77UnCompWram
	b _080F3B32
	.align 2, 0
_080F3B10: .4byte gUnknown_083E3D00
_080F3B14: .4byte 0x0000984c
_080F3B18:
	bl sub_80F379C
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080F3B22:
	bl sub_80F37D0
	lsls r0, 24
	cmp r0, 0
	beq _080F3B32
	b _080F3B40
_080F3B2E:
	movs r0, 0
	b _080F3B42
_080F3B32:
	ldr r0, _080F3B48
	ldr r1, [r0]
	ldr r0, _080F3B4C
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F3B40:
	movs r0, 0x1
_080F3B42:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F3B48: .4byte gUnknown_083DFEC4
_080F3B4C: .4byte 0x00000306
	thumb_func_end sub_80F3724

	thumb_func_start sub_80F379C
sub_80F379C: @ 80F3B50
	push {lr}
	ldr r0, _080F3B78
	ldr r0, [r0]
	ldr r1, _080F3B7C
	adds r2, r0, r1
	movs r1, 0
	strb r1, [r2]
	ldr r1, _080F3B80
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F3B72
_080F3B68:
	bl sub_80F37D0
	lsls r0, 24
	cmp r0, 0
	bne _080F3B68
_080F3B72:
	pop {r0}
	bx r0
	.align 2, 0
_080F3B78: .4byte gUnknown_083DFEC4
_080F3B7C: .4byte 0x0000bc93
_080F3B80: .4byte 0x00006dac
	thumb_func_end sub_80F379C

	thumb_func_start sub_80F37D0
sub_80F37D0: @ 80F3B84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F3C4C
	ldr r1, [r0]
	ldr r2, _080F3C50
	adds r1, r2
	ldrb r1, [r1]
	adds r2, r0, 0
	cmp r1, 0xB
	bhi _080F3C5C
	movs r3, 0
	mov r8, r3
	movs r7, 0xF
	mov r9, r7
_080F3BA4:
	ldr r2, [r2]
	ldr r1, _080F3C50
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 8
	ldr r3, _080F3C54
	adds r0, r3
	adds r4, r2, r0
	lsls r1, 9
	ldr r7, _080F3C58
	adds r1, r7
	adds r5, r2, r1
	movs r6, 0
_080F3BBE:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuFastSet
	adds r5, 0x40
	adds r4, 0x20
	movs r1, 0
	adds r6, 0x1
	mov r12, r6
_080F3BD2:
	movs r0, 0
	adds r6, r1, 0x1
_080F3BD6:
	adds r4, 0x4
	movs r2, 0
	adds r3, r0, 0x1
_080F3BDC:
	subs r4, 0x1
	ldrb r0, [r4]
	lsls r1, r0, 4
	lsrs r0, 4
	mov r7, r9
	ands r0, r7
	orrs r1, r0
	strb r1, [r5]
	adds r5, 0x1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080F3BDC
	adds r4, 0x4
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _080F3BD6
	subs r4, 0x40
	lsls r0, r6, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bls _080F3BD2
	adds r4, 0x60
	mov r1, r12
	lsls r0, r1, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _080F3BBE
	ldr r2, _080F3C4C
	ldr r3, [r2]
	ldr r7, _080F3C50
	adds r1, r3, r7
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bhi _080F3C5C
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x1
	bls _080F3BA4
	adds r1, r7, 0
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0xB
	bhi _080F3C5C
	movs r0, 0x1
	b _080F3C5E
	.align 2, 0
_080F3C4C: .4byte gUnknown_083DFEC4
_080F3C50: .4byte 0x0000bc93
_080F3C54: .4byte 0x0000984c
_080F3C58: .4byte 0x0000a44c
_080F3C5C:
	movs r0, 0
_080F3C5E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F37D0

	thumb_func_start sub_80F38B8
sub_80F38B8: @ 80F3C6C
	push {lr}
	ldr r0, _080F3C94
	ldr r0, [r0]
	ldr r1, _080F3C98
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F3C9C
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F3C8E
_080F3C84:
	bl sub_80F38EC
	lsls r0, 24
	cmp r0, 0
	bne _080F3C84
_080F3C8E:
	pop {r0}
	bx r0
	.align 2, 0
_080F3C94: .4byte gUnknown_083DFEC4
_080F3C98: .4byte 0x00000306
_080F3C9C: .4byte 0x00006dac
	thumb_func_end sub_80F38B8

	thumb_func_start sub_80F38EC
sub_80F38EC: @ 80F3CA0
	push {r4,lr}
	ldr r0, _080F3CBC
	ldr r2, [r0]
	ldr r0, _080F3CC0
	adds r4, r2, r0
	ldrh r1, [r4]
	cmp r1, 0x1
	beq _080F3CE4
	cmp r1, 0x1
	bgt _080F3CC4
	cmp r1, 0
	beq _080F3CCE
	b _080F3D02
	.align 2, 0
_080F3CBC: .4byte gUnknown_083DFEC4
_080F3CC0: .4byte 0x00000306
_080F3CC4:
	cmp r1, 0x2
	beq _080F3CEC
	cmp r1, 0x3
	beq _080F3CF6
	b _080F3D02
_080F3CCE:
	ldr r3, _080F3CDC
	adds r0, r2, r3
	str r1, [r0]
	ldr r3, _080F3CE0
	adds r0, r2, r3
	strb r1, [r0]
	b _080F3D06
	.align 2, 0
_080F3CDC: .4byte 0x00009348
_080F3CE0: .4byte 0x0000bc92
_080F3CE4:
	movs r0, 0
	bl sub_80F2E18
	b _080F3D06
_080F3CEC:
	bl sub_80F3970
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_080F3CF6:
	bl sub_80F39A4
	lsls r0, 24
	cmp r0, 0
	beq _080F3D06
	b _080F3D14
_080F3D02:
	movs r0, 0
	b _080F3D16
_080F3D06:
	ldr r0, _080F3D1C
	ldr r1, [r0]
	ldr r0, _080F3D20
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F3D14:
	movs r0, 0x1
_080F3D16:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F3D1C: .4byte gUnknown_083DFEC4
_080F3D20: .4byte 0x00000306
	thumb_func_end sub_80F38EC

	thumb_func_start sub_80F3970
sub_80F3970: @ 80F3D24
	push {lr}
	ldr r0, _080F3D4C
	ldr r0, [r0]
	ldr r1, _080F3D50
	adds r2, r0, r1
	movs r1, 0
	strb r1, [r2]
	ldr r1, _080F3D54
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F3D46
_080F3D3C:
	bl sub_80F39A4
	lsls r0, 24
	cmp r0, 0
	bne _080F3D3C
_080F3D46:
	pop {r0}
	bx r0
	.align 2, 0
_080F3D4C: .4byte gUnknown_083DFEC4
_080F3D50: .4byte 0x0000bc93
_080F3D54: .4byte 0x00006dac
	thumb_func_end sub_80F3970

	thumb_func_start sub_80F39A4
sub_80F39A4: @ 80F3D58
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r0, _080F3DCC
	ldr r1, [r0]
	ldr r0, _080F3DD0
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0xB
	bhi _080F3DE4
	ldrb r0, [r4]
	lsls r0, 9
	ldr r2, _080F3DD4
	adds r0, r2
	adds r0, r1, r0
	str r0, [sp]
	ldr r5, _080F3DD8
	ldr r2, [sp, 0x4]
	ands r2, r5
	movs r0, 0x80
	lsls r0, 2
	orrs r2, r0
	str r2, [sp, 0x4]
	ldrb r1, [r4]
	adds r1, 0xB
	lsls r1, 16
	ldr r0, _080F3DDC
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldrb r0, [r4]
	cmp r0, 0x4
	bhi _080F3DB8
	lsls r0, 5
	ldr r1, _080F3DE0
	adds r0, r1
	str r0, [sp, 0x8]
	ldrb r2, [r4]
	adds r2, 0xA
	add r0, sp, 0x8
	ldr r1, [r0, 0x4]
	ands r1, r5
	orrs r1, r2
	str r1, [r0, 0x4]
	bl LoadSpritePalette
_080F3DB8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bhi _080F3DE4
	movs r0, 0x1
	b _080F3DE6
	.align 2, 0
_080F3DCC: .4byte gUnknown_083DFEC4
_080F3DD0: .4byte 0x0000bc93
_080F3DD4: .4byte 0x0000a44c
_080F3DD8: .4byte 0xffff0000
_080F3DDC: .4byte 0x0000ffff
_080F3DE0: .4byte gUnknown_083E3C60
_080F3DE4:
	movs r0, 0
_080F3DE6:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F39A4

	thumb_func_start sub_80F3A3C
sub_80F3A3C: @ 80F3DF0
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	cmp r4, 0x2
	bhi _080F3E14
	lsls r0, r4, 3
	adds r0, r4
	adds r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080F3E10
	b _080F3E2C
	.align 2, 0
_080F3E10: .4byte gUnknown_083DFEC4
_080F3E14:
	ldr r2, _080F3E84
	ldr r1, [r2]
	ldr r3, _080F3E88
	adds r0, r1, r3
	ldrb r0, [r0]
	ldr r6, _080F3E8C
	adds r1, r6
	ldrb r1, [r1]
	subs r0, r1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080F3E2C:
	ldr r0, [r2]
	ldr r7, _080F3E90
	adds r0, r7
	adds r0, r1
	ldrb r2, [r0]
	mov r1, sp
	ldr r0, _080F3E94
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	mov r3, sp
	ldr r1, _080F3E98
	lsls r2, 2
	adds r0, r2, r1
	ldrh r0, [r0]
	adds r0, 0xB
	strh r0, [r3]
	adds r1, 0x2
	adds r2, r1
	ldrh r0, [r2]
	adds r0, 0xA
	strh r0, [r3, 0x2]
	lsls r1, r5, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	lsls r2, r4, 20
	movs r3, 0xA0
	lsls r3, 14
	adds r2, r3
	asrs r2, 16
	mov r0, sp
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F3E9C
	movs r0, 0
	b _080F3EA6
	.align 2, 0
_080F3E84: .4byte gUnknown_083DFEC4
_080F3E88: .4byte 0x0000bc8e
_080F3E8C: .4byte 0x0000bc8f
_080F3E90: .4byte 0x0000bc4c
_080F3E94: .4byte gSpriteTemplate_83E476C
_080F3E98: .4byte gUnknown_083E4698
_080F3E9C:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F3EB0
	adds r0, r1
_080F3EA6:
	add sp, 0x18
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F3EB0: .4byte gSprites
	thumb_func_end sub_80F3A3C

	thumb_func_start sub_80F3B00
sub_80F3B00: @ 80F3EB4
	push {r4,lr}
	ldr r0, _080F3EE8
	ldr r4, [r0]
	ldr r1, _080F3EEC
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080F3EF0
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F3A3C
	adds r2, r0, 0
	ldr r1, _080F3EF4
	adds r0, r4, r1
	str r2, [r0]
	cmp r2, 0
	beq _080F3EFC
	adds r0, r2, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r2, _080F3EF8
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	b _080F3F02
	.align 2, 0
_080F3EE8: .4byte gUnknown_083DFEC4
_080F3EEC: .4byte 0x0000bc90
_080F3EF0: .4byte 0x0000bc91
_080F3EF4: .4byte 0x00009348
_080F3EF8: .4byte 0x0000bc92
_080F3EFC:
	ldr r1, _080F3F08
	adds r0, r4, r1
	strb r2, [r0]
_080F3F02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3F08: .4byte 0x0000bc92
	thumb_func_end sub_80F3B00

	thumb_func_start sub_80F3B58
sub_80F3B58: @ 80F3F0C
	push {lr}
	ldr r0, _080F3F20
	ldr r1, [r0]
	ldr r0, _080F3F24
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _080F3F28
	movs r0, 0
	b _080F3F3E
	.align 2, 0
_080F3F20: .4byte gUnknown_083DFEC4
_080F3F24: .4byte 0x0000bc92
_080F3F28:
	ldr r3, _080F3F44
	adds r0, r1, r3
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	eors r0, r1
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
_080F3F3E:
	pop {r1}
	bx r1
	.align 2, 0
_080F3F44: .4byte 0x00009348
	thumb_func_end sub_80F3B58

	thumb_func_start sub_80F3B94
sub_80F3B94: @ 80F3F48
	push {r4,lr}
	ldr r0, _080F3F6C
	ldr r4, [r0]
	ldr r1, _080F3F70
	adds r0, r4, r1
	ldr r2, [r0]
	cmp r2, 0
	beq _080F3F78
	adds r0, r2, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080F3F74
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	b _080F3F7E
	.align 2, 0
_080F3F6C: .4byte gUnknown_083DFEC4
_080F3F70: .4byte 0x00009348
_080F3F74: .4byte 0x0000bc92
_080F3F78:
	ldr r1, _080F3F84
	adds r0, r4, r1
	strb r2, [r0]
_080F3F7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F3F84: .4byte 0x0000bc92
	thumb_func_end sub_80F3B94

	thumb_func_start sub_80F3BD4
sub_80F3BD4: @ 80F3F88
	push {r4-r6,lr}
	ldr r0, _080F3FCC
	ldr r1, [r0]
	ldr r0, _080F3FD0
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080F3FD8
	ldr r0, _080F3FD4
	adds r4, r1, r0
	ldr r0, [r4]
	adds r0, 0x3F
	ldrb r0, [r0]
	lsrs r0, 5
	movs r1, 0x1
	eors r0, r1
	ands r0, r1
	strb r0, [r5]
	adds r6, r0, 0
	cmp r6, 0
	bne _080F3FC6
	ldr r0, [r4]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	bl DestroySprite
	str r6, [r4]
_080F3FC6:
	ldrb r0, [r5]
	b _080F3FDA
	.align 2, 0
_080F3FCC: .4byte gUnknown_083DFEC4
_080F3FD0: .4byte 0x0000bc92
_080F3FD4: .4byte 0x00009348
_080F3FD8:
	movs r0, 0
_080F3FDA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F3BD4

	thumb_func_start sub_80F3C2C
sub_80F3C2C: @ 80F3FE0
	push {r4,lr}
	ldr r0, _080F4040
	ldr r0, [r0]
	ldr r1, _080F4044
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F4004
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
_080F4004:
	movs r4, 0
_080F4006:
	adds r0, r4, 0
	adds r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _080F4006
	movs r4, 0
_080F401E:
	adds r0, r4, 0
	adds r0, 0xA
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080F401E
	bl sub_80F2F48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4040: .4byte gUnknown_083DFEC4
_080F4044: .4byte 0x00009348
	thumb_func_end sub_80F3C2C

	thumb_func_start sub_80F3C94
sub_80F3C94: @ 80F4048
	push {lr}
	sub sp, 0x10
	ldr r0, _080F4090
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _080F4094
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	mov r0, sp
	bl LoadSpriteSheet
	add r0, sp, 0x8
	bl LoadSpritePalette
	movs r1, 0
	ldr r0, _080F4098
	ldr r0, [r0]
	movs r3, 0x88
	lsls r3, 8
	adds r2, r0, r3
	movs r3, 0
_080F407A:
	lsls r0, r1, 2
	adds r0, r2, r0
	str r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9
	bls _080F407A
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080F4090: .4byte gUnknown_083E4784
_080F4094: .4byte gUnknown_083E478C
_080F4098: .4byte gUnknown_083DFEC4
	thumb_func_end sub_80F3C94

	thumb_func_start sub_80F3CE8
sub_80F3CE8: @ 80F409C
	push {lr}
	bl move_anim_execute
	movs r0, 0x17
	bl FreeSpriteTilesByTag
	movs r0, 0xF
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end sub_80F3CE8

	thumb_func_start sub_80F3D00
sub_80F3D00: @ 80F40B4
	push {r4,r5,lr}
	ldr r0, _080F40E8
	ldr r2, [r0]
	ldr r1, _080F40EC
	adds r0, r2, r1
	movs r3, 0
	ldrsh r0, [r0, r3]
	lsls r0, 2
	ldr r1, _080F40F0
	adds r0, r1
	adds r0, r2, r0
	ldrb r1, [r0, 0x3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F4148
	ldr r3, _080F40F4
	adds r0, r2, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldr r3, _080F40F8
	adds r0, r2, r3
	adds r0, r1
	ldrb r5, [r0]
	movs r4, 0
	b _080F413A
	.align 2, 0
_080F40E8: .4byte gUnknown_083DFEC4
_080F40EC: .4byte 0x000087dc
_080F40F0: .4byte 0x0000893c
_080F40F4: .4byte 0x00008fe9
_080F40F8: .4byte 0x00008931
_080F40FC:
	ldr r0, _080F4150
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F4140
	ldr r0, _080F4154
	ldr r2, [r0]
	lsls r0, r4, 2
	movs r3, 0x88
	lsls r3, 8
	adds r2, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F4158
	adds r0, r1
	str r0, [r2]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080F413A:
	adds r0, r5, 0x1
	cmp r4, r0
	blt _080F40FC
_080F4140:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80F3F20
_080F4148:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4150: .4byte gSpriteTemplate_83E4800
_080F4154: .4byte gUnknown_083DFEC4
_080F4158: .4byte gSprites
	thumb_func_end sub_80F3D00

	thumb_func_start move_anim_execute
move_anim_execute: @ 80F415C
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _080F418C
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 8
	adds r6, r0, r1
_080F416A:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F4186
	bl DestroySprite
	movs r0, 0
	str r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F416A
_080F4186:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F418C: .4byte gUnknown_083DFEC4
	thumb_func_end move_anim_execute

	thumb_func_start sub_80F3DDC
sub_80F3DDC: @ 80F4190
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080F41B2
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r0, [r1, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80F3F20
_080F41B2:
	pop {r0}
	bx r0
	thumb_func_end sub_80F3DDC

	thumb_func_start sub_80F3E04
sub_80F3E04: @ 80F41B8
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080F41D0
	movs r0, 0
	strh r0, [r2, 0x30]
	ldr r0, _080F41D4
	str r0, [r2, 0x1C]
_080F41D0:
	pop {r0}
	bx r0
	.align 2, 0
_080F41D4: .4byte sub_80F3DDC
	thumb_func_end sub_80F3E04

	thumb_func_start sub_80F3E24
sub_80F3E24: @ 80F41D8
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _080F4218
	ldr r0, [r0]
	ldr r1, _080F421C
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _080F4224
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	ldr r2, _080F4220
	movs r5, 0x2E
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	adds r0, r1
	strh r0, [r3, 0x20]
	ldr r0, [r4]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 2
	adds r2, 0x2
	adds r0, r2
	ldrh r0, [r0]
	adds r0, r1
	b _080F4242
	.align 2, 0
_080F4218: .4byte gUnknown_083DFEC4
_080F421C: .4byte 0x00008768
_080F4220: .4byte gUnknown_083E4794
_080F4224:
	ldr r1, _080F424C
	movs r5, 0x2E
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x28
	strh r0, [r3, 0x20]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	lsls r0, 2
	adds r1, 0x2
	adds r0, r1
	ldrh r0, [r0]
	adds r0, 0x68
_080F4242:
	strh r0, [r3, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F424C: .4byte gUnknown_083E4794
	thumb_func_end sub_80F3E24

	thumb_func_start sub_80F3E9C
sub_80F3E9C: @ 80F4250
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080F427E
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080F42C8
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080F427E:
	adds r0, r4, 0
	bl sub_80F3E24
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080F42C8
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080F42C4
	cmp r1, 0x9
	bne _080F42BC
	bl sub_80F3FAC
	ldr r0, _080F42B8
	b _080F42C6
	.align 2, 0
_080F42B8: .4byte sub_80F3E04
_080F42BC:
	ldr r0, _080F42C0
	b _080F42C6
	.align 2, 0
_080F42C0: .4byte sub_80F3DDC
_080F42C4:
	ldr r0, _080F42D0
_080F42C6:
	str r0, [r4, 0x1C]
_080F42C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F42D0: .4byte SpriteCallbackDummy
	thumb_func_end sub_80F3E9C

	thumb_func_start sub_80F3F20
sub_80F3F20: @ 80F42D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r5, 0
	ldr r0, _080F4320
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 8
	adds r7, r0, r1
_080F42F0:
	lsls r0, r5, 2
	adds r4, r7, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F4346
	strh r5, [r0, 0x2E]
	ldr r1, [r4]
	lsls r0, r5, 4
	adds r0, 0x1
	strh r0, [r1, 0x30]
	ldr r0, [r4]
	strh r6, [r0, 0x32]
	ldr r0, [r4]
	strh r5, [r0, 0x34]
	mov r3, r8
	cmp r3, 0
	beq _080F4316
	cmp r6, 0x9
	beq _080F4328
_080F4316:
	ldr r1, [r4]
	ldr r0, _080F4324
	str r0, [r1, 0x1C]
	b _080F4346
	.align 2, 0
_080F4320: .4byte gUnknown_083DFEC4
_080F4324: .4byte sub_80F3E9C
_080F4328:
	ldr r0, [r4]
	bl sub_80F3E24
	bl sub_80F3FAC
	ldr r2, [r4]
	ldr r0, _080F435C
	str r0, [r2, 0x1C]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x5
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	strb r0, [r2]
_080F4346:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F42F0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F435C: .4byte sub_80F3E04
	thumb_func_end sub_80F3F20

	thumb_func_start sub_80F3FAC
sub_80F3FAC: @ 80F4360
	push {r4-r7,lr}
	movs r5, 0
	ldr r0, _080F43A0
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 8
	adds r6, r0, r1
	movs r0, 0x5
	negs r0, r0
	adds r7, r0, 0
_080F4374:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _080F438E
	movs r1, 0
	bl SeekSpriteAnim
	ldr r1, [r4]
	adds r1, 0x3E
	ldrb r0, [r1]
	ands r0, r7
	strb r0, [r1]
_080F438E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F4374
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F43A0: .4byte gUnknown_083DFEC4
	thumb_func_end sub_80F3FAC

	thumb_func_start sub_80F3FF0
sub_80F3FF0: @ 80F43A4
	push {lr}
	ldr r0, _080F43CC
	ldr r0, [r0]
	ldr r1, _080F43D0
	adds r2, r0, r1
	movs r1, 0
	strh r1, [r2]
	ldr r1, _080F43D4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F43C6
_080F43BC:
	bl sub_80F4024
	lsls r0, 24
	cmp r0, 0
	bne _080F43BC
_080F43C6:
	pop {r0}
	bx r0
	.align 2, 0
_080F43CC: .4byte gUnknown_083DFEC4
_080F43D0: .4byte 0x00000306
_080F43D4: .4byte 0x00006dac
	thumb_func_end sub_80F3FF0

	thumb_func_start sub_80F4024
sub_80F4024: @ 80F43D8
	push {r4,lr}
	sub sp, 0x10
	ldr r0, _080F43F4
	ldr r4, [r0]
	ldr r1, _080F43F8
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080F441C
	cmp r0, 0x1
	bgt _080F43FC
	cmp r0, 0
	beq _080F4406
	b _080F44BA
	.align 2, 0
_080F43F4: .4byte gUnknown_083DFEC4
_080F43F8: .4byte 0x00000306
_080F43FC:
	cmp r0, 0x2
	beq _080F4438
	cmp r0, 0x3
	beq _080F446C
	b _080F44BA
_080F4406:
	ldr r0, _080F4414
	ldr r2, _080F4418
	adds r1, r4, r2
	bl LZ77UnCompWram
	b _080F44CC
	.align 2, 0
_080F4414: .4byte gUnknown_083E329C
_080F4418: .4byte 0x000131e4
_080F441C:
	ldr r1, _080F4430
	adds r0, r4, r1
	str r0, [sp]
	ldr r0, _080F4434
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	b _080F44CC
	.align 2, 0
_080F4430: .4byte 0x000131e4
_080F4434: .4byte 0x00181000
_080F4438:
	ldr r0, _080F4468
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x8]
	str r1, [sp, 0xC]
	add r0, sp, 0x8
	bl LoadSpritePalette
	movs r0, 0x10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC2
	lsls r1, 2
	adds r2, r4, r1
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	movs r0, 0x3
	negs r0, r0
	bics r0, r1
	str r0, [r2]
	b _080F44CC
	.align 2, 0
_080F4468: .4byte gUnknown_083E4818
_080F446C:
	ldr r0, _080F4498
	movs r1, 0xDA
	movs r2, 0xE
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080F44A4
	ldr r0, _080F449C
	adds r2, r4, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F44A0
	adds r0, r1
	str r0, [r2]
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _080F44AC
	.align 2, 0
_080F4498: .4byte gSpriteTemplate_83E4850
_080F449C: .4byte 0x00006d98
_080F44A0: .4byte gSprites
_080F44A4:
	ldr r2, _080F44C0
	adds r1, r4, r2
	movs r0, 0
	str r0, [r1]
_080F44AC:
	ldr r0, _080F44C4
	ldr r1, [r0]
	ldr r0, _080F44C8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080F44BA:
	movs r0, 0
	b _080F44DC
	.align 2, 0
_080F44C0: .4byte 0x00006d98
_080F44C4: .4byte gUnknown_083DFEC4
_080F44C8: .4byte 0x00000306
_080F44CC:
	ldr r0, _080F44E4
	ldr r1, [r0]
	ldr r2, _080F44E8
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_080F44DC:
	add sp, 0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F44E4: .4byte gUnknown_083DFEC4
_080F44E8: .4byte 0x00000306
	thumb_func_end sub_80F4024

	thumb_func_start sub_80F4138
sub_80F4138: @ 80F44EC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F4524
	ldr r0, [r0]
	movs r1, 0xC3
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	negs r0, r0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bgt _080F4528
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080F4542
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x1
	b _080F4540
	.align 2, 0
_080F4524: .4byte gUnknown_083DFEC4
_080F4528:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080F4542
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	movs r0, 0
_080F4540:
	strh r0, [r2, 0x2E]
_080F4542:
	pop {r0}
	bx r0
	thumb_func_end sub_80F4138

	thumb_func_start sub_80F4194
sub_80F4194: @ 80F4548
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	adds r2, r1, 0
	ldr r0, _080F4658
	ldr r6, [r0]
	mov r0, sp
	ldr r1, _080F465C
	adds r5, r1, 0
	strh r5, [r0]
	ldr r4, _080F4660
	str r0, [r4]
	str r6, [r4, 0x4]
	ldr r3, _080F4664
	str r3, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r0, 0x80
	lsls r0, 3
	adds r1, r6, r0
	mov r0, sp
	strh r5, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r3, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _080F4668
	adds r1, r6, 0
	bl sub_8004E3C
	movs r3, 0x88
	lsls r3, 2
	adds r1, r6, r3
	mov r0, sp
	movs r3, 0
	strh r3, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	ldr r2, _080F466C
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r0, 0xC4
	lsls r0, 3
	adds r1, r6, r0
	mov r0, sp
	strh r3, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r1, 0x80
	lsls r1, 2
	adds r2, r6, r1
	ldr r0, [r2]
	ldr r1, _080F4670
	ands r0, r1
	str r0, [r2]
	ldr r0, [r2, 0x4]
	ands r0, r1
	str r0, [r2, 0x4]
	ldr r0, [r2, 0x8]
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0xC]
	ands r0, r1
	str r0, [r2, 0xC]
	ldr r0, [r2, 0x10]
	ands r0, r1
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	ands r0, r1
	str r0, [r2, 0x14]
	ldr r0, [r2, 0x18]
	ands r0, r1
	str r0, [r2, 0x18]
	ldr r0, [r2, 0x1C]
	ands r0, r1
	str r0, [r2, 0x1C]
	movs r3, 0xC0
	lsls r3, 3
	adds r2, r6, r3
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, [r2, 0x4]
	ands r0, r1
	str r0, [r2, 0x4]
	ldr r0, [r2, 0x8]
	ands r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0xC]
	ands r0, r1
	str r0, [r2, 0xC]
	ldr r0, [r2, 0x10]
	ands r0, r1
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	ands r0, r1
	str r0, [r2, 0x14]
	ldr r0, [r2, 0x18]
	ands r0, r1
	str r0, [r2, 0x18]
	ldr r0, [r2, 0x1C]
	ands r0, r1
	str r0, [r2, 0x1C]
	movs r1, 0
	ldr r2, _080F4674
_080F461C:
	lsls r0, r1, 7
	adds r0, r6, r0
	str r0, [r4]
	lsls r0, r1, 8
	adds r0, r7, r0
	str r0, [r4, 0x4]
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	lsls r0, r1, 7
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3
	adds r0, r6, r0
	str r0, [r4]
	lsls r0, r1, 3
	adds r0, 0x4
	lsls r0, 5
	adds r0, r7, r0
	str r0, [r4, 0x4]
	str r2, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080F461C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4658: .4byte gUnknown_083DFEC8
_080F465C: .4byte 0x00001111
_080F4660: .4byte 0x040000d4
_080F4664: .4byte 0x81000140
_080F4668: .4byte gWindowConfig_81E70F0
_080F466C: .4byte 0x81000030
_080F4670: .4byte 0x0fffffff
_080F4674: .4byte 0x80000040
	thumb_func_end sub_80F4194

	thumb_func_start sub_80F42C4
sub_80F42C4: @ 80F4678
	push {r4-r7,lr}
	sub sp, 0x8
	adds r1, r0, 0
	ldr r0, _080F46F0
	ldr r0, [r0]
	ldr r2, _080F46F4
	adds r0, r2
	str r0, [sp]
	ldr r2, _080F46F8
	str r2, [sp, 0x4]
	bl sub_80F4194
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _080F46FC
	bl LoadSpritePalette
	movs r5, 0
	movs r4, 0
	ldr r6, _080F4700
_080F46A2:
	lsls r1, r4, 21
	movs r7, 0xE2
	lsls r7, 15
	adds r1, r7
	asrs r1, 16
	ldr r0, _080F4704
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080F4714
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r6
	ldrh r2, [r3, 0x4]
	lsls r0, r2, 22
	lsrs r0, 22
	adds r0, r5, r0
	ldr r7, _080F4708
	adds r1, r7, 0
	ands r0, r1
	ldr r7, _080F470C
	adds r1, r7, 0
	ands r2, r1
	orrs r2, r0
	strh r2, [r3, 0x4]
	ldr r0, _080F46F0
	ldr r0, [r0]
	lsls r1, r4, 2
	ldr r2, _080F4710
	adds r0, r2
	adds r0, r1
	str r3, [r0]
	b _080F4724
	.align 2, 0
_080F46F0: .4byte gUnknown_083DFEC4
_080F46F4: .4byte 0x0000d1e4
_080F46F8: .4byte 0x001a0500
_080F46FC: .4byte gUnknown_083E4868
_080F4700: .4byte gSprites
_080F4704: .4byte gSpriteTemplate_83E4878
_080F4708: .4byte 0x000003ff
_080F470C: .4byte 0xfffffc00
_080F4710: .4byte 0x0000ced4
_080F4714:
	ldr r0, _080F4740
	ldr r1, [r0]
	lsls r0, r4, 2
	ldr r7, _080F4744
	adds r1, r7
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_080F4724:
	adds r0, r5, 0
	adds r0, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080F46A2
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4740: .4byte gUnknown_083DFEC4
_080F4744: .4byte 0x0000ced4
	thumb_func_end sub_80F42C4

	thumb_func_start sub_80F4394
sub_80F4394: @ 80F4748
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _080F4780
	ldr r0, [r0]
	ldr r1, _080F4784
	adds r5, r0, r1
_080F4754:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080F4762
	bl DestroySprite
_080F4762:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _080F4754
	movs r0, 0x1A
	bl FreeSpriteTilesByTag
	movs r0, 0x12
	bl FreeSpritePaletteByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4780: .4byte gUnknown_083DFEC4
_080F4784: .4byte 0x0000ced4
	thumb_func_end sub_80F4394

	thumb_func_start sub_80F43D4
sub_80F43D4: @ 80F4788
	push {r4,lr}
	adds r1, r0, 0
	ldr r0, _080F47C4
	ldr r0, [r0]
	ldr r2, _080F47C8
	adds r4, r0, r2
	adds r0, r4, 0
	bl sub_80F4194
	movs r0, 0x1A
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080F47CC
	cmp r1, r0
	beq _080F47BC
	lsls r0, r1, 5
	ldr r1, _080F47D0
	adds r0, r1
	ldr r1, _080F47D4
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r0, _080F47D8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_080F47BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F47C4: .4byte gUnknown_083DFEC4
_080F47C8: .4byte 0x0000d1e4
_080F47CC: .4byte 0x0000ffff
_080F47D0: .4byte 0x06010000
_080F47D4: .4byte 0x040000d4
_080F47D8: .4byte 0x84000140
	thumb_func_end sub_80F43D4

	thumb_func_start sub_80F4428
sub_80F4428: @ 80F47DC
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	bl sub_80F6514
	pop {r1}
	bx r1
	thumb_func_end sub_80F4428

	thumb_func_start sub_80F443C
sub_80F443C: @ 80F47F0
	push {r4,lr}
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r1, _080F480C
	bl StringCopy
	adds r1, r4, 0
	movs r2, 0x38
	movs r3, 0x1
	bl sub_8072C14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F480C: .4byte gOtherText_Number
	thumb_func_end sub_80F443C

	thumb_func_start sub_80F445C
sub_80F445C: @ 80F4810
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x17
	movs r3, 0x1
	bl sub_8072C14
	adds r4, r0, 0
	movs r3, 0xFC
	strb r3, [r4]
	movs r2, 0x11
	strb r2, [r4, 0x1]
	movs r1, 0x1
	strb r1, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xBA
	strb r0, [r4]
	adds r4, 0x1
	strb r3, [r4]
	strb r2, [r4, 0x1]
	strb r1, [r4, 0x2]
	adds r4, 0x3
	ldr r0, _080F485C
	ldr r0, [r0]
	ldr r1, _080F4860
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r1, 0x1
	adds r0, r4, 0
	movs r2, 0x32
	movs r3, 0x1
	bl sub_8072C14
	adds r4, r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F485C: .4byte gUnknown_083DFEC4
_080F4860: .4byte 0x00008774
	thumb_func_end sub_80F445C

	thumb_func_start sub_80F44B0
sub_80F44B0: @ 80F4864
	push {r4,lr}
	adds r4, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r0, 0xE
	bne _080F48A8
	cmp r4, 0x2
	beq _080F487C
	cmp r4, 0x7
	bne _080F4894
_080F487C:
	movs r0, 0x64
	muls r0, r2
	ldr r1, _080F4890
	adds r0, r1
	adds r1, r4, 0
	adds r2, r3, 0
	bl GetMonData
	b _080F48F0
	.align 2, 0
_080F4890: .4byte gPlayerParty
_080F4894:
	movs r0, 0x64
	muls r0, r2
	ldr r1, _080F48A4
	adds r0, r1
	adds r1, r4, 0
	bl GetMonData
	b _080F48F0
	.align 2, 0
_080F48A4: .4byte gPlayerParty
_080F48A8:
	cmp r4, 0x2
	beq _080F48B0
	cmp r4, 0x7
	bne _080F48D4
_080F48B0:
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F48D0
	adds r1, r2
	adds r0, r1
	adds r1, r4, 0
	adds r2, r3, 0
	bl GetBoxMonData
	b _080F48F0
	.align 2, 0
_080F48D0: .4byte gUnknown_020300A4
_080F48D4:
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F48F8
	adds r1, r2
	adds r0, r1
	adds r1, r4, 0
	bl GetBoxMonData
_080F48F0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F48F8: .4byte gUnknown_020300A4
	thumb_func_end sub_80F44B0

	thumb_func_start sub_80F4548
sub_80F4548: @ 80F48FC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	mov r0, sp
	strb r2, [r0]
	cmp r3, 0xE
	bne _080F4928
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080F4924
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	b _080F4946
	.align 2, 0
_080F4924: .4byte gPlayerParty
_080F4928:
	lsls r1, r3, 2
	adds r1, r3
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 4
	ldr r2, _080F4950
	adds r1, r2
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetBoxMonData
_080F4946:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F4950: .4byte gUnknown_020300A4
	thumb_func_end sub_80F4548

	thumb_func_start sub_80F45A0
sub_80F45A0: @ 80F4954
	push {r4-r7,lr}
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080F49A4
	ldr r5, [r1]
	lsls r1, r0, 16
	asrs r0, r1, 14
	adds r4, r5, r0
	ldr r2, _080F49A8
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r7, r0, 31
	cmp r7, 0
	beq _080F49F8
	lsls r0, r6, 6
	ldr r2, _080F49AC
	adds r0, r2
	adds r0, r5, r0
	lsrs r1, 16
	movs r2, 0
	bl sub_80F4428
	ldr r1, _080F49B0
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, 0xE
	bne _080F49BC
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	ldr r2, _080F49B4
	adds r0, r2
	adds r0, r5, r0
	ldr r1, _080F49B8
	movs r2, 0x40
	movs r3, 0
	bl sub_8072C74
	b _080F49D8
	.align 2, 0
_080F49A4: .4byte gUnknown_083DFEC4
_080F49A8: .4byte 0x0000893f
_080F49AC: .4byte 0x00008829
_080F49B0: .4byte 0x0000893d
_080F49B4: .4byte 0x000088e9
_080F49B8: .4byte gOtherText_InParty
_080F49BC:
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F49E8
	adds r0, r1
	adds r0, r5, r0
	lsls r1, r2, 3
	adds r1, r2
	ldr r2, _080F49EC
	adds r1, r2
	movs r2, 0x40
	movs r3, 0
	bl sub_8072C74
_080F49D8:
	ldr r0, _080F49F0
	ldr r0, [r0]
	ldr r2, _080F49F4
	adds r0, r2
	adds r0, r6
	movs r1, 0x1
	strb r1, [r0]
	b _080F4A2A
	.align 2, 0
_080F49E8: .4byte 0x000088e9
_080F49EC: .4byte gUnknown_020383E4
_080F49F0: .4byte gUnknown_083DFEC4
_080F49F4: .4byte 0x00008937
_080F49F8:
	lsls r0, r6, 6
	ldr r1, _080F4A30
	adds r0, r1
	adds r0, r5, r0
	ldr r4, _080F4A34
	adds r1, r4, 0
	movs r2, 0x68
	movs r3, 0
	bl sub_8072C74
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	ldr r2, _080F4A38
	adds r0, r2
	adds r0, r5, r0
	adds r1, r4, 0
	movs r2, 0x40
	movs r3, 0
	bl sub_8072C74
	ldr r1, _080F4A3C
	adds r0, r5, r1
	adds r0, r6
	strb r7, [r0]
_080F4A2A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4A30: .4byte 0x00008829
_080F4A34: .4byte gEmptyString_81E72B0
_080F4A38: .4byte 0x000088e9
_080F4A3C: .4byte 0x00008937
	thumb_func_end sub_80F45A0

	thumb_func_start sub_80F468C
sub_80F468C: @ 80F4A40
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r1, _080F4B10
	ldr r7, [r1]
	lsls r0, 16
	asrs r0, 14
	adds r1, r7, r0
	ldr r2, _080F4B14
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	blt _080F4A66
	b _080F4B78
_080F4A66:
	ldr r3, _080F4B18
	adds r0, r1, r3
	ldrb r5, [r0]
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r6, r0, 27
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x16
	movs r3, 0
	bl sub_80F44B0
	mov r3, r9
	lsls r3, 2
	mov r8, r3
	mov r4, r8
	add r4, r9
	ldr r2, _080F4B1C
	adds r1, r7, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x2F
	movs r3, 0
	bl sub_80F44B0
	ldr r3, _080F4B20
	adds r1, r7, r3
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x21
	movs r3, 0
	bl sub_80F44B0
	ldr r2, _080F4B24
	adds r1, r7, r2
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x18
	movs r3, 0
	bl sub_80F44B0
	ldr r3, _080F4B28
	adds r1, r7, r3
	adds r1, r4
	strb r0, [r1]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x17
	movs r3, 0
	bl sub_80F44B0
	ldr r2, _080F4B2C
	adds r1, r7, r2
	adds r1, r4
	strb r0, [r1]
	ldr r3, _080F4B30
	adds r0, r7, r3
	mov r7, r9
	adds r4, r0, r7
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x30
	movs r3, 0
	bl sub_80F44B0
	cmp r0, 0xFF
	beq _080F4B34
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x30
	movs r3, 0
	bl sub_80F44B0
	movs r1, 0x1D
	bl __udivsi3
	b _080F4B36
	.align 2, 0
_080F4B10: .4byte gUnknown_083DFEC4
_080F4B14: .4byte 0x0000893f
_080F4B18: .4byte 0x0000893d
_080F4B1C: .4byte 0x00008ff0
_080F4B20: .4byte 0x00008ff1
_080F4B24: .4byte 0x00008ff2
_080F4B28: .4byte 0x00008ff3
_080F4B2C: .4byte 0x00008ff4
_080F4B30: .4byte 0x00008931
_080F4B34:
	movs r0, 0x9
_080F4B36:
	strb r0, [r4]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x8
	movs r3, 0
	bl sub_80F44B0
	ldr r1, _080F4B68
	ldr r1, [r1]
	ldr r3, _080F4B6C
	adds r2, r1, r3
	add r2, r9
	strb r0, [r2]
	mov r2, r8
	add r2, r9
	ldr r7, _080F4B70
	adds r0, r2, r7
	adds r0, r1, r0
	lsls r2, 2
	ldr r3, _080F4B74
	adds r2, r3
	adds r1, r2
	bl sub_80F55AC
	b _080F4BBE
	.align 2, 0
_080F4B68: .4byte gUnknown_083DFEC4
_080F4B6C: .4byte 0x00008934
_080F4B70: .4byte 0x00008ff0
_080F4B74: .4byte 0x00009004
_080F4B78:
	movs r3, 0
	mov r0, r9
	lsls r0, 2
	mov r8, r0
	adds r4, r7, 0
	mov r2, r8
	add r2, r9
	ldr r1, _080F4BCC
	adds r6, r4, r1
	lsls r5, r2, 2
	mov r9, r3
	ldr r7, _080F4BD0
	mov r8, r7
	movs r0, 0x9B
	mov r12, r0
_080F4B96:
	adds r0, r3, r2
	adds r0, r6, r0
	mov r1, r9
	strb r1, [r0]
	lsls r0, r3, 2
	adds r0, r5
	adds r0, r4, r0
	mov r7, r8
	adds r1, r0, r7
	mov r7, r12
	strh r7, [r1]
	ldr r1, _080F4BD4
	adds r0, r1
	movs r1, 0x5B
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _080F4B96
_080F4BBE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4BCC: .4byte 0x00008ff0
_080F4BD0: .4byte 0x00009004
_080F4BD4: .4byte 0x00009006
	thumb_func_end sub_80F468C

	thumb_func_start sub_80F4824
sub_80F4824: @ 80F4BD8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r1, _080F4C94
	ldr r7, [r1]
	lsls r0, 16
	asrs r0, 14
	adds r1, r7, r0
	ldr r2, _080F4C98
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _080F4C84
	ldr r6, _080F4C9C
	adds r0, r1, r6
	ldrb r6, [r0]
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r4, [r0]
	lsls r4, 27
	lsrs r4, 27
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x41
	movs r3, 0
	bl sub_80F44B0
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_80F44B0
	mov r8, r0
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl sub_80F44B0
	adds r4, r0, 0
	lsls r0, r5, 3
	ldr r1, _080F4CA0
	adds r0, r1
	ldr r2, _080F4CA4
	lsls r1, r5, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r6, _080F4CA8
	adds r3, r7, r6
	mov r6, r9
	lsls r2, r6, 13
	ldr r6, _080F4CAC
	adds r2, r6
	adds r2, r7, r2
	str r2, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r2, 0x1
	bl sub_800D334
	adds r0, r5, 0
	mov r1, r8
	adds r2, r4, 0
	bl species_and_otid_get_pal
	mov r2, r9
	lsls r1, r2, 7
	adds r1, r7, r1
	bl LZ77UnCompWram
	mov r6, r9
	lsls r1, r6, 1
	ldr r2, _080F4CB0
	adds r0, r7, r2
	adds r0, r1
	strh r5, [r0]
_080F4C84:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4C94: .4byte gUnknown_083DFEC4
_080F4C98: .4byte 0x0000893f
_080F4C9C: .4byte 0x0000893d
_080F4CA0: .4byte gMonFrontPicTable
_080F4CA4: .4byte gMonFrontPicCoords
_080F4CA8: .4byte 0x000131e4
_080F4CAC: .4byte 0x0000d1e4
_080F4CB0: .4byte 0x0000d1d6
	thumb_func_end sub_80F4824

	thumb_func_start sub_80F4900
sub_80F4900: @ 80F4CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F45A0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F468C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80F4824
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80F4900

	thumb_func_start sub_80F492C
sub_80F492C: @ 80F4CE0
	ldr r0, _080F4CF0
	ldr r0, [r0]
	ldr r1, _080F4CF4
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F4CF0: .4byte gUnknown_083DFEC4
_080F4CF4: .4byte 0x00008fe4
	thumb_func_end sub_80F492C

	thumb_func_start sub_80F4944
sub_80F4944: @ 80F4CF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	movs r2, 0
	ldr r1, _080F4D2C
	ldr r5, [r1]
	ldr r3, _080F4D30
	adds r0, r5, r3
	ldrh r4, [r0]
	lsrs r3, r4, 1
	mov r8, r1
	cmp r4, r3
	beq _080F4D50
	adds r6, r5, 0
	mov r0, r12
	ldrb r5, [r0]
	ldr r7, _080F4D34
_080F4D1C:
	lsls r0, r3, 2
	adds r0, r6, r0
	adds r0, r7
	ldrb r0, [r0]
	cmp r5, r0
	bls _080F4D38
	adds r4, r3, 0
	b _080F4D3E
	.align 2, 0
_080F4D2C: .4byte gUnknown_083DFEC4
_080F4D30: .4byte 0x00008fe4
_080F4D34: .4byte 0x0000893c
_080F4D38:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080F4D3E:
	subs r0, r4, r2
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, r2, r0
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r4, r3
	bne _080F4D1C
_080F4D50:
	mov r1, r8
	ldr r2, [r1]
	ldr r1, _080F4DA0
	adds r0, r2, r1
	ldrh r4, [r0]
	lsls r6, r3, 2
	cmp r4, r3
	bls _080F4D7A
	ldr r0, _080F4DA4
	adds r5, r2, r0
_080F4D64:
	lsls r2, r4, 2
	adds r2, r5, r2
	subs r1, r4, 0x1
	lsls r0, r1, 2
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [r2]
	lsls r1, 16
	lsrs r4, r1, 16
	cmp r4, r3
	bhi _080F4D64
_080F4D7A:
	mov r1, r8
	ldr r2, [r1]
	ldr r3, _080F4DA4
	adds r0, r2, r3
	adds r0, r6
	mov r3, r12
	ldr r1, [r3]
	str r1, [r0]
	ldr r0, _080F4DA0
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4DA0: .4byte 0x00008fe4
_080F4DA4: .4byte 0x0000893c
	thumb_func_end sub_80F4944

	thumb_func_start sub_80F49F4
sub_80F49F4: @ 80F4DA8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r3, _080F4E18
	ldr r4, [r3]
	ldr r7, _080F4E1C
	adds r2, r4, r7
	ldrh r1, [r2]
	ldr r0, _080F4E20
	mov r12, r0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strh r0, [r2]
	movs r5, 0x1
	ldr r1, _080F4E24
	adds r0, r4, r1
	ldrh r3, [r0]
	cmp r5, r3
	bcs _080F4E52
	adds r6, r4, 0
	ldr r1, _080F4E28
	mov r8, r1
	ldr r3, _080F4E2C
	mov r10, r3
	mov r9, r0
_080F4DE0:
	lsls r0, r5, 2
	adds r3, r6, r0
	mov r0, r8
	adds r2, r3, r0
	subs r0, r5, 0x1
	lsls r0, 2
	adds r4, r6, r0
	mov r0, r8
	adds r1, r4, r0
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080F4E30
	adds r0, r4, r7
	ldrh r0, [r0]
	lsls r0, 18
	lsrs r0, 23
	adds r3, r7
	ldr r1, _080F4E2C
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	adds r4, r5, 0x1
	b _080F4E46
	.align 2, 0
_080F4E18: .4byte gUnknown_083DFEC4
_080F4E1C: .4byte 0x0000893e
_080F4E20: .4byte 0xffffc01f
_080F4E24: .4byte 0x00008fe4
_080F4E28: .4byte 0x0000893c
_080F4E2C: .4byte 0x000001ff
_080F4E30:
	adds r4, r5, 0x1
	adds r3, r7
	adds r1, r4, 0
	mov r0, r10
	ands r1, r0
	lsls r1, 5
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
_080F4E46:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	mov r1, r9
	ldrh r1, [r1]
	cmp r5, r1
	bcc _080F4DE0
_080F4E52:
	ldr r3, _080F4E78
	ldr r2, [r3]
	ldr r1, _080F4E7C
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	ldr r3, _080F4E80
	adds r0, r2, r3
	strh r1, [r0]
	subs r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _080F4E84
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0x8
	bhi _080F4E88
	subs r1, r0, 0x1
	b _080F4E8A
	.align 2, 0
_080F4E78: .4byte gUnknown_083DFEC4
_080F4E7C: .4byte 0x0000876c
_080F4E80: .4byte 0x00008770
_080F4E84: .4byte 0x00008fe4
_080F4E88:
	movs r1, 0x7
_080F4E8A:
	ldr r3, _080F4EC4
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _080F4EC8
	ldr r2, [r0]
	ldr r1, _080F4ECC
	adds r0, r2, r1
	ldrh r0, [r0]
	subs r0, 0x1
	adds r3, 0x2
	adds r1, r2, r3
	strh r0, [r1]
	movs r1, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080F4EAE
	movs r1, 0x1
_080F4EAE:
	ldr r3, _080F4ED0
	adds r0, r2, r3
	strb r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4EC4: .4byte 0x00008772
_080F4EC8: .4byte gUnknown_083DFEC4
_080F4ECC: .4byte 0x00008fe4
_080F4ED0: .4byte 0x000087c9
	thumb_func_end sub_80F49F4

	thumb_func_start sub_80F4B20
sub_80F4B20: @ 80F4ED4
	push {r4-r6,lr}
	ldr r0, _080F4F10
	ldr r4, [r0]
	ldr r0, _080F4F14
	adds r5, r4, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0
	bl sub_80F4900
	movs r0, 0
	bl sub_80F2E18
	ldr r0, _080F4F18
	adds r2, r4, r0
	movs r1, 0
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080F4F20
	ldr r2, _080F4F1C
	adds r0, r4, r2
	movs r1, 0
	strb r1, [r0]
	adds r2, 0x1
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, 0x1
	adds r0, r4, r2
	strb r1, [r0]
	b _080F4F72
	.align 2, 0
_080F4F10: .4byte gUnknown_083DFEC4
_080F4F14: .4byte 0x000087dc
_080F4F18: .4byte 0x000087da
_080F4F1C: .4byte 0x00008fe9
_080F4F20:
	ldr r0, _080F4F78
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080F4F7C
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080F4F80
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldrh r3, [r5]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	ldrh r6, [r2]
	movs r4, 0
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080F4F4E
	movs r5, 0
_080F4F4E:
	subs r0, r3, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r0, 0
	bge _080F4F5E
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080F4F5E:
	lsls r0, r5, 16
	asrs r0, 16
	movs r1, 0x1
	bl sub_80F4900
	lsls r0, r4, 16
	asrs r0, 16
	movs r1, 0x2
	bl sub_80F4900
_080F4F72:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F4F78: .4byte 0x00008fe9
_080F4F7C: .4byte 0x00008fea
_080F4F80: .4byte 0x00008feb
	thumb_func_end sub_80F4B20

	thumb_func_start sub_80F4BD0
sub_80F4BD0: @ 80F4F84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r6, 0
	movs r7, 0
	ldr r0, _080F5078
	ldr r2, [r0]
	ldr r3, _080F507C
	adds r1, r2, r3
	mov r9, r0
	ldrb r1, [r1]
	cmp r7, r1
	bcs _080F501A
	mov r10, r9
	adds r4, r3, 0
	adds r4, r2
	mov r8, r4
_080F4FAA:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F5080
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080F500C
	mov r0, r10
	ldr r3, [r0]
	lsls r0, r7, 2
	adds r3, r0
	ldr r2, _080F5084
	adds r1, r3, r2
	movs r0, 0xE
	strb r0, [r1]
	ldr r4, _080F5088
	adds r5, r3, r4
	movs r0, 0x1F
	adds r2, r6, 0
	ands r2, r0
	ldrb r0, [r5]
	movs r4, 0x20
	negs r4, r4
	adds r1, r4, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	adds r4, r7, 0x1
	ldr r7, _080F508C
	adds r0, r7, 0
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 5
	ldrh r0, [r5]
	ldr r7, _080F5090
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r2
	strh r0, [r5]
	ldr r0, _080F5094
	adds r3, r0
	ldrb r0, [r3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3]
	lsls r4, 16
	lsrs r7, r4, 16
_080F500C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r1, r8
	ldrb r1, [r1]
	cmp r6, r1
	bcc _080F4FAA
_080F501A:
	mov r2, r9
	ldr r4, [r2]
	lsls r1, r7, 2
	adds r1, r4, r1
	ldr r3, _080F5084
	adds r0, r1, r3
	movs r5, 0
	strb r5, [r0]
	ldr r0, _080F5088
	adds r2, r1, r0
	ldrb r3, [r2]
	movs r0, 0x20
	negs r0, r0
	ands r0, r3
	strb r0, [r2]
	ldrh r3, [r2]
	ldr r0, _080F5090
	ands r0, r3
	strh r0, [r2]
	ldr r2, _080F5094
	adds r1, r2
	ldrb r2, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r3, _080F5098
	adds r0, r4, r3
	strh r5, [r0]
	adds r1, r7, 0x1
	ldr r7, _080F509C
	adds r0, r4, r7
	strh r1, [r0]
	bl sub_80F4B20
	ldr r0, _080F50A0
	adds r4, r0
	movs r0, 0x1
	strb r0, [r4]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5078: .4byte gUnknown_083DFEC4
_080F507C: .4byte 0x00008828
_080F5080: .4byte gPlayerParty
_080F5084: .4byte 0x0000893d
_080F5088: .4byte 0x0000893e
_080F508C: .4byte 0x000001ff
_080F5090: .4byte 0xffffc01f
_080F5094: .4byte 0x0000893f
_080F5098: .4byte 0x000087dc
_080F509C: .4byte 0x000087da
_080F50A0: .4byte 0x000087cb
	thumb_func_end sub_80F4BD0

	thumb_func_start sub_80F4CF0
sub_80F4CF0: @ 80F50A4
	push {r4,lr}
	ldr r0, _080F50D0
	ldr r4, [r0]
	ldr r1, _080F50D4
	adds r0, r4, r1
	ldrh r1, [r0]
	ldr r2, _080F50D8
	adds r0, r4, r2
	strh r1, [r0]
	bl sub_80F4B20
	ldr r1, _080F50DC
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080F50E4
	ldr r0, _080F50E0
	adds r1, r4, r0
	movs r0, 0
	b _080F50EA
	.align 2, 0
_080F50D0: .4byte gUnknown_083DFEC4
_080F50D4: .4byte 0x0000876e
_080F50D8: .4byte 0x000087dc
_080F50DC: .4byte 0x00008774
_080F50E0: .4byte 0x000087cb
_080F50E4:
	ldr r2, _080F50F4
	adds r1, r4, r2
	movs r0, 0x1
_080F50EA:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F50F4: .4byte 0x000087cb
	thumb_func_end sub_80F4CF0

	thumb_func_start sub_80F4D44
sub_80F4D44: @ 80F50F8
	push {r4,lr}
	ldr r0, _080F512C
	ldr r4, [r0]
	ldr r1, _080F5130
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080F5134
	adds r0, r4, r2
	strb r1, [r0]
	bl sub_80F492C
	ldr r0, _080F5138
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F5124
_080F511A:
	bl sub_80F4D88
	lsls r0, 24
	cmp r0, 0
	bne _080F511A
_080F5124:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F512C: .4byte gUnknown_083DFEC4
_080F5130: .4byte 0x00008fe6
_080F5134: .4byte 0x00008fe7
_080F5138: .4byte 0x00006dac
	thumb_func_end sub_80F4D44

	thumb_func_start sub_80F4D88
sub_80F4D88: @ 80F513C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r6, _080F524C
	ldr r4, [r6]
	ldr r1, _080F5250
	adds r0, r4, r1
	ldrb r3, [r0]
	cmp r3, 0xE
	bne _080F5158
	b _080F526C
_080F5158:
	cmp r3, 0xF
	bne _080F515E
	b _080F5314
_080F515E:
	movs r1, 0x80
	lsls r1, 23
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	movs r7, 0
	mov r10, r6
	ldr r2, _080F5250
	adds r6, r4, r2
	ldr r3, _080F5254
	adds r5, r4, r3
	ldr r0, _080F5258
	adds r0, r4
	mov r9, r0
	ldr r1, _080F525C
	mov r8, r1
_080F517E:
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r5]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _080F5214
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r5]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	bne _080F5214
	ldrb r1, [r6]
	lsls r1, 8
	ldr r2, _080F5260
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrb r2, [r5]
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 16
	ldr r1, _080F5264
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	ldrb r0, [r6]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r5]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	mov r2, r9
	ldrb r1, [r2]
	bl GetBoxMonData
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F5268
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	mov r0, sp
	bl sub_80F4944
_080F5214:
	mov r3, r10
	ldr r1, [r3]
	ldr r0, _080F5254
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	movs r4, 0
	strb r0, [r2]
	movs r3, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bne _080F5240
	strb r4, [r2]
	ldr r2, _080F5250
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ands r0, r3
	cmp r0, 0xE
	beq _080F5318
_080F5240:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xE
	bls _080F517E
	b _080F5318
	.align 2, 0
_080F524C: .4byte gUnknown_083DFEC4
_080F5250: .4byte 0x00008fe6
_080F5254: .4byte 0x00008fe7
_080F5258: .4byte 0x000087d8
_080F525C: .4byte gUnknown_020300A4
_080F5260: .4byte 0xffff00ff
_080F5264: .4byte 0xffe0ffff
_080F5268: .4byte 0xffffff00
_080F526C:
	mov r2, sp
	ldrb r0, [r2, 0x3]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x3]
	strb r3, [r2, 0x1]
	movs r7, 0
	ldr r3, _080F52F8
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r7, r0
	bcs _080F52D8
	mov r5, sp
	mov r8, r6
	adds r6, r4, r3
_080F528A:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080F52FC
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080F52CC
	movs r0, 0x1F
	adds r2, r7, 0
	ands r2, r0
	ldrb r0, [r5, 0x2]
	movs r3, 0x20
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x2]
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _080F5300
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r4, 0
	bl GetMonData
	strb r0, [r5]
	mov r0, sp
	bl sub_80F4944
_080F52CC:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldrb r3, [r6]
	cmp r7, r3
	bcc _080F528A
_080F52D8:
	bl sub_80F49F4
	ldr r0, _080F5304
	ldr r1, [r0]
	ldr r2, _080F5308
	adds r0, r1, r2
	ldrh r2, [r0]
	ldr r3, _080F530C
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080F5310
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F5318
	.align 2, 0
_080F52F8: .4byte 0x00008828
_080F52FC: .4byte gPlayerParty
_080F5300: .4byte 0x000087d8
_080F5304: .4byte gUnknown_083DFEC4
_080F5308: .4byte 0x00008fe4
_080F530C: .4byte 0x000087da
_080F5310: .4byte 0x00008fe6
_080F5314:
	movs r0, 0
	b _080F531A
_080F5318:
	movs r0, 0x1
_080F531A:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F4D88

	thumb_func_start sub_80F4F78
sub_80F4F78: @ 80F532C
	push {lr}
	ldr r0, _080F5358
	ldr r1, [r0]
	ldr r2, _080F535C
	adds r0, r1, r2
	ldr r3, _080F5360
	adds r2, r1, r3
	movs r3, 0
	ldrsb r3, [r2, r3]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 2
	ldr r3, _080F5364
	adds r2, r3
	adds r1, r2
	bl sub_80F53EC
	bl sub_80F5504
	pop {r0}
	bx r0
	.align 2, 0
_080F5358: .4byte gUnknown_083DFEC4
_080F535C: .4byte 0x00009040
_080F5360: .4byte 0x00008fe9
_080F5364: .4byte 0x00009004
	thumb_func_end sub_80F4F78

	thumb_func_start sub_80F4FB4
sub_80F4FB4: @ 80F5368
	push {r4,lr}
	bl sub_80F5504
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F170C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r4, 0
	bne _080F5386
	cmp r0, 0
	beq _080F5388
_080F5386:
	movs r1, 0x1
_080F5388:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F4FB4

	thumb_func_start sub_80F4FDC
sub_80F4FDC: @ 80F5390
	push {lr}
	ldr r0, _080F53D4
	ldr r2, [r0]
	ldr r1, _080F53D8
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F53B2
	ldr r3, _080F53DC
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r3, _080F53E0
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	beq _080F53CE
_080F53B2:
	ldr r1, _080F53E4
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r3, _080F53E8
	adds r0, r3
	adds r0, r2, r0
	adds r3, 0x3C
	adds r1, r2, r3
	bl sub_80F53EC
_080F53CE:
	pop {r0}
	bx r0
	.align 2, 0
_080F53D4: .4byte gUnknown_083DFEC4
_080F53D8: .4byte 0x000076aa
_080F53DC: .4byte 0x000087dc
_080F53E0: .4byte 0x00008828
_080F53E4: .4byte 0x00008fe9
_080F53E8: .4byte 0x00009004
	thumb_func_end sub_80F4FDC

	thumb_func_start sub_80F5038
sub_80F5038: @ 80F53EC
	push {r4,lr}
	bl sub_80F5504
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80F173C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r4, 0
	bne _080F540A
	cmp r0, 0
	beq _080F540C
_080F540A:
	movs r1, 0x1
_080F540C:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5038

	thumb_func_start sub_80F5060
sub_80F5060: @ 80F5414
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	beq _080F5430
	ldr r0, _080F5428
	ldr r0, [r0]
	ldr r1, _080F542C
	adds r0, r1
	b _080F5438
	.align 2, 0
_080F5428: .4byte gUnknown_083DFEC4
_080F542C: .4byte 0x00008feb
_080F5430:
	ldr r0, _080F54B0
	ldr r0, [r0]
	ldr r2, _080F54B4
	adds r0, r2
_080F5438:
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F54B0
	ldr r4, [r0]
	ldr r3, _080F54B8
	adds r5, r4, r3
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r2, _080F54BC
	adds r0, r2
	adds r0, r4, r0
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 2
	adds r1, r2
	adds r1, r4, r1
	bl sub_80F53EC
	ldr r0, _080F54C0
	adds r3, r4, r0
	movs r1, 0
	ldrsh r0, [r3, r1]
	lsls r0, 2
	adds r0, r4, r0
	ldr r2, _080F54C4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 31
	mov r12, r0
	cmp r7, 0
	beq _080F550C
	ldr r7, _080F54B4
	adds r1, r4, r7
	ldrb r0, [r1]
	adds r7, 0x1
	adds r2, r4, r7
	strb r0, [r2]
	ldrb r0, [r5]
	strb r0, [r1]
	strb r6, [r5]
	ldrb r1, [r2]
	ldr r2, _080F54C8
	adds r0, r4, r2
	strb r1, [r0]
	adds r5, r4, 0
	ldrh r1, [r3]
	movs r7, 0
	ldrsh r0, [r3, r7]
	cmp r0, 0
	beq _080F54CC
	subs r2, r1, 0x1
	b _080F54D4
	.align 2, 0
_080F54B0: .4byte gUnknown_083DFEC4
_080F54B4: .4byte 0x00008fea
_080F54B8: .4byte 0x00008fe9
_080F54BC: .4byte 0x00009004
_080F54C0: .4byte 0x000087dc
_080F54C4: .4byte 0x0000893f
_080F54C8: .4byte 0x00008fec
_080F54CC:
	ldr r1, _080F54F0
	adds r0, r4, r1
	ldrh r0, [r0]
	subs r2, r0, 0x1
_080F54D4:
	ldr r1, _080F54F4
	adds r0, r5, r1
	strh r2, [r0]
	ldr r2, _080F54F8
	ldr r3, [r2]
	adds r1, r3, r1
	ldrh r4, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _080F54FC
	subs r1, r4, 0x1
	b _080F5582
	.align 2, 0
_080F54F0: .4byte 0x000087da
_080F54F4: .4byte 0x000087dc
_080F54F8: .4byte gUnknown_083DFEC4
_080F54FC:
	ldr r7, _080F5508
	adds r0, r3, r7
	ldrh r0, [r0]
	subs r1, r0, 0x1
	b _080F5582
	.align 2, 0
_080F5508: .4byte 0x000087da
_080F550C:
	ldr r7, _080F5540
	adds r1, r4, r7
	ldrb r0, [r1]
	subs r7, 0x1
	adds r2, r4, r7
	strb r0, [r2]
	ldrb r0, [r5]
	strb r0, [r1]
	strb r6, [r5]
	ldrb r1, [r2]
	ldr r2, _080F5544
	adds r0, r4, r2
	strb r1, [r0]
	adds r2, r4, 0
	movs r4, 0
	ldrsh r1, [r3, r4]
	ldr r5, _080F5548
	adds r0, r2, r5
	movs r7, 0
	ldrsh r0, [r0, r7]
	subs r0, 0x1
	cmp r1, r0
	bge _080F554C
	ldrh r0, [r3]
	adds r3, r0, 0x1
	b _080F554E
	.align 2, 0
_080F5540: .4byte 0x00008feb
_080F5544: .4byte 0x00008fec
_080F5548: .4byte 0x000087da
_080F554C:
	movs r3, 0
_080F554E:
	ldr r1, _080F5574
	adds r0, r2, r1
	strh r3, [r0]
	ldr r2, _080F5578
	ldr r3, [r2]
	adds r4, r3, r1
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r5, _080F557C
	adds r0, r3, r5
	movs r7, 0
	ldrsh r0, [r0, r7]
	subs r0, 0x1
	cmp r1, r0
	bge _080F5580
	ldrh r0, [r4]
	adds r1, r0, 0x1
	b _080F5582
	.align 2, 0
_080F5574: .4byte 0x000087dc
_080F5578: .4byte gUnknown_083DFEC4
_080F557C: .4byte 0x000087da
_080F5580:
	movs r1, 0
_080F5582:
	ldr r4, _080F55B0
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, [r2]
	ldr r5, _080F55B4
	adds r0, r1, r5
	movs r7, 0
	ldrsh r0, [r0, r7]
	lsls r0, 2
	adds r0, r1, r0
	ldr r3, _080F55B8
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 31
	mov r4, r12
	cmp r4, 0
	bne _080F55C0
	adds r5, 0x4
	adds r1, r5
	ldr r0, _080F55BC
	b _080F55DA
	.align 2, 0
_080F55B0: .4byte 0x00008fee
_080F55B4: .4byte 0x000087dc
_080F55B8: .4byte 0x0000893f
_080F55BC: .4byte sub_80F5264
_080F55C0:
	cmp r0, 0
	bne _080F55D4
	ldr r7, _080F55CC
	adds r1, r7
	ldr r0, _080F55D0
	b _080F55DA
	.align 2, 0
_080F55CC: .4byte 0x000087e0
_080F55D0: .4byte sub_80F52F8
_080F55D4:
	ldr r0, _080F55EC
	adds r1, r0
	ldr r0, _080F55F0
_080F55DA:
	str r0, [r1]
	ldr r0, [r2]
	ldr r1, _080F55F4
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F55EC: .4byte 0x000087e0
_080F55F0: .4byte sub_80F5364
_080F55F4: .4byte 0x000087de
	thumb_func_end sub_80F5060

	thumb_func_start gpu_sync_bg_show
gpu_sync_bg_show: @ 80F55F8
	push {lr}
	ldr r0, _080F5610
	ldr r0, [r0]
	ldr r1, _080F5614
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080F5610: .4byte gUnknown_083DFEC4
_080F5614: .4byte 0x000087e0
	thumb_func_end gpu_sync_bg_show

	thumb_func_start sub_80F5264
sub_80F5264: @ 80F5618
	push {r4,r5,lr}
	ldr r0, _080F5634
	ldr r0, [r0]
	ldr r1, _080F5638
	adds r5, r0, r1
	ldrb r1, [r5]
	cmp r1, 0x1
	beq _080F565E
	cmp r1, 0x1
	bgt _080F563C
	cmp r1, 0
	beq _080F5642
	b _080F56A4
	.align 2, 0
_080F5634: .4byte gUnknown_083DFEC4
_080F5638: .4byte 0x000087de
_080F563C:
	cmp r1, 0x2
	beq _080F56A0
	b _080F56A4
_080F5642:
	ldr r2, _080F568C
	adds r4, r0, r2
	ldrb r0, [r4]
	bl sub_80F2E18
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
_080F565E:
	bl sub_80F4FB4
	lsls r0, 24
	cmp r0, 0
	bne _080F56A4
	ldr r0, _080F5690
	ldr r4, [r0]
	ldr r1, _080F5694
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	ldr r2, _080F5698
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F4900
	ldr r0, _080F569C
	adds r4, r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F56A4
	.align 2, 0
_080F568C: .4byte 0x00008fe9
_080F5690: .4byte gUnknown_083DFEC4
_080F5694: .4byte 0x00008fee
_080F5698: .4byte 0x00008fec
_080F569C: .4byte 0x000087de
_080F56A0:
	movs r0, 0
	b _080F56A6
_080F56A4:
	movs r0, 0x1
_080F56A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5264

	thumb_func_start sub_80F52F8
sub_80F52F8: @ 80F56AC
	push {r4,r5,lr}
	ldr r0, _080F56C4
	ldr r4, [r0]
	ldr r0, _080F56C8
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080F56CC
	cmp r0, 0x1
	beq _080F570C
	b _080F5710
	.align 2, 0
_080F56C4: .4byte gUnknown_083DFEC4
_080F56C8: .4byte 0x000087de
_080F56CC:
	bl sub_80F5038
	lsls r0, 24
	cmp r0, 0
	bne _080F5710
	ldr r1, _080F5704
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	ldr r2, _080F5708
	adds r0, r4, r2
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r2, 0x2
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F4900
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _080F5710
	.align 2, 0
_080F5704: .4byte 0x00008fe9
_080F5708: .4byte 0x00008fee
_080F570C:
	movs r0, 0
	b _080F5712
_080F5710:
	movs r0, 0x1
_080F5712:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F52F8

	thumb_func_start sub_80F5364
sub_80F5364: @ 80F5718
	push {r4,r5,lr}
	ldr r0, _080F5734
	ldr r4, [r0]
	ldr r0, _080F5738
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _080F576C
	cmp r0, 0x1
	bgt _080F573C
	cmp r0, 0
	beq _080F5742
	b _080F5798
	.align 2, 0
_080F5734: .4byte gUnknown_083DFEC4
_080F5738: .4byte 0x000087de
_080F573C:
	cmp r0, 0x2
	beq _080F577E
	b _080F5798
_080F5742:
	bl sub_80F5504
	bl sub_80F173C
	lsls r0, 24
	cmp r0, 0
	bne _080F5798
	ldr r1, _080F5768
	adds r4, r1
	ldrb r0, [r4]
	bl sub_80F2E18
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	bl sub_80F01E0
	b _080F5776
	.align 2, 0
_080F5768: .4byte 0x00008fe9
_080F576C:
	bl sub_80F4FB4
	lsls r0, 24
	cmp r0, 0
	bne _080F5798
_080F5776:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _080F5798
_080F577E:
	ldr r2, _080F5794
	adds r0, r4, r2
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r2, 0x2
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_80F4900
	movs r0, 0
	b _080F579A
	.align 2, 0
_080F5794: .4byte 0x00008fee
_080F5798:
	movs r0, 0x1
_080F579A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F5364

	thumb_func_start sub_80F53EC
sub_80F53EC: @ 80F57A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp]
	mov r9, r1
	movs r7, 0
	ldr r0, _080F58A8
	ldr r0, [r0]
	str r0, [sp, 0x4]
_080F57B8:
	lsls r4, r7, 2
	ldr r1, [sp]
	adds r0, r4, r1
	ldrh r1, [r0]
	lsls r5, r1, 8
	mov r2, r9
	adds r0, r4, r2
	ldrh r0, [r0]
	subs r0, r1
	lsls r0, 8
	movs r1, 0xA
	bl __divsi3
	adds r6, r0, 0
	movs r3, 0
	adds r7, 0x1
	mov r10, r7
	mov r8, r4
_080F57DC:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	add r0, r8
	ldr r7, [sp, 0x4]
	adds r0, r7, r0
	asrs r2, r5, 8
	asrs r1, r5, 7
	movs r7, 0x1
	ands r1, r7
	adds r2, r1
	ldr r1, _080F58AC
	adds r0, r1
	strh r2, [r0]
	adds r5, r6
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x8
	bls _080F57DC
	ldr r2, _080F58A8
	ldr r1, [r2]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4, r0
	adds r1, r0
	mov r3, r9
	adds r2, r4, r3
	ldrh r0, [r2]
	ldr r7, _080F58AC
	adds r1, r7
	strh r0, [r1]
	ldr r1, [sp]
	adds r0, r4, r1
	ldrh r1, [r0, 0x2]
	lsls r5, r1, 8
	ldrh r0, [r2, 0x2]
	subs r0, r1
	lsls r0, 8
	movs r1, 0xA
	bl __divsi3
	adds r6, r0, 0
	movs r3, 0
	ldr r0, _080F58A8
	ldr r0, [r0]
	mov r12, r0
	str r4, [sp, 0x8]
	movs r2, 0x1
	mov r8, r2
_080F5842:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	ldr r7, [sp, 0x8]
	adds r0, r7, r0
	add r0, r12
	asrs r2, r5, 8
	asrs r1, r5, 7
	mov r7, r8
	ands r1, r7
	adds r2, r1
	ldr r1, _080F58B0
	adds r0, r1
	strh r2, [r0]
	adds r5, r6
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x8
	bls _080F5842
	ldr r7, _080F58A8
	ldr r2, [r7]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r2, r0
	mov r3, r9
	adds r1, r4, r3
	ldrh r1, [r1, 0x2]
	ldr r7, _080F58B0
	adds r0, r7
	strh r1, [r0]
	mov r1, r10
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _080F57B8
	ldr r3, _080F58B4
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F58A8: .4byte gUnknown_083DFEC4
_080F58AC: .4byte 0x00009054
_080F58B0: .4byte 0x00009056
_080F58B4: .4byte 0x00009342
	thumb_func_end sub_80F53EC

	thumb_func_start sub_80F5504
sub_80F5504: @ 80F58B8
	push {r4,lr}
	ldr r0, _080F58D0
	ldr r2, [r0]
	ldr r0, _080F58D4
	adds r4, r2, r0
	ldrh r0, [r4]
	adds r1, r0, 0
	cmp r1, 0x9
	bls _080F58D8
	movs r0, 0
	b _080F58F8
	.align 2, 0
_080F58D0: .4byte gUnknown_083DFEC4
_080F58D4: .4byte 0x00009342
_080F58D8:
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F5900
	adds r0, r1
	adds r0, r2, r0
	bl sub_80F556C
	ldrh r1, [r4]
	movs r0, 0xA
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_080F58F8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F5900: .4byte 0x00009054
	thumb_func_end sub_80F5504

	thumb_func_start sub_80F5550
sub_80F5550: @ 80F5904
	push {lr}
	bl sub_80F53EC
	pop {r0}
	bx r0
	thumb_func_end sub_80F5550

	thumb_func_start sub_80F555C
sub_80F555C: @ 80F5910
	push {lr}
	bl sub_80F5504
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F555C

	thumb_func_start sub_80F556C
sub_80F556C: @ 80F5920
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _080F5954
	ldr r0, [r5]
	ldr r1, _080F5958
	adds r3, r0, r1
_080F592E:
	lsls r0, r2, 2
	adds r1, r3, r0
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _080F592E
	ldr r0, [r5]
	ldr r1, _080F595C
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F5954: .4byte gUnknown_083DFEC4
_080F5958: .4byte 0x0000911c
_080F595C: .4byte 0x00009344
	thumb_func_end sub_80F556C

	thumb_func_start sub_80F55AC
sub_80F55AC: @ 80F5960
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	mov r8, r1
	ldr r1, _080F5A28
	ldrb r0, [r6]
	adds r0, r1
	ldrb r2, [r0]
	adds r6, 0x1
	movs r0, 0x9B
	mov r3, r8
	strh r0, [r3]
	movs r0, 0x5B
	subs r0, r2
	strh r0, [r3, 0x2]
	movs r7, 0x40
	movs r0, 0
	mov r12, r0
	movs r2, 0x1
	mov r9, r2
	ldr r3, _080F5A2C
	mov r10, r3
_080F5992:
	adds r0, r7, 0
	adds r0, 0x33
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, r12
	lsls r0, r1, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r3, r0, 24
	mov r12, r3
	cmp r0, 0
	bge _080F59B0
	movs r0, 0x4
	mov r12, r0
_080F59B0:
	mov r1, r12
	lsls r0, r1, 24
	asrs r4, r0, 24
	cmp r4, 0x2
	bne _080F59C0
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_080F59C0:
	ldrb r0, [r6]
	ldr r2, _080F5A28
	adds r0, r2
	ldrb r2, [r0]
	adds r6, 0x1
	lsls r0, r4, 2
	mov r1, r8
	adds r3, r0, r1
	adds r0, r7, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r10
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r2
	asrs r5, r0, 8
	adds r0, r5, 0
	adds r0, 0x9B
	strh r0, [r3]
	lsls r0, r7, 1
	add r0, r10
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r1, r2, 0
	muls r1, r0
	asrs r1, 8
	movs r0, 0x5B
	subs r0, r1
	strh r0, [r3, 0x2]
	cmp r4, 0x2
	bgt _080F5A0C
	cmp r2, 0x20
	bne _080F5A06
	cmp r4, 0x2
	beq _080F5A0C
_080F5A06:
	adds r0, r5, 0
	adds r0, 0x9C
	strh r0, [r3]
_080F5A0C:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x4
	bls _080F5992
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5A28: .4byte gUnknown_083E4890
_080F5A2C: .4byte gSineTable
	thumb_func_end sub_80F55AC

	thumb_func_start sub_80F567C
sub_80F567C: @ 80F5A30
	push {lr}
	bl sub_80F55AC
	pop {r0}
	bx r0
	thumb_func_end sub_80F567C

	thumb_func_start sub_80F5688
sub_80F5688: @ 80F5A3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r6, r0, 0
	adds r5, r1, 0
	str r2, [sp]
	ldr r7, [sp, 0x34]
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	movs r0, 0
	str r0, [sp, 0x8]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r2, 0x2]
	cmp r0, r1
	bcs _080F5A84
	adds r2, r0, 0
	str r2, [sp, 0x4]
	ldr r3, [sp]
	ldrh r0, [r3, 0x2]
	ldrh r1, [r5]
	lsls r4, r1, 10
	ldrh r2, [r3]
	mov r10, r2
	ldr r3, [sp, 0x4]
	subs r0, r3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _080F5AB0
	subs r0, r2, r1
	b _080F5AA6
_080F5A84:
	ldrh r0, [r5, 0x2]
	ldr r1, [sp]
	ldrh r1, [r1, 0x2]
	str r1, [sp, 0x4]
	ldr r2, [sp]
	ldrh r1, [r2]
	lsls r4, r1, 10
	ldrh r3, [r5]
	mov r10, r3
	ldr r2, [sp, 0x4]
	subs r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _080F5AB0
	subs r0, r3, r1
_080F5AA6:
	lsls r0, 10
	mov r1, r8
	bl __divsi3
	str r0, [sp, 0x8]
_080F5AB0:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r7, 0
	bne _080F5AFA
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	movs r5, 0
	mov r3, r9
	lsls r3, 1
	mov r12, r3
	mov r0, r10
	add r0, r9
	str r0, [sp, 0xC]
	cmp r7, r8
	bcs _080F5B88
	movs r7, 0x1
_080F5ADA:
	adds r2, r3, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r7
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r1, [sp, 0x8]
	adds r4, r1
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5ADA
	b _080F5B88
_080F5AFA:
	ldr r2, [sp, 0x8]
	cmp r2, 0
	ble _080F5B98
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r7, r0
	movs r5, 0
	mov r3, r9
	lsls r3, 1
	mov r12, r3
	mov r0, r10
	add r0, r9
	str r0, [sp, 0xC]
	cmp r5, r8
	bcs _080F5B4C
	ldr r0, _080F5B8C
	cmp r4, r0
	bgt _080F5B4C
	mov r1, r12
	str r1, [sp, 0x10]
	mov r10, r0
_080F5B26:
	ldr r3, [sp, 0x10]
	adds r2, r3, r7
	asrs r1, r4, 10
	asrs r0, r4, 9
	movs r3, 0x1
	ands r0, r3
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r7, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcs _080F5B4C
	cmp r4, r10
	ble _080F5B26
_080F5B4C:
	ldr r1, _080F5B90
	ldr r0, [r1]
	ldr r2, [sp, 0x4]
	adds r1, r2, r5
	ldr r3, _080F5B94
	adds r0, r3
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	cmp r5, r8
	bcs _080F5B88
	mov r3, r12
	movs r7, 0x1
_080F5B6A:
	adds r2, r3, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r7
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5B6A
_080F5B88:
	subs r0, r6, 0x4
	b _080F5C78
	.align 2, 0
_080F5B8C: .4byte 0x00026bff
_080F5B90: .4byte gUnknown_083DFEC4
_080F5B94: .4byte 0x00009340
_080F5B98:
	ldr r1, [sp, 0x8]
	cmp r1, 0
	bge _080F5C44
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	movs r5, 0
	mov r2, r9
	lsls r2, 1
	mov r12, r2
	mov r3, r10
	add r3, r9
	str r3, [sp, 0xC]
	cmp r5, r8
	bcs _080F5BF6
	adds r3, r2, r6
	asrs r1, r4, 10
	asrs r0, r4, 9
	movs r2, 0x1
	ands r0, r2
	adds r1, r0
	add r1, r9
	strh r1, [r3]
	b _080F5BEC
_080F5BCA:
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r6, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcs _080F5BF6
	mov r1, r12
	adds r3, r1, r6
	asrs r2, r4, 10
	asrs r0, r4, 9
	movs r1, 0x1
	ands r0, r1
	adds r2, r0
	add r2, r9
	strh r2, [r3]
_080F5BEC:
	ldr r0, _080F5C38
	cmp r4, r0
	bgt _080F5BCA
	movs r0, 0x9B
	strh r0, [r3]
_080F5BF6:
	ldr r2, _080F5C3C
	ldr r0, [r2]
	ldr r3, [sp, 0x4]
	adds r1, r3, r5
	ldr r2, _080F5C40
	adds r0, r2
	strh r1, [r0]
	ldrh r0, [r0]
	subs r0, 0x38
	lsls r0, 2
	adds r7, r0
	cmp r5, r8
	bcs _080F5C32
	mov r3, r12
	movs r6, 0x1
_080F5C14:
	adds r2, r3, r7
	asrs r1, r4, 10
	asrs r0, r4, 9
	ands r0, r6
	adds r1, r0
	add r1, r9
	strh r1, [r2]
	ldr r0, [sp, 0x8]
	adds r4, r0
	adds r7, 0x4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080F5C14
_080F5C32:
	subs r0, r7, 0x4
	b _080F5C78
	.align 2, 0
_080F5C38: .4byte 0x00026bff
_080F5C3C: .4byte gUnknown_083DFEC4
_080F5C40: .4byte 0x00009340
_080F5C44:
	ldr r0, _080F5C70
	ldr r0, [r0]
	ldr r1, _080F5C74
	adds r0, r1
	mov r2, sp
	ldrh r2, [r2, 0x4]
	strh r2, [r0]
	ldr r0, [sp, 0x4]
	subs r0, 0x38
	lsls r0, 2
	adds r6, r0
	adds r7, r0
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r6, 0x2]
	ldr r3, [sp]
	ldrh r0, [r3]
	strh r0, [r7]
	movs r0, 0x9B
	strh r0, [r7, 0x2]
	b _080F5C80
	.align 2, 0
_080F5C70: .4byte gUnknown_083DFEC4
_080F5C74: .4byte 0x00009340
_080F5C78:
	add r0, r12
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r0]
_080F5C80:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F5688

	thumb_func_start sub_80F58DC
sub_80F58DC: @ 80F5C90
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2]
	ldrh r1, [r5, 0x6]
	cmp r0, r1
	bcs _080F5CC8
	adds r4, r0, 0
	mov r8, r4
	ldr r0, _080F5CC0
	ldr r0, [r0]
	ldr r1, _080F5CC4
	adds r0, r1
	adds r4, r5, 0x4
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_80F5688
	b _080F5CE4
	.align 2, 0
_080F5CC0: .4byte gUnknown_083DFEC4
_080F5CC4: .4byte 0x00009130
_080F5CC8:
	ldrh r4, [r5, 0x6]
	mov r8, r4
	ldr r0, _080F5DBC
	ldr r0, [r0]
	ldr r1, _080F5DC0
	adds r0, r1
	adds r4, r5, 0x4
	movs r1, 0
	str r1, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_80F5688
_080F5CE4:
	adds r1, r4, 0
	ldr r0, _080F5DBC
	ldr r6, [r0]
	ldr r0, _080F5DC0
	adds r4, r6, r0
	adds r7, r5, 0
	adds r7, 0x8
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r7, 0
	movs r3, 0x1
	bl sub_80F5688
	movs r3, 0
	ldrh r0, [r5, 0xA]
	ldrh r1, [r5, 0xE]
	cmp r0, r1
	bhi _080F5D0C
	movs r3, 0x1
_080F5D0C:
	adds r2, r5, 0
	adds r2, 0xC
	ldr r1, _080F5DC4
	adds r0, r6, r1
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r7, 0
	bl sub_80F5688
	movs r2, 0x38
	cmp r2, r8
	bcs _080F5D44
	adds r7, r4, 0
	movs r3, 0
	ldr r0, _080F5DC8
	adds r4, r6, r0
_080F5D2C:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r7, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r8
	bcc _080F5D2C
_080F5D44:
	ldrh r2, [r5, 0x2]
	ldr r0, _080F5DBC
	ldr r3, [r0]
	ldr r4, _080F5DCC
	adds r1, r3, r4
	adds r6, r0, 0
	ldrh r0, [r1]
	cmp r2, r0
	bhi _080F5D72
	ldr r4, _080F5DC0
	adds r3, r4
	movs r4, 0x9B
_080F5D5C:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1]
	cmp r2, r0
	bls _080F5D5C
_080F5D72:
	ldr r4, [r6]
	ldr r1, _080F5DCC
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r1, [r5, 0xA]
	cmp r0, r1
	bcs _080F5D82
	adds r0, r1, 0
_080F5D82:
	adds r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bhi _080F5DAE
	ldr r0, _080F5DC0
	adds r5, r4, r0
	movs r3, 0
	ldr r1, _080F5DC8
	adds r4, r1
_080F5D96:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r5, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bls _080F5D96
_080F5DAE:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5DBC: .4byte gUnknown_083DFEC4
_080F5DC0: .4byte 0x00009130
_080F5DC4: .4byte 0x00009238
_080F5DC8: .4byte 0x00009132
_080F5DCC: .4byte 0x00009340
	thumb_func_end sub_80F58DC

	thumb_func_start sub_80F5A1C
sub_80F5A1C: @ 80F5DD0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2]
	ldrh r1, [r5, 0x12]
	cmp r0, r1
	bcs _080F5E08
	adds r7, r0, 0
	ldr r0, _080F5E00
	ldr r0, [r0]
	ldr r2, _080F5E04
	adds r0, r2
	adds r4, r5, 0
	adds r4, 0x10
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl sub_80F5688
	b _080F5E24
	.align 2, 0
_080F5E00: .4byte gUnknown_083DFEC4
_080F5E04: .4byte 0x00009238
_080F5E08:
	ldrh r7, [r5, 0x12]
	ldr r0, _080F5EDC
	ldr r0, [r0]
	ldr r4, _080F5EE0
	adds r0, r4
	adds r4, r5, 0
	adds r4, 0x10
	movs r1, 0
	str r1, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_80F5688
_080F5E24:
	adds r1, r4, 0
	ldr r0, _080F5EDC
	ldr r0, [r0]
	mov r8, r0
	ldr r4, _080F5EE0
	add r4, r8
	adds r2, r5, 0
	adds r2, 0xC
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0
	bl sub_80F5688
	movs r2, 0x38
	cmp r2, r7
	bcs _080F5E66
	adds r6, r4, 0
	movs r3, 0
	ldr r4, _080F5EE4
	add r4, r8
_080F5E4E:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r6, r0
	strh r3, [r1]
	adds r0, r4, r0
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r7
	bcc _080F5E4E
_080F5E66:
	ldrh r2, [r5, 0x2]
	ldr r0, _080F5EDC
	ldr r3, [r0]
	ldr r4, _080F5EE8
	adds r1, r3, r4
	adds r6, r0, 0
	ldrh r0, [r1]
	cmp r2, r0
	bhi _080F5E94
	ldr r4, _080F5EE4
	adds r3, r4
	movs r4, 0x9B
_080F5E7E:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1]
	cmp r2, r0
	bls _080F5E7E
_080F5E94:
	ldrh r0, [r5, 0xE]
	adds r1, r0, 0x1
	ldr r3, [r6]
	ldr r2, _080F5EE8
	adds r0, r3, r2
	ldrh r0, [r0]
	cmp r0, r1
	bge _080F5EA6
	adds r0, r1, 0
_080F5EA6:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bhi _080F5ED0
	ldr r4, _080F5EE0
	adds r5, r3, r4
	movs r4, 0
	ldr r0, _080F5EE4
	adds r3, r0
_080F5EB8:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 2
	adds r1, r5, r0
	strh r4, [r1]
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x79
	bls _080F5EB8
_080F5ED0:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F5EDC: .4byte gUnknown_083DFEC4
_080F5EE0: .4byte 0x00009238
_080F5EE4: .4byte 0x0000923a
_080F5EE8: .4byte 0x00009340
	thumb_func_end sub_80F5A1C

	thumb_func_start sub_80F5B38
sub_80F5B38: @ 80F5EEC
	ldr r0, _080F5EFC
	ldr r0, [r0]
	ldr r1, _080F5F00
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F5EFC: .4byte gUnknown_083DFEC4
_080F5F00: .4byte 0x00009345
	thumb_func_end sub_80F5B38

	thumb_func_start sub_80F5B50
sub_80F5B50: @ 80F5F04
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r0, _080F5F1C
	ldr r0, [r0]
	ldr r1, _080F5F20
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080F5F24
	cmp r0, 0x1
	beq _080F5F68
	b _080F5F80
	.align 2, 0
_080F5F1C: .4byte gUnknown_083DFEC4
_080F5F20: .4byte 0x00009345
_080F5F24:
	bl dp12_8087EA4
	ldr r0, _080F5F5C
	movs r2, 0xEF
	movs r3, 0xF4
	lsls r3, 3
	adds r1, r0, r3
	adds r0, 0x20
	movs r3, 0xF
_080F5F36:
	strh r2, [r0]
	strh r2, [r0, 0x2]
	strh r2, [r1]
	strh r2, [r1, 0x2]
	adds r1, 0x4
	adds r0, 0x4
	subs r3, 0x1
	cmp r3, 0
	bge _080F5F36
	ldr r0, _080F5F60
	ldr r1, [r0]
	ldr r5, _080F5F64
	adds r1, r5
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	b _080F5F82
	.align 2, 0
_080F5F5C: .4byte gUnknown_03004DE0
_080F5F60: .4byte gUnknown_083DFEC4
_080F5F64: .4byte 0x00009345
_080F5F68:
	mov r0, sp
	ldr r1, _080F5F8C
	ldm r1!, {r2,r3,r5}
	stm r0!, {r2,r3,r5}
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080F5F80:
	movs r0, 0
_080F5F82:
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F5F8C: .4byte gUnknown_083E4990
	thumb_func_end sub_80F5B50

	thumb_func_start sub_80F5BDC
sub_80F5BDC: @ 80F5F90
	push {lr}
	ldr r1, _080F5FA0
	movs r0, 0x3
	strb r0, [r1, 0x15]
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080F5FA0: .4byte gUnknown_03004DC0
	thumb_func_end sub_80F5BDC

	thumb_func_start sub_80F5BF0
sub_80F5BF0: @ 80F5FA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r0, _080F606C
	ldr r5, [r0]
	ldr r1, _080F6070
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F605A
	ldr r0, _080F6074
	adds r4, r5, r0
	adds r0, r4, 0
	bl sub_80F58DC
	adds r0, r4, 0
	bl sub_80F5A1C
	movs r6, 0
	ldr r1, _080F6078
	mov r12, r1
	movs r0, 0xF0
	lsls r0, 3
	add r0, r12
	mov r9, r0
	adds r7, r5, 0
	ldr r1, _080F607C
	mov r8, r1
	ldr r5, _080F6080
	adds r5, r7, r5
	str r5, [sp]
	ldr r0, _080F6084
	adds r0, r7, r0
	str r0, [sp, 0x4]
	ldr r1, _080F6088
	adds r1, r7
	mov r10, r1
_080F5FF4:
	adds r2, r6, 0
	adds r2, 0x37
	lsls r3, r2, 2
	mov r5, r9
	adds r5, r3, r5
	str r5, [sp, 0x8]
	add r3, r12
	lsls r4, r6, 2
	ldr r1, [sp]
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r0, 8
	ldr r5, [sp, 0x4]
	adds r1, r5, r4
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	mov r1, r8
	ands r0, r1
	ldr r5, [sp, 0x8]
	strh r0, [r5]
	lsls r2, 1
	adds r2, 0x1
	lsls r2, 1
	mov r0, r9
	adds r3, r2, r0
	add r2, r12
	mov r1, r10
	adds r0, r1, r4
	ldrh r1, [r0]
	lsls r1, 8
	ldr r5, _080F608C
	adds r0, r7, r5
	adds r0, r4
	ldrh r0, [r0]
	orrs r1, r0
	strh r1, [r2]
	mov r0, r8
	ands r1, r0
	strh r1, [r3]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080F606C
	cmp r6, 0x41
	bls _080F5FF4
	ldr r0, [r0]
	ldr r1, _080F6070
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080F605A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F606C: .4byte gUnknown_083DFEC4
_080F6070: .4byte 0x00009344
_080F6074: .4byte 0x0000911c
_080F6078: .4byte gUnknown_03004DE0
_080F607C: .4byte 0x0000ffff
_080F6080: .4byte 0x00009130
_080F6084: .4byte 0x00009132
_080F6088: .4byte 0x00009238
_080F608C: .4byte 0x0000923a
	thumb_func_end sub_80F5BF0

	thumb_func_start sub_80F5CDC
sub_80F5CDC: @ 80F6090
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080F6164
	ldr r6, [r0]
	ldr r1, _080F6168
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F6154
	ldr r0, _080F616C
	adds r4, r6, r0
	adds r0, r4, 0
	bl sub_80F58DC
	adds r0, r4, 0
	bl sub_80F5A1C
	movs r0, 0x37
	subs r0, r5
	lsls r0, 17
	lsrs r5, r0, 16
	movs r7, 0
	ldr r1, _080F6170
	mov r12, r1
	movs r4, 0xF0
	lsls r4, 3
	add r4, r12
	mov r9, r4
	ldr r0, _080F6174
	mov r8, r0
	ldr r1, _080F6178
	adds r1, r6, r1
	str r1, [sp]
	ldr r4, _080F617C
	adds r4, r6, r4
	str r4, [sp, 0x4]
	ldr r0, _080F6180
	adds r0, r6
	mov r10, r0
_080F60EA:
	lsls r2, r5, 1
	mov r1, r9
	adds r1, r2, r1
	str r1, [sp, 0x8]
	add r2, r12
	lsls r3, r7, 2
	ldr r4, [sp]
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, 8
	ldr r4, [sp, 0x4]
	adds r1, r4, r3
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	mov r1, r8
	ands r0, r1
	ldr r4, [sp, 0x8]
	strh r0, [r4]
	adds r2, r5, 0x1
	lsls r2, 1
	mov r0, r9
	adds r0, r2, r0
	str r0, [sp, 0x8]
	add r2, r12
	mov r1, r10
	adds r0, r1, r3
	ldrh r1, [r0]
	lsls r1, 8
	ldr r4, _080F6184
	adds r0, r6, r4
	adds r0, r3
	ldrh r0, [r0]
	orrs r1, r0
	strh r1, [r2]
	mov r0, r8
	ands r1, r0
	ldr r4, [sp, 0x8]
	strh r1, [r4]
	adds r0, r5, 0x2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080F6164
	cmp r7, 0x41
	bls _080F60EA
	ldr r0, [r0]
	ldr r1, _080F6168
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_080F6154:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6164: .4byte gUnknown_083DFEC4
_080F6168: .4byte 0x00009344
_080F616C: .4byte 0x0000911c
_080F6170: .4byte gUnknown_03004DE0
_080F6174: .4byte 0x0000ffff
_080F6178: .4byte 0x00009130
_080F617C: .4byte 0x00009132
_080F6180: .4byte 0x00009238
_080F6184: .4byte 0x0000923a
	thumb_func_end sub_80F5CDC

	thumb_func_start sub_80F5DD4
sub_80F5DD4: @ 80F6188
	push {lr}
	ldr r0, _080F619C
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F61A0
	bl sub_80F5E20
	b _080F61CC
	.align 2, 0
_080F619C: .4byte gMain
_080F61A0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F61AE
	bl sub_80F5EE4
	b _080F61CC
_080F61AE:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080F61BC
	bl sub_80F5FB4
	b _080F61CC
_080F61BC:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080F61C8
	movs r0, 0
	b _080F61D0
_080F61C8:
	bl sub_80F6010
_080F61CC:
	lsls r0, 24
	lsrs r0, 24
_080F61D0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F5DD4

	thumb_func_start sub_80F5E20
sub_80F5E20: @ 80F61D4
	push {r4,r5,lr}
	ldr r0, _080F61EC
	ldr r2, [r0]
	ldr r3, _080F61F0
	adds r1, r2, r3
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r4, r0, 0
	cmp r1, 0
	bne _080F61F4
	movs r0, 0
	b _080F627C
	.align 2, 0
_080F61EC: .4byte gUnknown_083DFEC4
_080F61F0: .4byte 0x0000876e
_080F61F4:
	ldr r1, _080F6220
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F6228
	ldr r3, _080F6224
	adds r0, r2, r3
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r0, 0
	bne _080F6228
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
	b _080F627C
	.align 2, 0
_080F6220: .4byte 0x000087c9
_080F6224: .4byte 0x0000876c
_080F6228:
	ldr r1, [r4]
	ldr r0, _080F6284
	adds r2, r1, r0
	ldrh r0, [r2]
	subs r3, r0, 0x1
	strh r3, [r2]
	ldr r5, _080F6288
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F624C
	lsls r0, r3, 16
	cmp r0, 0
	bge _080F624C
	ldr r3, _080F628C
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
_080F624C:
	ldr r0, [r4]
	ldr r5, _080F6290
	adds r2, r0, r5
	ldr r3, _080F6284
	adds r1, r0, r3
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r2, r1, r2
	subs r5, 0x2
	adds r4, r0, r5
	strh r2, [r4]
	ldr r1, _080F6294
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r3, [r0]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F627A
	subs r0, r2, 0x1
	subs r0, r3
	strh r0, [r4]
_080F627A:
	movs r0, 0x1
_080F627C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080F6284: .4byte 0x0000876c
_080F6288: .4byte 0x000087c9
_080F628C: .4byte 0x00008772
_080F6290: .4byte 0x00008770
_080F6294: .4byte 0x00008774
	thumb_func_end sub_80F5E20

	thumb_func_start sub_80F5EE4
sub_80F5EE4: @ 80F6298
	push {r4-r6,lr}
	ldr r3, _080F62B8
	ldr r4, [r3]
	ldr r1, _080F62BC
	adds r0, r4, r1
	ldr r2, _080F62C0
	adds r1, r4, r2
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r6, 0
	ldrsh r0, [r1, r6]
	adds r5, r3, 0
	cmp r2, r0
	bne _080F62C4
	movs r0, 0
	b _080F634C
	.align 2, 0
_080F62B8: .4byte gUnknown_083DFEC4
_080F62BC: .4byte 0x0000876e
_080F62C0: .4byte 0x00008774
_080F62C4:
	ldr r1, _080F62EC
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F62F4
	ldr r2, _080F62F0
	adds r0, r4, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0x7
	bne _080F62F4
	movs r0, 0x1
	bl sub_80F063C
	movs r0, 0x1
	bl sub_80F6074
	movs r0, 0x2
	b _080F634C
	.align 2, 0
_080F62EC: .4byte 0x000087c9
_080F62F0: .4byte 0x0000876c
_080F62F4:
	ldr r2, [r5]
	ldr r6, _080F6354
	adds r4, r2, r6
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	ldr r3, _080F6358
	adds r0, r2, r3
	ldrb r3, [r0]
	cmp r3, 0
	bne _080F631C
	adds r6, 0x6
	adds r0, r2, r6
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _080F631C
	strh r3, [r4]
_080F631C:
	ldr r0, [r5]
	ldr r3, _080F635C
	adds r2, r0, r3
	ldr r5, _080F6354
	adds r1, r0, r5
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r2, r1, r2
	ldr r6, _080F6360
	adds r4, r0, r6
	strh r2, [r4]
	ldr r1, _080F6364
	adds r0, r1
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r3, [r0]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F634A
	subs r0, r2, 0x1
	subs r0, r3
	strh r0, [r4]
_080F634A:
	movs r0, 0x1
_080F634C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F6354: .4byte 0x0000876c
_080F6358: .4byte 0x000087c9
_080F635C: .4byte 0x00008770
_080F6360: .4byte 0x0000876e
_080F6364: .4byte 0x00008774
	thumb_func_end sub_80F5EE4

	thumb_func_start sub_80F5FB4
sub_80F5FB4: @ 80F6368
	push {r4,lr}
	ldr r0, _080F638C
	ldr r1, [r0]
	ldr r2, _080F6390
	adds r0, r1, r2
	ldrh r3, [r0]
	movs r4, 0
	ldrsh r2, [r0, r4]
	cmp r2, 0
	beq _080F6386
	ldr r4, _080F6394
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F6398
_080F6386:
	movs r0, 0
	b _080F63B8
	.align 2, 0
_080F638C: .4byte gUnknown_083DFEC4
_080F6390: .4byte 0x00008770
_080F6394: .4byte 0x000087c9
_080F6398:
	cmp r2, 0x7
	bgt _080F63A4
	negs r0, r3
	lsls r0, 16
	lsrs r0, 16
	b _080F63A6
_080F63A4:
	ldr r0, _080F63C0
_080F63A6:
	lsls r4, r0, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
_080F63B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F63C0: .4byte 0x0000fff8
	thumb_func_end sub_80F5FB4

	thumb_func_start sub_80F6010
sub_80F6010: @ 80F63C4
	push {r4-r6,lr}
	ldr r0, _080F63F0
	ldr r3, [r0]
	ldr r1, _080F63F4
	adds r0, r3, r1
	ldr r2, _080F63F8
	adds r1, r3, r2
	ldrh r5, [r0]
	movs r4, 0
	ldrsh r2, [r0, r4]
	ldrh r4, [r1]
	movs r6, 0
	ldrsh r0, [r1, r6]
	cmp r2, r0
	beq _080F63EC
	ldr r1, _080F63FC
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F6400
_080F63EC:
	movs r0, 0
	b _080F6420
	.align 2, 0
_080F63F0: .4byte gUnknown_083DFEC4
_080F63F4: .4byte 0x00008772
_080F63F8: .4byte 0x00008774
_080F63FC: .4byte 0x000087c9
_080F6400:
	subs r0, r4, r5
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080F640E
	movs r4, 0x8
_080F640E:
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80F063C
	adds r0, r4, 0
	bl sub_80F6074
	movs r0, 0x2
_080F6420:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6010

	thumb_func_start sub_80F6074
sub_80F6074: @ 80F6428
	push {r4-r7,lr}
	ldr r1, _080F64D4
	ldr r6, [r1]
	ldr r1, _080F64D8
	adds r3, r6, r1
	ldrh r1, [r3]
	lsls r0, 16
	asrs r7, r0, 16
	adds r2, r7, r1
	strh r2, [r3]
	ldr r5, _080F64DC
	adds r4, r6, r5
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4]
	mov r12, r1
	movs r5, 0
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080F6458
	subs r0, r2, 0x1
	mov r1, r12
	subs r0, r1
	strh r0, [r3]
_080F6458:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F646A
	adds r0, r1, 0x1
	ldrh r5, [r4]
	adds r0, r5
	strh r0, [r3]
_080F646A:
	ldr r0, _080F64E0
	adds r3, r6, r0
	ldrh r0, [r3]
	adds r2, r7, r0
	strh r2, [r3]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4]
	mov r12, r1
	movs r5, 0
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080F648C
	subs r0, r2, 0x1
	mov r1, r12
	subs r0, r1
	strh r0, [r3]
_080F648C:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F649E
	adds r0, r1, 0x1
	ldrh r5, [r4]
	adds r0, r5
	strh r0, [r3]
_080F649E:
	ldr r0, _080F64E4
	adds r3, r6, r0
	ldrh r0, [r3]
	adds r2, r7, r0
	strh r2, [r3]
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r4]
	movs r6, 0
	ldrsh r1, [r4, r6]
	cmp r0, r1
	ble _080F64BC
	subs r0, r2, 0x1
	subs r0, r5
	strh r0, [r3]
_080F64BC:
	ldrh r1, [r3]
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080F64CE
	adds r0, r1, 0x1
	ldrh r4, [r4]
	adds r0, r4
	strh r0, [r3]
_080F64CE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F64D4: .4byte gUnknown_083DFEC4
_080F64D8: .4byte 0x00008770
_080F64DC: .4byte 0x00008774
_080F64E0: .4byte 0x00008772
_080F64E4: .4byte 0x0000876e
	thumb_func_end sub_80F6074

	thumb_func_start sub_80F6134
sub_80F6134: @ 80F64E8
	push {r4-r6,lr}
	ldr r0, _080F6548
	ldr r3, [r0]
	ldr r1, _080F654C
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F6594
	ldr r2, _080F6550
	adds r5, r3, r2
	movs r4, 0
	ldrsh r1, [r5, r4]
	ldr r6, _080F6554
	adds r4, r3, r6
	movs r2, 0
	ldrsh r0, [r4, r2]
	subs r0, 0x7
	cmp r1, r0
	bge _080F6560
	subs r6, 0x8
	adds r1, r3, r6
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r5]
	ldr r1, _080F6558
	adds r2, r3, r1
	strh r0, [r2]
	ldrh r1, [r5]
	ldr r5, _080F655C
	adds r0, r3, r5
	strh r1, [r0]
	ldrh r5, [r2]
	adds r0, r5, 0x7
	adds r6, 0x6
	adds r2, r3, r6
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r4]
	movs r6, 0
	ldrsh r1, [r4, r6]
	cmp r0, r1
	ble _080F65A8
	adds r0, r5, 0x6
	subs r0, r3
	strh r0, [r2]
	b _080F65A8
	.align 2, 0
_080F6548: .4byte gUnknown_083DFEC4
_080F654C: .4byte 0x000087c9
_080F6550: .4byte 0x000087dc
_080F6554: .4byte 0x00008774
_080F6558: .4byte 0x00008770
_080F655C: .4byte 0x0000876e
_080F6560:
	ldrh r0, [r4]
	subs r0, 0x7
	ldr r2, _080F6588
	adds r1, r3, r2
	strh r0, [r1]
	ldrh r1, [r4]
	ldr r6, _080F658C
	adds r0, r3, r6
	strh r1, [r0]
	ldrh r1, [r5]
	subs r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	ldrh r0, [r4]
	subs r0, r1
	movs r1, 0x7
	subs r1, r0
	ldr r4, _080F6590
	adds r0, r3, r4
	b _080F65A6
	.align 2, 0
_080F6588: .4byte 0x00008770
_080F658C: .4byte 0x00008772
_080F6590: .4byte 0x0000876c
_080F6594:
	ldr r5, _080F65B0
	adds r2, r3, r5
	ldrh r1, [r2]
	ldr r6, _080F65B4
	adds r0, r3, r6
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r2, _080F65B8
	adds r0, r3, r2
_080F65A6:
	strh r1, [r0]
_080F65A8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F65B0: .4byte 0x000087dc
_080F65B4: .4byte 0x0000876c
_080F65B8: .4byte 0x0000876e
	thumb_func_end sub_80F6134

	thumb_func_start sub_80F6208
sub_80F6208: @ 80F65BC
	push {lr}
	ldr r0, _080F65F0
	ldr r1, [r0]
	ldr r2, _080F65F4
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _080F65F8
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _080F65FC
	adds r2, r1, r0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r2, _080F6600
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F65EC
_080F65E2:
	bl sub_80F6250
	lsls r0, 24
	cmp r0, 0
	bne _080F65E2
_080F65EC:
	pop {r0}
	bx r0
	.align 2, 0
_080F65F0: .4byte gUnknown_083DFEC4
_080F65F4: .4byte 0x00008fe6
_080F65F8: .4byte 0x00008fe7
_080F65FC: .4byte 0x00008fe8
_080F6600: .4byte 0x00006dac
	thumb_func_end sub_80F6208

	thumb_func_start sub_80F6250
sub_80F6250: @ 80F6604
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F6624
	ldr r2, [r0]
	ldr r0, _080F6628
	adds r3, r2, r0
	movs r1, 0
	ldrsb r1, [r3, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080F662C
_080F6620:
	movs r0, 0
	b _080F6732
	.align 2, 0
_080F6624: .4byte gUnknown_083DFEC4
_080F6628: .4byte 0x00008fe8
_080F662C:
	ldr r1, _080F66C0
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080F66D0
	cmp r0, 0x8
	beq _080F6620
	movs r6, 0
	adds r7, r2, 0
	adds r5, r7, r1
	ldr r0, _080F66C4
	adds r4, r7, r0
	ldr r1, _080F66C8
	mov r8, r1
	ldr r0, _080F66CC
	add r0, r8
	mov r9, r0
_080F664E:
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r8
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	cmp r0, 0
	bne _080F6720
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	add r1, r9
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _080F6720
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r2, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bls _080F66B2
	strb r1, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ands r0, r2
	cmp r0, 0x6
	bhi _080F6730
_080F66B2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x9
	bls _080F664E
	b _080F6730
	.align 2, 0
_080F66C0: .4byte 0x00008fe6
_080F66C4: .4byte 0x00008fe7
_080F66C8: .4byte gUnknown_020300A4
_080F66CC: .4byte 0x000041a0
_080F66D0:
	movs r0, 0
	strb r0, [r3]
	movs r6, 0
	b _080F66DE
_080F66D8:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080F66DE:
	cmp r6, 0x5
	bhi _080F6700
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F6710
	adds r0, r1
	movs r1, 0x51
	bl GetMonData
	cmp r0, 0
	beq _080F66D8
	ldr r0, _080F6714
	ldr r0, [r0]
	ldr r1, _080F6718
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080F6700:
	ldr r0, _080F6714
	ldr r1, [r0]
	ldr r0, _080F671C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _080F6726
	.align 2, 0
_080F6710: .4byte gPlayerParty
_080F6714: .4byte gUnknown_083DFEC4
_080F6718: .4byte 0x00008fe8
_080F671C: .4byte 0x00008fe6
_080F6720:
	ldr r0, _080F672C
	adds r1, r7, r0
	movs r0, 0x1
_080F6726:
	strb r0, [r1]
	b _080F6620
	.align 2, 0
_080F672C: .4byte 0x00008fe8
_080F6730:
	movs r0, 0x1
_080F6732:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6250

	thumb_func_start sub_80F638C
sub_80F638C: @ 80F6740
	push {r4,lr}
	ldr r0, _080F6774
	ldr r4, [r0]
	ldr r1, _080F6778
	adds r0, r4, r1
	movs r1, 0
	strb r1, [r0]
	ldr r2, _080F677C
	adds r0, r4, r2
	strb r1, [r0]
	bl sub_80F492C
	ldr r0, _080F6780
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F676C
_080F6762:
	bl sub_80F63D0
	lsls r0, 24
	cmp r0, 0
	bne _080F6762
_080F676C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F6774: .4byte gUnknown_083DFEC4
_080F6778: .4byte 0x00008fe6
_080F677C: .4byte 0x00008fe7
_080F6780: .4byte 0x00006dac
	thumb_func_end sub_80F638C

	thumb_func_start sub_80F63D0
sub_80F63D0: @ 80F6784
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _080F6830
	ldr r2, [r0]
	ldr r1, _080F6834
	adds r0, r2, r1
	ldrb r3, [r0]
	cmp r3, 0xE
	beq _080F684C
	cmp r3, 0xF
	bne _080F679C
	b _080F68AA
_080F679C:
	movs r1, 0x80
	lsls r1, 23
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	movs r6, 0
	ldr r0, _080F6834
	adds r5, r2, r0
	ldr r1, _080F6838
	adds r4, r2, r1
_080F67B0:
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldrb r2, [r4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _080F683C
	adds r1, r2
	adds r0, r1
	movs r1, 0x51
	bl GetBoxMonData
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080F6802
	ldrb r1, [r5]
	lsls r1, 8
	ldr r2, _080F6840
	ldr r0, [sp]
	ands r0, r2
	orrs r0, r1
	str r0, [sp]
	ldrb r2, [r4]
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 16
	ldr r1, _080F6844
	ands r0, r1
	orrs r0, r2
	ldr r1, _080F6848
	ands r0, r1
	orrs r0, r3
	str r0, [sp]
	mov r0, sp
	bl sub_80F4944
_080F6802:
	ldrb r0, [r4]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r4]
	movs r1, 0xFF
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bne _080F6822
	strb r2, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ands r0, r1
	cmp r0, 0xE
	beq _080F68BC
_080F6822:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0xE
	bls _080F67B0
	b _080F68BC
	.align 2, 0
_080F6830: .4byte gUnknown_083DFEC4
_080F6834: .4byte 0x00008fe6
_080F6838: .4byte 0x00008fe7
_080F683C: .4byte gUnknown_020300A4
_080F6840: .4byte 0xffff00ff
_080F6844: .4byte 0xffe0ffff
_080F6848: .4byte 0xffffff00
_080F684C:
	mov r0, sp
	ldrb r1, [r0, 0x3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0, 0x3]
	strb r3, [r0, 0x1]
	movs r6, 0
	mov r4, sp
_080F685C:
	movs r0, 0x64
	muls r0, r6
	ldr r1, _080F68B0
	adds r0, r1
	movs r1, 0x51
	bl GetMonData
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	beq _080F688E
	movs r0, 0x1F
	adds r2, r6, 0
	ands r2, r0
	ldrb r0, [r4, 0x2]
	movs r5, 0x20
	negs r5, r5
	adds r1, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x2]
	strb r3, [r4]
	mov r0, sp
	bl sub_80F4944
_080F688E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080F685C
	bl sub_80F49F4
	ldr r0, _080F68B4
	ldr r1, [r0]
	ldr r0, _080F68B8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F68AA:
	movs r0, 0
	b _080F68BE
	.align 2, 0
_080F68B0: .4byte gPlayerParty
_080F68B4: .4byte gUnknown_083DFEC4
_080F68B8: .4byte 0x00008fe6
_080F68BC:
	movs r0, 0x1
_080F68BE:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F63D0

	thumb_func_start sub_80F6514
sub_80F6514: @ 80F68C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	mov r5, r10
	ldr r0, _080F6958
	ldr r0, [r0]
	lsls r1, 2
	adds r0, r1
	ldr r2, _080F695C
	adds r1, r0, r2
	ldrb r6, [r1]
	mov r8, r6
	ldr r1, _080F6960
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r4, r0, 27
	adds r7, r4, 0
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x2D
	movs r3, 0
	bl sub_80F44B0
	cmp r0, 0
	beq _080F6912
	b _080F6A7E
_080F6912:
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x2
	adds r3, r5, 0
	bl sub_80F44B0
	adds r0, r5, 0
	bl StringGetEnd10
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xB
	movs r3, 0
	bl sub_80F44B0
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r6, 0xE
	bne _080F6968
	movs r0, 0x64
	muls r4, r0
	ldr r0, _080F6964
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r4, 0
	bl GetMonGender
	b _080F699E
	.align 2, 0
_080F6958: .4byte gUnknown_083DFEC4
_080F695C: .4byte 0x0000893d
_080F6960: .4byte 0x0000893e
_080F6964: .4byte gPlayerParty
_080F6968:
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 4
	ldr r2, _080F69D4
	adds r1, r2
	adds r0, r1
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	mov r0, r8
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0
	bl sub_80F44B0
	adds r1, r0, 0
	mov r0, r9
	bl GetGenderFromSpeciesAndPersonality
_080F699E:
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r9
	mov r1, r10
	bl sub_8040D8C
	cmp r0, 0
	beq _080F69B0
	movs r4, 0xFF
_080F69B0:
	adds r0, r5, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x3F
	strb r0, [r5, 0x2]
	adds r5, 0x3
	cmp r4, 0
	beq _080F69D8
	cmp r4, 0xFE
	beq _080F69F0
	b _080F6A0A
	.align 2, 0
_080F69D4: .4byte gUnknown_020300A4
_080F69D8:
	strb r1, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0xC
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0xD
	strb r0, [r5, 0x5]
	movs r0, 0xB5
	b _080F6A06
_080F69F0:
	strb r1, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0xA
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0xB
	strb r0, [r5, 0x5]
	movs r0, 0xB6
_080F6A06:
	strb r0, [r5, 0x6]
	adds r5, 0x7
_080F6A0A:
	movs r4, 0xFC
	strb r4, [r5]
	movs r1, 0x1
	strb r1, [r5, 0x1]
	strb r1, [r5, 0x2]
	strb r4, [r5, 0x3]
	movs r0, 0x3
	strb r0, [r5, 0x4]
	movs r0, 0x5
	strb r0, [r5, 0x5]
	adds r5, 0x6
	strb r4, [r5]
	movs r6, 0x13
	strb r6, [r5, 0x1]
	movs r0, 0x46
	strb r0, [r5, 0x2]
	adds r5, 0x3
	movs r0, 0xBA
	strb r0, [r5]
	strb r4, [r5, 0x1]
	movs r0, 0x11
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x34
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl ConvertIntToDecimalString
	adds r5, r0, 0
	ldr r0, [sp, 0x4]
	cmp r0, 0x1
	bne _080F6A74
	ldr r0, _080F6A6C
	ldr r0, [r0]
	ldr r2, [sp]
	lsls r1, r2, 2
	adds r0, r1
	ldr r1, _080F6A70
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r5, 0
	movs r2, 0x80
	movs r3, 0x1
	bl sub_8072C14
	adds r5, r0, 0
	b _080F6A82
	.align 2, 0
_080F6A6C: .4byte gUnknown_083DFEC4
_080F6A70: .4byte 0x0000893c
_080F6A74:
	strb r4, [r5]
	strb r6, [r5, 0x1]
	movs r0, 0x67
	strb r0, [r5, 0x2]
	adds r5, 0x3
_080F6A7E:
	movs r0, 0xFF
	strb r0, [r5]
_080F6A82:
	adds r0, r5, 0
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6514

	thumb_func_start sub_80F66E0
sub_80F66E0: @ 80F6A94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080F6B20
	mov r8, r0
	ldr r4, [r0]
	ldr r1, _080F6B24
	adds r0, r4, r1
	ldr r2, _080F6B28
	adds r5, r4, r2
	ldrh r1, [r5]
	movs r2, 0
	bl sub_80F6514
	movs r3, 0
	ldrsh r0, [r5, r3]
	movs r1, 0
	bl sub_80F4824
	ldrh r1, [r5]
	ldr r6, _080F6B2C
	adds r0, r4, r6
	movs r6, 0
	strh r1, [r0]
	ldr r1, _080F6B30
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, 0
	mov r9, r2
	movs r3, 0
	ldrsh r1, [r5, r3]
	lsls r1, 2
	adds r1, r4, r1
	ldr r5, _080F6B34
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080F6B38
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x52
	movs r3, 0
	bl sub_80F44B0
	adds r7, r0, 0
	ldr r3, _080F6B3C
	adds r4, r3
	strb r6, [r4]
	movs r5, 0
	mov r12, r5
	mov r10, r8
_080F6B02:
	ldr r1, _080F6B40
	mov r6, r12
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x36
	bgt _080F6B44
	cmp r0, 0x32
	blt _080F6B44
	movs r0, 0x7
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 3
	movs r0, 0x4
	b _080F6B4E
	.align 2, 0
_080F6B20: .4byte gUnknown_083DFEC4
_080F6B24: .4byte 0x00008829
_080F6B28: .4byte 0x0000876e
_080F6B2C: .4byte 0x000087dc
_080F6B30: .4byte 0x0000bc8e
_080F6B34: .4byte 0x0000893d
_080F6B38: .4byte 0x0000893e
_080F6B3C: .4byte 0x0000bc8f
_080F6B40: .4byte gUnknown_083E499C
_080F6B44:
	movs r0, 0x1
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 1
	movs r0, 0x1
_080F6B4E:
	movs r4, 0
	adds r1, r2, 0
	add r0, r9
	mov r8, r0
	cmp r4, r1
	bcs _080F6B88
	mov r3, r10
	ldr r0, [r3]
	ldr r5, _080F6BDC
	adds r3, r0, r5
	ldr r6, _080F6BE0
	adds r6, r0, r6
	str r6, [sp]
	adds r5, r1, 0
_080F6B6A:
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	adds r0, r1, r0
	mov r6, r9
	adds r1, r6, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080F6B6A
_080F6B88:
	cmp r2, 0
	beq _080F6BA0
	mov r0, r9
	cmp r0, 0x18
	bls _080F6BA0
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _080F6BE4
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F6BA0:
	mov r5, r8
	lsls r0, r5, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x10
	bls _080F6B02
	ldr r6, _080F6BE8
	ldr r2, [r6]
	ldr r1, _080F6BDC
	adds r0, r2, r1
	ldr r3, _080F6BE4
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6BF4
	ldr r5, _080F6BEC
	adds r0, r2, r5
	movs r1, 0
	strb r1, [r0]
	ldr r6, _080F6BF0
	adds r0, r2, r6
	strb r1, [r0]
	b _080F6C04
	.align 2, 0
_080F6BDC: .4byte 0x0000bc8e
_080F6BE0: .4byte 0x0000bc4c
_080F6BE4: .4byte 0x0000bc8f
_080F6BE8: .4byte gUnknown_083DFEC4
_080F6BEC: .4byte 0x0000bc90
_080F6BF0: .4byte 0x0000bc91
_080F6BF4:
	ldr r0, _080F6C3C
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r3, _080F6C40
	adds r1, r2, r3
	movs r0, 0x3
	strb r0, [r1]
_080F6C04:
	ldr r5, _080F6C44
	ldr r1, [r5]
	ldr r6, _080F6C48
	adds r0, r1, r6
	ldr r2, _080F6C4C
	adds r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	mov r12, r3
	adds r3, r5, 0
	ldr r1, _080F6C50
	movs r4, 0x9
_080F6C24:
	cmp r2, 0x8
	bls _080F6C54
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r2, r0, 24
	b _080F6C5E
	.align 2, 0
_080F6C3C: .4byte 0x0000bc90
_080F6C40: .4byte 0x0000bc91
_080F6C44: .4byte gUnknown_083DFEC4
_080F6C48: .4byte 0x0000bc8e
_080F6C4C: .4byte 0x0000bc8f
_080F6C50: .4byte 0x0000bc96
_080F6C54:
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	movs r2, 0
_080F6C5E:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x2
	bls _080F6C24
	ldr r5, _080F6C90
	ldr r0, [r5]
	ldr r6, _080F6C94
	adds r1, r0, r6
	add r1, r12
	ldr r2, _080F6C98
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F6C90: .4byte gUnknown_083DFEC4
_080F6C94: .4byte 0x0000bc96
_080F6C98: .4byte 0x0000bc8f
	thumb_func_end sub_80F66E0

	thumb_func_start sub_80F68E8
sub_80F68E8: @ 80F6C9C
	push {r4-r7,lr}
	ldr r3, _080F6CCC
	ldr r0, [r3]
	ldr r2, _080F6CD0
	adds r1, r0, r2
	ldrb r5, [r1]
	ldr r6, _080F6CD4
	adds r0, r6
	ldrb r4, [r0]
	movs r0, 0x1
	mov r12, r0
	ldr r2, _080F6CD8
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r6, r3, 0
	adds r7, r2, 0
	cmp r0, 0
	beq _080F6CE2
	lsls r0, r4, 24
	cmp r0, 0
	ble _080F6CE2
	b _080F6D70
	.align 2, 0
_080F6CCC: .4byte gUnknown_083DFEC4
_080F6CD0: .4byte 0x0000bc90
_080F6CD4: .4byte 0x0000bc91
_080F6CD8: .4byte gMain
_080F6CDC:
	ldr r1, _080F6D64
	adds r0, r2, r1
	ldrb r4, [r0]
_080F6CE2:
	ldrh r1, [r7, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F6D2C
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6D2C
	ldr r3, _080F6D68
	ldr r2, _080F6D6C
_080F6CF8:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6D14
	adds r0, 0x1
	lsls r0, 24
	ldr r1, [r3]
	lsrs r4, r0, 24
	asrs r0, 24
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6CF8
_080F6D14:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F6D6C
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F6DA0
	ldr r1, _080F6D64
	adds r0, r2, r1
	ldrb r4, [r0]
_080F6D2C:
	ldrh r2, [r7, 0x30]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080F6D3E
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0
	bgt _080F6DF0
_080F6D3E:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080F6D5E
	lsls r0, r5, 24
	asrs r2, r0, 24
	ldr r1, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F6D6C
	adds r1, r3
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r2, r0
	blt _080F6DEC
_080F6D5E:
	movs r0, 0
	mov r12, r0
	b _080F6DB0
	.align 2, 0
_080F6D64: .4byte 0x0000bc91
_080F6D68: .4byte gUnknown_083DFEC4
_080F6D6C: .4byte 0x0000bc96
_080F6D70:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0
	ble _080F6D8E
	subs r0, 0x1
	lsls r0, 24
	ldr r1, [r6]
	lsrs r4, r0, 24
	asrs r0, 24
	ldr r2, _080F6DE0
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6D70
_080F6D8E:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F6DE0
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6CDC
_080F6DA0:
	lsls r0, r5, 24
	asrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	blt _080F6DB0
	subs r0, r1, 0x1
_080F6DAC:
	lsls r0, 24
	lsrs r5, r0, 24
_080F6DB0:
	mov r0, r12
	cmp r0, 0
	beq _080F6DF8
	lsls r0, r5, 24
	asrs r0, 24
	ldr r3, [r6]
	ldr r1, _080F6DE4
	adds r2, r3, r1
	ldrb r6, [r2]
	cmp r0, r6
	bne _080F6DD4
	lsls r0, r4, 24
	asrs r0, 24
	ldr r6, _080F6DE8
	adds r1, r3, r6
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6DF4
_080F6DD4:
	strb r5, [r2]
	ldr r1, _080F6DE8
	adds r0, r3, r1
	strb r4, [r0]
	b _080F6DF8
	.align 2, 0
_080F6DE0: .4byte 0x0000bc96
_080F6DE4: .4byte 0x0000bc90
_080F6DE8: .4byte 0x0000bc91
_080F6DEC:
	adds r0, r2, 0x1
	b _080F6DAC
_080F6DF0:
	subs r0, 0x1
	b _080F6DAC
_080F6DF4:
	movs r2, 0
	mov r12, r2
_080F6DF8:
	mov r0, r12
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F68E8

	thumb_func_start sub_80F6A4C
sub_80F6A4C: @ 80F6E00
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F6E78
	ldr r3, [r0]
	ldr r0, _080F6E7C
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F6E28
	ldr r5, _080F6E80
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F6E28:
	ldr r1, _080F6E80
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F6E3C
	movs r0, 0
	strh r0, [r2]
_080F6E3C:
	ldr r1, _080F6E84
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F6E88
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080F6E8C
	ldr r5, _080F6E90
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6E94
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r5, _080F6E98
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6E9C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r5, _080F6EA0
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6E78: .4byte gUnknown_083DFEC4
_080F6E7C: .4byte 0x0000876e
_080F6E80: .4byte 0x00008774
_080F6E84: .4byte 0x0000bc94
_080F6E88: .4byte 0x000087dc
_080F6E8C: .4byte 0x04000048
_080F6E90: .4byte 0x00003f37
_080F6E94: .4byte 0x00003f3f
_080F6E98: .4byte 0x000058f0
_080F6E9C: .4byte 0x00002060
_080F6EA0: .4byte 0x000087de
	thumb_func_end sub_80F6A4C

	thumb_func_start sub_80F6AF0
sub_80F6AF0: @ 80F6EA4
	push {r4,lr}
	ldr r1, _080F6EC4
	ldr r0, [r1]
	ldr r2, _080F6EC8
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F6EB8
	b _080F6FBC
_080F6EB8:
	lsls r0, 2
	ldr r1, _080F6ECC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F6EC4: .4byte gUnknown_083DFEC4
_080F6EC8: .4byte 0x000087de
_080F6ECC: .4byte _080F6ED0
	.align 2, 0
_080F6ED0:
	.4byte _080F6EEC
	.4byte _080F6F08
	.4byte _080F6F22
	.4byte _080F6F38
	.4byte _080F6F50
	.4byte _080F6F74
	.4byte _080F6F94
_080F6EEC:
	bl sub_80F173C
	lsls r0, 24
	cmp r0, 0
	bne _080F6FCC
	ldr r0, _080F6F00
	ldr r1, [r0]
	ldr r3, _080F6F04
	adds r1, r3
	b _080F6F82
	.align 2, 0
_080F6F00: .4byte gUnknown_083DFEC4
_080F6F04: .4byte 0x000087de
_080F6F08:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bl sub_80F1480
	bl sub_80F66E0
	b _080F6F7A
_080F6F22:
	bl sub_80F1238
	ldr r0, _080F6F30
	ldr r1, [r0]
	ldr r2, _080F6F34
	adds r1, r2
	b _080F6F82
	.align 2, 0
_080F6F30: .4byte gUnknown_083DFEC4
_080F6F34: .4byte 0x000087de
_080F6F38:
	bl sub_80F13FC
	ldr r0, _080F6F48
	ldr r1, [r0]
	ldr r3, _080F6F4C
	adds r1, r3
	b _080F6F82
	.align 2, 0
_080F6F48: .4byte gUnknown_083DFEC4
_080F6F4C: .4byte 0x000087de
_080F6F50:
	ldr r4, [r4]
	ldr r1, _080F6F6C
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0
	bl sub_80F4824
	ldr r3, _080F6F70
	adds r4, r3
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F6FCC
	.align 2, 0
_080F6F6C: .4byte 0x0000876e
_080F6F70: .4byte 0x000087de
_080F6F74:
	movs r0, 0
	bl sub_80F2E18
_080F6F7A:
	ldr r0, _080F6F8C
	ldr r1, [r0]
	ldr r0, _080F6F90
	adds r1, r0
_080F6F82:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F6FCC
	.align 2, 0
_080F6F8C: .4byte gUnknown_083DFEC4
_080F6F90: .4byte 0x000087de
_080F6F94:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _080F6FCC
	bl sub_80F1438
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F6FC0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080F6FC4
	ldr r1, [r0]
	ldr r2, _080F6FC8
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F6FBC:
	movs r0, 0
	b _080F6FCE
	.align 2, 0
_080F6FC0: .4byte 0x0000dfff
_080F6FC4: .4byte gUnknown_083DFEC4
_080F6FC8: .4byte 0x000087de
_080F6FCC:
	movs r0, 0x1
_080F6FCE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6AF0

	thumb_func_start sub_80F6C20
sub_80F6C20: @ 80F6FD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080F70F8
	ldr r0, [r0]
	ldr r1, _080F70FC
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	mov r8, r1
	ldr r2, _080F7100
	mov r9, r2
_080F6FEE:
	ldr r1, _080F7104
	mov r4, r8
	lsls r0, r4, 4
	adds r6, r0, r1
	ldrh r7, [r6]
	adds r0, r7, 0
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _080F7054
	ldr r0, _080F70F8
	ldr r4, [r0]
	ldr r0, _080F70FC
	adds r5, r4, r0
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	ldr r1, _080F7108
	adds r0, r1
	strh r7, [r0]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	ldr r2, _080F710C
	adds r0, r2
	mov r1, r8
	strb r1, [r0]
	ldrh r0, [r5]
	lsls r0, 3
	adds r0, r4, r0
	mov r1, r8
	add r1, r9
	ldrb r1, [r1]
	adds r2, 0x1
	adds r0, r2
	strb r1, [r0]
	ldrh r0, [r6, 0xA]
	ldrh r1, [r6, 0xC]
	bl get_mapheader_by_bank_and_number
	ldrh r1, [r5]
	lsls r1, 3
	adds r4, r1
	ldrb r0, [r0, 0x14]
	ldr r1, _080F7110
	adds r4, r1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F7054:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x37
	bls _080F6FEE
	movs r2, 0
	mov r8, r2
	movs r6, 0
_080F7068:
	ldr r1, _080F7114
	mov r4, r8
	lsls r0, r4, 2
	adds r5, r0, r1
	ldrh r4, [r5]
	adds r0, r4, 0
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _080F70C2
	ldr r0, _080F70F8
	ldr r2, [r0]
	ldr r0, _080F70FC
	adds r3, r2, r0
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldr r1, _080F7108
	adds r0, r1
	strh r4, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldrh r1, [r5, 0x2]
	ldr r4, _080F7110
	adds r0, r4
	strh r1, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r0, r2, r0
	ldr r1, _080F7118
	adds r0, r1
	strb r6, [r0]
	ldrh r0, [r3]
	lsls r0, 3
	adds r2, r0
	mov r0, r8
	adds r0, 0x38
	adds r4, 0x2
	adds r2, r4
	strb r0, [r2]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080F70C2:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0xC
	bls _080F7068
	ldr r3, _080F70F8
	ldr r2, [r3]
	ldr r1, _080F711C
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080F7120
	adds r0, r2, r4
	strh r1, [r0]
	subs r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r1, _080F70FC
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0x8
	bhi _080F7124
	subs r4, r0, 0x1
	b _080F7126
	.align 2, 0
_080F70F8: .4byte gUnknown_083DFEC4
_080F70FC: .4byte 0x0000d158
_080F7100: .4byte 0x020260ae
_080F7104: .4byte gTrainerEyeTrainers
_080F7108: .4byte 0x0000cee8
_080F710C: .4byte 0x0000ceec
_080F7110: .4byte 0x0000ceea
_080F7114: .4byte gUnknown_083E49C0
_080F7118: .4byte 0x0000ceed
_080F711C: .4byte 0x0000876c
_080F7120: .4byte 0x00008770
_080F7124:
	movs r4, 0x7
_080F7126:
	ldr r1, _080F715C
	adds r0, r2, r1
	strh r4, [r0]
	ldr r3, [r3]
	ldr r2, _080F7160
	adds r0, r3, r2
	ldrh r0, [r0]
	subs r0, 0x1
	ldr r4, _080F7164
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080F7148
	movs r1, 0x1
_080F7148:
	ldr r2, _080F7168
	adds r0, r3, r2
	strb r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F715C: .4byte 0x00008772
_080F7160: .4byte 0x0000d158
_080F7164: .4byte 0x00008774
_080F7168: .4byte 0x000087c9
	thumb_func_end sub_80F6C20

	thumb_func_start sub_80F6DB8
sub_80F6DB8: @ 80F716C
	push {r4,lr}
	movs r1, 0
	ldr r0, _080F71A0
	ldr r4, [r0]
	ldr r2, _080F71A4
	adds r0, r4, r2
	strb r1, [r0]
	movs r0, 0
	bl sub_80F6E04
	ldr r0, _080F71A8
	adds r1, r4, r0
	ldr r0, _080F71AC
	strh r0, [r1]
	movs r0, 0
	bl sub_80F2F7C
	ldr r1, _080F71B0
	adds r0, r4, r1
	ldrh r0, [r0]
	ldr r2, _080F71B4
	adds r4, r2
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F71A0: .4byte gUnknown_083DFEC4
_080F71A4: .4byte 0x00008fe9
_080F71A8: .4byte 0x0000d15a
_080F71AC: .4byte 0x0000ffb8
_080F71B0: .4byte 0x0000876e
_080F71B4: .4byte 0x000087dc
	thumb_func_end sub_80F6DB8

	thumb_func_start sub_80F6E04
sub_80F6E04: @ 80F71B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F722C
	ldr r5, [r0]
	ldr r1, _080F7230
	adds r0, r5, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	lsls r0, 3
	adds r0, r5, r0
	ldr r7, _080F7234
	adds r0, r7
	ldrh r1, [r0]
	ldr r2, _080F7238
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r6, [r0, 0x3]
	lsls r0, r6, 3
	mov r8, r0
	ldr r0, _080F723C
	add r0, r8
	ldr r2, _080F7240
	lsls r1, r6, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, _080F7244
	adds r3, r5, r2
	lsls r2, r4, 13
	ldr r7, _080F7248
	adds r2, r7
	adds r2, r5, r2
	str r2, [sp]
	str r6, [sp, 0x4]
	movs r2, 0x1
	bl DecompressPicFromTable_2
	ldr r0, _080F724C
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r4, 7
	adds r5, r4
	adds r1, r5, 0
	bl LZ77UnCompWram
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F722C: .4byte gUnknown_083DFEC4
_080F7230: .4byte 0x0000876e
_080F7234: .4byte 0x0000cee8
_080F7238: .4byte gTrainers
_080F723C: .4byte gTrainerFrontPicTable
_080F7240: .4byte gTrainerFrontPicCoords
_080F7244: .4byte 0x000131e4
_080F7248: .4byte 0x0000d1e4
_080F724C: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end sub_80F6E04

	thumb_func_start sub_80F6E9C
sub_80F6E9C: @ 80F7250
	push {lr}
	ldr r0, _080F7268
	ldr r0, [r0]
	ldr r2, _080F726C
	adds r1, r0, r2
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080F7270
	movs r0, 0
	b _080F7284
	.align 2, 0
_080F7268: .4byte gUnknown_083DFEC4
_080F726C: .4byte 0x0000d15a
_080F7270:
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080F7280
	movs r0, 0x1
	b _080F7284
_080F7280:
	movs r0, 0
	strh r0, [r1]
_080F7284:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6E9C

	thumb_func_start sub_80F6ED4
sub_80F6ED4: @ 80F7288
	push {lr}
	ldr r0, _080F72B4
	ldr r0, [r0]
	ldr r2, _080F72B8
	adds r1, r0, r2
	ldrh r3, [r1]
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x48
	negs r2, r2
	cmp r0, r2
	beq _080F72BE
	adds r0, r3, 0
	subs r0, 0x8
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r2
	ble _080F72BC
	movs r0, 0x1
	b _080F72C0
	.align 2, 0
_080F72B4: .4byte gUnknown_083DFEC4
_080F72B8: .4byte 0x0000d15a
_080F72BC:
	strh r2, [r1]
_080F72BE:
	movs r0, 0
_080F72C0:
	pop {r1}
	bx r1
	thumb_func_end sub_80F6ED4

	thumb_func_start sub_80F6F10
sub_80F6F10: @ 80F72C4
	push {lr}
	ldr r0, _080F72FC
	ldr r0, [r0]
	ldr r2, _080F7300
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _080F7304
	adds r0, r1
	strb r2, [r0]
	ldr r1, _080F7308
	movs r0, 0xC8
	strh r0, [r1]
	ldr r0, _080F730C
	strh r2, [r0]
	subs r1, 0x8
	ldr r2, _080F7310
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F7314
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bl sub_80F6FB8
	pop {r0}
	bx r0
	.align 2, 0
_080F72FC: .4byte gUnknown_083DFEC4
_080F7300: .4byte 0x0000d15e
_080F7304: .4byte 0x0000d15f
_080F7308: .4byte 0x04000050
_080F730C: .4byte 0x04000054
_080F7310: .4byte 0x00003f3f
_080F7314: .4byte 0x00001f1f
	thumb_func_end sub_80F6F10

	thumb_func_start sub_80F6F64
sub_80F6F64: @ 80F7318
	push {lr}
	ldr r0, _080F7350
	ldr r1, [r0]
	ldr r0, _080F7354
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bls _080F7364
	movs r0, 0
	strb r0, [r2]
	ldr r0, _080F7358
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080F7360
	ldr r1, _080F735C
	movs r0, 0x6
	strh r0, [r1]
	b _080F7364
	.align 2, 0
_080F7350: .4byte gUnknown_083DFEC4
_080F7354: .4byte 0x0000d15e
_080F7358: .4byte 0x0000d15f
_080F735C: .4byte 0x04000054
_080F7360:
	ldr r0, _080F7368
	strh r1, [r0]
_080F7364:
	pop {r0}
	bx r0
	.align 2, 0
_080F7368: .4byte 0x04000054
	thumb_func_end sub_80F6F64

	thumb_func_start sub_80F6FB8
sub_80F6FB8: @ 80F736C
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080F7390
	ldr r1, _080F7384
	ldr r2, _080F7388
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F738C
	b _080F739C
	.align 2, 0
_080F7384: .4byte 0x04000040
_080F7388: .4byte 0x0000e8f0
_080F738C: .4byte 0x00000888
_080F7390:
	ldr r1, _080F73A4
	ldr r2, _080F73A8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F73AC
_080F739C:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F73A4: .4byte 0x04000040
_080F73A8: .4byte 0x0000e8f0
_080F73AC: .4byte 0x00000818
	thumb_func_end sub_80F6FB8

	thumb_func_start sub_80F6FFC
sub_80F6FFC: @ 80F73B0
	ldr r0, _080F73BC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F73BC: .4byte 0x04000050
	thumb_func_end sub_80F6FFC

	thumb_func_start sub_80F700C
sub_80F700C: @ 80F73C0
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080F742C
	ldr r4, [r2]
	lsls r2, r1, 3
	adds r2, r4, r2
	ldr r3, _080F7430
	adds r2, r3
	ldrh r6, [r2]
	lsls r2, r6, 2
	adds r2, r6
	lsls r2, 3
	ldr r3, _080F7434
	adds r7, r2, r3
	adds r5, r0, 0
	ldr r0, _080F7438
	adds r4, r0
	ldrh r4, [r4]
	cmp r1, r4
	bcs _080F7414
	movs r0, 0
	adds r1, r6, 0
	bl de_sub_8041024
	adds r1, r0, 0
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x4B
	strb r0, [r5, 0x2]
	adds r5, 0x3
	adds r1, r7, 0x4
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
_080F7414:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x80
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F742C: .4byte gUnknown_083DFEC4
_080F7430: .4byte 0x0000cee8
_080F7434: .4byte gTrainers
_080F7438: .4byte 0x0000d158
	thumb_func_end sub_80F700C

	thumb_func_start sub_80F708C
sub_80F708C: @ 80F743C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F7494
	ldr r3, [r0]
	ldr r0, _080F7498
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F7464
	ldr r5, _080F749C
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F7464:
	ldr r1, _080F749C
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F7478
	movs r0, 0
	strh r0, [r2]
_080F7478:
	ldr r1, _080F74A0
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F74A4
	adds r0, r3, r2
	strh r1, [r0]
	ldr r5, _080F74A8
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F7494: .4byte gUnknown_083DFEC4
_080F7498: .4byte 0x0000876e
_080F749C: .4byte 0x00008774
_080F74A0: .4byte 0x0000bc94
_080F74A4: .4byte 0x000087dc
_080F74A8: .4byte 0x000087de
	thumb_func_end sub_80F708C

	thumb_func_start sub_80F70FC
sub_80F70FC: @ 80F74AC
	push {r4-r6,lr}
	ldr r1, _080F74CC
	ldr r0, [r1]
	ldr r2, _080F74D0
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F74C0
	b _080F75C8
_080F74C0:
	lsls r0, 2
	ldr r1, _080F74D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F74CC: .4byte gUnknown_083DFEC4
_080F74D0: .4byte 0x000087de
_080F74D4: .4byte _080F74D8
	.align 2, 0
_080F74D8:
	.4byte _080F74F4
	.4byte _080F74FA
	.4byte _080F7514
	.4byte _080F751C
	.4byte _080F7550
	.4byte _080F756A
	.4byte _080F759A
_080F74F4:
	bl sub_80F6ED4
	b _080F75A8
_080F74FA:
	movs r0, 0
	bl sub_80F6E04
	ldr r0, _080F750C
	ldr r1, [r0]
	ldr r2, _080F7510
	adds r1, r2
	b _080F75B6
	.align 2, 0
_080F750C: .4byte gUnknown_083DFEC4
_080F7510: .4byte 0x000087de
_080F7514:
	movs r0, 0
	bl sub_80F2F7C
	b _080F75AE
_080F751C:
	ldr r4, [r4]
	ldr r2, _080F7544
	adds r5, r4, r2
	ldr r0, _080F7548
	adds r6, r4, r0
	ldrh r1, [r6]
	adds r0, r5, 0
	bl sub_80F700C
	adds r0, r5, 0
	bl sub_80F43D4
	bl sub_80F105C
	ldrb r0, [r6]
	bl sub_80F0FFC
	ldr r2, _080F754C
	adds r4, r2
	b _080F757C
	.align 2, 0
_080F7544: .4byte 0x00008788
_080F7548: .4byte 0x0000876e
_080F754C: .4byte 0x000087de
_080F7550:
	bl sub_80F0CD8
	ldr r0, _080F7584
	ldr r1, [r0]
	ldr r0, _080F7588
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r2, _080F758C
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F756A:
	ldr r0, _080F7584
	ldr r1, [r0]
	ldr r0, _080F7588
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	bhi _080F7590
	bl sub_80F0D5C
_080F757C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F75CC
	.align 2, 0
_080F7584: .4byte gUnknown_083DFEC4
_080F7588: .4byte 0x0000bc95
_080F758C: .4byte 0x000087de
_080F7590:
	ldr r2, _080F75C0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F759A:
	bl sub_80F6E9C
	lsls r0, 24
	cmp r0, 0
	bne _080F75CC
	bl sub_80F0D5C
_080F75A8:
	lsls r0, 24
	cmp r0, 0
	bne _080F75CC
_080F75AE:
	ldr r0, _080F75C4
	ldr r1, [r0]
	ldr r0, _080F75C0
	adds r1, r0
_080F75B6:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F75CC
	.align 2, 0
_080F75C0: .4byte 0x000087de
_080F75C4: .4byte gUnknown_083DFEC4
_080F75C8:
	movs r0, 0
	b _080F75CE
_080F75CC:
	movs r0, 0x1
_080F75CE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80F70FC

	thumb_func_start sub_80F7224
sub_80F7224: @ 80F75D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080F7610
	adds r0, r1
	movs r1, 0x30
	bl GetMonData
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080F7614
	ldr r0, [r0]
	ldr r3, _080F7618
	adds r1, r0, r3
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	ldr r3, _080F761C
	adds r0, r3
	adds r4, r0, r1
	cmp r2, 0xFF
	beq _080F7620
	adds r0, r2, 0
	movs r1, 0x1D
	bl __udivsi3
	b _080F7622
	.align 2, 0
_080F7610: .4byte gPlayerParty
_080F7614: .4byte gUnknown_083DFEC4
_080F7618: .4byte 0x00008fe9
_080F761C: .4byte 0x00008931
_080F7620:
	movs r0, 0x9
_080F7622:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7224

	.align 2, 0 @ Don't pad with nop.
