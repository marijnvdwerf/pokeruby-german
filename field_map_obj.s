	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start npc_clear_ids_and_state
npc_clear_ids_and_state: @ 805AD90
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r2, 0x24
	bl memset
	movs r0, 0xFF
	strb r0, [r4, 0x8]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_clear_ids_and_state

	thumb_func_start npcs_clear_ids_and_state
npcs_clear_ids_and_state: @ 805ADB0
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0805ADD4
_0805ADB6:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl npc_clear_ids_and_state
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805ADB6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADD4: .4byte gMapObjects
	thumb_func_end npcs_clear_ids_and_state

	thumb_func_start sub_805AA98
sub_805AA98: @ 805ADD8
	push {lr}
	bl strange_npc_table_clear
	bl npcs_clear_ids_and_state
	bl ClearPlayerAvatarInfo
	bl sub_805AAB0
	pop {r0}
	bx r0
	thumb_func_end sub_805AA98

	thumb_func_start sub_805AAB0
sub_805AAB0: @ 805ADF0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _0805AE8C
	ldr r0, [r0, 0x54]
	mov r9, r0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805AE90
	mov r10, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r1, [r4, 0x1]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r6, 0x4
	orrs r0, r6
	strb r0, [r4]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r0, [r4, 0x1]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE8C: .4byte gFieldEffectObjectTemplatePointers
_0805AE90: .4byte gSprites
	thumb_func_end sub_805AAB0

	thumb_func_start sub_805AB54
sub_805AB54: @ 805AE94
	push {lr}
	movs r1, 0
	ldr r2, _0805AEA0
	ldrb r0, [r2]
	b _0805AEB8
	.align 2, 0
_0805AEA0: .4byte gMapObjects
_0805AEA4:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bhi _0805AEBE
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
_0805AEB8:
	lsls r0, 31
	cmp r0, 0
	bne _0805AEA4
_0805AEBE:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805AB54

	thumb_func_start GetFieldObjectIdByLocalIdAndMap
GetFieldObjectIdByLocalIdAndMap: @ 805AEC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0xFE
	bls _0805AEDC
	bl GetFieldObjectIdByLocalId
	b _0805AEE0
_0805AEDC:
	bl GetFieldObjectIdByLocalIdAndMapInternal
_0805AEE0:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalIdAndMap

	thumb_func_start TryGetFieldObjectIdByLocalIdAndMap
TryGetFieldObjectIdByLocalIdAndMap: @ 805AEE8
	push {r4,lr}
	adds r4, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectIdByLocalIdAndMap
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0805AF0A
	movs r0, 0
	b _0805AF0C
_0805AF0A:
	movs r0, 0x1
_0805AF0C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldObjectIdByLocalIdAndMap

	thumb_func_start GetFieldObjectIdByXY
GetFieldObjectIdByXY: @ 805AF14
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _0805AF54
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
_0805AF22:
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0805AF42
	movs r6, 0x10
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _0805AF42
	movs r6, 0x12
	ldrsh r0, [r2, r6]
	cmp r0, r1
	beq _0805AF4C
_0805AF42:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805AF22
_0805AF4C:
	adds r0, r3, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805AF54: .4byte gMapObjects
	thumb_func_end GetFieldObjectIdByXY

	thumb_func_start GetFieldObjectIdByLocalIdAndMapInternal
GetFieldObjectIdByLocalIdAndMapInternal: @ 805AF58
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	ldr r6, _0805AF90
_0805AF6A:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r6
	ldrb r0, [r3]
	lsls r0, 31
	cmp r0, 0
	beq _0805AF94
	ldrb r0, [r3, 0x8]
	cmp r0, r5
	bne _0805AF94
	ldrb r0, [r3, 0x9]
	cmp r0, r4
	bne _0805AF94
	ldrb r0, [r3, 0xA]
	cmp r0, r2
	bne _0805AF94
	adds r0, r1, 0
	b _0805AFA0
	.align 2, 0
_0805AF90: .4byte gMapObjects
_0805AF94:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0805AF6A
	movs r0, 0x10
_0805AFA0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalIdAndMapInternal

	thumb_func_start GetFieldObjectIdByLocalId
GetFieldObjectIdByLocalId: @ 805AFA8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _0805AFCC
_0805AFB2:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0805AFD0
	ldrb r0, [r1, 0x8]
	cmp r0, r3
	bne _0805AFD0
	adds r0, r2, 0
	b _0805AFDC
	.align 2, 0
_0805AFCC: .4byte gMapObjects
_0805AFD0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0805AFB2
	movs r0, 0x10
_0805AFDC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalId

	thumb_func_start InitFieldObjectStateFromTemplate
InitFieldObjectStateFromTemplate: @ 805AFE4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldrb r0, [r5]
	adds r1, r6, 0
	adds r2, r7, 0
	mov r3, sp
	bl GetAvailableFieldObjectSlot
	lsls r0, 24
	cmp r0, 0
	beq _0805B00E
	movs r0, 0x10
	b _0805B102
_0805B00E:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805B110
	adds r4, r0, r1
	adds r0, r4, 0
	bl npc_clear_ids_and_state
	ldrh r3, [r5, 0x4]
	adds r3, 0x7
	lsls r3, 16
	lsrs r3, 16
	ldrh r2, [r5, 0x6]
	adds r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	strb r0, [r4, 0x5]
	ldrb r0, [r5, 0x9]
	strb r0, [r4, 0x6]
	ldrb r0, [r5]
	strb r0, [r4, 0x8]
	strb r6, [r4, 0x9]
	strb r7, [r4, 0xA]
	strh r3, [r4, 0xC]
	strh r2, [r4, 0xE]
	strh r3, [r4, 0x10]
	strh r2, [r4, 0x12]
	strh r3, [r4, 0x14]
	strh r2, [r4, 0x16]
	ldrb r0, [r5, 0x8]
	movs r7, 0xF
	adds r1, r7, 0
	ands r1, r0
	ldrb r2, [r4, 0xB]
	movs r0, 0x10
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0xB]
	ldrb r1, [r5, 0x8]
	lsls r1, 4
	ands r0, r7
	orrs r0, r1
	strb r0, [r4, 0xB]
	ldrb r1, [r5, 0xA]
	lsls r1, 28
	movs r0, 0xF
	mov r9, r0
	lsrs r1, 28
	ldrb r2, [r4, 0x19]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x19]
	ldrb r1, [r5, 0xA]
	lsrs r1, 4
	lsls r1, 4
	ands r0, r7
	orrs r0, r1
	strb r0, [r4, 0x19]
	ldrh r0, [r5, 0xC]
	strb r0, [r4, 0x7]
	ldrh r0, [r5, 0xE]
	strb r0, [r4, 0x1D]
	ldr r1, _0805B114
	ldrb r0, [r5, 0x9]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	strb r1, [r0]
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl FieldObjectHandleDynamicGraphicsId
	ldr r1, _0805B118
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805B0FE
	ldrb r2, [r4, 0x19]
	adds r0, r7, 0
	ands r0, r2
	cmp r0, 0
	bne _0805B0E6
	lsls r0, r2, 28
	lsrs r0, 28
	adds r0, 0x1
	mov r1, r9
	ands r0, r1
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x19]
_0805B0E6:
	ldrb r2, [r4, 0x19]
	movs r0, 0xF0
	ands r0, r2
	cmp r0, 0
	bne _0805B0FE
	lsrs r1, r2, 4
	adds r1, 0x1
	lsls r1, 4
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x19]
_0805B0FE:
	mov r0, sp
	ldrb r0, [r0]
_0805B102:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B110: .4byte gMapObjects
_0805B114: .4byte gUnknown_0836DC09
_0805B118: .4byte gUnknown_0836DBBC
	thumb_func_end InitFieldObjectStateFromTemplate

	thumb_func_start sub_805ADDC
sub_805ADDC: @ 805B11C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0805B134
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bne _0805B150
	b _0805B17E
	.align 2, 0
_0805B134: .4byte gMapHeader
_0805B138:
	ldr r1, _0805B14C
	adds r0, r7, r1
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	adds r0, r4, 0
	bl InitFieldObjectStateFromTemplate
	lsls r0, 24
	lsrs r0, 24
	b _0805B180
	.align 2, 0
_0805B14C: .4byte 0xfffff3e0
_0805B150:
	ldrb r6, [r0]
	movs r5, 0
	cmp r5, r6
	bcs _0805B17E
	ldr r7, _0805B18C
_0805B15A:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, r8
	bne _0805B174
	ldrh r0, [r4, 0x14]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805B138
_0805B174:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0805B15A
_0805B17E:
	movs r0, 0x10
_0805B180:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B18C: .4byte 0x02026354
	thumb_func_end sub_805ADDC

	thumb_func_start GetAvailableFieldObjectSlot
GetAvailableFieldObjectSlot: @ 805B190
	push {r4-r7,lr}
	mov r12, r3
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r2, 0
	ldr r1, _0805B1EC
	ldrb r0, [r1]
	lsls r0, 31
	adds r7, r1, 0
	cmp r0, 0
	beq _0805B1E4
	adds r3, r1, 0
_0805B1B0:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldrb r0, [r1, 0x8]
	cmp r0, r6
	bne _0805B1CA
	ldrb r0, [r1, 0x9]
	cmp r0, r5
	bne _0805B1CA
	ldrb r0, [r1, 0xA]
	cmp r0, r4
	beq _0805B1E8
_0805B1CA:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _0805B1E8
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805B1B0
_0805B1E4:
	cmp r2, 0xF
	bls _0805B1F0
_0805B1E8:
	movs r0, 0x1
	b _0805B224
	.align 2, 0
_0805B1EC: .4byte gMapObjects
_0805B1F0:
	mov r0, r12
	strb r2, [r0]
	ldr r1, _0805B22C
_0805B1F6:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, 31
	cmp r0, 0
	beq _0805B218
	ldrb r0, [r3, 0x8]
	cmp r0, r6
	bne _0805B218
	ldrb r0, [r3, 0x9]
	cmp r0, r5
	bne _0805B218
	ldrb r0, [r3, 0xA]
	cmp r0, r4
	beq _0805B1E8
_0805B218:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0805B1F6
	movs r0, 0
_0805B224:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B22C: .4byte gMapObjects
	thumb_func_end GetAvailableFieldObjectSlot

	thumb_func_start RemoveFieldObject
RemoveFieldObject: @ 805B230
	push {lr}
	ldrb r2, [r0]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bl RemoveFieldObjectInternal
	pop {r0}
	bx r0
	thumb_func_end RemoveFieldObject

	thumb_func_start RemoveFieldObjectByLocalIdAndMap
RemoveFieldObjectByLocalIdAndMap: @ 805B244
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805B282
	mov r0, sp
	ldrb r0, [r0]
	bl GetFieldObjectFlagIdByFieldObjectId
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805B288
	adds r0, r1
	bl RemoveFieldObject
_0805B282:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805B288: .4byte gMapObjects
	thumb_func_end RemoveFieldObjectByLocalIdAndMap

	thumb_func_start RemoveFieldObjectInternal
RemoveFieldObjectInternal: @ 805B28C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrh r2, [r0, 0x6]
	ldr r1, _0805B2D0
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	ldr r2, _0805B2D4
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r0, r1
	mov r1, sp
	str r1, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	bl DestroySprite
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2D0: .4byte 0xffff0000
_0805B2D4: .4byte gSprites
	thumb_func_end RemoveFieldObjectInternal

	thumb_func_start npc_hide_all_but_player
npc_hide_all_but_player: @ 805B2D8
	push {r4,lr}
	movs r4, 0
_0805B2DC:
	ldr r0, _0805B304
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _0805B2F2
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0805B308
	adds r0, r1
	bl RemoveFieldObject
_0805B2F2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805B2DC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B304: .4byte gPlayerAvatar
_0805B308: .4byte gMapObjects
	thumb_func_end npc_hide_all_but_player

	thumb_func_start sub_805AFCC
sub_805AFCC: @ 805B30C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	mov r10, r4
	bl InitFieldObjectStateFromTemplate
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x10
	bne _0805B346
	movs r0, 0x10
	b _0805B494
_0805B346:
	mov r0, r8
	lsls r4, r0, 3
	adds r0, r4, r0
	lsls r0, 2
	ldr r1, _0805B370
	adds r5, r0, r1
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	ldrb r1, [r6, 0xC]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0805B374
	ldrh r0, [r6, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__no_record
	b _0805B382
	.align 2, 0
_0805B370: .4byte gMapObjects
_0805B374:
	cmp r0, 0xA
	bne _0805B382
	ldrh r0, [r6, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805B382:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x4C
	bne _0805B390
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
_0805B390:
	ldr r1, _0805B3C4
	adds r0, r1, 0
	strh r0, [r7, 0x2]
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	bne _0805B3CC
	ldr r0, _0805B3C8
	mov r2, r8
	adds r1, r4, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x10
	b _0805B494
	.align 2, 0
_0805B3C4: .4byte 0x0000ffff
_0805B3C8: .4byte gMapObjects
_0805B3CC:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _0805B4A4
	adds r4, r0, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r5, 0x10]
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r2, [r5, 0x12]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	ldrh r0, [r6, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r6, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0x2E]
	strb r7, [r5, 0x4]
	ldrb r1, [r6, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805B47E
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805B47E:
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80634D0
	mov r0, r8
_0805B494:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B4A4: .4byte gSprites
	thumb_func_end sub_805AFCC

	thumb_func_start SpawnFieldObject
SpawnFieldObject: @ 805B4A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x2C
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x48]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0
	str r0, [sp, 0x20]
	mov r1, r9
	ldrb r0, [r1, 0x1]
	bl GetFieldObjectGraphicsInfo
	adds r7, r0, 0
	add r2, sp, 0x20
	mov r0, r9
	add r1, sp, 0x8
	bl MakeObjectTemplateFromFieldObjectTemplate
	ldrh r3, [r7, 0x6]
	ldr r2, _0805B520
	add r1, sp, 0x24
	ldr r0, [r1, 0x4]
	ands r0, r2
	orrs r0, r3
	str r0, [r1, 0x4]
	str r1, [sp, 0x14]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	mov r0, r9
	add r1, sp, 0x8
	adds r2, r6, 0
	mov r3, r8
	bl sub_805AFCC
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	cmp r2, 0x10
	bne _0805B524
	movs r0, 0x10
	b _0805B55A
	.align 2, 0
_0805B520: .4byte 0xffff0000
_0805B524:
	ldr r4, _0805B568
	ldr r1, _0805B56C
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldr r1, [r7, 0x1C]
	str r1, [r0]
	ldr r2, [sp, 0x20]
	cmp r2, 0
	beq _0805B558
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r2, 0
	bl SetSubspriteTables
_0805B558:
	adds r0, r5, 0
_0805B55A:
	add sp, 0x2C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B568: .4byte gSprites
_0805B56C: .4byte gMapObjects
	thumb_func_end SpawnFieldObject

	thumb_func_start SpawnSpecialFieldObject
SpawnSpecialFieldObject: @ 805B570
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl GetFieldObjectMovingCameraOffset
	ldr r0, _0805B5A8
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	add r0, sp, 0x4
	movs r6, 0
	ldrsh r3, [r0, r6]
	movs r6, 0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, 0
	bl SpawnFieldObject
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B5A8: .4byte gSaveBlock1
	thumb_func_end SpawnSpecialFieldObject

	thumb_func_start SpawnSpecialFieldObjectParametrized
SpawnSpecialFieldObjectParametrized: @ 805B5AC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	mov r8, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	ldr r5, _0805B610
	adds r3, r5
	lsrs r3, 16
	lsls r4, 16
	adds r4, r5
	lsrs r4, 16
	mov r5, sp
	movs r6, 0
	strb r2, [r5]
	mov r2, sp
	strb r0, [r2, 0x1]
	mov r0, sp
	strb r6, [r0, 0x2]
	movs r5, 0
	strh r3, [r0, 0x4]
	strh r4, [r0, 0x6]
	mov r2, r8
	strb r2, [r0, 0x8]
	strb r1, [r0, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r5, [r0, 0xA]
	strh r6, [r0, 0xC]
	strh r6, [r0, 0xE]
	bl SpawnSpecialFieldObject
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B610: .4byte 0xfff90000
	thumb_func_end SpawnSpecialFieldObjectParametrized

	thumb_func_start show_sprite
show_sprite: @ 805B614
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl GetFieldObjectTemplateByLocalIdAndMap
	adds r5, r0, 0
	cmp r5, 0
	beq _0805B65A
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl GetFieldObjectMovingCameraOffset
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	movs r1, 0
	ldrsh r0, [r4, r1]
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SpawnFieldObject
	lsls r0, 24
	lsrs r0, 24
	b _0805B65C
_0805B65A:
	movs r0, 0x10
_0805B65C:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end show_sprite

	thumb_func_start MakeObjectTemplateFromFieldObjectGraphicsInfo
MakeObjectTemplateFromFieldObjectGraphicsInfo: @ 805B664
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetFieldObjectGraphicsInfo
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, 0x2]
	strh r1, [r4, 0x2]
	ldr r1, [r0, 0x10]
	str r1, [r4, 0x4]
	ldr r1, [r0, 0x18]
	str r1, [r4, 0x8]
	ldr r1, [r0, 0x1C]
	str r1, [r4, 0xC]
	ldr r1, [r0, 0x20]
	str r1, [r4, 0x10]
	str r5, [r4, 0x14]
	ldr r0, [r0, 0x14]
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end MakeObjectTemplateFromFieldObjectGraphicsInfo

	thumb_func_start MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex: @ 805B698
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	ldr r4, _0805B6B4
	lsrs r1, 14
	adds r1, r4
	ldr r1, [r1]
	bl MakeObjectTemplateFromFieldObjectGraphicsInfo
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B6B4: .4byte gUnknown_0836DA88
	thumb_func_end MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex

	thumb_func_start MakeObjectTemplateFromFieldObjectTemplate
MakeObjectTemplateFromFieldObjectTemplate: @ 805B6B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4, 0x9]
	adds r2, r5, 0
	bl MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end MakeObjectTemplateFromFieldObjectTemplate

	thumb_func_start AddPseudoFieldObject
AddPseudoFieldObject: @ 805B6D0
	push {r4-r6,lr}
	sub sp, 0x1C
	ldr r4, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 24
	lsrs r4, 24
	add r3, sp, 0x18
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfo
	mov r0, sp
	ldrh r1, [r0, 0x2]
	ldr r0, _0805B748
	cmp r1, r0
	beq _0805B700
	mov r0, sp
	ldrh r0, [r0, 0x2]
	bl sub_805BDF8
_0805B700:
	lsls r1, r6, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	mov r0, sp
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0805B73C
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _0805B73C
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0805B74C
	adds r4, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_0805B73C:
	adds r0, r5, 0
	add sp, 0x1C
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B748: .4byte 0x0000ffff
_0805B74C: .4byte gSprites
	thumb_func_end AddPseudoFieldObject

	thumb_func_start sub_805B410
sub_805B410: @ 805B750
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	adds r5, r0, 0
	ldr r0, [sp, 0x44]
	ldr r4, [sp, 0x48]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	add r1, sp, 0x18
	mov r8, r1
	strh r2, [r1]
	mov r6, sp
	adds r6, 0x1A
	strh r3, [r6]
	lsls r0, 24
	lsrs r7, r0, 24
	mov r9, r7
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x20]
	adds r0, r5, 0
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	ldr r1, _0805B890
	add r3, sp, 0x1C
	adds r0, r5, 0
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfo
	mov r1, sp
	ldr r2, _0805B894
	adds r0, r2, 0
	strh r0, [r1, 0x2]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x7
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x7
	strh r0, [r6]
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0x8
	movs r3, 0x10
	bl sub_8060470
	mov r2, r8
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0
	ldrsh r2, [r6, r0]
	mov r0, sp
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _0805B87C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0805B898
	adds r5, r0, r1
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r5, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, 0x1
	strb r0, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrb r1, [r4, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r3, [r5, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	mov r0, r10
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x30]
	ldrb r1, [r4, 0xC]
	ands r2, r1
	cmp r2, 0xA
	bne _0805B83C
	ldrh r0, [r4, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805B83C:
	ldr r1, [sp, 0x1C]
	cmp r1, 0
	beq _0805B858
	adds r0, r5, 0
	bl SetSubspriteTables
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x3F
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2]
_0805B858:
	adds r0, r5, 0
	mov r1, r9
	bl InitObjectPriorityByZCoord
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldr r0, [sp, 0x20]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_0805B87C:
	adds r0, r6, 0
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B890: .4byte sub_8064970
_0805B894: .4byte 0x0000ffff
_0805B898: .4byte gSprites
	thumb_func_end sub_805B410

	thumb_func_start sub_805B55C
sub_805B55C: @ 805B89C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	ldr r0, _0805B968
	ldr r5, [r0, 0x4]
	cmp r5, 0
	beq _0805B958
	ldr r4, _0805B96C
	ldrh r0, [r4]
	subs r1, r0, 0x2
	lsls r1, 16
	lsrs r1, 16
	adds r0, 0x11
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldrh r2, [r4, 0x2]
	adds r0, r2, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	ldrb r6, [r5]
	movs r5, 0
	cmp r5, r6
	bcs _0805B958
	lsls r0, r2, 16
	asrs r0, 16
	mov r10, r0
	adds r7, r4, 0
	lsls r0, r1, 16
	asrs r0, 16
	mov r9, r0
	lsls r3, 16
	mov r8, r3
_0805B8F2:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	ldr r1, _0805B970
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4, 0x6]
	adds r0, 0x7
	lsls r0, 16
	asrs r1, r0, 16
	cmp r10, r1
	bgt _0805B94E
	ldr r3, [sp, 0xC]
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	blt _0805B94E
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r9, r1
	bgt _0805B94E
	ldr r2, [sp, 0x8]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r1
	blt _0805B94E
	ldrh r0, [r4, 0x14]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0805B94E
	ldrb r1, [r7, 0x5]
	ldrb r2, [r7, 0x4]
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r4, 0
	mov r4, r8
	asrs r3, r4, 16
	bl SpawnFieldObject
_0805B94E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0805B8F2
_0805B958:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B968: .4byte gMapHeader
_0805B96C: .4byte gSaveBlock1
_0805B970: .4byte 0x02026354
	thumb_func_end sub_805B55C

	thumb_func_start RemoveFieldObjectsOutsideView
RemoveFieldObjectsOutsideView: @ 805B974
	push {r4-r6,lr}
	movs r3, 0
	ldr r6, _0805B9C8
_0805B97A:
	movs r2, 0
	movs r4, 0
	adds r5, r3, 0x1
_0805B980:
	lsls r0, r2, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0805B992
	ldrb r1, [r1, 0x2]
	cmp r3, r1
	bne _0805B992
	movs r4, 0x1
_0805B992:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0805B980
	cmp r4, 0
	bne _0805B9BA
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r1, _0805B9CC
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0805B9D0
	ands r0, r1
	cmp r0, 0x1
	bne _0805B9BA
	adds r0, r2, 0
	bl RemoveFieldObjectIfOutsideView
_0805B9BA:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805B97A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B9C8: .4byte gLinkPlayerMapObjects
_0805B9CC: .4byte gMapObjects
_0805B9D0: .4byte 0x00010001
	thumb_func_end RemoveFieldObjectsOutsideView

	thumb_func_start RemoveFieldObjectIfOutsideView
RemoveFieldObjectIfOutsideView: @ 805B9D4
	push {r4-r7,lr}
	adds r3, r0, 0
	ldr r2, _0805BA4C
	ldrh r0, [r2]
	subs r1, r0, 0x2
	lsls r1, 16
	adds r0, 0x11
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r4, [r2, 0x2]
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0x10
	ldrsh r2, [r3, r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r2, r1
	blt _0805BA18
	lsls r0, r5, 16
	asrs r0, 16
	cmp r2, r0
	bgt _0805BA18
	movs r0, 0x12
	ldrsh r1, [r3, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805BA18
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805BA46
_0805BA18:
	movs r0, 0xC
	ldrsh r1, [r3, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805BA40
	lsls r0, r5, 16
	asrs r0, 16
	cmp r1, r0
	bgt _0805BA40
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805BA40
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805BA46
_0805BA40:
	adds r0, r3, 0
	bl RemoveFieldObject
_0805BA46:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA4C: .4byte gSaveBlock1
	thumb_func_end RemoveFieldObjectIfOutsideView

	thumb_func_start sub_805B710
sub_805B710: @ 805BA50
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl ClearPlayerAvatarInfo
	movs r6, 0
	ldr r7, _0805BA98
	lsls r4, 16
	lsls r5, 16
_0805BA6A:
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0805BA84
	adds r0, r6, 0
	asrs r1, r4, 16
	asrs r2, r5, 16
	bl sub_805B75C
_0805BA84:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _0805BA6A
	bl sub_805AAB0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA98: .4byte gMapObjects
	thumb_func_end sub_805B710

	thumb_func_start sub_805B75C
sub_805B75C: @ 805BA9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r7, 0
	ldr r2, _0805BC40
_0805BABE:
	lsls r0, r7, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0805BAD0
	ldrb r1, [r1, 0x2]
	cmp r8, r1
	bne _0805BAD0
	b _0805BC2E
_0805BAD0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _0805BABE
	mov r1, r8
	lsls r0, r1, 3
	add r0, r8
	lsls r0, 2
	ldr r1, _0805BC44
	adds r6, r0, r1
	movs r0, 0
	str r0, [sp, 0x20]
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrh r2, [r5, 0x6]
	ldr r1, _0805BC48
	add r4, sp, 0x18
	ldr r0, [r4, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [r4, 0x4]
	ldrb r0, [r6, 0x5]
	ldrb r1, [r6, 0x6]
	add r3, sp, 0x20
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
	str r4, [sp, 0xC]
	mov r0, sp
	ldr r2, _0805BC4C
	adds r4, r2, 0
	strh r4, [r0, 0x2]
	ldrb r1, [r5, 0xC]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0805BB2A
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__no_record
_0805BB2A:
	ldrb r0, [r5, 0xC]
	lsls r1, r0, 28
	lsrs r0, r1, 28
	cmp r0, 0x9
	bls _0805BB3C
	ldrh r0, [r5, 0x2]
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805BB3C:
	mov r0, sp
	strh r4, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	beq _0805BC2E
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _0805BC50
	adds r4, r0, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r6, 0x10]
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r2, [r6, 0x12]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, [r5, 0x1C]
	str r0, [r4, 0xC]
	ldrb r0, [r6, 0x6]
	cmp r0, 0xB
	bne _0805BBCA
	mov r0, r8
	adds r1, r7, 0
	bl SetPlayerAvatarFieldObjectIdAndObjectId
	bl sub_8126B54
	strb r0, [r6, 0x1B]
_0805BBCA:
	ldr r1, [sp, 0x20]
	cmp r1, 0
	beq _0805BBD6
	adds r0, r4, 0
	bl SetSubspriteTables
_0805BBD6:
	ldrb r1, [r5, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0x2E]
	strb r7, [r6, 0x4]
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805BC1C
	ldrb r0, [r6, 0x6]
	cmp r0, 0xB
	beq _0805BC1C
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805BC1C:
	adds r0, r6, 0
	bl sub_805B914
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
_0805BC2E:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC40: .4byte gLinkPlayerMapObjects
_0805BC44: .4byte gMapObjects
_0805BC48: .4byte 0xffff0000
_0805BC4C: .4byte 0x0000ffff
_0805BC50: .4byte gSprites
	thumb_func_end sub_805B75C

	thumb_func_start sub_805B914
sub_805B914: @ 805BC54
	push {lr}
	ldrb r2, [r0]
	movs r3, 0x3
	negs r3, r3
	adds r1, r3, 0
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r2, [r0, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	ands r1, r3
	movs r2, 0x5
	negs r2, r2
	ands r1, r2
	subs r2, 0x4
	ands r1, r2
	subs r2, 0x8
	ands r1, r2
	subs r2, 0x10
	ands r1, r2
	strb r1, [r0, 0x2]
	bl FieldObjectClearAnim
	pop {r0}
	bx r0
	thumb_func_end sub_805B914

	thumb_func_start SetPlayerAvatarFieldObjectIdAndObjectId
SetPlayerAvatarFieldObjectIdAndObjectId: @ 805BC8C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805BCB8
	strb r0, [r5, 0x5]
	strb r1, [r5, 0x4]
	ldr r1, _0805BCBC
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r0, [r4, 0x5]
	bl GetPlayerAvatarGenderByGraphicsId
	strb r0, [r5, 0x7]
	ldrb r0, [r4, 0x5]
	movs r1, 0x20
	bl SetPlayerAvatarExtraStateTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BCB8: .4byte gPlayerAvatar
_0805BCBC: .4byte gMapObjects
	thumb_func_end SetPlayerAvatarFieldObjectIdAndObjectId

	thumb_func_start sub_805B980
sub_805B980: @ 805BCC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r0, r8
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BDBC
	adds r4, r0, r1
	ldrb r1, [r5, 0xC]
	movs r7, 0xF
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0805BCF8
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl pal_patch_for_npc
_0805BCF8:
	ldrb r1, [r5, 0xC]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0xA
	bne _0805BD0C
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805BD0C:
	ldr r0, [r5, 0x10]
	ldrb r2, [r0, 0x1]
	lsrs r2, 6
	lsls r2, 6
	ldrb r3, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x10]
	ldrb r0, [r0, 0x3]
	lsrs r0, 6
	lsls r0, 6
	ldrb r2, [r4, 0x3]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldr r0, [r5, 0x1C]
	str r0, [r4, 0xC]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x8]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x18]
	ldrb r1, [r5, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r5, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r6, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	mov r0, r8
	strb r0, [r6, 0x5]
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_80603CC
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805BDB2
	bl CameraObjectReset1
_0805BDB2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BDBC: .4byte gSprites
	thumb_func_end sub_805B980

	thumb_func_start unref_sub_805BA80
unref_sub_805BA80: @ 805BDC0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BDF4
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BDFC
	adds r0, r1
	adds r1, r4, 0
	bl sub_805B980
_0805BDF4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BDFC: .4byte gMapObjects
	thumb_func_end unref_sub_805BA80

	thumb_func_start FieldObjectTurn
FieldObjectTurn: @ 805BE00
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805BE46
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _0805BE4C
	adds r4, r5
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl SeekSpriteAnim
_0805BE46:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE4C: .4byte gSprites
	thumb_func_end FieldObjectTurn

	thumb_func_start FieldObjectTurnByLocalIdAndMap
FieldObjectTurnByLocalIdAndMap: @ 805BE50
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BE84
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BE8C
	adds r0, r1
	adds r1, r4, 0
	bl FieldObjectTurn
_0805BE84:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE8C: .4byte gMapObjects
	thumb_func_end FieldObjectTurnByLocalIdAndMap

	thumb_func_start unref_sub_805BB50
unref_sub_805BB50: @ 805BE90
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805BEAC
	adds r0, r2
	bl FieldObjectTurn
	pop {r0}
	bx r0
	.align 2, 0
_0805BEAC: .4byte gMapObjects
	thumb_func_end unref_sub_805BB50

	thumb_func_start get_berry_tree_graphics
get_berry_tree_graphics: @ 805BEB0
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r4, r7, 0
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1D]
	bl GetStageByBerryTreeId
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0805BF3C
	ldrb r1, [r5, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1D]
	bl GetBerryTypeByBerryTreeId
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r4, 0x2B
	bls _0805BF04
	movs r4, 0
_0805BF04:
	ldr r0, _0805BF44
	lsls r4, 2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r6
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_805B980
	ldr r0, _0805BF48
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r7, 0xC]
	ldr r0, _0805BF4C
	adds r4, r0
	ldr r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r7, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	adds r0, r7, 0
	adds r1, r6, 0
	bl StartSpriteAnim
_0805BF3C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BF44: .4byte gBerryTreeGraphicsIdTablePointers
_0805BF48: .4byte gBerryTreePicTablePointers
_0805BF4C: .4byte gBerryTreePaletteSlotTablePointers
	thumb_func_end get_berry_tree_graphics

	thumb_func_start GetFieldObjectGraphicsInfo
GetFieldObjectGraphicsInfo: @ 805BF50
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xEF
	bls _0805BF68
	adds r0, r1, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl VarGetFieldObjectGraphicsId
	adds r1, r0, 0
_0805BF68:
	cmp r1, 0xD9
	bls _0805BF6E
	movs r1, 0x5
_0805BF6E:
	ldr r0, _0805BF7C
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0805BF7C: .4byte gMapObjectGraphicsInfoPointers
	thumb_func_end GetFieldObjectGraphicsInfo

	thumb_func_start FieldObjectHandleDynamicGraphicsId
FieldObjectHandleDynamicGraphicsId: @ 805BF80
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	cmp r0, 0xEF
	bls _0805BF96
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl VarGetFieldObjectGraphicsId
	strb r0, [r4, 0x5]
_0805BF96:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectHandleDynamicGraphicsId

	thumb_func_start npc_by_local_id_and_map_set_field_1_bit_x20
npc_by_local_id_and_map_set_field_1_bit_x20: @ 805BF9C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BFDE
	ldr r2, _0805BFE8
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x1
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 5
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x1]
_0805BFDE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BFE8: .4byte gMapObjects
	thumb_func_end npc_by_local_id_and_map_set_field_1_bit_x20

	thumb_func_start FieldObjectGetLocalIdAndMap
FieldObjectGetLocalIdAndMap: @ 805BFEC
	push {r4,lr}
	ldrb r4, [r0, 0x8]
	strb r4, [r1]
	ldrb r1, [r0, 0x9]
	strb r1, [r2]
	ldrb r0, [r0, 0xA]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectGetLocalIdAndMap

	thumb_func_start sub_805BCC0
sub_805BCC0: @ 805C000
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetFieldObjectIdByXY
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _0805C028
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C02C
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0805C028:
	pop {r0}
	bx r0
	.align 2, 0
_0805C02C: .4byte gMapObjects
	thumb_func_end sub_805BCC0

	thumb_func_start sub_805BCF0
sub_805BCF0: @ 805C030
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C076
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _0805C080
	adds r2, r0
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C084
	adds r0, r1
	ldrb r1, [r2, 0x3]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x3]
	adds r0, 0x43
	strb r4, [r0]
_0805C076:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C080: .4byte gMapObjects
_0805C084: .4byte gSprites
	thumb_func_end sub_805BCF0

	thumb_func_start sub_805BD48
sub_805BD48: @ 805C088
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C0C4
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805C0CC
	adds r1, r0
	ldrb r2, [r1, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x3]
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0805C0C4:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805C0CC: .4byte gMapObjects
	thumb_func_end sub_805BD48

	thumb_func_start sub_805BD90
sub_805BD90: @ 805C0D0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 16
	lsrs r4, 16
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C114
	ldr r2, _0805C11C
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
	ldr r1, _0805C120
	adds r0, r1
	strh r5, [r0, 0x24]
	strh r4, [r0, 0x26]
_0805C114:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C11C: .4byte gMapObjects
_0805C120: .4byte gSprites
	thumb_func_end sub_805BD90

	thumb_func_start gpu_pal_allocator_reset__manage_upper_four
gpu_pal_allocator_reset__manage_upper_four: @ 805C124
	push {lr}
	bl FreeAllSpritePalettes
	ldr r1, _0805C134
	movs r0, 0xC
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805C134: .4byte gReservedSpritePaletteCount
	thumb_func_end gpu_pal_allocator_reset__manage_upper_four

	thumb_func_start sub_805BDF8
sub_805BDF8: @ 805C138
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl FindFieldObjectPaletteIndexByTag
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0805C15C
	cmp r1, r0
	beq _0805C156
	lsls r0, r1, 3
	ldr r1, _0805C160
	adds r0, r1
	bl sub_805BE58
_0805C156:
	pop {r0}
	bx r0
	.align 2, 0
_0805C15C: .4byte 0x000011ff
_0805C160: .4byte gUnknown_0837377C
	thumb_func_end sub_805BDF8

	thumb_func_start unref_sub_805BE24
unref_sub_805BE24: @ 805C164
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	ldrh r0, [r5]
	ldr r1, _0805C194
	cmp r0, r1
	beq _0805C18E
	adds r6, r1, 0
_0805C174:
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	bl sub_805BDF8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805C174
_0805C18E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C194: .4byte 0x000011ff
	thumb_func_end unref_sub_805BE24

	thumb_func_start sub_805BE58
sub_805BE58: @ 805C198
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0805C1B6
	adds r0, r4, 0
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	b _0805C1B8
_0805C1B6:
	movs r0, 0xFF
_0805C1B8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805BE58

	thumb_func_start pal_patch_for_npc
pal_patch_for_npc: @ 805C1C0
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl FindFieldObjectPaletteIndexByTag
	lsls r0, 24
	ldr r1, _0805C1F4
	lsrs r0, 21
	adds r0, r1
	ldr r0, [r0]
	lsls r4, 20
	movs r1, 0x80
	lsls r1, 17
	adds r4, r1
	lsrs r4, 16
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C1F4: .4byte gUnknown_0837377C
	thumb_func_end pal_patch_for_npc

	thumb_func_start pal_patch_for_npc_range
pal_patch_for_npc_range: @ 805C1F8
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r4, r6
	bcs _0805C21C
_0805C208:
	ldrh r0, [r5]
	adds r1, r4, 0
	bl pal_patch_for_npc
	adds r5, 0x2
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0805C208
_0805C21C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end pal_patch_for_npc_range

	thumb_func_start FindFieldObjectPaletteIndexByTag
FindFieldObjectPaletteIndexByTag: @ 805C224
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	movs r2, 0
	ldr r0, _0805C24C
	ldrh r1, [r0, 0x4]
	ldr r3, _0805C250
	adds r4, r0, 0
	cmp r1, r3
	beq _0805C264
	adds r6, r4, 0
	adds r1, r3, 0
_0805C23C:
	lsls r0, r2, 3
	adds r0, r6
	ldrh r0, [r0, 0x4]
	cmp r0, r5
	bne _0805C254
	adds r0, r2, 0
	b _0805C266
	.align 2, 0
_0805C24C: .4byte gUnknown_0837377C
_0805C250: .4byte 0x000011ff
_0805C254:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 3
	adds r0, r4
	ldrh r0, [r0, 0x4]
	cmp r0, r1
	bne _0805C23C
_0805C264:
	movs r0, 0xFF
_0805C266:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end FindFieldObjectPaletteIndexByTag

	thumb_func_start npc_load_two_palettes__no_record
npc_load_two_palettes__no_record: @ 805C26C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl pal_patch_for_npc
	movs r3, 0
	ldr r1, _0805C2B4
	ldrh r0, [r1]
	ldr r2, _0805C2B8
	cmp r0, r2
	beq _0805C2D4
	ldr r0, _0805C2BC
	adds r5, r0
	adds r6, r2, 0
_0805C290:
	lsls r2, r3, 3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805C2C4
	adds r1, 0x4
	adds r1, r2, r1
	ldr r0, _0805C2C0
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl pal_patch_for_npc
	b _0805C2D4
	.align 2, 0
_0805C2B4: .4byte gUnknown_08373874
_0805C2B8: .4byte 0x000011ff
_0805C2BC: .4byte gUnknown_0830FD14
_0805C2C0: .4byte gUnknown_030005A4
_0805C2C4:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805C290
_0805C2D4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_load_two_palettes__no_record

	thumb_func_start npc_load_two_palettes__and_record
npc_load_two_palettes__and_record: @ 805C2DC
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _0805C328
	strh r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl pal_patch_for_npc
	movs r3, 0
	ldr r1, _0805C32C
	ldrh r0, [r1]
	ldr r2, _0805C330
	cmp r0, r2
	beq _0805C34C
	ldr r0, _0805C334
	adds r5, r0
	adds r6, r2, 0
_0805C304:
	lsls r2, r3, 3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805C33C
	adds r1, 0x4
	adds r1, r2, r1
	ldr r0, _0805C338
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl pal_patch_for_npc
	b _0805C34C
	.align 2, 0
_0805C328: .4byte gUnknown_030005A6
_0805C32C: .4byte gUnknown_083738E4
_0805C330: .4byte 0x000011ff
_0805C334: .4byte gUnknown_0830FD14
_0805C338: .4byte gUnknown_030005A4
_0805C33C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805C304
_0805C34C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_load_two_palettes__and_record

	thumb_func_start unref_sub_805C014
unref_sub_805C014: @ 805C354
	push {r4,lr}
	ldrh r3, [r0, 0x10]
	strh r3, [r0, 0x14]
	ldrh r4, [r0, 0x12]
	strh r4, [r0, 0x16]
	lsls r1, 16
	asrs r1, 16
	adds r1, r3
	strh r1, [r0, 0x10]
	lsls r2, 16
	asrs r2, 16
	adds r2, r4
	strh r2, [r0, 0x12]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_805C014

	thumb_func_start npc_coords_shift
npc_coords_shift: @ 805C374
	ldrh r3, [r0, 0x10]
	strh r3, [r0, 0x14]
	ldrh r3, [r0, 0x12]
	strh r3, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	bx lr
	thumb_func_end npc_coords_shift

	thumb_func_start npc_coords_set
npc_coords_set: @ 805C384
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	strh r1, [r0, 0x14]
	strh r2, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	bx lr
	thumb_func_end npc_coords_set

	thumb_func_start sub_805C058
sub_805C058: @ 805C398
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C434
	adds r7, r0, r1
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r8, r0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl npc_coords_set
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	adds r2, r7, 0
	adds r2, 0x20
	adds r3, r7, 0
	adds r3, 0x22
	bl sub_80603CC
	mov r1, r8
	ldrh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r7, 0
	adds r1, 0x28
	strb r0, [r1]
	mov r2, r8
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r7, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r7, 0x20]
	adds r0, 0x8
	strh r0, [r7, 0x20]
	ldrh r1, [r7, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r7, 0x22]
	adds r0, r6, 0
	bl sub_805B914
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805C42A
	bl CameraObjectReset1
_0805C42A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C434: .4byte gSprites
	thumb_func_end sub_805C058

	thumb_func_start sub_805C0F8
sub_805C0F8: @ 805C438
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 16
	lsrs r4, 16
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C480
	lsls r1, r5, 16
	lsls r2, r4, 16
	mov r0, sp
	ldrb r3, [r0]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _0805C488
	adds r0, r3
	movs r3, 0xE0
	lsls r3, 11
	adds r1, r3
	asrs r1, 16
	adds r2, r3
	asrs r2, 16
	bl sub_805C058
_0805C480:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C488: .4byte gMapObjects
	thumb_func_end sub_805C0F8

	thumb_func_start npc_coords_shift_still
npc_coords_shift_still: @ 805C48C
	push {lr}
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	movs r3, 0x12
	ldrsh r2, [r0, r3]
	bl npc_coords_shift
	pop {r0}
	bx r0
	thumb_func_end npc_coords_shift_still

	thumb_func_start UpdateFieldObjectCoordsForCameraUpdate
UpdateFieldObjectCoordsForCameraUpdate: @ 805C4A0
	push {r4,r5,lr}
	ldr r2, _0805C500
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805C4F8
	movs r3, 0
	ldr r5, _0805C504
	movs r0, 0x4
	ldrsh r4, [r2, r0]
	movs r0, 0x8
	ldrsh r1, [r2, r0]
_0805C4BA:
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0805C4EE
	ldrh r0, [r2, 0xC]
	subs r0, r4
	strh r0, [r2, 0xC]
	ldrh r0, [r2, 0xE]
	subs r0, r1
	strh r0, [r2, 0xE]
	ldrh r0, [r2, 0x10]
	subs r0, r4
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x12]
	subs r0, r1
	strh r0, [r2, 0x12]
	ldrh r0, [r2, 0x14]
	subs r0, r4
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x16]
	subs r0, r1
	strh r0, [r2, 0x16]
_0805C4EE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805C4BA
_0805C4F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C500: .4byte gUnknown_0202E844
_0805C504: .4byte gMapObjects
	thumb_func_end UpdateFieldObjectCoordsForCameraUpdate

	thumb_func_start GetFieldObjectIdByXYZ
GetFieldObjectIdByXYZ: @ 805C508
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	ldr r0, _0805C554
	mov r8, r0
_0805C520:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0805C558
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, r7
	bne _0805C558
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r0, r6
	bne _0805C558
	adds r0, r1, 0
	adds r1, r5, 0
	bl FieldObjectDoesZCoordMatch
	lsls r0, 24
	cmp r0, 0
	beq _0805C558
	adds r0, r4, 0
	b _0805C564
	.align 2, 0
_0805C554: .4byte gMapObjects
_0805C558:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805C520
	movs r0, 0x10
_0805C564:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByXYZ

	thumb_func_start FieldObjectDoesZCoordMatch
FieldObjectDoesZCoordMatch: @ 805C570
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xB]
	movs r0, 0xF
	ands r0, r2
	cmp r0, 0
	beq _0805C590
	cmp r1, 0
	beq _0805C590
	lsls r0, r2, 28
	lsrs r0, 28
	cmp r0, r1
	beq _0805C590
	movs r0, 0
	b _0805C592
_0805C590:
	movs r0, 0x1
_0805C592:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectDoesZCoordMatch

	thumb_func_start UpdateFieldObjectsForCameraUpdate
UpdateFieldObjectsForCameraUpdate: @ 805C598
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl UpdateFieldObjectCoordsForCameraUpdate
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805B55C
	bl RemoveFieldObjectsOutsideView
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end UpdateFieldObjectsForCameraUpdate

	thumb_func_start AddCameraObject
AddCameraObject: @ 805C5C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0805C600
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805C604
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3E
	adds r2, r1
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	strh r4, [r1, 0x2E]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805C600: .4byte gSpriteTemplate_830FD24
_0805C604: .4byte gSprites
	thumb_func_end AddCameraObject

	thumb_func_start ObjectCB_CameraObject
ObjectCB_CameraObject: @ 805C608
	push {r4,r5,lr}
	sub sp, 0xC
	mov r2, sp
	ldr r1, _0805C62C
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	movs r2, 0x30
	ldrsh r1, [r0, r2]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C62C: .4byte gUnknown_0830FD3C
	thumb_func_end ObjectCB_CameraObject

	thumb_func_start CameraObject_0
CameraObject_0: @ 805C630
	push {lr}
	ldr r3, _0805C668
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x1
	strh r1, [r0, 0x30]
	bl CameraObject_1
	pop {r0}
	bx r0
	.align 2, 0
_0805C668: .4byte gSprites
	thumb_func_end CameraObject_0

	thumb_func_start CameraObject_1
CameraObject_1: @ 805C66C
	push {r4,r5,lr}
	ldr r3, _0805C6A0
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r3, [r1, 0x22]
	ldrh r2, [r0, 0x20]
	ldrh r4, [r1, 0x20]
	movs r5, 0x20
	ldrsh r1, [r1, r5]
	subs r1, r2
	strh r1, [r0, 0x32]
	ldrh r2, [r0, 0x22]
	lsls r1, r3, 16
	asrs r1, 16
	subs r1, r2
	strh r1, [r0, 0x34]
	strh r4, [r0, 0x20]
	strh r3, [r0, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C6A0: .4byte gSprites
	thumb_func_end CameraObject_1

	thumb_func_start CameraObject_2
CameraObject_2: @ 805C6A4
	push {r4,lr}
	ldr r4, _0805C6D0
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	movs r3, 0
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	strh r3, [r0, 0x32]
	strh r3, [r0, 0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C6D0: .4byte gSprites
	thumb_func_end CameraObject_2

	thumb_func_start FindCameraObject
FindCameraObject: @ 805C6D4
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _0805C700
	adds r5, r4, 0
	adds r5, 0x1C
_0805C6DE:
	lsls r0, r3, 4
	adds r0, r3
	lsls r1, r0, 2
	adds r2, r1, r4
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0805C708
	adds r0, r1, r5
	ldr r1, [r0]
	ldr r0, _0805C704
	cmp r1, r0
	bne _0805C708
	adds r0, r2, 0
	b _0805C714
	.align 2, 0
_0805C700: .4byte gSprites
_0805C704: .4byte ObjectCB_CameraObject
_0805C708:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _0805C6DE
	movs r0, 0
_0805C714:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FindCameraObject

	thumb_func_start CameraObjectReset1
CameraObjectReset1: @ 805C71C
	push {lr}
	bl FindCameraObject
	adds r2, r0, 0
	cmp r2, 0
	beq _0805C734
	movs r0, 0
	strh r0, [r2, 0x30]
	ldr r1, [r2, 0x1C]
	adds r0, r2, 0
	bl _call_via_r1
_0805C734:
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset1

	thumb_func_start CameraObjectSetFollowedObjectId
CameraObjectSetFollowedObjectId: @ 805C738
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl FindCameraObject
	cmp r0, 0
	beq _0805C74C
	strh r4, [r0, 0x2E]
	bl CameraObjectReset1
_0805C74C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CameraObjectSetFollowedObjectId

	thumb_func_start CameraObjectGetFollowedObjectId
CameraObjectGetFollowedObjectId: @ 805C754
	push {lr}
	bl FindCameraObject
	cmp r0, 0
	beq _0805C766
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	b _0805C768
_0805C766:
	movs r0, 0x40
_0805C768:
	pop {r1}
	bx r1
	thumb_func_end CameraObjectGetFollowedObjectId

	thumb_func_start CameraObjectReset2
CameraObjectReset2: @ 805C76C
	push {lr}
	bl FindCameraObject
	movs r1, 0x2
	strh r1, [r0, 0x30]
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset2

	thumb_func_start unref_sub_805C43C
unref_sub_805C43C: @ 805C77C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0
	ldr r1, _0805C7C4
_0805C796:
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805C7C8
	adds r0, r4, 0
	mov r1, r12
	movs r2, 0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, 0x20]
	strh r6, [r4, 0x22]
	adds r0, r4, 0
	adds r0, 0x43
	strb r7, [r0]
	b _0805C7D2
	.align 2, 0
_0805C7C4: .4byte gSprites
_0805C7C8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3F
	bls _0805C796
_0805C7D2:
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_805C43C

	thumb_func_start obj_unfreeze
obj_unfreeze: @ 805C7E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0x3F
	ldr r3, _0805C834
	movs r2, 0x1
	negs r2, r2
_0805C7FE:
	lsls r0, r5, 16
	asrs r1, r0, 16
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r3
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805C838
	adds r0, r4, 0
	mov r1, r12
	movs r2, 0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, 0x20]
	strh r6, [r4, 0x22]
	adds r0, r4, 0
	adds r0, 0x43
	strb r7, [r0]
	lsls r0, r5, 24
	lsrs r0, 24
	b _0805C846
	.align 2, 0
_0805C834: .4byte gSprites
_0805C838:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r2
	bgt _0805C7FE
	movs r0, 0x40
_0805C846:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end obj_unfreeze

	thumb_func_start FieldObjectSetDirection
FieldObjectSetDirection: @ 805C850
	push {r4,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	adds r4, r2, 0
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r3, 0
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	lsls r0, 30
	cmp r0, 0
	blt _0805C880
	movs r0, 0xF
	adds r1, r2, 0
	ands r1, r0
	ldrb r2, [r3, 0x18]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x18]
_0805C880:
	lsls r2, r4, 4
	ldrb r1, [r3, 0x18]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectSetDirection

	thumb_func_start GetFieldObjectScriptPointerByLocalIdAndMap
GetFieldObjectScriptPointerByLocalIdAndMap: @ 805C894
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldr r0, [r0, 0x10]
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerByLocalIdAndMap

	thumb_func_start GetFieldObjectScriptPointerByFieldObjectId
GetFieldObjectScriptPointerByFieldObjectId: @ 805C8AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805C8CC
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	bl GetFieldObjectScriptPointerByLocalIdAndMap
	pop {r1}
	bx r1
	.align 2, 0
_0805C8CC: .4byte gMapObjects
	thumb_func_end GetFieldObjectScriptPointerByFieldObjectId

	thumb_func_start GetFieldObjectFlagIdByLocalIdAndMap
GetFieldObjectFlagIdByLocalIdAndMap: @ 805C8D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldrh r0, [r0, 0x14]
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectFlagIdByLocalIdAndMap

	thumb_func_start GetFieldObjectFlagIdByFieldObjectId
GetFieldObjectFlagIdByFieldObjectId: @ 805C8E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805C90C
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	bl GetFieldObjectFlagIdByLocalIdAndMap
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0805C90C: .4byte gMapObjects
	thumb_func_end GetFieldObjectFlagIdByFieldObjectId

	thumb_func_start unref_sub_805C5D0
unref_sub_805C5D0: @ 805C910
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C944
	ldr r2, _0805C940
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	b _0805C946
	.align 2, 0
_0805C940: .4byte gMapObjects
_0805C944:
	movs r0, 0xFF
_0805C946:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end unref_sub_805C5D0

	thumb_func_start unref_sub_805C60C
unref_sub_805C60C: @ 805C94C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805C960
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x7]
	bx lr
	.align 2, 0
_0805C960: .4byte gMapObjects
	thumb_func_end unref_sub_805C60C

	thumb_func_start unref_sub_805C624
unref_sub_805C624: @ 805C964
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C998
	ldr r2, _0805C994
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1D]
	b _0805C99A
	.align 2, 0
_0805C994: .4byte gMapObjects
_0805C998:
	movs r0, 0xFF
_0805C99A:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end unref_sub_805C624

	thumb_func_start FieldObjectGetBerryTreeId
FieldObjectGetBerryTreeId: @ 805C9A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805C9B4
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1D]
	bx lr
	.align 2, 0
_0805C9B4: .4byte gMapObjects
	thumb_func_end FieldObjectGetBerryTreeId

	thumb_func_start GetFieldObjectTemplateByLocalIdAndMap
GetFieldObjectTemplateByLocalIdAndMap: @ 805C9B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805C9E4
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _0805C9EC
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _0805C9EC
	movs r0, 0xC2
	lsls r0, 4
	adds r1, r0
	ldr r0, _0805C9E8
	ldr r0, [r0, 0x4]
	b _0805C9F8
	.align 2, 0
_0805C9E4: .4byte gSaveBlock1
_0805C9E8: .4byte gMapHeader
_0805C9EC:
	adds r0, r2, 0
	adds r1, r3, 0
	bl get_mapheader_by_bank_and_number
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x4]
_0805C9F8:
	ldrb r2, [r0]
	adds r0, r4, 0
	bl FindFieldObjectTemplateInArrayByLocalId
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectTemplateByLocalIdAndMap

	thumb_func_start FindFieldObjectTemplateInArrayByLocalId
FindFieldObjectTemplateInArrayByLocalId: @ 805CA08
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	cmp r1, r2
	bcs _0805CA36
_0805CA1A:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, r4
	bne _0805CA2C
	adds r0, r3, 0
	b _0805CA38
_0805CA2C:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcc _0805CA1A
_0805CA36:
	movs r0, 0
_0805CA38:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FindFieldObjectTemplateInArrayByLocalId

	thumb_func_start sub_805C700
sub_805C700: @ 805CA40
	push {r4,r5,lr}
	adds r2, r0, 0
	ldrb r1, [r2, 0x9]
	ldr r4, _0805CA60
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	adds r5, r4, 0
	cmp r1, r0
	bne _0805CA8A
	ldrb r1, [r2, 0xA]
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _0805CA6E
	b _0805CA8A
	.align 2, 0
_0805CA60: .4byte gSaveBlock1
_0805CA64:
	movs r1, 0xC2
	lsls r1, 4
	adds r0, r5, r1
	adds r0, r2, r0
	b _0805CA8C
_0805CA6E:
	movs r3, 0
	ldrb r0, [r2, 0x8]
	movs r2, 0xC2
	lsls r2, 4
	adds r1, r4, r2
	movs r2, 0
_0805CA7A:
	ldrb r4, [r1]
	cmp r0, r4
	beq _0805CA64
	adds r1, 0x18
	adds r2, 0x18
	adds r3, 0x1
	cmp r3, 0x3F
	ble _0805CA7A
_0805CA8A:
	movs r0, 0
_0805CA8C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805C700

	thumb_func_start sub_805C754
sub_805C754: @ 805CA94
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805C700
	adds r1, r0, 0
	cmp r1, 0
	beq _0805CAAE
	ldrh r0, [r4, 0x10]
	subs r0, 0x7
	strh r0, [r1, 0x4]
	ldrh r0, [r4, 0x12]
	subs r0, 0x7
	strh r0, [r1, 0x6]
_0805CAAE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C754

	thumb_func_start sub_805C774
sub_805C774: @ 805CAB4
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_805C700
	cmp r0, 0
	beq _0805CAC4
	strb r4, [r0, 0x9]
_0805CAC4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C774

	thumb_func_start sub_805C78C
sub_805C78C: @ 805CACC
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805CAFA
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805CB00
	adds r0, r1
	bl sub_805C754
_0805CAFA:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805CB00: .4byte gMapObjects
	thumb_func_end sub_805C78C

	thumb_func_start sub_805C7C4
sub_805C7C4: @ 805CB04
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl gpu_pal_allocator_reset__manage_upper_four
	ldr r1, _0805CB34
	ldr r2, _0805CB38
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0805CB3C
	strb r4, [r0]
	ldr r1, _0805CB40
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0xA
	bl pal_patch_for_npc_range
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB34: .4byte gUnknown_030005A6
_0805CB38: .4byte 0x000011ff
_0805CB3C: .4byte gUnknown_030005A4
_0805CB40: .4byte gUnknown_0837399C
	thumb_func_end sub_805C7C4

	thumb_func_start npc_paltag_by_palslot
npc_paltag_by_palslot: @ 805CB44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9
	bhi _0805CB80
	ldr r1, _0805CB60
	ldr r0, _0805CB64
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r2, 1
	b _0805CB74
	.align 2, 0
_0805CB60: .4byte gUnknown_0837399C
_0805CB64: .4byte gUnknown_030005A4
_0805CB68:
	adds r1, r4, 0x4
	adds r1, r2, r1
	ldr r0, _0805CB7C
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
_0805CB74:
	adds r0, r1
	ldrh r0, [r0]
	b _0805CBB2
	.align 2, 0
_0805CB7C: .4byte gUnknown_030005A4
_0805CB80:
	movs r3, 0
	ldr r0, _0805CBB8
	ldrh r1, [r0]
	ldr r2, _0805CBBC
	adds r4, r0, 0
	cmp r1, r2
	beq _0805CBB0
	adds r6, r4, 0
	ldr r0, _0805CBC0
	ldrh r1, [r0]
	adds r5, r2, 0
_0805CB96:
	lsls r2, r3, 3
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r1
	beq _0805CB68
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r5
	bne _0805CB96
_0805CBB0:
	ldr r0, _0805CBBC
_0805CBB2:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805CBB8: .4byte gUnknown_083738E4
_0805CBBC: .4byte 0x000011ff
_0805CBC0: .4byte gUnknown_030005A6
	thumb_func_end npc_paltag_by_palslot

	thumb_func_start sub_805C884
sub_805C884: @ 805CBC4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805CBE0
	adds r0, r2
	ldr r2, _0805CBE4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805CBE0: .4byte gMapObjects
_0805CBE4: .4byte sub_805C8A8
	thumb_func_end sub_805C884

	thumb_func_start sub_805C8A8
sub_805C8A8: @ 805CBE8
	movs r0, 0
	bx lr
	thumb_func_end sub_805C8A8

	thumb_func_start sub_805C8AC
sub_805C8AC: @ 805CBEC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805CC08
	adds r0, r2
	ldr r2, _0805CC0C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805CC08: .4byte gMapObjects
_0805CC0C: .4byte sub_805C8D0
	thumb_func_end sub_805C8AC

	thumb_func_start sub_805C8D0
sub_805C8D0: @ 805CC10
	push {r4,lr}
	ldr r3, _0805CC2C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805CC2C: .4byte gUnknown_08375224
	thumb_func_end sub_805C8D0

	thumb_func_start sub_805C8F0
sub_805C8F0: @ 805CC30
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805C8F0

	thumb_func_start sub_805C904
sub_805C904: @ 805CC44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805C904

	thumb_func_start sub_805C930
sub_805C930: @ 805CC70
	push {r4-r6,lr}
	adds r6, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805CCA4
	ldr r5, _0805CCA0
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl sub_8064820
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0805CCA6
	.align 2, 0
_0805CCA0: .4byte gUnknown_0837520C
_0805CCA4:
	movs r0, 0
_0805CCA6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805C930

	thumb_func_start sub_805C96C
sub_805C96C: @ 805CCAC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805CCC0
	movs r0, 0
	b _0805CCC6
_0805CCC0:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805CCC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805C96C

	thumb_func_start sub_805C98C
sub_805C98C: @ 805CCCC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0805CD14
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805FF20
	lsls r0, 24
	cmp r0, 0
	beq _0805CD0A
	movs r0, 0x1
	strh r0, [r6, 0x30]
_0805CD0A:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805CD14: .4byte gUnknown_08375240
	thumb_func_end sub_805C98C

	thumb_func_start sub_805C9D8
sub_805C9D8: @ 805CD18
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805C9D8

	thumb_func_start sub_805CA08
sub_805CA08: @ 805CD48
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805CD66
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805CD66:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CA08

	thumb_func_start FieldObjectIsTrainerAndCloseToPlayer
FieldObjectIsTrainerAndCloseToPlayer: @ 805CD70
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r0, 0x80
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805CDDC
	ldrb r0, [r5, 0x7]
	cmp r0, 0x1
	beq _0805CD8C
	cmp r0, 0x3
	bne _0805CDDC
_0805CD8C:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	ldrh r2, [r5, 0x10]
	ldrh r4, [r5, 0x12]
	ldrb r1, [r5, 0x1D]
	subs r3, r2, r1
	subs r0, r4, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r1, r2
	lsls r2, 16
	lsrs r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	mov r0, sp
	lsls r3, 16
	asrs r3, 16
	movs r1, 0
	ldrsh r4, [r0, r1]
	cmp r3, r4
	bgt _0805CDDC
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r4
	blt _0805CDDC
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bgt _0805CDDC
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, r1
	bge _0805CDE0
_0805CDDC:
	movs r0, 0
	b _0805CDE2
_0805CDE0:
	movs r0, 0x1
_0805CDE2:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsTrainerAndCloseToPlayer

	thumb_func_start sub_805CAAC
sub_805CAAC: @ 805CDEC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsls r3, 16
	cmp r2, r3
	ble _0805CE0A
	movs r2, 0x4
	lsls r0, r4, 16
	cmp r0, 0
	bge _0805CE14
	movs r2, 0x3
	b _0805CE14
_0805CE0A:
	movs r2, 0x1
	lsls r0, 16
	cmp r0, 0
	bge _0805CE14
	movs r2, 0x2
_0805CE14:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CAAC

	thumb_func_start sub_805CADC
sub_805CADC: @ 805CE1C
	push {lr}
	movs r0, 0x1
	lsls r1, 16
	cmp r1, 0
	bge _0805CE28
	movs r0, 0x2
_0805CE28:
	pop {r1}
	bx r1
	thumb_func_end sub_805CADC

	thumb_func_start sub_805CAEC
sub_805CAEC: @ 805CE2C
	push {lr}
	movs r1, 0x4
	lsls r0, 16
	cmp r0, 0
	bge _0805CE38
	movs r1, 0x3
_0805CE38:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805CAEC

	thumb_func_start sub_805CB00
sub_805CB00: @ 805CE40
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CE7C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0805CE96
	b _0805CE94
_0805CE7C:
	cmp r0, 0x4
	bne _0805CE96
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CE96
_0805CE94:
	movs r0, 0x2
_0805CE96:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CB00

	thumb_func_start sub_805CB5C
sub_805CB5C: @ 805CE9C
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CED8
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805CEF2
	b _0805CEF0
_0805CED8:
	cmp r0, 0x3
	bne _0805CEF2
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CEF2
_0805CEF0:
	movs r0, 0x2
_0805CEF2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CB5C

	thumb_func_start sub_805CBB8
sub_805CBB8: @ 805CEF8
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CF34
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0805CF4E
	b _0805CF4C
_0805CF34:
	cmp r0, 0x4
	bne _0805CF4E
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CF4E
_0805CF4C:
	movs r0, 0x1
_0805CF4E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CBB8

	thumb_func_start sub_805CC14
sub_805CC14: @ 805CF54
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CF90
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805CFAA
	b _0805CFA8
_0805CF90:
	cmp r0, 0x3
	bne _0805CFAA
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CFAA
_0805CFA8:
	movs r0, 0x1
_0805CFAA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CC14

	thumb_func_start sub_805CC70
sub_805CC70: @ 805CFB0
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0805CFE6
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
_0805CFE6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CC70

	thumb_func_start sub_805CCAC
sub_805CCAC: @ 805CFEC
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805D022
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
_0805D022:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CCAC

	thumb_func_start sub_805CCE8
sub_805CCE8: @ 805D028
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805D05E
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
_0805D05E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CCE8

	thumb_func_start sub_805CD24
sub_805CD24: @ 805D064
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805D09A
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
_0805D09A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CD24

	thumb_func_start sub_805CD60
sub_805CD60: @ 805D0A0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	bne _0805D0B8
	movs r0, 0
	b _0805D11C
_0805D0B8:
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	mov r2, sp
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r5]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r5]
	mov r0, sp
	ldrh r3, [r5]
	ldrh r2, [r0]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0805D0EC
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
_0805D0EC:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _0805D0FA
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
_0805D0FA:
	ldr r0, _0805D124
	lsls r4, r6, 2
	adds r4, r0
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	movs r6, 0
	ldrsh r1, [r5, r6]
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	ldr r4, [r4]
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805D11C:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805D124: .4byte gUnknown_08375244
	thumb_func_end sub_805CD60

	thumb_func_start sub_805CDE8
sub_805CDE8: @ 805D128
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D144
	adds r0, r2
	ldr r2, _0805D148
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D144: .4byte gMapObjects
_0805D148: .4byte sub_805CE0C
	thumb_func_end sub_805CDE8

	thumb_func_start sub_805CE0C
sub_805CE0C: @ 805D14C
	push {r4,lr}
	ldr r3, _0805D168
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D168: .4byte gUnknown_08375270
	thumb_func_end sub_805CE0C

	thumb_func_start sub_805CE2C
sub_805CE2C: @ 805D16C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CE2C

	thumb_func_start sub_805CE40
sub_805CE40: @ 805D180
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CE40

	thumb_func_start sub_805CE6C
sub_805CE6C: @ 805D1AC
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D1E2
	ldr r4, _0805D1EC
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805D1E2:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D1EC: .4byte gUnknown_0837520C
	thumb_func_end sub_805CE6C

	thumb_func_start sub_805CEB0
sub_805CEB0: @ 805D1F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D20E
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805D216
_0805D20E:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805D218
_0805D216:
	movs r0, 0
_0805D218:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CEB0

	thumb_func_start sub_805CEE0
sub_805CEE0: @ 805D220
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D264
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805D250
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805D250:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D264: .4byte gUnknown_08375240
	thumb_func_end sub_805CEE0

	thumb_func_start sub_805CF28
sub_805CF28: @ 805D268
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D284
	adds r0, r2
	ldr r2, _0805D288
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D284: .4byte gMapObjects
_0805D288: .4byte sub_805CF4C
	thumb_func_end sub_805CF28

	thumb_func_start sub_805CF4C
sub_805CF4C: @ 805D28C
	push {r4,lr}
	ldr r3, _0805D2A8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D2A8: .4byte gUnknown_08375284
	thumb_func_end sub_805CF4C

	thumb_func_start sub_805CF6C
sub_805CF6C: @ 805D2AC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CF6C

	thumb_func_start sub_805CF80
sub_805CF80: @ 805D2C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CF80

	thumb_func_start sub_805CFAC
sub_805CFAC: @ 805D2EC
	push {r4-r6,lr}
	adds r6, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D320
	ldr r5, _0805D31C
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl sub_8064820
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0805D322
	.align 2, 0
_0805D31C: .4byte gUnknown_0837520C
_0805D320:
	movs r0, 0
_0805D322:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805CFAC

	thumb_func_start sub_805CFE8
sub_805CFE8: @ 805D328
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D33C
	movs r0, 0
	b _0805D342
_0805D33C:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D342:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CFE8

	thumb_func_start sub_805D008
sub_805D008: @ 805D348
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0805D390
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805FF20
	lsls r0, 24
	cmp r0, 0
	beq _0805D386
	strh r7, [r6, 0x30]
_0805D386:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D390: .4byte gUnknown_083752A0
	thumb_func_end sub_805D008

	thumb_func_start sub_805D054
sub_805D054: @ 805D394
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D054

	thumb_func_start sub_805D084
sub_805D084: @ 805D3C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D3E2
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805D3E2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D084

	thumb_func_start sub_805D0AC
sub_805D0AC: @ 805D3EC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D408
	adds r0, r2
	ldr r2, _0805D40C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D408: .4byte gMapObjects
_0805D40C: .4byte sub_805D0D0
	thumb_func_end sub_805D0AC

	thumb_func_start sub_805D0D0
sub_805D0D0: @ 805D410
	push {r4,lr}
	ldr r3, _0805D42C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D42C: .4byte gUnknown_083752A4
	thumb_func_end sub_805D0D0

	thumb_func_start sub_805D0F0
sub_805D0F0: @ 805D430
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D0F0

	thumb_func_start sub_805D104
sub_805D104: @ 805D444
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D104

	thumb_func_start sub_805D130
sub_805D130: @ 805D470
	push {r4-r6,lr}
	adds r6, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D4A4
	ldr r5, _0805D4A0
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl sub_8064820
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0805D4A6
	.align 2, 0
_0805D4A0: .4byte gUnknown_0837520C
_0805D4A4:
	movs r0, 0
_0805D4A6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805D130

	thumb_func_start sub_805D16C
sub_805D16C: @ 805D4AC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D4C0
	movs r0, 0
	b _0805D4C6
_0805D4C0:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D4C6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D16C

	thumb_func_start sub_805D18C
sub_805D18C: @ 805D4CC
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0805D514
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805FF20
	lsls r0, 24
	cmp r0, 0
	beq _0805D50A
	strh r7, [r6, 0x30]
_0805D50A:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D514: .4byte gUnknown_083752C0
	thumb_func_end sub_805D18C

	thumb_func_start sub_805D1D8
sub_805D1D8: @ 805D518
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D1D8

	thumb_func_start sub_805D208
sub_805D208: @ 805D548
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D566
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805D566:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D208

	thumb_func_start sub_805D230
sub_805D230: @ 805D570
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D58C
	adds r0, r2
	ldr r2, _0805D590
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D58C: .4byte gMapObjects
_0805D590: .4byte sub_805D254
	thumb_func_end sub_805D230

	thumb_func_start sub_805D254
sub_805D254: @ 805D594
	push {r4,lr}
	ldr r3, _0805D5B0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D5B0: .4byte gUnknown_083752C4
	thumb_func_end sub_805D254

	thumb_func_start sub_805D274
sub_805D274: @ 805D5B4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D274

	thumb_func_start sub_805D2A0
sub_805D2A0: @ 805D5E0
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0805D5F2
	movs r0, 0
	b _0805D5F8
_0805D5F2:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D5F8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D2A0

	thumb_func_start sub_805D2C0
sub_805D2C0: @ 805D600
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_805D2C0

	thumb_func_start FieldObjectCB_BerryTree
FieldObjectCB_BerryTree: @ 805D610
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D64C
	adds r5, r0, r1
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0805D63C
	adds r0, r5, 0
	adds r1, r4, 0
	bl get_berry_tree_graphics
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r4, 0x3C]
_0805D63C:
	ldr r2, _0805D650
	adds r0, r5, 0
	adds r1, r4, 0
	bl meta_step
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D64C: .4byte gMapObjects
_0805D650: .4byte sub_805D314
	thumb_func_end FieldObjectCB_BerryTree

	thumb_func_start sub_805D314
sub_805D314: @ 805D654
	push {r4,lr}
	ldr r3, _0805D670
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D670: .4byte gUnknown_083752D0
	thumb_func_end sub_805D314

	thumb_func_start do_berry_tree_growth_sparkle_1
do_berry_tree_growth_sparkle_1: @ 805D674
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r6, r5, 0
	adds r6, 0x3E
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r4, 0x1D]
	bl GetStageByBerryTreeId
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _0805D6E4
	ldrh r1, [r5, 0x3C]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0805D6DA
	subs r6, 0x14
	ldrb r0, [r6]
	cmp r0, 0x4
	bne _0805D6DA
	ldr r1, _0805D6E0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r5, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x17
	bl FieldEffectStart
	strb r7, [r6]
_0805D6DA:
	movs r0, 0
	b _0805D726
	.align 2, 0
_0805D6E0: .4byte gUnknown_0202FF84
_0805D6E4:
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r6]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	subs r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r7
	bne _0805D720
	adds r0, r4, 0
	adds r1, r5, 0
	bl get_berry_tree_graphics
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x39
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	b _0805D726
_0805D720:
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
_0805D726:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end do_berry_tree_growth_sparkle_1

	thumb_func_start sub_805D3EC
sub_805D3EC: @ 805D72C
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0805D73E
	movs r0, 0
	b _0805D744
_0805D73E:
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D744:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D3EC

	thumb_func_start do_berry_tree_growth_sparkle_2
do_berry_tree_growth_sparkle_2: @ 805D74C
	push {r4,lr}
	ldrb r2, [r0]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0]
	movs r3, 0
	movs r2, 0x3
	strh r2, [r1, 0x30]
	strh r3, [r1, 0x32]
	ldrh r3, [r1, 0x3C]
	movs r2, 0x2
	orrs r2, r3
	strh r2, [r1, 0x3C]
	ldr r3, _0805D794
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	str r0, [r3, 0x4]
	adds r0, r1, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x17
	bl FieldEffectStart
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D794: .4byte gUnknown_0202FF84
	thumb_func_end do_berry_tree_growth_sparkle_2

	thumb_func_start sub_805D458
sub_805D458: @ 805D798
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	movs r0, 0x2
	ands r1, r0
	lsls r1, 16
	lsrs r1, 17
	lsls r1, 5
	ldrb r2, [r3, 0x1]
	subs r0, 0x23
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	bgt _0805D7D0
	movs r0, 0
	b _0805D7E2
_0805D7D0:
	adds r0, r3, 0
	adds r1, r4, 0
	bl get_berry_tree_graphics
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0805D7E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D458

	thumb_func_start sub_805D4A8
sub_805D4A8: @ 805D7E8
	push {r4,lr}
	adds r4, r1, 0
	ldrh r2, [r4, 0x32]
	adds r2, 0x1
	strh r2, [r4, 0x32]
	movs r1, 0x2
	ands r2, r1
	lsls r2, 16
	lsrs r2, 17
	lsls r2, 5
	ldrb r3, [r0, 0x1]
	subs r1, 0x23
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	bgt _0805D81E
	movs r0, 0
	b _0805D82C
_0805D81E:
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x3C]
	subs r0, 0x3
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r0, 0x1
_0805D82C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D4A8

	thumb_func_start sub_805D4F4
sub_805D4F4: @ 805D834
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D850
	adds r0, r2
	ldr r2, _0805D854
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D850: .4byte gMapObjects
_0805D854: .4byte sub_805D518
	thumb_func_end sub_805D4F4

	thumb_func_start sub_805D518
sub_805D518: @ 805D858
	push {r4,lr}
	ldr r3, _0805D874
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D874: .4byte gUnknown_083752E4
	thumb_func_end sub_805D518

	thumb_func_start sub_805D538
sub_805D538: @ 805D878
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D538

	thumb_func_start sub_805D54C
sub_805D54C: @ 805D88C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D54C

	thumb_func_start sub_805D578
sub_805D578: @ 805D8B8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D8EE
	ldr r4, _0805D8F8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805D8EE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8F8: .4byte gUnknown_0837520C
	thumb_func_end sub_805D578

	thumb_func_start sub_805D5BC
sub_805D5BC: @ 805D8FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D91A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805D922
_0805D91A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805D924
_0805D922:
	movs r0, 0
_0805D924:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D5BC

	thumb_func_start sub_805D5EC
sub_805D5EC: @ 805D92C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D970
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805D95C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805D95C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D970: .4byte gUnknown_083752A0
	thumb_func_end sub_805D5EC

	thumb_func_start sub_805D634
sub_805D634: @ 805D974
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D990
	adds r0, r2
	ldr r2, _0805D994
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D990: .4byte gMapObjects
_0805D994: .4byte sub_805D658
	thumb_func_end sub_805D634

	thumb_func_start sub_805D658
sub_805D658: @ 805D998
	push {r4,lr}
	ldr r3, _0805D9B4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D9B4: .4byte gUnknown_083752F8
	thumb_func_end sub_805D658

	thumb_func_start sub_805D678
sub_805D678: @ 805D9B8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D678

	thumb_func_start sub_805D68C
sub_805D68C: @ 805D9CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D68C

	thumb_func_start sub_805D6B8
sub_805D6B8: @ 805D9F8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DA2E
	ldr r4, _0805DA38
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DA2E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DA38: .4byte gUnknown_0837520C
	thumb_func_end sub_805D6B8

	thumb_func_start sub_805D6FC
sub_805D6FC: @ 805DA3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DA5A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DA62
_0805DA5A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DA64
_0805DA62:
	movs r0, 0
_0805DA64:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D6FC

	thumb_func_start sub_805D72C
sub_805D72C: @ 805DA6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DAB0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DA9C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DA9C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DAB0: .4byte gUnknown_083752C0
	thumb_func_end sub_805D72C

	thumb_func_start sub_805D774
sub_805D774: @ 805DAB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DAD0
	adds r0, r2
	ldr r2, _0805DAD4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DAD0: .4byte gMapObjects
_0805DAD4: .4byte sub_805D798
	thumb_func_end sub_805D774

	thumb_func_start sub_805D798
sub_805D798: @ 805DAD8
	push {r4,lr}
	ldr r3, _0805DAF4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DAF4: .4byte gUnknown_0837530C
	thumb_func_end sub_805D798

	thumb_func_start sub_805D7B8
sub_805D7B8: @ 805DAF8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D7B8

	thumb_func_start sub_805D7CC
sub_805D7CC: @ 805DB0C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D7CC

	thumb_func_start sub_805D7F8
sub_805D7F8: @ 805DB38
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DB6E
	ldr r4, _0805DB78
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DB6E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DB78: .4byte gUnknown_0837521C
	thumb_func_end sub_805D7F8

	thumb_func_start sub_805D83C
sub_805D83C: @ 805DB7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DB9A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DBA2
_0805DB9A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DBA4
_0805DBA2:
	movs r0, 0
_0805DBA4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D83C

	thumb_func_start sub_805D86C
sub_805D86C: @ 805DBAC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DBF0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DBDC
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DBDC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DBF0: .4byte gUnknown_08375320
	thumb_func_end sub_805D86C

	thumb_func_start sub_805D8B4
sub_805D8B4: @ 805DBF4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DC10
	adds r0, r2
	ldr r2, _0805DC14
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DC10: .4byte gMapObjects
_0805DC14: .4byte sub_805D8D8
	thumb_func_end sub_805D8B4

	thumb_func_start sub_805D8D8
sub_805D8D8: @ 805DC18
	push {r4,lr}
	ldr r3, _0805DC34
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DC34: .4byte gUnknown_08375324
	thumb_func_end sub_805D8D8

	thumb_func_start sub_805D8F8
sub_805D8F8: @ 805DC38
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D8F8

	thumb_func_start sub_805D90C
sub_805D90C: @ 805DC4C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D90C

	thumb_func_start sub_805D938
sub_805D938: @ 805DC78
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DCAE
	ldr r4, _0805DCB8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DCAE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DCB8: .4byte gUnknown_0837521C
	thumb_func_end sub_805D938

	thumb_func_start sub_805D97C
sub_805D97C: @ 805DCBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DCDA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DCE2
_0805DCDA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DCE4
_0805DCE2:
	movs r0, 0
_0805DCE4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D97C

	thumb_func_start sub_805D9AC
sub_805D9AC: @ 805DCEC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DD30
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DD1C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DD1C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DD30: .4byte gUnknown_08375338
	thumb_func_end sub_805D9AC

	thumb_func_start sub_805D9F4
sub_805D9F4: @ 805DD34
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DD50
	adds r0, r2
	ldr r2, _0805DD54
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DD50: .4byte gMapObjects
_0805DD54: .4byte sub_805DA18
	thumb_func_end sub_805D9F4

	thumb_func_start sub_805DA18
sub_805DA18: @ 805DD58
	push {r4,lr}
	ldr r3, _0805DD74
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DD74: .4byte gUnknown_0837533C
	thumb_func_end sub_805DA18

	thumb_func_start sub_805DA38
sub_805DA38: @ 805DD78
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DA38

	thumb_func_start sub_805DA4C
sub_805DA4C: @ 805DD8C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DA4C

	thumb_func_start sub_805DA78
sub_805DA78: @ 805DDB8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DDEE
	ldr r4, _0805DDF8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DDEE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DDF8: .4byte gUnknown_0837521C
	thumb_func_end sub_805DA78

	thumb_func_start sub_805DABC
sub_805DABC: @ 805DDFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DE1A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DE22
_0805DE1A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DE24
_0805DE22:
	movs r0, 0
_0805DE24:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DABC

	thumb_func_start sub_805DAEC
sub_805DAEC: @ 805DE2C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DE70
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DE5C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DE5C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DE70: .4byte gUnknown_08375350
	thumb_func_end sub_805DAEC

	thumb_func_start sub_805DB34
sub_805DB34: @ 805DE74
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DE90
	adds r0, r2
	ldr r2, _0805DE94
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DE90: .4byte gMapObjects
_0805DE94: .4byte sub_805DB58
	thumb_func_end sub_805DB34

	thumb_func_start sub_805DB58
sub_805DB58: @ 805DE98
	push {r4,lr}
	ldr r3, _0805DEB4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DEB4: .4byte gUnknown_08375354
	thumb_func_end sub_805DB58

	thumb_func_start sub_805DB78
sub_805DB78: @ 805DEB8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DB78

	thumb_func_start sub_805DB8C
sub_805DB8C: @ 805DECC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DB8C

	thumb_func_start sub_805DBB8
sub_805DBB8: @ 805DEF8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DF2E
	ldr r4, _0805DF38
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DF2E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DF38: .4byte gUnknown_0837521C
	thumb_func_end sub_805DBB8

	thumb_func_start sub_805DBFC
sub_805DBFC: @ 805DF3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DF5A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DF62
_0805DF5A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DF64
_0805DF62:
	movs r0, 0
_0805DF64:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DBFC

	thumb_func_start sub_805DC2C
sub_805DC2C: @ 805DF6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DFB0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x6
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DF9C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DF9C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DFB0: .4byte gUnknown_08375368
	thumb_func_end sub_805DC2C

	thumb_func_start sub_805DC74
sub_805DC74: @ 805DFB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DFD0
	adds r0, r2
	ldr r2, _0805DFD4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DFD0: .4byte gMapObjects
_0805DFD4: .4byte sub_805DC98
	thumb_func_end sub_805DC74

	thumb_func_start sub_805DC98
sub_805DC98: @ 805DFD8
	push {r4,lr}
	ldr r3, _0805DFF4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DFF4: .4byte gUnknown_0837536C
	thumb_func_end sub_805DC98

	thumb_func_start sub_805DCB8
sub_805DCB8: @ 805DFF8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DCB8

	thumb_func_start sub_805DCCC
sub_805DCCC: @ 805E00C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DCCC

	thumb_func_start sub_805DCF8
sub_805DCF8: @ 805E038
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E06E
	ldr r4, _0805E078
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805E06E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E078: .4byte gUnknown_0837521C
	thumb_func_end sub_805DCF8

	thumb_func_start sub_805DD3C
sub_805DD3C: @ 805E07C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E09A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E0A2
_0805E09A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805E0A4
_0805E0A2:
	movs r0, 0
_0805E0A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DD3C

	thumb_func_start sub_805DD6C
sub_805DD6C: @ 805E0AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E0F0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x7
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E0DC
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805E0DC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E0F0: .4byte gUnknown_08375380
	thumb_func_end sub_805DD6C

	thumb_func_start sub_805DDB4
sub_805DDB4: @ 805E0F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E110
	adds r0, r2
	ldr r2, _0805E114
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E110: .4byte gMapObjects
_0805E114: .4byte sub_805DDD8
	thumb_func_end sub_805DDB4

	thumb_func_start sub_805DDD8
sub_805DDD8: @ 805E118
	push {r4,lr}
	ldr r3, _0805E134
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E134: .4byte gUnknown_08375384
	thumb_func_end sub_805DDD8

	thumb_func_start sub_805DDF8
sub_805DDF8: @ 805E138
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DDF8

	thumb_func_start sub_805DE0C
sub_805DE0C: @ 805E14C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DE0C

	thumb_func_start sub_805DE38
sub_805DE38: @ 805E178
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E1AE
	ldr r4, _0805E1B8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805E1AE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E1B8: .4byte gUnknown_0837521C
	thumb_func_end sub_805DE38

	thumb_func_start sub_805DE7C
sub_805DE7C: @ 805E1BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E1DA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E1E2
_0805E1DA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805E1E4
_0805E1E2:
	movs r0, 0
_0805E1E4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DE7C

	thumb_func_start sub_805DEAC
sub_805DEAC: @ 805E1EC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E230
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E21C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805E21C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E230: .4byte gUnknown_08375398
	thumb_func_end sub_805DEAC

	thumb_func_start sub_805DEF4
sub_805DEF4: @ 805E234
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E250
	adds r0, r2
	ldr r2, _0805E254
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E250: .4byte gMapObjects
_0805E254: .4byte sub_805DF18
	thumb_func_end sub_805DEF4

	thumb_func_start sub_805DF18
sub_805DF18: @ 805E258
	push {r4,lr}
	ldr r3, _0805E274
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E274: .4byte gUnknown_0837539C
	thumb_func_end sub_805DF18

	thumb_func_start sub_805DF38
sub_805DF38: @ 805E278
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DF38

	thumb_func_start sub_805DF4C
sub_805DF4C: @ 805E28C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DF4C

	thumb_func_start sub_805DF78
sub_805DF78: @ 805E2B8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E2EE
	ldr r4, _0805E2F8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805E2EE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E2F8: .4byte gUnknown_0837521C
	thumb_func_end sub_805DF78

	thumb_func_start sub_805DFBC
sub_805DFBC: @ 805E2FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E31A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E322
_0805E31A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805E324
_0805E322:
	movs r0, 0
_0805E324:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DFBC

	thumb_func_start sub_805DFEC
sub_805DFEC: @ 805E32C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E370
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x9
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E35C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805E35C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E370: .4byte gUnknown_083753B0
	thumb_func_end sub_805DFEC

	thumb_func_start sub_805E034
sub_805E034: @ 805E374
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E390
	adds r0, r2
	ldr r2, _0805E394
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E390: .4byte gMapObjects
_0805E394: .4byte sub_805E058
	thumb_func_end sub_805E034

	thumb_func_start sub_805E058
sub_805E058: @ 805E398
	push {r4,lr}
	ldr r3, _0805E3B4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E3B4: .4byte gUnknown_083753B4
	thumb_func_end sub_805E058

	thumb_func_start sub_805E078
sub_805E078: @ 805E3B8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E078

	thumb_func_start sub_805E08C
sub_805E08C: @ 805E3CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E08C

	thumb_func_start sub_805E0B8
sub_805E0B8: @ 805E3F8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E42E
	ldr r4, _0805E438
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805E42E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E438: .4byte gUnknown_0837521C
	thumb_func_end sub_805E0B8

	thumb_func_start sub_805E0FC
sub_805E0FC: @ 805E43C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E45A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E462
_0805E45A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805E464
_0805E462:
	movs r0, 0
_0805E464:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E0FC

	thumb_func_start sub_805E12C
sub_805E12C: @ 805E46C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E4B0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E49C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805E49C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E4B0: .4byte gUnknown_083753C8
	thumb_func_end sub_805E12C

	thumb_func_start sub_805E174
sub_805E174: @ 805E4B4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E4D0
	adds r0, r2
	ldr r2, _0805E4D4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E4D0: .4byte gMapObjects
_0805E4D4: .4byte sub_805E198
	thumb_func_end sub_805E174

	thumb_func_start sub_805E198
sub_805E198: @ 805E4D8
	push {r4,lr}
	ldr r3, _0805E4F4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E4F4: .4byte gUnknown_083753CC
	thumb_func_end sub_805E198

	thumb_func_start sub_805E1B8
sub_805E1B8: @ 805E4F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E1B8

	thumb_func_start sub_805E1E4
sub_805E1E4: @ 805E524
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E53E
	adds r0, r4, 0
	movs r1, 0x30
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x30]
_0805E53E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E1E4

	thumb_func_start sub_805E208
sub_805E208: @ 805E548
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E566
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E56A
_0805E566:
	movs r0, 0x3
	strh r0, [r5, 0x30]
_0805E56A:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E208

	thumb_func_start sub_805E234
sub_805E234: @ 805E574
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E5B4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E5A0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
_0805E5A0:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E5B4: .4byte gUnknown_083753DC
	thumb_func_end sub_805E234

	thumb_func_start sub_805E278
sub_805E278: @ 805E5B8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E5D4
	adds r0, r2
	ldr r2, _0805E5D8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E5D4: .4byte gMapObjects
_0805E5D8: .4byte sub_805E29C
	thumb_func_end sub_805E278

	thumb_func_start sub_805E29C
sub_805E29C: @ 805E5DC
	push {r4,lr}
	ldr r3, _0805E5F8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E5F8: .4byte gUnknown_083753E4
	thumb_func_end sub_805E29C

	thumb_func_start sub_805E2BC
sub_805E2BC: @ 805E5FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E2BC

	thumb_func_start sub_805E2E8
sub_805E2E8: @ 805E628
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E642
	adds r0, r4, 0
	movs r1, 0x30
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x30]
_0805E642:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E2E8

	thumb_func_start sub_805E30C
sub_805E30C: @ 805E64C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E66A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E66E
_0805E66A:
	movs r0, 0x3
	strh r0, [r5, 0x30]
_0805E66E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E30C

	thumb_func_start sub_805E338
sub_805E338: @ 805E678
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E6B8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E6A4
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
_0805E6A4:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E6B8: .4byte gUnknown_083753F4
	thumb_func_end sub_805E338

	thumb_func_start sub_805E37C
sub_805E37C: @ 805E6BC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E6D8
	adds r0, r2
	ldr r2, _0805E6DC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E6D8: .4byte gMapObjects
_0805E6DC: .4byte sub_805E3A0
	thumb_func_end sub_805E37C

	thumb_func_start sub_805E3A0
sub_805E3A0: @ 805E6E0
	push {r4,lr}
	ldr r3, _0805E6FC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E6FC: .4byte gUnknown_083753FC
	thumb_func_end sub_805E3A0

	thumb_func_start sub_805E3C0
sub_805E3C0: @ 805E700
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E3C0

	thumb_func_start sub_805E3D4
sub_805E3D4: @ 805E714
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0805E748
	ldrb r1, [r4, 0x6]
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r4, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805E736
	adds r0, r1, 0
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r1, r0, 24
_0805E736:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E748: .4byte gUnknown_0836DC09
	thumb_func_end sub_805E3D4

	thumb_func_start sub_805E40C
sub_805E40C: @ 805E74C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r7, r1, 0
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0
	beq _0805E77C
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x10]
	cmp r1, r0
	bne _0805E77C
	movs r0, 0
	strb r0, [r2]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
_0805E77C:
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r5, 0x1
	bne _0805E7D2
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r5, r0, 24
_0805E7D2:
	cmp r5, 0
	beq _0805E7E4
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r6, r0, 24
_0805E7E4:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x3
	strh r0, [r7, 0x30]
	movs r0, 0x1
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805E40C

	thumb_func_start sub_805E4C4
sub_805E4C4: @ 805E804
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E822
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805E822:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E4C4

	thumb_func_start sub_805E4EC
sub_805E4EC: @ 805E82C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E4EC

	thumb_func_start MoveFieldObjectInNextDirectionInSequence
MoveFieldObjectInNextDirectionInSequence: @ 805E840
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	mov r8, r1
	adds r7, r2, 0
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0805E862
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x10]
	cmp r1, r0
	bne _0805E862
	movs r0, 0
	strb r0, [r2]
_0805E862:
	adds r5, r4, 0
	adds r5, 0x21
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805E8BC
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r0, 24
_0805E8BC:
	cmp r0, 0
	beq _0805E8CE
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r6, r0, 24
_0805E8CE:
	adds r0, r4, 0
	mov r1, r8
	adds r2, r6, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	mov r1, r8
	strh r0, [r1, 0x30]
	movs r0, 0x1
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MoveFieldObjectInNextDirectionInSequence

	thumb_func_start sub_805E5B4
sub_805E5B4: @ 805E8F4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E912
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805E912:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E5B4

	thumb_func_start sub_805E5DC
sub_805E5DC: @ 805E91C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E938
	adds r0, r2
	ldr r2, _0805E93C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E938: .4byte gMapObjects
_0805E93C: .4byte sub_805E600
	thumb_func_end sub_805E5DC

	thumb_func_start sub_805E600
sub_805E600: @ 805E940
	push {r4,lr}
	ldr r3, _0805E95C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E95C: .4byte gUnknown_0837540C
	thumb_func_end sub_805E600

	thumb_func_start sub_805E620
sub_805E620: @ 805E960
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E9A4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E98C
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E98C
	movs r0, 0x3
	strb r0, [r2]
_0805E98C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9A4: .4byte gUnknown_08375418
	thumb_func_end sub_805E620

	thumb_func_start sub_805E668
sub_805E668: @ 805E9A8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E9C4
	adds r0, r2
	ldr r2, _0805E9C8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E9C4: .4byte gMapObjects
_0805E9C8: .4byte sub_805E68C
	thumb_func_end sub_805E668

	thumb_func_start sub_805E68C
sub_805E68C: @ 805E9CC
	push {r4,lr}
	ldr r3, _0805E9E8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9E8: .4byte gUnknown_0837541C
	thumb_func_end sub_805E68C

	thumb_func_start sub_805E6AC
sub_805E6AC: @ 805E9EC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EA30
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EA18
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EA18
	movs r0, 0x2
	strb r0, [r2]
_0805EA18:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EA30: .4byte gUnknown_08375428
	thumb_func_end sub_805E6AC

	thumb_func_start sub_805E6F4
sub_805E6F4: @ 805EA34
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EA50
	adds r0, r2
	ldr r2, _0805EA54
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EA50: .4byte gMapObjects
_0805EA54: .4byte sub_805E718
	thumb_func_end sub_805E6F4

	thumb_func_start sub_805E718
sub_805E718: @ 805EA58
	push {r4,lr}
	ldr r3, _0805EA74
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EA74: .4byte gUnknown_0837542C
	thumb_func_end sub_805E718

	thumb_func_start sub_805E738
sub_805E738: @ 805EA78
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EABC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EAA4
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EAA4
	movs r0, 0x2
	strb r0, [r2]
_0805EAA4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EABC: .4byte gUnknown_08375438
	thumb_func_end sub_805E738

	thumb_func_start sub_805E780
sub_805E780: @ 805EAC0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EADC
	adds r0, r2
	ldr r2, _0805EAE0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EADC: .4byte gMapObjects
_0805EAE0: .4byte sub_805E7A4
	thumb_func_end sub_805E780

	thumb_func_start sub_805E7A4
sub_805E7A4: @ 805EAE4
	push {r4,lr}
	ldr r3, _0805EB00
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB00: .4byte gUnknown_0837543C
	thumb_func_end sub_805E7A4

	thumb_func_start sub_805E7C4
sub_805E7C4: @ 805EB04
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EB48
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EB30
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EB30
	movs r0, 0x3
	strb r0, [r2]
_0805EB30:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB48: .4byte gUnknown_08375448
	thumb_func_end sub_805E7C4

	thumb_func_start sub_805E80C
sub_805E80C: @ 805EB4C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EB68
	adds r0, r2
	ldr r2, _0805EB6C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EB68: .4byte gMapObjects
_0805EB6C: .4byte sub_805E830
	thumb_func_end sub_805E80C

	thumb_func_start sub_805E830
sub_805E830: @ 805EB70
	push {r4,lr}
	ldr r3, _0805EB8C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB8C: .4byte gUnknown_0837544C
	thumb_func_end sub_805E830

	thumb_func_start sub_805E850
sub_805E850: @ 805EB90
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EBD4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EBBC
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EBBC
	movs r0, 0x3
	strb r0, [r2]
_0805EBBC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EBD4: .4byte gUnknown_08375458
	thumb_func_end sub_805E850

	thumb_func_start sub_805E898
sub_805E898: @ 805EBD8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EBF4
	adds r0, r2
	ldr r2, _0805EBF8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EBF4: .4byte gMapObjects
_0805EBF8: .4byte sub_805E8BC
	thumb_func_end sub_805E898

	thumb_func_start sub_805E8BC
sub_805E8BC: @ 805EBFC
	push {r4,lr}
	ldr r3, _0805EC18
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC18: .4byte gUnknown_0837545C
	thumb_func_end sub_805E8BC

	thumb_func_start sub_805E8DC
sub_805E8DC: @ 805EC1C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EC60
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EC48
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EC48
	movs r0, 0x2
	strb r0, [r2]
_0805EC48:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC60: .4byte gUnknown_08375468
	thumb_func_end sub_805E8DC

	thumb_func_start sub_805E924
sub_805E924: @ 805EC64
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EC80
	adds r0, r2
	ldr r2, _0805EC84
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EC80: .4byte gMapObjects
_0805EC84: .4byte sub_805E948
	thumb_func_end sub_805E924

	thumb_func_start sub_805E948
sub_805E948: @ 805EC88
	push {r4,lr}
	ldr r3, _0805ECA4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805ECA4: .4byte gUnknown_0837546C
	thumb_func_end sub_805E948

	thumb_func_start sub_805E968
sub_805E968: @ 805ECA8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805ECEC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805ECD4
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805ECD4
	movs r0, 0x2
	strb r0, [r2]
_0805ECD4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ECEC: .4byte gUnknown_08375240
	thumb_func_end sub_805E968

	thumb_func_start sub_805E9B0
sub_805E9B0: @ 805ECF0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805ED0C
	adds r0, r2
	ldr r2, _0805ED10
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805ED0C: .4byte gMapObjects
_0805ED10: .4byte sub_805E9D4
	thumb_func_end sub_805E9B0

	thumb_func_start sub_805E9D4
sub_805E9D4: @ 805ED14
	push {r4,lr}
	ldr r3, _0805ED30
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805ED30: .4byte gUnknown_08375478
	thumb_func_end sub_805E9D4

	thumb_func_start sub_805E9F4
sub_805E9F4: @ 805ED34
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805ED78
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805ED60
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805ED60
	movs r0, 0x3
	strb r0, [r2]
_0805ED60:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ED78: .4byte gUnknown_08375484
	thumb_func_end sub_805E9F4

	thumb_func_start sub_805EA3C
sub_805EA3C: @ 805ED7C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805ED98
	adds r0, r2
	ldr r2, _0805ED9C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805ED98: .4byte gMapObjects
_0805ED9C: .4byte sub_805EA60
	thumb_func_end sub_805EA3C

	thumb_func_start sub_805EA60
sub_805EA60: @ 805EDA0
	push {r4,lr}
	ldr r3, _0805EDBC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EDBC: .4byte gUnknown_08375488
	thumb_func_end sub_805EA60

	thumb_func_start sub_805EA80
sub_805EA80: @ 805EDC0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EE04
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EDEC
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EDEC
	movs r0, 0x3
	strb r0, [r2]
_0805EDEC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE04: .4byte gUnknown_08375494
	thumb_func_end sub_805EA80

	thumb_func_start sub_805EAC8
sub_805EAC8: @ 805EE08
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EE24
	adds r0, r2
	ldr r2, _0805EE28
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EE24: .4byte gMapObjects
_0805EE28: .4byte sub_805EAEC
	thumb_func_end sub_805EAC8

	thumb_func_start sub_805EAEC
sub_805EAEC: @ 805EE2C
	push {r4,lr}
	ldr r3, _0805EE48
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE48: .4byte gUnknown_08375498
	thumb_func_end sub_805EAEC

	thumb_func_start sub_805EB0C
sub_805EB0C: @ 805EE4C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EE90
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EE78
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EE78
	movs r0, 0x2
	strb r0, [r2]
_0805EE78:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE90: .4byte gUnknown_083754A4
	thumb_func_end sub_805EB0C

	thumb_func_start sub_805EB54
sub_805EB54: @ 805EE94
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EEB0
	adds r0, r2
	ldr r2, _0805EEB4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EEB0: .4byte gMapObjects
_0805EEB4: .4byte sub_805EB78
	thumb_func_end sub_805EB54

	thumb_func_start sub_805EB78
sub_805EB78: @ 805EEB8
	push {r4,lr}
	ldr r3, _0805EED4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EED4: .4byte gUnknown_083754A8
	thumb_func_end sub_805EB78

	thumb_func_start sub_805EB98
sub_805EB98: @ 805EED8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EF1C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EF04
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EF04
	movs r0, 0x2
	strb r0, [r2]
_0805EF04:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EF1C: .4byte gUnknown_083754B4
	thumb_func_end sub_805EB98

	thumb_func_start sub_805EBE0
sub_805EBE0: @ 805EF20
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EF3C
	adds r0, r2
	ldr r2, _0805EF40
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EF3C: .4byte gMapObjects
_0805EF40: .4byte sub_805EC04
	thumb_func_end sub_805EBE0

	thumb_func_start sub_805EC04
sub_805EC04: @ 805EF44
	push {r4,lr}
	ldr r3, _0805EF60
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EF60: .4byte gUnknown_083754B8
	thumb_func_end sub_805EC04

	thumb_func_start sub_805EC24
sub_805EC24: @ 805EF64
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EFA8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EF90
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EF90
	movs r0, 0x3
	strb r0, [r2]
_0805EF90:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EFA8: .4byte gUnknown_083754C4
	thumb_func_end sub_805EC24

	thumb_func_start sub_805EC6C
sub_805EC6C: @ 805EFAC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EFC8
	adds r0, r2
	ldr r2, _0805EFCC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EFC8: .4byte gMapObjects
_0805EFCC: .4byte sub_805EC90
	thumb_func_end sub_805EC6C

	thumb_func_start sub_805EC90
sub_805EC90: @ 805EFD0
	push {r4,lr}
	ldr r3, _0805EFEC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EFEC: .4byte gUnknown_083754C8
	thumb_func_end sub_805EC90

	thumb_func_start sub_805ECB0
sub_805ECB0: @ 805EFF0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F034
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F01C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F01C
	movs r0, 0x3
	strb r0, [r2]
_0805F01C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F034: .4byte gUnknown_083754D4
	thumb_func_end sub_805ECB0

	thumb_func_start sub_805ECF8
sub_805ECF8: @ 805F038
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F054
	adds r0, r2
	ldr r2, _0805F058
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F054: .4byte gMapObjects
_0805F058: .4byte sub_805ED1C
	thumb_func_end sub_805ECF8

	thumb_func_start sub_805ED1C
sub_805ED1C: @ 805F05C
	push {r4,lr}
	ldr r3, _0805F078
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F078: .4byte gUnknown_083754D8
	thumb_func_end sub_805ED1C

	thumb_func_start sub_805ED3C
sub_805ED3C: @ 805F07C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F0C0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805F0A8
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F0A8
	movs r0, 0x2
	strb r0, [r2]
_0805F0A8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F0C0: .4byte gUnknown_083754E4
	thumb_func_end sub_805ED3C

	thumb_func_start sub_805ED84
sub_805ED84: @ 805F0C4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F0E0
	adds r0, r2
	ldr r2, _0805F0E4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F0E0: .4byte gMapObjects
_0805F0E4: .4byte sub_805EDA8
	thumb_func_end sub_805ED84

	thumb_func_start sub_805EDA8
sub_805EDA8: @ 805F0E8
	push {r4,lr}
	ldr r3, _0805F104
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F104: .4byte gUnknown_083754E8
	thumb_func_end sub_805EDA8

	thumb_func_start sub_805EDC8
sub_805EDC8: @ 805F108
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F14C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805F134
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F134
	movs r0, 0x2
	strb r0, [r2]
_0805F134:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F14C: .4byte gUnknown_083754F4
	thumb_func_end sub_805EDC8

	thumb_func_start sub_805EE10
sub_805EE10: @ 805F150
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F16C
	adds r0, r2
	ldr r2, _0805F170
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F16C: .4byte gMapObjects
_0805F170: .4byte sub_805EE34
	thumb_func_end sub_805EE10

	thumb_func_start sub_805EE34
sub_805EE34: @ 805F174
	push {r4,lr}
	ldr r3, _0805F190
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F190: .4byte gUnknown_083754F8
	thumb_func_end sub_805EE34

	thumb_func_start sub_805EE54
sub_805EE54: @ 805F194
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F1D8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F1C0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F1C0
	movs r0, 0x3
	strb r0, [r2]
_0805F1C0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F1D8: .4byte gUnknown_08375504
	thumb_func_end sub_805EE54

	thumb_func_start sub_805EE9C
sub_805EE9C: @ 805F1DC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F1F8
	adds r0, r2
	ldr r2, _0805F1FC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F1F8: .4byte gMapObjects
_0805F1FC: .4byte sub_805EEC0
	thumb_func_end sub_805EE9C

	thumb_func_start sub_805EEC0
sub_805EEC0: @ 805F200
	push {r4,lr}
	ldr r3, _0805F21C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F21C: .4byte gUnknown_08375508
	thumb_func_end sub_805EEC0

	thumb_func_start sub_805EEE0
sub_805EEE0: @ 805F220
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F264
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F24C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F24C
	movs r0, 0x3
	strb r0, [r2]
_0805F24C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F264: .4byte gUnknown_08375514
	thumb_func_end sub_805EEE0

	thumb_func_start sub_805EF28
sub_805EF28: @ 805F268
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F284
	adds r0, r2
	ldr r2, _0805F288
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F284: .4byte gMapObjects
_0805F288: .4byte sub_805EF4C
	thumb_func_end sub_805EF28

	thumb_func_start sub_805EF4C
sub_805EF4C: @ 805F28C
	push {r4,lr}
	ldr r3, _0805F2A8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F2A8: .4byte gUnknown_08375518
	thumb_func_end sub_805EF4C

	thumb_func_start sub_805EF6C
sub_805EF6C: @ 805F2AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F2F0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F2D8
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F2D8
	movs r0, 0x3
	strb r0, [r2]
_0805F2D8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F2F0: .4byte gUnknown_08375524
	thumb_func_end sub_805EF6C

	thumb_func_start sub_805EFB4
sub_805EFB4: @ 805F2F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F310
	adds r0, r2
	ldr r2, _0805F314
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F310: .4byte gMapObjects
_0805F314: .4byte sub_805EFD8
	thumb_func_end sub_805EFB4

	thumb_func_start sub_805EFD8
sub_805EFD8: @ 805F318
	push {r4,lr}
	ldr r3, _0805F334
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F334: .4byte gUnknown_08375528
	thumb_func_end sub_805EFD8

	thumb_func_start sub_805EFF8
sub_805EFF8: @ 805F338
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F37C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F364
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F364
	movs r0, 0x3
	strb r0, [r2]
_0805F364:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F37C: .4byte gUnknown_08375534
	thumb_func_end sub_805EFF8

	thumb_func_start sub_805F040
sub_805F040: @ 805F380
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F39C
	adds r0, r2
	ldr r2, _0805F3A0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F39C: .4byte gMapObjects
_0805F3A0: .4byte sub_805F064
	thumb_func_end sub_805F040

	thumb_func_start sub_805F064
sub_805F064: @ 805F3A4
	push {r4,lr}
	ldr r3, _0805F3C0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F3C0: .4byte gUnknown_08375538
	thumb_func_end sub_805F064

	thumb_func_start sub_805F084
sub_805F084: @ 805F3C4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F408
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F3F0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F3F0
	movs r0, 0x3
	strb r0, [r2]
_0805F3F0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F408: .4byte gUnknown_08375544
	thumb_func_end sub_805F084

	thumb_func_start sub_805F0CC
sub_805F0CC: @ 805F40C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F428
	adds r0, r2
	ldr r2, _0805F42C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F428: .4byte gMapObjects
_0805F42C: .4byte sub_805F0F0
	thumb_func_end sub_805F0CC

	thumb_func_start sub_805F0F0
sub_805F0F0: @ 805F430
	push {r4,lr}
	ldr r3, _0805F44C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F44C: .4byte gUnknown_08375548
	thumb_func_end sub_805F0F0

	thumb_func_start sub_805F110
sub_805F110: @ 805F450
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F494
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F47C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F47C
	movs r0, 0x3
	strb r0, [r2]
_0805F47C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F494: .4byte gUnknown_08375554
	thumb_func_end sub_805F110

	thumb_func_start sub_805F158
sub_805F158: @ 805F498
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F4B4
	adds r0, r2
	ldr r2, _0805F4B8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F4B4: .4byte gMapObjects
_0805F4B8: .4byte sub_805F17C
	thumb_func_end sub_805F158

	thumb_func_start sub_805F17C
sub_805F17C: @ 805F4BC
	push {r4,lr}
	ldr r3, _0805F4D8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F4D8: .4byte gUnknown_08375558
	thumb_func_end sub_805F17C

	thumb_func_start sub_805F19C
sub_805F19C: @ 805F4DC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F520
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F508
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F508
	movs r0, 0x3
	strb r0, [r2]
_0805F508:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F520: .4byte gUnknown_08375564
	thumb_func_end sub_805F19C

	thumb_func_start sub_805F1E4
sub_805F1E4: @ 805F524
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F540
	adds r0, r2
	ldr r2, _0805F544
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F540: .4byte gMapObjects
_0805F544: .4byte sub_805F208
	thumb_func_end sub_805F1E4

	thumb_func_start sub_805F208
sub_805F208: @ 805F548
	push {r4,lr}
	ldr r3, _0805F564
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F564: .4byte gUnknown_08375568
	thumb_func_end sub_805F208

	thumb_func_start sub_805F228
sub_805F228: @ 805F568
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F5AC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F594
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F594
	movs r0, 0x3
	strb r0, [r2]
_0805F594:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F5AC: .4byte gUnknown_08375574
	thumb_func_end sub_805F228

	thumb_func_start sub_805F270
sub_805F270: @ 805F5B0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F5CC
	adds r0, r2
	ldr r2, _0805F5D0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F5CC: .4byte gMapObjects
_0805F5D0: .4byte sub_805F294
	thumb_func_end sub_805F270

	thumb_func_start sub_805F294
sub_805F294: @ 805F5D4
	push {r4,lr}
	ldr r3, _0805F5F0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F5F0: .4byte gUnknown_08375578
	thumb_func_end sub_805F294

	thumb_func_start sub_805F2B4
sub_805F2B4: @ 805F5F4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F638
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F620
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F620
	movs r0, 0x3
	strb r0, [r2]
_0805F620:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F638: .4byte gUnknown_08375584
	thumb_func_end sub_805F2B4

	thumb_func_start sub_805F2FC
sub_805F2FC: @ 805F63C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F658
	adds r0, r2
	ldr r2, _0805F65C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F658: .4byte gMapObjects
_0805F65C: .4byte sub_805F320
	thumb_func_end sub_805F2FC

	thumb_func_start sub_805F320
sub_805F320: @ 805F660
	push {r4,lr}
	ldr r3, _0805F67C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F67C: .4byte gUnknown_08375588
	thumb_func_end sub_805F320

	thumb_func_start mss_npc_reset_oampriv3_1_unk2_unk3
mss_npc_reset_oampriv3_1_unk2_unk3: @ 805F680
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	adds r4, 0x21
	ldrb r0, [r4]
	cmp r0, 0
	bne _0805F698
	bl player_get_direction_lower_nybble
	strb r0, [r4]
_0805F698:
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end mss_npc_reset_oampriv3_1_unk2_unk3

	thumb_func_start sub_805F364
sub_805F364: @ 805F6A4
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _0805F6C8
	ldr r3, _0805F6CC
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _0805F6C4
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _0805F6D0
_0805F6C4:
	movs r0, 0
	b _0805F6F8
	.align 2, 0
_0805F6C8: .4byte gMapObjects
_0805F6CC: .4byte gPlayerAvatar
_0805F6D0:
	ldr r5, _0805F700
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	movs r3, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805F6F8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F700: .4byte gUnknown_08375594
	thumb_func_end sub_805F364

	thumb_func_start sub_805F3C4
sub_805F3C4: @ 805F704
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805F722
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805F722:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805F3C4

	thumb_func_start sub_805F3EC
sub_805F3EC: @ 805F72C
	movs r0, 0
	bx lr
	thumb_func_end sub_805F3EC

	thumb_func_start sub_805F3F0
sub_805F3F0: @ 805F730
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F774
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F774: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F3F0

	thumb_func_start sub_805F438
sub_805F438: @ 805F778
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F82C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F7FE
	mov r1, r8
	cmp r1, 0
	beq _0805F812
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F812
_0805F7FE:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F812:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F82C: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F438

	thumb_func_start sub_805F4F0
sub_805F4F0: @ 805F830
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F8E4
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8060744
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F8B6
	mov r1, r8
	cmp r1, 0
	beq _0805F8CA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F8CA
_0805F8B6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F8CA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F8E4: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F4F0

	thumb_func_start sub_805F5A8
sub_805F5A8: @ 805F8E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F99C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_806079C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F96E
	mov r1, r8
	cmp r1, 0
	beq _0805F982
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F982
_0805F96E:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F982:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F99C: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F5A8

	thumb_func_start sub_805F660
sub_805F660: @ 805F9A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805FA54
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80607C8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805FA26
	mov r1, r8
	cmp r1, 0
	beq _0805FA3A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805FA3A
_0805FA26:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805FA3A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805FA54: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F660

	thumb_func_start cph_IM_DIFFERENT
cph_IM_DIFFERENT: @ 805FA58
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805FA9C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_806084C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805FA9C: .4byte gUnknown_0836DC09
	thumb_func_end cph_IM_DIFFERENT

	thumb_func_start sub_805F760
sub_805F760: @ 805FAA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805FB54
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80608A4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805FB26
	mov r1, r8
	cmp r1, 0
	beq _0805FB3A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805FB3A
_0805FB26:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805FB3A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805FB54: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F760

	thumb_func_start oac_hopping
oac_hopping: @ 805FB58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805FC1C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	movs r3, 0x2
	bl sub_8060320
	adds r0, r6, 0
	bl GetJumpLedgeAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805FBEC
	mov r1, r8
	cmp r1, 0
	beq _0805FC00
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805FC00
_0805FBEC:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805FC00:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805FC1C: .4byte gUnknown_0836DC09
	thumb_func_end oac_hopping

	thumb_func_start sub_805F8E0
sub_805F8E0: @ 805FC20
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FC3C
	adds r0, r2
	ldr r2, _0805FC40
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FC3C: .4byte gMapObjects
_0805FC40: .4byte sub_805F904
	thumb_func_end sub_805F8E0

	thumb_func_start sub_805F904
sub_805F904: @ 805FC44
	push {r4,lr}
	ldr r3, _0805FC60
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FC60: .4byte gUnknown_083755C0
	thumb_func_end sub_805F904

	thumb_func_start mss_08062EA4
mss_08062EA4: @ 805FC64
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _0805FC88
	ldr r3, _0805FC8C
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _0805FC84
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _0805FC90
_0805FC84:
	movs r0, 0
	b _0805FCB8
	.align 2, 0
_0805FC88: .4byte gMapObjects
_0805FC8C: .4byte gPlayerAvatar
_0805FC90:
	ldr r5, _0805FCC0
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0805FCC4
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805FCB8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805FCC0: .4byte gUnknown_08375594
_0805FCC4: .4byte sub_8056E14
	thumb_func_end mss_08062EA4

	thumb_func_start FieldObjectCB_TreeDisguise
FieldObjectCB_TreeDisguise: @ 805FCC8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805FD2C
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805FCF0
	cmp r0, 0x1
	bne _0805FD10
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805FD10
_0805FCF0:
	ldr r1, _0805FD30
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1C
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_0805FD10:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805FD2C
	adds r0, r1
	ldr r2, _0805FD34
	adds r1, r5, 0
	bl meta_step
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FD2C: .4byte gMapObjects
_0805FD30: .4byte gUnknown_0202FF84
_0805FD34: .4byte sub_805F9F8
	thumb_func_end FieldObjectCB_TreeDisguise

	thumb_func_start sub_805F9F8
sub_805F9F8: @ 805FD38
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805F9F8

	thumb_func_start FieldObjectCB_MountainDisguise
FieldObjectCB_MountainDisguise: @ 805FD44
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805FDA8
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805FD6C
	cmp r0, 0x1
	bne _0805FD8C
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805FD8C
_0805FD6C:
	ldr r1, _0805FDAC
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1D
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_0805FD8C:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805FDA8
	adds r0, r1
	ldr r2, _0805FDB0
	adds r1, r5, 0
	bl meta_step
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FDA8: .4byte gMapObjects
_0805FDAC: .4byte gUnknown_0202FF84
_0805FDB0: .4byte sub_805F9F8
	thumb_func_end FieldObjectCB_MountainDisguise

	thumb_func_start FieldObjectCB_Hidden1
FieldObjectCB_Hidden1: @ 805FDB4
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	ldr r4, _0805FE10
	cmp r0, 0
	bne _0805FDF4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x3]
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
_0805FDF4:
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r2, _0805FE14
	adds r1, r3, 0
	bl meta_step
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FE10: .4byte gMapObjects
_0805FE14: .4byte sub_805FAD8
	thumb_func_end FieldObjectCB_Hidden1

	thumb_func_start sub_805FAD8
sub_805FAD8: @ 805FE18
	push {r4,lr}
	ldr r3, _0805FE34
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FE34: .4byte gUnknown_083755CC
	thumb_func_end sub_805FAD8

	thumb_func_start sub_805FAF8
sub_805FAF8: @ 805FE38
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805FAF8

	thumb_func_start sub_805FB04
sub_805FB04: @ 805FE44
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805FE56
	movs r0, 0
	strh r0, [r4, 0x30]
_0805FE56:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805FB04

	thumb_func_start sub_805FB20
sub_805FB20: @ 805FE60
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FE7C
	adds r0, r2
	ldr r2, _0805FE80
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FE7C: .4byte gMapObjects
_0805FE80: .4byte sub_805FB44
	thumb_func_end sub_805FB20

	thumb_func_start sub_805FB44
sub_805FB44: @ 805FE84
	push {r4,lr}
	ldr r3, _0805FEA0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FEA0: .4byte gUnknown_083755D0
	thumb_func_end sub_805FB44

	thumb_func_start sub_805FB64
sub_805FB64: @ 805FEA4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FB64

	thumb_func_start sub_805FB90
sub_805FB90: @ 805FED0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FEEC
	adds r0, r2
	ldr r2, _0805FEF0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FEEC: .4byte gMapObjects
_0805FEF0: .4byte sub_805FBB4
	thumb_func_end sub_805FB90

	thumb_func_start sub_805FBB4
sub_805FBB4: @ 805FEF4
	push {r4,lr}
	ldr r3, _0805FF10
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FF10: .4byte gUnknown_083755D8
	thumb_func_end sub_805FBB4

	thumb_func_start sub_805FBD4
sub_805FBD4: @ 805FF14
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay8AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FBD4

	thumb_func_start sub_805FC00
sub_805FC00: @ 805FF40
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FF5C
	adds r0, r2
	ldr r2, _0805FF60
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FF5C: .4byte gMapObjects
_0805FF60: .4byte sub_805FC24
	thumb_func_end sub_805FC00

	thumb_func_start sub_805FC24
sub_805FC24: @ 805FF64
	push {r4,lr}
	ldr r3, _0805FF80
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FF80: .4byte gUnknown_083755E0
	thumb_func_end sub_805FC24

	thumb_func_start sub_805FC44
sub_805FC44: @ 805FF84
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FC44

	thumb_func_start sub_805FC70
sub_805FC70: @ 805FFB0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FFCC
	adds r0, r2
	ldr r2, _0805FFD0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FFCC: .4byte gMapObjects
_0805FFD0: .4byte sub_805FC94
	thumb_func_end sub_805FC70

	thumb_func_start sub_805FC94
sub_805FC94: @ 805FFD4
	push {r4,lr}
	ldr r3, _0805FFF0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FFF0: .4byte gUnknown_083755E8
	thumb_func_end sub_805FC94

	thumb_func_start sub_805FCB4
sub_805FCB4: @ 805FFF4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FCB4

	thumb_func_start sub_805FCE8
sub_805FCE8: @ 8060028
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0806003A
	movs r0, 0
	b _08060040
_0806003A:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_08060040:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805FCE8

	thumb_func_start sub_805FD08
sub_805FD08: @ 8060048
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_805FD08

	thumb_func_start npc_reset
npc_reset: @ 8060058
	ldrb r3, [r0]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	movs r3, 0x41
	negs r3, r3
	ands r2, r3
	movs r3, 0x7F
	ands r2, r3
	strb r2, [r0]
	movs r2, 0xFF
	strb r2, [r0, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x30]
	bx lr
	thumb_func_end npc_reset

	thumb_func_start FieldObjectDirectionToImageAnimId
FieldObjectDirectionToImageAnimId: @ 8060078
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060084
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060084: .4byte gUnknown_083755F4
	thumb_func_end FieldObjectDirectionToImageAnimId

	thumb_func_start get_go_image_anim_num
get_go_image_anim_num: @ 8060088
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060094
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060094: .4byte gUnknown_083755FD
	thumb_func_end get_go_image_anim_num

	thumb_func_start get_go_fast_image_anim_num
get_go_fast_image_anim_num: @ 8060098
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080600A4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080600A4: .4byte gUnknown_08375606
	thumb_func_end get_go_fast_image_anim_num

	thumb_func_start get_go_faster_image_anim_num
get_go_faster_image_anim_num: @ 80600A8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080600B4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080600B4: .4byte gUnknown_0837560F
	thumb_func_end get_go_faster_image_anim_num

	thumb_func_start sub_805FD78
sub_805FD78: @ 80600B8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080600C4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080600C4: .4byte gUnknown_08375618
	thumb_func_end sub_805FD78

	thumb_func_start sub_805FD88
sub_805FD88: @ 80600C8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080600D4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080600D4: .4byte gUnknown_08375621
	thumb_func_end sub_805FD88

	thumb_func_start sub_805FD98
sub_805FD98: @ 80600D8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080600E4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080600E4: .4byte gUnknown_0837562A
	thumb_func_end sub_805FD98

	thumb_func_start unref_sub_805FDA8
unref_sub_805FDA8: @ 80600E8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080600F4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080600F4: .4byte gUnknown_08375633
	thumb_func_end unref_sub_805FDA8

	thumb_func_start sub_805FDB8
sub_805FDB8: @ 80600F8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060104
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060104: .4byte gUnknown_0837563C
	thumb_func_end sub_805FDB8

	thumb_func_start sub_805FDC8
sub_805FDC8: @ 8060108
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060114
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060114: .4byte gUnknown_08375645
	thumb_func_end sub_805FDC8

	thumb_func_start sub_805FDD8
sub_805FDD8: @ 8060118
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060124
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060124: .4byte gUnknown_0837564E
	thumb_func_end sub_805FDD8

	thumb_func_start sub_805FDE8
sub_805FDE8: @ 8060128
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060134
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060134: .4byte gUnknown_08375657
	thumb_func_end sub_805FDE8

	thumb_func_start sub_805FDF8
sub_805FDF8: @ 8060138
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060144
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060144: .4byte gUnknown_08375660
	thumb_func_end sub_805FDF8

	thumb_func_start sub_805FE08
sub_805FE08: @ 8060148
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060154
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060154: .4byte gUnknown_08375669
	thumb_func_end sub_805FE08

	thumb_func_start get_run_image_anim_num
get_run_image_anim_num: @ 8060158
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08060164
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08060164: .4byte gUnknown_08375672
	thumb_func_end get_run_image_anim_num

	thumb_func_start sub_805FE28
sub_805FE28: @ 8060168
	push {r4,lr}
	adds r3, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r4, r0, 31
	cmp r4, 0
	bne _0806019E
	adds r0, r3, 0
	adds r0, 0x2A
	strb r2, [r0]
	adds r0, 0x1
	ldrb r2, [r0]
	adds r1, r0, 0
	cmp r2, 0x1
	bne _08060190
	movs r0, 0x2
	strb r0, [r1]
	b _08060196
_08060190:
	cmp r2, 0x3
	bne _08060196
	strb r4, [r1]
_08060196:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl SeekSpriteAnim
_0806019E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805FE28

	thumb_func_start sub_805FE64
sub_805FE64: @ 80601A4
	push {lr}
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _080601CC
	adds r0, r1, 0
	adds r0, 0x2A
	strb r2, [r0]
	movs r2, 0x3
	adds r0, 0x1
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _080601C4
	movs r2, 0x1
_080601C4:
	adds r0, r1, 0
	adds r1, r2, 0
	bl SeekSpriteAnim
_080601CC:
	pop {r0}
	bx r0
	thumb_func_end sub_805FE64

	thumb_func_start sub_805FE90
sub_805FE90: @ 80601D0
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	ble _080601EA
	movs r0, 0x3
	b _08060200
_080601EA:
	cmp r0, r2
	bge _080601F2
	movs r0, 0x4
	b _08060200
_080601F2:
	lsls r1, 16
	lsls r0, r3, 16
	cmp r1, r0
	bgt _080601FE
	movs r0, 0x1
	b _08060200
_080601FE:
	movs r0, 0x2
_08060200:
	pop {r1}
	bx r1
	thumb_func_end sub_805FE90

	thumb_func_start npc_set_running_behaviour_etc
npc_set_running_behaviour_etc: @ 8060204
	push {r4,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	strb r1, [r0, 0x6]
	adds r0, 0x21
	strb r3, [r0]
	adds r0, 0x1
	strb r3, [r0]
	ldr r4, _08060248
	mov r0, r12
	ldrb r2, [r0, 0x4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r2
	ldr r2, _0806024C
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, r12
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060248: .4byte gSprites
_0806024C: .4byte gUnknown_0836DA88
	thumb_func_end npc_set_running_behaviour_etc

	thumb_func_start npc_running_behaviour_by_direction
npc_running_behaviour_by_direction: @ 8060250
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0806025C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0806025C: .4byte gUnknown_0837567B
	thumb_func_end npc_running_behaviour_by_direction

	thumb_func_start sub_805FF20
sub_805FF20: @ 8060260
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	adds r3, r5, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805FF20

	thumb_func_start npc_block_way
npc_block_way: @ 80602A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	mov r8, r7
	lsrs r0, r1, 16
	mov r9, r0
	asrs r5, r1, 16
	lsrs r0, r2, 16
	mov r10, r0
	asrs r4, r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl IsCoordOutsideFieldObjectMovementRect
	lsls r0, 24
	cmp r0, 0
	beq _080602D6
	movs r0, 0x1
	b _08060356
_080602D6:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	bne _08060318
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _08060318
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl IsMetatileDirectionallyImpassable
	lsls r0, 24
	cmp r0, 0
	bne _08060318
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0806031C
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, 0
	bne _0806031C
_08060318:
	movs r0, 0x2
	b _08060356
_0806031C:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	mov r2, r9
	lsls r1, r2, 16
	asrs r5, r1, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r4, r1, 16
	adds r1, r5, 0
	adds r2, r4, 0
	bl IsZCoordMismatchAt
	lsls r0, 24
	cmp r0, 0
	beq _08060340
	movs r0, 0x3
	b _08060356
_08060340:
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CheckForCollisionBetweenFieldObjects
	lsls r0, 24
	cmp r0, 0
	bne _08060354
	movs r0, 0
	b _08060356
_08060354:
	movs r0, 0x4
_08060356:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end npc_block_way

	thumb_func_start sub_8060024
sub_8060024: @ 8060364
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsrs r0, r1, 16
	mov r9, r0
	asrs r6, r1, 16
	lsrs r0, r2, 16
	mov r10, r0
	asrs r5, r2, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl IsCoordOutsideFieldObjectMovementRect
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r4, r1, 31
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	bne _080603DC
	adds r0, r6, 0
	adds r1, r5, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080603DC
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	mov r3, r8
	bl IsMetatileDirectionallyImpassable
	lsls r0, 24
	cmp r0, 0
	bne _080603DC
	ldrb r0, [r7, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _080603E0
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, 0
	bne _080603E0
_080603DC:
	movs r0, 0x2
	orrs r4, r0
_080603E0:
	ldrb r0, [r7, 0xB]
	lsls r0, 28
	lsrs r0, 28
	mov r2, r9
	lsls r1, r2, 16
	asrs r6, r1, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r5, r1, 16
	adds r1, r6, 0
	adds r2, r5, 0
	bl IsZCoordMismatchAt
	lsls r0, 24
	cmp r0, 0
	beq _08060408
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08060408:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl CheckForCollisionBetweenFieldObjects
	lsls r0, 24
	cmp r0, 0
	beq _08060420
	movs r0, 0x8
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_08060420:
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8060024

	thumb_func_start IsCoordOutsideFieldObjectMovementRect
IsCoordOutsideFieldObjectMovementRect: @ 8060430
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	ldrb r1, [r4, 0x19]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08060468
	lsls r1, 28
	lsrs r2, r1, 28
	ldrh r0, [r4, 0xC]
	subs r2, r0, r2
	lsrs r1, 28
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r2, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r2, r0
	bgt _08060494
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r3
	blt _08060494
_08060468:
	ldrb r1, [r4, 0x19]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08060498
	lsls r1, 24
	lsrs r2, r1, 28
	ldrh r0, [r4, 0xE]
	subs r2, r0, r2
	lsrs r1, 28
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r2, 16
	lsls r0, r5, 16
	asrs r3, r0, 16
	cmp r2, r0
	bgt _08060494
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r3
	bge _08060498
_08060494:
	movs r0, 0x1
	b _0806049A
_08060498:
	movs r0, 0
_0806049A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsCoordOutsideFieldObjectMovementRect

	thumb_func_start IsMetatileDirectionallyImpassable
IsMetatileDirectionallyImpassable: @ 80604A0
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 24
	ldr r1, _080604E8
	lsrs r3, 22
	subs r5, r3, 0x4
	adds r1, r5, r1
	ldrb r0, [r0, 0x1E]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080604E2
	ldr r4, _080604EC
	adds r4, r5, r4
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _080604F0
_080604E2:
	movs r0, 0x1
	b _080604F2
	.align 2, 0
_080604E8: .4byte gUnknown_08375684
_080604EC: .4byte gUnknown_08375694
_080604F0:
	movs r0, 0
_080604F2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end IsMetatileDirectionallyImpassable

	thumb_func_start CheckForCollisionBetweenFieldObjects
CheckForCollisionBetweenFieldObjects: @ 80604F8
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r4, 0
	lsls r2, 16
	asrs r5, r2, 16
_08060506:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806055C
	adds r2, r0, r1
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _08060560
	cmp r2, r6
	beq _08060560
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r3, r0, 16
	cmp r1, r3
	bne _08060530
	movs r1, 0x12
	ldrsh r0, [r2, r1]
	cmp r0, r5
	beq _08060540
_08060530:
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _08060560
	movs r1, 0x16
	ldrsh r0, [r2, r1]
	cmp r0, r5
	bne _08060560
_08060540:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r2, 0xB]
	lsls r1, 28
	lsrs r1, 28
	bl AreZCoordsCompatible
	lsls r0, 24
	cmp r0, 0
	beq _08060560
	movs r0, 0x1
	b _0806056C
	.align 2, 0
_0806055C: .4byte gMapObjects
_08060560:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08060506
	movs r0, 0
_0806056C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForCollisionBetweenFieldObjects

	thumb_func_start sub_8060234
sub_8060234: @ 8060574
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080605C0
	ldr r3, _080605B8
	ldr r2, _080605BC
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
	ldrh r1, [r0, 0x3C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080605C0
	movs r0, 0x1
	b _080605C2
	.align 2, 0
_080605B8: .4byte gSprites
_080605BC: .4byte gMapObjects
_080605C0:
	movs r0, 0
_080605C2:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_8060234

	thumb_func_start sub_8060288
sub_8060288: @ 80605C8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08060606
	ldr r3, _0806060C
	ldr r2, _08060610
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x3C]
	movs r0, 0x4
	orrs r0, r2
	strh r0, [r1, 0x3C]
_08060606:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0806060C: .4byte gSprites
_08060610: .4byte gMapObjects
	thumb_func_end sub_8060288

	thumb_func_start MoveCoords
MoveCoords: @ 8060614
	push {r4,lr}
	lsls r0, 24
	ldr r3, _08060634
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060634: .4byte gDirectionToVector
	thumb_func_end MoveCoords

	thumb_func_start unref_sub_80602F8
unref_sub_80602F8: @ 8060638
	push {r4,lr}
	lsls r0, 24
	ldr r3, _0806065C
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	lsls r3, 4
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	lsls r0, 4
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806065C: .4byte gDirectionToVector
	thumb_func_end unref_sub_80602F8

	thumb_func_start sub_8060320
sub_8060320: @ 8060660
	push {r4-r7,lr}
	adds r4, r1, 0
	ldr r1, [sp, 0x14]
	lsls r0, 24
	lsls r3, 16
	lsrs r3, 16
	adds r7, r3, 0
	lsls r1, 16
	lsrs r6, r1, 16
	mov r12, r6
	ldr r1, _080606C4
	lsrs r0, 22
	adds r5, r0, r1
	movs r0, 0
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _0806068C
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r4]
	adds r0, r3
	strh r0, [r4]
_0806068C:
	cmp r1, 0
	bge _0806069A
	ldrh r1, [r4]
	lsls r0, r7, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4]
_0806069A:
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _080606AC
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r3, [r2]
	adds r0, r3
	strh r0, [r2]
_080606AC:
	cmp r1, 0
	bge _080606BC
	ldrh r1, [r2]
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2]
_080606BC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080606C4: .4byte gDirectionToVector
	thumb_func_end sub_8060320

	thumb_func_start sub_8060388
sub_8060388: @ 80606C8
	push {r4,r5,lr}
	ldr r5, _08060700
	ldrh r4, [r5]
	lsls r0, 16
	asrs r0, 16
	subs r0, r4
	lsls r0, 4
	strh r0, [r2]
	ldrh r0, [r5, 0x2]
	lsls r1, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 4
	strh r1, [r3]
	ldr r1, _08060704
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r1, _08060708
	ldrh r0, [r3]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060700: .4byte gSaveBlock1
_08060704: .4byte gUnknown_0300489C
_08060708: .4byte gUnknown_03004898
	thumb_func_end sub_8060388

	thumb_func_start sub_80603CC
sub_80603CC: @ 806070C
	push {r4-r7,lr}
	adds r7, r2, 0
	mov r12, r3
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0806079C
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, _080607A0
	ldr r2, [r1, 0x10]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080607A4
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, [r1, 0x14]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r2, 0
	ble _08060746
	lsls r0, r3, 16
	movs r3, 0x80
	lsls r3, 13
	adds r0, r3
	lsrs r3, r0, 16
_08060746:
	cmp r2, 0
	bge _08060752
	lsls r0, r3, 16
	ldr r2, _080607A8
	adds r0, r2
	lsrs r3, r0, 16
_08060752:
	cmp r1, 0
	ble _08060760
	lsls r0, r4, 16
	movs r2, 0x80
	lsls r2, 13
	adds r0, r2
	lsrs r4, r0, 16
_08060760:
	cmp r1, 0
	bge _0806076C
	lsls r0, r4, 16
	ldr r1, _080607A8
	adds r0, r1
	lsrs r4, r0, 16
_0806076C:
	ldr r2, _080607AC
	ldrh r1, [r2]
	lsls r0, r5, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r0
	strh r1, [r7]
	ldrh r1, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r4, 16
	asrs r1, 16
	adds r1, r0
	mov r2, r12
	strh r1, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806079C: .4byte gUnknown_0300489C
_080607A0: .4byte gUnknown_03004880
_080607A4: .4byte gUnknown_03004898
_080607A8: .4byte 0xfff00000
_080607AC: .4byte gSaveBlock1
	thumb_func_end sub_80603CC

	thumb_func_start sub_8060470
sub_8060470: @ 80607B0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r6, 0
	mov r3, r8
	bl sub_80603CC
	lsls r4, 16
	asrs r4, 16
	ldrh r0, [r6]
	adds r4, r0
	strh r4, [r6]
	lsls r5, 16
	asrs r5, 16
	mov r1, r8
	ldrh r1, [r1]
	adds r5, r1
	mov r2, r8
	strh r5, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060470

	thumb_func_start GetFieldObjectMovingCameraOffset
GetFieldObjectMovingCameraOffset: @ 80607FC
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2]
	strh r0, [r1]
	ldr r3, _08060838
	ldr r0, [r3, 0x10]
	cmp r0, 0
	ble _08060812
	movs r0, 0x1
	strh r0, [r2]
_08060812:
	ldr r0, [r3, 0x10]
	cmp r0, 0
	bge _0806081E
	ldrh r0, [r2]
	subs r0, 0x1
	strh r0, [r2]
_0806081E:
	ldr r2, [r3, 0x14]
	cmp r2, 0
	ble _0806082A
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0806082A:
	cmp r2, 0
	bge _08060834
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_08060834:
	pop {r0}
	bx r0
	.align 2, 0
_08060838: .4byte gUnknown_03004880
	thumb_func_end GetFieldObjectMovingCameraOffset

	thumb_func_start FieldObjectMoveDestCoords
FieldObjectMoveDestCoords: @ 806083C
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r0, 0x10]
	strh r4, [r2]
	ldrh r0, [r0, 0x12]
	strh r0, [r3]
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	bl MoveCoords
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectMoveDestCoords

	thumb_func_start FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive: @ 806085C
	push {lr}
	ldrb r1, [r0]
	movs r0, 0x42
	ands r0, r1
	cmp r0, 0
	bne _0806086C
	movs r0, 0
	b _0806086E
_0806086C:
	movs r0, 0x1
_0806086E:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive

	thumb_func_start FieldObjectIsSpecialAnimActive
FieldObjectIsSpecialAnimActive: @ 8060874
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _0806088A
	ldrb r0, [r1, 0x1C]
	cmp r0, 0xFF
	beq _0806088A
	movs r0, 0x1
	b _0806088C
_0806088A:
	movs r0, 0
_0806088C:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimActive

	thumb_func_start FieldObjectSetSpecialAnim
FieldObjectSetSpecialAnim: @ 8060890
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _080608D0
	adds r0, r4, 0
	bl npc_sync_anim_pause_bits
	strb r5, [r4, 0x1C]
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r4]
	ldr r2, _080608CC
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x32]
	movs r0, 0
	b _080608D2
	.align 2, 0
_080608CC: .4byte gSprites
_080608D0:
	movs r0, 0x1
_080608D2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectSetSpecialAnim

	thumb_func_start FieldObjectForceSetSpecialAnim
FieldObjectForceSetSpecialAnim: @ 80608D8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldObjectClearAnimIfSpecialAnimActive
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetSpecialAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectForceSetSpecialAnim

	thumb_func_start FieldObjectClearAnimIfSpecialAnimActive
FieldObjectClearAnimIfSpecialAnimActive: @ 80608F4
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _08060906
	adds r0, r1, 0
	bl FieldObjectClearAnim
_08060906:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectClearAnimIfSpecialAnimActive

	thumb_func_start FieldObjectClearAnim
FieldObjectClearAnim: @ 806090C
	movs r1, 0xFF
	strb r1, [r0, 0x1C]
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	movs r2, 0x7F
	ands r1, r2
	strb r1, [r0]
	ldr r3, _0806093C
	ldrb r2, [r0, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	movs r2, 0
	strh r2, [r1, 0x30]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x32]
	bx lr
	.align 2, 0
_0806093C: .4byte gSprites
	thumb_func_end FieldObjectClearAnim

	thumb_func_start FieldObjectCheckIfSpecialAnimFinishedOrInactive
FieldObjectCheckIfSpecialAnimFinishedOrInactive: @ 8060940
	push {lr}
	ldrb r1, [r0]
	lsls r0, r1, 25
	cmp r0, 0
	blt _0806094E
	movs r0, 0x10
	b _08060950
_0806094E:
	lsrs r0, r1, 7
_08060950:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectCheckIfSpecialAnimFinishedOrInactive

	thumb_func_start FieldObjectClearAnimIfSpecialAnimFinished
FieldObjectClearAnimIfSpecialAnimFinished: @ 8060954
	push {r4,r5,lr}
	adds r5, r0, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0806096E
	cmp r4, 0x10
	beq _0806096E
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
_0806096E:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectClearAnimIfSpecialAnimFinished

	thumb_func_start FieldObjectGetSpecialAnim
FieldObjectGetSpecialAnim: @ 8060978
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08060988
	movs r0, 0xFF
	b _0806098A
_08060988:
	ldrb r0, [r1, 0x1C]
_0806098A:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectGetSpecialAnim

	thumb_func_start meta_step
meta_step: @ 8060990
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl DoGroundEffects_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80634A0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080609BA
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectExecSpecialAnim
	b _080609D0
_080609BA:
	ldrb r0, [r4, 0x1]
	lsls r0, 31
	cmp r0, 0
	bne _080609D0
_080609C2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r6
	lsls r0, 24
	cmp r0, 0
	bne _080609C2
_080609D0:
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_obj_transfer_image_anim_pause_flag
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80634D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectUpdateSubpriority
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end meta_step

	thumb_func_start GetFaceDirectionAnimId
GetFaceDirectionAnimId: @ 8060A00
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A28
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A18
	movs r4, 0
_08060A18:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A28: .4byte gUnknown_083756C8
	thumb_func_end GetFaceDirectionAnimId

	thumb_func_start GetSimpleGoAnimId
GetSimpleGoAnimId: @ 8060A2C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A54
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A44
	movs r4, 0
_08060A44:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A54: .4byte gUnknown_083756CD
	thumb_func_end GetSimpleGoAnimId

	thumb_func_start GetGoSpeed0AnimId
GetGoSpeed0AnimId: @ 8060A58
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A80
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A70
	movs r4, 0
_08060A70:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A80: .4byte gUnknown_083756D2
	thumb_func_end GetGoSpeed0AnimId

	thumb_func_start sub_8060744
sub_8060744: @ 8060A84
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060AAC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A9C
	movs r4, 0
_08060A9C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060AAC: .4byte gUnknown_083756D7
	thumb_func_end sub_8060744

	thumb_func_start d2s_08064034
d2s_08064034: @ 8060AB0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060AD8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060AC8
	movs r4, 0
_08060AC8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060AD8: .4byte gUnknown_083756DC
	thumb_func_end d2s_08064034

	thumb_func_start sub_806079C
sub_806079C: @ 8060ADC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B04
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060AF4
	movs r4, 0
_08060AF4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B04: .4byte gUnknown_083756E1
	thumb_func_end sub_806079C

	thumb_func_start sub_80607C8
sub_80607C8: @ 8060B08
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B30
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B20
	movs r4, 0
_08060B20:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B30: .4byte gUnknown_083756E6
	thumb_func_end sub_80607C8

	thumb_func_start sub_80607F4
sub_80607F4: @ 8060B34
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B5C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B4C
	movs r4, 0
_08060B4C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B5C: .4byte gUnknown_083756EB
	thumb_func_end sub_80607F4

	thumb_func_start GetJumpLedgeAnimId
GetJumpLedgeAnimId: @ 8060B60
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B88
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B78
	movs r4, 0
_08060B78:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B88: .4byte gUnknown_083756F0
	thumb_func_end GetJumpLedgeAnimId

	thumb_func_start sub_806084C
sub_806084C: @ 8060B8C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060BB4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060BA4
	movs r4, 0
_08060BA4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060BB4: .4byte gUnknown_083756F5
	thumb_func_end sub_806084C

	thumb_func_start sub_8060878
sub_8060878: @ 8060BB8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060BE0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060BD0
	movs r4, 0
_08060BD0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060BE0: .4byte gUnknown_083756FA
	thumb_func_end sub_8060878

	thumb_func_start sub_80608A4
sub_80608A4: @ 8060BE4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060C0C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060BFC
	movs r4, 0
_08060BFC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060C0C: .4byte gUnknown_083756FF
	thumb_func_end sub_80608A4

	thumb_func_start sub_80608D0
sub_80608D0: @ 8060C10
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060C38
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060C28
	movs r4, 0
_08060C28:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060C38: .4byte gUnknown_08375704
	thumb_func_end sub_80608D0

	thumb_func_start GetStepInPlaceDelay32AnimId
GetStepInPlaceDelay32AnimId: @ 8060C3C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060C64
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060C54
	movs r4, 0
_08060C54:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060C64: .4byte gUnknown_08375709
	thumb_func_end GetStepInPlaceDelay32AnimId

	thumb_func_start GetStepInPlaceDelay16AnimId
GetStepInPlaceDelay16AnimId: @ 8060C68
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060C90
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060C80
	movs r4, 0
_08060C80:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060C90: .4byte gUnknown_0837570E
	thumb_func_end GetStepInPlaceDelay16AnimId

	thumb_func_start GetStepInPlaceDelay8AnimId
GetStepInPlaceDelay8AnimId: @ 8060C94
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060CBC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060CAC
	movs r4, 0
_08060CAC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060CBC: .4byte gUnknown_08375713
	thumb_func_end GetStepInPlaceDelay8AnimId

	thumb_func_start GetStepInPlaceDelay4AnimId
GetStepInPlaceDelay4AnimId: @ 8060CC0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060CE8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060CD8
	movs r4, 0
_08060CD8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060CE8: .4byte gUnknown_08375718
	thumb_func_end GetStepInPlaceDelay4AnimId

	thumb_func_start FieldObjectFaceOppositeDirection
FieldObjectFaceOppositeDirection: @ 8060CEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectFaceOppositeDirection

	thumb_func_start sub_80609D8
sub_80609D8: @ 8060D18
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060D40
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060D30
	movs r4, 0
_08060D30:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060D40: .4byte gUnknown_0837571D
	thumb_func_end sub_80609D8

	thumb_func_start sub_8060A04
sub_8060A04: @ 8060D44
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060D6C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060D5C
	movs r4, 0
_08060D5C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060D6C: .4byte gUnknown_08375722
	thumb_func_end sub_8060A04

	thumb_func_start sub_8060A30
sub_8060A30: @ 8060D70
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060D98
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060D88
	movs r4, 0
_08060D88:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060D98: .4byte gUnknown_08375727
	thumb_func_end sub_8060A30

	thumb_func_start sub_8060A5C
sub_8060A5C: @ 8060D9C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060DC4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060DB4
	movs r4, 0
_08060DB4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060DC4: .4byte gUnknown_0837572C
	thumb_func_end sub_8060A5C

	thumb_func_start sub_8060A88
sub_8060A88: @ 8060DC8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060DF0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060DE0
	movs r4, 0
_08060DE0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060DF0: .4byte gUnknown_08375731
	thumb_func_end sub_8060A88

	thumb_func_start sub_8060AB4
sub_8060AB4: @ 8060DF4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060E1C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060E0C
	movs r4, 0
_08060E0C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060E1C: .4byte gUnknown_08375736
	thumb_func_end sub_8060AB4

	thumb_func_start sub_8060AE0
sub_8060AE0: @ 8060E20
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060E48
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060E38
	movs r4, 0
_08060E38:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060E48: .4byte gUnknown_0837573B
	thumb_func_end sub_8060AE0

	thumb_func_start sub_8060B0C
sub_8060B0C: @ 8060E4C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060E74
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060E64
	movs r4, 0
_08060E64:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060E74: .4byte gUnknown_08375740
	thumb_func_end sub_8060B0C

	thumb_func_start sub_8060B38
sub_8060B38: @ 8060E78
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060EA0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060E90
	movs r4, 0
_08060E90:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060EA0: .4byte gUnknown_08375745
	thumb_func_end sub_8060B38

	thumb_func_start sub_8060B64
sub_8060B64: @ 8060EA4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060ECC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060EBC
	movs r4, 0
_08060EBC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060ECC: .4byte gUnknown_0837574A
	thumb_func_end sub_8060B64

	thumb_func_start GetOppositeDirection
GetOppositeDirection: @ 8060ED0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060EF4
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	subs r1, r4, 0x1
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _08060EF8
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	b _08060EFA
	.align 2, 0
_08060EF4: .4byte gUnknown_0837574F
_08060EF8:
	adds r0, r4, 0
_08060EFA:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetOppositeDirection

	thumb_func_start zffu_offset_calc
zffu_offset_calc: @ 8060F04
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08060F18
	lsrs r0, 22
	subs r0, 0x5
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08060F18: .4byte gUnknown_08375757
	thumb_func_end zffu_offset_calc

	thumb_func_start state_to_direction
state_to_direction: @ 8060F1C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _08060F3C
	cmp r2, 0
	beq _08060F3C
	cmp r1, 0x4
	bhi _08060F3C
	cmp r2, 0x4
	bls _08060F40
_08060F3C:
	movs r0, 0
	b _08060F52
_08060F40:
	adds r1, r2, 0
	bl zffu_offset_calc
	ldr r2, _08060F58
	lsls r1, r4, 2
	subs r1, 0x5
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
_08060F52:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060F58: .4byte gUnknown_08375767
	thumb_func_end state_to_direction

	thumb_func_start FieldObjectExecSpecialAnim
FieldObjectExecSpecialAnim: @ 8060F5C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08060F90
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r2
	movs r3, 0x32
	ldrsh r2, [r1, r3]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	beq _08060F88
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08060F88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060F90: .4byte gUnknown_08375778
	thumb_func_end FieldObjectExecSpecialAnim

	thumb_func_start FieldObjectExecRegularAnim
FieldObjectExecRegularAnim: @ 8060F94
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060FC0
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08060FC4
	movs r0, 0
	b _08060FCE
	.align 2, 0
_08060FC0: .4byte gUnknown_08375778
_08060FC4:
	movs r0, 0xFF
	strb r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08060FCE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectExecRegularAnim

	thumb_func_start FieldObjectSetRegularAnim
FieldObjectSetRegularAnim: @ 8060FD4
	movs r3, 0
	strb r2, [r0, 0x1C]
	strh r3, [r1, 0x32]
	bx lr
	thumb_func_end FieldObjectSetRegularAnim

	thumb_func_start an_look_any
an_look_any: @ 8060FDC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE64
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end an_look_any

	thumb_func_start sub_8060CE0
sub_8060CE0: @ 8061020
	push {lr}
	movs r2, 0x1
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060CE0

	thumb_func_start sub_8060CF0
sub_8060CF0: @ 8061030
	push {lr}
	movs r2, 0x2
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060CF0

	thumb_func_start sub_8060D00
sub_8060D00: @ 8061040
	push {lr}
	movs r2, 0x3
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060D00

	thumb_func_start sub_8060D10
sub_8060D10: @ 8061050
	push {lr}
	movs r2, 0x4
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060D10

	thumb_func_start sub_8060D20
sub_8060D20: @ 8061060
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	mov r1, r8
	ldrh r0, [r1, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	mov r0, r8
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	mov r0, r8
	bl npc_coords_shift
	mov r0, r9
	adds r1, r4, 0
	adds r2, r6, 0
	bl oamt_npc_ministep_reset
	mov r2, r9
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, 0x1
	mov r1, r9
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060D20

	thumb_func_start do_go_anim
do_go_anim: @ 80610E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r5, r0, 0
	mov r8, r1
	adds r4, r3, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 24
	lsrs r4, 24
	mov r1, sp
	ldr r0, _0806113C
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6}
	stm r1!, {r3,r6}
	adds r0, r5, 0
	mov r1, r8
	adds r3, r4, 0
	bl sub_8060D20
	lsls r4, 2
	mov r7, sp
	adds r1, r7, r4
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, [r1]
	bl _call_via_r1
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	mov r1, r8
	bl sub_805FE28
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806113C: .4byte gUnknown_083759C0
	thumb_func_end do_go_anim

	thumb_func_start do_run_anim
do_run_anim: @ 8061140
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_run_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end do_run_anim

	thumb_func_start npc_obj_ministep_stop_on_arrival
npc_obj_ministep_stop_on_arrival: @ 8061170
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl obj_npc_ministep
	lsls r0, 24
	cmp r0, 0
	bne _08061186
	movs r0, 0
	b _080611A2
_08061186:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_080611A2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_obj_ministep_stop_on_arrival

	thumb_func_start sub_8060E68
sub_8060E68: @ 80611A8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_806467C
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060E68

	thumb_func_start sub_8060ED8
sub_8060ED8: @ 8061218
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_8060E68
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8060ED8

	thumb_func_start an_walk_any_2
an_walk_any_2: @ 8061244
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_806468C
	lsls r0, 24
	cmp r0, 0
	bne _0806125A
	movs r0, 0
	b _08061276
_0806125A:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08061276:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end an_walk_any_2

	thumb_func_start sub_8060F3C
sub_8060F3C: @ 806127C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060F5C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F3C

	thumb_func_start sub_8060F5C
sub_8060F5C: @ 806129C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _080612AE
	movs r0, 0
	b _080612B4
_080612AE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080612B4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F5C

	thumb_func_start sub_8060F7C
sub_8060F7C: @ 80612BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060F9C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F7C

	thumb_func_start sub_8060F9C
sub_8060F9C: @ 80612DC
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _080612EE
	movs r0, 0
	b _080612F4
_080612EE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080612F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F9C

	thumb_func_start sub_8060FBC
sub_8060FBC: @ 80612FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060FDC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FBC

	thumb_func_start sub_8060FDC
sub_8060FDC: @ 806131C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _0806132E
	movs r0, 0
	b _08061334
_0806132E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061334:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FDC

	thumb_func_start sub_8060FFC
sub_8060FFC: @ 806133C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806101C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FFC

	thumb_func_start sub_806101C
sub_806101C: @ 806135C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _0806136E
	movs r0, 0
	b _08061374
_0806136E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061374:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806101C

	thumb_func_start sub_806103C
sub_806103C: @ 806137C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806105C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806103C

	thumb_func_start sub_806105C
sub_806105C: @ 806139C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080613AE
	movs r0, 0
	b _080613B4
_080613AE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080613B4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806105C

	thumb_func_start sub_806107C
sub_806107C: @ 80613BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806109C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806107C

	thumb_func_start sub_806109C
sub_806109C: @ 80613DC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080613EE
	movs r0, 0
	b _080613F4
_080613EE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080613F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806109C

	thumb_func_start sub_80610BC
sub_80610BC: @ 80613FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80610DC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80610BC

	thumb_func_start sub_80610DC
sub_80610DC: @ 806141C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806142E
	movs r0, 0
	b _08061434
_0806142E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061434:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80610DC

	thumb_func_start sub_80610FC
sub_80610FC: @ 806143C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806111C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80610FC

	thumb_func_start sub_806111C
sub_806111C: @ 806145C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806146E
	movs r0, 0
	b _08061474
_0806146E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061474:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806111C

	thumb_func_start sub_806113C
sub_806113C: @ 806147C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	mov r10, r1
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x30]
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _08061534
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0xC
	movs r0, 0
	strh r0, [r5]
	mov r6, sp
	adds r6, 0xE
	strh r0, [r6]
	adds r0, r7, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	mov r1, r8
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	str r3, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8060320
	ldrh r1, [r5]
	ldrh r0, [r7, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6]
	ldrh r0, [r7, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r7, 0
	bl npc_coords_shift
	mov r0, r10
	adds r1, r4, 0
	mov r2, r8
	mov r3, r9
	bl sub_80646E4
	movs r0, 0x1
	mov r1, r10
	strh r0, [r1, 0x32]
	movs r0, 0x2C
	add r10, r0
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r7]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061534: .4byte gUnknown_08375A34
	thumb_func_end sub_806113C

	thumb_func_start maybe_shadow_1
maybe_shadow_1: @ 8061538
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r4, 0
	bl sub_806113C
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	adds r0, r4, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end maybe_shadow_1

	thumb_func_start sub_806123C
sub_806123C: @ 806157C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r6, r0, 0
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r1, _08061608
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bne _0806160C
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsls r0, 1
	add r0, sp
	adds r0, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _0806160C
	add r4, sp, 0xC
	movs r0, 0
	strh r0, [r4]
	mov r5, sp
	adds r5, 0xE
	strh r0, [r5]
	ldrb r0, [r6, 0x18]
	lsrs r0, 4
	movs r2, 0x36
	ldrsh r1, [r7, r2]
	lsls r1, 1
	add r1, sp
	adds r1, 0x4
	movs r2, 0
	ldrsh r3, [r1, r2]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8060320
	ldrh r1, [r4]
	ldrh r0, [r6, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r5]
	ldrh r0, [r6, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r6, 0
	bl npc_coords_shift
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r6]
	b _08061630
	.align 2, 0
_08061608: .4byte gUnknown_08375A3A
_0806160C:
	mov r1, r8
	cmp r1, 0xFF
	bne _08061630
	adds r0, r6, 0
	bl npc_coords_shift_still
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
_08061630:
	mov r0, r8
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806123C

	thumb_func_start sub_8061300
sub_8061300: @ 8061640
	push {lr}
	ldr r2, _08061650
	bl sub_806123C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08061650: .4byte sub_8064704
	thumb_func_end sub_8061300

	thumb_func_start sub_8061314
sub_8061314: @ 8061654
	push {lr}
	ldr r2, _08061664
	bl sub_806123C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08061664: .4byte sub_806478C
	thumb_func_end sub_8061314

	thumb_func_start sub_8061328
sub_8061328: @ 8061668
	push {lr}
	bl sub_8061300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806167A
	movs r0, 0
	b _0806167C
_0806167A:
	movs r0, 0x1
_0806167C:
	pop {r1}
	bx r1
	thumb_func_end sub_8061328

	thumb_func_start sub_8061340
sub_8061340: @ 8061680
	push {lr}
	bl sub_8061314
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08061692
	movs r0, 0
	b _08061694
_08061692:
	movs r0, 0x1
_08061694:
	pop {r1}
	bx r1
	thumb_func_end sub_8061340

	thumb_func_start sub_8061358
sub_8061358: @ 8061698
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080616B2
	cmp r0, 0xFF
	bne _080616DE
	movs r0, 0x1
	b _080616E0
_080616B2:
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE64
_080616DE:
	movs r0, 0
_080616E0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061358

	thumb_func_start sub_80613A8
sub_80613A8: @ 80616E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80613D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613A8

	thumb_func_start sub_80613D4
sub_80613D4: @ 8061714
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061728
	movs r0, 0
	b _08061738
_08061728:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061738:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613D4

	thumb_func_start sub_8061400
sub_8061400: @ 8061740
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806142C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061400

	thumb_func_start sub_806142C
sub_806142C: @ 806176C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061780
	movs r0, 0
	b _08061790
_08061780:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061790:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806142C

	thumb_func_start sub_8061458
sub_8061458: @ 8061798
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061484
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061458

	thumb_func_start sub_8061484
sub_8061484: @ 80617C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080617D8
	movs r0, 0
	b _080617E8
_080617D8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080617E8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061484

	thumb_func_start sub_80614B0
sub_80614B0: @ 80617F0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80614DC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614B0

	thumb_func_start sub_80614DC
sub_80614DC: @ 806181C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061830
	movs r0, 0
	b _08061840
_08061830:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061840:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614DC

	thumb_func_start sub_8061508
sub_8061508: @ 8061848
	movs r2, 0x1
	strh r2, [r0, 0x32]
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8061508

	thumb_func_start sub_8061510
sub_8061510: @ 8061850
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08061862
	movs r0, 0
	b _08061868
_08061862:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	movs r0, 0x1
_08061868:
	pop {r1}
	bx r1
	thumb_func_end sub_8061510

	thumb_func_start sub_806152C
sub_806152C: @ 806186C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806152C

	thumb_func_start sub_806154C
sub_806154C: @ 806188C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806154C

	thumb_func_start sub_806156C
sub_806156C: @ 80618AC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806156C

	thumb_func_start sub_806158C
sub_806158C: @ 80618CC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806158C

	thumb_func_start sub_80615AC
sub_80615AC: @ 80618EC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x10
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80615AC

	thumb_func_start sub_80615CC
sub_80615CC: @ 806190C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80615EC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80615CC

	thumb_func_start sub_80615EC
sub_80615EC: @ 806192C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806193E
	movs r0, 0
	b _08061944
_0806193E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061944:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80615EC

	thumb_func_start sub_806160C
sub_806160C: @ 806194C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806162C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806160C

	thumb_func_start sub_806162C
sub_806162C: @ 806196C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806197E
	movs r0, 0
	b _08061984
_0806197E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061984:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806162C

	thumb_func_start sub_806164C
sub_806164C: @ 806198C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806166C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806164C

	thumb_func_start sub_806166C
sub_806166C: @ 80619AC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080619BE
	movs r0, 0
	b _080619C4
_080619BE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080619C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806166C

	thumb_func_start sub_806168C
sub_806168C: @ 80619CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80616AC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806168C

	thumb_func_start sub_80616AC
sub_80616AC: @ 80619EC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080619FE
	movs r0, 0
	b _08061A04
_080619FE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061A04:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80616AC

	thumb_func_start sub_80616CC
sub_80616CC: @ 8061A0C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, 0
	adds r1, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	bl FieldObjectSetDirection
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805FE28
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x34]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80616CC

	thumb_func_start sub_8061714
sub_8061714: @ 8061A54
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08061A66
	movs r0, 0
	b _08061A78
_08061A66:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08061A78:
	pop {r1}
	bx r1
	thumb_func_end sub_8061714

	thumb_func_start sub_806173C
sub_806173C: @ 8061A7C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrh r1, [r4, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08061AA6
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08061AA6:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806173C

	thumb_func_start sub_8061778
sub_8061778: @ 8061AB8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061778

	thumb_func_start sub_80617B0
sub_80617B0: @ 8061AF0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80617B0

	thumb_func_start sub_80617E8
sub_80617E8: @ 8061B28
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80617E8

	thumb_func_start sub_8061820
sub_8061820: @ 8061B60
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061820

	thumb_func_start sub_8061858
sub_8061858: @ 8061B98
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061858

	thumb_func_start sub_8061890
sub_8061890: @ 8061BD0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061890

	thumb_func_start sub_80618C8
sub_80618C8: @ 8061C08
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80618C8

	thumb_func_start sub_8061900
sub_8061900: @ 8061C40
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061900

	thumb_func_start sub_8061938
sub_8061938: @ 8061C78
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061938

	thumb_func_start sub_8061970
sub_8061970: @ 8061CB0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061970

	thumb_func_start sub_80619A8
sub_80619A8: @ 8061CE8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80619A8

	thumb_func_start sub_80619E0
sub_80619E0: @ 8061D20
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80619E0

	thumb_func_start sub_8061A18
sub_8061A18: @ 8061D58
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A18

	thumb_func_start sub_8061A50
sub_8061A50: @ 8061D90
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A50

	thumb_func_start sub_8061A88
sub_8061A88: @ 8061DC8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A88

	thumb_func_start sub_8061AC0
sub_8061AC0: @ 8061E00
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061AC0

	thumb_func_start sub_8061AF8
sub_8061AF8: @ 8061E38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061AF8

	thumb_func_start sub_8061B18
sub_8061B18: @ 8061E58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061E6A
	movs r0, 0
	b _08061E70
_08061E6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061E70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B18

	thumb_func_start sub_8061B38
sub_8061B38: @ 8061E78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B38

	thumb_func_start sub_8061B58
sub_8061B58: @ 8061E98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061EAA
	movs r0, 0
	b _08061EB0
_08061EAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061EB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B58

	thumb_func_start sub_8061B78
sub_8061B78: @ 8061EB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B78

	thumb_func_start sub_8061B98
sub_8061B98: @ 8061ED8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061EEA
	movs r0, 0
	b _08061EF0
_08061EEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061EF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B98

	thumb_func_start sub_8061BB8
sub_8061BB8: @ 8061EF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061BD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BB8

	thumb_func_start sub_8061BD8
sub_8061BD8: @ 8061F18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061F2A
	movs r0, 0
	b _08061F30
_08061F2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061F30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BD8

	thumb_func_start sub_8061BF8
sub_8061BF8: @ 8061F38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BF8

	thumb_func_start sub_8061C18
sub_8061C18: @ 8061F58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061F6A
	movs r0, 0
	b _08061F70
_08061F6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061F70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C18

	thumb_func_start sub_8061C38
sub_8061C38: @ 8061F78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C38

	thumb_func_start sub_8061C58
sub_8061C58: @ 8061F98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061FAA
	movs r0, 0
	b _08061FB0
_08061FAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061FB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C58

	thumb_func_start sub_8061C78
sub_8061C78: @ 8061FB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C78

	thumb_func_start sub_8061C98
sub_8061C98: @ 8061FD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061FEA
	movs r0, 0
	b _08061FF0
_08061FEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061FF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C98

	thumb_func_start sub_8061CB8
sub_8061CB8: @ 8061FF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061CD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CB8

	thumb_func_start sub_8061CD8
sub_8061CD8: @ 8062018
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806202A
	movs r0, 0
	b _08062030
_0806202A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062030:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CD8

	thumb_func_start sub_8061CF8
sub_8061CF8: @ 8062038
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CF8

	thumb_func_start sub_8061D18
sub_8061D18: @ 8062058
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806206A
	movs r0, 0
	b _08062070
_0806206A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062070:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D18

	thumb_func_start sub_8061D38
sub_8061D38: @ 8062078
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D38

	thumb_func_start sub_8061D58
sub_8061D58: @ 8062098
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080620AA
	movs r0, 0
	b _080620B0
_080620AA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080620B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D58

	thumb_func_start sub_8061D78
sub_8061D78: @ 80620B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D78

	thumb_func_start sub_8061D98
sub_8061D98: @ 80620D8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080620EA
	movs r0, 0
	b _080620F0
_080620EA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080620F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D98

	thumb_func_start sub_8061DB8
sub_8061DB8: @ 80620F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061DD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061DB8

	thumb_func_start sub_8061DD8
sub_8061DD8: @ 8062118
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806212A
	movs r0, 0
	b _08062130
_0806212A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062130:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061DD8

	thumb_func_start do_run_south_anim
do_run_south_anim: @ 8062138
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_south_anim

	thumb_func_start sub_8061E18
sub_8061E18: @ 8062158
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806216A
	movs r0, 0
	b _08062170
_0806216A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062170:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E18

	thumb_func_start do_run_north_anim
do_run_north_anim: @ 8062178
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_north_anim

	thumb_func_start sub_8061E58
sub_8061E58: @ 8062198
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080621AA
	movs r0, 0
	b _080621B0
_080621AA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080621B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E58

	thumb_func_start do_run_west_anim
do_run_west_anim: @ 80621B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_west_anim

	thumb_func_start sub_8061E98
sub_8061E98: @ 80621D8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080621EA
	movs r0, 0
	b _080621F0
_080621EA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080621F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E98

	thumb_func_start do_run_east_anim
do_run_east_anim: @ 80621F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061ED8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_east_anim

	thumb_func_start sub_8061ED8
sub_8061ED8: @ 8062218
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806222A
	movs r0, 0
	b _08062230
_0806222A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062230:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061ED8

	thumb_func_start npc_set_direction_and_anim__an_proceed
npc_set_direction_and_anim__an_proceed: @ 8062238
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r1, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl obj_anim_image_set_and_seek
	adds r0, r6, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_set_direction_and_anim__an_proceed

	thumb_func_start sub_8061F24
sub_8061F24: @ 8062264
	push {lr}
	ldrb r2, [r0, 0x18]
	lsrs r2, 4
	adds r3, r1, 0
	adds r3, 0x2A
	ldrb r3, [r3]
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8061F24

	thumb_func_start sub_8061F3C
sub_8061F3C: @ 806227C
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	bne _08062290
	movs r0, 0
	b _08062296
_08062290:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062296:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061F3C

	thumb_func_start sub_8061F5C
sub_8061F5C: @ 806229C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD88
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8061F5C

	thumb_func_start sub_8061F90
sub_8061F90: @ 80622D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061FB0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061F90

	thumb_func_start sub_8061FB0
sub_8061FB0: @ 80622F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _08062304
	movs r0, 0
	b _08062312
_08062304:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_08062312:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FB0

	thumb_func_start sub_8061FD8
sub_8061FD8: @ 8062318
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061FF8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FD8

	thumb_func_start sub_8061FF8
sub_8061FF8: @ 8062338
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _0806234C
	movs r0, 0
	b _0806235A
_0806234C:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_0806235A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FF8

	thumb_func_start sub_8062020
sub_8062020: @ 8062360
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062040
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062020

	thumb_func_start sub_8062040
sub_8062040: @ 8062380
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _08062394
	movs r0, 0
	b _080623A2
_08062394:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_080623A2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062040

	thumb_func_start sub_8062068
sub_8062068: @ 80623A8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062088
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062068

	thumb_func_start sub_8062088
sub_8062088: @ 80623C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _080623DC
	movs r0, 0
	b _080623EA
_080623DC:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_080623EA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062088

	thumb_func_start sub_80620B0
sub_80620B0: @ 80623F0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0806243A
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _08062448
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_805FE90
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_0806243A:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08062448: .4byte gMapObjects
	thumb_func_end sub_80620B0

	thumb_func_start sub_806210C
sub_806210C: @ 806244C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0806249E
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _080624AC
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_805FE90
	lsls r0, 24
	lsrs r0, 24
	bl GetOppositeDirection
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_0806249E:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080624AC: .4byte gMapObjects
	thumb_func_end sub_806210C

	thumb_func_start sub_8062170
sub_8062170: @ 80624B0
	ldrb r2, [r0, 0x1]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062170

	thumb_func_start sub_8062180
sub_8062180: @ 80624C0
	ldrb r3, [r0, 0x1]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062180

	thumb_func_start sub_8062190
sub_8062190: @ 80624D0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80621BC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062190

	thumb_func_start sub_80621BC
sub_80621BC: @ 80624FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062510
	movs r0, 0
	b _08062520
_08062510:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062520:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80621BC

	thumb_func_start sub_80621E8
sub_80621E8: @ 8062528
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062214
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80621E8

	thumb_func_start sub_8062214
sub_8062214: @ 8062554
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062568
	movs r0, 0
	b _08062578
_08062568:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062578:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062214

	thumb_func_start sub_8062240
sub_8062240: @ 8062580
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806226C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062240

	thumb_func_start sub_806226C
sub_806226C: @ 80625AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080625C0
	movs r0, 0
	b _080625D0
_080625C0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080625D0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806226C

	thumb_func_start sub_8062298
sub_8062298: @ 80625D8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80622C4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062298

	thumb_func_start sub_80622C4
sub_80622C4: @ 8062604
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062618
	movs r0, 0
	b _08062628
_08062618:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062628:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80622C4

	thumb_func_start sub_80622F0
sub_80622F0: @ 8062630
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806231C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80622F0

	thumb_func_start sub_806231C
sub_806231C: @ 806265C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062670
	movs r0, 0
	b _08062680
_08062670:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062680:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806231C

	thumb_func_start sub_8062348
sub_8062348: @ 8062688
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062374
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062348

	thumb_func_start sub_8062374
sub_8062374: @ 80626B4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080626C8
	movs r0, 0
	b _080626D8
_080626C8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080626D8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062374

	thumb_func_start sub_80623A0
sub_80623A0: @ 80626E0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80623CC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623A0

	thumb_func_start sub_80623CC
sub_80623CC: @ 806270C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062720
	movs r0, 0
	b _08062730
_08062720:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062730:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623CC

	thumb_func_start sub_80623F8
sub_80623F8: @ 8062738
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062424
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623F8

	thumb_func_start sub_8062424
sub_8062424: @ 8062764
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062778
	movs r0, 0
	b _08062788
_08062778:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062788:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062424

	thumb_func_start sub_8062450
sub_8062450: @ 8062790
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806247C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062450

	thumb_func_start sub_806247C
sub_806247C: @ 80627BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _080627D0
	movs r0, 0
	b _080627E0
_080627D0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080627E0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806247C

	thumb_func_start sub_80624A8
sub_80624A8: @ 80627E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80624D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80624A8

	thumb_func_start sub_80624D4
sub_80624D4: @ 8062814
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062828
	movs r0, 0
	b _08062838
_08062828:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062838:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80624D4

	thumb_func_start sub_8062500
sub_8062500: @ 8062840
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806252C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062500

	thumb_func_start sub_806252C
sub_806252C: @ 806286C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062880
	movs r0, 0
	b _08062890
_08062880:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062890:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806252C

	thumb_func_start sub_8062558
sub_8062558: @ 8062898
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062584
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062558

	thumb_func_start sub_8062584
sub_8062584: @ 80628C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _080628D8
	movs r0, 0
	b _080628E8
_080628D8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080628E8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062584

	thumb_func_start sub_80625B0
sub_80625B0: @ 80628F0
	push {lr}
	ldr r3, _08062904
	ldrb r2, [r0, 0x6]
	adds r2, r3
	ldrb r2, [r2]
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08062904: .4byte gUnknown_0836DC09
	thumb_func_end sub_80625B0

	thumb_func_start sub_80625C8
sub_80625C8: @ 8062908
	push {lr}
	movs r2, 0x1
	movs r3, 0x14
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80625C8

	thumb_func_start sub_80625D8
sub_80625D8: @ 8062918
	ldrb r3, [r0, 0x3]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625D8

	thumb_func_start sub_80625E8
sub_80625E8: @ 8062928
	ldrb r2, [r0, 0x3]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625E8

	thumb_func_start sub_80625F8
sub_80625F8: @ 8062938
	ldrb r2, [r0, 0x1]
	movs r3, 0x10
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625F8

	thumb_func_start sub_8062608
sub_8062608: @ 8062948
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062608

	thumb_func_start sub_8062634
sub_8062634: @ 8062974
	ldrb r2, [r0, 0x1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062634

	thumb_func_start sub_8062644
sub_8062644: @ 8062984
	ldrb r3, [r0, 0x1]
	movs r2, 0x21
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062644

	thumb_func_start do_exclamation_mark_bubble_1
do_exclamation_mark_bubble_1: @ 8062994
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080629B4
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080629B4: .4byte gUnknown_0202FF84
	thumb_func_end do_exclamation_mark_bubble_1

	thumb_func_start do_exclamation_mark_bubble_2
do_exclamation_mark_bubble_2: @ 80629B8
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080629D8
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x21
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080629D8: .4byte gUnknown_0202FF84
	thumb_func_end do_exclamation_mark_bubble_2

	thumb_func_start do_heart_bubble
do_heart_bubble: @ 80629DC
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080629FC
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x2E
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080629FC: .4byte gUnknown_0202FF84
	thumb_func_end do_heart_bubble

	thumb_func_start sub_80626C0
sub_80626C0: @ 8062A00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x6]
	cmp r0, 0x3F
	bne _08062A16
	adds r0, r4, 0
	bl sub_8084794
	movs r0, 0
	b _08062A3E
_08062A16:
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08062A38
	adds r0, r4, 0
	bl sub_812869C
	movs r0, 0x1
	strh r0, [r5, 0x32]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062704
	lsls r0, 24
	lsrs r0, 24
	b _08062A3E
_08062A38:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062A3E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80626C0

	thumb_func_start sub_8062704
sub_8062704: @ 8062A44
	push {r4,lr}
	adds r4, r1, 0
	bl sub_81286C4
	lsls r0, 24
	cmp r0, 0
	bne _08062A56
	movs r0, 0
	b _08062A5C
_08062A56:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062A5C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062704

	thumb_func_start sub_8062724
sub_8062724: @ 8062A64
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062724

	thumb_func_start sub_8062740
sub_8062740: @ 8062A80
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _08062A9C
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_08062A9C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062740

	thumb_func_start sub_8062764
sub_8062764: @ 8062AA4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062AD6
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062AD6:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062764

	thumb_func_start sub_80627A0
sub_80627A0: @ 8062AE0
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627A0

	thumb_func_start sub_80627BC
sub_80627BC: @ 8062AFC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _08062B18
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_08062B18:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627BC

	thumb_func_start sub_80627E0
sub_80627E0: @ 8062B20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062B52
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062B52:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80627E0

	thumb_func_start sub_806281C
sub_806281C: @ 8062B5C
	ldrb r2, [r0, 0x3]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806281C

	thumb_func_start sub_806282C
sub_806282C: @ 8062B6C
	ldrb r3, [r0, 0x3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806282C

	thumb_func_start sub_806283C
sub_806283C: @ 8062B7C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806283C

	thumb_func_start sub_806286C
sub_806286C: @ 8062BAC
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	movs r3, 0
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806286C

	thumb_func_start sub_806289C
sub_806289C: @ 8062BDC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80628D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806289C

	thumb_func_start sub_80628D0
sub_80628D0: @ 8062C10
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08062C22
	movs r0, 0
	b _08062C34
_08062C22:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062C34:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80628D0

	thumb_func_start sub_80628FC
sub_80628FC: @ 8062C3C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8062930
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80628FC

	thumb_func_start sub_8062930
sub_8062930: @ 8062C70
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08062C82
	movs r0, 0
	b _08062C94
_08062C82:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062C94:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062930

	thumb_func_start sub_806295C
sub_806295C: @ 8062C9C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	bl npc_coords_shift_still
	adds r0, r4, 0
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_805FE64
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806295C

	thumb_func_start sub_806299C
sub_806299C: @ 8062CDC
	push {lr}
	movs r2, 0x1
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806299C

	thumb_func_start sub_80629AC
sub_80629AC: @ 8062CEC
	push {lr}
	movs r2, 0x2
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629AC

	thumb_func_start sub_80629BC
sub_80629BC: @ 8062CFC
	push {lr}
	movs r2, 0x3
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629BC

	thumb_func_start sub_80629CC
sub_80629CC: @ 8062D0C
	push {lr}
	movs r2, 0x4
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629CC

	thumb_func_start sub_80629DC
sub_80629DC: @ 8062D1C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80629DC

	thumb_func_start sub_8062A00
sub_8062A00: @ 8062D40
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A00

	thumb_func_start sub_8062A24
sub_8062A24: @ 8062D64
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A24

	thumb_func_start sub_8062A48
sub_8062A48: @ 8062D88
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A48

	thumb_func_start sub_8062A6C
sub_8062A6C: @ 8062DAC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A6C

	thumb_func_start sub_8062A90
sub_8062A90: @ 8062DD0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A90

	thumb_func_start sub_8062AB4
sub_8062AB4: @ 8062DF4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AB4

	thumb_func_start sub_8062AD8
sub_8062AD8: @ 8062E18
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AD8

	thumb_func_start sub_8062AFC
sub_8062AFC: @ 8062E3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AFC

	thumb_func_start sub_8062B20
sub_8062B20: @ 8062E60
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B20

	thumb_func_start sub_8062B44
sub_8062B44: @ 8062E84
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B44

	thumb_func_start sub_8062B68
sub_8062B68: @ 8062EA8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B68

	thumb_func_start sub_8062B8C
sub_8062B8C: @ 8062ECC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r6, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8062B8C

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 8062F10
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062BFC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BD0

	thumb_func_start sub_8062BFC
sub_8062BFC: @ 8062F3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F50
	movs r0, 0
	b _08062F60
_08062F50:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F60:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BFC

	thumb_func_start sub_8062C28
sub_8062C28: @ 8062F68
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062C54
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C28

	thumb_func_start sub_8062C54
sub_8062C54: @ 8062F94
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062FA8
	movs r0, 0
	b _08062FB8
_08062FA8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062FB8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C54

	thumb_func_start sub_8062C80
sub_8062C80: @ 8062FC0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062CAC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C80

	thumb_func_start sub_8062CAC
sub_8062CAC: @ 8062FEC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063000
	movs r0, 0
	b _08063010
_08063000:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063010:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CAC

	thumb_func_start sub_8062CD8
sub_8062CD8: @ 8063018
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D04
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CD8

	thumb_func_start sub_8062D04
sub_8062D04: @ 8063044
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063058
	movs r0, 0
	b _08063068
_08063058:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063068:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D04

	thumb_func_start sub_8062D30
sub_8062D30: @ 8063070
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D5C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D30

	thumb_func_start sub_8062D5C
sub_8062D5C: @ 806309C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080630B0
	movs r0, 0
	b _080630C0
_080630B0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080630C0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D5C

	thumb_func_start sub_8062D88
sub_8062D88: @ 80630C8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062DB4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D88

	thumb_func_start sub_8062DB4
sub_8062DB4: @ 80630F4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063108
	movs r0, 0
	b _08063118
_08063108:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063118:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DB4

	thumb_func_start sub_8062DE0
sub_8062DE0: @ 8063120
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E0C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DE0

	thumb_func_start sub_8062E0C
sub_8062E0C: @ 806314C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063160
	movs r0, 0
	b _08063170
_08063160:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063170:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E0C

	thumb_func_start sub_8062E38
sub_8062E38: @ 8063178
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E64
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E38

	thumb_func_start sub_8062E64
sub_8062E64: @ 80631A4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080631B8
	movs r0, 0
	b _080631C8
_080631B8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080631C8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E64

	thumb_func_start sub_8062E90
sub_8062E90: @ 80631D0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062EBC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E90

	thumb_func_start sub_8062EBC
sub_8062EBC: @ 80631FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063210
	movs r0, 0
	b _08063220
_08063210:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063220:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EBC

	thumb_func_start sub_8062EE8
sub_8062EE8: @ 8063228
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F14
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EE8

	thumb_func_start sub_8062F14
sub_8062F14: @ 8063254
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063268
	movs r0, 0
	b _08063278
_08063268:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063278:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F14

	thumb_func_start sub_8062F40
sub_8062F40: @ 8063280
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F6C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F40

	thumb_func_start sub_8062F6C
sub_8062F6C: @ 80632AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080632C0
	movs r0, 0
	b _080632D0
_080632C0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080632D0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F6C

	thumb_func_start sub_8062F98
sub_8062F98: @ 80632D8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062FC4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F98

	thumb_func_start sub_8062FC4
sub_8062FC4: @ 8063304
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08063318
	movs r0, 0
	b _08063328
_08063318:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08063328:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FC4

	thumb_func_start sub_8062FF0
sub_8062FF0: @ 8063330
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FF0

	thumb_func_start sub_8063028
sub_8063028: @ 8063368
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063028

	thumb_func_start sub_8063060
sub_8063060: @ 80633A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063060

	thumb_func_start sub_8063098
sub_8063098: @ 80633D8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063098

	thumb_func_start sub_80630D0
sub_80630D0: @ 8063410
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80630D0

	thumb_func_start sub_8063108
sub_8063108: @ 8063448
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063128
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063108

	thumb_func_start sub_8063128
sub_8063128: @ 8063468
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806347A
	movs r0, 0
	b _08063480
_0806347A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063480:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063128

	thumb_func_start sub_8063148
sub_8063148: @ 8063488
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063168
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063148

	thumb_func_start sub_8063168
sub_8063168: @ 80634A8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080634BA
	movs r0, 0
	b _080634C0
_080634BA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080634C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063168

	thumb_func_start sub_8063188
sub_8063188: @ 80634C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631A8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063188

	thumb_func_start sub_80631A8
sub_80631A8: @ 80634E8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080634FA
	movs r0, 0
	b _08063500
_080634FA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063500:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631A8

	thumb_func_start sub_80631C8
sub_80631C8: @ 8063508
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631E8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80631C8

	thumb_func_start sub_80631E8
sub_80631E8: @ 8063528
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806353A
	movs r0, 0
	b _08063540
_0806353A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063540:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631E8

	thumb_func_start sub_8063208
sub_8063208: @ 8063548
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063208

	thumb_func_start sub_8063238
sub_8063238: @ 8063578
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063258
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063238

	thumb_func_start sub_8063258
sub_8063258: @ 8063598
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080635AA
	movs r0, 0
	b _080635B0
_080635AA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080635B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063258

	thumb_func_start sub_8063278
sub_8063278: @ 80635B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063298
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063278

	thumb_func_start sub_8063298
sub_8063298: @ 80635D8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080635EA
	movs r0, 0
	b _080635F0
_080635EA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080635F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063298

	thumb_func_start sub_80632B8
sub_80632B8: @ 80635F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80632D8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632B8

	thumb_func_start sub_80632D8
sub_80632D8: @ 8063618
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806362A
	movs r0, 0
	b _08063630
_0806362A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063630:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80632D8

	thumb_func_start sub_80632F8
sub_80632F8: @ 8063638
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063318
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632F8

	thumb_func_start sub_8063318
sub_8063318: @ 8063658
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806366A
	movs r0, 0
	b _08063670
_0806366A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063670:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063318

	thumb_func_start sub_8063338
sub_8063338: @ 8063678
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063338

	thumb_func_start sub_8063370
sub_8063370: @ 80636B0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063390
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063370

	thumb_func_start sub_8063390
sub_8063390: @ 80636D0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080636E2
	movs r0, 0
	b _080636E8
_080636E2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080636E8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063390

	thumb_func_start sub_80633B0
sub_80633B0: @ 80636F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80633D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633B0

	thumb_func_start sub_80633D0
sub_80633D0: @ 8063710
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063722
	movs r0, 0
	b _08063728
_08063722:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063728:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80633D0

	thumb_func_start sub_80633F0
sub_80633F0: @ 8063730
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063410
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633F0

	thumb_func_start sub_8063410
sub_8063410: @ 8063750
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063762
	movs r0, 0
	b _08063768
_08063762:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063768:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063410

	thumb_func_start sub_8063430
sub_8063430: @ 8063770
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063450
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063430

	thumb_func_start sub_8063450
sub_8063450: @ 8063790
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080637A2
	movs r0, 0
	b _080637A8
_080637A2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080637A8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063450

	thumb_func_start sub_8063470
sub_8063470: @ 80637B0
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063470

	thumb_func_start sub_8063474
sub_8063474: @ 80637B4
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063474

	thumb_func_start npc_obj_transfer_image_anim_pause_flag
npc_obj_transfer_image_anim_pause_flag: @ 80637C4
	push {lr}
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	bge _080637DA
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_080637DA:
	pop {r0}
	bx r0
	thumb_func_end npc_obj_transfer_image_anim_pause_flag

	thumb_func_start sub_80634A0
sub_80634A0: @ 80637E0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r3, [r4, 0x1]
	lsls r0, r3, 28
	cmp r0, 0
	bge _08063808
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x1]
_08063808:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80634A0

	thumb_func_start sub_80634D0
sub_80634D0: @ 8063810
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80634E8
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_update_obj_anim_flag
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80634D0

	thumb_func_start sub_80634E8
sub_80634E8: @ 8063828
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806388C
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063884
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063888
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	b _080638B4
	.align 2, 0
_08063884: .4byte gSpriteCoordOffsetX
_08063888: .4byte gSpriteCoordOffsetY
_0806388C:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
_080638B4:
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r6, 0x8]
	adds r0, r3
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r0, [r6, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _080638DC
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080638E4
_080638DC:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080638E4:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080638F8
	lsls r0, r4, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _08063900
_080638F8:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_08063900:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80634E8

	thumb_func_start npc_update_obj_anim_flag
npc_update_obj_anim_flag: @ 8063908
	push {lr}
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x5
	negs r3, r3
	ands r3, r1
	strb r3, [r2]
	ldrb r1, [r0, 0x1]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0806392A
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2]
_0806392A:
	pop {r0}
	bx r0
	thumb_func_end npc_update_obj_anim_flag

	.align 2, 0 @ Don't pad with nop.
