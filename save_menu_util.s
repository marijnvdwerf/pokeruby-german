	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start HandleDrawSaveWindowInfo
HandleDrawSaveWindowInfo: @ 8094710
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	movs r6, 0xC
	bl sub_809473C
	lsls r0, 24
	cmp r0, 0
	beq _08094728
	movs r6, 0xD
_08094728:
	ldr r0, _080947A8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080947AC
	lsls r0, r5, 24
	lsrs r0, 24
	lsls r1, r4, 24
	lsrs r1, 24
	adds r2, r5, r6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r4, 0
	adds r3, 0xB
	lsls r3, 24
	lsrs r3, 24
	bl MenuDrawTextWindow
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r5, r0, 16
	asrs r0, 16
	lsls r1, r4, 16
	movs r2, 0x80
	lsls r2, 9
	adds r1, r2
	lsrs r4, r1, 16
	asrs r1, 16
	bl PrintSaveMapName
	lsls r5, 16
	asrs r5, 16
	lsls r1, r4, 16
	asrs r4, r1, 16
	movs r0, 0x80
	lsls r0, 10
	adds r1, r0
	asrs r1, 16
	adds r0, r5, 0
	bl PrintSavePlayerName
	adds r1, r4, 0x4
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl PrintSaveBadges
	adds r1, r4, 0x6
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl PrintSavePokedexCount
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl PrintSavePlayTime
	b _08094812
	.align 2, 0
_080947A8: .4byte 0x00000801
_080947AC:
	lsls r0, r5, 24
	lsrs r0, 24
	lsls r1, r4, 24
	lsrs r1, 24
	adds r2, r5, r6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r4, 0
	adds r3, 0x9
	lsls r3, 24
	lsrs r3, 24
	bl MenuDrawTextWindow
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r5, r0, 16
	asrs r0, 16
	lsls r1, r4, 16
	movs r2, 0x80
	lsls r2, 9
	adds r1, r2
	lsrs r4, r1, 16
	asrs r1, 16
	bl PrintSaveMapName
	lsls r5, 16
	asrs r5, 16
	lsls r1, r4, 16
	asrs r4, r1, 16
	movs r0, 0x80
	lsls r0, 10
	adds r1, r0
	asrs r1, 16
	adds r0, r5, 0
	bl PrintSavePlayerName
	adds r1, r4, 0x4
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl PrintSaveBadges
	adds r4, 0x6
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl PrintSavePlayTime
_08094812:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end HandleDrawSaveWindowInfo

	thumb_func_start sub_80946C8
sub_80946C8: @ 8094818
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r4, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	movs r6, 0xC
	bl sub_809473C
	lsls r0, 24
	cmp r0, 0
	beq _08094838
	movs r6, 0xD
_08094838:
	ldr r0, _08094860
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08094864
	lsls r0, r4, 24
	lsrs r0, 24
	lsls r1, r5, 24
	lsrs r1, 24
	adds r2, r4, r6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0xB
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	b _08094880
	.align 2, 0
_08094860: .4byte 0x00000801
_08094864:
	lsls r0, r7, 24
	lsrs r0, 24
	mov r2, r8
	lsls r1, r2, 24
	lsrs r1, 24
	adds r2, r7, r6
	lsls r2, 24
	lsrs r2, 24
	mov r3, r8
	adds r3, 0x9
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
_08094880:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80946C8

	thumb_func_start sub_809473C
sub_809473C: @ 809488C
	movs r0, 0x1
	bx lr
	thumb_func_end sub_809473C

	thumb_func_start PrintSavePlayerName
PrintSavePlayerName: @ 8094890
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080948C0
	lsls r1, r4, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r2, r5, 0
	bl MenuPrint
	ldr r0, _080948C4
	adds r4, 0xC
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint_RightAligned
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080948C0: .4byte gOtherText_Player
_080948C4: .4byte gSaveBlock2
	thumb_func_end PrintSavePlayerName

	thumb_func_start PrintSaveMapName
PrintSaveMapName: @ 80948C8
	push {r4,r5,lr}
	sub sp, 0x20
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080948FC
	ldrb r1, [r0, 0x14]
	mov r0, sp
	bl CopyMapName
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080948FC: .4byte gMapHeader
	thumb_func_end PrintSaveMapName

	thumb_func_start PrintSaveBadges
PrintSaveBadges: @ 8094900
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08094944
	lsls r1, r4, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r2, r5, 0
	bl MenuPrint
	bl GetBadgeCount
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r4, 0xC
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint_RightAligned
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094944: .4byte gOtherText_Badges
	thumb_func_end PrintSaveBadges

	thumb_func_start PrintSavePokedexCount
PrintSavePokedexCount: @ 8094948
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08094990
	lsls r1, r4, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r2, r5, 0
	bl MenuPrint
	bl GetPokedexSeenCount
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, sp
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, 0xC
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint_RightAligned
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094990: .4byte gOtherText_Pokedex
	thumb_func_end PrintSavePokedexCount

	thumb_func_start PrintSavePlayTime
PrintSavePlayTime: @ 8094994
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _080949D8
	lsls r1, r4, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r2, r5, 0
	bl MenuPrint
	ldr r0, _080949DC
	ldrh r1, [r0, 0xE]
	ldrb r2, [r0, 0x10]
	mov r0, sp
	movs r3, 0x1
	bl FormatPlayTime
	adds r4, 0xC
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint_RightAligned
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080949D8: .4byte gOtherText_PlayTime
_080949DC: .4byte gSaveBlock2
	thumb_func_end PrintSavePlayTime

	thumb_func_start GetBadgeCount
GetBadgeCount: @ 80949E0
	push {r4,r5,lr}
	movs r5, 0
	ldr r4, _08094A0C
_080949E6:
	lsls r0, r4, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080949FA
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080949FA:
	adds r4, 0x1
	ldr r0, _08094A10
	cmp r4, r0
	ble _080949E6
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08094A0C: .4byte 0x00000807
_08094A10: .4byte 0x0000080e
	thumb_func_end GetBadgeCount

	thumb_func_start GetPokedexSeenCount
GetPokedexSeenCount: @ 8094A14
	push {lr}
	bl IsNationalPokedex
	cmp r0, 0
	beq _08094A26
	movs r0, 0x1
	bl GetNationalPokedexCount
	b _08094A2C
_08094A26:
	movs r0, 0x1
	bl GetHoennPokedexCount
_08094A2C:
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GetPokedexSeenCount

	thumb_func_start FormatPlayTime
FormatPlayTime: @ 8094A34
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r4, 16
	lsrs r4, 16
	bl ConvertIntToDecimalString
	adds r5, r0, 0
	movs r0, 0
	strb r0, [r5]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0
	beq _08094A5E
	movs r0, 0xF0
	strb r0, [r5, 0x1]
	b _08094A60
_08094A5E:
	strb r4, [r5, 0x1]
_08094A60:
	movs r0, 0
	strb r0, [r5, 0x2]
	adds r5, 0x3
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FormatPlayTime

	.align 2, 0 @ Don't pad with nop.
