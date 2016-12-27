	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_806D7F8
sub_806D7F8: @ 806DB38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsls r2, 16
	lsrs r5, r1, 16
	asrs r1, 16
	lsrs r4, r2, 16
	asrs r2, 16
	adds r0, r1, 0
	adds r1, r2, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r5, r4
	beq _0806DB70
	movs r2, 0x1
	cmp r0, 0x3
	beq _0806DB70
	movs r2, 0x2
	cmp r0, 0x2
	beq _0806DB70
	movs r2, 0x4
	cmp r0, 0x1
	bne _0806DB70
	movs r2, 0x3
_0806DB70:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0806DB88 @ =gSprites
	adds r0, r1
	adds r1, r2, 0
	bl sub_809D824
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB88: .4byte gSprites
	thumb_func_end sub_806D7F8

	thumb_func_start sub_806D84C
sub_806D84C: @ 806DB8C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806D7F8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806D84C

	thumb_func_start sub_806D880
sub_806D880: @ 806DBC0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DC44 @ =gUnknown_08376678
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	mov r9, r0
	ldrb r1, [r1, 0x1]
	mov r10, r1
	mov r0, r8
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0
	bl GetMonData
	ldr r1, _0806DC48 @ =sub_809D62C
	movs r2, 0x5
	str r2, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_809D2FC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806DE50
	adds r0, r4, 0
	mov r1, r8
	bl sub_806D84C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC44: .4byte gUnknown_08376678
_0806DC48: .4byte sub_809D62C
	thumb_func_end sub_806D880

	thumb_func_start sub_806D90C
sub_806D90C: @ 806DC4C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r8, r6
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806DC9A
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806DC86
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x2
	adds r3, r4, 0
	bl sub_806D880
	b _0806DC9A
_0806DC86:
	bl battle_type_is_double
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r7, 0
	adds r3, r4, 0
	bl sub_806D880
_0806DC9A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806D90C

	thumb_func_start unref_sub_806D964
unref_sub_806D964: @ 806DCA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _0806DCC6
_0806DCAE:
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	ldr r0, _0806DCD4 @ =gPlayerParty
	adds r2, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806D90C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0806DCC6:
	ldr r0, _0806DCD8 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0806DCAE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCD4: .4byte gPlayerParty
_0806DCD8: .4byte gPlayerPartyCount
	thumb_func_end unref_sub_806D964

	thumb_func_start sub_806D99C
sub_806D99C: @ 806DCDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DD44 @ =gUnknown_08376678
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, _0806DD48 @ =sub_809D62C
	movs r4, 0x5
	str r4, [sp]
	mov r7, r8
	ldr r4, [r7, 0x18]
	str r4, [sp, 0x4]
	bl sub_809D2FC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806DE50
	ldrh r1, [r7, 0x10]
	ldrh r2, [r7, 0x12]
	adds r0, r4, 0
	bl sub_806D7F8
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD44: .4byte gUnknown_08376678
_0806DD48: .4byte sub_809D62C
	thumb_func_end sub_806D99C

	thumb_func_start sub_806DA0C
sub_806DA0C: @ 806DD4C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806DD72
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806DD70
	ldr r0, _0806DD6C @ =0x0000fffd
	strh r0, [r4, 0x26]
	b _0806DD72
	.align 2, 0
_0806DD6C: .4byte 0x0000fffd
_0806DD70:
	strh r1, [r4, 0x26]
_0806DD72:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806DA0C

	thumb_func_start sub_806DA38
sub_806DA38: @ 806DD78
	push {lr}
	bl sub_809D638
	pop {r0}
	bx r0
	thumb_func_end sub_806DA38

	thumb_func_start sub_806DA44
sub_806DA44: @ 806DD84
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r1, 0x5
	bhi _0806DDCE
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806DDBC @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r2, r1, 2
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x2E]
	cmp r4, 0
	bne _0806DDC4
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DDC0 @ =sub_806DA38
	b _0806DDCC
	.align 2, 0
_0806DDBC: .4byte gSprites
_0806DDC0: .4byte sub_806DA38
_0806DDC4:
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DDD4 @ =sub_806DA0C
_0806DDCC:
	str r1, [r0]
_0806DDCE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DDD4: .4byte sub_806DA0C
	thumb_func_end sub_806DA44

	thumb_func_start sub_806DA98
sub_806DA98: @ 806DDD8
	push {lr}
	ldr r0, _0806DDEC @ =gUnknown_083765DC
	bl LoadSpriteSheet
	ldr r0, _0806DDF0 @ =gUnknown_083765E4
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0806DDEC: .4byte gUnknown_083765DC
_0806DDF0: .4byte gUnknown_083765E4
	thumb_func_end sub_806DA98

	thumb_func_start sub_806DAB4
sub_806DAB4: @ 806DDF4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806DE24 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0806DE28
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DE46
	.align 2, 0
_0806DE24: .4byte gSprites
_0806DE28:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
_0806DE46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806DAB4

	thumb_func_start sub_806DB0C
sub_806DB0C: @ 806DE4C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0806DEC4 @ =gSprites
	mov r8, r0
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	ldr r0, _0806DEC8 @ =gSpriteTemplate_837660C
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xFA
	movs r2, 0xAA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r0, r8
	adds r5, r4, r0
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _0806DECC @ =sub_806DAB4
	str r0, [r4]
	strh r6, [r5, 0x3C]
	adds r0, r5, 0
	mov r1, r9
	bl StartSpriteAnim
	ldr r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEC4: .4byte gSprites
_0806DEC8: .4byte gSpriteTemplate_837660C
_0806DECC: .4byte sub_806DAB4
	thumb_func_end sub_806DB0C

	thumb_func_start sub_806DB90
sub_806DB90: @ 806DED0
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	beq _0806DEE4
	cmp r2, 0x1
	beq _0806DF2C
	b _0806DF68
_0806DEE4:
	movs r5, 0
	ldrb r0, [r6]
	cmp r5, r0
	bcs _0806DF68
_0806DEEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DF28 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DF18
	adds r0, r7, r5
	ldrb r4, [r0]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DB0C
_0806DF18:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r6]
	cmp r5, r0
	bcc _0806DEEC
	b _0806DF68
	.align 2, 0
_0806DF28: .4byte gPlayerParty
_0806DF2C:
	movs r5, 0
	b _0806DF62
_0806DF30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DF70 @ =gEnemyParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DF5C
	adds r0, r5, r7
	ldrb r4, [r0, 0x6]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DB0C
_0806DF5C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0806DF62:
	ldrb r0, [r6, 0x1]
	cmp r5, r0
	bcc _0806DF30
_0806DF68:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF70: .4byte gEnemyParty
	thumb_func_end sub_806DB90

	thumb_func_start sub_806DC34
sub_806DC34: @ 806DF74
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	ldr r0, _0806E008 @ =gSprites
	mov r9, r0
	movs r1, 0x1C
	add r1, r9
	mov r10, r1
_0806DF90:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0806E00C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806DFF0
	mov r0, r8
	adds r1, r7, 0
	bl sub_806DDA0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806E010 @ =gSpriteTemplate_837660C
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r1, r9
	adds r6, r4, r1
	movs r1, 0x4
	strh r1, [r6, 0x24]
	movs r1, 0xA
	strh r1, [r6, 0x26]
	strh r5, [r6, 0x3C]
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	add r1, r9
	strh r0, [r1, 0x3C]
	mov r0, r8
	adds r1, r7, 0
	bl sub_806DF60
	add r4, r10
	ldr r1, [r4]
	adds r0, r6, 0
	bl _call_via_r1
_0806DFF0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _0806DF90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E008: .4byte gSprites
_0806E00C: .4byte gPlayerParty
_0806E010: .4byte gSpriteTemplate_837660C
	thumb_func_end sub_806DC34

	thumb_func_start sub_806DCD4
sub_806DCD4: @ 806E014
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r7, r2, 16
	bl sub_806DDA0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806E06C @ =gSpriteTemplate_837660C
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806E070 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	strh r4, [r5, 0x3C]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r6, [r0, 0x3C]
	cmp r7, 0
	bne _0806E074
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806E09C
	.align 2, 0
_0806E06C: .4byte gSpriteTemplate_837660C
_0806E070: .4byte gSprites
_0806E074:
	adds r0, r7, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806E086
	adds r0, r5, 0
	movs r1, 0x1
	b _0806E08A
_0806E086:
	adds r0, r5, 0
	movs r1, 0
_0806E08A:
	bl StartSpriteAnim
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0806E09C:
	ldr r2, _0806E0B8 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0B8: .4byte gSprites
	thumb_func_end sub_806DCD4

	thumb_func_start sub_806DD7C
sub_806DD7C: @ 806E0BC
	ldrh r2, [r0, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806E0DC @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0806E0DC: .4byte gSprites
	thumb_func_end sub_806DD7C

	thumb_func_start sub_806DDA0
sub_806DDA0: @ 806E0E0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x5
	bhi _0806E178
	lsls r0, 2
	ldr r1, _0806E0F8 @ =_0806E0FC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E0F8: .4byte _0806E0FC
	.align 2, 0
_0806E0FC:
	.4byte _0806E178
	.4byte _0806E114
	.4byte _0806E128
	.4byte _0806E13C
	.4byte _0806E150
	.4byte _0806E164
_0806E114:
	ldr r0, _0806E124 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	b _0806E186
	.align 2, 0
_0806E124: .4byte gTasks
_0806E128:
	ldr r0, _0806E138 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	b _0806E184
	.align 2, 0
_0806E138: .4byte gTasks
_0806E13C:
	ldr r0, _0806E14C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _0806E186
	.align 2, 0
_0806E14C: .4byte gTasks
_0806E150:
	ldr r0, _0806E160 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _0806E184
	.align 2, 0
_0806E160: .4byte gTasks
_0806E164:
	ldr r0, _0806E174 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xC]
	b _0806E186
	.align 2, 0
_0806E174: .4byte gTasks
_0806E178:
	ldr r0, _0806E18C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
_0806E184:
	lsrs r0, 8
_0806E186:
	pop {r1}
	bx r1
	.align 2, 0
_0806E18C: .4byte gTasks
	thumb_func_end sub_806DDA0

	thumb_func_start sub_806DE50
sub_806DE50: @ 806E190
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r0, 0x5
	bhi _0806E264
	lsls r0, 2
	ldr r1, _0806E1AC @ =_0806E1B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E1AC: .4byte _0806E1B0
	.align 2, 0
_0806E1B0:
	.4byte _0806E1C8
	.4byte _0806E1E0
	.4byte _0806E200
	.4byte _0806E218
	.4byte _0806E238
	.4byte _0806E250
_0806E1C8:
	ldr r1, _0806E1DC @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0x8]
	b _0806E264
	.align 2, 0
_0806E1DC: .4byte gTasks
_0806E1E0:
	ldr r0, _0806E1F8 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	ldr r0, _0806E1FC @ =0xffffff00
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0x8]
	b _0806E264
	.align 2, 0
_0806E1F8: .4byte gTasks
_0806E1FC: .4byte 0xffffff00
_0806E200:
	ldr r1, _0806E214 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xA]
	b _0806E264
	.align 2, 0
_0806E214: .4byte gTasks
_0806E218:
	ldr r0, _0806E230 @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	ldr r0, _0806E234 @ =0xffffff00
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xA]
	b _0806E264
	.align 2, 0
_0806E230: .4byte gTasks
_0806E234: .4byte 0xffffff00
_0806E238:
	ldr r1, _0806E24C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xC]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xC]
	b _0806E264
	.align 2, 0
_0806E24C: .4byte gTasks
_0806E250:
	ldr r0, _0806E26C @ =gTasks
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	ldr r0, _0806E270 @ =0xffffff00
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xC]
_0806E264:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E26C: .4byte gTasks
_0806E270: .4byte 0xffffff00
	thumb_func_end sub_806DE50

	thumb_func_start sub_806DF34
sub_806DF34: @ 806E274
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806E29C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806E29C: .4byte gSprites
	thumb_func_end sub_806DF34

	thumb_func_start sub_806DF60
sub_806DF60: @ 806E2A0
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_806DF34
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0806E2E4 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0
	bne _0806E2EC
	ldr r1, _0806E2E8 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806E336
	.align 2, 0
_0806E2E4: .4byte gPlayerParty
_0806E2E8: .4byte gSprites
_0806E2EC:
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806E318
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0806E314 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x1
	b _0806E326
	.align 2, 0
_0806E314: .4byte gSprites
_0806E318:
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r0, _0806E33C @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
_0806E326:
	bl StartSpriteAnim
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_0806E336:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E33C: .4byte gSprites
	thumb_func_end sub_806DF60

	thumb_func_start box_print
box_print: @ 806E340
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E380 @ =gTileBuffer
	ldr r2, _0806E384 @ =0x01000100
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E388 @ =gWindowConfig_81E6CAC
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E38C @ =0x06014000
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x80
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E380: .4byte gTileBuffer
_0806E384: .4byte 0x01000100
_0806E388: .4byte gWindowConfig_81E6CAC
_0806E38C: .4byte 0x06014000
	thumb_func_end box_print

	thumb_func_start sub_806E050
sub_806E050: @ 806E390
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r1, sp
	bl GetMonNickname
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl box_print
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E050

	thumb_func_start sub_806E07C
sub_806E07C: @ 806E3BC
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E3FC
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E3EA
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E050
	b _0806E3FC
_0806E3EA:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E050
_0806E3FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E07C

	thumb_func_start sub_806E0C4
sub_806E0C4: @ 806E404
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E428 @ =gPlayerParty
_0806E40C:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E07C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E40C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E428: .4byte gPlayerParty
	thumb_func_end sub_806E0C4

	thumb_func_start GetMonNickname
GetMonNickname: @ 806E42C
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNickname

	thumb_func_start sub_806E104
sub_806E104: @ 806E444
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _0806E49C @ =gUnknown_08376738
	lsrs r0, 22
	lsls r3, r1, 1
	adds r3, r1
	lsls r3, 3
	adds r0, r3
	adds r0, r4
	ldrb r1, [r0]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E4A0 @ =0x0600f000
	adds r4, r1, r0
	lsls r2, 26
	lsrs r2, 24
	movs r3, 0
	movs r0, 0xC6
	lsls r0, 1
	adds r2, r0
	ldr r0, _0806E4A4 @ =0xffffb000
	adds r5, r0, 0
_0806E482:
	lsls r0, r3, 1
	adds r0, r4
	adds r1, r2, r3
	orrs r1, r5
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E482
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E49C: .4byte gUnknown_08376738
_0806E4A0: .4byte 0x0600f000
_0806E4A4: .4byte 0xffffb000
	thumb_func_end sub_806E104

	thumb_func_start sub_806E168
sub_806E168: @ 806E4A8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E4BE
	movs r3, 0x2
	b _0806E4C6
_0806E4BE:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r3, r0, 24
_0806E4C6:
	ldr r1, _0806E508 @ =gUnknown_08376738
	lsls r2, r4, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	ldrb r1, [r2]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E50C @ =0x0600f000
	adds r1, r0
	movs r3, 0
	movs r2, 0
_0806E4F0:
	lsls r0, r3, 1
	adds r0, r1
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E4F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E508: .4byte gUnknown_08376738
_0806E50C: .4byte 0x0600f000
	thumb_func_end sub_806E168

	thumb_func_start sub_806E1D0
sub_806E1D0: @ 806E510
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 19
	adds r1, r2
	lsls r1, 1
	ldr r2, _0806E530 @ =0x0600f000
	adds r1, r2
	movs r2, 0x86
	lsls r2, 1
	adds r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0806E530: .4byte 0x0600f000
	thumb_func_end sub_806E1D0

	thumb_func_start sub_806E1F4
sub_806E1F4: @ 806E534
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r3, _0806E5B8 @ =gUnknown_08376738
	lsls r2, r4, 2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, r0
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x40
	bl sub_806E1D0
	ldr r6, _0806E5BC @ =gStringVar1
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x8
	strb r0, [r6, 0x2]
	adds r0, r6, 0x3
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E5C0 @ =gUnknown_02039460
	ldr r2, _0806E5C4 @ =0x01000020
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E5C8 @ =gWindowConfig_81E6CAC
	ldr r2, _0806E5CC @ =0xffffff00
	adds r1, r5, r2
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E5D0 @ =0x06014200
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x20
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E5B8: .4byte gUnknown_08376738
_0806E5BC: .4byte gStringVar1
_0806E5C0: .4byte gUnknown_02039460
_0806E5C4: .4byte 0x01000020
_0806E5C8: .4byte gWindowConfig_81E6CAC
_0806E5CC: .4byte 0xffffff00
_0806E5D0: .4byte 0x06014200
	thumb_func_end sub_806E1F4

	thumb_func_start sub_806E294
sub_806E294: @ 806E5D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x38
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E1F4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E294

	thumb_func_start sub_806E2C0
sub_806E2C0: @ 806E600
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E66E
	adds r0, r5, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E66E
	adds r0, r5, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E63A
	movs r6, 0x2
	b _0806E642
_0806E63A:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r6, r0, 24
_0806E642:
	cmp r4, 0
	beq _0806E65A
	cmp r4, 0x6
	beq _0806E65A
	subs r2, r4, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_806E104
	b _0806E664
_0806E65A:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E294
_0806E664:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E3C0
_0806E66E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806E2C0

	thumb_func_start sub_806E334
sub_806E334: @ 806E674
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E698 @ =gPlayerParty
_0806E67C:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E2C0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E67C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E698: .4byte gPlayerParty
	thumb_func_end sub_806E334

	thumb_func_start sub_806E35C
sub_806E35C: @ 806E69C
	push {r4-r7,lr}
	ldr r4, [sp, 0x14]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r1, r4, 0
	bl sub_8040D8C
	cmp r0, 0
	bne _0806E6FA
	ldr r2, _0806E6E4 @ =gUnknown_08376738
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r7, 0
	beq _0806E6E8
	cmp r7, 0xFE
	beq _0806E6F2
	b _0806E6FA
	.align 2, 0
_0806E6E4: .4byte gUnknown_08376738
_0806E6E8:
	movs r0, 0x42
	adds r1, r3, 0
	bl sub_806E1D0
	b _0806E6FA
_0806E6F2:
	movs r0, 0x44
	adds r1, r3, 0
	bl sub_806E1D0
_0806E6FA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806E35C

	thumb_func_start sub_806E3C0
sub_806E3C0: @ 806E700
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0806E75C @ =gStringVar1
	mov r9, r0
	adds r0, r5, 0
	mov r1, r9
	bl GetMonNickname
	adds r0, r5, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl GetMonGender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r6, 0
	mov r3, r8
	bl sub_806E35C
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E75C: .4byte gStringVar1
	thumb_func_end sub_806E3C0

	thumb_func_start sub_806E420
sub_806E420: @ 806E760
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r1, r2, 0
	adds r5, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r2, _0806E7CC @ =gStringVar1
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r5, 0
	movs r2, 0x23
	movs r3, 0x1
	bl sub_8072C14
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E7D0 @ =gUnknown_02039460
	ldr r2, _0806E7D4 @ =0x01000040
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E7D8 @ =gWindowConfig_81E6CAC
	ldr r2, _0806E7DC @ =0xffffff00
	adds r1, r5, r2
	ldr r2, _0806E7CC @ =gStringVar1
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E7E0 @ =0x06014300
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x40
	bl CpuFastSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E7CC: .4byte gStringVar1
_0806E7D0: .4byte gUnknown_02039460
_0806E7D4: .4byte 0x01000040
_0806E7D8: .4byte gWindowConfig_81E6CAC
_0806E7DC: .4byte 0xffffff00
_0806E7E0: .4byte 0x06014300
	thumb_func_end sub_806E420

	thumb_func_start sub_806E4A4
sub_806E4A4: @ 806E7E4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_806E420
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E4A4

	thumb_func_start sub_806E4E8
sub_806E4E8: @ 806E828
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806E874
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806E874
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E862
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E4A4
	b _0806E874
_0806E862:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E4A4
_0806E874:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E4E8

	thumb_func_start sub_806E53C
sub_806E53C: @ 806E87C
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E8A0 @ =gPlayerParty
_0806E884:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E4E8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E884
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8A0: .4byte gPlayerParty
	thumb_func_end sub_806E53C

	thumb_func_start unref_sub_806E564
unref_sub_806E564: @ 806E8A4
	bx lr
	thumb_func_end unref_sub_806E564

	thumb_func_start unref_sub_806E568
unref_sub_806E568: @ 806E8A8
	bx lr
	thumb_func_end unref_sub_806E568

	thumb_func_start nullsub_12
nullsub_12: @ 806E8AC
	bx lr
	thumb_func_end nullsub_12

	thumb_func_start nullsub_13
nullsub_13: @ 806E8B0
	bx lr
	thumb_func_end nullsub_13

	thumb_func_start sub_806E574
sub_806E574: @ 806E8B4
	push {r4-r6,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0806E964 @ =0xffff8000
	str r0, [sp, 0x14]
	str r3, [sp]
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	adds r0, r2, 0
	adds r1, r3, 0
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	cmp r3, 0x2
	bls _0806E8FE
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E8FE:
	cmp r3, 0x2
	bne _0806E912
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x5
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E912:
	cmp r4, 0x1
	bhi _0806E926
	mov r2, sp
	ldrb r1, [r2, 0xC]
	movs r0, 0x20
	negs r0, r0
	ands r0, r1
	movs r1, 0x6
	orrs r0, r1
	strb r0, [r2, 0xC]
_0806E926:
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp, 0x10]
	ldr r2, _0806E968 @ =gUnknown_08376858
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldr r4, [r1]
	add r1, sp, 0x14
	mov r0, sp
	adds r2, r4, 0
	movs r3, 0
	bl sub_80460C8
	subs r4, 0x4
	ldr r1, _0806E96C @ =0x00003109
	adds r0, r1, 0
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	strh r0, [r4, 0x2]
	adds r1, 0x1
	adds r0, r1, 0
	strh r0, [r4, 0x10]
	add sp, 0x18
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E964: .4byte 0xffff8000
_0806E968: .4byte gUnknown_08376858
_0806E96C: .4byte 0x00003109
	thumb_func_end sub_806E574

	thumb_func_start sub_806E630
sub_806E630: @ 806E970
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_806E574
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E630

	thumb_func_start sub_806E674
sub_806E674: @ 806E9B4
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0806EA00
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0806EA00
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E9EE
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E630
	b _0806EA00
_0806E9EE:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E630
_0806EA00:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E674

	thumb_func_start sub_806E6C8
sub_806E6C8: @ 806EA08
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806EA2C @ =gPlayerParty
_0806EA10:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E674
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806EA10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EA2C: .4byte gPlayerParty
	thumb_func_end sub_806E6C8

	thumb_func_start sub_806E6F0
sub_806E6F0: @ 806EA30
	push {r4,r5,lr}
	sub sp, 0x64
	adds r4, r0, 0
	adds r5, r1, 0
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x64
	bl memcpy
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E6F0

	thumb_func_start sub_806E720
sub_806E720: @ 806EA60
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 21
	adds r0, r3
	ldrb r4, [r0]
	lsls r4, 25
	movs r3, 0x80
	lsls r3, 18
	adds r4, r3
	lsrs r4, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1E
	subs r3, r0
	strb r3, [r1]
	movs r0, 0x14
	subs r0, r4
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806E720

	thumb_func_start sub_806E750
sub_806E750: @ 806EA90
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0xC
	adds r5, r0, 0
	adds r4, r1, 0
	mov r9, r2
	adds r6, r3, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	movs r0, 0x9
	add r0, sp
	mov r8, r0
	adds r0, r5, 0
	add r1, sp, 0x8
	mov r2, r8
	adds r3, r4, 0
	bl sub_806E720
	add r0, sp, 0x8
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	lsls r5, 3
	adds r5, r4
	ldrb r2, [r5, 0x1]
	ldrb r3, [r5]
	mov r4, r9
	str r4, [sp]
	ldr r4, [r5, 0x4]
	str r4, [sp, 0x4]
	bl sub_8089C50
	add r0, sp, 0x8
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	ldrb r2, [r0]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r5]
	str r6, [sp]
	ldrb r0, [r5, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	bl InitMenu
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E750

	thumb_func_start sub_806E7D0
sub_806E7D0: @ 806EB10
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	adds r5, 0x1
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_806E720
	mov r0, sp
	ldrb r0, [r0]
	ldrb r1, [r5]
	lsls r4, 3
	adds r4, r6
	ldrb r2, [r4, 0x1]
	adds r2, r0, r2
	lsls r2, 24
	lsrs r2, 24
	ldrb r3, [r4]
	lsls r3, 1
	adds r3, r1, r3
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	bl sub_8072DEC
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E7D0

	thumb_func_start sub_806E81C
sub_806E81C: @ 806EB5C
	lsls r0, 24
	lsls r3, 24
	lsrs r3, 24
	lsrs r0, 21
	adds r0, r1
	ldr r0, [r0, 0x4]
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, r2
	ldr r0, [r0, 0x4]
	bx lr
	thumb_func_end sub_806E81C

	thumb_func_start sub_806E834
sub_806E834: @ 806EB74
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r1, _0806EBB8 @ =gUnknown_0202E8F6
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r0, _0806EBBC @ =sub_806E884
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806EBC0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806EBB8: .4byte gUnknown_0202E8F6
_0806EBBC: .4byte sub_806E884
_0806EBC0: .4byte gTasks
	thumb_func_end sub_806E834

	thumb_func_start sub_806E884
sub_806E884: @ 806EBC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0806EC00
	ldr r1, _0806EC08 @ =gUnknown_0202E8F6
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0806EC0C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0806EBFA
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_0806EBFA:
	adds r0, r5, 0
	bl DestroyTask
_0806EC00:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC08: .4byte gUnknown_0202E8F6
_0806EC0C: .4byte gTasks
	thumb_func_end sub_806E884

	thumb_func_start sub_806E8D0
sub_806E8D0: @ 806EC10
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r4, _0806EC3C @ =0x0201c000
	str r2, [r4, 0x10]
	strb r0, [r4, 0x4]
	bl sub_806CA38
	strb r0, [r4, 0x5]
	strh r5, [r4, 0x6]
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0806EC40 @ =gPlayerParty
	adds r0, r1
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC3C: .4byte 0x0201c000
_0806EC40: .4byte gPlayerParty
	thumb_func_end sub_806E8D0

	thumb_func_start sub_806E904
sub_806E904: @ 806EC44
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EC7C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80A2BC4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0806EC70
	movs r0, 0x1
	b _0806EC98
_0806EC70:
	ldr r1, _0806EC78 @ =gUnknown_0202E8F4
	movs r0, 0x2
	b _0806EC80
	.align 2, 0
_0806EC78: .4byte gUnknown_0202E8F4
_0806EC7C:
	ldr r1, _0806ECA0 @ =gUnknown_0202E8F4
	movs r0, 0x1
_0806EC80:
	strb r0, [r1]
	mov r0, sp
	strb r4, [r0]
	mov r1, sp
	lsrs r0, r4, 8
	strb r0, [r1, 0x1]
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	movs r0, 0
_0806EC98:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806ECA0: .4byte gUnknown_0202E8F4
	thumb_func_end sub_806E904

	thumb_func_start sub_806E964
sub_806E964: @ 806ECA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	mov r9, r5
	ldr r2, _0806ED14 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r6, r1, r2
	ldr r1, _0806ED18 @ =TaskDummy
	str r1, [r6]
	adds r1, r5, 0
	mov r2, r8
	bl sub_806E8D0
	ldr r4, _0806ED1C @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r2, r0, 16
	adds r7, r2, 0
	ldr r1, _0806ED20 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0806ED24 @ =gUnknown_0202E8F8
	mov r10, r0
	movs r0, 0
	mov r1, r10
	strh r0, [r1]
	cmp r2, 0
	beq _0806ED84
	adds r0, r2, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806ED30
	ldr r0, _0806ED28 @ =gOtherText_MailMustBeRemoved
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806ED2C @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
	b _0806EDB8
	.align 2, 0
_0806ED14: .4byte gTasks
_0806ED18: .4byte TaskDummy
_0806ED1C: .4byte 0x0201c000
_0806ED20: .4byte gUnknown_0202E8F4
_0806ED24: .4byte gUnknown_0202E8F8
_0806ED28: .4byte gOtherText_MailMustBeRemoved
_0806ED2C: .4byte party_menu_link_mon_held_item_object
_0806ED30:
	ldr r0, [r4]
	ldr r1, _0806ED70 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0806ED74 @ =gStringVar2
	adds r0, r7, 0
	bl CopyItemName
	ldr r4, _0806ED78 @ =gStringVar4
	ldr r1, _0806ED7C @ =gOtherText_AlreadyHolding
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806ED80 @ =sub_806EBB8
	movs r1, 0x5
	bl CreateTask
	adds r0, r5, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EDB8
	mov r0, r10
	strh r7, [r0]
	b _0806EDB8
	.align 2, 0
_0806ED70: .4byte gStringVar1
_0806ED74: .4byte gStringVar2
_0806ED78: .4byte gStringVar4
_0806ED7C: .4byte gOtherText_AlreadyHolding
_0806ED80: .4byte sub_806EBB8
_0806ED84:
	ldr r0, [r4]
	adds r1, r5, 0
	bl sub_806E904
	adds r0, r5, 0
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r5, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806EDA6
	mov r1, r8
	str r1, [r6]
	b _0806EDB8
_0806EDA6:
	ldrb r0, [r4, 0x5]
	mov r1, r9
	movs r2, 0x1
	bl sub_806EBF0
	ldr r0, _0806EDC8 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
_0806EDB8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDC8: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806E964

	thumb_func_start party_menu_link_mon_held_item_object
party_menu_link_mon_held_item_object: @ 806EDCC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806EE00 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EDFA
	ldr r4, _0806EE04 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DF60
	ldr r2, _0806EE08 @ =gTasks
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r5, 0
	bl DestroyTask
_0806EDFA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE00: .4byte gUnknown_0202E8F6
_0806EE04: .4byte 0x0201c000
_0806EE08: .4byte gTasks
	thumb_func_end party_menu_link_mon_held_item_object

	thumb_func_start sub_806EACC
sub_806EACC: @ 806EE0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806EEB4
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806EE70 @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r5, 0
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806EE9C
	ldr r0, [r4]
	ldrh r1, [r4, 0x6]
	bl sub_806E904
	ldrh r0, [r4, 0x6]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806EE74
	ldrb r0, [r4, 0x5]
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_806EDB4
	b _0806EEDA
	.align 2, 0
_0806EE70: .4byte 0x0201c000
_0806EE74:
	ldrh r0, [r4, 0x6]
	ldr r1, _0806EE90 @ =gStringVar1
	bl CopyItemName
	ldr r4, _0806EE94 @ =gStringVar4
	ldr r1, _0806EE98 @ =gOtherText_TakenAndReplaced
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	b _0806EEDA
	.align 2, 0
_0806EE90: .4byte gStringVar1
_0806EE94: .4byte gStringVar4
_0806EE98: .4byte gOtherText_TakenAndReplaced
_0806EE9C:
	ldr r0, _0806EEB0 @ =gOtherText_BagFullCannotRemoveItem
	movs r1, 0
	bl sub_806E834
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl AddBagItem
	b _0806EEDA
	.align 2, 0
_0806EEB0: .4byte gOtherText_BagFullCannotRemoveItem
_0806EEB4:
	cmp r1, 0x1
	beq _0806EEC0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EEE8
_0806EEC0:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806EECE
	movs r0, 0x5
	bl PlaySE
_0806EECE:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
_0806EEDA:
	ldr r0, _0806EEF0 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EEF4 @ =party_menu_link_mon_held_item_object
	str r0, [r1]
_0806EEE8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EEF0: .4byte gTasks
_0806EEF4: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806EACC

	thumb_func_start sub_806EBB8
sub_806EBB8: @ 806EEF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806EF24 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806EF1E
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806EF28 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806EF2C @ =sub_806EACC
	str r0, [r1]
_0806EF1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF24: .4byte gUnknown_0202E8F6
_0806EF28: .4byte gTasks
_0806EF2C: .4byte sub_806EACC
	thumb_func_end sub_806EBB8

	thumb_func_start sub_806EBF0
sub_806EBF0: @ 806EF30
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806EF70 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0806EF74 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0806EF78 @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _0806EF7C @ =gStringVar4
	ldr r1, _0806EF80 @ =gOtherText_WasGivenToHold
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E834
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF70: .4byte gPlayerParty
_0806EF74: .4byte gStringVar1
_0806EF78: .4byte gStringVar2
_0806EF7C: .4byte gStringVar4
_0806EF80: .4byte gOtherText_WasGivenToHold
	thumb_func_end sub_806EBF0

	thumb_func_start sub_806EC44
sub_806EC44: @ 806EF84
	push {r4,r5,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806EFE0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806EFE4 @ =TaskDummy
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r5, _0806EFE8 @ =0x0201c000
	ldr r0, [r5]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	ldr r2, _0806EFEC @ =gUnknown_0202E8F4
	movs r1, 0
	strb r1, [r2]
	movs r1, 0xF8
	lsls r1, 6
	adds r2, r5, r1
	ldrb r1, [r2]
	adds r1, 0x6
	ldrb r2, [r2, 0x2]
	adds r1, r2
	lsls r2, r1, 3
	adds r2, r1
	lsls r2, 2
	ldr r1, _0806EFF0 @ =0x02028280
	adds r4, r2, r1
	cmp r0, 0
	beq _0806EFFC
	ldr r0, _0806EFF4 @ =gOtherText_PokeHoldingItemCantMail
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806EFF8 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
	b _0806F01A
	.align 2, 0
_0806EFE0: .4byte gTasks
_0806EFE4: .4byte TaskDummy
_0806EFE8: .4byte 0x0201c000
_0806EFEC: .4byte gUnknown_0202E8F4
_0806EFF0: .4byte 0x02028280
_0806EFF4: .4byte gOtherText_PokeHoldingItemCantMail
_0806EFF8: .4byte party_menu_link_mon_held_item_object
_0806EFFC:
	ldr r0, [r5]
	adds r1, r4, 0
	bl sub_80A2D88
	adds r0, r4, 0
	bl sub_80A2B40
	ldr r0, _0806F020 @ =gOtherText_MailTransferredMailbox
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F024 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
_0806F01A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F020: .4byte gOtherText_MailTransferredMailbox
_0806F024: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806EC44

	thumb_func_start sub_806ECE8
sub_806ECE8: @ 806F028
	push {r4-r6,lr}
	sub sp, 0x4
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806F078 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806F07C @ =TaskDummy
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r5, _0806F080 @ =0x0201c000
	ldr r0, [r5]
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, r4, 0
	cmp r4, 0
	bne _0806F090
	ldr r4, _0806F084 @ =gStringVar4
	ldr r1, _0806F088 @ =gOtherText_NotHoldingAnything
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0
	bl sub_806E834
	ldr r0, _0806F08C @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
	b _0806F0E2
	.align 2, 0
_0806F078: .4byte gTasks
_0806F07C: .4byte TaskDummy
_0806F080: .4byte 0x0201c000
_0806F084: .4byte gStringVar4
_0806F088: .4byte gOtherText_NotHoldingAnything
_0806F08C: .4byte party_menu_link_mon_held_item_object
_0806F090:
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0, 0x1]
	adds r0, r4, 0
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806F0D2
	adds r0, r4, 0
	bl itemid_is_mail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806F0BC
	ldr r0, [r5]
	bl sub_80A2DF8
_0806F0BC:
	ldrb r0, [r5, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl sub_806EDB4
	ldr r0, [r5]
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	b _0806F0DA
_0806F0D2:
	ldr r0, _0806F0EC @ =gOtherText_BagFullCannotRemoveItem
	movs r1, 0
	bl sub_806E834
_0806F0DA:
	ldr r0, _0806F0F0 @ =party_menu_link_mon_held_item_object
	movs r1, 0x5
	bl CreateTask
_0806F0E2:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0EC: .4byte gOtherText_BagFullCannotRemoveItem
_0806F0F0: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806ECE8

	thumb_func_start sub_806EDB4
sub_806EDB4: @ 806F0F4
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806F134 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0806F138 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _0806F13C @ =gStringVar2
	adds r0, r4, 0
	bl CopyItemName
	ldr r4, _0806F140 @ =gStringVar4
	ldr r1, _0806F144 @ =gOtherText_ReceivedTheThingFrom
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E834
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F134: .4byte gPlayerParty
_0806F138: .4byte gStringVar1
_0806F13C: .4byte gStringVar2
_0806F140: .4byte gStringVar4
_0806F144: .4byte gOtherText_ReceivedTheThingFrom
	thumb_func_end sub_806EDB4

	thumb_func_start sub_806EE08
sub_806EE08: @ 806F148
	push {r4,lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806F188 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _0806F18C @ =TaskDummy
	str r3, [r1]
	movs r1, 0
	bl sub_806E8D0
	ldr r4, _0806F190 @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0xC
	bl GetMonData
	strh r0, [r4, 0x6]
	ldr r0, _0806F194 @ =gOtherText_SendRemovedMailPrompt
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F198 @ =sub_806EFEC
	movs r1, 0x5
	bl CreateTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F188: .4byte gTasks
_0806F18C: .4byte TaskDummy
_0806F190: .4byte 0x0201c000
_0806F194: .4byte gOtherText_SendRemovedMailPrompt
_0806F198: .4byte sub_806EFEC
	thumb_func_end sub_806EE08

	thumb_func_start sub_806EE5C
sub_806EE5C: @ 806F19C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F1F0
	ldr r5, _0806F1D0 @ =0x0201c000
	ldrh r0, [r5, 0x6]
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806F1D8
	ldr r0, [r5]
	bl sub_80A2DF8
	ldr r0, _0806F1D4 @ =gOtherText_MailTaken
	movs r1, 0
	bl sub_806E834
	b _0806F1E0
	.align 2, 0
_0806F1D0: .4byte 0x0201c000
_0806F1D4: .4byte gOtherText_MailTaken
_0806F1D8:
	ldr r0, _0806F1EC @ =gOtherText_BagFullCannotRemoveItem
	movs r1, 0
	bl sub_806E834
_0806F1E0:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	b _0806F21E
	.align 2, 0
_0806F1EC: .4byte gOtherText_BagFullCannotRemoveItem
_0806F1F0:
	cmp r1, 0x1
	beq _0806F1FC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F230
_0806F1FC:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F20A
	movs r0, 0x5
	bl PlaySE
_0806F20A:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
_0806F21E:
	bl MenuZeroFillWindowRect
	ldr r0, _0806F238 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F23C @ =party_menu_link_mon_held_item_object
	str r0, [r1]
_0806F230:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F238: .4byte gTasks
_0806F23C: .4byte party_menu_link_mon_held_item_object
	thumb_func_end sub_806EE5C

	thumb_func_start sub_806EF00
sub_806EF00: @ 806F240
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F26C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F266
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F270 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F274 @ =sub_806EE5C
	str r0, [r1]
_0806F266:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F26C: .4byte gUnknown_0202E8F6
_0806F270: .4byte gTasks
_0806F274: .4byte sub_806EE5C
	thumb_func_end sub_806EF00

	thumb_func_start sub_806EF38
sub_806EF38: @ 806F278
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F2DC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F2B0 @ =0x0201c000
	ldr r0, [r0]
	bl sub_80A2E78
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806F2B8
	ldr r0, _0806F2B4 @ =gOtherText_MailWasSent
	movs r1, 0
	bl sub_806E834
	b _0806F2C0
	.align 2, 0
_0806F2B0: .4byte 0x0201c000
_0806F2B4: .4byte gOtherText_MailWasSent
_0806F2B8:
	ldr r0, _0806F2D0 @ =gOtherText_MailboxIsFull
	movs r1, 0
	bl sub_806E834
_0806F2C0:
	ldr r0, _0806F2D4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F2D8 @ =party_menu_link_mon_held_item_object
	str r0, [r1]
	b _0806F318
	.align 2, 0
_0806F2D0: .4byte gOtherText_MailboxIsFull
_0806F2D4: .4byte gTasks
_0806F2D8: .4byte party_menu_link_mon_held_item_object
_0806F2DC:
	cmp r1, 0x1
	beq _0806F2E8
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F318
_0806F2E8:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F2F6
	movs r0, 0x5
	bl PlaySE
_0806F2F6:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F320 @ =gOtherText_MailRemovedMessageLost
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F324 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F328 @ =sub_806EF00
	str r1, [r0]
_0806F318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F320: .4byte gOtherText_MailRemovedMessageLost
_0806F324: .4byte gTasks
_0806F328: .4byte sub_806EF00
	thumb_func_end sub_806EF38

	thumb_func_start sub_806EFEC
sub_806EFEC: @ 806F32C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F358 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F352
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F35C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F360 @ =sub_806EF38
	str r0, [r1]
_0806F352:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F358: .4byte gUnknown_0202E8F6
_0806F35C: .4byte gTasks
_0806F360: .4byte sub_806EF38
	thumb_func_end sub_806EFEC

	thumb_func_start ItemIdToBattleMoveId
ItemIdToBattleMoveId: @ 806F364
	lsls r0, 16
	ldr r1, _0806F374 @ =0xfedf0000
	adds r0, r1
	ldr r1, _0806F378 @ =gUnknown_08376504
	lsrs r0, 15
	adds r0, r1
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0806F374: .4byte 0xfedf0000
_0806F378: .4byte gUnknown_08376504
	thumb_func_end ItemIdToBattleMoveId

	thumb_func_start pokemon_has_move
pokemon_has_move: @ 806F37C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
_0806F386:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	bl GetMonData
	cmp r0, r5
	bne _0806F398
	movs r0, 0x1
	b _0806F3A4
_0806F398:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0806F386
	movs r0, 0
_0806F3A4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end pokemon_has_move

	thumb_func_start sub_806F06C
sub_806F06C: @ 806F3AC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806F3E8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F3EC @ =TaskDummy
	str r1, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_806E8D0
	ldr r0, _0806F3F0 @ =sub_806F0B4
	movs r1, 0x5
	bl CreateTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F3E8: .4byte gTasks
_0806F3EC: .4byte TaskDummy
_0806F3F0: .4byte sub_806F0B4
	thumb_func_end sub_806F06C

	thumb_func_start sub_806F0B4
sub_806F0B4: @ 806F3F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, r6, 0
	ldr r5, _0806F454 @ =0x0201c000
	ldr r0, [r5]
	ldr r1, _0806F458 @ =gStringVar1
	bl GetMonNickname
	ldrh r0, [r5, 0x6]
	bl ItemIdToBattleMoveId
	movs r4, 0
	strh r0, [r5, 0x8]
	ldr r0, _0806F45C @ =gStringVar2
	ldrh r2, [r5, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F460 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r1, _0806F464 @ =0xfffff282
	adds r0, r5, r1
	strh r4, [r0]
	ldr r0, [r5]
	ldrh r1, [r5, 0x8]
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _0806F478
	ldr r4, _0806F468 @ =gStringVar4
	ldr r1, _0806F46C @ =gOtherText_AlreadyKnows
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F470 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F474 @ =party_menu_link_mon_held_item_object
	b _0806F4F6
	.align 2, 0
_0806F454: .4byte 0x0201c000
_0806F458: .4byte gStringVar1
_0806F45C: .4byte gStringVar2
_0806F460: .4byte gMoveNames
_0806F464: .4byte 0xfffff282
_0806F468: .4byte gStringVar4
_0806F46C: .4byte gOtherText_AlreadyKnows
_0806F470: .4byte gTasks
_0806F474: .4byte party_menu_link_mon_held_item_object
_0806F478:
	ldr r0, [r5]
	ldrb r1, [r5, 0x6]
	subs r1, 0x21
	lsls r1, 24
	lsrs r1, 24
	bl CanMonLearnTMHM
	cmp r0, 0
	bne _0806F4BC
	ldr r4, _0806F4AC @ =gStringVar4
	ldr r1, _0806F4B0 @ =gOtherText_NotCompatible
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F4B4 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F4B8 @ =party_menu_link_mon_held_item_object
	b _0806F4F6
	.align 2, 0
_0806F4AC: .4byte gStringVar4
_0806F4B0: .4byte gOtherText_NotCompatible
_0806F4B4: .4byte gTasks
_0806F4B8: .4byte party_menu_link_mon_held_item_object
_0806F4BC:
	ldr r0, [r5]
	ldrh r1, [r5, 0x8]
	bl GiveMoveToMon
	lsls r0, 16
	ldr r1, _0806F4D4 @ =0xffff0000
	cmp r0, r1
	beq _0806F4D8
	adds r0, r6, 0
	bl sub_806F1D0
	b _0806F4F8
	.align 2, 0
_0806F4D4: .4byte 0xffff0000
_0806F4D8:
	ldr r4, _0806F500 @ =gStringVar4
	ldr r1, _0806F504 @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F508 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F50C @ =sub_806F358
_0806F4F6:
	str r1, [r0]
_0806F4F8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F500: .4byte gStringVar4
_0806F504: .4byte gOtherText_WantsToLearn
_0806F508: .4byte gTasks
_0806F50C: .4byte sub_806F358
	thumb_func_end sub_806F0B4

	thumb_func_start sub_806F1D0
sub_806F1D0: @ 806F510
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0806F574 @ =gStringVar2
	ldr r5, _0806F578 @ =0x0201c000
	ldrh r2, [r5, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F57C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F580 @ =gStringVar4
	ldr r1, _0806F584 @ =gOtherText_LearnedMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, [r5]
	movs r1, 0x4
	bl AdjustFriendship
	ldr r1, _0806F588 @ =0xfffff282
	adds r0, r5, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0806F560
	ldrh r1, [r5, 0x6]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bhi _0806F560
	adds r0, r1, 0
	movs r1, 0x1
	bl RemoveBagItem
_0806F560:
	ldr r0, _0806F58C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F590 @ =sub_806F254
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F574: .4byte gStringVar2
_0806F578: .4byte 0x0201c000
_0806F57C: .4byte gMoveNames
_0806F580: .4byte gStringVar4
_0806F584: .4byte gOtherText_LearnedMove
_0806F588: .4byte 0xfffff282
_0806F58C: .4byte gTasks
_0806F590: .4byte sub_806F254
	thumb_func_end sub_806F1D0

	thumb_func_start sub_806F254
sub_806F254: @ 806F594
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F5BC @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F5B6
	ldr r0, _0806F5C0 @ =0x0000016f
	bl PlayFanfare
	ldr r1, _0806F5C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F5C8 @ =sub_806F28C
	str r1, [r0]
_0806F5B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F5BC: .4byte gUnknown_0202E8F6
_0806F5C0: .4byte 0x0000016f
_0806F5C4: .4byte gTasks
_0806F5C8: .4byte sub_806F28C
	thumb_func_end sub_806F254

	thumb_func_start sub_806F28C
sub_806F28C: @ 806F5CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _0806F632
	ldr r0, _0806F610 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0806F5F2
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806F632
_0806F5F2:
	ldr r4, _0806F614 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DF60
	ldr r1, _0806F618 @ =0xfffff282
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _0806F61C
	adds r0, r5, 0
	bl sub_8070C54
	b _0806F632
	.align 2, 0
_0806F610: .4byte gMain
_0806F614: .4byte 0x0201c000
_0806F618: .4byte 0xfffff282
_0806F61C:
	ldr r2, _0806F638 @ =gTasks
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
_0806F632:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F638: .4byte gTasks
	thumb_func_end sub_806F28C

	thumb_func_start sub_806F2FC
sub_806F2FC: @ 806F63C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	ldr r0, _0806F66C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F68E
	ldr r4, _0806F670 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DF60
	ldr r1, _0806F674 @ =0xfffff282
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _0806F678
	adds r0, r5, 0
	bl sub_8070C54
	b _0806F68E
	.align 2, 0
_0806F66C: .4byte gUnknown_0202E8F6
_0806F670: .4byte 0x0201c000
_0806F674: .4byte 0xfffff282
_0806F678:
	ldr r2, _0806F694 @ =gTasks
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r4, 0x10]
	str r1, [r0]
	adds r0, r6, 0
	bl DestroyTask
_0806F68E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F694: .4byte gTasks
	thumb_func_end sub_806F2FC

	thumb_func_start sub_806F358
sub_806F358: @ 806F698
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F6C4 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F6BE
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F6C8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F6CC @ =sub_806F390
	str r0, [r1]
_0806F6BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F6C4: .4byte gUnknown_0202E8F6
_0806F6C8: .4byte gTasks
_0806F6CC: .4byte sub_806F390
	thumb_func_end sub_806F358

	thumb_func_start sub_806F390
sub_806F390: @ 806F6D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806F714
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F708 @ =gOtherText_WhichMoveToForget2
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F70C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F710 @ =sub_806F44C
	str r1, [r0]
	b _0806F734
	.align 2, 0
_0806F708: .4byte gOtherText_WhichMoveToForget2
_0806F70C: .4byte gTasks
_0806F710: .4byte sub_806F44C
_0806F714:
	cmp r1, 0x1
	beq _0806F720
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F734
_0806F720:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806F72E
	movs r0, 0x5
	bl PlaySE
_0806F72E:
	adds r0, r5, 0
	bl sub_806F614
_0806F734:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806F390

	thumb_func_start sub_806F3FC
sub_806F3FC: @ 806F73C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806F778 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F770
	ldr r0, _0806F77C @ =gPlayerParty
	ldr r4, _0806F780 @ =0x0201c000
	ldrb r1, [r4, 0x5]
	ldr r2, _0806F784 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806F788 @ =sub_808B564
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl sub_809D9F0
	adds r0, r5, 0
	bl DestroyTask
_0806F770:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F778: .4byte gPaletteFade
_0806F77C: .4byte gPlayerParty
_0806F780: .4byte 0x0201c000
_0806F784: .4byte gPlayerPartyCount
_0806F788: .4byte sub_808B564
	thumb_func_end sub_806F3FC

	thumb_func_start sub_806F44C
sub_806F44C: @ 806F78C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F7C4 @ =gUnknown_0202E8F6
	ldrb r1, [r0]
	cmp r1, 0
	bne _0806F7BA
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0806F7C8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F7CC @ =sub_806F3FC
	str r1, [r0]
_0806F7BA:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F7C4: .4byte gUnknown_0202E8F6
_0806F7C8: .4byte gTasks
_0806F7CC: .4byte sub_806F3FC
	thumb_func_end sub_806F44C

	thumb_func_start sub_806F490
sub_806F490: @ 806F7D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0806F84C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F846
	ldr r1, _0806F850 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F854 @ =TaskDummy
	str r1, [r0]
	ldr r0, _0806F858 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0806F85C @ =sub_808B508
	adds r0, r3, 0
	bl sub_806E8D0
	bl sub_809FA30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r5, _0806F860 @ =0x0201c000
	ldr r0, [r5]
	adds r1, 0xD
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, [r5]
	ldr r1, _0806F864 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806F868 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _0806F86C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F870 @ =gStringVar4
	ldr r1, _0806F874 @ =gOtherText_ForgetMove123_2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F878 @ =sub_806F53C
	movs r1, 0x5
	bl CreateTask
_0806F846:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F84C: .4byte gPaletteFade
_0806F850: .4byte gTasks
_0806F854: .4byte TaskDummy
_0806F858: .4byte gScriptItemId
_0806F85C: .4byte sub_808B508
_0806F860: .4byte 0x0201c000
_0806F864: .4byte gStringVar1
_0806F868: .4byte gStringVar2
_0806F86C: .4byte gMoveNames
_0806F870: .4byte gStringVar4
_0806F874: .4byte gOtherText_ForgetMove123_2
_0806F878: .4byte sub_806F53C
	thumb_func_end sub_806F490

	thumb_func_start sub_806F53C
sub_806F53C: @ 806F87C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0806F8C0 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F8BA
	ldr r4, _0806F8C4 @ =0x0201c000
	ldr r5, [r4]
	bl sub_809FA30
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl RemoveMonPPBonus
	ldr r5, [r4]
	ldrh r4, [r4, 0x8]
	bl sub_809FA30
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl SetMonMoveSlot
	adds r0, r6, 0
	bl sub_806F1D0
_0806F8BA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F8C0: .4byte gUnknown_0202E8F6
_0806F8C4: .4byte 0x0201c000
	thumb_func_end sub_806F53C

	thumb_func_start sub_806F588
sub_806F588: @ 806F8C8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0806F928 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806F920
	ldr r1, _0806F92C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F930 @ =TaskDummy
	str r1, [r0]
	ldr r0, _0806F934 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0806F938 @ =sub_808B508
	adds r0, r3, 0
	bl sub_806E8D0
	ldr r0, _0806F93C @ =gStringVar2
	ldr r1, _0806F940 @ =0x0201c000
	ldrh r2, [r1, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F944 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F948 @ =gStringVar4
	ldr r1, _0806F94C @ =gOtherText_StopTryingTo
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _0806F950 @ =sub_806F67C
	movs r1, 0x5
	bl CreateTask
_0806F920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F928: .4byte gPaletteFade
_0806F92C: .4byte gTasks
_0806F930: .4byte TaskDummy
_0806F934: .4byte gScriptItemId
_0806F938: .4byte sub_808B508
_0806F93C: .4byte gStringVar2
_0806F940: .4byte 0x0201c000
_0806F944: .4byte gMoveNames
_0806F948: .4byte gStringVar4
_0806F94C: .4byte gOtherText_StopTryingTo
_0806F950: .4byte sub_806F67C
	thumb_func_end sub_806F588

	thumb_func_start sub_806F614
sub_806F614: @ 806F954
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0806F9A0 @ =gStringVar2
	ldr r1, _0806F9A4 @ =0x0201c000
	ldrh r2, [r1, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806F9A8 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806F9AC @ =gStringVar4
	ldr r1, _0806F9B0 @ =gOtherText_StopTryingTo
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806F9B4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806F9B8 @ =sub_806F67C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F9A0: .4byte gStringVar2
_0806F9A4: .4byte 0x0201c000
_0806F9A8: .4byte gMoveNames
_0806F9AC: .4byte gStringVar4
_0806F9B0: .4byte gOtherText_StopTryingTo
_0806F9B4: .4byte gTasks
_0806F9B8: .4byte sub_806F67C
	thumb_func_end sub_806F614

	thumb_func_start sub_806F67C
sub_806F67C: @ 806F9BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806F9E8 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806F9E2
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _0806F9EC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806F9F0 @ =sub_806F6B4
	str r0, [r1]
_0806F9E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F9E8: .4byte gUnknown_0202E8F6
_0806F9EC: .4byte gTasks
_0806F9F0: .4byte sub_806F6B4
	thumb_func_end sub_806F67C

	thumb_func_start sub_806F6B4
sub_806F6B4: @ 806F9F4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0806FA70
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806FA50 @ =0x0201c000
	ldr r0, [r4]
	ldr r1, _0806FA54 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806FA58 @ =gStringVar2
	ldrh r2, [r4, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806FA5C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806FA60 @ =gStringVar4
	ldr r1, _0806FA64 @ =gOtherText_DidNotLearnMove2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806FA68 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806FA6C @ =sub_806F2FC
	b _0806FACE
	.align 2, 0
_0806FA50: .4byte 0x0201c000
_0806FA54: .4byte gStringVar1
_0806FA58: .4byte gStringVar2
_0806FA5C: .4byte gMoveNames
_0806FA60: .4byte gStringVar4
_0806FA64: .4byte gOtherText_DidNotLearnMove2
_0806FA68: .4byte gTasks
_0806FA6C: .4byte sub_806F2FC
_0806FA70:
	cmp r1, 0x1
	beq _0806FA7C
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806FAD0
_0806FA7C:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0806FA8A
	movs r0, 0x5
	bl PlaySE
_0806FA8A:
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1D
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _0806FAD8 @ =0x0201c000
	ldr r0, [r4]
	ldr r1, _0806FADC @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806FAE0 @ =gStringVar2
	ldrh r2, [r4, 0x8]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _0806FAE4 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0806FAE8 @ =gStringVar4
	ldr r1, _0806FAEC @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _0806FAF0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806FAF4 @ =sub_806F358
_0806FACE:
	str r1, [r0]
_0806FAD0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806FAD8: .4byte 0x0201c000
_0806FADC: .4byte gStringVar1
_0806FAE0: .4byte gStringVar2
_0806FAE4: .4byte gMoveNames
_0806FAE8: .4byte gStringVar4
_0806FAEC: .4byte gOtherText_WantsToLearn
_0806FAF0: .4byte gTasks
_0806FAF4: .4byte sub_806F358
	thumb_func_end sub_806F6B4

	thumb_func_start sub_806F7B8
sub_806F7B8: @ 806FAF8
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	ldr r3, _0806FB14 @ =gUnknown_08376504
_0806FB02:
	adds r0, r1, 0
	adds r0, 0x32
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _0806FB18
	movs r0, 0x1
	b _0806FB24
	.align 2, 0
_0806FB14: .4byte gUnknown_08376504
_0806FB18:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _0806FB02
	movs r0, 0
_0806FB24:
	pop {r1}
	bx r1
	thumb_func_end sub_806F7B8

	thumb_func_start sub_806F7E8
sub_806F7E8: @ 806FB28
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	ldr r0, _0806FBD8 @ =0x03004b38
	adds r3, r0
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	str r1, [r5]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	str r0, [r5, 0x4]
	movs r4, 0x18
	ldrsh r0, [r3, r4]
	lsls r2, 24
	asrs r2, 24
	muls r0, r2
	str r0, [r5, 0x8]
	movs r0, 0x80
	lsls r0, 1
	str r0, [r5, 0x10]
	ldr r6, _0806FBDC @ =0x0201b000
	ldr r2, _0806FBE0 @ =0x00000282
	adds r0, r6, r2
	movs r4, 0
	ldrsh r0, [r0, r4]
	bl GetHPBarLevel
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r2, 0x2
	bls _0806FB7E
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806FB7E:
	cmp r2, 0x2
	bne _0806FB90
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x5
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806FB90:
	cmp r3, 0x1
	bhi _0806FBA2
	ldrb r0, [r5, 0xC]
	movs r1, 0x20
	negs r1, r1
	ands r1, r0
	movs r0, 0x6
	orrs r1, r0
	strb r1, [r5, 0xC]
_0806FBA2:
	ldr r4, _0806FBE4 @ =gUnknown_08376858
	bl battle_type_is_double
	movs r2, 0x80
	lsls r2, 5
	adds r1, r6, r2
	ldrb r2, [r1, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r4
	ldr r2, [r2]
	ldr r4, _0806FBE8 @ =0x0000100c
	adds r1, r6, r4
	adds r0, r5, 0
	movs r3, 0
	bl sub_80460C8
	lsls r0, 16
	asrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806FBD8: .4byte 0x03004b38
_0806FBDC: .4byte 0x0201b000
_0806FBE0: .4byte 0x00000282
_0806FBE4: .4byte gUnknown_08376858
_0806FBE8: .4byte 0x0000100c
	thumb_func_end sub_806F7E8

	thumb_func_start sub_806F8AC
sub_806F8AC: @ 806FBEC
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0x1
	negs r4, r4
	adds r0, r6, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_806F7E8
	ldr r1, _0806FC34 @ =0x0201b000
	ldr r2, _0806FC38 @ =0x00000282
	adds r5, r1, r2
	strh r0, [r5]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r4
	beq _0806FC14
	b _0806FD30
_0806FC14:
	movs r0, 0x80
	lsls r0, 5
	adds r1, r0
	movs r0, 0
	str r0, [r1, 0xC]
	ldr r0, [sp, 0x8]
	negs r3, r0
	ldr r2, [sp, 0x4]
	adds r0, r3, r2
	ldr r1, [sp]
	cmp r0, r1
	ble _0806FC3C
	subs r1, r2
	add r0, sp, 0x14
	strh r1, [r0]
	b _0806FC40
	.align 2, 0
_0806FC34: .4byte 0x0201b000
_0806FC38: .4byte 0x00000282
_0806FC3C:
	add r0, sp, 0x14
	strh r3, [r0]
_0806FC40:
	adds r5, r0, 0
	ldr r1, _0806FC80 @ =gUnknown_02024BEC
	ldrh r0, [r5]
	negs r0, r0
	str r0, [r1]
	ldr r0, _0806FC84 @ =0x0201c000
	ldr r0, [r0]
	ldr r1, _0806FC88 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _0806FC8C @ =gStringVar2
	ldrh r1, [r5]
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r2, _0806FC90 @ =gTasks
	lsls r1, r6, 2
	adds r0, r1, r6
	lsls r0, 3
	adds r0, r2
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0
	bne _0806FC9C
	ldr r0, _0806FC94 @ =gStringVar4
	ldr r1, _0806FC98 @ =gOtherText_HPRestoredBy
	bl StringExpandPlaceholders
	b _0806FCA4
	.align 2, 0
_0806FC80: .4byte gUnknown_02024BEC
_0806FC84: .4byte 0x0201c000
_0806FC88: .4byte gStringVar1
_0806FC8C: .4byte gStringVar2
_0806FC90: .4byte gTasks
_0806FC94: .4byte gStringVar4
_0806FC98: .4byte gOtherText_HPRestoredBy
_0806FC9C:
	ldr r0, _0806FD14 @ =gStringVar4
	ldr r1, _0806FD18 @ =gOtherText_RegainedHealth
	bl StringExpandPlaceholders
_0806FCA4:
	ldr r4, _0806FD1C @ =0x0201c000
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl sub_806D84C
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806FD20 @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x7
	bl task_pc_turn_off
	ldr r0, _0806FD24 @ =0xfffff261
	adds r1, r4, r0
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, _0806FD14 @ =gStringVar4
	movs r1, 0x1
	bl sub_806E834
	ldr r1, [sp, 0x4]
	ldrh r0, [r5]
	adds r0, r1
	strh r0, [r5]
	ldr r0, [r4]
	movs r1, 0x39
	adds r2, r5, 0
	bl SetMonData
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	bl sub_8032638
	ldr r1, _0806FD28 @ =gTasks
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806FD2C @ =sub_806FB44
	str r1, [r0]
	b _0806FD50
	.align 2, 0
_0806FD14: .4byte gStringVar4
_0806FD18: .4byte gOtherText_RegainedHealth
_0806FD1C: .4byte 0x0201c000
_0806FD20: .4byte gUnknown_083769A8
_0806FD24: .4byte 0xfffff261
_0806FD28: .4byte gTasks
_0806FD2C: .4byte sub_806FB44
_0806FD30:
	movs r2, 0x80
	lsls r2, 5
	adds r0, r1, r2
	ldrb r4, [r0, 0x5]
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r5]
	ldr r3, [sp]
	lsls r3, 16
	lsrs r3, 16
	adds r0, r4, 0
	bl sub_806E420
_0806FD50:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806F8AC

	thumb_func_start sub_806FA18
sub_806FA18: @ 806FD58
	push {r4-r7,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	mov r1, sp
	movs r2, 0x1
	bl sub_806F7E8
	ldr r6, _0806FE04 @ =0x0201b000
	ldr r1, _0806FE08 @ =0x00000282
	adds r7, r6, r1
	strh r0, [r7]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0806FE24
	movs r0, 0x1
	bl PlaySE
	movs r0, 0x80
	lsls r0, 5
	adds r4, r6, r0
	movs r0, 0
	str r0, [r4, 0xC]
	ldr r2, _0806FE0C @ =gTasks
	lsls r3, r5, 2
	adds r3, r5
	lsls r3, 3
	adds r5, r3, r2
	ldrh r0, [r5, 0x1E]
	ldrh r1, [r5, 0x20]
	subs r0, r1
	strh r0, [r5, 0x1E]
	ldr r0, [r4]
	adds r2, r3
	adds r2, 0x1E
	movs r1, 0x39
	bl SetMonData
	ldrb r0, [r4, 0x4]
	ldr r1, _0806FE10 @ =0xfffe6000
	adds r6, r1
	ldrb r1, [r6, 0x1]
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl sub_806D84C
	ldr r2, _0806FE14 @ =gSprites
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0806FE18 @ =gPlayerParty
	adds r0, r1
	str r0, [r4]
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r5, 0x1C]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5, 0x1E]
	ldr r0, _0806FE1C @ =0xffff8000
	str r0, [r4, 0xC]
	ldr r0, [r4, 0x10]
	str r0, [r4, 0x14]
	ldr r0, _0806FE20 @ =sub_806F8AC
	str r0, [r5]
	ldrh r0, [r5, 0x1E]
	strh r0, [r7]
	b _0806FE44
	.align 2, 0
_0806FE04: .4byte 0x0201b000
_0806FE08: .4byte 0x00000282
_0806FE0C: .4byte gTasks
_0806FE10: .4byte 0xfffe6000
_0806FE14: .4byte gSprites
_0806FE18: .4byte gPlayerParty
_0806FE1C: .4byte 0xffff8000
_0806FE20: .4byte sub_806F8AC
_0806FE24:
	movs r1, 0x80
	lsls r1, 5
	adds r0, r6, r1
	ldrb r4, [r0, 0x5]
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r7]
	ldr r3, [sp]
	lsls r3, 16
	lsrs r3, 16
	adds r0, r4, 0
	bl sub_806E420
_0806FE44:
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806FA18

	thumb_func_start sub_806FB0C
sub_806FB0C: @ 806FE4C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806FE78 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806FE72
	ldr r3, _0806FE7C @ =gTasks
	ldr r2, _0806FE80 @ =0x0201c000
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r2, 0x10]
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyTask
_0806FE72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE78: .4byte gUnknown_0202E8F6
_0806FE7C: .4byte gTasks
_0806FE80: .4byte 0x0201c000
	thumb_func_end sub_806FB0C

	thumb_func_start sub_806FB44
sub_806FB44: @ 806FE84
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806FEB0 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0806FEAA
	ldr r3, _0806FEB4 @ =gTasks
	ldr r2, _0806FEB8 @ =0x0201c000
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r2, 0x14]
	str r1, [r0]
	adds r0, r4, 0
	bl DestroyTask
_0806FEAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FEB0: .4byte gUnknown_0202E8F6
_0806FEB4: .4byte gTasks
_0806FEB8: .4byte 0x0201c000
	thumb_func_end sub_806FB44

	thumb_func_start sub_806FB7C
sub_806FB7C: @ 806FEBC
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0806FED0
	ldr r0, _0806FECC @ =0x02028daa
	b _0806FEDA
	.align 2, 0
_0806FECC: .4byte 0x02028daa
_0806FED0:
	ldr r1, _0806FEE8 @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0806FEDA:
	ldrb r1, [r0, 0x4]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0806FEEC
	movs r0, 0
	b _0806FEEE
	.align 2, 0
_0806FEE8: .4byte gItemEffectTable
_0806FEEC:
	movs r0, 0x1
_0806FEEE:
	pop {r1}
	bx r1
	thumb_func_end sub_806FB7C

	thumb_func_start sub_806FBB4
sub_806FBB4: @ 806FEF4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_806E168
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E2C0
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806FBB4

	thumb_func_start GetMedicineItemEffectMessage
GetMedicineItemEffectMessage: @ 806FF10
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x3
	cmp r0, 0x12
	bls _0806FF26
	b _080700BC
_0806FF26:
	lsls r0, 2
	ldr r1, _0806FF30 @ =_0806FF34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FF30: .4byte _0806FF34
	.align 2, 0
_0806FF34:
	.4byte _0806FF80
	.4byte _0806FF94
	.4byte _0806FFA8
	.4byte _0806FFBC
	.4byte _0806FFD0
	.4byte _0806FFE4
	.4byte _0806FFF8
	.4byte _080700BC
	.4byte _0807000C
	.4byte _08070030
	.4byte _08070020
	.4byte _08070060
	.4byte _08070070
	.4byte _08070050
	.4byte _08070040
	.4byte _080700BC
	.4byte _08070094
	.4byte _08070094
	.4byte _080700A8
_0806FF80:
	ldr r0, _0806FF8C @ =gStringVar4
	ldr r1, _0806FF90 @ =gOtherText_CuredPoisoning
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_0806FF8C: .4byte gStringVar4
_0806FF90: .4byte gOtherText_CuredPoisoning
_0806FF94:
	ldr r0, _0806FFA0 @ =gStringVar4
	ldr r1, _0806FFA4 @ =gOtherText_WokeUp
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_0806FFA0: .4byte gStringVar4
_0806FFA4: .4byte gOtherText_WokeUp
_0806FFA8:
	ldr r0, _0806FFB4 @ =gStringVar4
	ldr r1, _0806FFB8 @ =gOtherText_BurnHealed
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_0806FFB4: .4byte gStringVar4
_0806FFB8: .4byte gOtherText_BurnHealed
_0806FFBC:
	ldr r0, _0806FFC8 @ =gStringVar4
	ldr r1, _0806FFCC @ =gOtherText_ThawedOut
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_0806FFC8: .4byte gStringVar4
_0806FFCC: .4byte gOtherText_ThawedOut
_0806FFD0:
	ldr r0, _0806FFDC @ =gStringVar4
	ldr r1, _0806FFE0 @ =gOtherText_CuredParalysis
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_0806FFDC: .4byte gStringVar4
_0806FFE0: .4byte gOtherText_CuredParalysis
_0806FFE4:
	ldr r0, _0806FFF0 @ =gStringVar4
	ldr r1, _0806FFF4 @ =gOtherText_SnapConfusion
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_0806FFF0: .4byte gStringVar4
_0806FFF4: .4byte gOtherText_SnapConfusion
_0806FFF8:
	ldr r0, _08070004 @ =gStringVar4
	ldr r1, _08070008 @ =gOtherText_GotOverLove
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_08070004: .4byte gStringVar4
_08070008: .4byte gOtherText_GotOverLove
_0807000C:
	ldr r0, _08070018 @ =gStringVar4
	ldr r1, _0807001C @ =gOtherText_BecameHealthy
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_08070018: .4byte gStringVar4
_0807001C: .4byte gOtherText_BecameHealthy
_08070020:
	ldr r0, _08070028 @ =gStringVar2
	ldr r1, _0807002C @ =gOtherText_Hp2
	b _08070074
	.align 2, 0
_08070028: .4byte gStringVar2
_0807002C: .4byte gOtherText_Hp2
_08070030:
	ldr r0, _08070038 @ =gStringVar2
	ldr r1, _0807003C @ =gOtherText_Attack
	b _08070074
	.align 2, 0
_08070038: .4byte gStringVar2
_0807003C: .4byte gOtherText_Attack
_08070040:
	ldr r0, _08070048 @ =gStringVar2
	ldr r1, _0807004C @ =gOtherText_Defense
	b _08070074
	.align 2, 0
_08070048: .4byte gStringVar2
_0807004C: .4byte gOtherText_Defense
_08070050:
	ldr r0, _08070058 @ =gStringVar2
	ldr r1, _0807005C @ =gOtherText_Speed
	b _08070074
	.align 2, 0
_08070058: .4byte gStringVar2
_0807005C: .4byte gOtherText_Speed
_08070060:
	ldr r0, _08070068 @ =gStringVar2
	ldr r1, _0807006C @ =gOtherText_SpAtk2
	b _08070074
	.align 2, 0
_08070068: .4byte gStringVar2
_0807006C: .4byte gOtherText_SpAtk2
_08070070:
	ldr r0, _08070084 @ =gStringVar2
	ldr r1, _08070088 @ =gOtherText_SpDef2
_08070074:
	bl StringCopy
	ldr r0, _0807008C @ =gStringVar4
	ldr r1, _08070090 @ =gOtherText_WasRaised
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_08070084: .4byte gStringVar2
_08070088: .4byte gOtherText_SpDef2
_0807008C: .4byte gStringVar4
_08070090: .4byte gOtherText_WasRaised
_08070094:
	ldr r0, _080700A0 @ =gStringVar4
	ldr r1, _080700A4 @ =gOtherText_PPIncreased
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_080700A0: .4byte gStringVar4
_080700A4: .4byte gOtherText_PPIncreased
_080700A8:
	ldr r0, _080700B4 @ =gStringVar4
	ldr r1, _080700B8 @ =gOtherText_PPRestored
	bl StringExpandPlaceholders
	b _080700C4
	.align 2, 0
_080700B4: .4byte gStringVar4
_080700B8: .4byte gOtherText_PPRestored
_080700BC:
	ldr r0, _080700C8 @ =gStringVar4
	ldr r1, _080700CC @ =gOtherText_WontHaveAnyEffect
	bl StringExpandPlaceholders
_080700C4:
	pop {r0}
	bx r0
	.align 2, 0
_080700C8: .4byte gStringVar4
_080700CC: .4byte gOtherText_WontHaveAnyEffect
	thumb_func_end GetMedicineItemEffectMessage

	thumb_func_start sub_806FD90
sub_806FD90: @ 80700D0
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 16
	lsrs r0, 16
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bne _080700FC
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _080700F8 @ =0x0000012f
	cmp r0, r1
	bne _080700FC
	movs r0, 0x1
	b _080700FE
	.align 2, 0
_080700F8: .4byte 0x0000012f
_080700FC:
	movs r0, 0
_080700FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806FD90

	thumb_func_start ExecuteTableBasedItemEffect__
ExecuteTableBasedItemEffect__: @ 8070104
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _08070130 @ =gMain
	ldr r1, _08070134 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0807013C
	movs r0, 0x64
	muls r0, r3
	ldr r1, _08070138 @ =gPlayerParty
	adds r0, r1
	adds r1, r5, 0
	adds r2, r3, 0
	b _08070156
	.align 2, 0
_08070130: .4byte gMain
_08070134: .4byte 0x0000043d
_08070138: .4byte gPlayerParty
_0807013C:
	movs r0, 0x64
	adds r4, r3, 0
	muls r4, r0
	ldr r0, _08070168 @ =gPlayerParty
	adds r4, r0
	adds r0, r3, 0
	bl sub_8094C20
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
_08070156:
	adds r3, r6, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08070168: .4byte gPlayerParty
	thumb_func_end ExecuteTableBasedItemEffect__

	thumb_func_start sub_806FE2C
sub_806FE2C: @ 807016C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0
	mov r9, r0
	ldr r1, _08070214 @ =gTasks
	mov r10, r1
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r10
	ldr r0, _08070218 @ =TaskDummy
	str r0, [r1]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E8D0
	ldr r5, _0807021C @ =0x0201c000
	ldr r0, [r5]
	adds r1, r6, 0
	bl sub_806FD90
	lsls r0, 24
	cmp r0, 0
	bne _08070220
	adds r0, r6, 0
	bl sub_806FB7C
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, r7, 2
	mov r8, r2
	cmp r0, 0x1
	bne _08070202
	ldr r0, [r5]
	movs r1, 0x3A
	bl GetMonData
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	mov r2, r10
	adds r4, r1, r2
	strh r0, [r4, 0x1C]
	ldr r0, [r5]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r4, 0x1E]
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _08070202
	movs r0, 0
	mov r9, r0
	mov r1, r9
	strh r1, [r4, 0x1C]
	strh r1, [r4, 0x1E]
_08070202:
	ldr r0, _0807021C @ =0x0201c000
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	lsrs r0, 24
	b _08070226
	.align 2, 0
_08070214: .4byte gTasks
_08070218: .4byte TaskDummy
_0807021C: .4byte 0x0201c000
_08070220:
	movs r0, 0x1
	lsls r2, r7, 2
	mov r8, r2
_08070226:
	cmp r0, 0
	beq _08070254
	ldr r1, _08070248 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0807024C @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070250 @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	b _08070342
	.align 2, 0
_08070248: .4byte gUnknown_0202E8F4
_0807024C: .4byte gOtherText_WontHaveAnyEffect
_08070250: .4byte gTasks
_08070254:
	ldr r1, _08070270 @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _08070274
	movs r0, 0x1
	bl PlaySE
	b _0807027A
	.align 2, 0
_08070270: .4byte gUnknown_0202E8F4
_08070274:
	movs r0, 0x75
	bl PlaySE
_0807027A:
	ldr r4, _080702C8 @ =0x0201c000
	ldr r0, [r4]
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _0807028E
	cmp r0, 0
	bne _08070296
_0807028E:
	ldr r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806FBB4
_08070296:
	mov r0, r9
	cmp r0, 0x1
	bne _08070308
	ldr r4, _080702C8 @ =0x0201c000
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	ldr r2, _080702CC @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0x1E]
	subs r0, r1
	strh r0, [r2, 0x20]
	ldr r0, _080702D0 @ =0xffff8000
	str r0, [r4, 0xC]
	movs r1, 0x1E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080702D4
	mov r3, r9
	strh r3, [r2, 0x24]
	b _080702D8
	.align 2, 0
_080702C8: .4byte 0x0201c000
_080702CC: .4byte gTasks
_080702D0: .4byte 0xffff8000
_080702D4:
	movs r0, 0
	strh r0, [r2, 0x24]
_080702D8:
	ldr r2, _080702F8 @ =0x0201c000
	ldr r0, [r2, 0x10]
	str r0, [r2, 0x14]
	ldr r1, _080702FC @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070300 @ =sub_806F8AC
	str r1, [r0]
	ldrh r0, [r0, 0x1E]
	ldr r1, _08070304 @ =0xfffff282
	adds r2, r1
	strh r0, [r2]
	b _0807034A
	.align 2, 0
_080702F8: .4byte 0x0201c000
_080702FC: .4byte gTasks
_08070300: .4byte sub_806F8AC
_08070304: .4byte 0xfffff282
_08070308:
	ldr r4, _08070358 @ =0x0201c000
	ldr r0, [r4]
	ldr r1, _0807035C @ =gStringVar1
	bl GetMonNickname
	adds r0, r6, 0
	bl IsBlueYellowRedFlute
	lsls r0, 24
	cmp r0, 0
	bne _08070326
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
_08070326:
	adds r0, r6, 0
	bl GetMedicineItemEffectMessage
	ldrb r0, [r4, 0x5]
	ldr r1, [r4]
	bl sub_806E07C
	ldr r0, _08070360 @ =gStringVar4
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070364 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
_08070342:
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070368 @ =sub_806FB0C
	str r1, [r0]
_0807034A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070358: .4byte 0x0201c000
_0807035C: .4byte gStringVar1
_08070360: .4byte gStringVar4
_08070364: .4byte gTasks
_08070368: .4byte sub_806FB0C
	thumb_func_end sub_806FE2C

	thumb_func_start IsBlueYellowRedFlute
IsBlueYellowRedFlute: @ 807036C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x27
	beq _0807037E
	cmp r0, 0x29
	beq _0807037E
	cmp r0, 0x28
	bne _08070382
_0807037E:
	movs r0, 0x1
	b _08070384
_08070382:
	movs r0, 0
_08070384:
	pop {r1}
	bx r1
	thumb_func_end IsBlueYellowRedFlute

	thumb_func_start sub_8070048
sub_8070048: @ 8070388
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080703B8 @ =0x0201c000
	str r2, [r3, 0x10]
	movs r4, 0
	strb r0, [r3, 0x4]
	movs r2, 0
	strh r1, [r3, 0x6]
	strb r2, [r3, 0x5]
	ldr r1, _080703BC @ =sub_80701DC
	str r1, [r3, 0x14]
	ldr r2, _080703C0 @ =0xfffff27e
	adds r1, r3, r2
	strh r4, [r1]
	ldr r1, _080703C4 @ =0xfffff280
	adds r3, r1
	strh r4, [r3]
	bl sub_8070088
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080703B8: .4byte 0x0201c000
_080703BC: .4byte sub_80701DC
_080703C0: .4byte 0xfffff27e
_080703C4: .4byte 0xfffff280
	thumb_func_end sub_8070048

	thumb_func_start sub_8070088
sub_8070088: @ 80703C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08070460 @ =gTasks
	mov r10, r1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	mov r2, r10
	adds r7, r1, r2
	ldr r5, _08070464 @ =TaskDummy
	str r5, [r7]
	ldr r4, _08070468 @ =0x0201c000
	ldrb r0, [r4, 0x5]
	movs r1, 0x64
	mov r9, r1
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	ldr r1, _0807046C @ =gPlayerParty
	mov r8, r1
	add r0, r8
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08070458
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	str r0, [sp]
	mov r0, r10
	adds r0, 0x8
	ldr r2, [sp]
	adds r6, r2, r0
	ldrb r0, [r4, 0x5]
	mov r1, r9
	muls r1, r0
	adds r0, r1, 0
	add r0, r8
	str r0, [r4]
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r6, 0x14]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	strh r0, [r6, 0x16]
	ldrb r0, [r4, 0x5]
	ldrh r1, [r4, 0x6]
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _08070474
	adds r0, r5, 0
	bl DestroyTask
_08070458:
	ldr r0, _08070470 @ =sub_80701DC
	str r0, [r7]
	b _080704F0
	.align 2, 0
_08070460: .4byte gTasks
_08070464: .4byte TaskDummy
_08070468: .4byte 0x0201c000
_0807046C: .4byte gPlayerParty
_08070470: .4byte sub_80701DC
_08070474:
	ldr r1, _08070500 @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x1
	bl PlaySE
	ldr r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806FBB4
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _08070504 @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x9
	bl task_pc_turn_off
	ldr r2, _08070508 @ =0xfffff261
	adds r1, r4, r2
	movs r0, 0x2
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, 0x39
	bl GetMonData
	ldrh r1, [r6, 0x16]
	subs r0, r1
	strh r0, [r6, 0x18]
	movs r0, 0x1
	strh r0, [r6, 0x1C]
	ldr r1, _0807050C @ =0xfffff27e
	adds r0, r4, r1
	movs r1, 0x1
	strh r1, [r0]
	ldr r2, _08070510 @ =0xfffff280
	adds r0, r4, r2
	strh r1, [r0]
	ldrh r1, [r6, 0x16]
	adds r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _08070514 @ =0xffff8000
	str r0, [r4, 0xC]
	ldr r1, [sp]
	add r1, r10
	ldr r0, _08070518 @ =sub_806F8AC
	str r0, [r1]
_080704F0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070500: .4byte gUnknown_0202E8F4
_08070504: .4byte gUnknown_083769A8
_08070508: .4byte 0xfffff261
_0807050C: .4byte 0xfffff27e
_08070510: .4byte 0xfffff280
_08070514: .4byte 0xffff8000
_08070518: .4byte sub_806F8AC
	thumb_func_end sub_8070088

	thumb_func_start sub_80701DC
sub_80701DC: @ 807051C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _080705C0 @ =0x0201b000
	ldr r0, _080705C4 @ =0x0000027e
	adds r7, r6, r0
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	bne _0807057E
	movs r0, 0x80
	lsls r0, 5
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl AddBagItem
	ldrb r1, [r4, 0x5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080705C8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0807057A
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldrb r1, [r4, 0x5]
	lsls r1, 1
	adds r0, r1
	ldr r1, _080705CC @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x3
	bl task_pc_turn_off
	ldr r0, _080705D0 @ =0x00000261
	adds r1, r6, r0
	movs r0, 0x2
	strb r0, [r1]
_0807057A:
	movs r0, 0
	strh r0, [r7]
_0807057E:
	ldr r4, _080705D4 @ =0x0201c000
	ldrb r0, [r4, 0x5]
	adds r0, 0x1
	strb r0, [r4, 0x5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _08070618
	ldr r1, _080705D8 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080705DC @ =0xfffff280
	adds r0, r4, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080705F0
	ldr r1, _080705E0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080705E4 @ =TaskDummy
	str r1, [r0]
	ldr r0, _080705E8 @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _080705EC @ =sub_806FB0C
	movs r1, 0x8
	bl CreateTask
	b _08070606
	.align 2, 0
_080705C0: .4byte 0x0201b000
_080705C4: .4byte 0x0000027e
_080705C8: .4byte gPlayerParty
_080705CC: .4byte gUnknown_083769A8
_080705D0: .4byte 0x00000261
_080705D4: .4byte 0x0201c000
_080705D8: .4byte gUnknown_0202E8F4
_080705DC: .4byte 0xfffff280
_080705E0: .4byte gTasks
_080705E4: .4byte TaskDummy
_080705E8: .4byte gOtherText_WontHaveAnyEffect
_080705EC: .4byte sub_806FB0C
_080705F0:
	ldrh r0, [r4, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r1, _08070610 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, [r4, 0x10]
	str r1, [r0]
_08070606:
	ldr r1, _08070614 @ =gUnknown_03005CE0
	movs r0, 0
	strb r0, [r1]
	b _0807061E
	.align 2, 0
_08070610: .4byte gTasks
_08070614: .4byte gUnknown_03005CE0
_08070618:
	adds r0, r5, 0
	bl sub_8070088
_0807061E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80701DC

	thumb_func_start sub_80702E4
sub_80702E4: @ 8070624
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r6, 0
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r5, 0
	movs r0, 0x64
	adds r7, r4, 0
	muls r7, r0
	ldr r0, _080706AC @ =gPlayerParty
	mov r8, r0
_0807064C:
	adds r1, r5, 0
	adds r1, 0xD
	mov r2, r8
	adds r0, r7, r2
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xD
	muls r0, r4
	ldr r1, _080706B0 @ =gMoveNames
	adds r0, r1
	lsls r2, r5, 25
	movs r1, 0xB0
	lsls r1, 20
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x14
	bl MenuPrint
	cmp r4, 0
	beq _08070680
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08070680:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _0807064C
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x14
	movs r2, 0xB
	adds r3, r6, 0
	bl InitMenu
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080706AC: .4byte gPlayerParty
_080706B0: .4byte gMoveNames
	thumb_func_end sub_80702E4

	thumb_func_start sub_8070374
sub_8070374: @ 80706B4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r0, _080706D8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080706DC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08070724
	.align 2, 0
_080706D8: .4byte gMain
_080706DC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080706F2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08070724
_080706F2:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807070C
	ldr r0, _08070708 @ =gUnknown_08376B54
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	b _08070724
	.align 2, 0
_08070708: .4byte gUnknown_08376B54
_0807070C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08070724
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0807072C @ =gUnknown_08376B54
	ldr r1, [r0, 0x4]
	adds r0, r4, 0
	bl _call_via_r1
_08070724:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807072C: .4byte gUnknown_08376B54
	thumb_func_end sub_8070374

	thumb_func_start dp05_ether
dp05_ether: @ 8070730
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r5, 0xAF
	bne _08070750
	ldr r0, _0807074C @ =0x02028daa
	b _0807075C
	.align 2, 0
_0807074C: .4byte 0x02028daa
_08070750:
	ldr r1, _080707A4 @ =gItemEffectTable
	adds r0, r5, 0
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
_0807075C:
	mov r8, r0
	ldr r7, _080707A8 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r7
	ldr r0, _080707AC @ =TaskDummy
	str r0, [r1]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r9
	bl sub_806E8D0
	mov r0, r8
	ldrb r1, [r0, 0x4]
	movs r0, 0x10
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080707B0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	strh r1, [r0, 0x1E]
	adds r0, r4, 0
	bl ether_effect_related
	b _080707D8
	.align 2, 0
_080707A4: .4byte gItemEffectTable
_080707A8: .4byte gTasks
_080707AC: .4byte TaskDummy
_080707B0:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xA
	movs r1, 0x3
	bl sub_806D538
	ldr r0, _080707E4 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	bl sub_80702E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	ldr r1, _080707E8 @ =sub_8070374
	str r1, [r0]
	ldr r1, _080707EC @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
_080707D8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080707E4: .4byte 0x0201c000
_080707E8: .4byte sub_8070374
_080707EC: .4byte gMain
	thumb_func_end dp05_ether

	thumb_func_start ether_effect_related_2
ether_effect_related_2: @ 80707F0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	bl GetMenuCursorPos
	ldr r2, _0807082C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x1E]
	adds r0, r4, 0
	bl ether_effect_related
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807082C: .4byte gTasks
	thumb_func_end ether_effect_related_2

	thumb_func_start sub_80704F0
sub_80704F0: @ 8070830
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08070868 @ =gMain
	ldr r1, _0807086C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0807087C
	ldr r2, _08070870 @ =gTasks
	ldr r0, _08070874 @ =0x0201c000
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08070878 @ =sub_8095118
	b _0807088C
	.align 2, 0
_08070868: .4byte gMain
_0807086C: .4byte 0x0000043d
_08070870: .4byte gTasks
_08070874: .4byte 0x0201c000
_08070878: .4byte sub_8095118
_0807087C:
	ldr r2, _080708A4 @ =gTasks
	ldr r0, _080708A8 @ =0x0201c000
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080708AC @ =sub_808B0C0
_0807088C:
	str r1, [r0]
	movs r0, 0x3
	movs r1, 0
	bl sub_806D538
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080708A4: .4byte gTasks
_080708A8: .4byte 0x0201c000
_080708AC: .4byte sub_808B0C0
	thumb_func_end sub_80704F0

	thumb_func_start ether_effect_related
ether_effect_related: @ 80708B0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r6, _080708E8 @ =0x0201c000
	ldrb r0, [r6, 0x5]
	ldrh r1, [r6, 0x6]
	ldr r3, _080708EC @ =gTasks
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r7, r2, r3
	ldrb r2, [r7, 0x1E]
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _080708F8
	ldr r0, _080708F0 @ =gUnknown_0202E8F4
	strb r5, [r0]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080708F4 @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	b _08070938
	.align 2, 0
_080708E8: .4byte 0x0201c000
_080708EC: .4byte gTasks
_080708F0: .4byte gUnknown_0202E8F4
_080708F4: .4byte gOtherText_WontHaveAnyEffect
_080708F8:
	ldr r1, _0807094C @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x1
	bl PlaySE
	ldrh r0, [r6, 0x6]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r0, [r6]
	movs r2, 0x1E
	ldrsh r1, [r7, r2]
	adds r1, 0xD
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08070950 @ =gStringVar1
	movs r1, 0xD
	muls r1, r5
	ldr r2, _08070954 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldrh r0, [r6, 0x6]
	bl GetMedicineItemEffectMessage
	ldr r0, _08070958 @ =gStringVar4
	movs r1, 0x1
	bl sub_806E834
_08070938:
	ldr r0, _0807095C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070960 @ =sub_806FB0C
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807094C: .4byte gUnknown_0202E8F4
_08070950: .4byte gStringVar1
_08070954: .4byte gMoveNames
_08070958: .4byte gStringVar4
_0807095C: .4byte gTasks
_08070960: .4byte sub_806FB0C
	thumb_func_end ether_effect_related

	thumb_func_start dp05_pp_up
dp05_pp_up: @ 8070964
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _080709AC @ =gTasks
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 3
	adds r3, r4
	ldr r4, _080709B0 @ =TaskDummy
	str r4, [r3]
	bl sub_806E8D0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xB
	movs r1, 0x3
	bl sub_806D538
	ldr r0, _080709B4 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	bl sub_80702E4
	ldr r0, _080709B8 @ =sub_8070374
	movs r1, 0x5
	bl CreateTask
	ldr r1, _080709BC @ =gMain
	movs r0, 0
	strh r0, [r1, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080709AC: .4byte gTasks
_080709B0: .4byte TaskDummy
_080709B4: .4byte 0x0201c000
_080709B8: .4byte sub_8070374
_080709BC: .4byte gMain
	thumb_func_end dp05_pp_up

	thumb_func_start sub_8070680
sub_8070680: @ 80709C0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r3, _08070A20 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	ldr r3, _08070A24 @ =TaskDummy
	str r3, [r1]
	adds r1, r6, 0
	bl sub_806E8D0
	ldr r5, _08070A28 @ =0x0201c000
	ldr r0, [r5]
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x64
	beq _08070A34
	movs r4, 0
	ldr r0, _08070A2C @ =0xfffff264
	adds r7, r5, r0
_080709F2:
	ldr r0, [r5]
	ldr r1, _08070A30 @ =gUnknown_08376D1C
	adds r1, r4, r1
	ldrb r1, [r1]
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r7, r1
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _080709F2
	ldr r0, _08070A28 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	lsrs r0, 24
	b _08070A36
	.align 2, 0
_08070A20: .4byte gTasks
_08070A24: .4byte TaskDummy
_08070A28: .4byte 0x0201c000
_08070A2C: .4byte 0xfffff264
_08070A30: .4byte gUnknown_08376D1C
_08070A34:
	movs r0, 0x1
_08070A36:
	cmp r0, 0
	beq _08070A64
	ldr r1, _08070A58 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08070A5C @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08070A60 @ =sub_806FB0C
	movs r1, 0x5
	bl CreateTask
	b _08070ABC
	.align 2, 0
_08070A58: .4byte gUnknown_0202E8F4
_08070A5C: .4byte gOtherText_WontHaveAnyEffect
_08070A60: .4byte sub_806FB0C
_08070A64:
	ldr r1, _08070AC4 @ =gUnknown_0202E8F4
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0
	bl PlayFanfareByFanfareNum
	ldr r4, _08070AC8 @ =0x0201c000
	ldrb r0, [r4, 0x5]
	ldr r1, [r4]
	bl sub_8070A20
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
	ldr r0, [r4]
	ldr r1, _08070ACC @ =gStringVar1
	bl GetMonNickname
	ldr r0, [r4]
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08070AD0 @ =gStringVar2
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r4, _08070AD4 @ =gStringVar4
	ldr r1, _08070AD8 @ =gOtherText_ElevatedTo
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08070ADC @ =sub_80707A0
	movs r1, 0x5
	bl CreateTask
_08070ABC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070AC4: .4byte gUnknown_0202E8F4
_08070AC8: .4byte 0x0201c000
_08070ACC: .4byte gStringVar1
_08070AD0: .4byte gStringVar2
_08070AD4: .4byte gStringVar4
_08070AD8: .4byte gOtherText_ElevatedTo
_08070ADC: .4byte sub_80707A0
	thumb_func_end sub_8070680

	thumb_func_start sub_80707A0
sub_80707A0: @ 8070AE0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	beq _08070B28
	ldr r0, _08070B30 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0
	bne _08070B28
	ldr r0, _08070B34 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08070B0E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08070B28
_08070B0E:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8070848
	ldr r0, _08070B38 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070B3C @ =sub_8070800
	str r0, [r1]
_08070B28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070B30: .4byte gUnknown_0202E8F6
_08070B34: .4byte gMain
_08070B38: .4byte gTasks
_08070B3C: .4byte sub_8070800
	thumb_func_end sub_80707A0

	thumb_func_start sub_8070800
sub_8070800: @ 8070B40
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08070B7C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08070B5A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08070B74
_08070B5A:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_8070968
	ldr r0, _08070B80 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070B84 @ =sub_8070AC8
	str r0, [r1]
_08070B74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070B7C: .4byte gMain
_08070B80: .4byte gTasks
_08070B84: .4byte sub_8070AC8
	thumb_func_end sub_8070800

	thumb_func_start sub_8070848
sub_8070848: @ 8070B88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl MenuDrawTextWindow
	movs r7, 0
	ldr r0, _08070C6C @ =gStringVar1
	mov r10, r0
	movs r1, 0xFC
	mov r9, r1
	movs r2, 0x13
	mov r8, r2
_08070BAC:
	ldr r1, _08070C70 @ =0x0201c000
	ldr r0, [r1]
	ldr r1, _08070C74 @ =gUnknown_08376D1C
	adds r1, r7, r1
	ldrb r1, [r1]
	bl GetMonData
	adds r1, r7, 0x6
	lsls r1, 1
	ldr r2, _08070C78 @ =0x0201b264
	adds r1, r2, r1
	strh r0, [r1]
	lsls r6, r7, 1
	adds r6, r2, r6
	ldrh r1, [r6]
	subs r0, r1
	strh r0, [r6]
	adds r0, r7, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	adds r4, 0xB
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	movs r1, 0x3
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 1
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _08070C7C @ =gUnknown_08376D04
	lsls r0, r7, 2
	adds r0, r1
	ldr r1, [r0]
	mov r0, r10
	bl StringCopy
	adds r2, r0, 0
	mov r0, r9
	strb r0, [r2]
	adds r2, 0x1
	mov r1, r8
	strb r1, [r2]
	adds r2, 0x1
	movs r0, 0x2E
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	ldr r1, _08070C80 @ =gOtherText_TallPlusAndRightArrow
	bl StringCopy
	adds r2, r0, 0
	mov r0, r9
	strb r0, [r2]
	adds r2, 0x1
	mov r1, r8
	strb r1, [r2]
	adds r2, 0x1
	movs r0, 0x34
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0
	ldrsh r1, [r6, r0]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _08070BAC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070C6C: .4byte gStringVar1
_08070C70: .4byte 0x0201c000
_08070C74: .4byte gUnknown_08376D1C
_08070C78: .4byte 0x0201b264
_08070C7C: .4byte gUnknown_08376D04
_08070C80: .4byte gOtherText_TallPlusAndRightArrow
	thumb_func_end sub_8070848

	thumb_func_start sub_8070968
sub_8070968: @ 8070C84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r7, 0
	ldr r0, _08070D2C @ =0x0201c000
	mov r9, r0
	ldr r1, _08070D30 @ =0xfffff264
	add r1, r9
	mov r10, r1
	ldr r0, _08070D34 @ =gStringVar1
	mov r8, r0
_08070C9E:
	mov r1, r9
	ldr r0, [r1]
	ldr r1, _08070D38 @ =gUnknown_08376D1C
	adds r1, r7, r1
	ldrb r1, [r1]
	bl GetMonData
	adds r6, r7, 0x6
	lsls r6, 1
	add r6, r10
	strh r0, [r6]
	adds r0, r7, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	adds r4, 0xB
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	movs r1, 0x3
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 1
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0xFC
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x14
	strb r0, [r1, 0x1]
	movs r0, 0x6
	strb r0, [r1, 0x2]
	movs r0, 0
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, 0x3
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r4, 0x6
	lsls r4, 3
	adds r4, 0x6
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 3
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl MenuPrint_PixelCoords
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _08070C9E
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070D2C: .4byte 0x0201c000
_08070D30: .4byte 0xfffff264
_08070D34: .4byte gStringVar1
_08070D38: .4byte gUnknown_08376D1C
	thumb_func_end sub_8070968

	thumb_func_start sub_8070A20
sub_8070A20: @ 8070D3C
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r6, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08070D56
	cmp r0, 0x6
	bne _08070D5E
_08070D56:
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_806FBB4
_08070D5E:
	bl battle_type_is_double
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl GetMonData
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806E420
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_806E674
	ldr r4, _08070DD8 @ =0x0201c000
	ldrb r0, [r4, 0x4]
	adds r1, r7, 0
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	bl sub_806D84C
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	lsls r1, r7, 1
	adds r0, r1
	ldr r1, _08070DDC @ =gUnknown_083769A8
	adds r0, r1
	movs r1, 0x7
	bl task_pc_turn_off
	ldr r0, _08070DE0 @ =0xfffff261
	adds r4, r0
	movs r0, 0x2
	strb r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070DD8: .4byte 0x0201c000
_08070DDC: .4byte gUnknown_083769A8
_08070DE0: .4byte 0xfffff261
	thumb_func_end sub_8070A20

	thumb_func_start sub_8070AC8
sub_8070AC8: @ 8070DE4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl WaitFanfare
	lsls r0, 24
	cmp r0, 0
	bne _08070DF8
	b _08070F48
_08070DF8:
	ldr r0, _08070E40 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _08070E10
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08070E10
	b _08070F48
_08070E10:
	movs r0, 0xB
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x7
	bl MenuZeroFillWindowRect
	ldr r7, _08070E44 @ =0x0201c000
	ldr r0, [r7]
	movs r1, 0x1
	bl sub_803B7C8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r1, _08070E48 @ =0xfffff282
	adds r0, r7, r1
	strh r5, [r0]
	ldr r0, _08070E4C @ =0x0000fffe
	cmp r4, r0
	beq _08070EF8
	cmp r4, r0
	bgt _08070E50
	cmp r4, 0
	beq _08070E5C
	b _08070F10
	.align 2, 0
_08070E40: .4byte gMain
_08070E44: .4byte 0x0201c000
_08070E48: .4byte 0xfffff282
_08070E4C: .4byte 0x0000fffe
_08070E50:
	ldr r0, _08070E58 @ =0x0000ffff
	cmp r4, r0
	beq _08070E98
	b _08070F10
	.align 2, 0
_08070E58: .4byte 0x0000ffff
_08070E5C:
	ldr r0, [r7]
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08070E90
	ldr r1, _08070E88 @ =gUnknown_03005E94
	ldr r0, _08070E8C @ =sub_80A53F8
	str r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r7, 0x5]
	adds r1, r2, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r6, 0
	bl DestroyTask
	b _08070F48
	.align 2, 0
_08070E88: .4byte gUnknown_03005E94
_08070E8C: .4byte sub_80A53F8
_08070E90:
	adds r0, r6, 0
	bl sub_8070D90
	b _08070F48
_08070E98:
	ldr r0, [r7]
	ldr r1, _08070ED8 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08070EDC @ =gStringVar2
	ldr r5, _08070EE0 @ =word_2024E82
	ldrh r2, [r5]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08070EE4 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08070EE8 @ =gStringVar4
	ldr r1, _08070EEC @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldrh r0, [r5]
	strh r0, [r7, 0x8]
	ldr r1, _08070EF0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070EF4 @ =sub_806F358
	b _08070F46
	.align 2, 0
_08070ED8: .4byte gStringVar1
_08070EDC: .4byte gStringVar2
_08070EE0: .4byte word_2024E82
_08070EE4: .4byte gMoveNames
_08070EE8: .4byte gStringVar4
_08070EEC: .4byte gOtherText_WantsToLearn
_08070EF0: .4byte gTasks
_08070EF4: .4byte sub_806F358
_08070EF8:
	ldr r0, _08070F08 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08070F0C @ =sub_8070C54
	str r0, [r1]
	b _08070F48
	.align 2, 0
_08070F08: .4byte gTasks
_08070F0C: .4byte sub_8070C54
_08070F10:
	ldr r0, _08070F50 @ =0x0201c000
	ldr r0, [r0]
	ldr r1, _08070F54 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08070F58 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08070F5C @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08070F60 @ =gStringVar4
	ldr r1, _08070F64 @ =gOtherText_LearnedMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _08070F68 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08070F6C @ =sub_806F254
_08070F46:
	str r1, [r0]
_08070F48:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070F50: .4byte 0x0201c000
_08070F54: .4byte gStringVar1
_08070F58: .4byte gStringVar2
_08070F5C: .4byte gMoveNames
_08070F60: .4byte gStringVar4
_08070F64: .4byte gOtherText_LearnedMove
_08070F68: .4byte gTasks
_08070F6C: .4byte sub_806F254
	thumb_func_end sub_8070AC8

	thumb_func_start sub_8070C54
sub_8070C54: @ 8070F70
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _08070F94 @ =0x0201c000
	ldr r0, [r7]
	movs r1, 0
	bl sub_803B7C8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08070F98 @ =0x0000fffe
	cmp r4, r0
	beq _08071044
	cmp r4, r0
	bgt _08070F9C
	cmp r4, 0
	beq _08070FA8
	b _0807104C
	.align 2, 0
_08070F94: .4byte 0x0201c000
_08070F98: .4byte 0x0000fffe
_08070F9C:
	ldr r0, _08070FA4 @ =0x0000ffff
	cmp r4, r0
	beq _08070FE4
	b _0807104C
	.align 2, 0
_08070FA4: .4byte 0x0000ffff
_08070FA8:
	ldr r0, [r7]
	movs r1, 0
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08070FDC
	ldr r1, _08070FD4 @ =gUnknown_03005E94
	ldr r0, _08070FD8 @ =sub_80A53F8
	str r0, [r1]
	ldr r0, [r7]
	ldrb r3, [r7, 0x5]
	adds r1, r2, 0
	movs r2, 0x1
	bl BeginEvolutionScene
	adds r0, r6, 0
	bl DestroyTask
	b _08071084
	.align 2, 0
_08070FD4: .4byte gUnknown_03005E94
_08070FD8: .4byte sub_80A53F8
_08070FDC:
	adds r0, r6, 0
	bl sub_8070D90
	b _08071084
_08070FE4:
	ldr r0, [r7]
	ldr r1, _08071024 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08071028 @ =gStringVar2
	ldr r5, _0807102C @ =word_2024E82
	ldrh r2, [r5]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08071030 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _08071034 @ =gStringVar4
	ldr r1, _08071038 @ =gOtherText_WantsToLearn
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldrh r0, [r5]
	strh r0, [r7, 0x8]
	ldr r1, _0807103C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _08071040 @ =sub_806F358
	b _08071082
	.align 2, 0
_08071024: .4byte gStringVar1
_08071028: .4byte gStringVar2
_0807102C: .4byte word_2024E82
_08071030: .4byte gMoveNames
_08071034: .4byte gStringVar4
_08071038: .4byte gOtherText_WantsToLearn
_0807103C: .4byte gTasks
_08071040: .4byte sub_806F358
_08071044:
	adds r0, r6, 0
	bl sub_8070C54
	b _08071084
_0807104C:
	ldr r0, _0807108C @ =0x0201c000
	ldr r0, [r0]
	ldr r1, _08071090 @ =gStringVar1
	bl GetMonNickname
	ldr r0, _08071094 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _08071098 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	ldr r4, _0807109C @ =gStringVar4
	ldr r1, _080710A0 @ =gOtherText_LearnedMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806E834
	ldr r1, _080710A4 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080710A8 @ =sub_806F254
_08071082:
	str r1, [r0]
_08071084:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807108C: .4byte 0x0201c000
_08071090: .4byte gStringVar1
_08071094: .4byte gStringVar2
_08071098: .4byte gMoveNames
_0807109C: .4byte gStringVar4
_080710A0: .4byte gOtherText_LearnedMove
_080710A4: .4byte gTasks
_080710A8: .4byte sub_806F254
	thumb_func_end sub_8070C54

	thumb_func_start sub_8070D90
sub_8070D90: @ 80710AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080710D0 @ =gTasks
	ldr r3, _080710D4 @ =0x0201c000
	ldrb r2, [r3, 0x4]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r4
	ldr r2, [r3, 0x10]
	str r2, [r1]
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080710D0: .4byte gTasks
_080710D4: .4byte 0x0201c000
	thumb_func_end sub_8070D90

	thumb_func_start sub_8070DBC
sub_8070DBC: @ 80710D8
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08071134 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08071138 @ =TaskDummy
	str r1, [r0]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E8D0
	ldr r1, _0807113C @ =gUnknown_03005E94
	ldr r0, _08071140 @ =sub_80A53F8
	str r0, [r1]
	ldr r0, _08071144 @ =0x0201c000
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	beq _08071154
	ldr r1, _08071148 @ =gUnknown_0202E8F4
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0807114C @ =gOtherText_WontHaveAnyEffect
	movs r1, 0x1
	bl sub_806E834
	ldr r0, _08071150 @ =sub_806FB0C
	movs r1, 0x5
	bl CreateTask
	b _0807115C
	.align 2, 0
_08071134: .4byte gTasks
_08071138: .4byte TaskDummy
_0807113C: .4byte gUnknown_03005E94
_08071140: .4byte sub_80A53F8
_08071144: .4byte 0x0201c000
_08071148: .4byte gUnknown_0202E8F4
_0807114C: .4byte gOtherText_WontHaveAnyEffect
_08071150: .4byte sub_806FB0C
_08071154:
	adds r0, r6, 0
	movs r1, 0x1
	bl RemoveBagItem
_0807115C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8070DBC

	thumb_func_start sub_8070E48
sub_8070E48: @ 8071164
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _08071178
	ldr r4, _08071174 @ =0x02028daa
	b _08071182
	.align 2, 0
_08071174: .4byte 0x02028daa
_08071178:
	ldr r1, _080711A8 @ =gItemEffectTable
	subs r0, 0xD
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
_08071182:
	ldrb r1, [r4]
	movs r5, 0x3F
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _080711A4
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080711A4
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	bne _080711A4
	ldrb r3, [r4, 0x3]
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _080711AC
_080711A4:
	movs r0, 0
	b _080712A6
	.align 2, 0
_080711A8: .4byte gItemEffectTable
_080711AC:
	movs r2, 0x40
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080711BA
	movs r0, 0xA
	b _080712A6
_080711BA:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _080711C6
	movs r0, 0x1
	b _080712A6
_080711C6:
	adds r2, r5, 0
	ands r2, r3
	cmp r2, 0
	bne _080711D4
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08071216
_080711D4:
	cmp r2, 0x20
	bne _080711DC
	movs r0, 0x4
	b _080712A6
_080711DC:
	cmp r2, 0x10
	bne _080711E4
	movs r0, 0x3
	b _080712A6
_080711E4:
	cmp r2, 0x8
	bne _080711EC
	movs r0, 0x5
	b _080712A6
_080711EC:
	cmp r2, 0x4
	bne _080711F4
	movs r0, 0x6
	b _080712A6
_080711F4:
	cmp r2, 0x2
	bne _080711FC
	movs r0, 0x7
	b _080712A6
_080711FC:
	cmp r2, 0x1
	bne _08071204
	movs r0, 0x8
	b _080712A6
_08071204:
	lsrs r0, r1, 7
	cmp r0, 0
	beq _08071212
	cmp r2, 0
	bne _08071212
	movs r0, 0x9
	b _080712A6
_08071212:
	movs r0, 0xB
	b _080712A6
_08071216:
	ldrb r1, [r4, 0x4]
	movs r0, 0x44
	ands r0, r1
	adds r2, r1, 0
	cmp r0, 0
	beq _08071226
	movs r0, 0x2
	b _080712A6
_08071226:
	movs r5, 0x2
	adds r0, r5, 0
	ands r0, r2
	cmp r0, 0
	beq _08071234
	movs r0, 0xC
	b _080712A6
_08071234:
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _08071242
	movs r0, 0xD
	b _080712A6
_08071242:
	ldrb r1, [r4, 0x5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08071250
	movs r0, 0xE
	b _080712A6
_08071250:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0807125C
	movs r0, 0xF
	b _080712A6
_0807125C:
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _08071268
	movs r0, 0x10
	b _080712A6
_08071268:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08071274
	movs r0, 0x11
	b _080712A6
_08071274:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08071280
	movs r0, 0x12
	b _080712A6
_08071280:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0807128C
	movs r0, 0x13
	b _080712A6
_0807128C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08071298
	movs r0, 0x14
	b _080712A6
_08071298:
	movs r0, 0x18
	ands r0, r2
	cmp r0, 0
	bne _080712A4
	movs r0, 0x16
	b _080712A6
_080712A4:
	movs r0, 0x15
_080712A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8070E48

	thumb_func_start unref_sub_8070F90
unref_sub_8070F90: @ 80712AC
	push {lr}
	ldr r0, _080712C8 @ =0x00000801
	bl FlagSet
	movs r0, 0x80
	lsls r0, 4
	bl FlagSet
	ldr r0, _080712CC @ =0x00000802
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080712C8: .4byte 0x00000801
_080712CC: .4byte 0x00000802
	thumb_func_end unref_sub_8070F90

	.align 2, 0 @ Don't pad with nop.
