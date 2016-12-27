	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8056D9C
sub_8056D9C: @ 80570DC
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8056D9C

	thumb_func_start sub_8056DA0
sub_8056DA0: @ 80570E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080570F8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080570FC
	movs r0, 0
	b _080570FE
	.align 2, 0
_080570F8: .4byte gUnknown_08308E2C
_080570FC:
	movs r0, 0x1
_080570FE:
	pop {r1}
	bx r1
	thumb_func_end sub_8056DA0

	thumb_func_start MetatileBehavior_IsJumpEast
MetatileBehavior_IsJumpEast: @ 8057104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x38
	beq _08057112
	movs r0, 0
	b _08057114
_08057112:
	movs r0, 0x1
_08057114:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpEast

	thumb_func_start MetatileBehavior_IsJumpWest
MetatileBehavior_IsJumpWest: @ 8057118
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x39
	beq _08057126
	movs r0, 0
	b _08057128
_08057126:
	movs r0, 0x1
_08057128:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpWest

	thumb_func_start MetatileBehavior_IsJumpNorth
MetatileBehavior_IsJumpNorth: @ 805712C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3A
	beq _0805713A
	movs r0, 0
	b _0805713C
_0805713A:
	movs r0, 0x1
_0805713C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpNorth

	thumb_func_start MetatileBehavior_IsJumpSouth
MetatileBehavior_IsJumpSouth: @ 8057140
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	beq _0805714E
	movs r0, 0
	b _08057150
_0805714E:
	movs r0, 0x1
_08057150:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpSouth

	thumb_func_start sub_8056E14
sub_8056E14: @ 8057154
	push {lr}
	lsls r0, 24
	movs r1, 0xFE
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057168
	movs r0, 0
	b _0805716A
_08057168:
	movs r0, 0x1
_0805716A:
	pop {r1}
	bx r1
	thumb_func_end sub_8056E14

	thumb_func_start MetatileBehavior_IsSandOrDeepSand
MetatileBehavior_IsSandOrDeepSand: @ 8057170
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x21
	beq _0805717E
	cmp r0, 0x6
	bne _08057182
_0805717E:
	movs r0, 0x1
	b _08057184
_08057182:
	movs r0, 0
_08057184:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSandOrDeepSand

	thumb_func_start MetatileBehavior_IsDeepSand
MetatileBehavior_IsDeepSand: @ 8057188
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _08057196
	movs r0, 0
	b _08057198
_08057196:
	movs r0, 0x1
_08057198:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDeepSand

	thumb_func_start MetatileBehavior_IsReflective
MetatileBehavior_IsReflective: @ 805719C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _080571BA
	cmp r0, 0x16
	beq _080571BA
	cmp r0, 0x1A
	beq _080571BA
	cmp r0, 0x20
	beq _080571BA
	cmp r0, 0x14
	beq _080571BA
	cmp r0, 0x2B
	bne _080571BE
_080571BA:
	movs r0, 0x1
	b _080571C0
_080571BE:
	movs r0, 0
_080571C0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsReflective

	thumb_func_start MetatileBehavior_IsIce
MetatileBehavior_IsIce: @ 80571C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _080571D2
	movs r0, 0
	b _080571D4
_080571D2:
	movs r0, 0x1
_080571D4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce

	thumb_func_start is_tile_x69_2_warp_door
is_tile_x69_2_warp_door: @ 80571D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x69
	beq _080571E6
	movs r0, 0
	b _080571E8
_080571E6:
	movs r0, 0x1
_080571E8:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x69_2_warp_door

	thumb_func_start MetatileBehavior_IsDoor
MetatileBehavior_IsDoor: @ 80571EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8D
	beq _080571FA
	cmp r0, 0x69
	bne _080571FE
_080571FA:
	movs r0, 0x1
	b _08057200
_080571FE:
	movs r0, 0
_08057200:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDoor

	thumb_func_start MetatileBehavior_IsEscalator
MetatileBehavior_IsEscalator: @ 8057204
	push {lr}
	lsls r0, 24
	movs r1, 0x96
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057218
	movs r0, 0
	b _0805721A
_08057218:
	movs r0, 0x1
_0805721A:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEscalator

	thumb_func_start unref_sub_8056EE0
unref_sub_8056EE0: @ 8057220
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _0805722E
	movs r0, 0
	b _08057230
_0805722E:
	movs r0, 0x1
_08057230:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8056EE0

	thumb_func_start MetatileBehavior_IsLadder
MetatileBehavior_IsLadder: @ 8057234
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x61
	beq _08057242
	movs r0, 0
	b _08057244
_08057242:
	movs r0, 0x1
_08057244:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLadder

	thumb_func_start sub_8056F08
sub_8056F08: @ 8057248
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x60
	beq _0805725A
	cmp r0, 0x6C
	beq _0805725A
	cmp r0, 0x6E
	bne _0805725E
_0805725A:
	movs r0, 0x1
	b _08057260
_0805725E:
	movs r0, 0
_08057260:
	pop {r1}
	bx r1
	thumb_func_end sub_8056F08

	thumb_func_start sub_8056F24
sub_8056F24: @ 8057264
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6E
	beq _08057272
	movs r0, 0
	b _08057274
_08057272:
	movs r0, 0x1
_08057274:
	pop {r1}
	bx r1
	thumb_func_end sub_8056F24

	thumb_func_start MetatileBehavior_IsSurfableWaterOrUnderwater
MetatileBehavior_IsSurfableWaterOrUnderwater: @ 8057278
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08057290
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08057294
	movs r0, 0
	b _08057296
	.align 2, 0
_08057290: .4byte gUnknown_08308E2C
_08057294:
	movs r0, 0x1
_08057296:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableWaterOrUnderwater

	thumb_func_start MetatileBehavior_IsEastArrowWarp
MetatileBehavior_IsEastArrowWarp: @ 805729C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x62
	beq _080572AA
	movs r0, 0
	b _080572AC
_080572AA:
	movs r0, 0x1
_080572AC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastArrowWarp

	thumb_func_start MetatileBehavior_IsWestArrowWarp
MetatileBehavior_IsWestArrowWarp: @ 80572B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	beq _080572BE
	movs r0, 0
	b _080572C0
_080572BE:
	movs r0, 0x1
_080572C0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestArrowWarp

	thumb_func_start MetatileBehavior_IsNorthArrowWarp
MetatileBehavior_IsNorthArrowWarp: @ 80572C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x64
	beq _080572D2
	cmp r0, 0x1B
	bne _080572D6
_080572D2:
	movs r0, 0x1
	b _080572D8
_080572D6:
	movs r0, 0
_080572D8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthArrowWarp

	thumb_func_start MetatileBehavior_IsSouthArrowWarp
MetatileBehavior_IsSouthArrowWarp: @ 80572DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	beq _080572EE
	cmp r0, 0x6D
	beq _080572EE
	cmp r0, 0x1C
	bne _080572F2
_080572EE:
	movs r0, 0x1
	b _080572F4
_080572F2:
	movs r0, 0
_080572F4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthArrowWarp

	thumb_func_start MetatileBehavior_IsArrowWarp
MetatileBehavior_IsArrowWarp: @ 80572F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	adds r0, r4, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08057330
	adds r0, r4, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08057330
	adds r0, r4, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08057330
	adds r0, r4, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _08057332
_08057330:
	movs r5, 0x1
_08057332:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsArrowWarp

	thumb_func_start sub_8056FFC
sub_8056FFC: @ 805733C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC0
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x8
	bls _08057372
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057372
	cmp r1, 0xD0
	beq _08057372
	cmp r1, 0xD2
	beq _08057372
	cmp r1, 0x13
	beq _08057372
	cmp r1, 0x20
	beq _08057372
	cmp r1, 0xBB
	beq _08057372
	cmp r1, 0xBC
	bne _08057376
_08057372:
	movs r0, 0x1
	b _08057378
_08057376:
	movs r0, 0
_08057378:
	pop {r1}
	bx r1
	thumb_func_end sub_8056FFC

	thumb_func_start MetatileBehavior_IsIce_2
MetatileBehavior_IsIce_2: @ 805737C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _0805738A
	movs r0, 0
	b _0805738C
_0805738A:
	movs r0, 0x1
_0805738C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce_2

	thumb_func_start MetatileBehavior_IsTrickHouseSlipperyFloor
MetatileBehavior_IsTrickHouseSlipperyFloor: @ 8057390
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x48
	beq _0805739E
	movs r0, 0
	b _080573A0
_0805739E:
	movs r0, 0x1
_080573A0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrickHouseSlipperyFloor

	thumb_func_start MetatileBehavior_0x05
MetatileBehavior_0x05: @ 80573A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _080573B2
	movs r0, 0
	b _080573B4
_080573B2:
	movs r0, 0x1
_080573B4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0x05

	thumb_func_start MetatileBehavior_IsWalkNorth
MetatileBehavior_IsWalkNorth: @ 80573B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x42
	beq _080573C6
	movs r0, 0
	b _080573C8
_080573C6:
	movs r0, 0x1
_080573C8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkNorth

	thumb_func_start MetatileBehavior_IsWalkSouth
MetatileBehavior_IsWalkSouth: @ 80573CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x43
	beq _080573DA
	movs r0, 0
	b _080573DC
_080573DA:
	movs r0, 0x1
_080573DC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkSouth

	thumb_func_start MetatileBehavior_IsWalkWest
MetatileBehavior_IsWalkWest: @ 80573E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x41
	beq _080573EE
	movs r0, 0
	b _080573F0
_080573EE:
	movs r0, 0x1
_080573F0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkWest

	thumb_func_start MetatileBehavior_IsWalkEast
MetatileBehavior_IsWalkEast: @ 80573F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08057402
	movs r0, 0
	b _08057404
_08057402:
	movs r0, 0x1
_08057404:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkEast

	thumb_func_start MetatileBehavior_IsNorthwardCurrent
MetatileBehavior_IsNorthwardCurrent: @ 8057408
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x52
	beq _08057416
	movs r0, 0
	b _08057418
_08057416:
	movs r0, 0x1
_08057418:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthwardCurrent

	thumb_func_start MetatileBehavior_IsSouthwardCurrent
MetatileBehavior_IsSouthwardCurrent: @ 805741C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x53
	beq _0805742A
	movs r0, 0
	b _0805742C
_0805742A:
	movs r0, 0x1
_0805742C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthwardCurrent

	thumb_func_start MetatileBehavior_IsWestwardCurrent
MetatileBehavior_IsWestwardCurrent: @ 8057430
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x51
	beq _0805743E
	movs r0, 0
	b _08057440
_0805743E:
	movs r0, 0x1
_08057440:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestwardCurrent

	thumb_func_start MetatileBehavior_IsEastwardCurrent
MetatileBehavior_IsEastwardCurrent: @ 8057444
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x50
	beq _08057452
	movs r0, 0
	b _08057454
_08057452:
	movs r0, 0x1
_08057454:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastwardCurrent

	thumb_func_start MetatileBehavior_IsSlideNorth
MetatileBehavior_IsSlideNorth: @ 8057458
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x46
	beq _08057466
	movs r0, 0
	b _08057468
_08057466:
	movs r0, 0x1
_08057468:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideNorth

	thumb_func_start MetatileBehavior_IsSlideSouth
MetatileBehavior_IsSlideSouth: @ 805746C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x47
	beq _0805747A
	movs r0, 0
	b _0805747C
_0805747A:
	movs r0, 0x1
_0805747C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideSouth

	thumb_func_start MetatileBehavior_IsSlideWest
MetatileBehavior_IsSlideWest: @ 8057480
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x45
	beq _0805748E
	movs r0, 0
	b _08057490
_0805748E:
	movs r0, 0x1
_08057490:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideWest

	thumb_func_start MetatileBehavior_IsSlideEast
MetatileBehavior_IsSlideEast: @ 8057494
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x44
	beq _080574A2
	movs r0, 0
	b _080574A4
_080574A2:
	movs r0, 0x1
_080574A4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideEast

	thumb_func_start MetatileBehavior_IsCounter
MetatileBehavior_IsCounter: @ 80574A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x80
	beq _080574B6
	movs r0, 0
	b _080574B8
_080574B6:
	movs r0, 0x1
_080574B8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCounter

	thumb_func_start MetatileBehavior_IsPlayerFacingTVScreen
MetatileBehavior_IsPlayerFacingTVScreen: @ 80574BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _080574CE
	cmp r0, 0x86
	beq _080574D2
_080574CE:
	movs r0, 0
	b _080574D4
_080574D2:
	movs r0, 0x1
_080574D4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerFacingTVScreen

	thumb_func_start MetatileBehavior_IsPC
MetatileBehavior_IsPC: @ 80574D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x83
	beq _080574E6
	movs r0, 0
	b _080574E8
_080574E6:
	movs r0, 0x1
_080574E8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPC

	thumb_func_start is_tile_x84
is_tile_x84: @ 80574EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x84
	beq _080574FA
	movs r0, 0
	b _080574FC
_080574FA:
	movs r0, 0x1
_080574FC:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x84

	thumb_func_start sub_80571C0
sub_80571C0: @ 8057500
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x91
	beq _08057522
	cmp r0, 0x93
	beq _08057522
	cmp r0, 0x95
	beq _08057522
	cmp r0, 0x97
	beq _08057522
	cmp r0, 0x99
	beq _08057522
	cmp r0, 0x9B
	beq _08057522
	cmp r0, 0x9D
	bne _08057526
_08057522:
	movs r0, 0x1
	b _08057528
_08057526:
	movs r0, 0
_08057528:
	pop {r1}
	bx r1
	thumb_func_end sub_80571C0

	thumb_func_start sub_80571EC
sub_80571EC: @ 805752C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x90
	beq _08057542
	cmp r0, 0x92
	beq _08057542
	cmp r0, 0x94
	beq _08057542
	cmp r0, 0x9A
	bne _08057546
_08057542:
	movs r0, 0x1
	b _08057548
_08057546:
	movs r0, 0
_08057548:
	pop {r1}
	bx r1
	thumb_func_end sub_80571EC

	thumb_func_start sub_805720C
sub_805720C: @ 805754C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x96
	beq _0805755A
	cmp r0, 0x9C
	bne _0805755E
_0805755A:
	movs r0, 0x1
	b _08057560
_0805755E:
	movs r0, 0
_08057560:
	pop {r1}
	bx r1
	thumb_func_end sub_805720C

	thumb_func_start is_tile_x98
is_tile_x98: @ 8057564
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x98
	beq _08057572
	movs r0, 0
	b _08057574
_08057572:
	movs r0, 0x1
_08057574:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x98

	thumb_func_start sub_8057238
sub_8057238: @ 8057578
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB0
	beq _08057586
	movs r0, 0
	b _08057588
_08057586:
	movs r0, 0x1
_08057588:
	pop {r1}
	bx r1
	thumb_func_end sub_8057238

	thumb_func_start sub_805724C
sub_805724C: @ 805758C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB1
	beq _0805759A
	movs r0, 0
	b _0805759C
_0805759A:
	movs r0, 0x1
_0805759C:
	pop {r1}
	bx r1
	thumb_func_end sub_805724C

	thumb_func_start unref_sub_8057260
unref_sub_8057260: @ 80575A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB2
	beq _080575AE
	movs r0, 0
	b _080575B0
_080575AE:
	movs r0, 0x1
_080575B0:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8057260

	thumb_func_start sub_8057274
sub_8057274: @ 80575B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB3
	beq _080575C2
	movs r0, 0
	b _080575C4
_080575C2:
	movs r0, 0x1
_080575C4:
	pop {r1}
	bx r1
	thumb_func_end sub_8057274

	thumb_func_start sub_8057288
sub_8057288: @ 80575C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB9
	beq _080575D6
	movs r0, 0
	b _080575D8
_080575D6:
	movs r0, 0x1
_080575D8:
	pop {r1}
	bx r1
	thumb_func_end sub_8057288

	thumb_func_start sub_805729C
sub_805729C: @ 80575DC
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _080575E8
	movs r0, 0
	b _080575EA
_080575E8:
	movs r0, 0x1
_080575EA:
	pop {r1}
	bx r1
	thumb_func_end sub_805729C

	thumb_func_start sub_80572B0
sub_80572B0: @ 80575F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB7
	beq _080575FE
	movs r0, 0
	b _08057600
_080575FE:
	movs r0, 0x1
_08057600:
	pop {r1}
	bx r1
	thumb_func_end sub_80572B0

	thumb_func_start unref_sub_80572C4
unref_sub_80572C4: @ 8057604
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB2
	beq _08057612
	movs r0, 0
	b _08057614
_08057612:
	movs r0, 0x1
_08057614:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80572C4

	thumb_func_start sub_80572D8
sub_80572D8: @ 8057618
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB5
	beq _08057626
	movs r0, 0
	b _08057628
_08057626:
	movs r0, 0x1
_08057628:
	pop {r1}
	bx r1
	thumb_func_end sub_80572D8

	thumb_func_start sub_80572EC
sub_80572EC: @ 805762C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC3
	beq _0805763A
	movs r0, 0
	b _0805763C
_0805763A:
	movs r0, 0x1
_0805763C:
	pop {r1}
	bx r1
	thumb_func_end sub_80572EC

	thumb_func_start sub_8057300
sub_8057300: @ 8057640
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC2
	beq _0805764E
	movs r0, 0
	b _08057650
_0805764E:
	movs r0, 0x1
_08057650:
	pop {r1}
	bx r1
	thumb_func_end sub_8057300

	thumb_func_start sub_8057314
sub_8057314: @ 8057654
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB8
	beq _08057662
	movs r0, 0
	b _08057664
_08057662:
	movs r0, 0x1
_08057664:
	pop {r1}
	bx r1
	thumb_func_end sub_8057314

	thumb_func_start sub_8057328
sub_8057328: @ 8057668
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBE
	beq _08057676
	movs r0, 0
	b _08057678
_08057676:
	movs r0, 0x1
_08057678:
	pop {r1}
	bx r1
	thumb_func_end sub_8057328

	thumb_func_start sub_805733C
sub_805733C: @ 805767C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBD
	beq _0805768A
	movs r0, 0
	b _0805768C
_0805768A:
	movs r0, 0x1
_0805768C:
	pop {r1}
	bx r1
	thumb_func_end sub_805733C

	thumb_func_start sub_8057350
sub_8057350: @ 8057690
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBA
	beq _0805769E
	movs r0, 0
	b _080576A0
_0805769E:
	movs r0, 0x1
_080576A0:
	pop {r1}
	bx r1
	thumb_func_end sub_8057350

	thumb_func_start sub_8057364
sub_8057364: @ 80576A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBF
	beq _080576B2
	movs r0, 0
	b _080576B4
_080576B2:
	movs r0, 0x1
_080576B4:
	pop {r1}
	bx r1
	thumb_func_end sub_8057364

	thumb_func_start sub_8057378
sub_8057378: @ 80576B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC4
	beq _080576C6
	movs r0, 0
	b _080576C8
_080576C6:
	movs r0, 0x1
_080576C8:
	pop {r1}
	bx r1
	thumb_func_end sub_8057378

	thumb_func_start sub_805738C
sub_805738C: @ 80576CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC5
	beq _080576DA
	movs r0, 0
	b _080576DC
_080576DA:
	movs r0, 0x1
_080576DC:
	pop {r1}
	bx r1
	thumb_func_end sub_805738C

	thumb_func_start MetatileBehavior_HasRipples
MetatileBehavior_HasRipples: @ 80576E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _080576F2
	cmp r0, 0x16
	beq _080576F2
	cmp r0, 0x14
	bne _080576F6
_080576F2:
	movs r0, 0x1
	b _080576F8
_080576F6:
	movs r0, 0
_080576F8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_HasRipples

	thumb_func_start MetatileBehavior_IsPuddle
MetatileBehavior_IsPuddle: @ 80576FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x16
	beq _0805770A
	movs r0, 0
	b _0805770C
_0805770A:
	movs r0, 0x1
_0805770C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPuddle

	thumb_func_start MetatileBehavior_IsTallGrass
MetatileBehavior_IsTallGrass: @ 8057710
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0805771E
	movs r0, 0
	b _08057720
_0805771E:
	movs r0, 0x1
_08057720:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTallGrass

	thumb_func_start MetatileBehavior_IsLongGrass
MetatileBehavior_IsLongGrass: @ 8057724
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08057732
	movs r0, 0
	b _08057734
_08057732:
	movs r0, 0x1
_08057734:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLongGrass

	thumb_func_start MetatileBehavior_IsBerryTreeSoil
MetatileBehavior_IsBerryTreeSoil: @ 8057738
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA0
	beq _08057746
	movs r0, 0
	b _08057748
_08057746:
	movs r0, 0x1
_08057748:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBerryTreeSoil

	thumb_func_start MetatileBehavior_IsAsh
MetatileBehavior_IsAsh: @ 805774C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x24
	beq _0805775A
	movs r0, 0
	b _0805775C
_0805775A:
	movs r0, 0x1
_0805775C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAsh

	thumb_func_start MetatileBehavior_IsUnusedFootprintMetatile
MetatileBehavior_IsUnusedFootprintMetatile: @ 8057760
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x25
	beq _0805776E
	movs r0, 0
	b _08057770
_0805776E:
	movs r0, 0x1
_08057770:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsUnusedFootprintMetatile

	thumb_func_start MetatileBehavior_IsBridge
MetatileBehavior_IsBridge: @ 8057774
	push {lr}
	lsls r0, 24
	movs r1, 0x90
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057788
	movs r0, 0
	b _0805778A
_08057788:
	movs r0, 0x1
_0805778A:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBridge

	thumb_func_start sub_8057450
sub_8057450: @ 8057790
	push {lr}
	lsls r0, 24
	movs r1, 0x90
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _080577A2
	movs r0, 0
_080577A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8057450

	thumb_func_start MetatileBehavior_IsLandWildEncounter
MetatileBehavior_IsLandWildEncounter: @ 80577A8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _080577CC
	adds r0, r4, 0
	bl sub_8056DA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080577CC
	movs r0, 0x1
	b _080577CE
_080577CC:
	movs r0, 0
_080577CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLandWildEncounter

	thumb_func_start MetatileBehavior_IsWaterWildEncounter
MetatileBehavior_IsWaterWildEncounter: @ 80577D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080577FA
	adds r0, r4, 0
	bl sub_8056DA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080577FA
	movs r0, 0x1
	b _080577FC
_080577FA:
	movs r0, 0
_080577FC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterWildEncounter

	thumb_func_start sub_80574C4
sub_80574C4: @ 8057804
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	beq _08057812
	movs r0, 0
	b _08057814
_08057812:
	movs r0, 0x1
_08057814:
	pop {r1}
	bx r1
	thumb_func_end sub_80574C4

	thumb_func_start sub_80574D8
sub_80574D8: @ 8057818
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC
	beq _08057826
	movs r0, 0
	b _08057828
_08057826:
	movs r0, 0x1
_08057828:
	pop {r1}
	bx r1
	thumb_func_end sub_80574D8

	thumb_func_start sub_80574EC
sub_80574EC: @ 805782C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xEF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057842
	cmp r1, 0x14
	bne _08057846
_08057842:
	movs r0, 0x1
	b _08057848
_08057846:
	movs r0, 0
_08057848:
	pop {r1}
	bx r1
	thumb_func_end sub_80574EC

	thumb_func_start sub_805750C
sub_805750C: @ 805784C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x19
	beq _0805785A
	cmp r0, 0x2A
	bne _0805785E
_0805785A:
	movs r0, 0x1
	b _08057860
_0805785E:
	movs r0, 0
_08057860:
	pop {r1}
	bx r1
	thumb_func_end sub_805750C

	thumb_func_start MetatileBehavior_IsShallowFlowingWater
MetatileBehavior_IsShallowFlowingWater: @ 8057864
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x17
	beq _08057876
	cmp r0, 0x1B
	beq _08057876
	cmp r0, 0x1C
	bne _0805787A
_08057876:
	movs r0, 0x1
	b _0805787C
_0805787A:
	movs r0, 0
_0805787C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShallowFlowingWater

	thumb_func_start sub_8057540
sub_8057540: @ 8057880
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x26
	beq _0805788E
	movs r0, 0
	b _08057890
_0805788E:
	movs r0, 0x1
_08057890:
	pop {r1}
	bx r1
	thumb_func_end sub_8057540

	thumb_func_start sub_8057554
sub_8057554: @ 8057894
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	beq _080578A2
	movs r0, 0
	b _080578A4
_080578A2:
	movs r0, 0x1
_080578A4:
	pop {r1}
	bx r1
	thumb_func_end sub_8057554

	thumb_func_start sub_8057568
sub_8057568: @ 80578A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	beq _080578BA
	cmp r0, 0x11
	beq _080578BA
	cmp r0, 0x12
	bne _080578BE
_080578BA:
	movs r0, 0x1
	b _080578C0
_080578BE:
	movs r0, 0
_080578C0:
	pop {r1}
	bx r1
	thumb_func_end sub_8057568

	thumb_func_start unref_sub_8057584
unref_sub_8057584: @ 80578C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	beq _080578D2
	cmp r0, 0x1A
	bne _080578D6
_080578D2:
	movs r0, 0x1
	b _080578D8
_080578D6:
	movs r0, 0
_080578D8:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8057584

	thumb_func_start sub_805759C
sub_805759C: @ 80578DC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080578FE
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080578FE
	movs r0, 0x1
	b _08057900
_080578FE:
	movs r0, 0
_08057900:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805759C

	thumb_func_start MetatileBehavior_IsEastBlocked
MetatileBehavior_IsEastBlocked: @ 8057908
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x30
	beq _08057922
	cmp r0, 0x34
	beq _08057922
	cmp r0, 0x36
	beq _08057922
	cmp r0, 0xC1
	beq _08057922
	cmp r0, 0xBE
	bne _08057926
_08057922:
	movs r0, 0x1
	b _08057928
_08057926:
	movs r0, 0
_08057928:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastBlocked

	thumb_func_start MetatileBehavior_IsWestBlocked
MetatileBehavior_IsWestBlocked: @ 805792C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	beq _08057946
	cmp r0, 0x35
	beq _08057946
	cmp r0, 0x37
	beq _08057946
	cmp r0, 0xC1
	beq _08057946
	cmp r0, 0xBE
	bne _0805794A
_08057946:
	movs r0, 0x1
	b _0805794C
_0805794A:
	movs r0, 0
_0805794C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestBlocked

	thumb_func_start MetatileBehavior_IsNorthBlocked
MetatileBehavior_IsNorthBlocked: @ 8057950
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x32
	beq _08057966
	cmp r0, 0x34
	beq _08057966
	cmp r0, 0x35
	beq _08057966
	cmp r0, 0xC0
	bne _0805796A
_08057966:
	movs r0, 0x1
	b _0805796C
_0805796A:
	movs r0, 0
_0805796C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthBlocked

	thumb_func_start MetatileBehavior_IsSouthBlocked
MetatileBehavior_IsSouthBlocked: @ 8057970
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	beq _08057986
	cmp r0, 0x36
	beq _08057986
	cmp r0, 0x37
	beq _08057986
	cmp r0, 0xC0
	bne _0805798A
_08057986:
	movs r0, 0x1
	b _0805798C
_0805798A:
	movs r0, 0
_0805798C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthBlocked

	thumb_func_start MetatileBehavior_IsShortGrass
MetatileBehavior_IsShortGrass: @ 8057990
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	beq _0805799E
	movs r0, 0
	b _080579A0
_0805799E:
	movs r0, 0x1
_080579A0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShortGrass

	thumb_func_start MetatileBehavior_IsHotSprings
MetatileBehavior_IsHotSprings: @ 80579A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x28
	beq _080579B2
	movs r0, 0
	b _080579B4
_080579B2:
	movs r0, 0x1
_080579B4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHotSprings

	thumb_func_start MetatileBehavior_IsWaterfall
MetatileBehavior_IsWaterfall: @ 80579B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	beq _080579C6
	movs r0, 0
	b _080579C8
_080579C6:
	movs r0, 0x1
_080579C8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterfall

	thumb_func_start MetatileBehavior_IsFortreeBridge
MetatileBehavior_IsFortreeBridge: @ 80579CC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	beq _080579DA
	movs r0, 0
	b _080579DC
_080579DA:
	movs r0, 0x1
_080579DC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsFortreeBridge

	thumb_func_start sub_80576A0
sub_80576A0: @ 80579E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x74
	beq _080579EE
	movs r0, 0
	b _080579F0
_080579EE:
	movs r0, 0x1
_080579F0:
	pop {r1}
	bx r1
	thumb_func_end sub_80576A0

	thumb_func_start sub_80576B4
sub_80576B4: @ 80579F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x75
	beq _08057A02
	movs r0, 0
	b _08057A04
_08057A02:
	movs r0, 0x1
_08057A04:
	pop {r1}
	bx r1
	thumb_func_end sub_80576B4

	thumb_func_start sub_80576C8
sub_80576C8: @ 8057A08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x76
	beq _08057A16
	movs r0, 0
	b _08057A18
_08057A16:
	movs r0, 0x1
_08057A18:
	pop {r1}
	bx r1
	thumb_func_end sub_80576C8

	thumb_func_start sub_80576DC
sub_80576DC: @ 8057A1C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	beq _08057A2A
	movs r0, 0
	b _08057A2C
_08057A2A:
	movs r0, 0x1
_08057A2C:
	pop {r1}
	bx r1
	thumb_func_end sub_80576DC

	thumb_func_start MetatileBehavior_IsPacifidlogLog
MetatileBehavior_IsPacifidlogLog: @ 8057A30
	push {lr}
	lsls r0, 24
	movs r1, 0x8C
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057A44
	movs r0, 0
	b _08057A46
_08057A44:
	movs r0, 0x1
_08057A46:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifidlogLog

	thumb_func_start is_tile_x8C
is_tile_x8C: @ 8057A4C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8C
	beq _08057A5A
	movs r0, 0
	b _08057A5C
_08057A5A:
	movs r0, 0x1
_08057A5C:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8C

	thumb_func_start is_tile_x85
is_tile_x85: @ 8057A60
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x85
	beq _08057A6E
	movs r0, 0
	b _08057A70
_08057A6E:
	movs r0, 0x1
_08057A70:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x85

	thumb_func_start is_tile_x8B
is_tile_x8B: @ 8057A74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8B
	beq _08057A82
	movs r0, 0
	b _08057A84
_08057A82:
	movs r0, 0x1
_08057A84:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8B

	thumb_func_start is_tile_x8A
is_tile_x8A: @ 8057A88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8A
	beq _08057A96
	movs r0, 0
	b _08057A98
_08057A96:
	movs r0, 0x1
_08057A98:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8A

	thumb_func_start is_tile_x87
is_tile_x87: @ 8057A9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x87
	beq _08057AAA
	movs r0, 0
	b _08057AAC
_08057AAA:
	movs r0, 0x1
_08057AAC:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x87

	thumb_func_start MetatileBehavior_0xBB
MetatileBehavior_0xBB: @ 8057AB0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBB
	beq _08057ABE
	movs r0, 0
	b _08057AC0
_08057ABE:
	movs r0, 0x1
_08057AC0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0xBB

	thumb_func_start MetatileBehavior_0xBC
MetatileBehavior_0xBC: @ 8057AC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBC
	beq _08057AD2
	movs r0, 0
	b _08057AD4
_08057AD2:
	movs r0, 0x1
_08057AD4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0xBC

	thumb_func_start sub_8057798
sub_8057798: @ 8057AD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x29
	beq _08057AE6
	movs r0, 0
	b _08057AE8
_08057AE6:
	movs r0, 0x1
_08057AE8:
	pop {r1}
	bx r1
	thumb_func_end sub_8057798

	thumb_func_start is_role_x68
is_role_x68: @ 8057AEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x68
	beq _08057AFA
	movs r0, 0
	b _08057AFC
_08057AFA:
	movs r0, 0x1
_08057AFC:
	pop {r1}
	bx r1
	thumb_func_end is_role_x68

	thumb_func_start MetatileBehavior_IsAquaHideoutWarp
MetatileBehavior_IsAquaHideoutWarp: @ 8057B00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x67
	beq _08057B0E
	movs r0, 0
	b _08057B10
_08057B0E:
	movs r0, 0x1
_08057B10:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAquaHideoutWarp

	thumb_func_start MetatileBehavior_IsSurfableFishableWater
MetatileBehavior_IsSurfableFishableWater: @ 8057B14
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08057B38
	cmp r0, 0x15
	beq _08057B38
	cmp r0, 0x11
	beq _08057B38
	cmp r0, 0x12
	beq _08057B38
	cmp r0, 0x14
	beq _08057B38
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08057B3C
_08057B38:
	movs r0, 0x1
	b _08057B3E
_08057B3C:
	movs r0, 0
_08057B3E:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableFishableWater

	thumb_func_start sub_8057804
sub_8057804: @ 8057B44
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	beq _08057B52
	movs r0, 0
	b _08057B54
_08057B52:
	movs r0, 0x1
_08057B54:
	pop {r1}
	bx r1
	thumb_func_end sub_8057804

	thumb_func_start sub_8057818
sub_8057818: @ 8057B58
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x66
	beq _08057B66
	movs r0, 0
	b _08057B68
_08057B66:
	movs r0, 0x1
_08057B68:
	pop {r1}
	bx r1
	thumb_func_end sub_8057818

	thumb_func_start sub_805782C
sub_805782C: @ 8057B6C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD2
	beq _08057B7A
	movs r0, 0
	b _08057B7C
_08057B7A:
	movs r0, 0x1
_08057B7C:
	pop {r1}
	bx r1
	thumb_func_end sub_805782C

	thumb_func_start MetatileBehavior_IsMuddySlope
MetatileBehavior_IsMuddySlope: @ 8057B80
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD0
	beq _08057B8E
	movs r0, 0
	b _08057B90
_08057B8E:
	movs r0, 0x1
_08057B90:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMuddySlope

	thumb_func_start MetatileBehavior_IsBumpySlope
MetatileBehavior_IsBumpySlope: @ 8057B94
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD1
	beq _08057BA2
	movs r0, 0
	b _08057BA4
_08057BA2:
	movs r0, 0x1
_08057BA4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBumpySlope

	thumb_func_start MetatileBehavior_IsIsolatedVerticalRail
MetatileBehavior_IsIsolatedVerticalRail: @ 8057BA8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD3
	beq _08057BB6
	movs r0, 0
	b _08057BB8
_08057BB6:
	movs r0, 0x1
_08057BB8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedVerticalRail

	thumb_func_start MetatileBehavior_IsIsolatedHorizontalRail
MetatileBehavior_IsIsolatedHorizontalRail: @ 8057BBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD4
	beq _08057BCA
	movs r0, 0
	b _08057BCC
_08057BCA:
	movs r0, 0x1
_08057BCC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedHorizontalRail

	thumb_func_start MetatileBehavior_IsVerticalRail
MetatileBehavior_IsVerticalRail: @ 8057BD0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD5
	beq _08057BDE
	movs r0, 0
	b _08057BE0
_08057BDE:
	movs r0, 0x1
_08057BE0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsVerticalRail

	thumb_func_start MetatileBehavior_IsHorizontalRail
MetatileBehavior_IsHorizontalRail: @ 8057BE4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD6
	beq _08057BF2
	movs r0, 0
	b _08057BF4
_08057BF2:
	movs r0, 0x1
_08057BF4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHorizontalRail

	thumb_func_start MetatileBehavior_IsSeaweed
MetatileBehavior_IsSeaweed: @ 8057BF8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x22
	beq _08057C06
	cmp r0, 0x2A
	bne _08057C0A
_08057C06:
	movs r0, 0x1
	b _08057C0C
_08057C0A:
	movs r0, 0
_08057C0C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSeaweed

	thumb_func_start MetatileBehavior_IsRunningDisallowed
MetatileBehavior_IsRunningDisallowed: @ 8057C10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	beq _08057C2C
	cmp r0, 0x3
	beq _08057C2C
	cmp r0, 0x28
	beq _08057C2C
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _08057C30
_08057C2C:
	movs r0, 0x1
	b _08057C32
_08057C30:
	movs r0, 0
_08057C32:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRunningDisallowed

	thumb_func_start sub_80578F8
sub_80578F8: @ 8057C38
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFE
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057C52
	cmp r1, 0x24
	beq _08057C52
	cmp r1, 0x9
	bne _08057C56
_08057C52:
	movs r0, 0x1
	b _08057C58
_08057C56:
	movs r0, 0
_08057C58:
	pop {r1}
	bx r1
	thumb_func_end sub_80578F8

	thumb_func_start sub_805791C
sub_805791C: @ 8057C5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8E
	beq _08057C6A
	movs r0, 0
	b _08057C6C
_08057C6A:
	movs r0, 0x1
_08057C6C:
	pop {r1}
	bx r1
	thumb_func_end sub_805791C

	thumb_func_start sub_8057930
sub_8057930: @ 8057C70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE0
	beq _08057C7E
	movs r0, 0
	b _08057C80
_08057C7E:
	movs r0, 0x1
_08057C80:
	pop {r1}
	bx r1
	thumb_func_end sub_8057930

	thumb_func_start sub_8057944
sub_8057944: @ 8057C84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE1
	beq _08057C92
	movs r0, 0
	b _08057C94
_08057C92:
	movs r0, 0x1
_08057C94:
	pop {r1}
	bx r1
	thumb_func_end sub_8057944

	thumb_func_start sub_8057958
sub_8057958: @ 8057C98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE2
	beq _08057CA6
	movs r0, 0
	b _08057CA8
_08057CA6:
	movs r0, 0x1
_08057CA8:
	pop {r1}
	bx r1
	thumb_func_end sub_8057958

	thumb_func_start sub_805796C
sub_805796C: @ 8057CAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE3
	beq _08057CBA
	movs r0, 0
	b _08057CBC
_08057CBA:
	movs r0, 0x1
_08057CBC:
	pop {r1}
	bx r1
	thumb_func_end sub_805796C

	thumb_func_start sub_8057980
sub_8057980: @ 8057CC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE4
	beq _08057CCE
	movs r0, 0
	b _08057CD0
_08057CCE:
	movs r0, 0x1
_08057CD0:
	pop {r1}
	bx r1
	thumb_func_end sub_8057980

	thumb_func_start sub_8057994
sub_8057994: @ 8057CD4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE5
	beq _08057CE2
	movs r0, 0
	b _08057CE4
_08057CE2:
	movs r0, 0x1
_08057CE4:
	pop {r1}
	bx r1
	thumb_func_end sub_8057994

	thumb_func_start sub_80579A8
sub_80579A8: @ 8057CE8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE6
	beq _08057CF6
	movs r0, 0
	b _08057CF8
_08057CF6:
	movs r0, 0x1
_08057CF8:
	pop {r1}
	bx r1
	thumb_func_end sub_80579A8

	.align 2, 0 @ Don't pad with nop.
