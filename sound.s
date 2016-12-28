	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start InitMapMusic
InitMapMusic: @ 8074BAC
	push {lr}
	ldr r1, _08074BBC @ =gDisableMusic
	movs r0, 0
	strb r0, [r1]
	bl ResetMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_08074BBC: .4byte gDisableMusic
	thumb_func_end InitMapMusic

	thumb_func_start MapMusicMain
MapMusicMain: @ 8074BC0
	push {r4,r5,lr}
	ldr r0, _08074BD8 @ =0x030006d8
	ldrb r1, [r0]
	adds r2, r0, 0
	cmp r1, 0x7
	bhi _08074CA2
	lsls r0, r1, 2
	ldr r1, _08074BDC @ =_08074FA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074BD8: .4byte 0x030006d8
_08074BDC: .4byte _08074FA0
	.align 2, 0
_08074BE0:
	.4byte _08074CA2
	.4byte _08074C00
	.4byte _08074CA2
	.4byte _08074CA2
	.4byte _08074CA2
	.4byte _08074C14
	.4byte _08074C34
	.4byte _08074C70
_08074C00:
	movs r0, 0x2
	strb r0, [r2]
	ldr r0, _08074C10 @ =0x030006d4
	ldrh r0, [r0]
	bl PlayBGM
	b _08074CA2
	.align 2, 0
_08074C10: .4byte 0x030006d4
_08074C14:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08074CA2
	ldr r0, _08074C2C @ =0x030006d6
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08074C30 @ =0x030006d8
	strb r1, [r0]
	b _08074CA2
	.align 2, 0
_08074C2C: .4byte 0x030006d6
_08074C30: .4byte 0x030006d8
_08074C34:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08074CA2
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08074CA2
	ldr r2, _08074C64 @ =0x030006d4
	ldr r1, _08074C68 @ =0x030006d6
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08074C6C @ =0x030006d8
	movs r0, 0x2
	strb r0, [r1]
	ldrh r0, [r2]
	bl PlayBGM
	b _08074CA2
	.align 2, 0
_08074C64: .4byte 0x030006d4
_08074C68: .4byte 0x030006d6
_08074C6C: .4byte 0x030006d8
_08074C70:
	bl IsBGMStopped
	lsls r0, 24
	cmp r0, 0
	beq _08074CA2
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08074CA2
	ldr r4, _08074CA8 @ =0x030006d6
	ldrh r0, [r4]
	ldr r5, _08074CAC @ =0x030006d9
	ldrb r1, [r5]
	bl FadeInNewBGM
	ldr r1, _08074CB0 @ =0x030006d4
	ldrh r0, [r4]
	strh r0, [r1]
	movs r2, 0
	strh r2, [r4]
	ldr r1, _08074CB4 @ =0x030006d8
	movs r0, 0x2
	strb r0, [r1]
	strb r2, [r5]
_08074CA2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074CA8: .4byte 0x030006d6
_08074CAC: .4byte 0x030006d9
_08074CB0: .4byte 0x030006d4
_08074CB4: .4byte 0x030006d8
	thumb_func_end MapMusicMain

	thumb_func_start ResetMapMusic
ResetMapMusic: @ 8074CB8
	ldr r0, _08074CCC @ =0x030006d4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08074CD0 @ =0x030006d6
	strh r1, [r0]
	ldr r0, _08074CD4 @ =0x030006d8
	strb r1, [r0]
	ldr r0, _08074CD8 @ =0x030006d9
	strb r1, [r0]
	bx lr
	.align 2, 0
_08074CCC: .4byte 0x030006d4
_08074CD0: .4byte 0x030006d6
_08074CD4: .4byte 0x030006d8
_08074CD8: .4byte 0x030006d9
	thumb_func_end ResetMapMusic

	thumb_func_start GetCurrentMapMusic
GetCurrentMapMusic: @ 8074CDC
	ldr r0, _08074CE4 @ =0x030006d4
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08074CE4: .4byte 0x030006d4
	thumb_func_end GetCurrentMapMusic

	thumb_func_start PlayNewMapMusic
PlayNewMapMusic: @ 8074CE8
	ldr r1, _08074CFC @ =0x030006d4
	strh r0, [r1]
	ldr r1, _08074D00 @ =0x030006d6
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08074D04 @ =0x030006d8
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08074CFC: .4byte 0x030006d4
_08074D00: .4byte 0x030006d6
_08074D04: .4byte 0x030006d8
	thumb_func_end PlayNewMapMusic

	thumb_func_start StopMapMusic
StopMapMusic: @ 8074D08
	ldr r0, _08074D1C @ =0x030006d4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08074D20 @ =0x030006d6
	strh r1, [r0]
	ldr r1, _08074D24 @ =0x030006d8
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08074D1C: .4byte 0x030006d4
_08074D20: .4byte 0x030006d6
_08074D24: .4byte 0x030006d8
	thumb_func_end StopMapMusic

	thumb_func_start FadeOutMapMusic
FadeOutMapMusic: @ 8074D28
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsNotWaitingForBGMStop
	lsls r0, 24
	cmp r0, 0
	beq _08074D3E
	adds r0, r4, 0
	bl FadeOutBGM
_08074D3E:
	ldr r0, _08074D54 @ =0x030006d4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08074D58 @ =0x030006d6
	strh r1, [r0]
	ldr r1, _08074D5C @ =0x030006d8
	movs r0, 0x5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074D54: .4byte 0x030006d4
_08074D58: .4byte 0x030006d6
_08074D5C: .4byte 0x030006d8
	thumb_func_end FadeOutMapMusic

	thumb_func_start FadeOutAndPlayNewMapMusic
FadeOutAndPlayNewMapMusic: @ 8074D60
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	bl FadeOutMapMusic
	ldr r1, _08074D88 @ =0x030006d4
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08074D8C @ =0x030006d6
	strh r4, [r0]
	ldr r1, _08074D90 @ =0x030006d8
	movs r0, 0x6
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074D88: .4byte 0x030006d4
_08074D8C: .4byte 0x030006d6
_08074D90: .4byte 0x030006d8
	thumb_func_end FadeOutAndPlayNewMapMusic

	thumb_func_start FadeOutAndFadeInNewMapMusic
FadeOutAndFadeInNewMapMusic: @ 8074D94
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
	ldr r1, _08074DC8 @ =0x030006d4
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08074DCC @ =0x030006d6
	strh r4, [r0]
	ldr r1, _08074DD0 @ =0x030006d8
	movs r0, 0x7
	strb r0, [r1]
	ldr r0, _08074DD4 @ =0x030006d9
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074DC8: .4byte 0x030006d4
_08074DCC: .4byte 0x030006d6
_08074DD0: .4byte 0x030006d8
_08074DD4: .4byte 0x030006d9
	thumb_func_end FadeOutAndFadeInNewMapMusic

	thumb_func_start FadeInNewMapMusic
FadeInNewMapMusic: @ 8074DD8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FadeInNewBGM
	ldr r0, _08074E04 @ =0x030006d4
	strh r4, [r0]
	ldr r0, _08074E08 @ =0x030006d6
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08074E0C @ =0x030006d8
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _08074E10 @ =0x030006d9
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074E04: .4byte 0x030006d4
_08074E08: .4byte 0x030006d6
_08074E0C: .4byte 0x030006d8
_08074E10: .4byte 0x030006d9
	thumb_func_end FadeInNewMapMusic

	thumb_func_start IsNotWaitingForBGMStop
IsNotWaitingForBGMStop: @ 8074E14
	push {lr}
	ldr r0, _08074E2C @ =0x030006d8
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _08074E30
	cmp r0, 0x5
	beq _08074E30
	cmp r0, 0x7
	beq _08074E30
	movs r0, 0x1
	b _08074E32
	.align 2, 0
_08074E2C: .4byte 0x030006d8
_08074E30:
	movs r0, 0
_08074E32:
	pop {r1}
	bx r1
	thumb_func_end IsNotWaitingForBGMStop

	thumb_func_start PlayFanfareByFanfareNum
PlayFanfareByFanfareNum: @ 8074E38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08074E60 @ =gMPlay_BGM
	bl m4aMPlayStop
	ldr r0, _08074E64 @ =gFanfares
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r4]
	ldr r2, _08074E68 @ =0x030006da
	ldrh r1, [r4, 0x2]
	strh r1, [r2]
	bl m4aSongNumStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074E60: .4byte gMPlay_BGM
_08074E64: .4byte gFanfares
_08074E68: .4byte 0x030006da
	thumb_func_end PlayFanfareByFanfareNum

	thumb_func_start WaitFanfare
WaitFanfare: @ 8074E6C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _08074E84 @ =0x030006da
	ldrh r0, [r2]
	cmp r0, 0
	beq _08074E88
	subs r0, 0x1
	strh r0, [r2]
	movs r0, 0
	b _08074EA0
	.align 2, 0
_08074E84: .4byte 0x030006da
_08074E88:
	cmp r1, 0
	bne _08074E98
	ldr r0, _08074E94 @ =gMPlay_BGM
	bl m4aMPlayContinue
	b _08074E9E
	.align 2, 0
_08074E94: .4byte gMPlay_BGM
_08074E98:
	movs r0, 0
	bl m4aSongNumStart
_08074E9E:
	movs r0, 0x1
_08074EA0:
	pop {r1}
	bx r1
	thumb_func_end WaitFanfare

	thumb_func_start StopFanfareByFanfareNum
StopFanfareByFanfareNum: @ 8074EA4
	push {lr}
	lsls r0, 24
	ldr r1, _08074EB8 @ =gFanfares
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_08074EB8: .4byte gFanfares
	thumb_func_end StopFanfareByFanfareNum

	thumb_func_start PlayFanfare
PlayFanfare: @ 8074EBC
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _08074EDC @ =gFanfares
_08074EC6:
	ldrh r0, [r2]
	cmp r0, r3
	bne _08074EE0
	lsls r0, r1, 24
	lsrs r0, 24
	bl PlayFanfareByFanfareNum
	bl CreateFanfareTask
	b _08074EF2
	.align 2, 0
_08074EDC: .4byte gFanfares
_08074EE0:
	adds r2, 0x4
	adds r1, 0x1
	cmp r1, 0xB
	bls _08074EC6
	movs r0, 0
	bl PlayFanfareByFanfareNum
	bl CreateFanfareTask
_08074EF2:
	pop {r0}
	bx r0
	thumb_func_end PlayFanfare

	thumb_func_start IsFanfareTaskInactive
IsFanfareTaskInactive: @ 8074EF8
	push {lr}
	ldr r0, _08074F0C @ =Task_Fanfare
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08074F10
	movs r0, 0x1
	b _08074F12
	.align 2, 0
_08074F0C: .4byte Task_Fanfare
_08074F10:
	movs r0, 0
_08074F12:
	pop {r1}
	bx r1
	thumb_func_end IsFanfareTaskInactive

	thumb_func_start Task_Fanfare
Task_Fanfare: @ 80752D8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080752EC @ =0x030006da
	ldrh r0, [r1]
	cmp r0, 0
	beq _080752F0
	subs r0, 0x1
	strh r0, [r1]
	b _080752FC
	.align 2, 0
_080752EC: .4byte 0x030006da
_080752F0:
	ldr r0, _08075304 @ =gMPlay_BGM
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
	ldr r4, _08075328 @ =Task_Fanfare
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
FadeInNewBGM: @ 8074F6C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r0, _08074FAC @ =gDisableMusic
	ldrb r0, [r0]
	cmp r0, 0
	beq _08074F80
	movs r5, 0
_08074F80:
	adds r0, r5, 0
	bl m4aSongNumStart
	ldr r4, _08074FB0 @ =gMPlay_BGM
	adds r0, r4, 0
	bl m4aMPlayImmInit
	ldr r1, _08074FB4 @ =0x0000ffff
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
_08074FAC: .4byte gDisableMusic
_08074FB0: .4byte gMPlay_BGM
_08074FB4: .4byte 0x0000ffff
	thumb_func_end FadeInNewBGM

	thumb_func_start FadeOutBGMTemporarily
FadeOutBGMTemporarily: @ 8074FB8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08074FCC @ =gMPlay_BGM
	bl m4aMPlayFadeOutTemporarily
	pop {r0}
	bx r0
	.align 2, 0
_08074FCC: .4byte gMPlay_BGM
	thumb_func_end FadeOutBGMTemporarily

	thumb_func_start IsBGMPausedOrStopped
IsBGMPausedOrStopped: @ 8074FD0
	push {lr}
	ldr r0, _08074FE8 @ =gMPlay_BGM
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _08074FF0
	ldr r0, _08074FEC @ =0x0000ffff
	ands r1, r0
	cmp r1, 0
	beq _08074FF0
	movs r0, 0
	b _08074FF2
	.align 2, 0
_08074FE8: .4byte gMPlay_BGM
_08074FEC: .4byte 0x0000ffff
_08074FF0:
	movs r0, 0x1
_08074FF2:
	pop {r1}
	bx r1
	thumb_func_end IsBGMPausedOrStopped

	thumb_func_start FadeInBGM
FadeInBGM: @ 8074FF8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0807500C @ =gMPlay_BGM
	bl m4aMPlayFadeIn
	pop {r0}
	bx r0
	.align 2, 0
_0807500C: .4byte gMPlay_BGM
	thumb_func_end FadeInBGM

	thumb_func_start FadeOutBGM
FadeOutBGM: @ 8075010
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08075024 @ =gMPlay_BGM
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_08075024: .4byte gMPlay_BGM
	thumb_func_end FadeOutBGM

	thumb_func_start IsBGMStopped
IsBGMStopped: @ 8075028
	push {lr}
	ldr r0, _08075038 @ =gMPlay_BGM
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	beq _0807503C
	movs r0, 0
	b _0807503E
	.align 2, 0
_08075038: .4byte gMPlay_BGM
_0807503C:
	movs r0, 0x1
_0807503E:
	pop {r1}
	bx r1
	thumb_func_end IsBGMStopped

	thumb_func_start PlayCry1
PlayCry1: @ 8075044
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08075084 @ =gMPlay_BGM
	ldr r1, _08075088 @ =0x0000ffff
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
	ldr r1, _0807508C @ =gPokemonCryBGMDuckingCounter
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075084: .4byte gMPlay_BGM
_08075088: .4byte 0x0000ffff
_0807508C: .4byte gPokemonCryBGMDuckingCounter
	thumb_func_end PlayCry1

	thumb_func_start PlayCry2
PlayCry2: @ 8075090
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
PlayCry3: @ 80750B4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x1
	bne _080750DA
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	b _080750FE
_080750DA:
	ldr r0, _08075108 @ =gMPlay_BGM
	ldr r1, _0807510C @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	ldr r1, _08075110 @ =gPokemonCryBGMDuckingCounter
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
_080750FE:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075108: .4byte gMPlay_BGM
_0807510C: .4byte 0x0000ffff
_08075110: .4byte gPokemonCryBGMDuckingCounter
	thumb_func_end PlayCry3

	thumb_func_start PlayCry4
PlayCry4: @ 8075114
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
	bne _0807513E
	lsls r1, 24
	asrs r1, 24
	str r2, [sp]
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	b _08075164
_0807513E:
	ldr r0, _0807516C @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08075154
	ldr r0, _08075170 @ =gMPlay_BGM
	ldr r1, _08075174 @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
_08075154:
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	adds r0, r6, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
_08075164:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807516C: .4byte gUnknown_020239F8
_08075170: .4byte gMPlay_BGM
_08075174: .4byte 0x0000ffff
	thumb_func_end PlayCry4

	thumb_func_start PlayCry5
PlayCry5: @ 8075178
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080751B4 @ =gMPlay_BGM
	ldr r1, _080751B8 @ =0x0000ffff
	movs r2, 0x55
	bl m4aMPlayVolumeControl
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCryInternal
	ldr r1, _080751BC @ =gPokemonCryBGMDuckingCounter
	movs r0, 0x2
	strb r0, [r1]
	bl RestoreBGMVolumeAfterPokemonCry
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080751B4: .4byte gMPlay_BGM
_080751B8: .4byte 0x0000ffff
_080751BC: .4byte gPokemonCryBGMDuckingCounter
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
	ldr r1, _080755CC @ =0xffff0000
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
	ldr r1, _080755D0 @ =_080755D4
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
	ldr r5, _08075600 @ =0x00003cf0
	movs r2, 0x14
	str r2, [sp, 0x4]
	movs r2, 0x50
	b _08075620
	.align 2, 0
_08075600: .4byte 0x00003cf0
_08075604:
	movs r7, 0x32
	movs r6, 0xC8
	ldr r5, _0807560C @ =0x000039d0
	b _08075620
	.align 2, 0
_0807560C: .4byte 0x000039d0
_08075610:
	movs r7, 0x14
	movs r6, 0xDC
	ldr r5, _08075618 @ =0x00003db8
	b _08075620
	.align 2, 0
_08075618: .4byte 0x00003db8
_0807561C:
	movs r6, 0xC8
	ldr r5, _08075678 @ =0x000038a4
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
	ldr r1, _08075698 @ =voicegroup_84537C0
	b _08075710
	.align 2, 0
_08075698: .4byte voicegroup_84537C0
_0807569C:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756A8 @ =voicegroup_8452590
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
	ldr r1, _080756BC @ =voicegroup_8453DC0
	b _08075710
	.align 2, 0
_080756BC: .4byte voicegroup_8453DC0
_080756C0:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756CC @ =voicegroup_8452B90
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
	ldr r1, _080756E0 @ =voicegroup_84543C0
	b _08075710
	.align 2, 0
_080756E0: .4byte voicegroup_84543C0
_080756E4:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080756F0 @ =voicegroup_8453190
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
	ldr r1, _08075704 @ =voicegroup_84549C0
	b _08075710
	.align 2, 0
_08075704: .4byte voicegroup_84549C0
_08075708:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0807572C @ =voicegroup_8453790
_08075710:
	adds r0, r1
	bl SetPokemonCryTone
	ldr r1, _08075730 @ =gMPlay_PokemonCry
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
IsCryFinished: @ 8075374
	push {lr}
	ldr r0, _0807538C @ =Task_DuckBGMForPokemonCry
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08075390
	bl ClearPokemonCrySongs
	movs r0, 0x1
	b _08075392
	.align 2, 0
_0807538C: .4byte Task_DuckBGMForPokemonCry
_08075390:
	movs r0, 0
_08075392:
	pop {r1}
	bx r1
	thumb_func_end IsCryFinished

	thumb_func_start StopCryAndClearCrySongs
StopCryAndClearCrySongs: @ 8075398
	push {lr}
	ldr r0, _080753AC @ =gMPlay_PokemonCry
	ldr r0, [r0]
	bl m4aMPlayStop
	bl ClearPokemonCrySongs
	pop {r0}
	bx r0
	.align 2, 0
_080753AC: .4byte gMPlay_PokemonCry
	thumb_func_end StopCryAndClearCrySongs

	thumb_func_start StopCry
StopCry: @ 80753B0
	push {lr}
	ldr r0, _080753C0 @ =gMPlay_PokemonCry
	ldr r0, [r0]
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_080753C0: .4byte gMPlay_PokemonCry
	thumb_func_end StopCry

	thumb_func_start IsCryPlayingOrClearCrySongs
IsCryPlayingOrClearCrySongs: @ 80753C4
	push {lr}
	ldr r0, _080753DC @ =gMPlay_PokemonCry
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _080753E0
	bl ClearPokemonCrySongs
	movs r0, 0
	b _080753E2
	.align 2, 0
_080753DC: .4byte gMPlay_PokemonCry
_080753E0:
	movs r0, 0x1
_080753E2:
	pop {r1}
	bx r1
	thumb_func_end IsCryPlayingOrClearCrySongs

	thumb_func_start IsCryPlaying
IsCryPlaying: @ 80753E8
	push {lr}
	ldr r0, _080753FC @ =gMPlay_PokemonCry
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _08075400
	movs r0, 0
	b _08075402
	.align 2, 0
_080753FC: .4byte gMPlay_PokemonCry
_08075400:
	movs r0, 0x1
_08075402:
	pop {r1}
	bx r1
	thumb_func_end IsCryPlaying

	thumb_func_start Task_DuckBGMForPokemonCry
Task_DuckBGMForPokemonCry: @ 80757C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080757DC @ =gPokemonCryBGMDuckingCounter
	ldrb r0, [r1]
	cmp r0, 0
	beq _080757E0
	subs r0, 0x1
	strb r0, [r1]
	b _080757FE
	.align 2, 0
_080757DC: .4byte gPokemonCryBGMDuckingCounter
_080757E0:
	ldr r0, _08075804 @ =gMPlay_PokemonCry
	ldr r0, [r0]
	bl IsPokemonCryPlaying
	cmp r0, 0
	bne _080757FE
	ldr r0, _08075808 @ =gMPlay_BGM
	ldr r1, _0807580C @ =0x0000ffff
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
	ldr r4, _08075830 @ =Task_DuckBGMForPokemonCry
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
PlayBGM: @ 8075474
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08075490 @ =gDisableMusic
	ldrb r0, [r0]
	cmp r0, 0
	beq _08075484
	movs r1, 0
_08075484:
	adds r0, r1, 0
	bl m4aSongNumStart
	pop {r0}
	bx r0
	.align 2, 0
_08075490: .4byte gDisableMusic
	thumb_func_end PlayBGM

	thumb_func_start PlaySE
PlaySE: @ 8075494
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStart
	pop {r0}
	bx r0
	thumb_func_end PlaySE

	thumb_func_start PlaySE12WithPanning
PlaySE12WithPanning: @ 80754A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r6, _080754EC @ =gMPlay_SE1
	adds r0, r6, 0
	bl m4aMPlayImmInit
	ldr r0, _080754F0 @ =gMPlay_SE2
	mov r8, r0
	bl m4aMPlayImmInit
	ldr r5, _080754F4 @ =0x0000ffff
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
_080754EC: .4byte gMPlay_SE1
_080754F0: .4byte gMPlay_SE2
_080754F4: .4byte 0x0000ffff
	thumb_func_end PlaySE12WithPanning

	thumb_func_start PlaySE1WithPanning
PlaySE1WithPanning: @ 80754F8
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r5, _08075524 @ =gMPlay_SE1
	adds r0, r5, 0
	bl m4aMPlayImmInit
	ldr r1, _08075528 @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075524: .4byte gMPlay_SE1
_08075528: .4byte 0x0000ffff
	thumb_func_end PlaySE1WithPanning

	thumb_func_start PlaySE2WithPanning
PlaySE2WithPanning: @ 807552C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl m4aSongNumStart
	ldr r5, _08075558 @ =gMPlay_SE2
	adds r0, r5, 0
	bl m4aMPlayImmInit
	ldr r1, _0807555C @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075558: .4byte gMPlay_SE2
_0807555C: .4byte 0x0000ffff
	thumb_func_end PlaySE2WithPanning

	thumb_func_start SE12PanpotControl
SE12PanpotControl: @ 8075560
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08075584 @ =gMPlay_SE1
	ldr r5, _08075588 @ =0x0000ffff
	lsls r4, 24
	asrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	ldr r0, _0807558C @ =gMPlay_SE2
	adds r1, r5, 0
	adds r2, r4, 0
	bl m4aMPlayPanpotControl
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075584: .4byte gMPlay_SE1
_08075588: .4byte 0x0000ffff
_0807558C: .4byte gMPlay_SE2
	thumb_func_end SE12PanpotControl

	thumb_func_start IsSEPlaying
IsSEPlaying: @ 8075590
	push {lr}
	ldr r0, _080755C0 @ =gMPlay_SE1
	ldr r1, [r0, 0x4]
	movs r2, 0x80
	lsls r2, 24
	adds r3, r0, 0
	cmp r1, 0
	bge _080755AA
	ldr r0, _080755C4 @ =gMPlay_SE2
	ldr r0, [r0, 0x4]
	ands r0, r2
	cmp r0, 0
	bne _080755BC
_080755AA:
	ldr r1, _080755C8 @ =0x0000ffff
	ldrh r0, [r3, 0x4]
	cmp r0, 0
	bne _080755CC
	ldr r0, _080755C4 @ =gMPlay_SE2
	ldr r0, [r0, 0x4]
	ands r0, r1
	cmp r0, 0
	bne _080755CC
_080755BC:
	movs r0, 0
	b _080755CE
	.align 2, 0
_080755C0: .4byte gMPlay_SE1
_080755C4: .4byte gMPlay_SE2
_080755C8: .4byte 0x0000ffff
_080755CC:
	movs r0, 0x1
_080755CE:
	pop {r1}
	bx r1
	thumb_func_end IsSEPlaying

	thumb_func_start IsBGMPlaying
IsBGMPlaying: @ 80755D4
	push {lr}
	ldr r0, _080755EC @ =gMPlay_BGM
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _080755F4
	ldr r0, _080755F0 @ =0x0000ffff
	ands r1, r0
	cmp r1, 0
	beq _080755F4
	movs r0, 0x1
	b _080755F6
	.align 2, 0
_080755EC: .4byte gMPlay_BGM
_080755F0: .4byte 0x0000ffff
_080755F4:
	movs r0, 0
_080755F6:
	pop {r1}
	bx r1
	thumb_func_end IsBGMPlaying

	thumb_func_start IsSpecialSEPlaying
IsSpecialSEPlaying: @ 80755FC
	push {lr}
	ldr r0, _08075614 @ =gMPlay_SE3
	ldr r1, [r0, 0x4]
	cmp r1, 0
	blt _0807561C
	ldr r0, _08075618 @ =0x0000ffff
	ands r1, r0
	cmp r1, 0
	beq _0807561C
	movs r0, 0x1
	b _0807561E
	.align 2, 0
_08075614: .4byte gMPlay_SE3
_08075618: .4byte 0x0000ffff
_0807561C:
	movs r0, 0
_0807561E:
	pop {r1}
	bx r1
	thumb_func_end IsSpecialSEPlaying

	.align 2, 0 @ Don't pad with nop.
