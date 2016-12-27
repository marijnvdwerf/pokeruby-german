	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BD7A8
sub_80BD7A8: @ 80BD93C
	push {r4-r7,lr}
	movs r3, 0
	ldr r6, _080BD984 @ =gSaveBlock1
	movs r4, 0
	ldr r0, _080BD988 @ =0x0000273a
	adds r5, r6, r0
_080BD948:
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	adds r1, r2, r6
	ldr r7, _080BD98C @ =0x00002738
	adds r0, r1, r7
	strb r4, [r0]
	ldr r0, _080BD990 @ =0x00002739
	adds r1, r0
	strb r4, [r1]
	movs r1, 0
	adds r3, 0x1
_080BD960:
	adds r0, r1, r2
	adds r0, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x21
	bls _080BD960
	lsls r0, r3, 24
	lsrs r3, r0, 24
	cmp r3, 0x18
	bls _080BD948
	bl sub_80BEBF4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD984: .4byte gSaveBlock1
_080BD988: .4byte 0x0000273a
_080BD98C: .4byte 0x00002738
_080BD990: .4byte 0x00002739
	thumb_func_end sub_80BD7A8

	thumb_func_start special_0x44
special_0x44: @ 80BD994
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r4, 0x5
	ldr r1, _080BDA08 @ =gSaveBlock1
	ldr r2, _080BDA0C @ =0x000027ec
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BD9C8
	adds r2, r1, 0
	ldr r1, _080BDA10 @ =0x00002738
_080BD9AE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x17
	bhi _080BD9C8
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BD9AE
_080BD9C8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	ldr r7, _080BDA08 @ =gSaveBlock1
	ldr r0, _080BDA10 @ =0x00002738
	adds r0, r7
	mov r9, r0
_080BD9E4:
	lsls r0, r4, 3
	adds r0, r4
	lsls r6, r0, 2
	adds r5, r6, r7
	ldr r1, _080BDA10 @ =0x00002738
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _080BDA18
	ldr r2, _080BDA14 @ =0x00002739
	adds r0, r5, r2
	ldrb r0, [r0]
	b _080BDA24
	.align 2, 0
_080BDA08: .4byte gSaveBlock1
_080BDA0C: .4byte 0x000027ec
_080BDA10: .4byte 0x00002738
_080BDA14: .4byte 0x00002739
_080BDA18:
	mov r0, r9
	adds r1, r6, r0
	ldrh r0, [r1, 0x16]
	cmp r0, 0
	bne _080BDA2C
	ldrb r0, [r1, 0x1]
_080BDA24:
	cmp r0, 0x1
	bne _080BDA2C
	adds r0, r4, 0
	b _080BDA40
_080BDA2C:
	cmp r4, 0
	bne _080BDA34
	movs r4, 0x17
	b _080BDA3A
_080BDA34:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080BDA3A:
	cmp r4, r8
	bne _080BD9E4
	movs r0, 0xFF
_080BDA40:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end special_0x44

	thumb_func_start sub_80BD8B8
sub_80BD8B8: @ 80BDA4C
	push {lr}
	bl special_0x44
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	bne _080BDA5E
	movs r0, 0xFF
	b _080BDA96
_080BDA5E:
	ldr r2, _080BDA88 @ =gSaveBlock1
	ldr r3, _080BDA8C @ =0x00002afc
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080BDA94
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r2, _080BDA90 @ =0x00002738
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BDA94
	bl sub_80BDA30
	lsls r0, 24
	lsrs r0, 24
	b _080BDA96
	.align 2, 0
_080BDA88: .4byte gSaveBlock1
_080BDA8C: .4byte 0x00002afc
_080BDA90: .4byte 0x00002738
_080BDA94:
	adds r0, r1, 0
_080BDA96:
	pop {r1}
	bx r1
	thumb_func_end sub_80BD8B8

	thumb_func_start UpdateTVScreensOnMap
UpdateTVScreensOnMap: @ 80BDA9C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _080BDACC @ =0x00000831
	bl FlagSet
	bl CheckForBigMovieOrEmergencyNewsOnTV
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BDAC0
	cmp r0, 0x2
	beq _080BDB12
	ldr r0, _080BDAD0 @ =gSaveBlock1
	ldrh r0, [r0, 0x4]
	cmp r0, 0xD
	bne _080BDAD4
_080BDAC0:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl SetTVMetatilesOnMap
	b _080BDB12
	.align 2, 0
_080BDACC: .4byte 0x00000831
_080BDAD0: .4byte gSaveBlock1
_080BDAD4:
	ldr r0, _080BDB18 @ =0x00000832
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BDB12
	bl sub_80BD8B8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080BDB02
	bl sub_80BECA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080BDB02
	bl IsTVShowInSearchOfTrainersAiring
	lsls r0, 24
	cmp r0, 0
	beq _080BDB12
_080BDB02:
	ldr r0, _080BDB1C @ =0x00000831
	bl FlagReset
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl SetTVMetatilesOnMap
_080BDB12:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDB18: .4byte 0x00000832
_080BDB1C: .4byte 0x00000831
	thumb_func_end UpdateTVScreensOnMap

	thumb_func_start SetTVMetatilesOnMap
SetTVMetatilesOnMap: @ 80BDB20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r0
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	movs r5, 0
	cmp r5, r10
	bge _080BDB74
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	mov r8, r2
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_080BDB46:
	movs r4, 0
	adds r7, r5, 0x1
	cmp r4, r9
	bge _080BDB6E
	mov r0, r8
	lsls r6, r0, 16
_080BDB52:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	cmp r0, 0x86
	bne _080BDB68
	adds r0, r4, 0
	adds r1, r5, 0
	lsrs r2, r6, 16
	bl MapGridSetMetatileIdAt
_080BDB68:
	adds r4, 0x1
	cmp r4, r9
	blt _080BDB52
_080BDB6E:
	adds r5, r7, 0
	cmp r5, r10
	blt _080BDB46
_080BDB74:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SetTVMetatilesOnMap

	thumb_func_start TurnOffTVScreen
TurnOffTVScreen: @ 80BDB84
	push {lr}
	ldr r1, _080BDB9C @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	movs r2, 0x2
	bl SetTVMetatilesOnMap
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_080BDB9C: .4byte gUnknown_03004870
	thumb_func_end TurnOffTVScreen

	thumb_func_start sub_80BDA0C
sub_80BDA0C: @ 80BDBA0
	ldr r2, _080BDBB8 @ =gSaveBlock1
	ldr r0, _080BDBBC @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BDBC0 @ =0x00002738
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080BDBB8: .4byte gSaveBlock1
_080BDBBC: .4byte gSpecialVar_0x8004
_080BDBC0: .4byte 0x00002738
	thumb_func_end sub_80BDA0C

	thumb_func_start sub_80BDA30
sub_80BDA30: @ 80BDBC4
	push {r4,lr}
	movs r2, 0
	ldr r3, _080BDBF0 @ =gSaveBlock1
_080BDBCA:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldr r4, _080BDBF4 @ =0x00002738
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BDBF8
	cmp r0, 0x29
	beq _080BDBF8
	adds r4, 0x1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BDBF8
	adds r0, r2, 0
	b _080BDC04
	.align 2, 0
_080BDBF0: .4byte gSaveBlock1
_080BDBF4: .4byte 0x00002738
_080BDBF8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080BDBCA
	movs r0, 0xFF
_080BDC04:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BDA30

	thumb_func_start special_0x4a
special_0x4a: @ 80BDC0C
	push {lr}
	ldr r2, _080BDC38 @ =gSpecialVar_0x8004
	ldrh r1, [r2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BDC3C @ =0x02027e6c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BDC40
	movs r3, 0xF1
	lsls r3, 2
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080BDC40
	bl sub_80BDA30
	lsls r0, 24
	lsrs r0, 24
	b _080BDC42
	.align 2, 0
_080BDC38: .4byte gSpecialVar_0x8004
_080BDC3C: .4byte 0x02027e6c
_080BDC40:
	ldrb r0, [r2]
_080BDC42:
	pop {r1}
	bx r1
	thumb_func_end special_0x4a

	thumb_func_start sub_80BDAB4
sub_80BDAB4: @ 80BDC48
	push {r4,lr}
	ldr r2, _080BDC8C @ =gSaveBlock1
	ldr r1, _080BDC90 @ =0x00002b10
	adds r0, r2, r1
	movs r3, 0
	movs r1, 0
	strh r1, [r0]
	ldr r4, _080BDC94 @ =0x00002b12
	adds r0, r2, r4
	strh r1, [r0]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080BDC98 @ =0x00002b16
	adds r1, r2, r0
	ldr r0, _080BDC9C @ =0x0000ffff
	strh r0, [r1]
	adds r4, 0x6
	adds r1, r2, r4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080BDCA0 @ =0x00002b1b
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080BDCA4 @ =0x00002b18
	adds r0, r2, r1
	strb r3, [r0]
	subs r4, 0x1
	adds r2, r4
	strb r3, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC8C: .4byte gSaveBlock1
_080BDC90: .4byte 0x00002b10
_080BDC94: .4byte 0x00002b12
_080BDC98: .4byte 0x00002b16
_080BDC9C: .4byte 0x0000ffff
_080BDCA0: .4byte 0x00002b1b
_080BDCA4: .4byte 0x00002b18
	thumb_func_end sub_80BDAB4

	thumb_func_start GabbyAndTyBeforeInterview
GabbyAndTyBeforeInterview: @ 80BDCA8
	push {r4,r5,lr}
	ldr r2, _080BDCFC @ =gSaveBlock1
	ldr r3, _080BDD00 @ =gUnknown_030042E0
	ldrh r1, [r3, 0x6]
	ldr r4, _080BDD04 @ =0x00002b10
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r1, [r3, 0x26]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r1, [r3, 0x22]
	adds r4, 0x2
	adds r0, r2, r4
	strh r1, [r0]
	ldr r0, _080BDD08 @ =0x00002b19
	adds r4, r2, r0
	ldrb r1, [r4]
	adds r0, r1, 0
	adds r5, r2, 0
	cmp r0, 0xFF
	beq _080BDCD8
	adds r0, r1, 0x1
	strb r0, [r4]
_080BDCD8:
	ldrb r0, [r3, 0x5]
	lsls r0, 31
	ldr r1, _080BDD0C @ =0x00002b1a
	adds r4, r5, r1
	lsrs r0, 31
	ldrb r1, [r4]
	movs r2, 0x2
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4]
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BDD10
	movs r0, 0x2
	orrs r2, r0
	b _080BDD16
	.align 2, 0
_080BDCFC: .4byte gSaveBlock1
_080BDD00: .4byte gUnknown_030042E0
_080BDD04: .4byte 0x00002b10
_080BDD08: .4byte 0x00002b19
_080BDD0C: .4byte 0x00002b1a
_080BDD10:
	movs r0, 0x3
	negs r0, r0
	ands r2, r0
_080BDD16:
	strb r2, [r4]
	ldrb r0, [r3, 0x3]
	cmp r0, 0
	beq _080BDD30
	ldr r4, _080BDD2C @ =0x00002b1a
	adds r0, r5, r4
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080BDD3E
	.align 2, 0
_080BDD2C: .4byte 0x00002b1a
_080BDD30:
	ldr r0, _080BDD70 @ =0x00002b1a
	adds r2, r5, r0
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080BDD3E:
	ldrb r1, [r3, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BDD74
	movs r1, 0
	adds r0, r3, 0
	adds r0, 0x36
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BDD74
_080BDD54:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bhi _080BDD80
	adds r0, r3, 0
	adds r0, 0x36
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BDD54
	ldr r4, _080BDD70 @ =0x00002b1a
	adds r0, r5, r4
	b _080BDD78
	.align 2, 0
_080BDD70: .4byte 0x00002b1a
_080BDD74:
	ldr r1, _080BDD9C @ =0x00002b1a
	adds r0, r5, r1
_080BDD78:
	ldrb r1, [r0]
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0]
_080BDD80:
	bl TakeTVShowInSearchOfTrainersOffTheAir
	ldr r0, _080BDDA0 @ =gSaveBlock1
	ldr r4, _080BDDA4 @ =0x00002b14
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BDD96
	movs r0, 0x1
	bl FlagSet
_080BDD96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD9C: .4byte 0x00002b1a
_080BDDA0: .4byte gSaveBlock1
_080BDDA4: .4byte 0x00002b14
	thumb_func_end GabbyAndTyBeforeInterview

	thumb_func_start sub_80BDC14
sub_80BDC14: @ 80BDDA8
	push {r4-r6,lr}
	ldr r4, _080BDE04 @ =gSaveBlock1
	ldr r0, _080BDE08 @ =0x00002b1a
	adds r6, r4, r0
	ldrb r3, [r6]
	lsls r1, r3, 31
	adds r0, 0x1
	adds r5, r4, r0
	lsrs r1, 31
	ldrb r2, [r5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	movs r1, 0x2
	ands r1, r3
	movs r2, 0x3
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	movs r1, 0x4
	ands r1, r3
	subs r2, 0x2
	ands r0, r2
	orrs r0, r1
	movs r1, 0x8
	ands r1, r3
	subs r2, 0x4
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	movs r0, 0x10
	orrs r3, r0
	strb r3, [r6]
	ldr r0, _080BDE0C @ =gMapHeader
	ldrb r0, [r0, 0x14]
	ldr r1, _080BDE10 @ =0x00002b18
	adds r4, r1
	strb r0, [r4]
	movs r0, 0x6
	bl sav12_xor_increment
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDE04: .4byte gSaveBlock1
_080BDE08: .4byte 0x00002b1a
_080BDE0C: .4byte gMapHeader
_080BDE10: .4byte 0x00002b18
	thumb_func_end sub_80BDC14

	thumb_func_start TakeTVShowInSearchOfTrainersOffTheAir
TakeTVShowInSearchOfTrainersOffTheAir: @ 80BDE14
	ldr r0, _080BDE28 @ =gSaveBlock1
	ldr r1, _080BDE2C @ =0x00002b1a
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BDE28: .4byte gSaveBlock1
_080BDE2C: .4byte 0x00002b1a
	thumb_func_end TakeTVShowInSearchOfTrainersOffTheAir

	thumb_func_start GabbyAndTyGetBattleNum
GabbyAndTyGetBattleNum: @ 80BDE30
	push {lr}
	ldr r0, _080BDE50 @ =gSaveBlock1
	ldr r2, _080BDE54 @ =0x00002b19
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0x5
	bls _080BDE4C
	ldrb r0, [r1]
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	lsls r0, 24
	lsrs r0, 24
_080BDE4C:
	pop {r1}
	bx r1
	.align 2, 0
_080BDE50: .4byte gSaveBlock1
_080BDE54: .4byte 0x00002b19
	thumb_func_end GabbyAndTyGetBattleNum

	thumb_func_start IsTVShowInSearchOfTrainersAiring
IsTVShowInSearchOfTrainersAiring: @ 80BDE58
	ldr r0, _080BDE68 @ =gSaveBlock1
	ldr r1, _080BDE6C @ =0x00002b1a
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_080BDE68: .4byte gSaveBlock1
_080BDE6C: .4byte 0x00002b1a
	thumb_func_end IsTVShowInSearchOfTrainersAiring

	thumb_func_start GabbyAndTyGetLastQuote
GabbyAndTyGetLastQuote: @ 80BDE70
	push {r4,r5,lr}
	ldr r0, _080BDE94 @ =gSaveBlock1
	ldr r1, _080BDE98 @ =0x00002b16
	adds r4, r0, r1
	ldrh r0, [r4]
	ldr r5, _080BDE9C @ =0x0000ffff
	cmp r0, r5
	beq _080BDEA4
	ldr r0, _080BDEA0 @ =gStringVar1
	ldrh r1, [r4]
	bl ConvertEasyChatWordsToString
	ldrh r1, [r4]
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r4]
	movs r0, 0x1
	b _080BDEA6
	.align 2, 0
_080BDE94: .4byte gSaveBlock1
_080BDE98: .4byte 0x00002b16
_080BDE9C: .4byte 0x0000ffff
_080BDEA0: .4byte gStringVar1
_080BDEA4:
	movs r0, 0
_080BDEA6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GabbyAndTyGetLastQuote

	thumb_func_start sub_80BDD18
sub_80BDD18: @ 80BDEAC
	push {lr}
	ldr r0, _080BDEC4 @ =gSaveBlock1
	ldr r1, _080BDEC8 @ =0x00002b1b
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BDECC
	movs r0, 0x1
	b _080BDEF2
	.align 2, 0
_080BDEC4: .4byte gSaveBlock1
_080BDEC8: .4byte 0x00002b1b
_080BDECC:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080BDED8
	movs r0, 0x2
	b _080BDEF2
_080BDED8:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080BDEE4
	movs r0, 0x3
	b _080BDEF2
_080BDEE4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080BDEF0
	movs r0, 0
	b _080BDEF2
_080BDEF0:
	movs r0, 0x4
_080BDEF2:
	pop {r1}
	bx r1
	thumb_func_end sub_80BDD18

	thumb_func_start GabbyAndTySetScriptVarsToFieldObjectLocalIds
GabbyAndTySetScriptVarsToFieldObjectLocalIds: @ 80BDEF8
	push {lr}
	bl GabbyAndTyGetBattleNum
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x7
	bhi _080BDFD0
	lsls r0, 2
	ldr r1, _080BDF14 @ =_080BDF18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BDF14: .4byte _080BDF18
	.align 2, 0
_080BDF18:
	.4byte _080BDF38
	.4byte _080BDF4C
	.4byte _080BDF60
	.4byte _080BDF74
	.4byte _080BDF88
	.4byte _080BDF9C
	.4byte _080BDFB0
	.4byte _080BDFC4
_080BDF38:
	ldr r1, _080BDF44 @ =gSpecialVar_0x8004
	movs r0, 0xE
	strh r0, [r1]
	ldr r1, _080BDF48 @ =gSpecialVar_0x8005
	movs r0, 0xD
	b _080BDFCE
	.align 2, 0
_080BDF44: .4byte gSpecialVar_0x8004
_080BDF48: .4byte gSpecialVar_0x8005
_080BDF4C:
	ldr r1, _080BDF58 @ =gSpecialVar_0x8004
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _080BDF5C @ =gSpecialVar_0x8005
	movs r0, 0x6
	b _080BDFCE
	.align 2, 0
_080BDF58: .4byte gSpecialVar_0x8004
_080BDF5C: .4byte gSpecialVar_0x8005
_080BDF60:
	ldr r1, _080BDF6C @ =gSpecialVar_0x8004
	movs r0, 0x12
	strh r0, [r1]
	ldr r1, _080BDF70 @ =gSpecialVar_0x8005
	movs r0, 0x11
	b _080BDFCE
	.align 2, 0
_080BDF6C: .4byte gSpecialVar_0x8004
_080BDF70: .4byte gSpecialVar_0x8005
_080BDF74:
	ldr r1, _080BDF80 @ =gSpecialVar_0x8004
	movs r0, 0x15
	strh r0, [r1]
	ldr r1, _080BDF84 @ =gSpecialVar_0x8005
	movs r0, 0x16
	b _080BDFCE
	.align 2, 0
_080BDF80: .4byte gSpecialVar_0x8004
_080BDF84: .4byte gSpecialVar_0x8005
_080BDF88:
	ldr r1, _080BDF94 @ =gSpecialVar_0x8004
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080BDF98 @ =gSpecialVar_0x8005
	movs r0, 0x9
	b _080BDFCE
	.align 2, 0
_080BDF94: .4byte gSpecialVar_0x8004
_080BDF98: .4byte gSpecialVar_0x8005
_080BDF9C:
	ldr r1, _080BDFA8 @ =gSpecialVar_0x8004
	movs r0, 0x13
	strh r0, [r1]
	ldr r1, _080BDFAC @ =gSpecialVar_0x8005
	movs r0, 0x14
	b _080BDFCE
	.align 2, 0
_080BDFA8: .4byte gSpecialVar_0x8004
_080BDFAC: .4byte gSpecialVar_0x8005
_080BDFB0:
	ldr r1, _080BDFBC @ =gSpecialVar_0x8004
	movs r0, 0x17
	strh r0, [r1]
	ldr r1, _080BDFC0 @ =gSpecialVar_0x8005
	movs r0, 0x18
	b _080BDFCE
	.align 2, 0
_080BDFBC: .4byte gSpecialVar_0x8004
_080BDFC0: .4byte gSpecialVar_0x8005
_080BDFC4:
	ldr r1, _080BDFD4 @ =gSpecialVar_0x8004
	movs r0, 0xA
	strh r0, [r1]
	ldr r1, _080BDFD8 @ =gSpecialVar_0x8005
	movs r0, 0xB
_080BDFCE:
	strh r0, [r1]
_080BDFD0:
	pop {r0}
	bx r0
	.align 2, 0
_080BDFD4: .4byte gSpecialVar_0x8004
_080BDFD8: .4byte gSpecialVar_0x8005
	thumb_func_end GabbyAndTySetScriptVarsToFieldObjectLocalIds

	thumb_func_start sub_80BDE48
sub_80BDE48: @ 80BDFDC
	push {lr}
	ldr r0, _080BDFF4 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080BE03A
	lsls r0, 2
	ldr r1, _080BDFF8 @ =_080BDFFC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BDFF4: .4byte gSpecialVar_0x8005
_080BDFF8: .4byte _080BDFFC
	.align 2, 0
_080BDFFC:
	.4byte _080BE018
	.4byte _080BE01E
	.4byte _080BE024
	.4byte _080BE02A
	.4byte _080BE03A
	.4byte _080BE030
	.4byte _080BE036
_080BE018:
	bl sub_80BE5FC
	b _080BE03A
_080BE01E:
	bl sub_80BE65C
	b _080BE03A
_080BE024:
	bl sub_80BE6A0
	b _080BE03A
_080BE02A:
	bl nullsub_21
	b _080BE03A
_080BE030:
	bl sub_80BE188
	b _080BE03A
_080BE036:
	bl sub_80BE320
_080BE03A:
	pop {r0}
	bx r0
	thumb_func_end sub_80BDE48

	thumb_func_start sub_80BDEAC
sub_80BDEAC: @ 80BE040
	push {lr}
	adds r1, r0, 0
	movs r2, 0x5
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _080BE054
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _080BE054
	movs r2, 0x1
_080BE054:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80BDEAC

	thumb_func_start sub_80BDEC8
sub_80BDEC8: @ 80BE05C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r4, 0
	bl sub_80BEB20
	bl sub_80BE778
	ldr r5, _080BE07C @ =gUnknown_030042E0
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	bne _080BE080
	bl sub_80BE074
	b _080BE1A6
	.align 2, 0
_080BE07C: .4byte gUnknown_030042E0
_080BE080:
	bl sub_80BE028
	ldr r0, _080BE12C @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	cmp r0, 0
	beq _080BE092
	b _080BE1A6
_080BE092:
	ldrh r1, [r5, 0x28]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080BE130 @ =gSpeciesNames
	adds r0, r1
	adds r1, r5, 0
	adds r1, 0x2A
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080BE0AA
	b _080BE1A6
_080BE0AA:
	ldr r0, _080BE134 @ =0x02027e6c
	bl sub_80BF74C
	ldr r1, _080BE138 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE1A6
	movs r0, 0x15
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE1A6
	movs r2, 0
	adds r7, r5, 0
	adds r1, r7, 0
	adds r1, 0x36
_080BE0D6:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _080BE0D6
	cmp r4, 0
	bne _080BE0F8
	ldrb r1, [r7, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BE1A6
_080BE0F8:
	movs r4, 0
	ldr r0, _080BE138 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BE134 @ =0x02027e6c
	adds r5, r0, r1
	movs r0, 0x15
	strb r0, [r5]
	strb r4, [r5, 0x1]
	ldrb r1, [r7, 0x5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BE140
	movs r4, 0x1
	movs r0, 0x1
	adds r3, r5, 0
	adds r3, 0x13
	ldr r1, _080BE13C @ =gSaveBlock2
	mov r8, r1
	adds r6, r5, 0x4
	b _080BE172
	.align 2, 0
_080BE12C: .4byte 0x0000ffff
_080BE130: .4byte gSpeciesNames
_080BE134: .4byte 0x02027e6c
_080BE138: .4byte gUnknown_03005D38
_080BE13C: .4byte gSaveBlock2
_080BE140:
	movs r2, 0
	ldr r0, _080BE1B0 @ =gUnknown_02024C04
	mov r12, r0
	adds r3, r5, 0
	adds r3, 0x13
	ldr r1, _080BE1B4 @ =gSaveBlock2
	mov r8, r1
	adds r6, r5, 0x4
	adds r1, r7, 0
	adds r1, 0x36
_080BE154:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bls _080BE154
	cmp r4, 0xFF
	bls _080BE16E
	movs r4, 0xFF
_080BE16E:
	mov r1, r12
	ldrh r0, [r1]
_080BE172:
	strb r4, [r5, 0x12]
	strb r0, [r5, 0xF]
	adds r0, r3, 0
	mov r1, r8
	bl StringCopy
	ldr r4, _080BE1B8 @ =gUnknown_0300430A
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringCopy
	subs r4, 0x2A
	ldrh r0, [r4, 0x28]
	strh r0, [r5, 0x10]
	adds r0, r5, 0
	bl sub_80BE138
	movs r0, 0x5
	strb r0, [r5, 0x2]
	adds r0, r6, 0
	bl sub_80BDEAC
	strb r0, [r5, 0x3]
	adds r0, r6, 0
	bl StripExtCtrlCodes
_080BE1A6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE1B0: .4byte gUnknown_02024C04
_080BE1B4: .4byte gSaveBlock2
_080BE1B8: .4byte gUnknown_0300430A
	thumb_func_end sub_80BDEC8

	thumb_func_start sub_80BE028
sub_80BE028: @ 80BE1BC
	push {r4,lr}
	ldr r4, _080BE1F8 @ =0x020281cc
	ldrb r0, [r4]
	cmp r0, 0x19
	beq _080BE1DC
	ldr r1, _080BE1FC @ =0xfffffca0
	adds r0, r4, r1
	movs r1, 0x18
	bl sub_80BF55C
	movs r0, 0x5
	bl sub_8053108
	strh r0, [r4, 0x6]
	movs r0, 0x19
	strb r0, [r4]
_080BE1DC:
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	ldr r1, _080BE200 @ =gUnknown_030042E0
	ldrh r0, [r1, 0x28]
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x8]
	ldr r0, _080BE204 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE1F8: .4byte 0x020281cc
_080BE1FC: .4byte 0xfffffca0
_080BE200: .4byte gUnknown_030042E0
_080BE204: .4byte gMapHeader
	thumb_func_end sub_80BE028

	thumb_func_start sub_80BE074
sub_80BE074: @ 80BE208
	push {r4-r7,lr}
	ldr r0, _080BE2AC @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	cmp r0, 0
	bne _080BE2A6
	movs r1, 0
	movs r5, 0
	ldr r2, _080BE2B0 @ =gUnknown_03004316
_080BE21C:
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bls _080BE21C
	cmp r5, 0xFF
	bls _080BE236
	movs r5, 0xFF
_080BE236:
	cmp r5, 0x2
	bls _080BE2A6
	ldr r7, _080BE2B4 @ =gUnknown_02024D26
	ldrb r0, [r7]
	cmp r0, 0x1
	bne _080BE2A6
	ldr r6, _080BE2B8 @ =0x02027e6c
	adds r0, r6, 0
	bl sub_80BF74C
	ldr r4, _080BE2BC @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE2A6
	movs r0, 0x17
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE2A6
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r6
	movs r1, 0
	movs r0, 0x17
	strb r0, [r4]
	strb r1, [r4, 0x1]
	ldr r1, _080BE2C0 @ =gUnknown_030042E0
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0xE]
	strb r5, [r4, 0x10]
	ldrb r0, [r7]
	strb r0, [r4, 0x11]
	ldr r0, _080BE2C4 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BE2C8 @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, 0x5
	strb r0, [r4, 0x2]
_080BE2A6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE2AC: .4byte 0x0000ffff
_080BE2B0: .4byte gUnknown_03004316
_080BE2B4: .4byte gUnknown_02024D26
_080BE2B8: .4byte 0x02027e6c
_080BE2BC: .4byte gUnknown_03005D38
_080BE2C0: .4byte gUnknown_030042E0
_080BE2C4: .4byte gMapHeader
_080BE2C8: .4byte gSaveBlock2
	thumb_func_end sub_80BE074

	thumb_func_start sub_80BE138
sub_80BE138: @ 80BE2CC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80BFB94
	strb r0, [r4, 0x1E]
	lsrs r2, r0, 8
	strb r2, [r4, 0x1F]
	adds r1, r4, 0
	adds r1, 0x20
	strb r0, [r1]
	adds r1, 0x1
	strb r2, [r1]
	adds r1, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x23
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE138

	thumb_func_start sub_80BE160
sub_80BE160: @ 80BE2F4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80BFB94
	adds r1, r4, 0
	adds r1, 0x20
	strb r0, [r1]
	lsrs r1, r0, 8
	adds r2, r4, 0
	adds r2, 0x21
	strb r1, [r2]
	adds r2, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x23
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE160

	thumb_func_start sub_80BE188
sub_80BE188: @ 80BE31C
	push {r4-r6,lr}
	ldr r6, _080BE3C0 @ =0x020281cc
	ldrb r1, [r6]
	cmp r1, 0x6
	bne _080BE3B8
	ldr r0, _080BE3C4 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r2, _080BE3C8 @ =0xfffffca0
	adds r0, r6, r2
	adds r4, r0
	strb r1, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	ldrh r0, [r6, 0x2]
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	adds r0, 0x16
	ldr r1, _080BE3CC @ =gSaveBlock2
	bl StringCopy
	adds r5, r4, 0
	adds r5, 0x8
	adds r1, r6, 0
	adds r1, 0x8
	adds r0, r5, 0
	bl StringCopy
	ldrb r0, [r6, 0x13]
	lsls r0, 29
	lsrs r0, 29
	ldrb r2, [r4, 0x13]
	movs r3, 0x8
	negs r3, r3
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x13]
	ldrb r2, [r6, 0x13]
	movs r0, 0x18
	ands r0, r2
	movs r2, 0x19
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0x13]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x14]
	ldrb r0, [r6, 0x13]
	movs r1, 0x60
	ands r1, r0
	movs r0, 0x61
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x13]
	ldrb r1, [r6, 0x13]
	lsls r1, 29
	lsrs r1, 29
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x13]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x5
	strb r0, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0x1F]
	adds r0, r5, 0
	bl StripExtCtrlCodes
_080BE3B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE3C0: .4byte 0x020281cc
_080BE3C4: .4byte gUnknown_03005D38
_080BE3C8: .4byte 0xfffffca0
_080BE3CC: .4byte gSaveBlock2
	thumb_func_end sub_80BE188

	thumb_func_start sub_80BE23C
sub_80BE23C: @ 80BE3D0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _080BE40C @ =0x020281cc
	bl sub_80BF484
	ldr r0, _080BE410 @ =0xfffffca0
	adds r5, r4, r0
	adds r0, r5, 0
	bl sub_80BF720
	ldr r1, _080BE414 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE404
	adds r0, r5, 0
	movs r1, 0x18
	bl sub_80BF55C
	strh r6, [r4, 0x14]
	movs r0, 0x6
	strb r0, [r4]
_080BE404:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE40C: .4byte 0x020281cc
_080BE410: .4byte 0xfffffca0
_080BE414: .4byte gUnknown_03005D38
	thumb_func_end sub_80BE23C

	thumb_func_start sub_80BE284
sub_80BE284: @ 80BE418
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r7, _080BE498 @ =0x020281cc
	ldr r1, _080BE49C @ =0xfffffca0
	adds r0, r7, r1
	bl sub_80BF720
	ldr r1, _080BE4A0 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE492
	movs r3, 0x3
	adds r1, r4, 0
	ands r1, r3
	lsls r1, 5
	ldrb r2, [r7, 0x13]
	movs r0, 0x61
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	ldr r1, _080BE4A4 @ =gScriptContestCategory
	ldrb r2, [r1]
	movs r1, 0x7
	ands r1, r2
	movs r2, 0x8
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	ldr r1, _080BE4A8 @ =gScriptContestRank
	ldrb r1, [r1]
	ands r3, r1
	lsls r3, 3
	movs r1, 0x19
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	strb r0, [r7, 0x13]
	ldr r6, _080BE4AC @ =gUnknown_02038694
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080BE4B0 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r7, 0x2]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	adds r2, r7, 0
	adds r2, 0x8
	movs r1, 0x2
	bl GetMonData
_080BE492:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE498: .4byte 0x020281cc
_080BE49C: .4byte 0xfffffca0
_080BE4A0: .4byte gUnknown_03005D38
_080BE4A4: .4byte gScriptContestCategory
_080BE4A8: .4byte gScriptContestRank
_080BE4AC: .4byte gUnknown_02038694
_080BE4B0: .4byte gPlayerParty
	thumb_func_end sub_80BE284

	thumb_func_start sub_80BE320
sub_80BE320: @ 80BE4B4
	push {r4-r6,lr}
	ldr r0, _080BE518 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BE51C @ =0x02027e6c
	adds r6, r0, r1
	movs r0, 0x7
	strb r0, [r6]
	movs r0, 0x1
	strb r0, [r6, 0x1]
	adds r0, r6, 0x2
	ldr r4, _080BE520 @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCopy
	adds r0, r6, 0
	adds r0, 0xC
	ldr r2, _080BE524 @ =0x00000484
	adds r1, r4, r2
	bl StringCopy
	movs r1, 0x90
	lsls r1, 3
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, 0xA]
	ldr r2, _080BE528 @ =0x00000482
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r6, 0x14]
	movs r0, 0xAF
	lsls r0, 3
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_8135D3C
	strh r0, [r6, 0x16]
	ldr r1, _080BE52C @ =0x00000555
	adds r4, r1
	ldrb r0, [r4]
	strb r0, [r6, 0x1C]
	ldrb r0, [r5]
	cmp r0, 0
	bne _080BE530
	movs r0, 0x32
	b _080BE532
	.align 2, 0
_080BE518: .4byte gUnknown_03005D38
_080BE51C: .4byte 0x02027e6c
_080BE520: .4byte gSaveBlock2
_080BE524: .4byte 0x00000484
_080BE528: .4byte 0x00000482
_080BE52C: .4byte 0x00000555
_080BE530:
	movs r0, 0x64
_080BE532:
	strb r0, [r6, 0x1A]
	ldr r0, _080BE54C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	strb r0, [r6, 0x1B]
	adds r0, r6, 0
	bl sub_80BE160
	movs r0, 0x5
	strb r0, [r6, 0x1D]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE54C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80BE320

	thumb_func_start sub_80BE3BC
sub_80BE3BC: @ 80BE550
	push {r4-r7,lr}
	ldr r0, _080BE5F4 @ =0x00005555
	bl sub_80BF77C
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BE5EC
	ldr r6, _080BE5F8 @ =0x02027e6c
	adds r0, r6, 0
	bl sub_80BF74C
	ldr r5, _080BE5FC @ =gUnknown_03005D38
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE5EC
	movs r0, 0x16
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BE5EC
	bl sub_80BF20C
	ldr r2, _080BE600 @ =gUnknown_02038724
	ldrh r0, [r2, 0x2]
	cmp r0, 0x13
	bls _080BE5EC
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r6
	movs r0, 0x16
	strb r0, [r5]
	strb r4, [r5, 0x1]
	ldr r0, _080BE604 @ =gMapHeader
	ldrb r0, [r0, 0x14]
	strb r0, [r5, 0x12]
	movs r4, 0
	adds r7, r5, 0x6
	mov r12, r2
	adds r6, r5, 0
	adds r6, 0xC
_080BE5B4:
	lsls r2, r4, 1
	adds r3, r7, r2
	lsls r1, r4, 2
	add r1, r12
	ldrh r0, [r1]
	strh r0, [r3]
	adds r2, r6, r2
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080BE5B4
	movs r0, 0x1
	bl GetPriceReduction
	strb r0, [r5, 0x2]
	adds r0, r5, 0
	adds r0, 0x13
	ldr r1, _080BE608 @ =gSaveBlock2
	bl StringCopy
	adds r0, r5, 0
	bl sub_80BE138
	movs r0, 0x5
	strb r0, [r5, 0x3]
_080BE5EC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE5F4: .4byte 0x00005555
_080BE5F8: .4byte 0x02027e6c
_080BE5FC: .4byte gUnknown_03005D38
_080BE600: .4byte gUnknown_02038724
_080BE604: .4byte gMapHeader
_080BE608: .4byte gSaveBlock2
	thumb_func_end sub_80BE3BC

	thumb_func_start sub_80BE478
sub_80BE478: @ 80BE60C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl sub_80BF478
	ldr r0, _080BE6F8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080BE6E8
	ldr r0, _080BE6FC @ =gSpecialVar_0x8004
	mov r9, r0
	ldrh r0, [r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _080BE700 @ =gPlayerParty
	adds r0, r7
	ldr r4, _080BE704 @ =gStringVar1
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _080BE708 @ =gSaveBlock2
	mov r10, r0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BE6E8
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BE6E8
	ldr r0, _080BE70C @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE710 @ =0x02027e6c
	adds r4, r0
	movs r6, 0x5
	strb r6, [r4]
	movs r5, 0x1
	strb r5, [r4, 0x1]
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r4, 0x2]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	strb r0, [r4, 0x1A]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	strb r0, [r4, 0x1B]
	ldrh r0, [r4, 0x2]
	bl sub_80BF674
	strh r0, [r4, 0x1C]
	adds r0, r4, 0
	adds r0, 0xF
	mov r1, r10
	bl StringCopy
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	adds r5, r4, 0x4
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r4, 0
	bl sub_80BE160
	strb r6, [r4, 0x1E]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0x1F]
	adds r0, r5, 0
	bl StripExtCtrlCodes
_080BE6E8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE6F8: .4byte gScriptResult
_080BE6FC: .4byte gSpecialVar_0x8004
_080BE700: .4byte gPlayerParty
_080BE704: .4byte gStringVar1
_080BE708: .4byte gSaveBlock2
_080BE70C: .4byte gUnknown_03005D38
_080BE710: .4byte 0x02027e6c
	thumb_func_end sub_80BE478

	thumb_func_start StartMassOutbreak
StartMassOutbreak: @ 80BE714
	push {r4,lr}
	ldr r0, _080BE794 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r2, _080BE798 @ =0x02027e6c
	adds r0, r2
	ldrh r3, [r0, 0xC]
	movs r4, 0xF1
	lsls r4, 2
	adds r1, r2, r4
	strh r3, [r1]
	ldrb r3, [r0, 0x10]
	adds r4, 0x2
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r3, [r0, 0x11]
	adds r4, 0x1
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r3, [r0, 0x14]
	adds r4, 0x1
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r3, [r0, 0x2]
	adds r4, 0x1
	adds r1, r2, r4
	strb r3, [r1]
	ldrh r3, [r0, 0xE]
	adds r4, 0x1
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0x4]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0x6]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0x8]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrh r3, [r0, 0xA]
	adds r4, 0x2
	adds r1, r2, r4
	strh r3, [r1]
	ldrb r3, [r0, 0x3]
	adds r4, 0x2
	adds r1, r2, r4
	strb r3, [r1]
	ldrb r1, [r0, 0x13]
	ldr r3, _080BE79C @ =0x000003d5
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, 0x2
	adds r2, r4
	movs r0, 0x2
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE794: .4byte gSpecialVar_0x8004
_080BE798: .4byte 0x02027e6c
_080BE79C: .4byte 0x000003d5
	thumb_func_end StartMassOutbreak

	thumb_func_start sub_80BE5FC
sub_80BE5FC: @ 80BE7A0
	push {r4,lr}
	ldr r0, _080BE7F0 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE7F4 @ =0x02027e6c
	adds r4, r0
	movs r0, 0x1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, _080BE7F8 @ =gSaveBlock2
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080BE7FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x5
	strb r0, [r4, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE7F0: .4byte gUnknown_03005D38
_080BE7F4: .4byte 0x02027e6c
_080BE7F8: .4byte gSaveBlock2
_080BE7FC: .4byte gPlayerParty
	thumb_func_end sub_80BE5FC

	thumb_func_start sub_80BE65C
sub_80BE65C: @ 80BE800
	push {r4,r5,lr}
	ldr r0, _080BE83C @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE840 @ =0x02027e6c
	adds r4, r0
	movs r5, 0
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, _080BE844 @ =gSaveBlock2
	bl StringCopy
	strh r5, [r4, 0x2]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x5
	strb r0, [r4, 0x18]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE83C: .4byte gUnknown_03005D38
_080BE840: .4byte 0x02027e6c
_080BE844: .4byte gSaveBlock2
	thumb_func_end sub_80BE65C

	thumb_func_start sub_80BE6A0
sub_80BE6A0: @ 80BE848
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080BE908 @ =gUnknown_03005D38
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080BE90C @ =0x02027e6c
	adds r4, r0
	movs r0, 0x3
	strb r0, [r4]
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _080BE910 @ =gPlayerParty
	adds r0, r6
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	lsrs r0, 4
	movs r1, 0xF
	ands r0, r1
	ldrb r2, [r4, 0x4]
	movs r1, 0x10
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	ldr r0, _080BE914 @ =gSpecialVar_0x8007
	ldrb r0, [r0]
	lsls r0, 4
	movs r2, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x4]
	adds r0, r4, 0x5
	ldr r1, _080BE918 @ =gSaveBlock2
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	adds r5, r4, 0
	adds r5, 0x10
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	bl sub_80BE160
	movs r0, 0x5
	strb r0, [r4, 0xD]
	adds r0, r5, 0
	bl sub_80BDEAC
	strb r0, [r4, 0xE]
	adds r0, r5, 0
	bl StripExtCtrlCodes
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE908: .4byte gUnknown_03005D38
_080BE90C: .4byte 0x02027e6c
_080BE910: .4byte gPlayerParty
_080BE914: .4byte gSpecialVar_0x8007
_080BE918: .4byte gSaveBlock2
	thumb_func_end sub_80BE6A0

	thumb_func_start nullsub_21
nullsub_21: @ 80BE91C
	bx lr
	thumb_func_end nullsub_21

	thumb_func_start sub_80BE778
sub_80BE778: @ 80BE920
	push {r4-r7,lr}
	ldr r0, _080BE9E4 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BE9DE
	movs r1, 0
	ldr r3, _080BE9E8 @ =gSaveBlock1
	ldr r2, _080BE9EC @ =0x00002738
_080BE934:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x29
	beq _080BE9DE
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x17
	bls _080BE934
	ldr r0, _080BE9F0 @ =0x00000147
	bl sub_80BF77C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080BE9DE
	ldr r7, _080BE9F4 @ =0x02027e6c
	adds r0, r7, 0
	bl sub_80BF720
	ldr r4, _080BE9F8 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BE9DE
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r5, 0x5
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r4, r1, 3
	adds r4, r1
	lsls r4, 2
	adds r4, r7
	movs r1, 0x29
	strb r1, [r4]
	movs r3, 0x1
	strb r3, [r4, 0x1]
	ldr r2, _080BE9FC @ =gUnknown_083D13F8
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0xA]
	strb r0, [r4, 0x14]
	strb r6, [r4, 0x2]
	strb r6, [r4, 0x3]
	ldrh r0, [r1]
	movs r2, 0
	strh r0, [r4, 0xC]
	strh r6, [r4, 0xE]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x6]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x8]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0xA]
	ldrb r0, [r1, 0xB]
	strb r0, [r4, 0x10]
	strb r2, [r4, 0x11]
	strb r2, [r4, 0x12]
	movs r0, 0x32
	strb r0, [r4, 0x13]
	strb r2, [r4, 0x15]
	strh r3, [r4, 0x16]
	adds r0, r4, 0
	bl sub_80BE160
	strb r5, [r4, 0x18]
_080BE9DE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE9E4: .4byte 0x00000804
_080BE9E8: .4byte gSaveBlock1
_080BE9EC: .4byte 0x00002738
_080BE9F0: .4byte 0x00000147
_080BE9F4: .4byte 0x02027e6c
_080BE9F8: .4byte gUnknown_03005D38
_080BE9FC: .4byte gUnknown_083D13F8
	thumb_func_end sub_80BE778

	thumb_func_start EndMassOutbreak
EndMassOutbreak: @ 80BEA00
	push {r4,lr}
	ldr r0, _080BEA5C @ =gSaveBlock1
	ldr r2, _080BEA60 @ =0x00002afc
	adds r1, r0, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r1]
	ldr r4, _080BEA64 @ =0x00002afe
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strh r2, [r1]
	adds r4, 0x2
	adds r1, r0, r4
	strb r3, [r1]
	adds r4, 0x1
	adds r1, r0, r4
	strb r3, [r1]
	ldr r1, _080BEA68 @ =0x00002b0e
	adds r0, r1
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEA5C: .4byte gSaveBlock1
_080BEA60: .4byte 0x00002afc
_080BEA64: .4byte 0x00002afe
_080BEA68: .4byte 0x00002b0e
	thumb_func_end EndMassOutbreak

	thumb_func_start sub_80BE8C4
sub_80BE8C4: @ 80BEA6C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80BE8EC
	adds r0, r4, 0
	bl UpdateMassOutbreakTimeLeft
	adds r0, r4, 0
	bl sub_80BEE84
	adds r0, r4, 0
	bl sub_80BEA5C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE8C4

	thumb_func_start sub_80BE8EC
sub_80BE8EC: @ 80BEA94
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _080BEAD8 @ =gSaveBlock1
	ldr r2, _080BEADC @ =0x00002afc
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BEAF4
	movs r3, 0
	adds r5, r1, 0
	ldr r7, _080BEAE0 @ =0x00002738
	adds r6, r5, r7
_080BEAAE:
	lsls r0, r3, 3
	adds r0, r3
	lsls r2, r0, 2
	adds r1, r2, r5
	ldr r7, _080BEAE0 @ =0x00002738
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, 0x29
	bne _080BEAEA
	adds r7, 0x1
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BEAEA
	adds r1, r2, r6
	ldrh r0, [r1, 0x16]
	cmp r0, r4
	bcs _080BEAE4
	movs r0, 0
	strh r0, [r1, 0x16]
	b _080BEAF4
	.align 2, 0
_080BEAD8: .4byte gSaveBlock1
_080BEADC: .4byte 0x00002afc
_080BEAE0: .4byte 0x00002738
_080BEAE4:
	subs r0, r4
	strh r0, [r1, 0x16]
	b _080BEAF4
_080BEAEA:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x17
	bls _080BEAAE
_080BEAF4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BE8EC

	thumb_func_start UpdateMassOutbreakTimeLeft
UpdateMassOutbreakTimeLeft: @ 80BEAFC
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080BEB14 @ =gSaveBlock1
	ldr r3, _080BEB18 @ =0x00002b0e
	adds r2, r0, r3
	ldrh r0, [r2]
	cmp r0, r1
	bhi _080BEB1C
	bl EndMassOutbreak
	b _080BEB20
	.align 2, 0
_080BEB14: .4byte gSaveBlock1
_080BEB18: .4byte 0x00002b0e
_080BEB1C:
	subs r0, r1
	strh r0, [r2]
_080BEB20:
	pop {r0}
	bx r0
	thumb_func_end UpdateMassOutbreakTimeLeft

	thumb_func_start sub_80BE97C
sub_80BE97C: @ 80BEB24
	push {r4,lr}
	lsls r0, 24
	cmp r0, 0
	beq _080BEB4C
	ldr r4, _080BEB48 @ =gUnknown_020387E2
	ldrh r0, [r4]
	lsrs r0, 8
	cmp r0, 0x4
	bls _080BEB3A
	bl sub_80BE9D4
_080BEB3A:
	ldrb r0, [r4]
	strh r0, [r4]
	cmp r0, 0xFF
	beq _080BEB70
	adds r0, 0x1
	b _080BEB6E
	.align 2, 0
_080BEB48: .4byte gUnknown_020387E2
_080BEB4C:
	ldr r4, _080BEB78 @ =gUnknown_020387E2
	ldrb r0, [r4]
	cmp r0, 0x4
	bls _080BEB58
	bl sub_80BE9D4
_080BEB58:
	ldrh r0, [r4]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	strh r1, [r4]
	lsrs r0, r1, 8
	cmp r0, 0xFF
	beq _080BEB70
	movs r2, 0x80
	lsls r2, 1
	adds r0, r1, r2
_080BEB6E:
	strh r0, [r4]
_080BEB70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEB78: .4byte gUnknown_020387E2
	thumb_func_end sub_80BE97C

	thumb_func_start sub_80BE9D4
sub_80BE9D4: @ 80BEB7C
	push {r4,r5,lr}
	ldr r5, _080BEBE4 @ =0x02027e6c
	adds r0, r5, 0
	bl sub_80BF74C
	ldr r4, _080BEBE8 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BEBDE
	movs r0, 0x18
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEBDE
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	movs r1, 0
	movs r0, 0x18
	strb r0, [r4]
	strb r1, [r4, 0x1]
	ldr r1, _080BEBEC @ =gUnknown_020387E2
	ldrh r0, [r1]
	strb r0, [r4, 0x2]
	ldrh r0, [r1]
	lsrs r0, 8
	strb r0, [r4, 0x3]
	ldr r0, _080BEBF0 @ =gUnknown_020387E0
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BEBF4 @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, 0x5
	strb r0, [r4, 0x6]
_080BEBDE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEBE4: .4byte 0x02027e6c
_080BEBE8: .4byte gUnknown_03005D38
_080BEBEC: .4byte gUnknown_020387E2
_080BEBF0: .4byte gUnknown_020387E0
_080BEBF4: .4byte gSaveBlock2
	thumb_func_end sub_80BE9D4

	thumb_func_start sub_80BEA50
sub_80BEA50: @ 80BEBF8
	ldr r1, _080BEC00 @ =gUnknown_020387E0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BEC00: .4byte gUnknown_020387E0
	thumb_func_end sub_80BEA50

	thumb_func_start sub_80BEA5C
sub_80BEA5C: @ 80BEC04
	push {lr}
	ldr r1, _080BEC20 @ =0x020281cc
	ldrb r0, [r1]
	cmp r0, 0x19
	bne _080BEC2C
	ldrh r0, [r1, 0x2]
	cmp r0, 0x13
	bhi _080BEC28
	ldr r2, _080BEC24 @ =0xfffffca0
	adds r0, r1, r2
	movs r1, 0x18
	bl sub_80BF55C
	b _080BEC2C
	.align 2, 0
_080BEC20: .4byte 0x020281cc
_080BEC24: .4byte 0xfffffca0
_080BEC28:
	bl sub_80BEA88
_080BEC2C:
	pop {r0}
	bx r0
	thumb_func_end sub_80BEA5C

	thumb_func_start sub_80BEA88
sub_80BEA88: @ 80BEC30
	push {r4-r7,lr}
	ldr r5, _080BECB4 @ =0x020281cc
	ldr r0, _080BECB8 @ =0x0000ffff
	bl sub_80BF77C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080BECAC
	ldr r0, _080BECBC @ =0xfffffca0
	adds r7, r5, r0
	adds r0, r7, 0
	bl sub_80BF74C
	ldr r4, _080BECC0 @ =gUnknown_03005D38
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BECAC
	movs r0, 0x19
	bl sub_80BF1B4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BECAC
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r7
	movs r0, 0x19
	strb r0, [r4]
	strb r6, [r4, 0x1]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	movs r0, 0x5
	bl sub_8053108
	ldrh r1, [r5, 0x6]
	subs r0, r1
	strh r0, [r4, 0x6]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xA]
	adds r0, r4, 0
	adds r0, 0x13
	ldr r1, _080BECC4 @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80BE138
	movs r0, 0x5
	strb r0, [r4, 0xB]
_080BECAC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BECB4: .4byte 0x020281cc
_080BECB8: .4byte 0x0000ffff
_080BECBC: .4byte 0xfffffca0
_080BECC0: .4byte gUnknown_03005D38
_080BECC4: .4byte gSaveBlock2
	thumb_func_end sub_80BEA88

	thumb_func_start sub_80BEB20
sub_80BEB20: @ 80BECC8
	push {r4-r6,lr}
	ldr r0, _080BED54 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080BED4E
	ldr r6, _080BED58 @ =0x020281f0
	adds r0, r6, 0
	bl sub_80BEBC8
	ldr r5, _080BED5C @ =gUnknown_03005D38
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080BED4E
	ldr r0, _080BED60 @ =0x0000028f
	bl sub_80BF77C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BED4E
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BEE48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BED4E
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	ldr r1, _080BED64 @ =0xffffd544
	adds r2, r6, r1
	adds r0, r6, r0
	strb r4, [r0]
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BED68 @ =0x00002abe
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0]
	movs r0, 0
	ldrsb r0, [r5, r0]
	lsls r0, 2
	adds r0, r2
	ldr r1, _080BED6C @ =0x00002abd
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_080BED4E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BED54: .4byte 0x00000804
_080BED58: .4byte 0x020281f0
_080BED5C: .4byte gUnknown_03005D38
_080BED60: .4byte 0x0000028f
_080BED64: .4byte 0xffffd544
_080BED68: .4byte 0x00002abe
_080BED6C: .4byte 0x00002abd
	thumb_func_end sub_80BEB20

	thumb_func_start sub_80BEBC8
sub_80BEBC8: @ 80BED70
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BED76:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BED88
	adds r0, r1, 0
	b _080BED98
_080BED88:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0xF
	ble _080BED76
	movs r0, 0x1
	negs r0, r0
_080BED98:
	pop {r1}
	bx r1
	thumb_func_end sub_80BEBC8

	thumb_func_start sub_80BEBF4
sub_80BEBF4: @ 80BED9C
	push {r4,lr}
	movs r4, 0
_080BEDA0:
	adds r0, r4, 0
	bl sub_80BEC10
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080BEDA0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BEBF4

	thumb_func_start sub_80BEC10
sub_80BEC10: @ 80BEDB8
	lsls r0, 24
	ldr r1, _080BEDD8 @ =gSaveBlock1
	lsrs r0, 22
	adds r0, r1
	ldr r2, _080BEDDC @ =0x00002abc
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _080BEDE0 @ =0x00002abd
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _080BEDE4 @ =0x00002abe
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_080BEDD8: .4byte gSaveBlock1
_080BEDDC: .4byte 0x00002abc
_080BEDE0: .4byte 0x00002abd
_080BEDE4: .4byte 0x00002abe
	thumb_func_end sub_80BEC10

	thumb_func_start sub_80BEC40
sub_80BEC40: @ 80BEDE8
	push {r4-r7,lr}
	movs r1, 0
	ldr r6, _080BEE28 @ =gSaveBlock1
_080BEDEE:
	ldr r3, _080BEE28 @ =gSaveBlock1
	lsls r2, r1, 2
	adds r0, r2, r3
	ldr r4, _080BEE2C @ =0x00002abc
	adds r0, r4
	ldrb r0, [r0]
	adds r5, r1, 0x1
	cmp r0, 0
	bne _080BEE3A
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bhi _080BEE3A
	adds r4, r3, r4
	adds r3, r2, r4
_080BEE0C:
	lsls r2, r1, 2
	adds r0, r2, r6
	ldr r7, _080BEE2C @ =0x00002abc
	adds r0, r7
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BEE30
	adds r0, r2, r4
	ldr r0, [r0]
	str r0, [r3]
	adds r0, r1, 0
	bl sub_80BEC10
	b _080BEE3A
	.align 2, 0
_080BEE28: .4byte gSaveBlock1
_080BEE2C: .4byte 0x00002abc
_080BEE30:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080BEE0C
_080BEE3A:
	lsls r0, r5, 24
	lsrs r1, r0, 24
	cmp r1, 0xE
	bls _080BEDEE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BEC40

	thumb_func_start sub_80BECA0
sub_80BECA0: @ 80BEE48
	push {r4,lr}
	movs r2, 0
	ldr r3, _080BEE74 @ =gSaveBlock1
_080BEE4E:
	lsls r0, r2, 2
	adds r1, r0, r3
	ldr r4, _080BEE78 @ =0x00002abc
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BEE7C
	adds r4, 0x1
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080BEE7C
	adds r4, 0x1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, 0x2
	bhi _080BEE7C
	adds r0, r2, 0
	b _080BEE88
	.align 2, 0
_080BEE74: .4byte gSaveBlock1
_080BEE78: .4byte 0x00002abc
_080BEE7C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080BEE4E
	movs r0, 0xFF
_080BEE88:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BECA0

	thumb_func_start sub_80BECE8
sub_80BECE8: @ 80BEE90
	push {r4,lr}
	bl sub_80BECA0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	bne _080BEEA8
	ldr r1, _080BEEA4 @ =gScriptResult
	movs r0, 0
	b _080BEF2E
	.align 2, 0
_080BEEA4: .4byte gScriptResult
_080BEEA8:
	ldr r0, _080BEED4 @ =gSaveBlock1
	lsls r1, 2
	adds r4, r1, r0
	ldr r0, _080BEED8 @ =0x00002abe
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _080BEF04
	ldr r2, _080BEEDC @ =0x00002abd
	adds r1, r4, r2
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _080BEEE0 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x13
	bgt _080BEEE8
	ldr r1, _080BEEE4 @ =gUnknown_083D1444
	subs r2, 0x1
	b _080BEEEC
	.align 2, 0
_080BEED4: .4byte gSaveBlock1
_080BEED8: .4byte 0x00002abe
_080BEEDC: .4byte 0x00002abd
_080BEEE0: .4byte gLocalTime
_080BEEE4: .4byte gUnknown_083D1444
_080BEEE8:
	ldr r1, _080BEEFC @ =gUnknown_083D1454
	ldr r2, _080BEF00 @ =0x00002abc
_080BEEEC:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	b _080BEF2A
	.align 2, 0
_080BEEFC: .4byte gUnknown_083D1454
_080BEF00: .4byte 0x00002abc
_080BEF04:
	ldrh r1, [r1]
	ldr r0, _080BEF38 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _080BEF3C @ =0x00002abd
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080BEF40 @ =gUnknown_083D1434
	ldr r2, _080BEF44 @ =0x00002abc
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
_080BEF2A:
	ldr r1, _080BEF48 @ =gScriptResult
	movs r0, 0x1
_080BEF2E:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEF38: .4byte gStringVar1
_080BEF3C: .4byte 0x00002abd
_080BEF40: .4byte gUnknown_083D1434
_080BEF44: .4byte 0x00002abc
_080BEF48: .4byte gScriptResult
	thumb_func_end sub_80BECE8

	thumb_func_start GetPriceReduction
GetPriceReduction: @ 80BEF4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080BEF5C
	b _080BEF9E
_080BEF58:
	movs r0, 0x1
	b _080BEFA0
_080BEF5C:
	movs r2, 0
	ldr r4, _080BEF88 @ =gSaveBlock1
_080BEF60:
	lsls r0, r2, 2
	adds r1, r0, r4
	ldr r5, _080BEF8C @ =0x00002abc
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r3
	bne _080BEF94
	ldr r2, _080BEF90 @ =0x00002abd
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080BEF9E
	adds r0, r3, 0
	bl IsPriceDiscounted
	lsls r0, 24
	cmp r0, 0
	bne _080BEF58
	b _080BEF9E
	.align 2, 0
_080BEF88: .4byte gSaveBlock1
_080BEF8C: .4byte 0x00002abc
_080BEF90: .4byte 0x00002abd
_080BEF94:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080BEF60
_080BEF9E:
	movs r0, 0
_080BEFA0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetPriceReduction

	thumb_func_start IsPriceDiscounted
IsPriceDiscounted: @ 80BEFA8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BEFBA
	cmp r0, 0x3
	beq _080BEFD8
_080BEFB6:
	movs r0, 0x1
	b _080BEFE4
_080BEFBA:
	ldr r0, _080BEFD0 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bne _080BEFE2
	ldr r0, _080BEFD4 @ =gScriptLastTalked
	ldrh r0, [r0]
	cmp r0, 0x1A
	beq _080BEFB6
	b _080BEFE2
	.align 2, 0
_080BEFD0: .4byte gSaveBlock1
_080BEFD4: .4byte gScriptLastTalked
_080BEFD8:
	ldr r0, _080BEFE8 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	ldr r0, _080BEFEC @ =0x0000160d
	cmp r1, r0
	beq _080BEFB6
_080BEFE2:
	movs r0, 0
_080BEFE4:
	pop {r1}
	bx r1
	.align 2, 0
_080BEFE8: .4byte gSaveBlock1
_080BEFEC: .4byte 0x0000160d
	thumb_func_end IsPriceDiscounted

	thumb_func_start sub_80BEE48
sub_80BEE48: @ 80BEFF0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080BEFFE
_080BEFFA:
	movs r0, 0x1
	b _080BF01C
_080BEFFE:
	movs r1, 0
	ldr r4, _080BF024 @ =gSaveBlock1
	ldr r3, _080BF028 @ =0x00002abc
_080BF004:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	beq _080BEFFA
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080BF004
	movs r0, 0
_080BF01C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BF024: .4byte gSaveBlock1
_080BF028: .4byte 0x00002abc
	thumb_func_end sub_80BEE48

	thumb_func_start sub_80BEE84
sub_80BEE84: @ 80BF02C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
	ldr r0, _080BF060 @ =gSaveBlock1
	mov r8, r0
_080BF03C:
	lsls r0, r5, 2
	mov r1, r8
	adds r2, r0, r1
	ldr r3, _080BF064 @ =0x00002abc
	adds r1, r2, r3
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0
	beq _080BF094
	ldr r1, _080BF068 @ =0x00002abe
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r7
	bcs _080BF06C
	adds r0, r5, 0
	bl sub_80BEC10
	b _080BF094
	.align 2, 0
_080BF060: .4byte gSaveBlock1
_080BF064: .4byte 0x00002abc
_080BF068: .4byte 0x00002abe
_080BF06C:
	ldr r3, _080BF0AC @ =0x00002abd
	adds r4, r2, r3
	ldrb r0, [r4]
	cmp r0, 0
	bne _080BF086
	ldr r0, _080BF0B0 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BF086
	strb r0, [r4]
_080BF086:
	mov r0, r8
	adds r1, r6, r0
	ldr r3, _080BF0B4 @ =0x00002abe
	adds r1, r3
	ldrh r0, [r1]
	subs r0, r7
	strh r0, [r1]
_080BF094:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080BF03C
	bl sub_80BEC40
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF0AC: .4byte 0x00002abd
_080BF0B0: .4byte 0x00000804
_080BF0B4: .4byte 0x00002abe
	thumb_func_end sub_80BEE84

	thumb_func_start sub_80BEF10
sub_80BEF10: @ 80BF0B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _080BF0F8
	cmp r1, 0x1
	bgt _080BF0D2
	cmp r1, 0
	beq _080BF0DC
	b _080BF140
_080BF0D2:
	cmp r2, 0x2
	beq _080BF114
	cmp r2, 0x3
	beq _080BF130
	b _080BF140
_080BF0DC:
	ldr r1, _080BF0F0 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF0F4 @ =gUnknown_083CE048
	ldr r1, [r1, 0x14]
	bl StringCopy
	b _080BF140
	.align 2, 0
_080BF0F0: .4byte gUnknown_083D1464
_080BF0F4: .4byte gUnknown_083CE048
_080BF0F8:
	ldr r1, _080BF10C @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF110 @ =gUnknown_083CE048
	ldr r1, [r1, 0x18]
	bl StringCopy
	b _080BF140
	.align 2, 0
_080BF10C: .4byte gUnknown_083D1464
_080BF110: .4byte gUnknown_083CE048
_080BF114:
	ldr r1, _080BF128 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF12C @ =gUnknown_083CE048
	ldr r1, [r1, 0x1C]
	bl StringCopy
	b _080BF140
	.align 2, 0
_080BF128: .4byte gUnknown_083D1464
_080BF12C: .4byte gUnknown_083CE048
_080BF130:
	ldr r1, _080BF144 @ =gUnknown_083D1464
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF148 @ =gUnknown_083CE048
	ldr r1, [r1, 0x20]
	bl StringCopy
_080BF140:
	pop {r0}
	bx r0
	.align 2, 0
_080BF144: .4byte gUnknown_083D1464
_080BF148: .4byte gUnknown_083CE048
	thumb_func_end sub_80BEF10

	thumb_func_start CopyContestCategoryToStringVar
CopyContestCategoryToStringVar: @ 80BF14C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x4
	bhi _080BF1FC
	lsls r0, 2
	ldr r1, _080BF164 @ =_080BF168
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BF164: .4byte _080BF168
	.align 2, 0
_080BF168:
	.4byte _080BF17C
	.4byte _080BF198
	.4byte _080BF1B4
	.4byte _080BF1D0
	.4byte _080BF1EC
_080BF17C:
	ldr r1, _080BF190 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF194 @ =gUnknown_083CE048
	ldr r1, [r1]
	bl StringCopy
	b _080BF1FC
	.align 2, 0
_080BF190: .4byte gUnknown_083D1464
_080BF194: .4byte gUnknown_083CE048
_080BF198:
	ldr r1, _080BF1AC @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF1B0 @ =gUnknown_083CE048
	ldr r1, [r1, 0x4]
	bl StringCopy
	b _080BF1FC
	.align 2, 0
_080BF1AC: .4byte gUnknown_083D1464
_080BF1B0: .4byte gUnknown_083CE048
_080BF1B4:
	ldr r1, _080BF1C8 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF1CC @ =gUnknown_083CE048
	ldr r1, [r1, 0x8]
	bl StringCopy
	b _080BF1FC
	.align 2, 0
_080BF1C8: .4byte gUnknown_083D1464
_080BF1CC: .4byte gUnknown_083CE048
_080BF1D0:
	ldr r1, _080BF1E4 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF1E8 @ =gUnknown_083CE048
	ldr r1, [r1, 0xC]
	bl StringCopy
	b _080BF1FC
	.align 2, 0
_080BF1E4: .4byte gUnknown_083D1464
_080BF1E8: .4byte gUnknown_083CE048
_080BF1EC:
	ldr r1, _080BF200 @ =gUnknown_083D1464
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080BF204 @ =gUnknown_083CE048
	ldr r1, [r1, 0x10]
	bl StringCopy
_080BF1FC:
	pop {r0}
	bx r0
	.align 2, 0
_080BF200: .4byte gUnknown_083D1464
_080BF204: .4byte gUnknown_083CE048
	thumb_func_end CopyContestCategoryToStringVar

	thumb_func_start SetContestCategoryStringVarForInterview
SetContestCategoryStringVarForInterview: @ 80BF208
	push {lr}
	ldr r0, _080BF228 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF22C @ =0x02027e6c
	adds r0, r1
	ldrb r1, [r0, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	pop {r0}
	bx r0
	.align 2, 0
_080BF228: .4byte gSpecialVar_0x8004
_080BF22C: .4byte 0x02027e6c
	thumb_func_end SetContestCategoryStringVarForInterview

	thumb_func_start sub_80BF088
sub_80BF088: @ 80BF230
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	ldr r0, _080BF25C @ =gUnknown_083D1464
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsls r3, 24
	lsrs r3, 24
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF25C: .4byte gUnknown_083D1464
	thumb_func_end sub_80BF088

	thumb_func_start sub_80BF0B8
sub_80BF0B8: @ 80BF260
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xA
	bl __divsi3
	cmp r0, 0
	beq _080BF2EC
	adds r0, r4, 0
	movs r1, 0x64
	bl __divsi3
	cmp r0, 0
	bne _080BF27E
	movs r0, 0x2
	b _080BF2F6
_080BF27E:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF290
	movs r0, 0x3
	b _080BF2F6
_080BF290:
	ldr r1, _080BF2A0 @ =0x00002710
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF2A4
	movs r0, 0x4
	b _080BF2F6
	.align 2, 0
_080BF2A0: .4byte 0x00002710
_080BF2A4:
	ldr r1, _080BF2B4 @ =0x000186a0
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF2B8
	movs r0, 0x5
	b _080BF2F6
	.align 2, 0
_080BF2B4: .4byte 0x000186a0
_080BF2B8:
	ldr r1, _080BF2C8 @ =0x000f4240
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF2CC
	movs r0, 0x6
	b _080BF2F6
	.align 2, 0
_080BF2C8: .4byte 0x000f4240
_080BF2CC:
	ldr r1, _080BF2DC @ =0x00989680
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	bne _080BF2E0
	movs r0, 0x7
	b _080BF2F6
	.align 2, 0
_080BF2DC: .4byte 0x00989680
_080BF2E0:
	ldr r1, _080BF2F0 @ =0x05f5e100
	adds r0, r4, 0
	bl __divsi3
	cmp r0, 0
	beq _080BF2F4
_080BF2EC:
	movs r0, 0x1
	b _080BF2F6
	.align 2, 0
_080BF2F0: .4byte 0x05f5e100
_080BF2F4:
	movs r0, 0x8
_080BF2F6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF0B8

	thumb_func_start sub_80BF154
sub_80BF154: @ 80BF2FC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	movs r5, 0
_080BF30E:
	lsls r4, r5, 1
	adds r0, r6, 0x6
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, 0
	beq _080BF32E
	bl ItemId_GetPrice
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	adds r1, 0xC
	adds r1, r4
	ldrh r1, [r1]
	muls r0, r1
	adds r7, r0
_080BF32E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080BF30E
	ldrb r0, [r6, 0x2]
	cmp r0, 0x1
	bne _080BF348
	asrs r1, r7, 1
	mov r0, r8
	bl sub_80BF088
	b _080BF350
_080BF348:
	mov r0, r8
	adds r1, r7, 0
	bl sub_80BF088
_080BF350:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF154

	thumb_func_start sub_80BF1B4
sub_80BF1B4: @ 80BF35C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _080BF39C @ =0x02027e6c
	bl sub_80BFB94
	adds r5, r0, 0
	movs r4, 0x5
_080BF36C:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _080BF3A0
	movs r3, 0xFF
	adds r0, r5, 0
	ands r0, r3
	adds r2, r1, 0
	adds r2, 0x22
	ldrb r2, [r2]
	cmp r0, r2
	bne _080BF3A0
	lsrs r0, r5, 8
	ands r0, r3
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BF3A0
	movs r0, 0x1
	b _080BF3AC
	.align 2, 0
_080BF39C: .4byte 0x02027e6c
_080BF3A0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x17
	bls _080BF36C
	movs r0, 0
_080BF3AC:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF1B4

	thumb_func_start sub_80BF20C
sub_80BF20C: @ 80BF3B4
	push {r4-r7,lr}
	movs r2, 0
_080BF3B8:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	adds r7, r1, 0
	cmp r5, 0x2
	bhi _080BF3F0
	ldr r6, _080BF400 @ =gUnknown_02038724
	lsls r0, r2, 2
	adds r4, r0, r6
_080BF3CA:
	lsls r0, r5, 2
	adds r3, r0, r6
	ldrh r0, [r4, 0x2]
	ldrh r1, [r3, 0x2]
	cmp r0, r1
	bcs _080BF3E6
	ldrh r1, [r4]
	adds r2, r0, 0
	ldrh r0, [r3]
	strh r0, [r4]
	ldrh r0, [r3, 0x2]
	strh r0, [r4, 0x2]
	strh r1, [r3]
	strh r2, [r3, 0x2]
_080BF3E6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _080BF3CA
_080BF3F0:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	cmp r2, 0x1
	bls _080BF3B8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF400: .4byte gUnknown_02038724
	thumb_func_end sub_80BF20C

	thumb_func_start sub_80BF25C
sub_80BF25C: @ 80BF404
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0
	ldr r3, _080BF434 @ =gSaveBlock1
	ldr r0, _080BF438 @ =0x00002738
	adds r4, r3, r0
_080BF412:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	ldr r6, _080BF438 @ =0x00002738
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _080BF456
	ldr r3, _080BF43C @ =0x00002739
	adds r0, r2, r3
	ldrb r2, [r0]
	cmp r2, 0x1
	bne _080BF444
	ldr r0, _080BF440 @ =gScriptResult
	strh r2, [r0]
	b _080BF464
	.align 2, 0
_080BF434: .4byte gSaveBlock1
_080BF438: .4byte 0x00002738
_080BF43C: .4byte 0x00002739
_080BF440: .4byte gScriptResult
_080BF444:
	adds r0, r4, 0
	bl sub_80BF55C
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80BF6D8
	b _080BF464
_080BF456:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BF412
	bl sub_80BF6D8
_080BF464:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF25C

	thumb_func_start sub_80BF2C4
sub_80BF2C4: @ 80BF46C
	push {lr}
	ldr r1, _080BF488 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080BF48C @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080BF4D8
	lsls r0, 2
	ldr r1, _080BF490 @ =_080BF494
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BF488: .4byte gScriptResult
_080BF48C: .4byte gSpecialVar_0x8005
_080BF490: .4byte _080BF494
	.align 2, 0
_080BF494:
	.4byte _080BF4B0
	.4byte _080BF4B6
	.4byte _080BF4BC
	.4byte _080BF4C2
	.4byte _080BF4C8
	.4byte _080BF4CE
	.4byte _080BF4D4
_080BF4B0:
	bl sub_80BF334
	b _080BF4D8
_080BF4B6:
	bl sub_80BF3A4
	b _080BF4D8
_080BF4BC:
	bl sub_80BF3DC
	b _080BF4D8
_080BF4C2:
	bl sub_80BF46C
	b _080BF4D8
_080BF4C8:
	bl sub_80BF478
	b _080BF4D8
_080BF4CE:
	bl sub_80BF484
	b _080BF4D8
_080BF4D4:
	bl sub_80BF4BC
_080BF4D8:
	pop {r0}
	bx r0
	thumb_func_end sub_80BF2C4

	thumb_func_start sub_80BF334
sub_80BF334: @ 80BF4DC
	push {r4,lr}
	movs r0, 0x1
	bl sub_80BF25C
	ldr r0, _080BF534 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF52C
	ldr r4, _080BF538 @ =gStringVar1
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _080BF53C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080BF540 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _080BF544 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF548 @ =0x02027e6c
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x6
	bl sub_80EB6FC
_080BF52C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF534: .4byte gScriptResult
_080BF538: .4byte gStringVar1
_080BF53C: .4byte gPlayerParty
_080BF540: .4byte gSpeciesNames
_080BF544: .4byte gUnknown_03005D38
_080BF548: .4byte 0x02027e6c
	thumb_func_end sub_80BF334

	thumb_func_start sub_80BF3A4
sub_80BF3A4: @ 80BF54C
	push {lr}
	movs r0, 0x2
	bl sub_80BF25C
	ldr r0, _080BF578 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF574
	ldr r0, _080BF57C @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF580 @ =0x02027e6c
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x6
	bl sub_80EB6FC
_080BF574:
	pop {r0}
	bx r0
	.align 2, 0
_080BF578: .4byte gScriptResult
_080BF57C: .4byte gUnknown_03005D38
_080BF580: .4byte 0x02027e6c
	thumb_func_end sub_80BF3A4

	thumb_func_start sub_80BF3DC
sub_80BF3DC: @ 80BF584
	push {r4-r6,lr}
	movs r0, 0x3
	bl sub_80BF25C
	ldr r0, _080BF5F8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF5F0
	ldr r6, _080BF5FC @ =gStringVar1
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080BF600 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080BF604 @ =gSpeciesNames
	adds r1, r0
	adds r0, r6, 0
	bl StringCopy
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	adds r0, r4
	ldr r4, _080BF608 @ =gStringVar2
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	ldr r0, _080BF60C @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF610 @ =0x02027e6c
	adds r0, r1
	adds r0, 0x1C
	movs r1, 0x2
	bl sub_80EB6FC
_080BF5F0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF5F8: .4byte gScriptResult
_080BF5FC: .4byte gStringVar1
_080BF600: .4byte gPlayerParty
_080BF604: .4byte gSpeciesNames
_080BF608: .4byte gStringVar2
_080BF60C: .4byte gUnknown_03005D38
_080BF610: .4byte 0x02027e6c
	thumb_func_end sub_80BF3DC

	thumb_func_start sub_80BF46C
sub_80BF46C: @ 80BF614
	ldr r1, _080BF61C @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	bx lr
	.align 2, 0
_080BF61C: .4byte gScriptResult
	thumb_func_end sub_80BF46C

	thumb_func_start sub_80BF478
sub_80BF478: @ 80BF620
	push {lr}
	movs r0, 0x5
	bl sub_80BF25C
	pop {r0}
	bx r0
	thumb_func_end sub_80BF478

	thumb_func_start sub_80BF484
sub_80BF484: @ 80BF62C
	push {lr}
	movs r0, 0x6
	bl sub_80BF25C
	ldr r0, _080BF658 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF654
	ldr r0, _080BF65C @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF660 @ =0x02027e6c
	adds r0, r1
	adds r0, 0x4
	movs r1, 0x2
	bl sub_80EB6FC
_080BF654:
	pop {r0}
	bx r0
	.align 2, 0
_080BF658: .4byte gScriptResult
_080BF65C: .4byte gUnknown_03005D38
_080BF660: .4byte 0x02027e6c
	thumb_func_end sub_80BF484

	thumb_func_start sub_80BF4BC
sub_80BF4BC: @ 80BF664
	push {lr}
	movs r0, 0x7
	bl sub_80BF25C
	ldr r0, _080BF690 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _080BF68C
	ldr r0, _080BF694 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BF698 @ =0x02027e6c
	adds r0, r1
	adds r0, 0x18
	movs r1, 0x1
	bl sub_80EB6FC
_080BF68C:
	pop {r0}
	bx r0
	.align 2, 0
_080BF690: .4byte gScriptResult
_080BF694: .4byte gUnknown_03005D38
_080BF698: .4byte 0x02027e6c
	thumb_func_end sub_80BF4BC

	thumb_func_start sub_80BF4F4
sub_80BF4F4: @ 80BF69C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080BF6F0 @ =gPlayerParty
	adds r5, r1, r0
	ldr r6, _080BF6F4 @ =gStringVar1
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r6, 0
	bl GetMonData
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x3
	mov r2, sp
	bl GetMonData
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080BF6FC
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r0, r1
	ldr r1, _080BF6F8 @ =gSpeciesNames
	adds r0, r1
	adds r1, r6, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080BF6FC
	movs r0, 0
	b _080BF6FE
	.align 2, 0
_080BF6F0: .4byte gPlayerParty
_080BF6F4: .4byte gStringVar1
_080BF6F8: .4byte gSpeciesNames
_080BF6FC:
	movs r0, 0x1
_080BF6FE:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF4F4

	thumb_func_start sub_80BF544
sub_80BF544: @ 80BF708
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BF4F4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80BF544

	thumb_func_start sub_80BF55C
sub_80BF55C: @ 80BF720
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 3
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	movs r0, 0
	strb r0, [r2]
	strb r0, [r2, 0x1]
	movs r1, 0
	adds r2, 0x2
	movs r3, 0
_080BF73A:
	adds r0, r2, r1
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x21
	bls _080BF73A
	pop {r0}
	bx r0
	thumb_func_end sub_80BF55C

	thumb_func_start sub_80BF588
sub_80BF588: @ 80BF74C
	push {r4-r7,lr}
	adds r4, r0, 0
	movs r5, 0
_080BF752:
	lsls r0, r5, 3
	adds r0, r5
	lsls r1, r0, 2
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF796
	adds r0, r5, 0x1
	b _080BF78E
_080BF764:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BF78C
	adds r1, r4
	adds r0, r3, 0
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80BF55C
	b _080BF796
_080BF78C:
	adds r0, r2, 0x1
_080BF78E:
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _080BF764
_080BF796:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080BF752
	movs r5, 0x5
_080BF7A2:
	lsls r0, r5, 3
	adds r0, r5
	lsls r1, r0, 2
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r5, 0x1
	cmp r0, 0
	bne _080BF7EE
	lsls r0, r5, 24
	b _080BF7E8
_080BF7B6:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r4
	ldrb r0, [r3]
	cmp r0, 0
	beq _080BF7E4
	adds r1, r4
	adds r0, r3, 0
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldr r0, _080BF7E0 @ =0x02027e6c
	adds r1, r2, 0
	bl sub_80BF55C
	b _080BF7EE
	.align 2, 0
_080BF7E0: .4byte 0x02027e6c
_080BF7E4:
	adds r0, r2, 0x1
	lsls r0, 24
_080BF7E8:
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080BF7B6
_080BF7EE:
	lsls r0, r5, 24
	lsrs r5, r0, 24
	cmp r5, 0x17
	bls _080BF7A2
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BF588

	thumb_func_start sub_80BF638
sub_80BF638: @ 80BF7FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	lsrs r0, 16
	bl sub_80BF674
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080BF830 @ =gUnknown_083D1464
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0xB
	muls r1, r5
	ldr r2, _080BF834 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BF830: .4byte gUnknown_083D1464
_080BF834: .4byte gSpeciesNames
	thumb_func_end sub_80BF638

	thumb_func_start sub_80BF674
sub_80BF674: @ 80BF838
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080BF858 @ =0x0000019b
	bl __umodsi3
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	b _080BF876
	.align 2, 0
_080BF858: .4byte 0x0000019b
_080BF85C:
	cmp r4, 0x1
	bne _080BF868
	ldr r4, _080BF864 @ =0x0000019b
	b _080BF86E
	.align 2, 0
_080BF864: .4byte 0x0000019b
_080BF868:
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080BF86E:
	cmp r4, r6
	bne _080BF876
	adds r4, r5, 0
	b _080BF892
_080BF876:
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _080BF85C
	cmp r4, r5
	beq _080BF85C
_080BF892:
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF674

	thumb_func_start sub_80BF6D8
sub_80BF6D8: @ 80BF89C
	push {lr}
	ldr r0, _080BF8C4 @ =0x02027e6c
	bl sub_80BF720
	ldr r1, _080BF8C8 @ =gUnknown_03005D38
	strb r0, [r1]
	ldr r2, _080BF8CC @ =gSpecialVar_0x8006
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	strh r1, [r2]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080BF8D4
	ldr r1, _080BF8D0 @ =gScriptResult
	movs r0, 0x1
	b _080BF8D8
	.align 2, 0
_080BF8C4: .4byte 0x02027e6c
_080BF8C8: .4byte gUnknown_03005D38
_080BF8CC: .4byte gSpecialVar_0x8006
_080BF8D0: .4byte gScriptResult
_080BF8D4:
	ldr r1, _080BF8E0 @ =gScriptResult
	movs r0, 0
_080BF8D8:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BF8E0: .4byte gScriptResult
	thumb_func_end sub_80BF6D8

	thumb_func_start sub_80BF720
sub_80BF720: @ 80BF8E4
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BF8EA:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF8FE
	lsls r0, r1, 24
	asrs r0, 24
	b _080BF90C
_080BF8FE:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BF8EA
	movs r0, 0x1
	negs r0, r0
_080BF90C:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF720

	thumb_func_start sub_80BF74C
sub_80BF74C: @ 80BF910
	push {lr}
	adds r2, r0, 0
	movs r1, 0x5
_080BF916:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BF92C
	adds r0, r1, 0
	b _080BF93C
_080BF92C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x17
	ble _080BF916
	movs r0, 0x1
	negs r0, r0
_080BF93C:
	pop {r1}
	bx r1
	thumb_func_end sub_80BF74C

	thumb_func_start sub_80BF77C
sub_80BF77C: @ 80BF940
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bls _080BF958
	movs r0, 0x1
	b _080BF95A
_080BF958:
	movs r0, 0
_080BF95A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF77C

	thumb_func_start sub_80BF79C
sub_80BF79C: @ 80BF960
	push {r4-r6,lr}
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r4, 0x4
	ldr r6, _080BF97C @ =0x0000ffff
	b _080BF986
	.align 2, 0
_080BF97C: .4byte 0x0000ffff
_080BF980:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080BF986:
	cmp r2, 0x6
	bne _080BF98C
	movs r2, 0
_080BF98C:
	lsls r1, r2, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	adds r3, r4, 0x4
	cmp r0, r6
	beq _080BF980
	ldr r0, _080BF9A8 @ =gStringVar3
	adds r1, r3, r1
	ldrh r1, [r1]
	bl ConvertEasyChatWordsToString
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF9A8: .4byte gStringVar3
	thumb_func_end sub_80BF79C

	thumb_func_start sub_80BF7E8
sub_80BF7E8: @ 80BF9AC
	push {lr}
	adds r2, r0, 0
	movs r3, 0
	movs r1, 0
	ldrb r0, [r2, 0x4]
	cmp r0, 0xFF
	beq _080BF9D8
	adds r2, 0x4
_080BF9BC:
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, r3, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xA
	bhi _080BF9D8
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BF9BC
_080BF9D8:
	movs r0, 0x7
	ands r3, r0
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80BF7E8

	thumb_func_start sub_80BF820
sub_80BF820: @ 80BF9E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0
	movs r7, 0xFF
_080BFA08:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	orrs r1, r7
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080BFA08
	cmp r3, 0
	bne _080BFA6A
	ldr r4, [sp, 0x20]
	adds r4, 0xF
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r6, 0
	bne _080BFA38
	mov r0, sp
	adds r1, r4, r5
	b _080BFAE4
_080BFA38:
	cmp r6, 0x1
	bne _080BFA44
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4, r1
	b _080BFAE4
_080BFA44:
	cmp r6, 0x2
	bne _080BFA56
	mov r1, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	adds r0, r4, r0
	b _080BFB14
_080BFA56:
	mov r1, sp
	subs r0, r2, 0x2
	subs r0, r5
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, 0x1
	subs r0, r5
	adds r0, r4, r0
	b _080BFB14
_080BFA6A:
	cmp r3, 0x1
	bne _080BFAB8
	ldr r4, [sp, 0x20]
	adds r4, 0x4
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r6, 0
	bne _080BFA86
	mov r0, sp
	adds r1, r4, r5
	b _080BFAE4
_080BFA86:
	cmp r6, 0x1
	bne _080BFA92
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4, r1
	b _080BFAE4
_080BFA92:
	cmp r6, 0x2
	bne _080BFAA4
	mov r1, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	adds r0, r4, r0
	b _080BFB14
_080BFAA4:
	mov r1, sp
	subs r0, r2, 0x2
	subs r0, r5
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, 0x1
	subs r0, r5
	adds r0, r4, r0
	b _080BFB14
_080BFAB8:
	movs r0, 0xB
	muls r4, r0
	ldr r7, _080BFAD4 @ =gSpeciesNames
	adds r0, r4, r7
	bl StringLength
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r6, 0
	bne _080BFAD8
	mov r0, sp
	adds r1, r5, r4
	b _080BFAE2
	.align 2, 0
_080BFAD4: .4byte gSpeciesNames
_080BFAD8:
	cmp r6, 0x1
	bne _080BFAEA
	mov r0, sp
	subs r1, r2, r5
	adds r1, r4
_080BFAE2:
	adds r1, r7
_080BFAE4:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080BFB18
_080BFAEA:
	cmp r6, 0x2
	bne _080BFAFE
	mov r1, sp
	adds r0, r5, r4
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	adds r0, r5, r0
	b _080BFB12
_080BFAFE:
	mov r1, sp
	subs r0, r2, 0x2
	subs r0, r5
	adds r0, r4
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	subs r0, r2, 0x1
	subs r0, r5
	adds r0, r4
_080BFB12:
	adds r0, r7
_080BFB14:
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
_080BFB18:
	ldr r0, _080BFB34 @ =gUnknown_083D1464
	mov r2, r8
	lsls r1, r2, 2
	adds r1, r0
	ldr r0, [r1]
	mov r1, sp
	bl StringCopy
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFB34: .4byte gUnknown_083D1464
	thumb_func_end sub_80BF820

	thumb_func_start sub_80BF974
sub_80BF974: @ 80BFB38
	push {r4,lr}
	movs r1, 0
	ldr r4, _080BFB58 @ =gSaveBlock1
	ldr r0, _080BFB5C @ =gSpecialVar_0x8004
	ldrh r2, [r0]
	ldr r3, _080BFB60 @ =0x00002738
_080BFB44:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080BFB64
	movs r0, 0x1
	b _080BFB70
	.align 2, 0
_080BFB58: .4byte gSaveBlock1
_080BFB5C: .4byte gSpecialVar_0x8004
_080BFB60: .4byte 0x00002738
_080BFB64:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080BFB44
	movs r0, 0
_080BFB70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF974

	thumb_func_start sub_80BF9B4
sub_80BF9B4: @ 80BFB78
	push {r4,lr}
	ldr r0, _080BFBA4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFBA8 @ =gPlayerParty
	adds r0, r1
	ldr r4, _080BFBAC @ =gStringVar1
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _080BFBB0 @ =gStringVar3
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _080BFBB4
	bl sub_80BE478
	movs r0, 0x1
	b _080BFBB6
	.align 2, 0
_080BFBA4: .4byte gSpecialVar_0x8004
_080BFBA8: .4byte gPlayerParty
_080BFBAC: .4byte gStringVar1
_080BFBB0: .4byte gStringVar3
_080BFBB4:
	movs r0, 0
_080BFBB6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BF9B4

	thumb_func_start sub_80BF9F8
sub_80BF9F8: @ 80BFBBC
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _080BFC64 @ =gSpecialVar_0x8004
	mov r9, r0
	ldrh r0, [r0]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r6, _080BFC68 @ =gPlayerParty
	adds r0, r6
	ldr r2, _080BFC6C @ =gStringVar3
	movs r1, 0x2
	bl GetMonData
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	ldr r1, _080BFC70 @ =gStringVar2
	mov r10, r1
	movs r1, 0x2
	mov r2, r10
	bl GetMonData
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	bl GetMonGender
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r9
	ldrh r0, [r1]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r6
	movs r1, 0
	movs r2, 0
	bl GetMonData
	str r0, [sp]
	ldr r0, _080BFC74 @ =c2_080CC144
	str r0, [sp, 0x4]
	movs r0, 0x3
	mov r1, r10
	adds r2, r5, 0
	adds r3, r4, 0
	bl DoNamingScreen
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BFC64: .4byte gSpecialVar_0x8004
_080BFC68: .4byte gPlayerParty
_080BFC6C: .4byte gStringVar3
_080BFC70: .4byte gStringVar2
_080BFC74: .4byte c2_080CC144
	thumb_func_end sub_80BF9F8

	thumb_func_start c2_080CC144
c2_080CC144: @ 80BFC78
	push {lr}
	ldr r0, _080BFC98 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFC9C @ =gPlayerParty
	adds r0, r1
	ldr r2, _080BFCA0 @ =gStringVar2
	movs r1, 0x2
	bl SetMonData
	bl c2_exit_to_overworld_1_continue_scripts_restart_music
	pop {r0}
	bx r0
	.align 2, 0
_080BFC98: .4byte gSpecialVar_0x8004
_080BFC9C: .4byte gPlayerParty
_080BFCA0: .4byte gStringVar2
	thumb_func_end c2_080CC144

	thumb_func_start sub_80BFAE0
sub_80BFAE0: @ 80BFCA4
	push {r4,lr}
	ldr r0, _080BFCC8 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFCCC @ =gPlayerParty
	adds r0, r1
	ldr r4, _080BFCD0 @ =gStringVar1
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFCC8: .4byte gSpecialVar_0x8004
_080BFCCC: .4byte gPlayerParty
_080BFCD0: .4byte gStringVar1
	thumb_func_end sub_80BFAE0

	thumb_func_start sub_80BFB10
sub_80BFB10: @ 80BFCD4
	push {r4,lr}
	bl sub_80BFB94
	adds r4, r0, 0
	ldr r0, _080BFCFC @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080BFD00 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	cmp r4, r0
	bne _080BFD08
	ldr r1, _080BFD04 @ =gScriptResult
	movs r0, 0
	b _080BFD0C
	.align 2, 0
_080BFCFC: .4byte gSpecialVar_0x8004
_080BFD00: .4byte gPlayerParty
_080BFD04: .4byte gScriptResult
_080BFD08:
	ldr r1, _080BFD14 @ =gScriptResult
	movs r0, 0x1
_080BFD0C:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFD14: .4byte gScriptResult
	thumb_func_end sub_80BFB10

	thumb_func_start sub_80BFB54
sub_80BFB54: @ 80BFD18
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0
	beq _080BFD4E
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080BFD32
	movs r0, 0x2
	b _080BFD54
_080BFD32:
	adds r0, r1, 0
	subs r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _080BFD42
	movs r0, 0x3
	b _080BFD54
_080BFD42:
	adds r0, r2, 0
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080BFD52
_080BFD4E:
	movs r0, 0
	b _080BFD54
_080BFD52:
	movs r0, 0x4
_080BFD54:
	pop {r1}
	bx r1
	thumb_func_end sub_80BFB54

	thumb_func_start sub_80BFB94
sub_80BFB94: @ 80BFD58
	ldr r2, _080BFD70 @ =gSaveBlock2
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	ldrb r1, [r2, 0xC]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0xB]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0xA]
	orrs r0, r1
	bx lr
	.align 2, 0
_080BFD70: .4byte gSaveBlock2
	thumb_func_end sub_80BFB94

	thumb_func_start CheckForBigMovieOrEmergencyNewsOnTV
CheckForBigMovieOrEmergencyNewsOnTV: @ 80BFD74
	push {lr}
	ldr r1, _080BFD94 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bne _080BFD90
	ldr r0, _080BFD98 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080BFD9C
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0
	beq _080BFDA4
_080BFD90:
	movs r0, 0
	b _080BFDCE
	.align 2, 0
_080BFD94: .4byte gSaveBlock1
_080BFD98: .4byte gSaveBlock2
_080BFD9C:
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080BFD90
_080BFDA4:
	ldr r0, _080BFDC8 @ =0x0000085d
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BFDC2
	movs r0, 0x83
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BFDCC
_080BFDC2:
	movs r0, 0x1
	b _080BFDCE
	.align 2, 0
_080BFDC8: .4byte 0x0000085d
_080BFDCC:
	movs r0, 0x2
_080BFDCE:
	pop {r1}
	bx r1
	thumb_func_end CheckForBigMovieOrEmergencyNewsOnTV

	thumb_func_start GetMomOrDadStringForTVMessage
GetMomOrDadStringForTVMessage: @ 80BFDD4
	push {r4,lr}
	ldr r1, _080BFE04 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x1
	bne _080BFE30
	ldr r0, _080BFE08 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _080BFE18
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0
	bne _080BFE30
	ldr r0, _080BFE0C @ =gStringVar1
	ldr r1, _080BFE10 @ =gOtherText_Mom
	bl StringCopy
	ldr r0, _080BFE14 @ =0x00004003
	movs r1, 0x1
	bl VarSet
	b _080BFE30
	.align 2, 0
_080BFE04: .4byte gSaveBlock1
_080BFE08: .4byte gSaveBlock2
_080BFE0C: .4byte gStringVar1
_080BFE10: .4byte gOtherText_Mom
_080BFE14: .4byte 0x00004003
_080BFE18:
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, 0x2
	bne _080BFE30
	ldr r0, _080BFE78 @ =gStringVar1
	ldr r1, _080BFE7C @ =gOtherText_Mom
	bl StringCopy
	ldr r0, _080BFE80 @ =0x00004003
	movs r1, 0x1
	bl VarSet
_080BFE30:
	ldr r4, _080BFE80 @ =0x00004003
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080BFE6E
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	beq _080BFE84
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _080BFE98
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080BFE84
_080BFE6E:
	ldr r0, _080BFE78 @ =gStringVar1
	ldr r1, _080BFE7C @ =gOtherText_Mom
	bl StringCopy
	b _080BFED4
	.align 2, 0
_080BFE78: .4byte gStringVar1
_080BFE7C: .4byte gOtherText_Mom
_080BFE80: .4byte 0x00004003
_080BFE84:
	ldr r0, _080BFE90 @ =gStringVar1
	ldr r1, _080BFE94 @ =gOtherText_Dad
	bl StringCopy
	b _080BFED4
	.align 2, 0
_080BFE90: .4byte gStringVar1
_080BFE94: .4byte gOtherText_Dad
_080BFE98:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BFEC4
	ldr r0, _080BFEBC @ =gStringVar1
	ldr r1, _080BFEC0 @ =gOtherText_Mom
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0x1
	bl VarSet
	b _080BFED4
	.align 2, 0
_080BFEBC: .4byte gStringVar1
_080BFEC0: .4byte gOtherText_Mom
_080BFEC4:
	ldr r0, _080BFEDC @ =gStringVar1
	ldr r1, _080BFEE0 @ =gOtherText_Dad
	bl StringCopy
	adds r0, r4, 0
	movs r1, 0x2
	bl VarSet
_080BFED4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFEDC: .4byte gStringVar1
_080BFEE0: .4byte gOtherText_Dad
	thumb_func_end GetMomOrDadStringForTVMessage

	thumb_func_start sub_80BFD20
sub_80BFD20: @ 80BFEE4
	push {lr}
	ldr r0, _080BFF00 @ =0x000040bc
	movs r1, 0
	bl VarSet
	ldr r0, _080BFF04 @ =gSaveBlock1
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x5
	bl RemoveFieldObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_080BFF00: .4byte 0x000040bc
_080BFF04: .4byte gSaveBlock1
	thumb_func_end sub_80BFD20

	thumb_func_start sub_80BFD44
sub_80BFD44: @ 80BFF08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r4, 0
_080BFF18:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 5
	adds r0, r4
	lsls r0, 2
	ldr r5, _080BFF50 @ =0x02007000
	adds r0, r5
	adds r1, r4, 0
	muls r1, r7
	add r1, r8
	movs r2, 0xE1
	lsls r2, 2
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080BFF18
	adds r4, r5, 0
	cmp r6, 0x1
	beq _080BFF80
	cmp r6, 0x1
	bgt _080BFF54
	cmp r6, 0
	beq _080BFF5E
	b _080BFFC0
	.align 2, 0
_080BFF50: .4byte 0x02007000
_080BFF54:
	cmp r6, 0x2
	beq _080BFF90
	cmp r6, 0x3
	beq _080BFFAC
	b _080BFFC0
_080BFF5E:
	ldr r0, _080BFF78 @ =0x02027e6c
	movs r2, 0xE1
	lsls r2, 2
	adds r1, r4, r2
	movs r3, 0xE1
	lsls r3, 3
	adds r2, r4, r3
	ldr r5, _080BFF7C @ =0x00000a8c
	adds r3, r4, r5
	bl sub_80BFE24
	b _080BFFC0
	.align 2, 0
_080BFF78: .4byte 0x02027e6c
_080BFF7C: .4byte 0x00000a8c
_080BFF80:
	ldr r1, _080BFF8C @ =0x02027e6c
	movs r0, 0xE1
	lsls r0, 3
	adds r2, r4, r0
	b _080BFF98
	.align 2, 0
_080BFF8C: .4byte 0x02027e6c
_080BFF90:
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r4, r0
	ldr r2, _080BFFA4 @ =0x02027e6c
_080BFF98:
	ldr r5, _080BFFA8 @ =0x00000a8c
	adds r3, r4, r5
	adds r0, r4, 0
	bl sub_80BFE24
	b _080BFFC0
	.align 2, 0
_080BFFA4: .4byte 0x02027e6c
_080BFFA8: .4byte 0x00000a8c
_080BFFAC:
	movs r0, 0xE1
	lsls r0, 2
	adds r1, r5, r0
	movs r3, 0xE1
	lsls r3, 3
	adds r2, r5, r3
	ldr r3, _080BFFE4 @ =0x02027e6c
	adds r0, r5, 0
	bl sub_80BFE24
_080BFFC0:
	ldr r4, _080BFFE4 @ =0x02027e6c
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80C04A0
	adds r0, r4, 0
	bl sub_80BF588
	bl sub_80C01D4
	bl sub_80C0408
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFFE4: .4byte 0x02027e6c
	thumb_func_end sub_80BFD44

	thumb_func_start sub_80BFE24
sub_80BFE24: @ 80BFFE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	add r0, sp, 0x10
	str r0, [sp]
	add r0, sp, 0x14
	str r0, [sp, 0x4]
	add r0, sp, 0x18
	str r0, [sp, 0x8]
	add r0, sp, 0x1C
	str r0, [sp, 0xC]
	bl GetLinkPlayerCount
	ldr r1, _080C0064 @ =gUnknown_03000720
	strb r0, [r1]
_080C0014:
	movs r6, 0
	ldr r0, _080C0064 @ =gUnknown_03000720
	ldrb r1, [r0]
	cmp r6, r1
	bcs _080C0014
	mov r10, r0
_080C0020:
	cmp r6, 0
	bne _080C0028
	ldr r2, _080C0068 @ =gUnknown_020387E4
	strb r6, [r2]
_080C0028:
	lsls r4, r6, 2
	mov r3, sp
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80C019C
	ldr r1, _080C006C @ =gUnknown_03000722
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r7, r4, 0
	cmp r0, r1
	bne _080C0070
	ldr r1, _080C0068 @ =gUnknown_020387E4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	mov r2, r10
	ldrb r2, [r2]
	cmp r0, r2
	beq _080C011C
	adds r6, 0x1
	mov r9, r6
	b _080C0100
	.align 2, 0
_080C0064: .4byte gUnknown_03000720
_080C0068: .4byte gUnknown_020387E4
_080C006C: .4byte gUnknown_03000722
_080C0070:
	movs r5, 0
	mov r3, r10
	ldrb r0, [r3]
	subs r0, 0x1
	adds r2, r6, 0x1
	mov r9, r2
	cmp r5, r0
	bge _080C00E6
	ldr r3, _080C0110 @ =gUnknown_03000720
	mov r8, r3
_080C0084:
	adds r0, r6, r5
	adds r4, r0, 0x1
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80BF74C
	ldr r1, _080C0114 @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C00D6
	mov r2, r8
	ldrb r1, [r2]
	adds r0, r4, 0
	bl __modsi3
	adds r2, r0, 0
	lsls r0, r2, 2
	add r0, sp
	ldr r0, [r0]
	mov r3, sp
	adds r1, r3, r7
	ldr r1, [r1]
	lsls r2, 24
	lsrs r2, 24
	bl sub_80BFF68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C00E6
_080C00D6:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _080C0084
_080C00E6:
	mov r2, r10
	ldrb r0, [r2]
	subs r0, 0x1
	cmp r5, r0
	bne _080C0100
	mov r3, sp
	adds r0, r3, r7
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, _080C0118 @ =gUnknown_03000722
	ldrb r1, [r1]
	bl sub_80BF55C
_080C0100:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r6, r0, 24
	mov r2, r10
	ldrb r2, [r2]
	cmp r6, r2
	bcc _080C0020
	b _080C0014
	.align 2, 0
_080C0110: .4byte gUnknown_03000720
_080C0114: .4byte gUnknown_03005D38
_080C0118: .4byte gUnknown_03000722
_080C011C:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BFE24

	thumb_func_start sub_80BFF68
sub_80BFF68: @ 80C012C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r4, [r0]
	ldr r6, [r1]
	movs r5, 0
	ldr r2, _080C0168 @ =gUnknown_03000722
	movs r1, 0
	ldrsb r1, [r2, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	ldr r2, [sp]
	cmp r0, 0x3
	beq _080C019C
	cmp r0, 0x3
	bgt _080C016C
	cmp r0, 0x2
	beq _080C0172
	b _080C01EA
	.align 2, 0
_080C0168: .4byte gUnknown_03000722
_080C016C:
	cmp r1, 0x4
	beq _080C01C4
	b _080C01EA
_080C0172:
	ldr r0, _080C0198 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C004C
	b _080C01E6
	.align 2, 0
_080C0198: .4byte gUnknown_03005D38
_080C019C:
	ldr r0, _080C01C0 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C00B4
	b _080C01E6
	.align 2, 0
_080C01C0: .4byte gUnknown_03005D38
_080C01C4:
	ldr r0, _080C01F4 @ =gUnknown_03005D38
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4, r0
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r6, r1
	adds r2, r7, 0
	bl sub_80C0134
_080C01E6:
	lsls r0, 24
	lsrs r5, r0, 24
_080C01EA:
	cmp r5, 0x1
	beq _080C01F8
	movs r0, 0
	b _080C0204
	.align 2, 0
_080C01F4: .4byte gUnknown_03005D38
_080C01F8:
	ldr r0, _080C020C @ =gUnknown_03000722
	ldrb r1, [r0]
	adds r0, r6, 0
	bl sub_80BF55C
	movs r0, 0x1
_080C0204:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C020C: .4byte gUnknown_03000722
	thumb_func_end sub_80BFF68

	thumb_func_start sub_80C004C
sub_80C004C: @ 80C0210
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r5, r0, 0
	movs r2, 0xFF
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0240
	lsrs r0, r5, 8
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0240
	movs r0, 0
	b _080C0270
_080C0240:
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x22
	strb r0, [r2]
	adds r3, r4, 0
	adds r3, 0x21
	ldrb r0, [r3]
	adds r2, 0x1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, 8
	strb r0, [r3]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
_080C0270:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C004C

	thumb_func_start sub_80C00B4
sub_80C00B4: @ 80C0278
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r2, r0, 0
	movs r3, 0xFF
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C02A4
	lsrs r0, r2, 8
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	cmp r0, r1
	beq _080C02C4
_080C02A4:
	movs r3, 0xFF
	adds r0, r2, 0
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x22
	lsrs r5, r2, 8
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C02C8
	adds r0, r5, 0
	ands r0, r3
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C02C8
_080C02C4:
	movs r0, 0
	b _080C02F0
_080C02C8:
	ldrb r1, [r4, 0x1E]
	adds r0, r4, 0
	adds r0, 0x20
	strb r1, [r0]
	ldrb r0, [r4, 0x1F]
	adds r1, r4, 0
	adds r1, 0x21
	strb r0, [r1]
	strb r2, [r4, 0x1E]
	strb r5, [r4, 0x1F]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
_080C02F0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C00B4

	thumb_func_start sub_80C0134
sub_80C0134: @ 80C02F8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	bl GetLinkPlayerTrainerId
	adds r5, r0, 0
	movs r2, 0xFF
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x22
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0328
	lsrs r0, r5, 8
	ands r0, r2
	adds r1, r4, 0
	adds r1, 0x23
	ldrb r1, [r1]
	cmp r0, r1
	bne _080C0328
	movs r0, 0
	b _080C035A
_080C0328:
	adds r1, r4, 0
	adds r1, 0x20
	ldrb r0, [r1]
	adds r2, r4, 0
	adds r2, 0x22
	strb r0, [r2]
	adds r3, r4, 0
	adds r3, 0x21
	ldrb r0, [r3]
	adds r2, 0x1
	strb r0, [r2]
	strb r5, [r1]
	lsrs r0, r5, 8
	strb r0, [r3]
	adds r1, r6, 0
	adds r0, r4, 0
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r0, 0x1
	strb r0, [r6, 0x1]
	strh r0, [r6, 0x16]
_080C035A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C0134

	thumb_func_start sub_80C019C
sub_80C019C: @ 80C0360
	push {lr}
	adds r3, r0, 0
	movs r2, 0
_080C0366:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldrb r0, [r1, 0x1]
	cmp r0, 0
	bne _080C0386
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bhi _080C0386
	lsls r0, r2, 24
	asrs r0, 24
	b _080C0394
_080C0386:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x17
	bls _080C0366
	movs r0, 0x1
	negs r0, r0
_080C0394:
	pop {r1}
	bx r1
	thumb_func_end sub_80C019C

	thumb_func_start sub_80C01D4
sub_80C01D4: @ 80C0398
	push {r4-r6,lr}
	movs r6, 0
_080C039C:
	ldr r0, _080C03BC @ =gSaveBlock1
	lsls r2, r6, 3
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldr r0, _080C03C0 @ =0x00002738
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x29
	bls _080C03B2
	b _080C0550
_080C03B2:
	lsls r0, 2
	ldr r1, _080C03C4 @ =_080C03C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C03BC: .4byte gSaveBlock1
_080C03C0: .4byte 0x00002738
_080C03C4: .4byte _080C03C8
	.align 2, 0
_080C03C8:
	.4byte _080C0558
	.4byte _080C0470
	.4byte _080C0558
	.4byte _080C0480
	.4byte _080C0490
	.4byte _080C04A0
	.4byte _080C04BC
	.4byte _080C04CC
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C04E8
	.4byte _080C0558
	.4byte _080C04F8
	.4byte _080C0514
	.4byte _080C052C
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0550
	.4byte _080C0558
_080C0470:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C047C @ =0x02027e6c
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C051E
	.align 2, 0
_080C047C: .4byte 0x02027e6c
_080C0480:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C048C @ =0x02027e6c
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C051E
	.align 2, 0
_080C048C: .4byte 0x02027e6c
_080C0490:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C049C @ =0x02027e6c
	adds r0, r1
	ldrh r0, [r0, 0x6]
	b _080C051E
	.align 2, 0
_080C049C: .4byte 0x02027e6c
_080C04A0:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C04B8 @ =0x02027e6c
	adds r4, r0
	ldrh r0, [r4, 0x2]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x1C]
	b _080C0542
	.align 2, 0
_080C04B8: .4byte 0x02027e6c
_080C04BC:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C04C8 @ =0x02027e6c
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080C051E
	.align 2, 0
_080C04C8: .4byte 0x02027e6c
_080C04CC:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C04E4 @ =0x02027e6c
	adds r4, r0
	ldrh r0, [r4, 0xA]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x14]
	b _080C0542
	.align 2, 0
_080C04E4: .4byte 0x02027e6c
_080C04E8:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C04F4 @ =0x02027e6c
	adds r0, r1
	ldrh r0, [r0, 0x10]
	b _080C051E
	.align 2, 0
_080C04F4: .4byte 0x02027e6c
_080C04F8:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C0510 @ =0x02027e6c
	adds r4, r0
	ldrh r0, [r4, 0xC]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0xE]
	b _080C0542
	.align 2, 0
_080C0510: .4byte 0x02027e6c
_080C0514:
	adds r0, r2, r6
	lsls r0, 2
	ldr r1, _080C0528 @ =0x02027e6c
	adds r0, r1
	ldrh r0, [r0, 0x4]
_080C051E:
	lsls r1, r6, 24
	lsrs r1, 24
	bl sub_80C03C8
	b _080C0558
	.align 2, 0
_080C0528: .4byte 0x02027e6c
_080C052C:
	adds r4, r2, r6
	lsls r4, 2
	ldr r0, _080C054C @ =0x02027e6c
	adds r4, r0
	ldrh r0, [r4, 0x8]
	lsls r5, r6, 24
	lsrs r5, 24
	adds r1, r5, 0
	bl sub_80C03C8
	ldrh r0, [r4, 0x4]
_080C0542:
	adds r1, r5, 0
	bl sub_80C03C8
	b _080C0558
	.align 2, 0
_080C054C: .4byte 0x02027e6c
_080C0550:
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_80C03A8
_080C0558:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x17
	bhi _080C0564
	b _080C039C
_080C0564:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80C01D4

	thumb_func_start sub_80C03A8
sub_80C03A8: @ 80C056C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C0584 @ =gSaveBlock1
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r0, _080C0588 @ =0x00002739
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080C0584: .4byte gSaveBlock1
_080C0588: .4byte 0x00002739
	thumb_func_end sub_80C03A8

	thumb_func_start sub_80C03C8
sub_80C03C8: @ 80C058C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl sub_8090D90
	lsls r0, 24
	asrs r2, r0, 24
	cmp r2, 0
	bne _080C05BC
	ldr r1, _080C05C4 @ =gSaveBlock1
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldr r1, _080C05C8 @ =0x00002739
	adds r0, r1
	strb r2, [r0]
_080C05BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C05C4: .4byte gSaveBlock1
_080C05C8: .4byte 0x00002739
	thumb_func_end sub_80C03C8

	thumb_func_start sub_80C0408
sub_80C0408: @ 80C05CC
	push {r4-r6,lr}
	ldr r0, _080C0610 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C0608
	movs r2, 0
	ldr r6, _080C0614 @ =gSaveBlock1
	ldr r4, _080C0618 @ =0x00002739
	movs r3, 0
	ldr r5, _080C061C @ =0x00002738
_080C05E6:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0x7
	beq _080C05FA
	cmp r0, 0x29
	bne _080C05FE
_080C05FA:
	adds r0, r1, r4
	strb r3, [r0]
_080C05FE:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x17
	bls _080C05E6
_080C0608:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0610: .4byte 0x00000804
_080C0614: .4byte gSaveBlock1
_080C0618: .4byte 0x00002739
_080C061C: .4byte 0x00002738
	thumb_func_end sub_80C0408

	thumb_func_start sub_80C045C
sub_80C045C: @ 80C0620
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _080C0658 @ =gSaveBlock1
_080C0626:
	lsls r0, r5, 3
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r6
	ldr r1, _080C065C @ =0x00002738
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_80BFB54
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080C0648
	ldr r0, _080C0660 @ =0x00002739
	adds r1, r4, r0
	movs r0, 0
	strb r0, [r1]
_080C0648:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080C0626
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0658: .4byte gSaveBlock1
_080C065C: .4byte 0x00002738
_080C0660: .4byte 0x00002739
	thumb_func_end sub_80C045C

	thumb_func_start sub_80C04A0
sub_80C04A0: @ 80C0664
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0x5
	ldr r5, _080C06CC @ =gSaveBlock1
	ldr r4, _080C06D0 @ =0x00002738
_080C066E:
	lsls r0, r2, 24
	asrs r1, r0, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C068C
	lsls r0, r3, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r3, r0, 24
_080C068C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x17
	ble _080C066E
	movs r2, 0
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0x5
	subs r0, r1, r0
	cmp r2, r0
	bge _080C06C6
	adds r5, r0, 0
_080C06A8:
	lsls r1, r2, 24
	asrs r4, r1, 24
	movs r0, 0xA0
	lsls r0, 19
	adds r1, r0
	lsrs r1, 24
	ldr r0, _080C06D4 @ =0x02027e6c
	bl sub_80BF55C
	adds r4, 0x1
	lsls r4, 24
	lsrs r2, r4, 24
	asrs r4, 24
	cmp r4, r5
	blt _080C06A8
_080C06C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C06CC: .4byte gSaveBlock1
_080C06D0: .4byte 0x00002738
_080C06D4: .4byte 0x02027e6c
	thumb_func_end sub_80C04A0

	thumb_func_start sub_80C0514
sub_80C0514: @ 80C06D8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
_080C06E8:
	lsls r0, r4, 6
	ldr r6, _080C0714 @ =0x02007000
	adds r0, r6
	adds r1, r4, 0
	muls r1, r7
	add r1, r8
	movs r2, 0x40
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080C06E8
	adds r4, r6, 0
	cmp r5, 0x1
	beq _080C073C
	cmp r5, 0x1
	bgt _080C0718
	cmp r5, 0
	beq _080C0722
	b _080C0770
	.align 2, 0
_080C0714: .4byte 0x02007000
_080C0718:
	cmp r5, 0x2
	beq _080C0748
	cmp r5, 0x3
	beq _080C0760
	b _080C0770
_080C0722:
	ldr r0, _080C0738 @ =0x020281f0
	adds r1, r4, 0
	adds r1, 0x40
	adds r2, r4, 0
	adds r2, 0x80
	adds r3, r4, 0
	adds r3, 0xC0
	bl sub_80C05C4
	b _080C0770
	.align 2, 0
_080C0738: .4byte 0x020281f0
_080C073C:
	ldr r1, _080C0744 @ =0x020281f0
	adds r2, r4, 0
	adds r2, 0x80
	b _080C074E
	.align 2, 0
_080C0744: .4byte 0x020281f0
_080C0748:
	adds r1, r4, 0
	adds r1, 0x40
	ldr r2, _080C075C @ =0x020281f0
_080C074E:
	adds r3, r4, 0
	adds r3, 0xC0
	adds r0, r4, 0
	bl sub_80C05C4
	b _080C0770
	.align 2, 0
_080C075C: .4byte 0x020281f0
_080C0760:
	adds r1, r6, 0
	adds r1, 0x40
	adds r2, r6, 0
	adds r2, 0x80
	ldr r3, _080C0784 @ =0x020281f0
	adds r0, r6, 0
	bl sub_80C05C4
_080C0770:
	bl sub_80C0750
	bl sub_80C0788
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0784: .4byte 0x020281f0
	thumb_func_end sub_80C0514

	thumb_func_start sub_80C05C4
sub_80C05C4: @ 80C0788
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	add r0, sp, 0x10
	str r0, [sp]
	add r0, sp, 0x14
	str r0, [sp, 0x4]
	add r0, sp, 0x18
	str r0, [sp, 0x8]
	add r0, sp, 0x1C
	str r0, [sp, 0xC]
	bl GetLinkPlayerCount
	ldr r1, _080C07C4 @ =gUnknown_03000721
	strb r0, [r1]
	movs r0, 0
	mov r10, r0
_080C07B8:
	movs r7, 0
	mov r1, r10
	adds r1, 0x1
	str r1, [sp, 0x20]
	b _080C0850
	.align 2, 0
_080C07C4: .4byte gUnknown_03000721
_080C07C8:
	lsls r4, r7, 2
	mov r1, sp
	adds r0, r1, r4
	ldr r0, [r0]
	ldr r0, [r0]
	mov r1, r10
	bl sub_80C0730
	ldr r1, _080C0874 @ =gUnknown_03000722
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	mov r8, r4
	adds r1, r7, 0x1
	mov r9, r1
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C084A
	movs r5, 0
	ldr r1, _080C0878 @ =gUnknown_03000721
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	bge _080C084A
	adds r6, r1, 0
_080C07FC:
	adds r0, r7, r5
	adds r4, r0, 0x1
	ldrb r1, [r6]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_80BEBC8
	ldr r1, _080C087C @ =gUnknown_03005D38
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080C083C
	ldrb r1, [r6]
	adds r0, r4, 0
	bl __modsi3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	mov r1, sp
	add r1, r8
	ldr r1, [r1]
	bl sub_80C06BC
_080C083C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	subs r0, 0x1
	cmp r5, r0
	blt _080C07FC
_080C084A:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r7, r0, 24
_080C0850:
	ldr r0, _080C0878 @ =gUnknown_03000721
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080C07C8
	ldr r1, [sp, 0x20]
	lsls r0, r1, 24
	lsrs r0, 24
	mov r10, r0
	cmp r0, 0xF
	bls _080C07B8
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0874: .4byte gUnknown_03000722
_080C0878: .4byte gUnknown_03000721
_080C087C: .4byte gUnknown_03005D38
	thumb_func_end sub_80C05C4

	thumb_func_start sub_80C06BC
sub_80C06BC: @ 80C0880
	push {lr}
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _080C08A4 @ =gUnknown_03000722
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	lsls r2, 2
	adds r1, r2
	ldr r2, _080C08A8 @ =gUnknown_03005D38
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	bl sub_80C06E8
	pop {r0}
	bx r0
	.align 2, 0
_080C08A4: .4byte gUnknown_03000722
_080C08A8: .4byte gUnknown_03005D38
	thumb_func_end sub_80C06BC

	thumb_func_start sub_80C06E8
sub_80C06E8: @ 80C08AC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r6, r2, 24
	ldrb r3, [r5]
	adds r0, r3, 0
	cmp r0, 0
	bne _080C08C2
_080C08BE:
	movs r0, 0
	b _080C08EE
_080C08C2:
	movs r1, 0
	adds r2, r3, 0
	adds r3, r0, 0
_080C08C8:
	lsls r0, r1, 2
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _080C08BE
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080C08C8
	lsls r0, r6, 24
	asrs r0, 22
	adds r0, r4
	strb r2, [r0]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	ldrh r1, [r5, 0x2]
	strh r1, [r0, 0x2]
	movs r0, 0x1
_080C08EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C06E8

	thumb_func_start sub_80C0730
sub_80C0730: @ 80C08F4
	push {lr}
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r1, r2, 2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C090A
	lsls r0, r2, 24
	asrs r0, 24
	b _080C090E
_080C090A:
	movs r0, 0x1
	negs r0, r0
_080C090E:
	pop {r1}
	bx r1
	thumb_func_end sub_80C0730

	thumb_func_start sub_80C0750
sub_80C0750: @ 80C0914
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080C0944 @ =gSaveBlock1
_080C091A:
	lsls r0, r4, 2
	adds r0, r5
	ldr r1, _080C0948 @ =0x00002abc
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _080C092E
	adds r0, r4, 0
	bl sub_80BEC10
_080C092E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080C091A
	bl sub_80BEC40
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0944: .4byte gSaveBlock1
_080C0948: .4byte 0x00002abc
	thumb_func_end sub_80C0750

	thumb_func_start sub_80C0788
sub_80C0788: @ 80C094C
	push {r4,lr}
	ldr r0, _080C097C @ =0x00000804
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C0976
	movs r1, 0
	ldr r4, _080C0980 @ =gSaveBlock1
	ldr r3, _080C0984 @ =0x00002abd
	movs r2, 0
_080C0964:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080C0964
_080C0976:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C097C: .4byte 0x00000804
_080C0980: .4byte gSaveBlock1
_080C0984: .4byte 0x00002abd
	thumb_func_end sub_80C0788

	thumb_func_start DoTVShow
DoTVShow: @ 80C0988
	push {lr}
	ldr r2, _080C09BC @ =gSaveBlock1
	ldr r0, _080C09C0 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldr r2, _080C09C4 @ =0x00002739
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C09A4
	b _080C0ABC
_080C09A4:
	subs r2, 0x1
	adds r0, r1, r2
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0x28
	bls _080C09B2
	b _080C0ABC
_080C09B2:
	lsls r0, 2
	ldr r1, _080C09C8 @ =_080C09CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C09BC: .4byte gSaveBlock1
_080C09C0: .4byte gSpecialVar_0x8004
_080C09C4: .4byte 0x00002739
_080C09C8: .4byte _080C09CC
	.align 2, 0
_080C09CC:
	.4byte _080C0A70
	.4byte _080C0A76
	.4byte _080C0A7C
	.4byte _080C0A82
	.4byte _080C0AA6
	.4byte _080C0A8E
	.4byte _080C0A94
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0A9A
	.4byte _080C0AA0
	.4byte _080C0AAC
	.4byte _080C0AB2
	.4byte _080C0AB8
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0ABC
	.4byte _080C0A88
_080C0A70:
	bl DoTVShowPokemonFanClubLetter
	b _080C0ABC
_080C0A76:
	bl DoTVShowRecentHappenings
	b _080C0ABC
_080C0A7C:
	bl DoTVShowPokemonFanClubOpinions
	b _080C0ABC
_080C0A82:
	bl nullsub_22
	b _080C0ABC
_080C0A88:
	bl DoTVShowPokemonNewsMassOutbreak
	b _080C0ABC
_080C0A8E:
	bl DoTVShowBravoTrainerPokemonProfile
	b _080C0ABC
_080C0A94:
	bl DoTVShowBravoTrainerBattleTowerProfile
	b _080C0ABC
_080C0A9A:
	bl DoTVShowPokemonTodaySuccessfulCapture
	b _080C0ABC
_080C0AA0:
	bl DoTVShowTodaysSmartShopper
	b _080C0ABC
_080C0AA6:
	bl DoTVShowTheNameRaterShow
	b _080C0ABC
_080C0AAC:
	bl DoTVShowPokemonTodayFailedCapture
	b _080C0ABC
_080C0AB2:
	bl DoTVShowPokemonAngler
	b _080C0ABC
_080C0AB8:
	bl DoTVShowTheWorldOfMasters
_080C0ABC:
	pop {r0}
	bx r0
	thumb_func_end DoTVShow

	thumb_func_start TVShowConvertInternationalString
TVShowConvertInternationalString: @ 80C0AC0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r2, 24
	lsrs r4, 24
	bl StringCopy
	cmp r4, 0x1
	bhi _080C0AD8
	adds r0, r5, 0
	movs r1, 0x1
	bl ConvertInternationalString
_080C0AD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TVShowConvertInternationalString

	thumb_func_start DoTVShowBravoTrainerPokemonProfile
DoTVShowBravoTrainerPokemonProfile: @ 80C0AE0
	push {r4,r5,lr}
	ldr r0, _080C0B0C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0B10 @ =0x02027e6c
	adds r4, r0, r1
	ldr r1, _080C0B14 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0B18 @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x8
	bls _080C0B00
	b _080C0D3E
_080C0B00:
	lsls r0, r5, 2
	ldr r1, _080C0B1C @ =_080C0B20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0B0C: .4byte gSpecialVar_0x8004
_080C0B10: .4byte 0x02027e6c
_080C0B14: .4byte gScriptResult
_080C0B18: .4byte gUnknown_020387E8
_080C0B1C: .4byte _080C0B20
	.align 2, 0
_080C0B20:
	.4byte _080C0B44
	.4byte _080C0B9C
	.4byte _080C0BD4
	.4byte _080C0C04
	.4byte _080C0C38
	.4byte _080C0C6C
	.4byte _080C0CB0
	.4byte _080C0CF8
	.4byte _080C0D28
_080C0B44:
	ldr r0, _080C0B84 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldrb r1, [r4, 0x13]
	lsls r1, 27
	lsrs r1, 30
	movs r0, 0x2
	bl sub_80BEF10
	ldrh r1, [r4, 0x2]
	movs r0, 0xB
	muls r0, r1
	ldr r1, _080C0B88 @ =gSpeciesNames
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	bne _080C0B90
	ldr r1, _080C0B8C @ =gUnknown_020387E8
	movs r0, 0x8
	b _080C0D3C
	.align 2, 0
_080C0B84: .4byte gStringVar1
_080C0B88: .4byte gSpeciesNames
_080C0B8C: .4byte gUnknown_020387E8
_080C0B90:
	ldr r1, _080C0B98 @ =gUnknown_020387E8
	movs r0, 0x1
	b _080C0D3C
	.align 2, 0
_080C0B98: .4byte gUnknown_020387E8
_080C0B9C:
	ldr r0, _080C0BC8 @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0BCC @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0BD0 @ =gStringVar2
	adds r1, r4, 0
	adds r1, 0x8
	ldrb r2, [r4, 0x1F]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x2
	bl CopyContestCategoryToStringVar
	b _080C0D38
	.align 2, 0
_080C0BC8: .4byte gStringVar1
_080C0BCC: .4byte gSpeciesNames
_080C0BD0: .4byte gStringVar2
_080C0BD4:
	ldr r0, _080C0BF0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	bne _080C0BF8
	ldr r1, _080C0BF4 @ =gUnknown_020387E8
	movs r0, 0x3
	b _080C0D3C
	.align 2, 0
_080C0BF0: .4byte gStringVar1
_080C0BF4: .4byte gUnknown_020387E8
_080C0BF8:
	ldr r1, _080C0C00 @ =gUnknown_020387E8
	movs r0, 0x4
	b _080C0D3C
	.align 2, 0
_080C0C00: .4byte gUnknown_020387E8
_080C0C04:
	ldr r0, _080C0C2C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0C30 @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl ConvertEasyChatWordsToString
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0C34 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0D3C
	.align 2, 0
_080C0C2C: .4byte gStringVar1
_080C0C30: .4byte gStringVar2
_080C0C34: .4byte gUnknown_020387E8
_080C0C38:
	ldr r0, _080C0C60 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0C64 @ =gStringVar2
	ldrh r1, [r4, 0x4]
	bl ConvertEasyChatWordsToString
	ldrb r1, [r4, 0x13]
	lsls r1, 25
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldr r1, _080C0C68 @ =gUnknown_020387E8
	movs r0, 0x5
	b _080C0D3C
	.align 2, 0
_080C0C60: .4byte gStringVar1
_080C0C64: .4byte gStringVar2
_080C0C68: .4byte gUnknown_020387E8
_080C0C6C:
	ldr r0, _080C0C98 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x13]
	lsls r1, 29
	lsrs r1, 29
	movs r0, 0x1
	bl CopyContestCategoryToStringVar
	ldr r0, _080C0C9C @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl ConvertEasyChatWordsToString
	ldrh r0, [r4, 0x14]
	cmp r0, 0
	beq _080C0CA4
	ldr r1, _080C0CA0 @ =gUnknown_020387E8
	movs r0, 0x6
	b _080C0D3C
	.align 2, 0
_080C0C98: .4byte gStringVar1
_080C0C9C: .4byte gStringVar3
_080C0CA0: .4byte gUnknown_020387E8
_080C0CA4:
	ldr r1, _080C0CAC @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0D3C
	.align 2, 0
_080C0CAC: .4byte gUnknown_020387E8
_080C0CB0:
	ldr r0, _080C0CE0 @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0CE4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0CE8 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C0CEC @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C0CF0 @ =gStringVar3
	ldrh r1, [r4, 0x6]
	bl ConvertEasyChatWordsToString
	ldr r1, _080C0CF4 @ =gUnknown_020387E8
	movs r0, 0x7
	b _080C0D3C
	.align 2, 0
_080C0CE0: .4byte gStringVar1
_080C0CE4: .4byte gSpeciesNames
_080C0CE8: .4byte gStringVar2
_080C0CEC: .4byte gMoveNames
_080C0CF0: .4byte gStringVar3
_080C0CF4: .4byte gUnknown_020387E8
_080C0CF8:
	ldr r0, _080C0D1C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x16
	ldrb r2, [r4, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C0D20 @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0D24 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
	b _080C0D3E
	.align 2, 0
_080C0D1C: .4byte gStringVar1
_080C0D20: .4byte gStringVar2
_080C0D24: .4byte gSpeciesNames
_080C0D28:
	ldr r0, _080C0D50 @ =gStringVar1
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0D54 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C0D38:
	ldr r1, _080C0D58 @ =gUnknown_020387E8
	movs r0, 0x2
_080C0D3C:
	strb r0, [r1]
_080C0D3E:
	ldr r0, _080C0D5C @ =gUnknown_083D1524
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0D50: .4byte gStringVar1
_080C0D54: .4byte gSpeciesNames
_080C0D58: .4byte gUnknown_020387E8
_080C0D5C: .4byte gUnknown_083D1524
	thumb_func_end DoTVShowBravoTrainerPokemonProfile

	thumb_func_start DoTVShowBravoTrainerBattleTowerProfile
DoTVShowBravoTrainerBattleTowerProfile: @ 80C0D60
	push {r4,r5,lr}
	ldr r0, _080C0D8C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0D90 @ =0x02027e6c
	adds r4, r0, r1
	ldr r1, _080C0D94 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0D98 @ =gUnknown_020387E8
	ldrb r5, [r0]
	adds r2, r0, 0
	cmp r5, 0xE
	bls _080C0D82
	b _080C0FA2
_080C0D82:
	lsls r0, r5, 2
	ldr r1, _080C0D9C @ =_080C0DA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0D8C: .4byte gSpecialVar_0x8004
_080C0D90: .4byte 0x02027e6c
_080C0D94: .4byte gScriptResult
_080C0D98: .4byte gUnknown_020387E8
_080C0D9C: .4byte _080C0DA0
	.align 2, 0
_080C0DA0:
	.4byte _080C0DDC
	.4byte _080C0E20
	.4byte _080C0E50
	.4byte _080C0E74
	.4byte _080C0EA0
	.4byte _080C0EE8
	.4byte _080C0EF4
	.4byte _080C0F00
	.4byte _080C0F06
	.4byte _080C0F06
	.4byte _080C0F06
	.4byte _080C0F20
	.4byte _080C0F4C
	.4byte _080C0F4C
	.4byte _080C0F84
_080C0DDC:
	ldr r0, _080C0E04 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0E08 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0E0C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrh r0, [r4, 0x16]
	cmp r0, 0x6
	bls _080C0E14
	ldr r1, _080C0E10 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0E04: .4byte gStringVar1
_080C0E08: .4byte gStringVar2
_080C0E0C: .4byte gSpeciesNames
_080C0E10: .4byte gUnknown_020387E8
_080C0E14:
	ldr r1, _080C0E1C @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0E1C: .4byte gUnknown_020387E8
_080C0E20:
	ldrb r1, [r4, 0x1A]
	movs r0, 0
	bl sub_80BF088
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	bl sub_80BF088
	ldrb r0, [r4, 0x1C]
	cmp r0, 0x1
	bne _080C0E44
	ldr r1, _080C0E40 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0E40: .4byte gUnknown_020387E8
_080C0E44:
	ldr r1, _080C0E4C @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0E4C: .4byte gUnknown_020387E8
_080C0E50:
	ldr r0, _080C0E70 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldrh r1, [r4, 0x16]
	adds r1, 0x1
	movs r0, 0x1
	bl sub_80BF088
_080C0E66:
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	beq _080C0EC2
	b _080C0EDC
	.align 2, 0
_080C0E70: .4byte gStringVar1
_080C0E74:
	ldr r0, _080C0E94 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0E98 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0E9C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	b _080C0E66
	.align 2, 0
_080C0E94: .4byte gStringVar1
_080C0E98: .4byte gStringVar2
_080C0E9C: .4byte gSpeciesNames
_080C0EA0:
	ldr r0, _080C0ECC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0ED0 @ =gStringVar2
	ldrh r2, [r4, 0x14]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0ED4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0EDC
_080C0EC2:
	ldr r1, _080C0ED8 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0ECC: .4byte gStringVar1
_080C0ED0: .4byte gStringVar2
_080C0ED4: .4byte gSpeciesNames
_080C0ED8: .4byte gUnknown_020387E8
_080C0EDC:
	ldr r1, _080C0EE4 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0EE4: .4byte gUnknown_020387E8
_080C0EE8:
	ldr r0, _080C0EF0 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0F0A
	.align 2, 0
_080C0EF0: .4byte gStringVar1
_080C0EF4:
	ldr r0, _080C0EFC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0xC
	b _080C0F0A
	.align 2, 0
_080C0EFC: .4byte gStringVar1
_080C0F00:
	movs r0, 0xB
	strb r0, [r2]
	b _080C0FA2
_080C0F06:
	ldr r0, _080C0F18 @ =gStringVar1
	adds r1, r4, 0x2
_080C0F0A:
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r1, _080C0F1C @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0F18: .4byte gStringVar1
_080C0F1C: .4byte gUnknown_020387E8
_080C0F20:
	ldr r0, _080C0F38 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl ConvertEasyChatWordsToString
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _080C0F40
	ldr r1, _080C0F3C @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0F38: .4byte gStringVar1
_080C0F3C: .4byte gUnknown_020387E8
_080C0F40:
	ldr r1, _080C0F48 @ =gUnknown_020387E8
	movs r0, 0xD
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0F48: .4byte gUnknown_020387E8
_080C0F4C:
	ldr r0, _080C0F74 @ =gStringVar1
	ldrh r1, [r4, 0x18]
	bl ConvertEasyChatWordsToString
	ldr r0, _080C0F78 @ =gStringVar2
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0F7C @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0xC
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r1, _080C0F80 @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C0FA2
	.align 2, 0
_080C0F74: .4byte gStringVar1
_080C0F78: .4byte gStringVar2
_080C0F7C: .4byte gStringVar3
_080C0F80: .4byte gUnknown_020387E8
_080C0F84:
	ldr r0, _080C0FB4 @ =gStringVar1
	adds r1, r4, 0x2
	ldrb r2, [r4, 0x1D]
	bl TVShowConvertInternationalString
	ldr r0, _080C0FB8 @ =gStringVar2
	ldrh r2, [r4, 0xA]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C0FBC @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C0FA2:
	ldr r0, _080C0FC0 @ =gUnknown_083D1548
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0FB4: .4byte gStringVar1
_080C0FB8: .4byte gStringVar2
_080C0FBC: .4byte gSpeciesNames
_080C0FC0: .4byte gUnknown_083D1548
	thumb_func_end DoTVShowBravoTrainerBattleTowerProfile

	thumb_func_start DoTVShowTodaysSmartShopper
DoTVShowTodaysSmartShopper: @ 80C0FC4
	push {r4-r6,lr}
	ldr r0, _080C0FF0 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C0FF4 @ =0x02027e6c
	adds r5, r0, r1
	ldr r1, _080C0FF8 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C0FFC @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xC
	bls _080C0FE6
	b _080C11D8
_080C0FE6:
	lsls r0, r6, 2
	ldr r1, _080C1000 @ =_080C1004
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0FF0: .4byte gSpecialVar_0x8004
_080C0FF4: .4byte 0x02027e6c
_080C0FF8: .4byte gScriptResult
_080C0FFC: .4byte gUnknown_020387E8
_080C1000: .4byte _080C1004
	.align 2, 0
_080C1004:
	.4byte _080C1038
	.4byte _080C1074
	.4byte _080C10BC
	.4byte _080C10CE
	.4byte _080C10BC
	.4byte _080C10BC
	.4byte _080C10F8
	.4byte _080C1128
	.4byte _080C1158
	.4byte _080C1164
	.4byte _080C1172
	.4byte _080C1184
	.4byte _080C11C8
_080C1038:
	ldr r0, _080C105C @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r0, _080C1060 @ =gStringVar2
	ldrb r1, [r5, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C1068
	ldr r1, _080C1064 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C105C: .4byte gStringVar1
_080C1060: .4byte gStringVar2
_080C1064: .4byte gUnknown_020387E8
_080C1068:
	ldr r1, _080C1070 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C1070: .4byte gUnknown_020387E8
_080C1074:
	ldr r0, _080C10B0 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C10B4 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xC]
	movs r0, 0x2
	bl sub_80BF088
	ldr r4, _080C10B8 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C11D8
	.align 2, 0
_080C10B0: .4byte gStringVar1
_080C10B4: .4byte gStringVar2
_080C10B8: .4byte gUnknown_020387E8
_080C10BC:
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C10C8
	movs r0, 0x6
	strb r0, [r2]
	b _080C11D8
_080C10C8:
	movs r0, 0xA
	strb r0, [r2]
	b _080C11D8
_080C10CE:
	ldrh r1, [r5, 0xC]
	adds r1, 0x1
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _080C10EC
	ldr r1, _080C10E8 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C10E8: .4byte gUnknown_020387E8
_080C10EC:
	ldr r1, _080C10F4 @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C10F4: .4byte gUnknown_020387E8
_080C10F8:
	ldr r4, _080C1120 @ =gStringVar2
	ldrh r0, [r5, 0x8]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0xE]
	movs r0, 0x2
	bl sub_80BF088
	ldrh r0, [r5, 0xA]
	cmp r0, 0
	beq _080C1140
	ldr r1, _080C1124 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C1120: .4byte gStringVar2
_080C1124: .4byte gUnknown_020387E8
_080C1128:
	ldr r4, _080C1150 @ =gStringVar2
	ldrh r0, [r5, 0xA]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF088
_080C1140:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	beq _080C11A6
	ldr r1, _080C1154 @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C1150: .4byte gStringVar2
_080C1154: .4byte gUnknown_020387E8
_080C1158:
	ldrh r0, [r5, 0xC]
	cmp r0, 0xFE
	bls _080C117E
	movs r0, 0xC
	strb r0, [r2]
	b _080C11D8
_080C1164:
	movs r0, 0x1
	adds r1, r5, 0
	bl sub_80BF154
	bl TVShowDone
	b _080C11D8
_080C1172:
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C117E
	movs r0, 0x8
	strb r0, [r2]
	b _080C11D8
_080C117E:
	movs r0, 0x9
	strb r0, [r2]
	b _080C11D8
_080C1184:
	ldr r0, _080C11B0 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C11B4 @ =gStringVar2
	ldrh r0, [r5, 0x6]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r0, [r5, 0x2]
	cmp r0, 0x1
	bne _080C11BC
_080C11A6:
	ldr r1, _080C11B8 @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C11B0: .4byte gStringVar1
_080C11B4: .4byte gStringVar2
_080C11B8: .4byte gUnknown_020387E8
_080C11BC:
	ldr r1, _080C11C4 @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C11D8
	.align 2, 0
_080C11C4: .4byte gUnknown_020387E8
_080C11C8:
	ldr r0, _080C11EC @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	bl TVShowDone
_080C11D8:
	ldr r0, _080C11F0 @ =gUnknown_083D14F0
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C11EC: .4byte gStringVar1
_080C11F0: .4byte gUnknown_083D14F0
	thumb_func_end DoTVShowTodaysSmartShopper

	thumb_func_start DoTVShowTheNameRaterShow
DoTVShowTheNameRaterShow: @ 80C11F4
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080C1224 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1228 @ =0x02027e6c
	adds r6, r0, r1
	ldr r1, _080C122C @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C1230 @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r2, r0, 0
	cmp r7, 0x12
	bls _080C1218
	b _080C154E
_080C1218:
	lsls r0, r7, 2
	ldr r1, _080C1234 @ =_080C1238
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1224: .4byte gSpecialVar_0x8004
_080C1228: .4byte 0x02027e6c
_080C122C: .4byte gScriptResult
_080C1230: .4byte gUnknown_020387E8
_080C1234: .4byte _080C1238
	.align 2, 0
_080C1238:
	.4byte _080C1284
	.4byte _080C12CC
	.4byte _080C12EE
	.4byte _080C12CC
	.4byte _080C12CC
	.4byte _080C12CC
	.4byte _080C12CC
	.4byte _080C12CC
	.4byte _080C12CC
	.4byte _080C1334
	.4byte _080C1334
	.4byte _080C1334
	.4byte _080C1530
	.4byte _080C1390
	.4byte _080C13EC
	.4byte _080C1440
	.4byte _080C1498
	.4byte _080C14D8
	.4byte _080C1534
_080C1284:
	ldr r0, _080C12B8 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl TVShowConvertInternationalString
	ldr r0, _080C12BC @ =gStringVar2
	ldrh r2, [r6, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C12C0 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C12C4 @ =gStringVar3
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	bl TVShowConvertInternationalString
	ldr r4, _080C12C8 @ =gUnknown_020387E8
	adds r0, r6, 0
	bl sub_80BF7E8
	adds r0, 0x1
	strb r0, [r4]
	b _080C154E
	.align 2, 0
_080C12B8: .4byte gStringVar1
_080C12BC: .4byte gStringVar2
_080C12C0: .4byte gSpeciesNames
_080C12C4: .4byte gStringVar3
_080C12C8: .4byte gUnknown_020387E8
_080C12CC:
	ldrb r0, [r6, 0x1A]
	cmp r0, 0
	bne _080C12D8
	movs r0, 0x9
	strb r0, [r2]
	b _080C154E
_080C12D8:
	cmp r0, 0x1
	bne _080C12E2
	movs r0, 0xA
	strb r0, [r2]
	b _080C154E
_080C12E2:
	cmp r0, 0x2
	beq _080C12E8
	b _080C154E
_080C12E8:
	movs r0, 0xB
	strb r0, [r2]
	b _080C154E
_080C12EE:
	ldr r0, _080C1308 @ =gStringVar1
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl TVShowConvertInternationalString
	ldrb r0, [r6, 0x1A]
	cmp r0, 0
	bne _080C1310
	ldr r1, _080C130C @ =gUnknown_020387E8
	movs r0, 0x9
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C1308: .4byte gStringVar1
_080C130C: .4byte gUnknown_020387E8
_080C1310:
	cmp r0, 0x1
	bne _080C1320
	ldr r1, _080C131C @ =gUnknown_020387E8
	movs r0, 0xA
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C131C: .4byte gUnknown_020387E8
_080C1320:
	cmp r0, 0x2
	beq _080C1326
	b _080C154E
_080C1326:
	ldr r1, _080C1330 @ =gUnknown_020387E8
	movs r0, 0xB
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C1330: .4byte gUnknown_020387E8
_080C1334:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1380 @ =gStringVar3
	ldr r4, _080C1384 @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1388 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	adds r0, r4, 0
	bl TVShowConvertInternationalString
	ldr r1, _080C138C @ =gUnknown_020387E8
	movs r0, 0xC
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C1380: .4byte gStringVar3
_080C1384: .4byte gStringVar1
_080C1388: .4byte gStringVar2
_080C138C: .4byte gUnknown_020387E8
_080C1390:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C13DC @ =gStringVar3
	ldr r4, _080C13E0 @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_80BF820
	ldr r0, _080C13E4 @ =gStringVar2
	ldrb r2, [r6, 0x1E]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	adds r0, r4, 0
	bl TVShowConvertInternationalString
	ldr r1, _080C13E8 @ =gUnknown_020387E8
	movs r0, 0xE
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C13DC: .4byte gStringVar3
_080C13E0: .4byte gStringVar1
_080C13E4: .4byte gStringVar2
_080C13E8: .4byte gUnknown_020387E8
_080C13EC:
	movs r5, 0
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_80BF820
	ldr r0, _080C1434 @ =gStringVar3
	ldr r4, _080C1438 @ =gStringVar1
	ldrb r2, [r6, 0x1E]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	str r5, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C143C @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	adds r0, r4, 0
	bl TVShowConvertInternationalString
	b _080C1518
	.align 2, 0
_080C1434: .4byte gStringVar3
_080C1438: .4byte gStringVar1
_080C143C: .4byte gStringVar2
_080C1440:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1488 @ =gStringVar1
	ldr r4, _080C148C @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	ldrh r1, [r6, 0x2]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080C1490 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldrh r0, [r6, 0x2]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80BF820
	ldr r1, _080C1494 @ =gUnknown_020387E8
	movs r0, 0x10
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C1488: .4byte gStringVar1
_080C148C: .4byte gStringVar2
_080C1490: .4byte gSpeciesNames
_080C1494: .4byte gUnknown_020387E8
_080C1498:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C14CC @ =gStringVar3
	ldr r1, _080C14D0 @ =gStringVar1
	ldrb r2, [r6, 0x1F]
	bl TVShowConvertInternationalString
	ldrh r0, [r6, 0x2]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80BF820
	ldr r1, _080C14D4 @ =gUnknown_020387E8
	movs r0, 0x11
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C14CC: .4byte gStringVar3
_080C14D0: .4byte gStringVar1
_080C14D4: .4byte gUnknown_020387E8
_080C14D8:
	movs r0, 0
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80BF820
	ldr r0, _080C1520 @ =gStringVar1
	ldr r4, _080C1524 @ =gStringVar2
	ldrb r2, [r6, 0x1F]
	adds r1, r4, 0
	bl TVShowConvertInternationalString
	ldrh r0, [r6, 0x1C]
	str r0, [sp]
	str r6, [sp, 0x4]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80BF820
	ldrh r1, [r6, 0x1C]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080C1528 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
_080C1518:
	ldr r1, _080C152C @ =gUnknown_020387E8
	movs r0, 0x12
	strb r0, [r1]
	b _080C154E
	.align 2, 0
_080C1520: .4byte gStringVar1
_080C1524: .4byte gStringVar2
_080C1528: .4byte gSpeciesNames
_080C152C: .4byte gUnknown_020387E8
_080C1530:
	movs r7, 0x12
	strb r7, [r2]
_080C1534:
	ldr r0, _080C1564 @ =gStringVar1
	adds r1, r6, 0x4
	ldrb r2, [r6, 0x1F]
	bl TVShowConvertInternationalString
	ldr r0, _080C1568 @ =gStringVar2
	adds r1, r6, 0
	adds r1, 0xF
	ldrb r2, [r6, 0x1E]
	bl TVShowConvertInternationalString
	bl TVShowDone
_080C154E:
	ldr r0, _080C156C @ =gUnknown_083D1584
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1564: .4byte gStringVar1
_080C1568: .4byte gStringVar2
_080C156C: .4byte gUnknown_083D1584
	thumb_func_end DoTVShowTheNameRaterShow

	thumb_func_start DoTVShowPokemonTodaySuccessfulCapture
DoTVShowPokemonTodaySuccessfulCapture: @ 80C1570
	push {r4-r6,lr}
	ldr r0, _080C159C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C15A0 @ =0x02027e6c
	adds r5, r0, r1
	ldr r1, _080C15A4 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C15A8 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r2, r0, 0
	cmp r6, 0xB
	bls _080C1592
	b _080C17A0
_080C1592:
	lsls r0, r6, 2
	ldr r1, _080C15AC @ =_080C15B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C159C: .4byte gSpecialVar_0x8004
_080C15A0: .4byte 0x02027e6c
_080C15A4: .4byte gScriptResult
_080C15A8: .4byte gUnknown_020387E8
_080C15AC: .4byte _080C15B0
	.align 2, 0
_080C15B0:
	.4byte _080C15E0
	.4byte _080C1634
	.4byte _080C163A
	.4byte _080C1674
	.4byte _080C16AC
	.4byte _080C16B2
	.4byte _080C16E8
	.4byte _080C173C
	.4byte _080C173C
	.4byte _080C176C
	.4byte _080C176C
	.4byte _080C179C
_080C15E0:
	ldr r0, _080C1614 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C1618 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C161C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1620 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldrb r0, [r5, 0xF]
	cmp r0, 0x1
	bne _080C1628
	ldr r1, _080C1624 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C17A0
	.align 2, 0
_080C1614: .4byte gStringVar1
_080C1618: .4byte gStringVar2
_080C161C: .4byte gSpeciesNames
_080C1620: .4byte gStringVar3
_080C1624: .4byte gUnknown_020387E8
_080C1628:
	ldr r1, _080C1630 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C17A0
	.align 2, 0
_080C1630: .4byte gUnknown_020387E8
_080C1634:
	movs r0, 0x2
	strb r0, [r2]
	b _080C17A0
_080C163A:
	ldr r4, _080C1660 @ =gStringVar2
	ldrb r0, [r5, 0xF]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldrb r1, [r5, 0x12]
	movs r0, 0x2
	bl sub_80BF088
	ldrb r0, [r5, 0x12]
	cmp r0, 0x3
	bhi _080C1668
	ldr r1, _080C1664 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C17A0
	.align 2, 0
_080C1660: .4byte gStringVar2
_080C1664: .4byte gUnknown_020387E8
_080C1668:
	ldr r1, _080C1670 @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C17A0
	.align 2, 0
_080C1670: .4byte gUnknown_020387E8
_080C1674:
	ldr r0, _080C169C @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C16A0 @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C16A4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C16A8 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	b _080C16CE
	.align 2, 0
_080C169C: .4byte gStringVar1
_080C16A0: .4byte gStringVar2
_080C16A4: .4byte gSpeciesNames
_080C16A8: .4byte gStringVar3
_080C16AC:
	movs r0, 0x6
	strb r0, [r2]
	b _080C17A0
_080C16B2:
	ldr r0, _080C16D8 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C16DC @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C16E0 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
_080C16CE:
	ldr r1, _080C16E4 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C17A0
	.align 2, 0
_080C16D8: .4byte gStringVar1
_080C16DC: .4byte gStringVar2
_080C16E0: .4byte gSpeciesNames
_080C16E4: .4byte gUnknown_020387E8
_080C16E8:
	ldr r0, _080C1728 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x13
	ldrb r2, [r5, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C172C @ =gStringVar2
	ldrh r2, [r5, 0x10]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1730 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1734 @ =gStringVar3
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldr r4, _080C1738 @ =gUnknown_020387E8
	bl Random
	ldrb r2, [r4]
	adds r2, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, r2
	strb r0, [r4]
	b _080C17A0
	.align 2, 0
_080C1728: .4byte gStringVar1
_080C172C: .4byte gStringVar2
_080C1730: .4byte gSpeciesNames
_080C1734: .4byte gStringVar3
_080C1738: .4byte gUnknown_020387E8
_080C173C:
	ldr r0, _080C1760 @ =gStringVar1
	ldrh r1, [r5, 0x10]
	movs r4, 0xB
	muls r1, r4
	ldr r2, _080C1764 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1768 @ =gStringVar2
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
	ldrh r1, [r5, 0x10]
	movs r0, 0x2
	bl sub_80BF638
	b _080C1786
	.align 2, 0
_080C1760: .4byte gStringVar1
_080C1764: .4byte gSpeciesNames
_080C1768: .4byte gStringVar2
_080C176C:
	ldr r0, _080C178C @ =gStringVar1
	ldrh r1, [r5, 0x10]
	movs r4, 0xB
	muls r1, r4
	ldr r2, _080C1790 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1794 @ =gStringVar2
	adds r1, r5, 0x4
	ldrb r2, [r5, 0x3]
	bl TVShowConvertInternationalString
_080C1786:
	ldr r0, _080C1798 @ =gUnknown_020387E8
	strb r4, [r0]
	b _080C17A0
	.align 2, 0
_080C178C: .4byte gStringVar1
_080C1790: .4byte gSpeciesNames
_080C1794: .4byte gStringVar2
_080C1798: .4byte gUnknown_020387E8
_080C179C:
	bl TVShowDone
_080C17A0:
	ldr r0, _080C17B4 @ =gUnknown_083D14C0
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C17B4: .4byte gUnknown_083D14C0
	thumb_func_end DoTVShowPokemonTodaySuccessfulCapture

	thumb_func_start DoTVShowPokemonTodayFailedCapture
DoTVShowPokemonTodayFailedCapture: @ 80C17B8
	push {r4,r5,lr}
	ldr r0, _080C17E4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C17E8 @ =0x02027e6c
	adds r4, r0, r1
	ldr r1, _080C17EC @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C17F0 @ =gUnknown_020387E8
	ldrb r5, [r0]
	cmp r5, 0x6
	bls _080C17D8
	b _080C1900
_080C17D8:
	lsls r0, r5, 2
	ldr r1, _080C17F4 @ =_080C17F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C17E4: .4byte gSpecialVar_0x8004
_080C17E8: .4byte 0x02027e6c
_080C17EC: .4byte gScriptResult
_080C17F0: .4byte gUnknown_020387E8
_080C17F4: .4byte _080C17F8
	.align 2, 0
_080C17F8:
	.4byte _080C1814
	.4byte _080C1848
	.4byte _080C189C
	.4byte _080C189C
	.4byte _080C18E0
	.4byte _080C18E0
	.4byte _080C18FC
_080C1814:
	ldr r0, _080C1838 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C183C @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1840 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080C1844 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1900
	.align 2, 0
_080C1838: .4byte gStringVar1
_080C183C: .4byte gStringVar2
_080C1840: .4byte gSpeciesNames
_080C1844: .4byte gUnknown_020387E8
_080C1848:
	ldr r0, _080C187C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldr r0, _080C1880 @ =gStringVar2
	ldrb r1, [r4, 0x12]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1884 @ =gStringVar3
	ldrh r2, [r4, 0xE]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1888 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r0, [r4, 0x11]
	cmp r0, 0x1
	bne _080C1890
	ldr r1, _080C188C @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C1900
	.align 2, 0
_080C187C: .4byte gStringVar1
_080C1880: .4byte gStringVar2
_080C1884: .4byte gStringVar3
_080C1888: .4byte gSpeciesNames
_080C188C: .4byte gUnknown_020387E8
_080C1890:
	ldr r1, _080C1898 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1900
	.align 2, 0
_080C1898: .4byte gUnknown_020387E8
_080C189C:
	ldr r0, _080C18CC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldrb r1, [r4, 0x10]
	movs r0, 0x1
	bl sub_80BF088
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080C18D4
	ldr r1, _080C18D0 @ =gUnknown_020387E8
	movs r0, 0x5
	strb r0, [r1]
	b _080C1900
	.align 2, 0
_080C18CC: .4byte gStringVar1
_080C18D0: .4byte gUnknown_020387E8
_080C18D4:
	ldr r1, _080C18DC @ =gUnknown_020387E8
	movs r0, 0x4
	strb r0, [r1]
	b _080C1900
	.align 2, 0
_080C18DC: .4byte gUnknown_020387E8
_080C18E0:
	ldr r0, _080C18F4 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x2]
	bl TVShowConvertInternationalString
	ldr r1, _080C18F8 @ =gUnknown_020387E8
	movs r0, 0x6
	strb r0, [r1]
	b _080C1900
	.align 2, 0
_080C18F4: .4byte gStringVar1
_080C18F8: .4byte gUnknown_020387E8
_080C18FC:
	bl TVShowDone
_080C1900:
	ldr r0, _080C1914 @ =gUnknown_083D15D0
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C1914: .4byte gUnknown_083D15D0
	thumb_func_end DoTVShowPokemonTodayFailedCapture

	thumb_func_start DoTVShowPokemonFanClubLetter
DoTVShowPokemonFanClubLetter: @ 80C1918
	push {r4-r7,lr}
	ldr r0, _080C1944 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1948 @ =0x02027e6c
	adds r5, r0, r1
	ldr r1, _080C194C @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C1950 @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r6, r0, 0
	cmp r7, 0x33
	bls _080C193A
	b _080C1B24
_080C193A:
	lsls r0, r7, 2
	ldr r1, _080C1954 @ =_080C1958
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1944: .4byte gSpecialVar_0x8004
_080C1948: .4byte 0x02027e6c
_080C194C: .4byte gScriptResult
_080C1950: .4byte gUnknown_020387E8
_080C1954: .4byte _080C1958
	.align 2, 0
_080C1958:
	.4byte _080C1A28
	.4byte _080C1A5C
	.4byte _080C1A88
	.4byte _080C1A8E
	.4byte _080C1AA6
	.4byte _080C1AA6
	.4byte _080C1AA6
	.4byte _080C1AB8
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1B24
	.4byte _080C1ADA
	.4byte _080C1B00
_080C1A28:
	ldr r0, _080C1A4C @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	ldrb r2, [r5, 0x18]
	bl TVShowConvertInternationalString
	ldr r0, _080C1A50 @ =gStringVar2
	ldrh r2, [r5, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1A54 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _080C1A58 @ =gUnknown_020387E8
	movs r0, 0x32
	strb r0, [r1]
	b _080C1B24
	.align 2, 0
_080C1A4C: .4byte gStringVar1
_080C1A50: .4byte gStringVar2
_080C1A54: .4byte gSpeciesNames
_080C1A58: .4byte gUnknown_020387E8
_080C1A5C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r2, r0, 0x1
	cmp r2, 0x1
	bne _080C1A7C
	ldr r1, _080C1A78 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1B24
	.align 2, 0
_080C1A78: .4byte gUnknown_020387E8
_080C1A7C:
	ldr r1, _080C1A84 @ =gUnknown_020387E8
	adds r0, r2, 0x2
	strb r0, [r1]
	b _080C1B24
	.align 2, 0
_080C1A84: .4byte gUnknown_020387E8
_080C1A88:
	movs r0, 0x33
	strb r0, [r6]
	b _080C1B24
_080C1A8E:
	bl Random
	ldrb r4, [r6]
	adds r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, r4
	strb r0, [r6]
	b _080C1B24
_080C1AA6:
	adds r0, r5, 0
	bl sub_80BF79C
	ldr r1, _080C1AB4 @ =gUnknown_020387E8
	movs r0, 0x7
	strb r0, [r1]
	b _080C1B24
	.align 2, 0
_080C1AB4: .4byte gUnknown_020387E8
_080C1AB8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	bl __umodsi3
	adds r0, 0x46
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0x2
	adds r1, r2, 0
	bl sub_80BF088
	bl TVShowDone
	b _080C1B24
_080C1ADA:
	ldr r4, _080C1AF8 @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80EB544
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1AFC @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1B30
	.align 2, 0
_080C1AF8: .4byte gStringVar4
_080C1AFC: .4byte gUnknown_020387E8
_080C1B00:
	ldr r4, _080C1B1C @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80EB544
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1B20 @ =gUnknown_020387E8
	movs r0, 0x3
	strb r0, [r1]
	b _080C1B30
	.align 2, 0
_080C1B1C: .4byte gStringVar4
_080C1B20: .4byte gUnknown_020387E8
_080C1B24:
	ldr r0, _080C1B38 @ =gUnknown_083D1470
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080C1B30:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1B38: .4byte gUnknown_083D1470
	thumb_func_end DoTVShowPokemonFanClubLetter

	thumb_func_start DoTVShowRecentHappenings
DoTVShowRecentHappenings: @ 80C1B3C
	push {r4-r7,lr}
	ldr r0, _080C1B68 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1B6C @ =0x02027e6c
	adds r5, r0, r1
	ldr r1, _080C1B70 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080C1B74 @ =gUnknown_020387E8
	ldrb r6, [r0]
	adds r7, r0, 0
	cmp r6, 0x32
	bls _080C1B5E
	b _080C1CB4
_080C1B5E:
	lsls r0, r6, 2
	ldr r1, _080C1B78 @ =_080C1B7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1B68: .4byte gSpecialVar_0x8004
_080C1B6C: .4byte 0x02027e6c
_080C1B70: .4byte gScriptResult
_080C1B74: .4byte gUnknown_020387E8
_080C1B78: .4byte _080C1B7C
	.align 2, 0
_080C1B7C:
	.4byte _080C1C48
	.4byte _080C1C6C
	.4byte _080C1C84
	.4byte _080C1C84
	.4byte _080C1C84
	.4byte _080C1C8A
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1CB4
	.4byte _080C1C90
_080C1C48:
	ldr r0, _080C1C64 @ =gStringVar1
	adds r1, r5, 0
	adds r1, 0x10
	ldrb r2, [r5, 0x18]
	bl TVShowConvertInternationalString
	adds r0, r5, 0
	bl sub_80BF79C
	ldr r1, _080C1C68 @ =gUnknown_020387E8
	movs r0, 0x32
	strb r0, [r1]
	b _080C1CB4
	.align 2, 0
_080C1C64: .4byte gStringVar1
_080C1C68: .4byte gUnknown_020387E8
_080C1C6C:
	bl Random
	ldrb r4, [r7]
	adds r4, 0x1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, r4
	strb r0, [r7]
	b _080C1CB4
_080C1C84:
	movs r0, 0x5
	strb r0, [r7]
	b _080C1CB4
_080C1C8A:
	bl TVShowDone
	b _080C1CB4
_080C1C90:
	ldr r4, _080C1CAC @ =gStringVar4
	adds r1, r5, 0x4
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_80EB544
	adds r0, r4, 0
	bl ShowFieldMessage
	ldr r1, _080C1CB0 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1CC0
	.align 2, 0
_080C1CAC: .4byte gStringVar4
_080C1CB0: .4byte gUnknown_020387E8
_080C1CB4:
	ldr r0, _080C1CC8 @ =gUnknown_083D1490
	lsls r1, r6, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
_080C1CC0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1CC8: .4byte gUnknown_083D1490
	thumb_func_end DoTVShowRecentHappenings

	thumb_func_start DoTVShowPokemonFanClubOpinions
DoTVShowPokemonFanClubOpinions: @ 80C1CCC
	push {r4-r6,lr}
	ldr r0, _080C1CF4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C1CF8 @ =0x02027e6c
	adds r4, r0, r1
	ldr r1, _080C1CFC @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r6, _080C1D00 @ =gUnknown_020387E8
	ldrb r5, [r6]
	cmp r5, 0x3
	bgt _080C1D04
	cmp r5, 0x1
	bge _080C1D4C
	cmp r5, 0
	beq _080C1D0A
	b _080C1D9A
	.align 2, 0
_080C1CF4: .4byte gSpecialVar_0x8004
_080C1CF8: .4byte 0x02027e6c
_080C1CFC: .4byte gScriptResult
_080C1D00: .4byte gUnknown_020387E8
_080C1D04:
	cmp r5, 0x4
	beq _080C1D84
	b _080C1D9A
_080C1D0A:
	ldr r0, _080C1D3C @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl TVShowConvertInternationalString
	ldr r0, _080C1D40 @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1D44 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1D48 @ =gStringVar3
	adds r1, r4, 0
	adds r1, 0x10
	ldrb r2, [r4, 0xE]
	bl TVShowConvertInternationalString
	ldrb r0, [r4, 0x4]
	lsrs r0, 4
	adds r0, 0x1
	strb r0, [r6]
	b _080C1D9A
	.align 2, 0
_080C1D3C: .4byte gStringVar1
_080C1D40: .4byte gStringVar2
_080C1D44: .4byte gSpeciesNames
_080C1D48: .4byte gStringVar3
_080C1D4C:
	ldr r0, _080C1D74 @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl TVShowConvertInternationalString
	ldr r0, _080C1D78 @ =gStringVar2
	ldrh r2, [r4, 0x2]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1D7C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1D80 @ =gStringVar3
	ldrh r1, [r4, 0x1C]
	bl ConvertEasyChatWordsToString
	movs r0, 0x4
	strb r0, [r6]
	b _080C1D9A
	.align 2, 0
_080C1D74: .4byte gStringVar1
_080C1D78: .4byte gStringVar2
_080C1D7C: .4byte gSpeciesNames
_080C1D80: .4byte gStringVar3
_080C1D84:
	ldr r0, _080C1DAC @ =gStringVar1
	adds r1, r4, 0x5
	ldrb r2, [r4, 0xD]
	bl TVShowConvertInternationalString
	ldr r0, _080C1DB0 @ =gStringVar3
	ldrh r1, [r4, 0x1E]
	bl ConvertEasyChatWordsToString
	bl TVShowDone
_080C1D9A:
	ldr r0, _080C1DB4 @ =gUnknown_083D14A8
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1DAC: .4byte gStringVar1
_080C1DB0: .4byte gStringVar3
_080C1DB4: .4byte gUnknown_083D14A8
	thumb_func_end DoTVShowPokemonFanClubOpinions

	thumb_func_start nullsub_22
nullsub_22: @ 80C1DB8
	bx lr
	thumb_func_end nullsub_22

	thumb_func_start DoTVShowPokemonNewsMassOutbreak
DoTVShowPokemonNewsMassOutbreak: @ 80C1DBC
	push {r4,lr}
	ldr r0, _080C1E04 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C1E08 @ =0x02027e6c
	adds r4, r0
	ldr r0, _080C1E0C @ =gStringVar1
	ldrb r1, [r4, 0x10]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1E10 @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C1E14 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
	bl StartMassOutbreak
	ldr r1, _080C1E18 @ =gUnknown_083D14BC
	ldr r0, _080C1E1C @ =gUnknown_020387E8
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl ShowFieldMessage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1E04: .4byte gSpecialVar_0x8004
_080C1E08: .4byte 0x02027e6c
_080C1E0C: .4byte gStringVar1
_080C1E10: .4byte gStringVar2
_080C1E14: .4byte gSpeciesNames
_080C1E18: .4byte gUnknown_083D14BC
_080C1E1C: .4byte gUnknown_020387E8
	thumb_func_end DoTVShowPokemonNewsMassOutbreak

	thumb_func_start DoTVShowInSearchOfTrainers
DoTVShowInSearchOfTrainers: @ 80C1E20
	push {r4-r7,lr}
	ldr r0, _080C1E40 @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080C1E44 @ =gUnknown_020387E8
	ldrb r7, [r0]
	adds r2, r0, 0
	cmp r7, 0x8
	bls _080C1E34
	b _080C1FBC
_080C1E34:
	lsls r0, r7, 2
	ldr r1, _080C1E48 @ =_080C1E4C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1E40: .4byte gScriptResult
_080C1E44: .4byte gUnknown_020387E8
_080C1E48: .4byte _080C1E4C
	.align 2, 0
_080C1E4C:
	.4byte _080C1E70
	.4byte _080C1EB4
	.4byte _080C1EBA
	.4byte _080C1F08
	.4byte _080C1F74
	.4byte _080C1F74
	.4byte _080C1F74
	.4byte _080C1F74
	.4byte _080C1F7A
_080C1E70:
	ldr r0, _080C1E94 @ =gStringVar1
	ldr r4, _080C1E98 @ =gSaveBlock1
	ldr r2, _080C1E9C @ =0x00002b18
	adds r1, r4, r2
	ldrb r1, [r1]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C1EA0 @ =0x00002b19
	adds r4, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	bls _080C1EA8
	ldr r1, _080C1EA4 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	b _080C1FBC
	.align 2, 0
_080C1E94: .4byte gStringVar1
_080C1E98: .4byte gSaveBlock1
_080C1E9C: .4byte 0x00002b18
_080C1EA0: .4byte 0x00002b19
_080C1EA4: .4byte gUnknown_020387E8
_080C1EA8:
	ldr r1, _080C1EB0 @ =gUnknown_020387E8
	movs r0, 0x2
	strb r0, [r1]
	b _080C1FBC
	.align 2, 0
_080C1EB0: .4byte gUnknown_020387E8
_080C1EB4:
	movs r0, 0x2
	strb r0, [r2]
	b _080C1FBC
_080C1EBA:
	ldr r0, _080C1ED0 @ =gSaveBlock1
	ldr r1, _080C1ED4 @ =0x00002b1a
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C1ED8
	movs r0, 0x4
	strb r0, [r2]
	b _080C1FBC
	.align 2, 0
_080C1ED0: .4byte gSaveBlock1
_080C1ED4: .4byte 0x00002b1a
_080C1ED8:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080C1EE6
	movs r0, 0x5
	strb r0, [r2]
	b _080C1FBC
_080C1EE6:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080C1EF4
	movs r0, 0x6
	strb r0, [r2]
	b _080C1FBC
_080C1EF4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080C1F02
	movs r0, 0x7
	strb r0, [r2]
	b _080C1FBC
_080C1F02:
	movs r0, 0x3
	strb r0, [r2]
	b _080C1FBC
_080C1F08:
	ldr r0, _080C1F4C @ =gStringVar1
	ldr r4, _080C1F50 @ =gSaveBlock1
	ldr r2, _080C1F54 @ =0x00002b10
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _080C1F58 @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _080C1F5C @ =gStringVar2
	ldr r2, _080C1F60 @ =0x00002b14
	adds r1, r4, r2
	ldrh r2, [r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080C1F64 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r0, _080C1F68 @ =gStringVar3
	ldr r1, _080C1F6C @ =0x00002b12
	adds r4, r1
	ldrh r1, [r4]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldr r1, _080C1F70 @ =gUnknown_020387E8
	movs r0, 0x8
	strb r0, [r1]
	b _080C1FBC
	.align 2, 0
_080C1F4C: .4byte gStringVar1
_080C1F50: .4byte gSaveBlock1
_080C1F54: .4byte 0x00002b10
_080C1F58: .4byte gSpeciesNames
_080C1F5C: .4byte gStringVar2
_080C1F60: .4byte 0x00002b14
_080C1F64: .4byte gMoveNames
_080C1F68: .4byte gStringVar3
_080C1F6C: .4byte 0x00002b12
_080C1F70: .4byte gUnknown_020387E8
_080C1F74:
	movs r0, 0x8
	strb r0, [r2]
	b _080C1FBC
_080C1F7A:
	ldr r0, _080C1FD0 @ =gStringVar1
	ldr r4, _080C1FD4 @ =gSaveBlock1
	ldr r2, _080C1FD8 @ =0x00002b16
	adds r1, r4, r2
	ldrh r1, [r1]
	bl ConvertEasyChatWordsToString
	ldr r0, _080C1FDC @ =gStringVar2
	ldr r2, _080C1FE0 @ =0x00002b10
	adds r1, r4, r2
	ldrh r1, [r1]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _080C1FE4 @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _080C1FE8 @ =gStringVar3
	ldr r1, _080C1FEC @ =0x00002b12
	adds r4, r1
	ldrh r1, [r4]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldr r1, _080C1FF0 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _080C1FF4 @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	bl TakeTVShowInSearchOfTrainersOffTheAir
_080C1FBC:
	ldr r0, _080C1FF8 @ =gUnknown_083D1600
	lsls r1, r7, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1FD0: .4byte gStringVar1
_080C1FD4: .4byte gSaveBlock1
_080C1FD8: .4byte 0x00002b16
_080C1FDC: .4byte gStringVar2
_080C1FE0: .4byte 0x00002b10
_080C1FE4: .4byte gSpeciesNames
_080C1FE8: .4byte gStringVar3
_080C1FEC: .4byte 0x00002b12
_080C1FF0: .4byte gScriptResult
_080C1FF4: .4byte gUnknown_020387E8
_080C1FF8: .4byte gUnknown_083D1600
	thumb_func_end DoTVShowInSearchOfTrainers

	thumb_func_start DoTVShowPokemonAngler
DoTVShowPokemonAngler: @ 80C1FFC
	push {r4,r5,lr}
	ldr r0, _080C2020 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C2024 @ =0x02027e6c
	adds r4, r0, r1
	ldr r0, _080C2028 @ =gScriptResult
	movs r1, 0
	strh r1, [r0]
	ldrb r0, [r4, 0x2]
	ldrb r2, [r4, 0x3]
	cmp r0, r2
	bcs _080C2030
	ldr r0, _080C202C @ =gUnknown_020387E8
	strb r1, [r0]
	b _080C2038
	.align 2, 0
_080C2020: .4byte gSpecialVar_0x8004
_080C2024: .4byte 0x02027e6c
_080C2028: .4byte gScriptResult
_080C202C: .4byte gUnknown_020387E8
_080C2030:
	ldr r1, _080C2044 @ =gUnknown_020387E8
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r1, 0
_080C2038:
	ldrb r5, [r0]
	cmp r5, 0
	beq _080C2048
	cmp r5, 0x1
	beq _080C2080
	b _080C20A8
	.align 2, 0
_080C2044: .4byte gUnknown_020387E8
_080C2048:
	ldr r0, _080C2074 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x6]
	bl TVShowConvertInternationalString
	ldr r0, _080C2078 @ =gStringVar2
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C207C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r1, [r4, 0x3]
	movs r0, 0x2
	bl sub_80BF088
	bl TVShowDone
	b _080C20A8
	.align 2, 0
_080C2074: .4byte gStringVar1
_080C2078: .4byte gStringVar2
_080C207C: .4byte gSpeciesNames
_080C2080:
	ldr r0, _080C20BC @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0x6]
	bl TVShowConvertInternationalString
	ldr r0, _080C20C0 @ =gStringVar2
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C20C4 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldrb r1, [r4, 0x2]
	movs r0, 0x2
	bl sub_80BF088
	bl TVShowDone
_080C20A8:
	ldr r0, _080C20C8 @ =gUnknown_083D15EC
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C20BC: .4byte gStringVar1
_080C20C0: .4byte gStringVar2
_080C20C4: .4byte gSpeciesNames
_080C20C8: .4byte gUnknown_083D15EC
	thumb_func_end DoTVShowPokemonAngler

	thumb_func_start DoTVShowTheWorldOfMasters
DoTVShowTheWorldOfMasters: @ 80C20CC
	push {r4-r6,lr}
	ldr r0, _080C20F4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C20F8 @ =0x02027e6c
	adds r4, r0, r1
	ldr r1, _080C20FC @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	ldr r6, _080C2100 @ =gUnknown_020387E8
	ldrb r5, [r6]
	cmp r5, 0x1
	beq _080C2130
	cmp r5, 0x1
	bgt _080C2104
	cmp r5, 0
	beq _080C210A
	b _080C217A
	.align 2, 0
_080C20F4: .4byte gSpecialVar_0x8004
_080C20F8: .4byte 0x02027e6c
_080C20FC: .4byte gScriptResult
_080C2100: .4byte gUnknown_020387E8
_080C2104:
	cmp r5, 0x2
	beq _080C2150
	b _080C217A
_080C210A:
	ldr r0, _080C212C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0xB]
	bl TVShowConvertInternationalString
	ldrh r1, [r4, 0x6]
	movs r0, 0x1
	bl sub_80BF088
	ldrh r1, [r4, 0x2]
	movs r0, 0x2
	bl sub_80BF088
	movs r0, 0x1
	strb r0, [r6]
	b _080C217A
	.align 2, 0
_080C212C: .4byte gStringVar1
_080C2130:
	ldr r0, _080C2148 @ =gStringVar1
	ldrh r2, [r4, 0x8]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C214C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	movs r0, 0x2
	strb r0, [r6]
	b _080C217A
	.align 2, 0
_080C2148: .4byte gStringVar1
_080C214C: .4byte gSpeciesNames
_080C2150:
	ldr r0, _080C218C @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x13
	ldrb r2, [r4, 0xB]
	bl TVShowConvertInternationalString
	ldr r0, _080C2190 @ =gStringVar2
	ldrb r1, [r4, 0xA]
	movs r2, 0
	bl sub_80FBFB4
	ldr r0, _080C2194 @ =gStringVar3
	ldrh r2, [r4, 0x4]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080C2198 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	bl TVShowDone
_080C217A:
	ldr r0, _080C219C @ =gUnknown_083D15F4
	lsls r1, r5, 2
	adds r1, r0
	ldr r0, [r1]
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C218C: .4byte gStringVar1
_080C2190: .4byte gStringVar2
_080C2194: .4byte gStringVar3
_080C2198: .4byte gSpeciesNames
_080C219C: .4byte gUnknown_083D15F4
	thumb_func_end DoTVShowTheWorldOfMasters

	thumb_func_start TVShowDone
TVShowDone: @ 80C21A0
	ldr r1, _080C21C4 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _080C21C8 @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	ldr r2, _080C21CC @ =gSaveBlock1
	ldr r0, _080C21D0 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080C21D4 @ =0x00002739
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C21C4: .4byte gScriptResult
_080C21C8: .4byte gUnknown_020387E8
_080C21CC: .4byte gSaveBlock1
_080C21D0: .4byte gSpecialVar_0x8004
_080C21D4: .4byte 0x00002739
	thumb_func_end TVShowDone

	thumb_func_start sub_80C2014
sub_80C2014: @ 80C21D8
	ldr r1, _080C21E0 @ =gUnknown_020387E8
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080C21E0: .4byte gUnknown_020387E8
	thumb_func_end sub_80C2014

	.align 2, 0 @ Don't pad with nop.
