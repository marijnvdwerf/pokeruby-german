	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start IsEnoughMoney
IsEnoughMoney: @ 80B7B50
	push {lr}
	cmp r0, r1
	bcs _080B7B5A
	movs r0, 0
	b _080B7B5C
_080B7B5A:
	movs r0, 0x1
_080B7B5C:
	pop {r1}
	bx r1
	thumb_func_end IsEnoughMoney

	thumb_func_start sub_80B79B8
sub_80B79B8: @ 80B7B60
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2]
	adds r1, r0, r1
	cmp r0, r1
	bls _080B7B74
	ldr r0, _080B7B70
	b _080B7B7C
	.align 2, 0
_080B7B70: .4byte 0x000f423f
_080B7B74:
	str r1, [r2]
	ldr r0, _080B7B84
	cmp r1, r0
	bls _080B7B7E
_080B7B7C:
	str r0, [r2]
_080B7B7E:
	pop {r0}
	bx r0
	.align 2, 0
_080B7B84: .4byte 0x000f423f
	thumb_func_end sub_80B79B8

	thumb_func_start sub_80B79E0
sub_80B79E0: @ 80B7B88
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2]
	cmp r0, r1
	bcs _080B7B96
	movs r0, 0
	b _080B7B98
_080B7B96:
	subs r0, r1
_080B7B98:
	str r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_80B79E0

	thumb_func_start sub_80B79F8
sub_80B79F8: @ 80B7BA0
	push {r4,lr}
	adds r3, r0, 0
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r0, _080B7BB4
	cmp r1, r0
	bls _080B7BB8
	movs r2, 0x7
	b _080B7BEE
	.align 2, 0
_080B7BB4: .4byte 0x000f423f
_080B7BB8:
	ldr r0, _080B7BC4
	cmp r1, r0
	bls _080B7BC8
	movs r2, 0x6
	b _080B7BEE
	.align 2, 0
_080B7BC4: .4byte 0x0001869f
_080B7BC8:
	ldr r0, _080B7BD4
	cmp r1, r0
	bls _080B7BD8
	movs r2, 0x5
	b _080B7BEE
	.align 2, 0
_080B7BD4: .4byte 0x00002710
_080B7BD8:
	ldr r0, _080B7C38
	movs r2, 0x4
	cmp r1, r0
	bhi _080B7BEE
	movs r2, 0x3
	cmp r1, 0x63
	bhi _080B7BEE
	movs r2, 0x1
	cmp r1, 0x9
	bls _080B7BEE
	movs r2, 0x2
_080B7BEE:
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0x6
	strb r0, [r3, 0x2]
	adds r3, 0x3
	movs r0, 0
	subs r2, r4, r2
	cmp r0, r2
	bge _080B7C14
	movs r4, 0
_080B7C06:
	strb r4, [r3]
	adds r3, 0x1
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r2
	blt _080B7C06
_080B7C14:
	movs r0, 0xB7
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r3, 0
	bl ConvertIntToDecimalString
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0
	strb r0, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C38: .4byte 0x000003e7
	thumb_func_end sub_80B79F8

	thumb_func_start sub_80B7A94
sub_80B7A94: @ 80B7C3C
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r7, r3, 24
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B79F8
	mov r0, sp
	bl sub_8072CA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0x1
	lsls r0, 3
	cmp r2, r0
	blt _080B7C76
	mov r0, sp
	adds r1, r6, 0
	adds r2, r7, 0
	bl MenuPrint
	b _080B7C8C
_080B7C76:
	adds r1, r6, 0x1
	adds r1, r5
	lsls r1, 3
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r7, 3
	mov r0, sp
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_080B7C8C:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7A94

	thumb_func_start sub_80B7AEC
sub_80B7AEC: @ 80B7C94
	push {r4,r5,lr}
	sub sp, 0x20
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r1, sp
	movs r0, 0xB7
	strb r0, [r1]
	adds r1, 0x1
	adds r0, r1, 0
	adds r1, r3, 0
	bl ConvertIntToDecimalString
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint_RightAligned
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7AEC

	thumb_func_start sub_80B7B34
sub_80B7B34: @ 80B7CC8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r9
	lsls r1, 8
	mov r9, r1
	ldr r4, _080B7D6C
	adds r0, r1, r4
	lsls r6, r5, 4
	subs r6, r5
	lsls r1, r6, 6
	mov r3, r8
	adds r3, 0x1
	lsls r3, 5
	ldr r2, _080B7D70
	adds r3, r2
	adds r1, r3
	movs r2, 0x20
	str r3, [sp]
	bl CpuFastSet
	adds r4, 0x80
	add r9, r4
	adds r0, r5, 0x1
	lsls r4, r0, 4
	subs r4, r0
	lsls r1, r4, 6
	ldr r3, [sp]
	adds r1, r3
	mov r0, r9
	movs r2, 0x20
	bl CpuFastSet
	movs r3, 0
	lsls r5, 5
	mov r0, r8
	adds r7, r5, r0
	lsls r6, 1
	adds r6, 0x1
	add r6, r8
	ldr r1, _080B7D74
	adds r5, r1, 0
	ldr r0, _080B7D78
	mov r12, r0
	ldr r1, _080B7D7C
	mov r9, r1
	lsls r4, 1
	adds r4, 0x1
	add r4, r8
_080B7D3E:
	adds r1, r7, r3
	lsls r1, 1
	mov r0, r12
	adds r2, r1, r0
	adds r0, r3, r6
	adds r0, r5
	strh r0, [r2]
	add r1, r9
	adds r0, r3, r4
	adds r0, r5
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080B7D3E
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D6C: .4byte gDecoration10000_Gfx
_080B7D70: .4byte 0x06008000
_080B7D74: .4byte 0xfffff000
_080B7D78: .4byte 0x0600f800
_080B7D7C: .4byte 0x0600f840
	thumb_func_end sub_80B7B34

	thumb_func_start sub_80B7BEC
sub_80B7BEC: @ 80B7D80
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	movs r1, 0xC0
	lsls r1, 19
	adds r4, r1
	lsrs r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r3, r1
	lsrs r3, 24
	movs r1, 0x6
	adds r2, r4, 0
	bl sub_80B7A94
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7BEC

	thumb_func_start sub_80B7C14
sub_80B7C14: @ 80B7DA8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r4, 24
	lsls r3, 24
	lsrs r6, r4, 24
	movs r0, 0xD0
	lsls r0, 20
	adds r4, r0
	lsrs r4, 24
	lsrs r5, r3, 24
	movs r1, 0xC0
	lsls r1, 18
	adds r3, r1
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	mov r0, r8
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80B7BEC
	ldr r0, _080B7E1C
	bl LoadCompressedObjectPic
	ldr r0, _080B7E20
	bl LoadCompressedObjectPalette
	ldr r0, _080B7E24
	lsls r6, 19
	movs r1, 0x98
	lsls r1, 13
	adds r6, r1
	asrs r6, 16
	lsls r5, 19
	movs r1, 0xB0
	lsls r1, 12
	adds r5, r1
	asrs r5, 16
	adds r1, r6, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, _080B7E28
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7E1C: .4byte gUnknown_083CF584
_080B7E20: .4byte gUnknown_083CF58C
_080B7E24: .4byte gSpriteTemplate_83CF56C
_080B7E28: .4byte gUnknown_02038734
	thumb_func_end sub_80B7C14

	thumb_func_start RemoveMoneyLabelObject
RemoveMoneyLabelObject: @ 80B7E2C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B7E70
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B7E74
	adds r0, r1
	bl DestroySpriteAndFreeResources
	ldr r0, _080B7E78
	bl FreeSpritePaletteByTag
	adds r2, r4, 0
	adds r2, 0xD
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0x3
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl MenuZeroFillWindowRect
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7E70: .4byte gUnknown_02038734
_080B7E74: .4byte gSprites
_080B7E78: .4byte 0x00002722
	thumb_func_end RemoveMoneyLabelObject

	thumb_func_start sub_80B7CE8
sub_80B7CE8: @ 80B7E7C
	push {lr}
	ldr r0, _080B7E98
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080B7E9C
	ldrh r1, [r1]
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080B7E98: .4byte gSaveBlock1
_080B7E9C: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80B7CE8

	thumb_func_start sub_80B7D0C
sub_80B7D0C: @ 80B7EA0
	push {lr}
	ldr r0, _080B7EB0
	ldr r1, _080B7EB4
	ldrh r1, [r1]
	bl sub_80B79E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7EB0: .4byte 0x02025bc4
_080B7EB4: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80B7D0C

	.align 2, 0 @ Don't pad with nop.
