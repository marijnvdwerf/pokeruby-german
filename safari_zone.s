	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetSafariZoneFlag
GetSafariZoneFlag: @ 80C8184
	push {lr}
	ldr r0, _080C8194 @ =0x0000082c
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C8194: .4byte 0x0000082c
	thumb_func_end GetSafariZoneFlag

	thumb_func_start SetSafariZoneFlag
SetSafariZoneFlag: @ 80C8198
	push {lr}
	ldr r0, _080C81A4 @ =0x0000082c
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080C81A4: .4byte 0x0000082c
	thumb_func_end SetSafariZoneFlag

	thumb_func_start ResetSafariZoneFlag
ResetSafariZoneFlag: @ 80C81A8
	push {lr}
	ldr r0, _080C81B4 @ =0x0000082c
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080C81B4: .4byte 0x0000082c
	thumb_func_end ResetSafariZoneFlag

	thumb_func_start EnterSafariMode
EnterSafariMode: @ 80C81B8
	push {lr}
	movs r0, 0x11
	bl sav12_xor_increment
	bl SetSafariZoneFlag
	bl ClearAllPokeblockFeeders
	ldr r1, _080C81DC @ =gNumSafariBalls
	movs r0, 0x1E
	strb r0, [r1]
	ldr r1, _080C81E0 @ =0x0203880a
	movs r2, 0xFA
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C81DC: .4byte gNumSafariBalls
_080C81E0: .4byte 0x0203880a
	thumb_func_end EnterSafariMode

	thumb_func_start ExitSafariMode
ExitSafariMode: @ 80C81E4
	push {lr}
	bl ResetSafariZoneFlag
	bl ClearAllPokeblockFeeders
	ldr r1, _080C8200 @ =gNumSafariBalls
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080C8204 @ =0x0203880a
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C8200: .4byte gNumSafariBalls
_080C8204: .4byte 0x0203880a
	thumb_func_end ExitSafariMode

	thumb_func_start SafariZoneTakeStep
SafariZoneTakeStep: @ 80C8208
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _080C8224
	bl DecrementFeederStepCounters
	ldr r1, _080C8228 @ =0x0203880a
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080C822C
_080C8224:
	movs r0, 0
	b _080C8234
	.align 2, 0
_080C8228: .4byte 0x0203880a
_080C822C:
	ldr r0, _080C8238 @ =gUnknown_081C3448
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_080C8234:
	pop {r1}
	bx r1
	.align 2, 0
_080C8238: .4byte gUnknown_081C3448
	thumb_func_end SafariZoneTakeStep

	thumb_func_start SafariZoneRetirePrompt
SafariZoneRetirePrompt: @ 80C823C
	push {lr}
	ldr r0, _080C8248 @ =gUnknown_081C342D
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080C8248: .4byte gUnknown_081C342D
	thumb_func_end SafariZoneRetirePrompt

	thumb_func_start sub_80C824C
sub_80C824C: @ 80C824C
	push {lr}
	ldr r0, _080C8260 @ =gNumSafariBalls
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C8268
	ldr r0, _080C8264 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _080C82B0
	.align 2, 0
_080C8260: .4byte gNumSafariBalls
_080C8264: .4byte c2_exit_to_overworld_2_switch
_080C8268:
	ldr r0, _080C8288 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080C829C
	ldr r0, _080C828C @ =gUnknown_081C340A
	bl ScriptContext2_RunNewScript
	bl warp_in
	ldr r1, _080C8290 @ =gUnknown_0300485C
	ldr r0, _080C8294 @ =sub_8080E44
	str r0, [r1]
	ldr r0, _080C8298 @ =CB2_LoadMap
	bl SetMainCallback2
	b _080C82B0
	.align 2, 0
_080C8288: .4byte gUnknown_02024D26
_080C828C: .4byte gUnknown_081C340A
_080C8290: .4byte gUnknown_0300485C
_080C8294: .4byte sub_8080E44
_080C8298: .4byte CB2_LoadMap
_080C829C:
	cmp r0, 0x7
	bne _080C82B0
	ldr r0, _080C82B4 @ =gUnknown_081C3459
	bl ScriptContext1_SetupScript
	bl ScriptContext1_Stop
	ldr r0, _080C82B8 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080C82B0:
	pop {r0}
	bx r0
	.align 2, 0
_080C82B4: .4byte gUnknown_081C3459
_080C82B8: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C824C

	thumb_func_start ClearPokeblockFeeder
ClearPokeblockFeeder: @ 80C84B8
	push {lr}
	lsls r0, 24
	lsrs r0, 20
	ldr r1, _080C84D0 @ =0x0203880c
	adds r0, r1
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080C84D0: .4byte 0x0203880c
	thumb_func_end ClearPokeblockFeeder

	thumb_func_start ClearAllPokeblockFeeders
ClearAllPokeblockFeeders: @ 80C84D4
	push {lr}
	ldr r0, _080C84E4 @ =0x0203880c
	movs r1, 0
	movs r2, 0xA0
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080C84E4: .4byte 0x0203880c
	thumb_func_end ClearAllPokeblockFeeders

	thumb_func_start SafariZoneGetPokeblockNameInFeeder
SafariZoneGetPokeblockNameInFeeder: @ 80C82EC
	push {r4-r6,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r3, 0
	adds r5, r4, 0
	ldr r4, _080C8344 @ =gSaveBlock1
_080C8302:
	ldr r1, _080C8348 @ =0x0203880c
	lsls r0, r3, 4
	adds r2, r0, r1
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080C8358
	mov r0, sp
	movs r6, 0
	ldrsh r1, [r2, r6]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r1, r0
	bne _080C8358
	movs r0, 0x2
	ldrsh r1, [r2, r0]
	movs r6, 0
	ldrsh r0, [r5, r6]
	cmp r1, r0
	bne _080C8358
	ldr r0, _080C834C @ =gScriptResult
	strh r3, [r0]
	ldr r1, _080C8350 @ =gPokeblockNames
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _080C8354 @ =gStringVar1
	bl StringCopy
	b _080C836A
	.align 2, 0
_080C8344: .4byte gSaveBlock1
_080C8348: .4byte 0x0203880c
_080C834C: .4byte gScriptResult
_080C8350: .4byte gPokeblockNames
_080C8354: .4byte gStringVar1
_080C8358:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _080C8302
	ldr r1, _080C8374 @ =gScriptResult
	ldr r2, _080C8378 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
_080C836A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C8374: .4byte gScriptResult
_080C8378: .4byte 0x0000ffff
	thumb_func_end SafariZoneGetPokeblockNameInFeeder

	thumb_func_start GetPokeblockFeederWithinRange
GetPokeblockFeederWithinRange: @ 80C8578
	push {r4-r7,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r5, 0
	adds r6, r4, 0
	ldr r0, _080C85E4 @ =gSaveBlock1
	movs r7, 0x5
	ldrsb r7, [r0, r7]
	mov r4, sp
	ldr r0, _080C85E8 @ =0x0203880c
	mov r12, r0
_080C8598:
	lsls r0, r5, 4
	mov r1, r12
	adds r2, r0, r1
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r7, r0
	bne _080C85F0
	ldrh r0, [r4]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4]
	adds r3, r6, 0
	ldrh r0, [r3]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r3]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080C85C4
	negs r0, r0
	strh r0, [r4]
_080C85C4:
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _080C85D0
	negs r0, r0
	strh r0, [r3]
_080C85D0:
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	adds r0, r1
	cmp r0, 0x5
	bgt _080C85F0
	ldr r0, _080C85EC @ =gScriptResult
	strh r5, [r0]
	b _080C8602
	.align 2, 0
_080C85E4: .4byte gSaveBlock1
_080C85E8: .4byte 0x0203880c
_080C85EC: .4byte gScriptResult
_080C85F0:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080C8598
	ldr r1, _080C860C @ =gScriptResult
	ldr r2, _080C8610 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
_080C8602:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C860C: .4byte gScriptResult
_080C8610: .4byte 0x0000ffff
	thumb_func_end GetPokeblockFeederWithinRange

	thumb_func_start unref_sub_80C8418
unref_sub_80C8418: @ 80C8418
	push {lr}
	bl SafariZoneGetPokeblockNameInFeeder
	ldr r2, _080C8434 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _080C8438 @ =0x0000ffff
	cmp r1, r0
	beq _080C8440
	adds r0, r1, 0
	lsls r0, 4
	ldr r1, _080C843C @ =0x02038814
	adds r0, r1
	b _080C8442
	.align 2, 0
_080C8434: .4byte gScriptResult
_080C8438: .4byte 0x0000ffff
_080C843C: .4byte 0x02038814
_080C8440:
	movs r0, 0
_080C8442:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80C8418

	thumb_func_start SafariZoneGetActivePokeblock
SafariZoneGetActivePokeblock: @ 80C8448
	push {lr}
	bl GetPokeblockFeederWithinRange
	ldr r2, _080C8464 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _080C8468 @ =0x0000ffff
	cmp r1, r0
	beq _080C8470
	adds r0, r1, 0
	lsls r0, 4
	ldr r1, _080C846C @ =0x02038814
	adds r0, r1
	b _080C8472
	.align 2, 0
_080C8464: .4byte gScriptResult
_080C8468: .4byte 0x0000ffff
_080C846C: .4byte 0x02038814
_080C8470:
	movs r0, 0
_080C8472:
	pop {r1}
	bx r1
	thumb_func_end SafariZoneGetActivePokeblock

	thumb_func_start SafariZoneActivatePokeblockFeeder
SafariZoneActivatePokeblockFeeder: @ 80C8478
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	movs r2, 0
	ldr r3, _080C84E8 @ =0x0203880c
	mov r6, sp
	adds r6, 0x2
	ldr r7, _080C84EC @ =gSaveBlock1
	movs r1, 0x8
	adds r1, r3
	mov r9, r1
	movs r4, 0xFF
	lsls r4, 3
	adds r1, r7, r4
	lsrs r0, 21
	adds r0, r1
	mov r8, r0
_080C84A0:
	lsls r5, r2, 4
	adds r4, r5, r3
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _080C84F0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C84F0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C84F0
	mov r0, sp
	adds r1, r6, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldrb r0, [r7, 0x5]
	strb r0, [r4, 0x4]
	mov r3, r9
	adds r2, r5, r3
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0x64
	strb r0, [r4, 0x5]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
	ldrh r0, [r6]
	strh r0, [r4, 0x2]
	b _080C84FA
	.align 2, 0
_080C84E8: .4byte 0x0203880c
_080C84EC: .4byte gSaveBlock1
_080C84F0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9
	bls _080C84A0
_080C84FA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SafariZoneActivatePokeblockFeeder

	thumb_func_start DecrementFeederStepCounters
DecrementFeederStepCounters: @ 80C8704
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080C8734 @ =0x0203880c
_080C870A:
	lsls r0, r4, 4
	adds r1, r0, r5
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	beq _080C8724
	subs r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	cmp r0, 0
	bne _080C8724
	adds r0, r4, 0
	bl ClearPokeblockFeeder
_080C8724:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080C870A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8734: .4byte 0x0203880c
	thumb_func_end DecrementFeederStepCounters

	thumb_func_start unref_sub_80C853C
unref_sub_80C853C: @ 80C853C
	push {lr}
	bl SafariZoneGetPokeblockNameInFeeder
	ldr r3, _080C8564 @ =gScriptResult
	ldrh r1, [r3]
	ldr r0, _080C8568 @ =0x0000ffff
	cmp r1, r0
	beq _080C8574
	ldr r0, _080C856C @ =gStringVar2
	ldr r2, _080C8570 @ =0x0203880c
	lsls r1, 4
	adds r1, r2
	ldrb r1, [r1, 0x5]
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r0, 0x1
	b _080C8576
	.align 2, 0
_080C8564: .4byte gScriptResult
_080C8568: .4byte 0x0000ffff
_080C856C: .4byte gStringVar2
_080C8570: .4byte 0x0203880c
_080C8574:
	movs r0, 0
_080C8576:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80C853C

	.align 2, 0 @ Don't pad with nop.
