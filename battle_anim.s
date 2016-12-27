	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8075624
sub_8075624: @ 80759E4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08075A78
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08075A7C
	strb r1, [r0]
	ldr r0, _08075A80
	strb r1, [r0]
	ldr r0, _08075A84
	strb r1, [r0]
	ldr r0, _08075A88
	movs r1, 0
	str r1, [r0]
	ldr r0, _08075A8C
	str r1, [r0]
	ldr r0, _08075A90
	movs r2, 0
	strh r1, [r0]
	ldr r0, _08075A94
	strb r2, [r0]
	ldr r4, _08075A98
	ldr r5, _08075A9C
	ldr r6, _08075AA0
	ldr r7, _08075AA4
	ldr r0, _08075AA8
	mov r12, r0
	ldr r1, _08075AAC
	mov r8, r1
	ldr r0, _08075AB0
	mov r9, r0
	ldr r1, _08075AB4
	adds r3, r1, 0
	ldr r1, _08075AB8
	movs r2, 0x7
_08075A2E:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _08075A2E
	ldr r1, _08075ABC
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xE
_08075A44:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08075A44
	movs r1, 0
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x1]
	strb r1, [r5]
	strb r1, [r6]
	movs r0, 0
	strh r1, [r7]
	mov r1, r12
	strb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	mov r1, r9
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075A78: .4byte gUnknown_0202F7B0
_08075A7C: .4byte gUnknown_0202F7B1
_08075A80: .4byte gUnknown_0202F7B2
_08075A84: .4byte gUnknown_0202F7B3
_08075A88: .4byte gUnknown_0202F7B4
_08075A8C: .4byte gUnknown_0202F7B8
_08075A90: .4byte gUnknown_0202F7BC
_08075A94: .4byte gUnknown_0202F7BE
_08075A98: .4byte gUnknown_0202F7C2
_08075A9C: .4byte gUnknown_0202F7C4
_08075AA0: .4byte gUnknown_0202F7C5
_08075AA4: .4byte gUnknown_0202F7C6
_08075AA8: .4byte gUnknown_0202F7C8
_08075AAC: .4byte gUnknown_0202F7C9
_08075AB0: .4byte gUnknown_0202F7D2
_08075AB4: .4byte 0x0000ffff
_08075AB8: .4byte gUnknown_03004B10
_08075ABC: .4byte gUnknown_03004B00
	thumb_func_end sub_8075624

	thumb_func_start move_anim_start_t1
move_anim_start_t1: @ 8075AC0
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08075AE4
	ldr r0, _08075AE8
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _08075AEC
	ldr r0, _08075AF0
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08075AF4
	movs r2, 0x1
	bl move_something
	pop {r0}
	bx r0
	.align 2, 0
_08075AE4: .4byte gUnknown_0202F7C8
_08075AE8: .4byte gUnknown_02024C07
_08075AEC: .4byte gUnknown_0202F7C9
_08075AF0: .4byte gUnknown_02024C08
_08075AF4: .4byte gBattleAnims_Moves
	thumb_func_end move_anim_start_t1

	thumb_func_start move_something
move_something: @ 8075AF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08075B98
	bl sub_8079E24
	movs r0, 0
	bl sub_8043EB4
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r6, _08075B4C
	movs r7, 0x64
	ldr r5, _08075B50
_08075B34:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08075B58
	ldrh r0, [r6]
	muls r0, r7
	ldr r1, _08075B54
	b _08075B5E
	.align 2, 0
_08075B4C: .4byte gUnknown_02024A6A
_08075B50: .4byte gUnknown_0202F7CA
_08075B54: .4byte gEnemyParty
_08075B58:
	ldrh r0, [r6]
	muls r0, r7
	ldr r1, _08075B80
_08075B5E:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	strh r0, [r5]
	adds r6, 0x2
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08075B34
	ldr r3, _08075B84
	ldr r5, _08075B88
	ldr r1, _08075B8C
	mov r12, r1
	ldr r7, _08075B90
	ldr r6, _08075B94
	b _08075BBC
	.align 2, 0
_08075B80: .4byte gPlayerParty
_08075B84: .4byte gUnknown_0202F7C6
_08075B88: .4byte gUnknown_0202F7C2
_08075B8C: .4byte gUnknown_0202F7B1
_08075B90: .4byte gUnknown_0202F7AC
_08075B94: .4byte sub_80759D0
_08075B98:
	ldr r3, _08075BC8
	ldr r5, _08075BCC
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r1, _08075BD0
	mov r12, r1
	ldr r7, _08075BD4
	ldr r6, _08075BD8
	ldr r2, _08075BDC
	ldr r1, _08075BE0
	movs r4, 0x3
_08075BB0:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08075BB0
_08075BBC:
	mov r0, r9
	cmp r0, 0
	bne _08075BE4
	strh r0, [r3]
	b _08075BE8
	.align 2, 0
_08075BC8: .4byte gUnknown_0202F7C6
_08075BCC: .4byte gUnknown_0202F7C2
_08075BD0: .4byte gUnknown_0202F7B1
_08075BD4: .4byte gUnknown_0202F7AC
_08075BD8: .4byte sub_80759D0
_08075BDC: .4byte 0x02019348
_08075BE0: .4byte gUnknown_0202F7CA
_08075BE4:
	mov r1, r8
	strh r1, [r3]
_08075BE8:
	ldr r1, _08075C3C
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xE
_08075BF0:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _08075BF0
	movs r0, 0xFF
	strb r0, [r5]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r5, 0x1]
	ldr r0, [sp]
	add r0, r10
	ldr r0, [r0]
	ldr r1, _08075C40
	str r0, [r1]
	movs r0, 0x1
	mov r1, r12
	strb r0, [r1]
	movs r0, 0
	ldr r1, _08075C44
	strb r0, [r1]
	str r6, [r7]
	ldr r0, _08075C48
	adds r2, r0, 0
	ldr r1, _08075C4C
	movs r4, 0x7
_08075C22:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08075C22
	mov r1, r9
	cmp r1, 0
	beq _08075C6E
	movs r4, 0
	ldr r2, _08075C50
	b _08075C56
	.align 2, 0
_08075C3C: .4byte gUnknown_03004B00
_08075C40: .4byte gUnknown_0202F7A4
_08075C44: .4byte gUnknown_0202F7B0
_08075C48: .4byte 0x0000ffff
_08075C4C: .4byte gUnknown_03004B10
_08075C50: .4byte gUnknown_081C7160
_08075C54:
	adds r4, 0x1
_08075C56:
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	ldr r1, _08075C90
	cmp r0, r1
	beq _08075C6E
	cmp r8, r0
	bne _08075C54
	ldr r0, _08075C94
	movs r2, 0x80
	bl m4aMPlayVolumeControl
_08075C6E:
	ldr r0, _08075C98
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08075C9C
	strh r1, [r0]
	ldr r0, _08075CA0
	strh r1, [r0]
	ldr r0, _08075CA4
	strh r1, [r0]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C90: .4byte 0x0000ffff
_08075C94: .4byte gMPlay_BGM
_08075C98: .4byte gUnknown_030042C4
_08075C9C: .4byte gUnknown_03004240
_08075CA0: .4byte gUnknown_03004200
_08075CA4: .4byte gUnknown_03004244
	thumb_func_end move_something

	thumb_func_start move_anim_8072740
move_anim_8072740: @ 8075CA8
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _08075CC4
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075CC4: .4byte gUnknown_0202F7B2
	thumb_func_end move_anim_8072740

	thumb_func_start move_anim_task_del
move_anim_task_del: @ 8075CC8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _08075CE0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08075CE0: .4byte gUnknown_0202F7B2
	thumb_func_end move_anim_task_del

	thumb_func_start move_anim_related_task_del
move_anim_related_task_del: @ 8075CE4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r1, _08075CFC
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08075CFC: .4byte gUnknown_0202F7B3
	thumb_func_end move_anim_related_task_del

	thumb_func_start sub_8075940
sub_8075940: @ 8075D00
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r4, _08075D18
	ldr r1, _08075D1C
_08075D0C:
	ldrh r0, [r1]
	cmp r0, r4
	bne _08075D20
	strh r3, [r1]
	b _08075D28
	.align 2, 0
_08075D18: .4byte 0x0000ffff
_08075D1C: .4byte gUnknown_03004B10
_08075D20:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _08075D0C
_08075D28:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075940

	thumb_func_start sub_8075970
sub_8075970: @ 8075D30
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r0, _08075D4C
	adds r4, r0, 0
	ldr r1, _08075D50
_08075D3E:
	ldrh r0, [r1]
	cmp r0, r3
	bne _08075D54
	orrs r0, r4
	strh r0, [r1]
	b _08075D5C
	.align 2, 0
_08075D4C: .4byte 0x0000ffff
_08075D50: .4byte gUnknown_03004B10
_08075D54:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _08075D3E
_08075D5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8075970

	thumb_func_start move_anim_waiter
move_anim_waiter: @ 8075D64
	push {lr}
	ldr r2, _08075D7C
	ldrb r1, [r2]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	bgt _08075D88
	ldr r0, _08075D80
	ldr r1, _08075D84
	str r1, [r0]
	movs r0, 0
	b _08075D8A
	.align 2, 0
_08075D7C: .4byte gUnknown_0202F7B0
_08075D80: .4byte gUnknown_0202F7AC
_08075D84: .4byte sub_80759D0
_08075D88:
	subs r0, r1, 0x1
_08075D8A:
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end move_anim_waiter

	thumb_func_start sub_80759D0
sub_80759D0: @ 8075D90
	push {r4,lr}
	ldr r4, _08075DC0
_08075D94:
	ldr r0, _08075DC4
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08075DC8
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _08075DB8
	ldr r0, _08075DCC
	ldrb r0, [r0]
	cmp r0, 0
	bne _08075D94
_08075DB8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075DC0: .4byte gUnknown_0837F4B8
_08075DC4: .4byte gUnknown_0202F7A4
_08075DC8: .4byte gUnknown_0202F7B0
_08075DCC: .4byte gUnknown_0202F7B1
	thumb_func_end sub_80759D0

	thumb_func_start ma00_load_graphics
ma00_load_graphics: @ 8075DD0
	push {r4-r6,lr}
	ldr r6, _08075E1C
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	lsls r5, r4, 3
	ldr r0, _08075E20
	adds r0, r5, r0
	bl LoadCompressedObjectPic
	ldr r0, _08075E24
	adds r5, r0
	adds r0, r5, 0
	bl LoadCompressedObjectPalette
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	ldr r0, _08075E28
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8075940
	ldr r1, _08075E2C
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08075E30
	ldr r0, _08075E34
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075E1C: .4byte gUnknown_0202F7A4
_08075E20: .4byte 0x083760cc
_08075E24: .4byte 0x083769d4
_08075E28: .4byte 0xffffd8f0
_08075E2C: .4byte gUnknown_0202F7B0
_08075E30: .4byte gUnknown_0202F7AC
_08075E34: .4byte move_anim_waiter
	thumb_func_end ma00_load_graphics

	thumb_func_start ma01_080728D0
ma01_080728D0: @ 8075E38
	push {r4-r6,lr}
	ldr r6, _08075E78
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	ldr r1, _08075E7C
	ldr r0, _08075E80
	adds r4, r0
	lsls r0, r4, 3
	adds r0, r1
	ldrh r5, [r0, 0x6]
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	ldr r0, [r6]
	adds r0, 0x2
	str r0, [r6]
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8075970
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075E78: .4byte gUnknown_0202F7A4
_08075E7C: .4byte gBattleAnimPicTable
_08075E80: .4byte 0xffffd8f0
	thumb_func_end ma01_080728D0

	thumb_func_start ma02_instanciate_template
ma02_instanciate_template: @ 8075E84
	push {r4-r7,lr}
	ldr r5, _08075EEC
	ldr r1, [r5]
	adds r3, r1, 0x1
	str r3, [r5]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r7, r2, r0
	adds r0, r1, 0x5
	str r0, [r5]
	ldrb r4, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r5]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r5]
	cmp r0, 0
	beq _08075ED4
	adds r6, r5, 0
	ldr r5, _08075EF0
	adds r3, r0, 0
_08075EBC:
	ldr r2, [r6]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r5]
	adds r2, 0x2
	str r2, [r6]
	adds r5, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08075EBC
_08075ED4:
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _08075F04
	movs r0, 0x80
	eors r4, r0
	cmp r4, 0x3F
	bls _08075EF4
	adds r0, r4, 0
	subs r0, 0x40
	b _08075EF6
	.align 2, 0
_08075EEC: .4byte gUnknown_0202F7A4
_08075EF0: .4byte gUnknown_03004B00
_08075EF4:
	negs r0, r4
_08075EF6:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08075F00
	b _08075F16
	.align 2, 0
_08075F00: .4byte gUnknown_0202F7C9
_08075F04:
	cmp r4, 0x3F
	bls _08075F0E
	adds r0, r4, 0
	subs r0, 0x40
	b _08075F10
_08075F0E:
	negs r0, r4
_08075F10:
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08075F6C
_08075F16:
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 24
	asrs r1, 24
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0x2
	bgt _08075F34
	movs r6, 0x3
_08075F34:
	ldr r5, _08075F70
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r7, 0
	adds r1, r4, 0
	bl CreateSpriteAndAnimate
	ldr r1, _08075F74
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075F6C: .4byte gUnknown_0202F7C8
_08075F70: .4byte gUnknown_0202F7C9
_08075F74: .4byte gUnknown_0202F7B2
	thumb_func_end ma02_instanciate_template

	thumb_func_start sub_8075BB8
sub_8075BB8: @ 8075F78
	push {r4-r7,lr}
	ldr r4, _08075FE8
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r7, [r1, 0x5]
	adds r0, r1, 0x6
	str r0, [r4]
	ldrb r0, [r1, 0x6]
	adds r1, 0x7
	str r1, [r4]
	cmp r0, 0
	beq _08075FC8
	adds r5, r4, 0
	ldr r4, _08075FEC
	adds r3, r0, 0
_08075FB0:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08075FB0
_08075FC8:
	adds r0, r6, 0
	adds r1, r7, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08075FF0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FE8: .4byte gUnknown_0202F7A4
_08075FEC: .4byte gUnknown_03004B00
_08075FF0: .4byte gUnknown_0202F7B2
	thumb_func_end sub_8075BB8

	thumb_func_start ma04_wait_countdown
ma04_wait_countdown: @ 8075FF4
	push {r4,lr}
	ldr r1, _08076024
	ldr r0, [r1]
	adds r2, r0, 0x1
	str r2, [r1]
	ldr r3, _08076028
	ldrb r0, [r0, 0x1]
	strb r0, [r3]
	lsls r0, 24
	cmp r0, 0
	bne _08076012
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r3]
_08076012:
	adds r0, r2, 0x1
	str r0, [r1]
	ldr r1, _0807602C
	ldr r0, _08076030
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076024: .4byte gUnknown_0202F7A4
_08076028: .4byte gUnknown_0202F7B0
_0807602C: .4byte gUnknown_0202F7AC
_08076030: .4byte move_anim_waiter
	thumb_func_end ma04_wait_countdown

	thumb_func_start sub_8075C74
sub_8075C74: @ 8076034
	push {lr}
	ldr r0, _0807604C
	ldrb r2, [r0]
	cmp r2, 0
	bne _08076058
	ldr r0, _08076050
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08076054
	strb r2, [r0]
	b _0807605E
	.align 2, 0
_0807604C: .4byte gUnknown_0202F7B2
_08076050: .4byte gUnknown_0202F7A4
_08076054: .4byte gUnknown_0202F7B0
_08076058:
	ldr r1, _08076064
	movs r0, 0x1
	strb r0, [r1]
_0807605E:
	pop {r0}
	bx r0
	.align 2, 0
_08076064: .4byte gUnknown_0202F7B0
	thumb_func_end sub_8075C74

	thumb_func_start nullsub_53
nullsub_53: @ 8076068
	bx lr
	thumb_func_end nullsub_53

	thumb_func_start nullsub_88
nullsub_88: @ 807606C
	bx lr
	thumb_func_end nullsub_88

	thumb_func_start sub_8075CB0
sub_8075CB0: @ 8076070
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r0, 0
	mov r8, r0
	ldr r0, _080760A0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08076098
	ldr r0, _080760A4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08076098
	ldr r1, _080760A8
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08076098
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _080760B0
_08076098:
	ldr r1, _080760AC
	movs r0, 0
	strh r0, [r1]
	b _080760CA
	.align 2, 0
_080760A0: .4byte gUnknown_0202F7B2
_080760A4: .4byte gUnknown_0202F7B3
_080760A8: .4byte gUnknown_0202F7C2
_080760AC: .4byte gUnknown_03004AF0
_080760B0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _080760E8
	ldr r1, _080760D4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bhi _080760DC
_080760CA:
	ldr r1, _080760D8
	movs r0, 0x1
	strb r0, [r1]
	b _0807614E
	.align 2, 0
_080760D4: .4byte gUnknown_03004AF0
_080760D8: .4byte gUnknown_0202F7B0
_080760DC:
	ldr r0, _08076158
	bl m4aMPlayStop
	ldr r0, _0807615C
	bl m4aMPlayStop
_080760E8:
	ldr r1, _08076160
	movs r0, 0
	strh r0, [r1]
	movs r5, 0
	ldr r7, _08076164
	ldr r6, _08076168
	ldr r4, _0807616C
_080760F6:
	ldrh r0, [r4]
	cmp r0, r7
	beq _0807611A
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4]
	lsls r0, 3
	adds r0, r6
	ldrh r0, [r0, 0x6]
	bl FreeSpritePaletteByTag
	ldrh r1, [r4]
	adds r0, r7, 0
	orrs r0, r1
	strh r0, [r4]
_0807611A:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	ble _080760F6
	mov r1, r8
	cmp r1, 0
	bne _0807614E
	ldr r0, _08076170
	ldr r1, _08076164
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08076148
	bl sub_8079E24
	movs r0, 0x1
	bl sub_8043EB4
_08076148:
	ldr r0, _08076174
	mov r1, r8
	strb r1, [r0]
_0807614E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076158: .4byte gMPlay_SE1
_0807615C: .4byte gMPlay_SE2
_08076160: .4byte gUnknown_03004AF0
_08076164: .4byte 0x0000ffff
_08076168: .4byte gBattleAnimPicTable
_0807616C: .4byte gUnknown_03004B10
_08076170: .4byte gMPlay_BGM
_08076174: .4byte gUnknown_0202F7B1
	thumb_func_end sub_8075CB0

	thumb_func_start ma09_play_sound
ma09_play_sound: @ 8076178
	push {r4,lr}
	ldr r4, _0807619C
	ldr r0, [r4]
	adds r1, r0, 0x1
	str r1, [r4]
	ldrb r0, [r0, 0x1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bl PlaySE
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807619C: .4byte gUnknown_0202F7A4
	thumb_func_end ma09_play_sound

	thumb_func_start sub_8075DE0
sub_8075DE0: @ 80761A0
	push {r4-r7,lr}
	ldr r0, _080761B4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r6, [r2, 0x1]
	cmp r6, 0
	bne _080761B8
	movs r6, 0x2
	b _080761C2
	.align 2, 0
_080761B4: .4byte gUnknown_0202F7A4
_080761B8:
	cmp r6, 0x1
	bne _080761BE
	movs r6, 0x3
_080761BE:
	cmp r6, 0
	beq _080761C6
_080761C2:
	cmp r6, 0x2
	bne _080761D0
_080761C6:
	ldr r0, _080761CC
	b _080761D2
	.align 2, 0
_080761CC: .4byte gUnknown_0202F7C8
_080761D0:
	ldr r0, _08076204
_080761D2:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807628E
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _080761FE
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076208
_080761FE:
	movs r7, 0
	b _0807620A
	.align 2, 0
_08076204: .4byte gUnknown_0202F7C9
_08076208:
	movs r7, 0x1
_0807620A:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8076034
	ldr r0, _08076258
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _0807625C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08076260
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08076264
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _08076270
	ldr r0, _08076268
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _0807626C
	b _08076278
	.align 2, 0
_08076258: .4byte gUnknown_02024BE0
_0807625C: .4byte task_pA_ma0A_obj_to_bg_pal
_08076260: .4byte gTasks
_08076264: .4byte gSprites
_08076268: .4byte gUnknown_030042C0
_0807626C: .4byte gUnknown_030041B4
_08076270:
	ldr r0, _080762C4
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _080762C8
_08076278:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _080762CC
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _080762D0
	strb r3, [r0]
_0807628E:
	movs r0, 0x2
	eors r5, r0
	cmp r6, 0x1
	bls _0807635A
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807635A
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _080762C0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080762D4
_080762C0:
	movs r7, 0
	b _080762D6
	.align 2, 0
_080762C4: .4byte gUnknown_03004288
_080762C8: .4byte gUnknown_03004280
_080762CC: .4byte gTasks
_080762D0: .4byte gUnknown_0202F7C2
_080762D4:
	movs r7, 0x1
_080762D6:
	adds r0, r5, 0
	adds r1, r7, 0
	bl sub_8076034
	ldr r0, _08076324
	adds r0, r5, r0
	ldrb r4, [r0]
	ldr r0, _08076328
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0807632C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	strh r4, [r2, 0x8]
	ldr r1, _08076330
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x24]
	ldrh r4, [r0, 0x20]
	adds r1, r4
	strh r1, [r2, 0xA]
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r2, 0xC]
	cmp r7, 0
	bne _0807633C
	ldr r0, _08076334
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _08076338
	b _08076344
	.align 2, 0
_08076324: .4byte gUnknown_02024BE0
_08076328: .4byte task_pA_ma0A_obj_to_bg_pal
_0807632C: .4byte gTasks
_08076330: .4byte gSprites
_08076334: .4byte gUnknown_030042C0
_08076338: .4byte gUnknown_030041B4
_0807633C:
	ldr r0, _08076368
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	ldr r0, _0807636C
_08076344:
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldr r0, _08076370
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r7, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldr r0, _08076374
	strb r3, [r0, 0x1]
_0807635A:
	ldr r1, _08076378
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076368: .4byte gUnknown_03004288
_0807636C: .4byte gUnknown_03004280
_08076370: .4byte gTasks
_08076374: .4byte gUnknown_0202F7C2
_08076378: .4byte gUnknown_0202F7A4
	thumb_func_end sub_8075DE0

	thumb_func_start b_side_obj__get_some_boolean
b_side_obj__get_some_boolean: @ 807637C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807639C
	ldr r0, _08076398
	ldrb r0, [r0]
	cmp r4, r0
	beq _080763DC
	b _080763EC
	.align 2, 0
_08076398: .4byte gUnknown_0202F7C8
_0807639C:
	adds r0, r4, 0
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _080763EC
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080763DC
	lsls r0, r5, 2
	ldr r1, _080763E0
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080763DC
	ldr r2, _080763E4
	ldr r0, _080763E8
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _080763EC
_080763DC:
	movs r0, 0x1
	b _080763EE
	.align 2, 0
_080763E0: .4byte 0x02017800
_080763E4: .4byte gSprites
_080763E8: .4byte gUnknown_02024BE0
_080763EC:
	movs r0, 0
_080763EE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end b_side_obj__get_some_boolean

	thumb_func_start sub_8076034
sub_8076034: @ 80763F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	cmp r1, 0
	beq _0807640E
	b _080765E0
_0807640E:
	add r4, sp, 0x10
	adds r0, r4, 0
	bl sub_8078914
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x1C
	add r0, sp, 0x20
	mov r10, r0
	mov r1, r9
	lsls r1, 5
	str r1, [sp, 0x24]
	movs r5, 0
	ldr r1, _08076554
	movs r4, 0x80
	lsls r4, 5
	mov r12, r6
	ldr r7, _08076558
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_0807643A:
	str r5, [sp, 0x1C]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0807643A
	str r5, [sp, 0x1C]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, [sp, 0x14]
	movs r0, 0xFF
	mov r3, r10
	strh r0, [r3]
	ldr r0, _08076554
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0807655C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r2, _08076560
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _08076564
	add r0, r9
	ldrb r4, [r0]
	ldr r5, _08076568
	ldr r0, _0807656C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x24]
	ldrh r1, [r1, 0x20]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r5]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080764DC
	ldr r0, _08076570
	ldrh r0, [r0]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _080764DC
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
_080764DC:
	ldr r3, _08076574
	ldr r2, _0807656C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	strh r0, [r3]
	ldr r0, _08076564
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08076578
	ldr r0, _08076568
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r3]
	strh r0, [r1]
	ldr r4, _0807657C
	ldr r0, [sp, 0x24]
	adds r4, r0, r4
	mov r2, sp
	ldrb r1, [r2, 0x18]
	lsls r1, 4
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	mov r3, sp
	ldrb r0, [r3, 0x18]
	lsls r0, 5
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	ldr r1, _08076554
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08076580
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076584
	movs r2, 0
	b _0807658E
	.align 2, 0
_08076554: .4byte 0x040000d4
_08076558: .4byte 0x85000400
_0807655C: .4byte 0x81000800
_08076560: .4byte 0x0400000a
_08076564: .4byte gUnknown_02024BE0
_08076568: .4byte gUnknown_030042C0
_0807656C: .4byte gSprites
_08076570: .4byte 0x02019348
_08076574: .4byte gUnknown_030041B4
_08076578: .4byte 0x04000014
_0807657C: .4byte 0x0202ecc8
_08076580: .4byte 0x84000008
_08076584:
	mov r0, r9
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r2, r0, 24
_0807658E:
	mov r0, sp
	ldrb r3, [r0, 0x18]
	ldr r0, [sp, 0x10]
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldr r4, [sp, 0x14]
	movs r1, 0xFA
	lsls r1, 24
	adds r0, r4, r1
	cmp r0, 0
	bge _080765AA
	ldr r1, _080765D8
	adds r0, r4, r1
_080765AA:
	asrs r0, 11
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080765DC
	ldr r0, [r0]
	lsls r0, 28
	lsrs r0, 30
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	bl sub_80E4EF8
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080765D0
	b _080766F8
_080765D0:
	bl sub_8076380
	b _080766F8
	.align 2, 0
_080765D8: .4byte 0xfa0007ff
_080765DC: .4byte 0x0400000a
_080765E0:
	ldr r3, _08076708
	movs r5, 0x80
	lsls r5, 6
	add r6, sp, 0x1C
	ldr r2, _0807670C
	mov r10, r2
	mov r0, r9
	lsls r0, 5
	str r0, [sp, 0x24]
	movs r4, 0
	ldr r1, _08076710
	movs r2, 0x80
	lsls r2, 5
	mov r12, r6
	ldr r7, _08076714
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_08076604:
	str r4, [sp, 0x1C]
	mov r0, r12
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	subs r5, r2
	cmp r5, r2
	bhi _08076604
	str r4, [sp, 0x1C]
	str r6, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r5, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, _08076718
	movs r0, 0
	str r0, [sp, 0x1C]
	ldr r5, _08076710
	str r6, [r5]
	str r1, [r5, 0x4]
	ldr r0, _0807671C
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	ldr r6, _08076720
	ldrb r1, [r6]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r6]
	ldrb r1, [r6, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r6, 0x1]
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	ldr r2, _08076724
	add r2, r9
	ldrb r4, [r2]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r10
	ldrh r0, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r0, r3
	negs r0, r0
	adds r0, 0x20
	ldr r3, _08076728
	strh r0, [r3]
	ldrh r0, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r0, r1
	negs r0, r0
	adds r0, 0x20
	ldr r1, _0807672C
	strh r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _08076730
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807672C
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r3, [sp, 0x24]
	ldr r0, _08076734
	adds r4, r3, r0
	adds r0, r4, 0
	movs r1, 0x90
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08076738
	str r4, [r5]
	str r0, [r5, 0x4]
	ldr r0, _0807673C
	str r0, [r5, 0x8]
	ldr r0, [r5, 0x8]
	mov r0, r9
	bl battle_get_per_side_status
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0xC0
	lsls r0, 7
	str r0, [sp]
	movs r0, 0x1E
	str r0, [sp, 0x4]
	ldr r0, [r6]
	lsls r0, 28
	lsrs r0, 30
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl sub_80E4EF8
_080766F8:
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076708: .4byte 0x06006000
_0807670C: .4byte gSprites
_08076710: .4byte 0x040000d4
_08076714: .4byte 0x85000400
_08076718: .4byte 0x0600f000
_0807671C: .4byte 0x85000200
_08076720: .4byte 0x0400000c
_08076724: .4byte gUnknown_02024BE0
_08076728: .4byte gUnknown_03004288
_0807672C: .4byte gUnknown_03004280
_08076730: .4byte 0x04000018
_08076734: .4byte 0x0202ecc8
_08076738: .4byte 0x05000120
_0807673C: .4byte 0x84000008
	thumb_func_end sub_8076034

	thumb_func_start sub_8076380
sub_8076380: @ 8076740
	push {r4-r7,lr}
	sub sp, 0xC
	ldr r0, _080767B8
	ldrh r0, [r0]
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _080767AE
	mov r0, sp
	bl sub_8078914
	ldr r6, [sp, 0x4]
	movs r5, 0
	movs r0, 0x7
	mov r12, r0
	movs r7, 0
_08076762:
	movs r4, 0
	adds r3, r7, r6
	mov r1, r12
	lsls r0, r1, 1
	adds r2, r0, r6
_0807676C:
	ldrh r1, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	strh r1, [r2]
	adds r3, 0x2
	subs r2, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0807676C
	movs r0, 0x20
	add r12, r0
	adds r7, 0x40
	adds r5, 0x1
	cmp r5, 0x7
	ble _08076762
	movs r5, 0
	movs r1, 0x80
	lsls r1, 3
	adds r3, r1, 0
_08076792:
	adds r2, r5, 0x1
	lsls r0, r5, 6
	adds r1, r0, r6
	movs r4, 0x7
_0807679A:
	ldrh r0, [r1]
	eors r0, r3
	strh r0, [r1]
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _0807679A
	adds r5, r2, 0
	cmp r5, 0x7
	ble _08076792
_080767AE:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080767B8: .4byte 0x02019348
	thumb_func_end sub_8076380

	thumb_func_start sub_80763FC
sub_80763FC: @ 80767BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r12, r1
	adds r7, r2, 0
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r3, 24
	movs r0, 0x40
	mov r9, r0
	cmp r3, 0
	bne _080767DA
	movs r1, 0x20
	mov r9, r1
_080767DA:
	lsls r0, r6, 28
	lsrs r6, r0, 16
	movs r0, 0
	cmp r0, r9
	bcs _08076812
	ldr r1, _08076820
	mov r8, r1
_080767E8:
	movs r3, 0
	adds r5, r0, 0x1
	lsls r4, r0, 5
_080767EE:
	adds r1, r4, r3
	lsls r1, 1
	add r1, r12
	ldrh r2, [r1]
	mov r0, r8
	ands r0, r2
	orrs r0, r6
	adds r0, r7
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _080767EE
	lsls r0, r5, 24
	lsrs r0, 24
	cmp r0, r9
	bcc _080767E8
_08076812:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076820: .4byte 0x00000fff
	thumb_func_end sub_80763FC

	thumb_func_start sub_8076464
sub_8076464: @ 8076824
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	add r5, sp, 0x4
	adds r0, r5, 0
	bl sub_8078914
	cmp r4, 0
	beq _0807684C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080768B0
_0807684C:
	ldr r2, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0x10
	ldr r0, _080768A0
	mov r9, r0
	ldr r0, _080768A4
	mov r10, r0
	movs r6, 0
	ldr r1, _080768A8
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _080768AC
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_0807686E:
	str r6, [sp, 0x10]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0807686E
	str r6, [sp, 0x10]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, [sp, 0x8]
	b _08076900
	.align 2, 0
_080768A0: .4byte gUnknown_030042C0
_080768A4: .4byte gUnknown_030041B4
_080768A8: .4byte 0x040000d4
_080768AC: .4byte 0x85000400
_080768B0:
	ldr r2, _08076928
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0x10
	ldr r0, _0807692C
	mov r9, r0
	ldr r0, _08076930
	mov r10, r0
	movs r6, 0
	ldr r1, _08076934
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _08076938
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_080768D2:
	str r6, [sp, 0x10]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080768D2
	str r6, [sp, 0x10]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	ldr r1, _0807693C
_08076900:
	movs r2, 0
	str r2, [sp, 0x10]
	ldr r0, _08076934
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08076940
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r9
	strh r2, [r0]
	mov r0, r10
	strh r2, [r0]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076928: .4byte 0x06006000
_0807692C: .4byte gUnknown_03004288
_08076930: .4byte gUnknown_03004280
_08076934: .4byte 0x040000d4
_08076938: .4byte 0x85000400
_0807693C: .4byte 0x0600f000
_08076940: .4byte 0x85000200
	thumb_func_end sub_8076464

	thumb_func_start task_pA_ma0A_obj_to_bg_pal
task_pA_ma0A_obj_to_bg_pal: @ 8076944
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080769BC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	ldrb r4, [r5, 0x8]
	ldrb r6, [r5, 0x14]
	mov r0, sp
	bl sub_8078914
	ldr r0, _080769C0
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x24]
	ldrh r0, [r1, 0x20]
	adds r2, r0
	ldrh r0, [r5, 0xA]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r2, [r1, 0x26]
	ldrh r1, [r1, 0x22]
	adds r2, r1
	ldrh r0, [r5, 0xC]
	subs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x12
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080769D4
	ldr r1, _080769C4
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _080769C8
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r2, r6, 5
	ldr r1, _080769CC
	adds r2, r1
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 5
	ldr r3, _080769D0
	adds r1, r3
	adds r0, r1
	b _080769F4
	.align 2, 0
_080769BC: .4byte gTasks
_080769C0: .4byte gSprites
_080769C4: .4byte gUnknown_030042C0
_080769C8: .4byte gUnknown_030041B4
_080769CC: .4byte 0x0202f0c8
_080769D0: .4byte 0xfffffe00
_080769D4:
	ldr r1, _08076A08
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r5, 0xE]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _08076A0C
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r5, [r5, 0x10]
	adds r0, r5
	strh r0, [r1]
	lsls r2, r6, 5
	ldr r0, _08076A10
	adds r2, r0
	subs r0, 0xE0
_080769F4:
	ldr r1, _08076A14
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _08076A18
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076A08: .4byte gUnknown_03004288
_08076A0C: .4byte gUnknown_03004280
_08076A10: .4byte 0x0202f0c8
_08076A14: .4byte 0x040000d4
_08076A18: .4byte 0x84000008
	thumb_func_end task_pA_ma0A_obj_to_bg_pal

	thumb_func_start ma0B_0807324C
ma0B_0807324C: @ 8076A1C
	push {r4,r5,lr}
	ldr r0, _08076A30
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r4, [r2, 0x1]
	cmp r4, 0
	bne _08076A34
	movs r4, 0x2
	b _08076A3E
	.align 2, 0
_08076A30: .4byte gUnknown_0202F7A4
_08076A34:
	cmp r4, 0x1
	bne _08076A3A
	movs r4, 0x3
_08076A3A:
	cmp r4, 0
	beq _08076A42
_08076A3E:
	cmp r4, 0x2
	bne _08076A4C
_08076A42:
	ldr r0, _08076A48
	b _08076A4E
	.align 2, 0
_08076A48: .4byte gUnknown_0202F7C8
_08076A4C:
	ldr r0, _08076AA4
_08076A4E:
	ldrb r5, [r0]
	ldr r3, _08076AA8
	ldrb r0, [r3]
	cmp r0, 0xFF
	beq _08076A74
	ldr r2, _08076AAC
	ldr r0, _08076AB0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08076A74:
	cmp r4, 0x1
	bls _08076AB4
	ldrb r0, [r3, 0x1]
	cmp r0, 0xFF
	beq _08076AB4
	ldr r3, _08076AAC
	ldr r2, _08076AB0
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _08076AB6
	.align 2, 0
_08076AA4: .4byte gUnknown_0202F7C9
_08076AA8: .4byte gUnknown_0202F7C2
_08076AAC: .4byte gSprites
_08076AB0: .4byte gUnknown_02024BE0
_08076AB4:
	movs r4, 0
_08076AB6:
	ldr r0, _08076AE0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076AE4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xC]
	ldr r1, _08076AE8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076AE0: .4byte sub_807672C
_08076AE4: .4byte gTasks
_08076AE8: .4byte gUnknown_0202F7A4
	thumb_func_end ma0B_0807324C

	thumb_func_start sub_807672C
sub_807672C: @ 8076AEC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08076B2C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _08076B76
	ldrb r0, [r1, 0xC]
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076B28
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076B30
_08076B28:
	movs r4, 0
	b _08076B32
	.align 2, 0
_08076B2C: .4byte gTasks
_08076B30:
	movs r4, 0x1
_08076B32:
	ldr r6, _08076B7C
	ldrb r0, [r6]
	cmp r0, 0xFF
	beq _08076B4A
	adds r0, r4, 0
	bl sub_8076464
	ldrb r0, [r6]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6]
_08076B4A:
	ldr r0, _08076B80
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _08076B70
	movs r0, 0x1
	eors r4, r0
	adds r0, r4, 0
	bl sub_8076464
	ldrb r0, [r6, 0x1]
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r6, 0x1]
_08076B70:
	adds r0, r5, 0
	bl DestroyTask
_08076B76:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076B7C: .4byte gUnknown_0202F7C2
_08076B80: .4byte gTasks
	thumb_func_end sub_807672C

	thumb_func_start sub_80767C4
sub_80767C4: @ 8076B84
	push {r4,r5,lr}
	ldr r0, _08076B98
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _08076B9C
	movs r5, 0x2
	b _08076BA6
	.align 2, 0
_08076B98: .4byte gUnknown_0202F7A4
_08076B9C:
	cmp r5, 0x1
	bne _08076BA2
	movs r5, 0x3
_08076BA2:
	cmp r5, 0
	beq _08076BAA
_08076BA6:
	cmp r5, 0x2
	bne _08076BB4
_08076BAA:
	ldr r0, _08076BB0
	b _08076BB6
	.align 2, 0
_08076BB0: .4byte gUnknown_0202F7C8
_08076BB4:
	ldr r0, _08076BE8
_08076BB6:
	ldrb r4, [r0]
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076C10
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076BE2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076BEC
_08076BE2:
	movs r1, 0
	b _08076BEE
	.align 2, 0
_08076BE8: .4byte gUnknown_0202F7C9
_08076BEC:
	movs r1, 0x1
_08076BEE:
	adds r0, r4, 0
	bl sub_8076034
	ldr r2, _08076C48
	ldr r0, _08076C4C
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08076C10:
	movs r0, 0x2
	eors r4, r0
	cmp r5, 0x1
	bls _08076C74
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076C74
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076C42
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076C50
_08076C42:
	movs r1, 0
	b _08076C52
	.align 2, 0
_08076C48: .4byte gSprites
_08076C4C: .4byte gUnknown_02024BE0
_08076C50:
	movs r1, 0x1
_08076C52:
	adds r0, r4, 0
	bl sub_8076034
	ldr r2, _08076C84
	ldr r0, _08076C88
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08076C74:
	ldr r1, _08076C8C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076C84: .4byte gSprites
_08076C88: .4byte gUnknown_02024BE0
_08076C8C: .4byte gUnknown_0202F7A4
	thumb_func_end sub_80767C4

	thumb_func_start ma23_8073484
ma23_8073484: @ 8076C90
	push {r4-r6,lr}
	ldr r0, _08076CA4
	ldr r2, [r0]
	adds r1, r2, 0x1
	str r1, [r0]
	ldrb r5, [r2, 0x1]
	cmp r5, 0
	bne _08076CA8
	movs r5, 0x2
	b _08076CB2
	.align 2, 0
_08076CA4: .4byte gUnknown_0202F7A4
_08076CA8:
	cmp r5, 0x1
	bne _08076CAE
	movs r5, 0x3
_08076CAE:
	cmp r5, 0
	beq _08076CB6
_08076CB2:
	cmp r5, 0x2
	bne _08076CC0
_08076CB6:
	ldr r0, _08076CBC
	b _08076CC2
	.align 2, 0
_08076CBC: .4byte gUnknown_0202F7C8
_08076CC0:
	ldr r0, _08076D20
_08076CC2:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076CEC
	ldr r2, _08076D24
	ldr r0, _08076D28
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08076CEC:
	cmp r5, 0x1
	bls _08076D2C
	movs r0, 0x2
	adds r4, r6, 0
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076D2C
	ldr r2, _08076D24
	ldr r0, _08076D28
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _08076D2E
	.align 2, 0
_08076D20: .4byte gUnknown_0202F7C9
_08076D24: .4byte gSprites
_08076D28: .4byte gUnknown_02024BE0
_08076D2C:
	movs r5, 0
_08076D2E:
	ldr r0, _08076D58
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08076D5C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r6, [r1, 0xC]
	ldr r1, _08076D60
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076D58: .4byte sub_80769A4
_08076D5C: .4byte gTasks
_08076D60: .4byte gUnknown_0202F7A4
	thumb_func_end ma23_8073484

	thumb_func_start sub_80769A4
sub_80769A4: @ 8076D64
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08076DA8
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	beq _08076DF2
	ldrb r4, [r1, 0xC]
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08076DA2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08076DAC
_08076DA2:
	movs r5, 0
	b _08076DAE
	.align 2, 0
_08076DA8: .4byte gTasks
_08076DAC:
	movs r5, 0x1
_08076DAE:
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076DC0
	adds r0, r5, 0
	bl sub_8076464
_08076DC0:
	ldr r0, _08076DF8
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _08076DEC
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08076DEC
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_08076DEC:
	adds r0, r6, 0
	bl DestroyTask
_08076DF2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076DF8: .4byte gTasks
	thumb_func_end sub_80769A4

	thumb_func_start sub_8076A3C
sub_8076A3C: @ 8076DFC
	push {r4,lr}
	ldr r2, _08076E2C
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r3, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	adds r0, 0x1
	str r0, [r2]
	ldr r2, _08076E30
	movs r4, 0xFD
	lsls r4, 6
	adds r0, r4, 0
	strh r0, [r2]
	ldr r0, _08076E34
	orrs r3, r1
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076E2C: .4byte gUnknown_0202F7A4
_08076E30: .4byte 0x04000050
_08076E34: .4byte 0x04000052
	thumb_func_end sub_8076A3C

	thumb_func_start sub_8076A78
sub_8076A78: @ 8076E38
	ldr r2, _08076E58
	ldr r0, [r2]
	adds r1, r0, 0x1
	str r1, [r2]
	ldrb r3, [r0, 0x1]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	adds r0, 0x1
	str r0, [r2]
	ldr r0, _08076E5C
	orrs r3, r1
	strh r3, [r0]
	bx lr
	.align 2, 0
_08076E58: .4byte gUnknown_0202F7A4
_08076E5C: .4byte 0x04000050
	thumb_func_end sub_8076A78

	thumb_func_start sub_8076AA0
sub_8076AA0: @ 8076E60
	ldr r1, _08076E74
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08076E78
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08076E74: .4byte gUnknown_0202F7A4
_08076E78: .4byte 0x04000050
	thumb_func_end sub_8076AA0

	thumb_func_start ma0E_call
ma0E_call: @ 8076E7C
	push {r4,lr}
	ldr r4, _08076EA8
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldr r2, _08076EAC
	adds r0, r1, 0x5
	str r0, [r2]
	ldrb r1, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076EA8: .4byte gUnknown_0202F7A4
_08076EAC: .4byte gUnknown_0202F7A8
	thumb_func_end ma0E_call

	thumb_func_start sub_8076AF0
sub_8076AF0: @ 8076EB0
	ldr r0, _08076EBC
	ldr r1, _08076EC0
	ldr r1, [r1]
	str r1, [r0]
	bx lr
	.align 2, 0
_08076EBC: .4byte gUnknown_0202F7A4
_08076EC0: .4byte gUnknown_0202F7A8
	thumb_func_end sub_8076AF0

	thumb_func_start ma10_080736AC
ma10_080736AC: @ 8076EC4
	push {r4,r5,lr}
	ldr r5, _08076EF0
	ldr r1, [r5]
	adds r0, r1, 0x1
	str r0, [r5]
	ldrb r2, [r1, 0x1]
	adds r3, r0, 0x1
	str r3, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r4, r0
	adds r1, 0x4
	str r1, [r5]
	ldr r0, _08076EF4
	lsls r2, 1
	adds r2, r0
	strh r4, [r2]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076EF0: .4byte gUnknown_0202F7A4
_08076EF4: .4byte gUnknown_03004B00
	thumb_func_end ma10_080736AC

	thumb_func_start ma11_if_else
ma11_if_else: @ 8076EF8
	push {lr}
	ldr r3, _08076F30
	ldr r2, [r3]
	adds r0, r2, 0x1
	str r0, [r3]
	ldr r0, _08076F34
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08076F12
	adds r0, r2, 0x5
	str r0, [r3]
_08076F12:
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08076F30: .4byte gUnknown_0202F7A4
_08076F34: .4byte gUnknown_0202F7C4
	thumb_func_end ma11_if_else

	thumb_func_start ma12_cond_if
ma12_cond_if: @ 8076F38
	push {r4,r5,lr}
	ldr r5, _08076F68
	ldr r4, [r5]
	adds r2, r4, 0x1
	str r2, [r5]
	ldrb r1, [r4, 0x1]
	adds r3, r2, 0x1
	str r3, [r5]
	ldr r0, _08076F6C
	ldrb r0, [r0]
	cmp r1, r0
	bne _08076F70
	ldrb r1, [r2, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _08076F74
	.align 2, 0
_08076F68: .4byte gUnknown_0202F7A4
_08076F6C: .4byte gUnknown_0202F7C4
_08076F70:
	adds r0, r4, 0x6
	str r0, [r5]
_08076F74:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ma12_cond_if

	thumb_func_start sub_8076BBC
sub_8076BBC: @ 8076F7C
	ldr r3, _08076F9C
	ldr r0, [r3]
	adds r2, r0, 0x1
	str r2, [r3]
	ldrb r1, [r0, 0x1]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_08076F9C: .4byte gUnknown_0202F7A4
	thumb_func_end sub_8076BBC

	thumb_func_start sub_8076BE0
sub_8076BE0: @ 8076FA0
	push {lr}
	ldr r0, _08076FB8
	ldr r1, _08076FBC
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08076FC0
	movs r0, 0
	b _08076FC2
	.align 2, 0
_08076FB8: .4byte gMain
_08076FBC: .4byte 0x0000043d
_08076FC0:
	movs r0, 0x1
_08076FC2:
	pop {r1}
	bx r1
	thumb_func_end sub_8076BE0

	thumb_func_start ma14_load_background
ma14_load_background: @ 8076FC8
	push {r4,lr}
	ldr r1, _08076FFC
	ldr r2, [r1]
	adds r0, r2, 0x1
	str r0, [r1]
	ldrb r4, [r2, 0x1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08077000
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08077004
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	ldr r1, _08077008
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076FFC: .4byte gUnknown_0202F7A4
_08077000: .4byte task_p5_load_battle_screen_elements
_08077004: .4byte gTasks
_08077008: .4byte gUnknown_0202F7C5
	thumb_func_end ma14_load_background

	thumb_func_start sub_8076C4C
sub_8076C4C: @ 807700C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r2, _0807704C
	ldr r1, [r2]
	adds r0, r1, 0x1
	str r0, [r2]
	ldrb r3, [r1, 0x1]
	mov r8, r3
	ldrb r7, [r0, 0x1]
	ldrb r6, [r0, 0x2]
	adds r1, 0x4
	str r1, [r2]
	ldr r0, _08077050
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077058
	ldr r1, _08077054
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r6, [r0, 0x8]
	b _0807708A
	.align 2, 0
_0807704C: .4byte gUnknown_0202F7A4
_08077050: .4byte task_p5_load_battle_screen_elements
_08077054: .4byte gTasks
_08077058:
	ldr r0, _08077074
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807707C
	ldr r1, _08077078
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x8]
	b _0807708A
	.align 2, 0
_08077074: .4byte gUnknown_0202F7C9
_08077078: .4byte gTasks
_0807707C:
	ldr r1, _0807709C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x8]
_0807708A:
	ldr r1, _080770A0
	movs r0, 0x1
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807709C: .4byte gTasks
_080770A0: .4byte gUnknown_0202F7C5
	thumb_func_end sub_8076C4C

	thumb_func_start task_p5_load_battle_screen_elements
task_p5_load_battle_screen_elements: @ 80770A4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080770D8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r6, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r3, [r4, r0]
	adds r7, r1, 0
	cmp r3, 0
	bne _080770DC
	str r3, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginHardwarePaletteFade
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	b _0807716C
	.align 2, 0
_080770D8: .4byte gTasks
_080770DC:
	ldr r2, _080770F8
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807716C
	cmp r3, 0x1
	bne _08077100
	adds r0, r6, 0x1
	strh r0, [r4, 0x1C]
	ldr r1, _080770FC
	movs r0, 0x2
	strb r0, [r1]
	b _08077144
	.align 2, 0
_080770F8: .4byte gPaletteFade
_080770FC: .4byte gUnknown_0202F7C5
_08077100:
	cmp r3, 0x2
	bne _08077144
	ldrh r0, [r4, 0x8]
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08077118
	bl dp01t_11_3_message_for_player_only
	b _0807711E
_08077118:
	lsrs r0, r2, 16
	bl sub_8076DB8
_0807711E:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xE8
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r1, _08077140
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	adds r1, 0x1
	strh r1, [r0, 0x1C]
	b _0807716C
	.align 2, 0
_08077140: .4byte gTasks
_08077144:
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807716C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x1C
	ldrsh r0, [r0, r1]
	cmp r0, 0x3
	bne _0807716C
	adds r0, r5, 0
	bl DestroyTask
	ldr r0, _08077174
	strb r4, [r0]
_0807716C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077174: .4byte gUnknown_0202F7C5
	thumb_func_end task_p5_load_battle_screen_elements

	thumb_func_start sub_8076DB8
sub_8076DB8: @ 8077178
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077230
	ldr r7, _08077214
	lsls r0, r6, 1
	adds r0, r6
	lsls r4, r0, 2
	adds r0, r7, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r5, [r0]
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _08077218
	cmp r0, 0
	beq _080771A8
	ldr r0, _0807721C
	adds r1, r0
_080771A8:
	adds r0, r5, 0
	bl sub_800D238
	bl sub_80789BC
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _08077218
	cmp r0, 0
	beq _080771C6
	ldr r0, _0807721C
	adds r1, r0
_080771C6:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r5, 0
	movs r3, 0
	bl sub_80763FC
	bl sub_8076BE0
	lsls r0, 24
	ldr r2, _08077218
	cmp r0, 0
	beq _080771E2
	ldr r0, _0807721C
	adds r2, r0
_080771E2:
	ldr r1, _08077220
	ldr r0, _08077224
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _08077228
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	adds r0, r4, r7
	ldr r0, [r0]
	ldr r1, _0807722C
	bl LZDecompressVram
	adds r0, r7, 0x4
	adds r0, r4, r0
	ldr r4, [r0]
	bl sub_80789BC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 20
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	b _0807725E
	.align 2, 0
_08077214: .4byte gBattleAnimBackgroundTable
_08077218: .4byte 0x02018000
_0807721C: .4byte 0xffffc800
_08077220: .4byte 0x0600d000
_08077224: .4byte 0x040000d4
_08077228: .4byte 0x84000200
_0807722C: .4byte 0x06002000
_08077230:
	ldr r5, _08077264
	lsls r4, r6, 1
	adds r4, r6
	lsls r4, 2
	adds r0, r5, 0
	adds r0, 0x8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08077268
	bl LZDecompressVram
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _0807726C
	bl LZDecompressVram
	adds r5, 0x4
	adds r4, r5
	ldr r0, [r4]
	movs r1, 0x20
	movs r2, 0x20
	bl LoadCompressedPalette
_0807725E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077264: .4byte gBattleAnimBackgroundTable
_08077268: .4byte 0x0600d000
_0807726C: .4byte 0x06008000
	thumb_func_end sub_8076DB8

	thumb_func_start dp01t_11_3_message_for_player_only
dp01t_11_3_message_for_player_only: @ 8077270
	push {lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077282
	bl sub_80AB2AC
	b _08077286
_08077282:
	bl sub_800D7B8
_08077286:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_3_message_for_player_only

	thumb_func_start ma15_load_battle_screen_elements
ma15_load_battle_screen_elements: @ 807728C
	push {lr}
	ldr r1, _080772BC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _080772C0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080772C4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080772C8
	strh r0, [r1, 0x8]
	ldr r1, _080772CC
	movs r0, 0x1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080772BC: .4byte gUnknown_0202F7A4
_080772C0: .4byte task_p5_load_battle_screen_elements
_080772C4: .4byte gTasks
_080772C8: .4byte 0x0000ffff
_080772CC: .4byte gUnknown_0202F7C5
	thumb_func_end ma15_load_battle_screen_elements

	thumb_func_start ma16_wait_for_battle_screen_elements_s2
ma16_wait_for_battle_screen_elements_s2: @ 80772D0
	push {lr}
	ldr r0, _080772E8
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _080772F4
	ldr r1, _080772EC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _080772F0
	movs r0, 0
	b _080772F8
	.align 2, 0
_080772E8: .4byte gUnknown_0202F7C5
_080772EC: .4byte gUnknown_0202F7A4
_080772F0: .4byte gUnknown_0202F7B0
_080772F4:
	ldr r1, _08077300
	movs r0, 0x1
_080772F8:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08077300: .4byte gUnknown_0202F7B0
	thumb_func_end ma16_wait_for_battle_screen_elements_s2

	thumb_func_start sub_8076F44
sub_8076F44: @ 8077304
	push {lr}
	ldr r0, _0807731C
	ldrb r2, [r0]
	cmp r2, 0
	bne _08077328
	ldr r0, _08077320
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	ldr r0, _08077324
	strb r2, [r0]
	b _0807732E
	.align 2, 0
_0807731C: .4byte gUnknown_0202F7C5
_08077320: .4byte gUnknown_0202F7A4
_08077324: .4byte gUnknown_0202F7B0
_08077328:
	ldr r1, _08077334
	movs r0, 0x1
	strb r0, [r1]
_0807732E:
	pop {r0}
	bx r0
	.align 2, 0
_08077334: .4byte gUnknown_0202F7B0
	thumb_func_end sub_8076F44

	thumb_func_start ma18_load_background_probably
ma18_load_background_probably: @ 8077338
	push {r4,lr}
	ldr r4, _08077354
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	ldrb r0, [r1, 0x1]
	bl sub_8076DB8
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077354: .4byte gUnknown_0202F7A4
	thumb_func_end ma18_load_background_probably

	thumb_func_start sub_8076F98
sub_8076F98: @ 8077358
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807739C
	ldr r0, _08077394
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08077398
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807739C
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _0807742E
	movs r4, 0x3F
	b _0807742E
	.align 2, 0
_08077394: .4byte gUnknown_0202F7C8
_08077398: .4byte 0x02017810
_0807739C:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080773C4
	ldr r0, _080773BC
	ldr r1, _080773C0
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08077428
	cmp r0, 0x2
	bne _08077428
	cmp r4, 0x3F
	beq _0807743A
	b _08077428
	.align 2, 0
_080773BC: .4byte gUnknown_0202F7C8
_080773C0: .4byte gUnknown_0202F7C9
_080773C4:
	ldr r0, _080773EC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08077402
	ldr r0, _080773F0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807742E
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0x3F
	bne _080773F4
	movs r4, 0xC0
	b _0807742E
	.align 2, 0
_080773EC: .4byte gUnknown_0202F7C8
_080773F0: .4byte gUnknown_0202F7C9
_080773F4:
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	beq _0807742E
	negs r0, r1
	lsls r0, 24
	b _0807742C
_08077402:
	ldr r0, _08077424
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08077428
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bne _0807742E
	movs r4, 0x3F
	b _0807742E
	.align 2, 0
_08077424: .4byte gUnknown_0202F7C9
_08077428:
	lsls r0, r4, 24
	negs r0, r0
_0807742C:
	lsrs r4, r0, 24
_0807742E:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _0807743A
	movs r4, 0x3F
	b _08077448
_0807743A:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	bge _08077448
	movs r4, 0xC0
_08077448:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8076F98

	thumb_func_start sub_8077094
sub_8077094: @ 8077454
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077498
	ldr r0, _08077490
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08077494
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08077498
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	movs r4, 0xC0
	cmp r0, 0
	beq _080774B6
	movs r4, 0x3F
	b _080774B6
	.align 2, 0
_08077490: .4byte gUnknown_0202F7C8
_08077494: .4byte 0x02017810
_08077498:
	ldr r0, _080774C0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080774B0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080774B6
_080774B0:
	lsls r0, r4, 24
	negs r0, r0
	lsrs r4, r0, 24
_080774B6:
	lsls r0, r4, 24
	asrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080774C0: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8077094

	thumb_func_start sub_8077104
sub_8077104: @ 80774C4
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r2, r0, 16
	cmp r2, 0x3F
	ble _080774D4
	movs r1, 0x3F
	b _080774DE
_080774D4:
	movs r0, 0x40
	negs r0, r0
	cmp r2, r0
	bge _080774DE
	ldr r1, _080774E8
_080774DE:
	lsls r0, r1, 16
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080774E8: .4byte 0x0000ffc0
	thumb_func_end sub_8077104

	thumb_func_start sub_807712C
sub_807712C: @ 80774EC
	push {lr}
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2, 0
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _0807750A
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0
	bge _0807751A
	b _08077518
_0807750A:
	cmp r0, r1
	ble _08077520
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _08077518
	negs r0, r0
_08077518:
	negs r0, r0
_0807751A:
	lsls r0, 16
	lsrs r0, 16
	b _08077522
_08077520:
	movs r0, 0
_08077522:
	lsls r0, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_807712C

	thumb_func_start ma19_08073BC8
ma19_08073BC8: @ 807752C
	push {r4,r5,lr}
	ldr r5, _08077560
	ldr r0, [r5]
	adds r1, r0, 0x1
	str r1, [r5]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r4, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	bl PlaySE12WithPanning
	ldr r0, [r5]
	adds r0, 0x3
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077560: .4byte gUnknown_0202F7A4
	thumb_func_end ma19_08073BC8

	thumb_func_start ma1A_8073C00
ma1A_8073C00: @ 8077564
	push {r4,lr}
	ldr r4, _0807758C
	ldr r1, [r4]
	adds r0, r1, 0x1
	str r0, [r4]
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807758C: .4byte gUnknown_0202F7A4
	thumb_func_end ma1A_8073C00

	thumb_func_start ma1B_8073C2C
ma1B_8073C2C: @ 8077590
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077640
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8076F98
	mov r8, r0
	lsls r5, 24
	asrs r5, 24
	mov r0, r8
	lsls r0, 24
	asrs r0, 24
	mov r8, r0
	lsls r6, 24
	asrs r6, 24
	adds r0, r5, 0
	mov r1, r8
	adds r2, r6, 0
	bl sub_807712C
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077644
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08077648
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	mov r2, r8
	strh r2, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r5, [r1, 0x10]
	mov r0, r9
	adds r1, r5, 0
	bl PlaySE12WithPanning
	ldr r1, _0807764C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r10
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077640: .4byte gUnknown_0202F7A4
_08077644: .4byte c3_08073CEC
_08077648: .4byte gTasks
_0807764C: .4byte gUnknown_0202F7B3
	thumb_func_end ma1B_8073C2C

	thumb_func_start c3_08073CEC
c3_08073CEC: @ 8077650
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	ldr r1, _08077694
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xE
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080776D4
	strh r7, [r2, 0x18]
	ldrh r6, [r2, 0x8]
	ldrh r3, [r2, 0xA]
	movs r4, 0x10
	ldrsh r0, [r2, r4]
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	adds r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	strh r4, [r2, 0x10]
	cmp r1, 0
	bne _08077698
	lsls r2, r3, 16
	b _080776BC
	.align 2, 0
_08077694: .4byte gTasks
_08077698:
	lsls r1, r6, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	adds r2, r0, 0
	cmp r1, r2
	bge _080776AE
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	blt _080776B8
	b _080776BC
_080776AE:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, r3
	bgt _080776B8
	movs r7, 0x1
_080776B8:
	cmp r7, 0
	beq _080776CC
_080776BC:
	lsrs r4, r2, 16
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _080776DC
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080776CC:
	lsls r0, r4, 24
	asrs r0, 24
	bl SE12PanpotControl
_080776D4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080776DC: .4byte gUnknown_0202F7B3
	thumb_func_end c3_08073CEC

	thumb_func_start sub_8077320
sub_8077320: @ 80776E0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _08077764
	mov r9, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r9
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r8, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r8
	orrs r2, r0
	mov r8, r2
	ldrb r4, [r1, 0x2]
	ldrb r5, [r1, 0x3]
	ldrb r6, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	mov r10, r1
	ldr r0, _08077768
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807776C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0xC]
	mov r0, r10
	strh r0, [r1, 0xE]
	strh r4, [r1, 0x10]
	mov r0, r8
	adds r1, r4, 0
	bl PlaySE12WithPanning
	ldr r1, _08077770
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	ldr r0, [r1]
	adds r0, 0x6
	str r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077764: .4byte gUnknown_0202F7A4
_08077768: .4byte c3_08073CEC
_0807776C: .4byte gTasks
_08077770: .4byte gUnknown_0202F7B3
	thumb_func_end sub_8077320

	thumb_func_start sub_80773B4
sub_80773B4: @ 8077774
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08077824
	mov r10, r0
	ldr r0, [r0]
	adds r1, r0, 0x1
	mov r2, r10
	str r1, [r2]
	ldrb r0, [r0, 0x1]
	mov r9, r0
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	mov r2, r9
	orrs r2, r0
	mov r9, r2
	ldrb r4, [r1, 0x3]
	ldrb r0, [r1, 0x4]
	mov r8, r0
	ldrb r7, [r1, 0x5]
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8077094
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl sub_8077094
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	mov r0, r8
	bl sub_8077094
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077828
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807782C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r6, 24
	asrs r6, 24
	strh r6, [r1, 0x8]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r1, 0xA]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xC]
	strh r7, [r1, 0xE]
	strh r6, [r1, 0x10]
	mov r0, r9
	adds r1, r6, 0
	bl PlaySE12WithPanning
	ldr r1, _08077830
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x6
	str r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077824: .4byte gUnknown_0202F7A4
_08077828: .4byte c3_08073CEC
_0807782C: .4byte gTasks
_08077830: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80773B4

	thumb_func_start ma1C_8073ED0
ma1C_8073ED0: @ 8077834
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r6, _080778AC
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	ldrb r2, [r1, 0x4]
	mov r9, r2
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080778B0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080778B4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r2, r8
	strh r2, [r1, 0xC]
	mov r2, r9
	strh r2, [r1, 0xE]
	mov r2, r8
	strh r2, [r1, 0x18]
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _080778B8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5
	str r0, [r6]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080778AC: .4byte gUnknown_0202F7A4
_080778B0: .4byte sub_80774FC
_080778B4: .4byte gTasks
_080778B8: .4byte gUnknown_0202F7B3
	thumb_func_end ma1C_8073ED0

	thumb_func_start sub_80774FC
sub_80774FC: @ 80778BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08077910
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x18]
	adds r1, r0, 0x1
	strh r1, [r2, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _0807790A
	movs r0, 0
	strh r0, [r2, 0x18]
	ldrh r0, [r2, 0x8]
	ldrb r1, [r2, 0xA]
	ldrh r4, [r2, 0xE]
	subs r4, 0x1
	strh r4, [r2, 0xE]
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	cmp r4, 0
	bne _0807790A
	adds r0, r5, 0
	bl DestroyTask
	ldr r1, _08077914
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_0807790A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077910: .4byte gTasks
_08077914: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80774FC

	thumb_func_start ma1D_08073FB4
ma1D_08073FB4: @ 8077918
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r6, _0807797C
	ldr r0, [r6]
	adds r1, r0, 0x1
	str r1, [r6]
	ldrb r5, [r0, 0x1]
	ldrb r0, [r1, 0x1]
	lsls r0, 8
	orrs r5, r0
	ldrb r0, [r1, 0x3]
	mov r8, r0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08077980
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08077984
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	mov r0, r8
	strh r0, [r1, 0xC]
	ldr r1, _08077988
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807797C: .4byte gUnknown_0202F7A4
_08077980: .4byte sub_80775CC
_08077984: .4byte gTasks
_08077988: .4byte gUnknown_0202F7B3
	thumb_func_end ma1D_08073FB4

	thumb_func_start sub_80775CC
sub_80775CC: @ 807798C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080779C8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xC]
	subs r1, r0, 0x1
	strh r1, [r2, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _080779C0
	ldrh r0, [r2, 0x8]
	movs r1, 0xA
	ldrsb r1, [r2, r1]
	bl PlaySE12WithPanning
	adds r0, r4, 0
	bl DestroyTask
	ldr r1, _080779CC
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080779C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080779C8: .4byte gTasks
_080779CC: .4byte gUnknown_0202F7B3
	thumb_func_end sub_80775CC

	thumb_func_start sub_8077610
sub_8077610: @ 80779D0
	push {r4-r6,lr}
	ldr r4, _08077A38
	ldr r1, [r4]
	adds r3, r1, 0x1
	str r3, [r4]
	ldrb r2, [r1, 0x1]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	adds r2, r0
	ldrb r0, [r3, 0x2]
	lsls r0, 16
	adds r2, r0
	ldrb r0, [r3, 0x3]
	lsls r0, 24
	adds r6, r2, r0
	adds r0, r1, 0x5
	str r0, [r4]
	ldrb r0, [r1, 0x5]
	adds r1, 0x6
	str r1, [r4]
	cmp r0, 0
	beq _08077A1A
	adds r5, r4, 0
	ldr r4, _08077A3C
	adds r3, r0, 0
_08077A02:
	ldr r2, [r5]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r4]
	adds r2, 0x2
	str r2, [r5]
	adds r4, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08077A02
_08077A1A:
	adds r0, r6, 0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r6
	ldr r1, _08077A40
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077A38: .4byte gUnknown_0202F7A4
_08077A3C: .4byte gUnknown_03004B00
_08077A40: .4byte gUnknown_0202F7B3
	thumb_func_end sub_8077610

	thumb_func_start ma20_wait_for_something
ma20_wait_for_something: @ 8077A44
	push {r4,r5,lr}
	ldr r0, _08077A7C
	ldrb r5, [r0]
	cmp r5, 0
	bne _08077A8C
	bl IsSEPlaying
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08077AA4
	ldr r4, _08077A80
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5A
	bls _08077A92
	ldr r0, _08077A84
	bl m4aMPlayStop
	ldr r0, _08077A88
	bl m4aMPlayStop
	strh r5, [r4]
	b _08077AB6
	.align 2, 0
_08077A7C: .4byte gUnknown_0202F7B3
_08077A80: .4byte gUnknown_03004AF0
_08077A84: .4byte gMPlay_SE1
_08077A88: .4byte gMPlay_SE2
_08077A8C:
	ldr r1, _08077A9C
	movs r0, 0
	strh r0, [r1]
_08077A92:
	ldr r1, _08077AA0
	movs r0, 0x1
	strb r0, [r1]
	b _08077AB6
	.align 2, 0
_08077A9C: .4byte gUnknown_03004AF0
_08077AA0: .4byte gUnknown_0202F7B0
_08077AA4:
	ldr r0, _08077ABC
	movs r2, 0
	strh r1, [r0]
	ldr r1, _08077AC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r0, _08077AC4
	strb r2, [r0]
_08077AB6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077ABC: .4byte gUnknown_03004AF0
_08077AC0: .4byte gUnknown_0202F7A4
_08077AC4: .4byte gUnknown_0202F7B0
	thumb_func_end ma20_wait_for_something

	thumb_func_start ma21_08074164
ma21_08074164: @ 8077AC8
	push {r4-r6,lr}
	ldr r5, _08077B08
	ldr r4, [r5]
	adds r3, r4, 0x1
	str r3, [r5]
	ldrb r2, [r4, 0x1]
	ldrb r1, [r3, 0x1]
	ldrb r0, [r3, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldr r0, _08077B0C
	lsls r2, 1
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	movs r6, 0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	bne _08077B10
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	adds r1, r0
	str r1, [r5]
	b _08077B16
	.align 2, 0
_08077B08: .4byte gUnknown_0202F7A4
_08077B0C: .4byte gUnknown_03004B00
_08077B10:
	adds r0, r4, 0
	adds r0, 0x8
	str r0, [r5]
_08077B16:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end ma21_08074164

	thumb_func_start sub_807775C
sub_807775C: @ 8077B1C
	push {r4,lr}
	ldr r4, _08077B4C
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077B50
	ldr r2, [r4]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	adds r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	adds r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	adds r1, r0
	str r1, [r4]
	b _08077B56
	.align 2, 0
_08077B4C: .4byte gUnknown_0202F7A4
_08077B50:
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
_08077B56:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807775C

	thumb_func_start sub_807779C
sub_807779C: @ 8077B5C
	push {r4,lr}
	ldr r0, _08077B70
	ldr r1, [r0]
	ldrb r2, [r1, 0x1]
	adds r1, 0x2
	str r1, [r0]
	cmp r2, 0
	beq _08077B78
	ldr r0, _08077B74
	b _08077B7A
	.align 2, 0
_08077B70: .4byte gUnknown_0202F7A4
_08077B74: .4byte gUnknown_0202F7C9
_08077B78:
	ldr r0, _08077BBC
_08077B7A:
	ldrb r0, [r0]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077BB4
	cmp r4, 0
	beq _08077B96
	cmp r4, 0x3
	bne _08077BB4
_08077B96:
	ldr r3, _08077BC0
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077BC4
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_08077BB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077BBC: .4byte gUnknown_0202F7C8
_08077BC0: .4byte 0x0400000a
_08077BC4: .4byte 0x0400000c
	thumb_func_end sub_807779C

	thumb_func_start sub_8077808
sub_8077808: @ 8077BC8
	push {lr}
	ldr r0, _08077C00
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077BFA
	ldr r3, _08077C04
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077C08
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_08077BFA:
	pop {r0}
	bx r0
	.align 2, 0
_08077C00: .4byte gUnknown_0202F7A4
_08077C04: .4byte 0x0400000a
_08077C08: .4byte 0x0400000c
	thumb_func_end sub_8077808

	thumb_func_start sub_807784C
sub_807784C: @ 8077C0C
	push {r4-r7,lr}
	ldr r1, _08077C3C
	ldr r0, [r1]
	ldrb r6, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	ldr r7, _08077C40
	ldrb r0, [r7]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077C44
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08077C82
	cmp r6, 0
	beq _08077C48
	ldrb r0, [r5]
	b _08077C4A
	.align 2, 0
_08077C3C: .4byte gUnknown_0202F7A4
_08077C40: .4byte gUnknown_0202F7C8
_08077C44: .4byte gUnknown_0202F7C9
_08077C48:
	ldrb r0, [r7]
_08077C4A:
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077C82
	cmp r4, 0
	beq _08077C64
	cmp r4, 0x3
	bne _08077C82
_08077C64:
	ldr r3, _08077C88
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r3]
	ldr r2, _08077C8C
	ldrb r0, [r2]
	ands r1, r0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
_08077C82:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C88: .4byte 0x0400000a
_08077C8C: .4byte 0x0400000c
	thumb_func_end sub_807784C

	thumb_func_start ma2B_make_side_invisible
ma2B_make_side_invisible: @ 8077C90
	push {r4,lr}
	ldr r4, _08077CC4
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077CB8
	ldr r1, _08077CC8
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_08077CB8:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077CC4: .4byte gUnknown_0202F7A4
_08077CC8: .4byte gSprites
	thumb_func_end ma2B_make_side_invisible

	thumb_func_start ma2C_make_side_visible
ma2C_make_side_visible: @ 8077CCC
	push {r4,lr}
	ldr r4, _08077D04
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077CF6
	ldr r1, _08077D08
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08077CF6:
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077D04: .4byte gUnknown_0202F7A4
_08077D08: .4byte gSprites
	thumb_func_end ma2C_make_side_visible

	thumb_func_start sub_807794C
sub_807794C: @ 8077D0C
	push {r4-r7,lr}
	ldr r1, _08077D58
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077DB6
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08077DB6
	ldr r6, _08077D5C
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077D60
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08077DB6
	cmp r7, 0
	bne _08077D64
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _08077D70
	.align 2, 0
_08077D58: .4byte gUnknown_0202F7A4
_08077D5C: .4byte gUnknown_0202F7C8
_08077D60: .4byte gUnknown_0202F7C9
_08077D64:
	ldrb r0, [r5]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_08077D70:
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077DB6
	ldr r1, _08077DAC
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	cmp r4, 0x2
	bne _08077DA0
	ldrb r0, [r2, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r2, 0x5]
_08077DA0:
	cmp r4, 0x1
	bne _08077DB0
	movs r0, 0
	bl sub_8076464
	b _08077DB6
	.align 2, 0
_08077DAC: .4byte gSprites
_08077DB0:
	movs r0, 0x1
	bl sub_8076464
_08077DB6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807794C

	thumb_func_start sub_80779FC
sub_80779FC: @ 8077DBC
	push {r4-r7,lr}
	ldr r1, _08077E08
	ldr r0, [r1]
	ldrb r7, [r0, 0x1]
	adds r0, 0x2
	str r0, [r1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077E48
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08077E48
	ldr r6, _08077E0C
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _08077E10
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08077E48
	cmp r7, 0
	bne _08077E14
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	b _08077E20
	.align 2, 0
_08077E08: .4byte gUnknown_0202F7A4
_08077E0C: .4byte gUnknown_0202F7C8
_08077E10: .4byte gUnknown_0202F7C9
_08077E14:
	ldrb r0, [r5]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
_08077E20:
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _08077E48
	cmp r4, 0x2
	bne _08077E48
	ldr r1, _08077E50
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
_08077E48:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077E50: .4byte gSprites
	thumb_func_end sub_80779FC

	thumb_func_start ma2F_stop_music
ma2F_stop_music: @ 8077E54
	push {lr}
	ldr r0, _08077E70
	bl m4aMPlayStop
	ldr r0, _08077E74
	bl m4aMPlayStop
	ldr r1, _08077E78
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08077E70: .4byte gMPlay_SE1
_08077E74: .4byte gMPlay_SE2
_08077E78: .4byte gUnknown_0202F7A4
	thumb_func_end ma2F_stop_music

	.align 2, 0 @ Don't pad with nop.
