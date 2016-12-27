	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_14
nullsub_14: @ 807B114
	bx lr
	thumb_func_end nullsub_14

	thumb_func_start sub_807AD58
sub_807AD58: @ 807B118
	push {lr}
	ldr r2, _0807B150 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0807B154 @ =0x0400004c
	movs r2, 0
	strh r2, [r0]
	ldr r0, _0807B158 @ =0x02000000
	ldr r3, _0807B15C @ =0x0001ffff
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807B160 @ =0x0001fffe
	adds r0, r1
	strb r2, [r0]
	ldr r0, _0807B164 @ =sub_807ADA8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0807B150: .4byte gPaletteFade
_0807B154: .4byte 0x0400004c
_0807B158: .4byte 0x02000000
_0807B15C: .4byte 0x0001ffff
_0807B160: .4byte 0x0001fffe
_0807B164: .4byte sub_807ADA8
	thumb_func_end sub_807AD58

	thumb_func_start sub_807ADA8
sub_807ADA8: @ 807B168
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _0807B184 @ =0x02000000
	ldr r1, _0807B188 @ =0x0001ffff
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x13
	bls _0807B17A
	b _0807B3D0
_0807B17A:
	lsls r0, 2
	ldr r1, _0807B18C @ =_0807B190
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B184: .4byte 0x02000000
_0807B188: .4byte 0x0001ffff
_0807B18C: .4byte _0807B190
	.align 2, 0
_0807B190:
	.4byte _0807B1E0
	.4byte _0807B244
	.4byte _0807B25C
	.4byte _0807B288
	.4byte _0807B28E
	.4byte _0807B2A0
	.4byte _0807B2A6
	.4byte _0807B2D8
	.4byte _0807B2DC
	.4byte _0807B2E0
	.4byte _0807B2E4
	.4byte _0807B308
	.4byte _0807B310
	.4byte _0807B318
	.4byte _0807B320
	.4byte _0807B328
	.4byte _0807B330
	.4byte _0807B338
	.4byte _0807B340
	.4byte _0807B348
_0807B1E0:
	bl dp12_8087EA4
	ldr r4, _0807B21C @ =gWindowConfig_81E6C58
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _0807B220 @ =gUnknown_03004210
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r0, _0807B224 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0807B228 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r0, _0807B22C @ =gUnknown_030042C0
	strh r1, [r0]
	ldr r0, _0807B230 @ =gUnknown_030041B4
	strh r1, [r0]
	ldr r0, _0807B234 @ =gUnknown_03004288
	strh r1, [r0]
	ldr r0, _0807B238 @ =gUnknown_03004280
	strh r1, [r0]
	ldr r0, _0807B23C @ =gUnknown_030041B0
	strh r1, [r0]
	ldr r0, _0807B240 @ =gUnknown_030041B8
	strh r1, [r0]
	b _0807B400
	.align 2, 0
_0807B21C: .4byte gWindowConfig_81E6C58
_0807B220: .4byte gUnknown_03004210
_0807B224: .4byte gUnknown_030042A4
_0807B228: .4byte gUnknown_030042A0
_0807B22C: .4byte gUnknown_030042C0
_0807B230: .4byte gUnknown_030041B4
_0807B234: .4byte gUnknown_03004288
_0807B238: .4byte gUnknown_03004280
_0807B23C: .4byte gUnknown_030041B0
_0807B240: .4byte gUnknown_030041B8
_0807B244:
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0807B258 @ =0x01006000
	add r0, sp, 0x4
	bl CpuFastSet
	b _0807B400
	.align 2, 0
_0807B258: .4byte 0x01006000
_0807B25C:
	ldr r5, _0807B27C @ =0x02000000
	ldr r0, _0807B280 @ =0x0001fffe
	adds r4, r5, r0
	ldrb r0, [r4]
	bl sub_800E414
	lsls r0, 24
	cmp r0, 0
	bne _0807B2B8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _0807B284 @ =0x0001ffff
	adds r1, r5, r0
	b _0807B2F8
	.align 2, 0
_0807B27C: .4byte 0x02000000
_0807B280: .4byte 0x0001fffe
_0807B284: .4byte 0x0001ffff
_0807B288:
	bl ResetSpriteData
	b _0807B400
_0807B28E:
	bl FreeAllSpritePalettes
	ldr r1, _0807B29C @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	b _0807B400
	.align 2, 0
_0807B29C: .4byte gReservedSpritePaletteCount
_0807B2A0:
	bl sub_8031EE8
	b _0807B400
_0807B2A6:
	ldr r5, _0807B2C0 @ =0x02000000
	ldr r1, _0807B2C4 @ =0x0001fffe
	adds r4, r5, r1
	ldrb r0, [r4]
	bl sub_8031C30
	lsls r0, 24
	cmp r0, 0
	beq _0807B2C8
_0807B2B8:
	movs r0, 0
	strb r0, [r4]
	b _0807B400
	.align 2, 0
_0807B2C0: .4byte 0x02000000
_0807B2C4: .4byte 0x0001fffe
_0807B2C8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _0807B2D4 @ =0x0001ffff
	adds r1, r5, r0
	b _0807B2F8
	.align 2, 0
_0807B2D4: .4byte 0x0001ffff
_0807B2D8:
	movs r0, 0
	b _0807B2E6
_0807B2DC:
	movs r0, 0x1
	b _0807B2E6
_0807B2E0:
	movs r0, 0x2
	b _0807B2E6
_0807B2E4:
	movs r0, 0x3
_0807B2E6:
	bl sub_807B094
	lsls r0, 24
	cmp r0, 0
	beq _0807B2F2
	b _0807B400
_0807B2F2:
	ldr r1, _0807B300 @ =0x02000000
	ldr r0, _0807B304 @ =0x0001ffff
	adds r1, r0
_0807B2F8:
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	b _0807B400
	.align 2, 0
_0807B300: .4byte 0x02000000
_0807B304: .4byte 0x0001ffff
_0807B308:
	movs r0, 0
	bl sub_807B184
	b _0807B400
_0807B310:
	movs r0, 0x1
	bl sub_807B184
	b _0807B400
_0807B318:
	movs r0, 0x2
	bl sub_807B184
	b _0807B400
_0807B320:
	movs r0, 0x3
	bl sub_807B184
	b _0807B400
_0807B328:
	movs r0, 0
	bl sub_807B508
	b _0807B400
_0807B330:
	movs r0, 0x1
	bl sub_807B508
	b _0807B400
_0807B338:
	movs r0, 0x2
	bl sub_807B508
	b _0807B400
_0807B340:
	movs r0, 0x3
	bl sub_807B508
	b _0807B400
_0807B348:
	bl sub_80327CC
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _0807B3C0 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807B3C4 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0807B3AC
	movs r0, 0x3
	bl battle_get_side_with_given_state
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
_0807B3AC:
	ldr r1, _0807B3C8 @ =gUnknown_02024E60
	ldr r0, _0807B3CC @ =gUnknown_02024E6C
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	b _0807B400
	.align 2, 0
_0807B3C0: .4byte gUnknown_02024A6A
_0807B3C4: .4byte gEnemyParty
_0807B3C8: .4byte gUnknown_02024E60
_0807B3CC: .4byte gUnknown_02024E6C
_0807B3D0:
	ldr r0, _0807B414 @ =sub_800FCD4
	bl SetHBlankCallback
	ldr r0, _0807B418 @ =sub_800FCFC
	bl SetVBlankCallback
	bl sub_807B06C
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r2, _0807B41C @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0807B420 @ =sub_800F808
	bl SetMainCallback2
_0807B400:
	ldr r1, _0807B424 @ =0x02000000
	ldr r0, _0807B428 @ =0x0001ffff
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B414: .4byte sub_800FCD4
_0807B418: .4byte sub_800FCFC
_0807B41C: .4byte gPaletteFade
_0807B420: .4byte sub_800F808
_0807B424: .4byte 0x02000000
_0807B428: .4byte 0x0001ffff
	thumb_func_end sub_807ADA8

	thumb_func_start sub_807B06C
sub_807B06C: @ 807B42C
	push {lr}
	bl sub_800D6D4
	ldr r3, _0807B44C @ =0x0400000a
	ldrb r2, [r3]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _0807B450 @ =0x0400000c
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0807B44C: .4byte 0x0400000a
_0807B450: .4byte 0x0400000c
	thumb_func_end sub_807B06C

	thumb_func_start sub_807B094
sub_807B094: @ 807B454
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807B498 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807B532
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807B4B2
	lsls r0, r4, 2
	ldr r1, _0807B49C @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0807B4A8
	ldr r1, _0807B4A0 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B4A4 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8031794
	b _0807B528
	.align 2, 0
_0807B498: .4byte gUnknown_02024A68
_0807B49C: .4byte 0x02017800
_0807B4A0: .4byte gUnknown_02024A6A
_0807B4A4: .4byte gEnemyParty
_0807B4A8:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8032350
	b _0807B528
_0807B4B2:
	ldr r2, _0807B4C8 @ =gUnknown_020239F8
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B4D0
	cmp r4, 0
	bne _0807B4D0
	ldr r0, _0807B4CC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	b _0807B4E2
	.align 2, 0
_0807B4C8: .4byte gUnknown_020239F8
_0807B4CC: .4byte gSaveBlock2
_0807B4D0:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B4EA
	cmp r4, 0
	bne _0807B4EA
	movs r0, 0x2
_0807B4E2:
	movs r1, 0
	bl sub_8031AF4
	b _0807B528
_0807B4EA:
	lsls r0, r4, 2
	ldr r1, _0807B514 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0807B520
	ldr r1, _0807B518 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B51C @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_80318FC
	b _0807B528
	.align 2, 0
_0807B514: .4byte 0x02017800
_0807B518: .4byte gUnknown_02024A6A
_0807B51C: .4byte gPlayerParty
_0807B520:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8032350
_0807B528:
	ldr r0, _0807B53C @ =0x02000000
	ldr r1, _0807B540 @ =0x0001fffe
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807B532:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B53C: .4byte 0x02000000
_0807B540: .4byte 0x0001fffe
	thumb_func_end sub_807B094

	thumb_func_start sub_807B184
sub_807B184: @ 807B544
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0807B578 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0807B55E
	b _0807B898
_0807B55E:
	lsls r2, r7, 2
	ldr r0, _0807B57C @ =0x02017800
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	str r2, [sp]
	cmp r0, 0
	beq _0807B580
	adds r0, r7, 0
	bl sub_8077F7C
	b _0807B586
	.align 2, 0
_0807B578: .4byte gUnknown_02024A68
_0807B57C: .4byte 0x02017800
_0807B580:
	adds r0, r7, 0
	bl sub_8077F68
_0807B586:
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807B59A
	b _0807B698
_0807B59A:
	ldr r1, _0807B67C @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B680 @ =gEnemyParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B5BE
	b _0807B898
_0807B5BE:
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _0807B684 @ =gUnknown_02024E8C
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _0807B688 @ =gUnknown_02024BE0
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B68C @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B690 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0807B694 @ =gUnknown_02024E84
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
	b _0807B86C
	.align 2, 0
_0807B67C: .4byte gUnknown_02024A6A
_0807B680: .4byte gEnemyParty
_0807B684: .4byte gUnknown_02024E8C
_0807B688: .4byte gUnknown_02024BE0
_0807B68C: .4byte gSprites
_0807B690: .4byte SpriteCallbackDummy
_0807B694: .4byte gUnknown_02024E84
_0807B698:
	ldr r2, _0807B6E8 @ =gUnknown_020239F8
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B6F8
	cmp r7, 0
	bne _0807B6F8
	ldr r5, _0807B6EC @ =gSaveBlock2
	ldrb r4, [r5, 0x8]
	movs r0, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r6, _0807B6F0 @ =gUnknown_02024E8C
	ldr r1, _0807B6F4 @ =gTrainerBackPicCoords
	ldrb r0, [r5, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	movs r0, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	b _0807B73C
	.align 2, 0
_0807B6E8: .4byte gUnknown_020239F8
_0807B6EC: .4byte gSaveBlock2
_0807B6F0: .4byte gUnknown_02024E8C
_0807B6F4: .4byte gTrainerBackPicCoords
_0807B6F8:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B790
	cmp r7, 0
	bne _0807B790
	movs r0, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r5, _0807B77C @ =gUnknown_02024E8C
	ldr r0, _0807B780 @ =gTrainerBackPicCoords
	ldrb r0, [r0, 0x8]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r4, r1
	asrs r4, 16
	movs r0, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
_0807B73C:
	movs r1, 0x50
	adds r2, r4, 0
	bl CreateSprite
	ldr r3, _0807B784 @ =gUnknown_02024BE0
	strb r0, [r3]
	ldr r4, _0807B788 @ =gSprites
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B78C @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x2E]
	b _0807B86C
	.align 2, 0
_0807B77C: .4byte gUnknown_02024E8C
_0807B780: .4byte gTrainerBackPicCoords
_0807B784: .4byte gUnknown_02024BE0
_0807B788: .4byte gSprites
_0807B78C: .4byte SpriteCallbackDummy
_0807B790:
	ldr r1, _0807B8A8 @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B8AC @ =gPlayerParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0807B898
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _0807B8B0 @ =gUnknown_02024E8C
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _0807B8B4 @ =gUnknown_02024BE0
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B8B8 @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B8BC @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0807B8C0 @ =gUnknown_02024E84
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
_0807B86C:
	ldr r1, _0807B8B8 @ =gSprites
	ldr r0, _0807B8B4 @ =gUnknown_02024BE0
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r0, _0807B8C4 @ =0x02017800
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r1, [r0]
	lsls r1, 31
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0807B898:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8A8: .4byte gUnknown_02024A6A
_0807B8AC: .4byte gPlayerParty
_0807B8B0: .4byte gUnknown_02024E8C
_0807B8B4: .4byte gUnknown_02024BE0
_0807B8B8: .4byte gSprites
_0807B8BC: .4byte SpriteCallbackDummy
_0807B8C0: .4byte gUnknown_02024E84
_0807B8C4: .4byte 0x02017800
	thumb_func_end sub_807B184

	thumb_func_start sub_807B508
sub_807B508: @ 807B8C8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807B8F0 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0807B8D8
	b _0807BA4A
_0807B8D8:
	ldr r2, _0807B8F4 @ =gUnknown_020239F8
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B8F8
	cmp r5, 0
	bne _0807B8F8
	bl battle_make_oam_safari_battle
	b _0807B910
	.align 2, 0
_0807B8F0: .4byte gUnknown_02024A68
_0807B8F4: .4byte gUnknown_020239F8
_0807B8F8:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B90A
	cmp r5, 0
	bne _0807B90A
	b _0807BA4A
_0807B90A:
	adds r0, r5, 0
	bl battle_make_oam_normal_battle
_0807B910:
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0807B94C @ =gUnknown_03004340
	adds r4, r5, r0
	strb r6, [r4]
	adds r0, r5, 0
	bl sub_8043F44
	adds r0, r6, 0
	bl sub_8043DFC
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807B958
	ldrb r0, [r4]
	ldr r1, _0807B950 @ =gUnknown_02024A6A
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B954 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	b _0807B9A4
	.align 2, 0
_0807B94C: .4byte gUnknown_03004340
_0807B950: .4byte gUnknown_02024A6A
_0807B954: .4byte gEnemyParty
_0807B958:
	ldr r0, _0807B980 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B98C
	ldrb r0, [r4]
	ldr r1, _0807B984 @ =gUnknown_02024A6A
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B988 @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl sub_8045A5C
	b _0807B9A4
	.align 2, 0
_0807B980: .4byte gUnknown_020239F8
_0807B984: .4byte gUnknown_02024A6A
_0807B988: .4byte gPlayerParty
_0807B98C:
	ldrb r0, [r4]
	ldr r1, _0807B9D0 @ =gUnknown_02024A6A
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B9D4 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
_0807B9A4:
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0807B9C0
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0807B9DC
_0807B9C0:
	ldr r0, _0807B9D8 @ =gUnknown_03004340
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x1
	bl nullsub_11
	b _0807B9E8
	.align 2, 0
_0807B9D0: .4byte gUnknown_02024A6A
_0807B9D4: .4byte gPlayerParty
_0807B9D8: .4byte gUnknown_03004340
_0807B9DC:
	ldr r0, _0807BA14 @ =gUnknown_03004340
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0
	bl nullsub_11
_0807B9E8:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807BA20
	ldr r0, _0807BA18 @ =gUnknown_02024A6A
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807BA1C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807BA4A
	adds r0, r6, 0
	bl sub_8043DB0
	b _0807BA4A
	.align 2, 0
_0807BA14: .4byte gUnknown_03004340
_0807BA18: .4byte gUnknown_02024A6A
_0807BA1C: .4byte gEnemyParty
_0807BA20:
	ldr r0, _0807BA50 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807BA4A
	ldr r0, _0807BA54 @ =gUnknown_02024A6A
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807BA58 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807BA4A
	adds r0, r6, 0
	bl sub_8043DB0
_0807BA4A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BA50: .4byte gUnknown_020239F8
_0807BA54: .4byte gUnknown_02024A6A
_0807BA58: .4byte gPlayerParty
	thumb_func_end sub_807B508

	thumb_func_start unref_sub_807B69C
unref_sub_807B69C: @ 807BA5C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0807BB00 @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r6, [r0]
	ldr r0, _0807BB04 @ =sub_807B7E0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0807BB08 @ =0x08389d8c
	bl LoadCompressedObjectPic
	ldr r0, _0807BB0C @ =0x0838a694
	bl LoadCompressedObjectPalette
	ldr r1, _0807BB10 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	strh r4, [r1, 0x8]
	cmp r5, 0
	beq _0807BB1C
	movs r0, 0x1F
	strh r0, [r1, 0xA]
	movs r5, 0
	lsls r0, r6, 4
	ldr r7, _0807BB14 @ =gSprites
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r7
_0807BAB0:
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r6, 0x22]
	adds r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _0807BB18 @ =gSpriteTemplate_83931F8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 4
	adds r0, r1
	strh r0, [r3, 0x2E]
	movs r0, 0xFF
	lsls r0, 8
	strh r0, [r3, 0x30]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, 0x4
	bls _0807BAF4
	movs r0, 0x15
	strh r0, [r3, 0x3A]
_0807BAF4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0807BAB0
	b _0807BB7C
	.align 2, 0
_0807BB00: .4byte gUnknown_02024BE0
_0807BB04: .4byte sub_807B7E0
_0807BB08: .4byte 0x08389d8c
_0807BB0C: .4byte 0x0838a694
_0807BB10: .4byte gTasks
_0807BB14: .4byte gSprites
_0807BB18: .4byte gSpriteTemplate_83931F8
_0807BB1C:
	movs r0, 0xF8
	lsls r0, 7
	strh r0, [r1, 0xA]
	movs r5, 0
	lsls r0, r6, 4
	ldr r7, _0807BB98 @ =gSprites
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r7
_0807BB2E:
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, 0x22]
	subs r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _0807BB9C @ =gSpriteTemplate_83931F8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 4
	adds r0, r1
	strh r0, [r3, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x30]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, 0x4
	bls _0807BB72
	movs r0, 0x15
	strh r0, [r3, 0x3A]
_0807BB72:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0807BB2E
_0807BB7C:
	ldr r0, _0807BB98 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807BB98: .4byte gSprites
_0807BB9C: .4byte gSpriteTemplate_83931F8
	thumb_func_end unref_sub_807B69C

	thumb_func_start sub_807B7E0
sub_807B7E0: @ 807BBA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807BBF8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x2
	bne _0807BC26
	movs r0, 0
	strh r0, [r4, 0xC]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x10]
	ldrh r3, [r4, 0xA]
	movs r1, 0x10
	bl BlendPalette
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0807BBFC
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0807BC2A
	movs r0, 0x1
	eors r0, r2
	strh r0, [r4, 0x12]
	b _0807BC2A
	.align 2, 0
_0807BBF8: .4byte gTasks
_0807BBFC:
	ldrh r1, [r4, 0x10]
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _0807BC2A
	strh r1, [r4, 0x10]
	movs r0, 0x1
	eors r0, r2
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0807BC2A
	adds r0, r5, 0
	bl DestroyTask
	b _0807BC2A
_0807BC26:
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
_0807BC2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807B7E0

	thumb_func_start sub_807B870
sub_807B870: @ 807BC30
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _0807BC5C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldr r1, _0807BC58 @ =sub_807B8A4
	str r1, [r2, 0x1C]
	adds r0, r2, 0
	bl _call_via_r1
	b _0807BC60
	.align 2, 0
_0807BC58: .4byte sub_807B8A4
_0807BC5C:
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
_0807BC60:
	pop {r0}
	bx r0
	thumb_func_end sub_807B870

	thumb_func_start sub_807B8A4
sub_807B8A4: @ 807BC64
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _0807BC90
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _0807BC96
_0807BC90:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_0807BC96:
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x34
	bne _0807BCD8
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807BCD2
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
	b _0807BCD8
_0807BCD2:
	adds r0, r4, 0
	bl DestroySprite
_0807BCD8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807B8A4

	thumb_func_start sub_807B920
sub_807B920: @ 807BCE0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _0807BD70 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _0807BD74 @ =0xffe00000
	adds r0, r1
	lsrs r5, r0, 16
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	ldr r2, _0807BD78 @ =0xffdc0000
	adds r0, r2
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807BD1E
	lsls r0, r5, 16
	ldr r1, _0807BD7C @ =0xfffa0000
	adds r0, r1
	lsrs r5, r0, 16
_0807BD1E:
	ldr r1, _0807BD80 @ =0x04000050
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0807BD84 @ =gSpriteTemplate_83931E0
	lsls r1, r5, 16
	asrs r1, 16
	lsls r2, r4, 16
	asrs r2, 16
	movs r3, 0x4
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0807BD88 @ =gSprites
	adds r0, r1
	ldr r1, _0807BD8C @ =gUnknown_083931D8
	bl SetSubspriteTables
	ldr r1, _0807BD90 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x26]
	ldr r1, _0807BD94 @ =sub_807B9D8
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD70: .4byte gUnknown_0202F7C9
_0807BD74: .4byte 0xffe00000
_0807BD78: .4byte 0xffdc0000
_0807BD7C: .4byte 0xfffa0000
_0807BD80: .4byte 0x04000050
_0807BD84: .4byte gSpriteTemplate_83931E0
_0807BD88: .4byte gSprites
_0807BD8C: .4byte gUnknown_083931D8
_0807BD90: .4byte gTasks
_0807BD94: .4byte sub_807B9D8
	thumb_func_end sub_807B920

	thumb_func_start sub_807B9D8
sub_807B9D8: @ 807BD98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BDC4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	adds r2, r0, 0
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0807BDCC
	ldr r0, _0807BDC8 @ =sub_807BA24
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0xA]
	b _0807BDDC
	.align 2, 0
_0807BDC4: .4byte gTasks
_0807BDC8: .4byte sub_807BA24
_0807BDCC:
	lsls r0, r2, 24
	lsrs r0, 24
	ldr r2, _0807BDE0 @ =0x04000052
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
_0807BDDC:
	pop {r0}
	bx r0
	.align 2, 0
_0807BDE0: .4byte 0x04000052
	thumb_func_end sub_807B9D8

	thumb_func_start sub_807BA24
sub_807BA24: @ 807BDE4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807BE7C @ =0x0000271a
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0807BE80 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r1, r0, 0x1
	strh r1, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	ble _0807BE74
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0807BE74
	ldr r3, _0807BE84 @ =gPlttBufferFaded
	lsls r2, 4
	mov r12, r2
	ldr r1, _0807BE88 @ =0x0000010d
	add r1, r12
	lsls r1, 1
	adds r1, r3
	ldrh r4, [r1]
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	lsls r2, 1
	adds r2, r3
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _0807BE8C @ =0x0000010f
	add r0, r12
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	strh r1, [r2]
	strh r4, [r0]
	strh r6, [r5, 0xC]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0807BE74
	strh r6, [r5, 0xE]
	strh r6, [r5, 0xA]
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0807BE74
	movs r0, 0x9
	strh r0, [r5, 0xA]
	ldr r0, _0807BE90 @ =sub_807BAD4
	str r0, [r5]
_0807BE74:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE7C: .4byte 0x0000271a
_0807BE80: .4byte gTasks
_0807BE84: .4byte gPlttBufferFaded
_0807BE88: .4byte 0x0000010d
_0807BE8C: .4byte 0x0000010f
_0807BE90: .4byte sub_807BAD4
	thumb_func_end sub_807BA24

	thumb_func_start sub_807BAD4
sub_807BAD4: @ 807BE94
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BEC4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	adds r3, r0, 0
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0807BECC
	ldr r0, _0807BEC8 @ =sub_807BB24
	str r0, [r2]
	movs r0, 0
	strh r0, [r2, 0xA]
	b _0807BEDC
	.align 2, 0
_0807BEC4: .4byte gTasks
_0807BEC8: .4byte sub_807BB24
_0807BECC:
	lsls r0, r3, 24
	lsrs r0, 24
	ldr r2, _0807BEE0 @ =0x04000052
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
_0807BEDC:
	pop {r0}
	bx r0
	.align 2, 0
_0807BEE0: .4byte 0x04000052
	thumb_func_end sub_807BAD4

	thumb_func_start sub_807BB24
sub_807BB24: @ 807BEE4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _0807BF24 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x25
	bne _0807BF2C
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807BF28 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _0807BF3E
	.align 2, 0
_0807BF24: .4byte gTasks
_0807BF28: .4byte gSprites
_0807BF2C:
	cmp r0, 0x27
	bne _0807BF3E
	ldr r0, _0807BF44 @ =0x04000050
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, r2, 0
	bl move_anim_task_del
_0807BF3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF44: .4byte 0x04000050
	thumb_func_end sub_807BB24

	thumb_func_start sub_807BB88
sub_807BB88: @ 807BF48
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r0, _0807BF68 @ =0x02017840
	ldrh r0, [r0]
	subs r0, 0xF
	cmp r0, 0x2B
	bls _0807BF5C
	b _0807C0E0
_0807BF5C:
	lsls r0, 2
	ldr r1, _0807BF6C @ =_0807BF70
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BF68: .4byte 0x02017840
_0807BF6C: .4byte _0807BF70
	.align 2, 0
_0807BF70:
	.4byte _0807C020
	.4byte _0807C026
	.4byte _0807C02C
	.4byte _0807C032
	.4byte _0807C038
	.4byte _0807C03E
	.4byte _0807C044
	.4byte _0807C04A
	.4byte _0807C050
	.4byte _0807C056
	.4byte _0807C05C
	.4byte _0807C062
	.4byte _0807C068
	.4byte _0807C06E
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C074
	.4byte _0807C078
	.4byte _0807C07C
	.4byte _0807C080
	.4byte _0807C084
	.4byte _0807C088
	.4byte _0807C08C
	.4byte _0807C090
	.4byte _0807C098
	.4byte _0807C0A0
	.4byte _0807C0A8
	.4byte _0807C0B0
	.4byte _0807C0B8
	.4byte _0807C0C0
	.4byte _0807C0E0
	.4byte _0807C0E0
	.4byte _0807C0C8
	.4byte _0807C0CC
	.4byte _0807C0D0
	.4byte _0807C0D8
_0807C020:
	movs r5, 0
	movs r2, 0
	b _0807C0E8
_0807C026:
	movs r5, 0
	movs r2, 0x1
	b _0807C0E8
_0807C02C:
	movs r5, 0
	movs r2, 0x3
	b _0807C0E8
_0807C032:
	movs r5, 0
	movs r2, 0x5
	b _0807C0E8
_0807C038:
	movs r5, 0
	movs r2, 0x6
	b _0807C0E8
_0807C03E:
	movs r5, 0
	movs r2, 0x2
	b _0807C0E8
_0807C044:
	movs r5, 0
	movs r2, 0x4
	b _0807C0E8
_0807C04A:
	movs r5, 0x1
	movs r2, 0
	b _0807C0E8
_0807C050:
	movs r5, 0x1
	movs r2, 0x1
	b _0807C0E8
_0807C056:
	movs r5, 0x1
	movs r2, 0x3
	b _0807C0E8
_0807C05C:
	movs r5, 0x1
	movs r2, 0x5
	b _0807C0E8
_0807C062:
	movs r5, 0x1
	movs r2, 0x6
	b _0807C0E8
_0807C068:
	movs r5, 0x1
	movs r2, 0x2
	b _0807C0E8
_0807C06E:
	movs r5, 0x1
	movs r2, 0x4
	b _0807C0E8
_0807C074:
	movs r5, 0
	b _0807C092
_0807C078:
	movs r5, 0
	b _0807C09A
_0807C07C:
	movs r5, 0
	b _0807C0A2
_0807C080:
	movs r5, 0
	b _0807C0AA
_0807C084:
	movs r5, 0
	b _0807C0B2
_0807C088:
	movs r5, 0
	b _0807C0BA
_0807C08C:
	movs r5, 0
	b _0807C0C2
_0807C090:
	movs r5, 0x1
_0807C092:
	movs r2, 0
	movs r3, 0x1
	b _0807C0E8
_0807C098:
	movs r5, 0x1
_0807C09A:
	movs r2, 0x1
	movs r3, 0x1
	b _0807C0E8
_0807C0A0:
	movs r5, 0x1
_0807C0A2:
	movs r2, 0x3
	movs r3, 0x1
	b _0807C0E8
_0807C0A8:
	movs r5, 0x1
_0807C0AA:
	movs r2, 0x5
	movs r3, 0x1
	b _0807C0E8
_0807C0B0:
	movs r5, 0x1
_0807C0B2:
	movs r2, 0x6
	movs r3, 0x1
	b _0807C0E8
_0807C0B8:
	movs r5, 0x1
_0807C0BA:
	movs r2, 0x2
	movs r3, 0x1
	b _0807C0E8
_0807C0C0:
	movs r5, 0x1
_0807C0C2:
	movs r2, 0x4
	movs r3, 0x1
	b _0807C0E8
_0807C0C8:
	movs r5, 0
	b _0807C0D2
_0807C0CC:
	movs r5, 0
	b _0807C0DA
_0807C0D0:
	movs r5, 0x1
_0807C0D2:
	movs r2, 0xFF
	movs r3, 0
	b _0807C0E8
_0807C0D8:
	movs r5, 0x1
_0807C0DA:
	movs r2, 0xFF
	movs r3, 0x1
	b _0807C0E8
_0807C0E0:
	adds r0, r4, 0
	bl move_anim_task_del
	b _0807C10A
_0807C0E8:
	ldr r0, _0807C110 @ =gUnknown_03004B00
	movs r1, 0
	strh r5, [r0]
	strh r2, [r0, 0x2]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	strh r3, [r0, 0x8]
	ldr r1, _0807C114 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0807C118 @ =sub_80E32E0
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_0807C10A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C110: .4byte gUnknown_03004B00
_0807C114: .4byte gTasks
_0807C118: .4byte sub_80E32E0
	thumb_func_end sub_807BB88

	thumb_func_start move_anim_start_t2
move_anim_start_t2: @ 807C11C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0807C158 @ =gUnknown_0202F7C8
	strb r4, [r0]
	ldr r0, _0807C15C @ =gUnknown_0202F7C9
	strb r4, [r0]
	ldr r0, _0807C160 @ =gBattleAnims_StatusConditions
	movs r2, 0
	bl move_something
	ldr r0, _0807C164 @ =sub_807BDAC
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C168 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C158: .4byte gUnknown_0202F7C8
_0807C15C: .4byte gUnknown_0202F7C9
_0807C160: .4byte gBattleAnims_StatusConditions
_0807C164: .4byte sub_807BDAC
_0807C168: .4byte gTasks
	thumb_func_end move_anim_start_t2

	thumb_func_start sub_807BDAC
sub_807BDAC: @ 807C16C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807C1B0 @ =gUnknown_0202F7AC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0807C1B4 @ =gUnknown_0202F7B1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807C1AA
	ldr r1, _0807C1B8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0807C1BC @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0807C1AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C1B0: .4byte gUnknown_0202F7AC
_0807C1B4: .4byte gUnknown_0202F7B1
_0807C1B8: .4byte gTasks
_0807C1BC: .4byte 0x02017810
	thumb_func_end sub_807BDAC

	.align 2, 0 @ Don't pad with nop.
