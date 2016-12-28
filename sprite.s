	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ResetSpriteData
ResetSpriteData: @ 8000748
	push {r4,lr}
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl ResetAllSprites
	bl ClearSpriteCopyRequests
	bl ResetAffineAnimData
	bl FreeSpriteTileRanges
	ldr r1, _08000784 @ =gOamLimit
	movs r0, 0x40
	strb r0, [r1]
	ldr r0, _08000788 @ =gReservedSpriteTileCount
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl AllocSpriteTiles
	ldr r0, _0800078C @ =gSpriteCoordOffsetX
	strh r4, [r0]
	ldr r0, _08000790 @ =gSpriteCoordOffsetY
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000784: .4byte gOamLimit
_08000788: .4byte gReservedSpriteTileCount
_0800078C: .4byte gSpriteCoordOffsetX
_08000790: .4byte gSpriteCoordOffsetY
	thumb_func_end ResetSpriteData

	thumb_func_start AnimateSprites
AnimateSprites: @ 8000794
	push {r4-r7,lr}
	movs r6, 0
	movs r7, 0x1
_0800079A:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _080007DC @ =gSprites
	adds r4, r0, r1
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080007CA
	ldr r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	ldrb r1, [r5]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080007CA
	adds r0, r4, 0
	bl AnimateSprite
_080007CA:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _0800079A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080007DC: .4byte gSprites
	thumb_func_end AnimateSprites

	thumb_func_start BuildOamBuffer
BuildOamBuffer: @ 80007E0
	push {r4,r5,lr}
	bl UpdateOamCoords
	bl BuildSpritePriorities
	bl SortSprites
	ldr r5, _08000820 @ =gMain
	ldr r0, _08000824 @ =0x0000043d
	adds r5, r0
	ldrb r0, [r5]
	lsls r4, r0, 31
	lsrs r4, 31
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5]
	bl AddSpritesToOamBuffer
	bl CopyMatricesToOamBuffer
	movs r2, 0x1
	ldrb r1, [r5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	orrs r4, r0
	strb r4, [r5]
	ldr r0, _08000828 @ =gShouldProcessSpriteCopyRequests
	strb r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000820: .4byte gMain
_08000824: .4byte 0x0000043d
_08000828: .4byte gShouldProcessSpriteCopyRequests
	thumb_func_end BuildOamBuffer

	thumb_func_start UpdateOamCoords
UpdateOamCoords: @ 8000960
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _080009CC @ =gSprites
	ldr r0, _080009D0 @ =0x000001ff
	adds r5, r0, 0
	ldr r6, _080009D4 @ =0xfffffe00
_0800096C:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0x1
	bne _08000A12
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080009E0
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r0
	ldr r0, _080009D8 @ =gSpriteCoordOffsetX
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r1, r0
	ands r1, r5
	ldrh r2, [r3, 0x2]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	ldr r2, _080009DC @ =gSpriteCoordOffsetY
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	b _08000A10
	.align 2, 0
_080009CC: .4byte gSprites
_080009D0: .4byte 0x000001ff
_080009D4: .4byte 0xfffffe00
_080009D8: .4byte gSpriteCoordOffsetX
_080009DC: .4byte gSpriteCoordOffsetY
_080009E0:
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r0
	ands r1, r5
	ldrh r2, [r3, 0x2]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	adds r0, r1
_08000A10:
	strb r0, [r3]
_08000A12:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3F
	bls _0800096C
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end UpdateOamCoords

	thumb_func_start BuildSpritePriorities
BuildSpritePriorities: @ 8000A24
	push {r4,lr}
	movs r2, 0
	ldr r4, _08000A5C @ =gSprites
	ldr r3, _08000A60 @ =gSpritePriorities
_08000A2C:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	adds r1, r0, 0
	adds r1, 0x43
	ldrb r1, [r1]
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	lsls r0, 8
	orrs r1, r0
	lsls r0, r2, 1
	adds r0, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3F
	bls _08000A2C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000A5C: .4byte gSprites
_08000A60: .4byte gSpritePriorities
	thumb_func_end BuildSpritePriorities

	thumb_func_start SortSprites
SortSprites: @ 8000A64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0x1
	mov r12, r0
	ldr r1, _08000B2C @ =gSpriteOrder
	mov r10, r1
	ldr r3, _08000B30 @ =0xffffff00
	mov r9, r3
	ldr r6, _08000B34 @ =0xc0000300
	mov r8, r6
_08000A80:
	mov r5, r12
	mov r0, r12
	subs r0, 0x1
	add r0, r10
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r7, _08000B38 @ =gSprites
	adds r3, r0, r7
	mov r0, r12
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r7
	lsls r2, 1
	ldr r0, _08000B3C @ =gSpritePriorities
	adds r2, r0
	ldrh r2, [r2]
	str r2, [sp]
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	ldrb r1, [r3]
	ldrb r2, [r4]
	adds r0, r1, 0
	cmp r0, 0x9F
	ble _08000AC2
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08000AC2:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _08000AD0
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08000AD0:
	ldr r0, [r3]
	mov r7, r8
	ands r0, r7
	cmp r0, r8
	bne _08000AF4
	ldrb r0, [r3, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08000AE6
	cmp r0, 0x2
	bne _08000AF4
_08000AE6:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08000AF4
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08000AF4:
	ldr r0, [r4]
	mov r3, r8
	ands r0, r3
	cmp r0, r8
	bne _08000B18
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08000B0A
	cmp r0, 0x2
	bne _08000B18
_08000B0A:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08000B18
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08000B18:
	movs r7, 0x1
	add r12, r7
	cmp r5, 0
	beq _08000BFE
	ldr r0, [sp]
	cmp r0, r6
	bhi _08000B40
	cmp r0, r6
	bne _08000BFE
	b _08000BF6
	.align 2, 0
_08000B2C: .4byte gSpriteOrder
_08000B30: .4byte 0xffffff00
_08000B34: .4byte 0xc0000300
_08000B38: .4byte gSprites
_08000B3C: .4byte gSpritePriorities
_08000B40:
	mov r1, r10
	adds r3, r5, r1
	ldrb r4, [r3]
	subs r2, r5, 0x1
	adds r1, r2, r1
	ldrb r0, [r1]
	strb r0, [r3]
	strb r4, [r1]
	lsls r2, 24
	lsrs r5, r2, 24
	subs r0, r5, 0x1
	add r0, r10
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r6, _08000C1C @ =gSprites
	adds r3, r0, r6
	mov r7, r10
	adds r0, r5, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r6
	lsls r2, 1
	ldr r0, _08000C20 @ =gSpritePriorities
	adds r2, r0
	ldrh r2, [r2]
	str r2, [sp]
	lsls r1, 1
	adds r1, r0
	ldrh r6, [r1]
	ldrb r1, [r3]
	ldrb r2, [r4]
	adds r0, r1, 0
	cmp r0, 0x9F
	ble _08000B92
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08000B92:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _08000BA0
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08000BA0:
	ldr r0, [r3]
	mov r7, r8
	ands r0, r7
	cmp r0, r8
	bne _08000BC4
	ldrb r0, [r3, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08000BB6
	cmp r0, 0x2
	bne _08000BC4
_08000BB6:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08000BC4
	add r0, r9
	lsls r0, 16
	lsrs r1, r0, 16
_08000BC4:
	ldr r0, [r4]
	mov r3, r8
	ands r0, r3
	cmp r0, r8
	bne _08000BE8
	ldrb r0, [r4, 0x1]
	lsrs r0, 6
	cmp r0, 0
	beq _08000BDA
	cmp r0, 0x2
	bne _08000BE8
_08000BDA:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x80
	ble _08000BE8
	add r0, r9
	lsls r0, 16
	lsrs r2, r0, 16
_08000BE8:
	cmp r5, 0
	beq _08000BFE
	ldr r7, [sp]
	cmp r7, r6
	bhi _08000B40
	cmp r7, r6
	bne _08000BFE
_08000BF6:
	lsls r1, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _08000B40
_08000BFE:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x3F
	bhi _08000C0C
	b _08000A80
_08000C0C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000C1C: .4byte gSprites
_08000C20: .4byte gSpritePriorities
	thumb_func_end SortSprites

	thumb_func_start CopyMatricesToOamBuffer
CopyMatricesToOamBuffer: @ 8000C24
	push {r4-r6,lr}
	movs r4, 0
	ldr r5, _08000C70 @ =gMain
	ldr r6, _08000C74 @ =gOamMatrices
_08000C2C:
	lsls r2, r4, 2
	lsls r0, r4, 5
	adds r0, r5
	lsls r3, r4, 3
	adds r3, r6
	ldrh r1, [r3]
	adds r0, 0x42
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 3
	adds r0, r5
	ldrh r1, [r3, 0x2]
	adds r0, 0x42
	strh r1, [r0]
	adds r0, r2, 0x2
	lsls r0, 3
	adds r0, r5
	ldrh r1, [r3, 0x4]
	adds r0, 0x42
	strh r1, [r0]
	adds r2, 0x3
	lsls r2, 3
	adds r2, r5
	ldrh r0, [r3, 0x6]
	adds r2, 0x42
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08000C2C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000C70: .4byte gMain
_08000C74: .4byte gOamMatrices
	thumb_func_end CopyMatricesToOamBuffer

	thumb_func_start AddSpritesToOamBuffer
AddSpritesToOamBuffer: @ 8000C78
	push {r4-r6,lr}
	sub sp, 0x4
	movs r4, 0
	mov r0, sp
	strb r4, [r0]
_08000C82:
	ldr r0, _08000CFC @ =gSpriteOrder
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08000D00 @ =gSprites
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x5
	ands r0, r1
	cmp r0, 0x1
	bne _08000CAE
	adds r0, r2, 0
	mov r1, sp
	bl AddSpriteToOamBuffer
	lsls r0, 24
	cmp r0, 0
	bne _08000CB8
_08000CAE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3F
	bls _08000C82
_08000CB8:
	ldr r2, _08000D04 @ =gMain
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r2, 0
	adds r1, 0x38
	strb r0, [r1]
	ldr r1, _08000D08 @ =gOamLimit
	lsls r0, 24
	lsrs r0, 24
	ldrb r3, [r1]
	cmp r0, r3
	bcs _08000CF4
	adds r5, r2, 0
	mov r2, sp
	ldr r0, _08000D0C @ =gDummyOamData
	ldr r3, [r0]
	ldr r4, [r0, 0x4]
_08000CDA:
	ldrb r0, [r2]
	lsls r0, 3
	adds r0, r5
	str r3, [r0, 0x3C]
	str r4, [r0, 0x40]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldrb r6, [r1]
	cmp r0, r6
	bcc _08000CDA
_08000CF4:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000CFC: .4byte gSpriteOrder
_08000D00: .4byte gSprites
_08000D04: .4byte gMain
_08000D08: .4byte gOamLimit
_08000D0C: .4byte gDummyOamData
	thumb_func_end AddSpritesToOamBuffer

	thumb_func_start CreateSprite
CreateSprite: @ 8000BDC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r3, 24
	lsrs r4, r3, 24
	movs r3, 0
	ldr r0, _08000C18 @ =gSprites
	mov r12, r0
	lsls r5, r1, 16
	lsls r6, r2, 16
_08000BF0:
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	add r0, r12
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _08000C1C
	str r4, [sp]
	adds r0, r3, 0
	adds r1, r7, 0
	asrs r2, r5, 16
	asrs r3, r6, 16
	bl CreateSpriteAt
	lsls r0, 24
	lsrs r0, 24
	b _08000C28
	.align 2, 0
_08000C18: .4byte gSprites
_08000C1C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _08000BF0
	movs r0, 0x40
_08000C28:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSprite

	thumb_func_start CreateSpriteAtEnd
CreateSpriteAtEnd: @ 8000C30
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r3, 24
	lsrs r6, r3, 24
	movs r3, 0x3F
	ldr r0, _08000C7C @ =gSprites
	mov r8, r0
	movs r0, 0x1
	negs r0, r0
	mov r12, r0
	lsls r4, r1, 16
	lsls r5, r2, 16
_08000C4E:
	lsls r0, r3, 16
	asrs r1, r0, 16
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _08000C80
	lsls r0, r3, 24
	lsrs r0, 24
	str r6, [sp]
	adds r1, r7, 0
	asrs r2, r4, 16
	asrs r3, r5, 16
	bl CreateSpriteAt
	lsls r0, 24
	lsrs r0, 24
	b _08000C8E
	.align 2, 0
_08000C7C: .4byte gSprites
_08000C80:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, r12
	bgt _08000C4E
	movs r0, 0x40
_08000C8E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSpriteAtEnd

	thumb_func_start CreateInvisibleSprite
CreateInvisibleSprite: @ 8000C9C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _08000CD4 @ =gDummySpriteTemplate
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _08000CDC
	ldr r4, _08000CD8 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r2, r1, r4
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r2]
	adds r4, 0x1C
	adds r1, r4
	str r6, [r1]
	adds r0, r5, 0
	b _08000CDE
	.align 2, 0
_08000CD4: .4byte gDummySpriteTemplate
_08000CD8: .4byte gSprites
_08000CDC:
	movs r0, 0x40
_08000CDE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CreateInvisibleSprite

	thumb_func_start CreateSpriteAt
CreateSpriteAt: @ 8000E18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 4
	add r0, r10
	lsls r0, 2
	ldr r1, _08000EDC @ =gSprites
	adds r7, r0, r1
	adds r0, r7, 0
	bl ResetSprite
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x3F
	adds r0, r7
	mov r9, r0
	ldrb r0, [r0]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x40
	orrs r0, r1
	mov r1, r9
	strb r0, [r1]
	adds r0, r7, 0
	adds r0, 0x43
	strb r4, [r0]
	mov r1, r8
	ldr r0, [r1, 0x4]
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r7]
	str r1, [r7, 0x4]
	mov r1, r8
	ldr r0, [r1, 0x8]
	str r0, [r7, 0x8]
	ldr r0, [r1, 0x10]
	str r0, [r7, 0x10]
	str r1, [r7, 0x14]
	ldr r0, [r1, 0x14]
	str r0, [r7, 0x1C]
	strh r5, [r7, 0x20]
	strh r6, [r7, 0x22]
	ldrb r3, [r7, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r7, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r7, 0
	bl CalcCenterToCornerVec
	mov r0, r8
	ldrh r1, [r0]
	ldr r4, _08000EE0 @ =0xffff0000
	lsrs r0, r4, 16
	cmp r1, r0
	bne _08000F14
	mov r1, r8
	ldr r0, [r1, 0xC]
	str r0, [r7, 0xC]
	ldrh r0, [r0, 0x4]
	lsrs r0, 5
	lsls r0, 24
	lsrs r0, 24
	bl AllocSpriteTiles
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	asrs r1, r4, 16
	cmp r0, r1
	bne _08000EE4
	adds r0, r7, 0
	bl ResetSprite
	movs r0, 0x40
	b _08000F5C
	.align 2, 0
_08000EDC: .4byte gSprites
_08000EE0: .4byte 0xffff0000
_08000EE4:
	ldr r1, _08000F0C @ =0x000003ff
	adds r0, r1, 0
	ands r2, r0
	ldrh r1, [r7, 0x4]
	ldr r0, _08000F10 @ =0xfffffc00
	ands r0, r1
	orrs r0, r2
	strh r0, [r7, 0x4]
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	mov r1, r9
	strb r0, [r1]
	adds r1, r7, 0
	adds r1, 0x40
	movs r0, 0
	strh r0, [r1]
	b _08000F28
	.align 2, 0
_08000F0C: .4byte 0x000003ff
_08000F10: .4byte 0xfffffc00
_08000F14:
	mov r1, r8
	ldrh r0, [r1]
	bl GetSpriteTileStartByTag
	adds r1, r7, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r0, r7, 0
	bl SetSpriteSheetFrameTileNum
_08000F28:
	ldrb r0, [r7, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08000F3C
	adds r0, r7, 0
	bl InitSpriteAffineAnim
_08000F3C:
	mov r0, r8
	ldrh r1, [r0, 0x2]
	ldr r0, _08000F6C @ =0x0000ffff
	cmp r1, r0
	beq _08000F5A
	mov r1, r8
	ldrh r0, [r1, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r7, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
_08000F5A:
	mov r0, r10
_08000F5C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08000F6C: .4byte 0x0000ffff
	thumb_func_end CreateSpriteAt

	thumb_func_start CreateSpriteAndAnimate
CreateSpriteAndAnimate: @ 8000E3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	movs r3, 0
	ldr r5, _08000EAC @ =gSprites
	lsls r1, 16
	mov r12, r1
	lsls r2, 16
	mov r8, r2
_08000E5C:
	lsls r0, r3, 4
	adds r0, r3
	lsls r6, r0, 2
	adds r4, r6, r5
	adds r7, r4, 0
	adds r7, 0x3E
	ldrb r0, [r7]
	lsls r0, 31
	cmp r0, 0
	bne _08000EB4
	mov r0, r9
	str r0, [sp]
	adds r0, r3, 0
	mov r1, r10
	mov r3, r12
	asrs r2, r3, 16
	mov r5, r8
	asrs r3, r5, 16
	bl CreateSpriteAt
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r5, 0x40
	beq _08000EBE
	ldr r1, _08000EB0 @ =0x02020020
	adds r0, r6, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	ldrb r0, [r7]
	lsls r0, 31
	cmp r0, 0
	beq _08000EA8
	adds r0, r4, 0
	bl AnimateSprite
_08000EA8:
	adds r0, r5, 0
	b _08000EC0
	.align 2, 0
_08000EAC: .4byte gSprites
_08000EB0: .4byte 0x02020020
_08000EB4:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _08000E5C
_08000EBE:
	movs r0, 0x40
_08000EC0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CreateSpriteAndAnimate

	thumb_func_start DestroySprite
DestroySprite: @ 8000ED0
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08000F2C
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08000F26
	ldr r0, [r5, 0xC]
	ldrh r2, [r0, 0x4]
	lsrs r2, 5
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r1, r0, 22
	adds r4, r1, r2
	adds r3, r1, 0
	cmp r3, r4
	bcs _08000F26
	ldr r0, _08000F34 @ =gSpriteTileAllocBitmap
	mov r12, r0
	movs r6, 0x7
	movs r7, 0x1
_08000F0A:
	lsrs r2, r3, 3
	add r2, r12
	adds r0, r3, 0
	ands r0, r6
	adds r1, r7, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bcc _08000F0A
_08000F26:
	adds r0, r5, 0
	bl ResetSprite
_08000F2C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000F34: .4byte gSpriteTileAllocBitmap
	thumb_func_end DestroySprite

	thumb_func_start ResetOamRange
ResetOamRange: @ 8000F38
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsrs r3, r0, 24
	cmp r3, r4
	bcs _08000F60
	ldr r6, _08000F68 @ =0x030017ac
	ldr r5, _08000F6C @ =gDummyOamData
_08000F4A:
	lsls r0, r3, 3
	adds r0, r6
	ldr r1, [r5]
	ldr r2, [r5, 0x4]
	str r1, [r0]
	str r2, [r0, 0x4]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r4
	bcc _08000F4A
_08000F60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08000F68: .4byte 0x030017ac
_08000F6C: .4byte gDummyOamData
	thumb_func_end ResetOamRange

	thumb_func_start LoadOam
LoadOam: @ 8000F70
	push {lr}
	ldr r2, _08000F94 @ =gMain
	ldr r1, _08000F98 @ =0x0000043d
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08000F90
	adds r0, r2, 0
	adds r0, 0x3C
	movs r1, 0xE0
	lsls r1, 19
	ldr r2, _08000F9C @ =0x04000100
	bl CpuSet
_08000F90:
	pop {r0}
	bx r0
	.align 2, 0
_08000F94: .4byte gMain
_08000F98: .4byte 0x0000043d
_08000F9C: .4byte 0x04000100
	thumb_func_end LoadOam

	thumb_func_start ClearSpriteCopyRequests
ClearSpriteCopyRequests: @ 80010D4
	push {r4,r5,lr}
	ldr r0, _08001108 @ =gShouldProcessSpriteCopyRequests
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0800110C @ =gSpriteCopyRequestCount
	strb r1, [r0]
	movs r2, 0
	ldr r4, _08001110 @ =gSpriteCopyRequests
	movs r3, 0
	adds r5, r4, 0x4
_080010E8:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	str r3, [r1]
	adds r0, r5
	str r3, [r0]
	strh r3, [r1, 0x8]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080010E8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001108: .4byte gShouldProcessSpriteCopyRequests
_0800110C: .4byte gSpriteCopyRequestCount
_08001110: .4byte gSpriteCopyRequests
	thumb_func_end ClearSpriteCopyRequests

	thumb_func_start ResetOamMatrices
ResetOamMatrices: @ 8001114
	push {r4,lr}
	movs r1, 0
	ldr r4, _0800113C @ =gOamMatrices
	movs r3, 0
	movs r2, 0x80
	lsls r2, 1
_08001120:
	lsls r0, r1, 3
	adds r0, r4
	strh r2, [r0]
	strh r3, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r2, [r0, 0x6]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08001120
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800113C: .4byte gOamMatrices
	thumb_func_end ResetOamMatrices

	thumb_func_start SetOamMatrix
SetOamMatrix: @ 800100C
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 24
	ldr r4, _08001028 @ =gOamMatrices
	lsrs r0, 21
	adds r0, r4
	strh r1, [r0]
	strh r2, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r5, [r0, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001028: .4byte gOamMatrices
	thumb_func_end SetOamMatrix

	thumb_func_start ResetSprite
ResetSprite: @ 8001160
	push {lr}
	ldr r1, _08001170 @ =0x081ef830
	movs r2, 0x44
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_08001170: .4byte 0x081ef830
	thumb_func_end ResetSprite

	thumb_func_start CalcCenterToCornerVec
CalcCenterToCornerVec: @ 8001040
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08001080 @ =0x081ef815
	lsrs r2, 23
	lsrs r1, 21
	adds r2, r1
	adds r0, r2, r4
	ldrb r5, [r0]
	adds r4, 0x1
	adds r2, r4
	ldrb r1, [r2]
	movs r0, 0x2
	ands r3, r0
	cmp r3, 0
	beq _0800106E
	lsls r0, r5, 25
	lsrs r5, r0, 24
	lsls r0, r1, 25
	lsrs r1, r0, 24
_0800106E:
	adds r0, r6, 0
	adds r0, 0x28
	strb r5, [r0]
	adds r0, 0x1
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001080: .4byte 0x081ef815
	thumb_func_end CalcCenterToCornerVec

	thumb_func_start AllocSpriteTiles
AllocSpriteTiles: @ 80011B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0800120E
	ldr r0, _080011FC @ =gReservedSpriteTileCount
	ldrh r3, [r0]
	ldr r0, _08001200 @ =0x000003ff
	cmp r3, r0
	bhi _080011F6
	ldr r7, _08001204 @ =gSpriteTileAllocBitmap
	movs r6, 0x7
	adds r4, r0, 0
	movs r5, 0x1
_080011DA:
	lsrs r2, r3, 3
	adds r2, r7
	adds r0, r3, 0
	ands r0, r6
	adds r1, r5, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	bls _080011DA
_080011F6:
	movs r0, 0
	b _080012C0
	.align 2, 0
_080011FC: .4byte gReservedSpriteTileCount
_08001200: .4byte 0x000003ff
_08001204: .4byte gSpriteTileAllocBitmap
_08001208:
	movs r0, 0x1
	negs r0, r0
	b _080012C0
_0800120E:
	ldr r0, _080012CC @ =gReservedSpriteTileCount
	ldrh r3, [r0]
	ldr r0, _080012D0 @ =gSpriteTileAllocBitmap
	mov r9, r0
	movs r7, 0x7
	movs r6, 0x1
_0800121A:
	lsrs r0, r3, 3
	add r0, r9
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, 0
	beq _0800124E
	movs r5, 0x80
	lsls r5, 3
	ldr r2, _080012D0 @ =gSpriteTileAllocBitmap
_08001232:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r5
	beq _08001208
	lsrs r0, 19
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, 0
	bne _08001232
_0800124E:
	mov r8, r3
	movs r2, 0x1
	cmp r2, r4
	beq _08001288
	movs r1, 0x80
	lsls r1, 3
	mov r12, r1
	ldr r5, _080012D0 @ =gSpriteTileAllocBitmap
_0800125E:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r12
	beq _08001208
	lsrs r0, 19
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r3, 0
	ands r0, r7
	asrs r1, r0
	ands r1, r6
	cmp r1, 0
	bne _08001284
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bne _0800125E
_08001284:
	cmp r2, r4
	bne _0800121A
_08001288:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r3, r0, 16
	asrs r1, r0, 16
	adds r1, r4, r1
	adds r6, r0, 0
	cmp r3, r1
	bge _080012BE
	ldr r0, _080012D0 @ =gSpriteTileAllocBitmap
	mov r8, r0
	movs r7, 0x7
	adds r4, r1, 0
	movs r5, 0x1
_080012A2:
	lsrs r2, r3, 3
	add r2, r8
	adds r1, r3, 0
	ands r1, r7
	adds r0, r5, 0
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _080012A2
_080012BE:
	asrs r0, r6, 16
_080012C0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080012CC: .4byte gReservedSpriteTileCount
_080012D0: .4byte gSpriteTileAllocBitmap
	thumb_func_end AllocSpriteTiles

	thumb_func_start SpriteTileAllocBitmapOp
SpriteTileAllocBitmapOp: @ 80011A0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsrs r0, 19
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	movs r0, 0x7
	ands r2, r0
	adds r4, r2, 0
	movs r5, 0
	cmp r1, 0
	bne _080011D8
	movs r0, 0x1
	lsls r0, r2
	mvns r0, r0
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080011D4 @ =gSpriteTileAllocBitmap
	adds r0, r3, r0
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _08001204
	.align 2, 0
_080011D4: .4byte gSpriteTileAllocBitmap
_080011D8:
	cmp r1, 0x1
	bne _080011F4
	lsls r1, r2
	lsls r0, r1, 24
	lsrs r2, r0, 24
	ldr r0, _080011F0 @ =gSpriteTileAllocBitmap
	adds r0, r3, r0
	ldrb r1, [r0]
	orrs r2, r1
	strb r2, [r0]
	b _08001204
	.align 2, 0
_080011F0: .4byte gSpriteTileAllocBitmap
_080011F4:
	movs r0, 0x80
	lsls r0, 17
	lsls r0, r4
	lsrs r5, r0, 24
	ldr r0, _0800120C @ =gSpriteTileAllocBitmap
	adds r0, r6, r0
	ldrb r0, [r0]
	ands r5, r0
_08001204:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800120C: .4byte gSpriteTileAllocBitmap
	thumb_func_end SpriteTileAllocBitmapOp

	thumb_func_start SpriteCallbackDummy
SpriteCallbackDummy: @ 8001210
	bx lr
	thumb_func_end SpriteCallbackDummy

	thumb_func_start ProcessSpriteCopyRequests
ProcessSpriteCopyRequests: @ 8001214
	push {r4-r7,lr}
	ldr r0, _08001264 @ =gShouldProcessSpriteCopyRequests
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800125C
	movs r4, 0
	ldr r1, _08001268 @ =gSpriteCopyRequestCount
	ldrb r0, [r1]
	cmp r0, 0
	beq _08001256
	ldr r6, _0800126C @ =gSpriteCopyRequests
	adds r7, r6, 0x4
	adds r5, r1, 0
_0800122E:
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r2, r1, r6
	ldr r0, [r2]
	adds r1, r7
	ldr r1, [r1]
	ldrh r2, [r2, 0x8]
	lsrs r2, 1
	bl CpuSet
	ldrb r1, [r5]
	subs r1, 0x1
	strb r1, [r5]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0800122E
_08001256:
	ldr r1, _08001264 @ =gShouldProcessSpriteCopyRequests
	movs r0, 0
	strb r0, [r1]
_0800125C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001264: .4byte gShouldProcessSpriteCopyRequests
_08001268: .4byte gSpriteCopyRequestCount
_0800126C: .4byte gSpriteCopyRequests
	thumb_func_end ProcessSpriteCopyRequests

	thumb_func_start RequestSpriteFrameImageCopy
RequestSpriteFrameImageCopy: @ 80013A4
	push {r4-r6,lr}
	adds r5, r2, 0
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r4, _080013FC @ =gSpriteCopyRequestCount
	ldrb r0, [r4]
	cmp r0, 0x3F
	bhi _080013F4
	ldr r3, _08001400 @ =gSpriteCopyRequests
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	lsls r2, 3
	adds r2, r5
	ldr r1, [r2]
	str r1, [r0]
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0x4
	adds r1, r0
	lsls r0, r6, 5
	ldr r5, _08001404 @ =0x06010000
	adds r0, r5
	str r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x8]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_080013F4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080013FC: .4byte gSpriteCopyRequestCount
_08001400: .4byte gSpriteCopyRequests
_08001404: .4byte 0x06010000
	thumb_func_end RequestSpriteFrameImageCopy

	thumb_func_start RequestSpriteCopy
RequestSpriteCopy: @ 80012D4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r3, _0800131C @ =gSpriteCopyRequestCount
	ldrb r0, [r3]
	cmp r0, 0x3F
	bhi _08001314
	ldr r2, _08001320 @ =gSpriteCopyRequests
	adds r1, r0, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	str r4, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0x4
	adds r0, r1
	str r5, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x8]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_08001314:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800131C: .4byte gSpriteCopyRequestCount
_08001320: .4byte gSpriteCopyRequests
	thumb_func_end RequestSpriteCopy

	thumb_func_start CopyFromSprites
CopyFromSprites: @ 8001324
	push {r4,lr}
	adds r1, r0, 0
	ldr r3, _08001344 @ =gSprites
	movs r2, 0
	ldr r4, _08001348 @ =0x000010ff
_0800132E:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, r4
	bls _0800132E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001344: .4byte gSprites
_08001348: .4byte 0x000010ff
	thumb_func_end CopyFromSprites

	thumb_func_start CopyToSprites
CopyToSprites: @ 800134C
	push {r4,lr}
	adds r1, r0, 0
	ldr r3, _0800136C @ =gSprites
	movs r2, 0
	ldr r4, _08001370 @ =0x000010ff
_08001356:
	ldrb r0, [r1]
	strb r0, [r3]
	adds r1, 0x1
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, r4
	bls _08001356
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800136C: .4byte gSprites
_08001370: .4byte 0x000010ff
	thumb_func_end CopyToSprites

	thumb_func_start ResetAllSprites
ResetAllSprites: @ 80014A8
	push {r4,r5,lr}
	movs r4, 0
_080014AC:
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r5, _080014E0 @ =gSprites
	adds r0, r5
	bl ResetSprite
	ldr r0, _080014E4 @ =gSpriteOrder
	adds r0, r4, r0
	strb r4, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3F
	bls _080014AC
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl ResetSprite
	bl sub_814A590
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080014E0: .4byte gSprites
_080014E4: .4byte gSpriteOrder
	thumb_func_end ResetAllSprites

	thumb_func_start FreeSpriteTiles
FreeSpriteTiles: @ 80013B4
	push {lr}
	ldr r2, [r0, 0x14]
	ldrh r1, [r2]
	ldr r0, _080013CC @ =0x0000ffff
	cmp r1, r0
	beq _080013C6
	adds r0, r1, 0
	bl FreeSpriteTilesByTag
_080013C6:
	pop {r0}
	bx r0
	.align 2, 0
_080013CC: .4byte 0x0000ffff
	thumb_func_end FreeSpriteTiles

	thumb_func_start FreeSpritePalette
FreeSpritePalette: @ 80013D0
	push {lr}
	ldr r0, [r0, 0x14]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	thumb_func_end FreeSpritePalette

	thumb_func_start FreeSpriteOamMatrix
FreeSpriteOamMatrix: @ 80013E0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08001406
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_08001406:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FreeSpriteOamMatrix

	thumb_func_start DestroySpriteAndFreeResources
DestroySpriteAndFreeResources: @ 800140C
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteTiles
	adds r0, r4, 0
	bl FreeSpritePalette
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end DestroySpriteAndFreeResources

	thumb_func_start sub_800142C
sub_800142C: @ 800142C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp]
	str r1, [sp, 0x4]
	lsls r3, 16
	lsrs r6, r3, 16
	adds r3, r2, 0
	ldr r0, _080014F4 @ =gMain
	mov r12, r0
	adds r0, 0x38
	ldrb r1, [r0]
	lsls r2, r1, 3
	mov r0, r12
	adds r0, 0x3C
	adds r4, r2, r0
	movs r0, 0x80
	ands r1, r0
	cmp r1, 0
	bne _080014E2
	ldrh r1, [r3]
	adds r0, r1, 0x1
	lsls r0, 16
	cmp r0, 0
	beq _080014E2
	ldr r5, _080014F8 @ =0x081ef8a8
	ldrh r2, [r5]
	str r2, [sp, 0x8]
	ldrh r0, [r5, 0x4]
	ands r0, r6
	lsls r0, 8
	mov r10, r0
	ldrh r7, [r5, 0x10]
	ands r7, r6
	ldrh r0, [r5, 0x6]
	mov r9, r0
	ldrh r0, [r5, 0xA]
	ands r0, r6
	lsls r0, 4
	mov r8, r0
	mov r6, r12
_08001484:
	ldr r0, [sp, 0x8]
	ands r0, r1
	ldr r2, [sp, 0x4]
	adds r1, r2
	ldrh r2, [r5, 0x2]
	ands r1, r2
	orrs r0, r1
	mov r1, r10
	orrs r0, r1
	strh r0, [r4]
	ldrh r2, [r3, 0x2]
	mov r0, r9
	ands r0, r2
	ldr r1, [sp]
	adds r2, r1
	ldrh r1, [r5, 0x8]
	ands r2, r1
	orrs r0, r2
	mov r2, r8
	orrs r0, r2
	strh r0, [r4, 0x2]
	ldrh r2, [r3, 0x4]
	ldrh r0, [r5, 0xC]
	ands r0, r2
	ldr r1, [sp, 0x2C]
	adds r2, r1
	ldrh r1, [r5, 0xE]
	ands r2, r1
	orrs r0, r2
	orrs r0, r7
	strh r0, [r4, 0x4]
	adds r4, 0x8
	adds r0, r6, 0
	adds r0, 0x38
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	adds r3, 0x6
	movs r0, 0x80
	ands r1, r0
	cmp r1, 0
	bne _080014E2
	ldrh r1, [r3]
	adds r0, r1, 0x1
	lsls r0, 16
	cmp r0, 0
	bne _08001484
_080014E2:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014F4: .4byte gMain
_080014F8: .4byte 0x081ef8a8
	thumb_func_end sub_800142C

	thumb_func_start AnimateSprite
AnimateSprite: @ 80014FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, _08001538 @ =0x081ef8bc
	adds r5, r4, 0
	adds r5, 0x3F
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	adds r0, r2
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	ldr r0, _0800153C @ =gAffineAnimsDisabled
	ldrb r0, [r0]
	cmp r0, 0
	bne _08001532
	ldr r0, _08001540 @ =0x081ef8c4
	ldrb r1, [r5]
	lsls r1, 28
	lsrs r1, 31
	lsls r1, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
_08001532:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001538: .4byte 0x081ef8bc
_0800153C: .4byte gAffineAnimsDisabled
_08001540: .4byte 0x081ef8c4
	thumb_func_end AnimateSprite

	thumb_func_start BeginAnim
BeginAnim: @ 8001678
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x2B
	movs r2, 0
	strb r2, [r3]
	adds r5, r4, 0
	adds r5, 0x3F
	ldrb r1, [r5]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	adds r0, r4, 0
	adds r0, 0x2D
	strb r2, [r0]
	adds r2, r4, 0
	adds r2, 0x2A
	ldrb r1, [r2]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0]
	mov r9, r0
	lsls r0, 16
	mov r8, r0
	asrs r1, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0800175C
	ldrb r1, [r5]
	subs r0, 0x4
	ands r0, r1
	strb r0, [r5]
	ldrb r1, [r2]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r0, 10
	lsrs r3, r1, 26
	lsls r1, r0, 9
	lsrs r7, r1, 31
	lsls r0, 8
	lsrs r6, r0, 31
	cmp r3, 0
	beq _080016F4
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080016F4:
	adds r2, r4, 0
	adds r2, 0x2C
	movs r0, 0x3F
	ands r3, r0
	ldrb r1, [r2]
	subs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800171E
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SetSpriteOamFlipBits
_0800171E:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800174C
	adds r0, r4, 0
	adds r0, 0x40
	ldrh r1, [r0]
	add r1, r9
	ldr r2, _08001744 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08001748 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	b _0800175C
	.align 2, 0
_08001744: .4byte 0x000003ff
_08001748: .4byte 0xfffffc00
_0800174C:
	mov r1, r8
	lsrs r0, r1, 16
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldr r2, [r4, 0xC]
	bl RequestSpriteFrameImageCopy
_0800175C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BeginAnim

	thumb_func_start ContinueAnim
ContinueAnim: @ 8001768
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	beq _080017B8
	adds r0, r4, 0
	bl DecrementAnimDelayCounter
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r0, 9
	lsrs r3, r1, 31
	lsls r0, 8
	lsrs r2, r0, 31
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080017FE
	adds r0, r4, 0
	adds r1, r3, 0
	bl SetSpriteOamFlipBits
	b _080017FE
_080017B8:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080017FE
	adds r2, r4, 0
	adds r2, 0x2B
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	movs r2, 0x3
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bge _080017EE
	adds r0, 0x3
	lsls r0, 16
	lsrs r2, r0, 16
_080017EE:
	ldr r0, _08001804 @ =0x081ef8cc
	lsls r1, r2, 16
	asrs r1, 14
	adds r1, r0
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
_080017FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001804: .4byte 0x081ef8cc
	thumb_func_end ContinueAnim

	thumb_func_start AnimCmd_frame
AnimCmd_frame: @ 8001808
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r7, [r0]
	mov r8, r7
	ldr r0, [r0]
	lsls r1, r0, 10
	lsrs r3, r1, 26
	lsls r1, r0, 9
	lsrs r6, r1, 31
	lsls r0, 8
	lsrs r5, r0, 31
	cmp r3, 0
	beq _08001842
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_08001842:
	adds r2, r4, 0
	adds r2, 0x2C
	movs r0, 0x3F
	ands r3, r0
	ldrb r1, [r2]
	subs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800186C
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl SetSpriteOamFlipBits
_0800186C:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800189C
	adds r0, r4, 0
	adds r0, 0x40
	ldrh r1, [r0]
	adds r1, r7
	ldr r2, _08001894 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08001898 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	b _080018AA
	.align 2, 0
_08001894: .4byte 0x000003ff
_08001898: .4byte 0xfffffc00
_0800189C:
	mov r0, r8
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldr r2, [r4, 0xC]
	bl RequestSpriteFrameImageCopy
_080018AA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_frame

	thumb_func_start AnimCmd_end
AnimCmd_end: @ 80018B4
	adds r2, r0, 0
	adds r2, 0x2B
	ldrb r1, [r2]
	subs r1, 0x1
	strb r1, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end AnimCmd_end

	thumb_func_start AnimCmd_jump
AnimCmd_jump: @ 80018CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x2A
	ldrb r1, [r3]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r2, r4, 0
	adds r2, 0x2B
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	strb r0, [r2]
	ldrb r0, [r3]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r7, [r1]
	mov r8, r7
	ldr r0, [r1]
	lsls r1, r0, 10
	lsrs r3, r1, 26
	lsls r1, r0, 9
	lsrs r6, r1, 31
	lsls r0, 8
	lsrs r5, r0, 31
	cmp r3, 0
	beq _08001920
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_08001920:
	adds r2, r4, 0
	adds r2, 0x2C
	movs r0, 0x3F
	ands r3, r0
	ldrb r1, [r2]
	subs r0, 0x7F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800194A
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl SetSpriteOamFlipBits
_0800194A:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800197C
	adds r0, r4, 0
	adds r0, 0x40
	ldrh r1, [r0]
	adds r1, r7
	ldr r2, _08001974 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r4, 0x4]
	ldr r0, _08001978 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	b _0800198A
	.align 2, 0
_08001974: .4byte 0x000003ff
_08001978: .4byte 0xfffffc00
_0800197C:
	mov r0, r8
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldr r2, [r4, 0xC]
	bl RequestSpriteFrameImageCopy
_0800198A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_jump

	thumb_func_start AnimCmd_loop
AnimCmd_loop: @ 8001994
	push {lr}
	adds r1, r0, 0
	adds r0, 0x2D
	ldrb r0, [r0]
	cmp r0, 0
	beq _080019A8
	adds r0, r1, 0
	bl ContinueAnimLoop
	b _080019AE
_080019A8:
	adds r0, r1, 0
	bl BeginAnimLoop
_080019AE:
	pop {r0}
	bx r0
	thumb_func_end AnimCmd_loop

	thumb_func_start BeginAnimLoop
BeginAnimLoop: @ 80019B4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r4, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r0, 10
	lsrs r0, 26
	adds r1, r4, 0
	adds r1, 0x2D
	strb r0, [r1]
	adds r0, r4, 0
	bl JumpToTopOfAnimLoop
	adds r0, r4, 0
	bl ContinueAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end BeginAnimLoop

	thumb_func_start ContinueAnimLoop
ContinueAnimLoop: @ 80019EC
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0
	adds r1, 0x2D
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl JumpToTopOfAnimLoop
	adds r0, r4, 0
	bl ContinueAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ContinueAnimLoop

	thumb_func_start JumpToTopOfAnimLoop
JumpToTopOfAnimLoop: @ 8001A0C
	push {r4-r7,lr}
	mov r12, r0
	adds r0, 0x2D
	ldrb r0, [r0]
	cmp r0, 0
	beq _08001A78
	mov r3, r12
	adds r3, 0x2B
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	mov r5, r12
	adds r5, 0x2A
	ldrb r1, [r5]
	mov r2, r12
	ldr r0, [r2, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r3]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	subs r0, 0x4
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r1, 0x3
	negs r1, r1
	adds r4, r3, 0
	cmp r0, r1
	beq _08001A72
	adds r6, r1, 0
	adds r2, r4, 0
_08001A4C:
	ldrb r0, [r2]
	cmp r0, 0
	beq _08001A72
	subs r0, 0x1
	strb r0, [r3]
	ldrb r1, [r5]
	mov r7, r12
	ldr r0, [r7, 0x8]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	subs r0, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r6
	bne _08001A4C
_08001A72:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
_08001A78:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end JumpToTopOfAnimLoop

	thumb_func_start BeginAffineAnim
BeginAffineAnim: @ 8001A80
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	ldrb r0, [r6, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08001AEA
	ldr r0, [r6, 0x10]
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _08001AF4 @ =0x00007fff
	cmp r1, r0
	beq _08001AEA
	adds r0, r6, 0
	bl GetSpriteMatrixNum
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl AffineAnimStateRestartAnim
	mov r5, sp
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldr r1, _08001AF8 @ =0x03000180
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r5, 0x5]
	strb r1, [r0, 0x2]
_08001AEA:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001AF4: .4byte 0x00007fff
_08001AF8: .4byte 0x03000180
	thumb_func_end BeginAffineAnim

	thumb_func_start ContinueAffineAnim
ContinueAffineAnim: @ 8001AFC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08001B82
	adds r0, r4, 0
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	ldr r1, _08001B34 @ =0x03000180
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3, 0x2]
	cmp r0, 0
	beq _08001B38
	adds r0, r2, 0
	adds r1, r4, 0
	bl AffineAnimDelay
	b _08001B82
	.align 2, 0
_08001B34: .4byte 0x03000180
_08001B38:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08001B82
	ldrb r0, [r3, 0x1]
	adds r0, 0x1
	strb r0, [r3, 0x1]
	ldrb r0, [r3]
	ldr r1, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r3, 0x1]
	ldr r0, [r0]
	lsls r1, 3
	adds r1, r0
	movs r2, 0x3
	movs r0, 0
	ldrsh r1, [r1, r0]
	ldr r0, _08001B88 @ =0x00007ffc
	cmp r1, r0
	ble _08001B70
	ldr r2, _08001B8C @ =0xffff8003
	adds r0, r1, r2
	lsls r0, 16
	lsrs r2, r0, 16
_08001B70:
	ldr r0, _08001B90 @ =0x081ef8dc
	lsls r1, r2, 16
	asrs r1, 14
	adds r1, r0
	ldr r2, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r2
_08001B82:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001B88: .4byte 0x00007ffc
_08001B8C: .4byte 0xffff8003
_08001B90: .4byte 0x081ef8dc
	thumb_func_end ContinueAffineAnim

	thumb_func_start AffineAnimDelay
AffineAnimDelay: @ 8001B94
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl DecrementAffineAnimDelayCounter
	lsls r0, 24
	cmp r0, 0
	bne _08001BBE
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
_08001BBE:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end AffineAnimDelay

	thumb_func_start AffineAnimCmd_loop
AffineAnimCmd_loop: @ 8001BC8
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08001BEC @ =0x03000180
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x3]
	cmp r0, 0
	beq _08001BF0
	adds r0, r2, 0
	adds r1, r3, 0
	bl ContinueAffineAnimLoop
	b _08001BF8
	.align 2, 0
_08001BEC: .4byte 0x03000180
_08001BF0:
	adds r0, r2, 0
	adds r1, r3, 0
	bl BeginAffineAnimLoop
_08001BF8:
	pop {r0}
	bx r0
	thumb_func_end AffineAnimCmd_loop

	thumb_func_start BeginAffineAnimLoop
BeginAffineAnimLoop: @ 8001BFC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08001C34 @ =0x03000180
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r1
	ldrb r2, [r3]
	ldr r1, [r4, 0x10]
	lsls r2, 2
	adds r2, r1
	ldrb r1, [r3, 0x1]
	ldr r2, [r2]
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0x2]
	strb r1, [r3, 0x3]
	adds r1, r4, 0
	bl JumpToTopOfAffineAnimLoop
	adds r0, r4, 0
	bl ContinueAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001C34: .4byte 0x03000180
	thumb_func_end BeginAffineAnimLoop

	thumb_func_start ContinueAffineAnimLoop
ContinueAffineAnimLoop: @ 8001C38
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08001C64 @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x3]
	subs r2, 0x1
	strb r2, [r1, 0x3]
	adds r1, r4, 0
	bl JumpToTopOfAffineAnimLoop
	adds r0, r4, 0
	bl ContinueAffineAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001C64: .4byte 0x03000180
	thumb_func_end ContinueAffineAnimLoop

	thumb_func_start JumpToTopOfAffineAnimLoop
JumpToTopOfAffineAnimLoop: @ 8001C68
	push {r4-r7,lr}
	mov r12, r1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08001C8C @ =0x03000180
	lsls r3, r5, 1
	adds r0, r3, r5
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x3]
	adds r6, r1, 0
	cmp r0, 0
	beq _08001CC8
	ldrb r0, [r2, 0x1]
	subs r0, 0x1
	strb r0, [r2, 0x1]
	adds r4, r3, 0
	b _08001C98
	.align 2, 0
_08001C8C: .4byte 0x03000180
_08001C90:
	cmp r2, 0
	beq _08001CBC
	subs r0, r2, 0x1
	strb r0, [r3, 0x1]
_08001C98:
	adds r0, r4, r5
	lsls r0, 2
	adds r3, r0, r6
	ldrb r0, [r3]
	mov r2, r12
	ldr r1, [r2, 0x10]
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r3, 0x1]
	ldr r1, [r0]
	lsls r0, r2, 3
	adds r0, r1
	subs r0, 0x8
	movs r7, 0
	ldrsh r1, [r0, r7]
	ldr r0, _08001CD0 @ =0x00007ffd
	cmp r1, r0
	bne _08001C90
_08001CBC:
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x1]
	subs r0, 0x1
	strb r0, [r1, 0x1]
_08001CC8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CD0: .4byte 0x00007ffd
	thumb_func_end JumpToTopOfAffineAnimLoop

	thumb_func_start AffineAnimCmd_jump
AffineAnimCmd_jump: @ 8001CD4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08001D1C @ =0x03000180
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrb r2, [r4]
	ldr r0, [r1, 0x10]
	lsls r2, 2
	adds r2, r0
	ldrb r0, [r4, 0x1]
	ldr r2, [r2]
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x2]
	strb r0, [r4, 0x1]
	mov r6, sp
	adds r0, r5, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r5, 0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldrb r0, [r6, 0x5]
	strb r0, [r4, 0x2]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001D1C: .4byte 0x03000180
	thumb_func_end AffineAnimCmd_jump

	thumb_func_start AffineAnimCmd_end
AffineAnimCmd_end: @ 8001D20
	push {lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r3, 0
	str r2, [sp]
	str r3, [sp, 0x4]
	adds r1, 0x3F
	ldrb r2, [r1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r1]
	ldr r2, _08001D58 @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	subs r2, 0x1
	strb r2, [r1, 0x1]
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_08001D58: .4byte 0x03000180
	thumb_func_end AffineAnimCmd_end

	thumb_func_start AffineAnimCmd_frame
AffineAnimCmd_frame: @ 8001D5C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r0, r4, 0
	mov r2, sp
	bl GetAffineAnimFrame
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrame
	ldr r1, _08001D90 @ =0x03000180
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r5, 0x5]
	strb r1, [r0, 0x2]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001D90: .4byte 0x03000180
	thumb_func_end AffineAnimCmd_frame

	thumb_func_start CopyOamMatrix
CopyOamMatrix: @ 8001D94
	lsls r0, 24
	ldr r2, _08001DB0 @ =gOamMatrices
	lsrs r0, 21
	adds r0, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, 0x2]
	strh r2, [r0, 0x2]
	ldrh r2, [r1, 0x4]
	strh r2, [r0, 0x4]
	ldrh r1, [r1, 0x6]
	strh r1, [r0, 0x6]
	bx lr
	.align 2, 0
_08001DB0: .4byte gOamMatrices
	thumb_func_end CopyOamMatrix

	thumb_func_start GetSpriteMatrixNum
GetSpriteMatrixNum: @ 8001DB4
	push {lr}
	adds r2, r0, 0
	movs r3, 0
	ldrb r0, [r2, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08001DCE
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r3, r0, 27
_08001DCE:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end GetSpriteMatrixNum

	thumb_func_start SetSpriteOamFlipBits
SetSpriteOamFlipBits: @ 8001DD4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldrb r6, [r0, 0x3]
	lsls r3, r6, 26
	lsrs r3, 27
	movs r4, 0x7
	ands r3, r4
	lsls r3, 1
	subs r4, 0x46
	mov r8, r4
	mov r5, r8
	ands r5, r6
	orrs r5, r3
	strb r5, [r0, 0x3]
	lsls r4, r5, 26
	lsrs r4, 27
	movs r6, 0x3F
	adds r6, r0
	mov r12, r6
	ldrb r3, [r6]
	lsls r3, 31
	lsrs r3, 31
	eors r1, r3
	movs r6, 0x1
	ands r1, r6
	lsls r1, 3
	orrs r4, r1
	lsls r4, 1
	mov r3, r8
	ands r3, r5
	orrs r3, r4
	strb r3, [r0, 0x3]
	lsls r4, r3, 26
	lsrs r4, 27
	mov r5, r12
	ldrb r1, [r5]
	lsls r1, 30
	lsrs r1, 31
	eors r2, r1
	ands r2, r6
	lsls r2, 4
	orrs r4, r2
	lsls r4, 1
	mov r6, r8
	ands r3, r6
	orrs r3, r4
	strb r3, [r0, 0x3]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end SetSpriteOamFlipBits

	thumb_func_start AffineAnimStateRestartAnim
AffineAnimStateRestartAnim: @ 8001E48
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08001E60 @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	strb r0, [r1, 0x3]
	bx lr
	.align 2, 0
_08001E60: .4byte 0x03000180
	thumb_func_end AffineAnimStateRestartAnim

	thumb_func_start AffineAnimStateStartAnim
AffineAnimStateStartAnim: @ 8001E64
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08001E88 @ =0x03000180
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	movs r3, 0
	strb r1, [r2]
	strb r3, [r2, 0x1]
	strb r3, [r2, 0x2]
	strb r3, [r2, 0x3]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r2, 0x4]
	strh r0, [r2, 0x6]
	strh r3, [r2, 0x8]
	bx lr
	.align 2, 0
_08001E88: .4byte 0x03000180
	thumb_func_end AffineAnimStateStartAnim

	thumb_func_start AffineAnimStateReset
AffineAnimStateReset: @ 8001E8C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08001EB0 @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r0, [r1, 0x2]
	strb r0, [r1, 0x3]
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r1, 0x4]
	strh r2, [r1, 0x6]
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_08001EB0: .4byte 0x03000180
	thumb_func_end AffineAnimStateReset

	thumb_func_start ApplyAffineAnimFrameAbsolute
ApplyAffineAnimFrameAbsolute: @ 8001EB4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08001ED4 @ =0x03000180
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r1]
	strh r0, [r2, 0x4]
	ldrh r0, [r1, 0x2]
	strh r0, [r2, 0x6]
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	strh r0, [r2, 0x8]
	bx lr
	.align 2, 0
_08001ED4: .4byte 0x03000180
	thumb_func_end ApplyAffineAnimFrameAbsolute

	thumb_func_start DecrementAnimDelayCounter
DecrementAnimDelayCounter: @ 8001ED8
	push {lr}
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _08001EFC
	lsls r0, r2, 26
	lsrs r0, 26
	subs r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	movs r1, 0x40
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
_08001EFC:
	pop {r0}
	bx r0
	thumb_func_end DecrementAnimDelayCounter

	thumb_func_start DecrementAffineAnimDelayCounter
DecrementAffineAnimDelayCounter: @ 8001F00
	push {lr}
	lsls r1, 24
	lsrs r2, r1, 24
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08001F24
	ldr r0, _08001F2C @ =0x03000180
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x2]
	subs r0, 0x1
	strb r0, [r1, 0x2]
_08001F24:
	ldrb r0, [r3]
	lsrs r0, 7
	pop {r1}
	bx r1
	.align 2, 0
_08001F2C: .4byte 0x03000180
	thumb_func_end DecrementAffineAnimDelayCounter

	thumb_func_start ApplyAffineAnimFrameRelativeAndUpdateMatrix
ApplyAffineAnimFrameRelativeAndUpdateMatrix: @ 8001F30
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08001FB8 @ =0x03000180
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrh r0, [r1]
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r4, 0x4]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x6]
	adds r0, r2
	strh r0, [r4, 0x6]
	ldrb r0, [r1, 0x4]
	lsls r0, 8
	ldrh r1, [r4, 0x8]
	adds r0, r1
	ldr r2, _08001FBC @ =0xffffff00
	adds r1, r2, 0
	ands r0, r1
	strh r0, [r4, 0x8]
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	bl ConvertScaleParam
	lsls r0, 16
	lsrs r0, 16
	ldr r6, _08001FC0 @ =0xffff0000
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	bl ConvertScaleParam
	lsls r0, 16
	ldr r2, _08001FC4 @ =0x0000ffff
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldrh r1, [r4, 0x8]
	ldr r0, [sp, 0x4]
	ands r0, r6
	orrs r0, r1
	str r0, [sp, 0x4]
	add r4, sp, 0x8
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	adds r0, r5, 0
	adds r1, r4, 0
	bl CopyOamMatrix
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001FB8: .4byte 0x03000180
_08001FBC: .4byte 0xffffff00
_08001FC0: .4byte 0xffff0000
_08001FC4: .4byte 0x0000ffff
	thumb_func_end ApplyAffineAnimFrameRelativeAndUpdateMatrix

	thumb_func_start ConvertScaleParam
ConvertScaleParam: @ 8001FC8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 9
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end ConvertScaleParam

	thumb_func_start GetAffineAnimFrame
GetAffineAnimFrame: @ 8001FE0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08002048 @ =0x03000180
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r3, [r3]
	lsls r0, 3
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r3, [r3]
	lsls r0, 3
	adds r0, r3
	ldrh r0, [r0, 0x2]
	strh r0, [r2, 0x2]
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r3, [r3]
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x4]
	strb r0, [r2, 0x4]
	ldrb r3, [r4]
	ldr r0, [r1, 0x10]
	lsls r3, 2
	adds r3, r0
	ldrb r0, [r4, 0x1]
	ldr r1, [r3]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x5]
	strb r0, [r2, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002048: .4byte 0x03000180
	thumb_func_end GetAffineAnimFrame

	thumb_func_start ApplyAffineAnimFrame
ApplyAffineAnimFrame: @ 800204C
	push {r4,lr}
	sub sp, 0x8
	adds r2, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrb r0, [r2, 0x5]
	cmp r0, 0
	beq _08002072
	subs r0, 0x1
	strb r0, [r2, 0x5]
	adds r0, r4, 0
	adds r1, r2, 0
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
	b _08002082
_08002072:
	adds r0, r4, 0
	adds r1, r2, 0
	bl ApplyAffineAnimFrameAbsolute
	adds r0, r4, 0
	mov r1, sp
	bl ApplyAffineAnimFrameRelativeAndUpdateMatrix
_08002082:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ApplyAffineAnimFrame

	thumb_func_start StartSpriteAnim
StartSpriteAnim: @ 8001F58
	adds r2, r0, 0
	adds r2, 0x2A
	strb r1, [r2]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	movs r2, 0x11
	negs r2, r2
	ands r1, r2
	strb r1, [r0]
	bx lr
	thumb_func_end StartSpriteAnim

	thumb_func_start StartSpriteAnimIfDifferent
StartSpriteAnimIfDifferent: @ 8001F70
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r1
	beq _08001F86
	adds r0, r2, 0
	bl StartSpriteAnim
_08001F86:
	pop {r0}
	bx r0
	thumb_func_end StartSpriteAnimIfDifferent

	thumb_func_start SeekSpriteAnim
SeekSpriteAnim: @ 8001F8C
	push {r4-r7,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r4, r3, 0
	adds r4, 0x2C
	ldrb r0, [r4]
	lsls r0, 25
	lsrs r6, r0, 31
	subs r1, 0x1
	adds r0, r3, 0
	adds r0, 0x2B
	strb r1, [r0]
	ldrb r1, [r4]
	movs r7, 0x40
	negs r7, r7
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r4]
	adds r2, r3, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	movs r5, 0x41
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r4]
	adds r0, r3, 0
	bl ContinueAnim
	ldrb r2, [r4]
	movs r0, 0x3F
	ands r0, r2
	cmp r0, 0
	beq _08001FF4
	lsls r0, r2, 26
	lsrs r0, 26
	adds r0, 0x1
	movs r1, 0x3F
	ands r0, r1
	adds r1, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
_08001FF4:
	lsls r2, r6, 6
	ldrb r1, [r4]
	adds r0, r5, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end SeekSpriteAnim

	thumb_func_start StartSpriteAffineAnim
StartSpriteAffineAnim: @ 8002008
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl AffineAnimStateStartAnim
	adds r5, 0x3F
	ldrb r0, [r5]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end StartSpriteAffineAnim

	thumb_func_start StartSpriteAffineAnimIfDifferent
StartSpriteAffineAnimIfDifferent: @ 8002034
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08002064 @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, r4
	beq _0800205C
	adds r0, r5, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
_0800205C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002064: .4byte 0x03000180
	thumb_func_end StartSpriteAffineAnimIfDifferent

	thumb_func_start ChangeSpriteAffineAnim
ChangeSpriteAffineAnim: @ 8002068
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800209C @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strb r4, [r1]
	adds r5, 0x3F
	ldrb r0, [r5]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800209C: .4byte 0x03000180
	thumb_func_end ChangeSpriteAffineAnim

	thumb_func_start ChangeSpriteAffineAnimIfDifferent
ChangeSpriteAffineAnimIfDifferent: @ 80020A0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl GetSpriteMatrixNum
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080020D0 @ =0x03000180
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, r4
	beq _080020C8
	adds r0, r5, 0
	adds r1, r4, 0
	bl ChangeSpriteAffineAnim
_080020C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080020D0: .4byte 0x03000180
	thumb_func_end ChangeSpriteAffineAnimIfDifferent

	thumb_func_start SetSpriteSheetFrameTileNum
SetSpriteSheetFrameTileNum: @ 80020D4
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08002120
	adds r0, r3, 0
	adds r0, 0x2A
	ldrb r1, [r0]
	ldr r0, [r3, 0x8]
	lsls r1, 2
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 2
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _08002108
	movs r2, 0
_08002108:
	adds r0, r3, 0
	adds r0, 0x40
	ldrh r1, [r0]
	adds r1, r2
	ldr r2, _08002124 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _08002128 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
_08002120:
	pop {r0}
	bx r0
	.align 2, 0
_08002124: .4byte 0x000003ff
_08002128: .4byte 0xfffffc00
	thumb_func_end SetSpriteSheetFrameTileNum

	thumb_func_start ResetAffineAnimData
ResetAffineAnimData: @ 8002260
	push {r4,lr}
	ldr r1, _0800228C @ =gAffineAnimsDisabled
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08002290 @ =gOamMatrixAllocBitmap
	movs r0, 0
	str r0, [r1]
	bl ResetOamMatrices
	movs r4, 0
_08002274:
	adds r0, r4, 0
	bl AffineAnimStateReset
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08002274
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800228C: .4byte gAffineAnimsDisabled
_08002290: .4byte gOamMatrixAllocBitmap
	thumb_func_end ResetAffineAnimData

	thumb_func_start AllocOamMatrix
AllocOamMatrix: @ 8002160
	push {r4,lr}
	movs r2, 0
	movs r1, 0x1
	ldr r0, _08002180 @ =gOamMatrixAllocBitmap
	ldr r4, [r0]
	adds r3, r0, 0
_0800216C:
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08002184
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r0, r2, 0
	b _08002192
	.align 2, 0
_08002180: .4byte gOamMatrixAllocBitmap
_08002184:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 1
	cmp r2, 0x1F
	bls _0800216C
	movs r0, 0xFF
_08002192:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocOamMatrix

	thumb_func_start FreeOamMatrix
FreeOamMatrix: @ 8002198
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0
	movs r1, 0x1
	ldr r3, _080021D4 @ =gOamMatrixAllocBitmap
	cmp r0, r2
	bcs _080021B6
_080021AA:
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 1
	cmp r0, r2
	bcc _080021AA
_080021B6:
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	movs r1, 0x80
	lsls r1, 1
	str r1, [sp]
	adds r0, r2, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080021D4: .4byte gOamMatrixAllocBitmap
	thumb_func_end FreeOamMatrix

	thumb_func_start InitSpriteAffineAnim
InitSpriteAffineAnim: @ 80021D8
	push {r4,r5,lr}
	adds r4, r0, 0
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	beq _08002220
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1F
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl AffineAnimStateReset
_08002220:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end InitSpriteAffineAnim

	thumb_func_start SetOamMatrixRotationScaling
SetOamMatrixRotationScaling: @ 8002228
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r6, r0, 0
	adds r0, r1, 0
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 16
	asrs r0, 16
	bl ConvertScaleParam
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080022A0 @ =0xffff0000
	mov r8, r1
	ldr r1, [sp]
	mov r2, r8
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl ConvertScaleParam
	lsls r0, 16
	ldr r2, _080022A4 @ =0x0000ffff
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r0, [sp, 0x4]
	mov r1, r8
	ands r0, r1
	orrs r0, r5
	str r0, [sp, 0x4]
	add r4, sp, 0x8
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	adds r0, r6, 0
	adds r1, r4, 0
	bl CopyOamMatrix
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080022A0: .4byte 0xffff0000
_080022A4: .4byte 0x0000ffff
	thumb_func_end SetOamMatrixRotationScaling

	thumb_func_start LoadSpriteSheet
LoadSpriteSheet: @ 80022A8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	lsrs r0, 5
	bl AllocSpriteTiles
	lsls r4, r0, 16
	asrs r6, r4, 16
	cmp r6, 0
	blt _080022E4
	ldrh r0, [r5, 0x6]
	lsrs r4, 16
	ldrh r2, [r5, 0x4]
	lsrs r2, 5
	adds r1, r4, 0
	bl AllocSpriteTileRange
	ldr r0, [r5]
	lsls r1, r6, 5
	ldr r2, _080022E0 @ =0x06010000
	adds r1, r2
	ldrh r2, [r5, 0x4]
	lsrs r2, 1
	bl CpuSet
	adds r0, r4, 0
	b _080022E6
	.align 2, 0
_080022E0: .4byte 0x06010000
_080022E4:
	movs r0, 0
_080022E6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end LoadSpriteSheet

	thumb_func_start LoadSpriteSheets
LoadSpriteSheets: @ 80022EC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r0, [r5]
	cmp r0, 0
	beq _08002310
_080022F8:
	lsls r0, r4, 3
	adds r0, r5, r0
	bl LoadSpriteSheet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 3
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	bne _080022F8
_08002310:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadSpriteSheets

	thumb_func_start AllocTilesForSpriteSheet
AllocTilesForSpriteSheet: @ 8002318
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	lsrs r0, 5
	bl AllocSpriteTiles
	lsls r4, r0, 16
	cmp r4, 0
	blt _0800233C
	ldrh r0, [r5, 0x6]
	lsrs r4, 16
	ldrh r2, [r5, 0x4]
	lsrs r2, 5
	adds r1, r4, 0
	bl AllocSpriteTileRange
	adds r0, r4, 0
	b _0800233E
_0800233C:
	movs r0, 0
_0800233E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end AllocTilesForSpriteSheet

	thumb_func_start AllocTilesForSpriteSheets
AllocTilesForSpriteSheets: @ 8002344
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r0, [r5]
	cmp r0, 0
	beq _08002368
_08002350:
	lsls r0, r4, 3
	adds r0, r5, r0
	bl AllocTilesForSpriteSheet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 3
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	bne _08002350
_08002368:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end AllocTilesForSpriteSheets

	thumb_func_start LoadTilesForSpriteSheet
LoadTilesForSpriteSheet: @ 8002370
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, [r4]
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, _08002398 @ =0x06010000
	adds r1, r0
	ldrh r2, [r4, 0x4]
	lsrs r2, 1
	adds r0, r5, 0
	bl CpuSet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002398: .4byte 0x06010000
	thumb_func_end LoadTilesForSpriteSheet

	thumb_func_start LoadTilesForSpriteSheets
LoadTilesForSpriteSheets: @ 800239C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	ldr r0, [r5]
	cmp r0, 0
	beq _080023C0
_080023A8:
	lsls r0, r4, 3
	adds r0, r5, r0
	bl LoadTilesForSpriteSheet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 3
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	bne _080023A8
_080023C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadTilesForSpriteSheets

	thumb_func_start FreeSpriteTilesByTag
FreeSpriteTilesByTag: @ 80023C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	bl IndexOfSpriteTileTag
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08002426
	ldr r0, _08002430 @ =0x03000080
	lsls r1, r4, 2
	adds r2, r1, r0
	adds r0, 0x2
	adds r1, r0
	ldrh r0, [r1]
	ldrh r3, [r2]
	adds r0, r3, r0
	ldr r1, _08002434 @ =0x03000000
	mov r8, r1
	lsls r5, r4, 1
	cmp r3, r0
	bge _0800241E
	ldr r1, _08002438 @ =gSpriteTileAllocBitmap
	mov r12, r1
	movs r6, 0x7
	movs r7, 0x1
	adds r4, r0, 0
_08002402:
	lsrs r2, r3, 3
	add r2, r12
	adds r0, r3, 0
	ands r0, r6
	adds r1, r7, 0
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _08002402
_0800241E:
	mov r0, r8
	adds r1, r5, r0
	ldr r0, _0800243C @ =0x0000ffff
	strh r0, [r1]
_08002426:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002430: .4byte 0x03000080
_08002434: .4byte 0x03000000
_08002438: .4byte gSpriteTileAllocBitmap
_0800243C: .4byte 0x0000ffff
	thumb_func_end FreeSpriteTilesByTag

	thumb_func_start FreeSpriteTileRanges
FreeSpriteTileRanges: @ 8002440
	push {r4-r7,lr}
	movs r2, 0
	ldr r7, _08002474 @ =0x03000000
	ldr r0, _08002478 @ =0x0000ffff
	adds r6, r0, 0
	ldr r4, _0800247C @ =0x03000080
	movs r3, 0
	adds r5, r4, 0x2
_08002450:
	lsls r1, r2, 1
	adds r1, r7
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	lsls r1, r2, 2
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08002450
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002474: .4byte 0x03000000
_08002478: .4byte 0x0000ffff
_0800247C: .4byte 0x03000080
	thumb_func_end FreeSpriteTileRanges

	thumb_func_start GetSpriteTileStartByTag
GetSpriteTileStartByTag: @ 8002480
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl IndexOfSpriteTileTag
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080024A0
	ldr r0, _0800249C @ =0x03000080
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	b _080024A2
	.align 2, 0
_0800249C: .4byte 0x03000080
_080024A0:
	ldr r0, _080024A8 @ =0x0000ffff
_080024A2:
	pop {r1}
	bx r1
	.align 2, 0
_080024A8: .4byte 0x0000ffff
	thumb_func_end GetSpriteTileStartByTag

	thumb_func_start IndexOfSpriteTileTag
IndexOfSpriteTileTag: @ 80025E0
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _080025F8 @ =0x03000000
_080025EA:
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _080025FC
	adds r0, r1, 0
	b _08002608
	.align 2, 0
_080025F8: .4byte 0x03000000
_080025FC:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3F
	bls _080025EA
	movs r0, 0xFF
_08002608:
	pop {r1}
	bx r1
	thumb_func_end IndexOfSpriteTileTag

	thumb_func_start GetSpriteTileTagByTileStart
GetSpriteTileTagByTileStart: @ 80024D8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r6, _08002500 @ =0x03000000
	ldr r5, _08002504 @ =0x0000ffff
	ldr r4, _08002508 @ =0x03000080
_080024E6:
	lsls r0, r2, 1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, r5
	beq _0800250C
	lsls r0, r2, 2
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r3
	bne _0800250C
	ldrh r0, [r1]
	b _08002518
	.align 2, 0
_08002500: .4byte 0x03000000
_08002504: .4byte 0x0000ffff
_08002508: .4byte 0x03000080
_0800250C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080024E6
	ldr r0, _08002520 @ =0x0000ffff
_08002518:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002520: .4byte 0x0000ffff
	thumb_func_end GetSpriteTileTagByTileStart

	thumb_func_start AllocSpriteTileRange
AllocSpriteTileRange: @ 8002658
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08002694 @ =0x0000ffff
	bl IndexOfSpriteTileTag
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08002698 @ =0x03000000
	lsls r1, r0, 1
	adds r1, r2
	strh r4, [r1]
	ldr r1, _0800269C @ =0x03000080
	lsls r0, 2
	adds r2, r0, r1
	strh r5, [r2]
	adds r1, 0x2
	adds r0, r1
	strh r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002694: .4byte 0x0000ffff
_08002698: .4byte 0x03000000
_0800269C: .4byte 0x03000080
	thumb_func_end AllocSpriteTileRange

	thumb_func_start RequestSpriteSheetCopy
RequestSpriteSheetCopy: @ 800256C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, [r4]
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, _08002590 @ =0x06010000
	adds r1, r0
	ldrh r2, [r4, 0x4]
	adds r0, r5, 0
	bl RequestSpriteCopy
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002590: .4byte 0x06010000
	thumb_func_end RequestSpriteSheetCopy

	thumb_func_start LoadSpriteSheetDeferred
LoadSpriteSheetDeferred: @ 8002594
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	lsrs r0, 5
	bl AllocSpriteTiles
	lsls r4, r0, 16
	cmp r4, 0
	blt _080025BE
	ldrh r0, [r5, 0x6]
	lsrs r4, 16
	ldrh r2, [r5, 0x4]
	lsrs r2, 5
	adds r1, r4, 0
	bl AllocSpriteTileRange
	adds r0, r5, 0
	bl RequestSpriteSheetCopy
	adds r0, r4, 0
	b _080025C0
_080025BE:
	movs r0, 0
_080025C0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end LoadSpriteSheetDeferred

	thumb_func_start FreeAllSpritePalettes
FreeAllSpritePalettes: @ 80025C8
	push {r4,lr}
	ldr r1, _080025F4 @ =gReservedSpritePaletteCount
	movs r0, 0
	strb r0, [r1]
	movs r2, 0
	ldr r4, _080025F8 @ =0x03000300
	ldr r0, _080025FC @ =0x0000ffff
	adds r3, r0, 0
_080025D8:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _080025D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080025F4: .4byte gReservedSpritePaletteCount
_080025F8: .4byte 0x03000300
_080025FC: .4byte 0x0000ffff
	thumb_func_end FreeAllSpritePalettes

	thumb_func_start LoadSpritePalette
LoadSpritePalette: @ 8002600
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08002616
	adds r0, r4, 0
	b _08002646
_08002616:
	ldr r0, _0800263C @ =0x0000ffff
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _08002644
	ldr r1, _08002640 @ =0x03000300
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r5, 0x4]
	strh r1, [r0]
	ldr r0, [r5]
	lsls r1, r4, 4
	bl DoLoadSpritePalette
	adds r0, r4, 0
	b _08002646
	.align 2, 0
_0800263C: .4byte 0x0000ffff
_08002640: .4byte 0x03000300
_08002644:
	movs r0, 0xFF
_08002646:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end LoadSpritePalette

	thumb_func_start LoadSpritePalettes
LoadSpritePalettes: @ 800264C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
	b _0800265A
_08002654:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0800265A:
	lsls r0, r4, 3
	adds r1, r0, r5
	ldr r0, [r1]
	cmp r0, 0
	beq _08002672
	adds r0, r1, 0
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08002654
_08002672:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end LoadSpritePalettes

	thumb_func_start DoLoadSpritePalette
DoLoadSpritePalette: @ 80027AC
	push {lr}
	lsls r1, 16
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	thumb_func_end DoLoadSpritePalette

	thumb_func_start AllocSpritePalette
AllocSpritePalette: @ 8002690
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080026B0 @ =0x0000ffff
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080026B8
	ldr r1, _080026B4 @ =0x03000300
	lsls r0, r2, 1
	adds r0, r1
	strh r4, [r0]
	adds r0, r2, 0
	b _080026BA
	.align 2, 0
_080026B0: .4byte 0x0000ffff
_080026B4: .4byte 0x03000300
_080026B8:
	movs r0, 0xFF
_080026BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end AllocSpritePalette

	thumb_func_start IndexOfSpritePaletteTag
IndexOfSpritePaletteTag: @ 80026C0
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080026E0 @ =gReservedSpritePaletteCount
	ldrb r1, [r0]
	cmp r1, 0xF
	bhi _080026F2
	ldr r3, _080026E4 @ =0x03000300
_080026D0:
	lsls r0, r1, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _080026E8
	adds r0, r1, 0
	b _080026F4
	.align 2, 0
_080026E0: .4byte gReservedSpritePaletteCount
_080026E4: .4byte 0x03000300
_080026E8:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _080026D0
_080026F2:
	movs r0, 0xFF
_080026F4:
	pop {r1}
	bx r1
	thumb_func_end IndexOfSpritePaletteTag

	thumb_func_start GetSpritePaletteTagByPaletteNum
GetSpritePaletteTagByPaletteNum: @ 80026F8
	lsls r0, 24
	ldr r1, _08002704 @ =0x03000300
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08002704: .4byte 0x03000300
	thumb_func_end GetSpritePaletteTagByPaletteNum

	thumb_func_start FreeSpritePaletteByTag
FreeSpritePaletteByTag: @ 8002708
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08002724
	ldr r0, _08002728 @ =0x03000300
	lsls r1, 1
	adds r1, r0
	ldr r0, _0800272C @ =0x0000ffff
	strh r0, [r1]
_08002724:
	pop {r0}
	bx r0
	.align 2, 0
_08002728: .4byte 0x03000300
_0800272C: .4byte 0x0000ffff
	thumb_func_end FreeSpritePaletteByTag

	thumb_func_start SetSubspriteTables
SetSubspriteTables: @ 8002730
	str r1, [r0, 0x18]
	adds r0, 0x42
	movs r1, 0x40
	strb r1, [r0]
	bx lr
	thumb_func_end SetSubspriteTables

	thumb_func_start AddSpriteToOamBuffer
AddSpriteToOamBuffer: @ 800273C
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	ldr r1, _08002750 @ =gOamLimit
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08002754
	movs r0, 0x1
	b _0800279C
	.align 2, 0
_08002750: .4byte gOamLimit
_08002754:
	ldr r0, [r4, 0x18]
	cmp r0, 0
	beq _08002768
	adds r0, r4, 0
	adds r0, 0x42
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	bne _08002788
_08002768:
	ldr r0, _08002784 @ =gMain
	ldrb r2, [r3]
	lsls r2, 3
	adds r2, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2, 0x3C]
	str r1, [r2, 0x40]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	movs r0, 0
	b _0800279C
	.align 2, 0
_08002784: .4byte gMain
_08002788:
	ldrb r1, [r3]
	lsls r1, 3
	ldr r0, _080027A4 @ =0x030017ac
	adds r1, r0
	adds r0, r4, 0
	adds r2, r3, 0
	bl AddSubspritesToOamBuffer
	lsls r0, 24
	lsrs r0, 24
_0800279C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080027A4: .4byte 0x030017ac
	thumb_func_end AddSpriteToOamBuffer

	thumb_func_start AddSubspritesToOamBuffer
AddSubspritesToOamBuffer: @ 80027A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r3, r0, 0
	str r1, [sp]
	mov r8, r2
	ldr r0, _080027C8 @ =gOamLimit
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _080027CC
_080027C4:
	movs r0, 0x1
	b _08002984
	.align 2, 0
_080027C8: .4byte gOamLimit
_080027CC:
	adds r0, r3, 0
	adds r0, 0x42
	ldrb r1, [r0]
	lsls r1, 26
	lsrs r1, 23
	ldr r2, [r3, 0x18]
	adds r7, r2, r1
	mov r12, r3
	str r0, [sp, 0x18]
	cmp r7, 0
	beq _080027E8
	ldr r0, [r7, 0x4]
	cmp r0, 0
	bne _080027FE
_080027E8:
	mov r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [sp]
	str r0, [r2]
	str r1, [r2, 0x4]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08002982
_080027FE:
	mov r2, r12
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 22
	str r0, [sp, 0x4]
	ldrb r0, [r7]
	str r0, [sp, 0xC]
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	asrs r1, r0, 3
	str r1, [sp, 0x10]
	movs r1, 0x1
	ldr r2, [sp, 0x10]
	ands r2, r1
	str r2, [sp, 0x10]
	asrs r0, 4
	mov r10, r0
	ands r0, r1
	mov r10, r0
	mov r1, r12
	ldrh r0, [r1, 0x2]
	lsls r0, 23
	lsrs r0, 23
	adds r1, 0x28
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	mov r1, r12
	ldrb r0, [r1]
	adds r1, 0x29
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0xC]
	cmp r9, r1
	bcc _0800285C
	b _08002982
_0800285C:
	lsls r0, r2, 16
	asrs r0, 16
	str r0, [sp, 0x14]
_08002862:
	mov r2, r8
	ldrb r0, [r2]
	ldr r1, _08002994 @ =gOamLimit
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080027C4
	ldr r0, [r7, 0x4]
	mov r2, r9
	lsls r6, r2, 3
	adds r2, r6, r0
	ldrh r4, [r2]
	ldrh r5, [r2, 0x2]
	ldr r0, [sp, 0x10]
	cmp r0, 0
	beq _080028A6
	ldrb r1, [r2, 0x4]
	movs r0, 0xC
	ands r0, r1
	lsls r1, 30
	lsrs r1, 26
	adds r0, r1
	ldr r1, _08002998 @ =0x081ef8ec
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r4, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	mvns r0, r4
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_080028A6:
	mov r0, r10
	cmp r0, 0
	beq _080028D2
	ldrb r1, [r2, 0x4]
	movs r0, 0xC
	ands r0, r1
	lsls r1, 30
	lsrs r1, 26
	adds r0, r1
	ldr r1, _08002998 @ =0x081ef8ec
	adds r0, r1
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	lsls r0, r5, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	mvns r0, r5
	adds r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080028D2:
	ldr r2, [sp]
	adds r3, r6, r2
	mov r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	str r0, [r3]
	str r1, [r3, 0x4]
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldrb r1, [r0, 0x4]
	lsls r1, 30
	lsrs r1, 24
	ldrb r2, [r3, 0x1]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldrb r1, [r0, 0x4]
	lsls r1, 28
	lsrs r1, 30
	lsls r1, 6
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	lsls r1, r4, 16
	asrs r1, 16
	ldr r0, [sp, 0x14]
	adds r1, r0, r1
	ldr r2, _0800299C @ =0x000001ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x2]
	ldr r0, _080029A0 @ =0xfffffe00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldr r1, [sp, 0x8]
	adds r0, r1, r5
	strb r0, [r3]
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldrh r1, [r0, 0x4]
	lsls r1, 18
	lsrs r1, 22
	ldr r2, [sp, 0x4]
	adds r1, r2, r1
	ldr r2, _080029A4 @ =0x000003ff
	adds r0, r2, 0
	ands r1, r0
	ldrh r2, [r3, 0x4]
	ldr r0, _080029A8 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldr r0, [sp, 0x18]
	ldrb r1, [r0]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x80
	beq _08002968
	ldr r0, [r7, 0x4]
	adds r0, r6, r0
	ldrb r1, [r0, 0x5]
	lsrs r1, 6
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
_08002968:
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r2, [sp, 0xC]
	cmp r9, r2
	bcs _08002982
	b _08002862
_08002982:
	movs r0, 0
_08002984:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08002994: .4byte gOamLimit
_08002998: .4byte 0x081ef8ec
_0800299C: .4byte 0x000001ff
_080029A0: .4byte 0xfffffe00
_080029A4: .4byte 0x000003ff
_080029A8: .4byte 0xfffffc00
	thumb_func_end AddSubspritesToOamBuffer

	.align 2, 0 @ Don't pad with nop.
