	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8082CD4
sub_8082CD4: @ 8083108
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _08083144 @ =sub_8082F20
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0808313C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083148 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0xA]
	strh r5, [r1, 0xC]
_0808313C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083144: .4byte sub_8082F20
_08083148: .4byte gTasks
	thumb_func_end sub_8082CD4

	thumb_func_start sub_8082D18
sub_8082D18: @ 808314C
	push {lr}
	adds r1, r0, 0
	ldr r0, _08083178 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r0, _0808317C @ =gOtherText_PLink
	movs r1, 0x13
	movs r2, 0xB
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08083178: .4byte gStringVar1
_0808317C: .4byte gOtherText_PLink
	thumb_func_end sub_8082D18

	thumb_func_start sub_8082D4C
sub_8082D4C: @ 8083180
	push {lr}
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8082D4C

	thumb_func_start sub_8082D60
sub_8082D60: @ 8083194
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080831BC @ =0x03004b38
	adds r1, r0
	adds r5, r1, 0x6
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r4, r0
	beq _080831C8
	cmp r4, 0x1
	bhi _080831C0
	bl sub_8082D4C
	b _080831C6
	.align 2, 0
_080831BC: .4byte 0x03004b38
_080831C0:
	adds r0, r4, 0
	bl sub_8082D18
_080831C6:
	strh r4, [r5]
_080831C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8082D60

	thumb_func_start sub_8082D9C
sub_8082D9C: @ 80831D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08083220
	cmp r0, 0x2
	bgt _080831F0
	cmp r0, 0x1
	beq _080831F6
	b _08083220
_080831F0:
	cmp r0, 0x3
	beq _0808321C
	b _08083220
_080831F6:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, r1
	bgt _0808320A
	cmp r1, r5
	bgt _0808320A
	movs r0, 0x1
	b _08083222
_0808320A:
	ldr r0, _08083218 @ =gStringVar1
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	b _08083222
	.align 2, 0
_08083218: .4byte gStringVar1
_0808321C:
	movs r0, 0x3
	b _08083222
_08083220:
	movs r0, 0
_08083222:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082D9C

	thumb_func_start sub_8082DF4
sub_8082DF4: @ 8083228
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808323E
	movs r0, 0
	b _0808324E
_0808323E:
	ldr r0, _08083254 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083258 @ =sub_8083418
	str r0, [r1]
	movs r0, 0x1
_0808324E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08083254: .4byte gTasks
_08083258: .4byte sub_8083418
	thumb_func_end sub_8082DF4

	thumb_func_start sub_8082E28
sub_8082E28: @ 808325C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808328C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08083298
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	bne _08083298
	ldr r0, _08083290 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083294 @ =sub_80833EC
	str r0, [r1]
	movs r0, 0x1
	b _0808329A
	.align 2, 0
_0808328C: .4byte gMain
_08083290: .4byte gTasks
_08083294: .4byte sub_80833EC
_08083298:
	movs r0, 0
_0808329A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082E28

	thumb_func_start sub_8082E6C
sub_8082E6C: @ 80832A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _080832B6
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
_080832B6:
	ldr r0, _080832C8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080832CC
	movs r0, 0
	b _080832DC
	.align 2, 0
_080832C8: .4byte gMain
_080832CC:
	ldr r0, _080832E4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080832E8 @ =sub_80833EC
	str r0, [r1]
	movs r0, 0x1
_080832DC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080832E4: .4byte gTasks
_080832E8: .4byte sub_80833EC
	thumb_func_end sub_8082E6C

	thumb_func_start sub_8082EB8
sub_8082EB8: @ 80832EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08083302
	movs r0, 0
	b _08083312
_08083302:
	ldr r0, _08083318 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808331C @ =sub_8083418
	str r0, [r1]
	movs r0, 0x1
_08083312:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08083318: .4byte gTasks
_0808331C: .4byte sub_8083418
	thumb_func_end sub_8082EB8

	thumb_func_start unref_sub_8082EEC
unref_sub_8082EEC: @ 8083320
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08083350 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0808334A
	movs r0, 0x2
	bl sub_8007E9C
	adds r0, r4, 0
	bl DestroyTask
_0808334A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083350: .4byte gTasks
	thumb_func_end unref_sub_8082EEC

	thumb_func_start sub_8082F20
sub_8082F20: @ 8083354
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808337C @ =0x03004b38
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08083380
	bl OpenLinkTimed
	bl sub_80082EC
	bl ResetLinkPlayers
	b _0808338C
	.align 2, 0
_0808337C: .4byte 0x03004b38
_08083380:
	cmp r2, 0x9
	ble _0808338C
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08083398 @ =sub_8082F68
	str r1, [r0]
_0808338C:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083398: .4byte sub_8082F68
	thumb_func_end sub_8082F20

	thumb_func_start sub_8082F68
sub_8082F68: @ 808339C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08083410
	adds r0, r4, 0
	bl sub_8082E6C
	cmp r0, 0x1
	beq _08083410
	cmp r5, 0x1
	bls _08083410
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
	ldr r1, _080833F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0
	strh r0, [r4, 0xE]
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083400
	movs r0, 0x15
	bl PlaySE
	ldr r0, _080833F8 @ =gUnknown_081A4932
	bl ShowFieldAutoScrollMessage
	ldr r0, _080833FC @ =sub_8082FEC
	b _0808340E
	.align 2, 0
_080833F4: .4byte gTasks
_080833F8: .4byte gUnknown_081A4932
_080833FC: .4byte sub_8082FEC
_08083400:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _08083418 @ =gUnknown_081A49B6
	bl ShowFieldAutoScrollMessage
	ldr r0, _0808341C @ =sub_80831F8
_0808340E:
	str r0, [r4]
_08083410:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083418: .4byte gUnknown_081A49B6
_0808341C: .4byte sub_80831F8
	thumb_func_end sub_8082F68

	thumb_func_start sub_8082FEC
sub_8082FEC: @ 8083420
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08083460
	adds r0, r4, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _08083460
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _08083460
	bl GetFieldMessageBoxMode
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _08083460
	ldr r0, _08083468 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0xE]
	ldr r0, _0808346C @ =sub_808303C
	str r0, [r1]
_08083460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083468: .4byte gTasks
_0808346C: .4byte sub_808303C
	thumb_func_end sub_8082FEC

	thumb_func_start sub_808303C
sub_808303C: @ 8083470
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080834CC @ =0x03004b38
	adds r7, r0, r1
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _0808350E
	adds r0, r5, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _0808350E
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _0808350E
	lsls r4, r6, 24
	lsrs r1, r4, 24
	adds r0, r5, 0
	bl sub_8082D60
	ldr r0, _080834D0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808350E
	ldr r0, _080834D4 @ =gLinkType
	ldrh r1, [r0]
	ldr r0, _080834D8 @ =0x00002255
	cmp r1, r0
	bne _080834DC
	cmp r6, 0x1
	bhi _080834E4
	b _0808350E
	.align 2, 0
_080834CC: .4byte 0x03004b38
_080834D0: .4byte gMain
_080834D4: .4byte gLinkType
_080834D8: .4byte 0x00002255
_080834DC:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, r6
	bgt _0808350E
_080834E4:
	lsrs r0, r4, 24
	bl sub_80081C8
	bl sub_8082D4C
	ldr r0, _08083514 @ =gStringVar1
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _08083518 @ =gUnknown_081A4975
	bl ShowFieldAutoScrollMessage
	ldr r1, _0808351C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083520 @ =sub_80830E4
	str r1, [r0]
_0808350E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083514: .4byte gStringVar1
_08083518: .4byte gUnknown_081A4975
_0808351C: .4byte gTasks
_08083520: .4byte sub_80830E4
	thumb_func_end sub_808303C

	thumb_func_start sub_80830E4
sub_80830E4: @ 8083524
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r5, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _080835B8
	adds r0, r5, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _080835B8
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080835B8
	bl GetFieldMessageBoxMode
	lsls r0, 24
	cmp r0, 0
	bne _080835B8
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08083572
	ldr r0, _08083588 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08083598
_08083572:
	ldr r0, _0808358C @ =gUnknown_081A4932
	bl ShowFieldAutoScrollMessage
	ldr r1, _08083590 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083594 @ =sub_8082FEC
	str r1, [r0]
	b _080835B8
	.align 2, 0
_08083588: .4byte gMain
_0808358C: .4byte gUnknown_081A4932
_08083590: .4byte gTasks
_08083594: .4byte sub_8082FEC
_08083598:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080835B8
	movs r0, 0x5
	bl PlaySE
	bl sub_8007F4C
	ldr r0, _080835C0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _080835C4 @ =sub_8083188
	str r0, [r1]
_080835B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080835C0: .4byte gTasks
_080835C4: .4byte sub_8083188
	thumb_func_end sub_80830E4

	thumb_func_start sub_8083188
sub_8083188: @ 80835C8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0808360C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _0808362A
	adds r0, r4, 0
	bl sub_8083444
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808362A
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08083614
	ldr r0, _08083610 @ =sub_8083418
	b _08083628
	.align 2, 0
_0808360C: .4byte gTasks
_08083610: .4byte sub_8083418
_08083614:
	ldr r4, _08083630 @ =gScriptResult
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8082D9C
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	beq _0808362A
	ldr r0, _08083634 @ =sub_8083288
_08083628:
	str r0, [r5]
_0808362A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083630: .4byte gScriptResult
_08083634: .4byte sub_8083288
	thumb_func_end sub_8083188

	thumb_func_start sub_80831F8
sub_80831F8: @ 8083638
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08083684 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _080836B0
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080836B0
	ldr r4, _08083688 @ =gScriptResult
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8082D9C
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080836B0
	cmp r0, 0x3
	bne _08083690
	bl sub_800832C
	bl HideFieldMessageBox
	ldr r0, _0808368C @ =sub_80833C4
	b _080836AE
	.align 2, 0
_08083684: .4byte gTasks
_08083688: .4byte gScriptResult
_0808368C: .4byte sub_80833C4
_08083690:
	bl GetLinkPlayerCount_2
	ldr r4, _080836B8 @ =gFieldLinkPlayerCount
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _080836BC @ =gUnknown_03004860
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_80081C8
	ldr r0, _080836C0 @ =gBlockSendBuffer
	bl sub_8093390
	ldr r0, _080836C4 @ =sub_8083314
_080836AE:
	str r0, [r5]
_080836B0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080836B8: .4byte gFieldLinkPlayerCount
_080836BC: .4byte gUnknown_03004860
_080836C0: .4byte gBlockSendBuffer
_080836C4: .4byte sub_8083314
	thumb_func_end sub_80831F8

	thumb_func_start sub_8083288
sub_8083288: @ 80836C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _08083738
	ldr r0, _080836FC @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _08083708
	bl sub_800832C
	bl HideFieldMessageBox
	ldr r0, _08083700 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083704 @ =sub_80833C4
	str r0, [r1]
	b _08083738
	.align 2, 0
_080836FC: .4byte gScriptResult
_08083700: .4byte gTasks
_08083704: .4byte sub_80833C4
_08083708:
	bl GetLinkPlayerCount_2
	ldr r4, _08083740 @ =gFieldLinkPlayerCount
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _08083744 @ =gUnknown_03004860
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_80081C8
	ldr r0, _08083748 @ =gBlockSendBuffer
	bl sub_8093390
	ldr r1, _0808374C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083750 @ =sub_8083314
	str r1, [r0]
	movs r0, 0x2
	bl sub_8007E9C
_08083738:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083740: .4byte gFieldLinkPlayerCount
_08083744: .4byte gUnknown_03004860
_08083748: .4byte gBlockSendBuffer
_0808374C: .4byte gTasks
_08083750: .4byte sub_8083314
	thumb_func_end sub_8083288

	thumb_func_start sub_8083314
sub_8083314: @ 8083754
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _0808380A
	bl GetBlockReceivedStatus
	adds r4, r0, 0
	bl sub_8008198
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _0808380A
	movs r4, 0
	ldr r6, _0808377C @ =gTrainerCards
	b _0808379A
	.align 2, 0
_0808377C: .4byte gTrainerCards
_08083780:
	lsls r1, r4, 8
	ldr r0, _080837E0 @ =gBlockRecvBuffer
	adds r1, r0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 3
	adds r0, r6
	movs r2, 0x38
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0808379A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08083780
	movs r0, 0
	bl SetSuppressLinkErrorMessage
	bl ResetBlockReceivedFlags
	bl HideFieldMessageBox
	ldr r0, _080837E4 @ =gScriptResult
	ldrh r2, [r0]
	cmp r2, 0x1
	bne _080837F8
	ldr r0, _080837E8 @ =gLinkType
	ldrh r1, [r0]
	ldr r0, _080837EC @ =0x00004411
	cmp r1, r0
	beq _080837D0
	ldr r0, _080837F0 @ =0x00006601
	cmp r1, r0
	bne _080837D0
	ldr r0, _080837F4 @ =0x03002970
	strb r2, [r0]
_080837D0:
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _0808380A
	.align 2, 0
_080837E0: .4byte gBlockRecvBuffer
_080837E4: .4byte gScriptResult
_080837E8: .4byte gLinkType
_080837EC: .4byte 0x00004411
_080837F0: .4byte 0x00006601
_080837F4: .4byte 0x03002970
_080837F8:
	bl sub_800832C
	ldr r0, _08083810 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083814 @ =sub_80833C4
	str r0, [r1]
_0808380A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083810: .4byte gTasks
_08083814: .4byte sub_80833C4
	thumb_func_end sub_8083314

	thumb_func_start sub_80833C4
sub_80833C4: @ 8083818
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808383C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083834
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08083834:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808383C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80833C4

	thumb_func_start sub_80833EC
sub_80833EC: @ 8083840
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083868 @ =gScriptResult
	movs r0, 0x5
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083868: .4byte gScriptResult
	thumb_func_end sub_80833EC

	thumb_func_start sub_8083418
sub_8083418: @ 808386C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083894 @ =gScriptResult
	movs r0, 0x6
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083894: .4byte gScriptResult
	thumb_func_end sub_8083418

	thumb_func_start sub_8083444
sub_8083444: @ 8083898
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080838BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 18
	cmp r0, r1
	bgt _080838C0
	movs r0, 0
	b _080838C6
	.align 2, 0
_080838BC: .4byte gTasks
_080838C0:
	ldr r0, _080838CC @ =sub_8083418
	str r0, [r2]
	movs r0, 0x1
_080838C6:
	pop {r1}
	bx r1
	.align 2, 0
_080838CC: .4byte sub_8083418
	thumb_func_end sub_8083444

	thumb_func_start sub_808347C
sub_808347C: @ 80838D0
	push {r4,lr}
	movs r3, 0x2
	movs r2, 0x2
	ldr r0, _080838E8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08083904
	cmp r0, 0x2
	bgt _080838EC
	cmp r0, 0x1
	beq _080838F2
	b _08083920
	.align 2, 0
_080838E8: .4byte gSpecialVar_0x8004
_080838EC:
	cmp r0, 0x5
	beq _08083914
	b _08083920
_080838F2:
	movs r3, 0x2
	ldr r1, _080838FC @ =gLinkType
	ldr r4, _08083900 @ =0x00002233
	b _0808391C
	.align 2, 0
_080838FC: .4byte gLinkType
_08083900: .4byte 0x00002233
_08083904:
	movs r3, 0x2
	ldr r1, _0808390C @ =gLinkType
	ldr r4, _08083910 @ =0x00002244
	b _0808391C
	.align 2, 0
_0808390C: .4byte gLinkType
_08083910: .4byte 0x00002244
_08083914:
	movs r3, 0x4
	movs r2, 0x4
	ldr r1, _08083930 @ =gLinkType
	ldr r4, _08083934 @ =0x00002255
_0808391C:
	adds r0, r4, 0
	strh r0, [r1]
_08083920:
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_8082CD4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083930: .4byte gLinkType
_08083934: .4byte 0x00002255
	thumb_func_end sub_808347C

	thumb_func_start sub_80834E4
sub_80834E4: @ 8083938
	push {lr}
	ldr r1, _08083954 @ =gLinkType
	ldr r2, _08083958 @ =0x00001133
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0808395C @ =gUnknown_020239F8
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083954: .4byte gLinkType
_08083958: .4byte 0x00001133
_0808395C: .4byte gUnknown_020239F8
	thumb_func_end sub_80834E4

	thumb_func_start sub_808350C
sub_808350C: @ 8083960
	push {lr}
	ldr r0, _08083980 @ =gScriptResult
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08083984 @ =gLinkType
	ldr r3, _08083988 @ =0x00003311
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0808398C @ =gUnknown_020239F8
	strh r2, [r0]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083980: .4byte gScriptResult
_08083984: .4byte gLinkType
_08083988: .4byte 0x00003311
_0808398C: .4byte gUnknown_020239F8
	thumb_func_end sub_808350C

	thumb_func_start sub_808353C
sub_808353C: @ 8083990
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080839B0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080839B4
	cmp r0, 0x1
	beq _08083A10
	b _08083A22
	.align 2, 0
_080839B0: .4byte gTasks
_080839B4:
	ldr r0, _080839E8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080839DA
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r1, r0
	bge _080839DA
	ldr r2, _080839EC @ =gLinkPlayers
_080839CC:
	ldrh r4, [r2, 0x1A]
	cmp r4, 0x1
	beq _080839F0
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, r0
	blt _080839CC
_080839DA:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _08083A22
	.align 2, 0
_080839E8: .4byte gScriptResult
_080839EC: .4byte gLinkPlayers
_080839F0:
	ldr r1, _08083A08 @ =gScriptResult
	movs r0, 0x7
	strh r0, [r1]
	bl sub_8008480
	ldr r1, _08083A0C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _08083A22
	.align 2, 0
_08083A08: .4byte gScriptResult
_08083A0C: .4byte gTasks
_08083A10:
	ldr r0, _08083A28 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083A22
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_08083A22:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083A28: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_808353C

	thumb_func_start sub_80835D8
sub_80835D8: @ 8083A2C
	push {r4,lr}
	ldr r4, _08083A60 @ =sub_808353C
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08083A58
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08083A64 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
_08083A58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083A60: .4byte sub_808353C
_08083A64: .4byte gTasks
	thumb_func_end sub_80835D8

	thumb_func_start sub_8083614
sub_8083614: @ 8083A68
	push {lr}
	ldr r1, _08083A84 @ =gLinkType
	ldr r2, _08083A88 @ =0x00004411
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083A8C @ =gUnknown_020239F8
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083A84: .4byte gLinkType
_08083A88: .4byte 0x00004411
_08083A8C: .4byte gUnknown_020239F8
	thumb_func_end sub_8083614

	thumb_func_start sub_808363C
sub_808363C: @ 8083A90
	push {lr}
	ldr r1, _08083AAC @ =gLinkType
	ldr r2, _08083AB0 @ =0x00006601
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083AB4 @ =gUnknown_020239F8
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x4
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083AAC: .4byte gLinkType
_08083AB0: .4byte 0x00006601
_08083AB4: .4byte gUnknown_020239F8
	thumb_func_end sub_808363C

	thumb_func_start sub_8083664
sub_8083664: @ 8083AB8
	push {lr}
	ldr r0, _08083ACC @ =sub_8083710
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _08083AD0
	movs r0, 0xFF
	b _08083B54
	.align 2, 0
_08083ACC: .4byte sub_8083710
_08083AD0:
	ldr r0, _08083AE4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _08083B48
	lsls r0, 2
	ldr r1, _08083AE8 @ =_08083AEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083AE4: .4byte gSpecialVar_0x8004
_08083AE8: .4byte _08083AEC
	.align 2, 0
_08083AEC:
	.4byte _08083B00
	.4byte _08083B10
	.4byte _08083B30
	.4byte _08083B40
	.4byte _08083B20
_08083B00:
	ldr r1, _08083B08 @ =gLinkType
	ldr r2, _08083B0C @ =0x00002233
	b _08083B44
	.align 2, 0
_08083B08: .4byte gLinkType
_08083B0C: .4byte 0x00002233
_08083B10:
	ldr r1, _08083B18 @ =gLinkType
	ldr r2, _08083B1C @ =0x00002244
	b _08083B44
	.align 2, 0
_08083B18: .4byte gLinkType
_08083B1C: .4byte 0x00002244
_08083B20:
	ldr r1, _08083B28 @ =gLinkType
	ldr r2, _08083B2C @ =0x00002255
	b _08083B44
	.align 2, 0
_08083B28: .4byte gLinkType
_08083B2C: .4byte 0x00002255
_08083B30:
	ldr r1, _08083B38 @ =gLinkType
	ldr r2, _08083B3C @ =0x00001111
	b _08083B44
	.align 2, 0
_08083B38: .4byte gLinkType
_08083B3C: .4byte 0x00001111
_08083B40:
	ldr r1, _08083B58 @ =gLinkType
	ldr r2, _08083B5C @ =0x00003322
_08083B44:
	adds r0, r2, 0
	strh r0, [r1]
_08083B48:
	ldr r0, _08083B60 @ =sub_8083710
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
_08083B54:
	pop {r1}
	bx r1
	.align 2, 0
_08083B58: .4byte gLinkType
_08083B5C: .4byte 0x00003322
_08083B60: .4byte sub_8083710
	thumb_func_end sub_8083664

	thumb_func_start sub_8083710
sub_8083710: @ 8083B64
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08083B90 @ =0x03004b38
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08083B98
	bl OpenLink
	bl ResetLinkPlayers
	ldr r0, _08083B94 @ =sub_8083C50
	movs r1, 0x50
	bl CreateTask
	b _08083BA4
	.align 2, 0
_08083B90: .4byte 0x03004b38
_08083B94: .4byte sub_8083C50
_08083B98:
	cmp r2, 0x9
	ble _08083BA4
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08083BB0 @ =sub_8083760
	str r1, [r0]
_08083BA4:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083BB0: .4byte sub_8083760
	thumb_func_end sub_8083710

	thumb_func_start sub_8083760
sub_8083760: @ 8083BB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08083BFA
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083BEC
	ldr r0, _08083BE4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083BE8 @ =sub_80837B4
	b _08083BF8
	.align 2, 0
_08083BE4: .4byte gTasks
_08083BE8: .4byte sub_80837B4
_08083BEC:
	ldr r0, _08083C00 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083C04 @ =sub_80837EC
_08083BF8:
	str r0, [r1]
_08083BFA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083C00: .4byte gTasks
_08083C04: .4byte sub_80837EC
	thumb_func_end sub_8083760

	thumb_func_start sub_80837B4
sub_80837B4: @ 8083C08
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08083C32
	bl sub_8007F4C
	ldr r0, _08083C38 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083C3C @ =sub_80837EC
	str r0, [r1]
_08083C32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083C38: .4byte gTasks
_08083C3C: .4byte sub_80837EC
	thumb_func_end sub_80837B4

	thumb_func_start sub_80837EC
sub_80837EC: @ 8083C40
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08083C70 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08083C68
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083C68
	bl sub_800826C
	bl sub_8007B14
	adds r0, r4, 0
	bl DestroyTask
_08083C68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083C70: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80837EC

	thumb_func_start sub_8083820
sub_8083820: @ 8083C74
	push {lr}
	bl InitSaveDialog
	pop {r0}
	bx r0
	thumb_func_end sub_8083820

	thumb_func_start sub_808382C
sub_808382C: @ 8083C80
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083CA4 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _08083C9A
	b _08083D94
_08083C9A:
	lsls r0, 2
	ldr r1, _08083CA8 @ =_08083CAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083CA4: .4byte gTasks
_08083CA8: .4byte _08083CAC
	.align 2, 0
_08083CAC:
	.4byte _08083CC4
	.4byte _08083CE4
	.4byte _08083CF4
	.4byte _08083D04
	.4byte _08083D0A
	.4byte _08083D20
_08083CC4:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08083CDC @ =gLinkType
	ldr r2, _08083CE0 @ =0x00002211
	adds r0, r2, 0
	strh r0, [r1]
	bl ClearLinkCallback_2
	b _08083D12
	.align 2, 0
_08083CDC: .4byte gLinkType
_08083CE0: .4byte 0x00002211
_08083CE4:
	ldr r0, _08083CF0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _08083D0E
	.align 2, 0
_08083CF0: .4byte gPaletteFade
_08083CF4:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08083D94
	b _08083D12
_08083D04:
	bl sub_800832C
	b _08083D12
_08083D0A:
	ldr r0, _08083D1C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
_08083D0E:
	cmp r0, 0
	bne _08083D94
_08083D12:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083D94
	.align 2, 0
_08083D1C: .4byte gReceivedRemoteLinkPlayers
_08083D20:
	ldr r0, _08083D38 @ =gLinkPlayers
	ldr r0, [r0, 0x4]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08083D3C
	movs r0, 0xE6
	lsls r0, 1
	bl current_map_music_set__default_for_battle
	b _08083D42
	.align 2, 0
_08083D38: .4byte gLinkPlayers
_08083D3C:
	ldr r0, _08083D54 @ =0x000001cb
	bl current_map_music_set__default_for_battle
_08083D42:
	ldr r0, _08083D58 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08083D6C
	cmp r0, 0x2
	bgt _08083D5C
	cmp r0, 0x1
	beq _08083D62
	b _08083D82
	.align 2, 0
_08083D54: .4byte 0x000001cb
_08083D58: .4byte gSpecialVar_0x8004
_08083D5C:
	cmp r0, 0x5
	beq _08083D78
	b _08083D82
_08083D62:
	ldr r1, _08083D68 @ =gUnknown_020239F8
	movs r0, 0xA
	b _08083D80
	.align 2, 0
_08083D68: .4byte gUnknown_020239F8
_08083D6C:
	ldr r1, _08083D74 @ =gUnknown_020239F8
	movs r0, 0xB
	b _08083D80
	.align 2, 0
_08083D74: .4byte gUnknown_020239F8
_08083D78:
	bl ReducePlayerPartyToThree
	ldr r1, _08083D9C @ =gUnknown_020239F8
	movs r0, 0x4B
_08083D80:
	strh r0, [r1]
_08083D82:
	ldr r0, _08083DA0 @ =sub_800E7C4
	bl SetMainCallback2
	ldr r1, _08083DA4 @ =gMain
	ldr r0, _08083DA8 @ =sub_8083958
	str r0, [r1, 0x8]
	adds r0, r5, 0
	bl DestroyTask
_08083D94:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083D9C: .4byte gUnknown_020239F8
_08083DA0: .4byte sub_800E7C4
_08083DA4: .4byte gMain
_08083DA8: .4byte sub_8083958
	thumb_func_end sub_808382C

	thumb_func_start sub_8083958
sub_8083958: @ 8083DAC
	push {lr}
	bl call_map_music_set_to_zero
	bl LoadPlayerParty
	bl SavePlayerData
	bl sub_810FEFC
	ldr r0, _08083DE4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _08083DD2
	ldr r0, _08083DE8 @ =gUnknown_03004860
	ldrb r1, [r0]
	movs r0, 0x1
	eors r0, r1
	bl sub_8110290
_08083DD2:
	ldr r0, _08083DEC @ =gMain
	ldr r1, _08083DF0 @ =sub_805465C
	str r1, [r0, 0x8]
	ldr r0, _08083DF4 @ =sub_8071B28
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08083DE4: .4byte gSpecialVar_0x8004
_08083DE8: .4byte gUnknown_03004860
_08083DEC: .4byte gMain
_08083DF0: .4byte sub_805465C
_08083DF4: .4byte sub_8071B28
	thumb_func_end sub_8083958

	thumb_func_start sub_80839A4
sub_80839A4: @ 8083DF8
	push {lr}
	ldr r0, _08083E20 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _08083E0C
	cmp r1, 0x5
	bne _08083E14
_08083E0C:
	bl LoadPlayerParty
	bl SavePlayerData
_08083E14:
	movs r0, 0x7F
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	pop {r0}
	bx r0
	.align 2, 0
_08083E20: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80839A4

	thumb_func_start sub_80839D0
sub_80839D0: @ 8083E24
	push {lr}
	bl sub_805559C
	pop {r0}
	bx r0
	thumb_func_end sub_80839D0

	thumb_func_start sub_80839DC
sub_80839DC: @ 8083E30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083E54 @ =gTasks
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08083E74
	cmp r0, 0x1
	bgt _08083E58
	cmp r0, 0
	beq _08083E62
	b _08083ED2
	.align 2, 0
_08083E54: .4byte gTasks
_08083E58:
	cmp r0, 0x2
	beq _08083E94
	cmp r0, 0x3
	beq _08083EBC
	b _08083ED2
_08083E62:
	ldr r0, _08083E70 @ =gUnknown_081A490C
	bl ShowFieldMessage
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08083ED2
	.align 2, 0
_08083E70: .4byte gUnknown_081A490C
_08083E74:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _08083ED2
	bl sub_8055574
	ldr r0, _08083E90 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	bl sub_8007270
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08083ED2
	.align 2, 0
_08083E90: .4byte gSpecialVar_0x8005
_08083E94:
	bl sub_80554F8
	cmp r0, 0x1
	beq _08083EA6
	cmp r0, 0x1
	ble _08083ED2
	cmp r0, 0x2
	beq _08083EB6
	b _08083ED2
_08083EA6:
	bl HideFieldMessageBox
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
	b _08083ED2
_08083EB6:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08083ED2
_08083EBC:
	bl sub_8055588
	bl HideFieldMessageBox
	bl MenuZeroFillScreen
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08083ED2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80839DC

	thumb_func_start sub_8083A84
sub_8083A84: @ 8083ED8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08083EFC @ =sub_80839DC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083EFC: .4byte sub_80839DC
	thumb_func_end sub_8083A84

	thumb_func_start sub_8083AAC
sub_8083AAC: @ 8083F00
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083F24 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08083F44
	cmp r0, 0x1
	bgt _08083F28
	cmp r0, 0
	beq _08083F32
	b _08083F88
	.align 2, 0
_08083F24: .4byte gTasks
_08083F28:
	cmp r0, 0x2
	beq _08083F58
	cmp r0, 0x3
	beq _08083F74
	b _08083F88
_08083F32:
	bl ScriptContext2_Enable
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl ClearLinkCallback_2
	b _08083F68
_08083F44:
	ldr r0, _08083F54 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08083F88
	b _08083F68
	.align 2, 0
_08083F54: .4byte gPaletteFade
_08083F58:
	ldr r1, _08083F70 @ =gUnknown_020297D8
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	bl m4aMPlayAllStop
	bl sub_800832C
_08083F68:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083F88
	.align 2, 0
_08083F70: .4byte gUnknown_020297D8
_08083F74:
	ldr r0, _08083F90 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083F88
	ldr r0, _08083F94 @ =sub_8047CD8
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08083F88:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083F90: .4byte gReceivedRemoteLinkPlayers
_08083F94: .4byte sub_8047CD8
	thumb_func_end sub_8083AAC

	thumb_func_start sub_8083B44
sub_8083B44: @ 8083F98
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8083B6C
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8083B44

	thumb_func_start sub_8083B5C
sub_8083B5C: @ 8083FB0
	push {lr}
	ldr r0, _08083FBC @ =sub_8083B44
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083FBC: .4byte sub_8083B44
	thumb_func_end sub_8083B5C

	thumb_func_start sub_8083B6C
sub_8083B6C: @ 8083FC0
	push {lr}
	ldr r0, _08083FD0 @ =sub_8083AAC
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08083FD0: .4byte sub_8083AAC
	thumb_func_end sub_8083B6C

	thumb_func_start sub_8083B80
sub_8083B80: @ 8083FD4
	push {lr}
	bl sub_8083B6C
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_8083B80

	thumb_func_start sub_8083B90
sub_8083B90: @ 8083FE4
	push {lr}
	ldr r0, _08083FF8 @ =gLinkType
	ldr r2, _08083FFC @ =0x00002211
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08084000 @ =sub_808382C
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083FF8: .4byte gLinkType
_08083FFC: .4byte 0x00002211
_08084000: .4byte sub_808382C
	thumb_func_end sub_8083B90

	thumb_func_start unref_sub_8083BB0
unref_sub_8083BB0: @ 8084004
	push {r4,lr}
	ldr r4, _08084028 @ =sub_80839DC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0808402C @ =sub_80B9484
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084028: .4byte sub_80839DC
_0808402C: .4byte sub_80B9484
	thumb_func_end unref_sub_8083BB0

	thumb_func_start sub_8083BDC
sub_8083BDC: @ 8084030
	push {lr}
	ldr r0, _08084040 @ =gSpecialVar_0x8006
	ldrb r0, [r0]
	ldr r1, _08084044 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl sub_8093130
	pop {r0}
	bx r0
	.align 2, 0
_08084040: .4byte gSpecialVar_0x8006
_08084044: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8083BDC

	thumb_func_start sub_8083BF4
sub_8083BF4: @ 8084048
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08084088 @ =gSpecialVar_0x8006
	strh r4, [r0]
	ldr r0, _0808408C @ =gStringVar1
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _08084090 @ =0x03002988
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80934C4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0808409C
	ldr r0, _08084094 @ =gStringVar2
	ldr r2, _08084098 @ =gTrainerCardColorNames
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x1
	b _0808409E
	.align 2, 0
_08084088: .4byte gSpecialVar_0x8006
_0808408C: .4byte gStringVar1
_08084090: .4byte 0x03002988
_08084094: .4byte gStringVar2
_08084098: .4byte gTrainerCardColorNames
_0808409C:
	movs r0, 0
_0808409E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8083BF4

	thumb_func_start sub_8083C50
sub_8083C50: @ 80840A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080840EC @ =gTasks
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _080840D6
	bl CloseLink
	ldr r0, _080840F0 @ =CB2_LinkError
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080840D6:
	ldr r0, _080840F4 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080840E4
	adds r0, r5, 0
	bl DestroyTask
_080840E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080840EC: .4byte gTasks
_080840F0: .4byte CB2_LinkError
_080840F4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083C50

	thumb_func_start sub_8083CA4
sub_8083CA4: @ 80840F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08084118 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08084110
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08084110:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084118: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083CA4

	thumb_func_start unref_sub_8083CC8
unref_sub_8083CC8: @ 808411C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _0808413C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08084140 @ =sub_8083CA4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808413C: .4byte gTasks
_08084140: .4byte sub_8083CA4
	thumb_func_end unref_sub_8083CC8

	.align 2, 0 @ Don't pad with nop.
