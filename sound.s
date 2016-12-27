	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start InitMapMusic
InitMapMusic: @ 8074F6C
	push {lr}
	ldr r1, _08074F7C
	movs r0, 0
	strb r0, [r1]
	bl ResetMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_08074F7C: .4byte gDisableMusic
	thumb_func_end InitMapMusic

	thumb_func_start MapMusicMain
MapMusicMain: @ 8074F80
	push {r4,r5,lr}
	ldr r0, _08074F98
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0x7
	bhi _08075062
	lsls r0, r1, 2
	ldr r1, _08074F9C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074F98: .4byte 0x030006d8
_08074F9C: .4byte _08074FA0
	.align 2, 0
_08074FA0:
	.4byte _08075062
	.4byte _08074FC0
	.4byte _08075062
	.4byte _08075062
	.4byte _08075062
	.4byte _08074FD4
	.4byte _08074FF4
	.4byte _08075030
_08074FC0:
	movs r0, 0x2
	strb r0, [r2]
	ldr r0, _08074FD0
	ldrh r0, [r0]
	bl PlayBGM
	b _08075062
	.align 2, 0
_08074FD0: .4byte 0x030006d4
_08074FD4:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08075062
	ldr r0, _08074FEC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08074FF0
	strb r1, [r0]
	b _08075062
	.align 2, 0
_08074FEC: .4byte 0x030006d6
_08074FF0: .4byte 0x030006d8
_08074FF4:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08075062
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08075062
	ldr r2, _08075024
	ldr r1, _08075028
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807502C
	movs r0, 0x2
	strb r0, [r1]
	ldrh r0, [r2]
	bl PlayBGM
	b _08075062
	.align 2, 0
_08075024: .4byte 0x030006d4
_08075028: .4byte 0x030006d6
_0807502C: .4byte 0x030006d8
_08075030:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08075062
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08075062
	ldr r4, _08075068
	ldrh r0, [r4]
	ldr r5, _0807506C
	ldrb r1, [r5]
	bl FadeInNewBGM
	ldr r1, _08075070
	ldrh r0, [r4]
	strh r0, [r1]
	movs r2, 0
	strh r2, [r4]
	ldr r1, _08075074
	movs r0, 0x2
	strb r0, [r1]
	strb r2, [r5]
_08075062:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075068: .4byte 0x030006d6
_0807506C: .4byte 0x030006d9
_08075070: .4byte 0x030006d4
_08075074: .4byte 0x030006d8
	thumb_func_end MapMusicMain

	thumb_func_start ResetMapMusic
ResetMapMusic: @ 8075078
	ldr r0, _0807508C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08075090
	strh r1, [r0]
	ldr r0, _08075094
	strb r1, [r0]
	ldr r0, _08075098
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807508C: .4byte 0x030006d4
_08075090: .4byte 0x030006d6
_08075094: .4byte 0x030006d8
_08075098: .4byte 0x030006d9
	thumb_func_end ResetMapMusic

	thumb_func_start GetCurrentMapMusic
GetCurrentMapMusic: @ 807509C
	ldr r0, _080750A4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080750A4: .4byte 0x030006d4
	thumb_func_end GetCurrentMapMusic

	thumb_func_start PlayNewMapMusic
PlayNewMapMusic: @ 80750A8
	ldr r1, _080750BC
	strh r0, [r1]
	ldr r1, _080750C0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080750C4
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080750BC: .4byte 0x030006d4
_080750C0: .4byte 0x030006d6
_080750C4: .4byte 0x030006d8
	thumb_func_end PlayNewMapMusic

	thumb_func_start StopMapMusic
StopMapMusic: @ 80750C8
	ldr r0, _080750DC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080750E0
	strh r1, [r0]
	ldr r1, _080750E4
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080750DC: .4byte 0x030006d4
_080750E0: .4byte 0x030006d6
_080750E4: .4byte 0x030006d8
	thumb_func_end StopMapMusic

	thumb_func_start FadeOutMapMusic
FadeOutMapMusic: @ 80750E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	cmp r0, 0
	beq _080750FE
	adds r0, r4, 0
	bl FadeOutBGM
_080750FE:
	ldr r0, _08075114
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08075118
	strh r1, [r0]
	ldr r1, _0807511C
	movs r0, 0x5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075114: .4byte 0x030006d4
_08075118: .4byte 0x030006d6
_0807511C: .4byte 0x030006d8
	thumb_func_end FadeOutMapMusic

	thumb_func_start FadeOutAndPlayNewMapMusic
FadeOutAndPlayNewMapMusic: @ 8075120
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	bl FadeOutMapMusic
	ldr r1, _08075148
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0807514C
	strh r4, [r0]
	ldr r1, _08075150
	movs r0, 0x6
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075148: .4byte 0x030006d4
_0807514C: .4byte 0x030006d6
_08075150: .4byte 0x030006d8
	thumb_func_end FadeOutAndPlayNewMapMusic

	thumb_func_start FadeOutAndFadeInNewMapMusic
FadeOutAndFadeInNewMapMusic: @ 8075154
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	bl FadeOutMapMusic
	ldr r1, _08075188
	movs r0, 0
	strh r0, [r1]
	ldr r0, _0807518C
	strh r4, [r0]
	ldr r1, _08075190
	movs r0, 0x7
	strb r0, [r1]
	ldr r0, _08075194
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075188: .4byte 0x030006d4
_0807518C: .4byte 0x030006d6
_08075190: .4byte 0x030006d8
_08075194: .4byte 0x030006d9
	thumb_func_end FadeOutAndFadeInNewMapMusic

	thumb_func_start FadeInNewMapMusic
FadeInNewMapMusic: @ 8075198
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FadeInNewBGM
	ldr r0, _080751C4
	strh r4, [r0]
	ldr r0, _080751C8
	movs r2, 0
	strh r2, [r0]
	ldr r1, _080751CC
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _080751D0
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080751C4: .4byte 0x030006d4
_080751C8: .4byte 0x030006d6
_080751CC: .4byte 0x030006d8
_080751D0: .4byte 0x030006d9
	thumb_func_end FadeInNewMapMusic

	thumb_func_start IsNotWaitingForBGMStop
IsNotWaitingForBGMStop: @ 80751D4
	push {lr}
	ldr r0, _080751EC
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _080751F0
	cmp r0, 0x5
	beq _080751F0
	cmp r0, 0x7
	beq _080751F0
	movs r0, 0x1
	b _080751F2
	.align 2, 0
_080751EC: .4byte 0x030006d8
_080751F0:
	movs r0, 0
_080751F2:
	pop {r1}
	bx r1
	thumb_func_end IsNotWaitingForBGMStop

	thumb_func_start PlayFanfareByFanfareNum
PlayFanfareByFanfareNum: @ 80751F8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08075220
	bl m4aMPlayStop
	ldr r0, _08075224
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4]
	ldr r2, _08075228
	ldrh r1, [r4, 0x2]
	strh r1, [r2]
	bl m4aSongNumStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075220: .4byte gMPlay_BGM
_08075224: .4byte gFanfares
_08075228: .4byte 0x030006da
	thumb_func_end PlayFanfareByFanfareNum

	thumb_func_start WaitFanfare
WaitFanfare: @ 807522C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _08075244
	ldrh r0, [r2]
	cmp r0, 0
	beq _08075248
	subs r0, 0x1
	strh r0, [r2]
	movs r0, 0
	b _08075260
	.align 2, 0
_08075244: .4byte 0x030006da
_08075248:
	cmp r1, 0
	bne _08075258
	ldr r0, _08075254
	bl m4aMPlayContinue
	b _0807525E
	.align 2, 0
_08075254: .4byte gMPlay_BGM
_08075258:
	movs r0, 0
	bl m4aSongNumStart
_0807525E:
	movs r0, 0x1
_08075260:
	pop {r1}
	bx r1
	thumb_func_end WaitFanfare

	thumb_func_start StopFanfareByFanfareNum
StopFanfareByFanfareNum: @ 8075264
	push {lr}
	lsls r0, 24
	ldr r1, _08075278
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_08075278: .4byte gFanfares
	thumb_func_end StopFanfareByFanfareNum

	thumb_func_start PlayFanfare
PlayFanfare: @ 807527C
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _0807529C
_08075286:
	ldrh r0, [r2]
	cmp r0, r3
	bne _080752A0
	lsls r0, r1, 24
	lsrs r0, 24
	bl PlayFanfareByFanfareNum
	bl CreateFanfareTask
	b _080752B2
	.align 2, 0
_0807529C: .4byte gFanfares
_080752A0:
	adds r2, 0x4
	adds r1, 0x1
	cmp r1, 0xB
	bls _08075286
	movs r0, 0
	bl PlayFanfareByFanfareNum
	bl CreateFanfareTask
_080752B2:
	pop {r0}
	bx r0
	thumb_func_end PlayFanfare

	thumb_func_start IsFanfareTaskInactive
IsFanfareTaskInactive: @ 80752B8
	push {lr}
	ldr r0, _080752CC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080752D0
	movs r0, 0x1
	b _080752D2
	.align 2, 0
_080752CC: .4byte Task_Fanfare
_080752D0:
	movs r0, 0
_080752D2:
	pop {r1}
	bx r1
	thumb_func_end IsFanfareTaskInactive

	thumb_func_start Task_Fanfare
Task_Fanfare: @ 80752D8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080752EC
	ldrh r0, [r1]
	cmp r0, 0
	beq _080752F0
	subs r0, 0x1
	strh r0, [r1]
	b _080752FC
	.align 2, 0
_080752EC: .4byte 0x030006da
_080752F0:
	ldr r0, _08075304
	bl m4aMPlayContinue
	adds r0, r4, 0
	bl DestroyTask
_080752FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075304: .4byte gMPlay_BGM
	thumb_func_end Task_Fanfare

	thumb_func_start CreateFanfareTask
CreateFanfareTask: @ 8075308
	push {r4,lr}
	ldr r4, _08075328
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08075322
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08075322:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075328: .4byte Task_Fanfare
	thumb_func_end CreateFanfareTask

	thumb_func_start FadeInNewBGM
FadeInNewBGM: @ 807532C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _0807536C
	ldrb r0, [r0]
	cmp r0, 0
	beq _08075340
	movs r5, 0
_08075340:
	adds r0, r5, 0
	bl m4aSongNumStart
	ldr r4, _08075370
	adds r0, r4, 0
	bl m4aMPlayImmInit
	ldr r1, _08075374
	adds r0, r4, 0
	movs r2, 0
	bl m4aMPlayVolumeControl
	adds r0, r5, 0
	bl m4aSongNumStop
	adds r0, r4, 0
	adds r1, r6, 0
	bl m4aMPlayFadeIn
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807536C: .4byte gDisableMusic
_08075370: .4byte gMPlay_BGM
_08075374: .4byte 0x0000ffff
	thumb_func_end FadeInNewBGM

	thumb_func_start FadeOutBGMTemporarily
FadeOutBGMTemporarily: @ 8075378
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0807538C
	bl m4aMPlayFadeOutTemporarily
	pop {r0}
	bx r0
	.align 2, 0
_0807538C: .4byte gMPlay_BGM
	thumb_func_end FadeOutBGMTemporarily

	thumb_func_start IsBGMPausedOrStopped
IsBGMPausedOrStopped: @ 8075390
	push {lr}
	ldr r0, _080753A8
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _080753B0
	ldr r0, _080753AC
	ands r1, r0
	cmp r1, 0
	beq _080753B0
	movs r0, 0
	b _080753B2
	.align 2, 0
_080753A8: .4byte gMPlay_BGM
_080753AC: .4byte 0x0000ffff
_080753B0:
	movs r0, 0x1
_080753B2:
	pop {r1}
	bx r1
	thumb_func_end IsBGMPausedOrStopped

	thumb_func_start FadeInBGM
FadeInBGM: @ 80753B8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080753CC
	bl m4aMPlayFadeIn
	pop {r0}
	bx r0
	.align 2, 0
_080753CC: .4byte gMPlay_BGM
	thumb_func_end FadeInBGM

	thumb_func_start FadeOutBGM
FadeOutBGM: @ 80753D0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080753E4
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_080753E4: .4byte gMPlay_BGM
	thumb_func_end FadeOutBGM

	thumb_func_start IsBGMStopped
IsBGMStopped: @ 80753E8
	push {lr}
	ldr r0, _080753F8
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	beq _080753FC
	movs r0, 0
	b _080753FE
	.align 2, 0
_080753F8: .4byte gMPlay_BGM
_080753FC:
	movs r0, 0x1
_080753FE:
	pop {r1}
	bx r1
	thumb_func_end IsBGMStopped

	thumb_func_start PlayCry1
PlayCry1: @ 8075404
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08075444
	ldr r1, _08075448
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	lsls r4, 24
	asrs r4, 24
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	ldr r1, _0807544C
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075444: .4byte gMPlay_BGM
_08075448: .4byte 0x0000ffff
_0807544C: .4byte gPokemonCryBGMDuckingCounter
	thumb_func_end PlayCry1

	thumb_func_start PlayCry2
PlayCry2: @ 8075450
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	movs r4, 0
	str r4, [sp]
	bl PlayCryInternal
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayCry2

	thumb_func_start PlayCry3
PlayCry3: @ 8075474
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x1
	bne _0807549A
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	b _080754BE
_0807549A:
	ldr r0, _080754C8
	ldr r1, _080754CC
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	ldr r1, _080754D0
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
_080754BE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080754C8: .4byte gMPlay_BGM
_080754CC: .4byte 0x0000ffff
_080754D0: .4byte gPokemonCryBGMDuckingCounter
	thumb_func_end PlayCry3

	thumb_func_start PlayCry4
PlayCry4: @ 80754D4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	adds r4, r2, 0
	cmp r2, 0x1
	bne _080754FE
	lsls r1, 24
	asrs r1, 24
	str r2, [sp]
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	b _08075524
_080754FE:
	ldr r0, _0807552C
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08075514
	ldr r0, _08075530
	ldr r1, _08075534
	movs r2, 0x55
	bl m4aMPlayVolumeControl
_08075514:
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
_08075524:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807552C: .4byte gUnknown_020239F8
_08075530: .4byte gMPlay_BGM
_08075534: .4byte 0x0000ffff
	thumb_func_end PlayCry4

	thumb_func_start PlayCry5
PlayCry5: @ 8075538
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08075574
	ldr r1, _08075578
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	ldr r1, _0807557C
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075574: .4byte gMPlay_BGM
_08075578: .4byte 0x0000ffff
_0807557C: .4byte gPokemonCryBGMDuckingCounter
	thumb_func_end PlayCry5

	thumb_func_start PlayCryInternal
PlayCryInternal: @ 8075580
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080755CC
	adds r0, r1
	lsrs r0, 16
	mov r8, r0
	movs r0, 0
	mov r9, r0
	movs r6, 0
	movs r7, 0x8C
	movs r5, 0xF0
	lsls r5, 6
	movs r1, 0
	str r1, [sp, 0x4]
	cmp r4, 0x5
	bhi _08075620
	lsls r0, r4, 2
	ldr r1, _080755D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080755CC: .4byte 0xffff0000
_080755D0: .4byte _080755D4
	.align 2, 0
_080755D4:
	.4byte _08075620
	.4byte _080755EC
	.4byte _080755F2
	.4byte _08075604
	.4byte _08075610
	.4byte _0807561C
_080755EC:
	movs r7, 0x14
	movs r6, 0xE1
	b _08075620
_080755F2:
	movs r7, 0x1E
	movs r6, 0xE1
	ldr r5, _08075600
	movs r2, 0x14
	str r2, [sp, 0x4]
	movs r2, 0x50
	b _08075620
	.align 2, 0
_08075600: .4byte 0x00003cf0
_08075604:
	movs r7, 0x32
	movs r6, 0xC8
	ldr r5, _0807560C
	b _08075620
	.align 2, 0
_0807560C: .4byte 0x000039d0
_08075610:
	movs r7, 0x14
	movs r6, 0xDC
	ldr r5, _08075618
	b _08075620
	.align 2, 0
_08075618: .4byte 0x00003db8
_0807561C:
	movs r6, 0xC8
	ldr r5, _08075678
_08075620:
	adds r0, r2, 0
	bl SetPokemonCryVolume
	mov r1, r10
	lsls r0, r1, 24
	asrs r0, 24
	bl SetPokemonCryPanpot
	adds r0, r5, 0
	bl SetPokemonCryPitch
	adds r0, r7, 0
	bl SetPokemonCryLength
	movs r0, 0
	bl SetPokemonCryProgress
	adds r0, r6, 0
	bl SetPokemonCryRelease
	ldr r0, [sp, 0x4]
	bl SetPokemonCryChorus
	ldr r0, [sp]
	bl SetPokemonCryPriority
	mov r0, r8
	bl SpeciesToCryId
	mov r8, r0
	movs r1, 0x7F
	mov r2, r8
	ands r1, r2
	lsrs r0, r2, 7
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r0, 0x1
	beq _080756AC
	cmp r0, 0x1
	bgt _0807567C
	cmp r0, 0
	beq _08075686
	b _0807571A
	.align 2, 0
_08075678: .4byte 0x000038a4
_0807567C:
	cmp r2, 0x2
	beq _080756D0
	cmp r2, 0x3
	beq _080756F4
	b _0807571A
_08075686:
	mov r0, r9
	cmp r0, 0
	beq _0807569C
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08075698
	b _08075710
	.align 2, 0
_08075698: .4byte voicegroup_84537C0
_0807569C:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756A8
	b _08075710
	.align 2, 0
_080756A8: .4byte voicegroup_8452590
_080756AC:
	mov r2, r9
	cmp r2, 0
	beq _080756C0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756BC
	b _08075710
	.align 2, 0
_080756BC: .4byte voicegroup_8453DC0
_080756C0:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756CC
	b _08075710
	.align 2, 0
_080756CC: .4byte voicegroup_8452B90
_080756D0:
	mov r0, r9
	cmp r0, 0
	beq _080756E4
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756E0
	b _08075710
	.align 2, 0
_080756E0: .4byte voicegroup_84543C0
_080756E4:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756F0
	b _08075710
	.align 2, 0
_080756F0: .4byte voicegroup_8453190
_080756F4:
	mov r2, r9
	cmp r2, 0
	beq _08075708
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08075704
	b _08075710
	.align 2, 0
_08075704: .4byte voicegroup_84549C0
_08075708:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807572C
_08075710:
	adds r0, r1
	bl SetPokemonCryTone
	ldr r1, _08075730
	str r0, [r1]
_0807571A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807572C: .4byte voicegroup_8453790
_08075730: .4byte gMPlay_PokemonCry
	thumb_func_end PlayCryInternal

	thumb_func_start IsCryFinished
IsCryFinished: @ 8075734
	push {lr}
	ldr r0, _0807574C
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08075750
	bl ClearPokemonCrySongs
	movs r0, 0x1
	b _08075752
	.align 2, 0
_0807574C: .4byte Task_DuckBGMForPokemonCry
_08075750:
	movs r0, 0
_08075752:
	pop {r1}
	bx r1
	thumb_func_end IsCryFinished

	thumb_func_start StopCryAndClearCrySongs
StopCryAndClearCrySongs: @ 8075758
	push {lr}
	ldr r0, _0807576C
	ldr r0, [r0]
	bl m4aMPlayStop
	bl ClearPokemonCrySongs
	pop {r0}
	bx r0
	.align 2, 0
_0807576C: .4byte gMPlay_PokemonCry
	thumb_func_end StopCryAndClearCrySongs

	thumb_func_start StopCry
StopCry: @ 8075770
	push {lr}
	ldr r0, _08075780
	ldr r0, [r0]
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_08075780: .4byte gMPlay_PokemonCry
	thumb_func_end StopCry

	thumb_func_start IsCryPlayingOrClearCrySongs
IsCryPlayingOrClearCrySongs: @ 8075784
	push {lr}
	ldr r0, _0807579C
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _080757A0
	bl ClearPokemonCrySongs
	movs r0, 0
	b _080757A2
	.align 2, 0
_0807579C: .4byte gMPlay_PokemonCry
_080757A0:
	movs r0, 0x1
_080757A2:
	pop {r1}
	bx r1
	thumb_func_end IsCryPlayingOrClearCrySongs

	thumb_func_start IsCryPlaying
IsCryPlaying: @ 80757A8
	push {lr}
	ldr r0, _080757BC
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _080757C0
	movs r0, 0
	b _080757C2
	.align 2, 0
_080757BC: .4byte gMPlay_PokemonCry
_080757C0:
	movs r0, 0x1
_080757C2:
	pop {r1}
	bx r1
	thumb_func_end IsCryPlaying

	thumb_func_start Task_DuckBGMForPokemonCry
Task_DuckBGMForPokemonCry: @ 80757C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080757DC
	ldrb r0, [r1]
	cmp r0, 0
	beq _080757E0
	subs r0, 0x1
	strb r0, [r1]
	b _080757FE
	.align 2, 0
_080757DC: .4byte gPokemonCryBGMDuckingCounter
_080757E0:
	ldr r0, _08075804
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _080757FE
	ldr r0, _08075808
	ldr r1, _0807580C
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	adds r0, r4, 0
	bl DestroyTask
_080757FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075804: .4byte gMPlay_PokemonCry
_08075808: .4byte gMPlay_BGM
_0807580C: .4byte 0x0000ffff
	thumb_func_end Task_DuckBGMForPokemonCry

	thumb_func_start RestoreBGMVolumeAfterPokemonCry
RestoreBGMVolumeAfterPokemonCry: @ 8075810
	push {r4,lr}
	ldr r4, _08075830
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0807582A
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0807582A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075830: .4byte Task_DuckBGMForPokemonCry
	thumb_func_end RestoreBGMVolumeAfterPokemonCry

	thumb_func_start PlayBGM
PlayBGM: @ 8075834
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08075850
	ldrb r0, [r0]
	cmp r0, 0
	beq _08075844
	movs r1, 0
_08075844:
	adds r0, r1, 0
	bl m4aSongNumStart
	pop {r0}
	bx r0
	.align 2, 0
_08075850: .4byte gDisableMusic
	thumb_func_end PlayBGM

	thumb_func_start PlaySE
PlaySE: @ 8075854
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStart
	pop {r0}
	bx r0
	thumb_func_end PlaySE

	thumb_func_start PlaySE12WithPanning
PlaySE12WithPanning: @ 8075864
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r6, _080758AC
	adds r0, r6, 0
	bl m4aMPlayImmInit
	ldr r0, _080758B0
	mov r8, r0
	bl m4aMPlayImmInit
	ldr r5, _080758B4
	lsls r4, 24
	asrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080758AC: .4byte gMPlay_SE1
_080758B0: .4byte gMPlay_SE2
_080758B4: .4byte 0x0000ffff
	thumb_func_end PlaySE12WithPanning

	thumb_func_start PlaySE1WithPanning
PlaySE1WithPanning: @ 80758B8
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r5, _080758E4
	adds r0, r5, 0
	bl m4aMPlayImmInit
	ldr r1, _080758E8
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080758E4: .4byte gMPlay_SE1
_080758E8: .4byte 0x0000ffff
	thumb_func_end PlaySE1WithPanning

	thumb_func_start PlaySE2WithPanning
PlaySE2WithPanning: @ 80758EC
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r5, _08075918
	adds r0, r5, 0
	bl m4aMPlayImmInit
	ldr r1, _0807591C
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075918: .4byte gMPlay_SE2
_0807591C: .4byte 0x0000ffff
	thumb_func_end PlaySE2WithPanning

	thumb_func_start SE12PanpotControl
SE12PanpotControl: @ 8075920
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08075944
	ldr r5, _08075948
	lsls r4, 24
	asrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _0807594C
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075944: .4byte gMPlay_SE1
_08075948: .4byte 0x0000ffff
_0807594C: .4byte gMPlay_SE2
	thumb_func_end SE12PanpotControl

	thumb_func_start IsSEPlaying
IsSEPlaying: @ 8075950
	push {lr}
	ldr r0, _08075980
	ldr r1, [r0, 0x4]
	movs r2, 0x80
	lsls r2, 24
	adds r3, r0, 0
	cmp r1, 0
	bge _0807596A
	ldr r0, _08075984
	ldr r0, [r0, 0x4]
	ands r0, r2
	cmp r0, 0
	bne _0807597C
_0807596A:
	ldr r1, _08075988
	ldrh r0, [r3, 0x4]
	cmp r0, 0
	bne _0807598C
	ldr r0, _08075984
	ldr r0, [r0, 0x4]
	ands r0, r1
	cmp r0, 0
	bne _0807598C
_0807597C:
	movs r0, 0
	b _0807598E
	.align 2, 0
_08075980: .4byte gMPlay_SE1
_08075984: .4byte gMPlay_SE2
_08075988: .4byte 0x0000ffff
_0807598C:
	movs r0, 0x1
_0807598E:
	pop {r1}
	bx r1
	thumb_func_end IsSEPlaying

	thumb_func_start IsBGMPlaying
IsBGMPlaying: @ 8075994
	push {lr}
	ldr r0, _080759AC
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _080759B4
	ldr r0, _080759B0
	ands r1, r0
	cmp r1, 0
	beq _080759B4
	movs r0, 0x1
	b _080759B6
	.align 2, 0
_080759AC: .4byte gMPlay_BGM
_080759B0: .4byte 0x0000ffff
_080759B4:
	movs r0, 0
_080759B6:
	pop {r1}
	bx r1
	thumb_func_end IsBGMPlaying

	thumb_func_start IsSpecialSEPlaying
IsSpecialSEPlaying: @ 80759BC
	push {lr}
	ldr r0, _080759D4
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _080759DC
	ldr r0, _080759D8
	ands r1, r0
	cmp r1, 0
	beq _080759DC
	movs r0, 0x1
	b _080759DE
	.align 2, 0
_080759D4: .4byte gMPlay_SE3
_080759D8: .4byte 0x0000ffff
_080759DC:
	movs r0, 0
_080759DE:
	pop {r1}
	bx r1
	thumb_func_end IsSpecialSEPlaying

	.align 2, 0 @ Don't pad with nop.
