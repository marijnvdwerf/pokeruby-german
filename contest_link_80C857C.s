	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C857C
sub_80C857C: @ 80C8778
	push {r4,r5,lr}
	adds r2, r0, 0
	lsls r4, r1, 16
	lsrs r4, 16
	ldr r5, _080C87A4
	adds r0, r5, 0
	adds r1, r2, 0
	adds r2, r4, 0
	bl memcpy
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl SendBlock
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C87A4: .4byte 0x0201e000
	thumb_func_end sub_80C857C

	thumb_func_start sub_80C85AC
sub_80C85AC: @ 80C87A8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 17
	lsls r1, r0
	lsrs r4, r1, 24
	bl GetBlockReceivedStatus
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080C87CC
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	movs r0, 0x1
	b _080C87CE
_080C87CC:
	movs r0, 0
_080C87CE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C85AC

	thumb_func_start sub_80C85D8
sub_80C85D8: @ 80C87D4
	push {r4,lr}
	movs r4, 0
_080C87D8:
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r0, 24
	asrs r0, r4
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C87EE
	movs r0, 0
	b _080C87FA
_080C87EE:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080C87D8
	bl ResetBlockReceivedFlags
	movs r0, 0x1
_080C87FA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C85D8

	thumb_func_start sub_80C8604
sub_80C8604: @ 80C8800
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C8818
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	ldr r0, _080C881C
	str r0, [r1]
	bx lr
	.align 2, 0
_080C8818: .4byte gTasks
_080C881C: .4byte sub_80C8644
	thumb_func_end sub_80C8604

	thumb_func_start sub_80C8644
sub_80C8644: @ 80C8820
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C8834
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080C8838
	str r0, [r1]
	bx lr
	.align 2, 0
_080C8834: .4byte gTasks
_080C8838: .4byte sub_80C8660
	thumb_func_end sub_80C8644

	thumb_func_start sub_80C8660
sub_80C8660: @ 80C883C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C8870
	ldrb r0, [r0]
	cmp r0, 0
	beq _080C886A
	bl GetMultiplayerId
	ldr r1, _080C8874
	strb r0, [r1]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080C886A
	ldr r1, _080C8878
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C886A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8870: .4byte gReceivedRemoteLinkPlayers
_080C8874: .4byte gContestPlayerMonIndex
_080C8878: .4byte gUnknown_0203869A
	thumb_func_end sub_80C8660

	thumb_func_start sub_80C86A0
sub_80C86A0: @ 80C887C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x5
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _080C8892
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _080C8892
	movs r0, 0x5
	b _080C8908
_080C8892:
	adds r0, r4, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _080C8906
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080C8906
_080C88A6:
	ldrb r1, [r4]
	adds r0, r1, 0
	adds r0, 0x45
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	bls _080C88FA
	adds r0, r1, 0
	adds r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _080C88FA
	adds r0, r1, 0
	cmp r0, 0
	beq _080C88FA
	cmp r0, 0xAD
	beq _080C88FA
	cmp r0, 0xB8
	beq _080C88FA
	cmp r0, 0xAB
	beq _080C88FA
	cmp r0, 0xAC
	beq _080C88FA
	cmp r0, 0xB5
	beq _080C88FA
	cmp r0, 0xB6
	beq _080C88FA
	cmp r0, 0xBA
	beq _080C88FA
	cmp r0, 0xAE
	beq _080C88FA
	cmp r0, 0xB0
	beq _080C88FA
	cmp r0, 0xB1
	beq _080C88FA
	cmp r0, 0xB2
	beq _080C88FA
	cmp r0, 0xB3
	beq _080C88FA
	cmp r0, 0xB1
	bne _080C8904
_080C88FA:
	adds r4, 0x1
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080C88A6
	b _080C8906
_080C8904:
	movs r5, 0x1
_080C8906:
	adds r0, r5, 0
_080C8908:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C86A0

	thumb_func_start sub_80C8734
sub_80C8734: @ 80C8910
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C893C
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	cmp r0, 0x1
	beq _080C89DC
	cmp r0, 0x1
	bgt _080C8940
	cmp r0, 0
	beq _080C894C
	b _080C8ABC
	.align 2, 0
_080C893C: .4byte gTasks
_080C8940:
	cmp r0, 0x2
	bne _080C8946
	b _080C8AB0
_080C8946:
	cmp r0, 0x8
	beq _080C894C
	b _080C8ABC
_080C894C:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C89B0
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8962
	b _080C8ACA
_080C8962:
	ldr r0, _080C897C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C8980
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _080C8ACA
	.align 2, 0
_080C897C: .4byte gTasks
_080C8980:
	ldr r0, _080C89A4
	ldr r1, _080C89A8
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _080C89AC
	adds r1, r2
	movs r2, 0x40
	bl memcpy
	movs r0, 0
	bl de_sub_80C9274
	movs r0, 0x2
	bl sub_8007E9C
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8ACA
	.align 2, 0
_080C89A4: .4byte gBlockSendBuffer
_080C89A8: .4byte gContestPlayerMonIndex
_080C89AC: .4byte gContestMons
_080C89B0:
	ldr r0, _080C89CC
	ldr r1, _080C89D0
	ldrb r1, [r1]
	lsls r1, 6
	ldr r2, _080C89D4
	adds r1, r2
	movs r2, 0x40
	bl memcpy
	movs r0, 0
	bl de_sub_80C9294
	ldr r1, _080C89D8
	b _080C8ABC
	.align 2, 0
_080C89CC: .4byte gBlockSendBuffer
_080C89D0: .4byte gContestPlayerMonIndex
_080C89D4: .4byte gContestMons
_080C89D8: .4byte gTasks
_080C89DC:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8ACA
	movs r2, 0
	mov r8, r2
	str r4, [sp]
	ldr r0, _080C8A28
	ldr r7, _080C8A2C
	movs r6, 0
	mov r10, r0
	movs r3, 0xFF
	mov r9, r3
_080C89F8:
	mov r0, r8
	lsls r1, r0, 8
	ldr r0, _080C8A30
	adds r1, r0
	mov r0, r10
	movs r2, 0x40
	bl memcpy
	ldr r1, _080C8A34
	adds r4, r6, r1
	ldrh r0, [r7, 0x1A]
	cmp r0, 0x1
	bne _080C8A38
	adds r0, r4, 0
	bl sub_80C86A0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ConvertInternationalString
	b _080C8A4E
	.align 2, 0
_080C8A28: .4byte gContestMons
_080C8A2C: .4byte gLinkPlayers
_080C8A30: .4byte gBlockRecvBuffer
_080C8A34: .4byte 0x02038572
_080C8A38:
	ldrb r0, [r4, 0xA]
	cmp r0, 0xFC
	bne _080C8A48
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _080C8A4E
_080C8A48:
	strb r0, [r4, 0x5]
	mov r2, r9
	strb r2, [r4, 0xA]
_080C8A4E:
	ldr r0, _080C8A7C
	adds r4, r6, r0
	ldrh r0, [r7, 0x1A]
	cmp r0, 0x1
	bne _080C8A80
	mov r3, r9
	strb r3, [r4, 0x7]
	ldrb r0, [r4, 0x4]
	strb r0, [r4, 0x6]
	ldrb r0, [r4, 0x3]
	strb r0, [r4, 0x5]
	ldrb r0, [r4, 0x2]
	strb r0, [r4, 0x4]
	ldrb r0, [r4, 0x1]
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	strb r0, [r4, 0x2]
	movs r0, 0x15
	strb r0, [r4, 0x1]
	movs r0, 0xFC
	strb r0, [r4]
	b _080C8A88
	.align 2, 0
_080C8A7C: .4byte gUnknown_0203857D
_080C8A80:
	ldrb r0, [r4, 0x7]
	strb r0, [r4, 0x5]
	mov r0, r9
	strb r0, [r4, 0x7]
_080C8A88:
	adds r7, 0x1C
	adds r6, 0x40
	movs r1, 0x40
	add r10, r1
	movs r2, 0x1
	add r8, r2
	mov r3, r8
	cmp r3, 0x3
	ble _080C89F8
	ldr r0, _080C8AAC
	ldr r2, [sp]
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C8ACA
	.align 2, 0
_080C8AAC: .4byte gTasks
_080C8AB0:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8ACA
_080C8ABC:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080C8ACA:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8734

	thumb_func_start sub_80C88AC
sub_80C88AC: @ 80C8ADC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8B04
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080C8B08
	cmp r0, 0x1
	beq _080C8B2C
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8B54
	.align 2, 0
_080C8B04: .4byte gTasks
_080C8B08:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C8B4E
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8B54
	ldr r0, _080C8B28
	movs r1, 0x4
	bl sub_80C857C
	b _080C8B4E
	.align 2, 0
_080C8B28: .4byte gRngValue
_080C8B2C:
	movs r0, 0
	bl sub_80C85AC
	lsls r0, 24
	cmp r0, 0
	beq _080C8B54
	ldr r0, _080C8B5C
	ldr r4, _080C8B60
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _080C8B64
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
_080C8B4E:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080C8B54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8B5C: .4byte gRngValue
_080C8B60: .4byte gBlockRecvBuffer
_080C8B64: .4byte gUnknown_03005D28
	thumb_func_end sub_80C88AC

	thumb_func_start sub_80C8938
sub_80C8938: @ 80C8B68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8B90
	lsls r5, r4, 2
	adds r0, r5, r4
	lsls r6, r0, 3
	adds r2, r6, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	mov r8, r1
	cmp r0, 0x1
	beq _080C8BF4
	cmp r0, 0x1
	bgt _080C8B94
	cmp r0, 0
	beq _080C8B9C
	b _080C8C3C
	.align 2, 0
_080C8B90: .4byte gTasks
_080C8B94:
	cmp r0, 0x2
	beq _080C8C30
	cmp r0, 0x8
	bne _080C8C3C
_080C8B9C:
	ldr r1, _080C8BD0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r2, r8
	adds r4, r0, r2
	ldrh r0, [r4, 0x1A]
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C8BE6
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8C4A
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080C8BD4
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _080C8C4A
	.align 2, 0
_080C8BD0: .4byte gBlockSendBuffer
_080C8BD4:
	movs r0, 0x1
	bl de_sub_80C9274
	movs r0, 0x2
	bl sub_8007E9C
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8C4A
_080C8BE6:
	movs r0, 0x1
	bl de_sub_80C9294
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8C4A
_080C8BF4:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8C4A
	movs r3, 0
	adds r7, r5, 0
	ldr r1, _080C8C2C
	mov r0, r8
	adds r0, 0xA
	adds r2, r6, r0
	movs r5, 0x80
	lsls r5, 1
_080C8C0E:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, r5
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C8C0E
	adds r1, r7, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C8C4A
	.align 2, 0
_080C8C2C: .4byte gBlockRecvBuffer
_080C8C30:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
	b _080C8C4A
_080C8C3C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080C8C4A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8938

	thumb_func_start sub_80C89DC
sub_80C89DC: @ 80C8C54
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C8C7C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8C80
	cmp r0, 0x1
	beq _080C8C98
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C8CA8
	.align 2, 0
_080C8C7C: .4byte gTasks
_080C8C80:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8CA8
	ldr r0, _080C8C94
	movs r1, 0x1
	bl sub_80C857C
	b _080C8CA2
	.align 2, 0
_080C8C94: .4byte gContestPlayerMonIndex
_080C8C98:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8CA8
_080C8CA2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C8CA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C89DC

	thumb_func_start sub_80C8A38
sub_80C8A38: @ 80C8CB0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r7, _080C8CD8
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r7
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C8CDC
	cmp r0, 0x1
	beq _080C8D0C
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C8D3A
	.align 2, 0
_080C8CD8: .4byte gTasks
_080C8CDC:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8D3A
	ldr r0, _080C8D04
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _080C8D08
	adds r0, r1
	movs r1, 0x2
	bl sub_80C857C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C8D3A
	.align 2, 0
_080C8D04: .4byte gContestPlayerMonIndex
_080C8D08: .4byte 0x02019266
_080C8D0C:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8D3A
	ldr r1, _080C8D40
	ldr r3, _080C8D44
	movs r4, 0x80
	lsls r4, 1
	movs r2, 0x3
_080C8D20:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, r4
	adds r3, 0x1C
	subs r2, 0x1
	cmp r2, 0
	bge _080C8D20
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r7
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C8D3A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8D40: .4byte gBlockRecvBuffer
_080C8D44: .4byte 0x02019266
	thumb_func_end sub_80C8A38

	thumb_func_start sub_80C8AD0
sub_80C8AD0: @ 80C8D48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8D70
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080C8D64
	b _080C8EE8
_080C8D64:
	lsls r0, 2
	ldr r1, _080C8D74
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8D70: .4byte gTasks
_080C8D74: .4byte _080C8D78
	.align 2, 0
_080C8D78:
	.4byte _080C8DA8
	.4byte _080C8DC4
	.4byte _080C8DEC
	.4byte _080C8E10
	.4byte _080C8E28
	.4byte _080C8DEC
	.4byte _080C8E50
	.4byte _080C8E68
	.4byte _080C8DEC
	.4byte _080C8E90
	.4byte _080C8EA8
	.4byte _080C8DEC
_080C8DA8:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8DB4
	b _080C8EF2
_080C8DB4:
	ldr r0, _080C8DC0
	movs r1, 0x8
	bl sub_80C857C
	b _080C8EC4
	.align 2, 0
_080C8DC0: .4byte gUnknown_02038678
_080C8DC4:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	bne _080C8DD0
	b _080C8EF2
_080C8DD0:
	ldr r0, _080C8DE0
	ldr r1, _080C8DE4
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8DE8
	adds r1, r2
	movs r2, 0x8
	b _080C8EC0
	.align 2, 0
_080C8DE0: .4byte gUnknown_02038678
_080C8DE4: .4byte gUnknown_0203869B
_080C8DE8: .4byte gBlockRecvBuffer
_080C8DEC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bgt _080C8E04
	b _080C8EF2
_080C8E04:
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080C8EF2
_080C8E10:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8EF2
	ldr r0, _080C8E24
	movs r1, 0x8
	bl sub_80C857C
	b _080C8EC4
	.align 2, 0
_080C8E24: .4byte gUnknown_02038680
_080C8E28:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8EF2
	ldr r0, _080C8E44
	ldr r1, _080C8E48
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8E4C
	adds r1, r2
	movs r2, 0x8
	b _080C8EC0
	.align 2, 0
_080C8E44: .4byte gUnknown_02038680
_080C8E48: .4byte gUnknown_0203869B
_080C8E4C: .4byte gBlockRecvBuffer
_080C8E50:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8EF2
	ldr r0, _080C8E64
	movs r1, 0x8
	bl sub_80C857C
	b _080C8EC4
	.align 2, 0
_080C8E64: .4byte gUnknown_02038688
_080C8E68:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8EF2
	ldr r0, _080C8E84
	ldr r1, _080C8E88
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8E8C
	adds r1, r2
	movs r2, 0x8
	b _080C8EC0
	.align 2, 0
_080C8E84: .4byte gUnknown_02038688
_080C8E88: .4byte gUnknown_0203869B
_080C8E8C: .4byte gBlockRecvBuffer
_080C8E90:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C8EF2
	ldr r0, _080C8EA4
	movs r1, 0x4
	bl sub_80C857C
	b _080C8EC4
	.align 2, 0
_080C8EA4: .4byte gUnknown_02038690
_080C8EA8:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C8EF2
	ldr r0, _080C8ED8
	ldr r1, _080C8EDC
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8EE0
	adds r1, r2
	movs r2, 0x4
_080C8EC0:
	bl memcpy
_080C8EC4:
	ldr r1, _080C8EE4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C8EF2
	.align 2, 0
_080C8ED8: .4byte gUnknown_02038690
_080C8EDC: .4byte gUnknown_0203869B
_080C8EE0: .4byte gBlockRecvBuffer
_080C8EE4: .4byte gTasks
_080C8EE8:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C8EF2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8AD0

	thumb_func_start sub_80C8C80
sub_80C8C80: @ 80C8EF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8F20
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r3, r1, 0
	cmp r0, 0xB
	bls _080C8F14
	b _080C9084
_080C8F14:
	lsls r0, 2
	ldr r1, _080C8F24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8F20: .4byte gTasks
_080C8F24: .4byte _080C8F28
	.align 2, 0
_080C8F28:
	.4byte _080C8F58
	.4byte _080C8F74
	.4byte _080C8F9C
	.4byte _080C8FBE
	.4byte _080C8FD8
	.4byte _080C8F9C
	.4byte _080C9000
	.4byte _080C9018
	.4byte _080C8F9C
	.4byte _080C902C
	.4byte _080C9044
	.4byte _080C8F9C
_080C8F58:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _080C8F64
	b _080C908E
_080C8F64:
	ldr r0, _080C8F70
	movs r1, 0x70
	bl sub_80C857C
	b _080C9060
	.align 2, 0
_080C8F70: .4byte 0x02019260
_080C8F74:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	bne _080C8F80
	b _080C908E
_080C8F80:
	ldr r0, _080C8F90
	ldr r1, _080C8F94
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8F98
	adds r1, r2
	movs r2, 0x70
	b _080C905C
	.align 2, 0
_080C8F90: .4byte 0x02019260
_080C8F94: .4byte gUnknown_0203869B
_080C8F98: .4byte gBlockRecvBuffer
_080C8F9C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r3
	ldrh r0, [r2, 0xA]
	adds r1, r0, 0x1
	strh r1, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080C908E
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080C908E
_080C8FBE:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C908E
	ldr r0, _080C8FD4
	movs r1, 0x14
	bl sub_80C857C
	b _080C9060
	.align 2, 0
_080C8FD4: .4byte 0x020192d0
_080C8FD8:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C908E
	ldr r0, _080C8FF4
	ldr r1, _080C8FF8
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C8FFC
	adds r1, r2
	movs r2, 0x14
	b _080C905C
	.align 2, 0
_080C8FF4: .4byte 0x020192d0
_080C8FF8: .4byte gUnknown_0203869B
_080C8FFC: .4byte gBlockRecvBuffer
_080C9000:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C908E
	ldr r0, _080C9014
	movs r1, 0x4
	bl sub_80C857C
	b _080C9060
	.align 2, 0
_080C9014: .4byte 0x02019328
_080C9018:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C908E
	ldr r0, _080C9028
	b _080C9050
	.align 2, 0
_080C9028: .4byte 0x02019328
_080C902C:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C908E
	ldr r0, _080C9040
	movs r1, 0x4
	bl sub_80C857C
	b _080C9060
	.align 2, 0
_080C9040: .4byte gUnknown_02038696
_080C9044:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C908E
	ldr r0, _080C9074
_080C9050:
	ldr r1, _080C9078
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C907C
	adds r1, r2
	movs r2, 0x4
_080C905C:
	bl memcpy
_080C9060:
	ldr r1, _080C9080
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080C908E
	.align 2, 0
_080C9074: .4byte gUnknown_02038696
_080C9078: .4byte gUnknown_0203869B
_080C907C: .4byte gBlockRecvBuffer
_080C9080: .4byte gTasks
_080C9084:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080C908E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8C80

	thumb_func_start sub_80C8E1C
sub_80C8E1C: @ 80C9094
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C90B8
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r6, r0, 3
	adds r2, r6, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	adds r7, r1, 0
	cmp r0, 0x1
	beq _080C9128
	cmp r0, 0x1
	bgt _080C90BC
	cmp r0, 0
	beq _080C90C4
	b _080C9170
	.align 2, 0
_080C90B8: .4byte gTasks
_080C90BC:
	cmp r0, 0x2
	beq _080C9164
	cmp r0, 0x8
	bne _080C9170
_080C90C4:
	ldr r1, _080C90F8
	movs r0, 0x64
	strb r0, [r1]
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _080C9112
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C917E
	ldr r0, _080C90FC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C9100
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _080C917E
	.align 2, 0
_080C90F8: .4byte gBlockSendBuffer
_080C90FC: .4byte gTasks
_080C9100:
	movs r0, 0
	bl de_sub_80C9274
	movs r0, 0x2
	bl sub_8007E9C
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080C917E
_080C9112:
	movs r0, 0
	bl de_sub_80C9294
	ldr r0, _080C9124
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	b _080C9156
	.align 2, 0
_080C9124: .4byte gTasks
_080C9128:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C917E
	adds r1, r4, 0
	ldr r4, _080C9160
	adds r0, r7, 0
	adds r0, 0x12
	adds r2, r6, r0
	movs r6, 0x80
	lsls r6, 1
	movs r3, 0x3
_080C9142:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, r6
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080C9142
	adds r1, r5
	lsls r1, 3
	adds r1, r7
_080C9156:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080C917E
	.align 2, 0
_080C9160: .4byte gBlockRecvBuffer
_080C9164:
	movs r0, 0
	strh r0, [r2, 0x8]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
	b _080C917E
_080C9170:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
_080C917E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C8E1C

	thumb_func_start sub_80C8EBC
sub_80C8EBC: @ 80C9184
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C91AC
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C91B0
	cmp r0, 0x1
	beq _080C91C8
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C91EA
	.align 2, 0
_080C91AC: .4byte gTasks
_080C91B0:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C91EA
	ldr r0, _080C91C4
	movs r1, 0x8
	bl sub_80C857C
	b _080C91E4
	.align 2, 0
_080C91C4: .4byte gUnknown_02038670
_080C91C8:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C91EA
	ldr r0, _080C91F0
	ldr r1, _080C91F4
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C91F8
	adds r1, r2
	movs r2, 0x8
	bl memcpy
_080C91E4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C91EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C91F0: .4byte gUnknown_02038670
_080C91F4: .4byte gUnknown_0203869B
_080C91F8: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8EBC

	thumb_func_start sub_80C8F34
sub_80C8F34: @ 80C91FC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C9224
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080C9228
	cmp r0, 0x1
	beq _080C9240
	movs r0, 0
	strh r0, [r4, 0x8]
	adds r0, r2, 0
	bl SwitchTaskToFollowupFunc
	b _080C9262
	.align 2, 0
_080C9224: .4byte gTasks
_080C9228:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _080C9262
	ldr r0, _080C923C
	movs r1, 0x4
	bl sub_80C857C
	b _080C925C
	.align 2, 0
_080C923C: .4byte gUnknown_02038696
_080C9240:
	bl sub_80C85D8
	lsls r0, 24
	cmp r0, 0
	beq _080C9262
	ldr r0, _080C9268
	ldr r1, _080C926C
	ldrb r1, [r1]
	lsls r1, 8
	ldr r2, _080C9270
	adds r1, r2
	movs r2, 0x4
	bl memcpy
_080C925C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C9262:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9268: .4byte gUnknown_02038696
_080C926C: .4byte gUnknown_0203869B
_080C9270: .4byte gBlockRecvBuffer
	thumb_func_end sub_80C8F34

	.align 2, 0 @ Don't pad with nop.
