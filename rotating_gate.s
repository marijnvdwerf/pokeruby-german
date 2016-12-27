	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetCurrentMapRotatingGatePuzzleType
GetCurrentMapRotatingGatePuzzleType: @ 80C7B98
	push {lr}
	ldr r0, _080C7BAC
	ldrh r1, [r0, 0x4]
	movs r0, 0x86
	lsls r0, 1
	cmp r1, r0
	bne _080C7BB0
	movs r0, 0x1
	b _080C7BC2
	.align 2, 0
_080C7BAC: .4byte gSaveBlock1
_080C7BB0:
	ldr r0, _080C7BBC
	cmp r1, r0
	beq _080C7BC0
	movs r0, 0
	b _080C7BC2
	.align 2, 0
_080C7BBC: .4byte 0x0000081d
_080C7BC0:
	movs r0, 0x2
_080C7BC2:
	pop {r1}
	bx r1
	thumb_func_end GetCurrentMapRotatingGatePuzzleType

	thumb_func_start sub_80C79CC
sub_80C79CC: @ 80C7BC8
	push {r4-r6,lr}
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r5, r0, 0
	movs r3, 0
	ldr r4, _080C7BFC
	ldrb r0, [r4]
	cmp r3, r0
	bge _080C7BF4
	ldr r6, _080C7C00
_080C7BE0:
	adds r2, r5, r3
	ldr r1, [r6]
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0, 0x5]
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r4]
	cmp r3, r0
	blt _080C7BE0
_080C7BF4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7BFC: .4byte gUnknown_02038804
_080C7C00: .4byte gUnknown_02038800
	thumb_func_end sub_80C79CC

	thumb_func_start sub_80C7A08
sub_80C7A08: @ 80C7C04
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r0, r4
	ldrb r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7A08

	thumb_func_start sub_80C7A24
sub_80C7A24: @ 80C7C20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x80
	lsls r0, 7
	bl GetVarPointer
	adds r0, r4
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A24

	thumb_func_start sub_80C7A44
sub_80C7A44: @ 80C7C40
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80C7A08
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	bne _080C7C64
	cmp r1, 0
	beq _080C7C60
	subs r0, r1, 0x1
	lsls r0, 24
	b _080C7C6E
_080C7C60:
	movs r1, 0x3
	b _080C7C70
_080C7C64:
	adds r1, 0x1
	lsls r1, 24
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r1
_080C7C6E:
	lsrs r1, r0, 24
_080C7C70:
	adds r0, r5, 0
	bl sub_80C7A24
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7A44

	thumb_func_start sub_80C7A80
sub_80C7A80: @ 80C7C7C
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0x1
	beq _080C7C90
	cmp r0, 0x1
	ble _080C7CC4
	cmp r0, 0x2
	beq _080C7CA8
	b _080C7CC4
_080C7C90:
	ldr r1, _080C7C9C
	ldr r0, _080C7CA0
	str r0, [r1]
	ldr r1, _080C7CA4
	movs r0, 0x7
	b _080C7CB2
	.align 2, 0
_080C7C9C: .4byte gUnknown_02038800
_080C7CA0: .4byte gUnknown_083D2964
_080C7CA4: .4byte gUnknown_02038804
_080C7CA8:
	ldr r1, _080C7CC8
	ldr r0, _080C7CCC
	str r0, [r1]
	ldr r1, _080C7CD0
	movs r0, 0xE
_080C7CB2:
	strb r0, [r1]
	movs r1, 0
	ldr r3, _080C7CD4
	movs r2, 0x40
_080C7CBA:
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, 0x1
	cmp r1, 0xD
	bls _080C7CBA
_080C7CC4:
	pop {r0}
	bx r0
	.align 2, 0
_080C7CC8: .4byte gUnknown_02038800
_080C7CCC: .4byte gUnknown_083D299C
_080C7CD0: .4byte gUnknown_02038804
_080C7CD4: .4byte gUnknown_020387F0
	thumb_func_end sub_80C7A80

	thumb_func_start sub_80C7ADC
sub_80C7ADC: @ 80C7CD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	ldr r2, _080C7D98
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r3, r0, 16
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrh r1, [r2, 0x2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r2, r0, 16
	adds r1, 0xE
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r5, 0
	ldr r0, _080C7D9C
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080C7D88
	lsls r0, r2, 16
	asrs r7, r0, 16
	lsls r0, r3, 16
	asrs r6, r0, 16
_080C7D24:
	ldr r0, _080C7DA0
	ldr r0, [r0]
	lsls r1, r5, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r1, r0, 16
	cmp r7, r1
	bgt _080C7D7A
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	blt _080C7D7A
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r6, r1
	bgt _080C7D7A
	mov r2, r9
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r1
	blt _080C7D7A
	ldr r0, _080C7DA4
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x40
	bne _080C7D7A
	ldr r3, [sp]
	lsls r1, r3, 16
	mov r0, r10
	lsls r2, r0, 16
	adds r0, r5, 0
	asrs r1, 16
	asrs r2, 16
	bl sub_80C7BAC
	strb r0, [r4]
_080C7D7A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C7D9C
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080C7D24
_080C7D88:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C7D98: .4byte gSaveBlock1
_080C7D9C: .4byte gUnknown_02038804
_080C7DA0: .4byte gUnknown_02038800
_080C7DA4: .4byte gUnknown_020387F0
	thumb_func_end sub_80C7ADC

	thumb_func_start sub_80C7BAC
sub_80C7BAC: @ 80C7DA8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _080C7DD8
	lsls r1, r6, 3
	ldr r0, [r0]
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080C7DD0
	cmp r0, 0x4
	bne _080C7DE0
_080C7DD0:
	mov r1, sp
	ldr r0, _080C7DDC
	b _080C7DE4
	.align 2, 0
_080C7DD8: .4byte gUnknown_02038800
_080C7DDC: .4byte gSpriteTemplate_83D60A4
_080C7DE0:
	mov r1, sp
	ldr r0, _080C7E78
_080C7DE4:
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r2, sp
	ldrb r0, [r4, 0x4]
	movs r3, 0x98
	lsls r3, 5
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x94
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080C7E80
	ldrh r0, [r4]
	adds r0, 0x7
	ldrh r1, [r4, 0x2]
	adds r1, 0x7
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r2, _080C7E7C
	adds r4, r2
	strh r6, [r4, 0x2E]
	movs r2, 0x3E
	adds r2, r4
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x2
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	lsls r0, 16
	asrs r0, 16
	lsls r2, r7, 16
	asrs r2, 16
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	mov r3, r8
	lsls r2, r3, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	adds r0, r4, 0
	bl sub_80C7D14
	adds r0, r6, 0
	bl sub_80C7A08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	adds r0, r5, 0
	b _080C7E82
	.align 2, 0
_080C7E78: .4byte gSpriteTemplate_83D608C
_080C7E7C: .4byte gSprites
_080C7E80:
	movs r0, 0x40
_080C7E82:
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80C7BAC

	thumb_func_start sub_80C7C94
sub_80C7C94: @ 80C7E90
	push {r4-r7,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0x30]
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r6, 0x32]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r6, 0
	bl sub_80C7D14
	cmp r5, 0x1
	bne _080C7ED6
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080C7EC6
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_080C7EC6:
	movs r0, 0x30
	bl PlaySE
	adds r0, r6, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
	b _080C7F04
_080C7ED6:
	cmp r5, 0x2
	bne _080C7F04
	adds r0, r7, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _080C7EF6
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_080C7EF6:
	movs r0, 0x30
	bl PlaySE
	adds r0, r6, 0
	adds r1, r4, 0
	bl StartSpriteAffineAnim
_080C7F04:
	movs r0, 0
	strh r0, [r6, 0x30]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C7C94

	thumb_func_start sub_80C7D14
sub_80C7D14: @ 80C7F10
	push {r4-r6,lr}
	mov r12, r0
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r5, 0x5
	negs r5, r5
	ands r5, r0
	strb r5, [r4]
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldr r0, _080C7FA4
	adds r2, r1
	ldrh r0, [r0]
	adds r2, r0
	lsls r2, 16
	mov r3, r12
	ldrh r1, [r3, 0x26]
	ldrh r0, [r3, 0x22]
	adds r1, r0
	mov r0, r12
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r3, _080C7FA8
	adds r0, r1
	ldrh r3, [r3]
	adds r0, r3
	lsls r0, 16
	movs r3, 0x80
	lsls r3, 15
	adds r1, r2, r3
	lsrs r1, 16
	lsrs r6, r0, 16
	adds r0, r3
	lsrs r3, r0, 16
	asrs r2, 16
	cmp r2, 0xFF
	bgt _080C7F76
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080C7F7E
_080C7F76:
	movs r1, 0x4
	adds r0, r5, 0
	orrs r0, r1
	strb r0, [r4]
_080C7F7E:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080C7F92
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080C7F9E
_080C7F92:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080C7F9E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C7FA4: .4byte gSpriteCoordOffsetX
_080C7FA8: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_80C7D14

	thumb_func_start LoadRotatingGatePics
LoadRotatingGatePics: @ 80C7FAC
	push {lr}
	ldr r0, _080C7FB8
	bl LoadSpriteSheets
	pop {r0}
	bx r0
	.align 2, 0
_080C7FB8: .4byte gRotatingGatesGraphicsTable
	thumb_func_end LoadRotatingGatePics

	thumb_func_start sub_80C7DC0
sub_80C7DC0: @ 80C7FBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r2, _080C7FF0
	ldrh r1, [r2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r1, 0x11
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldrh r1, [r2, 0x2]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r1, 0xE
	lsls r1, 16
	lsrs r7, r1, 16
	movs r6, 0
	b _080C8062
	.align 2, 0
_080C7FF0: .4byte gSaveBlock1
_080C7FF4:
	ldr r0, _080C8078
	ldr r0, [r0]
	lsls r1, r6, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080C807C
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _080C8060
	lsls r0, r2, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r2, r0, 16
	cmp r0, r1
	blt _080C8040
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r2, r0
	bgt _080C8040
	lsls r0, r3, 16
	mov r2, r8
	lsls r1, r2, 16
	asrs r2, r0, 16
	cmp r0, r1
	blt _080C8040
	lsls r0, r7, 16
	asrs r0, 16
	cmp r2, r0
	ble _080C8060
_080C8040:
	ldr r0, _080C807C
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C8080
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
_080C8060:
	adds r6, 0x1
_080C8062:
	ldr r0, _080C8084
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C7FF4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8078: .4byte gUnknown_02038800
_080C807C: .4byte gUnknown_020387F0
_080C8080: .4byte gSprites
_080C8084: .4byte gUnknown_02038804
	thumb_func_end sub_80C7DC0

	thumb_func_start sub_80C7E8C
sub_80C7E8C: @ 80C8088
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r1, 0x1
	bne _080C80A8
	ldr r0, _080C80A4
	mov r10, r0
	b _080C80B4
	.align 2, 0
_080C80A4: .4byte gUnknown_083D611C
_080C80A8:
	cmp r1, 0x2
	beq _080C80B0
_080C80AC:
	movs r0, 0
	b _080C8144
_080C80B0:
	ldr r1, _080C8154
	mov r10, r1
_080C80B4:
	adds r0, r4, 0
	bl sub_80C7A08
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r0, _080C8158
	ldr r1, [r0]
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldrh r1, [r0]
	adds r1, 0x7
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	movs r3, 0
	lsls r2, 3
	str r2, [sp, 0x4]
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
_080C80E4:
	movs r6, 0
	ldr r2, [sp]
	adds r7, r2, r3
	lsls r0, r3, 1
	adds r5, r7, 0
	ldr r1, [sp, 0x4]
	adds r0, r1
	ldr r2, _080C815C
	adds r4, r0, r2
_080C80F6:
	adds r0, r5, 0
	cmp r5, 0
	bge _080C80FE
	adds r0, r7, 0x3
_080C80FE:
	asrs r0, 2
	lsls r0, 2
	subs r0, r5, r0
	lsls r0, 1
	adds r0, r6
	lsls r0, 24
	lsrs r1, r0, 24
	ldrb r0, [r4]
	cmp r0, 0
	beq _080C8134
	lsls r1, 2
	add r1, r10
	movs r0, 0
	ldrsb r0, [r1, r0]
	add r0, r9
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	add r1, r8
	str r3, [sp, 0x8]
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [sp, 0x8]
	cmp r0, 0x1
	beq _080C80AC
_080C8134:
	adds r4, 0x1
	adds r6, 0x1
	cmp r6, 0x1
	ble _080C80F6
	adds r3, 0x1
	cmp r3, 0x3
	ble _080C80E4
	movs r0, 0x1
_080C8144:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C8154: .4byte gUnknown_083D60FC
_080C8158: .4byte gUnknown_02038800
_080C815C: .4byte gUnknown_083D613C
	thumb_func_end sub_80C7E8C

	thumb_func_start sub_80C7F64
sub_80C7F64: @ 80C8160
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r4, 24
	lsrs r5, r4, 24
	lsrs r4, 25
	movs r0, 0x1
	ands r5, r0
	adds r0, r6, 0
	bl sub_80C7A08
	subs r4, r0
	adds r1, r4, 0x4
	adds r0, r1, 0
	cmp r1, 0
	bge _080C8186
	adds r0, r4, 0x7
_080C8186:
	asrs r0, 2
	lsls r0, 2
	subs r0, r1, r0
	ldr r1, _080C81AC
	ldr r2, [r1]
	lsls r1, r6, 3
	adds r1, r2
	ldrb r1, [r1, 0x4]
	ldr r2, _080C81B0
	lsls r0, 24
	asrs r0, 23
	adds r0, r5
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C81AC: .4byte gUnknown_02038800
_080C81B0: .4byte gUnknown_083D613C
	thumb_func_end sub_80C7F64

	thumb_func_start sub_80C7FB8
sub_80C7FB8: @ 80C81B4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080C81E0
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x40
	beq _080C81D8
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080C81E4
	adds r4, r0
	strh r1, [r4, 0x30]
	adds r0, r3, 0
	bl sub_80C7A08
	strh r0, [r4, 0x32]
_080C81D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C81E0: .4byte gUnknown_020387F0
_080C81E4: .4byte gSprites
	thumb_func_end sub_80C7FB8

	thumb_func_start sub_80C7FEC
sub_80C7FEC: @ 80C81E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0x2
	bne _080C8204
	ldr r3, _080C8200
	b _080C8226
	.align 2, 0
_080C8200: .4byte gUnknown_083D60BC
_080C8204:
	cmp r0, 0x1
	bne _080C8210
	ldr r3, _080C820C
	b _080C8226
	.align 2, 0
_080C820C: .4byte gUnknown_083D60CC
_080C8210:
	cmp r0, 0x3
	bne _080C821C
	ldr r3, _080C8218
	b _080C8226
	.align 2, 0
_080C8218: .4byte gUnknown_083D60DC
_080C821C:
	cmp r3, 0x4
	beq _080C8224
	movs r0, 0xFF
	b _080C8234
_080C8224:
	ldr r3, _080C8238
_080C8226:
	lsls r0, r2, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 14
	adds r0, r1
	adds r0, r3, r0
	ldrb r0, [r0]
_080C8234:
	pop {r1}
	bx r1
	.align 2, 0
_080C8238: .4byte gUnknown_083D60EC
	thumb_func_end sub_80C7FEC

	thumb_func_start sub_80C8040
sub_80C8040: @ 80C823C
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C824E
	bl sub_80C7A80
	bl sub_80C79CC
_080C824E:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8040

	thumb_func_start RotatingGatePuzzleCameraUpdate
RotatingGatePuzzleCameraUpdate: @ 80C8254
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C8276
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl sub_80C7ADC
	bl sub_80C7DC0
_080C8276:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end RotatingGatePuzzleCameraUpdate

	thumb_func_start sub_80C8080
sub_80C8080: @ 80C827C
	push {lr}
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	beq _080C8296
	bl LoadRotatingGatePics
	bl sub_80C7A80
	movs r0, 0
	movs r1, 0
	bl sub_80C7ADC
_080C8296:
	pop {r0}
	bx r0
	thumb_func_end sub_80C8080

	thumb_func_start CheckForRotatingGatePuzzleCollision
CheckForRotatingGatePuzzleCollision: @ 80C829C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	bl GetCurrentMapRotatingGatePuzzleType
	cmp r0, 0
	bne _080C82D0
	b _080C836E
_080C82BE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7FB8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7A44
	b _080C836E
_080C82D0:
	movs r6, 0
	ldr r0, _080C835C
	ldrb r0, [r0]
	cmp r6, r0
	bge _080C836E
	lsls r0, r4, 16
	asrs r7, r0, 16
_080C82DE:
	ldr r0, _080C8360
	ldr r1, [r0]
	lsls r0, r6, 3
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x7
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	subs r0, r4, 0x2
	cmp r0, r7
	bgt _080C8364
	adds r0, r4, 0x1
	cmp r7, r0
	bgt _080C8364
	lsls r0, r2, 16
	asrs r3, r0, 16
	subs r1, r3, 0x2
	mov r2, r8
	lsls r0, r2, 16
	asrs r2, r0, 16
	cmp r1, r2
	bgt _080C8364
	adds r0, r3, 0x1
	cmp r2, r0
	bgt _080C8364
	subs r1, r7, r4
	adds r1, 0x2
	subs r2, r3
	adds r2, 0x2
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	mov r0, r9
	bl sub_80C7FEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080C8364
	lsrs r5, r0, 4
	movs r1, 0xF
	ands r1, r0
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80C7F64
	cmp r0, 0
	beq _080C8364
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80C7E8C
	cmp r0, 0
	bne _080C82BE
	movs r0, 0x1
	b _080C8370
	.align 2, 0
_080C835C: .4byte gUnknown_02038804
_080C8360: .4byte gUnknown_02038800
_080C8364:
	adds r6, 0x1
	ldr r0, _080C837C
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C82DE
_080C836E:
	movs r0, 0
_080C8370:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C837C: .4byte gUnknown_02038804
	thumb_func_end CheckForRotatingGatePuzzleCollision

	.align 2, 0 @ Don't pad with nop.
