	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8090750
sub_8090750: @ 8090B54
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08090B7C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r6, [r0, 0xA]
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x6
	bhi _08090BA0
	lsls r0, 2
	ldr r1, _08090B80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08090B7C: .4byte gTasks
_08090B80: .4byte _08090B84
	.align 2, 0
_08090B84:
	.4byte _08090BA0
	.4byte _08090BE4
	.4byte _08090C60
	.4byte _08090CA4
	.4byte _08090D64
	.4byte _08090DBC
	.4byte _08090DF8
_08090BA0:
	ldr r0, _08090BD4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08090BAE
	b _08090E2A
_08090BAE:
	ldr r1, _08090BD8
	ldr r0, _08090BDC
	ldr r0, [r0, 0xC]
	str r0, [r1]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 1
	bl sub_8091060
	ldr r1, _08090BE0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	b _08090E2A
	.align 2, 0
_08090BD4: .4byte gPaletteFade
_08090BD8: .4byte gUnknown_03005CEC
_08090BDC: .4byte gMain
_08090BE0: .4byte gTasks
_08090BE4:
	ldr r0, _08090C44
	ldr r1, _08090C48
	bl LZ77UnCompVram
	ldr r0, _08090C4C
	ldr r4, _08090C50
	adds r1, r4, 0
	bl LZ77UnCompVram
	movs r2, 0
	lsls r5, r7, 2
	mov r12, r5
	movs r0, 0x80
	lsls r0, 6
	adds r6, r0, 0
	ldr r3, _08090C54
_08090C04:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r5, [r0]
	adds r1, r6, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _08090C04
	ldr r0, _08090C58
	mov r1, r12
	adds r4, r1, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xA]
	movs r2, 0xFF
	lsls r2, 2
	movs r1, 0x2
	bl sub_8091738
	bl ResetPaletteFade
	ldr r0, _08090C5C
	movs r1, 0x21
	movs r2, 0x9E
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08090E2A
	.align 2, 0
_08090C44: .4byte gPokedexMenu_Gfx
_08090C48: .4byte 0x06004000
_08090C4C: .4byte gUnknown_08E96BD4
_08090C50: .4byte 0x06007800
_08090C54: .4byte 0x0000027f
_08090C58: .4byte gTasks
_08090C5C: .4byte 0x08e879ca
_08090C60:
	ldr r4, _08090C90
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r2, _08090C94
	add r1, sp, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08090C98
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08090C9C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _08090CA0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08090DE4
	.align 2, 0
_08090C90: .4byte gWindowConfig_81E7064
_08090C94: .4byte 0x0600c000
_08090C98: .4byte 0x040000d4
_08090C9C: .4byte 0x81000100
_08090CA0: .4byte gTasks
_08090CA4:
	ldr r0, _08090CCC
	movs r1, 0x2
	movs r2, 0
	movs r3, 0xD0
	bl sub_8072BD8
	bl IsNationalPokedex
	cmp r0, 0
	bne _08090CD0
	adds r0, r6, 0
	bl NationalToHoennOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	movs r2, 0x3
	bl sub_8091154
	b _08090CDA
	.align 2, 0
_08090CCC: .4byte gDexText_RegisterComplete
_08090CD0:
	adds r0, r6, 0
	movs r1, 0xD
	movs r2, 0x3
	bl sub_8091154
_08090CDA:
	adds r0, r6, 0
	movs r1, 0x10
	movs r2, 0x3
	bl sub_80911C8
	ldr r0, _08090D50
	movs r1, 0x10
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _08090D54
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	ldr r0, _08090D58
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
	lsls r4, r6, 3
	adds r4, r6
	lsls r4, 2
	ldr r6, _08090D5C
	adds r5, r4, r6
	adds r0, r5, 0
	movs r1, 0x10
	movs r2, 0x5
	bl sub_8091304
	ldrh r0, [r5, 0xC]
	movs r1, 0x10
	movs r2, 0x7
	bl sub_8091458
	ldrh r0, [r5, 0xE]
	movs r1, 0x10
	movs r2, 0x9
	bl sub_8091564
	adds r6, 0x10
	adds r4, r6
	ldr r0, [r4]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	movs r1, 0xFF
	lsls r1, 2
	movs r0, 0xE
	bl sub_80917CC
	ldr r1, _08090D60
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08090DE4
	.align 2, 0
_08090D50: .4byte gDexText_UnknownPoke
_08090D54: .4byte gDexText_UnknownHeight
_08090D58: .4byte gDexText_UnknownWeight
_08090D5C: .4byte gPokedexEntries
_08090D60: .4byte gTasks
_08090D64:
	adds r0, r6, 0
	movs r1, 0x30
	movs r2, 0x38
	movs r3, 0
	bl sub_80918EC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08090DB0
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08090DB4
	ldr r0, [r0]
	bl SetVBlankCallback
	ldr r1, _08090DB8
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0xE]
	b _08090DE4
	.align 2, 0
_08090DB0: .4byte gSprites
_08090DB4: .4byte gUnknown_03005CEC
_08090DB8: .4byte gTasks
_08090DBC:
	ldr r0, _08090DEC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08090DF0
	ldr r2, _08090DF4
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r5, 0xE2
	lsls r5, 5
	adds r0, r5, 0
	strh r0, [r1]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r4
_08090DE4:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _08090E2A
	.align 2, 0
_08090DEC: .4byte 0x04000050
_08090DF0: .4byte 0x0400000e
_08090DF4: .4byte 0x00000f07
_08090DF8:
	ldr r0, _08090E34
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08090E2A
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl PlayCry1
	ldr r1, _08090E38
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0xC]
	strh r5, [r0, 0x10]
	ldr r1, _08090E3C
	str r1, [r0]
_08090E2A:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090E34: .4byte gPaletteFade
_08090E38: .4byte gTasks
_08090E3C: .4byte sub_8090A3C
	thumb_func_end sub_8090750

	thumb_func_start sub_8090A3C
sub_8090A3C: @ 8090E40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08090E90
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08090EA8
	ldr r0, _08090E94
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r3, _08090E98
	ldr r0, _08090E9C
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r2, _08090EA0
	str r2, [r0]
	ldr r0, _08090EA4
	str r0, [r1]
	b _08090F7E
	.align 2, 0
_08090E90: .4byte gMain
_08090E94: .4byte 0x0000fffc
_08090E98: .4byte gSprites
_08090E9C: .4byte gTasks
_08090EA0: .4byte sub_8090C28
_08090EA4: .4byte sub_8090B8C
_08090EA8:
	movs r0, 0x1
	mov r8, r0
	ands r0, r1
	lsls r7, r6, 2
	cmp r0, 0
	beq _08090F48
	ldr r0, _08090F04
	adds r1, r7, r6
	lsls r1, 3
	adds r5, r1, r0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08090F10
	ldrh r4, [r5, 0xA]
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _08090F08
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, 0x14
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r1, _08090F0C
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r1, 0x40
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	mov r0, r8
	strh r0, [r5, 0x10]
	movs r0, 0x15
	bl PlaySE
	b _08090F48
	.align 2, 0
_08090F04: .4byte gTasks
_08090F08: .4byte gPokedexEntries
_08090F0C: .4byte 0x06007aca
_08090F10:
	ldr r0, _08090F38
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _08090F3C
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08090F40
	str r1, [r0]
	ldr r0, _08090F44
	str r0, [r5]
	b _08090F7E
	.align 2, 0
_08090F38: .4byte 0x0000fffc
_08090F3C: .4byte gSprites
_08090F40: .4byte sub_8090C28
_08090F44: .4byte sub_8090B8C
_08090F48:
	ldr r1, _08090F6C
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xC]
	adds r1, 0x1
	strh r1, [r0, 0xC]
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	beq _08090F74
	ldr r0, _08090F70
	movs r1, 0x51
	movs r2, 0xE
	bl LoadPalette
	b _08090F7E
	.align 2, 0
_08090F6C: .4byte gTasks
_08090F70: .4byte 0x08e879ca
_08090F74:
	ldr r0, _08090F8C
	movs r1, 0x51
	movs r2, 0xE
	bl LoadPalette
_08090F7E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090F8C: .4byte 0x08e87a2a
	thumb_func_end sub_8090A3C

	thumb_func_start sub_8090B8C
sub_8090B8C: @ 8090F90
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08091018
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08091010
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0809101C
	ldr r1, _08091020
	movs r2, 0x80
	lsls r2, 4
	bl CpuSet
	bl sub_800D74C
	ldr r0, _08091024
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xA]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x22]
	lsls r1, 16
	ldrh r2, [r4, 0x20]
	orrs r1, r2
	ldrh r2, [r4, 0x26]
	lsls r2, 16
	ldrh r3, [r4, 0x24]
	orrs r2, r3
	ldr r5, _08091028
	movs r3, 0xE
	ldrsh r4, [r4, r3]
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r3, r5
	ldrb r4, [r3, 0x5]
	lsrs r4, 4
	bl species_and_otid_get_pal
	lsls r4, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	orrs r4, r1
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	bl DestroyTask
_08091010:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091018: .4byte gPaletteFade
_0809101C: .4byte gUnknown_08D00524
_08091020: .4byte 0x0600c000
_08091024: .4byte gTasks
_08091028: .4byte gSprites
	thumb_func_end sub_8090B8C

	thumb_func_start sub_8090C28
sub_8090C28: @ 809102C
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x77
	bgt _0809103E
	adds r0, r2, 0x2
	strh r0, [r1, 0x20]
_0809103E:
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0x78
	ble _0809104C
	subs r0, r2, 0x2
	strh r0, [r1, 0x20]
_0809104C:
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x4F
	bgt _0809105A
	adds r0, r2, 0x1
	strh r0, [r1, 0x22]
_0809105A:
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0x50
	ble _08091068
	subs r0, r2, 0x1
	strh r0, [r1, 0x22]
_08091068:
	pop {r0}
	bx r0
	thumb_func_end sub_8090C28

	thumb_func_start sub_8090C68
sub_8090C68: @ 809106C
	push {r4,r5,lr}
	ldr r4, _080910D4
	ldr r0, [r4]
	ldrb r1, [r0, 0x2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809112E
	ldr r5, _080910D8
	ldr r0, [r5]
	ldr r1, _080910DC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080910E8
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _080910E0
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, 0x14
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r5]
	ldr r1, _080910DC
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, _080910E4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r1, 0x40
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x15
	bl PlaySE
	b _0809112E
	.align 2, 0
_080910D4: .4byte gUnknown_0202FFBC
_080910D8: .4byte gPokedexView
_080910DC: .4byte 0x0000064e
_080910E0: .4byte gPokedexEntries
_080910E4: .4byte 0x06007aca
_080910E8:
	movs r0, 0x2
	movs r1, 0xD
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _08091134
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r2, 0x10
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r5]
	ldr r1, _08091138
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0809113C
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r1, 0x40
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0x15
	bl PlaySE
_0809112E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091134: .4byte gPokedexEntries
_08091138: .4byte 0x0000064e
_0809113C: .4byte 0x06007aca
	thumb_func_end sub_8090C68

	thumb_func_start GetPokemonCategory
GetPokemonCategory: @ 8091140
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08091154
	adds r0, r1
	bx lr
	.align 2, 0
_08091154: .4byte gPokedexEntries
	thumb_func_end GetPokemonCategory

	thumb_func_start sub_8090D54
sub_8090D54: @ 8091158
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _0809116E
	cmp r1, 0x1
	beq _08091180
	movs r0, 0x1
	b _0809118C
_0809116E:
	ldr r0, _0809117C
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _0809118C
	.align 2, 0
_0809117C: .4byte gPokedexEntries
_08091180:
	ldr r0, _08091190
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0xE]
_0809118C:
	pop {r1}
	bx r1
	.align 2, 0
_08091190: .4byte gPokedexEntries
	thumb_func_end sub_8090D54

	thumb_func_start sub_8090D90
sub_8090D90: @ 8091194
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r2, r1, 24
	adds r3, r2, 0
	ldr r1, _080911C8
	adds r0, r1
	lsrs r1, r0, 16
	lsrs r0, 19
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x7
	ands r1, r0
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r1
	lsrs r5, r0, 24
	movs r6, 0
	cmp r2, 0x1
	beq _08091228
	cmp r2, 0x1
	bgt _080911CC
	cmp r2, 0
	beq _080911D8
	b _0809130E
	.align 2, 0
_080911C8: .4byte 0xffff0000
_080911CC:
	cmp r3, 0x2
	beq _080912C0
	cmp r3, 0x3
	bne _080911D6
	b _08091300
_080911D6:
	b _0809130E
_080911D8:
	ldr r1, _08091218
	adds r0, r1, 0
	adds r0, 0x5C
	adds r0, r4, r0
	ldrb r2, [r0]
	ands r2, r5
	adds r7, r1, 0
	cmp r2, 0
	bne _080911EC
	b _0809130E
_080911EC:
	ldr r0, _0809121C
	ldr r3, _08091220
	adds r1, r0, r3
	adds r1, r4, r1
	ldrb r1, [r1]
	ands r1, r5
	adds r6, r0, 0
	cmp r2, r1
	bne _0809120C
	ldr r1, _08091224
	adds r0, r6, r1
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	beq _08091266
_0809120C:
	adds r1, r7, 0
	adds r1, 0x5C
	adds r1, r4, r1
	mvns r3, r5
	b _08091292
	.align 2, 0
_08091218: .4byte gSaveBlock2
_0809121C: .4byte gSaveBlock1
_08091220: .4byte 0x00000938
_08091224: .4byte 0x00003a8c
_08091228:
	ldr r1, _0809126C
	adds r0, r1, 0
	adds r0, 0x28
	adds r0, r4, r0
	ldrb r2, [r0]
	ands r2, r5
	adds r7, r1, 0
	cmp r2, 0
	beq _0809130E
	adds r0, r7, 0
	adds r0, 0x5C
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	ldr r6, _08091270
	cmp r2, r0
	bne _0809127C
	ldr r3, _08091274
	adds r0, r6, r3
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	bne _0809127C
	ldr r1, _08091278
	adds r0, r6, r1
	adds r0, r4, r0
	ldrb r0, [r0]
	ands r0, r5
	cmp r2, r0
	bne _0809127C
_08091266:
	movs r6, 0x1
	b _0809130E
	.align 2, 0
_0809126C: .4byte gSaveBlock2
_08091270: .4byte gSaveBlock1
_08091274: .4byte 0x00000938
_08091278: .4byte 0x00003a8c
_0809127C:
	adds r1, r7, 0
	adds r1, 0x28
	adds r1, r4, r1
	mvns r3, r5
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	adds r1, r7, 0
	adds r1, 0x5C
	adds r1, r4, r1
_08091292:
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080912B8
	adds r1, r6, r0
	adds r1, r4, r1
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _080912BC
	adds r0, r6, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	movs r6, 0
	b _0809130E
	.align 2, 0
_080912B8: .4byte 0x00000938
_080912BC: .4byte 0x00003a8c
_080912C0:
	ldr r1, _080912F0
	adds r1, 0x5C
	adds r1, r4, r1
	ldrb r2, [r1]
	adds r0, r5, 0
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _080912F4
	ldr r3, _080912F8
	adds r2, r1, r3
	adds r2, r4, r2
	ldrb r3, [r2]
	adds r0, r5, 0
	orrs r0, r3
	strb r0, [r2]
	ldr r0, _080912FC
	adds r1, r0
	adds r1, r4, r1
	ldrb r2, [r1]
	adds r0, r5, 0
	orrs r0, r2
	strb r0, [r1]
	b _0809130E
	.align 2, 0
_080912F0: .4byte gSaveBlock2
_080912F4: .4byte gSaveBlock1
_080912F8: .4byte 0x00000938
_080912FC: .4byte 0x00003a8c
_08091300:
	ldr r0, _08091318
	adds r0, 0x28
	adds r0, r4, r0
	ldrb r2, [r0]
	adds r1, r5, 0
	orrs r1, r2
	strb r1, [r0]
_0809130E:
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091318: .4byte gSaveBlock2
	thumb_func_end sub_8090D90

	thumb_func_start GetNationalPokedexCount
GetNationalPokedexCount: @ 809131C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
	ldr r7, _08091334
_08091328:
	cmp r6, 0
	beq _08091338
	cmp r6, 0x1
	beq _08091342
	adds r4, r0, 0x1
	b _0809135A
	.align 2, 0
_08091334: .4byte 0x00000181
_08091338:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0
	b _0809134A
_08091342:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	movs r1, 0x1
_0809134A:
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0809135A
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0809135A:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, r7
	bls _08091328
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetNationalPokedexCount

	thumb_func_start GetHoennPokedexCount
GetHoennPokedexCount: @ 809136C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r0, 0
_08091376:
	cmp r6, 0
	beq _08091382
	cmp r6, 0x1
	beq _08091394
	adds r4, r0, 0x1
	b _080913B4
_08091382:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	b _080913A4
_08091394:
	adds r4, r0, 0x1
	lsls r0, r4, 16
	lsrs r0, 16
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
_080913A4:
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _080913B4
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080913B4:
	lsls r0, r4, 16
	lsrs r0, 16
	cmp r0, 0xC9
	bls _08091376
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetHoennPokedexCount

	thumb_func_start sub_8090FC0
sub_8090FC0: @ 80913C4
	push {r4,lr}
	movs r0, 0
_080913C8:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl HoennToNationalOrder
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _080913E8
	movs r0, 0
	b _080913F0
_080913E8:
	adds r0, r4, 0
	cmp r0, 0xC7
	bls _080913C8
	movs r0, 0x1
_080913F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8090FC0

	thumb_func_start sub_8090FF4
sub_8090FF4: @ 80913F8
	push {r4,r5,lr}
	movs r0, 0
_080913FC:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0809144A
	adds r0, r4, 0
	cmp r0, 0x95
	bls _080913FC
	movs r0, 0x98
_08091418:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0809144A
	adds r0, r4, 0
	cmp r0, 0xF9
	bls _08091418
	movs r0, 0xFC
	ldr r5, _08091450
_08091436:
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _08091454
_0809144A:
	movs r0, 0
	b _0809145C
	.align 2, 0
_08091450: .4byte 0x0000017f
_08091454:
	adds r0, r4, 0
	cmp r0, r5
	bls _08091436
	movs r0, 0x1
_0809145C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8090FF4

	thumb_func_start sub_8091060
sub_8091060: @ 8091464
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _08091492
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091530
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08091534
	strh r3, [r0]
	adds r0, 0x8
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_08091492:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080914B8
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091538
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0809153C
	strh r3, [r0]
	adds r0, 0xA
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_080914B8:
	movs r0, 0x80
	lsls r0, 3
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _080914DE
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091540
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08091544
	strh r3, [r0]
	adds r0, 0xC
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_080914DE:
	movs r0, 0x80
	lsls r0, 4
	ands r0, r4
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	bne _08091504
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091548
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0809154C
	strh r3, [r0]
	adds r0, 0xE
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
_08091504:
	movs r0, 0x80
	lsls r0, 5
	ands r5, r0
	cmp r5, 0
	bne _08091528
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08091550
	ands r0, r1
	strh r0, [r2]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08091554
	movs r0, 0x8
	strb r0, [r1]
_08091528:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091530: .4byte 0x0000feff
_08091534: .4byte 0x04000008
_08091538: .4byte 0x0000fdff
_0809153C: .4byte 0x0400000a
_08091540: .4byte 0x0000fbff
_08091544: .4byte 0x0400000c
_08091548: .4byte 0x0000f7ff
_0809154C: .4byte 0x0400000e
_08091550: .4byte 0x0000efff
_08091554: .4byte gReservedSpritePaletteCount
	thumb_func_end sub_8091060

	thumb_func_start sub_8091154
sub_8091154: @ 8091558
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5]
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r5, 0x1]
	mov r5, sp
	adds r0, r4, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r5, 0x2]
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	mov r0, sp
	adds r1, r6, 0
	mov r2, r8
	bl MenuPrint
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8091154

	thumb_func_start sub_80911C8
sub_80911C8: @ 80915CC
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	movs r2, 0xFF
_080915E0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xA
	bls _080915E0
	adds r0, r3, 0
	bl NationalPokedexNumToSpecies
	adds r3, r0, 0
	cmp r3, 0
	beq _0809163C
	movs r4, 0
	ldr r2, _08091638
	movs r0, 0xB
	adds r1, r3, 0
	muls r1, r0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08091650
	adds r3, r2, 0
	adds r2, r1, 0
_08091616:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08091650
	cmp r4, 0x9
	bls _08091616
	b _08091650
	.align 2, 0
_08091638: .4byte gSpeciesNames
_0809163C:
	movs r4, 0
	movs r1, 0xAE
_08091640:
	mov r2, sp
	adds r0, r2, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _08091640
_08091650:
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r4, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80911C8

	thumb_func_start sub_8091260
sub_8091260: @ 8091664
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x28
	adds r4, r3, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080916D0
	mov r0, sp
	bl StringCopy
	adds r6, r0, 0
	mov r0, sp
	strb r4, [r0, 0x2]
	adds r0, r5, 0
	bl NationalPokedexNumToSpecies
	adds r5, r0, 0
	cmp r5, 0
	beq _080916D8
	movs r4, 0
	ldr r2, _080916D4
	movs r0, 0xB
	adds r1, r5, 0
	muls r1, r0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080916EA
	adds r3, r2, 0
	adds r2, r1, 0
_080916B0:
	adds r1, r6, r4
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, r2
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080916EA
	cmp r4, 0x9
	bls _080916B0
	b _080916EA
	.align 2, 0
_080916D0: .4byte gUnknown_083B5558
_080916D4: .4byte gSpeciesNames
_080916D8:
	movs r4, 0
	movs r1, 0xAE
_080916DC:
	adds r0, r6, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080916DC
_080916EA:
	adds r1, r6, r4
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	mov r1, r8
	adds r2, r7, 0
	bl MenuPrint
	adds r0, r4, 0
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8091260

	thumb_func_start sub_8091304
sub_8091304: @ 8091708
	push {r4-r6,lr}
	sub sp, 0x20
	adds r3, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r2, 0
	ldrb r0, [r3]
	ldr r6, _08091758
	cmp r0, 0xFF
	beq _0809173C
_08091720:
	mov r0, sp
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0809173C
	cmp r2, 0xA
	bls _08091720
_0809173C:
	mov r0, sp
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl sub_8072B80
	add sp, 0x20
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091758: .4byte gDexText_UnknownPoke
	thumb_func_end sub_8091304

	thumb_func_start unref_sub_80913A4
unref_sub_80913A4: @ 809175C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r7, 0
	mov r1, sp
	movs r0, 0xFC
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x13
	strb r0, [r1]
	movs r6, 0x3
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0809179C
	movs r7, 0x6
	b _080917A8
_0809179C:
	movs r6, 0x4
	mov r1, sp
	adds r1, 0x3
	adds r0, r2, 0
	adds r0, 0xA1
	strb r0, [r1]
_080917A8:
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080917CC
	cmp r7, 0
	beq _080917CC
	adds r7, 0x6
	b _080917DC
_080917CC:
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	add r1, sp
	adds r0, r2, 0
	adds r0, 0xA1
	strb r0, [r1]
_080917DC:
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r6, 0
	mov r0, sp
	adds r6, r0, r1
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r5, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0xA1
	strb r0, [r6]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r2, r6, 0
	mov r0, sp
	adds r1, r0, r4
	movs r0, 0xB8
	strb r0, [r1]
	adds r4, r2, 0x1
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	adds r6, r0, r2
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r6]
	mov r0, sp
	adds r1, r0, r4
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	strb r7, [r0, 0x2]
	mov r1, r9
	mov r2, r8
	bl MenuPrint
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80913A4

	thumb_func_start sub_8091458
sub_8091458: @ 8091858
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl unref_sub_80913A4
	pop {r0}
	bx r0
	thumb_func_end sub_8091458

	thumb_func_start sub_8091564
sub_8091564: @ 8091870
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl unref_sub_80913A4
	pop {r0}
	bx r0
	thumb_func_end sub_8091564

	thumb_func_start sub_8091738
sub_8091738: @ 8091888
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x80
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _08091918
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r0, 14
	adds r0, r6
	ldr r0, [r0]
	mov r12, r0
	movs r7, 0
	movs r1, 0
	lsls r4, 14
	mov r8, r4
	lsls r5, 5
_080918BA:
	mov r2, r12
	adds r0, r2, r1
	ldrb r3, [r0]
	movs r6, 0
	adds r4, r1, 0x1
_080918C4:
	lsls r1, r6, 1
	adds r2, r3, 0
	asrs r2, r1
	movs r0, 0x1
	ands r2, r0
	movs r0, 0x2
	lsls r0, r1
	ands r0, r3
	cmp r0, 0
	beq _080918DC
	movs r0, 0x10
	orrs r2, r0
_080918DC:
	mov r1, sp
	adds r0, r1, r7
	strb r2, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _080918C4
	lsls r0, r4, 16
	lsrs r1, r0, 16
	cmp r1, 0x1F
	bls _080918BA
	movs r1, 0xC0
	lsls r1, 19
	adds r1, r5, r1
	add r1, r8
	mov r0, sp
	movs r2, 0x40
	bl CpuSet
	add sp, 0x80
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091918: .4byte gMonFootprintTable
	thumb_func_end sub_8091738

	thumb_func_start sub_80917CC
sub_80917CC: @ 809191C
	push {r4,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsrs r0, 5
	ldr r2, _08091958
	adds r3, r0, r2
	movs r4, 0xF0
	lsls r4, 8
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _0809195C
	adds r3, r0, r2
	adds r4, 0x1
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _08091960
	adds r3, r0, r2
	adds r4, 0x1
	adds r2, r1, r4
	strh r2, [r3]
	ldr r2, _08091964
	adds r0, r2
	adds r4, 0x1
	adds r1, r4
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091958: .4byte 0x06000232
_0809195C: .4byte 0x06000234
_08091960: .4byte 0x06000272
_08091964: .4byte 0x06000274
	thumb_func_end sub_80917CC

	thumb_func_start sub_8091818
sub_8091818: @ 8091968
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	cmp r4, 0x1
	beq _08091994
	cmp r4, 0x1
	bgt _0809198A
	cmp r4, 0
	beq _0809199C
	b _080919BC
_0809198A:
	cmp r5, 0x2
	beq _080919AE
	cmp r5, 0x3
	beq _080919A2
	b _080919BC
_08091994:
	cmp r0, r2
	bls _080919BC
	subs r0, 0x1
	b _080919B4
_0809199C:
	cmp r0, r3
	bcs _080919BC
	b _080919B2
_080919A2:
	cmp r0, r2
	bls _080919AA
	subs r0, 0x1
	b _080919B4
_080919AA:
	adds r0, r3, 0
	b _080919BC
_080919AE:
	cmp r0, r3
	bcs _080919BA
_080919B2:
	adds r0, 0x1
_080919B4:
	lsls r0, 16
	lsrs r0, 16
	b _080919BC
_080919BA:
	adds r0, r2, 0
_080919BC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8091818

	thumb_func_start nullsub_59
nullsub_59: @ 80919C4
	bx lr
	thumb_func_end nullsub_59

	thumb_func_start sub_8091878
sub_8091878: @ 80919C8
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _080919F0
	adds r3, r4, 0
	ldr r2, _080919F4
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _080919F8
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _080919FC
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080919F0: .4byte gUnknown_02024E8C
_080919F4: .4byte gUnknown_083B57A4
_080919F8: .4byte gUnknown_083B5794
_080919FC: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end sub_8091878

	thumb_func_start sub_80918B0
sub_80918B0: @ 8091A00
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _08091A2C
	adds r3, r4, 0
	ldr r2, _08091A30
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08091A34
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _08091A38
	ldr r0, [r0]
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091A2C: .4byte gUnknown_02024E8C
_08091A30: .4byte gUnknown_083B57A4
_08091A34: .4byte gUnknown_083B5794
_08091A38: .4byte gUnknown_081EC2A4
	thumb_func_end sub_80918B0

	thumb_func_start sub_80918EC
sub_80918EC: @ 8091A3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	adds r0, r7, 0
	bl NationalPokedexNumToSpecies
	adds r7, r0, 0
	cmp r7, 0xC9
	beq _08091AEC
	movs r0, 0x9A
	lsls r0, 1
	cmp r7, r0
	beq _08091AA8
	lsls r6, r7, 3
	ldr r0, _08091A9C
	adds r0, r6, r0
	ldr r1, _08091AA0
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091AA4
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	bl DecompressPicFromTable_2
	b _08091B1E
	.align 2, 0
_08091A9C: .4byte gMonFrontPicTable
_08091AA0: .4byte gMonFrontPicCoords
_08091AA4: .4byte gUnknown_083B5584
_08091AA8:
	lsls r6, r7, 3
	ldr r0, _08091ADC
	adds r0, r6
	ldr r2, _08091AE0
	lsls r1, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091AE4
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, _08091AE8
	ldr r4, [r4, 0x20]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _08091B1E
	.align 2, 0
_08091ADC: .4byte gMonFrontPicTable
_08091AE0: .4byte gMonFrontPicCoords
_08091AE4: .4byte gUnknown_083B5584
_08091AE8: .4byte gSaveBlock2
_08091AEC:
	lsls r6, r7, 3
	ldr r0, _08091B80
	adds r0, r6
	ldr r2, _08091B84
	lsls r1, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091B88
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	ldr r4, _08091B8C
	ldr r4, [r4, 0x1C]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
_08091B1E:
	ldr r0, _08091B90
	adds r0, r6, r0
	ldr r0, [r0]
	mov r1, r8
	lsls r4, r1, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r3, r8
	lsls r1, r3, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8091878
	ldr r0, _08091B94
	mov r5, r9
	lsls r1, r5, 16
	asrs r1, 16
	mov r3, r10
	lsls r2, r3, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08091B98
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091B80: .4byte gMonFrontPicTable
_08091B84: .4byte gMonFrontPicCoords
_08091B88: .4byte gUnknown_083B5584
_08091B8C: .4byte gSaveBlock2
_08091B90: .4byte gMonPaletteTable
_08091B94: .4byte gUnknown_02024E8C
_08091B98: .4byte gSprites
	thumb_func_end sub_80918EC

	thumb_func_start sub_8091A4C
sub_8091A4C: @ 8091B9C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r9, r3
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r1, r9
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r0, r5, 3
	ldr r1, _08091C34
	adds r0, r1
	ldr r1, _08091C38
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08091C3C
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r5, 0
	movs r1, 0
	bl sub_80918B0
	ldr r0, _08091C40
	lsls r6, 16
	asrs r6, 16
	mov r3, r8
	lsls r3, 16
	asrs r3, 16
	mov r8, r3
	adds r1, r6, 0
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08091C44
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	mov r1, r9
	lsls r1, 4
	mov r9, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	mov r3, r9
	orrs r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08091C34: .4byte gTrainerFrontPicTable
_08091C38: .4byte gTrainerFrontPicCoords
_08091C3C: .4byte gUnknown_083B5584
_08091C40: .4byte gUnknown_02024E8C
_08091C44: .4byte gSprites
	thumb_func_end sub_8091A4C

	thumb_func_start sub_8091AF8
sub_8091AF8: @ 8091C48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r4, [sp, 0x34]
	ldr r5, [sp, 0x38]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x4]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x8]
	lsls r5, 24
	lsrs r5, 24
	mov r10, r5
	bl SortPokedex
	movs r5, 0
	movs r6, 0
	ldr r4, _08091E58
	ldr r3, _08091E5C
_08091C82:
	ldr r2, [r3]
	lsls r0, r5, 2
	adds r1, r2, r0
	ldrb r0, [r1, 0x2]
	lsls r0, 31
	cmp r0, 0
	beq _08091C9E
	lsls r0, r6, 2
	adds r0, r2, r0
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091C9E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r4
	bls _08091C82
	ldr r1, _08091E5C
	ldr r0, [r1]
	ldr r2, _08091E60
	adds r0, r2
	adds r1, r6, 0
	strh r6, [r0]
	cmp r7, 0xFF
	beq _08091D54
	movs r5, 0
	lsls r0, r1, 16
	movs r6, 0
	cmp r0, 0
	beq _08091D4A
	lsls r7, 2
	ldr r0, _08091E64
	adds r0, 0x3
	adds r0, r7, r0
	str r0, [sp, 0xC]
	ldr r0, _08091E64
	adds r0, r7
	mov r9, r0
_08091CD2:
	ldr r1, _08091E5C
	ldr r0, [r1]
	lsls r4, r5, 2
	adds r0, r4
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08091E68
	movs r0, 0xB
	muls r0, r2
	adds r0, r1
	ldrb r2, [r0]
	adds r3, r2, 0
	mov r0, r9
	ldrb r0, [r0]
	cmp r2, r0
	bcc _08091D0A
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08091E64
	adds r1, 0x1
	adds r1, r7, r1
	ldrb r1, [r1]
	adds r0, r1
	cmp r2, r0
	blt _08091D22
_08091D0A:
	ldr r0, _08091E64
	adds r0, 0x2
	adds r0, r7, r0
	ldrb r2, [r0]
	cmp r3, r2
	bcc _08091D36
	ldrb r1, [r0]
	ldr r2, [sp, 0xC]
	ldrb r0, [r2]
	adds r1, r0
	cmp r3, r1
	bge _08091D36
_08091D22:
	ldr r2, _08091E5C
	ldr r0, [r2]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091D36:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08091E5C
	ldr r0, [r1]
	ldr r2, _08091E60
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091CD2
_08091D4A:
	ldr r1, _08091E5C
	ldr r0, [r1]
	ldr r2, _08091E60
	adds r0, r2
	strh r6, [r0]
_08091D54:
	ldr r0, [sp, 0x4]
	cmp r0, 0xFF
	beq _08091DC4
	movs r5, 0
	movs r6, 0
	ldr r1, _08091E5C
	ldr r0, [r1]
	ldr r2, _08091E60
	adds r0, r2
	ldrh r0, [r0]
	cmp r6, r0
	bcs _08091DBA
	adds r7, r1, 0
	ldr r0, _08091E6C
	mov r8, r0
_08091D72:
	ldr r0, [r7]
	lsls r4, r5, 2
	adds r0, r4
	ldrh r0, [r0]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x19]
	lsls r0, 25
	lsrs r0, 25
	ldr r1, [sp, 0x4]
	cmp r1, r0
	bne _08091DA8
	ldr r0, [r7]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091DA8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r7]
	ldr r2, _08091E60
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091D72
_08091DBA:
	ldr r1, _08091E5C
	ldr r0, [r1]
	ldr r2, _08091E60
	adds r0, r2
	strh r6, [r0]
_08091DC4:
	ldr r0, [sp, 0x8]
	cmp r0, 0xFF
	bne _08091DDA
	mov r1, r10
	cmp r1, 0xFF
	bne _08091DD2
	b _08091EF6
_08091DD2:
	mov r2, r10
	str r2, [sp, 0x8]
	movs r0, 0xFF
	mov r10, r0
_08091DDA:
	mov r1, r10
	cmp r1, 0xFF
	bne _08091E70
	movs r5, 0
	movs r6, 0
	ldr r2, _08091E5C
	ldr r0, [r2]
	ldr r1, _08091E60
	adds r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bcs _08091EEC
	adds r3, r2, 0
	mov r7, sp
	mov r8, r2
_08091DF8:
	ldr r0, [r3]
	lsls r4, r5, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x2]
	lsls r0, 30
	cmp r0, 0
	bge _08091E42
	ldrh r0, [r1]
	str r3, [sp, 0x10]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08091E6C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	strb r1, [r7]
	ldrb r0, [r0, 0x7]
	strb r0, [r7, 0x1]
	ldr r3, [sp, 0x10]
	ldr r2, [sp, 0x8]
	cmp r1, r2
	beq _08091E30
	cmp r0, r2
	bne _08091E42
_08091E30:
	ldr r0, [r3]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091E42:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r1, r8
	ldr r0, [r1]
	ldr r2, _08091E60
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091DF8
	b _08091EEC
	.align 2, 0
_08091E58: .4byte 0x00000181
_08091E5C: .4byte gPokedexView
_08091E60: .4byte 0x0000060c
_08091E64: .4byte gUnknown_083B57BC
_08091E68: .4byte gSpeciesNames
_08091E6C: .4byte gBaseStats
_08091E70:
	movs r5, 0
	movs r6, 0
	ldr r1, _08091F5C
	ldr r0, [r1]
	ldr r2, _08091F60
	adds r0, r2
	ldrh r0, [r0]
	cmp r6, r0
	bcs _08091EEC
	mov r7, sp
_08091E84:
	ldr r0, [r1]
	lsls r1, r5, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x2]
	lsls r0, 30
	adds r4, r1, 0
	cmp r0, 0
	bge _08091ED8
	ldrh r0, [r2]
	bl NationalPokedexNumToSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _08091F64
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x6]
	strb r1, [r7]
	ldrb r0, [r0, 0x7]
	strb r0, [r7, 0x1]
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bne _08091EBA
	cmp r0, r10
	beq _08091EC4
_08091EBA:
	cmp r1, r10
	bne _08091ED8
	ldr r1, [sp, 0x8]
	cmp r0, r1
	bne _08091ED8
_08091EC4:
	ldr r2, _08091F5C
	ldr r0, [r2]
	lsls r1, r6, 2
	adds r1, r0, r1
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08091ED8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08091F5C
	ldr r0, [r1]
	ldr r2, _08091F60
	adds r0, r2
	ldrh r0, [r0]
	cmp r5, r0
	bcc _08091E84
_08091EEC:
	ldr r1, _08091F5C
	ldr r0, [r1]
	ldr r2, _08091F60
	adds r0, r2
	strh r6, [r0]
_08091EF6:
	ldr r1, _08091F5C
	ldr r0, [r1]
	ldr r2, _08091F60
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0
	beq _08091F4A
	adds r5, r0, 0
	ldr r0, _08091F68
	cmp r5, r0
	bhi _08091F4A
	ldr r4, _08091F5C
	movs r1, 0x2
	negs r1, r1
	mov r10, r1
	movs r2, 0x3
	negs r2, r2
	mov r9, r2
	mov r8, r0
	ldr r0, _08091F6C
	adds r7, r0, 0
_08091F20:
	ldr r1, [r4]
	lsls r3, r5, 2
	adds r1, r3
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	ldrb r2, [r1, 0x2]
	mov r0, r10
	ands r0, r2
	strb r0, [r1, 0x2]
	ldr r1, [r4]
	adds r1, r3
	ldrb r2, [r1, 0x2]
	mov r0, r9
	ands r0, r2
	strb r0, [r1, 0x2]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bls _08091F20
_08091F4A:
	adds r0, r6, 0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091F5C: .4byte gPokedexView
_08091F60: .4byte 0x0000060c
_08091F64: .4byte gBaseStats
_08091F68: .4byte 0x00000181
_08091F6C: .4byte 0x0000ffff
	thumb_func_end sub_8091AF8

	thumb_func_start sub_8091E20
sub_8091E20: @ 8091F70
	push {lr}
	sub sp, 0x8
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x9
	movs r2, 0x78
	movs r3, 0xD8
	bl sub_8072AB0
	add sp, 0x8
	pop {r0}
	bx r0
	thumb_func_end sub_8091E20

	thumb_func_start sub_8091E3C
sub_8091E3C: @ 8091F8C
	push {lr}
	ldr r0, _08091FA0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08091FA0: .4byte sub_8091E54
	thumb_func_end sub_8091E3C

	thumb_func_start sub_8091E54
sub_8091E54: @ 8091FA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08091FC8
	ldr r2, _08091FCC
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x4
	bhi _08091FE8
	lsls r0, 2
	ldr r1, _08091FD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091FC8: .4byte gMain
_08091FCC: .4byte 0x0000043c
_08091FD0: .4byte _08091FD4
	.align 2, 0
_08091FD4:
	.4byte _08091FE8
	.4byte _080920A0
	.4byte _08092110
	.4byte _08092130
	.4byte _0809215C
_08091FE8:
	ldr r0, _0809206C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08091FF6
	b _08092180
_08091FF6:
	ldr r0, _08092070
	ldr r0, [r0]
	ldr r1, _08092074
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0
	bl sub_8091060
	ldr r0, _08092078
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0809207C
	ldr r1, _08092080
	bl LZ77UnCompVram
	ldr r0, _08092084
	movs r1, 0x1
	movs r2, 0x7E
	bl LoadPalette
	bl IsNationalPokedex
	cmp r0, 0
	bne _08092060
	movs r4, 0
	ldr r2, _08092088
	mov r8, r2
	ldr r0, _0809208C
	mov r12, r0
	movs r5, 0x1
	ldr r7, _08092090
	ldr r6, _08092094
_0809203C:
	lsls r1, r4, 1
	mov r0, r8
	adds r2, r1, r0
	mov r0, r12
	adds r3, r1, r0
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, r1, r7
	adds r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	strh r5, [r3]
	strh r5, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x10
	bls _0809203C
_08092060:
	ldr r0, _08092098
	ldr r1, _0809209C
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _08092180
	.align 2, 0
_0809206C: .4byte gPaletteFade
_08092070: .4byte gPokedexView
_08092074: .4byte 0x0000064a
_08092078: .4byte gPokedexMenuSearch_Gfx
_0809207C: .4byte gUnknown_08E96D2C
_08092080: .4byte 0x06007800
_08092084: .4byte 0x08e88186
_08092088: .4byte 0x06007a80
_0809208C: .4byte 0x06007b00
_08092090: .4byte 0x06007ac0
_08092094: .4byte 0x06007b40
_08092098: .4byte gMain
_0809209C: .4byte 0x0000043c
_080920A0:
	ldr r4, _080920F8
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _080920FC
	bl LoadCompressedObjectPic
	ldr r0, _08092100
	bl LoadSpritePalettes
	adds r0, r5, 0
	bl sub_809308C
	movs r4, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r1, r0, 3
	ldr r3, _08092104
	movs r2, 0
_080920CC:
	lsls r0, r4, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080920CC
	adds r0, r5, 0
	bl sub_8092EB0
	movs r0, 0
	bl sub_8092AB0
	adds r0, r5, 0
	bl sub_8092B68
	ldr r1, _08092108
	ldr r2, _0809210C
	adds r1, r2
	b _08092146
	.align 2, 0
_080920F8: .4byte gWindowConfig_81E7064
_080920FC: .4byte gUnknown_083A05CC
_08092100: .4byte gUnknown_083A05DC
_08092104: .4byte 0x03004b38
_08092108: .4byte gMain
_0809210C: .4byte 0x0000043c
_08092110:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08092128
	ldr r0, _0809212C
	adds r1, r0
	b _08092146
	.align 2, 0
_08092128: .4byte gMain
_0809212C: .4byte 0x0000043c
_08092130:
	ldr r1, _08092150
	ldr r2, _08092154
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xE2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08092158
	adds r1, r3, r0
_08092146:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08092180
	.align 2, 0
_08092150: .4byte 0x0400000e
_08092154: .4byte 0x00000f03
_08092158: .4byte 0x0000043c
_0809215C:
	ldr r0, _0809218C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08092180
	ldr r1, _08092190
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08092194
	str r1, [r0]
	ldr r1, _08092198
	adds r0, r3, r1
	strb r2, [r0]
_08092180:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809218C: .4byte gPaletteFade
_08092190: .4byte gTasks
_08092194: .4byte sub_809204C
_08092198: .4byte 0x0000043c
	thumb_func_end sub_8091E54

	thumb_func_start sub_809204C
sub_809204C: @ 809219C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080921C4
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_8092AB0
	adds r0, r5, 0
	bl sub_8092B68
	ldr r0, _080921C8
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921C4: .4byte gTasks
_080921C8: .4byte sub_809207C
	thumb_func_end sub_809204C

	thumb_func_start sub_809207C
sub_809207C: @ 80921CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080921F4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08092200
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080921F8
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080921FC
	str r0, [r1]
	b _080922BC
	.align 2, 0
_080921F4: .4byte gMain
_080921F8: .4byte gTasks
_080921FC: .4byte sub_80927B8
_08092200:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809225C
	ldr r1, _08092224
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r4, [r5, r0]
	cmp r4, 0x1
	beq _08092238
	cmp r4, 0x1
	bgt _08092228
	cmp r4, 0
	beq _0809222E
	b _080922BC
	.align 2, 0
_08092224: .4byte gTasks
_08092228:
	cmp r4, 0x2
	beq _0809224C
	b _080922BC
_0809222E:
	movs r0, 0x15
	bl PlaySE
	strh r4, [r5, 0xA]
	b _08092242
_08092238:
	movs r0, 0x15
	bl PlaySE
	movs r0, 0x4
	strh r0, [r5, 0xA]
_08092242:
	ldr r0, _08092248
	str r0, [r5]
	b _080922BC
	.align 2, 0
_08092248: .4byte sub_809217C
_0809224C:
	movs r0, 0x3
	bl PlaySE
	ldr r0, _08092258
	str r0, [r5]
	b _080922BC
	.align 2, 0
_08092258: .4byte sub_80927B8
_0809225C:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809228A
	ldr r0, _080922C4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _0809228A
	movs r0, 0x6D
	bl PlaySE
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092AB0
_0809228A:
	ldr r0, _080922C8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080922BC
	ldr r0, _080922C4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bgt _080922BC
	movs r0, 0x6D
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092AB0
_080922BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080922C4: .4byte gTasks
_080922C8: .4byte gMain
	thumb_func_end sub_809207C

	thumb_func_start sub_809217C
sub_809217C: @ 80922CC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080922F8
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0xA]
	bl sub_8092AD4
	adds r0, r5, 0
	bl sub_8092B68
	ldr r0, _080922FC
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080922F8: .4byte gTasks
_080922FC: .4byte sub_80921B0
	thumb_func_end sub_809217C

	thumb_func_start sub_80921B0
sub_80921B0: @ 8092300
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08092328
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08092334
	bl IsNationalPokedex
	ldr r6, _0809232C
	cmp r0, 0
	bne _08092340
	ldr r6, _08092330
	b _08092340
	.align 2, 0
_08092328: .4byte gTasks
_0809232C: .4byte gUnknown_083B586C
_08092330: .4byte gUnknown_083B58A4
_08092334:
	bl IsNationalPokedex
	ldr r6, _0809236C
	cmp r0, 0
	bne _08092340
	ldr r6, _08092370
_08092340:
	ldr r0, _08092374
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _08092380
	movs r0, 0x17
	bl PlaySE
	adds r0, r5, 0
	bl sub_8092EB0
	ldr r0, _08092378
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809237C
	str r0, [r1]
	b _0809253C
	.align 2, 0
_0809236C: .4byte gUnknown_083B5850
_08092370: .4byte gUnknown_083B5888
_08092374: .4byte gMain
_08092378: .4byte gTasks
_0809237C: .4byte sub_809204C
_08092380:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08092450
	ldr r0, _08092404
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r6, r1, r0
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	cmp r0, 0x6
	bne _08092440
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _08092424
	ldr r1, _08092408
	movs r0, 0x40
	strb r0, [r1]
	ldr r7, _0809240C
	ldr r1, [r7]
	ldr r0, _08092410
	adds r2, r1, r0
	movs r0, 0x40
	strh r0, [r2]
	ldr r0, _08092414
	strh r3, [r0]
	movs r2, 0xC2
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8092E10
	ldr r4, _08092418
	strb r0, [r4, 0x19]
	bl IsNationalPokedex
	cmp r0, 0
	bne _080923D8
	movs r0, 0
	strb r0, [r4, 0x19]
_080923D8:
	ldr r0, [r7]
	ldrb r1, [r4, 0x19]
	ldr r2, _0809241C
	adds r0, r2
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8092E10
	strb r0, [r4, 0x18]
	ldr r0, [r7]
	ldrb r1, [r4, 0x18]
	movs r2, 0xC3
	lsls r2, 3
	adds r0, r2
	strh r1, [r0]
	movs r0, 0x3
	bl PlaySE
	ldr r0, _08092420
	str r0, [r6]
	b _0809253C
	.align 2, 0
_08092404: .4byte gTasks
_08092408: .4byte gUnknown_0202FFBA
_0809240C: .4byte gPokedexView
_08092410: .4byte 0x0000062a
_08092414: .4byte gUnknown_0202FFB8
_08092418: .4byte gSaveBlock2
_0809241C: .4byte 0x00000614
_08092420: .4byte sub_80927B8
_08092424:
	ldr r0, _08092438
	bl sub_8091E20
	ldr r0, _0809243C
	str r0, [r6]
	movs r0, 0x70
	bl PlaySE
	b _0809253C
	.align 2, 0
_08092438: .4byte gDexText_Searching
_0809243C: .4byte sub_80923FC
_08092440:
	movs r0, 0x15
	bl PlaySE
	ldr r0, _0809244C
	str r0, [r6]
	b _0809253C
	.align 2, 0
_0809244C: .4byte sub_80925CC
_08092450:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08092488
	ldr r1, _08092544
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08092488
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_08092488:
	ldr r0, _08092548
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080924C4
	ldr r1, _08092544
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	cmp r0, 0xFF
	beq _080924C4
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_080924C4:
	ldr r0, _08092548
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08092500
	ldr r1, _08092544
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x2]
	cmp r0, 0xFF
	beq _08092500
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x2]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_08092500:
	ldr r0, _08092548
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809253C
	ldr r1, _08092544
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x3]
	cmp r0, 0xFF
	beq _0809253C
	movs r0, 0x5
	bl PlaySE
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x3]
	strh r1, [r4, 0xA]
	ldrb r0, [r4, 0x8]
	bl sub_8092AD4
_0809253C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092544: .4byte gTasks
_08092548: .4byte gMain
	thumb_func_end sub_80921B0

	thumb_func_start sub_80923FC
sub_80923FC: @ 809254C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_8092E10
	mov r10, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_8092E10
	mov r9, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0
	bl sub_8092E10
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8092E10
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8092E10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8092E10
	lsls r0, 24
	lsrs r0, 24
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r10
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl sub_8091AF8
	ldr r1, _080925EC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080925F0
	str r1, [r0]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080925EC: .4byte gTasks
_080925F0: .4byte sub_80924A4
	thumb_func_end sub_80923FC

	thumb_func_start sub_80924A4
sub_80924A4: @ 80925F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08092646
	ldr r0, _08092620
	ldr r0, [r0]
	ldr r1, _08092624
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809262C
	movs r0, 0x1F
	bl PlaySE
	ldr r0, _08092628
	bl sub_8091E20
	b _08092638
	.align 2, 0
_08092620: .4byte gPokedexView
_08092624: .4byte 0x0000060c
_08092628: .4byte gDexText_SearchComplete
_0809262C:
	movs r0, 0x20
	bl PlaySE
	ldr r0, _0809264C
	bl sub_8091E20
_08092638:
	ldr r0, _08092650
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08092654
	str r0, [r1]
_08092646:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809264C: .4byte gDexText_NoMatching
_08092650: .4byte gTasks
_08092654: .4byte sub_8092508
	thumb_func_end sub_80924A4

	thumb_func_start sub_8092508
sub_8092508: @ 8092658
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r2, r4, 0
	ldr r0, _080926C0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080926F4
	ldr r5, _080926C4
	ldr r1, [r5]
	ldr r3, _080926C8
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080926E0
	ldr r0, _080926CC
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_8092E10
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080926D0
	adds r1, r2
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8092E10
	ldr r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080926D4
	adds r1, r3
	strh r0, [r1]
	ldr r1, _080926D8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080926DC
	str r1, [r0]
	movs r0, 0x3
	bl PlaySE
	b _080926F4
	.align 2, 0
_080926C0: .4byte gMain
_080926C4: .4byte gPokedexView
_080926C8: .4byte 0x0000060c
_080926CC: .4byte 0x0000064f
_080926D0: .4byte 0x00000612
_080926D4: .4byte 0x00000616
_080926D8: .4byte gTasks
_080926DC: .4byte sub_80927B8
_080926E0:
	ldr r0, _080926FC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08092700
	str r0, [r1]
	movs r0, 0x17
	bl PlaySE
_080926F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080926FC: .4byte gTasks
_08092700: .4byte sub_809217C
	thumb_func_end sub_8092508

	thumb_func_start sub_80925B4
sub_80925B4: @ 8092704
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 15
	adds r1, 0x1
	lsls r1, 27
	lsrs r1, 24
	movs r0, 0x90
	bl sub_814AD7C
	pop {r0}
	bx r0
	thumb_func_end sub_80925B4

	thumb_func_start sub_80925CC
sub_80925CC: @ 809271C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_8092C8C
	ldr r2, _08092780
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r6, r1, r2
	ldrb r0, [r6, 0xA]
	adds r2, 0x8
	adds r1, r2
	ldr r2, _08092784
	lsls r0, 3
	adds r0, r2
	ldrb r5, [r0, 0x4]
	lsls r5, 1
	adds r5, r1, r5
	ldrb r0, [r0, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r5]
	strh r0, [r6, 0x24]
	ldrh r0, [r1]
	strh r0, [r6, 0x26]
	adds r0, r4, 0
	bl sub_8092D78
	ldr r1, _08092788
	ldr r3, _0809278C
	movs r0, 0xB
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	ldrh r0, [r5]
	movs r1, 0x1
	bl sub_80925B4
	ldr r0, _08092790
	str r0, [r6]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092780: .4byte gTasks
_08092784: .4byte gUnknown_083B5A7C
_08092788: .4byte 0x0000ffff
_0809278C: .4byte 0x00002d9f
_08092790: .4byte sub_8092644
	thumb_func_end sub_80925CC

	thumb_func_start sub_8092644
sub_8092644: @ 8092794
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, _080927F8
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r6, r2, r3
	ldrb r1, [r6, 0xA]
	ldr r0, _080927FC
	lsls r1, 3
	adds r1, r0
	ldr r0, [r1]
	mov r8, r0
	adds r3, 0x8
	adds r2, r3
	ldrb r0, [r1, 0x4]
	lsls r0, 1
	adds r4, r2, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r5, r2, r0
	ldrh r0, [r1, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08092800
	mov r12, r0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08092804
	bl sub_814ADC8
	movs r0, 0x15
	bl PlaySE
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl sub_8092C8C
	b _08092830
	.align 2, 0
_080927F8: .4byte gTasks
_080927FC: .4byte gUnknown_083B5A7C
_08092800: .4byte gMain
_08092804:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809283C
	bl sub_814ADC8
	movs r0, 0x17
	bl PlaySE
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl sub_8092C8C
	ldrh r0, [r6, 0x24]
	strh r0, [r4]
	ldrh r0, [r6, 0x26]
	strh r0, [r5]
_08092830:
	ldr r0, _08092838
	str r0, [r6]
	b _080928FE
	.align 2, 0
_08092838: .4byte sub_809217C
_0809283C:
	movs r3, 0
	mov r0, r12
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809289C
	ldrh r0, [r4]
	cmp r0, 0
	beq _08092866
	movs r1, 0
	bl sub_80925B4
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	b _08092884
_08092866:
	ldrh r0, [r5]
	cmp r0, 0
	beq _08092880
	subs r0, 0x1
	strh r0, [r5]
	adds r0, r7, 0
	bl sub_8092D78
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	movs r3, 0x1
_08092880:
	cmp r3, 0
	beq _080928FE
_08092884:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r1
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8091E20
	b _080928FE
_0809289C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080928FE
	ldrh r0, [r4]
	cmp r0, 0x4
	bhi _080928C4
	cmp r0, r2
	bcs _080928C4
	movs r1, 0
	bl sub_80925B4
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r1, 0x1
	bl sub_80925B4
	b _080928E8
_080928C4:
	cmp r2, 0x5
	bls _080928E4
	ldrh r1, [r5]
	subs r0, r2, 0x5
	cmp r1, r0
	bge _080928E4
	adds r0, r1, 0x1
	strh r0, [r5]
	adds r0, r7, 0
	bl sub_8092D78
	movs r0, 0x5
	movs r1, 0x1
	bl sub_80925B4
	movs r3, 0x1
_080928E4:
	cmp r3, 0
	beq _080928FE
_080928E8:
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r1
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	bl sub_8091E20
_080928FE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8092644

	thumb_func_start sub_80927B8
sub_80927B8: @ 8092908
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08092938
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809293C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092938: .4byte gTasks
_0809293C: .4byte sub_80927F0
	thumb_func_end sub_80927B8

	thumb_func_start sub_80927F0
sub_80927F0: @ 8092940
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0809295C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08092958
	adds r0, r2, 0
	bl DestroyTask
_08092958:
	pop {r0}
	bx r0
	.align 2, 0
_0809295C: .4byte gPaletteFade
	thumb_func_end sub_80927F0

	thumb_func_start sub_8092810
sub_8092810: @ 8092960
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r12, r1
	lsls r2, 24
	lsrs r1, r2, 24
	lsls r3, 24
	lsrs r5, r3, 8
	movs r3, 0
	cmp r5, 0
	beq _080929AA
	lsls r7, r1, 6
	ldr r6, _080929B0
	lsls r4, r0, 12
_08092980:
	mov r0, r12
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r7, r1
	ldr r0, _080929B4
	adds r2, r1, r0
	ldrh r0, [r2]
	ands r0, r6
	orrs r0, r4
	strh r0, [r2]
	ldr r0, _080929B8
	adds r1, r0
	ldrh r0, [r1]
	ands r0, r6
	orrs r0, r4
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r0, r5
	bcc _08092980
_080929AA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080929B0: .4byte 0x00000fff
_080929B4: .4byte 0x06007800
_080929B8: .4byte 0x06007840
	thumb_func_end sub_8092810

	thumb_func_start sub_809286C
sub_809286C: @ 80929BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x1
	ands r5, r0
	ands r2, r0
	lsls r2, 1
	orrs r5, r2
	cmp r4, 0xA
	bhi _08092AA8
	lsls r0, r4, 2
	ldr r1, _080929E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080929E4: .4byte _080929E8
	.align 2, 0
_080929E8:
	.4byte _08092A14
	.4byte _08092A14
	.4byte _08092A14
	.4byte _08092A24
	.4byte _08092A24
	.4byte _08092A3C
	.4byte _08092A3C
	.4byte _08092A24
	.4byte _08092A24
	.4byte _08092A64
	.4byte _08092A54
_08092A14:
	ldr r1, _08092A20
	lsls r0, r4, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	b _08092A82
	.align 2, 0
_08092A20: .4byte gUnknown_083B57E4
_08092A24:
	ldr r2, _08092A50
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	ldrb r3, [r0, 0x6]
	adds r0, r5, 0
	bl sub_8092810
_08092A3C:
	ldr r2, _08092A50
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x7]
	ldrb r2, [r0, 0x8]
	ldrb r3, [r0, 0x9]
	b _08092A84
	.align 2, 0
_08092A50: .4byte gUnknown_083B57FC
_08092A54:
	ldr r0, _08092A60
	ldrb r1, [r0, 0x1C]
	ldrb r2, [r0, 0x1D]
	ldrb r3, [r0, 0x1E]
	b _08092A84
	.align 2, 0
_08092A60: .4byte gUnknown_083B57FC
_08092A64:
	bl IsNationalPokedex
	cmp r0, 0
	bne _08092A90
	ldr r2, _08092A8C
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	subs r2, 0x2
	lsls r2, 24
	lsrs r2, 24
_08092A82:
	ldrb r3, [r0, 0x6]
_08092A84:
	adds r0, r5, 0
	bl sub_8092810
	b _08092AA8
	.align 2, 0
_08092A8C: .4byte gUnknown_083B57FC
_08092A90:
	ldr r2, _08092AB0
	subs r1, r4, 0x3
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	ldrb r2, [r0, 0x5]
	ldrb r3, [r0, 0x6]
	adds r0, r5, 0
	bl sub_8092810
_08092AA8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092AB0: .4byte gUnknown_083B57FC
	thumb_func_end sub_809286C

	thumb_func_start sub_8092964
sub_8092964: @ 8092AB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _08092B1E
	cmp r0, 0x1
	bgt _08092ACA
	cmp r0, 0
	beq _08092AD0
	b _08092BFC
_08092ACA:
	cmp r1, 0x2
	beq _08092B8E
	b _08092BFC
_08092AD0:
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0
	b _08092B6A
_08092B1E:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0x1
_08092B6A:
	bl sub_809286C
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x8
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x9
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	b _08092BFC
_08092B8E:
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_809286C
	movs r0, 0x2
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x3
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x4
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0xA
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x5
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x6
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x7
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x8
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
	movs r0, 0x9
	movs r1, 0x1
	movs r2, 0x1
	bl sub_809286C
_08092BFC:
	pop {r0}
	bx r0
	thumb_func_end sub_8092964

	thumb_func_start sub_8092AB0
sub_8092AB0: @ 8092C00
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8092964
	ldr r0, _08092C20
	lsls r4, 3
	adds r4, r0
	ldr r0, [r4]
	bl sub_8091E20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092C20: .4byte gUnknown_083B57E4
	thumb_func_end sub_8092AB0

	thumb_func_start sub_8092AD4
sub_8092AD4: @ 8092C24
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_8092964
	cmp r4, 0x6
	bhi _08092C9E
	lsls r0, r4, 2
	ldr r1, _08092C40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092C40: .4byte _08092C44
	.align 2, 0
_08092C44:
	.4byte _08092C60
	.4byte _08092C64
	.4byte _08092C68
	.4byte _08092C76
	.4byte _08092C84
	.4byte _08092C88
	.4byte _08092C94
_08092C60:
	movs r0, 0x3
	b _08092C8A
_08092C64:
	movs r0, 0x4
	b _08092C8A
_08092C68:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x5
	b _08092C8A
_08092C76:
	movs r0, 0xA
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	movs r0, 0x6
	b _08092C8A
_08092C84:
	movs r0, 0x7
	b _08092C8A
_08092C88:
	movs r0, 0x8
_08092C8A:
	movs r1, 0
	movs r2, 0
	bl sub_809286C
	b _08092C9E
_08092C94:
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	bl sub_809286C
_08092C9E:
	ldr r0, _08092CB4
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl sub_8091E20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08092CB4: .4byte gUnknown_083B57FC
	thumb_func_end sub_8092AD4

	thumb_func_start sub_8092B68
sub_8092B68: @ 8092CB8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08092DB8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	ldrh r0, [r6, 0x16]
	ldrh r1, [r6, 0x14]
	adds r0, r1
	lsls r0, 16
	ldr r7, _08092DBC
	ldr r1, _08092DC0
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _08092DC4
	mov r8, r0
	movs r1, 0x2D
	movs r2, 0x10
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x1A]
	ldrh r1, [r6, 0x18]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08092DC8
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x20
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x1E]
	ldrh r1, [r6, 0x1C]
	adds r0, r1
	lsls r0, 16
	ldr r4, _08092DCC
	lsrs r0, 13
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	ldr r5, _08092DD0
	adds r0, r5, 0
	movs r1, 0x2D
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x22]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 13
	adds r0, r4
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	adds r0, r5, 0
	movs r1, 0x5D
	movs r2, 0x30
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	ldrh r0, [r6, 0x12]
	ldrh r1, [r6, 0x10]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08092DD4
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x40
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	bl IsNationalPokedex
	cmp r0, 0
	beq _08092DAE
	ldrh r0, [r6, 0xE]
	ldrh r6, [r6, 0xC]
	adds r0, r6
	lsls r0, 16
	ldr r1, _08092DD8
	lsrs r0, 13
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r7, 0
	bl StringCopy
	mov r0, r8
	movs r1, 0x2D
	movs r2, 0x50
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_08092DAE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092DB8: .4byte gTasks
_08092DBC: .4byte gStringVar1
_08092DC0: .4byte gUnknown_083B5910
_08092DC4: .4byte gUnknown_083B5AB2
_08092DC8: .4byte gUnknown_083B5968
_08092DCC: .4byte gUnknown_083B59C8
_08092DD0: .4byte gUnknown_083B5AAC
_08092DD4: .4byte gUnknown_083B58D8
_08092DD8: .4byte gUnknown_083B58C0
	thumb_func_end sub_8092B68

	thumb_func_start sub_8092C8C
sub_8092C8C: @ 8092DDC
	push {r4-r6,lr}
	lsls r0, 24
	cmp r0, 0
	bne _08092E98
	ldr r1, _08092E6C
	ldr r2, _08092E70
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x12
	ldr r3, _08092E74
	ldr r4, _08092E78
	adds r2, r4, 0
_08092DF4:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092DF4
	ldr r1, _08092E7C
	ldr r2, _08092E80
	adds r0, r2, 0
	strh r0, [r1]
	movs r3, 0x1
	ldr r6, _08092E74
	movs r5, 0x2
_08092E12:
	lsls r2, r3, 6
	ldr r4, _08092E6C
	adds r1, r2, r4
	ldr r4, _08092E84
	adds r0, r4, 0
	strh r0, [r1]
	movs r1, 0x12
	adds r4, r3, 0x1
	adds r3, r2, 0
_08092E24:
	lsls r0, r1, 1
	adds r0, r3, r0
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092E24
	ldr r1, _08092E7C
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	lsls r0, r4, 16
	lsrs r3, r0, 16
	cmp r3, 0xC
	bls _08092E12
	ldr r1, _08092E88
	ldr r2, _08092E8C
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x12
	ldr r3, _08092E90
	movs r2, 0xD
_08092E54:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1C
	bls _08092E54
	ldr r1, _08092E94
	movs r0, 0xB
	strh r0, [r1]
	b _08092EBE
	.align 2, 0
_08092E6C: .4byte 0x06007822
_08092E70: .4byte 0x00000c0b
_08092E74: .4byte 0x06007800
_08092E78: .4byte 0x0000080d
_08092E7C: .4byte 0x0600783a
_08092E80: .4byte 0x0000080b
_08092E84: .4byte 0x0000040a
_08092E88: .4byte 0x06007b62
_08092E8C: .4byte 0x0000040b
_08092E90: .4byte 0x06007b40
_08092E94: .4byte 0x06007b7a
_08092E98:
	movs r3, 0
	ldr r6, _08092EC4
	movs r5, 0x4F
_08092E9E:
	movs r1, 0x11
	adds r4, r3, 0x1
	lsls r2, r3, 6
_08092EA4:
	lsls r0, r1, 1
	adds r0, r2, r0
	adds r0, r6
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1D
	bls _08092EA4
	lsls r0, r4, 16
	lsrs r3, r0, 16
	cmp r3, 0xD
	bls _08092E9E
_08092EBE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092EC4: .4byte 0x06007800
	thumb_func_end sub_8092C8C

	thumb_func_start sub_8092D78
sub_8092D78: @ 8092EC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08092F0C
	ldr r3, _08092F10
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r0, r2, r3
	movs r5, 0xA
	ldrsh r1, [r0, r5]
	lsls r1, 3
	adds r1, r4
	ldr r6, [r1]
	adds r3, 0x8
	adds r2, r3
	ldrb r0, [r1, 0x4]
	lsls r0, 1
	adds r0, r2
	mov r8, r0
	ldrb r0, [r1, 0x5]
	lsls r0, 1
	adds r7, r2, r0
	movs r0, 0x12
	movs r1, 0x1
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r5, 0
	ldrh r4, [r7]
	b _08092F38
	.align 2, 0
_08092F0C: .4byte gUnknown_083B5A7C
_08092F10: .4byte gTasks
_08092F14:
	lsls r0, r4, 3
	adds r0, r6
	ldr r0, [r0, 0x4]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x12
	bl MenuPrint
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x5
	bhi _08092F42
_08092F38:
	lsls r0, r4, 3
	adds r0, r6
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bne _08092F14
_08092F42:
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r7]
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldr r0, [r0]
	bl sub_8091E20
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8092D78

	thumb_func_start sub_8092E10
sub_8092E10: @ 8092F60
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08092FA0
	adds r1, r0
	ldr r2, _08092FA4
	lsls r0, r3, 3
	adds r0, r2
	ldrb r2, [r0, 0x4]
	lsls r2, 1
	adds r2, r1, r2
	ldrb r0, [r0, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r3, 0x5
	bhi _08092FC4
	lsls r0, r3, 2
	ldr r1, _08092FA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092FA0: .4byte 0x03004b38
_08092FA4: .4byte gUnknown_083B5A7C
_08092FA8: .4byte _08092FAC
	.align 2, 0
_08092FAC:
	.4byte _08092FD8
	.4byte _08092FE2
	.4byte _08092FF2
	.4byte _08092FF2
	.4byte _08092FD0
	.4byte _08092FC8
_08092FC4:
	movs r0, 0
	b _08092FF8
_08092FC8:
	ldr r0, _08092FCC
	b _08092FF4
	.align 2, 0
_08092FCC: .4byte gUnknown_083B5A60
_08092FD0:
	ldr r0, _08092FD4
	b _08092FF4
	.align 2, 0
_08092FD4: .4byte gUnknown_083B5A62
_08092FD8:
	cmp r2, 0
	beq _08092FE6
	lsls r0, r2, 24
	lsrs r0, 24
	b _08092FF8
_08092FE2:
	cmp r2, 0
	bne _08092FEA
_08092FE6:
	movs r0, 0xFF
	b _08092FF8
_08092FEA:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _08092FF8
_08092FF2:
	ldr r0, _08092FFC
_08092FF4:
	adds r0, r2, r0
	ldrb r0, [r0]
_08092FF8:
	pop {r1}
	bx r1
	.align 2, 0
_08092FFC: .4byte gUnknown_083B5A68
	thumb_func_end sub_8092E10

	thumb_func_start sub_8092EB0
sub_8092EB0: @ 8093000
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08093020
	ldr r0, [r1]
	ldr r2, _08093024
	adds r0, r2
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _0809301A
	cmp r0, 0x1
	beq _08093028
_0809301A:
	movs r3, 0
	b _0809302A
	.align 2, 0
_08093020: .4byte gPokedexView
_08093024: .4byte 0x00000614
_08093028:
	movs r3, 0x1
_0809302A:
	ldr r1, _08093050
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0xC]
	ldr r0, [r5]
	movs r3, 0xC3
	lsls r3, 3
	adds r0, r3
	ldrh r0, [r0]
	adds r5, r1, 0
	cmp r0, 0x5
	bhi _08093070
	lsls r0, 2
	ldr r1, _08093054
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08093050: .4byte gTasks
_08093054: .4byte _08093058
	.align 2, 0
_08093058:
	.4byte _08093070
	.4byte _08093074
	.4byte _08093078
	.4byte _0809307C
	.4byte _08093080
	.4byte _08093084
_08093070:
	movs r3, 0
	b _08093086
_08093074:
	movs r3, 0x1
	b _08093086
_08093078:
	movs r3, 0x2
	b _08093086
_0809307C:
	movs r3, 0x3
	b _08093086
_08093080:
	movs r3, 0x4
	b _08093086
_08093084:
	movs r3, 0x5
_08093086:
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r5
	strh r3, [r0, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8092EB0

	thumb_func_start sub_8092F44
sub_8092F44: @ 8093094
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080930CC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r3
	ldrb r2, [r0, 0xA]
	adds r3, 0x8
	adds r1, r3
	ldr r0, _080930D0
	lsls r2, 3
	adds r2, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r2, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _080930D4
	ldrh r0, [r1]
	cmp r0, 0
	beq _080930D4
	movs r0, 0
	b _080930D6
	.align 2, 0
_080930CC: .4byte gTasks
_080930D0: .4byte gUnknown_083B5A7C
_080930D4:
	movs r0, 0x1
_080930D6:
	pop {r1}
	bx r1
	thumb_func_end sub_8092F44

	thumb_func_start sub_8092F8C
sub_8092F8C: @ 80930DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08093118
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r0, r1, r3
	ldrb r2, [r0, 0xA]
	adds r3, 0x8
	adds r1, r3
	ldr r0, _0809311C
	lsls r2, 3
	adds r2, r0
	ldrb r0, [r2, 0x5]
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r2, 0x6]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bls _08093120
	ldrh r1, [r1]
	subs r0, 0x5
	cmp r1, r0
	bge _08093120
	movs r0, 0
	b _08093122
	.align 2, 0
_08093118: .4byte gTasks
_0809311C: .4byte gUnknown_083B5A7C
_08093120:
	movs r0, 0x1
_08093122:
	pop {r1}
	bx r1
	thumb_func_end sub_8092F8C

	thumb_func_start sub_8092FD8
sub_8092FD8: @ 8093128
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08093168
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0809316C
	cmp r1, r0
	bne _080931C8
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08093170
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092F8C
	lsls r0, 24
	cmp r0, 0
	beq _0809318C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08093198
	.align 2, 0
_08093168: .4byte gTasks
_0809316C: .4byte sub_8092644
_08093170:
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8092F44
	lsls r0, 24
	cmp r0, 0
	beq _0809318C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	b _08093198
_0809318C:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
_08093198:
	strb r0, [r2]
	ldrh r2, [r4, 0x32]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 7
	adds r0, r2, r0
	lsls r0, 24
	ldr r1, _080931C4
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _080931B6
	adds r0, 0x7F
_080931B6:
	asrs r0, 7
	strh r0, [r4, 0x26]
	adds r0, r2, 0
	adds r0, 0x8
	strh r0, [r4, 0x32]
	b _080931D4
	.align 2, 0
_080931C4: .4byte gSineTable
_080931C8:
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080931D4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8092FD8

	thumb_func_start sub_809308C
sub_809308C: @ 80931DC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08093254
	adds r0, r6, 0
	movs r1, 0xB8
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08093258
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r1, r4
	movs r2, 0
	strh r5, [r0, 0x2E]
	strh r2, [r0, 0x30]
	movs r0, 0x1C
	adds r0, r4
	mov r9, r0
	add r1, r9
	ldr r0, _0809325C
	mov r8, r0
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0xB8
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r4
	strh r5, [r4, 0x2E]
	movs r0, 0x1
	strh r0, [r4, 0x30]
	adds r4, 0x3F
	ldrb r0, [r4]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r4]
	add r1, r9
	mov r0, r8
	str r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093254: .4byte gSpriteTemplate_83A053C
_08093258: .4byte gSprites
_0809325C: .4byte sub_8092FD8
	thumb_func_end sub_809308C

	.align 2, 0 @ Don't pad with nop.
