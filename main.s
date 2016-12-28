	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start AgbMain
AgbMain: @ 800024C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0xFF
	bl RegisterRamReset
	ldr r1, _080002E4 @ =0x04000204
	ldr r2, _080002E8 @ =0x00004014
	adds r0, r2, 0
	strh r0, [r1]
	bl InitKeys
	bl InitIntrHandlers
	bl m4aSoundInit
	bl RtcInit
	bl CheckForFlashMemory
	bl InitMainCallbacks
	bl InitMapMusic
	bl SeedRngWithRtc
	ldr r0, _080002EC @ =gUnknown_3001BB4
	movs r4, 0
	strb r4, [r0]
	ldr r0, _080002F0 @ =gUnknown_3004820
	ldr r0, [r0]
	cmp r0, 0x1
	beq _08000294
	movs r0, 0
	bl SetMainCallback2
_08000294:
	ldr r0, _080002F4 @ =gUnknown_3001764
	strb r4, [r0]
	ldr r5, _080002F8 @ =gMain
	ldr r6, _080002FC @ =0x030033b9
	ldr r0, _08000300 @ =0x00000c84
	adds r0, r6
	mov r8, r0
	movs r7, 0
_080002A4:
	bl ReadKeys
	ldr r0, _080002EC @ =gUnknown_3001BB4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080002C6
	ldrh r1, [r5, 0x28]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080002C6
	movs r0, 0xE
	ands r0, r1
	cmp r0, 0xE
	bne _080002C6
	bl DoSoftReset
_080002C6:
	ldrb r0, [r6]
	cmp r0, 0x1
	bls _08000304
	bl sub_8055910
	cmp r0, 0x1
	bne _08000304
	ldr r4, _080002F4 @ =gUnknown_3001764
	strb r0, [r4]
	bl UpdateLinkAndCallCallbacks
	movs r0, 0
	strb r0, [r4]
	b _0800032C
	.align 2, 0
_080002E4: .4byte 0x04000204
_080002E8: .4byte 0x00004014
_080002EC: .4byte gUnknown_3001BB4
_080002F0: .4byte gUnknown_3004820
_080002F4: .4byte gUnknown_3001764
_080002F8: .4byte gMain
_080002FC: .4byte 0x030033b9
_08000300: .4byte 0x00000c84
_08000304:
	ldr r4, _0800033C @ =gUnknown_3001764
	movs r0, 0
	strb r0, [r4]
	bl UpdateLinkAndCallCallbacks
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, 0x1
	bls _0800032C
	bl sub_80558AC
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0800032C
	movs r0, 0
	strh r0, [r5, 0x2E]
	strb r1, [r4]
	bl UpdateLinkAndCallCallbacks
	strb r7, [r4]
_0800032C:
	bl PlayTimeCounter_Update
	bl MapMusicMain
	bl WaitForVBlank
	b _080002A4
	.align 2, 0
_0800033C: .4byte gUnknown_3001764
	thumb_func_end AgbMain

	thumb_func_start UpdateLinkAndCallCallbacks
UpdateLinkAndCallCallbacks: @ 8000474
	push {r4,lr}
	ldr r0, _080004A8 @ =gShouldAdvanceLinkState
	ldr r1, _080004AC @ =gSendCmd
	ldr r2, _080004B0 @ =gRecvCmds
	bl LinkMain1
	ldr r4, _080004B4 @ =gLinkStatus
	str r0, [r4]
	ldr r0, _080004B8 @ =0x0300179c
	bl LinkMain2
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	cmp r0, 0
	beq _0800049E
	bl sub_8055940
	cmp r0, 0x1
	beq _080004A2
_0800049E:
	bl CallCallbacks
_080004A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080004A8: .4byte gShouldAdvanceLinkState
_080004AC: .4byte gSendCmd
_080004B0: .4byte gRecvCmds
_080004B4: .4byte gLinkStatus
_080004B8: .4byte 0x0300179c
	thumb_func_end UpdateLinkAndCallCallbacks

	thumb_func_start InitMainCallbacks
InitMainCallbacks: @ 80004BC
	push {lr}
	ldr r0, _080004D4 @ =gMain
	movs r1, 0
	str r1, [r0, 0x20]
	str r1, [r0, 0x24]
	str r1, [r0]
	ldr r0, _080004D8 @ =c2_copyright_1
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080004D4: .4byte gMain
_080004D8: .4byte c2_copyright_1
	thumb_func_end InitMainCallbacks

	thumb_func_start CallCallbacks
CallCallbacks: @ 80004DC
	push {r4,lr}
	ldr r4, _080004FC @ =gMain
	ldr r0, [r4]
	cmp r0, 0
	beq _080004EA
	bl _call_via_r0
_080004EA:
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _080004F4
	bl _call_via_r0
_080004F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080004FC: .4byte gMain
	thumb_func_end CallCallbacks

	thumb_func_start SetMainCallback2
SetMainCallback2: @ 80003CC
	ldr r1, _080003DC @ =gMain
	str r0, [r1, 0x4]
	ldr r0, _080003E0 @ =0x0000043c
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080003DC: .4byte gMain
_080003E0: .4byte 0x0000043c
	thumb_func_end SetMainCallback2

	thumb_func_start SeedRngWithRtc
SeedRngWithRtc: @ 8000518
	push {lr}
	bl RtcGetMinuteCount
	adds r2, r0, 0
	lsrs r0, r2, 16
	ldr r1, _08000530 @ =0x0000ffff
	ands r1, r2
	eors r0, r1
	bl SeedRng
	pop {r0}
	bx r0
	.align 2, 0
_08000530: .4byte 0x0000ffff
	thumb_func_end SeedRngWithRtc

	thumb_func_start InitKeys
InitKeys: @ 8000400
	ldr r1, _0800041C @ =gKeyRepeatContinueDelay
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08000420 @ =gKeyRepeatStartDelay
	movs r0, 0x28
	strh r0, [r1]
	ldr r1, _08000424 @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2C]
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x28]
	strh r0, [r1, 0x2A]
	bx lr
	.align 2, 0
_0800041C: .4byte gKeyRepeatContinueDelay
_08000420: .4byte gKeyRepeatStartDelay
_08000424: .4byte gMain
	thumb_func_end InitKeys

	thumb_func_start ReadKeys
ReadKeys: @ 800055C
	push {lr}
	ldr r0, _08000598 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _0800059C @ =0x000003ff
	adds r0, r2, 0
	adds r3, r0, 0
	eors r3, r1
	ldr r1, _080005A0 @ =gMain
	ldrh r2, [r1, 0x28]
	adds r0, r3, 0
	bics r0, r2
	strh r0, [r1, 0x2A]
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	adds r2, r1, 0
	cmp r3, 0
	beq _080005A8
	ldrh r0, [r2, 0x2C]
	cmp r0, r3
	bne _080005A8
	ldrh r0, [r2, 0x32]
	subs r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _080005AE
	strh r3, [r2, 0x30]
	ldr r0, _080005A4 @ =gKeyRepeatContinueDelay
	b _080005AA
	.align 2, 0
_08000598: .4byte 0x04000130
_0800059C: .4byte 0x000003ff
_080005A0: .4byte gMain
_080005A4: .4byte gKeyRepeatContinueDelay
_080005A8:
	ldr r0, _080005F0 @ =gKeyRepeatStartDelay
_080005AA:
	ldrh r0, [r0]
	strh r0, [r2, 0x32]
_080005AE:
	strh r3, [r2, 0x28]
	strh r3, [r2, 0x2C]
	ldr r0, _080005F4 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x2
	bne _080005DE
	ldrh r1, [r2, 0x2E]
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080005CE
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2, 0x2E]
_080005CE:
	ldrh r1, [r2, 0x2C]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080005DE
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2, 0x2C]
_080005DE:
	ldrh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x36]
	ands r0, r1
	cmp r0, 0
	beq _080005EC
	movs r0, 0x1
	strh r0, [r2, 0x34]
_080005EC:
	pop {r0}
	bx r0
	.align 2, 0
_080005F0: .4byte gKeyRepeatStartDelay
_080005F4: .4byte gSaveBlock2
	thumb_func_end ReadKeys

	thumb_func_start InitIntrHandlers
InitIntrHandlers: @ 80005F8
	push {r4,r5,lr}
	ldr r5, _0800064C @ =_08000240
	ldr r4, _08000650 @ =IntrMain_Buffer
	ldr r3, _08000654 @ =gIntrTableTemplate
	ldr r2, _08000658 @ =gIntrTable
	movs r1, 0xD
_08000604:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, 0x1
	cmp r1, 0
	bge _08000604
	ldr r0, _0800065C @ =0x040000d4
	str r5, [r0]
	str r4, [r0, 0x4]
	ldr r1, _08000660 @ =0x84000200
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _08000664 @ =0x03007ffc
	str r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetSerialCallback
	ldr r0, _08000668 @ =0x04000208
	movs r2, 0x1
	strh r2, [r0]
	ldr r1, _0800066C @ =0x04000200
	strh r2, [r1]
	ldr r3, _08000670 @ =0x04000004
	movs r0, 0x8
	strh r0, [r3]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800064C: .4byte _08000240
_08000650: .4byte IntrMain_Buffer
_08000654: .4byte gIntrTableTemplate
_08000658: .4byte gIntrTable
_0800065C: .4byte 0x040000d4
_08000660: .4byte 0x84000200
_08000664: .4byte 0x03007ffc
_08000668: .4byte 0x04000208
_0800066C: .4byte 0x04000200
_08000670: .4byte 0x04000004
	thumb_func_end InitIntrHandlers

	thumb_func_start SetVBlankCallback
SetVBlankCallback: @ 8000540
	ldr r1, _08000548 @ =gMain
	str r0, [r1, 0xC]
	bx lr
	.align 2, 0
_08000548: .4byte gMain
	thumb_func_end SetVBlankCallback

	thumb_func_start SetHBlankCallback
SetHBlankCallback: @ 800054C
	ldr r1, _08000554 @ =gMain
	str r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08000554: .4byte gMain
	thumb_func_end SetHBlankCallback

	thumb_func_start SetVCountCallback
SetVCountCallback: @ 8000558
	ldr r1, _08000560 @ =gMain
	str r0, [r1, 0x14]
	bx lr
	.align 2, 0
_08000560: .4byte gMain
	thumb_func_end SetVCountCallback

	thumb_func_start SetSerialCallback
SetSerialCallback: @ 8000564
	ldr r1, _0800056C @ =gMain
	str r0, [r1, 0x18]
	bx lr
	.align 2, 0
_0800056C: .4byte gMain
	thumb_func_end SetSerialCallback

	thumb_func_start VBlankIntr
VBlankIntr: @ 80006A4
	push {r4-r6,lr}
	ldr r0, _08000708 @ =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _080006B2
	bl LinkVSync
_080006B2:
	ldr r5, _0800070C @ =0x04000208
	ldrh r4, [r5]
	movs r6, 0
	strh r6, [r5]
	bl m4aSoundVSync
	strh r4, [r5]
	ldr r4, _08000710 @ =gMain
	ldr r0, [r4, 0x20]
	adds r0, 0x1
	str r0, [r4, 0x20]
	ldr r0, [r4, 0xC]
	cmp r0, 0
	beq _080006D2
	bl _call_via_r0
_080006D2:
	ldr r0, [r4, 0x24]
	adds r0, 0x1
	str r0, [r4, 0x24]
	ldr r1, _08000714 @ =gPcmDmaCounter
	ldr r0, _08000718 @ =gSoundInfo
	ldrb r0, [r0, 0x4]
	strb r0, [r1]
	bl m4aSoundMain
	bl sub_800C35C
	bl Random
	ldr r1, _0800071C @ =0x03007ff8
	ldrh r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r4, 0x1C]
	orrs r0, r2
	ldrh r1, [r4, 0x1C]
	orrs r0, r6
	strh r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000708: .4byte gLinkVSyncDisabled
_0800070C: .4byte 0x04000208
_08000710: .4byte gMain
_08000714: .4byte gPcmDmaCounter
_08000718: .4byte gSoundInfo
_0800071C: .4byte 0x03007ff8
	thumb_func_end VBlankIntr

	thumb_func_start InitFlashTimer
InitFlashTimer: @ 80005EC
	push {lr}
	ldr r0, _080005FC @ =gFlashTimerIntrFunc
	ldr r1, [r0]
	movs r0, 0x2
	bl SetFlashTimerIntr
	pop {r0}
	bx r0
	.align 2, 0
_080005FC: .4byte gFlashTimerIntrFunc
	thumb_func_end InitFlashTimer

	thumb_func_start HBlankIntr
HBlankIntr: @ 8000734
	push {r4,lr}
	ldr r4, _0800075C @ =gMain
	ldr r0, [r4, 0x10]
	cmp r0, 0
	beq _08000742
	bl _call_via_r0
_08000742:
	ldr r2, _08000760 @ =0x03007ff8
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x1C]
	ldrh r2, [r4, 0x1C]
	orrs r1, r0
	strh r1, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800075C: .4byte gMain
_08000760: .4byte 0x03007ff8
	thumb_func_end HBlankIntr

	thumb_func_start VCountIntr
VCountIntr: @ 8000764
	push {r4,lr}
	ldr r4, _0800078C @ =gMain
	ldr r0, [r4, 0x14]
	cmp r0, 0
	beq _08000772
	bl _call_via_r0
_08000772:
	ldr r2, _08000790 @ =0x03007ff8
	ldrh r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x1C]
	ldrh r2, [r4, 0x1C]
	orrs r1, r0
	strh r1, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800078C: .4byte gMain
_08000790: .4byte 0x03007ff8
	thumb_func_end VCountIntr

	thumb_func_start SerialIntr
SerialIntr: @ 8000794
	push {r4,lr}
	ldr r4, _080007BC @ =gMain
	ldr r0, [r4, 0x18]
	cmp r0, 0
	beq _080007A2
	bl _call_via_r0
_080007A2:
	ldr r2, _080007C0 @ =0x03007ff8
	ldrh r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x1C]
	ldrh r2, [r4, 0x1C]
	orrs r1, r0
	strh r1, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080007BC: .4byte gMain
_080007C0: .4byte 0x03007ff8
	thumb_func_end SerialIntr

	thumb_func_start IntrDummy
IntrDummy: @ 80007C4
	bx lr
	thumb_func_end IntrDummy

	thumb_func_start WaitForVBlank
WaitForVBlank: @ 80007C8
	push {lr}
	ldr r1, _080007E0 @ =gMain
	ldrh r2, [r1, 0x1C]
	ldr r0, _080007E4 @ =0x0000fffe
	ands r0, r2
	ldrh r2, [r1, 0x1C]
	strh r0, [r1, 0x1C]
	bl VBlankIntrWait
	pop {r0}
	bx r0
	.align 2, 0
_080007E0: .4byte gMain
_080007E4: .4byte 0x0000fffe
	thumb_func_end WaitForVBlank

	thumb_func_start DoSoftReset
DoSoftReset: @ 80006B4
	push {r4,lr}
	ldr r1, _08000710 @ =0x04000208
	movs r0, 0
	strh r0, [r1]
	bl m4aSoundVSyncOff
	bl remove_some_task
	ldr r1, _08000714 @ =0x040000bc
	ldrh r2, [r1, 0xA]
	ldr r3, _08000718 @ =0x0000c5ff
	adds r0, r3, 0
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r4, [r1, 0xA]
	ldr r2, _0800071C @ =0x00007fff
	adds r0, r2, 0
	ands r0, r4
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	adds r1, 0xC
	ldrh r4, [r1, 0xA]
	adds r0, r3, 0
	ands r0, r4
	strh r0, [r1, 0xA]
	ldrh r4, [r1, 0xA]
	adds r0, r2, 0
	ands r0, r4
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r0, _08000720 @ =0x040000d4
	ldrh r1, [r0, 0xA]
	ands r3, r1
	strh r3, [r0, 0xA]
	ldrh r1, [r0, 0xA]
	ands r2, r1
	strh r2, [r0, 0xA]
	ldrh r0, [r0, 0xA]
	bl SiiRtcProtect
	movs r0, 0xFF
	bl SoftReset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000710: .4byte 0x04000208
_08000714: .4byte 0x040000bc
_08000718: .4byte 0x0000c5ff
_0800071C: .4byte 0x00007fff
_08000720: .4byte 0x040000d4
	thumb_func_end DoSoftReset

	thumb_func_start ClearPokemonCrySongs
ClearPokemonCrySongs: @ 8000724
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08000740 @ =gPokemonCrySongs
	ldr r2, _08000744 @ =0x01000034
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08000740: .4byte gPokemonCrySongs
_08000744: .4byte 0x01000034
	thumb_func_end ClearPokemonCrySongs

	.align 2, 0 @ Don't pad with nop.
