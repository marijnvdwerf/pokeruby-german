	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CopyItemName
CopyItemName: @ 80A9374
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _080A939C
	movs r0, 0x2B
	bl GetBerryInfo
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _080A9398
	adds r0, r4, 0
	bl StringAppend
	b _080A93A8
	.align 2, 0
_080A9398: .4byte gOtherText_Berry2
_080A939C:
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
_080A93A8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CopyItemName

	thumb_func_start CountUsedBagPocketSlots
CountUsedBagPocketSlots: @ 80A93B0
	push {lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _080A93D4
	lsrs r0, 21
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _080A93E2
	ldr r3, [r0]
_080A93C4:
	lsls r0, r2, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A93D8
	lsls r0, r2, 24
	asrs r0, 24
	b _080A93E6
	.align 2, 0
_080A93D4: .4byte gBagPockets
_080A93D8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _080A93C4
_080A93E2:
	movs r0, 0x1
	negs r0, r0
_080A93E6:
	pop {r1}
	bx r1
	thumb_func_end CountUsedBagPocketSlots

	thumb_func_start IsBagPocketNonEmpty
IsBagPocketNonEmpty: @ 80A93EC
	push {lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _080A9410
	lsrs r0, 21
	subs r0, 0x8
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _080A941E
	ldr r3, [r0]
_080A9402:
	lsls r0, r2, 2
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080A9414
	movs r0, 0x1
	b _080A9420
	.align 2, 0
_080A9410: .4byte gBagPockets
_080A9414:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _080A9402
_080A941E:
	movs r0, 0
_080A9420:
	pop {r1}
	bx r1
	thumb_func_end IsBagPocketNonEmpty

	thumb_func_start CheckBagHasItem
CheckBagHasItem: @ 80A9424
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r5, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	bne _080A9440
	b _080A9486
_080A943C:
	movs r0, 0x1
	b _080A9488
_080A9440:
	adds r0, r5, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	movs r3, 0
	ldr r6, _080A9490
	lsrs r2, r0, 21
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _080A9486
	adds r7, r6, 0
_080A945A:
	adds r0, r2, r7
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r5
	bne _080A9478
	ldrh r0, [r1, 0x2]
	cmp r0, r4
	bcs _080A943C
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080A943C
_080A9478:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _080A945A
_080A9486:
	movs r0, 0
_080A9488:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9490: .4byte gBagPockets
	thumb_func_end CheckBagHasItem

	thumb_func_start CheckBagHasSpace
CheckBagHasSpace: @ 80A9494
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r6, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _080A9558
	adds r0, r6, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r5, _080A955C
	cmp r1, 0x3
	beq _080A94C6
	movs r5, 0x63
_080A94C6:
	movs r3, 0
	ldr r0, _080A9560
	mov r8, r0
	lsls r2, r1, 3
	adds r0, r2, r0
	mov r12, r8
	mov r9, r2
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _080A951A
	mov r10, r12
	subs r0, r1, 0x2
	lsls r0, 24
	lsrs r7, r0, 24
_080A94E2:
	mov r1, r10
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r6
	bne _080A950A
	ldrh r1, [r1, 0x2]
	adds r0, r1, r4
	cmp r0, r5
	ble _080A9564
	cmp r7, 0x1
	bls _080A9558
	subs r0, r5, r1
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _080A9564
_080A950A:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	mov r1, r8
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _080A94E2
_080A951A:
	cmp r4, 0
	beq _080A9564
	movs r3, 0
	mov r6, r12
	mov r2, r9
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _080A9554
	adds r7, r6, 0
_080A952E:
	adds r0, r2, r7
	ldr r1, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A9546
	cmp r4, r5
	bls _080A9564
	subs r0, r4, r5
	lsls r0, 16
	lsrs r4, r0, 16
_080A9546:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, r6
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _080A952E
_080A9554:
	cmp r4, 0
	beq _080A9564
_080A9558:
	movs r0, 0
	b _080A9566
	.align 2, 0
_080A955C: .4byte 0x000003e7
_080A9560: .4byte gBagPockets
_080A9564:
	movs r0, 0x1
_080A9566:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckBagHasSpace

	thumb_func_start AddBagItem
AddBagItem: @ 80A9574
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x100
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r4, r1, 16
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _080A9660
	mov r0, r8
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080A9648
	lsls r0, r6, 3
	adds r5, r0, r1
	ldr r1, [r5]
	ldrb r2, [r5, 0x4]
	lsls r2, 2
	mov r0, sp
	bl memcpy
	ldr r7, _080A964C
	cmp r6, 0x3
	beq _080A95B8
	movs r7, 0x63
_080A95B8:
	movs r1, 0
	ldrb r0, [r5, 0x4]
	cmp r1, r0
	bcs _080A9602
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
_080A95C8:
	lsls r0, r1, 2
	mov r2, sp
	adds r3, r2, r0
	ldrh r0, [r3]
	cmp r0, r8
	bne _080A95F6
	ldrh r2, [r3, 0x2]
	adds r0, r2, r4
	cmp r0, r7
	ble _080A9650
	mov r0, r12
	cmp r0, 0x1
	bls _080A9660
	subs r0, r7, r2
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	strh r7, [r3, 0x2]
	ldr r2, _080A9648
	mov r9, r2
	lsls r3, r6, 3
	cmp r4, 0
	beq _080A9666
_080A95F6:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r0, [r5, 0x4]
	cmp r1, r0
	bcc _080A95C8
_080A9602:
	ldr r2, _080A9648
	mov r9, r2
	lsls r3, r6, 3
	cmp r4, 0
	beq _080A9666
	movs r1, 0
	adds r0, r3, r2
	ldrb r0, [r0, 0x4]
	cmp r1, r0
	bcs _080A9642
	mov r6, r9
	adds r5, r3, r6
_080A961A:
	lsls r0, r1, 2
	mov r6, sp
	adds r2, r6, r0
	ldrh r0, [r2]
	cmp r0, 0
	bne _080A9636
	mov r0, r8
	strh r0, [r2]
	cmp r4, r7
	bls _080A9664
	subs r0, r4, r7
	lsls r0, 16
	lsrs r4, r0, 16
	strh r7, [r2, 0x2]
_080A9636:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r2, [r5, 0x4]
	cmp r1, r2
	bcc _080A961A
_080A9642:
	cmp r4, 0
	beq _080A9666
	b _080A9660
	.align 2, 0
_080A9648: .4byte gBagPockets
_080A964C: .4byte 0x000003e7
_080A9650:
	strh r0, [r3, 0x2]
	ldr r0, _080A965C
	lsls r1, r6, 3
	adds r1, r0
	b _080A966A
	.align 2, 0
_080A965C: .4byte gBagPockets
_080A9660:
	movs r0, 0
	b _080A9678
_080A9664:
	strh r4, [r2, 0x2]
_080A9666:
	mov r6, r9
	adds r1, r3, r6
_080A966A:
	ldr r0, [r1]
	ldrb r2, [r1, 0x4]
	lsls r2, 2
	mov r1, sp
	bl memcpy
	movs r0, 0x1
_080A9678:
	add sp, 0x100
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end AddBagItem

	thumb_func_start RemoveBagItem
RemoveBagItem: @ 80A9688
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	movs r7, 0
	adds r0, r6, 0
	bl ItemId_GetPocket
	lsls r0, 24
	cmp r0, 0
	beq _080A96EE
	cmp r6, 0
	beq _080A96EE
	adds r0, r6, 0
	bl ItemId_GetPocket
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r5, 0
	ldr r1, _080A96F4
	lsls r2, r0, 3
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r5, r0
	bcs _080A96EA
	mov r8, r1
_080A96C6:
	mov r0, r8
	adds r3, r2, r0
	ldr r0, [r3]
	lsls r1, r5, 2
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r6
	bne _080A96DE
	ldrh r0, [r1, 0x2]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
_080A96DE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r3, [r3, 0x4]
	cmp r5, r3
	bcc _080A96C6
_080A96EA:
	cmp r7, r4
	bcs _080A96F8
_080A96EE:
	movs r0, 0
	b _080A97B4
	.align 2, 0
_080A96F4: .4byte gBagPockets
_080A96F8:
	ldr r0, _080A972C
	mov r2, r12
	lsls r1, r2, 3
	adds r5, r1, r0
	ldr r2, _080A9730
	ldrb r3, [r5, 0x4]
	mov r8, r0
	adds r7, r1, 0
	ldrb r0, [r2]
	cmp r3, r0
	bls _080A9756
	ldrb r0, [r2]
	ldr r1, [r5]
	lsls r0, 2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r6
	bne _080A9756
	ldrh r0, [r1, 0x2]
	cmp r0, r4
	bcc _080A9734
	subs r0, r4
	strh r0, [r1, 0x2]
	movs r4, 0
	b _080A973E
	.align 2, 0
_080A972C: .4byte gBagPockets
_080A9730: .4byte gUnknown_02038560
_080A9734:
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	strh r0, [r1, 0x2]
_080A973E:
	mov r1, r8
	adds r0, r7, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080A9752
	strh r0, [r1]
_080A9752:
	cmp r4, 0
	beq _080A97B2
_080A9756:
	movs r5, 0
	adds r1, r7, 0
	mov r2, r8
	adds r0, r1, r2
	ldrb r2, [r0, 0x4]
	cmp r5, r2
	bcs _080A97B2
	mov r12, r8
	adds r3, r0, 0
_080A9768:
	mov r2, r12
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r6
	bne _080A97A0
	ldrh r0, [r2, 0x2]
	cmp r0, r4
	bcc _080A9786
	subs r0, r4
	strh r0, [r2, 0x2]
	movs r4, 0
	b _080A9790
_080A9786:
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0
	strh r0, [r2, 0x2]
_080A9790:
	ldr r0, [r3]
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080A979C
	strh r0, [r1]
_080A979C:
	cmp r4, 0
	beq _080A97B2
_080A97A0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r1, r7, 0
	mov r2, r8
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r5, r0
	bcc _080A9768
_080A97B2:
	movs r0, 0x1
_080A97B4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end RemoveBagItem

	thumb_func_start GetPocketByItemId
GetPocketByItemId: @ 80A97C0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl ItemId_GetPocket
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetPocketByItemId

	thumb_func_start ClearItemSlots
ClearItemSlots: @ 80A97D4
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	movs r2, 0
	lsrs r1, 24
	cmp r2, r1
	bcs _080A97F6
	movs r3, 0
_080A97E4:
	lsls r0, r2, 2
	adds r0, r4
	strh r3, [r0]
	strh r3, [r0, 0x2]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r1
	bcc _080A97E4
_080A97F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ClearItemSlots

	thumb_func_start FindFreePCItemSlot
FindFreePCItemSlot: @ 80A97FC
	push {lr}
	movs r1, 0
	ldr r3, _080A981C
	movs r2, 0x93
	lsls r2, 3
_080A9806:
	lsls r0, r1, 24
	asrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r3
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A9820
	adds r0, r1, 0
	b _080A9830
	.align 2, 0
_080A981C: .4byte gSaveBlock1
_080A9820:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r0, 24
	cmp r0, 0x31
	ble _080A9806
	movs r0, 0x1
	negs r0, r0
_080A9830:
	pop {r1}
	bx r1
	thumb_func_end FindFreePCItemSlot

	thumb_func_start CountUsedPCItemSlots
CountUsedPCItemSlots: @ 80A9834
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _080A9864
	movs r3, 0x93
	lsls r3, 3
_080A9840:
	lsls r0, r1, 2
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0
	beq _080A9852
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080A9852:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bls _080A9840
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9864: .4byte gSaveBlock1
	thumb_func_end CountUsedPCItemSlots

	thumb_func_start CheckPCHasItem
CheckPCHasItem: @ 80A9868
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	ldr r7, _080A9894
	movs r6, 0x93
	lsls r6, 3
	ldr r5, _080A9898
_080A987C:
	lsls r0, r3, 2
	adds r2, r0, r7
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r4
	bne _080A989C
	adds r0, r2, r5
	ldrh r0, [r0]
	cmp r0, r1
	bcc _080A989C
	movs r0, 0x1
	b _080A98A8
	.align 2, 0
_080A9894: .4byte gSaveBlock1
_080A9898: .4byte 0x0000049a
_080A989C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x31
	bls _080A987C
	movs r0, 0
_080A98A8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPCHasItem

	thumb_func_start AddPCItem
AddPCItem: @ 80A98B0
	push {r4-r7,lr}
	sub sp, 0xC8
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _080A9914
	mov r0, sp
	movs r2, 0xC8
	bl memcpy
	movs r5, 0
	ldr r0, _080A9918
	adds r7, r0, 0
_080A98CC:
	lsls r0, r5, 2
	mov r1, sp
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r6
	bne _080A98F0
	ldrh r1, [r2, 0x2]
	adds r0, r1, r4
	ldr r3, _080A991C
	cmp r0, r3
	ble _080A9920
	adds r0, r4, r7
	adds r0, r1, r0
	lsls r0, 16
	lsrs r4, r0, 16
	strh r3, [r2, 0x2]
	cmp r4, 0
	beq _080A992C
_080A98F0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x31
	bls _080A98CC
	cmp r4, 0
	beq _080A992C
	bl FindFreePCItemSlot
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080A9924
	movs r0, 0
	b _080A9938
	.align 2, 0
_080A9914: .4byte 0x02025bcc
_080A9918: .4byte 0x0000fc19
_080A991C: .4byte 0x000003e7
_080A9920:
	strh r0, [r2, 0x2]
	b _080A992C
_080A9924:
	lsls r0, r1, 2
	add r0, sp
	strh r6, [r0]
	strh r4, [r0, 0x2]
_080A992C:
	ldr r0, _080A9940
	mov r1, sp
	movs r2, 0xC8
	bl memcpy
	movs r0, 0x1
_080A9938:
	add sp, 0xC8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A9940: .4byte 0x02025bcc
	thumb_func_end AddPCItem

	thumb_func_start RemovePCItem
RemovePCItem: @ 80A9944
	push {lr}
	lsls r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080A9974
	lsrs r0, 22
	adds r3, r0, r2
	ldr r0, _080A9978
	adds r2, r3, r0
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	bne _080A9970
	movs r2, 0x93
	lsls r2, 3
	adds r0, r3, r2
	strh r1, [r0]
	bl CompactPCItems
_080A9970:
	pop {r0}
	bx r0
	.align 2, 0
_080A9974: .4byte gSaveBlock1
_080A9978: .4byte 0x0000049a
	thumb_func_end RemovePCItem

	thumb_func_start CompactPCItems
CompactPCItems: @ 80A997C
	push {r4-r7,lr}
	movs r2, 0
	ldr r0, _080A99CC
	mov r12, r0
_080A9984:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r3, r0, 16
	adds r7, r1, 0
	cmp r3, 0x31
	bhi _080A99BC
	lsls r1, r2, 2
	mov r2, r12
	adds r0, r1, r2
	movs r2, 0x93
	lsls r2, 3
	adds r5, r0, r2
	ldr r6, _080A99D0
	adds r4, r1, r6
_080A99A0:
	ldrh r0, [r5]
	cmp r0, 0
	bne _080A99B2
	ldr r2, [r4]
	lsls r1, r3, 2
	adds r1, r6
	ldr r0, [r1]
	str r0, [r4]
	str r2, [r1]
_080A99B2:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x31
	bls _080A99A0
_080A99BC:
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0x30
	bls _080A9984
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A99CC: .4byte gSaveBlock1
_080A99D0: .4byte 0x02025bcc
	thumb_func_end CompactPCItems

	thumb_func_start SwapRegisteredBike
SwapRegisteredBike: @ 80A99D4
	push {lr}
	ldr r0, _080A99F0
	ldr r1, _080A99F4
	adds r2, r0, r1
	ldrh r1, [r2]
	ldr r3, _080A99F8
	cmp r1, r3
	beq _080A99FC
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	beq _080A9A04
	b _080A9A06
	.align 2, 0
_080A99F0: .4byte gSaveBlock1
_080A99F4: .4byte 0x00000496
_080A99F8: .4byte 0x00000103
_080A99FC:
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r2]
	b _080A9A06
_080A9A04:
	strh r3, [r2]
_080A9A06:
	pop {r0}
	bx r0
	thumb_func_end SwapRegisteredBike

	thumb_func_start SanitizeItemId
SanitizeItemId: @ 80A9A0C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xAE
	lsls r0, 1
	cmp r1, r0
	bhi _080A9A1E
	adds r0, r1, 0
	b _080A9A20
_080A9A1E:
	movs r0, 0
_080A9A20:
	pop {r1}
	bx r1
	thumb_func_end SanitizeItemId

	thumb_func_start ItemId_GetItem
ItemId_GetItem: @ 80A9A24
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	ldr r1, _080A9A40
	adds r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_080A9A40: .4byte gItems
	thumb_func_end ItemId_GetItem

	thumb_func_start ItemId_GetId
ItemId_GetId: @ 80A9A44
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9A64
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0, 0xE]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9A64: .4byte gItems
	thumb_func_end ItemId_GetId

	thumb_func_start ItemId_GetPrice
ItemId_GetPrice: @ 80A9A68
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9A88
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrh r0, [r0, 0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9A88: .4byte gItems
	thumb_func_end ItemId_GetPrice

	thumb_func_start ItemId_GetHoldEffect
ItemId_GetHoldEffect: @ 80A9A8C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9AAC
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x12]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9AAC: .4byte gItems
	thumb_func_end ItemId_GetHoldEffect

	thumb_func_start ItemId_GetHoldEffectParam
ItemId_GetHoldEffectParam: @ 80A9AB0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9AD0
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x13]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9AD0: .4byte gItems
	thumb_func_end ItemId_GetHoldEffectParam

	thumb_func_start ItemId_GetDescription
ItemId_GetDescription: @ 80A9AD4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9AF4
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x14
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9AF4: .4byte gItems
	thumb_func_end ItemId_GetDescription

	thumb_func_start ItemId_CopyDescription
ItemId_CopyDescription: @ 80A9AF8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0x1
	ldr r4, _080A9B34
	lsls r0, 16
	lsrs r0, 16
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x14
	adds r0, r4
	ldr r3, [r0]
	adds r2, r6, 0
_080A9B1A:
	ldrb r1, [r3]
	adds r0, r1, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080A9B4A
	subs r5, 0x1
	cmp r5, 0
	bne _080A9B38
	movs r0, 0xFF
	strb r0, [r2]
	movs r0, 0x1
	b _080A9B52
	.align 2, 0
_080A9B34: .4byte gItems
_080A9B38:
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080A9B44
	movs r0, 0
	b _080A9B52
_080A9B44:
	adds r2, r6, 0
	adds r3, 0x1
	b _080A9B1A
_080A9B4A:
	strb r1, [r2]
	adds r3, 0x1
	adds r2, 0x1
	b _080A9B1A
_080A9B52:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ItemId_CopyDescription

	thumb_func_start ItemId_GetImportance
ItemId_GetImportance: @ 80A9B58
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9B78
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x18]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9B78: .4byte gItems
	thumb_func_end ItemId_GetImportance

	thumb_func_start ItemId_GetUnknownValue
ItemId_GetUnknownValue: @ 80A9B7C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9B9C
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x19]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9B9C: .4byte gItems
	thumb_func_end ItemId_GetUnknownValue

	thumb_func_start ItemId_GetPocket
ItemId_GetPocket: @ 80A9BA0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9BC0
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1A]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9BC0: .4byte gItems
	thumb_func_end ItemId_GetPocket

	thumb_func_start ItemId_GetType
ItemId_GetType: @ 80A9BC4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9BE4
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1B]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9BE4: .4byte gItems
	thumb_func_end ItemId_GetType

	thumb_func_start ItemId_GetFieldFunc
ItemId_GetFieldFunc: @ 80A9BE8
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9C08
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x1C
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C08: .4byte gItems
	thumb_func_end ItemId_GetFieldFunc

	thumb_func_start ItemId_GetBattleUsage
ItemId_GetBattleUsage: @ 80A9C0C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9C2C
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	adds r0, 0x20
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C2C: .4byte gItems
	thumb_func_end ItemId_GetBattleUsage

	thumb_func_start ItemId_GetBattleFunc
ItemId_GetBattleFunc: @ 80A9C30
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9C50
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r4, 0x24
	adds r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C50: .4byte gItems
	thumb_func_end ItemId_GetBattleFunc

	thumb_func_start ItemId_GetSecondaryId
ItemId_GetSecondaryId: @ 80A9C54
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080A9C74
	bl SanitizeItemId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2C
	muls r0, r1
	adds r0, r4
	adds r0, 0x28
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C74: .4byte gItems
	thumb_func_end ItemId_GetSecondaryId

	.align 2, 0 @ Don't pad with nop.
