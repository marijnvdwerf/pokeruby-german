	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetUpReflection
SetUpReflection: @ 8126B88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	lsls r5, r2, 24
	lsrs r5, 24
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x22
	ldrsh r2, [r4, r0]
	adds r0, r4, 0
	movs r3, 0x98
	bl obj_unfreeze
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08126C38 @ =gSprites
	adds r7, r1, r0
	ldr r0, _08126C3C @ =sub_81269E0
	str r0, [r7, 0x1C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xC
	orrs r1, r0
	strb r1, [r7, 0x5]
	ldr r2, _08126C40 @ =gUnknown_0830FD14
	lsrs r0, r1, 4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 4
	movs r2, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	movs r1, 0x3F
	adds r1, r7
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x40
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08126C44 @ =gDummySpriteAnimTable
	str r0, [r7, 0x8]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _08126C48 @ =gDummySpriteAffineAnimTable
	str r0, [r7, 0x10]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x8
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r2, r7, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x2E]
	strh r0, [r7, 0x2E]
	ldrb r0, [r6, 0x8]
	strh r0, [r7, 0x30]
	strh r5, [r7, 0x3C]
	adds r0, r6, 0
	adds r1, r7, 0
	bl npc_pal_op
	cmp r5, 0
	bne _08126C2E
	ldrb r0, [r7, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r7, 0x1]
_08126C2E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126C38: .4byte gSprites
_08126C3C: .4byte sub_81269E0
_08126C40: .4byte gUnknown_0830FD14
_08126C44: .4byte gDummySpriteAnimTable
_08126C48: .4byte gDummySpriteAffineAnimTable
	thumb_func_end SetUpReflection

	thumb_func_start sub_81268D0
sub_81268D0: @ 8126C4C
	push {lr}
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrh r0, [r0, 0xA]
	subs r0, 0x2
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_81268D0

	thumb_func_start npc_pal_op
npc_pal_op: @ 8126C60
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _08126CB8 @ =gUnknown_08401E2C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08126CBC
	ldrb r0, [r5, 0x1F]
	bl sub_8057450
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08126CA2
	ldrb r0, [r5, 0x1E]
	bl sub_8057450
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08126CBC
_08126CA2:
	subs r0, 0x1
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r0, r5, 0
	bl npc_pal_op_A
	b _08126CC6
	.align 2, 0
_08126CB8: .4byte gUnknown_08401E2C
_08126CBC:
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r0, r5, 0
	bl npc_pal_op_B
_08126CC6:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end npc_pal_op

	thumb_func_start npc_pal_op_B
npc_pal_op_B: @ 8126CD0
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r2, r0, 0
	ldrh r1, [r2, 0x4]
	ldr r0, _08126CFC @ =0x000011ff
	cmp r1, r0
	beq _08126D24
	ldrb r0, [r2, 0xC]
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	bne _08126D00
	ldrh r0, [r2, 0x2]
	adds r1, r4, 0
	bl npc_load_two_palettes__no_record
	b _08126D1E
	.align 2, 0
_08126CFC: .4byte 0x000011ff
_08126D00:
	cmp r1, 0xA
	bne _08126D0E
	ldrh r0, [r2, 0x2]
	adds r1, r4, 0
	bl npc_load_two_palettes__and_record
	b _08126D1E
_08126D0E:
	adds r0, r4, 0
	bl npc_paltag_by_palslot
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl pal_patch_for_npc
_08126D1E:
	adds r0, r4, 0
	bl sub_807D78C
_08126D24:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_pal_op_B

	thumb_func_start npc_pal_op_A
npc_pal_op_A: @ 8126D2C
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r2, r0, 0
	ldrh r1, [r2, 0x4]
	ldr r0, _08126D58 @ =0x000011ff
	cmp r1, r0
	beq _08126D50
	adds r0, r1, 0
	adds r1, r4, 0
	bl pal_patch_for_npc
	adds r0, r4, 0
	bl sub_807D78C
_08126D50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08126D58: .4byte 0x000011ff
	thumb_func_end npc_pal_op_A

	thumb_func_start sub_81269E0
sub_81269E0: @ 8126D5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126DA4 @ =gMapObjects
	adds r7, r0, r1
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08126DA8 @ =gSprites
	adds r5, r0, r1
	ldr r0, [r7]
	ldr r1, _08126DAC @ =0x00020001
	ands r0, r1
	cmp r0, r1
	bne _08126D94
	ldrb r1, [r7, 0x8]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08126DB0
_08126D94:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _08126EBA
	.align 2, 0
_08126DA4: .4byte gMapObjects
_08126DA8: .4byte gSprites
_08126DAC: .4byte 0x00020001
_08126DB0:
	ldr r1, _08126EC8 @ =gUnknown_0830FD14
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r5, 0x1]
	lsrs r1, 6
	lsls r1, 6
	ldrb r2, [r4, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r5, 0x3]
	lsrs r0, 6
	lsls r0, 6
	ldrb r2, [r4, 0x3]
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	movs r2, 0x10
	orrs r0, r2
	lsls r0, 1
	subs r2, 0x4F
	mov r9, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r4, 0x4]
	ldr r0, _08126ECC @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x18]
	adds r0, r5, 0
	adds r0, 0x42
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 26
	adds r2, r4, 0
	adds r2, 0x42
	ands r3, r0
	ldrb r1, [r2]
	movs r0, 0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	movs r0, 0x3E
	adds r0, r5
	mov r8, r0
	ldrb r0, [r0]
	adds r6, r4, 0
	adds r6, 0x3E
	movs r1, 0x4
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	adds r0, r7, 0
	bl sub_81268D0
	ldrh r1, [r5, 0x22]
	adds r0, r1
	ldrh r1, [r4, 0x32]
	adds r1, r0
	strh r1, [r4, 0x22]
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x2
	ands r1, r0
	ldrb r2, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08126EBA
	ldrb r0, [r4, 0x3]
	mov r2, r9
	ands r2, r0
	strb r2, [r4, 0x3]
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	movs r1, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08126EBA
	movs r1, 0x2
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r4, 0x3]
_08126EBA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126EC8: .4byte gUnknown_0830FD14
_08126ECC: .4byte 0xfffffc00
	thumb_func_end sub_81269E0

	thumb_func_start sub_8126B54
sub_8126B54: @ 8126ED0
	push {r4,lr}
	ldr r0, _08126F18 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x20]
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r0, 0x40
	beq _08126F0E
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08126F1C @ =gSprites
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	orrs r0, r3
	strb r0, [r1]
_08126F0E:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126F18: .4byte gFieldEffectObjectTemplatePointers
_08126F1C: .4byte gSprites
	thumb_func_end sub_8126B54

	thumb_func_start objid_set_invisible
objid_set_invisible: @ 8126F20
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08126F3C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08126F3C: .4byte gSprites
	thumb_func_end objid_set_invisible

	thumb_func_start sub_8126BC4
sub_8126BC4: @ 8126F40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _08126FE4 @ =gSprites
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08126F8A
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	bne _08126F8A
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	beq _08126FD6
_08126F8A:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	mov r4, sp
	adds r4, 0x2
	mov r2, sp
	adds r3, r4, 0
	bl sub_80603CC
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r1, _08126FE4 @ =gSprites
	adds r2, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x8
	strh r0, [r2, 0x20]
	ldrh r0, [r4]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	strh r7, [r2, 0x2E]
	strh r6, [r2, 0x30]
	mov r1, r8
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
_08126FD6:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08126FE4: .4byte gSprites
	thumb_func_end sub_8126BC4

	thumb_func_start FldEff_Shadow
FldEff_Shadow: @ 8126FE8
	push {r4,r5,lr}
	ldr r5, _08127074 @ =gUnknown_0202FF84
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08127078 @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	ldr r2, _0812707C @ =gFieldEffectObjectTemplatePointers
	ldr r1, _08127080 @ =gUnknown_08401E32
	ldrb r0, [r4, 0xC]
	lsls r0, 26
	lsrs r0, 30
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0x94
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0812706C
	ldr r0, _08127084 @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	strh r0, [r2, 0x2E]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x32]
	ldrh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 17
	ldr r3, _08127088 @ =gUnknown_08401E36
	ldrb r0, [r4, 0xC]
	lsls r0, 26
	lsrs r0, 30
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x34]
_0812706C:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127074: .4byte gUnknown_0202FF84
_08127078: .4byte gMapObjects
_0812707C: .4byte gFieldEffectObjectTemplatePointers
_08127080: .4byte gUnknown_08401E32
_08127084: .4byte gSprites
_08127088: .4byte gUnknown_08401E36
	thumb_func_end FldEff_Shadow

	thumb_func_start oamc_shadow
oamc_shadow: @ 812708C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _081270BA
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldEffectStop
	b _08127140
_081270BA:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127148 @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0812714C @ =gSprites
	adds r1, r0
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	ands r2, r0
	ldrb r3, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5, 0x5]
	ldrh r0, [r1, 0x20]
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x34]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldr r0, [r4]
	ldr r1, _08127150 @ =0x00400001
	ands r0, r1
	cmp r0, r1
	bne _08127138
	ldrb r0, [r4, 0x1E]
	bl sub_8056E14
	lsls r0, 24
	cmp r0, 0
	bne _08127138
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08127138
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08127138
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	bne _08127138
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	beq _08127140
_08127138:
	adds r0, r5, 0
	movs r1, 0x3
	bl FieldEffectStop
_08127140:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127148: .4byte gMapObjects
_0812714C: .4byte gSprites
_08127150: .4byte 0x00400001
	thumb_func_end oamc_shadow

	thumb_func_start FldEff_TallGrass
FldEff_TallGrass: @ 8127154
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _081271EC @ =gUnknown_0202FF84
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _081271F0 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x10]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _081271E0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081271F4 @ =gSprites
	adds r3, r0, r1
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r5, 0x8]
	strh r0, [r3, 0x2E]
	ldr r0, [r5]
	strh r0, [r3, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r3, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r3, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r3, 0x36]
	ldr r0, [r5, 0x18]
	strh r0, [r3, 0x38]
	ldr r0, [r5, 0x1C]
	cmp r0, 0
	beq _081271E0
	adds r0, r3, 0
	movs r1, 0x4
	bl SeekSpriteAnim
_081271E0:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081271EC: .4byte gUnknown_0202FF84
_081271F0: .4byte gFieldEffectObjectTemplatePointers
_081271F4: .4byte gSprites
	thumb_func_end FldEff_TallGrass

	thumb_func_start unc_grass_normal
unc_grass_normal: @ 81271F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	lsrs r4, r0, 8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r3, _081272A0 @ =gUnknown_0202E844
	ldrb r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08127242
	ldr r2, _081272A4 @ =gSaveBlock1
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _08127228
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, r7
	beq _08127242
_08127228:
	ldr r1, [r3, 0x4]
	ldrh r0, [r5, 0x30]
	subs r0, r1
	strh r0, [r5, 0x30]
	ldr r1, [r3, 0x8]
	ldrh r0, [r5, 0x32]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrb r1, [r2, 0x5]
	lsls r1, 8
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strh r0, [r5, 0x38]
_08127242:
	ldrh r0, [r5, 0x34]
	lsrs r1, r0, 8
	mov r8, r1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r0, [r5, 0x36]
	lsls r0, 24
	lsrs r7, r0, 24
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127296
	adds r0, r6, 0
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _08127296
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081272A8
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081272A8
_08127296:
	adds r0, r5, 0
	movs r1, 0x4
	bl FieldEffectStop
	b _081272EC
	.align 2, 0
_081272A0: .4byte gUnknown_0202E844
_081272A4: .4byte gSaveBlock1
_081272A8:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _081272F8 @ =gMapObjects
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, [r5, 0x30]
	cmp r0, r1
	beq _081272C8
	ldr r0, [r2, 0x14]
	cmp r0, r1
	beq _081272C8
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_081272C8:
	movs r6, 0
	adds r0, r5, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	bne _081272D6
	movs r6, 0x4
_081272D6:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_812882C
_081272EC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081272F8: .4byte gMapObjects
	thumb_func_end unc_grass_normal

	thumb_func_start FldEff_JumpTallGrass
FldEff_JumpTallGrass: @ 81272FC
	push {r4,lr}
	ldr r4, _08127360 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _08127364 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x28]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127358
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127368 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xC
	strh r0, [r2, 0x30]
_08127358:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127360: .4byte gUnknown_0202FF84
_08127364: .4byte gFieldEffectObjectTemplatePointers
_08127368: .4byte gSprites
	thumb_func_end FldEff_JumpTallGrass

	thumb_func_start sub_8126FF0
sub_8126FF0: @ 812736C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r5, 0
	ldr r0, _081273DC @ =gSprites
	mov r8, r0
	lsls r3, 16
	asrs r3, 16
	lsls r4, 16
	asrs r4, 16
_08127390:
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _081273E4
	ldr r1, [r2, 0x1C]
	ldr r0, _081273E0 @ =unc_grass_normal
	cmp r1, r0
	bne _081273E4
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r3, r0
	bne _081273E4
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r4, r0
	bne _081273E4
	ldrh r1, [r2, 0x34]
	lsrs r0, r1, 8
	cmp r12, r0
	bne _081273E4
	movs r0, 0xFF
	ands r0, r1
	cmp r7, r0
	bne _081273E4
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r6, r0
	bne _081273E4
	adds r0, r5, 0
	b _081273F0
	.align 2, 0
_081273DC: .4byte gSprites
_081273E0: .4byte unc_grass_normal
_081273E4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3F
	bls _08127390
	movs r0, 0x40
_081273F0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8126FF0

	thumb_func_start FldEff_LongGrass
FldEff_LongGrass: @ 81273FC
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08127498 @ =gUnknown_0202FF84
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _0812749C @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x3C]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0812748C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081274A0 @ =gSprites
	adds r4, r0, r1
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5, 0x8]
	bl ZCoordToPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r0, [r4, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r4, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r4, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r4, 0x36]
	ldr r0, [r5, 0x18]
	strh r0, [r4, 0x38]
	ldr r0, [r5, 0x1C]
	cmp r0, 0
	beq _0812748C
	adds r0, r4, 0
	movs r1, 0x6
	bl SeekSpriteAnim
_0812748C:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127498: .4byte gUnknown_0202FF84
_0812749C: .4byte gFieldEffectObjectTemplatePointers
_081274A0: .4byte gSprites
	thumb_func_end FldEff_LongGrass

	thumb_func_start unc_grass_tall
unc_grass_tall: @ 81274A4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	lsrs r7, r0, 8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _0812754C @ =gUnknown_0202E844
	ldrb r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081274EE
	ldr r2, _08127550 @ =gSaveBlock1
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _081274D4
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r0, r6
	beq _081274EE
_081274D4:
	ldr r1, [r3, 0x4]
	ldrh r0, [r5, 0x30]
	subs r0, r1
	strh r0, [r5, 0x30]
	ldr r1, [r3, 0x8]
	ldrh r0, [r5, 0x32]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrb r1, [r2, 0x5]
	lsls r1, 8
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strh r0, [r5, 0x38]
_081274EE:
	ldrh r0, [r5, 0x34]
	lsrs r1, r0, 8
	mov r8, r1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r5, 0x36]
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127542
	adds r0, r4, 0
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08127542
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08127554
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127554
_08127542:
	adds r0, r5, 0
	movs r1, 0x11
	bl FieldEffectStop
	b _0812758A
	.align 2, 0
_0812754C: .4byte gUnknown_0202E844
_08127550: .4byte gSaveBlock1
_08127554:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127598 @ =gMapObjects
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, [r5, 0x30]
	cmp r0, r1
	beq _08127574
	ldr r0, [r2, 0x14]
	cmp r0, r1
	beq _08127574
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_08127574:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r5, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl sub_812882C
_0812758A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08127598: .4byte gMapObjects
	thumb_func_end unc_grass_tall

	thumb_func_start FldEff_JumpLongGrass
FldEff_JumpLongGrass: @ 812759C
	push {r4,lr}
	ldr r4, _08127600 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127604 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x40]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081275F8
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127608 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0x12
	strh r0, [r2, 0x30]
_081275F8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127600: .4byte gUnknown_0202FF84
_08127604: .4byte gFieldEffectObjectTemplatePointers
_08127608: .4byte gSprites
	thumb_func_end FldEff_JumpLongGrass

	thumb_func_start FldEff_ShortGrass
FldEff_ShortGrass: @ 812760C
	push {r4-r6,lr}
	ldr r6, _081276A0 @ =gUnknown_0202FF84
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _081276A4 @ =gMapObjects
	adds r5, r1, r0
	ldr r0, _081276A8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x78]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127698
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r4, _081276AC @ =gSprites
	adds r2, r4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r6]
	strh r0, [r2, 0x2E]
	ldr r0, [r6, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r6, 0x8]
	strh r0, [r2, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r2, 0x34]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x36]
_08127698:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081276A0: .4byte gUnknown_0202FF84
_081276A4: .4byte gMapObjects
_081276A8: .4byte gFieldEffectObjectTemplatePointers
_081276AC: .4byte gSprites
	thumb_func_end FldEff_ShortGrass

	thumb_func_start sub_8127334
sub_8127334: @ 81276B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _081276EE
	ldr r5, _081276F8 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 29
	cmp r0, 0
	blt _081276FC
_081276EE:
	adds r0, r4, 0
	movs r1, 0x29
	bl FieldEffectStop
	b _08127792
	.align 2, 0
_081276F8: .4byte gMapObjects
_081276FC:
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r8, r0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081277A0 @ =gSprites
	adds r6, r0, r1
	ldrh r5, [r6, 0x22]
	ldrh r7, [r6, 0x20]
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08127738
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _08127752
_08127738:
	strh r7, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08127752
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_08127752:
	strh r7, [r4, 0x20]
	strh r5, [r4, 0x22]
	mov r1, r8
	ldrh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 17
	subs r0, 0x8
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r0, [r6, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r6, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_806487C
_08127792:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081277A0: .4byte gSprites
	thumb_func_end sub_8127334

	thumb_func_start FldEff_SandFootprints
FldEff_SandFootprints: @ 81277A4
	push {r4,lr}
	ldr r4, _0812780C @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127810 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x2C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08127802
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127814 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0xD
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_08127802:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0812780C: .4byte gUnknown_0202FF84
_08127810: .4byte gFieldEffectObjectTemplatePointers
_08127814: .4byte gSprites
	thumb_func_end FldEff_SandFootprints

	thumb_func_start FldEff_DeepSandFootprints
FldEff_DeepSandFootprints: @ 8127818
	push {r4,r5,lr}
	ldr r4, _08127880 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127884 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x5C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	cmp r1, 0x40
	beq _08127878
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127888 @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x18
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_08127878:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08127880: .4byte gUnknown_0202FF84
_08127884: .4byte gFieldEffectObjectTemplatePointers
_08127888: .4byte gSprites
	thumb_func_end FldEff_DeepSandFootprints

	thumb_func_start FldEff_BikeTireTracks
FldEff_BikeTireTracks: @ 812788C
	push {r4,r5,lr}
	ldr r4, _081278F4 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _081278F8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x6C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	adds r5, r1, 0
	cmp r1, 0x40
	beq _081278EC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081278FC @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x3
	ldrb r2, [r4, 0xC]
	ands r2, r1
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x23
	strh r1, [r0, 0x3C]
	ldrb r1, [r4, 0x10]
	bl StartSpriteAnim
_081278EC:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081278F4: .4byte gUnknown_0202FF84
_081278F8: .4byte gFieldEffectObjectTemplatePointers
_081278FC: .4byte gSprites
	thumb_func_end FldEff_BikeTireTracks

	thumb_func_start sub_8127584
sub_8127584: @ 8127900
	push {lr}
	ldr r2, _08127918 @ =gUnknown_08401E40
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08127918: .4byte gUnknown_08401E40
	thumb_func_end sub_8127584

	thumb_func_start sub_81275A0
sub_81275A0: @ 812791C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _08127932
	movs r0, 0x1
	strh r0, [r1, 0x2E]
_08127932:
	adds r0, r1, 0
	movs r1, 0
	bl sub_806487C
	pop {r0}
	bx r0
	thumb_func_end sub_81275A0

	thumb_func_start sub_81275C4
sub_81275C4: @ 8127940
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	ldrb r1, [r3]
	lsls r1, 29
	lsrs r1, 31
	adds r0, r4, 0
	bl sub_806487C
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x38
	ble _08127984
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
_08127984:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81275C4

	thumb_func_start FldEff_Splash
FldEff_Splash: @ 812798C
	push {r4-r6,lr}
	ldr r6, _08127A20 @ =gUnknown_0202FF84
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127A24 @ =gMapObjects
	adds r5, r1, r0
	ldr r0, _08127A28 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x34]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _08127A16
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	ldr r4, _08127A2C @ =gSprites
	adds r3, r4
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	ldrb r2, [r5, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r4, [r3, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r2
	strb r1, [r3, 0x5]
	ldr r1, [r6]
	strh r1, [r3, 0x2E]
	ldr r1, [r6, 0x4]
	strh r1, [r3, 0x30]
	ldr r1, [r6, 0x8]
	strh r1, [r3, 0x32]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	subs r0, 0x4
	strh r0, [r3, 0x26]
	movs r0, 0x46
	bl PlaySE
_08127A16:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08127A20: .4byte gUnknown_0202FF84
_08127A24: .4byte gMapObjects
_08127A28: .4byte gFieldEffectObjectTemplatePointers
_08127A2C: .4byte gSprites
	thumb_func_end FldEff_Splash

	thumb_func_start sub_81276B4
sub_81276B4: @ 8127A30
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08127A60
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _08127A6A
_08127A60:
	adds r0, r4, 0
	movs r1, 0xF
	bl FieldEffectStop
	b _08127AAA
_08127A6A:
	ldr r3, _08127AB4 @ =gSprites
	ldr r2, _08127AB8 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x20]
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_08127AAA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08127AB4: .4byte gSprites
_08127AB8: .4byte gMapObjects
	thumb_func_end sub_81276B4

	thumb_func_start FldEff_JumpSmallSplash
FldEff_JumpSmallSplash: @ 8127ABC
	push {r4,lr}
	ldr r4, _08127B20 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _08127B24 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x38]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127B18
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127B28 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0x10
	strh r0, [r2, 0x30]
_08127B18:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127B20: .4byte gUnknown_0202FF84
_08127B24: .4byte gFieldEffectObjectTemplatePointers
_08127B28: .4byte gSprites
	thumb_func_end FldEff_JumpSmallSplash

	thumb_func_start FldEff_JumpBigSplash
FldEff_JumpBigSplash: @ 8127B2C
	push {r4,lr}
	ldr r4, _08127B90 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127B94 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x30]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127B88
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127B98 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xE
	strh r0, [r2, 0x30]
_08127B88:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127B90: .4byte gUnknown_0202FF84
_08127B94: .4byte gFieldEffectObjectTemplatePointers
_08127B98: .4byte gSprites
	thumb_func_end FldEff_JumpBigSplash

	thumb_func_start FldEff_FeetInFlowingWater
FldEff_FeetInFlowingWater: @ 8127B9C
	push {r4-r7,lr}
	ldr r7, _08127C3C @ =gUnknown_0202FF84
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127C40 @ =gMapObjects
	adds r6, r1, r0
	ldr r0, _08127C44 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x34]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _08127C32
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	ldr r3, _08127C48 @ =gSprites
	adds r0, r3
	ldr r1, _08127C4C @ =sub_81278D8
	str r1, [r0, 0x1C]
	adds r5, r0, 0
	adds r5, 0x3E
	ldrb r1, [r5]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r5]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldr r1, _08127C50 @ =0x0000ffff
	strh r1, [r0, 0x34]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x36]
	ldrh r1, [r4, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x1
	bl StartSpriteAnim
_08127C32:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08127C3C: .4byte gUnknown_0202FF84
_08127C40: .4byte gMapObjects
_08127C44: .4byte gFieldEffectObjectTemplatePointers
_08127C48: .4byte gSprites
_08127C4C: .4byte sub_81278D8
_08127C50: .4byte 0x0000ffff
	thumb_func_end FldEff_FeetInFlowingWater

	thumb_func_start sub_81278D8
sub_81278D8: @ 8127C54
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127C8E
	ldr r2, _08127C98 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrb r0, [r5, 0x2]
	lsls r0, 28
	cmp r0, 0
	blt _08127C9C
_08127C8E:
	adds r0, r4, 0
	movs r1, 0x22
	bl FieldEffectStop
	b _08127CE6
	.align 2, 0
_08127C98: .4byte gMapObjects
_08127C9C:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08127CF0 @ =gSprites
	adds r0, r1
	ldrh r1, [r0, 0x20]
	strh r1, [r4, 0x20]
	ldrh r1, [r0, 0x22]
	strh r1, [r4, 0x22]
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldr r1, [r5, 0x10]
	ldr r0, [r4, 0x34]
	cmp r1, r0
	beq _08127CE6
	ldrh r0, [r5, 0x10]
	strh r0, [r4, 0x34]
	ldrh r0, [r5, 0x12]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _08127CE6
	movs r0, 0x46
	bl PlaySE
_08127CE6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127CF0: .4byte gSprites
	thumb_func_end sub_81278D8

	thumb_func_start FldEff_Ripple
FldEff_Ripple: @ 8127CF4
	push {r4,lr}
	ldr r0, _08127D48 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x14]
	ldr r4, _08127D4C @ =gUnknown_0202FF84
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127D40
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127D50 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x5
	strh r0, [r2, 0x2E]
_08127D40:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127D48: .4byte gFieldEffectObjectTemplatePointers
_08127D4C: .4byte gUnknown_0202FF84
_08127D50: .4byte gSprites
	thumb_func_end FldEff_Ripple

	thumb_func_start FldEff_HotSpringsWater
FldEff_HotSpringsWater: @ 8127D54
	push {r4-r6,lr}
	ldr r6, _08127DE8 @ =gUnknown_0202FF84
	ldrb r0, [r6]
	ldrb r1, [r6, 0x4]
	ldrb r2, [r6, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08127DEC @ =gMapObjects
	adds r5, r1, r0
	ldr r0, _08127DF0 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x7C]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127DE0
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r4, _08127DF4 @ =gSprites
	adds r2, r4
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r6]
	strh r0, [r2, 0x2E]
	ldr r0, [r6, 0x4]
	strh r0, [r2, 0x30]
	ldr r0, [r6, 0x8]
	strh r0, [r2, 0x32]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r2, 0x34]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r2, 0x36]
_08127DE0:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08127DE8: .4byte gUnknown_0202FF84
_08127DEC: .4byte gMapObjects
_08127DF0: .4byte gFieldEffectObjectTemplatePointers
_08127DF4: .4byte gSprites
	thumb_func_end FldEff_HotSpringsWater

	thumb_func_start sub_8127A7C
sub_8127A7C: @ 8127DF8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08127E32
	ldr r5, _08127E3C @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1, 0x2]
	lsls r0, 26
	cmp r0, 0
	blt _08127E40
_08127E32:
	adds r0, r4, 0
	movs r1, 0x2A
	bl FieldEffectStop
	b _08127E84
	.align 2, 0
_08127E3C: .4byte gMapObjects
_08127E40:
	ldrb r0, [r1, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r2, _08127E8C @ =gSprites
	adds r1, r2
	ldrh r2, [r1, 0x20]
	strh r2, [r4, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r2, [r1, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r4, 0x22]
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_08127E84:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08127E8C: .4byte gSprites
	thumb_func_end sub_8127A7C

	thumb_func_start FldEff_Unknown19
FldEff_Unknown19: @ 8127E90
	push {r4,lr}
	ldr r4, _08127EF0 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127EF4 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x44]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127EE8
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127EF8 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x13
	strh r0, [r2, 0x2E]
_08127EE8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127EF0: .4byte gUnknown_0202FF84
_08127EF4: .4byte gFieldEffectObjectTemplatePointers
_08127EF8: .4byte gSprites
	thumb_func_end FldEff_Unknown19

	thumb_func_start FldEff_Unknown20
FldEff_Unknown20: @ 8127EFC
	push {r4,lr}
	ldr r4, _08127F5C @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127F60 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x48]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127F54
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127F64 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x14
	strh r0, [r2, 0x2E]
_08127F54:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127F5C: .4byte gUnknown_0202FF84
_08127F60: .4byte gFieldEffectObjectTemplatePointers
_08127F64: .4byte gSprites
	thumb_func_end FldEff_Unknown20

	thumb_func_start FldEff_Unknown21
FldEff_Unknown21: @ 8127F68
	push {r4,lr}
	ldr r4, _08127FC8 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08127FCC @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x4C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08127FC0
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08127FD0 @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x15
	strh r0, [r2, 0x2E]
_08127FC0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08127FC8: .4byte gUnknown_0202FF84
_08127FCC: .4byte gFieldEffectObjectTemplatePointers
_08127FD0: .4byte gSprites
	thumb_func_end FldEff_Unknown21

	thumb_func_start FldEff_Unknown22
FldEff_Unknown22: @ 8127FD4
	push {r4,lr}
	ldr r4, _08128034 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08128038 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x50]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812802C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0812803C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x16
	strh r0, [r2, 0x2E]
_0812802C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128034: .4byte gUnknown_0202FF84
_08128038: .4byte gFieldEffectObjectTemplatePointers
_0812803C: .4byte gSprites
	thumb_func_end FldEff_Unknown22

	thumb_func_start ash
ash: @ 8128040
	push {r4,lr}
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _08128070 @ =gUnknown_0202FF84
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	lsls r1, 16
	asrs r1, 16
	str r1, [r4, 0x4]
	movs r0, 0x52
	str r0, [r4, 0x8]
	movs r0, 0x1
	str r0, [r4, 0xC]
	str r2, [r4, 0x10]
	lsls r3, 16
	asrs r3, 16
	str r3, [r4, 0x14]
	movs r0, 0x7
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128070: .4byte gUnknown_0202FF84
	thumb_func_end ash

	thumb_func_start FldEff_Ash
FldEff_Ash: @ 8128074
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _081280F4 @ =gUnknown_0202FF84
	ldrh r1, [r5]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r5, 0x4]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _081280F8 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x18]
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r3, 0
	ldrsh r2, [r4, r3]
	ldrb r3, [r5, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081280EA
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _081280FC @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r5, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r5]
	strh r0, [r2, 0x30]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x10]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x14]
	strh r0, [r2, 0x36]
_081280EA:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081280F4: .4byte gUnknown_0202FF84
_081280F8: .4byte gFieldEffectObjectTemplatePointers
_081280FC: .4byte gSprites
	thumb_func_end FldEff_Ash

	thumb_func_start sub_8127D84
sub_8127D84: @ 8128100
	push {lr}
	ldr r2, _08128118 @ =gUnknown_08401E48
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08128118: .4byte gUnknown_08401E48
	thumb_func_end sub_8127D84

	thumb_func_start sub_8127DA0
sub_8127DA0: @ 812811C
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08128146
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_08128146:
	pop {r0}
	bx r0
	thumb_func_end sub_8127DA0

	thumb_func_start sub_8127DD0
sub_8127DD0: @ 812814C
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	subs r2, 0x12
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x34]
	bl MapGridSetMetatileIdAt
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	ldr r2, _081281A4 @ =gMapObjects
	ldr r0, _081281A8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081281A4: .4byte gMapObjects
_081281A8: .4byte gPlayerAvatar
	thumb_func_end sub_8127DD0

	thumb_func_start sub_8127E30
sub_8127E30: @ 81281AC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_806487C
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081281CC
	adds r0, r4, 0
	movs r1, 0x7
	bl FieldEffectStop
_081281CC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8127E30

	thumb_func_start FldEff_SurfBlob
FldEff_SurfBlob: @ 81281D4
	push {r4,r5,lr}
	ldr r4, _0812823C @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08128240 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x1C]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x96
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	cmp r0, 0x40
	beq _0812822E
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08128244 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r1, 0x32]
	ldr r0, _08128248 @ =0x0000ffff
	strh r0, [r1, 0x34]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r1, 0x3A]
	strh r0, [r1, 0x3C]
_0812822E:
	movs r0, 0x8
	bl FieldEffectActiveListRemove
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0812823C: .4byte gUnknown_0202FF84
_08128240: .4byte gFieldEffectObjectTemplatePointers
_08128244: .4byte gSprites
_08128248: .4byte 0x0000ffff
	thumb_func_end FldEff_SurfBlob

	thumb_func_start sub_8127ED0
sub_8127ED0: @ 812824C
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08128274 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0x10
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 24
	orrs r0, r3
	strh r0, [r2, 0x2E]
	bx lr
	.align 2, 0
_08128274: .4byte gSprites
	thumb_func_end sub_8127ED0

	thumb_func_start sub_8127EFC
sub_8127EFC: @ 8128278
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _081282A0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrh r0, [r2, 0x2E]
	movs r3, 0xF1
	negs r3, r3
	ands r3, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 20
	orrs r3, r0
	strh r3, [r2, 0x2E]
	bx lr
	.align 2, 0
_081282A0: .4byte gSprites
	thumb_func_end sub_8127EFC

	thumb_func_start sub_8127F28
sub_8127F28: @ 81282A4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r4, _081282D0 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	ldrh r0, [r3, 0x2E]
	ldr r4, _081282D4 @ =0xfffff0ff
	ands r4, r0
	movs r0, 0xF0
	lsls r0, 20
	ands r0, r1
	lsrs r0, 16
	orrs r4, r0
	strh r4, [r3, 0x2E]
	strh r2, [r3, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081282D0: .4byte gSprites
_081282D4: .4byte 0xfffff0ff
	thumb_func_end sub_8127F28

	thumb_func_start sub_8127F5C
sub_8127F5C: @ 81282D8
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	bx lr
	thumb_func_end sub_8127F5C

	thumb_func_start sub_8127F64
sub_8127F64: @ 81282E0
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	ands r0, r1
	lsrs r0, 4
	bx lr
	thumb_func_end sub_8127F64

	thumb_func_start sub_8127F70
sub_8127F70: @ 81282EC
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF0
	lsls r0, 4
	ands r0, r1
	lsrs r0, 8
	bx lr
	thumb_func_end sub_8127F70

	thumb_func_start sub_8127F7C
sub_8127F7C: @ 81282F8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x32
	ldrsh r0, [r6, r1]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08128348 @ =gMapObjects
	adds r4, r0
	ldrb r0, [r4, 0x4]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r0, _0812834C @ =gSprites
	adds r5, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8127FD4
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_812800C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_81280A0
	ldrb r0, [r5, 0x5]
	movs r1, 0xC
	ands r1, r0
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128348: .4byte gMapObjects
_0812834C: .4byte gSprites
	thumb_func_end sub_8127F7C

	thumb_func_start sub_8127FD4
sub_8127FD4: @ 8128350
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _08128384 @ =gUnknown_08401E54
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl sub_8127F64
	lsls r0, 24
	cmp r0, 0
	bne _0812837C
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl StartSpriteAnimIfDifferent
_0812837C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128384: .4byte gUnknown_08401E54
	thumb_func_end sub_8127FD4

	thumb_func_start sub_812800C
sub_812800C: @ 8128388
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r1, 0
	ldrh r2, [r0, 0x10]
	mov r1, sp
	strh r2, [r1]
	ldrh r1, [r0, 0x12]
	mov r0, sp
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0x26
	ldrsh r3, [r4, r2]
	mov r8, r0
	cmp r3, 0
	bne _08128410
	mov r0, sp
	movs r5, 0
	ldrsh r2, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r2, r0
	bne _081283C4
	lsls r0, r1, 16
	asrs r0, 16
	movs r5, 0x3C
	ldrsh r1, [r4, r5]
	cmp r0, r1
	beq _08128410
_081283C4:
	strh r3, [r4, 0x38]
	strh r2, [r4, 0x3A]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	strh r0, [r4, 0x3C]
	movs r5, 0x1
	mov r7, r8
	mov r6, sp
_081283D6:
	adds r0, r5, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _081283FC
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _08128410
_081283FC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r4, 0x3A]
	strh r0, [r6]
	ldrh r0, [r4, 0x3C]
	mov r1, r8
	strh r0, [r1]
	cmp r5, 0x4
	bls _081283D6
_08128410:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812800C

	thumb_func_start sub_81280A0
sub_81280A0: @ 812841C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _08128480 @ =gUnknown_08401E5A
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	bl sub_8127F5C
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r2, 0
	beq _08128496
	ldrh r1, [r4, 0x36]
	adds r1, 0x1
	strh r1, [r4, 0x36]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0812845C
	ldrh r0, [r4, 0x34]
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
_0812845C:
	ldrh r1, [r4, 0x36]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0812846C
	ldrh r0, [r4, 0x34]
	negs r0, r0
	strh r0, [r4, 0x34]
_0812846C:
	cmp r2, 0x2
	beq _08128496
	adds r0, r4, 0
	bl sub_8127F70
	lsls r0, 24
	cmp r0, 0
	bne _08128484
	ldrh r0, [r4, 0x26]
	b _0812848A
	.align 2, 0
_08128480: .4byte gUnknown_08401E5A
_08128484:
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x30]
	adds r0, r3
_0812848A:
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_08128496:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81280A0

	thumb_func_start sub_8128124
sub_8128124: @ 81284A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081284E4 @ =gDummySpriteTemplate
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _081284E8 @ =gSprites
	adds r2, r1
	ldr r1, _081284EC @ =sub_8128174
	str r1, [r2, 0x1C]
	movs r1, 0x3E
	adds r1, r2
	mov r12, r1
	ldrb r1, [r1]
	movs r3, 0x4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	strh r4, [r2, 0x2E]
	movs r1, 0x1
	strh r1, [r2, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081284E4: .4byte gDummySpriteTemplate
_081284E8: .4byte gSprites
_081284EC: .4byte sub_8128174
	thumb_func_end sub_8128124

	thumb_func_start sub_8128174
sub_8128174: @ 81284F0
	push {lr}
	adds r2, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0812852C @ =gSprites
	adds r3, r0, r1
	ldrh r1, [r2, 0x32]
	adds r0, r1, 0x1
	strh r0, [r2, 0x32]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08128518
	ldrh r0, [r2, 0x30]
	ldrh r1, [r3, 0x26]
	adds r0, r1
	strh r0, [r3, 0x26]
_08128518:
	ldrh r1, [r2, 0x32]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08128528
	ldrh r0, [r2, 0x30]
	negs r0, r0
	strh r0, [r2, 0x30]
_08128528:
	pop {r0}
	bx r0
	.align 2, 0
_0812852C: .4byte gSprites
	thumb_func_end sub_8128174

	thumb_func_start FldEff_Dust
FldEff_Dust: @ 8128530
	push {r4,lr}
	ldr r4, _08128594 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0xC
	bl sub_8060470
	ldr r0, _08128598 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x24]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812858C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0812859C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r4, 0x8]
	strh r0, [r2, 0x2E]
	movs r0, 0xA
	strh r0, [r2, 0x30]
_0812858C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128594: .4byte gUnknown_0202FF84
_08128598: .4byte gFieldEffectObjectTemplatePointers
_0812859C: .4byte gSprites
	thumb_func_end FldEff_Dust

	thumb_func_start FldEff_SandPile
FldEff_SandPile: @ 81285A0
	push {r4-r7,lr}
	ldr r7, _0812864C @ =gUnknown_0202FF84
	ldrb r0, [r7]
	ldrb r1, [r7, 0x4]
	ldrb r2, [r7, 0x8]
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08128650 @ =gMapObjects
	adds r6, r1, r0
	ldr r0, _08128654 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x74]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _08128644
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r4, _08128658 @ =gSprites
	adds r0, r4
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	movs r2, 0xC
	ands r2, r1
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	strh r1, [r0, 0x2E]
	ldr r1, [r7, 0x4]
	strh r1, [r0, 0x30]
	ldr r1, [r7, 0x8]
	strh r1, [r0, 0x32]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x34]
	ldrb r2, [r6, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x36]
	ldrh r1, [r5, 0xA]
	lsls r1, 16
	asrs r1, 17
	subs r1, 0x2
	strh r1, [r0, 0x26]
	movs r1, 0x2
	bl SeekSpriteAnim
_08128644:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0812864C: .4byte gUnknown_0202FF84
_08128650: .4byte gMapObjects
_08128654: .4byte gFieldEffectObjectTemplatePointers
_08128658: .4byte gSprites
	thumb_func_end FldEff_SandPile

	thumb_func_start sub_81282E0
sub_81282E0: @ 812865C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08128696
	ldr r2, _081286A0 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1, 0x2]
	lsls r0, 27
	cmp r0, 0
	blt _081286A4
_08128696:
	adds r0, r4, 0
	movs r1, 0x27
	bl FieldEffectStop
	b _08128716
	.align 2, 0
_081286A0: .4byte gMapObjects
_081286A4:
	ldr r2, _08128720 @ =gSprites
	ldrb r1, [r1, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r5, [r0, 0x22]
	ldrh r6, [r0, 0x20]
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _081286CC
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _081286E6
_081286CC:
	strh r6, [r4, 0x34]
	strh r5, [r4, 0x36]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081286E6
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_081286E6:
	strh r6, [r4, 0x20]
	strh r5, [r4, 0x22]
	ldr r3, _08128720 @ =gSprites
	ldr r2, _08128724 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
_08128716:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08128720: .4byte gSprites
_08128724: .4byte gMapObjects
	thumb_func_end sub_81282E0

	thumb_func_start FldEff_Bubbles
FldEff_Bubbles: @ 8128728
	push {r4,lr}
	ldr r4, _08128780 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0
	bl sub_8060470
	ldr r0, _08128784 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x88
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08128778
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08128788 @ =gSprites
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
_08128778:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128780: .4byte gUnknown_0202FF84
_08128784: .4byte gFieldEffectObjectTemplatePointers
_08128788: .4byte gSprites
	thumb_func_end FldEff_Bubbles

	thumb_func_start sub_8128410
sub_8128410: @ 812878C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	movs r1, 0x80
	lsls r1, 1
	ands r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, r0
	strh r1, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldrh r1, [r4, 0x3E]
	ldr r0, _081287C8 @ =0x00001004
	ands r0, r1
	cmp r0, 0
	beq _081287C0
	adds r0, r4, 0
	movs r1, 0x35
	bl FieldEffectStop
_081287C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081287C8: .4byte 0x00001004
	thumb_func_end sub_8128410

	thumb_func_start FldEff_BerryTreeGrowthSparkle
FldEff_BerryTreeGrowthSparkle: @ 81287CC
	push {r4,lr}
	ldr r4, _08128834 @ =gUnknown_0202FF84
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x4
	bl sub_8060470
	ldr r0, _08128838 @ =gFieldEffectObjectTemplatePointers
	ldr r0, [r0, 0x58]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0812882C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0812883C @ =gSprites
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0x3
	ldrb r1, [r4, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	movs r1, 0xF
	ands r0, r1
	movs r1, 0x50
	orrs r0, r1
	strb r0, [r2, 0x5]
	movs r0, 0x17
	strh r0, [r2, 0x2E]
_0812882C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128834: .4byte gUnknown_0202FF84
_08128838: .4byte gFieldEffectObjectTemplatePointers
_0812883C: .4byte gSprites
	thumb_func_end FldEff_BerryTreeGrowthSparkle

	thumb_func_start FldEff_TreeDisguise
FldEff_TreeDisguise: @ 8128840
	push {lr}
	movs r0, 0x1C
	movs r1, 0x18
	movs r2, 0x4
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_TreeDisguise

	thumb_func_start FldEff_MountainDisguise
FldEff_MountainDisguise: @ 8128850
	push {lr}
	movs r0, 0x1D
	movs r1, 0x19
	movs r2, 0x3
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_MountainDisguise

	thumb_func_start FldEff_SandDisguise
FldEff_SandDisguise: @ 8128860
	push {lr}
	movs r0, 0x24
	movs r1, 0x1C
	movs r2, 0x2
	bl ShowDisguiseFieldEffect
	pop {r1}
	bx r1
	thumb_func_end FldEff_SandDisguise

	thumb_func_start ShowDisguiseFieldEffect
ShowDisguiseFieldEffect: @ 8128870
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r5, _081288A4 @ =gUnknown_0202FF84
	ldrb r0, [r5]
	ldrb r1, [r5, 0x4]
	ldrb r2, [r5, 0x8]
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _081288A8
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	movs r0, 0x40
	b _08128914
	.align 2, 0
_081288A4: .4byte gUnknown_0202FF84
_081288A8:
	ldr r1, _08128920 @ =gFieldEffectObjectTemplatePointers
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	mov r1, sp
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08128910
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08128924 @ =gSprites
	adds r2, r0
	movs r0, 0x3E
	adds r0, r2
	mov r12, r0
	ldrb r3, [r0]
	lsls r1, r3, 30
	lsrs r1, 31
	adds r1, 0x1
	movs r0, 0x1
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	lsls r3, r7, 4
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x5]
	mov r0, r8
	strh r0, [r2, 0x30]
	ldr r0, [r5]
	strh r0, [r2, 0x32]
	ldr r0, [r5, 0x4]
	strh r0, [r2, 0x34]
	ldr r0, [r5, 0x8]
	strh r0, [r2, 0x36]
_08128910:
	mov r0, sp
	ldrb r0, [r0]
_08128914:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08128920: .4byte gFieldEffectObjectTemplatePointers
_08128924: .4byte gSprites
	thumb_func_end ShowDisguiseFieldEffect

	thumb_func_start sub_81285AC
sub_81285AC: @ 8128928
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5, 0x36]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	beq _08128958
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_08128958:
	ldr r4, _08128A10 @ =gMapObjects
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r1, sp
	ldrb r2, [r1]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x4]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r1, _08128A14 @ =gSprites
	adds r2, r1
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r3, 0x3E
	adds r3, r5
	mov r12, r3
	movs r3, 0x4
	ands r3, r1
	mov r1, r12
	ldrb r4, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	ldrh r1, [r2, 0x20]
	strh r1, [r5, 0x20]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	ldrh r1, [r2, 0x22]
	adds r0, r1
	subs r0, 0x10
	strh r0, [r5, 0x22]
	adds r2, 0x43
	ldrb r0, [r2]
	subs r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	bne _081289D8
	adds r0, r1, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_081289D8:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	ldrh r2, [r5, 0x2E]
	cmp r0, 0x2
	bne _081289F4
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081289F4
	movs r0, 0x1
	strh r0, [r5, 0x3C]
_081289F4:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _08128A08
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldEffectStop
_08128A08:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128A10: .4byte gMapObjects
_08128A14: .4byte gSprites
	thumb_func_end sub_81285AC

	thumb_func_start sub_812869C
sub_812869C: @ 8128A18
	push {lr}
	adds r1, r0, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08128A36
	ldr r2, _08128A3C @ =gSprites
	ldrb r1, [r1, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
_08128A36:
	pop {r0}
	bx r0
	.align 2, 0
_08128A3C: .4byte gSprites
	thumb_func_end sub_812869C

	thumb_func_start sub_81286C4
sub_81286C4: @ 8128A40
	push {lr}
	adds r2, r0, 0
	adds r2, 0x21
	ldrb r1, [r2]
	cmp r1, 0x2
	beq _08128A76
	cmp r1, 0
	beq _08128A76
	ldrb r1, [r0, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08128A68 @ =gSprites
	adds r1, r0, r1
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08128A6C
	movs r0, 0
	b _08128A78
	.align 2, 0
_08128A68: .4byte gSprites
_08128A6C:
	movs r0, 0x2
	strb r0, [r2]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_08128A76:
	movs r0, 0x1
_08128A78:
	pop {r1}
	bx r1
	thumb_func_end sub_81286C4

	thumb_func_start FldEff_Sparkle
FldEff_Sparkle: @ 8128A7C
	push {r4,lr}
	ldr r4, _08128AE4 @ =gUnknown_0202FF84
	ldr r0, [r4]
	adds r0, 0x7
	str r0, [r4]
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	str r0, [r4, 0x4]
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08128AE8 @ =gFieldEffectObjectTemplatePointers
	adds r0, 0x8C
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08128ADC
	ldr r0, _08128AEC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	ldrb r2, [r4, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r1]
_08128ADC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08128AE4: .4byte gUnknown_0202FF84
_08128AE8: .4byte gFieldEffectObjectTemplatePointers
_08128AEC: .4byte gSprites
	thumb_func_end FldEff_Sparkle

	thumb_func_start sub_8128774
sub_8128774: @ 8128AF0
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08128B24
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08128B1C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_08128B1C:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08128B3A
_08128B24:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x22
	ble _08128B3A
	adds r0, r2, 0
	movs r1, 0x36
	bl FieldEffectStop
_08128B3A:
	pop {r0}
	bx r0
	thumb_func_end sub_8128774

	thumb_func_start sub_81287C4
sub_81287C4: @ 8128B40
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08128B5E
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _08128B74
_08128B5E:
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0
	bl SetObjectSubpriorityByZCoord
_08128B74:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81287C4

	thumb_func_start sub_8128800
sub_8128800: @ 8128B7C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08128B9A
	ldrh r1, [r2, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl FieldEffectStop
	b _08128BA2
_08128B9A:
	adds r0, r2, 0
	movs r1, 0
	bl sub_806487C
_08128BA2:
	pop {r0}
	bx r0
	thumb_func_end sub_8128800

	thumb_func_start sub_812882C
sub_812882C: @ 8128BA8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r0, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, 0
	bl SetObjectSubpriorityByZCoord
	movs r7, 0
_08128BBE:
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 2
	ldr r1, _08128C58 @ =gMapObjects
	adds r4, r0, r1
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _08128C60
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08128C5C @ =gSprites
	adds r5, r0, r1
	adds r0, r6, 0
	adds r0, 0x28
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r6, 0x20]
	adds r1, r0, r2
	subs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x20
	ldrsh r2, [r5, r0]
	cmp r1, r2
	bge _08128C60
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r2
	ble _08128C60
	adds r0, r5, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r2, [r5, 0x22]
	adds r2, r3
	ldrh r4, [r5, 0x22]
	adds r0, r6, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r6, 0x22]
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	adds r3, r0, r3
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	cmp r2, r3
	blt _08128C38
	cmp r2, r0
	bge _08128C60
_08128C38:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	ble _08128C60
	adds r2, r6, 0
	adds r2, 0x43
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bhi _08128C60
	adds r0, r1, 0x2
	strb r0, [r2]
	b _08128C6A
	.align 2, 0
_08128C58: .4byte gMapObjects
_08128C5C: .4byte gSprites
_08128C60:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0xF
	bls _08128BBE
_08128C6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812882C

	.align 2, 0 @ Don't pad with nop.
