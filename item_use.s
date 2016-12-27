	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start de_sub_80C9274
de_sub_80C9274: @ 80C9274
	push {lr}
	adds r2, r0, 0
	ldr r1, _080C9288
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _080C9290
	cmp r2, 0
	beq _080C928C
	movs r0, 0x3
	b _080C928E
	.align 2, 0
_080C9288: .4byte 0x03002970
_080C928C:
	movs r0, 0x2
_080C928E:
	strb r0, [r1]
_080C9290:
	pop {r0}
	bx r0
	thumb_func_end de_sub_80C9274

	thumb_func_start de_sub_80C9294
de_sub_80C9294: @ 80C9294
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080C92A8
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _080C92B0
	cmp r5, 0
	beq _080C92AC
	movs r0, 0x3
	b _080C92DE
	.align 2, 0
_080C92A8: .4byte 0x03002970
_080C92AC:
	movs r0, 0x2
	b _080C92DE
_080C92B0:
	cmp r0, 0x2
	bne _080C92E0
	ldr r2, _080C92D4
	ldr r0, _080C92D8
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r2, 0x4
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0
	bl SendBlock
	cmp r5, 0
	beq _080C92DC
	movs r0, 0
	b _080C92DE
	.align 2, 0
_080C92D4: .4byte 0x081f4548
_080C92D8: .4byte deuUnkValue1
_080C92DC:
	movs r0, 0x1
_080C92DE:
	strb r0, [r4]
_080C92E0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end de_sub_80C9294

	thumb_func_start sub_80C8FAC
sub_80C8FAC: @ 80C92E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C930C
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _080C9314
	ldr r1, _080C9310
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _080C9322
	.align 2, 0
_080C930C: .4byte gScriptItemId
_080C9310: .4byte gTasks
_080C9314:
	ldrh r0, [r1]
	bl ItemId_GetType
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r2, r4, 2
_080C9322:
	ldr r0, _080C9344
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	ldr r2, _080C9348
	lsls r0, r3, 2
	adds r0, r2
	ldr r2, [r0]
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080C934C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9344: .4byte gTasks
_080C9348: .4byte gUnknown_083D61E4
_080C934C: .4byte sub_80A5B00
	thumb_func_end sub_80C8FAC

	thumb_func_start unknown_ItemMenu_Confirm
unknown_ItemMenu_Confirm: @ 80C9350
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C8FAC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end unknown_ItemMenu_Confirm

	thumb_func_start sub_80C9038
sub_80C9038: @ 80C9374
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C8FAC
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	thumb_func_end sub_80C9038

	thumb_func_start SetUpItemUseOnFieldCallback
SetUpItemUseOnFieldCallback: @ 80C938C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C93B4
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080C93C0
	ldr r1, _080C93B8
	ldr r0, _080C93BC
	str r0, [r1]
	adds r0, r2, 0
	bl unknown_ItemMenu_Confirm
	b _080C93CA
	.align 2, 0
_080C93B4: .4byte gTasks
_080C93B8: .4byte gUnknown_0300485C
_080C93BC: .4byte sub_80A5CC4
_080C93C0:
	ldr r0, _080C93D0
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
_080C93CA:
	pop {r0}
	bx r0
	.align 2, 0
_080C93D0: .4byte gUnknown_03005D00
	thumb_func_end SetUpItemUseOnFieldCallback

	thumb_func_start sub_80C9098
sub_80C9098: @ 80C93D4
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r1, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080C9408
	adds r0, r5, 0
	bl StringExpandPlaceholders
	cmp r4, 0
	bne _080C9410
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r2, _080C940C
	adds r0, r6, 0
	adds r1, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C941C
	.align 2, 0
_080C9408: .4byte gStringVar4
_080C940C: .4byte sub_80A5C48
_080C9410:
	ldr r2, _080C9424
	adds r0, r6, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C941C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9424: .4byte sub_80A5C9C
	thumb_func_end sub_80C9098

	thumb_func_start DisplayDadsAdviceCannotUseItemMessage
DisplayDadsAdviceCannotUseItemMessage: @ 80C9428
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080C943C
	bl sub_80C9098
	pop {r0}
	bx r0
	.align 2, 0
_080C943C: .4byte gOtherText_DadsAdvice
	thumb_func_end DisplayDadsAdviceCannotUseItemMessage

	thumb_func_start sub_80C9104
sub_80C9104: @ 80C9440
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080C9454
	bl sub_80C9098
	pop {r0}
	bx r0
	.align 2, 0
_080C9454: .4byte gOtherText_CantGetOffBike
	thumb_func_end sub_80C9104

	thumb_func_start CheckIfItemIsTMHMOrEvolutionStone
CheckIfItemIsTMHMOrEvolutionStone: @ 80C9458
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl ItemId_GetFieldFunc
	ldr r1, _080C9470
	cmp r0, r1
	bne _080C9474
	movs r0, 0x1
	b _080C948A
	.align 2, 0
_080C9470: .4byte ItemUseOutOfBattle_TMHM
_080C9474:
	adds r0, r4, 0
	bl ItemId_GetFieldFunc
	ldr r1, _080C9484
	cmp r0, r1
	beq _080C9488
	movs r0, 0
	b _080C948A
	.align 2, 0
_080C9484: .4byte ItemUseOutOfBattle_EvolutionStone
_080C9488:
	movs r0, 0x2
_080C948A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckIfItemIsTMHMOrEvolutionStone

	thumb_func_start sub_80C9154
sub_80C9154: @ 80C9490
	push {r4,lr}
	sub sp, 0x24
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C94C4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C94BC
	mov r1, sp
	ldr r0, _080C94C8
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, _080C94CC
	mov r0, sp
	movs r2, 0
	bl sub_80F890C
	adds r0, r4, 0
	bl DestroyTask
_080C94BC:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C94C4: .4byte gPaletteFade
_080C94C8: .4byte gScriptItemId
_080C94CC: .4byte sub_80A5D04
	thumb_func_end sub_80C9154

	thumb_func_start ItemUseOutOfBattle_Mail
ItemUseOutOfBattle_Mail: @ 80C94D0
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
	ldr r1, _080C9500
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C9504
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9500: .4byte gTasks
_080C9504: .4byte sub_80C9154
	thumb_func_end ItemUseOutOfBattle_Mail

	thumb_func_start ItemUseOutOfBattle_Bike
ItemUseOutOfBattle_Bike: @ 80C9508
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C9588
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9574
	adds r0, r4, 0
	bl MetatileBehavior_IsVerticalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9574
	adds r0, r4, 0
	bl MetatileBehavior_IsHorizontalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9574
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9574
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9590
_080C9574:
	ldr r0, _080C958C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r5, 0
	bl sub_80C9104
	b _080C95CA
	.align 2, 0
_080C9588: .4byte 0x0000082b
_080C958C: .4byte gTasks
_080C9590:
	bl sub_8053C44
	cmp r0, 0x1
	bne _080C95B8
	bl sub_80E5EF4
	lsls r0, 24
	cmp r0, 0
	bne _080C95B8
	ldr r1, _080C95B0
	ldr r0, _080C95B4
	str r0, [r1]
	adds r0, r5, 0
	bl SetUpItemUseOnFieldCallback
	b _080C95CA
	.align 2, 0
_080C95B0: .4byte gUnknown_03005D00
_080C95B4: .4byte ItemUseOnFieldCB_Bike
_080C95B8:
	ldr r0, _080C95D4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r5, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C95CA:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C95D4: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_Bike

	thumb_func_start ItemUseOnFieldCB_Bike
ItemUseOnFieldCB_Bike: @ 80C95D8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080C961C
	ldrh r0, [r4]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	cmp r0, 0
	bne _080C95F2
	movs r0, 0x2
	bl GetOnOffBike
_080C95F2:
	ldrh r0, [r4]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9606
	movs r0, 0x4
	bl GetOnOffBike
_080C9606:
	bl sub_8064E2C
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C961C: .4byte gScriptItemId
	thumb_func_end ItemUseOnFieldCB_Bike

	thumb_func_start CanFish
CanFish: @ 80C9620
	push {r4-r6,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080C96A8
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080C96A8
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080C9678
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _080C96A8
_080C9674:
	movs r0, 0x1
	b _080C96AA
_080C9678:
	adds r0, r5, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080C9698
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	beq _080C9674
_080C9698:
	lsls r0, r6, 24
	lsrs r0, 24
	bl MetatileBehavior_IsBridge
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9674
_080C96A8:
	movs r0, 0
_080C96AA:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CanFish

	thumb_func_start ItemUseOutOfBattle_Rod
ItemUseOutOfBattle_Rod: @ 80C96B4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CanFish
	cmp r0, 0x1
	bne _080C96D8
	ldr r1, _080C96D0
	ldr r0, _080C96D4
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080C96EA
	.align 2, 0
_080C96D0: .4byte gUnknown_03005D00
_080C96D4: .4byte ItemUseOnFieldCB_Rod
_080C96D8:
	ldr r0, _080C96F0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C96EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C96F0: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_Rod

	thumb_func_start ItemUseOnFieldCB_Rod
ItemUseOnFieldCB_Rod: @ 80C96F4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C9718
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 24
	bl StartFishing
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9718: .4byte gScriptItemId
	thumb_func_end ItemUseOnFieldCB_Rod

	thumb_func_start ItemUseOutOfBattle_Itemfinder
ItemUseOutOfBattle_Itemfinder: @ 80C971C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x27
	bl sav12_xor_increment
	ldr r1, _080C973C
	ldr r0, _080C9740
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C973C: .4byte gUnknown_03005D00
_080C9740: .4byte ItemUseOnFieldCB_Itemfinder
	thumb_func_end ItemUseOutOfBattle_Itemfinder

	thumb_func_start ItemUseOnFieldCB_Itemfinder
ItemUseOnFieldCB_Itemfinder: @ 80C9744
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C976C
	ldr r0, [r0, 0x4]
	adds r1, r4, 0
	bl ItemfinderCheckForHiddenItems
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9778
	ldr r0, _080C9770
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C9774
	str r0, [r1]
	b _080C9784
	.align 2, 0
_080C976C: .4byte gMapHeader
_080C9770: .4byte gTasks
_080C9774: .4byte sub_80C9458
_080C9778:
	ldr r1, _080C978C
	ldr r2, _080C9790
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9784:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C978C: .4byte gOtherText_NoResponse
_080C9790: .4byte sub_80C9520
	thumb_func_end ItemUseOnFieldCB_Itemfinder

	thumb_func_start sub_80C9458
sub_80C9458: @ 80C9794
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	ldr r0, _080C97E8
	mov r8, r0
	adds r4, r7, r0
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C9848
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	bne _080C983C
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_80C9908
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080C97F4
	ldr r1, _080C97EC
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80C997C
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _080C97F0
	str r1, [r0]
	b _080C9852
	.align 2, 0
_080C97E8: .4byte 0x03004b38
_080C97EC: .4byte gUnknown_083D61F0
_080C97F0: .4byte sub_80C99EC
_080C97F4:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	adds r3, r6, 0
	ldr r7, _080C9830
	movs r6, 0x3
_080C9804:
	adds r0, r1, r7
	adds r1, 0x1
	ldrb r0, [r0]
	cmp r2, r0
	bne _080C9814
	adds r0, r1, 0
	ands r0, r6
	strh r0, [r4, 0xA]
_080C9814:
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C9804
	ldr r1, _080C9834
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C9838
	str r1, [r0]
	movs r0, 0
	strh r0, [r4, 0x6]
	strh r0, [r4, 0x4]
	b _080C9852
	.align 2, 0
_080C9830: .4byte gUnknown_083D61F0
_080C9834: .4byte gTasks
_080C9838: .4byte sub_80C9A38
_080C983C:
	movs r0, 0x48
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C9848:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r4, 0x6]
_080C9852:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9458

	thumb_func_start sub_80C9520
sub_80C9520: @ 80C985C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8064E2C
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9520

	thumb_func_start ItemfinderCheckForHiddenItems
ItemfinderCheckForHiddenItems: @ 80C9884
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r1, _080C9954
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r3, 0
	mov r9, r4
	ldrb r0, [r5, 0x3]
	cmp r3, r0
	bge _080C9938
	subs r1, 0x5
	mov r8, r1
_080C98BC:
	lsls r3, 16
	asrs r1, r3, 16
	ldr r2, [r5, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r4, r0, 2
	adds r1, r4, r2
	ldrb r0, [r1, 0x5]
	adds r7, r3, 0
	cmp r0, 0x7
	bne _080C9928
	movs r2, 0x96
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C9928
	ldr r1, [r5, 0x10]
	adds r1, r4, r1
	ldrh r2, [r1]
	adds r2, 0x7
	mov r0, sp
	ldrh r0, [r0]
	subs r2, r0
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	mov r3, r9
	ldrh r1, [r3]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0xE0
	lsls r3, 11
	adds r2, r3
	lsrs r2, 16
	cmp r2, 0xE
	bhi _080C9928
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, r8
	blt _080C9928
	cmp r2, 0x5
	bgt _080C9928
	adds r0, r6, 0
	bl sub_80C9838
_080C9928:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r3, r0, 16
	asrs r0, 16
	ldrb r2, [r5, 0x3]
	cmp r0, r2
	blt _080C98BC
_080C9938:
	adds r0, r6, 0
	bl sub_80C9720
	ldr r0, _080C9954
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C9958
	movs r0, 0
	b _080C995A
	.align 2, 0
_080C9954: .4byte gTasks
_080C9958:
	movs r0, 0x1
_080C995A:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ItemfinderCheckForHiddenItems

	thumb_func_start sub_80C962C
sub_80C962C: @ 80C9968
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrb r2, [r0, 0x3]
	ldr r5, [r0, 0x10]
	movs r1, 0
	cmp r1, r2
	bge _080C99BC
	lsls r0, r3, 16
	asrs r6, r0, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	adds r3, r5, 0
_080C9986:
	ldrb r0, [r3, 0x5]
	cmp r0, 0x7
	bne _080C99B4
	ldrh r0, [r3]
	cmp r6, r0
	bne _080C99B4
	ldrh r0, [r3, 0x2]
	cmp r4, r0
	bne _080C99B4
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1, 0
	ldrh r3, [r3, 0xA]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C99BC
	movs r0, 0x1
	b _080C99BE
_080C99B4:
	adds r3, 0xC
	adds r1, 0x1
	cmp r1, r2
	blt _080C9986
_080C99BC:
	movs r0, 0
_080C99BE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C962C

	thumb_func_start sub_80C9688
sub_80C9688: @ 80C99C4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080C99EC
	cmp r0, 0x2
	bgt _080C99E2
	cmp r0, 0x1
	beq _080C9A00
	b _080C9A40
_080C99E2:
	cmp r0, 0x3
	beq _080C9A18
	cmp r0, 0x4
	beq _080C9A22
	b _080C9A40
_080C99EC:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	subs r0, 0x7
	adds r0, r6
	b _080C9A36
_080C9A00:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080C9A14
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	b _080C9A32
	.align 2, 0
_080C9A14: .4byte gMapHeader
_080C9A18:
	ldr r0, [r3]
	ldr r0, [r0]
	subs r0, 0x7
	adds r0, r5
	b _080C9A2C
_080C9A22:
	ldr r0, _080C9A3C
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x7
	subs r0, r5, r0
_080C9A2C:
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4, 0x4]
_080C9A32:
	adds r0, 0x7
	subs r0, r6, r0
_080C9A36:
	lsls r0, 16
	lsrs r2, r0, 16
	b _080C9A44
	.align 2, 0
_080C9A3C: .4byte gMapHeader
_080C9A40:
	movs r0, 0
	b _080C9A56
_080C9A44:
	ldr r0, [r3, 0x4]
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	bl sub_80C962C
	lsls r0, 24
	lsrs r0, 24
_080C9A56:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9688

	thumb_func_start sub_80C9720
sub_80C9720: @ 80C9A5C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080C9B70
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r0, [r1, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	adds r1, 0x7
	cmp r0, r1
	bgt _080C9B60
_080C9AAA:
	mov r5, sp
	ldrh r0, [r5, 0x2]
	subs r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	movs r6, 0x2
	ldrsh r0, [r5, r6]
	adds r0, 0x5
	lsls r3, 16
	mov r8, r3
	cmp r1, r0
	bgt _080C9B4A
	movs r0, 0x7
	str r0, [sp, 0x10]
	mov r1, r8
	asrs r1, 16
	mov r9, r1
	mov r10, r0
_080C9AD2:
	ldr r3, [sp, 0x10]
	cmp r3, r9
	bgt _080C9AF4
	ldr r5, [sp, 0x8]
	lsls r0, r5, 16
	asrs r0, 16
	cmp r9, r0
	bge _080C9AF4
	asrs r1, r2, 16
	cmp r10, r1
	bgt _080C9AF4
	ldr r6, [sp, 0xC]
	lsls r0, r6, 16
	asrs r0, 16
	lsls r7, r4, 16
	cmp r1, r0
	blt _080C9B32
_080C9AF4:
	mov r0, r8
	asrs r5, r0, 16
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8056BA0
	adds r7, r4, 0
	cmp r0, 0
	beq _080C9B32
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80C9688
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9B32
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r5, r1
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, r6, r2
	lsls r2, 16
	asrs r2, 16
	ldr r0, [sp, 0x4]
	bl sub_80C9838
_080C9B32:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	mov r3, sp
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	adds r0, 0x5
	cmp r1, r0
	ble _080C9AD2
_080C9B4A:
	movs r1, 0x80
	lsls r1, 9
	add r1, r8
	lsrs r3, r1, 16
	asrs r1, 16
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	adds r0, 0x7
	cmp r1, r0
	ble _080C9AAA
_080C9B60:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9B70: .4byte gMapHeader
	thumb_func_end sub_80C9720

	thumb_func_start sub_80C9838
sub_80C9838: @ 80C9B74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C9BA8
	adds r3, r1, r0
	movs r1, 0x4
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080C9BAC
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
	movs r0, 0x1
	strh r0, [r3, 0x4]
	b _080C9C36
	.align 2, 0
_080C9BA8: .4byte 0x03004b38
_080C9BAC:
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080C9BBC
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C9BBE
_080C9BBC:
	ldrh r4, [r3]
_080C9BBE:
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	ldrh r1, [r3, 0x2]
	mov r9, r1
	cmp r0, 0
	bge _080C9BD2
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
	b _080C9BD4
_080C9BD2:
	ldrh r2, [r3, 0x2]
_080C9BD4:
	lsls r1, r7, 16
	asrs r0, r1, 16
	cmp r0, 0
	bge _080C9BE4
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	b _080C9BE6
_080C9BE4:
	lsrs r6, r1, 16
_080C9BE6:
	mov r1, r12
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r1, 0
	bge _080C9BF8
	negs r0, r1
	lsls r0, 16
	b _080C9BFA
_080C9BF8:
	mov r0, r8
_080C9BFA:
	lsrs r5, r0, 16
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r2, r1, 16
	adds r4, r0, r2
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	adds r0, r1
	cmp r4, r0
	ble _080C9C1C
	strh r7, [r3]
	mov r1, r12
	strh r1, [r3, 0x2]
	b _080C9C36
_080C9C1C:
	cmp r4, r0
	bne _080C9C36
	cmp r2, r1
	bgt _080C9C30
	cmp r2, r1
	bne _080C9C36
	mov r1, r9
	lsls r0, r1, 16
	cmp r0, r8
	bge _080C9C36
_080C9C30:
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
_080C9C36:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9838

	thumb_func_start sub_80C9908
sub_80C9908: @ 80C9C44
	push {r4,r5,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bne _080C9C56
	cmp r1, 0
	beq _080C9CB0
_080C9C56:
	lsls r0, r2, 16
	asrs r2, r0, 16
	adds r5, r0, 0
	cmp r2, 0
	bge _080C9C68
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C9C6A
_080C9C68:
	lsrs r4, r5, 16
_080C9C6A:
	lsls r0, r1, 16
	asrs r2, r0, 16
	adds r1, r0, 0
	cmp r2, 0
	bge _080C9C7C
	negs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	b _080C9C7E
_080C9C7C:
	lsrs r3, r1, 16
_080C9C7E:
	lsls r0, r4, 16
	asrs r2, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r2, r0
	ble _080C9C96
	cmp r5, 0
	bge _080C9C92
	movs r0, 0x4
	b _080C9CB2
_080C9C92:
	movs r0, 0x2
	b _080C9CB2
_080C9C96:
	cmp r2, r0
	bge _080C9CA0
	cmp r1, 0
	blt _080C9CA8
	b _080C9CAC
_080C9CA0:
	cmp r2, r0
	bne _080C9CB0
	cmp r1, 0
	bge _080C9CAC
_080C9CA8:
	movs r0, 0x1
	b _080C9CB2
_080C9CAC:
	movs r0, 0x3
	b _080C9CB2
_080C9CB0:
	movs r0, 0
_080C9CB2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9908

	thumb_func_start sub_80C997C
sub_80C997C: @ 80C9CB8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _080C9D24
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnim
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl npc_sync_anim_pause_bits
	adds r0, r5, 0
	bl PlayerTurnInPlace
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D24: .4byte gMapObjects
	thumb_func_end sub_80C997C

	thumb_func_start sub_80C99EC
sub_80C99EC: @ 80C9D28
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9D68
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9D60
	ldr r1, _080C9D6C
	ldr r2, _080C9D70
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9D60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D68: .4byte gMapObjects
_080C9D6C: .4byte gOtherText_ItemfinderResponding
_080C9D70: .4byte sub_80C9520
	thumb_func_end sub_80C99EC

	thumb_func_start sub_80C9A38
sub_80C9A38: @ 80C9D74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C9DF0
	adds r4, r0, r1
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9DF4
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9DB4
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C9DEA
_080C9DB4:
	ldr r1, _080C9DF8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80C997C
	movs r0, 0x1
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080C9DEA
	ldr r1, _080C9DFC
	ldr r2, _080C9E00
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9DEA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9DF0: .4byte 0x03004b38
_080C9DF4: .4byte gMapObjects
_080C9DF8: .4byte gUnknown_083D61F0
_080C9DFC: .4byte gOtherText_ItemfinderFoundItem
_080C9E00: .4byte sub_80C9520
	thumb_func_end sub_80C9A38

	thumb_func_start ItemUseOutOfBattle_PokeblockCase
ItemUseOutOfBattle_PokeblockCase: @ 80C9E04
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9E30
	ldr r0, _080C9E2C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
	b _080C9E66
	.align 2, 0
_080C9E2C: .4byte gTasks
_080C9E30:
	ldr r0, _080C9E50
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080C9E54
	movs r0, 0
	bl sub_810BA7C
	adds r0, r4, 0
	bl unknown_ItemMenu_Confirm
	b _080C9E66
	.align 2, 0
_080C9E50: .4byte gTasks
_080C9E54:
	ldr r1, _080C9E6C
	ldr r0, _080C9E70
	str r0, [r1]
	movs r0, 0x1
	bl sub_810BA7C
	adds r0, r5, 0
	bl sub_80C9038
_080C9E66:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9E6C: .4byte gUnknown_0300485C
_080C9E70: .4byte sub_8080E28
	thumb_func_end ItemUseOutOfBattle_PokeblockCase

	thumb_func_start ItemUseOutOfBattle_CoinCase
ItemUseOutOfBattle_CoinCase: @ 80C9E74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080C9EC8
	bl GetCoins
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r4, _080C9ECC
	ldr r1, _080C9ED0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, _080C9ED4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080C9EDC
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r2, _080C9ED8
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9EE8
	.align 2, 0
_080C9EC8: .4byte gStringVar1
_080C9ECC: .4byte gStringVar4
_080C9ED0: .4byte gOtherText_Coins3
_080C9ED4: .4byte gTasks
_080C9ED8: .4byte sub_80A5C48
_080C9EDC:
	ldr r2, _080C9EF0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9EE8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9EF0: .4byte sub_80A5C9C
	thumb_func_end ItemUseOutOfBattle_CoinCase

	thumb_func_start sub_80C9BB8
sub_80C9BB8: @ 80C9EF4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C9F10
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C9F0C
	adds r0, r2, 0
	bl sub_80A5C48
_080C9F0C:
	pop {r0}
	bx r0
	.align 2, 0
_080C9F10: .4byte gMain
	thumb_func_end sub_80C9BB8

	thumb_func_start sub_80C9BD8
sub_80C9BD8: @ 80C9F14
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C9F30
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C9F2C
	adds r0, r2, 0
	bl sub_80A5C9C
_080C9F2C:
	pop {r0}
	bx r0
	.align 2, 0
_080C9F30: .4byte gMain
	thumb_func_end sub_80C9BD8

	thumb_func_start unref_sub_80C9BF8
unref_sub_80C9BF8: @ 80C9F34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C9F78
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080C9F88
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r4, _080C9F7C
	ldr r0, _080C9F80
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	ldr r2, _080C9F84
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9FA4
	.align 2, 0
_080C9F78: .4byte gTasks
_080C9F7C: .4byte gUnknown_083D61DC
_080C9F80: .4byte gScriptItemId
_080C9F84: .4byte sub_80C9BB8
_080C9F88:
	ldr r4, _080C9FAC
	ldr r0, _080C9FB0
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	ldr r2, _080C9FB4
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9FA4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9FAC: .4byte gUnknown_083D61DC
_080C9FB0: .4byte gScriptItemId
_080C9FB4: .4byte sub_80C9BD8
	thumb_func_end unref_sub_80C9BF8

	thumb_func_start sub_80C9C7C
sub_80C9C7C: @ 80C9FB8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPlayerFacingPlantedBerryTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CA020
	ldr r1, _080CA004
	ldr r0, _080CA008
	str r0, [r1]
	ldr r1, _080CA00C
	ldr r0, _080CA010
	str r0, [r1]
	ldr r1, _080CA014
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080CA018
	lsrs r1, r2, 16
	movs r3, 0
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	ldr r1, _080CA01C
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080CA030
	.align 2, 0
_080CA004: .4byte gUnknown_03005D00
_080CA008: .4byte sub_80C9D00
_080CA00C: .4byte gUnknown_0300485C
_080CA010: .4byte sub_80A5CC4
_080CA014: .4byte gTasks
_080CA018: .4byte c2_exit_to_overworld_2_switch
_080CA01C: .4byte sub_80A5B00
_080CA020:
	ldr r0, _080CA038
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
_080CA030:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA038: .4byte gScriptItemId
	thumb_func_end sub_80C9C7C

	thumb_func_start sub_80C9D00
sub_80C9D00: @ 80CA03C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080CA064
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	bl ScriptContext2_Enable
	ldr r0, _080CA068
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA064: .4byte gScriptItemId
_080CA068: .4byte gUnknown_081A1654
	thumb_func_end sub_80C9D00

	thumb_func_start ItemUseOutOfBattle_WailmerPail
ItemUseOutOfBattle_WailmerPail: @ 80CA06C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl WaterBerryTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CA094
	ldr r1, _080CA08C
	ldr r0, _080CA090
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080CA0A6
	.align 2, 0
_080CA08C: .4byte gUnknown_03005D00
_080CA090: .4byte sub_80C9D74
_080CA094:
	ldr r0, _080CA0AC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA0A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA0AC: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_WailmerPail

	thumb_func_start sub_80C9D74
sub_80C9D74: @ 80CA0B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	ldr r0, _080CA0D0
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA0D0: .4byte gUnknown_081A168F
	thumb_func_end sub_80C9D74

	thumb_func_start sub_80C9D98
sub_80C9D98: @ 80CA0D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA0E8
	movs r1, 0
	strb r1, [r2]
	bl unknown_ItemMenu_Confirm
	pop {r0}
	bx r0
	.align 2, 0
_080CA0E8: .4byte gUnknown_02038561
	thumb_func_end sub_80C9D98

	thumb_func_start ItemUseOutOfBattle_Medicine
ItemUseOutOfBattle_Medicine: @ 80CA0EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA100
	ldr r1, _080CA104
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA100: .4byte gUnknown_03004AE4
_080CA104: .4byte sub_806FE2C
	thumb_func_end ItemUseOutOfBattle_Medicine

	thumb_func_start ItemUseOutOfBattle_SacredAsh
ItemUseOutOfBattle_SacredAsh: @ 80CA108
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080CA118
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	b _080CA122
	.align 2, 0
_080CA118: .4byte gUnknown_03005CE0
_080CA11C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080CA122:
	cmp r5, 0x5
	bhi _080CA14C
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080CA164
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080CA11C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080CA11C
	ldr r0, _080CA168
	strb r5, [r0]
_080CA14C:
	ldr r1, _080CA16C
	ldr r0, _080CA170
	str r0, [r1]
	ldr r1, _080CA174
	movs r0, 0x4
	strb r0, [r1]
	adds r0, r6, 0
	bl unknown_ItemMenu_Confirm
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA164: .4byte gPlayerParty
_080CA168: .4byte gUnknown_03005CE0
_080CA16C: .4byte gUnknown_03004AE4
_080CA170: .4byte sub_8070048
_080CA174: .4byte gUnknown_02038561
	thumb_func_end ItemUseOutOfBattle_SacredAsh

	thumb_func_start ItemUseOutOfBattle_PPRecovery
ItemUseOutOfBattle_PPRecovery: @ 80CA178
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA18C
	ldr r1, _080CA190
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA18C: .4byte gUnknown_03004AE4
_080CA190: .4byte dp05_ether
	thumb_func_end ItemUseOutOfBattle_PPRecovery

	thumb_func_start ItemUseOutOfBattle_PPUp
ItemUseOutOfBattle_PPUp: @ 80CA194
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA1A8
	ldr r1, _080CA1AC
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA1A8: .4byte gUnknown_03004AE4
_080CA1AC: .4byte dp05_pp_up
	thumb_func_end ItemUseOutOfBattle_PPUp

	thumb_func_start ItemUseOutOfBattle_RareCandy
ItemUseOutOfBattle_RareCandy: @ 80CA1B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA1C4
	ldr r1, _080CA1C8
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA1C4: .4byte gUnknown_03004AE4
_080CA1C8: .4byte sub_8070680
	thumb_func_end ItemUseOutOfBattle_RareCandy

	thumb_func_start ItemUseOutOfBattle_TMHM
ItemUseOutOfBattle_TMHM: @ 80CA1CC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080CA1F8
	ldrh r1, [r0]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _080CA204
	ldr r1, _080CA1FC
	ldr r2, _080CA200
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA210
	.align 2, 0
_080CA1F8: .4byte gScriptItemId
_080CA1FC: .4byte gOtherText_BootedHM
_080CA200: .4byte sub_80C9EE4
_080CA204:
	ldr r1, _080CA218
	ldr r2, _080CA21C
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA218: .4byte gOtherText_BootedTM
_080CA21C: .4byte sub_80C9EE4
	thumb_func_end ItemUseOutOfBattle_TMHM

	thumb_func_start sub_80C9EE4
sub_80C9EE4: @ 80CA220
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	bl PlaySE
	ldr r1, _080CA244
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CA248
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA244: .4byte gTasks
_080CA248: .4byte sub_80C9F10
	thumb_func_end sub_80C9EE4

	thumb_func_start sub_80C9F10
sub_80C9F10: @ 80CA24C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080CA2A0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CA266
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080CA298
_080CA266:
	ldr r4, _080CA2A4
	ldr r0, _080CA2A8
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080CA2AC
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _080CA2B0
	ldr r1, _080CA2B4
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080CA2B8
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA298:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA2A0: .4byte gMain
_080CA2A4: .4byte gStringVar1
_080CA2A8: .4byte gScriptItemId
_080CA2AC: .4byte gMoveNames
_080CA2B0: .4byte gStringVar4
_080CA2B4: .4byte gOtherText_ContainsMove
_080CA2B8: .4byte sub_80C9F80
	thumb_func_end sub_80C9F10

	thumb_func_start sub_80C9F80
sub_80C9F80: @ 80CA2BC
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _080CA2F4
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x8
	movs r3, 0x5
	bl sub_80A3FA0
	ldr r1, _080CA2F8
	adds r0, r4, 0
	bl sub_80F914C
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA2F4: .4byte 0x020219cc
_080CA2F8: .4byte gUnknown_083D61F4
	thumb_func_end sub_80C9F80

	thumb_func_start sub_80C9FC0
sub_80C9FC0: @ 80CA2FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA310
	ldr r1, _080CA314
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA310: .4byte gUnknown_03004AE4
_080CA314: .4byte sub_806F06C
	thumb_func_end sub_80C9FC0

	thumb_func_start sub_80C9FDC
sub_80C9FDC: @ 80CA318
	push {r4,lr}
	ldr r4, _080CA340
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	bl sub_80A3E0C
	ldrh r0, [r4]
	ldr r1, _080CA344
	bl CopyItemName
	ldr r0, _080CA348
	ldr r1, _080CA34C
	bl StringExpandPlaceholders
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA340: .4byte gScriptItemId
_080CA344: .4byte gStringVar2
_080CA348: .4byte gStringVar4
_080CA34C: .4byte gOtherText_UsedItem
	thumb_func_end sub_80C9FDC

	thumb_func_start ItemUseOutOfBattle_Repel
ItemUseOutOfBattle_Repel: @ 80CA350
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _080CA38C
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080CA39C
	ldr r0, _080CA390
	ldrh r0, [r0]
	bl ItemId_GetHoldEffectParam
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl VarSet
	bl sub_80C9FDC
	ldr r1, _080CA394
	ldr r2, _080CA398
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA3A8
	.align 2, 0
_080CA38C: .4byte 0x00004021
_080CA390: .4byte gScriptItemId
_080CA394: .4byte gStringVar4
_080CA398: .4byte sub_80A5C48
_080CA39C:
	ldr r1, _080CA3B0
	ldr r2, _080CA3B4
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA3A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA3B0: .4byte gOtherText_RepelLingers
_080CA3B4: .4byte sub_80A5C48
	thumb_func_end ItemUseOutOfBattle_Repel

	thumb_func_start sub_80CA07C
sub_80CA07C: @ 80CA3B8
	push {lr}
	bl sub_80A3E0C
	ldr r0, _080CA3CC
	ldrh r0, [r0]
	ldr r1, _080CA3D0
	bl CopyItemName
	pop {r0}
	bx r0
	.align 2, 0
_080CA3CC: .4byte gScriptItemId
_080CA3D0: .4byte gStringVar2
	thumb_func_end sub_80CA07C

	thumb_func_start sub_80CA098
sub_80CA098: @ 80CA3D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA40C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080CA404
	movs r0, 0x75
	bl PlaySE
	ldr r1, _080CA410
	ldr r2, _080CA414
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA404:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA40C: .4byte gTasks
_080CA410: .4byte gStringVar4
_080CA414: .4byte sub_80A5C48
	thumb_func_end sub_80CA098

	thumb_func_start ItemUseOutOfBattle_BlackWhiteFlute
ItemUseOutOfBattle_BlackWhiteFlute: @ 80CA418
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _080CA448
	ldrh r0, [r0]
	cmp r0, 0x2B
	bne _080CA460
	ldr r0, _080CA44C
	bl FlagSet
	ldr r0, _080CA450
	bl FlagReset
	bl sub_80CA07C
	ldr r0, _080CA454
	ldr r1, _080CA458
	bl StringExpandPlaceholders
	ldr r1, _080CA45C
	lsls r0, r4, 2
	adds r0, r4
	b _080CA482
	.align 2, 0
_080CA448: .4byte gScriptItemId
_080CA44C: .4byte 0x0000084d
_080CA450: .4byte 0x0000084e
_080CA454: .4byte gStringVar4
_080CA458: .4byte gOtherText_UsedFlute
_080CA45C: .4byte gTasks
_080CA460:
	cmp r0, 0x2A
	bne _080CA48E
	ldr r0, _080CA494
	bl FlagSet
	ldr r0, _080CA498
	bl FlagReset
	bl sub_80CA07C
	ldr r0, _080CA49C
	ldr r1, _080CA4A0
	bl StringExpandPlaceholders
	ldr r1, _080CA4A4
	lsls r0, r5, 2
	adds r0, r5
_080CA482:
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CA4A8
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x26]
_080CA48E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA494: .4byte 0x0000084e
_080CA498: .4byte 0x0000084d
_080CA49C: .4byte gStringVar4
_080CA4A0: .4byte gOtherText_UsedRepel
_080CA4A4: .4byte gTasks
_080CA4A8: .4byte sub_80CA098
	thumb_func_end ItemUseOutOfBattle_BlackWhiteFlute

	thumb_func_start task08_080A1C44
task08_080A1C44: @ 80CA4AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl player_avatar_init_params_reset
	bl sub_80878A8
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task08_080A1C44

	thumb_func_start sub_80CA18C
sub_80CA18C: @ 80CA4C8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8053014
	bl sub_80C9FDC
	ldr r1, _080CA4F8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080CA4FC
	ldr r2, _080CA500
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA4F8: .4byte gTasks
_080CA4FC: .4byte gStringVar4
_080CA500: .4byte task08_080A1C44
	thumb_func_end sub_80CA18C

	thumb_func_start sub_80CA1C8
sub_80CA1C8: @ 80CA504
	push {lr}
	ldr r0, _080CA514
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _080CA518
	movs r0, 0
	b _080CA51A
	.align 2, 0
_080CA514: .4byte gMapHeader
_080CA518:
	movs r0, 0x1
_080CA51A:
	pop {r1}
	bx r1
	thumb_func_end sub_80CA1C8

	thumb_func_start ItemUseOutOfBattle_EscapeRope
ItemUseOutOfBattle_EscapeRope: @ 80CA520
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80CA1C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CA548
	ldr r1, _080CA540
	ldr r0, _080CA544
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080CA55A
	.align 2, 0
_080CA540: .4byte gUnknown_03005D00
_080CA544: .4byte sub_80CA18C
_080CA548:
	ldr r0, _080CA560
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA55A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA560: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EscapeRope

	thumb_func_start ItemUseOutOfBattle_EvolutionStone
ItemUseOutOfBattle_EvolutionStone: @ 80CA564
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA578
	ldr r1, _080CA57C
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA578: .4byte gUnknown_03004AE4
_080CA57C: .4byte sub_8070DBC
	thumb_func_end ItemUseOutOfBattle_EvolutionStone

	thumb_func_start ItemUseInBattle_PokeBall
ItemUseInBattle_PokeBall: @ 80CA580
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl PlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	bne _080CA5A8
	ldr r0, _080CA5A4
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r4, 0
	bl sub_80A7094
	b _080CA5C0
	.align 2, 0
_080CA5A4: .4byte gScriptItemId
_080CA5A8:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r1, _080CA5C8
	ldr r2, _080CA5CC
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA5C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA5C8: .4byte gOtherText_BoxIsFull
_080CA5CC: .4byte sub_80A5C48
	thumb_func_end ItemUseInBattle_PokeBall

	thumb_func_start sub_80CA294
sub_80CA294: @ 80CA5D0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CA5F4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CA5EA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080CA5F0
_080CA5EA:
	adds r0, r2, 0
	bl sub_80A7094
_080CA5F0:
	pop {r0}
	bx r0
	.align 2, 0
_080CA5F4: .4byte gMain
	thumb_func_end sub_80CA294

	thumb_func_start sub_80CA2BC
sub_80CA2BC: @ 80CA5F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080CA640
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080CA638
	movs r0, 0x1
	bl PlaySE
	ldr r4, _080CA644
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	ldrh r0, [r4]
	bl sub_803F378
	adds r1, r0, 0
	ldr r2, _080CA648
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA638:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA640: .4byte gTasks
_080CA644: .4byte gScriptItemId
_080CA648: .4byte sub_80CA294
	thumb_func_end sub_80CA2BC

	thumb_func_start ItemUseInBattle_StatIncrease
ItemUseInBattle_StatIncrease: @ 80CA64C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080CA698
	ldr r0, _080CA69C
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CA6A0
	adds r0, r1
	ldr r1, _080CA6A4
	ldrh r1, [r1]
	lsls r4, 24
	lsrs r4, 24
	adds r2, r4, 0
	movs r3, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080CA6B0
	ldr r1, _080CA6A8
	ldr r2, _080CA6AC
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA6C0
	.align 2, 0
_080CA698: .4byte gUnknown_02024A6A
_080CA69C: .4byte gUnknown_02024E6C
_080CA6A0: .4byte gPlayerParty
_080CA6A4: .4byte gScriptItemId
_080CA6A8: .4byte gOtherText_WontHaveAnyEffect
_080CA6AC: .4byte sub_80A5C48
_080CA6B0:
	ldr r0, _080CA6C8
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080CA6CC
	str r0, [r1]
	strh r2, [r1, 0x26]
_080CA6C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA6C8: .4byte gTasks
_080CA6CC: .4byte sub_80CA2BC
	thumb_func_end ItemUseInBattle_StatIncrease

	thumb_func_start sub_80CA394
sub_80CA394: @ 80CA6D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA6F8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CA6F0
	bl sub_8094E4C
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_080CA6F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA6F8: .4byte gPaletteFade
	thumb_func_end sub_80CA394

	thumb_func_start sub_80CA3C0
sub_80CA3C0: @ 80CA6FC
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA728
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080CA72C
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080CA728: .4byte gTasks
_080CA72C: .4byte sub_80CA394
	thumb_func_end sub_80CA3C0

	thumb_func_start ItemUseInBattle_Medicine
ItemUseInBattle_Medicine: @ 80CA730
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA744
	ldr r1, _080CA748
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA744: .4byte gUnknown_03004AE4
_080CA748: .4byte sub_806FE2C
	thumb_func_end ItemUseInBattle_Medicine

	thumb_func_start unref_sub_80CA410
unref_sub_80CA410: @ 80CA74C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA760
	ldr r1, _080CA764
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA760: .4byte gUnknown_03004AE4
_080CA764: .4byte sub_8070048
	thumb_func_end unref_sub_80CA410

	thumb_func_start ItemUseInBattle_PPRecovery
ItemUseInBattle_PPRecovery: @ 80CA768
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA77C
	ldr r1, _080CA780
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA77C: .4byte gUnknown_03004AE4
_080CA780: .4byte dp05_ether
	thumb_func_end ItemUseInBattle_PPRecovery

	thumb_func_start unref_sub_80CA448
unref_sub_80CA448: @ 80CA784
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r4, _080CA7D0
	ldrh r1, [r4]
	movs r0, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	bne _080CA7E8
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r0, _080CA7D4
	ldr r1, _080CA7D8
	bl GetMonNickname
	ldr r4, _080CA7DC
	ldr r1, _080CA7E0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080CA7E4
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA7F4
	.align 2, 0
_080CA7D0: .4byte gScriptItemId
_080CA7D4: .4byte gPlayerParty
_080CA7D8: .4byte gStringVar1
_080CA7DC: .4byte gStringVar4
_080CA7E0: .4byte gOtherText_SnapConfusion
_080CA7E4: .4byte sub_80A7094
_080CA7E8:
	ldr r1, _080CA7FC
	ldr r2, _080CA800
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA7F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA7FC: .4byte gOtherText_WontHaveAnyEffect
_080CA800: .4byte sub_80A5C48
	thumb_func_end unref_sub_80CA448

	thumb_func_start ItemUseInBattle_Escape
ItemUseInBattle_Escape: @ 80CA804
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080CA834
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080CA840
	bl sub_80C9FDC
	ldr r1, _080CA838
	ldr r2, _080CA83C
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA852
	.align 2, 0
_080CA834: .4byte gUnknown_020239F8
_080CA838: .4byte gStringVar4
_080CA83C: .4byte sub_80A7094
_080CA840:
	ldr r0, _080CA858
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA852:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA858: .4byte gTasks
	thumb_func_end ItemUseInBattle_Escape

	thumb_func_start ItemUseOutOfBattle_EnigmaBerry
ItemUseOutOfBattle_EnigmaBerry: @ 80CA85C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA880
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x14
	bls _080CA876
	b _080CA968
_080CA876:
	lsls r0, 2
	ldr r1, _080CA884
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA880: .4byte gScriptItemId
_080CA884: .4byte _080CA888
	.align 2, 0
_080CA888:
	.4byte _080CA914
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA968
	.4byte _080CA968
	.4byte _080CA8F8
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA8DC
	.4byte _080CA968
	.4byte _080CA930
	.4byte _080CA930
	.4byte _080CA94C
_080CA8DC:
	ldr r0, _080CA8F4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_Medicine
	b _080CA97C
	.align 2, 0
_080CA8F4: .4byte gTasks
_080CA8F8:
	ldr r0, _080CA910
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_SacredAsh
	b _080CA97C
	.align 2, 0
_080CA910: .4byte gTasks
_080CA914:
	ldr r0, _080CA92C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_RareCandy
	b _080CA97C
	.align 2, 0
_080CA92C: .4byte gTasks
_080CA930:
	ldr r0, _080CA948
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_PPUp
	b _080CA97C
	.align 2, 0
_080CA948: .4byte gTasks
_080CA94C:
	ldr r0, _080CA964
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_PPRecovery
	b _080CA97C
	.align 2, 0
_080CA964: .4byte gTasks
_080CA968:
	ldr r0, _080CA984
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x4
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_CannotUse
_080CA97C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA984: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EnigmaBerry

	thumb_func_start ItemUseInBattle_EnigmaBerry
ItemUseInBattle_EnigmaBerry: @ 80CA988
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA9A8
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _080CAA20
	lsls r0, 2
	ldr r1, _080CA9AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA9A8: .4byte gScriptItemId
_080CA9AC: .4byte _080CA9B0
	.align 2, 0
_080CA9B0:
	.4byte _080CAA08
	.4byte _080CAA20
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA10
	.4byte _080CAA20
	.4byte _080CAA10
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA20
	.4byte _080CAA18
_080CAA08:
	adds r0, r4, 0
	bl ItemUseInBattle_StatIncrease
	b _080CAA26
_080CAA10:
	adds r0, r4, 0
	bl ItemUseInBattle_Medicine
	b _080CAA26
_080CAA18:
	adds r0, r4, 0
	bl ItemUseInBattle_PPRecovery
	b _080CAA26
_080CAA20:
	adds r0, r4, 0
	bl ItemUseOutOfBattle_CannotUse
_080CAA26:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemUseInBattle_EnigmaBerry

	thumb_func_start ItemUseOutOfBattle_CannotUse
ItemUseOutOfBattle_CannotUse: @ 80CAA2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CAA48
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0xC]
	bl DisplayDadsAdviceCannotUseItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_080CAA48: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_CannotUse

	.align 2, 0 @ Don't pad with nop.
